slot0 = {
	platform = "unknown",
	model = "unknown",
	platform = "windows"
}

if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
	-- Nothing
elseif slot2 == cc.PLATFORM_OS_MAC then
	slot0.platform = "mac"
elseif slot2 == cc.PLATFORM_OS_ANDROID then
	slot0.platform = "android"
elseif slot2 == cc.PLATFORM_OS_IPHONE or slot2 == cc.PLATFORM_OS_IPAD then
	slot0.platform = "ios"
	slot5 = cc.Director:getInstance():getOpenGLView():getFrameSize()

	if slot5.width == 640 and slot5.height == 960 then
		slot0.model = "iphone 4"
	elseif slot6 == 640 and slot7 == 1136 then
		slot0.model = "iphone 5"
	elseif slot6 == 750 and slot7 == 1334 then
		slot0.model = "iphone 6"
	elseif slot6 == 1242 and slot7 == 2208 then
		slot0.model = "iphone 6 plus"
	elseif slot6 == 768 and slot7 == 1024 then
		slot0.model = "ipad"
	elseif slot6 == 1536 and slot7 == 2048 then
		slot0.model = "ipad retina"
	end
elseif slot2 == cc.PLATFORM_OS_WINRT then
	slot0.platform = "winrt"
elseif slot2 == cc.PLATFORM_OS_WP8 then
	slot0.platform = "wp8"
end

slot0.platform_os = slot2
slot0.language = slot1:getCurrentLanguage() == cc.LANGUAGE_CHINESE and "cn" or slot3 == cc.LANGUAGE_FRENCH and "fr" or slot3 == cc.LANGUAGE_ITALIAN and "it" or slot3 == cc.LANGUAGE_GERMAN and "gr" or slot3 == cc.LANGUAGE_SPANISH and "sp" or slot3 == cc.LANGUAGE_RUSSIAN and "ru" or slot3 == cc.LANGUAGE_KOREAN and "kr" or slot3 == cc.LANGUAGE_JAPANESE and "jp" or slot3 == cc.LANGUAGE_HUNGARIAN and "hu" or slot3 == cc.LANGUAGE_PORTUGUESE and "pt" or slot3 == cc.LANGUAGE_ARABIC and "ar" or "en"
slot0.writablePath = cc.FileUtils:getInstance():getWritablePath()
slot0.directorySeparator = "/"
slot0.pathSeparator = ":"

if slot0.platform == "windows" then
	slot0.directorySeparator = "\\"
	slot0.pathSeparator = ";"
end

function slot0.getDeviceName()
	return uv0.callFunc("getDeviceName")
end

function slot0.hasNotchInScreen()
	return uv0.callFunc("hasNotchInScreen")
end

function slot0.sysTotalSize()
	return uv0.callFunc("sysTotalSize")
end

function slot0.getIdFa()
	return uv0.callFunc("idfa")
end

function slot0.getuiId()
	return uv0.callFunc("getuiId")
end

function slot0.isWifiState()
	return uv0.sdkCallFunc("wifiState") == 3
end

function slot0.getChannel()
	slot1 = uv0.callFunc("sub_channel")

	if uv0.callFunc("channel") ~= "" and slot1 ~= "" and CHANNEL_MERGE == true then
		slot0 = slot0 .. "_" .. slot1
	end

	return slot0
end

function slot0.getBatteryLevel()
	return uv0.sdkCallFunc("batteryLevel")
end

function slot0.callFunc(slot0, slot1, slot2, slot3, slot4)
	if not cc.GameDevice.callFunc or slot0 == nil or slot0 == "" then
		return ""
	end

	return cc.GameDevice:callFunc(slot0, slot1 or "", slot2 or 0, slot3 or 0, slot4 or "")
end

function slot0.sdkCallFunc(slot0, slot1, slot2, slot3, slot4)
	if slot0 == "sdkExit" then
		return cc.Director:getInstance():endToLua()
	end

	if not cc.GameDevice.sdkCallFunc or slot0 == nil or slot0 == "" then
		return -1
	end

	return cc.GameDevice:sdkCallFunc(slot0, slot1 or "", slot2 or 0, slot3 or 0, slot4 or "")
end

return slot0
