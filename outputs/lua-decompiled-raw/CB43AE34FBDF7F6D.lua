HeroUpgradeStarFusePanel = class("HeroUpgradeStarFusePanel", function ()
	return ccui.Widget:create()
end)
slot1 = HeroController:getInstance():getModel()
slot2 = table.sort
slot3 = table.insert
slot4 = string.format
slot5 = Config.PartnerData.data_partner_base

function HeroUpgradeStarFusePanel.ctor(slot0, slot1)
	slot0.hero_vo = slot1 or nil
	slot0.star_list = {}
	slot0.star_list2 = {}
	slot0.star10 = nil
	slot0.star_label = nil
	slot0.dic_fuse_info = nil
	slot0.hero_item_data_list = nil
	slot0.camp_y = {
		[HeroConst.CampType.eWater] = 766,
		[HeroConst.CampType.eFire] = 739,
		[HeroConst.CampType.eWind] = 540,
		[HeroConst.CampType.eLight] = 798,
		[HeroConst.CampType.eDark] = 497,
		[HeroConst.CampType.eLegend] = 497
	}
	slot0.camp_btn_redpoint_list = nil

	slot0:loadResources()
end

function HeroUpgradeStarFusePanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_reset_bg", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3", false),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:configUI()
		uv0:register_event()
		uv0:openRootWnd()
	end)
end

function HeroUpgradeStarFusePanel.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_upgrade_star_fuse_window"))

	slot0:addChild(slot0.root_wnd)

	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.hero_camp_bg = slot0.main_panel:getChildByName("hero_camp_bg")
	slot0.no_vedio_image = slot0.main_panel:getChildByName("no_vedio_image")
	slot0.no_vedio_label = slot0.main_panel:getChildByName("no_vedio_label")

	slot0.no_vedio_label:setString(TI18N("暂无此类型英雄"))

	slot0.explain_btn = slot0.main_panel:getChildByName("explain_btn")
	slot0.look_btn = slot0.main_panel:getChildByName("look_btn")
	slot2 = slot0.main_panel:getChildByName("lay_hero")
	slot0.star_node = slot2:getChildByName("star_node")
	slot0.mode_node = slot2:getChildByName("mode_node")
	slot0.camp_icon = slot2:getChildByName("camp_icon")
	slot0.hero_name = slot2:getChildByName("name")
	slot3 = slot0.main_panel:getChildByName("camp_node")
	slot0.camp_btn_list = {}
	slot0.camp_btn_redpoint_list = {}
	slot0.camp_btn_list[0] = slot3:getChildByName("camp_btn0")
	slot0.camp_btn_list[HeroConst.CampType.eWater] = slot3:getChildByName("camp_btn1")
	slot0.camp_btn_list[HeroConst.CampType.eFire] = slot3:getChildByName("camp_btn2")
	slot0.camp_btn_list[HeroConst.CampType.eWind] = slot3:getChildByName("camp_btn3")
	slot0.camp_btn_list[HeroConst.CampType.eLight] = slot3:getChildByName("camp_btn4")
	slot0.camp_btn_list[HeroConst.CampType.eDark] = slot3:getChildByName("camp_btn5")
	slot0.camp_btn_list[HeroConst.CampType.eLegend] = slot3:getChildByName("camp_btn7")
	slot0.legend_spine = createEffectSpine("E80182", cc.p(29, 29), cc.p(0.5, 0.5), true, "action")

	slot0.camp_btn_list[HeroConst.CampType.eLegend]:addChild(slot0.legend_spine)

	slot0.img_select = slot3:getChildByName("img_select")
	slot4, slot5 = slot0.camp_btn_list[0]:getPosition()

	slot0.img_select:setPosition(slot4 - 0.5, slot5 + 1)

	slot0.synthesis_btn = slot0.main_panel:getChildByName("synthesis_btn")
	slot9 = "centre_hero_node"
	slot0.centre_hero_node = slot0.main_panel:getChildByName(slot9)
	slot0.hero_item_list = {}
	slot0.hero_comp_name = {}

	for slot9 = 1, 4 do
		slot0.hero_comp_name[slot9] = createRichLabel(22, cc.c4b(255, 237, 214, 255), cc.p(0.5, 0.5), cc.p(0, 0), nil, , 150)

		slot0.centre_hero_node:addChild(slot0.hero_comp_name[slot9])
		slot0.hero_comp_name[slot9]:setString("")

		if slot9 == 1 then
			slot0.hero_item_list[slot9] = HeroExhibitionItem.new(1, true)

			slot0.hero_item_list[slot9]:setPosition(0, 0)
			slot0.hero_comp_name[slot9]:setPosition(0, -78)
		else
			slot0.hero_item_list[slot9] = HeroExhibitionItem.new(0.8, true)

			slot0.hero_item_list[slot9]:setPosition(20 + (slot9 - 1) * 120, -16)
			slot0.hero_comp_name[slot9]:setPosition(20 + (slot9 - 1) * 120, -78)
		end

		slot0.hero_item_list[slot9]:addCallBack(function ()
			uv0:_onClickHeroItem(uv1)
		end)
		slot0.centre_hero_node:addChild(slot0.hero_item_list[slot9])
	end

	slot6 = slot0.main_panel:getChildByName("attr_node")
	slot0.level_label = slot6:getChildByName("level_label")
	slot0.attr_icon_list = {
		slot6:getChildByName("attr_icon1"),
		slot6:getChildByName("attr_icon2"),
		slot6:getChildByName("attr_icon3"),
		slot6:getChildByName("attr_icon4")
	}
	slot0.attr_label_list = {
		slot6:getChildByName("attr_label1"),
		slot6:getChildByName("attr_label2"),
		slot6:getChildByName("attr_label3")
	}
	slot10 = slot6
	slot11 = "attr_label4"
	slot0.attr_label_list[4] = slot6.getChildByName(slot10, slot11)
	slot0.attr_list = {
		"atk",
		"hp",
		"def",
		"speed"
	}

	for slot10, slot11 in ipairs(slot0.attr_list) do
		if slot0.attr_icon_list[slot10] then
			loadSpriteTexture(slot0.attr_icon_list[slot10], PathTool.getResFrame("common", PathTool.getAttrIconByStr(slot11)), LOADTEXT_TYPE_PLIST)
		end
	end

	slot0.lay_scrollview = slot0.main_panel:getChildByName("lay_scrollview")

	slot0:adaptationScreen()
end

function HeroUpgradeStarFusePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function HeroUpgradeStarFusePanel.adaptationScreen(slot0)
end

function HeroUpgradeStarFusePanel.register_event(slot0)
	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.PartnerData.data_partner_const.game_rule2.desc, slot1:getTouchBeganPosition())
	end, true, 2, nil, 0.8)
	registerButtonEventListener(slot0.look_btn, function ()
		uv0:_onClickBtnLook()
	end, true, 2, nil, 0.8)

	function slot4()
		uv0:_onClickBtnSynthesis()
	end

	slot5 = true

	registerButtonEventListener(slot0.synthesis_btn, slot4, slot5, 2)

	for slot4, slot5 in pairs(slot0.camp_btn_list) do
		registerButtonEventListener(slot5, function ()
			uv0:_onClickBtnShowByIndex(uv1)
		end, true, 2)
	end

	if not slot0.star_select_event then
		slot0.star_select_event = GlobalEvent:getInstance():Bind(HeroEvent.Upgrade_Star_Select_Event, function ()
			uv0:updateHeroItemInfo()
		end)
	end

	if not slot0.hero_data_add then
		slot0.hero_data_add = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Data_Add, function ()
			uv0:checkUpdateCurrentInfo(true)
		end)
	end

	if not slot0.hero_data_update then
		slot0.hero_data_update = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Data_Update, function ()
			if not uv0.fuse_data then
				return
			end

			uv0.is_hero_data_update = true

			uv0:checkUpdateCurrentInfo()
		end)
	end

	if not slot0.del_hero_event then
		slot0.del_hero_event = GlobalEvent:getInstance():Bind(HeroEvent.Del_Hero_Event, function ()
			if not uv0.fuse_data then
				return
			end

			uv0.is_del_hero_event = true

			uv0:checkUpdateCurrentInfo()
		end)
	end
end

function HeroUpgradeStarFusePanel.checkUpdateCurrentInfo(slot0, slot1)
	if slot0.is_hero_data_update and slot0.is_del_hero_event or slot1 then
		slot0:initCentreHeroItemDataByConfig(slot0.fuse_data.star_config)
		slot0:updateCampRedpoint()
		slot0:updateHeroList(slot0.select_camp, true)
	end
end

function HeroUpgradeStarFusePanel._onClickBtnLook(slot0)
	if not slot0.show_hero_vo then
		return
	end

	uv0:openHeroTipsPanel(true, slot0.show_hero_vo, {
		is_hide_equip = true
	})
end

function HeroUpgradeStarFusePanel._onClickBtnSynthesis(slot0)
	slot1 = nil
	slot2 = {}
	slot3 = {}
	slot4 = {}

	for slot8, slot9 in ipairs(slot0.hero_item_data_list) do
		for slot14, slot15 in pairs(slot9.dic_select_list) do
			slot10 = 0 + 1
		end

		if slot10 < slot9.count then
			message(TI18N("所需材料不足"))

			return
		end

		if slot8 == 1 then
			for slot14, slot15 in pairs(slot9.dic_select_list) do
				slot1 = slot14
			end
		else
			for slot14, slot15 in pairs(slot9.dic_select_list) do
				if slot15.is_hero_hun then
					if slot15.good_vo then
						if slot4[slot15.good_vo.base_id] == nil then
							slot4[slot15.good_vo.base_id] = 1
						else
							slot4[slot15.good_vo.base_id] = slot4[slot15.good_vo.base_id] + 1
						end
					end
				elseif slot9.bid == 0 then
					uv0(slot3, {
						partner_id = slot14
					})
				else
					uv0(slot2, slot16)
				end
			end
		end
	end

	slot0.is_hero_data_update = false
	slot0.is_del_hero_event = false
	slot5 = {}

	for slot9, slot10 in pairs(slot4) do
		uv0(slot5, {
			item_id = slot9,
			num = slot10
		})
	end

	uv1:sender11005(slot1, slot2, slot3, slot5)
end

function HeroUpgradeStarFusePanel._onClickBtnShowByIndex(slot0, slot1)
	if slot0.img_select and slot0.camp_btn_list[slot1] then
		slot2, slot3 = slot0.camp_btn_list[slot1]:getPosition()

		slot0.img_select:setPosition(slot2 - 0.5, slot3 + 1)
	end

	slot0:updateHeroList(slot1)
	slot0:updateCampRedpoint()
end

function HeroUpgradeStarFusePanel._onClickHeroItem(slot0, slot1)
	if not slot0.hero_item_data_list[slot1] then
		return
	end

	slot0.hero_item_data_list[slot1].is_select = true
	slot2 = {}

	for slot6, slot7 in ipairs(slot0.hero_item_data_list) do
		if slot6 ~= slot1 then
			for slot11, slot12 in pairs(slot7.dic_select_list) do
				slot2[slot11] = slot12
			end
		end
	end

	if slot0.hero_item_data_list[slot1].bid == 0 and slot0.hero_item_data_list[slot1].star == 5 and slot0.fuse_data then
		-- Nothing
	end

	uv0:openHeroUpgradeStarSelectPanel(true, slot0.hero_item_data_list[slot1], slot2, HeroConst.SelectHeroType.eStarFuse, {
		is_master = slot1 == 1,
		self_mark_bid = slot0.fuse_data.bid
	})
end

function HeroUpgradeStarFusePanel.updateHeroItemInfo(slot0)
	slot0.dic_other_selected = {}

	for slot4, slot5 in ipairs(slot0.hero_item_data_list) do
		if slot5.is_select then
			slot5.is_select = false

			for slot10, slot11 in pairs(slot5.dic_select_list) do
				slot6 = 0 + 1
				slot0.dic_other_selected[slot10] = slot11
			end

			slot5.lev = uv0("%s/%s", slot6, slot5.count)

			if slot0.hero_item_list[slot4] then
				slot0.hero_item_list[slot4].num_label:setString(slot5.lev)

				if slot6 > 0 then
					slot0.hero_item_list[slot4]:setHeadUnEnabled(false)
				else
					slot0.hero_item_list[slot4]:setHeadUnEnabled(true)
				end
			end
		else
			for slot9, slot10 in pairs(slot5.dic_select_list) do
				slot0.dic_other_selected[slot9] = slot10
			end
		end
	end

	slot0:updateCentreHeroItemRedPoint()
end

function HeroUpgradeStarFusePanel.openRootWnd(slot0)
	slot0:initHeroVoInfo()
	slot0:_onClickBtnShowByIndex(0)

	if uv0.getIsFuseRedPoint and uv0:getIsFuseRedPoint() then
		uv1:sender11055(0)
	end

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.guild, false)
end

function HeroUpgradeStarFusePanel.initHeroVoInfo(slot0)
	if slot0.dic_fuse_info then
		return
	end

	slot0.dic_fuse_info = uv0:getStarFuseList() or {}
end

function HeroUpgradeStarFusePanel.updateCampRedpoint(slot0)
	for slot5, slot6 in pairs(slot0.camp_btn_list) do
		if slot5 == (slot0.select_camp or 0) then
			addRedPointToNodeByStatus(slot6, false)
		else
			addRedPointToNodeByStatus(slot6, HeroCalculate.checkCampStarFuseRedpoint(slot0.dic_fuse_info[slot5]))
		end
	end
end

function HeroUpgradeStarFusePanel.updateHeadHeroInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.fuse_data = slot1

	if slot0.record_bg_res ~= PathTool.getPlistImgForDownLoad("bigbg/hero", HeroConst.CampBgRes[slot1.camp_type or HeroConst.CampType.eWater], true) then
		slot0.record_bg_res = slot3
		slot0.item_load = loadImageTextureFromCDN(slot0.background, slot3, ResourcesType.single, slot0.item_load)
	end

	if slot0.record_camp_res ~= PathTool.getPlistImgForDownLoad("bigbg/hero", HeroConst.CampBottomBgRes[slot2], false) then
		slot0.record_camp_res = slot4
		slot0.item_load_camp = loadSpriteTextureFromCDN(slot0.hero_camp_bg, slot4, ResourcesType.single, slot0.item_load_camp)
	end

	slot0.hero_camp_bg:setPositionY(slot0.camp_y[slot2] or 646)

	if slot0.record_camp_type == nil or slot0.record_camp_type ~= slot1.camp_type then
		slot0.record_camp_type = slot1.camp_type

		loadSpriteTexture(slot0.camp_icon, PathTool.getHeroCampTypeIcon(slot1.camp_type), LOADTEXT_TYPE_PLIST)
	end

	if slot1.base_config then
		slot0.hero_name:setString(slot1.base_config.name)
	end

	slot0:createStar(slot1.star)
	slot0:updateSpine(slot1)

	slot0.show_hero_vo = uv0:getHeroPokedexByBid(getNorKey(slot1.bid, slot1.star))

	if slot0.show_hero_vo then
		slot10 = uv1

		slot0.level_label:setString(slot10(TI18N("等级:%s"), slot0.show_hero_vo.lev))

		for slot10, slot11 in ipairs(slot0.attr_list) do
			if slot0.attr_label_list[slot10] then
				slot0.attr_label_list[slot10]:setString(slot0.show_hero_vo[slot11] or 0)
			end
		end
	end

	slot0:initCentreHeroItemDataByConfig(slot1.star_config)
end

function HeroUpgradeStarFusePanel.initCentreHeroItemDataByConfig(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.hero_item_data_list = {}
	slot0.dic_other_selected = {}
	slot2 = 1
	slot4 = {
		[slot2] = {}
	}

	if slot1.expend1[1] then
		slot0.hero_item_data_list[slot2] = slot0:getHeroData(slot3[1], slot3[2], slot3[3])
		slot4[slot2][slot3[1]] = {
			[slot3[2]] = slot3[3]
		}
	end

	slot2 = slot2 + 1

	for slot8, slot9 in ipairs(slot1.expend2) do
		slot0.hero_item_data_list[slot2] = slot0:getHeroData(slot9[1], slot9[2], slot9[3])
		slot4[slot2] = {
			[slot9[1]] = {}
		}
		slot4[slot2][slot9[1]][slot9[2]] = slot9[3]
		slot2 = slot2 + 1
	end

	if slot2 <= 4 then
		for slot8, slot9 in ipairs(slot1.expend3) do
			slot0.hero_item_data_list[slot2] = slot0:getHeroData(nil, slot9[2], slot9[3], slot9[1])
			slot4[slot2] = {
				[slot9[1]] = {}
			}
			slot4[slot2][slot9[1]][slot9[2]] = slot9[3]

			if slot2 + 1 > 4 then
				break
			end
		end
	end

	for slot8, slot9 in ipairs(slot0.hero_item_list) do
		if slot0.hero_item_data_list[slot8] then
			slot9:setVisible(true)

			slot11 = ""

			if slot10.bid == 0 then
				slot9:setData(slot10)
				slot9:setDefaultHead(uv0:getRandomHeroHeadByQuality(slot10.star))

				slot11 = uv1(TI18N("<div outline=2,#000000 >%d星英雄</div>"), slot10.star)
			else
				slot11 = uv1(TI18N("<div outline=2,#000000 >%s</div>"), uv2[slot10.bid].name)

				slot9:setData(slot10)
			end

			if slot0.hero_comp_name[slot8] then
				slot0.hero_comp_name[slot8]:setString(slot11)
			end

			slot9:setHeadUnEnabled(true)
		else
			slot9:setVisible(false)
		end
	end

	slot0:initHeroListByMatchInfo(slot4)
	slot0:updateCentreHeroItemRedPoint()
end

function HeroUpgradeStarFusePanel.initHeroListByMatchInfo(slot0, slot1)
	slot0.conditions_hero_list = {}

	for slot6, slot7 in pairs(uv0:getHeroList()) do
		for slot11, slot12 in ipairs(slot1) do
			if slot0.conditions_hero_list[slot11] == nil then
				slot0.conditions_hero_list[slot11] = {}
			end

			if slot0.hero_item_data_list[slot11].bid == 0 then
				if slot12[0] then
					if slot12[0][slot7.star] then
						uv1(slot0.conditions_hero_list[slot11], slot7)
					end
				elseif slot12[slot7.camp_type] and slot12[slot7.camp_type][slot7.star] ~= nil then
					uv1(slot0.conditions_hero_list[slot11], slot7)
				end
			elseif slot12[slot7.bid] and slot12[slot7.bid][slot7.star] then
				uv1(slot0.conditions_hero_list[slot11], slot7)
			end
		end
	end

	slot0.dic_other_selected = {}

	for slot6, slot7 in ipairs(slot0.hero_item_data_list) do
		if slot7.bid ~= 0 and slot0.conditions_hero_list[slot6] and #slot0.conditions_hero_list[slot6] > 0 then
			slot8 = nil

			uv2(slot0.conditions_hero_list[slot6], (slot6 ~= 1 or SortTools.tableCommonSorter({
				{
					"lev",
					true
				},
				{
					"id",
					true
				}
			})) and SortTools.tableCommonSorter({
				{
					"lev",
					false
				},
				{
					"id",
					true
				}
			}))

			slot9 = 0

			for slot13, slot14 in ipairs(slot0.conditions_hero_list[slot6]) do
				if slot0.dic_other_selected[slot14.id] == nil then
					slot7.dic_select_list[slot14.id] = slot14

					if slot7.count <= slot9 + 1 then
						break
					end
				end
			end

			if slot9 < slot7.count then
				slot7.dic_select_list = {}
			else
				for slot13, slot14 in pairs(slot7.dic_select_list) do
					slot0.dic_other_selected[slot13] = slot14
				end

				slot7.lev = uv3("%s/%s", slot9, slot7.count)

				if slot0.hero_item_list[slot6] then
					slot0.hero_item_list[slot6].num_label:setString(slot7.lev)

					if slot9 > 0 then
						slot0.hero_item_list[slot6]:setHeadUnEnabled(false)
					else
						slot0.hero_item_list[slot6]:setHeadUnEnabled(true)
					end
				end
			end
		end
	end

	if not BackpackController:getInstance():getModel() or not slot3.getHeroHunList then
		return
	end

	for slot8, slot9 in pairs(slot3:getHeroHunList()) do
		if slot9.config then
			for slot13, slot14 in ipairs(slot1) do
				if slot0.conditions_hero_list[slot13] == nil then
					slot0.conditions_hero_list[slot13] = {}
				end

				if slot0.hero_item_data_list[slot13].bid == 0 then
					if slot14[slot9.config.camp_type] and slot14[slot15][slot9.config.eqm_jie] ~= nil then
						for slot20 = 1, slot9.quantity do
							slot21 = {
								id = -(slot20 + slot15 * 10)
							}
							slot21.partner_id = slot21.id
							slot21.good_vo = slot9

							uv1(slot0.conditions_hero_list[slot13], slot21)
						end
					end
				end
			end
		end
	end
end

function HeroUpgradeStarFusePanel.updateCentreHeroItemRedPoint(slot0)
	if not slot0.conditions_hero_list then
		return
	end

	if not slot0.dic_other_selected then
		return
	end

	slot1 = true

	for slot5, slot6 in ipairs(slot0.hero_item_list) do
		slot8 = slot0.conditions_hero_list[slot5] or {}

		if slot0.hero_item_data_list[slot5] then
			for slot13, slot14 in pairs(slot7.dic_select_list) do
				slot9 = 0 + 1
			end

			if slot9 < slot7.count then
				slot10 = slot7.count

				for slot14, slot15 in ipairs(slot8) do
					if (slot7.dic_select_list[slot15.partner_id] or slot0.dic_other_selected[slot15.partner_id] == nil) and slot10 - 1 == 0 then
						break
					end
				end

				slot6:showRedPoint(slot10 <= 0, 8, 8)

				slot1 = false
			else
				slot6:showRedPoint(false)
			end
		end
	end

	addRedPointToNodeByStatus(slot0.synthesis_btn, slot1, 6, 6)
end

function HeroUpgradeStarFusePanel.getHeroData(slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil then
		-- Nothing
	elseif Config.PartnerData.data_partner_base[slot1] then
		slot5.bid = slot1
		slot5.camp_type = slot6.camp_type
	else
		return nil
	end

	return {
		star = slot2 or 0,
		count = slot3 or 0,
		lev = uv0("%s/%s", 0, slot3),
		bid = 0,
		camp_type = slot4,
		dic_select_list = {}
	}
end

function HeroUpgradeStarFusePanel.createStar(slot0, slot1)
	slot0.star_setting = uv0:createStar(slot1 or 0, slot0.star_node, slot0.star_setting, 32)
end

function HeroUpgradeStarFusePanel.updateSpine(slot0, slot1)
	if slot0.record_fuse_data ~= nil and slot0.record_fuse_data == slot1 then
		return
	end

	slot0.record_fuse_data = slot1

	function slot2()
		if not uv0.spine then
			uv0.spine = BaseRole.new(BaseRole.type.partner, uv1, nil, {
				scale = 1
			})

			uv0.spine:setAnimation(0, PlayerAction.show, true)
			uv0.spine:setCascade(true)
			uv0.spine:setScale(0.7)
			uv0.spine:setPosition(cc.p(0, 0))
			uv0.spine:setAnchorPoint(cc.p(0, 0))
			uv0.mode_node:addChild(uv0.spine)
			uv0.mode_node:setPositionY(30)
			uv0.spine:setCascade(true)
			uv0.spine:setOpacity(0)
			uv0.spine:runAction(cc.FadeIn:create(0.2))
		end
	end

	if slot0.spine then
		doStopAllActions(slot0.spine)
		slot0.spine:setCascade(true)
		slot0.spine:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.CallFunc:create(function ()
			doStopAllActions(uv0.spine)
			uv0.spine:removeFromParent()

			uv0.spine = nil

			uv1()
		end)))
	else
		slot2()
	end
end

function HeroUpgradeStarFusePanel.updateHeroList(slot0, slot1, slot2)
	if not slot2 and (slot1 or 0) == slot0.select_camp then
		return
	end

	if slot0.scroll_view == nil then
		slot6 = slot0.lay_scrollview:getContentSize()
		slot0.scroll_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(640, 250), {
			start_y = 4,
			row = 0,
			start_x = 0,
			space_x = 0,
			item_width = 128,
			item_height = 144,
			space_y = 0,
			col = 5,
			need_dynamic = true
		}, cc.p(0, 0))

		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end

	slot0.select_camp = slot3
	slot4 = slot0.dic_fuse_info[slot0.select_camp]
	slot5 = nil

	table.sort(slot4, (MAKELIFEBETTER ~= true or SortTools.tableLowerSorter({
		"aaaaa",
		"cur_redpoint",
		"camp_type",
		"star",
		"bid"
	})) and SortTools.tableLowerSorter({
		"cur_redpoint",
		"camp_type",
		"star",
		"bid"
	}))

	if #slot4 == 0 then
		slot0.no_vedio_image:setVisible(true)
		slot0.no_vedio_label:setVisible(true)
		slot0.scroll_view:reloadData({})

		return
	else
		slot0.no_vedio_image:setVisible(false)
		slot0.no_vedio_label:setVisible(false)
	end

	if slot0.hero_vo then
		slot8 = 1

		for slot12, slot13 in ipairs(slot4) do
			if (slot0.hero_vo.bid or 0) == slot13.bid and (slot0.hero_vo.star or 0) + 1 == slot13.star then
				slot8 = slot12
			end
		end

		slot0.scroll_view:reloadData(slot8)

		slot0.hero_vo = nil
	else
		slot0.scroll_view:reloadData()
		slot0:updateHeadHeroInfo(slot4[1])
	end
end

function HeroUpgradeStarFusePanel.createNewCell(slot0, slot1, slot2)
	slot3 = HeroExhibitionItem.new(1, true)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function HeroUpgradeStarFusePanel.numberOfCells(slot0)
	return #slot0.dic_fuse_info[slot0.select_camp]
end

function HeroUpgradeStarFusePanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.dic_fuse_info[slot0.select_camp][slot2] then
		return
	end

	slot1:setData(slot3)
	slot1:showRedPoint(HeroCalculate.checkSingleStarFuseRedPoint(slot3))

	slot5 = slot3.need_count or 0
	slot6 = slot3.total_count or 0

	slot1:showProgressbar(slot6 * 100 / slot5, uv0("%s/%s", slot6, slot5))
end

function HeroUpgradeStarFusePanel.onCellTouched(slot0, slot1)
	slot0:updateHeadHeroInfo(slot0.dic_fuse_info[slot0.select_camp][slot1.index])
end

function HeroUpgradeStarFusePanel.DeleteMe(slot0)
	if slot0.spine then
		slot0.spine:DeleteMe()

		slot0.spine = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil

	if slot0.hero_item_list then
		for slot4, slot5 in ipairs(slot0.hero_item_list) do
			slot5:DeleteMe()
		end

		slot0.hero_item_list = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()
	end

	slot0.resources_load = nil

	if slot0.item_load_camp then
		slot0.item_load_camp:DeleteMe()
	end

	slot0.item_load_camp = nil

	if slot0.hero_data_add then
		GlobalEvent:getInstance():UnBind(slot0.hero_data_add)

		slot0.hero_data_add = nil
	end

	if slot0.del_hero_event then
		GlobalEvent:getInstance():UnBind(slot0.del_hero_event)

		slot0.del_hero_event = nil
	end

	if slot0.star_select_event then
		GlobalEvent:getInstance():UnBind(slot0.star_select_event)

		slot0.star_select_event = nil
	end

	if slot0.hero_data_update then
		GlobalEvent:getInstance():UnBind(slot0.hero_data_update)

		slot0.hero_data_update = nil
	end

	if slot0.legend_spine then
		slot0.legend_spine:removeFromParent()
	end

	slot0.legend_spine = nil

	if uv0.getIsFuseRedPoint and uv0:getIsFuseRedPoint() then
		uv1:sender11055(0)
	end

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.guild, false)
end
