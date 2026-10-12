RoleAttestationWindow = RoleAttestationWindow or BaseClass(BaseView)

function RoleAttestationWindow.__init(slot0, slot1)
	slot0.ctrl = slot1
	slot0.model = slot0.ctrl:getModel()
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.layout_name = "roleinfo/role_attestation_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_attestation"),
			type = ResourcesType.single
		}
	}
end

function RoleAttestationWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("实名认证"))

	slot0.name_input = slot1:getChildByName("name_input")

	slot0.name_input:setPlaceHolder("姓名")

	slot0.id_input = slot1:getChildByName("id_input")

	slot0.id_input:setPlaceHolder("身份证号")

	function slot3(slot0, slot1)
		if slot1 == ccui.TextFiledEventType.attach_with_ime then
			slot0:setString("")
		elseif slot1 == ccui.TextFiledEventType.detach_with_ime then
			-- Nothing
		elseif slot1 == ccui.TextFiledEventType.insert_text then
			-- Nothing
		elseif slot1 == ccui.TextFiledEventType.delete_backward then
			-- Nothing
		end
	end

	slot0.name_input:addEventListener(slot3)
	slot0.id_input:addEventListener(slot3)

	slot0.close_btn = slot1:getChildByName("close_btn")

	slot0.close_btn:setVisible(false)

	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot0.confirm_btn_label = slot0.confirm_btn:getChildByName("label")

	slot0.confirm_btn_label:setString("认证")

	slot0.txt_tips = slot1:getChildByName("txt_tips")

	slot0.txt_tips:setString("")

	slot0.tips_label = createRichLabel(22, cc.c3b(104, 69, 42), cc.p(0, 0), cc.p(38, 520), 10, nil, 600)

	slot0.tips_label:setString("根据国家新闻出版署《关于防止未成年人沉迷网络游戏的通知》，需要实名认证后才能游戏哦。")

	slot0.tips_label2 = createRichLabel(22, cc.c3b(104, 69, 42), cc.p(0, 0), cc.p(38, 410), 10, nil, 600)

	slot0.tips_label2:setString("您填写的信息仅用于游戏实名认证，不会用于其他任何用途，我们将严格保障您的个人信息安全。")
	slot1:addChild(slot0.tips_label)
	slot1:addChild(slot0.tips_label2)
	LoginController:getInstance():getModel():SetIdCardStatus(2)
end

function RoleAttestationWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.confirm_btn, handler(slot0, slot0._onClickBtnConfirm), true)
	slot0:addGlobalEvent(RoleEvent.ROLE_NAME_AUTHENTIC, function (slot0)
		if slot0 then
			uv0.confirm_status = slot0.code

			if slot0.code == 0 then
				uv0.confirm_btn_label:setString(TI18N("领取奖励"))
			else
				uv0.confirm_btn_label:setString(TI18N("已领取"))
			end
		end
	end)
end

function RoleAttestationWindow._onClickBtnClose(slot0)
	slot0.ctrl:openRoleAttestationWindow(false)
end

function RoleAttestationWindow.urlEncode(slot0, slot1)
	return string.gsub(string.gsub(slot1, "([^%w%.%- ])", function (slot0)
		return string.format("%%%02X", string.byte(slot0))
	end), " ", "+")
end

function RoleAttestationWindow._onClickBtnConfirm(slot0)
	playButtonSound2()

	slot2 = string.trim(slot0.id_input:getString())

	if not slot0:CheckName(slot0.name_input:getString()) then
		message("名字只包含：数字、字母、中文")

		return
	end

	slot1 = slot0:urlEncode(slot1)

	if verifyID(slot2) == 1 then
		message("身份证号长度不对")

		return
	elseif slot3 == 2 then
		message("身份证号格式有问题")

		return
	elseif slot3 == 3 then
		message("身份证号地址编码不对")

		return
	elseif slot3 == 4 then
		message("身份证号出生日期不对")

		return
	elseif slot3 == 5 then
		message("身份证号校验错误")

		return
	end

	if tonumber(os.date("%Y")) - tonumber(slot2:sub(7, 14):sub(1, 4)) < 18 then
		message("身份证年龄小于18岁！")

		return
	end

	slot0:confirm_sdk_idcard()
end

function RoleAttestationWindow.confirm_sdk_idcard(slot0)
	slot4 = cc.XMLHttpRequest:new()
	slot4.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING

	slot4:open("POST", string.format("http://211.154.26.201:81/index.php/userlogin/ageverify?username=%s&agestatus=%s", LoginController:getInstance():getModel():getLoginData().usrName, 1))
	slot4:registerScriptHandler(function ()
		if uv0.readyState == 4 and uv0.status >= 200 and uv0.status < 207 then
			jsonObjret = loadstring("return " .. uv0.response)()
			ret = jsonObjret or {}

			if ret.msg == "200" then
				message("认证成功")
				uv1.ctrl:openRoleAttestationWindow(false)
				LoginController:getInstance():getModel():SetIdCardStatus(1)
			else
				uv1.txt_tips:setString("认证失败")
				message(ret.msg)
				LoginController:getInstance():getModel():SetIdCardStatus(2)
			end
		end
	end)
	slot4:send(body)
end

function RoleAttestationWindow.close_callback(slot0)
	if slot0.tips_label then
		slot0.tips_label:DeleteMe()

		slot0.tips_label = nil
	end

	slot0.ctrl:openRoleAttestationWindow(false)
end

function RoleAttestationWindow.CheckName(slot0, slot1)
	slot2 = {}

	for slot6 = 1, #slot1 do
		if not string.byte(slot1, slot6) then
			break
		end

		if slot7 >= 48 and slot7 <= 57 or slot7 >= 65 and slot7 <= 90 or slot7 >= 97 and slot7 <= 122 then
			slot2[#slot2 + 1] = string.char(slot7)
		elseif slot7 >= 228 and slot7 <= 233 then
			slot9 = string.byte(slot1, slot6 + 2)

			if string.byte(slot1, slot6 + 1) and slot9 then
				slot10 = 128
				slot11 = 191
				slot12 = 128
				slot13 = 191

				if slot7 == 228 then
					slot10 = 184
				elseif slot7 == 233 then
					slot13 = slot8 ~= 190 and 191 or 165
					slot11 = 190
				end

				if slot10 <= slot8 and slot8 <= slot11 and slot9 <= slot13 then
					slot6 = slot6 + 2
					slot2[#slot2 + 1] = string.char(slot7, slot8, slot9)
				end
			end
		end
	end

	if #slot2 > 0 then
		for slot7, slot8 in pairs(slot2) do
			slot3 = 0 + #slot8
		end

		if #slot1 == slot3 then
			return true
		else
			return false
		end
	else
		return false
	end
end
