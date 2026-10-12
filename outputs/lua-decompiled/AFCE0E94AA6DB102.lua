ArenaManyPeopleModel = ArenaManyPeopleModel or BaseClass()

function ArenaManyPeopleModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function ArenaManyPeopleModel.config(slot0)
	slot0.my_team_info = nil
	slot0.is_touch_fight = false
	slot0.is_report_red = false
end

function ArenaManyPeopleModel.checkArenateamTotalRedPoint(slot0)
	slot1 = false

	if slot0.my_team_info then
		if slot0.my_team_info.state == 1 then
			for slot5, slot6 in ipairs(slot0.my_team_info.award_list) do
				if slot6.status == 1 then
					slot1 = true

					break
				end
			end

			if not slot1 and slot0.invitation_info and slot0.invitation_info.team_members and #slot0.invitation_info.team_members > 0 then
				slot1 = true
			end

			slot1 = slot1 or slot0.is_report_red
		end

		GlobalEvent:getInstance():Fire(ArenaManyPeopleEvent.ARENAMANYPOEPLE_ALL_RED_POINT_EVENT)

		if slot1 == nil then
			slot1 = false
		end
	end

	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.arena_many_people, slot1)

	return slot1
end

function ArenaManyPeopleModel.setIsReportRedpoint(slot0, slot1)
	slot0.is_report_red = slot1

	slot0:checkArenateamTotalRedPoint()
end

function ArenaManyPeopleModel.getIsReportRedpoint(slot0)
	return slot0.is_report_red
end

function ArenaManyPeopleModel.getMyTeamInfo(slot0)
	return slot0.my_team_info
end

function ArenaManyPeopleModel.setMyTeamInfo(slot0, slot1)
	slot0.my_team_info = slot1

	slot0:checkArenateamTotalRedPoint()
end

function ArenaManyPeopleModel.updateBuyNum(slot0, slot1)
	if slot0.my_team_info and slot1 then
		slot0.my_team_info.count = slot1.count
		slot0.my_team_info.buy_count = slot1.buy_count

		slot0:checkArenateamTotalRedPoint()
	end
end

function ArenaManyPeopleModel.getMyInfo(slot0)
	if slot0.my_team_info then
		slot2 = RoleController:getInstance():getRoleVo()

		for slot6, slot7 in ipairs(slot0.my_team_info.team_members) do
			if slot2 and slot7.rid == slot2.rid and slot7.sid == slot2.srv_id then
				return slot7
			end
		end
	end

	return nil
end

function ArenaManyPeopleModel.updateMyRank(slot0, slot1)
	if slot0.my_team_info and slot1 then
		slot3 = RoleController:getInstance():getRoleVo()

		for slot7, slot8 in ipairs(slot0.my_team_info.team_members) do
			if slot3 and slot8.rid == slot3.rid and slot8.sid == slot3.srv_id then
				slot8.rank = slot1.rank

				break
			end
		end
	end
end

function ArenaManyPeopleModel.setMatchInfo(slot0, slot1)
	slot0.match_info = slot1
end

function ArenaManyPeopleModel.getMatchInfo(slot0)
	return slot0.match_info
end

function ArenaManyPeopleModel.updateMyMatchInfo(slot0, slot1)
	if slot0.match_info and slot0.match_info.atk_team_members then
		for slot5, slot6 in pairs(slot0.match_info.atk_team_members) do
			if slot1 and slot6.rid == slot1.rid and slot6.sid == slot1.sid then
				slot1.pos = slot6.pos
				slot0.match_info.atk_team_members[slot5] = slot1

				break
			end
		end
	end
end

function ArenaManyPeopleModel.setInvitationInfo(slot0, slot1)
	slot0.invitation_info = slot1

	slot0:checkArenateamTotalRedPoint()
end

function ArenaManyPeopleModel.getInvitationInfo(slot0)
	return slot0.invitation_info
end

function ArenaManyPeopleModel.updateRewardInfo(slot0, slot1)
	if slot0.my_team_info and slot1 then
		for slot5, slot6 in ipairs(slot0.my_team_info.award_list) do
			if slot6.award_id == slot1 then
				slot6.status = 2
			end
		end

		slot0:checkArenateamTotalRedPoint()
	end
end

function ArenaManyPeopleModel.setHideIndex(slot0)
	slot0.hide_index = math.random(1, 3)
end

function ArenaManyPeopleModel.getHideIndex(slot0)
	if not slot0.hide_index then
		slot0:setHideIndex()
	end

	return slot0.hide_index
end

function ArenaManyPeopleModel.setIsTouchFight(slot0, slot1)
	slot0.is_touch_fight = slot1
end

function ArenaManyPeopleModel.getIsTouchFight(slot0)
	return slot0.is_touch_fight
end

function ArenaManyPeopleModel.checkAMPIsOpen(slot0)
	slot1 = false
	slot3 = Config.HolidayArenaTeamData.data_const.team_open_day
	slot4 = RoleController:getInstance():getRoleVo()

	if Config.HolidayArenaTeamData.data_const.team_open_lev and slot2.val <= slot4.lev and slot3 and slot3.val <= slot4.open_day then
		slot1 = true
	end

	return slot1
end

function ArenaManyPeopleModel.__delete(slot0)
end
