ChatVo = ChatVo or BaseClass()

function ChatVo.__init(slot0)
	slot0.channel = 0
	slot0.id = 0
	slot0.type = 0
	slot0.rid = 0
	slot0.srv_id = 0
	slot0.name = 0
	slot0.lev = 0
	slot0.career = 0
	slot0.face_id = 0
	slot0.len = 0
	slot0.msg = 0
	slot0.sex = 0
	slot0.tick = nil
	slot0.flag = nil
	slot0.vip_lev = 0
	slot0.is_show_vip = 0
	slot0.capacity = 0
	slot0.head_bid = 0
	slot0.gid = 0
	slot0.gsrv_id = ""
	slot0.gname = ""
	slot0.province = ""
	slot0.city = ""
	slot0.bubble_bid = 0
	slot0.ext_list = {}
	slot0.face_file = ""
	slot0.face_update_time = 0
end

function ChatVo.setObjectAttr(slot0, slot1)
	slot0.id = slot1.id
	slot0.type = slot1.type
	slot0.len = slot1.len
	slot0.msg = slot1.msg
	slot0.tick = slot1.tick
	slot0.flag = slot1.flag
end

function ChatVo.setMessageAttr(slot0, slot1)
	slot0.rid = slot1.rid or 0
	slot0.srv_id = slot1.srv_id or 0
	slot0.name = slot1.name or ""
	slot0.lev = slot1.lev or 0
	slot0.face_id = slot1.face_id or 0
	slot0.career = slot1.career or 1
	slot0.sex = slot1.sex or 0
	slot0.vip_lev = slot1.vip_lev or 0
	slot0.is_show_vip = slot1.is_show_vip or 0
	slot0.capacity = slot1.capacity or 0
	slot0.head_bid = slot1.head_bid or 0
	slot0.gid = slot1.gid or 0
	slot0.gsrv_id = slot1.gsrv_id or ""
	slot0.gname = slot1.g_name or ""
	slot0.province = slot1.province or ""
	slot0.city = slot1.city or ""
	slot0.ext_list = slot1.ext_list or {}
	slot0.face_file = slot1.face_file or ""
	slot0.face_update_time = slot1.face_update_time or 0

	if slot1.chat_bubble then
		slot0.bubble_bid = slot1.chat_bubble
	elseif slot1.bubble_bid then
		slot0.bubble_bid = slot1.bubble_bid
	else
		slot0.bubble_bid = 0
	end
end

function ChatVo.getChatId(slot0)
	return slot0.srv_id .. "_" .. slot0.rid
end

PrivateChatVo = PrivateChatVo or BaseClass()

function PrivateChatVo.__init(slot0)
	slot0.flag = 0
	slot0.rid = 0
	slot0.srv_id = 0
	slot0.name = 0
	slot0.lev = 0
	slot0.career = 0
	slot0.face_id = 0
	slot0.len = 0
	slot0.msg = 0
	slot0.sex = 0
	slot0.talk_time = 0
	slot0.capacity = 0
	slot0.head_bid = 0
	slot0.other_rid = 0
	slot0.other_srv_id = 0
	slot0.other_name = 0
	slot0.other_lev = 0
	slot0.other_face_id = 0
	slot0.face_file = ""
	slot0.face_update_time = 0
end

function PrivateChatVo.setChatVo(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end
end

function PrivateChatVo.isChatNow(slot0, slot1, slot2)
	if slot0.srv_id == slot1 and slot0.rid == slot2 then
		return true
	end
end

function PrivateChatVo.isMine(slot0)
	if slot0.flag == 1 then
		return true
	end
end

function PrivateChatVo.isOhter(slot0)
	if slot0.flag == 2 then
		return true
	end
end
