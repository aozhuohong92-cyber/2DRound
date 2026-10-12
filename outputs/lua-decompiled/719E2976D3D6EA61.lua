Config = Config or {}
Config.HolidaySpriteLotteryData = Config.HolidaySpriteLotteryData or {}
Config.HolidaySpriteLotteryData.data_const_length = 11
Config.HolidaySpriteLotteryData.data_const = {
	common_s = {
		val = 10415,
		key = "common_s",
		desc = "召唤道具ID"
	},
	common_b = {
		val = 10416,
		key = "common_b",
		desc = "召唤道具ID"
	},
	common_time = {
		val = 1,
		key = "common_time",
		desc = "特殊召唤每天免费次数"
	},
	c_interval = {
		val = 86400,
		key = "c_interval",
		desc = "普通召唤免费次数间隔/s"
	},
	lucky_sprite_num = {
		val = 1,
		key = "lucky_sprite_num",
		desc = "幸运精灵可设置上限"
	},
	lucky_sprite_ids = {
		key = "lucky_sprite_ids",
		desc = "幸运精灵可设置的BID",
		val = {
			113001,
			113002,
			113003,
			113004,
			113005,
			113006,
			113007,
			113008,
			113009
		}
	},
	lucky_sprite_add_pro = {
		val = 2000,
		key = "lucky_sprite_add_pro",
		desc = "幸运精灵增加权重（N倍）"
	},
	sprite_lottery_daily_limit = {
		val = 120,
		key = "sprite_lottery_daily_limit",
		desc = "单日抽奖次数上限"
	},
	reward_desc = {
		val = 1,
		key = "reward_desc",
		desc = "1.每次召唤可获得<div fontcolor=#32CD32>1点积分</div>\n2.累计积分可获得不同档次的奖励\n3.每获得120积分可获得<div fontcolor=#32CD32>橙色自选精灵礼盒</div>"
	},
	sprite_lottery_rare_list = {
		key = "sprite_lottery_rare_list",
		desc = "抽奖需要弹详情的精灵品质列表",
		val = {
			4
		}
	},
	common_gold = {
		val = 20,
		key = "common_gold",
		desc = "金币召唤次数（每日）"
	}
}

function Config.HolidaySpriteLotteryData.data_const_fun(slot0)
	slot1 = Config.HolidaySpriteLotteryData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidaySpriteLotteryData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidaySpriteLotteryData.data_action_length = 7
Config.HolidaySpriteLotteryData.data_action = {
	[0] = {
		group_id = 110,
		camp_id = 0,
		desc = "1.许愿池可放入一个<div fontcolor=#c23f35>橙色幽灵</div>\n2.幽灵召唤抽到橙色幽灵时，会有更高的几率获得许愿池中的英雄，但不会增加橙色品质幽灵的总掉率\n3.每次10连召唤必定获得<div fontcolor=#c23f35>紫色及以上品质的幽灵。</div>"
	},
	[48034] = {
		group_id = 101,
		camp_id = 48034,
		desc = [[
1.活动期间，幽灵召唤可抽取到不同品质的幽灵和其他道具材料。召唤中获得的橙色幽灵必为<div fontcolor=#c23f35>【诅咒幽灵】。</div>
2.每次10连召唤必定获得<div fontcolor=#c23f35>紫色及以上品质的幽灵。</div>
3.在幽灵召唤中，每50次召唤，<div fontcolor=#c23f35>必定获取当期直升主题的橙色幽灵</div>。
4.通过幽灵召唤获取到本期直升主题的橙色幽灵时，最大剩余召唤次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算。
5.扭蛋机10连召唤所展示的奖励，<div fontcolor=#c23f35>随机显示为10连获得奖励中品质最高的某个奖励</div>，三栏显示同样内容。]]
	},
	[49513] = {
		group_id = 102,
		camp_id = 49513,
		desc = [[
1.活动期间，幽灵召唤可抽取到不同品质的幽灵和其他道具材料。召唤中获得的橙色幽灵必为<div fontcolor=#c23f35>【浪漫幽灵】。</div>
2.每次10连召唤必定获得<div fontcolor=#c23f35>紫色及以上品质的幽灵。</div>
3.在幽灵召唤中，每50次召唤，<div fontcolor=#c23f35>必定获取当期直升主题的橙色幽灵</div>。
4.通过幽灵召唤获取到本期直升主题的橙色幽灵时，最大剩余召唤次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算。
5.扭蛋机10连召唤所展示的奖励，<div fontcolor=#c23f35>随机显示为10连获得奖励中品质最高的某个奖励</div>，三栏显示同样内容。]]
	},
	[49813] = {
		group_id = 103,
		camp_id = 49813,
		desc = [[
1.活动期间，幽灵召唤可抽取到不同品质的幽灵和其他道具材料。召唤中获得的橙色幽灵必为<div fontcolor=#c23f35>【收割幽灵】。</div>
2.每次10连召唤必定获得<div fontcolor=#c23f35>紫色及以上品质的幽灵。</div>
3.在幽灵召唤中，每50次召唤，<div fontcolor=#c23f35>必定获取当期直升主题的橙色幽灵</div>。
4.通过幽灵召唤获取到本期直升主题的橙色幽灵时，最大剩余召唤次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算。
5.扭蛋机10连召唤所展示的奖励，<div fontcolor=#c23f35>随机显示为10连获得奖励中品质最高的某个奖励</div>，三栏显示同样内容。]]
	},
	[32109] = {
		group_id = 104,
		camp_id = 32109,
		desc = [[
1.活动期间，幽灵召唤可抽取到不同品质的幽灵和其他道具材料。召唤中获得的橙色幽灵必为<div fontcolor=#c23f35>【鬼岛幽灵】。</div>
2.每次10连召唤必定获得<div fontcolor=#c23f35>紫色及以上品质的幽灵。</div>
3.在幽灵召唤中，每50次召唤，<div fontcolor=#c23f35>必定获取当期直升主题的橙色幽灵</div>。
4.通过幽灵召唤获取到本期直升主题的橙色幽灵时，最大剩余召唤次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算。
5.扭蛋机10连召唤所展示的奖励，<div fontcolor=#c23f35>随机显示为10连获得奖励中品质最高的某个奖励</div>，三栏显示同样内容。]]
	},
	[40352] = {
		group_id = 105,
		camp_id = 40352,
		desc = [[
1.活动期间，幽灵召唤可抽取到不同品质的幽灵和其他道具材料。召唤中获得的橙色幽灵必为<div fontcolor=#c23f35>【鬼岛幽灵】。</div>
2.每次10连召唤必定获得<div fontcolor=#c23f35>紫色及以上品质的幽灵。</div>
3.在幽灵召唤中，每50次召唤，<div fontcolor=#c23f35>必定获取当期直升主题的橙色幽灵</div>。
4.通过幽灵召唤获取到本期直升主题的橙色幽灵时，最大剩余召唤次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算。
5.扭蛋机10连召唤所展示的奖励，<div fontcolor=#c23f35>随机显示为10连获得奖励中品质最高的某个奖励</div>，三栏显示同样内容。]]
	},
	[39221] = {
		group_id = 106,
		camp_id = 39221,
		desc = [[
1.活动期间，幽灵召唤可抽取到不同品质的幽灵和其他道具材料。召唤中获得的橙色幽灵必为<div fontcolor=#c23f35>【鬼岛幽灵】。</div>
2.每次10连召唤必定获得<div fontcolor=#c23f35>紫色及以上品质的幽灵。</div>
3.在幽灵召唤中，每50次召唤，<div fontcolor=#c23f35>必定获取当期直升主题的橙色幽灵</div>。
4.通过幽灵召唤获取到本期直升主题的橙色幽灵时，最大剩余召唤次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算。
5.扭蛋机10连召唤所展示的奖励，<div fontcolor=#c23f35>随机显示为10连获得奖励中品质最高的某个奖励</div>，三栏显示同样内容。]]
	}
}

function Config.HolidaySpriteLotteryData.data_action_fun(slot0)
	slot1 = Config.HolidaySpriteLotteryData.data_action[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidaySpriteLotteryData.data_action[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidaySpriteLotteryData.data_summon_length = 7
Config.HolidaySpriteLotteryData.data_summon = {
	[110] = {
		name = "幽灵抽奖常驻",
		action_name = "",
		call_bg_action = 0,
		action_card_name = "",
		call_bg = "2",
		group_id = 110,
		res_id = 3,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10415,
				1
			}
		},
		loss_item_ten = {
			{
				10415,
				10
			}
		}
	},
	[101] = {
		name = "幽灵抽奖_诅咒幽灵",
		action_name = "",
		call_bg_action = 0,
		action_card_name = "",
		call_bg = "1",
		group_id = 101,
		res_id = 1,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10415,
				1
			}
		},
		loss_item_ten = {
			{
				10415,
				10
			}
		}
	},
	[102] = {
		name = "幽灵抽奖_浪漫幽灵",
		action_name = "",
		call_bg_action = 0,
		action_card_name = "",
		call_bg = "2",
		group_id = 102,
		res_id = 2,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10415,
				1
			}
		},
		loss_item_ten = {
			{
				10415,
				10
			}
		}
	},
	[103] = {
		name = "幽灵抽奖_收割幽灵",
		action_name = "",
		call_bg_action = 0,
		action_card_name = "",
		call_bg = "2",
		group_id = 103,
		res_id = 3,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10415,
				1
			}
		},
		loss_item_ten = {
			{
				10415,
				10
			}
		}
	},
	[104] = {
		name = "幽灵抽奖_鬼岛幽灵",
		action_name = "",
		call_bg_action = 0,
		action_card_name = "",
		call_bg = "2",
		group_id = 104,
		res_id = 4,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10415,
				1
			}
		},
		loss_item_ten = {
			{
				10415,
				10
			}
		}
	},
	[105] = {
		name = "幽灵抽奖_鬼岛幽灵",
		action_name = "",
		call_bg_action = 0,
		action_card_name = "",
		call_bg = "2",
		group_id = 105,
		res_id = 4,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10415,
				1
			}
		},
		loss_item_ten = {
			{
				10415,
				10
			}
		}
	},
	[106] = {
		name = "幽灵抽奖_鬼岛幽灵",
		action_name = "",
		call_bg_action = 0,
		action_card_name = "",
		call_bg = "2",
		group_id = 106,
		res_id = 4,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10415,
				1
			}
		},
		loss_item_ten = {
			{
				10415,
				10
			}
		}
	}
}

function Config.HolidaySpriteLotteryData.data_summon_fun(slot0)
	slot1 = Config.HolidaySpriteLotteryData.data_summon[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidaySpriteLotteryData.data_summon[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidaySpriteLotteryData.data_award_length = 5
Config.HolidaySpriteLotteryData.data_award = {
	[0] = {
		{
			id = 1,
			camp_id = 0,
			times = 30,
			reward = {
				{
					113006,
					1
				}
			}
		},
		{
			id = 2,
			camp_id = 0,
			times = 70,
			reward = {
				{
					113006,
					1
				}
			}
		},
		{
			id = 3,
			camp_id = 0,
			times = 120,
			reward = {
				{
					39056,
					1
				}
			}
		}
	},
	[48034] = {
		{
			id = 1,
			camp_id = 48034,
			times = 30,
			reward = {
				{
					10415,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 48034,
			times = 60,
			reward = {
				{
					113006,
					1
				}
			}
		},
		{
			id = 3,
			camp_id = 48034,
			times = 120,
			reward = {
				{
					113006,
					1
				}
			}
		},
		{
			id = 4,
			camp_id = 48034,
			times = 180,
			reward = {
				{
					113006,
					1
				}
			}
		},
		{
			id = 5,
			camp_id = 48034,
			times = 250,
			reward = {
				{
					113006,
					2
				}
			}
		}
	},
	[49513] = {
		{
			id = 1,
			camp_id = 49513,
			times = 30,
			reward = {
				{
					10415,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 49513,
			times = 60,
			reward = {
				{
					113002,
					1
				}
			}
		},
		{
			id = 3,
			camp_id = 49513,
			times = 120,
			reward = {
				{
					113002,
					1
				}
			}
		},
		{
			id = 4,
			camp_id = 49513,
			times = 180,
			reward = {
				{
					113002,
					1
				}
			}
		},
		{
			id = 5,
			camp_id = 49513,
			times = 250,
			reward = {
				{
					113002,
					2
				}
			}
		}
	},
	[49813] = {
		{
			id = 1,
			camp_id = 49813,
			times = 30,
			reward = {
				{
					10415,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 49813,
			times = 60,
			reward = {
				{
					113001,
					1
				}
			}
		},
		{
			id = 3,
			camp_id = 49813,
			times = 120,
			reward = {
				{
					113001,
					1
				}
			}
		},
		{
			id = 4,
			camp_id = 49813,
			times = 180,
			reward = {
				{
					113001,
					1
				}
			}
		},
		{
			id = 5,
			camp_id = 49813,
			times = 250,
			reward = {
				{
					113001,
					2
				}
			}
		}
	},
	[39221] = {
		{
			id = 1,
			camp_id = 39221,
			times = 30,
			reward = {
				{
					10415,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 39221,
			times = 60,
			reward = {
				{
					113009,
					1
				}
			}
		},
		{
			id = 3,
			camp_id = 39221,
			times = 120,
			reward = {
				{
					113009,
					1
				}
			}
		},
		{
			id = 4,
			camp_id = 39221,
			times = 180,
			reward = {
				{
					113009,
					1
				}
			}
		},
		{
			id = 5,
			camp_id = 39221,
			times = 250,
			reward = {
				{
					113009,
					2
				}
			}
		}
	}
}
Config.HolidaySpriteLotteryData.data_probability_length = 7
Config.HolidaySpriteLotteryData.data_probability = {
	[110] = {
		{
			num = 1,
			name = "橙色幽灵",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 113009,
			group_id = 110,
			star = ""
		},
		{
			num = 0,
			name = "紫色幽灵",
			probability = "12.4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 110,
			star = ""
		},
		{
			num = 0,
			name = "蓝色幽灵",
			probability = "45",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 110,
			star = ""
		},
		{
			num = 0,
			name = "其他道具",
			probability = "41.6",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 110,
			star = ""
		}
	},
	[101] = {
		{
			num = 1,
			name = "诅咒幽灵",
			probability = "2.5",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 113006,
			group_id = 101,
			star = ""
		},
		{
			num = 0,
			name = "紫色幽灵",
			probability = "15",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 101,
			star = ""
		},
		{
			num = 0,
			name = "蓝色幽灵",
			probability = "50",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 101,
			star = ""
		},
		{
			num = 0,
			name = "其他道具",
			probability = "32.5",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 101,
			star = ""
		}
	},
	[102] = {
		{
			num = 1,
			name = "浪漫幽灵",
			probability = "2.5",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 113002,
			group_id = 102,
			star = ""
		},
		{
			num = 0,
			name = "紫色幽灵",
			probability = "15",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 102,
			star = ""
		},
		{
			num = 0,
			name = "蓝色幽灵",
			probability = "50",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 102,
			star = ""
		},
		{
			num = 0,
			name = "其他道具",
			probability = "32.5",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 102,
			star = ""
		}
	},
	[103] = {
		{
			num = 1,
			name = "收割幽灵",
			probability = "2.5",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 113001,
			group_id = 103,
			star = ""
		},
		{
			num = 0,
			name = "紫色幽灵",
			probability = "15",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 103,
			star = ""
		},
		{
			num = 0,
			name = "蓝色幽灵",
			probability = "50",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 103,
			star = ""
		},
		{
			num = 0,
			name = "其他道具",
			probability = "32.5",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 103,
			star = ""
		}
	},
	[104] = {
		{
			num = 1,
			name = "鬼岛幽灵",
			probability = "2.5",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 113009,
			group_id = 104,
			star = ""
		},
		{
			num = 0,
			name = "紫色幽灵",
			probability = "15",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 104,
			star = ""
		},
		{
			num = 0,
			name = "蓝色幽灵",
			probability = "50",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 104,
			star = ""
		},
		{
			num = 0,
			name = "其他道具",
			probability = "32.5",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 104,
			star = ""
		}
	},
	[105] = {
		{
			num = 1,
			name = "鬼岛幽灵",
			probability = "2.5",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 113009,
			group_id = 105,
			star = ""
		},
		{
			num = 0,
			name = "紫色幽灵",
			probability = "15",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 105,
			star = ""
		},
		{
			num = 0,
			name = "蓝色幽灵",
			probability = "50",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 105,
			star = ""
		},
		{
			num = 0,
			name = "其他道具",
			probability = "32.5",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 105,
			star = ""
		}
	},
	[106] = {
		{
			num = 1,
			name = "鬼岛幽灵",
			probability = "2.5",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 113009,
			group_id = 106,
			star = ""
		},
		{
			num = 0,
			name = "紫色幽灵",
			probability = "15",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = ""
		},
		{
			num = 0,
			name = "蓝色幽灵",
			probability = "50",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = ""
		},
		{
			num = 0,
			name = "其他道具",
			probability = "32.5",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = ""
		}
	}
}
Config.HolidaySpriteLotteryData.data_hero_show_length = 7
Config.HolidaySpriteLotteryData.data_hero_show = {
	[110] = {
		[113001] = {
			group_id = 110,
			name = "收割幽灵",
			probability = "0.18",
			id = 113001,
			num = 1
		},
		[113002] = {
			group_id = 110,
			name = "浪漫幽灵",
			probability = "0.18",
			id = 113002,
			num = 1
		},
		[113003] = {
			group_id = 110,
			name = "破坏幽灵",
			probability = "0.18",
			id = 113003,
			num = 1
		},
		[113004] = {
			group_id = 110,
			name = "南瓜幽灵",
			probability = "0.1",
			id = 113004,
			num = 1
		},
		[113005] = {
			group_id = 110,
			name = "疾风幽灵",
			probability = "0.1",
			id = 113005,
			num = 1
		},
		[113006] = {
			group_id = 110,
			name = "诅咒幽灵",
			probability = "0.1",
			id = 113006,
			num = 1
		},
		[113007] = {
			group_id = 110,
			name = "护盾幽灵",
			probability = "0.1",
			id = 113007,
			num = 1
		},
		[113008] = {
			group_id = 110,
			name = "净化幽灵",
			probability = "0.1",
			id = 113008,
			num = 1
		},
		[113009] = {
			group_id = 110,
			name = "鬼岛幽灵",
			probability = "0.05",
			id = 113009,
			num = 1
		},
		[112001] = {
			group_id = 110,
			name = "吸血幽灵",
			probability = "3.1",
			id = 112001,
			num = 1
		},
		[112002] = {
			group_id = 110,
			name = "恐吓幽灵",
			probability = "3.1",
			id = 112002,
			num = 1
		},
		[112003] = {
			group_id = 110,
			name = "戏水幽灵",
			probability = "3.1",
			id = 112003,
			num = 1
		},
		[112004] = {
			group_id = 110,
			name = "振奋幽灵",
			probability = "3.1",
			id = 112004,
			num = 1
		},
		[111001] = {
			group_id = 110,
			name = "强击幽灵",
			probability = "9",
			id = 111001,
			num = 1
		},
		[111002] = {
			group_id = 110,
			name = "顽皮幽灵",
			probability = "9",
			id = 111002,
			num = 1
		},
		[111003] = {
			group_id = 110,
			name = "鼓舞幽灵",
			probability = "9",
			id = 111003,
			num = 1
		},
		[111004] = {
			group_id = 110,
			name = "治愈幽灵",
			probability = "9",
			id = 111004,
			num = 1
		},
		[111005] = {
			group_id = 110,
			name = "剧毒幽灵",
			probability = "9",
			id = 111005,
			num = 1
		},
		[10040] = {
			group_id = 110,
			name = "训练果实",
			probability = "41.6",
			id = 10040,
			num = 3
		}
	},
	[101] = {
		{
			group_id = 101,
			name = "训练果实",
			probability = "9.49",
			id = 10040,
			num = 8
		},
		{
			group_id = 101,
			name = "训练果实",
			probability = "10.4",
			id = 10040,
			num = 5
		},
		[113006] = {
			group_id = 101,
			name = "诅咒幽灵",
			probability = "2.5",
			id = 113006,
			num = 1
		},
		[112001] = {
			group_id = 101,
			name = "吸血幽灵",
			probability = "3.75",
			id = 112001,
			num = 1
		},
		[112002] = {
			group_id = 101,
			name = "恐吓幽灵",
			probability = "3.75",
			id = 112002,
			num = 1
		},
		[112003] = {
			group_id = 101,
			name = "戏水幽灵",
			probability = "3.25",
			id = 112003,
			num = 1
		},
		[112004] = {
			group_id = 101,
			name = "振奋幽灵",
			probability = "4.25",
			id = 112004,
			num = 1
		},
		[111001] = {
			group_id = 101,
			name = "滚滚岩",
			probability = "10",
			id = 111001,
			num = 1
		},
		[111002] = {
			group_id = 101,
			name = "皮皮",
			probability = "10",
			id = 111002,
			num = 1
		},
		[111003] = {
			group_id = 101,
			name = "鼓舞幽灵",
			probability = "8",
			id = 111003,
			num = 1
		},
		[111004] = {
			group_id = 101,
			name = "治愈幽灵",
			probability = "9",
			id = 111004,
			num = 1
		},
		[111005] = {
			group_id = 101,
			name = "嗡嗡蜂",
			probability = "13",
			id = 111005,
			num = 1
		},
		[10041] = {
			group_id = 101,
			name = "圣露",
			probability = "1.25",
			id = 10041,
			num = 1
		},
		[10040] = {
			group_id = 101,
			name = "训练果实",
			probability = "4.92",
			id = 10040,
			num = 10
		},
		[39052] = {
			group_id = 101,
			name = "百万贝里礼盒",
			probability = "6.44",
			id = 39052,
			num = 1
		}
	},
	[102] = {
		{
			group_id = 102,
			name = "训练果实",
			probability = "9.49",
			id = 10040,
			num = 8
		},
		{
			group_id = 102,
			name = "训练果实",
			probability = "10.4",
			id = 10040,
			num = 5
		},
		[113002] = {
			group_id = 102,
			name = "浪漫幽灵",
			probability = "2.5",
			id = 113002,
			num = 1
		},
		[112001] = {
			group_id = 102,
			name = "吸血幽灵",
			probability = "3.75",
			id = 112001,
			num = 1
		},
		[112002] = {
			group_id = 102,
			name = "恐吓幽灵",
			probability = "3.75",
			id = 112002,
			num = 1
		},
		[112003] = {
			group_id = 102,
			name = "戏水幽灵",
			probability = "3.25",
			id = 112003,
			num = 1
		},
		[112004] = {
			group_id = 102,
			name = "振奋幽灵",
			probability = "4.25",
			id = 112004,
			num = 1
		},
		[111001] = {
			group_id = 102,
			name = "滚滚岩",
			probability = "10",
			id = 111001,
			num = 1
		},
		[111002] = {
			group_id = 102,
			name = "皮皮",
			probability = "10",
			id = 111002,
			num = 1
		},
		[111003] = {
			group_id = 102,
			name = "鼓舞幽灵",
			probability = "8",
			id = 111003,
			num = 1
		},
		[111004] = {
			group_id = 102,
			name = "治愈幽灵",
			probability = "9",
			id = 111004,
			num = 1
		},
		[111005] = {
			group_id = 102,
			name = "嗡嗡蜂",
			probability = "13",
			id = 111005,
			num = 1
		},
		[10041] = {
			group_id = 102,
			name = "圣露",
			probability = "1.25",
			id = 10041,
			num = 1
		},
		[10040] = {
			group_id = 102,
			name = "训练果实",
			probability = "4.92",
			id = 10040,
			num = 10
		},
		[39052] = {
			group_id = 102,
			name = "百万贝里礼盒",
			probability = "6.44",
			id = 39052,
			num = 1
		}
	},
	[103] = {
		{
			group_id = 103,
			name = "训练果实",
			probability = "9.49",
			id = 10040,
			num = 8
		},
		{
			group_id = 103,
			name = "训练果实",
			probability = "10.4",
			id = 10040,
			num = 5
		},
		[113001] = {
			group_id = 103,
			name = "收割幽灵",
			probability = "2.5",
			id = 113001,
			num = 1
		},
		[112001] = {
			group_id = 103,
			name = "吸血幽灵",
			probability = "3.75",
			id = 112001,
			num = 1
		},
		[112002] = {
			group_id = 103,
			name = "恐吓幽灵",
			probability = "3.75",
			id = 112002,
			num = 1
		},
		[112003] = {
			group_id = 103,
			name = "戏水幽灵",
			probability = "3.25",
			id = 112003,
			num = 1
		},
		[112004] = {
			group_id = 103,
			name = "振奋幽灵",
			probability = "4.25",
			id = 112004,
			num = 1
		},
		[111001] = {
			group_id = 103,
			name = "滚滚岩",
			probability = "10",
			id = 111001,
			num = 1
		},
		[111002] = {
			group_id = 103,
			name = "皮皮",
			probability = "10",
			id = 111002,
			num = 1
		},
		[111003] = {
			group_id = 103,
			name = "鼓舞幽灵",
			probability = "8",
			id = 111003,
			num = 1
		},
		[111004] = {
			group_id = 103,
			name = "治愈幽灵",
			probability = "9",
			id = 111004,
			num = 1
		},
		[111005] = {
			group_id = 103,
			name = "嗡嗡蜂",
			probability = "13",
			id = 111005,
			num = 1
		},
		[10041] = {
			group_id = 103,
			name = "圣露",
			probability = "1.25",
			id = 10041,
			num = 1
		},
		[10040] = {
			group_id = 103,
			name = "训练果实",
			probability = "4.92",
			id = 10040,
			num = 10
		},
		[39052] = {
			group_id = 103,
			name = "百万贝里礼盒",
			probability = "6.44",
			id = 39052,
			num = 1
		}
	},
	[104] = {
		{
			group_id = 104,
			name = "训练果实",
			probability = "9.49",
			id = 10040,
			num = 8
		},
		{
			group_id = 104,
			name = "训练果实",
			probability = "10.4",
			id = 10040,
			num = 5
		},
		[113009] = {
			group_id = 104,
			name = "鬼岛幽灵",
			probability = "2.5",
			id = 113009,
			num = 1
		},
		[112001] = {
			group_id = 104,
			name = "吸血幽灵",
			probability = "3.75",
			id = 112001,
			num = 1
		},
		[112002] = {
			group_id = 104,
			name = "恐吓幽灵",
			probability = "3.75",
			id = 112002,
			num = 1
		},
		[112003] = {
			group_id = 104,
			name = "戏水幽灵",
			probability = "3.25",
			id = 112003,
			num = 1
		},
		[112004] = {
			group_id = 104,
			name = "振奋幽灵",
			probability = "4.25",
			id = 112004,
			num = 1
		},
		[111001] = {
			group_id = 104,
			name = "滚滚岩",
			probability = "10",
			id = 111001,
			num = 1
		},
		[111002] = {
			group_id = 104,
			name = "皮皮",
			probability = "10",
			id = 111002,
			num = 1
		},
		[111003] = {
			group_id = 104,
			name = "鼓舞幽灵",
			probability = "8",
			id = 111003,
			num = 1
		},
		[111004] = {
			group_id = 104,
			name = "治愈幽灵",
			probability = "9",
			id = 111004,
			num = 1
		},
		[111005] = {
			group_id = 104,
			name = "嗡嗡蜂",
			probability = "13",
			id = 111005,
			num = 1
		},
		[10041] = {
			group_id = 104,
			name = "圣露",
			probability = "1.25",
			id = 10041,
			num = 1
		},
		[10040] = {
			group_id = 104,
			name = "训练果实",
			probability = "4.92",
			id = 10040,
			num = 10
		},
		[39052] = {
			group_id = 104,
			name = "百万贝里礼盒",
			probability = "6.44",
			id = 39052,
			num = 1
		}
	},
	[105] = {
		{
			group_id = 105,
			name = "训练果实",
			probability = "9.49",
			id = 10040,
			num = 8
		},
		{
			group_id = 105,
			name = "训练果实",
			probability = "10.4",
			id = 10040,
			num = 5
		},
		[113009] = {
			group_id = 105,
			name = "鬼岛幽灵",
			probability = "2.5",
			id = 113009,
			num = 1
		},
		[112001] = {
			group_id = 105,
			name = "吸血幽灵",
			probability = "3.75",
			id = 112001,
			num = 1
		},
		[112002] = {
			group_id = 105,
			name = "恐吓幽灵",
			probability = "3.75",
			id = 112002,
			num = 1
		},
		[112003] = {
			group_id = 105,
			name = "戏水幽灵",
			probability = "3.25",
			id = 112003,
			num = 1
		},
		[112004] = {
			group_id = 105,
			name = "振奋幽灵",
			probability = "4.25",
			id = 112004,
			num = 1
		},
		[111001] = {
			group_id = 105,
			name = "滚滚岩",
			probability = "10",
			id = 111001,
			num = 1
		},
		[111002] = {
			group_id = 105,
			name = "皮皮",
			probability = "10",
			id = 111002,
			num = 1
		},
		[111003] = {
			group_id = 105,
			name = "鼓舞幽灵",
			probability = "8",
			id = 111003,
			num = 1
		},
		[111004] = {
			group_id = 105,
			name = "治愈幽灵",
			probability = "9",
			id = 111004,
			num = 1
		},
		[111005] = {
			group_id = 105,
			name = "嗡嗡蜂",
			probability = "13",
			id = 111005,
			num = 1
		},
		[10041] = {
			group_id = 105,
			name = "圣露",
			probability = "1.25",
			id = 10041,
			num = 1
		},
		[10040] = {
			group_id = 105,
			name = "训练果实",
			probability = "4.92",
			id = 10040,
			num = 10
		},
		[39052] = {
			group_id = 105,
			name = "百万贝里礼盒",
			probability = "6.44",
			id = 39052,
			num = 1
		}
	},
	[106] = {
		{
			group_id = 106,
			name = "训练果实",
			probability = "9.49",
			id = 10040,
			num = 8
		},
		{
			group_id = 106,
			name = "训练果实",
			probability = "10.4",
			id = 10040,
			num = 5
		},
		[113009] = {
			group_id = 106,
			name = "鬼岛幽灵",
			probability = "2.5",
			id = 113009,
			num = 1
		},
		[112001] = {
			group_id = 106,
			name = "吸血幽灵",
			probability = "3.75",
			id = 112001,
			num = 1
		},
		[112002] = {
			group_id = 106,
			name = "恐吓幽灵",
			probability = "3.75",
			id = 112002,
			num = 1
		},
		[112003] = {
			group_id = 106,
			name = "戏水幽灵",
			probability = "3.25",
			id = 112003,
			num = 1
		},
		[112004] = {
			group_id = 106,
			name = "振奋幽灵",
			probability = "4.25",
			id = 112004,
			num = 1
		},
		[111001] = {
			group_id = 106,
			name = "滚滚岩",
			probability = "10",
			id = 111001,
			num = 1
		},
		[111002] = {
			group_id = 106,
			name = "皮皮",
			probability = "10",
			id = 111002,
			num = 1
		},
		[111003] = {
			group_id = 106,
			name = "鼓舞幽灵",
			probability = "8",
			id = 111003,
			num = 1
		},
		[111004] = {
			group_id = 106,
			name = "治愈幽灵",
			probability = "9",
			id = 111004,
			num = 1
		},
		[111005] = {
			group_id = 106,
			name = "嗡嗡蜂",
			probability = "13",
			id = 111005,
			num = 1
		},
		[10041] = {
			group_id = 106,
			name = "圣露",
			probability = "1.25",
			id = 10041,
			num = 1
		},
		[10040] = {
			group_id = 106,
			name = "训练果实",
			probability = "4.92",
			id = 10040,
			num = 10
		},
		[39052] = {
			group_id = 106,
			name = "百万贝里礼盒",
			probability = "6.44",
			id = 39052,
			num = 1
		}
	}
}
