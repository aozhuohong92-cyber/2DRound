InviteCodeModel = InviteCodeModel or BaseClass()
slot0 = Config.InviteCodeData.data_tesk_list
slot1 = table.insert
slot2 = table.sort

function InviteCodeModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function InviteCodeModel.config(slot0)
	slot0.teskData = {}
	slot0.friend_data = {}
	slot0.friend_chat_data = {}
end

function InviteCodeModel.setInviteCode(slot0, slot1)
	slot0.invite_code = slot1
end

function InviteCodeModel.getInviteCode(slot0)
	return slot0.invite_code or "获取推荐码失败"
end

function InviteCodeModel.setInviteCodeTeskData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0.teskData[slot6.id] = slot6
	end

	slot0:checkoutInviteRedPoint()
end

function InviteCodeModel.setUpdataInviteCodeTeskData(slot0, slot1)
	if slot0.teskData and slot0.teskData[slot1.id] then
		slot0.teskData[slot1.id] = {
			id = slot1.id,
			had = slot1.had,
			num = slot1.num
		}
	end

	slot0:checkoutInviteRedPoint()
end

function InviteCodeModel.checkoutInviteRedPoint(slot0)
	slot1 = false

	if slot0.teskData then
		for slot5, slot6 in pairs(slot0.teskData) do
			if slot6.had < slot6.num then
				slot1 = true

				break
			end
		end
	end

	slot0.invite_redpoint = slot1

	WelfareController:getInstance():setWelfareStatus(WelfareIcon.invicode, slot1)
end

function InviteCodeModel.inviteRedPoint(slot0)
	if slot0.invite_redpoint then
		return slot0.invite_redpoint
	end

	return false
end

function InviteCodeModel.getInviteCodeFinishData(slot0, slot1)
	if slot0.teskData and slot0.teskData[slot1] then
		return slot0.teskData[slot1]
	end

	return {}
end

function InviteCodeModel.getInviteCodeTeskData(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(uv0) do
		slot6.status = 0

		if slot0.teskData[slot6.id] then
			if slot6.num <= slot0.teskData[slot6.id].had then
				slot6.status = 2
			else
				slot6.status = 1
			end
		end

		uv1(slot1, slot6)
	end

	slot0:setSortItem(slot1)

	return slot1
end

function InviteCodeModel.setSortItem(slot0, slot1)
	slot2 = {
		[0] = 2,
		1,
		3
	}

	uv0(slot1, function (slot0, slot1)
		if slot0.status ~= slot1.status then
			if uv0[slot0.status] and uv0[slot1.status] then
				return uv0[slot0.status] < uv0[slot1.status]
			else
				return false
			end
		else
			return slot0.id < slot1.id
		end
	end)
end

function InviteCodeModel.setFriendChatData(slot0)
	if slot0.friend_data then
		for slot4, slot5 in pairs(slot0.friend_data) do
			slot0.friend_chat_data[getNorKey(slot5.rid, slot5.srv_id)] = slot5
		end
	end
end

function InviteCodeModel.addFriendChatData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	if slot0.friend_chat_data[getNorKey(slot1.rid, slot1.srv_id)] == nil then
		slot0.friend_chat_data[slot2] = slot1
	end
end

function InviteCodeModel.getFriendChatData(slot0, slot1, slot2)
	if slot0.friend_chat_data then
		return slot0.friend_chat_data[getNorKey(slot1, slot2)] or nil
	end

	return nil
end

function InviteCodeModel.setAlreadyFriendData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0.friend_data[getNorKey(slot6.rid, slot6.srv_id)] = slot6
	end

	slot0:setFriendChatData()
end

function InviteCodeModel.getAlreadyFriendData(slot0)
	if not slot0.friend_data or next(slot0.friend_data) == nil then
		return {}
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0.friend_data) do
		uv0(slot1, slot6)
	end

	return slot1
end

function InviteCodeModel.setUpdataAlreadyFriendData(slot0, slot1)
	if not slot0.friend_data or not slot1 then
		return
	end

	for slot5, slot6 in pairs(slot0.friend_data) do
		slot0.friend_data[getNorKey(slot6.rid, slot6.srv_id)] = slot6
	end

	slot0.friend_data[getNorKey(slot1.rid, slot1.srv_id)] = slot1

	slot0:setFriendChatData()
end

function InviteCodeModel.getFirendNum(slot0)
	return #slot0:getAlreadyFriendData() or 0
end

function InviteCodeModel.setFriendReturnData(slot0)
	if Config.InviteCodeData.data_return_list then
		slot0.return_list = {}

		for slot5, slot6 in pairs(slot1) do
			uv0(slot0.return_list, slot6)
		end

		uv1(slot0.return_list, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
	end
end

function InviteCodeModel.getFriendReturnData(slot0)
	if slot0.return_list then
		return slot0.return_list
	end

	return nil
end

function InviteCodeModel.setReturnReawrdList(slot0, slot1)
	if slot1 and slot1.list then
		slot0.reward_list = {}

		for slot5, slot6 in pairs(slot1.list) do
			slot0.reward_list[slot6.id] = slot6
		end

		slot0:checkRedPoint()
	end
end

function InviteCodeModel.getReturnReawrdList(slot0, slot1)
	if slot0.reward_list and slot0.reward_list[slot1] then
		return slot0.reward_list[slot1]
	end

	return nil
end

function InviteCodeModel.setUpdataReturnReawrdList(slot0, slot1)
	if slot1 then
		if slot0.reward_list and slot0.reward_list[slot1.id] then
			slot0.reward_list[slot1.id].num = slot1.num
			slot0.reward_list[slot1.id].had = slot1.had
		end

		slot0:checkRedPoint()
	end
end

function InviteCodeModel.checkRedPoint(slot0)
	if slot0.reward_list then
		if ReturnActionController:getInstance():getModel():getActionIsOpen() == 0 then
			return
		end

		slot2 = false

		if SHOW_SINGLE_INVICODE then
			for slot6, slot7 in pairs(slot0.reward_list) do
				if slot7.had < slot7.num then
					slot2 = true

					break
				end
			end
		end

		slot0.return_redpoint = slot2

		WelfareController:getInstance():setWelfareStatus(WelfareIcon.invicode, slot2)
	end
end

function InviteCodeModel.getReturnRedPoint(slot0)
	if slot0.return_redpoint then
		return slot0.return_redpoint
	end

	return false
end

function InviteCodeModel.setOpenServerTime(slot0, slot1)
	if slot1 and slot1.open_timestamp then
		slot0.open_timestamp = slot1.open_timestamp
	end
end

function InviteCodeModel.getOpenServerTime(slot0)
	if slot0.open_timestamp ~= nil then
		return slot0.open_timestamp
	end

	return 0
end

function InviteCodeModel.__delete(slot0)
end
