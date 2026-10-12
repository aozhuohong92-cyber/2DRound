BuyLevWindow = BuyLevWindow or BaseClass(BaseView)
slot0 = table.insert
slot1 = table.sort
slot2 = OrderActionController:getInstance()
slot3 = Config.HolidayWarOrderData.data_lev_reward_list

function BuyLevWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "orderaction/buy_lev_window"
	slot0.cur_buy_lev = 1
	slot0.touch_max_btn = nil
	slot0.totle_reward_list = {}
end

function BuyLevWindow.open_callback(slot0)
	slot0.root_wnd:getChildByName("background"):setScale(display.getMaxScale())

	slot2 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot2, 2)
	slot2:getChildByName("title_con"):getChildByName("title_label"):setString(TI18N("购买等级"))

	slot0.btn_buy = slot2:getChildByName("btn_buy")

	slot0.btn_buy:getChildByName("Text_1"):setString(TI18N("购   买"))

	slot3 = slot2:getChildByName("info_con")
	slot0.slider = slot3:getChildByName("slider")
	slot0.plus_btn = slot3:getChildByName("plus_btn")
	slot0.min_btn = slot3:getChildByName("min_btn")
	slot0.max_btn = slot3:getChildByName("max_btn")
	slot0.buy_price = slot3:getChildByName("buy_price")

	slot0.buy_price:setString("")

	slot0.cur_period = uv0:getModel():getCurPeriod()
	slot0.cur_lev = uv0:getModel():getCurLev()
	slot0.cur_max_lev = 0

	if uv1[slot0.cur_period] then
		slot0.cur_max_lev = #uv1[slot0.cur_period]
	end

	slot0.buy_editbox = createEditBox(slot2, PathTool.getResFrame("common", "common_1021"), cc.size(200, 50), cc.c4b(149, 149, 149, 255), 26, cc.c4b(149, 149, 149, 255), 26, "1", nil, 6, LOADTEXT_TYPE_PLIST)

	slot0.buy_editbox:setPosition(269, 200)
	slot0.buy_editbox:setInputMode(cc.EDITBOX_INPUT_MODE_NUMERIC)
	slot0.buy_editbox:onEditHandler(function (slot0)
		if slot0.name == "began" then
			uv0.buy_editbox:setPlaceHolder("")
			uv0.buy_editbox:setText("")
		elseif (slot0.name == "ended" or slot0.name == "return") and uv0.buy_editbox:getText() ~= "" and tonumber(slot1) then
			if slot2 <= 0 then
				slot2 = 1
			end

			if slot2 >= uv0.cur_max_lev - uv0.cur_lev then
				slot2 = uv0.cur_max_lev - uv0.cur_lev
			end

			uv0.buy_editbox:setText(slot2)

			uv0.cur_buy_lev = slot2 + uv0.cur_lev

			if uv0.cur_max_lev <= uv0.cur_buy_lev then
				uv0.cur_buy_lev = uv0.cur_max_lev
			end

			if uv0.cur_buy_lev <= uv0.cur_lev then
				uv0.cur_buy_lev = uv0.cur_lev + 1
			end

			uv0:buyDescript(uv0.cur_buy_lev)
		end
	end)

	slot0.reward_hight_desc = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0.5, 0.5), cc.p(340, 472), nil, , 400)

	slot2:addChild(slot0.reward_hight_desc)

	slot0.reward_common_desc = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0.5, 0.5), cc.p(340, 657), nil, , 400)

	slot2:addChild(slot0.reward_common_desc)

	slot0.lev_desc = createRichLabel(26, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(109, 258), nil, , 400)

	slot2:addChild(slot0.lev_desc)

	slot5 = slot2:getChildByName("hight_goods")
	slot0.item_hight_scrollview = CommonScrollViewLayout.new(slot5, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot5:getContentSize(), {
		start_y = 0,
		start_x = 32,
		space_x = 20,
		row = 1,
		space_y = 0,
		col = 4,
		item_class = BackPackItem,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height
	})

	slot0.item_hight_scrollview:setSwallowTouches(false)

	slot8 = slot2:getChildByName("common_goods")
	slot0.item_common_scrollview = CommonScrollViewLayout.new(slot8, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot8:getContentSize(), {
		start_y = 0,
		start_x = 32,
		space_x = 20,
		row = 1,
		space_y = 0,
		col = 4,
		item_class = BackPackItem,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height
	})

	slot0.item_common_scrollview:setSwallowTouches(false)

	slot0.cur_buy_lev = slot0.cur_lev + 1

	slot0:setEditBoxText(slot0.cur_buy_lev)
	slot0:buyDescript(slot0.cur_buy_lev)
	slot0:ticketInitShow(slot0.cur_buy_lev)

	slot0.btn_close = slot2:getChildByName("btn_close")
end

function BuyLevWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openBuyLevView(false)
	end, true, 2)
	registerButtonEventListener(slot0.plus_btn, function ()
		uv0:addBuy()
	end, true, 1)
	registerButtonEventListener(slot0.min_btn, function ()
		uv0:minusBuy()
	end, true, 1)
	registerButtonEventListener(slot0.max_btn, function ()
		uv0:maxBuy()
	end, true, 1)
	registerButtonEventListener(slot0.btn_buy, function ()
		uv1:send25307(uv0.cur_buy_lev - uv0.cur_lev)
	end, true, 1)
end

function BuyLevWindow.setEditBoxText(slot0, slot1)
	if slot0.buy_editbox then
		slot0.buy_editbox:setText(slot1 - slot0.cur_lev)
	end
end

function BuyLevWindow.addBuy(slot0)
	slot0.cur_buy_lev = slot0.cur_buy_lev + 1

	if uv0[slot0.cur_period] then
		slot0.touch_max_btn = nil

		if slot0.cur_max_lev < slot0.cur_buy_lev then
			slot0.cur_buy_lev = slot0.cur_max_lev

			message(TI18N("已经到达最大等级了~~~"))

			return
		end
	end

	slot0:setEditBoxText(slot0.cur_buy_lev)
	slot0:buyDescript(slot0.cur_buy_lev)
end

function BuyLevWindow.minusBuy(slot0)
	slot0.cur_buy_lev = slot0.cur_buy_lev - 1

	slot0:setEditBoxText(slot0.cur_buy_lev)

	slot0.touch_max_btn = nil

	if slot0.cur_buy_lev <= slot0.cur_lev then
		slot0.cur_buy_lev = slot0.cur_lev

		message(TI18N("已经是购买最小等级了~~~"))
		slot0:setEditBoxText(slot0.cur_buy_lev + 1)

		return
	end

	if slot0.cur_buy_lev <= 0 then
		slot0.cur_buy_lev = 0
	end

	slot0:buyDescript(slot0.cur_buy_lev)
end

function BuyLevWindow.maxBuy(slot0)
	if slot0.touch_max_btn then
		return
	end

	if not uv0[slot0.cur_period] then
		return
	end

	slot0.cur_buy_lev = slot0.cur_max_lev

	slot0:setEditBoxText(slot0.cur_buy_lev)

	slot0.touch_max_btn = true

	slot0:buyDescript(slot0.cur_max_lev)
end

function BuyLevWindow.buyDescript(slot0, slot1)
	slot2 = slot1

	if not uv0[slot0.cur_period] then
		return
	end

	slot0:clearTicket()

	if slot0.buy_lev_ticket == nil then
		slot0.buy_lev_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:ticketInitShow(uv1)
		end, 0.3)
	end

	slot1 = slot1 - slot0.cur_lev

	slot0.lev_desc:setString(string.format(TI18N("购买 <div fontcolor=#249003>%d</div> 级，升至 <div fontcolor=#249003>%d</div> 级"), slot1, slot0.cur_buy_lev))
	slot0.buy_price:setString(1000 * slot1 * 0.6)
end

function BuyLevWindow.ticketInitShow(slot0, slot1)
	if not slot1 then
		return
	end

	slot2, slot3, slot4, slot5 = slot0:addTicket(slot1)

	if slot0.reward_hight_desc then
		slot0.reward_hight_desc:setString(string.format(TI18N("激活进阶卡，更可解锁 <div fontcolor=#249003>%d</div> 件高级奖励"), slot1, slot3))
	end

	if slot0.reward_common_desc then
		slot0.reward_common_desc:setString(string.format(TI18N("升至 <div fontcolor=#249003>%d</div> 级，可立即解锁 <div fontcolor=#249003>%d</div> 件普通奖励"), slot1, slot5))
	end

	if slot0.item_hight_scrollview then
		slot0.item_hight_scrollview:setData(slot2)
		slot0.item_hight_scrollview:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.item_hight_scrollview:getItemList()) do
				slot5:setDefaultTip()
			end
		end)
	end

	if slot0.item_common_scrollview then
		slot0.item_common_scrollview:setData(slot4)
		slot0.item_common_scrollview:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.item_common_scrollview:getItemList()) do
				slot5:setDefaultTip()
			end
		end)
	end
end

function BuyLevWindow.clearTicket(slot0)
	if slot0.buy_lev_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.buy_lev_ticket)

		slot0.buy_lev_ticket = nil
	end
end

function BuyLevWindow.addTicket(slot0, slot1)
	slot0:clearTicket()

	slot2 = {}
	slot3 = {}
	slot4 = 0
	slot5 = {}
	slot6 = {}
	slot7 = 0

	for slot11 = slot0.cur_lev + 1, slot1 do
		if uv0[slot0.cur_period][slot11] and uv0[slot0.cur_period][slot11].reward then
			slot12 = 0

			if uv0[slot0.cur_period][slot11].common_num then
				slot12 = uv0[slot0.cur_period][slot11].common_num
			end

			slot7 = slot7 + slot12
			slot16 = slot0.cur_period

			for slot16, slot17 in ipairs(uv0[slot16][slot11].reward) do
				if slot6[slot17[1]] then
					slot6[slot17[1]] = slot6[slot17[1]] + slot17[2]
				else
					slot6[slot17[1]] = slot17[2]
				end
			end
		end
	end

	slot9 = 1

	if uv1:getModel():getRMBStatus() == 1 then
		slot9 = slot0.cur_lev + 1
	end

	for slot13 = slot9, slot1 do
		if uv0[slot0.cur_period][slot13] and uv0[slot0.cur_period][slot13].rmb_reward then
			slot14 = 0

			if uv0[slot0.cur_period][slot13].hight_num then
				slot14 = uv0[slot0.cur_period][slot13].hight_num
			end

			slot4 = slot4 + slot14
			slot18 = slot0.cur_period

			for slot18, slot19 in ipairs(uv0[slot18][slot13].rmb_reward) do
				if slot3[slot19[1]] then
					slot3[slot19[1]] = slot3[slot19[1]] + slot19[2]
				else
					slot3[slot19[1]] = slot19[2]
				end
			end
		end
	end

	slot10 = Config.HolidayWarOrderData.data_price_list

	for slot14, slot15 in pairs(slot3) do
		slot16 = 0

		if slot10[slot14] then
			slot16 = slot10[slot14].sort or 0
		end

		uv2(slot2, {
			bid = slot14,
			quantity = slot15,
			sort = slot16
		})
	end

	for slot14, slot15 in pairs(slot6) do
		slot16 = 0

		if slot10[slot14] then
			slot16 = slot10[slot14].sort or 0
		end

		uv2(slot5, {
			bid = slot14,
			quantity = slot15,
			sort = slot16
		})
	end

	uv3(slot2, function (slot0, slot1)
		return slot0.sort < slot1.sort
	end)
	uv3(slot5, function (slot0, slot1)
		return slot0.sort < slot1.sort
	end)

	return slot2, slot4, slot5, slot7
end

function BuyLevWindow.openRootWnd(slot0)
end

function BuyLevWindow.close_callback(slot0)
	slot0:clearTicket()

	if slot0.item_hight_scrollview then
		slot0.item_hight_scrollview:DeleteMe()

		slot0.item_hight_scrollview = nil
	end

	uv0:openBuyLevView(false)
end
