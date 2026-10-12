ArenateamController = ArenateamController or BaseClass(BaseController)

function ArenateamController.config(slot0)
	slot0.model = ArenateamModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function ArenateamController.getModel(slot0)
	return slot0.model
end

function ArenateamController.registerEvents(slot0)
	slot0.chat_event = GlobalEvent:getInstance():Bind(EventId.CHAT_UDMSG_WORLD, function (slot0, slot1, slot2)
		if (slot0 and slot0 == ChatConst.Channel.Team or slot0 == ChatConst.Channel.Team_Sys) and not slot2 then
			uv0.model:setIsChatRedpoint(true)
		end
	end)
	slot0.team_info = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_REFRESH_TEAM_INFO_EVENT, function ()
		if uv0.model:getMyTeamInfo() and slot0.tid ~= 0 then
			uv0:sender27221()
		end
	end)
end

function ArenateamController.registerProtocals(slot0)
	slot0:RegisterProtocal(27220, "handle27220")
	slot0:RegisterProtocal(27200, "handle27200")
	slot0:RegisterProtocal(27201, "handle27201")
	slot0:RegisterProtocal(27202, "handle27202")
	slot0:RegisterProtocal(27203, "handle27203")
	slot0:RegisterProtocal(27204, "handle27204")
	slot0:RegisterProtocal(27205, "handle27205")
	slot0:RegisterProtocal(27206, "handle27206")
	slot0:RegisterProtocal(27207, "handle27207")
	slot0:RegisterProtocal(27208, "handle27208")
	slot0:RegisterProtocal(27210, "handle27210")
	slot0:RegisterProtocal(27211, "handle27211")
	slot0:RegisterProtocal(27212, "handle27212")
	slot0:RegisterProtocal(27213, "handle27213")
	slot0:RegisterProtocal(27215, "handle27215")
	slot0:RegisterProtocal(27216, "handle27216")
	slot0:RegisterProtocal(27221, "handle27221")
	slot0:RegisterProtocal(27222, "handle27222")
	slot0:RegisterProtocal(27223, "handle27223")
	slot0:RegisterProtocal(27224, "handle27224")
	slot0:RegisterProtocal(27225, "handle27225")
	slot0:RegisterProtocal(27226, "handle27226")
	slot0:RegisterProtocal(27228, "handle27228")
	slot0:RegisterProtocal(27229, "handle27229")
	slot0:RegisterProtocal(27240, "handle27240")
	slot0:RegisterProtocal(27241, "handle27241")
	slot0:RegisterProtocal(27242, "handle27242")
	slot0:RegisterProtocal(27243, "handle27243")
	slot0:RegisterProtocal(27250, "handle27250")
	slot0:RegisterProtocal(27251, "handle27251")
	slot0:RegisterProtocal(27252, "handle27252")
	slot0:RegisterProtocal(27253, "handle27253")
	slot0:RegisterProtocal(27255, "handle27255")
	slot0:RegisterProtocal(27256, "handle27256")
	slot0:RegisterProtocal(27227, "handle27227")
end

function ArenateamController.checkArenaTeamIsOpen(slot0, slot1)
	return slot0.model:checkArenaTeamIsOpen(slot1)
end

function ArenateamController.sender27220(slot0)
	slot0:SendProtocal(27220, {})
end

function ArenateamController.handle27220(slot0, slot1)
	slot0.model:setMyTeamInfo(slot1)
	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_MAIN_EVENT, slot1)
end

function ArenateamController.handle27227(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_ONLINE_EVENT, slot1)
end

function ArenateamController.sender27200(slot0)
	slot0:SendProtocal(27200, {})
end

function ArenateamController.handle27200(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_HALL_MAIN_EVENT, slot1)
end

function ArenateamController.sender27201(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(27201, {
		name = slot1,
		limit_lev = slot2,
		limit_power = slot3,
		is_check = slot4
	})
end

function ArenateamController.handle27201(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		if slot0.arenateam_hall_panel then
			slot0.arenateam_hall_panel:changeSelectedTab(ArenateamConst.TeamHallTabType.eMyTeam)
		end

		if slot0.arenateam_create_team_panel then
			slot0:openArenateamCreateTeamPanel(false)
		end

		slot0:sender27220()
	end
end

function ArenateamController.sender27202(slot0, slot1, slot2)
	slot0:SendProtocal(27202, {
		tid = slot1,
		srv_id = slot2
	})
end

function ArenateamController.handle27202(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_APPLY_TEAM_EVENT, slot1)
	end
end

function ArenateamController.sender27203(slot0, slot1, slot2)
	slot0:SendProtocal(27203, {
		tid = slot1,
		srv_id = slot2
	})
end

function ArenateamController.handle27203(slot0, slot1)
	if #slot1.arena_team_member == 0 then
		slot0.model:setIsApplayRedpoint(false)
	end

	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_APPLY_LIST_EVENT, slot1)
end

function ArenateamController.sender27204(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(27204, {
		rid = slot1,
		srv_id = slot2,
		type = slot3
	})
end

function ArenateamController.handle27204(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_ANSWER_APPLY_EVENT, slot1)
	end
end

function ArenateamController.sender27205(slot0, slot1, slot2)
	slot0:SendProtocal(27205, {
		rid = slot1,
		srv_id = slot2
	})
end

function ArenateamController.handle27205(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_INVITATION_PLAYER_EVENT, slot1)
	end
end

function ArenateamController.sender27206(slot0)
	slot0:SendProtocal(27206, {})
end

function ArenateamController.handle27206(slot0, slot1)
	slot0.model:setIsInvitationRedpoint(false)
	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_INVITATION_LIST_EVENT, slot1)
end

function ArenateamController.sender27207(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(27207, {
		tid = slot1,
		srv_id = slot2,
		type = slot3
	})
end

function ArenateamController.handle27207(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0:sender27206()
	end
end

function ArenateamController.sender27208(slot0)
	slot0:SendProtocal(27208, {})
end

function ArenateamController.handle27208(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_KEY_CLEAR_EVENT, slot1)
	end
end

function ArenateamController.sender27210(slot0, slot1)
	slot0:SendProtocal(27210, {
		name = slot1
	})
end

function ArenateamController.handle27210(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_SEARCH_TEAM_EVENT, slot1)
	end
end

function ArenateamController.sender27211(slot0)
	slot0:SendProtocal(27211, {})
end

function ArenateamController.handle27211(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		if slot0.arenateam_hall_panel then
			slot0:sender27221()
		end

		slot0:sender27220()
		slot0.model:setIsApplayRedpoint(false)
	end
end

function ArenateamController.sender27212(slot0, slot1, slot2)
	slot0:SendProtocal(27212, {
		rid = slot1,
		srv_id = slot2
	})
end

function ArenateamController.handle27212(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE and slot0.arenateam_delete_player_panel then
		slot0:openArenateamDeletePlayerPanel(false)
	end
end

function ArenateamController.sender27213(slot0, slot1, slot2)
	slot0:SendProtocal(27213, {
		rid = slot1,
		srv_id = slot2
	})
end

function ArenateamController.handle27213(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		if slot0.arenateam_hall_panel then
			slot0:sender27221()
		end

		slot0:sender27220()
	end
end

function ArenateamController.sender27215(slot0, slot1, slot2)
	slot0:SendProtocal(27215, {})
end

function ArenateamController.handle27215(slot0, slot1)
	slot0.model:updateLoginRedpoint(slot1)
end

function ArenateamController.sender27216(slot0, slot1)
	slot0:SendProtocal(27216, {
		do_join_list = slot1
	})
end

function ArenateamController.handle27216(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_KEY_APPLY_TEAM_EVENT, slot1)
	end
end

function ArenateamController.sender27221(slot0)
	slot0:SendProtocal(27221, {})
end

function ArenateamController.handle27221(slot0, slot1)
	slot0.model:setMyTeamDetailsInfo(slot1)
	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_MY_TEAM_INFO_EVENT, slot1)
end

function ArenateamController.handle27222(slot0, slot1)
	if slot1.type == 1 then
		slot0:joinNewTeam()
	elseif slot1.type == 2 then
		if slot0.arenateam_hall_panel then
			slot0:sender27221()
		end

		slot0:sender27220()
	elseif slot1.type == 3 then
		slot0:newApply()
	elseif slot1.type == 4 then
		slot0:newInvitation()
	elseif slot1.type == 5 then
		slot0:leaveTeam()
	elseif slot1.type == 6 then
		slot0:fightResult()
	end
end

function ArenateamController.newApply(slot0)
	slot0.model:setIsApplayRedpoint(true)
	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_APPLY_RED_POINT_EVENT)
end

function ArenateamController.newInvitation(slot0, slot1)
	slot0.model:setIsInvitationRedpoint(true)
	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_INVITATION_RED_POINT_EVENT)
end

function ArenateamController.joinNewTeam(slot0, slot1)
	if slot0.arenateam_main_window then
		slot0:sender27220()

		if slot0.arenateam_hall_panel then
			slot0.arenateam_hall_panel:changeSelectedTab(ArenateamConst.TeamHallTabType.eMyTeam)
		else
			slot0:openArenateamHallPanel(true, {
				index = ArenateamConst.TeamHallTabType.eMyTeam
			})
		end
	end
end

function ArenateamController.leaveTeam(slot0, slot1)
	if slot0.arenateam_add_player_panel then
		slot0:openArenateamAddPlayerPanel(false)
	end

	if slot0.arenateam_main_window then
		if slot0.arenateam_hall_panel then
			slot0:openArenateamHallPanel(false)
		end

		slot0:sender27220()
	end
end

function ArenateamController.fightResult(slot0)
	slot0.model:setIsReportRedpoint(true)

	if slot0.arenateam_main_window then
		slot0:sender27220()
		slot0:sender27223(1, 100)
	end
end

function ArenateamController.sender27223(slot0, slot1, slot2)
	slot0:SendProtocal(27223, {
		start_rank = slot1,
		end_rank = slot2
	})
end

function ArenateamController.handle27223(slot0, slot1)
	slot0.model:updateRankInfo(slot1)
	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_MAIN_RANK_EVENT, slot1)
end

function ArenateamController.sender27224(slot0, slot1)
	slot0:SendProtocal(27224, {
		id = slot1
	})
end

function ArenateamController.handle27224(slot0, slot1)
	if slot1.code == TRUE then
		slot0.model:updateRewardInfo(slot1.id)
		GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_RECEIVE_BOX_EVENT, slot1)
	end
end

function ArenateamController.sender27225(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(27225, {
		limit_lev = slot1,
		limit_power = slot2,
		is_check = slot3
	})
end

function ArenateamController.handle27225(slot0, slot1)
	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_TEAM_SET_EVENT, slot1)

		if slot0.arenateam_team_set_panel then
			slot0:openArenateamTeamSetPanel(false)
		end
	end
end

function ArenateamController.sender27226(slot0, slot1)
	slot0:SendProtocal(27226, {
		name = slot1
	})
end

function ArenateamController.handle27226(slot0, slot1)
	if slot1.code == TRUE then
		message(TI18N("队伍名修改成功"))
		GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_CHANGE_NAME_EVENT, slot1)
	else
		message(slot1.msg)
	end
end

function ArenateamController.sender27228(slot0)
	slot0:SendProtocal(27228, {})
end

function ArenateamController.handle27228(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_GET_RECOMMEND_INFO_EVENT, slot1)
end

function ArenateamController.sender27229(slot0, slot1)
	slot0:SendProtocal(27229, {
		name = slot1
	})
end

function ArenateamController.handle27229(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_SEARCH_PLAYER_EVENT, slot1)
end

function ArenateamController.sender27240(slot0)
	slot0:SendProtocal(27240, {})
end

function ArenateamController.handle27240(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_JOIN_GAME_EVENT, slot1)
	end
end

function ArenateamController.sender27241(slot0)
	slot0:SendProtocal(27241, {})
end

function ArenateamController.handle27241(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_LEAVE_GAME_EVENT, slot1)
	end
end

function ArenateamController.sender27242(slot0, slot1)
	slot0:SendProtocal(27242, {
		pos_info = slot1
	})
end

function ArenateamController.handle27242(slot0, slot1)
	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_SAVE_FROM_EVENT, slot1)
		slot0:sender27221()
	else
		message(slot1.msg)
	end
end

function ArenateamController.sender27243(slot0)
	slot0:SendProtocal(27243, {})
end

function ArenateamController.handle27243(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_THREE_TEAM_INFO_EVENT, slot1)
end

function ArenateamController.sender27250(slot0)
	slot0:SendProtocal(27250, {})
end

function ArenateamController.handle27250(slot0, slot1)
	if slot1.code == TRUE then
		slot0.refresh_27250 = true
	end
end

function ArenateamController.sender27251(slot0)
	slot0:SendProtocal(27251, {})
end

function ArenateamController.handle27251(slot0, slot1)
	if slot0.refresh_27250 then
		slot0.refresh_27250 = false

		message(TI18N("刷新成功"))
	end

	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_MATCH_OTHER_EVENT, slot1)
end

function ArenateamController.sender27252(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(27252, {
		tid = slot1,
		srv_id = slot2,
		is_auto = slot3
	})
end

function ArenateamController.handle27252(slot0, slot1)
	message(slot1.msg)
end

function ArenateamController.handle27253(slot0, slot1)
	BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.Arean_Team, slot1)
end

function ArenateamController.sender27255(slot0)
	slot0:SendProtocal(27255, {})
end

function ArenateamController.handle27255(slot0, slot1)
	slot0.model:setIsReportRedpoint(false)
	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_MIAIN_REPORT_EVENT, slot1)
end

function ArenateamController.sender27256(slot0, slot1)
	slot0:SendProtocal(27256, {
		id = slot1
	})
end

function ArenateamController.handle27256(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_SINGLE_REPORT_EVENT, slot1)
end

function ArenateamController.openArenateamMainWindow(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_main_window == nil then
			slot0.arenateam_main_window = ArenateamMainWindow.New()
		end

		if slot0.arenateam_main_window:isOpen() == false then
			slot0.arenateam_main_window:open(slot2)
		end
	elseif slot0.arenateam_main_window then
		slot0.arenateam_main_window:close()

		slot0.arenateam_main_window = nil
	end
end

function ArenateamController.openArenateamCreateTeamPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_create_team_panel == nil then
			slot0.arenateam_create_team_panel = ArenateamCreateTeamPanel.New()
		end

		if slot0.arenateam_create_team_panel:isOpen() == false then
			slot0.arenateam_create_team_panel:open(slot2)
		end
	elseif slot0.arenateam_create_team_panel then
		slot0.arenateam_create_team_panel:close()

		slot0.arenateam_create_team_panel = nil
	end
end

function ArenateamController.openArenateamHallPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_hall_panel == nil then
			slot0.arenateam_hall_panel = ArenateamHallPanel.New()
		end

		if slot0.arenateam_hall_panel:isOpen() == false then
			slot0.arenateam_hall_panel:open(slot2)
		end
	elseif slot0.arenateam_hall_panel then
		slot0.arenateam_hall_panel:close()

		slot0.arenateam_hall_panel = nil
	end
end

function ArenateamController.openArenateamChangTeamNamePanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_chang_team_name_panel == nil then
			slot0.arenateam_chang_team_name_panel = ArenateamChangTeamNamePanel.New()
		end

		if slot0.arenateam_chang_team_name_panel:isOpen() == false then
			slot0.arenateam_chang_team_name_panel:open(slot2)
		end
	elseif slot0.arenateam_chang_team_name_panel then
		slot0.arenateam_chang_team_name_panel:close()

		slot0.arenateam_chang_team_name_panel = nil
	end
end

function ArenateamController.openArenateamTeamSetPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_team_set_panel == nil then
			slot0.arenateam_team_set_panel = ArenateamTeamSetPanel.New()
		end

		if slot0.arenateam_team_set_panel:isOpen() == false then
			slot0.arenateam_team_set_panel:open(slot2)
		end
	elseif slot0.arenateam_team_set_panel then
		slot0.arenateam_team_set_panel:close()

		slot0.arenateam_team_set_panel = nil
	end
end

function ArenateamController.openArenateamDeletePlayerPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_delete_player_panel == nil then
			slot0.arenateam_delete_player_panel = ArenateamDeletePlayerPanel.New()
		end

		if slot0.arenateam_delete_player_panel:isOpen() == false then
			slot0.arenateam_delete_player_panel:open(slot2)
		end
	elseif slot0.arenateam_delete_player_panel then
		slot0.arenateam_delete_player_panel:close()

		slot0.arenateam_delete_player_panel = nil
	end
end

function ArenateamController.openArenateamAddPlayerPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_add_player_panel == nil then
			slot0.arenateam_add_player_panel = ArenateamAddPlayerPanel.New()
		end

		if slot0.arenateam_add_player_panel:isOpen() == false then
			slot0.arenateam_add_player_panel:open(slot2)
		end
	elseif slot0.arenateam_add_player_panel then
		slot0.arenateam_add_player_panel:close()

		slot0.arenateam_add_player_panel = nil
	end
end

function ArenateamController.setOpenFunction(slot0, slot1, slot2, slot3)
	slot0[slot1] = function (slot0, slot1)
		if slot0 == true then
			if uv0[uv1] == nil then
				uv0[uv1] = uv2.New()
			end

			if uv0[uv1]:isOpen() == false then
				uv0[uv1]:open(slot1)
			end
		elseif uv0[uv1] then
			uv0[uv1]:close()

			uv0[uv1] = nil
		end
	end
end

function ArenateamController.openArenateamFormPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_form_panel == nil then
			slot0.arenateam_form_panel = ArenateamFormPanel.New()
		end

		if slot0.arenateam_form_panel:isOpen() == false then
			slot0.arenateam_form_panel:open(slot2)
		end
	elseif slot0.arenateam_form_panel then
		slot0.arenateam_form_panel:close()

		slot0.arenateam_form_panel = nil
	end
end

function ArenateamController.openArenateamFightListPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_fight_list_panel == nil then
			slot0.arenateam_fight_list_panel = ArenateamFightListPanel.New()
		end

		if slot0.arenateam_fight_list_panel:isOpen() == false then
			slot0.arenateam_fight_list_panel:open(slot2)
		end
	elseif slot0.arenateam_fight_list_panel then
		slot0.arenateam_fight_list_panel:close()

		slot0.arenateam_fight_list_panel = nil
	end
end

function ArenateamController.openArenateamFightTips(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_fight_tips == nil then
			slot0.arenateam_fight_tips = ArenateamFightTips.New()
		end

		if slot0.arenateam_fight_tips:isOpen() == false then
			slot0.arenateam_fight_tips:open(slot2)
		end
	elseif slot0.arenateam_fight_tips then
		slot0.arenateam_fight_tips:close()

		slot0.arenateam_fight_tips = nil
	end
end

function ArenateamController.openArenateamFightResultPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_fight_result_panel == nil then
			slot0.arenateam_fight_result_panel = ArenateamFightResultPanel.New((slot2 or {}).result or 1)
		end

		if slot0.arenateam_fight_result_panel:isOpen() == false then
			slot0.arenateam_fight_result_panel:open(slot2)
		end
	elseif slot0.arenateam_fight_result_panel then
		slot0.arenateam_fight_result_panel:close()

		slot0.arenateam_fight_result_panel = nil
	end
end

function ArenateamController.openArenateamFightRecordPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_fight_record_panel == nil then
			slot0.arenateam_fight_record_panel = ArenateamFightRecordPanel.New()
		end

		if slot0.arenateam_fight_record_panel:isOpen() == false then
			slot0.arenateam_fight_record_panel:open(slot2)
		end
	elseif slot0.arenateam_fight_record_panel then
		slot0.arenateam_fight_record_panel:close()

		slot0.arenateam_fight_record_panel = nil
	end
end

function ArenateamController.openArenateamFightVedioPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_fight_vedio_panel == nil then
			slot0.arenateam_fight_vedio_panel = ArenateamFightVedioPanel.New()
		end

		if slot0.arenateam_fight_vedio_panel:isOpen() == false then
			slot0.arenateam_fight_vedio_panel:open(slot2)
		end
	elseif slot0.arenateam_fight_vedio_panel then
		slot0.arenateam_fight_vedio_panel:close()

		slot0.arenateam_fight_vedio_panel = nil
	end
end

function ArenateamController.openArenateamBoxRewardPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_box_reward_panel == nil then
			slot0.arenateam_box_reward_panel = ArenateamBoxRewardPanel.New()
		end

		if slot0.arenateam_box_reward_panel:isOpen() == false then
			slot0.arenateam_box_reward_panel:open(slot2)
		end
	elseif slot0.arenateam_box_reward_panel then
		slot0.arenateam_box_reward_panel:close()

		slot0.arenateam_box_reward_panel = nil
	end
end

function ArenateamController.openArenateamRankRewardPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_rank_reward_panel == nil then
			slot0.arenateam_rank_reward_panel = ArenateamRankRewardPanel.New()
		end

		if slot0.arenateam_rank_reward_panel:isOpen() == false then
			slot0.arenateam_rank_reward_panel:open(slot2)
		end
	elseif slot0.arenateam_rank_reward_panel then
		slot0.arenateam_rank_reward_panel:close()

		slot0.arenateam_rank_reward_panel = nil
	end
end

function ArenateamController.openArenateamChatPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenateam_chat_panel == nil then
			slot0.arenateam_chat_panel = ArenateamChatPanel.New()
		end

		if slot0.arenateam_chat_panel:isOpen() == false then
			slot0.arenateam_chat_panel:open(slot2)
		end
	elseif slot0.arenateam_chat_panel then
		slot0.arenateam_chat_panel:close()

		slot0.arenateam_chat_panel = nil
	end
end

function ArenateamController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
