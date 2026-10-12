ActionHeroResetSelectPanel = ActionHeroResetSelectPanel or BaseClass(BaseView)
slot1 = ActionController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.remove

function ActionHeroResetSelectPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.is_hero_return = false
	slot0.layout_name = "action/action_hero_reset_select_panel"
	slot0.res_list = {}
end

function ActionHeroResetSelectPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N("重生英雄选择"))

	slot0.lay_scrollview = slot0.main_container:getChildByName("lay_scrollview")
	slot0.select_btn = slot0.main_container:getChildByName("select_btn")

	slot0.select_btn:getChildByName("label"):setString(TI18N("确 定"))

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
end

function ActionHeroResetSelectPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.select_btn, handler(slot0, slot0._onClickBtnSelect), true, 2)
end

function ActionHeroResetSelectPanel._onClickBtnClose(slot0)
	uv0:openActionHeroResetSelectPanel(false)
end

function ActionHeroResetSelectPanel._onClickBtnSelect(slot0)
	if slot0.is_hero_return == true then
		GlobalEvent:getInstance():Fire(HeroEvent.HERO_RETURN_SELECT_EVENT, slot0.select_hero_vo)
	else
		GlobalEvent:getInstance():Fire(ActionEvent.HERO_RESET_SELECT_EVENT, slot0.select_hero_vo)
	end

	slot0:_onClickBtnClose()
end

function ActionHeroResetSelectPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.select_hero_vo = slot2.select_hero_vo

	if slot2.is_hero_return ~= nil then
		slot0.is_hero_return = slot2.is_hero_return
	end

	slot0:updateHeroList()
end

function ActionHeroResetSelectPanel.updateHeroList(slot0)
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

	slot0.hero_list = {}

	if slot0.is_hero_return == true then
		slot0.title:setString(TI18N("回退英雄选择"))

		slot2 = {}

		if Config.PartnerData.data_partner_const.return_condition then
			for slot6, slot7 in ipairs(slot1.val) do
				if slot2[slot7] == nil then
					slot2[slot7] = true
				end
			end
		end

		for slot7, slot8 in pairs(HeroController:getInstance():getModel():getHeroList() or {}) do
			if slot2[slot8.star] then
				uv0(slot0.hero_list, slot8)
			end
		end
	else
		slot2 = {}

		if Config.PartnerData.data_partner_const.reborn_condition then
			for slot6, slot7 in ipairs(slot1.val) do
				if slot2[slot7[1]] == nil then
					slot2[slot7[1]] = {}
				end

				slot2[slot7[1]][slot7[2]] = true
			end
		end

		for slot7, slot8 in pairs(HeroController:getInstance():getModel():getHeroList() or {}) do
			if slot2[slot8.bid] and slot2[slot8.bid][slot8.star] then
				uv0(slot0.hero_list, slot8)
			end
		end
	end

	table.sort(slot0.hero_list, SortTools.tableLowerSorter({
		"camp_type",
		"star",
		"bid"
	}))
	slot0.list_view:reloadData()

	if #slot0.hero_list == 0 then
		slot2 = TI18N("暂无可重生英雄")

		if slot0.is_hero_return == true then
			slot2 = TI18N("暂无可回退英雄")
		end

		commonShowEmptyIcon(slot0.lay_scrollview, true, {
			text = slot2
		})
	else
		commonShowEmptyIcon(slot0.lay_scrollview, false)
	end
end

function ActionHeroResetSelectPanel.createNewCell(slot0, slot1, slot2)
	slot3 = HeroExhibitionItem.new(1, true)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function ActionHeroResetSelectPanel.numberOfCells(slot0)
	if not slot0.hero_list then
		return 0
	end

	return #slot0.hero_list
end

function ActionHeroResetSelectPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2
	slot3 = slot0.hero_list[slot2]

	slot1:setData(slot3)

	if slot3 then
		slot1:showLockIcon(slot3:isLock() or slot3.isInForm and slot3:isInForm() or slot3:isResonateHero())

		if slot0.select_hero_vo and slot0.select_hero_vo.partner_id == slot3.partner_id then
			slot1:setSelected(true)

			slot0.select_cell = slot1
		else
			slot1:setSelected(false)
		end
	end
end

function ActionHeroResetSelectPanel.onCellTouched(slot0, slot1)
	if slot0.hero_list[slot1.index]:checkHeroLockTips(true) then
		return
	end

	if slot3:isResonateHero() == true then
		message(TI18N("赋能英雄无法回退"))

		return
	end

	if slot0.select_cell then
		slot0.select_cell:setSelected(false)
	end

	slot0.select_cell = slot1

	if slot0.select_hero_vo and slot0.select_hero_vo.partner_id == slot3.partner_id then
		slot0.select_hero_vo = nil
		slot0.select_cell = nil
	else
		slot0.select_hero_vo = slot3

		if slot0.select_cell then
			slot0.select_cell:setSelected(true)
		end
	end
end

function ActionHeroResetSelectPanel.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	uv0:openActionHeroResetSelectPanel(false)
end
