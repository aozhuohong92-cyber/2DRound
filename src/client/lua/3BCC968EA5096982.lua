Config = Config or {}
Config.GuildWarData = Config.GuildWarData or {}
Config.GuildWarData.data_const_length = 36
Config.GuildWarData.data_const = {
	active_member_num = {
		val = 1,
		key = "active_member_num",
		desc = "参赛所需活跃人数要求"
	},
	limit_lev = {
		val = 1,
		key = "limit_lev",
		desc = "公会3级开启"
	},
	limit_open_time = {
		val = 1,
		key = "limit_open_time",
		desc = "开服满3天后开放"
	},
	active_member_condition = {
		val = 5,
		key = "active_member_condition",
		desc = "联盟战离线X天及以上的玩家不能参与"
	},
	challange_time_limit = {
		val = 2,
		key = "challange_time_limit",
		desc = "挑战次数上限"
	},
	ruins_challange_limit = {
		val = 5,
		key = "ruins_challange_limit",
		desc = "废墟被挑战次数上限"
	},
	operation_coefficient_1 = {
		val = 1000,
		key = "operation_coefficient_1",
		desc = "战绩计算变量1"
	},
	operation_coefficient_2 = {
		val = 1000,
		key = "operation_coefficient_2",
		desc = "战绩计算变量2"
	},
	easy_difficulty = {
		val = 900,
		key = "easy_difficulty",
		desc = "战绩计算难度系数（简单）"
	},
	normal_difficulty = {
		val = 1000,
		key = "normal_difficulty",
		desc = "战绩计算难度系数（普通）"
	},
	hard_difficulty = {
		val = 1100,
		key = "hard_difficulty",
		desc = "战绩计算难度系数（困难）"
	},
	easy_diff_addition = {
		val = 900,
		key = "easy_diff_addition",
		desc = "简单难度属性修正系数"
	},
	normal_diff_addition = {
		val = 1000,
		key = "normal_diff_addition",
		desc = "普通难度属性修正系数"
	},
	hard_diff_addition = {
		val = 1100,
		key = "hard_diff_addition",
		desc = "困难难度属性修正系数"
	},
	battle_duration = {
		val = 132,
		key = "battle_duration",
		desc = "联盟战持续时间，单位：小时"
	},
	guard_id = {
		val = 81001,
		key = "guard_id",
		desc = "中立守卫怪物ID"
	},
	guild_win_reward = {
		key = "guild_win_reward",
		desc = "胜利方全盟邮件奖励",
		val = {
			{
				10,
				666
			},
			{
				1,
				50000
			}
		}
	},
	guild_lose_reward = {
		key = "guild_lose_reward",
		desc = "失败方全盟邮件奖励",
		val = {
			{
				10,
				400
			},
			{
				1,
				30000
			}
		}
	},
	win_strongholds_reward_easy = {
		key = "win_strongholds_reward_easy",
		desc = "挑战据点胜利奖励_简单",
		val = {
			{
				10,
				50
			},
			{
				1,
				20000
			}
		}
	},
	win_strongholds_reward_normal = {
		key = "win_strongholds_reward_normal",
		desc = "挑战据点胜利奖励_普通",
		val = {
			{
				10,
				80
			},
			{
				1,
				30000
			}
		}
	},
	win_strongholds_reward_hard = {
		key = "win_strongholds_reward_hard",
		desc = "挑战据点胜利奖励_困难",
		val = {
			{
				10,
				120
			},
			{
				1,
				50000
			}
		}
	},
	lose_strongholds_reward_easy = {
		key = "lose_strongholds_reward_easy",
		desc = "挑战据点失败奖励_简单",
		val = {
			{
				1,
				5000
			}
		}
	},
	lose_strongholds_reward_normal = {
		key = "lose_strongholds_reward_normal",
		desc = "挑战据点失败奖励_普通",
		val = {
			{
				1,
				9000
			}
		}
	},
	lose_strongholds_reward_hard = {
		key = "lose_strongholds_reward_hard",
		desc = "挑战据点失败奖励_困难",
		val = {
			{
				1,
				15000
			}
		}
	},
	win_ruins_record = {
		val = 5,
		key = "win_ruins_record",
		desc = "挑战废墟成功获得的战绩"
	},
	lose_ruins_record = {
		val = 1,
		key = "lose_ruins_record",
		desc = "挑战废墟失败获得的战绩"
	},
	lose_guard_record = {
		val = 1,
		key = "lose_guard_record",
		desc = "挑战据点失败获得的战绩"
	},
	matching_time = {
		key = "matching_time",
		desc = "每周几几点匹配{周几,时,分}",
		val = {
			{
				1,
				4,
				0
			},
			{
				3,
				4,
				0
			},
			{
				5,
				4,
				0
			}
		}
	},
	start_time = {
		key = "start_time",
		desc = "开战时间节点",
		val = {
			12,
			0,
			0
		}
	},
	end_time = {
		key = "end_time",
		desc = "结束时间节点",
		val = {
			20,
			0,
			0
		}
	},
	clear_time = {
		key = "clear_time",
		desc = "完全结束时间节点",
		val = {
			0,
			0,
			0
		}
	},
	time_desc = {
		val = 0,
		key = "time_desc",
		desc = "每周一、周三、周五12:00-20:00进行"
	},
	box_time_limit = {
		val = 28800,
		key = "box_time_limit",
		desc = "宝箱持续时间，单位：秒"
	},
	box_rule = {
		val = 1,
		key = "box_rule",
		desc = [[
1.宝箱在公会战结束后产生，只有参与了公会战的公会才可获得
2.宝箱共两种：胜利方的<div fontcolor=289b14>黄金宝箱</div>、失败方的<div fontcolor=289b14>青铜宝箱</div>
3.宝箱数量根据本公会活跃人数产生（1比1），只有活跃成员才可开启宝箱，且每人只可开启1次
4.玩家开启宝箱后可获得一定量<div fontcolor=289b14>公会贡献</div>，且有概率开启获得大量公会贡献。]]
	},
	treasure_item_amount = {
		val = 1,
		key = "treasure_item_amount",
		desc = "宝库随机掉落奖励的数量"
	},
	marketplace_rule = {
		val = 1,
		key = "marketplace_rule",
		desc = "1.公会宝库奖励：在公会战中取得胜利的一方将会获得公会宝库奖励，这部分奖励物品不会直接放入玩家的背包，而是放入公会宝库中成为可供玩家兑换的商品。公会宝库奖励分为固定掉落奖励和随机掉落奖励，固定掉落奖励为必定掉落，随机掉落奖励为从奖励池中随机抽取<div fontcolor=289b14>1</div>件物品掉落。\n2.战绩奖励：取决于成员在公会内的战绩排行，排名越高奖励越丰厚，奖励在公会战结束后结算并通过邮件形式发放"
	}
}

function Config.GuildWarData.data_const_fun(slot0)
	slot1 = Config.GuildWarData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildWarData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildWarData.data_award_length = 7
Config.GuildWarData.data_award = {
	{
		num = 1,
		award = {
			{
				10,
				1200
			},
			{
				1,
				400000
			}
		}
	},
	{
		num = 2,
		award = {
			{
				10,
				1000
			},
			{
				1,
				350000
			}
		}
	},
	{
		num = 3,
		award = {
			{
				10,
				800
			},
			{
				1,
				300000
			}
		}
	},
	[10] = {
		num = 10,
		award = {
			{
				10,
				600
			},
			{
				1,
				250000
			}
		}
	},
	[20] = {
		num = 20,
		award = {
			{
				10,
				500
			},
			{
				1,
				200000
			}
		}
	},
	[50] = {
		num = 50,
		award = {
			{
				10,
				400
			},
			{
				1,
				150000
			}
		}
	},
	[99] = {
		num = 99,
		award = {
			{
				10,
				300
			},
			{
				1,
				100000
			}
		}
	}
}

function Config.GuildWarData.data_award_fun(slot0)
	slot1 = Config.GuildWarData.data_award[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildWarData.data_award[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildWarData.data_position_length = 50
Config.GuildWarData.data_position = {
	{
		pos_x = 306,
		pos_y = 7283,
		warscore = {
			{
				1,
				75
			},
			{
				2,
				108
			},
			{
				3,
				140
			}
		}
	},
	{
		pos_x = 573,
		pos_y = 7181,
		warscore = {
			{
				1,
				74
			},
			{
				2,
				106
			},
			{
				3,
				137
			}
		}
	},
	{
		pos_x = 187,
		pos_y = 7057,
		warscore = {
			{
				1,
				72
			},
			{
				2,
				104
			},
			{
				3,
				135
			}
		}
	},
	{
		pos_x = 431,
		pos_y = 6955,
		warscore = {
			{
				1,
				71
			},
			{
				2,
				102
			},
			{
				3,
				132
			}
		}
	},
	{
		pos_x = 264,
		pos_y = 6768,
		warscore = {
			{
				1,
				70
			},
			{
				2,
				100
			},
			{
				3,
				130
			}
		}
	},
	{
		pos_x = 573,
		pos_y = 6768,
		warscore = {
			{
				1,
				68
			},
			{
				2,
				98
			},
			{
				3,
				127
			}
		}
	},
	{
		pos_x = 338,
		pos_y = 6538,
		warscore = {
			{
				1,
				67
			},
			{
				2,
				96
			},
			{
				3,
				124
			}
		}
	},
	{
		pos_x = 513,
		pos_y = 6369,
		warscore = {
			{
				1,
				65
			},
			{
				2,
				94
			},
			{
				3,
				122
			}
		}
	},
	{
		pos_x = 142,
		pos_y = 6481,
		warscore = {
			{
				1,
				64
			},
			{
				2,
				92
			},
			{
				3,
				119
			}
		}
	},
	{
		pos_x = 176,
		pos_y = 6218,
		warscore = {
			{
				1,
				63
			},
			{
				2,
				90
			},
			{
				3,
				117
			}
		}
	},
	{
		pos_x = 306,
		pos_y = 6003,
		warscore = {
			{
				1,
				61
			},
			{
				2,
				88
			},
			{
				3,
				114
			}
		}
	},
	{
		pos_x = 573,
		pos_y = 5901,
		warscore = {
			{
				1,
				60
			},
			{
				2,
				86
			},
			{
				3,
				111
			}
		}
	},
	{
		pos_x = 187,
		pos_y = 5777,
		warscore = {
			{
				1,
				58
			},
			{
				2,
				84
			},
			{
				3,
				109
			}
		}
	},
	{
		pos_x = 431,
		pos_y = 5675,
		warscore = {
			{
				1,
				57
			},
			{
				2,
				82
			},
			{
				3,
				106
			}
		}
	},
	{
		pos_x = 264,
		pos_y = 5488,
		warscore = {
			{
				1,
				56
			},
			{
				2,
				80
			},
			{
				3,
				104
			}
		}
	},
	{
		pos_x = 573,
		pos_y = 5488,
		warscore = {
			{
				1,
				54
			},
			{
				2,
				78
			},
			{
				3,
				101
			}
		}
	},
	{
		pos_x = 338,
		pos_y = 5258,
		warscore = {
			{
				1,
				53
			},
			{
				2,
				76
			},
			{
				3,
				98
			}
		}
	},
	{
		pos_x = 513,
		pos_y = 5089,
		warscore = {
			{
				1,
				51
			},
			{
				2,
				74
			},
			{
				3,
				96
			}
		}
	},
	{
		pos_x = 142,
		pos_y = 5201,
		warscore = {
			{
				1,
				50
			},
			{
				2,
				72
			},
			{
				3,
				93
			}
		}
	},
	{
		pos_x = 176,
		pos_y = 4938,
		warscore = {
			{
				1,
				49
			},
			{
				2,
				70
			},
			{
				3,
				91
			}
		}
	},
	{
		pos_x = 306,
		pos_y = 4723,
		warscore = {
			{
				1,
				47
			},
			{
				2,
				68
			},
			{
				3,
				88
			}
		}
	},
	{
		pos_x = 573,
		pos_y = 4621,
		warscore = {
			{
				1,
				46
			},
			{
				2,
				66
			},
			{
				3,
				85
			}
		}
	},
	{
		pos_x = 187,
		pos_y = 4497,
		warscore = {
			{
				1,
				44
			},
			{
				2,
				64
			},
			{
				3,
				83
			}
		}
	},
	{
		pos_x = 431,
		pos_y = 4395,
		warscore = {
			{
				1,
				43
			},
			{
				2,
				62
			},
			{
				3,
				80
			}
		}
	},
	{
		pos_x = 264,
		pos_y = 4208,
		warscore = {
			{
				1,
				42
			},
			{
				2,
				60
			},
			{
				3,
				78
			}
		}
	},
	{
		pos_x = 573,
		pos_y = 4208,
		warscore = {
			{
				1,
				40
			},
			{
				2,
				58
			},
			{
				3,
				75
			}
		}
	},
	{
		pos_x = 338,
		pos_y = 3978,
		warscore = {
			{
				1,
				39
			},
			{
				2,
				56
			},
			{
				3,
				72
			}
		}
	},
	{
		pos_x = 513,
		pos_y = 3809,
		warscore = {
			{
				1,
				37
			},
			{
				2,
				54
			},
			{
				3,
				70
			}
		}
	},
	{
		pos_x = 142,
		pos_y = 3921,
		warscore = {
			{
				1,
				36
			},
			{
				2,
				52
			},
			{
				3,
				67
			}
		}
	},
	{
		pos_x = 176,
		pos_y = 3658,
		warscore = {
			{
				1,
				35
			},
			{
				2,
				50
			},
			{
				3,
				65
			}
		}
	},
	{
		pos_x = 306,
		pos_y = 3443,
		warscore = {
			{
				1,
				33
			},
			{
				2,
				48
			},
			{
				3,
				62
			}
		}
	},
	{
		pos_x = 573,
		pos_y = 3341,
		warscore = {
			{
				1,
				32
			},
			{
				2,
				46
			},
			{
				3,
				59
			}
		}
	},
	{
		pos_x = 187,
		pos_y = 3217,
		warscore = {
			{
				1,
				30
			},
			{
				2,
				44
			},
			{
				3,
				57
			}
		}
	},
	{
		pos_x = 431,
		pos_y = 3115,
		warscore = {
			{
				1,
				29
			},
			{
				2,
				42
			},
			{
				3,
				54
			}
		}
	},
	{
		pos_x = 264,
		pos_y = 2928,
		warscore = {
			{
				1,
				28
			},
			{
				2,
				40
			},
			{
				3,
				52
			}
		}
	},
	{
		pos_x = 573,
		pos_y = 2928,
		warscore = {
			{
				1,
				26
			},
			{
				2,
				38
			},
			{
				3,
				49
			}
		}
	},
	{
		pos_x = 338,
		pos_y = 2698,
		warscore = {
			{
				1,
				25
			},
			{
				2,
				36
			},
			{
				3,
				46
			}
		}
	},
	{
		pos_x = 513,
		pos_y = 2529,
		warscore = {
			{
				1,
				23
			},
			{
				2,
				34
			},
			{
				3,
				44
			}
		}
	},
	{
		pos_x = 142,
		pos_y = 2641,
		warscore = {
			{
				1,
				22
			},
			{
				2,
				32
			},
			{
				3,
				41
			}
		}
	},
	{
		pos_x = 176,
		pos_y = 2378,
		warscore = {
			{
				1,
				21
			},
			{
				2,
				30
			},
			{
				3,
				39
			}
		}
	},
	{
		pos_x = 306,
		pos_y = 2163,
		warscore = {
			{
				1,
				19
			},
			{
				2,
				28
			},
			{
				3,
				36
			}
		}
	},
	{
		pos_x = 573,
		pos_y = 2061,
		warscore = {
			{
				1,
				18
			},
			{
				2,
				26
			},
			{
				3,
				33
			}
		}
	},
	{
		pos_x = 187,
		pos_y = 1937,
		warscore = {
			{
				1,
				16
			},
			{
				2,
				24
			},
			{
				3,
				31
			}
		}
	},
	{
		pos_x = 431,
		pos_y = 1835,
		warscore = {
			{
				1,
				15
			},
			{
				2,
				22
			},
			{
				3,
				28
			}
		}
	},
	{
		pos_x = 264,
		pos_y = 1648,
		warscore = {
			{
				1,
				14
			},
			{
				2,
				20
			},
			{
				3,
				26
			}
		}
	},
	{
		pos_x = 573,
		pos_y = 1648,
		warscore = {
			{
				1,
				12
			},
			{
				2,
				18
			},
			{
				3,
				23
			}
		}
	},
	{
		pos_x = 338,
		pos_y = 1418,
		warscore = {
			{
				1,
				11
			},
			{
				2,
				16
			},
			{
				3,
				20
			}
		}
	},
	{
		pos_x = 513,
		pos_y = 1249,
		warscore = {
			{
				1,
				9
			},
			{
				2,
				14
			},
			{
				3,
				18
			}
		}
	},
	{
		pos_x = 142,
		pos_y = 1361,
		warscore = {
			{
				1,
				8
			},
			{
				2,
				12
			},
			{
				3,
				15
			}
		}
	},
	{
		pos_x = 176,
		pos_y = 1098,
		warscore = {
			{
				1,
				7
			},
			{
				2,
				10
			},
			{
				3,
				13
			}
		}
	}
}

function Config.GuildWarData.data_position_fun(slot0)
	slot1 = Config.GuildWarData.data_position[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildWarData.data_position[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildWarData.data_buff_length = 15
Config.GuildWarData.data_buff = {
	{
		lev = 1,
		attr = {
			{
				"atk_per",
				20
			},
			{
				"def_per",
				20
			},
			{
				"hp_max_per",
				20
			},
			{
				"speed",
				2
			}
		}
	},
	{
		lev = 2,
		attr = {
			{
				"atk_per",
				30
			},
			{
				"def_per",
				30
			},
			{
				"hp_max_per",
				30
			},
			{
				"speed",
				3
			}
		}
	},
	{
		lev = 3,
		attr = {
			{
				"atk_per",
				40
			},
			{
				"def_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"speed",
				4
			}
		}
	},
	{
		lev = 4,
		attr = {
			{
				"atk_per",
				50
			},
			{
				"def_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"speed",
				5
			}
		}
	},
	{
		lev = 5,
		attr = {
			{
				"atk_per",
				60
			},
			{
				"def_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"speed",
				6
			}
		}
	},
	{
		lev = 6,
		attr = {
			{
				"atk_per",
				70
			},
			{
				"def_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"speed",
				7
			}
		}
	},
	{
		lev = 7,
		attr = {
			{
				"atk_per",
				80
			},
			{
				"def_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"speed",
				8
			}
		}
	},
	{
		lev = 8,
		attr = {
			{
				"atk_per",
				90
			},
			{
				"def_per",
				90
			},
			{
				"hp_max_per",
				90
			},
			{
				"speed",
				9
			}
		}
	},
	{
		lev = 9,
		attr = {
			{
				"atk_per",
				100
			},
			{
				"def_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"speed",
				10
			}
		}
	},
	{
		lev = 10,
		attr = {
			{
				"atk_per",
				110
			},
			{
				"def_per",
				110
			},
			{
				"hp_max_per",
				110
			},
			{
				"speed",
				11
			}
		}
	},
	{
		lev = 11,
		attr = {
			{
				"atk_per",
				120
			},
			{
				"def_per",
				120
			},
			{
				"hp_max_per",
				120
			},
			{
				"speed",
				12
			}
		}
	},
	{
		lev = 12,
		attr = {
			{
				"atk_per",
				130
			},
			{
				"def_per",
				130
			},
			{
				"hp_max_per",
				130
			},
			{
				"speed",
				13
			}
		}
	},
	{
		lev = 13,
		attr = {
			{
				"atk_per",
				140
			},
			{
				"def_per",
				140
			},
			{
				"hp_max_per",
				140
			},
			{
				"speed",
				14
			}
		}
	},
	{
		lev = 14,
		attr = {
			{
				"atk_per",
				150
			},
			{
				"def_per",
				150
			},
			{
				"hp_max_per",
				150
			},
			{
				"speed",
				15
			}
		}
	},
	{
		lev = 15,
		attr = {
			{
				"atk_per",
				160
			},
			{
				"def_per",
				160
			},
			{
				"hp_max_per",
				160
			},
			{
				"speed",
				16
			}
		}
	}
}

function Config.GuildWarData.data_buff_fun(slot0)
	slot1 = Config.GuildWarData.data_buff[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildWarData.data_buff[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildWarData.data_explain_length = 3
Config.GuildWarData.data_explain = {
	{
		id = 1,
		title = "一、匹配规则",
		desc = [[
1.公会战每周会举行三场，开始时间分别在<div fontcolor=289b14>每周一、三、周五</div>的<div fontcolor=289b14>12:00</div>
2.<div fontcolor=289b14>3级以上</div>并且活跃人数为<div fontcolor=289b14>5人以上</div>的公会才允许参战
3.公会战匹配为跨服匹配，两两匹配实力接近的公会作为互相的对手
4.若匹配时出现轮空（匹配不到对手）的情况，则不能参加本次公会战]]
	},
	{
		id = 2,
		title = "二、战斗规则",
		desc = [[
1.在战斗开始后，公会成员可在阵地中选择并挑战敌方据点，挑战会消耗1点挑战次数，在本次公会战中每个参与者共有2点挑战次数
2.敌方据点中共3个难度可选择（<div fontcolor=289b14>简单、普通、困难</div>），难度越高敌方战斗属性越高（难度系数在挑战面板显示），同时挑战成功的<div fontcolor=289b14>奖励</div>、<div fontcolor=289b14>战绩</div>、<div fontcolor=289b14>星数</div>越高
3.挑战已被攻陷的<div fontcolor=289b14>据点废墟</div>，成功后不仅有挑战奖励，还可提升<div fontcolor=289b14>全公会增益Buff</div>（对全公会挑战者的属性加成）
4.挑战据点成功能获得<div fontcolor=289b14>较多战绩</div>，挑战废墟成功能获得<div fontcolor=289b14>5点战绩</div>，挑战失败固定获得<div fontcolor=289b14>1点战绩</div>
5.公会战持续<div fontcolor=289b14>8小时</div>，届时将统计双方的<div fontcolor=289b14>星数</div>并判定胜负（星数较高者为胜），同时根据赛果对双方参战公会和参战者发放奖励]]
	},
	{
		id = 3,
		title = "三、玩法奖励",
		desc = [[
1.挑战奖励：挑战据点可获得奖励，挑战成功奖励相对更丰厚，挑战失败也可获得少量奖励；奖励内容为<div fontcolor=289b14>公会贡献、贝里</div>，奖励在挑战战斗结束后获得
2.战绩奖励：取决于成员在公会内的战绩排行，排名越高奖励越丰厚，奖励在公会战结束后结算并通过邮件形式发放 
3.赛果奖励：根据赛果对胜败双方的参战者发放奖励，获胜一方的所有公会成员将获得公会内活跃人数对应的<div fontcolor=289b14>黄金宝箱</div>，失败一方则获得<div fontcolor=289b14>青铜宝箱</div>。请各位努力争取胜利！
4.公会宝库奖励：在公会战中取得胜利的一方将会获得公会宝库奖励，这部分奖励物品不会直接放入玩家的背包，而是放入公会宝库中成为可供玩家兑换的商品。公会宝库奖励分为固定掉落奖励和随机掉落奖励，固定掉落奖励为必定掉落，随机掉落奖励为从奖励池中随机抽取<div fontcolor=289b14>1</div>件物品掉落，奖励内容请详见“玩法奖励”。]]
	}
}

function Config.GuildWarData.data_explain_fun(slot0)
	slot1 = Config.GuildWarData.data_explain[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildWarData.data_explain[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildWarData.data_guard_power_length = 200
Config.GuildWarData.data_guard_power = {
	{
		power = 1567,
		lev = 1
	},
	{
		power = 1961,
		lev = 2
	},
	{
		power = 2347,
		lev = 3
	},
	{
		power = 2744,
		lev = 4
	},
	{
		power = 3167,
		lev = 5
	},
	{
		power = 3563,
		lev = 6
	},
	{
		power = 3958,
		lev = 7
	},
	{
		power = 4353,
		lev = 8
	},
	{
		power = 4749,
		lev = 9
	},
	{
		power = 6778,
		lev = 10
	},
	{
		power = 7674,
		lev = 11
	},
	{
		power = 8557,
		lev = 12
	},
	{
		power = 9512,
		lev = 13
	},
	{
		power = 10504,
		lev = 14
	},
	{
		power = 11531,
		lev = 15
	},
	{
		power = 12722,
		lev = 16
	},
	{
		power = 13992,
		lev = 17
	},
	{
		power = 15276,
		lev = 18
	},
	{
		power = 16604,
		lev = 19
	},
	{
		power = 18870,
		lev = 20
	},
	{
		power = 20421,
		lev = 21
	},
	{
		power = 22017,
		lev = 22
	},
	{
		power = 23660,
		lev = 23
	},
	{
		power = 25349,
		lev = 24
	},
	{
		power = 27108,
		lev = 25
	},
	{
		power = 28874,
		lev = 26
	},
	{
		power = 30719,
		lev = 27
	},
	{
		power = 32596,
		lev = 28
	},
	{
		power = 34489,
		lev = 29
	},
	{
		power = 37745,
		lev = 30
	},
	{
		power = 40199,
		lev = 31
	},
	{
		power = 42720,
		lev = 32
	},
	{
		power = 45262,
		lev = 33
	},
	{
		power = 47895,
		lev = 34
	},
	{
		power = 50528,
		lev = 35
	},
	{
		power = 53239,
		lev = 36
	},
	{
		power = 56011,
		lev = 37
	},
	{
		power = 58818,
		lev = 38
	},
	{
		power = 61675,
		lev = 39
	},
	{
		power = 66390,
		lev = 40
	},
	{
		power = 69567,
		lev = 41
	},
	{
		power = 72835,
		lev = 42
	},
	{
		power = 76146,
		lev = 43
	},
	{
		power = 79510,
		lev = 44
	},
	{
		power = 88406,
		lev = 45
	},
	{
		power = 91648,
		lev = 46
	},
	{
		power = 94935,
		lev = 47
	},
	{
		power = 98231,
		lev = 48
	},
	{
		power = 101613,
		lev = 49
	},
	{
		power = 111628,
		lev = 50
	},
	{
		power = 115629,
		lev = 51
	},
	{
		power = 119642,
		lev = 52
	},
	{
		power = 123723,
		lev = 53
	},
	{
		power = 127833,
		lev = 54
	},
	{
		power = 132028,
		lev = 55
	},
	{
		power = 136264,
		lev = 56
	},
	{
		power = 140539,
		lev = 57
	},
	{
		power = 144868,
		lev = 58
	},
	{
		power = 149244,
		lev = 59
	},
	{
		power = 156736,
		lev = 60
	},
	{
		power = 161504,
		lev = 61
	},
	{
		power = 166348,
		lev = 62
	},
	{
		power = 171214,
		lev = 63
	},
	{
		power = 176164,
		lev = 64
	},
	{
		power = 188359,
		lev = 65
	},
	{
		power = 193844,
		lev = 66
	},
	{
		power = 199392,
		lev = 67
	},
	{
		power = 205006,
		lev = 68
	},
	{
		power = 210679,
		lev = 69
	},
	{
		power = 220318,
		lev = 70
	},
	{
		power = 226508,
		lev = 71
	},
	{
		power = 232752,
		lev = 72
	},
	{
		power = 239046,
		lev = 73
	},
	{
		power = 245428,
		lev = 74
	},
	{
		power = 251917,
		lev = 75
	},
	{
		power = 258454,
		lev = 76
	},
	{
		power = 265029,
		lev = 77
	},
	{
		power = 271733,
		lev = 78
	},
	{
		power = 278500,
		lev = 79
	},
	{
		power = 289894,
		lev = 80
	},
	{
		power = 297157,
		lev = 81
	},
	{
		power = 304491,
		lev = 82
	},
	{
		power = 311925,
		lev = 83
	},
	{
		power = 319444,
		lev = 84
	},
	{
		power = 327014,
		lev = 85
	},
	{
		power = 335198,
		lev = 86
	},
	{
		power = 343459,
		lev = 87
	},
	{
		power = 351820,
		lev = 88
	},
	{
		power = 360263,
		lev = 89
	},
	{
		power = 374346,
		lev = 90
	},
	{
		power = 383433,
		lev = 91
	},
	{
		power = 392588,
		lev = 92
	},
	{
		power = 401861,
		lev = 93
	},
	{
		power = 411239,
		lev = 94
	},
	{
		power = 420739,
		lev = 95
	},
	{
		power = 430305,
		lev = 96
	},
	{
		power = 439974,
		lev = 97
	},
	{
		power = 449755,
		lev = 98
	},
	{
		power = 459650,
		lev = 99
	},
	{
		power = 476111,
		lev = 100
	},
	{
		power = 486661,
		lev = 101
	},
	{
		power = 497314,
		lev = 102
	},
	{
		power = 508102,
		lev = 103
	},
	{
		power = 518963,
		lev = 104
	},
	{
		power = 529953,
		lev = 105
	},
	{
		power = 536856,
		lev = 106
	},
	{
		power = 543724,
		lev = 107
	},
	{
		power = 550625,
		lev = 108
	},
	{
		power = 557530,
		lev = 109
	},
	{
		power = 571602,
		lev = 110
	},
	{
		power = 578927,
		lev = 111
	},
	{
		power = 586216,
		lev = 112
	},
	{
		power = 593563,
		lev = 113
	},
	{
		power = 600887,
		lev = 114
	},
	{
		power = 608196,
		lev = 115
	},
	{
		power = 615512,
		lev = 116
	},
	{
		power = 622817,
		lev = 117
	},
	{
		power = 630144,
		lev = 118
	},
	{
		power = 637481,
		lev = 119
	},
	{
		power = 652389,
		lev = 120
	},
	{
		power = 660152,
		lev = 121
	},
	{
		power = 667867,
		lev = 122
	},
	{
		power = 675630,
		lev = 123
	},
	{
		power = 683393,
		lev = 124
	},
	{
		power = 691126,
		lev = 125
	},
	{
		power = 698874,
		lev = 126
	},
	{
		power = 706596,
		lev = 127
	},
	{
		power = 714355,
		lev = 128
	},
	{
		power = 722124,
		lev = 129
	},
	{
		power = 737897,
		lev = 130
	},
	{
		power = 746075,
		lev = 131
	},
	{
		power = 754205,
		lev = 132
	},
	{
		power = 762372,
		lev = 133
	},
	{
		power = 770560,
		lev = 134
	},
	{
		power = 778689,
		lev = 135
	},
	{
		power = 786858,
		lev = 136
	},
	{
		power = 794999,
		lev = 137
	},
	{
		power = 803176,
		lev = 138
	},
	{
		power = 811340,
		lev = 139
	},
	{
		power = 828113,
		lev = 140
	},
	{
		power = 836700,
		lev = 141
	},
	{
		power = 845243,
		lev = 142
	},
	{
		power = 853832,
		lev = 143
	},
	{
		power = 862422,
		lev = 144
	},
	{
		power = 870974,
		lev = 145
	},
	{
		power = 879553,
		lev = 146
	},
	{
		power = 888100,
		lev = 147
	},
	{
		power = 896683,
		lev = 148
	},
	{
		power = 905266,
		lev = 149
	},
	{
		power = 923034,
		lev = 150
	},
	{
		power = 932035,
		lev = 151
	},
	{
		power = 941015,
		lev = 152
	},
	{
		power = 950030,
		lev = 153
	},
	{
		power = 959043,
		lev = 154
	},
	{
		power = 968023,
		lev = 155
	},
	{
		power = 976767,
		lev = 156
	},
	{
		power = 985496,
		lev = 157
	},
	{
		power = 994239,
		lev = 158
	},
	{
		power = 1002993,
		lev = 159
	},
	{
		power = 1021318,
		lev = 160
	},
	{
		power = 1030510,
		lev = 161
	},
	{
		power = 1039650,
		lev = 162
	},
	{
		power = 1048838,
		lev = 163
	},
	{
		power = 1058015,
		lev = 164
	},
	{
		power = 1067178,
		lev = 165
	},
	{
		power = 1076359,
		lev = 166
	},
	{
		power = 1085505,
		lev = 167
	},
	{
		power = 1094687,
		lev = 168
	},
	{
		power = 1103868,
		lev = 169
	},
	{
		power = 1123057,
		lev = 170
	},
	{
		power = 1132670,
		lev = 171
	},
	{
		power = 1142249,
		lev = 172
	},
	{
		power = 1151855,
		lev = 173
	},
	{
		power = 1161455,
		lev = 174
	},
	{
		power = 1171048,
		lev = 175
	},
	{
		power = 1180656,
		lev = 176
	},
	{
		power = 1190231,
		lev = 177
	},
	{
		power = 1199843,
		lev = 178
	},
	{
		power = 1209445,
		lev = 179
	},
	{
		power = 1229466,
		lev = 180
	},
	{
		power = 1239515,
		lev = 181
	},
	{
		power = 1249520,
		lev = 182
	},
	{
		power = 1259557,
		lev = 183
	},
	{
		power = 1269592,
		lev = 184
	},
	{
		power = 1279599,
		lev = 185
	},
	{
		power = 1289637,
		lev = 186
	},
	{
		power = 1299640,
		lev = 187
	},
	{
		power = 1309684,
		lev = 188
	},
	{
		power = 1319711,
		lev = 189
	},
	{
		power = 1340580,
		lev = 190
	},
	{
		power = 1351036,
		lev = 191
	},
	{
		power = 1361453,
		lev = 192
	},
	{
		power = 1371901,
		lev = 193
	},
	{
		power = 1382346,
		lev = 194
	},
	{
		power = 1392765,
		lev = 195
	},
	{
		power = 1403220,
		lev = 196
	},
	{
		power = 1413646,
		lev = 197
	},
	{
		power = 1424076,
		lev = 198
	},
	{
		power = 1434533,
		lev = 199
	},
	{
		power = 1456402,
		lev = 200
	}
}

function Config.GuildWarData.data_guard_power_fun(slot0)
	slot1 = Config.GuildWarData.data_guard_power[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildWarData.data_guard_power[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildWarData.data_box_award_length = 2
Config.GuildWarData.data_box_award = {
	{
		id = 1,
		award = {
			10,
			10,
			10,
			10
		}
	},
	{
		id = 2,
		award = {
			10,
			10,
			10,
			10
		}
	}
}

function Config.GuildWarData.data_box_award_fun(slot0)
	slot1 = Config.GuildWarData.data_box_award[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildWarData.data_box_award[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildWarData.data_marketplace_reward_length = 5
Config.GuildWarData.data_marketplace_reward = {
	{
		power_high = 10000000,
		power_low = 0,
		rand_reward = {
			{
				29905,
				20,
				350
			},
			{
				29905,
				30,
				395
			},
			{
				29905,
				50,
				85
			},
			{
				14001,
				1,
				170
			}
		},
		reward = {
			{
				10403,
				15
			},
			{
				10001,
				500
			},
			{
				37001,
				20
			}
		}
	},
	{
		power_high = 20000000,
		power_low = 10000000,
		rand_reward = {
			{
				29905,
				20,
				350
			},
			{
				29905,
				30,
				395
			},
			{
				29905,
				50,
				85
			},
			{
				14001,
				1,
				170
			}
		},
		reward = {
			{
				10403,
				15
			},
			{
				10001,
				500
			},
			{
				37001,
				20
			}
		}
	},
	{
		power_high = 30000000,
		power_low = 20000000,
		rand_reward = {
			{
				29905,
				20,
				350
			},
			{
				29905,
				30,
				395
			},
			{
				29905,
				50,
				85
			},
			{
				14001,
				1,
				170
			}
		},
		reward = {
			{
				10403,
				15
			},
			{
				10001,
				500
			},
			{
				37001,
				20
			}
		}
	},
	{
		power_high = 40000000,
		power_low = 30000000,
		rand_reward = {
			{
				29905,
				20,
				350
			},
			{
				29905,
				30,
				395
			},
			{
				29905,
				50,
				85
			},
			{
				14001,
				1,
				170
			}
		},
		reward = {
			{
				10403,
				15
			},
			{
				10001,
				500
			},
			{
				37001,
				20
			}
		}
	},
	{
		power_high = 999999999,
		power_low = 40000000,
		rand_reward = {
			{
				29905,
				20,
				350
			},
			{
				29905,
				30,
				395
			},
			{
				29905,
				50,
				85
			},
			{
				14001,
				1,
				170
			}
		},
		reward = {
			{
				10403,
				15
			},
			{
				10001,
				500
			},
			{
				37001,
				20
			}
		}
	}
}
