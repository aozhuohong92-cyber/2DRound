HeroTipsPanel = HeroTipsPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function HeroTipsPanel.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "hero/hero_tips_panel"
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.attr_list = {
		"atk",
		"hp",
		"def",
		"speed"
	}
	slot0.break_icon_list = {}
	slot0.break_icon_bg_list = {}
	slot0.skill_width = 88
	slot0.skill_item_list = {}
	slot0.equip_type_list = HeroConst.EquipPosList
	slot0.equip_icon_name_list = {
		[6.0] = "hero_info_11",
		[5.0] = "hero_info_11",
		[BackPackConst.item_type.WEAPON] = "hero_info_7",
		[BackPackConst.item_type.SHOE] = "hero_info_10",
		[BackPackConst.item_type.CLOTHES] = "hero_info_9",
		[BackPackConst.item_type.HAT] = "hero_info_8"
	}
	slot0.holy_equip_type_list = HeroConst.HolyequipmentPosList
	slot0.holy_equip_icon_name_list = {
		[BackPackConst.item_type.GOD_EARRING] = "hero_info_25",
		[BackPackConst.item_type.GOD_RING] = "hero_info_27",
		[BackPackConst.item_type.GOD_NECKLACE] = "hero_info_26",
		[BackPackConst.item_type.GOD_BANGLE] = "hero_info_28"
	}
end

function HeroTipsPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.box_bg = slot0.main_panel:getChildByName("box_bg")
	slot0.box_bg_1 = slot0.main_panel:getChildByName("box_bg_1")
	slot0.title_icon = slot0.main_panel:getChildByName("title_icon")

	if slot0.box_bg_1 then
		slot0.box_bg_1:setVisible(false)
	end

	if slot0.title_icon then
		slot0.title_icon:setVisible(false)
	end

	slot0.top_panel = slot0.main_panel:getChildByName("top_panel")
	slot0.hero_node = slot0.top_panel:getChildByName("hero_node")
	slot0.hero_item = HeroExhibitionItem.new(0.8, false)

	slot0.hero_node:addChild(slot0.hero_item)

	slot0.hero_name = slot0.top_panel:getChildByName("hero_name")
	slot0.advanced_node = slot0.top_panel:getChildByName("advanced_node")
	slot0.power_click = slot0.top_panel:getChildByName("power_click")
	slot0.fight_label = CommonNum.new(20, slot0.power_click, 99999, -2, cc.p(0.5, 0.5))

	slot0.fight_label:setPosition(103, 28)

	slot0.comment_btn = slot0.top_panel:getChildByName("comment_btn")
	slot0.look_btn = slot0.top_panel:getChildByName("look_btn")
	slot1 = slot0.top_panel:getChildByName("attr_panel")
	slot0.attr_icon_list = {
		slot1:getChildByName("attr_icon1"),
		slot1:getChildByName("attr_icon2"),
		slot1:getChildByName("attr_icon3"),
		slot1:getChildByName("attr_icon4")
	}
	slot0.attr_label_list = {
		slot1:getChildByName("attr_label1"),
		slot1:getChildByName("attr_label2"),
		slot1:getChildByName("attr_label3"),
		slot1:getChildByName("attr_label4")
	}

	slot0.top_panel:getChildByName("advancedKey"):setString(TI18N("进阶:"))

	slot0.skill_container = slot0.top_panel:getChildByName("scroll_view")

	slot0.skill_container:setScrollBarEnabled(false)
	slot0.skill_container:setTouchEnabled(false)

	slot0.skill_container_size = slot0.skill_container:getContentSize()
	slot0.skill_key = slot0.top_panel:getChildByName("skill_key")

	slot0.skill_key:setString(TI18N("技\n能"))

	slot0.box_bg = slot0.main_panel:getChildByName("box_bg")
	slot5 = "equip_panel"
	slot0.equip_panel = slot0.main_panel:getChildByName(slot5)
	slot0.equip_node_list = {}

	for slot5 = 1, 6 do
		slot0.equip_node_list[slot5] = slot0.equip_panel:getChildByName("equip_node" .. slot5)
	end

	slot0.holy_equip_node_list = {}

	for slot5 = 1, 4 do
		slot0.holy_equip_node_list[slot5] = slot0.equip_panel:getChildByName("holy_equip_node_" .. slot5)
	end

	slot0.btn_goto = slot0.main_panel:getChildByName("btn_goto")

	if slot0.btn_goto then
		slot0.btn_goto:getChildByName("label"):setString(TI18N("更换英雄"))
	end
end

function HeroTipsPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 1)
	registerButtonEventListener(slot0.comment_btn, function ()
		uv0:onClickCommentBtn()
	end, true, 2, nil, 0.8)
	registerButtonEventListener(slot0.look_btn, function ()
		uv0:onClickLookBtn()
	end, true, 2, nil, 0.8)
	registerButtonEventListener(slot0.btn_goto, function ()
		uv0:onClickGotoBtn()
	end, true, 2)
	slot0:addGlobalEvent(HeroEvent.Del_Hero_Event, function (slot0)
		if uv0.hero_vo then
			for slot4, slot5 in ipairs(slot0) do
				if uv0.hero_vo.partner_id == slot5.partner_id then
					uv0:onClickCloseBtn()
				end
			end
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Get_Talent_Event, function ()
		if uv0.hero_vo then
			uv0:updateTalent(uv0.hero_vo)
		end
	end)
end

function HeroTipsPanel.onClickCommentBtn(slot0)
	if not slot0.hero_vo then
		return
	end

	PokedexController:getInstance():openCommentWindow(true, slot0.hero_vo)
end

function HeroTipsPanel.onClickCloseBtn(slot0)
	uv0:openHeroTipsPanel(false)
end

function HeroTipsPanel.onClickLookBtn(slot0)
	if not slot0.hero_vo then
		return
	end

	uv0:openHeroTipsAttrPanel(true, slot0.hero_vo)
end

function HeroTipsPanel.onClickGotoBtn(slot0)
	if not slot0.hero_vo then
		return
	end

	RoleController:getInstance():openRoleHeroShowFormPanel(true)
	slot0:onClickCloseBtn()
end

function HeroTipsPanel.openRootWnd(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.hero_vo = slot1

	if not Config.PartnerData.data_partner_base[slot1.bid] then
		return
	end

	slot4 = slot2 or {}
	slot5 = slot4.is_hide_equip or false
	slot6 = slot4.is_show_form_btn or false

	if slot1.star and slot1.star >= 13 then
		if slot0.box_bg_1 then
			slot0.box_bg_1:setVisible(true)
		end

		if slot0.title_icon then
			slot0.title_icon:setVisible(true)
		end

		slot0.box_bg:setVisible(false)
	end

	slot0.hero_item:setData(slot1)
	slot0.hero_name:setString(slot3.name)
	slot0.fight_label:setNum(slot1.power or 0)
	slot0:updateAdvanceInfo(slot1)

	for slot11, slot12 in ipairs(slot0.attr_list) do
		if slot0.attr_icon_list[slot11] then
			loadSpriteTexture(slot0.attr_icon_list[slot11], PathTool.getResFrame("common", PathTool.getAttrIconByStr(slot12)), LOADTEXT_TYPE_PLIST)
		end

		if slot0.attr_label_list[slot11] then
			slot0.attr_label_list[slot11]:setString(slot1[slot12] or 0)
		end
	end

	slot0:initSkill(slot1, Config.PartnerData.data_partner_brach[getNorKey(slot3.type, slot3.break_id, slot1.break_lev)])

	if slot5 then
		slot0.equip_panel:setVisible(false)
		slot0.box_bg:setContentSize(cc.size(slot0.box_bg:getContentSize().width, 370))
		slot0.main_panel:setPositionY(670)
	else
		slot0:updateEquip(slot1)
		slot0.equip_panel:getChildByName("skill_key"):setString(TI18N("天\n赋"))
		slot0:updateTalent(slot1)
		slot0.equip_panel:getChildByName("holy_key"):setString(TI18N("神\n装"))
		slot0:updateHolyEquip(slot1)

		if slot6 then
			slot0.btn_goto:setVisible(true)
			slot0.box_bg:setContentSize(cc.size(slot0.box_bg:getContentSize().width, 872))
		end
	end

	slot11 = slot1.exclusive_lev

	if slot1.exclusive_id then
		slot12 = Config.PartnerExclusiveData.data_exclusive_upgrade_info[slot10 .. "_" .. slot11]
		slot13 = Config.PartnerExclusiveData.data_exclusive_info[slot10]
		slot14 = Config.PartnerData.data_partner_base[slot1.bid]
		slot15 = slot0.equip_panel:getChildByName("soulWeapon")
		slot16 = slot15:getChildByName("mask")
		slot17 = slot15:getChildByName("item_layout")
		slot19 = slot15:getChildByName("level_bg"):getChildByName("level")

		if slot11 == 0 then
			slot11 = 1
		end

		if slot12 == nil then
			slot15:setVisible(false)
		else
			slot15:setVisible(true)
		end

		slot17:setBackGroundImage(PathTool.getResFrame("common", "common_1010"), LOADTEXT_TYPE_PLIST)

		slot21 = slot17:getChildByName("Image_3")

		slot21:setContentSize(cc.size(95, 95))
		slot21:loadTexture(PathTool.getItemRes(slot10, false), LOADTEXT_TYPE)

		slot22 = {}

		if slot12 and slot12.pre_star <= slot1.star then
			slot18:setVisible(true)
			slot16:setVisible(false)
			slot19:setString(slot11)

			slot22 = {
				weapon_name = slot13.name,
				hero_name = slot14.name or {},
				hero_id = slot1.partner_id or 1,
				weapon_id = slot10,
				weapon_lev = slot0.hero_vo.exclusive_lev or 1,
				icon_res = slot20,
				desc = slot13.desc,
				status = HeroConst.soulWeapon.status.lock,
				attr = slot12.base_attr,
				score = slot12.score,
				pre_star = slot12.pre_star,
				strengthen_skills = slot12.strengthen_skills
			}
		end

		if slot22.weapon_lev == 0 then
			slot22.weapon_lev = 1
		end

		slot16:addTouchEventListener(function (slot0, slot1)
			if ccui.TouchEventType.ended == slot1 then
				uv0:openSoulWeaponPanel(true, uv1, {
					open_type = 0
				})
			end
		end)
		slot17:addTouchEventListener(function (slot0, slot1)
			if ccui.TouchEventType.ended == slot1 then
				uv0:openSoulWeaponPanel(true, uv1, {
					open_type = 0
				})
			end
		end)
	end
end

function HeroTipsPanel.updateAdvanceInfo(slot0, slot1)
	slot2 = uv0:getHeroMaxBreakCountByInitStar(slot1.star)
	slot3 = 35
	slot4 = slot1.break_lev or 0

	if uv0:isResonateCystalHero(slot1) then
		slot4 = slot1.resonate_break_lev or 0
	end

	slot5 = 0

	for slot9, slot10 in ipairs(slot0.break_icon_list) do
		slot10:setVisible(false)
	end

	for slot9 = 1, slot2 do
		if slot9 <= slot4 then
			if not slot0.break_icon_list[slot9] then
				slot0.break_icon_list[slot9] = createSprite(PathTool.getResFrame("tips", "tips_12"), slot5 + (slot9 - 1) * slot3, 0, slot0.advanced_node, cc.p(0, 0.5), LOADTEXT_TYPE_PLIST, 1)
			else
				slot0.break_icon_list[slot9]:setVisible(true)
			end

			if slot0.break_icon_bg_list[slot9] then
				slot0.break_icon_bg_list[slot9]:setVisible(false)
			end
		else
			if slot0.break_icon_list[slot9] then
				slot0.break_icon_list[slot9]:setVisible(false)
			end

			if not slot0.break_icon_bg_list[slot9] then
				slot0.break_icon_bg_list[slot9] = createSprite(PathTool.getResFrame("tips", "tips_13"), slot5 + (slot9 - 1) * slot3, 0, slot0.advanced_node, cc.p(0, 0.5), LOADTEXT_TYPE_PLIST, 0)
			else
				slot0.break_icon_bg_list[slot9]:setVisible(true)
			end
		end
	end
end

function HeroTipsPanel.initSkill(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	slot4 = {}

	if deepCopy(Config.PartnerData.data_partner_star(getNorKey(slot1.bid, slot1.star))) == nil then
		return
	end

	slot6 = {}

	for slot10, slot11 in ipairs(slot4.skills) do
		if slot11[1] ~= 1 then
			slot12 = Config.PartnerSkinData.data_skilltonewskill[getNorKey(slot1.use_skin or 0, slot11[2])]

			if slot1.star >= 10 and slot12 then
				uv0(slot6, {
					slot11[1],
					slot12
				})
			elseif slot1.exclusive_lev and slot1.exclusive_lev >= 10 then
				slot15 = Config.PartnerExclusiveData.data_exclusive_skills[slot1.exclusive_id]

				if #Config.PartnerExclusiveData.data_exclusive_upgrade_info[slot1.exclusive_id .. "_" .. slot1.exclusive_lev].strengthen_skills > 0 then
					for slot21, slot22 in pairs(slot16.strengthen_skills) do
						if slot22[2] == slot11[2] then
							slot11[2] = slot22[1]
						end
					end
				end

				uv0(slot6, slot11)
			else
				uv0(slot6, slot11)
			end
		end
	end

	slot13 = cc.size

	slot0.skill_container:setInnerContainerSize(slot13(math.max(slot0.skill_container_size.width, (slot0.skill_width + 16) * #slot6), slot0.skill_container_size.height))

	for slot13, slot14 in ipairs(slot0.skill_item_list) do
		slot14:setVisible(false)
	end

	slot10 = 0

	for slot14, slot15 in ipairs(slot6) do
		if slot1.horcrux_lev ~= nil then
			if slot1.horcrux_lev >= 35 then
				slot16 = slot15[2] + 1
			elseif slot1.horcrux_lev >= 30 and slot15[1] == 4 then
				slot16 = slot16 + 1
			elseif slot1.horcrux_lev >= 20 and slot15[1] == 3 then
				slot16 = slot16 + 1
			elseif slot1.horcrux_lev >= 10 and slot15[1] == 2 then
				slot16 = slot16 + 1
			end
		end

		if Config.SkillData.data_get_skill(slot16) then
			slot18 = false

			if slot2.skill_num < slot15[1] then
				slot18 = true
			end

			if slot0.skill_item_list[slot14] == nil then
				slot0.skill_item_list[slot14] = {}
				slot0.skill_item_list[slot14] = SkillItem.new(true, true, true, 0.7, true)

				slot0.skill_container:addChild(slot0.skill_item_list[slot14])
			end

			slot0.skill_item_list[slot14]:setData(slot17)
			slot0.skill_item_list[slot14]:showUnEnabled(slot18)
			slot0.skill_item_list[slot14]:setVisible(true)
			slot0.skill_item_list[slot14]:setPosition(slot10 + slot7 * (slot14 - 1) + slot7 * 0.5, slot0.skill_width / 2 + 6)
		else
			print(uv1("技能表id: %s 没发现", tostring(slot15.skill_bid)))
		end
	end
end

function HeroTipsPanel.updateEquip(slot0, slot1)
	slot0.equip_item_list = {}
	slot2 = {}

	if slot1.eqms ~= nil then
		for slot6, slot7 in ipairs(slot1.eqms) do
			slot2[slot7.type] = GoodsVo.New(slot7.base_id)
		end
	elseif slot1.eqm_list ~= nil then
		for slot6, slot7 in pairs(slot1.eqm_list) do
			slot2[slot6] = slot7
		end
	end

	if slot1.artifacts ~= nil then
		for slot6, slot7 in ipairs(slot1.artifacts) do
			if slot7.artifact_pos < 100 then
				slot8 = slot7.artifact_pos + 4
				slot2[slot8] = GoodsVo.New(slot7.base_id)

				if slot2[slot8].initAttrData then
					slot2[slot8]:initAttrData(slot7)
				end
			end
		end
	elseif slot1.artifact_list ~= nil then
		for slot6, slot7 in pairs(slot1.artifact_list) do
			slot2[slot6 + 4] = slot7
		end
	end

	for slot6, slot7 in pairs(slot0.equip_item_list) do
		slot7:setData()

		if slot7.empty_icon then
			slot7.empty_icon:setVisible(true)
		end

		slot7.equip_vo = nil
	end

	for slot6, slot7 in ipairs(slot0.equip_node_list) do
		slot8 = slot0.equip_type_list[slot6] or slot6
		slot9 = slot2[slot8]

		if slot0.equip_item_list[slot8] == nil then
			slot10 = BackPackItem.new(false, true, nil, 1, false, true)

			slot7:addChild(slot10, 1)
			slot10:setPosition(cc.p(0, 0))
			slot10:setScale(0.7)
			slot10:addBtnCallBack(function ()
				uv0:selectEquipVo(uv1:getData(), uv2)
			end)

			slot10.empty_icon = createImage(slot10:getRoot(), PathTool.getResFrame("hero", slot0.equip_icon_name_list[slot8]), 60, 60, cc.p(0.5, 0.5), true, 10, false)
			slot0.equip_item_list[slot8] = slot10
		end

		if slot9 then
			slot0.equip_item_list[slot8]:setData(slot9)

			slot0.equip_item_list[slot8].equip_vo = slot9

			if slot0.equip_item_list[slot8].empty_icon then
				slot0.equip_item_list[slot8].empty_icon:setVisible(false)
			end
		end
	end
end

function HeroTipsPanel.selectEquipVo(slot0, slot1, slot2)
	if not slot0.hero_vo then
		return
	end

	if not slot1 then
		return
	end

	if slot2 == 5 or slot2 == 6 then
		uv0:openArtifactTipsWindow(true, slot1, PartnerConst.ArtifactTips.normal, slot0.hero_vo.partner_id, slot2 - 4)
	else
		uv0:openEquipTips(true, slot1, PartnerConst.EqmTips.normal, slot0.hero_vo)
	end
end

function HeroTipsPanel.updateTalent(slot0, slot1)
	slot3 = slot0.equip_panel:getChildByName("skill_node")

	if not slot0.equip_panel:getChildByName("skill_tips") then
		return
	end

	if not slot3 then
		return
	end

	if slot0.talent_skill_item_list then
		return
	end

	if not RoleController:getInstance():getRoleVo() then
		return
	end

	slot5 = {}

	if slot4 and slot1.rid and slot1.srv_id and slot4.rid == slot1.rid and slot4.srv_id == slot1.srv_id and uv0:isOpenTanlentByHerovo(slot1) and slot1.ishaveTalentData and not slot1:ishaveTalentData() then
		uv1:sender11099({
			{
				partner_id = slot1.partner_id
			}
		})

		return
	end

	if slot1.talent_skill_list then
		for slot9, slot10 in pairs(slot1.talent_skill_list) do
			uv2(slot5, {
				pos = slot9,
				skill_id = slot10
			})
		end
	elseif slot1.dower_skill then
		slot5 = slot1.dower_skill
	end

	uv3(slot5, function (slot0, slot1)
		return slot0.pos < slot1.pos
	end)

	if #slot5 > 0 then
		slot2:setVisible(false)

		slot0.talent_skill_item_list = {}

		for slot11, slot12 in ipairs(slot5) do
			if Config.SkillData.data_get_skill(slot12.skill_id) then
				slot0.talent_skill_item_list[slot11] = SkillItem.new(true, true, true, 0.7, nil, false)

				slot0.talent_skill_item_list[slot11]:setPosition(0 + (slot11 - 1) * 104, 0)
				slot0.talent_skill_item_list[slot11]:setData(slot13)
				slot3:addChild(slot0.talent_skill_item_list[slot11])
			end
		end
	else
		slot2:setString(TI18N("暂无天赋"))
	end
end

function HeroTipsPanel.updateHolyEquip(slot0, slot1)
	slot0.holy_equip_item_list = {}
	slot2 = {}

	if slot1.holy_eqm ~= nil then
		for slot6, slot7 in ipairs(slot1.holy_eqm) do
			if Config.ItemData.data_get_data(slot7.base_id) then
				slot7.type = slot8.type
				slot2[slot7.type] = GoodsVo.New(slot7.base_id)

				if slot2[slot7.type].initAttrData then
					slot2[slot7.type]:initAttrData(slot7)
				end

				slot2[slot7.type]:setEnchantScore(0)
			end
		end
	elseif slot1.holy_eqm_list ~= nil then
		for slot6, slot7 in pairs(slot1.holy_eqm_list) do
			slot2[slot6] = slot7
		end
	end

	for slot6, slot7 in pairs(slot0.holy_equip_item_list) do
		slot7:setData()

		if slot7.empty_icon then
			slot7.empty_icon:setVisible(true)
		end

		slot7.equip_vo = nil
	end

	for slot6, slot7 in ipairs(slot0.holy_equip_node_list) do
		slot8 = slot0.holy_equip_type_list[slot6] or slot6
		slot9 = slot2[slot8]

		if slot0.holy_equip_item_list[slot8] == nil then
			slot10 = BackPackItem.new(false, true, nil, 1, false, true)

			slot7:addChild(slot10, 1)
			slot10:setPosition(cc.p(0, 0))
			slot10:setScale(0.7)
			slot10:addBtnCallBack(function ()
				uv0:selectEquipVo(uv1:getData(), uv2)
			end)

			slot10.empty_icon = createImage(slot10:getRoot(), PathTool.getResFrame("hero", slot0.holy_equip_icon_name_list[slot8]), 60, 60, cc.p(0.5, 0.5), true, 10, false)
			slot0.holy_equip_item_list[slot8] = slot10
		end

		if slot9 then
			slot0.holy_equip_item_list[slot8]:setData(slot9)

			slot0.holy_equip_item_list[slot8].equip_vo = slot9

			if slot0.holy_equip_item_list[slot8].empty_icon then
				slot0.holy_equip_item_list[slot8].empty_icon:setVisible(false)
			end
		end
	end

	if slot0.holy_tips_label == nil then
		slot0.holy_tips_label = createRichLabel(20, cc.c4b(224, 191, 152, 255), cc.p(0.5, 0.5), cc.p(298.12, -284), nil, nil, 720)

		slot0.equip_panel:addChild(slot0.holy_tips_label)
	end

	if next(uv0:getHolyEquipSuitDes(slot2)) ~= nil then
		for slot8, slot9 in ipairs(slot3) do
			slot4 = TI18N("已激活: ") .. uv1("<img src='%s' scale=0.8 /> %s ", slot9.icon_res, slot9.name)
		end

		slot0.holy_tips_label:setString(slot4)
	else
		slot0.holy_tips_label:setString(TI18N("暂无组合套装"))
	end
end

function HeroTipsPanel.close_callback(slot0)
	if slot0.hero_item then
		slot0.hero_item:DeleteMe()

		slot0.hero_item = nil
	end

	if slot0.fight_label then
		slot0.fight_label:DeleteMe()

		slot0.fight_label = nil
	end

	if slot0.equip_item_list then
		for slot4, slot5 in pairs(slot0.equip_item_list) do
			slot5:DeleteMe()
		end
	end

	slot0.equip_item_list = nil

	if slot0.skill_item_list then
		for slot4, slot5 in pairs(slot0.skill_item_list) do
			slot5:DeleteMe()
		end
	end

	slot0.skill_item_list = nil

	uv0:openHeroTipsPanel(false)
end
