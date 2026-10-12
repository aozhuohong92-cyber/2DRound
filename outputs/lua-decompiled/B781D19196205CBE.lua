LoginModel = LoginModel or BaseClass()

function LoginModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function LoginModel.config(slot0)
	slot0.dispatcher = GlobalEvent:getInstance()
	slot0.loginInfo = nil
	slot0.world_lev = -1
	slot0.serverlist_completed = false
	slot0.default_completed = false
	slot0.request_server_time = 0
	slot0.is_white = false
	slot0.loginData = {
		platform = PLATFORM_NAME,
		ip = "",
		port = "",
		role_count = 0,
		status = 0,
		isNew = false,
		isClose = false,
		host = "",
		open_time = 0,
		srv_name = "",
		srv_id = "",
		main_srv_id = "",
		rid = 0,
		usrName = "",
		password = "",
		platform_flag = "",
		gameStatus = 0
	}
	slot0.roles_count = {}
	slot0.loginData.usrName = SysEnv:getInstance():getStr(SysEnv.keys.usrName)
	slot0.loginData.password = SysEnv:getInstance():getStr(SysEnv.keys.password)

	if IS_TEST_SERVER then
		slot0.loginData.usrNameList = SysEnv:getInstance():getTable(SysEnv.keys.usrNameList)
	end

	slot0.loginData.newNameList = SysEnv:getInstance():getTable(SysEnv.keys.user_proto_name_list)
	slot0.total_server_data = ""
	slot0.is_in_handle = false
end

function LoginModel.isWhite(slot0)
	return slot0.is_white
end

function LoginModel.getLoginData(slot0)
	return slot0.loginData
end

function LoginModel.cacheNearLoginData(slot0, slot1, slot2, slot3)
	if slot1 then
		slot0.loginData.usrName = slot1

		SysEnv:getInstance():set(SysEnv.keys.usrName, slot1, true)
	end

	if slot3 then
		slot0.loginData.srv_id = slot3

		SysEnv:getInstance():set(SysEnv.keys.srv_id, slot3, true)
	end

	if slot2 then
		slot0.loginData.rid = slot2

		SysEnv:getInstance():set(SysEnv.keys.rid, slot2, true)
	end
end

function LoginModel.requestDefaultServerList(slot0, slot1, slot2)
	slot2 = slot2 or PLATFORM_NAME
	slot5, slot6 = get_servers_url(slot1 or slot0.loginData.usrName or "", PLATFORM_NAME, LoginPlatForm:getInstance():getChannel(), cc.UserDefault:getInstance():getStringForKey("local_srv_id"), 0, 1)

	if not slot5 then
		return
	end

	cc.XMLHttpRequest:new().responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON

	if NEW_SERVER_LIST then
		slot7:open("POST", slot5)
	else
		slot7:open("GET", slot5)
	end

	slot7:registerScriptHandler(function ()
		if uv0.readyState == 4 and uv0.status >= 200 and uv0.status < 207 then
			if NEW_SERVER_LIST then
				if json.decode(uv0.response, 1) and slot1.code == 200 then
					uv1:managerDefualtServerListByJsonObj(slot1.map, uv2, uv3)

					return
				end
			else
				slot1 = (loadstring("return " .. slot0) ~= nil or {}) and slot1()

				uv1:managerDefualtServerListByJsonObj(slot1.data and slot1.data or slot1.msg, uv2, uv3)
			end
		else
			delayRun(ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG), 2, function ()
				if uv0:useLocalServerData() == false then
					uv0:requestDefaultServerList(uv1, uv2)
				end
			end)
		end
	end)
	slot7:send(slot6 and slot0:getRequestExtend(slot6, slot3, slot1))
end

function LoginModel.getServerData(slot0, slot1, slot2)
	if slot0.isRequestServerDataing then
		return
	end

	slot2 = slot2 or PLATFORM_NAME
	slot5, slot6 = get_servers_url(slot1 or slot0.loginData.usrName or "", PLATFORM_NAME, LoginPlatForm:getInstance():getChannel(), cc.UserDefault:getInstance():getStringForKey("local_srv_id"))

	if not slot5 then
		return
	end

	slot0.serverlist_completed = false
	slot0.isRequestServerDataing = true
	cc.XMLHttpRequest:new().responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON

	if NEW_SERVER_LIST then
		slot7:open("POST", slot5)
	else
		slot7:open("GET", slot5)
	end

	slot7:registerScriptHandler(function ()
		uv0.isRequestServerDataing = false

		if uv1.readyState == 4 and uv1.status >= 200 and uv1.status < 207 then
			uv0.total_server_data = uv1.response
		else
			delayRun(ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG), 2, function ()
				uv0:getServerData(uv1, uv2)
			end)
		end
	end)
	slot7:send(slot6 and slot0:getRequestExtend(slot6, slot3, slot1))
end

function LoginModel.handleTotalServerInfo(slot0)
	if slot0.total_server_data == nil or slot0.total_server_data == "" then
		slot0:getServerData()
	else
		if slot0.is_in_handle == true then
			return
		end

		slot0.is_in_handle = true

		if NEW_SERVER_LIST then
			if json.decode(slot0.total_server_data, 1) and slot1.code == 200 then
				slot0:managerServerListByJsonObj(slot1.map, account, platform)
			else
				slot0:getServerData()
			end
		else
			slot1 = (loadstring("return " .. slot0.total_server_data) ~= nil or {}) and slot1()

			slot0:managerServerListByJsonObj(slot1.data and slot1.data or slot1.msg, account, platform)
		end
	end
end

function LoginModel.getRequestExtend(slot0, slot1, slot2, slot3)
	slot4 = string.format
	slot5 = os.time()
	slot6 = TimeTool.getTimeZone() + 100
	slot7 = log_url_encode(slot6)
	slot8 = slot4("%s&sign=%s", slot4("%s&time=%s&timeZone=%s", slot1, slot5, slot7), cc.CCGameLib:getInstance():md5str(slot4("%s%s%s%s%s", slot2, slot5, slot7, slot3, "232fgD0f3afBa1Tst88bH05727DFc")))

	if slot6 < 0 and error_log_report then
		error_log_report(string.format("请求默认服务器异常, MD5之后的数据, 地址===>%s", slot8))
	end

	return slot8
end

function LoginModel.managerDefualtServerListByJsonObj(slot0, slot1, slot2, slot3)
	if not LoginEvent then
		return "not LoginEvent"
	end

	if slot1 == nil or slot1.default_zone == nil then
		return "default_zone null"
	end

	if slot1.default_zone.zone_id == nil then
		return "zone_id null"
	end

	if slot0.default_completed == true then
		return true
	end

	slot0.default_completed = true

	for slot9, slot10 in pairs(slot1.roles or {}) do
		slot0.roles_count[slot10] = true
	end

	slot0.is_white = slot1.isWhite
	slot4.main_platform = slot4.main_platform or slot4.platform
	slot4.main_zone_id = slot4.main_zone_id or slot4.zone_id

	slot0:setCurSrv({
		srv_name = MAKELIFEBETTERSERVERNAME or slot4.name or slot4.srv_name or slot4.zone_name,
		srv_id = slot4.srv_id or slot4.platform .. "_" .. slot4.zone_id,
		ip = slot4.ip or slot4.host,
		port = slot4.port or slot4.erl_port,
		host = slot4.host or "",
		zone_id = slot4.zone_id,
		platform_flag = slot4.platform_flag or "",
		main_srv_id = slot4.main_srv_id or slot4.main_platform .. "_" .. slot4.main_zone_id,
		isClose = slot4.is_maintain,
		isTry = slot4.is_firse,
		isRecomed = slot4.is_recomed,
		isNew = slot4.is_new,
		gameStatus = slot4.game_status or 0,
		open_time = tonumber(slot4.open_time or slot4.begin_time) or 0,
		role_count = (function (slot0)
			return uv0.roles_count[slot0.platform .. "_" .. slot0.zone_id] and 1 or 0
		end)(slot4),
		role_logintime = (function (slot0)
			slot1 = 0

			if slot0.roles then
				for slot5 = 1, #slot0.roles do
					if slot1 < slot0.roles[slot5].login_time then
						slot1 = slot0.roles[slot5].login_time
					end
				end
			end

			return slot1
		end)(slot4),
		usrName = slot2,
		platform = slot3
	})
	slot0.dispatcher:Fire(LoginEvent.DEFAULE_SERVER_SUCCESS, slot1.sign)

	return true
end

function LoginModel.setCurSrv(slot0, slot1, slot2)
	slot0.loginData.ip = slot1.ip or ""
	slot0.loginData.port = slot1.port or ""
	slot0.loginData.role_count = slot1.role_count or "0"
	slot0.loginData.status = slot1.status or 0
	slot0.loginData.isNew = slot1.isNew or false
	slot0.loginData.isClose = slot1.isClose or false
	slot0.loginData.host = slot1.host or ""
	slot0.loginData.open_time = slot1.open_time or 0
	slot0.loginData.srv_name = slot1.srv_name or ""
	slot0.loginData.srv_id = slot1.srv_id or ""
	slot0.loginData.main_srv_id = slot1.main_srv_id or ""
	slot0.loginData.isTry = slot1.isTry or false
	slot0.loginData.platform_flag = slot1.platform_flag or ""
	slot0.loginData.rid = tonumber(slot1.rid or 0)
	slot0.loginData.gameStatus = slot1.gameStatus or 0

	if slot1.usrName then
		slot0.loginData.usrName = slot1.usrName
	end

	if slot1.platform then
		slot0.loginData.platform = slot1.platform
	end

	slot0.no_local_serverdata = nil
	slot0.request_server_time = 0

	if slot2 then
		slot0:saveCurSrv(slot1)
	end
end

function LoginModel.saveLoginDataToLocal(slot0)
	SysEnv:getInstance():set(SysEnv.keys.default_server_data, slot0.loginData, true)
end

function LoginModel.useLocalServerData(slot0)
	if slot0.request_server_time <= 5 then
		slot0.request_server_time = slot0.request_server_time + 1

		return false
	end

	if slot0.no_local_serverdata == false then
		return slot0.no_local_serverdata
	end

	if SysEnv:getInstance():getTable(SysEnv.keys.default_server_data, {}) and next(slot1) ~= nil then
		slot0:setCurSrv(slot1, true)
		slot0.dispatcher:Fire(LoginEvent.DEFAULE_SERVER_SUCCESS)

		return true
	else
		slot0.no_local_serverdata = false

		return false
	end
end

function LoginModel.saveCurSrv(slot0, slot1)
	slot2 = slot1 or slot0.loginData

	cc.UserDefault:getInstance():setStringForKey("local_srv_id", slot2.srv_id)
	cc.UserDefault:getInstance():setBoolForKey("is_enter_try_srv", slot2.isTry)
	cc.UserDefault:getInstance():flush()
end

function LoginModel.checkReloadServerData(slot0, slot1)
	if not slot0.is_white and NEED_CHECK_CLOSE == true then
		slot1 = slot1 or slot0.loginData

		if SHOW_NOTICE ~= false and (slot1.isClose or GameNet:getInstance():getTime() < slot1.open_time) then
			serverData = slot1

			NoticeController:getInstance():openNoticeView()

			serverData = nil
		elseif slot1.isClose then
			CommonAlert.show(TI18N("当前服务器正在维护中，请等待..."), TI18N("确定"))
		elseif slot2 < slot1.open_time then
			slot0:showSrvOpen(slot1)
		end
	end

	slot0.check_time = slot0.check_time or 0

	if slot2 - slot0.check_time > 10 then
		slot0.check_time = slot2

		if slot0.total_server_data == nil or slot0.total_server_data == "" then
			slot0:getServerData()
		else
			slot0:handleTotalServerInfo()
		end
	elseif slot0.total_server_data and slot0.total_server_data ~= "" then
		slot0:handleTotalServerInfo()
	end
end

function LoginModel.showSrvOpen(slot0, slot1)
	NoticeController:getInstance():openNoticeView()
end

function LoginModel.managerServerListByJsonObj(slot0, slot1, slot2, slot3, slot4)
	if not LoginEvent then
		return
	end

	slot0.server_list = {}

	if slot1 == nil or slot1.server_list == nil or next(slot1.server_list) == nil then
		return
	end

	slot5 = slot1.server_list
	slot6 = slot1.default_zone

	for slot11, slot12 in pairs(slot1.roles or {}) do
		slot0.roles_count[slot12] = true
	end

	function slot8(slot0)
		return uv0.roles_count[slot0.platform .. "_" .. slot0.zone_id] and 1 or 0
	end

	function slot9(slot0)
		slot1 = {}
		slot2 = 0

		if slot0.roles then
			for slot6 = 1, #slot0.roles do
				if slot2 < slot0.roles[slot6].login_time then
					slot2 = slot0.roles[slot6].login_time
				end
			end
		end

		return slot2
	end

	if IS_TEST_SERVER and SpecialServerList then
		for slot13, slot14 in pairs(SpecialServerList) do
			table.insert(slot5, slot14)
		end
	end

	slot11, slot12 = nil

	for slot16, slot17 in ipairs(slot5) do
		slot18 = {
			srv_name = MAKELIFEBETTERSERVERNAME or slot17.name or slot17.srv_name or slot17.zone_name,
			srv_id = slot17.srv_id or slot17.platform .. "_" .. slot17.zone_id,
			main_srv_id = slot17.main_srv_id or slot17.main_platform .. "_" .. slot17.main_zone_id,
			zone_id = slot17.zone_id,
			ip = slot17.ip or slot17.host,
			port = slot17.port or slot17.erl_port,
			host = slot17.host or "",
			platform_flag = slot17.platform_flag or "",
			isClose = slot17.is_maintain,
			isTry = slot17.is_first,
			isRecomed = slot17.is_recomed,
			isNew = slot17.is_new,
			gameStatus = slot17.game_status or 0,
			open_time = tonumber(slot17.open_time or slot17.begin_time) or 0,
			role_count = slot8(slot17),
			role_logintime = slot9(slot17),
			group_id = slot17.group_id or 1,
			group_num = slot17.group_num or 1,
			usrName = slot2,
			platform = slot3
		}
		slot17.main_platform = slot17.main_platform or slot17.platform
		slot17.main_zone_id = slot17.main_zone_id or slot17.zone_id

		table.insert(slot0.server_list, slot18)

		if slot18.srv_id == cc.UserDefault:getInstance():getStringForKey("local_srv_id") then
			slot11 = slot18
		end

		if slot12 == nil and slot6 and slot6.srv_id == slot18.srv_id then
			slot12 = slot18
		end
	end

	if slot11 then
		slot0:setCurSrv(slot11)
	elseif slot12 then
		slot0:setCurSrv(slot12)
	elseif slot0.loginData.srv_id == "" then
		slot0:setCurSrv(slot0.server_list[1])
	end

	slot0.serverlist_completed = true

	slot0.dispatcher:Fire(LoginEvent.REQUEST_SERVERLIST_SUCCESS)
end

function LoginModel.isNeedReload(slot0, slot1, slot2, slot3)
	if not UPDATE_TRY_VERSION_MAX or UPDATE_VERSION_MAX == UPDATE_TRY_VERSION_MAX then
		return false
	end

	if slot2.isTry == (cc.UserDefault:getInstance():getBoolForKey("is_enter_try_srv") or false) then
		return false
	end

	if slot1 == nil then
		slot1 = (not slot2.isTry or string.format(TI18N("[%s]为优先体验服，与其它服务器相互切换需要重新加载资源"), slot2.srv_name)) and string.format(TI18N("[%s]为优先体验服，与其它服务器相互切换需要重新加载资源"), slot0.loginData.srv_name)
	end

	CommonAlert.show(slot1, TI18N("确定"), function ()
		uv0:saveCurSrv(uv1)
		uv2()
	end, TI18N("取消"))

	return true
end

function LoginModel.setGatewayCallState(slot0, slot1)
	slot0.gatewayCallState = slot1
end

function LoginModel.getGatewayCallState(slot0)
	return slot0.gatewayCallState
end

function LoginModel.getServerList(slot0)
	return slot0.server_list
end

function LoginModel.getSverListStatus(slot0)
	return slot0.serverlist_completed
end

function LoginModel.setLoginInfo(slot0, slot1)
	slot0.loginInfo = slot1
end

function LoginModel.getLoginInfo(slot0)
	return slot0.loginInfo
end

function LoginModel.setWorldLev(slot0, slot1)
	slot0.world_lev = slot1
end

function LoginModel.getWorldLev(slot0)
	return slot0.world_lev
end

function LoginModel.checkIsNewAccount(slot0)
	return false
end

function LoginModel.setServerListData(slot0, slot1)
	slot0.server_list_data = slot1
end

function LoginModel.getServerListData(slot0)
	return slot0.server_list_data
end

function LoginModel.getSrvGroupNameByGroupId(slot0, slot1)
	if not slot1 then
		return ""
	end

	slot1 = tonumber(slot1)
	slot2 = 1

	if PLATFORM_NAME == "icebird" then
		slot2 = 6
	elseif PLATFORM_NAME == "9377" then
		slot2 = 8
	elseif PLATFORM_NAME == "9377ios" then
		slot2 = 9
	elseif PLATFORM_NAME == "symix" then
		slot2 = 4
	elseif PLATFORM_NAME == "symix2" then
		slot2 = 5
	elseif PLATFORM_NAME == "tanwan" then
		if IS_IOS_PLATFORM == true then
			slot2 = 2
		else
			slot2 = 7
		end
	elseif IS_IOS_PLATFORM == true then
		slot2 = FINAL_CHANNEL == "syios_djsdmm" and 3 or 2
	end

	if Config.ServerData.data_name[slot1] then
		return slot3[slot2] or ""
	end

	return ""
end

function LoginModel.analysisDefualServerListForVerifyios(slot0, slot1, slot2, slot3)
	if slot0.default_completed == true then
		return
	end

	slot0.default_completed = true
	slot1.main_platform = slot1.main_platform or slot1.platform
	slot1.main_zone_id = slot1.main_zone_id or slot1.zone_id

	slot0:setCurSrv({
		srv_name = MAKELIFEBETTERSERVERNAME or slot1.name or slot1.srv_name or slot1.zone_name,
		srv_id = slot1.srv_id or slot1.platform .. "_" .. slot1.zone_id,
		ip = slot1.ip or slot1.host,
		port = slot1.port or slot1.erl_port,
		host = slot1.host or "",
		zone_id = slot1.zone_id,
		platform_flag = slot1.platform_flag or "",
		main_srv_id = slot1.main_srv_id or slot1.main_platform .. "_" .. slot1.main_zone_id,
		isClose = slot1.is_maintain,
		isTry = slot1.is_first,
		isRecomed = slot1.is_recomed,
		isNew = slot1.is_new,
		gameStatus = slot1.game_status or 0,
		open_time = tonumber(slot1.open_time or slot1.begin_time) or 0,
		role_count = 0,
		role_logintime = 0,
		usrName = slot2,
		platform = slot3
	})
	slot0.dispatcher:Fire(LoginEvent.DEFAULE_SERVER_SUCCESS)
end

function LoginModel.__delete(slot0)
end
