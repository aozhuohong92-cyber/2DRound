ActiontermbeginsModel = ActiontermbeginsModel or BaseClass()

function ActiontermbeginsModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function ActiontermbeginsModel.config(slot0)
end

function ActiontermbeginsModel.getRankRewardByRank(slot0, slot1)
	if Config.HolidayTermBeginsData.data_rank_reward then
		for slot6, slot7 in ipairs(slot2) do
			if slot7.rank1 < slot1 and slot1 <= slot7.rank2 then
				return slot7.award
			end
		end

		return slot2[1].award
	end

	return {}
end

function ActiontermbeginsModel.__delete(slot0)
end
