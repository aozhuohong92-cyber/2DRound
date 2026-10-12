Config = Config or {}
Config.PlanesData = Config.PlanesData or {}
Config.PlanesData.data_const_length = 36
Config.PlanesData.data_const = {
	planes_start_unixtime = {
		desc = "起始时间",
		val = {
			{
				2019,
				12,
				17
			},
			{
				5,
				0,
				0
			}
		}
	},
	planes_update_day = {
		val = 2,
		desc = "刷新天数"
	},
	planes_filter_condition = {
		desc = "",
		val = {
			1,
			1,
			0
		}
	},
	planes_calculating_coefficient = {
		val = 5000,
		desc = "玩家匹配战力取值系数1"
	},
	planes_minimum_effectiveness = {
		val = 10000,
		desc = "玩家匹配战力取值系数2（对应公式中的副本最低战力）"
	},
	planes_open_lev = {
		val = 30,
		desc = "玩法达30级开启"
	},
	planes_number_player = {
		val = 10,
		desc = "租借英雄匹配玩家数量"
	},
	planes_correction_factor = {
		val = 1,
		desc = "租借英雄匹配英雄修正系数"
	},
	planes_combat_section = {
		desc = "租借英雄玩家战力匹配区间",
		val = {
			850,
			1150
		}
	},
	planes_rule = {
		val = 0,
		desc = [[
1.位面开启时间为00:00，每48小时重置1次，重置前10分钟玩家将不能触发事件。
2.重置后所有<div fontcolor=#d95014>事件将重新生成</div>，本轮累计获得的<div fontcolor=#d95014>遗物将消失</div>。
3.玩家可以前往与当前格子<div fontcolor=#d95014>相邻的格子</div>进行探索。
4.玩家每到达一个格子，同一行的其它格子将会被摧毁，请谨慎选择路线。
5.击败位面守卫获得的<div fontcolor=#d95014>征战勋章</div>可以在<div fontcolor=#d95014>征战商店</div>中使用，兑换相应商品。
6.遗物是一种特殊物品，只有在位面中可以生效和查看，不会对迷宫外的战斗有效果。
7.更多奖励意味着更高的风险，通过<div fontcolor=#d95014>雇佣</div>借助好友的力量，能使旅途变得更平坦。]]
	},
	planes_skip_battle_lev = {
		val = 80,
		desc = "玩家到达80级开启"
	},
	planes_upper_limit_lev = {
		val = 31,
		desc = "守卫匹配等级上限（弃用字段）"
	},
	planes_lower_limit_lev = {
		val = 31,
		desc = "守卫匹配等级下限（弃用字段）"
	},
	planes_forever_rock_itemid = {
		val = 10034,
		desc = "永恒晶石消耗的itemid"
	},
	planes_forever_dock_desc = {
		val = 0,
		desc = "1.永恒晶石可以让所有英雄（包括雇佣的英雄和阵亡英雄）<div fontcolor=#d95014>恢复全部生命</div>\n2.通过<div fontcolor=#d95014>竞技积分商店和活动</div>可以获得永恒晶石\n3.未使用的永恒晶石不会随着位面的重置而消失"
	},
	planes_first_time_tips = {
		desc = "本次位面征战遇到的敌人，<div fontcolor=#d95014>不会随玩家强弱变化</div>",
		val = {
			1001
		}
	},
	planes_max_floor = {
		val = 3,
		desc = "最大层数"
	},
	planes_first_map_max_power = {
		val = 300000,
		desc = "使用第一地图的最小战力"
	},
	planes_difficult_max_power = {
		val = 300000,
		desc = "开启选择难度的最小战力"
	},
	planes_faction_weight = {
		val = 300,
		desc = "派系权重增加值"
	},
	planes_public_weight = {
		val = 0.3,
		desc = "公共权重增加值"
	},
	planes_minimum_num = {
		val = 30,
		desc = "保底机器人抽取最低数量"
	},
	planes_buff_partner_num = {
		val = 7,
		desc = "玩家英雄背包战力前7名"
	},
	planes_buff_coefficient = {
		val = 600,
		desc = "修正系数0.6"
	},
	planes_difficult_limit_lev = {
		val = 300,
		desc = "困难难度开启的解锁条件：试练塔n层"
	},
	planes_task_limit_lev = {
		val = 20,
		desc = "征战之证解锁条件：试练塔n层"
	},
	planes_reward_rate = {
		desc = "奖励系数 {简单,困难}  千分比",
		val = {
			1000,
			2000
		}
	},
	planes_challenge_rate = {
		desc = "难度系数 {简单,困难}  千分比",
		val = {
			1000,
			1500
		}
	},
	planes_feat_list = {
		desc = "通关成就列表",
		val = {
			46800,
			46810,
			46820,
			46830,
			46840
		}
	},
	planes_min_combat = {
		val = 2000,
		desc = "雇佣时，最低匹配战力（个人最高战力/5不会小于该值）"
	},
	planes_lev_battle_min = {
		val = 35,
		desc = "守卫等级匹配下限"
	},
	planes_lev_battle_max = {
		val = 20,
		desc = "守卫等级匹配上限"
	},
	reborn_desc = {
		val = 1,
		desc = "可以随机复活一位已阵亡的英雄并回复其<div fontcolor=289b14>70%</div>的生命值，若当前无阵亡英雄则回复生命值最低的一位英雄<div fontcolor=289b14>100%</div>的生命"
	},
	cure_desc = {
		val = 1,
		desc = "浸泡泉水可使所有存活的英雄恢复<div fontcolor=289b14>30%</div>的生命值，泉水仅可使用一次"
	},
	planes_spar_atk_radio = {
		val = 1300,
		desc = "永恒晶石加成比例（千分比）"
	},
	formation_role_13_start_num = {
		val = 3,
		desc = "允许队伍中拥有的13星英雄最大数量"
	}
}

function Config.PlanesData.data_const_fun(slot0)
	slot1 = Config.PlanesData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PlanesData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PlanesData.data_customs_length = 4
Config.PlanesData.data_customs = {
	[2001] = {
		first_map_id = 1001,
		floor = 1,
		map_id = 2001,
		difficulty = 1,
		res_id = "11"
	},
	[2002] = {
		first_map_id = 1002,
		floor = 2,
		map_id = 2002,
		difficulty = 1,
		res_id = "12"
	},
	[2003] = {
		first_map_id = 1003,
		floor = 3,
		map_id = 2003,
		difficulty = 1,
		res_id = "13"
	},
	[2004] = {
		first_map_id = 1004,
		floor = 3,
		map_id = 2004,
		difficulty = 2,
		res_id = "13"
	}
}

function Config.PlanesData.data_customs_fun(slot0)
	slot1 = Config.PlanesData.data_customs[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PlanesData.data_customs[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PlanesData.data_evt_info_length = 446
Config.PlanesData.data_evt_info = {
	[0] = {
		name = "",
		type = 0,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 0,
		group_id = 0,
		ext = {},
		reward_list = {},
		res_1 = {},
		res_2 = {},
		offset = {},
		reward = {}
	},
	[710201] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 710201,
		group_id = 2,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10101
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1001
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710202] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 710202,
		group_id = 2,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10201
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1101
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710203] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710203,
		group_id = 2,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[710204] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710204,
		group_id = 2,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710205] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710205,
		group_id = 2,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710206] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710206,
		group_id = 2,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710301] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 710301,
		group_id = 3,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10102
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1002
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710302] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 710302,
		group_id = 3,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10202
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1102
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710303] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710303,
		group_id = 3,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[710304] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710304,
		group_id = 3,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710305] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710305,
		group_id = 3,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710306] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710306,
		group_id = 3,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710401] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 710401,
		group_id = 4,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10103
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1003
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710402] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 710402,
		group_id = 4,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10203
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1103
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710403] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710403,
		group_id = 4,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[710404] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710404,
		group_id = 4,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710405] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710405,
		group_id = 4,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710406] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710406,
		group_id = 4,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710501] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 710501,
		group_id = 5,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10104
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1004
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710502] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 710502,
		group_id = 5,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10204
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1104
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710503] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710503,
		group_id = 5,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[710504] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710504,
		group_id = 5,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710505] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710505,
		group_id = 5,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710506] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710506,
		group_id = 5,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710601] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 710601,
		group_id = 6,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10105
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1005
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710602] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 710602,
		group_id = 6,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10205
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1105
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710603] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710603,
		group_id = 6,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[710604] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710604,
		group_id = 6,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710605] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710605,
		group_id = 6,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710606] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710606,
		group_id = 6,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710701] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 710701,
		group_id = 7,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10106
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1006
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710702] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 710702,
		group_id = 7,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10206
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1106
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710703] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710703,
		group_id = 7,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[710704] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710704,
		group_id = 7,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710705] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710705,
		group_id = 7,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710706] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710706,
		group_id = 7,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710801] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 710801,
		group_id = 8,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10107
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1007
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710802] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 710802,
		group_id = 8,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10207
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1107
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710803] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710803,
		group_id = 8,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[710804] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710804,
		group_id = 8,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710805] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710805,
		group_id = 8,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710806] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710806,
		group_id = 8,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710901] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 710901,
		group_id = 9,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10108
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1008
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710902] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 710902,
		group_id = 9,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10208
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1108
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710903] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710903,
		group_id = 9,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[710904] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710904,
		group_id = 9,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710905] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710905,
		group_id = 9,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[710906] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 710906,
		group_id = 9,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[711001] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 711001,
		group_id = 10,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1008
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[711002] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 711002,
		group_id = 10,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1108
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[711003] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 711003,
		group_id = 10,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[711004] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 711004,
		group_id = 10,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[711005] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 711005,
		group_id = 10,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[711006] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 711006,
		group_id = 10,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[711101] = {
		name = "首领怪物",
		type = 1,
		reversal = 0,
		exchange_id = 3023,
		is_hide = 1,
		id = 711101,
		group_id = 11,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				30101
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1009
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720201] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 720201,
		group_id = 12,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10111
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2001
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720202] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 720202,
		group_id = 12,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10211
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2101
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720203] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720203,
		group_id = 12,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[720204] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720204,
		group_id = 12,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720205] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720205,
		group_id = 12,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720206] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720206,
		group_id = 12,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720301] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 720301,
		group_id = 13,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10112
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2002
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720302] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 720302,
		group_id = 13,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10212
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2102
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720303] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720303,
		group_id = 13,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[720304] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720304,
		group_id = 13,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720305] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720305,
		group_id = 13,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720306] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720306,
		group_id = 13,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720401] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 720401,
		group_id = 14,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2002
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720402] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 720402,
		group_id = 14,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2102
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720403] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720403,
		group_id = 14,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[720404] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720404,
		group_id = 14,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720405] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720405,
		group_id = 14,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720406] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720406,
		group_id = 14,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720501] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 720501,
		group_id = 15,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10113
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2003
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720502] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 720502,
		group_id = 15,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10213
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2103
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720503] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720503,
		group_id = 15,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[720504] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720504,
		group_id = 15,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720505] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720505,
		group_id = 15,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720506] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720506,
		group_id = 15,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720601] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 720601,
		group_id = 16,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10114
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2004
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720602] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 720602,
		group_id = 16,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10214
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2104
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720603] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720603,
		group_id = 16,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[720604] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720604,
		group_id = 16,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720605] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720605,
		group_id = 16,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720606] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720606,
		group_id = 16,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720701] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 720701,
		group_id = 17,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10115
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2005
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720702] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 720702,
		group_id = 17,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10215
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2105
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720703] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720703,
		group_id = 17,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[720704] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720704,
		group_id = 17,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720705] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720705,
		group_id = 17,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720706] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720706,
		group_id = 17,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720801] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 720801,
		group_id = 18,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10116
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2006
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720802] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 720802,
		group_id = 18,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10216
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2106
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720803] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720803,
		group_id = 18,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[720804] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720804,
		group_id = 18,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720805] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720805,
		group_id = 18,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720806] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720806,
		group_id = 18,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720901] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 720901,
		group_id = 19,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10117
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2007
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720902] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 720902,
		group_id = 19,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10217
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2107
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720903] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720903,
		group_id = 19,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[720904] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720904,
		group_id = 19,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720905] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720905,
		group_id = 19,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[720906] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 720906,
		group_id = 19,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[721001] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 721001,
		group_id = 20,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2007
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[721002] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 721002,
		group_id = 20,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2107
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[721003] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 721003,
		group_id = 20,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[721004] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 721004,
		group_id = 20,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[721005] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 721005,
		group_id = 20,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[721006] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 721006,
		group_id = 20,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[721101] = {
		name = "首领怪物",
		type = 1,
		reversal = 0,
		exchange_id = 3023,
		is_hide = 1,
		id = 721101,
		group_id = 21,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				30102
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			2008
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730201] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 730201,
		group_id = 22,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3001
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730202] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 730202,
		group_id = 22,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3101
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730203] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730203,
		group_id = 22,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[730204] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730204,
		group_id = 22,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730205] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730205,
		group_id = 22,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730206] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730206,
		group_id = 22,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730301] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 730301,
		group_id = 23,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10121
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3001
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730302] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 730302,
		group_id = 23,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10221
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3101
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730303] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730303,
		group_id = 23,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[730304] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730304,
		group_id = 23,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730305] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730305,
		group_id = 23,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730306] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730306,
		group_id = 23,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730401] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 730401,
		group_id = 24,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3002
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730402] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 730402,
		group_id = 24,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3102
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730403] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730403,
		group_id = 24,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[730404] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730404,
		group_id = 24,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730405] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730405,
		group_id = 24,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730406] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730406,
		group_id = 24,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730501] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 730501,
		group_id = 25,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10122
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3002
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730502] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 730502,
		group_id = 25,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10222
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3102
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730503] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730503,
		group_id = 25,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[730504] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730504,
		group_id = 25,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730505] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730505,
		group_id = 25,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730506] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730506,
		group_id = 25,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730601] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 730601,
		group_id = 26,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10123
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3003
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730602] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 730602,
		group_id = 26,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10223
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3103
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730603] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730603,
		group_id = 26,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[730604] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730604,
		group_id = 26,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730605] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730605,
		group_id = 26,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730606] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730606,
		group_id = 26,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730701] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 730701,
		group_id = 27,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10124
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3004
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730702] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 730702,
		group_id = 27,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10224
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3104
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730703] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730703,
		group_id = 27,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[730704] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730704,
		group_id = 27,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730705] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730705,
		group_id = 27,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730706] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730706,
		group_id = 27,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730801] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 730801,
		group_id = 28,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10125
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3005
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730802] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 730802,
		group_id = 28,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10225
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3105
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730803] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730803,
		group_id = 28,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[730804] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730804,
		group_id = 28,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730805] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730805,
		group_id = 28,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730806] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730806,
		group_id = 28,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730901] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 730901,
		group_id = 29,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10126
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3006
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730902] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 730902,
		group_id = 29,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				10226
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3106
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730903] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730903,
		group_id = 29,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[730904] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730904,
		group_id = 29,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730905] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730905,
		group_id = 29,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[730906] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 730906,
		group_id = 29,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[731001] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 731001,
		group_id = 30,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3006
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[731002] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 731002,
		group_id = 30,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3106
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[731003] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 731003,
		group_id = 30,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[731004] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 731004,
		group_id = 30,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[731005] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 731005,
		group_id = 30,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[731006] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 731006,
		group_id = 30,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[731101] = {
		name = "首领怪物",
		type = 1,
		reversal = 0,
		exchange_id = 0,
		is_hide = 1,
		id = 731101,
		group_id = 31,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				30103
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3007
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740201] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 740201,
		group_id = 32,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3001
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740202] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 740202,
		group_id = 32,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3101
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740203] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740203,
		group_id = 32,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[740204] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740204,
		group_id = 32,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740205] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740205,
		group_id = 32,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740206] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740206,
		group_id = 32,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740301] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 740301,
		group_id = 33,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3001
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740302] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 740302,
		group_id = 33,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3101
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740303] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740303,
		group_id = 33,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[740304] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740304,
		group_id = 33,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740305] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740305,
		group_id = 33,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740306] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740306,
		group_id = 33,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740401] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 740401,
		group_id = 34,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3002
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740402] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 740402,
		group_id = 34,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3102
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740403] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740403,
		group_id = 34,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[740404] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740404,
		group_id = 34,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740405] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740405,
		group_id = 34,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740406] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740406,
		group_id = 34,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740501] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 740501,
		group_id = 35,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3002
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740502] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 740502,
		group_id = 35,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3102
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740503] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740503,
		group_id = 35,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[740504] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740504,
		group_id = 35,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740505] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740505,
		group_id = 35,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740506] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740506,
		group_id = 35,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740601] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 740601,
		group_id = 36,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3003
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740602] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 740602,
		group_id = 36,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3103
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740603] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740603,
		group_id = 36,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[740604] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740604,
		group_id = 36,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740605] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740605,
		group_id = 36,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740606] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740606,
		group_id = 36,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740701] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 740701,
		group_id = 37,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3004
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740702] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 740702,
		group_id = 37,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3104
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740703] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740703,
		group_id = 37,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[740704] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740704,
		group_id = 37,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740705] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740705,
		group_id = 37,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740706] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740706,
		group_id = 37,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740801] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 740801,
		group_id = 38,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3005
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740802] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 740802,
		group_id = 38,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3105
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740803] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740803,
		group_id = 38,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[740804] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740804,
		group_id = 38,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740805] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740805,
		group_id = 38,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740806] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740806,
		group_id = 38,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740901] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 740901,
		group_id = 39,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3006
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740902] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 740902,
		group_id = 39,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3106
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740903] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740903,
		group_id = 39,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[740904] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740904,
		group_id = 39,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740905] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740905,
		group_id = 39,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740906] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740906,
		group_id = 39,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[740907] = {
		name = "藏宝洞穴",
		type = 1,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 740907,
		group_id = 39,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			4001
		},
		res_1 = {
			1,
			3002
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[741001] = {
		name = "守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 741001,
		group_id = 40,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3006
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[741002] = {
		name = "高级守卫",
		type = 1,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 741002,
		group_id = 40,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3106
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[741003] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 741003,
		group_id = 40,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[741004] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 741004,
		group_id = 40,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[741005] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 741005,
		group_id = 40,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[741006] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 741006,
		group_id = 40,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[741101] = {
		name = "首领怪物",
		type = 1,
		reversal = 0,
		exchange_id = 0,
		is_hide = 1,
		id = 741101,
		group_id = 41,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40301
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			3007
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810201] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 810201,
		group_id = 2,
		ext = {
			{
				"group",
				1101
			}
		},
		reward_list = {
			1001
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[810202] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 810202,
		group_id = 2,
		ext = {
			{
				"group",
				2101
			}
		},
		reward_list = {
			1101
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[810203] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810203,
		group_id = 2,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[810204] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810204,
		group_id = 2,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810205] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810205,
		group_id = 2,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810206] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810206,
		group_id = 2,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810301] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 810301,
		group_id = 3,
		ext = {
			{
				"group",
				1102
			}
		},
		reward_list = {
			1002
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[810302] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 810302,
		group_id = 3,
		ext = {
			{
				"group",
				2102
			}
		},
		reward_list = {
			1102
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[810303] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810303,
		group_id = 3,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[810304] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810304,
		group_id = 3,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810305] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810305,
		group_id = 3,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810306] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810306,
		group_id = 3,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810401] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 810401,
		group_id = 4,
		ext = {
			{
				"group",
				1103
			}
		},
		reward_list = {
			1003
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[810402] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 810402,
		group_id = 4,
		ext = {
			{
				"group",
				2103
			}
		},
		reward_list = {
			1103
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[810403] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810403,
		group_id = 4,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[810404] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810404,
		group_id = 4,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810405] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810405,
		group_id = 4,
		ext = {
			{
				"num",
				4
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810406] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810406,
		group_id = 4,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810501] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 810501,
		group_id = 5,
		ext = {
			{
				"group",
				1104
			}
		},
		reward_list = {
			1004
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[810502] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 810502,
		group_id = 5,
		ext = {
			{
				"group",
				2104
			}
		},
		reward_list = {
			1104
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[810503] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810503,
		group_id = 5,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[810504] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810504,
		group_id = 5,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810505] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810505,
		group_id = 5,
		ext = {
			{
				"num",
				4
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810506] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810506,
		group_id = 5,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810601] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 810601,
		group_id = 6,
		ext = {
			{
				"group",
				1103
			}
		},
		reward_list = {
			1005
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[810602] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 810602,
		group_id = 6,
		ext = {
			{
				"group",
				2103
			}
		},
		reward_list = {
			1105
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[810603] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810603,
		group_id = 6,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[810604] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810604,
		group_id = 6,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810605] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810605,
		group_id = 6,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810606] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810606,
		group_id = 6,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810701] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 810701,
		group_id = 7,
		ext = {
			{
				"group",
				1104
			}
		},
		reward_list = {
			1006
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[810702] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 810702,
		group_id = 7,
		ext = {
			{
				"group",
				2104
			}
		},
		reward_list = {
			1106
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[810703] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810703,
		group_id = 7,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[810704] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810704,
		group_id = 7,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810705] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810705,
		group_id = 7,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810706] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810706,
		group_id = 7,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810801] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 810801,
		group_id = 8,
		ext = {
			{
				"group",
				1105
			}
		},
		reward_list = {
			1007
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[810802] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 810802,
		group_id = 8,
		ext = {
			{
				"group",
				2105
			}
		},
		reward_list = {
			1107
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[810803] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810803,
		group_id = 8,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[810804] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810804,
		group_id = 8,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810805] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810805,
		group_id = 8,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810806] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810806,
		group_id = 8,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810901] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 810901,
		group_id = 9,
		ext = {
			{
				"group",
				1106
			}
		},
		reward_list = {
			1008
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[810902] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 810902,
		group_id = 9,
		ext = {
			{
				"group",
				2106
			}
		},
		reward_list = {
			1108
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[810903] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810903,
		group_id = 9,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[810904] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810904,
		group_id = 9,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810905] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810905,
		group_id = 9,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[810906] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 810906,
		group_id = 9,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[811001] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 811001,
		group_id = 10,
		ext = {
			{
				"group",
				1106
			}
		},
		reward_list = {
			1008
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[811002] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 811002,
		group_id = 10,
		ext = {
			{
				"group",
				2106
			}
		},
		reward_list = {
			1108
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[811003] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 811003,
		group_id = 10,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[811004] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 811004,
		group_id = 10,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[811005] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 811005,
		group_id = 10,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				2
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[811006] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 811006,
		group_id = 10,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[811101] = {
		name = "首领怪物",
		type = 1,
		reversal = 0,
		exchange_id = 3023,
		is_hide = 1,
		id = 811101,
		group_id = 11,
		ext = {
			{
				"radio",
				600
			},
			{
				"group",
				40101
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1000
				}
			}
		},
		reward_list = {
			1009
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820201] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 820201,
		group_id = 12,
		ext = {
			{
				"group",
				1201
			}
		},
		reward_list = {
			2001
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[820202] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 820202,
		group_id = 12,
		ext = {
			{
				"group",
				2201
			}
		},
		reward_list = {
			2101
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[820203] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820203,
		group_id = 12,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[820204] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820204,
		group_id = 12,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820205] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820205,
		group_id = 12,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820206] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820206,
		group_id = 12,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820301] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 820301,
		group_id = 13,
		ext = {
			{
				"group",
				1202
			}
		},
		reward_list = {
			2002
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[820302] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 820302,
		group_id = 13,
		ext = {
			{
				"group",
				2202
			}
		},
		reward_list = {
			2102
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[820303] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820303,
		group_id = 13,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[820304] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820304,
		group_id = 13,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820305] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820305,
		group_id = 13,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820306] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820306,
		group_id = 13,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820401] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 820401,
		group_id = 14,
		ext = {
			{
				"group",
				1202
			}
		},
		reward_list = {
			2002
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[820402] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 820402,
		group_id = 14,
		ext = {
			{
				"group",
				2202
			}
		},
		reward_list = {
			2102
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[820403] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820403,
		group_id = 14,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[820404] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820404,
		group_id = 14,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820405] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820405,
		group_id = 14,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820406] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820406,
		group_id = 14,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820501] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 820501,
		group_id = 15,
		ext = {
			{
				"group",
				1203
			}
		},
		reward_list = {
			2003
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[820502] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 820502,
		group_id = 15,
		ext = {
			{
				"group",
				2203
			}
		},
		reward_list = {
			2103
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[820503] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820503,
		group_id = 15,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[820504] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820504,
		group_id = 15,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820505] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820505,
		group_id = 15,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820506] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820506,
		group_id = 15,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820601] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 820601,
		group_id = 16,
		ext = {
			{
				"group",
				1204
			}
		},
		reward_list = {
			2004
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[820602] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 820602,
		group_id = 16,
		ext = {
			{
				"group",
				2204
			}
		},
		reward_list = {
			2104
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[820603] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820603,
		group_id = 16,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[820604] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820604,
		group_id = 16,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820605] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820605,
		group_id = 16,
		ext = {
			{
				"num",
				4
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820606] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820606,
		group_id = 16,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820701] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 820701,
		group_id = 17,
		ext = {
			{
				"group",
				1205
			}
		},
		reward_list = {
			2005
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[820702] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 820702,
		group_id = 17,
		ext = {
			{
				"group",
				2205
			}
		},
		reward_list = {
			2105
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[820703] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820703,
		group_id = 17,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[820704] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820704,
		group_id = 17,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820705] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820705,
		group_id = 17,
		ext = {
			{
				"num",
				4
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820706] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820706,
		group_id = 17,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820801] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 820801,
		group_id = 18,
		ext = {
			{
				"group",
				1204
			}
		},
		reward_list = {
			2006
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[820802] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 820802,
		group_id = 18,
		ext = {
			{
				"group",
				2204
			}
		},
		reward_list = {
			2106
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[820803] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820803,
		group_id = 18,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[820804] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820804,
		group_id = 18,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820805] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820805,
		group_id = 18,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820806] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820806,
		group_id = 18,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820901] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 820901,
		group_id = 19,
		ext = {
			{
				"group",
				1205
			}
		},
		reward_list = {
			2007
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[820902] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 820902,
		group_id = 19,
		ext = {
			{
				"group",
				2205
			}
		},
		reward_list = {
			2107
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[820903] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820903,
		group_id = 19,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[820904] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820904,
		group_id = 19,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820905] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820905,
		group_id = 19,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[820906] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 820906,
		group_id = 19,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[821001] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 821001,
		group_id = 20,
		ext = {
			{
				"group",
				1205
			}
		},
		reward_list = {
			2007
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[821002] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 821002,
		group_id = 20,
		ext = {
			{
				"group",
				2205
			}
		},
		reward_list = {
			2107
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[821003] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 821003,
		group_id = 20,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[821004] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 821004,
		group_id = 20,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[821005] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 821005,
		group_id = 20,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[821006] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 821006,
		group_id = 20,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[821101] = {
		name = "首领怪物",
		type = 1,
		reversal = 0,
		exchange_id = 3023,
		is_hide = 1,
		id = 821101,
		group_id = 21,
		ext = {
			{
				"radio",
				950
			},
			{
				"group",
				40101
			},
			{
				"strength",
				1300,
				{
					"hp_max_per",
					1560
				},
				{
					"atk_per",
					1040
				}
			}
		},
		reward_list = {
			2008
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830201] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 830201,
		group_id = 22,
		ext = {
			{
				"group",
				1311
			}
		},
		reward_list = {
			3001
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[830202] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 830202,
		group_id = 22,
		ext = {
			{
				"group",
				2311
			}
		},
		reward_list = {
			3101
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[830203] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830203,
		group_id = 22,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[830204] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830204,
		group_id = 22,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830205] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830205,
		group_id = 22,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830206] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830206,
		group_id = 22,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830301] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 830301,
		group_id = 23,
		ext = {
			{
				"group",
				1311
			}
		},
		reward_list = {
			3001
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[830302] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 830302,
		group_id = 23,
		ext = {
			{
				"group",
				2311
			}
		},
		reward_list = {
			3101
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[830303] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830303,
		group_id = 23,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[830304] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830304,
		group_id = 23,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830305] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830305,
		group_id = 23,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830306] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830306,
		group_id = 23,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830401] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 830401,
		group_id = 24,
		ext = {
			{
				"group",
				1311
			}
		},
		reward_list = {
			3002
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[830402] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 830402,
		group_id = 24,
		ext = {
			{
				"group",
				2311
			}
		},
		reward_list = {
			3102
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[830403] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830403,
		group_id = 24,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[830404] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830404,
		group_id = 24,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830405] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830405,
		group_id = 24,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830406] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830406,
		group_id = 24,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830501] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 830501,
		group_id = 25,
		ext = {
			{
				"group",
				1312
			}
		},
		reward_list = {
			3002
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[830502] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 830502,
		group_id = 25,
		ext = {
			{
				"group",
				2312
			}
		},
		reward_list = {
			3102
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[830503] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830503,
		group_id = 25,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[830504] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830504,
		group_id = 25,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830505] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830505,
		group_id = 25,
		ext = {
			{
				"num",
				4
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830506] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830506,
		group_id = 25,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830601] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 830601,
		group_id = 26,
		ext = {
			{
				"group",
				1312
			}
		},
		reward_list = {
			3003
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[830602] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 830602,
		group_id = 26,
		ext = {
			{
				"group",
				2312
			}
		},
		reward_list = {
			3103
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[830603] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830603,
		group_id = 26,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[830604] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830604,
		group_id = 26,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830605] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830605,
		group_id = 26,
		ext = {
			{
				"num",
				4
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830606] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830606,
		group_id = 26,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830701] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 830701,
		group_id = 27,
		ext = {
			{
				"group",
				1312
			}
		},
		reward_list = {
			3004
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[830702] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 830702,
		group_id = 27,
		ext = {
			{
				"group",
				2312
			}
		},
		reward_list = {
			3104
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[830703] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830703,
		group_id = 27,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[830704] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830704,
		group_id = 27,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830705] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830705,
		group_id = 27,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830706] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830706,
		group_id = 27,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830801] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 830801,
		group_id = 28,
		ext = {
			{
				"group",
				1313
			}
		},
		reward_list = {
			3005
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[830802] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 830802,
		group_id = 28,
		ext = {
			{
				"group",
				2313
			}
		},
		reward_list = {
			3105
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[830803] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830803,
		group_id = 28,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[830804] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830804,
		group_id = 28,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830805] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830805,
		group_id = 28,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830806] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830806,
		group_id = 28,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830901] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 830901,
		group_id = 29,
		ext = {
			{
				"group",
				1314
			}
		},
		reward_list = {
			3006
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[830902] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 830902,
		group_id = 29,
		ext = {
			{
				"group",
				2314
			}
		},
		reward_list = {
			3106
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[830903] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830903,
		group_id = 29,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[830904] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830904,
		group_id = 29,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830905] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830905,
		group_id = 29,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[830906] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 830906,
		group_id = 29,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[831001] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 831001,
		group_id = 30,
		ext = {
			{
				"group",
				1314
			}
		},
		reward_list = {
			3006
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[831002] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 831002,
		group_id = 30,
		ext = {
			{
				"group",
				2314
			}
		},
		reward_list = {
			3106
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[831003] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 831003,
		group_id = 30,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[831004] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 831004,
		group_id = 30,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[831005] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 831005,
		group_id = 30,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[831006] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 831006,
		group_id = 30,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[831101] = {
		name = "首领怪物",
		type = 1,
		reversal = 0,
		exchange_id = 0,
		is_hide = 1,
		id = 831101,
		group_id = 31,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40102
			},
			{
				"strength",
				1500,
				{
					"hp_max_per",
					1800
				},
				{
					"atk_per",
					1200
				}
			}
		},
		reward_list = {
			3007
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840201] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 840201,
		group_id = 32,
		ext = {
			{
				"group",
				1321
			}
		},
		reward_list = {
			3001
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[840202] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 840202,
		group_id = 32,
		ext = {
			{
				"group",
				2321
			}
		},
		reward_list = {
			3101
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[840203] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840203,
		group_id = 32,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[840204] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840204,
		group_id = 32,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840205] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840205,
		group_id = 32,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840206] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840206,
		group_id = 32,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840301] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 840301,
		group_id = 33,
		ext = {
			{
				"group",
				1321
			}
		},
		reward_list = {
			3001
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[840302] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 840302,
		group_id = 33,
		ext = {
			{
				"group",
				2321
			}
		},
		reward_list = {
			3101
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[840303] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840303,
		group_id = 33,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[840304] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840304,
		group_id = 33,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840305] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840305,
		group_id = 33,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840306] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840306,
		group_id = 33,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840401] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 840401,
		group_id = 34,
		ext = {
			{
				"group",
				1321
			}
		},
		reward_list = {
			3002
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[840402] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 840402,
		group_id = 34,
		ext = {
			{
				"group",
				2321
			}
		},
		reward_list = {
			3102
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[840403] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840403,
		group_id = 34,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[840404] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840404,
		group_id = 34,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840405] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840405,
		group_id = 34,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840406] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840406,
		group_id = 34,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840501] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 840501,
		group_id = 35,
		ext = {
			{
				"group",
				1322
			}
		},
		reward_list = {
			3002
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[840502] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 840502,
		group_id = 35,
		ext = {
			{
				"group",
				2322
			}
		},
		reward_list = {
			3102
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[840503] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840503,
		group_id = 35,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[840504] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840504,
		group_id = 35,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840505] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840505,
		group_id = 35,
		ext = {
			{
				"num",
				4
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840506] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840506,
		group_id = 35,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840601] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 840601,
		group_id = 36,
		ext = {
			{
				"group",
				1322
			}
		},
		reward_list = {
			3003
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[840602] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 840602,
		group_id = 36,
		ext = {
			{
				"group",
				2322
			}
		},
		reward_list = {
			3103
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[840603] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840603,
		group_id = 36,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[840604] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840604,
		group_id = 36,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840605] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840605,
		group_id = 36,
		ext = {
			{
				"num",
				4
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840606] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840606,
		group_id = 36,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840701] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 840701,
		group_id = 37,
		ext = {
			{
				"group",
				1322
			}
		},
		reward_list = {
			3004
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[840702] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 840702,
		group_id = 37,
		ext = {
			{
				"group",
				2322
			}
		},
		reward_list = {
			3104
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[840703] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840703,
		group_id = 37,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[840704] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840704,
		group_id = 37,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840705] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840705,
		group_id = 37,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840706] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840706,
		group_id = 37,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840801] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 840801,
		group_id = 38,
		ext = {
			{
				"group",
				1323
			}
		},
		reward_list = {
			3005
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[840802] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 840802,
		group_id = 38,
		ext = {
			{
				"group",
				2323
			}
		},
		reward_list = {
			3105
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[840803] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840803,
		group_id = 38,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[840804] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840804,
		group_id = 38,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840805] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840805,
		group_id = 38,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840806] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840806,
		group_id = 38,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840901] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 840901,
		group_id = 39,
		ext = {
			{
				"group",
				1324
			}
		},
		reward_list = {
			3006
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[840902] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 840902,
		group_id = 39,
		ext = {
			{
				"group",
				2324
			}
		},
		reward_list = {
			3106
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[840903] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840903,
		group_id = 39,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[840904] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840904,
		group_id = 39,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840905] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840905,
		group_id = 39,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840906] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840906,
		group_id = 39,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[840907] = {
		name = "藏宝洞穴",
		type = 1,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 840907,
		group_id = 39,
		ext = {
			{
				"radio",
				1500
			},
			{
				"group",
				20101
			},
			{
				"strength",
				1000,
				{
					"hp_max_per",
					1000
				},
				{
					"atk_per",
					1100
				}
			}
		},
		reward_list = {
			4001
		},
		res_1 = {
			1,
			3002
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[841001] = {
		name = "守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3021,
		is_hide = 1,
		id = 841001,
		group_id = 40,
		ext = {
			{
				"group",
				1324
			}
		},
		reward_list = {
			3006
		},
		res_1 = {
			2,
			"E27612"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				224
			},
			{
				1,
				144000
			}
		}
	},
	[841002] = {
		name = "高级守卫",
		type = 2,
		reversal = 0,
		exchange_id = 3022,
		is_hide = 1,
		id = 841002,
		group_id = 40,
		ext = {
			{
				"group",
				2324
			}
		},
		reward_list = {
			3106
		},
		res_1 = {
			2,
			"E27611"
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				25,
				336
			},
			{
				1,
				216000
			}
		}
	},
	[841003] = {
		name = "回复泉水",
		type = 3,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 841003,
		group_id = 40,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1081
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[841004] = {
		name = "复活十字架",
		type = 4,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 841004,
		group_id = 40,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1041
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[841005] = {
		name = "英雄雇佣",
		type = 5,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 841005,
		group_id = 40,
		ext = {
			{
				"num",
				4
			},
			{
				"group",
				1
			}
		},
		reward_list = {},
		res_1 = {
			1,
			1031
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[841006] = {
		name = "旅行商人",
		type = 7,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 841006,
		group_id = 40,
		ext = {},
		reward_list = {},
		res_1 = {
			1,
			3001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[841101] = {
		name = "首领怪物",
		type = 1,
		reversal = 0,
		exchange_id = 0,
		is_hide = 1,
		id = 841101,
		group_id = 41,
		ext = {
			{
				"radio",
				1000
			},
			{
				"group",
				40102
			},
			{
				"strength",
				2000,
				{
					"hp_max_per",
					2500
				},
				{
					"atk_per",
					1400
				}
			}
		},
		reward_list = {
			3007
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3021] = {
		name = "遗物",
		type = 6,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 3021,
		group_id = 0,
		ext = {
			101,
			102,
			103
		},
		reward_list = {},
		res_1 = {
			2,
			"E27621"
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[3022] = {
		name = "高级遗物",
		type = 6,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 3022,
		group_id = 0,
		ext = {
			201,
			202,
			203
		},
		reward_list = {},
		res_1 = {
			2,
			"E27622"
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[3023] = {
		name = "极品遗物",
		type = 6,
		reversal = 0,
		exchange_id = 0,
		is_hide = 0,
		id = 3023,
		group_id = 0,
		ext = {
			301,
			302,
			303
		},
		reward_list = {},
		res_1 = {
			2,
			"E27623"
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	}
}

function Config.PlanesData.data_evt_info_fun(slot0)
	slot1 = Config.PlanesData.data_evt_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PlanesData.data_evt_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PlanesData.data_shop_info_length = 22
Config.PlanesData.data_shop_info = {
	{
		type = "gold",
		discount = 5,
		base_id = 29105,
		id = 1,
		num = 10,
		price = 600
	},
	{
		type = "gold",
		discount = 5,
		base_id = 29305,
		id = 2,
		num = 10,
		price = 600
	},
	{
		type = "gold",
		discount = 5,
		base_id = 29205,
		id = 3,
		num = 10,
		price = 600
	},
	{
		type = "gold",
		discount = 9,
		base_id = 29405,
		id = 4,
		num = 10,
		price = 1440
	},
	{
		type = "gold",
		discount = 9,
		base_id = 29505,
		id = 5,
		num = 10,
		price = 1440
	},
	{
		type = "gold",
		discount = 8,
		base_id = 72001,
		id = 6,
		num = 30,
		price = 360
	},
	{
		type = "gold",
		discount = 9,
		base_id = 72002,
		id = 7,
		num = 3,
		price = 270
	},
	{
		type = "gold",
		discount = 5,
		base_id = 32,
		id = 8,
		num = 20000,
		price = 200
	},
	{
		type = "gold",
		discount = 9,
		base_id = 10040,
		id = 9,
		num = 10,
		price = 270
	},
	{
		type = "gold",
		discount = 8,
		base_id = 17009,
		id = 10,
		num = 30,
		price = 480
	},
	{
		type = "gold",
		discount = 5,
		base_id = 10030,
		id = 11,
		num = 20,
		price = 500
	},
	{
		type = "gold",
		discount = 9,
		base_id = 28,
		id = 12,
		num = 30,
		price = 270
	},
	{
		type = "gold",
		discount = 6,
		base_id = 10403,
		id = 13,
		num = 1,
		price = 150
	},
	{
		type = "gold",
		discount = 4,
		base_id = 14001,
		id = 14,
		num = 1,
		price = 1000
	},
	{
		type = "gold",
		discount = 0,
		base_id = 10034,
		id = 15,
		num = 1,
		price = 500
	},
	{
		type = "gold",
		discount = 0,
		base_id = 10602,
		id = 16,
		num = 1,
		price = 300
	},
	{
		type = "gold",
		discount = 0,
		base_id = 10603,
		id = 17,
		num = 1,
		price = 720
	},
	{
		type = "gold",
		discount = 6,
		base_id = 10403,
		id = 18,
		num = 1,
		price = 150
	},
	{
		type = "gold",
		discount = 4,
		base_id = 14001,
		id = 19,
		num = 1,
		price = 1000
	},
	{
		type = "gold",
		discount = 0,
		base_id = 10034,
		id = 20,
		num = 1,
		price = 500
	},
	{
		type = "gold",
		discount = 0,
		base_id = 10602,
		id = 21,
		num = 1,
		price = 300
	},
	{
		type = "gold",
		discount = 0,
		base_id = 10603,
		id = 22,
		num = 1,
		price = 720
	}
}

function Config.PlanesData.data_shop_info_fun(slot0)
	slot1 = Config.PlanesData.data_shop_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PlanesData.data_shop_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PlanesData.data_reward_info_length = 49
Config.PlanesData.data_reward_info = {
	[1001] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					100
				},
				{
					1,
					82400
				},
				{
					22,
					2400
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					100
				},
				{
					1,
					78280
				},
				{
					22,
					2280
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					100
				},
				{
					1,
					74160
				},
				{
					22,
					2160
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					100
				},
				{
					1,
					70040
				},
				{
					22,
					2040
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					100
				},
				{
					1,
					65920
				},
				{
					22,
					1920
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					100
				},
				{
					1,
					61800
				},
				{
					22,
					1800
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					100
				},
				{
					1,
					57680
				},
				{
					22,
					1680
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					100
				},
				{
					1,
					53560
				},
				{
					22,
					1560
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					100
				},
				{
					1,
					49440
				},
				{
					22,
					1440
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					100
				},
				{
					1,
					45320
				},
				{
					22,
					1320
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					100
				},
				{
					1,
					41200
				},
				{
					22,
					1200
				}
			}
		}
	},
	[1002] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					115
				},
				{
					1,
					84000
				},
				{
					22,
					2560
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					115
				},
				{
					1,
					79800
				},
				{
					22,
					2432
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					115
				},
				{
					1,
					75600
				},
				{
					22,
					2304
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					115
				},
				{
					1,
					71400
				},
				{
					22,
					2176
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					115
				},
				{
					1,
					67200
				},
				{
					22,
					2048
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					115
				},
				{
					1,
					63000
				},
				{
					22,
					1920
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					115
				},
				{
					1,
					58800
				},
				{
					22,
					1792
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					115
				},
				{
					1,
					54600
				},
				{
					22,
					1664
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					115
				},
				{
					1,
					50400
				},
				{
					22,
					1536
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					115
				},
				{
					1,
					46200
				},
				{
					22,
					1408
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					115
				},
				{
					1,
					42000
				},
				{
					22,
					1280
				}
			}
		}
	},
	[1003] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					110
				},
				{
					1,
					70400
				},
				{
					22,
					2200
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					110
				},
				{
					1,
					66880
				},
				{
					22,
					2089
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					110
				},
				{
					1,
					63360
				},
				{
					22,
					1980
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					110
				},
				{
					1,
					59840
				},
				{
					22,
					1869
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					110
				},
				{
					1,
					56320
				},
				{
					22,
					1760
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					110
				},
				{
					1,
					52800
				},
				{
					22,
					1649
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					110
				},
				{
					1,
					49280
				},
				{
					22,
					1540
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					110
				},
				{
					1,
					45760
				},
				{
					22,
					1429
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					110
				},
				{
					1,
					42240
				},
				{
					22,
					1320
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					110
				},
				{
					1,
					38720
				},
				{
					22,
					1209
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					110
				},
				{
					1,
					35200
				},
				{
					22,
					1100
				}
			}
		}
	},
	[1004] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					115
				},
				{
					1,
					73600
				},
				{
					22,
					2300
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					115
				},
				{
					1,
					69920
				},
				{
					22,
					2184
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					115
				},
				{
					1,
					66240
				},
				{
					22,
					2069
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					115
				},
				{
					1,
					62560
				},
				{
					22,
					1954
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					115
				},
				{
					1,
					58880
				},
				{
					22,
					1840
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					115
				},
				{
					1,
					55200
				},
				{
					22,
					1724
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					115
				},
				{
					1,
					51520
				},
				{
					22,
					1609
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					115
				},
				{
					1,
					47840
				},
				{
					22,
					1494
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					115
				},
				{
					1,
					44160
				},
				{
					22,
					1380
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					115
				},
				{
					1,
					40480
				},
				{
					22,
					1264
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					115
				},
				{
					1,
					36800
				},
				{
					22,
					1149
				}
			}
		}
	},
	[1005] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					130
				},
				{
					1,
					88000
				},
				{
					22,
					2720
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					130
				},
				{
					1,
					83600
				},
				{
					22,
					2584
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					130
				},
				{
					1,
					79200
				},
				{
					22,
					2448
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					130
				},
				{
					1,
					74800
				},
				{
					22,
					2312
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					130
				},
				{
					1,
					70400
				},
				{
					22,
					2176
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					130
				},
				{
					1,
					66000
				},
				{
					22,
					2040
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					130
				},
				{
					1,
					61600
				},
				{
					22,
					1904
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					130
				},
				{
					1,
					57200
				},
				{
					22,
					1768
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					130
				},
				{
					1,
					52800
				},
				{
					22,
					1632
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					130
				},
				{
					1,
					48400
				},
				{
					22,
					1496
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					130
				},
				{
					1,
					44000
				},
				{
					22,
					1360
				}
			}
		}
	},
	[1006] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					145
				},
				{
					1,
					92000
				},
				{
					22,
					2880
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					145
				},
				{
					1,
					87400
				},
				{
					22,
					2736
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					145
				},
				{
					1,
					82800
				},
				{
					22,
					2592
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					145
				},
				{
					1,
					78200
				},
				{
					22,
					2448
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					145
				},
				{
					1,
					73600
				},
				{
					22,
					2304
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					145
				},
				{
					1,
					69000
				},
				{
					22,
					2160
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					145
				},
				{
					1,
					64400
				},
				{
					22,
					2016
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					145
				},
				{
					1,
					59800
				},
				{
					22,
					1872
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					145
				},
				{
					1,
					55200
				},
				{
					22,
					1728
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					145
				},
				{
					1,
					50600
				},
				{
					22,
					1584
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					145
				},
				{
					1,
					46000
				},
				{
					22,
					1440
				}
			}
		}
	},
	[1007] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					160
				},
				{
					1,
					96000
				},
				{
					22,
					3040
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					160
				},
				{
					1,
					91200
				},
				{
					22,
					2888
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					160
				},
				{
					1,
					86400
				},
				{
					22,
					2736
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					160
				},
				{
					1,
					81600
				},
				{
					22,
					2584
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					160
				},
				{
					1,
					76800
				},
				{
					22,
					2432
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					160
				},
				{
					1,
					72000
				},
				{
					22,
					2280
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					160
				},
				{
					1,
					67200
				},
				{
					22,
					2128
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					160
				},
				{
					1,
					62400
				},
				{
					22,
					1976
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					160
				},
				{
					1,
					57600
				},
				{
					22,
					1824
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					160
				},
				{
					1,
					52800
				},
				{
					22,
					1672
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					160
				},
				{
					1,
					48000
				},
				{
					22,
					1520
				}
			}
		}
	},
	[1008] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					175
				},
				{
					1,
					100000
				},
				{
					22,
					3200
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					175
				},
				{
					1,
					95000
				},
				{
					22,
					3040
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					175
				},
				{
					1,
					90000
				},
				{
					22,
					2880
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					175
				},
				{
					1,
					85000
				},
				{
					22,
					2720
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					175
				},
				{
					1,
					80000
				},
				{
					22,
					2560
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					175
				},
				{
					1,
					75000
				},
				{
					22,
					2400
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					175
				},
				{
					1,
					70000
				},
				{
					22,
					2240
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					175
				},
				{
					1,
					65000
				},
				{
					22,
					2080
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					175
				},
				{
					1,
					60000
				},
				{
					22,
					1920
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					175
				},
				{
					1,
					55000
				},
				{
					22,
					1760
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					175
				},
				{
					1,
					50000
				},
				{
					22,
					1600
				}
			}
		}
	},
	[1009] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					120000
				},
				{
					22,
					6400
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					114000
				},
				{
					22,
					6080
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					108000
				},
				{
					22,
					5760
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					102000
				},
				{
					22,
					5440
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					96000
				},
				{
					22,
					5120
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					90000
				},
				{
					22,
					4800
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					84000
				},
				{
					22,
					4480
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					78000
				},
				{
					22,
					4160
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					72000
				},
				{
					22,
					3840
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					66000
				},
				{
					22,
					3520
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					60000
				},
				{
					22,
					3200
				}
			}
		}
	},
	[2001] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					210
				},
				{
					1,
					104000
				},
				{
					22,
					3360
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					210
				},
				{
					1,
					98800
				},
				{
					22,
					3192
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					210
				},
				{
					1,
					93600
				},
				{
					22,
					3024
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					210
				},
				{
					1,
					88400
				},
				{
					22,
					2856
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					210
				},
				{
					1,
					83200
				},
				{
					22,
					2688
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					210
				},
				{
					1,
					78000
				},
				{
					22,
					2520
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					210
				},
				{
					1,
					72800
				},
				{
					22,
					2352
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					210
				},
				{
					1,
					67600
				},
				{
					22,
					2184
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					210
				},
				{
					1,
					62400
				},
				{
					22,
					2016
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					210
				},
				{
					1,
					57200
				},
				{
					22,
					1848
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					210
				},
				{
					1,
					52000
				},
				{
					22,
					1680
				}
			}
		}
	},
	[2002] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					220
				},
				{
					1,
					112000
				},
				{
					22,
					3600
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					220
				},
				{
					1,
					106400
				},
				{
					22,
					3420
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					220
				},
				{
					1,
					100800
				},
				{
					22,
					3240
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					220
				},
				{
					1,
					95200
				},
				{
					22,
					3060
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					220
				},
				{
					1,
					89600
				},
				{
					22,
					2880
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					220
				},
				{
					1,
					84000
				},
				{
					22,
					2700
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					220
				},
				{
					1,
					78400
				},
				{
					22,
					2520
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					220
				},
				{
					1,
					72800
				},
				{
					22,
					2340
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					220
				},
				{
					1,
					67200
				},
				{
					22,
					2160
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					220
				},
				{
					1,
					61600
				},
				{
					22,
					1980
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					220
				},
				{
					1,
					56000
				},
				{
					22,
					1800
				}
			}
		}
	},
	[2003] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					235
				},
				{
					1,
					120000
				},
				{
					22,
					3840
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					235
				},
				{
					1,
					114000
				},
				{
					22,
					3648
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					235
				},
				{
					1,
					108000
				},
				{
					22,
					3456
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					235
				},
				{
					1,
					102000
				},
				{
					22,
					3264
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					235
				},
				{
					1,
					96000
				},
				{
					22,
					3072
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					235
				},
				{
					1,
					90000
				},
				{
					22,
					2880
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					235
				},
				{
					1,
					84000
				},
				{
					22,
					2688
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					235
				},
				{
					1,
					78000
				},
				{
					22,
					2496
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					235
				},
				{
					1,
					72000
				},
				{
					22,
					2304
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					235
				},
				{
					1,
					66000
				},
				{
					22,
					2112
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					235
				},
				{
					1,
					60000
				},
				{
					22,
					1920
				}
			}
		}
	},
	[2004] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					170
				},
				{
					1,
					108800
				},
				{
					22,
					3400
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					170
				},
				{
					1,
					103360
				},
				{
					22,
					3229
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					170
				},
				{
					1,
					97920
				},
				{
					22,
					3060
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					170
				},
				{
					1,
					92480
				},
				{
					22,
					2889
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					170
				},
				{
					1,
					87040
				},
				{
					22,
					2720
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					170
				},
				{
					1,
					81600
				},
				{
					22,
					2549
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					170
				},
				{
					1,
					76160
				},
				{
					22,
					2380
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					170
				},
				{
					1,
					70720
				},
				{
					22,
					2209
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					170
				},
				{
					1,
					65280
				},
				{
					22,
					2040
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					170
				},
				{
					1,
					59840
				},
				{
					22,
					1869
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					170
				},
				{
					1,
					54400
				},
				{
					22,
					1700
				}
			}
		}
	},
	[2005] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					175
				},
				{
					1,
					112000
				},
				{
					22,
					3500
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					175
				},
				{
					1,
					106400
				},
				{
					22,
					3324
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					175
				},
				{
					1,
					100800
				},
				{
					22,
					3149
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					175
				},
				{
					1,
					95200
				},
				{
					22,
					2974
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					175
				},
				{
					1,
					89600
				},
				{
					22,
					2800
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					175
				},
				{
					1,
					84000
				},
				{
					22,
					2624
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					175
				},
				{
					1,
					78400
				},
				{
					22,
					2449
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					175
				},
				{
					1,
					72800
				},
				{
					22,
					2274
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					175
				},
				{
					1,
					67200
				},
				{
					22,
					2100
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					175
				},
				{
					1,
					61600
				},
				{
					22,
					1924
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					175
				},
				{
					1,
					56000
				},
				{
					22,
					1749
				}
			}
		}
	},
	[2006] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					250
				},
				{
					1,
					128000
				},
				{
					22,
					4080
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					250
				},
				{
					1,
					121600
				},
				{
					22,
					3876
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					250
				},
				{
					1,
					115200
				},
				{
					22,
					3672
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					250
				},
				{
					1,
					108800
				},
				{
					22,
					3468
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					250
				},
				{
					1,
					102400
				},
				{
					22,
					3264
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					250
				},
				{
					1,
					96000
				},
				{
					22,
					3060
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					250
				},
				{
					1,
					89600
				},
				{
					22,
					2856
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					250
				},
				{
					1,
					83200
				},
				{
					22,
					2652
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					250
				},
				{
					1,
					76800
				},
				{
					22,
					2448
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					250
				},
				{
					1,
					70400
				},
				{
					22,
					2244
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					250
				},
				{
					1,
					64000
				},
				{
					22,
					2040
				}
			}
		}
	},
	[2007] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					270
				},
				{
					1,
					136000
				},
				{
					22,
					4320
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					270
				},
				{
					1,
					129200
				},
				{
					22,
					4104
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					270
				},
				{
					1,
					122400
				},
				{
					22,
					3888
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					270
				},
				{
					1,
					115600
				},
				{
					22,
					3672
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					270
				},
				{
					1,
					108800
				},
				{
					22,
					3456
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					270
				},
				{
					1,
					102000
				},
				{
					22,
					3240
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					270
				},
				{
					1,
					95200
				},
				{
					22,
					3024
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					270
				},
				{
					1,
					88400
				},
				{
					22,
					2808
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					270
				},
				{
					1,
					81600
				},
				{
					22,
					2592
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					270
				},
				{
					1,
					74800
				},
				{
					22,
					2376
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					270
				},
				{
					1,
					68000
				},
				{
					22,
					2160
				}
			}
		}
	},
	[2008] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					160000
				},
				{
					22,
					8000
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					152000
				},
				{
					22,
					7600
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					144000
				},
				{
					22,
					7200
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					136000
				},
				{
					22,
					6800
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					128000
				},
				{
					22,
					6400
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					120000
				},
				{
					22,
					6000
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					112000
				},
				{
					22,
					5600
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					104000
				},
				{
					22,
					5200
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					96000
				},
				{
					22,
					4800
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					88000
				},
				{
					22,
					4400
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					80000
				},
				{
					22,
					4000
				}
			}
		}
	},
	[3001] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					280
				},
				{
					1,
					144000
				},
				{
					22,
					4560
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					280
				},
				{
					1,
					136800
				},
				{
					22,
					4332
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					280
				},
				{
					1,
					129600
				},
				{
					22,
					4104
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					280
				},
				{
					1,
					122400
				},
				{
					22,
					3876
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					280
				},
				{
					1,
					115200
				},
				{
					22,
					3648
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					280
				},
				{
					1,
					108000
				},
				{
					22,
					3420
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					280
				},
				{
					1,
					100800
				},
				{
					22,
					3192
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					280
				},
				{
					1,
					93600
				},
				{
					22,
					2964
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					280
				},
				{
					1,
					86400
				},
				{
					22,
					2736
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					280
				},
				{
					1,
					79200
				},
				{
					22,
					2508
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					280
				},
				{
					1,
					72000
				},
				{
					22,
					2280
				}
			}
		}
	},
	[3002] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					210
				},
				{
					1,
					134400
				},
				{
					22,
					4200
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					210
				},
				{
					1,
					127680
				},
				{
					22,
					3989
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					210
				},
				{
					1,
					120960
				},
				{
					22,
					3780
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					210
				},
				{
					1,
					114240
				},
				{
					22,
					3569
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					210
				},
				{
					1,
					107520
				},
				{
					22,
					3360
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					210
				},
				{
					1,
					100800
				},
				{
					22,
					3149
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					210
				},
				{
					1,
					94080
				},
				{
					22,
					2940
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					210
				},
				{
					1,
					87360
				},
				{
					22,
					2729
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					210
				},
				{
					1,
					80640
				},
				{
					22,
					2520
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					210
				},
				{
					1,
					73920
				},
				{
					22,
					2309
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					210
				},
				{
					1,
					67200
				},
				{
					22,
					2100
				}
			}
		}
	},
	[3003] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					215
				},
				{
					1,
					137600
				},
				{
					22,
					4300
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					215
				},
				{
					1,
					130720
				},
				{
					22,
					4084
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					215
				},
				{
					1,
					123840
				},
				{
					22,
					3869
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					215
				},
				{
					1,
					116960
				},
				{
					22,
					3654
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					215
				},
				{
					1,
					110080
				},
				{
					22,
					3440
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					215
				},
				{
					1,
					103200
				},
				{
					22,
					3224
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					215
				},
				{
					1,
					96320
				},
				{
					22,
					3009
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					215
				},
				{
					1,
					89440
				},
				{
					22,
					2794
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					215
				},
				{
					1,
					82560
				},
				{
					22,
					2580
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					215
				},
				{
					1,
					75680
				},
				{
					22,
					2364
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					215
				},
				{
					1,
					68800
				},
				{
					22,
					2149
				}
			}
		}
	},
	[3004] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					300
				},
				{
					1,
					160000
				},
				{
					22,
					4800
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					300
				},
				{
					1,
					152000
				},
				{
					22,
					4560
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					300
				},
				{
					1,
					144000
				},
				{
					22,
					4320
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					300
				},
				{
					1,
					136000
				},
				{
					22,
					4080
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					300
				},
				{
					1,
					128000
				},
				{
					22,
					3840
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					300
				},
				{
					1,
					120000
				},
				{
					22,
					3600
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					300
				},
				{
					1,
					112000
				},
				{
					22,
					3360
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					300
				},
				{
					1,
					104000
				},
				{
					22,
					3120
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					300
				},
				{
					1,
					96000
				},
				{
					22,
					2880
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					300
				},
				{
					1,
					88000
				},
				{
					22,
					2640
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					300
				},
				{
					1,
					80000
				},
				{
					22,
					2400
				}
			}
		}
	},
	[3005] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					320
				},
				{
					1,
					176000
				},
				{
					22,
					5040
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					320
				},
				{
					1,
					167200
				},
				{
					22,
					4788
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					320
				},
				{
					1,
					158400
				},
				{
					22,
					4536
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					320
				},
				{
					1,
					149600
				},
				{
					22,
					4284
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					320
				},
				{
					1,
					140800
				},
				{
					22,
					4032
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					320
				},
				{
					1,
					132000
				},
				{
					22,
					3780
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					320
				},
				{
					1,
					123200
				},
				{
					22,
					3528
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					320
				},
				{
					1,
					114400
				},
				{
					22,
					3276
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					320
				},
				{
					1,
					105600
				},
				{
					22,
					3024
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					320
				},
				{
					1,
					96800
				},
				{
					22,
					2772
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					320
				},
				{
					1,
					88000
				},
				{
					22,
					2520
				}
			}
		}
	},
	[3006] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					340
				},
				{
					1,
					192000
				},
				{
					22,
					5280
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					340
				},
				{
					1,
					182400
				},
				{
					22,
					5016
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					340
				},
				{
					1,
					172800
				},
				{
					22,
					4752
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					340
				},
				{
					1,
					163200
				},
				{
					22,
					4488
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					340
				},
				{
					1,
					153600
				},
				{
					22,
					4224
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					340
				},
				{
					1,
					144000
				},
				{
					22,
					3960
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					340
				},
				{
					1,
					134400
				},
				{
					22,
					3696
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					340
				},
				{
					1,
					124800
				},
				{
					22,
					3432
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					340
				},
				{
					1,
					115200
				},
				{
					22,
					3168
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					340
				},
				{
					1,
					105600
				},
				{
					22,
					2904
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					340
				},
				{
					1,
					96000
				},
				{
					22,
					2640
				}
			}
		}
	},
	[3007] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					240000
				},
				{
					22,
					9600
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					228000
				},
				{
					22,
					9120
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					216000
				},
				{
					22,
					8640
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					204000
				},
				{
					22,
					8160
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					192000
				},
				{
					22,
					7680
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					180000
				},
				{
					22,
					7200
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					168000
				},
				{
					22,
					6720
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					156000
				},
				{
					22,
					6240
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					144000
				},
				{
					22,
					5760
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					132000
				},
				{
					22,
					5280
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					120000
				},
				{
					22,
					4800
				}
			}
		}
	},
	[1101] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					100
				},
				{
					1,
					103000
				},
				{
					22,
					3000
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					100
				},
				{
					1,
					97850
				},
				{
					22,
					2850
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					100
				},
				{
					1,
					92700
				},
				{
					22,
					2700
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					100
				},
				{
					1,
					87550
				},
				{
					22,
					2550
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					100
				},
				{
					1,
					82400
				},
				{
					22,
					2400
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					100
				},
				{
					1,
					77250
				},
				{
					22,
					2250
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					100
				},
				{
					1,
					72100
				},
				{
					22,
					2100
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					100
				},
				{
					1,
					66950
				},
				{
					22,
					1950
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					100
				},
				{
					1,
					61800
				},
				{
					22,
					1800
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					100
				},
				{
					1,
					56650
				},
				{
					22,
					1650
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					100
				},
				{
					1,
					51500
				},
				{
					22,
					1500
				}
			}
		}
	},
	[1102] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					115
				},
				{
					1,
					105000
				},
				{
					22,
					3200
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					115
				},
				{
					1,
					99750
				},
				{
					22,
					3040
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					115
				},
				{
					1,
					94500
				},
				{
					22,
					2880
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					115
				},
				{
					1,
					89250
				},
				{
					22,
					2720
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					115
				},
				{
					1,
					84000
				},
				{
					22,
					2560
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					115
				},
				{
					1,
					78750
				},
				{
					22,
					2400
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					115
				},
				{
					1,
					73500
				},
				{
					22,
					2240
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					115
				},
				{
					1,
					68250
				},
				{
					22,
					2080
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					115
				},
				{
					1,
					63000
				},
				{
					22,
					1920
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					115
				},
				{
					1,
					57750
				},
				{
					22,
					1760
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					115
				},
				{
					1,
					52500
				},
				{
					22,
					1600
				}
			}
		}
	},
	[1103] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					110
				},
				{
					1,
					88000
				},
				{
					22,
					2750
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					110
				},
				{
					1,
					83600
				},
				{
					22,
					2612
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					110
				},
				{
					1,
					79200
				},
				{
					22,
					2475
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					110
				},
				{
					1,
					74800
				},
				{
					22,
					2337
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					110
				},
				{
					1,
					70400
				},
				{
					22,
					2200
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					110
				},
				{
					1,
					66000
				},
				{
					22,
					2062
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					110
				},
				{
					1,
					61600
				},
				{
					22,
					1925
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					110
				},
				{
					1,
					57200
				},
				{
					22,
					1787
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					110
				},
				{
					1,
					52800
				},
				{
					22,
					1650
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					110
				},
				{
					1,
					48400
				},
				{
					22,
					1512
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					110
				},
				{
					1,
					44000
				},
				{
					22,
					1375
				}
			}
		}
	},
	[1104] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					115
				},
				{
					1,
					92000
				},
				{
					22,
					2875
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					115
				},
				{
					1,
					87400
				},
				{
					22,
					2731
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					115
				},
				{
					1,
					82800
				},
				{
					22,
					2587
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					115
				},
				{
					1,
					78200
				},
				{
					22,
					2443
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					115
				},
				{
					1,
					73600
				},
				{
					22,
					2300
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					115
				},
				{
					1,
					69000
				},
				{
					22,
					2156
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					115
				},
				{
					1,
					64400
				},
				{
					22,
					2012
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					115
				},
				{
					1,
					59800
				},
				{
					22,
					1868
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					115
				},
				{
					1,
					55200
				},
				{
					22,
					1725
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					115
				},
				{
					1,
					50600
				},
				{
					22,
					1581
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					115
				},
				{
					1,
					46000
				},
				{
					22,
					1437
				}
			}
		}
	},
	[1105] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					130
				},
				{
					1,
					110000
				},
				{
					22,
					3400
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					130
				},
				{
					1,
					104500
				},
				{
					22,
					3230
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					130
				},
				{
					1,
					99000
				},
				{
					22,
					3060
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					130
				},
				{
					1,
					93500
				},
				{
					22,
					2890
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					130
				},
				{
					1,
					88000
				},
				{
					22,
					2720
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					130
				},
				{
					1,
					82500
				},
				{
					22,
					2550
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					130
				},
				{
					1,
					77000
				},
				{
					22,
					2380
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					130
				},
				{
					1,
					71500
				},
				{
					22,
					2210
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					130
				},
				{
					1,
					66000
				},
				{
					22,
					2040
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					130
				},
				{
					1,
					60500
				},
				{
					22,
					1870
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					130
				},
				{
					1,
					55000
				},
				{
					22,
					1700
				}
			}
		}
	},
	[1106] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					145
				},
				{
					1,
					115000
				},
				{
					22,
					3600
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					145
				},
				{
					1,
					109250
				},
				{
					22,
					3420
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					145
				},
				{
					1,
					103500
				},
				{
					22,
					3240
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					145
				},
				{
					1,
					97750
				},
				{
					22,
					3060
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					145
				},
				{
					1,
					92000
				},
				{
					22,
					2880
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					145
				},
				{
					1,
					86250
				},
				{
					22,
					2700
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					145
				},
				{
					1,
					80500
				},
				{
					22,
					2520
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					145
				},
				{
					1,
					74750
				},
				{
					22,
					2340
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					145
				},
				{
					1,
					69000
				},
				{
					22,
					2160
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					145
				},
				{
					1,
					63250
				},
				{
					22,
					1980
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					145
				},
				{
					1,
					57500
				},
				{
					22,
					1800
				}
			}
		}
	},
	[1107] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					160
				},
				{
					1,
					120000
				},
				{
					22,
					3800
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					160
				},
				{
					1,
					114000
				},
				{
					22,
					3610
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					160
				},
				{
					1,
					108000
				},
				{
					22,
					3420
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					160
				},
				{
					1,
					102000
				},
				{
					22,
					3230
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					160
				},
				{
					1,
					96000
				},
				{
					22,
					3040
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					160
				},
				{
					1,
					90000
				},
				{
					22,
					2850
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					160
				},
				{
					1,
					84000
				},
				{
					22,
					2660
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					160
				},
				{
					1,
					78000
				},
				{
					22,
					2470
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					160
				},
				{
					1,
					72000
				},
				{
					22,
					2280
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					160
				},
				{
					1,
					66000
				},
				{
					22,
					2090
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					160
				},
				{
					1,
					60000
				},
				{
					22,
					1900
				}
			}
		}
	},
	[1108] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					175
				},
				{
					1,
					125000
				},
				{
					22,
					4000
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					175
				},
				{
					1,
					118750
				},
				{
					22,
					3800
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					175
				},
				{
					1,
					112500
				},
				{
					22,
					3600
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					175
				},
				{
					1,
					106250
				},
				{
					22,
					3400
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					175
				},
				{
					1,
					100000
				},
				{
					22,
					3200
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					175
				},
				{
					1,
					93750
				},
				{
					22,
					3000
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					175
				},
				{
					1,
					87500
				},
				{
					22,
					2800
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					175
				},
				{
					1,
					81250
				},
				{
					22,
					2600
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					175
				},
				{
					1,
					75000
				},
				{
					22,
					2400
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					175
				},
				{
					1,
					68750
				},
				{
					22,
					2200
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					175
				},
				{
					1,
					62500
				},
				{
					22,
					2000
				}
			}
		}
	},
	[1109] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					150000
				},
				{
					22,
					8000
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					142500
				},
				{
					22,
					7600
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					135000
				},
				{
					22,
					7200
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					127500
				},
				{
					22,
					6800
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					120000
				},
				{
					22,
					6400
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					112500
				},
				{
					22,
					6000
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					105000
				},
				{
					22,
					5600
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					97500
				},
				{
					22,
					5200
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					90000
				},
				{
					22,
					4800
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					82500
				},
				{
					22,
					4400
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					32,
					2500
				},
				{
					25,
					200
				},
				{
					1,
					75000
				},
				{
					22,
					4000
				}
			}
		}
	},
	[2101] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					210
				},
				{
					1,
					130000
				},
				{
					22,
					4200
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					210
				},
				{
					1,
					123500
				},
				{
					22,
					3990
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					210
				},
				{
					1,
					117000
				},
				{
					22,
					3780
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					210
				},
				{
					1,
					110500
				},
				{
					22,
					3570
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					210
				},
				{
					1,
					104000
				},
				{
					22,
					3360
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					210
				},
				{
					1,
					97500
				},
				{
					22,
					3150
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					210
				},
				{
					1,
					91000
				},
				{
					22,
					2940
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					210
				},
				{
					1,
					84500
				},
				{
					22,
					2730
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					210
				},
				{
					1,
					78000
				},
				{
					22,
					2520
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					210
				},
				{
					1,
					71500
				},
				{
					22,
					2310
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					210
				},
				{
					1,
					65000
				},
				{
					22,
					2100
				}
			}
		}
	},
	[2102] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					220
				},
				{
					1,
					140000
				},
				{
					22,
					4500
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					220
				},
				{
					1,
					133000
				},
				{
					22,
					4275
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					220
				},
				{
					1,
					126000
				},
				{
					22,
					4050
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					220
				},
				{
					1,
					119000
				},
				{
					22,
					3825
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					220
				},
				{
					1,
					112000
				},
				{
					22,
					3600
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					220
				},
				{
					1,
					105000
				},
				{
					22,
					3375
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					220
				},
				{
					1,
					98000
				},
				{
					22,
					3150
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					220
				},
				{
					1,
					91000
				},
				{
					22,
					2925
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					220
				},
				{
					1,
					84000
				},
				{
					22,
					2700
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					220
				},
				{
					1,
					77000
				},
				{
					22,
					2475
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					220
				},
				{
					1,
					70000
				},
				{
					22,
					2250
				}
			}
		}
	},
	[2103] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					235
				},
				{
					1,
					150000
				},
				{
					22,
					4800
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					235
				},
				{
					1,
					142500
				},
				{
					22,
					4560
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					235
				},
				{
					1,
					135000
				},
				{
					22,
					4320
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					235
				},
				{
					1,
					127500
				},
				{
					22,
					4080
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					235
				},
				{
					1,
					120000
				},
				{
					22,
					3840
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					235
				},
				{
					1,
					112500
				},
				{
					22,
					3600
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					235
				},
				{
					1,
					105000
				},
				{
					22,
					3360
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					235
				},
				{
					1,
					97500
				},
				{
					22,
					3120
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					235
				},
				{
					1,
					90000
				},
				{
					22,
					2880
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					235
				},
				{
					1,
					82500
				},
				{
					22,
					2640
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					235
				},
				{
					1,
					75000
				},
				{
					22,
					2400
				}
			}
		}
	},
	[2104] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					170
				},
				{
					1,
					136000
				},
				{
					22,
					4250
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					170
				},
				{
					1,
					129200
				},
				{
					22,
					4037
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					170
				},
				{
					1,
					122400
				},
				{
					22,
					3825
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					170
				},
				{
					1,
					115600
				},
				{
					22,
					3612
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					170
				},
				{
					1,
					108800
				},
				{
					22,
					3400
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					170
				},
				{
					1,
					102000
				},
				{
					22,
					3187
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					170
				},
				{
					1,
					95200
				},
				{
					22,
					2975
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					170
				},
				{
					1,
					88400
				},
				{
					22,
					2762
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					170
				},
				{
					1,
					81600
				},
				{
					22,
					2550
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					170
				},
				{
					1,
					74800
				},
				{
					22,
					2337
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					170
				},
				{
					1,
					68000
				},
				{
					22,
					2125
				}
			}
		}
	},
	[2105] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					175
				},
				{
					1,
					140000
				},
				{
					22,
					4375
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					175
				},
				{
					1,
					133000
				},
				{
					22,
					4156
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					175
				},
				{
					1,
					126000
				},
				{
					22,
					3937
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					175
				},
				{
					1,
					119000
				},
				{
					22,
					3718
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					175
				},
				{
					1,
					112000
				},
				{
					22,
					3500
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					175
				},
				{
					1,
					105000
				},
				{
					22,
					3281
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					175
				},
				{
					1,
					98000
				},
				{
					22,
					3062
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					175
				},
				{
					1,
					91000
				},
				{
					22,
					2843
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					175
				},
				{
					1,
					84000
				},
				{
					22,
					2625
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					175
				},
				{
					1,
					77000
				},
				{
					22,
					2406
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					175
				},
				{
					1,
					70000
				},
				{
					22,
					2187
				}
			}
		}
	},
	[2106] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					250
				},
				{
					1,
					160000
				},
				{
					22,
					5100
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					250
				},
				{
					1,
					152000
				},
				{
					22,
					4845
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					250
				},
				{
					1,
					144000
				},
				{
					22,
					4590
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					250
				},
				{
					1,
					136000
				},
				{
					22,
					4335
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					250
				},
				{
					1,
					128000
				},
				{
					22,
					4080
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					250
				},
				{
					1,
					120000
				},
				{
					22,
					3825
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					250
				},
				{
					1,
					112000
				},
				{
					22,
					3570
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					250
				},
				{
					1,
					104000
				},
				{
					22,
					3315
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					250
				},
				{
					1,
					96000
				},
				{
					22,
					3060
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					250
				},
				{
					1,
					88000
				},
				{
					22,
					2805
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					250
				},
				{
					1,
					80000
				},
				{
					22,
					2550
				}
			}
		}
	},
	[2107] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					270
				},
				{
					1,
					170000
				},
				{
					22,
					5400
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					270
				},
				{
					1,
					161500
				},
				{
					22,
					5130
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					270
				},
				{
					1,
					153000
				},
				{
					22,
					4860
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					270
				},
				{
					1,
					144500
				},
				{
					22,
					4590
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					270
				},
				{
					1,
					136000
				},
				{
					22,
					4320
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					270
				},
				{
					1,
					127500
				},
				{
					22,
					4050
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					270
				},
				{
					1,
					119000
				},
				{
					22,
					3780
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					270
				},
				{
					1,
					110500
				},
				{
					22,
					3510
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					270
				},
				{
					1,
					102000
				},
				{
					22,
					3240
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					270
				},
				{
					1,
					93500
				},
				{
					22,
					2970
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					270
				},
				{
					1,
					85000
				},
				{
					22,
					2700
				}
			}
		}
	},
	[2108] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					200000
				},
				{
					22,
					10000
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					190000
				},
				{
					22,
					9500
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					180000
				},
				{
					22,
					9000
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					170000
				},
				{
					22,
					8500
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					160000
				},
				{
					22,
					8000
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					150000
				},
				{
					22,
					7500
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					140000
				},
				{
					22,
					7000
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					130000
				},
				{
					22,
					6500
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					120000
				},
				{
					22,
					6000
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					110000
				},
				{
					22,
					5500
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					32,
					5000
				},
				{
					25,
					300
				},
				{
					1,
					100000
				},
				{
					22,
					5000
				}
			}
		}
	},
	[3101] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					280
				},
				{
					1,
					180000
				},
				{
					22,
					5700
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					280
				},
				{
					1,
					171000
				},
				{
					22,
					5415
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					280
				},
				{
					1,
					162000
				},
				{
					22,
					5130
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					280
				},
				{
					1,
					153000
				},
				{
					22,
					4845
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					280
				},
				{
					1,
					144000
				},
				{
					22,
					4560
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					280
				},
				{
					1,
					135000
				},
				{
					22,
					4275
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					280
				},
				{
					1,
					126000
				},
				{
					22,
					3990
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					280
				},
				{
					1,
					117000
				},
				{
					22,
					3705
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					280
				},
				{
					1,
					108000
				},
				{
					22,
					3420
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					280
				},
				{
					1,
					99000
				},
				{
					22,
					3135
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					280
				},
				{
					1,
					90000
				},
				{
					22,
					2850
				}
			}
		}
	},
	[3102] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					210
				},
				{
					1,
					168000
				},
				{
					22,
					5250
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					210
				},
				{
					1,
					159600
				},
				{
					22,
					4987
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					210
				},
				{
					1,
					151200
				},
				{
					22,
					4725
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					210
				},
				{
					1,
					142800
				},
				{
					22,
					4462
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					210
				},
				{
					1,
					134400
				},
				{
					22,
					4200
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					210
				},
				{
					1,
					126000
				},
				{
					22,
					3937
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					210
				},
				{
					1,
					117600
				},
				{
					22,
					3675
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					210
				},
				{
					1,
					109200
				},
				{
					22,
					3412
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					210
				},
				{
					1,
					100800
				},
				{
					22,
					3150
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					210
				},
				{
					1,
					92400
				},
				{
					22,
					2887
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					210
				},
				{
					1,
					84000
				},
				{
					22,
					2625
				}
			}
		}
	},
	[3103] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					215
				},
				{
					1,
					172000
				},
				{
					22,
					5375
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					215
				},
				{
					1,
					163400
				},
				{
					22,
					5106
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					215
				},
				{
					1,
					154800
				},
				{
					22,
					4837
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					215
				},
				{
					1,
					146200
				},
				{
					22,
					4568
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					215
				},
				{
					1,
					137600
				},
				{
					22,
					4300
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					215
				},
				{
					1,
					129000
				},
				{
					22,
					4031
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					215
				},
				{
					1,
					120400
				},
				{
					22,
					3762
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					215
				},
				{
					1,
					111800
				},
				{
					22,
					3493
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					215
				},
				{
					1,
					103200
				},
				{
					22,
					3225
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					215
				},
				{
					1,
					94600
				},
				{
					22,
					2956
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					215
				},
				{
					1,
					86000
				},
				{
					22,
					2687
				}
			}
		}
	},
	[3104] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					300
				},
				{
					1,
					200000
				},
				{
					22,
					6000
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					300
				},
				{
					1,
					190000
				},
				{
					22,
					5700
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					300
				},
				{
					1,
					180000
				},
				{
					22,
					5400
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					300
				},
				{
					1,
					170000
				},
				{
					22,
					5100
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					300
				},
				{
					1,
					160000
				},
				{
					22,
					4800
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					300
				},
				{
					1,
					150000
				},
				{
					22,
					4500
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					300
				},
				{
					1,
					140000
				},
				{
					22,
					4200
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					300
				},
				{
					1,
					130000
				},
				{
					22,
					3900
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					300
				},
				{
					1,
					120000
				},
				{
					22,
					3600
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					300
				},
				{
					1,
					110000
				},
				{
					22,
					3300
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					300
				},
				{
					1,
					100000
				},
				{
					22,
					3000
				}
			}
		}
	},
	[3105] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					320
				},
				{
					1,
					220000
				},
				{
					22,
					6300
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					320
				},
				{
					1,
					209000
				},
				{
					22,
					5985
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					320
				},
				{
					1,
					198000
				},
				{
					22,
					5670
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					320
				},
				{
					1,
					187000
				},
				{
					22,
					5355
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					320
				},
				{
					1,
					176000
				},
				{
					22,
					5040
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					320
				},
				{
					1,
					165000
				},
				{
					22,
					4725
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					320
				},
				{
					1,
					154000
				},
				{
					22,
					4410
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					320
				},
				{
					1,
					143000
				},
				{
					22,
					4095
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					320
				},
				{
					1,
					132000
				},
				{
					22,
					3780
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					320
				},
				{
					1,
					121000
				},
				{
					22,
					3465
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					320
				},
				{
					1,
					110000
				},
				{
					22,
					3150
				}
			}
		}
	},
	[3106] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					340
				},
				{
					1,
					240000
				},
				{
					22,
					6600
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					340
				},
				{
					1,
					228000
				},
				{
					22,
					6270
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					340
				},
				{
					1,
					216000
				},
				{
					22,
					5940
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					340
				},
				{
					1,
					204000
				},
				{
					22,
					5610
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					340
				},
				{
					1,
					192000
				},
				{
					22,
					5280
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					340
				},
				{
					1,
					180000
				},
				{
					22,
					4950
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					340
				},
				{
					1,
					168000
				},
				{
					22,
					4620
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					340
				},
				{
					1,
					156000
				},
				{
					22,
					4290
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					340
				},
				{
					1,
					144000
				},
				{
					22,
					3960
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					340
				},
				{
					1,
					132000
				},
				{
					22,
					3630
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					340
				},
				{
					1,
					120000
				},
				{
					22,
					3300
				}
			}
		}
	},
	[3107] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					300000
				},
				{
					22,
					12000
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					285000
				},
				{
					22,
					11400
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					270000
				},
				{
					22,
					10800
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					255000
				},
				{
					22,
					10200
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					240000
				},
				{
					22,
					9600
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					225000
				},
				{
					22,
					9000
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					210000
				},
				{
					22,
					8400
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					195000
				},
				{
					22,
					7800
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					180000
				},
				{
					22,
					7200
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					165000
				},
				{
					22,
					6600
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					32,
					10000
				},
				{
					25,
					400
				},
				{
					1,
					150000
				},
				{
					22,
					6000
				}
			}
		}
	},
	[4001] = {
		{
			min = 160,
			max = 999,
			reward = {
				{
					25,
					2000
				},
				{
					1,
					250000
				},
				{
					22,
					8000
				}
			}
		},
		{
			min = 140,
			max = 159,
			reward = {
				{
					25,
					2000
				},
				{
					1,
					237500
				},
				{
					22,
					7600
				}
			}
		},
		{
			min = 120,
			max = 139,
			reward = {
				{
					25,
					2000
				},
				{
					1,
					225000
				},
				{
					22,
					7200
				}
			}
		},
		{
			min = 100,
			max = 119,
			reward = {
				{
					25,
					2000
				},
				{
					1,
					212500
				},
				{
					22,
					6800
				}
			}
		},
		{
			min = 90,
			max = 99,
			reward = {
				{
					25,
					2000
				},
				{
					1,
					200000
				},
				{
					22,
					6400
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					25,
					2000
				},
				{
					1,
					187500
				},
				{
					22,
					6000
				}
			}
		},
		{
			min = 70,
			max = 79,
			reward = {
				{
					25,
					2000
				},
				{
					1,
					175000
				},
				{
					22,
					5600
				}
			}
		},
		{
			min = 60,
			max = 69,
			reward = {
				{
					25,
					2000
				},
				{
					1,
					162500
				},
				{
					22,
					5200
				}
			}
		},
		{
			min = 50,
			max = 59,
			reward = {
				{
					25,
					2000
				},
				{
					1,
					150000
				},
				{
					22,
					4800
				}
			}
		},
		{
			min = 40,
			max = 49,
			reward = {
				{
					25,
					2000
				},
				{
					1,
					137500
				},
				{
					22,
					4400
				}
			}
		},
		{
			min = 1,
			max = 39,
			reward = {
				{
					25,
					2000
				},
				{
					1,
					125000
				},
				{
					22,
					4000
				}
			}
		}
	}
}
Config.PlanesData.data_buff_length = 143
Config.PlanesData.data_buff = {
	[10101] = {
		buff_id = 10101,
		quality = 1,
		name = "攻击强化",
		res_id = "buff_icon_7",
		desc = "所有英雄攻击提升8%",
		range = {}
	},
	[10102] = {
		buff_id = 10102,
		quality = 2,
		name = "攻击强化",
		res_id = "buff_icon_7",
		desc = "所有英雄攻击提升11%",
		range = {}
	},
	[10103] = {
		buff_id = 10103,
		quality = 3,
		name = "攻击强化",
		res_id = "buff_icon_7",
		desc = "所有英雄攻击提升15%",
		range = {}
	},
	[10201] = {
		buff_id = 10201,
		quality = 1,
		name = "生命强化",
		res_id = "buff_icon_2",
		desc = "所有英雄生命值上限提升15%",
		range = {}
	},
	[10202] = {
		buff_id = 10202,
		quality = 2,
		name = "生命强化",
		res_id = "buff_icon_2",
		desc = "所有英雄生命值上限提升22%",
		range = {}
	},
	[10203] = {
		buff_id = 10203,
		quality = 3,
		name = "生命强化",
		res_id = "buff_icon_2",
		desc = "所有英雄生命值上限提升30%",
		range = {}
	},
	[10301] = {
		buff_id = 10301,
		quality = 1,
		name = "速度强化",
		res_id = "buff_icon_5",
		desc = "所有英雄速度提升5%",
		range = {}
	},
	[10302] = {
		buff_id = 10302,
		quality = 2,
		name = "速度强化",
		res_id = "buff_icon_5",
		desc = "所有英雄速度提升10%",
		range = {}
	},
	[10303] = {
		buff_id = 10303,
		quality = 3,
		name = "速度强化",
		res_id = "buff_icon_5",
		desc = "所有英雄速度提升15%",
		range = {}
	},
	[10501] = {
		buff_id = 10501,
		quality = 1,
		name = "治愈之章",
		res_id = "buff_icon_2",
		desc = "所有英雄受疗效果提高20%",
		range = {}
	},
	[10502] = {
		buff_id = 10502,
		quality = 2,
		name = "治愈之章",
		res_id = "buff_icon_2",
		desc = "所有英雄受疗效果提高35%",
		range = {}
	},
	[10503] = {
		buff_id = 10503,
		quality = 3,
		name = "治愈之章",
		res_id = "buff_icon_2",
		desc = "所有英雄受疗效果提高50%",
		range = {}
	},
	[10602] = {
		buff_id = 10602,
		quality = 2,
		name = "远征旗帜",
		res_id = "buff_icon_15",
		desc = "仅在第三层生效，提升所有英雄15%攻击力，10%防御",
		range = {}
	},
	[10603] = {
		buff_id = 10603,
		quality = 3,
		name = "远征旗帜",
		res_id = "buff_icon_15",
		desc = "仅在第三层生效，提升所有英雄25%攻击力，15%防御",
		range = {}
	},
	[10701] = {
		buff_id = 10701,
		quality = 1,
		name = "体魄强化",
		res_id = "buff_icon_9",
		desc = "所有英雄生命值上限提高8%，免伤提高6%",
		range = {}
	},
	[10702] = {
		buff_id = 10702,
		quality = 2,
		name = "体魄强化",
		res_id = "buff_icon_9",
		desc = "所有英雄生命值上限提高11%，免伤提高9%",
		range = {}
	},
	[10703] = {
		buff_id = 10703,
		quality = 3,
		name = "体魄强化",
		res_id = "buff_icon_9",
		desc = "所有英雄生命值上限提高15%，免伤提高12%",
		range = {}
	},
	[10801] = {
		buff_id = 10801,
		quality = 1,
		name = "愈力之躯",
		res_id = "buff_icon_9",
		desc = "所有英雄生命值上限提高8%，受疗提高6%",
		range = {}
	},
	[10802] = {
		buff_id = 10802,
		quality = 2,
		name = "愈力之躯",
		res_id = "buff_icon_9",
		desc = "所有英雄生命值上限提高11%，受疗提高12%",
		range = {}
	},
	[10803] = {
		buff_id = 10803,
		quality = 3,
		name = "愈力之躯",
		res_id = "buff_icon_9",
		desc = "所有英雄生命值上限提高15%，受疗提高18%",
		range = {}
	},
	[20101] = {
		buff_id = 20101,
		quality = 1,
		name = "战士攻击",
		res_id = "buff_icon_7",
		desc = "所有战士英雄攻击力提升6%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[20102] = {
		buff_id = 20102,
		quality = 2,
		name = "战士攻击",
		res_id = "buff_icon_7",
		desc = "所有战士英雄攻击力提升12%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[20201] = {
		buff_id = 20201,
		quality = 1,
		name = "战士暴击",
		res_id = "buff_icon_7",
		desc = "所有战士英雄暴击率提升5%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[20202] = {
		buff_id = 20202,
		quality = 2,
		name = "战士暴击",
		res_id = "buff_icon_7",
		desc = "所有战士英雄暴击率提升10%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[20301] = {
		buff_id = 20301,
		quality = 1,
		name = "战士暴伤",
		res_id = "buff_icon_7",
		desc = "所有战士英雄暴击伤害提升10%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[20302] = {
		buff_id = 20302,
		quality = 2,
		name = "战士暴伤",
		res_id = "buff_icon_7",
		desc = "所有战士英雄暴击伤害提升15%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[20401] = {
		buff_id = 20401,
		quality = 1,
		name = "战士物伤",
		res_id = "buff_icon_7",
		desc = "所有战士英雄物理伤害提升6%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[20402] = {
		buff_id = 20402,
		quality = 2,
		name = "战士物伤",
		res_id = "buff_icon_7",
		desc = "所有战士英雄物理伤害提升12%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[20501] = {
		buff_id = 20501,
		quality = 1,
		name = "战士双暴",
		res_id = "buff_icon_7",
		desc = "所有战士英雄暴击率提升4%，暴击伤害提升7%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[20502] = {
		buff_id = 20502,
		quality = 2,
		name = "战士双暴",
		res_id = "buff_icon_7",
		desc = "所有战士英雄暴击率提升6%，暴击伤害提升10%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[21101] = {
		buff_id = 21101,
		quality = 1,
		name = "法师攻击",
		res_id = "buff_icon_9",
		desc = "所有法师英雄攻击力提升6%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21102] = {
		buff_id = 21102,
		quality = 2,
		name = "法师攻击",
		res_id = "buff_icon_9",
		desc = "所有法师英雄攻击力提升12%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21201] = {
		buff_id = 21201,
		quality = 1,
		name = "法师暴击",
		res_id = "buff_icon_9",
		desc = "所有法师英雄暴击率提升5%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21202] = {
		buff_id = 21202,
		quality = 2,
		name = "法师暴击",
		res_id = "buff_icon_9",
		desc = "所有法师英雄暴击率提升10%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21301] = {
		buff_id = 21301,
		quality = 1,
		name = "法师暴伤",
		res_id = "buff_icon_9",
		desc = "所有法师英雄暴击伤害提升10%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21302] = {
		buff_id = 21302,
		quality = 2,
		name = "法师暴伤",
		res_id = "buff_icon_9",
		desc = "所有法师英雄暴击伤害提升15%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21401] = {
		buff_id = 21401,
		quality = 1,
		name = "法师法伤",
		res_id = "buff_icon_9",
		desc = "所有法师英雄魔法伤害提升6%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21402] = {
		buff_id = 21402,
		quality = 2,
		name = "法师法伤",
		res_id = "buff_icon_9",
		desc = "所有法师英雄魔法伤害提升12%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21501] = {
		buff_id = 21501,
		quality = 1,
		name = "法师双暴",
		res_id = "buff_icon_7",
		desc = "所有法师英雄暴击率提升4%，暴击伤害提升7%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21502] = {
		buff_id = 21502,
		quality = 2,
		name = "法师双暴",
		res_id = "buff_icon_7",
		desc = "所有法师英雄暴击率提升6%，暴击伤害提升10%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21601] = {
		buff_id = 21601,
		quality = 1,
		name = "法师控制",
		res_id = "buff_icon_7",
		desc = "所有法师英雄控制率提升12%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21602] = {
		buff_id = 21602,
		quality = 2,
		name = "法师控制",
		res_id = "buff_icon_7",
		desc = "所有法师英雄控制率提升18%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[22101] = {
		buff_id = 22101,
		quality = 1,
		name = "辅助闪躲",
		res_id = "buff_icon_4",
		desc = "所有辅助英雄闪躲提升5%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[22102] = {
		buff_id = 22102,
		quality = 2,
		name = "辅助闪躲",
		res_id = "buff_icon_4",
		desc = "所有辅助英雄闪躲提升10%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[22201] = {
		buff_id = 22201,
		quality = 1,
		name = "辅助抗控",
		res_id = "buff_icon_1",
		desc = "所有辅助英雄抗控提升10%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[22202] = {
		buff_id = 22202,
		quality = 2,
		name = "辅助抗控",
		res_id = "buff_icon_1",
		desc = "所有辅助英雄抗控提升15%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[22301] = {
		buff_id = 22301,
		quality = 1,
		name = "辅助速度",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄速度提升6%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[22302] = {
		buff_id = 22302,
		quality = 2,
		name = "辅助速度",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄速度提升12%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[22401] = {
		buff_id = 22401,
		quality = 1,
		name = "辅助治疗",
		res_id = "buff_icon_2",
		desc = "所有辅助英雄治疗提升15%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[22402] = {
		buff_id = 22402,
		quality = 2,
		name = "辅助治疗",
		res_id = "buff_icon_2",
		desc = "所有辅助英雄治疗提升25%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[23101] = {
		buff_id = 23101,
		quality = 1,
		name = "坦克闪躲",
		res_id = "buff_icon_4",
		desc = "所有坦克英雄闪躲提升5%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[23102] = {
		buff_id = 23102,
		quality = 2,
		name = "坦克闪躲",
		res_id = "buff_icon_4",
		desc = "所有坦克英雄闪躲提升10%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[23201] = {
		buff_id = 23201,
		quality = 1,
		name = "坦克抗控",
		res_id = "buff_icon_1",
		desc = "所有坦克英雄抗控提升10%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[23202] = {
		buff_id = 23202,
		quality = 2,
		name = "坦克抗控",
		res_id = "buff_icon_1",
		desc = "所有坦克英雄抗控提升15%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[23301] = {
		buff_id = 23301,
		quality = 1,
		name = "坦克速度",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄速度提升6%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[23302] = {
		buff_id = 23302,
		quality = 2,
		name = "坦克速度",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄速度提升12%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[23401] = {
		buff_id = 23401,
		quality = 1,
		name = "坦克受疗",
		res_id = "buff_icon_2",
		desc = "所有坦克英雄受疗提升15%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[23402] = {
		buff_id = 23402,
		quality = 2,
		name = "坦克受疗",
		res_id = "buff_icon_2",
		desc = "所有坦克英雄受疗提升25%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[27101] = {
		buff_id = 27101,
		quality = 2,
		name = "疾风之术",
		res_id = "buff_icon_5",
		desc = "所有风系英雄伤害提升15%，速度提升10%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[27102] = {
		buff_id = 27102,
		quality = 3,
		name = "疾风之术",
		res_id = "buff_icon_5",
		desc = "所有风系英雄伤害提升25%，速度提升15%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[28101] = {
		buff_id = 28101,
		quality = 2,
		name = "光之守护",
		res_id = "buff_icon_1",
		desc = "所有光系英雄抗控提高20%、抗暴提高20%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[28102] = {
		buff_id = 28102,
		quality = 3,
		name = "光之守护",
		res_id = "buff_icon_1",
		desc = "所有光系英雄抗控提高30%、抗暴提高30%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[30001] = {
		buff_id = 30001,
		quality = 1,
		name = "涂毒",
		res_id = "buff_icon_3",
		desc = "伤害时30%概率附带持续1回合的【中毒】效果，每回合损失5%生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30002] = {
		buff_id = 30002,
		quality = 2,
		name = "涂毒",
		res_id = "buff_icon_3",
		desc = "伤害时45%概率附带持续1回合的【中毒】效果，每回合损失5%生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30003] = {
		buff_id = 30003,
		quality = 3,
		name = "涂毒",
		res_id = "buff_icon_3",
		desc = "伤害时60%概率附带持续1回合的【中毒】效果，每回合损失5%生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30101] = {
		buff_id = 30101,
		quality = 1,
		name = "伤害加深",
		res_id = "buff_icon_7",
		desc = "伤害时30%概率对受击单位附带持续2回合的20%【伤害加深】效果（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30102] = {
		buff_id = 30102,
		quality = 2,
		name = "伤害加深",
		res_id = "buff_icon_7",
		desc = "伤害时40%概率对受击单位附带持续2回合的20%【伤害加深】效果（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30103] = {
		buff_id = 30103,
		quality = 3,
		name = "伤害加深",
		res_id = "buff_icon_7",
		desc = "伤害时50%概率对受击单位附带持续2回合的20%【伤害加深】效果（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30201] = {
		buff_id = 30201,
		quality = 1,
		name = "受创急疗",
		res_id = "buff_icon_2",
		desc = "受到暴击时回复自身生命值上限5%的生命值，1回合只能触发1次（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30202] = {
		buff_id = 30202,
		quality = 2,
		name = "受创急疗",
		res_id = "buff_icon_2",
		desc = "受到暴击时回复自身生命值上限10%的生命值，1回合只能触发1次（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30203] = {
		buff_id = 30203,
		quality = 3,
		name = "受创急疗",
		res_id = "buff_icon_2",
		desc = "受到暴击时回复自身生命值上限15%的生命值，1回合只能触发1次（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30301] = {
		buff_id = 30301,
		quality = 1,
		name = "格挡盾",
		res_id = "buff_icon_1",
		desc = "每回合开始时24%概率给自身附带持续2回合的【格挡盾】，冷却2回合（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30302] = {
		buff_id = 30302,
		quality = 2,
		name = "格挡盾",
		res_id = "buff_icon_1",
		desc = "每回合开始时32%概率给自身附带持续2回合的【格挡盾】，冷却2回合（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30303] = {
		buff_id = 30303,
		quality = 3,
		name = "格挡盾",
		res_id = "buff_icon_1",
		desc = "每回合开始时40%概率给自身附带持续2回合的【格挡盾】，冷却2回合（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30401] = {
		buff_id = 30401,
		quality = 1,
		name = "自我修复",
		res_id = "buff_icon_2",
		desc = "每回合开始时40%概率回复自身10%生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30402] = {
		buff_id = 30402,
		quality = 2,
		name = "自我修复",
		res_id = "buff_icon_2",
		desc = "每回合开始时60%概率回复自身10%生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30403] = {
		buff_id = 30403,
		quality = 3,
		name = "自我修复",
		res_id = "buff_icon_2",
		desc = "每回合开始时80%概率回复自身10%生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30501] = {
		buff_id = 30501,
		quality = 1,
		name = "折刃",
		res_id = "buff_icon_10",
		desc = "攻击时40%降低1名受击单位25%攻击力，持续2回合（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30502] = {
		buff_id = 30502,
		quality = 2,
		name = "折刃",
		res_id = "buff_icon_10",
		desc = "攻击时60%降低1名受击单位25%攻击力，持续2回合（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30503] = {
		buff_id = 30503,
		quality = 3,
		name = "折刃",
		res_id = "buff_icon_10",
		desc = "攻击时80%降低1名受击单位25%攻击力，持续2回合（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30602] = {
		buff_id = 30602,
		quality = 2,
		name = "汲魂之术",
		res_id = "buff_icon_10",
		desc = "击杀敌方单位时回复自身最大生命值20%的生命（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30603] = {
		buff_id = 30603,
		quality = 3,
		name = "汲魂之术",
		res_id = "buff_icon_10",
		desc = "击杀敌方单位时回复自身最大生命值30%的生命（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30701] = {
		buff_id = 30701,
		quality = 1,
		name = "轻羽之术",
		res_id = "buff_icon_10",
		desc = "战斗开始时，己方所有英雄增加10%速度，持续4回合（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30702] = {
		buff_id = 30702,
		quality = 2,
		name = "轻羽之术",
		res_id = "buff_icon_10",
		desc = "战斗开始时，己方所有英雄增加15%速度，持续4回合（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30703] = {
		buff_id = 30703,
		quality = 3,
		name = "轻羽之术",
		res_id = "buff_icon_10",
		desc = "战斗开始时，己方所有英雄增加20%速度，持续4回合（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30802] = {
		buff_id = 30802,
		quality = 2,
		name = "活力之萃",
		res_id = "buff_icon_10",
		desc = "英雄生命值高于90%时，发动攻击会临时提升自身10%伤害（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30803] = {
		buff_id = 30803,
		quality = 3,
		name = "活力之萃",
		res_id = "buff_icon_10",
		desc = "英雄生命值高于90%时，发动攻击会临时提升自身20%伤害（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30902] = {
		buff_id = 30902,
		quality = 2,
		name = "荣光守护",
		res_id = "buff_icon_10",
		desc = "我方所有前排单位阵亡时，后排单位免伤提升30%，持续4回合且不可被驱散（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30903] = {
		buff_id = 30903,
		quality = 3,
		name = "荣光守护",
		res_id = "buff_icon_10",
		desc = "我方所有前排单位阵亡时，后排单位免伤提升30%，持续4回合且不可被驱散（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[35101] = {
		buff_id = 35101,
		quality = 1,
		name = "奥技净化",
		res_id = "buff_icon_10",
		desc = "回合开始时，有38%概率清除自身所有负面状态（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[35102] = {
		buff_id = 35102,
		quality = 2,
		name = "奥技净化",
		res_id = "buff_icon_10",
		desc = "回合开始时，有57%概率清除自身所有负面状态（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[35103] = {
		buff_id = 35103,
		quality = 3,
		name = "奥技净化",
		res_id = "buff_icon_10",
		desc = "回合开始时，有75%概率清除自身所有负面状态（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[41102] = {
		buff_id = 41102,
		quality = 2,
		name = "冰霜之手",
		res_id = "buff_icon_11",
		desc = "所有水系英雄攻击时均固定有20%概率【冰冻】单位2回合（若存在同系列技能则取效果更高者）",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[41103] = {
		buff_id = 41103,
		quality = 3,
		name = "冰霜之手",
		res_id = "buff_icon_11",
		desc = "所有水系英雄攻击时均固定有30%概率【冰冻】单位2回合（若存在同系列技能则取效果更高者）",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[41202] = {
		buff_id = 41202,
		quality = 2,
		name = "寒冰侵袭",
		res_id = "buff_icon_12",
		desc = "所有水系英雄对【减速】或【冰冻】下的单位伤害提升15%（若存在同系列技能则取效果更高者）",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[41203] = {
		buff_id = 41203,
		quality = 3,
		name = "寒冰侵袭",
		res_id = "buff_icon_12",
		desc = "所有水系英雄对【减速】或【冰冻】下的单位伤害提升30%（若存在同系列技能则取效果更高者）",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[42102] = {
		buff_id = 42102,
		quality = 2,
		name = "烈焰之躯",
		res_id = "buff_icon_10",
		desc = "火系英雄受到攻击时均有40%概率给攻击者附加1层【烈焰灼烧】（不与菲尼克斯的烈焰灼烧叠加）",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[42103] = {
		buff_id = 42103,
		quality = 3,
		name = "烈焰之躯",
		res_id = "buff_icon_10",
		desc = "火系英雄受到攻击时均有60%概率给攻击者附加1层【烈焰灼烧】（不与菲尼克斯的烈焰灼烧叠加）",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[42202] = {
		buff_id = 42202,
		quality = 2,
		name = "灼热之刃",
		res_id = "buff_icon_10",
		desc = "所有火系英雄造成的攻击均有40%概率额外再叠加1层【灼烧】（若存在同系列技能则取效果更高者）",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[42203] = {
		buff_id = 42203,
		quality = 3,
		name = "灼热之刃",
		res_id = "buff_icon_10",
		desc = "所有火系英雄造成的攻击均有60%概率额外再叠加1层【灼烧】（若存在同系列技能则取效果更高者）",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[43102] = {
		buff_id = 43102,
		quality = 2,
		name = "疾风一击",
		res_id = "buff_icon_10",
		desc = "所有风系英雄出手时，若速度比受击单位高，则暴击率提高20%（若存在同系列技能则取效果更高者）",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[43103] = {
		buff_id = 43103,
		quality = 3,
		name = "疾风一击",
		res_id = "buff_icon_10",
		desc = "所有风系英雄出手时，若速度比受击单位高，则暴击率提高30%（若存在同系列技能则取效果更高者）",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[44102] = {
		buff_id = 44102,
		quality = 2,
		name = "神灵之志",
		res_id = "buff_icon_10",
		desc = "光系英雄每回合开始时自身叠加1层【伤害+3%】效果，最多可叠10层，持续至战斗结束且不会被驱散（取同系列最高级生效）",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[44103] = {
		buff_id = 44103,
		quality = 3,
		name = "神灵之志",
		res_id = "buff_icon_10",
		desc = "光系英雄每回合开始时自身叠加1层【伤害+5%】效果，最多可叠10层，持续至战斗结束且不会被驱散（取同系列最高级生效）",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[45102] = {
		buff_id = 45102,
		quality = 2,
		name = "诅咒之刃",
		res_id = "buff_icon_10",
		desc = "所有暗系英雄攻击时50%概率额外叠加1层【诅咒】（若存在同系列技能则取效果更高者）",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[45103] = {
		buff_id = 45103,
		quality = 3,
		name = "诅咒之刃",
		res_id = "buff_icon_10",
		desc = "所有暗系英雄攻击时80%概率额外叠加1层【诅咒】（若存在同系列技能则取效果更高者）",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[45202] = {
		buff_id = 45202,
		quality = 2,
		name = "黑暗侵蚀",
		res_id = "buff_icon_10",
		desc = "所有暗系英雄单位对处于【诅咒】下的单位暴击率增加10%，暴击伤害增加15%（取同系列最高级生效）",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[45203] = {
		buff_id = 45203,
		quality = 3,
		name = "黑暗侵蚀",
		res_id = "buff_icon_10",
		desc = "所有暗系英雄单位对处于【诅咒】下的单位暴击率增加20%，暴击伤害增加30%（取同系列最高级生效）",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[46103] = {
		buff_id = 46103,
		quality = 3,
		name = "奥技物连",
		res_id = "buff_icon_10",
		desc = "战士英雄物攻有50%概率触发连击，再次释放技能，伤害、控制率为原来50%（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[46203] = {
		buff_id = 46203,
		quality = 3,
		name = "奥技暴追",
		res_id = "buff_icon_10",
		desc = "战士英雄使用物理攻击造成暴击时，100%再进行1次普攻（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[46303] = {
		buff_id = 46303,
		quality = 3,
		name = "奥技穿透",
		res_id = "buff_icon_10",
		desc = "战士英雄伤害结果忽视目标38%防御（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[47103] = {
		buff_id = 47103,
		quality = 3,
		name = "奥技法连",
		res_id = "buff_icon_10",
		desc = "法师英雄法攻有50%概率触发连击，再次释放技能，伤害、控制率为原来50%（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[47203] = {
		buff_id = 47203,
		quality = 3,
		name = "奥技挑衅",
		res_id = "buff_icon_10",
		desc = "法师英雄攻击有15%概率强制令目标对自己进行普攻，持续1回合（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[47303] = {
		buff_id = 47303,
		quality = 3,
		name = "奥技波动",
		res_id = "buff_icon_10",
		desc = "法师英雄造成魔法伤害时，最终伤害结果会在110-150%之间随机波动（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[48103] = {
		buff_id = 48103,
		quality = 3,
		name = "奥技再生",
		res_id = "buff_icon_10",
		desc = "辅助英雄在回合开始时恢复自身生命值上限7.5%的生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[48203] = {
		buff_id = 48203,
		quality = 3,
		name = "奥技保命",
		res_id = "buff_icon_10",
		desc = "辅助英雄在死亡时有75%概率复活，复活时回复少量生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[48303] = {
		buff_id = 48303,
		quality = 3,
		name = "奥技神佑",
		res_id = "buff_icon_10",
		desc = "辅助英雄在死亡时有20%概率复活，复活后恢复50%生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[49103] = {
		buff_id = 49103,
		quality = 3,
		name = "奥技再生",
		res_id = "buff_icon_10",
		desc = "坦克英雄在回合开始时恢复自身生命值上限7.5%的生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[49203] = {
		buff_id = 49203,
		quality = 3,
		name = "奥技保命",
		res_id = "buff_icon_10",
		desc = "坦克英雄在死亡时有75%概率复活，复活时回复少量生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[49303] = {
		buff_id = 49303,
		quality = 3,
		name = "奥技神佑",
		res_id = "buff_icon_10",
		desc = "坦克英雄在死亡时有20%概率复活，复活后恢复50%生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[60102] = {
		buff_id = 60102,
		quality = 2,
		name = "晶石之华",
		res_id = "buff_icon_10",
		desc = "使用一次永恒晶石，所有英雄攻击力提升10%，最多可叠加3层",
		range = {}
	},
	[60202] = {
		buff_id = 60202,
		quality = 2,
		name = "胜利旗帜",
		res_id = "buff_icon_10",
		desc = "每次战斗胜利，所有英雄提升攻击力10%，防御力5%，最多叠加3层",
		range = {}
	},
	[1001] = {
		buff_id = 1001,
		quality = 3,
		name = "强化-盛怒巨浪",
		res_id = "buff_icon_9",
		desc = "波塞冬的【盛怒巨浪】变为攻击敌方全体单位，且伤害提升20%",
		range = {
			{
				"partner",
				10505
			}
		}
	},
	[1002] = {
		buff_id = 1002,
		quality = 3,
		name = "强化-冰雪女王",
		res_id = "buff_icon_9",
		desc = "提升冰雪女王15%控制率和10%的速度",
		range = {
			{
				"partner",
				10502
			}
		}
	},
	[1003] = {
		buff_id = 1003,
		quality = 3,
		name = "强化-武神剑制",
		res_id = "buff_icon_9",
		desc = "瓦尔基里的【武神剑制】变为攻击敌方全体单位，且触发【灼烧】时额外增加1层",
		range = {
			{
				"partner",
				20508
			}
		}
	},
	[1004] = {
		buff_id = 1004,
		quality = 3,
		name = "强化-赤炎漩涡",
		res_id = "buff_icon_9",
		desc = "普罗米修斯的【赤炎漩涡】变为攻击敌方全体单位，且100%触发【伤害加深】",
		range = {
			{
				"partner",
				20507
			}
		}
	},
	[1005] = {
		buff_id = 1005,
		quality = 3,
		name = "强化-狂乱突袭",
		res_id = "buff_icon_9",
		desc = "斯芬克斯的【狂乱突袭】额外增加1个攻击目标，且触发【沉默】概率提升20%",
		range = {
			{
				"partner",
				30508
			}
		}
	},
	[1006] = {
		buff_id = 1006,
		quality = 3,
		name = "强化-风暴剑舞",
		res_id = "buff_icon_9",
		desc = "芬尼尔【风暴剑舞】溅射的单位增加2个，且溅射伤害提升20%",
		range = {
			{
				"partner",
				30509
			}
		}
	},
	[1007] = {
		buff_id = 1007,
		quality = 3,
		name = "强化-魔力音符",
		res_id = "buff_icon_9",
		desc = "维纳斯【魔力音符】攻击单位+1，且伤害提升30%",
		range = {
			{
				"partner",
				40509
			}
		}
	},
	[1008] = {
		buff_id = 1008,
		quality = 3,
		name = "强化-神灵大祭司",
		res_id = "buff_icon_9",
		desc = "提升神灵大祭司30%治疗量",
		range = {
			{
				"partner",
				40507
			}
		}
	},
	[1009] = {
		buff_id = 1009,
		quality = 3,
		name = "强化-黑暗之主",
		res_id = "buff_icon_9",
		desc = "黑暗之主的【涅影暴斩】技能变为攻击敌方全体单位，且100%触发【流血】",
		range = {
			{
				"partner",
				50504
			}
		}
	},
	[1010] = {
		buff_id = 1010,
		quality = 3,
		name = "强化-海拉",
		res_id = "buff_icon_9",
		desc = "提升海拉30%物理伤害",
		range = {
			{
				"partner",
				50508
			}
		}
	},
	[1011] = {
		buff_id = 1011,
		quality = 3,
		name = "强化-冥界制裁",
		res_id = "buff_icon_9",
		desc = "哈迪斯的【冥界制裁】额外增加1个攻击目标，且触发【眩晕】概率提升为100%",
		range = {
			{
				"partner",
				50502
			}
		}
	},
	[1012] = {
		buff_id = 1012,
		quality = 3,
		name = "强化-海蛇之拥",
		res_id = "buff_icon_9",
		desc = "耶梦加得的【海蛇之拥】额外增加1个攻击目标，冰冻概率提升20%",
		range = {
			{
				"partner",
				10510
			}
		}
	},
	[1013] = {
		buff_id = 1013,
		quality = 3,
		name = "强化-冰火之焰",
		res_id = "buff_icon_9",
		desc = "菲尼克斯【冰火之焰】火焰的[灼烧]变为[烈焰灼烧]且可与其余灼烧叠加1层，冰焰的回复率提升1倍",
		range = {
			{
				"partner",
				20504
			}
		}
	},
	[1014] = {
		buff_id = 1014,
		quality = 3,
		name = "强化-松鼠轰击",
		res_id = "buff_icon_9",
		desc = "拉塔托斯克的【松鼠轰击】必定大成功，且伤害提升20%",
		range = {
			{
				"partner",
				30510
			}
		}
	},
	[1015] = {
		buff_id = 1015,
		quality = 3,
		name = "强化-深海祝福",
		res_id = "buff_icon_9",
		desc = "娜迦公主的【深海祝福】额外对单位和自身附加一个【格挡盾】",
		range = {
			{
				"partner",
				10501
			}
		}
	},
	[99991] = {
		buff_id = 99991,
		quality = 1,
		name = "攻击加成",
		res_id = "buff_icon_1",
		desc = "攻击+1000%",
		range = {}
	},
	[99992] = {
		buff_id = 99992,
		quality = 1,
		name = "伤害加成",
		res_id = "buff_icon_1",
		desc = "伤害+1000%",
		range = {}
	},
	[99993] = {
		buff_id = 99993,
		quality = 1,
		name = "暴击率加成",
		res_id = "buff_icon_1",
		desc = "暴击率+1000%",
		range = {}
	},
	[99994] = {
		buff_id = 99994,
		quality = 1,
		name = "闪躲加成",
		res_id = "buff_icon_1",
		desc = "闪躲+1000%",
		range = {}
	},
	[99995] = {
		buff_id = 99995,
		quality = 1,
		name = "免伤加成",
		res_id = "buff_icon_1",
		desc = "免伤+1000%",
		range = {}
	},
	[99996] = {
		buff_id = 99996,
		quality = 1,
		name = "生命值加成",
		res_id = "buff_icon_1",
		desc = "生命值上限+1000%",
		range = {}
	}
}

function Config.PlanesData.data_buff_fun(slot0)
	slot1 = Config.PlanesData.data_buff[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PlanesData.data_buff[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
