ActionLimitOptionalGiftPanel = class("ActionLimitOptionalGiftPanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()

function ActionLimitOptionalGiftPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("mall", "mall"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("welfare/welfare_banner", "txt_cn_welfare_banner8"),
			type = ResourcesType.single
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:loadResListCompleted()
	end)
end

function ActionLimitOptionalGiftPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:register_event()
	uv0:sender16655()
end

function ActionLimitOptionalGiftPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_limit_common_panel"))

	slot0.root_wnd:setPosition(-40, -105)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container_size = slot0.main_container:getContentSize()
	slot1 = slot0.main_container:getChildByName("title_con")

	slot1:getChildByName("time_title"):setString(TI18N("剩余时间:"))

	slot0.time_val = slot1:getChildByName("time_val")
	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot2 = slot1:getChildByName("title_img")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getWelfareBannerRes("txt_cn_welfare_banner131"), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, PathTool.getWelfareBannerRes(uv1), LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot4 = slot0.goods_con:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.goods_con, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot4.width, slot4.height), {
		start_y = 0,
		item_width = 688,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 152,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = ActionLimitOptionalGiftItem
	})

	slot0.item_scrollview:setSwallowTouches(true)
end

function ActionLimitOptionalGiftPanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_val) then
		return
	end

	doStopAllActions(slot0.time_val)

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.time_val:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.time_val)
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function ActionLimitOptionalGiftPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_val:setString(TimeTool.GetTimeFormatDayIIIIII(slot1))
	else
		slot0.time_val:setString("")
	end
end

function ActionLimitOptionalGiftPanel.register_event(slot0)
	if slot0.update_clothes_data == nil then
		slot0.update_clothes_data = GlobalEvent:getInstance():Bind(ActionEvent.Custom_Optional_Gift_Event, function (slot0)
			uv0.base_data = slot0

			uv0:updateItemData(slot0)
		end)
	end

	if not slot0.limin_common_event then
		slot0.limin_common_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				uv0.item_scrollview:setData(slot0.aim_list, nil, , {
					bid = slot0.bid
				})

				if slot0.remain_sec <= 0 then
					slot2 = 0
				end

				uv0:setLessTime(slot2)
			end
		end)
	end
end

function ActionLimitOptionalGiftPanel.updateItemData(slot0, slot1)
	if slot0.cloth_charge_id and slot0.item_scrollview then
		for slot5, slot6 in pairs(slot1.gift_list or {}) do
			for slot10, slot11 in pairs(slot0.cloth_data) do
				if slot6.gift_id == slot11.gift_id then
					for slot15, slot16 in pairs(slot6) do
						slot11[slot15] = slot16
						slot11.is_sell_out = slot6.limit_count <= slot6.buy_count
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

function ActionLimitOptionalGiftPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.cloth_data = {}

	for slot6, slot7 in pairs(deepCopy(Config.HolidayOptionalGiftData.data_gift_info)) do
		if slot7.camp_id == slot1.camp_id then
			slot7.buy_count = 0
			slot7.cell_list = {}

			for slot11, slot12 in pairs(slot1.gift_list or {}) do
				if slot12.gift_id == slot7.gift_id then
					slot7.buy_count = slot12.buy_count
					slot7.limit_count = slot12.limit_count
					slot7.cell_list = slot12.cell_list
					slot7.is_sell_out = slot7.limit_count <= slot7.buy_count

					break
				end
			end

			if slot7.price == 0 and slot7.is_sell_out then
				uv0:setOptionalGiftRedStatus(false)
			end

			table.insert(slot0.cloth_data, slot7)
		end
	end

	slot0:sortItemList()
	slot0.item_scrollview:setData(slot0.cloth_data, nil, )

	if slot1.end_time <= 0 then
		slot3 = 0
	end

	slot0:setLessTime(slot3)
end

function ActionLimitOptionalGiftPanel.sortItemList(slot0)
	table.sort(slot0.cloth_data, function (slot0, slot1)
		if slot0.is_sell_out and not slot1.is_sell_out then
			return false
		elseif not slot0.is_sell_out and slot1.is_sell_out then
			return true
		else
			return slot0.gift_id < slot1.gift_id
		end
	end)
end

function ActionLimitOptionalGiftPanel.setVisibleStatus(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end
end

function ActionLimitOptionalGiftPanel.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.update_clothes_data then
		GlobalEvent:getInstance():UnBind(slot0.update_clothes_data)

		slot0.update_clothes_data = nil
	end

	if slot0.limin_common_event then
		GlobalEvent:getInstance():UnBind(slot0.limin_common_event)

		slot0.limin_common_event = nil
	end

	doStopAllActions(slot0.time_val)

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil
end

ActionLimitOptionalGiftItem = class("ActionLimitOptionalGiftItem", function ()
	return ccui.Widget:create()
end)

function ActionLimitOptionalGiftItem.ctor(slot0)
	slot0.ctrl = ActionController:getInstance()

	slot0:configUI()
	slot0:register_event()
end

function ActionLimitOptionalGiftItem.configUI(slot0)
	slot0.size = cc.size(688, 152)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("action/action_limit_optional_gift_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("main_container")
	slot0.btn_goto = slot2:getChildByName("btn_goto")

	slot0.btn_goto:getChildByName("Text_6"):setString(TI18N("前往自选"))
	slot0.btn_goto:setVisible(false)

	slot0.btn_get = slot2:getChildByName("btn_get")

	slot0.btn_get:getChildByName("Text_5"):setString(TI18N("购买"))
	slot0.btn_get:setVisible(false)

	slot0.img_getAll = slot2:getChildByName("Image_2")

	slot0.img_getAll:setVisible(false)

	slot0.btn_refresh = slot2:getChildByName("btn_refresh")

	slot0.btn_refresh:setVisible(false)

	slot0.panel1 = slot2:getChildByName("Panel_1")
	slot0.panel2 = slot2:getChildByName("Panel_2")

	slot0.panel1:setTouchEnabled(false)
	slot0.panel2:setTouchEnabled(false)

	slot0.options_con1 = slot0.panel1:getChildByName("good_cons")
	slot3 = slot0.options_con1:getContentSize()
	slot3.width = slot3.width - 80
	slot0.item_scrollview_son1 = CommonScrollViewSingleLayout.new(slot0.options_con1, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot3, {
		start_y = 10,
		row = 1,
		start_x = 0,
		space_x = 5,
		space_y = 0,
		col = 0,
		scale = 0.7,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.item_scrollview_son1:setSwallowTouches(false)
	slot0.item_scrollview_son1:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview_son1:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview_son1:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0.item_scrollview_son1:setClickEnabled(false)

	slot0.options_con2 = slot0.panel2:getChildByName("good_cons")
	slot5 = slot0.options_con2:getContentSize()
	slot5.width = slot5.width - 80
	slot0.item_scrollview_son2 = CommonScrollViewSingleLayout.new(slot0.options_con2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot5, {
		start_y = 10,
		row = 1,
		start_x = 0,
		space_x = 5,
		space_y = 0,
		col = 0,
		scale = 0.7,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.item_scrollview_son2:setSwallowTouches(false)
	slot0.item_scrollview_son2:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview_son2:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview_son2:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0.item_scrollview_son2:setClickEnabled(false)

	slot0.title_desc = createRichLabel(24, cc.c4b(90, 58, 38, 255), cc.p(0, 0.5), cc.p(14, 129), nil, , 400)

	slot2:addChild(slot0.title_desc)

	slot0.goal_desc = createRichLabel(24, cc.c4b(104, 69, 42, 255), cc.p(0.5, 0.5), cc.p(596, 127), nil, , 400)

	slot2:addChild(slot0.goal_desc)
end

function ActionLimitOptionalGiftItem.createNewCell(slot0)
	slot1 = BackPackItem.new(nil, , , 0.7)

	slot1:addCallBack(handler(slot0, slot0.onClickCallBack))
	slot1:setSwallowTouches(false)

	return slot1
end

function ActionLimitOptionalGiftItem.onClickCallBack(slot0, slot1)
	if not slot0.good_list then
		return
	end

	if slot0.good_list[slot1.index] and slot2.bid == nil then
		ActionController:getInstance():openActionLimitOptionalGiftSetPanel(true, slot0.data, slot0.data.camp_id, slot1.cell_id)
	end
end

function ActionLimitOptionalGiftItem.numberOfCells(slot0)
	if not slot0.good_list then
		return 0
	end

	return #slot0.good_list
end

function ActionLimitOptionalGiftItem.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.good_list then
		return
	end

	slot1.index = slot2

	if slot0.good_list[slot2] then
		slot1.cell_id = slot3.cell_id

		if slot3.bid == nil then
			slot1:setData(nil)
			slot1:showAddIcon(true)
			slot1:setDefaultTip(false)
		else
			slot1:setData(slot3)
			slot1:showAddIcon(false)
			slot1:setDefaultTip()
		end
	end
end

function ActionLimitOptionalGiftItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data and uv0.data.limit_count - uv0.data.buy_count > 0 then
			slot0 = Config.ChargeData.data_charge_data[uv0.data.charge_id]

			sdkOnPay(slot0.val, 1, slot0.id, slot0.name)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		ActionController:getInstance():openActionLimitOptionalGiftSetPanel(true, uv0.data, uv0.data.camp_id)
	end, true, 1)
	registerButtonEventListener(slot0.btn_refresh, function ()
		ActionController:getInstance():openActionLimitOptionalGiftSetPanel(true, uv0.data, uv0.data.camp_id)
	end, true, 1)
end

function ActionLimitOptionalGiftItem.setExtendData(slot0, slot1)
	slot0.holiday_item_bid = slot1.bid
end

function ActionLimitOptionalGiftItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.title_desc:setString(slot1.title_name)

	slot0.cur_config = Config.HolidayOptionalGiftData.data_gift_info[slot1.gift_id]
	slot2 = deepCopy(Config.HolidayOptionalGiftData.data_cell_info[slot1.gift_id])

	slot0.goal_desc:setString(string.format("限购%d个(<div fontColor=#2c7d08>%d</div>/%d)", slot1.limit_count, slot1.buy_count, slot1.limit_count))

	if slot1.price == 0 then
		slot0.btn_get:getChildByName("Text_5"):setString(TI18N("领取"))
	else
		slot0.btn_get:getChildByName("Text_5"):setString(slot1.price .. TI18N("元"))
	end

	slot0.btn_goto:setVisible(slot1.cell_count - slot1.fix_count - #slot1.cell_list > 0)

	slot4 = slot1.cell_count - slot1.fix_count - #slot1.cell_list == 0 and slot1.limit_count - slot1.buy_count > 0

	slot0.btn_get:setVisible(slot4)
	slot0.btn_refresh:setVisible(slot4)
	slot0.img_getAll:setVisible(slot1.limit_count - slot1.buy_count <= 0)
	slot0:sortItemList(slot2)

	slot5 = {}

	for slot9, slot10 in ipairs(slot2) do
		slot11 = {
			cell_id = slot10.cell_id,
			quantity = 0
		}

		if type(slot10.award[1]) == "number" then
			for slot15, slot16 in ipairs(slot1.cell_list) do
				if slot10.cell_id == slot16.cell_id then
					slot11.bid = Config.HolidayOptionalGiftData.data_class_info_awardid[slot16.award_id].award[1][1]
					slot11.quantity = Config.HolidayOptionalGiftData.data_class_info_awardid[slot16.award_id].award[1][2]
				end
			end

			table.insert(slot5, slot11)
		else
			slot11.bid = slot10.award[1][1]
			slot11.quantity = slot10.award[1][2]
			slot0.first_item = BackPackItem.new(nil, , , 0.7)

			slot0.first_item:showAddIcon(false)
			slot0.first_item:setDefaultTip()
			slot0.first_item:setPosition(cc.p(40, 50))
			slot0.panel2:addChild(slot0.first_item)
			slot0.first_item:setData(slot11)
		end
	end

	slot0.good_list = slot5

	if slot1.fix_count == 0 then
		slot0.panel1:setVisible(true)
		slot0.panel2:setVisible(false)
		slot0.item_scrollview_son1:reloadData()
	else
		slot0.panel1:setVisible(false)
		slot0.panel2:setVisible(true)
		slot0.item_scrollview_son2:reloadData(slot5)
	end
end

function ActionLimitOptionalGiftItem.sortItemList(slot0, slot1)
	table.sort(slot1, function (slot0, slot1)
		return slot0.cell_id < slot1.cell_id
	end)
end

function ActionLimitOptionalGiftItem.DeleteMe(slot0)
	if slot0.item_scrollview_son1 then
		slot0.item_scrollview_son1:DeleteMe()

		slot0.item_scrollview_son1 = nil
	end

	if slot0.item_scrollview_son2 then
		slot0.item_scrollview_son2:DeleteMe()

		slot0.item_scrollview_son2 = nil
	end

	if slot0.first_item then
		slot0.first_item:DeleteMe()

		slot0.first_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
