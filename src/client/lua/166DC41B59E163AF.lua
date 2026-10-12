LoginWindow = LoginWindow or BaseClass(BaseView)

function LoginWindow.__init(slot0)
	slot0.ctrl = LoginController:getInstance()
	slot0.view_index = 0
	slot0.views = {}
	slot0.is_full_screen = true
	slot0.layout_name = "login/login_window"
	slot0.back_ground_path = PathTool.getLoginRes()
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("login", "login"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("login", "login2"),
			type = ResourcesType.plist
		},
		{
			path = slot0.back_ground_path,
			type = ResourcesType.single
		}
	}
end

function LoginWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		loadSpriteTexture(slot0.background, slot0.back_ground_path, LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.container = slot0.root_wnd:getChildByName("container")

	if "E51008" ~= "" and IS_NEED_LOGINBG_EFFECT then
		-- Nothing
	end

	slot2 = SHOWVERSIONMSG
	slot0.plate_label = slot0.container:getChildByName("label_plate")

	if slot0.plate_label then
		if slot2 and slot2 ~= "" and type(slot2) == "string" then
			slot0.plate_label:setString(slot2)
		else
			slot0.plate_label:setString("")
		end

		slot0.plate_label:setPositionY(display.getBottom() + 20)
	end

	slot0.label_version = slot0.container:getChildByName("label_version")

	if slot0.label_version then
		if UPDATE_VERSION_MAX < math.max(cc.UserDefault:getInstance():getIntegerForKey("local_version"), NOW_VERSION) then
			slot3 = UPDATE_VERSION_MAX

			cc.UserDefault:getInstance():setIntegerForKey("lasted_version", UPDATE_VERSION_MAX)
			cc.UserDefault:getInstance():setIntegerForKey("local_version", UPDATE_VERSION_MAX)
			cc.UserDefault:getInstance():flush()
		end

		if cc.UserDefault:getInstance():getBoolForKey("is_enter_try_srv") then
			slot3 = math.max(cc.UserDefault:getInstance():getIntegerForKey("local_try_version"), slot3)
		end

		slot4 = getVersionDesc()

		if not IS_PLATFORM_LOGIN then
			slot0.label_version:setVisible(true)
		else
			slot0.label_version:setVisible(false)
		end

		slot0.label_version:setString(string.format(TI18N("版本号：v%s.%s"), slot4, slot3))
		slot0.label_version:setPositionY(display.getBottom() + 20)
	end

	if needMourning() then
		setChildUnEnabled(true, slot0.background)
		setChildUnEnabled(true, slot0.spine)
		slot0.plate_label:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.plate_label:setTextColor(cc.c3b(129, 129, 129))
		slot0.label_version:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.label_version:setTextColor(cc.c3b(129, 129, 129))
	end
end

function LoginWindow.showVersionLabel(slot0)
	if not MAKELIFEBETTER and not tolua.isnull(slot0.label_version) then
		slot0.label_version:setVisible(true)
	end
end

function LoginWindow.openRootWnd(slot0, slot1)
	print("loginwidow==========" .. slot1)
	slot0:showPanel(slot1)
	delayOnce(function ()
		AudioManager:getInstance():playMusic(AudioManager.AUDIO_TYPE.SCENE, "s_001", true)
	end, 1)
	slot0:preloadSomething()
end

function LoginWindow.preloadSomething(slot0)
	if SOUND_EFFECT_LIST and AudioManager:getInstance().preLoadEffectByPath then
		for slot4, slot5 in ipairs(SOUND_EFFECT_LIST) do
			AudioManager:getInstance():preLoadEffectByPath(slot5)
		end
	end

	if SCENE_MUSIC_LIST and AudioManager:getInstance().preLoadMusicByPath then
		for slot4, slot5 in ipairs(SCENE_MUSIC_LIST) do
			AudioManager:getInstance():preLoadMusicByPath(slot5)
		end
	end

	if SysEnv:getInstance():getBool(SysEnv.keys.high_quality, true) == true then
		EQUIPMENT_QUALITY = 3
	else
		EQUIPMENT_QUALITY = 1
	end

	slot2 = 237

	if ACCOUNT_HAS_ROLE == true then
		slot2 = 234
	end

	slot3 = PathTool.getEffectRes(slot2)
	slot4, slot5, slot6 = PathTool.getSpineByName(slot3)

	cc.Director:getInstance():getTextureCache():addImageAsync(slot6, function ()
	end, getPixelFormat(slot3))
end

function LoginWindow.showPanel(slot0, slot1)
	if slot0.view_index == (slot1 or LoginController.type.user_input) then
		return
	end

	if slot0:getViewById(slot1) == nil then
		return
	end

	if slot0.selected_view then
		slot0.selected_view:setVisible(false)

		slot0.selected_view = nil
	end

	slot0.view_index = slot1
	slot0.selected_view = slot2

	slot0.selected_view:setVisible(true)
	slot0.selected_view:update()

	if slot1 == LoginController.type.enter_game then
		if AUTO_SHOW_NOTICE == true and not MAKELIFEBETTER then
			NoticeController:getInstance():openNoticeView()
		end
	elseif slot1 == LoginController.type.server_list then
		-- Nothing
	elseif slot1 == LoginController.type.user_input then
		-- Nothing
	end

	slot0.selected_view:stopAllActions()
	slot0.selected_view:effectHandler()
end

function LoginWindow.getViewById(slot0, slot1)
	if slot1 == LoginController.type.server_list and MAKELIFEBETTER == true then
		return
	end

	if slot0.views[slot1] == nil then
		if slot1 == LoginController.type.user_input then
			if IS_PLATFORM_LOGIN or not (PLATFORM == cc.PLATFORM_OS_WINDOWS or PLATFORM == cc.PLATFORM_OS_MAC) then
				slot2 = UserPanel.new(slot0.container, slot0.ctrl)
			end
		elseif slot1 == LoginController.type.enter_game then
			slot2 = EnterPanel.new(slot0.container, slot0.ctrl)
		elseif slot1 == LoginController.type.server_list then
			slot2 = ServerPanel.new(slot0.container, slot0.ctrl)
		end

		slot0.container:addChild(slot2, 1)

		slot0.views[slot1] = slot2
	end

	return slot0.views[slot1]
end

function LoginWindow.close_callback(slot0)
	if slot0.spine then
		slot0.spine:setVisible(false)
		slot0.spine:removeFromParent()

		slot0.spine = nil
	end

	for slot4, slot5 in pairs(slot0.views) do
		slot5:DeleteMe()

		slot5 = nil
	end

	slot0.views = nil
end
