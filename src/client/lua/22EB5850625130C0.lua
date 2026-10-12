Config = Config or {}
Config.HolidayPractiseTowerData = Config.HolidayPractiseTowerData or {}
Config.HolidayPractiseTowerData.data_const_length = 9
Config.HolidayPractiseTowerData.data_const = {
	holiday_practise_tower_free_time = {
		val = 4,
		key = "holiday_practise_tower_free_time",
		desc = "每日免费次数"
	},
	holiday_practise_tower_buy_time = {
		val = 4,
		key = "holiday_practise_tower_buy_time",
		desc = "每日可购买次数"
	},
	holiday_practise_tower_max_buy_time = {
		val = 8,
		key = "holiday_practise_tower_max_buy_time",
		desc = "每日可购买次数最大值"
	},
	holiday_practise_tower_reset_time = {
		val = 15,
		key = "holiday_practise_tower_reset_time",
		desc = "每日重新挑战次数"
	},
	rules = {
		val = 1,
		key = "rules",
		desc = [[
<div fontcolor=#c23f35>活动规则：</div>
1、活动期间，布阵英雄挑战兔丼监狱，击杀每层Boss可领取丰厚奖励！
2、每次挑战消耗1点挑战次数，每场战斗对Boss造成伤害将被继承，Boss生命值为0则视为成功击杀（非Boss的单位的生命值损失不会被继承）
3、战斗结束后若对战斗结果不满意，可选择重新挑战，重新挑战不额外消耗挑战次数
4、排行榜根据各位船长大人最大通关层数排名，最大通关层数相同则视较先到达成者排名靠前
5、活动排行奖励将在活动结束后进行邮件发放，请注意查收
6、活动在结束后仍会公示一天，期间无法进行挑战，请各位冒险大大努力通关吧！]]
	},
	holiday_practise_tower_buy_loss = {
		key = "holiday_practise_tower_buy_loss",
		desc = "购买挑战次数消耗",
		val = {
			{
				3,
				100
			}
		}
	},
	item_show = {
		key = "item_show",
		desc = "奖励展示",
		val = {
			{
				25911,
				50
			},
			{
				24909,
				50
			},
			{
				50037,
				1
			},
			{
				3,
				3000
			}
		}
	},
	special_floor = {
		key = "special_floor",
		desc = "特殊楼层节点",
		val = {
			5,
			10,
			15,
			20,
			25,
			30,
			35,
			40
		}
	},
	holiday_practise_tower_max_rank = {
		val = 200,
		key = "holiday_practise_tower_max_rank",
		desc = "排行榜最大数量"
	}
}

function Config.HolidayPractiseTowerData.data_const_fun(slot0)
	slot1 = Config.HolidayPractiseTowerData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayPractiseTowerData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayPractiseTowerData.data_tower_length = 40
Config.HolidayPractiseTowerData.data_tower = {
	{
		star = 5,
		id = 1,
		power = 30000,
		boss_id = 97300,
		mode_id = "97300",
		face_id = 20502,
		reward = {
			{
				10403,
				1
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508
		}
	},
	{
		star = 5,
		id = 2,
		power = 37000,
		boss_id = 97301,
		mode_id = "97301",
		face_id = 10505,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508
		}
	},
	{
		star = 5,
		id = 3,
		power = 44000,
		boss_id = 97302,
		mode_id = "97302",
		face_id = 20505,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508
		}
	},
	{
		star = 5,
		id = 4,
		power = 51000,
		boss_id = 97303,
		mode_id = "97303",
		face_id = 40503,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508
		}
	},
	{
		star = 6,
		id = 5,
		power = 58000,
		boss_id = 97304,
		mode_id = "97304",
		face_id = 50505,
		reward = {
			{
				10403,
				5
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508
		}
	},
	{
		star = 6,
		id = 6,
		power = 65000,
		boss_id = 97305,
		mode_id = "97305",
		face_id = 40502,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508
		}
	},
	{
		star = 6,
		id = 7,
		power = 72000,
		boss_id = 97306,
		mode_id = "97306",
		face_id = 20502,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508
		}
	},
	{
		star = 6,
		id = 8,
		power = 79000,
		boss_id = 97307,
		mode_id = "97307",
		face_id = 10502,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508
		}
	},
	{
		star = 6,
		id = 9,
		power = 86000,
		boss_id = 97308,
		mode_id = "97308",
		face_id = 30402,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508
		}
	},
	{
		star = 6,
		id = 10,
		power = 93000,
		boss_id = 97309,
		mode_id = "97309",
		face_id = 10503,
		reward = {
			{
				3,
				200
			},
			{
				10403,
				10
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508
		}
	},
	{
		star = 6,
		id = 11,
		power = 100000,
		boss_id = 97310,
		mode_id = "97310",
		face_id = 50505,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508
		}
	},
	{
		star = 6,
		id = 12,
		power = 107000,
		boss_id = 97311,
		mode_id = "97311",
		face_id = 30505,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508
		}
	},
	{
		star = 7,
		id = 13,
		power = 114000,
		boss_id = 97312,
		mode_id = "97312",
		face_id = 20502,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 7,
		id = 14,
		power = 121000,
		boss_id = 97313,
		mode_id = "97313",
		face_id = 10502,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 7,
		id = 15,
		power = 128000,
		boss_id = 97314,
		mode_id = "97314",
		face_id = 30506,
		reward = {
			{
				10403,
				5
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 7,
		id = 16,
		power = 135000,
		boss_id = 97315,
		mode_id = "97315",
		face_id = 20505,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 7,
		id = 17,
		power = 142000,
		boss_id = 97316,
		mode_id = "97316",
		face_id = 10507,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 7,
		id = 18,
		power = 149000,
		boss_id = 97317,
		mode_id = "97317",
		face_id = 40504,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 7,
		id = 19,
		power = 156000,
		boss_id = 97318,
		mode_id = "97318",
		face_id = 30508,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 7,
		id = 20,
		power = 163000,
		boss_id = 97319,
		mode_id = "97319",
		face_id = 50501,
		reward = {
			{
				3,
				300
			},
			{
				29905,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 8,
		id = 21,
		power = 170000,
		boss_id = 97320,
		mode_id = "97320",
		face_id = 20506,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 8,
		id = 22,
		power = 177000,
		boss_id = 97321,
		mode_id = "97321",
		face_id = 50501,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 8,
		id = 23,
		power = 184000,
		boss_id = 97322,
		mode_id = "97322",
		face_id = 10507,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 8,
		id = 24,
		power = 191000,
		boss_id = 97323,
		mode_id = "97323",
		face_id = 40504,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 9,
		id = 25,
		power = 198000,
		boss_id = 97324,
		mode_id = "97324",
		face_id = 30506,
		reward = {
			{
				10403,
				5
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 9,
		id = 26,
		power = 205000,
		boss_id = 97325,
		mode_id = "97325",
		face_id = 50501,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 9,
		id = 27,
		power = 212000,
		boss_id = 97326,
		mode_id = "97326",
		face_id = 20505,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 9,
		id = 28,
		power = 219000,
		boss_id = 97327,
		mode_id = "97327",
		face_id = 50505,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 9,
		id = 29,
		power = 226000,
		boss_id = 97328,
		mode_id = "97328",
		face_id = 10505,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 9,
		id = 30,
		power = 233000,
		boss_id = 97329,
		mode_id = "97329",
		face_id = 40502,
		reward = {
			{
				3,
				400
			},
			{
				24909,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 10,
		id = 31,
		power = 240000,
		boss_id = 97330,
		mode_id = "97330",
		face_id = 30506,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 10,
		id = 32,
		power = 247000,
		boss_id = 97331,
		mode_id = "97331",
		face_id = 50505,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 10,
		id = 33,
		power = 254000,
		boss_id = 97332,
		mode_id = "97332",
		face_id = 20505,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 10,
		id = 34,
		power = 261000,
		boss_id = 97333,
		mode_id = "97333",
		face_id = 50506,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 10,
		id = 35,
		power = 268000,
		boss_id = 97334,
		mode_id = "97334",
		face_id = 10502,
		reward = {
			{
				10403,
				5
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 10,
		id = 36,
		power = 275000,
		boss_id = 97335,
		mode_id = "97335",
		face_id = 40502,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 11,
		id = 37,
		power = 282000,
		boss_id = 97336,
		mode_id = "97336",
		face_id = 30506,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 11,
		id = 38,
		power = 289000,
		boss_id = 97337,
		mode_id = "97337",
		face_id = 50505,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 11,
		id = 39,
		power = 296000,
		boss_id = 97338,
		mode_id = "97338",
		face_id = 20501,
		reward = {
			{
				3,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	},
	{
		star = 11,
		id = 40,
		power = 303000,
		boss_id = 97339,
		mode_id = "97339",
		face_id = 50505,
		reward = {
			{
				3,
				500
			},
			{
				25911,
				50
			}
		},
		attr_ext = {
			{
				"atk_per",
				150
			}
		},
		attr_bids = {
			10512,
			30508,
			40503,
			50502
		}
	}
}

function Config.HolidayPractiseTowerData.data_tower_fun(slot0)
	slot1 = Config.HolidayPractiseTowerData.data_tower[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayPractiseTowerData.data_tower[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayPractiseTowerData.data_rank_reward_length = 8
Config.HolidayPractiseTowerData.data_rank_reward = {
	{
		min = 1,
		max = 1,
		items = {
			{
				3,
				2000
			},
			{
				10403,
				20
			},
			{
				50037,
				1
			}
		}
	},
	{
		min = 2,
		max = 2,
		items = {
			{
				3,
				1500
			},
			{
				10403,
				15
			},
			{
				50037,
				1
			}
		}
	},
	{
		min = 3,
		max = 3,
		items = {
			{
				3,
				1000
			},
			{
				10403,
				12
			},
			{
				50037,
				1
			}
		}
	},
	{
		min = 4,
		max = 10,
		items = {
			{
				3,
				800
			},
			{
				10403,
				10
			}
		}
	},
	[11] = {
		min = 11,
		max = 20,
		items = {
			{
				3,
				500
			},
			{
				10403,
				8
			}
		}
	},
	[21] = {
		min = 21,
		max = 50,
		items = {
			{
				3,
				300
			},
			{
				10403,
				6
			}
		}
	},
	[51] = {
		min = 51,
		max = 100,
		items = {
			{
				3,
				200
			},
			{
				10403,
				4
			}
		}
	},
	[101] = {
		min = 101,
		max = 200,
		items = {
			{
				3,
				100
			},
			{
				10403,
				2
			}
		}
	}
}

function Config.HolidayPractiseTowerData.data_rank_reward_fun(slot0)
	slot1 = Config.HolidayPractiseTowerData.data_rank_reward[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayPractiseTowerData.data_rank_reward[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
