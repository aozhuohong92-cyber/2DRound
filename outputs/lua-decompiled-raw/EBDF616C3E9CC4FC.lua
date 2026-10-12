ArtifactListItem = class("ArtifactListItem", function ()
	return ccui.Widget:create()
end)

function ArtifactListItem.ctor(slot0, slot1)
	slot0.width = 600
	slot0.height = 135
	slot0.ctrl = HeroController:getInstance()

	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(slot0.width, slot0.height))
	slot0:setAnchorPoint(cc.p(0.5, 0))

	slot0.index = slot1 or 1
	slot0.skill_list = {}
	slot0.attr_list = {}

	slot0:configUI()
	slot0:registerEvent()
end

function ArtifactListItem.clickHandler(slot0, ...)
	if slot0.call_fun then
		slot0:call_fun(slot0.vo)
	end
end

function ArtifactListItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function ArtifactListItem.configUI(slot0)
	createImage(slot0, PathTool.getResFrame("common", "common_1029"), slot0.width / 2, slot0.height / 2, cc.p(0.5, 0.5), true, 0, true):setContentSize(cc.size(slot0.width, slot0.height))

	slot0.artifact_item = BackPackItem.new(true, true, nil, 0.8)

	slot0:addChild(slot0.artifact_item)
	slot0.artifact_item:setPosition(cc.p(80, 70))

	slot0.reset_btn = createImage(slot0, PathTool.getResFrame("hero", "txt_cn_hero_info_37"), 444, 64, cc.p(0.5, 0.5), true)
	slot0.equip_btn = createImage(slot0, PathTool.getResFrame("hero", "txt_cn_hero_info_38"), 542, 64, cc.p(0.5, 0.5), true)

	slot0.reset_btn:setTouchEnabled(true)
	slot0.equip_btn:setTouchEnabled(true)
	slot0.reset_btn:setVisible(false)
end

function ArtifactListItem.registerEvent(slot0)
	slot0.equip_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:clickHandler()
		end
	end)
	slot0.reset_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.vo then
				uv0.ctrl:openArtifactRecastWindow(true, uv0.vo)
			end
		end
	end)
end

function ArtifactListItem.setExtendData(slot0, slot1)
	slot0.partner_id = slot1
end

function ArtifactListItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.vo = slot1

	slot0.artifact_item:setData(slot1)

	if not slot1.config then
		return
	end

	if slot0.partner_id and slot0.partner_id ~= 0 then
		slot0.equip_btn:loadTexture(PathTool.getResFrame("hero", "txt_cn_hero_info_38"), LOADTEXT_TYPE_PLIST)
	else
		slot0.equip_btn:loadTexture(PathTool.getResFrame("hero", "txt_cn_hero_info_38"), LOADTEXT_TYPE_PLIST)
	end

	for slot5, slot6 in pairs(slot0.attr_list) do
		slot6:setString("")
	end

	slot2 = slot1.attr
	slot3 = 2
	slot5 = 2

	if Config.PartnerArtifactData.data_artifact_data[slot1.config.id] then
		slot5 = slot4.attr_num
	end

	for slot9, slot10 in ipairs(slot2) do
		if slot5 < slot9 then
			break
		end

		slot13 = slot10.attr_val / 1000

		if Config.AttrData.data_key_to_name[Config.AttrData.data_id_to_key[slot10.attr_id]] then
			if not slot0.attr_list[slot9] then
				slot0.attr_list[slot9] = createRichLabel(22, cc.c4b(193, 183, 171, 255), cc.p(0, 0.5), cc.p(20, 28), nil, , 380)

				slot0:addChild(slot0.attr_list[slot9])
			end

			slot0.attr_list[slot9]:setPosition(cc.p(155 + (slot9 - 1) * 170, 90))

			slot16 = PathTool.getAttrIconByStr(slot12)

			if PartnerCalculate.isShowPerByStr(slot12) == true then
				slot13 = slot13 / 10 .. "%"
			end

			slot15:setString(string.format("<img src='%s' scale=1 /> <div fontcolor=#693705> %s:</div><div fontcolor=#693705>%s</div>", PathTool.getResFrame("common", slot16), slot14, slot13))
		end
	end

	for slot9, slot10 in pairs(slot0.skill_list) do
		slot10:setString("")
	end

	slot7 = 1

	for slot11, slot12 in pairs(slot1.extra or {}) do
		if slot12 and slot12.extra_k and (slot12.extra_k == 1 or slot12.extra_k == 2 or slot12.extra_k == 8) then
			if not slot0.skill_list[slot7] then
				slot13 = createRichLabel(22, Config.ColorData.data_color4[156], cc.p(0, 0), cc.p(110, 35), 0, 0, 500)

				slot0:addChild(slot13)

				slot0.skill_list[slot7] = slot13
			end

			slot15 = ""

			if Config.SkillData.data_get_skill(slot12.extra_v or 0) then
				slot15 = string.format("【<div href=xxx>%s</div>】", slot14.name)
			end

			slot0.skill_list[slot7]:setPosition(cc.p(140 + (slot7 - 1) * 110, 35))
			slot0.skill_list[slot7]:setString(slot15)
			slot0.skill_list[slot7]:addTouchLinkListener(function (slot0, slot1, slot2)
				TipsManager:getInstance():showSkillTips(uv0)
			end, {
				"click",
				"href"
			})

			slot7 = slot7 + 1
		end
	end
end

function ArtifactListItem.isHaveData(slot0)
	if slot0.vo then
		return true
	end

	return false
end

function ArtifactListItem.suspendAllActions(slot0)
end

function ArtifactListItem.getData(slot0)
	return slot0.vo
end

function ArtifactListItem.DeleteMe(slot0)
	if slot0.artifact_item then
		slot0.artifact_item:DeleteMe()

		slot0.artifact_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()

	slot0.vo = nil
end
