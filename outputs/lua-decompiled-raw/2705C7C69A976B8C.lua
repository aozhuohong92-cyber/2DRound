BattleConst = BattleConst or {}
BattleConst.Fight_Type = {
	Default = 1,
	Escort = 13,
	WorldBoss = 5,
	LimitExercise = 29,
	EliteMatchWar = 23,
	Darma = 3,
	SandybeachBossFight = 12,
	CrossArenaWar = 28,
	ElementWar = 25,
	GuildSecretArea = 34,
	MonopolyWar_3 = 103,
	MonopolyWar_4 = 104,
	ExpeditFight = 21,
	MonopolyBoss = 105,
	Adventrue = 6,
	MonopolyWar_2 = 102,
	AreanManyPeople = 42,
	PlanesWar = 40,
	Endless = 11,
	Training_Camp = 36,
	WhiteDayWar = 41,
	HeroTestWar = 26,
	DungeonStone = 14,
	GuildDun = 9,
	Godbattle = 15,
	YuanZhenFight = 22,
	Arenapeakchampion = 37,
	EliteKingMatchWar = 24,
	CrossChampion = 31,
	GuildWar = 16,
	MonopolyWar_1 = 101,
	TermBeginsBoss = 33,
	SingleBoss = 4,
	LadderWar = 18,
	Champion = 10,
	PractiseTower = 43,
	Nil = 0,
	Arean_Team = 35,
	Arena = 2,
	TermBegins = 32,
	AdventrueMine = 30,
	HeavenWar = 27,
	YearMonsterWar = 39,
	PK = 8,
	PrimusWar = 17,
	StarTower = 7
}
BattleConst.Hook_Fight_Type = {
	Circle = 2,
	Round = 1
}
BattleConst.ShareType = {
	ShareGuildWar = 5,
	ShareTower = 7,
	ShareAreanManyPeople = 9,
	ShareElite = 6,
	ShareArena = 4,
	SharePlunder = 2,
	SharePlanes = 8,
	ShareLadder = 3,
	SharePk = 1
}

function BattleConst.getShareTypeByBattleType(slot0)
	if slot0 == BattleConst.Fight_Type.PK then
		return BattleConst.ShareType.SharePk
	elseif slot0 == BattleConst.Fight_Type.Arena then
		return BattleConst.ShareType.ShareArena
	elseif slot0 == BattleConst.Fight_Type.GuildWar then
		return BattleConst.ShareType.ShareGuildWar
	elseif slot0 == BattleConst.Fight_Type.LadderWar then
		return BattleConst.ShareType.ShareLadder
	elseif slot0 == BattleConst.Fight_Type.EliteMatchWar or slot0 == BattleConst.Fight_Type.EliteKingMatchWar then
		return BattleConst.ShareType.ShareElite
	elseif slot0 == BattleConst.Fight_Type.StarTower then
		return BattleConst.ShareType.ShareTower
	elseif slot0 == BattleConst.Fight_Type.PlanesWar then
		return BattleConst.ShareType.SharePlanes
	elseif slot0 == BattleConst.Fight_Type.AreanManyPeople then
		return BattleConst.ShareType.ShareAreanManyPeople
	end
end

function BattleConst.isNoRequest(slot0)
	return slot0 == BattleConst.Fight_Type.Default or slot0 == BattleConst.Fight_Type.PK or slot0 == BattleConst.Fight_Type.HeroTestWar
end

function BattleConst.isPvP(slot0)
	return slot0 == BattleConst.Fight_Type.Arena or slot0 == BattleConst.Fight_Type.Escort
end

function BattleConst.isNeedName(slot0)
	return slot0 == BattleConst.Fight_Type.PK
end

function BattleConst.canDoBattle(slot0)
	return BattleConst.getUIFightByFightType(slot0) == MainuiController:getInstance():getUIFightType() or BattleConst.isNoRequest(slot0) or BattleController:getInstance():getWatchReplayStatus()
end

function BattleConst.getUIFightByFightType(slot0)
	slot1 = MainuiConst.ui_fight_type.drama_scene

	if slot0 == BattleConst.Fight_Type.Darma or slot0 == BattleConst.Fight_Type.Nil then
		slot1 = MainuiConst.ui_fight_type.drama_scene
	elseif slot0 == BattleConst.Fight_Type.SingleBoss or slot0 == BattleConst.Fight_Type.WorldBoss then
		slot1 = MainuiConst.ui_fight_type.boss
	elseif slot0 == BattleConst.Fight_Type.StarTower then
		slot1 = MainuiConst.ui_fight_type.star_tower
	elseif slot0 == BattleConst.Fight_Type.GuildDun then
		slot1 = MainuiConst.ui_fight_type.guild_dun
	elseif slot0 == BattleConst.Fight_Type.Adventrue then
		slot1 = MainuiConst.ui_fight_type.sky_scene
	elseif slot0 == BattleConst.Fight_Type.Arena then
		slot1 = MainuiConst.ui_fight_type.arena
	elseif slot0 == BattleConst.Fight_Type.Endless then
		slot1 = MainuiConst.ui_fight_type.endless
	elseif slot0 == BattleConst.Fight_Type.Escort then
		slot1 = MainuiConst.ui_fight_type.escort
	elseif slot0 == BattleConst.Fight_Type.DungeonStone then
		slot1 = MainuiConst.ui_fight_type.dungeon_stone
	elseif slot0 == BattleConst.Fight_Type.Godbattle then
		slot1 = MainuiConst.ui_fight_type.godbattle
	elseif slot0 == BattleConst.Fight_Type.GuildWar then
		slot1 = MainuiConst.ui_fight_type.guildwar
	elseif slot0 == BattleConst.Fight_Type.PrimusWar then
		slot1 = MainuiConst.ui_fight_type.primusWar
	elseif slot0 == BattleConst.Fight_Type.LadderWar then
		slot1 = MainuiConst.ui_fight_type.ladderwar
	elseif slot0 == BattleConst.Fight_Type.ExpeditFight then
		slot1 = MainuiConst.ui_fight_type.expedit_fight
	elseif slot0 == BattleConst.Fight_Type.YuanZhenFight then
		slot1 = MainuiConst.ui_fight_type.yaunzhen_fight
	elseif slot0 == BattleConst.Fight_Type.EliteMatchWar or slot0 == BattleConst.Fight_Type.EliteKingMatchWar then
		slot1 = MainuiConst.ui_fight_type.eliteMatchWar
	elseif slot0 == BattleConst.Fight_Type.ElementWar then
		slot1 = MainuiConst.ui_fight_type.elementWar
	elseif slot0 == BattleConst.Fight_Type.HeavenWar then
		slot1 = MainuiConst.ui_fight_type.heavenwar
	elseif slot0 == BattleConst.Fight_Type.SandybeachBossFight then
		slot1 = MainuiConst.ui_fight_type.sandybeachBossFight
	elseif slot0 == BattleConst.Fight_Type.CrossArenaWar then
		slot1 = MainuiConst.ui_fight_type.crossarenawar
	elseif slot0 == BattleConst.Fight_Type.LimitExercise then
		slot1 = MainuiConst.ui_fight_type.limit_exercise
	elseif slot0 == BattleConst.Fight_Type.AdventrueMine then
		slot1 = MainuiConst.ui_fight_type.adventrueMine
	elseif slot0 == BattleConst.Fight_Type.CrossChampion then
		slot1 = MainuiConst.ui_fight_type.crosschampion
	elseif slot0 == BattleConst.Fight_Type.TermBegins or slot0 == BattleConst.Fight_Type.TermBeginsBoss then
		slot1 = MainuiConst.ui_fight_type.termbegins
	elseif slot0 == BattleConst.Fight_Type.GuildSecretArea then
		slot1 = MainuiConst.ui_fight_type.guildsecretarea
	elseif slot0 == BattleConst.Fight_Type.Arean_Team then
		slot1 = MainuiConst.ui_fight_type.areanTeam
	elseif slot0 == BattleConst.Fight_Type.MonopolyWar_1 then
		slot1 = MainuiConst.ui_fight_type.monopolywar_1
	elseif slot0 == BattleConst.Fight_Type.MonopolyWar_2 then
		slot1 = MainuiConst.ui_fight_type.monopolywar_2
	elseif slot0 == BattleConst.Fight_Type.MonopolyWar_3 then
		slot1 = MainuiConst.ui_fight_type.monopolywar_3
	elseif slot0 == BattleConst.Fight_Type.MonopolyWar_4 then
		slot1 = MainuiConst.ui_fight_type.monopolywar_4
	elseif slot0 == BattleConst.Fight_Type.MonopolyBoss then
		slot1 = MainuiConst.ui_fight_type.monopolyboss
	elseif slot0 == BattleConst.Fight_Type.Training_Camp then
		slot1 = MainuiConst.ui_fight_type.trainingcamp
	elseif slot0 == BattleConst.Fight_Type.PlanesWar then
		slot1 = MainuiConst.ui_fight_type.planeswar
	elseif slot0 == BattleConst.Fight_Type.YearMonsterWar then
		slot1 = MainuiConst.ui_fight_type.yearmonsterwar
	elseif slot0 == BattleConst.Fight_Type.WhiteDayWar then
		slot1 = MainuiConst.ui_fight_type.whitedaywar
	elseif slot0 == BattleConst.Fight_Type.AreanManyPeople then
		slot1 = MainuiConst.ui_fight_type.areanmanypeople
	elseif slot0 == BattleConst.Fight_Type.PractiseTower then
		slot1 = MainuiConst.ui_fight_type.practisetower
	end

	return slot1
end

function BattleConst.isBuffAdd(slot0)
	return slot0 == BattleConst.Fight_Type.Champion or slot0 == BattleConst.Fight_Type.PK
end

function BattleConst.isNeedTimer(slot0)
	return slot0 == BattleConst.Fight_Type.DanRace or slot0 == BattleConst.Fight_Type.Godbattle or slot0 == BattleConst.Fight_Type.ChiefWar or slot0 == BattleConst.Fight_Type.DiamondWar
end

function BattleConst.isNeedSpecStart(slot0)
	return slot0 == BattleConst.Fight_Type.Arena or slot0 == BattleConst.Fight_Type.Champion or slot0 == BattleConst.Fight_Type.PK or slot0 == BattleConst.Fight_Type.Godbattle or slot0 == BattleConst.Fight_Type.LadderWar or slot0 == BattleConst.Fight_Type.CrossArenaWar or slot0 == BattleConst.Fight_Type.CrossChampion
end

function BattleConst.isCanBattleAuto(slot0)
	return slot0 == BattleConst.Fight_Type.ChiefWar or slot0 == BattleConst.Fight_Type.Godbattle or slot0 == BattleConst.Fight_Type.TeamDungeon
end

function BattleConst.isShowRoundHands(slot0)
	return slot0 == BattleConst.Fight_Type.GuildBoss or slot0 == BattleConst.Fight_Type.BigWorldNoBattle or slot0 == BattleConst.Fight_Type.HeroBoss
end

function BattleConst.isShowRoundHands(slot0)
	return slot0 == BattleConst.Fight_Type.GuildBoss or slot0 == BattleConst.Fight_Type.BigWorldNoBattle or slot0 == BattleConst.Fight_Type.HeroBoss
end

function BattleConst.isNeedHandTimer(slot0)
	return slot0 == BattleConst.Fight_Type.PVP or slot0 == BattleConst.Fight_Type.SkyLadder or slot0 == BattleConst.Fight_Type.DiamondWar
end

function BattleConst.isEnterBackGroupNotPause(slot0)
	return slot0 == BattleConst.Fight_Type.Godbattle or slot0 == BattleConst.Fight_Type.DiamondWar or slot0 == BattleConst.Fight_Type.SkyLadder or slot0 == BattleConst.Fight_Type.DarmaBattle or slot0 == BattleConst.Fight_Type.ChiefWar
end

function BattleConst.isNeedChangeGroup(slot0)
	return slot0 == BattleConst.Fight_Type.TeamDungeon
end

function BattleConst.isExistsDungeonType(slot0)
	for slot4, slot5 in pairs(BattleConst.Fight_Type) do
		if slot0 == slot5 then
			return true
		end
	end

	return false
end

BattleConst.JumpType = {
	HeroBag = 2,
	Forge = 3,
	Summon = 1,
	Hallows = 4
}
BattleConst.Closed_Result_Type = {
	LimitGiftType = 3,
	TaskExpType = 2,
	LevelUpgradeType = 1
}
BattleConst.Old_Halo_Id_Change = {
	{
		1
	},
	{
		2
	},
	{
		3
	},
	{
		4
	},
	{
		5
	},
	{
		21
	},
	{
		6
	},
	{
		6
	},
	{
		7
	},
	{
		7
	},
	{
		8
	},
	{
		8
	},
	{
		11,
		18
	},
	{
		13,
		17
	},
	{
		12,
		16
	},
	{
		14,
		20
	},
	{
		15,
		19
	}
}
