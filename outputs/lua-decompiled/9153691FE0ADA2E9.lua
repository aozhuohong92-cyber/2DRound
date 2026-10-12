Config = Config or {}
Config.HolidaySnatchData = Config.HolidaySnatchData or {}
Config.HolidaySnatchData.data_const_length = 11
Config.HolidaySnatchData.data_const = {
	item_price = {
		val = 10,
		code = "item_price",
		desc = "门票价值"
	},
	item_score = {
		code = "item_score",
		desc = "门票积分",
		val = {
			37007,
			3
		}
	},
	holiday_open_time = {
		code = "holiday_open_time",
		desc = "开启时间",
		val = {
			{
				12,
				0,
				0
			},
			{
				18,
				0,
				0
			}
		}
	},
	holiday_close_time = {
		code = "holiday_close_time",
		desc = "结束时间",
		val = {
			{
				14,
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
	holiday_rule = {
		code = "holiday_rule",
		desc = [[
<div fontcolor=#fca000>活动时间：</div>1月29日至2月4日
<div fontcolor=#fca000>玩法说明：</div>
1.花费<div fontcolor=#00ff00>1夺宝币</div>可购买1人次，并获得一个<div fontcolor=#00ff00>夺宝号码</div>
2.商品<div fontcolor=#00ff00>购买次数</div>够了之后，会抽出一名幸运玩家获得该商品
3.每逢<div fontcolor=#00ff00>购买次数达到条件</div>会开奖一次
4.购买次数越多，中奖概率越高
5.已开奖却未中奖的玩家均会<div fontcolor=#00ff00>1:3邮件获得所消耗夺宝币的夺宝积分</div>，可以在兑换商城兑换道具（下架物品只返还夺宝币）
6.奖品及积分会通过<div fontcolor=#00ff00>邮件形式</div>发放，请大人及时领取并使用哦
7.商品如果在<div fontcolor=#00ff00>2个小时</div>内没有达到足够的购买人次会<div fontcolor=#00ff00>下架</div>，并<div fontcolor=#00ff00>返还</div>玩家花费的<div fontcolor=#00ff00>夺宝币</div>
<div fontcolor=#fca000>抽奖规则：</div>
1.每一期开奖会随机出一个<div fontcolor=#00ff00>随机数</div>
2.根据<div fontcolor=#00ff00>最后30位夺宝玩家的购买时间</div>和随机数计算出幸运号码
3.幸运号码与夺宝号码相同的玩家最终获得该商品
4.幸运号码=10001+[（最后30位夺宝玩家的购买时间之和+每期随机数）÷总需人次]的余数
]],
		val = {}
	},
	alive_day = {
		val = 2,
		code = "alive_day",
		desc = "活跃天数"
	},
	group_limit = {
		val = 50000,
		code = "group_limit",
		desc = "单组人数限制"
	},
	zone_min_num = {
		val = 15000,
		code = "zone_min_num",
		desc = "最后一组人数小于值 则合并到前1组"
	},
	item_ticket = {
		val = 37006,
		code = "item_ticket",
		desc = "夺宝门票"
	},
	snatch_time1 = {
		code = "snatch_time1",
		desc = "夺宝时间1",
		val = {
			{
				12,
				0
			},
			{
				14,
				0
			}
		}
	},
	snatch_time2 = {
		code = "snatch_time2",
		desc = "夺宝时间2",
		val = {
			{
				18,
				0
			},
			{
				20,
				0
			}
		}
	}
}

function Config.HolidaySnatchData.data_const_fun(slot0)
	slot1 = Config.HolidaySnatchData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidaySnatchData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidaySnatchData.data_join_goods_list_length = 122
Config.HolidaySnatchData.data_join_goods_list = {
	[101] = {
		price = 250,
		name = "艾斯碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 101,
		f_id = 1001,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				24901,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[102] = {
		price = 250,
		name = "基德碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 102,
		f_id = 1001,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				24904,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[103] = {
		price = 250,
		name = "索隆(伟大航路)碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 103,
		f_id = 1001,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				25907,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[104] = {
		price = 250,
		name = "山治碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 104,
		f_id = 1001,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				25908,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[105] = {
		price = 250,
		name = "月光莫利亚碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 105,
		f_id = 1001,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				26906,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[106] = {
		price = 250,
		name = "龙马碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 106,
		f_id = 1001,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				26907,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[107] = {
		price = 400,
		name = "战桃丸碎片",
		limit_min = 400,
		pro = 100,
		limit_role_max = 400,
		id = 107,
		f_id = 1001,
		limit_max = 400,
		is_hot = 1,
		award = {
			{
				27901,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[108] = {
		price = 450,
		name = "鹤碎片",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 108,
		f_id = 1001,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				27906,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[109] = {
		price = 450,
		name = "香克斯碎片",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 109,
		f_id = 1001,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				28903,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[110] = {
		price = 450,
		name = "艾斯（魂）碎片",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 110,
		f_id = 1001,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				28906,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[111] = {
		price = 450,
		name = "战国碎片",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 111,
		f_id = 1001,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				27907,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[112] = {
		price = 250,
		name = "鹰眼碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 112,
		f_id = 1001,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				26908,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[113] = {
		price = 250,
		name = "艾尼路碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 113,
		f_id = 1001,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				24909,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[201] = {
		price = 250,
		name = "艾斯碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 201,
		f_id = 1002,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				24901,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[202] = {
		price = 250,
		name = "基德碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 202,
		f_id = 1002,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				24904,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[203] = {
		price = 250,
		name = "乔巴碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 203,
		f_id = 1002,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				25906,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[204] = {
		price = 250,
		name = "索隆(伟大航路)碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 204,
		f_id = 1002,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				25907,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[205] = {
		price = 250,
		name = "山治碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 205,
		f_id = 1002,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				25908,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[206] = {
		price = 250,
		name = "暴君熊碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 206,
		f_id = 1002,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				26901,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[207] = {
		price = 250,
		name = "月光莫利亚碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 207,
		f_id = 1002,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				26906,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[208] = {
		price = 250,
		name = "龙马碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 208,
		f_id = 1002,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				26907,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[209] = {
		price = 400,
		name = "战桃丸碎片",
		limit_min = 400,
		pro = 100,
		limit_role_max = 400,
		id = 209,
		f_id = 1002,
		limit_max = 400,
		is_hot = 1,
		award = {
			{
				27901,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[210] = {
		price = 450,
		name = "鹤碎片",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 210,
		f_id = 1002,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				27906,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[211] = {
		price = 450,
		name = "冥王雷利碎片",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 211,
		f_id = 1002,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				28901,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[212] = {
		price = 450,
		name = "香克斯碎片",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 212,
		f_id = 1002,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				28903,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[213] = {
		price = 450,
		name = "艾斯（魂）碎片",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 213,
		f_id = 1002,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				28906,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[214] = {
		price = 450,
		name = "战国碎片",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 214,
		f_id = 1002,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				27907,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[215] = {
		price = 250,
		name = "鹰眼碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 215,
		f_id = 1002,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				26908,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[216] = {
		price = 250,
		name = "艾尼路碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 216,
		f_id = 1002,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				24909,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[217] = {
		price = 625,
		name = "超级战技",
		limit_min = 625,
		pro = 100,
		limit_role_max = 625,
		id = 217,
		f_id = 1002,
		limit_max = 625,
		is_hot = 1,
		award = {
			{
				10454,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[301] = {
		price = 250,
		name = "艾斯碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 301,
		f_id = 1003,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				24901,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[302] = {
		price = 250,
		name = "基德碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 302,
		f_id = 1003,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				24904,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[303] = {
		price = 250,
		name = "乔巴碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 303,
		f_id = 1003,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				25906,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[304] = {
		price = 250,
		name = "索隆(伟大航路)碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 304,
		f_id = 1003,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				25907,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[305] = {
		price = 250,
		name = "山治碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 305,
		f_id = 1003,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				25908,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[306] = {
		price = 250,
		name = "暴君熊碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 306,
		f_id = 1003,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				26901,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[307] = {
		price = 250,
		name = "月光莫利亚碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 307,
		f_id = 1003,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				26906,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[308] = {
		price = 250,
		name = "龙马碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 308,
		f_id = 1003,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				26907,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[309] = {
		price = 400,
		name = "战桃丸碎片",
		limit_min = 400,
		pro = 100,
		limit_role_max = 400,
		id = 309,
		f_id = 1003,
		limit_max = 400,
		is_hot = 1,
		award = {
			{
				27901,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[310] = {
		price = 450,
		name = "鹤碎片",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 310,
		f_id = 1003,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				27906,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[311] = {
		price = 450,
		name = "冥王雷利碎片",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 311,
		f_id = 1003,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				28901,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[312] = {
		price = 450,
		name = "香克斯碎片",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 312,
		f_id = 1003,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				28903,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[313] = {
		price = 450,
		name = "艾斯（魂）碎片",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 313,
		f_id = 1003,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				28906,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[314] = {
		price = 450,
		name = "战国碎片",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 314,
		f_id = 1003,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				27907,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[315] = {
		price = 250,
		name = "鹰眼碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 315,
		f_id = 1003,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				26908,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[316] = {
		price = 250,
		name = "艾尼路碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 316,
		f_id = 1003,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				24909,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[317] = {
		price = 250,
		name = "幽冥公主碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 317,
		f_id = 1003,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				24900,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[318] = {
		price = 250,
		name = "德雷克碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 318,
		f_id = 1003,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				24902,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[319] = {
		price = 250,
		name = "贝基碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 319,
		f_id = 1003,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				24903,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[320] = {
		price = 200,
		name = "弗兰奇碎片",
		limit_min = 200,
		pro = 100,
		limit_role_max = 200,
		id = 320,
		f_id = 1003,
		limit_max = 200,
		is_hot = 1,
		award = {
			{
				25900,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[321] = {
		price = 200,
		name = "乌索普碎片",
		limit_min = 200,
		pro = 100,
		limit_role_max = 200,
		id = 321,
		f_id = 1003,
		limit_max = 200,
		is_hot = 1,
		award = {
			{
				25901,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[322] = {
		price = 250,
		name = "布鲁克碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 322,
		f_id = 1003,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				25903,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[323] = {
		price = 200,
		name = "娜美(伟大航路)碎片",
		limit_min = 200,
		pro = 100,
		limit_role_max = 200,
		id = 323,
		f_id = 1003,
		limit_max = 200,
		is_hot = 1,
		award = {
			{
				25904,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[324] = {
		price = 200,
		name = "鳄鱼碎片",
		limit_min = 200,
		pro = 100,
		limit_role_max = 200,
		id = 324,
		f_id = 1003,
		limit_max = 200,
		is_hot = 1,
		award = {
			{
				26900,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[325] = {
		price = 150,
		name = "伊万科夫碎片",
		limit_min = 150,
		pro = 100,
		limit_role_max = 150,
		id = 325,
		f_id = 1003,
		limit_max = 150,
		is_hot = 1,
		award = {
			{
				26902,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[326] = {
		price = 200,
		name = "闪电碎片",
		limit_min = 200,
		pro = 100,
		limit_role_max = 200,
		id = 326,
		f_id = 1003,
		limit_max = 200,
		is_hot = 1,
		award = {
			{
				26903,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[327] = {
		price = 250,
		name = "萨博（火拳）碎片",
		limit_min = 250,
		pro = 100,
		limit_role_max = 250,
		id = 327,
		f_id = 1003,
		limit_max = 250,
		is_hot = 1,
		award = {
			{
				26905,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[328] = {
		price = 400,
		name = "黄猿碎片",
		limit_min = 400,
		pro = 100,
		limit_role_max = 400,
		id = 328,
		f_id = 1003,
		limit_max = 400,
		is_hot = 1,
		award = {
			{
				27902,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[329] = {
		price = 450,
		name = "卡普碎片",
		limit_min = 400,
		pro = 100,
		limit_role_max = 400,
		id = 329,
		f_id = 1003,
		limit_max = 400,
		is_hot = 1,
		award = {
			{
				27903,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[330] = {
		price = 400,
		name = "青雉碎片",
		limit_min = 400,
		pro = 100,
		limit_role_max = 400,
		id = 330,
		f_id = 1003,
		limit_max = 400,
		is_hot = 1,
		award = {
			{
				27905,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[331] = {
		price = 400,
		name = "巴杰斯碎片",
		limit_min = 400,
		pro = 100,
		limit_role_max = 400,
		id = 331,
		f_id = 1003,
		limit_max = 400,
		is_hot = 1,
		award = {
			{
				28902,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[332] = {
		price = 400,
		name = "黑胡子(新世界)碎片",
		limit_min = 400,
		pro = 100,
		limit_role_max = 400,
		id = 332,
		f_id = 1003,
		limit_max = 400,
		is_hot = 1,
		award = {
			{
				28904,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[333] = {
		price = 625,
		name = "超级战技",
		limit_min = 625,
		pro = 100,
		limit_role_max = 625,
		id = 333,
		f_id = 1003,
		limit_max = 625,
		is_hot = 1,
		award = {
			{
				10454,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[334] = {
		price = 145,
		name = "随机2星红装礼包",
		limit_min = 145,
		pro = 100,
		limit_role_max = 145,
		id = 334,
		f_id = 1003,
		limit_max = 145,
		is_hot = 1,
		award = {
			{
				38061,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[401] = {
		price = 625,
		name = "超级战技",
		limit_min = 625,
		pro = 50,
		limit_role_max = 625,
		id = 401,
		f_id = 1004,
		limit_max = 625,
		is_hot = 0,
		award = {
			{
				10454,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[402] = {
		price = 450,
		name = "强者招募令",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 402,
		f_id = 1004,
		limit_max = 450,
		is_hot = 0,
		award = {
			{
				14001,
				6
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[403] = {
		price = 100,
		name = "高级召唤卷",
		limit_min = 100,
		pro = 100,
		limit_role_max = 100,
		id = 403,
		f_id = 1004,
		limit_max = 100,
		is_hot = 0,
		award = {
			{
				10403,
				10
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[404] = {
		price = 160,
		name = "强化训练",
		limit_min = 160,
		pro = 100,
		limit_role_max = 160,
		id = 404,
		f_id = 1004,
		limit_max = 160,
		is_hot = 0,
		award = {
			{
				10450,
				5000
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[405] = {
		price = 150,
		name = "5星随机碎片",
		limit_min = 150,
		pro = 100,
		limit_role_max = 150,
		id = 405,
		f_id = 1004,
		limit_max = 150,
		is_hot = 0,
		award = {
			{
				29905,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[406] = {
		price = 180,
		name = "强者招募令",
		limit_min = 180,
		pro = 100,
		limit_role_max = 180,
		id = 406,
		f_id = 1004,
		limit_max = 180,
		is_hot = 0,
		award = {
			{
				14001,
				3
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[407] = {
		price = 200,
		name = "高级召唤卷",
		limit_min = 200,
		pro = 100,
		limit_role_max = 200,
		id = 407,
		f_id = 1004,
		limit_max = 200,
		is_hot = 0,
		award = {
			{
				10403,
				20
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[408] = {
		price = 100,
		name = "强化训练",
		limit_min = 100,
		pro = 100,
		limit_role_max = 100,
		id = 408,
		f_id = 1004,
		limit_max = 100,
		is_hot = 0,
		award = {
			{
				10450,
				3000
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[409] = {
		price = 140,
		name = "高级寻宝券",
		limit_min = 140,
		pro = 100,
		limit_role_max = 140,
		id = 409,
		f_id = 1004,
		limit_max = 140,
		is_hot = 0,
		award = {
			{
				37002,
				5
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[410] = {
		price = 300,
		name = "5星海军皇团英雄碎片",
		limit_min = 300,
		pro = 50,
		limit_role_max = 300,
		id = 410,
		f_id = 1004,
		limit_max = 300,
		is_hot = 1,
		award = {
			{
				29906,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[501] = {
		price = 90,
		name = "强者招募令",
		limit_min = 90,
		pro = 100,
		limit_role_max = 90,
		id = 501,
		f_id = 1005,
		limit_max = 90,
		is_hot = 0,
		award = {
			{
				14001,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[502] = {
		price = 12,
		name = "高级召唤卷",
		limit_min = 12,
		pro = 100,
		limit_role_max = 12,
		id = 502,
		f_id = 1005,
		limit_max = 12,
		is_hot = 0,
		award = {
			{
				10403,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[503] = {
		price = 30,
		name = "5星随机碎片",
		limit_min = 30,
		pro = 100,
		limit_role_max = 30,
		id = 503,
		f_id = 1005,
		limit_max = 30,
		is_hot = 0,
		award = {
			{
				29905,
				10
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[504] = {
		price = 90,
		name = "强者招募令",
		limit_min = 90,
		pro = 100,
		limit_role_max = 90,
		id = 504,
		f_id = 1005,
		limit_max = 90,
		is_hot = 0,
		award = {
			{
				14001,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[505] = {
		price = 12,
		name = "高级召唤卷",
		limit_min = 12,
		pro = 100,
		limit_role_max = 12,
		id = 505,
		f_id = 1005,
		limit_max = 12,
		is_hot = 0,
		award = {
			{
				10403,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[506] = {
		price = 30,
		name = "强化训练",
		limit_min = 30,
		pro = 100,
		limit_role_max = 30,
		id = 506,
		f_id = 1005,
		limit_max = 30,
		is_hot = 0,
		award = {
			{
				10450,
				1000
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[507] = {
		price = 35,
		name = "高级寻宝券",
		limit_min = 35,
		pro = 100,
		limit_role_max = 35,
		id = 507,
		f_id = 1005,
		limit_max = 35,
		is_hot = 0,
		award = {
			{
				37002,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[508] = {
		price = 10,
		name = "寻宝券",
		limit_min = 10,
		pro = 100,
		limit_role_max = 10,
		id = 508,
		f_id = 1005,
		limit_max = 10,
		is_hot = 0,
		award = {
			{
				37001,
				10
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[509] = {
		price = 60,
		name = "自选信物",
		limit_min = 60,
		pro = 100,
		limit_role_max = 60,
		id = 509,
		f_id = 1005,
		limit_max = 60,
		is_hot = 0,
		award = {
			{
				39158,
				20
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[510] = {
		price = 50,
		name = "皮肤碎片",
		limit_min = 50,
		pro = 100,
		limit_role_max = 50,
		id = 510,
		f_id = 1005,
		limit_max = 50,
		is_hot = 0,
		award = {
			{
				29,
				20
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[511] = {
		price = 20,
		name = "快速作战券",
		limit_min = 20,
		pro = 100,
		limit_role_max = 20,
		id = 511,
		f_id = 1005,
		limit_max = 20,
		is_hot = 0,
		award = {
			{
				10004,
				2
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[701] = {
		price = 700,
		name = "卡塔库栗碎片",
		limit_min = 700,
		pro = 50,
		limit_role_max = 700,
		id = 701,
		f_id = 1007,
		limit_max = 700,
		is_hot = 1,
		award = {
			{
				28910,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[702] = {
		price = 700,
		name = "藤虎碎片",
		limit_min = 700,
		pro = 50,
		limit_role_max = 700,
		id = 702,
		f_id = 1007,
		limit_max = 700,
		is_hot = 1,
		award = {
			{
				27910,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[703] = {
		price = 700,
		name = "香克斯碎片",
		limit_min = 700,
		pro = 50,
		limit_role_max = 700,
		id = 703,
		f_id = 1007,
		limit_max = 700,
		is_hot = 1,
		award = {
			{
				28903,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[704] = {
		price = 700,
		name = "路飞(新世界)",
		limit_min = 700,
		pro = 50,
		limit_role_max = 700,
		id = 704,
		f_id = 1007,
		limit_max = 700,
		is_hot = 1,
		award = {
			{
				28908,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[705] = {
		price = 600,
		name = "黄猿碎片",
		limit_min = 600,
		pro = 50,
		limit_role_max = 600,
		id = 705,
		f_id = 1007,
		limit_max = 600,
		is_hot = 1,
		award = {
			{
				27902,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[706] = {
		price = 700,
		name = "麦哲伦碎片",
		limit_min = 700,
		pro = 50,
		limit_role_max = 700,
		id = 706,
		f_id = 1007,
		limit_max = 700,
		is_hot = 1,
		award = {
			{
				27908,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[707] = {
		price = 700,
		name = "卡普碎片",
		limit_min = 700,
		pro = 50,
		limit_role_max = 700,
		id = 707,
		f_id = 1007,
		limit_max = 700,
		is_hot = 1,
		award = {
			{
				27903,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[708] = {
		price = 700,
		name = "赤犬碎片",
		limit_min = 700,
		pro = 50,
		limit_role_max = 700,
		id = 708,
		f_id = 1007,
		limit_max = 700,
		is_hot = 1,
		award = {
			{
				27909,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[709] = {
		price = 600,
		name = "马尔科碎片",
		limit_min = 600,
		pro = 50,
		limit_role_max = 600,
		id = 709,
		f_id = 1007,
		limit_max = 600,
		is_hot = 1,
		award = {
			{
				28909,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[710] = {
		price = 600,
		name = "战国碎片",
		limit_min = 600,
		pro = 50,
		limit_role_max = 600,
		id = 710,
		f_id = 1007,
		limit_max = 600,
		is_hot = 1,
		award = {
			{
				27907,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[711] = {
		price = 600,
		name = "鹤碎片",
		limit_min = 600,
		pro = 50,
		limit_role_max = 600,
		id = 711,
		f_id = 1007,
		limit_max = 600,
		is_hot = 1,
		award = {
			{
				27906,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[712] = {
		price = 600,
		name = "白胡子碎片",
		limit_min = 600,
		pro = 50,
		limit_role_max = 600,
		id = 712,
		f_id = 1007,
		limit_max = 600,
		is_hot = 1,
		award = {
			{
				28907,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[601] = {
		price = 2000,
		name = "BIG·MOM碎片",
		limit_min = 2000,
		pro = 200,
		limit_role_max = 2000,
		id = 601,
		f_id = 1006,
		limit_max = 2000,
		is_hot = 1,
		award = {
			{
				28912,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[602] = {
		price = 1000,
		name = "凯多碎片",
		limit_min = 1000,
		pro = 100,
		limit_role_max = 1000,
		id = 602,
		f_id = 1006,
		limit_max = 1000,
		is_hot = 1,
		award = {
			{
				28911,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[603] = {
		price = 1000,
		name = "泽法碎片",
		limit_min = 1000,
		pro = 100,
		limit_role_max = 1000,
		id = 603,
		f_id = 1006,
		limit_max = 1000,
		is_hot = 0,
		award = {
			{
				27911,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[604] = {
		price = 4000,
		name = "10星英魂",
		limit_min = 4000,
		pro = 50,
		limit_role_max = 4000,
		id = 604,
		f_id = 1006,
		limit_max = 4000,
		is_hot = 1,
		award = {
			{
				91000,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[605] = {
		price = 2000,
		name = "9星英魂",
		limit_min = 2000,
		pro = 100,
		limit_role_max = 2000,
		id = 605,
		f_id = 1006,
		limit_max = 2000,
		is_hot = 1,
		award = {
			{
				90900,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[801] = {
		price = 550,
		name = "艾斯（魂）碎片",
		limit_min = 550,
		pro = 50,
		limit_role_max = 550,
		id = 801,
		f_id = 1008,
		limit_max = 550,
		is_hot = 1,
		award = {
			{
				28909,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[802] = {
		price = 500,
		name = "黑胡子(新世界)碎片",
		limit_min = 500,
		pro = 50,
		limit_role_max = 500,
		id = 802,
		f_id = 1008,
		limit_max = 500,
		is_hot = 1,
		award = {
			{
				28904,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[803] = {
		price = 500,
		name = "巴杰斯碎片",
		limit_min = 500,
		pro = 50,
		limit_role_max = 500,
		id = 803,
		f_id = 1008,
		limit_max = 500,
		is_hot = 1,
		award = {
			{
				28902,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[804] = {
		price = 400,
		name = "雨之希留碎片",
		limit_min = 450,
		pro = 50,
		limit_role_max = 450,
		id = 804,
		f_id = 1008,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				28905,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[805] = {
		price = 500,
		name = "冥王雷利碎片",
		limit_min = 500,
		pro = 50,
		limit_role_max = 500,
		id = 805,
		f_id = 1008,
		limit_max = 500,
		is_hot = 1,
		award = {
			{
				28901,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[806] = {
		price = 500,
		name = "索隆(新世界)碎片",
		limit_min = 500,
		pro = 50,
		limit_role_max = 500,
		id = 806,
		f_id = 1008,
		limit_max = 500,
		is_hot = 1,
		award = {
			{
				28900,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[807] = {
		price = 500,
		name = "青雉碎片",
		limit_min = 500,
		pro = 50,
		limit_role_max = 500,
		id = 807,
		f_id = 1008,
		limit_max = 500,
		is_hot = 1,
		award = {
			{
				27905,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[808] = {
		price = 400,
		name = "斯摩格碎片",
		limit_min = 450,
		pro = 50,
		limit_role_max = 450,
		id = 808,
		f_id = 1008,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				27904,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[809] = {
		price = 500,
		name = "战桃丸碎片",
		limit_min = 500,
		pro = 50,
		limit_role_max = 500,
		id = 809,
		f_id = 1008,
		limit_max = 500,
		is_hot = 1,
		award = {
			{
				27901,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[810] = {
		price = 400,
		name = "路奇碎片",
		limit_min = 450,
		pro = 50,
		limit_role_max = 450,
		id = 810,
		f_id = 1008,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				27900,
				50
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[901] = {
		price = 800,
		name = "海军皇团全英雄自选",
		limit_min = 800,
		pro = 50,
		limit_role_max = 800,
		id = 901,
		f_id = 1009,
		limit_max = 800,
		is_hot = 1,
		award = {
			{
				39183,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[902] = {
		price = 450,
		name = "三系全英雄自选",
		limit_min = 450,
		pro = 100,
		limit_role_max = 450,
		id = 902,
		f_id = 1009,
		limit_max = 450,
		is_hot = 1,
		award = {
			{
				39182,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[1001] = {
		price = 625,
		name = "超级战技",
		limit_min = 625,
		pro = 50,
		limit_role_max = 625,
		id = 1001,
		f_id = 1010,
		limit_max = 625,
		is_hot = 1,
		award = {
			{
				10454,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[1002] = {
		price = 600,
		name = "橙色幽灵自选",
		limit_min = 600,
		pro = 50,
		limit_role_max = 600,
		id = 1002,
		f_id = 1010,
		limit_max = 600,
		is_hot = 1,
		award = {
			{
				39056,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[1003] = {
		price = 200,
		name = "传说灵碑",
		limit_min = 200,
		pro = 50,
		limit_role_max = 200,
		id = 1003,
		f_id = 1010,
		limit_max = 200,
		is_hot = 1,
		award = {
			{
				10603,
				5
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[1004] = {
		price = 600,
		name = "传说皮肤自选",
		limit_min = 600,
		pro = 50,
		limit_role_max = 600,
		id = 1004,
		f_id = 1010,
		limit_max = 600,
		is_hot = 1,
		award = {
			{
				39196,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[1005] = {
		price = 400,
		name = "史诗皮肤自选",
		limit_min = 400,
		pro = 50,
		limit_role_max = 400,
		id = 1005,
		f_id = 1010,
		limit_max = 400,
		is_hot = 1,
		award = {
			{
				39195,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[1006] = {
		price = 800,
		name = "5星极品神装自选",
		limit_min = 800,
		pro = 50,
		limit_role_max = 800,
		id = 1006,
		f_id = 1010,
		limit_max = 800,
		is_hot = 1,
		award = {
			{
				39523,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[1007] = {
		price = 200,
		name = "能力觉醒纹石",
		limit_min = 200,
		pro = 50,
		limit_role_max = 200,
		id = 1007,
		f_id = 1010,
		limit_max = 200,
		is_hot = 1,
		award = {
			{
				10090,
				5
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	},
	[1008] = {
		price = 100,
		name = "稀有符石自选",
		limit_min = 100,
		pro = 50,
		limit_role_max = 100,
		id = 1008,
		f_id = 1010,
		limit_max = 100,
		is_hot = 1,
		award = {
			{
				39082,
				1
			}
		},
		expend = {
			{
				37006,
				1
			}
		}
	}
}

function Config.HolidaySnatchData.data_join_goods_list_fun(slot0)
	slot1 = Config.HolidaySnatchData.data_join_goods_list[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidaySnatchData.data_join_goods_list[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
