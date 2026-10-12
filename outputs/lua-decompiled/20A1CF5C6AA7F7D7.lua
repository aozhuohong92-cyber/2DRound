HeroMainTabUpgradeStarPanel = class("HeroMainTabUpgradeStarPanel", function ()
	return ccui.Widget:create()
end)
slot0 = {
	cc.c4b(100, 50, 35, 255)
}
slot1 = string.format
slot3 = HeroController:getInstance():getModel()
slot4 = table.insert
slot5 = table.sort
slot6 = RoleController:getInstance():getRoleVo()

function HeroMainTabUpgradeStarPanel.ctor(slot0, slot1)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function HeroMainTabUpgradeStarPanel.config(slot0)
	slot0.hero_item_list = {}
	slot0.cost_item_list = {}
end

function HeroMainTabUpgradeStarPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_main_tab_upgrade_star_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.tab_panel = slot0.root_wnd:getChildByName("tab_panel")
	slot0.left_star_node = slot0.tab_panel:getChildByName("left_star_node")
	slot0.right_star_node = slot0.tab_panel:getChildByName("right_star_node")
	slot0.star_arrow = slot0.tab_panel:getChildByName("star_arrow")
	slot0.common_9005 = slot0.tab_panel:getChildByName("common_9005")
	slot0.left_skill_node = slot0.tab_panel:getChildByName("left_skill_item_node")
	slot0.right_skill_node = slot0.tab_panel:getChildByName("right_skill_item_node")
	slot0.item_node = slot0.tab_panel:getChildByName("item_node")
	slot5 = "arrow_2019"
	slot0.arrow_2019 = slot0.tab_panel:getChildByName(slot5)
	slot0.attr_list = {}

	for slot5 = 1, 3 do
		slot6 = slot0.tab_panel:getChildByName("param" .. slot5)
		slot0.attr_list[slot5] = {
			param = slot6,
			key = slot6:getChildByName("key"),
			left = slot6:getChildByName("left"),
			arrow_icon = slot6:getChildByName("arrow_icon"),
			right = slot6:getChildByName("right")
		}
	end

	slot0.up_btn = slot0.tab_panel:getChildByName("up_btn")
	slot2 = slot0.up_btn:getContentSize()
	slot0.up_btn_label = createRichLabel(26, 1, cc.p(0.5, 0.5), cc.p(slot2.width * 0.5, slot2.height * 0.5))

	slot0.up_btn:addChild(slot0.up_btn_label)

	slot3, slot4 = slot0.up_btn:getPosition()
	slot0.fuse_btn_label = createRichLabel(22, cc.c3b(15, 247, 85), cc.p(0.5, 0.5), cc.p(slot3, slot4 + 60))

	slot0.fuse_btn_label:setString(uv0("<div href=xxx>%s</div>", TI18N("前往祭坛")))
	slot0.tab_panel:addChild(slot0.fuse_btn_label)
	slot0.fuse_btn_label:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		if uv0.hero_vo then
			HeroController:getInstance():openHeroResetWindow(true, HeroConst.SacrificeType.eHeroFuse, uv0.hero_vo)
		end
	end, {
		"click",
		"href"
	})

	slot0.label_tip = slot0.tab_panel:getChildByName("label_tip")

	slot0.label_tip:setString(TI18N("(100%返还材料英雄升级、进阶消耗的贝里、经验和突破卡)"))
end

function HeroMainTabUpgradeStarPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.up_btn, function ()
		uv0:_sendUpgradeStar()
	end, true, 2)

	if slot0.hero_data_update_event == nil then
		slot0.hero_data_update_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Data_Update, function (slot0)
			if not slot0 or not uv0.hero_vo then
				return
			end

			if uv0.hero_vo.partner_id == slot0.partner_id then
				uv0.is_hero_data_update = true

				uv0:checkUpdateCurrentInfo()
			end
		end)
	end

	if slot0.hero_data_delete_event == nil then
		slot0.hero_data_delete_event = GlobalEvent:getInstance():Bind(HeroEvent.Del_Hero_Event, function ()
			if not uv0.hero_vo then
				return
			end

			uv0.is_del_hero_event = true

			uv0:checkUpdateCurrentInfo()
		end)
	end

	if slot0.hero_data_add_event == nil then
		slot0.hero_data_add_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Data_Add, function ()
			if not uv0.hero_vo then
				return
			end

			uv0:checkUpdateCurrentInfo(true)
		end)
	end

	if slot0.upgrade_star_select_event == nil then
		slot0.upgrade_star_select_event = GlobalEvent:getInstance():Bind(HeroEvent.Upgrade_Star_Select_Event, function ()
			uv0:updateHeroItemInfo()
		end)
	end

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if not uv0.hero_vo then
				return
			end

			if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				uv0:checkUpdateCurrentInfo(true)
			end
		end)
	end

	if not slot0.del_goods_event then
		slot0.del_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if not uv0.hero_vo then
				return
			end

			if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				uv0:checkUpdateCurrentInfo(true)
			end
		end)
	end

	if not slot0.modify_goods_event then
		slot0.modify_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if not uv0.hero_vo then
				return
			end

			if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				uv0:checkUpdateCurrentInfo(true)
			end
		end)
	end
end

function HeroMainTabUpgradeStarPanel.checkUpdateCurrentInfo(slot0, slot1)
	if slot0.is_hero_data_update and slot0.is_del_hero_event or slot1 then
		slot0:updateInfo(slot0.hero_vo)
	end
end

function HeroMainTabUpgradeStarPanel._sendUpgradeStar(slot0)
	if slot0.is_max_star then
		return
	end

	if slot0.hero_item_data_list and next(slot0.hero_item_data_list) ~= nil then
		slot1 = slot0.hero_vo.partner_id
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

		uv1:setUpgradeStarUpdateRecord(false)

		slot0.is_hero_data_update = false
		slot0.is_del_hero_event = false
		slot5 = {}

		for slot9, slot10 in pairs(slot4) do
			uv0(slot5, {
				item_id = slot9,
				num = slot10
			})
		end

		uv2:sender11005(slot1, slot2, slot3, slot5)
	end
end

function HeroMainTabUpgradeStarPanel.updateHeroItemInfo(slot0)
	if not slot0.hero_item_data_list then
		return
	end

	slot0.dic_other_selected = {}

	if slot0.hero_vo then
		slot0.dic_other_selected[slot0.hero_vo.partner_id] = slot0.hero_vo
	end

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

function HeroMainTabUpgradeStarPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.hero_vo = slot1

	slot0:updateInfo(slot1)
end

function HeroMainTabUpgradeStarPanel.updateInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = slot1.star or 1
	slot0.left_star_setting = uv0:createStar(slot2, slot0.left_star_node, slot0.left_star_setting)
	slot0.right_star_setting = uv0:createStar(slot2 + 1, slot0.right_star_node, slot0.right_star_setting)
	slot4 = Config.PartnerData.data_partner_star(getNorKey(slot1.bid, slot2))

	if Config.PartnerData.data_partner_star(getNorKey(slot1.bid, slot2 + 1)) == nil then
		slot0.star_arrow:setVisible(false)
		slot0.right_star_node:setVisible(false)

		if slot0.left_skill_item then
			slot0.left_skill_item:setVisible(false)
		end

		if slot0.right_skill_item then
			slot0.right_skill_item:setVisible(false)
		end

		if slot0:getFirstSkillID(slot4, slot6) then
			if slot0.max_skill_item == nil then
				slot8 = slot0.arrow_2019:getContentSize()
				slot0.max_skill_item = slot0:createSkillItem(slot0.arrow_2019, cc.p(slot8.width * 0.5, slot8.height * 0.5), slot7)
			end

			slot0.arrow_2019:setVisible(true)
			slot0.max_skill_item:setVisible(true)
			slot0.max_skill_item:setData({
				skill_id = slot7
			})
		else
			slot0.arrow_2019:setVisible(false)
		end

		slot0.item_node:setVisible(false)
	else
		if uv0.hero_info_upgrade_star_param <= slot2 and slot2 < uv0.hero_info_upgrade_star_param3 then
			slot0.right_star_node:setVisible(true)
			slot0.star_arrow:setVisible(true)

			if slot0.max_skill_item then
				slot0.max_skill_item:setVisible(false)
			end

			slot7, slot8 = slot0:getFirstSkillID(slot4, slot6)

			if slot7 and slot8 then
				if slot0.left_skill_item == nil then
					slot0.left_skill_item = slot0:createSkillItem(slot0.left_skill_node, cc.p(0, 0))
				end

				if slot0.right_skill_item == nil then
					slot0.right_skill_item = slot0:createSkillItem(slot0.right_skill_node, cc.p(0, 0))
				end

				slot0.left_skill_item:setVisible(true)
				slot0.left_skill_item:setData({
					skill_id = slot7
				})
				slot0.right_skill_item:setVisible(true)
				slot0.right_skill_item:setData({
					skill_id = slot8
				})
				slot0.arrow_2019:setVisible(true)
			else
				slot0.arrow_2019:setVisible(false)

				if slot0.left_skill_item then
					slot0.left_skill_item:setVisible(false)
				end

				if slot0.right_skill_item then
					slot0.right_skill_item:setVisible(false)
				end
			end
		else
			slot0.arrow_2019:setVisible(false)

			if slot0.left_skill_item then
				slot0.left_skill_item:setVisible(false)
			end

			if slot0.right_skill_item then
				slot0.right_skill_item:setVisible(false)
			end
		end

		slot0.item_node:setVisible(true)
		slot0:updateItemDataByConfig(slot6)
	end

	slot0:updateAttrUI(slot4, slot6)

	if slot1:isResonateHero() then
		slot0.up_btn:setVisible(false)
		slot0.common_9005:setVisible(false)

		if slot0.consume_label then
			slot0.consume_label:setVisible(false)
		end

		slot0.fuse_btn_label:setVisible(false)
	else
		slot0.up_btn:setVisible(true)

		if slot6 == nil then
			slot0.is_max_star = true

			slot0.up_btn_label:setString(string.format(TI18N("<div outline=2,#294a15>%s</div>"), TI18N("已满级")))
		else
			slot0.is_max_star = false

			if uv0.hero_info_upgrade_star_param <= slot2 then
				if next(slot6.other_expend) ~= nil then
					slot7 = 0

					for slot11, slot12 in pairs(slot6.other_expend) do
						if slot12[1] == uv0.upgrade_star_cost_id then
							slot7 = slot12[2]

							break
						end
					end

					if slot7 > 0 then
						slot8 = Config.ItemData.data_get_data(uv0.upgrade_star_cost_id)
						slot9 = BackpackController:getInstance():getModel():getItemNumByBid(slot8.id)

						slot0.up_btn_label:setString(string.format(TI18N("<img src=%s scale=0.45 visible=true /><div outline=2,#294a15>%s%s</div>"), PathTool.getItemRes(slot8.icon), slot7, TI18N("升星")))

						if not slot0.consume_label then
							slot0.consume_label = createRichLabel(20, cc.c4b(255, 246, 228, 255), cc.p(0.5, 0.5), nil, nil, nil, 1000)

							slot0.tab_panel:addChild(slot0.consume_label)
						end

						if slot0.consume_label then
							slot0.consume_label:setVisible(true)

							slot11, slot12 = slot0.up_btn:getPosition()

							slot0.consume_label:setPosition(slot11, slot12 + 60)
							slot0.consume_label:setString(string.format(TI18N("<img src=%s scale=0.25 visible=true /> %s/%s"), PathTool.getItemRes(slot8.icon), MoneyTool.GetMoneyString(slot9), slot7))
						end
					else
						slot0.up_btn_label:setString(string.format(TI18N("<div outline=2,#294a15>%s</div>"), TI18N("升星")))
					end
				else
					slot0.up_btn_label:setString(string.format(TI18N("<div outline=2,#294a15>%s</div>"), TI18N("升星")))
				end

				slot0.common_9005:setVisible(true)
				slot0.fuse_btn_label:setVisible(false)
			else
				if slot0.consume_label then
					slot0.consume_label:setVisible(false)
				end

				slot0.common_9005:setVisible(false)
				slot0.up_btn_label:setString(string.format(TI18N("<div outline=2,#294a15>%s</div>"), TI18N("升星")))
				slot0.fuse_btn_label:setVisible(true)
			end
		end

		addRedPointToNodeByStatus(slot0.up_btn, HeroCalculate.checkSingleHeroUpgradeStarRedPoint(slot1), 5, 5)
	end
end

function HeroMainTabUpgradeStarPanel.getFirstSkillID(slot0, slot1, slot2)
	if slot2 == nil then
		if slot1 then
			for slot6, slot7 in ipairs(slot1.skills) do
				if slot7[1] ~= 1 then
					return slot7[2]
				end
			end
		end

		return nil
	end

	if slot1 and slot2 then
		slot3 = nil
		slot4 = {
			[slot9[1]] = slot9[2]
		}

		for slot8, slot9 in ipairs(slot1.skills) do
			-- Nothing
		end

		for slot8, slot9 in ipairs(slot2.skills) do
			if slot9[1] ~= 1 and slot4[slot9[1]] and slot4[slot9[1]] ~= slot9[2] then
				return slot4[slot9[1]], slot9[2]
			end
		end
	end

	return nil
end

function HeroMainTabUpgradeStarPanel.createSkillItem(slot0, slot1, slot2, slot3)
	slot4 = SkillItem.new(true, true, true, 0.8, true)

	slot4:setPosition(slot2)
	slot1:addChild(slot4)

	return slot4
end

function HeroMainTabUpgradeStarPanel.updateItemDataByConfig(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.hero_item_data_list = {}
	slot2 = {}
	slot0.dic_other_selected = {}

	if slot0.hero_vo then
		slot0.dic_other_selected[slot0.hero_vo.partner_id] = slot0.hero_vo
	end

	slot3 = 1

	for slot7, slot8 in ipairs(slot1.expend2) do
		slot0.hero_item_data_list[slot3] = slot0:getHeroData(slot8[1], slot8[2], slot8[3])
		slot2[slot3] = {
			[slot8[1]] = {}
		}
		slot2[slot3][slot8[1]][slot8[2]] = slot8[3]
		slot3 = slot3 + 1
	end

	for slot7, slot8 in ipairs(slot1.expend3) do
		slot0.hero_item_data_list[slot3] = slot0:getHeroData(nil, slot8[2], slot8[3], slot8[1])
		slot2[slot3] = {
			[slot8[1]] = {}
		}
		slot2[slot3][slot8[1]][slot8[2]] = slot8[3]
		slot3 = slot3 + 1
	end

	for slot7, slot8 in ipairs(slot0.hero_item_list) do
		slot8:setVisible(false)
	end

	for slot7, slot8 in ipairs(slot0.hero_item_data_list) do
		if slot0.hero_item_list[slot7] == nil then
			slot0.hero_item_list[slot7] = HeroExhibitionItem.new(0.8, true)

			slot0.hero_item_list[slot7]:setPosition(30 + (slot7 - 1) * (HeroExhibitionItem.Width * 0.8 + 10), 0)
			slot0.hero_item_list[slot7]:addCallBack(function ()
				uv0:_onClickItemData(uv1)
			end)
			slot0.item_node:addChild(slot0.hero_item_list[slot7])
		end

		slot0.hero_item_list[slot7]:setVisible(true)

		if slot8.bid == 0 then
			slot0.hero_item_list[slot7]:setData(slot8)
			slot0.hero_item_list[slot7]:setDefaultHead(uv0:getRandomHeroHeadByQuality(slot8.star))
			slot0.hero_item_list[slot7]:setHeroName(true, uv1(TI18N("%s星英雄"), slot8.star))
		else
			slot0.hero_item_list[slot7]:setData(slot8)
			slot0.hero_item_list[slot7]:setHeroName(true, slot8.name)
		end

		slot0.hero_item_list[slot7]:setHeroNameColor(cc.c4b(238, 237, 233, 255))
		slot0.hero_item_list[slot7]:setHeadUnEnabled(true)
	end

	for slot7, slot8 in pairs(slot0.cost_item_list) do
		slot8:setVisible(false)
	end

	slot4 = #slot0.hero_item_data_list

	if slot1.other_expend then
		for slot8, slot9 in ipairs(slot1.other_expend) do
			slot11 = slot9[2]

			if slot9[1] ~= uv0.upgrade_star_cost_id then
				if not slot0.cost_item_list[slot8] then
					slot12 = BackPackItem.new(false, true, false, 0.8)

					slot0.item_node:addChild(slot12)

					slot0.cost_item_list[slot8] = slot12
				end

				slot12:setPosition((slot4 + slot8 - 1) * (BackPackItem.Width * 0.8 + 10) + 40, 0)

				slot13 = BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot10)

				slot12:setBaseData(slot10)
				slot12:setNeedNum(slot11, slot13, 1, true, 2)

				if slot13 < slot11 then
					slot12:setDefaultTip(true, true)
				else
					slot12:setDefaultTip()
				end

				slot12:setVisible(true)
			end
		end
	end

	slot0:initHeroListByMatchInfo(slot2)
	slot0:updateCentreHeroItemRedPoint()
end

function HeroMainTabUpgradeStarPanel.initHeroListByMatchInfo(slot0, slot1)
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
			elseif slot12[slot7.bid] and slot12[slot7.bid][slot7.star] and slot0.hero_vo and slot0.hero_vo.partner_id ~= slot7.partner_id then
				uv1(slot0.conditions_hero_list[slot11], slot7)
			end
		end
	end

	slot0.dic_other_selected = {}

	if slot0.hero_vo then
		slot0.dic_other_selected[slot0.hero_vo.partner_id] = slot0.hero_vo
	end

	for slot6, slot7 in ipairs(slot0.hero_item_data_list) do
		if slot7.bid ~= 0 and slot0.conditions_hero_list[slot6] and #slot0.conditions_hero_list[slot6] > 0 then
			uv2(slot0.conditions_hero_list[slot6], SortTools.tableCommonSorter({
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
				if slot0.dic_other_selected[slot14.id] == nil and not slot14:checkHeroLockTips(true, nil, true) then
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

	for slot7, slot8 in pairs(BackpackController:getInstance():getModel():getHeroHunList()) do
		if slot8.config then
			for slot12, slot13 in ipairs(slot1) do
				if slot0.conditions_hero_list[slot12] == nil then
					slot0.conditions_hero_list[slot12] = {}
				end

				if slot0.hero_item_data_list[slot12].bid == 0 then
					if slot13[slot8.config.camp_type] and slot13[slot14][slot8.config.eqm_jie] ~= nil then
						for slot19 = 1, slot8.quantity do
							slot20 = {
								id = -(slot19 + slot14 * 10)
							}
							slot20.partner_id = slot20.id
							slot20.good_vo = slot8

							uv1(slot0.conditions_hero_list[slot12], slot20)
						end
					end
				end
			end
		end
	end
end

function HeroMainTabUpgradeStarPanel.updateCentreHeroItemRedPoint(slot0)
	if not slot0.conditions_hero_list then
		return
	end

	if not slot0.dic_other_selected then
		return
	end

	for slot4, slot5 in ipairs(slot0.hero_item_list) do
		slot7 = slot0.conditions_hero_list[slot4] or {}

		if slot0.hero_item_data_list[slot4] then
			for slot12, slot13 in pairs(slot6.dic_select_list) do
				slot8 = 0 + 1
			end

			if slot8 < slot6.count then
				slot9 = slot6.count

				for slot13, slot14 in ipairs(slot7) do
					if (slot6.dic_select_list[slot14.id] or slot0.dic_other_selected[slot14.id] == nil) and slot9 - 1 == 0 then
						break
					end
				end

				slot5:showRedPoint(slot9 <= 0, 8, 8)
			else
				slot5:showRedPoint(false)
			end
		end
	end
end

function HeroMainTabUpgradeStarPanel._onClickItemData(slot0, slot1)
	if not slot0.hero_item_data_list[slot1] then
		return
	end

	if not slot0.hero_vo then
		return
	end

	slot0.hero_item_data_list[slot1].is_select = true
	slot2 = {
		[slot0.hero_vo.partner_id] = slot0.hero_vo
	}

	for slot6, slot7 in ipairs(slot0.hero_item_data_list) do
		if slot6 ~= slot1 then
			for slot11, slot12 in pairs(slot7.dic_select_list) do
				slot2[slot11] = slot12
			end
		end
	end

	if slot0.hero_item_data_list[slot1].bid == 0 and slot0.hero_item_data_list[slot1].star == 5 then
		-- Nothing
	end

	uv0:openHeroUpgradeStarSelectPanel(true, slot0.hero_item_data_list[slot1], slot2, HeroConst.SelectHeroType.eUpgradeStar, {
		self_mark_bid = slot0.hero_vo.bid
	})
end

function HeroMainTabUpgradeStarPanel.updateAttrUI(slot0, slot1, slot2)
	if slot2 == nil then
		for slot6, slot7 in ipairs(slot0.attr_list) do
			slot7.param:setVisible(false)
		end
	else
		slot3 = 302
		slot4 = 96
		slot5 = slot0.hero_vo.star or 0

		if #slot2.attr_show <= 0 then
			for slot10, slot11 in ipairs(slot0.attr_list) do
				slot11.param:setVisible(false)
			end

			return
		elseif slot6 > 3 then
			slot6 = 3
		end

		slot7 = slot4 / slot6

		for slot11, slot12 in ipairs(slot0.attr_list) do
			if slot2.attr_show[slot11] then
				if uv0.hero_info_upgrade_star_param <= slot5 and slot5 < uv0.hero_info_upgrade_star_param2 then
					slot12.param:setPosition(485, slot3 - ((slot11 - 1) * slot7 + slot7 * 0.5))
				else
					slot12.param:setPosition(slot0.size.width * 0.5, slot14)
				end

				slot12.param:setVisible(true)

				if slot13[2] == nil then
					slot12.arrow_icon:setVisible(false)
					slot12.left:setVisible(false)
					slot12.right:setVisible(false)
				else
					slot12.arrow_icon:setVisible(true)
					slot12.left:setVisible(true)
					slot12.right:setVisible(true)
					slot12.left:setString(slot13[2])
					slot12.right:setString(slot13[3])
				end

				slot12.key:setString(slot13[1])
			else
				slot12.param:setVisible(false)
			end
		end
	end
end

function HeroMainTabUpgradeStarPanel.getHeroData(slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil then
		-- Nothing
	elseif Config.PartnerData.data_partner_base[slot1] then
		slot5.bid = slot1
		slot5.camp_type = slot6.camp_type
		slot5.name = slot6.name
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

function HeroMainTabUpgradeStarPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function HeroMainTabUpgradeStarPanel.DeleteMe(slot0)
	if slot0.left_skill_item then
		slot0.left_skill_item:DeleteMe()

		slot0.left_skill_item = nil
	end

	if slot0.right_skill_item then
		slot0.right_skill_item:DeleteMe()

		slot0.right_skill_item = nil
	end

	if slot0.max_skill_item then
		slot0.max_skill_item:DeleteMe()

		slot0.max_skill_item = nil
	end

	if slot0.hero_item_list then
		for slot4, slot5 in ipairs(slot0.hero_item_list) do
			slot5:DeleteMe()
		end

		slot0.hero_item_list = nil
	end

	if slot0.cost_item_list then
		for slot4, slot5 in ipairs(slot0.cost_item_list) do
			slot5:DeleteMe()
		end

		slot0.cost_item_list = nil
	end

	if slot0.upgrade_star_select_event then
		GlobalEvent:getInstance():UnBind(slot0.upgrade_star_select_event)

		slot0.upgrade_star_select_event = nil
	end

	if slot0.hero_data_update_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_data_update_event)

		slot0.hero_data_update_event = nil
	end

	if slot0.hero_data_delete_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_data_delete_event)

		slot0.hero_data_delete_event = nil
	end

	if slot0.hero_data_add_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_data_add_event)

		slot0.hero_data_add_event = nil
	end

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
end
