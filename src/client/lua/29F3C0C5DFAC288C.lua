Config = Config or {}
Config.PlanesWarOrderData = Config.PlanesWarOrderData or {}
Config.PlanesWarOrderData.data_constant_length = 5
Config.PlanesWarOrderData.data_constant = {
	open_srv_day = {
		val = 15,
		label = "open_srv_day",
		desc = "开服天数限制"
	},
	limit_lev = {
		val = 80,
		label = "limit_lev",
		desc = "玩家等级限制"
	},
	rule_desc = {
		val = 1,
		label = "rule_desc",
		desc = [[
活动规则：
1、参加长环岛冒险，战胜每层最终boss，获取大量征战积分，获得超值奖励
2、更多的奖励，可通过付费购买进阶卡解锁
3、活动周期为44天，周期结束后，积分进度会被清除，请及时参与玩法，领取相应奖励！]]
	},
	rule_desc_2 = {
		val = 1,
		label = "rule_desc_2",
		desc = "第一层boss积分为100分\n第二层boss积分为250分\n第三层boss积分为400分"
	},
	warn_desc = {
		val = 1,
		label = "warn_desc",
		desc = "活动将于     %s     后结束\n活动结束后，进度将会清除。\n请及时完成任务，以免错过奖励！"
	}
}

function Config.PlanesWarOrderData.data_constant_fun(slot0)
	slot1 = Config.PlanesWarOrderData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PlanesWarOrderData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PlanesWarOrderData.data_lev_reward_list_length = 2
Config.PlanesWarOrderData.data_lev_reward_list = {
	{
		{
			lev = 1,
			period = 1,
			win_count = 0,
			reward = {
				{
					10602,
					2
				}
			},
			rmb_reward = {
				{
					10603,
					2
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
			win_count = 400,
			reward = {
				{
					10040,
					5
				}
			},
			rmb_reward = {
				{
					10040,
					20
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 3,
			period = 1,
			win_count = 800,
			reward = {
				{
					10040,
					5
				}
			},
			rmb_reward = {
				{
					10040,
					20
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 4,
			period = 1,
			win_count = 1200,
			reward = {
				{
					10040,
					5
				}
			},
			rmb_reward = {
				{
					10040,
					20
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 5,
			period = 1,
			win_count = 1600,
			reward = {
				{
					10040,
					5
				}
			},
			rmb_reward = {
				{
					10040,
					20
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 6,
			period = 1,
			win_count = 2000,
			reward = {
				{
					10602,
					2
				}
			},
			rmb_reward = {
				{
					10603,
					2
				},
				{
					3,
					1000
				}
			}
		},
		{
			lev = 7,
			period = 1,
			win_count = 2400,
			reward = {
				{
					10040,
					10
				}
			},
			rmb_reward = {
				{
					10040,
					40
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 8,
			period = 1,
			win_count = 2800,
			reward = {
				{
					10040,
					10
				}
			},
			rmb_reward = {
				{
					10040,
					40
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 9,
			period = 1,
			win_count = 3200,
			reward = {
				{
					10040,
					10
				}
			},
			rmb_reward = {
				{
					10040,
					40
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 10,
			period = 1,
			win_count = 3600,
			reward = {
				{
					10040,
					10
				}
			},
			rmb_reward = {
				{
					10040,
					40
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 11,
			period = 1,
			win_count = 4000,
			reward = {
				{
					10602,
					2
				}
			},
			rmb_reward = {
				{
					10603,
					2
				},
				{
					3,
					1000
				}
			}
		},
		{
			lev = 12,
			period = 1,
			win_count = 4400,
			reward = {
				{
					10040,
					15
				}
			},
			rmb_reward = {
				{
					10040,
					60
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 13,
			period = 1,
			win_count = 4800,
			reward = {
				{
					10040,
					15
				}
			},
			rmb_reward = {
				{
					10040,
					60
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 14,
			period = 1,
			win_count = 5200,
			reward = {
				{
					10040,
					15
				}
			},
			rmb_reward = {
				{
					10040,
					60
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 15,
			period = 1,
			win_count = 5600,
			reward = {
				{
					10040,
					15
				}
			},
			rmb_reward = {
				{
					10040,
					60
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 16,
			period = 1,
			win_count = 6000,
			reward = {
				{
					10602,
					2
				}
			},
			rmb_reward = {
				{
					10603,
					2
				},
				{
					3,
					1000
				}
			}
		},
		{
			lev = 17,
			period = 1,
			win_count = 6400,
			reward = {
				{
					10040,
					20
				}
			},
			rmb_reward = {
				{
					10040,
					80
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 18,
			period = 1,
			win_count = 6800,
			reward = {
				{
					10040,
					20
				}
			},
			rmb_reward = {
				{
					10040,
					80
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 19,
			period = 1,
			win_count = 7200,
			reward = {
				{
					10040,
					20
				}
			},
			rmb_reward = {
				{
					10040,
					80
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 20,
			period = 1,
			win_count = 7600,
			reward = {
				{
					10040,
					20
				}
			},
			rmb_reward = {
				{
					10040,
					80
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 21,
			period = 1,
			win_count = 8000,
			reward = {
				{
					10602,
					2
				}
			},
			rmb_reward = {
				{
					10603,
					2
				},
				{
					3,
					1000
				}
			}
		},
		{
			lev = 22,
			period = 1,
			win_count = 8400,
			reward = {
				{
					10040,
					25
				}
			},
			rmb_reward = {
				{
					10040,
					100
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 23,
			period = 1,
			win_count = 8800,
			reward = {
				{
					10040,
					25
				}
			},
			rmb_reward = {
				{
					10040,
					100
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 24,
			period = 1,
			win_count = 9200,
			reward = {
				{
					10040,
					25
				}
			},
			rmb_reward = {
				{
					10040,
					100
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 25,
			period = 1,
			win_count = 9600,
			reward = {
				{
					10040,
					25
				}
			},
			rmb_reward = {
				{
					10040,
					100
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 26,
			period = 1,
			win_count = 10000,
			reward = {
				{
					10603,
					2
				}
			},
			rmb_reward = {
				{
					10603,
					4
				},
				{
					3,
					1000
				}
			}
		},
		{
			lev = 27,
			period = 1,
			win_count = 10400,
			reward = {
				{
					10040,
					30
				}
			},
			rmb_reward = {
				{
					10040,
					120
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 28,
			period = 1,
			win_count = 10800,
			reward = {
				{
					10040,
					30
				}
			},
			rmb_reward = {
				{
					10040,
					120
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 29,
			period = 1,
			win_count = 11200,
			reward = {
				{
					10040,
					30
				}
			},
			rmb_reward = {
				{
					10040,
					120
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 30,
			period = 1,
			win_count = 11600,
			reward = {
				{
					10040,
					30
				}
			},
			rmb_reward = {
				{
					10040,
					120
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 31,
			period = 1,
			win_count = 12000,
			reward = {
				{
					10603,
					4
				}
			},
			rmb_reward = {
				{
					10603,
					8
				},
				{
					3,
					1000
				}
			}
		}
	},
	{
		{
			lev = 1,
			period = 2,
			win_count = 0,
			reward = {
				{
					10602,
					2
				}
			},
			rmb_reward = {
				{
					10603,
					2
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
			win_count = 400,
			reward = {
				{
					10040,
					5
				}
			},
			rmb_reward = {
				{
					10040,
					20
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 3,
			period = 2,
			win_count = 800,
			reward = {
				{
					10040,
					5
				}
			},
			rmb_reward = {
				{
					10040,
					20
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 4,
			period = 2,
			win_count = 1200,
			reward = {
				{
					10040,
					5
				}
			},
			rmb_reward = {
				{
					10040,
					20
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 5,
			period = 2,
			win_count = 1600,
			reward = {
				{
					10040,
					5
				}
			},
			rmb_reward = {
				{
					10040,
					20
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 6,
			period = 2,
			win_count = 2000,
			reward = {
				{
					10602,
					2
				}
			},
			rmb_reward = {
				{
					10603,
					2
				},
				{
					3,
					1000
				}
			}
		},
		{
			lev = 7,
			period = 2,
			win_count = 2400,
			reward = {
				{
					10040,
					10
				}
			},
			rmb_reward = {
				{
					10040,
					40
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 8,
			period = 2,
			win_count = 2800,
			reward = {
				{
					10040,
					10
				}
			},
			rmb_reward = {
				{
					10040,
					40
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 9,
			period = 2,
			win_count = 3200,
			reward = {
				{
					10040,
					10
				}
			},
			rmb_reward = {
				{
					10040,
					40
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 10,
			period = 2,
			win_count = 3600,
			reward = {
				{
					10040,
					10
				}
			},
			rmb_reward = {
				{
					10040,
					40
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 11,
			period = 2,
			win_count = 4000,
			reward = {
				{
					10602,
					2
				}
			},
			rmb_reward = {
				{
					10603,
					2
				},
				{
					3,
					1000
				}
			}
		},
		{
			lev = 12,
			period = 2,
			win_count = 4400,
			reward = {
				{
					10040,
					15
				}
			},
			rmb_reward = {
				{
					10040,
					60
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 13,
			period = 2,
			win_count = 4800,
			reward = {
				{
					10040,
					15
				}
			},
			rmb_reward = {
				{
					10040,
					60
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 14,
			period = 2,
			win_count = 5200,
			reward = {
				{
					10040,
					15
				}
			},
			rmb_reward = {
				{
					10040,
					60
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 15,
			period = 2,
			win_count = 5600,
			reward = {
				{
					10040,
					15
				}
			},
			rmb_reward = {
				{
					10040,
					60
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 16,
			period = 2,
			win_count = 6000,
			reward = {
				{
					10602,
					2
				}
			},
			rmb_reward = {
				{
					10603,
					2
				},
				{
					3,
					1000
				}
			}
		},
		{
			lev = 17,
			period = 2,
			win_count = 6400,
			reward = {
				{
					10040,
					20
				}
			},
			rmb_reward = {
				{
					10040,
					80
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 18,
			period = 2,
			win_count = 6800,
			reward = {
				{
					10040,
					20
				}
			},
			rmb_reward = {
				{
					10040,
					80
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 19,
			period = 2,
			win_count = 7200,
			reward = {
				{
					10040,
					20
				}
			},
			rmb_reward = {
				{
					10040,
					80
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 20,
			period = 2,
			win_count = 7600,
			reward = {
				{
					10040,
					20
				}
			},
			rmb_reward = {
				{
					10040,
					80
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 21,
			period = 2,
			win_count = 8000,
			reward = {
				{
					10602,
					2
				}
			},
			rmb_reward = {
				{
					10603,
					2
				},
				{
					3,
					1000
				}
			}
		},
		{
			lev = 22,
			period = 2,
			win_count = 8400,
			reward = {
				{
					10040,
					25
				}
			},
			rmb_reward = {
				{
					10040,
					100
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 23,
			period = 2,
			win_count = 8800,
			reward = {
				{
					10040,
					25
				}
			},
			rmb_reward = {
				{
					10040,
					100
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 24,
			period = 2,
			win_count = 9200,
			reward = {
				{
					10040,
					25
				}
			},
			rmb_reward = {
				{
					10040,
					100
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 25,
			period = 2,
			win_count = 9600,
			reward = {
				{
					10040,
					25
				}
			},
			rmb_reward = {
				{
					10040,
					100
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 26,
			period = 2,
			win_count = 10000,
			reward = {
				{
					10603,
					2
				}
			},
			rmb_reward = {
				{
					10603,
					4
				},
				{
					3,
					1000
				}
			}
		},
		{
			lev = 27,
			period = 2,
			win_count = 10400,
			reward = {
				{
					10040,
					30
				}
			},
			rmb_reward = {
				{
					10040,
					120
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 28,
			period = 2,
			win_count = 10800,
			reward = {
				{
					10040,
					30
				}
			},
			rmb_reward = {
				{
					10040,
					120
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 29,
			period = 2,
			win_count = 11200,
			reward = {
				{
					10040,
					30
				}
			},
			rmb_reward = {
				{
					10040,
					120
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 30,
			period = 2,
			win_count = 11600,
			reward = {
				{
					10040,
					30
				}
			},
			rmb_reward = {
				{
					10040,
					120
				},
				{
					3,
					100
				}
			}
		},
		{
			lev = 31,
			period = 2,
			win_count = 12000,
			reward = {
				{
					10603,
					4
				}
			},
			rmb_reward = {
				{
					10603,
					8
				},
				{
					3,
					1000
				}
			}
		}
	}
}
Config.PlanesWarOrderData.data_advance_card_list_length = 2
Config.PlanesWarOrderData.data_advance_card_list = {
	{
		name = "征战之证",
		charge_id = 910,
		id = 101,
		period = 1,
		buy_get = 2000,
		reward = {},
		client_reward_1 = {
			{
				10603,
				4
			},
			{
				3,
				2400
			},
			{
				10040,
				80
			}
		},
		client_reward_2 = {
			{
				3,
				9400
			},
			{
				10603,
				28
			},
			{
				10040,
				2100
			},
			{
				10602,
				10
			}
		}
	},
	{
		name = "征战之证",
		charge_id = 910,
		id = 201,
		period = 2,
		buy_get = 2000,
		reward = {},
		client_reward_1 = {
			{
				10603,
				4
			},
			{
				3,
				2400
			},
			{
				10040,
				80
			}
		},
		client_reward_2 = {
			{
				3,
				9400
			},
			{
				10603,
				28
			},
			{
				10040,
				2100
			},
			{
				10602,
				10
			}
		}
	}
}
Config.PlanesWarOrderData.data_period_day_length = 2
Config.PlanesWarOrderData.data_period_day = {
	{
		period = 1,
		period_day = 44,
		name = "征战之证"
	},
	{
		period = 2,
		period_day = 44,
		name = "征战之证"
	}
}

function Config.PlanesWarOrderData.data_period_day_fun(slot0)
	slot1 = Config.PlanesWarOrderData.data_period_day[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PlanesWarOrderData.data_period_day[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
