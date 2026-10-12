FriendModel = FriendModel or BaseClass()

function FriendModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function FriendModel.config(slot0)
	slot0.list = {}
	slot0.apply = {}
	slot0.plist = {}
	slot0.onlinelist = {}
	slot0.blacklist = {}
	slot0.honey_list_count = 20
	slot0.last_select_group = 1
	slot0.last_select_friend_srv_id = nil
	slot0.last_select_friend_rid = nil
	slot0.present_count = 0
	slot0.draw_count = 0
	slot0.draw_total_count = 0
	slot0.last_select_index = 1
end

function FriendModel.add(slot0, slot1)
	if slot0.list[slot1.srv_id .. "_" .. slot1.rid] == nil then
		slot0.list[slot1.srv_id .. "_" .. slot1.rid] = slot1
	end
end

function FriendModel.addPchat(slot0, slot1)
	if slot0.plist[slot1.srv_id .. "_" .. slot1.rid] == nil then
		slot0.plist[slot1.srv_id .. "_" .. slot1.rid] = slot1
	end
end

function FriendModel.getOnlineFriendList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.list) do
		if slot6 and slot6.is_online == 1 then
			table.insert(slot1, slot6)
		end
	end

	return slot1
end

function FriendModel.getOpenHomeFriendList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.list) do
		if slot6 and slot6.is_home == 1 then
			table.insert(slot1, slot6)
		end
	end

	return slot1
end

function FriendModel.setApplyList(slot0, slot1)
	slot0.apply = slot1 or {}
end

function FriendModel.getApplyList(slot0)
	return slot0.apply or {}
end

function FriendModel.getApplyNum(slot0)
	for slot5, slot6 in pairs(slot0.apply) do
		slot1 = 0 + 1
	end

	return slot1
end

function FriendModel.del(slot0, slot1, slot2)
	if slot0.list[slot1 .. "_" .. slot2] then
		slot0.list[slot1 .. "_" .. slot2] = nil
	end
end

function FriendModel.updateVo(slot0, slot1, slot2, slot3, slot4)
	if slot0.list[slot1 .. "_" .. slot2] then
		slot5:update(slot3, slot4)
	end

	return slot5
end

function FriendModel.getAwardNum(slot0)
	for slot5, slot6 in pairs(slot0.list) do
		if slot6 and slot6.is_draw == 1 then
			slot1 = 0 + 1
		end
	end

	return slot1
end

function FriendModel.updateSingleFriendData(slot0, slot1, slot2, slot3)
	if slot0.list[slot1 .. "_" .. slot2] then
		slot0.list[slot4]:setData(slot3)
	end
end

function FriendModel.getVo(slot0, slot1, slot2)
	return slot0.list[slot1 .. "_" .. slot2]
end

function FriendModel.getArray(slot0, ...)
	slot1 = Array.New()

	for slot5, slot6 in pairs(slot0.list) do
		slot1:PushBack(slot6)
	end

	slot1:UpperSortByParams("is_online", "login_out_time", "lev", "power")

	return slot1
end

function FriendModel.getGroupList(slot0, slot1)
	slot2 = Array.New()

	for slot6, slot7 in pairs(slot0.list) do
		if slot7.is_cross == 1 and slot1 == "cross" then
			slot2:PushBack(slot7)
		elseif slot7.is_cross == 0 and slot1 == "alike" then
			slot2:PushBack(slot7)
		end
	end

	slot2:UpperSortByParams("is_online", "lev")

	return slot2
end

function FriendModel.getGroupOnlineAndTotal(slot0, slot1)
	slot3 = 0
	slot5 = slot0:getGroupList(slot1):GetSize()
	slot3 = slot5

	for slot9 = 1, slot5 do
		if slot4:Get(slot9 - 1).srv_id and slot10.rid and slot10.is_online == 1 then
			slot2 = 0 + 1
		end
	end

	return slot2, slot3
end

function FriendModel.getFriendOnlineAndTotal(slot0)
	slot1 = 0
	slot2 = 0

	if slot0.list then
		for slot6, slot7 in pairs(slot0.list) do
			if slot7 and slot7.srv_id and slot7.rid and slot7.is_online == 1 then
				slot1 = slot1 + 1
			end

			slot2 = slot2 + 1
		end
	end

	return slot1, slot2
end

function FriendModel.getHoneyListOnlineAndTotal(slot0, slot1)
	slot2 = 0
	slot5 = slot0:getHoneyList(slot1):GetSize()
	slot2 = slot5

	for slot9 = 1, slot5 do
		if slot4:Get(slot9 - 1).srv_id and slot10.rid and slot10.is_online == 1 then
			slot3 = 0 + 1
		end
	end

	return slot3, slot2
end

function FriendModel.getBlackListOnlineAndTotal(slot0)
	slot1 = 0

	for slot6, slot7 in pairs(slot0.blacklist) do
		if slot7.is_online == 1 then
			slot2 = 0 + 1
		end

		slot1 = slot1 + 1
	end

	return slot2, slot1
end

function FriendModel.getIndex(slot0, slot1, slot2)
	slot3 = slot0:getArray()
	slot7 = slot3

	for slot7 = 1, slot3.GetSize(slot7) do
		if slot3:Get(slot7 - 1).srv_id == slot1 and slot8.rid == slot2 then
			return slot7
		end
	end

	return nil
end

function FriendModel.isFriend(slot0, slot1, slot2)
	if slot1 == nil or slot2 == nil then
		return false
	end

	if slot0.list[slot1 .. "_" .. slot2] and slot3.is_moshengren == 0 then
		return true
	end

	return false
end

function FriendModel.isFriend2(slot0, slot1)
	if slot0.list[slot1] and slot2.is_moshengren == 0 then
		return true
	end

	return false
end

function FriendModel.setOnlineData(slot0, slot1)
	slot0.onlinelist = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.onlinelist[string.format("%s+%d", slot6.srv_id, slot6.id)] = 1
	end
end

function FriendModel.getOnlineData(slot0, slot1)
	if slot0.onlinelist[slot1] then
		return 1
	else
		return 0
	end
end

function FriendModel.setOnlineKey(slot0, slot1)
	slot0.onlinelist[slot1] = 1
end

function FriendModel.setFriendPresentCount(slot0, slot1)
	slot0.present_count = slot1
end

function FriendModel.getFriendPresentCount(slot0)
	return slot0.present_count
end

function FriendModel.setFriendDrawCount(slot0, slot1)
	slot0.draw_count = slot1
end

function FriendModel.getFriendDrawCount(slot0)
	return slot0.draw_count
end

function FriendModel.setFriendDrawTotalCount(slot0, slot1)
	slot0.draw_total_count = slot1
end

function FriendModel.getFriendDrawTotalCount(slot0)
	return slot0.draw_total_count
end

function FriendModel.initBlackList(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot1) do
		slot8 = FriendVo.New()

		slot8:setData(slot7)

		slot0.blacklist[slot7.rid .. "_" .. slot7.srv_id] = slot8
	end
end

function FriendModel.removeBlack(slot0, slot1, slot2)
	if slot1 and slot2 then
		slot0.blacklist[slot1 .. "_" .. slot2] = nil
	end
end

function FriendModel.getBlackArray(slot0)
	slot1 = Array.New()

	for slot5, slot6 in pairs(slot0.blacklist) do
		slot1:PushBack(slot6)
	end

	slot1:UpperSortByParams("is_online", "lev")

	return slot1
end

function FriendModel.isBlack(slot0, slot1, slot2)
	slot3 = false

	if slot1 and slot2 and slot0.blacklist[slot1 .. "_" .. slot2] then
		slot3 = true
	end

	return slot3
end

function FriendModel.setLastSelectGroup(slot0, slot1)
	slot0.last_select_group = slot1
end

function FriendModel.getLastSelectGroup(slot0)
	return slot0.last_select_group
end

function FriendModel.setLastSelectFriend(slot0, slot1, slot2)
	slot0.last_select_friend_srv_id = slot1
	slot0.last_select_friend_rid = slot2
end

function FriendModel.setLastSelectFriendIndex(slot0, slot1)
	slot0.last_select_index = slot1 or 1
end

function FriendModel.getLastSelectFriendIndex(slot0)
	return slot0.last_select_index
end

function FriendModel.getLastSelectFriend(slot0)
	return slot0.last_select_friend_srv_id, slot0.last_select_friend_rid
end

function FriendModel.__delete(slot0)
end
