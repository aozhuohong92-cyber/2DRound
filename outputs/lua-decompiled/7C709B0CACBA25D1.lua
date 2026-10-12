RoleMessageBoardReplyPanel = RoleMessageBoardReplyPanel or BaseClass(BaseView)
slot0 = RoleController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort
slot4 = string.len
slot5 = string.find
slot6 = string.sub

function RoleMessageBoardReplyPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "roleinfo/role_message_board_reply_panel"
	slot0.res_list = {}
	slot1 = 48

	if Config.RoomGrowData.data_const.bbs_writing_number then
		slot1 = slot2.val
	end

	slot0.limit_sad_count = slot1
	slot0.default_content_msg = TI18N("回复:")
	slot0.content_str = ""
end

function RoleMessageBoardReplyPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("留言回复"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.label_content = createRichLabel(22, Config.ColorData.data_color4[151], cc.p(0, 1), cc.p(52, 344), 6, nil, 580)

	slot0.label_content:setString(slot0.default_content_msg)
	slot0.main_container:addChild(slot0.label_content)

	slot0.edit_content = createEditBox(slot0.main_container, PathTool.getResFrame("common", "common_99998"), cc.size(580, 200), nil, 22, nil, 22, "", nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.edit_content:setAnchorPoint(cc.p(0, 1))
	slot0.edit_content:setPlaceholderFontColor(Config.ColorData.data_color4[63])
	slot0.edit_content:setFontColor(Config.ColorData.data_color4[66])
	slot0.edit_content:setPosition(cc.p(52, 344))
	slot0.edit_content:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0.begin_change_label then
				uv0.begin_change_label = false

				uv0.label_content:setVisible(true)
				slot1:setText("")

				if slot1:getText() ~= "" then
					uv0:setLabelContent(slot2)
				else
					uv0.label_content:setString(uv0.default_content_msg)
				end
			end
		elseif slot0 == "began" then
			if not uv0.begin_change_label then
				uv0.label_content:setVisible(false)

				uv0.begin_change_label = true
			end

			if uv0.content_str ~= nil and uv0.content_str ~= "" then
				slot1:setText(uv0.content_str)
			end
		elseif slot0 == "changed" then
			-- Nothing
		end
	end)

	slot0.limit_count = slot0.main_container:getChildByName("limit_count")

	slot0.limit_count:setString(uv0(TI18N("限制%s字以内"), slot0.limit_sad_count))

	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("回 复"))

	slot0.face_btn = slot0.main_container:getChildByName("face_btn")

	slot0.face_btn:getChildByName("label"):setString(TI18N("添加表情"))
end

function RoleMessageBoardReplyPanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.comfirm_btn, handler(slot0, slot0.onClickBtnComfirm), true, 1)
	registerButtonEventListener(slot0.face_btn, handler(slot0, slot0.onClickBtnFace), true, 1)
	slot0:addGlobalEvent(EventId.CHAT_SELECT_FACE, function (slot0, slot1)
		if slot1 and slot1 == ChatConst.ChatInputType.eMessageBoardReplyPanel then
			if uv0.content_str == nil then
				uv0.content_str = ""
			end

			uv0.content_str = uv0.content_str .. slot0

			uv0:setLabelContent(uv0.content_str)
			GlobalEvent:getInstance():Fire(ChatEvent.FACE_COUNT_EVENT, WordCensor:getInstance():relapceFaceIconTag(uv0.content_str)[1] or 0)
		end
	end)
	slot0:addGlobalEvent(RoleEvent.ROLE_MESSAGE_BOARD_REPLY_EVENT, function (slot0)
		if slot0.result == TRUE then
			uv0:onClickBtnClose()
		end
	end)
end

function RoleMessageBoardReplyPanel.setLabelContent(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.limit_sad_count < StringUtil.SubStringGetTotalIndex(slot1) then
		slot1 = StringUtil.SubStringUTF8(slot1, 1, slot0.limit_sad_count)
	end

	slot0.content_str = slot1

	slot0.label_content:setString(slot1)
end

function RoleMessageBoardReplyPanel.onClickBtnComfirm(slot0)
	if not slot0.rid or not slot0.srv_id or not slot0.bbs_id then
		return
	end

	if slot0.content_str == nil or slot0.content_str == "" then
		message(TI18N("请输入回复内容"))

		return
	end

	uv0:send25836(slot0.rid, slot0.srv_id, slot0.bbs_id, slot0.content_str)
end

function RoleMessageBoardReplyPanel.onClickBtnClose(slot0)
	uv0:openRoleMessageBoardReplyPanel(false)
end

function RoleMessageBoardReplyPanel.onClickBtnFace(slot0)
	RefController:getInstance():openView(ChatConst.ChatInputType.eMessageBoardReplyPanel, {
		world_pos = slot0.face_btn:convertToWorldSpace(cc.p(0, 0)),
		offset_y = -328
	}, ChatConst.Channel.Province)
end

function RoleMessageBoardReplyPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.rid = slot2.rid
	slot0.srv_id = slot2.srv_id
	slot0.bbs_id = slot2.bbs_id
	slot0.default_content_msg = uv0(TI18N("回复%s:"), slot2.name or "玩家")

	if slot0.label_content then
		slot0.label_content:setString(slot0.default_content_msg)
	end
end

function RoleMessageBoardReplyPanel.close_callback(slot0)
	uv0:openRoleMessageBoardReplyPanel(false)
end
