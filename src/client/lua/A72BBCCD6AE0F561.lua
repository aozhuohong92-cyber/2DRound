slot1 = PlanesController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
PlanesMasterWindow = PlanesMasterWindow or BaseClass(BaseView)

function PlanesMasterWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "planes/planes_master_info"
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

function PlanesMasterWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1
	slot0.win_title = slot1:getChildByName("win_title")

	slot0.win_title:setString(TI18N("守卫"))
	slot1:getChildByName("tips_txt"):setString(TI18N("挑战怪物或精英怪胜利后可掉落增强实力的遗物"))
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
	slot0.left_buff_txt_1 = slot1:getChildByName("left_buff_txt_1")
	slot0.left_buff_txt_2 = slot1:getChildByName("left_buff_txt_2")
	slot0.left_buff_txt_3 = slot1:getChildByName("left_buff_txt_3")
	slot0.add_atk_txt_1 = slot1:getChildByName("add_atk_txt_1")

	slot0.add_atk_txt_1:setString(TI18N("战力值+0%"))

	slot0.add_atk_txt_2 = slot1:getChildByName("add_atk_txt_2")
	slot0.award_tips_txt = slot1:getChildByName("award_tips_txt")
	slot0.left_elfin_item_list = {}
	slot0.right_elfin_item_list = {}
	slot0.tree_lv_left = slot1:getChildByName("tree_lv_left")
	slot0.tree_lv_right = slot1:getChildByName("tree_lv_right")
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

function PlanesMasterWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.btn_fight, handler(slot0, slot0.onClickFightBtn), true)
	registerButtonEventListener(slot0.btn_embattle, handler(slot0, slot0.onClickEmbattleBtn), true)
	slot0:addGlobalEvent(PlanesEvent.Get_All_Hero_Event, function ()
		uv0.get_all_hero_flag = true

		if uv0.form_data then
			uv0:setMyFormData()
		end
	end)
	slot0:addGlobalEvent(PlanesEvent.Get_Form_Data_Event, function (slot0)
		uv0.form_data = slot0

		if uv0.get_all_hero_flag then
			uv0:setMyFormData()
		end
	end)
	slot0:addGlobalEvent(PlanesEvent.Update_Form_Data_Event, function (slot0, slot1)
		uv0:updateMyFormData(slot0, slot1)
	end)
	slot0:addGlobalEvent(ElfinEvent.Get_Elfin_Tree_Data_Event, function ()
		uv0:updateMyElfinInfo()
	end)
	slot0:addGlobalEvent(PlanesEvent.Update_Form_Atk_Event, function (slot0)
		uv0:updateMyHeroAtkVal(slot0)
	end)
	slot0:addGlobalEvent(PlanesEvent.Get_Master_Data_Event, function (slot0)
		uv0:setMasterData(slot0)
	end)
end

function PlanesMasterWindow.onClickCloseBtn(slot0)
	uv0:openPlanesMasterWindow(false)
end

function PlanesMasterWindow.onClickFightBtn(slot0)
	if not slot0.form_data or not slot0.grid_index then
		return
	end

	slot1 = {}

	uv0(slot1, {
		val2 = 0,
		type = PlanesConst.Proto_23104._6,
		val1 = slot0.form_data.formation_type
	})

	slot5 = {
		val2 = 0,
		type = PlanesConst.Proto_23104._7,
		val1 = slot6
	}
	slot6 = slot0.form_data.hallows_id

	uv0(slot1, slot5)

	for slot5, slot6 in pairs(slot0.form_data.pos_info) do
		if slot6.flag and slot6.flag == 1 or slot6.data and slot6.data.flag == 1 then
			uv0(slot1, {
				type = PlanesConst.Proto_23104._11,
				val1 = slot6.pos,
				val2 = slot6.id
			})
		else
			uv0(slot1, {
				type = PlanesConst.Proto_23104._8,
				val1 = slot6.pos,
				val2 = slot6.id
			})
		end
	end

	uv1:sender23104(slot0.grid_index, 1, slot1)
	uv1:openPlanesMasterWindow(false)
end

function PlanesMasterWindow.onClickEmbattleBtn(slot0)
	HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.Planes, {}, HeroConst.FormShowType.eFormSave)
end

function PlanesMasterWindow.openRootWnd(slot0, slot1)
	slot0.grid_index = slot1

	slot0:updateAwardList()
	uv0:sender23122()
	uv0:sender23104(slot1, 0, {})
	uv0:sender23115()
end

function PlanesMasterWindow.updateAwardList(slot0)
	if not slot0.grid_index then
		return
	end

	if not uv0:getPlanesEvtVoByGridIndex(slot0.grid_index) or not slot1.config then
		return
	end

	slot0.win_title:setString(slot1.config.name)

	if slot1.config.type == PlanesConst.Evt_Type.Monster then
		slot0.right_name_txt:setString(slot1.config.name)
	end

	slot2 = uv0:getCurDunId()
	slot4 = {}

	for slot8, slot9 in pairs(Config.SecretDunData.data_customs) do
		if uv0:checkDunIsPassByDunId(slot8) then
			slot3 = 0 + (slot9.add_radio or 0)
		end
	end

	slot0.award_tips_txt:setString(TI18N(uv1("当前奖励加成值:%d%%", slot3 / 10)))

	slot6 = {}

	for slot10, slot11 in pairs(slot1.config.reward or {}) do
		uv2(slot6, {
			bid = slot11[1],
			quantity = math.floor((1 + slot3 / 1000) * slot11[2])
		})
	end

	slot0.item_scrollview:setData(slot6)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			if slot5:getData().bid == 25 and uv1:isHolidayOpen() then
				slot5:holidHeroExpeditTag(true, TI18N("限时提升"))
			end

			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
end

function PlanesMasterWindow.setMyFormData(slot0)
	slot1 = RoleController:getInstance():getRoleVo()

	if not slot0.form_data or not slot1 then
		return
	end

	slot0.left_name_txt:setString(slot1.name)

	slot7 = LOADTEXT_TYPE

	slot0.left_role_head:setHeadRes(slot1.face_id, false, slot7, slot1.face_file, slot1.face_update_time)

	slot0.hero_base_atk_val = 0
	slot2 = Config.FormationData.data_form_data[slot0.form_data.formation_type]
	slot3 = {}

	for slot7 = 1, 5 do
		slot9 = nil

		if slot0:getRoleDataByIndex(slot7, slot0.form_data.pos_info) then
			if slot8.flag and slot8.flag == 1 then
				uv1(slot3, {
					flag = 1,
					id = uv0:getPlanesHireHeroData(slot8.id).partner_id
				})
			else
				uv1(slot3, {
					flag = 0,
					id = HeroController:getInstance():getModel():getHeroById(slot8.id).partner_id
				})
			end
		end

		slot10 = slot0.left_item_list[slot7]

		if slot9 then
			if slot10 == nil then
				slot0.left_item_list[slot7] = slot0:createHeroItemByIndex(slot7, slot0.left_role_panel)
			else
				slot10:setVisible(true)
			end

			slot10:setData(slot9)

			if slot9.flag == 1 then
				slot10:showHelpImg(true)
			else
				slot10:showHelpImg(false)
			end

			if slot9.hp_per or PlanesController:getInstance():getModel():getMyPlanesHeroHpPer(slot9.partner_id, slot9.flag) then
				slot10:showProgressbar(slot11)
			end

			if slot2.pos[slot7] and slot0.left_position_list[slot12[2]] then
				slot10:setPosition(slot13)
			end

			slot0.hero_base_atk_val = slot0.hero_base_atk_val + (slot9.power or 0)
		elseif slot10 then
			slot10:setVisible(false)
		end
	end

	if next(slot3) ~= nil then
		uv2:sender23120(slot3)
	end

	slot0:updateMyElfinInfo()
end

function PlanesMasterWindow.updateMyElfinInfo(slot0)
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

function PlanesMasterWindow.updateMyFormData(slot0, slot1, slot2)
	if not slot0.form_data then
		return
	end

	slot0.form_data.formation_type = slot1
	slot0.form_data.pos_info = slot2
	slot0.hero_base_atk_val = 0
	slot3 = {}
	slot4 = Config.FormationData.data_form_data[slot0.form_data.formation_type]

	for slot8 = 1, 5 do
		slot10 = nil

		if slot0:getRoleDataByIndex(slot8, slot2) then
			if slot9.data and slot9.data.flag == 1 then
				slot10 = slot9.data

				uv0(slot3, {
					flag = 1,
					id = slot9.data.partner_id
				})
			else
				uv0(slot3, {
					flag = 0,
					id = HeroController:getInstance():getModel():getHeroById(slot9.id).partner_id
				})
			end
		end

		slot11 = slot0.left_item_list[slot8]

		if slot10 then
			if slot11 == nil then
				slot0.left_item_list[slot8] = slot0:createHeroItemByIndex(slot8, slot0.left_role_panel)
			else
				slot11:setVisible(true)
			end

			slot11:setData(slot10)

			if slot10.flag == 1 then
				slot11:showHelpImg(true)
			else
				slot11:showHelpImg(false)
			end

			if slot10.hp_per or PlanesController:getInstance():getModel():getMyPlanesHeroHpPer(slot10.partner_id, slot10.flag) then
				slot11:showProgressbar(slot12)
			end

			if slot4.pos[slot8] and slot0.left_position_list[slot13[2]] then
				slot11:setPosition(slot14)
			end

			slot0.hero_base_atk_val = slot0.hero_base_atk_val + (slot10.power or 0)
		elseif slot11 then
			slot11:setVisible(false)
		end
	end

	if next(slot3) ~= nil then
		uv1:sender23120(slot3)
	end
end

function PlanesMasterWindow.setMasterData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.grid_index and uv0:getPlanesEvtVoByGridIndex(slot0.grid_index) and slot2.config and slot2.config.type == PlanesConst.Evt_Type.Guard then
		slot0.right_name_txt:setString(slot1.name)
	end

	slot0.right_atk_txt:setString(slot1.guards_power)

	slot6 = false

	slot0.right_role_head:setHeadRes(slot1.face, slot6, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)

	slot2 = Config.FormationData.data_form_data[slot1.formation_type]

	for slot6 = 1, 5 do
		slot8 = slot0.right_item_list[slot6]

		if slot0:getRoleDataByIndex(slot6, slot1.guards) then
			if slot8 == nil then
				slot0.right_item_list[slot6] = slot0:createHeroItemByIndex(slot6, slot0.right_role_panel)
			else
				slot8:setVisible(true)
			end

			slot7.is_master = true
			slot7.rid = slot1.rid or 0
			slot7.srv_id = slot1.srv_id or ""

			slot8:setData(slot7)

			if slot7.hp_per then
				slot8:showProgressbar(slot7.hp_per)

				if slot7.hp_per <= 0 then
					slot8:showStrTips(true, TI18N("已阵亡"), {
						c3b = cc.c3b(255, 255, 255)
					})
				end
			end

			if slot2.pos[slot6] and slot0.right_position_list[slot9[2]] then
				slot8:setPosition(slot10)
			end
		elseif slot8 then
			slot8:setVisible(false)
		end
	end

	slot0.tree_lv_right:setString(uv1(TI18N("佩罗娜：%d级"), slot1.sprite_lev or 0))

	for slot6 = 1, 4 do
		if not slot0.right_elfin_item_list[slot6] then
			slot7 = SkillItem.new(true, true, true, 0.5, true)

			slot7:setPosition(cc.p(-11 + (slot6 - 1) * 64, 24))
			slot0.right_elfin_panel:addChild(slot7)

			slot0.right_elfin_item_list[slot6] = slot7
		end

		slot0:setElfinSkillItemData(slot7, slot1.sprites or {}, slot6)
	end

	if (slot1.strength or 1000) >= 1000 then
		slot0.add_atk_txt_2:setString(uv1(TI18N("难度加成:+%s%%"), (slot3 - 1000) / 10))
	else
		slot0.add_atk_txt_2:setString(uv1(TI18N("难度加成:-%s%%"), (1000 - slot3) / 10))
	end

	for slot7, slot8 in pairs(slot1.buffs or {}) do
		if slot8.quality == 1 then
			slot0.left_buff_txt_1:setString(slot8.num)
		elseif slot8.quality == 2 then
			slot0.left_buff_txt_2:setString(slot8.num)
		elseif slot8.quality == 3 then
			slot0.left_buff_txt_3:setString(slot8.num)
		end
	end
end

function PlanesMasterWindow.getElfinBidByPos(slot0, slot1, slot2)
	if not slot1 or next(slot1) == nil then
		return
	end

	for slot6, slot7 in pairs(slot1) do
		if slot7.pos == slot2 then
			return slot7.item_bid
		end
	end
end

function PlanesMasterWindow.setElfinSkillItemData(slot0, slot1, slot2, slot3)
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

function PlanesMasterWindow.updateMyHeroAtkVal(slot0, slot1)
	slot0.left_atk_txt:setString(slot1)

	slot0.hero_base_atk_val = slot0.hero_base_atk_val or 0

	slot0.add_atk_txt_1:setString(string.format(TI18N("战力值+%d%%"), (slot1 - slot0.hero_base_atk_val) / slot0.hero_base_atk_val * 100))
end

function PlanesMasterWindow.getMyRoleIdByIndex(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot2) do
		if slot7.pos == slot1 then
			return slot7.id
		end
	end
end

function PlanesMasterWindow.getRoleDataByIndex(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot2) do
		if slot7.pos == slot1 then
			return slot7
		end
	end
end

function PlanesMasterWindow.createHeroItemByIndex(slot0, slot1, slot2)
	slot3 = HeroExhibitionItem.new(0.65, true, nil, nil, true)

	slot3:addCallBack(handler(slot0, slot0.onClickHeroItem))
	slot2:addChild(slot3)
	slot3:setVisible(true)

	return slot3
end

function PlanesMasterWindow.onClickHeroItem(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	if slot2.is_master then
		if slot2.srv_id ~= "" and slot2.rid and slot2.partner_id then
			LookController:getInstance():sender11061(slot2.rid, slot2.srv_id, slot2.partner_id)
		else
			message(TI18N("该英雄来自异域，无法查看"))
		end
	elseif slot2.flag == 1 and slot2.partner_id then
		PlanesController:getInstance():sender23116(slot2.partner_id)
	else
		HeroController:getInstance():openHeroTipsPanel(true, slot2)
	end
end

function PlanesMasterWindow.close_callback(slot0)
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

	uv0:openPlanesMasterWindow(false)
end
