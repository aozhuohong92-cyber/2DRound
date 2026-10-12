slot1 = ActionController:getInstance():getModel()
slot2 = table.insert
ActionLimitOptionalGiftSetPanel = ActionLimitOptionalGiftSetPanel or BaseClass(BaseView)

function ActionLimitOptionalGiftSetPanel.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "action/action_limit_optional_gift_set_panel"
	slot0.cur_item_id_list = {}
	slot0.select_cell_list = {}
	slot0.item_data_list = {}
	slot0.cur_hero_item_list = {}
	slot0.cell_id = nil
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.res_list = {}
	slot0.pos_list = {
		{
			0.5
		},
		{
			0.35,
			0.65
		},
		{
			0.3,
			0.5,
			0.7
		},
		{
			0.2,
			0.4,
			0.6,
			0.8
		},
		{
			0.16,
			0.33,
			0.5,
			0.67,
			0.84
		}
	}
end

function ActionLimitOptionalGiftSetPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot1:getChildByName("win_title"):setString(TI18N("专属定制"))
	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.left_btn = slot1:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.right_btn = slot1:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("确 定"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.elfin_info_panel = slot1:getChildByName("box_2014")
	slot0.options_list = slot1:getChildByName("options_scrollview")
	slot0.item_list_view = CommonScrollViewSingleLayout.new(slot0.options_list, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.options_list:getContentSize(), {
		start_y = 10,
		row = 0,
		start_x = 20,
		space_x = 20,
		space_y = 5,
		col = 5,
		need_dynamic = true,
		item_width = BackPackItem.Width * 0.8,
		item_height = (BackPackItem.Height + 50) * 0.8
	}, cc.p(0, 0))

	slot0.item_list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0.item_list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
end

function ActionLimitOptionalGiftSetPanel.register_event(slot0)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickCloseBtn), true)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickChooseBtn), true)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClickCloseBtn()
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClickCloseBtn()
	end, false, 2)
end

function ActionLimitOptionalGiftSetPanel.selectHolyByIndex(slot0, slot1, slot2)
	if slot0.cur_item then
		slot0.cur_item.is_ui_select = false

		slot0.cur_item:handleEffect(false)
	end

	slot1.is_ui_select = true

	slot1:handleEffect(true)

	slot0.cur_item = slot1
	slot0.cell_id = slot2
	slot3 = 1

	if slot1.class_id then
		slot3 = slot1.class_id
	end

	slot0:changeSelectedTab(slot3)
end

function ActionLimitOptionalGiftSetPanel.longTouchHolyByIndex(slot0, slot1)
	if slot1.getData and slot1:getData() and Config.ItemData.data_get_data(slot1:getData().bid) then
		TipsManager:getInstance():showGoodsTips(slot3)
	end
end

function ActionLimitOptionalGiftSetPanel.updateCurHeroHolyItemList(slot0)
	if slot0.select_cell_list then
		for slot5, slot6 in pairs(slot0.select_cell_list) do
			if slot6 then
				-- Nothing
			end
		end

		slot0.select_cell_list = {
			[slot5] = slot6
		}
	end

	slot2 = {}

	for slot6, slot7 in pairs(slot0.cur_item_id_list or {}) do
		if slot7 then
			uv0(slot2, slot7)
		end
	end

	slot0.cur_item_id_list = slot2

	for slot6, slot7 in ipairs(slot0.dial_data) do
		slot8 = nil

		for slot12, slot13 in pairs(slot0.cur_item_id_list) do
			if slot13.cell_id == slot7.cell_id then
				if Config.HolidayOptionalGiftData.data_class_info_awardid[slot13.award_id] then
					slot8 = slot14
				end

				break
			end
		end

		slot9 = slot0.cur_hero_item_list[slot7.cell_id]

		if slot8 then
			slot10 = ""

			if Config.ItemData.data_get_data(slot8.award[1][1]) then
				slot10 = slot11.name
			end

			slot9:setData({
				bid = slot8.award[1][1],
				quantity = slot8.award[1][2],
				name = slot10
			}, true, true)

			slot9.equip_vo = slot8

			slot9:showAddIcon(false)
		else
			slot9:setData(nil, , true)

			slot9.equip_vo = nil

			slot9:showAddIcon(true)
		end

		slot9.is_ui_select = false

		if slot0.cell_id and slot7.cell_id == slot0.cell_id then
			slot9.is_ui_select = true
			slot0.cur_item = slot9
		end

		slot9:handleEffect(slot9.is_ui_select)
	end
end

function ActionLimitOptionalGiftSetPanel.createNewCell(slot0)
	slot1 = ActionLimitOptionalGiftSelectItem.new()

	slot1:setScale(0.8)
	slot1:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)
	slot1:addLongTimeTouchCallback(function ()
		uv0:onCellLongTimeTouched(uv1)
	end)

	return slot1
end

function ActionLimitOptionalGiftSetPanel.numberOfCells(slot0)
	if not slot0.item_data_list then
		return 0
	end

	return #slot0.item_data_list
end

function ActionLimitOptionalGiftSetPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.item_data_list[slot2] then
		slot4 = ""

		if Config.ItemData.data_get_data(slot3.award[1][1]) then
			slot4 = slot5.name
		end

		slot1:setData({
			bid = slot3.award[1][1],
			quantity = slot3.award[1][2],
			name = slot4
		}, true)
		slot1:IsGetStatus(false)

		if slot0.cur_item and slot0.cur_item.equip_vo and slot0.cur_item.equip_vo.award_id == slot3.award_id then
			slot10 = true

			slot1:IsGetStatus(slot10)

			for slot10, slot11 in pairs(slot0.cur_item_id_list) do
				if slot11 and slot11.award_id == slot0.cur_item.equip_vo.award_id then
					slot0.select_cell_list[slot11.cell_id] = slot1

					break
				end
			end
		end
	end
end

function ActionLimitOptionalGiftSetPanel.onCellLongTimeTouched(slot0, slot1)
	if slot0.item_data_list[slot1.index] then
		TipsManager:getInstance():showGoodsTips(Config.ItemData.data_get_data(slot2.award[1][1]))
	end
end

function ActionLimitOptionalGiftSetPanel.onCellTouched(slot0, slot1)
	slot3 = slot0.item_data_list[slot1.index]

	if false == false then
		for slot7, slot8 in pairs(slot0.cur_item_id_list) do
			if slot8.cell_id == slot0.cell_id then
				if slot0.select_cell_list[slot0.cell_id] then
					slot0.select_cell_list[slot0.cell_id]:IsGetStatus(false)

					slot0.select_cell_list[slot0.cell_id] = nil
				end

				slot8.award_id = slot3.award_id
				slot0.select_cell_list[slot0.cell_id] = slot1

				break
			end
		end

		slot0:updateCurHeroHolyItemList()
		slot1:IsGetStatus(true)
	else
		slot0:updateCurHeroHolyItemList()
	end
end

function ActionLimitOptionalGiftSetPanel.onClickCloseBtn(slot0)
	uv0:openActionLimitOptionalGiftSetPanel(false)
end

function ActionLimitOptionalGiftSetPanel.onClickChooseBtn(slot0)
	if not slot0.data then
		return
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0.cur_item_id_list) do
		if slot6 then
			if slot6.award_id == nil or slot7 == 0 then
				message(TI18N("您还没选择好哦！"))

				return
			end

			uv0(slot1, {
				cell_id = slot6.cell_id,
				award_id = slot7
			})
		end
	end

	uv1:sender16656(slot0.data.gift_id, slot1)
	slot0:onClickCloseBtn()
end

function ActionLimitOptionalGiftSetPanel.changeSelectedTab(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = {}

	if Config.HolidayOptionalGiftData.data_class_info[slot1] then
		for slot7, slot8 in pairs(slot2) do
			if slot0.role_vo and slot8.lev_min <= slot0.role_vo.lev and slot0.role_vo.lev <= slot8.lev_max and slot0.camp_id and slot0.camp_id == slot8.camp_id then
				uv0(slot3, slot8)
			end
		end
	end

	table.sort(slot3, SortTools.KeyLowerSorter("sort_id"))

	slot0.item_data_list = slot3
	slot0.select_cell_list = {}

	slot0.item_list_view:reloadData()
end

function ActionLimitOptionalGiftSetPanel.setData(slot0, slot1, slot2, slot3)
	if not slot1 or not slot2 then
		return
	end

	slot0.data = slot1
	slot0.camp_id = slot2
	slot0.cur_config = Config.HolidayOptionalGiftData.data_cell_info[slot1.gift_id]

	if not slot0.cur_config then
		return
	end

	slot0.select_cell_index = slot3
	slot4 = {}
	slot5 = {}

	for slot9, slot10 in pairs(slot0.cur_config) do
		slot11 = nil

		for slot15, slot16 in pairs(slot1.cell_list) do
			if slot16.cell_id == slot10.cell_id and type(slot10.award[1]) == "number" then
				slot11 = slot16.award_id

				break
			end
		end

		if type(slot10.award[1]) == "number" then
			if slot3 then
				if slot10.cell_id == slot3 then
					slot0.cell_id = slot10.cell_id
					slot0.cell_award = slot10.award[1]
				end
			elseif slot0.cell_id == nil then
				slot0.cell_id = slot10.cell_id
				slot0.cell_award = slot10.award[1]
			elseif slot10.cell_id < slot0.cell_id then
				slot0.cell_id = slot10.cell_id
				slot0.cell_award = slot10.award[1]
			end

			uv0(slot4, {
				cell_id = slot10.cell_id,
				award_id = slot11,
				class_id = slot10.award[1]
			})
			uv0(slot5, {
				cell_id = slot10.cell_id,
				award_id = slot11
			})
		end
	end

	table.sort(slot4, SortTools.KeyLowerSorter("cell_id"))

	slot0.dial_data = slot4

	slot0:createCustomMadeItme()
	table.sort(slot5, SortTools.KeyLowerSorter("cell_id"))

	slot0.cur_item_id_list = slot5

	slot0:updateCurHeroHolyItemList()
	slot0:changeSelectedTab(slot0.cell_award)
end

function ActionLimitOptionalGiftSetPanel.createCustomMadeItme(slot0)
	if not slot0.dial_data then
		return
	end

	slot3 = slot0.elfin_info_panel:getContentSize().width / #slot0.dial_data

	for slot7, slot8 in ipairs(slot0.dial_data) do
		if not slot0.cur_hero_item_list[slot8.cell_id] then
			slot9 = ActionLimitOptionalGiftSelectItem.new()

			slot9:addCallBack(function ()
				uv0:selectHolyByIndex(uv1, uv2.cell_id)
			end)
			slot9:addLongTimeTouchCallback(function ()
				uv0:longTouchHolyByIndex(uv1)
			end)

			slot9.class_id = slot8.class_id

			slot0.elfin_info_panel:addChild(slot9)

			slot0.cur_hero_item_list[slot8.cell_id] = slot9

			if slot8.cell_id == slot0.cell_id then
				slot0:selectHolyByIndex(slot9, slot8.cell_id)
			end
		end

		slot9:setPosition(cc.p(slot3 / 2 + (slot7 - 1) * slot3, 55))
	end
end

function ActionLimitOptionalGiftSetPanel.openRootWnd(slot0, slot1, slot2, slot3)
	slot0:setData(slot1, slot2, slot3)
end

function ActionLimitOptionalGiftSetPanel.close_callback(slot0)
	if slot0.item_list_view then
		slot0.item_list_view:DeleteMe()

		slot0.item_list_view = nil
	end

	if slot0.cur_hero_item_list then
		for slot4, slot5 in pairs(slot0.cur_hero_item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end

		slot0.cur_hero_item_list = nil
	end

	uv0:openActionLimitOptionalGiftSetPanel(false)
end

ActionLimitOptionalGiftSelectItem = class("ActionLimitOptionalGiftSelectItem", function ()
	return ccui.Widget:create()
end)

function ActionLimitOptionalGiftSelectItem.ctor(slot0)
	slot0:configUI()
end

function ActionLimitOptionalGiftSelectItem.configUI(slot0)
	slot0.size = cc.size(BackPackItem.Width, BackPackItem.Height + 50)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.item_node = BackPackItem.new(false, true, false)

	slot0.item_node:setPosition(cc.p(slot0.size.width * 0.5, slot0.size.height - BackPackItem.Height * 0.5))
	slot0:addChild(slot0.item_node)
end

function ActionLimitOptionalGiftSelectItem.addCallBack(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:addCallBack(slot1)
	end
end

function ActionLimitOptionalGiftSelectItem.addLongTimeTouchCallback(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:addLongTimeTouchCallback(slot1)
	end
end

function ActionLimitOptionalGiftSelectItem.showAddIcon(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:showAddIcon(slot1)
	end
end

function ActionLimitOptionalGiftSelectItem.setData(slot0, slot1, slot2, slot3)
	slot0.data = slot1

	if slot0.item_node then
		if slot1 then
			slot0.item_node:setData(slot1)

			if slot2 then
				if slot3 then
					slot0.item_node:setGoodsName("")
					slot0.item_node:setDefaultTip(false)
				else
					slot0.item_node:setGoodsName(slot1.name, nil, 22)
				end
			end
		else
			slot0.item_node:setData(nil)
			slot0.item_node:setGoodsName("")
			slot0.item_node.item_icon:setVisible(false)
			slot0.item_node:setSelfBackground(BackPackConst.quality.white)
		end
	end
end

function ActionLimitOptionalGiftSelectItem.getData(slot0)
	return slot0.data
end

function ActionLimitOptionalGiftSelectItem.IsGetStatus(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:IsGetStatus(slot1)
	end
end

function ActionLimitOptionalGiftSelectItem.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.item_node) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine("E20967", cc.p(BackPackItem.Width * 0.5, BackPackItem.Height * 0.5 - 10), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.item_node:addChild(slot0.play_effect)
	end
end

function ActionLimitOptionalGiftSelectItem.DeleteMe(slot0)
	slot0:handleEffect(false)

	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end
end
