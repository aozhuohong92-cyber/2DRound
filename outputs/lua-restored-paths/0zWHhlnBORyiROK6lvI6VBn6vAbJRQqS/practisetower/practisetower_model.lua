PractisetowerModel = PractisetowerModel or BaseClass()

function PractisetowerModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function PractisetowerModel.config(slot0)
	slot0.max_tower = 0
	slot0.less_count = 0
	slot0.buy_count = 0
end

function PractisetowerModel.setIsTouchFight(slot0, slot1)
	slot0.is_touch_fight = slot1
end

function PractisetowerModel.getIsTouchFight(slot0)
	return slot0.is_touch_fight
end

function PractisetowerModel.setResetFightId(slot0, slot1)
	slot0.reset_id = slot1
end

function PractisetowerModel.getResetFightId(slot0)
	return slot0.reset_id
end

function PractisetowerModel.setPractiseTowerData(slot0, slot1)
	slot0.pt_data = slot1

	GlobalEvent:getInstance():Fire(PractisetowerEvent.Update_All_Data)
end

function PractisetowerModel.getPractiseTowerData(slot0)
	return slot0.pt_data
end

function PractisetowerModel.updateMyRank(slot0, slot1)
	if slot1 and slot0.pt_data then
		slot0.pt_data.role_rank = slot1.role_rank

		GlobalEvent:getInstance():Fire(PractisetowerEvent.Update_My_rank)
	end
end

function PractisetowerModel.getNowTowerId(slot0)
	if slot0.pt_data then
		return slot0.pt_data.id
	end

	return 0
end

function PractisetowerModel.getTowerLessCount(slot0)
	if slot0.pt_data then
		return slot0.pt_data.time
	end

	return 0
end

function PractisetowerModel.getBuyCount(slot0)
	if slot0.pt_data then
		return slot0.pt_data.last_buy_time
	end

	return 0
end

function PractisetowerModel.__delete(slot0)
end
