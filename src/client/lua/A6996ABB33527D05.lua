GuildWarBoxVo = GuildWarBoxVo or BaseClass(EventDispatcher)

function GuildWarBoxVo.__init(slot0)
	slot0.order = 0
	slot0.rid = 0
	slot0.sid = 0
	slot0.name = ""
	slot0.item_id = 0
	slot0.item_num = 0
	slot0.status = GuildwarConst.box_type.gold
end

function GuildWarBoxVo.updateData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end

	slot0:dispatchUpdateAttrByKey()
end

function GuildWarBoxVo.dispatchUpdateAttrByKey(slot0)
	slot0:Fire(GuildwarEvent.UpdateSingleBoxDataEvent)
end

function GuildWarBoxVo.__delete(slot0)
end
