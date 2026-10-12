GuildChangeSignWindow = GuildChangeSignWindow or BaseClass(BaseView)
slot0 = GuildController:getInstance()
slot1 = GuildController:getInstance():getModel()
slot2 = string.format

function GuildChangeSignWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.set_index = 1
	slot0.condition_index = 1
	slot0.layout_name = "guild/guild_change_sign_window"
end

function GuildChangeSignWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.confirm_btn = slot1:getChildByName("confirm_btn")

	slot1:getChildByName("notice"):setString(TI18N("公会宣言："))
	slot1:getChildByName("win_title"):setString(TI18N("修改宣言"))
	slot0.confirm_btn:getChildByName("label"):setString(TI18N("确定"))

	slot0.edit_title = createEditBox(slot1, PathTool.getResFrame("common", "common_99998"), cc.size(390, 130), nil, 22, Config.ColorData.data_color4[151], 22, TI18N("请输入公会宣言内容"), nil, , LOADTEXT_TYPE_PLIST)

	slot0.edit_title:setAnchorPoint(cc.p(0, 1))
	slot0.edit_title:setPlaceholderFontColor(Config.ColorData.data_color4[151])
	slot0.edit_title:setFontColor(Config.ColorData.data_color4[175])
	slot0.edit_title:setPosition(cc.p(174, 271))
	slot0.edit_title:setMaxLength(100)
end

function GuildChangeSignWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openGuildChangeSignWindow(false)
		end
	end)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			if isQingmingShield and isQingmingShield() then
				return
			end

			playButtonSound2()

			if uv0.edit_title:getText() == "" then
				message(TI18N("宣言不能为空！"))
			else
				uv1:requestChangeGuildSign(slot2)
			end
		end
	end)
end

function GuildChangeSignWindow.openRootWnd(slot0)
end

function GuildChangeSignWindow.close_callback(slot0)
	uv0:openGuildChangeSignWindow(false)
end
