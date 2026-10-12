slot1 = ActionController:getInstance():getModel()
ActionTimeCollectWindow = ActionTimeCollectWindow or BaseClass(BaseView)

function ActionTimeCollectWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.is_full_screen = true
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "action/action_time_collect_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actiontimecollect", "actiontimecollect"),
			type = ResourcesType.plist
		}
	}
	slot0.is_can_close = false
	slot0.cur_con_index = 0
	slot0.max_index = 1
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function ActionTimeCollectWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:setOpacity(180)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.skip_btn = slot0.container:getChildByName("skip_btn")

	slot0.skip_btn:setVisible(false)

	slot0.shadow = slot0.container:getChildByName("shadow")

	slot0.shadow:setScale(display.getMaxScale())

	slot0.next_btn = slot0.container:getChildByName("next_btn")
	slot0.continue_sp = slot0.next_btn:getChildByName("continue_sp")
	slot0.continue_txt = slot0.next_btn:getChildByName("continue_txt")

	slot0.continue_txt:setString(TI18N("点击继续"))

	slot0.image_bg = slot0.container:getChildByName("image_bg")
	slot0.draw_sp = slot0.container:getChildByName("draw_sp")
	slot0.draw_pos_x, slot0.draw_pos_y = slot0.draw_sp:getPosition()
	slot0.name_title_sp = slot0.container:getChildByName("name_title_sp")
	slot0.draw_name_txt = slot0.name_title_sp:getChildByName("draw_name_txt")
	slot0.dialog_txt = createRichLabel(24, 274, cc.p(0, 1), cc.p(55, 275), 5, nil, 620)

	slot0.container:addChild(slot0.dialog_txt)
end

function ActionTimeCollectWindow.register_event(slot0)
	registerButtonEventListener(slot0.image_bg, handler(slot0, slot0.onClickContinueBtn), false)
	registerButtonEventListener(slot0.skip_btn, handler(slot0, slot0.onClickSkipBtn), true, 1)
end

function ActionTimeCollectWindow.onClickSkipBtn(slot0)
	uv0:openActionTimeCollectWindow(false)
end

function ActionTimeCollectWindow.onClickContinueBtn(slot0)
	if slot0.is_can_close == true then
		if slot0.cur_evt_type == 80 then
			-- Nothing
		elseif slot0.cur_id then
			uv0:send16698(slot0.cur_id)
		end

		uv0:openActionTimeCollectWindow(false)
	else
		slot0:showNextContent()
	end
end

function ActionTimeCollectWindow.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.cur_evt_type = slot1
	slot0.step_id = slot2

	if slot0.cur_evt_type == 80 then
		slot0.skip_btn:setVisible(true)

		if slot3 then
			slot0.config_info = slot3
		end
	else
		slot0.skip_btn:setVisible(false)

		if uv0:getActionTimeCollectData() then
			slot0.action_id = slot4.camp_id
			slot0.cur_id = slot4.id
		end

		if Config.HolidayTimeAwardData.data_dialog[slot0.action_id] and slot5[slot0.cur_id] then
			slot0.config_info = slot6
		end
	end

	slot0:showNextContent()
end

function ActionTimeCollectWindow.showNextContent(slot0)
	if not slot0.config_info then
		slot0.is_can_close = true

		uv0:openActionTimeCollectWindow(false)

		return
	end

	slot0.cur_con_index = slot0.cur_con_index + 1
	slot0.max_index = #slot0.config_info.dialogue

	if slot0.config_info.dialogue[slot0.cur_con_index] then
		slot3 = slot1[2] or 0
		slot4 = slot1[3] or ""
		slot5 = slot1[4] or ""
		slot6 = slot1[5] or 0
		slot7 = slot1[6] or 0
		slot8 = slot1[7] or 100

		if (slot1[1] or "") == "" and slot0.role_vo then
			slot0.draw_name_txt:setString(slot0.role_vo.name)
		else
			slot0.draw_name_txt:setString(slot2)
		end

		slot0.shadow:setVisible(slot3 == 1)

		if slot4 and slot4 ~= "" then
			slot9 = PathTool.getPlistImgForDownLoad("herodraw/herodrawres", slot4, false)

			if not slot0.cur_bust_res or slot0.cur_bust_res ~= slot9 then
				slot0.cur_bust_res = slot9
				slot0.bust_res_load = loadSpriteTextureFromCDN(slot0.draw_sp, slot9, ResourcesType.single, slot0.bust_res_load)

				slot0.draw_sp:setScale(slot8 / 100)
				slot0.draw_sp:setPosition(slot0.draw_pos_x + slot6, slot0.draw_pos_y + slot7)
			end

			slot0.draw_sp:setVisible(true)
		end

		if slot3 == 1 then
			slot0.name_title_sp:setPosition(170, 320.85)
		else
			slot0.name_title_sp:setPosition(540, 320.85)
		end

		if slot0.cur_con_index == slot0.max_index then
			slot0.next_btn:setVisible(false)

			slot0.is_can_close = true

			if slot0.cur_evt_type == 80 then
				slot0.continue_txt:setString(TI18N("点击结束"))
			else
				slot0.continue_txt:setString(TI18N("结束并领取奖励"))
				slot0.continue_txt:setPosition(86, 12.45)
				slot0.continue_sp:setVisible(false)
			end
		else
			slot0.is_can_close = false
		end

		slot0:showStr(slot5)
	else
		slot0.is_can_close = true

		uv0:openActionTimeCollectWindow(false)
	end
end

function ActionTimeCollectWindow.showStr(slot0, slot1)
	doStopAllActions(slot0.container)

	slot2, slot3 = StringUtil.splitStr(slot1)
	slot4 = ""

	for slot8, slot9 in ipairs(slot2) do
		delayRun(slot0.container, 0.05 * slot8, function ()
			uv0 = uv0 .. uv1.char

			uv2.dialog_txt:setString(uv0)

			if uv3 >= #uv4 and uv2.cur_con_index == uv2.max_index then
				uv2.next_btn:setVisible(true)
				uv2.next_btn:setOpacity(0)
				uv2.next_btn:setScale(0)
				doStopAllActions(uv2.next_btn)
				uv2.next_btn:runAction(cc.Sequence:create(cc.FadeIn:create(0.2), cc.ScaleTo:create(0.2, 1)))
			end
		end)
	end
end

function ActionTimeCollectWindow.close_callback(slot0)
	if slot0.bust_res_load then
		slot0.bust_res_load:DeleteMe()

		slot0.bust_res_load = nil
	end

	doStopAllActions(slot0.next_btn)
	doStopAllActions(slot0.container)
	uv0:openActionTimeCollectWindow(false)
end
