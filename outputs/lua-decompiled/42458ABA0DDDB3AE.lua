FormFilterHeroPanel = FormFilterHeroPanel or BaseClass(BaseView)
slot0 = HeroController:getInstance()

function FormFilterHeroPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "hero/form_filter_hero_panel"
	slot0.res_list = {}
	slot0.dic_filter_camp_type = {}
	slot0.dic_filter_career_type = {}
end

function FormFilterHeroPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot4 = "main_container"
	slot0.main_container = slot0.root_wnd:getChildByName(slot4)
	slot0.checkbox_camp_list = {}

	for slot4, slot5 in pairs(HeroConst.CampType) do
		if slot5 ~= 0 then
			slot0.checkbox_camp_list[slot5] = slot0.main_container:getChildByName("checkbox_camp" .. slot5)
		end
	end

	slot0.checkbox_career_list = {}

	for slot4, slot5 in pairs(HeroConst.CareerType) do
		if slot5 ~= 0 then
			slot0.checkbox_career_list[slot5] = slot0.main_container:getChildByName("checkbox_profession" .. slot5)

			if HeroConst.CareerName[slot5] then
				slot0.checkbox_career_list[slot5]:getChildByName("label"):setString(HeroConst.CareerName[slot5])
			end
		end
	end

	slot0.clear_btn = slot0.main_container:getChildByName("clear_btn")
	slot0.clear_label = slot0.clear_btn:getChildByName("label")

	slot0.clear_label:setString(TI18N("清除勾选"))

	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("确 定"))
end

function FormFilterHeroPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.clear_btn, handler(slot0, slot0.onClickClearBtn), true, 2)

	slot4 = handler(slot0, slot0.onClickComfirmBtn)
	slot5 = true

	registerButtonEventListener(slot0.comfirm_btn, slot4, slot5, 2)

	for slot4, slot5 in pairs(slot0.checkbox_camp_list) do
		slot5:addEventListener(function (slot0, slot1)
			playButtonSound2()
			uv0:onSelectBoxCamp(uv1)
		end)
	end

	for slot4, slot5 in pairs(slot0.checkbox_career_list) do
		slot5:addEventListener(function (slot0, slot1)
			playButtonSound2()
			uv0:onSelectBoxCareer(uv1)
		end)
	end
end

function FormFilterHeroPanel.onClickBtnClose(slot0)
	uv0:openFormFilterHeroPanel(false)
end

function FormFilterHeroPanel.onClickClearBtn(slot0)
	if slot0.is_clear then
		slot0:setBoxSelect(false)
		slot0.clear_label:setString(TI18N("全部勾选"))

		slot0.is_clear = false
	else
		slot0:setBoxSelect(true)
		slot0.clear_label:setString(TI18N("清除勾选"))

		slot0.is_clear = true
	end
end

function FormFilterHeroPanel.setBoxSelect(slot0, slot1)
	for slot5, slot6 in pairs(slot0.checkbox_camp_list) do
		slot0.dic_filter_camp_type[slot5] = slot1

		slot6:setSelected(slot1)
	end

	for slot5, slot6 in pairs(slot0.checkbox_career_list) do
		slot0.dic_filter_career_type[slot5] = slot1

		slot6:setSelected(slot1)
	end
end

function FormFilterHeroPanel.onClickComfirmBtn(slot0)
	slot0:onClickBtnClose()
	GlobalEvent:getInstance():Fire(HeroEvent.Filter_Hero_Update, slot0.dic_filter_camp_type, slot0.dic_filter_career_type)
end

function FormFilterHeroPanel.onSelectBoxCamp(slot0, slot1)
	slot0.dic_filter_camp_type[slot1] = slot0.checkbox_camp_list[slot1]:isSelected()

	slot0:setClearBtnStatus()
end

function FormFilterHeroPanel.onSelectBoxCareer(slot0, slot1)
	slot0.dic_filter_career_type[slot1] = slot0.checkbox_career_list[slot1]:isSelected()

	slot0:setClearBtnStatus()
end

function FormFilterHeroPanel.openRootWnd(slot0, slot1, slot2)
	slot4 = slot2 or {}

	for slot8, slot9 in pairs(slot0.checkbox_camp_list) do
		slot0.dic_filter_camp_type[slot8] = (slot1 or {})[slot8]

		if slot0.dic_filter_camp_type[slot8] == true then
			slot9:setSelected(true)
		else
			slot9:setSelected(false)
		end
	end

	for slot8, slot9 in pairs(slot0.checkbox_career_list) do
		slot0.dic_filter_career_type[slot8] = slot4[slot8]

		if slot0.dic_filter_career_type[slot8] == true then
			slot9:setSelected(true)
		else
			slot9:setSelected(false)
		end
	end

	slot0:setClearBtnStatus()
end

function FormFilterHeroPanel.setClearBtnStatus(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.dic_filter_camp_type) do
		if slot6 == true then
			slot1 = true

			break
		end
	end

	if not slot1 then
		for slot5, slot6 in pairs(slot0.dic_filter_career_type) do
			if slot6 == true then
				slot1 = true

				break
			end
		end
	end

	slot0.is_clear = slot1

	if slot1 then
		slot0.clear_label:setString(TI18N("清除勾选"))
	else
		slot0.clear_label:setString(TI18N("全部勾选"))
	end
end

function FormFilterHeroPanel.close_callback(slot0)
	uv0:openFormFilterHeroPanel(false)
end
