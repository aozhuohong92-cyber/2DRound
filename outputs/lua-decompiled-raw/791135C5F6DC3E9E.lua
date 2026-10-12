HeroResonateSelectTalentSkillPanel = HeroResonateSelectTalentSkillPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format

function HeroResonateSelectTalentSkillPanel.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
	slot0.layout_name = "hero/hero_resonate_select_talent_skill_panel"
	slot0.dic_skill_config = {}
end

function HeroResonateSelectTalentSkillPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("选择技能"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")
	slot0.comfirm_btn_label = slot0.comfirm_btn:getChildByName("label")

	slot0.comfirm_btn_label:setString(TI18N("确 定"))

	slot0.cancel_btn = slot0.main_container:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.tab_container = slot0.main_container:getChildByName("tab_container")
	slot2 = {
		TI18N("低级技能"),
		TI18N("中级技能"),
		TI18N("高级技能")
	}
	slot0.tab_list = {}

	for slot6 = 1, 3 do
		if slot0.tab_container:getChildByName("tab_btn_" .. slot6) then
			slot8 = {
				select_bg = slot7:getChildByName("select_bg")
			}

			slot8.select_bg:setVisible(false)

			slot8.unselect_bg = slot7:getChildByName("unselect_bg")
			slot8.title = slot7:getChildByName("title")

			slot8.title:setTextColor(cc.c4b(207, 181, 147, 255))

			if slot2[slot6] then
				slot8.title:setString(slot2[slot6])
			end

			slot8.tab_btn = slot7
			slot8.index = slot6
			slot0.tab_list[slot6] = slot8
		end
	end

	slot0.lay_srollview = slot0.main_container:getChildByName("lay_srollview")
	slot0.tips_label = slot0.main_container:getChildByName("tips_label")

	slot0.tips_label:setString(TI18N("只可选择当前已拥有的天赋技能"))
end

function HeroResonateSelectTalentSkillPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClosedBtn()
	end, true, 2)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, 1)

	function slot4()
		uv0:onCancelBtn()
	end

	slot5 = true

	registerButtonEventListener(slot0.cancel_btn, slot4, slot5, 1)

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

	slot0:addGlobalEvent(HeroEvent.Hero_Resonate_Skill_List_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0.dic_had_skill = {}

		for slot4, slot5 in ipairs(slot0.skills) do
			uv0.dic_had_skill[slot5.skill_id] = 1
		end

		uv0:setData()
	end)
end

function HeroResonateSelectTalentSkillPanel.onClosedBtn(slot0)
	uv0:openHeroResonateSelectTalentSkillPanel(false)
end

function HeroResonateSelectTalentSkillPanel.onComfirmBtn(slot0)
	if slot0.select_pos then
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Select_Skill_Event, slot0.select_pos, slot0.select_skill_id)
	end

	slot0:onClosedBtn()
end

function HeroResonateSelectTalentSkillPanel.onCancelBtn(slot0)
	slot0:onClosedBtn()
end

function HeroResonateSelectTalentSkillPanel.changeSelectedTab(slot0, slot1)
	if slot0.tab_object and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_list[slot1] and slot0.tab_list[slot1].is_lock then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)
		slot0.tab_object.title:setTextColor(cc.c4b(207, 181, 147, 255))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
		slot0.tab_object.title:setTextColor(cc.c4b(255, 237, 214, 255))
	end

	if slot0.select_cell and slot0.select_cell.skill_item then
		slot0.select_cell.skill_item:setTickSelected(false)
	end

	slot0:updateList(slot1)
end

function HeroResonateSelectTalentSkillPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.select_skill_id = slot2.select_skill_id
	slot0.dic_had_skill = slot2.dic_had_skill
	slot0.dic_other_skill = slot2.dic_other_skill
	slot0.select_pos = slot2.pos
	slot0.career = slot2.career
	slot3 = Config.PartnerSkillData.data_partner_awakening_skill
	slot0.skill_config_list = {}

	for slot8, slot9 in ipairs(Config.PartnerSkillData.data_partner_skill_view) do
		slot0.skill_config_list[slot8] = {}

		for slot13, slot14 in ipairs(slot9) do
			if slot3[slot14] then
				if slot0.career and slot0.select_pos == 3 and slot3[slot14].limit_career and next(slot15) ~= nil and slot15[1] and slot15[1][1] == slot0.career then
					uv0(slot0.skill_config_list[slot8], slot14)
				end
			else
				uv0(slot0.skill_config_list[slot8], slot14)
			end
		end
	end

	if slot0.dic_had_skill then
		slot0:setData()
	else
		uv1:sender26422()
	end
end

function HeroResonateSelectTalentSkillPanel.setData(slot0)
	if not slot0.dic_had_skill then
		return
	end

	slot1 = 3
	slot0.select_index = nil
	slot2 = 0
	slot3 = 0

	for slot8, slot9 in ipairs(slot0.skill_config_list) do
		uv0(slot9, function (slot0, slot1)
			uv0 = uv1.dic_had_skill[slot0] or 0
			uv2 = uv1.dic_had_skill[slot1] or 0

			if uv0 == uv2 then
				return slot0 < slot1
			else
				return uv2 < uv0
			end
		end)
	end

	if slot0.select_skill_id then
		for slot8, slot9 in ipairs(slot0.skill_config_list) do
			for slot13, slot14 in ipairs(slot9) do
				if slot0.select_skill_id == slot14 then
					slot1 = slot8
					slot0.select_index = slot13
				end
			end
		end
	end

	slot0:changeSelectedTab(slot1)
end

function HeroResonateSelectTalentSkillPanel.updateList(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.skill_config_list then
		return
	end

	if not slot0.dic_had_skill then
		return
	end

	if slot0.item_scrollview == nil then
		slot2 = slot0.lay_srollview:getContentSize()
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.lay_srollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2, {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_height = 158,
			space_y = 0,
			col = 4,
			item_width = slot2.width / 4
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end

	slot0.show_list = slot0.skill_config_list[slot1] or {}

	slot0.item_scrollview:reloadData(slot0.select_index)

	slot0.select_index = nil

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.lay_srollview, true, {
			text = TI18N("暂无技能信息")
		})
	else
		commonShowEmptyIcon(slot0.lay_srollview, false)
	end
end

function HeroResonateSelectTalentSkillPanel.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Widget:create()

	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(0, 0)
	slot3:setContentSize(cc.size(slot1, slot2))

	slot3.skill_item = SkillItem.new(true, true, false, nil, , false)

	slot3.skill_item:setPosition(slot1 * 0.5, 90)
	slot3:addChild(slot3.skill_item)
	slot3.skill_item:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function HeroResonateSelectTalentSkillPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function HeroResonateSelectTalentSkillPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	if slot0.dic_skill_config[slot3] == nil then
		slot0.dic_skill_config[slot3] = Config.SkillData.data_get_skill(slot3)
	end

	if slot0.dic_skill_config[slot3] then
		slot1.skill_item:setData(slot4)
		slot1.skill_item:showName(true, slot4.name, nil, , true)
	end

	if slot0.dic_other_skill[slot3] then
		slot1.skill_item:showRecommondIcon(true, 2)
	else
		slot1.skill_item:showRecommondIcon(false)
	end

	if slot0.dic_had_skill[slot3] then
		slot1.skill_item:showUnEnabled(false)
	else
		slot1.skill_item:showUnEnabled(true)
	end

	if slot0.select_skill_id and slot0.select_skill_id == slot3 then
		slot1.skill_item:setTickSelected(true)
	else
		slot1.skill_item:setTickSelected(false)
	end
end

function HeroResonateSelectTalentSkillPanel.onCellTouched(slot0, slot1)
	if not slot1.index then
		return
	end

	if not slot0.show_list[slot1.index] then
		return
	end

	if not slot0.dic_had_skill then
		return
	end

	if slot0.dic_had_skill[slot2] == nil then
		message(TI18N("此技能未拥有"))

		return
	end

	if slot0.dic_other_skill[slot2] then
		message(TI18N("此技能已领悟"))

		return
	end

	if slot0.select_cell and slot0.select_cell.skill_item then
		slot0.select_cell.skill_item:setTickSelected(false)
	end

	if slot0.select_skill_id and slot0.select_skill_id == slot2 and slot0.select_index == nil then
		slot0.select_skill_id = nil
		slot0.select_cell = nil
	else
		slot0.select_skill_id = slot2
		slot0.select_cell = slot1

		if slot0.select_cell and slot0.select_cell.skill_item then
			slot0.select_cell.skill_item:setTickSelected(true)
		end
	end
end

function HeroResonateSelectTalentSkillPanel.setComfirmStatus(slot0)
	if slot0.select_skill_id == nil then
		slot0.comfirm_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
		setChildUnEnabled(true, slot0.comfirm_btn)
		slot0.comfirm_btn:setTouchEnabled(false)
	else
		setChildUnEnabled(false, slot0.comfirm_btn)
		slot0.comfirm_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
		slot0.comfirm_btn:setTouchEnabled(true)
	end
end

function HeroResonateSelectTalentSkillPanel.close_callback(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.item_list = {}

	uv0:openHeroResonateSelectTalentSkillPanel(false)
end
