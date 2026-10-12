GuildMyInfoVo = GuildMyInfoVo or BaseClass(EventDispatcher)

function GuildMyInfoVo.__init(slot0)
	slot0.gid = 0
	slot0.gsrv_id = ""
	slot0.name = ""
	slot0.lev = 0
	slot0.members_num = 0
	slot0.members_max = 0
	slot0.leader_name = 0
	slot0.rid = 0
	slot0.srv_id = ""
	slot0.sign = ""
	slot0.exp = 0
	slot0.day_exp = 0
	slot0.apply_type = 0
	slot0.apply_lev = 0
	slot0.apply_power = 0
	slot0.recruit_num = 0
	slot0.rank_idx = 0
	slot0.vitality = 0
end

function GuildMyInfoVo.updateData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if type(slot6) ~= "table" then
			slot0:setGuildAttribute(slot5, slot6)
		end
	end
end

function GuildMyInfoVo.setGuildAttribute(slot0, slot1, slot2)
	if slot0[slot1] ~= slot2 then
		slot0[slot1] = slot2

		slot0:dispatchUpdateAttrByKey(slot1, slot2)
	end
end

function GuildMyInfoVo.dispatchUpdateAttrByKey(slot0, slot1, slot2)
	slot0:Fire(GuildEvent.UpdateMyInfoEvent, slot1, slot2)
end

function GuildMyInfoVo.__delete(slot0)
end
