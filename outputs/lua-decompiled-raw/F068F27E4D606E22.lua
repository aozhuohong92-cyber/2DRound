CrossarenaModel = CrossarenaModel or BaseClass()

function CrossarenaModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function CrossarenaModel.config(slot0)
	slot0.myBaseInfo = {}
	slot0.challengeRoleData = {}
	slot0.challengeAwardData = {}
	slot0.crossarenaStatus = CrossarenaConst.Open_Status.Close
	slot0.honourRoleData = {}
	slot0.arena_red_list = {}
end

function CrossarenaModel.setCrossarenaMyBaseInfo(slot0, slot1)
	slot0.myBaseInfo = slot1
end

function CrossarenaModel.updateRefreshTime(slot0, slot1)
	if slot0.myBaseInfo and slot1 then
		slot0.myBaseInfo.ref_time = slot1
	end
end

function CrossarenaModel.getCrossarenaMyBaseInfo(slot0)
	return slot0.myBaseInfo
end

function CrossarenaModel.getMyCrossarenaScore(slot0)
	if slot0.myBaseInfo then
		return slot0.myBaseInfo.score or 0
	end

	return 0
end

function CrossarenaModel.setCrossarenaAutoBattle(slot0, slot1)
	if slot0.myBaseInfo then
		slot0.myBaseInfo.is_auto = slot1
	end
end

function CrossarenaModel.getCrossarenaAutoBattle(slot0)
	if slot0.myBaseInfo then
		return slot0.myBaseInfo.is_auto or 0
	end

	return 0
end

function CrossarenaModel.getCrossarenaChallengeNum(slot0)
	if slot0.myBaseInfo then
		return slot0.myBaseInfo.season_combat_num or 0
	end

	return 0
end

function CrossarenaModel.checkIsCanHideTwoTeam(slot0)
	if Config.ArenaClusterData.data_const.second_hide_rank and slot0.myBaseInfo and slot0.myBaseInfo.rank and slot0.myBaseInfo.rank > 0 and slot0.myBaseInfo.rank <= slot1.val then
		return true
	end

	return false
end

function CrossarenaModel.setChallengeRoleData(slot0, slot1)
	slot0.challengeRoleData = slot1
end

function CrossarenaModel.updateChallengeRoleData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		for slot10, slot11 in pairs(slot0.challengeRoleData) do
			if slot6.idx == slot11.idx then
				slot0.challengeRoleData[slot10] = slot6

				GlobalEvent:getInstance():Fire(CrossarenaEvent.Update_Single_Challenge_Role_Event, slot6)

				break
			end
		end
	end
end

function CrossarenaModel.getChallengeRoleData(slot0)
	return slot0.challengeRoleData
end

function CrossarenaModel.checkIsHaveChallengeData(slot0)
	if slot0.challengeRoleData and next(slot0.challengeRoleData) ~= nil then
		return true
	end

	return false
end

function CrossarenaModel.setChallengeAwardData(slot0, slot1)
	slot0.challengeAwardData = slot1

	slot0:checkCrossarenaPrompt()
end

function CrossarenaModel.checkCrossarenaPrompt(slot0)
	if not ArenapeakchampionController:getInstance():getModel():isBeforeOpenMacthTime() then
		return
	end

	if slot0:getCrossarenaStatus() and slot2 == CrossarenaConst.Open_Status.Open and slot0.challengeAwardData and slot0.challengeAwardData.had_combat_num <= 0 then
		PromptController:getInstance():getModel():addPromptData({
			type = PromptTypeConst.Corss_arena_tips
		})
	else
		PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.Corss_arena_tips)
	end
end

function CrossarenaModel.getChallengeAwardData(slot0)
	return slot0.challengeAwardData
end

function CrossarenaModel.getChallengeAwardStatus(slot0, slot1)
	slot2 = 1

	if slot0.challengeAwardData.had_combat_num and slot1 <= slot0.challengeAwardData.had_combat_num then
		slot2 = 2

		for slot6, slot7 in pairs(slot0.challengeAwardData.num_list or {}) do
			if slot7.num == slot1 then
				slot2 = 3

				break
			end
		end
	end

	return slot2
end

function CrossarenaModel.checkIsHaveAwardData(slot0)
	if slot0.challengeAwardData and next(slot0.challengeAwardData) ~= nil then
		return true
	end

	return false
end

function CrossarenaModel.setCrossarenaStatus(slot0, slot1)
	slot0.crossarenaStatus = slot1

	if not slot0._first_login_flag and slot1 == CrossarenaConst.Open_Status.Open then
		slot0._first_login_flag = true

		slot0:updateCrossarenaRedStatus(CrossarenaConst.Red_Index.Open, true)
	else
		slot0:updateCrossarenaRedStatus(CrossarenaConst.Red_Index.Open, false)
	end
end

function CrossarenaModel.getCrossarenaStatus(slot0)
	return slot0.crossarenaStatus
end

function CrossarenaModel.checkCrossarenaIsOpen(slot0)
	if slot0.crossarenaStatus == CrossarenaConst.Open_Status.Open then
		return true
	end

	if Config.ArenaClusterData.data_const.close_attention then
		message(slot1.desc)
	end

	return false
end

function CrossarenaModel.getCrossarenaIsOpen(slot0, slot1)
	if not Config.ArenaClusterData then
		return false
	end

	slot3 = Config.ArenaClusterData.data_const.lev_limt

	if RoleController:getInstance():getRoleVo() and slot2.lev < slot3.val then
		if not slot1 then
			message(slot3.desc)
		end

		return false, slot3.desc
	end

	if RoleController:getInstance():getModel():getWorldLev() < Config.ArenaClusterData.data_const.world_lev_open.val then
		if not slot1 then
			message(slot5.desc)
		end

		return false, slot5.desc
	end

	return true
end

function CrossarenaModel.getCrossarenaRankAward(slot0, slot1)
	for slot5, slot6 in pairs(Config.ArenaClusterData.data_rank_award) do
		if slot1 <= slot6.max and slot6.min <= slot1 then
			return slot6.items
		end
	end
end

function CrossarenaModel.setHonourRoleData(slot0, slot1)
	slot0.honourRoleData = slot1
	slot2 = false

	for slot6, slot7 in pairs(slot0.honourRoleData) do
		if slot7.worship_status == 0 then
			slot2 = true

			break
		end
	end

	slot0:updateCrossarenaRedStatus(CrossarenaConst.Red_Index.Like, slot2)
end

function CrossarenaModel.getHonourRoleData(slot0)
	return slot0.honourRoleData
end

function CrossarenaModel.updateCrossarenaRedStatus(slot0, slot1, slot2)
	if slot0.arena_red_list[slot1] == slot2 then
		return
	end

	slot0.arena_red_list[slot1] = slot2

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.ladder, {
		bid = CrossgroundConst.Red_Type.crossArena,
		status = slot0:checkCrossarenaRedStatus()
	})
	GlobalEvent:getInstance():Fire(CrossarenaEvent.Update_Red_Status_Event, slot1, slot2)
end

function CrossarenaModel.checkCrossarenaRedStatus(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.arena_red_list) do
		if slot6 == true then
			slot1 = true

			break
		end
	end

	return slot1
end

function CrossarenaModel.getCrossarenaRedStatus(slot0, slot1)
	return slot0.arena_red_list[slot1] or false
end

function CrossarenaModel.__delete(slot0)
end
