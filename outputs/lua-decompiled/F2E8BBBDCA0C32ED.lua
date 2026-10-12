RoleSystemSetPanel = RoleSystemSetPanel or BaseClass(BaseView)
slot1 = RoleController:getInstance():getModel()

function RoleSystemSetPanel.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.role_vo = uv0:getRoleVo()
	slot0.is_full_screen = true
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "roleinfo/role_system_set_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("rolepersonalspace", "rolepersonalspace"),
			type = ResourcesType.plist
		}
	}
end

function RoleSystemSetPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.win_title = slot0.main_container:getChildByName("win_title")

	slot0.win_title:setString(TI18N("系统设置"))

	slot0.page_name_1 = slot0.main_container:getChildByName("page_name_1")

	slot0.page_name_1:setString(TI18N("声音设置"))

	slot0.page_name_2 = slot0.main_container:getChildByName("page_name_2")

	slot0.page_name_2:setString(TI18N("其他设置"))

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.music_con = slot0.main_container:getChildByName("music_con")
	slot0.music_btn = slot0.music_con:getChildByName("music_btn")

	slot0.music_btn:getChildByName("name"):setString(TI18N("音乐"))

	slot0.sound_btn = slot0.music_con:getChildByName("sound_btn")

	slot0.sound_btn:getChildByName("name"):setString(TI18N("音效"))

	slot0.voice_btn = slot0.music_con:getChildByName("voice_btn")

	slot0.voice_btn:getChildByName("name"):setString(TI18N("语音"))

	slot0.auto_pk_btn = slot0.music_con:getChildByName("auto_pk_btn")

	slot0.auto_pk_btn:getChildByName("name"):setString(TI18N("切磋无需验证"))

	slot0.property_btn = slot0.music_con:getChildByName("property_btn")

	slot0.property_btn:getChildByName("name"):setString(TI18N("高品质"))

	slot0.chat_red_btn = slot0.music_con:getChildByName("chat_red_btn")

	slot0.chat_red_btn:getChildByName("name"):setString(TI18N("公频聊天红点"))

	slot0.quit_btn = slot0.main_container:getChildByName("quit_btn")

	slot0.quit_btn:getChildByName("label"):setString(TI18N("退出游戏"))

	slot0.switch_btn = slot0.main_container:getChildByName("switch_btn")

	slot0.switch_btn:getChildByName("label"):setString(TI18N("切换账号"))

	slot0.contact_btn = slot0.main_container:getChildByName("contact_btn")

	slot0.contact_btn:getChildByName("label"):setString(TI18N("Bug反馈"))

	slot0.exchange_btn = slot0.main_container:getChildByName("exchange_btn")

	slot0.exchange_btn:getChildByName("label"):setString(TI18N("礼包兑换"))

	slot0.share_btn = slot0.main_container:getChildByName("share_btn")

	slot0.share_btn:getChildByName("label"):setString(TI18N("游戏分享"))

	slot0.invitecode_btn = slot0.main_container:getChildByName("invitecode_btn")

	slot0.invitecode_btn:getChildByName("label"):setString(TI18N("推荐码"))
	slot0.main_container:getChildByName("sever_key"):setString(TI18N("当前区服："))

	slot0.sever_name = slot0.main_container:getChildByName("sever_name")

	if MAKELIFEBETTER or IS_APPLE_RMUI then
		slot0.contact_btn:setVisible(false)
		slot0.exchange_btn:setVisible(false)
		slot0.invitecode_btn:setVisible(false)
	end

	if not SHOW_GAME_SHARE then
		slot0.share_btn:setVisible(false)
	end

	if not SHOW_SINGLE_INVICODE then
		slot0.invitecode_btn:setVisible(false)
	end

	if IS_WIN_PLATFORM then
		slot0.switch_btn:setVisible(false)
	end

	if FILTER_EXCHANGE then
		slot0.exchange_btn:setVisible(false)
	end
end

function RoleSystemSetPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openRoleSystemSetPanel(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openRoleSystemSetPanel(false)
	end, true, 2)
	registerButtonEventListener(slot0.quit_btn, function ()
		sdkOnExit()
	end, true, 1)
	registerButtonEventListener(slot0.switch_btn, function ()
		AudioManager:getInstance():stopMusic()
		sdkOnSwitchAccount()
	end, true, 1)
	registerButtonEventListener(slot0.contact_btn, function ()
		NoticeController:getInstance():openServiceCenterWindow(true)
	end, true, 1)
	registerButtonEventListener(slot0.share_btn, function ()
		WelfareController:getInstance():openMainWindow(true, WelfareIcon.share_game)
	end, true, 1)
	registerButtonEventListener(slot0.invitecode_btn, function ()
		WelfareController:getInstance():openMainWindow(true, WelfareIcon.invicode)
	end, true, 1)
	registerButtonEventListener(slot0.exchange_btn, function ()
		uv0:onExchangeBtn()
	end, true, 1)
	slot0.music_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.music_is_open, true, false)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.music_is_open, false, false)
		end
	end)
	slot0.sound_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.audio_is_open, true, false)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.audio_is_open, false, false)
		end
	end)
	slot0.voice_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.voice_is_open, true, false)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.voice_is_open, false, false)
		end
	end)
	slot0.auto_pk_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			uv0:sender10318(1)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			uv0:sender10318(0)
		end
	end)
	slot0.chat_red_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.chat_red_open, true, false)
			GlobalEvent:getInstance():Fire(EventId.CHAT_NEWMSG_FLAG)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.chat_red_open, false, false)
			GlobalEvent:getInstance():Fire(EventId.CHAT_NEWMSG_FLAG)
		end
	end)
	slot0.property_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.high_quality, true, false)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.high_quality, false, false)
		end
	end)
	slot0:addGlobalEvent(NoticeEvent.All_Feedback_Event_Data, function ()
		addRedPointToNodeByStatus(uv0.contact_btn, NoticeController:getInstance():getModel():getRedStatus() or false, 6, 6, nil)
	end)
end

function RoleSystemSetPanel.onExchangeBtn(slot0)
	CommonAlert.showInputApply(nil, TI18N("请输入正确的兑换码"), TI18N("兑换"), function (slot0)
		if slot0 == nil or slot0 == "" then
			message(TI18N("请输入正确的兑换码"))

			return
		end

		uv0:sender10945(string.gsub(slot0, "\n", ""))
	end, nil, nil, true, function ()
	end, 18, CommonAlert.type.rich, FALSE)
end

function RoleSystemSetPanel.openRootWnd(slot0)
	slot0:setData()
	NoticeController:getInstance():sender10813()
end

function RoleSystemSetPanel.setData(slot0)
	slot0.music_btn:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.music_is_open, true))
	slot0.sound_btn:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.audio_is_open, true))
	slot0.voice_btn:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.voice_is_open, true))
	slot0.auto_pk_btn:setSelected(slot0.role_vo.auto_pk == 1)
	slot0.property_btn:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.high_quality, true))
	slot0.chat_red_btn:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.chat_red_open, true))
	slot0.sever_name:setString(getServerName(slot0.role_vo.srv_id) or "")
end

function RoleSystemSetPanel.close_callback(slot0)
	SysEnv:getInstance():save()
	uv0:openRoleSystemSetPanel(false)
end
