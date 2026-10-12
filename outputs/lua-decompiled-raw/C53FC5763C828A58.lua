EmoguoshiZhanLingView = EmoguoshiZhanLingView or BaseClass(BaseView)
slot0 = EmoguoshiController:getInstance()
slot1 = 1
slot2 = 2

function EmoguoshiZhanLingView.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.layout_name = "emoguoshitujian/emoguoshi_zhanling_panel"
	slot0.res_list = {}
	slot0.is_have_buy = true
end

function EmoguoshiZhanLingView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("bg")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")

	slot0.main_panel:setTouchEnabled(true)

	slot0.label_title = slot0.main_panel:getChildByName("title")
	slot0.label_level = slot0.main_panel:getChildByName("cengshu_label")
	slot0.label_left_time = slot0.main_panel:getChildByName("time")

	slot0.label_title:setString(TI18N("活跃度") .. "(0)")

	slot0.btn_unlock = slot0.main_panel:getChildByName("btn_1")
	slot0.btn_unlock_charge = slot0.main_panel:getChildByName("btn_2")
	slot0.btn_brief = slot0.main_panel:getChildByName("rule")
	slot1 = slot0.main_panel:getChildByName("goods_con")
	slot3 = cc.size()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		item_width = 667,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 145,
		space_y = 10,
		col = 1,
		item_class = EmoguoshiZhanLingItem
	})
end

function EmoguoshiZhanLingView.addColor(slot0, slot1, slot2)
	return string.format(TI18N("<div fontColor=%s outline=2,#000000>%s</div>"), slot2, slot1)
end

function EmoguoshiZhanLingView.register_event(slot0)
	slot0.background:setTouchEnabled(true)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEmoguoZhanLingView(false)
		end
	end)
	slot0.btn_brief:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_brief, function ()
		MainuiController:getInstance():openCommonExplainView(true, {
			{
				title = "基础规则",
				desc = Config.EmoguoshitujianData.data_const.emo_zhanling_rule.desc
			}
		})
	end, true)
	slot0.btn_unlock:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_unlock, function ()
		print("self.btn_unlock===")

		if uv0:isZhanLingUnlock() then
			message(TI18N("已经解锁"))

			return
		end

		slot1 = uv0:getZhanLingUnlockItem(uv0:getZhanLingNowRunId())
		slot2 = slot1[1][1]
		slot3 = slot1[1][2]
		slot5 = BackpackController:getInstance():getModel():getItemNumByBid(slot2)

		if Config.ItemData.data_get_data(slot2) then
			slot12 = slot4.icon

			for slot11, slot12 in pairs({
				TI18N("是否使用"),
				string.format("<img src=%s visible=true scale=0.4 />", PathTool.getItemRes(slot12)),
				string.format("<div fontColor=#289b14 fontsize= 26>%d</div>", slot3),
				TI18N("(拥有:"),
				string.format("<div fontColor=#289b14 fontsize= 26>%d</div>", slot5),
				TI18N(")\n解锁基础奖励？")
			}) do
				slot7 = "" .. slot12
			end

			CommonAlert.show(slot7, TI18N("确定"), function ()
				uv0:reqZhanLingUnlock()
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		end
	end, true)
	slot0.btn_unlock_charge:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_unlock_charge, function ()
		print("self.btn_unlock_charge===")

		if uv0:isZhanLingCharge() then
			message(TI18N("已经购买了"))

			return
		end

		if not uv0:isZhanLingUnlock() then
			message(TI18N("先解锁基础奖励"))

			return
		end

		if not uv1.charge_id then
			return
		end

		if Config.ChargeData.data_charge_data[uv1.charge_id] then
			MallController:getInstance():openMallHhbWindow(true, slot0.id)
		end
	end, true)
	slot0:addGlobalEvent(EmoguoshiEvent.ZHANLING_ALL_INFO, function ()
		uv0:updateInfo()
	end)
end

function EmoguoshiZhanLingView.updateInfo(slot0, ...)
	for slot5, slot6 in pairs(slot0.item_scrollview:getItemList()) do
		slot6:updateInfo()
	end

	slot0:updateBuyState()
	slot0:updateHuoYueDu()
end

function EmoguoshiZhanLingView.updateHuoYueDu(slot0, ...)
	slot0.label_title:setString(TI18N("活跃度") .. "(" .. uv0:getZhanLingHuoYueDu() .. ")")
	slot0.label_level:setString(string.format(TI18N("层数： 第%d层"), uv0:getZhanLingNowRunId()))

	if uv0:getZhanLingEndTime() - GameNet:getInstance():getTime() <= 0 then
		return
	end

	slot5 = 86400

	slot0.label_left_time:stopAllActions()

	function slot7(slot0)
		slot1, slot2, slot3, slot4 = uv0(slot0)

		uv1.label_left_time:setString(string.format("%02d:%02d:%02d", slot2, slot3, slot4))
	end

	slot8, slot9, slot10, slot11 = function (slot0)
		return math.floor(slot0 / uv0), math.floor(slot0 % uv0 / 3600), math.floor(slot0 % 3600 / 60), slot0 % 60
	end(slot4)

	if slot8 > 0 then
		slot0.label_left_time:setString(string.format(TI18N("%d天%d小时"), slot8, slot9))
	else
		slot7(slot4)
		slot0.label_left_time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			uv1(uv0)
		end))))
	end
end

function EmoguoshiZhanLingView.updateBuyState(slot0, ...)
	if not slot0.charge_id then
		return
	end
end

function EmoguoshiZhanLingView.openRootWnd(slot0)
	if not deepCopy(Config.EmoguoshitujianData.data_get_zhanling_data[uv0:getZhanLingNowRunId()]) then
		return
	end

	slot3 = {}

	for slot7, slot8 in ipairs(slot2) do
		table.insert(slot3, {
			slot7,
			slot8
		})
	end

	slot0.item_scrollview:setData(slot3)

	slot0.charge_id = uv0:getZhanLingChargeId(slot1)

	slot0:updateBuyState()
	slot0:updateHuoYueDu()
end

function EmoguoshiZhanLingView.close_callback(slot0)
	uv0:openEmoguoZhanLingView(false)
end

EmoguoshiZhanLingItem = class("EmoguoshiZhanLingItem", function ()
	return ccui.Layout:create()
end)

function EmoguoshiZhanLingItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function EmoguoshiZhanLingItem.configUI(slot0)
	slot1 = createCSBNote(PathTool.getTargetCSB("emoguoshitujian/emoguoshi_zhanling_item"))
	slot0.size = slot1:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot1:setAnchorPoint(cc.p(0, 0))
	slot0:addChild(slot1)
	slot1:setPosition(0, 0)

	slot0.item_bg_list1 = {}
	slot0.item_bg_list2 = {}
	slot2 = slot1:getChildByName("item")
	slot0.item_bg_list1[1] = slot2:getChildByName("goods_item1")
	slot0.item_bg_list2[1] = slot2:getChildByName("goods_item2")
	slot6 = slot2
	slot7 = "goods_item3"
	slot0.item_bg_list2[2] = slot2.getChildByName(slot6, slot7)

	for slot6, slot7 in pairs(slot0.item_bg_list1) do
		slot7:setTouchEnabled(false)
	end

	for slot6, slot7 in pairs(slot0.item_bg_list2) do
		slot7:setTouchEnabled(false)
	end

	slot0.label_value = slot2:getChildByName("Image_4"):getChildByName("Text_1")
	slot0.bar = slot2:getChildByName("LoadingBar")
	slot0.bar_bg = slot2:getChildByName("LoadingBar_bg")
	slot0.bar_light = slot2:getChildByName("Image_3")
	slot0.bar_light_bg = slot2:getChildByName("Image_2")
	slot0.label_level = slot2:getChildByName("Image_4"):getChildByName("Text_1")
	slot0.img_title_bg = slot2:getChildByName("Image_4")
end

function EmoguoshiZhanLingItem.register_event(slot0)
end

function EmoguoshiZhanLingItem.setItem(slot0, slot1, slot2, slot3)
	for slot7, slot8 in pairs(slot2) do
		if not slot1[slot7] then
			return
		end

		slot10 = BackPackItem.new(nil, true, nil, 0.8, nil, true)

		slot9:addChild(slot10)

		slot9.item = slot10
		slot11 = slot9:getContentSize()

		slot10:setPosition(slot11.width / 2, slot11.height / 2)
		slot10:setBaseData(slot8[1], slot8[2])
		table.insert(slot1, slot10)
		slot10:showOrderWarLock(true, cc.p(59.5, 59.5))
		slot10:IsGetStatus(true, nil, PathTool.getResFrame("common", "common_1000"))
		slot10:setDefaultTip(false)
		slot10:addLongTimeTouchCallback(function ()
			TipsManager:getInstance():showGoodsTips(Config.ItemData.data_get_data(uv0[1]))
		end)
	end
end

function EmoguoshiZhanLingItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.data = slot1
	slot0.index = slot1[1]
	slot0.prop = slot1[2]

	slot0:setLocalZOrder(1000000 - slot1[1])
	slot0:setItem(slot0.item_bg_list1, slot0.prop.items1, uv0)
	slot0:setItem(slot0.item_bg_list2, slot0.prop.items2, uv1)
	slot0:updateInfo()
end

function EmoguoshiZhanLingItem.updateInfo(slot0)
	if not slot0.have_copy then
		slot0.have_copy = true

		function slot1(slot0)
			slot1 = slot0:clone()
			slot2 = uv0:getParent()
			slot3, slot4 = slot0:getPosition()

			slot2:addChild(slot1, 1000000)
			slot1:setPosition(slot2:convertToNodeSpace(slot0:getParent():convertToWorldSpace(cc.p(slot3, slot4))))
			slot0:setVisible(false)

			return slot1
		end

		slot0.bar_light_bg = slot1(slot0.bar_light_bg)
		slot0.bar_light = slot1(slot0.bar_light)
	end

	slot2 = slot0.index
	slot5 = 0
	slot6 = uv0:isZhanLingCharge()
	slot7 = uv0:getZhanLingGetTag(slot2, uv1)
	slot8 = uv0:getZhanLingGetTag(slot2, uv2)
	slot9 = slot0.prop.process <= uv0:getZhanLingHuoYueDu()
	slot10 = false
	slot11 = uv0:isZhanLingUnlock()

	if Config.EmoguoshitujianData.data_get_zhanling_data[slot0.prop.id][slot2 + 1] then
		slot10 = true
		slot5 = slot12.process
	end

	function slot13(slot0, slot1)
		slot2 = slot1 == uv0
		slot3 = false

		if slot1 == uv1 and uv2 > 0 then
			slot3 = true
		end

		if slot1 == uv0 and uv3 > 0 then
			slot3 = true
		end

		slot4 = false

		if not slot3 and uv4 and uv5 then
			if slot1 == uv1 then
				slot4 = true
			end

			if slot1 == uv0 and uv6 then
				slot4 = true
			end
		end

		for slot8, slot9 in ipairs(slot0) do
			if not slot9.item then
				return
			end

			slot10:IsGetStatus(slot3)
			slot10:showOrderWarLock(slot2 and not uv6 or not uv5)

			if slot4 then
				slot10:showStrTips(true, TI18N("可领取"))
				slot10:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
			else
				slot10:showStrTips(false)
				slot10:showItemEffect(false)
			end

			slot10:addCallBack(function (...)
				if uv0 then
					uv1:reqGetZhanLingReward(uv2, uv3)
				elseif uv4 then
					message(TI18N("已领取"))
				else
					if uv5 < uv6 then
						message(TI18N("累计活跃度未达成"))

						return
					end

					if uv7 then
						message(TI18N("解锁豪礼后才能领取"))
					else
						message(TI18N("未达成"))
					end
				end
			end)
		end
	end

	slot13(slot0.item_bg_list1, uv1)
	slot13(slot0.item_bg_list2, uv2)

	slot14 = slot3
	slot15 = slot4
	slot16 = slot5
	slot17 = 100 * (slot14 - slot15) / (slot16 - slot15)

	if slot16 <= slot14 then
		slot17 = 100
	elseif slot17 < 0 then
		slot17 = 0
	elseif slot17 > 100 then
		slot17 = 100
	end

	slot0.label_level:setString(slot15)
	slot0.bar:setPercent(slot17)
	slot0.bar_light:setVisible(slot15 <= slot14)

	if slot15 <= slot14 then
		slot0.img_title_bg:loadTexture(PathTool.getResFrame("emoguoshi", "emoguoshi_21"), LOADTEXT_TYPE_PLIST)
	end

	if not slot10 then
		slot0.bar:setVisible(false)
		slot0.bar_bg:setVisible(false)
	else
		slot0.bar:setVisible(true)
		slot0.bar_bg:setVisible(true)
	end
end

function EmoguoshiZhanLingItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function EmoguoshiZhanLingItem.getData(slot0)
	return slot0.data
end

function EmoguoshiZhanLingItem.getItemPosition(slot0)
	if slot0 then
		return cc.p(slot0:getPosition())
	end
end

function EmoguoshiZhanLingItem.DeleteMe(slot0)
	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
