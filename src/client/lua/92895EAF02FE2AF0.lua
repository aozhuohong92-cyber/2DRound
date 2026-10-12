HeroUpgradeStarSelectPanel = HeroUpgradeStarSelectPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.remove

function HeroUpgradeStarSelectPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "hero/hero_upgrade_star_select_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "txt_cn_hero_temp_01"),
			type = ResourcesType.single
		}
	}
end

function HeroUpgradeStarSelectPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N("请选择材料英雄"))

	slot0.label_select = slot0.main_container:getChildByName("label_select")
	slot0.label_tip = slot0.main_container:getChildByName("label_tip")

	slot0.label_tip:setString(TI18N("(100%返还材料英雄升级、进阶消耗的贝里、经验和突破卡)"))

	slot0.lay_scrollview = slot0.main_container:getChildByName("lay_scrollview")
	slot0.select_btn = slot0.main_container:getChildByName("select_btn")
	slot0.select_btn_label = slot0.select_btn:getChildByName("label")

	slot0.select_btn_label:setString(TI18N("选 择"))

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")
	slot0.right_btn_label = slot0.right_btn:getChildByName("label")

	UITool.SetTitleColor(slot0.right_btn_label)
	slot0.right_btn_label:setString(TI18N("确 定"))
end

function HeroUpgradeStarSelectPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.select_btn, handler(slot0, slot0.onClickBtnSelect), true, 2)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickBtnRight), true, 2)
	slot0:addGlobalEvent(TipsEvent.TipsGoToEvent, function ()
		uv0:onClickBtnClose()
	end)
end

function HeroUpgradeStarSelectPanel.onClickBtnClose(slot0)
	uv0:openHeroUpgradeStarSelectPanel(false)
end

function HeroUpgradeStarSelectPanel.onClickBtnSelect(slot0)
	if not slot0.select_data then
		return
	end

	if slot0.select_data.star <= 4 then
		slot0:onKeySelect()
	else
		slot0:onClickBtnRight()
	end
end

function HeroUpgradeStarSelectPanel.onClickBtnRight(slot0)
	if not slot0.select_data then
		return
	end

	slot0.select_data.dic_select_list = slot0.dic_cur_select_list

	GlobalEvent:getInstance():Fire(HeroEvent.Upgrade_Star_Select_Event)
	slot0:onClickBtnClose()
end

function HeroUpgradeStarSelectPanel.openRootWnd(slot0, slot1, slot2, slot3, slot4)
	if not slot1 then
		return
	end

	slot0.form_type = slot3 or HeroConst.SelectHeroType.eStarFuse
	slot0.select_data = slot1
	slot5 = slot4 or {}
	slot0.is_master = slot5.is_master or false
	slot0.self_mark_bid = slot5.self_mark_bid

	if slot0.is_master then
		slot0.lock_type_list = {
			HeroConst.LockType.eHeroChangeLock
		}
	end

	slot0.hero_list = {}
	slot0.dic_cur_select_list = {}

	slot0:initHeroList(slot2)

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
	slot0:updateSelectLabel()

	if slot0.main_container and slot0.select_data.star and slot0.select_data.star <= 4 then
		if slot0.select_btn_label then
			slot0.select_btn_label:setString(TI18N("一键选取"))
		end

		slot0.select_btn:setPositionX(slot0.main_container:getContentSize().width * 0.2)
		slot0.right_btn:setVisible(true)
	end
end

function HeroUpgradeStarSelectPanel.checkSource(slot0)
	if not slot0.select_data then
		return
	end

	if slot0.select_data.bid == 0 then
		if slot0.select_data.star and slot0.select_data.star >= 7 then
			slot0.is_not_source = true
		end
	elseif Config.PartnerData.data_partner_star(getNorKey(slot0.select_data.bid, slot0.select_data.star)).source[1] == nil then
		-- Nothing
	elseif type(slot2.source[1]) == "number" then
		if slot2.source[1] == 1 then
			slot0.is_not_source = true
		end
	elseif type(slot2.source[1]) == "table" then
		return slot2
	end
end

function HeroUpgradeStarSelectPanel.initHeroList(slot0, slot1)
	if not slot0.select_data then
		return
	end

	slot2 = slot1 or {}
	slot3 = slot0.select_data.dic_select_list
	slot5 = uv0:getAllHeroArray():GetSize()

	if slot0.form_type == HeroConst.SelectHeroType.eTenConvert then
		if slot0.select_data.hero_list then
			slot0.hero_list = slot0.select_data.hero_list
		else
			slot0.hero_list = {}
		end

		if slot3 then
			for slot9, slot10 in pairs(slot3) do
				slot0.dic_cur_select_list[slot10.id] = slot10
			end
		end
	elseif slot0.form_type == HeroConst.SelectHeroType.eResonate then
		for slot9 = 1, slot5 do
			if slot4:Get(slot9 - 1) and not slot10:isResonateHero() and slot0.select_data.star <= slot10.star and slot2[slot10.id] == nil then
				if slot3[slot10.id] then
					slot0.dic_cur_select_list[slot10.id] = slot10
				else
					uv1(slot0.hero_list, slot10)
				end
			end
		end
	elseif slot0.select_data.bid == 0 then
		for slot9 = 1, slot5 do
			if slot4:Get(slot9 - 1) and not slot10:isResonateHero() and (slot0.select_data.camp_type == 0 or slot10.camp_type == slot0.select_data.camp_type) and slot10.star == slot0.select_data.star and slot2[slot10.id] == nil then
				if slot3[slot10.id] then
					slot0.dic_cur_select_list[slot10.id] = slot10
				end

				uv1(slot0.hero_list, slot10)
			end
		end

		if not slot0.select_data.is_ignore_hero_hun then
			slot6 = BackpackController:getInstance():getModel():getHeroHunList()

			if slot0.item_list == nil then
				slot0.item_list = {}
			end

			for slot10, slot11 in pairs(slot6) do
				if slot11.config and slot11.config.camp_type == slot0.select_data.camp_type and slot11.config.eqm_jie == slot0.select_data.star then
					for slot15 = 1, slot11.quantity do
						slot16 = {
							id = -(slot15 + slot11.config.camp_type * 10)
						}
						slot16.partner_id = slot16.id
						slot16.is_hero_hun = true
						slot16.good_vo = slot11

						if slot3[slot16.id] then
							slot0.dic_cur_select_list[slot16.id] = slot16
						end

						uv1(slot0.item_list, slot16)
					end
				end
			end
		end
	else
		for slot9 = 1, slot5 do
			if slot4:Get(slot9 - 1) and not slot10:isResonateHero() and slot10.bid == slot0.select_data.bid and slot10.star == slot0.select_data.star and slot2[slot10.id] == nil then
				if slot3[slot10.id] then
					slot0.dic_cur_select_list[slot10.id] = slot10
				end

				uv1(slot0.hero_list, slot10)
			end
		end
	end
end

function HeroUpgradeStarSelectPanel.updateSelectLabel(slot0)
	if not slot0.label_select then
		return
	end

	if not slot0.select_data then
		return
	end

	for slot5, slot6 in pairs(slot0.dic_cur_select_list) do
		slot1 = 0 + 1
	end

	slot0.label_select:setString(uv0("%s:%s/%s", TI18N("已选择"), slot1, slot0.select_data.count))
end

function HeroUpgradeStarSelectPanel.updateHeroList(slot0)
	if slot0.list_view == nil then
		if tolua.isnull(slot0.lay_scrollview) then
			return
		end

		slot3 = slot0.lay_scrollview:getContentSize()
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(640, 250), {
			start_y = 5,
			row = 0,
			start_x = 0,
			space_x = 0,
			item_width = 128,
			item_height = 140,
			space_y = 0,
			col = 5,
			need_dynamic = true
		}, cc.p(0, 0))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	table.sort(slot0.hero_list, function (slot0, slot1)
		slot2, slot3 = nil

		if uv0.is_master then
			slot2 = slot0.is_lock or 0
			slot3 = slot1.is_lock or 0
		else
			slot2 = slot0:checkHeroLockTips(true, nil, true) and 1 or 0
			slot3 = slot1:checkHeroLockTips(true, nil, true) and 1 or 0
		end

		if slot2 == slot3 then
			if slot0.lev == slot1.lev then
				return slot0.sort_order < slot1.sort_order
			else
				return slot1.lev < slot0.lev
			end
		else
			return slot2 < slot3
		end
	end)

	if slot0.item_list then
		for slot5, slot6 in ipairs(slot0.item_list) do
			uv0(slot0.hero_list, 1, slot6)
		end
	end

	if slot0.form_type == HeroConst.SelectHeroType.eResonate then
		for slot5, slot6 in pairs(slot0.dic_cur_select_list) do
			uv0(slot0.hero_list, 1, slot6)
		end
	end

	slot0.list_view:reloadData()
end

function HeroUpgradeStarSelectPanel.createNewCell(slot0, slot1, slot2)
	slot3 = HeroExhibitionItem.new(0.9, true)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function HeroUpgradeStarSelectPanel.numberOfCells(slot0)
	if slot0.is_not_source then
		return #slot0.hero_list
	else
		return #slot0.hero_list + 1
	end
end

function HeroUpgradeStarSelectPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2
	slot3, slot4 = slot1:getPosition()

	slot1:setPosition(slot3, slot4 + 10)

	if slot0.hero_list[slot2] then
		if slot5.is_hero_hun then
			slot1:setData(slot5)

			if slot5.good_vo.config then
				slot1:setQualityImg(slot5.good_vo.config.eqm_jie - 1)
				slot1:setDefaultHead(slot5.good_vo.config.icon)

				slot1.star_setting = slot1:createStar(slot5.good_vo.config.eqm_jie, slot1.star_con, slot1.star_setting)

				slot1:setCampImg(slot5.good_vo.config.camp_type)
				slot1:setHeroName(true, slot5.good_vo.config.name)
			end

			slot1:setLev(nil)
			slot1:showLockIcon(false)
			slot1:showSelfMarkImg(false)
		else
			slot1:setData(slot5)
			slot1:setHeroName(true, slot5.name)

			slot6 = false

			slot1:showLockIcon((not slot0.is_master or slot5:checkHeroLockTips(false, slot0.lock_type_list, true) and true or false) and (slot0.form_type == HeroConst.SelectHeroType.eResonate and (not slot0.select_data or not slot0.select_data.dic_select_list[slot5.id] or false) and (slot5:isLock() or slot5.isInForm and slot5:isInForm()) or slot5:isLock() or slot5.isInForm and slot5:isInForm()))

			if slot1.showSelfMarkImg then
				if not slot0.dic_cur_select_list[slot5.id] and slot0.self_mark_bid and slot0.self_mark_bid == slot5.bid then
					slot1:showSelfMarkImg(true)
				else
					slot1:showSelfMarkImg(false)
				end
			end
		end

		if slot0.dic_cur_select_list[slot5.id] then
			slot1:setSelected(true)
		else
			slot1:setSelected(false)
		end

		slot1:showAddIcon(false)
		slot1:setHeroNameColor(cc.c4b(144, 93, 56, 255))
	else
		slot1:setData(nil)
		slot1:showAddIcon(true)
		slot1:setHeroName(false)
		slot1:setSelected(false)
	end
end

function HeroUpgradeStarSelectPanel.onCellTouched(slot0, slot1)
	if slot0.hero_list[slot1.index] then
		slot0:selectHero(slot1, slot3)
	else
		slot4 = nil

		if slot0.select_data.bid == 0 then
			slot4 = uv0:getSourceHeroCombinationByCampStar(slot0.select_data.camp_type, slot0.select_data.star)
		else
			if slot0.source_config then
				BackpackController:getInstance():openTipsOnlySource(true, slot0.source_config)

				return
			end

			slot4 = (Config.PartnerData.data_partner_base[slot0.select_data.bid] or {}).item_id
		end

		if slot4 and Config.ItemData.data_get_data(slot4) then
			BackpackController:getInstance():openTipsOnlySource(true, slot5)
		end
	end
end

function HeroUpgradeStarSelectPanel.selectHero(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	if not slot1 then
		return
	end

	if not slot2.is_hero_hun then
		if slot0.is_master then
			if slot2:checkHeroLockTips(false, slot0.lock_type_list) then
				return
			end
		elseif slot0.form_type == HeroConst.SelectHeroType.eResonate then
			if slot0.select_data and slot0.select_data.dic_select_list[slot2.id] == nil and slot2:checkHeroLockTips(true) then
				return
			end
		elseif slot2:checkHeroLockTips(true) then
			return
		end
	end

	if slot0.form_type == HeroConst.SelectHeroType.eResonate then
		-- Nothing
	end

	if slot0.dic_cur_select_list[slot2.id] then
		slot1:setSelected(false)

		slot0.dic_cur_select_list[slot2.id] = nil
	else
		for slot7, slot8 in pairs(slot0.dic_cur_select_list) do
			slot3 = 0 + 1
		end

		if slot0.select_data.count <= slot3 then
			message(TI18N("选择数量已满"))

			return
		end

		if slot0.form_type == HeroConst.SelectHeroType.eTenConvert then
			slot4 = nil

			for slot8, slot9 in pairs(slot0.dic_cur_select_list) do
				slot4 = slot9

				break
			end

			if slot4 and slot2.bid ~= slot4.bid then
				message(TI18N("无法选择不一样的材料英雄"))

				return
			end
		end

		slot0.dic_cur_select_list[slot2.id] = slot2

		slot1:setSelected(true)
	end

	if slot1.showSelfMarkImg then
		if not slot0.dic_cur_select_list[slot2.id] and slot0.self_mark_bid and slot0.self_mark_bid == slot2.bid then
			slot1:showSelfMarkImg(true)
		else
			slot1:showSelfMarkImg(false)
		end
	end

	if slot0.form_type == HeroConst.SelectHeroType.eResonate and slot0.select_data and slot0.select_data.dic_select_list[slot2.id] then
		slot3 = false

		for slot7, slot8 in pairs(slot0.select_data.dic_select_list) do
			for slot12, slot13 in pairs(slot0.dic_cur_select_list) do
				if slot12 == slot7 then
					slot3 = true

					break
				end
			end
		end

		if slot3 then
			slot0.select_btn_label:setString(TI18N("取消选择"))
		else
			slot0.select_btn_label:setString(TI18N("选 择"))
		end
	end

	slot0:updateSelectLabel()
end

function HeroUpgradeStarSelectPanel.onKeySelect(slot0)
	if not slot0.select_data then
		return
	end

	for slot5, slot6 in pairs(slot0.dic_cur_select_list) do
		slot1 = 0 + 1
	end

	if slot0.select_data.count <= slot1 then
		return
	end

	slot2 = false
	slot3 = slot0.select_data.count - slot1

	for slot7, slot8 in ipairs(slot0.hero_list) do
		if slot3 > 0 and slot0:checkSelect(slot8) and slot0.dic_cur_select_list[slot8.id] == nil then
			slot0.dic_cur_select_list[slot8.id] = slot8
			slot2 = true

			if slot3 - 1 == 0 then
				break
			end
		end
	end

	if slot2 then
		if slot0.list_view then
			slot0.list_view:resetCurrentItems()
		end

		slot0:updateSelectLabel()
	end
end

function HeroUpgradeStarSelectPanel.checkSelect(slot0, slot1)
	if not slot1 then
		return false
	end

	if not slot1.is_hero_hun then
		if slot0.is_master then
			if slot1:checkHeroLockTips(false, slot0.lock_type_list, true) then
				return false
			end
		elseif slot0.form_type == HeroConst.SelectHeroType.eResonate then
			if slot0.select_data and slot0.select_data.dic_select_list[slot1.id] == nil and slot1:checkHeroLockTips(true, nil, true) then
				return false
			end
		elseif slot1:checkHeroLockTips(true, nil, true) then
			return false
		end
	end

	return true
end

function HeroUpgradeStarSelectPanel.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	uv0:openHeroUpgradeStarSelectPanel(false)
end
