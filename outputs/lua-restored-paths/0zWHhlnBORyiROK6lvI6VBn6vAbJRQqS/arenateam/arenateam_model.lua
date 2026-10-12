ArenateamModel = ArenateamModel or BaseClass()

function ArenateamModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function ArenateamModel.config(slot0)
	slot0.my_team_info = nil
	slot0.my_team_details_info = nil
end

function ArenateamModel.checkArenateamTotalRedPoint(slot0, slot1)
	slot2 = false

	if slot0.my_team_info then
		if slot0.my_team_info.state == 1 or slot0.my_team_info.state == 2 then
			for slot6, slot7 in ipairs(slot0.my_team_info.award_list) do
				if slot7.status == 1 then
					slot2 = true

					break
				end
			end

			if not (slot2 or slot0.is_report_red) and slot0.my_team_info and #slot0.my_team_info.team_members < 3 then
				slot2 = slot0.is_apply_red
			end

			if not (slot2 or slot0.is_invitation_red) then
				slot2 = slot0.is_chat_red
			end
		elseif slot0.my_team_info.state == 4 or slot0.my_team_info.state == 3 then
			for slot6, slot7 in ipairs(slot0.my_team_info.award_list) do
				if slot7.status == 1 then
					slot2 = true

					break
				end
			end

			slot2 = slot2 or slot0.is_report_red
		end

		if slot1 then
			GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_ALL_RED_POINT_EVENT)
			MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.ladder, {
				bid = CrossgroundConst.Red_Type.Arenateam,
				status = slot2
			})
		end

		if slot2 == nil then
			slot2 = false
		end
	end

	return slot2
end

function ArenateamModel.updateLoginRedpoint(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.login_data = slot1

	for slot5, slot6 in ipairs(slot1.point) do
		if slot6.type == 1 then
			slot0.is_report_red = slot6.state == 1
		elseif slot6.type == 2 then
			slot0.is_apply_red = slot6.state == 1
		elseif slot6.type == 3 then
			slot0.is_invitation_red = slot6.state == 1
		elseif slot6.type == 4 then
			slot0.is_chat_red = slot6.state == 1
		end
	end

	slot0:checkArenateamTotalRedPoint(true)
end

function ArenateamModel.setIsReportRedpoint(slot0, slot1)
	slot0.is_report_red = slot1

	slot0:checkArenateamTotalRedPoint(true)
end

function ArenateamModel.setIsApplayRedpoint(slot0, slot1)
	slot0.is_apply_red = slot1

	slot0:checkArenateamTotalRedPoint(true)
end

function ArenateamModel.setIsInvitationRedpoint(slot0, slot1)
	slot0.is_invitation_red = slot1

	slot0:checkArenateamTotalRedPoint(true)
end

function ArenateamModel.setIsChatRedpoint(slot0, slot1)
	slot0.is_chat_red = slot1

	slot0:checkArenateamTotalRedPoint(true)
end

function ArenateamModel.getMyTeamInfo(slot0)
	return slot0.my_team_info
end

function ArenateamModel.setMyTeamInfo(slot0, slot1)
	slot0.my_team_info = slot1

	slot0:checkArenateamTotalRedPoint(true)
end

function ArenateamModel.updateRewardInfo(slot0, slot1)
	if slot0.my_team_info and slot1 then
		for slot5, slot6 in ipairs(slot0.my_team_info.award_list) do
			if slot6.award_id == slot1 then
				slot6.status = 2
			end
		end

		slot0:checkArenateamTotalRedPoint(true)
	end
end

function ArenateamModel.setMyTeamDetailsInfo(slot0, slot1)
	if slot1.tid == 0 then
		slot0.my_team_details_info = nil
	else
		slot0.my_team_details_info = slot1
	end
end

function ArenateamModel.getMyTeamDetailsInfo(slot0)
	return slot0.my_team_details_info
end

function ArenateamModel.isHaveTeam(slot0)
	if slot0.my_team_info and slot0.my_team_info.tid ~= 0 then
		return true
	end

	return false
end

function ArenateamModel.updateRankInfo(slot0, slot1)
	slot0.rank_data = slot1
end

function ArenateamModel.getRankData(slot0)
	return slot0.rank_data
end

function ArenateamModel.checkArenaTeamIsOpen(slot0, slot1)
	slot2 = Config.ArenaTeamData.data_const.open_lev

	if RoleController:getInstance():getRoleVo() and slot2 and slot3.lev < slot2.val then
		if not slot1 then
			message(slot2.desc)
		end

		return false, 1, slot2.desc
	end

	return true
end

function ArenateamModel.isLeader(slot0)
	if slot0.my_team_info then
		for slot5, slot6 in ipairs(slot0.my_team_info.team_members) do
			for slot10, slot11 in ipairs(slot6.ext) do
				if slot11.extra_key == 1 and slot11.extra_val == 1 and RoleController:getInstance():getRoleVo() and slot6.rid == slot12.rid and slot6.sid == slot12.srv_id then
					return true
				end
			end
		end
	end

	return false
end

function ArenateamModel.getTimeStep(slot0)
	if slot0.time_step then
		return slot0.time_step
	end

	return 0
end

function ArenateamModel.startTimeTicket(slot0)
	if slot0.refresh_cd == nil then
		slot0.refresh_cd = 10

		if Config.ArenaTeamData.data_const.refresh_cd then
			slot0.refresh_cd = slot1.val
		end
	end

	slot0.time_step = slot0.refresh_cd
	slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
		uv0.time_step = uv0.time_step - 1

		GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_TIMER_EVENT, uv0.time_step)

		if uv0.time_step <= 0 then
			uv0:clearTimeTicket()
		end
	end, 1)
end

function ArenateamModel.clearTimeTicket(slot0)
	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function ArenateamModel.__delete(slot0)
end
