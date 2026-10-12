Config = Config or {}
Config.DaysRankData = Config.DaysRankData or {}
Config.DaysRankData.data_rank_data_const_length = 32
Config.DaysRankData.data_rank_data_const = {
	end_time = {
		key = "end_time",
		desc = "X天结束",
		val = {
			"open_day",
			12,
			86399
		}
	},
	open_time = {
		key = "open_time",
		desc = "开启功能时间",
		val = {
			{
				2022,
				2,
				2
			},
			{
				0,
				0,
				0
			}
		}
	},
	close_shop_time = {
		key = "close_shop_time",
		desc = "关闭图标时间",
		val = {
			"open_day",
			9
		}
	},
	rank_title1 = {
		val = 90006,
		key = "rank_title1",
		desc = "剧情推图称号ID"
	},
	rank_title2 = {
		val = 90702,
		key = "rank_title2",
		desc = "圣器比拼称号ID"
	},
	rank_title3 = {
		val = 90011,
		key = "rank_title3",
		desc = "最强英雄称号ID"
	},
	rank_title4 = {
		val = 90010,
		key = "rank_title4",
		desc = "星命之耀称号ID"
	},
	rank_title5 = {
		val = 90012,
		key = "rank_title5",
		desc = "神界冒险称号ID"
	},
	rank_title6 = {
		val = 90701,
		key = "rank_title6",
		desc = "炫彩宝石称号ID"
	},
	rank_title7 = {
		val = 90707,
		key = "rank_title7",
		desc = "消费排行称号ID"
	},
	dugeon_limit = {
		val = 10420,
		key = "dugeon_limit",
		desc = "推图至哪个关卡才能获得第一名奖励"
	},
	tower_limit = {
		val = 20,
		key = "tower_limit",
		desc = "星命塔需挑战至第X层才能获得第一名奖励"
	},
	arena_limit = {
		val = 900,
		key = "arena_limit",
		desc = "竞技场积分需达到X值以上才能获得第一名奖励"
	},
	team_limit = {
		val = 30000,
		key = "team_limit",
		desc = "阵容总战力达到X值以上才能获得第一名奖励"
	},
	star_limit = {
		val = 5000,
		key = "star_limit",
		desc = "星命总评分达到X值以上才能获得第一名奖励"
	},
	partner_limit = {
		val = 10000,
		key = "partner_limit",
		desc = "英雄单个战力打达到X值以上才能获得第一名奖励"
	},
	advanture_limit = {
		val = 1000,
		key = "advanture_limit",
		desc = "神界探索度达到X值以上才能获得第一名奖励"
	},
	reward_limit = {
		val = 20,
		key = "reward_limit",
		desc = "奖励人数"
	},
	rank_title8 = {
		val = 90701,
		key = "rank_title8",
		desc = "炫彩宝石称号ID"
	},
	rank_title9 = {
		val = 90702,
		key = "rank_title9",
		desc = "圣器比拼称号ID"
	},
	rank_title10 = {
		val = 90703,
		key = "rank_title10",
		desc = "观星大师称号ID"
	},
	rank_title11 = {
		val = 90704,
		key = "rank_title11",
		desc = "无尽试炼称号ID"
	},
	rank_title12 = {
		val = 90705,
		key = "rank_title12",
		desc = "英雄召唤称号ID"
	},
	rank_title13 = {
		val = 90706,
		key = "rank_title13",
		desc = "最强阵容称号ID"
	},
	rank_title14 = {
		val = 90707,
		key = "rank_title14",
		desc = "消费排行称号ID"
	},
	rank_title15 = {
		val = 90706,
		key = "rank_title15",
		desc = "最强阵容称号ID"
	},
	rank_title16 = {
		val = 90008,
		key = "rank_title16",
		desc = "竞技天王称号ID"
	},
	rank_title17 = {
		val = 90007,
		key = "rank_title17",
		desc = "爬塔达人称号ID"
	},
	rank_title18 = {
		val = 90013,
		key = "rank_title18",
		desc = "寻宝专家称号ID"
	},
	rank_title19 = {
		val = 90704,
		key = "rank_title19",
		desc = "无尽试炼称号ID"
	},
	cluster_end_time = {
		key = "cluster_end_time",
		desc = "跨服榜X天结束",
		val = {
			"cluster_day",
			7,
			86399
		}
	},
	cluster_open_time = {
		key = "cluster_open_time",
		desc = "跨服开启功能时间",
		val = {
			{
				2018,
				10,
				26
			},
			{
				0,
				0,
				0
			}
		}
	}
}

function Config.DaysRankData.data_rank_data_const_fun(slot0)
	slot1 = Config.DaysRankData.data_rank_data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DaysRankData.data_rank_data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.DaysRankData.data_rank_data_length = 7
Config.DaysRankData.data_rank_data = {
	{
		{
			low = 1,
			high = 1,
			id = 1,
			rewards = {
				{
					50038,
					1
				},
				{
					59938,
					1
				},
				{
					10408,
					1000
				},
				{
					43,
					100000
				},
				{
					99899,
					1000
				}
			},
			effect_list = {
				50038,
				59938,
				10408,
				43,
				99899
			}
		},
		{
			low = 2,
			high = 2,
			id = 1,
			rewards = {
				{
					10408,
					500
				},
				{
					43,
					50000
				},
				{
					99899,
					500
				},
				{
					3,
					5000
				}
			},
			effect_list = {
				10408,
				43,
				99899
			}
		},
		{
			low = 3,
			high = 3,
			id = 1,
			rewards = {
				{
					10408,
					200
				},
				{
					43,
					10000
				},
				{
					99899,
					100
				},
				{
					3,
					1000
				}
			},
			effect_list = {
				10408,
				43,
				99899
			}
		},
		{
			low = 4,
			high = 5,
			id = 1,
			rewards = {
				{
					43,
					5000
				},
				{
					99899,
					50
				},
				{
					3,
					500
				}
			},
			effect_list = {
				43,
				99899
			}
		},
		{
			low = 6,
			high = 10,
			id = 1,
			rewards = {
				{
					3,
					500
				}
			},
			effect_list = {}
		},
		{
			low = 11,
			high = 20,
			id = 1,
			rewards = {
				{
					3,
					500
				}
			},
			effect_list = {}
		}
	},
	[7] = {
		{
			low = 1,
			high = 1,
			id = 7,
			rewards = {
				{
					50044,
					1
				},
				{
					59944,
					1
				},
				{
					10408,
					1000
				},
				{
					43,
					100000
				},
				{
					99899,
					1000
				}
			},
			effect_list = {
				50044,
				59944,
				10408,
				43,
				99899
			}
		},
		{
			low = 2,
			high = 2,
			id = 7,
			rewards = {
				{
					10408,
					500
				},
				{
					43,
					50000
				},
				{
					99899,
					500
				},
				{
					3,
					5000
				}
			},
			effect_list = {
				10408,
				43,
				99899
			}
		},
		{
			low = 3,
			high = 3,
			id = 7,
			rewards = {
				{
					10408,
					200
				},
				{
					43,
					10000
				},
				{
					99899,
					100
				},
				{
					3,
					1000
				}
			},
			effect_list = {
				10408,
				43,
				99899
			}
		},
		{
			low = 4,
			high = 5,
			id = 7,
			rewards = {
				{
					43,
					5000
				},
				{
					99899,
					50
				},
				{
					3,
					500
				}
			},
			effect_list = {
				43,
				99899
			}
		},
		{
			low = 6,
			high = 10,
			id = 7,
			rewards = {
				{
					3,
					500
				}
			},
			effect_list = {}
		},
		{
			low = 11,
			high = 20,
			id = 7,
			rewards = {
				{
					3,
					500
				}
			},
			effect_list = {}
		}
	},
	[6] = {
		{
			low = 1,
			high = 1,
			id = 6,
			rewards = {
				{
					50043,
					1
				},
				{
					59943,
					1
				},
				{
					10408,
					1000
				},
				{
					43,
					100000
				},
				{
					99899,
					1000
				}
			},
			effect_list = {
				50043,
				59943,
				10408,
				43,
				99899
			}
		},
		{
			low = 2,
			high = 2,
			id = 6,
			rewards = {
				{
					10408,
					500
				},
				{
					43,
					50000
				},
				{
					99899,
					500
				},
				{
					3,
					5000
				}
			},
			effect_list = {
				10408,
				43,
				99899
			}
		},
		{
			low = 3,
			high = 3,
			id = 6,
			rewards = {
				{
					10408,
					200
				},
				{
					43,
					10000
				},
				{
					99899,
					100
				},
				{
					3,
					1000
				}
			},
			effect_list = {
				10408,
				43,
				99899
			}
		},
		{
			low = 4,
			high = 5,
			id = 6,
			rewards = {
				{
					43,
					5000
				},
				{
					99899,
					50
				},
				{
					3,
					500
				}
			},
			effect_list = {
				43,
				99899
			}
		},
		{
			low = 6,
			high = 10,
			id = 6,
			rewards = {
				{
					3,
					500
				}
			},
			effect_list = {}
		},
		{
			low = 11,
			high = 20,
			id = 6,
			rewards = {
				{
					3,
					500
				}
			},
			effect_list = {}
		}
	},
	[5] = {
		{
			low = 1,
			high = 1,
			id = 5,
			rewards = {
				{
					50042,
					1
				},
				{
					59942,
					1
				},
				{
					10408,
					1000
				},
				{
					43,
					100000
				},
				{
					99899,
					1000
				}
			},
			effect_list = {
				50042,
				59942,
				10408,
				43,
				99899
			}
		},
		{
			low = 2,
			high = 2,
			id = 5,
			rewards = {
				{
					10408,
					500
				},
				{
					43,
					50000
				},
				{
					99899,
					500
				},
				{
					3,
					5000
				}
			},
			effect_list = {
				10408,
				43,
				99899
			}
		},
		{
			low = 3,
			high = 3,
			id = 5,
			rewards = {
				{
					10408,
					200
				},
				{
					43,
					10000
				},
				{
					99899,
					100
				},
				{
					3,
					1000
				}
			},
			effect_list = {
				10408,
				43,
				99899
			}
		},
		{
			low = 4,
			high = 5,
			id = 5,
			rewards = {
				{
					43,
					5000
				},
				{
					99899,
					50
				},
				{
					3,
					500
				}
			},
			effect_list = {
				43,
				99899
			}
		},
		{
			low = 6,
			high = 10,
			id = 5,
			rewards = {
				{
					3,
					500
				}
			},
			effect_list = {}
		},
		{
			low = 11,
			high = 20,
			id = 5,
			rewards = {
				{
					3,
					500
				}
			},
			effect_list = {}
		}
	},
	[4] = {
		{
			low = 1,
			high = 1,
			id = 4,
			rewards = {
				{
					50041,
					1
				},
				{
					59941,
					1
				},
				{
					10408,
					1000
				},
				{
					43,
					100000
				},
				{
					99899,
					1000
				}
			},
			effect_list = {
				50041,
				59941,
				10408,
				43,
				99899
			}
		},
		{
			low = 2,
			high = 2,
			id = 4,
			rewards = {
				{
					10408,
					500
				},
				{
					43,
					50000
				},
				{
					99899,
					500
				},
				{
					3,
					5000
				}
			},
			effect_list = {
				10408,
				43,
				99899
			}
		},
		{
			low = 3,
			high = 3,
			id = 4,
			rewards = {
				{
					10408,
					200
				},
				{
					43,
					10000
				},
				{
					99899,
					100
				},
				{
					3,
					1000
				}
			},
			effect_list = {
				10408,
				43,
				99899
			}
		},
		{
			low = 4,
			high = 5,
			id = 4,
			rewards = {
				{
					43,
					5000
				},
				{
					99899,
					50
				},
				{
					3,
					500
				}
			},
			effect_list = {
				43,
				99899
			}
		},
		{
			low = 6,
			high = 10,
			id = 4,
			rewards = {
				{
					3,
					500
				}
			},
			effect_list = {}
		},
		{
			low = 11,
			high = 20,
			id = 4,
			rewards = {
				{
					3,
					500
				}
			},
			effect_list = {}
		}
	},
	[3] = {
		{
			low = 1,
			high = 1,
			id = 3,
			rewards = {
				{
					50040,
					1
				},
				{
					59940,
					1
				},
				{
					10408,
					1000
				},
				{
					43,
					100000
				},
				{
					99899,
					1000
				}
			},
			effect_list = {
				50040,
				59940,
				10408,
				43,
				99899
			}
		},
		{
			low = 2,
			high = 2,
			id = 3,
			rewards = {
				{
					10408,
					500
				},
				{
					43,
					50000
				},
				{
					99899,
					500
				},
				{
					3,
					5000
				}
			},
			effect_list = {
				10408,
				43,
				99899
			}
		},
		{
			low = 3,
			high = 3,
			id = 3,
			rewards = {
				{
					10408,
					200
				},
				{
					43,
					10000
				},
				{
					99899,
					100
				},
				{
					3,
					1000
				}
			},
			effect_list = {
				10408,
				43,
				99899
			}
		},
		{
			low = 4,
			high = 5,
			id = 3,
			rewards = {
				{
					43,
					5000
				},
				{
					99899,
					50
				},
				{
					3,
					500
				}
			},
			effect_list = {
				43,
				99899
			}
		},
		{
			low = 6,
			high = 10,
			id = 3,
			rewards = {
				{
					3,
					500
				}
			},
			effect_list = {}
		},
		{
			low = 11,
			high = 20,
			id = 3,
			rewards = {
				{
					3,
					500
				}
			},
			effect_list = {}
		}
	},
	[2] = {
		{
			low = 1,
			high = 1,
			id = 2,
			rewards = {
				{
					50039,
					1
				},
				{
					59939,
					1
				},
				{
					10408,
					1000
				},
				{
					43,
					100000
				},
				{
					99899,
					1000
				}
			},
			effect_list = {
				50039,
				59939,
				10408,
				43,
				99899
			}
		},
		{
			low = 2,
			high = 2,
			id = 2,
			rewards = {
				{
					10408,
					500
				},
				{
					43,
					50000
				},
				{
					99899,
					500
				},
				{
					3,
					5000
				}
			},
			effect_list = {
				10408,
				43,
				99899
			}
		},
		{
			low = 3,
			high = 3,
			id = 2,
			rewards = {
				{
					10408,
					200
				},
				{
					43,
					10000
				},
				{
					99899,
					100
				},
				{
					3,
					1000
				}
			},
			effect_list = {
				10408,
				43,
				99899
			}
		},
		{
			low = 4,
			high = 5,
			id = 2,
			rewards = {
				{
					43,
					5000
				},
				{
					99899,
					50
				},
				{
					3,
					500
				}
			},
			effect_list = {
				43,
				99899
			}
		},
		{
			low = 6,
			high = 10,
			id = 2,
			rewards = {
				{
					3,
					500
				}
			},
			effect_list = {}
		},
		{
			low = 11,
			high = 20,
			id = 2,
			rewards = {
				{
					3,
					500
				}
			},
			effect_list = {}
		}
	}
}
Config.DaysRankData.data_rank_list_length = 7
Config.DaysRankData.data_rank_list = {
	{
		{
			jump = 9,
			name = "剧情冲刺",
			id = 1,
			tips_rule = "活动期间，根据冒险家<div fontcolor=#3dbf5f>剧情副本</div>通关进度进行排名，通关数量越多，排名越高",
			rank_type = 9,
			tips_str = "1、根据冒险家剧情副本通关进度进行排名，通关数量越多，排名越高\n2、若通关进度相同的情况下，先达到关卡的玩家排名较高\n3、快速提升队伍战力，可以通关更多关卡",
			ico = 9,
			evt_type = "evt_dun_chapter",
			extend = {}
		}
	},
	{
		{
			jump = 10,
			name = "爬塔达人",
			id = 2,
			tips_rule = "活动期间，根据冒险家<div fontcolor=#3dbf5f>星命塔</div>通关层数进行排名，通关层数越高，排名越高",
			rank_type = 10,
			tips_str = "1、根据冒险家通关海底监狱层数排名，通关层数越高，排名越高\n2、若通关层数相同的情况下，先通关该层的冒险家排名较高\n3、通过提升阵容战力、针对当前星命塔战斗作出上阵安排或者阵法调整可以更容易通关更高层数",
			ico = 10,
			evt_type = "evt_tower",
			extend = {}
		}
	},
	{
		{
			jump = 28,
			name = "寻宝专家",
			id = 3,
			tips_rule = "活动期间，根据冒险家<div fontcolor=#3dbf5f>寻宝</div>次数进行排名，寻宝次数越多，排名越高",
			rank_type = 28,
			tips_str = "1、根据冒险家参与寻宝的次数进行排名，寻宝次数越多，排名越高\n2、若次数相同的情况下，先达到该次数的冒险家排名较高",
			ico = 22,
			evt_type = "evt_lucky_treasure",
			extend = {}
		}
	},
	{
		{
			jump = 14,
			name = "最强伙伴",
			id = 4,
			tips_rule = "活动期间，根据冒险家<div fontcolor=#3dbf5f>最高战力英雄</div>排名，战力越高，排名越高",
			rank_type = 14,
			tips_str = "1、根据冒险家最高战力英雄排名，英雄战力越高，排名越高\n2、若战力相同的情况下，先到达该战力的英雄排名较高\n3、通过升级突破提升英雄等级、提升装备品质和装备精炼等能够提升英雄战力",
			ico = 14,
			evt_type = "evt_partner",
			extend = {}
		}
	},
	{
		{
			jump = 11,
			name = "武道宗师",
			id = 5,
			tips_rule = "活动期间，根据冒险家<div fontcolor=#3dbf5f>竞技场</div>排名，排名越高奖励越丰富",
			rank_type = 11,
			tips_str = "1、根据冒险家在竞技场中排名，排名越高，奖励越丰富\n2、通过购买次数挑战能够获得更高竞技积分",
			ico = 11,
			evt_type = "evt_arena",
			extend = {}
		}
	},
	{
		{
			jump = 29,
			name = "无尽试炼",
			id = 6,
			tips_rule = "活动期间，根据冒险家<div fontcolor=#3dbf5f>无尽试炼</div>排名决定，排名越高奖励越丰富",
			rank_type = 29,
			tips_str = "1、根据冒险家在武进试炼中排名，排名越高，奖励越丰富\n2、合理搭配阵容能通关更多无尽试炼关卡",
			ico = 18,
			evt_type = "evt_endless",
			extend = {}
		}
	},
	{
		{
			jump = 12,
			name = "超神阵容",
			id = 7,
			tips_rule = "活动期间，根据冒险家<div fontcolor=#3dbf5f>历史上阵最高战力</div>排名，战力越高，排名越高",
			rank_type = 12,
			tips_str = "1、根据冒险家历史上阵最高战力排名，战力越高，排名越高\n2、若上阵总战力相同的情况下，先到达该战力的冒险家排名较高\n3、通过各种玩法获取资源提升阵上英雄战力",
			ico = 12,
			evt_type = "evt_partner",
			extend = {}
		}
	}
}
Config.DaysRankData.data_rank_quest_length = 12
Config.DaysRankData.data_rank_quest = {
	{
		{
			target_desc = "达成:%s/1",
			id = 1001,
			desc = "通关第30关",
			rewards = {
				{
					10008,
					2
				},
				{
					10102,
					30
				},
				{
					2,
					20000
				}
			},
			effect_list = {}
		},
		{
			target_desc = "达成:%s/1",
			id = 1002,
			desc = "通关第60关",
			rewards = {
				{
					10008,
					4
				},
				{
					10102,
					60
				},
				{
					2,
					40000
				}
			},
			effect_list = {}
		}
	},
	[19] = {
		{
			target_desc = "达成:%s/1",
			id = 12001,
			desc = "无尽试炼通过55关",
			rewards = {
				{
					11,
					500
				},
				{
					10102,
					30
				},
				{
					2,
					20000
				}
			},
			effect_list = {}
		},
		{
			target_desc = "达成:%s/1",
			id = 12002,
			desc = "无尽试炼通过65关",
			rewards = {
				{
					11,
					1000
				},
				{
					10102,
					60
				},
				{
					2,
					40000
				}
			},
			effect_list = {}
		}
	},
	[18] = {
		{
			target_desc = "达成:%s/5次",
			id = 11001,
			desc = "寻宝5次",
			rewards = {
				{
					7,
					300
				},
				{
					10102,
					30
				},
				{
					1,
					4000
				}
			},
			effect_list = {}
		},
		{
			target_desc = "达成:%s/10次",
			id = 11002,
			desc = "寻宝10次",
			rewards = {
				{
					7,
					600
				},
				{
					10102,
					60
				},
				{
					1,
					8000
				}
			},
			effect_list = {}
		}
	},
	[17] = {
		{
			target_desc = "达成:%s/15层",
			id = 10001,
			desc = "星命塔15层",
			rewards = {
				{
					10102,
					100
				},
				{
					10301,
					100
				},
				{
					2,
					20000
				}
			},
			effect_list = {}
		},
		{
			target_desc = "达成:%s/20层",
			id = 10002,
			desc = "星命塔20层",
			rewards = {
				{
					10102,
					200
				},
				{
					10301,
					200
				},
				{
					2,
					40000
				}
			},
			effect_list = {}
		}
	},
	[16] = {
		{
			target_desc = "达成:%s/10次",
			id = 9001,
			desc = "竞技挑战10次",
			rewards = {
				{
					8,
					100
				},
				{
					10102,
					30
				},
				{
					2,
					20000
				}
			},
			effect_list = {}
		},
		{
			target_desc = "达成:%s/15次",
			id = 9002,
			desc = "竞技挑战15次",
			rewards = {
				{
					8,
					200
				},
				{
					10102,
					60
				},
				{
					2,
					40000
				}
			},
			effect_list = {}
		}
	},
	[15] = {
		{
			target_desc = "达成:%s/1",
			id = 8001,
			desc = "总战力20W",
			rewards = {
				{
					11,
					500
				},
				{
					10102,
					30
				},
				{
					2,
					20000
				}
			},
			effect_list = {}
		},
		{
			target_desc = "达成:%s/1",
			id = 8002,
			desc = "总战力25W",
			rewards = {
				{
					11,
					1000
				},
				{
					10102,
					60
				},
				{
					2,
					40000
				}
			},
			effect_list = {}
		}
	},
	[7] = {
		{
			target_desc = "达成:%s/100",
			id = 7001,
			desc = "消费100蓝钻",
			rewards = {
				{
					7,
					300
				},
				{
					10102,
					30
				},
				{
					1,
					4000
				}
			},
			effect_list = {}
		},
		{
			target_desc = "达成:%s/300",
			id = 7002,
			desc = "消费300蓝钻",
			rewards = {
				{
					7,
					600
				},
				{
					10102,
					60
				},
				{
					1,
					8000
				}
			},
			effect_list = {}
		}
	},
	[6] = {
		{
			target_desc = "达成:%s/30",
			id = 6001,
			desc = "宝石总等级达到30",
			rewards = {
				{
					70003,
					10
				},
				{
					10102,
					30
				},
				{
					1,
					4000
				}
			},
			effect_list = {}
		},
		{
			target_desc = "达成:%s/40",
			id = 6002,
			desc = "宝石总等级达到40",
			rewards = {
				{
					70003,
					15
				},
				{
					10102,
					60
				},
				{
					1,
					8000
				}
			},
			effect_list = {}
		}
	},
	[5] = {
		{
			target_desc = "达成:%s/10个",
			id = 5001,
			desc = "探索10个格子",
			rewards = {
				{
					7,
					300
				},
				{
					10102,
					30
				},
				{
					1,
					4000
				}
			},
			effect_list = {}
		},
		{
			target_desc = "达成:%s/20个",
			id = 5002,
			desc = "探索20个格子",
			rewards = {
				{
					7,
					600
				},
				{
					10102,
					60
				},
				{
					1,
					8000
				}
			},
			effect_list = {}
		}
	},
	[4] = {
		{
			target_desc = "达成:%s/1",
			id = 4001,
			desc = "星命达到5级",
			rewards = {
				{
					10102,
					250
				},
				{
					10301,
					100
				},
				{
					2,
					20000
				}
			},
			effect_list = {}
		},
		{
			target_desc = "达成:%s/1",
			id = 4002,
			desc = "星命达到10级",
			rewards = {
				{
					10102,
					500
				},
				{
					10301,
					200
				},
				{
					2,
					40000
				}
			},
			effect_list = {}
		}
	},
	[3] = {
		{
			target_desc = "达成:%s/1个",
			id = 3001,
			desc = "1个英雄+4",
			rewards = {
				{
					11,
					500
				},
				{
					10102,
					30
				},
				{
					2,
					20000
				}
			},
			effect_list = {}
		},
		{
			target_desc = "达成:%s/5个",
			id = 3002,
			desc = "5个英雄+4",
			rewards = {
				{
					11,
					1000
				},
				{
					10102,
					60
				},
				{
					2,
					40000
				}
			},
			effect_list = {}
		}
	},
	[2] = {
		{
			target_desc = "达成:%s/30",
			id = 2001,
			desc = "消耗30圣器精华",
			rewards = {
				{
					72001,
					5
				},
				{
					11,
					100
				},
				{
					2,
					20000
				}
			},
			effect_list = {}
		},
		{
			target_desc = "达成:%s/60",
			id = 2002,
			desc = "消耗60圣器精华",
			rewards = {
				{
					72001,
					10
				},
				{
					11,
					200
				},
				{
					2,
					40000
				}
			},
			effect_list = {}
		}
	}
}
Config.DaysRankData.data_rank_quest_id_length = 24
Config.DaysRankData.data_rank_quest_id = {
	[1001] = {
		target_desc = "达成:%s/1",
		id = 1001,
		desc = "通关第30关",
		progress = {
			{
				cli_label = "evt_dungeon_pass",
				target = 10300,
				target_val = 1,
				param = {
					"chapter"
				}
			}
		},
		rewards = {
			{
				10008,
				2
			},
			{
				10102,
				30
			},
			{
				2,
				20000
			}
		},
		effect_list = {}
	},
	[1002] = {
		target_desc = "达成:%s/1",
		id = 1002,
		desc = "通关第60关",
		progress = {
			{
				cli_label = "evt_dungeon_pass",
				target = 20180,
				target_val = 1,
				param = {
					"chapter"
				}
			}
		},
		rewards = {
			{
				10008,
				4
			},
			{
				10102,
				60
			},
			{
				2,
				40000
			}
		},
		effect_list = {}
	},
	[2001] = {
		target_desc = "达成:%s/30",
		id = 2001,
		desc = "消耗30圣器精华",
		progress = {
			{
				cli_label = "evt_loss_hallows_essence",
				target = 0,
				target_val = 30,
				param = {}
			}
		},
		rewards = {
			{
				72001,
				5
			},
			{
				11,
				100
			},
			{
				2,
				20000
			}
		},
		effect_list = {}
	},
	[2002] = {
		target_desc = "达成:%s/60",
		id = 2002,
		desc = "消耗60圣器精华",
		progress = {
			{
				cli_label = "evt_loss_hallows_essence",
				target = 0,
				target_val = 60,
				param = {}
			}
		},
		rewards = {
			{
				72001,
				10
			},
			{
				11,
				200
			},
			{
				2,
				40000
			}
		},
		effect_list = {}
	},
	[3001] = {
		target_desc = "达成:%s/1个",
		id = 3001,
		desc = "1个英雄+4",
		progress = {
			{
				cli_label = "evt_partner",
				target = 0,
				target_val = 1,
				param = {
					{
						"break_lev",
						4
					}
				}
			}
		},
		rewards = {
			{
				11,
				500
			},
			{
				10102,
				30
			},
			{
				2,
				20000
			}
		},
		effect_list = {}
	},
	[3002] = {
		target_desc = "达成:%s/5个",
		id = 3002,
		desc = "5个英雄+4",
		progress = {
			{
				cli_label = "evt_partner",
				target = 0,
				target_val = 5,
				param = {
					{
						"break_lev",
						4
					}
				}
			}
		},
		rewards = {
			{
				11,
				1000
			},
			{
				10102,
				60
			},
			{
				2,
				40000
			}
		},
		effect_list = {}
	},
	[4001] = {
		target_desc = "达成:%s/1",
		id = 4001,
		desc = "星命达到5级",
		progress = {
			{
				cli_label = "evt_star_natal_level_up",
				target = 0,
				target_val = 1,
				param = {
					{
						"lev",
						5
					}
				}
			}
		},
		rewards = {
			{
				10102,
				250
			},
			{
				10301,
				100
			},
			{
				2,
				20000
			}
		},
		effect_list = {}
	},
	[4002] = {
		target_desc = "达成:%s/1",
		id = 4002,
		desc = "星命达到10级",
		progress = {
			{
				cli_label = "evt_star_natal_level_up",
				target = 0,
				target_val = 1,
				param = {
					{
						"lev",
						10
					}
				}
			}
		},
		rewards = {
			{
				10102,
				500
			},
			{
				10301,
				200
			},
			{
				2,
				40000
			}
		},
		effect_list = {}
	},
	[5001] = {
		target_desc = "达成:%s/10个",
		id = 5001,
		desc = "探索10个格子",
		progress = {
			{
				cli_label = "evt_adventure_explore",
				target = 0,
				target_val = 10,
				param = {}
			}
		},
		rewards = {
			{
				7,
				300
			},
			{
				10102,
				30
			},
			{
				1,
				4000
			}
		},
		effect_list = {}
	},
	[5002] = {
		target_desc = "达成:%s/20个",
		id = 5002,
		desc = "探索20个格子",
		progress = {
			{
				cli_label = "evt_adventure_explore",
				target = 0,
				target_val = 20,
				param = {}
			}
		},
		rewards = {
			{
				7,
				600
			},
			{
				10102,
				60
			},
			{
				1,
				8000
			}
		},
		effect_list = {}
	},
	[6001] = {
		target_desc = "达成:%s/30",
		id = 6001,
		desc = "宝石总等级达到30",
		progress = {
			{
				cli_label = "evt_stone_all_lv",
				target = 0,
				target_val = 30,
				param = {}
			}
		},
		rewards = {
			{
				70003,
				10
			},
			{
				10102,
				30
			},
			{
				1,
				4000
			}
		},
		effect_list = {}
	},
	[6002] = {
		target_desc = "达成:%s/40",
		id = 6002,
		desc = "宝石总等级达到40",
		progress = {
			{
				cli_label = "evt_stone_all_lv",
				target = 0,
				target_val = 40,
				param = {}
			}
		},
		rewards = {
			{
				70003,
				15
			},
			{
				10102,
				60
			},
			{
				1,
				8000
			}
		},
		effect_list = {}
	},
	[7001] = {
		target_desc = "达成:%s/100",
		id = 7001,
		desc = "消费100蓝钻",
		progress = {
			{
				cli_label = "evt_loss_gold",
				target = 0,
				target_val = 100,
				param = {}
			}
		},
		rewards = {
			{
				7,
				300
			},
			{
				10102,
				30
			},
			{
				1,
				4000
			}
		},
		effect_list = {}
	},
	[7002] = {
		target_desc = "达成:%s/300",
		id = 7002,
		desc = "消费300蓝钻",
		progress = {
			{
				cli_label = "evt_loss_gold",
				target = 0,
				target_val = 300,
				param = {}
			}
		},
		rewards = {
			{
				7,
				600
			},
			{
				10102,
				60
			},
			{
				1,
				8000
			}
		},
		effect_list = {}
	},
	[8001] = {
		target_desc = "达成:%s/1",
		id = 8001,
		desc = "总战力20W",
		progress = {
			{
				cli_label = "evt_power",
				target = 200000,
				target_val = 1,
				param = {
					"no_show"
				}
			}
		},
		rewards = {
			{
				11,
				500
			},
			{
				10102,
				30
			},
			{
				2,
				20000
			}
		},
		effect_list = {}
	},
	[8002] = {
		target_desc = "达成:%s/1",
		id = 8002,
		desc = "总战力25W",
		progress = {
			{
				cli_label = "evt_power",
				target = 250000,
				target_val = 1,
				param = {
					"no_show"
				}
			}
		},
		rewards = {
			{
				11,
				1000
			},
			{
				10102,
				60
			},
			{
				2,
				40000
			}
		},
		effect_list = {}
	},
	[9001] = {
		target_desc = "达成:%s/10次",
		id = 9001,
		desc = "竞技挑战10次",
		progress = {
			{
				cli_label = "evt_arena_fight",
				target = 0,
				target_val = 10,
				param = {}
			}
		},
		rewards = {
			{
				8,
				100
			},
			{
				10102,
				30
			},
			{
				2,
				20000
			}
		},
		effect_list = {}
	},
	[9002] = {
		target_desc = "达成:%s/15次",
		id = 9002,
		desc = "竞技挑战15次",
		progress = {
			{
				cli_label = "evt_arena_fight",
				target = 0,
				target_val = 15,
				param = {}
			}
		},
		rewards = {
			{
				8,
				200
			},
			{
				10102,
				60
			},
			{
				2,
				40000
			}
		},
		effect_list = {}
	},
	[10001] = {
		target_desc = "达成:%s/15层",
		id = 10001,
		desc = "星命塔15层",
		progress = {
			{
				cli_label = "evt_star_tower_floor_pass",
				target = 0,
				target_val = 15,
				param = {}
			}
		},
		rewards = {
			{
				10102,
				100
			},
			{
				10301,
				100
			},
			{
				2,
				20000
			}
		},
		effect_list = {}
	},
	[10002] = {
		target_desc = "达成:%s/20层",
		id = 10002,
		desc = "星命塔20层",
		progress = {
			{
				cli_label = "evt_star_tower_floor_pass",
				target = 0,
				target_val = 20,
				param = {}
			}
		},
		rewards = {
			{
				10102,
				200
			},
			{
				10301,
				200
			},
			{
				2,
				40000
			}
		},
		effect_list = {}
	},
	[11001] = {
		target_desc = "达成:%s/5次",
		id = 11001,
		desc = "寻宝5次",
		progress = {
			{
				cli_label = "evt_dial",
				target = 0,
				target_val = 5,
				param = {}
			}
		},
		rewards = {
			{
				7,
				300
			},
			{
				10102,
				30
			},
			{
				1,
				4000
			}
		},
		effect_list = {}
	},
	[11002] = {
		target_desc = "达成:%s/10次",
		id = 11002,
		desc = "寻宝10次",
		progress = {
			{
				cli_label = "evt_dial",
				target = 0,
				target_val = 10,
				param = {}
			}
		},
		rewards = {
			{
				7,
				600
			},
			{
				10102,
				60
			},
			{
				1,
				8000
			}
		},
		effect_list = {}
	},
	[12001] = {
		target_desc = "达成:%s/1",
		id = 12001,
		desc = "无尽试炼通过55关",
		progress = {
			{
				cli_label = "evt_endless_pass",
				target = 55,
				target_val = 1,
				param = {}
			}
		},
		rewards = {
			{
				11,
				500
			},
			{
				10102,
				30
			},
			{
				2,
				20000
			}
		},
		effect_list = {}
	},
	[12002] = {
		target_desc = "达成:%s/1",
		id = 12002,
		desc = "无尽试炼通过65关",
		progress = {
			{
				cli_label = "evt_endless_pass",
				target = 65,
				target_val = 1,
				param = {}
			}
		},
		rewards = {
			{
				11,
				1000
			},
			{
				10102,
				60
			},
			{
				2,
				40000
			}
		},
		effect_list = {}
	}
}

function Config.DaysRankData.data_rank_quest_id_fun(slot0)
	slot1 = Config.DaysRankData.data_rank_quest_id[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DaysRankData.data_rank_quest_id[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
