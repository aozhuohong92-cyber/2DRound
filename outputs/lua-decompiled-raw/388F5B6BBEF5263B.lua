Config = Config or {}
Config.ShippingData = Config.ShippingData or {}
Config.ShippingData.data_const_length = 9
Config.ShippingData.data_const = {
	guild_lev = {
		val = 12,
		key = "guild_lev",
		desc = "12级开启远航"
	},
	refresh_cost = {
		key = "refresh_cost",
		desc = "道具刷新消耗",
		val = {
			{
				10002,
				1
			}
		}
	},
	max_quest = {
		val = 6,
		key = "max_quest",
		desc = "最大订单数"
	},
	refresh_bless = {
		val = 0,
		key = "refresh_bless",
		desc = "刷新保底次数"
	},
	refresh_free_count = {
		val = 2,
		key = "refresh_free_count",
		desc = "免费刷新次数"
	},
	refresh_vip = {
		key = "refresh_vip",
		desc = "初级远航刷新特权",
		val = {
			103
		}
	},
	refresh_highvip = {
		key = "refresh_highvip",
		desc = "高级远航刷新特权",
		val = {
			104
		}
	},
	first_refresh = {
		key = "first_refresh",
		desc = "初次刷新必出",
		val = {
			10905,
			10701,
			11001
		}
	},
	discount = {
		val = 900,
		key = "discount",
		desc = "情报折扣"
	}
}

function Config.ShippingData.data_const_fun(slot0)
	slot1 = Config.ShippingData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ShippingData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ShippingData.data_order_length = 86
Config.ShippingData.data_order = {
	[10001] = {
		need_time = 7200,
		quality = 0,
		name = "援助岛民",
		id = 10001,
		limit_num = 2,
		award = {
			{
				29903,
				20
			}
		},
		condition = {
			101,
			200
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10002] = {
		need_time = 7200,
		quality = 0,
		name = "邻岛交易",
		id = 10002,
		limit_num = 2,
		award = {
			{
				10401,
				2
			}
		},
		condition = {
			101,
			201
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10003] = {
		need_time = 7200,
		quality = 0,
		name = "渔民的感恩",
		id = 10003,
		limit_num = 2,
		award = {
			{
				3,
				15
			}
		},
		condition = {
			101,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10004] = {
		need_time = 7200,
		quality = 0,
		name = "狂欢水手节",
		id = 10004,
		limit_num = 2,
		award = {
			{
				10103,
				1
			}
		},
		condition = {
			101,
			200
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10005] = {
		need_time = 7200,
		quality = 0,
		name = "秘宝商人",
		id = 10005,
		limit_num = 2,
		award = {
			{
				37001,
				1
			}
		},
		condition = {
			101,
			200
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10101] = {
		need_time = 14400,
		quality = 1,
		name = "贵族的委托",
		id = 10101,
		limit_num = 2,
		award = {
			{
				3,
				30
			}
		},
		condition = {
			102,
			200
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10102] = {
		need_time = 14400,
		quality = 1,
		name = "秘密交易",
		id = 10102,
		limit_num = 2,
		award = {
			{
				29903,
				40
			}
		},
		condition = {
			102,
			201
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10103] = {
		need_time = 14400,
		quality = 1,
		name = "灾后重建",
		id = 10103,
		limit_num = 2,
		award = {
			{
				10103,
				2
			}
		},
		condition = {
			102,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10104] = {
		need_time = 14400,
		quality = 1,
		name = "船长的储备",
		id = 10104,
		limit_num = 2,
		award = {
			{
				10401,
				4
			}
		},
		condition = {
			102,
			200
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10105] = {
		need_time = 14400,
		quality = 1,
		name = "秘宝商人",
		id = 10105,
		limit_num = 2,
		award = {
			{
				37001,
				2
			}
		},
		condition = {
			102,
			200
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10201] = {
		need_time = 21600,
		quality = 2,
		name = "不明的财产",
		id = 10201,
		limit_num = 3,
		award = {
			{
				29904,
				10
			}
		},
		condition = {
			102,
			200,
			201
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10202] = {
		need_time = 21600,
		quality = 2,
		name = "王子地下恋情",
		id = 10202,
		limit_num = 3,
		award = {
			{
				29504,
				10
			}
		},
		condition = {
			102,
			200,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10203] = {
		need_time = 21600,
		quality = 2,
		name = "士兵的遗产",
		id = 10203,
		limit_num = 3,
		award = {
			{
				29404,
				10
			}
		},
		condition = {
			102,
			201,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10204] = {
		need_time = 21600,
		quality = 2,
		name = "祭奠英雄",
		id = 10204,
		limit_num = 3,
		award = {
			{
				10103,
				4
			}
		},
		condition = {
			102,
			200,
			201
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10205] = {
		need_time = 21600,
		quality = 2,
		name = "暴雨后的重建",
		id = 10205,
		limit_num = 3,
		award = {
			{
				3,
				60
			}
		},
		condition = {
			102,
			200,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10206] = {
		need_time = 21600,
		quality = 2,
		name = "岛屿建设",
		id = 10206,
		limit_num = 3,
		award = {
			{
				29104,
				10
			}
		},
		condition = {
			102,
			201,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10207] = {
		need_time = 21600,
		quality = 2,
		name = "特别食材护送",
		id = 10207,
		limit_num = 3,
		award = {
			{
				29204,
				10
			}
		},
		condition = {
			102,
			200,
			201
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10208] = {
		need_time = 21600,
		quality = 2,
		name = "国王的信件",
		id = 10208,
		limit_num = 3,
		award = {
			{
				29304,
				10
			}
		},
		condition = {
			102,
			200,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10209] = {
		need_time = 21600,
		quality = 2,
		name = "遗迹探索",
		id = 10209,
		limit_num = 3,
		award = {
			{
				10401,
				6
			}
		},
		condition = {
			102,
			201,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10210] = {
		need_time = 21600,
		quality = 2,
		name = "秘宝商人",
		id = 10210,
		limit_num = 3,
		award = {
			{
				37001,
				3
			}
		},
		condition = {
			102,
			201,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10301] = {
		need_time = 28800,
		quality = 3,
		name = "援助岛民",
		id = 10301,
		limit_num = 3,
		award = {
			{
				29904,
				30
			}
		},
		condition = {
			103,
			200,
			201
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10302] = {
		need_time = 28800,
		quality = 3,
		name = "邻岛交易",
		id = 10302,
		limit_num = 3,
		award = {
			{
				29504,
				30
			}
		},
		condition = {
			103,
			200,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10303] = {
		need_time = 28800,
		quality = 3,
		name = "渔民的感恩",
		id = 10303,
		limit_num = 3,
		award = {
			{
				29404,
				30
			}
		},
		condition = {
			103,
			201,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10304] = {
		need_time = 28800,
		quality = 3,
		name = "狂欢水手节",
		id = 10304,
		limit_num = 3,
		award = {
			{
				29104,
				30
			}
		},
		condition = {
			103,
			201,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10305] = {
		need_time = 28800,
		quality = 3,
		name = "护送古董",
		id = 10305,
		limit_num = 3,
		award = {
			{
				29204,
				30
			}
		},
		condition = {
			103,
			200,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10306] = {
		need_time = 28800,
		quality = 3,
		name = "贵族的委托",
		id = 10306,
		limit_num = 3,
		award = {
			{
				29304,
				30
			}
		},
		condition = {
			103,
			202,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10307] = {
		need_time = 28800,
		quality = 3,
		name = "秘密交易",
		id = 10307,
		limit_num = 3,
		award = {
			{
				10103,
				10
			}
		},
		condition = {
			103,
			200,
			201
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10308] = {
		need_time = 28800,
		quality = 3,
		name = "灾后重建",
		id = 10308,
		limit_num = 3,
		award = {
			{
				10403,
				1
			}
		},
		condition = {
			103,
			200,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10309] = {
		need_time = 28800,
		quality = 3,
		name = "船长的储备",
		id = 10309,
		limit_num = 3,
		award = {
			{
				10452,
				1
			}
		},
		condition = {
			103,
			201,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10310] = {
		need_time = 28800,
		quality = 3,
		name = "建国日",
		id = 10310,
		limit_num = 3,
		award = {
			{
				3,
				120
			}
		},
		condition = {
			103,
			200,
			201
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10311] = {
		need_time = 28800,
		quality = 3,
		name = "不明的财产",
		id = 10311,
		limit_num = 3,
		award = {
			{
				29905,
				10
			}
		},
		condition = {
			103,
			200,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10312] = {
		need_time = 28800,
		quality = 3,
		name = "王子地下恋情",
		id = 10312,
		limit_num = 3,
		award = {
			{
				29505,
				10
			}
		},
		condition = {
			103,
			201,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10313] = {
		need_time = 28800,
		quality = 3,
		name = "士兵的遗产",
		id = 10313,
		limit_num = 3,
		award = {
			{
				29405,
				10
			}
		},
		condition = {
			103,
			201,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10314] = {
		need_time = 28800,
		quality = 3,
		name = "祭奠英雄",
		id = 10314,
		limit_num = 3,
		award = {
			{
				29105,
				10
			}
		},
		condition = {
			103,
			200,
			201
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10315] = {
		need_time = 28800,
		quality = 3,
		name = "暴雨后的重建",
		id = 10315,
		limit_num = 3,
		award = {
			{
				29205,
				10
			}
		},
		condition = {
			103,
			201,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10316] = {
		need_time = 28800,
		quality = 3,
		name = "岛屿建设",
		id = 10316,
		limit_num = 3,
		award = {
			{
				29305,
				10
			}
		},
		condition = {
			103,
			202,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10317] = {
		need_time = 28800,
		quality = 3,
		name = "秘宝商人",
		id = 10317,
		limit_num = 3,
		award = {
			{
				37001,
				5
			}
		},
		condition = {
			103,
			202,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10318] = {
		need_time = 28800,
		quality = 3,
		name = "秘宝商人",
		id = 10318,
		limit_num = 3,
		award = {
			{
				37001,
				8
			}
		},
		condition = {
			103,
			202,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10319] = {
		need_time = 28800,
		quality = 3,
		name = "秘宝商人",
		id = 10319,
		limit_num = 3,
		award = {
			{
				37001,
				10
			}
		},
		condition = {
			103,
			202,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10401] = {
		need_time = 43200,
		quality = 4,
		name = "国王的信件",
		id = 10401,
		limit_num = 4,
		award = {
			{
				14001,
				1
			}
		},
		condition = {
			104,
			200,
			202,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10402] = {
		need_time = 43200,
		quality = 4,
		name = "遗迹探索",
		id = 10402,
		limit_num = 4,
		award = {
			{
				29905,
				20
			}
		},
		condition = {
			104,
			200,
			203,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10403] = {
		need_time = 43200,
		quality = 4,
		name = "孤岛搜救",
		id = 10403,
		limit_num = 4,
		award = {
			{
				29505,
				20
			}
		},
		condition = {
			104,
			201,
			202,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10404] = {
		need_time = 43200,
		quality = 4,
		name = "援助岛民",
		id = 10404,
		limit_num = 4,
		award = {
			{
				29405,
				20
			}
		},
		condition = {
			104,
			201,
			202,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10405] = {
		need_time = 43200,
		quality = 4,
		name = "邻岛交易",
		id = 10405,
		limit_num = 4,
		award = {
			{
				29105,
				20
			}
		},
		condition = {
			104,
			201,
			203,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10406] = {
		need_time = 43200,
		quality = 4,
		name = "渔民的感恩",
		id = 10406,
		limit_num = 4,
		award = {
			{
				29205,
				20
			}
		},
		condition = {
			104,
			202,
			203,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10407] = {
		need_time = 43200,
		quality = 4,
		name = "狂欢水手节",
		id = 10407,
		limit_num = 4,
		award = {
			{
				29305,
				20
			}
		},
		condition = {
			104,
			200,
			203,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10408] = {
		need_time = 43200,
		quality = 4,
		name = "护送古董",
		id = 10408,
		limit_num = 4,
		award = {
			{
				3,
				300
			}
		},
		condition = {
			104,
			201,
			202,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10409] = {
		need_time = 43200,
		quality = 4,
		name = "贵族的委托",
		id = 10409,
		limit_num = 4,
		award = {
			{
				10403,
				2
			}
		},
		condition = {
			104,
			201,
			202,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10410] = {
		need_time = 43200,
		quality = 4,
		name = "秘密交易",
		id = 10410,
		limit_num = 4,
		award = {
			{
				10453,
				1
			}
		},
		condition = {
			104,
			200,
			202,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10411] = {
		need_time = 43200,
		quality = 4,
		name = "灾后重建",
		id = 10411,
		limit_num = 4,
		award = {
			{
				14002,
				100
			}
		},
		condition = {
			104,
			200,
			203,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10412] = {
		need_time = 43200,
		quality = 4,
		name = "秘宝商人",
		id = 10412,
		limit_num = 4,
		award = {
			{
				37002,
				1
			}
		},
		condition = {
			104,
			200,
			203,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10501] = {
		need_time = 57600,
		quality = 5,
		name = "建国日",
		id = 10501,
		limit_num = 4,
		award = {
			{
				3,
				600
			}
		},
		condition = {
			105,
			200,
			201,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10502] = {
		need_time = 57600,
		quality = 5,
		name = "不明的财产",
		id = 10502,
		limit_num = 4,
		award = {
			{
				10403,
				5
			}
		},
		condition = {
			105,
			200,
			201,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10503] = {
		need_time = 57600,
		quality = 5,
		name = "王子地下恋情",
		id = 10503,
		limit_num = 4,
		award = {
			{
				14001,
				2
			}
		},
		condition = {
			105,
			200,
			201,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10504] = {
		need_time = 57600,
		quality = 5,
		name = "士兵的遗产",
		id = 10504,
		limit_num = 4,
		award = {
			{
				29905,
				40
			}
		},
		condition = {
			105,
			200,
			202,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10505] = {
		need_time = 57600,
		quality = 5,
		name = "祭奠英雄",
		id = 10505,
		limit_num = 4,
		award = {
			{
				29505,
				40
			}
		},
		condition = {
			105,
			200,
			202,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10506] = {
		need_time = 57600,
		quality = 5,
		name = "暴雨后的重建",
		id = 10506,
		limit_num = 4,
		award = {
			{
				29405,
				40
			}
		},
		condition = {
			105,
			200,
			203,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10507] = {
		need_time = 57600,
		quality = 5,
		name = "岛屿建设",
		id = 10507,
		limit_num = 4,
		award = {
			{
				29105,
				40
			}
		},
		condition = {
			105,
			201,
			202,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10508] = {
		need_time = 57600,
		quality = 5,
		name = "特别食材护送",
		id = 10508,
		limit_num = 4,
		award = {
			{
				29205,
				40
			}
		},
		condition = {
			105,
			201,
			202,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10509] = {
		need_time = 57600,
		quality = 5,
		name = "国王的信件",
		id = 10509,
		limit_num = 4,
		award = {
			{
				29305,
				40
			}
		},
		condition = {
			105,
			201,
			203,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10510] = {
		need_time = 57600,
		quality = 5,
		name = "遗迹探索",
		id = 10510,
		limit_num = 4,
		award = {
			{
				10453,
				2
			}
		},
		condition = {
			105,
			202,
			203,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10511] = {
		need_time = 57600,
		quality = 5,
		name = "孤岛搜救",
		id = 10511,
		limit_num = 4,
		award = {
			{
				14002,
				200
			}
		},
		condition = {
			105,
			202,
			203,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10512] = {
		need_time = 57600,
		quality = 5,
		name = "秘宝商人",
		id = 10512,
		limit_num = 4,
		award = {
			{
				37002,
				2
			}
		},
		condition = {
			105,
			202,
			203,
			204
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10601] = {
		need_time = 7200,
		quality = 0,
		name = "邻岛交易",
		id = 10601,
		limit_num = 2,
		award = {
			{
				29903,
				20
			}
		},
		condition = {
			101,
			200
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10602] = {
		need_time = 7200,
		quality = 0,
		name = "渔民的感恩",
		id = 10602,
		limit_num = 2,
		award = {
			{
				10401,
				2
			}
		},
		condition = {
			101,
			201
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10603] = {
		need_time = 7200,
		quality = 0,
		name = "狂欢水手节",
		id = 10603,
		limit_num = 2,
		award = {
			{
				3,
				10
			}
		},
		condition = {
			101,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10604] = {
		need_time = 7200,
		quality = 0,
		name = "护送古董",
		id = 10604,
		limit_num = 2,
		award = {
			{
				10103,
				1
			}
		},
		condition = {
			101,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10701] = {
		need_time = 14400,
		quality = 1,
		name = "秘密交易",
		id = 10701,
		limit_num = 2,
		award = {
			{
				3,
				20
			}
		},
		condition = {
			102,
			201
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10702] = {
		need_time = 14400,
		quality = 1,
		name = "灾后重建",
		id = 10702,
		limit_num = 2,
		award = {
			{
				29903,
				40
			}
		},
		condition = {
			102,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10703] = {
		need_time = 14400,
		quality = 1,
		name = "船长的储备",
		id = 10703,
		limit_num = 2,
		award = {
			{
				10103,
				2
			}
		},
		condition = {
			102,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10704] = {
		need_time = 14400,
		quality = 1,
		name = "建国日",
		id = 10704,
		limit_num = 2,
		award = {
			{
				10401,
				4
			}
		},
		condition = {
			102,
			200
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10801] = {
		need_time = 21600,
		quality = 2,
		name = "王子地下恋情",
		id = 10801,
		limit_num = 3,
		award = {
			{
				29904,
				10
			}
		},
		condition = {
			102,
			200,
			201
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10802] = {
		need_time = 21600,
		quality = 2,
		name = "士兵的遗产",
		id = 10802,
		limit_num = 3,
		award = {
			{
				29504,
				10
			}
		},
		condition = {
			102,
			200,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10803] = {
		need_time = 21600,
		quality = 2,
		name = "祭奠英雄",
		id = 10803,
		limit_num = 3,
		award = {
			{
				29404,
				10
			}
		},
		condition = {
			102,
			201,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10804] = {
		need_time = 21600,
		quality = 2,
		name = "暴雨后的重建",
		id = 10804,
		limit_num = 3,
		award = {
			{
				10103,
				4
			}
		},
		condition = {
			102,
			200,
			201
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10805] = {
		need_time = 21600,
		quality = 2,
		name = "岛屿建设",
		id = 10805,
		limit_num = 3,
		award = {
			{
				3,
				40
			}
		},
		condition = {
			102,
			200,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10806] = {
		need_time = 21600,
		quality = 2,
		name = "特别食材护送",
		id = 10806,
		limit_num = 3,
		award = {
			{
				29104,
				10
			}
		},
		condition = {
			102,
			201,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10807] = {
		need_time = 21600,
		quality = 2,
		name = "国王的信件",
		id = 10807,
		limit_num = 3,
		award = {
			{
				29204,
				10
			}
		},
		condition = {
			102,
			200,
			201
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10808] = {
		need_time = 21600,
		quality = 2,
		name = "遗迹探索",
		id = 10808,
		limit_num = 3,
		award = {
			{
				29304,
				10
			}
		},
		condition = {
			102,
			200,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10809] = {
		need_time = 21600,
		quality = 2,
		name = "孤岛搜救",
		id = 10809,
		limit_num = 3,
		award = {
			{
				10401,
				6
			}
		},
		condition = {
			102,
			201,
			202
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10901] = {
		need_time = 28800,
		quality = 3,
		name = "邻岛交易",
		id = 10901,
		limit_num = 3,
		award = {
			{
				10403,
				1
			}
		},
		condition = {
			103,
			200,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10902] = {
		need_time = 28800,
		quality = 3,
		name = "渔民的感恩",
		id = 10902,
		limit_num = 3,
		award = {
			{
				10403,
				1
			}
		},
		condition = {
			103,
			201,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10903] = {
		need_time = 28800,
		quality = 3,
		name = "狂欢水手节",
		id = 10903,
		limit_num = 3,
		award = {
			{
				10403,
				1
			}
		},
		condition = {
			103,
			201,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10904] = {
		need_time = 28800,
		quality = 3,
		name = "护送古董",
		id = 10904,
		limit_num = 3,
		award = {
			{
				10403,
				1
			}
		},
		condition = {
			103,
			202,
			203
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[10905] = {
		need_time = 28800,
		quality = 3,
		name = "邻岛交易",
		id = 10905,
		limit_num = 3,
		award = {
			{
				10403,
				1
			}
		},
		condition = {
			103,
			202,
			200
		},
		expend = {
			{
				7,
				2000
			}
		}
	},
	[11001] = {
		need_time = 28800,
		quality = 3,
		name = "建国日",
		id = 11001,
		limit_num = 3,
		award = {
			{
				3,
				120
			}
		},
		condition = {
			103,
			200,
			201
		},
		expend = {
			{
				7,
				2000
			}
		}
	}
}

function Config.ShippingData.data_order_fun(slot0)
	slot1 = Config.ShippingData.data_order[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ShippingData.data_order[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ShippingData.data_condition_length = 15
Config.ShippingData.data_condition = {
	[100] = {
		id = 100,
		desc = "存在1个1星或以上的伙伴",
		conition = {
			{
				"partner_star",
				1,
				1
			}
		}
	},
	[101] = {
		id = 101,
		desc = "存在1个2星或以上的伙伴",
		conition = {
			{
				"partner_star",
				2,
				1
			}
		}
	},
	[102] = {
		id = 102,
		desc = "存在1个3星或以上的伙伴",
		conition = {
			{
				"partner_star",
				3,
				1
			}
		}
	},
	[103] = {
		id = 103,
		desc = "存在1个4星或以上的伙伴",
		conition = {
			{
				"partner_star",
				4,
				1
			}
		}
	},
	[104] = {
		id = 104,
		desc = "存在1个5星或以上的伙伴",
		conition = {
			{
				"partner_star",
				5,
				1
			}
		}
	},
	[105] = {
		id = 105,
		desc = "存在1个6星或以上的伙伴",
		conition = {
			{
				"partner_star",
				6,
				1
			}
		}
	},
	[106] = {
		id = 106,
		desc = "存在1个7星或以上的伙伴",
		conition = {
			{
				"partner_star",
				7,
				1
			}
		}
	},
	[107] = {
		id = 107,
		desc = "存在1个8星或以上的伙伴",
		conition = {
			{
				"partner_star",
				8,
				1
			}
		}
	},
	[108] = {
		id = 108,
		desc = "存在1个9星或以上的伙伴",
		conition = {
			{
				"partner_star",
				9,
				1
			}
		}
	},
	[109] = {
		id = 109,
		desc = "存在1个10星或以上的伙伴",
		conition = {
			{
				"partner_star",
				10,
				1
			}
		}
	},
	[200] = {
		id = 200,
		desc = "存在1个水阵营的伙伴",
		conition = {
			{
				"partner_camp_type",
				1,
				1
			}
		}
	},
	[201] = {
		id = 201,
		desc = "存在1个火阵营的伙伴",
		conition = {
			{
				"partner_camp_type",
				2,
				1
			}
		}
	},
	[202] = {
		id = 202,
		desc = "存在1个风阵营的伙伴",
		conition = {
			{
				"partner_camp_type",
				3,
				1
			}
		}
	},
	[203] = {
		id = 203,
		desc = "存在1个光阵营的伙伴",
		conition = {
			{
				"partner_camp_type",
				4,
				1
			}
		}
	},
	[204] = {
		id = 204,
		desc = "存在1个暗阵营的伙伴",
		conition = {
			{
				"partner_camp_type",
				5,
				1
			}
		}
	}
}

function Config.ShippingData.data_condition_fun(slot0)
	slot1 = Config.ShippingData.data_condition[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ShippingData.data_condition[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ShippingData.data_quick_cost_length = 6
Config.ShippingData.data_quick_cost = {
	[0] = {
		gold = 0,
		min = 0,
		max = 3600
	},
	[3601] = {
		gold = 20,
		min = 3601,
		max = 7200
	},
	[7201] = {
		gold = 30,
		min = 7201,
		max = 14400
	},
	[14401] = {
		gold = 40,
		min = 14401,
		max = 21600
	},
	[21601] = {
		gold = 50,
		min = 21601,
		max = 28800
	},
	[28801] = {
		gold = 60,
		min = 28801,
		max = 999999
	}
}

function Config.ShippingData.data_quick_cost_fun(slot0)
	slot1 = Config.ShippingData.data_quick_cost[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ShippingData.data_quick_cost[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ShippingData.data_refresh_length = 19
Config.ShippingData.data_refresh = {
	[0] = {
		vip_lev = 0,
		free_times = 2,
		all_times = 1,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 1,
		free_times = 2,
		all_times = 2,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 2,
		free_times = 2,
		all_times = 3,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 3,
		free_times = 2,
		all_times = 4,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 4,
		free_times = 2,
		all_times = 5,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 5,
		free_times = 2,
		all_times = 6,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 6,
		free_times = 2,
		all_times = 7,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 7,
		free_times = 2,
		all_times = 8,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 8,
		free_times = 2,
		all_times = 9,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 9,
		free_times = 2,
		all_times = 10,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 10,
		free_times = 2,
		all_times = 11,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 11,
		free_times = 2,
		all_times = 12,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 12,
		free_times = 2,
		all_times = 13,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 13,
		free_times = 2,
		all_times = 14,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 14,
		free_times = 2,
		all_times = 15,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 15,
		free_times = 2,
		all_times = 16,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 16,
		free_times = 2,
		all_times = 17,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 17,
		free_times = 2,
		all_times = 18,
		expend = {
			{
				3,
				30
			}
		}
	},
	{
		vip_lev = 18,
		free_times = 2,
		all_times = 19,
		expend = {
			{
				3,
				30
			}
		}
	}
}

function Config.ShippingData.data_refresh_fun(slot0)
	slot1 = Config.ShippingData.data_refresh[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ShippingData.data_refresh[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ShippingData.data_explain_length = 3
Config.ShippingData.data_explain = {
	{
		id = 1,
		desc = [[
1、通过刷新可刷出高品质的远航订单，订单品质越高奖励越丰富
2、每天有<div fontcolor=289b14>2</div>次免费刷新机会，也可消耗刷新券或蓝钻进行刷新
3.在派遣界面中，下方最左边的图标表示英雄需要满足的<div fontcolor=289b14>星级</div>条件，其余为英雄需要满足的阵营条件
4、当英雄满足指定派遣条件后，可消耗一定的远航情报接取对应订单
5、每次接取订单后需进行一段时间，期间已派遣的英雄无法执行其他任务
6、【已拥有情报值】与【累计可领取的远航情报值】<div fontcolor=289b14>之和</div>达到当前上限后，离线挂机将不再获得情报值，请及时使用哦]]
	},
	{
		id = 2,
		desc = "<div fontcolor=289b14>【远航高级特权】\n</div><div fontcolor=#FFEED1>每天首次钻石、刷新券刷新必出紫色任务</div>"
	},
	{
		id = 3,
		desc = "<div fontcolor=289b14>【远航豪华特权】\n</div><div fontcolor=#FFEED1>每天第3次钻石、刷新券刷新必出橙色任务</div>"
	}
}

function Config.ShippingData.data_explain_fun(slot0)
	slot1 = Config.ShippingData.data_explain[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ShippingData.data_explain[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
