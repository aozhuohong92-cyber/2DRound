CheckAttrPanel = class("CheckAttrPanel", function ()
	return ccui.Layout:create()
end)

function CheckAttrPanel.ctor(slot0, slot1)
	slot0.data = slot1
	slot0.base_attr = {}
	slot0.other_attr = {}
	slot0.size = cc.size(645, 420)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2 - 10))
	slot0:createAttrPanel()
	slot0:createOtherAttr()
	slot0:updateAttrList()
	slot0:registerEvent()
end

function CheckAttrPanel.registerEvent(slot0)
end

function CheckAttrPanel.createAttrPanel(slot0)
	slot1 = cc.size(623, 426)
	slot0.attr_panel = ccui.Widget:create()

	slot0.attr_panel:setContentSize(slot1)
	slot0:addChild(slot0.attr_panel)
	slot0.attr_panel:setPosition(cc.p(slot0.size.width / 2, 230))
	createImage(slot0.attr_panel, PathTool.getResFrame("common", "common_90024"), slot1.width / 2, slot1.height / 2, cc.p(0.5, 0.5), true, 0, true):setContentSize(slot1)
	createImage(slot0.attr_panel, PathTool.getResFrame("common", "common_90025"), slot1.width / 2, 378, cc.p(0.5, 0), true, 0, true):setContentSize(cc.size(617, 44))

	slot7 = createImage(slot0.attr_panel, PathTool.getResFrame("pokedex", "pokedex_3"), 15, 375, cc.p(0, 0), true, 1, false)

	createLabel(26, Config.ColorData.data_color4[175], nil, 75, 385, "", slot0.attr_panel, 0, cc.p(0, 0)):setString(TI18N("基础属性"))
end

function CheckAttrPanel.createOtherAttr(slot0)
	createImage(slot0.attr_panel, PathTool.getResFrame("common", "common_90025"), slot0.attr_panel:getContentSize().width / 2, 150, cc.p(0.5, 0), true, 0, true):setContentSize(cc.size(617, 44))

	slot5 = createImage(slot0.attr_panel, PathTool.getResFrame("pokedex", "pokedex_4"), 15, 147, cc.p(0, 0), true, 1, false)

	createLabel(26, Config.ColorData.data_color4[175], nil, 75, 157, "", slot0.attr_panel, 0, cc.p(0, 0)):setString(TI18N("其他属性"))
end

function CheckAttrPanel.updateAttrList(slot0)
	if not slot0.data then
		return
	end

	if not Config.PartnerData.data_partner_attr[slot1.bid] then
		return
	end

	for slot9 = 1, 7 do
		slot11 = Config.AttrData.data_key_to_name[({
			"hp_max",
			"add_hp",
			"atk",
			"add_atk",
			"def",
			"add_def",
			"speed"
		})[slot9]] or ""
		slot13 = ({
			"22",
			"37",
			"21",
			"37",
			"23",
			"37",
			"38"
		})[slot9]
		slot14 = false

		if slot9 % 2 == 0 then
			slot11 = ({
				TI18N("生命成长"),
				TI18N("攻击成长"),
				TI18N("防御成长")
			})[math.ceil(slot9 / 2)]
			slot12 = math.ceil((slot2[slot10] or 0) / 10) / 100
			slot14 = true
		end

		if not slot0.base_attr[slot9] then
			slot0.base_attr[slot9] = slot0:createOneAttr(cc.p(40 + (slot9 - 1) % 2 * 300, 370 - math.ceil(slot9 / 2) * 38), slot11, slot12, slot13, slot14)
		end
	end

	slot7 = {
		"39",
		"43",
		"40",
		"42"
	}

	for slot11 = 1, 4 do
		slot13 = Config.AttrData.data_key_to_name[({
			"crit_rate",
			"crit_ratio",
			"hit_magic",
			"dodge_magic"
		})[slot11]] or ""
		slot15 = (slot2[slot12] / 10 or 0) .. "%"
		slot16 = false

		if slot11 % 2 == 0 then
			slot16 = true
		end

		if not slot0.other_attr[slot11] then
			slot0.other_attr[slot11] = slot0:createOneAttr(cc.p(40 + (slot11 - 1) % 2 * 300, 150 - math.ceil(slot11 / 2) * 40), slot13, slot15, slot7[slot11], slot16)
		end
	end
end

function CheckAttrPanel.createOneAttr(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot5 then
		createImage(slot0.attr_panel, PathTool.getResFrame("common", "common_1016"), slot1.x - 20, slot1.y - 5, cc.p(0.5, 0), true, 0, true):setContentSize(cc.size(570, 2))
	end

	slot8 = createLabel(24, Config.ColorData.data_color4[175], nil, 0, 0, slot2, slot0.attr_panel, 2, cc.p(0, 0))

	slot8:setPosition(cc.p(slot1.x + 30, slot1.y))

	slot9 = createLabel(24, Config.ColorData.data_color4[175], nil, 0, 0, slot3, slot0.attr_panel, 2, cc.p(0, 0))

	slot9:setPosition(cc.p(slot1.x + 160, slot1.y))

	return {
		name_label = slot8,
		value_label = slot9,
		icon = createImage(slot0.attr_panel, PathTool.getResFrame("common", "common_900" .. slot4), slot1.x, slot1.y, cc.p(0, 0), true, 0, false)
	}
end

function CheckAttrPanel.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
