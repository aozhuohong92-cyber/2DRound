Stone_dungeonModel = Stone_dungeonModel or BaseClass()
slot0 = table.insert
slot1 = Config.DungeonStoneData.data_type_open

function Stone_dungeonModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function Stone_dungeonModel.config(slot0)
	slot0.change_count = {}
	slot0.passClearanceId = {}
end

function Stone_dungeonModel.setPassClearanceID(slot0, slot1)
	if slot1 and next(slot1) ~= nil then
		for slot5, slot6 in pairs(slot1) do
			slot0.passClearanceId[slot6.id] = {
				status = 1
			}
		end
	end
end

function Stone_dungeonModel.getPassClearanceID(slot0, slot1)
	if not slot0.passClearanceId then
		return nil
	end

	return slot0.passClearanceId[slot1]
end

function Stone_dungeonModel.setChangeSweepCount(slot0, slot1)
	if slot1 and next(slot1) ~= nil then
		for slot5, slot6 in pairs(slot1) do
			if slot6 and slot6.type and slot6.day_num then
				slot0.change_count[slot6.type] = slot6.day_num
			end
		end
	end

	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.esecsice, {
		bid = RedPointType.dungeonstone,
		status = slot0:checkRedStatus()
	})
end

function Stone_dungeonModel.getChangeSweepCount(slot0, slot1)
	if slot0.change_count and slot0.change_count[slot1] then
		return slot0.change_count[slot1] or 0
	end

	return 0
end

function Stone_dungeonModel.checkRedStatus(slot0)
	if Config.DungeonStoneData.data_type_open and slot1[1] and slot1[1].activate then
		if MainuiController:getInstance():checkIsOpenByActivate(slot1[1].activate) == false then
			return false
		end

		if not slot0.change_count then
			return
		end

		for slot7 = 1, Config.DungeonStoneData.data_type_open_length do
			if (slot0.change_count[slot7] or 0) < 2 and (MainuiController:getInstance():checkIsOpenByActivate(slot1[slot7].activate) or false) == true then
				return true
			end
		end

		return false
	end

	return false
end

function Stone_dungeonModel.__delete(slot0)
end
