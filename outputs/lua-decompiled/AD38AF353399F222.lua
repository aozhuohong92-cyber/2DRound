ElitematchModel = ElitematchModel or BaseClass()

function ElitematchModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function ElitematchModel.config(slot0)
	slot0.state = nil
	slot0.cur_elite_lev = 1
	slot0.cur_elite_rank = 0
	slot0.redPoint = true
	slot0.scdata = nil
	slot0.scdata24905 = nil
	slot0.orderaction_data = nil
	slot0.orderaction_first_red_status = 0
end

function ElitematchModel.setSCData(slot0, slot1)
	if slot0.scdata == nil then
		slot0.scdata = slot1
	else
		for slot5, slot6 in pairs(slot1) do
			if slot0.scdata[slot5] then
				slot0.scdata[slot5] = slot6

				if slot5 == "rmb_status" then
					slot0:setGiftStatus(slot6)
				end
			end
		end
	end
end

function ElitematchModel.getSCData(slot0)
	return slot0.scdata or {}
end

function ElitematchModel.getEliteLev(slot0)
	if not slot0.scdata then
		return 1
	end

	return slot0.scdata.lev
end

function ElitematchModel.getEliteRank(slot0)
	if not slot0.scdata then
		return 0
	end

	return slot0.scdata.rank
end

function ElitematchModel.setRedPoint(slot0, slot1)
	slot0.redPoint = slot1
end

function ElitematchModel.getElitematchTotalRedPoint(slot0)
	if slot0:checkElitematchIsOpen(true) then
		if slot0:getRewardRedpoint() then
			return true
		end

		if slot0:getOrderactionRedpoint() then
			return true
		end

		if slot0.scdata24905 and slot0.scdata24905.state == 0 then
			return false
		end

		if slot0:getMatchCountRedpoint() then
			return true
		end
	end

	return false
end

function ElitematchModel.getMatchCountRedpoint(slot0)
	if not slot0.scdata then
		return false
	end

	if slot0.scdata.day_combat_count > 0 then
		return true
	end

	return false
end

function ElitematchModel.getRewardRedpoint(slot0)
	if not slot0.scdata then
		return false
	end

	for slot4, slot5 in ipairs(slot0.scdata.lev_reward) do
		if slot5.flag == 1 then
			return true
		end
	end

	return false
end

function ElitematchModel.setEliteMatchFightTime(slot0, slot1)
	if slot0.scdata24905 == nil then
		slot0.scdata24905 = slot1
	else
		for slot5, slot6 in pairs(slot1) do
			slot0.scdata24905[slot5] = slot6
		end
	end

	if slot0.scdata24905.end_time ~= 0 and slot0.time_ticket == nil then
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0.scdata24905.end_time = uv0.scdata24905.end_time - 1

			if uv0.scdata24905.end_time <= 0 then
				uv0:clearTimeTicket()
				ElitematchController:getInstance():sender24905()
			end
		end, 1)
	end
end

function ElitematchModel.clearTimeTicket(slot0)
	if slot0.time_ticket then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function ElitematchModel.setUpdateRedPoint(slot0, slot1)
	slot0.is_redpoint_24900 = slot1
	slot0.is_redpoint_24905 = slot1
	slot0.is_redpoint_orderaction = slot1
end

function ElitematchModel.setSCDataBack24900(slot0)
	slot0.is_redpoint_24900 = true

	slot0:checkRedPoint()
end

function ElitematchModel.setSCDataBack24905(slot0)
	slot0.is_redpoint_24905 = true

	slot0:checkRedPoint()
end

function ElitematchModel.setSCDataBackOrderaction(slot0)
	slot0.is_redpoint_orderaction = true

	slot0:checkRedPoint()
end

function ElitematchModel.checkRedPoint(slot0, slot1)
	if slot0.is_redpoint_24905 and slot0.is_redpoint_24900 and slot0.is_redpoint_orderaction or slot1 == true then
		GlobalEvent:getInstance():Fire(LadderEvent.UpdateLadderRedStatus)

		slot2, slot3 = slot0:getElitematchTotalRedPoint()

		MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.ladder, {
			bid = CrossgroundConst.Red_Type.eliteMatch,
			status = slot2
		})
	end
end

function ElitematchModel.checkElitematchIsOpen(slot0, slot1)
	if slot0.scdata and slot0.scdata.state == 0 then
		if not slot1 then
			message(TI18N("精英段位赛未开启"))
		end

		return false, 0, TI18N("精英段位赛未开启")
	end

	slot2 = Config.ArenaEliteData.data_elite_const.open_person_lev_limit

	if RoleController:getInstance():getRoleVo() and slot2 and slot3.lev < slot2.val then
		if not slot1 then
			message(slot2.desc)
		end

		return false, 1, slot2.desc
	end

	slot4 = Config.ArenaEliteData.data_elite_const.open_world_lev_limit

	if RoleController:getInstance():getModel():getWorldLev() and slot4 and slot5 < slot4.val then
		if not slot1 then
			message(slot4.desc)
		end

		return false, 2, slot4.desc
	end

	return true
end

function ElitematchModel.setElitePeriod(slot0, slot1)
	slot0.elite_period = slot1
end

function ElitematchModel.getElitePeriod(slot0)
	return slot0.elite_period or 1
end

function ElitematchModel.getOpenMatchLessTime(slot0)
	slot8 = TimeTool.getToDayZeroTime() + (Config.ArenaEliteData.data_elite_const.open_time.val[1] or 0) * 60 * 60 + (slot1[2] or 0) * 60 + (slot1[3] or 0)
	slot9 = slot8 + Config.ArenaEliteData.data_elite_const.open_times.val
	slot11 = true
	slot12 = 0

	if GameNet:getInstance():getTime() < slot8 then
		slot11 = false
		slot12 = slot8 - slot10
	elseif slot9 < slot10 then
		slot11 = false
		slot12 = slot3 + TimeTool.day2s() - slot10 + slot7
	else
		slot11 = true
		slot12 = slot9 - slot10
	end

	return true, slot12
end

function ElitematchModel.setOrderactionData(slot0, slot1)
	slot0.orderaction_data = slot1

	if slot1 then
		slot0:setGiftStatus(slot1.rmb_status)
	end
end

function ElitematchModel.getCurPeriod(slot0)
	if slot0.orderaction_data and slot0.orderaction_data.period then
		return slot0.orderaction_data.period
	end

	return 1
end

function ElitematchModel.getGiftStatus(slot0)
	if slot0.rmb_status then
		return slot0.rmb_status
	end

	return 0
end

function ElitematchModel.getLevShowData(slot0, slot1)
	if slot0.orderaction_data and slot0.orderaction_data.list and slot0.orderaction_data.list[slot1] then
		return slot0.orderaction_data.list[slot1]
	end

	return nil
end

function ElitematchModel.getWinCounts(slot0)
	if slot0.orderaction_data and slot0.orderaction_data.win_count then
		return slot0.orderaction_data.win_count
	end

	return 0
end

function ElitematchModel.getCurDay(slot0)
	if slot0.orderaction_data and slot0.orderaction_data.cur_day then
		return slot0.orderaction_data.cur_day
	end

	return 1
end

function ElitematchModel.setOrderactionRedStatus(slot0, slot1)
	slot0.orderaction_first_red_status = slot1
end

function ElitematchModel.setGiftStatus(slot0, slot1)
	slot0.rmb_status = slot1
end

function ElitematchModel.getOrderactionRedpoint(slot0)
	if slot0.orderaction_first_red_status == 1 then
		return true
	end

	if not slot0.orderaction_data then
		return false
	end

	if Config.ArenaEliteWarOrderData.data_lev_reward_list and slot1[slot0.orderaction_data.period] then
		for slot5, slot6 in ipairs(slot1[slot0.orderaction_data.period]) do
			slot7 = 0
			slot8 = 0

			if slot0:getLevShowData(slot6.lev) then
				slot7 = slot9.award_status
				slot8 = slot9.rmb_award_status
			end

			if slot6.lev <= slot0.orderaction_data.lev then
				if slot7 == 0 then
					return true
				elseif slot8 == 0 and slot0.orderaction_data.rmb_status == 1 then
					return true
				end
			end
		end
	end

	return false
end

function ElitematchModel.__delete(slot0)
end
