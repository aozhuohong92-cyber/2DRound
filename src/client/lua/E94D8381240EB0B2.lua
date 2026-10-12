MonthWeekPanel = class("MonthWeekPanel", function ()
	return ccui.Widget:create()
end)
slot1 = WelfareController:getInstance():getModel()
slot2 = table.sort
slot3 = table.insert
slot4 = Config.MiscData.data_cycle_gift_info
slot5 = Config.MiscData.data_cycle_gift_reward

function MonthWeekPanel.ctor(slot0, slot1)
	slot0.holiday_id = slot1

	slot0:configUI()
	slot0:register_event()
end

function MonthWeekPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/week_month_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setPosition(-40, -64)
	slot0:setAnchorPoint(0, 0)

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("title_con")
	slot0.title_con = slot2
	slot0.btn_rule = slot2:getChildByName("btn_rule")

	slot0.btn_rule:setVisible(false)

	slot3 = slot2:getChildByName("sprite_title")
	slot0.shop_btn = slot2:getChildByName("btn_shop")

	slot0.shop_btn:setLocalZOrder(2)

	if slot0.holiday_id == WelfareIcon.week then
		if RoleController:getInstance():getRoleVo().reg_time < Config.MiscData.data_const.hero_store_sign_time.val or slot5.open_day >= 8 then
			slot0.shop_btn:setVisible(true)
			slot0:handleShopffect(true)
		else
			slot0.shop_btn:setVisible(false)
		end
	else
		slot0.shop_btn:setVisible(false)
	end

	slot0.send_holiday_id = 1
	slot4 = "txt_cn_welfare_banner6"

	if slot0.holiday_id == WelfareIcon.week and not slot0.shop_btn:isVisible() then
		slot4 = "txt_cn_welfare_banner116"
	elseif slot0.holiday_id == WelfareIcon.month then
		slot4 = "txt_cn_welfare_banner7"
		slot0.send_holiday_id = 2
	end

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getWelfareBannerRes(slot4), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot6 = slot2:getChildByName("time_panel")

	slot6:getChildByName("Text_1"):setString(TI18N("剩余时间: "))

	slot0.remain_time = slot6:getChildByName("remain_time")

	slot0.remain_time:setString("")

	slot0.good_cons = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.good_cons, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.good_cons:getContentSize(), {
		start_y = 0,
		item_width = 688,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 136,
		space_y = 0,
		col = 1,
		item_class = MonthWeekItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function MonthWeekPanel.register_event(slot0)
	if slot0.update_month_week_data == nil then
		slot0.update_month_week_data = GlobalEvent:getInstance():Bind(WelfareEvent.Updata_Week_Month_Data, function (slot0)
			uv0:getMonthWeekItemInfo(slot0)
		end)
	end

	if slot0.update_month_charge_data == nil then
		slot0.update_month_charge_data = GlobalEvent:getInstance():Bind(ActionEvent.Is_Charge_Event, function (slot0)
			if slot0 and slot0.status and slot0.charge_id then
				slot1 = Config.ChargeData.data_charge_data[slot0.charge_id]

				if uv0:getMonthWeekChargeID() and slot1 and slot0.status == 1 and slot0.charge_id == slot2 then
					sdkOnPay(slot1.val, 1, slot1.id, slot1.name, slot1)
				end
			end
		end)
	end

	registerButtonEventListener(slot0.shop_btn, handler(slot0, slot0.onClickShopBtn), true)
end

function MonthWeekPanel.onClickShopBtn(slot0)
	if slot0.holiday_id ~= WelfareIcon.week then
		return
	end

	MallController:getInstance():openMallSingleShopPanel(true, {
		mall_type = MallConst.MallType.HeroSoulShop,
		item_id = 10005,
		config = Config.ExchangeData.data_shop_exchage_herosoul,
		shop_name = TI18N("英魂商城")
	})
end

function MonthWeekPanel.handleShopffect(slot0, slot1)
	if slot0.holiday_id ~= WelfareIcon.week then
		return
	end

	if slot1 == false then
		if slot0.shop_effect_1 then
			slot0.shop_effect_1:clearTracks()
			slot0.shop_effect_1:removeFromParent()

			slot0.shop_effect_1 = nil
		end

		if slot0.shop_effect_2 then
			slot0.shop_effect_2:clearTracks()
			slot0.shop_effect_2:removeFromParent()

			slot0.shop_effect_2 = nil
		end
	else
		if not tolua.isnull(slot0.title_con) and slot0.shop_effect_1 == nil then
			slot2, slot3 = slot0.shop_btn:getPosition()
			slot0.shop_effect_1 = createEffectSpine("E20989", cc.p(slot2, slot3), cc.p(0.5, 0.5), true, PlayerAction.action_1)

			slot0.title_con:addChild(slot0.shop_effect_1, 1)
		end

		if not tolua.isnull(slot0.shop_btn) and slot0.shop_effect_2 == nil then
			slot0.shop_effect_2 = createEffectSpine("E20989", cc.p(85, 79), cc.p(0.5, 0.5), true, PlayerAction.action_2)

			slot0.shop_btn:addChild(slot0.shop_effect_2)
		end
	end
end

function MonthWeekPanel.getMonthWeekItemInfo(slot0, slot1)
	slot0:setLessTime(slot1.ref_time - GameNet:getInstance():getTime())

	if uv0[slot1.type] then
		slot0:setBuyCount(slot1.first_gift)

		slot2 = {}
		slot3 = RoleController:getInstance():getRoleVo()
		slot7 = slot1.type

		for slot7, slot8 in pairs(uv0[slot7]) do
			slot9 = false

			if uv1[slot8.charge_id] then
				slot13 = slot8.charge_id

				for slot13, slot14 in ipairs(uv1[slot13]) do
					if slot0.holiday_id == WelfareIcon.week then
						if slot14.min <= slot1.reg_day and slot1.reg_day <= slot14.max and slot14.reg_min <= slot3.reg_time and slot3.reg_time <= slot14.reg_max then
							slot9 = true
						end
					elseif slot14.min <= slot1.reg_day and slot1.reg_day <= slot14.max then
						slot9 = true
					end

					if slot9 == true then
						break
					end
				end
			end

			if slot9 == true then
				slot8.count = slot8.limit_count - slot0:getBuyCount(slot8.charge_id)

				if slot8.count <= 0 then
					slot8.count = 0
				end

				slot8.reward = slot0:getRegisteDayReward(slot8.charge_id, slot1.reg_day)

				uv2(slot2, slot8)
			end
		end

		slot0:sortList(slot2)
		slot0.item_scrollview:setData(slot2)
	end
end

function MonthWeekPanel.getRegisteDayReward(slot0, slot1, slot2)
	slot3 = RoleController:getInstance():getRoleVo()

	if uv0[slot1] then
		slot4 = 1

		for slot8, slot9 in pairs(uv0[slot1]) do
			if slot9.min <= slot2 and slot2 <= slot9.max and slot9.reg_min <= slot3.reg_time and slot3.reg_time <= slot9.reg_max then
				slot4 = slot9.sort_id

				break
			end
		end

		return uv0[slot1][slot4].reward
	end

	return {}
end

function MonthWeekPanel.sortList(slot0, slot1)
	uv0(slot1, function (slot0, slot1)
		if slot0.count <= 0 and slot1.count > 0 then
			return false
		elseif slot0.count > 0 and slot1.count <= 0 then
			return true
		else
			return slot0.charge_id < slot1.charge_id
		end
	end)
end

function MonthWeekPanel.setBuyCount(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.buyCountData = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.buyCountData[slot6.id] = slot6.count
	end
end

function MonthWeekPanel.getBuyCount(slot0, slot1)
	if slot0.buyCountData and slot0.buyCountData[slot1] then
		return slot0.buyCountData[slot1]
	end

	return 0
end

function MonthWeekPanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.remain_time) then
		return
	end

	doStopAllActions(slot0.remain_time)

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.remain_time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.remain_time)
				uv1.remain_time:setString("00:00:00")
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function MonthWeekPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.remain_time:setString(TimeTool.GetTimeForFunction(slot1))
	else
		doStopAllActions(slot0.remain_time)
		slot0.remain_time:setString("00:00:00")
	end
end

function MonthWeekPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true and slot0.send_holiday_id then
		uv0:sender21007(slot0.send_holiday_id)
	end
end

function MonthWeekPanel.DeleteMe(slot0)
	doStopAllActions(slot0.remain_time)
	slot0:handleShopffect(fasle)

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.update_month_week_data ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_month_week_data)

		slot0.update_month_week_data = nil
	end

	if slot0.update_month_charge_data ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_month_charge_data)

		slot0.update_month_charge_data = nil
	end
end

MonthWeekItem = class("MonthWeekItem", function ()
	return ccui.Widget:create()
end)

function MonthWeekItem.ctor(slot0)
	slot0.touch_buy_month = true

	slot0:configUI()
	slot0:register_event()
end

function MonthWeekItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/week_month_panel_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(688, 136))
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.has_get = slot1:getChildByName("has_get")

	slot0.has_get:setVisible(false)

	slot0.btn_charge = slot1:getChildByName("btn_charge")
	slot0.charge_price = slot0.btn_charge:getChildByName("Text_4_0")
	slot0.text_remian = slot1:getChildByName("Text_4")
	slot0.good_cons = slot1:getChildByName("good_cons")
	slot0.good_scrollview = CommonScrollViewLayout.new(slot0.good_cons, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.good_cons:getContentSize(), {
		start_y = 12,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.good_scrollview:setSwallowTouches(false)
end

function MonthWeekItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_charge, function ()
		if not uv0.touch_buy_month then
			return
		end

		if uv0.buy_month_ticket == nil then
			uv0.buy_month_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0.touch_buy_month = true

				if uv0.buy_month_ticket ~= nil then
					GlobalTimeTicket:getInstance():remove(uv0.buy_month_ticket)

					uv0.buy_month_ticket = nil
				end
			end, 2)
		end

		uv0.touch_buy_month = nil

		if uv0.data and uv0.data.charge_id and uv0.data.count > 0 then
			if uv0.callback then
				uv0:callback()
			end

			uv1:setMonthWeekChargeID(uv0.data.charge_id)
			ActionController:getInstance():sender21016(uv0.data.charge_id)
		else
			message(TI18N("该礼包已售罄"))
		end
	end, true, 1)
end

function MonthWeekItem.getData(slot0)
	return slot0.data
end

function MonthWeekItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function MonthWeekItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.charge_price:setString(slot1.val .. TI18N("元"))

	if slot1.count <= 0 then
		slot1.count = 0

		setChildUnEnabled(true, slot0.btn_charge)
		slot0.charge_price:disableEffect(cc.LabelEffect.OUTLINE)
	else
		setChildUnEnabled(false, slot0.btn_charge)
		slot0.charge_price:enableOutline(Config.ColorData.data_color4[277], 2)
	end

	slot7 = "剩余: "
	slot6 = slot1.count

	slot0.text_remian:setString(TI18N(slot7) .. slot6)

	slot2 = {}

	for slot6, slot7 in pairs(slot1.reward) do
		table.insert(slot2, {
			bid = slot7[1],
			quantity = slot7[2]
		})
	end

	if #slot2 > 4 then
		slot0.good_scrollview:setClickEnabled(true)
	else
		slot0.good_scrollview:setClickEnabled(false)
	end

	slot0.good_scrollview:setData(slot2)
	slot0.good_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.good_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
end

function MonthWeekItem.DeleteMe(slot0)
	if slot0.buy_month_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.buy_month_ticket)

		slot0.buy_month_ticket = nil
	end

	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
