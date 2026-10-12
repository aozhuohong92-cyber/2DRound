function beginGame()
	if cc.Director:getInstance():getRunningScene() then
		cc.Director:getInstance():replaceScene(ViewManager:getInstance():getMainScene())
	else
		cc.Director:getInstance():runWithScene(ViewManager:getInstance():getMainScene())
	end

	LoginController:getInstance():createFillView()
	LoginController:getInstance():openView(LoginController.type.user_input)

	GAME_INITED = true
	_is_game_restart = false

	GlobalKeybordEvent:getInstance():add(function ()
		sdkKeyBackPress()
	end, cc.Handler.EVENT_KEYBOARD_RELEASED, cc.KeyCode.KEY_BACK, 0, "keyBackPress")

	if webFunc_GameStart then
		webFunc_GameStart()
	end

	if not MAKELIFEBETTER and IS_REQUIRE_RES_GY == true then
		print("begingame==========")

		if NEW_CDN_RES_GY == true then
			doCdnResFileDownload()
		else
			function OnFileDownloadResult(slot0, slot1)
				if pcall(function ()
					ALL_DOWNLOAD_RES_FILE = require("allres")
				end) and ALL_DOWNLOAD_RES_FILE then
					ResourcesLoadMgr:getInstance():downloadResAll()
				end
			end

			cc.FmodexManager:getInstance():downloadOtherFile(string.format("%s/allres.lua?%s", CDN_RES_GY_URL, os.time()), "allres.lua")
		end
	end
end

function doCdnResFileDownload()
	if SAVE_RES_FILE_LOCAL and pcall(function ()
		ALL_DOWNLOAD_RES_FILE = require("localallres")
	end) and ALL_DOWNLOAD_RES_FILE and type(ALL_DOWNLOAD_RES_FILE) == "table" and #ALL_DOWNLOAD_RES_FILE > 1 then
		game_print("边玩边下信息文件已存在本地，直接启动下载")
		ResourcesLoadMgr:getInstance():downloadResAll()

		return
	end

	game_print("开始下载边玩边下文件allres_file.lua")

	VER_UPDATE_ERR_NUM = 0

	function OnFileDownloadResult(slot0, slot1)
		xpcall(function ()
			package.loaded.allres_file = nil
			CDN_ALL_RES_FILE = require("allres_file")

			if CDN_ALL_RES_FILE and CDN_ALL_RES_FILE ~= "" then
				doCdnResDownload()
			else
				uv0()
			end
		end, function ()
			VER_UPDATE_ERR_NUM = VER_UPDATE_ERR_NUM + 1

			if VER_UPDATE_ERR_NUM < 10 then
				cc.FmodexManager:getInstance():downloadOtherFile(string.format("%s/allres_file.lua?%s", CDN_RES_GY_URL, os.time()), "allres_file.lua")
			end
		end)
	end

	cc.FmodexManager:getInstance():downloadOtherFile(string.format("%s/allres_file.lua?%s", CDN_RES_GY_URL, os.time()), "allres_file.lua")
end

function doCdnResDownload()
	VER_UPDATE_ERR_NUM = 0

	game_print("开始下载边玩边下信息文件")

	function OnFileDownloadResult(slot0, slot1)
		package.loaded.allres = nil

		xpcall(function ()
			ALL_DOWNLOAD_RES_FILE = require("allres")

			if ALL_DOWNLOAD_RES_FILE and type(ALL_DOWNLOAD_RES_FILE) == "table" and #ALL_DOWNLOAD_RES_FILE > 1 then
				game_print("启动下载边玩边下处理")
				ResourcesLoadMgr:getInstance():downloadResAll()
			else
				uv0()
			end
		end, function ()
			VER_UPDATE_ERR_NUM = VER_UPDATE_ERR_NUM + 1

			if VER_UPDATE_ERR_NUM < 10 then
				cc.FmodexManager:getInstance():downloadOtherFile(string.format("%s/%s", CDN_RES_GY_URL, CDN_ALL_RES_FILE), "allres.lua")
			end
		end)
	end

	cc.FmodexManager:getInstance():downloadOtherFile(string.format("%s/%s", CDN_RES_GY_URL, CDN_ALL_RES_FILE), "allres.lua")
end

function OnEnterBackground()
	__enter_background_ts__ = os.time()

	if BattleController then
		BattleController:getInstance():csEnterBackGround(true)
	end
end

function OnEnterForeground()
	if BattleController then
		BattleController:getInstance():csEnterBackGround(false)
	end

	if __enter_background_ts__ then
		if math.max(0, os.time() - __enter_background_ts__) > 3600 then
			sdkOnSwitchAccount()
		end

		__enter_background_ts__ = nil
	end
end

function restart(slot0)
	AudioManager:getInstance():DeleteMe()
	BattleController:getInstance():DeleteMe()
	LoginController:getInstance():DeleteMe()
	MainSceneController:getInstance():DeleteMe()
	MainuiController:getInstance():DeleteMe()
	RenderMgr:getInstance():stop()
	GlobalTimeTicket:getInstance():stop()
	GameNet:getInstance():DeleteMe()
	ViewManager:getInstance():DeleteMe()
	GlobalEvent:getInstance():UnBindAll()

	slot1 = G_SDK_INIT_SUCCESS

	ResourcesCacheMgr:getInstance():cleanAllTexture()

	for slot5, slot6 in pairs(package.loaded) do
		package.loaded[slot5] = nil
	end

	slot2 = _G.base

	for slot6, slot7 in pairs(_G) do
		if slot6 ~= "base" and slot6 ~= "_G" and type(slot7) ~= "function" then
			if type(slot6) == "string" and string.find(slot6, "print") then
				-- Nothing
			elseif not slot2[slot6] then
				if type(slot7) == "table" and not slot7.__index then
					if slot7.is_base or slot6 == "Config" then
						_G[slot6] = nil
					else
						freeConfig(_G, slot6)
					end
				else
					_G[slot6] = nil
				end
			end
		end
	end

	clearSuperClass()
	collectgarbage("collect")

	G_SDK_INIT_SUCCESS = slot1
	_is_game_restart = true

	if type(slot0) == "function" then
		slot0()
	end

	slot3, slot4 = xpcall(main, __G__TRACKBACK__)

	if not slot3 then
		-- Nothing
	end
end

function uploadFile(slot0, slot1, slot2)
	if type(readBinaryFile(PathTool.getVoicePath(slot0))) ~= "string" or string.len(slot4) < 1000 then
		cc.FileUtils:getInstance():removeFile(slot3)
		GlobalEvent:getInstance():Fire(EventId.ON_VOICE_UPLOAD_RESULT, {
			false,
			filename,
			string.len(slot4)
		})
	else
		if AUDIO_RECORD_TYPE == 10 then
			if callSpeexEncode() ~= 0 then
				return
			end

			slot4 = readBinaryFile(PathTool.getVoicePath(AUDIO_WAV_FILE_ENCODE_OUT))
		end

		ChatController:getInstance():sender12725(slot1, slot4, slot2)
	end
end

function freeConfig(slot0, slot1)
	if type(slot0[slot1]) == "table" then
		for slot5, slot6 in pairs(slot0[slot1]) do
			freeConfig(slot0[slot1], slot5)
		end
	end

	slot0[slot1] = nil
end
