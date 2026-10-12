Config = Config or {}
Config.HolidayMergeGoalData = Config.HolidayMergeGoalData or {}
Config.HolidayMergeGoalData.data_const_length = 5
Config.HolidayMergeGoalData.data_const = {
	base_max_score = {
		val = 100000,
		key = "base_max_score",
		desc = "基础目标"
	},
	goal_base_id = {
		val = 80239,
		key = "goal_base_id",
		desc = "合服积分id"
	},
	goal_gift_id = {
		val = 80240,
		key = "goal_gift_id",
		desc = "合服礼包id"
	},
	goal_score = {
		val = 1,
		key = "goal_score",
		desc = "礼包增加积分"
	},
	game_rule = {
		val = 1,
		key = "game_rule",
		desc = "1、合服活动期间，全服玩家可以在合服任务活动中完成合服任务，每完成一个任务，即可贡献10点合服积分\n2、合服积分达到目标值即可打开宝箱领取奖励！\n3、丰厚的宝箱奖励一共七档，等你来拿，全服玩家请一起努力哦！"
	}
}

function Config.HolidayMergeGoalData.data_const_fun(slot0)
	slot1 = Config.HolidayMergeGoalData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayMergeGoalData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayMergeGoalData.data_score_award_length = 7
Config.HolidayMergeGoalData.data_score_award = {
	{
		id = 1,
		count = 160,
		award = {
			{
				10403,
				3
			}
		}
	},
	{
		id = 2,
		count = 300,
		award = {
			{
				37002,
				1
			}
		}
	},
	{
		id = 3,
		count = 440,
		award = {
			{
				10408,
				3
			}
		}
	},
	{
		id = 4,
		count = 580,
		award = {
			{
				14001,
				1
			}
		}
	},
	{
		id = 5,
		count = 720,
		award = {
			{
				3,
				888
			}
		}
	},
	{
		id = 6,
		count = 860,
		award = {
			{
				10603,
				1
			}
		}
	},
	{
		id = 7,
		count = 1000,
		award = {
			{
				29905,
				50
			}
		}
	}
}

function Config.HolidayMergeGoalData.data_score_award_fun(slot0)
	slot1 = Config.HolidayMergeGoalData.data_score_award[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayMergeGoalData.data_score_award[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayMergeGoalData.data_interval_length = 7
Config.HolidayMergeGoalData.data_interval = {
	{
		id = 1,
		interval = 900,
		pro = 160,
		time = 24
	},
	{
		id = 2,
		interval = 900,
		pro = 140,
		time = 24
	},
	{
		id = 3,
		interval = 900,
		pro = 140,
		time = 24
	},
	{
		id = 4,
		interval = 900,
		pro = 140,
		time = 24
	},
	{
		id = 5,
		interval = 900,
		pro = 140,
		time = 24
	},
	{
		id = 6,
		interval = 900,
		pro = 140,
		time = 24
	},
	{
		id = 7,
		interval = 900,
		pro = 140,
		time = 20
	}
}

function Config.HolidayMergeGoalData.data_interval_fun(slot0)
	slot1 = Config.HolidayMergeGoalData.data_interval[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayMergeGoalData.data_interval[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayMergeGoalData.data_all_interval_length = 1
Config.HolidayMergeGoalData.data_all_interval = {
	{
		id = 1,
		min = 1,
		pro = 1000,
		max = 999999
	}
}

function Config.HolidayMergeGoalData.data_all_interval_fun(slot0)
	slot1 = Config.HolidayMergeGoalData.data_all_interval[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayMergeGoalData.data_all_interval[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
