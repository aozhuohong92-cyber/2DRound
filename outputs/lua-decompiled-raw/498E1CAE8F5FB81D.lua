LoginPlatForm = LoginPlatForm or BaseClass()

function LoginPlatForm.getInstance(slot0)
	if LoginPlatForm.instance == nil then
		LoginPlatForm.instance = LoginPlatForm.New()
	end

	return LoginPlatForm.instance
end

function LoginPlatForm.__init(slot0)
	if LoginPlatForm.instance ~= nil then
		error("[LoginPlatForm] accempt to create a singleton twice!")

		return
	end

	slot0.info = {}
end

function LoginPlatForm.isLogin(slot0)
	return slot0.is_logined
end

function LoginPlatForm.getInfo(slot0)
	return slot0.info
end

function LoginPlatForm.getUId(slot0)
	if not slot0.is_logined then
		return ""
	end

	ACCOUNT_PRE = ACCOUNT_PRE or ""

	return ACCOUNT_PRE .. slot0.info.openid
end

function LoginPlatForm.getTimestamp(slot0)
	if not slot0.is_logined then
		return "" .. os.time()
	end

	return string.format("%s", slot0.info.timestamp or 0)
end

function LoginPlatForm.getToken(slot0)
	return slot0.info.token or ""
end

function LoginPlatForm.setToken(slot0, slot1)
	slot0.info.token = slot1
end

function LoginPlatForm.getChannel(slot0)
	if FINAL_CHANNEL then
		return FINAL_CHANNEL
	end

	CHANNEL_PRE = CHANNEL_PRE or ""

	if slot0.info.channelId ~= nil and slot0.info.channelId ~= "" then
		return CHANNEL_PRE .. slot0.info.channelId
	end

	if (device.getChannel and device.getChannel() or device.callFunc("channel")) == "" or slot1 == nil then
		slot1 = CHANNEL_NAME
	end

	return CHANNEL_PRE .. (slot1 or PLATFORM_NAME)
end

function LoginPlatForm.getSign(slot0)
	return slot0.info.sign or ""
end

function LoginPlatForm.loginCallback(slot0)
	if ({
		isTourist = false,
		usrName = string.format("%s", slot0:getUId()),
		password = "12345678"
	}).usrName == LoginController:getInstance():getModel():getLoginData().usrName and slot3.usrName ~= "" and slot3.account_name ~= nil and slot3.account_name ~= "" then
		print("当前用户ID:" .. slot3.usrName .. "已经在线上")

		return
	else
		LoginController:getInstance():getModel():getLoginData().rid = 0
		LoginController:getInstance():getModel():getLoginData().srv_id = ""
	end

	if webFunc_LoginCallback then
		webFunc_LoginCallback()
	end

	if IS_WIN_PLATFORM == true then
		LoginController:getInstance():getModel():setCurSrv(slot0.info)
		LoginController:getInstance():requestLoginGame(slot0.info.openid, slot0.info.ip, slot0.info.port, true, true)
	else
		LoginController:getInstance():loginPlatformRequest(slot3)
	end
end

function LoginPlatForm.login(slot0)
	if slot0.is_logined then
		slot0:loginCallback()
	else
		print("sdasssadadada")
		sdkOnLogin()
	end
end

function LoginPlatForm.onLoginInfo(slot0, slot1, slot2)
	LoginController:getInstance():showVersionLabel()

	slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13 = unpack(Split(slot1, "#"))

	if slot2 then
		if slot3 ~= slot0.info.openid then
			slot0:onLogout()
		end

		return
	end

	slot0.info = {
		openid = slot3,
		username = slot4,
		token = slot5,
		channelId = slot6,
		timestamp = slot7,
		rid = slot8,
		srv_id = slot9,
		ip = slot10,
		port = slot11,
		host = slot12,
		srv_name = slot13
	}
	slot0.is_logined = true
	_no_need_restar = nil

	slot0:loginCallback()
end

function LoginPlatForm.onLogout(slot0, slot1)
	print("logout", slot1)

	slot0.is_logined = false
	slot0.info = {}

	if RoleController:getInstance():getRoleVo() then
		sdkSubmitUserData(5)
	end

	if restart then
		restart()
	end
end

function LoginPlatForm.onSdkInitFail(slot0)
	ViewManager:getInstance():getMainScene():stopAllActions()
	ViewManager:getInstance():getMainScene():runAction(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
		uv0:login()
	end)))
end
