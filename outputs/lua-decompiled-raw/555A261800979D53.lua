ArenateamChatPanel = ArenateamChatPanel or BaseClass(BaseView)
slot1 = ArenateamController:getInstance():getModel()
slot2 = RefController:getInstance()
slot3 = ChatController:getInstance()
slot4 = table.insert
slot5 = table.sort
slot6 = string.format

function ArenateamChatPanel.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arenateam_hall", "arenateam_hall"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "arenateam/arenateam_chat_panel"
	slot0.item_desc_list = {}
	slot0.item_code_list = {}
	slot0.default_msg = TI18N("请输入信息...")
	slot0.time = 0
end

function ArenateamChatPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot2 = createScale9Sprite(PathTool.getResFrame("mainui", "mainui_chat_bottom_bg"), 0, 0, LOADTEXT_TYPE_PLIST, slot0.main_container)
	slot3 = cc.size(680, 75)

	slot2:setContentSize(slot3)
	slot2:setAnchorPoint(0.5, 0)
	slot2:setPosition(cc.p(360, 230))

	slot0.notice_label = createLabel(22, Config.ColorData.data_color4[58], nil, slot3.width / 2, slot3.height / 2, TI18N("该频道下无法发言"), slot2)

	slot0.notice_label:setAnchorPoint(0.5, 0.5)
	slot0.notice_label:setVisible(false)

	slot0.btn_send = CustomButton.New(slot2, PathTool.getResFrame("common", "common_1017"), PathTool.getResFrame("common", "common_1017"), nil, LOADTEXT_TYPE_PLIST)

	slot0.btn_send:setBtnLableColor(Config.ColorData.data_color4[1])
	slot0.btn_send:setSize(cc.size(155, 62))
	slot0.btn_send:setLabelSize(26)
	slot0.btn_send:setPosition(cc.p(590, slot3.height / 2))
	slot0.btn_send:setBtnLabel(TI18N("发送"))
	slot0.btn_send:getLabel():enableOutline(cc.c3b(108, 43, 0), 2)
	slot0.btn_send:setLocalZOrder(4)

	slot0.chat_input = ChatInput.new(ChatConst.ChatInputType.eArenateam, slot0.default_msg)

	slot0.chat_input:setPosition(78, slot3.height / 2 - 12)
	slot0.chat_input:setInputFunc(function ()
		uv0:onSendBtn()
	end)
	slot0.chat_input:setVoiceFunc(function (slot0, slot1)
		uv0:beginRecord(slot0, slot1)
	end)
	slot2:addChild(slot0.chat_input, 5)

	slot0.lay_srollview = slot0.main_container:getChildByName("lay_srollview")
	slot0.scroll = NewCoseList.new(slot0.lay_srollview:getContentSize(), slot0.lay_srollview)

	slot0.scroll:setPosition(cc.p(0, 0))
	slot0.scroll.msg_bg:setPositionY(15)
	slot0.lay_srollview:addChild(slot0.scroll)
end

function ArenateamChatPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClosedBtn()
	end, true, 2)
	handleTouchEnded(slot0.btn_send, function ()
		uv0:onSendBtn()
	end)
	slot0:addGlobalEvent(EventId.CHAT_SELECT_FACE, function (slot0, slot1)
		if slot1 and slot1 == ChatConst.ChatInputType.eArenateam then
			uv0:onEditTextAddFace(slot0)
		end
	end)
	slot0:addGlobalEvent(EventId.CHAT_SELECT_ITEM, function (slot0, slot1)
		if slot1 and slot1 == ChatConst.ChatInputType.eArenateam then
			uv0:onEditTextAddItem(slot0)
		end
	end)
	slot0:addGlobalEvent(EventId.CHAT_UDMSG_WORLD, function (slot0)
		if slot0 and slot0 == ChatConst.Channel.Team or slot0 == ChatConst.Channel.Team_Sys then
			uv0:updateChat()
		end
	end)
end

function ArenateamChatPanel.onClosedBtn(slot0)
	uv0:openArenateamChatPanel(false)
end

function ArenateamChatPanel.onEditTextAddFace(slot0, slot1)
	if not slot0.chat_input then
		return
	end

	if slot0.chat_input:getInputText() == slot0.default_msg then
		slot2 = ""
	end

	slot3 = slot2 .. slot1

	slot0.chat_input:setInputText(slot3)
	GlobalEvent:getInstance():Fire(ChatEvent.FACE_COUNT_EVENT, WordCensor:getInstance():relapceFaceIconTag(slot3)[1] or 0)
end

function ArenateamChatPanel.onEditTextAddItem(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.chat_input:getInputText() == slot0.default_msg then
		slot2 = ""
	end

	if slot2 == "" then
		slot0.item_desc_list = {}
		slot0.item_code_list = {}
	end

	slot4 = slot1.share_id
	slot8 = slot1.code

	if Config.ItemData.data_get_data(slot1.base_id) then
		slot10 = uv0:buildItemMsg(slot3, RoleController:getInstance():getRoleVo().srv_id, slot4, slot1.count)

		if slot0.item_code_list[slot8] then
			slot11 = slot0.item_code_list[slot8]
			slot13 = slot11.desc
			slot2 = string.gsub(slot2, slot11.key, string.format("{%s,%s}", slot4, slot7.name), 1)
		else
			slot2 = slot2 .. slot9
		end

		slot0.item_code_list[slot8] = {
			key = slot9,
			desc = slot10
		}
		slot0.item_desc_list[slot9] = slot10

		slot0.chat_input:setInputText(slot2)
	end
end

function ArenateamChatPanel.onSendBtn(slot0)
	slot1, slot2 = slot0.chat_input:getInputText()

	if slot0.chat_input:isNothing() then
		message(TI18N("请输入聊天信息"))

		return
	end

	if WordCensor:getInstance():relapceFaceIconTag(slot1)[1] > 5 then
		message(TI18N("发言中不能超过5个表情"))

		return
	end

	slot1 = WordCensor:getInstance():relpaceChatTag(slot1)

	if slot0.item_desc_list and next(slot0.item_desc_list) then
		for slot7, slot8 in pairs(slot0.item_desc_list) do
			slot1 = string.gsub(slot1, slot7, slot8, 1)
		end
	end

	if slot0.time == 0 or GameNet:getInstance():getTime() - slot0.time > 1 then
		slot0.time = GameNet:getInstance():getTime()

		if uv0:sendChatMsg(ChatConst.Channel.Team, 0, slot1) then
			slot0:cleatInputText()
		end
	end
end

function ArenateamChatPanel.cleatInputText(slot0)
	slot0.chat_input:setInputText("")

	slot0.item_desc_list = {}
	slot0.item_code_list = {}
end

function ArenateamChatPanel.beginRecord(slot0, slot1, slot2)
	ChatHelp.RecordTouched(slot1, slot2, ChatConst.Channel.Team)
end

function ArenateamChatPanel.openRootWnd(slot0, slot1)
	slot3 = (slot1 or {}).index or ArenateamConst.AddPlayerTabType.eApplyList

	slot0.scroll:createMsg(ChatController:getInstance().stack_list[ChatConst.Channel.Team], 1)
end

function ArenateamChatPanel.updateChat(slot0)
	if slot0.scroll then
		slot0.scroll:SetEnabled(true)
		slot0.scroll:initData(uv0.stack_list[ChatConst.Channel.Team])
		slot0.scroll:updateMsg()
	end
end

function ArenateamChatPanel.close_callback(slot0)
	uv0:setIsChatRedpoint(false)
	uv1:openArenateamChatPanel(false)
end
