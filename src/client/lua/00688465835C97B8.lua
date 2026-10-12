BattleResultReturnMgr = BattleResultReturnMgr or BaseClass(BaseController)

function BattleResultReturnMgr.config(slot0)
end

function BattleResultReturnMgr.returnByFightType(slot0, slot1)
	if BattleController:getInstance():getIsClickStatus() then
		message(TI18N("观战中无法跳转"))

		return
	end

	if not slot1 then
		return
	end

	if BaseView.winMap[#BaseView.winMap] == nil then
		if slot1 == BattleConst.Fight_Type.AdventrueMine then
			AdventureController:getInstance():requestEnterMaxAdventureMine()
		elseif slot1 == BattleConst.Fight_Type.YearMonsterWar then
			ActionyearmonsterController:getInstance():sender28204()
		else
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(slot1)
		end
	else
		if slot0:checkFightTypeWinPos(slot1) then
			return
		end

		BaseView.closeViewAndTips()

		if slot1 == BattleConst.Fight_Type.Darma then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.drama_scene)
		elseif slot1 == BattleConst.Fight_Type.Arena then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.arena_call)
		elseif slot1 == BattleConst.Fight_Type.StarTower then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.startower)
		elseif slot1 == BattleConst.Fight_Type.GuildDun then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.guild_boss)
		elseif slot1 == BattleConst.Fight_Type.DungeonStone then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.dungeonstone)
		elseif slot1 == BattleConst.Fight_Type.GuildWar then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.guildwar)
		elseif slot1 == BattleConst.Fight_Type.LadderWar then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.ladderwar)
		elseif slot1 == BattleConst.Fight_Type.ExpeditFight then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.expedit_fight)
		elseif slot1 == BattleConst.Fight_Type.ElementWar then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.elementWar, {
				open_type = ElementController:getInstance():getModel():getRecordOpenType()
			})
		elseif slot1 == BattleConst.Fight_Type.HeavenWar then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.heavenwar)
		elseif slot1 == BattleConst.Fight_Type.CrossArenaWar then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.crossarenawar)
		elseif slot1 == BattleConst.Fight_Type.LimitExercise then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.limitexercise)
		elseif slot1 == BattleConst.Fight_Type.TermBegins then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.termbegins)
		elseif slot1 == BattleConst.Fight_Type.TermBeginsBoss then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.termbeginsboss)
		elseif slot1 == BattleConst.Fight_Type.Endless then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.endless)
		elseif slot1 == BattleConst.Fight_Type.PrimusWar then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.primuswar)
		elseif slot1 == BattleConst.Fight_Type.Adventrue then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.adventure)
		elseif slot1 == BattleConst.Fight_Type.AdventrueMine then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.adventruemine)
		elseif slot1 == BattleConst.Fight_Type.EliteMatchWar or slot1 == BattleConst.Fight_Type.EliteKingMatchWar then
			ElitematchController:getInstance():openElitematchMainWindow(true)
		elseif slot1 == BattleConst.Fight_Type.GuildSecretArea then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.guildsecretarea)
		elseif slot1 == BattleConst.Fight_Type.Arean_Team then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.arenateam)
		elseif slot1 == BattleConst.Fight_Type.MonopolyWar_1 then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.monopolywar_1)
		elseif slot1 == BattleConst.Fight_Type.MonopolyWar_2 then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.monopolywar_2)
		elseif slot1 == BattleConst.Fight_Type.MonopolyWar_3 then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.monopolywar_3)
		elseif slot1 == BattleConst.Fight_Type.MonopolyWar_4 then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.monopolywar_4)
		elseif slot1 == BattleConst.Fight_Type.MonopolyBoss then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.monopolyboss)
		elseif slot1 == BattleConst.Fight_Type.PlanesWar then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.planeswar)
		elseif slot1 == BattleConst.Fight_Type.YearMonsterWar then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.yearmonsterWar)
		elseif slot1 == BattleConst.Fight_Type.WhiteDayWar then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.whitedaywar)
		elseif slot1 == BattleConst.Fight_Type.AreanManyPeople then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.arenamanypeople)
		else
			print("错误的类型: " .. tostring(slot1))
		end
	end
end

function BattleResultReturnMgr.checkFightTypeWinPos(slot0, slot1)
	slot2, slot3 = nil
	slot4 = false

	if slot1 == BattleConst.Fight_Type.Arena then
		slot2 = ArenaController:getInstance().loop_match_window
	elseif slot1 == BattleConst.Fight_Type.StarTower then
		slot2 = StartowerController:getInstance().main_view
	elseif slot1 == BattleConst.Fight_Type.GuildDun then
		slot2 = GuildbossController:getInstance().main_window
	elseif slot1 == BattleConst.Fight_Type.DungeonStone then
		slot2 = Stone_dungeonController:getInstance().stoneDungeonView
	elseif slot1 == BattleConst.Fight_Type.GuildWar then
		slot2 = GuildwarController:getInstance().main_window
	elseif slot1 == BattleConst.Fight_Type.LadderWar then
		slot2 = LadderController:getInstance().ladder_main_window
	elseif slot1 == BattleConst.Fight_Type.ExpeditFight then
		slot2 = HeroExpeditController:getInstance().heroExpeditView
	elseif slot1 == BattleConst.Fight_Type.ElementWar then
		slot2 = ElementController:getInstance().element_main_wnd

		if BaseView.winMap[#BaseView.winMap] and slot5 == ElementController:getInstance().element_ectype_wnd then
			slot4 = true
		end
	elseif slot1 == BattleConst.Fight_Type.HeavenWar then
		slot2 = HeavenController:getInstance().heaven_chapter_wnd
	elseif slot1 == BattleConst.Fight_Type.CrossArenaWar then
		slot2 = CrossarenaController:getInstance().crossarena_main_wnd
	elseif slot1 == BattleConst.Fight_Type.LimitExercise then
		slot2 = LimitExerciseController:getInstance().limit_exercise_view
	elseif slot1 == BattleConst.Fight_Type.TermBegins or slot1 == BattleConst.Fight_Type.TermBeginsBoss then
		slot2 = ActiontermbeginsController:getInstance().action_term_begins_main_window
	elseif slot1 == BattleConst.Fight_Type.Endless then
		slot2 = Endless_trailController:getInstance().endless_main_window
	elseif slot1 == BattleConst.Fight_Type.PrimusWar then
		slot2 = PrimusController:getInstance().primus_main_window
		slot3 = PrimusController:getInstance().primus_challenge_panel
	elseif slot1 == BattleConst.Fight_Type.Adventrue then
		slot2 = AdventureController:getInstance().adventure_window
	elseif slot1 == BattleConst.Fight_Type.AdventrueMine then
		slot2 = AdventureController:getInstance().adventure_mine_window
	elseif slot1 == BattleConst.Fight_Type.EliteMatchWar or slot1 == BattleConst.Fight_Type.EliteKingMatchWar then
		slot2 = ElitematchController:getInstance().elitematch_main_window
		slot3 = ElitematchController:getInstance().elitematch_matching_window
	elseif slot1 == BattleConst.Fight_Type.GuildSecretArea then
		slot2 = GuildsecretareaController:getInstance().guildsecretarea_main_window
	elseif slot1 == BattleConst.Fight_Type.Arean_Team then
		slot2 = ArenateamController:getInstance().arenateam_main_window
	elseif slot1 == BattleConst.Fight_Type.PlanesWar then
		if PlanesafkController:getInstance().planesafk_main_window then
			slot4 = true
		end
	elseif slot1 == BattleConst.Fight_Type.YearMonsterWar then
		slot2 = ActionyearmonsterController:getInstance().actionyearmonster_main_window
		slot3 = ActionyearmonsterController:getInstance().actionyearmonster_challenge_panel
	elseif slot1 == BattleConst.Fight_Type.WhiteDayWar then
		if ActionController:getInstance().action_operate and slot5:isOpen() and slot5.selected_tab and slot5.selected_tab.data and slot5.selected_tab.data.bid == ActionRankCommonType.white_day then
			slot4 = true
		end
	elseif slot1 == BattleConst.Fight_Type.AreanManyPeople then
		slot2 = ArenaManyPeopleController:getInstance().arenamanypeople_main_window
	else
		print("错误的类型: " .. tostring(slot1))
	end

	if slot2 and slot2:isOpen() or slot3 and slot3:isOpen() or slot4 then
		return true
	end

	return false
end
