ArenaManyPeopleHallInvitationPanel = class("ArenaManyPeopleHallInvitationPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ArenaManyPeopleController:getInstance():getModel()
slot2 = table.sort
slot3 = string.format

function ArenaManyPeopleHallInvitationPanel.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ArenaManyPeopleHallInvitationPanel.setVisibleStatus(slot0, slot1)
	if not slot0.parent then
		return
	end

	slot0.visible_status = slot1 or false

	slot0:setVisible(slot1)

	if slot1 then
		uv0:sender29003()
	end
end

function ArenaManyPeopleHallInvitationPanel.config(slot0)
end

function ArenaManyPeopleHallInvitationPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenamanypeople/amp_hall_invitation_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.key_btn = slot0.container:getChildByName("key_btn")

	slot0.key_btn:getChildByName("label"):setString(TI18N("全部拒绝"))

	slot0.lay_srollview = slot0.container:getChildByName("lay_srollview")
end

function ArenaManyPeopleHallInvitationPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.key_btn, function ()
		uv0:onKeyBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY, nil, nil, 1)

	if slot0.arenateam_invitation_list_event == nil then
		slot0.arenateam_invitation_list_event = GlobalEvent:getInstance():Bind(ArenaManyPeopleEvent.ARENAMANYPOEPLE_INVITATION_LIST_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0.is_init = true

			uv0:setData(slot0)
		end)
	end

	if slot0.arenateam_key_clear_event == nil then
		slot0.arenateam_key_clear_event = GlobalEvent:getInstance():Bind(ArenaManyPeopleEvent.ARENAMANYPOEPLE_KEY_CLEAR_EVENT, function (slot0)
			uv0.show_list = {}

			uv0:updateTeamlist()
		end)
	end
end

function ArenaManyPeopleHallInvitationPanel.onKeyBtn(slot0)
	uv0:sender29005()
end

function ArenaManyPeopleHallInvitationPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.scdata = slot1
	slot0.show_list = slot1.team_members

	uv0(slot0.show_list, function (slot0, slot1)
		return slot1.power < slot0.power
	end)
	slot0:updateTeamlist()
end

function ArenaManyPeopleHallInvitationPanel.updateTeamlist(slot0)
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
			item_height = 135,
			space_y = 5,
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

function ArenaManyPeopleHallInvitationPanel.createNewCell(slot0, slot1, slot2)
	return ArenaManyPeopleHallInvitationItem.new(slot1, slot2)
end

function ArenaManyPeopleHallInvitationPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenaManyPeopleHallInvitationPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ArenaManyPeopleHallInvitationPanel.DeleteMe(slot0)
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

ArenaManyPeopleHallInvitationItem = class("ArenaManyPeopleHallInvitationItem", function ()
	return ccui.Widget:create()
end)

function ArenaManyPeopleHallInvitationItem.ctor(slot0, slot1, slot2)
	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ArenaManyPeopleHallInvitationItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenamanypeople/amp_hall_invitation_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.team_name = slot0.main_container:getChildByName("team_name")
	slot0.power = slot0.main_container:getChildByName("power")
	slot0.head_icon = PlayerHead.new(PlayerHead.type.circle)

	slot0.head_icon:setHeadLayerScale(0.9)
	slot0.head_icon:setPosition(153, 67.5)
	slot0.main_container:addChild(slot0.head_icon)
	slot0.head_icon:addCallBack(function ()
		uv0:onClickHead()
	end)

	slot0.power_bg = slot0.main_container:getChildByName("Image_1")
	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")
	slot0.comfirm_label = slot0.comfirm_btn:getChildByName("label")

	slot0.comfirm_label:setString(TI18N("同 意"))

	slot0.cancel_btn = slot0.main_container:getChildByName("cancel_btn")
	slot0.cancel_btn_label = slot0.cancel_btn:getChildByName("label")

	slot0.cancel_btn_label:setString(TI18N("拒 绝"))

	slot0.limit_level_title = slot0.main_container:getChildByName("limit_level_title")

	slot0.limit_level_title:setString(TI18N("排名"))

	slot0.limit_rank = slot0.main_container:getChildByName("limit_level")

	slot0.limit_rank:setString(TI18N("无"))

	slot0.limit_score = slot0.main_container:getChildByName("limit_power")

	slot0.limit_score:setString(TI18N("无"))
end

function ArenaManyPeopleHallInvitationItem.register_event(slot0)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onArgeeBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.cancel_btn, function ()
		uv0:onCancelBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
end

function ArenaManyPeopleHallInvitationItem.onClickHead(slot0)
	if not slot0.data then
		return
	end

	if RoleController:getInstance():getRoleVo() and slot0.data.rid == slot1.rid and slot0.data.sid == slot1.srv_id then
		message(TI18N("这是你自己~"))

		return
	end

	FriendController:getInstance():openFriendCheckPanel(true, {
		srv_id = slot0.data.sid,
		rid = slot0.data.rid
	})
end

function ArenaManyPeopleHallInvitationItem.onArgeeBtn(slot0)
	if not slot0.data then
		return
	end

	uv0:sender29004(slot0.data.rid, slot0.data.sid, 1)
end

function ArenaManyPeopleHallInvitationItem.onCancelBtn(slot0)
	if not slot0.data then
		return
	end

	uv0:sender29004(slot0.data.rid, slot0.data.sid, 0)
end

function ArenaManyPeopleHallInvitationItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.team_name:setString(slot0.data.name)
	slot0.power:setString(tostring(slot0.data.power))
	slot0.power_bg:setContentSize(cc.size(slot0.power:getContentSize().width + 55, slot0.power_bg:getContentSize().height))

	if slot1.rank > 0 then
		slot0.limit_rank:setString(tostring(slot0.data.rank))
	else
		slot0.limit_rank:setString(TI18N("未上榜"))
	end

	slot0.limit_score:setString(uv0(TI18N("积分：%d"), slot0.data.score))

	if slot0.head_icon then
		slot0.head_icon:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
		slot0.head_icon:setLev(slot1.lev)
		slot0.head_icon:addDesc(false)

		slot4 = slot1.avatar_bid

		if slot0.head_icon.record_res_bid == nil or slot0.head_icon.record_res_bid ~= slot4 then
			slot0.head_icon.record_res_bid = slot4

			if Config.AvatarData.data_avatar[slot4] then
				slot0.head_icon:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot5.res_id or 1), false, false), nil, false, slot5.offy)
			else
				slot0.head_icon:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
			end
		end
	end
end

function ArenaManyPeopleHallInvitationItem.DeleteMe(slot0)
	if slot0.head_icon then
		slot0.head_icon:DeleteMe()

		slot0.head_icon = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
