ArenaModel = ArenaModel or BaseClass()

function ArenaModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function ArenaModel.config(slot0)
	slot0.arena_loop_red_list = {}
	slot0.had_combat_num = nil
end

function ArenaModel.updateMyLoopData(slot0, slot1)
	slot0.my_loop_data = slot1

	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateMyLoopData)
	slot0:updateArenaRedStatus(ArenaConst.red_type.loop_challenge, slot1.can_combat_num > 0 or false)
end

function ArenaModel.updateChallengeTimesAwards(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.had_combat_num = slot1.had_combat_num or 0

	for slot6, slot7 in pairs(Config.ArenaData.data_season_num_reward) do
		if slot1.had_combat_num and slot7.num <= slot1.had_combat_num then
			for slot11, slot12 in pairs(slot1.num_list) do
				if slot12 and slot12.num == slot7.num then
					slot2[slot6] = 2
				end
			end
		end
	end

	slot3 = false

	for slot7, slot8 in pairs({
		[slot6] = 0,
		[slot6] = 1
	}) do
		if slot8 == 1 then
			slot3 = true

			break
		end
	end

	slot0:updateArenaRedStatus(ArenaConst.red_type.loop_challenge, slot3)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateLoopChallengeTimesList, slot1)
end

function ArenaModel.getHadCombatNum(slot0)
	return slot0.had_combat_num or 0
end

function ArenaModel.updateArenaRedStatus(slot0, slot1, slot2)
	if slot0.arena_loop_red_list[slot1] == slot2 then
		return
	end

	slot0.arena_loop_red_list[slot1] = slot2

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.arena, {
		bid = slot1,
		status = slot2
	})
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateArenaRedStatus, slot1, slot2)
end

function ArenaModel.updateArenaLoopLogStatus(slot0, slot1)
	slot0:updateArenaRedStatus(ArenaConst.red_type.loop_log, slot1 == TRUE)
end

function ArenaModel.getLoopMatchRedStatus(slot0, slot1)
	return slot0.arena_loop_red_list[slot1] or false
end

function ArenaModel.checkLoopMatchRedStatus(slot0)
	for slot4, slot5 in pairs(slot0.arena_loop_red_list) do
		if slot5 == true then
			return true
		end
	end

	return false
end

function ArenaModel.getMyLoopData(slot0)
	return slot0.my_loop_data
end

function ArenaModel.getZoneConfig(slot0, slot1)
	if slot1 == nil and slot0.my_loop_data ~= nil then
		slot1 = slot0.my_loop_data.score
	end

	slot2 = nil
	slot3 = Config.ArenaData.data_cup[1]

	if slot1 == nil or slot1 < slot3.min_score then
		slot2 = slot3
	else
		for slot7, slot8 in ipairs(Config.ArenaData.data_cup) do
			if slot8.min_score <= slot1 and slot1 <= slot8.max_score then
				slot2 = slot8

				break
			end
		end
	end

	slot4 = nil
	slot5 = slot2.max_score + 1

	for slot9, slot10 in ipairs(Config.ArenaData.data_cup) do
		if slot10.min_score <= slot5 and slot5 <= slot10.max_score then
			slot4 = slot10

			break
		end
	end

	return slot2, slot4
end

function ArenaModel.updateLoopChallengeList(slot0, slot1)
	if slot0.loop_challenge_list == nil and slot1.type == 1 then
		return
	end

	if slot0.loop_challenge_list == nil then
		slot0.loop_challenge_list = {}
	end

	for slot5, slot6 in ipairs(slot1.f_list) do
		if slot0.loop_challenge_list[slot6.idx] == nil then
			slot0.loop_challenge_list[slot6.idx] = ArenaLoopChallengeVo.New()
		end

		slot0.loop_challenge_list[slot6.idx]:updatetAttributeData(slot6)
	end

	if slot1.type == 0 then
		GlobalEvent:getInstance():Fire(ArenaEvent.UpdateLoopChallengeList)
	end
end

function ArenaModel.getLoopChallengeList(slot0)
	return slot0.loop_challenge_list
end

function ArenaModel.cleanChallengeList(slot0)
	slot0.loop_challenge_list = nil
end

function ArenaModel.setJumpFightStatus(slot0, slot1)
	slot0.item_jump_status = slot1
end

function ArenaModel.getJumpFightStatus(slot0)
	if slot0.item_jump_status then
		return slot0.item_jump_status
	end

	return false
end

function ArenaModel.__delete(slot0)
end
