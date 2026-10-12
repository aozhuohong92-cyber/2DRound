MainChatUiMsg = class("MainChatUiMsg", function ()
	return ccui.Layout:create()
end)

function MainChatUiMsg.ctor(slot0, slot1, slot2, slot3, slot4)
	slot0.view_width = slot1 or 421
	slot0.view_height = slot2 or 36
	slot0.max_width = slot3
	slot0.channel = slot4
	slot0._font_size = 22

	slot0:setAnchorPoint(cc.p(0, 1))
	slot0:setContentSize(cc.size(slot0.view_width, slot0.view_height))

	slot0.content = createRichLabel(slot0._font_size, Config.ColorData.data_color4[1], cc.p(0, 1), cc.p(70, 29), 10, -1, slot3 - 10)

	slot0:addChild(slot0.content)
	slot0.content:addTouchLinkListener(function (slot0, slot1, slot2, slot3, slot4)
		if slot0 == "href" then
			if slot1 == "sound" then
				uv0:playVoice()
			else
				ChatHelp.OnChatTouched("href", slot1, slot2, uv0.dataObj)
			end

			return
		end

		if slot0 == "click" and slot1 == "name" and uv0.dataObj then
			if uv0.dataObj.rid == RoleController:getInstance():getRoleVo().rid and uv0.dataObj.srv_id == slot5.srv_id then
				message(TI18N("这是你自己~"))

				return
			end

			FriendController:getInstance():openFriendCheckPanel(true, {
				flag = "mainchatmsg",
				srv_id = uv0.dataObj.srv_id,
				rid = uv0.dataObj.rid
			})

			return
		end

		if slot1 ~= "" and slot1 ~= "name" and slot1 ~= "sound" then
			ChatHelp.OnChatTouched("click", slot1, slot2, uv0.dataObj)

			return
		end

		if slot4 then
			if (uv0.dataObj.channel or uv0.channel) == ChatConst.Channel.Friend then
				if uv0.dataObj.flag == 2 then
					ChatController:getInstance():openChatPanel(slot5, "friend", uv0.dataObj)
				else
					ChatController:getInstance():openChatPanel(slot5, "friend", {
						rid = uv0.dataObj.other_rid,
						srv_id = uv0.dataObj.other_srv_id
					})
				end
			elseif slot5 ~= ChatConst.Channel.Drama then
				ChatController:getInstance():openChatPanel(slot5)
			end
		end
	end, {
		"click",
		"sound",
		"href"
	})
	slot0:registerScriptHandler(function (slot0)
		if slot0 == "exit" then
			uv0:setVoiceListener(false)
			uv0:setVoicePlayListener(false)
		end
	end)
end

function MainChatUiMsg.setData(slot0, slot1)
	slot0.dataObj = slot1

	if ChatMgr:getInstance():analyseTeamHelp(slot1) then
		slot0.dataObj = slot2

		return
	end

	slot0:setVoiceListener(false)
	slot0:setVoicePlayListener(false)

	slot3 = ""
	slot4, slot5, slot6, slot7, slot8 = nil
	slot5 = (slot0.channel ~= ChatConst.Channel.Friend or (slot1.flag ~= 2 or ChatConst.MainFriendMsgColor[2]) and ChatConst.MainFriendMsgColor[1]) and (slot1.channel ~= ChatConst.Channel.Drama or slot1.name ~= nil and slot1.name ~= "" or Config.ColorData.data_color4[241]) and ChatConst.MainMsgColor[slot1.channel] or cc.c3b(255, 250, 118)

	if slot1.len == 1 then
		slot9, slot10 = nil
		slot7, slot6 = VoiceMgr:getInstance():splitVoice(slot1.msg)

		if slot1.rid == RoleController:getInstance():getRoleVo().rid and slot1.srv_id == slot11.srv_id then
			slot10 = true
		end

		slot12, slot13 = VoiceMgr:getInstance():getMsg(slot1.msg)

		slot0:setVoicePlayListener(true)

		slot3 = "<div fontColor=" .. c3bToStr(slot5) .. ">" .. TI18N("发来一段语音") .. "</div>" .. string.format("<div href=sound>%s</div>", TI18N("点击收听")) .. string.format("<img src='%s' scale=1 />", PathTool.getResFrame("mainui", "mainui_record_3")) .. "<div click='sound'>" .. slot6 .. "\" " .. "</div>"
		slot0.voiceUrl = slot1.msg
	else
		str = "<div fontColor=" .. c3bToStr(slot5) .. ">" .. slot1.msg .. "</div>"
		slot3 = str
		slot0.voiceUrl = nil
	end

	slot9 = ""

	if slot1.channel and slot0.channel ~= ChatConst.Channel.Friend then
		slot9 = string.format("<img src='%s' scale=1 />", PathTool.getResFrame("mainui", "txt_cn_chat_icon_" .. ChatConst.ChannelRes[slot1.channel]))
	end

	slot10 = ""

	if slot1.ext_list then
		for slot14, slot15 in pairs(slot1.ext_list) do
			if slot15.type == 3 then
				if Config.HonorData.data_title[slot15.val] then
					slot10 = string.format("<img src='%s' scale=1.0 />", PathTool.getTargetRes("title", "txt_cn_title_" .. slot16.res_id, false, false))
				end

				break
			end
		end
	end

	slot11 = ""

	if slot1.sex and slot1.sex < 2 and slot1.channel ~= ChatConst.Channel.Notice and slot1.channel ~= ChatConst.Channel.NoticeTop and slot1.channel ~= ChatConst.Channel.System and slot1.channel ~= ChatConst.Channel.SystemTop and slot1.channel ~= ChatConst.Channel.Gang_Sys then
		slot11 = string.format("<img src='%s' scale=0.7 />", PathTool.getResFrame("common", "common_sex" .. slot1.sex))
	end

	slot12 = ""

	if slot1.name ~= "" then
		slot13 = slot1.channel or slot0.channel
		slot14 = ChatConst.MainNameColor[slot13] or "#ffa76"
		slot12 = (slot13 ~= ChatConst.Channel.Drama or string.format("<div fontcolor=%s >%s</div> ", slot14, "[" .. transformNameByServ(slot1.name, slot1.srv_id) .. "]")) and (not slot1.vip_lev or slot1.vip_lev <= 0 or string.format("<div fontcolor=%s click='name'>%s</div> ", slot14, "[" .. string.format("<img src='%s' scale=1 />", PathTool.getResFrame("mainui", "mainui_vip")) .. transformNameByServ(slot1.name, slot1.srv_id) .. "]")) and string.format("<div fontcolor=%s click='name'>%s</div> ", slot14, "[" .. transformNameByServ(slot1.name, slot1.srv_id) .. "]")
	end

	slot3 = slot9 .. slot10 .. slot11 .. slot12 .. slot3

	slot0.content:setString(slot3)

	slot0.msg = slot3
	slot14 = slot0.content:getSize().height

	slot0.content:setPosition(cc.p(5, 29))
	slot0:removePlayEffect()
end

function MainChatUiMsg.getItemRealSize(slot0)
	slot1 = slot0.content:getContentSize()

	return cc.size(slot1.width, slot1.height + 5)
end

function MainChatUiMsg.setVoiceListener(slot0, slot1)
	if slot1 then
		if not slot0.voice_evt then
			slot0.voice_evt = GlobalEvent:getInstance():Bind(VoiceMgr.NewMsg, function (slot0, slot1)
				if uv0.onTranslateEnd then
					uv0:onTranslateEnd(slot0, slot1)
				end
			end)
		end
	elseif slot0.voice_evt then
		GlobalEvent:getInstance():UnBind(slot0.voice_evt)

		slot0.voice_evt = nil
	end
end

function MainChatUiMsg.setVoicePlayListener(slot0, slot1)
	if slot1 then
		if not slot0.play_evt then
			slot0.play_evt = GlobalEvent:getInstance():Bind(VoiceMgr.Played, function (slot0)
				if uv0.onVoicePlay then
					uv0:onVoicePlay()
				end
			end)
		end
	elseif slot0.play_evt then
		GlobalEvent:getInstance():UnBind(slot0.play_evt)

		slot0.play_evt = nil
	end
end

function MainChatUiMsg.onTranslateEnd(slot0, slot1, slot2)
	if slot0.dataObj and slot0.dataObj.len == 1 and slot0.dataObj.msg == slot1 then
		slot0:setData(slot0.dataObj)
		GlobalEvent:getInstance():Fire(ChatConst.Voice_Translate_Main)
	end
end

function MainChatUiMsg.runMoveAction(slot0, slot1)
	slot0.content:stopAllActions()
	slot0.content:setPosition(cc.p(3, 28))

	if slot0.content:getContentSize().width < slot1 then
		return
	end

	slot2 = slot0.content:getPositionX()
	slot4 = slot0.content:getContentSize().width - slot1

	slot0.content:runAction(cc.Sequence:create(cc.DelayTime:create(3), cc.MoveTo:create(0.3, cc.p(2, slot0.content:getPositionY())), cc.DelayTime:create(3), cc.CallFunc:create(function ()
	end)))
end

function MainChatUiMsg.showPureMsg(slot0, slot1)
	slot0:setVoiceListener(false)
	slot0:setVoicePlayListener(false)

	slot0.dataObj = slot1
	slot2 = nil
	slot3 = slot0:formatMsg(slot0._font_size, c3bToStr((slot0.channel ~= ChatConst.Channel.Friend or (slot1.flag ~= 2 or ChatConst.MainFriendMsgColor[2]) and ChatConst.MainFriendMsgColor[1]) and (slot1.channel ~= ChatConst.Channel.Drama or slot1.name ~= nil and slot1.name ~= "" or Config.ColorData.data_color4[241]) and ChatConst.MainMsgColor[slot1.channel] or cc.c3b(255, 250, 118)), slot1.msg)
	slot4 = slot0.content:getSize()
	slot5 = ""

	if slot1.channel and slot0.channel ~= ChatConst.Channel.Friend then
		slot5 = string.format("<img src='%s' scale=1 />", PathTool.getResFrame("mainui", "txt_cn_chat_icon_" .. ChatConst.ChannelRes[slot1.channel]))
	end

	slot6 = ""

	if slot1.ext_list then
		for slot10, slot11 in pairs(slot1.ext_list) do
			if slot11.type == 3 then
				if Config.HonorData.data_title[slot11.val] then
					slot6 = string.format("<img src='%s' scale=1.0 />", PathTool.getTargetRes("title", "txt_cn_title_" .. slot12.res_id, false, false))
				end

				break
			end
		end
	end

	slot7 = ""

	if slot1.sex and slot1.sex < 2 and slot1.channel ~= ChatConst.Channel.Notice and slot1.channel ~= ChatConst.Channel.NoticeTop and slot1.channel ~= ChatConst.Channel.System and slot1.channel ~= ChatConst.Channel.SystemTop and slot1.channel ~= ChatConst.Channel.Gang_Sys then
		slot7 = string.format("<img src='%s' scale=0.7 />", PathTool.getResFrame("common", "common_sex" .. slot1.sex))
	end

	slot8 = ""

	if slot1.name ~= "" then
		slot9 = slot1.channel or slot0.channel
		slot10 = ChatConst.MainNameColor[slot9] or "#ffa76"
		slot8 = (slot9 ~= ChatConst.Channel.Drama or string.format("<div fontcolor=%s >%s</div> ", slot10, "[" .. transformNameByServ(slot1.name, slot1.srv_id) .. "]")) and (not slot1.vip_lev or slot1.vip_lev <= 0 or string.format("<div fontcolor=%s click='name'>%s</div> ", slot10, "[" .. string.format("<img src='%s' scale=1 />", PathTool.getResFrame("mainui", "mainui_vip")) .. transformNameByServ(slot1.name, slot1.srv_id) .. "]")) and string.format("<div fontcolor=%s click='name'>%s</div> ", slot10, "[" .. transformNameByServ(slot1.name, slot1.srv_id) .. "]")
	end

	slot0.content:setString(slot5 .. slot6 .. slot7 .. slot8 .. slot3)

	slot0.msg = slot1.msg
	slot9 = slot4.height

	slot0.content:setPosition(cc.p(5, 29))

	slot10 = slot0.content:getContentSize()
	slot0.voiceUrl = nil
	slot0.tar_channel = nil
end

function MainChatUiMsg.getIconPositionY(slot0)
	return slot0.content:getPositionY()
end

function MainChatUiMsg.getMsgContentSize(slot0)
	return slot0.content:getContentSize()
end

function MainChatUiMsg.setTiemVisible(slot0, slot1)
end

function MainChatUiMsg.adjustClickNodeWidth(slot0)
	if slot0.max_width < slot0.content._clickNode:getContentSize().width then
		slot1 = slot0.max_width
	end

	slot0.content._clickNode:setContentSize(cc.size(slot1, slot0.content._clickNode:getContentSize().height))
end

function MainChatUiMsg.onVoicePlay(slot0)
	if slot0.voiceUrl and slot0.soundIcon then
		VoiceMgr:getInstance():showVoiceEffect(slot0.soundIcon, VoiceMgr:getInstance():isPlaying(slot0.voiceUrl))
	end
end

function MainChatUiMsg.setContentTouch(slot0, slot1)
	if slot0.content and slot0.content._clickNode then
		slot0.content._clickNode:setTouchEnabled(slot1)
	end
end

function MainChatUiMsg.playVoice(slot0)
	if slot0.voiceUrl then
		VoiceMgr:getInstance():playVoice(slot0.voiceUrl)
	end
end

function MainChatUiMsg.removePlayEffect(slot0)
	if not tolua.isnull(slot0.soundIcon) then
		slot0.soundIcon:removeFromParent()
	end

	slot0.soundIcon = nil
end

function MainChatUiMsg.checkIsCanAtPeople(slot0)
	if slot0.channel == ChatConst.Channel.Whole or slot0.channel == ChatConst.Channel.World or slot0.channel == ChatConst.Channel.Gang or slot0.channel == ChatConst.Channel.Friend then
		return true
	end

	return false
end

function MainChatUiMsg.formatName(slot0, slot1, slot2, slot3, slot4)
	if slot3 and slot3 ~= 0 then
		return string.format("<div fontsize=%s fontColor=%s>%s</div><div fontsize=%s fontColor=%s click='name' >%s</div>", slot1, tranformC3bTostr(11), ChatConst.capacity[slot3], slot1, slot2, slot4)
	else
		return string.format("<div fontsize=%s fontColor=%s click='name' >%s</div>", slot1, slot2, slot4)
	end
end

function MainChatUiMsg.formatMsg(slot0, slot1, slot2, slot3)
	return string.format("<div fontsize=%s fontColor=%s>%s</div>", slot1, slot2, slot3)
end

function MainChatUiMsg.setId(slot0, slot1)
	slot0.id = slot1
end

function MainChatUiMsg.getId(slot0)
	return slot0.id
end
