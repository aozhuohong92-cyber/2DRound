SignPanel = class("SignPanel", function ()
	return ccui.Widget:create()
end)

function SignPanel.ctor(slot0)
	slot0.ctrl = WelfareController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:configUI()
	slot0:register_event()
end

function SignPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/sign_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setPosition(-40, -40)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.title_img = slot0.title_con:getChildByName("title_img")
	slot0.tips_btn = slot0.title_con:getChildByName("tips_btn")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getWelfareBannerRes("txt_cn_welfare_banner2"), ResourcesType.single, function ()
			if not tolua.isnull(uv0.title_img) then
				loadSpriteTexture(uv0.title_img, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot0.empty_tips = slot0.goods_con:getChildByName("empty_tips")

	slot0.empty_tips:setVisible(false)

	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.goods_con, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.goods_con:getContentSize(), {
		start_y = 21,
		item_width = 107,
		start_x = 25,
		space_x = 28,
		row = 0,
		item_height = 107,
		space_y = 30,
		col = 5,
		item_class = SignItem
	})

	if GuideController:getInstance():isInGuide() then
		slot0.item_scrollview:setClickEnabled(false)
	end

	slot0.sign_btn = slot0.main_container:getChildByName("sign_btn")

	slot0.ctrl:sender14100()
end

function SignPanel.createList(slot0, slot1)
	slot6 = slot1.day
	slot7 = 0

	for slot11, slot12 in pairs(deepCopy(Config.CheckinData.data_award[tonumber(os.date("%m", GameNet:getInstance():getTime()))])) do
		if slot1.status > 0 then
			if slot11 < slot6 then
				slot12.status = 2
			elseif slot11 == slot6 then
				slot12.status = slot1.status
			else
				slot12.status = 0
			end

			slot12.now_day = slot6
			slot7 = slot6
		elseif slot1.status == 0 then
			if slot11 <= slot6 then
				slot12.status = 2
			elseif slot11 == slot6 + 1 then
				slot12.status = slot1.status
			else
				slot12.status = 0
			end

			slot12.now_day = slot6 + 1
			slot7 = slot6 + 1
		end
	end

	slot0.item_scrollview:setData(slot5, function (slot0)
		if slot0:getData().status == 1 and slot1.now_day == slot1.day and uv0.model:getRechargeCount() == 0 then
			CommonAlert.show(TI18N("当天充值<div fontcolor=289b14>任意金额</div>可<div fontcolor=289b14>额外</div>获得一次奖励\n　　　　　（单笔1元以上）"), TI18N("确认"), function ()
				VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		elseif slot1.now_day < slot1.day then
			message(TI18N("未达到签到天数"))
		else
			uv0.ctrl:sender14101()
		end
	end)
	slot0.item_scrollview:addEndCallBack(function ()
		slot1 = nil

		for slot5, slot6 in pairs(uv0.item_scrollview:getItemList()) do
			if slot6:getData().day == 26 then
				slot1 = slot6:getItemPosition()
			end
		end

		if uv1 >= 25 then
			uv0.item_scrollview:jumpToMove(cc.p(slot1.x, slot1.y + uv0.item_scrollview:getContentSize().height / 2), 0.1)
		end
	end)
end

function SignPanel.register_event(slot0)
	if slot0.update_sign_info == nil then
		slot0.update_sign_info = GlobalEvent:getInstance():Bind(WelfareEvent.Update_Sign_Info, function (slot0)
			uv0:createList(slot0)
		end)
	end

	if slot0.sign_success == nil then
		slot0.sign_success = GlobalEvent:getInstance():Bind(WelfareEvent.Sign_Success, function (slot0)
			uv0:createList(slot0)
		end)
	end

	slot0.tips_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			TipsManager:getInstance():showCommonTips(Config.CheckinData.data_const.checkin_rules.desc, slot0:getTouchBeganPosition())
		end
	end)

	if slot0.update_guide_status == nil then
		slot0.update_guide_status = GlobalEvent:getInstance():Bind(GuideEvent.Update_Guide_Status_Event, function (slot0)
			if slot0 then
				uv0.item_scrollview:setClickEnabled(false)
			else
				uv0.item_scrollview:setClickEnabled(true)
			end
		end)
	end
end

function SignPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function SignPanel.DeleteMe(slot0)
	if slot0.update_sign_info ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_sign_info)

		slot0.update_sign_info = nil
	end

	if slot0.sign_success ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.sign_success)

		slot0.sign_success = nil
	end

	if slot0.update_guide_status ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_guide_status)

		slot0.update_guide_status = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil
end

SignItem = class("SignItem", function ()
	return ccui.Widget:create()
end)

function SignItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function SignItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/sign_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(107, 107))
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setSwallowTouches(false)

	slot0.get = slot0.main_container:getChildByName("get")

	slot0.get:setLocalZOrder(20)
	slot0.get:setVisible(false)

	slot0.get2 = slot0.main_container:getChildByName("get2")
	slot0.img = slot0.get2:getChildByName("img")

	slot0.get2:setLocalZOrder(20)
	slot0.get2:setVisible(false)
	doStopAllActions(slot0.img)

	slot0.goods_item = BackPackItem.new(true, true)

	slot0.goods_item:setScale(0.9)
	slot0.goods_item:setAnchorPoint(0.5, 0.5)
	slot0.goods_item:setPosition(slot0:getContentSize().width / 2, slot0:getContentSize().height / 2)
	slot0.goods_item:setTouchEnabled(false)
	slot0.goods_item:setSwallowTouches(false)
	slot0.main_container:addChild(slot0.goods_item)
end

function SignItem.register_event(slot0)
	slot0.main_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.callback then
					uv0:callback()
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
end

function SignItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.data = slot1

	if slot1._index then
		slot0.main_container:setName("sign_btn_" .. slot1._index)
	end

	slot2 = {}
	slot2 = deepCopy(Config.ItemData.data_get_data(slot1.rewards[1][1]))
	slot2.quantity = slot1.rewards[1][2]

	slot0.goods_item:setData(slot2)

	if slot1.status then
		if slot1.status == 0 then
			if slot1.now_day == slot1.day then
				if slot0.effect == nil then
					slot0.effect = createEffectSpine(PathTool.getEffectRes(262), cc.p(slot0.main_container:getContentSize().width / 2, slot0.main_container:getContentSize().height / 2), cc.p(0.5, 0.5), true, "action")

					slot0.effect:setScale(1)
					slot0.main_container:addChild(slot0.effect)
				end

				slot0.effect:setVisible(true)
			elseif slot0.effect then
				slot0.effect:setVisible(false)
			end

			slot0.main_container:setTouchEnabled(true)
			slot0.get2:setVisible(false)
			doStopAllActions(slot0.img)
			slot0.get:setVisible(false)
		elseif slot1.status == 1 then
			if slot0.effect then
				slot0.effect:setVisible(false)
			end

			slot0.get2:setVisible(true)
			slot0.get:setVisible(false)
			slot0.main_container:setTouchEnabled(true)
		elseif slot1.status == 2 then
			if slot0.effect then
				slot0.effect:setVisible(false)
			end

			doStopAllActions(slot0.img)
			slot0.get2:setVisible(false)
			slot0.get:setVisible(true)
			slot0.main_container:setTouchEnabled(false)
		end
	end

	if slot1.is_show then
		if slot1.is_show == 1 then
			slot0.goods_item:showItemEffect(true, 263, PlayerAction.action_2, true, 1.1)
		else
			slot0.goods_item:showItemEffect(false)
		end
	end
end

function SignItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function SignItem.getData(slot0)
	return slot0.data
end

function SignItem.getItemPosition(slot0)
	if slot0 then
		return cc.p(slot0:getPosition())
	end
end

function SignItem.DeleteMe(slot0)
	doStopAllActions(slot0.img)

	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
