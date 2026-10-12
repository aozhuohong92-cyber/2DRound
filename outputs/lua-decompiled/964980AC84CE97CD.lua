LOG_TYPE = {
	create_role = "create_role",
	reg_acc = "reg_acc",
	device = "device",
	enter_city = "enter_city",
	get_def_srv = "get_def_srv",
	load_start = "load_start",
	select_srv = "select_srv",
	flash = "flash",
	advice = "advice",
	load_end = "load_end"
}
slot0 = false and LOG_URL ~= nil and cc.CCGameLib.logsign and PLATFORM ~= cc.PLATFORM_OS_WINDOWS and PLATFORM ~= cc.PLATFORM_OS_MAC

function log_to_web(slot0, slot1)
	if not uv0 then
		return
	end

	slot2 = LOG_URL .. slot0
	slot3 = os.date("%Y-%m-%d %H:%M:%S")
	slot7 = cc.CCGameLib:getInstance()
	slot9 = slot7

	for slot8, slot9 in pairs(slot1) do
		slot4 = "?date_time=" .. log_url_encode(slot3) .. "&sign=" .. slot7.logsign(slot9, slot3) .. "&" .. slot8 .. "=" .. log_url_encode(slot9)
	end

	slot5 = cc.XMLHttpRequest:new()
	slot5.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING

	slot5:open("POST", slot2 .. slot4)
	slot5:registerScriptHandler(function ()
		log_to_idfa_web(uv0)
	end)
	slot5:send()
end

function log_to_idfa_web(slot0)
	if not CONF_IDFA_WEB then
		return
	end

	slot2 = cc.XMLHttpRequest:new()
	slot2.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING

	slot2:open("POST", CONF_IDFA_WEB)
	slot2:registerScriptHandler(function ()
	end)
	slot2:send(slot0)
end

function log_url_encode(slot0)
	return string.gsub(string.gsub(string.gsub(slot0, "\n", "\r\n"), "([^%w ])", function (slot0)
		return string.format("%%%02X", string.byte(slot0))
	end), " ", "+")
end

function log_get_device_type()
	if PLATFORM == cc.PLATFORM_OS_WINDOWS then
		return "win"
	elseif PLATFORM == cc.PLATFORM_OS_MAC then
		return "mac"
	elseif PLATFORM == cc.PLATFORM_OS_IPHONE then
		return "iphone"
	elseif PLATFORM == cc.PLATFORM_OS_IPAD then
		return "ipad"
	elseif PLATFORM == cc.PLATFORM_OS_ANDROID then
		return "android"
	elseif PLATFORM == cc.PLATFORM_OS_LINUX then
		return "linux"
	else
		return "other"
	end
end

function log_get_device_info()
	return {
		resolution = "",
		device_id = getIdFa(),
		device_type = cc.GameDevice:callFunc("getDeviceName", "", 0, 0, ""),
		os = cc.GameDevice:callFunc("system_version", "", 0, 0, ""),
		carrier = cc.GameDevice:callFunc("carrier_name", "", 0, 0, ""),
		network_type = device.isWifiState() and "wifi" or "数据",
		product_name = GAME_CODE,
		platform_name = PLATFORM_NAME,
		channel_name = get_channel()
	}
end

function log_flag(slot0, slot1)
	if not uv0 then
		return false
	end

	slot1 = slot1 or 1

	if __log_flag == nil then
		__log_flag = {}

		if cc.FileUtils:getInstance():isFileExist(string.format("%slog_flag.lua", cc.FileUtils:getInstance():getWritablePath())) then
			slot3, slot4 = pcall(function ()
				return dofile(uv0)
			end)

			if slot3 and type(slot4) == "table" then
				__log_flag = slot4
			end
		end
	end

	if __log_flag[slot0] ~= slot1 then
		__log_flag[slot0] = slot1
		slot4 = "return {"

		for slot8, slot9 in pairs(__log_flag) do
			slot4 = type(slot9) == "string" and slot4 .. "\n  " .. slot8 .. " = [[" .. slot9 .. "]]," or slot4 .. "\n  " .. slot8 .. " = [[" .. slot9 .. "]]," .. "\n  " .. slot8 .. " = " .. slot9 .. ","
		end

		slot5 = assert(io.open(slot2, "wb"))

		slot5:write(slot4 .. "\n}")
		slot5:close()
	end

	return slot3 ~= slot1
end

function log_activate_device()
end

function log_flash()
end

function log_advice()
end

function log_loading_start()
end

function log_loading_end()
end

function log_reg_account(slot0)
end

function log_select_server(slot0)
end

function log_create_role(slot0)
end

function log_enter_city(slot0)
end

function log_get_def_srv(slot0)
end

log_activate_device()
log_flash()
