slot0 = table.insert
slot1 = table.sort
slot2 = string.format
slot3 = table.remove
ChargeClothPanel = ChargeClothPanel or BaseClass()

function ChargeClothPanel.__init(slot0, slot1, slot2)
	slot0.is_init = true
	slot0.parent = slot1
	slot0.offset_y = slot2 or 0

	slot0:loadResListCompleted()
end

function ChargeClothPanel.loadResListCompleted(slot0)
	slot0:createRootWnd()
	slot0:registerEvent()
end

function ChargeClothPanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("mall/charge_value_panel"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.vip_tips_txt = createLabel(20, 1, cc.c4b(75, 64, 111, 255), slot0.main_container:getContentSize().width - 10, 842, TI18N("均可获得vip积分"), slot0.main_container, 2, cc.p(1, 0.5))
	slot0.tips_txt = slot0.main_container:getChildByName("tips_txt")

	slot0.tips_txt:setVisible(true)
	slot0.tips_txt:setString(TI18N("自选材料，特惠直购，助你战力飞升"))
	slot0.tips_txt:setPositionY(850)

	slot0.item_list = slot0.main_container:getChildByName("item_list")
	slot2 = slot0.item_list:getContentSize()
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.item_list, cc.p(0, -slot0.offset_y), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot2.width, slot2.height + slot0.offset_y), {
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

	slot5 = slot0.main_container:getChildByName("image_1")

	slot5:setContentSize(cc.size(slot2.width + 10, slot2.height + slot0.offset_y + 20))
	slot5:setPositionY(slot5:getPositionY() - slot0.offset_y)
end

function ChargeClothPanel.createNewCell(slot0)
	slot1 = ChargeClothItem.new()

	slot1:addCallBack(handler(slot0, slot0.onClickCallBack))

	return slot1
end

function ChargeClothPanel.numberOfCells(slot0)
	if not slot0.cloth_data then
		return 0
	end

	return #slot0.cloth_data
end

function ChargeClothPanel.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.cloth_data then
		return
	end

	slot1.index = slot2

	if not slot0.cloth_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ChargeClothPanel.onClickCallBack(slot0, slot1)
	if slot1 then
		slot0.cloth_charge_id = slot1
	end
end

function ChargeClothPanel.registerEvent(slot0)
	if slot0.update_clothes_data == nil then
		slot0.update_clothes_data = GlobalEvent:getInstance():Bind(MallEvent.Get_Chose_Shop_Data_Event, function (slot0)
			uv0:updateItemData(slot0)
		end)
	end

	if slot0.update_cloth_charge_data == nil then
		slot0.update_cloth_charge_data = GlobalEvent:getInstance():Bind(ActionEvent.Is_Charge_Event, function (slot0)
			if slot0 and slot0.status and slot0.charge_id then
				slot1 = Config.ChargeData.data_charge_data[slot0.charge_id]

				if uv0.cloth_charge_id and slot1 and slot0.status == 1 and slot0.charge_id == uv0.cloth_charge_id then
					sdkOnPay(slot1.val, 1, slot1.id, slot1.name)
				end
			end
		end)
	end
end

function ChargeClothPanel.updateItemData(slot0, slot1)
	if slot0.cloth_charge_id and slot0.item_scrollview then
		for slot5, slot6 in pairs(slot1.list or {}) do
			for slot10, slot11 in pairs(slot0.cloth_data) do
				if slot6.id == slot11.id then
					for slot15, slot16 in pairs(slot6) do
						slot11[slot15] = slot16
						slot11.is_sell_out = slot6.limit_num <= slot6.buy_num
					end

					break
				end
			end
		end

		for slot6, slot7 in pairs(slot0.item_scrollview:getActiveCellList()) do
			if slot7:getChargeId() == slot0.cloth_charge_id then
				slot0.item_scrollview:resetItemByIndex(slot7.index)

				break
			end
		end

		slot0.cloth_charge_id = nil
	else
		slot0:setData(slot1)
	end
end

function ChargeClothPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.cloth_data = {}

	for slot5, slot6 in pairs(slot1.list or {}) do
		slot6.is_sell_out = slot6.limit_num <= slot6.buy_num

		uv0(slot0.cloth_data, slot6)
	end

	slot0:reloadItemList()
end

function ChargeClothPanel.reloadItemList(slot0)
	for slot4 = #slot0.cloth_data, 1, -1 do
		if slot0.cloth_data[slot4].is_sell_out and slot5.price == 0 then
			uv0(slot0.cloth_data, slot4)
		end
	end

	uv1(slot0.cloth_data, function (slot0, slot1)
		if slot0.is_sell_out and not slot1.is_sell_out then
			return false
		elseif not slot0.is_sell_out and slot1.is_sell_out then
			return true
		elseif slot0.rank == slot1.rank then
			return slot0.end_time < slot1.end_time
		else
			return slot0.rank < slot1.rank
		end
	end)
	slot0.item_scrollview:reloadData()
end

function ChargeClothPanel.setVisibleStatus(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end

	if slot1 == true and slot0.is_init == true then
		slot0.is_init = false

		MallController:getInstance():sender27800()
	elseif slot0.cloth_data and next(slot0.cloth_data) ~= nil then
		slot0:reloadItemList()
	end
end

function ChargeClothPanel.addChild(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) and not tolua.isnull(slot1) then
		slot0.root_wnd:addChild(slot1)
	end
end

function ChargeClothPanel.setPosition(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setPosition(slot1)
	end
end

function ChargeClothPanel.__delete(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.update_clothes_data ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_clothes_data)

		slot0.update_clothes_data = nil
	end

	if slot0.update_cloth_charge_data ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_cloth_charge_data)

		slot0.update_cloth_charge_data = nil
	end
end

ChargeClothItem = class("ChargeClothItem", function ()
	return ccui.Widget:create()
end)

function ChargeClothItem.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()

	slot0.touch_buy_cloth = true
end

function ChargeClothItem.configUI(slot0)
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
	slot0.time = createRichLabel(20, cc.c4b(100, 50, 35, 255), cc.p(0.5, 0.5), cc.p(588, 25))

	slot2:addChild(slot0.time)

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

function ChargeClothItem.registerEvent(slot0)
	registerButtonEventListener(slot0.btn_charge, handler(slot0, slot0.onClickItem), true, 1, nil, , , true)
end

function ChargeClothItem.onClickItem(slot0)
	if not slot0.touch_buy_cloth or not slot0.data or not slot0.data.charge_id then
		return
	end

	if slot0.data.is_sell_out then
		message(TI18N("该礼包已售罄"))

		return
	end

	if slot0.data.price == 0 then
		if slot0.callback then
			slot0.callback(slot0.data.charge_id)
		end

		MallController:getInstance():sender27801(slot0.data.charge_id)

		return
	end

	if slot0.buy_hero_clothes_ticket == nil then
		slot0.buy_hero_clothes_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0.touch_buy_cloth = true

			if uv0.buy_hero_clothes_ticket ~= nil then
				GlobalTimeTicket:getInstance():remove(uv0.buy_hero_clothes_ticket)

				uv0.buy_hero_clothes_ticket = nil
			end
		end, 2)
	end

	slot0.touch_buy_cloth = nil

	if slot0.data.charge_id then
		if slot0.callback then
			slot0.callback(slot0.data.charge_id)
		end

		ActionController:getInstance():sender21016(slot0.data.charge_id)
	end
end

function ChargeClothItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function ChargeClothItem.setData1(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.name_txt:setString(slot1.res_name or "")

	slot0.icon_load = loadSpriteTextureFromCDN(slot0.icon_sp, uv0("resource/mall_charge_icon/mall_charge_icon_%s.png", slot1.icon or 1), ResourcesType.single, slot0.icon_load)

	if slot0.data.limit_type == 1 then
		slot0.limit_txt:setString(TI18N("日限购:") .. slot1.limit_num - slot1.buy_num)
	elseif slot0.data.limit_type == 2 then
		slot0.limit_txt:setString(TI18N("周限购:") .. slot3)
	elseif slot0.data.limit_type == 3 then
		slot0.limit_txt:setString(TI18N("月限购:") .. slot3)
	elseif slot0.data.limit_type == 4 then
		slot0.limit_txt:setString(TI18N("限购:") .. slot3)
	end

	slot0.sell_out_img:setVisible(slot1.is_sell_out)

	if slot1.limit_type == 4 then
		if slot1.original_price then
			slot0.old_price_txt:setString(TI18N("原价:￥") .. slot1.original_price)
			slot0.old_price_txt:setVisible(true)
			slot0.line_sp:setVisible(true)
		else
			slot0.old_price_txt:setVisible(false)
			slot0.line_sp:setVisible(false)
		end

		slot0.time_txt:setVisible(false)
	else
		commonCountDownTime(slot0.time_txt, slot1.end_time - GameNet:getInstance():getTime(), {
			time_color = "#249003",
			time_title = TI18N("剩余"),
			label_type = CommonAlert.type.rich
		})
		slot0.old_price_txt:setVisible(false)
		slot0.line_sp:setVisible(false)
	end

	slot0.price_txt:setString("￥" .. slot1.price)

	if slot0.data.price == 0 and slot1.is_sell_out == false then
		addRedPointToNodeByStatus(slot0.container, true, -5, -2)
	else
		addRedPointToNodeByStatus(slot0.container, false)
	end

	for slot7, slot8 in pairs(slot0.award_item_list) do
		slot8:setVisible(false)
	end

	for slot7, slot8 in ipairs(slot1.award_list or {}) do
		slot9 = slot8.item_id
		slot10 = slot8.item_num

		if not slot0.award_item_list[slot7] then
			slot11 = BackPackItem.new(true, true, false, 0.6, nil, true)

			slot0.container:addChild(slot11)

			slot0.award_item_list[slot7] = slot11
		end

		slot11:setVisible(true)
		slot11:setBaseData(slot9, slot10)
		slot11:setNumFontSize(30)

		slot13 = 0

		slot11:setPosition(75 - (slot7 % 2 - 1) * (BackPackItem.Width * 0.6 + 10), slot7 % 2 == 0 and 220 - (slot7 / 2 - 1) * (BackPackItem.Height * 0.6 + 5) or 220 - math.floor(slot7 / 2) * (BackPackItem.Height * 0.6 + 5))
	end
end

function ChargeClothItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2 = {}

	for slot6, slot7 in ipairs(slot1.award_list or {}) do
		uv0(slot2, {
			bid = slot7.item_id,
			quantity = slot7.item_num
		})
	end

	slot0.good_scrollview:setData(slot2)
	slot0.good_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.good_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
	slot0.name:setString(slot1.res_name or "")

	if slot1.limit_num - slot1.buy_num == 0 then
		slot0.btn_charge:setVisible(false)
		slot0.text_remian:setVisible(false)
		slot0.has_get:setVisible(true)
		addRedPointToNodeByStatus(slot0.btn_charge, false, 5, 5)
		slot0.time:setVisible(false)
		doStopAllActions(slot0.time)
	else
		slot0.has_get:setVisible(false)
		slot0.btn_charge:setVisible(true)
		slot0.text_remian:setVisible(true)

		if slot0.data.limit_type == 1 then
			slot0.text_remian:setString(uv1(TI18N("日限购:%s"), slot3))
		elseif slot0.data.limit_type == 2 then
			slot0.text_remian:setString(uv1(TI18N("周限购:%s"), slot3))
		elseif slot0.data.limit_type == 3 then
			slot0.text_remian:setString(uv1(TI18N("月限购:%s"), slot3))
		elseif slot0.data.limit_type == 4 then
			slot0.text_remian:setString(uv1(TI18N("限购:%s"), slot3))
		end

		if slot0.data.limit_type == 4 then
			slot0.time:setVisible(false)
			doStopAllActions(slot0.time)
		else
			slot0.time:setVisible(true)
			commonCountDownTime(slot0.time, slot1.end_time - GameNet:getInstance():getTime(), {
				time_color = "#249003",
				time_title = TI18N("剩余"),
				label_type = CommonAlert.type.rich
			})
		end

		slot0.charge_price:setString(slot1.price .. TI18N("元"))

		if slot1.price == 0 then
			addRedPointToNodeByStatus(slot0.btn_charge, true, 5, 5)
		else
			addRedPointToNodeByStatus(slot0.btn_charge, false, 5, 5)
		end
	end
end

function ChargeClothItem.getChargeId(slot0)
	if slot0.data then
		return slot0.data.charge_id
	end
end

function ChargeClothItem.DeleteMe(slot0)
	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	if slot0.buy_hero_clothes_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.buy_hero_clothes_ticket)

		slot0.buy_hero_clothes_ticket = nil
	end

	if slot0.icon_load then
		slot0.icon_load:DeleteMe()

		slot0.icon_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
