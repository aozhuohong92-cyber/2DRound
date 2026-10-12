ArtifactComTipsWindow = ArtifactComTipsWindow or BaseClass(BaseView)
slot0 = HeroController:getInstance()

function ArtifactComTipsWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "hero/artifact_com_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
end

function ArtifactComTipsWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.container = slot0.main_panel:getChildByName("container")
	slot0.base_panel = slot0.container:getChildByName("base_panel")
	slot0.equip_item = BackPackItem.new(true, true, nil, 1, false)

	slot0.equip_item:setPosition(cc.p(72, 68))
	slot0.base_panel:addChild(slot0.equip_item)

	slot0.name = slot0.base_panel:getChildByName("name")
	slot0.equip_type = slot0.base_panel:getChildByName("equip_type")
	slot0.baseattr_panel = slot0.container:getChildByName("baseattr_panel")
	slot0.attr_text = createRichLabel(22, cc.c3b(255, 238, 221), cc.p(0, 1), cc.p(14, 90), 15, nil, 370)

	slot0.baseattr_panel:addChild(slot0.attr_text)

	slot0.line = slot0.container:getChildByName("line")
	slot0.skill_panel = slot0.container:getChildByName("skill_panel")
	slot0.skill_text = createRichLabel(22, cc.c3b(255, 238, 221), cc.p(0, 1), cc.p(14, 190), 8, nil, 370)

	slot0.skill_panel:addChild(slot0.skill_text)

	slot0.close_btn = slot0.container:getChildByName("close_btn")
end

function ArtifactComTipsWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openArtifactComTipsWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openArtifactComTipsWindow(false)
	end, false, 2)
end

function ArtifactComTipsWindow.openRootWnd(slot0, slot1)
	slot0.artifact_bid = slot1

	slot0:setBaseInfo()
	slot0:setAttrAndSkillInfo()
end

function ArtifactComTipsWindow.setBaseInfo(slot0)
	if not slot0.artifact_bid then
		return
	end

	if not Config.ItemData.data_get_data(slot0.artifact_bid) then
		return
	end

	slot0.equip_item:setBaseData(slot0.artifact_bid)

	slot2 = 0

	if slot1.quality >= 0 and slot1.quality <= 5 then
		slot2 = slot1.quality
	end

	loadSpriteTexture(slot0.base_panel, PathTool.getResFrame("tips", "tips_" .. slot2), LOADTEXT_TYPE_PLIST)
	slot0.name:setTextColor(BackPackConst.getEquipTipsColor(slot2))
	slot0.name:setString(slot1.name)
	slot0.equip_type:setString(TI18N("类型：") .. slot1.type_desc)
end

function ArtifactComTipsWindow.setAttrAndSkillInfo(slot0)
	if not slot0.artifact_bid then
		return
	end

	if not Config.PartnerArtifactData.data_artifact_data[slot0.artifact_bid] then
		return
	end

	slot0.attr_text:setString(slot1.arrt_desc or "")
	slot0.skill_text:setString(slot1.skill_desc or "")

	slot2 = slot0.container:getContentSize()
	slot3 = slot0.base_panel:getContentSize()
	slot4 = 50 + slot0.attr_text:getSize().height
	slot6 = 50 + slot0.skill_text:getSize().height
	slot8 = 4
	slot9 = 10
	slot10 = 20
	slot2.height = slot8 + slot3.height + slot4 + slot9 + slot6 + slot10

	slot0.container:setContentSize(slot2)
	slot0.base_panel:setPositionY(slot2.height - slot8)
	slot0.baseattr_panel:setPositionY(slot2.height - slot8 - slot3.height)
	slot0.line:setPositionY(slot2.height - slot8 - slot3.height - slot4 - slot9 / 2)
	slot0.skill_panel:setPositionY(slot10 + slot6)
	slot0.close_btn:setPositionY(slot2.height - 25)
end

function ArtifactComTipsWindow.close_callback(slot0)
	if slot0.equip_item then
		slot0.equip_item:DeleteMe()

		slot0.equip_item = nil
	end

	uv0:openArtifactComTipsWindow(false)
end
