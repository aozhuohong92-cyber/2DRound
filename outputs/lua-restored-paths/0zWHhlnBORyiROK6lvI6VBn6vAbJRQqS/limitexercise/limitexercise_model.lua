LimitExerciseModel = LimitExerciseModel or BaseClass()

function LimitExerciseModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

slot0 = Config.HolidayBossNewData.data_round_list

function LimitExerciseModel.config(slot0)
end

function LimitExerciseModel.setLimitExerciseData(slot0, slot1)
	slot0.limitexercise_data = slot1
end

function LimitExerciseModel.getLimitExerciseData(slot0)
	if slot0.limitexercise_data then
		return slot0.limitexercise_data
	end

	return nil
end

function LimitExerciseModel.getCurrentRound(slot0)
	if slot0.limitexercise_data and slot0.limitexercise_data.round and Config.HolidayBossNewData.data_round_list and slot1[slot0.limitexercise_data.round] then
		return slot1[slot0.limitexercise_data.round].unit_round
	end

	return 1
end

function LimitExerciseModel.getCurrentDiff(slot0)
	if slot0.limitexercise_data then
		return slot0.limitexercise_data.difficulty or 1
	end

	return 1
end

function LimitExerciseModel.getCurrentChangeID(slot0)
	if slot0.limitexercise_data then
		return slot0.limitexercise_data.order or 1
	end

	return 1
end

function LimitExerciseModel.getCurrentBossHp(slot0)
	if slot0.limitexercise_data then
		return slot0.limitexercise_data.hp_per or 0
	end

	return nil
end

function LimitExerciseModel.setChangeCount(slot0, slot1, slot2)
	if slot0.limitexercise_data and slot0.limitexercise_data.count and slot0.limitexercise_data.buy_count then
		slot0.limitexercise_data.count = slot1
		slot0.limitexercise_data.buy_count = slot2
	end
end

function LimitExerciseModel.setHeroUseId(slot0, slot1)
	slot0.hero_use_list = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.hero_use_list[slot6.id] = slot6.count
	end
end

function LimitExerciseModel.getHeroUseId(slot0, slot1)
	if slot0.hero_use_list and slot0.hero_use_list[slot1] then
		return slot0.hero_use_list[slot1]
	end

	return 0
end

function LimitExerciseModel.getBoxStatus(slot0)
	if slot0.limitexercise_data then
		return slot0.limitexercise_data.status or 0
	end

	return 0
end

function LimitExerciseModel.getCurrentType(slot0)
	if slot0.limitexercise_data then
		return slot0.limitexercise_data.order_type or 0
	end

	return nil
end

function LimitExerciseModel.isUpHero(slot0, slot1)
	slot2 = false

	if slot0:getCurrentRound() and uv0[slot3] then
		for slot7, slot8 in pairs(uv0[slot3].up_hero) do
			if slot8 == slot1 then
				slot2 = true

				break
			end
		end
	end

	return slot2
end

function LimitExerciseModel.getDayBuyCount(slot0)
	if slot0.limitexercise_data then
		return slot0.limitexercise_data.buy_count or 0
	end

	return 0
end

function LimitExerciseModel.getReaminCount(slot0)
	if slot0.limitexercise_data then
		return slot0.limitexercise_data.count or 0
	end

	return 0
end

function LimitExerciseModel.__delete(slot0)
end
