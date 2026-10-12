ArenaChampionModel = ArenaChampionModel or BaseClass()

function ArenaChampionModel.__init(slot0)
	slot0.arena_champion_red_list = {}
end

function ArenaChampionModel.updateChampionBaseInfo(slot0, slot1)
	slot0.base_info = slot1

	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateChampionBaseInfoEvent, slot1)
end

function ArenaChampionModel.getBaseInfo(slot0)
	return slot0.base_info
end

function ArenaChampionModel.getRoleInfo(slot0)
	return slot0.role_info
end

function ArenaChampionModel.getMyMatchStatus(slot0)
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

function ArenaChampionModel.setRoleInfo(slot0, slot1)
	slot0.role_info = slot1

	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateChampionRoleInfoEvent, slot1)
end
