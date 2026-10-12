ArtifactSkillWindow = ArtifactSkillWindow or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = table.insert
slot3 = {
	HIGH = 3,
	LOW = 1,
	MEDIUM = 2,
	SPECIAL = 4
}

function ArtifactSkillWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "forgehouse/artifact_skill_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("artifact", "artifact"),
			type = ResourcesType.plist
		}
	}
	slot0.tab_list = {}
	slot0.title_height = 60
end

function ArtifactSkillWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	print("背景图片--------------------------------------", slot0.background)

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1
	slot6 = 1

	slot0:playEnterAnimatianByObj(slot1, slot6)
	slot1:getChildByName("win_title"):setString(TI18N("技能预览"))

	slot0.explain_btn = slot1:getChildByName("explain_btn")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot2 = slot1:getChildByName("tab_container")

	for slot6 = 1, 4 do
		slot7 = {
			tab_btn = slot8,
			label = slot2:getChildByName("title_" .. slot6)
		}

		if slot2:getChildByName("tab_btn_" .. slot6) then
			slot7.label:setTextColor(cc.c3b(215, 226, 227))

			slot7.index = slot6
			slot0.tab_list[slot6] = slot7

			if slot6 == uv0.LOW then
				slot9:setString(TI18N("低级技能"))
			elseif slot6 == uv0.MEDIUM then
				slot9:setString(TI18N("中级技能"))
			elseif slot6 == uv0.HIGH then
				slot9:setString(TI18N("高级技能"))
			elseif slot6 == uv0.SPECIAL then
				slot9:setString(TI18N("超级技能"))
			end
		end
	end

	slot0.skill_panel = slot1:getChildByName("skill_panel")
end

function ArtifactSkillWindow.register_event(slot0)
	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1)
		if Config.PartnerArtifactData.data_artifact_const.recastskill_rule then
			TipsManager:getInstance():showCommonTips(slot2.desc, slot1:getTouchBeganPosition())
		end
	end)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openArtifactSkillWindow(false)
	end, nil, 2)

	function slot4()
		uv0:openArtifactSkillWindow(false)
	end

	slot5 = nil

	registerButtonEventListener(slot0.background, slot4, slot5, 2)

	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end
end

function ArtifactSkillWindow.changeSelectedTab(slot0, slot1)
	if slot0.tab_object and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot2 = PathTool.getResFrame("common", "common_2023")

		if slot0.tab_object.index == uv0.MEDIUM then
			slot2 = PathTool.getResFrame("common", "common_2022")
		end

		slot0.tab_object.tab_btn:loadTextures(slot2, "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.label:setTextColor(cc.c3b(215, 226, 227))
		slot0.tab_object.label:enableOutline(cc.c3b(2, 0, 25), 2)

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot2 = PathTool.getResFrame("common", "common_2021")

		if slot0.tab_object.index == uv0.MEDIUM then
			slot2 = PathTool.getResFrame("common", "common_2024")
		end

		slot0.tab_object.tab_btn:loadTextures(slot2, "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.label:setTextColor(cc.c4b(255, 255, 255))
		slot0.tab_object.label:enableOutline(cc.c3b(2, 0, 25), 2)
	end

	slot2 = nil
	slot0.show_list = {}
	slot0.awakenig_list = {}

	for slot7, slot8 in ipairs(slot0.show_type == 2 and (Config.PartnerSkillData.data_partner_skill_view[slot1] or {}) or Config.PartnerArtifactData.data_artifact_skill[slot1] or {}) do
		if Config.SkillData.data_get_skill(slot8) or {} then
			if Config.PartnerSkillData.data_partner_awakening_skill[slot8] then
				uv1(slot0.awakenig_list, slot9)
			else
				uv1(slot0.show_list, slot9)
			end
		end
	end

	slot4 = {}

	for slot8, slot9 in ipairs(slot0.show_list) do
		slot10 = 3

		if uv2:checkIsUnusualSkillById(slot9.bid) then
			slot10 = 1
		elseif uv2:checkIsUnusualSkillById2(slot9.bid) then
			slot10 = 2
		end

		uv1(slot4, {
			vo = slot9,
			sort = slot10
		})
	end

	slot10 = "sort"

	table.sort(slot4, SortTools.KeyLowerSorter(slot10))

	slot5 = {}

	for slot9, slot10 in ipairs(slot4) do
		uv1(slot5, slot10.vo)
	end

	slot0.show_list = slot5

	slot0:updateScrollview()
end

function ArtifactSkillWindow.isShowAwakeningSkill(slot0)
	if slot0.is_showAwakeningSkill == nil then
		for slot5, slot6 in pairs(uv0:getHadHeroInfo()) do
			if slot6 >= 13 then
				slot0.is_showAwakeningSkill = true

				return true
			end
		end

		slot0.is_showAwakeningSkill = false

		return false
	end

	return slot0.is_showAwakeningSkill
end

function ArtifactSkillWindow.openRootWnd(slot0, slot1, slot2)
	slot0.show_type = slot1 or 1
	slot2 = slot2 or uv0.LOW

	if slot0.show_type == 2 then
		slot0.explain_btn:setVisible(false)
	end

	slot0:changeSelectedTab(slot2)
end

function ArtifactSkillWindow.initThirteenInfo(slot0)
	if #slot0.awakenig_list > 0 and slot0:isShowAwakeningSkill() then
		if not slot0.list_setting then
			return
		end

		slot2 = #slot0.awakenig_list % slot0.list_setting.col

		for slot6, slot7 in ipairs(slot0.awakenig_list) do
			uv0(slot0.show_list, slot6, slot7)
		end

		if slot2 ~= 0 then
			for slot7 = 1, slot0.list_setting.col - slot2 do
				uv0(slot0.show_list, slot1 + slot7, {})
			end

			slot1 = slot1 + slot0.list_setting.col - slot2
		end

		slot3 = {}
		slot4 = slot0.list_setting.item_width
		slot6 = math.ceil(#slot0.show_list / slot0.list_setting.col)
		slot8 = slot0.title_height * 2 + slot6 * slot0.list_setting.item_height + slot0.list_setting.start_y * 2 + (slot6 - 1) * slot0.list_setting.space_y - slot0.list_setting.start_y
		slot9 = 0
		slot10 = 0

		for slot14, slot15 in ipairs(slot0.show_list) do
			if slot14 == 1 or slot14 == slot1 + 1 then
				if slot14 == slot1 + 1 then
					slot10 = slot8
				end

				slot8 = slot8 - slot0.title_height
			end

			slot3[slot14] = cc.p(slot0.list_setting.start_x + (slot14 - 1) % slot0.list_setting.col * (slot4 + slot0.list_setting.space_x) + slot4 * 0.5, slot8 - slot5 * 0.5)

			if slot14 > 1 and slot14 % slot0.list_setting.col == 0 then
				slot8 = slot8 - (slot5 + slot0.list_setting.space_y)
			end
		end

		return slot3, slot7, slot10
	end
end

function ArtifactSkillWindow.createTitleItem(slot0, slot1, slot2, slot3)
	if not slot0.skill_scrollview then
		return
	end

	slot4 = cc.size(128, 50)
	slot5 = {
		bg = createImage(slot0.skill_scrollview.scroll_view, PathTool.getResFrame("common", "common_1057"), slot2, slot3 - slot0.title_height * 0.5, cc.p(0.5, 0.5), true, nil, false)
	}

	slot5.bg:setScale(5)

	slot5.label = createLabel(26, cc.c3b(100, 50, 35), nil, slot2, slot3 - slot0.title_height * 0.5, slot1, slot0.skill_scrollview.scroll_view, nil, cc.p(0.5, 0.5))
end

function ArtifactSkillWindow.updateScrollview(slot0)
	if slot0.skill_scrollview == nil then
		slot0.list_setting = {
			start_y = 5,
			item_height = 149,
			start_x = 5,
			space_y = 12,
			col = 4,
			space_x = 32,
			row = 0,
			item_width = 119
		}
		slot0.list_setting.position_data_list, slot0.list_setting.container_height, slot4 = slot0:initThirteenInfo()
		slot0.skill_scrollview = CommonScrollViewSingleLayout.new(slot0.skill_panel, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.skill_panel:getContentSize(), slot0.list_setting, cc.p(0, 0))

		slot0.skill_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.skill_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.skill_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

		if #slot0.awakenig_list > 0 and slot0:isShowAwakeningSkill() then
			slot0:createTitleItem(TI18N("职业专属觉醒天赋"), slot1.width * 0.5, slot3)
			slot0:createTitleItem(TI18N("通用天赋"), slot1.width * 0.5, slot4)
		end
	elseif #slot0.awakenig_list > 0 and slot0:isShowAwakeningSkill() then
		slot2 = #slot0.awakenig_list % slot0.list_setting.col

		for slot6, slot7 in ipairs(slot0.awakenig_list) do
			uv0(slot0.show_list, slot6, slot7)
		end

		if slot2 ~= 0 then
			for slot7 = 1, slot0.list_setting.col - slot2 do
				uv0(slot0.show_list, slot1 + slot7, {})
			end
		end
	end

	slot0.skill_scrollview:reloadData()
end

function ArtifactSkillWindow.createNewCell(slot0, slot1, slot2)
	return ArtifactSkillItem.new()
end

function ArtifactSkillWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArtifactSkillWindow.updateCellByIndex(slot0, slot1, slot2)
	if slot0.show_list[slot2] then
		slot1:setVisible(true)
		slot1:setData(slot3)
	else
		slot1:setVisible(false)
	end
end

function ArtifactSkillWindow.close_callback(slot0)
	if slot0.skill_scrollview then
		slot0.skill_scrollview:DeleteMe()

		slot0.skill_scrollview = nil
	end

	uv0:openArtifactSkillWindow(false)
end

ArtifactSkillItem = class("ArtifactSkillItem", function ()
	return ccui.Widget:create()
end)

function ArtifactSkillItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ArtifactSkillItem.configUI(slot0)
	slot0.size = cc.size(119, 149)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("forgehouse/artifact_skill_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.skill_name = slot0.container:getChildByName("skill_name")
end

function ArtifactSkillItem.register_event(slot0)
end

function ArtifactSkillItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.skill_name:setString(slot1.name)

	if not slot0.skill_item then
		slot0.skill_item = SkillItem.new(true, true, true, nil, nil, false)

		slot0.skill_item:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2 + 15))
		slot0.container:addChild(slot0.skill_item)
	end

	slot0.skill_item:setData(slot1)

	slot2 = false
	slot3 = 1

	if uv0:checkIsUnusualSkillById(slot1.bid) then
		slot2 = true
	elseif uv0:checkIsUnusualSkillById2(slot1.bid) then
		slot2 = true
		slot3 = 2
	end

	slot0.skill_item:showUnusualIcon(slot2, slot3)
end

function ArtifactSkillItem.DeleteMe(slot0)
	if slot0.skill_item then
		slot0.skill_item:DeleteMe()

		slot0.skill_item = nil
	end
end
