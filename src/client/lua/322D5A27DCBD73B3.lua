GuildNoticeVo = GuildNoticeVo or BaseClass(EventDispatcher)

function GuildNoticeVo.__init(slot0)
	slot0.id = 0
	slot0.gid = 0
	slot0.gsrv_id = ""
	slot0.type = 0
	slot0.time = 0
	slot0.rid = 0
	slot0.srv_id = ""
	slot0.role_name = ""
	slot0.msg = ""
end

function GuildNoticeVo.updateData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if type(slot6) ~= "table" then
			slot0:setGuildAttribute(slot5, slot6)
		end
	end
end

function GuildNoticeVo.setGuildAttribute(slot0, slot1, slot2)
	if slot0[slot1] ~= slot2 then
		slot0[slot1] = slot2
	end
end

function GuildNoticeVo.__delete(slot0)
end
