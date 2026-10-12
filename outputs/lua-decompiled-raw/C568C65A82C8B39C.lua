RoleSetNameView = RoleSetNameView or BaseClass(BaseView)

function RoleSetNameView.__init(slot0, slot1)
	slot0.ctrl = slot1
	slot0.is_full_screen = false
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "roleinfo/role_setname_view"
	slot0.sex_select = 1
	slot0.name_random = true
	slot0.bind_role = true
	slot0.is_bind_code = nil
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("face", "face"),
			type = ResourcesType.plist
		}
	}
end

function RoleSetNameView.open_callback(slot0)
	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot1 = slot0.root_wnd:getChildByName("backpanel")

	slot1:setOpacity(128)
	slot1:setScale(display.getMaxScale())

	slot2 = slot0.main_panel:getContentSize()
	slot0.boy_btn = slot0.main_panel:getChildByName("boy_btn")

	slot0.boy_btn:setVisible(false)
	slot0.boy_btn:setSelected(false)

	slot0.girl_btn = slot0.main_panel:getChildByName("girl_btn")

	slot0.girl_btn:setVisible(false)
	slot0.girl_btn:setSelected(false)

	slot0.submit_btn = slot0.main_panel:getChildByName("btn_submit")

	slot0.submit_btn:setVisible(false)
	slot0.submit_btn:getChildByName("label"):setString(TI18N("提交"))

	slot0.random_btn = slot0.main_panel:getChildByName("btn_random")

	slot0.random_btn:setVisible(false)
	slot0.random_btn:setLocalZOrder(11)

	slot0.invite_code_edit = createEditBox(slot0.main_panel, PathTool.getResFrame("common", "common_1021"), cc.size(280, 50), cc.c4b(149, 149, 149, 255), 26, cc.c4b(149, 149, 149, 255), 26, TI18N("请输入推荐码 (可不填)"), nil, 12, LOADTEXT_TYPE_PLIST)

	slot0.invite_code_edit:setPosition(437, 477)
	slot0.invite_code_edit:setVisible(false)
	slot0.invite_code_edit:setInputMode(cc.EDITBOX_INPUT_MODE_NUMERIC)
	slot0.invite_code_edit:onEditHandler(function (slot0)
		if slot0.name == "began" then
			uv0.invite_code_edit:setPlaceHolder("")
			uv0.invite_code_edit:setText("")
		end
	end)

	slot0.input_edit = createEditBox(slot0.main_panel, PathTool.getResFrame("common", "common_1021"), cc.size(340, 50), Config.ColorData.data_color3[175], 22, Config.ColorData.data_color3[151], 22, placeholder, nil, 6, LOADTEXT_TYPE_PLIST)

	slot0.input_edit:setVisible(false)
	slot0.input_edit:setText(RoleController:getInstance():getRandomName(slot0.sex_select))

	slot0.name_random = true

	slot0.input_edit:onEditHandler(function (slot0)
		if slot0.name == "began" then
			uv0.temp_name = uv0.input_edit:getText()

			uv0.input_edit:setText("")
		elseif slot0.name == "ended" and uv0.input_edit:getText() ~= uv0.temp_name then
			uv0.name_random = false
		end
	end)

	slot8 = 237
	slot9 = true
	slot10 = {
		374.5,
		554
	}
	slot11 = {
		499.5,
		554
	}
	slot12 = {
		353,
		396.5
	}
	slot13 = {
		346.5,
		621
	}
	slot14 = {
		517,
		622
	}

	if ACCOUNT_HAS_ROLE then
		slot8 = 234
		slot9 = false
		slot10 = {
			288,
			393
		}
		slot11 = {
			448.5,
			393
		}
		slot12 = {
			353,
			307
		}
		slot13 = {
			347,
			491
		}
		slot14 = {
			519,
			493
		}
	end

	slot0.boy_btn:setPosition(cc.p(slot10[1], slot10[2]))
	slot0.girl_btn:setPosition(cc.p(slot11[1], slot11[2]))
	slot0.submit_btn:setPosition(cc.p(slot12[1], slot12[2]))
	slot0.input_edit:setPosition(slot13[1], slot13[2])
	slot0.random_btn:setPosition(cc.p(slot14[1], slot14[2]))
	delayRun(slot0.input_edit, 1.2, function ()
		uv0.input_edit:setVisible(true)
		uv0.submit_btn:setVisible(true)
		uv0.boy_btn:setVisible(true)
		uv0.girl_btn:setVisible(true)
		uv0.random_btn:setVisible(true)
	end)
	slot0:refreshSexBoxStatus()

	slot0.bgSpine = createEffectSpine(PathTool.getEffectRes(slot8), cc.p(360, 640), cc.p(0.5, 0.5), false, PlayerAction.action_1, function ()
		if not tolua.isnull(uv0.bgSpine) then
			uv0.bgSpine:setAnimation(0, PlayerAction.action_2, true)
			uv0.input_edit:setVisible(true)
			uv0.submit_btn:setVisible(true)
			uv0.boy_btn:setVisible(true)
			uv0.girl_btn:setVisible(true)
			uv0.random_btn:setVisible(true)
		end
	end)

	slot0.main_panel:addChild(slot0.bgSpine, -1)
end

function RoleSetNameView.register_event(slot0)
	slot0.boy_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()

			uv0.sex_select = 1

			uv0:refreshSexBoxStatus()

			if uv0.name_random == true then
				uv0.input_edit:setText(RoleController:getInstance():getRandomName(uv0.sex_select))

				uv0.name_random = true
			end
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()

			uv0.sex_select = 2

			uv0:refreshSexBoxStatus()
		end
	end)
	slot0.girl_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()

			uv0.sex_select = 2

			uv0:refreshSexBoxStatus()

			if uv0.name_random == true then
				uv0.input_edit:setText(RoleController:getInstance():getRandomName(uv0.sex_select))

				uv0.name_random = true
			end
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()

			uv0.sex_select = 1

			uv0:refreshSexBoxStatus()
		end
	end)
	slot0:addGlobalEvent(InviteCodeEvent.BindCode_Invite_Event, function (slot0)
		uv0.bind_role = true

		if slot0.code == 1 then
			uv0.is_bind_code = true

			if uv0.input_edit:getText() ~= "" then
				slot1 = string.gsub(uv0.input_edit:getText(), "\n", "")
				slot2 = 1

				if uv0.sex_select == 2 then
					slot2 = 0
				end

				uv0.ctrl:changeRoleName(slot1, slot2)
			elseif uv0.input_edit:getText() == "" then
				message(TI18N("请输入姓名~"))
			end
		end
	end)
	registerButtonEventListener(slot0.submit_btn, function ()
		if uv0.bind_role == false then
			message(TI18N("正在绑定推荐码中~~~"))

			return
		end

		if uv0.invite_code_edit:getText() ~= "" and not uv0.is_bind_code then
			uv0.bind_role = false
			slot0 = string.match(uv0.invite_code_edit:getText(), "%d+")

			if uv0.send_code_ticket == nil then
				uv0.send_code_ticket = GlobalTimeTicket:getInstance():add(function ()
					uv0.bind_role = true

					if uv0.send_code_ticket ~= nil then
						GlobalTimeTicket:getInstance():remove(uv0.send_code_ticket)

						uv0.send_code_ticket = nil
					end
				end, 1)
			end

			InviteCodeController:getInstance():sender19801(tonumber(slot0))
		elseif uv0.input_edit:getText() ~= "" then
			slot0 = string.gsub(uv0.input_edit:getText(), "\n", "")
			slot1 = 1

			if uv0.sex_select == 2 then
				slot1 = 0
			end

			uv0.ctrl:changeRoleName(slot0, slot1)
		elseif uv0.input_edit:getText() == "" then
			message(TI18N("请输入姓名~"))
		end
	end, true, 1)
	slot0.random_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0.input_edit:setText(RoleController:getInstance():getRandomName(uv0.sex_select))

			uv0.name_random = true
		end
	end)
end

function RoleSetNameView.refreshSexBoxStatus(slot0)
	slot0.boy_btn:setSelected(slot0.sex_select == 1)
	slot0.girl_btn:setSelected(slot0.sex_select == 2)
end

function RoleSetNameView.close_callback(slot0)
	if slot0.bgSpine then
		slot0.bgSpine:clearTracks()
		slot0.bgSpine:removeFromParent()

		slot0.bgSpine = nil
	end

	if slot0.send_code_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.send_code_ticket)

		slot0.send_code_ticket = nil
	end

	slot0.input_edit:stopAllActions()
	slot0.invite_code_edit:stopAllActions()
end
