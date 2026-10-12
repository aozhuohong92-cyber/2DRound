EncounterWindow = EncounterWindow or BaseClass(BaseView)
slot1 = EncounterController:getInstance():getModel()
slot2 = table.insert

function EncounterWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = true
	slot0.layout_name = "encounter/encounter_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("encounter", "encounter"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_89", true),
			type = ResourcesType.single
		}
	}
	slot0.cur_id = nil
	slot0.cur_desc_index = 1
	slot0.max_index = 1
	slot0.cur_select_index = 1
	slot0.is_show_btn = true
	slot0.is_show_answer = false
	slot0.is_finish = false
	slot0.is_have_answer = true
	slot0.btn_list = {}
	slot0.sub_tab_array = {}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function EncounterWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.main_view = slot0.main_panel:getChildByName("container")
	slot0.info_panel = slot0.main_view:getChildByName("info_panel")
	slot0.bg = slot0.info_panel:getChildByName("bg")
	slot0.role_img = slot0.info_panel:getChildByName("role_img")
	slot0.back_bg = slot0.info_panel:getChildByName("back_bg")

	slot0.back_bg:setOpacity(0)

	slot0.answer_container = slot0.info_panel:getChildByName("answer_container")

	slot0.answer_container:setVisible(false)

	slot0.next_btn = slot0.info_panel:getChildByName("next_btn")
	slot0.next_btn_arr = slot0.next_btn:getChildByName("btn")
	slot0.next_btn_lab = slot0.next_btn:getChildByName("label")
	slot0.skip_btn = slot0.info_panel:getChildByName("skip_btn")
	slot0.tips_button = slot0.main_panel:getChildByName("tips_button")
	slot0.name_bg = slot0.info_panel:getChildByName("name_bg")
	slot0.role_name = slot0.name_bg:getChildByName("name_lab")
	slot0.close_tips = slot0.main_panel:getChildByName("close_tips")

	slot0.close_tips:setVisible(false)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.win_title = slot0.main_panel:getChildByName("win_title")
	slot0.Image_2 = slot0.main_panel:getChildByName("Image_2")

	slot0.win_title:setString(TI18N("英雄物语"))

	slot0.not_tips = slot0.main_view:getChildByName("not_tips")

	slot0.not_tips:setVisible(false)
	commonShowEmptyIcon(slot0.not_tips, false)

	slot0.tips_lab = createRichLabel(22, 175, cc.p(0.5, 1), cc.p(309.5, 280), 10, nil, 400)

	slot0.not_tips:addChild(slot0.tips_lab)
	slot0.tips_lab:setString(TI18N("     暂时没有新的物语\n点击" .. "<div fontcolor=289b14 href=detial>前往</div>" .. "查看物语图鉴"))
	slot0.tips_lab:addTouchLinkListener(function (slot0, slot1)
		if slot0 == "href" and slot1 == "detial" then
			uv0:send27102()
			uv0:openEncounterWindow(false)
			uv0:openEncounterLibraryWindow(true)
		end
	end, {
		"href"
	})

	slot0.tab_container = slot0.main_panel:getChildByName("tab_container")

	slot0.tab_container:setVisible(false)
end

function EncounterWindow._onClickSubTabBtn(slot0, slot1)
	if uv0:isFinishByid(slot1) == true then
		slot0.cur_desc_index = 1
		slot0.cur_id = slot1

		slot0:updateInfo()
	else
		message(TI18N("暂未获得此物语"))
	end
end

function EncounterWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		if uv0.is_show_btn == false and uv0.cur_desc_index ~= uv0.max_index then
			message(TI18N("请选择答案"))

			return
		end

		if uv0.max_index < uv0.cur_desc_index + 1 then
			if uv0.is_finish == false then
				uv1:send27101()
			end

			uv1:openEncounterWindow(false)

			return
		end

		uv0.cur_desc_index = uv0.cur_desc_index + 1

		uv0:updateInfo()
	end, nil, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		if uv0.is_finish == false and uv0.cur_id and uv0.cur_desc_index == uv0.max_index then
			uv1:send27101()
		end

		uv1:openEncounterWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.info_panel, function ()
		if uv0.is_show_btn == false and uv0.cur_desc_index ~= uv0.max_index then
			message(TI18N("请选择答案"))

			return
		end

		if uv0.max_index < uv0.cur_desc_index + 1 then
			if uv0.is_finish == false then
				uv1:send27101()
			end

			uv1:openEncounterWindow(false)

			return
		end

		uv0.cur_desc_index = uv0.cur_desc_index + 1

		uv0:updateInfo()
	end, false, 1)
	registerButtonEventListener(slot0.skip_btn, function ()
		if uv0.is_finish == false then
			CommonAlert.show(TI18N("是否跳过对话领取奖励"), TI18N("确定"), function ()
				uv0:send27101()
				uv0:openEncounterWindow(false)
			end, TI18N("取消"))

			return
		end

		CommonAlert.show(TI18N("是否跳过对话"), TI18N("确定"), function ()
			uv0:openEncounterWindow(false)
		end, TI18N("取消"))
	end, true, 1)

	if slot0.tips_button then
		slot0.tips_button:addTouchEventListener(function (slot0, slot1)
			if ccui.TouchEventType.ended == slot1 then
				playButtonSound()

				if Config.EncounterData.data_encounter_const.rules then
					TipsManager:getInstance():showCommonTips(slot2.desc, slot0:getTouchBeganPosition(), nil, , 500)
				end
			end
		end)
	end
end

function EncounterWindow.updateInfo(slot0)
	if not slot0.cur_id then
		slot0.info_panel:setVisible(false)
		commonShowEmptyIcon(slot0.not_tips, true, {
			text = "",
			pos = cc.p(309.5, 360)
		})
		slot0.not_tips:setVisible(true)

		return
	end

	if not Config.EncounterData.data_encounter_info[slot0.cur_id] then
		return
	end

	if slot0.is_have_answer == true and slot1.answer and slot1.answer[1] and slot1.answer[1] == 0 then
		slot0.is_have_answer = false
	end

	if not slot1.dialogue[slot0.cur_desc_index] then
		return
	end

	slot0.max_index = #slot1.dialogue

	if slot2[1] == "" then
		slot0.role_name:setString(slot0.role_vo.name)
	else
		slot0.role_name:setString(slot2[1])
	end

	slot3 = cc.FadeOut:create(0.2)

	if slot2[3] == 1 then
		slot3 = cc.FadeIn:create(0.2)

		slot0.name_bg:setPosition(140, 187)
	else
		slot0.name_bg:setPosition(477.5, 187)
	end

	doStopAllActions(slot0.back_bg)
	slot0.back_bg:runAction(slot3)

	if not slot0.desc_name then
		slot0.desc_name = createRichLabel(22, cc.c3b(65, 32, 23), cc.p(0, 1), cc.p(40, 150), 5, 0, 540)

		slot0.info_panel:addChild(slot0.desc_name)
	end

	if slot2[4] ~= slot0.cur_hero_id then
		slot0.cur_hero_id = slot2[4]
		slot4 = PathTool.getPartnerBustRes(slot2[4])

		if slot0.bust_load then
			slot0.bust_load:DeleteMe()
		end

		slot0.bust_load = nil

		if not slot0.bust_load then
			slot0.bust_load = createResourcesLoad(slot4, ResourcesType.single, function ()
				if uv0.role_img then
					doStopAllActions(uv0.role_img)
					uv0.role_img:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.CallFunc:create(function ()
						if uv0.role_img then
							uv0.role_img:loadTexture(uv1, LOADTEXT_TYPE)
						end
					end), cc.FadeIn:create(0.2)))
				end
			end, slot0.bust_load)
		end
	end

	if slot0.btn_list then
		for slot7, slot8 in ipairs(slot0.btn_list) do
			if slot8 then
				slot8:getRoot():setVisible(false)
			end
		end
	end

	if slot2[2] == 1 then
		slot0.is_show_btn = false

		for slot9 = 1, #slot1.answer do
			if not slot0.btn_list[slot9] then
				slot10 = createButton(slot0.answer_container, "", 0, 0, cc.size(333, 48), PathTool.getResFrame("encounter", "encounter_1004"), 22, Config.ColorData.data_color4[175], PathTool.getResFrame("encounter", "encounter_1004"))

				slot10:setCapInsets(cc.rect(18, 20, 1, 1))
				slot10:getRoot():setVisible(false)

				slot10.answer = createLabel(22, cc.c3b(64, 32, 23), nil, 166.5, 24, "", slot10:getRoot(), nil, cc.p(0.5, 0.5))
				slot10.index = slot9
				slot0.btn_list[slot9] = slot10
			end

			if slot0.btn_list[slot9] then
				slot10:getRoot():setVisible(true)
				slot10.answer:setString(slot1.answer[slot9][2])
				slot10:setPosition(slot0.answer_container:getContentSize().width / 2, slot0.answer_container:getContentSize().height - (slot4.height + 40) * slot9)

				if slot10 then
					slot10:addTouchEventListener(function (slot0, slot1)
						if slot1 == ccui.TouchEventType.ended then
							uv0.cur_select_index = uv1.index

							if uv0.is_finish == false then
								uv2:send27104(uv0.cur_select_index)
							end

							if uv0.max_index < uv0.cur_desc_index + 1 then
								uv2:openEncounterWindow(false)

								return
							end

							uv0.cur_desc_index = uv0.cur_desc_index + 1

							uv0:updateInfo()
						end
					end, true)
				end
			end
		end

		slot0.is_show_answer = true
	else
		slot0.is_show_answer = false

		slot0.answer_container:setVisible(false)
	end

	slot0.next_btn:setVisible(slot0.is_show_btn)
	slot0.skip_btn:setVisible(slot0.is_show_btn)

	if slot0.cur_desc_index == slot0.max_index then
		slot0.next_btn:setVisible(false)

		if slot0.is_finish == true then
			slot0.close_tips:setVisible(true)
		else
			slot0.next_btn_lab:setString(TI18N("结束并领取奖励"))
			slot0.next_btn:setPosition(490, 37)
			slot0.next_btn_arr:setVisible(false)
		end
	end

	if string.find(slot2[5], "&&") then
		if string.split(slot2[5], "&&") and #slot5 > 0 then
			slot0:showStr(slot5[slot0.cur_select_index])
		end
	else
		slot0:showStr(slot2[5])
	end

	if slot0.is_finish == false then
		uv1:setEncounterPage(slot0.cur_desc_index)
		uv0:send27103(slot0.cur_id, slot0.cur_desc_index)
	end
end

function EncounterWindow.showStr(slot0, slot1)
	doStopAllActions(slot0.info_panel)

	slot2, slot3 = StringUtil.splitStr(slot1)
	slot4 = ""

	for slot8, slot9 in ipairs(slot2) do
		delayRun(slot0.info_panel, 0.05 * slot8, function ()
			uv0 = uv0 .. uv1.char

			uv2.desc_name:setString(uv0)

			if uv2.is_show_answer == true and uv3 >= #uv4 then
				uv2.answer_container:setVisible(true)
			end

			if uv3 >= #uv4 and uv2.is_finish == false and uv2.cur_desc_index == uv2.max_index then
				uv2.next_btn:setVisible(true)
				uv2.next_btn:setOpacity(0)
				uv2.next_btn:setScale(0)
				doStopAllActions(uv2.next_btn)
				uv2.next_btn:runAction(cc.Sequence:create(cc.FadeIn:create(0.2), cc.ScaleTo:create(0.2, 1)))
			end
		end)
	end
end

function EncounterWindow.openRootWnd(slot0, slot1)
	if uv0:getEncounterId() ~= slot1 or slot1 == 0 then
		slot0.is_finish = true
	else
		if uv0:getEncounterPage() == nil or slot3 < 1 then
			slot3 = 1
		end

		slot0.cur_desc_index = slot3
	end

	if slot1 and slot1 > 0 then
		slot0.cur_id = slot1
	else
		slot0.cur_id = nil
	end

	slot0:updateInfo()
end

function EncounterWindow.close_callback(slot0)
	uv0:openEncounterWindow(false)
	doStopAllActions(slot0.info_panel)
	doStopAllActions(slot0.back_bg)
	doStopAllActions(slot0.role_img)
	doStopAllActions(slot0.next_btn)

	if slot0.bust_load then
		slot0.bust_load:DeleteMe()
	end

	slot0.bust_load = nil
end
