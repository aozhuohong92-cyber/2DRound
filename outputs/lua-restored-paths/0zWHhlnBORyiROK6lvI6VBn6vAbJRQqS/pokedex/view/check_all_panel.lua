CheckAllPanel = class("CheckAllPanel", function ()
	return ccui.Layout:create()
end)

function CheckAllPanel.ctor(slot0, slot1, slot2)
	slot0.data = slot1
	slot0.point_list = {}
	slot0.skill_list = {}
	slot0.is_pokedex = slot2 or false
	slot0.size = cc.size(620, 420)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))

	slot0.scroll_width = 620
	slot0.scroll_height = 430
	slot0.max_height = 655
	slot0.all_scroll = createScrollView(slot0.scroll_width, slot0.scroll_height, 13, 10, panel, ccui.ScrollViewDir.vertical)

	slot0.all_scroll:setInnerContainerSize(cc.size(600, slot0.max_height))
	slot0:addChild(slot0.all_scroll)
	slot0:createHeroDesc()
	slot0:createHeroSkill()
	slot0:createHeroSource()
	slot0:registerEvent()
end

function CheckAllPanel.registerEvent(slot0)
end

function CheckAllPanel.createHeroDesc(slot0)
	slot1 = cc.size(623, 250)
	slot0.desc_panel = ccui.Widget:create()

	slot0.desc_panel:setContentSize(slot1)
	slot0.all_scroll:addChild(slot0.desc_panel)
	slot0.desc_panel:setPosition(cc.p(slot0.scroll_width / 2, slot0.max_height - 125))

	slot0.max_height = slot0.max_height - 145

	createImage(slot0.desc_panel, PathTool.getResFrame("common", "common_90024"), slot1.width / 2, slot1.height / 2, cc.p(0.5, 0.5), true, 0, true):setContentSize(slot1)
	createImage(slot0.desc_panel, PathTool.getResFrame("common", "common_90025"), slot0.size.width / 2, 200, cc.p(0.5, 0), true, 0, true):setContentSize(cc.size(617, 44))

	slot7 = createImage(slot0.desc_panel, PathTool.getResFrame("pokedex", "pokedex_1"), 15, 195, cc.p(0, 0), true, 1, false)

	createLabel(26, Config.ColorData.data_color4[175], nil, 75, 205, "", slot0.desc_panel, 0, cc.p(0, 0)):setString(TI18N("英雄特色"))
	slot0:updateRightMove()
end

function CheckAllPanel.updateRightMove(slot0)
	if not slot0.data then
		return
	end

	slot2 = slot1.hero_attr
	slot13 = {
		cc.p(math.floor(0 + slot2[1] * math.cos(72 * math.pi / 180) * 2 / 3), math.floor(0 + slot2[1] * math.sin(72 * math.pi / 180) * 2 / 3)),
		cc.p(math.floor(0 + slot2[2] * math.cos(144 * math.pi / 180) * 2 / 3), math.floor(0 + slot2[2] * math.sin(144 * math.pi / 180) * 2 / 3)),
		cc.p(math.floor(0 + slot2[3] * math.cos(216 * math.pi / 180) * 2 / 3), math.floor(0 + slot2[3] * math.sin(216 * math.pi / 180) * 2 / 3)),
		cc.p(math.floor(-4 + slot2[4] * math.cos(288 * math.pi / 180) * 2 / 3), math.floor(-2 + slot2[4] * math.sin(288 * math.pi / 180) * 2 / 3)),
		cc.p(math.floor(3 + slot2[5] * math.cos(360 * math.pi / 180) * 2 / 3), math.floor(-2 + slot2[5] * math.sin(360 * math.pi / 180) * 2 / 3))
	}

	if not slot0.right_bg then
		slot0.right_bg = createSprite(PathTool.getResFrame("pokedex", "pokedex_8"), 160, 95, slot0.desc_panel, cc.p(0.5, 0.5), LOADTEXT_PLIST)
		slot0.temp_sp = createSprite(PathTool.getResFrame("pokedex", "pokedex_9"), 83, 90, slot0.right_bg, cc.p(0.5, 0.5), LOADTEXT_PLIST)
		slot14 = createSprite(PathTool.getResFrame("pokedex", "pokedex_10"), 66, 63, slot0.temp_sp, cc.p(0.5, 0.5), LOADTEXT_PLIST)
	end

	if not slot0.drawNode then
		slot0.drawNode = cc.DrawNode:create()

		slot0.drawNode:setPosition(85, 85)
		slot0.drawNode:setRotation(51)
		slot0.drawNode:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.right_bg:addChild(slot0.drawNode)
	end

	if slot0.drawNode then
		slot0.drawNode:clear()
		slot0.drawNode:drawPolygon(slot13, 5, cc.c4f(0, 0.75, 1, 1), 1, cc.c4f(0, 1, 0, 0))
	end

	if not slot0.temp_sp_3 then
		slot0.temp_sp_3 = createSprite(PathTool.getResFrame("pokedex", "pokedex_11"), 82, 91, slot0.right_bg, cc.p(0.5, 0.5), LOADTEXT_PLIST)
	end

	slot15 = {
		cc.p(100, 4),
		cc.p(36, 90),
		cc.p(-69, 49),
		cc.p(-81, -65),
		cc.p(25, slot19)
	}
	slot19 = -92

	for slot19 = 1, 5 do
		if not slot0.point_list[slot19] then
			createImage(slot0.drawNode, PathTool.getResFrame("pokedex", "pokedex_28"), slot15[slot19].x + 2, slot15[slot19].y - 1, cc.p(0.5, 0.5), true, 0, false):setRotation(-51)

			slot22 = createLabel(20, 141, nil, slot15[slot19].x, slot15[slot19].y - 1, ({
				TI18N("控制"),
				TI18N("生存"),
				TI18N("攻击"),
				TI18N("治疗"),
				TI18N("辅助")
			})[slot19], slot0.drawNode)

			slot22:setAnchorPoint(cc.p(0.5, 0.5))
			slot22:setRotation(-50)

			slot22.ponit_sp = createSprite(PathTool.getResFrame("pokedex", "pokedex_27"), slot13[slot19].x, slot13[slot19].y, slot0.drawNode, cc.p(0.5, 0.5), LOADTEXT_PLIST)
			slot0.point_list[slot19] = slot22
		end

		slot0.point_list[slot19]:setPosition(slot15[slot19].x, slot15[slot19].y - 1)
		slot0.point_list[slot19].ponit_sp:setPosition(slot13[slot19].x, slot13[slot19].y)
	end

	slot22 = 100
	slot17 = createImage(slot0.desc_panel, PathTool.getResFrame("pokedex", "pokedex_12"), 440, slot22, cc.p(0.5, 0.5), true, 0, true)

	slot17:setContentSize(cc.size(285, 143))
	slot17:setCapInsets(cc.rect(43, 44, 1, 1))

	for slot22 = 1, 3 do
	end

	({
		[slot22] = createLabel(24, 175, nil, 395, 120 - (slot22 - 1) * 32, "", slot0.desc_panel)
	})[1]:setString((PartnerConst.Hero_Type[slot1.type or 1] or "") .. TI18N("英雄"))

	if not Config.PartnerData.data_pokedex[slot1.bid] then
		return
	end

	slot18[2]:setString(slot21.group_name or "")
	slot18[3]:setString(slot1.hero_pos or "")
end

function CheckAllPanel.createHeroSkill(slot0)
	slot1 = cc.size(623, 225)
	slot0.skill_panel = ccui.Widget:create()

	slot0.skill_panel:setContentSize(slot1)
	slot0.all_scroll:addChild(slot0.skill_panel)

	slot0.max_height = slot0.max_height - slot1.height

	slot0.skill_panel:setPosition(cc.p(slot0.scroll_width / 2, slot0.max_height))
	createImage(slot0.skill_panel, PathTool.getResFrame("common", "common_90024"), slot1.width / 2, slot1.height / 2, cc.p(0.5, 0.5), true, 0, true):setContentSize(slot1)
	createImage(slot0.skill_panel, PathTool.getResFrame("common", "common_90025"), slot0.size.width / 2, 177, cc.p(0.5, 0), true, 0, true):setContentSize(cc.size(617, 44))

	slot7 = createImage(slot0.skill_panel, PathTool.getResFrame("pokedex", "pokedex_2"), 15, 175, cc.p(0, 0), true, 1, false)

	createLabel(26, Config.ColorData.data_color4[175], nil, 75, 185, "", slot0.skill_panel, 0, cc.p(0, 0)):setString(TI18N("英雄技能"))

	slot10 = {}

	if slot0.is_pokedex == true then
		slot10 = Config.PartnerData.data_pokedex[slot0.data.bid].show_skill
	else
		slot10[1] = (slot9.skills or {})[2]
		slot10[2] = slot9.addition_skill or 0

		if (slot9.addition_skill2 or 0) ~= 0 then
			slot10[3] = slot13
		end
	end

	for slot14 = 1, #slot10 do
		slot15 = Config.SkillData.data_get_skill(slot10[slot14])
		slot16 = false

		if slot14 ~= 1 then
			slot16 = true
		end

		slot17 = slot0:createSkillItem(slot15, slot16, slot14)

		slot0.skill_panel:addChild(slot17)
		slot17:setPosition(cc.p(210 + (slot14 - 1) * 150, 100))
	end
end

function CheckAllPanel.createSkillItem(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	slot4 = ccui.Widget:create()
	slot5 = cc.size(117, 117)

	slot4:setContentSize(slot5)
	slot4:setTouchEnabled(true)
	slot4:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			TipsManager:getInstance():showSkillTips(uv0)
		end
	end)
	createImage(slot4, PathTool.getNormalSkillBg(), slot5.width / 2, slot5.height / 2, cc.p(0.5, 0.5), true, 0, true):setContentSize(slot5)

	slot9 = createImage(slot4, PathTool.getSkillRes(slot1.icon), slot5.width / 2, slot5.height / 2, cc.p(0.5, 0.5), false, 0, false)

	if slot2 == true then
		slot10 = ccui.Layout:create()

		slot10:setContentSize(cc.size(slot5.width - 10, slot5.height - 10))
		slot4:addChild(slot10)
		slot10:setPosition(cc.p(slot5.width / 2, slot5.height / 2))
		slot10:setAnchorPoint(cc.p(0.5, 0.5))
		showLayoutRect(slot10, 80)

		slot12 = createImage(slot4, PathTool.getResFrame("pokedex", "pokedex_29"), slot5.width / 2, slot5.height / 2 + 5, cc.p(0.5, 0.5), true, 0, false)
		slot13 = ccui.Layout:create()

		slot13:setContentSize(cc.size(100, 29))
		slot4:addChild(slot13)
		slot13:setPosition(cc.p(slot5.width / 2, 22))
		slot13:setAnchorPoint(cc.p(0.5, 0.5))
		showLayoutRect(slot13, 120)

		slot15 = nil

		if (slot3 ~= 2 or Config.PartnerData.data_partner_const.skill_unlock) and Config.PartnerData.data_partner_const.skill_unlock_2 then
			createLabel(24, 1, 9, slot5.width / 2, 6, "", slot4, 2, cc.p(0.5, 0)):setString(string.format(TI18N("突破%s解锁"), slot15.val))
		end
	end

	slot10 = 1

	if (slot1.target_multi or 0) == 1 then
		slot10 = 3
	end

	slot13 = createImage(slot4, PathTool.getResFrame("pokedex", "txt_cn_pokedex_" .. slot10), 0, 85, cc.p(0, 0), true, 10, false)

	createLabel(26, Config.ColorData.data_color4[175], nil, slot5.width / 2, -30, "", slot4, 0, cc.p(0.5, 0)):setString(slot1.name)

	return slot4
end

function CheckAllPanel.createHeroSource(slot0)
	slot1 = cc.size(623, 170)
	slot0.source_panel = ccui.Widget:create()

	slot0.source_panel:setContentSize(slot1)
	slot0.all_scroll:addChild(slot0.source_panel)
	slot0.source_panel:setPosition(cc.p(slot0.scroll_width / 2, slot0.max_height - slot1.height - 30))
	createImage(slot0.source_panel, PathTool.getResFrame("common", "common_90024"), slot1.width / 2, slot1.height / 2, cc.p(0.5, 0.5), true, 0, true):setContentSize(slot1)
	createImage(slot0.source_panel, PathTool.getResFrame("common", "common_90025"), slot0.size.width / 2, 121, cc.p(0.5, 0), true, 0, true):setContentSize(cc.size(617, 44))

	slot7 = createImage(slot0.source_panel, PathTool.getResFrame("pokedex", "pokedex_1"), 15, 125, cc.p(0, 0), true, 1, false)

	createLabel(26, Config.ColorData.data_color4[175], nil, 75, 128, "", slot0.source_panel, 0, cc.p(0, 0)):setString(TI18N("来源途径"))

	for slot13, slot14 in pairs(slot0.data.source or {}) do
		if Config.SourceData.data_source_data[slot14] then
			slot18 = createButton(slot0.source_panel, slot15.name or "", 100 + (slot13 - 1) * 170, 60, cc.size(160, 64), PathTool.getResFrame("", "common_1018"), 26, Config.ColorData.data_color4[1])

			slot18:enableOutline(cc.c4b(71, 132, 37, 255), 2)
			slot18:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					TipsController:getInstance():clickSourceBtn(uv0)
				end
			end)
		end
	end
end

function CheckAllPanel.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
