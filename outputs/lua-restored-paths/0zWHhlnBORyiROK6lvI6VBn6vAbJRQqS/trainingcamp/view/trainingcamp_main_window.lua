slot1 = TrainingcampController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
slot4 = table.sort
TrainingcampMainWindow = TrainingcampMainWindow or BaseClass(BaseView)

function TrainingcampMainWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.layout_name = "trainingcamp/trainingcamp_main_window"
	slot0.show_list = {}
	slot0.hero_item_list = {}
	slot0.five_hero_vo = {}
	slot0.pos_name_list = {}
	slot0.pos_rect_list = {}
	slot0.ban_pos_list = {}
	slot0.cell_width = 119
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("trainingcamp", "trainingcamp"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_90"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_91"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_92"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_95", true),
			type = ResourcesType.single
		}
	}
end

function TrainingcampMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_95", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.title_panel = slot0.container:getChildByName("title_panel")
	slot0.title_name = slot0.title_panel:getChildByName("title_name")
	slot0.finish_img = slot0.title_panel:getChildByName("finish_img")

	slot0.finish_img:setVisible(false)
	UITool.SetTitleColor(slot0.title_name)

	slot0.up_panel = slot0.container:getChildByName("up_panel")
	slot0.left_panel = slot0.up_panel:getChildByName("left_panel")

	slot0.left_panel:getChildByName("left_name"):setString(TI18N("我方阵容"))

	slot1 = slot0.up_panel:getChildByName("right_panel")
	slot7 = "训练对手"

	slot1:getChildByName("right_name"):setString(TI18N(slot7))

	function slot2(slot0, slot1)
		slot2 = {
			panel = slot0,
			form_icon = slot0:getChildByName("form_bg"):getChildByName("form_icon")
		}
		slot7 = 1.5

		slot2.form_icon:setScale(slot7)

		slot2.pos_list = {}
		slot2.hero_item_list = {}

		for slot7 = 1, 9 do
			slot9, slot10 = slot0:getChildByName("item_bg_" .. slot7):getPosition()
			slot2.pos_list[slot7] = cc.p(slot9, slot10)
		end

		slot2.role_head = PlayerHead.new(PlayerHead.type.circle)

		if slot1 == true then
			slot2.role_head:setPosition(60, 403)
		else
			slot2.role_head:setPosition(5, -65)
		end

		slot0:addChild(slot2.role_head)

		return slot2
	end

	slot0.up_right_team_info = slot2(slot1, false)
	slot0.up_left_team_info = slot2(slot0.left_panel, true)

	for slot7 = 1, 5 do
		slot0.hero_item_list[slot7] = HeroExhibitionItem.new(0.7, false)

		slot0.hero_item_list[slot7]:setPosition(slot0.up_left_team_info.pos_list[({
			2,
			4,
			6,
			7,
			9
		})[slot7]])
		slot0.left_panel:addChild(slot0.hero_item_list[slot7])
	end

	slot0.down_panel = slot0.container:getChildByName("down_panel")
	slot0.lay_scrollview = slot0.down_panel:getChildByName("lay_scrollview")
	slot4 = slot0.lay_scrollview:getContentSize()
	slot0.list_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(slot4.width * 0.5, slot4.height * 0.5), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot4, {
		start_y = 0,
		row = 1,
		start_x = 5,
		space_x = 7,
		item_width = 107.10000000000001,
		item_height = 107.10000000000001,
		space_y = 0,
		col = 0,
		need_dynamic = true
	}, cc.p(0.5, 0.5))

	slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot0.txt_lab = slot0.down_panel:getChildByName("txt_lab")
	slot0.txt_lab_1 = slot0.down_panel:getChildByName("txt_lab_1")

	slot0.txt_lab_1:setString("当前无可选英雄")
	slot0.txt_lab_1:setVisible(false)

	slot0.halo_btn = slot0.down_panel:getChildByName("halo_btn")
	slot0.halo_label = slot0.halo_btn:getChildByName("label")

	UITool.SetTitleColor(slot0.halo_label)

	slot0.form_change_btn = slot0.down_panel:getChildByName("form_change_btn")

	slot0.form_change_btn:getChildByName("label"):setString(TI18N("阵法"))
	UITool.SetTitleColor(slot0.form_change_btn:getChildByName("label"))

	slot0.form_icon = slot0.form_change_btn:getChildByName("form_icon")
	slot0.tips_btn = slot0.down_panel:getChildByName("tips_btn")

	slot0.tips_btn:getChildByName("label"):setString(TI18N("提示"))

	slot0.go_btn = slot0.down_panel:getChildByName("go_btn")

	slot0.go_btn:getChildByName("label"):setString(TI18N("挑战"))

	slot0.close_btn = slot0.container:getChildByName("close_btn")

	slot0.close_btn:setPositionY(slot0.close_btn:getPositionY() + 10)
	UITool.SetTitleColor(slot0.go_btn:getChildByName("label"))
	slot0:adaptationScreen()
end

function TrainingcampMainWindow.adaptationScreen(slot0)
	slot0.title_panel:setPositionY(display.getTop(slot0.container) - (slot0.container:getContentSize().height - slot0.title_panel:getPositionY()))
end

function TrainingcampMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.halo_btn, handler(slot0, slot0.onClickHaloBtn), true, 2)
	registerButtonEventListener(slot0.form_change_btn, handler(slot0, slot0.onClickFormChangeBtn), true, 2)
	registerButtonEventListener(slot0.tips_btn, handler(slot0, slot0.onClickTipsBtn), true, 1)

	slot4 = handler(slot0, slot0.onFightDrama)
	slot5 = true

	registerButtonEventListener(slot0.go_btn, slot4, slot5, 1)

	slot0.long_touch_type = LONG_TOUCH_INIT_TYPE

	for slot4, slot5 in ipairs(slot0.hero_item_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if uv0.is_play_item_action then
				return
			end

			if uv0.five_hero_vo[uv1] == nil then
				return
			end

			if slot1 == ccui.TouchEventType.began then
				uv0.touch_began = slot0:getTouchBeganPosition()
				uv0.long_touch_type = LONG_TOUCH_BEGAN_TYPE
			elseif slot1 == ccui.TouchEventType.moved then
				if uv0.long_touch_type == LONG_TOUCH_END_TYPE then
					return
				elseif uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
					slot3 = slot0:getTouchMovePosition()

					if uv0.touch_began and slot3 and (math.abs(slot3.x - slot2.x) > 20 or math.abs(slot3.y - slot2.y) > 20) then
						uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
					end
				end

				uv0:onClickHeroItemMove(uv1, slot0)
			elseif slot1 == ccui.TouchEventType.canceled then
				if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
					uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
				elseif uv0.long_touch_type == LONG_TOUCH_END_TYPE then
					if uv0.move_hero_item then
						uv0.move_hero_item:setPosition(-10000, 0)
					end

					uv2:setData(uv0.five_hero_vo[uv1])

					return
				end

				uv0:onClickHeroItemCanceled(uv1, slot0)
			elseif slot1 == ccui.TouchEventType.ended then
				if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
					uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
				elseif uv0.long_touch_type == LONG_TOUCH_END_TYPE then
					if uv0.move_hero_item then
						uv0.move_hero_item:setPosition(-10000, 0)
					end

					uv2:setData(uv0.five_hero_vo[uv1])

					return
				end

				uv0:onClickHeroItemEnd(uv1, slot0)
			end
		end)
	end

	slot0:addGlobalEvent(TrainingcampEvent.Update_Trainingcamp_Tips_Event, function ()
		if uv0.data then
			uv1:openTrainingcampTipsWindow(true, uv0.data)
		end
	end)
	slot0:addGlobalEvent(TrainingcampEvent.Show_Close_Effect_Event, function ()
		uv0:showColseEffect(true)
	end)
	slot0:addGlobalEvent(TrainingcampEvent.Is_Show_Formation_Event, function (slot0)
		if uv0.data.id == 7 and slot0 == 0 then
			uv0:showGuideEffect(true, uv0.form_change_btn)
		else
			uv0:showGuideEffect(false)
		end
	end)
	slot0:addGlobalEvent(TrainingcampEvent.Update_Trainingcamp_Data_Event, function ()
		uv0:updateFinish()
	end)
end

function TrainingcampMainWindow.onClickCloseBtn(slot0)
	uv0:openTrainingcampMainWindow(false)
end

function TrainingcampMainWindow.onClickHaloBtn(slot0)
	BattleController:getInstance():openBattleCampView(true, slot0.halo_form_id_list)
end

function TrainingcampMainWindow.onClickFormChangeBtn(slot0)
	if not slot0.formation_type then
		return
	end

	if slot0.data and slot0.data.id == 7 then
		uv0:send27603(slot0.data.id)
	end

	slot0:showGuideEffect(false)
	HeroController:getInstance():openFormationSelectPanel(true, slot0.formation_type, function (slot0)
		if slot0 and not tolua.isnull(uv0.root_wnd) then
			uv0.formation_type = slot0

			if Config.FormationData.data_form_data[uv0.formation_type] then
				uv0:initFormationData(slot1)
			end

			uv0:updateFormationIcon()
		end
	end, 999)
end

function TrainingcampMainWindow.onClickTipsBtn(slot0)
	if slot0.data then
		uv0:openTrainingcampTipsWindow(true, slot0.data)
	end
end

function TrainingcampMainWindow.onFightDrama(slot0)
	if slot0.data == nil then
		return
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0.five_hero_vo) do
		uv0(slot1, {
			pos = slot5,
			id = slot6.id
		})
	end

	if #slot1 == 0 then
		message(TI18N("请选择关卡英雄"))

		return
	end

	uv1:send27601(slot0.data.id, slot0.formation_type, slot1)
end

function TrainingcampMainWindow.updateFormationIcon(slot0)
	if not slot0.formation_type then
		return
	end

	loadSpriteTexture(slot0.form_icon, PathTool.getResFrame("form", "form_icon_" .. slot0.formation_type), LOADTEXT_TYPE_PLIST)
	slot0:updateFormIcon(slot0.up_left_team_info, slot0.formation_type)
end

function TrainingcampMainWindow.onClickHeroItemMove(slot0, slot1, slot2)
	slot0.is_move_hero = true

	if slot0.move_hero_item == nil then
		slot0.move_hero_item = HeroExhibitionItem.new(0.9, false)

		slot0.left_panel:addChild(slot0.move_hero_item, 1)
	end

	slot0.move_hero_item:setData(slot0.five_hero_vo[slot1])
	slot0.hero_item_list[slot1]:setData(nil)
	slot0.move_hero_item:setPosition(slot0.left_panel:convertToNodeSpace(slot2:getTouchMovePosition()))
end

function TrainingcampMainWindow.onClickHeroItemCanceled(slot0, slot1, slot2)
	slot0.is_move_hero = false

	if slot0.move_hero_item then
		slot0.move_hero_item:setPosition(-10000, 0)
	end

	for slot8, slot9 in ipairs(slot0.pos_rect_list) do
		if cc.rectContainsPoint(slot9, slot0.left_panel:convertToNodeSpace(slot2:getTouchMovePosition())) then
			for slot13, slot14 in ipairs(slot0.ban_pos_list) do
				if slot8 == slot14 then
					slot0.hero_item_list[slot1]:setData(slot0.five_hero_vo[slot1])

					return
				end
			end

			if slot8 ~= slot1 then
				slot0.hero_item_list[slot8]:setData(slot0.five_hero_vo[slot1])

				slot0.five_hero_vo[slot8] = slot0.five_hero_vo[slot1]

				if slot0.five_hero_vo[slot8] ~= nil then
					slot0.hero_item_list[slot1]:setData(slot10)

					slot0.five_hero_vo[slot1] = slot10
				else
					slot0.hero_item_list[slot1]:setData(nil)

					slot0.five_hero_vo[slot1] = nil
				end

				return
			end
		end
	end

	slot0.hero_item_list[slot1]:setData(slot0.five_hero_vo[slot1])
end

function TrainingcampMainWindow.onClickHeroItemEnd(slot0, slot1, slot2)
	if slot0.move_hero_item then
		slot0.move_hero_item:setPosition(-10000, 0)
	end

	if slot0.list_view then
		slot3 = slot0.list_view:getActiveCellList() or {}

		for slot7, slot8 in ipairs(slot3) do
			slot9 = slot8:getData()

			if slot0.five_hero_vo[slot1] and slot9 and slot9.bid == slot0.five_hero_vo[slot1].bid then
				slot9.is_ui_select = false

				slot8:setSelected(slot9.is_ui_select)

				slot12, slot13 = slot0.hero_item_list[slot1]:getPosition()

				slot0:showMoveEffect(cc.p(slot12, slot13), slot0.left_panel:convertToNodeSpace(slot8:convertToWorldSpace(cc.p(HeroExhibitionItem.Width * 0.5, HeroExhibitionItem.Height * 0.5))), slot9)
				slot0.hero_item_list[slot1]:setData(nil)

				slot0.five_hero_vo[slot1] = nil

				slot0:calculateCampHaloType()

				return
			elseif slot0.five_hero_vo[slot1] then
				slot0.hero_item_list[slot1]:setData(slot0.five_hero_vo[slot1])
			end
		end

		if #slot3 <= 0 then
			slot0.hero_item_list[slot1]:setData(slot0.five_hero_vo[slot1])
		end
	end
end

function TrainingcampMainWindow.setData(slot0)
	if slot0.data == nil then
		return
	end

	slot0.title_name:setString(slot0.data.name)
	slot0.txt_lab:setString(slot0.data.tips)

	slot0.ban_pos_list = slot0.data.ban_pos
	slot1 = PathTool.getResFrame("trainingcamp", "trainingcamp_6")

	for slot5, slot6 in ipairs(slot0.hero_item_list) do
		for slot10, slot11 in ipairs(slot0.ban_pos_list) do
			if slot5 == slot11 then
				slot6:setDefaultHeadByRes(slot1, 1.3)

				break
			end
		end
	end

	if Config.UnitData.data_unit(slot0.data.target_id) then
		slot0:updateOrderTeamInfo(slot2)
	end

	slot3 = Config.FormationData.data_form_data[1]
	slot0.formation_type = 1

	if slot0.data.formation > 0 then
		slot3 = Config.FormationData.data_form_data[slot0.data.formation]
		slot0.formation_type = slot0.data.formation
	end

	slot0:initFormationData(slot3)
	slot0:updateFormationIcon()

	if slot0.data.flag == 0 then
		slot0.form_change_btn:setVisible(false)
	else
		slot0.form_change_btn:setVisible(true)
	end

	slot0:updateFinish()
	slot0:updateHeroList()
	slot0:calculateCampHaloType()
end

function TrainingcampMainWindow.updateFinish(slot0)
	if not slot0.data or not slot0.finish_img then
		return
	end

	slot1 = uv0:IsFinishById(slot0.data.id)

	slot0.finish_img:setVisible(slot1)

	if slot1 then
		uv1:openTrainingcampMainWindow(false)
	end
end

function TrainingcampMainWindow.createNewCell(slot0)
	slot1 = HeroExhibitionItem.new(0.9, true)
	slot1.from_type = HeroConst.ExhibitionItemType.eFormFight

	slot1:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot1
end

function TrainingcampMainWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function TrainingcampMainWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	slot1:setData(slot0.show_list[slot2])
end

function TrainingcampMainWindow.onCellTouched(slot0, slot1)
	if slot0.show_list[slot1.index] then
		slot0:selectHero(slot1, slot3)
	end
end

function TrainingcampMainWindow.updateHeroList(slot0)
	if slot0.data == nil then
		return
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot0.data.partner_id) do
		if Config.UnitData.data_unit(slot7) and Config.UnitData.data_unit(slot8.monster3) then
			hero_vo = HeroVo.New()
			hero_vo.bid = tonumber(slot9.head_icon)
			hero_vo.lev = slot9.lev
			hero_vo.star = slot9.star
			hero_vo.camp_type = slot9.camp_type
			hero_vo.id = slot7
			hero_vo.is_required = false

			if Config.PartnerData.data_partner_base[hero_vo.bid] then
				hero_vo.pos_type = slot10.pos_type
			end

			uv0(slot2, hero_vo)
		end
	end

	table.sort(slot2, SortTools.tableUpperSorter({
		"star",
		"lev"
	}))

	slot0.show_list = slot2

	if #slot2 > 0 then
		slot0.txt_lab_1:setVisible(false)
	else
		slot0.txt_lab_1:setVisible(true)
	end

	slot0.list_view:reloadData()

	for slot8, slot9 in ipairs(slot0.data.required_partner) do
		if Config.UnitData.data_unit(slot9[1]) and Config.UnitData.data_unit(slot10.monster3) then
			hero_vo = HeroVo.New()
			hero_vo.bid = tonumber(slot11.head_icon)
			hero_vo.lev = slot11.lev
			hero_vo.star = slot11.star
			hero_vo.camp_type = slot11.camp_type
			hero_vo.is_required = true
			hero_vo.id = slot9[1]

			if Config.PartnerData.data_partner_base[hero_vo.bid] then
				hero_vo.pos_type = slot12.pos_type
			end

			slot13 = slot9[2]

			if slot0.hero_item_list and slot0.hero_item_list[slot13] then
				slot0.five_hero_vo[slot13] = hero_vo

				slot0.hero_item_list[slot13]:setData(slot0.five_hero_vo[slot13])
				slot0:calculateCampHaloType()
			end

			hero_vo.is_ui_select = true
		end
	end

	if RoleController:getInstance():getRoleVo() then
		slot0.up_left_team_info.role_head:setHeadRes(slot5.face_id, false, LOADTEXT_TYPE, slot5.face_file, slot5.face_update_time)
	end
end

function TrainingcampMainWindow.selectHero(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	if not slot1 then
		return
	end

	if slot0.is_play_item_action then
		return
	end

	slot3 = -1

	for slot7, slot8 in pairs(slot0.five_hero_vo) do
		if slot8.bid == slot2.bid then
			slot3 = slot7

			break
		end
	end

	if slot3 ~= -1 then
		if slot0.hero_item_list[slot3] == nil then
			return
		end

		slot2.is_ui_select = false

		slot1:setSelected(slot2.is_ui_select)

		slot6, slot7 = slot0.hero_item_list[slot3]:getPosition()

		slot0:showMoveEffect(cc.p(slot6, slot7), slot0.up_panel:convertToNodeSpace(slot1:convertToWorldSpace(cc.p(HeroExhibitionItem.Width * 0.5, HeroExhibitionItem.Height * 0.5))), slot2)
		slot0.hero_item_list[slot3]:setData(nil)

		slot0.five_hero_vo[slot3] = nil

		slot0:calculateCampHaloType()
	else
		for slot8, slot9 in pairs(slot0.five_hero_vo) do
			slot4 = 0 + 1
		end

		if slot4 >= 5 then
			message(TI18N("上阵人数已满"))

			return
		end

		for slot8, slot9 in pairs(slot0.five_hero_vo) do
			if slot9.bid == slot2.bid then
				message(TI18N("不能同时上阵2个相同英雄"))

				return
			end
		end

		if slot0:getTheBestPos(slot2) == nil then
			message(TI18N("没有上阵位置"))

			return
		end

		slot8, slot9 = slot0.hero_item_list[slot5]:getPosition()

		slot0:showMoveEffect(slot0.up_panel:convertToNodeSpace(slot1:convertToWorldSpace(cc.p(HeroExhibitionItem.Width * 0.5, HeroExhibitionItem.Height * 0.5))), cc.p(slot8, slot9), slot2, function ()
			if uv0.hero_item_list and uv0.hero_item_list[uv1] then
				uv0.five_hero_vo[uv1] = uv2

				uv0.hero_item_list[uv1]:setData(uv0.five_hero_vo[uv1])
				uv0:calculateCampHaloType()
			end
		end)

		slot2.is_ui_select = true

		slot1:setSelected(slot2.is_ui_select)
	end
end

function TrainingcampMainWindow.getTheBestPos(slot0, slot1)
	if not slot0.five_hero_vo then
		return
	end

	if slot1.pos_type == 1 then
		-- Nothing
	elseif slot1.pos_type == 3 then
		for slot6 = #slot0.pos_name_list, 1, -1 do
			if slot0.five_hero_vo[slot6] == nil then
				slot7 = true

				for slot11, slot12 in ipairs(slot0.ban_pos_list) do
					if slot6 == slot12 then
						slot7 = false
					end
				end

				if slot7 == true then
					return slot6
				end
			end
		end
	else
		for slot5, slot6 in ipairs(slot0.pos_name_list) do
			if slot6 == slot1.pos_type and slot0.five_hero_vo[slot5] == nil then
				slot7 = true

				for slot11, slot12 in ipairs(slot0.ban_pos_list) do
					if slot5 == slot12 then
						slot7 = false
					end
				end

				if slot7 == true then
					return slot5
				end
			end
		end
	end

	for slot5, slot6 in ipairs(slot0.pos_name_list) do
		if slot0.five_hero_vo[slot5] == nil then
			slot7 = true

			for slot11, slot12 in ipairs(slot0.ban_pos_list) do
				if slot5 == slot12 then
					slot7 = false
				end
			end

			if slot7 == true then
				return slot5
			end
		end
	end

	return nil
end

function TrainingcampMainWindow.initFormationData(slot0, slot1)
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

		if slot0.hero_item_list[slot9] and slot0.up_left_team_info then
			slot0.hero_item_list[slot9]:setPosition(slot0.up_left_team_info.pos_list[slot10])
		end

		if slot10 <= 3 then
			slot0.pos_name_list[slot9] = 1
		elseif slot10 > 3 and slot10 <= 6 then
			slot0.pos_name_list[slot9] = 2
		else
			slot0.pos_name_list[slot9] = 3
		end

		if slot0.up_left_team_info then
			slot0.pos_rect_list[slot9] = cc.rect(slot0.up_left_team_info.pos_list[slot10].x - slot3 * 0.5, slot0.up_left_team_info.pos_list[slot10].y - slot3 * 0.5, slot3, slot3)
		end
	end
end

function TrainingcampMainWindow.showMoveEffect(slot0, slot1, slot2, slot3, slot4)
	slot0.is_play_item_action = true

	if slot0.move_hero_item == nil then
		slot0.move_hero_item = HeroExhibitionItem.new(0.9, false)

		slot0.left_panel:addChild(slot0.move_hero_item, 1)
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

function TrainingcampMainWindow.calculateCampHaloType(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.five_hero_vo) do
		if slot6.camp_type ~= nil then
			if slot1[slot6.camp_type] == nil then
				slot1[slot6.camp_type] = 1
			else
				slot1[slot6.camp_type] = slot1[slot6.camp_type] + 1
			end
		end
	end

	if slot0.halo_icon_load then
		slot0.halo_icon_load:DeleteMe()

		slot0.halo_icon_load = nil
	end

	slot0.halo_form_id_list = BattleController:getInstance():getModel():getFormIdListByCamp(slot1)

	if BattleController:getInstance():getModel():getCampIconConfigByIds(slot0.halo_form_id_list) then
		slot0.halo_icon_load = loadImageTextureFromCDN(slot0.halo_btn, PathTool.getCampGroupIcon(slot2.icon), ResourcesType.single, slot0.halo_icon_load)

		addCountForCampIcon(slot0.halo_btn, slot2.nums)
		slot0.halo_label:setString("")
	else
		slot0.halo_icon_load = loadImageTextureFromCDN(slot0.halo_btn, PathTool.getCampGroupIcon(1000), ResourcesType.single, slot0.halo_icon_load)

		addCountForCampIcon(slot0.halo_btn)
		slot0.halo_label:setString(TI18N("属性"))
	end
end

function TrainingcampMainWindow.updateOrderTeamInfo(slot0, slot1)
	slot0.my_team_right_scdata = slot1

	slot0:updateFormIcon(slot0.up_right_team_info, slot1.formation[1])

	slot3 = {}

	for slot8 = 1, 5 do
		if slot1["monster" .. slot8] then
			uv0(slot3, {
				pos = slot8,
				id = slot9
			})

			if 0 == 0 then
				slot4 = slot9
			end
		end
	end

	slot0:updateHeroInfo(slot2, slot3, slot1.formation[1])

	if Config.UnitData.data_unit(slot4) then
		slot2.role_head:setHeadRes(PathTool.getHeadIcon(slot5.head_icon), true)
	end
end

function TrainingcampMainWindow.updateFormIcon(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot2 then
		if slot2 < 1 then
			slot2 = 1
		end

		if slot2 > 6 then
			slot2 = 6
		end

		loadSpriteTexture(slot1.form_icon, PathTool.getResFrame("elitematch_matching", "elitematch_form_icon_" .. slot2), LOADTEXT_TYPE_PLIST)
	end
end

function TrainingcampMainWindow.updateHeroInfo(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	if Config.FormationData.data_form_data[slot3] then
		slot5 = {
			[slot10.pos] = slot10
		}

		for slot9, slot10 in pairs(slot2) do
			-- Nothing
		end

		for slot9, slot10 in pairs(slot1.hero_item_list) do
			slot10:setVisible(false)
		end

		for slot9, slot10 in ipairs(slot4.pos) do
			slot12 = slot10[2]
			slot13 = nil

			if slot5[slot10[1]] and Config.UnitData.data_unit(slot5[slot11].id) then
				slot13 = HeroVo.New()
				slot13.bid = tonumber(slot14.head_icon)
				slot13.lev = slot14.lev
				slot13.star = slot14.star
				slot13.camp_type = slot14.camp_type
			end

			if slot1.hero_item_list[slot11] == nil then
				slot1.hero_item_list[slot11] = HeroExhibitionItem.new(0.7, false)

				slot1.panel:addChild(slot1.hero_item_list[slot11])
			else
				slot1.hero_item_list[slot11]:setVisible(true)
			end

			slot1.hero_item_list[slot11]:setPosition(slot1.pos_list[slot12])

			if slot13 then
				slot1.hero_item_list[slot11]:setData(slot13)
				slot1.hero_item_list[slot11]:addCallBack(function ()
					HeroController:getInstance():openHeroTipsPanel(true, uv0)
				end)
			else
				slot1.hero_item_list[slot11]:setData(nil)
			end
		end
	end
end

function TrainingcampMainWindow.showColseEffect(slot0, slot1)
	if slot1 == true then
		if not slot0.tips_btn_effect then
			slot0.tips_btn_effect = createEffectSpine("E27151", cc.p(slot0.tips_btn:getContentSize().width / 2, slot0.tips_btn:getContentSize().height / 2), cc.p(0.5, 0.5), false, PlayerAction.action)

			slot0.tips_btn:addChild(slot0.tips_btn_effect, 1)
		else
			slot0.tips_btn_effect:setAnimation(0, PlayerAction.action, false)
		end
	elseif slot0.tips_btn_effect then
		slot0.tips_btn_effect:removeFromParent()

		slot0.tips_btn_effect = nil
	end
end

function TrainingcampMainWindow.showGuideEffect(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.guide_effect_1 then
			if slot2 then
				slot0.guide_effect_1 = createEffectSpine(PathTool.getEffectRes(198), cc.p(slot2:getContentSize().width / 2, slot2:getContentSize().height / 2), cc.p(0.5, 0.5), true, PlayerAction.action)

				slot2:addChild(slot0.guide_effect_1, 1)
			end
		else
			slot0.guide_effect_1:setAnimation(0, PlayerAction.action, true)
		end

		if not slot0.guide_effect_2 then
			if slot2 then
				slot0.guide_effect_2 = createEffectSpine(PathTool.getEffectRes(240), cc.p(slot2:getContentSize().width / 2, slot2:getContentSize().height / 2), cc.p(0.5, 0.5), true, PlayerAction.action_1)

				slot2:addChild(slot0.guide_effect_2, 1)
			end
		else
			slot0.guide_effect_2:setAnimation(0, PlayerAction.action_1, true)
		end
	else
		if slot0.guide_effect_1 then
			slot0.guide_effect_1:removeFromParent()

			slot0.guide_effect_1 = nil
		end

		if slot0.guide_effect_2 then
			slot0.guide_effect_2:removeFromParent()

			slot0.guide_effect_2 = nil
		end
	end
end

function TrainingcampMainWindow.openRootWnd(slot0, slot1)
	slot0.data = slot1

	if slot1 then
		uv0:send27602(slot0.data.id)
	end

	slot0:setData()
end

function TrainingcampMainWindow.close_callback(slot0)
	slot0:showColseEffect(false)
	slot0:showGuideEffect(false)

	if slot0.up_right_team_info then
		if slot0.up_right_team_info.role_head then
			slot0.up_right_team_info.role_head:DeleteMe()

			slot0.up_right_team_info.role_head = nil
		end

		if slot0.up_right_team_info.hero_item_list then
			for slot4, slot5 in ipairs(slot0.up_right_team_info.hero_item_list) do
				slot5:DeleteMe()
			end

			slot0.up_right_team_info.hero_item_list = {}
		end

		slot0.hero_item_list = {}
		slot0.up_right_team_info = nil
	end

	if slot0.up_left_team_info then
		if slot0.up_left_team_info.role_head then
			slot0.up_left_team_info.role_head:DeleteMe()

			slot0.up_left_team_info.role_head = nil
		end

		if slot0.up_left_team_info.hero_item_list then
			for slot4, slot5 in ipairs(slot0.up_left_team_info.hero_item_list) do
				slot5:DeleteMe()
			end

			slot0.up_left_team_info.hero_item_list = {}
		end

		slot0.hero_item_list = {}
		slot0.up_left_team_info = nil
	end

	if slot0.hero_item_list then
		for slot4, slot5 in ipairs(slot0.hero_item_list) do
			slot5:DeleteMe()
		end

		slot0.hero_item_list = {}
	end

	if slot0.move_hero_item then
		slot0.move_hero_item:stopAllActions()

		if slot0.move_hero_item.DeleteMe then
			slot0.move_hero_item:DeleteMe()
		end

		slot0.move_hero_item = nil
	end

	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.halo_icon_load then
		slot0.halo_icon_load:DeleteMe()

		slot0.halo_icon_load = nil
	end

	uv0:openTrainingcampMainWindow(false)
end
