ElfinHatchVo = ElfinHatchVo or BaseClass(EventDispatcher)

function ElfinHatchVo.__init(slot0)
	slot0.id = 0
	slot0.state = ElfinConst.Hatch_Status.Open
	slot0.is_open = 0
	slot0.lev = 0
	slot0.do_id = 0
	slot0.need_point = 0
	slot0.do_point = 0
	slot0.all_end_time = 0
	slot0.sort = 0
end

function ElfinHatchVo.updateData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end

	slot0:dispatchUpdateAttrByKey()
end

function ElfinHatchVo.dispatchUpdateAttrByKey(slot0)
	slot0:Fire(ElfinEvent.Update_Elfin_Hatch_Vo_Event, slot0.id)
end

function ElfinHatchVo.__delete(slot0)
end
