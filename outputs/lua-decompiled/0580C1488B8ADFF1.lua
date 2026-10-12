slot0 = HeroController:getInstance()
HeroSkinUpgradePreviewWindow = HeroSkinUpgradePreviewWindow or BaseClass(BaseView)

function HeroSkinUpgradePreviewWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "hero/hero_skin_upgrade_preview_window"
end

function HeroSkinUpgradePreviewWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.btn_close = slot0.container:getChildByName("btn_close")

	slot0.container:getChildByName("win_title"):setString(TI18N("升级预览"))

	slot0.list_container = slot0.container:getChildByName("scroll_view")

	slot0.list_container:setBounceEnabled(true)
	slot0.list_container:setScrollBarEnabled(false)

	slot0.container_size = slot0.list_container:getContentSize()
end

function HeroSkinUpgradePreviewWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openHeroSkinUpgradePreviewWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHeroSkinUpgradePreviewWindow(false)
	end, false, 2)
end

function HeroSkinUpgradePreviewWindow.openRootWnd(slot0, slot1, slot2)
	if not Config.PartnerSkinData.data_skin_info[slot1.config.first_id] then
		return
	end

	slot6 = {}

	while true do
		if Config.PartnerSkinData.data_skin_info[slot4] then
			table.insert(slot6, slot7)

			slot4 = slot7.next_id
		else
			break
		end
	end

	slot7 = {}

	for slot12, slot13 in ipairs(slot6) do
		slot14 = slot0:createItem(slot13)
		slot8 = slot14.height + 0

		table.insert(slot7, slot14)
	end

	if slot8 + (#slot7 - 1) * 20 < slot0.container_size.height then
		slot8 = slot0.container_size.height
	end

	slot12 = cc.size

	slot0.list_container:setInnerContainerSize(slot12(slot0.container_size.width, slot8))

	for slot12, slot13 in ipairs(slot7) do
		slot0.list_container:addChild(slot13.root)
		slot13.root:setPositionY(slot8)

		slot8 = slot8 - slot13.height - 20
	end
end

function HeroSkinUpgradePreviewWindow.createItem(slot0, slot1)
	slot2 = {}
	slot10 = 0
	slot11 = 0
	slot5 = createLabel(24, cc.c3b(255, 255, 255), nil, slot10, slot11, string.format("等级：%s", slot1.level), ccui.Layout:create(), nil, cc.p(0, 1))

	for slot10, slot11 in ipairs(slot1.skin_attr) do
		slot12, slot13, slot14 = commonGetAttrInfoByKeyValue(slot11[1], slot11[2])
		slot6 = "" .. string.format("<img src='%s' scale=1 /> %s + %s", slot12, slot13, slot14) .. "    "
	end

	slot13, slot14 = nil
	slot7 = createRichLabel(22, cc.c3b(197, 185, 158), cc.p(0, 1), cc.p(16, 0 - slot5:getContentSize().height - 10), slot13, slot14, 99999)

	slot7:setString(slot6)
	slot3:addChild(slot7)

	slot2.root = slot3
	slot8 = slot7:getContentSize().height + slot5:getContentSize().height + 10

	for slot13, slot14 in pairs(slot0:getRelpaceSkill(slot1.skin_id)) do
		slot16 = Config.SkillData.data_get_skill(slot14)

		if Config.SkillData.data_get_skill(slot13) and slot16 then
			slot17 = 0.7
			slot18 = 0 - slot8 - SkillItem.Height * slot17 * 0.5 - 10
			slot19 = 30 + SkillItem.Width * slot17 * 0.5 - 10
			slot20 = SkillItem.new(false, true, true, slot17, true)

			slot20:setPosition(cc.p(slot19, slot18))
			slot20:setData(slot15)
			slot3:addChild(slot20)
			createImage(slot3, PathTool.getResFrame("common", "common_90034"), slot19 + 100, slot18, cc.p(0.5, 0.5), true, 999, false)

			slot21 = SkillItem.new(false, true, true, slot17, true)

			slot21:setPosition(cc.p(slot19 + 200, slot18))
			slot21:setData(slot16)
			slot3:addChild(slot21)

			slot8 = slot8 + 10 + SkillItem.Height * slot17
		end
	end

	slot10 = createImage(slot3, PathTool.getResFrame("common", "common_1016"), 8, 0 - slot8 - 10, cc.p(0, 0.5), true, 999, false)

	slot10:setScaleX(23.5)
	slot10:setScaleY(0.75)

	slot2.height = slot8 + 10

	return slot2
end

function HeroSkinUpgradePreviewWindow.getRelpaceSkill(slot0, slot1)
	for slot6, slot7 in pairs(Config.PartnerSkinData.data_skilltonewskill) do
		if string.find(slot6, slot1 .. "_") == 1 and #Split(slot6, "_") == 2 and tonumber(slot9[2]) ~= slot7 then
			-- Nothing
		end
	end

	return {
		[tonumber(slot9[2])] = slot7
	}
end

function HeroSkinUpgradePreviewWindow.setData(slot0)
end

function HeroSkinUpgradePreviewWindow.close_callback(slot0)
	slot0.list_container:removeAllChildren()
	uv0:openHeroSkinUpgradePreviewWindow(false)
end
