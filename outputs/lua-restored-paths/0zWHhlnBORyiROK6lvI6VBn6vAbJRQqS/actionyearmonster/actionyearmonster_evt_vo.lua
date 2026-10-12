ActionyearmonsterEvtVo = ActionyearmonsterEvtVo or BaseClass(EventDispatcher)

function ActionyearmonsterEvtVo.__init(slot0)
	slot0.index = 0
	slot0.evtid = 0
	slot0.status = PlanesConst.Evt_State.None
	slot0.platform = 0
	slot0.switch = 0
	slot0.is_hide = 0
	slot0.config = {}
end

function ActionyearmonsterEvtVo.updateData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6

		if slot5 == "evtid" then
			slot0.config = Config.HolidayNianData.data_evt_info[slot6] or {}
		end
	end

	slot0:dispatchUpdateAttrByKey()
end

function ActionyearmonsterEvtVo.dispatchUpdateAttrByKey(slot0)
	slot0:Fire(ActionyearmonsterEvent.Year_Update_Evt_Status_Event)
end

function ActionyearmonsterEvtVo.__delete(slot0)
end
