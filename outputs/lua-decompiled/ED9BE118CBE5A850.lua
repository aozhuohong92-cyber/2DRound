slot1 = ElfinController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
ElfinWishWindow = ElfinWishWindow or BaseClass(BaseView)

function ElfinWishWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_wish_window"
	slot0.item_list = {}
	slot0.cur_item_id_list = {}
	slot0.select_cell_list = {}
	slot0.elfin_data_list = {}
	slot0.lucky_sprite_num = 1

	if Config.HolidaySpriteLotteryData.data_const.lucky_sprite_num then
		slot0.lucky_sprite_num = slot1.val
	end
end

function ElfinWishWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("幽灵许愿"))

	slot0.left_btn = slot1:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.right_btn = slot1:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("确 定"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.elfin_info_panel = slot1:getChildByName("elfin_info_panel")

	slot0.elfin_info_panel:getChildByName("name_txt"):setString(TI18N("许愿池"))

	slot0.btn_rule = slot1:getChildByName("btn_rule")
	slot0.item_scrollview = slot0.elfin_info_panel:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)

	slot0.item_scrollview_size = slot0.item_scrollview:getContentSize()
	slot0.elfin_list = slot1:getChildByName("elfin_list")
	slot0.elfin_list_view = CommonScrollViewSingleLayout.new(slot0.elfin_list, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.elfin_list:getContentSize(), {
		start_y = 5,
		row = 0,
		start_x = 0,
		space_x = 24,
		space_y = 10,
		col = 4,
		need_dynamic = true,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height
	}, cc.p(0, 0))

	slot0.elfin_list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.elfin_list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.elfin_list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0.elfin_list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)

	slot0.choose_tips_txt = createRichLabel(24, cc.c4b(90, 58, 38, 255), cc.p(0, 0), cc.p(110, 625), nil, nil, 500)

	slot1:addChild(slot0.choose_tips_txt)
	slot0.choose_tips_txt:setString(TI18N("在幽灵召唤时，有<div fontcolor=#e95014>更高概率</div>获得许愿池中许愿的幽灵（获得橙色幽灵总概率不变）"))
end

function ElfinWishWindow.createNewCell(slot0)
	slot1 = ElfinWishItem.new()

	slot1:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot1
end

function ElfinWishWindow.numberOfCells(slot0)
	if not slot0.elfin_data_list then
		return 0
	end

	return #slot0.elfin_data_list
end

function ElfinWishWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.elfin_data_list[slot2] then
		slot7 = slot3

		slot1:setData(slot7)

		for slot7, slot8 in pairs(slot0.cur_item_id_list) do
			if slot8 and slot8.id == slot3.id then
				slot1:IsGetStatus(true)
			else
				slot1:IsGetStatus(false)
			end
		end
	end
end

function ElfinWishWindow.onCellTouched(slot0, slot1)
	slot2 = false

	for slot7, slot8 in pairs(slot0.cur_item_id_list) do
		if slot8 and slot8.id == slot0.elfin_data_list[slot1.index].id then
			if slot0.select_cell_list[slot7] then
				slot0.select_cell_list[slot7]:IsGetStatus(false)

				slot0.select_cell_list[slot7] = nil
			end

			slot0.cur_item_id_list[slot7] = nil
			slot2 = true

			break
		end
	end

	if slot2 == false then
		if slot0.lucky_sprite_num <= #slot0.cur_item_id_list then
			if slot0.cur_item_id_list[1] and slot0.select_cell_list[1] then
				slot0.select_cell_list[1]:IsGetStatus(false)

				slot0.select_cell_list[1] = slot1
				slot0.cur_item_id_list[1] = slot3
			end
		else
			uv0(slot0.select_cell_list, slot1)
			uv0(slot0.cur_item_id_list, slot3)
		end

		slot1:IsGetStatus(true)
	end

	slot0:updateElfinInfo()
	slot0:updateIconShow()
end

function ElfinWishWindow.updateElfinInfo(slot0)
	if not slot0.cur_item_id_list or #slot0.cur_item_id_list <= 0 then
		slot0.item_scrollview:setVisible(false)

		return
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0.select_cell_list) do
		if slot6 then
			uv0(slot1, slot6)
		end
	end

	slot0.select_cell_list = slot1
	slot2 = {}

	for slot6, slot7 in pairs(slot0.cur_item_id_list) do
		if slot7 then
			uv0(slot2, slot7)
		end
	end

	slot0.cur_item_id_list = slot2
	slot3 = {}

	for slot7, slot8 in ipairs(slot2) do
		uv0(slot3, {
			slot8.id,
			1
		})
	end

	slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot3, {
		max_count = 4,
		is_center = true
	})

	slot0.item_scrollview:setVisible(true)
end

function ElfinWishWindow.register_event(slot0)
	registerButtonEventListener(slot0.left_btn, function ()
		if uv0.elfin_bid_list == nil or next(uv0.elfin_bid_list) == nil then
			uv0:showCommonAlert(true)

			return
		end

		uv0:onClickCloseBtn()
	end, true)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickChooseBtn), true)
	registerButtonEventListener(slot0.close_btn, function ()
		if uv0.elfin_bid_list == nil or next(uv0.elfin_bid_list) == nil then
			uv0:showCommonAlert(true)

			return
		end

		uv0:onClickCloseBtn()
	end, true, 2)
	registerButtonEventListener(slot0.btn_rule, function ()
		if uv0.summon_data and Config.HolidaySpriteLotteryData.data_action[uv0.summon_data.camp_id] and slot0.group_id and Config.HolidaySpriteLotteryData.data_summon[slot0.group_id] then
			TimesummonController:getInstance():openTimeSummonAwardView(true, slot1.group_id, uv0.summon_data, TimesummonConst.ActonInfoType.ElfinType2)
		end
	end, true, 1)
	registerButtonEventListener(slot0.background, function ()
		if uv0.elfin_bid_list == nil or next(uv0.elfin_bid_list) == nil then
			uv0:showCommonAlert(true)

			return
		end

		uv0:onClickCloseBtn()
	end, false, 2)
end

function ElfinWishWindow.onClickCloseBtn(slot0)
	uv0:openElfinWishWindow(false)
end

function ElfinWishWindow.onClickChooseBtn(slot0)
	if next(slot0.elfin_data_list) == nil then
		message(TI18N("没有可选择的幽灵"))

		return
	end

	slot1 = {}

	if next(slot0.cur_item_id_list) == nil then
		slot0:showCommonAlert(false)
	else
		for slot5, slot6 in pairs(slot0.cur_item_id_list) do
			if slot6 then
				uv0(slot1, {
					lucky_sprites_bid = slot6.id
				})
			end
		end

		uv1:send26554(slot1)
		slot0:onClickCloseBtn()
	end
end

function ElfinWishWindow.showCommonAlert(slot0, slot1)
	if slot1 == true then
		CommonAlert.show(TI18N("许愿池尚未加入幽灵，现在召唤仍有概率获得橙色品质英雄，是否退出？"), TI18N("确定"), function ()
			uv0:onClickCloseBtn()
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, nil, true)
	else
		CommonAlert.show(slot2, TI18N("确定"), function ()
			uv0:send26554({})
			uv1:onClickCloseBtn()
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, nil, true)
	end
end

function ElfinWishWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.summon_data = slot1
	slot0.elfin_bid_list = {}

	for slot5, slot6 in pairs(slot1.lucky_ids) do
		if slot6.lucky_sprites_bid then
			uv0(slot0.elfin_bid_list, slot6.lucky_sprites_bid)
		end
	end

	slot0.elfin_data_list = {}
	slot2 = {}

	if Config.HolidaySpriteLotteryData.data_const.lucky_sprite_ids then
		slot2 = slot3.val
	end

	slot4 = {}

	if slot2 and next(slot2) ~= nil then
		for slot8, slot9 in pairs(slot2) do
			if Config.ItemData.data_get_data(slot9) then
				uv0(slot4, slot10)
			end
		end
	end

	slot0.elfin_data_list = slot4

	if next(slot0.elfin_data_list) == nil then
		slot0.item_scrollview:setVisible(false)
	else
		table.sort(slot0.elfin_data_list, function (slot0, slot1)
			for slot5, slot6 in pairs(uv0.elfin_bid_list) do
				if slot0.id == slot6 and slot1.id ~= slot6 then
					return true
				elseif slot0.id ~= slot6 and slot1.id == slot6 then
					return false
				end
			end

			if slot0.quality ~= slot1.quality then
				return slot1.quality < slot0.quality
			elseif slot0.eqm_jie ~= slot1.eqm_jie then
				return slot1.eqm_jie < slot0.eqm_jie
			else
				return slot0.id < slot1.id
			end
		end)

		if #slot0.elfin_bid_list > 0 then
			slot0.elfin_list_view:reloadData(1)
		else
			slot0.elfin_list_view:reloadData()
		end

		slot0:updateIconShow()
		commonShowEmptyIcon(slot0.elfin_list, false)
	end
end

function ElfinWishWindow.updateIconShow(slot0)
	if slot0.cur_item_id_list and #slot0.cur_item_id_list > 0 then
		if slot0.item_node then
			slot0.item_node:setVisible(false)
		end
	elseif slot0.item_node then
		slot0.item_node:setVisible(true)
	else
		slot0.item_node = BackPackItem.new(false, true, false)

		slot0.item_node:setPosition(cc.p(294, 68))
		slot0.elfin_info_panel:addChild(slot0.item_node)
		slot0.item_node:setData()
		slot0.item_node:showFlagByRes(true, PathTool.getResFrame("elfin", "elfin_1045"), 38, 94)
	end
end

function ElfinWishWindow.openRootWnd(slot0, slot1)
	slot0:setData(slot1)
end

function ElfinWishWindow.close_callback(slot0)
	if slot0.elfin_list_view then
		slot0.elfin_list_view:DeleteMe()

		slot0.elfin_list_view = nil
	end

	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	uv0:openElfinWishWindow(false)
end

ElfinWishItem = class("ElfinWishItem", function ()
	return ccui.Widget:create()
end)

function ElfinWishItem.ctor(slot0)
	slot0:configUI()
end

function ElfinWishItem.configUI(slot0)
	slot0.size = cc.size(BackPackItem.Width, BackPackItem.Height)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.item_node = BackPackItem.new(false, true, false)

	slot0.item_node:setPosition(cc.p(slot0.size.width * 0.5, slot0.size.height - BackPackItem.Height * 0.5))
	slot0:addChild(slot0.item_node)
end

function ElfinWishItem.addCallBack(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:addCallBack(slot1)
	end
end

function ElfinWishItem.setData(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:setData(slot1)
	end
end

function ElfinWishItem.IsGetStatus(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:IsGetStatus(slot1)
	end
end

function ElfinWishItem.DeleteMe(slot0)
	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end
end
