slot0 = table.insert
slot1 = table.sort
slot2 = string.format
ChargeTimePanel = ChargeTimePanel or BaseClass()

function ChargeTimePanel.__init(slot0, slot1, slot2)
	slot0.is_init = true
	slot0.parent = slot1
	slot0.offset_y = slot2 or 0
	slot0.holiday_bid = 91006
	slot0.dic_limit = {}

	slot0:loadResListCompleted()
end

function ChargeTimePanel.loadResListCompleted(slot0)
	slot0:createRootWnd()
	slot0:registerEvent()
end

function ChargeTimePanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("mall/charge_value_panel"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.vip_tips_txt = createLabel(20, 1, cc.c4b(75, 64, 111, 255), slot0.main_container:getContentSize().width - 10, 842, TI18N("均可获得vip积分"), slot0.main_container, 2, cc.p(1, 0.5))
	slot0.tips_txt = slot0.main_container:getChildByName("tips_txt")

	slot0.tips_txt:setVisible(true)
	slot0.tips_txt:setString(TI18N("限时折扣，礼包大放送"))
	slot0.tips_txt:setPositionY(slot0.tips_txt:getPositionY() + 30)

	slot2 = slot0.main_container:getChildByName("time_bg")

	slot2:setVisible(true)
	slot2:getChildByName("time_title"):setString(TI18N("剩余时间:"))

	slot0.time_txt = slot2:getChildByName("time_txt")
	slot0.item_list = slot0.main_container:getChildByName("item_list")
	slot3 = slot0.item_list:getContentSize()
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.item_list, cc.p(0, -slot0.offset_y), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot3.width, slot3.height + slot0.offset_y), {
		start_y = 0,
		row = 1,
		start_x = 0,
		space_x = 0,
		item_width = 680,
		item_height = 152,
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

function ChargeTimePanel.createNewCell(slot0)
	return ChargeLimitItem.new()
end

function ChargeTimePanel.numberOfCells(slot0)
	if not slot0.limit_data then
		return 0
	end

	return #slot0.limit_data
end

function ChargeTimePanel.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.limit_data then
		return
	end

	slot1.index = slot2

	if not slot0.limit_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ChargeTimePanel.registerEvent(slot0)
	if not slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				uv0:setData(slot0)
			end
		end)
	end
end

function ChargeTimePanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.limit_data == nil then
		slot0.limit_data = {}
	end

	for slot5, slot6 in ipairs(slot1.aim_list) do
		if slot0.dic_limit[slot6.aim] == nil then
			slot0.dic_limit[slot6.aim] = slot6

			uv0(slot0.limit_data, slot6)
		else
			for slot10, slot11 in pairs(slot6) do
				slot0.dic_limit[slot6.aim][slot10] = slot11
			end
		end

		if slot0.dic_limit[slot6.aim].aim ~= 99 then
			slot7.sort_index = 1

			if slot7.status == 1 then
				slot7.sort_index = 0
			elseif slot7.status == 2 then
				slot7.sort_index = 2
			end
		end
	end

	if slot1.remain_sec then
		commonCountDownTime(slot0.time_txt, slot1.remain_sec)
	end

	if not slot0.init_sort then
		slot0.init_sort = true

		uv1(slot0.limit_data, SortTools.tableLowerSorter({
			"sort_index",
			"aim"
		}))
	end

	slot0.item_scrollview:reloadData(nil, nil, true)
end

function ChargeTimePanel.setVisibleStatus(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end

	if slot1 == true and slot0.is_init == true then
		slot0.is_init = false

		ActionController:getInstance():cs16603(slot0.holiday_bid)
	end
end

function ChargeTimePanel.addChild(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) and not tolua.isnull(slot1) then
		slot0.root_wnd:addChild(slot1)
	end
end

function ChargeTimePanel.setPosition(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setPosition(slot1)
	end
end

function ChargeTimePanel.__delete(slot0)
	if slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)
		slot0.update_action_even_event = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.update_limit_charge_data ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_limit_charge_data)

		slot0.update_limit_charge_data = nil
	end
end

ChargeLimitItem = class("ChargeLimitItem", function ()
	return ccui.Widget:create()
end)

function ChargeLimitItem.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()

	slot0.touch_buy_limit = true
end

function ChargeLimitItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("mall/charge_cloth_item"))

	slot0:addChild(slot0.root_wnd)

	slot1 = cc.size(680, 152)

	slot0:setContentSize(slot1)
	slot0.root_wnd:setContentSize(slot1)
	slot0:setAnchorPoint(0.5, 0.5)

	slot2 = slot0.root_wnd:getChildByName("main_container")

	slot2:setContentSize(slot1)

	slot0.has_get = slot2:getChildByName("has_get")
	slot0.name = slot2:getChildByName("name")

	slot0.name:setString("")

	slot0.btn_charge = slot2:getChildByName("btn_charge")
	slot0.charge_price = slot0.btn_charge:getChildByName("Text_4_0")
	slot0.text_remian = slot2:getChildByName("Text_4")
	slot3 = slot2:getChildByName("good_cons")
	slot0.good_scrollview = CommonScrollViewLayout.new(slot3, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 12,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.good_scrollview:setSwallowTouches(false)
end

function ChargeLimitItem.registerEvent(slot0)
	registerButtonEventListener(slot0.btn_charge, handler(slot0, slot0.onClickItem), true, 1, nil, nil, nil, true)
end

function ChargeLimitItem.onClickItem(slot0)
	if not slot0.touch_buy_limit or not slot0.data then
		return
	end

	if slot0.data.status == 0 then
		slot0.touch_buy_limit = nil

		sdkOnPay((keyfind("aim_args_key", 27, slot0.data.aim_args) or {}).aim_args_val, 1, slot0.data.aim, slot0.data.aim_str)

		if slot0.buy_charge_limit_ticket == nil then
			slot0.buy_charge_limit_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0.touch_buy_limit = true

				if uv0.buy_charge_limit_ticket ~= nil then
					GlobalTimeTicket:getInstance():remove(uv0.buy_charge_limit_ticket)

					uv0.buy_charge_limit_ticket = nil
				end
			end, 2)
		end
	elseif slot0.data.status == 2 then
		message(TI18N("该礼包已售罄"))
	end
end

function ChargeLimitItem.setData1(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot0:getValByKey(slot1.aim_args, 41) < 1 then
		slot2 = 1
	end

	slot0.icon_load = loadSpriteTextureFromCDN(slot0.icon_sp, uv0("resource/mall_charge_icon/mall_charge_icon_%s.png", slot2), ResourcesType.single, slot0.icon_load)
	slot4 = slot0:getValByKey(slot1.aim_args, 7) or 0

	if (slot0:getValByKey(slot1.aim_args, 2) or 0) - (slot0:getValByKey(slot1.aim_args, 6) or 0) < 0 then
		slot7 = 0
	end

	if slot4 == 1 then
		slot0.limit_txt:setString(TI18N("周限购:" .. slot7))
	elseif slot4 == 2 then
		limit_str = TI18N("限购:" .. slot7)

		slot0.limit_txt:setString(TI18N("限购:" .. slot7))
	end

	slot0.sell_out_img:setVisible(slot7 == 0)
	slot0.price_txt:setString("￥" .. (slot0:getValByKey(slot1.aim_args, 27) or 0))

	for slot13, slot14 in ipairs(slot1.item_list) do
		if deepCopy(Config.ItemData.data_get_data(slot14.bid)) then
			slot15.quantity = slot14.num

			uv1({}, slot15)
		end
	end

	for slot13, slot14 in pairs(slot0.award_item_list) do
		slot14:setVisible(false)
	end

	for slot13, slot14 in ipairs(slot9) do
		if not slot0.award_item_list[slot13] then
			slot15 = BackPackItem.new(true, true, false, 0.5, nil, true)

			slot0.container:addChild(slot15)

			slot0.award_item_list[slot13] = slot15
		end

		slot15:setVisible(true)
		slot15:setData(slot14)
		slot15:setNumFontSize(32)

		slot16 = 78 - (slot13 % 2 - 1) * (BackPackItem.Width * 0.5 + 10)

		if slot13 == #slot9 and slot13 % 2 == 1 then
			slot16 = 113
		end

		slot17 = 0

		slot15:setPosition(slot16, slot13 % 2 == 0 and 140 - (slot13 / 2 - 1) * (BackPackItem.Height * 0.5 + 5) or 140 - math.floor(slot13 / 2) * (BackPackItem.Height * 0.5 + 5))
	end
end

function ChargeLimitItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2 = {}

	for slot6, slot7 in ipairs(slot1.item_list) do
		uv0(slot2, {
			bid = slot7.bid,
			quantity = slot7.num
		})
	end

	slot0.good_scrollview:setData(slot2)
	slot0.good_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.good_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
	slot0.name:setString(slot1.aim_str or "")

	slot3 = slot0:getValByKey(slot1.aim_args, 7) or 0

	if (slot0:getValByKey(slot1.aim_args, 2) or 0) - (slot0:getValByKey(slot1.aim_args, 6) or 0) < 0 then
		slot6 = 0
	end

	if slot6 == 0 then
		slot0.btn_charge:setVisible(false)
		slot0.text_remian:setVisible(false)
		slot0.has_get:setVisible(true)
		addRedPointToNodeByStatus(slot0.btn_charge, false, 5, 5)
	else
		slot0.has_get:setVisible(false)
		slot0.btn_charge:setVisible(true)
		slot0.text_remian:setVisible(true)
		slot0.text_remian:setString(uv1(TI18N("剩余:%s"), slot6))

		slot7 = slot0:getValByKey(slot1.aim_args, 27) or 0

		slot0.charge_price:setString(slot7 .. TI18N("元"))

		if slot7 == 0 then
			addRedPointToNodeByStatus(slot0.btn_charge, true, 5, 5)
		else
			addRedPointToNodeByStatus(slot0.btn_charge, false, 5, 5)
		end
	end
end

function ChargeLimitItem.getValByKey(slot0, slot1, slot2)
	if not slot1 then
		return 0
	end

	slot3 = 0

	for slot7, slot8 in ipairs(slot1) do
		if slot8.aim_args_key == slot2 then
			slot3 = slot8.aim_args_val
		end
	end

	return slot3
end

function ChargeLimitItem.DeleteMe(slot0)
	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	if slot0.buy_charge_limit_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.buy_charge_limit_ticket)

		slot0.buy_charge_limit_ticket = nil
	end

	if slot0.icon_load then
		slot0.icon_load:DeleteMe()

		slot0.icon_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
