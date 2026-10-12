FriendVo = FriendVo or BaseClass(EventDispatcher)
FriendVo.UPDATE_FRIEND_ATTR_LOGIN_OUT_TIME = "UPDATE_FRIEND_ATTR_LOGIN_OUT_TIME"

function FriendVo.__init(slot0, ...)
	slot0.srv_id = ""
	slot0.rid = 0
	slot0.name = ""
	slot0.sex = 1
	slot0.lev = 0
	slot0.career = 1
	slot0.power = 0
	slot0.login_time = 0
	slot0.login_out_time = 0
	slot0.face_id = 0
	slot0.is_online = 1
	slot0.group_id = 0
	slot0.is_cross = 0
	slot0.intimacy = 0
	slot0.is_vip = 0
	slot0.avatar_bid = 0
	slot0.gift_status = 1
	slot0.gid = 0
	slot0.gsrv_id = ""
	slot0.is_moshengren = 0
	slot0.talk_time = 0
	slot0.dun_id = 0
	slot0.gname = ""
	slot0.main_partner_id = 0
	slot0.partner_bid = 0
	slot0.partner_lev = 0
	slot0.partner_star = 0
	slot0.is_awake = 0
	slot0.is_used = 0
	slot0.is_present = 0
	slot0.is_draw = 0
	slot0.face_file = ""
	slot0.face_update_time = 0
	slot0.is_home = 0
	slot0.soft = 0
end

function FriendVo.setData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot0[slot5] then
			slot0[slot5] = slot6
		end
	end
end

function FriendVo.update(slot0, slot1, slot2)
	if slot0[slot1] then
		slot0[slot1] = slot2

		if slot1 == "login_out_time" then
			slot0:Fire(FriendVo.UPDATE_FRIEND_ATTR_LOGIN_OUT_TIME, slot0)
		end
	end
end

function FriendVo.setKey(slot0, slot1, slot2)
	slot0[slot1] = slot2
end

function FriendVo.__delete(slot0, ...)
end
