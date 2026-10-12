Config = Config or {}
Config.RecruitHighData = Config.RecruitHighData or {}
Config.RecruitHighData.data_seerpalace_data_length = 9
Config.RecruitHighData.data_seerpalace_data = {
	[1000] = {
		group_id = 1000,
		name = "水",
		draw_list = {
			1
		},
		item_once = {
			{
				14001,
				1
			}
		},
		exchange_once_gain = {
			{
				24,
				1
			},
			{
				14002,
				30
			},
			{
				39,
				50
			}
		}
	},
	[2000] = {
		group_id = 2000,
		name = "火",
		draw_list = {
			1
		},
		item_once = {
			{
				14001,
				1
			}
		},
		exchange_once_gain = {
			{
				24,
				1
			},
			{
				14002,
				30
			},
			{
				39,
				50
			}
		}
	},
	[3000] = {
		group_id = 3000,
		name = "风",
		draw_list = {
			1
		},
		item_once = {
			{
				14001,
				1
			}
		},
		exchange_once_gain = {
			{
				24,
				1
			},
			{
				14002,
				30
			},
			{
				39,
				50
			}
		}
	},
	[4000] = {
		group_id = 4000,
		name = "光暗",
		draw_list = {
			1
		},
		item_once = {
			{
				14001,
				1
			}
		},
		exchange_once_gain = {
			{
				24,
				1
			},
			{
				14002,
				30
			},
			{
				39,
				50
			}
		}
	},
	[10000] = {
		group_id = 10000,
		name = "水",
		draw_list = {
			1
		},
		item_once = {
			{
				39,
				1000
			}
		},
		exchange_once_gain = {}
	},
	[20000] = {
		group_id = 20000,
		name = "火",
		draw_list = {
			1
		},
		item_once = {
			{
				39,
				1000
			}
		},
		exchange_once_gain = {}
	},
	[30000] = {
		group_id = 30000,
		name = "风",
		draw_list = {
			1
		},
		item_once = {
			{
				39,
				1000
			}
		},
		exchange_once_gain = {}
	},
	[40000] = {
		group_id = 40000,
		name = "光",
		draw_list = {
			1
		},
		item_once = {
			{
				39,
				2000
			}
		},
		exchange_once_gain = {}
	},
	[50000] = {
		group_id = 50000,
		name = "暗",
		draw_list = {
			1
		},
		item_once = {
			{
				39,
				2000
			}
		},
		exchange_once_gain = {}
	}
}

function Config.RecruitHighData.data_seerpalace_data_fun(slot0)
	slot1 = Config.RecruitHighData.data_seerpalace_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitHighData.data_seerpalace_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RecruitHighData.data_seerpalace_const_length = 9
Config.RecruitHighData.data_seerpalace_const = {
	common_limit = {
		val = 20,
		key = "common_limit",
		desc = "开启等级"
	},
	hero_change4 = {
		key = "hero_change4",
		desc = "4星英雄置换消耗",
		val = {
			{
				14002,
				20
			}
		}
	},
	hero_change5 = {
		key = "hero_change5",
		desc = "5星英雄置换消耗",
		val = {
			{
				14002,
				100
			}
		}
	},
	hero_change = {
		key = "hero_change",
		desc = "英雄转换类型",
		val = {
			1,
			2,
			3,
			4,
			5
		}
	},
	game_rule1 = {
		val = 1,
		key = "game_rule1",
		desc = [[
规则说明：
1.每个先知水晶可从对应属性的先知卡牌中召唤1次英雄
2.召唤有概率获得橙色或紫色品质的英雄整卡和碎片
3.每次召唤必定获得1个先知结晶，先知结晶可在先知商店中兑换指定5星英雄　
4.每次先知召唤必定获得50个星命卡牌，消耗一定数量的星命卡牌可以在星象占卜中召唤指定系别的五星随机英雄]]
	},
	game_rule2 = {
		val = 2,
		key = "game_rule2",
		desc = "1.消耗先知精华，可将除光明和黑暗以外阵营的4、5星英雄进行转换\n2.每次只能将英雄转化为同系的其他英雄\n3.新生的英雄将继承原有英雄的所有属性"
	},
	recruit_vip = {
		val = 5,
		key = "recruit_vip",
		desc = "需要VIP5才能"
	},
	nature_score = {
		val = 1000,
		key = "nature_score",
		desc = "水火风所需积分"
	},
	light_dark_score = {
		val = 2000,
		key = "light_dark_score",
		desc = "光暗召唤所需积分"
	}
}

function Config.RecruitHighData.data_seerpalace_const_fun(slot0)
	slot1 = Config.RecruitHighData.data_seerpalace_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitHighData.data_seerpalace_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RecruitHighData.data_seerpalace_award_length = 4
Config.RecruitHighData.data_seerpalace_award = {
	[1000] = {
		[5] = {
			id = 1000,
			star = 5,
			desc = "5星英雄（英雄掉落概率15%）",
			items = {
				{
					24900,
					50,
					1.5
				},
				{
					24901,
					50,
					0.45
				},
				{
					24902,
					50,
					1.5
				},
				{
					24903,
					50,
					0.45
				},
				{
					24904,
					50,
					1.5
				},
				{
					24905,
					50,
					2.03
				},
				{
					24906,
					50,
					2.03
				},
				{
					24907,
					50,
					2.1
				},
				{
					24908,
					50,
					2.1
				},
				{
					24909,
					50,
					0.45
				},
				{
					24910,
					50,
					0.45
				},
				{
					24911,
					50,
					0.45
				}
			}
		},
		[4] = {
			id = 1000,
			star = 4,
			desc = "4星英雄（英雄掉落概率85%）",
			items = {
				{
					24800,
					30,
					17
				},
				{
					24801,
					30,
					17
				},
				{
					24802,
					30,
					17
				},
				{
					24803,
					30,
					17
				},
				{
					24804,
					30,
					17
				}
			}
		}
	},
	[2000] = {
		[5] = {
			id = 2000,
			star = 5,
			desc = "5星英雄（英雄掉落概率15%）",
			items = {
				{
					25900,
					50,
					1.8
				},
				{
					25901,
					50,
					1.5
				},
				{
					25902,
					50,
					3
				},
				{
					25903,
					50,
					0.75
				},
				{
					25904,
					50,
					2.7
				},
				{
					25905,
					50,
					3
				},
				{
					25906,
					50,
					0.38
				},
				{
					25907,
					50,
					0.38
				},
				{
					25908,
					50,
					0.38
				},
				{
					25909,
					50,
					0.38
				},
				{
					25910,
					50,
					0.38
				},
				{
					25911,
					50,
					0.38
				}
			}
		},
		[4] = {
			id = 2000,
			star = 4,
			desc = "4星英雄（英雄掉落概率85%）",
			items = {
				{
					25800,
					30,
					17
				},
				{
					25801,
					30,
					17
				},
				{
					25802,
					30,
					17
				},
				{
					25803,
					30,
					17
				},
				{
					25804,
					30,
					17
				}
			}
		}
	},
	[3000] = {
		[5] = {
			id = 3000,
			star = 5,
			desc = "5星英雄（英雄掉落概率15%）",
			items = {
				{
					26900,
					50,
					2.1
				},
				{
					26901,
					50,
					1.05
				},
				{
					26902,
					50,
					2.4
				},
				{
					26903,
					50,
					2.25
				},
				{
					26904,
					50,
					2.4
				},
				{
					26905,
					50,
					2.1
				},
				{
					26906,
					50,
					0.45
				},
				{
					26907,
					50,
					0.45
				},
				{
					26908,
					50,
					0.45
				},
				{
					26909,
					50,
					0.45
				},
				{
					26910,
					50,
					0.45
				},
				{
					26911,
					50,
					0.45
				}
			}
		},
		[4] = {
			id = 3000,
			star = 4,
			desc = "4星英雄（英雄掉落概率85%）",
			items = {
				{
					26800,
					30,
					17
				},
				{
					26801,
					30,
					17
				},
				{
					26802,
					30,
					17
				},
				{
					26803,
					30,
					17
				},
				{
					26804,
					30,
					17
				}
			}
		}
	},
	[4000] = {
		[5] = {
			id = 4000,
			star = 5,
			desc = "5星英雄（英雄掉落概率7.5%，碎片掉落概率7.5%）",
			items = {
				{
					29405,
					15,
					3.75
				},
				{
					29505,
					15,
					3.75
				},
				{
					27900,
					50,
					0.94
				},
				{
					27901,
					50,
					0.11
				},
				{
					27902,
					50,
					0.19
				},
				{
					27903,
					50,
					0.56
				},
				{
					27904,
					50,
					0.94
				},
				{
					27905,
					50,
					0.56
				},
				{
					27906,
					50,
					0.11
				},
				{
					27907,
					50,
					0.11
				},
				{
					27908,
					50,
					0.11
				},
				{
					27909,
					50,
					0.11
				},
				{
					27910,
					50,
					0.11
				},
				{
					27911,
					50,
					0.11
				},
				{
					27912,
					50,
					0.11
				},
				{
					27913,
					50,
					0.11
				},
				{
					28900,
					50,
					0.94
				},
				{
					28901,
					50,
					0.09
				},
				{
					28902,
					50,
					0.66
				},
				{
					28903,
					50,
					0.09
				},
				{
					28904,
					50,
					0.66
				},
				{
					28905,
					50,
					0.94
				},
				{
					28906,
					50,
					0.09
				},
				{
					28907,
					50,
					0.09
				},
				{
					28908,
					50,
					0.09
				},
				{
					28909,
					50,
					0.09
				},
				{
					28910,
					50,
					0.09
				},
				{
					28911,
					50,
					0.09
				},
				{
					28912,
					50,
					0.09
				},
				{
					28913,
					50,
					0.09
				},
				{
					28914,
					50,
					0.09
				},
				{
					28915,
					50,
					0.09
				},
				{
					28916,
					50,
					0.09
				}
			}
		},
		[4] = {
			id = 4000,
			star = 4,
			desc = "4星英雄（英雄掉落概率45%，碎片掉落概率40%）",
			items = {
				{
					29404,
					15,
					20
				},
				{
					29504,
					15,
					20
				},
				{
					27800,
					30,
					5.63
				},
				{
					27801,
					30,
					5.63
				},
				{
					27802,
					30,
					5.63
				},
				{
					27803,
					30,
					5.63
				},
				{
					28800,
					30,
					5.63
				},
				{
					28801,
					30,
					5.63
				},
				{
					28802,
					30,
					5.63
				},
				{
					28803,
					30,
					5.63
				}
			}
		}
	}
}
