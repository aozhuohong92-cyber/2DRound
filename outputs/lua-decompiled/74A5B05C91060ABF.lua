RoleHeroShowFormPanel = RoleHeroShowFormPanel or BaseClass(BaseView)
slot1 = RoleController:getInstance():getModel()
slot2 = HeroController:getInstance():getModel()
slot3 = string.format
slot4 = table.insert
slot5 = table.remove
slot6 = table.sort

function RoleHeroShowFormPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "roleinfo/role_hero_show_form_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("roleheroshow", "roleheroshow"),
			type = ResourcesType.plist
		}
	}
	slot0.dic_hero_data = {}
end

function RoleHeroShowFormPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.add_res = PathTool.getResFrame("roleheroshow", "roleheroshow_01")
	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("展示设置"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.btn_save = slot0.main_container:getChildByName("btn_save")

	slot0.btn_save:getChildByName("label"):setString(TI18N("保存"))

	slot0.item_list = {}
	slot2 = HeroExhibitionItem.Width * 0.8

	for slot6 = 1, 5 do
		slot7 = slot0.main_container:getChildByName("item_bg_" .. slot6)
		slot0.item_list[slot6] = {
			item_btn = slot7
		}
		slot8 = slot7:getChildByName("item_node")
		slot0.item_list[slot6].hero_item = HeroExhibitionItem.new(0.8, true, 0, true)

		slot0.item_list[slot6].hero_item:setBgOpacity(128)
		slot8:addChild(slot0.item_list[slot6].hero_item)

		slot9, slot10 = slot8:getPosition()
		slot0.item_list[slot6].rect = cc.rect(slot9 - slot2 * 0.5, slot10 - slot2 * 0.5, slot2, slot2)
		slot0.item_list[slot6].change_img = slot7:getChildByName("lock_img")
	end

	slot3 = slot0.main_container:getChildByName("camp_node")
	slot0.camp_node = slot3
	slot0.camp_btn_list = {
		[0] = slot3:getChildByName("camp_btn0"),
		[HeroConst.CampType.eWater] = slot3:getChildByName("camp_btn1"),
		[HeroConst.CampType.eFire] = slot3:getChildByName("camp_btn2"),
		[HeroConst.CampType.eWind] = slot3:getChildByName("camp_btn3"),
		[HeroConst.CampType.eLight] = slot3:getChildByName("camp_btn4"),
		[HeroConst.CampType.eDark] = slot3:getChildByName("camp_btn5")
	}
	slot0.img_select = slot3:getChildByName("img_select")
	slot4, slot5 = slot0.camp_btn_list[0]:getPosition()

	slot0.img_select:setPosition(slot4 - 0.5, slot5 + 1)

	slot0.lay_srollview = slot0.main_container:getChildByName("lay_srollview")
	slot0.tip_name = slot0.main_container:getChildByName("tip_name")

	slot0.tip_name:setString(TI18N("长按可查看英雄信息"))
end

function RoleHeroShowFormPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.btn_save, handler(slot0, slot0.onClickBtnSave), true, 1)

	if slot0.item_list then
		slot0.long_touch_type = LONG_TOUCH_INIT_TYPE

		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5.hero_item:addTouchEventListener(function (slot0, slot1)
				if uv0.is_play_item_action then
					return
				end

				if uv0.hero_pos_list and uv0.hero_pos_list[uv1] == nil then
					return
				end

				if slot1 == ccui.TouchEventType.began then
					uv0.touch_began = slot0:getTouchBeganPosition()

					doStopAllActions(uv0.main_container)

					uv0.long_touch_type = LONG_TOUCH_BEGAN_TYPE

					delayRun(uv0.main_container, 0.6, function ()
						if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE and uv0.hero_pos_list[uv1] then
							HeroController:getInstance():openHeroTipsPanel(true, uv0.hero_pos_list[uv1])
						end

						uv0.long_touch_type = LONG_TOUCH_END_TYPE
					end)
				elseif slot1 == ccui.TouchEventType.moved then
					if uv0.long_touch_type == LONG_TOUCH_END_TYPE then
						return
					elseif uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
						slot3 = slot0:getTouchMovePosition()

						if uv0.touch_began and slot3 and (math.abs(slot3.x - slot2.x) > 20 or math.abs(slot3.y - slot2.y) > 20) then
							doStopAllActions(uv0.main_container)

							uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
						end
					end

					uv0:onClickHeroItemMove(uv1, slot0)
				elseif slot1 == ccui.TouchEventType.canceled then
					if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
						doStopAllActions(uv0.main_container)

						uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
					elseif uv0.long_touch_type == LONG_TOUCH_END_TYPE then
						if uv0.move_hero_item then
							uv0.move_hero_item:setPosition(-10000, 0)
						end

						uv0:setHeroItemData(uv2.hero_item, uv0.hero_pos_list[uv1])

						return
					end

					uv0:onClickHeroItemCanceled(uv1, slot0)
				elseif slot1 == ccui.TouchEventType.ended then
					if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
						doStopAllActions(uv0.main_container)

						uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
					elseif uv0.long_touch_type == LONG_TOUCH_END_TYPE then
						if uv0.move_hero_item then
							uv0.move_hero_item:setPosition(-10000, 0)
						end

						uv0:setHeroItemData(uv2.hero_item, uv0.hero_pos_list[uv1])

						return
					end

					uv0:onClickHeroItemEnd(uv1, slot0)
				end
			end)
		end
	end

	if slot0.camp_btn_list then
		for slot4, slot5 in pairs(slot0.camp_btn_list) do
			registerButtonEventListener(slot5, function ()
				uv0:onClickBtnShowByIndex(uv1)
			end, true, 2)
		end
	end

	slot0:addGlobalEvent(HeroEvent.Update_Fun_Form, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
	slot0:addGlobalEvent(HeroEvent.Update_Save_Form, function (slot0)
		if not slot0 then
			return
		end

		if slot0.type == PartnerConst.Fun_Form.PersonalSpace then
			message(TI18N("保存英雄展示成功"))
			HeroController:getInstance():sender11211(PartnerConst.Fun_Form.PersonalSpace)
		end
	end)
end

function RoleHeroShowFormPanel.onClickBtnClose(slot0)
	uv0:openRoleHeroShowFormPanel(false)
end

function RoleHeroShowFormPanel.onClickBtnSave(slot0)
	if slot0.is_play_item_action then
		return
	end

	if not slot0.hero_pos_list then
		return
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0.hero_pos_list) do
		uv0(slot1, {
			pos = slot5,
			id = slot6.partner_id
		})
	end

	HeroController:getInstance():sender11212(PartnerConst.Fun_Form.PersonalSpace, 1, slot1, 0)
end

function RoleHeroShowFormPanel.onClickBtnShowByIndex(slot0, slot1)
	if slot0.img_select and slot0.camp_btn_list[slot1] then
		slot2, slot3 = slot0.camp_btn_list[slot1]:getPosition()

		slot0.img_select:setPosition(slot2 - 0.5, slot3 + 1)
	end

	slot0:updateHeroList(slot1)
end

function RoleHeroShowFormPanel.setHeroItemData(slot0, slot1, slot2)
	if slot2 then
		slot1:setData(slot2)
		slot1:showAddIcon(false)
		slot1:setBgOpacity(255)
	else
		slot1:setData(nil)
		slot1:showAddIcon(true, slot0.add_res)
		slot1:setBgOpacity(128)
	end
end

function RoleHeroShowFormPanel.onClickHeroItemMove(slot0, slot1, slot2)
	if not slot0.hero_pos_list then
		return
	end

	slot0.is_move_hero = true

	if slot0.move_hero_item == nil then
		slot0.move_hero_item = HeroExhibitionItem.new(0.8, false)

		slot0.main_container:addChild(slot0.move_hero_item, 1)
	end

	slot0.move_hero_item:setData(slot0.hero_pos_list[slot1])
	slot0:setHeroItemData(slot0.item_list[slot1].hero_item, nil)
	slot0.move_hero_item:setPosition(slot0.main_container:convertToNodeSpace(slot2:getTouchMovePosition()))
end

function RoleHeroShowFormPanel.onClickHeroItemCanceled(slot0, slot1, slot2)
	if not slot0.hero_pos_list then
		return
	end

	slot0.is_move_hero = false

	if slot0.move_hero_item then
		slot0.move_hero_item:setPosition(-10000, 0)
	end

	for slot7, slot8 in ipairs(slot0.item_list) do
		if cc.rectContainsPoint(slot8.rect, slot8.item_btn:convertToNodeSpace(slot2:getTouchMovePosition())) and slot7 ~= slot1 then
			slot10 = slot0.hero_pos_list[slot7]
			slot0.hero_pos_list[slot7] = slot0.hero_pos_list[slot1]

			slot0:setHeroItemData(slot8.hero_item, slot0.hero_pos_list[slot7])
			slot0:setHeroItemData(slot0.item_list[slot1].hero_item, slot10)

			if slot10 ~= nil then
				slot0.hero_pos_list[slot1] = slot10
			else
				slot0.hero_pos_list[slot1] = nil
			end

			return
		end
	end

	slot0:setHeroItemData(slot0.item_list[slot1].hero_item, slot0.hero_pos_list[slot1])
end

function RoleHeroShowFormPanel.onClickHeroItemEnd(slot0, slot1, slot2)
	if not slot0.hero_pos_list then
		return
	end

	if slot0.move_hero_item then
		slot0.move_hero_item:setPosition(-10000, 0)
	end

	if slot0.list_view then
		for slot7, slot8 in ipairs(slot0.list_view:getActiveCellList() or {}) do
			if slot8:getData() and slot9.partner_id == slot0.hero_pos_list[slot1].partner_id then
				slot8:setSelected(false)

				slot12, slot13 = slot0.item_list[slot1].item_btn:getPosition()

				slot0:showMoveEffect(cc.p(slot12, slot13), slot0.main_container:convertToNodeSpace(slot8:convertToWorldSpace(cc.p(HeroExhibitionItem.Width * 0.5, HeroExhibitionItem.Height * 0.5))), slot9)
				slot0:setHeroItemData(slot0.item_list[slot1].hero_item, nil)

				slot0.hero_pos_list[slot1] = nil
				slot0.dic_hero_data[slot9.id] = nil

				return
			end
		end
	end

	if slot0.camp_btn_list[slot0.hero_pos_list[slot1].camp_type] == nil then
		slot4 = slot0.camp_btn_list[0]
	end

	slot7, slot8 = slot0.item_list[slot1].item_btn:getPosition()

	slot0:showMoveEffect(cc.p(slot7, slot8), slot0.main_container:convertToNodeSpace(slot4:convertToWorldSpace(cc.p(29, 29))), slot3)
	slot0:setHeroItemData(slot0.item_list[slot1].hero_item, nil)

	slot0.dic_hero_data[slot3.id] = nil
	slot0.hero_pos_list[slot1] = nil
end

function RoleHeroShowFormPanel.showMoveEffect(slot0, slot1, slot2, slot3, slot4)
	slot0.is_play_item_action = true

	if slot0.move_hero_item == nil then
		slot0.move_hero_item = HeroExhibitionItem.new(0.8, false)

		slot0.main_container:addChild(slot0.move_hero_item, 1)
	end

	slot0.move_hero_item:setData(slot3)
	slot0.move_hero_item:setPosition(slot1)
	slot0.move_hero_item:runAction(cc.Sequence:create(cc.MoveTo:create(0.2, slot2), cc.CallFunc:create(function ()
		if uv0.move_hero_item then
			uv0.move_hero_item:setPosition(-10000, 0)
		end

		uv0.is_play_item_action = false

		if uv1 then
			uv1()
		end
	end)))
end

function RoleHeroShowFormPanel.openRootWnd(slot0, slot1)
	HeroController:getInstance():sender11211(PartnerConst.Fun_Form.PersonalSpace)
end

function RoleHeroShowFormPanel.setData(slot0, slot1)
	slot0.dic_hero_data = {}
	slot0.hero_pos_list = {}

	if slot1 and slot1.pos_info then
		for slot5, slot6 in ipairs(slot1.pos_info) do
			slot7 = uv0:getHeroById(slot6.id)
			slot0.hero_pos_list[slot6.pos] = slot7
			slot0.dic_hero_data[slot6.id] = slot7
		end
	end

	if slot0.item_list then
		for slot5, slot6 in ipairs(slot0.item_list) do
			if slot0.hero_pos_list[slot5] then
				slot0:updateItemByindex(slot5, slot0.hero_pos_list[slot5])
			else
				slot0:updateItemByindex(slot5)
			end
		end
	end

	slot0:updateHeroList(slot0.select_camp)
end

function RoleHeroShowFormPanel.updateItemByindex(slot0, slot1, slot2)
	if slot0.item_list[slot1] then
		slot0.item_list[slot1].change_img:setVisible(false)

		if slot2 then
			slot0.item_list[slot1].hero_item:setData(slot2)
			slot0.item_list[slot1].hero_item:setBgOpacity(255)
			slot0.item_list[slot1].hero_item:showAddIcon(false)
		else
			slot0.item_list[slot1].hero_item:setData(nil)
			slot0.item_list[slot1].hero_item:setBgOpacity(128)
			slot0.item_list[slot1].hero_item:showAddIcon(true, slot0.add_res)
		end
	end
end

function RoleHeroShowFormPanel.showChangeImg(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		if slot0.hero_pos_list[slot4] then
			slot5.change_img:setVisible(true)

			slot5.can_touch = true
		else
			slot5.change_img:setVisible(false)
		end
	end
end

function RoleHeroShowFormPanel.checkHeroEmptyList(slot0)
	if not slot0.hero_pos_list then
		return false
	end

	for slot4, slot5 in ipairs(slot0.item_list) do
		if slot0.hero_pos_list[slot4] == nil then
			return true, slot4
		end
	end

	return false
end

function RoleHeroShowFormPanel.getHeroListByCamp(slot0, slot1)
	slot3 = {}

	for slot7, slot8 in pairs(uv0:getHeroList()) do
		if slot8 and not slot8:isResonateHero() and (slot1 == 0 or slot1 == slot8.camp_type) then
			uv1(slot3, slot8)
		end
	end

	uv2(slot3, SortTools.tableUpperSorter({
		"star",
		"lev",
		"camp_type",
		"bid",
		"sort_order"
	}))

	return slot3
end

function RoleHeroShowFormPanel.updateHeroList(slot0, slot1)
	if not slot0.lay_srollview then
		return
	end

	if slot0.select_camp and (slot1 or 0) == slot0.select_camp then
		return
	end

	if slot0.list_view == nil then
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.lay_srollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.lay_srollview:getContentSize(), {
			start_y = 0,
			row = 0,
			start_x = 1,
			space_x = 0,
			item_width = 120,
			item_height = 120,
			space_y = 0,
			col = 5,
			need_dynamic = true
		}, cc.p(0, 0))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.select_camp = slot2
	slot0.show_list = slot0:getHeroListByCamp(slot0.select_camp)

	slot0.list_view:reloadData()

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.lay_srollview, true, {
			text = TI18N("暂无该类型英雄")
		})
	else
		commonShowEmptyIcon(slot0.lay_srollview, false)
	end
end

function RoleHeroShowFormPanel.createNewCell(slot0, slot1, slot2)
	slot3 = HeroExhibitionItem.new(0.9, true)

	slot3:setLongTimeTouchEffect(true)
	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function RoleHeroShowFormPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function RoleHeroShowFormPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)

	if slot0.dic_hero_data[slot3.id] then
		slot1:setSelected(true)
	else
		slot1:setSelected(false)
	end
end

function RoleHeroShowFormPanel.onCellTouched(slot0, slot1)
	if slot0.is_play_item_action then
		return
	end

	if not slot0.dic_hero_data then
		return
	end

	if not slot0.show_list[slot1.index] then
		return
	end

	if slot0.dic_hero_data[slot3.partner_id] ~= nil then
		slot4 = -1

		for slot8, slot9 in pairs(slot0.hero_pos_list) do
			if slot9.partner_id == slot3.partner_id then
				slot4 = slot8

				break
			end
		end

		if slot4 == -1 then
			return
		end

		if slot0.item_list[slot4] == nil then
			return
		end

		slot1:setSelected(false)

		slot7, slot8 = slot0.item_list[slot4].item_btn:getPosition()

		slot0:showMoveEffect(cc.p(slot7, slot8), slot0.main_container:convertToNodeSpace(slot1:convertToWorldSpace(cc.p(HeroExhibitionItem.Width * 0.5, HeroExhibitionItem.Height * 0.5))), slot3)
		slot0:setHeroItemData(slot0.item_list[slot4].hero_item, nil)

		slot0.hero_pos_list[slot4] = nil
		slot0.dic_hero_data[slot3.partner_id] = nil
	else
		slot4, slot5 = slot0:checkHeroEmptyList()

		if slot4 then
			slot8, slot9 = slot0.item_list[slot5].item_btn:getPosition()

			slot0:showMoveEffect(slot0.main_container:convertToNodeSpace(slot1:convertToWorldSpace(cc.p(HeroExhibitionItem.Width * 0.5, HeroExhibitionItem.Height * 0.5))), cc.p(slot8, slot9), slot3, function ()
				if uv0.item_list and uv0.item_list[uv1] then
					uv0.hero_pos_list[uv1] = uv2
					uv0.dic_hero_data[uv2.partner_id] = uv2

					uv0:setHeroItemData(uv0.item_list[uv1].hero_item, uv2)
				end
			end)
			slot1:setSelected(true)
		else
			message(TI18N("展示英雄已满"))
		end
	end
end

function RoleHeroShowFormPanel.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.item_load_title_img then
		slot0.item_load_title_img:DeleteMe()

		slot0.item_load_title_img = nil
	end

	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.item_load then
				slot5.item_load:DeleteMe()

				slot5.item_load = nil
			end
		end
	end

	doStopAllActions(slot0.main_containe)
	uv0:openRoleHeroShowFormPanel(false)
end
