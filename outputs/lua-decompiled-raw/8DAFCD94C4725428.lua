ArenateamHallPanel = ArenateamHallPanel or BaseClass(BaseView)
slot1 = ArenateamController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format

function ArenateamHallPanel.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arenateam_hall", "arenateam_hall"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "arenateam/arenateam_hall_panel"
	slot0.view_list = {}
end

function ArenateamHallPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("组队大厅"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.tab_container = slot0.main_container:getChildByName("tab_container")
	slot2 = {
		TI18N("组 队"),
		TI18N("收到邀请"),
		TI18N("我的队伍")
	}
	slot0.tab_item_type = {
		ArenateamConst.TeamHallTabType.eTeam,
		ArenateamConst.TeamHallTabType.eInvitation,
		ArenateamConst.TeamHallTabType.eMyTeam
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
			slot8.index = slot0.tab_item_type[slot6] or ArenateamConst.TeamHallTabType.eTeam
			slot0.tab_list[slot6] = slot8
		end
	end
end

function ArenateamHallPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClosedBtn()
	end, true, 2)

	function slot4()
		uv0:onComfirmBtn()
	end

	slot5 = true

	registerButtonEventListener(slot0.comfirm_btn, slot4, slot5, 1)

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

	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_ALL_RED_POINT_EVENT, function ()
		uv0:updateRedPoint()
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_APPLY_RED_POINT_EVENT, function ()
		uv0:updateRedPoint()
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_INVITATION_RED_POINT_EVENT, function ()
		if uv0.cur_tab_index and uv0.cur_tab_index == ArenateamConst.TeamHallTabType.eInvitation then
			uv1.is_invitation_red = false

			uv2:sender27206()
		else
			uv0:updateRedPoint()
		end
	end)
end

function ArenateamHallPanel.onClosedBtn(slot0)
	uv0:openArenateamHallPanel(false)
end

function ArenateamHallPanel.changeSelectedTab(slot0, slot1)
	if slot0.tab_object and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)
		slot0.tab_object.title:setTextColor(cc.c4b(207, 181, 147, 255))

		slot0.tab_object = nil
	end

	slot0.cur_tab_index = slot1
	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
		slot0.tab_object.title:setTextColor(cc.c4b(255, 237, 214, 255))
	end

	if slot0.pre_panel then
		if slot0.pre_panel.setVisibleStatus then
			slot0.pre_panel:setVisibleStatus(false)
		else
			slot0.pre_panel:setVisible(false)
		end
	end

	slot0.pre_panel = slot0:createSubPanel(slot0.cur_tab_index)

	if slot0.pre_panel ~= nil then
		if slot0.pre_panel.setVisibleStatus then
			slot0.pre_panel:setVisibleStatus(true)
		else
			slot0.pre_panel:setVisible(true)
		end
	end

	if slot0.cur_tab_index == ArenateamConst.TeamHallTabType.eInvitation then
		uv0:setIsInvitationRedpoint(false)
	end
end

function ArenateamHallPanel.createSubPanel(slot0, slot1)
	if not slot0.view_list then
		return
	end

	if slot0.view_list[slot1] == nil then
		if slot1 == ArenateamConst.TeamHallTabType.eTeam then
			slot2 = ArenateamHallTapTeamPanel.new(slot0)
		elseif slot1 == ArenateamConst.TeamHallTabType.eInvitation then
			slot2 = ArenateamHallTapInvitationPanel.new(slot0)
		elseif slot1 == ArenateamConst.TeamHallTabType.eMyTeam then
			slot2 = ArenateamHallTapMyTeamPanel.new(slot0)
		end

		slot3 = slot0.main_container:getContentSize()

		slot2:setPosition(cc.p(slot3.width * 0.5, slot3.height * 0.5))
		slot0.main_container:addChild(slot2)

		slot0.view_list[slot1] = slot2
	end

	return slot2
end

function ArenateamHallPanel.openRootWnd(slot0, slot1)
	if not slot0.tab_item_type then
		return
	end

	slot0:updateRedPoint()
	slot0:changeSelectedTab((slot1 or {}).index or ArenateamConst.TeamHallTabType.eTeam)
end

function ArenateamHallPanel.updateRedPoint(slot0)
	if not slot0.tab_list then
		return
	end

	if slot0.tab_list[2] and slot0.tab_list[2].tab_btn then
		if uv0.is_invitation_red then
			addRedPointToNodeByStatus(slot0.tab_list[2].tab_btn, true, 5, 5)
		else
			addRedPointToNodeByStatus(slot1, false, 5, 5)
		end
	end

	if slot0.tab_list[3] and slot0.tab_list[3].tab_btn then
		if uv0.is_apply_red then
			addRedPointToNodeByStatus(slot0.tab_list[3].tab_btn, true, 5, 5)
		else
			addRedPointToNodeByStatus(slot1, false, 5, 5)
		end
	end
end

function ArenateamHallPanel.close_callback(slot0)
	if slot0.view_list then
		for slot4, slot5 in pairs(slot0.view_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.view_list = nil

	uv0:openArenateamHallPanel(false)
end
