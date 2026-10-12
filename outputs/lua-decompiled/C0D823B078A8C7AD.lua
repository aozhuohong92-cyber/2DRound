ActionSpriteResetSelectPanel = ActionSpriteResetSelectPanel or BaseClass(BaseView)
slot0 = ActionController:getInstance()
slot2 = ElfinController:getInstance():getModel()
slot3 = table.insert

function ActionSpriteResetSelectPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "action/action_hero_reset_select_panel"
	slot0.res_list = {}
end

function ActionSpriteResetSelectPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N("幽灵重生选择"))

	slot0.lay_scrollview = slot0.main_container:getChildByName("lay_scrollview")
	slot0.select_btn = slot0.main_container:getChildByName("select_btn")

	slot0.select_btn:getChildByName("label"):setString(TI18N("选 择"))

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
end

function ActionSpriteResetSelectPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.select_btn, handler(slot0, slot0._onClickBtnSelect), true, 2)
end

function ActionSpriteResetSelectPanel._onClickBtnClose(slot0)
	uv0:openActionSpriteResetSelectPanel(false)
end

function ActionSpriteResetSelectPanel._onClickBtnSelect(slot0)
	GlobalEvent:getInstance():Fire(ActionEvent.SPRITE_RESET_SELECT_EVENT, slot0.select_sprite_vo)
	slot0:_onClickBtnClose()
end

function ActionSpriteResetSelectPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.select_sprite_vo = slot2.select_sprite_vo
	slot0.can_select_sprite_list = slot2.can_select_sprite_list

	slot0:updateHeroList()
end

function ActionSpriteResetSelectPanel.updateHeroList(slot0)
	if slot0.list_view == nil then
		if tolua.isnull(slot0.lay_scrollview) then
			return
		end

		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.lay_scrollview:getContentSize(), {
			start_y = 4,
			row = 0,
			start_x = 0,
			space_x = 0,
			item_width = 148,
			item_height = 130,
			space_y = 0,
			col = 4,
			need_dynamic = true
		}, cc.p(0, 0))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.chose_elfin_list = deepCopy(uv0:getElfinTreeElfinList())

	table.sort(slot0.chose_elfin_list, SortTools.KeyLowerSorter("pos"))

	slot0.sprite_list = {}

	for slot7, slot8 in pairs(slot2) do
		if slot8.item_bid and slot8.item_bid ~= 0 then
			slot9 = GoodsVo.New(slot8.item_bid)
			slot9.quantity = 1
			slot9.is_lock = true

			uv1(deepCopy(BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.ELFIN) or {}), slot9)
		end
	end

	if slot0.can_select_sprite_list then
		for slot7, slot8 in pairs(slot3) do
			for slot12, slot13 in pairs(slot0.can_select_sprite_list) do
				if slot8.base_id == slot12 then
					uv1(slot0.sprite_list, slot8)
				end
			end
		end
	else
		slot0.sprite_list = slot3
	end

	if #slot0.sprite_list > 0 then
		table.sort(slot0.sprite_list, function (slot0, slot1)
			if slot0.eqm_jie ~= slot1.eqm_jie then
				return slot1.eqm_jie < slot0.eqm_jie
			elseif slot0.quality ~= slot1.quality then
				return slot1.quality < slot0.quality
			else
				return slot1.base_id < slot0.base_id
			end
		end)
		commonShowEmptyIcon(slot0.lay_scrollview, false)
	else
		commonShowEmptyIcon(slot0.lay_scrollview, true, {
			text = TI18N("暂无可重生幽灵")
		})
	end

	slot0.list_view:reloadData()
end

function ActionSpriteResetSelectPanel.createNewCell(slot0, slot1, slot2)
	slot3 = BackPackItem.new(false, true, false)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function ActionSpriteResetSelectPanel.numberOfCells(slot0)
	if not slot0.sprite_list then
		return 0
	end

	return #slot0.sprite_list
end

function ActionSpriteResetSelectPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2
	slot3 = slot0.sprite_list[slot2]

	slot1:setData(slot3)

	if slot3 then
		slot4 = slot3.is_lock or false

		slot1:showArtifactLock(slot4)
		slot1:setItemIconUnEnabled(slot4)

		if slot0.select_sprite_vo and slot0.select_sprite_vo.id == slot3.id then
			slot1:IsGetStatus(true)

			slot0.select_cell = slot1
		else
			slot1:IsGetStatus(false)
		end
	end
end

function ActionSpriteResetSelectPanel.onCellTouched(slot0, slot1)
	if slot0.sprite_list[slot1.index].is_lock == true then
		message(TI18N("上阵幽灵无法重生"))

		return
	end

	if slot0.select_cell then
		slot0.select_cell:IsGetStatus(false)
	end

	slot0.select_cell = slot1

	if slot0.select_sprite_vo and slot0.select_sprite_vo.id == slot3.id then
		slot0.select_sprite_vo = nil
		slot0.select_cell = nil
	else
		slot0.select_sprite_vo = slot3

		if slot0.select_cell then
			slot0.select_cell:IsGetStatus(true)
		end
	end
end

function ActionSpriteResetSelectPanel.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	uv0:openActionSpriteResetSelectPanel(false)
end
