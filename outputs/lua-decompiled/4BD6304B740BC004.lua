function sdkCallFunc(slot0, slot1, slot2, slot3, slot4)
	print(LOG_TAG, "sdkCallFunc", slot0, slot1, slot2, slot3, slot4)

	if slot0 == nil or slot0 == "" then
		return ""
	end

	return device.sdkCallFunc(slot0, slot1 or "", slot2 or 0, slot3 or 0, slot4 or "")
end

function sdkOnLogin()
	if DIRECTTOONLOGIN == true then
		if sdkOnLoginBackInfo == nil then
			sdkOnLoginFlag = true

			sdkCallFunc("login")
		else
			delayOnce(function ()
				LoginPlatForm:getInstance():onLoginInfo(sdkOnLoginBackInfo)
			end, 0.3)
		end
	else
		if sdkOnLoginBackInfo then
			LoginPlatForm:getInstance():onLoginInfo(sdkOnLoginBackInfo)

			return
		end

		if IS_APPLE_RMUI then
			sdkCallFunc("setTempPixelVariable", "", KTempPixelVariable)
		end

		sdkOnLoginFlag = true

		if USE_ThirdSDK then
			sdkCallFunc("thirdlogin")
		else
			sdkCallFunc("login")
		end
	end
end

function sdkBackLogin(slot0, slot1)
	if DIRECTTOONLOGIN == true then
		if slot0 == 1 then
			sdkOnLoginBackInfo = slot1

			if FileUpdate_Instance then
				FileUpdate_Instance:realDownLoadFinishFunc()
			end
		else
			sdkOnLogin()
		end
	elseif slot0 == 0 then
		LoginPlatForm:getInstance():onLoginInfo(slot1)
	else
		sdkOnLogin()
	end
end

function sdkCanSwitchAccount()
	if PLATFORM == cc.PLATFORM_OS_IPHONE or PLATFORM == cc.PLATFORM_OS_MAC then
		return true
	elseif IS_PLATFORM_LOGIN and CALL_SDK_SWITCH_ACCOUNT ~= false then
		return sdkCallFunc("isSwitchAccount") == 1
	else
		return true
	end
end

function sdkOnSwitchAccount()
	if GAME_INITED == nil then
		return
	end

	GAME_INITED = nil

	if CALL_SDK_SWITCH_ACCOUNT == 1 then
		sdkCallFunc("switchAccount")

		if not LoginPlatForm then
			return
		end

		LoginPlatForm:getInstance():onLogout()
	elseif CALL_SDK_SWITCH_ACCOUNT ~= false and sdkCallFunc("isSwitchAccount") == 1 then
		sdkCallFunc("switchAccount")
	else
		LoginPlatForm:getInstance():onLogout()
	end
end

function sdkBackSwitch(slot0, slot1)
	if slot0 == 0 then
		if not LoginPlatForm then
			return
		end

		report_sign_off()

		if IS_IOS_PLATFORM then
			nativeSdkSwitchGame()
		end

		LoginPlatForm:getInstance():onLogout()

		sdkOnLoginBackInfo = slot1
	end
end

function sdkBackExit(slot0, slot1)
	if slot0 == 0 then
		report_sign_off()

		if IS_IOS_PLATFORM then
			nativeSdkExitGame()
		end

		cc.Director:getInstance():endToLua()
	end
end

function sdkBackRealName(slot0, slot1)
	if slot0 == 0 then
		if not LoginPlatForm then
			return
		end

		LoginPlatForm:getInstance():onRealName(slot1)
	end
end

function sdkBackLogout(slot0, slot1)
	if not LoginPlatForm then
		return
	end

	report_sign_off()

	if IS_IOS_PLATFORM then
		nativeSdkExitGame()
	end

	LoginPlatForm:getInstance():onLogout()
end

function sdkBackPay(slot0, slot1)
	if slot0 == 0 then
		-- Nothing
	end
end

function sdkCanShowAccountCenter()
	return sdkCallFunc("isShowAccountCenter") == 1
end

function sdkShowAccountCenter()
	sdkCallFunc("showAccountCenter")
end

function sdkOnExit()
	if NEED_CALL_CLOSE_APP == true then
		callFunc("callBackCloseApp")
	else
		cc.Director:getInstance():endToLua()
	end

	if IS_IOS_PLATFORM == true then
		os.exit()
	end
end

function sdkKeyBackPress()
	callFunc("onKeyBackPressed")
end

function sdkSubmitUserData(slot0, slot1)
	if LoginController:getInstance():getModel():getLoginData().srv_id == "" then
		return
	end

	if slot0 == 1 then
		if log_select_flag then
			return
		end

		log_select_flag = true
	elseif slot0 == 2 then
		-- Nothing
	end

	slot3 = LoginPlatForm:getInstance():getInfo().openid
	slot4 = RoleController:getInstance():getRoleVo() or slot1
	slot14 = device.getChannel()

	sdkCallFunc("submitExtraData", json.encode({
		partyId = "",
		partyName = "",
		partyMasterId = "",
		partyMasterName = "",
		dataType = slot0,
		serverId = serverId(slot4 and slot4.srv_id or slot2.srv_id),
		serverName = slot2.srv_name,
		createTime = slot4 and slot4.reg_time or 0,
		roleId = slot4 and slot4.rid or 0,
		roleName = slot4 and slot4.name or "",
		level = slot4 and slot4.lev or 1,
		vip = slot4 and slot4.vip_lev or 0,
		balance = slot4 and slot4.gold or 0,
		power = slot4 and slot4.power or 0,
		sex = slot4 and slot4.sex or 0
	}))
end

function sdkOnPay(slot0, slot1, slot2, slot3, slot4)
	if NEED_CHECK_VISITIOR_STATUS and DO_NOT_REALNAME_STATUS and not ALLOW_SKIP_RECHARGE then
		OPEN_SDK_VISITIOR_WINDOW = true

		callFunc("touristMode", "10")
	else
		if slot0 == 0 then
			VipController:getInstance():sender21035(slot2)

			return
		end

		slot5 = LoginController:getInstance():getModel():getLoginData()

		if not RoleController:getInstance():getRoleVo() then
			return
		end

		slot7 = string.format("%s.%s", callFunc("package_name"), slot2)

		if PAY_ID_FUNC then
			slot7 = PAY_ID_FUNC(slot2, slot0)
		elseif PAY_ID_NORMAL then
			slot7 = slot2
		end

		if Config.ChargeData.data_charge_data[slot2] and slot8.val ~= slot0 then
			return
		end

		slot4 = slot4 or (slot3 or slot0 * 10 .. TI18N("钻石"))
		slot9 = slot0

		if USE_RMB_FEN then
			slot9 = slot0 * 100
		end

		slot1 = slot1 or 1
		slot10 = slot5
		slot13, slot14 = unpack(Split(slot6.srv_id, "_"))
		slot16 = slot6.rid
		slot21 = slot10.host
		slot22 = LoginPlatForm:getInstance():getUId()
		slot23 = {
			count = 1,
			partyName = "",
			partyId = "",
			signType = "MD5",
			notifyUrl = "",
			serverId = slot14,
			serverName = slot10.srv_name,
			roleId = slot16,
			roleName = slot6.name,
			vip = slot6.vip_lev,
			level = slot6.lev,
			balance = slot6.gold,
			orderNo = slot16 .. "#" .. slot2 .. "#" .. os.time(),
			productId = slot2,
			productName = slot3,
			productDesc = slot4,
			price = slot9,
			amount = slot9,
			extra = slot6.rid .. "$$" .. slot13 .. "$$" .. slot14 .. "$$" .. LoginPlatForm:getInstance():getChannel() .. "$$" .. slot2 .. "$$" .. slot3 .. "$$" .. os.time()
		}

		if IS_IOS_PLATFORM == true then
			slot24 = LoginPlatForm:getInstance():getChannel()

			if USE_ThirdSDK then
				if string.find(slot24, "mint") ~= nil then
					slot23 = {
						count = 1,
						partyName = "",
						partyId = "",
						signType = "MD5",
						notifyUrl = "",
						serverId = slot14,
						serverName = slot15,
						roleId = slot16,
						roleName = slot17,
						vip = slot19,
						level = slot18,
						balance = slot12,
						markNo = slot16 .. "#" .. slot2 .. "#" .. os.time(),
						flagId = slot2,
						flagName = slot3,
						flagDesc = slot4,
						flagKey = slot9,
						flagValue = slot9,
						extra = slot20
					}
				end

				if string.find(slot24, "ly") ~= nil then
					slot23 = {
						count = 1,
						partyName = "",
						partyId = "",
						signType = "MD5",
						notifyUrl = "",
						serverId = slot14,
						serverName = slot15,
						roleId = slot16,
						roleName = slot17,
						vip = slot19,
						level = slot18,
						balance = slot12,
						markNo = slot16 .. "#" .. slot2 .. "#" .. os.time(),
						flagId = slot2,
						flagName = slot3,
						flagDesc = slot4,
						flagKey = slot9,
						flagValue = slot9,
						extra = slot20
					}
				end
			elseif string.find(slot24, "ios") ~= nil then
				slot23 = {
					serverId = slot14,
					roleId = slot16,
					markNo = slot16 .. "#" .. slot2 .. "#" .. os.time(),
					flagId = slot2,
					iapId = GAME_CODE .. "_" .. slot0
				}

				print(slot23.productId, json.encode(slot23))
			end

			sdkCallFunc("doMarkFlag", json.encode(slot23))
		else
			sdkCallFunc("pay", json.encode(slot23))
		end
	end
end

function decodeURI(slot0)
	return string.gsub(slot0, "%%(%x%x)", function (slot0)
		return string.char(tonumber(slot0, 16))
	end)
end

function encodeURI(slot0)
	return string.gsub(string.gsub(slot0, "([^%w%.%- ])", function (slot0)
		return string.format("%%%02X", string.byte(slot0))
	end), " ", "+")
end

function appleIAPOnPay(slot0, slot1)
	slot2 = get_ios_receipt_url()

	if not RoleController:getInstance():getRoleVo() then
		return
	end

	slot7, slot8 = unpack(Split(slot3.srv_id, "_"))
	slot9 = json.decode(slot1)
	slot11 = cc.XMLHttpRequest:new()
	slot11.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON

	slot11:open("POST", slot2)
	slot11:registerScriptHandler(function ()
		game_print("===log_result==>", uv0.readyState, uv0.response)

		if uv0.readyState == 4 and uv0.status >= 200 and uv0.status < 207 then
			slot0 = string.gsub(uv0.response, "\\", "")

			game_print("===log_result==>", uv0.readyState, slot0)

			ICEBIRD_RESP = slot0
			slot0 = unicode2utf8(slot0)

			print(slot0)

			if json.decode(slot0, 1).code == 200 then
				-- Nothing
			end
		else
			print("response-----------fail")
		end
	end)
	slot11:send(string.format("rid=%s&platform=%s&zoneId=%s&channel=%s&packageId=%s&account=%s&receipt=%s", slot3.rid, slot7, tonumber(slot8), LoginPlatForm:getInstance():getChannel(), slot9.productId, LoginPlatForm:getInstance():getUId(), encodeURI(slot9.receipt)))
end

function iceBirdOnPay(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13)
end

function evaluation()
	sdkCallFunc("other_info", "evaluation")
end

function facebookAct()
	if not RoleController:getInstance():getRoleVo() then
		return
	end

	slot2, slot3 = unpack(Split(slot0.srv_id, "_"))

	sdkCallFunc("other_info", "facebookAct", 0, 0, table.concat({
		slot3,
		slot0.rid,
		""
	}, "#"))
end

function morePay()
	if not RoleController:getInstance():getRoleVo() then
		return
	end

	slot2, slot3 = unpack(Split(slot0.srv_id, "_"))

	sdkCallFunc("other_info", "morePay", 0, 0, table.concat({
		slot3,
		slot0.rid,
		""
	}, "#"))
end

is_manling_platform = PLATFORM_NAME == "manling" or PLATFORM_NAME == "mltest"

function sdkBackInit(slot0, slot1)
	if WAIT_SDK_INIT_SUC then
		if slot0 == 0 and FileUpdate_Instance then
			G_SDK_INIT_SUCCESS = true

			FileUpdate_Instance:initConfig()
		end
	elseif sdkOnLoginFlag then
		if USE_ThirdSDK then
			sdkCallFunc("thirdlogin")
		else
			sdkCallFunc("login")
		end

		sdkOnLoginFlag = nil
	end
end

function sdkBackGamePopExitDialog(slot0, slot1)
	sdkAlert(TI18N("确定现在退出游戏么?"), TI18N("确定"), function ()
		cc.Director:getInstance():endToLua()
	end, TI18N("取消"))
end

function sdkBackSwitchAccount(slot0, slot1)
	if not LoginPlatForm then
		return
	end

	if not restart then
		return
	end

	LoginPlatForm:getInstance():onLogout()
end

function winLoginCallBack(slot0, slot1)
	if slot1 == "" or slot1 == nil then
		cc.Director:getInstance():endToLua()

		return
	end

	if json.decode(slot1, 1).code ~= 0 then
		cc.Director:getInstance():endToLua()

		return
	end

	if string.find(string.gsub(slot2.msg, "\\\"", "\""), "\"") == 1 then
		slot3 = string.sub(slot3, 2)
	end

	if string.find(slot3, "\"") == string.len(slot3) then
		slot3 = string.sub(slot3, 1, string.len(slot3) - 1)
	end

	if json.decode(unicode2utf8(string.gsub(slot3, "\\\\", "\\")), 1) == nil then
		cc.Director:getInstance():endToLua()

		return
	end

	sdkBackLogin(1, string.format("%s#%s#%s#%s#%s#%s#%s#%s#%s#%s#%s", slot4.usrName, slot4.usrName, slot4.zm_tick, "", slot4.zm_ts, slot4.rid, slot4.srv_id, slot4.ip, slot4.port, slot4.host, slot4.srv_name))
end

function winOnPayCallBack(slot0, slot1)
	if slot1 == "" or slot1 == nil then
		cc.Director:getInstance():endToLua()

		return
	end

	slot2 = json.decode(slot1, 1)
end

function sdkBackLogin_bingniao(slot0, slot1)
	slot2, slot3, slot4, slot5, slot6 = unpack(Split(slot1, "#"))
	ICEBIRD_APPID = slot5

	sdkBackLogin_bingniao_req("gameId=" .. slot4 .. "&appId=" .. slot5 .. "&channelId=" .. slot6 .. "&extra=" .. log_url_encode(slot3) .. "&sid=" .. log_url_encode(slot2) .. "&sign=" .. cc.CCGameLib:getInstance():md5str(string.format("appId=%schannelId=%sextra=%sgameId=%ssid=%s%s", slot5, slot6, slot3, slot4, slot2, "5687d666f2eb1c22aac9c5e07cbaf173")), 0)
end

function sdkBackLogin_bingniao_req(slot0, slot1, slot2)
	if slot1 > 2 then
		sdkAlert(TI18N("登录验证失败，需要重新登录"), TI18N("确定"), function ()
			LoginPlatForm:getInstance():onLogout()
		end)

		if slot2 and error_log_report then
			error_log_report(string.format(TI18N("冰鸟二次验证失败,readyState=%s,status=%s,response=%s"), slot2.readyState, slot2.status, slot2.response or "nil"))
		end

		return
	end

	slot3 = URL_BINGNIAO_TOKEN or "https://token.aiyinghun.com/user/token"

	if IS_IOS_PLATFORM == true or not IS_IOS_PLATFORM and BUILD_VERSION > 6 then
		slot3 = URL_BINGNIAO_TOKEN or "http://register.sszg.shiyue0zWHhlnBORyiROK6lvI6VBn6vAbJRQqS.com/index.php/misc/bingniao_token"
	end

	game_print("push_log==>", slot3, slot0)

	slot4 = cc.XMLHttpRequest:new()
	slot4.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING

	slot4:open("POST", slot3)
	slot4:registerScriptHandler(function ()
		game_print("===log_result==>", uv0.readyState, uv0.response)

		if uv0.readyState == 4 and uv0.status >= 200 and uv0.status < 207 then
			xpcall(function ()
				slot0 = string.gsub(uv0.response, "\\", "")

				game_print("===log_result==>", uv0.readyState, slot0)

				ICEBIRD_RESP = slot0

				if json.decode(unicode2utf8(slot0), 1).ret == 0 and slot1.content and slot1.content.data and slot1.content.data.userId then
					ICEBIRD_ACCESSTOKEN = slot1.content.data.accessToken
					ICEBIRD_SY_SIGN = slot1.sy_sign
					ICEBIRD_USERID = slot1.content.data.userId
					ICEBIRD_BODY = uv1

					if slot1.sy_sign and slot1.sy_sign ~= cc.CCGameLib:getInstance():md5str(string.format("__sszg_2019__%s%s", slot2, ICEBIRD_ACCESSTOKEN)) then
						sdkBackLogin_bingniao_req(uv1, uv2 + 1, uv0)

						return
					end

					callFunc("bingxiao_login2", slot0, 1, 1, slot2)
				else
					sdkBackLogin_bingniao_req(uv1, uv2 + 1, uv0)
				end
			end, function ()
				sdkBackLogin_bingniao_req(uv0, uv1 + 1, uv2)
			end)
		else
			sdkBackLogin_bingniao_req(uv1, uv2 + 1, uv0)
		end
	end)
	slot4:send(slot0)
end

function sdkPerfer_prize()
	slot1 = GameNet:getInstance():getTime()
	slot3 = 11
	slot4 = LoginController:getInstance():getModel():getLoginData().usrName

	requestPerferDataList("acc_id=" .. slot4 .. "&project_id=" .. slot3 .. "&sign=" .. cc.CCGameLib:getInstance():md5str(string.format("acc_id=%s&project_id=%s&ts=%s%s", slot4, slot3, slot1, "JZ0PJRVzpUctYExk")) .. "&ts=" .. slot1, 0)
end

function requestPerferDataList(slot0, slot1)
	if slot1 > 2 then
		return
	end

	slot3 = cc.XMLHttpRequest:new()
	slot3.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING

	slot3:open("POST", "https://api-common.com/cms/getAutoCoupon")
	slot3:registerScriptHandler(function ()
		if uv0.readyState == 4 and uv0.status >= 200 and uv0.status < 207 then
			xpcall(function ()
				if json.decode(unicode2utf8(string.gsub(uv0.response, "\\/", "/")), 1).code == 0 and slot1.data and slot1.data.coupons and slot1.data.banner then
					ActionController:getInstance():getModel():setPerferPrizeByJsonObj(slot1)

					return
				else
					requestPerferDataList(uv1, uv2 + 1)
				end
			end, function ()
				requestPerferDataList(uv0, uv1 + 1)
			end)
		else
			requestPerferDataList(uv1, uv2 + 1)
		end
	end)
	slot3:send(slot0)
end

function sdkBackInfo(slot0, slot1)
end

function sdkBackEyouShowBtn(slot0, slot1)
	if slot1 == "isShowFb" then
		EYOU_FB_BTN_STATUS = slot0
	elseif slot1 == "isMorePayShow" then
		EYOU_MORE_PAY_BTN_STATUS = slot0
	elseif slot1 == "isEvalShow" then
		EYOU_EVAL_BTN_STATUS = slot0
	elseif slot1 == "isShowLive" then
		EYOU_LIVE_BTN_STATUS = slot0
	end
end

function OnEnterBackground()
end

function OnEnterForeground()
end

function OnFileDownloadRes(slot0, slot1)
end

function sdkAlert(slot0, slot1, slot2, slot3, slot4)
	if not cc.Director:getInstance():getRunningScene() then
		cc.Director:getInstance():runWithScene(cc.Scene:create())
	end

	require("util.pathtool")
	require("UUn2rw1Xe79sI0UaGlea5iQRvaDeuUng.common_function")
	require("0zWHhlnBORyiROK6lvI6VBn6vAbJRQqS.login.view.sdk_view")
	SdkView:create(slot5):show(slot0, slot1, slot2, slot3, slot4)
end

function test_log(...)
	if _test_log_file == nil then
		_test_log_file = io.open(cc.FileUtils:getInstance():getWritablePath() .. "test_log.txt", "a")
	end

	_test_log_file:write(table.concat({
		"\r\n",
		...
	}, "  "))
end

function get_apk_url(slot0)
	if _down_apk_url_ret then
		slot0(_down_apk_url_ret)
	else
		if DOWN_APK_URL then
			slot2 = os.date("%Y-%m-%d %H:%M:%S")
			slot4 = cc.XMLHttpRequest:new()
			slot4.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING

			slot4:open("POST", DOWN_APK_URL .. "?product_name=" .. GAME_CODE .. "&date_time=" .. log_url_encode(slot2) .. "&sign=" .. cc.CCGameLib:getInstance():logsign(slot2) .. "&channel_name=" .. LoginPlatForm:getInstance():getChannel())
			slot4:registerScriptHandler(function ()
				if uv0.readyState == 4 and uv0.status >= 200 and uv0.status < 207 then
					xpcall(function ()
						if json.decode(unicode2utf8(string.gsub(uv0.response, "\\", "")), 1).success == true then
							_down_apk_url_ret = slot1
						end

						uv1(slot1)
					end, function ()
						uv0({
							success = false,
							message = "parse_json_error"
						})
					end)
				else
					uv1({
						success = false,
						message = "down_load_error"
					})
				end
			end)
			slot4:send()

			return
		end

		slot0({
			success = false,
			message = "not found DOWN_APK_URL"
		})
	end
end

function download_qrcode_png(slot0, slot1)
	if cc.FileUtils:getInstance():isFileExist(cc.FileUtils:getInstance():getWritablePath() .. "assets/src/" .. ("qrcode_" .. string.match(slot0, "[^/]*.png"))) and cc.FileUtils:getInstance():getFileSize(slot3) > 0 then
		slot1(0, slot3)
	else
		function OnFileDownloadResult(slot0, slot1)
			if slot0 == 0 and cc.FileUtils:getInstance():getFileSize(uv0) > 0 then
				uv1(0, uv0)
			else
				cc.FileUtils:getInstance():removeFile(uv0)
				uv1(1, uv0)
			end
		end

		cc.FmodexManager:getInstance():downloadOtherFile(slot0, slot2)
	end
end

function download_perfer_png(slot0, slot1)
	slot3 = ""

	if cc.FileUtils:getInstance():isFileExist(cc.FileUtils:getInstance():getWritablePath() .. "assets/src/" .. (string.match(slot0, ".+%.(%w+)$") == "jpg" and "perfer_" .. string.match(slot0, "[^/]*.jpg") or "perfer_" .. string.match(slot0, "[^/]*.png"))) and cc.FileUtils:getInstance():getFileSize(slot4) > 0 then
		slot1(0, slot4)
	else
		function OnFileDownloadResult(slot0, slot1)
			if slot0 == 0 and cc.FileUtils:getInstance():getFileSize(uv0) > 0 then
				uv1(0, uv0)
			else
				cc.FileUtils:getInstance():removeFile(uv0)
				uv1(1, uv0)
			end
		end

		cc.FmodexManager:getInstance():downloadOtherFile(slot0, slot3)
	end
end

function error_log_report(slot0, slot1)
	if PLATFORM == cc.PLATFORM_OS_WINDOWS or PLATFORM == cc.PLATFORM_OS_MAC then
		return
	end

	if LOG_REPORT == false then
		return
	end

	_log_report_msg_list = _log_report_msg_list or {}

	if _log_report_msg_list[slot0] then
		return
	end

	slot2 = ""

	if slot1 then
		slot2 = string.match(string.sub(readBinaryFile(slot1), 1, 500), "[%s%p%w]*")
	end

	slot4 = os.date("%Y-%m-%d %H:%M:%S")
	slot5 = (LOG_REPORT_URL or "http://log.sszg.com/index.php/misc/log") .. "?product_name=" .. GAME_CODE .. "&date_time=" .. log_url_encode(slot4) .. "&sign=" .. cc.CCGameLib:getInstance():logsign(slot4) .. "&channel_name=" .. get_channel() .. "&package=" .. device.callFunc("package_name") .. "&name=" .. log_url_encode(device.callFunc("app_name")) .. "&idfa=" .. getIdFa()
	slot5 = cc.XMLHttpRequest:new()
	slot5.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING

	slot5:open("POST", slot5 .. "&network=" .. (device.isWifiState() and "wifi" or "data") .. "&msg=" .. log_url_encode(slot0) .. "&filetxt=" .. log_url_encode(slot2))
	slot5:registerScriptHandler(function ()
	end)
	slot5:send()

	_log_report_msg_list[slot0] = 1
end

function getIdFa()
	if cc.UserDefault:getInstance():getStringForKey("init_idfa", "") == nil or slot0 == "" or slot0 == "error" then
		if device.getIdFa() == nil or slot0 == "" or slot0 == "error" then
			slot0 = "sszg" .. os.time() .. randomIdFa("")
		end

		cc.UserDefault:getInstance():setStringForKey("init_idfa", slot0)
		cc.UserDefault:getInstance():flush()
	end

	return slot0
end

function randomIdFa(slot0)
	slot1 = slot0

	if string.len(math.random(3) % 3 == 0 and slot1 .. string.char(math.random(65, 90)) or math.random(3) % 2 == 0 and slot1 .. string.char(math.random(97, 122)) or slot1 .. string.char(math.random(48, 57))) < 12 then
		slot1 = randomIdFa(slot1)
	end

	return slot1
end

function joinQQGroup()
	if not next(QQ_GROUP_LIST) then
		return
	end

	if not QQ_GROUP_LIST[math.random(#QQ_GROUP_LIST)] then
		return
	end

	if IS_IOS_PLATFORM or PLATFORM == cc.PLATFORM_OS_IPHONE then
		sdkCallFunc(OPEN_URL_NAME or "openUrl", slot1.ios)
	else
		sdkCallFunc("openUrl", slot1.android)
	end
end

function get_channel()
	if (device.getChannel and device.getChannel() or device.callFunc("channel")) == "" then
		slot0 = CHANNEL_NAME
	end

	CHANNEL_PRE = CHANNEL_PRE or ""

	return FINAL_CHANNEL or CHANNEL_PRE .. slot0
end

function log_url_encode(slot0)
	return string.gsub(string.gsub(string.gsub(slot0, "\n", "\r\n"), "([^%w ])", function (slot0)
		return string.format("%%%02X", string.byte(slot0))
	end), " ", "+")
end

function syGameSendOtherUrl(slot0, slot1)
	if slot1 == nil or slot1 == "" then
		return
	end

	sdkCallFunc("openSyW", slot1)
end

function spineResErrorLog(slot0, slot1)
	if error_log_report then
		error_log_report(string.format("英雄模型资源问题,路径为:%s, 角色为名:%s, 角色id为:%s, 角色服务器id为:%s", slot1, slot2 and slot2.name or 0, RoleController:getInstance():getRoleVo() and slot2.rid or 0, slot2 and slot2.srv_id or 0))

		if DELETE_SPINE_ERROR_RES then
			cc.FileUtils:getInstance():removeFile(cc.FileUtils:getInstance():fullPathForFilename(slot1))
		end
	end
end

function userBindFailed(slot0, slot1)
	if error_log_report then
		slot2 = RoleController:getInstance():getRoleVo()

		error_log_report(string.format("取消认证=====> rid=%s, srv_id=%s, name=%s", slot2.rid, slot2.srv_id, slot2.name))
	end

	OPEN_SDK_VISITIOR_WINDOW = false

	if NEED_OPEN_OPEN_SDK_VISITIOR_WINDOW == true then
		callFunc("touristMode", "60")
	end
end
