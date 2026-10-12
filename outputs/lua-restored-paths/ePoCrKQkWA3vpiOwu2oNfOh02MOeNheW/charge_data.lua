Config = Config or {}
Config.ChargeData = Config.ChargeData or {}
Config.ChargeData.data_constant_length = 28
Config.ChargeData.data_constant = {
	month_card1_items = {
		key = "month_card1_items",
		id = 0,
		desc = "至尊月卡每日领取",
		val = {
			{
				3,
				200
			}
		}
	},
	month_card2_items = {
		key = "month_card2_items",
		id = 0,
		desc = "荣耀月卡每日领取",
		val = {
			{
				3,
				120
			}
		}
	},
	first_charge = {
		key = "first_charge",
		id = 0,
		desc = "首充奖励",
		val = {
			{
				26059,
				1,
				1
			},
			{
				44201,
				1,
				1
			},
			{
				44401,
				1,
				1
			},
			{
				10801,
				1
			},
			{
				10102,
				1,
				100
			},
			{
				2,
				1,
				100000
			}
		}
	},
	chapter_first_charge = {
		val = 10204,
		key = "chapter_first_charge",
		id = 0,
		desc = "首次弹首充"
	},
	ally_id = {
		val = 50015,
		key = "ally_id",
		id = 0,
		desc = "首次试玩己方场景怪"
	},
	enemy_id = {
		val = 50016,
		key = "enemy_id",
		id = 0,
		desc = "首次试玩敌方场景怪"
	},
	triple_charge_rule = {
		val = 0,
		key = "triple_charge_rule",
		id = 0,
		desc = "1、每次三倍返利机会可让你在下次充值时，额外获得充值钻石数目2倍的红钻；例如充值<div fontsize=24 fontcolor=#289b14>￥648</div>，可额外获得<div fontsize=24 fontcolor=#289b14>6480*2=12960红钻</div>。\n2、荣誉月卡和至尊月卡不计入三倍返利中。\n3、三倍返利状态下，投资计划、月卡不会触发三倍返利"
	},
	month_card1_text = {
		val = 0,
		key = "month_card1_text",
		id = 0,
		desc = "</div></div>"
	},
	month_card2_text = {
		val = 0,
		key = "month_card2_text",
		id = 0,
		desc = "</div></div>"
	},
	month_card1_bag_num = {
		val = 40,
		key = "month_card1_bag_num",
		id = 0,
		desc = "荣耀月卡增加背包数"
	},
	month_card2_bag_num = {
		val = 80,
		key = "month_card2_bag_num",
		id = 0,
		desc = "至尊月卡增加背包数"
	},
	month_card1_return = {
		key = "month_card1_return",
		id = 0,
		desc = "至尊月卡返还",
		val = {
			{
				3,
				6000
			}
		}
	},
	month_card1_cont_day = {
		val = 30,
		key = "month_card1_cont_day",
		id = 0,
		desc = "至尊月卡持续天数"
	},
	month_card1_sun = {
		val = 98,
		key = "month_card1_sun",
		id = 0,
		desc = "至尊月卡充值累计可激活"
	},
	month_card2_return = {
		key = "month_card2_return",
		id = 0,
		desc = "荣耀月卡返还",
		val = {
			{
				3,
				3600
			}
		}
	},
	month_card2_cont_day = {
		val = 30,
		key = "month_card2_cont_day",
		id = 0,
		desc = "荣耀月卡持续天数"
	},
	month_card2_sun = {
		val = 30,
		key = "month_card2_sun",
		id = 0,
		desc = "荣耀月卡充值累计可激活"
	},
	open_lv = {
		val = 6,
		key = "open_lv",
		id = 0,
		desc = "6级开启充值"
	},
	day_gift_gift = {
		key = "day_gift_gift",
		id = 0,
		desc = "每日礼包每日礼",
		val = {
			{
				37001,
				1
			}
		}
	},
	day_charge_goal = {
		val = 180,
		key = "day_charge_goal",
		id = 0,
		desc = "每日首充钻石额度"
	},
	first_charge_new = {
		key = "first_charge_new",
		id = 0,
		desc = "新版每日首冲",
		val = {
			{
				1,
				25400
			},
			{
				2,
				26405
			},
			{
				3,
				24404
			}
		}
	},
	week_gift_charge_sum = {
		val = 100,
		key = "week_gift_charge_sum",
		id = 0,
		desc = "周礼包显示条件金额大于等于X"
	},
	first_charge_invade_id = {
		val = 99938,
		key = "first_charge_invade_id",
		id = 0,
		desc = "耶梦加得首充展示录像的进攻方怪物（unit表）"
	},
	first_charge_defend_id = {
		val = 99939,
		key = "first_charge_defend_id",
		id = 0,
		desc = "耶梦加得首充展示录像的防守方怪物（unit表）"
	},
	charge_time_newchange = {
		key = "charge_time_newchange",
		id = 0,
		desc = "首充利维坦开服时间时间戳（控制新老版区分）",
		val = {
			{
				2020,
				3,
				12
			},
			{
				10,
				30,
				0
			}
		}
	},
	first_charge_invade_new_id = {
		val = 99918,
		key = "first_charge_invade_new_id",
		id = 0,
		desc = "利维坦首充展示录像的进攻方怪物（unit表）"
	},
	first_charge_defend_new_id = {
		val = 99919,
		key = "first_charge_defend_new_id",
		id = 0,
		desc = "利维坦首充展示录像的防守方怪物（unit表）"
	},
	first_charge_ver4_time = {
		key = "first_charge_ver4_time",
		id = 0,
		desc = "第五版首充6元耶梦加得100元利维坦开服时间时间戳（控制新老版区分）",
		val = {
			{
				2020,
				4,
				2
			},
			{
				9,
				59,
				0
			}
		}
	}
}

function Config.ChargeData.data_constant_fun(slot0)
	slot1 = Config.ChargeData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ChargeData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ChargeData.data_charge_data_length = 369
Config.ChargeData.data_charge_data = {
	[3] = {
		val = 6,
		name = "普通充值6",
		add = 0,
		type = 0,
		gold = 60,
		first_add = 60,
		pic = 1,
		is_iosverify = 1,
		sort = 3,
		lose_gold = 0,
		id = 3,
		pay_id = 3,
		vip_exp = 60,
		items = {
			{
				3,
				60
			}
		}
	},
	[4] = {
		val = 30,
		name = "普通充值30",
		add = 58,
		type = 0,
		gold = 300,
		first_add = 300,
		pic = 2,
		is_iosverify = 1,
		sort = 4,
		lose_gold = 0,
		id = 4,
		pay_id = 4,
		vip_exp = 300,
		items = {
			{
				3,
				300
			}
		}
	},
	[5] = {
		val = 98,
		name = "普通充值98",
		add = 198,
		type = 0,
		gold = 980,
		first_add = 980,
		pic = 3,
		is_iosverify = 1,
		sort = 0,
		lose_gold = 0,
		id = 5,
		pay_id = 5,
		vip_exp = 980,
		items = {
			{
				3,
				980
			}
		}
	},
	[6] = {
		val = 198,
		name = "普通充值198",
		add = 398,
		type = 0,
		gold = 1980,
		first_add = 1980,
		pic = 4,
		is_iosverify = 1,
		sort = 7,
		lose_gold = 0,
		id = 6,
		pay_id = 6,
		vip_exp = 1980,
		items = {
			{
				3,
				1980
			}
		}
	},
	[7] = {
		val = 328,
		name = "普通充值328",
		add = 658,
		type = 0,
		gold = 3280,
		first_add = 3280,
		pic = 5,
		is_iosverify = 1,
		sort = 8,
		lose_gold = 0,
		id = 7,
		pay_id = 7,
		vip_exp = 3280,
		items = {
			{
				3,
				3280
			}
		}
	},
	[8] = {
		val = 648,
		name = "普通充值648",
		add = 1298,
		type = 0,
		gold = 6480,
		first_add = 6480,
		pic = 6,
		is_iosverify = 1,
		sort = 9,
		lose_gold = 0,
		id = 8,
		pay_id = 8,
		vip_exp = 6480,
		items = {
			{
				3,
				6480
			}
		}
	},
	[20] = {
		val = 68,
		name = "普通充值68",
		add = 138,
		type = 0,
		gold = 680,
		first_add = 680,
		pic = 3,
		is_iosverify = 1,
		sort = 5,
		lose_gold = 0,
		id = 20,
		pay_id = 20,
		vip_exp = 680,
		items = {
			{
				3,
				680
			}
		}
	},
	[21] = {
		val = 128,
		name = "普通充值128",
		add = 258,
		type = 0,
		gold = 1280,
		first_add = 1280,
		pic = 4,
		is_iosverify = 1,
		sort = 6,
		lose_gold = 0,
		id = 21,
		pay_id = 21,
		vip_exp = 1280,
		items = {
			{
				3,
				1280
			}
		}
	},
	[30001] = {
		val = 3800,
		name = "快乐币20E",
		add = 0,
		type = 0,
		gold = 38,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 1,
		lose_gold = 0,
		id = 30001,
		pay_id = 30001,
		vip_exp = 0,
		items = {
			{
				41,
				2000000000
			}
		}
	},
	[30002] = {
		val = 9600,
		name = "英雄礼包*1套",
		add = 0,
		type = 0,
		gold = 96,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 2,
		lose_gold = 0,
		id = 30002,
		pay_id = 30002,
		vip_exp = 0,
		items = {
			{
				99911,
				1
			}
		}
	},
	[30003] = {
		val = 9700,
		name = "装备礼包*1套",
		add = 0,
		type = 0,
		gold = 97,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 3,
		lose_gold = 0,
		id = 30003,
		pay_id = 30003,
		vip_exp = 0,
		items = {
			{
				99912,
				1
			}
		}
	},
	[30004] = {
		val = 9800,
		name = "神装礼包*1套",
		add = 0,
		type = 0,
		gold = 98,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 4,
		lose_gold = 0,
		id = 30004,
		pay_id = 30004,
		vip_exp = 0,
		items = {
			{
				99913,
				1
			}
		}
	},
	[30005] = {
		val = 9900,
		name = "战技礼包*1套",
		add = 0,
		type = 0,
		gold = 99,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 5,
		lose_gold = 0,
		id = 30005,
		pay_id = 30005,
		vip_exp = 0,
		items = {
			{
				99914,
				1
			}
		}
	},
	[30006] = {
		val = 26600,
		name = "英雄礼包*3套",
		add = 0,
		type = 0,
		gold = 266,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 6,
		lose_gold = 0,
		id = 30006,
		pay_id = 30006,
		vip_exp = 0,
		items = {
			{
				99911,
				3
			}
		}
	},
	[30007] = {
		val = 26700,
		name = "装备礼包*3套",
		add = 0,
		type = 0,
		gold = 267,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 7,
		lose_gold = 0,
		id = 30007,
		pay_id = 30007,
		vip_exp = 0,
		items = {
			{
				99912,
				3
			}
		}
	},
	[30008] = {
		val = 26800,
		name = "神装礼包*3套",
		add = 0,
		type = 0,
		gold = 268,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 8,
		lose_gold = 0,
		id = 30008,
		pay_id = 30008,
		vip_exp = 0,
		items = {
			{
				99913,
				3
			}
		}
	},
	[30009] = {
		val = 26900,
		name = "战技礼包*3套",
		add = 0,
		type = 0,
		gold = 269,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 9,
		lose_gold = 0,
		id = 30009,
		pay_id = 30009,
		vip_exp = 0,
		items = {
			{
				99914,
				3
			}
		}
	},
	[30010] = {
		val = 49600,
		name = "英雄礼包*6套",
		add = 0,
		type = 0,
		gold = 496,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 10,
		lose_gold = 0,
		id = 30010,
		pay_id = 30010,
		vip_exp = 0,
		items = {
			{
				99921,
				1
			}
		}
	},
	[30011] = {
		val = 49700,
		name = "装备礼包*6套",
		add = 0,
		type = 0,
		gold = 497,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 11,
		lose_gold = 0,
		id = 30011,
		pay_id = 30011,
		vip_exp = 0,
		items = {
			{
				99922,
				1
			}
		}
	},
	[30012] = {
		val = 49800,
		name = "神装礼包*6套",
		add = 0,
		type = 0,
		gold = 498,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 12,
		lose_gold = 0,
		id = 30012,
		pay_id = 30012,
		vip_exp = 0,
		items = {
			{
				99923,
				1
			}
		}
	},
	[30013] = {
		val = 49900,
		name = "战技礼包*6套",
		add = 0,
		type = 0,
		gold = 499,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 13,
		lose_gold = 0,
		id = 30013,
		pay_id = 30013,
		vip_exp = 0,
		items = {
			{
				99924,
				1
			}
		}
	},
	[30014] = {
		val = 10100,
		name = "海楼石礼包",
		add = 0,
		type = 0,
		gold = 101,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 14,
		lose_gold = 0,
		id = 30014,
		pay_id = 30014,
		vip_exp = 0,
		items = {
			{
				99899,
				10000
			}
		}
	},
	[30015] = {
		val = 10000,
		name = "贝里经验礼包",
		add = 0,
		type = 0,
		gold = 100,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 15,
		lose_gold = 0,
		id = 30015,
		pay_id = 30015,
		vip_exp = 0,
		items = {
			{
				88889,
				5
			}
		}
	},
	[30016] = {
		val = 1800,
		name = "150W商城币",
		add = 0,
		type = 0,
		gold = 18,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 16,
		lose_gold = 0,
		id = 30016,
		pay_id = 30016,
		vip_exp = 0,
		items = {
			{
				43,
				1500000
			}
		}
	},
	[30017] = {
		val = 5800,
		name = "英雄礼包19星",
		add = 0,
		type = 0,
		gold = 58,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 17,
		lose_gold = 0,
		id = 30017,
		pay_id = 30017,
		vip_exp = 0,
		items = {
			{
				99925,
				1
			}
		}
	},
	[30018] = {
		val = 2800,
		name = "幸运钥匙礼包",
		add = 0,
		type = 0,
		gold = 28,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 18,
		lose_gold = 0,
		id = 30018,
		pay_id = 30018,
		vip_exp = 0,
		items = {
			{
				37003,
				1000
			}
		}
	},
	[30019] = {
		val = 1900,
		name = "精英招募卷礼包",
		add = 0,
		type = 0,
		gold = 19,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 19,
		lose_gold = 0,
		id = 30019,
		pay_id = 30019,
		vip_exp = 0,
		items = {
			{
				10408,
				3000
			}
		}
	},
	[30020] = {
		val = 200000,
		name = "快乐币充值2000",
		add = 0,
		type = 0,
		gold = 2000,
		first_add = 0,
		pic = 1,
		is_iosverify = 1,
		sort = 20,
		lose_gold = 0,
		id = 30020,
		pay_id = 30020,
		vip_exp = 0,
		items = {
			{
				41,
				200000
			}
		}
	},
	[31] = {
		val = 25,
		name = "游戏充值25",
		add = 50,
		type = 0,
		gold = 250,
		first_add = 250,
		pic = 2,
		is_iosverify = 1,
		sort = 13,
		lose_gold = 0,
		id = 31,
		pay_id = 31,
		vip_exp = 250,
		items = {
			{
				3,
				250
			}
		}
	},
	[32] = {
		val = 88,
		name = "游戏充值88",
		add = 176,
		type = 0,
		gold = 880,
		first_add = 880,
		pic = 2,
		is_iosverify = 1,
		sort = 14,
		lose_gold = 0,
		id = 32,
		pay_id = 32,
		vip_exp = 880,
		items = {
			{
				3,
				880
			}
		}
	},
	[33] = {
		val = 258,
		name = "游戏充值258",
		add = 516,
		type = 0,
		gold = 2580,
		first_add = 2580,
		pic = 2,
		is_iosverify = 1,
		sort = 15,
		lose_gold = 0,
		id = 33,
		pay_id = 33,
		vip_exp = 2580,
		items = {
			{
				3,
				2580
			}
		}
	},
	[34] = {
		val = 518,
		name = "游戏充值518",
		add = 1036,
		type = 0,
		gold = 5180,
		first_add = 5180,
		pic = 2,
		is_iosverify = 1,
		sort = 16,
		lose_gold = 0,
		id = 34,
		pay_id = 34,
		vip_exp = 5180,
		items = {
			{
				3,
				5180
			}
		}
	},
	[101] = {
		val = 98,
		name = "成长基金",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 101,
		pay_id = 5,
		vip_exp = 980,
		items = {}
	},
	[102] = {
		val = 128,
		name = "128基金",
		add = 0,
		type = 2,
		gold = 1280,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 102,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[103] = {
		val = 328,
		name = "328基金",
		add = 0,
		type = 2,
		gold = 3280,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 103,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[104] = {
		val = 328,
		name = "328开服皮肤礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 104,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[201] = {
		val = 30,
		name = "5星级养成",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 201,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[202] = {
		val = 68,
		name = "6星级养成",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 202,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[203] = {
		val = 128,
		name = "7星级养成",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 203,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[204] = {
		val = 328,
		name = "8星级养成",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 204,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[205] = {
		val = 328,
		name = "9星级养成",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 205,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[206] = {
		val = 448,
		name = "10星级养成",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 206,
		pay_id = 405,
		vip_exp = 4480,
		items = {}
	},
	[207] = {
		val = 648,
		name = "11星级养成",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 207,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[208] = {
		val = 648,
		name = "12星级养成",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 208,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[209] = {
		val = 648,
		name = "13星级养成",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 209,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[211] = {
		val = 18,
		name = "18等级礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 1,
		sort = 0,
		lose_gold = 0,
		id = 211,
		pay_id = 211,
		vip_exp = 180,
		items = {
			{
				3,
				180
			}
		}
	},
	[212] = {
		val = 68,
		name = "48等级礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 212,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[213] = {
		val = 128,
		name = "68等级礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 213,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[214] = {
		val = 128,
		name = "78等级礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 214,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[215] = {
		val = 328,
		name = "88等级礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 215,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[216] = {
		val = 328,
		name = "98等级礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 216,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[217] = {
		val = 328,
		name = "108等级礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 217,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[218] = {
		val = 448,
		name = "118等级礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 218,
		pay_id = 405,
		vip_exp = 4480,
		items = {}
	},
	[219] = {
		val = 448,
		name = "128等级礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 219,
		pay_id = 405,
		vip_exp = 4480,
		items = {}
	},
	[220] = {
		val = 648,
		name = "138等级礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 220,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[221] = {
		val = 648,
		name = "150等级礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 221,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[301] = {
		val = 1,
		name = "1元礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 1,
		sort = 0,
		lose_gold = 0,
		id = 301,
		pay_id = 301,
		vip_exp = 10,
		items = {
			{
				3,
				10
			}
		}
	},
	[302] = {
		val = 6,
		name = "6元V1礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 302,
		pay_id = 3,
		vip_exp = 60,
		items = {}
	},
	[303] = {
		val = 12,
		name = "12元V2礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 1,
		sort = 0,
		lose_gold = 0,
		id = 303,
		pay_id = 303,
		vip_exp = 120,
		items = {
			{
				3,
				120
			}
		}
	},
	[325] = {
		val = 18,
		name = "每日礼包一键购买",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 1,
		sort = 0,
		lose_gold = 0,
		id = 325,
		pay_id = 211,
		vip_exp = 180,
		items = {}
	},
	[304] = {
		val = 30,
		name = "30先知水晶礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 304,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[305] = {
		val = 68,
		name = "68快速作战礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 305,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[306] = {
		val = 3,
		name = "3元礼包（备用）",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 1,
		sort = 0,
		lose_gold = 0,
		id = 306,
		pay_id = 306,
		vip_exp = 30,
		items = {
			{
				3,
				30
			}
		}
	},
	[307] = {
		val = 30,
		name = "元素圣殿礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 307,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[308] = {
		val = 68,
		name = "68元每日礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 308,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[309] = {
		val = 128,
		name = "128元每日礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 309,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[310] = {
		val = 30,
		name = "30元精灵特权礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 310,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[311] = {
		val = 30,
		name = "30元每日礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 311,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[401] = {
		val = 30,
		name = "30每周常驻礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 401,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[402] = {
		val = 68,
		name = "68每周常驻礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 402,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[403] = {
		val = 128,
		name = "128每周常驻礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 403,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[404] = {
		val = 328,
		name = "328每周常驻礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 404,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[405] = {
		val = 448,
		name = "448每周常驻礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 1,
		sort = 0,
		lose_gold = 0,
		id = 405,
		pay_id = 405,
		vip_exp = 4480,
		items = {
			{
				3,
				4480
			}
		}
	},
	[406] = {
		val = 648,
		name = "648每周常驻礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 406,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[407] = {
		val = 648,
		name = "648周精灵礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 407,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[408] = {
		val = 328,
		name = "328周魂器礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 408,
		pay_id = 8,
		vip_exp = 3280,
		items = {}
	},
	[409] = {
		val = 448,
		name = "448周魂器礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 409,
		pay_id = 8,
		vip_exp = 4480,
		items = {}
	},
	[410] = {
		val = 648,
		name = "648周魂器礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 410,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[430] = {
		val = 648,
		name = "648周魂器礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 430,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[431] = {
		val = 648,
		name = "648周资源礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 431,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[432] = {
		val = 648,
		name = "648周材料礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 432,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[433] = {
		val = 648,
		name = "648周材料礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 433,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[434] = {
		val = 648,
		name = "648周材料礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 434,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[435] = {
		val = 1000,
		name = "1000周礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 435,
		pay_id = 9,
		vip_exp = 10000,
		items = {}
	},
	[436] = {
		val = 648,
		name = "648周材料礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 436,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[437] = {
		val = 648,
		name = "648周信念礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 437,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[438] = {
		val = 648,
		name = "648周信念礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 438,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[439] = {
		val = 648,
		name = "648周信念礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 439,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[440] = {
		val = 648,
		name = "648周信念礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 440,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[441] = {
		val = 648,
		name = "648周节日称号碎片",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 441,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[442] = {
		val = 648,
		name = "648周节日称号碎片",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 442,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[443] = {
		val = 648,
		name = "648周节日称号碎片",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 443,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[411] = {
		val = 30,
		name = "30月度常驻礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 411,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[412] = {
		val = 68,
		name = "68月度常驻礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 412,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[413] = {
		val = 128,
		name = "128月度常驻礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 413,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[414] = {
		val = 328,
		name = "328月度常驻礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 414,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[415] = {
		val = 448,
		name = "448月度常驻礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 415,
		pay_id = 405,
		vip_exp = 4480,
		items = {}
	},
	[416] = {
		val = 648,
		name = "648月度常驻礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 416,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[417] = {
		val = 648,
		name = "648月度常驻礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 417,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[418] = {
		val = 648,
		name = "648月度常驻礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 418,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[419] = {
		val = 648,
		name = "648月度常驻礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 419,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[420] = {
		val = 648,
		name = "648月度常驻礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 420,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[501] = {
		val = 12,
		name = "低档红包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 501,
		pay_id = 303,
		vip_exp = 120,
		items = {}
	},
	[502] = {
		val = 50,
		name = "中档红包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 1,
		sort = 0,
		lose_gold = 0,
		id = 502,
		pay_id = 502,
		vip_exp = 500,
		items = {
			{
				3,
				500
			}
		}
	},
	[503] = {
		val = 648,
		name = "高档红包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 503,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[506] = {
		val = 648,
		name = "最强挑战红包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 506,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[601] = {
		val = 30,
		name = "30元限时礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 601,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[602] = {
		val = 68,
		name = "68元限时礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 602,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[603] = {
		val = 198,
		name = "198元限时礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 603,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[604] = {
		val = 328,
		name = "328元限时礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 604,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[605] = {
		val = 448,
		name = "448元限时礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 605,
		pay_id = 405,
		vip_exp = 4480,
		items = {}
	},
	[606] = {
		val = 648,
		name = "648元限时礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 606,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[607] = {
		val = 648,
		name = "648元光暗限时礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 607,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[608] = {
		val = 328,
		name = "328元天启限时礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 608,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[609] = {
		val = 198,
		name = "198精灵抢购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 609,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[700] = {
		val = 68,
		name = "68元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 700,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[701] = {
		val = 128,
		name = "128元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 701,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[702] = {
		val = 328,
		name = "328元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 702,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[703] = {
		val = 30,
		name = "30元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 703,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[704] = {
		val = 198,
		name = "198元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 704,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[705] = {
		val = 448,
		name = "448元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 705,
		pay_id = 405,
		vip_exp = 4480,
		items = {}
	},
	[706] = {
		val = 648,
		name = "648元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 706,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[707] = {
		val = 12,
		name = "12元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 707,
		pay_id = 303,
		vip_exp = 120,
		items = {}
	},
	[708] = {
		val = 6,
		name = "6元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 708,
		pay_id = 3,
		vip_exp = 60,
		items = {}
	},
	[2200] = {
		val = 68,
		name = "68元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2200,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[2201] = {
		val = 128,
		name = "128元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2201,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[2202] = {
		val = 328,
		name = "328元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2202,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[2203] = {
		val = 30,
		name = "30元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2203,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[2204] = {
		val = 198,
		name = "198元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2204,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[2205] = {
		val = 448,
		name = "448元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2205,
		pay_id = 405,
		vip_exp = 4480,
		items = {}
	},
	[2206] = {
		val = 648,
		name = "648元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2206,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[2207] = {
		val = 12,
		name = "12元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2207,
		pay_id = 303,
		vip_exp = 120,
		items = {}
	},
	[2208] = {
		val = 6,
		name = "6元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2208,
		pay_id = 3,
		vip_exp = 60,
		items = {}
	},
	[3000] = {
		val = 6,
		name = "6元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3000,
		pay_id = 3,
		vip_exp = 60,
		items = {}
	},
	[3001] = {
		val = 12,
		name = "12元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3001,
		pay_id = 303,
		vip_exp = 120,
		items = {}
	},
	[3002] = {
		val = 30,
		name = "30元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3002,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[3003] = {
		val = 68,
		name = "68元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3003,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[3004] = {
		val = 128,
		name = "128元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3004,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[3005] = {
		val = 198,
		name = "198元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3005,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[3006] = {
		val = 328,
		name = "328元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3006,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[3007] = {
		val = 448,
		name = "448元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3007,
		pay_id = 405,
		vip_exp = 4480,
		items = {}
	},
	[3008] = {
		val = 648,
		name = "648元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3008,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[3100] = {
		val = 6,
		name = "6元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3100,
		pay_id = 3,
		vip_exp = 60,
		items = {}
	},
	[3101] = {
		val = 12,
		name = "12元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3101,
		pay_id = 303,
		vip_exp = 120,
		items = {}
	},
	[3102] = {
		val = 30,
		name = "30元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3102,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[3103] = {
		val = 68,
		name = "68元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3103,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[3104] = {
		val = 128,
		name = "128元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3104,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[3105] = {
		val = 198,
		name = "198元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3105,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[3106] = {
		val = 328,
		name = "328元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3106,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[3107] = {
		val = 448,
		name = "448元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3107,
		pay_id = 405,
		vip_exp = 4480,
		items = {}
	},
	[3108] = {
		val = 648,
		name = "648元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 3108,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[710] = {
		val = 18,
		name = "18节日活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 710,
		pay_id = 211,
		vip_exp = 180,
		items = {}
	},
	[711] = {
		val = 50,
		name = "50节日活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 711,
		pay_id = 502,
		vip_exp = 500,
		items = {}
	},
	[715] = {
		val = 128,
		name = "128节日活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 715,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[716] = {
		val = 328,
		name = "328节日活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 716,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[717] = {
		val = 198,
		name = "198节日活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 717,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[718] = {
		val = 98,
		name = "98节日活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 718,
		pay_id = 5,
		vip_exp = 980,
		items = {}
	},
	[719] = {
		val = 648,
		name = "648节日活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 719,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[712] = {
		val = 328,
		name = "328置换商城礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 712,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[713] = {
		val = 648,
		name = "648置换商城礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 713,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[714] = {
		val = 68,
		name = "68周卡礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 714,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[721] = {
		val = 128,
		name = "128元神装限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 721,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[722] = {
		val = 328,
		name = "328元神装限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 722,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[725] = {
		val = 128,
		name = "128元神装超值礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 725,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[726] = {
		val = 198,
		name = "198元神装超值礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 726,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[727] = {
		val = 328,
		name = "328元神装超值礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 727,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[728] = {
		val = 448,
		name = "448元神装超值礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 728,
		pay_id = 405,
		vip_exp = 4480,
		items = {}
	},
	[801] = {
		val = 3,
		name = "3元限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 801,
		pay_id = 306,
		vip_exp = 30,
		items = {}
	},
	[802] = {
		val = 6,
		name = "6元限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 802,
		pay_id = 3,
		vip_exp = 60,
		items = {}
	},
	[803] = {
		val = 18,
		name = "18元限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 803,
		pay_id = 211,
		vip_exp = 180,
		items = {}
	},
	[804] = {
		val = 50,
		name = "50元限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 804,
		pay_id = 502,
		vip_exp = 500,
		items = {}
	},
	[805] = {
		val = 68,
		name = "68元限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 805,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[806] = {
		val = 98,
		name = "98元限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 806,
		pay_id = 5,
		vip_exp = 980,
		items = {}
	},
	[807] = {
		val = 198,
		name = "198元限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 4,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 807,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[808] = {
		val = 328,
		name = "328元限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 808,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[901] = {
		val = 198,
		name = "198元进阶卡",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 901,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[902] = {
		val = 328,
		name = "328皮肤礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 902,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[903] = {
		val = 198,
		name = "198皮肤礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 903,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[904] = {
		val = 1,
		name = "1元节日小额礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 904,
		pay_id = 301,
		vip_exp = 10,
		items = {}
	},
	[907] = {
		val = 6,
		name = "6元节日小额礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 907,
		pay_id = 3,
		vip_exp = 60,
		items = {}
	},
	[908] = {
		val = 30,
		name = "30元节日小额礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 908,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[909] = {
		val = 98,
		name = "98元王者之证进阶卡",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 909,
		pay_id = 5,
		vip_exp = 980,
		items = {}
	},
	[910] = {
		val = 198,
		name = "198征战之证进阶卡",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 910,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[911] = {
		val = 198,
		name = "198英灵战令进阶卡",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 911,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[912] = {
		val = 68,
		name = "68元黑金周卡",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 912,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[913] = {
		val = 1280,
		name = "新英雄预热",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 913,
		pay_id = 210,
		vip_exp = 12800,
		items = {}
	},
	[1001] = {
		val = 30,
		name = "30元极品神装礼",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1001,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[1002] = {
		val = 68,
		name = "68元极品神装礼",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1002,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[1003] = {
		val = 128,
		name = "128元极品神装礼",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1003,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[1004] = {
		val = 328,
		name = "328元极品神装礼",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1004,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1101] = {
		val = 6,
		name = "6元回归礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1101,
		pay_id = 3,
		vip_exp = 60,
		items = {}
	},
	[1102] = {
		val = 30,
		name = "30元回归礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1102,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[1103] = {
		val = 68,
		name = "68元回归礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1103,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[1104] = {
		val = 128,
		name = "128元回归礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1104,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[1105] = {
		val = 328,
		name = "328元回归礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1105,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1106] = {
		val = 448,
		name = "448元回归礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1106,
		pay_id = 405,
		vip_exp = 4480,
		items = {}
	},
	[1107] = {
		val = 648,
		name = "648元回归礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1107,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[1201] = {
		val = 6,
		name = "6元限时钜惠",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1201,
		pay_id = 3,
		vip_exp = 60,
		items = {}
	},
	[1202] = {
		val = 30,
		name = "30元限时钜惠",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1202,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[1203] = {
		val = 68,
		name = "68元限时钜惠",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1203,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[1204] = {
		val = 128,
		name = "128元限时钜惠",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1204,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[1205] = {
		val = 328,
		name = "328元限时钜惠",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1205,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1206] = {
		val = 648,
		name = "648元限时钜惠",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1206,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[1301] = {
		val = 198,
		name = "先知水晶合服礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1301,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[1302] = {
		val = 198,
		name = "圣灵蛋合服礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1302,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[1303] = {
		val = 198,
		name = "符文精华合服礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1303,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[1304] = {
		val = 198,
		name = "神装碎片合服礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1304,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[1305] = {
		val = 198,
		name = "原初结晶合服礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1305,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[1401] = {
		val = 1280,
		name = "水色悠梦皮肤",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1401,
		pay_id = 210,
		vip_exp = 12800,
		items = {}
	},
	[1402] = {
		val = 328,
		name = "如梦令皮肤",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1402,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1403] = {
		val = 198,
		name = "赤羽火舞皮肤",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1403,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[1404] = {
		val = 198,
		name = "御龙金甲皮肤",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1404,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[1405] = {
		val = 328,
		name = "赤魅海盗皮肤",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1405,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1406] = {
		val = 328,
		name = "甜心女仆皮肤",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1406,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1407] = {
		val = 328,
		name = "暗影暴君皮肤",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1407,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1408] = {
		val = 328,
		name = "竹韵清风皮肤",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1408,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1409] = {
		val = 328,
		name = "暴走青春皮肤",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1409,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1410] = {
		val = 328,
		name = "绽放的誓约皮肤",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1410,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1411] = {
		val = 328,
		name = "魅夜男爵皮肤",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1411,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1412] = {
		val = 328,
		name = "冰雪圆舞曲皮肤",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1412,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1501] = {
		val = 128,
		name = "128元神装超值礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1501,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[1502] = {
		val = 128,
		name = "128元神装限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1502,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[1503] = {
		val = 328,
		name = "328元神装限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1503,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1504] = {
		val = 198,
		name = "198元神装超值礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1504,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[1505] = {
		val = 128,
		name = "128元神装限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1505,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[1506] = {
		val = 328,
		name = "328元神装限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1506,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1507] = {
		val = 328,
		name = "328元神装超值礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1507,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1508] = {
		val = 128,
		name = "128元神装限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1508,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[1509] = {
		val = 328,
		name = "328元神装限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1509,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1510] = {
		val = 448,
		name = "448元神装超值礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1510,
		pay_id = 405,
		vip_exp = 4480,
		items = {}
	},
	[1511] = {
		val = 128,
		name = "128元神装限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1511,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[1512] = {
		val = 328,
		name = "328元神装限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1512,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1513] = {
		val = 448,
		name = "448元神装超值礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1513,
		pay_id = 405,
		vip_exp = 4480,
		items = {}
	},
	[1514] = {
		val = 128,
		name = "128元神装限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1514,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[1515] = {
		val = 328,
		name = "328元神装限购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1515,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1521] = {
		val = 198,
		name = "198精灵抢购礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1521,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[1531] = {
		val = 328,
		name = "328置换商城礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1531,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1532] = {
		val = 648,
		name = "648置换商城礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1532,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[1533] = {
		val = 328,
		name = "328元天启限时礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1533,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1534] = {
		val = 128,
		name = "128精灵召唤礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1534,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[1535] = {
		val = 328,
		name = "328精灵召唤礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1535,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1536] = {
		val = 128,
		name = "128元大地神装礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1536,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[1537] = {
		val = 328,
		name = "328元大地神装礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1537,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1538] = {
		val = 128,
		name = "128元圣洁神装礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1538,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[1539] = {
		val = 328,
		name = "328元圣洁神装礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1539,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1540] = {
		val = 328,
		name = "328元13星觉醒礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1540,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1561] = {
		val = 6,
		name = "6元钜惠A",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1561,
		pay_id = 3,
		vip_exp = 60,
		items = {}
	},
	[1562] = {
		val = 68,
		name = "68元钜惠A",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1562,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[1563] = {
		val = 198,
		name = "198元钜惠A",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1563,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[1571] = {
		val = 6,
		name = "6元钜惠B",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1571,
		pay_id = 3,
		vip_exp = 60,
		items = {}
	},
	[1572] = {
		val = 68,
		name = "68元钜惠B",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1572,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[1573] = {
		val = 198,
		name = "198元钜惠B",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1573,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[1581] = {
		val = 6,
		name = "6元钜惠C",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1581,
		pay_id = 3,
		vip_exp = 60,
		items = {}
	},
	[1582] = {
		val = 68,
		name = "68元钜惠C",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1582,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[1583] = {
		val = 328,
		name = "328元钜惠C",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1583,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1591] = {
		val = 30,
		name = "30元钜惠神装",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1591,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[1592] = {
		val = 68,
		name = "68元钜惠神装",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1592,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[1593] = {
		val = 198,
		name = "198元钜惠神装",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1593,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[1594] = {
		val = 328,
		name = "328元公会秘典礼A",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1594,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1595] = {
		val = 328,
		name = "328元公会秘典礼B",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1595,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1596] = {
		val = 328,
		name = "328元公会秘典礼C",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1596,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1597] = {
		val = 328,
		name = "328元公会秘典礼D",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1597,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1601] = {
		val = 6,
		name = "6元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1601,
		pay_id = 3,
		vip_exp = 60,
		items = {}
	},
	[1602] = {
		val = 30,
		name = "30元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1602,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[1603] = {
		val = 68,
		name = "68元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1603,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[1604] = {
		val = 198,
		name = "198元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1604,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[1605] = {
		val = 128,
		name = "128元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1605,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[1606] = {
		val = 328,
		name = "328元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1606,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1607] = {
		val = 648,
		name = "648元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1607,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[1610] = {
		val = 648,
		name = "648元活动礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1610,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[1701] = {
		val = 30,
		name = "30元月度特权",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1701,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[1702] = {
		val = 68,
		name = "68元季度特权",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1702,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[1705] = {
		val = 0.1,
		name = "主城特殊一毛礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1705,
		pay_id = 1705,
		vip_exp = 1,
		items = {}
	},
	[1706] = {
		val = 1,
		name = "一元礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1706,
		pay_id = 301,
		vip_exp = 10,
		items = {}
	},
	[1801] = {
		val = 6,
		name = "6元萌新提升礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1801,
		pay_id = 3,
		vip_exp = 60,
		items = {}
	},
	[1802] = {
		val = 30,
		name = "30元战力直升礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1802,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[1803] = {
		val = 68,
		name = "68元欧皇召唤礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1803,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[1804] = {
		val = 128,
		name = "128元超值召唤礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1804,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[1805] = {
		val = 328,
		name = "328元强力英雄礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1805,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[1806] = {
		val = 648,
		name = "648元实力碾压礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1806,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[1807] = {
		val = 648,
		name = "648元自选礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1807,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[1808] = {
		val = 648,
		name = "648元自选礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 1808,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[888] = {
		val = 6480,
		name = "6480礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 888,
		pay_id = 80,
		vip_exp = 64800,
		items = {}
	},
	[889] = {
		val = 6480,
		name = "6480礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 889,
		pay_id = 80,
		vip_exp = 64800,
		items = {}
	},
	[891] = {
		val = 60,
		name = "60礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 891,
		pay_id = 30,
		vip_exp = 600,
		items = {}
	},
	[892] = {
		val = 60,
		name = "60礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 892,
		pay_id = 30,
		vip_exp = 600,
		items = {}
	},
	[893] = {
		val = 300,
		name = "300礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 893,
		pay_id = 40,
		vip_exp = 3000,
		items = {}
	},
	[894] = {
		val = 300,
		name = "300礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 894,
		pay_id = 40,
		vip_exp = 3000,
		items = {}
	},
	[895] = {
		val = 680,
		name = "680礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 895,
		pay_id = 200,
		vip_exp = 6800,
		items = {}
	},
	[896] = {
		val = 680,
		name = "680礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 896,
		pay_id = 200,
		vip_exp = 6800,
		items = {}
	},
	[897] = {
		val = 1280,
		name = "1280礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 897,
		pay_id = 210,
		vip_exp = 12800,
		items = {}
	},
	[898] = {
		val = 1280,
		name = "1280礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 898,
		pay_id = 210,
		vip_exp = 12800,
		items = {}
	},
	[899] = {
		val = 1980,
		name = "1980礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 899,
		pay_id = 60,
		vip_exp = 19800,
		items = {}
	},
	[900] = {
		val = 1980,
		name = "1980礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 900,
		pay_id = 60,
		vip_exp = 19800,
		items = {}
	},
	[921] = {
		val = 3280,
		name = "3280礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 921,
		pay_id = 70,
		vip_exp = 32800,
		items = {}
	},
	[922] = {
		val = 3280,
		name = "3280礼包",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 922,
		pay_id = 70,
		vip_exp = 32800,
		items = {}
	},
	[8101] = {
		val = 30,
		name = "触发礼包30元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8101,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[8102] = {
		val = 68,
		name = "触发礼包68元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8102,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[8103] = {
		val = 128,
		name = "触发礼包128元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8103,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[8104] = {
		val = 198,
		name = "触发礼包198元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8104,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[8105] = {
		val = 328,
		name = "触发礼包328元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8105,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[8106] = {
		val = 648,
		name = "触发礼包648元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8106,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[8201] = {
		val = 30,
		name = "符文礼包30元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8201,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[8202] = {
		val = 68,
		name = "符文礼包68元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8202,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[8203] = {
		val = 128,
		name = "符文礼包128元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8203,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[8204] = {
		val = 198,
		name = "符文礼包198元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8204,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[8205] = {
		val = 328,
		name = "符文礼包328元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8205,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[8206] = {
		val = 648,
		name = "符文礼包648元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8206,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[8301] = {
		val = 30,
		name = "等级礼包30元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8301,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[8302] = {
		val = 68,
		name = "等级礼包68元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8302,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[8303] = {
		val = 128,
		name = "等级礼包128元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8303,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[8304] = {
		val = 198,
		name = "等级礼包198元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8304,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[8305] = {
		val = 328,
		name = "等级礼包328元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8305,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[8306] = {
		val = 648,
		name = "等级礼包648元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8306,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[8401] = {
		val = 30,
		name = "星级礼包30元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8401,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[8402] = {
		val = 68,
		name = "星级礼包68元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8402,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[8403] = {
		val = 128,
		name = "星级礼包128元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8403,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[8404] = {
		val = 198,
		name = "星级礼包198元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8404,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[8405] = {
		val = 328,
		name = "星级礼包328元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8405,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[8406] = {
		val = 648,
		name = "星级礼包648元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8406,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[8501] = {
		val = 30,
		name = "13星星级礼包30元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8501,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[8502] = {
		val = 68,
		name = "13星星级礼包68元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8502,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[8503] = {
		val = 128,
		name = "13星星级礼包128元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8503,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[8504] = {
		val = 198,
		name = "13星星级礼包198元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8504,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[8505] = {
		val = 328,
		name = "13星星级礼包328元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8505,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[8506] = {
		val = 648,
		name = "13星星级礼包648元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8506,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[8601] = {
		val = 30,
		name = "神装触发礼包30元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8601,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[8602] = {
		val = 68,
		name = "神装触发礼包68元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8602,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[8603] = {
		val = 128,
		name = "神装触发礼包128元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8603,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[8604] = {
		val = 198,
		name = "神装触发礼包198元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8604,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[8605] = {
		val = 328,
		name = "神装触发礼包328元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8605,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[8606] = {
		val = 648,
		name = "神装触发礼包648元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8606,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[8701] = {
		val = 30,
		name = "元素神殿礼包30元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8701,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[8702] = {
		val = 68,
		name = "元素神殿礼包68元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8702,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[8703] = {
		val = 128,
		name = "元素神殿礼包128元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8703,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[8704] = {
		val = 198,
		name = "元素神殿礼包198元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8704,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[8705] = {
		val = 328,
		name = "元素神殿礼包328元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8705,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[8706] = {
		val = 648,
		name = "元素神殿礼包648元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8706,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[8801] = {
		val = 30,
		name = "天界副本礼包30元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8801,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[8802] = {
		val = 68,
		name = "天界副本礼包68元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8802,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[8803] = {
		val = 128,
		name = "天界副本礼包128元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8803,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[8804] = {
		val = 198,
		name = "天界副本礼包198元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8804,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[8805] = {
		val = 328,
		name = "天界副本礼包328元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8805,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[8806] = {
		val = 648,
		name = "天界副本礼包648元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 8806,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[2001] = {
		val = 30,
		name = "哨子礼包30元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2001,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[2002] = {
		val = 68,
		name = "哨子礼包68元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2002,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[2003] = {
		val = 128,
		name = "哨子礼包128元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2003,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[2004] = {
		val = 198,
		name = "哨子礼包198元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2004,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[2005] = {
		val = 328,
		name = "哨子礼包328元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2005,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[2006] = {
		val = 648,
		name = "哨子礼包648元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2006,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[2007] = {
		val = 30,
		name = "英雄酒礼包30元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2007,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[2008] = {
		val = 68,
		name = "英雄酒礼包68元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2008,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[2009] = {
		val = 128,
		name = "英雄酒礼包128元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2009,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[2010] = {
		val = 198,
		name = "英雄酒礼包198元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2010,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[2011] = {
		val = 328,
		name = "英雄酒礼包328元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2011,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[2012] = {
		val = 648,
		name = "英雄酒礼包648元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2012,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[2013] = {
		val = 30,
		name = "圣诞币礼包30元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2013,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[2014] = {
		val = 68,
		name = "圣诞币礼包68元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2014,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[2015] = {
		val = 128,
		name = "圣诞币礼包128元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2015,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[2016] = {
		val = 198,
		name = "圣诞币礼包198元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2016,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[2017] = {
		val = 328,
		name = "圣诞币礼包328元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2017,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[2018] = {
		val = 648,
		name = "圣诞币礼包648元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 2018,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[4002] = {
		val = 30,
		name = "星辰抽奖礼包30元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 4002,
		pay_id = 4,
		vip_exp = 300,
		items = {}
	},
	[4003] = {
		val = 68,
		name = "星辰抽奖礼包68元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 4003,
		pay_id = 20,
		vip_exp = 680,
		items = {}
	},
	[4004] = {
		val = 128,
		name = "星辰抽奖礼包128元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 4004,
		pay_id = 21,
		vip_exp = 1280,
		items = {}
	},
	[4005] = {
		val = 198,
		name = "星辰抽奖礼包198元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 4005,
		pay_id = 6,
		vip_exp = 1980,
		items = {}
	},
	[4006] = {
		val = 328,
		name = "星辰抽奖礼包328元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 4006,
		pay_id = 7,
		vip_exp = 3280,
		items = {}
	},
	[4007] = {
		val = 648,
		name = "星辰抽奖礼包648元",
		add = 0,
		type = 2,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 4007,
		pay_id = 8,
		vip_exp = 6480,
		items = {}
	},
	[4008] = {
		val = 1000,
		name = "1000皮肤礼包",
		add = 0,
		type = 1,
		gold = 0,
		first_add = 0,
		pic = 9,
		is_iosverify = 0,
		sort = 0,
		lose_gold = 0,
		id = 4008,
		pay_id = 9,
		vip_exp = 10000,
		items = {}
	}
}

function Config.ChargeData.data_charge_data_fun(slot0)
	slot1 = Config.ChargeData.data_charge_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ChargeData.data_charge_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ChargeData.data_charge_reward_data_length = 10
Config.ChargeData.data_charge_reward_data = {
	{
		charge_sum = 200,
		id = 1,
		item_list = {
			{
				10007,
				100
			},
			{
				10102,
				200
			},
			{
				1,
				1000
			}
		},
		spe_item_list = {
			10007
		}
	},
	{
		charge_sum = 1000,
		id = 2,
		item_list = {
			{
				44102,
				1
			},
			{
				10102,
				300
			},
			{
				1,
				2000
			}
		},
		spe_item_list = {
			44102
		}
	},
	{
		charge_sum = 2000,
		id = 3,
		item_list = {
			{
				10030,
				5
			},
			{
				10151,
				1
			},
			{
				11,
				500
			},
			{
				1,
				3000
			}
		},
		spe_item_list = {
			10030,
			10151
		}
	},
	{
		charge_sum = 5000,
		id = 4,
		item_list = {
			{
				10420,
				1
			},
			{
				10102,
				500
			},
			{
				11,
				800
			},
			{
				1,
				5000
			}
		},
		spe_item_list = {
			10420
		}
	},
	{
		charge_sum = 10000,
		id = 5,
		item_list = {
			{
				10430,
				5
			},
			{
				10151,
				2
			},
			{
				11,
				1000
			},
			{
				1,
				8000
			}
		},
		spe_item_list = {
			10431,
			10151
		}
	},
	{
		charge_sum = 15000,
		id = 6,
		item_list = {
			{
				10421,
				1
			},
			{
				10102,
				800
			},
			{
				11,
				1500
			},
			{
				1,
				10000
			}
		},
		spe_item_list = {
			10421
		}
	},
	{
		charge_sum = 20000,
		id = 7,
		item_list = {
			{
				10431,
				5
			},
			{
				10152,
				1
			},
			{
				11,
				2000
			},
			{
				1,
				12000
			}
		},
		spe_item_list = {
			10432,
			10152
		}
	},
	{
		charge_sum = 30000,
		id = 8,
		item_list = {
			{
				30015,
				1
			},
			{
				10102,
				1000
			},
			{
				11,
				2500
			},
			{
				1,
				15000
			}
		},
		spe_item_list = {
			30015
		}
	},
	{
		charge_sum = 50000,
		id = 9,
		item_list = {
			{
				44107,
				1
			},
			{
				10152,
				2
			},
			{
				11,
				3000
			},
			{
				1,
				18000
			}
		},
		spe_item_list = {
			44107,
			10152
		}
	},
	{
		charge_sum = 100000,
		id = 10,
		item_list = {
			{
				30019,
				1
			},
			{
				10102,
				2000
			},
			{
				11,
				4000
			},
			{
				1,
				20000
			}
		},
		spe_item_list = {
			30019
		}
	}
}

function Config.ChargeData.data_charge_reward_data_fun(slot0)
	slot1 = Config.ChargeData.data_charge_reward_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ChargeData.data_charge_reward_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ChargeData.data_first_reward_data_length = 3
Config.ChargeData.data_first_reward_data = {
	{
		charge_sum = 6,
		button = 502,
		id = 1,
		item_list = {},
		effect_list = {
			26059,
			44202,
			44402
		}
	},
	{
		charge_sum = 10,
		button = 905,
		id = 2,
		item_list = {},
		effect_list = {
			44103,
			44303
		}
	},
	{
		charge_sum = 88,
		button = 906,
		id = 3,
		item_list = {},
		effect_list = {
			44104,
			44204,
			44304,
			44404
		}
	}
}

function Config.ChargeData.data_first_reward_data_fun(slot0)
	slot1 = Config.ChargeData.data_first_reward_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ChargeData.data_first_reward_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ChargeData.data_first_charge_data_length = 6
Config.ChargeData.data_first_charge_data = {
	{
		fid = 1,
		id = 1,
		need_exp = 60,
		day = 1,
		item_list = {
			{
				24409,
				1
			},
			{
				10403,
				1
			}
		},
		effect_list = {
			{
				534,
				263
			}
		}
	},
	{
		fid = 1,
		id = 2,
		need_exp = 60,
		day = 2,
		item_list = {
			{
				40108,
				1
			},
			{
				40208,
				1
			}
		},
		effect_list = {
			{
				263,
				263
			}
		}
	},
	{
		fid = 1,
		id = 3,
		need_exp = 60,
		day = 3,
		item_list = {
			{
				40308,
				1
			},
			{
				40408,
				1
			}
		},
		effect_list = {
			{
				263,
				263
			}
		}
	},
	{
		fid = 2,
		id = 4,
		need_exp = 1000,
		day = 1,
		item_list = {
			{
				40111,
				1
			},
			{
				40211,
				1
			}
		},
		effect_list = {
			{
				263,
				263
			}
		}
	},
	{
		fid = 2,
		id = 5,
		need_exp = 1000,
		day = 2,
		item_list = {
			{
				40311,
				1
			},
			{
				14001,
				1
			}
		},
		effect_list = {
			{
				263,
				263
			}
		}
	},
	{
		fid = 2,
		id = 6,
		need_exp = 1000,
		day = 3,
		item_list = {
			{
				40411,
				1
			},
			{
				14001,
				2
			}
		},
		effect_list = {
			{
				263,
				263
			}
		}
	}
}

function Config.ChargeData.data_first_charge_data_fun(slot0)
	slot1 = Config.ChargeData.data_first_charge_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ChargeData.data_first_charge_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ChargeData.data_daily_gift_data_length = 4
Config.ChargeData.data_daily_gift_data = {
	[201] = {
		charge_id = 301,
		name = "每日礼包",
		show_vip_lv = 0,
		id = 201,
		desc = "<div outline=2,#6d4f31>立赠</div><div fontcolor=#ffffff outline=2,#6d4f31> 20 %s</div><div outline=2,#6d4f31>和价值</div><div fontcolor=#ffffff outline=2,#6d4f31> 488 %s</div><div outline=2,#6d4f31>超值礼包！</div>",
		show_lv = 1,
		limit_count = 3,
		bg_res = "txt_cn_bigbg_25",
		sort_id = 1,
		is_double = 1,
		old_price = 3,
		limit_vip = 0,
		val = 1,
		icon_res = "mall_charge_icon_17"
	},
	[202] = {
		charge_id = 302,
		name = "贵1礼包",
		show_vip_lv = 0,
		id = 202,
		desc = "<div outline=2,#6d4f31>立赠</div><div fontcolor=#ffffff outline=2,#6d4f31> 120 %s</div><div outline=2,#6d4f31>和价值</div><div fontcolor=#ffffff outline=2,#6d4f31> 888 %s</div><div outline=2,#6d4f31>超值礼包！</div>",
		show_lv = 1,
		limit_count = 3,
		bg_res = "txt_cn_bigbg_26",
		sort_id = 2,
		is_double = 1,
		old_price = 12,
		limit_vip = 1,
		val = 6,
		icon_res = "mall_charge_icon_15"
	},
	[203] = {
		charge_id = 303,
		name = "贵2礼包",
		show_vip_lv = 0,
		id = 203,
		desc = "<div outline=2,#6d4f31>立赠</div><div fontcolor=#ffffff outline=2,#6d4f31> 240 %s</div><div outline=2,#6d4f31>和价值</div><div fontcolor=#ffffff outline=2,#6d4f31> 1688 %s</div><div outline=2,#6d4f31>超值礼包</div>",
		show_lv = 1,
		limit_count = 3,
		bg_res = "txt_cn_bigbg_27",
		sort_id = 3,
		is_double = 1,
		old_price = 18,
		limit_vip = 2,
		val = 12,
		icon_res = "mall_charge_icon_16"
	},
	[205] = {
		charge_id = 325,
		name = "一键购买",
		show_vip_lv = 0,
		id = 205,
		desc = "",
		show_lv = 1,
		limit_count = 3,
		bg_res = "",
		sort_id = 5,
		is_double = 0,
		old_price = 33,
		limit_vip = 3,
		val = 18,
		icon_res = ""
	}
}

function Config.ChargeData.data_daily_gift_data_fun(slot0)
	slot1 = Config.ChargeData.data_daily_gift_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ChargeData.data_daily_gift_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ChargeData.data_daily_gift_award_length = 4
Config.ChargeData.data_daily_gift_award = {
	[205] = {
		{
			min = 1,
			max = 60,
			reward = {
				{
					3,
					380
				},
				{
					10403,
					3
				},
				{
					10002,
					9
				},
				{
					37001,
					11
				},
				{
					22,
					1500000
				}
			}
		},
		{
			min = 61,
			max = 79,
			reward = {
				{
					3,
					380
				},
				{
					10403,
					3
				},
				{
					10002,
					9
				},
				{
					37001,
					11
				},
				{
					10450,
					320
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					3,
					380
				},
				{
					10403,
					3
				},
				{
					10002,
					9
				},
				{
					37001,
					11
				},
				{
					10040,
					18
				}
			}
		},
		{
			min = 90,
			max = 119,
			reward = {
				{
					3,
					380
				},
				{
					10403,
					3
				},
				{
					10002,
					9
				},
				{
					37001,
					11
				},
				{
					17009,
					32
				}
			}
		},
		{
			min = 120,
			max = 300,
			reward = {
				{
					3,
					380
				},
				{
					10403,
					3
				},
				{
					10002,
					9
				},
				{
					37001,
					11
				},
				{
					28,
					65
				}
			}
		}
	},
	[203] = {
		{
			min = 1,
			max = 60,
			reward = {
				{
					3,
					240
				},
				{
					10403,
					2
				},
				{
					37001,
					8
				},
				{
					22,
					800000
				}
			}
		},
		{
			min = 61,
			max = 79,
			reward = {
				{
					3,
					240
				},
				{
					10403,
					2
				},
				{
					37001,
					8
				},
				{
					10450,
					200
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					3,
					240
				},
				{
					10403,
					2
				},
				{
					37001,
					8
				},
				{
					10040,
					12
				}
			}
		},
		{
			min = 90,
			max = 119,
			reward = {
				{
					3,
					240
				},
				{
					10403,
					2
				},
				{
					37001,
					8
				},
				{
					17009,
					20
				}
			}
		},
		{
			min = 120,
			max = 300,
			reward = {
				{
					3,
					240
				},
				{
					10403,
					2
				},
				{
					37001,
					8
				},
				{
					28,
					40
				}
			}
		}
	},
	[202] = {
		{
			min = 1,
			max = 60,
			reward = {
				{
					3,
					120
				},
				{
					10403,
					1
				},
				{
					10002,
					6
				},
				{
					22,
					500000
				}
			}
		},
		{
			min = 61,
			max = 79,
			reward = {
				{
					3,
					120
				},
				{
					10403,
					1
				},
				{
					10002,
					6
				},
				{
					10450,
					100
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					3,
					120
				},
				{
					10403,
					1
				},
				{
					10002,
					6
				},
				{
					10040,
					6
				}
			}
		},
		{
			min = 90,
			max = 119,
			reward = {
				{
					3,
					120
				},
				{
					10403,
					1
				},
				{
					10002,
					6
				},
				{
					17009,
					10
				}
			}
		},
		{
			min = 120,
			max = 300,
			reward = {
				{
					3,
					120
				},
				{
					10403,
					1
				},
				{
					10002,
					6
				},
				{
					28,
					20
				}
			}
		}
	},
	[201] = {
		{
			min = 1,
			max = 60,
			reward = {
				{
					3,
					20
				},
				{
					37001,
					3
				},
				{
					10002,
					3
				},
				{
					22,
					200000
				}
			}
		},
		{
			min = 61,
			max = 79,
			reward = {
				{
					3,
					20
				},
				{
					37001,
					3
				},
				{
					10002,
					3
				},
				{
					10450,
					20
				}
			}
		},
		{
			min = 80,
			max = 89,
			reward = {
				{
					3,
					20
				},
				{
					37001,
					3
				},
				{
					10002,
					3
				},
				{
					10040,
					2
				}
			}
		},
		{
			min = 90,
			max = 119,
			reward = {
				{
					3,
					20
				},
				{
					37001,
					3
				},
				{
					10002,
					3
				},
				{
					17009,
					2
				}
			}
		},
		{
			min = 120,
			max = 300,
			reward = {
				{
					3,
					20
				},
				{
					37001,
					3
				},
				{
					10002,
					3
				},
				{
					28,
					5
				}
			}
		}
	}
}
Config.ChargeData.data_supre_reward_data_length = 31
Config.ChargeData.data_supre_reward_data = {
	[0] = {
		id = 1,
		vip = 0,
		reward = {
			{
				3,
				1
			},
			{
				37001,
				1
			}
		}
	},
	{
		id = 1,
		vip = 1,
		reward = {
			{
				3,
				20
			},
			{
				37001,
				1
			}
		}
	},
	{
		id = 1,
		vip = 2,
		reward = {
			{
				3,
				40
			},
			{
				37001,
				1
			}
		}
	},
	{
		id = 1,
		vip = 3,
		reward = {
			{
				3,
				60
			},
			{
				37001,
				1
			}
		}
	},
	{
		id = 1,
		vip = 4,
		reward = {
			{
				3,
				80
			},
			{
				37001,
				1
			}
		}
	},
	{
		id = 1,
		vip = 5,
		reward = {
			{
				3,
				100
			},
			{
				37001,
				2
			}
		}
	},
	{
		id = 1,
		vip = 6,
		reward = {
			{
				3,
				110
			},
			{
				29905,
				1
			}
		}
	},
	{
		id = 1,
		vip = 7,
		reward = {
			{
				3,
				120
			},
			{
				29905,
				1
			}
		}
	},
	{
		id = 1,
		vip = 8,
		reward = {
			{
				3,
				130
			},
			{
				29905,
				1
			}
		}
	},
	{
		id = 1,
		vip = 9,
		reward = {
			{
				3,
				140
			},
			{
				29905,
				1
			}
		}
	},
	{
		id = 1,
		vip = 10,
		reward = {
			{
				3,
				150
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 11,
		reward = {
			{
				3,
				160
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 12,
		reward = {
			{
				3,
				170
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 13,
		reward = {
			{
				3,
				180
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 14,
		reward = {
			{
				3,
				190
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 15,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 16,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 17,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 18,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 19,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 20,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 21,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 22,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 23,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 24,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 25,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 26,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 27,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 28,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 29,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	},
	{
		id = 1,
		vip = 30,
		reward = {
			{
				3,
				200
			},
			{
				29905,
				2
			}
		}
	}
}

function Config.ChargeData.data_supre_reward_data_fun(slot0)
	slot1 = Config.ChargeData.data_supre_reward_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ChargeData.data_supre_reward_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ChargeData.data_daily_reward_length = 7
Config.ChargeData.data_daily_reward = {
	{
		id = 1,
		min = 1,
		max = 7,
		reward = {
			{
				72003,
				1
			},
			{
				10403,
				1
			},
			{
				3,
				200
			},
			{
				39083,
				1
			}
		}
	},
	{
		id = 2,
		min = 8,
		max = 15,
		reward = {
			{
				72003,
				1
			},
			{
				10403,
				1
			},
			{
				3,
				200
			},
			{
				39084,
				1
			}
		}
	},
	{
		id = 3,
		min = 16,
		max = 30,
		reward = {
			{
				72003,
				1
			},
			{
				10403,
				1
			},
			{
				3,
				200
			},
			{
				39085,
				1
			}
		}
	},
	{
		id = 4,
		min = 31,
		max = 60,
		reward = {
			{
				72003,
				1
			},
			{
				10403,
				1
			},
			{
				3,
				200
			},
			{
				39086,
				1
			}
		}
	},
	{
		id = 5,
		min = 61,
		max = 120,
		reward = {
			{
				72003,
				1
			},
			{
				10403,
				1
			},
			{
				3,
				200
			},
			{
				39087,
				1
			}
		}
	},
	{
		id = 6,
		min = 121,
		max = 150,
		reward = {
			{
				72003,
				1
			},
			{
				10403,
				1
			},
			{
				3,
				200
			},
			{
				39088,
				1
			}
		}
	},
	{
		id = 7,
		min = 151,
		max = 9999,
		reward = {
			{
				72003,
				1
			},
			{
				10403,
				1
			},
			{
				3,
				200
			},
			{
				39089,
				1
			}
		}
	}
}
Config.ChargeData.data_new_first_charge_data_length = 6
Config.ChargeData.data_new_first_charge_data = {
	{
		fid = 1,
		id = 1,
		need_exp = 60,
		day = 1,
		item_list = {
			{
				10403,
				1
			},
			{
				10001,
				100
			}
		}
	},
	{
		fid = 1,
		id = 2,
		need_exp = 60,
		day = 2,
		item_list = {
			{
				40108,
				1
			},
			{
				40208,
				1
			}
		}
	},
	{
		fid = 1,
		id = 3,
		need_exp = 60,
		day = 3,
		item_list = {
			{
				40308,
				1
			},
			{
				40408,
				1
			}
		}
	},
	{
		fid = 2,
		id = 4,
		need_exp = 1000,
		day = 1,
		item_list = {
			{
				40111,
				1
			},
			{
				40211,
				1
			}
		}
	},
	{
		fid = 2,
		id = 5,
		need_exp = 1000,
		day = 2,
		item_list = {
			{
				40311,
				1
			},
			{
				14001,
				1
			}
		}
	},
	{
		fid = 2,
		id = 6,
		need_exp = 1000,
		day = 3,
		item_list = {
			{
				40411,
				1
			},
			{
				14001,
				2
			}
		}
	}
}

function Config.ChargeData.data_new_first_charge_data_fun(slot0)
	slot1 = Config.ChargeData.data_new_first_charge_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ChargeData.data_new_first_charge_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ChargeData.data_first_charge_lwt_data_length = 6
Config.ChargeData.data_first_charge_lwt_data = {
	{
		fid = 1,
		id = 1,
		need_exp = 60,
		day = 1,
		item_list = {
			{
				24411,
				1
			},
			{
				10403,
				1
			}
		},
		effect_list = {
			{
				534,
				263
			}
		}
	},
	{
		fid = 1,
		id = 2,
		need_exp = 60,
		day = 2,
		item_list = {
			{
				40108,
				1
			},
			{
				40208,
				1
			}
		},
		effect_list = {
			{
				263,
				263
			}
		}
	},
	{
		fid = 1,
		id = 3,
		need_exp = 60,
		day = 3,
		item_list = {
			{
				40308,
				1
			},
			{
				40408,
				1
			}
		},
		effect_list = {
			{
				263,
				263
			}
		}
	},
	{
		fid = 2,
		id = 4,
		need_exp = 1000,
		day = 1,
		item_list = {
			{
				40111,
				1
			},
			{
				40211,
				1
			}
		},
		effect_list = {
			{
				263,
				263
			}
		}
	},
	{
		fid = 2,
		id = 5,
		need_exp = 1000,
		day = 2,
		item_list = {
			{
				40311,
				1
			},
			{
				14001,
				1
			}
		},
		effect_list = {
			{
				263,
				263
			}
		}
	},
	{
		fid = 2,
		id = 6,
		need_exp = 1000,
		day = 3,
		item_list = {
			{
				40411,
				1
			},
			{
				14001,
				2
			}
		},
		effect_list = {
			{
				263,
				263
			}
		}
	}
}

function Config.ChargeData.data_first_charge_lwt_data_fun(slot0)
	slot1 = Config.ChargeData.data_first_charge_lwt_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ChargeData.data_first_charge_lwt_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ChargeData.data_new_first_charge_data3_length = 6
Config.ChargeData.data_new_first_charge_data3 = {
	{
		fid = 1,
		id = 1,
		need_exp = 10000,
		day = 1,
		item_list = {
			{
				10403,
				100
			},
			{
				29437,
				1
			}
		},
		effect_list = {
			{
				534,
				263
			}
		}
	},
	{
		fid = 1,
		id = 2,
		need_exp = 10000,
		day = 2,
		item_list = {
			{
				10403,
				100
			},
			{
				641235,
				1
			}
		},
		effect_list = {
			{
				534,
				263
			}
		}
	},
	{
		fid = 1,
		id = 3,
		need_exp = 10000,
		day = 3,
		item_list = {
			{
				10403,
				100
			},
			{
				641236,
				1
			}
		},
		effect_list = {
			{
				534,
				263
			}
		}
	},
	{
		fid = 2,
		id = 4,
		need_exp = 50000,
		day = 1,
		item_list = {
			{
				10403,
				100
			},
			{
				29442,
				1
			}
		},
		effect_list = {
			{
				534,
				263
			}
		}
	},
	{
		fid = 2,
		id = 5,
		need_exp = 50000,
		day = 2,
		item_list = {
			{
				10403,
				100
			},
			{
				641236,
				1
			}
		},
		effect_list = {
			{
				534,
				263
			}
		}
	},
	{
		fid = 2,
		id = 6,
		need_exp = 50000,
		day = 3,
		item_list = {
			{
				10403,
				100
			},
			{
				641236,
				1
			}
		},
		effect_list = {
			{
				534,
				263
			}
		}
	}
}

function Config.ChargeData.data_new_first_charge_data3_fun(slot0)
	slot1 = Config.ChargeData.data_new_first_charge_data3[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ChargeData.data_new_first_charge_data3[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
