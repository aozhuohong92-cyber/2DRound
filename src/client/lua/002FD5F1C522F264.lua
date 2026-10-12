Config = Config or {}
Config.MiscData = Config.MiscData or {}
Config.MiscData.data_const_length = 5
Config.MiscData.data_const = {
	cross_level = {
		val = 50,
		desc = "跨服聊天等级限制"
	},
	province_level = {
		val = 35,
		desc = "同省聊天等级限制"
	},
	touch_gold_tips = {
		val = 1,
		desc = [[
1、每日点金会刷新3次，每次刷新都会重置点金的剩余次数
2、点金每日刷新时间：0:00，9:00，19:00
3、提升VIP等级可增加点金的金币获取量
4、三档点金奖励分别对应玩家当前挂机1、2、5小时的金币收益]]
	},
	auth_award = {
		desc = "实名活动奖励",
		val = {
			{
				3,
				100
			},
			{
				10403,
				1
			},
			{
				10001,
				100
			}
		}
	},
	hero_store_sign_time = {
		val = 1581562800,
		desc = "英魂商店时间戳改动？"
	}
}

function Config.MiscData.data_const_fun(slot0)
	slot1 = Config.MiscData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.MiscData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.MiscData.data_get_time_items_length = 12
Config.MiscData.data_get_time_items = {
	{
		index = 1,
		time = 60,
		items = {
			{
				3,
				5000
			}
		}
	},
	{
		index = 2,
		time = 150,
		items = {
			{
				1,
				50000
			}
		}
	},
	{
		index = 3,
		time = 210,
		items = {
			{
				22,
				50000
			}
		}
	},
	{
		index = 4,
		time = 530,
		items = {
			{
				26301,
				1
			}
		}
	},
	{
		index = 5,
		time = 840,
		items = {
			{
				3,
				100
			}
		}
	},
	{
		index = 6,
		time = 1680,
		items = {
			{
				1,
				150000
			}
		}
	},
	{
		index = 7,
		time = 2400,
		items = {
			{
				22,
				150000
			}
		}
	},
	{
		index = 8,
		time = 3600,
		items = {
			{
				27300,
				1
			}
		}
	},
	{
		index = 9,
		time = 5400,
		items = {
			{
				3,
				200
			}
		}
	},
	{
		index = 10,
		time = 7200,
		items = {
			{
				1,
				300000
			}
		}
	},
	{
		index = 11,
		time = 10800,
		items = {
			{
				22,
				300000
			}
		}
	},
	{
		index = 12,
		time = 14400,
		items = {
			{
				10403,
				5
			}
		}
	}
}

function Config.MiscData.data_get_time_items_fun(slot0)
	slot1 = Config.MiscData.data_get_time_items[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.MiscData.data_get_time_items[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.MiscData.data_cycle_gift_info_length = 2
Config.MiscData.data_cycle_gift_info = {
	{
		[401] = {
			charge_id = 401,
			gift_name = "每周福利",
			val = 30,
			gift_type = 1,
			limit_count = 10,
			sort_id = 1
		},
		[402] = {
			charge_id = 402,
			gift_name = "每周福利",
			val = 68,
			gift_type = 1,
			limit_count = 10,
			sort_id = 2
		},
		[403] = {
			charge_id = 403,
			gift_name = "每周福利",
			val = 128,
			gift_type = 1,
			limit_count = 10,
			sort_id = 3
		},
		[404] = {
			charge_id = 404,
			gift_name = "每周福利",
			val = 328,
			gift_type = 1,
			limit_count = 10,
			sort_id = 4
		},
		[405] = {
			charge_id = 405,
			gift_name = "每周福利",
			val = 448,
			gift_type = 1,
			limit_count = 10,
			sort_id = 5
		}
	},
	{
		[411] = {
			charge_id = 411,
			gift_name = "月度礼包",
			val = 30,
			gift_type = 2,
			limit_count = 30,
			sort_id = 1
		},
		[412] = {
			charge_id = 412,
			gift_name = "月度礼包",
			val = 68,
			gift_type = 2,
			limit_count = 30,
			sort_id = 2
		},
		[413] = {
			charge_id = 413,
			gift_name = "月度礼包",
			val = 128,
			gift_type = 2,
			limit_count = 30,
			sort_id = 3
		},
		[414] = {
			charge_id = 414,
			gift_name = "月度礼包",
			val = 328,
			gift_type = 2,
			limit_count = 30,
			sort_id = 4
		},
		[415] = {
			charge_id = 415,
			gift_name = "月度礼包",
			val = 448,
			gift_type = 2,
			limit_count = 30,
			sort_id = 5
		},
		[416] = {
			charge_id = 416,
			gift_name = "月度礼包",
			val = 648,
			gift_type = 2,
			limit_count = 30,
			sort_id = 6
		},
		[417] = {
			charge_id = 417,
			gift_name = "月度礼包",
			val = 648,
			gift_type = 2,
			limit_count = 30,
			sort_id = 7
		}
	}
}
Config.MiscData.data_cycle_gift_reward_length = 12
Config.MiscData.data_cycle_gift_reward = {
	[401] = {
		{
			min = 1,
			charge_id = 401,
			sort_id = 1,
			res_id = "30",
			reg_max = 1581562799,
			reg_min = 0,
			max = 7,
			reward = {
				{
					3,
					300
				},
				{
					60305,
					2
				},
				{
					10002,
					5
				},
				{
					10408,
					3
				}
			}
		},
		{
			min = 1,
			charge_id = 401,
			sort_id = 2,
			res_id = "30",
			reg_max = 2000000000,
			reg_min = 1581562800,
			max = 7,
			reward = {
				{
					3,
					300
				},
				{
					39006,
					1
				},
				{
					10002,
					5
				},
				{
					10408,
					3
				}
			}
		},
		{
			min = 8,
			charge_id = 401,
			sort_id = 3,
			res_id = "30",
			reg_max = 2000000000,
			reg_min = 0,
			max = 28,
			reward = {
				{
					3,
					300
				},
				{
					60305,
					2
				},
				{
					10002,
					5
				},
				{
					10408,
					3
				}
			}
		},
		{
			min = 29,
			charge_id = 401,
			sort_id = 4,
			res_id = "30",
			reg_max = 2000000000,
			reg_min = 0,
			max = 56,
			reward = {
				{
					3,
					300
				},
				{
					60305,
					2
				},
				{
					10002,
					5
				},
				{
					10408,
					4
				}
			}
		},
		{
			min = 57,
			charge_id = 401,
			sort_id = 5,
			res_id = "30",
			reg_max = 2000000000,
			reg_min = 0,
			max = 84,
			reward = {
				{
					3,
					300
				},
				{
					60305,
					2
				},
				{
					10002,
					5
				},
				{
					10408,
					5
				}
			}
		},
		{
			min = 85,
			charge_id = 401,
			sort_id = 6,
			res_id = "30",
			reg_max = 2000000000,
			reg_min = 0,
			max = 112,
			reward = {
				{
					3,
					300
				},
				{
					60305,
					2
				},
				{
					10002,
					5
				},
				{
					10408,
					5
				}
			}
		},
		{
			min = 113,
			charge_id = 401,
			sort_id = 7,
			res_id = "30",
			reg_max = 2000000000,
			reg_min = 0,
			max = 9999,
			reward = {
				{
					3,
					300
				},
				{
					60305,
					2
				},
				{
					10002,
					5
				},
				{
					10408,
					5
				}
			}
		}
	},
	[402] = {
		{
			min = 1,
			charge_id = 402,
			sort_id = 1,
			res_id = "31",
			reg_max = 1581562799,
			reg_min = 0,
			max = 7,
			reward = {
				{
					3,
					680
				},
				{
					60305,
					5
				},
				{
					72001,
					50
				},
				{
					10408,
					6
				}
			}
		},
		{
			min = 1,
			charge_id = 402,
			sort_id = 2,
			res_id = "31",
			reg_max = 2000000000,
			reg_min = 1581562800,
			max = 7,
			reward = {
				{
					3,
					680
				},
				{
					39006,
					1
				},
				{
					72001,
					50
				},
				{
					10408,
					6
				}
			}
		},
		{
			min = 8,
			charge_id = 402,
			sort_id = 3,
			res_id = "31",
			reg_max = 2000000000,
			reg_min = 0,
			max = 28,
			reward = {
				{
					3,
					680
				},
				{
					60305,
					5
				},
				{
					10450,
					500
				},
				{
					10408,
					6
				}
			}
		},
		{
			min = 29,
			charge_id = 402,
			sort_id = 4,
			res_id = "31",
			reg_max = 2000000000,
			reg_min = 0,
			max = 56,
			reward = {
				{
					3,
					680
				},
				{
					60305,
					5
				},
				{
					10450,
					500
				},
				{
					10408,
					6
				}
			}
		},
		{
			min = 57,
			charge_id = 402,
			sort_id = 5,
			res_id = "31",
			reg_max = 2000000000,
			reg_min = 0,
			max = 84,
			reward = {
				{
					3,
					680
				},
				{
					60305,
					5
				},
				{
					10450,
					500
				},
				{
					10408,
					6
				}
			}
		},
		{
			min = 85,
			charge_id = 402,
			sort_id = 6,
			res_id = "31",
			reg_max = 2000000000,
			reg_min = 0,
			max = 112,
			reward = {
				{
					3,
					680
				},
				{
					60305,
					5
				},
				{
					10450,
					500
				},
				{
					10408,
					6
				}
			}
		},
		{
			min = 113,
			charge_id = 402,
			sort_id = 7,
			res_id = "31",
			reg_max = 2000000000,
			reg_min = 0,
			max = 9999,
			reward = {
				{
					3,
					680
				},
				{
					60305,
					5
				},
				{
					10450,
					500
				},
				{
					10408,
					6
				}
			}
		}
	},
	[403] = {
		{
			min = 1,
			charge_id = 403,
			sort_id = 1,
			res_id = "32",
			reg_max = 2000000000,
			reg_min = 0,
			max = 7,
			reward = {
				{
					3,
					1280
				},
				{
					39002,
					1
				},
				{
					10,
					2000
				},
				{
					10408,
					10
				}
			}
		},
		{
			min = 8,
			charge_id = 403,
			sort_id = 2,
			res_id = "32",
			reg_max = 2000000000,
			reg_min = 0,
			max = 28,
			reward = {
				{
					3,
					1280
				},
				{
					39002,
					1
				},
				{
					10,
					2000
				},
				{
					10408,
					10
				}
			}
		},
		{
			min = 29,
			charge_id = 403,
			sort_id = 3,
			res_id = "32",
			reg_max = 2000000000,
			reg_min = 0,
			max = 35,
			reward = {
				{
					3,
					1280
				},
				{
					39002,
					1
				},
				{
					10,
					2000
				},
				{
					10408,
					10
				}
			}
		},
		{
			min = 36,
			charge_id = 403,
			sort_id = 4,
			res_id = "37",
			reg_max = 2000000000,
			reg_min = 0,
			max = 56,
			reward = {
				{
					3,
					1280
				},
				{
					39002,
					1
				},
				{
					10,
					2000
				},
				{
					10408,
					10
				}
			}
		},
		{
			min = 57,
			charge_id = 403,
			sort_id = 5,
			res_id = "37",
			reg_max = 2000000000,
			reg_min = 0,
			max = 84,
			reward = {
				{
					3,
					1280
				},
				{
					39002,
					1
				},
				{
					10,
					2000
				},
				{
					10408,
					10
				}
			}
		},
		{
			min = 85,
			charge_id = 403,
			sort_id = 6,
			res_id = "37",
			reg_max = 2000000000,
			reg_min = 0,
			max = 112,
			reward = {
				{
					3,
					1280
				},
				{
					39002,
					1
				},
				{
					10,
					2000
				},
				{
					10408,
					10
				}
			}
		},
		{
			min = 113,
			charge_id = 403,
			sort_id = 7,
			res_id = "37",
			reg_max = 2000000000,
			reg_min = 0,
			max = 9999,
			reward = {
				{
					3,
					1280
				},
				{
					39002,
					1
				},
				{
					10,
					2000
				},
				{
					10408,
					10
				}
			}
		}
	},
	[404] = {
		{
			min = 1,
			charge_id = 404,
			sort_id = 1,
			res_id = "33",
			reg_max = 2000000000,
			reg_min = 0,
			max = 7,
			reward = {
				{
					3,
					3280
				},
				{
					39079,
					1
				},
				{
					1,
					3800000
				},
				{
					10408,
					15
				}
			}
		},
		{
			min = 8,
			charge_id = 404,
			sort_id = 2,
			res_id = "33",
			reg_max = 2000000000,
			reg_min = 0,
			max = 28,
			reward = {
				{
					3,
					3280
				},
				{
					39079,
					1
				},
				{
					1,
					3800000
				},
				{
					10408,
					15
				}
			}
		},
		{
			min = 29,
			charge_id = 404,
			sort_id = 3,
			res_id = "33",
			reg_max = 2000000000,
			reg_min = 0,
			max = 56,
			reward = {
				{
					3,
					3280
				},
				{
					39079,
					1
				},
				{
					1,
					3800000
				},
				{
					10408,
					15
				}
			}
		},
		{
			min = 57,
			charge_id = 404,
			sort_id = 4,
			res_id = "33",
			reg_max = 2000000000,
			reg_min = 0,
			max = 84,
			reward = {
				{
					3,
					3280
				},
				{
					39079,
					1
				},
				{
					1,
					3800000
				},
				{
					10408,
					15
				}
			}
		},
		{
			min = 85,
			charge_id = 404,
			sort_id = 5,
			res_id = "33",
			reg_max = 2000000000,
			reg_min = 0,
			max = 112,
			reward = {
				{
					3,
					3280
				},
				{
					39079,
					1
				},
				{
					1,
					3800000
				},
				{
					10408,
					15
				}
			}
		},
		{
			min = 113,
			charge_id = 404,
			sort_id = 6,
			res_id = "33",
			reg_max = 2000000000,
			reg_min = 0,
			max = 9999,
			reward = {
				{
					3,
					3280
				},
				{
					39079,
					1
				},
				{
					1,
					3800000
				},
				{
					10408,
					15
				}
			}
		}
	},
	[405] = {
		{
			min = 1,
			charge_id = 405,
			sort_id = 1,
			res_id = "34",
			reg_max = 2000000000,
			reg_min = 0,
			max = 28,
			reward = {
				{
					3,
					4480
				},
				{
					10450,
					10000
				},
				{
					1,
					5000000
				},
				{
					10408,
					20
				}
			}
		},
		{
			min = 29,
			charge_id = 405,
			sort_id = 2,
			res_id = "34",
			reg_max = 2000000000,
			reg_min = 0,
			max = 56,
			reward = {
				{
					3,
					4480
				},
				{
					10450,
					10000
				},
				{
					1,
					5000000
				},
				{
					10408,
					20
				}
			}
		},
		{
			min = 57,
			charge_id = 405,
			sort_id = 3,
			res_id = "34",
			reg_max = 2000000000,
			reg_min = 0,
			max = 60,
			reward = {
				{
					3,
					4480
				},
				{
					10450,
					10000
				},
				{
					1,
					5000000
				},
				{
					10408,
					20
				}
			}
		},
		{
			min = 61,
			charge_id = 405,
			sort_id = 4,
			res_id = "34",
			reg_max = 2000000000,
			reg_min = 0,
			max = 84,
			reward = {
				{
					3,
					4480
				},
				{
					10450,
					10000
				},
				{
					1,
					5000000
				},
				{
					10408,
					20
				}
			}
		},
		{
			min = 85,
			charge_id = 405,
			sort_id = 5,
			res_id = "34",
			reg_max = 2000000000,
			reg_min = 0,
			max = 112,
			reward = {
				{
					3,
					4480
				},
				{
					10450,
					10000
				},
				{
					1,
					5000000
				},
				{
					10408,
					20
				}
			}
		},
		{
			min = 113,
			charge_id = 405,
			sort_id = 6,
			res_id = "34",
			reg_max = 2000000000,
			reg_min = 0,
			max = 9999,
			reward = {
				{
					3,
					4480
				},
				{
					10450,
					10000
				},
				{
					1,
					5000000
				},
				{
					10408,
					20
				}
			}
		}
	},
	[411] = {
		{
			min = 1,
			charge_id = 411,
			sort_id = 1,
			res_id = "25",
			reg_max = 2000000000,
			reg_min = 0,
			max = 30,
			reward = {
				{
					3,
					300
				},
				{
					39001,
					1
				},
				{
					10403,
					6
				},
				{
					37001,
					5
				}
			}
		},
		{
			min = 31,
			charge_id = 411,
			sort_id = 2,
			res_id = "25",
			reg_max = 2000000000,
			reg_min = 0,
			max = 60,
			reward = {
				{
					3,
					300
				},
				{
					39001,
					1
				},
				{
					10403,
					7
				},
				{
					37001,
					5
				}
			}
		},
		{
			min = 61,
			charge_id = 411,
			sort_id = 3,
			res_id = "25",
			reg_max = 2000000000,
			reg_min = 0,
			max = 90,
			reward = {
				{
					3,
					300
				},
				{
					39001,
					1
				},
				{
					10403,
					8
				},
				{
					37001,
					5
				}
			}
		},
		{
			min = 91,
			charge_id = 411,
			sort_id = 4,
			res_id = "25",
			reg_max = 2000000000,
			reg_min = 0,
			max = 120,
			reward = {
				{
					3,
					300
				},
				{
					39001,
					1
				},
				{
					10403,
					8
				},
				{
					37001,
					5
				}
			}
		},
		{
			min = 121,
			charge_id = 411,
			sort_id = 5,
			res_id = "25",
			reg_max = 2000000000,
			reg_min = 0,
			max = 9999,
			reward = {
				{
					3,
					300
				},
				{
					39001,
					1
				},
				{
					10403,
					8
				},
				{
					37001,
					5
				}
			}
		}
	},
	[412] = {
		{
			min = 1,
			charge_id = 412,
			sort_id = 1,
			res_id = "26",
			reg_max = 2000000000,
			reg_min = 0,
			max = 30,
			reward = {
				{
					3,
					680
				},
				{
					39006,
					1
				},
				{
					10403,
					8
				},
				{
					37001,
					10
				}
			}
		},
		{
			min = 31,
			charge_id = 412,
			sort_id = 2,
			res_id = "26",
			reg_max = 2000000000,
			reg_min = 0,
			max = 60,
			reward = {
				{
					3,
					680
				},
				{
					39006,
					1
				},
				{
					10403,
					9
				},
				{
					37001,
					10
				}
			}
		},
		{
			min = 61,
			charge_id = 412,
			sort_id = 3,
			res_id = "26",
			reg_max = 2000000000,
			reg_min = 0,
			max = 90,
			reward = {
				{
					3,
					680
				},
				{
					39006,
					1
				},
				{
					10403,
					10
				},
				{
					37001,
					10
				}
			}
		},
		{
			min = 91,
			charge_id = 412,
			sort_id = 4,
			res_id = "26",
			reg_max = 2000000000,
			reg_min = 0,
			max = 120,
			reward = {
				{
					3,
					680
				},
				{
					39006,
					1
				},
				{
					10403,
					10
				},
				{
					37001,
					10
				}
			}
		},
		{
			min = 121,
			charge_id = 412,
			sort_id = 5,
			res_id = "26",
			reg_max = 2000000000,
			reg_min = 0,
			max = 9999,
			reward = {
				{
					3,
					680
				},
				{
					39006,
					1
				},
				{
					10403,
					10
				},
				{
					37001,
					10
				}
			}
		}
	},
	[413] = {
		{
			min = 1,
			charge_id = 413,
			sort_id = 1,
			res_id = "22",
			reg_max = 2000000000,
			reg_min = 0,
			max = 30,
			reward = {
				{
					3,
					1280
				},
				{
					14001,
					2
				},
				{
					10408,
					11
				},
				{
					10450,
					2000
				},
				{
					10005,
					5
				}
			}
		},
		{
			min = 31,
			charge_id = 413,
			sort_id = 2,
			res_id = "22",
			reg_max = 2000000000,
			reg_min = 0,
			max = 60,
			reward = {
				{
					3,
					1280
				},
				{
					14001,
					2
				},
				{
					10408,
					11
				},
				{
					10450,
					2000
				},
				{
					10005,
					5
				}
			}
		},
		{
			min = 61,
			charge_id = 413,
			sort_id = 3,
			res_id = "22",
			reg_max = 2000000000,
			reg_min = 0,
			max = 90,
			reward = {
				{
					3,
					1280
				},
				{
					14001,
					2
				},
				{
					10408,
					11
				},
				{
					10450,
					2000
				},
				{
					10005,
					5
				}
			}
		},
		{
			min = 91,
			charge_id = 413,
			sort_id = 4,
			res_id = "22",
			reg_max = 2000000000,
			reg_min = 0,
			max = 120,
			reward = {
				{
					3,
					1280
				},
				{
					14001,
					2
				},
				{
					10408,
					11
				},
				{
					10450,
					2000
				},
				{
					10005,
					5
				}
			}
		},
		{
			min = 121,
			charge_id = 413,
			sort_id = 5,
			res_id = "22",
			reg_max = 2000000000,
			reg_min = 0,
			max = 9999,
			reward = {
				{
					3,
					1280
				},
				{
					14001,
					2
				},
				{
					10408,
					11
				},
				{
					10450,
					2000
				},
				{
					10005,
					5
				}
			}
		}
	},
	[414] = {
		{
			min = 1,
			charge_id = 414,
			sort_id = 1,
			res_id = "23",
			reg_max = 2000000000,
			reg_min = 0,
			max = 30,
			reward = {
				{
					3,
					3280
				},
				{
					14001,
					4
				},
				{
					10408,
					20
				},
				{
					1,
					20000000
				},
				{
					10005,
					10
				}
			}
		},
		{
			min = 31,
			charge_id = 414,
			sort_id = 2,
			res_id = "23",
			reg_max = 2000000000,
			reg_min = 0,
			max = 60,
			reward = {
				{
					3,
					3280
				},
				{
					14001,
					4
				},
				{
					10408,
					20
				},
				{
					1,
					20000000
				},
				{
					10005,
					10
				}
			}
		},
		{
			min = 61,
			charge_id = 414,
			sort_id = 3,
			res_id = "23",
			reg_max = 2000000000,
			reg_min = 0,
			max = 90,
			reward = {
				{
					3,
					3280
				},
				{
					14001,
					4
				},
				{
					10408,
					20
				},
				{
					1,
					20000000
				},
				{
					10005,
					10
				}
			}
		},
		{
			min = 91,
			charge_id = 414,
			sort_id = 4,
			res_id = "23",
			reg_max = 2000000000,
			reg_min = 0,
			max = 120,
			reward = {
				{
					3,
					3280
				},
				{
					14001,
					4
				},
				{
					10408,
					20
				},
				{
					1,
					20000000
				},
				{
					10005,
					10
				}
			}
		},
		{
			min = 121,
			charge_id = 414,
			sort_id = 5,
			res_id = "23",
			reg_max = 2000000000,
			reg_min = 0,
			max = 9999,
			reward = {
				{
					3,
					3280
				},
				{
					14001,
					4
				},
				{
					10408,
					20
				},
				{
					1,
					20000000
				},
				{
					10005,
					10
				}
			}
		}
	},
	[415] = {
		{
			min = 1,
			charge_id = 415,
			sort_id = 1,
			res_id = "24",
			reg_max = 2000000000,
			reg_min = 0,
			max = 30,
			reward = {
				{
					3,
					4480
				},
				{
					14001,
					7
				},
				{
					10408,
					26
				},
				{
					1,
					30000000
				},
				{
					10005,
					15
				}
			}
		},
		{
			min = 31,
			charge_id = 415,
			sort_id = 2,
			res_id = "24",
			reg_max = 2000000000,
			reg_min = 0,
			max = 60,
			reward = {
				{
					3,
					4480
				},
				{
					14001,
					7
				},
				{
					10408,
					26
				},
				{
					1,
					30000000
				},
				{
					10005,
					15
				}
			}
		},
		{
			min = 61,
			charge_id = 415,
			sort_id = 3,
			res_id = "24",
			reg_max = 2000000000,
			reg_min = 0,
			max = 90,
			reward = {
				{
					3,
					4480
				},
				{
					14001,
					7
				},
				{
					10408,
					26
				},
				{
					1,
					30000000
				},
				{
					10005,
					15
				}
			}
		},
		{
			min = 91,
			charge_id = 415,
			sort_id = 4,
			res_id = "24",
			reg_max = 2000000000,
			reg_min = 0,
			max = 120,
			reward = {
				{
					3,
					4480
				},
				{
					14001,
					7
				},
				{
					10408,
					26
				},
				{
					1,
					30000000
				},
				{
					10005,
					15
				}
			}
		},
		{
			min = 121,
			charge_id = 415,
			sort_id = 5,
			res_id = "24",
			reg_max = 2000000000,
			reg_min = 0,
			max = 9999,
			reward = {
				{
					3,
					4480
				},
				{
					14001,
					7
				},
				{
					10408,
					26
				},
				{
					1,
					30000000
				},
				{
					10005,
					15
				}
			}
		}
	},
	[416] = {
		{
			min = 1,
			charge_id = 416,
			sort_id = 1,
			res_id = "27",
			reg_max = 2000000000,
			reg_min = 0,
			max = 30,
			reward = {
				{
					3,
					6480
				},
				{
					14001,
					11
				},
				{
					10408,
					35
				},
				{
					1,
					30000000
				},
				{
					10450,
					6000
				}
			}
		},
		{
			min = 31,
			charge_id = 416,
			sort_id = 2,
			res_id = "27",
			reg_max = 2000000000,
			reg_min = 0,
			max = 60,
			reward = {
				{
					3,
					6480
				},
				{
					14001,
					11
				},
				{
					10408,
					35
				},
				{
					1,
					30000000
				},
				{
					10450,
					6000
				}
			}
		},
		{
			min = 61,
			charge_id = 416,
			sort_id = 3,
			res_id = "27",
			reg_max = 2000000000,
			reg_min = 0,
			max = 90,
			reward = {
				{
					3,
					6480
				},
				{
					14001,
					11
				},
				{
					10408,
					35
				},
				{
					1,
					30000000
				},
				{
					10450,
					6000
				}
			}
		},
		{
			min = 91,
			charge_id = 416,
			sort_id = 4,
			res_id = "27",
			reg_max = 2000000000,
			reg_min = 0,
			max = 120,
			reward = {
				{
					3,
					6480
				},
				{
					14001,
					11
				},
				{
					10408,
					35
				},
				{
					1,
					30000000
				},
				{
					10450,
					6000
				}
			}
		},
		{
			min = 121,
			charge_id = 416,
			sort_id = 5,
			res_id = "27",
			reg_max = 2000000000,
			reg_min = 0,
			max = 9999,
			reward = {
				{
					3,
					6480
				},
				{
					14001,
					11
				},
				{
					10408,
					35
				},
				{
					1,
					30000000
				},
				{
					10450,
					6000
				}
			}
		}
	},
	[417] = {
		{
			min = 1,
			charge_id = 417,
			sort_id = 1,
			res_id = "28",
			reg_max = 2000000000,
			reg_min = 0,
			max = 30,
			reward = {
				{
					3,
					6480
				},
				{
					14001,
					11
				},
				{
					10408,
					35
				},
				{
					1,
					30000000
				},
				{
					22,
					8000000
				}
			}
		},
		{
			min = 31,
			charge_id = 417,
			sort_id = 2,
			res_id = "28",
			reg_max = 2000000000,
			reg_min = 0,
			max = 60,
			reward = {
				{
					3,
					6480
				},
				{
					14001,
					11
				},
				{
					10408,
					35
				},
				{
					1,
					30000000
				},
				{
					22,
					8000000
				}
			}
		},
		{
			min = 61,
			charge_id = 417,
			sort_id = 3,
			res_id = "28",
			reg_max = 2000000000,
			reg_min = 0,
			max = 90,
			reward = {
				{
					3,
					6480
				},
				{
					14001,
					11
				},
				{
					10408,
					35
				},
				{
					1,
					30000000
				},
				{
					22,
					8000000
				}
			}
		},
		{
			min = 91,
			charge_id = 417,
			sort_id = 4,
			res_id = "28",
			reg_max = 2000000000,
			reg_min = 0,
			max = 120,
			reward = {
				{
					3,
					6480
				},
				{
					14001,
					11
				},
				{
					10408,
					35
				},
				{
					1,
					30000000
				},
				{
					22,
					8000000
				}
			}
		},
		{
			min = 121,
			charge_id = 417,
			sort_id = 5,
			res_id = "28",
			reg_max = 2000000000,
			reg_min = 0,
			max = 9999,
			reward = {
				{
					3,
					6480
				},
				{
					14001,
					11
				},
				{
					10408,
					35
				},
				{
					1,
					30000000
				},
				{
					22,
					8000000
				}
			}
		}
	}
}
