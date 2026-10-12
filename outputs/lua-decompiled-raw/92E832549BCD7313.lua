UserPanel = class("UserPanel", function ()
	return ccui.Layout:create()
end)

function UserPanel.ctor(slot0, slot1, slot2)
	slot0.ctrl = slot2
	slot0.model = slot0.ctrl:getModel()
	slot0.data = slot0.model:getLoginData()
	slot0.size = slot1 and slot1:getContentSize() or cc.size(SCREEN_WIDTH, SCREEN_HEIGHT)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:setPosition(slot0.size.width / 2, slot0.size.height / 2)

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("login/user_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width / 2, slot0.size.height / 2)

	slot0.user_name_input = slot0.root_wnd:getChildByName("user_name_input")

	slot0.user_name_input:setMaxLength(99)

	if slot0.data.usrName and slot0.data.usrName ~= "" then
		slot0.user_name_input:setString(slot0.data.usrName)
	else
		slot0.user_name_input:setPlaceHolder(TI18N("请输入账号"))
	end

	slot0.password_input = slot0.root_wnd:getChildByName("password_input")

	slot0.password_input:setMaxLength(99)

	if slot0.data.password and slot0.data.password ~= "" then
		slot0.password_input:setString(slot0.data.password)
	else
		slot0.password_input:setPlaceHolder(TI18N("请输入密码"))
	end

	slot0.btn_login = slot0.root_wnd:getChildByName("btn_login")

	if slot0.btn_login ~= nil then
		slot0.btn_login:setTitleText(TI18N("登陆"))
	end

	slot0.btn_regist = slot0.root_wnd:getChildByName("btn_regist")

	if slot0.btn_regist ~= nil then
		slot0.btn_regist:setTitleText(TI18N("一键注册"))
	end

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

	slot0.user_name_input:addEventListener(slot3)
	slot0.password_input:addEventListener(slot3)
	slot0:registerEvent()
end

function UserPanel.registerEvent(slot0)
	if slot0.btn_login then
		slot0.btn_login:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				slot3 = uv0.password_input:getString()

				if #uv0.user_name_input:getString() < 2 or StringUtil.getStrLen(slot2) > 99 then
					message(TI18N("账户名字不对，必需是2-12位英文与数字组合"))

					return
				end

				if #slot3 < 2 or #slot3 > 32 then
					message(TI18N("密码不对，必需是2-16位字符组合"))

					return
				end

				uv0:denglu()
			end
		end)
	end

	if slot0.btn_regist then
		slot0.btn_regist:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				slot2 = uv0.user_name_input:getString()
				slot3 = uv0.password_input:getString()

				uv0:zuceAccount()
			end
		end)
		sdkPerfer_prize()
	end

	if slot0.btn_mail then
		slot0.btn_mail:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				CommonAlert.show(TI18N("是否打开邮箱绑定"), TI18N("确定"), function ()
					sdkCallFunc("openUrl", "http://211.154.26.201:10010/userLogin")
				end, TI18N("取消"))
			end
		end)
	end
end

function UserPanel.denglu(slot0)
	slot6 = cc.XMLHttpRequest:new()
	slot6.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING

	slot6:open("POST", string.format("http://211.154.26.201:81/index.php/userlogin/userLogins2?username=%s&password=%s&action=%s&acc_idfa=%s", slot0.user_name_input:getString(), slot0.password_input:getString(), "login", getIdFa()))
	slot6:registerScriptHandler(function ()
		if uv0.readyState == 4 and uv0.status >= 200 and uv0.status < 207 then
			jsonObjret = loadstring("return " .. uv0.response)()

			if (jsonObjret or {}).msg == "206" then
				message(TI18N("账号不存在！"))
			elseif slot3 == "207" then
				message(TI18N("密码错误！"))
			elseif slot3 == "208" then
				message(TI18N("请联系客服处理"))
			else
				uv3.model:SetIdCardStatus(1)
				uv3.ctrl:loginPlatformRequest({
					isTourist = false,
					usrName = uv1,
					password = uv2
				})
			end
		end
	end)
	slot6:send()
end

function UserPanel.zuceAccount(slot0)
	slot6 = cc.XMLHttpRequest:new()
	slot6.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING

	slot6:open("POST", string.format("http://211.154.26.201:81/index.php/userlogin/userRegs?username=%s&password=%s&action=%s&acc_idfa=%s", slot0.user_name_input:getString(), slot0.password_input:getString(), "register", getIdFa()))
	slot6:registerScriptHandler(function ()
		if uv0.readyState == 4 and uv0.status >= 200 and uv0.status < 207 then
			slot0 = uv0.response

			print("download_suc   ===>", slot0)

			jsonObjret = loadstring("return " .. slot0)()
			ret = jsonObjret or {}

			if ret.msg == "200" then
				message(TI18N("账号已存在!"))
			elseif slot2 == "201" then
				message(TI18N("注册账号已经到达上限！"))
			elseif slot2 == "202" then
				message(TI18N("ip注册上限已经达到上限！"))
			elseif slot2 == "203" then
				message(TI18N("账户名字不对，必需是6-12位英文与数字组合！"))
			elseif slot2 == "204" then
				message(TI18N("密码不对，必需是6-16位字符组合！"))
			elseif slot2 == "205" then
				message(TI18N("注册成功！"))
			else
				message(TI18N("注册失败!"))
			end
		end
	end)
	slot6:send()
end

function UserPanel.registAccount(slot0)
	slot2 = function (slot0)
		slot1 = slot0

		if StringUtil.getStrLen(math.random(3) % 3 == 0 and slot1 .. string.char(math.random(65, 90)) or math.random(3) % 2 == 0 and slot1 .. string.char(math.random(97, 122)) or slot1 .. string.char(math.random(48, 57))) < 12 then
			slot1 = uv0(slot1)
		end

		return slot1
	end("")
	slot3 = tostring(math.random(100000000000.0, 900000000000.0))

	slot0.user_name_input:setString(slot2)
	slot0.password_input:setString(slot3)
	slot0.ctrl:loginPlatformRequest({
		usrName = slot2,
		password = slot3
	})
end

function UserPanel.update(slot0)
end

function UserPanel.effectHandler(slot0)
end

function UserPanel.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
