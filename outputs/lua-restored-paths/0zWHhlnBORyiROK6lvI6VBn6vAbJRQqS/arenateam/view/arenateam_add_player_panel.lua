ArenateamAddPlayerPanel = ArenateamAddPlayerPanel or BaseClass(BaseView)
slot1 = ArenateamController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format

function ArenateamAddPlayerPanel.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arenateam_hall", "arenateam_hall"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "arenateam/arenateam_add_player_panel"
	slot0.view_list = {}
	slot0.is_show_recommend = true
	slot0.dic_invitation_player = {}
end

function ArenateamAddPlayerPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("添加玩家"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.tab_container = slot0.main_container:getChildByName("tab_container")
	slot2 = {
		TI18N("申请列表"),
		TI18N("邀请玩家")
	}
	slot0.tab_item_type = {
		ArenateamConst.AddPlayerTabType.eApplyList,
		ArenateamConst.AddPlayerTabType.eInvitation
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
			slot8.index = slot0.tab_item_type[slot6] or ArenateamConst.AddPlayerTabType.eApplyList
			slot0.tab_list[slot6] = slot8
		end
	end

	slot3 = slot0.main_container:getChildByName("apply_panel")
	slot4 = slot0.main_container:getChildByName("invitation_panel")

	slot3:setVisible(false)
	slot4:setVisible(false)

	slot0.view_list = {
		[ArenateamConst.AddPlayerTabType.eApplyList] = slot3,
		[ArenateamConst.AddPlayerTabType.eInvitation] = slot4
	}
	slot0.apply_lay_srollview = slot3:getChildByName("lay_srollview")
	slot0.default_msg = TI18N("请输入玩家名字")
	slot0.edit_box = createEditBox(slot4, PathTool.getResFrame("common", "common_1021"), cc.size(448, 52), nil, 24, Config.ColorData.data_color3[151], 20, slot0.default_msg, nil, nil, LOADTEXT_TYPE_PLIST, nil, nil)

	slot0.edit_box:setAnchorPoint(cc.p(0, 0))
	slot0.edit_box:setPlaceholderFontColor(Config.ColorData.data_color4[151])
	slot0.edit_box:setFontColor(Config.ColorData.data_color4[66])
	slot0.edit_box:setPosition(cc.p(20, 820))

	slot0.find_btn = slot4:getChildByName("find_btn")

	slot0.find_btn:getChildByName("label"):setString(TI18N("查 找"))

	slot0.refresh_btn = slot4:getChildByName("refresh_btn")

	slot0.refresh_btn:getChildByName("label"):setString(TI18N("刷 新"))

	slot0.invitation_lay_srollview = slot4:getChildByName("lay_srollview")
end

function ArenateamAddPlayerPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClosedBtn()
	end, true, 2)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, 1)
	registerButtonEventListener(slot0.find_btn, function ()
		uv0:onFindBtn()
	end, true, 1)

	function slot4()
		uv0:onRefreshBtn()
	end

	slot5 = true

	registerButtonEventListener(slot0.refresh_btn, slot4, slot5, 1, nil, nil, 1.5)

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

	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_APPLY_LIST_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0.apply_show_list = slot0.arena_team_member

		if uv0.cur_tab_index == ArenateamConst.AddPlayerTabType.eApplyList then
			uv0:initApply()
		end
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_GET_RECOMMEND_INFO_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0.dic_invitation_player = {}
		uv0.invitation_recommend_list = slot0.arena_team_member
		uv0.is_show_recommend = true

		uv0:initInvitation()
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_SEARCH_PLAYER_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0.dic_invitation_player = {}
		uv0.invitation_search_list = slot0.arena_team_member
		uv0.is_show_recommend = false

		uv0:initInvitation()
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_INVITATION_PLAYER_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0.dic_invitation_player[slot0.rid .. "_" .. slot0.srv_id] = true

		if uv0.invitation_scrollview_list then
			uv0.invitation_scrollview_list:resetCurrentItems()
		end
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_ANSWER_APPLY_EVENT, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.apply_show_list then
			return
		end

		for slot4, slot5 in ipairs(uv0.apply_show_list) do
			if slot5.rid == slot0.rid and slot5.sid == slot0.srv_id then
				table.remove(uv0.apply_show_list, slot4)

				break
			end
		end

		if #uv0.apply_show_list == 0 then
			uv1:setIsApplayRedpoint(false)
			uv0:updateRedPoint(false)
		end

		uv0:updateApplyList()
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_APPLY_RED_POINT_EVENT, function ()
		if not uv0.cur_tab_index or uv0.cur_tab_index ~= ArenateamConst.AddPlayerTabType.eApplyList then
			uv0:updateRedPoint(true)
		end

		uv1:sender27203()
	end)
end

function ArenateamAddPlayerPanel.updateRedPoint(slot0, slot1)
	if not slot0.tab_list then
		return
	end

	if slot0.tab_list[1] and slot0.tab_list[1].tab_btn then
		addRedPointToNodeByStatus(slot0.tab_list[1].tab_btn, slot1, 5, 5)
	end
end

function ArenateamAddPlayerPanel.onClosedBtn(slot0)
	uv0:openArenateamAddPlayerPanel(false)
end

function ArenateamAddPlayerPanel.onFindBtn(slot0)
	if (slot0.edit_box:getText() or "") == "" then
		message(TI18N("玩家名字不能为空"))

		return
	end

	uv0:sender27229(slot1)
end

function ArenateamAddPlayerPanel.onRefreshBtn(slot0)
	uv0:sender27228()
end

function ArenateamAddPlayerPanel.changeSelectedTab(slot0, slot1)
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
		slot0.pre_panel:setVisible(false)
	end

	slot0.pre_panel = slot0.view_list[slot1]

	if slot0.pre_panel ~= nil then
		slot0.pre_panel:setVisible(true)
	end

	if slot1 == ArenateamConst.AddPlayerTabType.eApplyList then
		slot0:initApply()
	elseif slot1 == ArenateamConst.AddPlayerTabType.eInvitation then
		slot0:initInvitation()
	end
end

function ArenateamAddPlayerPanel.openRootWnd(slot0, slot1)
	if not slot0.tab_item_type then
		return
	end

	slot2 = slot1 or {}
	slot0.is_team_leader = slot2.is_team_leader or false

	slot0:changeSelectedTab(slot2.index or ArenateamConst.AddPlayerTabType.eApplyList)
	uv0:sender27203()
	uv0:sender27228()
end

function ArenateamAddPlayerPanel.initApply(slot0)
	if not slot0.apply_show_list then
		return
	end

	uv0(slot0.apply_show_list, function (slot0, slot1)
		return slot1.power < slot0.power
	end)
	slot0:updateApplyList()
end

function ArenateamAddPlayerPanel.updateApplyList(slot0)
	if not slot0.apply_show_list then
		return
	end

	if slot0.apply_scrollview_list == nil then
		slot0.apply_scrollview_list = CommonScrollViewSingleLayout.new(slot0.apply_lay_srollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.apply_lay_srollview:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 1,
			space_x = 0,
			item_width = 600,
			item_height = 210,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.apply_scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.apply_scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.apply_scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.apply_scrollview_list:reloadData()

	if #slot0.apply_show_list == 0 then
		commonShowEmptyIcon(slot0.apply_lay_srollview, {
			text = TI18N("暂无队伍信息")
		})
	else
		commonShowEmptyIcon(slot0.apply_lay_srollview, false)
	end
end

function ArenateamAddPlayerPanel.createNewCell(slot0, slot1, slot2)
	return ArenateamAddPlayerItem.new(slot1, slot2, slot0, ArenateamConst.AddPlayerTabType.eApplyList)
end

function ArenateamAddPlayerPanel.numberOfCells(slot0)
	if not slot0.apply_show_list then
		return 0
	end

	return #slot0.apply_show_list
end

function ArenateamAddPlayerPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.apply_show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ArenateamAddPlayerPanel.initInvitation(slot0)
	if slot0.is_show_recommend then
		slot0.invitation_show_list = slot0.invitation_recommend_list
	else
		slot0.invitation_show_list = slot0.invitation_search_list
	end

	if not slot0.invitation_show_list then
		return
	end

	uv0(slot0.invitation_show_list, function (slot0, slot1)
		return slot1.power < slot0.power
	end)
	slot0:updateInvitationList()
end

function ArenateamAddPlayerPanel.updateInvitationList(slot0)
	if not slot0.invitation_show_list then
		return
	end

	if slot0.invitation_scrollview_list == nil then
		slot0.invitation_scrollview_list = CommonScrollViewSingleLayout.new(slot0.invitation_lay_srollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.invitation_lay_srollview:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 1,
			space_x = 0,
			item_width = 600,
			item_height = 210,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.invitation_scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.createNewCellInvitation), ScrollViewFuncType.CreateNewCell)
		slot0.invitation_scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCellsInvitation), ScrollViewFuncType.NumberOfCells)
		slot0.invitation_scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndexInvitation), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.invitation_scrollview_list:reloadData()

	if #slot0.invitation_show_list == 0 then
		commonShowEmptyIcon(slot0.invitation_lay_srollview, {
			text = TI18N("暂无队伍信息")
		})
	else
		commonShowEmptyIcon(slot0.invitation_lay_srollview, false)
	end
end

function ArenateamAddPlayerPanel.createNewCellInvitation(slot0, slot1, slot2)
	return ArenateamAddPlayerItem.new(slot1, slot2, slot0, ArenateamConst.AddPlayerTabType.eInvitation)
end

function ArenateamAddPlayerPanel.numberOfCellsInvitation(slot0)
	if not slot0.invitation_show_list then
		return 0
	end

	return #slot0.invitation_show_list
end

function ArenateamAddPlayerPanel.updateCellByIndexInvitation(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.invitation_show_list[slot2] then
		return
	end

	slot1:setData(slot3)
	slot1:setInvitationLabel(slot0.dic_invitation_player[slot3.rid .. "_" .. slot3.sid] or false)
end

function ArenateamAddPlayerPanel.close_callback(slot0)
	if slot0.apply_scrollview_list then
		slot0.apply_scrollview_list:DeleteMe()

		slot0.apply_scrollview_list = nil
	end

	if slot0.invitation_scrollview_list then
		slot0.invitation_scrollview_list:DeleteMe()

		slot0.invitation_scrollview_list = nil
	end

	uv0:openArenateamAddPlayerPanel(false)
end

ArenateamAddPlayerItem = class("ArenateamAddPlayerItem", function ()
	return ccui.Widget:create()
end)

function ArenateamAddPlayerItem.ctor(slot0, slot1, slot2, slot3, slot4)
	slot0.show_type = slot4 or ArenateamConst.AddPlayerTabType.eApplyList
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ArenateamAddPlayerItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenateam/arenateam_add_player_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.player_name = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(132, 177), slot11, nil, 800)

	slot0.main_container:addChild(slot0.player_name)

	slot0.power = slot0.main_container:getChildByName("power")
	slot0.head = PlayerHead.new(PlayerHead.type.circle)

	slot0.head:setHeadLayerScale(0.8)
	slot0.head:setPosition(56, 160)
	slot0.head:setLev(99)
	slot0.main_container:addChild(slot0.head)

	slot0.hero_item_list = {}
	slot5 = HeroExhibitionItem.Width * 0.8 + 10

	for slot11 = 1, 5 do
		slot0.hero_item_list[slot11] = HeroExhibitionItem.new(0.8, true)

		slot0.hero_item_list[slot11]:setSwallowTouches(false)
		slot0.hero_item_list[slot11]:setPosition(slot0.main_container:getContentSize().width * 0.5 - slot5 * 5 * 0.5 + slot5 * 0.5 + (slot11 - 1) * slot5, 58)
		slot0.hero_item_list[slot11]:addCallBack(function ()
			uv0:onClickHeroItemByIndex(uv1)
		end)
		slot0.main_container:addChild(slot0.hero_item_list[slot11])
	end

	slot0.cancel_btn = slot0.main_container:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("拒 绝"))

	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("同 意"))

	slot0.invitation_btn = slot0.main_container:getChildByName("invitation_btn")
	slot0.invitation_btn_label = slot0.invitation_btn:getChildByName("label")

	slot0.invitation_btn_label:setString(TI18N("邀 请"))

	if slot0.show_type == ArenateamConst.AddPlayerTabType.eApplyList then
		slot0.cancel_btn:setVisible(true)
		slot0.comfirm_btn:setVisible(true)
		slot0.invitation_btn:setVisible(false)
	elseif slot0.show_type == ArenateamConst.AddPlayerTabType.eInvitation then
		slot0.cancel_btn:setVisible(false)
		slot0.comfirm_btn:setVisible(false)
		slot0.invitation_btn:setVisible(true)
	end
end

function ArenateamAddPlayerItem.register_event(slot0)
	registerButtonEventListener(slot0.cancel_btn, function ()
		uv0:onCancelBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY, nil, nil, 1)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY, nil, nil, 1)
	registerButtonEventListener(slot0.invitation_btn, function ()
		uv0:onInvitationBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY, nil, nil, 1)
end

function ArenateamAddPlayerItem.onClickHeroItemByIndex(slot0, slot1)
end

function ArenateamAddPlayerItem.onCancelBtn(slot0)
	if not slot0.parent then
		return
	end

	if slot0.parent.is_team_leader then
		uv0:sender27204(slot0.data.rid, slot0.data.sid, 0)
	else
		message(TI18N("只有队长可进行该操作"))
	end
end

function ArenateamAddPlayerItem.onComfirmBtn(slot0)
	if not slot0.parent then
		return
	end

	if slot0.parent.is_team_leader then
		uv0:sender27204(slot0.data.rid, slot0.data.sid, 1)
	else
		message(TI18N("只有队长可进行该操作"))
	end
end

function ArenateamAddPlayerItem.onInvitationBtn(slot0)
	if not slot0.parent then
		return
	end

	if not slot0.data then
		return
	end

	if slot0.parent.is_team_leader then
		uv0:sender27205(slot0.data.rid, slot0.data.sid)
	else
		message(TI18N("只有队长可进行该操作"))
	end
end

function ArenateamAddPlayerItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.player_name:setString(slot0.data.name)
	slot0.power:setString(slot0.data.power)
	slot0.head:setHeadRes(slot0.data.face_id, false, LOADTEXT_TYPE, slot0.data.face_file, slot0.data.face_update_time)
	slot0.head:setLev(slot0.data.lev)

	slot2 = slot0.data.avatar_bid

	if slot0.record_res_bid == nil or slot0.record_res_bid ~= slot2 then
		slot0.record_res_bid = slot2

		if Config.AvatarData.data_avatar[slot2] then
			slot0.head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot3.res_id or 1), false, false), nil, false, slot3.offy)
		end
	end

	function slot6(slot0, slot1)
		return slot0.pos < slot1.pos
	end

	uv0(slot0.data.team_partner, slot6)

	for slot6, slot7 in ipairs(slot0.hero_item_list) do
		if slot0.data.team_partner[slot6] then
			slot8.use_skin = slot8.skin_id

			slot7:setData(slot8)
		else
			slot7:setData(nil)
		end
	end
end

function ArenateamAddPlayerItem.setInvitationLabel(slot0, slot1)
	if slot1 then
		slot0.invitation_btn_label:setString(TI18N("已邀请"))
		setChildUnEnabled(true, slot0.invitation_btn)
		slot0.invitation_btn:setTouchEnabled(false)
	else
		slot0.invitation_btn_label:setString(TI18N("邀 请"))
		setChildUnEnabled(false, slot0.invitation_btn)
		slot0.invitation_btn:setTouchEnabled(true)
	end
end

function ArenateamAddPlayerItem.DeleteMe(slot0)
	if slot0.head_list then
		for slot4, slot5 in ipairs(slot0.head_list) do
			slot5:DeleteMe()
		end

		slot0.head_list = {}
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
