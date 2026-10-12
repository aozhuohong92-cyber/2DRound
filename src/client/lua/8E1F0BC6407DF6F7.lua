slot0 = class("FileUpdate");

function slot0.ctor(slot0, slot1)
end

function slot0.ver_load_start(slot0)
	if cc.UserDefault:getInstance():getIntegerForKey("lasted_main_version", 0) < BUILD_VERSION and cc.UserDefault:getInstance():getIntegerForKey("local_version", 0) < NOW_VERSION or __clear_ver_file then
		cc.UserDefault:getInstance():setIntegerForKey("lasted_main_version", BUILD_VERSION);
		cc.UserDefault:getInstance():setIntegerForKey("lasted_version", 0);
		cc.UserDefault:getInstance():setIntegerForKey("local_version", 0);
		cc.UserDefault:getInstance():setIntegerForKey("local_try_version", 0);
		cc.UserDefault:getInstance():flush();

		if cc.FileUtils:getInstance():isDirectoryExist(string.format("%s", cc.FileUtils:getInstance():getWritablePath())) then
			cc.FileUtils:getInstance():removeDirectory(slot3);
		end

		if cc.FileUtils:getInstance():isDirectoryExist(string.format("%stryver/", cc.FileUtils:getInstance():getWritablePath())) then
			cc.FileUtils:getInstance():removeDirectory(slot3);
		end

		if cc.FileUtils:getInstance():isDirectoryExist(string.format("%svoice/", cc.FileUtils:getInstance():getWritablePath())) then
			cc.FileUtils:getInstance():removeDirectory(slot3);
		end

		if cc.Director:getInstance():getRunningScene() then
			cc.Director:getInstance():replaceScene(cc.Scene:create());
		else
			cc.Director:getInstance():runWithScene(slot4);
		end

		slot4:runAction(cc.Sequence:create(cc.DelayTime:create(0.1), cc.CallFunc:create(function ()
			uv0:check_new_version();
		end)));
	else
		slot0:check_new_version();
	end
end

function slot0.check_new_version(slot0)
	slot0:initUpdateScene(function ()
		if NEED_CALL_SDK_INIT then
			sdkCallFunc("sdkInit");
		end

		if G_SDK_INIT_SUCCESS or not WAIT_SDK_INIT_SUC or (PLATFORM == cc.PLATFORM_OS_WINDOWS or PLATFORM == cc.PLATFORM_OS_MAC) then
			uv0:initConfig();
		end
	end);
end

function slot0.initUpdateScene(slot0, slot1)
	require("util.pathtool");
	require("util.util");
	require("0zWHhlnBORyiROK6lvI6VBn6vAbJRQqS.login.view.version_view");
	require("0zWHhlnBORyiROK6lvI6VBn6vAbJRQqS.login.view.login_fill_view");
	require("UUn2rw1Xe79sI0UaGlea5iQRvaDeuUng.common_function");
	require("UUn2rw1Xe79sI0UaGlea5iQRvaDeuUng.common_define");
	require("ePoCrKQkWA3vpiOwu2oNfOh02MOeNheW.loading_desc_data");
	require("base.baseclass");
	require("util.cocos_tool");

	if cc.Director:getInstance():getRunningScene() then
		cc.Director:getInstance():replaceScene(cc.Scene:create());
		cc.SkeletonCache:getInstance():disposeAllCache();
		display.removeUnusedSpriteFrames();
		display.removeUnusedTextures();
	else
		cc.Director:getInstance():runWithScene(slot2);
	end

	slot0.update_scene = slot2;
	slot3 = ccui.Layout:create();

	slot3:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT));
	slot3:setPosition(display.center);
	slot3:setAnchorPoint(cc.p(0.5, 0.5));
	slot2:addChild(slot3);
	showLayoutRect(slot3, 255);

	if WAIT_FOR_NEW_WORLD and os.time() <= WAIT_FOR_NEW_WORLD and IOS_LOCAL_RES then
		IS_MAKE_LIFE_BETTER_STATUS = true;

		cc.FileUtils:getInstance():addSearchPath(IOS_LOCAL_RES, true);
		require("url_config_local");
	end

	if slot0:checkIsShowVedio() then
		slot0:showFirstVedio(slot3, slot2, slot1);
	else
		slot0:showFirstPage(false, slot3, slot2, slot1);
	end
end

function slot0.checkIsShowVedio(slot0)
	if NEED_PLAY_FLASHVIDEO == true then
		do return true end
	end

	do return false end
end

function slot0.showFirstVedio(slot0, slot1, slot2, slot3)
	if cc.FileUtils:getInstance():isFileExist(cc.FileUtils:getInstance():getWritablePath() .. "res/resource/login/logo.mp4") then
		cc.FileUtils:getInstance():removeFile(slot4);
	end

	if not cc.FileUtils:getInstance():isFileExist("resource/login/logo.mp4") or ccexp.VideoPlayer == nil then
		slot0:showFirstPage(false, slot1, slot2, slot3);
	else
		slot7 = ccexp.VideoPlayer:create();

		slot7:setAnchorPoint(cc.p(0.5, 0.5));
		slot7:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT));
		slot7:setFullScreenEnabled(true);
		slot7:setPosition(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
		slot7:addEventListener(function (slot0, slot1)
			if slot1 == ccexp.VideoPlayerEvent.COMPLETED then
				slot0:stop();
				slot0:runAction(cc.RemoveSelf:create(true));
				uv0:showFirstPage(true, uv1, uv2, uv3);
			end
		end);
		slot7:setFileName(slot5);
		slot7:play();
		slot1:addChild(slot7, 998);
	end
end

function slot0.showFirstPage(slot0, slot1, slot2, slot3, slot4)
	createSprite(PathTool.getLoadingRes(), SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5, slot2, cc.p(0.5, 0.5), LOADTEXT_TYPE):setScale(display.getMaxScale());

	if needMourning() then
		setChildUnEnabled(true, slot6, cc.c4b(255, 255, 255, 255));
	end

	slot7 = FillView.new();

	slot7:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5);
	slot2:addChild(slot7, 10);

	slot8 = VersionView.new();

	slot8:setPosition(SCREEN_WIDTH * 0.5, display.getBottom(slot2));
	slot8:setAnchorPoint(cc.p(0.5, 0));
	slot2:addChild(slot8, 1);

	slot3.version_view = slot8;

	slot4();
end

function slot0.initConfig(slot0)
	if slot0.update_scene == nil then
		do return end
	end

	if G_SDK_INIT_SUCCESS and not WAIT_SDK_INIT_SUC and not (PLATFORM == cc.PLATFORM_OS_WINDOWS or PLATFORM == cc.PLATFORM_OS_MAC) then
		do return end
	end

	if not slot0._init then
		slot0._init = true;
	else
		do return end
	end

	slot0.net_manager = cc.SmartSocket:getInstance();

	slot0.net_manager:Start();

	slot2 = cc.GameDevice:callFunc("package_version", "", 0, 0, "");

	slot0.update_scene.version_view:setVersionTips(TI18N("连接服务器进入游戏中..."));

	if URL_PATH then
		slot0:downLoadFinishFunc();
	elseif IS_MAKE_LIFE_BETTER_STATUS == true then
		slot0:downLoadFinishFunc();
	elseif IS_IOS_PLATFORM then
		slot0:check_down_load_url(slot2);
	else
		slot0:down_load_url_by_fmodex(slot2);
	end
end

function slot0.check_down_load_url(slot0, slot1)
	if not URL_LUA_CHECKIP then
		do return end
	end

	slot3 = cc.XMLHttpRequest:new();
	slot3.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON;

	slot3:open("GET", slot2);
	slot3:registerScriptHandler(function ()
		if uv0.readyState == 4 and uv0.status >= 200 and uv0.status < 207 then
			if uv0.response == false then
				URL_LUA_CONFIG = URL_LUA_TEST_CONFIG;
			end

			uv1:down_load_url_by_fmodex(uv2);
		else
			delayRun(ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG), 2, function ()
				uv0:check_down_load_url(uv1);
			end);
		end
	end);
	slot3:send(body);
end

function slot0.down_load_url_by_fmodex(slot0, slot1)
	function OnFileDownloadResult(slot0, slot1)
		slot2 = assert(io.open(slot1, "r"));
		slot3 = slot2:read("*all");

		slot2:close();

		slot4, slot5 = pcall(function ()
			loadstring(uv0 or "")();
		end);

		if slot4 and URL_PATH_ALL then
			if IOS_LOCAL_RES and URL_CONFIG_USE_LOCAL == true then
				cc.FileUtils:getInstance():addSearchPath(IOS_LOCAL_RES, true);
				require("url_config_local");
				uv0:downLoadFinishFunc();
			else
				URL_PATH = URL_PATH_ALL.get(4);

				uv0:downLoadFinishFunc();
			end
		else
			uv0.update_scene.version_view:setVersionTips(string.format(TI18N("连接服务器失败...[%s]"), slot0));
			uv0.update_scene:runAction(cc.Sequence:create(cc.DelayTime:create(0.6), cc.CallFunc:create(function ()
				cc.FmodexManager:getInstance():downloadOtherFile(string.format("%s?build_ver=%d&package_ver=%s&%d", URL_LUA_CONFIG, BUILD_VERSION, uv0, os.time()), "url_config.txt");
			end)));

			url_config_down_error = (url_config_down_error or 0) + 1;

			if url_config_down_error == 10 and error_log_report then
				error_log_report(string.format("下载url_config.lua失败,url:%s|status:%s", URL_LUA_CONFIG, slot0), slot1);
			end
		end
	end

	cc.FmodexManager:getInstance():downloadOtherFile(string.format("%s?build_ver=%d&package_ver=%s&%d", URL_LUA_CONFIG, BUILD_VERSION, slot1, os.time()), "url_config.txt");
end

function slot0.downLoadFinishFunc(slot0)
	if not log_advice then
		require("cli_log");
	end

	if log_advice then
		log_advice();
	end

	if DIRECTTOONLOGIN == true then
		sdkOnLogin();
	else
		slot0:realDownLoadFinishFunc();
	end
end

function slot0.realDownLoadFinishFunc(slot0)
	if PLATFORM == cc.PLATFORM_OS_WINDOWS or PLATFORM == cc.PLATFORM_OS_MAC then
		slot2, slot3 = pcall(function ()
			require("../web_func");
		end);

		if slot2 == true and webFunc_urlConfigEnd then
			webFunc_urlConfigEnd();
		end
	end

	if WIN_UPDATE and slot1 or UPDATE_SKIP then
		slot0:update_finish();

		do return end
	end

	slot0:down_web_func();
end

function slot0.down_web_func(slot0)
	slot1 = nil;

	if ((not cc.UserDefault:getInstance():getBoolForKey("is_enter_try_srv") or TRY_WEB_FUNC_FILE) and WEB_FUNC_FILE) == nil then
		slot0:update_version();

		do return end
	end

	function OnFileDownloadResult(slot0, slot1)
		slot2 = assert(io.open(slot1, "r"));
		slot3 = slot2:read("*all");

		slot2:close();

		slot4, slot5 = pcall(function ()
			loadstring(uv0 or "")();
		end);

		if slot4 and webFunc_GameStart then
			if webFunc_urlConfigEnd then
				webFunc_urlConfigEnd();
			end

			uv0:update_version();
		else
			uv0.update_scene.version_view:setVersionTips(string.format(TI18N("连接服务器失败[%s]"), slot0));
			uv0.update_scene:runAction(cc.Sequence:create(cc.DelayTime:create(0.6), cc.CallFunc:create(function ()
				cc.FmodexManager:getInstance():downloadOtherFile(uv0, "web_func.txt");
			end)));

			web_func_down_error = (web_func_down_error or 0) + 1;

			if web_func_down_error == 10 and error_log_report then
				error_log_report(string.format("下载web_func.lua失败,url:%s|status:%s", uv1, slot0), slot1);
			end
		end
	end

	slot0.update_scene.version_view:setVersionTips(TI18N("初始化依赖数据..."));
	cc.FmodexManager:getInstance():downloadOtherFile(string.format("%s/inc_ver/web_func/%s.g", URL_PATH.update, slot1), "web_func.txt");
end

function slot0.update_version(slot0)
	VER_UPDATE_ERR_NUM = 0;

	if VER_MAINTAIN_MSG then
		-- Nothing
	elseif slot0:merge_version() then
		slot0:update_net_version();
	end
end

function slot0.merge_version(slot0)
	do return true end

	if cc.UserDefault:getInstance():getIntegerForKey("local_try_version", 0) <= cc.UserDefault:getInstance():getIntegerForKey("local_version", 0) or not UPDATE_VERSION_MAX or UPDATE_VERSION_MAX < slot1 or UPDATE_VERSION_MAX <= slot2 then
		do return true end
	end

	slot4 = nil;

	if cc.FileUtils:getInstance():isFileExist(cc.FileUtils:getInstance():getWritablePath() .. "tryver/all_res_file.luac") and type(dofile(slot3)) ~= "table" then
		-- Nothing
	end

	slot5 = #(slot4 or require("all_res_file"));

	slot0.update_scene:scheduleUpdateWithPriorityLua(function (slot0)
		slot1 = 0;
		slot2 = 0;

		while next(uv0) do
			if slot1 > 50 or slot2 > 5 then
				break
			end

			slot1 = slot1 + 1;

			if cc.FileUtils:getInstance():isFileExist(cc.FileUtils:getInstance():getWritablePath() .. "tryver/" .. table.remove(uv0)) then
				slot2 = slot2 + 1;
				slot5 = cc.FileUtils:getInstance():getWritablePath() .. slot3;

				cc.FileUtils:getInstance():createDirectory(string.match(slot5, "(.+)/[^/]*$"));
				cc.FileUtils:getInstance():renameFile(slot4, slot5);
			end
		end

		if not next(uv0) then
			uv1.update_scene:unscheduleUpdate();
			uv1.update_scene.version_view:update(0, TI18N("(不消耗流量)版本合并中..."));
			cc.UserDefault:getInstance():setIntegerForKey("lasted_version", uv2);
			cc.UserDefault:getInstance():setIntegerForKey("local_version", uv2);
			cc.UserDefault:getInstance():flush();
			uv1:update_net_version();
		else
			uv1.update_scene.version_view:update(math.ceil(100 - #uv0 * 100 / uv3), TI18N("(不消耗流量)版本合并中..."));
		end
	end, 0);

	do return false end
end

function slot0.get_version_info(slot0)
	if cc.UserDefault:getInstance():getBoolForKey("is_enter_try_srv") then
		do return math.max(math.max(cc.UserDefault:getInstance():getIntegerForKey("local_try_version", 0), cc.UserDefault:getInstance():getIntegerForKey("local_version", 0)), NOW_VERSION), UPDATE_TRY_VERSION_MAX or UPDATE_VERSION_MAX, true end
	else
		do return math.max(cc.UserDefault:getInstance():getIntegerForKey("local_version", 0), NOW_VERSION), UPDATE_VERSION_MAX, false end
	end
end

function slot0.update_net_version(slot0)
	if UPDATE_MODE_BY_INC and (not VerPath or not VerPath[string.format("%s_min_%s", slot0:get_version_info(), BUILD_VERSION)]) then
		slot0:update_net_version_by_inc();
	else
		slot0:update_net_version_by_zip();
	end
end

function slot0.update_net_version_by_zip(slot0)
	if cc.UserDefault:getInstance():getIntegerForKey("laster_version", 0) ~= 0 then
		cc.UserDefault:getInstance():setIntegerForKey("local_version", slot1);
	end

	cc.UserDefault:getInstance():setIntegerForKey("lasted_version", math.max(cc.UserDefault:getInstance():getIntegerForKey("local_version"), NOW_VERSION));
	cc.UserDefault:getInstance():flush();

	slot3 = string.format("%s/zip", URL_PATH.update);
	slot4 = string.format("%s/version2.txt?ts=%s", URL_PATH.update, os.time());
	slot5, slot6 = slot0:get_version_info();

	(function (slot0)
		if tonumber(slot0) then
			slot3, slot4 = nil;

			for slot8 = uv0 + 1, slot1 do
				slot4 = string.format("%s_min_%s", slot8, BUILD_VERSION);
				slot3 = string.format("%s", slot8);

				if VerPath and VerPath[slot4] then
					slot2 = 0 + VerPath[slot4].size;
				elseif VerPath and VerPath[slot3] then
					slot2 = slot2 + VerPath[slot3].size;
				end
			end

			if uv0 < slot1 then
				AUTO_SHOW_NOTICE = true;

				uv1:update_version_to(slot1, uv0 + 1, slot1 - uv0, now_ver, uv2, uv3);
			else
				uv1:update_finish();
			end
		end
	end)(slot6);
end

function slot0.update_net_version_by_inc(slot0)
	slot1, slot2, slot3 = slot0:get_version_info();

	if slot2 <= slot1 then
		do return slot0:update_finish() end
	end

	AUTO_SHOW_NOTICE = true;
	inc_ver_download_list = {};
	inc_ver_download_all = {};
	inc_ver_download_size = 0;
	inc_ver_downloading_files = {};
	inc_ver_download_num = 0;
	inc_ver_download_finish_size = 0;
	inc_ver_download_finish_num = 0;
	inc_ver_download_pro_num = 0;
	inc_ver_download_speed = 0;
	inc_ver_diff_temp_files = {};
	inc_ver_download_pro_max = INC_VER_DOWNLOAD_PRO_MAX or 1;
	slot4 = cc.FileUtils:getInstance():getWritablePath();

	function slot6()
		inc_ver_diff_temp_files = nil;

		if inc_ver_download_num == 0 then
			uv0:update_version_by_inc_merge();
		else
			uv0:update_version_by_inc_download_init();
		end
	end

	if slot1 == NOW_VERSION and min_inc_pack_name and slot2 <= slot1 + 1 then
		(function ()
			if uv0 then
				uv1:update_version_by_inc_diff(uv2, uv3, min_inc_pack_name, true, uv4);
			else
				uv4();
			end
		end)();

		do return end
	end

	slot0:update_version_by_inc_diff(slot4, slot1, slot2, false, function ()
		if uv0 and UPDATE_VERSION_MAX < uv1 and uv2 < UPDATE_VERSION_MAX then
			inc_ver_diff_temp_files = {};

			uv3:update_version_by_inc_diff(uv4, uv2, UPDATE_VERSION_MAX, false, uv5);
		else
			uv5();
		end
	end);
end

function slot0.update_version_by_inc_diff(slot0, slot1, slot2, slot3, slot4, slot5)
	slot7 = string.format("%s/inc_ver/%s/inc_ver.lua", URL_PATH.update, slot3);

	if INC_VER_MD5_FILE == true then
		slot7 = string.format("%s/inc_ver/%s/inc_ver_%s_%s.g", URL_PATH.update, slot3, slot3, cc.CCGameLib:getInstance():md5str(string.match(URL_PATH.update, "update_[^/]+") .. "_inc_ver_" .. slot3));
	end

	function OnFileDownloadResult(slot0, slot1)
		slot2 = assert(io.open(slot1, "r"));
		slot3 = slot2:read("*all");

		slot2:close();

		slot4, slot5 = pcall(function ()
			do return loadstring(string.format("%s", uv0))() end
		end);

		if slot4 and slot5 then
			for slot9, slot10 in pairs(slot5) do
				if uv0 then
					if inc_ver_diff_temp_files[slot9] == nil then
						slot10.path = slot9;

						if cc.FileUtils:getInstance():isFileExist(string.format("%s/%s", uv2, string.format("inc_ver/%s/%s", uv1, slot9))) and cc.FileUtils:getInstance():getFileSize(slot12) == slot10.size then
							slot10.status = 1;
						elseif inc_ver_download_all[slot11] == nil then
							inc_ver_download_size = inc_ver_download_size + slot10.size;
							inc_ver_download_num = inc_ver_download_num + 1;

							table.insert(inc_ver_download_list, slot11);
						end

						inc_ver_download_all[slot11] = slot10;
					end
				elseif uv3 < slot10.ver then
					inc_ver_diff_temp_files[slot9] = slot10;
					slot10.path = slot9;

					if cc.FileUtils:getInstance():isFileExist(string.format("%s/%s", uv2, string.format("inc_ver/%s/%s", slot10.ver, slot9))) and cc.FileUtils:getInstance():getFileSize(slot12) == slot10.size then
						slot10.status = 1;
					elseif inc_ver_download_all[slot11] == nil then
						inc_ver_download_size = inc_ver_download_size + slot10.size;
						inc_ver_download_num = inc_ver_download_num + 1;

						table.insert(inc_ver_download_list, slot11);
					end

					inc_ver_download_all[slot11] = slot10;
				end
			end

			package.loaded.inc_ver = nil;
			slot5 = nil;
			VER_UPDATE_ERR_NUM = 0;

			uv4();
		else
			uv5.update_scene.version_view:setVersionTips(string.format(TI18N("下载版本信息数据...[%s]"), slot0));

			VER_UPDATE_ERR_NUM = VER_UPDATE_ERR_NUM + 1;

			if VER_UPDATE_ERR_NUM >= (VER_UPDATE_ERR_MAX or 50) then
				sdkAlert(string.format(TI18N("多次尝试下载文件失败，是否继续尝试(%s)？"), slot0), TI18N("确认"), function ()
					VER_UPDATE_ERR_NUM = 0;

					cc.FmodexManager:getInstance():downloadOtherFile(string.format("%s?%d", uv0, os.time()), "inc_ver.lua");
				end, "取消", sdkOnExit);

				if error_log_report then
					error_log_report(string.format("下载inc_ver.lua失败,url:%s|status:%s", uv6, slot0), string.format("%s/inc_ver.lua", cc.FileUtils:getInstance():getWritablePath()));
				end
			else
				uv5.update_scene:runAction(cc.Sequence:create(cc.DelayTime:create(0.2), cc.CallFunc:create(function ()
					cc.FmodexManager:getInstance():downloadOtherFile(string.format("%s?%d", uv0, os.time()), "inc_ver.lua");
				end)));
			end
		end
	end

	cc.FileUtils:getInstance():removeFile("inc_ver.lua");

	if INC_VER_MD5_FILE == true then
		cc.FmodexManager:getInstance():downloadOtherFile(slot7, "inc_ver.lua");
	else
		cc.FmodexManager:getInstance():downloadOtherFile(string.format("%s?%s", slot6, os.time()), "inc_ver.lua");
	end

	slot0.update_scene.version_view:setVersionTips(TI18N("下载版本信息数据..."));
end

function slot0.update_version_by_inc_download_init(slot0)
	slot2 = inc_ver_download_size * 0.8 / 1024 / 1024;

	cc.CCGameDownload:getInstance():startThread(inc_ver_download_pro_max);

	inc_ver_download_pro_max = inc_ver_download_pro_max * 2;
	slot3 = os.clock();
	inc_ver_download_start_time = os.time();
	slot4 = 0;
	slot5 = cc.FileUtils:getInstance():getWritablePath();

	slot0.update_scene:scheduleUpdateWithPriorityLua(function (slot0)
		uv0 = uv0 + 1;

		if uv0 >= 30 then
			uv0 = 0;
			slot3 = "";

			if inc_ver_download_speed / (os.clock() - uv1) * 0.8 / 1024 > 1024 then
				slot3 = string.format("%.2f", slot2 / 1024);
			end

			for slot8, slot9 in pairs(inc_ver_downloading_files) do
				slot4 = inc_ver_download_finish_size + slot9.now_size;
			end

			slot5 = slot4 * 0.8 / 1024 / 1024;
			slot6 = nil;

			uv3.update_scene.version_view:update(math.max(0, math.floor(slot4 * 100 / inc_ver_download_size)), (slot3 == "" or string.format(TI18N("资源下载中...[%sMB/s, %0.2fMB/%.2fMB]"), slot3, slot5, uv2)) and string.format(TI18N("资源下载中...[%.2fKB/s, %0.2fMB/%.2fMB]"), slot2, slot5, uv2));

			uv1 = slot1;
			inc_ver_download_speed = 0;
		end
	end, 0);
	slot0.update_scene.version_view:setVersionTips(TI18N("资源下载中..."));

	function downloadProcess(slot0, slot1)
		if not inc_ver_downloading_files then
			do return end
		end

		if inc_ver_downloading_files[slot1] and slot2.now_size ~= slot0 then
			inc_ver_download_speed = inc_ver_download_speed + slot0 - slot2.now_size;
			slot2.now_size = slot0;
		end
	end

	function OnDownloadIncVer(slot0, slot1)
		if not inc_ver_downloading_files then
			do return end
		end

		if not inc_ver_downloading_files[slot1] then
			do return end
		end

		slot3 = slot2.url;
		slot5 = inc_ver_download_all[slot2.file];

		if cc.FileUtils:getInstance():isFileExist(string.format("%s%s", uv0, slot1)) and cc.FileUtils:getInstance():getFileSize(slot6) == slot5.size then
			inc_ver_download_pro_num = inc_ver_download_pro_num - 1;
			inc_ver_downloading_files[slot1] = nil;

			cc.FileUtils:getInstance():renameFile(slot6, string.format("%s%s", uv0, slot4));

			inc_ver_download_finish_num = inc_ver_download_finish_num + 1;
			inc_ver_download_finish_size = inc_ver_download_finish_size + slot5.size;
			slot5.status = 1;
			VER_UPDATE_ERR_NUM = 0;

			uv1:update_version_by_inc_download();
		else
			VER_UPDATE_ERR_NUM = VER_UPDATE_ERR_NUM + 1;
			slot2.now_size = 0;

			if VER_UPDATE_ERR_NUM >= (VER_UPDATE_ERR_MAX or 50) then
				inc_ver_download_pro_num = inc_ver_download_pro_num - 1;

				if show_alert_ui then
					do return end
				end

				if inc_ver_download_pro_num > 0 then
					do return end
				end

				show_alert_ui = true;

				sdkAlert(string.format(TI18N("多次尝试下载文件失败，是否继续尝试(%s)？"), slot0), TI18N("确认"), function ()
					show_alert_ui = nil;
					VER_UPDATE_ERR_NUM = 0;

					cc.CCGameDownload:getInstance():download(string.format("%s?%s", uv0, os.time()), uv1, "OnDownloadIncVer");
				end, "取消", sdkOnExit);

				if error_log_report then
					error_log_report(string.format("下载失败,url:%s|status:%s|size:%s,%s", slot3, slot0, cc.FileUtils:getInstance():getFileSize(slot6), slot5.size), slot6);
				end
			else
				uv1.update_scene:runAction(cc.Sequence:create(cc.DelayTime:create(0.2), cc.CallFunc:create(function ()
					cc.CCGameDownload:getInstance():download(string.format("%s", uv0), uv1, "OnDownloadIncVer");
				end)));
			end
		end
	end

	slot0:update_version_by_inc_download();
end

function slot0.update_version_by_inc_download(slot0)
	if inc_ver_download_num <= inc_ver_download_finish_num then
		slot0.update_scene:unscheduleUpdate();
		cc.CCGameDownload:getInstance():stopThread();

		slot1 = os.time() - inc_ver_download_start_time;

		slot0:update_version_by_inc_merge();

		do return end
	end

	if not next(inc_ver_download_list) and inc_ver_download_pro_num == 0 then
		for slot4, slot5 in pairs(inc_ver_download_all) do
			if slot5.status ~= 1 then
				table.insert(inc_ver_download_list, slot4);
			end
		end
	end

	if inc_ver_download_pro_max <= inc_ver_download_pro_num or not next(inc_ver_download_list) then
		do return end
	end

	inc_ver_download_pro_num = inc_ver_download_pro_num + 1;
	slot1 = table.remove(inc_ver_download_list);
	slot3 = string.match(slot1, "(.+)/[^/]*%.%w+$");
	slot5 = string.format("%s/%s", URL_PATH.update, string.format("%s/%s.g", slot3, inc_ver_download_all[slot1].file));
	slot4 = string.format("%s.g", slot1);
	inc_ver_downloading_files[slot4] = {
		now_size = 0,
		file = slot1,
		url = slot5
	};

	cc.FileUtils:getInstance():createDirectory(string.format("%s%s", cc.FileUtils:getInstance():getWritablePath(), slot3));
	cc.CCGameDownload:getInstance():download(string.format("%s", slot5), slot4, "OnDownloadIncVer");
	slot0:update_version_by_inc_download();
end

function slot0.update_version_by_inc_merge(slot0)
	all_merge_list = {};

	for slot5, slot6 in pairs(inc_ver_download_all) do
		table.insert(all_merge_list, {
			ver = slot6.ver,
			sfile = slot5,
			path = slot6.path
		});

		slot1 = 0 + 1;
	end

	table.sort(all_merge_list, function (slot0, slot1)
		do return slot1.ver < slot0.ver end
	end);

	inc_ver_download_list = nil;
	inc_ver_download_all = nil;
	inc_ver_downloading_files = nil;
	slot2, slot3, slot4 = slot0:get_version_info();
	slot5 = cc.FileUtils:getInstance():getWritablePath();

	slot0.update_scene:scheduleUpdateWithPriorityLua(function (slot0)
		slot1 = 0;

		while next(all_merge_list) do
			if slot1 > 10 then
				break
			end

			slot1 = slot1 + 1;
			slot2 = table.remove(all_merge_list);
			slot3 = uv0 .. slot2.sfile;
			slot4 = string.format("%s%s", uv0, slot2.path);

			if UPDATE_VERSION_MAX < slot2.ver then
				slot4 = string.format("%stryver/%s", uv0, slot2.path);
			end

			cc.FileUtils:getInstance():createDirectory(string.match(slot4, "(.*)/[^/]*$"));
			cc.FileUtils:getInstance():renameFile(slot3, slot4);
		end

		if not next(all_merge_list) then
			uv1.update_scene:unscheduleUpdate();
			uv1.update_scene.version_view:update(100, TI18N("版本下载完成，更新替换中..."));
			cc.UserDefault:getInstance():setIntegerForKey("local_try_version", uv2);
			cc.UserDefault:getInstance():setIntegerForKey("lasted_version", math.min(UPDATE_VERSION_MAX, uv2));
			cc.UserDefault:getInstance():setIntegerForKey("local_version", math.min(UPDATE_VERSION_MAX, uv2));
			cc.UserDefault:getInstance():flush();
			cc.FileUtils:getInstance():removeDirectory(string.format("%sinc_ver", uv0));
			uv1:update_finish();
		else
			uv1.update_scene.version_view:update(math.ceil(100 - #all_merge_list * 100 / uv3), TI18N("版本下载完成，更新替换中..."));
		end
	end, 0);
end

function slot0.update_version_to(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if UPDATE_VERSION_MAX < slot2 then
		slot0:update_try_version_to(slot1, slot2, slot3, slot4, slot5, slot6);

		do return end
	end

	slot7 = string.format("%s_min_%s", slot2, BUILD_VERSION);

	if min_inc_pack_name then
		slot7 = string.format("%s_%s", slot2, min_inc_pack_name);
	end

	slot8 = string.format("%s", slot2);
	slot9 = 1;
	slot10 = nil;
	slot11 = slot2;

	if CDN_PATH_BASE and VerPath and VerPath[slot7] and VerPath[slot7].name then
		slot10 = string.format("%s%s.zip", CDN_PATH_BASE, VerPath[slot7].name);
	elseif CDN_PATH_BASE and VER_UPDATE_ERR_NUM < 3 and VerMergePath and VerMergePath[slot8] and VerMergePath[slot8].name and VerMergePath[slot8].addver and VerMergePath[slot8].tover and VerMergePath[slot8].tover <= UPDATE_VERSION_MAX then
		slot11 = slot2 + math.max(VerMergePath[slot8].addver, slot9) - 1;
		slot10 = string.format("%s%s.zip", CDN_PATH_BASE, VerMergePath[slot8].name);
	elseif CDN_PATH_BASE and VerPath and VerPath[slot8] and VerPath[slot8].name then
		if VerPath.skip then
			slot0:update_version_to(slot1, slot2 + 1, slot3, slot4, slot5, slot6);

			do return end
		end

		slot10 = string.format("%s%s.zip", CDN_PATH_BASE, VerPath[slot8].name);
	else
		slot10 = string.format("%s%s.zip", slot6, slot8);
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(cc.FileUtils:getInstance():getWritablePath()) then
		cc.FileUtils:getInstance():createDirectory(slot12);
	end

	if DOWNLOADING_VER == true then
		do return end
	end

	DOWNLOADING_VER = true;

	slot0.update_scene.version_view:setVersionTips(string.format(TI18N("更新总进度:%s/%s,目标版本:%s.%s"), slot3 - (slot1 - slot2), slot3, getVersionDesc(), slot1));

	slot18 = cc.AssetsManager:new(slot10, slot5, slot12);

	slot18:deleteVersion();
	slot18:setDelegate(function (slot0)
		DOWNLOADING_VER = false;

		if not tolua.isnull(asset_mgr) and asset_mgr:getReferenceCount() > 1 then
			asset_mgr:release();
		end

		if slot0 == cc.ASSETSMANAGER_NO_NEW_VERSION then
			uv0:update_finish();
		else
			VER_UPDATE_ERR_NUM = VER_UPDATE_ERR_NUM + 1;

			if cc.FileUtils:getInstance():isDirectoryExist(string.format("%svoice/", cc.FileUtils:getInstance():getWritablePath())) then
				cc.FileUtils:getInstance():removeDirectory(slot1);
			end

			if VER_UPDATE_ERR_NUM > 30 then
				uv0.update_scene.version_view:setVersionTips(string.format(TI18N("下载版本包[%s]失败:[%s][%s],请检查网络/存储空间是否不足"), uv1, slot0, VER_UPDATE_ERR_NUM));

				do return end
			elseif VER_UPDATE_ERR_NUM > 2 then
				uv0.update_scene.version_view:setVersionTips(string.format(TI18N("下载版本包[%s]失败:[%s][%s],请检查存储空间是否不足"), uv1, slot0, VER_UPDATE_ERR_NUM));
			else
				uv0.update_scene.version_view:setVersionTips(string.format(TI18N("下载版本包[%s]失败:[%s]"), current_version, slot0));
			end

			delayOnce(function ()
				uv0:update_version_to(uv1, uv2, uv3, uv4, uv5, uv6);
			end, 1);
		end
	end, cc.ASSETSMANAGER_PROTOCOL_ERROR);
	slot18:setDelegate(function (slot0)
		uv2.update_scene.version_view:update(math.max(0, math.floor(slot0 * 1 / (uv0 or 1) + (uv1 - 1) / (uv0 or 1) * 100)), uv3);
	end, cc.ASSETSMANAGER_PROTOCOL_PROGRESS);
	slot18:setDelegate(function ()
		DOWNLOADING_VER = nil;

		cc.UserDefault:getInstance():setIntegerForKey("lasted_version", uv0);
		cc.UserDefault:getInstance():setIntegerForKey("local_version", uv0);
		cc.UserDefault:getInstance():setIntegerForKey("local_try_version", math.max(uv0, cc.UserDefault:getInstance():getIntegerForKey("local_try_version", 0)));
		cc.UserDefault:getInstance():flush();

		if not tolua.isnull(asset_mgr) and asset_mgr:getReferenceCount() > 1 then
			asset_mgr:release();
		end

		VER_UPDATE_ERR_NUM = 0;

		if not downVerZipSuccess or downVerZipSuccess(uv1, uv2) then
			uv3:update_version_to(uv2, uv1 + uv4, uv5, uv6, uv7, uv8);
		end
	end, cc.ASSETSMANAGER_PROTOCOL_SUCCESS);
	slot18:retain();
	slot18:setConnectionTimeout(10);
	slot18:update();
end

function slot0.ver2num(slot0, slot1)
end

function slot0.update_try_version_to(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot1 < slot2 then
		slot0:update_finish();

		do return end
	end

	slot7 = string.format("%s_min_%s", slot2, BUILD_VERSION);
	slot8 = string.format("%s", slot2);
	slot9 = 1;
	slot10 = nil;
	slot11 = slot2;

	if CDN_PATH_BASE and VerPath and VerPath[slot7] and VerPath[slot7].name then
		slot10 = string.format("%s%s.zip", CDN_PATH_BASE, VerPath[slot7].name);
	elseif CDN_PATH_BASE and VER_UPDATE_ERR_NUM < 3 and VerMergePath and VerMergePath[slot8] and VerMergePath[slot8].name and VerMergePath[slot8].addver and VerMergePath[slot8].tover and VerMergePath[slot8].tover <= slot1 then
		slot11 = slot2 + math.max(VerMergePath[slot8].addver, slot9) - 1;
		slot10 = string.format("%s%s.zip", CDN_PATH_BASE, VerMergePath[slot8].name);
	elseif VER_UPDATE_ERR_NUM_USE_OTHER and VER_UPDATE_ERR_NUM_USE_OTHER < VER_UPDATE_ERR_NUM then
		slot10 = string.format("%s%s.zip", slot6, slot8);
	elseif CDN_PATH_BASE and VerPath and VerPath[slot8] and VerPath[slot8].name then
		if VerPath.skip then
			slot0:update_try_version_to(slot1, slot2, slot3, slot4, slot5, slot6);

			do return end
		end

		slot10 = string.format("%s%s.zip", CDN_PATH_BASE, VerPath[slot8].name);
	else
		slot10 = string.format("%s%s.zip", slot6, slot8);
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(cc.FileUtils:getInstance():getWritablePath() .. "tryver/") then
		cc.FileUtils:getInstance():createDirectory(slot12);
	end

	if DOWNLOADING_VER == true then
		do return end
	end

	DOWNLOADING_VER = false;

	slot0.update_scene.version_view:setVersionTips(string.format(TI18N("更新总进度:%s/%s,目标版本:%s.%s"), slot3 - (slot1 - slot2), slot3, getVersionDesc(), slot1));

	slot18 = cc.AssetsManager:new(slot10, slot5, slot12);

	slot18:deleteVersion();
	slot18:setDelegate(function (slot0)
		DOWNLOADING_VER = nil;

		if not tolua.isnull(asset_mgr) and asset_mgr:getReferenceCount() > 1 then
			asset_mgr:release();
		end

		if slot0 == cc.ASSETSMANAGER_NO_NEW_VERSION then
			uv0:update_finish();
		else
			VER_UPDATE_ERR_NUM = VER_UPDATE_ERR_NUM + 1;

			if cc.FileUtils:getInstance():isDirectoryExist(string.format("%svoice/", cc.FileUtils:getInstance():getWritablePath())) then
				cc.FileUtils:getInstance():removeDirectory(slot1);
			end

			if VER_UPDATE_ERR_NUM > 30 then
				uv0.update_scene.version_view:setVersionTips(string.format(TI18N("下载版本包[%s]失败:[%s][%s],请检查网络/存储空间是否不足"), current_version, slot0, VER_UPDATE_ERR_NUM));

				do return end
			elseif VER_UPDATE_ERR_NUM > 2 then
				uv0.update_scene.version_view:setVersionTips(string.format(TI18N("下载版本包[%s]失败:[%s][%s],请检查存储空间是否不足"), current_version, slot0, VER_UPDATE_ERR_NUM));
			else
				uv0.update_scene.version_view:setVersionTips(string.format(TI18N("下载版本包[%s]失败:[%s]"), current_version, slot0));
			end

			delayOnce(function ()
				uv0:update_try_version_to(uv1, uv2, uv3, uv4, uv5, uv6);
			end, 1);
		end
	end, cc.ASSETSMANAGER_PROTOCOL_ERROR);
	slot18:setDelegate(function (slot0)
		uv2.update_scene.version_view:update(math.max(0, math.floor(slot0 * 1 / (uv0 or 1) + (uv1 - 1) / (uv0 or 1) * 100)), uv3);
	end, cc.ASSETSMANAGER_PROTOCOL_PROGRESS);
	slot18:setDelegate(function ()
		DOWNLOADING_VER = nil;

		cc.UserDefault:getInstance():setIntegerForKey("local_try_version", uv0);
		cc.UserDefault:getInstance():flush();

		if not tolua.isnull(asset_mgr) and asset_mgr:getReferenceCount() > 1 then
			asset_mgr:release();
		end

		VER_UPDATE_ERR_NUM = 0;

		if not downVerZipSuccess or downVerZipSuccess(uv1, uv2) then
			uv3:update_try_version_to(uv2, uv1 + uv4, uv5, uv6, uv7, uv8);
		end
	end, cc.ASSETSMANAGER_PROTOCOL_SUCCESS);
	slot18:retain();
	slot18:setConnectionTimeout(10);
	slot18:update();
end

function slot0.update_finish(slot0)
	if log_loading_start then
		log_loading_start();
	end

	for slot4, slot5 in pairs(package.loaded) do
		package.loaded[slot4] = nil;
	end

	cc.FileUtils:getInstance():purgeCachedEntries();
	require("ePoCrKQkWA3vpiOwu2oNfOh02MOeNheW.config");
	require("mmtZgQAwkKz4pG9sW05wVoadNxAlGKg9.module_include");

	for slot4, slot5 in pairs(GameConfig) do
		table.insert(GameModule, slot5);
	end

	slot2 = #GameModule + #deepCopy(PLIST_LIST);
	slot3 = false;
	slot4 = os.clock();
	slot5 = PLATFORM == cc.PLATFORM_OS_WINDOWS or PLATFORM == cc.PLATFORM_OS_MAC;

	function slot6()
		if #GameModule > 0 or #uv0 > 0 then
			do return end
		end

		uv1.update_scene.version_view:setTips(TI18N("初始化..."));

		slot0 = uv1:initInstance();
	end

	function slot7(slot0, slot1)
		uv0 = false;

		ResourcesCacheMgr:getInstance():increaseReferenceCount(slot1, ResourcesType.plist);
	end

	function slot8(slot0)
		slot5 = 4;

		for slot5 = 1, math.min(slot5, #GameModule) do
			slot6 = table.remove(GameModule, 1);
			slot7, slot8 = pcall(function ()
				require(uv0);
			end);

			if not slot7 and (DEBUG or uv0) then
				uv1.update_scene:unscheduleUpdate();

				break
			end
		end

		if #GameModule == 0 then
			if #uv2 == 0 and uv3 == false then
				uv1.update_scene:unscheduleUpdate();

				if uv1.time_ticket then
					GlobalTimeTicket:getInstance():remove(uv1.time_ticket);

					uv1.time_ticket = nil;
				end

				print("finish_callback=======");
				uv4();
			elseif uv3 == false then
				if uv1.time_ticket then
					GlobalTimeTicket:getInstance():remove(uv1.time_ticket);

					uv1.time_ticket = nil;
				end

				slot2 = table.remove(uv2, 1);

				if not cc.FileUtils:getInstance():isFileExist(string.format("%s.plist", slot2)) or not cc.FileUtils:getInstance():isFileExist(string.format("%s.png", slot2)) then
					uv3 = false;

					if DEBUG or uv0 then
						uv1.update_scene:unscheduleUpdate();
					end
				else
					uv3 = true;

					display.loadSpriteFrames(slot3, slot4, uv5);

					uv1.time_ticket = GlobalTimeTicket:getInstance():add(function ()
						uv0 = false;
					end, 2, 1);
				end
			end
		end

		uv1.update_scene.version_view:update(math.ceil(95 - (#GameModule + #uv2) * 95 / uv6), TI18N("初始化数据中..."));
	end

	slot0.update_scene:scheduleUpdateWithPriorityLua(function (slot0)
		uv0(slot0);
	end, 0);
end

function slot0.initInstance(slot0)
	print("initInstance=========");

	if webFunc_initInstanceStart then
		webFunc_initInstanceStart();
	end

	if slot0.net_manager then
		slot0.net_manager:Stop();
		slot0.net_manager:DeleteMe();

		slot0.net_manager = nil;
	end

	slot2 = os.clock();
	slot4 = {};

	for slot8, slot9 in pairs(_G) do
		slot3 = 0 + 1;

		if type(slot9) == "table" and slot9.getInstance and string.find(slot8, "Base") == nil and string.find(slot8, "GlobalKeybordEvent") == nil and string.find(slot8, "GlobalTimeTicket") == nil then
			table.insert(slot4, {
				ctrl = slot9,
				key = slot8
			});

			slot1 = 0 + 1;
		end
	end

	function slot5()
		if webFunc_initInstanceEnd then
			webFunc_initInstanceEnd();
		end

		slot0, slot1 = pcall(function ()
			require("game_start");
		end);

		if slot0 == true then
			if log_loading_end then
				log_loading_end();
			end

			beginGame();
		end
	end

	slot6 = #slot4;

	slot0.update_scene:scheduleUpdateWithPriorityLua(function (slot0)
		if #uv0 == 0 then
			uv1.update_scene:unscheduleUpdate();
			uv2();
		end

		slot5 = 4;

		for slot5 = 1, math.min(slot5, #uv0) do
			table.remove(uv0, 1).ctrl:getInstance();
		end

		uv1.update_scene.version_view:update(math.ceil(100 - #uv0 * 5 / uv3), TI18N("连接服务器进入游戏中..."));
	end, 0);

	do return slot1 end
end

do return slot0 end
