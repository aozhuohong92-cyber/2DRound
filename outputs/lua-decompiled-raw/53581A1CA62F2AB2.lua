ArenaManyPeopleHallPanel = ArenaManyPeopleHallPanel or BaseClass(BaseView)
slot1 = ArenaManyPeopleController:getInstance():getModel()

function ArenaManyPeopleHallPanel.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
	slot0.layout_name = "arenamanypeople/amp_hall_panel"
	slot0.view_list = {}
end

function ArenaManyPeopleHallPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot6 = 0.25

	ActionHelp.itemUpAction(slot0.main_container, 720, 0, slot6)

	slot0.container = slot0.main_container:getChildByName("container")
	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("组队大厅"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.tab_container = slot0.main_container:getChildByName("tab_container")
	slot2 = {
		TI18N("组 队"),
		TI18N("邀请信息")
	}
	slot0.tab_item_type = {
		ArenaManyPeopleConst.TeamHallTabType.eTeam,
		ArenaManyPeopleConst.TeamHallTabType.eInvitation
	}
	slot0.tab_list = {}

	for slot6 = 1, 2 do
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
			slot8.index = slot0.tab_item_type[slot6] or ArenaManyPeopleConst.TeamHallTabType.eTeam
			slot0.tab_list[slot6] = slot8
		end
	end
end

function ArenaManyPeopleHallPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)

	function slot4()
		uv0:onClosedBtn()
	end

	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

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

function ArenaManyPeopleHallPanel.onClosedBtn(slot0)
	uv0:openArenaManyPeopleHallPanel(false)
end

function ArenaManyPeopleHallPanel.changeSelectedTab(slot0, slot1)
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
end

function ArenaManyPeopleHallPanel.createSubPanel(slot0, slot1)
	if not slot0.view_list then
		return
	end

	if slot0.view_list[slot1] == nil then
		if slot1 == ArenaManyPeopleConst.TeamHallTabType.eTeam then
			slot2 = ArenaManyPeopleHallTeamPanel.new(slot0)
		elseif slot1 == ArenaManyPeopleConst.TeamHallTabType.eInvitation then
			slot2 = ArenaManyPeopleHallInvitationPanel.new(slot0)
		end

		slot3 = slot0.container:getContentSize()

		slot2:setPosition(cc.p(slot3.width * 0.5, slot3.height * 0.5))
		slot0.container:addChild(slot2)

		slot0.view_list[slot1] = slot2
	end

	return slot2
end

function ArenaManyPeopleHallPanel.openRootWnd(slot0, slot1)
	if not slot0.tab_item_type then
		return
	end

	slot0:changeSelectedTab((slot1 or {}).index or ArenaManyPeopleConst.TeamHallTabType.eTeam)
end

function ArenaManyPeopleHallPanel.close_callback(slot0)
	if slot0.view_list then
		for slot4, slot5 in pairs(slot0.view_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.view_list = nil

	uv0:openArenaManyPeopleHallPanel(false)
end
