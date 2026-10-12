ArtifactMessagePanel = class("ArtifactMessagePanel", function ()
	return ccui.Widget:create()
end)

function ArtifactMessagePanel.ctor(slot0, slot1)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ArtifactMessagePanel.config(slot0)
	slot0.ctrl = HeroController:getInstance()
	slot0.size = cc.size(440, 400)

	slot0:setContentSize(slot0.size)

	slot0.skill_list = {}
end

function ArtifactMessagePanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/artifact_message_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.top_panel = slot0.root_wnd:getChildByName("top_panel")
	slot0.bottom_panel = slot0.root_wnd:getChildByName("bottom_panel")
	slot0.label_panel = ccui.Widget:create()

	slot0.label_panel:setContentSize(slot0.size)
	slot0.label_panel:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.label_panel:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0.root_wnd:addChild(slot0.label_panel)

	slot0.artifact_item = BackPackItem.new(true, true, nil, 0.9)

	slot0.top_panel:addChild(slot0.artifact_item)
	slot0.artifact_item:setPosition(cc.p(66, 58))

	slot0.name = slot0.top_panel:getChildByName("name")
	slot0.score = slot0.top_panel:getChildByName("score")
	slot0.artifact_type = slot0.top_panel:getChildByName("type")
end

function ArtifactMessagePanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if not slot1.config then
		return
	end

	slot0.artifact_item:setData(slot1)
	slot0.name:setString(slot2.name)

	slot4 = Config.PartnerArtifactData.data_artifact_const

	for slot8, slot9 in pairs(slot1.extra) do
		if slot9 and slot9.extra_k and slot9.extra_k <= 2 and Config.SkillData.data_get_skill(slot9.extra_v) and slot4["skill_score_" .. (slot10.level or 1)] and slot4["skill_score_" .. slot11].val then
			slot3 = 0 + slot4["skill_score_" .. slot11].val
		end
	end

	slot0.score:setString(TI18N("评分：") .. slot3)

	slot5 = TI18N("副战技")

	if slot2.quality == 4 then
		slot5 = TI18N("主战技")
	end

	slot0.artifact_type:setString(TI18N("类型：") .. slot5)
	slot0:updateSkillList()
end

function ArtifactMessagePanel.updateSkillList(slot0)
	if not slot0.data then
		return
	end

	for slot5, slot6 in pairs(slot0.data.extra or {}) do
		if slot6 and slot6.extra_k and slot6.extra_k <= 2 then
			if not slot0.skill_list[slot5] then
				slot0.skill_list[slot5] = slot0:createSkillItem(slot5)
			end

			slot7 = slot0.skill_list[slot5]

			if Config.SkillData.data_get_skill(slot6.extra_v) then
				slot7.skill:setData(slot8)
				slot7.name:setString(slot8.name)
				slot7.desc:setString(slot8.des)
			end
		end
	end
end

function ArtifactMessagePanel.createSkillItem(slot0, slot1)
	slot3 = SkillItem.new(true, true, true, 0.8)

	slot0.bottom_panel:addChild(slot3)
	slot3:setPosition(cc.p(75, 205 - (slot1 - 1) * 135))

	slot5 = createRichLabel(22, cc.c4b(104, 69, 42, 255), cc.p(0, 1), cc.p(135, 222 - (slot1 - 1) * 135), nil, , 300)

	slot0.bottom_panel:addChild(slot5)

	return {
		skill = slot3,
		name = createLabel(22, cc.c4b(168, 56, 188, 255), nil, 135, 227 - (slot1 - 1) * 135, "", slot0.bottom_panel, 1, cc.p(0, 0)),
		desc = slot5
	}
end

function ArtifactMessagePanel.registerEvents(slot0)
end

function ArtifactMessagePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function ArtifactMessagePanel.DeleteMe(slot0)
	if slot0.artifact_item then
		slot0.artifact_item:DeleteMe()

		slot0.artifact_item = nil
	end

	for slot4, slot5 in pairs(slot0.skill_list) do
		if slot5.skill then
			slot5.skill:DeleteMe()
		end
	end

	slot0.skill_list = nil
end
