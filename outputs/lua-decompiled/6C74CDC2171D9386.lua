Config = Config or {}
Config.DungeonStoneData = Config.DungeonStoneData or {}
Config.DungeonStoneData.data_const_length = 4
Config.DungeonStoneData.data_const = {
	hook_cost = {
		val = 30,
		desc = "扫荡消耗钻石"
	},
	free_num = {
		val = 2,
		desc = "每天免费次数"
	},
	desc_rule = {
		val = 1,
		desc = "1、每个副本每天有2次免费挑战次数\n2、提升vip可购买额外次数"
	},
	dungeon_type = {
		desc = "副本类型常量（增加副本类型在这里相应增加）",
		val = {
			1,
			4,
			2,
			3,
			5
		}
	}
}

function Config.DungeonStoneData.data_const_fun(slot0)
	slot1 = Config.DungeonStoneData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DungeonStoneData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.DungeonStoneData.data_award_list_length = 5
Config.DungeonStoneData.data_award_list = {
	{
		[101] = {
			dun_type = 1,
			name = "金币副本",
			title_name = "简单",
			class_type = 1,
			pis_str = "activity_21",
			power = 1000,
			lev_limit = 1,
			id = 101,
			unit_id = 86001,
			difficulty = 1,
			pre_id = 0,
			first_items = {},
			show_items = {
				{
					1,
					100000
				},
				{
					10001,
					10
				}
			}
		},
		[102] = {
			dun_type = 1,
			name = "金币副本",
			title_name = "普通",
			class_type = 1,
			pis_str = "activity_22",
			power = 40000,
			lev_limit = 1,
			id = 102,
			unit_id = 86002,
			difficulty = 2,
			pre_id = 101,
			first_items = {},
			show_items = {
				{
					1,
					150000
				},
				{
					10001,
					20
				}
			}
		},
		[103] = {
			dun_type = 1,
			name = "金币副本",
			title_name = "困难",
			class_type = 1,
			pis_str = "activity_23",
			power = 70000,
			lev_limit = 1,
			id = 103,
			unit_id = 86003,
			difficulty = 3,
			pre_id = 102,
			first_items = {},
			show_items = {
				{
					1,
					200000
				},
				{
					10001,
					30
				}
			}
		},
		[104] = {
			dun_type = 1,
			name = "金币副本",
			title_name = "噩梦1",
			class_type = 1,
			pis_str = "activity_23",
			power = 110000,
			lev_limit = 1,
			id = 104,
			unit_id = 86004,
			difficulty = 4,
			pre_id = 103,
			first_items = {},
			show_items = {
				{
					1,
					250000
				},
				{
					10001,
					40
				}
			}
		},
		[105] = {
			dun_type = 1,
			name = "金币副本",
			title_name = "噩梦2",
			class_type = 1,
			pis_str = "activity_23",
			power = 170000,
			lev_limit = 1,
			id = 105,
			unit_id = 86005,
			difficulty = 5,
			pre_id = 104,
			first_items = {},
			show_items = {
				{
					1,
					300000
				},
				{
					10001,
					50
				}
			}
		},
		[106] = {
			dun_type = 1,
			name = "金币副本",
			title_name = "地狱1",
			class_type = 1,
			pis_str = "activity_24",
			power = 280000,
			lev_limit = 1,
			id = 106,
			unit_id = 86006,
			difficulty = 6,
			pre_id = 105,
			first_items = {},
			show_items = {
				{
					1,
					350000
				},
				{
					10001,
					60
				}
			}
		},
		[107] = {
			dun_type = 1,
			name = "金币副本",
			title_name = "地狱2",
			class_type = 1,
			pis_str = "activity_24",
			power = 430000,
			lev_limit = 1,
			id = 107,
			unit_id = 86007,
			difficulty = 7,
			pre_id = 106,
			first_items = {},
			show_items = {
				{
					1,
					400000
				},
				{
					10001,
					70
				}
			}
		},
		[108] = {
			dun_type = 1,
			name = "金币副本",
			title_name = "深渊1",
			class_type = 1,
			pis_str = "activity_24",
			power = 600000,
			lev_limit = 1,
			id = 108,
			unit_id = 86008,
			difficulty = 8,
			pre_id = 107,
			first_items = {},
			show_items = {
				{
					1,
					450000
				},
				{
					10001,
					80
				}
			}
		},
		[109] = {
			dun_type = 1,
			name = "金币副本",
			title_name = "深渊2",
			class_type = 1,
			pis_str = "activity_24",
			power = 760000,
			lev_limit = 1,
			id = 109,
			unit_id = 86009,
			difficulty = 9,
			pre_id = 108,
			first_items = {},
			show_items = {
				{
					1,
					500000
				},
				{
					10001,
					100
				}
			}
		}
	},
	{
		[301] = {
			dun_type = 2,
			name = "英雄副本",
			title_name = "简单",
			class_type = 2,
			pis_str = "activity_21",
			power = 1000,
			lev_limit = 1,
			id = 301,
			unit_id = 86201,
			difficulty = 1,
			pre_id = 0,
			first_items = {},
			show_items = {
				{
					29903,
					10
				},
				{
					29904,
					2
				}
			}
		},
		[302] = {
			dun_type = 2,
			name = "英雄副本",
			title_name = "普通",
			class_type = 2,
			pis_str = "activity_22",
			power = 60000,
			lev_limit = 1,
			id = 302,
			unit_id = 86202,
			difficulty = 2,
			pre_id = 301,
			first_items = {},
			show_items = {
				{
					29903,
					20
				},
				{
					29904,
					5
				}
			}
		},
		[303] = {
			dun_type = 2,
			name = "英雄副本",
			title_name = "困难",
			class_type = 2,
			pis_str = "activity_23",
			power = 92000,
			lev_limit = 1,
			id = 303,
			unit_id = 86203,
			difficulty = 3,
			pre_id = 302,
			first_items = {},
			show_items = {
				{
					29903,
					20
				},
				{
					29904,
					10
				}
			}
		},
		[304] = {
			dun_type = 2,
			name = "英雄副本",
			title_name = "噩梦1",
			class_type = 2,
			pis_str = "activity_23",
			power = 150000,
			lev_limit = 1,
			id = 304,
			unit_id = 86204,
			difficulty = 4,
			pre_id = 303,
			first_items = {},
			show_items = {
				{
					29903,
					20
				},
				{
					29904,
					15
				}
			}
		},
		[305] = {
			dun_type = 2,
			name = "英雄副本",
			title_name = "噩梦2",
			class_type = 2,
			pis_str = "activity_23",
			power = 190000,
			lev_limit = 1,
			id = 305,
			unit_id = 86205,
			difficulty = 5,
			pre_id = 304,
			first_items = {},
			show_items = {
				{
					29903,
					20
				},
				{
					29904,
					20
				}
			}
		},
		[306] = {
			dun_type = 2,
			name = "英雄副本",
			title_name = "地狱1",
			class_type = 2,
			pis_str = "activity_24",
			power = 340000,
			lev_limit = 1,
			id = 306,
			unit_id = 86206,
			difficulty = 6,
			pre_id = 305,
			first_items = {},
			show_items = {
				{
					29903,
					30
				},
				{
					29904,
					25
				}
			}
		},
		[307] = {
			dun_type = 2,
			name = "英雄副本",
			title_name = "地狱2",
			class_type = 2,
			pis_str = "activity_24",
			power = 500000,
			lev_limit = 1,
			id = 307,
			unit_id = 86207,
			difficulty = 7,
			pre_id = 306,
			first_items = {},
			show_items = {
				{
					29903,
					30
				},
				{
					29904,
					30
				}
			}
		},
		[308] = {
			dun_type = 2,
			name = "英雄副本",
			title_name = "深渊1",
			class_type = 2,
			pis_str = "activity_24",
			power = 760000,
			lev_limit = 1,
			id = 308,
			unit_id = 86208,
			difficulty = 8,
			pre_id = 307,
			first_items = {},
			show_items = {
				{
					29904,
					30
				},
				{
					29905,
					1
				}
			}
		},
		[309] = {
			dun_type = 2,
			name = "英雄副本",
			title_name = "深渊2",
			class_type = 2,
			pis_str = "activity_24",
			power = 950000,
			lev_limit = 1,
			id = 309,
			unit_id = 86209,
			difficulty = 9,
			pre_id = 308,
			first_items = {},
			show_items = {
				{
					29904,
					30
				},
				{
					29905,
					2
				}
			}
		}
	},
	{
		[401] = {
			dun_type = 3,
			name = "神器副本",
			title_name = "简单",
			class_type = 3,
			pis_str = "activity_21",
			power = 1000,
			lev_limit = 1,
			id = 401,
			unit_id = 86301,
			difficulty = 1,
			pre_id = 0,
			first_items = {},
			show_items = {
				{
					72001,
					4
				}
			}
		},
		[402] = {
			dun_type = 3,
			name = "神器副本",
			title_name = "普通",
			class_type = 3,
			pis_str = "activity_22",
			power = 50000,
			lev_limit = 1,
			id = 402,
			unit_id = 86302,
			difficulty = 2,
			pre_id = 401,
			first_items = {},
			show_items = {
				{
					72001,
					6
				}
			}
		},
		[403] = {
			dun_type = 3,
			name = "神器副本",
			title_name = "困难",
			class_type = 3,
			pis_str = "activity_23",
			power = 90000,
			lev_limit = 1,
			id = 403,
			unit_id = 86303,
			difficulty = 3,
			pre_id = 402,
			first_items = {},
			show_items = {
				{
					72001,
					8
				}
			}
		},
		[404] = {
			dun_type = 3,
			name = "神器副本",
			title_name = "噩梦1",
			class_type = 3,
			pis_str = "activity_23",
			power = 155000,
			lev_limit = 1,
			id = 404,
			unit_id = 86304,
			difficulty = 4,
			pre_id = 403,
			first_items = {},
			show_items = {
				{
					72001,
					10
				}
			}
		},
		[405] = {
			dun_type = 3,
			name = "神器副本",
			title_name = "噩梦2",
			class_type = 3,
			pis_str = "activity_23",
			power = 186000,
			lev_limit = 1,
			id = 405,
			unit_id = 86305,
			difficulty = 5,
			pre_id = 404,
			first_items = {},
			show_items = {
				{
					72001,
					12
				}
			}
		},
		[406] = {
			dun_type = 3,
			name = "神器副本",
			title_name = "地狱1",
			class_type = 3,
			pis_str = "activity_24",
			power = 315000,
			lev_limit = 1,
			id = 406,
			unit_id = 86306,
			difficulty = 6,
			pre_id = 405,
			first_items = {},
			show_items = {
				{
					72001,
					14
				}
			}
		},
		[407] = {
			dun_type = 3,
			name = "神器副本",
			title_name = "地狱2",
			class_type = 3,
			pis_str = "activity_24",
			power = 465000,
			lev_limit = 1,
			id = 407,
			unit_id = 86307,
			difficulty = 7,
			pre_id = 406,
			first_items = {},
			show_items = {
				{
					72001,
					16
				}
			}
		},
		[408] = {
			dun_type = 3,
			name = "神器副本",
			title_name = "深渊1",
			class_type = 3,
			pis_str = "activity_24",
			power = 720000,
			lev_limit = 1,
			id = 408,
			unit_id = 86308,
			difficulty = 8,
			pre_id = 407,
			first_items = {},
			show_items = {
				{
					72001,
					18
				}
			}
		},
		[409] = {
			dun_type = 3,
			name = "神器副本",
			title_name = "深渊2",
			class_type = 3,
			pis_str = "activity_24",
			power = 880000,
			lev_limit = 1,
			id = 409,
			unit_id = 86309,
			difficulty = 9,
			pre_id = 408,
			first_items = {},
			show_items = {
				{
					72001,
					20
				}
			}
		}
	},
	[4] = {
		[201] = {
			dun_type = 4,
			name = "经验副本",
			title_name = "简单",
			class_type = 4,
			pis_str = "activity_21",
			power = 1000,
			lev_limit = 1,
			id = 201,
			unit_id = 86101,
			difficulty = 1,
			pre_id = 0,
			first_items = {},
			show_items = {
				{
					22,
					50000
				}
			}
		},
		[202] = {
			dun_type = 4,
			name = "经验副本",
			title_name = "普通",
			class_type = 4,
			pis_str = "activity_22",
			power = 46000,
			lev_limit = 1,
			id = 202,
			unit_id = 86102,
			difficulty = 2,
			pre_id = 201,
			first_items = {},
			show_items = {
				{
					22,
					80000
				}
			}
		},
		[203] = {
			dun_type = 4,
			name = "经验副本",
			title_name = "困难",
			class_type = 4,
			pis_str = "activity_23",
			power = 85000,
			lev_limit = 1,
			id = 203,
			unit_id = 86103,
			difficulty = 3,
			pre_id = 202,
			first_items = {},
			show_items = {
				{
					22,
					110000
				}
			}
		},
		[204] = {
			dun_type = 4,
			name = "经验副本",
			title_name = "噩梦1",
			class_type = 4,
			pis_str = "activity_23",
			power = 145000,
			lev_limit = 1,
			id = 204,
			unit_id = 86104,
			difficulty = 4,
			pre_id = 203,
			first_items = {},
			show_items = {
				{
					22,
					140000
				}
			}
		},
		[205] = {
			dun_type = 4,
			name = "经验副本",
			title_name = "噩梦2",
			class_type = 4,
			pis_str = "activity_23",
			power = 180000,
			lev_limit = 1,
			id = 205,
			unit_id = 86105,
			difficulty = 5,
			pre_id = 204,
			first_items = {},
			show_items = {
				{
					22,
					170000
				}
			}
		},
		[206] = {
			dun_type = 4,
			name = "经验副本",
			title_name = "地狱1",
			class_type = 4,
			pis_str = "activity_24",
			power = 300000,
			lev_limit = 1,
			id = 206,
			unit_id = 86106,
			difficulty = 6,
			pre_id = 205,
			first_items = {},
			show_items = {
				{
					22,
					200000
				}
			}
		},
		[207] = {
			dun_type = 4,
			name = "经验副本",
			title_name = "地狱2",
			class_type = 4,
			pis_str = "activity_24",
			power = 450000,
			lev_limit = 1,
			id = 207,
			unit_id = 86107,
			difficulty = 7,
			pre_id = 206,
			first_items = {},
			show_items = {
				{
					22,
					230000
				}
			}
		},
		[208] = {
			dun_type = 4,
			name = "经验副本",
			title_name = "深渊1",
			class_type = 4,
			pis_str = "activity_24",
			power = 680000,
			lev_limit = 1,
			id = 208,
			unit_id = 86108,
			difficulty = 8,
			pre_id = 207,
			first_items = {},
			show_items = {
				{
					22,
					260000
				}
			}
		},
		[209] = {
			dun_type = 4,
			name = "经验副本",
			title_name = "深渊2",
			class_type = 4,
			pis_str = "activity_24",
			power = 830000,
			lev_limit = 1,
			id = 209,
			unit_id = 86109,
			difficulty = 9,
			pre_id = 208,
			first_items = {},
			show_items = {
				{
					22,
					300000
				}
			}
		}
	},
	[5] = {
		[501] = {
			dun_type = 5,
			name = "符文副本",
			title_name = "简单",
			class_type = 5,
			pis_str = "activity_21",
			power = 60000,
			lev_limit = 70,
			id = 501,
			unit_id = 86401,
			difficulty = 1,
			pre_id = 0,
			first_items = {},
			show_items = {
				{
					10450,
					60
				}
			}
		},
		[502] = {
			dun_type = 5,
			name = "符文副本",
			title_name = "普通",
			class_type = 5,
			pis_str = "activity_22",
			power = 90000,
			lev_limit = 75,
			id = 502,
			unit_id = 86402,
			difficulty = 2,
			pre_id = 501,
			first_items = {},
			show_items = {
				{
					10450,
					90
				}
			}
		},
		[503] = {
			dun_type = 5,
			name = "符文副本",
			title_name = "困难",
			class_type = 5,
			pis_str = "activity_23",
			power = 150000,
			lev_limit = 80,
			id = 503,
			unit_id = 86403,
			difficulty = 3,
			pre_id = 502,
			first_items = {},
			show_items = {
				{
					10450,
					120
				}
			}
		},
		[504] = {
			dun_type = 5,
			name = "符文副本",
			title_name = "噩梦1",
			class_type = 5,
			pis_str = "activity_23",
			power = 230000,
			lev_limit = 85,
			id = 504,
			unit_id = 86404,
			difficulty = 4,
			pre_id = 503,
			first_items = {},
			show_items = {
				{
					10450,
					150
				}
			}
		},
		[505] = {
			dun_type = 5,
			name = "符文副本",
			title_name = "噩梦2",
			class_type = 5,
			pis_str = "activity_23",
			power = 320000,
			lev_limit = 90,
			id = 505,
			unit_id = 86405,
			difficulty = 5,
			pre_id = 504,
			first_items = {},
			show_items = {
				{
					10450,
					180
				}
			}
		},
		[506] = {
			dun_type = 5,
			name = "符文副本",
			title_name = "地狱1",
			class_type = 5,
			pis_str = "activity_24",
			power = 500000,
			lev_limit = 95,
			id = 506,
			unit_id = 86406,
			difficulty = 6,
			pre_id = 505,
			first_items = {},
			show_items = {
				{
					10450,
					210
				}
			}
		},
		[507] = {
			dun_type = 5,
			name = "符文副本",
			title_name = "地狱2",
			class_type = 5,
			pis_str = "activity_24",
			power = 760000,
			lev_limit = 100,
			id = 507,
			unit_id = 86407,
			difficulty = 7,
			pre_id = 506,
			first_items = {},
			show_items = {
				{
					10450,
					240
				}
			}
		},
		[508] = {
			dun_type = 5,
			name = "符文副本",
			title_name = "深渊1",
			class_type = 5,
			pis_str = "activity_24",
			power = 1050000,
			lev_limit = 105,
			id = 508,
			unit_id = 86408,
			difficulty = 8,
			pre_id = 507,
			first_items = {},
			show_items = {
				{
					10450,
					270
				}
			}
		},
		[509] = {
			dun_type = 5,
			name = "符文副本",
			title_name = "深渊2",
			class_type = 5,
			pis_str = "activity_24",
			power = 1350000,
			lev_limit = 110,
			id = 509,
			unit_id = 86409,
			difficulty = 9,
			pre_id = 508,
			first_items = {},
			show_items = {
				{
					10450,
					300
				}
			}
		}
	}
}
Config.DungeonStoneData.data_buy_length = 5
Config.DungeonStoneData.data_buy = {
	{
		{
			vip = 0,
			cost = 0
		},
		{
			vip = 0,
			cost = 0
		},
		{
			vip = 1,
			cost = 50
		},
		{
			vip = 3,
			cost = 50
		},
		{
			vip = 5,
			cost = 50
		},
		{
			vip = 7,
			cost = 50
		},
		{
			vip = 9,
			cost = 50
		},
		{
			vip = 11,
			cost = 50
		},
		{
			vip = 13,
			cost = 50
		},
		{
			vip = 14,
			cost = 50
		},
		{
			vip = 15,
			cost = 50
		},
		{
			vip = 16,
			cost = 50
		},
		{
			vip = 17,
			cost = 50
		},
		{
			vip = 18,
			cost = 50
		},
		{
			vip = 19,
			cost = 50
		},
		{
			vip = 20,
			cost = 50
		},
		{
			vip = 21,
			cost = 50
		},
		{
			vip = 22,
			cost = 50
		},
		{
			vip = 23,
			cost = 50
		},
		{
			vip = 24,
			cost = 50
		},
		{
			vip = 25,
			cost = 50
		},
		{
			vip = 26,
			cost = 50
		},
		{
			vip = 27,
			cost = 50
		},
		{
			vip = 28,
			cost = 50
		},
		{
			vip = 29,
			cost = 50
		},
		{
			vip = 30,
			cost = 50
		}
	},
	{
		{
			vip = 0,
			cost = 0
		},
		{
			vip = 0,
			cost = 0
		},
		{
			vip = 1,
			cost = 50
		},
		{
			vip = 3,
			cost = 50
		},
		{
			vip = 5,
			cost = 50
		},
		{
			vip = 7,
			cost = 50
		},
		{
			vip = 9,
			cost = 50
		},
		{
			vip = 11,
			cost = 50
		},
		{
			vip = 13,
			cost = 50
		},
		{
			vip = 14,
			cost = 50
		},
		{
			vip = 15,
			cost = 50
		},
		{
			vip = 16,
			cost = 50
		},
		{
			vip = 17,
			cost = 50
		},
		{
			vip = 18,
			cost = 50
		},
		{
			vip = 19,
			cost = 50
		},
		{
			vip = 20,
			cost = 50
		},
		{
			vip = 21,
			cost = 50
		},
		{
			vip = 22,
			cost = 50
		},
		{
			vip = 23,
			cost = 50
		},
		{
			vip = 24,
			cost = 50
		},
		{
			vip = 25,
			cost = 50
		},
		{
			vip = 26,
			cost = 50
		},
		{
			vip = 27,
			cost = 50
		},
		{
			vip = 28,
			cost = 50
		},
		{
			vip = 29,
			cost = 50
		},
		{
			vip = 30,
			cost = 50
		}
	},
	{
		{
			vip = 0,
			cost = 0
		},
		{
			vip = 0,
			cost = 0
		},
		{
			vip = 1,
			cost = 50
		},
		{
			vip = 3,
			cost = 50
		},
		{
			vip = 5,
			cost = 50
		},
		{
			vip = 7,
			cost = 50
		},
		{
			vip = 9,
			cost = 50
		},
		{
			vip = 11,
			cost = 50
		},
		{
			vip = 13,
			cost = 50
		},
		{
			vip = 14,
			cost = 50
		},
		{
			vip = 15,
			cost = 50
		},
		{
			vip = 16,
			cost = 50
		},
		{
			vip = 17,
			cost = 50
		},
		{
			vip = 18,
			cost = 50
		},
		{
			vip = 19,
			cost = 50
		},
		{
			vip = 20,
			cost = 50
		},
		{
			vip = 21,
			cost = 50
		},
		{
			vip = 22,
			cost = 50
		},
		{
			vip = 23,
			cost = 50
		},
		{
			vip = 24,
			cost = 50
		},
		{
			vip = 25,
			cost = 50
		},
		{
			vip = 26,
			cost = 50
		},
		{
			vip = 27,
			cost = 50
		},
		{
			vip = 28,
			cost = 50
		},
		{
			vip = 29,
			cost = 50
		},
		{
			vip = 30,
			cost = 50
		}
	},
	{
		{
			vip = 0,
			cost = 0
		},
		{
			vip = 0,
			cost = 0
		},
		{
			vip = 1,
			cost = 50
		},
		{
			vip = 3,
			cost = 50
		},
		{
			vip = 5,
			cost = 50
		},
		{
			vip = 7,
			cost = 50
		},
		{
			vip = 9,
			cost = 50
		},
		{
			vip = 11,
			cost = 50
		},
		{
			vip = 13,
			cost = 50
		},
		{
			vip = 14,
			cost = 50
		},
		{
			vip = 15,
			cost = 50
		},
		{
			vip = 16,
			cost = 50
		},
		{
			vip = 17,
			cost = 50
		},
		{
			vip = 18,
			cost = 50
		},
		{
			vip = 19,
			cost = 50
		},
		{
			vip = 20,
			cost = 50
		},
		{
			vip = 21,
			cost = 50
		},
		{
			vip = 22,
			cost = 50
		},
		{
			vip = 23,
			cost = 50
		},
		{
			vip = 24,
			cost = 50
		},
		{
			vip = 25,
			cost = 50
		},
		{
			vip = 26,
			cost = 50
		},
		{
			vip = 27,
			cost = 50
		},
		{
			vip = 28,
			cost = 50
		},
		{
			vip = 29,
			cost = 50
		},
		{
			vip = 30,
			cost = 50
		}
	},
	{
		{
			vip = 0,
			cost = 0
		},
		{
			vip = 0,
			cost = 0
		},
		{
			vip = 1,
			cost = 100
		},
		{
			vip = 3,
			cost = 100
		},
		{
			vip = 5,
			cost = 100
		},
		{
			vip = 7,
			cost = 100
		},
		{
			vip = 9,
			cost = 100
		},
		{
			vip = 11,
			cost = 100
		},
		{
			vip = 13,
			cost = 100
		},
		{
			vip = 14,
			cost = 50
		},
		{
			vip = 15,
			cost = 50
		},
		{
			vip = 16,
			cost = 50
		},
		{
			vip = 17,
			cost = 50
		},
		{
			vip = 18,
			cost = 50
		},
		{
			vip = 19,
			cost = 50
		},
		{
			vip = 20,
			cost = 50
		},
		{
			vip = 21,
			cost = 50
		},
		{
			vip = 22,
			cost = 50
		},
		{
			vip = 23,
			cost = 50
		},
		{
			vip = 24,
			cost = 50
		},
		{
			vip = 25,
			cost = 50
		},
		{
			vip = 26,
			cost = 50
		},
		{
			vip = 27,
			cost = 50
		},
		{
			vip = 28,
			cost = 50
		},
		{
			vip = 29,
			cost = 50
		},
		{
			vip = 30,
			cost = 50
		}
	}
}
Config.DungeonStoneData.data_type_open_length = 5
Config.DungeonStoneData.data_type_open = {
	{
		id = 1,
		name = "金币副本",
		desc = "等级15级开启",
		activate = {
			{
				"lev",
				15
			}
		}
	},
	{
		id = 2,
		name = "英雄副本",
		desc = "等级18级开启",
		activate = {
			{
				"lev",
				18
			}
		}
	},
	{
		id = 3,
		name = "神器副本",
		desc = "等级20级开启",
		activate = {
			{
				"lev",
				20
			}
		}
	},
	[4] = {
		id = 4,
		name = "经验副本",
		desc = "等级17级开启",
		activate = {
			{
				"lev",
				17
			}
		}
	},
	[5] = {
		id = 5,
		name = "符文副本",
		desc = "等级70级开启",
		activate = {
			{
				"lev",
				70
			}
		}
	}
}

function Config.DungeonStoneData.data_type_open_fun(slot0)
	slot1 = Config.DungeonStoneData.data_type_open[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DungeonStoneData.data_type_open[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
