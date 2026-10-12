Config = Config or {}
Config.HolidayNewWarOrderData = Config.HolidayNewWarOrderData or {}
Config.HolidayNewWarOrderData.data_constant_length = 2
Config.HolidayNewWarOrderData.data_constant = {
	action_rule = {
		val = 1,
		label = "action_rule",
		desc = [[
活动规则：
1、海贼夺宝会在玩家创角满7天开启（第8天可见），活动周期持续30天，过期将重新循环
2、活动周期内，获得的「夺宝阅历」越多，可领取的奖励越丰厚，「夺宝阅历」可以从完成每日任务、每周挑战的任务奖励中获得
3、付费解锁海贼宝藏进阶奖励，更有钻石和珍稀材料直接送
4、活动周期重置后，累积等级、任务进度及经验将会清除，已激活未领取的奖励将会通过邮件发放，请及时完成任务，领取相应奖励，以免错过奖励哦！]]
	},
	war_order_levmax = {
		val = 40,
		label = "war_order_levmax",
		desc = ""
	}
}

function Config.HolidayNewWarOrderData.data_constant_fun(slot0)
	slot1 = Config.HolidayNewWarOrderData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayNewWarOrderData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayNewWarOrderData.data_lev_reward_list_length = 3
Config.HolidayNewWarOrderData.data_lev_reward_list = {
	{
		{
			lev = 1,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 0,
			reward = {
				{
					10403,
					3
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					3,
					1000
				}
			}
		},
		{
			lev = 2,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 400,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 3,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 800,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 4,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 1200,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 5,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 1600,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 6,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 2000,
			reward = {
				{
					10403,
					5
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					10403,
					10
				}
			}
		},
		{
			lev = 7,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 2400,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 8,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 2800,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 9,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 3200,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 10,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 3600,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 11,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 4000,
			reward = {
				{
					10403,
					5
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					10403,
					10
				}
			}
		},
		{
			lev = 12,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 4400,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 13,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 4800,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 14,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 5200,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 15,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 5600,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 16,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 6000,
			reward = {
				{
					10403,
					5
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					10403,
					10
				}
			}
		},
		{
			lev = 17,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 6400,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 18,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 6800,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 19,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 7200,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 20,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 7600,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 21,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 8000,
			reward = {
				{
					10403,
					5
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					10403,
					10
				}
			}
		},
		{
			lev = 22,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 8400,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 23,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 8800,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 24,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 9200,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 25,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 9600,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 26,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 10000,
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
					10403,
					10
				}
			}
		},
		{
			lev = 27,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 10400,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 28,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 10800,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 29,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 11200,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 30,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 11600,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 31,
			period = 1,
			max_lev = 200,
			min_lev = 1,
			exp = 12000,
			reward = {
				{
					29905,
					50
				}
			},
			rmb_reward = {
				{
					39040,
					1
				},
				{
					10403,
					10
				}
			}
		}
	},
	{
		{
			lev = 1,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 0,
			reward = {
				{
					10403,
					3
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					3,
					1000
				}
			}
		},
		{
			lev = 2,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 400,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 3,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 800,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 4,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 1200,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 5,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 1600,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 6,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 2000,
			reward = {
				{
					10403,
					5
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					10403,
					10
				}
			}
		},
		{
			lev = 7,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 2400,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 8,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 2800,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 9,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 3200,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 10,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 3600,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 11,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 4000,
			reward = {
				{
					10403,
					5
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					10403,
					10
				}
			}
		},
		{
			lev = 12,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 4400,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 13,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 4800,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 14,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 5200,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 15,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 5600,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 16,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 6000,
			reward = {
				{
					10403,
					5
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					10403,
					10
				}
			}
		},
		{
			lev = 17,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 6400,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 18,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 6800,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 19,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 7200,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 20,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 7600,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 21,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 8000,
			reward = {
				{
					10403,
					5
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					10403,
					10
				}
			}
		},
		{
			lev = 22,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 8400,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 23,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 8800,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 24,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 9200,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 25,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 9600,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 26,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 10000,
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
					10403,
					10
				}
			}
		},
		{
			lev = 27,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 10400,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 28,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 10800,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 29,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 11200,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 30,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 11600,
			reward = {
				{
					10403,
					1
				}
			},
			rmb_reward = {
				{
					29905,
					10
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 31,
			period = 2,
			max_lev = 200,
			min_lev = 1,
			exp = 12000,
			reward = {
				{
					29905,
					50
				}
			},
			rmb_reward = {
				{
					39040,
					1
				},
				{
					10403,
					10
				}
			}
		}
	},
	{
		{
			lev = 1,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 0,
			reward = {
				{
					39158,
					3
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					3,
					1000
				}
			}
		},
		{
			lev = 2,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 400,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 3,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 800,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 4,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 1200,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 5,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 1600,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 6,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 2000,
			reward = {
				{
					39158,
					5
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					39158,
					10
				}
			}
		},
		{
			lev = 7,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 2400,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 8,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 2800,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 9,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 3200,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 10,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 3600,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 11,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 4000,
			reward = {
				{
					39158,
					5
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					39158,
					10
				}
			}
		},
		{
			lev = 12,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 4400,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 13,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 4800,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 14,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 5200,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 15,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 5600,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 16,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 6000,
			reward = {
				{
					39158,
					5
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					39158,
					10
				}
			}
		},
		{
			lev = 17,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 6400,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 18,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 6800,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 19,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 7200,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 20,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 7600,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 21,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 8000,
			reward = {
				{
					39158,
					5
				}
			},
			rmb_reward = {
				{
					29905,
					50
				},
				{
					39158,
					10
				}
			}
		},
		{
			lev = 22,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 8400,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 23,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 8800,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 24,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 9200,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 25,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 9600,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 26,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 10000,
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
					39158,
					10
				}
			}
		},
		{
			lev = 27,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 10400,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 28,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 10800,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 29,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 11200,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 30,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 11600,
			reward = {
				{
					28,
					20
				}
			},
			rmb_reward = {
				{
					39158,
					2
				},
				{
					3,
					200
				}
			}
		},
		{
			lev = 31,
			period = 3,
			max_lev = 200,
			min_lev = 1,
			exp = 12000,
			reward = {
				{
					29905,
					50
				}
			},
			rmb_reward = {
				{
					39159,
					1
				},
				{
					39158,
					10
				}
			}
		}
	}
}
Config.HolidayNewWarOrderData.data_day_task_list_length = 3
Config.HolidayNewWarOrderData.data_day_task_list = {
	{
		[50001] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 1,
			show_icon = 401,
			goal_id = 50001,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50002] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 1,
			show_icon = 153,
			goal_id = 50002,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50003] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 1,
			show_icon = 131,
			goal_id = 50003,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50004] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 1,
			show_icon = 158,
			goal_id = 50004,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50005] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 1,
			show_icon = 146,
			goal_id = 50005,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50006] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 1,
			show_icon = 152,
			goal_id = 50006,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50007] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 1,
			show_icon = 414,
			goal_id = 50007,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50008] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 2,
			show_icon = 401,
			goal_id = 50008,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50009] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 2,
			show_icon = 157,
			goal_id = 50009,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50010] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 2,
			show_icon = 134,
			goal_id = 50010,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50011] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 2,
			show_icon = 153,
			goal_id = 50011,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50012] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "装备冶炼师",
			desc = "合成5个任意装备",
			day = 2,
			show_icon = 154,
			goal_id = 50012,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_equipment_compound",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50013] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 2,
			show_icon = 152,
			goal_id = 50013,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50014] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 2,
			show_icon = 429,
			goal_id = 50014,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50015] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 3,
			show_icon = 401,
			goal_id = 50015,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50016] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 3,
			show_icon = 131,
			goal_id = 50016,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50017] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 3,
			show_icon = 146,
			goal_id = 50017,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50018] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 3,
			show_icon = 158,
			goal_id = 50018,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50019] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我还能爬的更高",
			desc = "参与5次海底监狱",
			day = 3,
			show_icon = 160,
			goal_id = 50019,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_star_tower_pass",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50020] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 3,
			show_icon = 152,
			goal_id = 50020,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50021] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 3,
			show_icon = 414,
			goal_id = 50021,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50022] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 4,
			show_icon = 401,
			goal_id = 50022,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50023] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 4,
			show_icon = 157,
			goal_id = 50023,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50024] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 4,
			show_icon = 138,
			goal_id = 50024,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50025] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "出现吧！命运的羁绊",
			desc = "先知英雄转换1次",
			day = 4,
			show_icon = 427,
			goal_id = 50025,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_recruit_convert",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50026] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 4,
			show_icon = 153,
			goal_id = 50026,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50027] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 4,
			show_icon = 152,
			goal_id = 50027,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50028] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 4,
			show_icon = 429,
			goal_id = 50028,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50029] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 5,
			show_icon = 401,
			goal_id = 50029,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50030] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 5,
			show_icon = 153,
			goal_id = 50030,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50031] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 5,
			show_icon = 131,
			goal_id = 50031,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50032] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 5,
			show_icon = 158,
			goal_id = 50032,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50033] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 5,
			show_icon = 146,
			goal_id = 50033,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50034] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 5,
			show_icon = 152,
			goal_id = 50034,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50035] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 5,
			show_icon = 414,
			goal_id = 50035,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50036] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 6,
			show_icon = 401,
			goal_id = 50036,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50037] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 6,
			show_icon = 157,
			goal_id = 50037,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50038] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 6,
			show_icon = 134,
			goal_id = 50038,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50039] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 6,
			show_icon = 153,
			goal_id = 50039,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50040] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "别忘了技能的提升",
			desc = "进行1次战技重铸",
			day = 6,
			show_icon = 200,
			goal_id = 50040,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_artifact_recast",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50041] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 6,
			show_icon = 152,
			goal_id = 50041,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50042] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 6,
			show_icon = 429,
			goal_id = 50042,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50043] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 7,
			show_icon = 401,
			goal_id = 50043,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50044] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 7,
			show_icon = 131,
			goal_id = 50044,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50045] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 7,
			show_icon = 146,
			goal_id = 50045,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50046] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 7,
			show_icon = 158,
			goal_id = 50046,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50047] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "为大佬点个赞",
			desc = "在录像馆点赞3次",
			day = 7,
			show_icon = 412,
			goal_id = 50047,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_replay_hall_like",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50048] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 7,
			show_icon = 152,
			goal_id = 50048,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50049] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 7,
			show_icon = 414,
			goal_id = 50049,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50050] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 8,
			show_icon = 401,
			goal_id = 50050,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50051] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 8,
			show_icon = 157,
			goal_id = 50051,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50052] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 8,
			show_icon = 138,
			goal_id = 50052,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50053] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "出现吧！命运的羁绊",
			desc = "先知英雄转换1次",
			day = 8,
			show_icon = 427,
			goal_id = 50053,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_recruit_convert",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50054] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 8,
			show_icon = 153,
			goal_id = 50054,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50055] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 8,
			show_icon = 152,
			goal_id = 50055,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50056] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 8,
			show_icon = 429,
			goal_id = 50056,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50057] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 9,
			show_icon = 401,
			goal_id = 50057,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50058] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 9,
			show_icon = 131,
			goal_id = 50058,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50059] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 9,
			show_icon = 158,
			goal_id = 50059,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50060] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 9,
			show_icon = 146,
			goal_id = 50060,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50061] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 9,
			show_icon = 153,
			goal_id = 50061,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50062] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 9,
			show_icon = 152,
			goal_id = 50062,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50063] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 9,
			show_icon = 414,
			goal_id = 50063,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50064] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 10,
			show_icon = 401,
			goal_id = 50064,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50065] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 10,
			show_icon = 157,
			goal_id = 50065,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50066] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 10,
			show_icon = 129,
			goal_id = 50066,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50067] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 10,
			show_icon = 153,
			goal_id = 50067,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50068] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 10,
			show_icon = 134,
			goal_id = 50068,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50069] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 10,
			show_icon = 152,
			goal_id = 50069,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50070] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 10,
			show_icon = 429,
			goal_id = 50070,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50071] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 11,
			show_icon = 401,
			goal_id = 50071,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50072] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 11,
			show_icon = 131,
			goal_id = 50072,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50073] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 11,
			show_icon = 146,
			goal_id = 50073,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50074] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 11,
			show_icon = 158,
			goal_id = 50074,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50075] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 11,
			show_icon = 134,
			goal_id = 50075,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50076] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 11,
			show_icon = 152,
			goal_id = 50076,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50077] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 11,
			show_icon = 414,
			goal_id = 50077,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50078] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 12,
			show_icon = 401,
			goal_id = 50078,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50079] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 12,
			show_icon = 157,
			goal_id = 50079,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50080] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 12,
			show_icon = 138,
			goal_id = 50080,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50081] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 12,
			show_icon = 129,
			goal_id = 50081,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50082] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 12,
			show_icon = 153,
			goal_id = 50082,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50083] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 12,
			show_icon = 152,
			goal_id = 50083,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50084] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 12,
			show_icon = 429,
			goal_id = 50084,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50085] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 13,
			show_icon = 401,
			goal_id = 50085,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50086] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 13,
			show_icon = 131,
			goal_id = 50086,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50087] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 13,
			show_icon = 158,
			goal_id = 50087,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50088] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 13,
			show_icon = 146,
			goal_id = 50088,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50089] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 13,
			show_icon = 153,
			goal_id = 50089,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50090] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 13,
			show_icon = 152,
			goal_id = 50090,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50091] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 13,
			show_icon = 414,
			goal_id = 50091,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50092] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 14,
			show_icon = 401,
			goal_id = 50092,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50093] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 14,
			show_icon = 157,
			goal_id = 50093,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50094] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 14,
			show_icon = 129,
			goal_id = 50094,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50095] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 14,
			show_icon = 153,
			goal_id = 50095,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50096] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 14,
			show_icon = 134,
			goal_id = 50096,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50097] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 14,
			show_icon = 152,
			goal_id = 50097,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50098] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 14,
			show_icon = 429,
			goal_id = 50098,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50099] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 15,
			show_icon = 401,
			goal_id = 50099,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50100] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 15,
			show_icon = 131,
			goal_id = 50100,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50101] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 15,
			show_icon = 146,
			goal_id = 50101,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50102] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 15,
			show_icon = 158,
			goal_id = 50102,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50103] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 15,
			show_icon = 134,
			goal_id = 50103,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50104] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 15,
			show_icon = 152,
			goal_id = 50104,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50105] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 15,
			show_icon = 414,
			goal_id = 50105,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50106] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 16,
			show_icon = 401,
			goal_id = 50106,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50107] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 16,
			show_icon = 157,
			goal_id = 50107,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50108] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 16,
			show_icon = 138,
			goal_id = 50108,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50109] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 16,
			show_icon = 129,
			goal_id = 50109,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50110] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 16,
			show_icon = 153,
			goal_id = 50110,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50111] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 16,
			show_icon = 152,
			goal_id = 50111,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50112] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 16,
			show_icon = 429,
			goal_id = 50112,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50113] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 17,
			show_icon = 401,
			goal_id = 50113,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50114] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 17,
			show_icon = 153,
			goal_id = 50114,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50115] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 17,
			show_icon = 131,
			goal_id = 50115,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50116] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 17,
			show_icon = 158,
			goal_id = 50116,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50117] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 17,
			show_icon = 146,
			goal_id = 50117,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50118] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 17,
			show_icon = 152,
			goal_id = 50118,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50119] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 17,
			show_icon = 414,
			goal_id = 50119,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50120] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 18,
			show_icon = 401,
			goal_id = 50120,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50121] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 18,
			show_icon = 157,
			goal_id = 50121,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50122] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 18,
			show_icon = 134,
			goal_id = 50122,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50123] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 18,
			show_icon = 153,
			goal_id = 50123,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50124] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "装备冶炼师",
			desc = "合成5个任意装备",
			day = 18,
			show_icon = 154,
			goal_id = 50124,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_equipment_compound",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50125] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 18,
			show_icon = 152,
			goal_id = 50125,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50126] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 18,
			show_icon = 429,
			goal_id = 50126,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50127] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 19,
			show_icon = 401,
			goal_id = 50127,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50128] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 19,
			show_icon = 131,
			goal_id = 50128,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50129] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 19,
			show_icon = 146,
			goal_id = 50129,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50130] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 19,
			show_icon = 158,
			goal_id = 50130,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50131] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我还能爬的更高",
			desc = "参与5次海底监狱",
			day = 19,
			show_icon = 160,
			goal_id = 50131,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_star_tower_pass",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50132] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 19,
			show_icon = 152,
			goal_id = 50132,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50133] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 19,
			show_icon = 414,
			goal_id = 50133,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50134] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 20,
			show_icon = 401,
			goal_id = 50134,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50135] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 20,
			show_icon = 157,
			goal_id = 50135,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50136] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 20,
			show_icon = 138,
			goal_id = 50136,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50137] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "出现吧！命运的羁绊",
			desc = "先知英雄转换1次",
			day = 20,
			show_icon = 427,
			goal_id = 50137,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_recruit_convert",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50138] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 20,
			show_icon = 153,
			goal_id = 50138,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50139] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 20,
			show_icon = 152,
			goal_id = 50139,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50140] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 20,
			show_icon = 429,
			goal_id = 50140,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50141] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 21,
			show_icon = 401,
			goal_id = 50141,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50142] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 21,
			show_icon = 153,
			goal_id = 50142,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50143] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 21,
			show_icon = 131,
			goal_id = 50143,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50144] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 21,
			show_icon = 158,
			goal_id = 50144,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50145] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 21,
			show_icon = 146,
			goal_id = 50145,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50146] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 21,
			show_icon = 152,
			goal_id = 50146,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50147] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 21,
			show_icon = 414,
			goal_id = 50147,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50148] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 22,
			show_icon = 401,
			goal_id = 50148,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50149] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 22,
			show_icon = 157,
			goal_id = 50149,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50150] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 22,
			show_icon = 134,
			goal_id = 50150,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50151] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 22,
			show_icon = 153,
			goal_id = 50151,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50152] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "别忘了技能的提升",
			desc = "进行1次战技重铸",
			day = 22,
			show_icon = 200,
			goal_id = 50152,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_artifact_recast",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50153] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 22,
			show_icon = 152,
			goal_id = 50153,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50154] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 22,
			show_icon = 429,
			goal_id = 50154,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50155] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 23,
			show_icon = 401,
			goal_id = 50155,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50156] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 23,
			show_icon = 131,
			goal_id = 50156,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50157] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 23,
			show_icon = 146,
			goal_id = 50157,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50158] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 23,
			show_icon = 158,
			goal_id = 50158,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50159] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每日都在变强",
			desc = "升级任意神技5次",
			day = 23,
			show_icon = 201,
			goal_id = 50159,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_hallows_step_intensify",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50160] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 23,
			show_icon = 152,
			goal_id = 50160,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50161] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 23,
			show_icon = 414,
			goal_id = 50161,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50162] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 24,
			show_icon = 401,
			goal_id = 50162,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50163] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 24,
			show_icon = 157,
			goal_id = 50163,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50164] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 24,
			show_icon = 138,
			goal_id = 50164,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50165] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "出现吧！命运的羁绊",
			desc = "先知英雄转换1次",
			day = 24,
			show_icon = 427,
			goal_id = 50165,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_recruit_convert",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50166] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 24,
			show_icon = 153,
			goal_id = 50166,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50167] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 24,
			show_icon = 152,
			goal_id = 50167,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50168] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 24,
			show_icon = 429,
			goal_id = 50168,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50169] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 25,
			show_icon = 401,
			goal_id = 50169,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50170] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 25,
			show_icon = 131,
			goal_id = 50170,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50171] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 25,
			show_icon = 158,
			goal_id = 50171,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50172] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 25,
			show_icon = 146,
			goal_id = 50172,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50173] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 25,
			show_icon = 153,
			goal_id = 50173,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50174] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 25,
			show_icon = 152,
			goal_id = 50174,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50175] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 25,
			show_icon = 414,
			goal_id = 50175,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50176] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 26,
			show_icon = 401,
			goal_id = 50176,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50177] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 26,
			show_icon = 157,
			goal_id = 50177,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50178] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 26,
			show_icon = 129,
			goal_id = 50178,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50179] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 26,
			show_icon = 153,
			goal_id = 50179,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50180] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 26,
			show_icon = 134,
			goal_id = 50180,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50181] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 26,
			show_icon = 152,
			goal_id = 50181,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50182] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 26,
			show_icon = 429,
			goal_id = 50182,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50183] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 27,
			show_icon = 401,
			goal_id = 50183,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50184] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 27,
			show_icon = 131,
			goal_id = 50184,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50185] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 27,
			show_icon = 146,
			goal_id = 50185,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50186] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 27,
			show_icon = 158,
			goal_id = 50186,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50187] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 27,
			show_icon = 134,
			goal_id = 50187,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50188] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 27,
			show_icon = 152,
			goal_id = 50188,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50189] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 27,
			show_icon = 414,
			goal_id = 50189,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50190] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 28,
			show_icon = 401,
			goal_id = 50190,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50191] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 28,
			show_icon = 157,
			goal_id = 50191,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50192] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 28,
			show_icon = 138,
			goal_id = 50192,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50193] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 28,
			show_icon = 129,
			goal_id = 50193,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50194] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 28,
			show_icon = 153,
			goal_id = 50194,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50195] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 28,
			show_icon = 152,
			goal_id = 50195,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50196] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 28,
			show_icon = 429,
			goal_id = 50196,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50197] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 29,
			show_icon = 401,
			goal_id = 50197,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50198] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 29,
			show_icon = 131,
			goal_id = 50198,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50199] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 29,
			show_icon = 158,
			goal_id = 50199,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50200] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 29,
			show_icon = 146,
			goal_id = 50200,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50201] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 29,
			show_icon = 153,
			goal_id = 50201,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50202] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 29,
			show_icon = 152,
			goal_id = 50202,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50203] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 29,
			show_icon = 414,
			goal_id = 50203,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50204] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 30,
			show_icon = 401,
			goal_id = 50204,
			id = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50205] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 30,
			show_icon = 157,
			goal_id = 50205,
			id = 2,
			period = 1,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50206] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 30,
			show_icon = 129,
			goal_id = 50206,
			id = 3,
			period = 1,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50207] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 30,
			show_icon = 153,
			goal_id = 50207,
			id = 4,
			period = 1,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50208] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 30,
			show_icon = 134,
			goal_id = 50208,
			id = 5,
			period = 1,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50209] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 30,
			show_icon = 152,
			goal_id = 50209,
			id = 6,
			period = 1,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50210] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 30,
			show_icon = 429,
			goal_id = 50210,
			id = 7,
			period = 1,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		}
	},
	{
		[50211] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 1,
			show_icon = 401,
			goal_id = 50211,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50212] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 1,
			show_icon = 153,
			goal_id = 50212,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50213] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 1,
			show_icon = 131,
			goal_id = 50213,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50214] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 1,
			show_icon = 158,
			goal_id = 50214,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50215] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 1,
			show_icon = 146,
			goal_id = 50215,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50216] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 1,
			show_icon = 152,
			goal_id = 50216,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50217] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 1,
			show_icon = 414,
			goal_id = 50217,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50218] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 2,
			show_icon = 401,
			goal_id = 50218,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50219] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 2,
			show_icon = 157,
			goal_id = 50219,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50220] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 2,
			show_icon = 134,
			goal_id = 50220,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50221] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 2,
			show_icon = 153,
			goal_id = 50221,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50222] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "装备冶炼师",
			desc = "合成5个任意装备",
			day = 2,
			show_icon = 154,
			goal_id = 50222,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_equipment_compound",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50223] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 2,
			show_icon = 152,
			goal_id = 50223,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50224] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 2,
			show_icon = 429,
			goal_id = 50224,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50225] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 3,
			show_icon = 401,
			goal_id = 50225,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50226] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 3,
			show_icon = 131,
			goal_id = 50226,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50227] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 3,
			show_icon = 146,
			goal_id = 50227,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50228] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 3,
			show_icon = 158,
			goal_id = 50228,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50229] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我还能爬的更高",
			desc = "参与5次海底监狱",
			day = 3,
			show_icon = 160,
			goal_id = 50229,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_star_tower_pass",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50230] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 3,
			show_icon = 152,
			goal_id = 50230,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50231] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 3,
			show_icon = 414,
			goal_id = 50231,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50232] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 4,
			show_icon = 401,
			goal_id = 50232,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50233] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 4,
			show_icon = 157,
			goal_id = 50233,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50234] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 4,
			show_icon = 138,
			goal_id = 50234,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50235] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "出现吧！命运的羁绊",
			desc = "先知英雄转换1次",
			day = 4,
			show_icon = 427,
			goal_id = 50235,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_recruit_convert",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50236] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 4,
			show_icon = 153,
			goal_id = 50236,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50237] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 4,
			show_icon = 152,
			goal_id = 50237,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50238] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 4,
			show_icon = 429,
			goal_id = 50238,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50239] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 5,
			show_icon = 401,
			goal_id = 50239,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50240] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 5,
			show_icon = 153,
			goal_id = 50240,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50241] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 5,
			show_icon = 131,
			goal_id = 50241,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50242] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 5,
			show_icon = 158,
			goal_id = 50242,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50243] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 5,
			show_icon = 146,
			goal_id = 50243,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50244] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 5,
			show_icon = 152,
			goal_id = 50244,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50245] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 5,
			show_icon = 414,
			goal_id = 50245,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50246] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 6,
			show_icon = 401,
			goal_id = 50246,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50247] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 6,
			show_icon = 157,
			goal_id = 50247,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50248] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 6,
			show_icon = 134,
			goal_id = 50248,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50249] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 6,
			show_icon = 153,
			goal_id = 50249,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50250] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "别忘了技能的提升",
			desc = "进行1次战技重铸",
			day = 6,
			show_icon = 200,
			goal_id = 50250,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_artifact_recast",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50251] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 6,
			show_icon = 152,
			goal_id = 50251,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50252] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 6,
			show_icon = 429,
			goal_id = 50252,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50253] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 7,
			show_icon = 401,
			goal_id = 50253,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50254] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 7,
			show_icon = 131,
			goal_id = 50254,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50255] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 7,
			show_icon = 146,
			goal_id = 50255,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50256] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 7,
			show_icon = 158,
			goal_id = 50256,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50257] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "为大佬点个赞",
			desc = "在录像馆点赞3次",
			day = 7,
			show_icon = 412,
			goal_id = 50257,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_replay_hall_like",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50258] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 7,
			show_icon = 152,
			goal_id = 50258,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50259] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 7,
			show_icon = 414,
			goal_id = 50259,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50260] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 8,
			show_icon = 401,
			goal_id = 50260,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50261] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 8,
			show_icon = 157,
			goal_id = 50261,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50262] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 8,
			show_icon = 138,
			goal_id = 50262,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50263] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "出现吧！命运的羁绊",
			desc = "先知英雄转换1次",
			day = 8,
			show_icon = 427,
			goal_id = 50263,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_recruit_convert",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50264] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 8,
			show_icon = 153,
			goal_id = 50264,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50265] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 8,
			show_icon = 152,
			goal_id = 50265,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50266] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 8,
			show_icon = 429,
			goal_id = 50266,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50267] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 9,
			show_icon = 401,
			goal_id = 50267,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50268] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 9,
			show_icon = 131,
			goal_id = 50268,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50269] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 9,
			show_icon = 158,
			goal_id = 50269,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50270] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 9,
			show_icon = 146,
			goal_id = 50270,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50271] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 9,
			show_icon = 153,
			goal_id = 50271,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50272] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 9,
			show_icon = 152,
			goal_id = 50272,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50273] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 9,
			show_icon = 414,
			goal_id = 50273,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50274] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 10,
			show_icon = 401,
			goal_id = 50274,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50275] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 10,
			show_icon = 157,
			goal_id = 50275,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50276] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 10,
			show_icon = 129,
			goal_id = 50276,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50277] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 10,
			show_icon = 153,
			goal_id = 50277,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50278] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 10,
			show_icon = 134,
			goal_id = 50278,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50279] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 10,
			show_icon = 152,
			goal_id = 50279,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50280] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 10,
			show_icon = 429,
			goal_id = 50280,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50281] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 11,
			show_icon = 401,
			goal_id = 50281,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50282] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 11,
			show_icon = 131,
			goal_id = 50282,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50283] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 11,
			show_icon = 146,
			goal_id = 50283,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50284] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 11,
			show_icon = 158,
			goal_id = 50284,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50285] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 11,
			show_icon = 134,
			goal_id = 50285,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50286] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 11,
			show_icon = 152,
			goal_id = 50286,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50287] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 11,
			show_icon = 414,
			goal_id = 50287,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50288] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 12,
			show_icon = 401,
			goal_id = 50288,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50289] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 12,
			show_icon = 157,
			goal_id = 50289,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50290] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 12,
			show_icon = 138,
			goal_id = 50290,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50291] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 12,
			show_icon = 129,
			goal_id = 50291,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50292] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 12,
			show_icon = 153,
			goal_id = 50292,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50293] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 12,
			show_icon = 152,
			goal_id = 50293,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50294] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 12,
			show_icon = 429,
			goal_id = 50294,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50295] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 13,
			show_icon = 401,
			goal_id = 50295,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50296] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 13,
			show_icon = 131,
			goal_id = 50296,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50297] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 13,
			show_icon = 158,
			goal_id = 50297,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50298] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 13,
			show_icon = 146,
			goal_id = 50298,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50299] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 13,
			show_icon = 153,
			goal_id = 50299,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50300] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 13,
			show_icon = 152,
			goal_id = 50300,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50301] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 13,
			show_icon = 414,
			goal_id = 50301,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50302] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 14,
			show_icon = 401,
			goal_id = 50302,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50303] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 14,
			show_icon = 157,
			goal_id = 50303,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50304] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 14,
			show_icon = 129,
			goal_id = 50304,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50305] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 14,
			show_icon = 153,
			goal_id = 50305,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50306] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 14,
			show_icon = 134,
			goal_id = 50306,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50307] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 14,
			show_icon = 152,
			goal_id = 50307,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50308] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 14,
			show_icon = 429,
			goal_id = 50308,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50309] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 15,
			show_icon = 401,
			goal_id = 50309,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50310] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 15,
			show_icon = 131,
			goal_id = 50310,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50311] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 15,
			show_icon = 146,
			goal_id = 50311,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50312] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 15,
			show_icon = 158,
			goal_id = 50312,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50313] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 15,
			show_icon = 134,
			goal_id = 50313,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50314] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 15,
			show_icon = 152,
			goal_id = 50314,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50315] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 15,
			show_icon = 414,
			goal_id = 50315,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50316] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 16,
			show_icon = 401,
			goal_id = 50316,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50317] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 16,
			show_icon = 157,
			goal_id = 50317,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50318] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 16,
			show_icon = 138,
			goal_id = 50318,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50319] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 16,
			show_icon = 129,
			goal_id = 50319,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50320] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 16,
			show_icon = 153,
			goal_id = 50320,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50321] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 16,
			show_icon = 152,
			goal_id = 50321,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50322] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 16,
			show_icon = 429,
			goal_id = 50322,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50323] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 17,
			show_icon = 401,
			goal_id = 50323,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50324] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 17,
			show_icon = 153,
			goal_id = 50324,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50325] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 17,
			show_icon = 131,
			goal_id = 50325,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50326] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 17,
			show_icon = 158,
			goal_id = 50326,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50327] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 17,
			show_icon = 146,
			goal_id = 50327,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50328] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 17,
			show_icon = 152,
			goal_id = 50328,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50329] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 17,
			show_icon = 414,
			goal_id = 50329,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50330] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 18,
			show_icon = 401,
			goal_id = 50330,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50331] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 18,
			show_icon = 157,
			goal_id = 50331,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50332] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 18,
			show_icon = 134,
			goal_id = 50332,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50333] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 18,
			show_icon = 153,
			goal_id = 50333,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50334] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "装备冶炼师",
			desc = "合成5个任意装备",
			day = 18,
			show_icon = 154,
			goal_id = 50334,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_equipment_compound",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50335] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 18,
			show_icon = 152,
			goal_id = 50335,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50336] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 18,
			show_icon = 429,
			goal_id = 50336,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50337] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 19,
			show_icon = 401,
			goal_id = 50337,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50338] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 19,
			show_icon = 131,
			goal_id = 50338,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50339] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 19,
			show_icon = 146,
			goal_id = 50339,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50340] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 19,
			show_icon = 158,
			goal_id = 50340,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50341] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我还能爬的更高",
			desc = "参与5次海底监狱",
			day = 19,
			show_icon = 160,
			goal_id = 50341,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_star_tower_pass",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50342] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 19,
			show_icon = 152,
			goal_id = 50342,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50343] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 19,
			show_icon = 414,
			goal_id = 50343,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50344] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 20,
			show_icon = 401,
			goal_id = 50344,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50345] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 20,
			show_icon = 157,
			goal_id = 50345,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50346] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 20,
			show_icon = 138,
			goal_id = 50346,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50347] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "出现吧！命运的羁绊",
			desc = "先知英雄转换1次",
			day = 20,
			show_icon = 427,
			goal_id = 50347,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_recruit_convert",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50348] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 20,
			show_icon = 153,
			goal_id = 50348,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50349] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 20,
			show_icon = 152,
			goal_id = 50349,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50350] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 20,
			show_icon = 429,
			goal_id = 50350,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50351] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 21,
			show_icon = 401,
			goal_id = 50351,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50352] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 21,
			show_icon = 153,
			goal_id = 50352,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50353] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 21,
			show_icon = 131,
			goal_id = 50353,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50354] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 21,
			show_icon = 158,
			goal_id = 50354,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50355] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 21,
			show_icon = 146,
			goal_id = 50355,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50356] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 21,
			show_icon = 152,
			goal_id = 50356,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50357] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 21,
			show_icon = 414,
			goal_id = 50357,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50358] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 22,
			show_icon = 401,
			goal_id = 50358,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50359] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 22,
			show_icon = 157,
			goal_id = 50359,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50360] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 22,
			show_icon = 134,
			goal_id = 50360,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50361] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 22,
			show_icon = 153,
			goal_id = 50361,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50362] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "别忘了技能的提升",
			desc = "进行1次战技重铸",
			day = 22,
			show_icon = 200,
			goal_id = 50362,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_artifact_recast",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50363] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 22,
			show_icon = 152,
			goal_id = 50363,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50364] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 22,
			show_icon = 429,
			goal_id = 50364,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50365] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 23,
			show_icon = 401,
			goal_id = 50365,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50366] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 23,
			show_icon = 131,
			goal_id = 50366,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50367] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 23,
			show_icon = 146,
			goal_id = 50367,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50368] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 23,
			show_icon = 158,
			goal_id = 50368,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50369] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每日都在变强",
			desc = "升级任意神技5次",
			day = 23,
			show_icon = 201,
			goal_id = 50369,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_hallows_step_intensify",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50370] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 23,
			show_icon = 152,
			goal_id = 50370,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50371] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 23,
			show_icon = 414,
			goal_id = 50371,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50372] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 24,
			show_icon = 401,
			goal_id = 50372,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50373] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 24,
			show_icon = 157,
			goal_id = 50373,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50374] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 24,
			show_icon = 138,
			goal_id = 50374,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50375] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "出现吧！命运的羁绊",
			desc = "先知英雄转换1次",
			day = 24,
			show_icon = 427,
			goal_id = 50375,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_recruit_convert",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50376] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 24,
			show_icon = 153,
			goal_id = 50376,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50377] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 24,
			show_icon = 152,
			goal_id = 50377,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50378] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 24,
			show_icon = 429,
			goal_id = 50378,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50379] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 25,
			show_icon = 401,
			goal_id = 50379,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50380] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 25,
			show_icon = 131,
			goal_id = 50380,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50381] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 25,
			show_icon = 158,
			goal_id = 50381,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50382] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 25,
			show_icon = 146,
			goal_id = 50382,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50383] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 25,
			show_icon = 153,
			goal_id = 50383,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50384] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 25,
			show_icon = 152,
			goal_id = 50384,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50385] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 25,
			show_icon = 414,
			goal_id = 50385,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50386] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 26,
			show_icon = 401,
			goal_id = 50386,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50387] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 26,
			show_icon = 157,
			goal_id = 50387,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50388] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 26,
			show_icon = 129,
			goal_id = 50388,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50389] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 26,
			show_icon = 153,
			goal_id = 50389,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50390] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 26,
			show_icon = 134,
			goal_id = 50390,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50391] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 26,
			show_icon = 152,
			goal_id = 50391,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50392] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 26,
			show_icon = 429,
			goal_id = 50392,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50393] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 27,
			show_icon = 401,
			goal_id = 50393,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50394] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 27,
			show_icon = 131,
			goal_id = 50394,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50395] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 27,
			show_icon = 146,
			goal_id = 50395,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50396] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 27,
			show_icon = 158,
			goal_id = 50396,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50397] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 27,
			show_icon = 134,
			goal_id = 50397,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50398] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 27,
			show_icon = 152,
			goal_id = 50398,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50399] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 27,
			show_icon = 414,
			goal_id = 50399,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50400] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 28,
			show_icon = 401,
			goal_id = 50400,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50401] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 28,
			show_icon = 157,
			goal_id = 50401,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50402] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 28,
			show_icon = 138,
			goal_id = 50402,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50403] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 28,
			show_icon = 129,
			goal_id = 50403,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50404] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 28,
			show_icon = 153,
			goal_id = 50404,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50405] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 28,
			show_icon = 152,
			goal_id = 50405,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50406] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 28,
			show_icon = 429,
			goal_id = 50406,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50407] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 29,
			show_icon = 401,
			goal_id = 50407,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50408] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 29,
			show_icon = 131,
			goal_id = 50408,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50409] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 29,
			show_icon = 158,
			goal_id = 50409,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50410] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 29,
			show_icon = 146,
			goal_id = 50410,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50411] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 29,
			show_icon = 153,
			goal_id = 50411,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50412] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 29,
			show_icon = 152,
			goal_id = 50412,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50413] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 29,
			show_icon = 414,
			goal_id = 50413,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50414] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 30,
			show_icon = 401,
			goal_id = 50414,
			id = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50415] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 30,
			show_icon = 157,
			goal_id = 50415,
			id = 2,
			period = 2,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50416] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 30,
			show_icon = 129,
			goal_id = 50416,
			id = 3,
			period = 2,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50417] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 30,
			show_icon = 153,
			goal_id = 50417,
			id = 4,
			period = 2,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50418] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 30,
			show_icon = 134,
			goal_id = 50418,
			id = 5,
			period = 2,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50419] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 30,
			show_icon = 152,
			goal_id = 50419,
			id = 6,
			period = 2,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50420] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 30,
			show_icon = 429,
			goal_id = 50420,
			id = 7,
			period = 2,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		}
	},
	{
		[50421] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 1,
			show_icon = 401,
			goal_id = 50421,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50422] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 1,
			show_icon = 153,
			goal_id = 50422,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50423] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 1,
			show_icon = 131,
			goal_id = 50423,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50424] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 1,
			show_icon = 158,
			goal_id = 50424,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50425] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 1,
			show_icon = 146,
			goal_id = 50425,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50426] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 1,
			show_icon = 152,
			goal_id = 50426,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50427] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 1,
			show_icon = 414,
			goal_id = 50427,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50428] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 2,
			show_icon = 401,
			goal_id = 50428,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50429] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 2,
			show_icon = 157,
			goal_id = 50429,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50430] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 2,
			show_icon = 134,
			goal_id = 50430,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50431] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 2,
			show_icon = 153,
			goal_id = 50431,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50432] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "装备冶炼师",
			desc = "合成5个任意装备",
			day = 2,
			show_icon = 154,
			goal_id = 50432,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_equipment_compound",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50433] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 2,
			show_icon = 152,
			goal_id = 50433,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50434] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 2,
			show_icon = 429,
			goal_id = 50434,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50435] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 3,
			show_icon = 401,
			goal_id = 50435,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50436] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 3,
			show_icon = 131,
			goal_id = 50436,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50437] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 3,
			show_icon = 146,
			goal_id = 50437,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50438] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 3,
			show_icon = 158,
			goal_id = 50438,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50439] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我还能爬的更高",
			desc = "参与5次海底监狱",
			day = 3,
			show_icon = 160,
			goal_id = 50439,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_star_tower_pass",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50440] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 3,
			show_icon = 152,
			goal_id = 50440,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50441] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 3,
			show_icon = 414,
			goal_id = 50441,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50442] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 4,
			show_icon = 401,
			goal_id = 50442,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50443] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 4,
			show_icon = 157,
			goal_id = 50443,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50444] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 4,
			show_icon = 138,
			goal_id = 50444,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50445] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "出现吧！命运的羁绊",
			desc = "先知英雄转换1次",
			day = 4,
			show_icon = 427,
			goal_id = 50445,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_recruit_convert",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50446] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 4,
			show_icon = 153,
			goal_id = 50446,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50447] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 4,
			show_icon = 152,
			goal_id = 50447,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50448] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 4,
			show_icon = 429,
			goal_id = 50448,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50449] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 5,
			show_icon = 401,
			goal_id = 50449,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50450] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 5,
			show_icon = 153,
			goal_id = 50450,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50451] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 5,
			show_icon = 131,
			goal_id = 50451,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50452] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 5,
			show_icon = 158,
			goal_id = 50452,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50453] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 5,
			show_icon = 146,
			goal_id = 50453,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50454] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 5,
			show_icon = 152,
			goal_id = 50454,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50455] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 5,
			show_icon = 414,
			goal_id = 50455,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50456] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 6,
			show_icon = 401,
			goal_id = 50456,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50457] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 6,
			show_icon = 157,
			goal_id = 50457,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50458] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 6,
			show_icon = 134,
			goal_id = 50458,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50459] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 6,
			show_icon = 153,
			goal_id = 50459,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50460] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "别忘了技能的提升",
			desc = "进行1次战技重铸",
			day = 6,
			show_icon = 200,
			goal_id = 50460,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_artifact_recast",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50461] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 6,
			show_icon = 152,
			goal_id = 50461,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50462] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 6,
			show_icon = 429,
			goal_id = 50462,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50463] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 7,
			show_icon = 401,
			goal_id = 50463,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50464] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 7,
			show_icon = 131,
			goal_id = 50464,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50465] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 7,
			show_icon = 146,
			goal_id = 50465,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50466] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 7,
			show_icon = 158,
			goal_id = 50466,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50467] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "为大佬点个赞",
			desc = "在录像馆点赞3次",
			day = 7,
			show_icon = 412,
			goal_id = 50467,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_replay_hall_like",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50468] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 7,
			show_icon = 152,
			goal_id = 50468,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50469] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 7,
			show_icon = 414,
			goal_id = 50469,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50470] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 8,
			show_icon = 401,
			goal_id = 50470,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50471] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 8,
			show_icon = 157,
			goal_id = 50471,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50472] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 8,
			show_icon = 138,
			goal_id = 50472,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50473] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "出现吧！命运的羁绊",
			desc = "先知英雄转换1次",
			day = 8,
			show_icon = 427,
			goal_id = 50473,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_recruit_convert",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50474] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 8,
			show_icon = 153,
			goal_id = 50474,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50475] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 8,
			show_icon = 152,
			goal_id = 50475,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50476] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 8,
			show_icon = 429,
			goal_id = 50476,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50477] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 9,
			show_icon = 401,
			goal_id = 50477,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50478] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 9,
			show_icon = 131,
			goal_id = 50478,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50479] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 9,
			show_icon = 158,
			goal_id = 50479,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50480] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 9,
			show_icon = 146,
			goal_id = 50480,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50481] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 9,
			show_icon = 153,
			goal_id = 50481,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50482] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 9,
			show_icon = 152,
			goal_id = 50482,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50483] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 9,
			show_icon = 414,
			goal_id = 50483,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50484] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 10,
			show_icon = 401,
			goal_id = 50484,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50485] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 10,
			show_icon = 157,
			goal_id = 50485,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50486] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 10,
			show_icon = 129,
			goal_id = 50486,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50487] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 10,
			show_icon = 153,
			goal_id = 50487,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50488] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 10,
			show_icon = 134,
			goal_id = 50488,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50489] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 10,
			show_icon = 152,
			goal_id = 50489,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50490] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 10,
			show_icon = 429,
			goal_id = 50490,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50491] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 11,
			show_icon = 401,
			goal_id = 50491,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50492] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 11,
			show_icon = 131,
			goal_id = 50492,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50493] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 11,
			show_icon = 146,
			goal_id = 50493,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50494] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 11,
			show_icon = 158,
			goal_id = 50494,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50495] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 11,
			show_icon = 134,
			goal_id = 50495,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50496] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 11,
			show_icon = 152,
			goal_id = 50496,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50497] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 11,
			show_icon = 414,
			goal_id = 50497,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50498] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 12,
			show_icon = 401,
			goal_id = 50498,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50499] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 12,
			show_icon = 157,
			goal_id = 50499,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50500] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 12,
			show_icon = 138,
			goal_id = 50500,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50501] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 12,
			show_icon = 129,
			goal_id = 50501,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50502] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 12,
			show_icon = 153,
			goal_id = 50502,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50503] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 12,
			show_icon = 152,
			goal_id = 50503,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50504] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 12,
			show_icon = 429,
			goal_id = 50504,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50505] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 13,
			show_icon = 401,
			goal_id = 50505,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50506] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 13,
			show_icon = 131,
			goal_id = 50506,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50507] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 13,
			show_icon = 158,
			goal_id = 50507,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50508] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 13,
			show_icon = 146,
			goal_id = 50508,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50509] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 13,
			show_icon = 153,
			goal_id = 50509,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50510] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 13,
			show_icon = 152,
			goal_id = 50510,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50511] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 13,
			show_icon = 414,
			goal_id = 50511,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50512] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 14,
			show_icon = 401,
			goal_id = 50512,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50513] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 14,
			show_icon = 157,
			goal_id = 50513,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50514] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 14,
			show_icon = 129,
			goal_id = 50514,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50515] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 14,
			show_icon = 153,
			goal_id = 50515,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50516] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 14,
			show_icon = 134,
			goal_id = 50516,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50517] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 14,
			show_icon = 152,
			goal_id = 50517,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50518] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 14,
			show_icon = 429,
			goal_id = 50518,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50519] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 15,
			show_icon = 401,
			goal_id = 50519,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50520] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 15,
			show_icon = 131,
			goal_id = 50520,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50521] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 15,
			show_icon = 146,
			goal_id = 50521,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50522] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 15,
			show_icon = 158,
			goal_id = 50522,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50523] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 15,
			show_icon = 134,
			goal_id = 50523,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50524] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 15,
			show_icon = 152,
			goal_id = 50524,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50525] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 15,
			show_icon = 414,
			goal_id = 50525,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50526] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 16,
			show_icon = 401,
			goal_id = 50526,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50527] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 16,
			show_icon = 157,
			goal_id = 50527,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50528] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 16,
			show_icon = 138,
			goal_id = 50528,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50529] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 16,
			show_icon = 129,
			goal_id = 50529,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50530] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 16,
			show_icon = 153,
			goal_id = 50530,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50531] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 16,
			show_icon = 152,
			goal_id = 50531,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50532] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 16,
			show_icon = 429,
			goal_id = 50532,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50533] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 17,
			show_icon = 401,
			goal_id = 50533,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50534] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 17,
			show_icon = 153,
			goal_id = 50534,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50535] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 17,
			show_icon = 131,
			goal_id = 50535,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50536] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 17,
			show_icon = 158,
			goal_id = 50536,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50537] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 17,
			show_icon = 146,
			goal_id = 50537,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50538] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 17,
			show_icon = 152,
			goal_id = 50538,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50539] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 17,
			show_icon = 414,
			goal_id = 50539,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50540] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 18,
			show_icon = 401,
			goal_id = 50540,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50541] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 18,
			show_icon = 157,
			goal_id = 50541,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50542] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 18,
			show_icon = 134,
			goal_id = 50542,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50543] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 18,
			show_icon = 153,
			goal_id = 50543,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50544] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "装备冶炼师",
			desc = "合成5个任意装备",
			day = 18,
			show_icon = 154,
			goal_id = 50544,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_equipment_compound",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50545] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 18,
			show_icon = 152,
			goal_id = 50545,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50546] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 18,
			show_icon = 429,
			goal_id = 50546,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50547] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 19,
			show_icon = 401,
			goal_id = 50547,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50548] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 19,
			show_icon = 131,
			goal_id = 50548,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50549] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 19,
			show_icon = 146,
			goal_id = 50549,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50550] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 19,
			show_icon = 158,
			goal_id = 50550,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50551] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我还能爬的更高",
			desc = "参与5次海底监狱",
			day = 19,
			show_icon = 160,
			goal_id = 50551,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_star_tower_pass",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50552] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 19,
			show_icon = 152,
			goal_id = 50552,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50553] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 19,
			show_icon = 414,
			goal_id = 50553,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50554] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 20,
			show_icon = 401,
			goal_id = 50554,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50555] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 20,
			show_icon = 157,
			goal_id = 50555,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50556] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 20,
			show_icon = 138,
			goal_id = 50556,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50557] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "出现吧！命运的羁绊",
			desc = "先知英雄转换1次",
			day = 20,
			show_icon = 427,
			goal_id = 50557,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_recruit_convert",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50558] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 20,
			show_icon = 153,
			goal_id = 50558,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50559] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 20,
			show_icon = 152,
			goal_id = 50559,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50560] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 20,
			show_icon = 429,
			goal_id = 50560,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50561] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 21,
			show_icon = 401,
			goal_id = 50561,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50562] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 21,
			show_icon = 153,
			goal_id = 50562,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50563] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 21,
			show_icon = 131,
			goal_id = 50563,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50564] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 21,
			show_icon = 158,
			goal_id = 50564,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50565] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 21,
			show_icon = 146,
			goal_id = 50565,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50566] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 21,
			show_icon = 152,
			goal_id = 50566,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50567] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 21,
			show_icon = 414,
			goal_id = 50567,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50568] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 22,
			show_icon = 401,
			goal_id = 50568,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50569] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 22,
			show_icon = 157,
			goal_id = 50569,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50570] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 22,
			show_icon = 134,
			goal_id = 50570,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50571] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 22,
			show_icon = 153,
			goal_id = 50571,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50572] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "别忘了技能的提升",
			desc = "进行1次战技重铸",
			day = 22,
			show_icon = 200,
			goal_id = 50572,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_artifact_recast",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50573] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 22,
			show_icon = 152,
			goal_id = 50573,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50574] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 22,
			show_icon = 429,
			goal_id = 50574,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50575] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 23,
			show_icon = 401,
			goal_id = 50575,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50576] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 23,
			show_icon = 131,
			goal_id = 50576,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50577] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 23,
			show_icon = 146,
			goal_id = 50577,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50578] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 23,
			show_icon = 158,
			goal_id = 50578,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50579] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每日都在变强",
			desc = "升级任意神技5次",
			day = 23,
			show_icon = 201,
			goal_id = 50579,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_hallows_step_intensify",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50580] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 23,
			show_icon = 152,
			goal_id = 50580,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50581] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 23,
			show_icon = 414,
			goal_id = 50581,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50582] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 24,
			show_icon = 401,
			goal_id = 50582,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50583] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 24,
			show_icon = 157,
			goal_id = 50583,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50584] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 24,
			show_icon = 138,
			goal_id = 50584,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50585] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "出现吧！命运的羁绊",
			desc = "先知英雄转换1次",
			day = 24,
			show_icon = 427,
			goal_id = 50585,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_recruit_convert",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50586] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 24,
			show_icon = 153,
			goal_id = 50586,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50587] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 24,
			show_icon = 152,
			goal_id = 50587,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50588] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 24,
			show_icon = 429,
			goal_id = 50588,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50589] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 25,
			show_icon = 401,
			goal_id = 50589,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50590] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 25,
			show_icon = 131,
			goal_id = 50590,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50591] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 25,
			show_icon = 158,
			goal_id = 50591,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50592] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 25,
			show_icon = 146,
			goal_id = 50592,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50593] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 25,
			show_icon = 153,
			goal_id = 50593,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50594] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 25,
			show_icon = 152,
			goal_id = 50594,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50595] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 25,
			show_icon = 414,
			goal_id = 50595,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50596] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 26,
			show_icon = 401,
			goal_id = 50596,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50597] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 26,
			show_icon = 157,
			goal_id = 50597,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50598] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 26,
			show_icon = 129,
			goal_id = 50598,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50599] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 26,
			show_icon = 153,
			goal_id = 50599,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50600] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 26,
			show_icon = 134,
			goal_id = 50600,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50601] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 26,
			show_icon = 152,
			goal_id = 50601,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50602] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 26,
			show_icon = 429,
			goal_id = 50602,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50603] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 27,
			show_icon = 401,
			goal_id = 50603,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50604] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 27,
			show_icon = 131,
			goal_id = 50604,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50605] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 27,
			show_icon = 146,
			goal_id = 50605,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50606] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 27,
			show_icon = 158,
			goal_id = 50606,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50607] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 27,
			show_icon = 134,
			goal_id = 50607,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50608] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 27,
			show_icon = 152,
			goal_id = 50608,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50609] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 27,
			show_icon = 414,
			goal_id = 50609,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50610] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 28,
			show_icon = 401,
			goal_id = 50610,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50611] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 28,
			show_icon = 157,
			goal_id = 50611,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50612] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我也是钻石爱好者哦",
			desc = "消耗500钻石",
			day = 28,
			show_icon = 138,
			goal_id = 50612,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_loss_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50613] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 28,
			show_icon = 129,
			goal_id = 50613,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50614] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 28,
			show_icon = 153,
			goal_id = 50614,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50615] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 28,
			show_icon = 152,
			goal_id = 50615,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50616] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 28,
			show_icon = 429,
			goal_id = 50616,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50617] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 29,
			show_icon = 401,
			goal_id = 50617,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50618] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "满满当当的库存",
			desc = "获取500钻石",
			day = 29,
			show_icon = 131,
			goal_id = 50618,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_gold",
					target = 0,
					target_val = 500,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50619] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "这就是强者的力量么",
			desc = "竞技场挑战胜利10次",
			day = 29,
			show_icon = 158,
			goal_id = 50619,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 10,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50620] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "我们的公会无人能挡",
			desc = "公会Boss挑战5次",
			day = 29,
			show_icon = 146,
			goal_id = 50620,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_dun_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50621] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 29,
			show_icon = 153,
			goal_id = 50621,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50622] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 89,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 29,
			show_icon = 152,
			goal_id = 50622,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50623] = {
			quest_type = 7,
			min_lev = 90,
			max_lev = 200,
			title = "信念之力，信念之灵！",
			desc = "领地副本战斗胜利或扫荡8次",
			day = 29,
			show_icon = 414,
			goal_id = 50623,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_element_temple_win",
					target = 0,
					target_val = 8,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50624] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "今天也要元气满满！",
			desc = "登录冒险大陆一次",
			day = 30,
			show_icon = 401,
			goal_id = 50624,
			id = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_cli_loaded",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					20
				}
			}
		},
		[50625] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "哇...这耀眼的宝箱",
			desc = "领取3次挂机奖励",
			day = 30,
			show_icon = 157,
			goal_id = 50625,
			id = 2,
			period = 3,
			progress = {
				{
					cli_label = "evt_get_hook_count",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50626] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "冒险的脚步永不停止",
			desc = "累计获取100活跃",
			day = 30,
			show_icon = 129,
			goal_id = 50626,
			id = 3,
			period = 3,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 100,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50627] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "每一次试炼都会变强！",
			desc = "参与1次无尽试炼",
			day = 30,
			show_icon = 153,
			goal_id = 50627,
			id = 4,
			period = 3,
			progress = {
				{
					cli_label = "evt_endless_fight",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50628] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 200,
			title = "好日子！买买买！",
			desc = "酒吧柜台购买3次",
			day = 30,
			show_icon = 134,
			goal_id = 50628,
			id = 5,
			period = 3,
			progress = {
				{
					cli_label = "evt_mystery_mall_buy",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50629] = {
			quest_type = 7,
			min_lev = 1,
			max_lev = 119,
			title = "沉浸在副本的奖励中吧",
			desc = "参与5次日常副本",
			day = 30,
			show_icon = 152,
			goal_id = 50629,
			id = 6,
			period = 3,
			progress = {
				{
					cli_label = "evt_dungeon_stone_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		},
		[50630] = {
			quest_type = 7,
			min_lev = 120,
			max_lev = 200,
			title = "为了获取更强的力量",
			desc = "传奇挑战战斗胜利或扫荡2次",
			day = 30,
			show_icon = 429,
			goal_id = 50630,
			id = 7,
			period = 3,
			progress = {
				{
					cli_label = "evt_dun_heaven_win",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					50
				}
			}
		}
	}
}
Config.HolidayNewWarOrderData.data_week_task_list_length = 3
Config.HolidayNewWarOrderData.data_week_task_list = {
	{
		[5001] = {
			quest_type = 8,
			goal_id = 5001,
			max_day = 7,
			min_lev = 1,
			title = "大海赐予幸运之礼",
			desc = "进行30次幸运探宝",
			show_icon = 405,
			max_lev = 200,
			id = 1,
			min_day = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_dial",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5002] = {
			quest_type = 8,
			goal_id = 5002,
			max_day = 7,
			min_lev = 1,
			title = "探索未知的神秘",
			desc = "长环岛之境第三层通关2次",
			show_icon = 151,
			max_lev = 200,
			id = 2,
			min_day = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_planes_pass",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5003] = {
			quest_type = 8,
			goal_id = 5003,
			max_day = 7,
			min_lev = 1,
			title = "概率正在全力UP中",
			desc = "高级召唤30次",
			show_icon = 120,
			max_lev = 200,
			id = 3,
			min_day = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_recruit",
					target = 300,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5004] = {
			quest_type = 8,
			goal_id = 5004,
			max_day = 7,
			min_lev = 1,
			title = "扬帆远航去夺宝！",
			desc = "接受5次橙色远航",
			show_icon = 126,
			max_lev = 79,
			id = 4,
			min_day = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_shipping",
					target = 0,
					target_val = 5,
					param = {
						4
					}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5005] = {
			quest_type = 8,
			goal_id = 5005,
			max_day = 7,
			min_lev = 80,
			title = "出货吧！小幽灵！",
			desc = "成功培养30个灵墓",
			show_icon = 423,
			max_lev = 200,
			id = 5,
			min_day = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_sprite_hatch",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5006] = {
			quest_type = 8,
			goal_id = 5006,
			max_day = 7,
			min_lev = 1,
			title = "让世界感受我的欧气",
			desc = "伟大召唤3次",
			show_icon = 204,
			max_lev = 119,
			id = 6,
			min_day = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_recruit_high",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5007] = {
			quest_type = 8,
			goal_id = 5007,
			max_day = 7,
			min_lev = 120,
			title = "更强力的武器！",
			desc = "战船维修7次",
			show_icon = 425,
			max_lev = 200,
			id = 7,
			min_day = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_holy_eqm_lottery",
					target = 0,
					target_val = 7,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5008] = {
			quest_type = 8,
			goal_id = 5008,
			max_day = 7,
			min_lev = 1,
			title = "金牌预言家的实力",
			desc = "赢得3次冠军赛投注",
			show_icon = 159,
			max_lev = 54,
			id = 8,
			min_day = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_championships_bet_win",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5009] = {
			quest_type = 8,
			goal_id = 5009,
			max_day = 7,
			min_lev = 55,
			title = "前往巅峰，或在去的路上",
			desc = "周冠军赛竞猜6次",
			show_icon = 422,
			max_lev = 200,
			id = 9,
			min_day = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_cluster_champion_bet",
					target = 0,
					target_val = 6,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5010] = {
			quest_type = 8,
			goal_id = 5010,
			max_day = 7,
			min_lev = 1,
			title = "是什么在阻挡我前进",
			desc = "击败50个冒险守卫",
			show_icon = 407,
			max_lev = 99,
			id = 10,
			min_day = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_adventure_boss_fight_count",
					target = 0,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5011] = {
			quest_type = 8,
			goal_id = 5011,
			max_day = 7,
			min_lev = 100,
			title = "竞技，荣誉，王者姿态",
			desc = "超凡段位赛挑战30次",
			show_icon = 428,
			max_lev = 200,
			id = 11,
			min_day = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_elite_combat_count",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5012] = {
			quest_type = 8,
			goal_id = 5012,
			max_day = 7,
			min_lev = 1,
			title = "尝一下我的实力吧",
			desc = "竞技场累积获胜50场",
			show_icon = 158,
			max_lev = 69,
			id = 12,
			min_day = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5013] = {
			quest_type = 8,
			goal_id = 5013,
			max_day = 7,
			min_lev = 70,
			title = "出击吧，赢取我们的荣耀！",
			desc = "参与组队竞技场挑战5次",
			show_icon = 430,
			max_lev = 200,
			id = 13,
			min_day = 1,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_team_join",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5014] = {
			quest_type = 8,
			goal_id = 5014,
			max_day = 15,
			min_lev = 1,
			title = "冒险的脚步永不停止",
			desc = "本周累计获取600活跃",
			show_icon = 129,
			max_lev = 200,
			id = 1,
			min_day = 8,
			period = 1,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 600,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5015] = {
			quest_type = 8,
			goal_id = 5015,
			max_day = 15,
			min_lev = 1,
			title = "英雄大满贯",
			desc = "获取7个5星英雄",
			show_icon = 120,
			max_lev = 200,
			id = 2,
			min_day = 8,
			period = 1,
			progress = {
				{
					cli_label = "evt_partner_add_new",
					target = 0,
					target_val = 7,
					param = {
						{
							"bind_star",
							5
						}
					}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5016] = {
			quest_type = 8,
			goal_id = 5016,
			max_day = 15,
			min_lev = 1,
			title = "为公会而战！",
			desc = "参与公会秘境挑战4次",
			show_icon = 424,
			max_lev = 200,
			id = 3,
			min_day = 8,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_secret_area_combat",
					target = 0,
					target_val = 4,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5017] = {
			quest_type = 8,
			goal_id = 5017,
			max_day = 15,
			min_lev = 1,
			title = "资源是要一点一点积累的",
			desc = "完成英雄副本30次",
			show_icon = 152,
			max_lev = 119,
			id = 4,
			min_day = 8,
			period = 1,
			progress = {
				{
					cli_label = "evt_partner_dungeon_stone_win",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5018] = {
			quest_type = 8,
			goal_id = 5018,
			max_day = 15,
			min_lev = 120,
			title = "成为更强大的存在吧！",
			desc = "神装洗练5次",
			show_icon = 425,
			max_lev = 200,
			id = 5,
			min_day = 8,
			period = 1,
			progress = {
				{
					cli_label = "evt_holy_eqm_ref",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5019] = {
			quest_type = 8,
			goal_id = 5019,
			max_day = 15,
			min_lev = 1,
			title = "让世界感受我的欧气",
			desc = "伟大召唤3次",
			show_icon = 204,
			max_lev = 119,
			id = 6,
			min_day = 8,
			period = 1,
			progress = {
				{
					cli_label = "evt_recruit_high",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5020] = {
			quest_type = 8,
			goal_id = 5020,
			max_day = 15,
			min_lev = 120,
			title = "更强力的武器！",
			desc = "战船维修7次",
			show_icon = 425,
			max_lev = 200,
			id = 7,
			min_day = 8,
			period = 1,
			progress = {
				{
					cli_label = "evt_holy_eqm_lottery",
					target = 0,
					target_val = 7,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5021] = {
			quest_type = 8,
			goal_id = 5021,
			max_day = 15,
			min_lev = 1,
			title = "金牌预言家的实力",
			desc = "赢得3次冠军赛投注",
			show_icon = 159,
			max_lev = 54,
			id = 8,
			min_day = 8,
			period = 1,
			progress = {
				{
					cli_label = "evt_championships_bet_win",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5022] = {
			quest_type = 8,
			goal_id = 5022,
			max_day = 15,
			min_lev = 55,
			title = "前往巅峰，或在去的路上",
			desc = "周冠军赛竞猜6次",
			show_icon = 422,
			max_lev = 200,
			id = 9,
			min_day = 8,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_cluster_champion_bet",
					target = 0,
					target_val = 6,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5023] = {
			quest_type = 8,
			goal_id = 5023,
			max_day = 15,
			min_lev = 1,
			title = "是什么在阻挡我前进",
			desc = "击败50个冒险守卫",
			show_icon = 407,
			max_lev = 99,
			id = 10,
			min_day = 8,
			period = 1,
			progress = {
				{
					cli_label = "evt_adventure_boss_fight_count",
					target = 0,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5024] = {
			quest_type = 8,
			goal_id = 5024,
			max_day = 15,
			min_lev = 100,
			title = "竞技，荣誉，王者姿态",
			desc = "超凡段位赛挑战30次",
			show_icon = 428,
			max_lev = 200,
			id = 11,
			min_day = 8,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_elite_combat_count",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5025] = {
			quest_type = 8,
			goal_id = 5025,
			max_day = 15,
			min_lev = 1,
			title = "尝一下我的实力吧",
			desc = "竞技场累积获胜50场",
			show_icon = 158,
			max_lev = 69,
			id = 12,
			min_day = 8,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5026] = {
			quest_type = 8,
			goal_id = 5026,
			max_day = 15,
			min_lev = 70,
			title = "出击吧，赢取我们的荣耀！",
			desc = "参与组队竞技场挑战5次",
			show_icon = 430,
			max_lev = 200,
			id = 13,
			min_day = 8,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_team_join",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5027] = {
			quest_type = 8,
			goal_id = 5027,
			max_day = 22,
			min_lev = 1,
			title = "大海赐予幸运之礼",
			desc = "进行30次幸运探宝",
			show_icon = 405,
			max_lev = 200,
			id = 1,
			min_day = 16,
			period = 1,
			progress = {
				{
					cli_label = "evt_dial",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5028] = {
			quest_type = 8,
			goal_id = 5028,
			max_day = 22,
			min_lev = 1,
			title = "探索未知的神秘",
			desc = "长环岛之境第三层通关2次",
			show_icon = 151,
			max_lev = 200,
			id = 2,
			min_day = 16,
			period = 1,
			progress = {
				{
					cli_label = "evt_planes_pass",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5029] = {
			quest_type = 8,
			goal_id = 5029,
			max_day = 22,
			min_lev = 1,
			title = "概率正在全力UP中",
			desc = "高级召唤30次",
			show_icon = 120,
			max_lev = 200,
			id = 3,
			min_day = 16,
			period = 1,
			progress = {
				{
					cli_label = "evt_recruit",
					target = 300,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5030] = {
			quest_type = 8,
			goal_id = 5030,
			max_day = 22,
			min_lev = 1,
			title = "扬帆远航去夺宝！",
			desc = "接受5次橙色远航",
			show_icon = 126,
			max_lev = 79,
			id = 4,
			min_day = 16,
			period = 1,
			progress = {
				{
					cli_label = "evt_shipping",
					target = 0,
					target_val = 5,
					param = {
						4
					}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5031] = {
			quest_type = 8,
			goal_id = 5031,
			max_day = 22,
			min_lev = 80,
			title = "出货吧！小幽灵！",
			desc = "成功培养30个灵墓",
			show_icon = 423,
			max_lev = 200,
			id = 5,
			min_day = 16,
			period = 1,
			progress = {
				{
					cli_label = "evt_sprite_hatch",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5032] = {
			quest_type = 8,
			goal_id = 5032,
			max_day = 22,
			min_lev = 1,
			title = "让世界感受我的欧气",
			desc = "伟大召唤3次",
			show_icon = 204,
			max_lev = 119,
			id = 6,
			min_day = 16,
			period = 1,
			progress = {
				{
					cli_label = "evt_recruit_high",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5033] = {
			quest_type = 8,
			goal_id = 5033,
			max_day = 22,
			min_lev = 120,
			title = "更强力的武器！",
			desc = "战船维修7次",
			show_icon = 425,
			max_lev = 200,
			id = 7,
			min_day = 16,
			period = 1,
			progress = {
				{
					cli_label = "evt_holy_eqm_lottery",
					target = 0,
					target_val = 7,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5034] = {
			quest_type = 8,
			goal_id = 5034,
			max_day = 22,
			min_lev = 1,
			title = "金牌预言家的实力",
			desc = "赢得3次冠军赛投注",
			show_icon = 159,
			max_lev = 54,
			id = 8,
			min_day = 16,
			period = 1,
			progress = {
				{
					cli_label = "evt_championships_bet_win",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5035] = {
			quest_type = 8,
			goal_id = 5035,
			max_day = 22,
			min_lev = 55,
			title = "前往巅峰，或在去的路上",
			desc = "周冠军赛竞猜6次",
			show_icon = 422,
			max_lev = 200,
			id = 9,
			min_day = 16,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_cluster_champion_bet",
					target = 0,
					target_val = 6,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5036] = {
			quest_type = 8,
			goal_id = 5036,
			max_day = 22,
			min_lev = 1,
			title = "是什么在阻挡我前进",
			desc = "击败50个冒险守卫",
			show_icon = 407,
			max_lev = 99,
			id = 10,
			min_day = 16,
			period = 1,
			progress = {
				{
					cli_label = "evt_adventure_boss_fight_count",
					target = 0,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5037] = {
			quest_type = 8,
			goal_id = 5037,
			max_day = 22,
			min_lev = 100,
			title = "竞技，荣誉，王者姿态",
			desc = "超凡段位赛挑战30次",
			show_icon = 428,
			max_lev = 200,
			id = 11,
			min_day = 16,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_elite_combat_count",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5038] = {
			quest_type = 8,
			goal_id = 5038,
			max_day = 22,
			min_lev = 1,
			title = "尝一下我的实力吧",
			desc = "竞技场累积获胜50场",
			show_icon = 158,
			max_lev = 69,
			id = 12,
			min_day = 16,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5039] = {
			quest_type = 8,
			goal_id = 5039,
			max_day = 22,
			min_lev = 70,
			title = "出击吧，赢取我们的荣耀！",
			desc = "参与组队竞技场挑战5次",
			show_icon = 430,
			max_lev = 200,
			id = 13,
			min_day = 16,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_team_join",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5040] = {
			quest_type = 8,
			goal_id = 5040,
			max_day = 30,
			min_lev = 1,
			title = "冒险的脚步永不停止",
			desc = "本周累计获取600活跃",
			show_icon = 129,
			max_lev = 200,
			id = 1,
			min_day = 23,
			period = 1,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 600,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5041] = {
			quest_type = 8,
			goal_id = 5041,
			max_day = 30,
			min_lev = 1,
			title = "又上了一个新的台阶！",
			desc = "合成2个6星英雄",
			show_icon = 155,
			max_lev = 200,
			id = 2,
			min_day = 23,
			period = 1,
			progress = {
				{
					cli_label = "evt_partner_add_new",
					target = 0,
					target_val = 2,
					param = {
						{
							"bind_star",
							6
						}
					}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5042] = {
			quest_type = 8,
			goal_id = 5042,
			max_day = 30,
			min_lev = 1,
			title = "为公会而战！",
			desc = "参与公会秘境挑战4次",
			show_icon = 424,
			max_lev = 200,
			id = 3,
			min_day = 23,
			period = 1,
			progress = {
				{
					cli_label = "evt_guild_secret_area_combat",
					target = 0,
					target_val = 4,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5043] = {
			quest_type = 8,
			goal_id = 5043,
			max_day = 30,
			min_lev = 1,
			title = "资源是要一点一点积累的",
			desc = "完成英雄副本30次",
			show_icon = 152,
			max_lev = 119,
			id = 4,
			min_day = 23,
			period = 1,
			progress = {
				{
					cli_label = "evt_partner_dungeon_stone_win",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5044] = {
			quest_type = 8,
			goal_id = 5044,
			max_day = 30,
			min_lev = 120,
			title = "成为更强大的存在吧！",
			desc = "神装洗练5次",
			show_icon = 425,
			max_lev = 200,
			id = 5,
			min_day = 23,
			period = 1,
			progress = {
				{
					cli_label = "evt_holy_eqm_ref",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5045] = {
			quest_type = 8,
			goal_id = 5045,
			max_day = 30,
			min_lev = 1,
			title = "让世界感受我的欧气",
			desc = "伟大召唤3次",
			show_icon = 204,
			max_lev = 119,
			id = 6,
			min_day = 23,
			period = 1,
			progress = {
				{
					cli_label = "evt_recruit_high",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5046] = {
			quest_type = 8,
			goal_id = 5046,
			max_day = 30,
			min_lev = 120,
			title = "更强力的武器！",
			desc = "战船维修7次",
			show_icon = 425,
			max_lev = 200,
			id = 7,
			min_day = 23,
			period = 1,
			progress = {
				{
					cli_label = "evt_holy_eqm_lottery",
					target = 0,
					target_val = 7,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5047] = {
			quest_type = 8,
			goal_id = 5047,
			max_day = 30,
			min_lev = 1,
			title = "金牌预言家的实力",
			desc = "赢得3次冠军赛投注",
			show_icon = 159,
			max_lev = 54,
			id = 8,
			min_day = 23,
			period = 1,
			progress = {
				{
					cli_label = "evt_championships_bet_win",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5048] = {
			quest_type = 8,
			goal_id = 5048,
			max_day = 30,
			min_lev = 55,
			title = "前往巅峰，或在去的路上",
			desc = "周冠军赛竞猜6次",
			show_icon = 422,
			max_lev = 200,
			id = 9,
			min_day = 23,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_cluster_champion_bet",
					target = 0,
					target_val = 6,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5049] = {
			quest_type = 8,
			goal_id = 5049,
			max_day = 30,
			min_lev = 1,
			title = "是什么在阻挡我前进",
			desc = "击败50个冒险守卫",
			show_icon = 407,
			max_lev = 99,
			id = 10,
			min_day = 23,
			period = 1,
			progress = {
				{
					cli_label = "evt_adventure_boss_fight_count",
					target = 0,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5050] = {
			quest_type = 8,
			goal_id = 5050,
			max_day = 30,
			min_lev = 100,
			title = "竞技，荣誉，王者姿态",
			desc = "超凡段位赛挑战30次",
			show_icon = 428,
			max_lev = 200,
			id = 11,
			min_day = 23,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_elite_combat_count",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5051] = {
			quest_type = 8,
			goal_id = 5051,
			max_day = 30,
			min_lev = 1,
			title = "尝一下我的实力吧",
			desc = "竞技场累积获胜50场",
			show_icon = 158,
			max_lev = 69,
			id = 12,
			min_day = 23,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5052] = {
			quest_type = 8,
			goal_id = 5052,
			max_day = 30,
			min_lev = 70,
			title = "出击吧，赢取我们的荣耀！",
			desc = "参与组队竞技场挑战5次",
			show_icon = 430,
			max_lev = 200,
			id = 13,
			min_day = 23,
			period = 1,
			progress = {
				{
					cli_label = "evt_arena_team_join",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		}
	},
	{
		[5053] = {
			quest_type = 8,
			goal_id = 5053,
			max_day = 7,
			min_lev = 1,
			title = "大海赐予幸运之礼",
			desc = "进行30次幸运探宝",
			show_icon = 405,
			max_lev = 200,
			id = 1,
			min_day = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_dial",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5054] = {
			quest_type = 8,
			goal_id = 5054,
			max_day = 7,
			min_lev = 1,
			title = "探索未知的神秘",
			desc = "长环岛之境第三层通关2次",
			show_icon = 151,
			max_lev = 200,
			id = 2,
			min_day = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_planes_pass",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5055] = {
			quest_type = 8,
			goal_id = 5055,
			max_day = 7,
			min_lev = 1,
			title = "概率正在全力UP中",
			desc = "高级召唤30次",
			show_icon = 120,
			max_lev = 200,
			id = 3,
			min_day = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_recruit",
					target = 300,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5056] = {
			quest_type = 8,
			goal_id = 5056,
			max_day = 7,
			min_lev = 1,
			title = "扬帆远航去夺宝！",
			desc = "接受5次橙色远航",
			show_icon = 126,
			max_lev = 79,
			id = 4,
			min_day = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_shipping",
					target = 0,
					target_val = 5,
					param = {
						4
					}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5057] = {
			quest_type = 8,
			goal_id = 5057,
			max_day = 7,
			min_lev = 80,
			title = "出货吧！小幽灵！",
			desc = "成功培养30个灵墓",
			show_icon = 423,
			max_lev = 200,
			id = 5,
			min_day = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_sprite_hatch",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5058] = {
			quest_type = 8,
			goal_id = 5058,
			max_day = 7,
			min_lev = 1,
			title = "让世界感受我的欧气",
			desc = "伟大召唤3次",
			show_icon = 204,
			max_lev = 119,
			id = 6,
			min_day = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_recruit_high",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5059] = {
			quest_type = 8,
			goal_id = 5059,
			max_day = 7,
			min_lev = 120,
			title = "更强力的武器！",
			desc = "战船维修7次",
			show_icon = 425,
			max_lev = 200,
			id = 7,
			min_day = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_holy_eqm_lottery",
					target = 0,
					target_val = 7,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5060] = {
			quest_type = 8,
			goal_id = 5060,
			max_day = 7,
			min_lev = 1,
			title = "金牌预言家的实力",
			desc = "赢得3次冠军赛投注",
			show_icon = 159,
			max_lev = 54,
			id = 8,
			min_day = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_championships_bet_win",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5061] = {
			quest_type = 8,
			goal_id = 5061,
			max_day = 7,
			min_lev = 55,
			title = "前往巅峰，或在去的路上",
			desc = "周冠军赛竞猜6次",
			show_icon = 422,
			max_lev = 200,
			id = 9,
			min_day = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_cluster_champion_bet",
					target = 0,
					target_val = 6,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5062] = {
			quest_type = 8,
			goal_id = 5062,
			max_day = 7,
			min_lev = 1,
			title = "是什么在阻挡我前进",
			desc = "击败50个冒险守卫",
			show_icon = 407,
			max_lev = 99,
			id = 10,
			min_day = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_adventure_boss_fight_count",
					target = 0,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5063] = {
			quest_type = 8,
			goal_id = 5063,
			max_day = 7,
			min_lev = 100,
			title = "竞技，荣誉，王者姿态",
			desc = "超凡段位赛挑战30次",
			show_icon = 428,
			max_lev = 200,
			id = 11,
			min_day = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_elite_combat_count",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5064] = {
			quest_type = 8,
			goal_id = 5064,
			max_day = 7,
			min_lev = 1,
			title = "尝一下我的实力吧",
			desc = "竞技场累积获胜50场",
			show_icon = 158,
			max_lev = 69,
			id = 12,
			min_day = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5065] = {
			quest_type = 8,
			goal_id = 5065,
			max_day = 7,
			min_lev = 70,
			title = "出击吧，赢取我们的荣耀！",
			desc = "参与组队竞技场挑战5次",
			show_icon = 430,
			max_lev = 200,
			id = 13,
			min_day = 1,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_team_join",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5066] = {
			quest_type = 8,
			goal_id = 5066,
			max_day = 15,
			min_lev = 1,
			title = "冒险的脚步永不停止",
			desc = "本周累计获取600活跃",
			show_icon = 129,
			max_lev = 200,
			id = 1,
			min_day = 8,
			period = 2,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 600,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5067] = {
			quest_type = 8,
			goal_id = 5067,
			max_day = 15,
			min_lev = 1,
			title = "英雄大满贯",
			desc = "获取7个5星英雄",
			show_icon = 120,
			max_lev = 200,
			id = 2,
			min_day = 8,
			period = 2,
			progress = {
				{
					cli_label = "evt_partner_add_new",
					target = 0,
					target_val = 7,
					param = {
						{
							"bind_star",
							5
						}
					}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5068] = {
			quest_type = 8,
			goal_id = 5068,
			max_day = 15,
			min_lev = 1,
			title = "为公会而战！",
			desc = "参与公会秘境挑战4次",
			show_icon = 424,
			max_lev = 200,
			id = 3,
			min_day = 8,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_secret_area_combat",
					target = 0,
					target_val = 4,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5069] = {
			quest_type = 8,
			goal_id = 5069,
			max_day = 15,
			min_lev = 1,
			title = "资源是要一点一点积累的",
			desc = "完成英雄副本30次",
			show_icon = 152,
			max_lev = 119,
			id = 4,
			min_day = 8,
			period = 2,
			progress = {
				{
					cli_label = "evt_partner_dungeon_stone_win",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5070] = {
			quest_type = 8,
			goal_id = 5070,
			max_day = 15,
			min_lev = 120,
			title = "成为更强大的存在吧！",
			desc = "神装洗练5次",
			show_icon = 425,
			max_lev = 200,
			id = 5,
			min_day = 8,
			period = 2,
			progress = {
				{
					cli_label = "evt_holy_eqm_ref",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5071] = {
			quest_type = 8,
			goal_id = 5071,
			max_day = 15,
			min_lev = 1,
			title = "让世界感受我的欧气",
			desc = "伟大召唤3次",
			show_icon = 204,
			max_lev = 119,
			id = 6,
			min_day = 8,
			period = 2,
			progress = {
				{
					cli_label = "evt_recruit_high",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5072] = {
			quest_type = 8,
			goal_id = 5072,
			max_day = 15,
			min_lev = 120,
			title = "更强力的武器！",
			desc = "战船维修7次",
			show_icon = 425,
			max_lev = 200,
			id = 7,
			min_day = 8,
			period = 2,
			progress = {
				{
					cli_label = "evt_holy_eqm_lottery",
					target = 0,
					target_val = 7,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5073] = {
			quest_type = 8,
			goal_id = 5073,
			max_day = 15,
			min_lev = 1,
			title = "金牌预言家的实力",
			desc = "赢得3次冠军赛投注",
			show_icon = 159,
			max_lev = 54,
			id = 8,
			min_day = 8,
			period = 2,
			progress = {
				{
					cli_label = "evt_championships_bet_win",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5074] = {
			quest_type = 8,
			goal_id = 5074,
			max_day = 15,
			min_lev = 55,
			title = "前往巅峰，或在去的路上",
			desc = "周冠军赛竞猜6次",
			show_icon = 422,
			max_lev = 200,
			id = 9,
			min_day = 8,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_cluster_champion_bet",
					target = 0,
					target_val = 6,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5075] = {
			quest_type = 8,
			goal_id = 5075,
			max_day = 15,
			min_lev = 1,
			title = "是什么在阻挡我前进",
			desc = "击败50个冒险守卫",
			show_icon = 407,
			max_lev = 99,
			id = 10,
			min_day = 8,
			period = 2,
			progress = {
				{
					cli_label = "evt_adventure_boss_fight_count",
					target = 0,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5076] = {
			quest_type = 8,
			goal_id = 5076,
			max_day = 15,
			min_lev = 100,
			title = "竞技，荣誉，王者姿态",
			desc = "超凡段位赛挑战30次",
			show_icon = 428,
			max_lev = 200,
			id = 11,
			min_day = 8,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_elite_combat_count",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5077] = {
			quest_type = 8,
			goal_id = 5077,
			max_day = 15,
			min_lev = 1,
			title = "尝一下我的实力吧",
			desc = "竞技场累积获胜50场",
			show_icon = 158,
			max_lev = 69,
			id = 12,
			min_day = 8,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5078] = {
			quest_type = 8,
			goal_id = 5078,
			max_day = 15,
			min_lev = 70,
			title = "出击吧，赢取我们的荣耀！",
			desc = "参与组队竞技场挑战5次",
			show_icon = 430,
			max_lev = 200,
			id = 13,
			min_day = 8,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_team_join",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5079] = {
			quest_type = 8,
			goal_id = 5079,
			max_day = 22,
			min_lev = 1,
			title = "大海赐予幸运之礼",
			desc = "进行30次幸运探宝",
			show_icon = 405,
			max_lev = 200,
			id = 1,
			min_day = 16,
			period = 2,
			progress = {
				{
					cli_label = "evt_dial",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5080] = {
			quest_type = 8,
			goal_id = 5080,
			max_day = 22,
			min_lev = 1,
			title = "探索未知的神秘",
			desc = "长环岛之境第三层通关2次",
			show_icon = 151,
			max_lev = 200,
			id = 2,
			min_day = 16,
			period = 2,
			progress = {
				{
					cli_label = "evt_planes_pass",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5081] = {
			quest_type = 8,
			goal_id = 5081,
			max_day = 22,
			min_lev = 1,
			title = "概率正在全力UP中",
			desc = "高级召唤30次",
			show_icon = 120,
			max_lev = 200,
			id = 3,
			min_day = 16,
			period = 2,
			progress = {
				{
					cli_label = "evt_recruit",
					target = 300,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5082] = {
			quest_type = 8,
			goal_id = 5082,
			max_day = 22,
			min_lev = 1,
			title = "扬帆远航去夺宝！",
			desc = "接受5次橙色远航",
			show_icon = 126,
			max_lev = 79,
			id = 4,
			min_day = 16,
			period = 2,
			progress = {
				{
					cli_label = "evt_shipping",
					target = 0,
					target_val = 5,
					param = {
						4
					}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5083] = {
			quest_type = 8,
			goal_id = 5083,
			max_day = 22,
			min_lev = 80,
			title = "出货吧！小幽灵！",
			desc = "成功培养30个灵墓",
			show_icon = 423,
			max_lev = 200,
			id = 5,
			min_day = 16,
			period = 2,
			progress = {
				{
					cli_label = "evt_sprite_hatch",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5084] = {
			quest_type = 8,
			goal_id = 5084,
			max_day = 22,
			min_lev = 1,
			title = "让世界感受我的欧气",
			desc = "伟大召唤3次",
			show_icon = 204,
			max_lev = 119,
			id = 6,
			min_day = 16,
			period = 2,
			progress = {
				{
					cli_label = "evt_recruit_high",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5085] = {
			quest_type = 8,
			goal_id = 5085,
			max_day = 22,
			min_lev = 120,
			title = "更强力的武器！",
			desc = "战船维修7次",
			show_icon = 425,
			max_lev = 200,
			id = 7,
			min_day = 16,
			period = 2,
			progress = {
				{
					cli_label = "evt_holy_eqm_lottery",
					target = 0,
					target_val = 7,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5086] = {
			quest_type = 8,
			goal_id = 5086,
			max_day = 22,
			min_lev = 1,
			title = "金牌预言家的实力",
			desc = "赢得3次冠军赛投注",
			show_icon = 159,
			max_lev = 54,
			id = 8,
			min_day = 16,
			period = 2,
			progress = {
				{
					cli_label = "evt_championships_bet_win",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5087] = {
			quest_type = 8,
			goal_id = 5087,
			max_day = 22,
			min_lev = 55,
			title = "前往巅峰，或在去的路上",
			desc = "周冠军赛竞猜6次",
			show_icon = 422,
			max_lev = 200,
			id = 9,
			min_day = 16,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_cluster_champion_bet",
					target = 0,
					target_val = 6,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5088] = {
			quest_type = 8,
			goal_id = 5088,
			max_day = 22,
			min_lev = 1,
			title = "是什么在阻挡我前进",
			desc = "击败50个冒险守卫",
			show_icon = 407,
			max_lev = 99,
			id = 10,
			min_day = 16,
			period = 2,
			progress = {
				{
					cli_label = "evt_adventure_boss_fight_count",
					target = 0,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5089] = {
			quest_type = 8,
			goal_id = 5089,
			max_day = 22,
			min_lev = 100,
			title = "竞技，荣誉，王者姿态",
			desc = "超凡段位赛挑战30次",
			show_icon = 428,
			max_lev = 200,
			id = 11,
			min_day = 16,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_elite_combat_count",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5090] = {
			quest_type = 8,
			goal_id = 5090,
			max_day = 22,
			min_lev = 1,
			title = "尝一下我的实力吧",
			desc = "竞技场累积获胜50场",
			show_icon = 158,
			max_lev = 69,
			id = 12,
			min_day = 16,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5091] = {
			quest_type = 8,
			goal_id = 5091,
			max_day = 22,
			min_lev = 70,
			title = "出击吧，赢取我们的荣耀！",
			desc = "参与组队竞技场挑战5次",
			show_icon = 430,
			max_lev = 200,
			id = 13,
			min_day = 16,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_team_join",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5092] = {
			quest_type = 8,
			goal_id = 5092,
			max_day = 30,
			min_lev = 1,
			title = "冒险的脚步永不停止",
			desc = "本周累计获取600活跃",
			show_icon = 129,
			max_lev = 200,
			id = 1,
			min_day = 23,
			period = 2,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 600,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5093] = {
			quest_type = 8,
			goal_id = 5093,
			max_day = 30,
			min_lev = 1,
			title = "又上了一个新的台阶！",
			desc = "合成2个6星英雄",
			show_icon = 155,
			max_lev = 200,
			id = 2,
			min_day = 23,
			period = 2,
			progress = {
				{
					cli_label = "evt_partner_add_new",
					target = 0,
					target_val = 2,
					param = {
						{
							"bind_star",
							6
						}
					}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5094] = {
			quest_type = 8,
			goal_id = 5094,
			max_day = 30,
			min_lev = 1,
			title = "为公会而战！",
			desc = "参与公会秘境挑战4次",
			show_icon = 424,
			max_lev = 200,
			id = 3,
			min_day = 23,
			period = 2,
			progress = {
				{
					cli_label = "evt_guild_secret_area_combat",
					target = 0,
					target_val = 4,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5095] = {
			quest_type = 8,
			goal_id = 5095,
			max_day = 30,
			min_lev = 1,
			title = "资源是要一点一点积累的",
			desc = "完成英雄副本30次",
			show_icon = 152,
			max_lev = 119,
			id = 4,
			min_day = 23,
			period = 2,
			progress = {
				{
					cli_label = "evt_partner_dungeon_stone_win",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5096] = {
			quest_type = 8,
			goal_id = 5096,
			max_day = 30,
			min_lev = 120,
			title = "成为更强大的存在吧！",
			desc = "神装洗练5次",
			show_icon = 425,
			max_lev = 200,
			id = 5,
			min_day = 23,
			period = 2,
			progress = {
				{
					cli_label = "evt_holy_eqm_ref",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5097] = {
			quest_type = 8,
			goal_id = 5097,
			max_day = 30,
			min_lev = 1,
			title = "让世界感受我的欧气",
			desc = "伟大召唤3次",
			show_icon = 204,
			max_lev = 119,
			id = 6,
			min_day = 23,
			period = 2,
			progress = {
				{
					cli_label = "evt_recruit_high",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5098] = {
			quest_type = 8,
			goal_id = 5098,
			max_day = 30,
			min_lev = 120,
			title = "更强力的武器！",
			desc = "战船维修7次",
			show_icon = 425,
			max_lev = 200,
			id = 7,
			min_day = 23,
			period = 2,
			progress = {
				{
					cli_label = "evt_holy_eqm_lottery",
					target = 0,
					target_val = 7,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5099] = {
			quest_type = 8,
			goal_id = 5099,
			max_day = 30,
			min_lev = 1,
			title = "金牌预言家的实力",
			desc = "赢得3次冠军赛投注",
			show_icon = 159,
			max_lev = 54,
			id = 8,
			min_day = 23,
			period = 2,
			progress = {
				{
					cli_label = "evt_championships_bet_win",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5100] = {
			quest_type = 8,
			goal_id = 5100,
			max_day = 30,
			min_lev = 55,
			title = "前往巅峰，或在去的路上",
			desc = "周冠军赛竞猜6次",
			show_icon = 422,
			max_lev = 200,
			id = 9,
			min_day = 23,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_cluster_champion_bet",
					target = 0,
					target_val = 6,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5101] = {
			quest_type = 8,
			goal_id = 5101,
			max_day = 30,
			min_lev = 1,
			title = "是什么在阻挡我前进",
			desc = "击败50个冒险守卫",
			show_icon = 407,
			max_lev = 99,
			id = 10,
			min_day = 23,
			period = 2,
			progress = {
				{
					cli_label = "evt_adventure_boss_fight_count",
					target = 0,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5102] = {
			quest_type = 8,
			goal_id = 5102,
			max_day = 30,
			min_lev = 100,
			title = "竞技，荣誉，王者姿态",
			desc = "超凡段位赛挑战30次",
			show_icon = 428,
			max_lev = 200,
			id = 11,
			min_day = 23,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_elite_combat_count",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5103] = {
			quest_type = 8,
			goal_id = 5103,
			max_day = 30,
			min_lev = 1,
			title = "尝一下我的实力吧",
			desc = "竞技场累积获胜50场",
			show_icon = 158,
			max_lev = 69,
			id = 12,
			min_day = 23,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5104] = {
			quest_type = 8,
			goal_id = 5104,
			max_day = 30,
			min_lev = 70,
			title = "出击吧，赢取我们的荣耀！",
			desc = "参与组队竞技场挑战5次",
			show_icon = 430,
			max_lev = 200,
			id = 13,
			min_day = 23,
			period = 2,
			progress = {
				{
					cli_label = "evt_arena_team_join",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		}
	},
	{
		[5105] = {
			quest_type = 8,
			goal_id = 5105,
			max_day = 7,
			min_lev = 1,
			title = "大海赐予幸运之礼",
			desc = "进行30次幸运探宝",
			show_icon = 405,
			max_lev = 200,
			id = 1,
			min_day = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_dial",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5106] = {
			quest_type = 8,
			goal_id = 5106,
			max_day = 7,
			min_lev = 1,
			title = "探索未知的神秘",
			desc = "长环岛之境第三层通关2次",
			show_icon = 151,
			max_lev = 200,
			id = 2,
			min_day = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_planes_pass",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5107] = {
			quest_type = 8,
			goal_id = 5107,
			max_day = 7,
			min_lev = 1,
			title = "概率正在全力UP中",
			desc = "高级召唤30次",
			show_icon = 120,
			max_lev = 200,
			id = 3,
			min_day = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_recruit",
					target = 300,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5108] = {
			quest_type = 8,
			goal_id = 5108,
			max_day = 7,
			min_lev = 1,
			title = "扬帆远航去夺宝！",
			desc = "接受5次橙色远航",
			show_icon = 126,
			max_lev = 79,
			id = 4,
			min_day = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_shipping",
					target = 0,
					target_val = 5,
					param = {
						4
					}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5109] = {
			quest_type = 8,
			goal_id = 5109,
			max_day = 7,
			min_lev = 80,
			title = "出货吧！小幽灵！",
			desc = "成功培养30个灵墓",
			show_icon = 423,
			max_lev = 200,
			id = 5,
			min_day = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_sprite_hatch",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5110] = {
			quest_type = 8,
			goal_id = 5110,
			max_day = 7,
			min_lev = 1,
			title = "让世界感受我的欧气",
			desc = "伟大召唤3次",
			show_icon = 204,
			max_lev = 119,
			id = 6,
			min_day = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_recruit_high",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5111] = {
			quest_type = 8,
			goal_id = 5111,
			max_day = 7,
			min_lev = 120,
			title = "更强力的武器！",
			desc = "战船维修7次",
			show_icon = 425,
			max_lev = 200,
			id = 7,
			min_day = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_holy_eqm_lottery",
					target = 0,
					target_val = 7,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5112] = {
			quest_type = 8,
			goal_id = 5112,
			max_day = 7,
			min_lev = 1,
			title = "金牌预言家的实力",
			desc = "赢得3次冠军赛投注",
			show_icon = 159,
			max_lev = 54,
			id = 8,
			min_day = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_championships_bet_win",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5113] = {
			quest_type = 8,
			goal_id = 5113,
			max_day = 7,
			min_lev = 55,
			title = "前往巅峰，或在去的路上",
			desc = "周冠军赛竞猜6次",
			show_icon = 422,
			max_lev = 200,
			id = 9,
			min_day = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_cluster_champion_bet",
					target = 0,
					target_val = 6,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5114] = {
			quest_type = 8,
			goal_id = 5114,
			max_day = 7,
			min_lev = 1,
			title = "是什么在阻挡我前进",
			desc = "击败50个冒险守卫",
			show_icon = 407,
			max_lev = 99,
			id = 10,
			min_day = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_adventure_boss_fight_count",
					target = 0,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5115] = {
			quest_type = 8,
			goal_id = 5115,
			max_day = 7,
			min_lev = 100,
			title = "竞技，荣誉，王者姿态",
			desc = "超凡段位赛挑战30次",
			show_icon = 428,
			max_lev = 200,
			id = 11,
			min_day = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_elite_combat_count",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5116] = {
			quest_type = 8,
			goal_id = 5116,
			max_day = 7,
			min_lev = 1,
			title = "尝一下我的实力吧",
			desc = "竞技场累积获胜50场",
			show_icon = 158,
			max_lev = 69,
			id = 12,
			min_day = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5117] = {
			quest_type = 8,
			goal_id = 5117,
			max_day = 7,
			min_lev = 70,
			title = "出击吧，赢取我们的荣耀！",
			desc = "参与组队竞技场挑战5次",
			show_icon = 430,
			max_lev = 200,
			id = 13,
			min_day = 1,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_team_join",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5118] = {
			quest_type = 8,
			goal_id = 5118,
			max_day = 15,
			min_lev = 1,
			title = "冒险的脚步永不停止",
			desc = "本周累计获取600活跃",
			show_icon = 129,
			max_lev = 200,
			id = 1,
			min_day = 8,
			period = 3,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 600,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5119] = {
			quest_type = 8,
			goal_id = 5119,
			max_day = 15,
			min_lev = 1,
			title = "英雄大满贯",
			desc = "获取7个5星英雄",
			show_icon = 120,
			max_lev = 200,
			id = 2,
			min_day = 8,
			period = 3,
			progress = {
				{
					cli_label = "evt_partner_add_new",
					target = 0,
					target_val = 7,
					param = {
						{
							"bind_star",
							5
						}
					}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5120] = {
			quest_type = 8,
			goal_id = 5120,
			max_day = 15,
			min_lev = 1,
			title = "为公会而战！",
			desc = "参与公会秘境挑战4次",
			show_icon = 424,
			max_lev = 200,
			id = 3,
			min_day = 8,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_secret_area_combat",
					target = 0,
					target_val = 4,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5121] = {
			quest_type = 8,
			goal_id = 5121,
			max_day = 15,
			min_lev = 1,
			title = "资源是要一点一点积累的",
			desc = "完成英雄副本30次",
			show_icon = 152,
			max_lev = 119,
			id = 4,
			min_day = 8,
			period = 3,
			progress = {
				{
					cli_label = "evt_partner_dungeon_stone_win",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5122] = {
			quest_type = 8,
			goal_id = 5122,
			max_day = 15,
			min_lev = 120,
			title = "成为更强大的存在吧！",
			desc = "神装洗练5次",
			show_icon = 425,
			max_lev = 200,
			id = 5,
			min_day = 8,
			period = 3,
			progress = {
				{
					cli_label = "evt_holy_eqm_ref",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5123] = {
			quest_type = 8,
			goal_id = 5123,
			max_day = 15,
			min_lev = 1,
			title = "让世界感受我的欧气",
			desc = "伟大召唤3次",
			show_icon = 204,
			max_lev = 119,
			id = 6,
			min_day = 8,
			period = 3,
			progress = {
				{
					cli_label = "evt_recruit_high",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5124] = {
			quest_type = 8,
			goal_id = 5124,
			max_day = 15,
			min_lev = 120,
			title = "更强力的武器！",
			desc = "战船维修7次",
			show_icon = 425,
			max_lev = 200,
			id = 7,
			min_day = 8,
			period = 3,
			progress = {
				{
					cli_label = "evt_holy_eqm_lottery",
					target = 0,
					target_val = 7,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5125] = {
			quest_type = 8,
			goal_id = 5125,
			max_day = 15,
			min_lev = 1,
			title = "金牌预言家的实力",
			desc = "赢得3次冠军赛投注",
			show_icon = 159,
			max_lev = 54,
			id = 8,
			min_day = 8,
			period = 3,
			progress = {
				{
					cli_label = "evt_championships_bet_win",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5126] = {
			quest_type = 8,
			goal_id = 5126,
			max_day = 15,
			min_lev = 55,
			title = "前往巅峰，或在去的路上",
			desc = "周冠军赛竞猜6次",
			show_icon = 422,
			max_lev = 200,
			id = 9,
			min_day = 8,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_cluster_champion_bet",
					target = 0,
					target_val = 6,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5127] = {
			quest_type = 8,
			goal_id = 5127,
			max_day = 15,
			min_lev = 1,
			title = "是什么在阻挡我前进",
			desc = "击败50个冒险守卫",
			show_icon = 407,
			max_lev = 99,
			id = 10,
			min_day = 8,
			period = 3,
			progress = {
				{
					cli_label = "evt_adventure_boss_fight_count",
					target = 0,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5128] = {
			quest_type = 8,
			goal_id = 5128,
			max_day = 15,
			min_lev = 100,
			title = "竞技，荣誉，王者姿态",
			desc = "超凡段位赛挑战30次",
			show_icon = 428,
			max_lev = 200,
			id = 11,
			min_day = 8,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_elite_combat_count",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5129] = {
			quest_type = 8,
			goal_id = 5129,
			max_day = 15,
			min_lev = 1,
			title = "尝一下我的实力吧",
			desc = "竞技场累积获胜50场",
			show_icon = 158,
			max_lev = 69,
			id = 12,
			min_day = 8,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5130] = {
			quest_type = 8,
			goal_id = 5130,
			max_day = 15,
			min_lev = 70,
			title = "出击吧，赢取我们的荣耀！",
			desc = "参与组队竞技场挑战5次",
			show_icon = 430,
			max_lev = 200,
			id = 13,
			min_day = 8,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_team_join",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5131] = {
			quest_type = 8,
			goal_id = 5131,
			max_day = 22,
			min_lev = 1,
			title = "大海赐予幸运之礼",
			desc = "进行30次幸运探宝",
			show_icon = 405,
			max_lev = 200,
			id = 1,
			min_day = 16,
			period = 3,
			progress = {
				{
					cli_label = "evt_dial",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5132] = {
			quest_type = 8,
			goal_id = 5132,
			max_day = 22,
			min_lev = 1,
			title = "探索未知的神秘",
			desc = "长环岛之境第三层通关2次",
			show_icon = 151,
			max_lev = 200,
			id = 2,
			min_day = 16,
			period = 3,
			progress = {
				{
					cli_label = "evt_planes_pass",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5133] = {
			quest_type = 8,
			goal_id = 5133,
			max_day = 22,
			min_lev = 1,
			title = "概率正在全力UP中",
			desc = "高级召唤30次",
			show_icon = 120,
			max_lev = 200,
			id = 3,
			min_day = 16,
			period = 3,
			progress = {
				{
					cli_label = "evt_recruit",
					target = 300,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5134] = {
			quest_type = 8,
			goal_id = 5134,
			max_day = 22,
			min_lev = 1,
			title = "扬帆远航去夺宝！",
			desc = "接受5次橙色远航",
			show_icon = 126,
			max_lev = 79,
			id = 4,
			min_day = 16,
			period = 3,
			progress = {
				{
					cli_label = "evt_shipping",
					target = 0,
					target_val = 5,
					param = {
						4
					}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5135] = {
			quest_type = 8,
			goal_id = 5135,
			max_day = 22,
			min_lev = 80,
			title = "出货吧！小幽灵！",
			desc = "成功培养30个灵墓",
			show_icon = 423,
			max_lev = 200,
			id = 5,
			min_day = 16,
			period = 3,
			progress = {
				{
					cli_label = "evt_sprite_hatch",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5136] = {
			quest_type = 8,
			goal_id = 5136,
			max_day = 22,
			min_lev = 1,
			title = "让世界感受我的欧气",
			desc = "伟大召唤3次",
			show_icon = 204,
			max_lev = 119,
			id = 6,
			min_day = 16,
			period = 3,
			progress = {
				{
					cli_label = "evt_recruit_high",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5137] = {
			quest_type = 8,
			goal_id = 5137,
			max_day = 22,
			min_lev = 120,
			title = "更强力的武器！",
			desc = "战船维修7次",
			show_icon = 425,
			max_lev = 200,
			id = 7,
			min_day = 16,
			period = 3,
			progress = {
				{
					cli_label = "evt_holy_eqm_lottery",
					target = 0,
					target_val = 7,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5138] = {
			quest_type = 8,
			goal_id = 5138,
			max_day = 22,
			min_lev = 1,
			title = "金牌预言家的实力",
			desc = "赢得3次冠军赛投注",
			show_icon = 159,
			max_lev = 54,
			id = 8,
			min_day = 16,
			period = 3,
			progress = {
				{
					cli_label = "evt_championships_bet_win",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5139] = {
			quest_type = 8,
			goal_id = 5139,
			max_day = 22,
			min_lev = 55,
			title = "前往巅峰，或在去的路上",
			desc = "周冠军赛竞猜6次",
			show_icon = 422,
			max_lev = 200,
			id = 9,
			min_day = 16,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_cluster_champion_bet",
					target = 0,
					target_val = 6,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5140] = {
			quest_type = 8,
			goal_id = 5140,
			max_day = 22,
			min_lev = 1,
			title = "是什么在阻挡我前进",
			desc = "击败50个冒险守卫",
			show_icon = 407,
			max_lev = 99,
			id = 10,
			min_day = 16,
			period = 3,
			progress = {
				{
					cli_label = "evt_adventure_boss_fight_count",
					target = 0,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5141] = {
			quest_type = 8,
			goal_id = 5141,
			max_day = 22,
			min_lev = 100,
			title = "竞技，荣誉，王者姿态",
			desc = "超凡段位赛挑战30次",
			show_icon = 428,
			max_lev = 200,
			id = 11,
			min_day = 16,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_elite_combat_count",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5142] = {
			quest_type = 8,
			goal_id = 5142,
			max_day = 22,
			min_lev = 1,
			title = "尝一下我的实力吧",
			desc = "竞技场累积获胜50场",
			show_icon = 158,
			max_lev = 69,
			id = 12,
			min_day = 16,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5143] = {
			quest_type = 8,
			goal_id = 5143,
			max_day = 22,
			min_lev = 70,
			title = "出击吧，赢取我们的荣耀！",
			desc = "参与组队竞技场挑战5次",
			show_icon = 430,
			max_lev = 200,
			id = 13,
			min_day = 16,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_team_join",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5144] = {
			quest_type = 8,
			goal_id = 5144,
			max_day = 30,
			min_lev = 1,
			title = "冒险的脚步永不停止",
			desc = "本周累计获取600活跃",
			show_icon = 129,
			max_lev = 200,
			id = 1,
			min_day = 23,
			period = 3,
			progress = {
				{
					cli_label = "evt_gain_activity",
					target = 0,
					target_val = 600,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5145] = {
			quest_type = 8,
			goal_id = 5145,
			max_day = 30,
			min_lev = 1,
			title = "又上了一个新的台阶！",
			desc = "合成2个6星英雄",
			show_icon = 155,
			max_lev = 200,
			id = 2,
			min_day = 23,
			period = 3,
			progress = {
				{
					cli_label = "evt_partner_add_new",
					target = 0,
					target_val = 2,
					param = {
						{
							"bind_star",
							6
						}
					}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5146] = {
			quest_type = 8,
			goal_id = 5146,
			max_day = 30,
			min_lev = 1,
			title = "为公会而战！",
			desc = "参与公会秘境挑战4次",
			show_icon = 424,
			max_lev = 200,
			id = 3,
			min_day = 23,
			period = 3,
			progress = {
				{
					cli_label = "evt_guild_secret_area_combat",
					target = 0,
					target_val = 4,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5147] = {
			quest_type = 8,
			goal_id = 5147,
			max_day = 30,
			min_lev = 1,
			title = "资源是要一点一点积累的",
			desc = "完成英雄副本30次",
			show_icon = 152,
			max_lev = 119,
			id = 4,
			min_day = 23,
			period = 3,
			progress = {
				{
					cli_label = "evt_partner_dungeon_stone_win",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5148] = {
			quest_type = 8,
			goal_id = 5148,
			max_day = 30,
			min_lev = 120,
			title = "成为更强大的存在吧！",
			desc = "神装洗练5次",
			show_icon = 425,
			max_lev = 200,
			id = 5,
			min_day = 23,
			period = 3,
			progress = {
				{
					cli_label = "evt_holy_eqm_ref",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5149] = {
			quest_type = 8,
			goal_id = 5149,
			max_day = 30,
			min_lev = 1,
			title = "让世界感受我的欧气",
			desc = "伟大召唤3次",
			show_icon = 204,
			max_lev = 119,
			id = 6,
			min_day = 23,
			period = 3,
			progress = {
				{
					cli_label = "evt_recruit_high",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5150] = {
			quest_type = 8,
			goal_id = 5150,
			max_day = 30,
			min_lev = 120,
			title = "更强力的武器！",
			desc = "战船维修7次",
			show_icon = 425,
			max_lev = 200,
			id = 7,
			min_day = 23,
			period = 3,
			progress = {
				{
					cli_label = "evt_holy_eqm_lottery",
					target = 0,
					target_val = 7,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5151] = {
			quest_type = 8,
			goal_id = 5151,
			max_day = 30,
			min_lev = 1,
			title = "金牌预言家的实力",
			desc = "赢得3次冠军赛投注",
			show_icon = 159,
			max_lev = 54,
			id = 8,
			min_day = 23,
			period = 3,
			progress = {
				{
					cli_label = "evt_championships_bet_win",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5152] = {
			quest_type = 8,
			goal_id = 5152,
			max_day = 30,
			min_lev = 55,
			title = "前往巅峰，或在去的路上",
			desc = "周冠军赛竞猜6次",
			show_icon = 422,
			max_lev = 200,
			id = 9,
			min_day = 23,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_cluster_champion_bet",
					target = 0,
					target_val = 6,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5153] = {
			quest_type = 8,
			goal_id = 5153,
			max_day = 30,
			min_lev = 1,
			title = "是什么在阻挡我前进",
			desc = "击败50个冒险守卫",
			show_icon = 407,
			max_lev = 99,
			id = 10,
			min_day = 23,
			period = 3,
			progress = {
				{
					cli_label = "evt_adventure_boss_fight_count",
					target = 0,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5154] = {
			quest_type = 8,
			goal_id = 5154,
			max_day = 30,
			min_lev = 100,
			title = "竞技，荣誉，王者姿态",
			desc = "超凡段位赛挑战30次",
			show_icon = 428,
			max_lev = 200,
			id = 11,
			min_day = 23,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_elite_combat_count",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5155] = {
			quest_type = 8,
			goal_id = 5155,
			max_day = 30,
			min_lev = 1,
			title = "尝一下我的实力吧",
			desc = "竞技场累积获胜50场",
			show_icon = 158,
			max_lev = 69,
			id = 12,
			min_day = 23,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_fight_result",
					target = 1,
					target_val = 50,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		},
		[5156] = {
			quest_type = 8,
			goal_id = 5156,
			max_day = 30,
			min_lev = 70,
			title = "出击吧，赢取我们的荣耀！",
			desc = "参与组队竞技场挑战5次",
			show_icon = 430,
			max_lev = 200,
			id = 13,
			min_day = 23,
			period = 3,
			progress = {
				{
					cli_label = "evt_arena_team_join",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award = {
				{
					80265,
					200
				}
			}
		}
	}
}
Config.HolidayNewWarOrderData.data_advance_card_list_length = 3
Config.HolidayNewWarOrderData.data_advance_card_list = {
	{
		name = "海贼宝藏",
		charge_id = 911,
		id = 501,
		period = 1,
		reward = {
			{
				50904,
				1
			},
			{
				80265,
				2000
			}
		},
		reward_1 = {
			{
				50904,
				1
			},
			{
				29905,
				140
			},
			{
				3,
				1800
			},
			{
				10403,
				10
			},
			{
				80265,
				2000
			}
		},
		reward_2 = {
			{
				39040,
				1
			},
			{
				29905,
				540
			},
			{
				3,
				5800
			},
			{
				10403,
				60
			}
		}
	},
	{
		name = "海贼宝藏",
		charge_id = 911,
		id = 502,
		period = 2,
		reward = {
			{
				50904,
				1
			},
			{
				80265,
				2000
			}
		},
		reward_1 = {
			{
				50904,
				1
			},
			{
				29905,
				140
			},
			{
				3,
				1800
			},
			{
				10403,
				10
			},
			{
				80265,
				2000
			}
		},
		reward_2 = {
			{
				39040,
				1
			},
			{
				29905,
				540
			},
			{
				3,
				5800
			},
			{
				10403,
				60
			}
		}
	},
	{
		name = "海贼宝藏",
		charge_id = 911,
		id = 503,
		period = 3,
		reward = {
			{
				50904,
				1
			},
			{
				80265,
				2000
			}
		},
		reward_1 = {
			{
				50904,
				1
			},
			{
				29905,
				100
			},
			{
				3,
				1800
			},
			{
				39158,
				26
			},
			{
				28,
				80
			},
			{
				80265,
				2000
			}
		},
		reward_2 = {
			{
				3,
				5800
			},
			{
				39159,
				1
			},
			{
				29905,
				350
			},
			{
				39158,
				131
			},
			{
				28,
				480
			},
			{
				14001,
				1
			}
		}
	}
}
