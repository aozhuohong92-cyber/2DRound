Config = Config or {}
Config.HolidayPredictData = Config.HolidayPredictData or {}
Config.HolidayPredictData.data_constant_length = 15
Config.HolidayPredictData.data_constant = {
	num_1 = {
		val = 3,
		key = "num_1",
		desc = "幸运松果数"
	},
	num_2 = {
		val = 3,
		key = "num_2",
		desc = "豪华松果数"
	},
	must_num_1 = {
		val = 0,
		key = "must_num_1",
		desc = "幸运松果必出珍品数"
	},
	must_num_2 = {
		val = 40,
		key = "must_num_2",
		desc = "豪华松果必出珍品数"
	},
	refresh = {
		key = "refresh",
		desc = "刷新消耗",
		val = {
			{
				37008,
				1
			}
		}
	},
	item1 = {
		val = 37008,
		key = "item1",
		desc = "松果币道具"
	},
	free_time1 = {
		val = 2,
		key = "free_time1",
		desc = "幸运松果每日免费刷新次数"
	},
	free_time2 = {
		val = 1,
		key = "free_time2",
		desc = "豪华松果每日免费刷新次数"
	},
	game_rule1 = {
		val = 1,
		key = "game_rule1",
		desc = [[
玩法说明：
1、活动期间每天均有免费机会打开松果宝藏
2、若该宝藏结果符合预期，你可以消耗松果币可购买当前宝藏结果(松果币不足用钻石补充)，拥有这些道具
3、宝藏刷新次数及结果每日0点重置，请及时购买哦]]
	},
	game_rule2 = {
		val = 2,
		key = "game_rule2",
		desc = [[
玩法说明：
1、活动期间每天均有免费机会打开松果宝藏
2、若该宝藏结果符合预期，你可以消耗松果币可购买当前宝藏结果(松果币不足用钻石补充)，拥有这些道具
3、宝藏刷新次数及结果每日0点重置，请及时购买哦
4、豪华松果刷新达到指定次数必出珍稀道具哦]]
	},
	buy_time1 = {
		val = 100,
		key = "buy_time1",
		desc = "幸运松果活动限购次数"
	},
	buy_time2 = {
		val = 100,
		key = "buy_time2",
		desc = "豪华松果活动限购次数"
	},
	show_item1 = {
		key = "show_item1",
		desc = "主界面奖励预览配置幸运",
		val = {
			{
				90501,
				1
			},
			{
				90502,
				1
			},
			{
				90503,
				1
			},
			{
				90504,
				1
			},
			{
				90505,
				1
			},
			{
				90601,
				1
			}
		}
	},
	show_item2 = {
		key = "show_item2",
		desc = "主界面奖励预览配置豪华",
		val = {
			{
				29907,
				50
			},
			{
				10456,
				1
			},
			{
				91010,
				2
			},
			{
				90900,
				5
			},
			{
				29900,
				50
			},
			{
				14001,
				10
			}
		}
	},
	item_price = {
		key = "item_price",
		desc = "松果币价格",
		val = {
			{
				3,
				2000
			}
		}
	}
}

function Config.HolidayPredictData.data_constant_fun(slot0)
	slot1 = Config.HolidayPredictData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayPredictData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayPredictData.data_prize_pool_length = 2
Config.HolidayPredictData.data_prize_pool = {
	{
		type = 1,
		expend_item = {
			{
				37008,
				20
			}
		},
		expend_gold = {
			{
				3,
				40000
			}
		}
	},
	{
		type = 2,
		expend_item = {
			{
				37008,
				60
			}
		},
		expend_gold = {
			{
				3,
				120000
			}
		}
	}
}

function Config.HolidayPredictData.data_prize_pool_fun(slot0)
	slot1 = Config.HolidayPredictData.data_prize_pool[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayPredictData.data_prize_pool[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayPredictData.data_reward_pos_length = 107
Config.HolidayPredictData.data_reward_pos = {
	[101] = {
		is_goal = 1,
		item_id = 14001,
		item_num = 1
	},
	[102] = {
		is_goal = 1,
		item_id = 14001,
		item_num = 2
	},
	[103] = {
		is_goal = 1,
		item_id = 10408,
		item_num = 8
	},
	[104] = {
		is_goal = 1,
		item_id = 10403,
		item_num = 8
	},
	[105] = {
		is_goal = 1,
		item_id = 29905,
		item_num = 50
	},
	[106] = {
		is_goal = 1,
		item_id = 29905,
		item_num = 25
	},
	[107] = {
		is_goal = 1,
		item_id = 29105,
		item_num = 25
	},
	[108] = {
		is_goal = 1,
		item_id = 29205,
		item_num = 25
	},
	[109] = {
		is_goal = 1,
		item_id = 29305,
		item_num = 25
	},
	[110] = {
		is_goal = 1,
		item_id = 14002,
		item_num = 20
	},
	[111] = {
		is_goal = 1,
		item_id = 10450,
		item_num = 500
	},
	[112] = {
		is_goal = 1,
		item_id = 10450,
		item_num = 800
	},
	[113] = {
		is_goal = 1,
		item_id = 10450,
		item_num = 1000
	},
	[114] = {
		is_goal = 1,
		item_id = 17005,
		item_num = 50
	},
	[115] = {
		is_goal = 1,
		item_id = 10408,
		item_num = 5
	},
	[116] = {
		is_goal = 1,
		item_id = 10403,
		item_num = 5
	},
	[117] = {
		is_goal = 1,
		item_id = 29905,
		item_num = 20
	},
	[118] = {
		is_goal = 1,
		item_id = 10454,
		item_num = 1
	},
	[119] = {
		is_goal = 1,
		item_id = 10455,
		item_num = 1
	},
	[120] = {
		is_goal = 1,
		item_id = 10456,
		item_num = 1
	},
	[121] = {
		is_goal = 1,
		item_id = 10460,
		item_num = 1
	},
	[122] = {
		is_goal = 0,
		item_id = 90501,
		item_num = 1
	},
	[123] = {
		is_goal = 0,
		item_id = 90502,
		item_num = 1
	},
	[124] = {
		is_goal = 0,
		item_id = 90503,
		item_num = 1
	},
	[125] = {
		is_goal = 0,
		item_id = 90504,
		item_num = 1
	},
	[126] = {
		is_goal = 0,
		item_id = 90505,
		item_num = 1
	},
	[127] = {
		is_goal = 0,
		item_id = 90601,
		item_num = 1
	},
	[128] = {
		is_goal = 0,
		item_id = 10408,
		item_num = 10
	},
	[129] = {
		is_goal = 0,
		item_id = 10403,
		item_num = 10
	},
	[130] = {
		is_goal = 0,
		item_id = 37001,
		item_num = 5
	},
	[131] = {
		is_goal = 0,
		item_id = 10002,
		item_num = 6
	},
	[132] = {
		is_goal = 0,
		item_id = 10450,
		item_num = 200
	},
	[133] = {
		is_goal = 0,
		item_id = 72001,
		item_num = 15
	},
	[134] = {
		is_goal = 0,
		item_id = 17005,
		item_num = 10
	},
	[135] = {
		is_goal = 0,
		item_id = 10001,
		item_num = 200
	},
	[136] = {
		is_goal = 0,
		item_id = 10103,
		item_num = 10
	},
	[137] = {
		is_goal = 0,
		item_id = 10,
		item_num = 500
	},
	[138] = {
		is_goal = 0,
		item_id = 27900,
		item_num = 50
	},
	[139] = {
		is_goal = 0,
		item_id = 27901,
		item_num = 50
	},
	[140] = {
		is_goal = 0,
		item_id = 27902,
		item_num = 50
	},
	[141] = {
		is_goal = 0,
		item_id = 27903,
		item_num = 50
	},
	[142] = {
		is_goal = 0,
		item_id = 27904,
		item_num = 50
	},
	[143] = {
		is_goal = 0,
		item_id = 27905,
		item_num = 50
	},
	[144] = {
		is_goal = 0,
		item_id = 27906,
		item_num = 50
	},
	[145] = {
		is_goal = 0,
		item_id = 27907,
		item_num = 50
	},
	[146] = {
		is_goal = 0,
		item_id = 27908,
		item_num = 50
	},
	[147] = {
		is_goal = 0,
		item_id = 27909,
		item_num = 50
	},
	[148] = {
		is_goal = 0,
		item_id = 27910,
		item_num = 50
	},
	[149] = {
		is_goal = 0,
		item_id = 27911,
		item_num = 50
	},
	[150] = {
		is_goal = 0,
		item_id = 27912,
		item_num = 50
	},
	[151] = {
		is_goal = 0,
		item_id = 27913,
		item_num = 50
	},
	[152] = {
		is_goal = 0,
		item_id = 28900,
		item_num = 50
	},
	[153] = {
		is_goal = 0,
		item_id = 28901,
		item_num = 50
	},
	[154] = {
		is_goal = 0,
		item_id = 28902,
		item_num = 50
	},
	[155] = {
		is_goal = 0,
		item_id = 28903,
		item_num = 50
	},
	[156] = {
		is_goal = 0,
		item_id = 28904,
		item_num = 50
	},
	[157] = {
		is_goal = 0,
		item_id = 28905,
		item_num = 50
	},
	[158] = {
		is_goal = 0,
		item_id = 28906,
		item_num = 50
	},
	[159] = {
		is_goal = 0,
		item_id = 28907,
		item_num = 50
	},
	[160] = {
		is_goal = 0,
		item_id = 28908,
		item_num = 50
	},
	[161] = {
		is_goal = 0,
		item_id = 28909,
		item_num = 50
	},
	[162] = {
		is_goal = 0,
		item_id = 28910,
		item_num = 50
	},
	[163] = {
		is_goal = 0,
		item_id = 28911,
		item_num = 50
	},
	[164] = {
		is_goal = 0,
		item_id = 28912,
		item_num = 50
	},
	[165] = {
		is_goal = 0,
		item_id = 28913,
		item_num = 50
	},
	[166] = {
		is_goal = 0,
		item_id = 28914,
		item_num = 50
	},
	[167] = {
		is_goal = 0,
		item_id = 28915,
		item_num = 50
	},
	[168] = {
		is_goal = 0,
		item_id = 28916,
		item_num = 50
	},
	[169] = {
		is_goal = 1,
		item_id = 29900,
		item_num = 50
	},
	[170] = {
		is_goal = 1,
		item_id = 29901,
		item_num = 50
	},
	[171] = {
		is_goal = 1,
		item_id = 29902,
		item_num = 50
	},
	[172] = {
		is_goal = 1,
		item_id = 29913,
		item_num = 50
	},
	[173] = {
		is_goal = 1,
		item_id = 29914,
		item_num = 50
	},
	[174] = {
		is_goal = 1,
		item_id = 29915,
		item_num = 50
	},
	[175] = {
		is_goal = 1,
		item_id = 29916,
		item_num = 50
	},
	[176] = {
		is_goal = 1,
		item_id = 29917,
		item_num = 50
	},
	[177] = {
		is_goal = 1,
		item_id = 29918,
		item_num = 50
	},
	[178] = {
		is_goal = 1,
		item_id = 29919,
		item_num = 50
	},
	[179] = {
		is_goal = 1,
		item_id = 29920,
		item_num = 50
	},
	[180] = {
		is_goal = 1,
		item_id = 29921,
		item_num = 50
	},
	[181] = {
		is_goal = 1,
		item_id = 29922,
		item_num = 50
	},
	[182] = {
		is_goal = 1,
		item_id = 29923,
		item_num = 50
	},
	[183] = {
		is_goal = 1,
		item_id = 29924,
		item_num = 50
	},
	[184] = {
		is_goal = 0,
		item_id = 29405,
		item_num = 50
	},
	[185] = {
		is_goal = 0,
		item_id = 29505,
		item_num = 50
	},
	[186] = {
		is_goal = 0,
		item_id = 29905,
		item_num = 50
	},
	[187] = {
		is_goal = 0,
		item_id = 29906,
		item_num = 50
	},
	[188] = {
		is_goal = 1,
		item_id = 29907,
		item_num = 50
	},
	[190] = {
		is_goal = 0,
		item_id = 14001,
		item_num = 10
	},
	[191] = {
		is_goal = 0,
		item_id = 37002,
		item_num = 20
	},
	[192] = {
		is_goal = 0,
		item_id = 10450,
		item_num = 10000
	},
	[193] = {
		is_goal = 0,
		item_id = 72001,
		item_num = 50
	},
	[194] = {
		is_goal = 0,
		item_id = 17009,
		item_num = 50
	},
	[195] = {
		is_goal = 0,
		item_id = 10408,
		item_num = 50
	},
	[196] = {
		is_goal = 0,
		item_id = 10403,
		item_num = 50
	},
	[197] = {
		is_goal = 0,
		item_id = 10454,
		item_num = 1
	},
	[198] = {
		is_goal = 0,
		item_id = 10455,
		item_num = 1
	},
	[199] = {
		is_goal = 1,
		item_id = 10456,
		item_num = 1
	},
	[200] = {
		is_goal = 1,
		item_id = 10460,
		item_num = 10
	},
	[201] = {
		is_goal = 1,
		item_id = 29905,
		item_num = 50
	},
	[202] = {
		is_goal = 1,
		item_id = 90601,
		item_num = 5
	},
	[203] = {
		is_goal = 1,
		item_id = 90602,
		item_num = 5
	},
	[204] = {
		is_goal = 1,
		item_id = 90603,
		item_num = 5
	},
	[205] = {
		is_goal = 1,
		item_id = 90604,
		item_num = 5
	},
	[206] = {
		is_goal = 1,
		item_id = 90605,
		item_num = 5
	},
	[207] = {
		is_goal = 1,
		item_id = 90900,
		item_num = 5
	},
	[208] = {
		is_goal = 1,
		item_id = 91010,
		item_num = 2
	}
}

function Config.HolidayPredictData.data_reward_pos_fun(slot0)
	slot1 = Config.HolidayPredictData.data_reward_pos[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayPredictData.data_reward_pos[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayPredictData.data_magnificat_list_length = 2
Config.HolidayPredictData.data_magnificat_list = {
	{
		[101] = {
			num = 1,
			name = "强者招募令"
		},
		[102] = {
			num = 2,
			name = "强者招募令"
		},
		[103] = {
			num = 8,
			name = "精英召唤卷"
		},
		[104] = {
			num = 8,
			name = "高级召唤卷"
		},
		[105] = {
			num = 50,
			name = "5星随机碎片"
		},
		[106] = {
			num = 25,
			name = "5星随机碎片"
		},
		[107] = {
			num = 25,
			name = "5星海贼新星碎片"
		},
		[108] = {
			num = 25,
			name = "5星草帽联盟碎片"
		},
		[109] = {
			num = 25,
			name = "5星强者碎片"
		},
		[110] = {
			num = 20,
			name = "转换精华"
		},
		[111] = {
			num = 500,
			name = "强化训练"
		},
		[112] = {
			num = 800,
			name = "强化训练"
		},
		[113] = {
			num = 1000,
			name = "强化训练"
		},
		[114] = {
			num = 50,
			name = "原初意志"
		},
		[115] = {
			num = 5,
			name = "精英召唤卷"
		},
		[116] = {
			num = 5,
			name = "高级召唤卷"
		},
		[117] = {
			num = 20,
			name = "5星随机碎片"
		},
		[118] = {
			num = 1,
			name = "超级战技"
		},
		[119] = {
			num = 1,
			name = "传说战技"
		},
		[120] = {
			num = 1,
			name = "恶魔战技"
		},
		[121] = {
			num = 1,
			name = "觉醒石"
		},
		[122] = {
			num = 1,
			name = "5星海贼新星英魂"
		},
		[123] = {
			num = 1,
			name = "5星草帽联盟英魂"
		},
		[124] = {
			num = 1,
			name = "5星强者英魂"
		},
		[125] = {
			num = 1,
			name = "5星海军英魂"
		},
		[126] = {
			num = 1,
			name = "5星五皇团英魂"
		},
		[127] = {
			num = 1,
			name = "6星海贼新星英魂"
		},
		[128] = {
			num = 10,
			name = "精英召唤卷"
		},
		[129] = {
			num = 10,
			name = "高级召唤卷"
		},
		[130] = {
			num = 5,
			name = "寻宝券"
		},
		[131] = {
			num = 6,
			name = "远航刷新券"
		},
		[132] = {
			num = 200,
			name = "符文精华"
		},
		[133] = {
			num = 15,
			name = "神技晶石"
		},
		[134] = {
			num = 10,
			name = "原初意志"
		},
		[135] = {
			num = 200,
			name = "突破卡"
		},
		[136] = {
			num = 10,
			name = "竞技挑战券"
		},
		[137] = {
			num = 500,
			name = "公会贡献"
		}
	},
	{
		[138] = {
			num = 50,
			name = "路奇碎片"
		},
		[139] = {
			num = 50,
			name = "战桃丸碎片"
		},
		[140] = {
			num = 50,
			name = "黄猿碎片"
		},
		[141] = {
			num = 50,
			name = "卡普碎片"
		},
		[142] = {
			num = 50,
			name = "斯摩格碎片"
		},
		[143] = {
			num = 50,
			name = "青雉碎片"
		},
		[144] = {
			num = 50,
			name = "鹤碎片"
		},
		[145] = {
			num = 50,
			name = "战国碎片"
		},
		[146] = {
			num = 50,
			name = "麦哲伦碎片"
		},
		[147] = {
			num = 50,
			name = "赤犬碎片"
		},
		[148] = {
			num = 50,
			name = "藤虎碎片"
		},
		[149] = {
			num = 50,
			name = "泽法碎片"
		},
		[150] = {
			num = 50,
			name = "桃兔碎片"
		},
		[151] = {
			num = 50,
			name = "茶豚碎片"
		},
		[152] = {
			num = 50,
			name = "索隆(新世界)碎片"
		},
		[153] = {
			num = 50,
			name = "冥王雷利碎片"
		},
		[154] = {
			num = 50,
			name = "巴杰斯碎片"
		},
		[155] = {
			num = 50,
			name = "香克斯碎片"
		},
		[156] = {
			num = 50,
			name = "黑胡子(新世界)碎片"
		},
		[157] = {
			num = 50,
			name = "雨之希留碎片"
		},
		[158] = {
			num = 50,
			name = "艾斯(魂)碎片"
		},
		[159] = {
			num = 50,
			name = "白胡子碎片"
		},
		[160] = {
			num = 50,
			name = "路飞(新世界)碎片"
		},
		[161] = {
			num = 50,
			name = "马尔科碎片"
		},
		[162] = {
			num = 50,
			name = "卡塔库栗碎片"
		},
		[163] = {
			num = 50,
			name = "凯多碎片"
		},
		[164] = {
			num = 50,
			name = "BIG·MOM碎片"
		},
		[165] = {
			num = 50,
			name = "光月御田碎片"
		},
		[166] = {
			num = 50,
			name = "巴雷特碎片"
		},
		[167] = {
			num = 50,
			name = "杰克碎片"
		},
		[168] = {
			num = 50,
			name = "奎因碎片"
		},
		[169] = {
			num = 50,
			name = "索隆(和之国)碎片"
		},
		[170] = {
			num = 50,
			name = "罗(和之国)碎片"
		},
		[171] = {
			num = 50,
			name = "路飞(四档)碎片"
		},
		[172] = {
			num = 50,
			name = "路飞(尼卡)碎片"
		},
		[173] = {
			num = 50,
			name = "凯多(神龙)碎片"
		},
		[174] = {
			num = 50,
			name = "佛之战国碎片"
		},
		[175] = {
			num = 50,
			name = "金狮子·史基碎片"
		},
		[176] = {
			num = 50,
			name = "藤虎(三大将)碎片"
		},
		[177] = {
			num = 50,
			name = "凯撒碎片"
		},
		[178] = {
			num = 50,
			name = "黑胡子(四皇)碎片"
		},
		[179] = {
			num = 50,
			name = "山治(杰尔马)碎片"
		},
		[180] = {
			num = 50,
			name = "猫蝮蛇碎片"
		},
		[181] = {
			num = 50,
			name = "萨坦圣碎片"
		},
		[182] = {
			num = 50,
			name = "汉库克(女帝)碎片"
		},
		[183] = {
			num = 50,
			name = "克力架碎片"
		},
		[184] = {
			num = 50,
			name = "5星海军碎片"
		},
		[185] = {
			num = 50,
			name = "5星五皇碎片"
		},
		[186] = {
			num = 50,
			name = "5星随机碎片"
		},
		[187] = {
			num = 50,
			name = "5星海军五皇碎片"
		},
		[188] = {
			num = 50,
			name = "5星传奇碎片"
		},
		[190] = {
			num = 10,
			name = "强者招募令"
		},
		[191] = {
			num = 20,
			name = "高级寻宝券"
		},
		[192] = {
			num = 10000,
			name = "强化训练"
		},
		[193] = {
			num = 50,
			name = "神技晶石"
		},
		[194] = {
			num = 50,
			name = "原初意志"
		},
		[195] = {
			num = 50,
			name = "精英召唤卷"
		},
		[196] = {
			num = 50,
			name = "高级召唤卷"
		},
		[197] = {
			num = 1,
			name = "超级战技"
		},
		[198] = {
			num = 1,
			name = "传说战技"
		},
		[199] = {
			num = 1,
			name = "恶魔战技"
		},
		[200] = {
			num = 1,
			name = "觉醒石"
		},
		[201] = {
			num = 50,
			name = "5星随机碎片"
		},
		[202] = {
			num = 2,
			name = "精英召唤卷"
		},
		[203] = {
			num = 2,
			name = "高级召唤卷"
		},
		[204] = {
			num = 3000,
			name = "强化训练"
		},
		[205] = {
			num = 500,
			name = "公会贡献"
		},
		[206] = {
			num = 3,
			name = "皮肤碎片"
		},
		[207] = {
			num = 5000,
			name = "突破卡"
		},
		[208] = {
			num = 50,
			name = "神装碎片"
		}
	}
}
