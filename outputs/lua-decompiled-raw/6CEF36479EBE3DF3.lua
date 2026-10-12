Config = Config or {}
Config.PartnerGemstoneData = Config.PartnerGemstoneData or {}
Config.PartnerGemstoneData.data_const_length = 7
Config.PartnerGemstoneData.data_const = {
	num_gem_kind = {
		val = 1,
		desc = "装备同种类宝石镶嵌数量"
	},
	hole_opener = {
		val = 70001,
		desc = "打孔道具ID"
	},
	mosaic_gemstone = {
		desc = "可镶嵌宝石ID",
		val = {
			70101,
			70201,
			70301,
			70401
		}
	},
	source_item = {
		val = 70002,
		desc = "镶嵌前往获取读取的物品ID"
	},
	order_gemstone = {
		desc = "装备宝石图标显示（武器，鞋子，衣服，帽子）",
		val = {
			70301,
			70101,
			70401,
			70201
		}
	},
	gem_fragments = {
		val = 70003,
		desc = "宝石碎片id"
	},
	gem_open_lev = {
		val = 45,
		desc = "宝石开放等级"
	}
}
Config.PartnerGemstoneData.data_upgrade_length = 124
Config.PartnerGemstoneData.data_upgrade = {
	["1_0"] = {
		limit_lev = 0,
		lev = 0,
		expend = 1,
		type = 1,
		icon = 70301,
		attr = {
			{
				"atk",
				0
			}
		},
		add = {}
	},
	["1_1"] = {
		limit_lev = 45,
		lev = 1,
		expend = 2,
		type = 1,
		icon = 70301,
		attr = {
			{
				"atk",
				32
			}
		},
		add = {
			{
				70003,
				1
			}
		}
	},
	["1_2"] = {
		limit_lev = 45,
		lev = 2,
		expend = 3,
		type = 1,
		icon = 70301,
		attr = {
			{
				"atk",
				64
			}
		},
		add = {
			{
				70003,
				3
			}
		}
	},
	["1_3"] = {
		limit_lev = 45,
		lev = 3,
		expend = 4,
		type = 1,
		icon = 70301,
		attr = {
			{
				"atk",
				103
			}
		},
		add = {
			{
				70003,
				6
			}
		}
	},
	["1_4"] = {
		limit_lev = 45,
		lev = 4,
		expend = 5,
		type = 1,
		icon = 70302,
		attr = {
			{
				"atk",
				145
			}
		},
		add = {
			{
				70003,
				10
			}
		}
	},
	["1_5"] = {
		limit_lev = 50,
		lev = 5,
		expend = 6,
		type = 1,
		icon = 70302,
		attr = {
			{
				"atk",
				190
			}
		},
		add = {
			{
				70003,
				15
			}
		}
	},
	["1_6"] = {
		limit_lev = 52,
		lev = 6,
		expend = 7,
		type = 1,
		icon = 70302,
		attr = {
			{
				"atk",
				239
			}
		},
		add = {
			{
				70003,
				21
			}
		}
	},
	["1_7"] = {
		limit_lev = 54,
		lev = 7,
		expend = 8,
		type = 1,
		icon = 70303,
		attr = {
			{
				"atk",
				290
			}
		},
		add = {
			{
				70003,
				28
			}
		}
	},
	["1_8"] = {
		limit_lev = 56,
		lev = 8,
		expend = 9,
		type = 1,
		icon = 70303,
		attr = {
			{
				"atk",
				345
			}
		},
		add = {
			{
				70003,
				36
			}
		}
	},
	["1_9"] = {
		limit_lev = 58,
		lev = 9,
		expend = 10,
		type = 1,
		icon = 70303,
		attr = {
			{
				"atk",
				404
			}
		},
		add = {
			{
				70003,
				45
			}
		}
	},
	["1_10"] = {
		limit_lev = 60,
		lev = 10,
		expend = 12,
		type = 1,
		icon = 70304,
		attr = {
			{
				"atk",
				465
			}
		},
		add = {
			{
				70003,
				55
			}
		}
	},
	["1_11"] = {
		limit_lev = 62,
		lev = 11,
		expend = 14,
		type = 1,
		icon = 70304,
		attr = {
			{
				"atk",
				526
			}
		},
		add = {
			{
				70003,
				67
			}
		}
	},
	["1_12"] = {
		limit_lev = 64,
		lev = 12,
		expend = 16,
		type = 1,
		icon = 70304,
		attr = {
			{
				"atk",
				594
			}
		},
		add = {
			{
				70003,
				81
			}
		}
	},
	["1_13"] = {
		limit_lev = 66,
		lev = 13,
		expend = 18,
		type = 1,
		icon = 70305,
		attr = {
			{
				"atk",
				665
			}
		},
		add = {
			{
				70003,
				97
			}
		}
	},
	["1_14"] = {
		limit_lev = 68,
		lev = 14,
		expend = 20,
		type = 1,
		icon = 70305,
		attr = {
			{
				"atk",
				737
			}
		},
		add = {
			{
				70003,
				115
			}
		}
	},
	["1_15"] = {
		limit_lev = 70,
		lev = 15,
		expend = 22,
		type = 1,
		icon = 70305,
		attr = {
			{
				"atk",
				811
			}
		},
		add = {
			{
				70003,
				135
			}
		}
	},
	["1_16"] = {
		limit_lev = 72,
		lev = 16,
		expend = 24,
		type = 1,
		icon = 70306,
		attr = {
			{
				"atk",
				892
			}
		},
		add = {
			{
				70003,
				157
			}
		}
	},
	["1_17"] = {
		limit_lev = 74,
		lev = 17,
		expend = 26,
		type = 1,
		icon = 70306,
		attr = {
			{
				"atk",
				969
			}
		},
		add = {
			{
				70003,
				181
			}
		}
	},
	["1_18"] = {
		limit_lev = 76,
		lev = 18,
		expend = 28,
		type = 1,
		icon = 70306,
		attr = {
			{
				"atk",
				1053
			}
		},
		add = {
			{
				70003,
				207
			}
		}
	},
	["1_19"] = {
		limit_lev = 78,
		lev = 19,
		expend = 30,
		type = 1,
		icon = 70307,
		attr = {
			{
				"atk",
				1141
			}
		},
		add = {
			{
				70003,
				235
			}
		}
	},
	["1_20"] = {
		limit_lev = 80,
		lev = 20,
		expend = 32,
		type = 1,
		icon = 70307,
		attr = {
			{
				"atk",
				1228
			}
		},
		add = {
			{
				70003,
				265
			}
		}
	},
	["1_21"] = {
		limit_lev = 82,
		lev = 21,
		expend = 34,
		type = 1,
		icon = 70307,
		attr = {
			{
				"atk",
				1318
			}
		},
		add = {
			{
				70003,
				297
			}
		}
	},
	["1_22"] = {
		limit_lev = 84,
		lev = 22,
		expend = 36,
		type = 1,
		icon = 70308,
		attr = {
			{
				"atk",
				1412
			}
		},
		add = {
			{
				70003,
				331
			}
		}
	},
	["1_23"] = {
		limit_lev = 86,
		lev = 23,
		expend = 38,
		type = 1,
		icon = 70308,
		attr = {
			{
				"atk",
				1509
			}
		},
		add = {
			{
				70003,
				367
			}
		}
	},
	["1_24"] = {
		limit_lev = 88,
		lev = 24,
		expend = 40,
		type = 1,
		icon = 70308,
		attr = {
			{
				"atk",
				1609
			}
		},
		add = {
			{
				70003,
				405
			}
		}
	},
	["1_25"] = {
		limit_lev = 90,
		lev = 25,
		expend = 42,
		type = 1,
		icon = 70309,
		attr = {
			{
				"atk",
				1710
			}
		},
		add = {
			{
				70003,
				445
			}
		}
	},
	["1_26"] = {
		limit_lev = 92,
		lev = 26,
		expend = 44,
		type = 1,
		icon = 70309,
		attr = {
			{
				"atk",
				1813
			}
		},
		add = {
			{
				70003,
				487
			}
		}
	},
	["1_27"] = {
		limit_lev = 94,
		lev = 27,
		expend = 46,
		type = 1,
		icon = 70309,
		attr = {
			{
				"atk",
				1920
			}
		},
		add = {
			{
				70003,
				531
			}
		}
	},
	["1_28"] = {
		limit_lev = 96,
		lev = 28,
		expend = 48,
		type = 1,
		icon = 70310,
		attr = {
			{
				"atk",
				2026
			}
		},
		add = {
			{
				70003,
				577
			}
		}
	},
	["1_29"] = {
		limit_lev = 98,
		lev = 29,
		expend = 50,
		type = 1,
		icon = 70310,
		attr = {
			{
				"atk",
				2136
			}
		},
		add = {
			{
				70003,
				625
			}
		}
	},
	["1_30"] = {
		limit_lev = 100,
		lev = 30,
		expend = 0,
		type = 1,
		icon = 70310,
		attr = {
			{
				"atk",
				2250
			}
		},
		add = {
			{
				70003,
				675
			}
		}
	},
	["2_0"] = {
		limit_lev = 0,
		lev = 0,
		expend = 1,
		type = 2,
		icon = 70101,
		attr = {
			{
				"speed",
				0
			}
		},
		add = {}
	},
	["2_1"] = {
		limit_lev = 45,
		lev = 1,
		expend = 2,
		type = 2,
		icon = 70101,
		attr = {
			{
				"speed",
				2
			}
		},
		add = {
			{
				70003,
				1
			}
		}
	},
	["2_2"] = {
		limit_lev = 45,
		lev = 2,
		expend = 3,
		type = 2,
		icon = 70101,
		attr = {
			{
				"speed",
				4
			}
		},
		add = {
			{
				70003,
				3
			}
		}
	},
	["2_3"] = {
		limit_lev = 45,
		lev = 3,
		expend = 4,
		type = 2,
		icon = 70101,
		attr = {
			{
				"speed",
				6
			}
		},
		add = {
			{
				70003,
				6
			}
		}
	},
	["2_4"] = {
		limit_lev = 45,
		lev = 4,
		expend = 5,
		type = 2,
		icon = 70102,
		attr = {
			{
				"speed",
				8
			}
		},
		add = {
			{
				70003,
				10
			}
		}
	},
	["2_5"] = {
		limit_lev = 50,
		lev = 5,
		expend = 6,
		type = 2,
		icon = 70102,
		attr = {
			{
				"speed",
				10
			}
		},
		add = {
			{
				70003,
				15
			}
		}
	},
	["2_6"] = {
		limit_lev = 52,
		lev = 6,
		expend = 7,
		type = 2,
		icon = 70102,
		attr = {
			{
				"speed",
				12
			}
		},
		add = {
			{
				70003,
				21
			}
		}
	},
	["2_7"] = {
		limit_lev = 54,
		lev = 7,
		expend = 8,
		type = 2,
		icon = 70103,
		attr = {
			{
				"speed",
				14
			}
		},
		add = {
			{
				70003,
				28
			}
		}
	},
	["2_8"] = {
		limit_lev = 56,
		lev = 8,
		expend = 9,
		type = 2,
		icon = 70103,
		attr = {
			{
				"speed",
				16
			}
		},
		add = {
			{
				70003,
				36
			}
		}
	},
	["2_9"] = {
		limit_lev = 58,
		lev = 9,
		expend = 10,
		type = 2,
		icon = 70103,
		attr = {
			{
				"speed",
				18
			}
		},
		add = {
			{
				70003,
				45
			}
		}
	},
	["2_10"] = {
		limit_lev = 60,
		lev = 10,
		expend = 12,
		type = 2,
		icon = 70104,
		attr = {
			{
				"speed",
				20
			}
		},
		add = {
			{
				70003,
				55
			}
		}
	},
	["2_11"] = {
		limit_lev = 62,
		lev = 11,
		expend = 14,
		type = 2,
		icon = 70104,
		attr = {
			{
				"speed",
				22
			}
		},
		add = {
			{
				70003,
				67
			}
		}
	},
	["2_12"] = {
		limit_lev = 64,
		lev = 12,
		expend = 16,
		type = 2,
		icon = 70104,
		attr = {
			{
				"speed",
				24
			}
		},
		add = {
			{
				70003,
				81
			}
		}
	},
	["2_13"] = {
		limit_lev = 66,
		lev = 13,
		expend = 18,
		type = 2,
		icon = 70105,
		attr = {
			{
				"speed",
				26
			}
		},
		add = {
			{
				70003,
				97
			}
		}
	},
	["2_14"] = {
		limit_lev = 68,
		lev = 14,
		expend = 20,
		type = 2,
		icon = 70105,
		attr = {
			{
				"speed",
				28
			}
		},
		add = {
			{
				70003,
				115
			}
		}
	},
	["2_15"] = {
		limit_lev = 70,
		lev = 15,
		expend = 22,
		type = 2,
		icon = 70105,
		attr = {
			{
				"speed",
				30
			}
		},
		add = {
			{
				70003,
				135
			}
		}
	},
	["2_16"] = {
		limit_lev = 72,
		lev = 16,
		expend = 24,
		type = 2,
		icon = 70106,
		attr = {
			{
				"speed",
				32
			}
		},
		add = {
			{
				70003,
				157
			}
		}
	},
	["2_17"] = {
		limit_lev = 74,
		lev = 17,
		expend = 26,
		type = 2,
		icon = 70106,
		attr = {
			{
				"speed",
				34
			}
		},
		add = {
			{
				70003,
				181
			}
		}
	},
	["2_18"] = {
		limit_lev = 76,
		lev = 18,
		expend = 28,
		type = 2,
		icon = 70106,
		attr = {
			{
				"speed",
				36
			}
		},
		add = {
			{
				70003,
				207
			}
		}
	},
	["2_19"] = {
		limit_lev = 78,
		lev = 19,
		expend = 30,
		type = 2,
		icon = 70107,
		attr = {
			{
				"speed",
				38
			}
		},
		add = {
			{
				70003,
				235
			}
		}
	},
	["2_20"] = {
		limit_lev = 80,
		lev = 20,
		expend = 32,
		type = 2,
		icon = 70107,
		attr = {
			{
				"speed",
				40
			}
		},
		add = {
			{
				70003,
				265
			}
		}
	},
	["2_21"] = {
		limit_lev = 82,
		lev = 21,
		expend = 34,
		type = 2,
		icon = 70107,
		attr = {
			{
				"speed",
				42
			}
		},
		add = {
			{
				70003,
				297
			}
		}
	},
	["2_22"] = {
		limit_lev = 84,
		lev = 22,
		expend = 36,
		type = 2,
		icon = 70108,
		attr = {
			{
				"speed",
				44
			}
		},
		add = {
			{
				70003,
				331
			}
		}
	},
	["2_23"] = {
		limit_lev = 86,
		lev = 23,
		expend = 38,
		type = 2,
		icon = 70108,
		attr = {
			{
				"speed",
				46
			}
		},
		add = {
			{
				70003,
				367
			}
		}
	},
	["2_24"] = {
		limit_lev = 88,
		lev = 24,
		expend = 40,
		type = 2,
		icon = 70108,
		attr = {
			{
				"speed",
				48
			}
		},
		add = {
			{
				70003,
				405
			}
		}
	},
	["2_25"] = {
		limit_lev = 90,
		lev = 25,
		expend = 42,
		type = 2,
		icon = 70109,
		attr = {
			{
				"speed",
				50
			}
		},
		add = {
			{
				70003,
				445
			}
		}
	},
	["2_26"] = {
		limit_lev = 92,
		lev = 26,
		expend = 44,
		type = 2,
		icon = 70109,
		attr = {
			{
				"speed",
				52
			}
		},
		add = {
			{
				70003,
				487
			}
		}
	},
	["2_27"] = {
		limit_lev = 94,
		lev = 27,
		expend = 46,
		type = 2,
		icon = 70109,
		attr = {
			{
				"speed",
				54
			}
		},
		add = {
			{
				70003,
				531
			}
		}
	},
	["2_28"] = {
		limit_lev = 96,
		lev = 28,
		expend = 48,
		type = 2,
		icon = 70110,
		attr = {
			{
				"speed",
				56
			}
		},
		add = {
			{
				70003,
				577
			}
		}
	},
	["2_29"] = {
		limit_lev = 98,
		lev = 29,
		expend = 50,
		type = 2,
		icon = 70110,
		attr = {
			{
				"speed",
				58
			}
		},
		add = {
			{
				70003,
				625
			}
		}
	},
	["2_30"] = {
		limit_lev = 100,
		lev = 30,
		expend = 0,
		type = 2,
		icon = 70110,
		attr = {
			{
				"speed",
				60
			}
		},
		add = {
			{
				70003,
				675
			}
		}
	},
	["3_0"] = {
		limit_lev = 0,
		lev = 0,
		expend = 1,
		type = 3,
		icon = 70401,
		attr = {
			{
				"def",
				0
			}
		},
		add = {}
	},
	["3_1"] = {
		limit_lev = 45,
		lev = 1,
		expend = 2,
		type = 3,
		icon = 70401,
		attr = {
			{
				"def",
				22
			}
		},
		add = {
			{
				70003,
				1
			}
		}
	},
	["3_2"] = {
		limit_lev = 45,
		lev = 2,
		expend = 3,
		type = 3,
		icon = 70401,
		attr = {
			{
				"def",
				45
			}
		},
		add = {
			{
				70003,
				3
			}
		}
	},
	["3_3"] = {
		limit_lev = 45,
		lev = 3,
		expend = 4,
		type = 3,
		icon = 70401,
		attr = {
			{
				"def",
				72
			}
		},
		add = {
			{
				70003,
				6
			}
		}
	},
	["3_4"] = {
		limit_lev = 45,
		lev = 4,
		expend = 5,
		type = 3,
		icon = 70402,
		attr = {
			{
				"def",
				101
			}
		},
		add = {
			{
				70003,
				10
			}
		}
	},
	["3_5"] = {
		limit_lev = 50,
		lev = 5,
		expend = 6,
		type = 3,
		icon = 70402,
		attr = {
			{
				"def",
				133
			}
		},
		add = {
			{
				70003,
				15
			}
		}
	},
	["3_6"] = {
		limit_lev = 52,
		lev = 6,
		expend = 7,
		type = 3,
		icon = 70402,
		attr = {
			{
				"def",
				167
			}
		},
		add = {
			{
				70003,
				21
			}
		}
	},
	["3_7"] = {
		limit_lev = 54,
		lev = 7,
		expend = 8,
		type = 3,
		icon = 70403,
		attr = {
			{
				"def",
				203
			}
		},
		add = {
			{
				70003,
				28
			}
		}
	},
	["3_8"] = {
		limit_lev = 56,
		lev = 8,
		expend = 9,
		type = 3,
		icon = 70403,
		attr = {
			{
				"def",
				242
			}
		},
		add = {
			{
				70003,
				36
			}
		}
	},
	["3_9"] = {
		limit_lev = 58,
		lev = 9,
		expend = 10,
		type = 3,
		icon = 70403,
		attr = {
			{
				"def",
				282
			}
		},
		add = {
			{
				70003,
				45
			}
		}
	},
	["3_10"] = {
		limit_lev = 60,
		lev = 10,
		expend = 12,
		type = 3,
		icon = 70404,
		attr = {
			{
				"def",
				325
			}
		},
		add = {
			{
				70003,
				55
			}
		}
	},
	["3_11"] = {
		limit_lev = 62,
		lev = 11,
		expend = 14,
		type = 3,
		icon = 70404,
		attr = {
			{
				"def",
				368
			}
		},
		add = {
			{
				70003,
				67
			}
		}
	},
	["3_12"] = {
		limit_lev = 64,
		lev = 12,
		expend = 16,
		type = 3,
		icon = 70404,
		attr = {
			{
				"def",
				416
			}
		},
		add = {
			{
				70003,
				81
			}
		}
	},
	["3_13"] = {
		limit_lev = 66,
		lev = 13,
		expend = 18,
		type = 3,
		icon = 70405,
		attr = {
			{
				"def",
				466
			}
		},
		add = {
			{
				70003,
				97
			}
		}
	},
	["3_14"] = {
		limit_lev = 68,
		lev = 14,
		expend = 20,
		type = 3,
		icon = 70405,
		attr = {
			{
				"def",
				515
			}
		},
		add = {
			{
				70003,
				115
			}
		}
	},
	["3_15"] = {
		limit_lev = 70,
		lev = 15,
		expend = 22,
		type = 3,
		icon = 70405,
		attr = {
			{
				"def",
				567
			}
		},
		add = {
			{
				70003,
				135
			}
		}
	},
	["3_16"] = {
		limit_lev = 72,
		lev = 16,
		expend = 24,
		type = 3,
		icon = 70406,
		attr = {
			{
				"def",
				624
			}
		},
		add = {
			{
				70003,
				157
			}
		}
	},
	["3_17"] = {
		limit_lev = 74,
		lev = 17,
		expend = 26,
		type = 3,
		icon = 70406,
		attr = {
			{
				"def",
				678
			}
		},
		add = {
			{
				70003,
				181
			}
		}
	},
	["3_18"] = {
		limit_lev = 76,
		lev = 18,
		expend = 28,
		type = 3,
		icon = 70406,
		attr = {
			{
				"def",
				737
			}
		},
		add = {
			{
				70003,
				207
			}
		}
	},
	["3_19"] = {
		limit_lev = 78,
		lev = 19,
		expend = 30,
		type = 3,
		icon = 70407,
		attr = {
			{
				"def",
				798
			}
		},
		add = {
			{
				70003,
				235
			}
		}
	},
	["3_20"] = {
		limit_lev = 80,
		lev = 20,
		expend = 32,
		type = 3,
		icon = 70407,
		attr = {
			{
				"def",
				859
			}
		},
		add = {
			{
				70003,
				265
			}
		}
	},
	["3_21"] = {
		limit_lev = 82,
		lev = 21,
		expend = 34,
		type = 3,
		icon = 70407,
		attr = {
			{
				"def",
				923
			}
		},
		add = {
			{
				70003,
				297
			}
		}
	},
	["3_22"] = {
		limit_lev = 84,
		lev = 22,
		expend = 36,
		type = 3,
		icon = 70408,
		attr = {
			{
				"def",
				988
			}
		},
		add = {
			{
				70003,
				331
			}
		}
	},
	["3_23"] = {
		limit_lev = 86,
		lev = 23,
		expend = 38,
		type = 3,
		icon = 70408,
		attr = {
			{
				"def",
				1056
			}
		},
		add = {
			{
				70003,
				367
			}
		}
	},
	["3_24"] = {
		limit_lev = 88,
		lev = 24,
		expend = 40,
		type = 3,
		icon = 70408,
		attr = {
			{
				"def",
				1126
			}
		},
		add = {
			{
				70003,
				405
			}
		}
	},
	["3_25"] = {
		limit_lev = 90,
		lev = 25,
		expend = 42,
		type = 3,
		icon = 70409,
		attr = {
			{
				"def",
				1197
			}
		},
		add = {
			{
				70003,
				445
			}
		}
	},
	["3_26"] = {
		limit_lev = 92,
		lev = 26,
		expend = 44,
		type = 3,
		icon = 70409,
		attr = {
			{
				"def",
				1269
			}
		},
		add = {
			{
				70003,
				487
			}
		}
	},
	["3_27"] = {
		limit_lev = 94,
		lev = 27,
		expend = 46,
		type = 3,
		icon = 70409,
		attr = {
			{
				"def",
				1344
			}
		},
		add = {
			{
				70003,
				531
			}
		}
	},
	["3_28"] = {
		limit_lev = 96,
		lev = 28,
		expend = 48,
		type = 3,
		icon = 70410,
		attr = {
			{
				"def",
				1418
			}
		},
		add = {
			{
				70003,
				577
			}
		}
	},
	["3_29"] = {
		limit_lev = 98,
		lev = 29,
		expend = 50,
		type = 3,
		icon = 70410,
		attr = {
			{
				"def",
				1495
			}
		},
		add = {
			{
				70003,
				625
			}
		}
	},
	["3_30"] = {
		limit_lev = 100,
		lev = 30,
		expend = 0,
		type = 3,
		icon = 70410,
		attr = {
			{
				"def",
				1575
			}
		},
		add = {
			{
				70003,
				675
			}
		}
	},
	["4_0"] = {
		limit_lev = 0,
		lev = 0,
		expend = 1,
		type = 4,
		icon = 70201,
		attr = {
			{
				"hp_max",
				0
			}
		},
		add = {}
	},
	["4_1"] = {
		limit_lev = 45,
		lev = 1,
		expend = 2,
		type = 4,
		icon = 70201,
		attr = {
			{
				"hp_max",
				161
			}
		},
		add = {
			{
				70003,
				1
			}
		}
	},
	["4_2"] = {
		limit_lev = 45,
		lev = 2,
		expend = 3,
		type = 4,
		icon = 70201,
		attr = {
			{
				"hp_max",
				323
			}
		},
		add = {
			{
				70003,
				3
			}
		}
	},
	["4_3"] = {
		limit_lev = 45,
		lev = 3,
		expend = 4,
		type = 4,
		icon = 70201,
		attr = {
			{
				"hp_max",
				517
			}
		},
		add = {
			{
				70003,
				6
			}
		}
	},
	["4_4"] = {
		limit_lev = 45,
		lev = 4,
		expend = 5,
		type = 4,
		icon = 70202,
		attr = {
			{
				"hp_max",
				727
			}
		},
		add = {
			{
				70003,
				10
			}
		}
	},
	["4_5"] = {
		limit_lev = 50,
		lev = 5,
		expend = 6,
		type = 4,
		icon = 70202,
		attr = {
			{
				"hp_max",
				953
			}
		},
		add = {
			{
				70003,
				15
			}
		}
	},
	["4_6"] = {
		limit_lev = 52,
		lev = 6,
		expend = 7,
		type = 4,
		icon = 70202,
		attr = {
			{
				"hp_max",
				1196
			}
		},
		add = {
			{
				70003,
				21
			}
		}
	},
	["4_7"] = {
		limit_lev = 54,
		lev = 7,
		expend = 8,
		type = 4,
		icon = 70203,
		attr = {
			{
				"hp_max",
				1454
			}
		},
		add = {
			{
				70003,
				28
			}
		}
	},
	["4_8"] = {
		limit_lev = 56,
		lev = 8,
		expend = 9,
		type = 4,
		icon = 70203,
		attr = {
			{
				"hp_max",
				1729
			}
		},
		add = {
			{
				70003,
				36
			}
		}
	},
	["4_9"] = {
		limit_lev = 58,
		lev = 9,
		expend = 10,
		type = 4,
		icon = 70203,
		attr = {
			{
				"hp_max",
				2020
			}
		},
		add = {
			{
				70003,
				45
			}
		}
	},
	["4_10"] = {
		limit_lev = 60,
		lev = 10,
		expend = 12,
		type = 4,
		icon = 70204,
		attr = {
			{
				"hp_max",
				2327
			}
		},
		add = {
			{
				70003,
				55
			}
		}
	},
	["4_11"] = {
		limit_lev = 62,
		lev = 11,
		expend = 14,
		type = 4,
		icon = 70204,
		attr = {
			{
				"hp_max",
				2634
			}
		},
		add = {
			{
				70003,
				67
			}
		}
	},
	["4_12"] = {
		limit_lev = 64,
		lev = 12,
		expend = 16,
		type = 4,
		icon = 70204,
		attr = {
			{
				"hp_max",
				2974
			}
		},
		add = {
			{
				70003,
				81
			}
		}
	},
	["4_13"] = {
		limit_lev = 66,
		lev = 13,
		expend = 18,
		type = 4,
		icon = 70205,
		attr = {
			{
				"hp_max",
				3329
			}
		},
		add = {
			{
				70003,
				97
			}
		}
	},
	["4_14"] = {
		limit_lev = 68,
		lev = 14,
		expend = 20,
		type = 4,
		icon = 70205,
		attr = {
			{
				"hp_max",
				3685
			}
		},
		add = {
			{
				70003,
				115
			}
		}
	},
	["4_15"] = {
		limit_lev = 70,
		lev = 15,
		expend = 22,
		type = 4,
		icon = 70205,
		attr = {
			{
				"hp_max",
				4057
			}
		},
		add = {
			{
				70003,
				135
			}
		}
	},
	["4_16"] = {
		limit_lev = 72,
		lev = 16,
		expend = 24,
		type = 4,
		icon = 70206,
		attr = {
			{
				"hp_max",
				4461
			}
		},
		add = {
			{
				70003,
				157
			}
		}
	},
	["4_17"] = {
		limit_lev = 74,
		lev = 17,
		expend = 26,
		type = 4,
		icon = 70206,
		attr = {
			{
				"hp_max",
				4849
			}
		},
		add = {
			{
				70003,
				181
			}
		}
	},
	["4_18"] = {
		limit_lev = 76,
		lev = 18,
		expend = 28,
		type = 4,
		icon = 70206,
		attr = {
			{
				"hp_max",
				5269
			}
		},
		add = {
			{
				70003,
				207
			}
		}
	},
	["4_19"] = {
		limit_lev = 78,
		lev = 19,
		expend = 30,
		type = 4,
		icon = 70207,
		attr = {
			{
				"hp_max",
				5705
			}
		},
		add = {
			{
				70003,
				235
			}
		}
	},
	["4_20"] = {
		limit_lev = 80,
		lev = 20,
		expend = 32,
		type = 4,
		icon = 70207,
		attr = {
			{
				"hp_max",
				6142
			}
		},
		add = {
			{
				70003,
				265
			}
		}
	},
	["4_21"] = {
		limit_lev = 82,
		lev = 21,
		expend = 34,
		type = 4,
		icon = 70207,
		attr = {
			{
				"hp_max",
				6594
			}
		},
		add = {
			{
				70003,
				297
			}
		}
	},
	["4_22"] = {
		limit_lev = 84,
		lev = 22,
		expend = 36,
		type = 4,
		icon = 70208,
		attr = {
			{
				"hp_max",
				7063
			}
		},
		add = {
			{
				70003,
				331
			}
		}
	},
	["4_23"] = {
		limit_lev = 86,
		lev = 23,
		expend = 38,
		type = 4,
		icon = 70208,
		attr = {
			{
				"hp_max",
				7548
			}
		},
		add = {
			{
				70003,
				367
			}
		}
	},
	["4_24"] = {
		limit_lev = 88,
		lev = 24,
		expend = 40,
		type = 4,
		icon = 70208,
		attr = {
			{
				"hp_max",
				8049
			}
		},
		add = {
			{
				70003,
				405
			}
		}
	},
	["4_25"] = {
		limit_lev = 90,
		lev = 25,
		expend = 42,
		type = 4,
		icon = 70209,
		attr = {
			{
				"hp_max",
				8550
			}
		},
		add = {
			{
				70003,
				445
			}
		}
	},
	["4_26"] = {
		limit_lev = 92,
		lev = 26,
		expend = 44,
		type = 4,
		icon = 70209,
		attr = {
			{
				"hp_max",
				9067
			}
		},
		add = {
			{
				70003,
				487
			}
		}
	},
	["4_27"] = {
		limit_lev = 94,
		lev = 27,
		expend = 46,
		type = 4,
		icon = 70209,
		attr = {
			{
				"hp_max",
				9601
			}
		},
		add = {
			{
				70003,
				531
			}
		}
	},
	["4_28"] = {
		limit_lev = 96,
		lev = 28,
		expend = 48,
		type = 4,
		icon = 70210,
		attr = {
			{
				"hp_max",
				10134
			}
		},
		add = {
			{
				70003,
				577
			}
		}
	},
	["4_29"] = {
		limit_lev = 98,
		lev = 29,
		expend = 50,
		type = 4,
		icon = 70210,
		attr = {
			{
				"hp_max",
				10684
			}
		},
		add = {
			{
				70003,
				625
			}
		}
	},
	["4_30"] = {
		limit_lev = 100,
		lev = 30,
		expend = 0,
		type = 4,
		icon = 70210,
		attr = {
			{
				"hp_max",
				11250
			}
		},
		add = {
			{
				70003,
				675
			}
		}
	}
}
Config.PartnerGemstoneData.data_resonate_length = 12
Config.PartnerGemstoneData.data_resonate = {
	{
		need_lev = 40,
		lev = 1,
		attr = {
			{
				"atk",
				36
			},
			{
				"def",
				25
			},
			{
				"hp_max",
				184
			},
			{
				"speed",
				5
			}
		}
	},
	{
		need_lev = 80,
		lev = 2,
		attr = {
			{
				"atk",
				49
			},
			{
				"def",
				34
			},
			{
				"hp_max",
				248
			},
			{
				"speed",
				10
			}
		}
	},
	{
		need_lev = 120,
		lev = 3,
		attr = {
			{
				"atk",
				67
			},
			{
				"def",
				46
			},
			{
				"hp_max",
				335
			},
			{
				"speed",
				15
			}
		}
	},
	{
		need_lev = 160,
		lev = 4,
		attr = {
			{
				"atk",
				90
			},
			{
				"def",
				63
			},
			{
				"hp_max",
				453
			},
			{
				"speed",
				20
			}
		}
	},
	{
		need_lev = 200,
		lev = 5,
		attr = {
			{
				"atk",
				122
			},
			{
				"def",
				85
			},
			{
				"hp_max",
				611
			},
			{
				"speed",
				25
			}
		}
	},
	{
		need_lev = 240,
		lev = 6,
		attr = {
			{
				"atk",
				165
			},
			{
				"def",
				115
			},
			{
				"hp_max",
				825
			},
			{
				"speed",
				30
			}
		}
	},
	{
		need_lev = 280,
		lev = 7,
		attr = {
			{
				"atk",
				222
			},
			{
				"def",
				156
			},
			{
				"hp_max",
				1114
			},
			{
				"speed",
				35
			}
		}
	},
	{
		need_lev = 320,
		lev = 8,
		attr = {
			{
				"atk",
				301
			},
			{
				"def",
				210
			},
			{
				"hp_max",
				1505
			},
			{
				"speed",
				40
			},
			{
				"dam",
				10
			},
			{
				"res",
				10
			}
		}
	},
	{
		need_lev = 360,
		lev = 9,
		attr = {
			{
				"atk",
				406
			},
			{
				"def",
				284
			},
			{
				"hp_max",
				2032
			},
			{
				"speed",
				45
			},
			{
				"dam",
				20
			},
			{
				"res",
				20
			}
		}
	},
	{
		need_lev = 400,
		lev = 10,
		attr = {
			{
				"atk",
				548
			},
			{
				"def",
				384
			},
			{
				"hp_max",
				2743
			},
			{
				"speed",
				50
			},
			{
				"dam",
				30
			},
			{
				"res",
				30
			}
		}
	},
	{
		need_lev = 440,
		lev = 11,
		attr = {
			{
				"atk",
				740
			},
			{
				"def",
				518
			},
			{
				"hp_max",
				3703
			},
			{
				"speed",
				55
			},
			{
				"dam",
				40
			},
			{
				"res",
				40
			}
		}
	},
	{
		need_lev = 480,
		lev = 12,
		attr = {
			{
				"atk",
				1000
			},
			{
				"def",
				700
			},
			{
				"hp_max",
				5000
			},
			{
				"speed",
				60
			},
			{
				"dam",
				50
			},
			{
				"res",
				50
			}
		}
	}
}
Config.PartnerGemstoneData.data_explain_length = 1
Config.PartnerGemstoneData.data_explain = {
	{
		id = 1,
		title = "规则说明",
		desc = "1.同一英雄宝石总等级达到要求时，即可激活宝石共鸣，共鸣等级越高，属性越高\n2.当英雄卸下装备，导致宝石总等级不满足要求时，则宝石共鸣等级自动降低"
	}
}
