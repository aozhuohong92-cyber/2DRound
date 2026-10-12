Endless_trailModel = Endless_trailModel or BaseClass()

function Endless_trailModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function Endless_trailModel.config(slot0)
	slot0.role_rank_list = {}
	slot0.endless_data = {}
	slot0.first_data = {}
	slot0.send_partner = {}
	slot0.hire_partner_list = {}
	slot0.has_hire_partner_list = {}
	slot0.is_first_get = {}
	slot0.is_award_get = false
	slot0.is_award_get_new = false
	slot0.is_send_partner = false
	slot0.endless_battle_data = nil
end

function Endless_trailModel.setEndlessData(slot0, slot1)
	if slot1 then
		if slot1.type == 0 then
			slot1.day_pass_round = 0
			slot1.new_day_pass_round = 0
			slot1.is_reward = 0
		end

		slot0.endless_data = slot1

		slot0:checkRedPoint()
		GlobalEvent:getInstance():Fire(Endless_trailEvent.UPDATA_BASE_DATA)
	end
end

function Endless_trailModel.getEndlessData(slot0)
	if slot0.endless_data and next(slot0.endless_data or {}) ~= nil then
		return slot0.endless_data
	end
end

function Endless_trailModel.updateRankInfo(slot0, slot1)
	if slot1 and slot0.endless_data and next(slot0.endless_data or {}) ~= nil then
		if slot0.endless_data.type == Endless_trailEvent.endless_type.old then
			slot0.endless_data.my_idx = slot1.my_idx
			slot0.endless_data.rank_list = slot1.rank_list
		elseif slot0.endless_data.type ~= 0 then
			slot0.endless_data.new_my_idx = slot1.my_idx
			slot0.endless_data.new_rank_list = slot1.rank_list
		end

		GlobalEvent:getInstance():Fire(Endless_trailEvent.UPDATA_RANK_DATA)
	end
end

function Endless_trailModel.setFirstData(slot0, slot1)
	if slot1 then
		slot0.first_data[slot1.type] = slot1

		slot0:checkRedPoint()
		GlobalEvent:getInstance():Fire(Endless_trailEvent.UPDATA_FIRST_DATA)
	end
end

function Endless_trailModel.setFirstStatus(slot0, slot1)
	if slot1 then
		slot0.first_status = slot1

		slot0:checkRedPoint()
	end
end

function Endless_trailModel.getFirstData(slot0, slot1)
	if slot0.first_data and next(slot0.first_data or {}) ~= nil then
		return slot0.first_data[slot1]
	end
end

function Endless_trailModel.setSendPartnerData(slot0, slot1)
	slot0.send_partner = slot1

	GlobalEvent:getInstance():Fire(Endless_trailEvent.UPDATA_SENDPARTNER_DATA, slot1)
	slot0:checkRedPoint()
end

function Endless_trailModel.getSendPartnerData(slot0)
	if slot0.send_partner and next(slot0.send_partner or {}) ~= nil then
		return slot0.send_partner
	end
end

function Endless_trailModel.setHirePartnerData(slot0, slot1)
	slot0.hire_partner_list = slot1

	GlobalEvent:getInstance():Fire(Endless_trailEvent.UPDATA_HIREPARNER_DATA, slot1)
end

function Endless_trailModel.getHirePartnerData(slot0)
	if slot0.hire_partner_list and next(slot0.hire_partner_list or {}) ~= nil then
		return slot0.hire_partner_list
	end
end

function Endless_trailModel.setHasHirePartnerData(slot0, slot1)
	slot0.has_hire_partner_list = slot1

	GlobalEvent:getInstance():Fire(Endless_trailEvent.UPDATA_HASHIREPARNER_DATA, slot1)
end

function Endless_trailModel.getHasHirePartnerData(slot0)
	if slot0.has_hire_partner_list and next(slot0.has_hire_partner_list or {}) ~= nil then
		return slot0.has_hire_partner_list
	end
end

function Endless_trailModel.setEndlessBattleData(slot0, slot1)
	slot0.endless_battle_data = slot1

	GlobalEvent:getInstance():Fire(Endless_trailEvent.UPDATA_ENDLESSBATTLE_DATA, slot1)
end

function Endless_trailModel.getEndlessBattleData(slot0)
	if slot0.endless_battle_data then
		return slot0.endless_battle_data
	end
end

function Endless_trailModel.getRaknRoleTopThreeList(slot0, slot1)
	slot2 = {
		{
			rank = 1,
			name = TI18N("虚位以待")
		},
		{
			rank = 2,
			name = TI18N("虚位以待")
		},
		{
			rank = 3,
			name = TI18N("虚位以待")
		}
	}
	slot3 = slot0.endless_data.new_rank_list

	if slot1 == Endless_trailEvent.endless_type.old then
		slot3 = slot0.endless_data.rank_list
	end

	if slot3 and next(slot3 or {}) ~= nil then
		for slot7, slot8 in ipairs(slot3) do
			for slot12, slot13 in ipairs(slot2) do
				if slot8.idx == slot13.rank then
					slot2[slot12] = slot8
				end
			end
		end
	end

	return slot2
end

function Endless_trailModel.checkRedPoint(slot0)
	if MainuiController:getInstance():checkMainFunctionOpenStatus(MainuiConst.btn_index.esecsice, MainuiConst.function_type.main, true) == false then
		return false
	end

	if slot0.first_data and next(slot0.first_data or {}) ~= nil then
		for slot5, slot6 in pairs(slot0.first_data) do
			if slot6.status == 1 then
				if slot5 == Endless_trailEvent.endless_type.old then
					slot0.is_first_get[slot5] = true
				elseif slot0.ctrl:checkNewEndLessIsOpen() == true then
					slot0.is_first_get[slot5] = true
				else
					slot0.is_first_get[slot5] = false
				end
			else
				slot0.is_first_get[slot5] = false
			end
		end

		GlobalEvent:getInstance():Fire(Endless_trailEvent.UPDATA_REDPOINT_FIRST_DATA)
	end

	if slot0.endless_data and slot0.endless_data.day_pass_round then
		if tonumber(slot0.endless_data.day_pass_round) > 0 or slot0.endless_data.type ~= 0 and slot0.endless_data.type ~= Endless_trailEvent.endless_type.old then
			slot0.is_award_get = false
		else
			slot0.is_award_get = true
		end

		GlobalEvent:getInstance():Fire(Endless_trailEvent.UPDATA_REDPOINT_REWARD_DATA)
	end

	if slot0.endless_data and slot0.endless_data.new_day_pass_round and slot0.ctrl:checkNewEndLessIsOpen() == true then
		if tonumber(slot0.endless_data.new_day_pass_round) > 0 or slot0.endless_data.type ~= 0 and slot0.endless_data.type ~= slot0.endless_data.select_type then
			slot0.is_award_get_new = false
		else
			slot0.is_award_get_new = true
		end

		GlobalEvent:getInstance():Fire(Endless_trailEvent.UPDATA_REDPOINT_REWARD_DATA)
	end

	if slot0.endless_data then
		if slot0.endless_data.is_appoint == 0 and slot0.send_partner and next(slot0.send_partner.list or {}) == nil then
			slot0.is_send_partner = true
		else
			slot0.is_send_partner = false
		end
	end

	slot0:enterRedPoint()
	GlobalEvent:getInstance():Fire(Endless_trailEvent.UPDATA_REDPOINT_SENDPARTNER_DATA)
	GlobalEvent:getInstance():Fire(Endless_trailEvent.UPDATA_ESECSICE_ENDLESS_REDPOINT)
	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.esecsice, {
		bid = RedPointType.endless,
		status = slot0:checkRedStatus()
	})
end

function Endless_trailModel.enterRedPoint(slot0)
	if Config.DailyplayData.data_exerciseactivity and slot1[EsecsiceConst.exercise_index.stonedungeon] and MainuiController:getInstance():checkIsOpenByActivate(slot1[EsecsiceConst.exercise_index.stonedungeon].activate) == false then
		slot0.is_first_get = {}
		slot0.is_send_partner = false
		slot0.is_award_get = false
		slot0.is_award_get_new = false
		slot0.first_status = false
	end
end

function Endless_trailModel.getFirstGet(slot0, slot1)
	if slot0.is_first_get and next(slot0.is_first_get or {}) ~= nil and slot0.is_first_get[slot1] then
		return slot0.is_first_get[slot1]
	end

	return false
end

function Endless_trailModel.getIsSendPartner(slot0)
	return slot0.is_send_partner
end

function Endless_trailModel.getIsGetAllReward(slot0)
	return slot0.is_award_get
end

function Endless_trailModel.getIsGetAllRewardNew(slot0)
	return slot0.is_award_get_new
end

function Endless_trailModel.checkRedStatus(slot0)
	slot1 = false

	if slot0.first_status and slot0.first_status == true then
		slot1 = true
	elseif slot0.is_first_get and next(slot0.is_first_get or {}) ~= nil then
		for slot5, slot6 in pairs(slot0.is_first_get) do
			if slot6 == true then
				slot1 = true

				break
			end
		end
	end

	return slot1 or slot0.is_send_partner or slot0.is_award_get or slot0.is_award_get_new
end

function Endless_trailModel.is_include(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot2) do
		if slot7.bid == slot1 then
			return true
		end
	end

	return false
end

function Endless_trailModel.__delete(slot0)
end
