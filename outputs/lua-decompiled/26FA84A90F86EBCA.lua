ChatController = ChatController or BaseClass(BaseController)

function ChatController.config(slot0)
	slot0.pro_12766 = true
	slot0.voiceCache = {}
	slot0.model = ChatModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()

	if slot0.login_event_success == nil then
		slot0.login_event_success = slot0.dispather:Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.login_event_success)

			uv0.login_event_success = nil

			uv0:initData()
		end)
	end

	slot0.tar_cur_open_type = nil
end

function ChatController.getModel(slot0)
	return slot0.model
end

function ChatController.registerEvents(slot0)
end

function ChatController.initChatMsgData(slot0)
	slot0.stack_list = {
		[ChatConst.Channel.Multi] = Array.New(),
		[ChatConst.Channel.Whole] = Array.New(),
		[ChatConst.Channel.World] = Array.New(),
		[ChatConst.Channel.Gang] = Array.New(),
		[ChatConst.Channel.Friend] = Array.New(),
		[ChatConst.Channel.Notice] = Array.New(),
		[ChatConst.Channel.Cross] = Array.New(),
		[ChatConst.Channel.Scene] = Array.New(),
		[ChatConst.Channel.Team] = Array.New(),
		[ChatConst.Channel.Drama] = Array.New(),
		[ChatConst.Channel.Province] = Array.New()
	}
	slot0.cache_msg_list = {}
end

function ChatController.initData(slot0)
	slot0:initChatMsgData()

	slot0.stack_id = 0
	slot0.stack_limit = {
		[ChatConst.Channel.Multi] = 40,
		[ChatConst.Channel.Whole] = 80,
		[ChatConst.Channel.World] = 30,
		[ChatConst.Channel.Gang] = 30,
		[ChatConst.Channel.Friend] = 30,
		[ChatConst.Channel.Cross] = 40,
		[ChatConst.Channel.Notice] = 16,
		[ChatConst.Channel.Scene] = 30,
		[ChatConst.Channel.Team] = 30,
		[ChatConst.Channel.Drama] = 30,
		[ChatConst.Channel.Province] = 30
	}

	slot0:handle12761({
		len = 0,
		channel = ChatConst.Channel.System,
		role_list = {},
		msg = string.format("欢迎来到%s~", GAME_NAME),
		flag = 1
	})

	slot0.is_first = true
	slot0.sys_index = 1
	slot0.sys_total = #Config.LoadingDescData.data_desc
	slot0.sys_ticket = GlobalTimeTicket:getInstance():add(function ()
		uv0:handle12761({
			len = 0,
			channel = ChatConst.Channel.System,
			role_list = {},
			msg = Config.LoadingDescData.data_desc[uv0.sys_index]
		})

		uv0.sys_index = uv0.sys_index + 1

		if uv0.sys_total < uv0.sys_index then
			uv0.sys_index = 1
		end
	end, 600)
end

function ChatController.registerProtocals(slot0)
	slot0:RegisterProtocal(12720, "handle12720")
	slot0:RegisterProtocal(12721, "handle12721")
	slot0:RegisterProtocal(12722, "handle12722")
	slot0:RegisterProtocal(12725, "handle12725")
	slot0:RegisterProtocal(12726, "handle12726")
	slot0:RegisterProtocal(12741, "handle12741")
	slot0:RegisterProtocal(12743, "handle12743")
	slot0:RegisterProtocal(12799, "hander12799")
	slot0:RegisterProtocal(12761, "handle12761")
	slot0:RegisterProtocal(12762, "handle12762")
	slot0:RegisterProtocal(12763, "handle12763")
	slot0:RegisterProtocal(12766, "handle12766")
	slot0:RegisterProtocal(12767, "handle12767")
	slot0:RegisterProtocal(12768, "handle12768")
	slot0:RegisterProtocal(12704, "handle12704")
end

function ChatController.sender12720(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(12720, {
		to_srv_id = slot1,
		to_rid = slot2,
		len = slot3,
		msg = slot4
	})
end

function ChatController.handle12720(slot0, slot1)
	if slot1.code == 0 then
		message2(slot1.msg)
	end
end

function ChatController.handle12721(slot0, slot1)
	slot1.msg = WordCensor:getInstance():relapceFaceIconTag(slot1.msg)[2]
	slot2 = slot1.srv_id
	slot3 = slot1.rid

	if not RoleController:getInstance():getRoleVo() then
		return
	end

	if FriendController:getInstance():getModel():isBlack(slot3, slot2) then
		return
	end

	slot1.talk_time = slot1.tick

	if slot1.flag == 11 or slot1.flag == 1 then
		slot1.other_rid = slot1.rid
		slot1.other_srv_id = slot1.srv_id
		slot1.other_name = slot1.name
		slot1.other_lev = slot1.lev
		slot1.other_face_id = slot1.face_id
		slot1.other_face_file = slot1.face_file
		slot1.other_face_update_time = slot1.face_update_time
		slot1.rid = slot4.rid
		slot1.srv_id = slot4.srv_id
		slot1.name = slot4.name
		slot1.career = slot4.career
		slot1.sex = slot4.sex
		slot1.face_id = slot4.face_id
		slot1.face_file = slot4.face_file
		slot1.face_update_time = slot4.face_update_time
	elseif slot1.flag == 2 then
		slot1.rid = slot1.rid
		slot1.srv_id = slot1.srv_id
		slot1.name = slot1.name
		slot1.career = slot1.career
		slot1.sex = slot1.sex
		slot1.face_id = slot1.face_id
		slot1.face_file = slot1.face_file
		slot1.face_update_time = slot1.face_update_time
		slot1.other_rid = slot4.rid
		slot1.other_srv_id = slot4.srv_id
		slot1.other_name = slot4.name
		slot1.other_lev = slot4.lev
		slot1.other_face_id = slot4.face_id
		slot1.other_face_file = slot4.face_file
		slot1.other_face_update_time = slot4.face_update_time

		slot0.model:setRedList(slot1.srv_id, slot1.rid, 1)
	end

	slot0.model:saveTalkTime(slot2, slot3)

	slot1.channel = ChatConst.Channel.Friend
	slot5 = slot0.model:pushPrivateMsg(slot1, slot2, slot3, slot1.talk_time)

	slot0.model:writeFriendMsg(slot4.srv_id, slot4.rid, slot2, slot3, slot1.talk_time)
	slot0.model:addContactList(slot2, slot3)
	slot0.model:writeContactList()

	if slot1.flag == 2 then
		slot6 = ChatVo.New()

		slot6:setObjectAttr(slot1)
		slot6:setMessageAttr(slot1)

		slot6.id = slot0:getUniqueId()
		slot6.channel = ChatConst.Channel.Friend

		slot0:saveChatMsg(slot6, ChatConst.Channel.Whole)
	end

	GlobalEvent:getInstance():Fire(EventId.CHAT_UPDATE_SELF, slot5)
	GlobalEvent:getInstance():Fire(FriendEvent.UPDATE_GROUP_COUNT)

	if slot0.cur_channel ~= ChatConst.Channel.Friend or slot0:isChatOpen() == false then
		slot0:accumulateChannelNum(ChatConst.Channel.Friend)
	end
end

function ChatController.handle12722(slot0, slot1)
	if not slot0.read_list then
		slot0.read_list = {}
	end

	if not RoleController:getInstance():getRoleVo() then
		return
	end

	slot3 = GameNet:getInstance():getTime()

	GlobalTimeTicket:getInstance():add(function ()
		slot0 = nil
		slot1 = {}

		for slot5, slot6 in pairs(uv0.offline_list) do
			if not FriendController:getInstance():getModel():isBlack(slot6.rid, slot6.srv_id) then
				if not uv1.read_list[slot6.rid .. "_" .. slot6.srv_id] then
					uv1.read_list[slot0] = {
						slot6.rid,
						slot6.srv_id
					}
				end

				for slot10 = 1, #slot6.msg_list do
					table.insert(slot1, {
						rid = slot6.rid,
						srv_id = slot6.srv_id,
						name = slot6.name,
						lev = slot6.lev,
						career = slot6.career,
						face_id = slot6.face_id,
						face_file = slot6.face_file,
						face_update_time = slot6.face_update_time,
						sex = slot6.sex,
						vip_lev = slot6.vip_lev,
						len = slot6.msg_list[slot10].len,
						msg = WordCensor:getInstance():relapceFaceIconTag(slot6.msg_list[slot10].msg)[2],
						flag = 2,
						talk_time = slot6.msg_list[slot10].tick,
						other_rid = uv2.rid,
						other_srv_id = uv2.srv_id,
						other_name = uv2.name,
						other_lev = uv2.lev,
						other_face_id = uv2.face_id,
						other_face_file = uv2.face_file,
						other_face_update_time = uv2.face_update_time
					})
				end
			end
		end

		for slot5, slot6 in pairs(slot1) do
			uv1.model:saveTalkTime(slot6.srv_id, slot6.rid, slot6.talk_time)
			uv1.model:addContactList(slot6.srv_id, slot6.rid)
			uv1.model:writeContactList()
			uv1.model:writeFriendMsg(uv2.srv_id, uv2.rid, slot6.srv_id, slot6.rid, slot6.talk_time)
			uv1.model:setRedList(slot6.srv_id, slot6.rid, 1)
			GlobalEvent:getInstance():Fire(EventId.CHAT_UPDATE_SELF, uv1.model:pushPrivateMsg(slot6, slot6.srv_id, slot6.rid, slot6.talk_time))
		end

		slot1 = nil
	end, 2, 1)
end

function ChatController.handle12741(slot0, slot1)
	showAssetsMsg(slot1.msg)
end

function ChatController.handle12743(slot0, slot1)
	message(slot1.msg)
	slot0:handle12761({
		len = 0,
		channel = ChatConst.Channel.System,
		role_list = {},
		msg = slot1.msg
	}, true)
end

function ChatController.hander12799(slot0, slot1)
	if not slot0.alert_msg then
		slot0.alert_msg = ""

		GlobalTimeTicket:getInstance():add(function ()
			ErrorMessage.show(uv0.alert_msg)

			uv0.alert_msg = nil
		end, 1, 1)
	end

	slot0.alert_msg = string.format("%s%s\n", slot0.alert_msg, slot1.msg)
end

function ChatController.noticeReader(slot0, slot1, slot2)
	if slot0.read_list == nil or slot1 == nil or slot2 == nil then
		return
	end

	if slot0.read_list[slot2 .. "_" .. slot1] then
		slot0.read_list[slot3] = nil

		slot0:SendProtocal(12723, {
			rid = slot2,
			srv_id = slot1
		})
	end
end

function ChatController.voiceTranslate(slot0, slot1, slot2, slot3, slot4)
	slot0:sendVoiceMsg(slot1 .. "@" .. slot2, slot3, slot4)
	callSpeechRecognizeDo(slot1, function (slot0)
		VoiceMgr:getInstance():setMsg(uv0, slot0)
		uv2:SendProtocal(12764, {
			channel = uv1,
			id = uv0,
			msg = slot0
		})
	end)
end

function ChatController.sendVoiceMsg(slot0, slot1, slot2, slot3)
	if ChatConst.Channel.Friend == slot2 then
		if slot3 then
			slot0:sender12720(slot3.srv_id, slot3.rid, 1, slot1)
		end
	else
		slot0:sendChatMsg(slot2, 1, slot1)
	end
end

function ChatController.sendMessage(slot0, slot1, slot2, slot3, slot4)
	slot4 = slot4 or 0

	if slot2 == 0 then
		slot2 = 1
	end

	if ChatConst.Channel.Friend == slot2 then
		if slot0.tar_chat_data then
			slot0:sender12720(slot0.tar_chat_data.srv_id, slot0.tar_chat_data.rid, slot4, slot1)
		end
	else
		slot0:sendChatMsg(slot2, slot4, slot1)
	end
end

function ChatController.showMyMsg(slot0, slot1, slot2)
end

function ChatController.sendChatMsg(slot0, slot1, slot2, slot3)
	if slot2 > 0 or ChatMgr:getInstance():canSpeak(slot1) then
		slot0:sendMsgToServer(slot1, slot2, slot3)

		return true
	end

	return false
end

function ChatController.sendMsgToServer(slot0, slot1, slot2, slot3)
	slot5 = RoleController:getInstance():getRoleVo()

	slot0:SendProtocal(12762, {
		channel = slot1,
		len = slot2,
		msg = slot3,
		sign = cc.CCGameLib:getInstance():md5str(table.concat({
			slot5.rid,
			slot5.srv_id,
			slot1,
			slot2,
			slot3,
			"____"
		}, ""))
	})
	ChatMgr:getInstance():setSpeakTime(slot1)
end

function ChatController.handle12762(slot0, slot1)
	if slot1.code == 0 then
		message(slot1.msg)
	end
end

function ChatController.saveAtData(slot0, slot1)
	slot0.at_data = slot1
end

function ChatController.getAtData(slot0)
	return slot0.at_data
end

function ChatController.handle12763(slot0, slot1)
	VoiceMgr:getInstance():setMsg(slot1.id, slot1.msg)
end

function ChatController.saveChatMsg(slot0, slot1, slot2)
	if slot0.stack_list == nil or slot0.stack_list[slot2] == nil then
		return
	end

	if slot0.stack_limit[slot2] <= slot0.stack_list[slot2]:GetSize() then
		slot0.stack_list[slot2]:PopFront()
	end

	slot0.stack_list[slot2]:PushBack(slot1)
end

function ChatController.clearChatLog(slot0, slot1)
	if slot0.stack_list and slot0.stack_list[slot1] then
		slot0.stack_list[slot1] = nil
		slot0.stack_list[slot1] = Array.New()
	end
end

function ChatController.getChannelData(slot0, slot1)
	return slot0.stack_list[slot1] or Array.New()
end

function ChatController.handle12704(slot0, slot1)
	slot0:deleteChatDataByRidAndSrvid(slot1.rid, slot1.srv_id)
end

function ChatController.deleteChatDataByRidAndSrvid(slot0, slot1, slot2)
	if not slot1 or not slot2 or slot0.stack_list == nil then
		return
	end

	for slot6, slot7 in pairs(slot0.stack_list) do
		for slot11 = slot7:GetSize() - 1, 0, -1 do
			if slot2 == slot7:Get(slot11).srv_id and slot1 == slot12.rid then
				slot7:Erase(slot11)
			end
		end
	end
end

function ChatController.getUniqueId(slot0)
	if not slot0.stack_id then
		slot0.stack_id = 0
	end

	slot0.stack_id = slot0.stack_id + 1

	return slot0.stack_id
end

function ChatController.handle12761(slot0, slot1, slot2, slot3)
	slot4 = slot1.channel
	slot5 = 1

	if slot0.pro_12766 and slot0.is_first == false then
		slot0.pro_12766 = nil
	end

	slot0.is_first = false
	slot1.msg = WordCensor:getInstance():relapceFaceIconTag(slot1.msg)[2]
	slot9 = slot1.msg
	slot1.msg = WordCensor:getInstance():relapceAssetsTag(slot9)

	for slot9 = 1, 16 do
		if math.floor(slot4 / 2) * 2 ~= slot4 then
			slot1.channel = slot5

			slot0:handle12761__(slot1, slot2, slot3)
		end

		slot5 = slot5 * 2

		if math.floor(slot4 / 2) < 1 then
			return
		end
	end
end

function ChatController.handle12761__(slot0, slot1, slot2, slot3)
	if slot1.channel == ChatConst.Channel.NoticeTop then
		GlobalMessageMgr:getInstance():showMoveHorizontal(WordCensor:getInstance():relapceAssetsTag(string.format("<div fontsize=17>%s</div>", slot1.msg)), Config.ColorData.data_color3[1])

		return
	end

	if slot4 == ChatConst.Channel.SystemTop then
		GlobalMessageMgr:getInstance():showMoveHorizontal(string.format("<div fontsize=17>%s</div>", slot1.msg), Config.ColorData.data_color3[1])

		return
	end

	if not RoleController:getInstance():getRoleVo() then
		return
	end

	if slot4 == ChatConst.Channel.Cross then
		if slot5.lev < Config.MiscData.data_const.cross_level.val then
			return
		end
	elseif slot4 == ChatConst.Channel.Province and slot5.lev < Config.MiscData.data_const.province_level.val then
		return
	end

	if slot4 == ChatConst.Channel.System then
		slot0:pushAssetsMsg(slot1.msg)

		return
	end

	slot6 = ChatModel.clone(slot1, slot4)
	slot6.id = slot0:getUniqueId()

	if not FriendController:getInstance():getModel():isBlack(slot6.rid, slot6.srv_id) then
		if slot6.flag ~= "openGang" and slot6.flag ~= "openTeam" then
			if slot4 ~= ChatConst.Channel.Gang and slot4 ~= ChatConst.Channel.Team and slot4 ~= ChatConst.Channel.Cross and slot4 ~= ChatConst.Channel.Gang_Sys and slot4 ~= ChatConst.Channel.Team_Sys and slot4 ~= ChatConst.Channel.Scene and slot4 ~= ChatConst.Channel.Notice and slot4 ~= ChatConst.Channel.System and slot4 ~= ChatConst.Channel.Province then
				slot0:saveChatMsg(slot6, ChatConst.Channel.Multi)
			end

			slot0:saveChatMsg(slot6, ChatConst.Channel.Whole)
		end

		if slot2 == nil then
			if slot4 == ChatConst.Channel.Gang_Sys then
				slot0:saveChatMsg(slot6, ChatConst.Channel.Gang)
			elseif slot4 == ChatConst.Channel.Team_Sys then
				slot6.rid = 0

				slot0:saveChatMsg(slot6, ChatConst.Channel.Team)
			else
				slot0:saveChatMsg(slot6, slot4)
			end

			slot7 = false

			if slot6.rid and slot6.rid ~= 0 and slot6.srv_id and slot5.rid == slot6.rid and slot5.srv_id == slot6.srv_id then
				slot7 = true
			end

			if slot7 == false then
				if slot4 == ChatConst.Channel.World and (slot0.cur_channel ~= ChatConst.Channel.World or slot0:isChatOpen() == false) then
					slot0:accumulateChannelNum(ChatConst.Channel.World)
				elseif slot4 == ChatConst.Channel.Gang and (slot0.cur_channel ~= ChatConst.Channel.Gang or slot0:isChatOpen() == false) then
					slot0:accumulateChannelNum(ChatConst.Channel.Gang)
				elseif slot4 == ChatConst.Channel.Cross and (slot0.cur_channel ~= ChatConst.Channel.Cross or slot0:isChatOpen() == false) then
					slot0:accumulateChannelNum(ChatConst.Channel.Cross)
				elseif slot4 == ChatConst.Channel.Province and (slot0.cur_channel ~= ChatConst.Channel.Province or slot0:isChatOpen() == false) then
					slot0:accumulateChannelNum(ChatConst.Channel.Province)
				end
			end
		end
	end

	slot7 = false

	if slot5 and slot5.rid == slot6.rid and slot5.srv_id == slot6.srv_id then
		slot7 = true
	end

	if not FriendController:getInstance():getModel():isBlack(slot6.rid, slot6.srv_id) or slot4 == ChatConst.Channel.Team_Sys then
		GlobalEvent:getInstance():Fire(EventId.CHAT_UDMSG_WORLD, slot4, slot7, slot3)
	end

	if slot1.len == 1 and slot1.role_list and #slot1.role_list > 0 then
		slot8 = slot1.role_list[1]

		if slot5 and slot8.srv_id .. "_" .. slot8.rid ~= slot5:getRoleSrid() then
			VoiceMgr:getInstance():insertVoice(slot1.msg, slot4)
		end
	end
end

function ChatController.pushAssetsMsg(slot0, slot1)
	if slot1 == "" then
		return
	end

	slot2 = ChatVo.New()
	slot2.channel = ChatConst.Channel.System
	slot2.msg = slot1
	slot2.id = slot0:getUniqueId()
	slot2.msg = WordCensor:getInstance():relapceAssetsTag(slot2.msg)

	slot0:saveChatMsg(slot2, ChatConst.Channel.Notice)
	GlobalEvent:getInstance():Fire(EventId.CHAT_UDMSG_ASSETS)
end

function ChatController.handle12766(slot0, slot1)
	if slot0.pro_12766 then
		slot0.pro_12766 = nil

		for slot5 = 1, #slot1.msg_list do
			slot0:handle12761(slot1.msg_list[slot5], nil, true)
		end

		slot0.pro_12766 = true
	end
end

function ChatController.getRefChannel(slot0, slot1)
	if slot0.chat_ui and slot0.chat_ui:isOpen() then
		channel = slot0.chat_ui.channel
	end

	if channel == nil or channel == -1 then
		channel = 1
	end

	return channel
end

function ChatController.getTextInputFace(slot0)
	slot1 = nil

	if slot0.chat_ui and slot0.chat_ui:isOpen() then
		slot1 = slot0.chat_ui:getEditText()
	end

	if slot1 then
		return WordCensor:getInstance():relapceFaceIconTag(slot1)[1]
	end

	return 0
end

function ChatController.getFaceSpineSize(slot0, slot1)
	if not slot0.face_info then
		slot0.face_info = {}
	end

	if slot0.face_info[slot1] then
		return slot0.face_info[slot1]
	else
		for slot5, slot6 in pairs(Config.FaceData.data_biaoqing) do
			if slot6.file == slot1 then
				slot0.face_info[slot1] = {
					slot6.width,
					slot6.heigh
				}

				return slot0.face_info[slot1]
			end
		end
	end

	return {
		42,
		30
	}
end

function ChatController.sender12725(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(12725, {
		voice = slot2,
		voice_len = string.len(slot2),
		time = slot3,
		type = AUDIO_RECORD_TYPE
	})

	slot0.uploading = slot1

	GlobalTimeTicket:getInstance():add(function ()
		uv0:uploadVoiceFail(1)
	end, 5, 1, "chat_voice_upload_fail")
end

function ChatController.handle12725(slot0, slot1)
	if not slot0.uploading then
		return
	end

	if slot1.flag == 1 then
		GlobalTimeTicket:getInstance():remove("chat_voice_upload_fail")

		if slot0.voiceCache[slot0.uploading] then
			slot3 = slot1.srv_id .. "-" .. slot1.voice_id
			slot4 = ChatHelp.formatFileName(slot3)

			slot0:voiceTranslate(slot3, slot2.time, slot2.channel, slot2.take)
			cc.FileUtils:getInstance():renameFile(PathTool.getVoicePath(""), ChatHelp.formatFileName(AUDIO_RECORD_FILE), slot4)
			VoiceMgr:getInstance():addCacheVoiceFile(slot3, slot4, slot2.time)
		else
			message(TI18N("录音失败"))
		end

		slot0.voiceCache[slot0.uploading] = nil
		slot0.uploading = nil
	else
		slot0:uploadVoiceFail(2)
	end
end

function ChatController.uploadVoiceFail(slot0, slot1)
	GlobalTimeTicket:getInstance():remove("chat_voice_upload_fail")
	cc.FileUtils:getInstance():removeFile(PathTool.getVoicePath(slot0.uploading))

	slot0.voiceCache[slot0.uploading] = nil
	slot0.uploading = nil
end

function ChatController.sender12726(slot0, slot1, slot2)
	slot0:SendProtocal(12726, {
		srv_id = slot1,
		voice_id = slot2
	})
end

function ChatController.handle12726(slot0, slot1)
	if slot1.time > 0 then
		slot2 = slot1.srv_id .. "-" .. slot1.voice_id
		slot3 = ChatHelp.formatFileName(slot2)
		slot4 = VoiceMgr:getInstance():addCacheVoiceFile(slot2, slot3, slot1.time)

		if slot1.type == 10 then
			writeBinaryFile(PathTool.getVoicePath(AUDIO_WAV_FILE_DECODE_IN), slot1.voice)
			callSpeexDecode(PathTool.getVoicePath(AUDIO_WAV_FILE_DECODE_IN), PathTool.getVoicePath(slot3))
		else
			writeBinaryFile(slot5, slot1.voice)
		end

		VoiceMgr:getInstance():startPlay(slot4)
	else
		message(slot1.voice)
	end
end

function ChatController.handle12767(slot0, slot1)
	slot0.model:setAtData(slot1)

	if slot0.chat_ui then
		slot0.chat_ui:showAtNotice(true, slot1)
	end
end

function ChatController.sender12768(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(12768, {
		rid = slot1,
		srv_id = slot2,
		channel = slot3,
		msg = slot4
	})
end

function ChatController.handle12768(slot0)
end

function ChatController.getId(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot0.stack_list[slot1]
	slot7 = 1
	slot11 = slot6

	for slot11 = 0, slot6.GetSize(slot11) - 1 do
		if slot2 == slot6:Get(slot11).srv_id and slot3 == slot12.rid and slot4 == slot12.name and slot5 == slot12.msg then
			slot7 = slot12.id
		end
	end

	return slot7
end

function ChatController.getIsShowAt(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0.chat_ui.channelList[ChatConst.Channel.Friend] then
		if slot7[ChatConst.Channel.Friend].stack_item[slot0:getId(slot1, slot2, slot3, slot4, slot5)] then
			return true
		else
			return false
		end
	end

	return false
end

function ChatController.getPrivateChatPosX(slot0)
	return SCREEN_X + 450 * SCALE_RATE - 2
end

function ChatController.getChatRootWnd(slot0)
	if slot0.chat_ui and slot0.chat_ui:isOpen() then
		return slot0.chat_ui.root_wnd
	end
end

function ChatController.openFriendInfo(slot0, slot1, slot2)
	FriendController:getInstance():openFriendCheckPanel(true, slot1)
end

function ChatController.openChatPanel(slot0, slot1, slot2, slot3)
	if StoryController:getInstance():getModel():isStoryState() == true then
		return
	end

	if GuideController:getInstance():isInGuide() then
		return
	end

	if (slot1 or ChatConst.Channel.World) == ChatConst.Channel.Whole then
		slot1 = ChatConst.Channel.World
	elseif slot1 == ChatConst.Channel.Gang_Sys then
		slot1 = ChatConst.Channel.Gang
	end

	if slot1 ~= ChatConst.Channel.World and slot1 ~= ChatConst.Channel.Gang and slot1 ~= ChatConst.Channel.Friend and slot1 ~= ChatConst.Channel.Notice then
		slot1 = ChatConst.Channel.World
	end

	if not slot0.chat_ui then
		slot0.chat_ui = ChatWindow.New(slot0)
	end

	if slot2 == "friend" then
		slot5 = RoleController:getInstance():getRoleVo()

		if slot3 then
			slot0.model:addContactList(slot3.srv_id, slot3.rid)
			slot0.model:writeContactList()
		elseif FriendController:getInstance():getModel():getArray():Get(0) then
			slot0.model:addContactList(slot6.srv_id, slot6.rid)
			slot0.model:writeContactList()
		end
	end

	if not slot0.chat_ui:isOpen() then
		slot0.chat_ui:open()
	end

	if slot2 == "friend" then
		slot0.chat_ui:openChannel(slot1, slot3.srv_id, slot3.rid)
	else
		slot0.chat_ui:openChannel(slot1)
	end

	MainuiController:getInstance():setMainUIChatBubbleStatus(false)
end

function ChatController.moveView(slot0, slot1)
	if slot0.chat_ui then
		slot0.chat_ui:moveUI(slot1)
	end
end

function ChatController.closeChatUseAction(slot0)
	if slot0.chat_ui and slot0.chat_ui:isOpen() then
		slot0.chat_ui:playMoveAct()
	end
end

function ChatController.openChatUITimer(slot0, slot1)
	if slot1 == true and slot0.chat_ui then
		slot0.chat_begin_time = GameNet:getInstance():getTime()

		if slot0.chat_ui_timer == nil then
			slot0.chat_ui_timer = GlobalTimeTicket:getInstance():add(function ()
				if ChatConst.Clear_Chat_Time < GameNet:getInstance():getTime() - uv0.chat_begin_time then
					GlobalTimeTicket:getInstance():remove(uv0.chat_ui_timer)

					uv0.chat_ui_timer = nil

					if uv0.chat_ui then
						uv0.chat_ui:clearChatList()
					end
				end
			end, 1)
		end
	elseif slot0.chat_ui_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.chat_ui_timer)

		slot0.chat_ui_timer = nil
	end
end

function ChatController.getChatInput(slot0)
	if slot0.chat_ui and slot0.chat_ui.chat_input then
		return slot0.chat_ui.chat_input
	end
end

function ChatController.chatAtPeople(slot0, slot1, slot2)
	if slot0:getChatInput() then
		slot3:setInputText("@" .. slot1 .. " ", slot2)
	end
end

function ChatController.openChatReportWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.chat_report_wnd then
			slot0.chat_report_wnd = ChatRepoprtWindow.New()
		end

		if slot0.chat_report_wnd:isOpen() == false then
			slot0.chat_report_wnd:open(slot2, slot3)
		end
	elseif slot0.chat_report_wnd then
		slot0.chat_report_wnd:close()

		slot0.chat_report_wnd = nil
	end
end

function ChatController.isChatOpen(slot0)
	if slot0.chat_ui then
		return slot0.chat_ui:isOpen()
	end

	return false
end

function ChatController.getChatWindowZorder(slot0)
	if slot0.chat_ui then
		return slot0.chat_ui:getCommonUIZOrder()
	end

	return 1
end

function ChatController.openPrivatePanel(slot0, slot1, slot2, slot3)
	if slot1 then
		if not slot0.chat_panel then
			slot0.chat_panel = PrivateChatPanel.new(slot0, slot3)
		end

		slot0.chat_panel:setVisible(false)
	elseif slot0.chat_panel and slot0.chat_panel:isVisible() then
		slot0.chat_panel:closeView()
		slot0.chat_panel:setVisible(false)

		slot0.chat_panel = nil
	end
end

function ChatController.getChatPanel(slot0)
	return slot0.chat_panel
end

function ChatController.__delete(slot0)
	slot0:openChatUITimer(false)

	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end

	if slot0.send_voice_evt then
		GlobalEvent:getInstance():UnBind(slot0.send_voice_evt)

		slot0.send_voice_evt = nil
	end

	if slot0.send_msges_evt then
		GlobalEvent:getInstance():UnBind(slot0.send_msges_evt)

		slot0.send_msges_evt = nil
	end

	if slot0.custom_msg_evt then
		GlobalEvent:getInstance():UnBind(slot0.custom_msg_evt)

		slot0.custom_msg_evt = nil
	end

	if slot0.sys_ticket then
		GlobalTimeTicket:getInstance():remove(slot0.sys_ticket)

		slot0.sys_ticket = nil
	end

	if slot0.voice_upload_evt then
		GlobalTimeTicket:getInstance():remove(slot0.voice_upload_evt)

		slot0.voice_upload_evt = nil
	end

	if slot0.update_drama_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_drama_data_event)

		slot0.update_drama_data_event = nil
	end

	slot0:openShowDramaTimer(false)
end

function ChatController.insertVoiceMsg(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 then
		slot0.voiceCache[slot1] = {
			msg = slot2,
			time = slot3,
			channel = slot4,
			take = slot5
		}
	end
end

function ChatController.checkSendVoiceMsg(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	if slot0.voiceCache[slot2] then
		if slot1 then
			slot0:voiceTranslate(slot3.msg, slot3.time, slot3.channel, slot3.take)
		else
			message(TI18N("录音失败"))
		end

		slot0.voiceCache[slot2] = nil
	end
end

function ChatController.checkChannelStatus(slot0, slot1)
	return true
end

function ChatController.getTarCacheData(slot0)
	return slot0.tar_chat_data
end

function ChatController.clearTarCacheData(slot0)
	slot0.tar_chat_data = nil
end

function ChatController.getTarCurOpenType(slot0)
	return slot0.tar_cur_open_type
end

function ChatController.setTarCurOpenType(slot0, slot1)
	slot0.tar_cur_open_type = slot1
end

function ChatController.setLastChannel(slot0, slot1)
	slot0.cur_channel = slot1

	if slot0.cache_msg_list == nil then
		slot0.cache_msg_list = {}
	end

	slot0.cache_msg_list[slot1] = 0

	GlobalEvent:getInstance():Fire(EventId.CHAT_NEWMSG_FLAG, slot1)
end

function ChatController.getChannelMsgSum(slot0, slot1)
	if slot1 == nil then
		return 0
	end

	if slot0.cache_msg_list and slot0.cache_msg_list[slot1] then
		return slot0.cache_msg_list[slot1] or 0
	end

	return 0
end

function ChatController.getTotalMsgSum(slot0)
	if slot0.cache_msg_list == nil then
		return 0
	else
		for slot5, slot6 in pairs(slot0.cache_msg_list) do
			slot1 = 0 + slot6
		end

		return slot1
	end
end

function ChatController.accumulateChannelNum(slot0, slot1)
	if slot0.cache_msg_list == nil then
		slot0.cache_msg_list = {}
	end

	if slot0.cache_msg_list[slot1] == nil then
		slot0.cache_msg_list[slot1] = 0
	end

	slot0.cache_msg_list[slot1] = slot0.cache_msg_list[slot1] + 1

	GlobalEvent:getInstance():Fire(EventId.CHAT_NEWMSG_FLAG, slot1)
end

function ChatController.checkShowDramaMsg(slot0)
	slot0.drama_dunid_cache = slot0.drama_dunid_cache or {}

	if BattleDramaController:getInstance():getModel():getDramaData() then
		slot3 = slot1.is_first

		if slot1.dun_id and slot3 and slot3 == 1 and not slot0:checkIsShowedDramaData(slot2) and Config.DramaChatData.data_info[slot2] then
			table.insert(slot0.drama_dunid_cache, slot2)

			slot0.cur_play_dun_id = slot2
			slot0.drama_data_cache = slot0.drama_data_cache or {}

			for slot8, slot9 in ipairs(slot4.content) do
				table.insert(slot0.drama_data_cache, slot9)
			end

			slot0:openShowDramaTimer(true)
		end
	end
end

function ChatController.checkIsShowedDramaData(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.drama_dunid_cache) do
		if slot7 == slot1 then
			slot2 = true
		end
	end

	return slot2
end

function ChatController.openShowDramaTimer(slot0, slot1)
	if slot1 == true then
		GlobalEvent:getInstance():Fire(ChatEvent.AdjustMainChatBtnPos, true)

		if not slot0.showDramaTimer then
			slot0.drama_time = 0
			slot0.interval_time = -1
			slot0.showDramaTimer = GlobalTimeTicket:getInstance():add(function ()
				uv0.drama_time = uv0.drama_time + 1

				if uv0.drama_data_cache[1] then
					if uv0.interval_time <= uv0.drama_time then
						uv0.interval_time = slot0[1]
						ChatVo.New().channel = ChatConst.Channel.Drama
						slot3.msg = WordCensor:getInstance():relapceFaceIconTag(slot0[3])[2] or ""
						slot3.id = uv0:getUniqueId()
						slot3.name = slot0[2]
						slot3.sex = 3

						uv0:saveChatMsg(slot3, ChatConst.Channel.Whole)
						uv0:saveChatMsg(slot3, ChatConst.Channel.Drama)
						table.remove(uv0.drama_data_cache, 1)

						uv0.drama_time = 0

						GlobalEvent:getInstance():Fire(EventId.CHAT_UDMSG_WORLD)
					end
				else
					GlobalEvent:getInstance():Fire(ChatEvent.AdjustMainChatBtnPos, false)

					uv0.cur_play_dun_id = nil

					GlobalTimeTicket:getInstance():remove(uv0.showDramaTimer)

					uv0.showDramaTimer = nil
				end
			end, 1)
		end
	else
		GlobalEvent:getInstance():Fire(ChatEvent.AdjustMainChatBtnPos, false)

		slot0.cur_play_dun_id = nil

		if slot0.showDramaTimer ~= nil then
			GlobalTimeTicket:getInstance():remove(slot0.showDramaTimer)

			slot0.showDramaTimer = nil
		end
	end
end

function ChatController.checkIsPlayingDramaMsg(slot0)
	return slot0.cur_play_dun_id
end
