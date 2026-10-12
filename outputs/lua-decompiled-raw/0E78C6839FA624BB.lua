HeroUpgradeStarExhibitionPanel = HeroUpgradeStarExhibitionPanel or BaseClass(BaseView)
slot0 = table.insert
slot1 = string.format

function HeroUpgradeStarExhibitionPanel.__init(slot0, slot1, slot2)
	slot0.ctrl = slot1
	slot0.win_type = WinType.Mini
	slot0.layout_name = "hero/hero_upgrade_star_exhibition_panel"
	slot0.view_tag = ViewMgrTag.MSG_TAG
	slot0.is_csb_action = true
	slot0.res_list = {}
	slot0.attr_list = {}
end

function HeroUpgradeStarExhibitionPanel.open_callback(slot0)
	slot1 = slot0.root_wnd:getChildByName("backpanel")

	slot1:setScale(display.getMaxScale())

	slot0.background = slot1:getChildByName("background")
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot2 = slot0.main_container:getContentSize()
	slot0.back_panel = slot0.main_container:getChildByName("back_panel")
	slot0.title_container = slot0.root_wnd:getChildByName("titlepanel"):getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot4 = slot0.main_container:getChildByName("attr_panel")
	slot0.attr_labe_left_list = {}
	slot0.attr_labe_right_list = {}

	for slot8 = 1, 5 do
		slot0.attr_labe_left_list[slot8] = slot4:getChildByName("attr_label_left" .. slot8)
		slot0.attr_labe_right_list[slot8] = slot4:getChildByName("attr_label_right" .. slot8)
	end

	slot0.left_item = HeroExhibitionItem.new(1, false)
	slot0.right_item = HeroExhibitionItem.new(1, false)

	slot0.left_item:setPosition(0, 0)
	slot0.left_item:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.right_item:setPosition(0, 0)
	slot0.right_item:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.main_container:getChildByName("hero_node"):getChildByName("left_node"):addChild(slot0.left_item)
	slot0.main_container:getChildByName("hero_node"):getChildByName("right_node"):addChild(slot0.right_item)

	slot0.skill_node = slot0.main_container:getChildByName("skill_node")
	slot0.arrow = slot0.skill_node:getChildByName("arrow_1086")

	slot0.main_container:getChildByName("common_90044"):getChildByName("attr_label"):setString(TI18N("属性提升"))
	slot0.main_container:getChildByName("common_90044_0"):getChildByName("skill_label"):setString(TI18N("技能提升"))

	slot0.exit_tips_label = slot0.main_container:getChildByName("exit_tips_label")

	slot0.exit_tips_label:setString(TI18N("点击任意处关闭"))
end

function HeroUpgradeStarExhibitionPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 1)
end

function HeroUpgradeStarExhibitionPanel._onClickBtnClose(slot0)
	slot0.ctrl:openHeroUpgradeStarExhibitionPanel(false)

	if not slot0.new_data or slot0.new_data.star ~= 13 then
		GlobalEvent:getInstance():Fire(BattleEvent.NEXT_SHOW_RESULT_VIEW)
	end
end

function HeroUpgradeStarExhibitionPanel.openRootWnd(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	BattleResultMgr:getInstance():setWaitShowPanel(true)
	playOtherSound("c_get")

	slot0.old_data = slot1
	slot0.new_data = slot2

	slot0:handleEffect(true, open_type)
	slot0:updateHead()
	slot0:updateAttrList()
end

function HeroUpgradeStarExhibitionPanel.updateHead(slot0)
	slot0.left_item:setData(slot0.old_data)
	slot0.right_item:setData(slot0.new_data)
end

function HeroUpgradeStarExhibitionPanel.updateAttrList(slot0)
	if not Config.PartnerData.data_partner_star(getNorKey(slot0.old_data.bid, slot0.old_data.star)) or not Config.PartnerData.data_partner_star(getNorKey(slot0.new_data.bid, slot0.new_data.star)) then
		return
	end

	slot10 = slot0.new_data.power

	uv0({}, {
		left_value = slot0.old_data.power,
		right_value = slot10
	})

	for slot10, slot11 in ipairs({
		"hp",
		"atk",
		"def",
		"speed"
	}) do
		uv0(slot5, {
			left_value = uv1("%s: %s", Config.AttrData.data_key_to_name[slot11], slot0.old_data[slot11] or 0),
			right_value = slot0.new_data[slot11] or 0
		})
	end

	for slot10, slot11 in ipairs(slot5) do
		slot0.attr_labe_left_list[slot10]:setString(slot11.left_value)
		slot0.attr_labe_right_list[slot10]:setString(slot11.right_value)
	end

	slot7 = nil
	slot8 = {}
	slot9 = {
		[slot14[1]] = slot14[2]
	}

	for slot13, slot14 in ipairs(slot2.skills) do
		-- Nothing
	end

	for slot13, slot14 in ipairs(slot4.skills) do
		if slot14[1] ~= 1 then
			if slot9[slot14[1]] then
				if slot9[slot14[1]] ~= slot14[2] then
					if slot7 == nil then
						slot7 = slot9[slot14[1]]
					end

					uv0(slot8, slot14[2])
				end
			else
				if slot7 == nil then
					slot7 = slot9[slot14[1]]
				end

				uv0(slot8, slot14[2])
			end
		end
	end

	slot11 = 0.8

	if #slot8 > 0 then
		if slot10 == 1 and slot7 ~= nil then
			slot0.left_skill_item = SkillItem.new(true, false, nil, slot11, true)
			slot0.right_skill_item = SkillItem.new(true, false, nil, slot11, true)

			slot0.left_skill_item:setPosition(cc.p(-140, 0))
			slot0.right_skill_item:setPosition(cc.p(140, 0))
			slot0.left_skill_item:setData({
				skill_id = slot7
			})
			slot0.right_skill_item:setData({
				skill_id = slot8[1]
			})
			slot0.skill_node:addChild(slot0.left_skill_item)
			slot0.skill_node:addChild(slot0.right_skill_item)
		else
			slot0.arrow:setVisible(false)

			slot12 = SkillItem.Width * slot11 + 10
			slot0.skill_list = {}

			for slot17, slot18 in ipairs(slot8) do
				slot19 = SkillItem.new(true, false, nil, slot11, true)

				slot19:setPosition(-slot12 * slot10 * 0.5 + slot12 * 0.5 + (slot17 - 1) * slot12, 0)
				slot19:setData({
					skill_id = slot18
				})
				slot0.skill_node:addChild(slot19)
				uv0(slot0.skill_list, slot19)
			end
		end
	else
		slot0.arrow:setVisible(false)
		createLabel(24, Config.ColorData.data_color4[1], nil, 0, 0, TI18N("无技能提升"), slot0.skill_node, 2, cc.p(0.5, 0.5))
	end
end

function HeroUpgradeStarExhibitionPanel.handleEffect(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(103), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_5)

		slot0.title_container:addChild(slot0.play_effect)
	end
end

function HeroUpgradeStarExhibitionPanel.close_callback(slot0)
	slot0:handleEffect(false)

	if slot0.left_item then
		slot0.left_item:DeleteMe()

		slot0.left_item = nil
	end

	if slot0.right_item then
		slot0.right_item:DeleteMe()

		slot0.right_item = nil
	end

	if slot0.left_skill_item then
		slot0.left_skill_item:DeleteMe()

		slot0.left_skill_item = nil
	end

	if slot0.right_skill_item then
		slot0.right_skill_item:DeleteMe()

		slot0.right_skill_item = nil
	end

	if slot0.skill_list then
		for slot4, slot5 in ipairs(slot0.skill_list) do
			slot5:DeleteMe()
		end

		slot0.skill_list = nil
	end

	if slot0.new_data.star > 0 then
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Update_Star_Close_Event, slot0.new_data)
	end

	slot0.ctrl:openHeroUpgradeStarExhibitionPanel(false)
end

function HeroUpgradeStarExhibitionPanel.onExitAnim(slot0)
	GlobalEvent:getInstance():Fire(EventId.CAN_OPEN_LEVUPGRADE, true)
	GlobalEvent:getInstance():Fire(PokedexEvent.Call_End_Event)
end
