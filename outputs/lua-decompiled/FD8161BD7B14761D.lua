HeroTalentSkillLearnPanel = HeroTalentSkillLearnPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.remove

function HeroTalentSkillLearnPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "hero/hero_talent_skill_learn_panel"
	slot0.res_list = {}
	slot0.item_list = {}
	slot0.title_height = 60
end

function HeroTalentSkillLearnPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N("霸气领悟"))

	slot0.show_item_node = slot0.main_container:getChildByName("show_item_node")
	slot0.skill_item = SkillItem.new(true, true, true, nil, nil, false)

	slot0.show_item_node:addChild(slot0.skill_item)

	slot0.skill_name = slot0.main_container:getChildByName("skill_name")
	slot0.skill_desc = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0, 1), cc.p(0, 0), nil, nil, 440)

	slot0.main_container:getChildByName("dec_node"):addChild(slot0.skill_desc)

	slot0.no_vedio_image = slot0.main_container:getChildByName("no_vedio_image")
	slot0.no_vedio_label = slot0.main_container:getChildByName("no_vedio_label")

	slot0.no_vedio_label:setString(TI18N("暂时无技能"))

	slot0.lay_scrollview = slot0.main_container:getChildByName("lay_scrollview")
	slot0.cost_node = slot0.main_container:getChildByName("cost_node")
	slot0.select_btn = slot0.main_container:getChildByName("select_btn")

	slot0.select_btn:getChildByName("label"):setString(TI18N("领 悟"))

	slot0.cost_label = slot0.main_container:getChildByName("cost_label")

	slot0.cost_label:setString(TI18N("消耗:"))
end

function HeroTalentSkillLearnPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.select_btn, handler(slot0, slot0.onClickBtnSelect), true, 2)
end

function HeroTalentSkillLearnPanel.onClickBtnClose(slot0)
	uv0:openHeroTalentSkillLearnPanel(false)
end

function HeroTalentSkillLearnPanel.onClickBtnSelect(slot0)
	if not slot0.select_skill_data then
		return
	end

	if slot0.dic_have_skill_id.order_had == 1 then
		return
	else
		uv0:sender11096(slot0.hero_vo.partner_id, slot0.pos, slot0.select_skill_data.config.id)
		slot0:onClickBtnClose()
	end
end

function HeroTalentSkillLearnPanel.openRootWnd(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if not slot2 then
		return
	end

	slot0.pos = slot2
	slot0.hero_vo = slot1

	if Config.PartnerSkillData.data_partner_skill_learn and next(slot3) ~= nil then
		slot0.no_vedio_image:setVisible(false)
		slot0.no_vedio_label:setVisible(false)
		slot0:initSkillData(slot3)
	end
end

function HeroTalentSkillLearnPanel.initSkillData(slot0, slot1)
	slot0.skill_list = {}
	slot0.dic_have_skill_id = {}
	slot2 = Config.PartnerSkillData.data_partner_skill_map

	for slot6, slot7 in pairs(slot0.hero_vo.talent_skill_list) do
		if slot2 and slot2[slot7] then
			if slot2[slot2[slot7]] then
				slot0.dic_have_skill_id[slot2[slot8]] = slot6
			else
				slot0.dic_have_skill_id[slot8] = slot6
			end
		else
			slot0.dic_have_skill_id[slot7] = slot6
		end
	end

	career_order_name = {
		[HeroConst.CareerType.eMagician] = "order_magician",
		[HeroConst.CareerType.eWarrior] = "order_warrior",
		[HeroConst.CareerType.eTank] = "order_tank",
		[HeroConst.CareerType.eSsistant] = "order_ssistant"
	}
	slot3 = HeroController:getInstance():getModel():getTalentRedpointRecord()
	slot4 = {}

	if Config.PartnerSkillData.data_partner_commend_skill[slot0.hero_vo.bid] then
		for slot9, slot10 in ipairs(slot5) do
			slot4[slot10] = slot9
		end
	end

	slot0.awakening_count = 0

	for slot9, slot10 in pairs(slot1) do
		slot11 = {
			config = slot10,
			order = slot10.order,
			career_order = slot4[slot10.id]
		}

		if slot5 then
			if slot4[slot10.id] then
				-- Nothing
			else
				slot11.career_order = 1000
			end
		elseif career_order_name[slot0.hero_vo.type] then
			slot11.career_order = slot10[career_order_name[slot0.hero_vo.type]]
		else
			slot11.career_order = 1000
		end

		if slot0.dic_have_skill_id[slot10.id] then
			slot11.order_had = 1
		else
			slot11.order_had = 2
		end

		if slot3[slot10.id] then
			slot11.order_can = 1
		else
			slot11.order_can = 2
		end

		if next(slot10.limit_career) ~= nil then
			if slot0:isShowAwakeningSkill() then
				slot12 = false

				for slot16, slot17 in ipairs(slot10.limit_career[1]) do
					if slot17 == slot0.hero_vo.type then
						slot12 = true

						break
					end
				end

				if slot12 then
					slot11.order_awakening = 1

					uv0(slot0.skill_list, slot11)

					slot0.awakening_count = slot0.awakening_count + 1
				end
			end
		else
			slot11.order_awakening = 2

			uv0(slot0.skill_list, slot11)
		end
	end

	table.sort(slot0.skill_list, SortTools.tableLowerSorter({
		"order_awakening",
		"order_had",
		"order_can",
		"career_order",
		"order"
	}))
	slot0:updateSkillList()
end

function HeroTalentSkillLearnPanel.isShowAwakeningSkill(slot0)
	if slot0.pos == 3 and slot0.hero_vo and uv0.hero_info_upgrade_star_param4 < slot0.hero_vo.star then
		return true
	end

	return false
end

function HeroTalentSkillLearnPanel.initThirteenInfo(slot0)
	if slot0:isShowAwakeningSkill() then
		if not slot0.list_setting then
			return
		end

		if not slot0.awakening_count then
			return
		end

		if slot0.awakening_count % 4 ~= 0 then
			for slot6 = 1, 4 - slot1 do
				uv0(slot0.skill_list, slot0.awakening_count + slot6, {})
			end

			slot0.awakening_count = slot0.awakening_count + 4 - slot1
		end

		slot2 = {}
		slot3 = slot0.list_setting.item_width
		slot6 = slot0.title_height * 2 + math.ceil(#slot0.skill_list / 4) * slot0.list_setting.item_height
		slot7 = 0
		slot8 = 0

		for slot12, slot13 in ipairs(slot0.skill_list) do
			if slot12 == 1 or slot12 == slot0.awakening_count + 1 then
				if slot12 == slot0.awakening_count + 1 then
					slot8 = slot6
				end

				slot6 = slot6 - slot0.title_height
			end

			slot2[slot12] = cc.p((slot12 - 1) % 4 * slot3 + slot3 * 0.5, slot6 - slot4 * 0.5)

			if slot12 > 1 and slot12 % 4 == 0 then
				slot6 = slot6 - slot4
			end
		end

		return slot2, slot5, slot8
	end
end

function HeroTalentSkillLearnPanel.createTitleItem(slot0, slot1, slot2, slot3)
	if not slot0.list_view then
		return
	end

	slot4 = cc.size(128, 50)
	slot5 = {
		bg = createImage(slot0.list_view.scroll_view, PathTool.getResFrame("common", "common_1057"), slot2, slot3 - slot0.title_height * 0.5, cc.p(0.5, 0.5), true, nil, false)
	}

	slot5.bg:setScale(5)

	slot5.label = createLabel(26, cc.c3b(68, 18, 3), nil, slot2, slot3 - slot0.title_height * 0.5, slot1, slot0.list_view.scroll_view, nil, cc.p(0.5, 0.5))
end

function HeroTalentSkillLearnPanel.updateSkillList(slot0)
	if slot0.list_view == nil then
		slot1 = slot0.lay_scrollview:getContentSize()
		slot0.list_setting = {
			start_y = 0,
			row = 0,
			start_x = 0,
			space_x = 0,
			item_height = 158,
			space_y = 0,
			col = 4,
			need_dynamic = true,
			item_width = slot1.width / 4
		}
		slot0.list_setting.position_data_list, slot0.list_setting.container_height, slot5 = slot0:initThirteenInfo()
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1, slot0.list_setting, cc.p(0, 0))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)

		if slot0:isShowAwakeningSkill() then
			slot0:createTitleItem(TI18N("职业专属觉醒天赋"), slot1.width * 0.5, slot4)
			slot0:createTitleItem(TI18N("通用天赋"), slot1.width * 0.5, slot5)
		end
	end

	for slot5, slot6 in ipairs(slot0.skill_list) do
		if nil == nil and slot6.config and slot6.order_had ~= 1 then
			slot1 = slot5

			break
		end
	end

	if slot1 == nil then
		slot1 = 1
	end

	slot0.list_view.time_show_index = slot1

	slot0.list_view:reloadData(nil)
	slot0.list_view:setOnCellTouched(slot1)
end

function HeroTalentSkillLearnPanel.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Widget:create()

	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(0, 0)
	slot3:setContentSize(cc.size(slot1, slot2))

	slot3.skill_item = SkillItem.new(true, true, false, nil, nil, false)

	slot3.skill_item:setPosition(slot1 * 0.5, 90)
	slot3:addChild(slot3.skill_item)
	slot3.skill_item:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function HeroTalentSkillLearnPanel.numberOfCells(slot0)
	if not slot0.skill_list then
		return 0
	end

	return #slot0.skill_list
end

function HeroTalentSkillLearnPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.skill_list[slot2] and slot3.config then
		slot1:setVisible(true)

		if Config.SkillData.data_get_skill(slot3.config.id) then
			slot1.skill_item:setData(slot4)
			slot1.skill_item:showName(true, slot4.name, nil, nil, true)

			if slot3.order_had == 1 then
				slot1.skill_item:showRecommondIcon(true, 2)
			elseif slot3.order_can == 1 then
				slot1.skill_item:showRecommondIcon(true, 5)
			elseif slot3.career_order ~= 1000 then
				slot1.skill_item:showRecommondIcon(true, 1)
			end

			if slot0.select_skill_data and slot0.select_skill_data.config.id == slot3.config.id then
				slot1.skill_item:setSelected(true)
			else
				slot1.skill_item:setSelected(false)
			end
		end
	else
		slot1:setVisible(false)
	end
end

function HeroTalentSkillLearnPanel.onCellTouched(slot0, slot1)
	slot3 = slot0.skill_list[slot1.index]

	if slot0.select_cell then
		slot0.select_cell.skill_item:setSelected(false)
	end

	slot0.select_cell = slot1

	if slot0.select_cell then
		slot0.select_cell.skill_item:setSelected(true)
	end

	slot0:showSkillInfo(slot3)
end

function HeroTalentSkillLearnPanel.showSkillInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.select_skill_data = slot1

	if Config.SkillData.data_get_skill(slot1.config.id) then
		if slot0.skill_item then
			slot0.skill_item:setData(slot2)
		end

		slot0.skill_name:setString(slot2.name)
		slot0.skill_desc:setString(slot2.des)
	end

	slot0:showCostInfo(slot1)
end

function HeroTalentSkillLearnPanel.showCostInfo(slot0, slot1)
	if not slot1 then
		return
	end

	for slot5, slot6 in ipairs(slot0.item_list) do
		slot6:setPositionX(10000)
	end

	slot2 = BackPackItem.Width + 10
	slot3 = -slot2 * #slot1.config.expend / 2 + slot2 * 0.5

	for slot7, slot8 in ipairs(slot1.config.expend) do
		if slot0.item_list[slot7] == nil then
			slot0.item_list[slot7] = BackPackItem.new(true, true)

			slot0.item_list[slot7]:setAnchorPoint(0.5, 0.5)
			slot0.item_list[slot7]:setScale(0.8)
			slot0.cost_node:addChild(slot0.item_list[slot7])
		end

		slot0.item_list[slot7]:setPosition(slot3 + (slot7 - 1) * slot2, 0)

		if Config.ItemData.data_get_data(slot8[1]) then
			slot0.item_list[slot7]:setData(slot10)
			slot0.item_list[slot7]:setNeedNum(slot8[2], BackpackController:getInstance():getModel():getItemNumByBid(slot10.id))
			slot0.item_list[slot7]:setDefaultTip(true, nil, nil, 1)
			slot0.item_list[slot7]:setGoodsName(slot10.name, nil, nil, cc.c4b(68, 18, 3, 255))
		end
	end
end

function HeroTalentSkillLearnPanel.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.skill_item then
		slot0.skill_item:DeleteMe()

		slot0.skill_item = nil
	end

	uv0:openHeroTalentSkillLearnPanel(false)
end
