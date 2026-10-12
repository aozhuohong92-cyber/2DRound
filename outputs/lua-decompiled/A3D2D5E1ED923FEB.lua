Config = Config or {}
Config.SummonData = Config.SummonData or {}
Config.SummonData.data_summon_const_length = 16
Config.SummonData.data_summon_const = {
	common_s = {
		val = 10200,
		code = "common_s",
		type = "普通召唤道具ID"
	},
	senior_s = {
		val = 10201,
		code = "senior_s",
		type = "高级召唤道具ID"
	},
	common_time = {
		val = 5,
		code = "common_time",
		type = "普通召唤每天免费次数"
	},
	c_interval = {
		val = 600,
		code = "c_interval",
		type = "普通召唤免费次数间隔/s"
	},
	s_interval = {
		val = 86400,
		code = "s_interval",
		type = "高级召唤免费间隔/s"
	},
	s_gold = {
		val = 300,
		code = "s_gold",
		type = "高级召唤钻石消耗"
	},
	senior_ten_gold = {
		val = 2700,
		code = "senior_ten_gold",
		type = "高级钻石十连价格"
	},
	common_reward_time = {
		val = 50,
		code = "common_reward_time",
		type = "普通每召唤X次领取宝箱"
	},
	common_reward = {
		code = "common_reward",
		type = "普通宝箱奖励",
		val = {
			{
				10211,
				1,
				200
			},
			{
				10210,
				2,
				450
			},
			{
				10300,
				5,
				350
			}
		}
	},
	senior_reward_time = {
		val = 10,
		code = "senior_reward_time",
		type = "高级召唤每召唤X次领取宝箱"
	},
	senior_reward = {
		code = "senior_reward",
		type = "高级宝箱奖励",
		val = {
			{
				10213,
				1,
				300
			},
			{
				10212,
				1,
				400
			},
			{
				10301,
				5,
				400
			}
		}
	},
	common_soul = {
		val = 20,
		code = "common_soul",
		type = "普通召唤单次获得友好值"
	},
	senior_soul = {
		val = 100,
		code = "senior_soul",
		type = "高级召唤单次获得友好值"
	},
	senior_three = {
		val = 10220,
		code = "senior_three",
		type = "3星召唤书ID"
	},
	senior_three_hero = {
		code = "senior_three_hero",
		type = "3星召唤书召唤库",
		val = {
			{
				30002,
				100
			},
			{
				30003,
				100
			},
			{
				30005,
				100
			},
			{
				30006,
				50
			},
			{
				30007,
				50
			},
			{
				30009,
				80
			},
			{
				30012,
				100
			},
			{
				30014,
				100
			},
			{
				30015,
				100
			},
			{
				30016,
				50
			},
			{
				30017,
				100
			},
			{
				30018,
				100
			},
			{
				30019,
				100
			},
			{
				30021,
				100
			},
			{
				30022,
				100
			},
			{
				30023,
				50
			},
			{
				30024,
				50
			},
			{
				30025,
				50
			}
		}
	},
	tips = {
		val = 0,
		code = "tips",
		type = [[
英雄出现概率:
1.高级召唤书抽到2星，3星英雄的概率分别为：2星10%，3星5%;
2.钻石抽到2星，3星英雄的概率分别为：2星10%，3星5%
3.普通召唤书抽到1星概率分别为：1星5%]]
	}
}
Config.SummonData.data_normal_data_length = 2
Config.SummonData.data_normal_data = {
	{
		{
			partner_id = 20020,
			name = "战桃丸碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20021,
			name = "基德碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20022,
			name = "冥王雷利碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20024,
			name = "鳄鱼碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20025,
			name = "斯摩格碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20026,
			name = "黑胡子(新世界)碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20027,
			name = "艾斯碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20028,
			name = "伊万科夫碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20031,
			name = "弗兰奇米迦勒碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20032,
			name = "雨之希留碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20033,
			name = "霍古巴克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20034,
			name = "加布拉碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20035,
			name = "猫头鹰碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20036,
			name = "兽人剑圣碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20037,
			name = "德雷克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20038,
			name = "布鲁克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20039,
			name = "Mr.双手指碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20040,
			name = "闪电碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20041,
			name = "韦伯碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20042,
			name = "青雉碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20043,
			name = "暴君熊碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20081,
			name = "黄猿碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20085,
			name = "娜美(伟大航路)碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 103
		},
		{
			partner_id = 20044,
			name = "汉尼拔碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20045,
			name = "库德兰·鹰眼碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20046,
			name = "巴里碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20047,
			name = "布鲁诺碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20048,
			name = "冯克雷碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20049,
			name = "阿龙碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20050,
			name = "玛格丽特碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20051,
			name = "僵尸1号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20052,
			name = "幽冥公主碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20053,
			name = "大悟碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20054,
			name = "卡巴奇碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20055,
			name = "索隆碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20056,
			name = "小八碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20057,
			name = "鱼人3号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20058,
			name = "Mr.3碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20059,
			name = "Mr.情人节碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20060,
			name = "海贼11号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20061,
			name = "海贼8号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20062,
			name = "憎恶碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20063,
			name = "阿布萨罗姆碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20064,
			name = "末日守卫碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20065,
			name = "背叛魔女碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20066,
			name = "岩石傀儡碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20067,
			name = "海贼13号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20068,
			name = "瓦尔波碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20069,
			name = "海贼9号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20070,
			name = "鱼人1号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 104
		},
		{
			partner_id = 20071,
			name = "修罗碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 105
		},
		{
			partner_id = 20072,
			name = "娜美碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 105
		},
		{
			partner_id = 20073,
			name = "吉尔伽美什碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 105
		},
		{
			partner_id = 20074,
			name = "克利克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 105
		},
		{
			partner_id = 20075,
			name = "海贼12号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 105
		},
		{
			partner_id = 20077,
			name = "海军2号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 105
		},
		{
			partner_id = 20078,
			name = "海贼14号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 105
		},
		{
			partner_id = 20079,
			name = "女巫碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 105
		},
		{
			partner_id = 20080,
			name = "海贼3号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 105
		},
		{
			partner_id = 10600,
			name = "元素宝典",
			rare_type = 1,
			limit_lev = 1,
			id = 109
		},
		{
			partner_id = 10601,
			name = "元素宝典+1",
			rare_type = 1,
			limit_lev = 16,
			id = 109
		},
		{
			partner_id = 10602,
			name = "元素宝典+2",
			rare_type = 1,
			limit_lev = 21,
			id = 109
		},
		{
			partner_id = 10650,
			name = "平凡水晶",
			rare_type = 1,
			limit_lev = 1,
			id = 109
		},
		{
			partner_id = 10651,
			name = "奥术水晶",
			rare_type = 1,
			limit_lev = 1,
			id = 109
		},
		{
			partner_id = 10652,
			name = "璀璨水晶",
			rare_type = 1,
			limit_lev = 16,
			id = 109
		},
		{
			partner_id = 10653,
			name = "璀璨水晶+1",
			rare_type = 1,
			limit_lev = 21,
			id = 109
		},
		{
			partner_id = 10654,
			name = "璀璨水晶+2",
			rare_type = 1,
			limit_lev = 26,
			id = 109
		},
		{
			partner_id = 10700,
			name = "朴素丝绸",
			rare_type = 1,
			limit_lev = 1,
			id = 109
		},
		{
			partner_id = 10701,
			name = "华丽丝绸",
			rare_type = 1,
			limit_lev = 1,
			id = 109
		},
		{
			partner_id = 10702,
			name = "奥术丝绸",
			rare_type = 1,
			limit_lev = 16,
			id = 109
		},
		{
			partner_id = 10703,
			name = "奥术丝绸+1",
			rare_type = 1,
			limit_lev = 21,
			id = 109
		},
		{
			partner_id = 10704,
			name = "奥术丝绸+2",
			rare_type = 1,
			limit_lev = 26,
			id = 109
		},
		{
			partner_id = 10750,
			name = "黑铁矿石",
			rare_type = 1,
			limit_lev = 1,
			id = 109
		},
		{
			partner_id = 10751,
			name = "青铜矿石",
			rare_type = 1,
			limit_lev = 1,
			id = 109
		},
		{
			partner_id = 10752,
			name = "白银矿石",
			rare_type = 1,
			limit_lev = 16,
			id = 109
		},
		{
			partner_id = 10753,
			name = "白银矿石+1",
			rare_type = 1,
			limit_lev = 21,
			id = 109
		},
		{
			partner_id = 10754,
			name = "白银矿石+2",
			rare_type = 1,
			limit_lev = 26,
			id = 109
		},
		{
			partner_id = 10800,
			name = "微光精华",
			rare_type = 1,
			limit_lev = 1,
			id = 109
		},
		{
			partner_id = 10801,
			name = "幻影精华",
			rare_type = 1,
			limit_lev = 1,
			id = 109
		},
		{
			partner_id = 10802,
			name = "秘法精华",
			rare_type = 1,
			limit_lev = 16,
			id = 109
		},
		{
			partner_id = 10803,
			name = "秘法精华+1",
			rare_type = 1,
			limit_lev = 21,
			id = 109
		},
		{
			partner_id = 10804,
			name = "秘法精华+2",
			rare_type = 1,
			limit_lev = 26,
			id = 109
		},
		[20020] = {
			partner_id = 20020,
			name = "战桃丸碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20021] = {
			partner_id = 20021,
			name = "基德碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20022] = {
			partner_id = 20022,
			name = "冥王雷利碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20024] = {
			partner_id = 20024,
			name = "鳄鱼碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20025] = {
			partner_id = 20025,
			name = "斯摩格碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20026] = {
			partner_id = 20026,
			name = "黑胡子(新世界)碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20027] = {
			partner_id = 20027,
			name = "艾斯碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20028] = {
			partner_id = 20028,
			name = "伊万科夫碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20031] = {
			partner_id = 20031,
			name = "弗兰奇米迦勒碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20032] = {
			partner_id = 20032,
			name = "雨之希留碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20033] = {
			partner_id = 20033,
			name = "霍古巴克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20034] = {
			partner_id = 20034,
			name = "加布拉碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20035] = {
			partner_id = 20035,
			name = "猫头鹰碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20036] = {
			partner_id = 20036,
			name = "兽人剑圣碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20037] = {
			partner_id = 20037,
			name = "德雷克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20038] = {
			partner_id = 20038,
			name = "布鲁克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20039] = {
			partner_id = 20039,
			name = "Mr.双手指碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20040] = {
			partner_id = 20040,
			name = "闪电碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20041] = {
			partner_id = 20041,
			name = "韦伯碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20042] = {
			partner_id = 20042,
			name = "青雉碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20043] = {
			partner_id = 20043,
			name = "暴君熊碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20081] = {
			partner_id = 20081,
			name = "黄猿碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20085] = {
			partner_id = 20085,
			name = "娜美(伟大航路)碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20044] = {
			partner_id = 20044,
			name = "汉尼拔碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20045] = {
			partner_id = 20045,
			name = "库德兰·鹰眼碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20046] = {
			partner_id = 20046,
			name = "巴里碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20047] = {
			partner_id = 20047,
			name = "布鲁诺碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20048] = {
			partner_id = 20048,
			name = "冯克雷碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20049] = {
			partner_id = 20049,
			name = "阿龙碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20050] = {
			partner_id = 20050,
			name = "玛格丽特碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20051] = {
			partner_id = 20051,
			name = "僵尸1号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20052] = {
			partner_id = 20052,
			name = "幽冥公主碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20053] = {
			partner_id = 20053,
			name = "大悟碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20054] = {
			partner_id = 20054,
			name = "卡巴奇碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20055] = {
			partner_id = 20055,
			name = "索隆碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20056] = {
			partner_id = 20056,
			name = "小八碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20057] = {
			partner_id = 20057,
			name = "鱼人3号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20058] = {
			partner_id = 20058,
			name = "Mr.3碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20059] = {
			partner_id = 20059,
			name = "Mr.情人节碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20060] = {
			partner_id = 20060,
			name = "海贼11号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20061] = {
			partner_id = 20061,
			name = "海贼8号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20062] = {
			partner_id = 20062,
			name = "憎恶碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20063] = {
			partner_id = 20063,
			name = "阿布萨罗姆碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20064] = {
			partner_id = 20064,
			name = "末日守卫碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20065] = {
			partner_id = 20065,
			name = "背叛魔女碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20066] = {
			partner_id = 20066,
			name = "岩石傀儡碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20067] = {
			partner_id = 20067,
			name = "海贼13号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20068] = {
			partner_id = 20068,
			name = "瓦尔波碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20069] = {
			partner_id = 20069,
			name = "海贼9号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20070] = {
			partner_id = 20070,
			name = "鱼人1号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 107
		},
		[20071] = {
			partner_id = 20071,
			name = "修罗碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 108
		},
		[20072] = {
			partner_id = 20072,
			name = "娜美碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 108
		},
		[20073] = {
			partner_id = 20073,
			name = "吉尔伽美什碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 108
		},
		[20074] = {
			partner_id = 20074,
			name = "克利克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 108
		},
		[20075] = {
			partner_id = 20075,
			name = "海贼12号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 108
		},
		[20077] = {
			partner_id = 20077,
			name = "海军2号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 108
		},
		[20078] = {
			partner_id = 20078,
			name = "海贼14号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 108
		},
		[20079] = {
			partner_id = 20079,
			name = "女巫碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 108
		},
		[20080] = {
			partner_id = 20080,
			name = "海贼3号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 108
		},
		[20023] = {
			partner_id = 20023,
			name = "萨博（火拳）碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[20029] = {
			partner_id = 20029,
			name = "乌索普碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 106
		},
		[10600] = {
			partner_id = 10600,
			name = "元素宝典",
			rare_type = 1,
			limit_lev = 1,
			id = 110
		},
		[10601] = {
			partner_id = 10601,
			name = "元素宝典+1",
			rare_type = 1,
			limit_lev = 16,
			id = 110
		},
		[10602] = {
			partner_id = 10602,
			name = "元素宝典+2",
			rare_type = 1,
			limit_lev = 21,
			id = 110
		},
		[10650] = {
			partner_id = 10650,
			name = "平凡水晶",
			rare_type = 1,
			limit_lev = 1,
			id = 110
		},
		[10651] = {
			partner_id = 10651,
			name = "奥术水晶",
			rare_type = 1,
			limit_lev = 1,
			id = 110
		},
		[10652] = {
			partner_id = 10652,
			name = "璀璨水晶",
			rare_type = 1,
			limit_lev = 16,
			id = 110
		},
		[10653] = {
			partner_id = 10653,
			name = "璀璨水晶+1",
			rare_type = 1,
			limit_lev = 21,
			id = 110
		},
		[10654] = {
			partner_id = 10654,
			name = "璀璨水晶+2",
			rare_type = 1,
			limit_lev = 26,
			id = 110
		},
		[10700] = {
			partner_id = 10700,
			name = "朴素丝绸",
			rare_type = 1,
			limit_lev = 1,
			id = 110
		},
		[10701] = {
			partner_id = 10701,
			name = "华丽丝绸",
			rare_type = 1,
			limit_lev = 1,
			id = 110
		},
		[10702] = {
			partner_id = 10702,
			name = "奥术丝绸",
			rare_type = 1,
			limit_lev = 16,
			id = 110
		},
		[10703] = {
			partner_id = 10703,
			name = "奥术丝绸+1",
			rare_type = 1,
			limit_lev = 21,
			id = 110
		},
		[10704] = {
			partner_id = 10704,
			name = "奥术丝绸+2",
			rare_type = 1,
			limit_lev = 26,
			id = 110
		},
		[10750] = {
			partner_id = 10750,
			name = "黑铁矿石",
			rare_type = 1,
			limit_lev = 1,
			id = 110
		},
		[10751] = {
			partner_id = 10751,
			name = "青铜矿石",
			rare_type = 1,
			limit_lev = 1,
			id = 110
		},
		[10752] = {
			partner_id = 10752,
			name = "白银矿石",
			rare_type = 1,
			limit_lev = 16,
			id = 110
		},
		[10753] = {
			partner_id = 10753,
			name = "白银矿石+1",
			rare_type = 1,
			limit_lev = 21,
			id = 110
		},
		[10754] = {
			partner_id = 10754,
			name = "白银矿石+2",
			rare_type = 1,
			limit_lev = 26,
			id = 110
		},
		[10800] = {
			partner_id = 10800,
			name = "微光精华",
			rare_type = 1,
			limit_lev = 1,
			id = 110
		},
		[10801] = {
			partner_id = 10801,
			name = "幻影精华",
			rare_type = 1,
			limit_lev = 1,
			id = 110
		},
		[10802] = {
			partner_id = 10802,
			name = "秘法精华",
			rare_type = 1,
			limit_lev = 16,
			id = 110
		},
		[10803] = {
			partner_id = 10803,
			name = "秘法精华+1",
			rare_type = 1,
			limit_lev = 21,
			id = 110
		},
		[10804] = {
			partner_id = 10804,
			name = "秘法精华+2",
			rare_type = 1,
			limit_lev = 26,
			id = 110
		},
		[10204] = {
			partner_id = 10204,
			name = "低级神魂",
			rare_type = 1,
			limit_lev = 1,
			id = 111
		},
		[10205] = {
			partner_id = 10205,
			name = "中级神魂",
			rare_type = 1,
			limit_lev = 1,
			id = 112
		}
	},
	[2] = {
		[20001] = {
			partner_id = 20001,
			name = "汉尼拔",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20002] = {
			partner_id = 20002,
			name = "库德兰·鹰眼",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20003] = {
			partner_id = 20003,
			name = "巴里",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20004] = {
			partner_id = 20004,
			name = "布鲁诺",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20005] = {
			partner_id = 20005,
			name = "冯克雷",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20006] = {
			partner_id = 20006,
			name = "阿龙",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20007] = {
			partner_id = 20007,
			name = "玛格丽特",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20008] = {
			partner_id = 20008,
			name = "僵尸1号",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20009] = {
			partner_id = 20009,
			name = "幽冥公主",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20010] = {
			partner_id = 20010,
			name = "大悟",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20011] = {
			partner_id = 20011,
			name = "卡巴奇",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20012] = {
			partner_id = 20012,
			name = "索隆",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20013] = {
			partner_id = 20013,
			name = "小八",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20014] = {
			partner_id = 20014,
			name = "鱼人3号",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20015] = {
			partner_id = 20015,
			name = "Mr.3",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20016] = {
			partner_id = 20016,
			name = "Mr.情人节",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20017] = {
			partner_id = 20017,
			name = "海贼11号",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20018] = {
			partner_id = 20018,
			name = "海贼8号",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20019] = {
			partner_id = 20019,
			name = "憎恶",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20020] = {
			partner_id = 20020,
			name = "阿布萨罗姆",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20021] = {
			partner_id = 20021,
			name = "末日守卫",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20022] = {
			partner_id = 20022,
			name = "背叛魔女",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20023] = {
			partner_id = 20023,
			name = "岩石傀儡",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20024] = {
			partner_id = 20024,
			name = "海贼13号",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20025] = {
			partner_id = 20025,
			name = "瓦尔波",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20026] = {
			partner_id = 20026,
			name = "海贼9号",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[20027] = {
			partner_id = 20027,
			name = "鱼人1号",
			rare_type = 2,
			limit_lev = 1,
			id = 101
		},
		[10001] = {
			partner_id = 10001,
			name = "修罗",
			rare_type = 2,
			limit_lev = 1,
			id = 102
		},
		[10002] = {
			partner_id = 10002,
			name = "娜美",
			rare_type = 2,
			limit_lev = 1,
			id = 102
		},
		[10003] = {
			partner_id = 10003,
			name = "吉尔伽美什",
			rare_type = 2,
			limit_lev = 1,
			id = 102
		},
		[10004] = {
			partner_id = 10004,
			name = "克利克",
			rare_type = 2,
			limit_lev = 1,
			id = 102
		},
		[10005] = {
			partner_id = 10005,
			name = "海贼12号",
			rare_type = 2,
			limit_lev = 1,
			id = 102
		},
		[10007] = {
			partner_id = 10007,
			name = "海军2号",
			rare_type = 2,
			limit_lev = 1,
			id = 102
		},
		[10008] = {
			partner_id = 10008,
			name = "海贼14号",
			rare_type = 2,
			limit_lev = 1,
			id = 102
		},
		[10009] = {
			partner_id = 10009,
			name = "女巫",
			rare_type = 2,
			limit_lev = 1,
			id = 102
		},
		[10010] = {
			partner_id = 10010,
			name = "海贼3号",
			rare_type = 2,
			limit_lev = 1,
			id = 102
		}
	}
}
Config.SummonData.data_senior_data_length = 2
Config.SummonData.data_senior_data = {
	{
		{
			partner_id = 20071,
			name = "修罗碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 201
		},
		{
			partner_id = 20072,
			name = "娜美碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 201
		},
		{
			partner_id = 20073,
			name = "吉尔伽美什碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 201
		},
		{
			partner_id = 20074,
			name = "克利克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 201
		},
		{
			partner_id = 20075,
			name = "海贼12号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 201
		},
		{
			partner_id = 20077,
			name = "海军2号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 201
		},
		{
			partner_id = 20078,
			name = "海贼14号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 201
		},
		{
			partner_id = 20079,
			name = "女巫碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 201
		},
		{
			partner_id = 20080,
			name = "海贼3号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 201
		},
		{
			partner_id = 20044,
			name = "汉尼拔碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20045,
			name = "库德兰·鹰眼碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20046,
			name = "巴里碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20047,
			name = "布鲁诺碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20048,
			name = "冯克雷碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20049,
			name = "阿龙碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20050,
			name = "玛格丽特碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20051,
			name = "僵尸1号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20052,
			name = "幽冥公主碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20053,
			name = "大悟碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20054,
			name = "卡巴奇碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20055,
			name = "索隆碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20056,
			name = "小八碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20057,
			name = "鱼人3号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20058,
			name = "Mr.3碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20059,
			name = "Mr.情人节碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20060,
			name = "海贼11号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20061,
			name = "海贼8号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20062,
			name = "憎恶碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20063,
			name = "阿布萨罗姆碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20064,
			name = "末日守卫碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20065,
			name = "背叛魔女碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20066,
			name = "岩石傀儡碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20067,
			name = "海贼13号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20068,
			name = "瓦尔波碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20069,
			name = "海贼9号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20070,
			name = "鱼人1号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 202
		},
		{
			partner_id = 20020,
			name = "战桃丸碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20021,
			name = "基德碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20022,
			name = "冥王雷利碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20023,
			name = "萨博（火拳）碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20024,
			name = "鳄鱼碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20025,
			name = "斯摩格碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20026,
			name = "黑胡子(新世界)碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20027,
			name = "艾斯碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20028,
			name = "伊万科夫碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20031,
			name = "弗兰奇米迦勒碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20032,
			name = "雨之希留碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20033,
			name = "霍古巴克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20034,
			name = "加布拉碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20035,
			name = "猫头鹰碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20036,
			name = "兽人剑圣碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20037,
			name = "德雷克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20038,
			name = "布鲁克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20040,
			name = "闪电碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20041,
			name = "韦伯碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20042,
			name = "青雉碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20043,
			name = "暴君熊碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20081,
			name = "黄猿碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 20085,
			name = "娜美(伟大航路)碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 203
		},
		{
			partner_id = 10206,
			name = "高级神魂",
			rare_type = 1,
			limit_lev = 1,
			id = 210
		},
		{
			partner_id = 10206,
			name = "高级神魂",
			rare_type = 1,
			limit_lev = 1,
			id = 210
		},
		[20071] = {
			partner_id = 20071,
			name = "修罗碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 204
		},
		[20072] = {
			partner_id = 20072,
			name = "娜美碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 204
		},
		[20073] = {
			partner_id = 20073,
			name = "吉尔伽美什碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 204
		},
		[20074] = {
			partner_id = 20074,
			name = "克利克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 204
		},
		[20075] = {
			partner_id = 20075,
			name = "海贼12号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 204
		},
		[20077] = {
			partner_id = 20077,
			name = "海军2号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 204
		},
		[20078] = {
			partner_id = 20078,
			name = "海贼14号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 204
		},
		[20079] = {
			partner_id = 20079,
			name = "女巫碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 204
		},
		[20080] = {
			partner_id = 20080,
			name = "海贼3号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 204
		},
		[20044] = {
			partner_id = 20044,
			name = "汉尼拔碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20045] = {
			partner_id = 20045,
			name = "库德兰·鹰眼碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20046] = {
			partner_id = 20046,
			name = "巴里碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20047] = {
			partner_id = 20047,
			name = "布鲁诺碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20048] = {
			partner_id = 20048,
			name = "冯克雷碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20049] = {
			partner_id = 20049,
			name = "阿龙碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20050] = {
			partner_id = 20050,
			name = "玛格丽特碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20051] = {
			partner_id = 20051,
			name = "僵尸1号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20052] = {
			partner_id = 20052,
			name = "幽冥公主碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20053] = {
			partner_id = 20053,
			name = "大悟碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20054] = {
			partner_id = 20054,
			name = "卡巴奇碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20055] = {
			partner_id = 20055,
			name = "索隆碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20056] = {
			partner_id = 20056,
			name = "小八碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20057] = {
			partner_id = 20057,
			name = "鱼人3号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20058] = {
			partner_id = 20058,
			name = "Mr.3碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20059] = {
			partner_id = 20059,
			name = "Mr.情人节碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20060] = {
			partner_id = 20060,
			name = "海贼11号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20061] = {
			partner_id = 20061,
			name = "海贼8号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20062] = {
			partner_id = 20062,
			name = "憎恶碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20063] = {
			partner_id = 20063,
			name = "阿布萨罗姆碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20064] = {
			partner_id = 20064,
			name = "末日守卫碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20065] = {
			partner_id = 20065,
			name = "背叛魔女碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20066] = {
			partner_id = 20066,
			name = "岩石傀儡碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20067] = {
			partner_id = 20067,
			name = "海贼13号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20068] = {
			partner_id = 20068,
			name = "瓦尔波碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20069] = {
			partner_id = 20069,
			name = "海贼9号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20070] = {
			partner_id = 20070,
			name = "鱼人1号碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 205
		},
		[20020] = {
			partner_id = 20020,
			name = "战桃丸碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20021] = {
			partner_id = 20021,
			name = "基德碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20022] = {
			partner_id = 20022,
			name = "冥王雷利碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20023] = {
			partner_id = 20023,
			name = "萨博（火拳）碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20024] = {
			partner_id = 20024,
			name = "鳄鱼碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20025] = {
			partner_id = 20025,
			name = "斯摩格碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20026] = {
			partner_id = 20026,
			name = "黑胡子(新世界)碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20027] = {
			partner_id = 20027,
			name = "艾斯碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20028] = {
			partner_id = 20028,
			name = "伊万科夫碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20031] = {
			partner_id = 20031,
			name = "弗兰奇米迦勒碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20032] = {
			partner_id = 20032,
			name = "雨之希留碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20033] = {
			partner_id = 20033,
			name = "霍古巴克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20034] = {
			partner_id = 20034,
			name = "加布拉碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20035] = {
			partner_id = 20035,
			name = "猫头鹰碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20036] = {
			partner_id = 20036,
			name = "兽人剑圣碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20037] = {
			partner_id = 20037,
			name = "德雷克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20038] = {
			partner_id = 20038,
			name = "布鲁克碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20040] = {
			partner_id = 20040,
			name = "闪电碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20041] = {
			partner_id = 20041,
			name = "韦伯碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20042] = {
			partner_id = 20042,
			name = "青雉碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20043] = {
			partner_id = 20043,
			name = "暴君熊碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20081] = {
			partner_id = 20081,
			name = "黄猿碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20085] = {
			partner_id = 20085,
			name = "娜美(伟大航路)碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[20039] = {
			partner_id = 20039,
			name = "Mr.双手指碎片",
			rare_type = 1,
			limit_lev = 1,
			id = 206
		},
		[10206] = {
			partner_id = 10206,
			name = "高级神魂",
			rare_type = 1,
			limit_lev = 1,
			id = 210
		}
	},
	{
		[10001] = {
			partner_id = 10001,
			name = "修罗",
			rare_type = 2,
			limit_lev = 1,
			id = 207
		},
		[10002] = {
			partner_id = 10002,
			name = "娜美",
			rare_type = 2,
			limit_lev = 1,
			id = 207
		},
		[10003] = {
			partner_id = 10003,
			name = "吉尔伽美什",
			rare_type = 2,
			limit_lev = 1,
			id = 207
		},
		[10004] = {
			partner_id = 10004,
			name = "克利克",
			rare_type = 2,
			limit_lev = 1,
			id = 207
		},
		[10005] = {
			partner_id = 10005,
			name = "海贼12号",
			rare_type = 2,
			limit_lev = 1,
			id = 207
		},
		[10007] = {
			partner_id = 10007,
			name = "海军2号",
			rare_type = 2,
			limit_lev = 1,
			id = 207
		},
		[10008] = {
			partner_id = 10008,
			name = "海贼14号",
			rare_type = 2,
			limit_lev = 1,
			id = 207
		},
		[10009] = {
			partner_id = 10009,
			name = "女巫",
			rare_type = 2,
			limit_lev = 1,
			id = 207
		},
		[10010] = {
			partner_id = 10010,
			name = "海贼3号",
			rare_type = 2,
			limit_lev = 1,
			id = 207
		},
		[20001] = {
			partner_id = 20001,
			name = "汉尼拔",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20002] = {
			partner_id = 20002,
			name = "库德兰·鹰眼",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20003] = {
			partner_id = 20003,
			name = "巴里",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20004] = {
			partner_id = 20004,
			name = "布鲁诺",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20005] = {
			partner_id = 20005,
			name = "冯克雷",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20006] = {
			partner_id = 20006,
			name = "阿龙",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20007] = {
			partner_id = 20007,
			name = "玛格丽特",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20008] = {
			partner_id = 20008,
			name = "僵尸1号",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20009] = {
			partner_id = 20009,
			name = "幽冥公主",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20010] = {
			partner_id = 20010,
			name = "大悟",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20011] = {
			partner_id = 20011,
			name = "卡巴奇",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20012] = {
			partner_id = 20012,
			name = "索隆",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20013] = {
			partner_id = 20013,
			name = "小八",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20014] = {
			partner_id = 20014,
			name = "鱼人3号",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20015] = {
			partner_id = 20015,
			name = "Mr.3",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20016] = {
			partner_id = 20016,
			name = "Mr.情人节",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20017] = {
			partner_id = 20017,
			name = "海贼11号",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20018] = {
			partner_id = 20018,
			name = "海贼8号",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20019] = {
			partner_id = 20019,
			name = "憎恶",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20020] = {
			partner_id = 20020,
			name = "阿布萨罗姆",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20021] = {
			partner_id = 20021,
			name = "末日守卫",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20022] = {
			partner_id = 20022,
			name = "背叛魔女",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20023] = {
			partner_id = 20023,
			name = "岩石傀儡",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20024] = {
			partner_id = 20024,
			name = "海贼13号",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20025] = {
			partner_id = 20025,
			name = "瓦尔波",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20026] = {
			partner_id = 20026,
			name = "海贼9号",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[20027] = {
			partner_id = 20027,
			name = "鱼人1号",
			rare_type = 2,
			limit_lev = 1,
			id = 208
		},
		[30002] = {
			partner_id = 30002,
			name = "基德",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30003] = {
			partner_id = 30003,
			name = "冥王雷利",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30005] = {
			partner_id = 30005,
			name = "鳄鱼",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30006] = {
			partner_id = 30006,
			name = "斯摩格",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30007] = {
			partner_id = 30007,
			name = "黑胡子(新世界)",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30009] = {
			partner_id = 30009,
			name = "伊万科夫",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30012] = {
			partner_id = 30012,
			name = "弗兰奇米迦勒",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30014] = {
			partner_id = 30014,
			name = "霍古巴克",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30015] = {
			partner_id = 30015,
			name = "加布拉",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30016] = {
			partner_id = 30016,
			name = "猫头鹰",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30017] = {
			partner_id = 30017,
			name = "兽人剑圣",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30018] = {
			partner_id = 30018,
			name = "德雷克",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30019] = {
			partner_id = 30019,
			name = "布鲁克",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30021] = {
			partner_id = 30021,
			name = "闪电",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30022] = {
			partner_id = 30022,
			name = "韦伯",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30023] = {
			partner_id = 30023,
			name = "青雉",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30024] = {
			partner_id = 30024,
			name = "暴君熊",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30025] = {
			partner_id = 30025,
			name = "黄猿",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30029] = {
			partner_id = 30029,
			name = "娜美(伟大航路)",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30020] = {
			partner_id = 30020,
			name = "Mr.双手指",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		},
		[30013] = {
			partner_id = 30013,
			name = "雨之希留",
			rare_type = 2,
			limit_lev = 1,
			id = 209
		}
	}
}
Config.SummonData.data_week_data_length = 1
Config.SummonData.data_week_data = {
	[2] = {
		{
			id = 1,
			limit_id = 10,
			type = 2,
			award_list = {
				{
					10213,
					1
				}
			}
		},
		{
			id = 2,
			limit_id = 30,
			type = 2,
			award_list = {
				{
					10206,
					2
				}
			}
		},
		{
			id = 3,
			limit_id = 60,
			type = 2,
			award_list = {
				{
					10213,
					3
				}
			}
		},
		{
			id = 4,
			limit_id = 100,
			type = 2,
			award_list = {
				{
					10213,
					5
				}
			}
		},
		{
			id = 5,
			limit_id = 150,
			type = 2,
			award_list = {
				{
					10212,
					1
				}
			}
		}
	}
}
Config.SummonData.data_free_list_length = 4
Config.SummonData.data_free_list = {
	[2] = {
		count = 2,
		time = 600
	},
	[3] = {
		count = 3,
		time = 1200
	},
	[4] = {
		count = 4,
		time = 1800
	},
	[5] = {
		count = 5,
		time = 3600
	}
}
