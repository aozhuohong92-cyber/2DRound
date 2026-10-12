VerificationcodeMainWindow = VerificationcodeMainWindow or BaseClass(BaseView)
slot0 = VerificationcodeController:getInstance()

function VerificationcodeMainWindow.__init(slot0)
	slot0.type = CommonAlert.type.common
	slot0.offset_height = 95
	slot0.view_tag = ViewMgrTag.DEBUG_TAG
	slot0.layout_name = "common/common_alert"
	slot0.win_type = WinType.Tips
	slot0.time = 0
end

function VerificationcodeMainWindow.open_callback(slot0)
	slot0.background_panel = slot0.root_wnd:getChildByName("background_panel")

	slot0.background_panel:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0.main_panel:setContentSize(672, 390)

	slot1 = slot0.main_panel:getContentSize().width

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.title_contaier = slot0.main_panel:getChildByName("title_container")
	slot0.title_label = slot0.title_contaier:getChildByName("title_label")

	slot0.title_label:setString(TI18N("验证信息"))
	slot0.title_contaier:setPosition(slot1 / 2, slot0.title_contaier:getPositionY() + 35)

	slot0.line = slot0.main_panel:getChildByName("line")

	slot0.line:setPositionY(slot0.line:getPositionY() + 9)

	slot0.ok_btn = slot0.main_panel:getChildByName("ok_btn")
	slot0.ok_btn.label = slot0.ok_btn:getChildByName("label")

	slot0.ok_btn.label:setString(TI18N("确定"))
	slot0.ok_btn:setPositionX(slot0.title_contaier:getPositionX())

	slot0.cancel_btn = slot0.main_panel:getChildByName("cancel_btn")

	slot0.cancel_btn:setVisible(false)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")

	slot0.close_btn:setVisible(false)
	createLabel(26, 175, nil, slot1 / 2, 330, TI18N("如果您连续5次输入错误，服务器将自动断开连接"), slot0.main_panel, nil, cc.p(0.5, 1))

	slot0.img = createImage(slot0.main_panel, nil, slot1 * 0.5, 190, cc.p(0, 0), false, nil, true)

	slot0.img:setContentSize(249, 78)

	slot3 = TI18N("请输入答案")

	if uv0:getFlagValue() == 0 then
		slot3 = TI18N("请输入验证码")
	elseif slot4 ~= 1 then
		slot3 = TI18N("请输入答案")
	end

	slot0.input_edit = createEditBox(slot0.main_panel, PathTool.getResFrame("common", "common_1021"), size or cc.size(250, 50), Config.ColorData.data_color3[81], 22, nil, 25, slot3, nil, 10, LOADTEXT_TYPE_PLIST)

	slot0.input_edit:setAnchorPoint(cc.p(1, 0.5))
	slot0.input_edit:setPosition(slot1 / 2 - 10, 230)
	slot0.input_edit:setInputMode(cc.EDITBOX_INPUT_MODE_NUMERIC)
	createLabel(24, 178, nil, slot1 * 0.5 + 125, 144, TI18N("_____________"), slot0.main_panel, nil, cc.p(0.5, 0))

	slot0.change_text = createRichLabel(24, 178, cc.p(0.5, 0), cc.p(slot1 * 0.5 + 125, 146), nil, , 200)

	slot0.change_text:setString(TI18N("看不清，换一张"))
	slot0.main_panel:addChild(slot0.change_text)
end

function VerificationcodeMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.ok_btn, function ()
		if uv0.input_edit:getText() == "" or slot0 == nil then
			message("您尚未输入验证信息")

			return
		end

		uv1:send10990(slot0)
	end, true)
	slot0.change_text:addTouchLinkListener(function ()
		if uv0.time <= os.time() then
			uv1:send10990(0)

			uv0.time = os.time() + 1
		else
			message("点击太快")
		end
	end, {
		"click",
		"href"
	})
	slot0:addGlobalEvent(VerificationcodeEvent.VERIFICATION_CODE_CHANGE, function (slot0)
		if slot0.flag ~= 1 then
			uv1.img:loadTexture(uv0:getImgPath(), LOADTEXT_TYPE)
			uv1.input_edit:setText("")

			if slot0.flag == 0 then
				uv1.input_edit:setPlaceHolder(TI18N("请输入验证码"))
			elseif slot0.flag == 2 or slot0.flag == 3 then
				uv1.input_edit:setPlaceHolder(TI18N("请输入答案"))
			end
		elseif slot0.flag == 1 then
			uv0:OpenVerificationcodeMainWindow(false)
		end
	end)
end

function VerificationcodeMainWindow.openRootWnd(slot0)
	slot0.img:loadTexture(uv0:getImgPath(), LOADTEXT_TYPE)
end

function VerificationcodeMainWindow.DeleteMe(slot0)
	uv0:OpenVerificationcodeMainWindow(false)
end
