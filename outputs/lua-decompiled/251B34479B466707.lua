ArenaController = ArenaController or BaseClass(BaseController)

function ArenaController.config(slot0)
	slot0.model = ArenaModel.New(slot0)
	slot0.champion_model = ArenaChampionModel.New()
	slot0.dispather = GlobalEvent:getInstance()
	slot0.is_request_loop_challenge = false
end

function ArenaController.getModel(slot0)
	return slot0.model
end

function ArenaController.getChampionModel(slot0)
	return slot0.champion_model
end

function ArenaController.registerEvents(slot0)
end

function ArenaController.requestInitProtocal(slot0)
end

function ArenaController.registerProtocals(slot0)
	slot0:RegisterProtocal(20200, "handle20200")
	slot0:RegisterProtocal(20201, "handle20201")
	slot0:RegisterProtocal(20202, "handle20202")
	slot0:RegisterProtocal(20203, "handle20203")
	slot0:RegisterProtocal(20206, "handle20206")
	slot0:RegisterProtocal(20207, "handle20207")
	slot0:RegisterProtocal(20208, "handle20208")
	slot0:RegisterProtocal(20209, "handle20209")
	slot0:RegisterProtocal(20210, "handle20210")
	slot0:RegisterProtocal(20220, "handle20220")
	slot0:RegisterProtocal(20221, "handle20221")
	slot0:RegisterProtocal(20222, "handle20222")
	slot0:RegisterProtocal(20223, "handle20223")
	slot0:RegisterProtocal(20250, "handle20250")
	slot0:RegisterProtocal(20251, "handle20251")
	slot0:RegisterProtocal(20252, "handle20252")
	slot0:RegisterProtocal(20253, "handle20253")
	slot0:RegisterProtocal(20254, "handle20254")
	slot0:RegisterProtocal(20255, "handle20255")
	slot0:RegisterProtocal(20256, "handle20256")
	slot0:RegisterProtocal(20257, "handle20257")
	slot0:RegisterProtocal(20258, "handle20258")
	slot0:RegisterProtocal(20260, "handle20260")
	slot0:RegisterProtocal(20261, "handle20261")
	slot0:RegisterProtocal(20262, "handle20262")
	slot0:RegisterProtocal(20263, "handle20263")
	slot0:RegisterProtocal(20280, "handle20280")
	slot0:RegisterProtocal(20281, "handle20281")
	slot0:RegisterProtocal(20282, "handle20282")
	slot0:RegisterProtocal(20204, "handle20204")
end

function ArenaController.requestOpenArenWindow(slot0, slot1)
	if MainSceneController:getInstance():getBuildVo(CenterSceneBuild.arena) and slot2.is_lock then
		message(slot2.desc)

		return
	end

	if GuideController:getInstance():isInGuide() then
		slot0:requestOpenArenaLoopMathWindow(true)
	elseif slot1 == ArenaConst.arena_type.rank then
		slot0:openArenaChampionMatchWindow(true)
	elseif slot0.champion_model:getBaseInfo() == nil or slot3.step_status ~= ArenaConst.champion_step_status.opened then
		slot0:requestOpenArenaLoopMathWindow(true)
	else
		slot0:openArenaEnterWindow(true, ArenaConst.arena_type.rank)
	end
end

function ArenaController.openArenaEnterWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.enter_window ~= nil then
			slot0.enter_window:close()

			slot0.enter_window = nil
		end
	else
		if MainSceneController:getInstance():getBuildVo(CenterSceneBuild.arena) and slot3.is_lock then
			message(slot3.desc)

			return
		end

		if slot0.enter_window == nil then
			slot0.enter_window = ArenaEnterWindow.New()
		end

		if slot0.enter_window:isOpen() == false then
			slot0.enter_window:open(slot2 or ArenaConst.arena_type.loop)
		end
	end
end

function ArenaController.requestOpenArenaLoopMathWindow(slot0, slot1, slot2)
	if slot1 == true then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Arena)
	end
end

function ArenaController.openArenaLoopMathWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.loop_match_window ~= nil then
			slot0.loop_match_window:close()

			slot0.loop_match_window = nil
		end
	else
		if MainSceneController:getInstance():getBuildVo(CenterSceneBuild.arena) and slot3.is_lock then
			message(slot3.desc)

			return
		end

		slot2 = slot2 or ArenaConst.loop_index.challenge

		if slot0.loop_match_window == nil then
			slot0.loop_match_window = ArenaLoopMatchWindow.New()
		end

		if slot0.loop_match_window:isOpen() == false then
			slot0.loop_match_window:open(slot2)
		end
	end
end

function ArenaController.openArenaRankMathWindow(slot0, slot1, slot2)
	if slot1 == false then
		-- Nothing
	elseif MainSceneController:getInstance():getBuildVo(CenterSceneBuild.arena) and slot3.is_lock then
		message(slot3.desc)

		return
	end
end

function ArenaController.openCheckLoopChallengeRole(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.loop_challenge_check_window ~= nil then
			slot0.loop_challenge_check_window:close()

			slot0.loop_challenge_check_window = nil
		end
	else
		if slot2 == nil then
			return
		end

		if slot0.loop_challenge_check_window == nil then
			slot0.loop_challenge_check_window = ArenaLoopChallengeCheckWindow.New()
		end

		slot0.loop_challenge_check_window:open(slot2)
	end
end

function ArenaController.openLoopChallengeBuffWindow(slot0, slot1)
	if slot1 == false then
		if slot0.loop_challenge_buff_window ~= nil then
			slot0.loop_challenge_buff_window:close()

			slot0.loop_challenge_buff_window = nil
		end
	else
		if slot0.loop_challenge_buff_window == nil then
			slot0.loop_challenge_buff_window = ArenaLoopChallengeBuffWindow.New()
		end

		slot0.loop_challenge_buff_window:open()
	end
end

function ArenaController.openLoopResultWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.loop_result_window ~= nil then
			slot0.loop_result_window:close()

			slot0.loop_result_window = nil
		end
	else
		if RoleController:getInstance():getRoleVo() == nil then
			return
		end

		if slot0.loop_result_window == nil then
			slot0.loop_result_window = ArenaLoopResultWindow.New()
		end

		slot0.loop_result_window:open(slot2)
	end
end

function ArenaController.openArenaChampionRankWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.champion_rank ~= nil then
			slot0.champion_rank:close()

			slot0.champion_rank = nil
		end
	else
		if slot0.champion_rank == nil then
			slot0.champion_rank = ArenaChampionRankWindow.New(slot2)
		end

		slot0.champion_rank:open()
	end
end

function ArenaController.openArenaChampionMatchWindow(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.champion_window ~= nil then
			slot0.champion_window:close()

			slot0.champion_window = nil
		end
	else
		if slot0.champion_window == nil then
			slot0.champion_window = ArenaChampionMatchWindow.New(slot3)
		end

		slot0.champion_window:open(slot2)
	end
end

function ArenaController.checkChampionWndIsOpen(slot0)
	if slot0.champion_window then
		return true
	end

	return false
end

function ArenaController.openArenaChampionGuessWindow(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.guess_window ~= nil then
			slot0.guess_window:close()

			slot0.guess_window = nil
		end
	else
		if slot0.guess_window == nil then
			slot0.guess_window = ArenaChampionGuessWindow.New(slot3)
		end

		slot0.guess_window:open(slot2)
	end
end

function ArenaController.openArenaChampionRankAwardsWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.champion_rank_awards ~= nil then
			slot0.champion_rank_awards:close()

			slot0.champion_rank_awards = nil
		end
	else
		if slot0.champion_rank_awards == nil then
			slot0.champion_rank_awards = ArenaChampionRankAwardsWindow.New(slot2)
		end

		slot0.champion_rank_awards:open()
	end
end

function ArenaController.openArenaChampionMyGuessWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.my_guess_window ~= nil then
			slot0.my_guess_window:close()

			slot0.my_guess_window = nil
		end
	else
		if slot0.my_guess_window == nil then
			slot0.my_guess_window = ArenaChampionMyGuessWindow.New(slot2)
		end

		slot0.my_guess_window:open()
	end
end

function ArenaController.openArenaChampionMyLogWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.my_log_window ~= nil then
			slot0.my_log_window:close()

			slot0.my_log_window = nil
		end
	else
		if slot0.my_log_window == nil then
			slot0.my_log_window = ArenaChampionMyLogWindow.New(slot2)
		end

		slot0.my_log_window:open()
	end
end

function ArenaController.openArenaChampionBestInfoWindow(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.best_info_window ~= nil then
			slot0.best_info_window:close()

			slot0.best_info_window = nil
		end
	else
		if slot0.best_info_window == nil then
			slot0.best_info_window = ArenaChampionBestInfoWindow.New(slot3)
		end

		slot0.best_info_window:open(slot2)
	end
end

function ArenaController.openArenaChampionReportWindow(slot0, slot1, slot2, slot3)
	if not slot1 then
		if slot0.report_window ~= nil then
			slot0.report_window:close()

			slot0.report_window = nil
		end
	else
		if slot0.report_window == nil then
			slot0.report_window = ArenaChampionReportWindow.New(slot3)
		end

		slot0.report_window:open(slot2)
	end
end

function ArenaController.openArenaLoopMyLogWindow(slot0, slot1)
	if not slot1 then
		if slot0.loop_log_window ~= nil then
			slot0.loop_log_window:close()

			slot0.loop_log_window = nil
		end
	else
		if slot0.loop_log_window == nil then
			slot0.loop_log_window = ArenaLoopMyLogWindow.New()
		end

		slot0.loop_log_window:open()
	end
end

function ArenaController.openArenaChampionTop3Window(slot0, slot1, slot2, slot3)
	if not slot1 then
		if slot0.champion_top3_window ~= nil then
			slot0.champion_top3_window:close()

			slot0.champion_top3_window = nil
		end
	else
		if slot0.champion_top3_window == nil then
			slot0.champion_top3_window = ArenaChampionTop3Window.New(slot3)
		end

		slot0.champion_top3_window:open(slot2)
	end
end

function ArenaController.openArenaLoopChallengeBuy(slot0, slot1, slot2)
	if not slot1 then
		if slot0.loop_challenge_buy ~= nil then
			slot0.loop_challenge_buy:close()

			slot0.loop_challenge_buy = nil
		end
	else
		if slot0.loop_challenge_buy == nil then
			slot0.loop_challenge_buy = ArenaLoopChallengeBuy.New()
		end

		slot0.loop_challenge_buy:open(slot2)
	end
end

function ArenaController.getArenaRoot(slot0)
	if slot0.loop_match_window then
		return slot0.loop_match_window.root_wnd
	end
end

function ArenaController.sender20208(slot0)
	slot0:SendProtocal(20208, {})
end

function ArenaController.handle20200(slot0, slot1)
	slot0.model:updateMyLoopData(slot1)
end

function ArenaController.handle20208(slot0, slot1)
	slot0.model:updateChallengeTimesAwards(slot1)
end

function ArenaController.requestGetChallengeTimesAwards(slot0, slot1)
	slot0:SendProtocal(20209, {
		num = slot1
	})
end

function ArenaController.handle20209(slot0, slot1)
	message(slot1.msg)
end

function ArenaController.requestChallengeList(slot0)
	slot0:SendProtocal(20201, {})
end

function ArenaController.handle20201(slot0, slot1)
	slot0.model:updateLoopChallengeList(slot1)
end

function ArenaController.requestLoopChallengeRoleInfo(slot0, slot1, slot2)
	if slot1 == nil or slot2 == nil then
		return
	end

	slot0.loop_challenge_role_rid = slot1
	slot0.loop_challenge_role_srv_id = slot2

	slot0:SendProtocal(20202, {
		rid = slot1,
		srv_id = slot2
	})
end

function ArenaController.handle20202(slot0, slot1)
	if slot0.loop_challenge_role_rid ~= slot1.rid and slot0.loop_challenge_role_srv_id ~= slot1.srv_id then
		return
	end

	slot0:openCheckLoopChallengeRole(true, slot1)
end

function ArenaController.requestFightWithLoopChallenge(slot0, slot1, slot2, slot3)
	if slot1 == nil or slot2 == nil then
		return
	end

	slot0:SendProtocal(20203, {
		rid = slot1,
		srv_id = slot2,
		is_auto = slot3 or 0
	})
end

function ArenaController.handle20203(slot0, slot1)
	message(slot1.msg)
end

function ArenaController.requestMyLoopLogInfo(slot0)
	slot0:SendProtocal(20222, {})
end

function ArenaController.handle20222(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateMylogListEvent, slot1.log_list)
end

function ArenaController.handle20223(slot0, slot1)
	slot0.model:updateArenaLoopLogStatus(slot1.flag)
end

function ArenaController.requestRefreshChallengeList(slot0)
	slot0:SendProtocal(20206, {})
end

function ArenaController.handle20206(slot0, slot1)
	message(slot1.msg)
end

function ArenaController.requestBuyChallengeTimes(slot0)
end

function ArenaController.sender20207(slot0, slot1)
	slot0:SendProtocal(20207, {
		num = slot1
	})
end

function ArenaController.handle20207(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0:openArenaLoopChallengeBuy(false)
		GlobalEvent:getInstance():Fire(ArenaEvent.UpdateArena_Number)
	end
end

function ArenaController.handle20210(slot0, slot1)
	BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.Arena, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.ArenaFightResultEvent)
	slot0:SendProtocal(20200, {})
end

function ArenaController.requestLoopChallengeStatueList(slot0)
	slot0:SendProtocal(20220, {})
end

function ArenaController.handle20220(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateLoopChallengeStatueList, slot1.rank_list)
end

function ArenaController.requestLoopChalllengeRank(slot0)
	slot0:SendProtocal(20221, {})
end

function ArenaController.handle20221(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateLoopChallengeRank, slot1)
end

function ArenaController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end

function ArenaController.handle20250(slot0, slot1)
	slot0.champion_model:updateChampionBaseInfo(slot1)
	slot0:requestRoleInfo()

	if MainSceneController:getInstance():getBuildVo(CenterSceneBuild.arena) and slot2.is_lock then
		return
	end

	if slot1.step_status == ArenaConst.champion_step_status.opened then
		if GuideController:getInstance():isInGuide() then
			return
		end

		if StoryController:getInstance():getModel():isStoryState() then
			return
		end

		if slot0.alert_window and (slot0.alert_window.root_wnd == nil or tolua.isnull(slot0.alert_window.root_wnd)) then
			slot0.alert_window = nil
		end

		if slot0.champion_window == nil and slot0.alert_window == nil then
			function slot3()
				uv0.alert_window = nil
			end

			function slot4()
				MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.champion_call)

				uv0.alert_window = nil
			end

			if slot1.round_status == ArenaConst.champion_round_status.guess then
				ActivityController:openSignView(true, ActivitySignType.arena_champion_guess, {
					timer = true
				})
			elseif not slot0.had_show_notice then
				if MainSceneController:getInstance():getBuildVo(CenterSceneBuild.arena) and slot5.is_lock then
					return
				end

				ActivityController:openSignView(true, ActivitySignType.arena_champion, {
					timer = true
				})

				slot0.had_show_notice = true
			end
		end
	elseif slot0.alert_window ~= nil then
		slot0.alert_window:close()

		slot0.alert_window = nil
	end
end

function ArenaController.requestRoleInfo(slot0)
	slot0:SendProtocal(20251, {})
end

function ArenaController.handle20251(slot0, slot1)
	slot0.champion_model:setRoleInfo(slot1)
end

function ArenaController.requestChampionTop3(slot0)
	slot0:SendProtocal(20280, {})
end

function ArenaController.handle20280(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateChampionTop3Event, slot1.rank_list)
end

function ArenaController.requestMyChampionMatch(slot0)
	slot0:SendProtocal(20252, {})
end

function ArenaController.handle20252(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateMyMatchInfoEvent, slot1)
end

function ArenaController.requestGuessChampionMatch(slot0)
	slot0:SendProtocal(20253, {})
end

function ArenaController.handle20253(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateGuessMatchInfoEvent, slot1)
end

function ArenaController.requestBetTheMatch(slot0, slot1, slot2)
	slot0:SendProtocal(20254, {
		bet_type = slot1,
		bet_val = slot2
	})
end

function ArenaController.handle20254(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.champion_model:getRoleInfo().can_bet = slot1.can_bet

		GlobalEvent:getInstance():Fire(ArenaEvent.UpdateRoleInfoBetEvent, slot1.can_bet, slot1.bet_type)
		slot0:openArenaChampionGuessWindow(false)
	end
end

function ArenaController.handle20257(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateBetMatchValueEvent, slot1)
end

function ArenaController.requestMyGuessInfo(slot0)
	slot0:SendProtocal(20255, {})
end

function ArenaController.handle20255(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateMyGuessListEvent, slot1.list)
end

function ArenaController.requestChompionRank(slot0)
	slot0:SendProtocal(20281, {})
end

function ArenaController.handle20281(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateChampionRankEvent, slot1)
end

function ArenaController.requestTop32Info(slot0)
	slot0:SendProtocal(20260, {})
end

function ArenaController.handle20260(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateTop32InfoEvent, slot1.list)
end

function ArenaController.requestTop4Info(slot0)
	slot0:SendProtocal(20261, {})
end

function ArenaController.handle20261(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateTop4InfoEvent, slot1.pos_list)
end

function ArenaController.requestGuessGroupInfo(slot0)
	slot0:SendProtocal(20262, {})
end

function ArenaController.handle20262(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateTop324GuessGroupEvent, slot1.group, slot1.pos)
end

function ArenaController.requestGroupPosInfo(slot0, slot1, slot2)
	slot0:SendProtocal(20263, {
		group = slot1,
		pos = slot2
	})
end

function ArenaController.handle20263(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateTop324GroupPosEvent, slot1)
end

function ArenaController.requestSelfResultInfo(slot0)
	slot0:SendProtocal(20256, {})
end

function ArenaController.handle20256(slot0, slot1)
	slot0:openArenaChampionBestInfoWindow(true, slot1)
end

function ArenaController.requestMyLogInfo(slot0)
	slot0:SendProtocal(20258, {})
end

function ArenaController.handle20258(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateMylogListEvent, slot1.list)
end

function ArenaController.handle20282(slot0, slot1)
	if GuideController:getInstance():isInGuide() then
		return
	end

	if StoryController:getInstance():getModel():isStoryState() then
		return
	end

	RenderMgr:getInstance():doNextFrame(function ()
		uv0:openArenaChampionTop3Window(true, uv1)
	end)
end

function ArenaController.requestRabotInfo(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(20204, {
		rid = slot1,
		srv_id = slot2,
		pos = slot3
	})
end

function ArenaController.handle20204(slot0, slot1)
	HeroController:getInstance():openHeroTipsPanel(true, slot1)
end
