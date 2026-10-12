ElfinMainPanel = class("ElfinMainPanel", function ()
	return ccui.Layout:create()
end)
slot1 = ElfinController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format

function ElfinMainPanel.ctor(slot0, slot1)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("hero/hero_elfin_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)
	slot0:initElfinData()
	uv0({}, {
		path = PathTool.getPlistImgForDownLoad("elfin", "elfin"),
		type = ResourcesType.plist
	})

	if slot0.init_res_load then
		slot0.init_res_load:DeleteMe()

		slot0.init_res_load = nil
	end

	slot0.init_res_load = ResourcesLoad.New()

	slot0.init_res_load:addAllList(slot2, function ()
		if not tolua.isnull(uv0.root_wnd) then
			uv0:loadResListCompleted(uv1)
		end
	end)
end

function ElfinMainPanel.loadResListCompleted(slot0, slot1)
	slot0:initView()
	slot0:registerEvent()
	slot0:changeSelectedTab(slot1 or slot0:getDefaultTabIndex(), true)
	slot0:updateElfinRedInfo()
end

function ElfinMainPanel.getDefaultTabIndex(slot0)
	slot1 = ElfinConst.Tab_Index.Rouse

	for slot6, slot7 in pairs(uv0:getElfinHatchList()) do
		if slot7.is_open == 1 and (slot7.state == ElfinConst.Hatch_Status.Open or slot7.state == ElfinConst.Hatch_Status.Over) then
			slot1 = ElfinConst.Tab_Index.Hatch

			break
		end
	end

	return slot1
end

function ElfinMainPanel.initElfinData(slot0)
	slot0.tab_list = {}
	slot0.cur_tab_index = ElfinConst.Tab_Index.Hatch
end

function ElfinMainPanel.initView(slot0)
	slot0.container = slot0.root_wnd:getChildByName("container")

	for slot5 = 1, 3 do
		slot6 = {}

		if slot0.container:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot5) then
			slot7:loadTextures(PathTool.getResFrame("common", "common_90030"), "", "", LOADTEXT_TYPE_PLIST)

			if slot5 == 1 then
				slot7:getChildByName("title"):setString(TI18N("培养"))
			elseif slot5 == 2 then
				slot8:setString(TI18N("觉醒"))
			elseif slot5 == 3 then
				slot8:setString(TI18N("召唤"))
				slot7:setName("guide_tab_btn")
			end

			slot6.tab_btn = slot7
			slot6.label = slot8

			slot6.label:setTextColor(cc.c3b(247, 226, 227))

			slot6.index = slot5
			slot6.tips = slot7:getChildByName("tips")
			slot0.tab_list[slot5] = slot6
		end
	end
end

function ElfinMainPanel.registerEvent(slot0)
	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended and not uv0.is_show_egg_effect then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end

	if not slot0.update_red_status_event then
		slot0.update_red_status_event = GlobalEvent:getInstance():Bind(ElfinEvent.Update_Elfin_Red_Event, function (slot0, slot1)
			uv0:updateElfinRedInfo(slot0, slot1)
		end)
	end
end

function ElfinMainPanel.changeSelectedTab(slot0, slot1, slot2)
	if not slot2 and slot0.cur_tab_index and slot0.cur_tab_index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.tab_btn:loadTextures(PathTool.getResFrame("common", "common_90030"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.label:setTextColor(cc.c3b(247, 226, 227))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.tab_btn:loadTextures(PathTool.getResFrame("common", "common_90031"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.label:setTextColor(cc.c3b(92, 43, 13))
	end

	slot0.cur_tab_index = slot1

	if slot1 == ElfinConst.Tab_Index.Hatch then
		if slot0.elfin_rouse_panel then
			slot0.elfin_rouse_panel:setVisible(false)
		end

		if slot0.elfin_summon_panel then
			slot0.elfin_summon_panel:setVisible(false)
			slot0.elfin_summon_panel:setVisibleStatus(false)
		end

		if not slot0.elfin_hatch_panel then
			slot0.elfin_hatch_panel = ElfinHatchPanel.new()

			slot0.container:addChild(slot0.elfin_hatch_panel)
		end

		slot0.elfin_hatch_panel:setVisible(true)

		if not slot0.init_hatch_flag then
			slot0.init_hatch_flag = true

			uv0:sender26500()
		end
	elseif slot1 == ElfinConst.Tab_Index.Rouse then
		if slot0.elfin_summon_panel then
			slot0.elfin_summon_panel:setVisible(false)
			slot0.elfin_summon_panel:setVisibleStatus(false)
		end

		if slot0.elfin_hatch_panel then
			slot0.elfin_hatch_panel:setVisible(false)
		end

		if not slot0.elfin_rouse_panel then
			slot0.elfin_rouse_panel = ElfinRousePanel.new()

			slot0.container:addChild(slot0.elfin_rouse_panel)
		end

		slot0.elfin_rouse_panel:setVisible(true)
	elseif slot1 == ElfinConst.Tab_Index.Summon then
		if slot0.elfin_rouse_panel then
			slot0.elfin_rouse_panel:setVisible(false)
		end

		if slot0.elfin_hatch_panel then
			slot0.elfin_hatch_panel:setVisible(false)
		end

		if not slot0.elfin_summon_panel then
			slot0.elfin_summon_panel = ElfinSummonPanel.new()

			slot0.container:addChild(slot0.elfin_summon_panel)
		end

		slot0.elfin_summon_panel:setVisible(true)
		slot0.elfin_summon_panel:setVisibleStatus(true)
	end

	slot0:updateTabBtnRedStatus()
end

function ElfinMainPanel.updateElfinRedInfo(slot0, slot1, slot2)
	slot0:updateTabBtnRedStatus()
end

function ElfinMainPanel.updateTabBtnRedStatus(slot0)
	for slot4, slot5 in ipairs(slot0.tab_list) do
		slot6 = false

		if slot5.index == 1 and slot0.cur_tab_index ~= slot5.index then
			if uv0:getElfinRedStatusByRedBid(HeroConst.RedPointType.eElfin_hatch_egg) or uv0:getElfinRedStatusByRedBid(HeroConst.RedPointType.eElfin_hatch_done) or uv0:getElfinRedStatusByRedBid(HeroConst.RedPointType.eElfin_hatch_lvup) or uv0:getElfinRedStatusByRedBid(HeroConst.RedPointType.eElfin_hatch_open) or uv0:getElfinRedStatusByRedBid(HeroConst.RedPointType.eElfin_activate) then
				slot6 = true
			end
		elseif slot5.index == 2 and slot0.cur_tab_index ~= slot5.index then
			if uv0:getElfinRedStatusByRedBid(HeroConst.RedPointType.eElfin_tree_lvup) or uv0:getElfinRedStatusByRedBid(HeroConst.RedPointType.eElfin_empty_pos) or uv0:getElfinRedStatusByRedBid(HeroConst.RedPointType.eElfin_higher_lv) or uv0:getElfinRedStatusByRedBid(HeroConst.RedPointType.eElfin_compound) then
				slot6 = true
			end
		elseif slot5.index == 3 and slot0.cur_tab_index ~= slot5.index and uv0:getElfinRedStatusByRedBid(HeroConst.RedPointType.eElfin_summon) then
			slot6 = true
		end

		if slot5.tips then
			slot5.tips:setVisible(slot6)
		end
	end
end

function ElfinMainPanel.DeleteMe(slot0)
	if slot0.elfin_rouse_panel then
		slot0.elfin_rouse_panel:DeleteMe()

		slot0.elfin_rouse_panel = nil
	end

	if slot0.elfin_summon_panel then
		slot0.elfin_summon_panel:DeleteMe()

		slot0.elfin_summon_panel = nil
	end

	if slot0.elfin_hatch_panel then
		slot0.elfin_hatch_panel:DeleteMe()

		slot0.elfin_hatch_panel = nil
	end

	if slot0.init_res_load then
		slot0.init_res_load:DeleteMe()

		slot0.init_res_load = nil
	end

	if slot0.update_red_status_event then
		GlobalEvent:getInstance():UnBind(slot0.update_red_status_event)

		slot0.update_red_status_event = nil
	end

	uv0:setNotCalculateHatchLvupRedFlag()
	uv0:updateElfinRedStatus(HeroConst.RedPointType.eElfin_hatch_lvup, false)
	MainuiController:getInstance():setMainUIChatBubbleStatus(true)
	MainuiController:getInstance():setMainUIShowStatus(true)
end
