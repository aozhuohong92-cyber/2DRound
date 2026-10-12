slot1 = PlanesafkController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
PlanesafkMasterWindow = PlanesafkMasterWindow or BaseClass(BaseView)

function PlanesafkMasterWindow.__init(slot0)
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

function PlanesafkMasterWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.win_title = slot1:getChildByName("win_title")

	slot0.win_title:setString(TI18N("守卫"))
	slot1:getChildByName("tips_txt"):setString(TI18N("挑战守卫或首领胜利后可掉落增强实力的遗物"))
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

	slot0.award_tips_txt:setString("")

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
end

function PlanesafkMasterWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.btn_fight, handler(slot0, slot0.onClickFightBtn), true)
	registerButtonEventListener(slot0.btn_embattle, handler(slot0, slot0.onClickEmbattleBtn), true)
	slot0:addGlobalEvent(PlanesafkEvent.Get_All_Hero_Event, function ()
		uv0.get_all_hero_flag = true

		if uv0.form_data then
			uv0:setMyFormData()
		end
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Get_Form_Data_Event, function (slot0)
		uv0.form_data = slot0

		if uv0.get_all_hero_flag then
			uv0:setMyFormData()
		end
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Update_Form_Data_Event, function (slot0, slot1)
		uv0:updateMyFormData(slot0, slot1)
	end)
	slot0:addGlobalEvent(ElfinEvent.Get_Elfin_Tree_Data_Event, function ()
		uv0:updateMyElfinInfo()
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Update_Form_Atk_Event, function (slot0)
		uv0:updateMyHeroAtkVal(slot0)
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Get_Master_Data_Event, function (slot0)
		uv0:setMasterData(slot0)
	end)
	slot0:addGlobalEvent(ElfinEvent.Elfin_Plan_From_Info_Event, function (slot0)
		uv0:updateMyEflinSkill(slot0)
	end)
end

function PlanesafkMasterWindow.onClickCloseBtn(slot0)
	uv0:openPlanesafkMasterWindow(false)
end

function PlanesafkMasterWindow.onClickFightBtn(slot0)
	if not slot0.form_data or not slot0.data then
		return
	end

	if #slot0.form_data.pos_info < 6 then
		CommonAlert.show(TI18N("当前出战队伍<div fontcolor=#ff0000>不足6名</div>英雄, 是否坚持出战？"), TI18N("确定"), function ()
			uv0:comfirmFight()
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, , 24)
	else
		slot0:comfirmFight()
	end
end

function PlanesafkMasterWindow.comfirmFight(slot0)
	if not slot0.form_data or not slot0.data then
		return
	end

	slot1 = {}

	uv0(slot1, {
		val2 = 0,
		type = PlanesafkConst.Proto_28600._1,
		val1 = slot0.form_data.formation_type
	})

	slot5 = {
		val2 = 0,
		type = PlanesafkConst.Proto_28600._2,
		val1 = slot6
	}
	slot6 = slot0.form_data.hallows_id

	uv0(slot1, slot5)

	for slot5, slot6 in pairs(slot0.form_data.pos_info) do
		if slot6.flag and slot6.flag == 1 or slot6.data and slot6.data.flag == 1 then
			uv0(slot1, {
				type = PlanesafkConst.Proto_28600._4,
				val1 = slot6.pos,
				val2 = slot6.id
			})
		else
			uv0(slot1, {
				type = PlanesafkConst.Proto_28600._3,
				val1 = slot6.pos,
				val2 = slot6.id
			})
		end
	end

	uv1:sender28600(slot0.data.line, slot0.data.index, 1, slot1, nil, true)
	uv1:openPlanesafkMasterWindow(false)
end

function PlanesafkMasterWindow.onClickEmbattleBtn(slot0)
	HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.Planes, {}, HeroConst.FormShowType.eFormSave)
end

function PlanesafkMasterWindow.openRootWnd(slot0, slot1)
	slot0.data = slot1

	if not slot1 then
		return
	end

	slot0:updateAwardList()
	uv0:sender28612()
	uv0:sender28600(slot0.data.line, slot0.data.index, 0, {})
	uv0:sender28613()
	ElfinController:getInstance():send26555(PartnerConst.Fun_Form.Planes)

	if uv0:getMapEvtData(slot0.data.line, slot0.data.index) and slot2.is_black then
		slot0.btn_fight:setVisible(false)
		slot0.btn_embattle:setVisible(false)
	end
end

function PlanesafkMasterWindow.showEterniteTips(slot0, slot1)
	if slot1 then
		if slot0.eternite_tips == nil then
			slot2 = 1300

			if Config.PlanesData.data_const.planes_spar_atk_radio then
				slot2 = slot3.val
			end

			slot0.eternite_tips = createLabel(18, cc.c3b(36, 144, 3), nil, 326, 812, uv0(TI18N("生命金卡:攻击增加%s%%"), (slot2 - 1000) / 10), slot0.main_container, nil, cc.p(1, 0.5))
		else
			slot0.eternite_tips:setVisible(true)
		end
	elseif slot0.eternite_tips then
		slot0.eternite_tips:setVisible(false)
	end
end

function PlanesafkMasterWindow.updateAwardList(slot0)
	if not slot0.data.evt_config then
		return
	end

	slot0.win_title:setString(slot1.name)

	if slot1.type == PlanesafkConst.Evt_Type.Monster then
		slot0.right_name_txt:setString(slot1.name)
	end

	slot2 = 0

	if not RoleController:getInstance():getRoleVo() then
		return
	end

	slot4 = slot3.lev or 1
	slot6 = nil

	if Config.PlanesData.data_reward_info[slot1.reward_list[1]] then
		for slot10, slot11 in ipairs(slot5) do
			if slot11.min and slot11.max and slot11.min <= slot4 and slot4 <= slot11.max then
				slot6 = slot11.reward
			end
		end
	end

	slot8 = {}

	for slot12, slot13 in pairs(slot6 or {}) do
		if ({
			bid = slot13[1],
			quantity = math.floor((1 + slot2 / 1000) * slot13[2])
		}).bid == 25 and uv0:isHolidayOpen() then
			slot14.quantity = math.floor(slot14.quantity * 1.1 + 0.5)
		end

		uv1(slot8, slot14)
	end

	slot0.item_scrollview:setData(slot8)
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

function PlanesafkMasterWindow.setMyFormData(slot0)
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

	for slot7 = 1, 6 do
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
			delayRun(slot0.right_role_panel, 0.03 * slot7, function ()
				if uv0 == nil then
					uv0 = uv1:createHeroItemByIndex(uv2, uv1.left_role_panel)
					uv1.left_item_list[uv2] = uv0
				else
					uv0:setVisible(true)
				end

				uv0:setData(uv3)

				if uv3.flag == 1 then
					uv0:showHelpImg(true)
				else
					uv0:showHelpImg(false)
				end

				if uv3.hp_per or PlanesafkController:getInstance():getModel():getMyPlanesHeroHpPer(uv3.partner_id, uv3.flag) then
					uv0:showProgressbar(slot0)
				end

				if uv4.pos[uv2] and uv1.left_position_list[slot1[2]] then
					uv0:setPosition(slot2)
				end
			end)

			slot0.hero_base_atk_val = slot0.hero_base_atk_val + (slot9.power or 0)
		elseif slot10 then
			slot10:setVisible(false)
		end
	end

	if next(slot3) ~= nil then
		uv2:sender28610(slot3)
	end

	slot0:updateMyElfinInfo()
end

function PlanesafkMasterWindow.updateMyElfinInfo(slot0)
	if not ElfinController:getInstance():getModel():getElfinTreeData() then
		return
	end

	slot0.tree_lv_left:setString(uv0(TI18N("佩罗娜：%d级"), slot1.lev or 0))
end

function PlanesafkMasterWindow.updateMyEflinSkill(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = {}

	if slot1.team_list and slot1.team_list[1] then
		slot2 = slot1.team_list[1].sprites or {}
	end

	for slot6 = 1, 4 do
		if not slot0.left_elfin_item_list[slot6] then
			slot7 = SkillItem.new(true, true, true, 0.5, true)

			slot7:setPosition(cc.p(28 + (slot6 - 1) * 68, 24))
			slot0.left_elfin_panel:addChild(slot7)

			slot0.left_elfin_item_list[slot6] = slot7
		end

		slot0:setElfinSkillItemData(slot7, slot2, slot6)
	end
end

function PlanesafkMasterWindow.updateMyFormData(slot0, slot1, slot2)
	if not slot0.form_data then
		return
	end

	slot0.form_data.formation_type = slot1
	slot0.form_data.pos_info = slot2
	slot0.hero_base_atk_val = 0
	slot3 = {}
	slot4 = Config.FormationData.data_form_data[slot0.form_data.formation_type]

	for slot8 = 1, 6 do
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

			if slot10.hp_per or PlanesafkController:getInstance():getModel():getMyPlanesHeroHpPer(slot10.partner_id, slot10.flag) then
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
		uv1:sender28610(slot3)
	end
end

function PlanesafkMasterWindow.setMasterData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.data then
		return
	end

	if slot0.data.evt_config and slot2.type == PlanesafkConst.Evt_Type.Guard then
		slot0.right_name_txt:setString(slot1.name)
	end

	slot0.right_atk_txt:setString(slot1.guards_power)

	slot7 = false

	slot0.right_role_head:setHeadRes(slot1.face, slot7, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)

	slot3 = Config.FormationData.data_form_data[slot1.formation_type]

	for slot7 = 1, 6 do
		slot9 = slot0.right_item_list[slot7]

		if slot0:getRoleDataByIndex(slot7, slot1.guards) then
			delayRun(slot0.right_role_panel, 0.04 * slot7, function ()
				if tolua.isnull(uv0.right_role_panel) then
					return
				end

				if uv1 == nil then
					uv1 = uv0:createHeroItemByIndex(uv2, uv0.right_role_panel)
					uv0.right_item_list[uv2] = uv1
				else
					uv1:setVisible(true)
				end

				uv3.is_master = true
				uv3.rid = uv4.rid or 0
				uv3.srv_id = uv4.srv_id or ""

				uv1:setData(uv3)

				if uv3.hp_per then
					uv1:showProgressbar(uv3.hp_per)

					if uv3.hp_per <= 0 then
						uv1:showStrTips(true, TI18N("已阵亡"), {
							c3b = cc.c3b(255, 255, 255)
						})
					end
				end

				if uv5.pos[uv2] and uv0.right_position_list[slot0[2]] then
					uv1:setPosition(slot1)
				end
			end)
		elseif slot9 then
			slot9:setVisible(false)
		end
	end

	slot0.tree_lv_right:setString(uv0(TI18N("佩罗娜：%d级"), slot1.sprite_lev or 0))

	for slot7 = 1, 4 do
		if not slot0.right_elfin_item_list[slot7] then
			slot8 = SkillItem.new(true, true, true, 0.5, true)

			slot8:setPosition(cc.p(-11 + (slot7 - 1) * 64, 24))
			slot0.right_elfin_panel:addChild(slot8)

			slot0.right_elfin_item_list[slot7] = slot8
		end

		slot0:setElfinSkillItemData(slot8, slot1.sprites or {}, slot7)
	end

	if (slot1.strength or 1000) >= 1000 then
		slot0.add_atk_txt_2:setString(uv0(TI18N("难度加成:+%s%%"), (slot4 - 1000) / 10))
	else
		slot0.add_atk_txt_2:setString(uv0(TI18N("难度加成:-%s%%"), (1000 - slot4) / 10))
	end

	for slot8, slot9 in pairs(slot1.buffs or {}) do
		if slot9.quality == 1 then
			slot0.left_buff_txt_1:setString(slot9.num)
		elseif slot9.quality == 2 then
			slot0.left_buff_txt_2:setString(slot9.num)
		elseif slot9.quality == 3 then
			slot0.left_buff_txt_3:setString(slot9.num)
		end
	end

	if slot1.is_spar and slot1.is_spar == 1 then
		slot0:showEterniteTips(true)
	else
		slot0:showEterniteTips(false)
	end
end

function PlanesafkMasterWindow.getElfinBidByPos(slot0, slot1, slot2)
	if not slot1 or next(slot1) == nil then
		return
	end

	for slot6, slot7 in pairs(slot1) do
		if slot7.pos == slot2 then
			return slot7.item_bid
		end
	end
end

function PlanesafkMasterWindow.setElfinSkillItemData(slot0, slot1, slot2, slot3)
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

function PlanesafkMasterWindow.updateMyHeroAtkVal(slot0, slot1)
	slot0.left_atk_txt:setString(slot1)

	slot0.hero_base_atk_val = slot0.hero_base_atk_val or 0

	slot0.add_atk_txt_1:setString(string.format(TI18N("战力值+%d%%"), (slot1 - slot0.hero_base_atk_val) / slot0.hero_base_atk_val * 100))
end

function PlanesafkMasterWindow.getMyRoleIdByIndex(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot2) do
		if slot7.pos == slot1 then
			return slot7.id
		end
	end
end

function PlanesafkMasterWindow.getRoleDataByIndex(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot2) do
		if slot7.pos == slot1 then
			return slot7
		end
	end
end

function PlanesafkMasterWindow.createHeroItemByIndex(slot0, slot1, slot2)
	slot3 = HeroExhibitionItem.new(0.65, true, nil, , true)

	slot3:addCallBack(handler(slot0, slot0.onClickHeroItem))
	slot2:addChild(slot3)
	slot3:setVisible(true)

	return slot3
end

function PlanesafkMasterWindow.onClickHeroItem(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	if slot2.is_master then
		if slot2.srv_id ~= "" and slot2.rid and slot2.partner_id then
			LookController:getInstance():sender11061(slot2.rid, slot2.srv_id, slot2.partner_id, {
				hp = slot2.hp_max,
				atk = slot2.atk,
				power = slot2.guards_power
			})
		else
			message(TI18N("该英雄来自异域，无法查看"))
		end
	elseif slot2.flag == 1 and slot2.partner_id then
		PlanesafkController:getInstance():sender28623(slot2.partner_id)
	else
		HeroController:getInstance():openHeroTipsPanel(true, slot2)
	end
end

function PlanesafkMasterWindow.close_callback(slot0)
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

	uv0:openPlanesafkMasterWindow(false)
end
