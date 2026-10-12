ActionSevenChargePanel = class("ActionSevenChargePanel", function ()
	return ccui.Widget:create()
end)
slot1 = ActionController:getInstance():getModel()
slot2 = table.remove
slot3 = table.insert
slot4 = string.format
slot5 = 7

function ActionSevenChargePanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:configUI()
	slot0:register_event()

	slot0.cur_day = 0
	slot0.is_init = true
	slot0.cur_item_index = 1
end

function ActionSevenChargePanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_seven_charge_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setPosition(-40, -80)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.image_bg = slot0.main_container:getChildByName("image_bg")
	slot1 = ""

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot2.reward_title ~= "" and slot2.reward_title then
		slot1 = slot2.reward_title
	end

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/action", slot1), ResourcesType.single, function ()
			if not tolua.isnull(uv0.image_bg) then
				uv0.image_bg:loadTexture(uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.btn_tips = slot0.main_container:getChildByName("btn_tips")
	slot0.img_progress_bg = slot0.main_container:getChildByName("img_progress_bg")

	slot0.img_progress_bg:getChildByName("txt_progres"):setString(TI18N("今日进度"))

	slot0.bar_bg = slot0.main_container:getChildByName("bar_bg")
	slot0.bar_progress = slot0.bar_bg:getChildByName("bar_progress")

	slot0.bar_progress:setScale9Enabled(true)
	slot0.bar_progress:setPercent(0)
	slot0.bar_progress:setPositionX(slot0.bar_progress:getPositionX() - 0.5)

	slot0.bar_num = slot0.bar_bg:getChildByName("bar_num")

	slot0.bar_num:setString("")

	slot0.txt_time_title = slot0.main_container:getChildByName("txt_time_title")

	slot0.txt_time_title:setString(TI18N("剩余时间："))

	slot0.txt_time_value = slot0.main_container:getChildByName("txt_time_value")

	slot0.txt_time_value:setString("")

	slot0.btn_charge = slot0.main_container:getChildByName("btn_charge")
	slot0.txt_charge = slot0.btn_charge:getChildByName("label")

	slot0.txt_charge:setString(TI18N("前往充值"))
	UITool.SetTitleColor(slot0.txt_charge)

	slot0.btn_get_reward = slot0.main_container:getChildByName("btn_get_reward")

	slot0.btn_get_reward:getChildByName("label"):setString(TI18N("领取奖励"))
	slot0.btn_get_reward:setVisible(false)

	slot4 = slot0.main_container:getChildByName("total_reward_list")
	slot0.total_reward_scrollview = CommonScrollViewLayout.new(slot4, cc.p(10, -15), ScrollViewDir.vertical, ScrollViewStartPos.top, slot4:getContentSize(), {
		start_y = 5,
		item_width = 137,
		start_x = 0,
		space_x = 20,
		row = 2,
		item_height = 150,
		space_y = 20,
		col = 3,
		need_dynamic = true,
		item_class = ActionSevenChargeItem
	})

	slot0.total_reward_scrollview:setSwallowTouches(false)
	slot0.total_reward_scrollview:setClickEnabled(false)

	slot0.cur_reward_scrollview = slot0.main_container:getChildByName("cur_reward_list")

	slot0.cur_reward_scrollview:setScrollBarEnabled(false)
	uv0:sender16666(slot0.holiday_bid)
	uv0:cs16603(slot0.holiday_bid)
end

function ActionSevenChargePanel.register_event(slot0)
	if not slot0.update_holiday_common_event then
		slot0.update_holiday_common_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if not slot0 then
				return
			end

			if slot0.bid == uv0.holiday_bid then
				uv0:setPanelData(slot0)
			end
		end)
	end

	registerButtonEventListener(slot0.btn_tips, function (slot0, slot1, slot2)
		slot3 = nil

		if uv0.holiday_bid == ActionRankCommonType.seven_charge then
			slot3 = Config.HolidayClientData.data_constant.seven_charge_rules
		end

		TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, , 500)
	end, true, 1)
	registerButtonEventListener(slot0.btn_charge, function ()
		if uv0:getSevenChargeDataByDay(uv1.cur_item_index) then
			if slot0.status == 3 then
				if slot0.re_signin_charge > 0 or uv0:getIsGetResignin() then
					CommonAlert.show(uv2(TI18N("今天再充值%d元,即可领取补签奖励"), slot0.re_signin_charge), TI18N("确定"), function ()
						VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
					end, TI18N("取消"), nil, CommonAlert.type.rich)
				end
			else
				VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
			end
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_get_reward, function ()
		if uv0.holiday_bid and uv0.cur_item_index then
			uv1:cs16604(uv0.holiday_bid, uv0.cur_item_index, 0)
		end
	end, true, 1)
end

function ActionSevenChargePanel.setPanelData(slot0, slot1)
	if not slot1 then
		return
	end

	commonCountDownTime(slot0.txt_time_value, slot1.remain_sec or 0)
	slot0.txt_time_title:setPositionX(slot0.txt_time_value:getPositionX() - slot0.txt_time_value:getContentSize().width + 5)

	slot0.cur_day = uv0:getCurChargeDay()
	slot4 = uv0:getSevenChargeDataByDay(slot0.cur_day)

	slot0.bar_num:setString(uv1(TI18N("%d/%d元"), slot1.finish, slot4.need_charge))
	slot0.bar_progress:setPercent(100 * slot1.finish / slot4.need_charge)

	if uv0:getSevenChargeData() then
		slot6 = deepCopy(slot5)

		uv2(slot6, #slot6)

		if slot0.total_reward_scrollview then
			slot0.total_reward_scrollview:setData(slot6, function (slot0)
				uv0.cur_item_index = slot0.aim

				if slot0 and slot0.aim then
					uv0:updateCurRewardList(slot0.aim)
				end

				uv0:updateBottemBtn(slot0)
			end, nil, {
				cur_day = slot0.cur_day
			})
		end
	end

	slot0:updateSevenItem(uv0:getSevenChargeDataByDay(uv3))

	slot7 = {}

	for slot12, slot13 in pairs(uv0:getSevenChargeData()) do
		if slot13.status == 1 then
			uv4(slot7, slot13)
		end
	end

	slot9 = 0

	if #slot7 > 0 then
		for slot13, slot14 in pairs(slot7) do
			slot15 = slot14.aim
			slot0.cur_item_index = slot15

			slot0:updateBottemBtn(uv0:getSevenChargeDataByDay(slot15))
			slot0:updateCurRewardList(slot15)

			return
		end
	else
		slot0:updateBottemBtn(slot4)
		slot0:updateCurRewardList()
	end
end

function ActionSevenChargePanel.updateSevenItem(slot0, slot1)
	if slot1.aim == uv0 then
		if not slot0.seven_item then
			slot0.seven_item = BackPackItem.new(true, true, false, 1)

			slot0.main_container:addChild(slot0.seven_item)
			slot0.seven_item:setBaseData(slot1.item_bid, slot1.item_num)
			slot0.seven_item:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.seven_item:setPosition(cc.p(585, 443))
			slot0.seven_item:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveBy:create(1, cc.p(0, 8)), cc.MoveBy:create(1, cc.p(0, -8)))))
		end

		if slot0.cur_day == slot1.aim then
			slot0.img_arrow = createImage(slot0.seven_item, PathTool.getResFrame("actionsevencharge", "actionsevencharge_5"), slot0.seven_item:getContentSize().width / 2, 130, cc.p(0.5, 0), true, 1, false)
		end

		slot0.seven_item:addCallBack(function ()
			uv0:updateCurRewardList(uv1)
			uv0:updateBottemBtn(uv2)

			if uv2.status == 1 and uv0.holiday_bid then
				uv3:cs16604(uv0.holiday_bid, uv2.aim, 0)
			end
		end)

		if slot0.is_init and slot0.seven_item then
			slot0.is_init = false
			slot2 = slot0.seven_item:getContentSize()
			slot0.item_effect = createEffectSpine(PathTool.getEffectRes(535), cc.p(slot2.width / 2 + 10, slot2.height / 2 - 35), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.seven_item:addChild(slot0.item_effect)
			slot0.item_effect:setScale(0.9)

			slot0.has_get = createImage(slot0.seven_item, PathTool.getResFrame("actionsevencharge", "actionsevencharge_2"), slot2.width / 2, slot2.height / 2, cc.p(0.5, 0.5), true, 1)
			slot0.re_signin = createImage(slot0.seven_item, PathTool.getResFrame("actionsevencharge", "actionsevencharge_1"), slot2.width / 2, slot2.height / 2, cc.p(0.5, 0.5), true, 1)
			slot0.price_bg = createScale9Sprite(PathTool.getResFrame("actionsevencharge", "actionsevencharge_3"), 587, 271, LOADTEXT_TYPE_PLIST, slot0.main_container)

			slot0.price_bg:setAnchorPoint(cc.p(0.5, 0))
			slot0.price_bg:setContentSize(cc.size(135, 39))
			slot0.price_bg:setCapInsets(cc.rect(12, 18, 3, 3))

			slot3 = uv2(TI18N("第%d天%d元"), slot1.aim, slot1.need_charge)
			slot0.txt_price_desc = createLabel(20, cc.c3b(253, 204, 127), nil, 587, 290, slot3, slot0.main_container, nil, cc.p(0.5, 0.5))

			slot0.txt_price_desc:setString(slot3)
		end

		slot0.item_effect:setVisible(slot1.status == 1)
		slot0.has_get:setVisible(slot1.status == 2)
		slot0.re_signin:setVisible(slot1.status == 3)

		if slot1.status == 2 then
			slot0.seven_item:setItemIconUnEnabled(true)
		end
	end
end

function ActionSevenChargePanel.updateCurRewardList(slot0, slot1)
	if uv0:getDailyRewardListById(slot1 or slot0.cur_day) then
		slot4 = {}

		for slot8, slot9 in ipairs(slot3) do
			uv1(slot4, {
				slot9.bid,
				slot9.num
			})
		end

		if #slot4 > 0 then
			slot0.item_list = commonShowSingleRowItemList(slot0.cur_reward_scrollview, slot0.item_list, slot4, {
				scale = 0.8,
				start_x = 0,
				space_x = 30,
				max_count = 5,
				is_center = true
			})
		end
	end
end

function ActionSevenChargePanel.updateBottemBtn(slot0, slot1)
	if slot1.status == 0 then
		if slot1.aim == slot0.cur_day then
			slot0:updateBtnStatus(false, TI18N("前往充值"))
		else
			slot0:updateBtnStatus(false, TI18N("未达成"), true)
		end
	elseif slot1.status == 1 then
		slot0:updateBtnStatus(true)
	elseif slot1.status == 2 then
		slot0:updateBtnStatus(false, TI18N("已领取"), true)
	elseif slot1.status == 3 and slot1.re_signin_charge then
		if slot1.re_signin_charge <= 0 and not uv0:getIsGetResignin() then
			slot0:updateBtnStatus(true)
		else
			slot0:updateBtnStatus(false, TI18N("前往充值"))
		end
	end
end

function ActionSevenChargePanel.updateBtnStatus(slot0, slot1, slot2, slot3)
	slot0.btn_get_reward:setVisible(slot1)
	slot0.btn_charge:setVisible(not slot1)
	slot0.txt_charge:setString(slot2)

	if slot3 then
		slot0.btn_charge:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.btn_charge)
		slot0.txt_charge:enableOutline(Config.ColorData.data_color4[84], 2)
	else
		slot0.btn_charge:setTouchEnabled(true)
		setChildUnEnabled(false, slot0.btn_charge)
		slot0.txt_charge:enableOutline(Config.ColorData.data_color4[264], 2)
	end
end

function ActionSevenChargePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionSevenChargePanel.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	doStopAllActions(slot0.txt_time_value)

	if slot0.total_reward_scrollview then
		slot0.total_reward_scrollview:DeleteMe()
	end

	slot0.total_reward_scrollview = nil

	if slot0.update_holiday_common_event then
		GlobalEvent:getInstance():UnBind(slot0.update_holiday_common_event)

		slot0.update_holiday_common_event = nil
	end

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	doStopAllActions(slot0.cur_reward_scrollview)
end

ActionSevenChargeItem = class("ActionSevenChargeItem", function ()
	return ccui.Widget:create()
end)

function ActionSevenChargeItem.ctor(slot0)
	slot0:configUI()
end

function ActionSevenChargeItem.configUI(slot0)
	slot0.size = cc.size(137, 150)

	slot0:setTouchEnabled(true)
	slot0:setAnchorPoint(cc.p(0, 0))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(slot0.size)
	slot0:addChild(slot0.root_wnd)

	slot0.reward_item = BackPackItem.new(true, true, false, 0.9)

	slot0.reward_item:addCallBack(function ()
		uv0:selectItem()
	end)
	slot0.reward_item:setAnchorPoint(cc.p(0.5, 1))
	slot0.reward_item:setPosition(cc.p(slot0.size.width / 2, slot0.size.height))
	slot0.root_wnd:addChild(slot0.reward_item)

	slot1 = slot0.reward_item:getContentSize()
	slot2 = createImage(slot0.reward_item, PathTool.getResFrame("actionsevencharge", "actionsevencharge_1"), slot1.width / 2, slot1.height / 2, cc.p(0.5, 0.5), true, 1)

	slot2:setVisible(false)

	slot0.reward_item.re_signin = slot2
	slot3 = createImage(slot0.reward_item, PathTool.getResFrame("actionsevencharge", "actionsevencharge_2"), slot1.width / 2, slot1.height / 2, cc.p(0.5, 0.5), true, 2)

	slot3:setVisible(false)

	slot0.reward_item.has_get = slot3
	slot0.price_bg = createScale9Sprite(PathTool.getResFrame("actionsevencharge", "actionsevencharge_3"), slot0.size.width / 2, 0, LOADTEXT_TYPE_PLIST, slot0.root_wnd)

	slot0.price_bg:setAnchorPoint(cc.p(0.5, 0))
	slot0.price_bg:setContentSize(cc.size(135, 39))
	slot0.price_bg:setCapInsets(cc.rect(12, 18, 3, 3))

	slot0.txt_price_desc = createLabel(20, cc.c3b(253, 204, 127), nil, slot0.size.width / 2, 20, "", slot0.root_wnd, nil, cc.p(0.5, 0.5))
end

function ActionSevenChargeItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function ActionSevenChargeItem.setExtendData(slot0, slot1)
	slot0.cur_day = slot1.cur_day
end

function ActionSevenChargeItem.setData(slot0, slot1)
	slot0.data = slot1
	slot0.is_get_resignin = uv0:getIsGetResignin()

	if slot1.item_bid and slot1.item_num then
		slot0.reward_item:setBaseData(slot1.item_bid, slot1.item_num, true)
	end

	if slot1.aim and slot1.need_charge then
		slot0.txt_price_desc:setString(uv1(TI18N("第%d天%d元"), slot1.aim, slot1.need_charge))
	end

	if slot1.status then
		if slot1.aim == slot0.cur_day and slot1.status ~= 2 then
			slot0:showEffect(slot1.item_bid, true)
		end

		if slot1.status == 1 then
			slot0:showEffect(slot1.item_bid)
			slot0.reward_item.re_signin:setVisible(false)
		elseif slot1.status == 2 then
			slot0.reward_item:setItemIconUnEnabled(true)
			slot0.reward_item.has_get:setVisible(true)
		elseif slot1.status == 3 and slot1.re_signin_charge then
			slot0.reward_item.re_signin:setVisible(true)

			if slot1.re_signin_charge <= 0 and not slot0.is_get_resignin then
				slot0:showEffect(slot1.item_bid)
				slot0.reward_item.re_signin:setVisible(false)
			end
		end
	end
end

function ActionSevenChargeItem.showEffect(slot0, slot1, slot2)
	if slot2 or false then
		slot0.reward_item:showItemEffect(true, 262, PlayerAction.action, true, 1.1)
	elseif Config.ItemData.data_get_data(slot1) and slot4.quality >= 4 then
		slot0.reward_item:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
	else
		slot0.reward_item:showItemEffect(true, 263, PlayerAction.action_2, true, 1.1)
	end
end

function ActionSevenChargeItem.selectItem(slot0)
	if not slot0.data then
		message(TI18N("无奖励信息"))

		return
	end

	if slot0.call_back and slot0.data then
		slot0.call_back(slot0.data)
	end
end

function ActionSevenChargeItem.DeleteMe(slot0)
	if slot0.reward_item then
		slot0.reward_item:DeleteMe()

		slot0.reward_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
