EndlessFriendHelpWindow = EndlessFriendHelpWindow or BaseClass(BaseView)
slot0 = Endless_trailController:getInstance()
slot1 = Endless_trailController:getInstance():getModel()
slot2 = string.format

function EndlessFriendHelpWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "endlesstrail/endlesstrail_friend_help_window"
	slot0.selected_tab = nil
	slot0.tab_list = {}
	slot0.panel_list = {}
end

function EndlessFriendHelpWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.root_csb = slot0.root_wnd:getChildByName("main_container")
	slot0.main_panel = slot0.root_csb:getChildByName("main_panel")
	slot5 = 1

	slot0:playEnterAnimatianByObj(slot0.main_panel, slot5)

	slot0.main_view = slot0.main_panel:getChildByName("container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.win_title = slot0.main_panel:getChildByName("win_title")

	slot0.win_title:setString(TI18N("好友支援"))

	for slot5 = 1, 2 do
		if slot0.main_view:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot5) then
			if slot5 == 1 then
				slot6:getChildByName("title"):setString(TI18N("支援我的"))
			elseif slot5 == 2 then
				slot7:setString(TI18N("我的支援"))
			end

			slot7:setTextColor(cc.c4b(215, 226, 227, 255))
			slot6:getChildByName("red_point"):setVisible(false)

			if slot5 == 2 then
				slot8:setVisible(uv0:getIsSendPartner())
			end

			slot6:setBright(false)

			slot6.index = slot5
			slot6.label = slot7
			slot6.red_point = slot8
			slot0.tab_list[slot5] = slot6
		end
	end

	slot0.scroll_container = slot0.main_view:getChildByName("scroll_container")
end

function EndlessFriendHelpWindow.register_event(slot0)
	for slot4, slot5 in pairs(slot0.tab_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:changeSelectedTab(slot0.index)
			end
		end)
	end

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openEndlessFriendHelpView(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openEndlessFriendHelpView(false)
			end
		end)
	end

	if not slot0.send_partner_red_point_event then
		slot0.send_partner_red_point_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_REDPOINT_SENDPARTNER_DATA, function ()
			uv0:updateTabListRedPoint()
		end)
	end
end

function EndlessFriendHelpWindow.updateTabListRedPoint(slot0)
	if slot0.tab_list and next(slot0.tab_list or {}) ~= nil and slot0.tab_list[2] and not tolua.isnull(slot0.tab_list[2]) then
		if uv0:getIsSendPartner() == nil then
			slot1 = false
		end

		slot0.tab_list[2].red_point:setVisible(slot1)
	end
end

function EndlessFriendHelpWindow.openRootWnd(slot0, slot1)
	slot0:changeSelectedTab(slot1 or Endless_trailEvent.helptype.friend)
end

function EndlessFriendHelpWindow.changeSelectedTab(slot0, slot1)
	if slot0.selected_tab ~= nil and slot0.selected_tab.index == slot1 then
		return
	end

	if slot0.selected_tab then
		slot0.selected_tab.label:setTextColor(cc.c4b(215, 226, 227, 255))
		slot0.selected_tab:setBright(false)

		slot0.selected_tab = nil
	end

	slot0.selected_tab = slot0.tab_list[slot1]

	if slot0.selected_tab then
		slot0.selected_tab.label:setTextColor(cc.c4b(255, 255, 255, 255))
		slot0.selected_tab:setBright(true)
	end

	if slot0.cur_panel ~= nil then
		slot0.cur_panel:setNodeVisible(false)

		slot0.cur_panel = nil
	end

	slot0.cur_panel = slot0.panel_list[slot1]

	if slot0.cur_panel == nil then
		if slot1 == Endless_trailEvent.helptype.friend then
			slot0.cur_panel = EndlessHelpMePanel.new()
		elseif slot1 == Endless_trailEvent.helptype.me then
			slot0.cur_panel = EndlessMeHelpPanel.new()
		end

		slot0.panel_list[slot1] = slot0.cur_panel

		slot0.scroll_container:addChild(slot0.cur_panel)

		if slot0.cur_panel.addToParent then
			slot0.cur_panel:addToParent()
		end
	end

	slot0.cur_panel:setNodeVisible(true)
end

function EndlessFriendHelpWindow.close_callback(slot0)
	slot4 = false

	uv0:openEndlessFriendHelpView(slot4)

	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = {}

	if slot0.send_partner_red_point_event then
		GlobalEvent:getInstance():UnBind(slot0.send_partner_red_point_event)

		slot0.send_partner_red_point_event = nil
	end
end
