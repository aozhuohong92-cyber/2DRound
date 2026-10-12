EnterPanel = class("EnterPanel", function ()
	return ccui.Widget:create()
end)

function EnterPanel.ctor(slot0, slot1, slot2)
	slot0.ctrl = slot2
	slot0.size = slot1 and slot1:getContentSize() or cc.size(SCREEN_WIDTH, SCREEN_HEIGHT)
	slot0.last_login = 0
	slot0.model = slot0.ctrl:getModel()
	slot0.data = slot0.model:getLoginData()

	slot0:setContentSize(slot0.size)
	slot0:setPosition(slot0.size.width / 2, slot0.size.height / 2)
	slot0:setCascadeOpacityEnabled(true)
	slot0:layoutUI()
	slot0:registerEvent()
end

function EnterPanel.layoutUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("login/enter_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width / 2, slot0.size.height / 2)

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.btn_user_center = slot1:getChildByName("btn_user_center")

	slot0.btn_user_center:setPosition(display.getLeft() + 50, display.getTop() - 50)

	slot0.btn_notice = slot1:getChildByName("btn_notice")

	slot0.btn_notice:setPosition(display.getLeft() + 50, slot0.btn_user_center:getPositionY() - slot0.btn_user_center:getContentSize().height - 10)

	slot0.logo = slot1:getChildByName("logo")
	slot0.logo_img = slot0.logo:getChildByName("logo_img")

	if IS_NEED_SHOW_LOGO == false then
		slot0.logo_img:setVisible(false)
	else
		loadSpriteTexture(slot0.logo_img, PathTool.getLogoRes(), LOADTEXT_TYPE)
		slot0.logo_img:setVisible(true)
	end

	slot0.logo_size = slot0.logo:getContentSize()
	slot0.btn_login_server = slot1:getChildByName("btn_login_server")

	slot0.btn_login_server:setCascadeOpacityEnabled(true)
	slot0.btn_login_server:setVisible(false)

	slot0.icon_state = slot0.btn_login_server:getChildByName("icon_state")
	slot0.txt_cur_server = slot0.btn_login_server:getChildByName("txt_cur_server")

	slot0.txt_cur_server:setString("")

	slot0.btn_label = slot0.btn_login_server:getChildByName("btn_label")

	slot0.btn_label:setString(TI18N(""))

	if FINAL_SERVERS ~= nil then
		slot0.btn_label:setVisible(false)
	end

	slot0.stateIcon = slot0.btn_login_server:getChildByName("stateIcon")

	loadSpriteTexture(slot0.stateIcon, PathTool.getResFrame("login2", "txt_cn_login2_1008"), LOADTEXT_TYPE)
	slot0.stateIcon:setVisible(false)

	slot0.btn_enter = slot1:getChildByName("btn_enter")
	slot0.checkbox = slot1:getChildByName("checkbox")
	slot0.checkbox_lable = createRichLabel(22, cc.c3b(255, 255, 255), cc.p(0, 0.5), cc.p(140, 238), nil, nil, 1000)

	slot1:addChild(slot0.checkbox_lable)
	slot0.checkbox_lable:setString(TI18N("<div fontcolor=#ffffff outline=2,#000000>我已详细阅读并同意<div href=onclick_1 fontcolor=#eab95b outline=2,#000000>游戏用户协议</div>和<div href=onclick_2 fontcolor=#eab95b outline=2,#000000>隐私保护指引</div></div>"))
	slot0.checkbox_lable:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		if slot1 == "onclick_1" then
			if IS_IOS_PLATFORM == true then
				sdkCallFunc("openSyW", "https://www.baidu.com")
			else
				sdkCallFunc("openUrl", slot4)
			end
		elseif slot1 == "onclick_2" then
			if IS_IOS_PLATFORM == true then
				sdkCallFunc("openSyW", "https://www.baidu.com")
			else
				sdkCallFunc("openUrl", slot4)
			end
		end
	end, {
		"click",
		"href"
	})

	slot0.is_agree = SysEnv:getInstance():getBool(SysEnv.keys.user_proto_agree, false)

	slot0.checkbox:setSelected(slot0.is_agree)

	if MAKELIFEBETTER == true or IS_APPLE_RMUI == true then
		slot0.btn_notice:setVisible(false)
		slot0.logo:setVisible(false)
		slot0.btn_user_center:setVisible(false)
	else
		if NEED_SHOW_REPAIR == true then
			slot0.btn_repair = slot1:getChildByName("btn_repair")

			slot0.btn_repair:setPosition(display.getLeft() + 50, slot0.btn_notice:getPositionY() - slot0.btn_notice:getContentSize().height - 10)
			slot0.btn_repair:setVisible(true)
		end

		if canAddScannig() then
			slot0.btn_scan = slot1:getChildByName("btn_scan")

			slot0.btn_scan:setVisible(true)

			if slot0.btn_repair then
				slot0.btn_scan:setPosition(display.getLeft() + 50, slot0.btn_repair:getPositionY() - slot0.btn_repair:getContentSize().height - 10)
			else
				slot0.btn_scan:setPosition(display.getLeft() + 50, slot0.btn_notice:getPositionY() - slot0.btn_notice:getContentSize().height - 10)
			end
		end
	end

	slot3 = display.getBottom(slot1)

	slot0.logo:setPositionY(display.getTop(slot1) - 248)

	if checkUserProto and checkUserProto() then
		slot0.btn_login_server:setPositionY(slot3 + 320)
		slot0.btn_enter:setPositionY(slot3 + 238)
		slot0.checkbox:setPositionY(slot3 + 170)
		slot0.checkbox_lable:setPositionY(slot3 + 170)
	else
		slot0.btn_login_server:setPositionY(slot3 + 285)
		slot0.btn_enter:setPositionY(slot3 + 170)
		slot0.checkbox:setVisible(false)
		slot0.checkbox_lable:setVisible(false)
	end

	slot0:iosStoreTemp(slot1)

	if needMourning() then
		setChildUnEnabled(true, slot0.logo)
		setChildUnEnabled(true, slot0.btn_repair)
		setChildUnEnabled(true, slot0.btn_repair)
		setChildUnEnabled(true, slot0.btn_scan)
		setChildUnEnabled(true, slot0.btn_notice)
		setChildUnEnabled(true, slot0.btn_user_center)
		setChildUnEnabled(true, slot0.btn_login_server)
		setChildUnEnabled(true, slot0.btn_enter)
		setChildUnEnabled(true, slot0.checkbox)
		slot0.checkbox_lable:setString(TI18N("<div fontcolor=#818181 >我已详细阅读并同意<div href=onclick_1 fontcolor=#818181 >游戏用户协议</div>和<div href=onclick_2 fontcolor=#818181 >隐私保护指引</div></div>"))
	end
end

function EnterPanel.iosStoreTemp(slot0, slot1)
	slot0.btn_mok_0 = ccui.Layout:create()

	slot0.btn_mok_0:setCascadeOpacityEnabled(true)
	slot0.btn_mok_0:setAnchorPoint(0.5, 0.5)
	slot0.btn_mok_0:setTouchEnabled(true)
	slot0.btn_mok_0:setContentSize(cc.size(100, 100))
	slot0.btn_mok_0:setPosition(cc.p(200, 1000))

	slot0.btn_mok_1 = ccui.Layout:create()

	slot0.btn_mok_1:setCascadeOpacityEnabled(true)
	slot0.btn_mok_1:setAnchorPoint(0.5, 0.5)
	slot0.btn_mok_1:setTouchEnabled(true)
	slot0.btn_mok_1:setContentSize(cc.size(100, 100))
	slot0.btn_mok_1:setPosition(cc.p(400, 900))

	slot0.btn_mok_2 = ccui.Layout:create()

	slot0.btn_mok_2:setCascadeOpacityEnabled(true)
	slot0.btn_mok_2:setAnchorPoint(0.5, 0.5)
	slot0.btn_mok_2:setTouchEnabled(true)
	slot0.btn_mok_2:setContentSize(cc.size(100, 100))
	slot0.btn_mok_2:setPosition(cc.p(600, 800))
	slot0.btn_mok_0:setTouchEnabled(true)
	slot0.btn_mok_1:setTouchEnabled(true)
	slot0.btn_mok_2:setTouchEnabled(true)
	slot1:addChild(slot0.btn_mok_0)
	slot1:addChild(slot0.btn_mok_1)
	slot1:addChild(slot0.btn_mok_2)
	slot0.btn_mok_0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			print("btn_mok_0")

			if IS_IOS_PLATFORM then
				nativeSdkClickEvent("login[enter_panel]", "btn_mok_0")
			end
		end
	end)
	slot0.btn_mok_1:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			print("btn_mok_1")

			if IS_IOS_PLATFORM then
				nativeSdkClickEvent("login[enter_panel]", "btn_mok_1")
			end
		end
	end)
	slot0.btn_mok_2:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			print("btn_mok_2")

			if IS_IOS_PLATFORM then
				nativeSdkClickEvent("login[enter_panel]", "btn_mok_2")
			end
		end
	end)
end

function EnterPanel.registerEvent(slot0)
	slot0.btn_enter:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if IS_IOS_PLATFORM then
				nativeSdkClickEvent("login[enter_panel]", "btn_enter")
			end

			playButtonSound2()
			uv0:requestEnterGame()
		end
	end)
	registerButtonEventListener(slot0.checkbox, function ()
		uv0.is_agree = uv0.checkbox:isSelected()

		SysEnv:getInstance():set(SysEnv.keys.user_proto_agree, uv0.is_agree, true)
	end, false, 1)
	registerButtonEventListener(slot0.btn_repair, function ()
		CommonAlert.show(TI18N("该操作会清除本地的补丁并重新下载补丁,请在良好的网络环境下进行"), TI18N("确定"), function ()
			cc.UserDefault:getInstance():setIntegerForKey("lasted_main_version", BUILD_VERSION)
			cc.UserDefault:getInstance():setIntegerForKey("lasted_version", 0)
			cc.UserDefault:getInstance():setIntegerForKey("local_version", 0)
			cc.UserDefault:getInstance():setIntegerForKey("local_try_version", 0)
			cc.UserDefault:getInstance():flush()

			if cc.FileUtils:getInstance():isDirectoryExist(string.format("%sassets/", cc.FileUtils:getInstance():getWritablePath())) then
				cc.FileUtils:getInstance():removeDirectory(slot0)
			end

			if cc.FileUtils:getInstance():isDirectoryExist(string.format("%stryver/", cc.FileUtils:getInstance():getWritablePath())) then
				cc.FileUtils:getInstance():removeDirectory(slot0)
			end

			if cc.FileUtils:getInstance():isDirectoryExist(string.format("%svoice/", cc.FileUtils:getInstance():getWritablePath())) then
				cc.FileUtils:getInstance():removeDirectory(slot0)
			end

			sdkOnSwitchAccount()
		end, TI18N("取消"))
	end, false, 1)

	if slot0.btn_scan then
		slot0.btn_scan:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				slot2 = LoginController:getInstance():getModel():getLoginData()

				callFunc("scanning", string.format("{\"ip\":\"%s\", \"port\":\"%s\", \"host\":\"%s\", \"rid\":\"%s\", \"srv_id\":\"%s\", \"usrName\":\"%s\", \"srv_name\":\"%s\"}", slot2.ip, slot2.port, slot2.host, slot2.rid, slot2.srv_id, slot2.usrName, slot2.srv_name))
			end
		end)
	end

	slot0.btn_login_server:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if IS_IOS_PLATFORM then
				nativeSdkClickEvent("login[enter_panel]", "btn_login_server")
			end

			if IS_EXPERT == true then
				return
			end

			if FINAL_SERVERS ~= nil then
				return
			end

			if checkUserProto and checkUserProto() and not uv0.is_agree then
				message(TI18N("请勾选同意开始游戏按钮下方的 用户协议 和 隐私保护指引,即可选择服务器"))

				return
			end

			if uv0.model:getServerList() == nil or next(uv0.model:getServerList()) == nil or uv0.model:getSverListStatus() == false then
				message(TI18N("服务器列表正在加载中..."))
				uv0.model:checkReloadServerData()

				return
			end

			uv0.ctrl:openView(LoginController.type.server_list)
		end
	end)
	slot0.btn_user_center:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if IS_IOS_PLATFORM then
				nativeSdkClickEvent("login[enter_panel]", "btn_user_center")
			end

			sdkOnSwitchAccount()
		end
	end)
	slot0.btn_notice:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			NoticeController:getInstance():openNoticeView()
		end
	end)

	if not slot0.defaule_server_success_event then
		slot0.defaule_server_success_event = GlobalEvent:getInstance():Bind(LoginEvent.DEFAULE_SERVER_SUCCESS, function ()
			uv0:updateChoseServerName()
		end)
	end
end

function EnterPanel.updateChoseServerName(slot0)
	slot0.btn_label:setString(TI18N("选择服务器"))
end

function EnterPanel.requestEnterGame(slot0, slot1)
	if checkUserProto and checkUserProto() and not slot0.is_agree and not slot1 then
		message(TI18N("请勾选同意开始游戏按钮下方的 协议 和 隐私保护指引,即可进入游戏"))

		return
	end

	slot0.is_agree = true

	slot0.checkbox:setSelected(slot0.is_agree)

	function slot2()
		if uv0.model:getLoginData().srv_id == nil or slot0.srv_id == "" or slot0.usrName == "" then
			uv0.ctrl:openView(LoginController.type.user_input)

			return
		end

		if slot0.ip == nil or #slot0.ip == 0 then
			message(TI18N("当前服务器不可用"))
			uv0.ctrl:openView(LoginController.type.server_list)

			return
		end

		if os.time() - uv0.last_login > (RECONNEST_INTERVAL or 5) then
			uv0.last_login = os.time()

			uv0.ctrl:requestLoginGame(slot0.usrName, slot0.ip, slot0.port, true, true)
		end
	end

	if os.time() - slot0.last_login <= (RECONNEST_INTERVAL or 5) then
		return
	end

	slot3 = slot0.model:getLoginData()

	if NEED_CHECK_CLOSE and not slot0.model:isWhite() and (slot3.isClose or GameNet:getInstance():getTime() - slot3.open_time < 0) then
		slot0.model:checkReloadServerData(slot3)

		return
	end

	if not slot0.model:isNeedReload(TI18N("优先体验服变换，需要重新加载资源才能进入游戏"), slot3, sdkOnSwitchAccount) then
		slot0.model:saveCurSrv()
		slot2()
	end
end

function EnterPanel.update(slot0)
	slot0:reselectedTarget()
end

function EnterPanel.effectHandler(slot0)
	if slot0.hasShowFinish then
		return
	end

	slot0.logo:stopAllActions()
	slot0.btn_login_server:stopAllActions()
	slot0.btn_enter:stopAllActions()
	slot0.txt_cur_server:setVisible(false)
	slot0.icon_state:setVisible(false)
	slot0.stateIcon:setVisible(false)
	slot0.btn_label:setVisible(false)
	slot0.btn_login_server:setOpacity(0)
	slot0.btn_enter:setOpacity(0)
	slot0.logo:setScale(0)
	slot0.logo:setOpacity(0)
	slot0.checkbox:setOpacity(0)
	slot0.checkbox_lable:setOpacity(0)
	slot0.logo:runAction(cc.Sequence:create(cc.Spawn:create(cc.ScaleTo:create(0.5, 1), cc.FadeIn:create(0.5)), cc.CallFunc:create(function ()
		uv0.btn_login_server:runAction(cc.Sequence:create(cc.FadeIn:create(0.5), cc.CallFunc:create(function ()
			uv0.txt_cur_server:setVisible(true)

			if FINAL_SERVERS == nil then
				uv0.btn_label:setVisible(true)
			end

			uv0.icon_state:setVisible(true)

			if IS_NEED_LOGIN_EFFECT == true and not uv0.spine and not isVestPackage() then
				uv0.spine = createEffectSpine(PathTool.getEffectRes(122), cc.p(uv0.logo_size.width / 2 - 28, uv0.logo_size.height / 2 - 64), cc.p(0.5, 0.5), true, PlayerAction.action, nil, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

				uv0.logo:addChild(uv0.spine)
			end

			if uv0.need_show_status then
				uv0.stateIcon:setVisible(true)
			end
		end)))
		uv0.btn_enter:runAction(cc.Sequence:create(cc.FadeIn:create(0.5)))
		uv0.checkbox:runAction(cc.Sequence:create(cc.FadeIn:create(0.5)))
		uv0.checkbox_lable:runAction(cc.Sequence:create(cc.FadeIn:create(0.5)))
	end)))

	slot0.hasShowFinish = true
	slot3 = true

	if next(slot0.model.loginData.newNameList or {}) == nil then
		if slot0.is_agree then
			slot3 = false
		end

		SysEnv:getInstance():set(SysEnv.keys.user_proto_name_list, {
			{
				usr = slot0.model.loginData.usrName
			}
		}, true)
	else
		for slot7, slot8 in ipairs(slot2) do
			if slot8.usr == slot0.model.loginData.usrName then
				slot3 = false

				break
			end
		end

		if slot3 then
			slot0.is_agree = false

			slot0.checkbox:setSelected(slot0.is_agree)
			SysEnv:getInstance():set(SysEnv.keys.user_proto_agree, slot0.is_agree, false)
			table.insert(slot2, 1, {
				usr = slot0.model.loginData.usrName
			})
			SysEnv:getInstance():set(SysEnv.keys.user_proto_name_list, slot2, true)
		end
	end

	if slot3 and checkUserProto and checkUserProto() then
		slot0.ctrl:openUserProtoPanel(true, function ()
			uv0:requestEnterGame(true)
		end)
	end
end

function EnterPanel.DeleteMe(slot0)
	if slot0.spine then
		slot0.spine:setVisible(false)
		slot0.spine:clearTracks()
		slot0.spine:removeFromParent()
	end

	if slot0.btn_enter and not tolua.isnull(slot0.btn_enter) then
		slot0.btn_enter:stopAllActions()
	end

	if slot0.defaule_server_success_event then
		GlobalEvent:getInstance():UnBind(slot0.defaule_server_success_event)

		slot0.defaule_server_success_event = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

function EnterPanel.reselectedTarget(slot0)
	slot0.data = slot0.model:getLoginData()
	slot0.need_show_status = false

	if slot0.data == nil or slot0.data.usrName == nil or slot0.data.usrName == "" then
		slot0.btn_login_server:setVisible(false)
	else
		slot0.btn_login_server:setVisible(true)

		slot2 = nil

		if slot0.data.isClose then
			slot2 = 2

			setChildUnEnabled(true, slot0.stateIcon)
		elseif slot1.isNew then
			setChildUnEnabled(false, slot0.stateIcon)

			slot2 = 0
		else
			setChildUnEnabled(false, slot0.stateIcon)

			slot2 = 1
		end

		slot0.need_show_status = slot2 ~= 1

		if slot2 ~= 1 then
			loadSpriteTexture(slot0.stateIcon, PathTool.getResFrame("login2", "txt_cn_login2_1008"), LOADTEXT_TYPE_PLIST)
		end

		slot0.stateIcon:setVisible(slot0.need_show_status)
		slot0.icon_state:loadTexture(PathTool.getResFrame("login2", "login2_100" .. slot2), LOADTEXT_TYPE_PLIST)
		slot0.txt_cur_server:setString(slot1.srv_name or "")
	end

	slot0.btn_enter:setTouchEnabled(true)

	if needMourning() then
		setChildUnEnabled(true, slot0.stateIcon)
	end
end
