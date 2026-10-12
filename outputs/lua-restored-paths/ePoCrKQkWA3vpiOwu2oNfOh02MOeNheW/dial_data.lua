Config = Config or {}
Config.DialData = Config.DialData or {}
Config.DialData.data_const_length = 11
Config.DialData.data_const = {
	vip_start = {
		val = 2,
		desc = "VIP等级开启"
	},
	treasure_num = {
		desc = "探宝次数(幸运、高级)",
		val = {
			{
				1,
				15
			},
			{
				1,
				10
			}
		}
	},
	refreash = {
		desc = "刷新消耗",
		val = {
			{
				3,
				30
			}
		}
	},
	changliang = {
		val = 1,
		desc = "奖励库版本"
	},
	checkmore1 = {
		desc = "",
		val = {
			{
				1,
				29,
				{
					{
						1,
						1.8
					},
					{
						22,
						0.11
					},
					{
						10450,
						0.11
					},
					{
						10401,
						0.14
					},
					{
						14002,
						0.14
					},
					{
						29104,
						0.3
					},
					{
						29204,
						0.14
					},
					{
						29304,
						0.06
					},
					{
						29404,
						28.5
					},
					{
						29504,
						9
					},
					{
						29903,
						0.47
					},
					{
						29904,
						0.47
					},
					{
						29905,
						6
					},
					{
						40105,
						2.25
					},
					{
						40108,
						2.25
					},
					{
						40205,
						0.44
					},
					{
						40206,
						2.25
					},
					{
						40207,
						5.4
					},
					{
						40305,
						0.69
					},
					{
						40307,
						0.69
					},
					{
						40405,
						0.69
					},
					{
						40407,
						0.45
					},
					{
						40408,
						9.66
					},
					{
						72001,
						28
					}
				}
			},
			{
				30,
				49,
				{
					{
						1,
						28.5
					},
					{
						22,
						28
					},
					{
						10450,
						9
					},
					{
						10401,
						5.4
					},
					{
						14002,
						3.3
					},
					{
						29104,
						2.2
					},
					{
						29204,
						4.6
					},
					{
						29304,
						0.11
					},
					{
						29404,
						0.11
					},
					{
						29504,
						0.11
					},
					{
						29903,
						0.2
					},
					{
						29904,
						0.2
					},
					{
						29905,
						0.92
					},
					{
						40105,
						0.06
					},
					{
						40108,
						2.25
					},
					{
						40205,
						1.89
					},
					{
						40206,
						0.51
					},
					{
						40207,
						2.25
					},
					{
						40305,
						1.89
					},
					{
						40307,
						0.73
					},
					{
						40405,
						0.73
					},
					{
						40407,
						1.02
					},
					{
						40408,
						6
					}
				}
			},
			{
				50,
				999,
				{
					{
						1,
						28.5
					},
					{
						22,
						28
					},
					{
						10450,
						9
					},
					{
						10401,
						5.4
					},
					{
						14002,
						1.98
					},
					{
						29104,
						3.52
					},
					{
						29204,
						4.6
					},
					{
						29304,
						0.03
					},
					{
						29404,
						0.03
					},
					{
						29504,
						0.03
					},
					{
						29903,
						0.18
					},
					{
						29904,
						0.18
					},
					{
						29905,
						1.41
					},
					{
						40105,
						0.04
					},
					{
						40108,
						2.02
					},
					{
						40205,
						0.73
					},
					{
						40206,
						0.06
					},
					{
						40207,
						2.02
					},
					{
						40305,
						0.73
					},
					{
						40307,
						2.02
					},
					{
						40405,
						0.73
					},
					{
						40407,
						2.02
					},
					{
						40408,
						0.73
					},
					{
						72001,
						6
					}
				}
			}
		}
	},
	checkmore2 = {
		desc = "",
		val = {
			{
				1,
				49,
				{
					{
						1,
						28
					},
					{
						10452,
						28.5
					},
					{
						14001,
						15
					},
					{
						24902,
						0.11
					},
					{
						25901,
						0.11
					},
					{
						26905,
						0.11
					},
					{
						28903,
						0.1
					},
					{
						29404,
						2.34
					},
					{
						29405,
						0.12
					},
					{
						29504,
						2.34
					},
					{
						29505,
						0.12
					},
					{
						29904,
						3.96
					},
					{
						29905,
						0.69
					},
					{
						40110,
						0.72
					},
					{
						40111,
						0.12
					},
					{
						40112,
						1.1
					},
					{
						40210,
						0.72
					},
					{
						40212,
						1.32
					},
					{
						40213,
						0.66
					},
					{
						40310,
						0.72
					},
					{
						40312,
						1.1
					},
					{
						40410,
						0.72
					},
					{
						40412,
						1.32
					},
					{
						72002,
						7.75
					},
					{
						72003,
						2.25
					}
				}
			},
			{
				50,
				999,
				{
					{
						1,
						28
					},
					{
						10452,
						28.5
					},
					{
						14001,
						15
					},
					{
						24902,
						0.21
					},
					{
						25901,
						0.45
					},
					{
						26905,
						0.21
					},
					{
						28903,
						0.21
					},
					{
						29404,
						0.04
					},
					{
						29405,
						0.45
					},
					{
						29504,
						0.04
					},
					{
						29505,
						3.6
					},
					{
						29904,
						0.15
					},
					{
						29905,
						3.6
					},
					{
						40110,
						0.15
					},
					{
						40111,
						0.9
					},
					{
						40112,
						0.72
					},
					{
						40210,
						0.12
					},
					{
						40212,
						1.49
					},
					{
						40213,
						0.72
					},
					{
						40310,
						1.49
					},
					{
						40312,
						0.52
					},
					{
						40410,
						0.72
					},
					{
						40412,
						0.52
					},
					{
						72002,
						0.72
					},
					{
						72003,
						1.49
					},
					{
						72004,
						7.75
					},
					{
						72005,
						2.25
					}
				}
			}
		}
	},
	game_rule1 = {
		val = 1,
		desc = [[
一、玩法说明
 1.每探宝1次均可从中随机获取1种宝物；
2.每天0点会重置转盘奖励；
3.每次探宝均有机会获得：强力装备、五星强力英雄、随机四星英雄等；
4.每次探宝都能获得10点幸运值，达到1000幸运值可得幸运大礼包；
5.每次幸运探宝都将获得探宝积分，探宝积分可以在探宝商城兑换商品；
6.探宝商城每天0点自动更新。]]
	},
	game_rule2 = {
		val = 2,
		desc = [[
一、玩法说明
 1.每探宝1次均可从中随机获取1种宝物；
2.每天0点会重置转盘奖励；
3.每次探宝均有机会获得：强力装备、五星强力英雄、随机四星英雄等；
4.每次探宝都能获得10点幸运值，达到1000幸运值可得幸运大礼包；
5.每次幸运探宝都将获得探宝积分，探宝积分可以在探宝商城兑换商品；
6.探宝商城每天0点自动更新。]]
	},
	num_1 = {
		val = 8,
		desc = "幸运探宝道具数量"
	},
	num_2 = {
		val = 8,
		desc = "高级探宝道具数量"
	},
	free_time = {
		val = 10800,
		desc = "免费刷新等待时间"
	}
}

function Config.DialData.data_const_fun(slot0)
	slot1 = Config.DialData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DialData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.DialData.data_rewards_length = 0
Config.DialData.data_rewards = {}

function Config.DialData.data_rewards_fun(slot0)
	slot1 = Config.DialData.data_rewards[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DialData.data_rewards[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.DialData.data_get_limit_open_length = 4
Config.DialData.data_get_limit_open = {
	{
		type2 = 1,
		count = 1,
		type = 1,
		add_lucky = 10,
		rand_id = 2,
		limit_open = {
			{
				"lev",
				10
			}
		},
		expend_item = {
			{
				37001,
				1
			}
		},
		expend_gold = {},
		add_item = {
			{
				18,
				10
			}
		}
	},
	{
		type2 = 2,
		count = 15,
		type = 1,
		add_lucky = 150,
		rand_id = 2,
		limit_open = {
			{
				"lev",
				10
			},
			{
				"vip_lev",
				2
			}
		},
		expend_item = {
			{
				37001,
				12
			}
		},
		expend_gold = {},
		add_item = {
			{
				18,
				150
			}
		}
	},
	{
		type2 = 1,
		count = 1,
		type = 2,
		add_lucky = 10,
		rand_id = 4,
		limit_open = {
			{
				"lev",
				30
			}
		},
		expend_item = {
			{
				37002,
				1
			}
		},
		expend_gold = {},
		add_item = {
			{
				18,
				10
			}
		}
	},
	{
		type2 = 2,
		count = 10,
		type = 2,
		add_lucky = 100,
		rand_id = 4,
		limit_open = {
			{
				"lev",
				30
			}
		},
		expend_item = {
			{
				37002,
				10
			}
		},
		expend_gold = {},
		add_item = {
			{
				18,
				100
			}
		}
	}
}
Config.DialData.data_get_lucky_award_length = 10
Config.DialData.data_get_lucky_award = {
	{
		id = 1,
		lucky_val = 100,
		type = 1,
		award = {
			{
				10103,
				2
			}
		}
	},
	{
		id = 2,
		lucky_val = 300,
		type = 1,
		award = {
			{
				10002,
				3
			}
		}
	},
	{
		id = 3,
		lucky_val = 500,
		type = 1,
		award = {
			{
				10403,
				1
			}
		}
	},
	{
		id = 4,
		lucky_val = 700,
		type = 1,
		award = {
			{
				37002,
				1
			}
		}
	},
	{
		id = 5,
		lucky_val = 1000,
		type = 1,
		award = {
			{
				38041,
				1
			}
		}
	},
	{
		id = 6,
		lucky_val = 100,
		type = 2,
		award = {
			{
				37001,
				10
			}
		}
	},
	{
		id = 7,
		lucky_val = 300,
		type = 2,
		award = {
			{
				14001,
				1
			}
		}
	},
	{
		id = 8,
		lucky_val = 500,
		type = 2,
		award = {
			{
				14001,
				2
			}
		}
	},
	{
		id = 9,
		lucky_val = 700,
		type = 2,
		award = {
			{
				14001,
				3
			}
		}
	},
	{
		id = 10,
		lucky_val = 1000,
		type = 2,
		award = {
			{
				38042,
				1
			}
		}
	}
}
Config.DialData.data_get_rand_list_length = 210
Config.DialData.data_get_rand_list = {
	[101] = {
		{
			item_id = 29904,
			name = "4星随机碎片",
			type = 1,
			id = 101,
			item_num = 30,
			pos = 1
		}
	},
	[102] = {
		{
			item_id = 29404,
			name = "4星海军碎片",
			type = 1,
			id = 102,
			item_num = 30,
			pos = 1
		}
	},
	[103] = {
		{
			item_id = 29504,
			name = "4星五皇团碎片",
			type = 1,
			id = 103,
			item_num = 30,
			pos = 1
		}
	},
	[104] = {
		{
			item_id = 29104,
			name = "4星海贼新星碎片",
			type = 1,
			id = 104,
			item_num = 30,
			pos = 1
		}
	},
	[105] = {
		{
			item_id = 29204,
			name = "4星草帽联盟碎片",
			type = 1,
			id = 105,
			item_num = 30,
			pos = 1
		}
	},
	[106] = {
		{
			item_id = 29304,
			name = "4星自然碎片",
			type = 1,
			id = 106,
			item_num = 30,
			pos = 1
		}
	},
	[107] = {
		{
			item_id = 29905,
			name = "5星随机碎片",
			type = 1,
			id = 107,
			item_num = 25,
			pos = 1
		}
	},
	[108] = {
		{
			item_id = 14002,
			name = "转换精华",
			type = 1,
			id = 108,
			item_num = 5,
			pos = 2
		}
	},
	[109] = {
		{
			item_id = 14002,
			name = "转换精华",
			type = 1,
			id = 109,
			item_num = 5,
			pos = 2
		}
	},
	[110] = {
		{
			item_id = 10401,
			name = "普通召唤卷",
			type = 1,
			id = 110,
			item_num = 2,
			pos = 2
		}
	},
	[111] = {
		{
			item_id = 10401,
			name = "普通召唤卷",
			type = 1,
			id = 111,
			item_num = 2,
			pos = 2
		}
	},
	[112] = {
		{
			item_id = 10401,
			name = "普通召唤卷",
			type = 1,
			id = 112,
			item_num = 2,
			pos = 2
		}
	},
	[113] = {
		{
			item_id = 14002,
			name = "转换精华",
			type = 1,
			id = 113,
			item_num = 10,
			pos = 3
		}
	},
	[114] = {
		{
			item_id = 14002,
			name = "转换精华",
			type = 1,
			id = 114,
			item_num = 10,
			pos = 3
		}
	},
	[115] = {
		{
			item_id = 14002,
			name = "转换精华",
			type = 1,
			id = 115,
			item_num = 10,
			pos = 3
		}
	},
	[116] = {
		{
			item_id = 14002,
			name = "转换精华",
			type = 1,
			id = 116,
			item_num = 10,
			pos = 3
		}
	},
	[117] = {
		{
			item_id = 40305,
			name = "冒险头盔",
			type = 1,
			id = 117,
			item_num = 1,
			pos = 3
		}
	},
	[118] = {
		{
			item_id = 1,
			name = "贝里",
			type = 1,
			id = 118,
			item_num = 40000,
			pos = 4
		}
	},
	[119] = {
		{
			item_id = 1,
			name = "贝里",
			type = 1,
			id = 119,
			item_num = 40000,
			pos = 4
		}
	},
	[120] = {
		{
			item_id = 1,
			name = "贝里",
			type = 1,
			id = 120,
			item_num = 50000,
			pos = 4
		}
	},
	[121] = {
		{
			item_id = 1,
			name = "贝里",
			type = 1,
			id = 121,
			item_num = 60000,
			pos = 4
		}
	},
	[122] = {
		{
			item_id = 1,
			name = "贝里",
			type = 1,
			id = 122,
			item_num = 80000,
			pos = 4
		}
	},
	[123] = {
		{
			item_id = 40407,
			name = "荣耀戒指",
			type = 1,
			id = 123,
			item_num = 1,
			pos = 5
		}
	},
	[124] = {
		{
			item_id = 40307,
			name = "荣耀头盔",
			type = 1,
			id = 124,
			item_num = 1,
			pos = 5
		}
	},
	[125] = {
		{
			item_id = 40207,
			name = "荣耀护甲",
			type = 1,
			id = 125,
			item_num = 1,
			pos = 5
		}
	},
	[126] = {
		{
			item_id = 40408,
			name = "雷霆戒指",
			type = 1,
			id = 126,
			item_num = 1,
			pos = 5
		}
	},
	[127] = {
		{
			item_id = 40108,
			name = "海军战刃",
			type = 1,
			id = 127,
			item_num = 1,
			pos = 5
		}
	},
	[128] = {
		{
			item_id = 22,
			name = "英雄经验",
			type = 1,
			id = 128,
			item_num = 10000,
			pos = 6
		}
	},
	[129] = {
		{
			item_id = 22,
			name = "英雄经验",
			type = 1,
			id = 129,
			item_num = 10000,
			pos = 6
		}
	},
	[130] = {
		{
			item_id = 22,
			name = "英雄经验",
			type = 1,
			id = 130,
			item_num = 12500,
			pos = 6
		}
	},
	[131] = {
		{
			item_id = 22,
			name = "英雄经验",
			type = 1,
			id = 131,
			item_num = 15000,
			pos = 6
		}
	},
	[132] = {
		{
			item_id = 22,
			name = "英雄经验",
			type = 1,
			id = 132,
			item_num = 20000,
			pos = 6
		}
	},
	[133] = {
		{
			item_id = 29903,
			name = "3星随机碎片",
			type = 1,
			id = 133,
			item_num = 20,
			pos = 7
		}
	},
	[134] = {
		{
			item_id = 40405,
			name = "冒险戒指",
			type = 1,
			id = 134,
			item_num = 1,
			pos = 7
		}
	},
	[135] = {
		{
			item_id = 40105,
			name = "冒险之刃",
			type = 1,
			id = 135,
			item_num = 1,
			pos = 7
		}
	},
	[136] = {
		{
			item_id = 40206,
			name = "精致西装",
			type = 1,
			id = 136,
			item_num = 1,
			pos = 7
		}
	},
	[137] = {
		{
			item_id = 40205,
			name = "冒险护甲",
			type = 1,
			id = 137,
			item_num = 1,
			pos = 7
		}
	},
	[138] = {
		{
			item_id = 72001,
			name = "神技精石",
			type = 1,
			id = 138,
			item_num = 2,
			pos = 8
		}
	},
	[139] = {
		{
			item_id = 72001,
			name = "神技精石",
			type = 1,
			id = 139,
			item_num = 2,
			pos = 8
		}
	},
	[140] = {
		{
			item_id = 10450,
			name = "强化训练",
			type = 1,
			id = 140,
			item_num = 25,
			pos = 8
		}
	},
	[141] = {
		{
			item_id = 10450,
			name = "强化训练",
			type = 1,
			id = 141,
			item_num = 25,
			pos = 8
		}
	},
	[142] = {
		{
			item_id = 10450,
			name = "强化训练",
			type = 1,
			id = 142,
			item_num = 25,
			pos = 8
		}
	},
	[143] = {
		{
			item_id = 29904,
			name = "4星随机碎片",
			type = 1,
			id = 143,
			item_num = 30,
			pos = 1
		}
	},
	[144] = {
		{
			item_id = 29404,
			name = "4星海军碎片",
			type = 1,
			id = 144,
			item_num = 30,
			pos = 1
		}
	},
	[145] = {
		{
			item_id = 29504,
			name = "4星五皇团碎片",
			type = 1,
			id = 145,
			item_num = 30,
			pos = 1
		}
	},
	[146] = {
		{
			item_id = 29104,
			name = "4星海贼新星碎片",
			type = 1,
			id = 146,
			item_num = 30,
			pos = 1
		}
	},
	[147] = {
		{
			item_id = 29204,
			name = "4星草帽联盟碎片",
			type = 1,
			id = 147,
			item_num = 30,
			pos = 1
		}
	},
	[148] = {
		{
			item_id = 29304,
			name = "4星自然碎片",
			type = 1,
			id = 148,
			item_num = 30,
			pos = 1
		}
	},
	[149] = {
		{
			item_id = 29905,
			name = "5星随机碎片",
			type = 1,
			id = 149,
			item_num = 25,
			pos = 1
		}
	},
	[150] = {
		{
			item_id = 14002,
			name = "转换精华",
			type = 1,
			id = 150,
			item_num = 5,
			pos = 2
		}
	},
	[151] = {
		{
			item_id = 14002,
			name = "转换精华",
			type = 1,
			id = 151,
			item_num = 5,
			pos = 2
		}
	},
	[152] = {
		{
			item_id = 10401,
			name = "普通召唤卷",
			type = 1,
			id = 152,
			item_num = 2,
			pos = 2
		}
	},
	[153] = {
		{
			item_id = 10401,
			name = "普通召唤卷",
			type = 1,
			id = 153,
			item_num = 2,
			pos = 2
		}
	},
	[154] = {
		{
			item_id = 10401,
			name = "普通召唤卷",
			type = 1,
			id = 154,
			item_num = 2,
			pos = 2
		}
	},
	[155] = {
		{
			item_id = 10451,
			name = "低级战技",
			type = 1,
			id = 155,
			item_num = 1,
			pos = 3
		}
	},
	[156] = {
		{
			item_id = 10451,
			name = "低级战技",
			type = 1,
			id = 156,
			item_num = 1,
			pos = 3
		}
	},
	[157] = {
		{
			item_id = 10450,
			name = "强化训练",
			type = 1,
			id = 157,
			item_num = 100,
			pos = 3
		}
	},
	[158] = {
		{
			item_id = 10450,
			name = "强化训练",
			type = 1,
			id = 158,
			item_num = 100,
			pos = 3
		}
	},
	[159] = {
		{
			item_id = 10450,
			name = "强化训练",
			type = 1,
			id = 159,
			item_num = 100,
			pos = 3
		}
	},
	[160] = {
		{
			item_id = 1,
			name = "贝里",
			type = 1,
			id = 160,
			item_num = 40000,
			pos = 4
		}
	},
	[161] = {
		{
			item_id = 1,
			name = "贝里",
			type = 1,
			id = 161,
			item_num = 50000,
			pos = 4
		}
	},
	[162] = {
		{
			item_id = 1,
			name = "贝里",
			type = 1,
			id = 162,
			item_num = 60000,
			pos = 4
		}
	},
	[163] = {
		{
			item_id = 1,
			name = "贝里",
			type = 1,
			id = 163,
			item_num = 80000,
			pos = 4
		}
	},
	[164] = {
		{
			item_id = 1,
			name = "贝里",
			type = 1,
			id = 164,
			item_num = 100000,
			pos = 4
		}
	},
	[165] = {
		{
			item_id = 40407,
			name = "荣耀戒指",
			type = 1,
			id = 165,
			item_num = 1,
			pos = 5
		}
	},
	[166] = {
		{
			item_id = 40307,
			name = "荣耀头盔",
			type = 1,
			id = 166,
			item_num = 1,
			pos = 5
		}
	},
	[167] = {
		{
			item_id = 40408,
			name = "雷霆戒指",
			type = 1,
			id = 167,
			item_num = 1,
			pos = 5
		}
	},
	[168] = {
		{
			item_id = 40408,
			name = "雷霆护甲",
			type = 1,
			id = 168,
			item_num = 1,
			pos = 5
		}
	},
	[169] = {
		{
			item_id = 40108,
			name = "海军战刃",
			type = 1,
			id = 169,
			item_num = 1,
			pos = 5
		}
	},
	[170] = {
		{
			item_id = 22,
			name = "英雄经验",
			type = 1,
			id = 170,
			item_num = 20000,
			pos = 6
		}
	},
	[171] = {
		{
			item_id = 22,
			name = "英雄经验",
			type = 1,
			id = 171,
			item_num = 25000,
			pos = 6
		}
	},
	[172] = {
		{
			item_id = 22,
			name = "英雄经验",
			type = 1,
			id = 172,
			item_num = 30000,
			pos = 6
		}
	},
	[173] = {
		{
			item_id = 22,
			name = "英雄经验",
			type = 1,
			id = 173,
			item_num = 35000,
			pos = 6
		}
	},
	[174] = {
		{
			item_id = 22,
			name = "英雄经验",
			type = 1,
			id = 174,
			item_num = 40000,
			pos = 6
		}
	},
	[175] = {
		{
			item_id = 29904,
			name = "4星随机碎片",
			type = 1,
			id = 175,
			item_num = 30,
			pos = 7
		}
	},
	[176] = {
		{
			item_id = 40106,
			name = "胜利战刃",
			type = 1,
			id = 176,
			item_num = 1,
			pos = 7
		}
	},
	[177] = {
		{
			item_id = 40105,
			name = "冒险之刃",
			type = 1,
			id = 177,
			item_num = 1,
			pos = 7
		}
	},
	[178] = {
		{
			item_id = 40205,
			name = "冒险护甲",
			type = 1,
			id = 178,
			item_num = 1,
			pos = 7
		}
	},
	[179] = {
		{
			item_id = 40206,
			name = "精致西装",
			type = 1,
			id = 179,
			item_num = 1,
			pos = 7
		}
	},
	[180] = {
		{
			item_id = 72001,
			name = "神技精石",
			type = 1,
			id = 180,
			item_num = 2,
			pos = 8
		}
	},
	[181] = {
		{
			item_id = 72001,
			name = "神技精石",
			type = 1,
			id = 181,
			item_num = 2,
			pos = 8
		}
	},
	[182] = {
		{
			item_id = 10450,
			name = "强化训练",
			type = 1,
			id = 182,
			item_num = 25,
			pos = 8
		}
	},
	[183] = {
		{
			item_id = 10450,
			name = "强化训练",
			type = 1,
			id = 183,
			item_num = 25,
			pos = 8
		}
	},
	[184] = {
		{
			item_id = 10450,
			name = "强化训练",
			type = 1,
			id = 184,
			item_num = 25,
			pos = 8
		}
	},
	[185] = {
		{
			item_id = 29904,
			name = "4星随机碎片",
			type = 1,
			id = 185,
			item_num = 30,
			pos = 1
		}
	},
	[186] = {
		{
			item_id = 29404,
			name = "4星海军碎片",
			type = 1,
			id = 186,
			item_num = 30,
			pos = 1
		}
	},
	[187] = {
		{
			item_id = 29504,
			name = "4星五皇团碎片",
			type = 1,
			id = 187,
			item_num = 30,
			pos = 1
		}
	},
	[188] = {
		{
			item_id = 29905,
			name = "5星随机碎片",
			type = 1,
			id = 188,
			item_num = 50,
			pos = 1
		}
	},
	[189] = {
		{
			item_id = 24907,
			name = "小丑巴基碎片",
			type = 1,
			id = 189,
			item_num = 50,
			pos = 1
		}
	},
	[190] = {
		{
			item_id = 25902,
			name = "薇薇碎片",
			type = 1,
			id = 190,
			item_num = 50,
			pos = 1
		}
	},
	[191] = {
		{
			item_id = 26904,
			name = "霍古巴克碎片",
			type = 1,
			id = 191,
			item_num = 50,
			pos = 1
		}
	},
	[192] = {
		{
			item_id = 14002,
			name = "转换精华",
			type = 1,
			id = 192,
			item_num = 5,
			pos = 2
		}
	},
	[193] = {
		{
			item_id = 14002,
			name = "转换精华",
			type = 1,
			id = 193,
			item_num = 5,
			pos = 2
		}
	},
	[194] = {
		{
			item_id = 10401,
			name = "普通召唤卷",
			type = 1,
			id = 194,
			item_num = 2,
			pos = 2
		}
	},
	[195] = {
		{
			item_id = 10401,
			name = "普通召唤卷",
			type = 1,
			id = 195,
			item_num = 2,
			pos = 2
		}
	},
	[196] = {
		{
			item_id = 10401,
			name = "普通召唤卷",
			type = 1,
			id = 196,
			item_num = 2,
			pos = 2
		}
	},
	[197] = {
		{
			item_id = 10451,
			name = "低级战技",
			type = 1,
			id = 197,
			item_num = 1,
			pos = 3
		}
	},
	[198] = {
		{
			item_id = 10451,
			name = "低级战技",
			type = 1,
			id = 198,
			item_num = 1,
			pos = 3
		}
	},
	[199] = {
		{
			item_id = 10450,
			name = "强化训练",
			type = 1,
			id = 199,
			item_num = 100,
			pos = 3
		}
	},
	[200] = {
		{
			item_id = 10450,
			name = "强化训练",
			type = 1,
			id = 200,
			item_num = 100,
			pos = 3
		}
	},
	[201] = {
		{
			item_id = 10450,
			name = "强化训练",
			type = 1,
			id = 201,
			item_num = 100,
			pos = 3
		}
	},
	[202] = {
		{
			item_id = 1,
			name = "贝里",
			type = 1,
			id = 202,
			item_num = 40000,
			pos = 4
		}
	},
	[203] = {
		{
			item_id = 1,
			name = "贝里",
			type = 1,
			id = 203,
			item_num = 50000,
			pos = 4
		}
	},
	[204] = {
		{
			item_id = 1,
			name = "贝里",
			type = 1,
			id = 204,
			item_num = 60000,
			pos = 4
		}
	},
	[205] = {
		{
			item_id = 1,
			name = "贝里",
			type = 1,
			id = 205,
			item_num = 80000,
			pos = 4
		}
	},
	[206] = {
		{
			item_id = 1,
			name = "贝里",
			type = 1,
			id = 206,
			item_num = 100000,
			pos = 4
		}
	},
	[207] = {
		{
			item_id = 40408,
			name = "雷霆戒指",
			type = 1,
			id = 207,
			item_num = 1,
			pos = 5
		}
	},
	[208] = {
		{
			item_id = 40308,
			name = "雷霆头盔",
			type = 1,
			id = 208,
			item_num = 1,
			pos = 5
		}
	},
	[209] = {
		{
			item_id = 40108,
			name = "海军战刃",
			type = 1,
			id = 209,
			item_num = 1,
			pos = 5
		}
	},
	[210] = {
		{
			item_id = 40208,
			name = "雷霆护甲",
			type = 1,
			id = 210,
			item_num = 1,
			pos = 5
		}
	},
	[211] = {
		{
			item_id = 40109,
			name = "中将佩剑",
			type = 1,
			id = 211,
			item_num = 1,
			pos = 5
		}
	},
	[212] = {
		{
			item_id = 22,
			name = "英雄经验",
			type = 1,
			id = 212,
			item_num = 20000,
			pos = 6
		}
	},
	[213] = {
		{
			item_id = 22,
			name = "英雄经验",
			type = 1,
			id = 213,
			item_num = 25000,
			pos = 6
		}
	},
	[214] = {
		{
			item_id = 22,
			name = "英雄经验",
			type = 1,
			id = 214,
			item_num = 30000,
			pos = 6
		}
	},
	[215] = {
		{
			item_id = 22,
			name = "英雄经验",
			type = 1,
			id = 215,
			item_num = 40000,
			pos = 6
		}
	},
	[216] = {
		{
			item_id = 22,
			name = "英雄经验",
			type = 1,
			id = 216,
			item_num = 50000,
			pos = 6
		}
	},
	[217] = {
		{
			item_id = 29904,
			name = "4星随机碎片",
			type = 1,
			id = 217,
			item_num = 30,
			pos = 7
		}
	},
	[218] = {
		{
			item_id = 40406,
			name = "胜利戒指",
			type = 1,
			id = 218,
			item_num = 1,
			pos = 7
		}
	},
	[219] = {
		{
			item_id = 40106,
			name = "胜利战刃",
			type = 1,
			id = 219,
			item_num = 1,
			pos = 7
		}
	},
	[220] = {
		{
			item_id = 40206,
			name = "精致西装",
			type = 1,
			id = 220,
			item_num = 1,
			pos = 7
		}
	},
	[221] = {
		{
			item_id = 40306,
			name = "胜利头盔",
			type = 1,
			id = 221,
			item_num = 1,
			pos = 7
		}
	},
	[222] = {
		{
			item_id = 72001,
			name = "神技精石",
			type = 1,
			id = 222,
			item_num = 2,
			pos = 8
		}
	},
	[223] = {
		{
			item_id = 72001,
			name = "神技精石",
			type = 1,
			id = 223,
			item_num = 2,
			pos = 8
		}
	},
	[224] = {
		{
			item_id = 10450,
			name = "强化训练",
			type = 1,
			id = 224,
			item_num = 30,
			pos = 8
		}
	},
	[225] = {
		{
			item_id = 10450,
			name = "强化训练",
			type = 1,
			id = 225,
			item_num = 30,
			pos = 8
		}
	},
	[226] = {
		{
			item_id = 10450,
			name = "强化训练",
			type = 1,
			id = 226,
			item_num = 30,
			pos = 8
		}
	},
	[227] = {
		{
			item_id = 29905,
			name = "5星随机碎片",
			type = 2,
			id = 227,
			item_num = 50,
			pos = 1
		}
	},
	[228] = {
		{
			item_id = 29405,
			name = "5星海军碎片",
			type = 2,
			id = 228,
			item_num = 50,
			pos = 1
		}
	},
	[229] = {
		{
			item_id = 29505,
			name = "5星五皇团碎片",
			type = 2,
			id = 229,
			item_num = 50,
			pos = 1
		}
	},
	[230] = {
		{
			item_id = 24902,
			name = "德雷克碎片",
			type = 2,
			id = 230,
			item_num = 50,
			pos = 1
		}
	},
	[231] = {
		{
			item_id = 25901,
			name = "乌索普碎片",
			type = 2,
			id = 231,
			item_num = 50,
			pos = 1
		}
	},
	[232] = {
		{
			item_id = 26905,
			name = "萨博（火拳）碎片",
			type = 2,
			id = 232,
			item_num = 50,
			pos = 1
		}
	},
	[233] = {
		{
			item_id = 28903,
			name = "香克斯碎片",
			type = 2,
			id = 233,
			item_num = 50,
			pos = 1
		}
	},
	[234] = {
		{
			item_id = 72003,
			name = "刻印石",
			type = 2,
			id = 234,
			item_num = 1,
			pos = 2
		}
	},
	[235] = {
		{
			item_id = 72003,
			name = "刻印石",
			type = 2,
			id = 235,
			item_num = 1,
			pos = 2
		}
	},
	[236] = {
		{
			item_id = 72002,
			name = "神技魂石",
			type = 2,
			id = 236,
			item_num = 5,
			pos = 2
		}
	},
	[237] = {
		{
			item_id = 72002,
			name = "神技魂石",
			type = 2,
			id = 237,
			item_num = 5,
			pos = 2
		}
	},
	[238] = {
		{
			item_id = 72002,
			name = "神技魂石",
			type = 2,
			id = 238,
			item_num = 5,
			pos = 2
		}
	},
	[239] = {
		{
			item_id = 40212,
			name = "祝福护甲",
			type = 2,
			id = 239,
			item_num = 1,
			pos = 3
		}
	},
	[240] = {
		{
			item_id = 40412,
			name = "祝福戒指",
			type = 2,
			id = 240,
			item_num = 1,
			pos = 3
		}
	},
	[241] = {
		{
			item_id = 40112,
			name = "祝福长剑",
			type = 2,
			id = 241,
			item_num = 1,
			pos = 3
		}
	},
	[242] = {
		{
			item_id = 40312,
			name = "祝福头盔",
			type = 2,
			id = 242,
			item_num = 1,
			pos = 3
		}
	},
	[243] = {
		{
			item_id = 40213,
			name = "圣光护甲",
			type = 2,
			id = 243,
			item_num = 1,
			pos = 3
		}
	},
	[244] = {
		{
			item_id = 10452,
			name = "中级战技",
			type = 2,
			id = 244,
			item_num = 1,
			pos = 4
		}
	},
	[245] = {
		{
			item_id = 10452,
			name = "中级战技",
			type = 2,
			id = 245,
			item_num = 1,
			pos = 4
		}
	},
	[246] = {
		{
			item_id = 10452,
			name = "中级战技",
			type = 2,
			id = 246,
			item_num = 1,
			pos = 4
		}
	},
	[247] = {
		{
			item_id = 10452,
			name = "中级战技",
			type = 2,
			id = 247,
			item_num = 1,
			pos = 4
		}
	},
	[248] = {
		{
			item_id = 10452,
			name = "中级战技",
			type = 2,
			id = 248,
			item_num = 1,
			pos = 4
		}
	},
	[249] = {
		{
			item_id = 40110,
			name = "光辉巨剑",
			type = 2,
			id = 249,
			item_num = 1,
			pos = 5
		}
	},
	[250] = {
		{
			item_id = 40310,
			name = "光辉头盔",
			type = 2,
			id = 250,
			item_num = 1,
			pos = 5
		}
	},
	[251] = {
		{
			item_id = 40210,
			name = "光辉护甲",
			type = 2,
			id = 251,
			item_num = 1,
			pos = 5
		}
	},
	[252] = {
		{
			item_id = 40410,
			name = "光辉戒指",
			type = 2,
			id = 252,
			item_num = 1,
			pos = 5
		}
	},
	[253] = {
		{
			item_id = 40111,
			name = "希望长剑",
			type = 2,
			id = 253,
			item_num = 1,
			pos = 5
		}
	},
	[254] = {
		{
			item_id = 1,
			name = "贝里",
			type = 2,
			id = 254,
			item_num = 1000000,
			pos = 6
		}
	},
	[255] = {
		{
			item_id = 1,
			name = "贝里",
			type = 2,
			id = 255,
			item_num = 1200000,
			pos = 6
		}
	},
	[256] = {
		{
			item_id = 1,
			name = "贝里",
			type = 2,
			id = 256,
			item_num = 1500000,
			pos = 6
		}
	},
	[257] = {
		{
			item_id = 1,
			name = "贝里",
			type = 2,
			id = 257,
			item_num = 2000000,
			pos = 6
		}
	},
	[258] = {
		{
			item_id = 1,
			name = "贝里",
			type = 2,
			id = 258,
			item_num = 3000000,
			pos = 6
		}
	},
	[259] = {
		{
			item_id = 29404,
			name = "4星海军碎片",
			type = 2,
			id = 259,
			item_num = 30,
			pos = 7
		}
	},
	[260] = {
		{
			item_id = 29504,
			name = "4星五皇团碎片",
			type = 2,
			id = 260,
			item_num = 30,
			pos = 7
		}
	},
	[261] = {
		{
			item_id = 29905,
			name = "5星随机碎片",
			type = 2,
			id = 261,
			item_num = 50,
			pos = 7
		}
	},
	[262] = {
		{
			item_id = 29904,
			name = "4星随机碎片",
			type = 2,
			id = 262,
			item_num = 30,
			pos = 7
		}
	},
	[263] = {
		{
			item_id = 29904,
			name = "4星随机碎片",
			type = 2,
			id = 263,
			item_num = 30,
			pos = 7
		}
	},
	[264] = {
		{
			item_id = 14001,
			name = "强者招募令",
			type = 2,
			id = 264,
			item_num = 1,
			pos = 8
		}
	},
	[265] = {
		{
			item_id = 14001,
			name = "强者招募令",
			type = 2,
			id = 265,
			item_num = 1,
			pos = 8
		}
	},
	[266] = {
		{
			item_id = 14001,
			name = "强者招募令",
			type = 2,
			id = 266,
			item_num = 1,
			pos = 8
		}
	},
	[267] = {
		{
			item_id = 14001,
			name = "强者招募令",
			type = 2,
			id = 267,
			item_num = 1,
			pos = 8
		}
	},
	[268] = {
		{
			item_id = 14001,
			name = "强者招募令",
			type = 2,
			id = 268,
			item_num = 1,
			pos = 8
		}
	},
	[269] = {
		{
			item_id = 27906,
			name = "鹤碎片",
			type = 2,
			id = 269,
			item_num = 50,
			pos = 1
		}
	},
	[270] = {
		{
			item_id = 29405,
			name = "5星海军碎片",
			type = 2,
			id = 270,
			item_num = 50,
			pos = 1
		}
	},
	[271] = {
		{
			item_id = 29505,
			name = "5星五皇团碎片",
			type = 2,
			id = 271,
			item_num = 50,
			pos = 1
		}
	},
	[272] = {
		{
			item_id = 24901,
			name = "艾斯碎片",
			type = 2,
			id = 272,
			item_num = 50,
			pos = 1
		}
	},
	[273] = {
		{
			item_id = 25906,
			name = "乔巴碎片",
			type = 2,
			id = 273,
			item_num = 50,
			pos = 1
		}
	},
	[274] = {
		{
			item_id = 26907,
			name = "龙马碎片",
			type = 2,
			id = 274,
			item_num = 50,
			pos = 1
		}
	},
	[275] = {
		{
			item_id = 28906,
			name = "艾斯（魂）碎片",
			type = 2,
			id = 275,
			item_num = 50,
			pos = 1
		}
	},
	[276] = {
		{
			item_id = 72003,
			name = "刻印石",
			type = 2,
			id = 276,
			item_num = 1,
			pos = 2
		}
	},
	[277] = {
		{
			item_id = 72003,
			name = "刻印石",
			type = 2,
			id = 277,
			item_num = 1,
			pos = 2
		}
	},
	[278] = {
		{
			item_id = 72002,
			name = "神技魂石",
			type = 2,
			id = 278,
			item_num = 5,
			pos = 2
		}
	},
	[279] = {
		{
			item_id = 72002,
			name = "神技魂石",
			type = 2,
			id = 279,
			item_num = 5,
			pos = 2
		}
	},
	[280] = {
		{
			item_id = 72002,
			name = "神技魂石",
			type = 2,
			id = 280,
			item_num = 5,
			pos = 2
		}
	},
	[281] = {
		{
			item_id = 40212,
			name = "祝福护甲",
			type = 2,
			id = 281,
			item_num = 1,
			pos = 3
		}
	},
	[282] = {
		{
			item_id = 40412,
			name = "祝福戒指",
			type = 2,
			id = 282,
			item_num = 1,
			pos = 3
		}
	},
	[283] = {
		{
			item_id = 40112,
			name = "祝福长剑",
			type = 2,
			id = 283,
			item_num = 1,
			pos = 3
		}
	},
	[284] = {
		{
			item_id = 40313,
			name = "圣光头盔",
			type = 2,
			id = 284,
			item_num = 1,
			pos = 3
		}
	},
	[285] = {
		{
			item_id = 40213,
			name = "圣光护甲",
			type = 2,
			id = 285,
			item_num = 1,
			pos = 3
		}
	},
	[286] = {
		{
			item_id = 10452,
			name = "中级战技",
			type = 2,
			id = 286,
			item_num = 1,
			pos = 4
		}
	},
	[287] = {
		{
			item_id = 10452,
			name = "中级战技",
			type = 2,
			id = 287,
			item_num = 1,
			pos = 4
		}
	},
	[288] = {
		{
			item_id = 10452,
			name = "中级战技",
			type = 2,
			id = 288,
			item_num = 1,
			pos = 4
		}
	},
	[289] = {
		{
			item_id = 10452,
			name = "中级战技",
			type = 2,
			id = 289,
			item_num = 1,
			pos = 4
		}
	},
	[290] = {
		{
			item_id = 10452,
			name = "中级战技",
			type = 2,
			id = 290,
			item_num = 1,
			pos = 4
		}
	},
	[291] = {
		{
			item_id = 40110,
			name = "光辉巨剑",
			type = 2,
			id = 291,
			item_num = 1,
			pos = 5
		}
	},
	[292] = {
		{
			item_id = 40310,
			name = "光辉头盔",
			type = 2,
			id = 292,
			item_num = 1,
			pos = 5
		}
	},
	[293] = {
		{
			item_id = 40210,
			name = "光辉护甲",
			type = 2,
			id = 293,
			item_num = 1,
			pos = 5
		}
	},
	[294] = {
		{
			item_id = 40410,
			name = "光辉戒指",
			type = 2,
			id = 294,
			item_num = 1,
			pos = 5
		}
	},
	[295] = {
		{
			item_id = 40111,
			name = "希望长剑",
			type = 2,
			id = 295,
			item_num = 1,
			pos = 5
		}
	},
	[296] = {
		{
			item_id = 1,
			name = "贝里",
			type = 2,
			id = 296,
			item_num = 1500000,
			pos = 6
		}
	},
	[297] = {
		{
			item_id = 1,
			name = "贝里",
			type = 2,
			id = 297,
			item_num = 1700000,
			pos = 6
		}
	},
	[298] = {
		{
			item_id = 1,
			name = "贝里",
			type = 2,
			id = 298,
			item_num = 2000000,
			pos = 6
		}
	},
	[299] = {
		{
			item_id = 1,
			name = "贝里",
			type = 2,
			id = 299,
			item_num = 3000000,
			pos = 6
		}
	},
	[300] = {
		{
			item_id = 1,
			name = "贝里",
			type = 2,
			id = 300,
			item_num = 4000000,
			pos = 6
		}
	},
	[301] = {
		{
			item_id = 29404,
			name = "4星海军碎片",
			type = 2,
			id = 301,
			item_num = 30,
			pos = 7
		}
	},
	[302] = {
		{
			item_id = 29504,
			name = "4星五皇团碎片",
			type = 2,
			id = 302,
			item_num = 30,
			pos = 7
		}
	},
	[303] = {
		{
			item_id = 29905,
			name = "5星随机碎片",
			type = 2,
			id = 303,
			item_num = 50,
			pos = 7
		}
	},
	[304] = {
		{
			item_id = 28905,
			name = "雨之希留碎片",
			type = 2,
			id = 304,
			item_num = 50,
			pos = 7
		}
	},
	[305] = {
		{
			item_id = 24905,
			name = "大悟碎片",
			type = 2,
			id = 305,
			item_num = 50,
			pos = 7
		}
	},
	[306] = {
		{
			item_id = 14001,
			name = "强者招募令",
			type = 2,
			id = 306,
			item_num = 1,
			pos = 8
		}
	},
	[307] = {
		{
			item_id = 14001,
			name = "强者招募令",
			type = 2,
			id = 307,
			item_num = 1,
			pos = 8
		}
	},
	[308] = {
		{
			item_id = 14001,
			name = "强者招募令",
			type = 2,
			id = 308,
			item_num = 1,
			pos = 8
		}
	},
	[309] = {
		{
			item_id = 14001,
			name = "强者招募令",
			type = 2,
			id = 309,
			item_num = 1,
			pos = 8
		}
	},
	[310] = {
		{
			item_id = 14001,
			name = "强者招募令",
			type = 2,
			id = 310,
			item_num = 1,
			pos = 8
		}
	}
}
Config.DialData.data_magnificat_list_length = 2
Config.DialData.data_magnificat_list = {
	{
		{
			min = 1,
			round_id = 1,
			id = 1,
			max = 29,
			award = {
				{
					1,
					28.5
				},
				{
					22,
					28
				},
				{
					10103,
					9
				},
				{
					10401,
					5.4
				},
				{
					14002,
					9.66
				},
				{
					29104,
					0.14
				},
				{
					29204,
					0.14
				},
				{
					29304,
					0.14
				},
				{
					29404,
					0.11
				},
				{
					29504,
					0.11
				},
				{
					29903,
					1.8
				},
				{
					29904,
					0.3
				},
				{
					29905,
					0.06
				},
				{
					40105,
					2.25
				},
				{
					40108,
					0.47
				},
				{
					40205,
					2.25
				},
				{
					40206,
					0.45
				},
				{
					40207,
					0.69
				},
				{
					40305,
					0.44
				},
				{
					40307,
					0.69
				},
				{
					40405,
					2.25
				},
				{
					40407,
					0.69
				},
				{
					40408,
					0.47
				},
				{
					72001,
					6
				}
			}
		},
		{
			min = 30,
			round_id = 1,
			id = 2,
			max = 49,
			award = {
				{
					1,
					28.5
				},
				{
					22,
					28
				},
				{
					10103,
					9
				},
				{
					10401,
					5.4
				},
				{
					10450,
					3.3
				},
				{
					10451,
					2.2
				},
				{
					14002,
					4.6
				},
				{
					29104,
					0.11
				},
				{
					29204,
					0.11
				},
				{
					29304,
					0.11
				},
				{
					29404,
					0.2
				},
				{
					29504,
					0.2
				},
				{
					29904,
					0.92
				},
				{
					29905,
					0.06
				},
				{
					40105,
					2.25
				},
				{
					40106,
					1.89
				},
				{
					40108,
					0.51
				},
				{
					40205,
					2.25
				},
				{
					40206,
					1.89
				},
				{
					40307,
					0.73
				},
				{
					40407,
					0.73
				},
				{
					40408,
					1.02
				},
				{
					72001,
					6
				}
			}
		},
		{
			min = 50,
			round_id = 1,
			id = 3,
			max = 999,
			award = {
				{
					1,
					28.5
				},
				{
					22,
					28
				},
				{
					10103,
					9
				},
				{
					10401,
					5.4
				},
				{
					10450,
					1.98
				},
				{
					10451,
					3.52
				},
				{
					14002,
					4.6
				},
				{
					24907,
					0.03
				},
				{
					25902,
					0.03
				},
				{
					26904,
					0.03
				},
				{
					29404,
					0.18
				},
				{
					29504,
					0.18
				},
				{
					29904,
					1.41
				},
				{
					29905,
					0.04
				},
				{
					40106,
					2.02
				},
				{
					40108,
					0.73
				},
				{
					40109,
					0.06
				},
				{
					40206,
					2.02
				},
				{
					40208,
					0.73
				},
				{
					40306,
					2.02
				},
				{
					40308,
					0.73
				},
				{
					40406,
					2.02
				},
				{
					40408,
					0.73
				},
				{
					72001,
					6
				}
			}
		}
	},
	{
		{
			min = 1,
			round_id = 2,
			id = 1,
			max = 49,
			award = {
				{
					1,
					28
				},
				{
					10452,
					28.5
				},
				{
					14001,
					15
				},
				{
					24902,
					0.11
				},
				{
					25901,
					0.11
				},
				{
					26905,
					0.11
				},
				{
					28903,
					0.1
				},
				{
					29404,
					2.34
				},
				{
					29405,
					0.12
				},
				{
					29504,
					2.34
				},
				{
					29505,
					0.12
				},
				{
					29904,
					3.96
				},
				{
					29905,
					0.69
				},
				{
					40110,
					0.72
				},
				{
					40111,
					0.12
				},
				{
					40112,
					1.1
				},
				{
					40210,
					0.72
				},
				{
					40212,
					1.32
				},
				{
					40213,
					0.66
				},
				{
					40310,
					0.72
				},
				{
					40312,
					1.1
				},
				{
					40410,
					0.72
				},
				{
					40412,
					1.32
				},
				{
					72002,
					7.75
				},
				{
					72003,
					2.25
				}
			}
		},
		{
			min = 50,
			round_id = 2,
			id = 2,
			max = 999,
			award = {
				{
					1,
					28
				},
				{
					10452,
					28.5
				},
				{
					14001,
					15
				},
				{
					24901,
					0.21
				},
				{
					24905,
					0.45
				},
				{
					25906,
					0.21
				},
				{
					26907,
					0.21
				},
				{
					27906,
					0.04
				},
				{
					28905,
					0.45
				},
				{
					28906,
					0.04
				},
				{
					29404,
					3.6
				},
				{
					29405,
					0.15
				},
				{
					29504,
					3.6
				},
				{
					29505,
					0.15
				},
				{
					29905,
					0.9
				},
				{
					40110,
					0.72
				},
				{
					40111,
					0.12
				},
				{
					40112,
					1.49
				},
				{
					40210,
					0.72
				},
				{
					40212,
					1.49
				},
				{
					40213,
					0.52
				},
				{
					40310,
					0.72
				},
				{
					40313,
					0.52
				},
				{
					40410,
					0.72
				},
				{
					40412,
					1.49
				},
				{
					72002,
					7.75
				},
				{
					72003,
					2.25
				}
			}
		}
	}
}
