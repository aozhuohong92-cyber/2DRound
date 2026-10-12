Config = Config or {}
Config.RecruitData = Config.RecruitData or {}
Config.RecruitData.data_partnersummon_data_length = 4
Config.RecruitData.data_partnersummon_data = {
	[100] = {
		name = "基础召唤",
		card_bg_res = "partnersummon_100",
		call_bg = "partnersummon_call_bg_100",
		call_bg_action = 147,
		action_name = "action",
		sort_id = 1,
		action_card_name = "action2",
		limit_dist_five_time = 0,
		group_id = 100,
		is_show = 0,
		limit_dist_five_count = 0,
		month_card_dist_five = 0,
		limit_id = {},
		draw_list = {
			1,
			10
		},
		item_once = {
			{
				10401,
				1
			}
		},
		item_five = {
			{
				10401,
				10
			}
		},
		ext_item_once = {},
		ext_item_five = {},
		exchange_once = {},
		exchange_once_gain = {
			{
				22,
				1000
			}
		},
		exchange_five = {},
		exchange_five_gain = {
			{
				22,
				10000
			}
		},
		limit_dist_five_lose = {},
		recruit_hero_gain = {
			{
				23,
				1
			}
		}
	},
	[200] = {
		name = "友情召唤",
		card_bg_res = "partnersummon_200",
		call_bg = "partnersummon_call_bg_200",
		call_bg_action = 158,
		action_name = "action2",
		sort_id = 2,
		action_card_name = "action1",
		limit_dist_five_time = 0,
		group_id = 200,
		is_show = 0,
		limit_dist_five_count = 0,
		month_card_dist_five = 0,
		limit_id = {},
		draw_list = {
			1,
			10
		},
		item_once = {
			{
				14,
				100
			}
		},
		item_five = {
			{
				14,
				1000
			}
		},
		ext_item_once = {},
		ext_item_five = {},
		exchange_once = {},
		exchange_once_gain = {
			{
				22,
				2000
			}
		},
		exchange_five = {},
		exchange_five_gain = {
			{
				22,
				20000
			}
		},
		limit_dist_five_lose = {},
		recruit_hero_gain = {
			{
				23,
				2
			}
		}
	},
	[300] = {
		name = "高级召唤",
		card_bg_res = "partnersummon_300",
		call_bg = "partnersummon_call_bg_100",
		call_bg_action = 147,
		action_name = "action",
		sort_id = 3,
		action_card_name = "action2",
		limit_dist_five_time = 0,
		group_id = 300,
		is_show = 0,
		limit_dist_five_count = 0,
		month_card_dist_five = 0,
		limit_id = {
			{
				"dun",
				10020
			}
		},
		draw_list = {
			1,
			10
		},
		item_once = {
			{
				10403,
				1
			}
		},
		item_five = {
			{
				10403,
				10
			}
		},
		ext_item_once = {
			{
				10409,
				1
			}
		},
		ext_item_five = {
			{
				10409,
				10
			}
		},
		exchange_once = {
			{
				3,
				220
			}
		},
		exchange_once_gain = {
			{
				22,
				5000
			}
		},
		exchange_five = {
			{
				3,
				2000
			}
		},
		exchange_five_gain = {
			{
				22,
				50000
			}
		},
		limit_dist_five_lose = {},
		recruit_hero_gain = {
			{
				23,
				20
			}
		}
	},
	[400] = {
		name = "积分召唤",
		card_bg_res = "partnersummon_400",
		call_bg = "partnersummon_call_bg_200",
		call_bg_action = 158,
		action_name = "action2",
		sort_id = 0,
		action_card_name = "action1",
		limit_dist_five_time = 0,
		group_id = 400,
		is_show = 1,
		limit_dist_five_count = 0,
		month_card_dist_five = 0,
		limit_id = {},
		draw_list = {
			1
		},
		item_once = {},
		item_five = {},
		ext_item_once = {},
		ext_item_five = {},
		exchange_once = {
			{
				23,
				1000
			}
		},
		exchange_once_gain = {},
		exchange_five = {},
		exchange_five_gain = {},
		limit_dist_five_lose = {},
		recruit_hero_gain = {}
	}
}

function Config.RecruitData.data_partnersummon_data_fun(slot0)
	slot1 = Config.RecruitData.data_partnersummon_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitData.data_partnersummon_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RecruitData.data_partnersummon_const_length = 8
Config.RecruitData.data_partnersummon_const = {
	common_s = {
		val = 10401,
		key = "common_s",
		desc = "单抽召唤道具ID"
	},
	senior_s = {
		val = 10402,
		key = "senior_s",
		desc = "5连抽召唤道具ID"
	},
	common_time = {
		val = 1,
		key = "common_time",
		desc = "普通召唤每天免费次数"
	},
	c_interval = {
		val = 3600,
		key = "c_interval",
		desc = "普通召唤免费次数间隔/s"
	},
	common_gold = {
		val = 5,
		key = "common_gold",
		desc = "金币召唤次数（每日）"
	},
	share_role = {
		val = 100,
		key = "share_role",
		desc = "角色首次分享获得红钻"
	},
	share_day = {
		val = 20,
		key = "share_day",
		desc = "每日首次分享获得红钻"
	},
	recruit_vip = {
		val = 3,
		key = "recruit_vip",
		desc = "积分召唤VIP等级限制"
	}
}

function Config.RecruitData.data_partnersummon_const_fun(slot0)
	slot1 = Config.RecruitData.data_partnersummon_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitData.data_partnersummon_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RecruitData.data_explain_length = 5
Config.RecruitData.data_explain = {
	{
		id = 1,
		title = "掉落概率",
		desc = "应国家有关法律规定，对游戏内[召唤]的产出概率进行公布，这些“ 概率”均是在大样本（大量用户）下的统计数值，与单个玩家的少量测试数据之间可能存在一定差异，<div fontcolor=#a95f0f>希望广大玩家理性消费，健康游戏。</div>"
	},
	{
		id = 2,
		title = "基础召唤",
		desc = [[
1星英雄                                                                             53.00%
2星英雄                                                                             36.00%
3星英雄                                                                              9.10%
4星英雄                                                                             1.50%
5星英雄                                                                              0.40%]]
	},
	{
		id = 3,
		title = "友情召唤",
		desc = [[
2星英雄                                                                             35.50%
3星英雄                                                                             50.00%
4星英雄                                                                             13.50%
5星英雄                                                                             1.00%]]
	},
	{
		id = 4,
		title = "高级召唤",
		desc = "3星英雄                                                                             80.00%\n4星英雄                                                                             15.00%\n5星英雄                                                                              5.00%"
	},
	{
		id = 5,
		title = "积分召唤",
		desc = "5星英雄                                                                             100.00%"
	}
}

function Config.RecruitData.data_explain_fun(slot0)
	slot1 = Config.RecruitData.data_explain[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitData.data_explain[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RecruitData.data_summon_data_length = 4
Config.RecruitData.data_summon_data = {
	[100] = {
		[24000] = {
			id = 100,
			summon_desc = "17.66",
			base_id = 24000
		},
		[25000] = {
			id = 100,
			summon_desc = "17.66",
			base_id = 25000
		},
		[26000] = {
			id = 100,
			summon_desc = "17.66",
			base_id = 26000
		},
		[24100] = {
			id = 100,
			summon_desc = "6",
			base_id = 24100
		},
		[24101] = {
			id = 100,
			summon_desc = "6",
			base_id = 24101
		},
		[25100] = {
			id = 100,
			summon_desc = "6",
			base_id = 25100
		},
		[25101] = {
			id = 100,
			summon_desc = "6",
			base_id = 25101
		},
		[26100] = {
			id = 100,
			summon_desc = "6",
			base_id = 26100
		},
		[26101] = {
			id = 100,
			summon_desc = "6",
			base_id = 26101
		},
		[24200] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 24200
		},
		[24201] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 24201
		},
		[24202] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 24202
		},
		[24203] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 24203
		},
		[24204] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 24204
		},
		[25200] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 25200
		},
		[25201] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 25201
		},
		[25202] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 25202
		},
		[25203] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 25203
		},
		[25204] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 25204
		},
		[26200] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 26200
		},
		[26201] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 26201
		},
		[26202] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 26202
		},
		[26203] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 26203
		},
		[26204] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 26204
		},
		[28200] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 28200
		},
		[27200] = {
			id = 100,
			summon_desc = "0.535294117647059",
			base_id = 27200
		},
		[24300] = {
			id = 100,
			summon_desc = "0.066",
			base_id = 24300
		},
		[24301] = {
			id = 100,
			summon_desc = "0.066",
			base_id = 24301
		},
		[24302] = {
			id = 100,
			summon_desc = "0.066",
			base_id = 24302
		},
		[24303] = {
			id = 100,
			summon_desc = "0.066",
			base_id = 24303
		},
		[24304] = {
			id = 100,
			summon_desc = "0.066",
			base_id = 24304
		},
		[25300] = {
			id = 100,
			summon_desc = "0.066",
			base_id = 25300
		},
		[25301] = {
			id = 100,
			summon_desc = "0.066",
			base_id = 25301
		},
		[25302] = {
			id = 100,
			summon_desc = "0.066",
			base_id = 25302
		},
		[25303] = {
			id = 100,
			summon_desc = "0.066",
			base_id = 25303
		},
		[25304] = {
			id = 100,
			summon_desc = "0.066",
			base_id = 25304
		},
		[26300] = {
			id = 100,
			summon_desc = "0.066",
			base_id = 26300
		},
		[26301] = {
			id = 100,
			summon_desc = "0.066",
			base_id = 26301
		},
		[26302] = {
			id = 100,
			summon_desc = "0.066",
			base_id = 26302
		},
		[26303] = {
			id = 100,
			summon_desc = "0.066",
			base_id = 26303
		},
		[26304] = {
			id = 100,
			summon_desc = "0.066",
			base_id = 26304
		},
		[27300] = {
			id = 100,
			summon_desc = "0.064",
			base_id = 27300
		},
		[27301] = {
			id = 100,
			summon_desc = "0.065",
			base_id = 27301
		},
		[27302] = {
			id = 100,
			summon_desc = "0.065",
			base_id = 27302
		},
		[27303] = {
			id = 100,
			summon_desc = "0.065",
			base_id = 27303
		},
		[28300] = {
			id = 100,
			summon_desc = "0.064",
			base_id = 28300
		},
		[28301] = {
			id = 100,
			summon_desc = "0.065",
			base_id = 28301
		},
		[28302] = {
			id = 100,
			summon_desc = "0.065",
			base_id = 28302
		},
		[28303] = {
			id = 100,
			summon_desc = "0.065",
			base_id = 28303
		},
		[24400] = {
			id = 100,
			summon_desc = "0.011",
			base_id = 24400
		},
		[24401] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 24401
		},
		[24402] = {
			id = 100,
			summon_desc = "0.011",
			base_id = 24402
		},
		[24403] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 24403
		},
		[24404] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 24404
		},
		[24405] = {
			id = 100,
			summon_desc = "0.023",
			base_id = 24405
		},
		[24406] = {
			id = 100,
			summon_desc = "0.011",
			base_id = 24406
		},
		[24407] = {
			id = 100,
			summon_desc = "0.023",
			base_id = 24407
		},
		[24408] = {
			id = 100,
			summon_desc = "0.023",
			base_id = 24408
		},
		[24409] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 24409
		},
		[24410] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 24410
		},
		[24411] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 24411
		},
		[25400] = {
			id = 100,
			summon_desc = "0.011",
			base_id = 25400
		},
		[25401] = {
			id = 100,
			summon_desc = "0.011",
			base_id = 25401
		},
		[25402] = {
			id = 100,
			summon_desc = "0.023",
			base_id = 25402
		},
		[25403] = {
			id = 100,
			summon_desc = "0.011",
			base_id = 25403
		},
		[25404] = {
			id = 100,
			summon_desc = "0.011",
			base_id = 25404
		},
		[25405] = {
			id = 100,
			summon_desc = "0.023",
			base_id = 25405
		},
		[25406] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 25406
		},
		[25407] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 25407
		},
		[25408] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 25408
		},
		[25409] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 25409
		},
		[25410] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 25410
		},
		[25411] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 25411
		},
		[26400] = {
			id = 100,
			summon_desc = "0.011",
			base_id = 26400
		},
		[26401] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 26401
		},
		[26402] = {
			id = 100,
			summon_desc = "0.023",
			base_id = 26402
		},
		[26403] = {
			id = 100,
			summon_desc = "0.011",
			base_id = 26403
		},
		[26404] = {
			id = 100,
			summon_desc = "0.023",
			base_id = 26404
		},
		[26405] = {
			id = 100,
			summon_desc = "0.011",
			base_id = 26405
		},
		[26406] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 26406
		},
		[26407] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 26407
		},
		[26408] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 26408
		},
		[26409] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 26409
		},
		[26410] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 26410
		},
		[26411] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 26411
		},
		[27400] = {
			id = 100,
			summon_desc = "0.011",
			base_id = 27400
		},
		[27401] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 27401
		},
		[27402] = {
			id = 100,
			summon_desc = "0.008",
			base_id = 27402
		},
		[27403] = {
			id = 100,
			summon_desc = "0.008",
			base_id = 27403
		},
		[27404] = {
			id = 100,
			summon_desc = "0.011",
			base_id = 27404
		},
		[27405] = {
			id = 100,
			summon_desc = "0.008",
			base_id = 27405
		},
		[27406] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 27406
		},
		[27407] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 27407
		},
		[27408] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 27408
		},
		[27409] = {
			id = 100,
			summon_desc = "0.002",
			base_id = 27409
		},
		[28400] = {
			id = 100,
			summon_desc = "0.011",
			base_id = 28400
		},
		[28401] = {
			id = 100,
			summon_desc = "0.0017",
			base_id = 28401
		},
		[28402] = {
			id = 100,
			summon_desc = "0.008",
			base_id = 28402
		},
		[28403] = {
			id = 100,
			summon_desc = "0.0017",
			base_id = 28403
		},
		[28404] = {
			id = 100,
			summon_desc = "0.008",
			base_id = 28404
		},
		[28405] = {
			id = 100,
			summon_desc = "0.011",
			base_id = 28405
		},
		[28406] = {
			id = 100,
			summon_desc = "0.0017",
			base_id = 28406
		},
		[28407] = {
			id = 100,
			summon_desc = "0.0017",
			base_id = 28407
		},
		[28408] = {
			id = 100,
			summon_desc = "0.0017",
			base_id = 28408
		},
		[28409] = {
			id = 100,
			summon_desc = "0.0017",
			base_id = 28409
		}
	},
	[200] = {
		[24100] = {
			id = 200,
			summon_desc = "5.917",
			base_id = 24100
		},
		[24101] = {
			id = 200,
			summon_desc = "5.917",
			base_id = 24101
		},
		[25100] = {
			id = 200,
			summon_desc = "5.916",
			base_id = 25100
		},
		[25101] = {
			id = 200,
			summon_desc = "5.916",
			base_id = 25101
		},
		[26100] = {
			id = 200,
			summon_desc = "5.916",
			base_id = 26100
		},
		[26101] = {
			id = 200,
			summon_desc = "5.916",
			base_id = 26101
		},
		[24200] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 24200
		},
		[24201] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 24201
		},
		[24202] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 24202
		},
		[24203] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 24203
		},
		[24204] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 24204
		},
		[25200] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 25200
		},
		[25201] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 25201
		},
		[25202] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 25202
		},
		[25203] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 25203
		},
		[25204] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 25204
		},
		[26200] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 26200
		},
		[26201] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 26201
		},
		[26202] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 26202
		},
		[26203] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 26203
		},
		[26204] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 26204
		},
		[28200] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 28200
		},
		[27200] = {
			id = 200,
			summon_desc = "2.94117647058824",
			base_id = 27200
		},
		[24300] = {
			id = 200,
			summon_desc = "0.6",
			base_id = 24300
		},
		[24301] = {
			id = 200,
			summon_desc = "0.6",
			base_id = 24301
		},
		[24302] = {
			id = 200,
			summon_desc = "0.6",
			base_id = 24302
		},
		[24303] = {
			id = 200,
			summon_desc = "0.6",
			base_id = 24303
		},
		[24304] = {
			id = 200,
			summon_desc = "0.6",
			base_id = 24304
		},
		[25300] = {
			id = 200,
			summon_desc = "0.6",
			base_id = 25300
		},
		[25301] = {
			id = 200,
			summon_desc = "0.6",
			base_id = 25301
		},
		[25302] = {
			id = 200,
			summon_desc = "0.6",
			base_id = 25302
		},
		[25303] = {
			id = 200,
			summon_desc = "0.6",
			base_id = 25303
		},
		[25304] = {
			id = 200,
			summon_desc = "0.6",
			base_id = 25304
		},
		[26300] = {
			id = 200,
			summon_desc = "0.6",
			base_id = 26300
		},
		[26301] = {
			id = 200,
			summon_desc = "0.6",
			base_id = 26301
		},
		[26302] = {
			id = 200,
			summon_desc = "0.6",
			base_id = 26302
		},
		[26303] = {
			id = 200,
			summon_desc = "0.6",
			base_id = 26303
		},
		[26304] = {
			id = 200,
			summon_desc = "0.6",
			base_id = 26304
		},
		[27300] = {
			id = 200,
			summon_desc = "0.5625",
			base_id = 27300
		},
		[27301] = {
			id = 200,
			summon_desc = "0.5625",
			base_id = 27301
		},
		[27302] = {
			id = 200,
			summon_desc = "0.5625",
			base_id = 27302
		},
		[27303] = {
			id = 200,
			summon_desc = "0.5625",
			base_id = 27303
		},
		[28300] = {
			id = 200,
			summon_desc = "0.5625",
			base_id = 28300
		},
		[28301] = {
			id = 200,
			summon_desc = "0.5625",
			base_id = 28301
		},
		[28302] = {
			id = 200,
			summon_desc = "0.5625",
			base_id = 28302
		},
		[28303] = {
			id = 200,
			summon_desc = "0.5625",
			base_id = 28303
		},
		[24400] = {
			id = 200,
			summon_desc = "0.013",
			base_id = 24400
		},
		[24401] = {
			id = 200,
			summon_desc = "0.005",
			base_id = 24401
		},
		[24402] = {
			id = 200,
			summon_desc = "0.014",
			base_id = 24402
		},
		[24403] = {
			id = 200,
			summon_desc = "0.005",
			base_id = 24403
		},
		[24404] = {
			id = 200,
			summon_desc = "0.005",
			base_id = 24404
		},
		[24405] = {
			id = 200,
			summon_desc = "0.069",
			base_id = 24405
		},
		[24406] = {
			id = 200,
			summon_desc = "0.014",
			base_id = 24406
		},
		[24407] = {
			id = 200,
			summon_desc = "0.069",
			base_id = 24407
		},
		[24408] = {
			id = 200,
			summon_desc = "0.069",
			base_id = 24408
		},
		[24409] = {
			id = 200,
			summon_desc = "0.005",
			base_id = 24409
		},
		[24410] = {
			id = 200,
			summon_desc = "0.005",
			base_id = 24410
		},
		[24411] = {
			id = 200,
			summon_desc = "0.005",
			base_id = 24411
		},
		[25400] = {
			id = 200,
			summon_desc = "0.013",
			base_id = 25400
		},
		[25401] = {
			id = 200,
			summon_desc = "0.014",
			base_id = 25401
		},
		[25402] = {
			id = 200,
			summon_desc = "0.069",
			base_id = 25402
		},
		[25403] = {
			id = 200,
			summon_desc = "0.013",
			base_id = 25403
		},
		[25404] = {
			id = 200,
			summon_desc = "0.014",
			base_id = 25404
		},
		[25405] = {
			id = 200,
			summon_desc = "0.069",
			base_id = 25405
		},
		[25406] = {
			id = 200,
			summon_desc = "0.0043",
			base_id = 25406
		},
		[25407] = {
			id = 200,
			summon_desc = "0.0043",
			base_id = 25407
		},
		[25408] = {
			id = 200,
			summon_desc = "0.0043",
			base_id = 25408
		},
		[25409] = {
			id = 200,
			summon_desc = "0.0043",
			base_id = 25409
		},
		[25410] = {
			id = 200,
			summon_desc = "0.0043",
			base_id = 25410
		},
		[25411] = {
			id = 200,
			summon_desc = "0.0043",
			base_id = 25411
		},
		[26400] = {
			id = 200,
			summon_desc = "0.013",
			base_id = 26400
		},
		[26401] = {
			id = 200,
			summon_desc = "0.0043",
			base_id = 26401
		},
		[26402] = {
			id = 200,
			summon_desc = "0.069",
			base_id = 26402
		},
		[26403] = {
			id = 200,
			summon_desc = "0.014",
			base_id = 26403
		},
		[26404] = {
			id = 200,
			summon_desc = "0.069",
			base_id = 26404
		},
		[26405] = {
			id = 200,
			summon_desc = "0.013",
			base_id = 26405
		},
		[26406] = {
			id = 200,
			summon_desc = "0.0043",
			base_id = 26406
		},
		[26407] = {
			id = 200,
			summon_desc = "0.0043",
			base_id = 26407
		},
		[26408] = {
			id = 200,
			summon_desc = "0.0043",
			base_id = 26408
		},
		[26409] = {
			id = 200,
			summon_desc = "0.0043",
			base_id = 26409
		},
		[26410] = {
			id = 200,
			summon_desc = "0.0043",
			base_id = 26410
		},
		[26411] = {
			id = 200,
			summon_desc = "0.0043",
			base_id = 26411
		},
		[27400] = {
			id = 200,
			summon_desc = "0.034",
			base_id = 27400
		},
		[27401] = {
			id = 200,
			summon_desc = "0.003",
			base_id = 27401
		},
		[27402] = {
			id = 200,
			summon_desc = "0.026",
			base_id = 27402
		},
		[27403] = {
			id = 200,
			summon_desc = "0.026",
			base_id = 27403
		},
		[27404] = {
			id = 200,
			summon_desc = "0.034",
			base_id = 27404
		},
		[27405] = {
			id = 200,
			summon_desc = "0.026",
			base_id = 27405
		},
		[27406] = {
			id = 200,
			summon_desc = "0.003",
			base_id = 27406
		},
		[27407] = {
			id = 200,
			summon_desc = "0.003",
			base_id = 27407
		},
		[27408] = {
			id = 200,
			summon_desc = "0.003",
			base_id = 27408
		},
		[27409] = {
			id = 200,
			summon_desc = "0.003",
			base_id = 27409
		},
		[28400] = {
			id = 200,
			summon_desc = "0.034",
			base_id = 28400
		},
		[28401] = {
			id = 200,
			summon_desc = "0.0033",
			base_id = 28401
		},
		[28402] = {
			id = 200,
			summon_desc = "0.025",
			base_id = 28402
		},
		[28403] = {
			id = 200,
			summon_desc = "0.0033",
			base_id = 28403
		},
		[28404] = {
			id = 200,
			summon_desc = "0.025",
			base_id = 28404
		},
		[28405] = {
			id = 200,
			summon_desc = "0.034",
			base_id = 28405
		},
		[28406] = {
			id = 200,
			summon_desc = "0.0033",
			base_id = 28406
		},
		[28407] = {
			id = 200,
			summon_desc = "0.0033",
			base_id = 28407
		},
		[28408] = {
			id = 200,
			summon_desc = "0.0033",
			base_id = 28408
		},
		[28409] = {
			id = 200,
			summon_desc = "0.0033",
			base_id = 28409
		}
	},
	[300] = {
		[24200] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 24200
		},
		[24201] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 24201
		},
		[24202] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 24202
		},
		[24203] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 24203
		},
		[24204] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 24204
		},
		[25200] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 25200
		},
		[25201] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 25201
		},
		[25202] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 25202
		},
		[25203] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 25203
		},
		[25204] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 25204
		},
		[26200] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 26200
		},
		[26201] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 26201
		},
		[26202] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 26202
		},
		[26203] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 26203
		},
		[26204] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 26204
		},
		[28200] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 28200
		},
		[27200] = {
			id = 300,
			summon_desc = "4.7",
			base_id = 27200
		},
		[24300] = {
			id = 300,
			summon_desc = "0.666666666666667",
			base_id = 24300
		},
		[24301] = {
			id = 300,
			summon_desc = "0.666666666666667",
			base_id = 24301
		},
		[24302] = {
			id = 300,
			summon_desc = "0.666666666666667",
			base_id = 24302
		},
		[24303] = {
			id = 300,
			summon_desc = "0.666666666666667",
			base_id = 24303
		},
		[24304] = {
			id = 300,
			summon_desc = "0.666666666666667",
			base_id = 24304
		},
		[25300] = {
			id = 300,
			summon_desc = "0.666666666666667",
			base_id = 25300
		},
		[25301] = {
			id = 300,
			summon_desc = "0.666666666666667",
			base_id = 25301
		},
		[25302] = {
			id = 300,
			summon_desc = "0.666666666666667",
			base_id = 25302
		},
		[25303] = {
			id = 300,
			summon_desc = "0.666666666666667",
			base_id = 25303
		},
		[25304] = {
			id = 300,
			summon_desc = "0.666666666666667",
			base_id = 25304
		},
		[26300] = {
			id = 300,
			summon_desc = "0.666666666666667",
			base_id = 26300
		},
		[26301] = {
			id = 300,
			summon_desc = "0.666666666666667",
			base_id = 26301
		},
		[26302] = {
			id = 300,
			summon_desc = "0.666666666666667",
			base_id = 26302
		},
		[26303] = {
			id = 300,
			summon_desc = "0.666666666666667",
			base_id = 26303
		},
		[26304] = {
			id = 300,
			summon_desc = "0.666666666666667",
			base_id = 26304
		},
		[27300] = {
			id = 300,
			summon_desc = "0.63",
			base_id = 27300
		},
		[27301] = {
			id = 300,
			summon_desc = "0.63",
			base_id = 27301
		},
		[27302] = {
			id = 300,
			summon_desc = "0.63",
			base_id = 27302
		},
		[27303] = {
			id = 300,
			summon_desc = "0.63",
			base_id = 27303
		},
		[28300] = {
			id = 300,
			summon_desc = "0.63",
			base_id = 28300
		},
		[28301] = {
			id = 300,
			summon_desc = "0.63",
			base_id = 28301
		},
		[28302] = {
			id = 300,
			summon_desc = "0.63",
			base_id = 28302
		},
		[28303] = {
			id = 300,
			summon_desc = "0.63",
			base_id = 28303
		},
		[24400] = {
			id = 300,
			summon_desc = "0.071",
			base_id = 24400
		},
		[24401] = {
			id = 300,
			summon_desc = "0.03",
			base_id = 24401
		},
		[24402] = {
			id = 300,
			summon_desc = "0.071",
			base_id = 24402
		},
		[24403] = {
			id = 300,
			summon_desc = "0.03",
			base_id = 24403
		},
		[24404] = {
			id = 300,
			summon_desc = "0.03",
			base_id = 24404
		},
		[24405] = {
			id = 300,
			summon_desc = "0.37",
			base_id = 24405
		},
		[24406] = {
			id = 300,
			summon_desc = "0.071",
			base_id = 24406
		},
		[24407] = {
			id = 300,
			summon_desc = "0.37",
			base_id = 24407
		},
		[24408] = {
			id = 300,
			summon_desc = "0.37",
			base_id = 24408
		},
		[24409] = {
			id = 300,
			summon_desc = "0.03",
			base_id = 24409
		},
		[24410] = {
			id = 300,
			summon_desc = "0.03",
			base_id = 24410
		},
		[24411] = {
			id = 300,
			summon_desc = "0.03",
			base_id = 24411
		},
		[25400] = {
			id = 300,
			summon_desc = "0.071",
			base_id = 25400
		},
		[25401] = {
			id = 300,
			summon_desc = "0.071",
			base_id = 25401
		},
		[25402] = {
			id = 300,
			summon_desc = "0.37",
			base_id = 25402
		},
		[25403] = {
			id = 300,
			summon_desc = "0.071",
			base_id = 25403
		},
		[25404] = {
			id = 300,
			summon_desc = "0.071",
			base_id = 25404
		},
		[25405] = {
			id = 300,
			summon_desc = "0.37",
			base_id = 25405
		},
		[25406] = {
			id = 300,
			summon_desc = "0.02",
			base_id = 25406
		},
		[25407] = {
			id = 300,
			summon_desc = "0.02",
			base_id = 25407
		},
		[25408] = {
			id = 300,
			summon_desc = "0.02",
			base_id = 25408
		},
		[25409] = {
			id = 300,
			summon_desc = "0.02",
			base_id = 25409
		},
		[25410] = {
			id = 300,
			summon_desc = "0.02",
			base_id = 25410
		},
		[25411] = {
			id = 300,
			summon_desc = "0.02",
			base_id = 25411
		},
		[25412] = {
			id = 300,
			summon_desc = "0.02",
			base_id = 25412
		},
		[25413] = {
			id = 300,
			summon_desc = "0.02",
			base_id = 25413
		},
		[26400] = {
			id = 300,
			summon_desc = "0.071",
			base_id = 26400
		},
		[26401] = {
			id = 300,
			summon_desc = "0.025",
			base_id = 26401
		},
		[26402] = {
			id = 300,
			summon_desc = "0.37",
			base_id = 26402
		},
		[26403] = {
			id = 300,
			summon_desc = "0.071",
			base_id = 26403
		},
		[26404] = {
			id = 300,
			summon_desc = "0.37",
			base_id = 26404
		},
		[26405] = {
			id = 300,
			summon_desc = "0.071",
			base_id = 26405
		},
		[26406] = {
			id = 300,
			summon_desc = "0.025",
			base_id = 26406
		},
		[26407] = {
			id = 300,
			summon_desc = "0.025",
			base_id = 26407
		},
		[26408] = {
			id = 300,
			summon_desc = "0.025",
			base_id = 26408
		},
		[26409] = {
			id = 300,
			summon_desc = "0.025",
			base_id = 26409
		},
		[26410] = {
			id = 300,
			summon_desc = "0.025",
			base_id = 26410
		},
		[26411] = {
			id = 300,
			summon_desc = "0.025",
			base_id = 26411
		},
		[27400] = {
			id = 300,
			summon_desc = "0.154",
			base_id = 27400
		},
		[27401] = {
			id = 300,
			summon_desc = "0.012",
			base_id = 27401
		},
		[27402] = {
			id = 300,
			summon_desc = "0.116",
			base_id = 27402
		},
		[27403] = {
			id = 300,
			summon_desc = "0.116",
			base_id = 27403
		},
		[27404] = {
			id = 300,
			summon_desc = "0.154",
			base_id = 27404
		},
		[27405] = {
			id = 300,
			summon_desc = "0.116",
			base_id = 27405
		},
		[27406] = {
			id = 300,
			summon_desc = "0.012",
			base_id = 27406
		},
		[27407] = {
			id = 300,
			summon_desc = "0.012",
			base_id = 27407
		},
		[27408] = {
			id = 300,
			summon_desc = "0.012",
			base_id = 27408
		},
		[27409] = {
			id = 300,
			summon_desc = "0.012",
			base_id = 27409
		},
		[27410] = {
			id = 300,
			summon_desc = "0.012",
			base_id = 27410
		},
		[28410] = {
			id = 300,
			summon_desc = "0.012",
			base_id = 28410
		},
		[27412] = {
			id = 300,
			summon_desc = "0.012",
			base_id = 27412
		},
		[28400] = {
			id = 300,
			summon_desc = "0.153",
			base_id = 28400
		},
		[28401] = {
			id = 300,
			summon_desc = "0.0125",
			base_id = 28401
		},
		[28402] = {
			id = 300,
			summon_desc = "0.116",
			base_id = 28402
		},
		[28403] = {
			id = 300,
			summon_desc = "0.0125",
			base_id = 28403
		},
		[28404] = {
			id = 300,
			summon_desc = "0.116",
			base_id = 28404
		},
		[28405] = {
			id = 300,
			summon_desc = "0.153",
			base_id = 28405
		},
		[28406] = {
			id = 300,
			summon_desc = "0.0125",
			base_id = 28406
		},
		[28407] = {
			id = 300,
			summon_desc = "0.0125",
			base_id = 28407
		},
		[28408] = {
			id = 300,
			summon_desc = "0.0125",
			base_id = 28408
		},
		[28409] = {
			id = 300,
			summon_desc = "0.0125",
			base_id = 28409
		},
		[28411] = {
			id = 300,
			summon_desc = "0.0125",
			base_id = 28411
		},
		[27411] = {
			id = 300,
			summon_desc = "0.0125",
			base_id = 27411
		},
		[28412] = {
			id = 300,
			summon_desc = "0.0125",
			base_id = 28412
		},
		[28413] = {
			id = 300,
			summon_desc = "0.0125",
			base_id = 28413
		}
	},
	[400] = {
		[24400] = {
			id = 400,
			summon_desc = "1.3",
			base_id = 24400
		},
		[24401] = {
			id = 400,
			summon_desc = "0.42",
			base_id = 24401
		},
		[24402] = {
			id = 400,
			summon_desc = "1.3",
			base_id = 24402
		},
		[24403] = {
			id = 400,
			summon_desc = "0.42",
			base_id = 24403
		},
		[24404] = {
			id = 400,
			summon_desc = "0.42",
			base_id = 24404
		},
		[24405] = {
			id = 400,
			summon_desc = "6.4",
			base_id = 24405
		},
		[24406] = {
			id = 400,
			summon_desc = "1.3",
			base_id = 24406
		},
		[24407] = {
			id = 400,
			summon_desc = "6.5",
			base_id = 24407
		},
		[24408] = {
			id = 400,
			summon_desc = "6.5",
			base_id = 24408
		},
		[24409] = {
			id = 400,
			summon_desc = "0.42",
			base_id = 24409
		},
		[24410] = {
			id = 400,
			summon_desc = "0.42",
			base_id = 24410
		},
		[24411] = {
			id = 400,
			summon_desc = "0.42",
			base_id = 24411
		},
		[25400] = {
			id = 400,
			summon_desc = "1.3",
			base_id = 25400
		},
		[25401] = {
			id = 400,
			summon_desc = "1.3",
			base_id = 25401
		},
		[25402] = {
			id = 400,
			summon_desc = "6.4",
			base_id = 25402
		},
		[25403] = {
			id = 400,
			summon_desc = "1.3",
			base_id = 25403
		},
		[25404] = {
			id = 400,
			summon_desc = "1.3",
			base_id = 25404
		},
		[25405] = {
			id = 400,
			summon_desc = "6.4",
			base_id = 25405
		},
		[25406] = {
			id = 400,
			summon_desc = "0.33",
			base_id = 25406
		},
		[25407] = {
			id = 400,
			summon_desc = "0.33",
			base_id = 25407
		},
		[25408] = {
			id = 400,
			summon_desc = "0.33",
			base_id = 25408
		},
		[25409] = {
			id = 400,
			summon_desc = "0.33",
			base_id = 25409
		},
		[25410] = {
			id = 400,
			summon_desc = "0.33",
			base_id = 25410
		},
		[25411] = {
			id = 400,
			summon_desc = "0.33",
			base_id = 25411
		},
		[26400] = {
			id = 400,
			summon_desc = "1.3",
			base_id = 26400
		},
		[26401] = {
			id = 400,
			summon_desc = "0.3",
			base_id = 26401
		},
		[26402] = {
			id = 400,
			summon_desc = "6.4",
			base_id = 26402
		},
		[26403] = {
			id = 400,
			summon_desc = "1.3",
			base_id = 26403
		},
		[26404] = {
			id = 400,
			summon_desc = "6.4",
			base_id = 26404
		},
		[26405] = {
			id = 400,
			summon_desc = "1.3",
			base_id = 26405
		},
		[26406] = {
			id = 400,
			summon_desc = "0.3",
			base_id = 26406
		},
		[26407] = {
			id = 400,
			summon_desc = "0.3",
			base_id = 26407
		},
		[26408] = {
			id = 400,
			summon_desc = "0.3",
			base_id = 26408
		},
		[26409] = {
			id = 400,
			summon_desc = "0.3",
			base_id = 26409
		},
		[26410] = {
			id = 400,
			summon_desc = "0.3",
			base_id = 26410
		},
		[26411] = {
			id = 400,
			summon_desc = "0.4",
			base_id = 26411
		},
		[27400] = {
			id = 400,
			summon_desc = "6.374",
			base_id = 27400
		},
		[27401] = {
			id = 400,
			summon_desc = "0.35",
			base_id = 27401
		},
		[27402] = {
			id = 400,
			summon_desc = "1.2",
			base_id = 27402
		},
		[27403] = {
			id = 400,
			summon_desc = "1.2",
			base_id = 27403
		},
		[27404] = {
			id = 400,
			summon_desc = "6.374",
			base_id = 27404
		},
		[27405] = {
			id = 400,
			summon_desc = "1.2",
			base_id = 27405
		},
		[27406] = {
			id = 400,
			summon_desc = "0.35",
			base_id = 27406
		},
		[27407] = {
			id = 400,
			summon_desc = "0.35",
			base_id = 27407
		},
		[27408] = {
			id = 400,
			summon_desc = "0.35",
			base_id = 27408
		},
		[27409] = {
			id = 400,
			summon_desc = "0.35",
			base_id = 27409
		},
		[28400] = {
			id = 400,
			summon_desc = "6.375",
			base_id = 28400
		},
		[28401] = {
			id = 400,
			summon_desc = "0.3",
			base_id = 28401
		},
		[28402] = {
			id = 400,
			summon_desc = "1.2",
			base_id = 28402
		},
		[28403] = {
			id = 400,
			summon_desc = "0.3",
			base_id = 28403
		},
		[28404] = {
			id = 400,
			summon_desc = "1.2",
			base_id = 28404
		},
		[28405] = {
			id = 400,
			summon_desc = "6.375",
			base_id = 28405
		},
		[28406] = {
			id = 400,
			summon_desc = "0.3",
			base_id = 28406
		},
		[28407] = {
			id = 400,
			summon_desc = "0.3",
			base_id = 28407
		},
		[28408] = {
			id = 400,
			summon_desc = "0.3",
			base_id = 28408
		},
		[28409] = {
			id = 400,
			summon_desc = "0.3",
			base_id = 28409
		}
	}
}
