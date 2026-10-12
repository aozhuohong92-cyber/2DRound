MonopolyGridVo = MonopolyGridVo or BaseClass(EventDispatcher)

function MonopolyGridVo.__init(slot0)
	slot0.index = 0
	slot0.step_id = 0
	slot0.map_id = 0
	slot0.grid_index = 0
	slot0.evt_type = MonopolyConst.Event_Type.Normal
end

function MonopolyGridVo.updateData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end

	slot0.grid_res_id = "grid_1"

	if Config.MonopolyMapsData.data_event_info[slot0.map_id] and slot2[slot0.evt_type] then
		slot0.res_data = slot2[slot0.evt_type].res_id or {}
		slot0.grid_res_id = slot2[slot0.evt_type].grid_res_id
		slot0.offset = slot2[slot0.evt_type].offset or {}
		slot0.show_ani = slot2[slot0.evt_type].show_ani or 0
	end
end

function MonopolyGridVo.__delete(slot0)
end
