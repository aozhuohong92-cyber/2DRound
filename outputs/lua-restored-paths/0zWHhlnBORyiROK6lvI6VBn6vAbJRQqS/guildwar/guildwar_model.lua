GuildwarModel = GuildwarModel or BaseClass()

function GuildwarModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function GuildwarModel.config(slot0)
	slot0.challengeCount = 0
	slot0.guildWarResult = GuildwarConst.result.fighting
	slot0.myGuildWarBaseInfo = {}
	slot0.enemyGuildWarBaseInfo = {}
	slot0.guildWarStatus = GuildwarConst.status.close
	slot0.guildWarStartTime = 0
	slot0.guildWarEndTime = 0
	slot0.guildWarEnemyFlag = 0
	slot0.guildWarTopThreeRank = {}
	slot0.myGuildWarPositionList = {}
	slot0.enemyGuildWarPositionList = {}
	slot0.award_box_data = {}
	slot0.guildwar_red_list = {}
end

function GuildwarModel.setAvgPower(slot0, slot1)
	slot0.avg_power = slot1 or 0
end

function GuildwarModel.getAvgPower(slot0)
	return slot0.avg_power or 0
end

function GuildwarModel.checkIsHaveEnemyCacheData(slot0)
	if next(slot0.enemyGuildWarPositionList) == nil then
		return false
	else
		return true
	end
end

function GuildwarModel.clearEnemyCacheData(slot0)
	slot0.enemyGuildWarPositionList = {}
end

function GuildwarModel.setGuildWarChallengeCount(slot0, slot1)
	slot0.challengeCount = slot1 or 0

	slot0:updateChallengeCountRedStatus()
end

function GuildwarModel.getGuildWarChallengeCount(slot0)
	return slot0.challengeCount
end

function GuildwarModel.updateChallengeCountRedStatus(slot0)
	if slot0.guildWarEnemyFlag == TRUE and slot0.guildWarStatus == GuildwarConst.status.processing and slot0.challengeCount < Config.GuildWarData.data_const.challange_time_limit.val then
		slot0:updateGuildWarRedStatus(GuildConst.red_index.guildwar_count, true)
	else
		slot0:updateGuildWarRedStatus(GuildConst.red_index.guildwar_count, false)
	end
end

function GuildwarModel.setGuildWarResult(slot0, slot1)
	slot0.guildWarResult = slot1
end

function GuildwarModel.getGuildWarResult(slot0)
	return slot0.guildWarResult
end

function GuildwarModel.setMyGuildWarBaseInfo(slot0, slot1)
	slot0.myGuildWarBaseInfo = slot1 or {}
end

function GuildwarModel.getMyGuildWarBaseInfo(slot0)
	return slot0.myGuildWarBaseInfo
end

function GuildwarModel.updateMyGuildWarBaseInfo(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0.myGuildWarBaseInfo[slot5] = slot6
	end
end

function GuildwarModel.updateEnemyGuildWarBaseInfo(slot0, slot1)
	slot0.enemyGuildWarBaseInfo.hp = slot1
end

function GuildwarModel.getEnemyGuildWarBaseInfo(slot0)
	return slot0.enemyGuildWarBaseInfo
end

function GuildwarModel.setEnemyGuildWarData(slot0, slot1)
	slot0.enemyGuildWarBaseInfo.gname = slot1.gname2 or ""
	slot0.enemyGuildWarBaseInfo.hp = slot1.hp2 or 0
	slot0.enemyGuildWarBaseInfo.g_id = slot1.g_id or 0
	slot0.enemyGuildWarBaseInfo.g_sid = slot1.g_sid or ""
	slot0.enemyGuildWarPositionList = {}

	for slot5, slot6 in pairs(slot1.defense or {}) do
		slot7 = GuildWarPositionVo.New()

		slot7:updateData(slot6)

		slot0.enemyGuildWarPositionList[slot6.pos] = slot7
	end
end

function GuildwarModel.getEnemyGuildWarPositionList(slot0)
	return slot0.enemyGuildWarPositionList
end

function GuildwarModel.getEnemyPositionHpByPos(slot0, slot1)
	if slot0.enemyGuildWarPositionList[slot1] then
		return slot2.hp
	end

	return 0
end

function GuildwarModel.checkEnemyIsHaveLivePosition(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.enemyGuildWarPositionList) do
		if slot6.hp > 0 then
			slot1 = true

			break
		end
	end

	return slot1
end

function GuildwarModel.setGuildWarStatus(slot0, slot1)
	slot0.guildWarStatus = slot1.status or GuildwarConst.status.close
	slot0.guildWarStartTime = slot1.start_time or 0
	slot0.guildWarEndTime = slot1.end_time or 0
	slot0.guildWarEnemyFlag = slot1.flag or 0

	if slot0.guildWarStatus == GuildwarConst.status.close then
		slot0:config()
	end

	slot0:checkGuildWarStatusRed()
	slot0:updateChallengeCountRedStatus()
end

function GuildwarModel.checkGuildWarStatusRed(slot0)
	if slot0.guildWarEnemyFlag == TRUE and slot0.guildWarStatus == GuildwarConst.status.showing then
		if not slot0._match_red_flag then
			slot0._match_red_flag = true

			slot0:updateGuildWarRedStatus(GuildConst.red_index.guildwar_match, true)
		end
	elseif slot0.guildWarEnemyFlag == TRUE and slot0.guildWarStatus == GuildwarConst.status.processing then
		if not slot0._start_red_flag then
			slot0._start_red_flag = true

			slot0:updateGuildWarRedStatus(GuildConst.red_index.guildwar_start, true)
		end

		slot0:updateGuildWarRedStatus(GuildConst.red_index.guildwar_match, false)
	else
		slot0:updateGuildWarRedStatus(GuildConst.red_index.guildwar_match, false)
		slot0:updateGuildWarRedStatus(GuildConst.red_index.guildwar_start, false)
	end
end

function GuildwarModel.getGuildWarStatus(slot0)
	return slot0.guildWarStatus
end

function GuildwarModel.getGuildWarSurplusTime(slot0)
	return slot0.guildWarEndTime - GameNet:getInstance():getTime()
end

function GuildwarModel.getGuildWarEnemyFlag(slot0)
	return slot0.guildWarEnemyFlag
end

function GuildwarModel.setMyGuildWarPositionData(slot0, slot1)
	slot0.myGuildWarPositionList = {}

	for slot5, slot6 in pairs(slot1) do
		slot7 = GuildWarPositionVo.New()

		slot7:updateData(slot6)

		slot0.myGuildWarPositionList[slot6.pos] = slot7
	end
end

function GuildwarModel.getMyGuildWarPositionList(slot0)
	return slot0.myGuildWarPositionList
end

function GuildwarModel.updateMyGuildWarPositionData(slot0, slot1)
	for slot5, slot6 in pairs(slot1 or {}) do
		if slot0.myGuildWarPositionList[slot6.pos] then
			slot7:updateData(slot6)
		end
	end
end

function GuildwarModel.updateEnemyGuildWarPositionData(slot0, slot1)
	for slot5, slot6 in pairs(slot1 or {}) do
		if slot0.enemyGuildWarPositionList[slot6.pos] then
			slot7:updateData(slot6)
		end
	end
end

function GuildwarModel.setGuildWarTopThreeRank(slot0, slot1)
	slot0.guildWarTopThreeRank = slot1
end

function GuildwarModel.getGuildWarTopThreeRank(slot0)
	return slot0.guildWarTopThreeRank
end

function GuildwarModel.updateGuildWarRedStatus(slot0, slot1, slot2, slot3)
	if slot0.guildwar_red_list[slot1] == slot2 then
		return
	end

	slot0.guildwar_red_list[slot1] = slot2

	if not slot3 then
		MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.guild, {
			bid = slot1,
			status = slot2
		})
		GlobalEvent:getInstance():Fire(GuildEvent.UpdateGuildRedStatus, slot1, slot2)
	end

	GlobalEvent:getInstance():Fire(GuildwarEvent.UpdateGuildWarRedStatusEvent, slot1, slot2)
end

function GuildwarModel.checkRedIsShowByRedType(slot0, slot1)
	return slot0.guildwar_red_list[slot1] or false
end

function GuildwarModel.checkGuildGuildWarRedStatus(slot0)
	for slot4, slot5 in pairs(slot0.guildwar_red_list) do
		if slot5 == true and slot4 ~= GuildConst.red_index.guildwar_log then
			return true
		end
	end

	return false
end

function GuildwarModel.setGuildWarBoxData(slot0, slot1)
	slot3 = slot1.result
	slot4 = slot1.status
	slot5 = slot1.end_time

	if slot1.guild_war_box then
		slot0.award_box_data = {}

		for slot9, slot10 in pairs(slot2) do
			slot10.status = slot3
			slot11 = GuildWarBoxVo.New()

			slot11:updateData(slot10)
			table.insert(slot0.award_box_data, slot11)
		end
	end

	if slot4 and slot4 == 1 and slot5 and GameNet:getInstance():getTime() < slot5 then
		slot0.is_can_get_box = true
	else
		slot0.is_can_get_box = false
	end

	if slot0.is_can_get_box and not slot0:checkIsGetBoxAward() then
		slot0:updateGuildWarRedStatus(GuildConst.red_index.guildwar_box, true)
	else
		slot0:updateGuildWarRedStatus(GuildConst.red_index.guildwar_box, false)
	end
end

function GuildwarModel.updateGuildWarBoxData(slot0, slot1)
	if slot1 then
		if slot0:getGuildWarDataByOrder(slot1.order) then
			slot2:updateData(slot1)
		end

		if slot0.is_can_get_box and not slot0:checkIsGetBoxAward() then
			slot0:updateGuildWarRedStatus(GuildConst.red_index.guildwar_box, true)
		else
			slot0:updateGuildWarRedStatus(GuildConst.red_index.guildwar_box, false)
		end
	end
end

function GuildwarModel.getGuildWarDataByOrder(slot0, slot1)
	for slot5, slot6 in pairs(slot0.award_box_data) do
		if slot6.order == slot1 then
			return slot6
		end
	end
end

function GuildwarModel.getGuildWarBoxData(slot0)
	return slot0.award_box_data
end

function GuildwarModel.checkIsGetBoxAward(slot0)
	slot1 = false
	slot2 = RoleController:getInstance():getRoleVo()

	for slot6, slot7 in pairs(slot0.award_box_data) do
		if slot2 and slot7.rid == slot2.rid and slot7.sid == slot2.srv_id then
			slot1 = true

			break
		end
	end

	return slot1
end

function GuildwarModel.__delete(slot0)
end
