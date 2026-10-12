ArenaEvent = ArenaEvent or {}
ArenaEvent.UpdateMyLoopData = "ArenaEvent.UpdateMyLoopData"
ArenaEvent.UpdateLoopChallengeTimesList = "ArenaEvent.UpdateLoopChallengeTimesList"
ArenaEvent.UpdateLoopChallengeList = "ArenaEvent.UpdateLoopChallengeList"
ArenaEvent.UpdateLoopChallengeListItem = "ArenaEvent.UpdateLoopChallengeListItem"
ArenaEvent.UpdateLoopChallengeStatueList = "ArenaEvent.UpdateLoopChallengeStatueList"
ArenaEvent.UpdateLoopChallengeRank = "ArenaEvent:UpdateLoopChallengeRank "
ArenaEvent.UpdateArenaRedStatus = "ArenaEvent.UpdateArenaRedStatus"
ArenaEvent.UpdateArena_Number = "ArenaEvent.UpdateArena_Number"
ArenaEvent.ArenaFightResultEvent = "ArenaEvent.ArenaFightResultEvent"
ArenaEvent.CheckFightInfoEvent = "ArenaEvent.CheckFightInfoEvent"
ArenaEvent.ChangeTanFromTop324 = "ArenaEvent.ChangeTanFromTop324"
ArenaEvent.UpdateChampionBaseInfoEvent = "ArenaEvent.UpdateChampionBaseInfoEvent"
ArenaEvent.UpdateChampionRoleInfoEvent = "ArenaEvent.UpdateChampionRoleInfoEvent"
ArenaEvent.UpdateChampionTop3Event = "ArenaEvent.UpdateChampionTop3Event"
ArenaEvent.UpdateMyMatchInfoEvent = "ArenaEvent.UpdateMyMatchInfoEvent"
ArenaEvent.UpdateGuessMatchInfoEvent = "ArenaEvent.UpdateGuessMatchInfoEvent"
ArenaEvent.UpdateBetMatchValueEvent = "ArenaEvent.UpdateBetMatchValueEvent"
ArenaEvent.UpdateMyGuessListEvent = "ArenaEvent.UpdateMyGuessListEvent"
ArenaEvent.UpdateChampionRankEvent = "ArenaEvent.UpdateChampionRankEvent"
ArenaEvent.UpdateTop32InfoEvent = "ArenaEvent.UpdateTop32InfoEvent"
ArenaEvent.UpdateTop4InfoEvent = "ArenaEvent.UpdateTop4InfoEvent"
ArenaEvent.UpdateTop324GuessGroupEvent = "ArenaEvent.UpdateTop324GuessGroupEvent"
ArenaEvent.UpdateTop324GroupPosEvent = "ArenaEvent.UpdateTop324GroupPosEvent"
ArenaEvent.UpdateRoleInfoBetEvent = "ArenaEvent.UpdateRoleInfoBetEvent"
ArenaEvent.UpdateMylogListEvent = "ArenaEvent.UpdateMylogListEvent"
ArenaConst = ArenaConst or {}
ArenaConst.arena_type = {
	loop = 1,
	rank = 2
}
ArenaConst.loop_index = {
	awards = 4,
	challenge = 1,
	rank = 3,
	activity = 2
}
ArenaConst.red_type = {
	loop_artivity = 2,
	loop_log = 4,
	champion_guess = 3,
	loop_challenge = 1
}
ArenaConst.champion_index = {
	match = 3,
	my_match_ready = 1,
	rank = 4,
	my_match = 5,
	guess = 2
}
ArenaConst.champion_step_status = {
	opened = 1,
	over = 2,
	unopened = 0
}
ArenaConst.champion_round_status = {
	fight = 3,
	guess = 2,
	prepare = 1
}
ArenaConst.champion_step = {
	unopened = 0,
	match_32 = 32,
	match_64 = 64,
	score = 1,
	match_8 = 8,
	match_4 = 4
}
ArenaConst.champion_my_status = {
	unopened = 0,
	unjoin = 1,
	in_match = 2
}
ArenaConst.champion_type = {
	cross = 2,
	normal = 1
}
ArenaConst.view_type = {
	elfin = 3,
	summon = 2,
	arena = 1
}

function ArenaConst.getMatchStepDesc(slot0)
	if slot0 == ArenaConst.champion_step.unopened then
		return TI18N("暂未开始")
	elseif slot0 == ArenaConst.champion_step.score then
		return TI18N("选拔赛")
	elseif slot0 == ArenaConst.champion_step.match_64 then
		return TI18N("64强赛")
	elseif slot0 == ArenaConst.champion_step.match_32 then
		return TI18N("32强赛")
	elseif slot0 == ArenaConst.champion_step.match_8 then
		return TI18N("8强赛")
	elseif slot0 == ArenaConst.champion_step.match_4 then
		return TI18N("4强赛")
	end

	return TI18N("暂未开始")
end

function ArenaConst.getMatchStepDesc2(slot0, slot1)
	if slot0 == ArenaConst.champion_step.match_64 then
		if slot1 <= 1 then
			return TI18N("32强赛")
		elseif slot1 == 2 then
			return TI18N("16强赛")
		else
			return TI18N("8强赛")
		end
	elseif slot0 == ArenaConst.champion_step.match_32 then
		if slot1 <= 1 then
			return TI18N("16强赛")
		elseif slot1 == 2 then
			return TI18N("8强赛")
		else
			return TI18N("4强赛")
		end
	elseif slot0 == ArenaConst.champion_step.match_8 then
		if slot1 == 1 then
			return TI18N("4强赛")
		elseif slot1 == 2 then
			return TI18N("半决赛")
		elseif slot1 == 3 then
			return TI18N("决赛")
		else
			return TI18N("本轮冠军赛已结束")
		end
	elseif slot0 == ArenaConst.champion_step.match_4 then
		if slot1 == 1 then
			return TI18N("半决赛")
		elseif slot1 == 2 then
			return TI18N("决赛")
		else
			return TI18N("本轮冠军赛已结束")
		end
	elseif slot0 == ArenaConst.champion_step.score then
		if slot1 == 0 then
			return TI18N("下次冠军赛")
		else
			return string.format(TI18N("%s第%s回合"), ArenaConst.getMatchStepDesc(slot0), slot1)
		end
	elseif slot0 == ArenaConst.champion_step.unopened then
		return TI18N("下次冠军赛")
	else
		return TI18N("冠军赛暂未开始")
	end
end

function ArenaConst.getGroup(slot0)
	if slot0 == 1 then
		return TI18N("A组")
	elseif slot0 == 2 then
		return TI18N("B组")
	elseif slot0 == 3 then
		return TI18N("C组")
	elseif slot0 == 4 then
		return TI18N("D组")
	elseif slot0 == 5 then
		return TI18N("E组")
	elseif slot0 == 6 then
		return TI18N("F组")
	elseif slot0 == 7 then
		return TI18N("G组")
	elseif slot0 == 8 then
		return TI18N("H组")
	else
		return ""
	end
end
