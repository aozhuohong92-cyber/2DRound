ChatRepoprtWindow = ChatRepoprtWindow or BaseClass(BaseView)
slot0 = ChatController:getInstance()
slot2 = FriendController:getInstance():getModel()

function ChatRepoprtWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.layout_name = "friend/chat_report_window"
end

function ChatRepoprtWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("操作提示"))

	slot0.notice_txt = slot1:getChildByName("notice")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.friend_btn = slot1:getChildByName("friend_btn")
	slot0.friend_btn_label = slot0.friend_btn:getChildByName("label")

	slot0.friend_btn_label:setString(TI18N("加好友"))
	slot0.friend_btn:setVisible(false)

	slot0.report_btn = slot1:getChildByName("report_btn")

	slot0.report_btn:getChildByName("label"):setString(TI18N("举报"))

	slot0.blacklist_btn = slot1:getChildByName("blacklist_btn")
	slot0.blacklist_btn_label = slot0.blacklist_btn:getChildByName("label")

	slot0.blacklist_btn_label:setString(TI18N("加黑名单"))
end

function ChatRepoprtWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openChatReportWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openChatReportWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.friend_btn, handler(slot0, slot0.onClickFriendBtn), true)
	registerButtonEventListener(slot0.report_btn, handler(slot0, slot0.onClickReportBtn), true)
	registerButtonEventListener(slot0.blacklist_btn, handler(slot0, slot0.onClickBlacklistBtn), true)
end

function ChatRepoprtWindow.onClickFriendBtn(slot0)
	if not slot0.data then
		return
	end

	if uv0:isFriend(slot0.data.srv_id, slot0.data.rid) then
		uv1:openChatPanel(ChatConst.Channel.Friend, "friend", slot0.data)
		uv1:openChatReportWindow(false)
	else
		uv2:addOther(slot0.data.srv_id, slot0.data.rid)
		uv1:openChatReportWindow(false)
	end
end

function ChatRepoprtWindow.onClickReportBtn(slot0)
	if not slot0.data then
		return
	end

	if Config.RoleData.data_role_const.role_reported_lev_limit and ((RoleController:getInstance():getRoleVo() or {}).lev or 0) < slot1.val then
		message(slot1.val .. TI18N("级开放举报功能"))

		return
	end

	RoleController:getInstance():openRoleReportedPanel(true, slot0.data.rid, slot0.data.srv_id, slot0.data.name)
	uv0:openChatReportWindow(false)
end

function ChatRepoprtWindow.onClickBlacklistBtn(slot0)
	if not slot0.data then
		return
	end

	if FriendController:getInstance():getModel():isBlack(slot0.data.rid, slot0.data.srv_id) then
		ChatController:getInstance():closeChatUseAction()
		FriendController:getInstance():openFriendWindow(true, FriendConst.Type.BlackList)
	else
		CommonAlert.show(string.format(TI18N("被列入黑名单后将无法接收到该玩家发出的消息\n是否确认将<div fontColor=#289b14 fontsize= 26>%s</div>列入黑名单？\n（若为好友则会把该玩家从好友列表里删除）"), slot0.data.name), TI18N("确定"), function ()
			FriendController:getInstance():addToBlackList(uv0.data.rid, uv0.data.srv_id)
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil)
	end

	uv0:openChatReportWindow(false)
end

function ChatRepoprtWindow.openRootWnd(slot0, slot1, slot2)
	slot0.data = slot1
	slot0.view_type = slot2 or 1

	slot0.notice_txt:setString(string.format(TI18N("您需要对玩家【%s】执行的操作是"), slot0.data.name or ""))

	if slot0.view_type == 1 then
		if uv0:isBlack(slot0.data.rid, slot0.data.srv_id) then
			slot0.blacklist_btn_label:setString(TI18N("黑名单"))
		else
			slot0.blacklist_btn_label:setString(TI18N("加黑名单"))
		end

		slot0.blacklist_btn:setVisible(true)
		slot0.blacklist_btn:setPositionY(120)
		slot0.report_btn:setPositionY(238)
	else
		slot0.blacklist_btn:setVisible(false)

		if uv0:isFriend(slot1.srv_id, slot1.rid) then
			slot0.friend_btn:setVisible(true)
			slot0.friend_btn_label:setString(TI18N("私聊"))
		elseif uv0:isBlack(slot1.rid, slot1.srv_id) then
			slot0.friend_btn:setVisible(false)
			slot0.report_btn:setPositionY(180)
		end
	end
end

function ChatRepoprtWindow.close_callback(slot0)
	uv0:openChatReportWindow(false)
end
