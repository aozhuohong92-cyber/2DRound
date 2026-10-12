HeroMainTabTrainPanel = class("HeroMainTabTrainPanel", function ()
	return ccui.Widget:create()
end)
slot0 = string.format
slot2 = HeroController:getInstance():getModel()
slot3 = table.insert
slot4 = RoleController:getInstance():getRoleVo()

function HeroMainTabTrainPanel.ctor(slot0, slot1)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function HeroMainTabTrainPanel.config(slot0)
	slot0.break_icon_bg_list = {}
	slot0.break_icon_list = {}
	slot0.attr_list = {
		"atk",
		"hp",
		"def",
		"speed"
	}
	slot0.skill_width = 88
	slot0.skill_item_list = {}
	slot0.record_cost_res = {}
	slot0.cystal_max_lev_limit = 400

	if Config.ResonateData.data_const.cystal_max_lev_limit then
		slot0.cystal_max_lev_limit = slot1.val
	end
end

function HeroMainTabTrainPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_main_tab_train_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.tab_panel = slot0.root_wnd:getChildByName("tab_panel")

	slot0.tab_panel:getChildByName("levelKey"):setString(TI18N("等级:"))
	slot0.tab_panel:getChildByName("advancedKey"):setString(TI18N("进阶:"))

	slot0.advanced_node = slot0.tab_panel:getChildByName("advanced_node")
	slot2 = slot0.tab_panel:getChildByName("level")

	slot2:setVisible(false)

	slot3, slot4 = slot2:getPosition()
	slot0.level = createRichLabel(24, cc.c4b(223, 204, 146, 255), cc.p(0, 0.5), cc.p(slot3, slot4), nil, nil, 600)

	slot0.tab_panel:addChild(slot0.level)

	slot0.level_up_bg = slot0.tab_panel:getChildByName("bg_1")
	slot0.item_icon1 = slot0.tab_panel:getChildByName("item_icon1")
	slot0.item_icon2 = slot0.tab_panel:getChildByName("item_icon2")
	slot0.level_up_cost1 = slot0.tab_panel:getChildByName("level_up_cost1")
	slot0.level_up_cost2 = slot0.tab_panel:getChildByName("level_up_cost2")
	slot0.level_up_btn = slot0.tab_panel:getChildByName("level_up_btn")
	slot0.level_up_label = slot0.level_up_btn:getChildByName("label")
	slot0.attr_icon_list = {
		slot0.tab_panel:getChildByName("attr_icon1"),
		slot0.tab_panel:getChildByName("attr_icon2"),
		slot0.tab_panel:getChildByName("attr_icon3"),
		slot0.tab_panel:getChildByName("attr_icon4")
	}
	slot0.attr_label_list = {
		slot0.tab_panel:getChildByName("attr_label1"),
		slot0.tab_panel:getChildByName("attr_label2"),
		slot0.tab_panel:getChildByName("attr_label3"),
		slot0.tab_panel:getChildByName("attr_label4")
	}
	slot0.profession_icon = slot0.tab_panel:getChildByName("profession_icon")

	slot0.profession_icon:setPositionX(369)

	slot0.profession_name = slot0.tab_panel:getChildByName("profession_name")
	slot5, slot6 = slot0.profession_name:getPosition()
	slot5 = slot5 - 22

	slot0.profession_name:setPositionX(slot5)

	slot11 = nil
	slot0.introduce_label = createLabel(24, cc.c3b(255, 255, 255), slot11, slot5 + 52, slot6, "", slot0.tab_panel, 2, cc.p(0, 0.5))
	slot0.look_btn = slot0.tab_panel:getChildByName("look_btn")
	slot0.skill_container = slot0.tab_panel:getChildByName("skill_container")

	slot0.skill_container:setScrollBarEnabled(false)

	slot10 = false

	slot0.skill_container:setTouchEnabled(slot10)

	slot0.skill_container_size = slot0.skill_container:getContentSize()

	for slot10, slot11 in ipairs(slot0.attr_list) do
		if slot0.attr_icon_list[slot10] then
			loadSpriteTexture(slot0.attr_icon_list[slot10], PathTool.getResFrame("hero", "hero_info_attr_" .. slot11), LOADTEXT_TYPE_PLIST)
		end
	end

	slot0.fuse_btn_label = createRichLabel(22, cc.c3b(36, 144, 3), cc.p(0.5, 0.5), cc.p(360, 260))

	slot0.fuse_btn_label:setString(uv0("<div href=xxx>%s</div>", TI18N("可在果实共鸣中升级")))
	slot0.tab_panel:addChild(slot0.fuse_btn_label)
	slot0.fuse_btn_label:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		if uv0.hero_vo then
			JumpController:getInstance():jumpViewByEvtData({
				55
			})
		end
	end, {
		"click",
		"href"
	})
end

function HeroMainTabTrainPanel.registerEvents(slot0)
	slot0.level_up_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.began then
			uv0.is_click_btn = false

			if GuideController:getInstance():isInGuide() then
				return
			end

			uv0.sequence_action = uv0.level_up_btn:runAction(cc.Sequence:create(cc.DelayTime:create(0.3), cc.CallFunc:create(function ()
				uv0:startTimeTicket()
			end)))

			uv0.sequence_action:setTag(1)
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.canceled then
			uv0:clearTimeTicket()
		elseif slot1 == ccui.TouchEventType.ended then
			uv0:clearTimeTicket()

			if not uv0.is_click_btn then
				playButtonSound2()
				GlobalEvent:getInstance():Fire(HeroEvent.Hero_Can_Play_Level_UP_Music_Event)
				uv0:onClickLevelUpBtn()
			end
		end
	end)
	registerButtonEventListener(slot0.look_btn, function ()
		uv0:onClickLookBtn()
	end, true, 2, nil, 0.8)

	if slot0.hero_data_update_event == nil then
		slot0.hero_data_update_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Data_Update, function (slot0)
			if not slot0 or not uv0.hero_vo then
				return
			end

			if slot0.partner_id == uv0.hero_vo.partner_id then
				uv0.is_send_level = false

				uv0:updateInfo(slot0)

				uv0.is_update_hero_info = true

				uv0:setUpdateRedPointInfo()
			end
		end)
	end

	if slot0.hero_detail_data_update_event == nil then
		slot0.hero_detail_data_update_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Detail_Data_Update, function (slot0)
			if not slot0 or not uv0.hero_vo then
				return
			end

			if slot0.partner_id == uv0.hero_vo.partner_id then
				uv0:updateAttr(slot0)
			end
		end)
	end

	if not slot0.update_soulWeapon_status then
		slot0.update_soulWeapon_status = GlobalEvent:getInstance():Bind(HeroEvent.SOUL_WEAPON_UPDATA_STATE, function (slot0)
			uv0.is_send_level = false
			uv0.hero_vo.exclusive_lev = slot0.lev

			uv0:updateInfo(uv0.hero_vo)

			uv0.is_update_hero_info = true
		end)
	end

	if slot0.hero_equip_update_event == nil then
		slot0.hero_equip_update_event = GlobalEvent:getInstance():Bind(HeroEvent.Equip_Update_Event, function ()
			if not uv0.hero_vo then
				return
			end

			uv0:updateAttr(uv0.hero_vo)
		end)
	end

	if slot0.hero_artifact_update_event == nil then
		slot0.hero_artifact_update_event = GlobalEvent:getInstance():Bind(HeroEvent.Artifact_Update_Event, function ()
			if not uv0.hero_vo then
				return
			end

			uv0:updateAttr(uv0.hero_vo)
		end)
	end

	if slot0.hero_level_redpoint_event == nil then
		slot0.hero_level_redpoint_event = GlobalEvent:getInstance():Bind(HeroEvent.Level_RedPoint_Event, function (slot0)
			if not uv0.hero_vo then
				return
			end

			uv0.is_update_res_info = true

			uv0:setUpdateRedPointInfo()
		end)
	end

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if uv0.show_model_type == HeroConst.BagTab.eBagHero and slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				for slot5, slot6 in pairs(slot1) do
					if slot6.base_id == uv1.upgrade_star_cost_id or slot6.base_id == uv1.upgrade_star_cost_id_2 then
						uv0.hero_vo.red_point[HeroConst.RedPointType.eRPLevelUp] = nil

						uv0:updateLevelUpRedPoint()
					end
				end
			end
		end)
	end

	if not slot0.del_goods_event then
		slot0.del_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if uv0.show_model_type == HeroConst.BagTab.eBagHero and slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				for slot5, slot6 in pairs(slot1) do
					if slot6.base_id == uv1.upgrade_star_cost_id or slot6.base_id == uv1.upgrade_star_cost_id_2 then
						uv0.hero_vo.red_point[HeroConst.RedPointType.eRPLevelUp] = nil

						uv0:updateLevelUpRedPoint()
					end
				end
			end
		end)
	end

	if not slot0.modify_goods_event then
		slot0.modify_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if uv0.show_model_type == HeroConst.BagTab.eBagHero and slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				for slot5, slot6 in pairs(slot1) do
					if slot6.base_id == uv1.upgrade_star_cost_id or slot6.base_id == uv1.upgrade_star_cost_id_2 then
						uv0.hero_vo.red_point[HeroConst.RedPointType.eRPLevelUp] = nil

						uv0:updateLevelUpRedPoint()
					end
				end
			end
		end)
	end

	if uv1 ~= nil and slot0.role_lev_event == nil then
		slot0.role_lev_event = uv1:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if not uv0.hero_vo then
				return
			end

			if HeroCalculate.getHeroShowLevelStatus(uv0.hero_vo) == 1 then
				if slot0 == "coin" then
					uv0:updateCostInfo(uv0.hero_vo)
				elseif slot0 == "hero_exp" then
					uv0:updateCostInfo(uv0.hero_vo)
				end
			end
		end)
	end
end

function HeroMainTabTrainPanel.setUpdateRedPointInfo(slot0)
	if slot0.is_update_res_info and slot0.is_update_hero_info then
		slot0.hero_vo.red_point[HeroConst.RedPointType.eRPLevelUp] = nil

		slot0:updateLevelUpRedPoint()
	end
end

function HeroMainTabTrainPanel.onClickLookBtn(slot0)
	if not slot0.hero_vo then
		return
	end

	uv0:openHeroTipsAttrPanel(true, slot0.hero_vo, true)
end

function HeroMainTabTrainPanel.startTimeTicket(slot0)
	if slot0.time_ticket == nil then
		slot0.time_idnex = 0
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0.is_click_btn = true

			uv0:onClickLevelUpBtn()

			uv0.time_idnex = uv0.time_idnex + 1

			if uv0.time_idnex > 5 then
				uv0.time_idnex = 0

				GlobalEvent:getInstance():Fire(HeroEvent.Hero_Can_Play_Level_UP_Music_Event)
			end
		end, 5 / display.DEFAULT_FPS)
	end
end

function HeroMainTabTrainPanel.clearTimeTicket(slot0)
	if slot0.sequence_action then
		slot0.level_up_btn:stopActionByTag(1)

		slot0.sequence_action = nil
	end

	slot0.is_send_level = false

	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function HeroMainTabTrainPanel.onClickLevelUpBtn(slot0)
	if not slot0.hero_vo then
		return
	end

	if HeroCalculate.getHeroShowLevelStatus(slot0.hero_vo) == 1 then
		if slot0.is_send_level then
			return
		end

		slot0.is_send_level = true
		slot0.is_update_hero_info = false
		slot0.is_update_res_info = false

		uv0:sender11003(slot0.hero_vo.id)
	elseif slot1 == 2 then
		uv0:openHeroBreakPanel(true, slot0.hero_vo)
	end
end

function HeroMainTabTrainPanel.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.limit_lev_max = nil
	slot0.hero_vo = slot1

	slot0:updateInfo(slot1)

	slot0.show_model_type = slot2 or HeroConst.BagTab.eBagHero

	if slot0.show_model_type == HeroConst.BagTab.eBagHero then
		slot0:updateLevelUpRedPoint()
	end

	if slot0.level_up_btn:isVisible() and slot0.hero_vo.isResonateCrystalHero and slot0.hero_vo:isResonateCrystalHero() then
		if slot0.tips == nil then
			slot0.tips = createLabel(20, cc.c3b(217, 80, 20), nil, 576, 350, TI18N("在恶魔果树中无法升级"), slot0.tab_panel, 2, cc.p(0.5, 0.5))
		else
			slot0.tips:setVisible(true)
		end

		setChildUnEnabled(true, slot0.level_up_btn)
		slot0.level_up_label:enableOutline(Config.ColorData.data_color4[2], 2)
		slot0.level_up_btn:setTouchEnabled(false)
	else
		slot0.level_up_btn:setTouchEnabled(true)
		setChildUnEnabled(false, slot0.level_up_btn)
		slot0.level_up_label:enableOutline(Config.ColorData.data_color4[278], 2)

		if slot0.tips then
			slot0.tips:setVisible(false)
		end
	end
end

function HeroMainTabTrainPanel.updateInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = slot1.break_lev
	slot3 = slot1.lev

	if slot1.isResonateCrystalHero and slot1:isResonateCrystalHero() then
		slot3 = slot1.resonate_lev
		slot2 = slot1.resonate_break_lev
	end

	slot0:updateAdvanceInfo(slot1, slot2)

	if not Config.PartnerData.data_partner_brach[getNorKey(slot1.type, slot1.break_id, slot2)] then
		return
	end

	slot7 = Config.PartnerData.data_partner_brach[getNorKey(slot1.type, slot1.break_id, slot2 + 1)]

	if slot0.fuse_btn_label then
		slot0.fuse_btn_label:setVisible(false)
	end

	slot0.limit_lev_max = slot5.lev_max

	if slot7 == nil then
		if Config.PartnerData.data_partner_star(getNorKey(slot1.bid, slot1.star)) and slot8 < slot10.lev_max then
			slot0.limit_lev_max = slot10.lev_max
		end

		if slot8 <= slot3 then
			slot0:showMaxLevelUI(true)
			slot0.level_up_btn:setVisible(false)

			if slot0.fuse_btn_label and uv0:isResonateCystalMaxLev() and uv0:isCanShowLabelMaxLev(slot8) then
				slot0.fuse_btn_label:setVisible(true)
			end
		else
			slot0.level_up_btn:setVisible(true)
			slot0:updateCostInfo(slot1)
		end
	elseif slot7.limit and next(slot7.limit) ~= nil then
		if slot5.lev_max <= slot3 then
			if HeroCalculate.isEnoughCondition(slot7.limit, slot1) then
				slot0:showMaxLevelUI(true)
				slot0.level_up_btn:setVisible(true)
				slot0.level_up_label:setString(TI18N("进阶"))
			else
				slot0:showMaxLevelUI(true)
				slot0.level_up_btn:setVisible(false)
			end
		else
			slot0.level_up_btn:setVisible(true)
			slot0:updateCostInfo(slot1)
		end
	else
		slot0.level_up_btn:setVisible(true)

		if slot5.lev_max <= slot3 then
			slot0:showMaxLevelUI(true)
			slot0.level_up_label:setString(TI18N("进阶"))
		else
			slot0:updateCostInfo(slot1)
		end
	end

	if slot1.isResonateHero and slot1:isResonateHero() then
		slot0.level_up_btn:setVisible(false)
	end

	if slot1.isResonateCrystalHero and slot1:isResonateCrystalHero() then
		if uv0:getCystalPreLevLimit() <= slot1.resonate_lev then
			slot0.level:setString(uv1("<div fontcolor=#00c8b3>%s</div>", slot1.lev))

			if slot0.cystal_max_lev_limit <= slot1.lev then
				slot0.fuse_btn_label:setVisible(false)
			end
		else
			slot0.level:setString(uv1("<div fontcolor=#00c8b3>%s</div>/%s", slot1.lev, slot8))
		end
	else
		slot0.level:setString(uv1("%s/%s", slot1.lev, slot8))
	end

	slot0:updateAttr(slot1)

	slot9 = slot1.type or 4

	loadSpriteTexture(slot0.profession_icon, PathTool.getPartnerTypeIcon(slot9), LOADTEXT_TYPE_PLIST)

	slot11 = HeroConst.CareerName[slot9] or TI18N("无")

	print("-------->", slot11)
	slot0.profession_name:setString(slot11)

	if slot0.introduce_label then
		if slot1.introduce_str and slot1.introduce_str ~= "" then
			slot0.introduce_label:setString(slot1.introduce_str)
		else
			slot0.introduce_label:setString("")
		end
	end

	if slot1.isResonateCrystalHero and slot1:isResonateCrystalHero() then
		slot5 = Config.PartnerData.data_partner_brach[getNorKey(slot1.type, slot1.break_id, slot1.break_lev)]
	end

	slot0:initSkill(slot1, slot5)
end

function HeroMainTabTrainPanel.updateAttr(slot0, slot1)
	if not slot1 then
		return
	end

	for slot5, slot6 in ipairs(slot0.attr_list) do
		if slot0.attr_label_list[slot5] then
			slot0.attr_label_list[slot5]:setString(slot1[slot6] or 0)
		end
	end
end

function HeroMainTabTrainPanel.updateLevelUpRedPoint(slot0)
	if not slot0.hero_vo then
		return
	end

	addRedPointToNodeByStatus(slot0.level_up_btn, HeroCalculate.checkSingleHeroLevelUpRedPoint(slot0.hero_vo), 5, 5)
end

function HeroMainTabTrainPanel.setLevName(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot2 > 1 then
		slot0.level_up_label:setString(uv0(TI18N("升%s级"), slot2))
	else
		slot0.level_up_label:setString(TI18N("升 级"))
	end
end

function HeroMainTabTrainPanel.updateCostInfo(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.limit_lev_max then
		return
	end

	slot2 = slot1.lev or 1

	if slot1.isResonateCrystalHero and slot1:isResonateCrystalHero() then
		slot2 = slot1.resonate_lev or 1
	end

	slot0:showMaxLevelUI(false)

	slot3 = 1

	if slot2 < 60 then
		slot3 = 5
	end

	slot4 = slot2
	slot5 = {}

	function slot6(slot0)
		slot1 = {}
		slot2 = true

		for slot6, slot7 in ipairs(slot0) do
			if uv0[slot7[1]] == nil then
				uv0[slot7[1]] = 0
			end

			slot1[slot7[1]] = uv0[slot7[1]] + slot7[2]

			if (BackpackController:getInstance():getModel():getItemNumByBid(slot7[1]) or 0) < slot1[slot7[1]] then
				slot2 = false
			end
		end

		return slot2, slot1
	end

	for slot10 = 1, slot3 do
		if slot0.limit_lev_max <= slot2 + slot10 - 1 then
			break
		end

		if Config.PartnerData.data_partner_lev[slot11] then
			slot14, slot5 = slot6(slot12.expend or {})

			if slot14 then
				slot4 = slot11
			else
				if slot10 == 1 then
					slot5 = slot15
				end

				break
			end
		end
	end

	slot0:setLevName(slot1, slot4 - slot2 + 1)

	if Config.PartnerData.data_partner_lev[slot2] then
		for slot12, slot13 in ipairs(slot7.expend or {}) do
			slot15 = slot0["item_icon" .. slot12]

			if Config.ItemData.data_get_data(slot13[1]) and slot15 then
				slot16 = PathTool.getItemRes(slot14.icon, false)

				if slot0.record_cost_res[slot12] == nil or slot0.record_cost_res[slot12] ~= slot16 then
					slot0.record_cost_res[slot12] = slot16

					loadSpriteTexture(slot15, slot16, LOADTEXT_TYPE)
					slot15:setScale(0.3)
				end
			end

			if slot0["level_up_cost" .. slot12] then
				slot0["level_up_cost" .. slot12]:setString(slot5[slot13[1]])

				if slot5[slot13[1]] and BackpackController:getInstance():getModel():getItemNumByBid(slot13[1]) < slot5[slot13[1]] then
					slot0["level_up_cost" .. slot12]:setTextColor(cc.c4b(199, 12, 12, 255))
				else
					slot0["level_up_cost" .. slot12]:setTextColor(cc.c4b(71, 44, 30, 255))
				end
			end
		end
	end
end

function HeroMainTabTrainPanel.showMaxLevelUI(slot0, slot1)
	if slot1 then
		if slot0.max_level_img == nil then
			slot0.max_level_img = createImage(slot0.tab_panel, PathTool.getResFrame("hero", "txt_cn_hero_info_16"), 167, 260, cc.p(0.5, 0.5), true)
		else
			slot0.max_level_img:setVisible(true)
		end

		slot0.level_up_bg:setVisible(false)
		slot0.item_icon1:setVisible(false)
		slot0.item_icon2:setVisible(false)
		slot0.level_up_cost1:setString("")
		slot0.level_up_cost2:setString("")
	else
		if slot0.max_level_img then
			slot0.max_level_img:setVisible(false)
		end

		slot0.level_up_bg:setVisible(true)
		slot0.item_icon1:setVisible(true)
		slot0.item_icon2:setVisible(true)
	end
end

function HeroMainTabTrainPanel.updateAdvanceInfo(slot0, slot1, slot2)
	slot3 = uv0:getHeroMaxBreakCountByInitStar(slot1.star)
	slot4 = 35
	slot5 = slot2
	slot6 = 0

	for slot10, slot11 in ipairs(slot0.break_icon_list) do
		slot11:setVisible(false)
	end

	for slot10 = 1, slot3 do
		if slot10 <= slot5 then
			if not slot0.break_icon_list[slot10] then
				slot0.break_icon_list[slot10] = createSprite(PathTool.getResFrame("hero", "hero_info_1"), slot6 + (slot10 - 1) * slot4, 0, slot0.advanced_node, cc.p(0, 0.5), LOADTEXT_TYPE_PLIST, 1)
			else
				slot0.break_icon_list[slot10]:setVisible(true)
			end

			if slot0.break_icon_bg_list[slot10] then
				slot0.break_icon_bg_list[slot10]:setVisible(false)
			end
		else
			if slot0.break_icon_list[slot10] then
				slot0.break_icon_list[slot10]:setVisible(false)
			end

			if not slot0.break_icon_bg_list[slot10] then
				slot0.break_icon_bg_list[slot10] = createSprite(PathTool.getResFrame("hero", "hero_info_2"), slot6 + (slot10 - 1) * slot4, 0, slot0.advanced_node, cc.p(0, 0.5), LOADTEXT_TYPE_PLIST, 0)
			else
				slot0.break_icon_bg_list[slot10]:setVisible(true)
			end
		end
	end
end

function HeroMainTabTrainPanel.initSkill(slot0, slot1, slot2)
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

	slot0.skill_container:setInnerContainerSize(slot13(math.max(slot0.skill_container_size.width, (slot0.skill_width + 28) * #slot6), slot0.skill_container_size.height))

	for slot13, slot14 in ipairs(slot0.skill_item_list) do
		slot14:setVisible(false)
	end

	slot10 = 0
	slot10 = slot0.skill_container_size.width < slot8 and 0 or (slot0.skill_container_size.width - slot8) * 0.5

	for slot14, slot15 in ipairs(slot6) do
		if Config.SkillData.data_get_skill(slot15[2]) then
			slot17 = false

			if slot2.skill_num < slot15[1] then
				print("是否锁住：" .. slot15[1])

				slot17 = true
			end

			if slot0.skill_item_list[slot14] == nil then
				slot0.skill_item_list[slot14] = {}
				slot0.skill_item_list[slot14] = SkillItem.new(true, true, true, 0.8, true)

				slot0.skill_container:addChild(slot0.skill_item_list[slot14])
			end

			slot0.skill_item_list[slot14]:setData(slot16)
			slot0.skill_item_list[slot14]:showUnEnabled(slot17)
			slot0.skill_item_list[slot14]:setVisible(true)
			slot0.skill_item_list[slot14]:setPosition(slot10 + slot7 * (slot14 - 1) + slot7 * 0.5, slot0.skill_width / 2 + 6)
		else
			print(uv1("技能表id: %s 没发现", tostring(slot15.skill_bid)))
		end
	end
end

function HeroMainTabTrainPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function HeroMainTabTrainPanel.DeleteMe(slot0)
	if slot0.hero_data_update_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_data_update_event)

		slot0.hero_data_update_event = nil
	end

	if slot0.hero_detail_data_update_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_detail_data_update_event)

		slot0.hero_detail_data_update_event = nil
	end

	if slot0.hero_equip_update_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_equip_update_event)

		slot0.hero_equip_update_event = nil
	end

	if slot0.hero_artifact_update_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_artifact_update_event)

		slot0.hero_artifact_update_event = nil
	end

	if slot0.hero_level_redpoint_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_level_redpoint_event)

		slot0.hero_level_redpoint_event = nil
	end

	slot0:clearTimeTicket()

	if slot0.modify_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.modify_goods_event)

		slot0.modify_goods_event = nil
	end

	if slot0.add_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.add_goods_event)

		slot0.add_goods_event = nil
	end

	if slot0.del_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.del_goods_event)

		slot0.del_goods_event = nil
	end

	if slot0.update_soulWeapon_status then
		GlobalEvent:getInstance():UnBind(slot0.update_soulWeapon_status)

		slot0.update_soulWeapon_status = nil
	end

	if uv0 and slot0.role_lev_event then
		uv0:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end
end
