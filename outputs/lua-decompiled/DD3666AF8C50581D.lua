GuildWarPositionVo = GuildWarPositionVo or BaseClass(EventDispatcher)

function GuildWarPositionVo.__init(slot0)
	slot0.pos = 0
	slot0.rid = 0
	slot0.srv_id = 0
	slot0.name = ""
	slot0.lev = 0
	slot0.face = 0
	slot0.power = 0
	slot0.hp = 0
	slot0.hp_max = 0
	slot0.relic_def_count = 0
	slot0.status = GuildwarConst.position_status.normal
end

function GuildWarPositionVo.updateData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end

	slot0:dispatchUpdateAttrByKey()
end

function GuildWarPositionVo.dispatchUpdateAttrByKey(slot0)
	slot0:Fire(GuildwarEvent.UpdateGuildWarPositionDataEvent)
end

function GuildWarPositionVo.__delete(slot0)
end
