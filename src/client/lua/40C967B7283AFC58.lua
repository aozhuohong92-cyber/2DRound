CertifyBindPhoneWindow = CertifyBindPhoneWindow or BaseClass(BaseView)
slot0 = WelfareController:getInstance()

function CertifyBindPhoneWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "welfare/certify_bind_phone_window"
end

function CertifyBindPhoneWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("title_container"):getChildByName("title_label"):setString(TI18N("手机号绑定"))
	slot1:getChildByName("txt1"):setString(TI18N("手机号："))
	slot1:getChildByName("txt2"):setString(TI18N("验证码："))

	slot0.ok_btn = slot1:getChildByName("ok_btn")

	slot0.ok_btn:getChildByName("label"):setString(TI18N("确定"))

	slot0.send_btn = slot1:getChildByName("send_btn")
	slot0.send_btn_label = slot0.send_btn:getChildByName("label")

	slot0.send_btn_label:setString(TI18N("发送验证码"))

	slot0.phone_box = createEditBox(slot1, PathTool.getResFrame("mainui", "mainui_chat_input_bg"), cc.size(423, 50), Config.ColorData.data_color4[66], 20, Config.ColorData.data_color3[151], 20, TI18N("请输入手机号"), cc.p(196, 249), 11, LOADTEXT_TYPE_PLIST, cc.EDITBOX_INPUT_MODE_PHONENUMBER)

	slot0.phone_box:setAnchorPoint(cc.p(0, 0.5))

	slot0.certify_box = createEditBox(slot1, PathTool.getResFrame("mainui", "mainui_chat_input_bg"), cc.size(240, 50), Config.ColorData.data_color4[66], 20, Config.ColorData.data_color3[151], 20, TI18N(""), cc.p(196, 162), 11, LOADTEXT_TYPE_PLIST)

	slot0.certify_box:setAnchorPoint(cc.p(0, 0.5))
end

function CertifyBindPhoneWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		WelfareController:getInstance():openCertifyBindPhoneWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.ok_btn, function ()
		uv0:sendBindPhone()
	end, true, 1)
	registerButtonEventListener(slot0.send_btn, function ()
		uv0:requestCertifyNumber()
	end, true, 1)
	slot0:addGlobalEvent(WelfareEvent.UpdateBindPhoneStatus, function (slot0)
		uv0:updateBindStatus(slot0)
	end)
end

function CertifyBindPhoneWindow.openRootWnd(slot0)
end

function CertifyBindPhoneWindow.requestCertifyNumber(slot0)
	if slot0.phone_box:getText() == "" or string.len(slot1) ~= 11 then
		message(TI18N("请输入正确的手机号码!"))

		return
	end

	WelfareController:getInstance():requestBindPhone(slot1, "")
end

function CertifyBindPhoneWindow.updateBindStatus(slot0, slot1)
	if slot1 and slot1.status == 2 then
		slot0.count_down_time = 60

		slot0.send_btn:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.send_btn)
		slot0:clearEneTime()
		slot0:countDownEndTime()

		slot0.timeticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:countDownEndTime()
		end, 1)
	end
end

function CertifyBindPhoneWindow.countDownEndTime(slot0)
	slot0.count_down_time = slot0.count_down_time - 1

	if slot0.count_down_time == 0 then
		slot0.send_btn_label:setString(TI18N("发送验证码"))
		slot0.send_btn:setTouchEnabled(true)
		setChildUnEnabled(false, slot0.send_btn)
		slot0:clearEneTime()

		return
	end

	slot0.send_btn_label:setString(TI18N("发送中..") .. slot0.count_down_time)
end

function CertifyBindPhoneWindow.clearEneTime(slot0)
	if slot0.timeticket then
		GlobalTimeTicket:getInstance():remove(slot0.timeticket)

		slot0.timeticket = nil
	end
end

function CertifyBindPhoneWindow.sendBindPhone(slot0)
	if slot0.phone_box:getText() == "" or string.len(slot1) ~= 11 then
		message(TI18N("请输入正确的手机号码!"))

		return
	end

	if slot0.certify_box:getText() == "" then
		message(TI18N("验证码不能为空!"))
	end

	WelfareController:getInstance():requestBindPhone(slot1, slot2)
end

function CertifyBindPhoneWindow.close_callback(slot0)
	slot0:clearEneTime()
	WelfareController:getInstance():openCertifyBindPhoneWindow(false)
end
