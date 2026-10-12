GodbattleModel = GodbattleModel or BaseClass()

function GodbattleModel.__init(slot0, slot1)
	slot0.ctrl = slot1
	slot0.had_request = false

	slot0:config()
end

function GodbattleModel.config(slot0)
	slot0.apply_status = 0
	slot0.role_list = {}
	slot0.guard_list = {}
	slot0.skill_list = {}
	slot0.self_info = nil
	slot0.reward_info = nil
	slot0.red_point = nil
	slot0.score_a = 0
	slot0.score_b = 0
end

function GodbattleModel.hadRequestStatus(slot0)
	return slot0.had_request
end

function GodbattleModel.updateApplyStatus(slot0, slot1)
	slot0.had_request = true
	slot0.apply_status = slot1
end

function GodbattleModel.getApplyStatus(slot0)
	return slot0.apply_status
end

function GodbattleModel.setRewardInfo(slot0, slot1)
	slot0.reward_info = {
		cnum_list = {},
		win_list = {}
	}

	for slot5, slot6 in pairs(slot1.cnum_list) do
		slot0.reward_info.cnum_list[slot6.num] = 1
	end

	for slot5, slot6 in pairs(slot1.win_list) do
		slot0.reward_info.win_list[slot6.num] = 1
	end

	slot0:recalcRedPoint()
end

function GodbattleModel.getRewardInfo(slot0)
	return slot0.reward_info
end

function GodbattleModel.updateTotalScore(slot0, slot1)
	slot0.score_a = slot1.score_a
	slot0.score_b = slot1.score_b

	GlobalEvent:getInstance():Fire(GodbattleEvent.UpdateTotalScoreEvent, slot1)
end

function GodbattleModel.setSelfInfo(slot0, slot1)
	slot0.self_info = slot1

	slot0:recalcRedPoint()
end

function GodbattleModel.getSelfInfo(slot0)
	return slot0.self_info
end

function GodbattleModel.recalcRedPoint(slot0)
	if slot0.reward_info == nil or slot0.self_info == nil then
		return
	end

	if slot0.apply_status ~= GodBattleConstants.apply_status.in_game then
		return false
	end

	if MainuiController:getInstance():getFunctionIconById(MainuiConst.icon.godbattle) == nil then
		return
	end

	slot2 = 0
	slot6 = slot0.self_info.group

	for slot6, slot7 in pairs(Config.ZsWarData.data_num_rewards[slot6]) do
		if slot7.type == 1 then
			if slot7.num <= slot0.self_info.win and slot0.reward_info.win_list[slot7.num] == nil then
				slot2 = 1

				break
			end
		elseif slot7.num <= slot0.self_info.cnum and slot0.reward_info.cnum_list[slot7.num] == nil then
			slot2 = 1

			break
		end
	end

	slot0.red_point = slot2

	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.godbattle, {
		bid = 1,
		num = slot2
	})
	GlobalEvent:getInstance():Fire(GodbattleEvent.UpdateRewardRedPoint, slot2)
end

function GodbattleModel.clearGodBattleData(slot0)
	slot0.role_list = {}
	slot0.guard_list = {}
	slot0.skill_list = {}
	slot0.self_info = nil
	slot0.reward_info = nil
end

function GodbattleModel.updateRoleMoveData(slot0, slot1)
	slot2 = nil
	slot3 = {}

	if slot1 ~= nil and next(slot1.role_move_list) ~= nil then
		for slot7, slot8 in ipairs(slot1.role_move_list) do
			if slot0.role_list[getNorKey(slot8.rid, slot8.srv_id)] ~= nil then
				slot2:initAttributeData(slot8)
			end

			table.insert(slot3, slot2)
		end

		GlobalEvent:getInstance():Fire(GodbattleEvent.MoveRoleEvent, slot3)
	end
end

function GodbattleModel.updateRoleData(slot0, slot1)
	slot2 = nil
	slot3 = {}
	slot4 = RoleController:getInstance():getRoleVo()

	for slot8, slot9 in ipairs(slot1.role_list) do
		if slot0.role_list[getNorKey(slot9.rid, slot9.srv_id)] == nil then
			slot0.role_list[getNorKey(slot9.rid, slot9.srv_id)] = UnitVo.New()
		end

		slot0.role_list[getNorKey(slot9.rid, slot9.srv_id)]:initAttributeData(slot9)

		slot10 = nil

		if slot9.camp == GodBattleConstants.camp.god then
			slot2.dir = 3

			if slot9.effect == GodBattleConstants.buff.cont_win then
				slot10 = Config.ZsWarData.data_const.god_change
			elseif slot9.effect == GodBattleConstants.buff.camp_change then
				slot10 = Config.ZsWarData.data_const.god_god
			else
				slot10 = Config.ZsWarData.data_const.god_born
			end
		elseif slot9.camp == GodBattleConstants.camp.devil then
			slot2.dir = 7
			slot10 = (slot9.effect ~= GodBattleConstants.buff.cont_win or Config.ZsWarData.data_const.imp_change) and (slot9.effect ~= GodBattleConstants.buff.camp_change or Config.ZsWarData.data_const.imp_god) and Config.ZsWarData.data_const.imp_born
		end

		if slot4 ~= nil and getNorKey(slot4.rid, slot4.srv_id) == getNorKey(slot9.rid, slot9.srv_id) then
			slot2.name_color = cc.c3b(20, 255, 50)

			GlobalEvent:getInstance():Fire(GodbattleEvent.UpdateSelfDataEvent, slot9.camp, slot9.score, slot9.win_acc, slot9.win_best)
		end

		if slot1.type ~= GodBattleConstants.update_type.update and slot10 ~= nil then
			slot2.body_res = slot10.val
		end

		table.insert(slot3, slot2)
	end

	GlobalEvent:getInstance():Fire(GodbattleEvent.AddRoleDataEvent, slot1.type, slot3)
end

function GodbattleModel.updateGuardData(slot0, slot1)
	slot2 = {}
	slot3 = nil

	for slot7, slot8 in ipairs(slot1.guard_list) do
		if slot1.type == 2 then
			if slot0.guard_list[slot8.id] ~= nil then
				table.insert(slot2, slot3)

				slot0.guard_list[slot8.id] = nil
			end
		else
			if slot0.guard_list[slot8.id] == nil then
				slot0.guard_list[slot8.id] = UnitVo.New()
			end

			slot0.guard_list[slot8.id]:initAttributeData(slot8)

			if slot8.camp == GodBattleConstants.camp.god then
				slot3.dir = 4

				if Config.ZsWarData.data_const.god_guard ~= nil then
					slot3.body_res = Config.ZsWarData.data_const.god_guard.val
				end
			elseif slot8.camp == GodBattleConstants.camp.devil then
				slot3.dir = 6

				if Config.ZsWarData.data_const.imp_guard ~= nil then
					slot3.body_res = Config.ZsWarData.data_const.imp_guard.val
				end
			end

			table.insert(slot2, slot3)
		end
	end

	if next(slot2) then
		GlobalEvent:getInstance():Fire(GodbattleEvent.AddGuardDataEvent, slot1.type, slot2)
	end
end

function GodbattleModel.getGodBattleRoleList(slot0)
	return slot0.role_list
end

function GodbattleModel.updateRoleSkillData(slot0, slot1)
	slot0.skill_list = slot1.skill_list

	GlobalEvent:getInstance():Fire(GodbattleEvent.UpdateSkillListEvent, slot1.skill_list)
end

function GodbattleModel.getGodBattleSkillList(slot0)
	return slot0.skill_list or {}
end

function GodbattleModel.__delete(slot0)
end
