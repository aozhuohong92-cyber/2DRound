EscortLogWindow = EscortLogWindow or BaseClass(BaseView)
slot0 = EscortController:getInstance()

function EscortLogWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.layout_name = "escort/escort_log_window"
	slot0.panel_list = {}
	slot0.tab_list = {}
	slot0.cur_panel = nil
	slot0.res_list = {}
	slot0.log_type_list = {}
end

function EscortLogWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot2 = slot1:getChildByName("main_panel")

	slot2:getChildByName("win_title"):setString(TI18N("掠夺记录"))

	slot0.close_btn = slot2:getChildByName("close_btn")

	for slot7 = 1, 2 do
		slot8 = {}

		if slot2:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot7) then
			if slot7 == 1 then
				slot9:getChildByName("title"):setString(TI18N("谁掠夺我"))
			elseif slot7 == 2 then
				slot10:setString(TI18N("掠夺他人"))
			end

			slot10:setTextColor(cc.c4b(207, 181, 147, 255))
			slot9:setBright(false)

			slot8.tab_btn = slot9
			slot8.label = slot10
			slot8.index = slot7
			slot8.tips = slot9:getChildByName("tips")
			slot0.tab_list[slot7] = slot8
		end
	end

	slot0.container = slot2:getChildByName("container")
end

function EscortLogWindow.register_event(slot0)
	function slot4(slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEscortLogWindow(false)
		end
	end

	slot0.close_btn:addTouchEventListener(slot4)

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

	if slot0.update_escort_log_event == nil then
		slot0.update_escort_log_event = GlobalEvent:getInstance():Bind(EscortEvent.UpdateEscortLogInfoEvent, function (slot0)
			if slot0 == nil or slot0.type == nil or uv0.tab_object == nil then
				return
			end

			uv0.log_type_list[slot0.type] = slot0.logs

			if uv0.tab_object.index == slot0.type and uv0.select_panel then
				uv0.select_panel:setData(slot0.logs)
			end
		end)
	end

	if slot0.update_single_log_event == nil then
		slot0.update_single_log_event = GlobalEvent:getInstance():Bind(EscortEvent.UpdateEscortSingleLogInfo, function (slot0)
			if slot0 == nil or slot0.id == nil then
				return
			end

			uv0:insertToAtkLog(slot0)
		end)
	end
end

function EscortLogWindow.insertToAtkLog(slot0, slot1)
	if slot0.log_type_list[EscortConst.log_type.def] == nil then
		return
	end

	slot2 = false
	slot6 = EscortConst.log_type.def

	for slot6, slot7 in pairs(slot0.log_type_list[slot6]) do
		if slot7.id == slot1.id then
			slot0.log_type_list[EscortConst.log_type.def][slot6] = slot1
			slot2 = true

			break
		end
	end

	if slot2 == true and slot0.tab_object and slot0.tab_object.index == EscortConst.log_type.def and slot0.select_panel then
		slot0.select_panel:refreshData(slot0.log_type_list[EscortConst.log_type.def])
	end
end

function EscortLogWindow.openRootWnd(slot0, slot1)
	slot0:changeSelectedTab(slot1 or GuildvoyageConst.index.order)
end

function EscortLogWindow.changeSelectedTab(slot0, slot1)
	if slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.tab_btn:setBright(false)
		slot0.tab_object.label:setTextColor(cc.c4b(207, 181, 147, 255))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.label:setTextColor(cc.c4b(255, 237, 214, 255))
		slot0.tab_object.tab_btn:setBright(true)
	end

	if slot0.select_panel then
		slot0.select_panel:addToParent(false)

		slot0.select_panel = nil
	end

	slot0.select_panel = slot0.panel_list[slot1]

	if slot0.select_panel == nil then
		if slot1 == EscortConst.log_type.def then
			slot0.select_panel = EscortLogDefPanel.New(slot0.container)
		elseif slot1 == EscortConst.log_type.atk then
			slot0.select_panel = EscortLogAtkPanel.New(slot0.container)
		end

		if slot0.select_panel then
			slot0.panel_list[slot1] = slot0.select_panel
		end
	end

	if slot0.select_panel then
		slot0.select_panel:addToParent(true)
	end
end

function EscortLogWindow.close_callback(slot0)
	if slot0.update_escort_log_event then
		GlobalEvent:getInstance():UnBind(slot0.update_escort_log_event)

		slot0.update_escort_log_event = nil
	end

	if slot0.update_single_log_event then
		GlobalEvent:getInstance():UnBind(slot0.update_single_log_event)

		slot0.update_single_log_event = nil
	end

	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = nil

	uv0:openEscortLogWindow(false)
end
