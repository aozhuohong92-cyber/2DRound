Config = Config or {}
Config.SecretDunData = Config.SecretDunData or {}
Config.SecretDunData.data_const_length = 12
Config.SecretDunData.data_const = {
	start_unixtime = {
		val = 1576530000,
		desc = "起始时间戳"
	},
	update_day = {
		val = 2,
		desc = "刷新天数"
	},
	filter_condition = {
		desc = "",
		val = {
			1,
			1,
			0
		}
	},
	calculating_coefficient = {
		val = 3000,
		desc = "玩家匹配战力取值系数1"
	},
	open_lev = {
		val = 30,
		desc = "玩法达30级开启"
	},
	number_player = {
		val = 10,
		desc = "租借英雄匹配玩家数量"
	},
	correction_factor = {
		val = 1,
		desc = "租借英雄匹配英雄修正系数"
	},
	combat_section = {
		desc = "租借英雄玩家战力匹配区间",
		val = {
			850,
			1150
		}
	},
	planes_rule = {
		val = 0,
		desc = [[
1.玩法重置后，玩家可选择1个副本进入，此后本轮中不可更改进入其他副本；每个副本开启除了玩家等级、战力达标外，还需要挑战前置副本达100%进度
2.每个副本首次进度达100%后，不仅能领取<div fontcolor=65df74>首通奖励</div>，还可永久加成副本中所有宝箱奖励
3.副本中玩家通过操作点击场景来操作冒险形象在副本地图场景中行走，往不同区域行走可扩充地图视野
4.地图中包含多种事件，如宝箱守卫、租借英雄、增益遗物、随机奖励等，击败宝箱守卫或首领可获得大量<div fontcolor=65df74>征战勋章</div>和<div fontcolor=65df74>贝里</div>
5.地图中包含多个选择节点（事件多选一），请玩家根据自身情况选择最适合的事件，来更好地提高副本进度
6.玩法每2天重置1次，重置时间点为00:00，重置后副本进度、探险背包、遗物将被清空，所有已开启副本变为可选择状态，重置前10分钟玩家将不能触发事件
7.玩家开启家园后，可通过更换家园形象来替换冒险形象
8.部分守卫与首领存在难度加成，难度加成越高则其实力越强（难度加成不反映于面板战力）]]
	},
	skip_battle_lev = {
		val = 80,
		desc = "玩家到达80级开启"
	},
	upper_limit_lev = {
		val = 30,
		desc = "守卫匹配等级上限"
	},
	lower_limit_lev = {
		val = 30,
		desc = "守卫匹配等级下限"
	}
}

function Config.SecretDunData.data_const_fun(slot0)
	slot1 = Config.SecretDunData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.SecretDunData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.SecretDunData.data_dun_map_length = 5
Config.SecretDunData.data_dun_map = {
	{
		{
			map_res_id = 1
		},
		{
			map_res_id = 1
		}
	},
	{
		{
			map_res_id = 2
		},
		{
			map_res_id = 2
		}
	},
	{
		{
			map_res_id = 3
		},
		{
			map_res_id = 3
		}
	},
	{
		{
			map_res_id = 4
		},
		{
			map_res_id = 4
		}
	},
	{
		{
			map_res_id = 5
		},
		{
			map_res_id = 5
		}
	}
}
Config.SecretDunData.data_dun_info_length = 5
Config.SecretDunData.data_dun_info = {
	{
		dun_res_id = 1,
		name = "极冰雪原"
	},
	{
		dun_res_id = 2,
		name = "熔火炼狱"
	},
	{
		dun_res_id = 3,
		name = "风棘之森"
	},
	{
		dun_res_id = 4,
		name = "大海遗迹"
	},
	{
		dun_res_id = 5,
		name = "荒黯之墟"
	}
}
Config.SecretDunData.data_max_dun_num_length = 5
Config.SecretDunData.data_max_dun_num = {
	2,
	2,
	2,
	2,
	2
}
Config.SecretDunData.data_customs_length = 5
Config.SecretDunData.data_customs = {
	{
		award_desc = "可获[海贼英雄碎片]",
		camp = 1,
		music = "s_005",
		desc = [[
强大的信念之力相互冲撞，开辟出了独立于冒险大陆的时间与空间，这样的时空被称为“长环岛”。
极冰雪原中，白雪皑皑，一眼望不到边际。
偶尔有暴风雪席卷而来，让身处其中的人迷失了方向。
但仍有无数船长趋之若鹜，期望寻找到埋藏于冰雪中的宝藏与真相。]],
		lev_limit = 30,
		battle_bg_id = 11001,
		power_limit = 0,
		add_radio = 0,
		res_id = 1,
		id_limit = {},
		first_reward = {
			{
				10403,
				2
			},
			{
				25,
				1000
			},
			{
				72001,
				50
			}
		},
		award = {
			29105,
			29104,
			25,
			1
		}
	},
	{
		award_desc = "可获[草帽联盟英雄碎片]",
		camp = 2,
		music = "s_004",
		desc = "强大的信念之力相互冲撞，开辟出了独立于冒险大陆的时间与空间，这样的时空被称为“长环岛”。\n熔火炼狱之中充斥着灼热而狂暴的气息，用炼狱二字来形容恰如其分。\n地底的岩浆喷涌着，仿佛一不小心触碰到就会被熔化。",
		lev_limit = 45,
		battle_bg_id = 11002,
		power_limit = 150000,
		add_radio = 200,
		res_id = 2,
		id_limit = {
			1
		},
		first_reward = {
			{
				10403,
				2
			},
			{
				25,
				1500
			},
			{
				72001,
				50
			}
		},
		award = {
			29205,
			29204,
			25,
			1
		}
	},
	{
		award_desc = "可获[强者英雄碎片]",
		camp = 3,
		music = "s_005",
		desc = "强大的信念之力相互冲撞，开辟出了独立于冒险大陆的时间与空间，这样的时空被称为“长环岛”。\n风棘之森中，偶尔会有清风吹拂，将树叶吹向天空。\n万物在轻拂的风中生长，世界也充满着生机与绿意。",
		lev_limit = 45,
		battle_bg_id = 11003,
		power_limit = 500000,
		add_radio = 200,
		res_id = 3,
		id_limit = {
			2
		},
		first_reward = {
			{
				10403,
				2
			},
			{
				25,
				2000
			},
			{
				72001,
				50
			}
		},
		award = {
			29305,
			29304,
			25,
			1
		}
	},
	{
		award_desc = "可获[海军英雄碎片]",
		camp = 4,
		music = "s_004",
		desc = "强大的信念之力相互冲撞，开辟出了独立于冒险大陆的时间与空间，这样的时空被称为“长环岛”。\n大海遗迹中一片祥和，令人感觉身处于神的庇佑之下。\n但安宁的世界之中，却早已失去了真正的生命气息，只残留着逝去神明的魂。",
		lev_limit = 45,
		battle_bg_id = 11004,
		power_limit = 1000000,
		add_radio = 200,
		res_id = 4,
		id_limit = {
			3
		},
		first_reward = {
			{
				10403,
				2
			},
			{
				25,
				2500
			},
			{
				72001,
				50
			}
		},
		award = {
			29405,
			29905,
			25,
			1,
			29404
		}
	},
	{
		award_desc = "可获[五皇团英雄碎片]",
		camp = 5,
		music = "s_004",
		desc = "强大的信念之力相互冲撞，开辟出了独立于冒险大陆的时间与空间，这样的时空被称为“长环岛”。\n荒黯之墟中迷雾重重，从深处传来一阵阵阴冷。\n这里的气息与光线使人感到不适，却是黑暗生物生存的沃土。",
		lev_limit = 45,
		battle_bg_id = 11005,
		power_limit = 1800000,
		add_radio = 200,
		res_id = 5,
		id_limit = {
			4
		},
		first_reward = {
			{
				10403,
				2
			},
			{
				25,
				3000
			},
			{
				72001,
				50
			}
		},
		award = {
			29505,
			29905,
			25,
			1,
			29504
		}
	}
}

function Config.SecretDunData.data_customs_fun(slot0)
	slot1 = Config.SecretDunData.data_customs[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.SecretDunData.data_customs[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.SecretDunData.data_evt_info_length = 387
Config.SecretDunData.data_evt_info = {
	[0] = {
		is_walk = 1,
		type = 0,
		reversal = 0,
		name = "",
		group_id = 0,
		ext = {},
		res_1 = {},
		res_2 = {},
		offset = {},
		reward = {}
	},
	[1001] = {
		is_walk = 1,
		type = 4,
		reversal = 0,
		name = "出生点",
		group_id = 0,
		ext = {},
		res_1 = {},
		res_2 = {},
		offset = {},
		reward = {}
	},
	[2001] = {
		is_walk = 1,
		type = 3,
		reversal = 0,
		name = "小宝箱",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			2001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[2002] = {
		is_walk = 1,
		type = 3,
		reversal = 0,
		name = "小宝箱",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			2001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[2003] = {
		is_walk = 1,
		type = 3,
		reversal = 0,
		name = "小宝箱",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			2001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[2004] = {
		is_walk = 1,
		type = 3,
		reversal = 0,
		name = "小宝箱",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			2001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[2005] = {
		is_walk = 1,
		type = 3,
		reversal = 0,
		name = "小宝箱",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			2001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[2006] = {
		is_walk = 1,
		type = 3,
		reversal = 0,
		name = "小宝箱",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			2001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[2007] = {
		is_walk = 1,
		type = 3,
		reversal = 0,
		name = "小宝箱",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			2001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[2008] = {
		is_walk = 1,
		type = 3,
		reversal = 0,
		name = "小宝箱",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			2001
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[2011] = {
		is_walk = 1,
		type = 3,
		reversal = 0,
		name = "大宝箱",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			2003
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[2012] = {
		is_walk = 1,
		type = 3,
		reversal = 0,
		name = "大宝箱",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			2003
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3001] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 0,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[3002] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 0,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[3011] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 0,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[3021] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 0,
		ext = {
			101,
			102,
			103
		},
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
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "高级遗物",
		group_id = 0,
		ext = {
			201,
			202,
			203
		},
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
	[5001] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 0,
		ext = {
			{
				"group",
				1001
			}
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
	[5002] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 0,
		ext = {
			{
				"group",
				1001
			}
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
	[5003] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 0,
		ext = {
			{
				"group",
				1001
			}
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
	[5004] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 0,
		ext = {
			{
				"group",
				1001
			}
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
	[5005] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 0,
		ext = {
			{
				"group",
				1001
			}
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
	[5006] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 0,
		ext = {
			{
				"group",
				1001
			}
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
	[5007] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 0,
		ext = {
			{
				"group",
				1001
			}
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
	[5008] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 0,
		ext = {
			{
				"group",
				1001
			}
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
	[5009] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 0,
		ext = {
			{
				"group",
				1001
			}
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
	[400001] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 1,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[400002] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 2,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[400003] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 3,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[400004] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 4,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[400005] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 5,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[400006] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 6,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[400007] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 7,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[400008] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 8,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[400009] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 9,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[400010] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 10,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[400101] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 1,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[400102] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 2,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[400103] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 3,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[400104] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 4,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[400105] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 5,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[400106] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 6,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[400107] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 7,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[400108] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 8,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[400109] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 9,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[400110] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 10,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[400201] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 1,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[400202] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 2,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[400203] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 3,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[400204] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 4,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[400205] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 5,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[400206] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 6,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[400207] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 7,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[400208] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 8,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[400209] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 9,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[400210] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 10,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[400301] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 1,
		ext = {
			101,
			102,
			103
		},
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
	[400302] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 2,
		ext = {
			101,
			102,
			103
		},
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
	[400303] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 3,
		ext = {
			101,
			102,
			103
		},
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
	[400304] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 4,
		ext = {
			101,
			102,
			103
		},
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
	[400305] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 5,
		ext = {
			101,
			102,
			103
		},
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
	[400306] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 6,
		ext = {
			101,
			102,
			103
		},
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
	[400307] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 7,
		ext = {
			101,
			102,
			103
		},
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
	[400308] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 8,
		ext = {
			101,
			102,
			103
		},
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
	[400309] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 9,
		ext = {
			101,
			102,
			103
		},
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
	[400310] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 10,
		ext = {
			101,
			102,
			103
		},
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
	[400401] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "高级遗物",
		group_id = 1,
		ext = {
			201,
			202,
			203
		},
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
	[400402] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "高级遗物",
		group_id = 2,
		ext = {
			201,
			202,
			203
		},
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
	[400403] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "高级遗物",
		group_id = 3,
		ext = {
			201,
			202,
			203
		},
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
	[400404] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "高级遗物",
		group_id = 4,
		ext = {
			201,
			202,
			203
		},
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
	[400405] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "高级遗物",
		group_id = 5,
		ext = {
			201,
			202,
			203
		},
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
	[400406] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "高级遗物",
		group_id = 6,
		ext = {
			201,
			202,
			203
		},
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
	[400407] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "高级遗物",
		group_id = 7,
		ext = {
			201,
			202,
			203
		},
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
	[400408] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "高级遗物",
		group_id = 8,
		ext = {
			201,
			202,
			203
		},
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
	[400409] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "高级遗物",
		group_id = 9,
		ext = {
			201,
			202,
			203
		},
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
	[400410] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "高级遗物",
		group_id = 10,
		ext = {
			201,
			202,
			203
		},
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
	[600001] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 1,
		ext = {
			{
				"group",
				1001
			}
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
				64
			},
			{
				1,
				64000
			}
		}
	},
	[600002] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 2,
		ext = {
			{
				"group",
				1002
			}
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
				96
			},
			{
				1,
				80000
			}
		}
	},
	[600003] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 3,
		ext = {
			{
				"group",
				1003
			}
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
				128
			},
			{
				1,
				96000
			}
		}
	},
	[600004] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 4,
		ext = {
			{
				"group",
				1004
			}
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
				160
			},
			{
				1,
				112000
			}
		}
	},
	[600005] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 5,
		ext = {
			{
				"group",
				1004
			}
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
		reward = {}
	},
	[600006] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 6,
		ext = {
			{
				"group",
				1005
			}
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
				192
			},
			{
				1,
				128000
			}
		}
	},
	[600007] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 7,
		ext = {
			{
				"group",
				1006
			}
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
	[600008] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 8,
		ext = {
			{
				"group",
				1007
			}
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
				256
			},
			{
				1,
				160000
			}
		}
	},
	[600009] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 9,
		ext = {
			{
				"group",
				1008
			}
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
				288
			},
			{
				1,
				176000
			}
		}
	},
	[600010] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "守卫",
		group_id = 10,
		ext = {
			{
				"group",
				1008
			}
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
		reward = {}
	},
	[600501] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "高级守卫",
		group_id = 0,
		ext = {
			{
				"group",
				2005
			}
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
				288
			},
			{
				1,
				192000
			}
		}
	},
	[600101] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "高级守卫",
		group_id = 1,
		ext = {
			{
				"group",
				2001
			}
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
				96
			},
			{
				1,
				96000
			}
		}
	},
	[600102] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "高级守卫",
		group_id = 2,
		ext = {
			{
				"group",
				2002
			}
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
				144
			},
			{
				1,
				120000
			}
		}
	},
	[600103] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "高级守卫",
		group_id = 3,
		ext = {
			{
				"group",
				2003
			}
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
				192
			},
			{
				1,
				144000
			}
		}
	},
	[600104] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "高级守卫",
		group_id = 4,
		ext = {
			{
				"group",
				2004
			}
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
				240
			},
			{
				1,
				168000
			}
		}
	},
	[600105] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "高级守卫",
		group_id = 5,
		ext = {
			{
				"group",
				2004
			}
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
		reward = {}
	},
	[600106] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "高级守卫",
		group_id = 6,
		ext = {
			{
				"group",
				2005
			}
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
				288
			},
			{
				1,
				192000
			}
		}
	},
	[600107] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "高级守卫",
		group_id = 7,
		ext = {
			{
				"group",
				2006
			}
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
	[600108] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "高级守卫",
		group_id = 8,
		ext = {
			{
				"group",
				2007
			}
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
				384
			},
			{
				1,
				240000
			}
		}
	},
	[600109] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "高级守卫",
		group_id = 9,
		ext = {
			{
				"group",
				2008
			}
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
				432
			},
			{
				1,
				264000
			}
		}
	},
	[600110] = {
		is_walk = 0,
		type = 2,
		reversal = 0,
		name = "高级守卫",
		group_id = 10,
		ext = {
			{
				"group",
				2008
			}
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
		reward = {}
	},
	[90111] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "1*1_冰块",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20103
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[90112] = {
		is_walk = 0,
		type = 14,
		reversal = 1,
		name = "1*1_冰块（翻转）",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20103
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[90113] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "1*1_冰锥",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20102
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[90114] = {
		is_walk = 0,
		type = 14,
		reversal = 1,
		name = "1*1_冰锥（翻转）",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20102
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[90121] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "2*2_大冰锥",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20101
		},
		res_2 = {},
		offset = {
			0,
			10
		},
		reward = {}
	},
	[90122] = {
		is_walk = 0,
		type = 14,
		reversal = 1,
		name = "2*2_大冰锥（翻转）",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20101
		},
		res_2 = {},
		offset = {
			0,
			10
		},
		reward = {}
	},
	[90123] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "2*2_湖面",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20104
		},
		res_2 = {},
		offset = {
			0,
			-45
		},
		reward = {}
	},
	[90124] = {
		is_walk = 0,
		type = 14,
		reversal = 1,
		name = "2*2_湖面（翻转）",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20104
		},
		res_2 = {},
		offset = {
			0,
			-45
		},
		reward = {}
	},
	[90211] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "1*1_矿晶",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20204
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {}
	},
	[90212] = {
		is_walk = 0,
		type = 14,
		reversal = 1,
		name = "1*1_矿晶（翻转）",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20204
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {}
	},
	[90213] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "1*1_石头",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20205
		},
		res_2 = {},
		offset = {
			-15,
			30
		},
		reward = {}
	},
	[90214] = {
		is_walk = 0,
		type = 14,
		reversal = 1,
		name = "1*1_石头（翻转）",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20205
		},
		res_2 = {},
		offset = {
			-15,
			30
		},
		reward = {}
	},
	[90221] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "2*2_石柱",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20202
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[90222] = {
		is_walk = 0,
		type = 14,
		reversal = 1,
		name = "2*2_石柱（翻转）",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20202
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[90231] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "3*3_熔岩池",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20201
		},
		res_2 = {},
		offset = {
			0,
			-100
		},
		reward = {}
	},
	[90232] = {
		is_walk = 0,
		type = 14,
		reversal = 1,
		name = "3*3_熔岩池（翻转）",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20201
		},
		res_2 = {},
		offset = {
			0,
			-100
		},
		reward = {}
	},
	[90241] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "2*1_残骸",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20203
		},
		res_2 = {},
		offset = {
			50,
			-10
		},
		reward = {}
	},
	[90311] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "1*1藤蔓",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20304
		},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[90312] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "1*1小灌木丛",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20303
		},
		res_2 = {},
		offset = {
			0,
			8
		},
		reward = {}
	},
	[90321] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "2*2树桩",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20302
		},
		res_2 = {},
		offset = {},
		reward = {}
	},
	[90322] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "2*2风化石块",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20301
		},
		res_2 = {},
		offset = {},
		reward = {}
	},
	[90411] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "1*1残缺石柱",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20401
		},
		res_2 = {},
		offset = {
			5,
			65
		},
		reward = {}
	},
	[90412] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "1*1方形石柱",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20402
		},
		res_2 = {},
		offset = {
			0,
			25
		},
		reward = {}
	},
	[90421] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "2*2雕像",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20404
		},
		res_2 = {},
		offset = {
			0,
			72
		},
		reward = {}
	},
	[90422] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "2*2金字塔",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20403
		},
		res_2 = {},
		offset = {
			0,
			-12
		},
		reward = {}
	},
	[90521] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "2*2雕像",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20501
		},
		res_2 = {},
		offset = {
			3,
			50
		},
		reward = {}
	},
	[90511] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "1*1石柱",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20502
		},
		res_2 = {},
		offset = {
			0,
			77
		},
		reward = {}
	},
	[90522] = {
		is_walk = 0,
		type = 14,
		reversal = 0,
		name = "2*2石块",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			20503
		},
		res_2 = {},
		offset = {},
		reward = {}
	},
	[1011201] = {
		is_walk = 0,
		type = 5,
		reversal = 0,
		name = "告示牌",
		group_id = 0,
		ext = {
			1001
		},
		res_1 = {
			1,
			1011
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[1011301] = {
		is_walk = 0,
		type = 8,
		reversal = 0,
		name = "传送门",
		group_id = 0,
		ext = {
			2
		},
		res_1 = {
			1,
			1021
		},
		res_2 = {},
		offset = {
			0,
			60
		},
		reward = {}
	},
	[1011501] = {
		is_walk = 0,
		type = 10,
		reversal = 0,
		name = "神秘老者",
		group_id = 0,
		ext = {
			{
				1001,
				500
			}
		},
		res_1 = {
			1,
			1181
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[1011601] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[1014101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 1,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[1014102] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 1,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[1014103] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 1,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[1014104] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 1,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[1014201] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 2,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[1014202] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 2,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[1014203] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 2,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[1014204] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 2,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[1014301] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 3,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[1014302] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 3,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[1014303] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 3,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[1014304] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 3,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[1014401] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 4,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[1014402] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 4,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[1014403] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 4,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[1014404] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 4,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[1014405] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 4,
		ext = {
			101,
			102,
			103
		},
		res_1 = {
			1,
			1161
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[1015101] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10101
			},
			{
				"strength",
				1000
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[1015201] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10101
			},
			{
				"strength",
				1500
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[1015301] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				40101
			},
			{
				"strength",
				1150
			}
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[1015501] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20101
			},
			{
				"strength",
				900
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[1015601] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20101
			},
			{
				"strength",
				1200
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[1015701] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				30101
			},
			{
				"strength",
				1300
			}
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {
			{
				25,
				1200
			},
			{
				1,
				960000
			}
		}
	},
	[1018101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "木锤",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1055
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[1018201] = {
		is_walk = 0,
		type = 11,
		reversal = 0,
		name = "障碍",
		group_id = 0,
		ext = {
			{
				300001,
				1
			}
		},
		res_1 = {
			1,
			1051
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[1018501] = {
		is_walk = 0,
		type = 12,
		reversal = 0,
		name = "开关",
		group_id = 0,
		ext = {
			1018601,
			1018701,
			1018801
		},
		res_1 = {
			1,
			1091
		},
		res_2 = {
			1,
			1092
		},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[1018601] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[1018701] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[1018801] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[1021201] = {
		is_walk = 0,
		type = 5,
		reversal = 0,
		name = "告示牌",
		group_id = 0,
		ext = {
			1002
		},
		res_1 = {
			1,
			1011
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[1021301] = {
		is_walk = 0,
		type = 8,
		reversal = 0,
		name = "传送门",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {
			1,
			1021
		},
		res_2 = {},
		offset = {
			0,
			60
		},
		reward = {}
	},
	[1021501] = {
		is_walk = 0,
		type = 10,
		reversal = 0,
		name = "神秘老者",
		group_id = 0,
		ext = {
			{
				1002,
				500
			}
		},
		res_1 = {
			1,
			1181
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[1021601] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[1024101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 1,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[1024102] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 1,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[1024103] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 1,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[1024104] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 1,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[1024201] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 2,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[1024202] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 2,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[1024203] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 2,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[1024204] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 2,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[1024301] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 3,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[1024302] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 3,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[1024303] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 3,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[1024304] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 3,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[1024401] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 4,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[1024402] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 4,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[1024403] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 4,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[1024404] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 4,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[1024405] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 4,
		ext = {
			101,
			102,
			103
		},
		res_1 = {
			1,
			1161
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[1025101] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10101
			},
			{
				"strength",
				1000
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[1025201] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10101
			},
			{
				"strength",
				1500
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[1025301] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				40101
			},
			{
				"strength",
				1150
			}
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[1025501] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20101
			},
			{
				"strength",
				900
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[1025601] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20101
			},
			{
				"strength",
				1200
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[1025701] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				30101
			},
			{
				"strength",
				1300
			}
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {
			{
				25,
				1200
			},
			{
				1,
				960000
			}
		}
	},
	[1028101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "木锤",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1055
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[1028201] = {
		is_walk = 0,
		type = 11,
		reversal = 0,
		name = "障碍",
		group_id = 0,
		ext = {
			{
				300001,
				1
			}
		},
		res_1 = {
			1,
			1051
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[1028501] = {
		is_walk = 0,
		type = 12,
		reversal = 0,
		name = "开关",
		group_id = 0,
		ext = {
			1028601,
			1028701,
			1028801
		},
		res_1 = {
			1,
			1091
		},
		res_2 = {
			1,
			1092
		},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[1028601] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[1028701] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[1028801] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[2011201] = {
		is_walk = 0,
		type = 5,
		reversal = 0,
		name = "告示牌",
		group_id = 0,
		ext = {
			2001
		},
		res_1 = {
			1,
			1011
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[2011301] = {
		is_walk = 0,
		type = 8,
		reversal = 0,
		name = "传送门",
		group_id = 0,
		ext = {
			2
		},
		res_1 = {
			1,
			1021
		},
		res_2 = {},
		offset = {
			0,
			60
		},
		reward = {}
	},
	[2011501] = {
		is_walk = 0,
		type = 10,
		reversal = 0,
		name = "神秘老者",
		group_id = 0,
		ext = {
			{
				2001,
				500
			}
		},
		res_1 = {
			1,
			1181
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[2011601] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[2014101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 1,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[2014102] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 1,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[2014103] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 1,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[2014104] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 1,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[2014201] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 2,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[2014202] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 2,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[2014203] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 2,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[2014204] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 2,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[2014301] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 3,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[2014302] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 3,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[2014303] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 3,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[2014304] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 3,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[2014401] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 4,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[2014402] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 4,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[2014403] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 4,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[2014404] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 4,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[2014405] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 4,
		ext = {
			101,
			102,
			103
		},
		res_1 = {
			1,
			1161
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[2015101] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10201
			},
			{
				"strength",
				1000
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[2015201] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10201
			},
			{
				"strength",
				1250
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[2015301] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				40201
			},
			{
				"strength",
				900
			}
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[2015501] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20201
			},
			{
				"strength",
				800
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[2015601] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20201
			},
			{
				"strength",
				1100
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[2015701] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				30201
			},
			{
				"strength",
				1300
			}
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {
			{
				25,
				1200
			},
			{
				1,
				960000
			}
		}
	},
	[2018101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "木锤",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1055
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[2018201] = {
		is_walk = 0,
		type = 11,
		reversal = 0,
		name = "障碍",
		group_id = 0,
		ext = {
			{
				300001,
				1
			}
		},
		res_1 = {
			1,
			1051
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[2018501] = {
		is_walk = 0,
		type = 12,
		reversal = 0,
		name = "开关",
		group_id = 0,
		ext = {
			1018601,
			1018701,
			1018801
		},
		res_1 = {
			1,
			1091
		},
		res_2 = {
			1,
			1092
		},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[2018601] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[2018701] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[2018801] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[2021201] = {
		is_walk = 0,
		type = 5,
		reversal = 0,
		name = "告示牌",
		group_id = 0,
		ext = {
			2002
		},
		res_1 = {
			1,
			1011
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[2021301] = {
		is_walk = 0,
		type = 8,
		reversal = 0,
		name = "传送门",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {
			1,
			1021
		},
		res_2 = {},
		offset = {
			0,
			60
		},
		reward = {}
	},
	[2021501] = {
		is_walk = 0,
		type = 10,
		reversal = 0,
		name = "神秘老者",
		group_id = 0,
		ext = {
			{
				2002,
				500
			}
		},
		res_1 = {
			1,
			1181
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[2021601] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[2024101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 1,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[2024102] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 1,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[2024103] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 1,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[2024104] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 1,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[2024201] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 2,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[2024202] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 2,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[2024203] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 2,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[2024204] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 2,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[2024301] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 3,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[2024302] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 3,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[2024303] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 3,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[2024304] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 3,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[2024401] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 4,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[2024402] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 4,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[2024403] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活十字架",
		group_id = 4,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[2024404] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 4,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[2024405] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 4,
		ext = {
			101,
			102,
			103
		},
		res_1 = {
			1,
			1161
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {}
	},
	[2025101] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10201
			},
			{
				"strength",
				1000
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[2025201] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10201
			},
			{
				"strength",
				1250
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[2025301] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				40201
			},
			{
				"strength",
				900
			}
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[2025501] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20201
			},
			{
				"strength",
				900
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[2025601] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20201
			},
			{
				"strength",
				1200
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {}
	},
	[2025701] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				30201
			},
			{
				"strength",
				1300
			}
		},
		res_1 = {
			2,
			"E27615"
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {
			{
				25,
				1200
			},
			{
				1,
				960000
			}
		}
	},
	[2028101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "木锤",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1055
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[2028201] = {
		is_walk = 0,
		type = 11,
		reversal = 0,
		name = "障碍",
		group_id = 0,
		ext = {
			{
				300001,
				1
			}
		},
		res_1 = {
			1,
			1051
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[2028501] = {
		is_walk = 0,
		type = 12,
		reversal = 0,
		name = "开关",
		group_id = 0,
		ext = {
			1028601,
			1028701,
			1028801
		},
		res_1 = {
			1,
			1091
		},
		res_2 = {
			1,
			1092
		},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[2028601] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[2028701] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[2028801] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[3011201] = {
		is_walk = 0,
		type = 5,
		reversal = 0,
		name = "告示牌",
		group_id = 0,
		ext = {
			3001
		},
		res_1 = {
			1,
			1011
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3011301] = {
		is_walk = 0,
		type = 8,
		reversal = 0,
		name = "传送门",
		group_id = 0,
		ext = {
			2
		},
		res_1 = {
			1,
			1021
		},
		res_2 = {},
		offset = {
			0,
			60
		},
		reward = {}
	},
	[3011501] = {
		is_walk = 0,
		type = 10,
		reversal = 0,
		name = "神秘老者",
		group_id = 0,
		ext = {
			{
				3001,
				100
			}
		},
		res_1 = {
			1,
			1181
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3011601] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3014101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 1,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3014102] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 1,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[3014103] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活祭坛",
		group_id = 1,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[3014104] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 1,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[3014201] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 2,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3014202] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 2,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[3014203] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活祭坛",
		group_id = 2,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[3014204] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 2,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[3014301] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 3,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3014302] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 3,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[3014303] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活祭坛",
		group_id = 3,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[3014304] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 3,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[3014401] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 4,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3014402] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 4,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[3014403] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活祭坛",
		group_id = 4,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[3014404] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 4,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[3014405] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 4,
		ext = {
			101,
			102,
			103
		},
		res_1 = {
			1,
			1161
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3015101] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10301
			},
			{
				"strength",
				1000
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3015201] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10301
			},
			{
				"strength",
				1250
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3015301] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				40301
			},
			{
				"strength",
				900
			}
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
	[3015501] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20301
			},
			{
				"strength",
				1000
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3015601] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20301
			},
			{
				"strength",
				1200
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3015701] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				30301
			},
			{
				"strength",
				1350
			}
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
		reward = {
			{
				25,
				1200
			},
			{
				1,
				960000
			}
		}
	},
	[3018101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "木锤",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1055
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3018201] = {
		is_walk = 0,
		type = 11,
		reversal = 0,
		name = "障碍",
		group_id = 0,
		ext = {
			{
				300001,
				1
			}
		},
		res_1 = {
			1,
			1051
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3018501] = {
		is_walk = 0,
		type = 12,
		reversal = 0,
		name = "开关",
		group_id = 0,
		ext = {
			1018601,
			1018701,
			1018801
		},
		res_1 = {
			1,
			1091
		},
		res_2 = {
			1,
			1092
		},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[3018601] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[3018701] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[3018801] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[3021201] = {
		is_walk = 0,
		type = 5,
		reversal = 0,
		name = "告示牌",
		group_id = 0,
		ext = {
			3002
		},
		res_1 = {
			1,
			1011
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3021301] = {
		is_walk = 0,
		type = 8,
		reversal = 0,
		name = "传送门",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {
			1,
			1021
		},
		res_2 = {},
		offset = {
			0,
			60
		},
		reward = {}
	},
	[3021501] = {
		is_walk = 0,
		type = 10,
		reversal = 0,
		name = "神秘老者",
		group_id = 0,
		ext = {
			{
				3002,
				100
			}
		},
		res_1 = {
			1,
			1181
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3021601] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3024101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 1,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3024102] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 1,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[3024103] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活祭坛",
		group_id = 1,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[3024104] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 1,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[3024201] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 2,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3024202] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 2,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[3024203] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活祭坛",
		group_id = 2,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[3024204] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 2,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[3024301] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 3,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3024302] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 3,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[3024303] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活祭坛",
		group_id = 3,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[3024304] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 3,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[3024401] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 4,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3024402] = {
		is_walk = 0,
		type = 7,
		reversal = 0,
		name = "回复泉水",
		group_id = 4,
		ext = {
			{
				"all_add_hp",
				30
			}
		},
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
	[3024403] = {
		is_walk = 0,
		type = 16,
		reversal = 0,
		name = "复活祭坛",
		group_id = 4,
		ext = {
			{
				"revive",
				70,
				100
			}
		},
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
	[3024404] = {
		is_walk = 0,
		type = 9,
		reversal = 0,
		name = "英雄雇佣",
		group_id = 4,
		ext = {
			{
				"power",
				{
					{
						950,
						1050
					},
					{
						900,
						1100
					},
					{
						800,
						1200
					}
				}
			},
			{
				"num",
				4
			}
		},
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
	[3024405] = {
		is_walk = 0,
		type = 15,
		reversal = 0,
		name = "遗物",
		group_id = 4,
		ext = {
			101,
			102,
			103
		},
		res_1 = {
			1,
			1161
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3025101] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10301
			},
			{
				"strength",
				1000
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3025201] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10301
			},
			{
				"strength",
				1250
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3025301] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				40301
			},
			{
				"strength",
				900
			}
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
	[3025501] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20301
			},
			{
				"strength",
				1000
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3025601] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20301
			},
			{
				"strength",
				1200
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3025701] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				30301
			},
			{
				"strength",
				1350
			}
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
		reward = {
			{
				25,
				1200
			},
			{
				1,
				960000
			}
		}
	},
	[3028101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "木锤",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1055
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3028201] = {
		is_walk = 0,
		type = 11,
		reversal = 0,
		name = "障碍",
		group_id = 0,
		ext = {
			{
				300001,
				1
			}
		},
		res_1 = {
			1,
			1051
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[3028501] = {
		is_walk = 0,
		type = 12,
		reversal = 0,
		name = "开关",
		group_id = 0,
		ext = {
			1018601,
			1018701,
			1018801
		},
		res_1 = {
			1,
			1091
		},
		res_2 = {
			1,
			1092
		},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[3028601] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[3028701] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[3028801] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[4011201] = {
		is_walk = 0,
		type = 5,
		reversal = 0,
		name = "告示牌",
		group_id = 0,
		ext = {
			4001
		},
		res_1 = {
			1,
			1011
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4011301] = {
		is_walk = 0,
		type = 8,
		reversal = 0,
		name = "传送门",
		group_id = 0,
		ext = {
			2
		},
		res_1 = {
			1,
			1021
		},
		res_2 = {},
		offset = {
			0,
			60
		},
		reward = {}
	},
	[4011501] = {
		is_walk = 0,
		type = 10,
		reversal = 0,
		name = "神秘老者",
		group_id = 0,
		ext = {
			{
				4001,
				100
			}
		},
		res_1 = {
			1,
			1181
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4011601] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4015101] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10401
			},
			{
				"strength",
				1000
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4015201] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10401
			},
			{
				"strength",
				1250
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4015301] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				40401
			},
			{
				"strength",
				900
			}
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
	[4015501] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20401
			},
			{
				"strength",
				1000
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4015601] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20401
			},
			{
				"strength",
				1200
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4015701] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				30401
			},
			{
				"strength",
				1300
			}
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
		reward = {
			{
				25,
				1200
			},
			{
				1,
				960000
			}
		}
	},
	[4018101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "木锤",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1055
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4018201] = {
		is_walk = 0,
		type = 11,
		reversal = 0,
		name = "障碍",
		group_id = 0,
		ext = {
			{
				300001,
				1
			}
		},
		res_1 = {
			1,
			1051
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4018501] = {
		is_walk = 0,
		type = 12,
		reversal = 0,
		name = "开关",
		group_id = 0,
		ext = {
			1018601,
			1018701,
			1018801
		},
		res_1 = {
			1,
			1091
		},
		res_2 = {
			1,
			1092
		},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[4018601] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[4018701] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[4018801] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[4021201] = {
		is_walk = 0,
		type = 5,
		reversal = 0,
		name = "告示牌",
		group_id = 0,
		ext = {
			4002
		},
		res_1 = {
			1,
			1011
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4021301] = {
		is_walk = 0,
		type = 8,
		reversal = 0,
		name = "传送门",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {
			1,
			1021
		},
		res_2 = {},
		offset = {
			0,
			60
		},
		reward = {}
	},
	[4021501] = {
		is_walk = 0,
		type = 10,
		reversal = 0,
		name = "神秘老者",
		group_id = 0,
		ext = {
			{
				4002,
				100
			}
		},
		res_1 = {
			1,
			1181
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4021601] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4025101] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10401
			},
			{
				"strength",
				1000
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4025201] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				10401
			},
			{
				"strength",
				1250
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4025301] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				40401
			},
			{
				"strength",
				900
			}
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
	[4025501] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20401
			},
			{
				"strength",
				1000
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4025601] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20401
			},
			{
				"strength",
				1200
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4025701] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				30401
			},
			{
				"strength",
				1300
			}
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
		reward = {
			{
				25,
				1200
			},
			{
				1,
				960000
			}
		}
	},
	[4028101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "木锤",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1055
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4028201] = {
		is_walk = 0,
		type = 11,
		reversal = 0,
		name = "障碍",
		group_id = 0,
		ext = {
			{
				300001,
				1
			}
		},
		res_1 = {
			1,
			1051
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[4028501] = {
		is_walk = 0,
		type = 12,
		reversal = 0,
		name = "开关",
		group_id = 0,
		ext = {
			1018601,
			1018701,
			1018801
		},
		res_1 = {
			1,
			1091
		},
		res_2 = {
			1,
			1092
		},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[4028601] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[4028701] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[4028801] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[5011201] = {
		is_walk = 0,
		type = 5,
		reversal = 0,
		name = "告示牌",
		group_id = 0,
		ext = {
			5001
		},
		res_1 = {
			1,
			1011
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5011301] = {
		is_walk = 0,
		type = 8,
		reversal = 0,
		name = "传送门",
		group_id = 0,
		ext = {
			2
		},
		res_1 = {
			1,
			1021
		},
		res_2 = {},
		offset = {
			0,
			60
		},
		reward = {}
	},
	[5011501] = {
		is_walk = 0,
		type = 10,
		reversal = 0,
		name = "神秘老者",
		group_id = 0,
		ext = {
			{
				5001,
				100
			}
		},
		res_1 = {
			1,
			1181
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5011601] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5015101] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5015201] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5015301] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {},
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
	[5015501] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20501
			},
			{
				"strength",
				1000
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5015601] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20501
			},
			{
				"strength",
				1200
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5015701] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				30501
			},
			{
				"strength",
				1300
			}
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
		reward = {
			{
				25,
				1200
			},
			{
				1,
				960000
			}
		}
	},
	[5018101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "木锤",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1055
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5018201] = {
		is_walk = 0,
		type = 11,
		reversal = 0,
		name = "障碍",
		group_id = 0,
		ext = {
			{
				300001,
				1
			}
		},
		res_1 = {
			1,
			1051
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5018501] = {
		is_walk = 0,
		type = 12,
		reversal = 0,
		name = "开关",
		group_id = 0,
		ext = {
			1018601,
			1018701,
			1018801
		},
		res_1 = {
			1,
			1091
		},
		res_2 = {
			1,
			1092
		},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[5018601] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[5018701] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[5018801] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[5021201] = {
		is_walk = 0,
		type = 5,
		reversal = 0,
		name = "告示牌",
		group_id = 0,
		ext = {
			5002
		},
		res_1 = {
			1,
			1011
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5021301] = {
		is_walk = 0,
		type = 8,
		reversal = 0,
		name = "传送门",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {
			1,
			1021
		},
		res_2 = {},
		offset = {
			0,
			60
		},
		reward = {}
	},
	[5021501] = {
		is_walk = 0,
		type = 10,
		reversal = 0,
		name = "神秘老者",
		group_id = 0,
		ext = {
			{
				5002,
				100
			}
		},
		res_1 = {
			1,
			1181
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5021601] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "随机奖励",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5025101] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5025201] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5025301] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {},
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
	[5025501] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20501
			},
			{
				"strength",
				1000
			}
		},
		res_1 = {
			1,
			1111
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5025601] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "精英怪物",
		group_id = 0,
		ext = {
			{
				"group",
				20501
			},
			{
				"strength",
				1200
			}
		},
		res_1 = {
			1,
			1121
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5025701] = {
		is_walk = 0,
		type = 1,
		reversal = 0,
		name = "首领怪物",
		group_id = 0,
		ext = {
			{
				"group",
				30501
			},
			{
				"strength",
				1300
			}
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
		reward = {
			{
				25,
				1200
			},
			{
				1,
				960000
			}
		}
	},
	[5028101] = {
		is_walk = 0,
		type = 6,
		reversal = 0,
		name = "木锤",
		group_id = 0,
		ext = {},
		res_1 = {
			1,
			1055
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5028201] = {
		is_walk = 0,
		type = 11,
		reversal = 0,
		name = "障碍",
		group_id = 0,
		ext = {
			{
				300001,
				1
			}
		},
		res_1 = {
			1,
			1051
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {}
	},
	[5028501] = {
		is_walk = 0,
		type = 12,
		reversal = 0,
		name = "开关",
		group_id = 0,
		ext = {
			1018601,
			1018701,
			1018801
		},
		res_1 = {
			1,
			1091
		},
		res_2 = {
			1,
			1092
		},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[5028601] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[5028701] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	},
	[5028801] = {
		is_walk = 1,
		type = 13,
		reversal = 0,
		name = "升降台",
		group_id = 0,
		ext = {
			1
		},
		res_1 = {},
		res_2 = {},
		offset = {
			0,
			15
		},
		reward = {}
	}
}

function Config.SecretDunData.data_evt_info_fun(slot0)
	slot1 = Config.SecretDunData.data_evt_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.SecretDunData.data_evt_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.SecretDunData.data_dialogue_length = 10
Config.SecretDunData.data_dialogue = {
	[1001] = {
		dialogue = {
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"世界上有五大本源元素，分别为水、火、风、光、暗。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"五大元素相生相克，由此衍生出了世间的万物。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"传说中最初的神也诞生于五大元素之中。",
				20,
				250,
				90
			}
		},
		answer = {
			{
				1
			}
		}
	},
	[1002] = {
		dialogue = {
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"在世界最初形成的时候，世界上只有一片大陆，四周被大海所环绕。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"但是曾经存在于大陆的神之间，发生了一场战争。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"信念之力冲撞产生的元素乱流，使得大陆四分五裂，也逐渐产生出独立于冒险大陆的时间与空间。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"我们现在所处的这个时空即是其中之一。",
				20,
				250,
				90
			}
		},
		answer = {
			{
				1
			}
		}
	},
	[2001] = {
		dialogue = {
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"冒险大陆的西南方因为常年有火山喷发，被称为新世界。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"近来在大陆上肆虐的恶魔，便与这里突然诞生的迷雾有关。",
				20,
				250,
				90
			}
		},
		answer = {
			{
				1
			}
		}
	},
	[2002] = {
		dialogue = {
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"据说身处于迷雾中的生物，将会逐渐丧失理智，成为只有杀戮意识的怪物。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"而这迷雾，来自于一场恶魔的祭典。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"虽然祭典最终被伟大的先知所阻止，但迷雾依旧没有散去，新世界也因此成了真正毫无生机的地方。",
				20,
				250,
				90
			}
		},
		answer = {
			{
				1
			}
		}
	},
	[3001] = {
		dialogue = {
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"矮人族是大陆上最擅长锻造的阵营。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"矮人族的祖先居住在矿脉丰富的阿斯加德，也由此锻炼出了高超的锻造技艺。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"而矮人族最大的成就，莫过于传说中的五大神技。",
				20,
				250,
				90
			}
		},
		answer = {
			{
				1
			}
		}
	},
	[3002] = {
		dialogue = {
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"矮人族曾出现过一个锻造天才——伊瓦第。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"他掌握了被后世称为“元素锻造法”的锻造技巧，据说可以在锻造武器的过程中将信念之力融入其中。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"伊瓦第耗尽心血，利用五大元素锻造出了斧、拳、枪、弓、锤五大神技。",
				20,
				250,
				90
			}
		},
		answer = {
			{
				1
			}
		}
	},
	[4001] = {
		dialogue = {
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"先知与祭司，是冒险大陆上最为崇高的职业。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"他们都是天生拥有着些许神魂之力的人，也因此，他们注定拥有与平凡人类不同的一生。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"而其中最受万物敬仰的，当数伟大先知。",
				20,
				250,
				90
			}
		},
		answer = {
			{
				1
			}
		}
	},
	[4002] = {
		dialogue = {
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"传说中伟大先知是最接近于神的人类，拥有着预知未来的能力。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"也因此，伟大先知虔诚地信仰着光，甘愿为光奉献出自己的生命。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"而现在，这道光也将交由你们去传承。",
				20,
				250,
				90
			}
		},
		answer = {
			{
				1
			}
		}
	},
	[5001] = {
		dialogue = {
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"光与暗本是一体两面，有光出现的地方，角落里必定隐藏着暗。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"即使是神，也会拥有着暗的一面。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"强大如原初那位创造万物的伟大的神，也无法逃离心中的暗面。",
				20,
				250,
				90
			}
		},
		answer = {
			{
				1
			}
		}
	},
	[5002] = {
		dialogue = {
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"无人知晓香克斯从何而生，但连伟大先知亦无法消灭的生命，必定不是普通的存在。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"如果真的像伟大先知的预言一般，需要凝聚元素之心，方可驱逐黑暗。",
				20,
				250,
				90
			},
			{
				"神秘老者",
				0,
				0,
				"gandaofu",
				"那拯救大陆的路，可还长着呢……",
				20,
				250,
				90
			}
		},
		answer = {
			{
				1
			}
		}
	}
}

function Config.SecretDunData.data_dialogue_fun(slot0)
	slot1 = Config.SecretDunData.data_dialogue[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.SecretDunData.data_dialogue[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.SecretDunData.data_drama_length = 5
Config.SecretDunData.data_drama = {
	{
		dialogue = {
			{
				"魂·罗",
				0,
				0,
				"jiushen",
				"哟，最近来的人类可真不少~",
				300,
				200,
				65
			},
			{
				"魂·罗",
				0,
				0,
				"jiushen",
				"想过来喝一杯酒么？我在这个空间的最深处等着你，不过在这之前，你要打败外面那些碍事的家伙。",
				300,
				200,
				65
			},
			{
				"魂·罗",
				0,
				0,
				"jiushen",
				"一路上会有很多好东西，顺手拿走我也是不介意的哦~",
				300,
				200,
				65
			},
			{
				"魂·罗",
				0,
				0,
				"jiushen",
				"还有，可千万别迷路了哟~",
				300,
				200,
				65
			}
		}
	},
	{
		dialogue = {
			{
				"魂·山治",
				0,
				0,
				"luoji",
				"没想到居然有人类敢闯入这个地方，想尝尝被烧成灰烬的滋味？",
				300,
				250,
				65
			},
			{
				"魂·山治",
				0,
				0,
				"luoji",
				"不过就算你这样求我，也得你有足够的实力来到我面前啊~",
				300,
				250,
				65
			}
		}
	},
	{
		dialogue = {
			{
				"魂·鹰眼",
				0,
				0,
				"fennier",
				"你和我之间，到底谁会是猎物呢？",
				0,
				150,
				80
			},
			{
				"魂·鹰眼",
				0,
				0,
				"fennier",
				"真叫本王期待啊，人类！我已经很久没有尝过美味了。",
				0,
				150,
				80
			}
		}
	},
	{
		dialogue = {
			{
				"魂·鹤",
				0,
				0,
				"shenlingdajisi",
				"终于等到你了，船长。",
				250,
				150,
				80
			},
			{
				"魂·鹤",
				0,
				0,
				"shenlingdajisi",
				"如果你是预言中的驱逐黑暗之人，请你以真正的实力将我击败！",
				250,
				150,
				80
			}
		}
	},
	{
		dialogue = {
			{
				"魂·路飞(新世界)",
				0,
				0,
				"nidehuoge",
				"嘿嘿嘿，看来我当年带给你们的绝望还不够刻骨铭心啊。",
				0,
				150,
				80
			},
			{
				"魂·路飞(新世界)",
				0,
				0,
				"nidehuoge",
				"想再体验一次绝望的滋味么？渺小的人类。",
				0,
				150,
				80
			}
		}
	}
}

function Config.SecretDunData.data_drama_fun(slot0)
	slot1 = Config.SecretDunData.data_drama[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.SecretDunData.data_drama[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.SecretDunData.data_board_length = 14
Config.SecretDunData.data_board = {
	[1001] = {
		res_id = "board_img_1",
		desc_2 = [[
世界本源有五，分别为水、火、风、光、暗五大元素。
水主生长，能够滋润万物，是万物生存必不可少的元素之一。
但波涛汹涌之时，水也会湮灭万物。凝结为冰，冰将使万物无法动弹。
所以，即使心如止水的生命也总会有惊涛骇浪的一面。]],
		id = 1001,
		title = "告示牌",
		desc_1 = "长环岛之中矗立的木板，上面似乎记载着什么",
		btn_str = ""
	},
	[1002] = {
		res_id = "board_img_1",
		desc_2 = "基德本可以继续生活在阿斯加德之中，但他厌倦了所谓的“神的法则”的束缚。\n他只想寻找一个能够随性生活的地方，于是极北之海开始有了“海神”的存在。\n当基德心情平和时，海面风平浪静，但基德一旦动怒，极北之海也将掀起惊天巨浪，吞没一切。",
		id = 1002,
		title = "告示牌",
		desc_1 = "长环岛之中矗立的木板，上面似乎记载着什么",
		btn_str = ""
	},
	[1003] = {
		res_id = "board_img_8",
		desc_2 = "",
		id = 1003,
		title = "升降开关",
		desc_1 = "路上放着一个奇怪的机关，触发后会发生什么呢？",
		btn_str = "转动"
	},
	[1004] = {
		res_id = "board_img_6",
		desc_2 = "",
		id = 1004,
		title = "可破坏障碍",
		desc_1 = "沉重的障碍挡住了前进的道路，里面似乎藏有物品，看来可以拿什么破坏它......",
		btn_str = "破坏"
	},
	[2001] = {
		res_id = "board_img_1",
		desc_2 = "世界本源有五，分别为水、火、风、光、暗五大元素。\n火主消亡，炼狱之火足以将世间万物梵为灰烬。\n但看似无尽的消亡中也将孕育出新的希望，所以布鲁克浴火后的新生更为强大，乔巴盗取的火种延续了人类的生命。",
		id = 2001,
		title = "告示牌",
		desc_1 = "长环岛之中矗立的木板，上面似乎记载着什么",
		btn_str = ""
	},
	[2002] = {
		res_id = "board_img_1",
		desc_2 = "乔巴以自身为形象创造出了最初的人类，他坚信智慧将会令人类拥有无限的可能。\n但如今的人类却仍旧无法凭借自己的能力生存，于是乔巴为人类盗取火种。\n人类也由此学会了用火，真正拥有了生存的基础，以及文明发展的根本。",
		id = 2002,
		title = "告示牌",
		desc_1 = "长环岛之中矗立的木板，上面似乎记载着什么",
		btn_str = ""
	},
	[9901] = {
		res_id = "board_img_4",
		desc_2 = "可以随机复活一位已阵亡的英雄并回复其<div fontcolor=289b14>70%</div>的生命值，若当前无阵亡英雄则回复生命值最低的一位英雄<div fontcolor=289b14>100%</div>的生命。",
		id = 9901,
		title = "复活十字架",
		desc_1 = "蕴含海洋之力的十字架，虔诚的信仰可以沟通到大海的伟力，其中似乎蕴含着永生的力量。",
		btn_str = "复活"
	},
	[9951] = {
		res_id = "board_img_7",
		desc_2 = "浸泡泉水可使所有存活的英雄恢复<div fontcolor=289b14>30%</div>的生命值，泉水仅可使用一次。",
		id = 9951,
		title = "回复泉水",
		desc_1 = "蕴含生命气息的泉水，即使相隔甚远依然能够感受到泉水所散发出的磅礴生机。",
		btn_str = "浸泡"
	},
	[3001] = {
		res_id = "board_img_1",
		desc_2 = "世界本源有五，分别为水、火、风、光、暗五大元素。\n风主传承，无数的生命借由风飞向远方，传播到另一片沃土之上。\n但当怨恨的种子在人心中生根发芽之时，风将会成为无形的利刃，隐匿于暗处，收割生命。",
		id = 3001,
		title = "告示牌",
		desc_1 = "长环岛之中矗立的木板，上面似乎记载着什么",
		btn_str = ""
	},
	[3002] = {
		res_id = "board_img_1",
		desc_2 = "阿布萨罗姆的称呼来自于他只将亡灵作为唯一的猎杀目标。\n怨恨会使人变得强大，在一切因亡灵侵袭而化为乌有之后，他的变化完美地验证着这句话。\n没有人知道他的力量从何而来，但复仇，已经成为了他活下去的唯一动力。",
		id = 3002,
		title = "告示牌",
		desc_1 = "长环岛之中矗立的木板，上面似乎记载着什么",
		btn_str = ""
	},
	[4001] = {
		res_id = "board_img_1",
		desc_2 = "世界本源有五，分别为水、火、风、光、暗五大元素。\n光主创造，万物向往着无尽的光，追寻着属于自己的方向。\n于是伟大先知集齐五大神技，建立先知殿，守卫冒险大陆的和平。在永夜降临之时又不惜献祭自己的生命，封印恶魔，留下预言。",
		id = 4001,
		title = "告示牌",
		desc_1 = "长环岛之中矗立的木板，上面似乎记载着什么",
		btn_str = ""
	},
	[4002] = {
		res_id = "board_img_1",
		desc_2 = [[
伟大先知虔诚地信仰着光，他坚信着光与暗存在都有其意义，但光永远比暗更胜一筹。
于是他游历大陆，在先知能力的指引下终于寻得了五大神技，建立起以守卫大陆稳定为宗旨的先知殿。
但他的心中隐隐不安，因为预言中大陆将会面临着灭亡的危机。
“永夜将至，唯有异界之人，凝聚元素之心，方能驱逐黑暗，令希望重燃……”]],
		id = 4002,
		title = "告示牌",
		desc_1 = "长环岛之中矗立的木板，上面似乎记载着什么",
		btn_str = ""
	},
	[5001] = {
		res_id = "board_img_1",
		desc_2 = [[
世界本源有五，分别为水、火、风、光、暗五大元素。
暗主毁灭，诅咒在空间之中蔓延开来。
在漫无边际的黑暗之中，万物的意志将会被不断侵蚀、腐化，直至成为行尸走肉的恶魔。
冒险大陆的“永夜”也由此而来。]],
		id = 5001,
		title = "告示牌",
		desc_1 = "长环岛之中矗立的木板，上面似乎记载着什么",
		btn_str = ""
	},
	[5002] = {
		res_id = "board_img_1",
		desc_2 = "香克斯隐藏于大陆的角落，开启“永夜祭典”，企图让世界陷入无尽的黑暗之中。\n但大陆西南方久久不散的迷雾引起了先知殿的怀疑，永夜祭典因为伟大先知的到来而中断。\n但人类的力量无法令香克斯消亡，伟大先知无奈之下以生命为代价，借助五大神技的力量构筑封印结界，将香克斯封印。",
		id = 5002,
		title = "告示牌",
		desc_1 = "长环岛之中矗立的木板，上面似乎记载着什么",
		btn_str = ""
	}
}

function Config.SecretDunData.data_board_fun(slot0)
	slot1 = Config.SecretDunData.data_board[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.SecretDunData.data_board[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.SecretDunData.data_buff_length = 336
Config.SecretDunData.data_buff = {
	[10001] = {
		buff_id = 10001,
		quality = 1,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有英雄攻击+5%",
		range = {}
	},
	[10101] = {
		buff_id = 10101,
		quality = 1,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄攻击+7%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[10201] = {
		buff_id = 10201,
		quality = 1,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄攻击+7%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[10301] = {
		buff_id = 10301,
		quality = 1,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有强者英雄攻击+7%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[10401] = {
		buff_id = 10401,
		quality = 1,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有海军英雄攻击+7%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[10501] = {
		buff_id = 10501,
		quality = 1,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄攻击+7%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[11201] = {
		buff_id = 11201,
		quality = 1,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有法师英雄攻击+7%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[11301] = {
		buff_id = 11301,
		quality = 1,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有战士英雄攻击+7%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[11401] = {
		buff_id = 11401,
		quality = 1,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄攻击+7%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[11501] = {
		buff_id = 11501,
		quality = 1,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄攻击+7%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[10002] = {
		buff_id = 10002,
		quality = 1,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "全体英雄伤害+5%",
		range = {}
	},
	[10102] = {
		buff_id = 10102,
		quality = 1,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄伤害+7%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[10202] = {
		buff_id = 10202,
		quality = 1,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄伤害+7%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[10302] = {
		buff_id = 10302,
		quality = 1,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有强者英雄伤害+7%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[10402] = {
		buff_id = 10402,
		quality = 1,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有海军英雄伤害+7%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[10502] = {
		buff_id = 10502,
		quality = 1,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄伤害+7%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[11202] = {
		buff_id = 11202,
		quality = 1,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有法师英雄伤害+7%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[11302] = {
		buff_id = 11302,
		quality = 1,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有战士英雄伤害+7%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[11402] = {
		buff_id = 11402,
		quality = 1,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄伤害+7%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[11502] = {
		buff_id = 11502,
		quality = 1,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄伤害+7%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[10003] = {
		buff_id = 10003,
		quality = 1,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "全体英雄物理伤害+6%",
		range = {}
	},
	[10103] = {
		buff_id = 10103,
		quality = 1,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄物理伤害+9%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[10203] = {
		buff_id = 10203,
		quality = 1,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄物理伤害+9%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[10303] = {
		buff_id = 10303,
		quality = 1,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有强者英雄物理伤害+9%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[10403] = {
		buff_id = 10403,
		quality = 1,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有海军英雄物理伤害+9%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[10503] = {
		buff_id = 10503,
		quality = 1,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄物理伤害+9%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[11303] = {
		buff_id = 11303,
		quality = 1,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有战士英雄物理伤害+9%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[11403] = {
		buff_id = 11403,
		quality = 1,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄物理伤害+9%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[11503] = {
		buff_id = 11503,
		quality = 1,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄物理伤害+9%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[10004] = {
		buff_id = 10004,
		quality = 1,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "全体英雄魔法伤害+6%",
		range = {}
	},
	[10104] = {
		buff_id = 10104,
		quality = 1,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄魔法伤害+9%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[10204] = {
		buff_id = 10204,
		quality = 1,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄魔法伤害+9%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[10304] = {
		buff_id = 10304,
		quality = 1,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有强者英雄魔法伤害+9%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[10404] = {
		buff_id = 10404,
		quality = 1,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有海军英雄魔法伤害+9%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[10504] = {
		buff_id = 10504,
		quality = 1,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄魔法伤害+9%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[11204] = {
		buff_id = 11204,
		quality = 1,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有法师英雄魔法伤害+9%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[11404] = {
		buff_id = 11404,
		quality = 1,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄魔法伤害+9%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[11504] = {
		buff_id = 11504,
		quality = 1,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄魔法伤害+9%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[10005] = {
		buff_id = 10005,
		quality = 1,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "全体英雄暴击率+5%",
		range = {}
	},
	[10105] = {
		buff_id = 10105,
		quality = 1,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄暴击率+7%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[10205] = {
		buff_id = 10205,
		quality = 1,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄暴击率+7%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[10305] = {
		buff_id = 10305,
		quality = 1,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有强者英雄暴击率+7%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[10405] = {
		buff_id = 10405,
		quality = 1,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有海军英雄暴击率+7%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[10505] = {
		buff_id = 10505,
		quality = 1,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄暴击率+7%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[11205] = {
		buff_id = 11205,
		quality = 1,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有法师英雄暴击率+7%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[11305] = {
		buff_id = 11305,
		quality = 1,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有战士英雄暴击率+7%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[11405] = {
		buff_id = 11405,
		quality = 1,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄暴击率+7%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[11505] = {
		buff_id = 11505,
		quality = 1,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄暴击率+7%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[10006] = {
		buff_id = 10006,
		quality = 1,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "全体英雄暴击伤害+8%",
		range = {}
	},
	[10106] = {
		buff_id = 10106,
		quality = 1,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄暴击伤害+11%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[10206] = {
		buff_id = 10206,
		quality = 1,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄暴击伤害+11%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[10306] = {
		buff_id = 10306,
		quality = 1,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有强者英雄暴击伤害+11%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[10406] = {
		buff_id = 10406,
		quality = 1,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有海军英雄暴击伤害+11%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[10506] = {
		buff_id = 10506,
		quality = 1,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄暴击伤害+11%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[11206] = {
		buff_id = 11206,
		quality = 1,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有法师英雄暴击伤害+11%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[11306] = {
		buff_id = 11306,
		quality = 1,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有战士英雄暴击伤害+11%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[11406] = {
		buff_id = 11406,
		quality = 1,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄暴击伤害+11%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[11506] = {
		buff_id = 11506,
		quality = 1,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄暴击伤害+11%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[10007] = {
		buff_id = 10007,
		quality = 1,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "全体英雄闪躲+3%",
		range = {}
	},
	[10107] = {
		buff_id = 10107,
		quality = 1,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有海贼英雄闪躲+4%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[10207] = {
		buff_id = 10207,
		quality = 1,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有草帽联盟英雄闪躲+4%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[10307] = {
		buff_id = 10307,
		quality = 1,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有强者英雄闪躲+4%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[10407] = {
		buff_id = 10407,
		quality = 1,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有海军英雄闪躲+4%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[10507] = {
		buff_id = 10507,
		quality = 1,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有五皇团英雄闪躲+4%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[11207] = {
		buff_id = 11207,
		quality = 1,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有法师英雄闪躲+4%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[11307] = {
		buff_id = 11307,
		quality = 1,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有战士英雄闪躲+4%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[11407] = {
		buff_id = 11407,
		quality = 1,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有坦克英雄闪躲+4%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[11507] = {
		buff_id = 11507,
		quality = 1,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有辅助英雄闪躲+4%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[10008] = {
		buff_id = 10008,
		quality = 1,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "全体英雄免伤+5%",
		range = {}
	},
	[10108] = {
		buff_id = 10108,
		quality = 1,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有海贼英雄免伤+7%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[10208] = {
		buff_id = 10208,
		quality = 1,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有草帽联盟英雄免伤+7%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[10308] = {
		buff_id = 10308,
		quality = 1,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有强者英雄免伤+7%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[10408] = {
		buff_id = 10408,
		quality = 1,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有海军英雄免伤+7%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[10508] = {
		buff_id = 10508,
		quality = 1,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有五皇团英雄免伤+7%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[11208] = {
		buff_id = 11208,
		quality = 1,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有法师英雄免伤+7%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[11308] = {
		buff_id = 11308,
		quality = 1,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有战士英雄免伤+7%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[11408] = {
		buff_id = 11408,
		quality = 1,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有坦克英雄免伤+7%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[11508] = {
		buff_id = 11508,
		quality = 1,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有辅助英雄免伤+7%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[10009] = {
		buff_id = 10009,
		quality = 1,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "全体英雄速度+3%",
		range = {}
	},
	[10109] = {
		buff_id = 10109,
		quality = 1,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有海贼英雄速度+4%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[10209] = {
		buff_id = 10209,
		quality = 1,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有草帽联盟英雄速度+4%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[10309] = {
		buff_id = 10309,
		quality = 1,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有强者英雄速度+4%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[10409] = {
		buff_id = 10409,
		quality = 1,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有海军英雄速度+4%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[10509] = {
		buff_id = 10509,
		quality = 1,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有五皇团英雄速度+4%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[11209] = {
		buff_id = 11209,
		quality = 1,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有法师英雄速度+4%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[11309] = {
		buff_id = 11309,
		quality = 1,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有战士英雄速度+4%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[11409] = {
		buff_id = 11409,
		quality = 1,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有坦克英雄速度+4%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[11509] = {
		buff_id = 11509,
		quality = 1,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有辅助英雄速度+4%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[10010] = {
		buff_id = 10010,
		quality = 1,
		name = "涂毒",
		res_id = "buff_icon_9",
		desc = "伤害时20%概率附带持续1回合的每回合损失5%生命值的【中毒】效果（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[10011] = {
		buff_id = 10011,
		quality = 1,
		name = "伤害加深",
		res_id = "buff_icon_9",
		desc = "伤害时10%概率对受击单位附带持续2回合的20%【伤害加深】效果（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[10012] = {
		buff_id = 10012,
		quality = 1,
		name = "受创急疗",
		res_id = "buff_icon_9",
		desc = "受到暴击时回复自身生命值上限5%的生命值，1回合只能触发1次（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[10013] = {
		buff_id = 10013,
		quality = 1,
		name = "免伤护盾",
		res_id = "buff_icon_9",
		desc = "每回合开始时20%概率给自身附带持续2回合的【免伤护盾】，冷却2回合（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[10014] = {
		buff_id = 10014,
		quality = 1,
		name = "自我修复",
		res_id = "buff_icon_9",
		desc = "每回合开始时60%概率回复自身5%生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[11315] = {
		buff_id = 11315,
		quality = 1,
		name = "奥技暴追",
		res_id = "buff_icon_9",
		desc = "所有战士英雄使用物理攻击造成暴击时，50%概率再进行1次普攻（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[11316] = {
		buff_id = 11316,
		quality = 1,
		name = "奥技物连",
		res_id = "buff_icon_9",
		desc = "所有战士英雄物攻时有25%概率触发连击，再次释放技能，伤害、控制率为原来50%（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[11317] = {
		buff_id = 11317,
		quality = 1,
		name = "奥技穿透",
		res_id = "buff_icon_9",
		desc = "所有战士英雄伤害结果忽视目标13%防御（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[11218] = {
		buff_id = 11218,
		quality = 1,
		name = "奥技法连",
		res_id = "buff_icon_9",
		desc = "所有法师英雄法攻时有25%概率触发连击，再次释放技能，伤害、控制率为原来50%（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[11219] = {
		buff_id = 11219,
		quality = 1,
		name = "奥技挑衅",
		res_id = "buff_icon_9",
		desc = "所有法师英雄攻击时，有5%概率强制令目标对自己进行普攻，持续1回合（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[11220] = {
		buff_id = 11220,
		quality = 1,
		name = "奥技波动",
		res_id = "buff_icon_9",
		desc = "所有法师英雄造成魔法伤害时，最终伤害结果会在99-138%之间随机波动（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[11421] = {
		buff_id = 11421,
		quality = 1,
		name = "奥技再生",
		res_id = "buff_icon_9",
		desc = "所有坦克英雄回合开始时恢复自身生命值上限2.5%的生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[11422] = {
		buff_id = 11422,
		quality = 1,
		name = "奥技保命",
		res_id = "buff_icon_9",
		desc = "所有坦克英雄死亡时有15%概率复活，复活时恢复少量生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[11423] = {
		buff_id = 11423,
		quality = 1,
		name = "奥技神佑",
		res_id = "buff_icon_9",
		desc = "所有坦克英雄死亡时有10%概率复活，复活后恢复30%生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[11521] = {
		buff_id = 11521,
		quality = 1,
		name = "奥技再生",
		res_id = "buff_icon_9",
		desc = "所有辅助英雄回合开始时恢复自身生命值上限2.5%的生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[11522] = {
		buff_id = 11522,
		quality = 1,
		name = "奥技保命",
		res_id = "buff_icon_9",
		desc = "所有辅助英雄死亡时有15%概率复活，复活时恢复少量生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[11523] = {
		buff_id = 11523,
		quality = 1,
		name = "奥技神佑",
		res_id = "buff_icon_9",
		desc = "所有辅助英雄死亡时有10%概率复活，复活后恢复30%生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[10024] = {
		buff_id = 10024,
		quality = 1,
		name = "奥技禁疗",
		res_id = "buff_icon_9",
		desc = "攻击时有20%概率使目标治疗、被治疗效果降低10%，持续两回合",
		range = {}
	},
	[10025] = {
		buff_id = 10025,
		quality = 1,
		name = "奥技净化",
		res_id = "buff_icon_9",
		desc = "回合开始时，有38%概率清除自身所有负面状态",
		range = {}
	},
	[20001] = {
		buff_id = 20001,
		quality = 2,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "全体英雄攻击+7%",
		range = {}
	},
	[20101] = {
		buff_id = 20101,
		quality = 2,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄攻击+10%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[20201] = {
		buff_id = 20201,
		quality = 2,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄攻击+10%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[20301] = {
		buff_id = 20301,
		quality = 2,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有强者英雄攻击+10%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[20401] = {
		buff_id = 20401,
		quality = 2,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有海军英雄攻击+10%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[20501] = {
		buff_id = 20501,
		quality = 2,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄攻击+10%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[21201] = {
		buff_id = 21201,
		quality = 2,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有法师英雄攻击+10%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21301] = {
		buff_id = 21301,
		quality = 2,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有战士英雄攻击+10%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[21401] = {
		buff_id = 21401,
		quality = 2,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄攻击+10%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[21501] = {
		buff_id = 21501,
		quality = 2,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄攻击+10%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[20002] = {
		buff_id = 20002,
		quality = 2,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "全体英雄伤害+7%",
		range = {}
	},
	[20102] = {
		buff_id = 20102,
		quality = 2,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄伤害+10%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[20202] = {
		buff_id = 20202,
		quality = 2,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄伤害+10%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[20302] = {
		buff_id = 20302,
		quality = 2,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有强者英雄伤害+10%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[20402] = {
		buff_id = 20402,
		quality = 2,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有海军英雄伤害+10%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[20502] = {
		buff_id = 20502,
		quality = 2,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄伤害+10%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[21202] = {
		buff_id = 21202,
		quality = 2,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有法师英雄伤害+10%",
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
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有战士英雄伤害+10%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[21402] = {
		buff_id = 21402,
		quality = 2,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄伤害+10%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[21502] = {
		buff_id = 21502,
		quality = 2,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄伤害+10%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[20003] = {
		buff_id = 20003,
		quality = 2,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "全体英雄物理伤害+9%",
		range = {}
	},
	[20103] = {
		buff_id = 20103,
		quality = 2,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄物理伤害+13%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[20203] = {
		buff_id = 20203,
		quality = 2,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄物理伤害+13%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[20303] = {
		buff_id = 20303,
		quality = 2,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有强者英雄物理伤害+13%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[20403] = {
		buff_id = 20403,
		quality = 2,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有海军英雄物理伤害+13%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[20503] = {
		buff_id = 20503,
		quality = 2,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄物理伤害+13%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[21303] = {
		buff_id = 21303,
		quality = 2,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有战士英雄物理伤害+13%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[21403] = {
		buff_id = 21403,
		quality = 2,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄物理伤害+13%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[21503] = {
		buff_id = 21503,
		quality = 2,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄物理伤害+13%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[20004] = {
		buff_id = 20004,
		quality = 2,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "全体英雄魔法伤害+9%",
		range = {}
	},
	[20104] = {
		buff_id = 20104,
		quality = 2,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄魔法伤害+13%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[20204] = {
		buff_id = 20204,
		quality = 2,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄魔法伤害+13%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[20304] = {
		buff_id = 20304,
		quality = 2,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有强者英雄魔法伤害+13%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[20404] = {
		buff_id = 20404,
		quality = 2,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有海军英雄魔法伤害+13%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[20504] = {
		buff_id = 20504,
		quality = 2,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄魔法伤害+13%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[21204] = {
		buff_id = 21204,
		quality = 2,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有法师英雄魔法伤害+13%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21404] = {
		buff_id = 21404,
		quality = 2,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄魔法伤害+13%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[21504] = {
		buff_id = 21504,
		quality = 2,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄魔法伤害+13%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[20005] = {
		buff_id = 20005,
		quality = 2,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "全体英雄暴击率+7%",
		range = {}
	},
	[20105] = {
		buff_id = 20105,
		quality = 2,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄暴击率+10%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[20205] = {
		buff_id = 20205,
		quality = 2,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄暴击率+10%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[20305] = {
		buff_id = 20305,
		quality = 2,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有强者英雄暴击率+10%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[20405] = {
		buff_id = 20405,
		quality = 2,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有海军英雄暴击率+10%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[20505] = {
		buff_id = 20505,
		quality = 2,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄暴击率+10%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[21205] = {
		buff_id = 21205,
		quality = 2,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有法师英雄暴击率+10%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21305] = {
		buff_id = 21305,
		quality = 2,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有战士英雄暴击率+10%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[21405] = {
		buff_id = 21405,
		quality = 2,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄暴击率+10%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[21505] = {
		buff_id = 21505,
		quality = 2,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄暴击率+10%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[20006] = {
		buff_id = 20006,
		quality = 2,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "全体英雄暴击伤害+12%",
		range = {}
	},
	[20106] = {
		buff_id = 20106,
		quality = 2,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄暴击伤害+17%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[20206] = {
		buff_id = 20206,
		quality = 2,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄暴击伤害+17%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[20306] = {
		buff_id = 20306,
		quality = 2,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有强者英雄暴击伤害+17%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[20406] = {
		buff_id = 20406,
		quality = 2,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有海军英雄暴击伤害+17%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[20506] = {
		buff_id = 20506,
		quality = 2,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄暴击伤害+17%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[21206] = {
		buff_id = 21206,
		quality = 2,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有法师英雄暴击伤害+17%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21306] = {
		buff_id = 21306,
		quality = 2,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有战士英雄暴击伤害+17%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[21406] = {
		buff_id = 21406,
		quality = 2,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄暴击伤害+17%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[21506] = {
		buff_id = 21506,
		quality = 2,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄暴击伤害+17%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[20007] = {
		buff_id = 20007,
		quality = 2,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "全体英雄闪躲+6%",
		range = {}
	},
	[20107] = {
		buff_id = 20107,
		quality = 2,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有海贼英雄闪躲+9%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[20207] = {
		buff_id = 20207,
		quality = 2,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有草帽联盟英雄闪躲+9%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[20307] = {
		buff_id = 20307,
		quality = 2,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有强者英雄闪躲+9%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[20407] = {
		buff_id = 20407,
		quality = 2,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有海军英雄闪躲+9%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[20507] = {
		buff_id = 20507,
		quality = 2,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有五皇团英雄闪躲+9%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[21207] = {
		buff_id = 21207,
		quality = 2,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有法师英雄闪躲+9%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21307] = {
		buff_id = 21307,
		quality = 2,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有战士英雄闪躲+9%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[21407] = {
		buff_id = 21407,
		quality = 2,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有坦克英雄闪躲+9%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[21507] = {
		buff_id = 21507,
		quality = 2,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有辅助英雄闪躲+9%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[20008] = {
		buff_id = 20008,
		quality = 2,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "全体英雄免伤+7%",
		range = {}
	},
	[20108] = {
		buff_id = 20108,
		quality = 2,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有海贼英雄免伤+10%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[20208] = {
		buff_id = 20208,
		quality = 2,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有草帽联盟英雄免伤+10%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[20308] = {
		buff_id = 20308,
		quality = 2,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有强者英雄免伤+10%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[20408] = {
		buff_id = 20408,
		quality = 2,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有海军英雄免伤+10%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[20508] = {
		buff_id = 20508,
		quality = 2,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有五皇团英雄免伤+10%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[21208] = {
		buff_id = 21208,
		quality = 2,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有法师英雄免伤+10%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21308] = {
		buff_id = 21308,
		quality = 2,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有战士英雄免伤+10%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[21408] = {
		buff_id = 21408,
		quality = 2,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有坦克英雄免伤+10%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[21508] = {
		buff_id = 21508,
		quality = 2,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有辅助英雄免伤+10%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[20009] = {
		buff_id = 20009,
		quality = 2,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "全体英雄速度+6%",
		range = {}
	},
	[20109] = {
		buff_id = 20109,
		quality = 2,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有海贼英雄速度+9%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[20209] = {
		buff_id = 20209,
		quality = 2,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有草帽联盟英雄速度+9%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[20309] = {
		buff_id = 20309,
		quality = 2,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有强者英雄速度+9%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[20409] = {
		buff_id = 20409,
		quality = 2,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有海军英雄速度+9%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[20509] = {
		buff_id = 20509,
		quality = 2,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有五皇团英雄速度+9%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[21209] = {
		buff_id = 21209,
		quality = 2,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有法师英雄速度+9%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21309] = {
		buff_id = 21309,
		quality = 2,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有战士英雄速度+9%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[21409] = {
		buff_id = 21409,
		quality = 2,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有坦克英雄速度+9%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[21509] = {
		buff_id = 21509,
		quality = 2,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有辅助英雄速度+9%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[20010] = {
		buff_id = 20010,
		quality = 2,
		name = "涂毒",
		res_id = "buff_icon_9",
		desc = "伤害时35%概率附带持续1回合的【中毒】效果，每回合损失5%生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[20011] = {
		buff_id = 20011,
		quality = 2,
		name = "伤害加深",
		res_id = "buff_icon_9",
		desc = "伤害时20%概率对受击单位附带持续2回合的20%【伤害加深】效果（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[20012] = {
		buff_id = 20012,
		quality = 2,
		name = "受创急疗",
		res_id = "buff_icon_9",
		desc = "受到暴击时回复自身生命值上限10%的生命值，1回合只能触发1次（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[20013] = {
		buff_id = 20013,
		quality = 2,
		name = "免伤护盾",
		res_id = "buff_icon_9",
		desc = "每回合开始时30%概率给自身附带持续2回合的【免伤护盾】，冷却2回合（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[20014] = {
		buff_id = 20014,
		quality = 2,
		name = "自我修复",
		res_id = "buff_icon_9",
		desc = "每回合开始时60%概率回复自身10%生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[21315] = {
		buff_id = 21315,
		quality = 2,
		name = "奥技暴追",
		res_id = "buff_icon_9",
		desc = "所有战士英雄使用物理攻击造成暴击时，75%概率再进行1次普攻（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[21316] = {
		buff_id = 21316,
		quality = 2,
		name = "奥技物连",
		res_id = "buff_icon_9",
		desc = "所有战士英雄物攻时有38%概率触发连击，再次释放技能，伤害、控制率为原来50%（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[21317] = {
		buff_id = 21317,
		quality = 2,
		name = "奥技穿透",
		res_id = "buff_icon_9",
		desc = "所有战士英雄伤害结果忽视目标25%防御（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[21218] = {
		buff_id = 21218,
		quality = 2,
		name = "奥技法连",
		res_id = "buff_icon_9",
		desc = "所有法师英雄法攻时有38%概率触发连击，再次释放技能，伤害、控制率为原来50%（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21219] = {
		buff_id = 21219,
		quality = 2,
		name = "奥技挑衅",
		res_id = "buff_icon_9",
		desc = "所有法师英雄攻击时，有10%概率强制令目标对自己进行普攻，持续1回合（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21220] = {
		buff_id = 21220,
		quality = 2,
		name = "奥技波动",
		res_id = "buff_icon_9",
		desc = "所有法师英雄造成魔法伤害时，最终伤害结果会在104-144%之间随机波动（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[21421] = {
		buff_id = 21421,
		quality = 2,
		name = "奥技再生",
		res_id = "buff_icon_9",
		desc = "所有坦克英雄回合开始时恢复自身生命值上限5%的生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[21422] = {
		buff_id = 21422,
		quality = 2,
		name = "奥技保命",
		res_id = "buff_icon_9",
		desc = "所有坦克英雄死亡时有45%概率复活，复活时恢复少量生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[21423] = {
		buff_id = 21423,
		quality = 2,
		name = "奥技神佑",
		res_id = "buff_icon_9",
		desc = "所有坦克英雄死亡时有15%概率复活，复活后恢复40%生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[21521] = {
		buff_id = 21521,
		quality = 2,
		name = "奥技再生",
		res_id = "buff_icon_9",
		desc = "所有辅助英雄回合开始时恢复自身生命值上限5%的生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[21522] = {
		buff_id = 21522,
		quality = 2,
		name = "奥技保命",
		res_id = "buff_icon_9",
		desc = "所有辅助英雄死亡时有45%概率复活，复活时恢复少量生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[21523] = {
		buff_id = 21523,
		quality = 2,
		name = "奥技神佑",
		res_id = "buff_icon_9",
		desc = "所有辅助英雄死亡时有15%概率复活，复活后恢复40%生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[20024] = {
		buff_id = 20024,
		quality = 2,
		name = "奥技禁疗",
		res_id = "buff_icon_9",
		desc = "攻击时有25%概率使目标治疗、被治疗效果降低19%，持续两回合",
		range = {}
	},
	[20025] = {
		buff_id = 20025,
		quality = 2,
		name = "奥技净化",
		res_id = "buff_icon_9",
		desc = "回合开始时，有57%概率清除自身所有负面状态",
		range = {}
	},
	[30001] = {
		buff_id = 30001,
		quality = 3,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "全体英雄攻击+10%",
		range = {}
	},
	[30101] = {
		buff_id = 30101,
		quality = 3,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄攻击+14%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[30201] = {
		buff_id = 30201,
		quality = 3,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄攻击+14%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[30301] = {
		buff_id = 30301,
		quality = 3,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有强者英雄攻击+14%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[30401] = {
		buff_id = 30401,
		quality = 3,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有海军英雄攻击+14%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[30501] = {
		buff_id = 30501,
		quality = 3,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄攻击+14%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[31201] = {
		buff_id = 31201,
		quality = 3,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有法师英雄攻击+14%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[31301] = {
		buff_id = 31301,
		quality = 3,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有战士英雄攻击+14%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[31401] = {
		buff_id = 31401,
		quality = 3,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄攻击+14%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[31501] = {
		buff_id = 31501,
		quality = 3,
		name = "所向披靡",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄攻击+14%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[30002] = {
		buff_id = 30002,
		quality = 3,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "全体英雄伤害+10%",
		range = {}
	},
	[30102] = {
		buff_id = 30102,
		quality = 3,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄伤害+14%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[30202] = {
		buff_id = 30202,
		quality = 3,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄伤害+14%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[30302] = {
		buff_id = 30302,
		quality = 3,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有强者英雄伤害+14%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[30402] = {
		buff_id = 30402,
		quality = 3,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有海军英雄伤害+14%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[30502] = {
		buff_id = 30502,
		quality = 3,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄伤害+14%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[31202] = {
		buff_id = 31202,
		quality = 3,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有法师英雄伤害+14%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[31302] = {
		buff_id = 31302,
		quality = 3,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有战士英雄伤害+14%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[31402] = {
		buff_id = 31402,
		quality = 3,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄伤害+14%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[31502] = {
		buff_id = 31502,
		quality = 3,
		name = "超凡伤害",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄伤害+14%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[30003] = {
		buff_id = 30003,
		quality = 3,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "全体英雄物理伤害+12%",
		range = {}
	},
	[30103] = {
		buff_id = 30103,
		quality = 3,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄物理伤害+17%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[30203] = {
		buff_id = 30203,
		quality = 3,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄物理伤害+17%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[30303] = {
		buff_id = 30303,
		quality = 3,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有强者英雄物理伤害+17%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[30403] = {
		buff_id = 30403,
		quality = 3,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有海军英雄物理伤害+17%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[30503] = {
		buff_id = 30503,
		quality = 3,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄物理伤害+17%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[31303] = {
		buff_id = 31303,
		quality = 3,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有战士英雄物理伤害+17%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[31403] = {
		buff_id = 31403,
		quality = 3,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄物理伤害+17%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[31503] = {
		buff_id = 31503,
		quality = 3,
		name = "千军辟易",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄物理伤害+17%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[30004] = {
		buff_id = 30004,
		quality = 3,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "全体英雄魔法伤害+12%",
		range = {}
	},
	[30104] = {
		buff_id = 30104,
		quality = 3,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄魔法伤害+17%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[30204] = {
		buff_id = 30204,
		quality = 3,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄魔法伤害+17%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[30304] = {
		buff_id = 30304,
		quality = 3,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有强者英雄魔法伤害+17%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[30404] = {
		buff_id = 30404,
		quality = 3,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有海军英雄魔法伤害+17%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[30504] = {
		buff_id = 30504,
		quality = 3,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄魔法伤害+17%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[31204] = {
		buff_id = 31204,
		quality = 3,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有法师英雄魔法伤害+17%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[31404] = {
		buff_id = 31404,
		quality = 3,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄魔法伤害+17%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[31504] = {
		buff_id = 31504,
		quality = 3,
		name = "魔力熔炉",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄魔法伤害+17%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[30005] = {
		buff_id = 30005,
		quality = 3,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "全体英雄暴击率+10%",
		range = {}
	},
	[30105] = {
		buff_id = 30105,
		quality = 3,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄暴击率+14%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[30205] = {
		buff_id = 30205,
		quality = 3,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄暴击率+14%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[30305] = {
		buff_id = 30305,
		quality = 3,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有强者英雄暴击率+14%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[30405] = {
		buff_id = 30405,
		quality = 3,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有海军英雄暴击率+14%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[30505] = {
		buff_id = 30505,
		quality = 3,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄暴击率+14%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[31205] = {
		buff_id = 31205,
		quality = 3,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有法师英雄暴击率+14%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[31305] = {
		buff_id = 31305,
		quality = 3,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有战士英雄暴击率+14%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[31405] = {
		buff_id = 31405,
		quality = 3,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄暴击率+14%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[31505] = {
		buff_id = 31505,
		quality = 3,
		name = "暴君降临",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄暴击率+14%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[30006] = {
		buff_id = 30006,
		quality = 3,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "全体英雄暴击伤害+16%",
		range = {}
	},
	[30106] = {
		buff_id = 30106,
		quality = 3,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有海贼英雄暴击伤害+23%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[30206] = {
		buff_id = 30206,
		quality = 3,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有草帽联盟英雄暴击伤害+23%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[30306] = {
		buff_id = 30306,
		quality = 3,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有强者英雄暴击伤害+23%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[30406] = {
		buff_id = 30406,
		quality = 3,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有海军英雄暴击伤害+23%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[30506] = {
		buff_id = 30506,
		quality = 3,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有五皇团英雄暴击伤害+23%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[31206] = {
		buff_id = 31206,
		quality = 3,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有法师英雄暴击伤害+23%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[31306] = {
		buff_id = 31306,
		quality = 3,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有战士英雄暴击伤害+23%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[31406] = {
		buff_id = 31406,
		quality = 3,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有坦克英雄暴击伤害+23%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[31506] = {
		buff_id = 31506,
		quality = 3,
		name = "怒发冲冠",
		res_id = "buff_icon_7",
		desc = "所有辅助英雄暴击伤害+23%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[30007] = {
		buff_id = 30007,
		quality = 3,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "全体英雄闪躲+9%",
		range = {}
	},
	[30107] = {
		buff_id = 30107,
		quality = 3,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有海贼英雄闪躲+13%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[30207] = {
		buff_id = 30207,
		quality = 3,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有草帽联盟英雄闪躲+13%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[30307] = {
		buff_id = 30307,
		quality = 3,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有强者英雄闪躲+13%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[30407] = {
		buff_id = 30407,
		quality = 3,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有海军英雄闪躲+13%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[30507] = {
		buff_id = 30507,
		quality = 3,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有五皇团英雄闪躲+13%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[31207] = {
		buff_id = 31207,
		quality = 3,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有法师英雄闪躲+13%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[31307] = {
		buff_id = 31307,
		quality = 3,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有战士英雄闪躲+13%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[31407] = {
		buff_id = 31407,
		quality = 3,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有坦克英雄闪躲+13%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[31507] = {
		buff_id = 31507,
		quality = 3,
		name = "瞬身之术",
		res_id = "buff_icon_4",
		desc = "所有辅助英雄闪躲+13%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[30008] = {
		buff_id = 30008,
		quality = 3,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "全体英雄免伤+10%",
		range = {}
	},
	[30108] = {
		buff_id = 30108,
		quality = 3,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有海贼英雄免伤+14%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[30208] = {
		buff_id = 30208,
		quality = 3,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有草帽联盟英雄免伤+14%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[30308] = {
		buff_id = 30308,
		quality = 3,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有强者英雄免伤+14%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[30408] = {
		buff_id = 30408,
		quality = 3,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有海军英雄免伤+14%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[30508] = {
		buff_id = 30508,
		quality = 3,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有五皇团英雄免伤+14%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[31208] = {
		buff_id = 31208,
		quality = 3,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有法师英雄免伤+14%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[31308] = {
		buff_id = 31308,
		quality = 3,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有战士英雄免伤+14%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[31408] = {
		buff_id = 31408,
		quality = 3,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有坦克英雄免伤+14%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[31508] = {
		buff_id = 31508,
		quality = 3,
		name = "坚如磐石",
		res_id = "buff_icon_1",
		desc = "所有辅助英雄免伤+14%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[30009] = {
		buff_id = 30009,
		quality = 3,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "全体英雄速度+9%",
		range = {}
	},
	[30109] = {
		buff_id = 30109,
		quality = 3,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有海贼英雄速度+13%",
		range = {
			{
				"camp_type",
				1
			}
		}
	},
	[30209] = {
		buff_id = 30209,
		quality = 3,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有草帽联盟英雄速度+13%",
		range = {
			{
				"camp_type",
				2
			}
		}
	},
	[30309] = {
		buff_id = 30309,
		quality = 3,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有强者英雄速度+13%",
		range = {
			{
				"camp_type",
				3
			}
		}
	},
	[30409] = {
		buff_id = 30409,
		quality = 3,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有海军英雄速度+13%",
		range = {
			{
				"camp_type",
				4
			}
		}
	},
	[30509] = {
		buff_id = 30509,
		quality = 3,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有五皇团英雄速度+13%",
		range = {
			{
				"camp_type",
				5
			}
		}
	},
	[31209] = {
		buff_id = 31209,
		quality = 3,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有法师英雄速度+13%",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[31309] = {
		buff_id = 31309,
		quality = 3,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有战士英雄速度+13%",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[31409] = {
		buff_id = 31409,
		quality = 3,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有坦克英雄速度+13%",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[31509] = {
		buff_id = 31509,
		quality = 3,
		name = "风驰电掣",
		res_id = "buff_icon_5",
		desc = "所有辅助英雄速度+13%",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[30010] = {
		buff_id = 30010,
		quality = 3,
		name = "涂毒",
		res_id = "buff_icon_9",
		desc = "伤害时50%概率附带持续1回合的【中毒】效果，每回合损失5%生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30011] = {
		buff_id = 30011,
		quality = 3,
		name = "伤害加深",
		res_id = "buff_icon_9",
		desc = "伤害时30%概率对受击单位附带持续2回合的20%【伤害加深】效果（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30012] = {
		buff_id = 30012,
		quality = 3,
		name = "受创急疗",
		res_id = "buff_icon_9",
		desc = "受到暴击时回复自身生命值上限15%的生命值，1回合只能触发1次（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30013] = {
		buff_id = 30013,
		quality = 3,
		name = "免伤护盾",
		res_id = "buff_icon_9",
		desc = "每回合开始时40%概率给自身附带持续2回合的【免伤护盾】，冷却2回合（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[30014] = {
		buff_id = 30014,
		quality = 3,
		name = "自我修复",
		res_id = "buff_icon_9",
		desc = "每回合开始时60%概率回复自身15%生命值（若存在同系列技能则取效果更高者）",
		range = {}
	},
	[31315] = {
		buff_id = 31315,
		quality = 3,
		name = "奥技暴追",
		res_id = "buff_icon_9",
		desc = "所有战士英雄使用物理攻击造成暴击时，100%概率再进行1次普攻（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[31316] = {
		buff_id = 31316,
		quality = 3,
		name = "奥技物连",
		res_id = "buff_icon_9",
		desc = "所有战士英雄物攻时有50%概率触发连击，再次释放技能，伤害、控制率为原来50%（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[31317] = {
		buff_id = 31317,
		quality = 3,
		name = "奥技穿透",
		res_id = "buff_icon_9",
		desc = "所有战士英雄伤害结果忽视目标38%防御（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				3
			}
		}
	},
	[31218] = {
		buff_id = 31218,
		quality = 3,
		name = "奥技法连",
		res_id = "buff_icon_9",
		desc = "所有法师英雄法攻时有50%概率触发连击，再次释放技能，伤害、控制率为原来50%（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[31219] = {
		buff_id = 31219,
		quality = 3,
		name = "奥技挑衅",
		res_id = "buff_icon_9",
		desc = "所有法师英雄攻击时，有15%概率强制令目标对自己进行普攻，持续1回合（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[31220] = {
		buff_id = 31220,
		quality = 3,
		name = "奥技波动",
		res_id = "buff_icon_9",
		desc = "所有法师英雄造成魔法伤害时，最终伤害结果会在110-150%之间随机波动（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				2
			}
		}
	},
	[31421] = {
		buff_id = 31421,
		quality = 3,
		name = "奥技再生",
		res_id = "buff_icon_9",
		desc = "所有坦克英雄回合开始时恢复自身生命值上限7.5%的生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[31422] = {
		buff_id = 31422,
		quality = 3,
		name = "奥技保命",
		res_id = "buff_icon_9",
		desc = "所有坦克英雄死亡时有75%概率复活，复活时恢复少量生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[31423] = {
		buff_id = 31423,
		quality = 3,
		name = "奥技神佑",
		res_id = "buff_icon_9",
		desc = "所有坦克英雄死亡时有20%概率复活，复活后恢复50%生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				4
			}
		}
	},
	[31521] = {
		buff_id = 31521,
		quality = 3,
		name = "奥技再生",
		res_id = "buff_icon_9",
		desc = "所有辅助英雄回合开始时恢复自身生命值上限7.5%的生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[31522] = {
		buff_id = 31522,
		quality = 3,
		name = "奥技保命",
		res_id = "buff_icon_9",
		desc = "所有辅助英雄死亡时有75%概率复活，复活时恢复少量生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[31523] = {
		buff_id = 31523,
		quality = 3,
		name = "奥技神佑",
		res_id = "buff_icon_9",
		desc = "所有辅助英雄死亡时有20%概率复活，复活后恢复50%生命值（若存在同系列技能则取效果更高者）",
		range = {
			{
				"career_type",
				5
			}
		}
	},
	[30024] = {
		buff_id = 30024,
		quality = 3,
		name = "奥技禁疗",
		res_id = "buff_icon_9",
		desc = "攻击时有30%概率使目标治疗、被治疗效果降低32%，持续两回合",
		range = {}
	},
	[30025] = {
		buff_id = 30025,
		quality = 3,
		name = "奥技净化",
		res_id = "buff_icon_9",
		desc = "回合开始时，有75%概率清除自身所有负面状态",
		range = {}
	},
	[32001] = {
		buff_id = 32001,
		quality = 3,
		name = "强化-机械巨臂",
		res_id = "buff_icon_10",
		desc = "基德的【机械巨臂】变为攻击敌方全体单位，且伤害提升20%",
		range = {
			{
				"partner",
				10505
			}
		}
	},
	[32002] = {
		buff_id = 32002,
		quality = 3,
		name = "强化-艾斯",
		res_id = "buff_icon_10",
		desc = "提升艾斯15%控制率和10%的速度",
		range = {
			{
				"partner",
				10502
			}
		}
	},
	[32003] = {
		buff_id = 32003,
		quality = 3,
		name = "强化-三千世界",
		res_id = "buff_icon_10",
		desc = "索隆(伟大航路)的【三千世界】变为攻击敌方全体单位，且触发【出血】时额外增加1层",
		range = {
			{
				"partner",
				20508
			}
		}
	},
	[32004] = {
		buff_id = 32004,
		quality = 3,
		name = "强化-漩涡",
		res_id = "buff_icon_10",
		desc = "乔巴的【漩涡】变为攻击敌方全体单位，且100%触发【伤害加深】",
		range = {
			{
				"partner",
				20507
			}
		}
	},
	[32005] = {
		buff_id = 32005,
		quality = 3,
		name = "强化-切割剪刀",
		res_id = "buff_icon_10",
		desc = "龙马的【切割剪刀】攻击单位+1，且触发【沉默】概率提升20%",
		range = {
			{
				"partner",
				30508
			}
		}
	},
	[32006] = {
		buff_id = 32006,
		quality = 3,
		name = "强化-无上大快刀",
		res_id = "buff_icon_10",
		desc = "鹰眼【无上大快刀】溅射的单位增加2个，且溅射伤害提升20%",
		range = {
			{
				"partner",
				30509
			}
		}
	},
	[32007] = {
		buff_id = 32007,
		quality = 3,
		name = "强化-毒龙",
		res_id = "buff_icon_10",
		desc = "麦哲伦【毒龙】攻击单位+1，且伤害提升30%",
		range = {
			{
				"partner",
				40509
			}
		}
	},
	[32008] = {
		buff_id = 32008,
		quality = 3,
		name = "强化-鹤",
		res_id = "buff_icon_10",
		desc = "提升鹤30%治疗量",
		range = {
			{
				"partner",
				40507
			}
		}
	},
	[32009] = {
		buff_id = 32009,
		quality = 3,
		name = "强化-香克斯",
		res_id = "buff_icon_10",
		desc = "香克斯的【涅影暴斩】技能变为攻击敌方全体单位，且100%触发【流血】",
		range = {
			{
				"partner",
				50504
			}
		}
	},
	[32010] = {
		buff_id = 32010,
		quality = 3,
		name = "强化-白胡子",
		res_id = "buff_icon_10",
		desc = "提升白胡子30%物理伤害",
		range = {
			{
				"partner",
				50508
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
	}
}

function Config.SecretDunData.data_buff_fun(slot0)
	slot1 = Config.SecretDunData.data_buff[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.SecretDunData.data_buff[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
