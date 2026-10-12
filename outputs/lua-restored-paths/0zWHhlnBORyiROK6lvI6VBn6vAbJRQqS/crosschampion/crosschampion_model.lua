CrosschampionModel = CrosschampionModel or BaseClass()

function CrosschampionModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function CrosschampionModel.config(slot0)
	slot0.champion_red_list = {}
end

function CrosschampionModel.updateChampionBaseInfo(slot0, slot1)
	slot0.base_info = slot1

	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateChampionBaseInfoEvent, slot1)
end

function CrosschampionModel.getBaseInfo(slot0)
	return slot0.base_info
end

function CrosschampionModel.setRoleInfo(slot0, slot1)
	slot0.role_info = slot1

	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateChampionRoleInfoEvent, slot1)
end

function CrosschampionModel.getRoleInfo(slot0)
	return slot0.role_info
end

function CrosschampionModel.getMyMatchStatus(slot0)
	if slot0.base_info and slot0.role_info then
		if slot0.base_info.step == ArenaConst.champion_step.unopened then
			return ArenaConst.champion_my_status.unopened
		elseif slot0.base_info.step == ArenaConst.champion_step.score and slot0.base_info.step_status == ArenaConst.champion_step_status.unopened then
			return ArenaConst.champion_my_status.unopened
		elseif slot0.role_info.rank == 0 then
			return ArenaConst.champion_my_status.unjoin
		else
			return ArenaConst.champion_my_status.in_match
		end
	end

	return ArenaConst.champion_my_status.unopened
end

function CrosschampionModel.getOpenCrosschampionViewStatus(slot0)
	if slot0.base_info and (slot0.base_info.step ~= ArenaConst.champion_step.match_8 or slot0.base_info.step_status ~= ArenaConst.champion_step_status.over) then
		return true
	end

	return false
end

function CrosschampionModel.checkCrossChampionIsOpen(slot0, slot1)
	slot2 = false
	slot3 = RoleController:getInstance():getRoleVo()

	if Config.ArenaClusterChampionData.data_const.guess_lev_limit and slot3 and slot4.val <= slot3.lev then
		slot2 = true
	end

	if slot2 == false and slot4 and not slot1 then
		message(slot4.desc)
	end

	return slot2
end

function CrosschampionModel.setTopThreeRoleData(slot0, slot1)
	slot0.top_three_role_data = slot1 or {}

	slot0:checkTopThreeWorshipRedStatus()
end

function CrosschampionModel.updateTopThreeRoleWorshipStatus(slot0, slot1, slot2)
	if slot0.top_three_role_data then
		for slot6, slot7 in pairs(slot0.top_three_role_data) do
			if slot7.rid == slot1 and slot7.srv_id == slot2 then
				slot7.worship_status = 1

				break
			end
		end
	end

	slot0:checkTopThreeWorshipRedStatus()
end

function CrosschampionModel.checkTopThreeWorshipRedStatus(slot0)
	slot1 = false

	if slot0.top_three_role_data and next(slot0.top_three_role_data) ~= nil then
		slot2 = RoleController:getInstance():getRoleVo()

		for slot6, slot7 in pairs(slot0.top_three_role_data) do
			if slot7.worship_status == 0 and slot2 and not slot2:isSameRole(slot7.srv_id, slot7.rid) then
				slot1 = true

				break
			end
		end
	end

	slot0:updateCrosschampionRedStatus(CrosschampionConst.Red_Type.Worship, slot1)
end

function CrosschampionModel.updateCrosschampionRedStatus(slot0, slot1, slot2)
	if slot0.champion_red_list[slot1] == slot2 then
		return
	end

	slot0.champion_red_list[slot1] = slot2

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.ladder, {
		bid = CrossgroundConst.Red_Type.crosschampion,
		status = slot0:checkCrosschampionRedStatus()
	})
	GlobalEvent:getInstance():Fire(CrosschampionEvent.Update_Red_Status_Event, slot1, slot2)
end

function CrosschampionModel.checkCrosschampionRedStatus(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.champion_red_list) do
		if slot6 == true then
			slot1 = true

			break
		end
	end

	return slot1
end

function CrosschampionModel.getCrossarenaRedStatus(slot0, slot1)
	return slot0.champion_red_list[slot1] or false
end

function CrosschampionModel.__delete(slot0)
end
