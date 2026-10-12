LadderModel = LadderModel or BaseClass()

function LadderModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function LadderModel.config(slot0)
	slot0.myBaseInfo = {}
	slot0.enemyListData = {}
	slot0.ladderOpenStatus = 0
	slot0.guildwar_red_list = {}
end

function LadderModel.setLadderMyBaseInfo(slot0, slot1)
	slot0.myBaseInfo = slot1
end

function LadderModel.getLadderMyBaseInfo(slot0)
	return slot0.myBaseInfo
end

function LadderModel.getLeftChallengeCount(slot0)
	if slot0.myBaseInfo then
		return slot0.myBaseInfo.can_combat_num or 0
	end

	return 0
end

function LadderModel.getTodayBuyCount(slot0)
	if slot0.myBaseInfo then
		return slot0.myBaseInfo.buy_combat_num or 0
	end

	return 0
end

function LadderModel.getTodayLeftBuyCount(slot0)
	slot2 = slot0.myBaseInfo.buy_combat_num or 0

	for slot7, slot8 in pairs(Config.SkyLadderData.data_buy_num) do
		if slot8.vip <= RoleController:getInstance():getRoleVo().vip_lev then
			slot3 = 0 + 1
		end
	end

	if slot3 - slot2 < 0 then
		slot4 = 0
	end

	return slot4
end

function LadderModel.setLadderEnemyListData(slot0, slot1)
	slot0.enemyListData = slot1 or {}
end

function LadderModel.updateLadderEnemyListData(slot0, slot1)
	for slot5, slot6 in pairs(slot1 or {}) do
		for slot10, slot11 in pairs(slot0.enemyListData) do
			if slot6.idx == slot11.idx then
				for slot15, slot16 in pairs(slot6) do
					slot11[slot15] = slot16
				end

				break
			end
		end
	end
end

function LadderModel.getLadderEnemyListData(slot0)
	return slot0.enemyListData
end

function LadderModel.getLadderEnemyDataByIndex(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.enemyListData) do
		if slot7.idx == slot1 then
			slot2 = slot7

			break
		end
	end

	return slot2
end

function LadderModel.setLadderOpenStatus(slot0, slot1)
	slot0.ladderOpenStatus = slot1
end

function LadderModel.getLadderIsOpen(slot0)
	return slot0.ladderOpenStatus and slot0.ladderOpenStatus == 1
end

function LadderModel.getLadderOpenStatus(slot0, slot1)
	slot1 = slot1 or false

	if Config.SkyLadderData.data_const.join_min_lev and slot3.val <= RoleController:getInstance():getRoleVo().lev then
		return true
	else
		if not slot1 then
			message(slot3.desc)
		end

		return false, slot3.desc
	end
end

function LadderModel.updateLadderRedStatus(slot0, slot1, slot2)
	if slot0.guildwar_red_list[slot1] == slot2 then
		return
	end

	slot0.guildwar_red_list[slot1] = slot2

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.ladder, {
		bid = CrossgroundConst.Red_Type.ladder,
		status = slot0:checkLadderRedStatus()
	})
	GlobalEvent:getInstance():Fire(LadderEvent.UpdateLadderRedStatus, slot1, slot2)
end

function LadderModel.checkRedIsShowByRedType(slot0, slot1)
	return slot0.guildwar_red_list[slot1] or false
end

function LadderModel.checkLadderRedStatus(slot0)
	for slot4, slot5 in pairs(slot0.guildwar_red_list) do
		if slot5 == true then
			return true
		end
	end

	return false
end

function LadderModel.__delete(slot0)
end
