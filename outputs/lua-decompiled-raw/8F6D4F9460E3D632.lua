Config = Config or {}
Config.ArenaEliteWarOrderData = Config.ArenaEliteWarOrderData or {}
Config.ArenaEliteWarOrderData.data_constant_length = 2
Config.ArenaEliteWarOrderData.data_constant = {
	rule_desc = {
		val = 1,
		label = "rule_desc",
		desc = [[
活动规则：
1、参加段位赛获取指定胜场可以获得超值奖励
2、付费购买进阶卡可解锁进阶奖励，并获得【王者之辉】限时称号
3、活动结束后，胜场进度会被清除，请及时完成任务，领取相应奖励！]]
	},
	warn_desc = {
		val = 1,
		label = "warn_desc",
		desc = "活动将于     %s     后结束\n活动结束后，胜场进度将会清除。\n请及时完成任务，以免错过奖励！"
	}
}

function Config.ArenaEliteWarOrderData.data_constant_fun(slot0)
	slot1 = Config.ArenaEliteWarOrderData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ArenaEliteWarOrderData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ArenaEliteWarOrderData.data_lev_reward_list_length = 2
Config.ArenaEliteWarOrderData.data_lev_reward_list = {
	{
		{
			lev = 1,
			period = 1,
			win_count = 1,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					14001,
					1
				},
				{
					10450,
					1000
				}
			}
		},
		{
			lev = 2,
			period = 1,
			win_count = 5,
			reward = {
				{
					27,
					200
				}
			},
			rmb_reward = {
				{
					27,
					500
				}
			}
		},
		{
			lev = 3,
			period = 1,
			win_count = 10,
			reward = {
				{
					10450,
					200
				}
			},
			rmb_reward = {
				{
					10450,
					500
				}
			}
		},
		{
			lev = 4,
			period = 1,
			win_count = 15,
			reward = {
				{
					27,
					200
				}
			},
			rmb_reward = {
				{
					27,
					500
				}
			}
		},
		{
			lev = 5,
			period = 1,
			win_count = 20,
			reward = {
				{
					14001,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					10450,
					1000
				}
			}
		},
		{
			lev = 6,
			period = 1,
			win_count = 25,
			reward = {
				{
					27,
					200
				}
			},
			rmb_reward = {
				{
					27,
					500
				}
			}
		},
		{
			lev = 7,
			period = 1,
			win_count = 30,
			reward = {
				{
					10450,
					200
				}
			},
			rmb_reward = {
				{
					10450,
					500
				}
			}
		},
		{
			lev = 8,
			period = 1,
			win_count = 35,
			reward = {
				{
					27,
					200
				}
			},
			rmb_reward = {
				{
					27,
					500
				}
			}
		},
		{
			lev = 9,
			period = 1,
			win_count = 40,
			reward = {
				{
					37002,
					1
				}
			},
			rmb_reward = {
				{
					14001,
					1
				},
				{
					10450,
					1000
				}
			}
		},
		{
			lev = 10,
			period = 1,
			win_count = 45,
			reward = {
				{
					27,
					200
				}
			},
			rmb_reward = {
				{
					27,
					500
				}
			}
		},
		{
			lev = 11,
			period = 1,
			win_count = 50,
			reward = {
				{
					10450,
					200
				}
			},
			rmb_reward = {
				{
					10450,
					500
				}
			}
		},
		{
			lev = 12,
			period = 1,
			win_count = 55,
			reward = {
				{
					27,
					200
				}
			},
			rmb_reward = {
				{
					27,
					500
				}
			}
		},
		{
			lev = 13,
			period = 1,
			win_count = 60,
			reward = {
				{
					29905,
					50
				}
			},
			rmb_reward = {
				{
					10603,
					1
				},
				{
					10450,
					1000
				}
			}
		},
		{
			lev = 14,
			period = 1,
			win_count = 65,
			reward = {
				{
					27,
					200
				}
			},
			rmb_reward = {
				{
					27,
					500
				}
			}
		},
		{
			lev = 15,
			period = 1,
			win_count = 70,
			reward = {
				{
					10450,
					200
				}
			},
			rmb_reward = {
				{
					10450,
					500
				}
			}
		},
		{
			lev = 16,
			period = 1,
			win_count = 75,
			reward = {
				{
					27,
					200
				}
			},
			rmb_reward = {
				{
					27,
					500
				}
			}
		},
		{
			lev = 17,
			period = 1,
			win_count = 80,
			reward = {
				{
					10603,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					10450,
					1000
				}
			}
		},
		{
			lev = 18,
			period = 1,
			win_count = 85,
			reward = {
				{
					27,
					200
				}
			},
			rmb_reward = {
				{
					27,
					500
				}
			}
		},
		{
			lev = 19,
			period = 1,
			win_count = 90,
			reward = {
				{
					10450,
					200
				}
			},
			rmb_reward = {
				{
					10450,
					500
				}
			}
		},
		{
			lev = 20,
			period = 1,
			win_count = 95,
			reward = {
				{
					27,
					200
				}
			},
			rmb_reward = {
				{
					27,
					500
				}
			}
		},
		{
			lev = 21,
			period = 1,
			win_count = 100,
			reward = {
				{
					14001,
					1
				}
			},
			rmb_reward = {
				{
					39058,
					1
				},
				{
					10450,
					1000
				}
			}
		}
	},
	{
		{
			lev = 1,
			period = 2,
			win_count = 1,
			reward = {
				{
					29905,
					10
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					28,
					50
				}
			}
		},
		{
			lev = 2,
			period = 2,
			win_count = 5,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					5
				},
				{
					28,
					10
				}
			}
		},
		{
			lev = 3,
			period = 2,
			win_count = 10,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					5
				},
				{
					28,
					10
				}
			}
		},
		{
			lev = 4,
			period = 2,
			win_count = 15,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					5
				},
				{
					28,
					10
				}
			}
		},
		{
			lev = 5,
			period = 2,
			win_count = 20,
			reward = {
				{
					29905,
					10
				}
			},
			rmb_reward = {
				{
					14001,
					1
				},
				{
					28,
					50
				}
			}
		},
		{
			lev = 6,
			period = 2,
			win_count = 25,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					5
				},
				{
					28,
					10
				}
			}
		},
		{
			lev = 7,
			period = 2,
			win_count = 30,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					5
				},
				{
					28,
					10
				}
			}
		},
		{
			lev = 8,
			period = 2,
			win_count = 35,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					5
				},
				{
					28,
					10
				}
			}
		},
		{
			lev = 9,
			period = 2,
			win_count = 40,
			reward = {
				{
					29905,
					10
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					28,
					50
				}
			}
		},
		{
			lev = 10,
			period = 2,
			win_count = 45,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					5
				},
				{
					28,
					10
				}
			}
		},
		{
			lev = 11,
			period = 2,
			win_count = 50,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					5
				},
				{
					28,
					10
				}
			}
		},
		{
			lev = 12,
			period = 2,
			win_count = 55,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					5
				},
				{
					28,
					10
				}
			}
		},
		{
			lev = 13,
			period = 2,
			win_count = 60,
			reward = {
				{
					29905,
					10
				}
			},
			rmb_reward = {
				{
					14001,
					1
				},
				{
					28,
					50
				}
			}
		},
		{
			lev = 14,
			period = 2,
			win_count = 65,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					5
				},
				{
					28,
					10
				}
			}
		},
		{
			lev = 15,
			period = 2,
			win_count = 70,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					5
				},
				{
					28,
					10
				}
			}
		},
		{
			lev = 16,
			period = 2,
			win_count = 75,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					5
				},
				{
					28,
					10
				}
			}
		},
		{
			lev = 17,
			period = 2,
			win_count = 80,
			reward = {
				{
					10603,
					1
				}
			},
			rmb_reward = {
				{
					39056,
					1
				},
				{
					28,
					50
				}
			}
		}
	}
}
Config.ArenaEliteWarOrderData.data_advance_card_list_length = 2
Config.ArenaEliteWarOrderData.data_advance_card_list = {
	{
		name = "王者之证进阶卡",
		charge_id = 909,
		id = 101,
		period = 1,
		buy_get = 20,
		reward = {
			{
				3,
				980
			},
			{
				50916,
				1
			}
		},
		client_reward_1 = {
			{
				3,
				980
			},
			{
				50916,
				1
			},
			{
				29905,
				65
			},
			{
				28,
				130
			},
			{
				14001,
				1
			}
		},
		client_reward_2 = {
			{
				39058,
				1
			},
			{
				29905,
				100
			},
			{
				14001,
				2
			},
			{
				10450,
				8500
			},
			{
				10603,
				1
			},
			{
				27,
				5000
			}
		}
	},
	{
		name = "王者之证进阶卡",
		charge_id = 909,
		id = 201,
		period = 2,
		buy_get = 20,
		reward = {
			{
				3,
				980
			},
			{
				50916,
				1
			}
		},
		client_reward_1 = {
			{
				3,
				980
			},
			{
				50916,
				1
			},
			{
				29905,
				65
			},
			{
				28,
				130
			},
			{
				14001,
				1
			}
		},
		client_reward_2 = {
			{
				39056,
				1
			},
			{
				29905,
				160
			},
			{
				14001,
				2
			},
			{
				28,
				370
			}
		}
	}
}
