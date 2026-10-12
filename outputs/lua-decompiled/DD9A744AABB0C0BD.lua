HeroUpgradeStarSuperAdvancePanel = class("HeroUpgradeStarSuperAdvancePanel", function ()
	return ccui.Widget:create()
end)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format

function HeroUpgradeStarSuperAdvancePanel.ctor(slot0, slot1)
	slot0.hero_vo = slot1 or nil
	slot0.star_list = {}
	slot0.star_list2 = {}
	slot0.star10 = nil
	slot0.star_label = nil
	slot0.dic_fuse_info = nil
	slot0.camp_y = {
		[HeroConst.CampType.eWater] = 766,
		[HeroConst.CampType.eFire] = 739,
		[HeroConst.CampType.eWind] = 540,
		[HeroConst.CampType.eLight] = 798,
		[HeroConst.CampType.eDark] = 497,
		[HeroConst.CampType.eLegend] = 497
	}
	slot0.hero_item_data_list = {}
	slot0.item_list = {}
	slot0.camp_btn_redpoint_list = nil

	slot0:loadResources()
end

function HeroUpgradeStarSuperAdvancePanel.loadResources(slot0)
	slot0.res_list = {
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

function HeroUpgradeStarSuperAdvancePanel.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_upgrade_star_super_advance"))

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

	slot9 = "item_node"
	slot0.item_node = slot0.main_panel:getChildByName(slot9)
	slot0.pos_list = {}

	for slot9 = 1, 7 do
		slot10 = slot0.main_panel:getChildByName("node" .. slot9)
		slot0.pos_list[slot9] = cc.p(slot10:getPositionX(), slot10:getPositionY())
	end

	slot0.target_item = BackPackItem.new(false, true, false, 1, false, true)

	slot0.item_node:addChild(slot0.target_item)

	slot0.synthesis_btn = slot0.main_panel:getChildByName("synthesis_btn")
	slot0.lay_scrollview = slot0.main_panel:getChildByName("lay_scrollview")

	slot0:adaptationScreen()
end

function HeroUpgradeStarSuperAdvancePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function HeroUpgradeStarSuperAdvancePanel.adaptationScreen(slot0)
end

function HeroUpgradeStarSuperAdvancePanel.register_event(slot0)
	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1, slot2)
		if uv0.fuse_data and uv0.fuse_data.super_config then
			TipsManager:getInstance():showCommonTips(uv0.fuse_data.super_config.remark, slot1:getTouchBeganPosition(), nil, nil, 460)
		end
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
		slot0.star_select_event = GlobalEvent:getInstance():Bind(HeroEvent.Select_Hero_Event, function (slot0, slot1)
			if slot1 and slot1 == HeroConst.SelectHeroType.eSuperAdvance then
				uv0:updateHeroItemInfo(slot0)
			end
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

			uv0:checkUpdateCurrentInfo(true)
		end)
	end

	if not slot0.del_hero_event then
		slot0.del_hero_event = GlobalEvent:getInstance():Bind(HeroEvent.Del_Hero_Event, function ()
			if not uv0.fuse_data then
				return
			end

			uv0.is_del_hero_event = true

			uv0:checkUpdateCurrentInfo(true)
		end)
	end
end

function HeroUpgradeStarSuperAdvancePanel.checkUpdateCurrentInfo(slot0, slot1)
	if slot0.is_hero_data_update and slot0.is_del_hero_event or slot1 then
		slot0:initCentreHeroItemDataByConfig(slot0.fuse_data.super_config.loss_item)
		slot0:updateCampRedpoint()
		slot0:updateHeroList(slot0.select_camp, true)
	end
end

function HeroUpgradeStarSuperAdvancePanel._onClickBtnLook(slot0)
	if not slot0.show_hero_vo then
		return
	end

	uv0:openHeroTipsPanel(true, slot0.show_hero_vo, {
		is_hide_equip = true
	})
end

function HeroUpgradeStarSuperAdvancePanel._onClickBtnSynthesis(slot0)
	if not slot0.fuse_data or not slot0.fuse_data.super_config then
		return
	end

	if not slot0:_isItemEnough(slot0.fuse_data.super_config.loss_item) then
		message(TI18N("材料不足"))

		return
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0.hero_item_data_list) do
		slot7 = {
			partner_bid = slot6.bid,
			expend1 = {}
		}

		for slot11, slot12 in pairs(slot6.dic_select_list) do
			table.insert(slot7.expend1, {
				partner_id = slot11
			})
		end

		table.insert(slot1, slot7)
	end

	uv0:sender11018(slot0.fuse_data.bid, slot0.fuse_data.star, slot1)
end

function HeroUpgradeStarSuperAdvancePanel._isItemEnough(slot0, slot1)
	slot2 = true

	for slot6, slot7 in ipairs(slot1) do
		if slot0.item_list[slot6].type == 2 then
			slot8:setItemIconUnEnabled(BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot7[2]) < slot7[3])
			slot8:showItemEffect(slot7[3] <= slot9, 156, PlayerAction.action_1, true)

			if slot9 < slot7[3] then
				slot2 = false

				break
			end
		elseif slot8.type == 1 then
			slot9 = slot0.hero_item_data_list[slot6]

			slot8:setData(slot9)

			slot10 = slot9.dic_select_list
			slot9.lev = string.format("%s/%s", tableLen(slot10), slot9.count)

			if tableLen(slot10) < slot9.count then
				slot2 = false

				break
			end
		end
	end

	return slot2
end

function HeroUpgradeStarSuperAdvancePanel._onClickBtnShowByIndex(slot0, slot1)
	if slot0.img_select and slot0.camp_btn_list[slot1] then
		slot2, slot3 = slot0.camp_btn_list[slot1]:getPosition()

		slot0.img_select:setPosition(slot2 - 0.5, slot3 + 1)
	end

	slot0:updateHeroList(slot1)
	slot0:updateCampRedpoint()
end

function HeroUpgradeStarSuperAdvancePanel._onClickHeroItem(slot0, slot1)
	if not slot0.hero_item_data_list[slot1] then
		return
	end

	slot0.hero_item_data_list[slot1].is_select = true
	slot2 = {
		select_condition = {},
		dic_selected = slot0.hero_item_data_list[slot1].dic_select_list
	}
	slot2.select_condition.bid = slot0.hero_item_data_list[slot1].bid
	slot2.select_condition.star = slot0.hero_item_data_list[slot1].star
	slot2.select_count = slot0.hero_item_data_list[slot1].count
	slot2.form_type = HeroConst.SelectHeroType.eSuperAdvance

	uv0:openHeroSelectHeroPanel(true, slot2)
end

function HeroUpgradeStarSuperAdvancePanel.updateHeroItemInfo(slot0, slot1)
	slot0.dic_other_selected = {}
	slot0.dic_other_selected = {}

	for slot5, slot6 in ipairs(slot0.hero_item_data_list) do
		if slot6.is_select then
			slot6.is_select = false
			slot6.dic_select_list = slot1

			for slot11, slot12 in pairs(slot6.dic_select_list) do
				slot7 = 0 + 1
				slot0.dic_other_selected[slot11] = slot12
			end

			slot6.lev = string.format("%s/%s", slot7, slot6.count)

			if slot0.item_list[slot5] then
				slot0.item_list[slot5].num_label:setString(slot6.lev)

				if slot7 > 0 then
					slot0.item_list[slot5]:setHeadUnEnabled(false)
				else
					slot0.item_list[slot5]:setHeadUnEnabled(true)
				end
			end
		else
			for slot10, slot11 in pairs(slot6.dic_select_list) do
				slot0.dic_other_selected[slot10] = slot11
			end
		end
	end

	slot0:updateCentreHeroItemRedPoint()
end

function HeroUpgradeStarSuperAdvancePanel.openRootWnd(slot0)
	slot0:initHeroVoInfo()
	slot0:_onClickBtnShowByIndex(HeroConst.CampType.eLegend)
	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.guild, false)
end

function HeroUpgradeStarSuperAdvancePanel.initHeroVoInfo(slot0)
	if slot0.dic_fuse_info then
		return
	end

	slot0.dic_fuse_info = uv0:getSuperAdvanceList() or {}
end

function HeroUpgradeStarSuperAdvancePanel.updateCampRedpoint(slot0)
	for slot5, slot6 in pairs(slot0.camp_btn_list) do
		if slot5 == (slot0.select_camp or 0) then
			addRedPointToNodeByStatus(slot6, false)
		end
	end
end

function HeroUpgradeStarSuperAdvancePanel.updateHeadHeroInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.fuse_data = slot1
	slot2 = slot1.camp_type or HeroConst.CampType.eWater

	if slot0.record_bg_res ~= PathTool.getPlistImgForDownLoad("bigbg/hero", slot1.super_config.background) then
		slot0.record_bg_res = slot3
		slot0.item_load = loadImageTextureFromCDN(slot0.background, slot3, ResourcesType.single, slot0.item_load)
	end

	if slot0.record_camp_res ~= PathTool.getPlistImgForDownLoad("bigbg/hero", HeroConst.CampBottomBgRes[slot2]) then
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

	slot6 = slot1.super_config.loss_item

	if slot1.super_config.award_item and slot7[1] then
		slot0.target_item:setBaseData(slot7[1][1], slot7[1][2])
	else
		slot0.target_item:setVisible(false)
	end

	slot0:initCentreHeroItemDataByConfig(slot6)
end

function HeroUpgradeStarSuperAdvancePanel.initCentreHeroItemDataByConfig(slot0, slot1)
	if not slot1 then
		slot5 = false

		slot0.target_item:setVisible(slot5)

		for slot5, slot6 in pairs(slot0.item_list) do
			slot6:setVisible(false)
		end

		return
	end

	slot0:createRequireItem(slot1)

	slot2 = {
		[slot3] = {}
	}
	slot3 = 1

	for slot7, slot8 in pairs(slot1) do
		if slot8[1] == 1 then
			slot0.hero_item_data_list[slot7] = slot0:getHeroData(slot8[2], slot8[4], slot8[3])
			slot2[slot3][slot8[2]] = {
				[slot8[4]] = slot8[3]
			}
			slot3 = slot3 + 1
		end
	end

	slot0:initHeroListByMatchInfo(slot2)
	slot0:updateCentreHeroItemRedPoint()
	slot0:setRequireItemData(slot1)
end

function HeroUpgradeStarSuperAdvancePanel.createRequireItem(slot0, slot1)
	for slot5 = 1, 7 do
		if slot1[slot5] then
			slot6 = slot1[slot5]

			if not slot0.item_list[slot5] or slot7.type ~= slot6[1] then
				if slot7 then
					slot7:DeleteMe()

					slot7 = nil
				end

				if slot6[1] == 1 then
					slot7 = HeroExhibitionItem.new(1, true)
					slot7.type = 1

					slot7:addCallBack(function ()
						uv0:_onClickHeroItem(uv1)
					end)
				else
					slot7 = BackPackItem.new(false, true, false, 1, false, true)
					slot7.type = 2

					slot7:setBaseData(slot1[slot5][2], 0)
					slot7.num_label:setString("0/" .. slot1[slot5][3])
					slot7.num_label:setPosition(110, 94)
					slot7.num_label:enableOutline(cc.c3b(0, 0, 0), 2)
					slot7.num_label:setVisible(true)
					slot7:setItemIconUnEnabled(true)
				end

				slot7:setPosition(slot0.pos_list[slot5])
				slot0.main_panel:addChild(slot7)
			end

			slot7:setVisible(true)

			slot0.item_list[slot5] = slot7
		end
	end
end

function HeroUpgradeStarSuperAdvancePanel.setRequireItemData(slot0, slot1)
	slot2 = true

	for slot6, slot7 in ipairs(slot1) do
		if slot0.item_list[slot6].type == 2 then
			slot8:setItemIconUnEnabled(BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot7[2]) < slot7[3])
			slot8:showItemEffect(slot7[3] <= slot9, 156, PlayerAction.action_1, true)
			slot8.num_label:setString(slot9 .. "/" .. slot7[3])

			if slot9 < slot7[3] then
				slot2 = false
			end
		elseif slot8.type == 1 then
			slot9 = slot0.hero_item_data_list[slot6]

			slot8:setData(slot9)

			slot10 = slot9.dic_select_list
			slot9.lev = string.format("%s/%s", tableLen(slot10), slot9.count)

			slot8.num_label:setString(slot9.lev)

			if slot9.count <= tableLen(slot10) then
				slot8:setHeadUnEnabled(false)
			else
				slot2 = false

				slot8:setHeadUnEnabled(true)
			end
		end
	end

	slot0.target_item:showItemEffect(slot2, 263, PlayerAction.action_1, true, 1.1)
	addRedPointToNodeByStatus(slot0.synthesis_btn, slot2, -20, 0)
end

function HeroUpgradeStarSuperAdvancePanel.initHeroListByMatchInfo(slot0, slot1)
	slot0.conditions_hero_list = {}

	for slot6, slot7 in pairs(uv0:getHeroList()) do
		for slot11, slot12 in ipairs(slot1) do
			if slot0.conditions_hero_list[slot11] == nil then
				slot0.conditions_hero_list[slot11] = {}
			end

			if slot12[slot7.bid] and slot12[slot7.bid][slot7.star] and not slot7:isLock() and not slot7:isInForm() then
				table.insert(slot0.conditions_hero_list[slot11], slot7)
			end
		end
	end

	slot0.dic_other_selected = {}

	for slot6, slot7 in ipairs(slot0.hero_item_data_list) do
		if slot0.conditions_hero_list[slot6] and #slot0.conditions_hero_list[slot6] > 0 then
			table.sort(slot0.conditions_hero_list[slot6], SortTools.tableCommonSorter({
				{
					"lev",
					true
				},
				{
					"id",
					true
				}
			}))
		end

		for slot12, slot13 in ipairs(slot0.conditions_hero_list[slot6]) do
			if slot0.dic_other_selected[slot13.id] == nil then
				slot7.dic_select_list[slot13.id] = slot13

				if slot7.count <= 0 + 1 then
					break
				end
			end
		end

		for slot12, slot13 in pairs(slot7.dic_select_list) do
			slot0.dic_other_selected[slot12] = slot13
		end

		slot7.lev = string.format("%s/%s", slot8, slot7.count)

		if slot0.item_list[slot6] then
			slot0.item_list[slot6].num_label:setString(slot7.lev)

			if slot8 > 0 then
				slot0.item_list[slot6]:setHeadUnEnabled(false)
			else
				slot0.item_list[slot6]:setHeadUnEnabled(true)
			end
		end
	end
end

function HeroUpgradeStarSuperAdvancePanel.updateCentreHeroItemRedPoint(slot0)
	if not slot0.conditions_hero_list then
		return
	end

	if not slot0.dic_other_selected then
		return
	end

	slot1 = true

	for slot5, slot6 in pairs(slot0.item_list) do
		if slot6.type == 1 then
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
	end
end

function HeroUpgradeStarSuperAdvancePanel.getHeroData(slot0, slot1, slot2, slot3, slot4)
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

function HeroUpgradeStarSuperAdvancePanel.createStar(slot0, slot1)
	slot0.star_setting = uv0:createStar(slot1 or 0, slot0.star_node, slot0.star_setting, 32)
end

function HeroUpgradeStarSuperAdvancePanel.updateSpine(slot0, slot1)
	if slot0.record_fuse_data ~= nil and slot0.record_fuse_data == slot1 then
		return
	end

	slot0.record_fuse_data = slot1

	function slot2()
		if not uv0.spine then
			uv0.spine = createEffectSpine(uv1.super_config.spine_id, cc.p(0, -900), cc.p(0.5, 0.5), true, PlayerAction.action)

			uv0.mode_node:addChild(uv0.spine)
		end
	end

	if slot0.spine then
		doStopAllActions(slot0.spine)
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

function HeroUpgradeStarSuperAdvancePanel.updateHeroList(slot0, slot1, slot2)
	if not slot2 and (slot1 or 0) == slot0.select_camp then
		return
	end

	if slot0.scroll_view == nil then
		slot0.scroll_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(640, 250), {
			start_y = 0,
			row = 0,
			start_x = 0,
			space_x = 0,
			item_width = 128,
			item_height = 138,
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

function HeroUpgradeStarSuperAdvancePanel.createNewCell(slot0, slot1, slot2)
	slot3 = HeroExhibitionItem.new(1, true)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function HeroUpgradeStarSuperAdvancePanel.numberOfCells(slot0)
	return #slot0.dic_fuse_info[slot0.select_camp]
end

function HeroUpgradeStarSuperAdvancePanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.dic_fuse_info[slot0.select_camp][slot2] then
		return
	end

	slot1:setData(slot3)
	slot1:showRedPoint(HeroCalculate.checkSuperAdvanceRedPoint(slot3.super_config and slot3.super_config.loss_item or nil))
end

function HeroUpgradeStarSuperAdvancePanel.onCellTouched(slot0, slot1)
	slot0:updateHeadHeroInfo(slot0.dic_fuse_info[slot0.select_camp][slot1.index])
end

function HeroUpgradeStarSuperAdvancePanel.DeleteMe(slot0)
	if slot0.spine then
		slot0.spine:removeFromParent()

		slot0.spine = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil

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

	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	slot0.item_list = {}

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
