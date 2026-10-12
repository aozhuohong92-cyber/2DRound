HeroSelectHeroPanel = HeroSelectHeroPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.remove

function HeroSelectHeroPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.is_full_screen = false
	slot0.layout_name = "hero/hero_select_hero_panel"
	slot0.res_list = {}
end

function HeroSelectHeroPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N("请选择英雄"))

	slot0.lay_scrollview = slot0.main_container:getChildByName("lay_scrollview")
	slot0.cancel_btn = slot0.main_container:getChildByName("cancel_btn")
	slot0.cancel_btn_label = slot0.cancel_btn:getChildByName("label")

	slot0.cancel_btn_label:setString(TI18N("取 消"))

	slot0.common_btn = slot0.main_container:getChildByName("common_btn")
	slot0.common_btn_label = slot0.common_btn:getChildByName("label")

	slot0.common_btn_label:setString(TI18N("确 定"))

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
end

function HeroSelectHeroPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.cancel_btn, handler(slot0, slot0._onClickBtnCancel), true, 2)
	registerButtonEventListener(slot0.common_btn, handler(slot0, slot0._onClickBtnComfirm), true, 2)
	slot0:addGlobalEvent(TipsEvent.TipsGoToEvent, function ()
		uv0:_onClickBtnClose()
	end)
end

function HeroSelectHeroPanel._onClickBtnClose(slot0)
	uv0:openHeroSelectHeroPanel(false)
end

function HeroSelectHeroPanel._onClickBtnCancel(slot0)
	slot0:_onClickBtnClose()
end

function HeroSelectHeroPanel._onClickBtnComfirm(slot0)
	if not slot0.dic_cur_select_list then
		return
	end

	GlobalEvent:getInstance():Fire(HeroEvent.Select_Hero_Event, slot0.dic_cur_select_list, slot0.form_type)
	slot0:_onClickBtnClose()
end

function HeroSelectHeroPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.select_condition = slot2.select_condition or {}
	slot0.dic_selected = slot2.dic_selected or {}
	slot0.dic_filter_selected = slot2.dic_filter_selected or {}
	slot0.select_count = slot2.select_count or 1
	slot0.form_type = slot2.form_type or 0
	slot3 = slot2.tips or ""
	slot0.hero_list = {}
	slot0.dic_cur_select_list = {}

	slot0:initHeroList()

	slot0.is_not_source = false
	slot0.source_config = slot0:checkSource()

	if slot0.is_not_source then
		if #slot0.hero_list == 0 and #(slot0.item_list or {}) == 0 then
			commonShowEmptyIcon(slot0.lay_scrollview, true, {
				font_size = 22,
				scale = 1,
				text = TI18N("空空如也")
			})

			return
		end
	end

	slot0:updateHeroList()
end

function HeroSelectHeroPanel.checkSource(slot0)
	slot2 = slot0.select_condition.star

	if (slot0.select_condition.bid or 0) == 0 then
		if slot2 and slot2 >= 7 or (slot0.select_condition.star_start or 0) > 7 then
			slot0.is_not_source = true
		end
	elseif slot2 then
		return function (slot0, slot1)
			if not Config.PartnerData.data_partner_star(getNorKey(slot0, slot1)) then
				uv0.is_not_source = true

				return
			end

			if slot3.source[1] == nil then
				-- Nothing
			elseif type(slot3.source[1]) == "number" then
				if slot3.source[1] == 1 then
					uv0.is_not_source = true
				end
			elseif type(slot3.source[1]) == "table" then
				return slot3
			end
		end(slot1, slot2)
	else
		if slot3 == 0 and (slot0.select_condition.star_end or 0) == 0 then
			if Config.PartnerData.data_partner_base(slot1) then
				slot3 = slot6.init_star
				slot5 = slot6.init_star
				slot0.select_condition.star_start = slot3
				slot0.select_condition.star_end = slot3
			else
				slot0.is_not_source = true

				return
			end
		end

		return slot4(slot1, slot3)
	end
end

function HeroSelectHeroPanel.initHeroList(slot0)
	slot1 = slot0.dic_filter_selected or {}
	slot2 = slot0.dic_selected or {}
	slot4 = uv0:getAllHeroArray():GetSize()
	slot6 = {}

	if (slot0.select_condition.bid or 0) == 0 then
		slot7 = slot0.select_condition.camp_type or 0

		for slot11 = 1, slot4 do
			if slot3:Get(slot11 - 1) and not slot12:isResonateHero() and (slot7 == 0 or slot12.camp_type == slot7) and slot1[slot12.id] == nil then
				if slot0.select_count == 1 then
					if slot2[slot12.id] then
						slot0.dic_cur_select_list[slot12.id] = slot12
					else
						uv1(slot6, slot12)
					end
				else
					if slot2[slot12.id] then
						slot0.dic_cur_select_list[slot12.id] = slot12
					end

					uv1(slot6, slot12)
				end
			end
		end
	else
		for slot10 = 1, slot4 do
			if slot3:Get(slot10 - 1) and not slot11:isResonateHero() and slot11.bid == slot5 and slot1[slot11.id] == nil then
				if slot0.select_count == 1 then
					if slot2[slot11.id] then
						slot0.dic_cur_select_list[slot11.id] = slot11
					else
						uv1(slot6, slot11)
					end
				else
					if slot2[slot11.id] then
						slot0.dic_cur_select_list[slot11.id] = slot11
					end

					uv1(slot6, slot11)
				end
			end
		end
	end

	if #slot6 > 0 then
		if slot0.select_condition.star then
			for slot11, slot12 in ipairs(slot6) do
				if slot7 == slot12.star then
					uv1(slot0.hero_list, slot12)
				end
			end
		else
			for slot13, slot14 in ipairs(slot6) do
				if slot14 and (slot0.select_condition.star_start or 0) <= slot14.star and slot14.star <= (slot0.select_condition.star_end or 1000) then
					uv1(slot0.hero_list, slot14)
				end
			end
		end
	end

	if slot0.form_type == HeroConst.SelectHeroType.eResonateEmpowerment then
		slot7 = slot0.hero_list
		slot8 = slot0.select_condition.star_end or 0
		slot0.hero_list = {}

		if Config.PartnerData.data_partner_max_star then
			for slot13, slot14 in ipairs(slot7) do
				if slot9[slot14.bid] and slot8 <= slot9[slot14.bid] and slot14.star < slot8 then
					uv1(slot0.hero_list, slot14)
				end
			end
		end
	end

	if slot0.select_condition.max_lev then
		slot0.hero_list = {}

		for slot11, slot12 in ipairs(slot0.hero_list) do
			if slot12.lev <= slot7 then
				uv1(slot0.hero_list, slot12)
			end
		end
	end
end

function HeroSelectHeroPanel.getSortFun(slot0, slot1, slot2)
	if slot0.form_type == HeroConst.SelectHeroType.eResonateEmpowerment or slot0.form_type == HeroConst.SelectHeroType.eResonateCrystal or slot0.form_type == HeroConst.SelectHeroType.eResonateStone then
		if slot1.lev == slot2.lev then
			if slot1.star == slot2.star then
				if slot1.camp_type == slot2.camp_type then
					return slot1.sort_order < slot2.sort_order
				else
					return slot1.camp_type < slot2.camp_type
				end
			else
				return slot2.star < slot1.star
			end
		else
			return slot2.lev < slot1.lev
		end
	else
		slot3, slot4 = nil

		if (slot1.isInForm and slot1:isInForm() and 1 or slot1.is_lock) == (slot2.isInForm and slot2:isInForm() and 1 or slot2.is_lock) then
			if slot1.lev == slot2.lev then
				return slot1.sort_order < slot2.sort_order
			else
				return slot2.lev < slot1.lev
			end
		else
			return slot3 < slot4
		end
	end
end

function HeroSelectHeroPanel.updateHeroList(slot0)
	if slot0.list_view == nil then
		if tolua.isnull(slot0.lay_scrollview) then
			return
		end

		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.lay_scrollview:getContentSize(), {
			start_y = 4,
			row = 0,
			start_x = 0,
			space_x = 0,
			item_width = 140,
			item_height = 130,
			space_y = 0,
			col = 4,
			need_dynamic = true
		}, cc.p(0, 0))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end

	table.sort(slot0.hero_list, function (slot0, slot1)
		return uv0:getSortFun(slot0, slot1)
	end)

	if slot0.select_count == 1 then
		slot0.is_select = false

		for slot4, slot5 in pairs(slot0.dic_cur_select_list) do
			slot0.is_select = true

			uv0(slot0.hero_list, 1, slot5)
		end

		if slot0.form_type == HeroConst.SelectHeroType.eResonateStone then
			for slot4, slot5 in pairs(slot0.dic_filter_selected) do
				uv0(slot0.hero_list, slot5)
			end
		end

		if slot0.is_select then
			slot0.list_view:reloadData(1)
		else
			slot0.list_view:reloadData()
		end
	else
		slot0.list_view:reloadData()
	end
end

function HeroSelectHeroPanel.createNewCell(slot0, slot1, slot2)
	slot3 = HeroExhibitionItem.new(1, true)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function HeroSelectHeroPanel.numberOfCells(slot0)
	if slot0.is_not_source then
		return #slot0.hero_list
	else
		return #slot0.hero_list + 1
	end
end

function HeroSelectHeroPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.hero_list[slot2] then
		if slot3.is_hero_hun then
			slot1:setData(slot3)

			if slot3.good_vo.config then
				slot1:setQualityImg(slot3.good_vo.config.eqm_jie - 1)
				slot1:setDefaultHead(slot3.good_vo.config.icon)

				slot1.star_setting = slot1:createStar(slot3.good_vo.config.eqm_jie, slot1.star_con, slot1.star_setting)

				slot1:setCampImg(slot3.good_vo.config.camp_type)
			end

			slot1:setLev(nil)
			slot1:showLockIcon(false)
		else
			slot1:setData(slot3)

			slot4 = false

			slot1:showLockIcon(slot0.select_count == 1 and (not slot0.dic_selected or not slot0.dic_selected[slot3.id] or false) and (slot0.form_type ~= HeroConst.SelectHeroType.eResonateStone or slot0.dic_filter_selected[slot3.id] and true or false) and (slot0.form_type ~= HeroConst.SelectHeroType.eResonateEmpowerment or false) and (slot0.form_type ~= HeroConst.SelectHeroType.eResonateCrystal or false) and (slot3:isLock() or slot3.isInForm and slot3:isInForm()) or slot3:isLock() or slot3.isInForm and slot3:isInForm())
		end

		if slot0.dic_cur_select_list[slot3.id] then
			slot1:setSelected(true)
		else
			slot1:setSelected(false)
		end

		slot1:showAddIcon(false)
	else
		slot1:setData(nil)
		slot1:showAddIcon(true)
	end
end

function HeroSelectHeroPanel.onCellTouched(slot0, slot1)
	if slot0.hero_list[slot1.index] then
		slot0:selectHero(slot1, slot3)
	else
		if not slot0.select_condition then
			return
		end

		slot4 = nil

		if slot0.select_condition.bid == 0 then
			if slot0.select_condition.star then
				slot4 = uv0:getSourceHeroCombinationByCampStar(slot0.select_condition.camp_type, slot0.select_condition.star)
			else
				slot5 = slot0.select_condition.star_start or 0
				slot4 = uv0:getSourceHeroCombinationByCampStar(slot0.select_condition.camp_type, slot0.select_condition.star)
			end
		else
			if slot0.source_config then
				BackpackController:getInstance():openTipsOnlySource(true, slot0.source_config)

				return
			end

			slot4 = (Config.PartnerData.data_partner_base[slot0.select_condition.bid] or {}).item_id
		end

		if slot4 and Config.ItemData.data_get_data(slot4) then
			BackpackController:getInstance():openTipsOnlySource(true, slot5)
		end
	end
end

function HeroSelectHeroPanel.selectHero(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	if not slot1 then
		return
	end

	if slot0.select_count == 1 then
		if slot0.dic_selected and slot0.dic_selected[slot2.id] == nil then
			slot3 = false

			if slot0.form_type == HeroConst.SelectHeroType.eResonateStone then
				if slot0.dic_filter_selected[slot2.id] then
					slot3 = false

					message(TI18N("该英雄已在晶碑的其他阵位中"))

					return
				end
			else
				slot3 = (slot0.form_type ~= HeroConst.SelectHeroType.eResonateEmpowerment or false) and slot0.form_type ~= HeroConst.SelectHeroType.eResonateCrystal
			end

			if slot3 and slot2:checkHeroLockTips(true) then
				return
			end
		end
	elseif slot2:checkHeroLockTips(true) then
		return
	end

	if slot0.select_count == 1 then
		if slot0.single_select_cell then
			slot0.single_select_cell:setSelected(false)
		end

		if not slot0.is_select and slot0.dic_cur_select_list[slot2.id] then
			slot1:setSelected(false)

			slot0.dic_cur_select_list[slot2.id] = nil
		else
			slot0.single_select_cell = slot1

			if slot0.single_select_cell then
				slot0.single_select_cell:setSelected(true)
			end

			slot0.dic_cur_select_list = {
				[slot2.id] = slot2
			}
			slot0.is_select = false
		end
	elseif slot0.dic_cur_select_list[slot2.id] then
		slot1:setSelected(false)

		slot0.dic_cur_select_list[slot2.id] = nil
	else
		for slot7, slot8 in pairs(slot0.dic_cur_select_list) do
			slot3 = 0 + 1
		end

		if slot0.select_count <= slot3 then
			message(TI18N("选择数量已满"))

			return
		end

		slot0.dic_cur_select_list[slot2.id] = slot2

		slot1:setSelected(true)
	end
end

function HeroSelectHeroPanel.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	uv0:openHeroSelectHeroPanel(false)
end
