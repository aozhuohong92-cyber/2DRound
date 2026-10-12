EscortModel = EscortModel or BaseClass()

function EscortModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function EscortModel.config(slot0)
	slot0.escort_base_info = {}
	slot0.escort_my_info = {}
	slot0.escort_max_info = {}
	slot0.escort_red_list = {}
	slot0.is_double_time = false
end

function EscortModel.updateEscortBaseInfo(slot0, slot1)
	slot0.escort_base_info = slot1

	GlobalEvent:getInstance():Fire(EscortEvent.UpdateEscortBaseEvent)
end

function EscortModel.getPlunderList(slot0)
	if slot0.escort_base_info then
		return slot0.escort_base_info.plunders
	end

	return {}
end

function EscortModel.setDoubleTimes(slot0, slot1)
	slot0.is_double_time = slot1 == TRUE
end

function EscortModel.isDoubleTimes(slot0)
	return slot0.is_double_time
end

function EscortModel.setMyInfo(slot0, slot1)
	slot3 = false

	if slot0.escort_my_info and slot0.escort_my_info.plunder_count and slot0.escort_my_info.plunder_count < slot1.plunder_count then
		slot3 = true
	end

	slot0.escort_my_info = slot1
	slot0.escort_red_list[RedPointType.escort] = slot0:getMyCount(EscortConst.times_type.escort) < slot0:getMyMaxCount(EscortConst.times_type.escort) and slot1.status == 0
	slot0.escort_red_list[RedPointType.escort_awards] = slot1.status == 1 and slot1.end_time <= GameNet:getInstance():getTime()
	slot0.escort_red_list[RedPointType.escort_plunder] = slot3

	GlobalEvent:getInstance():Fire(EscortEvent.UpdateEscortMyInfoEvent)
end

function EscortModel.getMyInfo(slot0)
	return slot0.escort_my_info
end

function EscortModel.checkRedStatus(slot0, slot1)
	if slot0.escort_red_list then
		if slot1 == nil then
			for slot5, slot6 in pairs(slot0.escort_red_list) do
				if slot6 == true then
					return true
				end
			end
		else
			for slot5, slot6 in pairs(slot0.escort_red_list) do
				if slot5 == slot1 then
					return slot6
				end
			end
		end
	end

	return false
end

function EscortModel.updateEscortRedStatus(slot0, slot1, slot2)
	if slot0.escort_red_list[slot1] == slot2 then
		return
	end

	slot0.escort_red_list[slot1] = slot2
end

function EscortModel.getMyCount(slot0, slot1)
	if slot0.escort_my_info == nil or slot0.escort_my_info.datas == nil then
		return 0
	end

	for slot5, slot6 in ipairs(slot0.escort_my_info.datas) do
		if slot6.id == slot1 then
			return slot6.val
		end
	end

	return 0
end

function EscortModel.getMyMaxCount(slot0, slot1)
	if slot0.escort_max_info[slot1] then
		return slot0.escort_max_info[slot1]
	end

	slot2 = nil

	if slot1 == EscortConst.times_type.escort then
		slot2 = Config.EscortData.data_const.escort_time
	elseif slot1 == EscortConst.times_type.plunder then
		slot2 = Config.EscortData.data_const.plunder_time
	elseif slot1 == EscortConst.times_type.atk_back then
		slot2 = Config.EscortData.data_const.revenge_time
	elseif slot1 == EscortConst.times_type.help then
		slot2 = Config.EscortData.data_const.request_time
	elseif slot1 == EscortConst.times_type.do_help then
		slot2 = Config.EscortData.data_const.help_time
	elseif slot1 == EscortConst.times_type.refresh then
		slot2 = Config.EscortData.data_const.free_refresh_time
	else
		return 0
	end

	if slot2 then
		slot0.escort_max_info[slot1] = slot2.val

		return slot2.val
	end
end

function EscortModel.__delete(slot0)
end
