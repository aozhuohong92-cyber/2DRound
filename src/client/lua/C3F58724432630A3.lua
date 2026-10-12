RolePersonalSpacePanel = RolePersonalSpacePanel or BaseClass(BaseView)
slot1 = RoleController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert

function RolePersonalSpacePanel.__init(slot0, slot1)
	slot0.is_full_screen = true
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.layout_name = "roleinfo/role_personal_space_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("rolepersonalspace", "rolepersonalspace"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/rolepersonalspace", "role_personal_space_bg", false),
			type = ResourcesType.single
		}
	}
	slot0.role_type = RoleConst.role_type.eMySelf
	slot0.view_list = {}
	slot0.tab_list = {}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function RolePersonalSpacePanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.win_title = slot0.main_container:getChildByName("win_title")

	slot0.win_title:setString(TI18N("个人空间"))

	slot0.panel_bg = slot0.main_container:getChildByName("panel_bg")
	slot6 = "bigbg/rolepersonalspace"

	loadSpriteTexture(slot0.panel_bg, PathTool.getPlistImgForDownLoad(slot6, "role_personal_space_bg", false), LOADTEXT_TYPE)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.container = slot0.main_container:getChildByName("container")
	slot1 = {
		TI18N("个人信息"),
		TI18N("荣誉墙"),
		TI18N("成长之路"),
		TI18N("留言板")
	}

	for slot6 = 1, 4 do
		slot7 = {
			btn = slot8,
			index = slot6,
			select_bg = slot8:getChildByName("select_img")
		}

		slot7.select_bg:setVisible(false)

		slot7.title = slot0.main_container:getChildByName("tab_btn"):getChildByName("tab_btn_" .. slot6):getChildByName("label")

		if slot1[slot6] then
			slot7.title:setString(slot1[slot6])
		end

		if slot6 == RoleConst.Tab_type.eGrowthWay or slot6 == RoleConst.Tab_type.eMessageBoard then
			slot7.redpoint = slot0.main_container:getChildByName("red_point_" .. slot6)

			if slot7.redpoint then
				slot7.redpoint:setVisible(false)
			end
		end

		slot0.tab_list[slot6] = slot7
	end

	slot0:checkTabUnlockInfo()
end

function RolePersonalSpacePanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)

	function slot4()
		uv0:onClosedBtn()
	end

	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

	for slot4, slot5 in pairs(slot0.tab_list) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:changeTabType(uv1, true)
		end, false, 1)
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "lev" then
				uv0:checkTabUnlockInfo(slot1)
			end
		end)
	end

	slot0:addGlobalEvent(RoleEvent.ROLE_MYSELF_GROWTH_WAY_EVENT, function (slot0)
		if not slot0 then
			return
		end

		if slot0.num == 1 and slot0.is_redpoint and uv0.role_type == RoleConst.role_type.eMySelf and uv0.cur_tab_index ~= RoleConst.Tab_type.eGrowthWay and uv0.tab_list[RoleConst.Tab_type.eGrowthWay] and not uv0.tab_list[RoleConst.Tab_type.eGrowthWay].is_lock then
			uv0:setBtnRedpoint(true, RoleConst.Tab_type.eGrowthWay)
		end
	end)
	slot0:addGlobalEvent(RoleEvent.ROLE_PS_CHANGE_PANEL_EVENT, function ()
		if not uv0.cur_tab_index then
			return
		end

		for slot3, slot4 in pairs(uv0.view_list) do
			if slot3 ~= uv0.cur_tab_index then
				slot4:setVisibleStatus(false)
			end
		end
	end)
end

function RolePersonalSpacePanel.onClosedBtn(slot0)
	if slot0.role_type == RoleConst.role_type.eOther then
		uv0:openOtherRolePersonalSpacePanel(false)
	else
		uv0:openRolePersonalSpacePanel(false)
	end
end

function RolePersonalSpacePanel.setBtnRedpoint(slot0, slot1, slot2)
	if slot0.tab_list and slot0.tab_list[slot2] and slot0.tab_list[slot2].redpoint then
		slot0.tab_list[slot2].redpoint:setVisible(slot1)
	end
end

function RolePersonalSpacePanel.changeTabType(slot0, slot1, slot2)
	if slot2 and slot0.cur_tab_index == slot1 then
		return
	end

	if slot0.tab_list[slot1] and slot0.tab_list[slot1].is_lock then
		message(slot0.tab_list[slot1].is_lock_des)

		if slot0.cur_tab_index == nil then
			slot0:changeTabType(RoleConst.Tab_type.eRoleInfo)
		end

		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.select_bg:setVisible(false)
	end

	slot0.cur_tab_index = slot1
	slot0.cur_tab = slot0.tab_list[slot0.cur_tab_index]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.select_bg:setVisible(true)
	end

	slot0.pre_panel = slot0:createSubPanel(slot0.cur_tab_index)

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(true)
	end

	if slot0.cur_tab_index == RoleConst.Tab_type.eGrowthWay or slot0.cur_tab_index == RoleConst.Tab_type.eMessageBoard then
		slot0:setBtnRedpoint(false, slot0.cur_tab_index)
	end
end

function RolePersonalSpacePanel.createSubPanel(slot0, slot1)
	if slot0.view_list[slot1] == nil then
		if slot1 == RoleConst.Tab_type.eRoleInfo then
			slot2 = RolePersonalSpaceTabInfoPanel.new(slot0)
		elseif slot1 == RoleConst.Tab_type.eHonorWall then
			slot2 = RolePersonalSpaceTabHonorWallPanel.new(slot0)
		elseif slot1 == RoleConst.Tab_type.eGrowthWay then
			slot2 = RolePersonalSpaceTabGrowthWayPanel.new(slot0)
		elseif slot1 == RoleConst.Tab_type.eMessageBoard then
			slot2 = RolePersonalSpaceTabMessageBoardPanel.new(slot0)
		end

		slot3 = slot0.container:getContentSize()

		slot2:setPosition(cc.p(slot3.width * 0.5, slot3.height * 0.5))
		slot0.container:addChild(slot2)

		slot0.view_list[slot1] = slot2
	end

	return slot2
end

function RolePersonalSpacePanel.closeSetNameAlert(slot0)
	if slot0.view_list and slot0.view_list[1] then
		slot0.view_list[1]:closeSetNameAlert()
	end
end

function RolePersonalSpacePanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.role_type = slot2.role_type or RoleConst.role_type.eMySelf
	slot0.other_data = slot2.other_data
	slot0.bbs_id = slot2.bbs_id

	slot0:changeTabType(slot2.index or RoleConst.Tab_type.eRoleInfo)

	if slot0.role_type == RoleConst.role_type.eMySelf then
		if PromptController:getInstance():getModel():checkPromptDataByTpye(PromptTypeConst.BBS_message) or PromptController:getInstance():getModel():checkPromptDataByTpye(PromptTypeConst.BBS_message_reply_self) then
			slot0:setBtnRedpoint(true, RoleConst.Tab_type.eMessageBoard)
		end
	end

	if slot0.role_type == RoleConst.role_type.eMySelf then
		uv0:send25830(0, 1)
	end
end

function RolePersonalSpacePanel.checkTabUnlockInfo(slot0, slot1)
	if not slot0.role_vo then
		return
	end

	for slot5, slot6 in ipairs(slot0.tab_list) do
		if slot6.index == RoleConst.Tab_type.eHonorWall then
			if Config.RoomFeatData.data_const.badge_open_limit then
				if (slot1 or slot0.role_vo.lev) < slot7.val then
					slot6.is_lock = true
					slot6.is_lock_des = slot7.desc

					setChildUnEnabled(true, slot6.btn)
				else
					slot6.is_lock = false

					setChildUnEnabled(false, slot6.btn)
				end
			end
		elseif slot6.index == RoleConst.Tab_type.eGrowthWay then
			if Config.RoomGrowData.data_const.open_lev_limit then
				if (slot1 or slot0.role_vo.lev) < slot7.val then
					slot6.is_lock = true
					slot6.is_lock_des = slot7.desc

					setChildUnEnabled(true, slot6.btn)
				else
					slot6.is_lock = false

					setChildUnEnabled(false, slot6.btn)
				end
			end
		elseif slot6.index == RoleConst.Tab_type.eMessageBoard and Config.RoomGrowData.data_const.bbs_open_limit then
			if (slot1 or slot0.role_vo.lev) < slot7.val then
				slot6.is_lock = true
				slot6.is_lock_des = slot7.desc

				setChildUnEnabled(true, slot6.btn)
			else
				slot6.is_lock = false

				setChildUnEnabled(false, slot6.btn)
			end
		end
	end
end

function RolePersonalSpacePanel.close_callback(slot0)
	if slot0.role_vo ~= nil then
		if slot0.role_assets_event ~= nil then
			slot0.role_vo:UnBind(slot0.role_assets_event)

			slot0.role_assets_event = nil
		end

		slot0.role_vo = nil
	end

	for slot4, slot5 in pairs(slot0.view_list) do
		slot5:DeleteMe()
	end

	slot0.view_list = nil

	if slot0.role_type == RoleConst.role_type.eOther then
		uv0:openOtherRolePersonalSpacePanel(false)
	else
		uv0:openRolePersonalSpacePanel(false)
	end
end
