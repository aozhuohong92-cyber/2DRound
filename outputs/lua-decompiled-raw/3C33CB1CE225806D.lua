ArenaChampionTop32Panel = class("ArenaChampionTop32Panel", function ()
	return ccui.Layout:create()
end)
slot0 = table.insert

function ArenaChampionTop32Panel.ctor(slot0, slot1)
	slot0.tab_list = {}
	slot0.panel_list = {}
	slot0.is_in_check_info = false
	slot0.view_type = slot1 or ArenaConst.champion_type.normal

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.ctrl = ArenaController:getInstance()
		slot0.model = slot0.ctrl:getChampionModel()
	else
		slot0.ctrl = CrosschampionController:getInstance()
		slot0.model = slot0.ctrl:getModel()
	end

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/arena_champion_top_32_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot3 = slot0.root_wnd:getChildByName("container"):getChildByName("main_panel")
	slot0.page_container = slot3:getChildByName("page_container")
	slot4 = slot3:getChildByName("tab_container")

	for slot8 = 1, 2 do
		slot9 = slot4:getChildByName(string.format("tab_btn_%s", slot8))

		slot9:setBright(false)
		slot9:getChildByName("title"):setTextColor(cc.c4b(254, 209, 156, 255))

		if slot8 == 1 then
			if slot0.view_type == ArenaConst.champion_type.normal then
				slot10:setString(TI18N("32强赛"))
			else
				slot10:setString(TI18N("64强赛"))
			end
		elseif slot0.view_type == ArenaConst.champion_type.normal then
			slot10:setString(TI18N("4强赛"))
		else
			slot10:setString(TI18N("8强赛"))
		end

		slot0.tab_list[slot8] = {
			tab_btn = slot9,
			label = slot10,
			index = slot8
		}
	end

	slot0.main_panel = slot3
	slot0.tab_container = slot4

	slot0:registerEvent()
end

function ArenaChampionTop32Panel.registerEvent(slot0)
	for slot4, slot5 in ipairs(slot0.tab_list) do
		slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:changeTabView(uv1, true)
			end
		end)
	end

	if slot0.check_fight_info == nil then
		slot0.check_fight_info = GlobalEvent:getInstance():Bind(ArenaEvent.CheckFightInfoEvent, function (slot0, slot1, slot2)
			uv0:changeToFightinfo(slot0, slot1, slot2)
		end)
	end
end

function ArenaChampionTop32Panel.changeToFightinfo(slot0, slot1, slot2, slot3)
	slot0.is_in_check_info = slot1

	if slot1 == true then
		if slot0.check_info == nil then
			slot0.check_info = ArenaChampionCheckFightInfoView.new(slot0.view_type)

			slot0.main_panel:addChild(slot0.check_info)
		end

		slot0.check_info:addToParent(true)
		slot0.page_container:setVisible(false)
		slot0.tab_container:setVisible(false)
		slot0.check_info:setBaseInfo(slot2, slot3)
	else
		if slot0.check_info then
			slot0.check_info:addToParent(false)
		end

		slot0.page_container:setVisible(true)
		slot0.tab_container:setVisible(true)

		if slot0.cur_panel and slot0.cur_panel.updateInfo then
			slot0.cur_panel:updateInfo(true)
		end
	end
end

function ArenaChampionTop32Panel.changeTabView(slot0, slot1, slot2)
	if slot0.cur_selected and slot0.cur_selected.index == slot1 then
		return
	end

	if slot0.cur_selected then
		slot0.cur_selected.label:setTextColor(cc.c4b(254, 209, 156, 255))
		slot0.cur_selected.tab_btn:setBright(false)

		slot0.cur_selected = nil
	end

	slot0.cur_selected = slot0.tab_list[slot1]

	if slot0.cur_selected == nil then
		return
	end

	slot0.cur_selected.label:setTextColor(cc.c4b(255, 255, 255, 255))
	slot0.cur_selected.tab_btn:setBright(true)

	if slot0.cur_panel then
		slot0.cur_panel:addToParent(false)
	end

	slot0.cur_panel = nil
	slot0.cur_panel = slot0:getPanel(slot1)

	if slot0.cur_panel then
		slot0.cur_panel:addToParent(true)

		if slot0.cur_panel.updateInfo then
			slot0.cur_panel:updateInfo(slot2)
		end
	end
end

function ArenaChampionTop32Panel.getPanel(slot0, slot1)
	if slot0.panel_list[slot1] == nil then
		if slot1 == 1 then
			slot2 = ArenaChampionTop321View.new(slot0.view_type)
		elseif slot1 == 2 then
			slot2 = (slot0.view_type ~= ArenaConst.champion_type.normal or ArenaChampionTop322View.new(slot0.view_type)) and ArenaChampionTop8View.new(slot0.view_type)
		end

		if slot2 then
			slot0.page_container:addChild(slot2)
		end
	end

	slot0.panel_list[slot1] = slot2

	return slot2
end

function ArenaChampionTop32Panel.addToParent(slot0, slot1)
	slot0:setVisible(slot1)
end

function ArenaChampionTop32Panel.updateInfo(slot0, slot1)
	if slot0.model:getBaseInfo() == nil or slot0.model:getRoleInfo() == nil then
		return
	end

	slot0.is_change_tab = slot1

	if slot2.step == ArenaConst.champion_step.unopened or slot2.step == ArenaConst.champion_step.score or (slot2.step == ArenaConst.champion_step.match_32 or slot2.step == ArenaConst.champion_step.match_64) and slot2.step_status == ArenaConst.champion_step_status.unopened then
		slot0.main_panel:setVisible(false)
	else
		slot0.main_panel:setVisible(true)

		if slot0.is_in_check_info == true then
			if slot0.check_info then
				slot0.check_info:updateInfo(slot0.is_change_tab)
			end
		elseif slot0.cur_panel == nil then
			slot0:changeTabView(1, slot0.is_change_tab)
		elseif slot0.cur_panel.updateInfo then
			slot0.cur_panel:updateInfo(slot0.is_change_tab)
		end
	end
end

function ArenaChampionTop32Panel.DeleteMe(slot0)
	if slot0.check_fight_info then
		GlobalEvent:getInstance():UnBind(slot0.check_fight_info)

		slot0.check_fight_info = nil
	end

	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = nil

	if slot0.check_info then
		slot0.check_info:DeleteMe()
	end

	slot0.check_info = nil
end
