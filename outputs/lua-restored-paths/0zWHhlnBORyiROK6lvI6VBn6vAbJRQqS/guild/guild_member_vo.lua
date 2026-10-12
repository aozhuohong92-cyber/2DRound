GuildMemberVo = GuildMemberVo or BaseClass(EventDispatcher)

function GuildMemberVo.__init(slot0)
	slot0.rid = 0
	slot0.srv_id = ""
	slot0.name = ""
	slot0.lev = 0
	slot0.face = 0
	slot0.post = 0
	slot0.online = 0
	slot0.vip_lev = 0
	slot0.power = 0
	slot0.join_time = 0
	slot0.login_time = 0
	slot0.donate = 0
	slot0.day_donate = 0
	slot0.avatar_bid = 0
	slot0.sex = 0
	slot0.day_dun_time = 0
	slot0.day_war_time = 0
	slot0.role_post = GuildConst.post_type.member
end

function GuildMemberVo.updateData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if type(slot6) ~= "table" then
			slot0:setGuildAttribute(slot5, slot6)
		end
	end
end

function GuildMemberVo.setGuildAttribute(slot0, slot1, slot2)
	if slot0[slot1] ~= slot2 then
		slot0[slot1] = slot2

		slot0:dispatchUpdateAttrByKey(slot1, slot2)
	end

	if slot1 == "post" then
		slot0.post_sort = 99 - slot2
	end
end

function GuildMemberVo.dispatchUpdateAttrByKey(slot0, slot1, slot2)
	slot0:Fire(GuildEvent.UpdateMyMemberItemEvent, slot1, slot2)
end

function GuildMemberVo.__delete(slot0)
end
