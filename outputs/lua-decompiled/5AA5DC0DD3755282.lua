GuildSendMailWindow = GuildSendMailWindow or BaseClass(BaseView)
slot0 = GuildController:getInstance()
slot1 = GuildController:getInstance():getModel()
slot2 = string.format

function GuildSendMailWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.set_index = 1
	slot0.condition_index = 1
	slot0.layout_name = "guild/guild_send_mail_window"
	slot0.default_title_msg = TI18N("@all")
	slot0.default_content_msg = TI18N("点击输入邮件内容，字数不能超过100")
end

function GuildSendMailWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.btn_close = slot1:getChildByName("btn_close")
	slot0.btn_send = slot1:getChildByName("btn_send")

	slot0.btn_send:getChildByName("label"):setString(TI18N("发  送"))
	slot1:getChildByName("win_title"):setString(TI18N("发送邮件"))
	slot1:getChildByName("txt_send_name"):setString(slot0.default_title_msg)
	slot1:getChildByName("txt_send_name_title"):setString(TI18N("收件人id:"))
	slot1:getChildByName("txt_send_cont_title"):setString(TI18N("内容:"))

	slot0.label_content = createRichLabel(24, Config.ColorData.data_color4[151], cc.p(0, 1), cc.p(40, 560), 6, nil, 550)

	slot0.label_content:setString(slot0.default_content_msg)
	slot1:addChild(slot0.label_content)

	slot0.edit_cont = createEditBox(slot1, PathTool.getResFrame("common", "common_99998"), cc.size(550, 440), nil, 24, nil, 24, nil, nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.edit_cont:setAnchorPoint(cc.p(0, 1))
	slot0.edit_cont:setFontColor(Config.ColorData.data_color4[175])
	slot0.edit_cont:setPosition(cc.p(35, 565))
	slot0.edit_cont:setMaxLength(100)
	slot0.edit_cont:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0.begin_change_label then
				uv0.begin_change_label = false

				uv0.label_content:setVisible(true)
				slot1:setText("")

				if slot1:getText() ~= "" and slot2 ~= uv0.content_str then
					uv0.content_str = slot2

					if uv0.label_content then
						uv0.label_content:setString(slot2)
					end
				end
			end
		elseif slot0 == "began" and not uv0.begin_change_label then
			uv0.label_content:setVisible(false)

			uv0.begin_change_label = true
		end
	end)
end

function GuildSendMailWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openGuildSendMailWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openGuildSendMailWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_send, function ()
		if string.len(uv0.content_str or "") == 0 or slot0 == uv0.default_content_msg then
			message(TI18N("请输入邮件内容"))

			return
		end

		uv1:send13580(slot0)
		uv1:openGuildSendMailWindow(false)
	end, true, 1)
end

function GuildSendMailWindow.openRootWnd(slot0)
end

function GuildSendMailWindow.close_callback(slot0)
	uv0:openGuildSendMailWindow(false)
end
