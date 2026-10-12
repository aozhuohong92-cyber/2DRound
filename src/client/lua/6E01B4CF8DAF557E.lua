slot1 = ActionyearmonsterController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
ActionyearmonsterMonsterInfo = ActionyearmonsterMonsterInfo or BaseClass(BaseView)

function ActionyearmonsterMonsterInfo.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "actionyearmonster/actionyearmonster_monster_info"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("planes", "planes_map"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("planes", "planes_info"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("planes", "big_bg_2"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("planes", "big_bg_3"),
			type = ResourcesType.single
		}
	}
	slot0.award_item_list = {}
	slot0.left_item_list = {}
	slot0.right_item_list = {}
end

function ActionyearmonsterMonsterInfo.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.win_title = slot1:getChildByName("win_title")

	slot0.win_title:setString(TI18N("守卫"))

	slot0.tips_txt = slot1:getChildByName("tips_txt")

	slot0.tips_txt:setVisible(false)
	slot1:getChildByName("award_txt"):setString(TI18N("奖励"))
	loadSpriteTexture(slot1:getChildByName("left_bg_1"), PathTool.getPlistImgForDownLoad("planes", "big_bg_3"), LOADTEXT_TYPE)

	slot8 = LOADTEXT_TYPE

	loadSpriteTexture(slot1:getChildByName("right_bg_1"), PathTool.getPlistImgForDownLoad("planes", "big_bg_2"), slot8)

	slot0.btn_fight = slot1:getChildByName("btn_fight")

	slot0.btn_fight:getChildByName("label"):setString(TI18N("开战"))

	slot0.btn_embattle = slot1:getChildByName("btn_embattle")

	slot0.btn_embattle:getChildByName("label"):setString(TI18N("布阵"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.left_name_txt = slot1:getChildByName("name_txt_1")
	slot0.left_atk_txt = slot1:getChildByName("atk_txt_1")

	slot0.left_atk_txt:setString(0)

	slot0.left_role_panel = slot1:getChildByName("panel_role_left")
	slot0.right_name_txt = slot1:getChildByName("name_txt_2")
	slot0.right_atk_txt = slot1:getChildByName("atk_txt_2")
	slot0.right_role_panel = slot1:getChildByName("panel_role_right")
	slot0.add_atk_txt_1 = slot1:getChildByName("add_atk_txt_1")

	slot0.add_atk_txt_1:setString(TI18N("战力值+0%"))

	slot0.add_atk_txt_2 = slot1:getChildByName("add_atk_txt_2")

	slot0.add_atk_txt_2:setVisible(false)

	slot0.left_elfin_item_list = {}
	slot0.right_elfin_item_list = {}
	slot0.tree_lv_left = slot1:getChildByName("tree_lv_left")
	slot0.tree_lv_right = slot1:getChildByName("tree_lv_right")

	slot0.tree_lv_right:setVisible(false)

	slot0.left_elfin_panel = slot1:getChildByName("left_elfin_panel")
	slot0.right_elfin_panel = slot1:getChildByName("right_elfin_panel")
	slot4 = slot0.left_role_panel:getContentSize()
	slot0.left_position_list = {}

	for slot8 = 1, 9 do
		slot10, slot11 = slot0.left_role_panel:getChildByName("pos_bg_" .. slot8):getPosition()

		uv0(slot0.left_position_list, cc.p(slot10, slot11))
	end

	slot0.right_position_list = {}

	for slot8 = 1, 9 do
		slot10, slot11 = slot0.right_role_panel:getChildByName("pos_bg_" .. slot8):getPosition()

		uv0(slot0.right_position_list, cc.p(slot10, slot11))
	end

	slot0.left_role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.left_role_head:setPosition(92, 857)
	slot0.left_role_head:setScale(0.9)
	slot0.main_container:addChild(slot0.left_role_head)

	slot0.right_role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.right_role_head:setPosition(402, 857)
	slot0.right_role_head:setScale(0.9)
	slot0.main_container:addChild(slot0.right_role_head)

	slot0.reward_panel = slot1:getChildByName("reward_panel")
	slot5 = slot0.reward_panel:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.reward_panel, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot5.width, slot5.height + 10), {
		start_y = 10,
		start_x = 0,
		space_x = 15,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.item_scrollview:setClickEnabled(false)
end

function ActionyearmonsterMonsterInfo.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.btn_fight, handler(slot0, slot0.onClickFightBtn), true)
	registerButtonEventListener(slot0.btn_embattle, handler(slot0, slot0.onClickEmbattleBtn), true)
	slot0:addGlobalEvent(HeroEvent.Update_Fun_Form, function (slot0)
		if slot0 and slot0.type == PartnerConst.Fun_Form.YearMonster then
			uv0.form_data = slot0

			uv0:setMyFormData()
		end
	end)
	slot0:addGlobalEvent(ElfinEvent.Get_Elfin_Tree_Data_Event, function ()
		uv0:updateMyElfinInfo()
	end)
	slot0:addGlobalEvent(ActionyearmonsterEvent.Year_Get_Master_Data_Event, function (slot0)
		uv0:setMasterData(slot0)
	end)
end

function ActionyearmonsterMonsterInfo.onClickCloseBtn(slot0)
	uv0:openActionyearmonsterMonsterInfo(false)
end

function ActionyearmonsterMonsterInfo.onClickFightBtn(slot0)
	if not slot0.form_data or not slot0.grid_index then
		return
	end

	slot1 = {}

	uv0(slot1, {
		val2 = 0,
		type = ActionyearmonsterConstants.Proto_28203._1,
		val1 = slot0.form_data.formation_type
	})

	slot5 = {
		val2 = 0,
		type = ActionyearmonsterConstants.Proto_28203._2,
		val1 = slot6
	}
	slot6 = slot0.form_data.hallows_id

	uv0(slot1, slot5)

	for slot5, slot6 in pairs(slot0.form_data.pos_info) do
		uv0(slot1, {
			type = ActionyearmonsterConstants.Proto_28203._3,
			val1 = slot6.pos,
			val2 = slot6.id
		})
	end

	uv1:sender28203(slot0.grid_index, 1, slot1)
	uv1:openActionyearmonsterMonsterInfo(false)
end

function ActionyearmonsterMonsterInfo.onClickEmbattleBtn(slot0)
	HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.YearMonster, {}, HeroConst.FormShowType.eFormSave)
end

function ActionyearmonsterMonsterInfo.openRootWnd(slot0, slot1)
	slot0.grid_index = slot1

	slot0:updateAwardList()
	HeroController:getInstance():sender11211(PartnerConst.Fun_Form.YearMonster)
	uv0:sender28203(slot1, 0, {})
end

function ActionyearmonsterMonsterInfo.updateAwardList(slot0)
	if not slot0.grid_index then
		return
	end

	if not uv0:getYearEvtVoByGridIndex(slot0.grid_index) or not slot1.config then
		return
	end

	slot0.win_title:setString(slot1.config.name)

	if slot1.config.type == ActionyearmonsterConstants.Evt_Type.Monster then
		slot0.right_name_txt:setString(slot1.config.name)
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot1.config.reward or {}) do
		uv1(slot3, {
			bid = slot8[1],
			quantity = slot8[2]
		})
	end

	slot0.item_scrollview:setData(slot3)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot6 = slot5:getData()

			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
end

function ActionyearmonsterMonsterInfo.setMyFormData(slot0)
	slot1 = RoleController:getInstance():getRoleVo()

	if not slot0.form_data or not slot1 then
		return
	end

	slot0.left_name_txt:setString(slot1.name)

	slot6 = false

	slot0.left_role_head:setHeadRes(slot1.face_id, slot6, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)

	slot0.hero_base_atk_val = 0
	slot2 = Config.FormationData.data_form_data[slot0.form_data.formation_type]

	for slot6 = 1, 5 do
		slot8 = nil

		if slot0:getRoleDataByIndex(slot6, slot0.form_data.pos_info) then
			slot8 = HeroController:getInstance():getModel():getHeroById(slot7.id)
		end

		slot9 = slot0.left_item_list[slot6]

		if slot8 then
			if slot9 == nil then
				slot0.left_item_list[slot6] = slot0:createHeroItemByIndex(slot6, slot0.left_role_panel, true)
			else
				slot9:setVisible(true)
			end

			slot9:setData(slot8)

			if slot2.pos[slot6] and slot0.left_position_list[slot10[2]] then
				slot9:setPosition(slot11)
			end

			slot0.hero_base_atk_val = slot0.hero_base_atk_val + (slot8.power or 0)
		elseif slot9 then
			slot9:setVisible(false)
		end
	end

	slot0.left_atk_txt:setString(slot0.hero_base_atk_val)
	slot0:updateMyElfinInfo()
end

function ActionyearmonsterMonsterInfo.updateMyElfinInfo(slot0)
	if not ElfinController:getInstance():getModel():getElfinTreeData() then
		return
	end

	slot0.tree_lv_left:setString(uv0(TI18N("佩罗娜：%d级"), slot1.lev or 0))

	for slot5 = 1, 4 do
		if not slot0.left_elfin_item_list[slot5] then
			slot6 = SkillItem.new(true, true, true, 0.5, true)

			slot6:setPosition(cc.p(28 + (slot5 - 1) * 68, 24))
			slot0.left_elfin_panel:addChild(slot6)

			slot0.left_elfin_item_list[slot5] = slot6
		end

		slot0:setElfinSkillItemData(slot6, slot1.sprites or {}, slot5)
	end
end

function ActionyearmonsterMonsterInfo.setMasterData(slot0, slot1)
	if not slot1 then
		return
	end

	if not Config.UnitData3.data_unit1(slot1.unit_id) then
		return
	end

	slot0.right_atk_txt:setString(slot1.power)

	if slot2.monster3 and Config.UnitData3.data_unit2(slot2.monster3) then
		slot0.right_role_head:setHeadRes(PathTool.getHeadIcon(slot3.head_icon), true)
		slot0.right_name_txt:setString(slot3.name)
	end

	slot3 = Config.FormationData.data_form_data[slot2.formation[1]]
	slot4 = {
		[slot9] = {
			pos = slot9,
			id = slot10
		}
	}
	slot5 = 0

	for slot9 = 1, 5 do
		if slot2["monster" .. slot9] then
			-- Nothing
		end
	end

	for slot9, slot10 in ipairs(slot3.pos) do
		slot12 = slot10[2]
		slot13 = nil

		if slot4[slot10[1]] and Config.UnitData3.data_unit2(slot4[slot11].id) then
			slot13 = HeroVo.New()
			slot13.bid = tonumber(slot14.head_icon)
			slot13.master_head_id = tonumber(slot14.head_icon)
			slot13.lev = slot1.unit_lev
			slot13.star = slot14.star
			slot13.camp_type = slot14.camp_type
		end

		if slot0.right_item_list[slot11] == nil then
			slot0.right_item_list[slot11] = slot0:createHeroItemByIndex(slot11, slot0.right_role_panel, false)
		else
			slot0.right_item_list[slot11]:setVisible(true)
		end

		if slot0.right_position_list[slot10[2]] then
			slot0.right_item_list[slot11]:setPosition(slot14)
		end

		if slot13 then
			slot0.right_item_list[slot11]:setData(slot13)
		else
			slot0.right_item_list[slot11]:setData(nil)
			slot0.right_item_list[slot11]:setVisible(false)
		end
	end
end

function ActionyearmonsterMonsterInfo.getElfinBidByPos(slot0, slot1, slot2)
	if not slot1 or next(slot1) == nil then
		return
	end

	for slot6, slot7 in pairs(slot1) do
		if slot7.pos == slot2 then
			return slot7.item_bid
		end
	end
end

function ActionyearmonsterMonsterInfo.setElfinSkillItemData(slot0, slot1, slot2, slot3)
	if slot0:getElfinBidByPos(slot2, slot3) then
		slot1:showLockIcon(false)

		if slot4 == 0 or not Config.SpriteData.data_elfin_data(slot4) then
			slot1:setData()
			slot1:showLevel(false)
		elseif Config.SkillData.data_get_skill(slot5.skill) then
			slot1:showLevel(true)
			slot1:setData(slot6)
		end
	else
		slot1:setData()
		slot1:showLevel(false)
		slot1:showLockIcon(true)
	end
end

function ActionyearmonsterMonsterInfo.getMyRoleIdByIndex(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot2) do
		if slot7.pos == slot1 then
			return slot7.id
		end
	end
end

function ActionyearmonsterMonsterInfo.getRoleDataByIndex(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot2) do
		if slot7.pos == slot1 then
			return slot7
		end
	end
end

function ActionyearmonsterMonsterInfo.createHeroItemByIndex(slot0, slot1, slot2, slot3)
	slot4 = HeroExhibitionItem.new(0.65, slot3, nil, nil, true)

	slot4:addCallBack(handler(slot0, slot0.onClickHeroItem))
	slot2:addChild(slot4)
	slot4:setVisible(true)

	return slot4
end

function ActionyearmonsterMonsterInfo.onClickHeroItem(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	if slot2.is_master then
		if slot2.srv_id ~= "" and slot2.rid and slot2.partner_id then
			LookController:getInstance():sender11061(slot2.rid, slot2.srv_id, slot2.partner_id)
		else
			message(TI18N("该英雄来自异域，无法查看"))
		end
	else
		HeroController:getInstance():openHeroTipsPanel(true, slot2)
	end
end

function ActionyearmonsterMonsterInfo.close_callback(slot0)
	if slot0.left_role_head then
		slot0.left_role_head:DeleteMe()

		slot0.left_role_head = nil
	end

	if slot0.right_role_head then
		slot0.right_role_head:DeleteMe()

		slot0.right_role_head = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	for slot4, slot5 in pairs(slot0.award_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	for slot4, slot5 in pairs(slot0.right_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	for slot4, slot5 in pairs(slot0.left_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	for slot4, slot5 in pairs(slot0.left_elfin_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	for slot4, slot5 in pairs(slot0.right_elfin_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openActionyearmonsterMonsterInfo(false)
end
