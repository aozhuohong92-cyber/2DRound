HeroMainTabHolyequipmentPanel = class("HeroMainTabHolyequipmentPanel", function ()
	return ccui.Widget:create()
end)
slot0 = string.format
slot2 = HeroController:getInstance():getModel()
slot3 = table.insert
slot4 = RoleController:getInstance():getRoleVo()
slot5 = math.floor

function HeroMainTabHolyequipmentPanel.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function HeroMainTabHolyequipmentPanel.config(slot0)
	slot0.equip_item_list = {}
	slot0.equip_type_list = HeroConst.HolyequipmentPosList
	slot0.equip_icon_name_list = {
		[BackPackConst.item_type.GOD_EARRING] = "hero_info_25",
		[BackPackConst.item_type.GOD_RING] = "hero_info_27",
		[BackPackConst.item_type.GOD_NECKLACE] = "hero_info_26",
		[BackPackConst.item_type.GOD_BANGLE] = "hero_info_28"
	}
	slot0.equip_name_suffix = {
		[BackPackConst.item_type.GOD_EARRING] = 1,
		[BackPackConst.item_type.GOD_NECKLACE] = 2,
		[BackPackConst.item_type.GOD_RING] = 3,
		[BackPackConst.item_type.GOD_BANGLE] = 4
	}
	slot0.border_item_load = {}
	slot0.suit_item_load = {}
	slot0.border_item_sprite = {}
	slot0.suit_item_sprite = {}
	slot0.border_record_res = {}
	slot0.suit_record_res = {}
	slot0.effect_item_list = {}
	slot0.record_effect_id = {}
end

function HeroMainTabHolyequipmentPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_main_tab_holyequipment_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot5 = "tab_panel"
	slot0.tab_panel = slot0.root_wnd:getChildByName(slot5)
	slot0.equip_node_list = {}

	for slot5 = 1, 4 do
		slot6 = slot0.equip_type_list[slot5] or slot5
		slot0.equip_node_list[slot5] = slot0.tab_panel:getChildByName("equip_node" .. slot5)
		slot7 = BackPackItem.new(false, true, nil, 0.9, false)

		slot7:setName("guidehloye_equip_item_" .. slot5)
		slot0.equip_node_list[slot5]:addChild(slot7, 1)
		slot7:setPosition(cc.p(0, 0))
		slot7:addCallBack(function ()
			uv0:selectEquipByIndex(uv1)
		end)

		slot7.empty_icon = createImage(slot7:getRoot(), PathTool.getResFrame("hero", slot0.equip_icon_name_list[slot6]), 60, 60, cc.p(0.5, 0.5), true, 10, false)
		slot0.equip_item_list[slot6] = slot7
		slot0.border_item_sprite[slot5] = slot0.tab_panel:getChildByName("border_" .. slot5)
		slot0.suit_item_sprite[slot5] = slot0.tab_panel:getChildByName("item_icon_" .. slot5)
	end

	slot0.look_btn = slot0.tab_panel:getChildByName("look_btn")
	slot0.tips_lab = createRichLabel(22, cc.c4b(98, 50, 35, 255), cc.p(0.5, 0.5), cc.p(slot0.look_btn:getContentSize().width * 0.5, slot0.look_btn:getContentSize().height * 0.5), 10, nil, 100)

	slot0.look_btn:addChild(slot0.tips_lab)
	slot0.tips_lab:setString(TI18N("<div  href=detial>规则说明</div>"))

	slot0.holy_equip_bg = slot0.tab_panel:getChildByName("holy_equip_bg")

	if slot0.holy_equip_bg then
		slot0.item_load = loadSpriteTextureFromCDN(slot0.holy_equip_bg, PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_holy_equip_bg", false), ResourcesType.single, slot0.item_load)
	end

	slot0.tips = slot0.tab_panel:getChildByName("tips")

	slot0.tips:setString(TI18N(""))

	slot0.plan_btn = slot0.tab_panel:getChildByName("plan_btn")
	slot0.dungeon_btn = slot0.tab_panel:getChildByName("dungeon_btn")

	slot0.dungeon_btn:setName("guide_dungeon_btn")

	slot0.preview_btn = slot0.tab_panel:getChildByName("preview_btn")
	slot0.suit_btn = slot0.tab_panel:getChildByName("suit_btn")
	slot0.suit_shop_btn = slot0.tab_panel:getChildByName("suit_shop_btn")
	slot0.dungeon_btn_2 = slot0.tab_panel:getChildByName("dungeon_btn_2")
end

function HeroMainTabHolyequipmentPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.look_btn, function (slot0, slot1, slot2)
		if Config.PartnerHolyEqmData.data_const.game_rule_1 then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end, true, 1)
	registerButtonEventListener(slot0.plan_btn, function (slot0, slot1, slot2)
		if not uv0.hero_vo then
			return
		end

		if not uv1:isOpenHolyEquipMentByHerovo(uv0.hero_vo) then
			message(TI18N("因版本调整，当前该英雄尚未达到穿戴或更换神装条件，请努力提升至9星~"))

			return
		end

		uv2:openHolyequipmentPlanPanel(true, uv0.hero_vo)
	end, true, 1)
	registerButtonEventListener(slot0.dungeon_btn, function (slot0, slot1, slot2)
		HeavenController:getInstance():openHeavenMainWindow(true, nil, HeavenConst.Tab_Index.DialRecord)
	end, true, 1)
	registerButtonEventListener(slot0.preview_btn, function (slot0, slot1, slot2)
		if not uv0.hero_vo then
			return
		end

		if next(uv1:getHeroHolyEquipList(uv0.hero_vo.partner_id)) == nil then
			message(TI18N("暂无穿戴神装"))

			return
		end

		uv2:sender11086(uv0.hero_vo.partner_id, uv0:getSuitData())
	end, true, 1)
	registerButtonEventListener(slot0.suit_btn, function (slot0, slot1, slot2)
		HeroController:getInstance():openHeroClothesLustratWindow(true)
	end, true, 1)
	registerButtonEventListener(slot0.suit_shop_btn, function (slot0, slot1, slot2)
		SuitShopController:getInstance():openSuitShopMainView(true)
	end, true, 1)
	registerButtonEventListener(slot0.dungeon_btn_2, function (slot0, slot1, slot2)
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.heavenwar)
	end, true, 1)

	if not slot0.hero_get_holy_equipment_event then
		slot0.hero_get_holy_equipment_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Get_Holy_Equipment_Event, function (slot0)
			if not slot0 then
				return
			end

			if not uv0.hero_vo then
				return
			end

			for slot4, slot5 in ipairs(slot0) do
				if slot5.partner_id == uv0.hero_vo.partner_id then
					uv0:updateInfo(uv0.hero_vo)
				end
			end
		end)
	end

	if slot0.hero_holy_equipment_update_event == nil then
		slot0.hero_holy_equipment_update_event = GlobalEvent:getInstance():Bind(HeroEvent.Holy_Equipment_Update_Event, function (slot0)
			if not slot0 or not uv0.hero_vo then
				return
			end

			if slot0.partner_id == uv0.hero_vo.partner_id then
				uv0:updateInfo(uv0.hero_vo)
			end
		end)
	end
end

function HeroMainTabHolyequipmentPanel.getSuitData(slot0)
	if not slot0.hero_vo then
		return
	end

	slot2 = {}

	for slot6, slot7 in pairs(uv0:getHeroHolyEquipList(slot0.hero_vo.partner_id)) do
		if slot2[slot7.config.eqm_set] == nil then
			slot2[slot7.config.eqm_set] = 1
		else
			slot2[slot7.config.eqm_set] = slot2[slot7.config.eqm_set] + 1
		end
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot2) do
		if Config.PartnerHolyEqmData.data_suit_info[slot7] then
			for slot13, slot14 in ipairs(slot9) do
				if slot14.skill_id and next(slot14.skill_id) ~= nil and slot14.num <= slot8 and type(slot14.skill_id[#slot14.skill_id]) == "number" then
					if slot17[1] and slot17[1] == 2 then
						-- Nothing
					end

					uv1(slot3, {
						num = slot14.num,
						skill_id = 0,
						skill_desc = slot14.all_skill_desc[#slot14.all_skill_desc][2] or TI18N("描述信息无"),
						skill_id = slot15
					})
				end
			end
		end
	end

	return slot3
end

function HeroMainTabHolyequipmentPanel.selectEquipByIndex(slot0, slot1)
	if not slot0.hero_vo then
		return
	end

	if uv0:getHeroHolyEquipList(slot0.hero_vo.partner_id)[slot1] ~= nil then
		uv1:openEquipTips(true, slot4, PartnerConst.EqmTips.partner, slot0.hero_vo)
	else
		if not uv0:isOpenHolyEquipMentByHerovo(slot0.hero_vo) then
			message(TI18N("因版本调整，当前该英雄尚未达到穿戴或更换神装条件，请努力提升至9星~"))

			return
		end

		uv1:openHeroHolyEquipClothPanel(true, slot2, slot0.hero_vo.partner_id, nil, nil, nil, slot0.hero_vo)
	end
end

function HeroMainTabHolyequipmentPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.hero_vo = slot1

	if slot0.hero_vo:ishaveHolyEquipmentData() then
		slot0:updateInfo(slot1)
	end
end

function HeroMainTabHolyequipmentPanel.updateRedPoint(slot0)
	if not uv0:isOpenHolyEquipMentByHerovo(slot0.hero_vo) then
		return
	end

	for slot6, slot7 in ipairs(slot0.equip_type_list) do
		if slot0.equip_item_list[slot7] then
			if uv0:getHeroHolyEquipList(slot0.hero_vo.partner_id)[slot7] == nil then
				slot8:showRedPoint(HeroCalculate.checkHolyEquipmentByEquipType(slot7))
			else
				slot8:showRedPoint(false)
			end
		end
	end
end

function HeroMainTabHolyequipmentPanel.updateInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = {}

	for slot7, slot8 in pairs(uv0:getHeroHolyEquipList(slot1.partner_id)) do
		if slot3[uv1(slot8.config.eqm_set / 100)] == nil then
			slot3[slot9] = 1
		else
			slot3[slot9] = slot3[slot9] + 1
		end
	end

	slot4 = Config.PartnerHolyEqmData.data_base_info
	slot0.first_effect_set = nil

	for slot8, slot9 in ipairs(slot0.equip_type_list) do
		slot11 = slot0.equip_item_list[slot9]

		if slot2[slot9] then
			slot11:setData(slot10)

			if slot11.empty_icon then
				slot11.empty_icon:setVisible(false)
			end

			slot11.equip_vo = slot10

			if slot4(slot10.config.id) then
				slot11:setGoodsName(slot12.show_name, nil, 20, cc.c3b(255, 240, 217), cc.c3b(67, 50, 29))
			end

			slot0:updateCenterUI(true, slot9, slot10, slot3)
		else
			slot11:setData()

			if slot11.empty_icon then
				slot11.empty_icon:setVisible(true)
			end

			slot11:setGoodsName("")

			slot11.equip_vo = nil

			slot0:updateCenterUI(false, slot9)
		end
	end

	slot0:updateRedPoint()
end

function HeroMainTabHolyequipmentPanel.updateCenterUI(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.equip_name_suffix[slot2]

	if slot1 then
		if slot0.suit_item_sprite[slot5] then
			if not slot3 or not slot3.config then
				return
			end

			if not Config.PartnerHolyEqmData.data_suit_res_prefix_fun(math.floor(slot3.config.eqm_set / 100)) then
				return
			end

			slot8 = uv0("%s_%s", slot7.prefix, slot5)

			slot0.suit_item_sprite[slot5]:setVisible(true)

			if slot0.suit_record_res[slot5] == nil or slot0.suit_record_res[slot5] ~= slot8 then
				slot0.suit_record_res[slot5] = slot8
				slot0.suit_item_load[slot5] = loadSpriteTextureFromCDN(slot0.suit_item_sprite[slot5], PathTool.getPlistImgForDownLoad("hero/holy_eqm", slot8, false), ResourcesType.single, slot0.suit_item_load[slot5])
			end
		end

		if slot0.border_item_sprite[slot5] then
			if not slot3 or not slot3.config then
				return
			end

			slot6 = uv0("border_%s_%s", slot3.config.eqm_star, slot5)

			slot0.border_item_sprite[slot5]:setVisible(true)

			if slot0.border_record_res[slot5] == nil or slot0.border_record_res[slot5] ~= slot6 then
				slot0.border_record_res[slot5] = slot6
				slot0.border_item_load[slot5] = loadSpriteTextureFromCDN(slot0.border_item_sprite[slot5], PathTool.getPlistImgForDownLoad("hero/holy_eqm", slot6, false), ResourcesType.single, slot0.border_item_load[slot5])
			end
		end

		if slot4 then
			if slot4[uv1(slot3.config.eqm_set / 100)] >= 4 then
				slot0:showEffectByIndex(true, slot2, 3)
			elseif slot4[slot6] >= 2 then
				if slot0.first_effect_set ~= nil and slot0.first_effect_set ~= slot6 then
					slot0:showEffectByIndex(true, slot2, 2)
				else
					slot0.first_effect_set = slot6

					slot0:showEffectByIndex(true, slot2, 1)
				end
			else
				slot0:showEffectByIndex(false, slot2)
			end
		end
	else
		if slot0.suit_item_sprite[slot5] then
			slot0.suit_item_sprite[slot5]:setVisible(false)
		end

		if slot0.border_item_sprite[slot5] then
			slot0.border_item_sprite[slot5]:setVisible(false)
		end

		slot0:showEffectByIndex(false, slot2)
	end
end

function HeroMainTabHolyequipmentPanel.showEffectByIndex(slot0, slot1, slot2, slot3)
	if slot1 then
		if slot0.record_effect_id[slot2] == nil or slot0.record_effect_id[slot2] ~= slot3 then
			slot0.record_effect_id[slot2] = slot3

			slot0:showEffectByIndex(false, slot2)

			slot0.effect_item_list[slot2] = createEffectSpine("E2442" .. slot3, cc.p(340, 196), cc.p(0.5, 0.5), true, PlayerAction.action)

			if slot2 == BackPackConst.item_type.GOD_NECKLACE then
				slot0.effect_item_list[slot2]:setScale(-0.9, 0.9)
			elseif slot2 == BackPackConst.item_type.GOD_RING then
				slot0.effect_item_list[slot2]:setScale(0.9, -0.9)
			elseif slot2 == BackPackConst.item_type.GOD_BANGLE then
				slot0.effect_item_list[slot2]:setScale(-0.9, -0.9)
			else
				slot0.effect_item_list[slot2]:setScale(0.9, 0.9)
			end

			slot0.tab_panel:addChild(slot0.effect_item_list[slot2], 10)
		end
	elseif slot0.effect_item_list[slot2] then
		slot0.effect_item_list[slot2]:clearTracks()
		slot0.effect_item_list[slot2]:removeFromParent()

		slot0.effect_item_list[slot2] = nil
		slot0.record_effect_id[slot2] = nil
	end
end

function HeroMainTabHolyequipmentPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function HeroMainTabHolyequipmentPanel.DeleteMe(slot0)
	if slot0.hero_get_holy_equipment_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_get_holy_equipment_event)

		slot0.hero_get_holy_equipment_event = nil
	end

	if slot0.hero_holy_equipment_update_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_holy_equipment_update_event)

		slot0.hero_holy_equipment_update_event = nil
	end

	if slot0.hero_data_update_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_data_update_event)

		slot0.hero_data_update_event = nil
	end

	if slot0.hero_equip_update_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_equip_update_event)

		slot0.hero_equip_update_event = nil
	end

	if slot0.hero_equip_redpoint_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_equip_redpoint_event)

		slot0.hero_equip_redpoint_event = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.suit_item_load then
		for slot4, slot5 in pairs(slot0.suit_item_load) do
			slot5:DeleteMe()
		end

		slot0.suit_item_load = nil
	end

	if slot0.border_item_load then
		for slot4, slot5 in pairs(slot0.border_item_load) do
			slot5:DeleteMe()
		end

		slot0.border_item_load = nil
	end

	for slot4, slot5 in ipairs(slot0.equip_type_list) do
		slot0:showEffectByIndex(false, slot5)
	end
end
