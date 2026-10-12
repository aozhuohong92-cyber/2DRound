StartowerModel = StartowerModel or BaseClass()

function StartowerModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function StartowerModel.config(slot0)
	slot0.max_tower = 0
	slot0.less_count = 0
	slot0.buy_count = 0
	slot0.reward_list = {}
end

function StartowerModel.isInitStarTowerData(slot0)
	if next(slot0.reward_list) == nil then
		return false
	end

	return true
end

function StartowerModel.setStarTowerData(slot0, slot1)
	slot0.max_tower = slot1.max_tower or 0
	slot0.less_count = slot1.count or 0
	slot0.buy_count = slot1.buy_count or 0

	if next(slot1.award_list) ~= nil then
		for slot5, slot6 in pairs(slot1.award_list) do
			slot0.reward_list[slot6.id] = {
				id = slot6.id,
				status = slot6.status
			}
		end
	end

	slot0:checkRedPoint()
	GlobalEvent:getInstance():Fire(StartowerEvent.Update_All_Data)
end

function StartowerModel.setRewardData(slot0, slot1)
	if not slot0.reward_list or not slot1[1] then
		return
	end

	for slot5, slot6 in pairs(slot0.reward_list) do
		if slot6.id == slot1[1].id then
			slot0.reward_list[slot5].status = slot1[1].status

			break
		end
	end
end

function StartowerModel.sortFunc(slot0, slot1)
	slot2 = {
		[0] = 2,
		1,
		3
	}

	table.sort(slot1, function (slot0, slot1)
		if slot0.status ~= slot1.status then
			if uv0[slot0.status] and uv0[slot1.status] then
				return uv0[slot0.status] < uv0[slot1.status]
			else
				return false
			end
		else
			return slot0.id < slot1.id
		end
	end)

	return slot1
end

function StartowerModel.getRewardData(slot0, slot1)
	if not slot0.reward_list then
		return
	end

	if slot1 == nil then
		return slot0.reward_list or {}
	else
		return slot0.reward_list[slot1] or {}
	end
end

function StartowerModel.checkRedPoint(slot0)
	if StartowerController:getInstance():checkIsOpen() == false then
		return
	end

	slot2 = false

	for slot6, slot7 in pairs(slot0.reward_list) do
		if slot7.status == 1 then
			slot2 = true

			break
		end
	end

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.startower, {
		bid = 1,
		status = slot2 or slot0.less_count > 0
	})
end

function StartowerModel.updateMaxTower(slot0, slot1)
	if slot1 and slot1.max_tower and slot0.max_tower < slot1.max_tower then
		slot0.max_tower = slot1.max_tower
	end
end

function StartowerModel.updateLessCount(slot0, slot1)
	if slot1.count then
		slot0.less_count = slot1.count or 0

		slot0:checkRedPoint()
	end

	if slot1.buy_count then
		slot0.buy_count = slot1.buy_count
	end

	GlobalEvent:getInstance():Fire(StartowerEvent.Count_Change_Event)
end

function StartowerModel.getNowTowerId(slot0)
	return slot0.max_tower or 0
end

function StartowerModel.getTowerLessCount(slot0)
	return slot0.less_count
end

function StartowerModel.getBuyCount(slot0)
	return slot0.buy_count
end

function StartowerModel.__delete(slot0)
end
