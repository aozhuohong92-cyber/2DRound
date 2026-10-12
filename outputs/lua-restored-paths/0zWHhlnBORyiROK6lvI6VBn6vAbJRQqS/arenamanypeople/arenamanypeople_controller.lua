ArenaManyPeopleController = ArenaManyPeopleController or BaseClass(BaseController)

function ArenaManyPeopleController.config(slot0)
	slot0.model = ArenaManyPeopleModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.is_click_amp = false
end

function ArenaManyPeopleController.getModel(slot0)
	return slot0.model
end

function ArenaManyPeopleController.registerEvents(slot0)
end

function ArenaManyPeopleController.registerProtocals(slot0)
	slot0:RegisterProtocal(29000, "handle29000")
	slot0:RegisterProtocal(29001, "handle29001")
	slot0:RegisterProtocal(29002, "handle29002")
	slot0:RegisterProtocal(29003, "handle29003")
	slot0:RegisterProtocal(29004, "handle29004")
	slot0:RegisterProtocal(29005, "handle29005")
	slot0:RegisterProtocal(29006, "handle29006")
	slot0:RegisterProtocal(29007, "handle29007")
	slot0:RegisterProtocal(29008, "handle29008")
	slot0:RegisterProtocal(29009, "handle29009")
	slot0:RegisterProtocal(29010, "handle29010")
	slot0:RegisterProtocal(29016, "handle29016")
	slot0:RegisterProtocal(29017, "handle29017")
	slot0:RegisterProtocal(29018, "handle29018")
	slot0:RegisterProtocal(29019, "handle29019")
	slot0:RegisterProtocal(29020, "handle29020")
	slot0:RegisterProtocal(29021, "handle29021")
	slot0:RegisterProtocal(29022, "handle29022")
	slot0:RegisterProtocal(29025, "handle29025")
	slot0:RegisterProtocal(29026, "handle29026")
	slot0:RegisterProtocal(29030, "handle29030")
	slot0:RegisterProtocal(29027, "handle29027")
	slot0:RegisterProtocal(29031, "handle29031")
	slot0:RegisterProtocal(29028, "handle29028")
end

function ArenaManyPeopleController.sender29000(slot0)
	slot0:SendProtocal(29000, {})
end

function ArenaManyPeopleController.handle29000(slot0, slot1)
	slot0.model:setMyTeamInfo(slot1)
	GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_MAIN_EVENT, slot1)

	if slot1.count > 0 and slot0.is_click_amp == false then
		PromptController:getInstance():getModel():addPromptData({
			type = PromptTypeConst.AMP_tips
		})
	else
		PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.AMP_tips)
	end
end

function ArenaManyPeopleController.sender29002(slot0, slot1, slot2)
	slot0:SendProtocal(29002, {
		rid = slot1,
		srv_id = slot2
	})
end

function ArenaManyPeopleController.handle29002(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_INVITATION_PLAYER_EVENT, slot1)
	end
end

function ArenaManyPeopleController.sender29003(slot0)
	slot0:SendProtocal(29003, {})
end

function ArenaManyPeopleController.handle29003(slot0, slot1)
	slot0.model:setInvitationInfo(slot1)
	GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_INVITATION_LIST_EVENT, slot1)
end

function ArenaManyPeopleController.sender29004(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(29004, {
		rid = slot1,
		srv_id = slot2,
		type = slot3
	})
end

function ArenaManyPeopleController.handle29004(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0:sender29003()
	end
end

function ArenaManyPeopleController.sender29005(slot0)
	slot0:SendProtocal(29005, {})
end

function ArenaManyPeopleController.handle29005(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_KEY_CLEAR_EVENT, slot1)
	end
end

function ArenaManyPeopleController.sender29001(slot0, slot1)
	slot0:SendProtocal(29001, {
		name = slot1
	})
end

function ArenaManyPeopleController.handle29001(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_SEARCH_TEAM_EVENT, slot1)
end

function ArenaManyPeopleController.sender29006(slot0)
	slot0:SendProtocal(29006, {})
end

function ArenaManyPeopleController.handle29006(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		-- Nothing
	end
end

function ArenaManyPeopleController.sender29007(slot0, slot1, slot2)
	slot0:SendProtocal(29007, {
		rid = slot1,
		srv_id = slot2
	})
end

function ArenaManyPeopleController.handle29007(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		-- Nothing
	end
end

function ArenaManyPeopleController.sender29031(slot0, slot1)
	slot0:SendProtocal(29031, {
		id = slot1
	})
end

function ArenaManyPeopleController.handle29031(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:updateRewardInfo(slot1.id)
		GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_RECEIVE_BOX_EVENT, slot1)
	end
end

function ArenaManyPeopleController.sender29035(slot0)
	slot0:SendProtocal(29035, {})
end

function ArenaManyPeopleController.sender29008(slot0)
	slot0:SendProtocal(29008, {})
end

function ArenaManyPeopleController.handle29008(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_GET_RECOMMEND_INFO_EVENT, slot1)
end

function ArenaManyPeopleController.sender29009(slot0)
	slot0:SendProtocal(29009, {})
end

function ArenaManyPeopleController.handle29009(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_GET_RECOMMEND_INFO_EVENT, slot1)
end

function ArenaManyPeopleController.sender29010(slot0)
	slot0:SendProtocal(29010, {})
end

function ArenaManyPeopleController.handle29010(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_UPDATE_MENBER_EVENT, slot1)
end

function ArenaManyPeopleController.sender29018(slot0)
	slot0:SendProtocal(29018, {})
end

function ArenaManyPeopleController.handle29018(slot0)
end

function ArenaManyPeopleController.sender29017(slot0)
	slot0:SendProtocal(29017, {})
end

function ArenaManyPeopleController.handle29017(slot0, slot1)
	slot0.model:setHideIndex()
	message(slot1.msg)
end

function ArenaManyPeopleController.sender29016(slot0)
	slot0:SendProtocal(29016, {})
end

function ArenaManyPeopleController.handle29016(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0.model:setMatchInfo(slot1)

		if slot1.is_enter == 1 then
			slot0:openArenaManyPeopleFightTips(true)
		else
			slot0:openArenaManyPeopleMatchingWindow(true)
		end

		GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_MATCH_OTHER_EVENT, slot1)
	end
end

function ArenaManyPeopleController.sender29019(slot0, slot1)
	slot0:SendProtocal(29019, {
		pos_info = slot1
	})
end

function ArenaManyPeopleController.handle29019(slot0, slot1)
	slot0:openArenaManyPeopleFightTips(false)
	slot0:openArenaManyPeopleMatchingWindow(false)
	message(slot1.msg)
end

function ArenaManyPeopleController.sender29022(slot0, slot1)
	slot0:SendProtocal(29022, {
		pos_info = slot1
	})
end

function ArenaManyPeopleController.handle29022(slot0)
end

function ArenaManyPeopleController.handle29020(slot0, slot1)
	BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.AreanManyPeople, slot1)
	slot0:openArenaManyPeopleFightTips(false)
	slot0:openArenaManyPeopleMatchingWindow(false)
end

function ArenaManyPeopleController.sender29021(slot0)
	slot0:SendProtocal(29021, {})
end

function ArenaManyPeopleController.handle29021(slot0, slot1)
	slot0.model:updateMyMatchInfo(slot1)
	GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_MATCH_MY_EVENT)
end

function ArenaManyPeopleController.sender29025(slot0, slot1, slot2)
	slot0:SendProtocal(29025, {
		start_num = slot1,
		end_num = slot2
	})
end

function ArenaManyPeopleController.handle29025(slot0, slot1)
	slot0.model:updateMyRank(slot1)
	GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_MAIN_RANK_EVENT, slot1)
end

function ArenaManyPeopleController.sender29030(slot0)
	slot0:SendProtocal(29030, {})
end

function ArenaManyPeopleController.handle29030(slot0, slot1)
	if slot1.code == 1 and slot0.model:getIsTouchFight() == true then
		slot0.model:setIsTouchFight(false)
		slot0:sender29016()
	end

	slot0.model:updateBuyNum(slot1)
	GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_UPDATE_BUYNUM_EVENT, slot1)
end

function ArenaManyPeopleController.sender29026(slot0)
	slot0:SendProtocal(29026, {})
end

function ArenaManyPeopleController.handle29026(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_MIAIN_REPORT_EVENT, slot1)
end

function ArenaManyPeopleController.sender29027(slot0, slot1)
	slot0:SendProtocal(29027, {
		id = slot1
	})
end

function ArenaManyPeopleController.handle29027(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_SINGLE_REPORT_EVENT, slot1)
end

function ArenaManyPeopleController.sender29028(slot0)
	slot0:SendProtocal(29028, {})
end

function ArenaManyPeopleController.handle29028(slot0, slot1)
	if slot1 and slot1.point == 1 then
		slot0.model:setIsReportRedpoint(true)
	end
end

function ArenaManyPeopleController.openArenaManyPeopleMainWindow(slot0, slot1)
	if slot1 == true then
		slot0.is_click_amp = true

		if slot0.arenamanypeople_main_window == nil then
			slot0.arenamanypeople_main_window = ArenaManyPeopleMainWindow.New()
		end

		if slot0.arenamanypeople_main_window:isOpen() == false then
			slot0.arenamanypeople_main_window:open()
		end
	elseif slot0.arenamanypeople_main_window then
		slot0.arenamanypeople_main_window:close()

		slot0.arenamanypeople_main_window = nil
	end
end

function ArenaManyPeopleController.openArenaManyPeopleHallPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenamanypeople_hall_panel == nil then
			slot0.arenamanypeople_hall_panel = ArenaManyPeopleHallPanel.New()
		end

		if slot0.arenamanypeople_hall_panel:isOpen() == false then
			slot0.arenamanypeople_hall_panel:open(slot2)
		end
	elseif slot0.arenamanypeople_hall_panel then
		slot0.arenamanypeople_hall_panel:close()

		slot0.arenamanypeople_hall_panel = nil
	end
end

function ArenaManyPeopleController.openArenaManyPeopleMatchingWindow(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenamanypeople_match_win == nil then
			slot0.arenamanypeople_match_win = ArenaManyPeopleMatchingWindow.New()
		end

		if slot0.arenamanypeople_match_win:isOpen() == false then
			slot0.arenamanypeople_match_win:open(slot2)
		end
	elseif slot0.arenamanypeople_match_win then
		slot0.arenamanypeople_match_win:close()

		slot0.arenamanypeople_match_win = nil
	end
end

function ArenaManyPeopleController.openArenaManyPeopleFightResultPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenamanypeople_fight_result_panel == nil then
			slot0.arenamanypeople_fight_result_panel = ArenaManyPeopleFightResultPanel.New()
		end

		if slot0.arenamanypeople_fight_result_panel:isOpen() == false then
			slot0.arenamanypeople_fight_result_panel:open(slot2)
		end
	elseif slot0.arenamanypeople_fight_result_panel then
		slot0.arenamanypeople_fight_result_panel:close()

		slot0.arenamanypeople_fight_result_panel = nil
	end
end

function ArenaManyPeopleController.openArenaManyPeopleFightRecordPanel(slot0, slot1)
	if slot1 == true then
		if slot0.arenamanypeople_fight_record_panel == nil then
			slot0.arenamanypeople_fight_record_panel = ArenaManyPeopleFightRecordPanel.New()
		end

		if slot0.arenamanypeople_fight_record_panel:isOpen() == false then
			slot0.arenamanypeople_fight_record_panel:open()
		end
	elseif slot0.arenamanypeople_fight_record_panel then
		slot0.arenamanypeople_fight_record_panel:close()

		slot0.arenamanypeople_fight_record_panel = nil
	end
end

function ArenaManyPeopleController.openArenaManyPeopleFightVedioPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenamanypeople_fight_vedio_panel == nil then
			slot0.arenamanypeople_fight_vedio_panel = ArenaManyPeopleFightVedioPanel.New()
		end

		if slot0.arenamanypeople_fight_vedio_panel:isOpen() == false then
			slot0.arenamanypeople_fight_vedio_panel:open(slot2)
		end
	elseif slot0.arenamanypeople_fight_vedio_panel then
		slot0.arenamanypeople_fight_vedio_panel:close()

		slot0.arenamanypeople_fight_vedio_panel = nil
	end
end

function ArenaManyPeopleController.openArenaManyPeopleBoxRewardPanel(slot0, slot1)
	if slot1 == true then
		if slot0.arenamanypeople_box_reward_panel == nil then
			slot0.arenamanypeople_box_reward_panel = ArenaManyPeopleBoxRewardPanel.New()
		end

		if slot0.arenamanypeople_box_reward_panel:isOpen() == false then
			slot0.arenamanypeople_box_reward_panel:open()
		end
	elseif slot0.arenamanypeople_box_reward_panel then
		slot0.arenamanypeople_box_reward_panel:close()

		slot0.arenamanypeople_box_reward_panel = nil
	end
end

function ArenaManyPeopleController.openArenaManyPeopleRankWindow(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenamanypeople_rank_reward_panel == nil then
			slot0.arenamanypeople_rank_reward_panel = ArenaManyPeopleRankWindow.New()
		end

		if slot0.arenamanypeople_rank_reward_panel:isOpen() == false then
			slot0.arenamanypeople_rank_reward_panel:open(slot2)
		end
	elseif slot0.arenamanypeople_rank_reward_panel then
		slot0.arenamanypeople_rank_reward_panel:close()

		slot0.arenamanypeople_rank_reward_panel = nil
	end
end

function ArenaManyPeopleController.openArenaManyPeopleFightTips(slot0, slot1)
	if slot1 == true then
		if slot0.arenamanypeople_fight_tips == nil then
			slot0.arenamanypeople_fight_tips = ArenaManyPeopleFightTips.New()
		end

		if slot0.arenamanypeople_fight_tips:isOpen() == false then
			slot0.arenamanypeople_fight_tips:open()
		end
	elseif slot0.arenamanypeople_fight_tips then
		slot0.arenamanypeople_fight_tips:close()

		slot0.arenamanypeople_fight_tips = nil
	end
end

function ArenaManyPeopleController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
