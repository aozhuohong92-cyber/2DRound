GuildListVo = GuildListVo or BaseClass(EventDispatcher)

function GuildListVo.__init(slot0)
	slot0.gid = 0
	slot0.gsrv_id = ""
	slot0.name = ""
	slot0.lev = 0
	slot0.members_num = 0
	slot0.members_max = 0
	slot0.leader_name = 0
	slot0.apply_type = 0
	slot0.apply_lev = 0
	slot0.is_apply = FALSE
end

function GuildListVo.updateData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if type(slot6) ~= "table" then
			slot0:setGuildAttribute(slot5, slot6)
		end
	end
end

function GuildListVo.setGuildAttribute(slot0, slot1, slot2)
	if slot0[slot1] ~= slot2 then
		slot0[slot1] = slot2

		slot0:dispatchUpdateAttrByKey(slot1, slot2)
	end
end

function GuildListVo.dispatchUpdateAttrByKey(slot0, slot1, slot2)
	slot0:Fire(GuildEvent.UpdateGuildItemEvent, slot1, slot2)
end

function GuildListVo.__delete(slot0)
end
