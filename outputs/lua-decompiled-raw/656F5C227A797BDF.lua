HolyequipmentTotalAttrPanel = HolyequipmentTotalAttrPanel or BaseClass(BaseView)
slot0 = HeroController:getInstance()

function HolyequipmentTotalAttrPanel.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "hero/holyequipment_total_attr_panel"
	slot0.win_type = WinType.Tips
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
end

function HolyequipmentTotalAttrPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.container = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.container_size = slot0.container:getContentSize()
	slot0.panel_bg = slot0.container:getChildByName("panel_bg")
	slot0.panel_bg_size = slot0.panel_bg:getContentSize()
	slot0.base_fight = slot0.container:getChildByName("base_fight")

	slot0.container:getChildByName("base_attr"):setString(TI18N("神装总加成"))

	slot0.attr_panel = slot0.container:getChildByName("attr_panel")

	slot0.attr_panel:getChildByName("key_name"):setString(TI18N("属性加成:"))

	slot0.spe_panel = slot0.container:getChildByName("spe_panel")

	slot0.spe_panel:getChildByName("key_name"):setString(TI18N("特殊效果"))

	slot0.skill_panel = slot0.spe_panel:getChildByName("skill_panel")
end

function HolyequipmentTotalAttrPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 1)
	slot0:addGlobalEvent(HeroEvent.Hero_Vo_Detailed_info, function (slot0)
		if slot0 and slot0.partner_id == uv0.hero_vo.partner_id then
			uv0:setData(slot0)
		end
	end)
end

function HolyequipmentTotalAttrPanel.onClickCloseBtn(slot0)
	uv0:openHolyequipmentTotalAttrPanel(false)
end

function HolyequipmentTotalAttrPanel.openRootWnd(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.suit_data = slot2
	slot0.hero_vo = slot1

	slot0:setData(slot1)
end

function HolyequipmentTotalAttrPanel.setData(slot0, slot1)
	slot0.base_fight:setString(string.format(TI18N("总战力:%s"), slot1.power or 0))

	slot4 = 40
	slot5 = slot0.attr_panel:getContentSize()
	slot8 = 1
	slot9 = slot0.container_size.height - slot0.attr_panel:getPositionY()

	for slot13, slot14 in ipairs({
		"atk",
		"hp",
		"def",
		"speed",
		"crit_rate",
		"crit_ratio",
		"hit_magic",
		"dodge_magic",
		"tenacity",
		"hit_rate",
		"res",
		"dodge_rate",
		"cure",
		"be_cure",
		"dam",
		"dam_p",
		"dam_s",
		"res_p",
		"res_s"
	}) do
		if slot1[slot14] and slot1[slot14] > 0 then
			slot17 = 0

			slot0:createAttrItem((slot8 - 1) % 2 == 0 and slot5.width * 0.25 or slot5.width * 0.75, -(slot4 * 0.5 + math.floor((slot8 - 1) / 2) * slot4), slot14, slot1[slot14])

			slot8 = slot8 + 1
		end
	end

	slot9 = slot9 + slot5.height + (math.floor((slot8 - 1 - 1) / 2) + 1) * slot4

	if slot0.suit_data and next(slot0.suit_data) ~= nil then
		table.sort(slot0.suit_data, function (slot0, slot1)
			return slot0.num < slot1.num
		end)

		slot13 = false
		slot14 = 0

		for slot19, slot20 in ipairs(slot0.suit_data) do
			if slot20.skill_id == 0 then
				slot0:createSkillItem(slot0.container_size.width * 0.5, slot14 - slot4 * 0.5, slot20.skill_desc)

				slot14 = slot14 - slot4
				slot12 = 1 + 1
			else
				slot0.skill_panel:setPositionY(slot14)

				slot14 = slot14 - slot0.skill_panel:getContentSize().height

				slot0:updateSkillID(slot20.skill_id, slot20.skill_desc)

				slot13 = true
			end
		end

		slot0.skill_panel:setVisible(slot13)
		slot0.spe_panel:setPositionY(slot0.container_size.height - slot9)

		slot9 = slot9 + slot5.height - slot14 + 10
	else
		slot0.spe_panel:setVisible(false)

		slot9 = slot9 + 10
	end

	slot0.panel_bg:setContentSize(cc.size(slot0.panel_bg_size.width, slot9))
	slot0.container:setPositionY(slot0.container:getPositionY() - (slot0.container_size.height - slot9) * 0.5)
end

function HolyequipmentTotalAttrPanel.createAttrItem(slot0, slot1, slot2, slot3, slot4)
	slot5 = {
		bg = createImage(slot0.attr_panel, PathTool.getResFrame("common", "common_90058"), slot1, slot2, cc.p(0.5, 0.5), true, 0, true)
	}
	slot6 = cc.size(260, 35)

	slot5.bg:setContentSize(slot6)
	slot5.bg:setOpacity(128)
	slot5.bg:setCapInsets(cc.rect(15, 15, 1, 1))

	slot5.key_label = createRichLabel(22, cc.c4b(224, 191, 152, 255), cc.p(0, 0.5), cc.p(slot1 - slot6.width * 0.5 + 10, slot2), nil, , 380)

	slot0.attr_panel:addChild(slot5.key_label, 2)

	slot8, slot9, slot10 = commonGetAttrInfoByKeyValue(slot3, slot4)

	slot5.key_label:setString(string.format("<img src='%s' scale=1 /><div fontcolor=#e0bf98> %s：</div>", slot8, slot9))

	slot5.val_label = createLabel(22, cc.c4b(224, 191, 152, 255), nil, slot1 + slot6.width * 0.5 - 10, slot2, slot10, slot0.attr_panel, nil, cc.p(1, 0.5))

	slot5.val_label:setZOrder(2)
end

function HolyequipmentTotalAttrPanel.createSkillItem(slot0, slot1, slot2, slot3)
	slot4 = {
		bg = createImage(slot0.spe_panel, PathTool.getResFrame("common", "common_90058"), slot1, slot2, cc.p(0.5, 0.5), true, 0, true)
	}
	slot5 = cc.size(530, 35)

	slot4.bg:setOpacity(128)
	slot4.bg:setContentSize(slot5)
	slot4.bg:setCapInsets(cc.rect(15, 15, 1, 1))

	slot4.skill_label = createLabel(22, cc.c4b(224, 191, 152, 255), nil, slot1 - slot5.width * 0.5 + 10, slot2, slot3, slot0.spe_panel, nil, cc.p(0, 0.5))

	slot4.skill_label:setZOrder(2)
end

function HolyequipmentTotalAttrPanel.updateSkillID(slot0, slot1, slot2)
	slot0.skill_panel:getChildByName("skill_dec1"):setString(slot2)

	if Config.SkillData.data_get_skill(slot1) then
		if slot0.skill_item == nil then
			slot0.skill_item = SkillItem.new(true, true, true, 0.8)

			slot0.skill_item:showLockIcon(false)
			slot0.skill_item:setPosition(16, 6)
			slot0.skill_panel:getChildByName("skill_node"):addChild(slot0.skill_item)
		end

		slot0.skill_item:setData(slot4)

		if slot0.skill_desc == nil then
			slot0.skill_desc = createRichLabel(20, cc.c4b(189, 167, 141, 255), cc.p(0, 1), cc.p(144, 96), 4, nil, 370)

			slot0.skill_panel:addChild(slot0.skill_desc)
		end

		slot0.skill_desc:setString(slot4.des)
	end
end

function HolyequipmentTotalAttrPanel.close_callback(slot0)
	uv0:openHolyequipmentTotalAttrPanel(false)
end
