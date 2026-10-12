slot1 = MonopolyController:getInstance():getModel()
MonopolyDialogWindow = MonopolyDialogWindow or BaseClass(BaseView)

function MonopolyDialogWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.is_full_screen = true
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "monopoly/monopoly_dialog_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("monopoly", "monopolyboard"),
			type = ResourcesType.plist
		}
	}
	slot0.is_send_proto = false
	slot0.is_can_close = false
	slot0.cur_con_index = 0
	slot0.chose_object_list = {}
end

function MonopolyDialogWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:setOpacity(180)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.shadow = slot0.container:getChildByName("shadow")

	slot0.shadow:setScale(display.getMaxScale())
	slot0.container:getChildByName("continue_txt"):setString(TI18N("点击继续"))

	slot0.image_bg = slot0.container:getChildByName("image_bg")
	slot0.draw_sp = slot0.container:getChildByName("draw_sp")
	slot0.draw_pos_x, slot0.draw_pos_y = slot0.draw_sp:getPosition()
	slot0.draw_name_txt = slot0.container:getChildByName("draw_name_txt")
	slot0.skip_btn = slot0.container:getChildByName("skip_btn")
	slot0.dialog_txt = createRichLabel(26, 274, cc.p(0.5, 1), cc.p(360, 275), 5, nil, 620)

	slot0.container:addChild(slot0.dialog_txt)
end

function MonopolyDialogWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.skip_btn, handler(slot0, slot0.onClickSkipBtn), true)
	registerButtonEventListener(slot0.image_bg, handler(slot0, slot0.onClickContinueBtn), false)
end

function MonopolyDialogWindow.onClickCloseBtn(slot0)
	if slot0.is_can_close then
		uv0:openMonopolyDialogWindow(false)
	else
		slot0:onClickContinueBtn()
	end
end

function MonopolyDialogWindow.onClickSkipBtn(slot0)
	slot0:showNextContent(true)
end

function MonopolyDialogWindow.onClickContinueBtn(slot0)
	if not slot0.is_show_answer or slot0.is_show_answer ~= 1 then
		slot0:showNextContent(false, true)
	end
end

function MonopolyDialogWindow.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.cur_evt_type = slot1 or MonopolyConst.Event_Type.Dialog
	slot0.step_id = slot2

	if slot3 and next(slot3) ~= nil then
		slot0:setData(slot3)
	elseif uv0:getRandomDialogByEvtAndStep(slot1, slot2) and next(slot4) ~= nil then
		slot0:setData(slot4)
	else
		slot0.is_can_close = true
	end
end

function MonopolyDialogWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0:showNextContent()
end

function MonopolyDialogWindow.showNextContent(slot0, slot1, slot2)
	if not slot0.data then
		return
	end

	if slot1 then
		slot3 = false

		for slot7, slot8 in ipairs(slot0.data.dialogue) do
			if slot8[2] == 1 then
				slot3 = true
				slot0.cur_con_index = slot7

				break
			end
		end

		if not slot3 then
			uv0:openMonopolyDialogWindow(false)

			return
		end
	else
		slot0.cur_con_index = slot0.cur_con_index + 1
	end

	if slot0.data.dialogue[slot0.cur_con_index] then
		slot8 = slot3[5] or ""
		slot0.is_show_answer = slot3[2] or 0

		slot0.draw_name_txt:setString(slot3[1] or "")
		slot0.shadow:setVisible((slot3[3] or 0) == 1)

		if (slot3[4] or "") and slot7 ~= "" then
			slot12 = PathTool.getPlistImgForDownLoad("herodraw/herodrawres", slot7, false)

			if not slot0.cur_bust_res or slot0.cur_bust_res ~= slot12 then
				slot0.cur_bust_res = slot12
				slot0.bust_res_load = loadSpriteTextureFromCDN(slot0.draw_sp, slot12, ResourcesType.single, slot0.bust_res_load)

				slot0.draw_sp:setScale((slot3[8] or 100) / 100)
				slot0.draw_sp:setPosition(slot0.draw_pos_x + (slot3[6] or 0), slot0.draw_pos_y + (slot3[7] or 0))
			end

			slot0.draw_sp:setVisible(true)
		else
			slot0.draw_sp:setVisible(false)
		end

		slot0.dialog_txt:setString(slot8)

		if slot5 == 1 then
			slot0:updateChoseItmeList(true, slot0.data.answer)
		else
			slot0:updateChoseItmeList(false)
		end

		if slot0.cur_con_index == #slot0.data.dialogue and slot5 ~= 1 then
			slot0.is_can_close = true

			slot0.skip_btn:setVisible(false)
		else
			slot0.is_can_close = false
		end
	else
		slot0.is_can_close = true

		if slot0.is_show_answer == 1 or slot2 then
			uv0:openMonopolyDialogWindow(false)
		end
	end
end

function MonopolyDialogWindow.updateChoseItmeList(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.chose_object_list) do
		if slot7.dialog_bg then
			slot7.dialog_bg:setVisible(false)
		end
	end

	if slot1 == false then
		return
	end

	if not slot2 or type(slot2[1]) ~= "table" then
		return
	end

	if #slot2 > 0 then
		slot0.shadow:setVisible(true)
	end

	slot5 = 740 + (slot3 - 1) * 100 * 0.5

	for slot9, slot10 in ipairs(slot2) do
		if not slot0.chose_object_list[slot9] then
			slot11 = slot0:createDialogObject()
			slot0.chose_object_list[slot9] = slot11

			registerButtonEventListener(slot11.dialog_bg, function ()
				uv0:onClickChoseItem(uv1)
			end, true)
		end

		slot11.num = slot10[1]

		slot11.dialog_bg:setPositionY(slot5 - (slot9 - 1) * slot4)
		slot11.dialog_txt:setString(slot10[2] or "")
	end
end

function MonopolyDialogWindow.createDialogObject(slot0)
	slot1 = {
		dialog_bg = createImage(slot0.container, PathTool.getResFrame("monopoly", "monopolyboard_1011", false, "monopolyboard"), 360, 0, cc.p(0.5, 0.5), true, 1, true)
	}

	slot1.dialog_bg:setContentSize(cc.size(412, 62))
	slot1.dialog_bg:setTouchEnabled(true)

	slot1.dialog_txt = createLabel(26, 274, nil, 206, 31, "", slot1.dialog_bg, nil, cc.p(0.5, 0.5))

	return slot1
end

function MonopolyDialogWindow.onClickChoseItem(slot0, slot1)
	if slot0.chose_object_list[slot1] and slot0.data then
		if slot0.cur_evt_type == MonopolyConst.Event_Type.Dialog then
			uv0:sender27404({
				{
					type = 5,
					arg1 = slot0.data.id,
					arg2 = slot2.num or 1
				}
			})

			slot0.is_send_proto = true
		elseif slot0.cur_evt_type == MonopolyConst.Event_Type.Flag then
			uv0:sender27404({
				{
					arg2 = 0,
					type = 6,
					arg1 = slot2.num
				}
			})

			slot0.is_send_proto = true
		elseif slot0.cur_evt_type == 99 then
			uv0:sender27407(slot0.data.type, slot2.num or 1)

			slot0.is_send_proto = true
		elseif slot0.cur_evt_type == 88 then
			PlanesController:getInstance():sender23104(slot0.step_id, 1, {
				{
					val2 = 0,
					type = PlanesConst.Proto_23104._5,
					val1 = slot2.num or 1
				}
			})
		elseif slot0.cur_evt_type == 80 then
			ActionyearmonsterController:getInstance():sender28203(slot0.step_id, 1, {})
		end

		slot0:showNextContent()
	end
end

function MonopolyDialogWindow.close_callback(slot0)
	if not slot0.is_send_proto and slot0.data then
		if slot0.cur_evt_type == MonopolyConst.Event_Type.Dialog then
			uv0:sender27404({
				{
					arg2 = 1,
					type = 5,
					arg1 = slot0.data.id
				}
			})
		elseif slot0.cur_evt_type == MonopolyConst.Event_Type.Flag then
			uv0:sender27404({
				{
					arg1 = 1,
					arg2 = 0,
					type = 6
				}
			})
		elseif slot0.cur_evt_type == 99 then
			uv0:sender27407(slot0.data.type, 1)
		elseif slot0.cur_evt_type == 88 then
			PlanesController:getInstance():sender23104(slot0.step_id, 1, {
				{
					val2 = 0,
					val1 = 1,
					type = PlanesConst.Proto_23104._5
				}
			})
		elseif slot0.cur_evt_type == 80 then
			ActionyearmonsterController:getInstance():sender28203(slot0.step_id, 1, {})
		end
	end

	if slot0.bust_res_load then
		slot0.bust_res_load:DeleteMe()

		slot0.bust_res_load = nil
	end

	doStopAllActions(slot0.container)
	uv0:openMonopolyDialogWindow(false)
end
