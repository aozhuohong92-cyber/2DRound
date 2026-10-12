FormGoFightPanel = FormGoFightPanel or BaseClass(BaseView)
slot1 = ElfinController:getInstance()
slot2 = HeroController:getInstance():getModel()
slot3 = HeroExpeditController:getInstance():getModel()
slot4 = string.format
slot5 = table.sort
slot6 = table.insert
slot7 = table.remove

function FormGoFightPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Big
	slot0.layout_name = "hero/form_go_fight_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("form", "form"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_100"),
			type = ResourcesType.single
		}
	}
	slot0.pos_name_list = {}
	slot0.hero_item_list = {}
	slot0.pos_rect_list = {}
	slot0.hero_pos = {}
	slot0.four_blank_img = {}
	slot0.five_spine_list = {}
	slot0.cur_power = 0
	slot0.cell_width = 134
	slot0.nine_position = {
		cc.p(slot0.cell_width, -slot0.cell_width + 50),
		cc.p(slot0.cell_width, 60),
		cc.p(slot0.cell_width, slot0.cell_width + 60),
		cc.p(0, -slot0.cell_width + 50),
		cc.p(0, 60),
		cc.p(0, slot0.cell_width + 60),
		cc.p(-slot0.cell_width, -slot0.cell_width + 50),
		cc.p(-slot0.cell_width, 60),
		cc.p(-slot0.cell_width, slot0.cell_width + 60)
	}
	slot0.move_hero_item = nil
	slot0.select_team_index = 0
	slot0.five_hero_vo = {}
	slot0.team_data_list = {}
	slot0.elfin_team_data_list = {}
	slot0.dic_more_team_data = {}
	slot0.elfin_item_list = {}
end

function FormGoFightPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N("英雄出战"))

	slot0.txt_cn_common_notice_1 = slot0.main_container:getChildByName("txt_cn_common_notice_1")
	slot1 = slot0.main_container:getChildByName("camp_node")
	slot0.camp_btn_list = {
		[0] = slot1:getChildByName("camp_btn0"),
		[HeroConst.CampType.eWater] = slot1:getChildByName("camp_btn1"),
		[HeroConst.CampType.eFire] = slot1:getChildByName("camp_btn2"),
		[HeroConst.CampType.eWind] = slot1:getChildByName("camp_btn3"),
		[HeroConst.CampType.eLight] = slot1:getChildByName("camp_btn4"),
		[HeroConst.CampType.eDark] = slot1:getChildByName("camp_btn5"),
		[HeroConst.CampType.eLegend] = slot1:getChildByName("camp_btn7")
	}
	slot0.legend_spine = createEffectSpine("E80182", cc.p(29, 29), cc.p(0.5, 0.5), true, "action")

	slot0.camp_btn_list[HeroConst.CampType.eLegend]:addChild(slot0.legend_spine)

	slot0.img_select = slot1:getChildByName("img_select")
	slot2, slot3 = slot0.camp_btn_list[0]:getPosition()
	slot8 = slot3 + 1

	slot0.img_select:setPosition(slot2 - 0.5, slot8)

	slot0.form_panel = slot0.main_container:getChildByName("form_panel")
	slot0.form_list_panel = slot0.main_container:getChildByName("form_list_panel")
	slot0.lay_scrollview = slot0.main_container:getChildByName("lay_scrollview")
	slot0.no_vedio_image = slot0.main_container:getChildByName("no_vedio_image")
	slot0.no_vedio_label = slot0.main_container:getChildByName("no_vedio_label")

	slot0.no_vedio_label:setString("暂无该类型英雄")

	slot0.fight_hero_node = slot0.form_panel:getChildByName("fight_hero_node")

	for slot8 = 1, 5 do
		slot0.hero_item_list[slot8] = HeroExhibitionItem.new(1, false)

		slot0.hero_item_list[slot8]:setIconClarity(0)
		slot0.hero_item_list[slot8]:setPosition(slot0.nine_position[({
			2,
			4,
			6,
			7,
			9
		})[slot8]])
		slot0.fight_hero_node:addChild(slot0.hero_item_list[slot8])

		slot0.hero_pos[slot8] = slot0.fight_hero_node:getChildByName("hero_info_21_" .. slot8)

		if slot8 == 1 or slot8 == 4 or slot8 == 7 then
			slot0.hero_pos[slot8]:setLocalZOrder(10)
		elseif slot8 == 2 or slot8 == 5 or slot8 == 8 then
			slot0.hero_pos[slot8]:setLocalZOrder(8)
		else
			slot0.hero_pos[slot8]:setLocalZOrder(5)
		end
	end

	for slot8 = 1, 4 do
		slot0.four_blank_img[slot8] = slot0.fight_hero_node:getChildByName("hero_info_21_" .. slot8)
	end

	slot0.fight_hero_node:getChildByName("pos_label_1"):setString(TI18N("前"))
	slot0.fight_hero_node:getChildByName("pos_label_2"):setString(TI18N("中"))
	slot0.fight_hero_node:getChildByName("pos_label_3"):setString(TI18N("后"))

	slot0.pos_tips = slot0.fight_hero_node:getChildByName("pos_tips")

	slot0.pos_tips:setString(TI18N("从列表选择英雄，长按英雄可查看英雄详细信息"))

	slot0.equip_btn = slot0.form_panel:getChildByName("equip_btn")
	slot5 = slot0.equip_btn:getContentSize()
	slot0.hallows_item = BackPackItem.new(false, false, false, 0.8)

	slot0.hallows_item:showAddIcon(true)
	slot0.hallows_item:setPosition(cc.p(slot5.width * 0.5, slot5.height * 0.5))
	slot0.equip_btn:addChild(slot0.hallows_item)

	slot0.equip_btn_label = slot0.equip_btn:getChildByName("label")

	slot0.equip_btn_label:setString(TI18N("点击装配"))

	slot0.elfin_btn = slot0.form_panel:getChildByName("elfin_btn")

	if slot0.elfin_btn then
		slot0.elfin_btn:getChildByName("label"):setString(TI18N("点击调整"))

		if ElfinController:getInstance():getModel():checkElfinIsOpen(true) then
			slot0.elfin_btn:setVisible(true)
		else
			slot0.elfin_btn:setVisible(false)
		end
	end

	slot0.form_change_btn = slot0.form_panel:getChildByName("form_change_btn")

	slot0.form_change_btn:getChildByName("label"):setString(TI18N("更换"))

	slot0.fight_btn = slot0.form_panel:getChildByName("fight_btn")

	slot0.fight_btn:getChildByName("label"):setString(TI18N("开 战"))

	slot0.save_btn = slot0.form_panel:getChildByName("save_btn")

	slot0.save_btn:getChildByName("label"):setString(TI18N("保存布阵"))

	slot0.key_up_btn = slot0.form_panel:getChildByName("key_up_btn")

	slot0.key_up_btn:getChildByName("label"):setString(TI18N("一键上阵"))

	slot0.form_icon = slot0.form_change_btn:getChildByName("form_icon")
	slot0.halo_btn = slot0.form_panel:getChildByName("halo_btn")
	slot0.halo_label = slot0.halo_btn:getChildByName("label")
	slot0.power_click = slot0.form_panel:getChildByName("power_click")
	slot0.fight_label = CommonNum.new(20, slot0.power_click, 99999, -2, cc.p(0, 0.5))

	slot0.fight_label:setPosition(24, 29)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")

	slot0.close_btn:setZOrder(99)

	if uv0.is_redpoint_form and slot0.form_change_btn then
		addRedPointToNodeByStatus(slot0.form_change_btn, true, 5, 5)
	end

	if uv0.is_redpoint_hallows and slot0.equip_btn then
		addRedPointToNodeByStatus(slot0.equip_btn, true, 5, 5)
	end

	slot0.tab_btn = slot0.main_container:getChildByName("tab_btn")
	slot0.txt_cn_common_notice_1 = slot0.main_container:getChildByName("txt_cn_common_notice_1")
	slot0.team_tab_btn = slot0.main_container:getChildByName("team_tab_btn")
	slot6 = {
		TI18N("总览"),
		TI18N("队伍一"),
		TI18N("队伍二"),
		TI18N("队伍三")
	}
	slot0.team_tab_list = {}

	for slot10 = 1, 4 do
		if slot0.team_tab_btn:getChildByName("tab_btn_" .. slot10) then
			slot12 = {
				select_img = slot11:getChildByName("select_img")
			}

			slot12.select_img:setVisible(false)

			slot12.normal_img = slot11:getChildByName("normal_img")
			slot12.label = slot11:getChildByName("label")

			slot12.label:setTextColor(cc.c4b(207, 181, 147, 255))

			if slot6[slot10] then
				slot12.label:setString(slot6[slot10])
			end

			slot12.tab_btn = slot11
			slot12.index = slot10
			slot0.team_tab_list[slot10] = slot12
		end
	end

	slot0.checkbox = slot0.form_panel:getChildByName("checkbox")

	if slot0.checkbox then
		slot0.checkbox:getChildByName("name"):setString(TI18N("跳过战斗"))
		slot0.checkbox:setVisible(false)
	end
end

function FormGoFightPanel.register_event(slot0)
	delayRun(slot0.background, 1, function ()
		registerButtonEventListener(uv0.background, handler(uv0, uv0.onClickCloseBtn), false, 1)
	end)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 1)
	registerButtonEventListener(slot0.form_change_btn, handler(slot0, slot0.onClickFormChangeBtn), true, 2)
	registerButtonEventListener(slot0.halo_btn, handler(slot0, slot0.onClickHaloBtn), true, 2)
	registerButtonEventListener(slot0.fight_btn, handler(slot0, slot0.onClickFightBtn), true, 2)
	registerButtonEventListener(slot0.equip_btn, handler(slot0, slot0.onClickEquipBtn), true, 2)
	registerButtonEventListener(slot0.elfin_btn, handler(slot0, slot0.onClickElfinBtn), true)
	registerButtonEventListener(slot0.key_up_btn, handler(slot0, slot0.onClickKeyUpBtn), true, 2)
	registerButtonEventListener(slot0.save_btn, handler(slot0, slot0.onClickSaveBtn), true, 2)
	registerButtonEventListener(slot0.checkbox, function ()
		uv0.is_skip_fight = uv0.checkbox:isSelected()
	end, true, 1)

	if slot0.team_tab_list then
		for slot4, slot5 in ipairs(slot0.team_tab_list) do
			registerButtonEventListener(slot5.tab_btn, function ()
				uv0:onClickTeamTabBtn(uv1.index, true)
			end, false, 2)
		end
	end

	for slot4, slot5 in pairs(slot0.camp_btn_list) do
		registerButtonEventListener(slot5, function ()
			uv0:onClickBtnShowByIndex(uv1)
		end, true, 2)
	end

	slot0.long_touch_type = LONG_TOUCH_INIT_TYPE

	for slot4, slot5 in ipairs(slot0.hero_item_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if uv0.is_play_item_action then
				return
			end

			if uv0.five_hero_vo[uv0.select_team_index] and uv0.five_hero_vo[uv0.select_team_index][uv1] == nil then
				return
			end

			if slot1 == ccui.TouchEventType.began then
				uv0.touch_began = slot0:getTouchBeganPosition()

				doStopAllActions(uv0.form_panel)

				uv0.long_touch_type = LONG_TOUCH_BEGAN_TYPE

				delayRun(uv0.form_panel, 0.6, function ()
					if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE and uv0.five_hero_vo[uv0.select_team_index][uv1] then
						if uv0.fun_form_type == PartnerConst.Fun_Form.Planes and slot0.flag == 1 then
							PlanesafkController:getInstance():sender28623(slot0.partner_id)
						elseif (uv0.fun_form_type == PartnerConst.Fun_Form.EndLess or uv0.fun_form_type == PartnerConst.Fun_Form.EndLessWater or uv0.fun_form_type == PartnerConst.Fun_Form.EndLessFire or uv0.fun_form_type == PartnerConst.Fun_Form.EndLessWind or uv0.fun_form_type == PartnerConst.Fun_Form.EndLessLightDark) and slot0.is_endless then
							LookController:getInstance():sender11061(slot0.rid, slot0.srv_id, slot0.id)
						else
							HeroController:getInstance():openHeroTipsPanel(true, uv0.five_hero_vo[uv0.select_team_index][uv1])
						end
					end

					uv0.long_touch_type = LONG_TOUCH_END_TYPE
				end)
			elseif slot1 == ccui.TouchEventType.moved then
				if uv0.long_touch_type == LONG_TOUCH_END_TYPE then
					return
				elseif uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
					slot3 = slot0:getTouchMovePosition()

					if uv0.touch_began and slot3 and (math.abs(slot3.x - slot2.x) > 20 or math.abs(slot3.y - slot2.y) > 20) then
						doStopAllActions(uv0.form_panel)

						uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
					end
				end

				uv0:onClickHeroItemMove(uv1, slot0)
			elseif slot1 == ccui.TouchEventType.canceled then
				if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
					doStopAllActions(uv0.form_panel)

					uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
				elseif uv0.long_touch_type == LONG_TOUCH_END_TYPE then
					if uv0.move_hero_item then
						uv0.move_hero_item:setPosition(-10000, 0)
					end

					uv2:setData(uv0.five_hero_vo[uv0.select_team_index][uv1])
					uv2:setIconClarity(0)

					return
				end

				uv0:onClickHeroItemCanceled(uv1, slot0)
			elseif slot1 == ccui.TouchEventType.ended then
				if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
					doStopAllActions(uv0.form_panel)

					uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
				elseif uv0.long_touch_type == LONG_TOUCH_END_TYPE then
					if uv0.move_hero_item then
						uv0.move_hero_item:setPosition(-10000, 0)
					end

					uv2:setData(uv0.five_hero_vo[uv0.select_team_index][uv1])
					uv2:setIconClarity(0)

					return
				end

				uv0:onClickHeroItemEnd(uv1, slot0)
			end
		end)
	end

	slot0:addGlobalEvent(ElitematchEvent.Update_Elite_Fun_Form, function (slot0)
		if not slot0 then
			return
		end

		if uv0.fun_form_type == PartnerConst.Fun_Form.Drama then
			for slot4, slot5 in ipairs(uv0.tab_list) do
				if slot5.fun_form_type == PartnerConst.Fun_Form.EliteMatch and #slot0.formations > 0 then
					uv0.team_data_list[slot4] = slot0.formations[1]

					if uv0.select_team_index == slot4 then
						uv0:initFormInfo(uv0.team_data_list[slot4])
					end
				end
			end
		else
			if #slot0.formations > 0 then
				uv0.team_data_list = slot0.formations

				if uv0.team_data_list[uv0.select_team_index] then
					uv1(uv0.team_data_list[uv0.select_team_index], function (slot0, slot1)
						return slot0.order < slot1.order
					end)
				end

				uv0:setHeroIsSelect()
				uv0:initFormInfo(uv0.team_data_list[uv0.select_team_index])
			end

			uv0:setEliteMatchDefaultInfo(2)
		end
	end)
	slot0:addGlobalEvent(ElitematchEvent.Update_Elite_Save_Form, function (slot0)
		message(TI18N("保存布阵成功"))

		if uv0.fun_form_type == PartnerConst.Fun_Form.Drama then
			ElitematchController:getInstance():sender24920(match_type or ElitematchConst.MatchType.eNormalMatch)
		else
			uv0:onClickCloseBtn()
		end
	end)
	slot0:addGlobalEvent(HeavenEvent.Update_Heaven_Fun_Form, function (slot0)
		if #slot0.formations > 0 then
			uv0.team_data_list = slot0.formations

			uv1(uv0.team_data_list[uv0.select_team_index], function (slot0, slot1)
				return slot0.order < slot1.order
			end)
			uv0:initFormInfo(uv0.team_data_list[uv0.select_team_index])
		end

		uv0:setEliteMatchDefaultInfo(2)
	end)
	slot0:addGlobalEvent(CrossarenaEvent.Update_Form_Data_Event, function (slot0)
		if uv0.fun_form_type == PartnerConst.Fun_Form.Drama then
			if uv0.cur_tab_data and uv0.cur_tab_data.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef then
				uv0.dic_more_team_data[PartnerConst.Fun_Form.CrossArenaDef] = uv0:setTeamMactchDefaultInfo(3, slot0.formations, PartnerConst.Fun_Form.CrossArenaDef)

				uv0:onClickTeamTabBtn(1)
			else
				for slot4, slot5 in ipairs(uv0.tab_list) do
					if slot5.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef then
						uv0.dic_more_team_data[PartnerConst.Fun_Form.CrossArenaDef] = uv0:setTeamMactchDefaultInfo(3, slot0.formations, PartnerConst.Fun_Form.CrossArenaDef)

						break
					end
				end
			end
		else
			if uv0.fun_form_type ~= PartnerConst.Fun_Form.CrossArenaDef and uv0.fun_form_type ~= PartnerConst.Fun_Form.CrossArena then
				return
			end

			uv0.team_data_list = slot0.formations or {}

			uv1(uv0.team_data_list, 1, {})
			uv0:initCrossarenaFormInfo()
			uv0:setEliteMatchDefaultInfo(3)
		end
	end)
	slot0:addGlobalEvent(ArenapeakchampionEvent.ARENAPEAKCHAMPION_FROM_EVENT, function (slot0)
		if uv0.fun_form_type == PartnerConst.Fun_Form.Drama then
			if uv0.cur_tab_data and uv0.cur_tab_data.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
				uv0.dic_more_team_data[PartnerConst.Fun_Form.ArenapeakchampionDef] = uv0:setTeamMactchDefaultInfo(3, slot0.formations, PartnerConst.Fun_Form.ArenapeakchampionDef)

				uv0:onClickTeamTabBtn(1)
			else
				for slot4, slot5 in ipairs(uv0.tab_list) do
					if slot5.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
						uv0.dic_more_team_data[PartnerConst.Fun_Form.ArenapeakchampionDef] = uv0:setTeamMactchDefaultInfo(3, slot0.formations, PartnerConst.Fun_Form.ArenapeakchampionDef)

						break
					end
				end
			end
		else
			if uv0.fun_form_type ~= PartnerConst.Fun_Form.ArenapeakchampionDef then
				return
			end

			uv0.team_data_list = slot0.formations or {}

			uv1(uv0.team_data_list, 1, {})
			uv0:initCrossarenaFormInfo()
			uv0:setEliteMatchDefaultInfo(3)
		end
	end)
	slot0:addGlobalEvent(ArenapeakchampionEvent.ARENAPEAKCHAMPION_SAVE_FROM_EVENT, function (slot0)
		message(TI18N("保存布阵成功"))

		if uv0.fun_form_type ~= PartnerConst.Fun_Form.Drama then
			uv0:onClickCloseBtn()
		end
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Get_Form_Data_Event, function (slot0)
		uv0.team_data_list[uv0.select_team_index] = slot0

		uv0:initFormInfo(slot0)
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Save_Form_Success_Event, function ()
		message(TI18N("保存布阵成功"))
		uv0:onClickCloseBtn()
	end)
	slot0:addGlobalEvent(HeroEvent.Update_Fun_Form, function (slot0)
		if not slot0 then
			return
		end

		if uv0.fun_form_type == PartnerConst.Fun_Form.Drama then
			for slot4, slot5 in ipairs(uv0.tab_list) do
				if slot0.type and slot5.fun_form_type == slot0.type then
					uv0.team_data_list[slot4] = slot0

					if uv0.select_team_index == slot4 then
						uv0:initFormInfo(uv0.team_data_list[slot4])
					end
				end
			end
		elseif uv0.fun_form_type and slot0.type and slot0.type == uv0.fun_form_type then
			uv0.team_data_list[uv0.select_team_index] = slot0

			uv0:initFormInfo(slot0)
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Update_Save_Form, function (slot0)
		if uv0.form_show_type == HeroConst.FormShowType.eFormFight then
			uv0:gotoFight()
		else
			message(TI18N("保存布阵成功"))

			if uv0.fun_form_type == PartnerConst.Fun_Form.Drama then
				if slot0.type ~= PartnerConst.Fun_Form.Drama and slot0.type ~= PartnerConst.Fun_Form.Arena then
					uv1:sender11211(slot0.type)
				end
			else
				uv0:onClickCloseBtn()
			end
		end
	end)
	slot0:addGlobalEvent(HeavenEvent.Save_Heaven_Fun_Form, function ()
		slot0 = uv0.setting.chapter_id
		slot1 = uv0.setting.customs_id

		if uv0.form_show_type == HeroConst.FormShowType.eFormFight and slot0 and slot1 then
			HeavenController:getInstance():sender25205(slot0, slot1)
			uv0:onClickCloseBtn()
		end
	end)
	slot0:addGlobalEvent(CrossarenaEvent.Save_Crossarena_Form_Event, function ()
		slot0 = uv0.setting.rid
		slot1 = uv0.setting.srv_id

		if uv0.form_show_type == HeroConst.FormShowType.eFormFight and slot0 and slot1 then
			CrossarenaController:getInstance():sender25606(slot0, slot1)
			CrossarenaController:getInstance():openCrossarenaRoleTips(false)
		end

		if uv0.fun_form_type ~= PartnerConst.Fun_Form.Drama then
			uv0:onClickCloseBtn()
		end
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_SAVE_FORM_EVENT, function ()
		GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_SAVE_BACK_EVENT, uv0.mine_pos_info, uv0.formation_type, uv0.hallows_id)

		if uv0.fun_form_type and uv0.fun_form_type == PartnerConst.Fun_Form.Adventure_Mine_Def then
			uv0:onClickCloseBtn()
		end
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_FIGHT_EVENT, function ()
		uv0:onClickCloseBtn()
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_HALLOWS_LIST_EVENT, function (slot0)
		uv0.mine_hallows_id = {}

		if not slot0 then
			return
		end

		for slot4, slot5 in ipairs(slot0.list) do
			uv0.mine_hallows_id[slot5.hallows_id] = slot5
		end

		if uv0.hallows_id and uv0.hallows_id == 0 then
			slot2 = HallowsController:getInstance():getModel():getHallowsList() or {}

			if slot1 and slot2 and next(slot2) ~= nil then
				slot3 = {}

				for slot7, slot8 in ipairs(slot2) do
					if not uv0.mine_hallows_id[slot8.id] then
						uv1(slot3, slot8)
					end
				end

				if #slot3 > 0 then
					uv2(slot3, function (slot0, slot1)
						return uv0:sortHallowsFunc(slot0, slot1)
					end)

					uv0.hallows_id = slot3[1].id

					uv0:updateHallowsIcon()
				end
			end
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Del_Hero_Event, function (slot0)
		uv0:updateHeroList(uv0.select_camp, true)
		uv0:updateFiveHeroItem()
	end)
	slot0:addGlobalEvent(ElfinEvent.Get_Elfin_Tree_Data_Event, function ()
		if uv0.save_elfin_data then
			uv0:updateElfinList(uv0.save_elfin_data)
		end
	end)
	slot0:addGlobalEvent(ElfinEvent.Elfin_Plan_From_Info_Event, function (slot0)
		uv0:initEflinInfoList(slot0)
	end)
end

function FormGoFightPanel.onClickCloseBtn(slot0, slot1)
	if not slot1 and slot0.fun_form_type and slot0.fun_form_type == PartnerConst.Fun_Form.Monopoly_Evt then
		return
	elseif slot0.fun_form_type and slot0.fun_form_type == PartnerConst.Fun_Form.Adventure_Mine_Def then
		uv0:openAdventureMineFormGoFightPanel(false)

		if slot0.setting and slot0.setting.end_time and slot0.setting.end_time - GameNet:getInstance():getTime() > 0 and AdventureController:getInstance() and slot3.send20660 then
			slot3:send20660(slot0.setting.floor, slot0.setting.room_id)
		end
	else
		uv0:openFormGoFightPanel(false)
	end
end

function FormGoFightPanel.createHeroSpine(slot0, slot1, slot2)
	slot4 = nil

	if Config.PartnerData.data_partner_star(getNorKey(slot2.bid, slot2.star)) then
		slot4 = slot3.res_id
	end

	if slot2.use_skin and Config.PartnerSkinData.data_skin_info_fun(slot5) and slot6.res_id ~= nil and slot6.res_id ~= "" then
		slot4 = slot6.res_id
	end

	if not slot4 then
		return
	end

	slot6 = createSpineByName(slot4, PlayerAction.battle_stand)

	slot0.hero_pos[slot1]:removeAllChildren()
	slot6:setAnimation(0, PlayerAction.battle_stand, true)
	slot6:setAnchorPoint(cc.p(0, 0))

	if slot4 == "H30121" then
		slot6:setScale(1.4)
	end

	if slot4 == "H30119" then
		slot6:setScale(0.8)
	end

	if slot4 == "H50022" then
		slot6:setScale(0.6)
	end

	if slot4 == "H30122" then
		slot6:setScale(1.2)
	end

	if slot4 == "H_taotu" then
		slot6:setScale(0.7)
	end

	if slot4 == "h_yutian" then
		slot6:setScale(0.6)
	end

	if slot4 == "h_dahe" then
		slot6:setScale(1.3)
	end

	if slot4 == "pf_dakouzhenshen" then
		slot6:setScale(1.3)
	end

	if slot4 == "h_suolonghezhiguo" then
		slot6:setScale(1.3)
	end

	if slot4 == "h_apu" then
		slot6:setScale(1.25)
	end

	if slot4 == "h_guangyueshi" then
		slot6:setScale(1.25)
	end

	slot6:setName("Herospine" .. slot1)
	slot7:addChild(slot6)
	slot6:setPosition(cc.p(70, 20))

	slot0.five_spine_list[slot1] = slot6
end

function FormGoFightPanel.onClickFormChangeBtn(slot0)
	if not slot0.formation_type then
		return
	end

	if uv0.is_redpoint_form and slot0.form_change_btn then
		uv0.is_redpoint_form = false

		addRedPointToNodeByStatus(slot0.form_change_btn, false, 5, 5)
	end

	uv1:openFormationSelectPanel(true, slot0.formation_type, function (slot0, slot1)
		if slot0 and not tolua.isnull(uv0.root_wnd) then
			if not slot1 then
				return
			end

			if not uv0.team_data_list[slot1] then
				return
			end

			uv0.formation_type = slot0
			uv0.team_data_list[slot1].formation_type = slot0

			if uv0.select_team_index == slot1 then
				if Config.FormationData.data_form_data[uv0.formation_type] then
					uv0:initFormationData(slot2)
				end

				uv0:updateFormationIcon()
			end
		end
	end, slot0.select_team_index)
end

function FormGoFightPanel.onClickHaloBtn(slot0)
	BattleController:getInstance():openBattleCampView(true, slot0.halo_form_id_list)
end

function FormGoFightPanel.onClickEquipBtn(slot0)
	if not slot0.hallows_id then
		return
	end

	if slot0.fun_form_type == PartnerConst.Fun_Form.Adventure_Mine_Def and not slot0.mine_hallows_id then
		return
	end

	if uv0.is_redpoint_hallows and slot0.equip_btn then
		uv0.is_redpoint_hallows = false

		addRedPointToNodeByStatus(slot0.equip_btn, false, 5, 5)
	end

	slot2, slot3 = slot0:getDicTeamData(slot0.tab_list[slot0.select_team_index])
	slot4 = {}

	if slot3 then
		for slot8, slot9 in ipairs(slot3) do
			if slot9.hallows_id and slot9.hallows_id ~= 0 and slot0.team_select_team_index - 1 ~= slot8 then
				slot4[slot9.hallows_id] = slot8
			end
		end
	else
		for slot8, slot9 in pairs(slot2) do
			if slot9.hallows_id and slot9.hallows_id ~= 0 and slot0.select_team_index ~= slot8 then
				if slot0.fun_form_type == PartnerConst.Fun_Form.CrossArena or slot0.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef or slot0.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
					slot4[slot9.hallows_id] = slot8 - 1
				else
					slot4[slot9.hallows_id] = slot8
				end
			end
		end
	end

	if slot0.mine_hallows_id then
		for slot8, slot9 in pairs(slot0.mine_hallows_id) do
			if slot8 == slot0.hallows_id then
				slot0.mine_hallows_id[slot8] = nil
			end
		end
	end

	uv1:openFormHallowsSelectPanel(true, slot0.hallows_id, function (slot0, slot1)
		if slot0 then
			if not uv0.team_data_list or not uv0.team_data_list[slot1] then
				return
			end

			uv0.hallows_id = slot0

			if uv1 then
				slot2 = uv2[slot0]

				if slot0 ~= 0 then
					for slot6, slot7 in ipairs(uv1) do
						if slot7.hallows_id == slot0 and slot2 == slot6 then
							slot7.hallows_id = 0
						end
					end
				end
			else
				for slot5, slot6 in pairs(uv3) do
					if slot6.hallows_id == slot0 and slot1 ~= slot5 then
						slot6.hallows_id = 0
					end
				end
			end

			uv0.team_data_list[slot1].hallows_id = slot0

			if uv0.fun_form_type ~= PartnerConst.Fun_Form.Drama and uv0.crossarena_form_list_panel then
				uv0.crossarena_form_list_panel:setData(uv0.team_data_list)
			end

			if uv0.select_team_index == slot1 then
				uv0:updateHallowsIcon()
			end
		end
	end, slot4, slot0.select_team_index, slot0.mine_hallows_id)
end

function FormGoFightPanel.onClickElfinBtn(slot0)
	if not slot0.elfin_team_data_list[slot0.select_team_index] then
		return
	end

	if not slot0.cur_tab_data then
		return
	end

	if next(uv0:getModel():getElfinTreeData()) == nil then
		return
	end

	slot2 = {
		fun_form_type = slot0.cur_tab_data.fun_form_type
	}

	slot0:setPlanSettingInfo(slot2)
	ElfinController:getInstance():openElfinFightPlanPanel(true, slot2)
end

function FormGoFightPanel.setPlanSettingInfo(slot0, slot1)
	if not slot1 then
		return
	end

	function slot2(slot0, slot1)
		slot2 = {}

		for slot6, slot7 in pairs(slot0) do
			if slot1 ~= slot7.team and slot7.sprites and next(slot7.sprites) ~= nil then
				for slot11, slot12 in ipairs(slot7.sprites) do
					if slot2[slot12.item_bid] == nil then
						slot2[slot12.item_bid] = 1
					else
						slot2[slot12.item_bid] = slot2[slot12.item_bid] + 1
					end
				end
			end
		end

		return slot2
	end

	if slot0.fun_form_type == PartnerConst.Fun_Form.Drama then
		if slot0.cur_tab_data.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef or slot0.cur_tab_data.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
			slot1.team_index = slot0.team_data_list[slot0.select_team_index].old_order

			if slot1.team_index == nil then
				slot1.team_index = slot0.team_select_team_index - 1
			end

			slot1.dic_filter_item_id = slot2(slot0.elfin_team_data_list[slot0.select_team_index], slot1.team_index)
			slot1.cur_plan_data = slot0.elfin_team_data_list[slot0.select_team_index][slot1.team_index + 1]
			slot1.total_team_info = slot0.elfin_team_data_list[slot0.select_team_index]
		else
			slot1.dic_filter_item_id = {}
			slot1.cur_plan_data = slot0.elfin_team_data_list[slot0.select_team_index]
			slot1.team_index = 1
		end
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef or slot0.fun_form_type == PartnerConst.Fun_Form.CrossArena or slot0.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
		slot1.team_index = slot0.team_data_list[slot0.select_team_index].old_order

		if slot1.team_index == nil then
			slot1.team_index = slot0.select_team_index - 1
		end

		slot1.dic_filter_item_id = slot2(slot0.elfin_team_data_list, slot1.team_index)
		slot1.cur_plan_data = slot0.elfin_team_data_list[slot1.team_index + 1]
		slot1.total_team_info = slot0.elfin_team_data_list
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.HeavenBoss then
		slot1.team_index = slot0.select_team_index
		slot1.dic_filter_item_id = slot2(slot0.elfin_team_data_list, slot1.team_index)
		slot1.cur_plan_data = slot0.elfin_team_data_list[slot0.select_team_index]
		slot1.total_team_info = slot0.elfin_team_data_list
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.EliteMatch then
		if (slot0.setting.match_type or ElitematchConst.MatchType.eNormalMatch) == 1 then
			slot1.dic_filter_item_id = {}
			slot1.cur_plan_data = slot0.elfin_team_data_list[slot0.select_team_index]
			slot1.team_index = 1
		else
			slot1.team_index = slot0.select_team_index
			slot1.dic_filter_item_id = slot2(slot0.elfin_team_data_list, slot1.team_index)
			slot1.cur_plan_data = slot0.elfin_team_data_list[slot0.select_team_index]
			slot1.total_team_info = slot0.elfin_team_data_list
		end

		slot1.match_type = slot3
	else
		slot1.dic_filter_item_id = {}
		slot1.cur_plan_data = slot0.elfin_team_data_list[slot0.select_team_index]
		slot1.team_index = 1
	end
end

function FormGoFightPanel.getDefaultTeamInfo(slot0, slot1)
	if slot0.default_team_info == nil then
		slot0.default_team_info = {}
	end

	if slot0.default_team_info[slot1] == nil then
		slot0.default_team_info[slot1] = {
			sprites = {}
		}

		for slot5 = 1, 4 do
			if ElfinController:getInstance():getModel():getElfinItemByPos(slot5) ~= nil then
				uv0(slot0.default_team_info[slot1].sprites, {
					item_bid = 0,
					pos = slot5
				})
			end
		end

		slot0.default_team_info[slot1].plan_id = 0
		slot0.default_team_info[slot1].team = slot1
	end

	return slot0.default_team_info[slot1]
end

function FormGoFightPanel.initEflinInfoList(slot0, slot1)
	if not slot0.tab_list then
		return
	end

	if slot0.fun_form_type == PartnerConst.Fun_Form.Drama then
		for slot5, slot6 in ipairs(slot0.tab_list) do
			if slot6.fun_form_type == slot1.type then
				if slot6.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef or slot6.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
					slot0.elfin_team_data_list[slot6.index] = {}
					slot7 = nil

					if slot0.team_data_list[slot0.select_team_index] then
						slot7 = slot0.team_data_list[slot0.select_team_index].old_order
					end

					for slot13, slot14 in ipairs(slot1.team_list) do
						slot0.elfin_team_data_list[slot6.index][slot14.team + 1] = slot14

						if (slot7 or (slot0.team_select_team_index or 1) - 1) == slot14.team then
							slot0:updateElfinList(slot14)
						end
					end

					for slot13 = 2, 4 do
						if slot0.elfin_team_data_list[slot6.index][slot13] == nil then
							slot0.elfin_team_data_list[slot6.index][slot13] = slot0:getDefaultTeamInfo(slot13 - 1)
						end
					end

					break
				end

				slot0.elfin_team_data_list[slot6.index] = slot1.team_list[1]

				if slot0.select_team_index == slot6.index then
					slot0:updateElfinList(slot0.elfin_team_data_list[slot6.index])
				end

				break
			end
		end
	elseif slot0.fun_form_type == slot1.type then
		slot2 = slot0.select_team_index

		if slot0.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef or slot0.fun_form_type == PartnerConst.Fun_Form.CrossArena or slot0.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
			slot3 = nil

			if slot0.team_data_list[slot0.select_team_index] then
				slot3 = slot0.team_data_list[slot0.select_team_index].old_order
			end

			slot2 = (slot3 or slot0.select_team_index - 1) + 1
			slot0.elfin_team_data_list = {}

			for slot8, slot9 in ipairs(slot1.team_list) do
				slot0.elfin_team_data_list[slot9.team + 1] = slot9
			end

			for slot8 = 2, 4 do
				if slot0.elfin_team_data_list[slot8] == nil then
					slot0.elfin_team_data_list[slot8] = slot0:getDefaultTeamInfo(slot8 - 1)
				end
			end
		elseif slot0.fun_form_type == PartnerConst.Fun_Form.HeavenBoss then
			slot0.elfin_team_data_list = {}

			for slot6, slot7 in ipairs(slot1.team_list) do
				slot0.elfin_team_data_list[slot7.team] = slot7
			end

			for slot6 = 1, 2 do
				if slot0.elfin_team_data_list[slot6] == nil then
					slot0.elfin_team_data_list[slot6] = slot0:getDefaultTeamInfo(slot6)
				end
			end
		elseif slot0.fun_form_type == PartnerConst.Fun_Form.EliteMatch then
			if (slot0.setting.match_type or ElitematchConst.MatchType.eNormalMatch) == 1 then
				slot0.elfin_team_data_list[1] = slot1.team_list[1]
			end
		else
			slot0.elfin_team_data_list[1] = slot1.team_list[1]
		end

		for slot6, slot7 in ipairs(slot0.tab_list) do
			if slot7.index == slot2 then
				slot0:updateElfinList(slot0.elfin_team_data_list[slot2])
			end
		end
	elseif slot1.type == PartnerConst.Fun_Form.EliteKingMatch and (slot0.setting.match_type or ElitematchConst.MatchType.eNormalMatch) == 2 then
		slot0.elfin_team_data_list = {}

		for slot6, slot7 in ipairs(slot1.team_list) do
			slot0.elfin_team_data_list[slot7.team] = slot7
		end

		for slot6 = 1, 2 do
			if slot0.elfin_team_data_list[slot6] == nil then
				slot0.elfin_team_data_list[slot6] = slot0:getDefaultTeamInfo(slot6)
			end
		end

		for slot6, slot7 in ipairs(slot0.tab_list) do
			if slot7.index == slot0.select_team_index then
				slot0:updateElfinList(slot0.elfin_team_data_list[slot0.select_team_index])
			end
		end
	end
end

function FormGoFightPanel.updateElfinList(slot0, slot1)
	if not slot0.elfin_btn then
		return
	end

	if not slot1 then
		return
	end

	slot0.save_elfin_data = slot1
	slot2 = slot1.sprites

	for slot7 = 1, 4 do
		slot8 = function (slot0)
			slot1 = nil

			for slot5, slot6 in pairs(uv0) do
				if slot6.pos == slot0 then
					slot1 = slot6.item_bid

					break
				end
			end

			return slot1
		end(slot7)

		if slot0.elfin_item_list[slot7] == nil then
			slot9 = SkillItem.new(true, false, true, 0.4)
			slot10 = 24.3
			slot11 = 72.5

			if slot7 == 3 or slot7 == 4 then
				slot11 = 24.3
			end

			if slot7 == 2 or slot7 == 4 then
				slot10 = 72.5
			end

			slot9:setPosition(cc.p(slot10, slot11))
			slot0.elfin_btn:addChild(slot9)

			slot0.elfin_item_list[slot7] = slot9
		end

		if ElfinController:getInstance():getModel():getElfinItemByPos(slot7) then
			slot11 = slot8 or 0

			slot9:showLockIcon(false)

			if slot11 == 0 or not Config.SpriteData.data_elfin_data(slot11) then
				slot9:setData()
			elseif Config.SkillData.data_get_skill(slot12.skill) then
				slot9:setData(slot13)
			end
		else
			slot9:setData()
			slot9:showLockIcon(true)
		end
	end
end

function FormGoFightPanel.onClickKeyUpBtn(slot0)
	if not slot0.pos_name_list then
		return
	end

	if tolua.isnull(slot0.root_wnd) then
		return
	end

	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	if not slot0.tab_list[slot0.select_team_index] then
		return
	end

	if not slot0.cur_tab_data then
		return
	end

	slot1 = {}

	function slot2(slot0)
		if slot0.pos_type == 1 then
			-- Nothing
		elseif slot0.pos_type == 3 then
			for slot5 = #uv0.pos_name_list, 1, -1 do
				if uv1[slot5] == nil then
					return slot5
				end
			end
		else
			for slot4, slot5 in ipairs(uv0.pos_name_list) do
				if slot5 == slot0.pos_type and uv1[slot4] == nil then
					return slot4
				end
			end
		end

		for slot4, slot5 in ipairs(uv0.pos_name_list) do
			if uv1[slot4] == nil then
				return slot4
			end
		end

		return nil
	end

	slot3 = uv0:getAllHeroArray()

	slot3:UpperSortByParams("power", "star", "lev", "sort_order")

	slot4 = 1

	if slot3:GetSize() == 0 then
		message(TI18N("没有英雄"))

		return
	end

	slot6 = {}
	slot8, slot9 = slot0:getDicTeamData(slot0.tab_list[slot0.select_team_index])
	slot10 = nil

	if slot9 then
		if not slot0.team_select_team_index then
			return
		end

		slot10 = slot0.cur_tab_data.fun_form_type
		slot11 = slot0.team_select_team_index - 1

		for slot15, slot16 in pairs(slot9) do
			for slot21, slot22 in pairs(slot16.pos_info or {}) do
				if uv0:getHeroById(slot22.id) then
					if slot16.order == slot11 then
						slot23.is_ui_select = false
					else
						slot6[slot23.bid] = true
					end
				end
			end
		end
	else
		for slot14, slot15 in pairs(slot8) do
			if slot0.five_hero_vo[slot14] then
				for slot19, slot20 in pairs(slot0.five_hero_vo[slot14]) do
					if slot0.select_team_index == slot14 then
						slot20.is_ui_select = false
					else
						slot6[slot20.bid] = true
					end
				end
			end
		end
	end

	for slot14 = 1, slot5 do
		if slot6[slot3:Get(slot14 - 1).bid] == nil and slot0:checkOtherCondition(slot15, slot10, slot9) then
			slot6[slot15.bid] = true

			if slot2(slot15) == nil then
				break
			end

			slot1[slot16] = slot15
			slot15.is_ui_select = true

			if slot4 + 1 > 5 then
				break
			end
		end
	end

	slot11 = {
		[slot15] = true
	}

	for slot15, slot16 in pairs(slot1) do
		slot0.five_hero_vo[slot0.select_team_index][slot15] = slot16

		if slot0.hero_item_list[slot15] then
			slot0:createHeroSpine(slot15, slot0.five_hero_vo[slot0.select_team_index][slot15])
			slot0.hero_item_list[slot15]:setData(slot0.five_hero_vo[slot0.select_team_index][slot15])
			slot0.hero_item_list[slot15]:setIconClarity(0)
		end
	end

	slot15 = slot0.select_team_index

	for slot15, slot16 in pairs(slot0.five_hero_vo[slot15]) do
		if slot11[slot15] == nil then
			if slot0.hero_item_list[slot15] then
				slot0.hero_item_list[slot15]:setData(nil)
			end

			slot0.five_hero_vo[slot0.select_team_index][slot15] = nil
		end
	end

	slot0:updateMoreTeamHeroInfo()
	slot0:updateFightPower()

	if slot0.list_view then
		slot0.list_view:resetCurrentItems()
	end
end

function FormGoFightPanel.checkOtherCondition(slot0, slot1, slot2, slot3)
	if not slot0.five_hero_vo then
		return
	end

	if (slot2 or slot0.fun_form_type) == PartnerConst.Fun_Form.CrossArena or slot4 == PartnerConst.Fun_Form.CrossArenaDef or slot4 == PartnerConst.Fun_Form.ArenapeakchampionDef then
		slot5 = 0

		if slot3 then
			for slot9, slot10 in pairs(slot3) do
				for slot15, slot16 in pairs(slot10.pos_info or {}) do
					if uv0:getHeroById(slot16.id) then
						if slot17.bid == slot1.bid then
							slot5 = slot5 + 1
						end

						if slot5 >= 2 then
							return false
						end
					end
				end
			end
		else
			for slot9, slot10 in pairs(slot0.five_hero_vo) do
				for slot14, slot15 in pairs(slot10) do
					if slot15.bid == slot1.bid then
						slot5 = slot5 + 1
					end

					if slot5 >= 2 then
						return false
					end
				end

				if slot5 >= 2 then
					return false
				end
			end
		end
	elseif slot4 == PartnerConst.Fun_Form.Adventure_Mine_Def then
		if slot0.dic_mine_hero_list and slot0.dic_mine_hero_list[slot1.id] then
			return false
		end
	elseif slot4 == PartnerConst.Fun_Form.Planes then
		slot5 = Config.PlanesData.data_const.planes_filter_condition

		if PlanesafkController:getInstance():getModel():getMyPlanesHeroHpPer(slot1.id) <= 0 then
			return false
		elseif slot5 and slot5.val[1] and slot1.lev < slot5.val[1] then
			return false
		end
	end

	if slot4 == PartnerConst.Fun_Form.Drama then
		if slot1.checkResonateHeroByFormType and slot1:checkResonateHeroByFormType(slot0.tab_list[slot0.select_team_index].fun_form_type, true) then
			return false
		end
	elseif slot1.checkResonateHeroByFormType and slot1:checkResonateHeroByFormType(slot0.fun_form_type, true) then
		return false
	end

	return true
end

function FormGoFightPanel.onClickSaveBtn(slot0)
	if slot0.fun_form_type == PartnerConst.Fun_Form.EliteMatch then
		slot0:onFightEliteMatch()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.CrossArena or slot0.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef then
		slot0:onFightCrossarena()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
		slot0:onFightArenapeakchampion()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.Adventure_Mine_Def then
		slot0:onSaveAdventureMine()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.Drama then
		if slot0.cur_tab_data and slot0.cur_tab_data.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef then
			slot0:updateMoreTeamHeroInfo()
			slot0:onFightCrossarena(slot0.dic_more_team_data[slot0.cur_tab_data.fun_form_type], slot0.cur_tab_data.fun_form_type, true)
		elseif slot0.cur_tab_data and slot0.cur_tab_data.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
			slot0:updateMoreTeamHeroInfo()
			slot0:onFightArenapeakchampion(slot0.dic_more_team_data[slot0.cur_tab_data.fun_form_type], true)
		else
			slot0:onFightDrama()
		end
	else
		slot0:onFightDrama()
	end
end

function FormGoFightPanel.onSaveAdventureMine(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	if not slot0.tab_list[slot0.select_team_index] then
		return
	end

	if not slot0.setting.floor or not slot0.setting.room_id then
		return
	end

	slot3 = {}
	slot7 = slot0.select_team_index

	for slot7, slot8 in pairs(slot0.five_hero_vo[slot7]) do
		uv0(slot3, {
			pos = slot7,
			id = slot8.partner_id
		})
	end

	if #slot3 == 0 then
		message(TI18N("至少需要上阵一个英雄"))

		return
	end

	slot0.mine_pos_info = slot3

	AdventureController:getInstance():send20646(slot1, slot2, slot0.formation_type, slot3, slot0.hallows_id)
end

function FormGoFightPanel.onClickFightBtn(slot0)
	if not slot0.fun_form_type then
		return
	end

	if slot0.fun_form_type == PartnerConst.Fun_Form.Expedit_Fight then
		slot0:onFightExpedit()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.EndLess or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessWater or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessFire or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessWind or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessLightDark then
		slot0:onFightEndLess()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.GuildDun_AD then
		slot0:onFightGuildDun()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.ElementWater or slot0.fun_form_type == PartnerConst.Fun_Form.ElementFire or slot0.fun_form_type == PartnerConst.Fun_Form.ElementWind or slot0.fun_form_type == PartnerConst.Fun_Form.ElementLight or slot0.fun_form_type == PartnerConst.Fun_Form.ElementDark then
		slot0:onFightElement()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.Heaven or slot0.fun_form_type == PartnerConst.Fun_Form.HeavenBoss then
		slot0:onFightHeaven()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.CrossArena or slot0.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef then
		slot0:onFightCrossarena()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.LimitExercise then
		slot0:onFightLimitExercise()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.Sandybeach_boss then
		slot0:onFightSandybeachBoss()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.GuildSecretArea then
		slot0:onFightGuildSecretArea()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.Monopoly_Evt then
		slot0:onFightMonopolyEvt()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.Monopoly_Boss then
		slot0:onFightMonopolyBoss()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.PractiseTower then
		slot0:onFightPractiseTower()
	else
		slot0:onFightDrama()
	end
end

function FormGoFightPanel.onFightEliteMatch(slot0, slot1)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	slot2 = slot1 or slot0.setting.match_type
	slot5 = {}

	for slot9, slot10 in pairs(slot0:getDicTeamData(slot0.tab_list[slot0.select_team_index])) do
		slot11 = {
			order = slot0.tab_list[slot9].order
		}
		slot13 = {}

		if slot0.five_hero_vo[slot9] then
			for slot18, slot19 in pairs(slot14) do
				uv0(slot13, {
					pos = slot18,
					id = slot19.partner_id
				})
			end
		end

		slot11.formation_type = slot10.formation_type
		slot11.hallows_id = slot10.hallows_id
		slot11.pos_info = slot13

		uv0(slot5, slot11)
	end

	if slot2 == ElitematchConst.MatchType.eKingMatch then
		slot6 = false

		if not slot5[2] then
			slot6 = true
		end

		for slot10, slot11 in ipairs(slot5) do
			if #slot11.pos_info == 0 then
				slot6 = true

				break
			end
		end

		if slot6 then
			CommonAlert.show(TI18N("有队伍未设队伍信息确定要保存队伍？"), TI18N("确定"), function ()
				ElitematchController:getInstance():sender24921(uv0, uv1)
			end, TI18N("取消"), nil, , , {
				title = TI18N("保存队伍")
			})
		else
			ElitematchController:getInstance():sender24921(slot2, slot5)
		end
	else
		ElitematchController:getInstance():sender24921(slot2, slot5)
	end
end

function FormGoFightPanel.onFightYearMonster(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	if not slot0.setting then
		return
	end

	slot1 = slot0.setting.grid_index
	slot2 = {}

	uv0(slot2, {
		val2 = 0,
		type = ActionyearmonsterConstants.Proto_28203._1,
		val1 = slot0.formation_type
	})

	slot7 = slot0.hallows_id

	uv0(slot2, {
		val2 = 0,
		type = ActionyearmonsterConstants.Proto_28203._2,
		val1 = slot7
	})

	slot6 = slot0.select_team_index

	for slot6, slot7 in pairs(slot0.five_hero_vo[slot6]) do
		uv0(slot2, {
			type = ActionyearmonsterConstants.Proto_28203._3,
			val1 = slot6,
			val2 = slot7.partner_id
		})
	end

	ActionyearmonsterController:getInstance():sender28203(slot0.setting.grid_index, 1, slot2)
end

function FormGoFightPanel.onFightWhiteDayMonster(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	slot1 = {}
	slot5 = slot0.select_team_index

	for slot5, slot6 in pairs(slot0.five_hero_vo[slot5]) do
		uv0(slot1, {
			pos = slot5,
			id = slot6.partner_id
		})
	end

	if next(slot1) == nil then
		message(TI18N("至少需要上阵一个英雄"))

		return
	end

	ActionController:getInstance():sender28801(slot0.setting.select_base_id, slot0.formation_type, slot1, slot0.hallows_id)
	slot0:onClickCloseBtn()
end

function FormGoFightPanel.onFightPractiseTower(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	slot1 = {}
	slot5 = slot0.select_team_index

	for slot5, slot6 in pairs(slot0.five_hero_vo[slot5]) do
		uv0(slot1, {
			pos = slot5,
			id = slot6.partner_id
		})
	end

	if next(slot1) == nil then
		message(TI18N("至少需要上阵一个英雄"))

		return
	end

	if slot0.setting and slot0.setting.is_send == true then
		PractisetowerController:getInstance():openResultWindow(false)
	end

	if slot0.setting and slot0.setting.power and slot0.cur_power and slot0.cur_power < slot0.setting.power then
		CommonAlert.show(string.format(TI18N("当前队伍战力未达推荐战力(<div fontColor=#d95014 >%s/%s</div>)，挑战难度较大，是否确认挑战？"), slot0.cur_power, slot0.setting.power), TI18N("确定"), function ()
			PractisetowerController:getInstance():sender29101(uv0.setting.select_base_id, uv0.formation_type, uv1, uv0.hallows_id)
			uv0:onClickCloseBtn()
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, , , true)

		return
	end

	PractisetowerController:getInstance():sender29101(slot0.setting.select_base_id, slot0.formation_type, slot1, slot0.hallows_id)
	slot0:onClickCloseBtn()
end

function FormGoFightPanel.onFightGuildDun(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	slot1 = {}
	slot5 = slot0.select_team_index

	for slot5, slot6 in pairs(slot0.five_hero_vo[slot5]) do
		uv0(slot1, {
			pos = slot5,
			id = slot6.partner_id
		})
	end

	GuildbossController:getInstance():send21308(slot0.setting.boss_id, slot0.formation_type, slot1, slot0.hallows_id)
	slot0:onClickCloseBtn()
end

function FormGoFightPanel.onFightGuildSecretArea(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	slot1 = {}
	slot5 = slot0.select_team_index

	for slot5, slot6 in pairs(slot0.five_hero_vo[slot5]) do
		uv0(slot1, {
			pos = slot5,
			id = slot6.partner_id
		})
	end

	GuildsecretareaController:getInstance():sender26802(slot0.setting.boss_id, slot0.formation_type, slot1, slot0.hallows_id)
	slot0:onClickCloseBtn()
end

function FormGoFightPanel.onFightEndLess(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	slot5 = slot0.select_team_index

	for slot5, slot6 in pairs(slot0.five_hero_vo[slot5]) do
		uv0({}, {
			pos = slot5,
			owner_id = slot6.rid,
			owner_srv_id = slot6.srv_id,
			id = slot6.partner_id
		})
	end

	slot2 = Endless_trailEvent.endless_type.old

	if slot0.fun_form_type == PartnerConst.Fun_Form.EndLessWater then
		slot2 = Endless_trailEvent.endless_type.water
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.EndLessFire then
		slot2 = Endless_trailEvent.endless_type.fire
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.EndLessWind then
		slot2 = Endless_trailEvent.endless_type.wind
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.EndLessLightDark then
		slot2 = Endless_trailEvent.endless_type.light_dark
	end

	Endless_trailController:getInstance():send23901(slot2, slot0.formation_type, slot1, slot0.hallows_id)
	slot0:onClickCloseBtn()
end

function FormGoFightPanel.onFightStarTower(slot0)
	StartowerController:getInstance():sender11322(slot0.setting.tower_lev or 0)
end

function FormGoFightPanel.onFightExpedit(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	slot1 = {}
	slot5 = slot0.select_team_index

	for slot5, slot6 in pairs(slot0.five_hero_vo[slot5]) do
		uv0(slot1, {
			pos = slot5,
			owner_id = slot6.rid,
			owner_srv_id = slot6.srv_id,
			id = slot6.partner_id
		})
	end

	HeroExpeditController:getInstance():sender24403(slot0.formation_type, slot1, slot0.hallows_id)
	slot0:onClickCloseBtn()
end

function FormGoFightPanel.onFightElement(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	if not slot0:checkIsCanFight() then
		message(slot0.setting.limit_desc)

		return
	end

	slot1 = false
	slot5 = slot0.select_team_index

	for slot5, slot6 in pairs(slot0.five_hero_vo[slot5]) do
		if not slot6.isResonateHero or not slot6:isResonateHero() then
			slot1 = true
		end
	end

	if not slot1 then
		message(TI18N("至少上阵一个非赋能英雄"))

		return
	end

	slot2 = {}
	slot6 = slot0.select_team_index

	for slot6, slot7 in pairs(slot0.five_hero_vo[slot6]) do
		uv0(slot2, {
			pos = slot6,
			id = slot7.partner_id
		})
	end

	ElementController:getInstance():checkJoinHeavenBattle(slot0.setting.ele_type, slot0.setting.customs_id, slot0.formation_type, slot2, slot0.hallows_id)
end

function FormGoFightPanel.onFightMonopolyEvt(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	slot1 = {}
	slot5 = slot0.select_team_index

	for slot5, slot6 in pairs(slot0.five_hero_vo[slot5]) do
		uv0(slot1, {
			type = 2,
			arg1 = slot5,
			arg2 = slot6.partner_id
		})
	end

	if next(slot1) == nil then
		message(TI18N("至少需要上阵一个英雄"))

		return
	end

	uv0(slot1, {
		arg2 = 0,
		type = 1,
		arg1 = slot0.formation_type
	})
	uv0(slot1, {
		arg2 = 0,
		type = 3,
		arg1 = slot0.hallows_id
	})
	MonopolyController:getInstance():sender27404(slot1)
	slot0:onClickCloseBtn(true)
end

function FormGoFightPanel.onFightMonopolyBoss(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	slot1 = {}
	slot5 = slot0.select_team_index

	for slot5, slot6 in pairs(slot0.five_hero_vo[slot5]) do
		uv0(slot1, {
			pos = slot5,
			id = slot6.partner_id
		})
	end

	if next(slot1) == nil then
		message(TI18N("至少需要上阵一个英雄"))

		return
	end

	MonopolyController:getInstance():sender27501(slot0.setting.step_id, slot0.setting.boss_id, slot0.formation_type, slot1, slot0.hallows_id)
	slot0:onClickCloseBtn()
end

function FormGoFightPanel.onFightHeaven(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	slot1 = 1

	if slot0.fun_form_type == PartnerConst.Fun_Form.HeavenBoss then
		slot1 = 2
	end

	slot4 = {}

	for slot8, slot9 in pairs(slot0:getDicTeamData(slot0.tab_list[slot0.select_team_index])) do
		slot10 = {
			order = slot0.tab_list[slot8].order
		}
		slot12 = {}

		if slot0.five_hero_vo[slot8] then
			for slot17, slot18 in pairs(slot13) do
				uv0(slot12, {
					pos = slot17,
					id = slot18.partner_id
				})
			end
		end

		slot10.formation_type = slot9.formation_type
		slot10.hallows_id = slot9.hallows_id
		slot10.pos_info = slot12

		uv0(slot4, slot10)
	end

	slot5 = false

	for slot9, slot10 in ipairs(slot4) do
		if #slot10.pos_info > 0 then
			slot5 = true

			break
		end
	end

	if not slot5 then
		message(TI18N("至少需要上阵一个英雄"))

		return
	end

	if slot1 == 2 then
		slot6 = false

		if not slot4[2] then
			slot6 = true
		end

		for slot10, slot11 in ipairs(slot4) do
			if #slot11.pos_info == 0 then
				slot6 = true

				break
			end
		end

		if slot6 then
			CommonAlert.show(TI18N("当前只布阵了一支队伍，确定要进入战斗吗？"), TI18N("确定"), function ()
				HeavenController:getInstance():checkJoinHeavenBattle(uv0, uv1)
			end, TI18N("取消"), nil, , , {
				title = TI18N("保存队伍")
			})
		else
			HeavenController:getInstance():checkJoinHeavenBattle(slot1, slot4)
		end
	else
		HeavenController:getInstance():checkJoinHeavenBattle(slot1, slot4)
	end
end

function FormGoFightPanel.onFightCrossarena(slot0, slot1, slot2, slot3)
	slot5 = slot2 or slot0.fun_form_type

	if (slot1 or slot0.team_data_list) and next(slot4) ~= nil then
		if not slot3 then
			for slot9, slot10 in ipairs(slot4) do
				if slot9 > 1 then
					slot10.pos_info = {}

					if slot0.five_hero_vo[slot9] then
						for slot15, slot16 in pairs(slot11) do
							uv0(slot10.pos_info, {
								id = slot16.id,
								pos = slot15
							})
						end
					end
				end
			end

			uv1(slot4, 1)
		end

		slot7 = 0

		for slot11, slot12 in pairs(slot4) do
			if slot12.pos_info and next(slot12.pos_info) ~= nil then
				slot6 = 0 + 1
			end

			if slot12.is_hidden == 1 then
				slot7 = slot7 + 1
			end
		end

		if slot6 < 2 then
			message(TI18N("至少需2个队伍有英雄上阵"))

			return
		end

		slot8 = 1

		if slot5 == PartnerConst.Fun_Form.CrossArenaDef then
			slot8 = 2
		end

		if slot8 == 2 and CrossarenaController:getInstance():getModel():checkIsCanHideTwoTeam() and slot7 ~= 2 then
			if Config.ArenaClusterData.data_const.second_hide_rank then
				message(uv2(TI18N("前%d名的玩家需要隐藏2队哦~"), slot9.val))
			end

			return
		end

		slot9 = {}

		for slot13, slot14 in ipairs(slot4) do
			if slot14.old_order == nil then
				uv0(slot9, {
					team = slot14.order,
					old_team = slot14.order
				})
			else
				uv0(slot9, {
					team = slot14.order,
					old_team = slot14.old_order
				})
			end

			slot14.old_order = nil
		end

		uv3:send26564(slot5, slot9)
		CrossarenaController:getInstance():sender25604(slot8, slot4)
	end
end

function FormGoFightPanel.onFightArenapeakchampion(slot0, slot1, slot2)
	if (slot1 or slot0.team_data_list) and next(slot3) ~= nil then
		if not slot2 then
			for slot7, slot8 in ipairs(slot3) do
				if slot7 > 1 then
					slot8.pos_info = {}

					if slot0.five_hero_vo[slot7] then
						for slot13, slot14 in pairs(slot9) do
							uv0(slot8.pos_info, {
								id = slot14.id,
								pos = slot13
							})
						end
					end

					slot8.is_hidden = nil
				end
			end

			uv1(slot3, 1)
		end

		slot5 = 0

		for slot9, slot10 in pairs(slot3) do
			if slot10.pos_info and next(slot10.pos_info) ~= nil then
				slot4 = 0 + 1
			end
		end

		if slot4 < 2 then
			message(TI18N("至少需2个队伍有英雄上阵"))

			return
		end

		slot6 = {}

		for slot10, slot11 in ipairs(slot3) do
			if slot11.old_order == nil then
				uv0(slot6, {
					team = slot11.order,
					old_team = slot11.order
				})
			else
				uv0(slot6, {
					team = slot11.order,
					old_team = slot11.old_order
				})
			end

			slot11.old_order = nil
		end

		uv2:send26564(PartnerConst.Fun_Form.ArenapeakchampionDef, slot6)
		ArenapeakchampionController:getInstance():sender27725(slot3)
	end
end

function FormGoFightPanel.checkIsCanFight(slot0)
	slot1 = true

	for slot6, slot7 in ipairs(slot0.setting.limit or {}) do
		slot8 = slot7[1]
		slot9 = slot7[2]

		if slot1 then
			slot14 = slot0.select_team_index

			for slot14, slot15 in pairs(slot0.five_hero_vo[slot14]) do
				if slot15.camp_type == slot8 then
					slot10 = 0 + 1
				end
			end

			slot1 = slot9 <= slot10
		else
			break
		end
	end

	return slot1
end

function FormGoFightPanel.onFightDrama(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	if not slot0.tab_list[slot0.select_team_index] then
		return
	end

	slot1 = slot0.tab_list[slot0.select_team_index]
	slot2 = {}
	slot6 = slot0.select_team_index

	for slot6, slot7 in pairs(slot0.five_hero_vo[slot6]) do
		if slot1 and slot1.fun_form_type == PartnerConst.Fun_Form.Planes then
			uv0(slot2, {
				pos = slot6,
				id = slot7.partner_id,
				flag = slot7.flag or 0
			})
		else
			uv0(slot2, slot8)
		end
	end

	if #slot2 == 0 then
		message(TI18N("至少需要上阵一个英雄"))

		return
	end

	if slot1.fun_form_type == PartnerConst.Fun_Form.EliteMatch then
		slot0:onFightEliteMatch(1)
	elseif slot1.fun_form_type == PartnerConst.Fun_Form.Planes then
		slot3 = {}
		slot7 = slot0.select_team_index

		for slot7, slot8 in pairs(slot0.five_hero_vo[slot7]) do
			if slot8.flag and slot8.flag == 1 then
				-- Nothing
			end

			uv0(slot3, {
				pos = slot7,
				id = slot8.partner_id,
				data = slot8
			})
		end

		GlobalEvent:getInstance():Fire(PlanesafkEvent.Update_Form_Data_Event, slot0.formation_type, slot3)
		PlanesafkController:getInstance():sender28611(slot0.formation_type, slot2, slot0.hallows_id)
	else
		if slot1.fun_form_type == PartnerConst.Fun_Form.Drama then
			slot3 = false
			slot7 = slot0.select_team_index

			for slot7, slot8 in pairs(slot0.five_hero_vo[slot7]) do
				if not slot8.isResonateHero or not slot8:isResonateHero() then
					slot3 = true
				end
			end

			if not slot3 then
				message(TI18N("至少上阵一个非赋能英雄"))

				return
			end
		end

		uv1:sender11212(slot1.fun_form_type, slot0.formation_type, slot2, slot0.hallows_id)
	end
end

function FormGoFightPanel.onFightLimitExercise(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	if not slot0.tab_list[slot0.select_team_index] then
		return
	end

	slot1 = {}
	slot5 = slot0.select_team_index

	for slot5, slot6 in pairs(slot0.five_hero_vo[slot5]) do
		uv0(slot1, {
			pos = slot5,
			id = slot6.partner_id
		})
	end

	if #slot1 == 0 then
		message(TI18N("至少需要上阵一个英雄"))

		return
	end

	uv1:sender11212(PartnerConst.Fun_Form.LimitExercise, slot0.formation_type, slot1, slot0.hallows_id)
end

function FormGoFightPanel.onFightSandybeachBoss(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	if not slot0.tab_list[slot0.select_team_index] then
		return
	end

	slot1 = {}
	slot5 = slot0.select_team_index

	for slot5, slot6 in pairs(slot0.five_hero_vo[slot5]) do
		uv0(slot1, {
			pos = slot5,
			id = slot6.partner_id
		})
	end

	if #slot1 == 0 then
		message(TI18N("至少需要上阵一个英雄"))

		return
	end

	uv1:sender11212(PartnerConst.Fun_Form.Sandybeach_boss, slot0.formation_type, slot1, slot0.hallows_id)
end

function FormGoFightPanel.gotoFight(slot0)
	if slot0.fun_form_type ~= PartnerConst.Fun_Form.LimitExercise and slot0.fun_form_type ~= PartnerConst.Fun_Form.Sandybeach_boss and slot0.fun_form_type ~= PartnerConst.Fun_Form.Adventure_Mine then
		slot0:onClickCloseBtn()
	end

	if slot0.fun_form_type == PartnerConst.Fun_Form.Drama then
		BattleDramaController:getInstance():send13003(0)
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.Startower then
		slot0:onFightStarTower()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.Sandybeach_boss then
		-- Nothing
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.Adventure_Mine then
		slot1 = slot0.setting.floor
		slot2 = slot0.setting.room_id
		slot3 = 0

		if slot0.is_skip_fight then
			slot3 = 1
		end

		AdventureController:getInstance():send20643(slot1, slot2, slot3)
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.TermBegins then
		ActiontermbeginsController:getInstance():sender26702()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.TermBeginsBoss then
		ActiontermbeginsController:getInstance():sender26707()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.YearMonster then
		slot0:onFightYearMonster()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.WhiteDay then
		slot0:onFightWhiteDayMonster()
	end
end

function FormGoFightPanel.onClickHeroItemMove(slot0, slot1, slot2)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	slot0.is_move_hero = true

	if slot0.move_hero_item == nil then
		slot0.move_hero_item = HeroExhibitionItem.new(0.9, false)

		slot0.fight_hero_node:addChild(slot0.move_hero_item, 1)
	end

	slot0.move_hero_item:setIconClarity(0)
	slot0.move_hero_item:setData(slot0.five_hero_vo[slot0.select_team_index][slot1])
	slot0.hero_item_list[slot1]:setData(nil)

	slot3 = slot2:getTouchMovePosition()
	slot4 = slot0.fight_hero_node:convertToNodeSpace(slot3)

	slot0.five_spine_list[slot1]:setPosition(cc.p(slot0.hero_pos[slot1]:convertToNodeSpace(slot3)))
end

function FormGoFightPanel.onClickHeroItemCanceled(slot0, slot1, slot2)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	slot0.is_move_hero = false

	if slot0.move_hero_item then
		slot0.move_hero_item:setPosition(-10000, 0)
	end

	for slot8, slot9 in ipairs(slot0.pos_rect_list) do
		if cc.rectContainsPoint(slot9, slot0.fight_hero_node:convertToNodeSpace(slot2:getTouchMovePosition())) and slot8 ~= slot1 then
			slot0.hero_item_list[slot8]:setData(slot0.five_hero_vo[slot0.select_team_index][slot1])
			slot0.hero_item_list[slot8]:setIconClarity(0)

			slot0.five_hero_vo[slot0.select_team_index][slot8] = slot0.five_hero_vo[slot0.select_team_index][slot1]

			if slot0.five_hero_vo[slot0.select_team_index][slot8] ~= nil then
				slot0.hero_item_list[slot1]:setData(slot10)
				slot0.hero_item_list[slot1]:setIconClarity(0)

				slot0.five_hero_vo[slot0.select_team_index][slot1] = slot10
				slot11 = slot0.hero_pos[slot8]:getChildByName("Herospine" .. slot8)
				slot12 = slot0.hero_pos[slot1]:getChildByName("Herospine" .. slot1)

				slot11:retain()
				slot12:retain()
				slot11:removeFromParent()
				slot12:removeFromParent()
				slot0.hero_pos[slot1]:addChild(slot11)
				slot11:setName("Herospine" .. slot1)
				slot0.hero_pos[slot8]:addChild(slot12)
				slot12:setName("Herospine" .. slot8)
				slot11:release()
				slot12:release()

				slot0.five_spine_list[slot1] = slot0.five_spine_list[slot8]
				slot0.five_spine_list[slot8] = slot0.five_spine_list[slot1]

				slot0.five_spine_list[slot8]:setPosition(cc.p(70, 20))
				slot0.five_spine_list[slot1]:setPosition(cc.p(70, 20))
			else
				slot11 = slot0.hero_pos[slot1]:getChildByName("Herospine" .. slot1)

				slot11:retain()
				slot11:removeFromParent()
				slot0.hero_pos[slot8]:addChild(slot11)
				slot11:setName("Herospine" .. slot8)
				slot11:release()

				slot0.five_spine_list[slot8] = slot0.five_spine_list[slot1]

				slot0.five_spine_list[slot8]:setPosition(cc.p(70, 20))
				slot0.hero_item_list[slot1]:setData(nil)

				slot0.five_hero_vo[slot0.select_team_index][slot1] = nil
			end

			return
		end
	end

	slot0.hero_item_list[slot1]:setData(slot0.five_hero_vo[slot0.select_team_index][slot1])
	slot0.five_spine_list[slot1]:setPosition(cc.p(70, 20))
	slot0.hero_item_list[slot1]:setIconClarity(0)
end

function FormGoFightPanel.onClickHeroItemEnd(slot0, slot1, slot2)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	if slot0.move_hero_item then
		slot0.move_hero_item:setPosition(-10000, 0)
	end

	if slot0.list_view then
		for slot7, slot8 in ipairs(slot0.list_view:getActiveCellList() or {}) do
			slot9 = slot8:getData()

			if slot0.five_hero_vo[slot0.select_team_index][slot1] and slot9 and slot9.partner_id == slot0.five_hero_vo[slot0.select_team_index][slot1].partner_id and slot9.rid == slot0.five_hero_vo[slot0.select_team_index][slot1].rid and slot9.srv_id == slot0.five_hero_vo[slot0.select_team_index][slot1].srv_id then
				slot9.is_ui_select = false

				slot8:setSelected(slot9.is_ui_select)

				slot12, slot13 = slot0.hero_item_list[slot1]:getPosition()

				slot0:showMoveEffect(cc.p(slot12, slot13), slot0.fight_hero_node:convertToNodeSpace(slot8:convertToWorldSpace(cc.p(HeroExhibitionItem.Width * 0.5, HeroExhibitionItem.Height * 0.5))), slot9, function ()
					uv0.five_spine_list[uv1]:removeFromParent()

					uv0.five_spine_list[uv1] = nil
				end, slot1)
				slot0.hero_item_list[slot1]:setData(nil)

				slot0.five_hero_vo[slot0.select_team_index][slot1] = nil

				slot0:updateMoreTeamHeroInfo()
				slot0:updateFightPower()

				return
			end
		end
	end

	if not slot0.five_hero_vo[slot0.select_team_index][slot1] then
		return
	end

	if slot0.camp_btn_list[slot3.camp_type] == nil then
		slot4 = slot0.camp_btn_list[0]
	end

	slot7, slot8 = slot0.hero_item_list[slot1]:getPosition()

	slot0:showMoveEffect(cc.p(slot7, slot8), slot0.fight_hero_node:convertToNodeSpace(slot4:convertToWorldSpace(cc.p(29, 29))), slot3)
	slot0.five_spine_list[slot1]:removeFromParent()

	slot0.five_spine_list[slot1] = nil
	slot0.five_hero_vo[slot0.select_team_index][slot1].is_ui_select = false

	slot0.hero_item_list[slot1]:setData(nil)

	slot0.five_hero_vo[slot0.select_team_index][slot1] = nil

	slot0:updateMoreTeamHeroInfo()
	slot0:updateFightPower()
end

function FormGoFightPanel.onClickBtnShowByIndex(slot0, slot1)
	if slot0.img_select and slot0.camp_btn_list[slot1] then
		slot2, slot3 = slot0.camp_btn_list[slot1]:getPosition()

		slot0.img_select:setPosition(slot2 - 0.5, slot3 + 1)
	end

	slot0:updateHeroList(slot1)
end

function FormGoFightPanel.setCampBtnUnEnabled(slot0, slot1)
	if slot1 and next(slot1) ~= nil and slot0.camp_btn_list and next(slot0.camp_btn_list) ~= nil then
		for slot5, slot6 in pairs(slot1) do
			if slot0.camp_btn_list[slot6] then
				setChildUnEnabled(true, slot0.camp_btn_list[slot6])
				slot0.camp_btn_list[slot6]:setTouchEnabled(false)
			end
		end
	end
end

function FormGoFightPanel.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.fun_form_type = slot1 or PartnerConst.Fun_Form.Drama
	slot0.form_show_type = slot3 or HeroConst.FormShowType.eFormFight
	slot0.select_team_index = 0
	slot0.setting = slot2 or {}

	slot0:initTabBtnList()

	slot4 = {}

	if slot0.fun_form_type == PartnerConst.Fun_Form.EndLessWater then
		slot0:onClickBtnShowByIndex(HeroConst.CampType.eWater)

		slot4 = {
			0,
			HeroConst.CampType.eFire,
			HeroConst.CampType.eWind,
			HeroConst.CampType.eLight,
			HeroConst.CampType.eDark
		}
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.EndLessFire then
		slot0:onClickBtnShowByIndex(HeroConst.CampType.eFire)

		slot4 = {
			0,
			HeroConst.CampType.eWater,
			HeroConst.CampType.eWind,
			HeroConst.CampType.eLight,
			HeroConst.CampType.eDark
		}
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.EndLessWind then
		slot0:onClickBtnShowByIndex(HeroConst.CampType.eWind)

		slot4 = {
			0,
			HeroConst.CampType.eWater,
			HeroConst.CampType.eFire,
			HeroConst.CampType.eLight,
			HeroConst.CampType.eDark
		}
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.EndLessLightDark then
		slot0:onClickBtnShowByIndex(HeroConst.CampType.eLight)

		slot4 = {
			0,
			HeroConst.CampType.eWater,
			HeroConst.CampType.eFire,
			HeroConst.CampType.eWind
		}
	else
		slot0:onClickBtnShowByIndex(0)
	end

	slot0:setCampBtnUnEnabled(slot4)
	slot0:initFormSetInfo()
	slot0.close_btn:setVisible(slot0.fun_form_type ~= PartnerConst.Fun_Form.Monopoly_Evt)
	slot0.txt_cn_common_notice_1:setVisible(slot0.fun_form_type ~= PartnerConst.Fun_Form.Monopoly_Evt)
	slot0:setShowTypeUI()
end

function FormGoFightPanel.initFormSetInfo(slot0)
	if slot0.fun_form_type == PartnerConst.Fun_Form.ElementWater or slot0.fun_form_type == PartnerConst.Fun_Form.ElementFire or slot0.fun_form_type == PartnerConst.Fun_Form.ElementWind or slot0.fun_form_type == PartnerConst.Fun_Form.ElementLight or slot0.fun_form_type == PartnerConst.Fun_Form.ElementDark then
		if slot0.setting.limit_desc then
			slot0.pos_tips:setString(slot0.setting.limit_desc)
		end
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.HeavenBoss then
		slot0.pos_tips:setString(TI18N("本关可上阵两支队伍"))
		slot0.pos_tips:setTextColor(cc.c3b(201, 38, 6))
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.CrossArena or slot0.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef or slot0.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
		slot0.form_panel:setVisible(false)
		slot0.form_list_panel:setVisible(false)
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.LimitExercise then
		-- Nothing
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.Adventure_Mine_Def then
		if slot0.setting.is_occupy and slot0.save_btn then
			slot0.save_btn:getChildByName("label"):setString(TI18N("占 领"))
		end

		AdventureController:getInstance():send20658()
		slot0:addDownTime()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.Adventure_Mine then
		slot0.is_skip_fight = SysEnv:getInstance():getBool(SysEnv.keys.adventure_mine_skip_fight, false)

		if slot0.checkbox then
			slot0.checkbox:setVisible(true)
			slot0.checkbox:setSelected(slot0.is_skip_fight)
		end
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.EliteMatch then
		slot0:addDownTime()
	elseif (slot0.fun_form_type == PartnerConst.Fun_Form.EndLessWater or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessFire or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessWind or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessLightDark) and Endless_trailEvent.type_name[slot0.fun_form_type] then
		slot0.pos_tips:setString(uv0(TI18N("只可上阵%s英雄"), Endless_trailEvent.type_name[slot0.fun_form_type]))
		slot0.pos_tips:setTextColor(cc.c3b(36, 144, 3))
	end
end

function FormGoFightPanel.sendByFormType(slot0, slot1)
	if slot0.dic_is_sends == nil then
		slot0.dic_is_sends = {}
	end

	if slot0.dic_is_sends[slot1] then
		return
	end

	slot0.dic_is_sends[slot1] = true

	if slot1 == PartnerConst.Fun_Form.Drama then
		slot0:initDramaFormInfo()
	elseif slot1 == PartnerConst.Fun_Form.EliteMatch then
		ElitematchController:getInstance():sender24920(slot0.setting.match_type or ElitematchConst.MatchType.eNormalMatch)
	elseif slot1 == PartnerConst.Fun_Form.Heaven then
		HeavenController:getInstance():sender25210(1)
	elseif slot1 == PartnerConst.Fun_Form.HeavenBoss then
		HeavenController:getInstance():sender25210(2)
	elseif slot1 == PartnerConst.Fun_Form.CrossArena then
		CrossarenaController:getInstance():sender25605(1)
	elseif slot1 == PartnerConst.Fun_Form.CrossArenaDef then
		CrossarenaController:getInstance():sender25605(2)
	elseif slot1 == PartnerConst.Fun_Form.ArenapeakchampionDef then
		ArenapeakchampionController:getInstance():sender27726()
	elseif slot1 == PartnerConst.Fun_Form.Adventure_Mine_Def then
		slot0:initMineFormInfo()
	elseif slot1 == PartnerConst.Fun_Form.Planes then
		PlanesafkController:getInstance():sender28612()
	else
		uv0:sender11211(slot1)
	end

	if slot1 == PartnerConst.Fun_Form.EliteMatch then
		if (slot0.setting.match_type or ElitematchConst.MatchType.eNormalMatch) == 1 then
			uv1:send26555(PartnerConst.Fun_Form.EliteMatch)
		else
			uv1:send26555(PartnerConst.Fun_Form.EliteKingMatch)
		end
	elseif slot0.elfin_team_data_list[slot0.select_team_index] then
		slot0:updateElfinList(slot0.elfin_team_data_list[slot0.select_team_index])
	else
		uv1:send26555(slot1)
	end
end

function FormGoFightPanel.initTabBtnList(slot0)
	slot0.tab_list = {}

	if slot0.fun_form_type == PartnerConst.Fun_Form.Drama then
		if slot0.form_show_type == HeroConst.FormShowType.eFormFight then
			slot0:setTabData(slot0.fun_form_type, TI18N("队伍"), 1)
		else
			for slot5, slot6 in pairs(Config.PartnerData.data_partner_form) do
				slot0:setTabData(slot6.form_type, slot6.name, slot6.index, 1, false, true)
			end
		end
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.EliteMatch then
		slot1 = false

		if slot0.setting.match_type and slot0.setting.match_type == ElitematchConst.MatchType.eKingMatch then
			slot1 = true
		end

		slot0:setTabData(slot0.fun_form_type, TI18N("队伍一"), 1, 1, slot1)
		slot0:setTabData(slot0.fun_form_type, TI18N("队伍二"), 2, 2, slot1)
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.HeavenBoss then
		slot0:setTabData(slot0.fun_form_type, TI18N("队伍一"), 1, 1, true)
		slot0:setTabData(slot0.fun_form_type, TI18N("队伍二"), 2, 2, true)
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.CrossArena or slot0.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef or slot0.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
		slot0:setTabData(slot0.fun_form_type, TI18N("总览"), 1, 0, false)
		slot0:setTabData(slot0.fun_form_type, TI18N("队伍一"), 2, 1, true)
		slot0:setTabData(slot0.fun_form_type, TI18N("队伍二"), 3, 2, true)
		slot0:setTabData(slot0.fun_form_type, TI18N("队伍三"), 4, 3, true)
	else
		slot0:setTabData(slot0.fun_form_type, TI18N("队伍"), 1)
	end

	uv0(slot0.tab_list, SortTools.tableLowerSorter({
		"sort_index",
		"index"
	}))
	slot0:checkTabUnlockInfo()
	slot0:updateTabBtnList()
end

function FormGoFightPanel.setTabData(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot6 then
		if slot1 == PartnerConst.Fun_Form.Arena or slot1 == PartnerConst.Fun_Form.ArenaChampion then
			slot8, slot9 = MainSceneController:getInstance():checkBuildIsOpen(CenterSceneBuild.arena)
		elseif slot1 == PartnerConst.Fun_Form.Ladder then
			slot8, slot9 = LadderController:getInstance():getModel():getLadderOpenStatus(true)
			slot7.is_lock = not slot8
			slot7.is_lock_des = slot9 or TI18N("未解锁")
		elseif slot1 == PartnerConst.Fun_Form.EliteMatch then
			slot8, slot9, slot10 = ElitematchController:getInstance():getModel():checkElitematchIsOpen(true)
			slot7.is_lock = not slot8
			slot7.is_lock_des = slot10 or TI18N("未解锁")
		elseif slot1 == PartnerConst.Fun_Form.ArenaTeam then
			slot8, slot9 = ArenateamController:getInstance():getModel():checkArenaTeamIsOpen(true)
			slot7.is_lock_des = slot9 or TI18N("未解锁")
			slot7.is_lock = not slot8
		elseif slot1 == PartnerConst.Fun_Form.CrossArenaDef then
			slot8, slot9 = CrossarenaController:getInstance():getModel():getCrossarenaIsOpen(true)
			slot7.is_lock = not slot8
			slot7.is_lock_des = slot9 or TI18N("未解锁")
		elseif slot1 == PartnerConst.Fun_Form.ArenapeakchampionDef then
			slot8, slot9 = ArenapeakchampionController:getInstance():getModel():checkPeakChampionIsOpen(true)
			slot7.is_lock = not slot8
			slot7.is_lock_des = slot9 or TI18N("未解锁")
		end
	else
		slot7.sort_index = 0
		slot7.is_lock = false
	end

	uv0(slot0.tab_list, {
		fun_form_type = slot1,
		name = slot2,
		index = slot3,
		is_multiple = slot5 or false,
		order = slot4 or 1,
		sort_index = 0,
		is_lock = false,
		is_lock = not slot8,
		is_lock_des = slot9 or TI18N("未解锁")
	})
end

function FormGoFightPanel.setShowTypeUI(slot0)
	if slot0.form_show_type == HeroConst.FormShowType.eFormFight then
		slot0.fight_btn:setVisible(true)
		slot0.save_btn:setVisible(false)
		slot0.key_up_btn:setVisible(false)
	elseif slot0.form_show_type == HeroConst.FormShowType.eFormSave then
		slot0.fight_btn:setVisible(false)
		slot0.save_btn:setVisible(true)
		slot0.key_up_btn:setVisible(true)
	end
end

function FormGoFightPanel.updateTabBtnList(slot0)
	if not slot0.tab_btn then
		return
	end

	if not slot0.tab_btn_list_view then
		slot1 = slot0.tab_btn:getContentSize()
		slot0.tab_btn_list_view = CommonScrollViewSingleLayout.new(slot0.tab_btn, cc.p(slot1.width * 0.5, slot1.height * 0.5), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot1, {
			start_y = 0,
			item_height = 61,
			start_x = 0,
			space_y = 0,
			col = 5,
			space_x = 0,
			need_dynamic = true,
			item_width = 160
		}, cc.p(0.5, 0.5))

		slot0.tab_btn_list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCellTabBtn), ScrollViewFuncType.CreateNewCell)
		slot0.tab_btn_list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCellsTabBtn), ScrollViewFuncType.NumberOfCells)
		slot0.tab_btn_list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndexTabBtn), ScrollViewFuncType.UpdateCellByIndex)
		slot0.tab_btn_list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouchedTabBtn), ScrollViewFuncType.OnCellTouched)
	end

	slot0.tab_btn_list_view:reloadData(1)
end

function FormGoFightPanel.createNewCellTabBtn(slot0, slot1, slot2)
	slot3 = ccui.Widget:create()
	slot3.root_wnd = createCSBNote(PathTool.getTargetCSB("hero/form_go_fight_tab_btn"))

	slot3:addChild(slot3.root_wnd)
	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(cc.p(0.5, 0.5))
	slot3:setContentSize(cc.size(slot1, slot2))

	slot3.tab_btn = slot3.root_wnd:getChildByName("tab_btn")
	slot3.normal_img = slot3.tab_btn:getChildByName("normal_img")
	slot3.select_img = slot3.tab_btn:getChildByName("select_img")

	slot3.select_img:setVisible(false)
	slot3.tab_btn:setSwallowTouches(false)

	slot3.label = slot3.tab_btn:getChildByName("label")
	slot3.red_point = slot3.tab_btn:getChildByName("red_point")

	registerButtonEventListener(slot3.tab_btn, function ()
		uv0:onCellTouchedTabBtn(uv1)
	end, false, 2, nil, , , true)

	return slot3
end

function FormGoFightPanel.numberOfCellsTabBtn(slot0)
	if not slot0.tab_list then
		return 0
	end

	return #slot0.tab_list
end

function FormGoFightPanel.updateCellByIndexTabBtn(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.tab_list[slot2] then
		slot1.label:setString(slot3.name)

		if slot0.select_team_index == slot2 then
			slot1.select_img:setVisible(true)
		else
			slot1.select_img:setVisible(false)
		end

		if slot3.is_lock ~= nil then
			if slot3.is_lock then
				slot1.label:disableEffect(cc.LabelEffect.OUTLINE)
				setChildUnEnabled(true, slot1.tab_btn)
			else
				if slot0.select_team_index and slot0.select_team_index == slot3.index then
					slot1.label:setTextColor(cc.c4b(239, 245, 254, 255))
				else
					slot1.label:setTextColor(cc.c4b(215, 226, 227, 255))
				end

				slot1.label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
				setChildUnEnabled(false, slot1.tab_btn)
			end
		end
	end
end

function FormGoFightPanel.onCellTouchedTabBtn(slot0, slot1)
	slot0:changeTabType(slot1.index, true)
end

function FormGoFightPanel.changeTabType(slot0, slot1, slot2, slot3)
	if not slot0.tab_btn_list_view then
		return
	end

	if not slot0.tab_btn_list_view:isActiveByIndex(slot1) then
		return
	end

	if not slot1 then
		return
	end

	if slot2 and slot0.select_team_index == slot1 then
		return
	end

	if slot0.fun_form_type == PartnerConst.Fun_Form.EliteMatch then
		if slot1 == 2 and slot0.tab_list[slot1].is_lock then
			if slot0.setting.match_type == ElitematchConst.MatchType.eKingMatch then
				if Config.ArenaEliteData.data_elite_const.second_team_open_condition then
					message(slot5.desc)
				else
					message(TI18N("觉醒神技转化【阿修罗·壹雾银】后开启"))
				end
			else
				message(TI18N("进入王者赛开启第二队伍的使用"))
			end

			return
		end
	elseif slot4.is_lock then
		message(slot4.is_lock_des)

		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.select_img:setVisible(false)
		slot0.cur_tab.label:setTextColor(cc.c4b(215, 226, 227, 255))
	end

	slot0.select_team_index = slot1
	slot0.cur_tab_data = slot4
	slot0.cur_tab = slot0.tab_btn_list_view:getCellByIndex(slot0.select_team_index)

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.select_img:setVisible(true)
		slot0.cur_tab.label:setTextColor(cc.c4b(239, 245, 254, 255))
	end

	if slot4 then
		if slot4.fun_form_type == PartnerConst.Fun_Form.CrossArena or slot4.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef or slot4.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
			if slot0.fun_form_type == PartnerConst.Fun_Form.Drama then
				slot0.team_select_team_index = nil

				if slot0.dic_more_team_data[slot4.fun_form_type] ~= nil then
					slot0:onClickTeamTabBtn(1)
				else
					slot0:sendByFormType(slot4.fun_form_type)
				end

				slot0:setMoreTeamUi(true)
			else
				if not slot0.team_data_list or next(slot0.team_data_list) == nil then
					slot0:sendByFormType(slot4.fun_form_type)
				else
					slot0:initCrossarenaFormInfo()
				end

				slot0:setMoreTeamUi(false)
			end
		else
			if slot0.team_data_list[slot0.select_team_index] ~= nil then
				slot0.form_panel:setVisible(true)
				slot0.form_list_panel:setVisible(false)
				slot0:initFormInfo(slot0.team_data_list[slot0.select_team_index])

				if slot0.elfin_team_data_list[slot0.select_team_index] then
					slot0:updateElfinList(slot0.elfin_team_data_list[slot0.select_team_index])
				end
			else
				slot0:sendByFormType(slot4.fun_form_type)
			end

			slot0:setMoreTeamUi(false)
		end
	end
end

function FormGoFightPanel.setMoreTeamUi(slot0, slot1)
	if not slot0.team_tab_btn then
		return
	end

	if not slot0.txt_cn_common_notice_1 then
		return
	end

	if slot1 then
		slot0.team_tab_btn:setVisible(true)
		slot0.txt_cn_common_notice_1:setVisible(false)
	else
		slot0.team_tab_btn:setVisible(false)
		slot0.txt_cn_common_notice_1:setVisible(true)
	end
end

function FormGoFightPanel.onClickTeamTabBtn(slot0, slot1, slot2)
	if slot2 and slot0.select_team_index and slot0.select_team_index == slot1 then
		return
	end

	if not slot0.cur_tab_data then
		return
	end

	if not slot0.dic_more_team_data[slot0.cur_tab_data.fun_form_type] then
		return
	end

	if slot0.team_cur_tab ~= nil then
		slot0.team_cur_tab.select_img:setVisible(false)
		slot0.team_cur_tab.label:setTextColor(cc.c4b(215, 226, 227, 255))
	end

	slot3 = false

	if slot0.team_select_team_index ~= nil and slot0.team_select_team_index > 1 then
		slot0:updateMoreTeamHeroInfo(slot0.team_data_list[slot0.select_team_index].formation_type, slot0.team_data_list[slot0.select_team_index].hallows_id)
	elseif slot0.team_select_team_index and slot0.team_select_team_index == 1 and slot1 ~= 1 then
		slot3 = true
	end

	slot0.team_select_team_index = slot1
	slot0.team_cur_tab = slot0.team_tab_list[slot1]

	if slot0.team_cur_tab ~= nil then
		slot0.team_cur_tab.select_img:setVisible(true)
		slot0.team_cur_tab.label:setTextColor(cc.c4b(239, 245, 254, 255))
	end

	slot0:teamInitFormInfo(slot1, slot3)
end

function FormGoFightPanel.updateMoreTeamHeroInfo(slot0, slot1, slot2)
	if slot0.fun_form_type == PartnerConst.Fun_Form.Drama and slot0.cur_tab_data and (slot0.cur_tab_data.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef or slot0.cur_tab_data.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef) then
		slot4 = slot0.dic_more_team_data[slot0.cur_tab_data.fun_form_type][slot0.team_select_team_index - 1]

		if slot0.five_hero_vo[slot0.select_team_index] and slot4 then
			slot4.pos_info = {}

			if slot1 then
				slot4.formation_type = slot1
			end

			if slot2 then
				slot4.hallows_id = slot2
			end

			for slot9, slot10 in pairs(slot5) do
				uv0(slot4.pos_info, {
					id = slot10.id,
					pos = slot9
				})
			end
		end
	end
end

function FormGoFightPanel.checkTabUnlockInfo(slot0)
	if slot0.fun_form_type == PartnerConst.Fun_Form.EliteMatch then
		for slot4, slot5 in ipairs(slot0.tab_list) do
			if slot4 == 2 then
				if slot0.setting.match_type == ElitematchConst.MatchType.eKingMatch then
					if Config.ArenaEliteData.data_elite_const.second_team_open_condition then
						slot5.is_lock = not HallowsController:getInstance():getModel():checkHallowsMagicIsHave(slot6.val)
					else
						slot5.is_lock = not HallowsController:getInstance():getModel():checkHallowsMagicIsHave(2)
					end
				else
					slot5.is_lock = true
				end
			else
				slot5.is_lock = false
			end
		end
	end
end

function FormGoFightPanel.setEliteMatchDefaultInfo(slot0, slot1)
	if not slot1 then
		return
	end

	for slot5 = 1, slot1 do
		if (slot0.setting.match_type and slot0.setting.match_type == ElitematchConst.MatchType.eKingMatch or slot0.fun_form_type == PartnerConst.Fun_Form.HeavenBoss or slot0.fun_form_type == PartnerConst.Fun_Form.CrossArena or slot0.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef or slot0.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef) and slot0.team_data_list[slot5] == nil then
			slot0.team_data_list[slot5] = {
				formation_type = 1,
				hallows_id = 0,
				pos_info = {}
			}
		end
	end
end

function FormGoFightPanel.setTeamMactchDefaultInfo(slot0, slot1, slot2, slot3)
	if not slot1 then
		return {}
	end

	slot5 = {
		[slot10.order] = slot10
	}

	for slot9, slot10 in ipairs(slot2 or {}) do
		-- Nothing
	end

	for slot9 = 1, slot1 do
		if slot5[slot9] == nil then
			slot5[slot9] = {
				formation_type = 1,
				hallows_id = 0,
				pos_info = {},
				order = slot9
			}
		end
	end

	return slot5
end

function FormGoFightPanel.getDicTeamData(slot0, slot1)
	if not slot1 then
		return {}
	end

	slot2 = {}
	slot3 = nil

	if slot1.is_multiple then
		for slot7, slot8 in ipairs(slot0.tab_list) do
			if slot1.fun_form_type == slot8.fun_form_type then
				slot2[slot7] = slot0.team_data_list[slot7]
			end
		end
	else
		slot2[slot0.select_team_index] = slot0.team_data_list[slot0.select_team_index]

		if slot0.fun_form_type == PartnerConst.Fun_Form.Drama and (slot1.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef or slot1.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef) then
			slot3 = slot0.dic_more_team_data[slot1.fun_form_type]
		end
	end

	return slot2, slot3
end

function FormGoFightPanel.setHeroIsSelect(slot0)
	for slot5, slot6 in pairs(uv0:getHeroList()) do
		slot6.is_ui_select = nil
	end

	if slot0.tab_list[slot0.select_team_index] then
		slot3, slot4 = slot0:getDicTeamData(slot2)

		for slot8, slot9 in pairs(slot3) do
			if slot0.five_hero_vo[slot8] == nil then
				slot0.five_hero_vo[slot8] = {}

				for slot14, slot15 in pairs(slot9.pos_info or {}) do
					slot16 = nil

					if slot0.fun_form_type == PartnerConst.Fun_Form.Planes and slot15.flag and slot15.flag == 1 then
						for slot20, slot21 in ipairs(slot0.show_list) do
							if slot15.id == slot21.partner_id and slot21.flag == 1 then
								slot16 = slot21

								break
							end
						end
					else
						slot16 = uv0:getHeroById(slot15.id)
					end

					if slot16 and next(slot16) ~= nil then
						slot16.is_ui_select = true
						slot0.five_hero_vo[slot8][slot15.pos] = slot16
					else
						slot0.five_hero_vo[slot8][slot15.pos] = nil
					end
				end
			else
				for slot13, slot14 in pairs(slot0.five_hero_vo[slot8]) do
					slot15 = nil

					if slot0.fun_form_type == PartnerConst.Fun_Form.Planes and slot14.flag and slot14.flag == 1 then
						for slot19, slot20 in ipairs(slot0.show_list) do
							if slot14.id == slot20.partner_id and slot20.flag == 1 then
								slot15 = slot20

								break
							end
						end
					else
						slot15 = uv0:getHeroById(slot14.id)
					end

					if slot15 and next(slot15) ~= nil then
						slot15.is_ui_select = true
					else
						slot0.five_hero_vo[slot8][slot13] = nil
					end
				end
			end
		end

		if slot4 then
			for slot8, slot9 in pairs(slot4) do
				for slot14, slot15 in pairs(slot9.pos_info or {}) do
					if uv0:getHeroById(slot15.id) then
						slot16.is_ui_select = true
					end
				end
			end
		end
	end
end

function FormGoFightPanel.initDramaFormInfo(slot0)
	slot0.is_form_back = true
	slot2 = {
		formation_type = uv0.use_formation_type,
		hallows_id = uv0.use_hallows_id,
		pos_info = uv0:getMyPosList()
	}
	slot0.team_data_list[slot0.select_team_index] = slot2

	slot0:initFormInfo(slot2)
end

function FormGoFightPanel.initMineFormInfo(slot0)
	slot0.dic_mine_hero_list = deepCopy(AdventureController:getInstance():getUiModel().dic_mine_hero_list or {})
	slot2 = slot0.setting.defense or {}

	for slot6, slot7 in ipairs(slot2) do
		slot0.dic_mine_hero_list[slot7.id] = nil
	end

	slot0.is_form_back = true
	slot3 = {
		formation_type = slot0.setting.formation_type or 1,
		hallows_id = slot0.setting.hallows_id or 0,
		pos_info = slot2
	}
	slot0.team_data_list[slot0.select_team_index] = slot3

	slot0:initFormInfo(slot3)
end

function FormGoFightPanel.initFormInfo(slot0, slot1)
	if not slot1 then
		return
	end

	if not Config.FormationData.data_form_data[slot1.formation_type] then
		return
	end

	slot0.is_form_back = true
	slot0.formation_type = slot1.formation_type
	slot0.hallows_id = slot1.hallows_id or 1

	slot0:initFormationData(slot2)
	slot0:updateFormationIcon()
	slot0:updateFiveHeroItem()
	slot0:updateHallowsIcon()

	if slot0.form_list_panel then
		slot0.form_list_panel:setVisible(false)
	end

	if slot0.form_panel then
		slot0.form_panel:setVisible(true)
	end
end

function FormGoFightPanel.initCrossarenaFormInfo(slot0)
	if not slot0.team_data_list then
		return
	end

	if slot0.select_team_index == 1 then
		slot0.form_panel:setVisible(false)
		slot0.form_list_panel:setVisible(true)

		if not slot0.crossarena_form_list_panel then
			slot0.crossarena_form_list_panel = CorssarenaFormListPanel.New(slot0.form_list_panel, slot0, slot0.form_show_type, slot0.fun_form_type)
		end

		if not slot0._init_crossarena then
			slot0._init_crossarena = true
		else
			for slot4, slot5 in ipairs(slot0.team_data_list) do
				if slot4 > 1 then
					slot5.pos_info = {}

					if slot0.five_hero_vo[slot4] then
						for slot10, slot11 in pairs(slot6) do
							uv0(slot5.pos_info, {
								id = slot11.id,
								pos = slot10
							})
						end
					end

					if slot5.old_order == nil then
						slot5.old_order = slot5.order
					end
				end
			end
		end

		slot4 = slot0.team_data_list

		slot0.crossarena_form_list_panel:setData(slot4)

		slot0.five_hero_vo = {}

		for slot4, slot5 in pairs(slot0.team_data_list) do
			for slot9, slot10 in pairs(slot5.pos_info or {}) do
				if uv1:getHeroById(slot10.id) then
					slot11.is_ui_select = true
				end
			end
		end

		if slot0.list_view then
			slot0.list_view:resetCurrentItems()
		end
	else
		if slot0.crossarena_form_list_panel then
			slot0.team_data_list = slot0.crossarena_form_list_panel:getData()
		end

		if slot0.team_data_list[slot0.select_team_index] then
			slot0.form_panel:setVisible(true)
			slot0.form_list_panel:setVisible(false)
			slot0:initFormInfo(slot0.team_data_list[slot0.select_team_index])

			if slot0.elfin_team_data_list[(slot0.team_data_list[slot0.select_team_index].old_order or slot0.select_team_index - 1) + 1] then
				slot0:updateElfinList(slot0.elfin_team_data_list[slot2 + 1])
			end
		end
	end
end

function FormGoFightPanel.teamInitFormInfo(slot0, slot1, slot2)
	if not slot0.team_data_list then
		return
	end

	if not slot0.cur_tab_data then
		return
	end

	if slot1 == 1 then
		slot0.form_panel:setVisible(false)
		slot0.form_list_panel:setVisible(true)

		if not slot0.crossarena_form_list_panel then
			slot0.crossarena_form_list_panel = CorssarenaFormListPanel.New(slot0.form_list_panel, slot0, slot0.form_show_type, slot0.cur_tab_data.fun_form_type)
		else
			slot0.crossarena_form_list_panel:setFunFormType(slot3)
		end

		for slot8, slot9 in ipairs(slot0.dic_more_team_data[slot0.cur_tab_data.fun_form_type]) do
			if slot9.old_order == nil then
				slot9.old_order = slot9.order
			end
		end

		if not slot4 then
			return
		end

		slot8 = slot4

		slot0.crossarena_form_list_panel:setData(slot8)

		for slot8, slot9 in pairs(slot4) do
			for slot14, slot15 in pairs(slot9.pos_info or {}) do
				if uv0:getHeroById(slot15.id) then
					slot16.is_ui_select = true
				end
			end
		end

		if slot0.list_view then
			slot0.list_view:resetCurrentItems()
		end
	elseif slot0.crossarena_form_list_panel then
		if slot2 then
			for slot8, slot9 in ipairs(slot0.crossarena_form_list_panel:getData()) do
				if slot0.dic_more_team_data[slot0.cur_tab_data.fun_form_type][slot9.order] and slot10.order == slot9.order then
					for slot14, slot15 in pairs(slot9) do
						slot10[slot14] = slot15
					end
				end
			end
		end

		slot0.form_panel:setVisible(true)
		slot0.form_list_panel:setVisible(false)

		slot0.team_data_list[slot0.select_team_index] = slot0.dic_more_team_data[slot0.cur_tab_data.fun_form_type][slot1 - 1]
		slot0.five_hero_vo[slot0.select_team_index] = nil

		if slot0.team_data_list[slot0.select_team_index] then
			slot0:initFormInfo(slot0.team_data_list[slot0.select_team_index])
		end

		if slot0.elfin_team_data_list[slot0.select_team_index] and slot0.elfin_team_data_list[slot0.select_team_index][(slot0.team_data_list[slot0.select_team_index].old_order or slot1 - 1) + 1] then
			slot0:updateElfinList(slot0.elfin_team_data_list[slot0.select_team_index][slot5 + 1])
		end
	end
end

function FormGoFightPanel.initFormationData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = {
		[slot8[2]] = slot9
	}
	slot0.pos_name_list = {}
	slot0.pos_rect_list = {}
	slot3 = slot0.cell_width - 10

	for slot7, slot8 in ipairs(slot1.pos) do
		slot9 = slot8[1]

		if slot0.hero_item_list[slot9] then
			slot0.hero_item_list[slot9]:setPosition(slot0.nine_position[slot10])
			slot0.hero_pos[slot9]:setPosition(slot0.nine_position[slot10])
			slot0.hero_pos[slot9]:setPositionY(slot0.nine_position[slot10].y - 70)

			if slot10 == 1 or slot10 == 4 or slot10 == 7 then
				slot0.hero_pos[slot9]:setLocalZOrder(10)
			elseif slot10 == 2 or slot10 == 5 or slot10 == 8 then
				slot0.hero_pos[slot9]:setLocalZOrder(8)
			else
				slot0.hero_pos[slot9]:setLocalZOrder(5)
			end
		end

		if slot10 <= 3 then
			slot0.pos_name_list[slot9] = 1
		elseif slot10 > 3 and slot10 <= 6 then
			slot0.pos_name_list[slot9] = 2
		else
			slot0.pos_name_list[slot9] = 3
		end

		slot0.pos_rect_list[slot9] = cc.rect(slot0.nine_position[slot10].x - slot3 * 0.5, slot0.nine_position[slot10].y - slot3 * 0.5, slot3, slot3)
	end

	for slot8 = 1, 9 do
		if slot2[slot8] == nil and 1 + 1 > 4 then
			break
		end
	end
end

function FormGoFightPanel.updateFormationIcon(slot0)
	if not slot0.formation_type then
		return
	end

	loadSpriteTexture(slot0.form_icon, PathTool.getResFrame("form", "form_icon_" .. slot0.formation_type), LOADTEXT_TYPE_PLIST)
end

function FormGoFightPanel.updateHallowsIcon(slot0)
	if not slot0.hallows_id then
		return
	end

	if not slot0.hallows_item then
		return
	end

	if slot0.hallows_id == 0 then
		slot0.hallows_item:setBaseData()
		slot0.hallows_item:setMagicIcon(false)
		slot0.hallows_item:showAddIcon(true)
		slot0.equip_btn_label:setString(TI18N("点击装配"))
	else
		if not Config.HallowsData.data_base[slot0.hallows_id] then
			return
		end

		slot0.hallows_item:showAddIcon(false)

		if HallowsController:getInstance():getModel():getHallowsById(slot0.hallows_id) and slot2.look_id ~= 0 then
			if Config.HallowsData.data_magic[slot2.look_id] then
				slot0.hallows_item:setBaseData(slot3.item_id)
				slot0.hallows_item:setMagicIcon(true)
			else
				slot0.hallows_item:setBaseData(slot1.item_id)
				slot0.hallows_item:setMagicIcon(false)
			end
		else
			slot0.hallows_item:setBaseData(slot1.item_id)
			slot0.hallows_item:setMagicIcon(false)
		end

		slot0.equip_btn_label:setString(TI18N("点击更换"))
	end
end

function FormGoFightPanel.updateFiveHeroItem(slot0)
	slot0:setHeroIsSelect()

	for slot4, slot5 in ipairs(slot0.hero_item_list) do
		if slot0.five_hero_vo[slot0.select_team_index] then
			if slot0.five_hero_vo[slot0.select_team_index][slot4] == nil then
				if slot0.five_spine_list[slot4] then
					slot0.five_spine_list[slot4]:removeFromParent()

					slot0.five_spine_list[slot4] = nil
				end

				slot5:setData(nil)
			else
				slot5:setData(slot0.five_hero_vo[slot0.select_team_index][slot4])
				slot5:setIconClarity(0)
				slot0:createHeroSpine(slot4, slot0.five_hero_vo[slot0.select_team_index][slot4])
			end
		end
	end

	if slot0.list_view then
		slot0.list_view:resetCurrentItems()
	end

	slot0:updateFightPower()
end

function FormGoFightPanel.updateFightPower(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	slot5 = slot0.select_team_index

	for slot5, slot6 in pairs(slot0.five_hero_vo[slot5]) do
		slot1 = 0 + (slot6.power or 0)
	end

	slot2 = false

	if slot0.cur_tab_data and slot0.cur_tab_data.fun_form_type then
		slot3 = 0

		if uv0:isGuildPvpFrom(slot0.cur_tab_data.fun_form_type) then
			slot4 = {}
			slot8 = slot0.select_team_index

			for slot8, slot9 in pairs(slot0.five_hero_vo[slot8]) do
				if slot9.type and slot9.type ~= 0 then
					table.insert(slot4, slot9.type)
				end
			end

			slot3 = GuildskillController:getInstance():getModel():getPvpPowerByCareerlist(slot4)
		end

		if slot2 and slot1 > 0 and slot3 > 0 then
			if slot0.pvp_arrow == nil then
				slot0.pvp_arrow = createImage(slot0.power_click, PathTool.getResFrame("common", "common_1086"), 0, 20, cc.p(0.5, 0.5), true)
			else
				slot0.pvp_arrow:setVisible(true)
			end

			if slot0.show_pvp_tips == nil then
				slot0.show_pvp_tips = createLabel(20, cc.c3b(36, 144, 3), nil, 84, -12, TI18N("公会pvp属性战力提升"), slot0.power_click, nil, cc.p(0.5, 0.5))
			else
				slot0.show_pvp_tips:setVisible(true)
			end

			slot1 = slot1 + slot3
		else
			slot2 = false

			if slot0.pvp_arrow then
				slot0.pvp_arrow:setVisible(false)
			end

			if slot0.show_pvp_tips then
				slot0.show_pvp_tips:setVisible(false)
			end
		end
	end

	slot0.cur_power = slot1

	slot0.fight_label:setNum(slot1)

	if slot2 and slot0.pvp_arrow then
		slot0.pvp_arrow:setPositionX(slot0.fight_label:getPositionX() + slot0.fight_label:getContentSize().width * 0.5 + 16)
	end

	slot0:calculateCampHaloType()

	if slot0.fun_form_type == PartnerConst.Fun_Form.ElementWater or slot0.fun_form_type == PartnerConst.Fun_Form.ElementFire or slot0.fun_form_type == PartnerConst.Fun_Form.ElementWind or slot0.fun_form_type == PartnerConst.Fun_Form.ElementLight or slot0.fun_form_type == PartnerConst.Fun_Form.ElementDark then
		slot0:updatePosTipsStatus()
	end
end

function FormGoFightPanel.calculateCampHaloType(slot0)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	slot1 = {}
	slot5 = slot0.select_team_index

	for slot5, slot6 in pairs(slot0.five_hero_vo[slot5]) do
		if slot6.camp_type ~= nil then
			if slot1[slot6.camp_type] == nil then
				slot1[slot6.camp_type] = 1
			else
				slot1[slot6.camp_type] = slot1[slot6.camp_type] + 1
			end
		end
	end

	slot0.halo_form_id_list = BattleController:getInstance():getModel():getFormIdListByCamp(slot1)

	if BattleController:getInstance():getModel():getCampIconConfigByIds(slot0.halo_form_id_list) then
		slot3 = PathTool.getCampGroupIcon(slot2.icon)
		slot0.halo_icon_load = loadImageTextureFromCDN(slot0.halo_btn, slot3, ResourcesType.single, slot0.halo_icon_load)

		addCountForCampIcon(slot0.halo_btn, slot2.nums)
		slot0.halo_label:setString("")
		slot0:updateEffect(true, slot3)
	else
		slot3 = PathTool.getCampGroupIcon(1000)
		slot0.halo_icon_load = loadImageTextureFromCDN(slot0.halo_btn, slot3, ResourcesType.single, slot0.halo_icon_load)

		addCountForCampIcon(slot0.halo_btn)
		slot0.halo_label:setString(TI18N("阵型"))
		slot0:updateEffect(false, slot3)
	end
end

function FormGoFightPanel.updateEffect(slot0, slot1, slot2)
	if slot1 then
		if slot0.select == nil then
			slot3, slot4 = slot0.halo_btn:getPosition()
			slot0.select = createImage(slot0.form_panel, PathTool.getResFrame("common", "common_1101"), slot3, slot4, cc.p(0.5, 0.5), true)

			slot0.select:setScale(0.8)
		else
			slot0.select:setVisible(true)
		end

		slot0.select:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeIn:create(0.6), cc.FadeOut:create(0.6))))
	elseif slot0.select then
		doStopAllActions(slot0.select)
		slot0.select:setVisible(false)
	end
end

function FormGoFightPanel.updatePosTipsStatus(slot0)
	if slot0.setting.limit then
		if slot0:checkIsCanFight() then
			slot0.pos_tips:setTextColor(cc.c3b(36, 144, 3))
		else
			slot0.pos_tips:setTextColor(cc.c3b(201, 38, 6))
		end
	end
end

function FormGoFightPanel.updateHeroList(slot0, slot1, slot2)
	if not slot2 and (slot1 or 0) == slot0.select_camp then
		return
	end

	if not slot0.list_view then
		slot6 = slot0.lay_scrollview:getContentSize()
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(slot6.width * 0.5, slot6.height * 0.5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(640, 270), {
			start_y = 4,
			item_height = 128,
			start_x = 0,
			space_y = 0,
			col = 5,
			space_x = 0,
			need_dynamic = true,
			item_width = 128
		}, cc.p(0.5, 0.5))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.select_camp = slot3
	slot4 = uv0:getAllHeroArray()
	slot5 = Array.New()
	slot6 = 0
	slot10 = slot4

	for slot10 = 1, slot4.GetSize(slot10) do
		slot11 = slot4:Get(slot10 - 1)

		if slot3 == 0 or slot3 == slot11.camp_type then
			slot5:PushBack(slot11)
		end

		if slot0.fun_form_type == PartnerConst.Fun_Form.EndLessLightDark and slot11 and (slot11.camp_type == HeroConst.CampType.eLight or slot11.camp_type == HeroConst.CampType.eDark) then
			if slot11 and slot6 < slot11.power then
				slot6 = slot11.power
			end
		elseif (slot3 == 0 or slot3 == slot11.camp_type) and slot11 and slot6 < slot11.power then
			slot6 = slot11.power
		end
	end

	slot5:UpperSortByParams("star", "power", "lev", "sort_order")

	slot7 = slot5.items

	if slot0.fun_form_type == PartnerConst.Fun_Form.Expedit_Fight then
		for slot13, slot14 in pairs(uv1:getExpeditEmployData()) do
			slot14.partner_id = slot14.id
			slot14.camp_type = Config.PartnerData.data_partner_base[slot14.bid].camp_type

			if slot14.is_used == 0 then
				uv2(slot7, 1, slot14)
			else
				uv2(slot7, slot14)
			end
		end
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.LimitExercise then
		-- Nothing
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.EndLess or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessWater or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessFire or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessWind or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessLightDark then
		for slot13, slot14 in ipairs(slot0.setting.has_hire_list or {}) do
			if slot6 and slot14.power <= slot6 * 1.2 or slot0.fun_form_type == PartnerConst.Fun_Form.EndLess then
				slot15 = Config.PartnerData.data_partner_base[slot14.bid]

				if slot3 == 0 or slot3 == slot15.camp_type then
					slot14.partner_id = slot14.id
					slot14.camp_type = slot15.camp_type
					slot14.is_endless = true

					uv2(slot7, 1, slot14)
				end
			end
		end
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.Planes then
		slot7 = {}

		for slot13, slot14 in pairs(PlanesafkController:getInstance():getModel():getAllPlanesHeroData() or {}) do
			slot15 = Config.PartnerData.data_partner_base[slot14.bid]

			if slot3 == 0 or slot3 == slot15.camp_type then
				if slot14.flag == 1 then
					slot14.camp_type = slot15.camp_type

					uv2(slot7, slot14)
				elseif uv0:getHeroById(slot14.partner_id) then
					uv2(slot7, slot16)
				end
			end
		end

		uv3(slot7, SortTools.tableUpperSorter({
			"star",
			"power",
			"lev",
			"flag"
		}))
	end

	slot0.show_list = slot7

	slot0.list_view:reloadData()

	if #slot0.show_list == 0 then
		slot0.no_vedio_image:setVisible(true)
		slot0.no_vedio_label:setVisible(true)

		return
	else
		slot0.no_vedio_image:setVisible(false)
		slot0.no_vedio_label:setVisible(false)
	end
end

function FormGoFightPanel.createNewCell(slot0, slot1, slot2)
	slot3 = HeroExhibitionItem.new(0.9, true)

	if slot0.fun_form_type == PartnerConst.Fun_Form.Expedit_Fight then
		slot3.from_type = HeroConst.ExhibitionItemType.eExpeditFight
		slot3.boold_type = true
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.EndLess or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessWater or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessFire or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessWind or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessLightDark then
		slot3.from_type = HeroConst.ExhibitionItemType.eEndLessHero
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.LimitExercise then
		slot3.from_type = HeroConst.ExhibitionItemType.eLimitExercise
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.Planes then
		slot3.from_type = HeroConst.ExhibitionItemType.ePlanes
	else
		slot3.from_type = HeroConst.ExhibitionItemType.eFormFight
	end

	slot3:setLongTimeTouchEffect(true)
	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function FormGoFightPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function FormGoFightPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	slot1:setData(slot0.show_list[slot2])

	if slot0.fun_form_type == PartnerConst.Fun_Form.Adventure_Mine_Def then
		if slot0.dic_mine_hero_list and slot0.dic_mine_hero_list[slot3.id] then
			slot1:showStrTips(true, TI18N("防御中"), {
				c3b = cc.c3b(255, 255, 255)
			})
		else
			slot1:showStrTips(false)
		end
	end
end

function FormGoFightPanel.onCellTouched(slot0, slot1)
	if slot0.show_list[slot1.index] then
		slot0:selectHero(slot1, slot3)
	end
end

function FormGoFightPanel.selectHero(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	if not slot1 then
		return
	end

	if slot0.is_play_item_action then
		return
	end

	slot3 = slot0.tab_list[slot0.select_team_index]

	if slot0.fun_form_type == PartnerConst.Fun_Form.Drama and slot3 and (slot3.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef or slot3.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef) then
		if not slot0.team_select_team_index then
			return
		end

		if slot0.team_select_team_index == 1 then
			if slot0.crossarena_form_list_panel then
				slot0.crossarena_form_list_panel:onSelectHero(slot1, slot2)
			end

			return
		end
	end

	if (slot0.fun_form_type == PartnerConst.Fun_Form.CrossArena or slot0.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef or slot0.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef) and slot3 and slot3.order == 0 and slot0.crossarena_form_list_panel then
		slot0.crossarena_form_list_panel:onSelectHero(slot1, slot2)

		return
	end

	if slot0.fun_form_type == PartnerConst.Fun_Form.Adventure_Mine_Def and slot0.dic_mine_hero_list and slot0.dic_mine_hero_list[slot2.id] then
		message(TI18N("已在别的秘矿防守阵容中"))

		return
	end

	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	if slot0.fun_form_type == PartnerConst.Fun_Form.Expedit_Fight then
		if (slot2.is_used or 0) == 1 then
			message(TI18N("雇佣的英雄只能使用一次哦"))

			return
		end

		if uv0:getHeroBloodById(slot2.partner_id, slot2.rid, slot2.srv_id) <= 0 then
			return
		end
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.Planes and PlanesafkController:getInstance():getModel():getMyPlanesHeroHpPer(slot2.partner_id, slot2.flag) <= 0 and not slot2.is_ui_select then
		message(TI18N("该英雄已阵亡"))

		return
	end

	slot4, slot5 = slot0:getDicTeamData(slot3)

	if slot0:findHeroIndex(slot2, slot4, slot5) ~= -1 then
		if slot0.hero_item_list[slot6] == nil then
			return
		end

		slot2.is_ui_select = false

		slot1:setSelected(slot2.is_ui_select)

		slot9, slot10 = slot0.hero_item_list[slot6]:getPosition()

		slot0:showMoveEffect(cc.p(slot9, slot10), slot0.fight_hero_node:convertToNodeSpace(slot1:convertToWorldSpace(cc.p(HeroExhibitionItem.Width * 0.5, HeroExhibitionItem.Height * 0.5))), slot2)
		slot0.hero_item_list[slot6]:setData(nil)
		slot0.hero_pos[slot6]:removeAllChildren()

		if slot0.five_spine_list[slot6] then
			slot0.five_spine_list[slot6] = nil
		end

		slot0.five_hero_vo[slot0.select_team_index][slot6] = nil

		slot0:updateMoreTeamHeroInfo()
		slot0:updateFightPower()
	else
		slot11 = slot0.select_team_index

		for slot11, slot12 in pairs(slot0.five_hero_vo[slot11]) do
			slot7 = 0 + 1
		end

		if slot7 >= 5 then
			message(TI18N("上阵人数已满"))

			return
		end

		if slot0.fun_form_type == PartnerConst.Fun_Form.Drama then
			if slot3 and slot2.checkResonateHeroByFormType and slot2:checkResonateHeroByFormType(slot3.fun_form_type) then
				return
			end
		elseif slot2.checkResonateHeroByFormType and slot2:checkResonateHeroByFormType(slot0.fun_form_type) then
			return
		end

		if slot0:checkSameHeroTips(slot2, slot4, slot5, slot3.fun_form_type) then
			return
		end

		if slot0:getTheBestPos(slot2) == nil then
			message(TI18N("没有上阵位置"))

			return
		end

		slot11, slot12 = slot0.hero_item_list[slot8]:getPosition()

		slot0:showMoveEffect(slot0.fight_hero_node:convertToNodeSpace(slot1:convertToWorldSpace(cc.p(HeroExhibitionItem.Width * 0.5, HeroExhibitionItem.Height * 0.5))), cc.p(slot11, slot12), slot2, function ()
			if uv0.hero_item_list and uv0.hero_item_list[uv1] then
				uv0.five_hero_vo[uv0.select_team_index][uv1] = uv2

				uv0.hero_item_list[uv1]:setData(uv0.five_hero_vo[uv0.select_team_index][uv1])
				uv0.hero_item_list[uv1]:setIconClarity(0)
				uv0:createHeroSpine(uv1, uv2)
				uv0:updateMoreTeamHeroInfo()
				uv0:updateFightPower()
			end
		end)

		slot2.is_ui_select = true

		slot1:setSelected(slot2.is_ui_select)
	end
end

function FormGoFightPanel.checkSameHeroTips(slot0, slot1, slot2, slot3, slot4)
	if slot3 then
		for slot8, slot9 in pairs(slot3) do
			for slot14, slot15 in pairs(slot9.pos_info or {}) do
				if uv0:getHeroById(slot15.id).bid == slot1.bid then
					if slot9.order == slot0.team_select_team_index - 1 then
						message(TI18N("不能同时上阵2个相同英雄"))

						return true
					elseif not slot0:checkOtherCondition(slot16, slot4, slot3) then
						message(TI18N("不能同时上阵3个同类英雄"))

						return true
					end
				end
			end
		end
	else
		for slot8, slot9 in pairs(slot2) do
			if slot0.five_hero_vo[slot8] then
				for slot13, slot14 in pairs(slot0.five_hero_vo[slot8]) do
					if slot14.bid == slot1.bid then
						if slot0.fun_form_type == PartnerConst.Fun_Form.CrossArena or slot0.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef or slot0.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef then
							if slot8 == slot0.select_team_index then
								message(TI18N("不能同时上阵2个相同英雄"))

								return true
							elseif not slot0:checkOtherCondition(slot14) then
								message(TI18N("不能同时上阵3个同类英雄"))

								return true
							end
						else
							if slot8 == slot0.select_team_index then
								message(TI18N("不能同时上阵2个相同英雄"))
							else
								message(TI18N("两支队伍中不可同时上阵2个相同的英雄"))
							end

							return true
						end
					end
				end
			end
		end
	end
end

function FormGoFightPanel.findHeroIndex(slot0, slot1, slot2, slot3)
	slot4 = 0
	slot5 = -1

	if slot3 then
		slot6 = nil
		slot7 = slot0.team_select_team_index - 1
		slot11 = slot0.select_team_index

		for slot11, slot12 in pairs(slot0.five_hero_vo[slot11]) do
			if slot12.partner_id == slot1.partner_id and slot12.rid == slot1.rid and slot12.srv_id == slot1.srv_id then
				slot5 = slot11

				break
			end
		end

		if slot5 == -1 then
			for slot11, slot12 in pairs(slot3) do
				slot13 = slot12.pos_info or {}

				if slot12.order ~= slot7 then
					for slot17, slot18 in pairs(slot13) do
						if uv0:getHeroById(slot18.id) and slot19.partner_id == slot1.partner_id and slot19.rid == slot1.rid and slot19.srv_id == slot1.srv_id then
							slot4 = slot12.order
							slot6 = slot19
						end
					end
				end
			end
		end

		if slot4 ~= 0 and slot7 ~= 0 and slot7 ~= slot4 then
			slot0:onClickTeamTabBtn(slot4 + 1, true)

			if slot6 then
				slot11 = slot0.select_team_index

				for slot11, slot12 in pairs(slot0.five_hero_vo[slot11]) do
					if slot12.id == slot6.id then
						slot5 = slot11
					end
				end
			end
		end
	else
		for slot9, slot10 in pairs(slot2) do
			if slot0.five_hero_vo[slot9] then
				for slot14, slot15 in pairs(slot0.five_hero_vo[slot9]) do
					if slot15.partner_id == slot1.partner_id and slot15.rid == slot1.rid and slot15.srv_id == slot1.srv_id then
						slot4 = slot9
						slot5 = slot14

						break
					end
				end
			end
		end

		if slot4 ~= 0 and slot0.select_team_index ~= slot4 then
			slot0:changeTabType(slot4)
		end
	end

	return slot5
end

function FormGoFightPanel.getCellHeroItemByPartnerId(slot0, slot1)
	if slot0.list_view then
		for slot6, slot7 in ipairs(slot0.list_view:getActiveCellList() or {}) do
			if slot7:getData().partner_id == slot1 then
				return slot7
			end
		end
	end
end

function FormGoFightPanel.getTheBestPos(slot0, slot1)
	if not slot0.five_hero_vo[slot0.select_team_index] then
		return
	end

	if slot1.pos_type == 1 then
		-- Nothing
	elseif slot1.pos_type == 3 then
		for slot6 = #slot0.pos_name_list, 1, -1 do
			if slot0.five_hero_vo[slot0.select_team_index][slot6] == nil then
				return slot6
			end
		end
	else
		for slot5, slot6 in ipairs(slot0.pos_name_list) do
			if slot6 == slot1.pos_type and slot0.five_hero_vo[slot0.select_team_index][slot5] == nil then
				return slot5
			end
		end
	end

	for slot5, slot6 in ipairs(slot0.pos_name_list) do
		if slot0.five_hero_vo[slot0.select_team_index][slot5] == nil then
			return slot5
		end
	end

	return nil
end

function FormGoFightPanel.showMoveEffect(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.is_play_item_action = true

	if slot0.move_hero_item == nil then
		slot0.move_hero_item = HeroExhibitionItem.new(0.9, false)

		slot0.fight_hero_node:addChild(slot0.move_hero_item, 1)
	end

	slot0.move_hero_item:setData(slot3)
	slot0.move_hero_item:setZOrder(0)
	slot0.move_hero_item:setIconClarity(0)
	slot0.move_hero_item:setPosition(slot1)
	slot0.move_hero_item:setVisible(false)
	slot0.move_hero_item:runAction(cc.Sequence:create(cc.MoveTo:create(0.2, slot2), cc.CallFunc:create(function ()
		if uv0.move_hero_item then
			uv0.move_hero_item:setPosition(-10000, 0)
		end

		uv0.is_play_item_action = false

		if uv1 then
			uv1()
		end
	end)))

	if slot0.five_spine_list[slot5] and slot0.five_spine_list[slot5] ~= nil then
		slot0.five_spine_list[slot5]:runAction(cc.Sequence:create(slot6, slot7))
	end
end

function FormGoFightPanel.addDownTime(slot0)
	if not slot0.setting then
		return
	end

	if not slot0.setting.end_time then
		return
	end

	slot1 = slot0.setting.end_time - GameNet:getInstance():getTime()

	if slot0.down_time == nil then
		slot2, slot3 = slot0.pos_tips:getPosition()
		slot0.down_time = createLabel(20, cc.c4b(255, 0, 0, 255), nil, slot2, slot3, "", slot0.fight_hero_node, nil, cc.p(0.5, 0.5))

		slot0.pos_tips:setVisible(false)
	end

	commonCountDownTime(slot0.down_time, slot1, {
		callback = function (slot0)
			uv0:setTimeFormatString(slot0)
		end
	})
end

function FormGoFightPanel.setTimeFormatString(slot0, slot1)
	if slot1 <= 0 then
		if slot0.fun_form_type == PartnerConst.Fun_Form.EliteMatch then
			slot0.close_by_other = true
		end

		slot0:onClickCloseBtn()
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.Adventure_Mine_Def then
		slot0.down_time:setString(uv0(TI18N("%s秒后自动放弃占领"), slot1))
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.EliteMatch then
		slot0.down_time:setString(uv0(TI18N("%s秒后自动进入战斗"), slot1))
	end
end

function FormGoFightPanel.close_callback(slot0)
	doStopAllActions(slot0.background)
	doStopAllActions(slot0.form_panel)

	if slot0.down_time then
		doStopAllActions(slot0.down_time)

		slot0.down_time = nil
	end

	if slot0.halo_icon_load then
		slot0.halo_icon_load:DeleteMe()

		slot0.halo_icon_load = nil
	end

	if slot0.fight_label then
		slot0.fight_label:removeAllChildren()
	end

	slot0.five_spine_list = {}

	for slot4, slot5 in pairs(slot0.hero_pos) do
		slot5:removeAllChildren()
	end

	slot0.hero_pos = {}
	slot0.fight_label = nil

	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.tab_btn_list_view then
		slot0.tab_btn_list_view:DeleteMe()

		slot0.tab_btn_list_view = nil
	end

	if slot0.crossarena_form_list_panel then
		slot0.crossarena_form_list_panel:DeleteMe()

		slot0.crossarena_form_list_panel = nil
	end

	if slot0.hero_item_list then
		for slot4, slot5 in ipairs(slot0.hero_item_list) do
			slot5:DeleteMe()
		end

		slot0.hero_item_list = {}
	end

	if slot0.fun_form_type == PartnerConst.Fun_Form.Planes then
		for slot5, slot6 in pairs(PlanesafkController:getInstance():getModel():getAllPlanesHeroData()) do
			slot6.is_ui_select = nil
		end
	elseif slot0.fun_form_type == PartnerConst.Fun_Form.EndLess or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessWater or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessFire or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessWind or slot0.fun_form_type == PartnerConst.Fun_Form.EndLessLightDark then
		for slot5, slot6 in ipairs(slot0.setting.has_hire_list or {}) do
			slot6.is_ui_select = nil
		end
	end

	for slot5, slot6 in pairs(uv0:getHeroList()) do
		slot6.is_ui_select = nil
	end

	if slot0.hallows_item then
		slot0.hallows_item:DeleteMe()

		slot0.hallows_item = nil
	end

	for slot5, slot6 in pairs(slot0.elfin_item_list) do
		slot6:DeleteMe()

		slot6 = nil
	end

	if slot0.legend_spine then
		slot0.legend_spine:removeFromParent()
	end

	slot0.legend_spine = nil

	if slot0.fun_form_type and slot0.fun_form_type == PartnerConst.Fun_Form.Adventure_Mine_Def then
		uv1:openAdventureMineFormGoFightPanel(false)
	elseif slot0.fun_form_type and slot0.fun_form_type == PartnerConst.Fun_Form.Adventure_Mine then
		SysEnv:getInstance():set(SysEnv.keys.adventure_mine_skip_fight, slot0.is_skip_fight, true)
		uv1:openFormGoFightPanel(false)
	else
		uv1:openFormGoFightPanel(false)
	end
end
