HeavenCustomsVo = HeavenCustomsVo or BaseClass(EventDispatcher)

function HeavenCustomsVo.__init(slot0)
	slot0.chapter_id = 0
	slot0.id = 0
	slot0.state = 0
	slot0.star = 0
	slot0.star_info = {}
end

function HeavenCustomsVo.updateData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end

	slot0:dispatchUpdateAttrByKey()
end

function HeavenCustomsVo.dispatchUpdateAttrByKey(slot0)
	slot0:Fire(HeavenEvent.Update_Customs_Vo_Event)
end

function HeavenCustomsVo.__delete(slot0)
end
