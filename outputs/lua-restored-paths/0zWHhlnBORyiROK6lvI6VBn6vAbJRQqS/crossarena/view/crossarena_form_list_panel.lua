slot1 = HeroController:getInstance():getModel()
slot2 = table.insert
CorssarenaFormListPanel = CorssarenaFormListPanel or BaseClass()

function CorssarenaFormListPanel.__init(slot0, slot1, slot2, slot3, slot4)
	slot0.is_init = true
	slot0.parent = slot1
	slot0.super_panel = slot2
	slot0.form_show_type = slot3
	slot0.fun_form_type = slot4
	slot0.team_panel_list = {}
	slot0.halo_load_list = {}
	slot0.is_move_hero = false
	slot0.is_show_act = false
	slot0.hide_two_team = CrossarenaController:getInstance():getModel():checkIsCanHideTwoTeam()

	slot0:createRoorWnd()
	slot0:registerEvent()
end

function CorssarenaFormListPanel.createRoorWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("crossarena/crossarena_form_list_panel"))

	if not tolua.isnull(slot0.parent) then
		slot0.root_wnd:setPosition(cc.p(-5, 362))
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0.container:setTouchEnabled(false)

	slot1 = 78

	for slot5 = 1, 3 do
		if slot0.container:getChildByName("team_panel_" .. slot5) then
			slot7 = slot6:getChildByName("box_name")

			slot7:setString(TI18N("隐藏"))
			slot6:getChildByName("team_name"):setString(TI18N("队伍" .. StringUtil.numToChinese(slot5)))

			slot8 = {
				box_name = slot7,
				team_panel = slot6,
				halo_btn = slot6:getChildByName("halo_btn"),
				formation_type = 1,
				form_icon = slot6:getChildByName("form_icon"),
				hide_btn = slot6:getChildByName("hide_btn"),
				hide_status = false,
				hide_status = true
			}

			if slot5 == 3 then
				-- Nothing
			end

			slot8.hide_btn:setSelected(slot8.hide_status)

			slot8.power_txt = slot6:getChildByName("power_txt")
			slot8.hallows_id = 0
			slot8.hallow_item = BackPackItem.new(false, true, false, 0.6)

			slot8.hallow_item:addCallBack(function ()
				uv0:onClickHallowBtn(uv1.hallows_id, uv2)
			end)
			slot8.hallow_item:showAddIcon(true)
			slot8.hallow_item:setPosition(cc.p(590, 58))
			slot6:addChild(slot8.hallow_item)

			slot8.hero_item_list = {}
			slot8.item_rect_list = {}
			slot12 = 103
			slot0.desc_scorll = createScrollView(500, slot12, 10, 1, slot6, ccui.ScrollViewDir.horizontal)

			for slot12 = 1, 6 do
				slot13 = HeroExhibitionItem.new(0.7, true, nil, false)

				slot13:setPosition(cc.p(slot1 + (slot12 - 1) * (HeroExhibitionItem.Width * 0.7 + 10), 52))
				slot0.desc_scorll:addChild(slot13)
				uv0(slot8.hero_item_list, slot13)

				slot17 = slot0.container:convertToNodeSpace(slot13:convertToWorldSpace(cc.p(0, 0)))

				uv0(slot8.item_rect_list, cc.rect(slot17.x, slot17.y, HeroExhibitionItem.Width * 0.7, HeroExhibitionItem.Height * 0.7))
			end

			if slot0.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
				slot8.box_name:setVisible(false)
				slot8.hide_btn:setVisible(false)

				if slot5 == 3 then
					slot8.three_label = createLabel(22, cc.c4b(104, 69, 42, 255), nil, 636, 124, TI18N("第三队隐藏"), slot6, nil, cc.p(1, 0.5))
				end
			else
				slot8.box_name:setVisible(slot0.form_show_type == HeroConst.FormShowType.eFormSave)
				slot8.hide_btn:setVisible(slot0.form_show_type == HeroConst.FormShowType.eFormSave)
			end

			uv0(slot0.team_panel_list, slot8)
		end
	end

	slot0.change_pos_btn_1 = slot0.container:getChildByName("change_pos_btn_1")
	slot0.change_pos_btn_2 = slot0.container:getChildByName("change_pos_btn_2")
	slot0.save_btn = slot0.container:getChildByName("save_btn")

	slot0.save_btn:getChildByName("label"):setString(TI18N("保存布阵"))
	slot0.save_btn:setPositionY(-456)
	slot0.save_btn:getChildByName("label"):enableOutline(cc.c3b(0, 0, 0), 2)

	slot0.go_fight_btn = slot0.container:getChildByName("go_fight_btn")

	slot0.go_fight_btn:getChildByName("label"):setString(TI18N("开战"))
	slot0.go_fight_btn:setPositionY(-456)
	slot0.save_btn:setVisible(slot0.form_show_type ~= HeroConst.FormShowType.eFormFight)
	slot0.go_fight_btn:setVisible(slot0.form_show_type == HeroConst.FormShowType.eFormFight)
	slot0:updateAllTeamInfo()
end

function CorssarenaFormListPanel.registerEvent(slot0)
	registerButtonEventListener(slot0.change_pos_btn_1, function ()
		uv0:onChangePosBtn(1)
	end, true)
	registerButtonEventListener(slot0.change_pos_btn_2, function ()
		uv0:onChangePosBtn(2)
	end, true)
	registerButtonEventListener(slot0.save_btn, handler(slot0, slot0.onClickSaveBtn), true)

	slot4 = handler(slot0, slot0.onClickGoFightBtn)
	slot5 = true

	registerButtonEventListener(slot0.go_fight_btn, slot4, slot5)

	slot0.long_touch_type = LONG_TOUCH_INIT_TYPE

	for slot4, slot5 in ipairs(slot0.team_panel_list) do
		if slot5.hide_btn then
			slot5.hide_btn:addEventListener(function (slot0, slot1)
				if slot1 == ccui.CheckBoxEventType.selected then
					playButtonSound2()
					uv0:onSelectHideBox(uv1)
				elseif slot1 == ccui.CheckBoxEventType.unselected then
					playButtonSound2()

					if uv0.hide_two_team then
						if uv0:getHideTeamCount() <= 1 then
							uv2.hide_btn:setSelected(true)
							message(TI18N("无法取消隐藏哦"))
						else
							uv2.hide_status = false
						end
					else
						uv2.hide_btn:setSelected(true)
						message(TI18N("无法取消隐藏哦"))
					end
				end
			end)
		end

		if slot5.hero_item_list then
			for slot9, slot10 in pairs(slot5.hero_item_list) do
				slot10:addTouchEventListener(function (slot0, slot1)
					if uv0.is_show_act == true then
						return
					end

					if not uv1:getData() and not uv0.is_move_hero then
						return
					end

					if slot1 == ccui.TouchEventType.began then
						uv0.touch_move = false
						uv0.is_move_hero = false
						uv0.touch_began = slot0:getTouchBeganPosition()

						doStopAllActions(uv0.container)

						uv0.long_touch_type = LONG_TOUCH_BEGAN_TYPE

						delayRun(uv0.container, 0.6, function ()
							if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE and uv1 then
								HeroController:getInstance():openHeroTipsPanel(true, uv1)
							end

							uv0.long_touch_type = LONG_TOUCH_END_TYPE
						end)
					elseif slot1 == ccui.TouchEventType.moved then
						if uv0.long_touch_type == LONG_TOUCH_END_TYPE then
							return
						elseif uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
							slot4 = slot0:getTouchMovePosition()

							if uv0.touch_began and slot4 and (math.abs(slot4.x - slot3.x) > 20 or math.abs(slot4.y - slot3.y) > 20) then
								doStopAllActions(uv0.container)

								uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
							end
						end

						uv0.touch_move = true
						uv0.is_move_hero = true

						uv0:onClickHeroItemMove(slot0, slot2)
					elseif slot1 == ccui.TouchEventType.canceled then
						if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
							doStopAllActions(uv0.container)

							uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
						elseif uv0.long_touch_type == LONG_TOUCH_END_TYPE then
							if uv0.move_hero_item then
								uv0.move_hero_item:setPosition(-10000, 0)
							end

							if uv0.move_hero_vo then
								slot0:setData(uv0.move_hero_vo)

								uv0.move_hero_vo = nil
							end

							return
						end

						uv0.is_move_hero = false

						uv0:onClickHeroItemCanceled(slot0)
					elseif slot1 == ccui.TouchEventType.ended then
						if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
							doStopAllActions(uv0.main_container)

							uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
						elseif uv0.long_touch_type == LONG_TOUCH_END_TYPE then
							if uv0.move_hero_item then
								uv0.move_hero_item:setPosition(-10000, 0)
							end

							if uv0.move_hero_vo then
								slot0:setData(uv0.move_hero_vo)

								uv0.move_hero_vo = nil
							end

							return
						end

						uv0.is_move_hero = false
						uv0.touch_end = slot0:getTouchEndPosition()
						slot3 = true

						if uv0.touch_began ~= nil then
							slot3 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
						end

						if uv0.touch_move then
							if slot3 then
								uv0.move_hero_item:setData()
								uv0.move_hero_item:setPosition(cc.p(-1000, -1000))

								if uv0.move_hero_vo then
									slot0:setData(uv0.move_hero_vo)

									uv0.move_hero_vo = nil
								end

								uv0:onClickHeroItem(uv2, uv3)
							else
								uv0:onClickHeroItemEnd(slot0)
							end
						else
							uv0:onClickHeroItem(uv2, uv3)
						end
					end
				end)
			end
		end
	end

	if slot0.save_crossarena_form_event == nil then
		slot0.save_crossarena_form_event = GlobalEvent:getInstance():Bind(CrossarenaEvent.Save_Crossarena_Form_Event, function ()
		end)
	end
end

function CorssarenaFormListPanel.setFunFormType(slot0, slot1)
	slot0.fun_form_type = slot1

	for slot5, slot6 in ipairs(slot0.team_panel_list) do
		if slot0.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
			slot6.box_name:setVisible(false)
			slot6.hide_btn:setVisible(false)

			if slot5 == 3 then
				if slot6.three_label == nil then
					slot6.three_label = createLabel(22, cc.c4b(104, 69, 42, 255), nil, 636, 124, TI18N("第三队隐藏"), slot6.team_panel, nil, cc.p(1, 0.5))
				else
					slot6.three_label:setVisible(true)
				end
			end
		else
			slot6.box_name:setVisible(slot0.form_show_type == HeroConst.FormShowType.eFormSave)
			slot6.hide_btn:setVisible(slot0.form_show_type == HeroConst.FormShowType.eFormSave)

			if slot5 == 3 and slot6.three_label then
				slot6.three_label:setVisible(false)
			end
		end
	end
end

function CorssarenaFormListPanel.onSelectHideBox(slot0, slot1)
	if slot0.hide_two_team == true then
		if slot0:getHideTeamCount() >= 2 then
			for slot6, slot7 in ipairs(slot0.team_panel_list) do
				if slot7.hide_btn and slot7.hide_status == true then
					slot7.hide_status = false

					slot7.hide_btn:setSelected(false)

					break
				end
			end
		end

		for slot6, slot7 in ipairs(slot0.team_panel_list) do
			if slot7.hide_btn and slot6 == slot1 then
				slot7.hide_status = true

				slot7.hide_btn:setSelected(true)
			end
		end
	else
		for slot5, slot6 in ipairs(slot0.team_panel_list) do
			if slot6.hide_btn then
				slot6.hide_status = slot1 == slot5

				slot6.hide_btn:setSelected(slot1 == slot5)
			end
		end
	end
end

function CorssarenaFormListPanel.getHideTeamCount(slot0)
	for slot5, slot6 in pairs(slot0.team_panel_list) do
		if slot6.hide_status == true then
			slot1 = 0 + 1
		end
	end

	return slot1
end

function CorssarenaFormListPanel.onChangePosBtn(slot0, slot1)
	if slot1 == 1 then
		slot3 = slot0.team_panel_list[2]

		if slot0.team_panel_list[1] and slot3 then
			slot2.formation_type = slot3.formation_type
			slot3.formation_type = slot2.formation_type
			slot2.old_order = slot3.old_order
			slot3.old_order = slot2.old_order
			slot2.hallows_id = slot3.hallows_id
			slot3.hallows_id = slot2.hallows_id

			for slot10 = 1, 6 do
				slot11 = slot2.hero_item_list[slot10]
				slot12 = slot3.hero_item_list[slot10]

				slot11:setData(slot12:getData())
				slot12:setData(slot11:getData())
			end

			slot0:updateTeamInfo(1, true)
			slot0:updateTeamInfo(2, true)
		end
	elseif slot1 == 2 then
		slot3 = slot0.team_panel_list[3]

		if slot0.team_panel_list[2] and slot3 then
			slot2.formation_type = slot3.formation_type
			slot3.formation_type = slot2.formation_type
			slot2.old_order = slot3.old_order
			slot3.old_order = slot2.old_order
			slot2.hallows_id = slot3.hallows_id
			slot3.hallows_id = slot2.hallows_id

			for slot10 = 1, 6 do
				slot11 = slot2.hero_item_list[slot10]
				slot12 = slot3.hero_item_list[slot10]

				slot11:setData(slot12:getData())
				slot12:setData(slot11:getData())
			end

			slot0:updateTeamInfo(2, true)
			slot0:updateTeamInfo(3, true)
		end
	end
end

function CorssarenaFormListPanel.onClickHallowBtn(slot0, slot1, slot2)
	for slot7, slot8 in ipairs(slot0.team_panel_list) do
		if slot8.hallows_id and slot8.hallows_id ~= 0 then
			-- Nothing
		end
	end

	uv0:openFormHallowsSelectPanel(true, slot1, function (slot0, slot1)
		if slot0 and uv0.team_panel_list[slot1] then
			for slot6, slot7 in ipairs(uv0.team_panel_list) do
				if slot7.hallows_id == slot0 then
					slot7.hallows_id = 0

					slot7.hallow_item:setData()
					slot7.hallow_item:showAddIcon(true)

					break
				end
			end

			if slot0 == 0 then
				slot2.hallows_id = 0

				slot2.hallow_item:setData()
				slot2.hallow_item:showAddIcon(true)
			else
				if not Config.HallowsData.data_base[slot0] then
					return
				end

				slot2.hallows_id = slot0

				slot2.hallow_item:showAddIcon(false)

				if HallowsController:getInstance():getModel():getHallowsById(slot0) and slot4.look_id ~= 0 then
					if Config.HallowsData.data_magic[slot4.look_id] then
						slot2.hallow_item:setBaseData(slot5.item_id)
						slot2.hallow_item:setMagicIcon(true)
					else
						slot2.hallow_item:setBaseData(slot3.item_id)
						slot2.hallow_item:setMagicIcon(false)
					end
				else
					slot2.hallow_item:setBaseData(slot3.item_id)
					slot2.hallow_item:setMagicIcon(false)
				end
			end
		end
	end, {
		[slot8.hallows_id] = slot7
	}, slot2)
end

function CorssarenaFormListPanel.onClickSaveBtn(slot0)
	slot1 = 2

	if slot0.form_show_type == HeroConst.FormShowType.eFormFight then
		slot1 = 1
	end

	slot2 = slot0:getData()

	table.remove(slot2, 1)

	for slot7, slot8 in pairs(slot2) do
		if slot8.pos_info and next(slot8.pos_info) ~= nil then
			slot3 = 0 + 1
		end
	end

	if slot3 < 2 then
		message(TI18N("至少需2个队伍有英雄上阵"))

		return
	end

	if slot0.fun_form_type ~= PartnerConst.Fun_Form.ArenapeakchampionDef then
		if CrossarenaController:getInstance():getModel():checkIsCanHideTwoTeam() and slot0:getHideTeamCount() ~= 2 then
			if Config.ArenaClusterData.data_const.second_hide_rank then
				message(string.format(TI18N("前%d名的玩家需要隐藏2队哦~"), slot5.val))
			end

			return
		end

		slot0:setSendUndateEflin(slot2)
		CrossarenaController:getInstance():sender25604(slot1, slot2)
	else
		for slot7, slot8 in ipairs(slot2) do
			slot8.is_hidden = nil
		end

		slot0:setSendUndateEflin(slot2)
		ArenapeakchampionController:getInstance():sender27725(slot2)
	end
end

function CorssarenaFormListPanel.setSendUndateEflin(slot0, slot1)
	for slot6, slot7 in ipairs(slot1 or {}) do
		if slot7.old_order == nil then
			uv0({}, {
				team = slot7.order,
				old_team = slot7.order
			})
		else
			uv0(slot2, {
				team = slot7.order,
				old_team = slot7.old_order
			})
		end

		slot7.old_order = nil
	end

	for slot6, slot7 in pairs(slot0.team_panel_list) do
		slot7.old_order = nil
	end

	ElfinController:getInstance():send26564(slot0.fun_form_type, slot2)
end

function CorssarenaFormListPanel.onClickGoFightBtn(slot0)
	if slot0.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
		return
	end

	slot1 = 2

	if slot0.form_show_type == HeroConst.FormShowType.eFormFight then
		slot1 = 1
	end

	slot2 = slot0:getData()

	table.remove(slot2, 1)

	for slot7, slot8 in pairs(slot2) do
		if slot8.pos_info and next(slot8.pos_info) ~= nil then
			slot3 = 0 + 1
		end
	end

	if slot3 < 2 then
		message(TI18N("至少需2个队伍有英雄上阵"))

		return
	end

	slot0:setSendUndateEflin(slot2)
	CrossarenaController:getInstance():sender25604(slot1, slot2)
end

function CorssarenaFormListPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.team_data_list = slot1

	for slot5, slot6 in ipairs(slot0.team_panel_list) do
		if slot0:getTeamDataByIndex(slot5) then
			for slot11, slot12 in ipairs(slot6.hero_item_list) do
				slot12:setExtendData({
					scale = 0.7,
					can_click = true,
					pos_id = slot11
				})
			end

			if slot6.hero_item_list then
				for slot12, slot13 in ipairs(slot6.hero_item_list) do
					if (function (slot0)
						for slot4, slot5 in pairs(uv0.pos_info) do
							if slot5.pos == slot0 then
								return slot5
							end
						end
					end)(slot12) then
						if uv0:getHeroById(slot14.id) then
							slot13:setData(slot15)
						end
					else
						if slot13:getData() then
							slot15.is_ui_select = false
						end

						slot13:setData()
					end
				end
			end

			slot6.hide_status = slot7.is_hidden == 1
			slot6.hallows_id = slot7.hallows_id
			slot6.formation_type = slot7.formation_type
			slot6.old_order = slot7.old_order

			slot0:updateTeamInfo(slot5, true)
		else
			for slot11, slot12 in ipairs(slot6.hero_item_list) do
				slot12:setExtendData({
					scale = 0.7,
					can_click = true,
					pos_id = slot11
				})
			end
		end
	end
end

function CorssarenaFormListPanel.getTeamDataByIndex(slot0, slot1)
	for slot5, slot6 in pairs(slot0.team_data_list or {}) do
		if slot6.order == slot1 then
			return slot6
		end
	end
end

function CorssarenaFormListPanel.getFormPosByIndex(slot0, slot1, slot2)
	slot3 = 1

	if Config.FormationData.data_form_data[slot1] then
		for slot8, slot9 in pairs(slot4.pos) do
			if slot9[1] == slot2 then
				slot3 = slot9[2]

				break
			end
		end
	end

	return slot3
end

function CorssarenaFormListPanel.getData(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.team_panel_list) do
		if slot6.hide_status == true then
			-- Nothing
		else
			slot7.is_hidden = 0
		end

		for slot11, slot12 in ipairs(slot6.hero_item_list) do
			slot14 = slot12:getExtendData()

			if slot12:getData() and slot14.pos_id then
				uv0(slot7.pos_info, {
					pos = slot14.pos_id,
					id = slot13.partner_id
				})
			end
		end

		uv0(slot1, {
			order = slot5,
			old_order = slot6.old_order or slot5,
			formation_type = slot6.formation_type,
			hallows_id = slot6.hallows_id,
			is_hidden = 1,
			pos_info = {}
		})
	end

	uv0(slot1, 1, {})

	return slot1
end

function CorssarenaFormListPanel.onSelectHero(slot0, slot1, slot2)
	if slot0.is_show_act == true or slot0.is_move_hero == true then
		return
	end

	if slot2.is_ui_select == true then
		slot2.is_ui_select = false

		slot0:cancelSelectHeroItem(slot2.partner_id, slot1)
	elseif slot0:setEmptyHeroItem(slot2, slot1) then
		slot2.is_ui_select = true

		slot1:setSelected(true)
	end
end

function CorssarenaFormListPanel.cancelSelectHeroItem(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot0.team_panel_list) do
		if slot7.hero_item_list then
			for slot11, slot12 in ipairs(slot7.hero_item_list) do
				if slot12:getData() and slot13.partner_id == slot1 then
					slot13.is_ui_select = false

					slot12:setData()

					if not slot0.move_hero_item then
						slot0.move_hero_item = HeroExhibitionItem.new(0.7, false)

						slot0.container:addChild(slot0.move_hero_item)
					end

					slot0.move_hero_item:setData(slot13)

					slot15 = slot0.container:convertToNodeSpace(slot12:convertToWorldSpace(cc.p(0, 0)))
					slot17 = slot0.container:convertToNodeSpace(slot2:convertToWorldSpace(cc.p(0, 0)))
					slot0.is_show_act = true

					slot0.move_hero_item:setPosition(cc.p(slot15.x + HeroExhibitionItem.Width * 0.7 / 2, slot15.y + HeroExhibitionItem.Height * 0.7 / 2))
					slot0.move_hero_item:runAction(cc.Sequence:create(cc.MoveTo:create(CrossarenaConst.Form_Act_Time, cc.p(slot17.x + HeroExhibitionItem.Width / 2, slot17.y + HeroExhibitionItem.Height / 2)), cc.CallFunc:create(function ()
						uv0.move_hero_item:setData()
						uv0.move_hero_item:setPosition(cc.p(-1000, -1000))

						if uv1 then
							uv1:setSelected(false)
						end

						uv0:updateTeamInfo(uv2)

						uv0.is_show_act = false
					end)))

					return
				end
			end
		end
	end
end

function CorssarenaFormListPanel.setEmptyHeroItem(slot0, slot1, slot2)
	if slot0:checkIsHaveTwoSameHeroInAllTeam(slot1) then
		return
	end

	for slot6, slot7 in ipairs(slot0.team_panel_list) do
		if slot7.hero_item_list and not slot0:checkIsHaveSameHeroInOneTeam(slot6, slot1, true) then
			for slot11, slot12 in ipairs(slot7.hero_item_list) do
				if not slot12:getData() then
					if not slot0.move_hero_item then
						slot0.move_hero_item = HeroExhibitionItem.new(0.7, false)

						slot0.container:addChild(slot0.move_hero_item)
					end

					slot0.move_hero_item:setData(slot1)

					slot15 = slot0.container:convertToNodeSpace(slot12:convertToWorldSpace(cc.p(0, 0)))
					slot17 = slot0.container:convertToNodeSpace(slot2:convertToWorldSpace(cc.p(0, 0)))
					slot0.is_show_act = true

					slot0.move_hero_item:setPosition(cc.p(slot17.x + HeroExhibitionItem.Width / 2, slot17.y + HeroExhibitionItem.Height / 2))
					slot0.move_hero_item:runAction(cc.Sequence:create(cc.MoveTo:create(CrossarenaConst.Form_Act_Time, cc.p(slot15.x + HeroExhibitionItem.Width * 0.7 / 2, slot15.y + HeroExhibitionItem.Height * 0.7 / 2)), cc.CallFunc:create(function ()
						uv0.move_hero_item:setData()
						uv0.move_hero_item:setPosition(cc.p(-1000, -1000))

						if uv1 then
							uv1:setData(uv2)
						end

						uv0:updateTeamInfo(uv3)

						uv0.is_show_act = false
					end)))

					return slot6
				end
			end
		end
	end

	message(TI18N("同队伍不能上阵同类英雄"))
end

function CorssarenaFormListPanel.checkIsHaveSameHeroInOneTeam(slot0, slot1, slot2, slot3)
	slot4 = false

	if slot0.team_panel_list[slot1] then
		for slot9, slot10 in pairs(slot5.hero_item_list) do
			if slot10:getData() and slot11.bid == slot2.bid then
				slot4 = true

				break
			end
		end
	end

	if slot4 and not slot3 then
		message(TI18N("同队伍不能上阵同类英雄"))
	end

	return slot4
end

function CorssarenaFormListPanel.checkIsHaveTwoSameHeroInAllTeam(slot0, slot1, slot2)
	slot3 = false
	slot4 = 0

	for slot8, slot9 in pairs(slot0.team_panel_list) do
		for slot13, slot14 in pairs(slot9.hero_item_list) do
			if slot14:getData() and slot15.bid == slot1.bid and slot4 + 1 >= 2 then
				slot3 = true

				break
			end
		end

		if slot3 then
			break
		end
	end

	if slot3 and not slot2 then
		message(TI18N("不能同时上阵3个同类英雄"))
	end

	return slot3
end

function CorssarenaFormListPanel.onClickHeroItem(slot0, slot1, slot2)
	if slot0.team_panel_list and slot0.team_panel_list[slot1] and (slot0.team_panel_list[slot1].hero_item_list or {})[slot2] and slot4:getData() then
		slot5.is_ui_select = false

		slot4:setData()
		slot0:updateTeamInfo(slot1)

		if slot0.super_panel then
			if slot0.super_panel:getCellHeroItemByPartnerId(slot5.partner_id) then
				slot0.is_show_act = true

				if not slot0.move_hero_item then
					slot0.move_hero_item = HeroExhibitionItem.new(0.7, false)

					slot0.container:addChild(slot0.move_hero_item)
				end

				slot0.move_hero_item:setData(slot5)

				slot8 = slot0.container:convertToNodeSpace(slot4:convertToWorldSpace(cc.p(0, 0)))

				slot0.move_hero_item:setPosition(cc.p(slot8.x + HeroExhibitionItem.Width * 0.7 / 2, slot8.y + HeroExhibitionItem.Height * 0.7 / 2))

				slot10 = slot0.container:convertToNodeSpace(slot6:convertToWorldSpace(cc.p(0, 0)))

				slot0.move_hero_item:runAction(cc.Sequence:create(cc.MoveTo:create(CrossarenaConst.Form_Act_Time, cc.p(slot10.x + HeroExhibitionItem.Width / 2, slot10.y + HeroExhibitionItem.Height / 2)), cc.CallFunc:create(function ()
					uv0.move_hero_item:setData()
					uv0.move_hero_item:setPosition(cc.p(-1000, -1000))
					uv1:setSelected(false)

					uv0.is_show_act = false
				end)))
			end
		end
	end
end

function CorssarenaFormListPanel.updateAllTeamInfo(slot0)
	for slot4 = 1, 3 do
		slot0:updateTeamInfo(slot4)
	end
end

function CorssarenaFormListPanel.updateTeamInfo(slot0, slot1, slot2)
	if not slot0.team_panel_list[slot1] then
		return
	end

	slot5 = {}

	for slot9, slot10 in pairs(slot3.hero_item_list) do
		if slot10:getData() then
			slot4 = 0 + (slot11.power or 0)

			if slot11.camp_type then
				if slot5[slot11.camp_type] == nil then
					slot5[slot11.camp_type] = 1
				else
					slot5[slot11.camp_type] = slot5[slot11.camp_type] + 1
				end
			end
		end
	end

	slot7 = 0

	if uv0:isGuildPvpFrom(slot0.fun_form_type) then
		slot8 = {}

		for slot12, slot13 in pairs(slot3.hero_item_list) do
			if slot13:getData() and slot14.type and slot14.type ~= 0 then
				table.insert(slot8, slot14.type)
			end
		end

		slot7 = GuildskillController:getInstance():getModel():getPvpPowerByCareerlist(slot8)
	end

	if slot6 and slot4 > 0 and slot7 > 0 then
		if slot3.pvp_arrow == nil then
			slot3.pvp_arrow = createImage(slot3.team_panel, PathTool.getResFrame("common", "common_1086"), 282, 125, cc.p(0.5, 0.5), true)

			slot3.pvp_arrow:setScale(0.8)
		else
			slot3.pvp_arrow:setVisible(true)
		end

		if slot3.show_pvp_tips == nil then
			slot3.show_pvp_tips = createLabel(18, cc.c3b(36, 144, 3), nil, 84, 125, TI18N("(公会pvp)"), slot3.team_panel, nil, cc.p(0, 0.5))
		else
			slot3.show_pvp_tips:setVisible(true)
		end

		slot4 = slot4 + slot7
	else
		if slot3.pvp_arrow then
			slot3.pvp_arrow:setVisible(false)
		end

		if slot3.show_pvp_tips then
			slot3.show_pvp_tips:setVisible(false)
		end
	end

	slot3.power_txt:setString(slot4)

	if slot6 and slot3.show_pvp_tips then
		slot3.show_pvp_tips:setPositionX(slot3.power_txt:getPositionX() + slot3.power_txt:getContentSize().width + 6)
	end

	if BattleController:getInstance():getModel():getCampIconConfigByIds(BattleController:getInstance():getModel():getFormIdListByCamp(slot5)) then
		slot0.halo_load_list[slot1] = loadImageTextureFromCDN(slot3.halo_btn, PathTool.getCampGroupIcon(slot9.icon), ResourcesType.single, slot0.halo_load_list[slot1])

		addCountForCampIcon(slot3.halo_btn, slot9.nums)
	else
		slot0.halo_load_list[slot1] = loadImageTextureFromCDN(slot3.halo_btn, PathTool.getCampGroupIcon(1000), ResourcesType.single, slot0.halo_load_list[slot1])

		addCountForCampIcon(slot3.halo_btn)
	end

	if slot2 == true then
		if slot3.hide_btn then
			slot3.hide_btn:setSelected(slot3.hide_status or false)
		end

		if slot3.formation_type ~= 0 then
			loadSpriteTexture(slot3.form_icon, PathTool.getResFrame("form", "form_icon_" .. slot3.formation_type), LOADTEXT_TYPE_PLIST)
		end

		if Config.HallowsData.data_base[slot3.hallows_id] then
			slot3.hallow_item:showAddIcon(false)

			if HallowsController:getInstance():getModel():getHallowsById(slot3.hallows_id) and slot11.look_id ~= 0 then
				if Config.HallowsData.data_magic[slot11.look_id] then
					slot3.hallow_item:setBaseData(slot12.item_id)
					slot3.hallow_item:setMagicIcon(true)
				else
					slot3.hallow_item:setBaseData(slot10.item_id)
					slot3.hallow_item:setMagicIcon(false)
				end
			else
				slot3.hallow_item:setBaseData(slot10.item_id)
				slot3.hallow_item:setMagicIcon(false)
			end
		else
			slot3.hallow_item:setData()
			slot3.hallow_item:showAddIcon(true)
		end
	end
end

function CorssarenaFormListPanel.onClickHeroItemMove(slot0, slot1, slot2)
	if not slot0.move_hero_item then
		slot0.move_hero_item = HeroExhibitionItem.new(0.7, false)

		slot0.container:addChild(slot0.move_hero_item)
	end

	if not slot0.move_hero_vo and slot2 then
		slot0.move_hero_vo = slot2

		slot1:setData()
		slot0.move_hero_item:setData(slot2)
	end

	slot0.move_hero_item:setPosition(slot0.container:convertToNodeSpace(slot1:getTouchMovePosition()))
end

function CorssarenaFormListPanel.onClickHeroItemCanceled(slot0, slot1)
	if slot0.move_hero_item and slot0.move_hero_vo then
		slot3 = slot0.container:convertToNodeSpace(slot1:getTouchMovePosition())
		slot4 = false

		for slot8, slot9 in ipairs(slot0.team_panel_list) do
			for slot13, slot14 in ipairs(slot9.item_rect_list) do
				if cc.rectContainsPoint(slot14, slot3) then
					if slot9.hero_item_list[slot13] and not slot0:checkIsHaveSameHeroInOneTeam(slot8, slot0.move_hero_vo) then
						slot4 = true
						slot0.is_show_act = true
						slot17 = slot0.container:convertToNodeSpace(slot15:convertToWorldSpace(cc.p(0, 0)))

						slot0.move_hero_item:runAction(cc.Sequence:create(cc.MoveTo:create(CrossarenaConst.Form_Act_Time, cc.p(slot17.x + 41.5, slot17.y + 41.5)), cc.CallFunc:create(function ()
							uv0.move_hero_item:setData()
							uv0.move_hero_item:setPosition(cc.p(-1000, -1000))
							uv2:setData(uv1:getData())
							uv1:setData(uv0.move_hero_vo)

							uv0.move_hero_vo = nil

							uv0:updateAllTeamInfo()

							uv0.is_show_act = false
						end)))
					end

					break
				end
			end

			if slot4 then
				break
			end
		end

		if not slot4 then
			slot0:onClickHeroItemEnd(slot1)
		end
	end
end

function CorssarenaFormListPanel.onClickHeroItemEnd(slot0, slot1)
	if slot0.move_hero_item then
		slot0.is_show_act = true
		slot3 = slot0.container:convertToNodeSpace(slot1:convertToWorldSpace(cc.p(0, 0)))

		slot0.move_hero_item:runAction(cc.Sequence:create(cc.MoveTo:create(CrossarenaConst.Form_Act_Time, cc.p(slot3.x + 41.5, slot3.y + 41.5)), cc.CallFunc:create(function ()
			uv0.move_hero_item:setData()
			uv0.move_hero_item:setPosition(cc.p(-1000, -1000))

			if uv0.move_hero_vo then
				uv1:setData(uv0.move_hero_vo)

				uv0.move_hero_vo = nil
			end

			uv0.is_show_act = false
		end)))
	end
end

function CorssarenaFormListPanel.__delete(slot0)
	if slot0.form_show_type == HeroConst.FormShowType.eFormFight then
		slot1 = slot0:getData()

		table.remove(slot1, 1)

		for slot6, slot7 in pairs(slot1) do
			if slot7.pos_info and next(slot7.pos_info) ~= nil then
				slot2 = 0 + 1
			end
		end

		if slot2 >= 2 then
			GlobalEvent:getInstance():Fire(CrossarenaEvent.Close_Form_Panle_Event, slot1)
		end
	end

	for slot4, slot5 in pairs(slot0.team_panel_list) do
		if slot5.hero_item_list then
			for slot9, slot10 in pairs(slot5.hero_item_list) do
				slot10:DeleteMe()

				slot10 = nil
			end

			slot5.hero_item_list = {}
		end

		if slot5.hallow_item then
			slot5.hallow_item:DeleteMe()

			slot5.hallow_item = nil
		end
	end

	for slot4, slot5 in pairs(slot0.halo_load_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.save_crossarena_form_event then
		GlobalEvent:getInstance():UnBind(slot0.save_crossarena_form_event)

		slot0.save_crossarena_form_event = nil
	end

	if slot0.move_hero_item then
		slot0.move_hero_item:DeleteMe()

		slot0.move_hero_item = nil
	end
end
