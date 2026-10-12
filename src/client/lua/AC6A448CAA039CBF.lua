GuildOperationPostWindow = GuildOperationPostWindow or BaseClass(BaseView)
slot0 = GuildController:getInstance()
slot1 = GuildController:getInstance():getModel()
slot2 = string.format

function GuildOperationPostWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.set_index = 1
	slot0.condition_index = 1
	slot0.layout_name = "guild/guild_operation_post_window"
end

function GuildOperationPostWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("管理设置"))

	slot0.notice = slot1:getChildByName("notice")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.setleader_btn = slot1:getChildByName("setleader_btn")

	slot0.setleader_btn:getChildByName("label"):setString(TI18N("转让会长"))

	slot0.setmember_btn = slot1:getChildByName("setmember_btn")
	slot0.setmember_btn_label = slot0.setmember_btn:getChildByName("label")
	slot0.center_y = slot0.setmember_btn:getPositionY()
	slot0.kickout_btn = slot1:getChildByName("kickout_btn")

	slot0.kickout_btn:getChildByName("label"):setString(TI18N("移除出公会"))
end

function GuildOperationPostWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openGuildOperationPostWindow(false)
		end
	end)
	registerButtonEventListener(slot0.background, function ()
		uv0:openGuildOperationPostWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.setleader_btn, function ()
		if uv0.data ~= nil then
			CommonAlert.show(string.format(TI18N("转让后您的身份将变为普通成员，是否确认将会长职位转让给【%s】？"), uv0.data.name), TI18N("确定"), function ()
				uv0:requestOperationPost(uv1.data.rid, uv1.data.srv_id, GuildConst.post_type.leader)
			end, TI18N("取消"), nil, CommonAlert.type.rich, nil, {
				off_y = 10,
				timer = 5,
				timer_for = true
			}, 26)
		end
	end, true)
	slot0.setmember_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if slot0.index ~= nil and uv0.data ~= nil then
				uv1:requestOperationPost(uv0.data.rid, uv0.data.srv_id, slot0.index)
			end
		end
	end)
	slot0.kickout_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data ~= nil then
				uv1:requestKickoutMember(uv0.data.rid, uv0.data.srv_id, uv0.data.name)
			end
		end
	end)
end

function GuildOperationPostWindow.openRootWnd(slot0, slot1)
	if slot1 ~= nil then
		slot0.data = slot1

		slot0.notice:setString(string.format(TI18N("你要对【%s】玩家执行的操作是"), slot1.name))

		if slot1.role_post == GuildConst.post_type.leader then
			if slot1.post == GuildConst.post_type.assistant then
				slot0.setmember_btn_label:setString(TI18N("罢免副会长"))

				slot0.setmember_btn.index = GuildConst.post_type.member
			else
				slot0.setmember_btn.index = GuildConst.post_type.assistant

				slot0.setmember_btn_label:setString(TI18N("任命副会长"))
			end
		elseif slot1.role_post == GuildConst.post_type.assistant then
			if slot1.post == GuildConst.post_type.member then
				slot0.kickout_btn:setPositionY(slot0.center_y)
				slot0.setleader_btn:setVisible(false)
				slot0.setmember_btn:setVisible(false)
			else
				slot0.kickout_btn:setVisible(false)
				slot0.setleader_btn:setVisible(false)
				slot0.setmember_btn:setVisible(false)
			end
		end
	end
end

function GuildOperationPostWindow.close_callback(slot0)
	CommonAlert.closeAllWin()
	uv0:openGuildOperationPostWindow(false)
end
