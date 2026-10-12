ChatInput = ChatInput or class("ChatInput", function ()
	return ccui.Widget:create()
end)

function ChatInput.ctor(slot0, slot1, slot2)
	slot0.from_name = slot1 or "chatPanel"
	slot0.ctrl = ChatController:getInstance()
	slot0.default_msg = slot2 or TI18N("请输入，长按玩家头像可快捷@人")
	slot0.input_model = 1

	slot0:initView()
	slot0:initCtrl()
end

function ChatInput.initView(slot0)
	slot1 = 62
	slot2 = cc.size(287, slot1)
	slot3 = cc.size(287, slot1)

	if slot0.from_name == "chatPanel" then
		slot2 = cc.size(331, 60)
		slot3 = cc.size(498, 62)
	elseif slot0.from_name == "chatWindow" or slot0.from_name == ChatConst.ChatInputType.eArenateam then
		slot2 = cc.size(331, 60)
		slot3 = cc.size(412, 62)
	end

	slot0.model_btn = CustomButton.New(slot0, PathTool.getResFrame("mainui", "mainui_chat_sound_icon"), nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.model_btn:setAnchorPoint(0.5, 0.5)
	slot0.model_btn:setPosition(cc.p(-26, 12))
	slot0.model_btn:setVisible(IS_SHOW_VOICE)

	slot0.edit_box = createEditBox(slot0, PathTool.getResFrame("mainui", "mainui_chat_input_bg"), slot2, nil, 22, cc.c4b(122, 96, 65, 255), 20, slot0.default_msg, nil, nil, LOADTEXT_TYPE_PLIST, nil, nil)

	slot0.edit_box:setAnchorPoint(cc.p(0, 0))
	slot0.edit_box:setPlaceholderFontColor(ChatConst.MianInputColor)
	slot0.edit_box:setFontColor(Config.ColorData.data_color4[66])
	slot0.edit_box:setPosition(18, -18)
	slot0.edit_box:setMaxLength(40)

	slot0.voice_btn = CustomButton.New(slot0, PathTool.getResFrame("mainui", "mainui_chat_btn_1"), nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.voice_btn:setAnchorPoint(0.5, 0.5)
	slot0.voice_btn:setPosition(cc.p(16 + slot3.width / 2, slot3.height / 2 - 20))
	slot0.voice_btn:setSize(slot3)
	slot0.voice_btn:setRichText(string.format("<div fontcolor=#023656 >%s</div>", TI18N("长按输入语音")), 24)
	slot0.voice_btn:setVisible(false)

	slot0.link_btn = CustomButton.New(slot0.edit_box, PathTool.getResFrame("mainui", "mainui_chat_face_icon"), nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.link_btn:setAnchorPoint(0.5, 0.5)
	slot0.link_btn:setPosition(cc.p(slot0.edit_box:getPositionX() + slot2.width + 24, slot2.height / 2))
end

function ChatInput.changeInputModel(slot0)
	if IS_IOS_PLATFORM == true then
		return
	end

	if slot0.input_model == 1 then
		slot0.input_model = 2
		slot1 = PathTool.getResFrame("mainui", "mainui_chat_keybord_icon")

		slot0.model_btn:loadTextures(PathTool.getResFrame("mainui", "mainui_chat_keybord_icon"), "", "", LOADTEXT_TYPE_PLIST)
	else
		slot0.input_model = 1

		slot0.model_btn:loadTextures(PathTool.getResFrame("mainui", "mainui_chat_sound_icon"), "", "", LOADTEXT_TYPE_PLIST)
	end

	slot0.link_btn:setVisible(slot0.input_model == 1)
	slot0.edit_box:setVisible(slot0.input_model == 1)
	slot0.voice_btn:setVisible(slot0.input_model == 2)
end

function ChatInput.initCtrl(slot0)
	slot0.voice_btn:addTouchEventListener(function (slot0, slot1)
		if IS_IOS_PLATFORM == true then
			-- Nothing
		elseif uv0.voice_func then
			uv0.voice_func(slot0, slot1)
		end
	end)
	slot0.model_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:changeInputModel()
		end
	end)
	slot0.link_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			RefController:getInstance():openView(uv0.from_name, {
				world_pos = uv0.link_btn.layout:convertToWorldSpace(cc.p(0, 0)),
				offset_y = 78
			}, uv0.chat_channel)
		end
	end)
end

function ChatInput.showVoice(slot0, slot1)
	slot0.model_btn:setVisible(not slot1)
	slot0.edit_box:setVisible(not slot1)
	slot0.link_btn:setVisible(not slot1)
end

function ChatInput.setInputFunc(slot0, slot1)
	slot0.input_func = slot1
end

function ChatInput.setVoiceFunc(slot0, slot1)
	slot0.voice_func = slot1
end

function ChatInput.getInputText(slot0)
	return slot0.edit_box:getText(), slot0.extend
end

function ChatInput.setInputText(slot0, slot1, slot2)
	slot0.extend = slot2

	if slot0.edit_box then
		slot0.edit_box:setText(slot1 or "")
	end
end

function ChatInput.isNothing(slot0)
	if slot0.edit_box:getText() == "" or slot1 == slot0.default_msg then
		return true
	end
end

function ChatInput.setChatChannel(slot0, slot1)
	slot0.chat_channel = slot1
end
