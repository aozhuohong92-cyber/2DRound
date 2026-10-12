slot1 = ElfinController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
ElfinSelectItemWindow = ElfinSelectItemWindow or BaseClass(BaseView)

function ElfinSelectItemWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_select_item_window"
	slot0.cur_view_type = ElfinConst.Select_Type.Egg
	slot0.all_item_data = {}
	slot0.buy_state = 0
	slot0.max_buy_num = 0
end

function ElfinSelectItemWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.select_btn = slot1:getChildByName("select_btn")

	slot0.select_btn:setName("guide_select_btn")

	slot0.select_btn_label = slot0.select_btn:getChildByName("label")
	slot0.add_btn = slot1:getChildByName("add_btn")
	slot0.add_btn_label = slot0.add_btn:getChildByName("label")

	slot0.add_btn_label:setString(TI18N("补充"))
	slot0.add_btn:setVisible(false)

	slot0.win_title = slot1:getChildByName("win_title")
	slot0.label_select_num = slot1:getChildByName("label_select_num")

	slot0.label_select_num:setString(uv0(TI18N("已选择:0/1")))

	slot0.label_tip_1 = slot1:getChildByName("label_tip_1")

	slot0.label_tip_1:setString("")

	slot0.label_tip_2 = createRichLabel(20, cc.c4b(255, 255, 255, 255), cc.p(1, 0.5), cc.p(636, 138), nil, nil, 400)

	slot1:addChild(slot0.label_tip_2)

	slot0.lay_scrollview = slot1:getChildByName("lay_scrollview")
	slot0.list_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.lay_scrollview:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 18,
		space_x = 15,
		item_height = 135,
		space_y = 15,
		col = 5,
		need_dynamic = true,
		item_width = BackPackItem.Width * 0.9
	}, cc.p(0, 0))

	slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
end

function ElfinSelectItemWindow.createNewCell(slot0)
	slot1 = BackPackItem.new(false, true, false, 0.9)

	slot1:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot1
end

function ElfinSelectItemWindow.numberOfCells(slot0)
	if slot0.all_item_data then
		return #slot0.all_item_data + 1
	else
		return 1
	end
end

function ElfinSelectItemWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.all_item_data[slot2] then
		slot1:showAddIcon(false)
		slot1:setData(slot3)
		slot1:showItemQualityName(true)
		slot1:setNeedNum(1, BackpackController:getInstance():getModel():getItemNumByBid(slot3.id))

		if slot0.cur_item_cfg and slot0.cur_item_cfg.id == slot3.id then
			slot1:IsGetStatus(true)
		else
			slot1:IsGetStatus(false)
		end

		slot5 = nil

		if slot1.getRoot then
			slot5 = slot1:getRoot()
		end

		if slot5 and slot3.id == 10602 then
			if slot1.hc_btn == nil then
				slot1.hc_btn = createButton(slot5, TI18N("合成"), 620, 580, cc.size(105, 54), PathTool.getResFrame("common", "common_1027"), 24, Config.ColorData.data_color4[1])

				slot1.hc_btn:setPosition(slot5:getContentSize().width / 2, -70)
				slot1.hc_btn:enableOutline(Config.ColorData.data_color4[264], 2)
				slot1.hc_btn:addTouchEventListener(function (slot0, slot1)
					if slot1 == ccui.TouchEventType.ended then
						ElfinController:getInstance():openElfinEggSyntheticPanel(true, 10601)
					end
				end)
			end

			slot1.hc_btn:setVisible(true)
		elseif slot1.hc_btn then
			slot1.hc_btn:setVisible(false)
		end
	else
		slot1:setNeedNum(0)
		slot1:setData(nil)
		slot1:showAddIcon(true)
	end
end

function ElfinSelectItemWindow.onCellTouched(slot0, slot1)
	if not slot1:getData() or next(slot2) == nil then
		slot3 = nil

		if slot0.cur_view_type == ElfinConst.Select_Type.Egg then
			if Config.SpriteData.data_const.egg_buy_price and slot4.val[1] then
				slot3 = Config.ItemData.data_get_data(slot4.val[1])
			end
		elseif slot0.cur_view_type == ElfinConst.Select_Type.Item and Config.SpriteData.data_const.prop_buy_price and slot4.val[1] then
			slot3 = Config.ItemData.data_get_data(slot4.val[1])
		end

		if slot3 then
			BackpackController:getInstance():openTipsOnlySource(true, slot3)
		end
	elseif slot0.cur_item_cfg and slot0.cur_item_cfg.id == slot2.id then
		if slot0.select_cell then
			slot0.select_cell:IsGetStatus(false)
		end

		slot0.cur_item_cfg = nil

		slot0.label_select_num:setString(uv0(TI18N("已选择:0/1")))
		slot0.label_tip_1:setString("")
		slot0.label_tip_2:setString("")
		slot0.add_btn:setVisible(false)
	else
		if slot0.select_cell then
			slot0.select_cell:IsGetStatus(false)
		end

		slot1:IsGetStatus(true)

		slot0.select_cell = slot1

		slot0.label_select_num:setString(uv0(TI18N("已选择:1/1")))

		slot0.cur_item_cfg = deepCopy(slot2)

		slot0:updateSelectItemInfo()
	end
end

function ElfinSelectItemWindow.updateSelectItemInfo(slot0)
	if not slot0.cur_item_cfg then
		return
	end

	slot0.buy_state = 0
	slot0.max_buy_num = 0

	if slot0.cur_view_type == ElfinConst.Select_Type.Egg then
		if Config.SpriteData.data_hatch_egg[slot0.cur_item_cfg.id] then
			if Config.SpriteData.data_const.hatch_rate then
				slot0.label_tip_1:setString(uv0(TI18N("培养时间:%s"), TimeTool.GetTimeFormatDayIIIIII(slot1.need_piont * slot2.val)))
			end

			slot0.add_btn_label:setString(TI18N("购买"))
			slot0.label_tip_2:setString(slot1.desc)

			if slot1.can_buy == 1 then
				slot0.max_buy_num = slot1.limit_num - uv1:getElfinBuyCountByBid(slot0.cur_item_cfg.id)

				if slot0.max_buy_num > 0 then
					slot0.buy_state = 2
				else
					slot0.buy_state = 1
				end
			end
		end
	elseif slot0.cur_view_type == ElfinConst.Select_Type.Item and Config.SpriteData.data_smash_item[slot0.cur_item_cfg.id] then
		slot0.label_tip_1:setString(uv0(TI18N("减少培养点:%d点"), slot1.del_piont))
		slot0.label_tip_2:setString(slot1.desc)

		if slot1.can_buy == 1 then
			slot0.max_buy_num = slot1.limit_num - uv1:getElfinBuyCountByBid(slot0.cur_item_cfg.id)

			if slot0.max_buy_num > 0 then
				slot0.buy_state = 2
			else
				slot0.buy_state = 1
			end
		end
	end

	slot0.add_btn:setVisible(slot0.buy_state ~= 0)
end

function ElfinSelectItemWindow.checkUpdateSelectItemInfo(slot0, slot1)
	if slot0.cur_item_cfg and slot0.cur_item_cfg.id == slot1 then
		slot0:updateSelectItemInfo()
	end
end

function ElfinSelectItemWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.select_btn, handler(slot0, slot0.onClickSelectBtn), true)
	registerButtonEventListener(slot0.add_btn, handler(slot0, slot0.onClickAddBtn), true)
	slot0:addGlobalEvent(ElfinEvent.Buy_Elfin_Item_Success_Event, function (slot0)
		uv0.list_view:reloadData()
		uv0:checkUpdateSelectItemInfo(slot0)
	end)
	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
			return
		end

		uv0:checkNeedUpdateItemNum(slot1)
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
			return
		end

		uv0:checkNeedUpdateItemNum(slot1)
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
			return
		end

		uv0:checkNeedUpdateItemNum(slot1)
	end)
end

function ElfinSelectItemWindow.checkNeedUpdateItemNum(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot2 = false

	for slot6, slot7 in pairs(slot1) do
		if slot7.config then
			for slot11, slot12 in pairs(slot0.all_item_data) do
				if slot7.config.id == slot12.id then
					slot2 = true

					break
				end
			end
		end

		if slot2 then
			break
		end
	end

	if slot2 then
		slot0.list_view:reloadData()
	end
end

function ElfinSelectItemWindow.onClickCloseBtn(slot0)
	uv0:openElfSelectItemWindow(false)
end

function ElfinSelectItemWindow.onClickSelectBtn(slot0)
	if slot0.cur_item_cfg and slot0.hatch_id then
		if BackpackController:getInstance():getModel():getItemNumByBid(slot0.cur_item_cfg.id) <= 0 then
			if slot0.cur_item_cfg.id == ElfinConst.Bule_Egg_Bid then
				if Config.SpriteData.data_hatch_egg[slot0.cur_item_cfg.id] and slot2.price and slot2.price[1] then
					CommonAlert.show(string.format("是否花费<img src='%s' scale=0.3 />%s购买%s，并开始培养？", PathTool.getItemRes(Config.ItemData.data_get_data(slot2.price[1][1]).icon), MoneyTool.GetMoneyString(slot2.price[1][2]), slot0.cur_item_cfg.name), TI18N("确定"), function ()
						uv0:sender26507(1, uv1.cur_item_cfg.id, 1, uv1.hatch_id)
					end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, 24)
				else
					message(TI18N("所选道具数量不足"))
				end
			else
				message(TI18N("所选道具数量不足"))
			end

			return
		end

		if slot0.cur_view_type == ElfinConst.Select_Type.Item then
			GlobalEvent:getInstance():Fire(ElfinEvent.Open_Elfin_Smash_Panel_Event, slot0.cur_item_cfg.id)
		elseif slot0.cur_view_type == ElfinConst.Select_Type.Egg then
			uv0:sender26503(slot0.hatch_id, slot0.cur_item_cfg.id)
		end

		uv0:openElfSelectItemWindow(false)
	else
		message(TI18N("请至少选择一种物品"))
	end
end

function ElfinSelectItemWindow.onClickAddBtn(slot0)
	if slot0.cur_view_type == ElfinConst.Select_Type.Item then
		if Config.SpriteData.data_smash_item[slot0.cur_item_cfg.id].price and slot1.price[1] then
			ArenaController:getInstance():openArenaLoopChallengeBuy(true, {
				view_type = ArenaConst.view_type.elfin,
				item_bid = slot0.cur_item_cfg.id,
				item_price = slot1.price[1][2],
				cost_item_id = slot1.price[1][1],
				extra_data = 2,
				max_buy_num = slot0.max_buy_num,
				tips_str = uv0(TI18N("(可购买%d个)"), slot0.max_buy_num)
			})
		end
	elseif slot0.cur_view_type == ElfinConst.Select_Type.Egg and Config.SpriteData.data_hatch_egg[slot0.cur_item_cfg.id].price and slot1.price[1] then
		ArenaController:getInstance():openArenaLoopChallengeBuy(true, {
			view_type = ArenaConst.view_type.elfin,
			item_bid = slot0.cur_item_cfg.id,
			item_price = slot1.price[1][2],
			cost_item_id = slot1.price[1][1],
			extra_data = 1,
			max_buy_num = slot0.max_buy_num,
			tips_str = uv0(TI18N("(可购买%d个)"), slot0.max_buy_num)
		})
	end
end

function ElfinSelectItemWindow.openRootWnd(slot0, slot1)
	slot1 = slot1 or {}
	slot0.cur_view_type = slot1.view_type or ElfinConst.Select_Type.Egg
	slot0.hatch_id = slot1.hatch_id

	slot0:setData()
end

function ElfinSelectItemWindow.setData(slot0)
	slot0.all_item_data = {}

	if slot0.cur_view_type == ElfinConst.Select_Type.Egg then
		slot0.win_title:setString(TI18N("选择培养蛋"))

		slot4 = TI18N

		slot0.select_btn_label:setString(slot4("开始培养"))

		for slot4, slot5 in pairs(Config.SpriteData.data_hatch_egg) do
			if Config.ItemData.data_get_data(slot5.item_bid) then
				uv0(slot0.all_item_data, slot6)
			end
		end
	elseif slot0.cur_view_type == ElfinConst.Select_Type.Item then
		slot0.win_title:setString(TI18N("选择培养道具"))

		slot4 = TI18N

		slot0.select_btn_label:setString(slot4("使用"))

		for slot4, slot5 in pairs(Config.SpriteData.data_smash_item) do
			if Config.ItemData.data_get_data(slot5.item_bid) then
				uv0(slot0.all_item_data, slot6)
			end
		end
	end

	slot6 = "id"

	table.sort(slot0.all_item_data, SortTools.KeyLowerSorter(slot6))

	slot1 = 1

	for slot5, slot6 in ipairs(slot0.all_item_data) do
		if BackpackController:getInstance():getModel():getItemNumByBid(slot6.id) > 0 then
			slot1 = slot5
		end
	end

	slot0.list_view:reloadData(slot1)
end

function ElfinSelectItemWindow.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	uv0:openElfSelectItemWindow(false)
end
