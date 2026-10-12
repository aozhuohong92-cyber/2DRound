FunctionIcon = class("FunctionIcon", function ()
	return ccui.Widget:create()
end)
slot0 = GameNet:getInstance()
slot1 = string.format

function FunctionIcon.ctor(slot0, slot1)
	slot0.time_ticket_desc = ""
	slot0.data = slot1

	if slot0.data.config.type == FunctionIconVo.type.right_top_1 or slot0.data.config.type == FunctionIconVo.type.right_top_2 or slot0.data.config.type == FunctionIconVo.type.left_top then
		slot0.scb_path = PathTool.getTargetCSB("mainui/function_icon_left")
	elseif slot0.data.config.type == FunctionIconVo.type.right_bottom_1 or slot0.data.config.type == FunctionIconVo.type.right_bottom_2 then
		slot0.scb_path = PathTool.getTargetCSB("mainui/function_icon_right")
	end

	slot0.root_wnd = createCSBNote(slot0.scb_path)

	slot0:setCascadeOpacityEnabled(true)
	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()
	slot0.width = slot0.size.width
	slot0.height = slot0.size.height

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setTouchEnabled(true)
	slot0:setName(slot1.config.name)

	slot0.container = slot0.root_wnd:getChildByName("main_container")
	slot0.button = slot0.container:getChildByName("button")
	slot0.tishi = slot0.container:getChildByName("tips")

	if slot0.data.config.type == FunctionIconVo.type.right_bottom_1 or slot0.data.config.type == FunctionIconVo.type.right_bottom_2 then
		slot0.num = slot0.container:getChildByName("num")

		slot0.num:setVisible(false)

		if slot0.data.config.id == MainuiConst.icon.mail or slot0.data.config.id == MainuiConst.icon.friend then
			loadSpriteTexture(slot0.tishi, PathTool.getResFrame("mainui", "mainui_1034"), LOADTEXT_TYPE_PLIST)
			slot0.tishi:setPosition(56, 59)
		end
	else
		slot0.name = slot0.container:getChildByName("name")

		UITool.SetTitleColor(slot0.name, 2)
		slot0:setIconName()
	end

	slot0:registerEvent()
	slot0:updateInfo()

	if slot0.data and slot0.data.config then
		if slot0.data.config.id == MainuiConst.icon.seven_login or slot0.data.config.id == MainuiConst.icon.eight_logins then
			slot0:updateSevenLoginInfo()
		elseif slot0.data.config.id == MainuiConst.icon.icon_charge1 or slot0.data.config.id == MainuiConst.icon.icon_charge2 then
			slot0:updateFirstChargeInfo()
		elseif slot0.data.config.id == MainuiConst.icon.year_monster then
			ActionyearmonsterController:getInstance():sender28223()
			ActionyearmonsterController:getInstance():sender28224()
			ActionyearmonsterController:getInstance():sender28200()
		elseif slot0.data.config.id == MainuiConst.icon.arena_many_people then
			ArenaManyPeopleController:getInstance():sender29000()
			ArenaManyPeopleController:getInstance():sender29003()
			ArenaManyPeopleController:getInstance():sender29028()
		end
	end
end

function FunctionIcon.updateInfo(slot0)
	slot0:updateTishiState()
	slot0:updateIconRes()
	slot0:setIconName()

	if slot0.data and slot0.data.config and (slot0.data.config.id == MainuiConst.icon.icon_charge1 or slot0.data.config.id == MainuiConst.icon.icon_charge2) then
		slot0:updateFirstChargeInfo()
	end

	if slot0.data and slot0.data.config and slot0.data.config.id == MainuiConst.icon.personal_gift then
		FestivalActionController:getInstance():sender26301()
	end
end

function FunctionIcon.updateIconRes(slot0)
	if slot0.data ~= nil and slot0.data.config ~= nil then
		if slot0.data.config.res_type == 1 then
			if slot0.data.real_res_id == "" then
				slot1 = slot0.data.res_id
			end

			if PathTool.getFunctionRes(slot1) ~= slot0.res_id then
				slot0.res_id = slot2

				loadSpriteTexture(slot0.button, slot0.res_id, LOADTEXT_TYPE)
			end
		elseif slot0.data.config.id == MainuiConst.icon.first_charge then
			if PathTool.getFunctionRes(slot0.data.res_id) ~= slot0.res_id then
				slot0.res_id = slot1

				loadSpriteTexture(slot0.button, slot0.res_id, LOADTEXT_TYPE)
			end

			slot0.button:setVisible(false)

			if slot0.icon_first_effect == nil then
				slot0.icon_first_effect = createEffectSpine(slot0.data.config.icon_effect, nil, nil, true, nil, nil, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

				slot0.icon_first_effect:setAnchorPoint(cc.p(0.5, 0.5))
				slot0.icon_first_effect:setVisible(false)
				slot0.icon_first_effect:setPosition(slot0.button:getContentSize().width * 0.5, slot0.button:getContentSize().height * 0.5 + 15)
				slot0.container:addChild(slot0.icon_first_effect, -1)
			end

			slot2 = false

			for slot6 = 1, 6 do
				if ActionController:getInstance():getModel():getFirstBtnStatus(slot6) and slot7 == 1 then
					slot2 = true

					break
				end
			end

			slot0.tishi:setVisible(slot2)

			if RoleController:getInstance():getRoleVo().vip_exp / 10 >= 100 then
				if slot2 == true then
					if slot0.icon_first_effect then
						slot0.icon_first_effect:setVisible(true)
					end

					slot0.button:setVisible(false)
				else
					if slot0.icon_first_effect then
						slot0.icon_first_effect:setVisible(false)
					end

					slot0.button:setVisible(true)
				end
			elseif slot0.icon_first_effect then
				slot0.icon_first_effect:setVisible(true)
			end
		elseif slot0.data.config.id == MainuiConst.icon.personal_gift then
			if slot0.icon_gift_effect == nil then
				slot0.icon_gift_effect = createEffectSpine(slot0.data.config.icon_effect, nil, nil, true, nil, nil, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

				slot0.icon_gift_effect:setAnchorPoint(cc.p(0.5, 0.5))
				slot0.icon_gift_effect:setVisible(true)
				slot0.icon_gift_effect:setPosition(slot0.button:getContentSize().width * 0.5, -10)
				slot0.button:addChild(slot0.icon_gift_effect, 1)
			end
		elseif slot0.icon_effect == nil then
			slot0.icon_effect = createEffectSpine(slot0.data.config.icon_effect, nil, nil, true, nil, nil, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

			slot0.icon_effect:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.icon_effect:setVisible(true)
			slot0.icon_effect:setPosition(slot0.button:getContentSize().width * 0.5, slot0.button:getContentSize().height * 0.5)

			if slot0.data.config.icon_effect == "E31327" then
				slot0.icon_effect:setPosition(slot0.button:getContentSize().width * 0.5, slot0.button:getContentSize().height * 0.5)
				slot0.icon_effect:setAnchorPoint(cc.p(0, 0))
				slot0.icon_effect:setScale(1)
			end

			slot0.button:addChild(slot0.icon_effect, 1)
		end
	end
end

function FunctionIcon.updateTime(slot0)
	if slot0.data == nil or slot0.data.config == nil then
		return
	end

	if slot0.data.end_time > 0 then
		slot0:setLessTime()
	else
		slot0:removeTimeLabel()
	end
end

function FunctionIcon.setLessTime(slot0)
	if slot0.data.end_time - uv0:getTime() <= 0 then
		slot0:removeTimeLabel()
	else
		if slot0.time_label == nil then
			slot0.time_label = createLabel(17, 54, nil, slot0.container:getContentSize().width / 2, -8, "", slot0.container, 2, cc.p(0.5, 0.5))

			slot0.time_label:enableOutline(Config.ColorData.data_color4[2], 1)
		end

		slot2 = ""

		if slot0.data.config.id == MainuiConst.icon.champion then
			if slot0.data.status == 1 then
				slot2 = uv1(TI18N("%s后开启"), TimeTool.GetTimeForFunction(slot1))
			elseif slot0.data.status == 2 then
				slot2 = uv1(TI18N("进行中:%s"), TimeTool.GetTimeForFunction(slot1))
			end
		elseif slot0.data.config.id == MainuiConst.icon.godbattle then
			if slot0.data.status == 1 then
				slot2 = uv1(TI18N("报名中:%s"), TimeTool.GetTimeForFunction(slot1))
			elseif slot0.data.status == 2 then
				slot2 = uv1(TI18N("进行中:%s"), TimeTool.GetTimeForFunction(slot1))
			end
		elseif slot0.data.config.id == MainuiConst.icon.guildwar then
			if slot0.data.status == 1 then
				slot2 = uv1(TI18N("%s后开启"), TimeTool.GetTimeForFunction(slot1))
			elseif slot0.data.status == 2 then
				slot2 = uv1(TI18N("%s后结束"), TimeTool.GetTimeForFunction(slot1))
			end
		else
			slot2 = TimeTool.GetTimeForFunction(slot1)
		end

		slot0:setBaseTimeInfo(slot2)
	end
end

function FunctionIcon.setBaseTimeInfo(slot0, slot1)
	if slot0.time_ticket_desc ~= slot1 then
		slot0.time_ticket_desc = slot1

		slot0.time_label:setString(slot1)
	end
end

function FunctionIcon.removeTimeLabel(slot0)
	if slot0.time_label and not tolua.isnull(slot0.time_label) then
		slot0.time_label:removeFromParent()

		slot0.time_label = nil
	end
end

function FunctionIcon.updateTishiState(slot0)
	if tolua.isnull(slot0.tishi) or slot0.data == nil then
		return
	end

	slot0.tishi:setVisible(slot0.data:getTipsStatus())

	if slot0.data.config.id == MainuiConst.icon.friend or slot0.data.config.id == MainuiConst.icon.mail then
		if slot0.data:getTipsNum() > 0 and slot0.num ~= nil then
			slot0.num:setString(slot2)
			slot0.num:setVisible(true)
		else
			slot0.num:setVisible(false)
		end
	end
end

function FunctionIcon.getData(slot0)
	return slot0.data
end

function FunctionIcon.getIconRedStatus(slot0)
	if slot0.data then
		return slot0.data:getTipsStatus()
	else
		return false
	end
end

function FunctionIcon.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if not uv0.is_show_unfold_ani and uv0.data ~= nil and uv0.data.config ~= nil then
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound()
				MainuiController:getInstance():iconClickHandle(uv0.data.config.id, slot0, uv0.data.action_id)
			end
		end
	end)

	if slot0.data ~= nil then
		if slot0.update_by_self_event == nil then
			slot0.update_by_self_event = slot0.data:Bind(FunctionIconVo.UPDATE_SELF_EVENT, function (slot0)
				if slot0 == nil then
					uv0:updateInfo()
				elseif slot0 == "res_id" then
					uv0:updateIconRes()
				elseif slot0 == "tips_status" then
					uv0:updateTishiState()
					MainuiController:getInstance():updateIconRedStatus()
				end
			end)
		end

		if (slot0.data.id == MainuiConst.icon.seven_login or slot0.data.id == MainuiConst.icon.eight_login) and slot0.seven_login_status_event == nil then
			slot0.seven_login_status_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_SEVEN_LOGIN_STATUS, function ()
				uv0:updateSevenLoginInfo()
			end)
		end
	end

	slot0:registerScriptHandler(function (slot0)
		if slot0 == "exit" and uv0.data then
			if uv0.update_by_self_event ~= nil then
				uv0.data:UnBind(uv0.update_by_self_event)

				uv0.update_by_self_event = nil
			end

			uv0.data = nil
		end
	end)
end

function FunctionIcon.setIconName(slot0)
	if tolua.isnull(slot0.name) or slot0.data == nil or slot0.data.config == nil then
		return
	end

	if slot0.data.real_name and slot0.data.real_name ~= "" and slot0.data.real_name ~= "null" then
		slot0.name:setString(slot0.data.real_name)
	else
		slot0.name:setString(slot0.data.config.icon_name)
	end
end

function FunctionIcon.updateSevenLoginInfo(slot0)
	if ActionController:getInstance():getModel():getMaxSevenDay() == nil or slot1.day == nil then
		return
	end

	slot3 = nil

	if (ActionController:getInstance():getModel():getSevenDayType() ~= 1 or Config.LoginDaysNewData.data_day[slot1.day]) and Config.LoginDaysData.data_day[slot1.day] then
		slot4 = ""
		slot4 = (slot1.status ~= 3 or slot3.next_desc) and slot3.day_desc

		if slot0.extend_label == nil then
			slot0.extend_label = createLabel(20, 1, 163, slot0.container:getContentSize().width / 2, -12, "", slot0.container, 2, cc.p(0.5, 0.5))
		end

		slot0.extend_label:setString(slot4)
	end
end

function FunctionIcon.updateFirstChargeInfo(slot0)
	if slot0.data == nil then
		return
	end

	slot1 = slot0.data.status

	if slot0.extend_label == nil then
		slot0.extend_label = createLabel(20, 1, 163, slot0.container:getContentSize().width / 2, -12, "", slot0.container, 2, cc.p(0.5, 0.5))
	end

	if slot1 == 0 then
		slot0.extend_label:setString(TI18N("明日可领"))
	elseif slot1 == 1 then
		slot0.extend_label:setString(TI18N("可领取"))
	end
end

function FunctionIcon.setIsShowUnfoldAni(slot0, slot1)
	slot0.is_show_unfold_ani = slot1
end

function FunctionIcon.DeleteMe(slot0)
	slot0.root_wnd:stopAllActions()

	if slot0.data ~= nil then
		if slot0.update_by_self_event ~= nil then
			slot0.data:UnBind(slot0.update_by_self_event)

			slot0.update_by_self_event = nil
		end

		slot0.data = nil
	end

	if slot0.seven_login_status_event then
		GlobalEvent:getInstance():UnBind(slot0.seven_login_status_event)

		slot0.seven_login_status_event = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
