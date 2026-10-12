ChatModel = ChatModel or BaseClass()
ChatModel.cache_version = "v.20150312"

function ChatModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function ChatModel.config(slot0)
	slot0.friend_cache = {}
	slot0.contact_list = {}
	slot0.red_list = {}
	slot0.max_count = 50
	slot0.stack_id = 1
	slot0.last_show_time = nil
end

function ChatModel.clone(slot0, slot1)
	slot0.role_list[1] = slot0.role_list[1] or {}
	slot2 = ChatVo.New()
	slot2.channel = slot1

	slot2:setObjectAttr(slot0)
	slot2:setMessageAttr(slot0.role_list[1])

	return slot2
end

function ChatModel.setLastShowTime(slot0, slot1)
	slot0.last_show_time = slot1
end

function ChatModel.getLastShowTime(slot0)
	return slot0.last_show_time
end

function ChatModel.formatFriendKey(slot0, slot1, slot2, slot3, slot4)
	return "chat_" .. (slot1 or 0) .. "_" .. (slot2 or 0) .. "_" .. (slot3 or 0) .. "_" .. (slot4 or 0)
end

function ChatModel.getFriendMsg(slot0, slot1, slot2, slot3, slot4)
	if not slot0.friend_cache[slot0:formatFriendKey(slot1, slot2, slot3, slot4)] then
		slot0.friend_cache[slot5] = {}

		if SysEnv:getInstance():loadPrivateChatFile(slot3, slot4) ~= nil then
			for slot10 = 1, #slot6 do
				if slot6[slot10].version == ChatModel.cache_version then
					table.insert(slot0.friend_cache[slot5], slot11)
				end
			end
		end
	end

	return slot5, slot0.friend_cache[slot5]
end

function ChatModel.setFriendMsg(slot0, slot1, slot2, slot3, slot4, slot5)
	slot11 = slot3
	slot6, slot7 = slot0:getFriendMsg(slot1, slot2, slot11, slot4)

	for slot11 = 1, #slot5 do
		if not slot0:checkHadCache(slot7, slot5[slot11]) then
			table.insert(slot7, slot5[slot11])
		end
	end

	slot0.friend_cache[slot6] = slot7
end

function ChatModel.checkHadCache(slot0, slot1, slot2)
	slot3 = false

	if slot1 and #slot1 == 0 then
		return false
	else
		for slot7, slot8 in pairs(slot1) do
			if slot8.talk_time == slot2.talk_time then
				slot3 = true

				break
			end
		end
	end

	return slot3
end

function ChatModel.writeFriendMsg(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot0:formatFriendKey(slot1, slot2, slot3, slot4)

	if slot0:checkHadSave(slot1, slot2, slot3, slot4, slot5) then
		return
	end

	if slot0.friend_cache[slot6] and #slot0.friend_cache[slot6] > 0 then
		slot7 = {}

		for slot11 = 1, #slot0.friend_cache[slot6] do
			if slot0.max_count < slot11 then
				table.remove(slot7, 1)
			end

			slot12 = slot0.friend_cache[slot6][slot11]
			slot12.version = ChatModel.cache_version

			table.insert(slot7, slot12)
		end

		slot0.friend_cache[slot6] = deepCopy(slot7)

		SysEnv:getInstance():savePrivateChatFile(slot3, slot4, slot7)
	end
end

function ChatModel.pushPrivateMsg(slot0, slot1, slot2, slot3, slot4)
	slot5 = RoleController:getInstance():getRoleVo()

	PrivateChatVo.New():setChatVo(slot1)

	slot6.id = slot4 or GameNet:getInstance():getTime()

	slot0:setFriendMsg(slot5.srv_id, slot5.rid, slot2, slot3, {
		cutBaseClass(slot6)
	})

	return slot6
end

function ChatModel.checkHadSave(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot0:formatFriendKey(slot1, slot2, slot3, slot4)
	slot8 = false

	if SysEnv:getInstance():loadPrivateChatFile(slot3, slot4) ~= nil then
		for slot12, slot13 in pairs(slot7) do
			if slot13.talk_time == slot5 then
				slot8 = true

				break
			end
		end
	end

	return slot8
end

function ChatModel.deleteCache(slot0, slot1, slot2, slot3, slot4)
	slot0.friend_cache[slot0:formatFriendKey(slot1, slot2, slot3, slot4)] = {}

	SysEnv:getInstance():savePrivateChatFile(slot3, slot4, {})
	slot0:delContactList(slot3, slot4)
	slot0:writeContactList()
end

function ChatModel.writeToDefaultXML(slot0)
	slot1 = GameNet:getInstance():getTime()
	slot2 = RoleController:getInstance():getRoleVo()

	if not slot0.cacheList then
		return
	end

	slot3 = slot2.srv_id .. "|" .. slot2.rid

	for slot8, slot9 in pairs(slot0.cacheMe) do
		slot4 = nil == nil and slot8 or slot8 .. "," .. slot8
	end

	slot0.cacheList[slot3] = slot4
	slot5 = string.format("%s_%d_%s", "friend_info", slot2.rid, slot2.srv_id)
end

function ChatModel.getTalkTime(slot0, slot1, slot2)
	if slot0.talk_list[string.format("%s+%d", slot1, slot2)] then
		return
	end
end

function ChatModel.saveTalkTime(slot0, slot1, slot2)
	slot0:initTalkList()

	slot4 = RoleController:getInstance():getRoleVo()
	slot5 = string.format("%s_%s_%d", "friend_info", slot4.srv_id, slot4.rid)

	if tonumber(slot0.talk_list[string.format("%s+%d", slot1, slot2)]) == GameNet:getInstance():getTime() then
		return
	else
		slot0.talk_list[slot6] = slot3
		slot8 = {
			[slot12] = slot13
		}

		for slot12, slot13 in pairs(slot0.talk_list) do
			if slot13 ~= nil then
				-- Nothing
			end
		end
	end
end

function ChatModel.clearTalkTime(slot0, slot1, slot2)
	slot3 = RoleController:getInstance():getRoleVo()

	slot0:initTalkList()

	if slot0.talk_list[string.format("%s+%d", slot1, slot2)] ~= nil then
		slot0.talk_list[slot4] = nil
	end

	slot5 = {
		[slot9] = slot10
	}

	for slot9, slot10 in pairs(slot0.talk_list) do
		if slot10 ~= nil then
			-- Nothing
		end
	end

	if not FriendController:getInstance():isFriend(slot1, slot2) then
		slot0:deleteCache(slot3.srv_id, slot3.rid, slot1, slot2)
	end
end

function ChatModel.initTalkList(slot0)
	if slot0.talk_list == nil then
		slot1 = RoleController:getInstance():getRoleVo()
		slot2 = string.format("%s_%s_%d", "friend_info", slot1.srv_id, slot1.rid)
		slot0.talk_list = {}
	end
end

function ChatModel.getTalkList(slot0)
	if slot0.talk_list == nil then
		slot0:initTalkList()
	end

	return slot0.talk_list
end

function ChatModel.saveTalkTime2(slot0, slot1, slot2)
	slot0:initTalkList()

	if tonumber(slot0.talk_list[string.format("%s+%d", slot1, slot2)]) == GameNet:getInstance():getTime() then
		return true
	elseif slot0.talk_list[slot3] ~= nil then
		slot0.talk_list[slot3] = slot4
		slot6, slot7 = slot0:getFriendMsg(srv_id_me, rid_me, slot1, slot2)

		if #slot7 == 0 then
			return false
		else
			return true
		end
	else
		slot0.talk_list[slot3] = slot4

		return false
	end
end

function ChatModel.addContactList(slot0, slot1, slot2)
	if FriendController:getInstance():getModel():getVo(slot1, slot2) == nil and InviteCodeController:getInstance():getModel():getFriendChatData(slot2, slot1) and next(slot4) ~= nil then
		FriendVo.New():setData(slot4)
	end

	if slot0.contact_list == nil then
		slot0.contact_list = {}
	end

	if slot3 ~= nil then
		slot0.contact_list[slot1 .. "_" .. slot2] = {
			srv_id = slot3.srv_id,
			rid = slot3.rid
		}
	end
end

function ChatModel.delContactList(slot0, slot1, slot2)
	slot3 = {}

	if slot0.contact_list and slot0.contact_list[slot1 .. "_" .. slot2] then
		for slot7, slot8 in pairs(slot0.contact_list) do
			if slot1 .. "_" .. slot2 ~= slot8.srv_id .. "_" .. slot8.rid then
				slot3[slot8.srv_id .. "_" .. slot8.rid] = slot8
			end
		end

		slot0.contact_list = slot3
	end

	slot0:writeContactList()
end

function ChatModel.writeContactList(slot0)
	SysEnv:getInstance():saveContactListFile(slot0.contact_list)
end

function ChatModel.getContectList(slot0)
	slot0.contact_list = SysEnv:getInstance():loadContactListFile()

	return slot0.contact_list or {}
end

function ChatModel.getContectList2(slot0)
	slot1 = {}
	slot6 = slot0

	for slot5, slot6 in pairs(slot0.getContectList(slot6)) do
		if FriendController:getInstance():getModel():getVo(slot6.srv_id, slot6.rid) == nil and InviteCodeController:getInstance():getModel():getFriendChatData(slot6.rid, slot6.srv_id) and next(slot8) ~= nil then
			FriendVo.New():setData(slot8)
		end

		slot1[slot6.srv_id .. "_" .. slot6.rid] = slot7
	end

	return slot1
end

function ChatModel.getAllFriendList(slot0)
	for slot7, slot8 in pairs(FriendController:getInstance():getModel():getArray().items or {}) do
		-- Nothing
	end

	return {
		[slot8.srv_id .. "_" .. slot8.rid] = slot8
	}
end

function ChatModel.setRedList(slot0, slot1, slot2, slot3)
	if slot0.red_list[slot1 .. "_" .. slot2] == nil then
		slot0.red_list[slot1 .. "_" .. slot2] = slot3
	else
		slot0.red_list[slot1 .. "_" .. slot2] = slot0.red_list[slot1 .. "_" .. slot2] + slot3
	end

	GlobalEvent:getInstance():Fire(ChatEvent.UpdatePrivateChatRed)
end

function ChatModel.getRedList(slot0, slot1, slot2)
	return slot0.red_list[slot1 .. "_" .. slot2] or {}
end

function ChatModel.delRedList(slot0, slot1, slot2)
	if slot0.red_list[slot1 .. "_" .. slot2] then
		slot0.red_list[slot1 .. "_" .. slot2] = 0
	end

	GlobalEvent:getInstance():Fire(ChatEvent.UpdatePrivateChatRed)
end

function ChatModel.getRedCount(slot0)
	for slot5, slot6 in pairs(slot0.red_list) do
		slot1 = 0 + slot6
	end

	return slot1
end

function ChatModel.setAtData(slot0, slot1)
	slot0.at_data = slot1
end

function ChatModel.getAtData(slot0)
	return slot0.at_data
end

function ChatModel.__delete(slot0)
end

function ChatModel.setRedStatus(slot0)
end
