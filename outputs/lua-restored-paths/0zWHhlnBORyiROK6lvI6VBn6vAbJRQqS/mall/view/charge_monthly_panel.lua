slot0 = table.insert
slot1 = table.sort
slot2 = string.format
ChargeMonthlyPanel = ChargeMonthlyPanel or BaseClass()

function ChargeMonthlyPanel.__init(slot0, slot1, slot2)
	slot0.is_init = true
	slot0.parent = slot1
	slot0.offset_y = slot2 or 0

	slot0:loadResListCompleted()
end

function ChargeMonthlyPanel.loadResListCompleted(slot0)
	slot0:createRootWnd()
	slot0:registerEvent()
end

function ChargeMonthlyPanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("mall/charge_value_panel"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.vip_tips_txt = createLabel(20, 1, cc.c4b(75, 64, 111, 255), slot0.main_container:getContentSize().width - 10, 842, TI18N("均可获得vip积分"), slot0.main_container, 2, cc.p(1, 0.5))
	slot2 = slot0.main_container:getChildByName("time_bg")

	slot2:setVisible(true)
	slot2:getChildByName("time_title"):setString(TI18N("剩余时间："))

	slot0.time_txt = slot2:getChildByName("time_txt")
	slot0.item_list = slot0.main_container:getChildByName("item_list")
	slot3 = slot0.item_list:getContentSize()
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.item_list, cc.p(0, -slot0.offset_y), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot3.width, slot3.height + slot0.offset_y), {
		start_y = 10,
		row = 1,
		start_x = 0,
		space_x = 0,
		item_width = 680,
		item_height = 136,
		space_y = 10,
		col = 1,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot6 = slot0.main_container:getChildByName("image_1")

	slot6:setContentSize(cc.size(slot3.width + 10, slot3.height + slot0.offset_y + 20))
	slot6:setPositionY(slot6:getPositionY() - slot0.offset_y)
end

function ChargeMonthlyPanel.createNewCell(slot0, slot1, slot2)
	slot3 = ChargeMonthlyItem.new(slot1, slot2)

	slot3:addCallBack(function (slot0)
		uv0:onClickCallBack(slot0)
	end)

	return slot3
end

function ChargeMonthlyPanel.numberOfCells(slot0)
	if not slot0.weekly_data then
		return 0
	end

	return #slot0.weekly_data
end

function ChargeMonthlyPanel.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.weekly_data then
		return
	end

	slot1.index = slot2

	if not slot0.weekly_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ChargeMonthlyPanel.onClickCallBack(slot0, slot1)
	if slot1 then
		slot0.cur_charge_id = slot1
	end
end

function ChargeMonthlyPanel.registerEvent(slot0)
	if slot0.update_month_week_data == nil then
		slot0.update_month_week_data = GlobalEvent:getInstance():Bind(WelfareEvent.Updata_Week_Month_Data, function (slot0)
			if slot0.type == 2 then
				uv0:updateItemData(slot0)
			end
		end)
	end

	if slot0.update_month_charge_data == nil then
		slot0.update_month_charge_data = GlobalEvent:getInstance():Bind(ActionEvent.Is_Charge_Event, function (slot0)
			if slot0 and slot0.status and slot0.charge_id then
				slot1 = Config.ChargeData.data_charge_data[slot0.charge_id]

				if uv0.cur_charge_id and slot1 and slot0.status == 1 and slot0.charge_id == uv0.cur_charge_id then
					sdkOnPay(slot1.val, 1, slot1.id, slot1.name)
				end
			end
		end)
	end
end

function ChargeMonthlyPanel.updateItemData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.cur_charge_id then
		slot5 = slot1.first_gift

		slot0:setBuyCount(slot5)

		for slot5, slot6 in pairs(slot0.weekly_data) do
			slot6.count = slot6.limit_count - slot0:getBuyCount(slot6.charge_id)

			if slot6.count <= 0 then
				slot6.count = 0
			end

			slot6.reward, slot6.res_id = slot0:getRegisteDayReward(slot6.charge_id, slot1.reg_day)
		end

		for slot6, slot7 in pairs(slot0.item_scrollview:getActiveCellList()) do
			if slot7:getChargeId() == slot0.cur_charge_id then
				slot0.item_scrollview:resetItemByIndex(slot7.index)

				break
			end
		end

		slot0.cur_charge_id = nil
	else
		slot0:setData(slot1)
	end
end

function ChargeMonthlyPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0:setLessTime(slot1.ref_time - GameNet:getInstance():getTime())

	slot3 = Config.MiscData.data_cycle_gift_reward

	if Config.MiscData.data_cycle_gift_info[slot1.type] then
		slot7 = slot1.first_gift

		slot0:setBuyCount(slot7)

		slot0.weekly_data = {}

		for slot7, slot8 in pairs(slot2) do
			slot9 = false

			if slot3[slot8.charge_id] then
				for slot13, slot14 in pairs(slot3[slot8.charge_id]) do
					if slot14.min <= slot1.reg_day and slot1.reg_day <= slot14.max then
						slot9 = true

						break
					end
				end
			end

			slot10 = deepCopy(slot8)

			if slot9 == true then
				slot10.count = slot8.limit_count - slot0:getBuyCount(slot8.charge_id)

				if slot10.count <= 0 then
					slot10.count = 0
					slot10.sort_count = 0
				else
					slot10.sort_count = 1
				end

				slot10.reward, slot10.res_id = slot0:getRegisteDayReward(slot8.charge_id, slot1.reg_day)

				uv0(slot0.weekly_data, slot10)
			end
		end

		slot0:sortList(slot0.weekly_data)
		slot0.item_scrollview:reloadData()
	end
end

function ChargeMonthlyPanel.getRegisteDayReward(slot0, slot1, slot2)
	if Config.MiscData.data_cycle_gift_reward[slot1] then
		slot4 = 1

		for slot8, slot9 in pairs(slot3[slot1]) do
			if slot9.min <= slot2 and slot2 <= slot9.max then
				slot4 = slot9.sort_id

				break
			end
		end

		return slot3[slot1][slot4].reward, slot3[slot1][slot4].res_id
	end

	return {}
end

function ChargeMonthlyPanel.sortList(slot0, slot1)
	if slot0.init_sort then
		return
	end

	slot0.init_sort = true

	uv0(slot1, SortTools.tableCommonSorter({
		{
			"sort_count",
			true
		},
		{
			"sort_id",
			false
		},
		{
			"charge_id",
			false
		}
	}))
end

function ChargeMonthlyPanel.setBuyCount(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.buyCountData = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.buyCountData[slot6.id] = slot6.count
	end
end

function ChargeMonthlyPanel.getBuyCount(slot0, slot1)
	if slot0.buyCountData and slot0.buyCountData[slot1] then
		return slot0.buyCountData[slot1]
	end

	return 0
end

function ChargeMonthlyPanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_txt) then
		return
	end

	doStopAllActions(slot0.time_txt)

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.time_txt:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.time_txt)
				uv1.time_txt:setString("00:00:00")
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function ChargeMonthlyPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_txt:setString(TimeTool.GetTimeForFunction(slot1))
	else
		doStopAllActions(slot0.time_txt)
		slot0.time_txt:setString("00:00:00")
	end
end

function ChargeMonthlyPanel.setVisibleStatus(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end

	if slot1 == true and slot0.is_init == true then
		slot0.is_init = false

		WelfareController:getInstance():sender21007(2)
	elseif slot0.weekly_data and next(slot0.weekly_data) ~= nil then
		slot0:sortList(slot0.weekly_data)
		slot0.item_scrollview:reloadData()
	end
end

function ChargeMonthlyPanel.addChild(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) and not tolua.isnull(slot1) then
		slot0.root_wnd:addChild(slot1)
	end
end

function ChargeMonthlyPanel.setPosition(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setPosition(slot1)
	end
end

function ChargeMonthlyPanel.__delete(slot0)
	doStopAllActions(slot0.time_txt)

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

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

ChargeMonthlyItem = class("ChargeMonthlyItem", function ()
	return ccui.Widget:create()
end)

function ChargeMonthlyItem.ctor(slot0, slot1, slot2)
	slot0:configUI(slot1, slot2)
	slot0:registerEvent()

	slot0.touch_buy_month = true
end

function ChargeMonthlyItem.configUI(slot0, slot1, slot2)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/week_month_panel_item"))

	slot0:addChild(slot0.root_wnd)

	slot3 = cc.size(slot1, slot2)

	slot0:setContentSize(slot3)
	slot0.root_wnd:setContentSize(slot3)
	slot0:setAnchorPoint(0.5, 0.5)

	slot4 = slot0.root_wnd:getChildByName("main_container")

	slot4:setContentSize(slot3)
	slot4:setPositionX(slot1 * 0.5)

	slot0.has_get = slot4:getChildByName("has_get")
	slot0.btn_charge = slot4:getChildByName("btn_charge")
	slot0.charge_price = slot0.btn_charge:getChildByName("Text_4_0")
	slot0.text_remian = slot4:getChildByName("Text_4")
	slot5 = slot4:getChildByName("good_cons")
	slot0.good_scrollview = CommonScrollViewLayout.new(slot5, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot5:getContentSize(), {
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

function ChargeMonthlyItem.registerEvent(slot0)
	registerButtonEventListener(slot0.btn_charge, handler(slot0, slot0.onClickItem), true, 1, nil, nil, nil, true)
end

function ChargeMonthlyItem.onClickItem(slot0)
	if not slot0.touch_buy_month or not slot0.data or not slot0.data.charge_id then
		return
	end

	if slot0.data.count <= 0 then
		message(TI18N("该礼包已售罄"))

		return
	end

	if slot0.callback then
		slot0.callback(slot0.data.charge_id)
	end

	if slot0.data.val == 0 then
		MallController:getInstance():sender21023(slot0.data.charge_id)

		return
	end

	if slot0.buy_month_ticket == nil then
		slot0.buy_month_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0.touch_buy_month = true

			if uv0.buy_month_ticket ~= nil then
				GlobalTimeTicket:getInstance():remove(uv0.buy_month_ticket)

				uv0.buy_month_ticket = nil
			end
		end, 2)
	end

	slot0.touch_buy_month = nil

	ActionController:getInstance():sender21016(slot0.data.charge_id)
end

function ChargeMonthlyItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function ChargeMonthlyItem.setData1(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.icon_load = loadSpriteTextureFromCDN(slot0.icon_sp, uv0("resource/mall_charge_icon/mall_charge_icon_%s.png", slot1.res_id or 1), ResourcesType.single, slot0.icon_load)

	slot0.limit_txt:setString(TI18N("剩余: ") .. (slot1.count or 0))

	if slot1.count <= 0 then
		slot0.sell_out_img:setVisible(true)
	else
		slot0.sell_out_img:setVisible(false)
	end

	slot0.price_txt:setString("￥" .. slot1.val)

	if slot1.val == 0 and slot1.count > 0 then
		addRedPointToNodeByStatus(slot0.container, true, -5, -2)
	else
		addRedPointToNodeByStatus(slot0.container, false)
	end

	for slot7, slot8 in pairs(slot1.reward) do
		uv1({}, {
			bid = slot8[1],
			quantity = slot8[2]
		})
	end

	for slot7, slot8 in pairs(slot0.award_item_list) do
		slot8:setVisible(false)
	end

	slot4 = #slot3

	for slot8, slot9 in ipairs(slot3) do
		if not slot0.award_item_list[slot8] then
			slot10 = BackPackItem.new(true, true, false, 0.5, nil, true)

			slot0.container:addChild(slot10)

			slot0.award_item_list[slot8] = slot10
		end

		slot10:setVisible(true)
		slot10:setData(slot9)
		slot10:setNumFontSize(32)

		slot11 = 78 - (slot8 % 2 - 1) * (BackPackItem.Width * 0.5 + 10)

		if slot8 == slot4 and slot8 % 2 == 1 then
			slot11 = 113
		end

		slot12 = 0

		slot10:setPosition(slot11, slot8 % 2 == 0 and 140 - (slot8 / 2 - 1) * (BackPackItem.Height * 0.5 + 5) or 140 - math.floor(slot8 / 2) * (BackPackItem.Height * 0.5 + 5))
	end
end

function ChargeMonthlyItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2 = {}

	for slot6, slot7 in pairs(slot1.reward) do
		uv0(slot2, {
			bid = slot7[1],
			quantity = slot7[2]
		})
	end

	slot0.good_scrollview:setData(slot2)
	slot0.good_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.good_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)

	if slot1.count == 0 then
		slot0.btn_charge:setVisible(false)
		slot0.text_remian:setVisible(false)
		slot0.has_get:setVisible(true)
		addRedPointToNodeByStatus(slot0.btn_charge, false, 5, 5)
	else
		slot0.has_get:setVisible(false)
		slot0.btn_charge:setVisible(true)
		slot0.text_remian:setVisible(true)
		slot0.text_remian:setString(uv1(TI18N("剩余:%s"), slot1.count))
		slot0.charge_price:setString(slot1.val .. TI18N("元"))

		if slot1.val == 0 then
			addRedPointToNodeByStatus(slot0.btn_charge, true, 5, 5)
		else
			addRedPointToNodeByStatus(slot0.btn_charge, false, 5, 5)
		end
	end
end

function ChargeMonthlyItem.getChargeId(slot0)
	if slot0.data then
		return slot0.data.charge_id
	end
end

function ChargeMonthlyItem.DeleteMe(slot0)
	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	if slot0.buy_month_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.buy_month_ticket)

		slot0.buy_month_ticket = nil
	end

	if slot0.icon_load then
		slot0.icon_load:DeleteMe()

		slot0.icon_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
