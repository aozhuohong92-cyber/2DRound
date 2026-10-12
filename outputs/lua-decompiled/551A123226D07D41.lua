ArenateamHallTapInvitationPanel = class("ArenateamHallTapInvitationPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ArenateamController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format
slot5 = math.floor

function ArenateamHallTapInvitationPanel.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ArenateamHallTapInvitationPanel.setVisibleStatus(slot0, slot1)
	if not slot0.parent then
		return
	end

	slot0.visible_status = slot1 or false

	slot0:setVisible(slot1)

	if slot1 then
		uv0:sender27206()
	end
end

function ArenateamHallTapInvitationPanel.config(slot0)
end

function ArenateamHallTapInvitationPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenateam/arenateam_hall_tap_invitation_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.key_btn = slot0.container:getChildByName("key_btn")

	slot0.key_btn:getChildByName("label"):setString(TI18N("一键清除"))

	slot0.lay_srollview = slot0.container:getChildByName("lay_srollview")
end

function ArenateamHallTapInvitationPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.key_btn, function ()
		uv0:onKeyBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY, nil, nil, 1)

	if slot0.arenateam_invitation_list_event == nil then
		slot0.arenateam_invitation_list_event = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_INVITATION_LIST_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0.is_init = true

			uv0:setData(slot0)
		end)
	end

	if slot0.arenateam_key_clear_event == nil then
		slot0.arenateam_key_clear_event = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_KEY_CLEAR_EVENT, function (slot0)
			uv0.show_list = {}

			uv0:updateTeamlist()
		end)
	end
end

function ArenateamHallTapInvitationPanel.onKeyBtn(slot0)
	uv0:sender27208()
end

function ArenateamHallTapInvitationPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.scdata = slot1
	slot0.show_list = slot1.team_list

	table.sort(slot0.show_list, function (slot0, slot1)
		return slot1.team_power < slot0.team_power
	end)
	slot0:updateTeamlist()
end

function ArenateamHallTapInvitationPanel.updateTeamlist(slot0)
	if not slot0.show_list then
		return
	end

	if slot0.scrollview_list == nil then
		slot0.scrollview_list = CommonScrollViewSingleLayout.new(slot0.lay_srollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.lay_srollview:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 1,
			space_x = 0,
			item_width = 600,
			item_height = 153,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.scrollview_list:reloadData()

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.lay_srollview, true, {
			text = TI18N("暂无邀请信息")
		})
	else
		commonShowEmptyIcon(slot0.lay_srollview, false)
	end
end

function ArenateamHallTapInvitationPanel.createNewCell(slot0, slot1, slot2)
	return ArenateamHallTapInvitationItem.new(slot1, slot2, slot0.parent)
end

function ArenateamHallTapInvitationPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenateamHallTapInvitationPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ArenateamHallTapInvitationPanel.setCellTouched(slot0, slot1)
	if not slot0.show_list[slot1.index] then
		return
	end
end

function ArenateamHallTapInvitationPanel.DeleteMe(slot0)
	if slot0.arenateam_invitation_list_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_invitation_list_event)

		slot0.arenateam_invitation_list_event = nil
	end

	if slot0.arenateam_key_clear_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_key_clear_event)

		slot0.arenateam_key_clear_event = nil
	end

	if slot0.scrollview_list then
		slot0.scrollview_list:DeleteMe()

		slot0.scrollview_list = nil
	end
end

ArenateamHallTapInvitationItem = class("ArenateamHallTapInvitationItem", function ()
	return ccui.Widget:create()
end)

function ArenateamHallTapInvitationItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ArenateamHallTapInvitationItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenateam/arenateam_hall_tap_invitation_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))

	slot8 = slot2 * 0.5

	slot0.root_wnd:setPosition(slot1 * 0.5, slot8)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.team_name = slot0.main_container:getChildByName("team_name")
	slot0.power = slot0.main_container:getChildByName("power")
	slot0.head_list = {}

	for slot8 = 1, 3 do
		slot0.head_list[slot8] = PlayerHead.new(PlayerHead.type.circle)

		slot0.head_list[slot8]:setHeadLayerScale(0.8)
		slot0.head_list[slot8]:setPosition(58 + 95 * (slot8 - 1), 58)
		slot0.head_list[slot8]:setLev(99)
		slot0.main_container:addChild(slot0.head_list[slot8])
	end

	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")
	slot0.comfirm_label = slot0.comfirm_btn:getChildByName("label")

	slot0.comfirm_label:setString(TI18N("同 意"))

	slot0.cancel_btn = slot0.main_container:getChildByName("cancel_btn")
	slot0.cancel_btn_label = slot0.cancel_btn:getChildByName("label")

	slot0.cancel_btn_label:setString(TI18N("拒 绝"))
end

function ArenateamHallTapInvitationItem.register_event(slot0)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onArgeeBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	function slot4()
		uv0:onCancelBtn()
	end

	slot5 = true

	registerButtonEventListener(slot0.cancel_btn, slot4, slot5, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	for slot4, slot5 in ipairs(slot0.head_list) do
		slot5:addCallBack(function ()
			uv0:onClickHead(uv1)
		end)
	end
end

function ArenateamHallTapInvitationItem.onClickHead(slot0, slot1)
	if not (slot0.data.team_members or {})[slot1] then
		return
	end

	if slot0.head_list and slot0.head_list[slot1] then
		if RoleController:getInstance():getRoleVo() and slot3.rid == slot4.rid and slot3.sid == slot4.srv_id then
			message(TI18N("这是你自己~"))

			return
		end

		FriendController:getInstance():openFriendCheckPanel(true, {
			srv_id = slot3.sid,
			rid = slot3.rid
		})
	end
end

function ArenateamHallTapInvitationItem.onArgeeBtn(slot0)
	if not slot0.data then
		return
	end

	uv0:sender27207(slot0.data.tid, slot0.data.srv_id, 1)
end

function ArenateamHallTapInvitationItem.onCancelBtn(slot0)
	if not slot0.data then
		return
	end

	uv0:sender27207(slot0.data.tid, slot0.data.srv_id, 0)
end

function ArenateamHallTapInvitationItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.team_name:setString(slot0.data.team_name)
	slot0.power:setString(slot0.data.team_power)

	slot2 = slot1.team_members or {}

	for slot6, slot7 in ipairs(slot2) do
		slot7.is_leader = 0

		for slot11, slot12 in ipairs(slot7.ext) do
			if slot12.extra_key == 1 then
				if slot12.extra_val == 1 then
					slot7.is_leader = 1
				else
					slot7.is_leader = -slot7.pos
				end
			end
		end
	end

	function slot6(slot0, slot1)
		return slot1.is_leader < slot0.is_leader
	end

	uv0(slot2, slot6)

	for slot6, slot7 in ipairs(slot0.head_list) do
		if slot2[slot6] then
			slot7:setHeadRes(slot8.face_id, false, LOADTEXT_TYPE, slot8.face_file, slot8.face_update_time)
			slot7:setLev(slot8.lev)
			slot7:addDesc(false)

			if slot8.is_leader == 1 then
				slot7:showLeader(true)
			else
				slot7:showLeader(false)
			end

			slot9 = slot8.avatar_bid

			if slot7.record_res_bid == nil or slot7.record_res_bid ~= slot9 then
				slot7.record_res_bid = slot9

				if Config.AvatarData.data_avatar[slot9] then
					slot7:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot10.res_id or 1), false, false), nil, false, slot10.offy)
				else
					slot7:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
				end
			end
		else
			slot7:clearHead()
			slot7:closeLev()
			slot7:addDesc(true, TI18N("待加入"))
			slot7:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
		end
	end
end

function ArenateamHallTapInvitationItem.DeleteMe(slot0)
	if slot0.head_list then
		for slot4, slot5 in ipairs(slot0.head_list) do
			slot5:DeleteMe()
		end

		slot0.head_list = {}
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
