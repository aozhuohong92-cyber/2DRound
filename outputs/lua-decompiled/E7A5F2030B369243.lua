LoginController = LoginController or BaseClass(BaseController)
LoginController.type = {
	create_role = 4,
	server_list = 3,
	enter_game = 2,
	user_input = 1
}

function LoginController.config(slot0)
	slot0.model = LoginModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.token = ""
	slot0.is_ready_enter = false
	slot0.connect_key = ""
end

function LoginController.getModel(slot0)
	return slot0.model
end

function LoginController.registerEvents(slot0)
	if slot0.close_usr_panel == nil then
		slot0.close_usr_panel = slot0.dispather:Bind(LoginEvent.CLOSE_CHANGE_PANEL, function ()
			uv0:openView(LoginController.type.enter_game)
		end)
	end

	if slot0.request_defualt_server_success == nil then
		slot0.request_defualt_server_success = slot0.dispather:Bind(LoginEvent.DEFAULE_SERVER_SUCCESS, function (slot0)
			if not uv0.is_re_connect then
				uv0:openView(LoginController.type.enter_game)
			end

			if FINAL_SERVERS == nil then
				uv0.model:checkReloadServerData()
			end
		end)
	end

	if slot0.first_load_finish == nil then
		slot0.first_load_finish = slot0.dispather:Bind(SceneEvent.FIRST_TIME_LOAD_FINISH, function ()
			uv0.is_ready_enter = true

			uv0:closeView()
		end)
	end

	if slot0.connet_success_event == nil then
		slot0.connet_success_event = slot0.dispather:Bind(EventId.CONNECTED, function ()
			GlobalTimeTicket:getInstance():remove("LOGIN_REQUEST_tiket")

			uv0.ts = LoginPlatForm:getInstance():getTimestamp()

			uv0:maketoken(uv0.ts)
		end)
	end

	if slot0.disconnect_event == nil then
		slot0.disconnect_event = slot0.dispather:Bind(EventId.DISCONNECT, function ()
			function slot0()
				if GameNet:getInstance():IsServerConnect() then
					return
				end

				uv0.is_re_connect = true

				GameNet:getInstance():Connect(3000, 1)
			end

			if not GameNet:getInstance():IsServerConnect() and not _is_game_restart then
				if uv0.is_re_connect == true then
					if not GameNet:getInstance():isServerDisconnet() then
						uv0:openReconnect(true)
						delayOnce(function ()
							if GameNet:getInstance():IsServerConnect() then
								return
							end

							if GameNet:getInstance():tryNum() < 10 then
								uv0()
							else
								uv1:openReconnect(false)
								GlobalTimeTicket:getInstance():remove("LOGIN_REQUEST_tiket")
								CommonAlert.show(TI18N("您的网络不稳定，是否重新连接游戏？"), TI18N("重新连接"), sdkOnSwitchAccount, nil, nil, nil, nil, {
									view_tag = ViewMgrTag.RECONNECT_TAG
								})
							end
						end, 1)
					end
				else
					uv0:openReconnect(true)
					ViewManager:getInstance():getMainScene():stopAllActions()
					ViewManager:getInstance():getMainScene():runAction(cc.Sequence:create(cc.DelayTime:create(RECONNEST_INTERVAL or 5), cc.CallFunc:create(function ()
						if not GameNet:getInstance():IsServerConnect() and not GameNet:getInstance():isServerDisconnet() then
							uv0()
						end
					end)))
				end
			end

			_is_game_restart = false
		end)
	end
end

function LoginController.registerProtocals(slot0)
	slot0:RegisterProtocal(1164, "on1110Rolelist")
	slot0:RegisterProtocal(10191, "on10101Create")
	slot0:RegisterProtocal(10192, "on10102Login")
	slot0:RegisterProtocal(10193, "on10103ReLogin")
	slot0:RegisterProtocal(10310, "on10310Offline")
	slot0:RegisterProtocal(10996, "onVersionStateList")
end

function LoginController.openView(slot0, slot1)
	if IS_TEST_APK == true then
		if slot1 == LoginController.type.enter_game then
			slot0:testForRquestEnterGame()
		elseif slot1 == LoginController.type.user_input then
			slot0:testForRegistAccount()
		end
	elseif slot0.loginView == nil then
		slot0.loginView = LoginWindow.New()

		slot0.loginView:open(slot1)
	elseif not tolua.isnull(slot0.loginView.root_wnd) then
		slot0.loginView:showPanel(slot1)
	end
end

function LoginController.showVersionLabel(slot0)
	if slot0.loginView then
		slot0.loginView:showVersionLabel()
	end
end

function LoginController.DeleteMe(slot0)
	if slot0.close_usr_panel then
		slot0.dispather:UnBind(slot0.close_usr_panel)

		slot0.close_usr_panel = nil
	end

	if slot0.request_defualt_server_success then
		slot0.dispather:UnBind(slot0.request_defualt_server_success)

		slot0.request_defualt_server_success = nil
	end

	if slot0.first_load_finish then
		slot0.dispather:UnBind(slot0.first_load_finish)

		slot0.first_load_finish = nil
	end

	if slot0.connet_success_event then
		slot0.dispather:UnBind(slot0.connet_success_event)

		slot0.connet_success_event = nil
	end

	if slot0.disconnect_event then
		slot0.dispather:UnBind(slot0.disconnect_event)

		slot0.disconnect_event = nil
	end

	slot0:deleteLoginView()

	if slot0.model then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end

function LoginController.loginPlatformRequest(slot0, slot1)
	if slot1.usrName ~= slot0.model:getLoginData().usrName then
		SysEnv:getInstance():set(SysEnv.keys.usrName, slot1.usrName, true)
		SysEnv:getInstance():set(SysEnv.keys.password, slot1.password, true)
	end

	if log_reg_account then
		log_reg_account(slot1.usrName)
	end

	slot0.model:getLoginData().usrName = slot1.usrName
	slot0.model:getLoginData().password = slot1.password

	if IS_TEST_SERVER then
		slot2 = slot0.model:getLoginData().usrNameList

		keydelete("usr", slot1.usrName, slot2)

		if #slot2 > 10 then
			table.remove(slot2, #slot2)
		end

		table.insert(slot2, 1, {
			usr = slot1.usrName
		})
		SysEnv:getInstance():set(SysEnv.keys.usrNameList, slot2, true)
	end

	slot0:loginNewUserRequest(slot1)
end

function LoginController.loginNewUserRequest(slot0, slot1)
	slot0:loginPlatformResult({
		code = 1,
		accName = slot1.usrName,
		platform = PLATFORM_NAME,
		msg = ""
	})
end

function LoginController.loginPlatformResult(slot0, slot1)
	if slot1.code == 1 then
		slot0.model:cacheNearLoginData(slot1.accName)

		if FINAL_SERVERS ~= nil then
			slot0.model:analysisDefualServerListForVerifyios(FINAL_SERVERS, slot1.accName, slot1.platform)
		else
			slot0.model:requestDefaultServerList(slot1.accName, slot1.platform)
		end
	else
		message(TI18N("登陆平台网关失败"))
	end
end

function LoginController.requestLoginGame(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0.is_ready_enter == true then
		return
	end

	slot0.enter_game_status = slot4
	slot0.no_role_auto_enter = slot5

	if getNorKey(slot1, slot2, slot3 or 8800) == slot0.connect_key then
		if GameNet:getInstance():IsServerConnect() or GameNet:getInstance():IsConnecting() == true then
			return
		end
	else
		slot0.connect_key = slot6

		GameNet:getInstance():DisconnectByClient(false)
	end

	slot0:requestConnect(slot2, slot3 or 8800, slot1)
	GlobalTimeTicket:getInstance():remove("LOGIN_REQUEST_tiket")
	GlobalTimeTicket:getInstance():add(function ()
		if GameNet:getInstance():IsServerConnect() then
			GlobalTimeTicket:getInstance():remove("LOGIN_REQUEST_tiket")
		end
	end, 3, 0, "LOGIN_REQUEST_tiket")
end

function LoginController.requestConnect(slot0, slot1, slot2, slot3)
	if slot1 == nil or slot1 == "" then
		return
	end

	if string.find(slot1, ":") ~= nil then
		slot2 = string.sub(slot1, string.find(slot1, ":") + 1)
		slot1 = string.sub(slot1, 1, string.find(slot1, ":") - 1)
	end

	slot0.is_re_connect = false
	slot0.account = slot3
	slot0.ts = ""

	if not GameNet:getInstance():IsServerConnect() then
		GameNet:getInstance():SetServerInfo(slot1, slot2)
		GameNet:getInstance():Connect(3000, 3)
	elseif slot0.model:getLoginInfo() then
		slot0:on1110Rolelist(slot0.model:getLoginInfo())
	end
end

function LoginController.on1110Rolelist(slot0, slot1)
	GlobalTimeTicket:getInstance():remove("LOGIN_REQUEST_tiket")
	slot0.model:setGatewayCallState(0)
	message(slot1.msg)

	if slot1.code == 2 then
		GameNet:getInstance():DisconnectByClient(true)
	elseif slot1.code == 3 then
		-- Nothing
	elseif slot1.code == 4 then
		GameNet:getInstance():DisconnectByClient(true)
		NoticeController:getInstance():openNoticeView()
	end

	if slot1.code ~= TRUE then
		return
	end

	if RoleController:getInstance():getRoleVo() then
		slot0:request10103ReLogin(slot2.rid, slot2.srv_id)
	else
		slot0.model:setLoginInfo(slot1)
		slot0:handleLoginInfo()
	end
end

function LoginController.handleLoginInfo(slot0)
	if not slot0.is_re_connect then
		slot0.model:cacheNearLoginData(slot0.account)
		slot0.dispather:Fire(LoginEvent.SERVER_ROLELIST_CHANGE)
	end

	if slot0.model:getLoginInfo() == nil then
		return
	end

	if (slot1.roles == nil or next(slot2) == nil) and slot0.no_role_auto_enter == true then
		slot0.no_role_auto_enter = false
	elseif slot0.is_re_connect then
		if RoleController:getInstance():getRoleVo() then
			slot0:request10103ReLogin(slot3.rid, slot3.srv_id)
		else
			slot0:openView(LoginController.type.server_list)
		end
	elseif slot0.enter_game_status == true then
		slot0.enter_game_status = false

		if slot0.model:getLoginData() and slot3.usrName ~= "" and slot3.srv_id ~= "" and slot3.rid ~= 0 then
			slot0:request10102Login(slot3.rid, slot3.srv_id)
		elseif slot2[1] then
			slot0:request10102Login(slot4.rid, slot4.srv_id)
		end
	end
end

function LoginController.request1110Role(slot0)
	if GameNet:getInstance():IsServerConnect() then
		slot2 = {}
		slot3 = slot0.model:getLoginData().srv_id or ""
		slot4 = device.getDeviceName()
		slot5 = slot0.ts
		slot7 = LoginPlatForm:getInstance():getSign()
		slot8 = LoginPlatForm:getInstance():getChannel()
		slot9 = device.getuiId()
		slot10 = getIdFa()
		slot11 = slot0.model.php_ip or ""

		if ICEBIRD_ACCESSTOKEN and ICEBIRD_SY_SIGN then
			slot6 = ICEBIRD_ACCESSTOKEN or LoginPlatForm:getInstance():getToken()
			slot7 = ICEBIRD_SY_SIGN
		end

		slot13 = "false"

		if device.callFunc("inEmulator") ~= "" and string.sub(slot12, 1, 1) == "1" then
			slot13 = "true"
		end

		log_select_server(slot1.usrName)

		slot2.args = {
			{
				key = "account",
				val = slot0.account
			},
			{
				key = "timestamp",
				val = slot5
			},
			{
				key = "enter_srv_id",
				val = slot3
			},
			{
				key = "platform",
				val = PLATFORM_NAME
			},
			{
				key = "device_id",
				val = slot4
			},
			{
				key = "device_type",
				val = log_get_device_type and log_get_device_type() or ""
			},
			{
				key = "gettui_cid",
				val = slot9
			},
			{
				key = "idfa",
				val = slot10
			},
			{
				key = "token",
				val = slot6
			},
			{
				key = "channel",
				val = slot8
			},
			{
				key = "sign",
				val = slot7
			},
			{
				key = "ip",
				val = slot11
			},
			{
				key = "logsign",
				val = cc.CCGameLib:getInstance():logsign(table.concat({
					slot0.account,
					slot4,
					slot10,
					slot8,
					slot9,
					slot13,
					slot11
				}, ""))
			},
			{
				key = "os_ver",
				val = callFunc("system_version")
			},
			{
				key = "carrier_name",
				val = callFunc("carrier_name")
			},
			{
				key = "net_type",
				val = device.isWifiState() and "wifi" or "数据"
			},
			{
				key = "os",
				val = device.platform
			},
			{
				key = "emulator",
				val = slot13
			},
			{
				key = "app_name",
				val = callFunc("app_name")
			},
			{
				key = "package_name",
				val = callFunc("package_name")
			},
			{
				key = "package_version",
				val = callFunc("package_version")
			},
			{
				key = "now_ver",
				val = string.format("v%s", now_ver())
			},
			{
				val = "v200401",
				key = "srv_lock_ver"
			},
			{
				key = "accflag",
				val = slot0.model.new_account_flag == 0 and "0" or "1"
			},
			{
				key = "icebird_resp",
				val = ICEBIRD_RESP or ""
			},
			{
				key = "icebird_body",
				val = ICEBIRD_BODY or ""
			}
		}

		print("======token" .. slot6)

		slot15 = slot0:SendProtocal(1164, slot2)

		GlobalTimeTicket:getInstance():remove("LOGIN_REQUEST_tiket")
		slot0.model:setGatewayCallState(0)
	end
end

function LoginController.maketoken(slot0, slot1)
	slot3 = cc.XMLHttpRequest:new()
	slot3.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING

	slot3:open("POST", string.format("http://211.154.26.201:81/index.php/userlogin/yxmmdasba?username=%s&timestamp=%s", slot0.account, slot1))
	slot3:registerScriptHandler(function ()
		if uv0.readyState == 4 and uv0.status >= 200 and uv0.status < 207 then
			slot1 = loadstring("return " .. uv0.response)
			slot2 = jsonObjret or {}

			print(slot2.msg)
			LoginPlatForm:getInstance():setToken(slot2.msg)
			uv1:request1110Role()
		end
	end)
	slot3:send()
end

function LoginController.request10101Create(slot0, slot1, slot2, slot3, slot4)
	if slot0.is_ready_enter == true then
		return
	end

	;(function ()
		uv3:SendProtocal(10191, {
			sex = uv0 or 0,
			name = uv1 or "",
			career = uv2 or 0,
			playform = LoginPlatForm:getInstance():getChannel()
		})
	end)()
end

function LoginController.on10101Create(slot0, slot1)
	if slot1.code == TRUE then
		slot2 = slot0.model:getLoginData()

		if NEED_CHECK_CLOSE and GameNet:getInstance():getTime() - slot2.open_time < 0 then
			slot0.model:showSrvOpen(slot2)

			return
		end

		sdkSubmitUserData(2, slot1)
		slot0:request10102Login(slot1.rid, slot1.srv_id)
	else
		message(slot1.msg)
	end
end

function LoginController.request10102Login(slot0, slot1, slot2)
	if slot0.is_ready_enter == true then
		return
	end

	log_create_role(slot0.model:getLoginData().usrName)

	if NEED_CHECK_CLOSE and GameNet:getInstance():getTime() - slot3.open_time < 0 then
		slot0.model:showSrvOpen(slot3)

		return
	end

	slot0.tmp_rid = slot1
	slot0.tmp_srv_id = slot2

	slot0:SendProtocal(10192, {
		rid = slot1,
		srv_id = slot2
	})
end

function LoginController.on10102Login(slot0, slot1)
	GameNet:getInstance():setTime(slot1.timestamp)

	if slot1.code == TRUE then
		slot0.model:cacheNearLoginData(slot0.account, slot0.tmp_rid, slot0.tmp_srv_id)
		slot0.model:setWorldLev(slot1.world_lev or 0)
		RoleController:getInstance():getModel():setWorldLev(slot1.world_lev or 0)
		slot0:SendProtocal(10300, {})

		if not slot0.is_re_connect then
			slot0.dispather:Fire(LoginEvent.LOGIN_SUCCESS)
		end
	elseif slot1.code == 2 then
		CommonAlert.show(slot1.msg, TI18N("确定"), sdkOnSwitchAccount, nil, nil, nil, nil, {
			view_tag = ViewMgrTag.RECONNECT_TAG
		})
	else
		CommonAlert.show(slot1.msg, TI18N("确定"), function ()
			uv0:openView(LoginController.type.enter_game)
		end, nil, nil, nil, nil, {
			view_tag = ViewMgrTag.RECONNECT_TAG
		})
	end
end

function LoginController.request10103ReLogin(slot0, slot1, slot2)
	slot0:SendProtocal(10193, {
		rid = slot1,
		srv_id = slot2
	})
end

function LoginController.on10103ReLogin(slot0, slot1)
	GameNet:getInstance():setTime(slot1.timestamp)
	RoleController:getInstance():setReconnect(true)
	slot0:on10102Login(slot1)
end

function LoginController.on10310Offline(slot0, slot1)
	GameNet:getInstance():DisconnectByClient(true)

	if IS_WIN_PLATFORM == true then
		CommonAlert.show(string.format(TI18N("你断线了，原因是：%s"), slot1.msg), TI18N("确定"), function ()
			sdkCallFunc("requestQRCode")
		end, nil, nil, nil, nil, {
			view_tag = ViewMgrTag.RECONNECT_TAG
		})
	else
		CommonAlert.show(string.format(TI18N("你断线了，原因是：%s"), slot1.msg), TI18N("确定"), sdkOnSwitchAccount, nil, nil, nil, nil, {
			view_tag = ViewMgrTag.RECONNECT_TAG
		})
	end
end

function LoginController.getIsReconnect(slot0)
	return slot0.is_re_connect
end

function LoginController.setReconnect(slot0, slot1)
	slot0.is_re_connect = slot1
end

function LoginController.openReconnect(slot0, slot1)
	if slot1 == true then
		if GameNet:getInstance():isClientDisconnet() == true then
			return
		end

		if slot0.loginView and not tolua.isnull(slot0.loginView.root_wnd) then
			return
		end

		if slot0.reconnect == nil then
			slot0.reconnect = ReconnectView.new()
		end

		if not slot0.reconnect:isOpen() then
			slot0.reconnect:open()
		end
	elseif slot0.reconnect ~= nil then
		slot0.reconnect:close()

		slot0.reconnect = nil
	end

	if BattleController:getInstance():isInFight() then
		GlobalEvent:getInstance():Fire(BattleEvent.DISCONNECTVIEW, slot1)
	end
end

function LoginController.createFillView(slot0)
	if slot0.fill_view then
		return
	end

	slot0.fill_view = FillView.new()

	slot0.fill_view:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)
	ViewManager:getInstance():getLayerByTag(ViewMgrTag.LOADING_TAG):addChild(slot0.fill_view, 10)
end

function LoginController.openDownLoadView(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.downloadView and not tolua.isnull(slot0.downloadView) then
			return
		end

		if slot0.downloadView == nil then
			slot0.downloadView = DownLoadView.new()
		end

		if not slot0.downloadView:isOpen() then
			slot0.downloadView:open(slot2)
		end
	elseif slot0.downloadView ~= nil then
		slot0.downloadView:close()

		slot0.downloadView = nil
	end
end

function LoginController.openUserProtoPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.user_proto_panel == nil then
			slot0.user_proto_panel = UserProtoPanel.New()
		end

		if not slot0.user_proto_panel:isOpen() then
			slot0.user_proto_panel:open(slot2)
		end
	elseif slot0.user_proto_panel ~= nil then
		slot0.user_proto_panel:close()

		slot0.user_proto_panel = nil
	end
end

function LoginController.getReconnectView(slot0)
	return slot0.reconnect
end

function LoginController.closeView(slot0)
	if slot0.loginView then
		slot0.loginView:close()

		slot0.loginView = nil
	end

	GlobalTimeTicket:getInstance():remove("LOGIN_REQUEST_tiket")
	slot0.model:setGatewayCallState(0)

	slot0.is_ready_enter = false
end

function LoginController.deleteLoginView(slot0)
	if slot0.loginView then
		slot0.loginView:close()

		slot0.loginView = nil
	end
end

function LoginController.onVersionStateList(slot0, slot1)
	function slot3()
		sdkOnSwitchAccount()
	end

	function slot4()
		sdkOnExit()
	end

	if #(slot1.cli_ver_list or {}) == 0 then
		check_min_ver(function (slot0, slot1)
			if slot0 == nil or slot1 == nil then
				return
			end

			if slot0 < slot1 then
				CommonAlert.show(TI18N("检测到当前游戏不是最新版本，需要重启游戏以更新至最新版本，是否立即更新？"), TI18N("确定"), uv0, TI18N("取消"), uv1, nil, nil, {
					view_tag = ViewMgrTag.RECONNECT_TAG
				})
			end
		end)
	else
		for slot9, slot10 in pairs(slot2) do
			if slot10.cdn_patch == PLATFORM_NAME then
				slot0:onVersionState({
					cli_ver = slot10.cli_ver,
					flag = TRUE
				})

				break
			end
		end
	end
end

function LoginController.onVersionState(slot0, slot1)
	if now_ver() == nil then
		return
	end

	if slot2 < slot1.cli_ver then
		CommonAlert.show(TI18N("检测到当前游戏不是最新版本，需要重启游戏以更新至最新版本，是否立即更新？"), TI18N("确定"), function ()
			sdkOnSwitchAccount()
		end, TI18N("取消"), function ()
			sdkOnExit()
		end, nil, nil, {
			view_tag = ViewMgrTag.RECONNECT_TAG
		})
	end
end

function LoginController.requestSetName(slot0, slot1)
	slot0:SendProtocal(10342, {
		name = slot1 or ""
	})
end

function LoginController.testForRquestEnterGame(slot0)
	function slot1()
		if uv0.model:getLoginData().srv_id == nil or slot0.srv_id == "" or slot0.usrName == "" then
			uv0:openView(LoginController.type.user_input)

			return
		end

		if slot0.ip == nil or #slot0.ip == 0 then
			message(TI18N("当前服务器不可用"))
			uv0:openView(LoginController.type.server_list)

			return
		end

		if uv0.last_login == nil then
			uv0.last_login = 0
		end

		if GameNet:getInstance():getTime() - uv0.last_login > 1 then
			if GameNet:getInstance():IsServerConnect() or GameNet:getInstance():IsConnecting() then
				return
			end

			uv0.last_login = GameNet:getInstance():getTime()

			uv0:requestLoginGame(slot0.usrName, slot0.ip, slot0.port, true)
		end
	end

	slot2 = slot0.model:getLoginData()

	if NEED_CHECK_CLOSE and (slot2.isClose or GameNet:getInstance():getTime() - slot2.open_time < 0) then
		slot0.model:checkReloadServerData(slot2)

		return
	end

	if not slot0.model:isNeedReload(TI18N("优先体验服变换，需要重新加载资源才能进入游戏"), slot2, sdkOnSwitchAccount) then
		slot0.model:saveCurSrv()
		slot1()
	end
end

function LoginController.testForRegistAccount(slot0)
	slot0:loginPlatformRequest({
		usrName = (function (slot0)
			slot1 = slot0

			if StringUtil.getStrLen(math.random(3) % 3 == 0 and slot1 .. string.char(math.random(65, 90)) or math.random(3) % 2 == 0 and slot1 .. string.char(math.random(97, 122)) or slot1 .. string.char(math.random(48, 57))) < 12 then
				slot1 = uv0(slot1)
			end

			return slot1
		end)(""),
		password = tostring(math.random(100000000000.0, 900000000000.0))
	})
end

function LoginController.isReadyEnterGame(slot0)
	return slot0.is_ready_enter
end
