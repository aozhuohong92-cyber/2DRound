ElitematchDeclarationPanel = ElitematchDeclarationPanel or BaseClass(BaseView)
slot0 = ElitematchController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function ElitematchDeclarationPanel.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "elitematch/elitematch_declaration_panel"
	slot0.res_list = {}
	slot0.msg_type = slot1 or ElitematchConst.MsgType.eElitematch
	slot0.default_content_msg = TI18N("无宣言")
	slot0.label_content_list = {}
	slot0.spine_list = {}
	slot0.content_str_list = {}
	slot0.form_name_list = {
		"elitematch_1",
		"elitematch_2",
		"elitematch_3"
	}
	slot0.form_index_list = {}

	for slot5, slot6 in pairs(slot0.form_name_list) do
		slot0.form_index_list[slot6] = slot5
	end

	slot0.face_ui_y_list = {
		640,
		560,
		480
	}
	slot0.mask_face_count = {}
end

function ElitematchDeclarationPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("宣言设置"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot1 = {
		TI18N("战斗前:"),
		TI18N("战斗胜利:"),
		TI18N("战斗失败:")
	}
	slot0.pos_y_list = {
		398,
		307,
		210
	}

	if slot0.msg_type == ElitematchConst.MsgType.eYearMonster then
		slot1 = {
			TI18N("主动发送:"),
			TI18N("表情回应:"),
			TI18N("烟花回应:")
		}

		slot0.title:setString(TI18N("表情互动"))
	end

	slot0.face_btn_list = {}

	for slot5 = 1, 3 do
		slot0.main_container:getChildByName("key_" .. slot5):setString(slot1[slot5])

		slot0.face_btn_list[slot5] = slot0.main_container:getChildByName("face_btn_" .. slot5)
		slot0.label_content_list[slot5] = slot0:addEditContent(1, 170, slot0.pos_y_list[slot5] + 10)
	end

	slot0.main_container:getChildByName("tips"):setVisible(false)

	slot0.left_btn = slot0.main_container:getChildByName("left_btn")
	slot3 = TI18N("取 消")

	if slot0.msg_type == ElitematchConst.MsgType.eYearMonster then
		slot3 = TI18N("发 送")
	end

	slot0.left_btn:getChildByName("label"):setString(slot3)

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("保 存"))
end

function ElitematchDeclarationPanel.addEditContent(slot0, slot1, slot2, slot3)
	slot4 = PathTool.getResFrame("common", "common_99998")
	slot5 = createRichLabel(24, Config.ColorData.data_color4[151], cc.p(0, 1), cc.p(slot2, slot3), 6, nil, 450)

	slot5:setString(slot0.default_content_msg)
	slot0.main_container:addChild(slot5)

	return slot5
end

function ElitematchDeclarationPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickBtnLeft), true, 1)

	slot4 = handler(slot0, slot0.onClickBtnRight)
	slot5 = true

	registerButtonEventListener(slot0.right_btn, slot4, slot5, 1)

	for slot4, slot5 in ipairs(slot0.face_btn_list) do
		registerButtonEventListener(slot5, function ()
			uv0:onShowFaceIndex(uv1, uv2)
		end, true, 1)
	end

	slot0:addGlobalEvent(ElitematchEvent.Elite_Declaration_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
	slot0:addGlobalEvent(ActionyearmonsterEvent.Year_Face_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
	slot0:addGlobalEvent(ElitematchEvent.Elite_Declaration_Face_Event, function (slot0, slot1)
		if not slot0 then
			return
		end

		if not slot1 then
			return
		end

		uv0.content_str_list[slot0] = slot1.id

		uv0:setLabelContent(slot0, slot1)
	end)
end

function ElitematchDeclarationPanel.onClickBtnRight(slot0)
	slot1 = {}

	if slot0.msg_type == ElitematchConst.MsgType.eYearMonster then
		for slot5, slot6 in pairs(slot0.content_str_list) do
			uv0(slot1, {
				order = slot5,
				face_id = slot6
			})
		end

		ActionyearmonsterController:getInstance():sender28219(slot1)
	else
		for slot5, slot6 in pairs(slot0.content_str_list) do
			uv0(slot1, {
				order = slot5,
				manifesto_id = slot6
			})
		end

		uv1:sender24946(slot1)
	end

	slot0:onClickBtnClose()
end

function ElitematchDeclarationPanel.onShowFaceIndex(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	uv0:openChooseFacePanel(true, slot1, slot0.content_str_list[slot1] or 0, slot2:convertToWorldSpace(cc.p(0.5, 0)), slot0.msg_type)
end

function ElitematchDeclarationPanel.onClickBtnLeft(slot0)
	if slot0.content_str_list and slot0.content_str_list[1] then
		GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.Year_Send_Face_Event, slot0.content_str_list[1])
	end

	slot0:onClickBtnClose()
end

function ElitematchDeclarationPanel.onClickBtnClose(slot0)
	uv0:openElitematchDeclarationPanel(false)
end

function ElitematchDeclarationPanel.openRootWnd(slot0)
	if slot0.msg_type == ElitematchConst.MsgType.eYearMonster then
		ActionyearmonsterController:getInstance():sender28220()
	else
		uv0:sender24945()
	end
end

function ElitematchDeclarationPanel.setData(slot0, slot1)
	if slot0.msg_type == ElitematchConst.MsgType.eYearMonster then
		if slot1.face and #slot1.face <= 0 then
			if Config.HolidayNianData.data_const.holiday_nian_default_face then
				for slot6, slot7 in ipairs(slot2.val) do
					if slot0.label_content_list[slot7[1]] then
						slot0.content_str_list[slot7[1]] = slot7[2]

						if slot7[2] ~= 0 then
							slot0:setLabelContent(slot7[1], Config.ArenaEliteData.data_face[slot7[2]])
						end
					end
				end
			end
		else
			for slot5, slot6 in ipairs(slot1.face) do
				if slot0.label_content_list[slot6.order] then
					slot0.content_str_list[slot6.order] = slot6.face_id

					if slot6.face_id ~= 0 then
						slot0:setLabelContent(slot6.order, Config.ArenaEliteData.data_face[slot6.face_id])
					end
				end
			end
		end
	else
		for slot5, slot6 in ipairs(slot1.manifesto) do
			if slot0.label_content_list[slot6.order] then
				slot0.content_str_list[slot6.order] = slot6.manifesto_id

				if slot6.manifesto_id ~= 0 then
					slot0:setLabelContent(slot6.order, Config.ArenaEliteData.data_face[slot6.manifesto_id])
				end
			end
		end
	end
end

function ElitematchDeclarationPanel.setLabelContent(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	slot3 = nil

	slot0.label_content_list[slot1]:setString((slot0.msg_type ~= ElitematchConst.MsgType.eYearMonster or uv0("<div fontcolor=#643223>[%s]</div>", slot2.text or TI18N("恭喜发财"))) and uv0("<div fontcolor=#643223>[%s]</div>", slot2.name))
	slot0.label_content_list[slot1]:setPositionX(255)
	slot0:showSpine(true, slot1, slot2)
end

function ElitematchDeclarationPanel.showSpine(slot0, slot1, slot2, slot3)
	if not slot2 then
		return
	end

	if slot1 == false then
		if slot0.spine_list[slot2] then
			slot0.spine_list[slot2]:clearTracks()
			slot0.spine_list[slot2]:removeFromParent()

			slot0.spine_list[slot2] = nil
		end
	else
		if not slot3 then
			return
		end

		if not slot0.pos_y_list[slot2] then
			return
		end

		slot0:showSpine(false, slot2)

		slot0.spine_list[slot2] = createEffectSpine(slot3.msg, cc.p(215, slot0.pos_y_list[slot2]), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.spine_list[slot2]:setScale(0.6)
		slot0.main_container:addChild(slot0.spine_list[slot2], 1)
	end
end

function ElitematchDeclarationPanel.close_callback(slot0)
	uv0:openElitematchDeclarationPanel(false)
end
