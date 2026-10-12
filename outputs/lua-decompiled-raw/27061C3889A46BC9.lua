Config = Config or {}
Config.AgendaData = Config.AgendaData or {}
Config.AgendaData.data_const_length = 0
Config.AgendaData.data_const = {}
Config.AgendaData.data_agenda_list_length = 22
Config.AgendaData.data_agenda_list = {
	[1001] = {
		name = "剧情副本",
		gain_ico = 3,
		type = 1,
		event = "evt_dungeon_pass",
		max_times = 20,
		reset_time = 2,
		desc = "每天必做的副本，提升英雄等级、获取英雄常规进阶材料的产出地",
		rank = 1,
		ico = 1001,
		recommend = 1,
		activity = 3,
		max_activity = 60,
		label = 1,
		is_show = 1,
		id = 1001,
		open_lev = 1,
		param = {
			3
		},
		filter_type = {
			{
				filter_name = 1
			},
			{
				filter_name = 2
			}
		},
		open_day = {},
		open_time = {},
		drop = {
			{
				1,
				1
			},
			{
				10705,
				1
			},
			{
				3,
				1
			},
			{
				10,
				1
			}
		}
	},
	[1002] = {
		name = "地下城",
		gain_ico = 3,
		type = 1,
		event = "evt_dungeon_pass",
		max_times = 5,
		reset_time = 2,
		desc = "获得英雄进阶材料的宝典产出地，还有几率掉落英雄碎片哦~",
		rank = 2,
		ico = 1002,
		recommend = 1,
		activity = 6,
		max_activity = 30,
		label = 1,
		is_show = 1,
		id = 1002,
		open_lev = 1,
		param = {
			3,
			1
		},
		filter_type = {
			{
				filter_name = 1
			},
			{
				filter_name = 2
			}
		},
		open_day = {},
		open_time = {},
		drop = {
			{
				20071,
				1
			},
			{
				10603,
				1
			},
			{
				3,
				1
			},
			{
				1,
				1
			},
			{
				10,
				1
			}
		}
	},
	[1003] = {
		name = "竞技场",
		gain_ico = 6,
		type = 1,
		event = "evt_arena_fight",
		max_times = 5,
		reset_time = 2,
		desc = "竞技场可获得大量的竞技积分，每天结算还能获得大量奖励~",
		rank = 4,
		ico = 1003,
		recommend = 0,
		activity = 10,
		max_activity = 50,
		label = 1,
		is_show = 1,
		id = 1003,
		open_lev = 10,
		param = {},
		filter_type = {
			{
				filter_name = 0
			}
		},
		open_day = {},
		open_time = {},
		drop = {
			{
				1,
				1
			},
			{
				6,
				1
			}
		}
	},
	[1004] = {
		name = "异界裂缝",
		gain_ico = 10214,
		type = 1,
		event = "evt_farplane_fight",
		max_times = 2,
		reset_time = 2,
		desc = "能产出珍稀的洗炼石，改变装备属性，一不小心就成极品~",
		rank = 16,
		ico = 1004,
		recommend = 0,
		activity = 10,
		max_activity = 20,
		label = 1,
		is_show = 1,
		id = 1004,
		open_lev = 32,
		param = {},
		filter_type = {
			{
				filter_name = 0
			}
		},
		open_day = {},
		open_time = {},
		drop = {
			{
				10214,
				1
			}
		}
	},
	[1005] = {
		name = "凤凰神殿",
		gain_ico = 10,
		type = 1,
		event = "evt_dungeon_enter",
		max_times = 2,
		reset_time = 2,
		desc = "产出大量的英雄经验，每天有2次挑战机会，不容错失~",
		rank = 15,
		ico = 1005,
		recommend = 0,
		activity = 10,
		max_activity = 20,
		label = 1,
		is_show = 1,
		id = 1005,
		open_lev = 18,
		param = {
			5
		},
		filter_type = {
			{
				filter_name = 2
			}
		},
		open_day = {},
		open_time = {},
		drop = {
			{
				10,
				1
			}
		}
	},
	[1006] = {
		name = "巨龙神殿",
		gain_ico = 1,
		type = 1,
		event = "evt_dungeon_enter",
		max_times = 2,
		reset_time = 2,
		desc = "产出大量的贝里，每天有2次挑战机会，不容错失~",
		rank = 9,
		ico = 1006,
		recommend = 0,
		activity = 10,
		max_activity = 20,
		label = 1,
		is_show = 1,
		id = 1006,
		open_lev = 20,
		param = {
			6
		},
		filter_type = {
			{
				filter_name = 1
			}
		},
		open_day = {},
		open_time = {},
		drop = {
			{
				1,
				1
			}
		}
	},
	[1007] = {
		name = "英雄远征",
		gain_ico = 11,
		type = 1,
		event = "evt_expedition",
		max_times = 1,
		reset_time = 2,
		desc = "想要远征积分吗？那就来远征吧，英雄越多越有优势哦",
		rank = 14,
		ico = 1007,
		recommend = 0,
		activity = 10,
		max_activity = 10,
		label = 1,
		is_show = 1,
		id = 1007,
		open_lev = 26,
		param = {},
		filter_type = {
			{
				filter_name = 1
			}
		},
		open_day = {},
		open_time = {},
		drop = {
			{
				11,
				1
			},
			{
				20071,
				1
			}
		}
	},
	[1008] = {
		name = "深海监狱",
		gain_ico = 2,
		type = 1,
		event = "evt_dungeon_enter",
		max_times = 1,
		reset_time = 2,
		desc = "深海监狱挑战的层数越高，获得的奖励越丰厚；困难塔将在50层后开启",
		rank = 6,
		ico = 1008,
		recommend = 0,
		activity = 10,
		max_activity = 10,
		label = 1,
		is_show = 1,
		id = 1008,
		open_lev = 18,
		param = {
			4
		},
		filter_type = {
			{
				filter_name = 1
			}
		},
		open_day = {},
		open_time = {},
		drop = {
			{
				2,
				1
			},
			{
				10201,
				1
			},
			{
				10,
				1
			}
		}
	},
	[1009] = {
		name = "装备副本",
		gain_ico = 14600,
		type = 1,
		event = "evt_dungeon_pass",
		max_times = 10,
		reset_time = 2,
		desc = "装备是英雄快速提升战力的有效途径，每天记得来挑战哦",
		rank = 7,
		ico = 1009,
		recommend = 0,
		activity = 5,
		max_activity = 50,
		label = 1,
		is_show = 1,
		id = 1009,
		open_lev = 22,
		param = {
			1
		},
		filter_type = {
			{
				filter_name = 0
			}
		},
		open_day = {},
		open_time = {},
		drop = {
			{
				40003,
				1
			},
			{
				40013,
				1
			},
			{
				40023,
				1
			}
		}
	},
	[1010] = {
		name = "段位赛",
		gain_ico = 12,
		type = 1,
		event = "evt_rank_match_fight",
		max_times = 6,
		reset_time = 2,
		desc = "提升实力，和他人对战，争夺荣誉！",
		rank = 10,
		ico = 1010,
		recommend = 0,
		activity = 10,
		max_activity = 60,
		label = 1,
		is_show = 1,
		id = 1010,
		open_lev = 25,
		param = {},
		filter_type = {
			{
				filter_name = 0
			}
		},
		open_day = {},
		open_time = {},
		drop = {
			{
				12,
				1
			},
			{
				2,
				1
			}
		}
	},
	[1011] = {
		name = "天梯对决",
		gain_ico = 14,
		type = 3,
		event = "evt_sky_ladder_fight",
		max_times = 1,
		reset_time = 2,
		desc = "向上攀升，全服玩家汇聚一堂，谁才是最强王者？！每天12:00-13:00、20:30-21:30开启！",
		rank = 17,
		ico = 1011,
		recommend = 0,
		activity = 10,
		max_activity = 10,
		label = 3,
		is_show = 1,
		id = 1011,
		open_lev = 35,
		param = {},
		filter_type = {
			{
				filter_name = 1
			}
		},
		open_day = {
			1,
			2,
			3,
			4,
			5,
			6,
			7
		},
		open_time = {
			{
				{
					12,
					0,
					0
				},
				{
					13,
					0,
					0
				}
			},
			{
				{
					20,
					30,
					0
				},
				{
					21,
					0,
					0
				}
			}
		},
		drop = {
			{
				1,
				1
			}
		}
	},
	[1012] = {
		name = "众神战场",
		gain_ico = 6,
		type = 3,
		event = "evt_zs_war_fight",
		max_times = 1,
		reset_time = 2,
		desc = "天神和恶魔，自古正邪不两立，为各自阵容争夺胜利吧！周一至周六20:00-20:20开放！",
		rank = 8,
		ico = 1012,
		recommend = 0,
		activity = 10,
		max_activity = 10,
		label = 3,
		is_show = 1,
		id = 1012,
		open_lev = 22,
		param = {},
		filter_type = {
			{
				filter_name = 1
			}
		},
		open_day = {
			1,
			2,
			3,
			4,
			5,
			6,
			7
		},
		open_time = {
			{
				{
					20,
					0,
					0
				},
				{
					20,
					30,
					0
				}
			}
		},
		drop = {
			{
				1,
				1
			},
			{
				6,
				1
			},
			{
				20029,
				1
			}
		}
	},
	[1013] = {
		name = "首席争霸",
		gain_ico = 1,
		type = 3,
		event = "evt_chief_war",
		max_times = 1,
		reset_time = 2,
		desc = "谁才是本服实力最强？谁才是主宰王者？每周周日20:00正式开启！",
		rank = 11,
		ico = 1013,
		recommend = 0,
		activity = 10,
		max_activity = 10,
		label = 3,
		is_show = 1,
		id = 1013,
		open_lev = 25,
		param = {},
		filter_type = {
			{
				filter_name = 1
			}
		},
		open_day = {
			7
		},
		open_time = {
			{
				{
					20,
					0,
					0
				},
				{
					20,
					30,
					0
				}
			}
		},
		drop = {
			{
				1,
				1
			},
			{
				20039,
				1
			}
		}
	},
	[1014] = {
		name = "钻石争霸",
		gain_ico = 2,
		type = 3,
		event = "evt_diamond_war",
		max_times = 1,
		reset_time = 2,
		desc = "想要获得大量钻石吗？坚持胜利的场次越多，获得的钻石越多！每周周六19:00正式开启！",
		rank = 12,
		ico = 1014,
		recommend = 0,
		activity = 10,
		max_activity = 10,
		label = 3,
		is_show = 1,
		id = 1014,
		open_lev = 25,
		param = {},
		filter_type = {
			{
				filter_name = 0
			}
		},
		open_day = {
			6
		},
		open_time = {
			{
				{
					19,
					0,
					0
				},
				{
					20,
					0,
					0
				}
			}
		},
		drop = {
			{
				2,
				1
			},
			{
				1,
				1
			}
		}
	},
	[1015] = {
		name = "召唤",
		gain_ico = 13,
		type = 1,
		event = "evt_partner_summon",
		max_times = 5,
		reset_time = 2,
		desc = "每天抽一抽，获得珍稀英雄和大量友好值的快速途径！",
		rank = 3,
		ico = 1015,
		recommend = 1,
		activity = 10,
		max_activity = 50,
		label = 1,
		is_show = 1,
		id = 1015,
		open_lev = 1,
		param = {},
		filter_type = {
			{
				filter_name = 0
			}
		},
		open_day = {},
		open_time = {},
		drop = {
			{
				26063,
				1
			},
			{
				10653,
				1
			}
		}
	},
	[1016] = {
		name = "神技铸造",
		gain_ico = 15041,
		type = 1,
		event = "evt_artifact_summon",
		max_times = 5,
		reset_time = 2,
		desc = "40级英雄开放神技，觉醒后的英雄佩戴神技，提升实力更加强大！",
		rank = 21,
		ico = 1016,
		recommend = 0,
		activity = 10,
		max_activity = 50,
		label = 1,
		is_show = 1,
		id = 1016,
		open_lev = 40,
		param = {},
		filter_type = {
			{
				filter_name = 0
			}
		},
		open_day = {},
		open_time = {},
		drop = {
			{
				15050,
				1
			},
			{
				15041,
				1
			},
			{
				15042,
				1
			}
		}
	},
	[1017] = {
		name = "攻城战",
		gain_ico = 1,
		type = 3,
		event = "evt_attack_city_battle",
		max_times = 1,
		reset_time = 2,
		desc = "联盟作战，共同争夺联盟荣誉，前往争夺城主的荣誉！每周周日19:05-19:50玩法开启！",
		rank = 18,
		ico = 1017,
		recommend = 0,
		activity = 20,
		max_activity = 20,
		label = 3,
		is_show = 1,
		id = 1017,
		open_lev = 28,
		param = {},
		filter_type = {
			{
				filter_name = 1
			}
		},
		open_day = {
			7
		},
		open_time = {
			{
				{
					19,
					5,
					0
				},
				{
					19,
					50,
					0
				}
			}
		},
		drop = {
			{
				1,
				1
			},
			{
				15000,
				1
			}
		}
	},
	[1018] = {
		name = "诸神野怪",
		gain_ico = 15000,
		type = 1,
		event = "evt_combat_start",
		max_times = 10,
		reset_time = 2,
		desc = "诸神大陆，遍布着无数野怪，前往挑战，获得珍稀奖励！",
		rank = 19,
		ico = 1018,
		recommend = 0,
		activity = 3,
		max_activity = 30,
		label = 1,
		is_show = 1,
		id = 1018,
		open_lev = 28,
		param = {},
		filter_type = {
			{
				filter_name = 0
			}
		},
		open_day = {},
		open_time = {},
		drop = {
			{
				20072,
				1
			},
			{
				15000,
				1
			}
		}
	},
	[1019] = {
		name = "联盟战",
		gain_ico = 9,
		type = 3,
		event = "evt_guild_war_battle",
		max_times = 3,
		reset_time = 2,
		desc = "记得每天参与联盟战，这可是获得大量联盟贡献的好地方",
		rank = 13,
		ico = 1019,
		recommend = 0,
		activity = 10,
		max_activity = 30,
		label = 3,
		is_show = 1,
		id = 1019,
		open_lev = 25,
		param = {},
		filter_type = {
			{
				filter_name = 0
			}
		},
		open_day = {
			1,
			2,
			3,
			4,
			5,
			6,
			7
		},
		open_time = {},
		drop = {
			{
				9,
				1
			},
			{
				1,
				1
			}
		}
	},
	[1020] = {
		name = "联盟捐献",
		gain_ico = 9,
		type = 1,
		event = "evt_guild_donate",
		max_times = 3,
		reset_time = 2,
		desc = "为联盟的发展贡献自己的一份力量，联盟的繁荣发展能给自己带来好处！",
		rank = 5,
		ico = 1020,
		recommend = 1,
		activity = 10,
		max_activity = 30,
		label = 1,
		is_show = 1,
		id = 1020,
		open_lev = 17,
		param = {},
		filter_type = {
			{
				filter_name = 0
			}
		},
		open_day = {},
		open_time = {},
		drop = {
			{
				9,
				1
			},
			{
				1,
				1
			}
		}
	},
	[1021] = {
		name = "诸神boss",
		gain_ico = 14705,
		type = 1,
		event = "evt_combat_start",
		max_times = 3,
		reset_time = 2,
		desc = "诸神大陆boss身上可是藏着大量珍宝，强力装备、大量觉醒材料等你来挑战！",
		rank = 20,
		ico = 1018,
		recommend = 0,
		activity = 10,
		max_activity = 30,
		label = 1,
		is_show = 1,
		id = 1021,
		open_lev = 28,
		param = {},
		filter_type = {
			{
				filter_name = 0
			}
		},
		open_day = {},
		open_time = {},
		drop = {
			{
				14705,
				1
			},
			{
				15030,
				1
			}
		}
	},
	[1022] = {
		name = "智慧答题",
		gain_ico = 13,
		type = 3,
		event = "evt_answer",
		max_times = 1,
		reset_time = 2,
		desc = "知识大比拼，通过智慧女神的考验，奖励轻松拿！每天17:00-23:00开启！",
		rank = 22,
		ico = 1011,
		recommend = 0,
		activity = 10,
		max_activity = 10,
		label = 3,
		is_show = 1,
		id = 1022,
		open_lev = 20,
		param = {},
		filter_type = {
			{
				filter_name = 1
			}
		},
		open_day = {
			1,
			2,
			3,
			4,
			5,
			6,
			7
		},
		open_time = {
			{
				{
					17,
					0,
					0
				},
				{
					23,
					0,
					0
				}
			}
		},
		drop = {
			{
				1,
				1
			},
			{
				4,
				1
			},
			{
				13,
				1
			}
		}
	}
}
Config.AgendaData.data_reward_list_length = 4
Config.AgendaData.data_reward_list = {
	[100] = {
		effet_id = 173,
		box_id = 100,
		item_list = {
			{
				1,
				5000
			},
			{
				5,
				30
			}
		}
	},
	[200] = {
		effet_id = 172,
		box_id = 200,
		item_list = {
			{
				1,
				10000
			},
			{
				10200,
				2
			}
		}
	},
	[300] = {
		effet_id = 172,
		box_id = 300,
		item_list = {
			{
				2,
				20
			},
			{
				1,
				15000
			},
			{
				10200,
				3
			},
			{
				10411,
				1
			}
		}
	},
	[400] = {
		effet_id = 174,
		box_id = 400,
		item_list = {
			{
				2,
				40
			},
			{
				1,
				20000
			},
			{
				10201,
				1
			},
			{
				10411,
				1
			}
		}
	}
}
