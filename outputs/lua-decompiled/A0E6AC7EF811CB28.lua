Config = Config or {}
Config.PrimusData = Config.PrimusData or {}
Config.PrimusData.data_const_length = 7
Config.PrimusData.data_const = {
	open_lev = {
		val = 35,
		desc = "达到35级后开启"
	},
	open_dun_id = {
		val = 0,
		desc = "副本开启"
	},
	daily_challenge_limit = {
		val = 1599,
		desc = "每日挑战次数限制"
	},
	evolution_limit = {
		val = 1599,
		desc = "进化次数上限"
	},
	lose_challange_cd = {
		val = 1200,
		desc = "挑战失败后的冷却cd"
	},
	game_rule = {
		val = 1,
		desc = [[
1.竞技场排名达到指定名次内可挑战霸主之位，3类霸主之位分别对应排名条件为<div fontcolor=289b14>前3名</div>、<div fontcolor=289b14>前5名</div>、<div fontcolor=289b14>前10名</div>
2.挑战成功后，玩家会取代霸主之位上的Boss，并且获得对应的<div fontcolor=289b14>霸主之位称号</div>，装配称号可享受强大<div fontcolor=289b14>属性加成</div>
3.若在位玩家被其他挑战者挑战成功，则挑战者则替换该玩家成为新的霸主之位主人，同时丧失霸主之位的玩家称号将失效
4.每位挑战者只可占有一个霸主之位，在位期间若挑战其他霸主之位成功，将丧失原有的霸主之位
5.挑战失败将进入<div fontcolor=289b14>20分钟</div>的冷却时间，期间无法挑战任何霸主之位]]
	},
	redpoint_close_condition = {
		val = 60,
		desc = "红点关闭的等级"
	}
}

function Config.PrimusData.data_const_fun(slot0)
	slot1 = Config.PrimusData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PrimusData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PrimusData.data_upgrade_length = 6
Config.PrimusData.data_upgrade = {
	{
		look_id = 340502,
		name = "最强生物",
		honor_id = 90801,
		arena_rank = 10,
		pos = 1
	},
	{
		look_id = 320508,
		name = "海上之皇",
		honor_id = 90802,
		arena_rank = 20,
		pos = 2
	},
	{
		look_id = 330506,
		name = "海上之皇",
		honor_id = 90802,
		arena_rank = 20,
		pos = 3
	},
	{
		look_id = 310501,
		name = "超新星",
		honor_id = 90803,
		arena_rank = 50,
		pos = 4
	},
	{
		look_id = 310501,
		name = "超新星",
		honor_id = 90803,
		arena_rank = 50,
		pos = 5
	},
	{
		look_id = 310501,
		name = "超新星",
		honor_id = 90803,
		arena_rank = 50,
		pos = 6
	}
}

function Config.PrimusData.data_upgrade_fun(slot0)
	slot1 = Config.PrimusData.data_upgrade[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PrimusData.data_upgrade[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PrimusData.data_unitdata_length = 48
Config.PrimusData.data_unitdata = {
	["1_0"] = {
		min = 0,
		unit_id = 81011,
		look_id = 330508,
		pos = 1,
		max = 99,
		attr = {
			{
				"atk_per",
				12
			},
			{
				"def_per",
				6
			},
			{
				"hp_max_per",
				11
			},
			{
				"speed_per",
				6
			}
		},
		act_skill = {
			503101,
			503301
		},
		passive_skill = {
			503201,
			503401
		}
	},
	["1_100"] = {
		min = 100,
		unit_id = 81012,
		look_id = 310510,
		pos = 1,
		max = 199,
		attr = {
			{
				"atk_per",
				13
			},
			{
				"def_per",
				5
			},
			{
				"hp_max_per",
				14
			},
			{
				"speed_per",
				4
			}
		},
		act_skill = {
			513103,
			513302
		},
		passive_skill = {
			513202,
			513402,
			750000
		}
	},
	["1_200"] = {
		min = 200,
		unit_id = 81013,
		look_id = 320508,
		pos = 1,
		max = 299,
		attr = {
			{
				"atk_per",
				9
			},
			{
				"def_per",
				3
			},
			{
				"hp_max_per",
				10
			},
			{
				"speed_per",
				3
			}
		},
		act_skill = {
			506103,
			506302
		},
		passive_skill = {
			506202,
			506402,
			750200
		}
	},
	["1_300"] = {
		min = 300,
		unit_id = 81014,
		look_id = 350509,
		pos = 1,
		max = 399,
		attr = {
			{
				"atk_per",
				4
			},
			{
				"def_per",
				3
			},
			{
				"hp_max_per",
				7
			},
			{
				"speed_per",
				2
			}
		},
		act_skill = {
			521103
		},
		passive_skill = {
			521203,
			521302,
			521402,
			750201,
			750401
		}
	},
	["1_400"] = {
		min = 400,
		unit_id = 81015,
		look_id = 320510,
		pos = 1,
		max = 499,
		attr = {
			{
				"atk_per",
				3
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				3
			},
			{
				"speed_per",
				2
			}
		},
		act_skill = {
			520103
		},
		passive_skill = {
			520203,
			520303,
			520402,
			750201,
			750401
		}
	},
	["1_500"] = {
		min = 500,
		unit_id = 81016,
		look_id = 330509,
		pos = 1,
		max = 799,
		attr = {
			{
				"atk_per",
				2
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				2
			},
			{
				"speed_per",
				1
			}
		},
		act_skill = {
			515103,
			515303
		},
		passive_skill = {
			515203,
			515403,
			750202,
			750402,
			700035,
			700015
		}
	},
	["1_800"] = {
		min = 800,
		unit_id = 81017,
		look_id = 340509,
		pos = 1,
		max = 999,
		attr = {
			{
				"atk_per",
				3
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				3
			},
			{
				"speed_per",
				1
			}
		},
		act_skill = {
			519103,
			519303
		},
		passive_skill = {
			519203,
			519403,
			750002,
			700145,
			700235,
			700005
		}
	},
	["1_1000"] = {
		min = 1000,
		unit_id = 81018,
		look_id = 350508,
		pos = 1,
		max = 1599,
		attr = {
			{
				"atk_per",
				1
			},
			{
				"def_per",
				0
			},
			{
				"hp_max_per",
				1
			},
			{
				"speed_per",
				0
			}
		},
		act_skill = {
			516103,
			516303
		},
		passive_skill = {
			516203,
			516403,
			750202,
			750402,
			700035,
			700015
		}
	},
	["2_0"] = {
		min = 0,
		unit_id = 81021,
		look_id = 350504,
		pos = 2,
		max = 99,
		attr = {
			{
				"atk_per",
				12
			},
			{
				"def_per",
				8
			},
			{
				"hp_max_per",
				13
			},
			{
				"speed_per",
				7
			}
		},
		act_skill = {
			153102,
			153302
		},
		passive_skill = {
			153202,
			153402,
			750200
		}
	},
	["2_100"] = {
		min = 100,
		unit_id = 81022,
		look_id = 310512,
		pos = 2,
		max = 199,
		attr = {
			{
				"atk_per",
				13
			},
			{
				"def_per",
				4
			},
			{
				"hp_max_per",
				13
			},
			{
				"speed_per",
				5
			}
		},
		act_skill = {
			526103,
			526302
		},
		passive_skill = {
			526202,
			526402,
			700221
		}
	},
	["2_200"] = {
		min = 200,
		unit_id = 81023,
		look_id = 320510,
		pos = 2,
		max = 299,
		attr = {
			{
				"atk_per",
				9
			},
			{
				"def_per",
				3
			},
			{
				"hp_max_per",
				10
			},
			{
				"speed_per",
				3
			}
		},
		act_skill = {
			520103
		},
		passive_skill = {
			520203,
			520302,
			520402,
			750201,
			750401
		}
	},
	["2_300"] = {
		min = 300,
		unit_id = 81024,
		look_id = 340503,
		pos = 2,
		max = 399,
		attr = {
			{
				"atk_per",
				6
			},
			{
				"def_per",
				3
			},
			{
				"hp_max_per",
				6
			},
			{
				"speed_per",
				2
			}
		},
		act_skill = {
			256103,
			256302
		},
		passive_skill = {
			256202,
			750001,
			700143
		}
	},
	["2_400"] = {
		min = 400,
		unit_id = 81025,
		look_id = 330509,
		pos = 2,
		max = 499,
		attr = {
			{
				"atk_per",
				2
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				4
			},
			{
				"speed_per",
				1
			}
		},
		act_skill = {
			515103,
			515303
		},
		passive_skill = {
			515203,
			515403,
			750202,
			750402,
			700035,
			700015
		}
	},
	["2_500"] = {
		min = 500,
		unit_id = 81026,
		look_id = 350509,
		pos = 2,
		max = 799,
		attr = {
			{
				"atk_per",
				2
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				2
			},
			{
				"speed_per",
				1
			}
		},
		act_skill = {
			521103
		},
		passive_skill = {
			521203,
			521303,
			521403,
			750202,
			750402,
			700035,
			700015
		}
	},
	["2_800"] = {
		min = 800,
		unit_id = 81027,
		look_id = 330508,
		pos = 2,
		max = 999,
		attr = {
			{
				"atk_per",
				3
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				3
			},
			{
				"speed_per",
				1
			}
		},
		act_skill = {
			503103,
			503303
		},
		passive_skill = {
			503203,
			503403,
			750202,
			750402,
			700035,
			700015
		}
	},
	["2_1000"] = {
		min = 1000,
		unit_id = 81028,
		look_id = 340509,
		pos = 2,
		max = 1599,
		attr = {
			{
				"atk_per",
				1
			},
			{
				"def_per",
				1
			},
			{
				"hp_max_per",
				1
			},
			{
				"speed_per",
				0
			}
		},
		act_skill = {
			519103,
			519303
		},
		passive_skill = {
			519203,
			519403,
			750002,
			700145,
			700235,
			700005
		}
	},
	["3_0"] = {
		min = 0,
		unit_id = 81091,
		look_id = 320509,
		pos = 3,
		max = 99,
		attr = {
			{
				"atk_per",
				12
			},
			{
				"def_per",
				8
			},
			{
				"hp_max_per",
				13
			},
			{
				"speed_per",
				7
			}
		},
		act_skill = {
			512102,
			512302
		},
		passive_skill = {
			512202,
			512402,
			750200
		}
	},
	["3_100"] = {
		min = 100,
		unit_id = 81092,
		look_id = 310512,
		pos = 3,
		max = 199,
		attr = {
			{
				"atk_per",
				13
			},
			{
				"def_per",
				4
			},
			{
				"hp_max_per",
				13
			},
			{
				"speed_per",
				5
			}
		},
		act_skill = {
			526103,
			526302
		},
		passive_skill = {
			526202,
			526402,
			700221
		}
	},
	["3_200"] = {
		min = 200,
		unit_id = 81093,
		look_id = 320508,
		pos = 3,
		max = 299,
		attr = {
			{
				"atk_per",
				9
			},
			{
				"def_per",
				3
			},
			{
				"hp_max_per",
				10
			},
			{
				"speed_per",
				3
			}
		},
		act_skill = {
			506103,
			506302
		},
		passive_skill = {
			506203,
			506402,
			750201,
			750401
		}
	},
	["3_300"] = {
		min = 300,
		unit_id = 81094,
		look_id = 330509,
		pos = 3,
		max = 399,
		attr = {
			{
				"atk_per",
				6
			},
			{
				"def_per",
				3
			},
			{
				"hp_max_per",
				6
			},
			{
				"speed_per",
				2
			}
		},
		act_skill = {
			515103,
			515303
		},
		passive_skill = {
			515203,
			515402,
			750201,
			750401
		}
	},
	["3_400"] = {
		min = 400,
		unit_id = 81095,
		look_id = 340503,
		pos = 3,
		max = 499,
		attr = {
			{
				"atk_per",
				2
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				4
			},
			{
				"speed_per",
				1
			}
		},
		act_skill = {
			256103,
			256303
		},
		passive_skill = {
			256202,
			750001,
			700143
		}
	},
	["3_500"] = {
		min = 500,
		unit_id = 81096,
		look_id = 320510,
		pos = 3,
		max = 799,
		attr = {
			{
				"atk_per",
				2
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				2
			},
			{
				"speed_per",
				1
			}
		},
		act_skill = {
			520103
		},
		passive_skill = {
			520203,
			520303,
			520403,
			750202,
			750402,
			700035,
			700015
		}
	},
	["3_800"] = {
		min = 800,
		unit_id = 81097,
		look_id = 320505,
		pos = 3,
		max = 999,
		attr = {
			{
				"atk_per",
				3
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				3
			},
			{
				"speed_per",
				1
			}
		},
		act_skill = {
			244103,
			244303
		},
		passive_skill = {
			244203,
			244403,
			750002,
			700145,
			700235,
			700005
		}
	},
	["3_1000"] = {
		min = 1000,
		unit_id = 81098,
		look_id = 330508,
		pos = 3,
		max = 1599,
		attr = {
			{
				"atk_per",
				1
			},
			{
				"def_per",
				1
			},
			{
				"hp_max_per",
				1
			},
			{
				"speed_per",
				0
			}
		},
		act_skill = {
			503103,
			503303
		},
		passive_skill = {
			503203,
			503403,
			750202,
			750402,
			700035,
			700015
		}
	},
	["4_0"] = {
		min = 0,
		unit_id = 81031,
		look_id = 350508,
		pos = 4,
		max = 99,
		attr = {
			{
				"atk_per",
				12
			},
			{
				"def_per",
				8
			},
			{
				"hp_max_per",
				13
			},
			{
				"speed_per",
				9
			}
		},
		act_skill = {
			516101,
			516301
		},
		passive_skill = {
			516201,
			516401
		}
	},
	["4_100"] = {
		min = 100,
		unit_id = 81032,
		look_id = 330508,
		pos = 4,
		max = 199,
		attr = {
			{
				"atk_per",
				13
			},
			{
				"def_per",
				5
			},
			{
				"hp_max_per",
				13
			},
			{
				"speed_per",
				4
			}
		},
		act_skill = {
			503102,
			503302
		},
		passive_skill = {
			503202,
			503402,
			750200
		}
	},
	["4_200"] = {
		min = 200,
		unit_id = 81033,
		look_id = 320510,
		pos = 4,
		max = 299,
		attr = {
			{
				"atk_per",
				9
			},
			{
				"def_per",
				4
			},
			{
				"hp_max_per",
				11
			},
			{
				"speed_per",
				3
			}
		},
		act_skill = {
			520103
		},
		passive_skill = {
			520202,
			520302,
			520402,
			750200
		}
	},
	["4_300"] = {
		min = 300,
		unit_id = 81034,
		look_id = 340503,
		pos = 4,
		max = 399,
		attr = {
			{
				"atk_per",
				6
			},
			{
				"def_per",
				3
			},
			{
				"hp_max_per",
				6
			},
			{
				"speed_per",
				2
			}
		},
		act_skill = {
			256103,
			256302
		},
		passive_skill = {
			256202,
			750001,
			700143
		}
	},
	["4_400"] = {
		min = 400,
		unit_id = 81035,
		look_id = 330509,
		pos = 4,
		max = 499,
		attr = {
			{
				"atk_per",
				3
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				4
			},
			{
				"speed_per",
				2
			}
		},
		act_skill = {
			515103,
			515303
		},
		passive_skill = {
			515203,
			515402,
			750201,
			750401
		}
	},
	["4_500"] = {
		min = 500,
		unit_id = 81036,
		look_id = 350505,
		pos = 4,
		max = 799,
		attr = {
			{
				"atk_per",
				2
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				2
			},
			{
				"speed_per",
				1
			}
		},
		act_skill = {
			251103,
			251303
		},
		passive_skill = {
			251203,
			251403,
			750002,
			700145,
			700235,
			700005
		}
	},
	["4_800"] = {
		min = 800,
		unit_id = 81037,
		look_id = 350509,
		pos = 4,
		max = 999,
		attr = {
			{
				"atk_per",
				3
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				3
			},
			{
				"speed_per",
				1
			}
		},
		act_skill = {
			521103
		},
		passive_skill = {
			521203,
			521303,
			521403,
			750202,
			750402,
			700035,
			700015
		}
	},
	["4_1000"] = {
		min = 1000,
		unit_id = 81038,
		look_id = 310512,
		pos = 4,
		max = 1599,
		attr = {
			{
				"atk_per",
				1
			},
			{
				"def_per",
				1
			},
			{
				"hp_max_per",
				1
			},
			{
				"speed_per",
				0
			}
		},
		act_skill = {
			526103,
			526303
		},
		passive_skill = {
			526203,
			526403,
			700225,
			750102,
			700235,
			700175
		}
	},
	["5_0"] = {
		min = 0,
		unit_id = 81041,
		look_id = 330508,
		pos = 5,
		max = 99,
		attr = {
			{
				"atk_per",
				12
			},
			{
				"def_per",
				8
			},
			{
				"hp_max_per",
				13
			},
			{
				"speed_per",
				9
			}
		},
		act_skill = {
			503101,
			503301
		},
		passive_skill = {
			503201,
			503401
		}
	},
	["5_100"] = {
		min = 100,
		unit_id = 81042,
		look_id = 320510,
		pos = 5,
		max = 199,
		attr = {
			{
				"atk_per",
				13
			},
			{
				"def_per",
				5
			},
			{
				"hp_max_per",
				13
			},
			{
				"speed_per",
				4
			}
		},
		act_skill = {
			520102
		},
		passive_skill = {
			520202,
			520302,
			520402,
			750200
		}
	},
	["5_200"] = {
		min = 200,
		unit_id = 81043,
		look_id = 310512,
		pos = 5,
		max = 299,
		attr = {
			{
				"atk_per",
				9
			},
			{
				"def_per",
				4
			},
			{
				"hp_max_per",
				11
			},
			{
				"speed_per",
				3
			}
		},
		act_skill = {
			526103,
			526302
		},
		passive_skill = {
			526202,
			526402,
			700221
		}
	},
	["5_300"] = {
		min = 300,
		unit_id = 81044,
		look_id = 330509,
		pos = 5,
		max = 399,
		attr = {
			{
				"atk_per",
				6
			},
			{
				"def_per",
				3
			},
			{
				"hp_max_per",
				6
			},
			{
				"speed_per",
				2
			}
		},
		act_skill = {
			515103,
			515302
		},
		passive_skill = {
			515203,
			515402,
			750201,
			750401
		}
	},
	["5_400"] = {
		min = 400,
		unit_id = 81045,
		look_id = 350508,
		pos = 5,
		max = 499,
		attr = {
			{
				"atk_per",
				3
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				4
			},
			{
				"speed_per",
				2
			}
		},
		act_skill = {
			516103,
			516303
		},
		passive_skill = {
			516203,
			516402,
			750201,
			750401
		}
	},
	["5_500"] = {
		min = 500,
		unit_id = 81046,
		look_id = 350509,
		pos = 5,
		max = 799,
		attr = {
			{
				"atk_per",
				2
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				2
			},
			{
				"speed_per",
				1
			}
		},
		act_skill = {
			521103
		},
		passive_skill = {
			521203,
			521303,
			521403,
			750202,
			750402,
			700035,
			700015
		}
	},
	["5_800"] = {
		min = 800,
		unit_id = 81047,
		look_id = 330508,
		pos = 5,
		max = 999,
		attr = {
			{
				"atk_per",
				3
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				3
			},
			{
				"speed_per",
				1
			}
		},
		act_skill = {
			503103,
			503303
		},
		passive_skill = {
			503203,
			503403,
			750202,
			750402,
			700035,
			700015
		}
	},
	["5_1000"] = {
		min = 1000,
		unit_id = 81048,
		look_id = 340509,
		pos = 5,
		max = 1599,
		attr = {
			{
				"atk_per",
				1
			},
			{
				"def_per",
				1
			},
			{
				"hp_max_per",
				1
			},
			{
				"speed_per",
				0
			}
		},
		act_skill = {
			519103,
			519303
		},
		passive_skill = {
			519203,
			519403,
			750002,
			700145,
			700235,
			700005
		}
	},
	["6_0"] = {
		min = 0,
		unit_id = 81051,
		look_id = 310510,
		pos = 6,
		max = 99,
		attr = {
			{
				"atk_per",
				12
			},
			{
				"def_per",
				8
			},
			{
				"hp_max_per",
				13
			},
			{
				"speed_per",
				9
			}
		},
		act_skill = {
			513101,
			513301
		},
		passive_skill = {
			513201,
			513401
		}
	},
	["6_100"] = {
		min = 100,
		unit_id = 81052,
		look_id = 350502,
		pos = 6,
		max = 199,
		attr = {
			{
				"atk_per",
				13
			},
			{
				"def_per",
				5
			},
			{
				"hp_max_per",
				13
			},
			{
				"speed_per",
				4
			}
		},
		act_skill = {
			214102,
			214302
		},
		passive_skill = {
			214202,
			214402,
			750000
		}
	},
	["6_200"] = {
		min = 200,
		unit_id = 81053,
		look_id = 330508,
		pos = 6,
		max = 299,
		attr = {
			{
				"atk_per",
				9
			},
			{
				"def_per",
				4
			},
			{
				"hp_max_per",
				11
			},
			{
				"speed_per",
				3
			}
		},
		act_skill = {
			503103,
			503302
		},
		passive_skill = {
			503202,
			503402,
			750200
		}
	},
	["6_300"] = {
		min = 300,
		unit_id = 81054,
		look_id = 340503,
		pos = 6,
		max = 399,
		attr = {
			{
				"atk_per",
				6
			},
			{
				"def_per",
				3
			},
			{
				"hp_max_per",
				6
			},
			{
				"speed_per",
				2
			}
		},
		act_skill = {
			256103,
			256302
		},
		passive_skill = {
			256202,
			750001,
			700143
		}
	},
	["6_400"] = {
		min = 400,
		unit_id = 81055,
		look_id = 350504,
		pos = 6,
		max = 499,
		attr = {
			{
				"atk_per",
				3
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				4
			},
			{
				"speed_per",
				2
			}
		},
		act_skill = {
			153103,
			153303
		},
		passive_skill = {
			153203,
			153403,
			750201,
			750401
		}
	},
	["6_500"] = {
		min = 500,
		unit_id = 81056,
		look_id = 340504,
		pos = 6,
		max = 799,
		attr = {
			{
				"atk_per",
				2
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				2
			},
			{
				"speed_per",
				1
			}
		},
		act_skill = {
			510103
		},
		passive_skill = {
			510203,
			510403,
			750202,
			750402,
			700035,
			700015
		}
	},
	["6_800"] = {
		min = 800,
		unit_id = 81057,
		look_id = 330509,
		pos = 6,
		max = 999,
		attr = {
			{
				"atk_per",
				3
			},
			{
				"def_per",
				2
			},
			{
				"hp_max_per",
				3
			},
			{
				"speed_per",
				1
			}
		},
		act_skill = {
			515103,
			515303
		},
		passive_skill = {
			515203,
			515403,
			750202,
			750402,
			700035,
			700015
		}
	},
	["6_1000"] = {
		min = 1000,
		unit_id = 81058,
		look_id = 320510,
		pos = 6,
		max = 1599,
		attr = {
			{
				"atk_per",
				1
			},
			{
				"def_per",
				1
			},
			{
				"hp_max_per",
				1
			},
			{
				"speed_per",
				0
			}
		},
		act_skill = {
			520103
		},
		passive_skill = {
			520203,
			520303,
			520403,
			750202,
			750402,
			700035,
			700015
		}
	}
}

function Config.PrimusData.data_unitdata_fun(slot0)
	slot1 = Config.PrimusData.data_unitdata[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PrimusData.data_unitdata[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
