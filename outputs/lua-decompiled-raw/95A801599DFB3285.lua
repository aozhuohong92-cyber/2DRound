Config = Config or {}
Config.ConvertData = Config.ConvertData or {}
Config.ConvertData.data_gold_exchange_length = 6
Config.ConvertData.data_gold_exchange = {
	{
		price = 60,
		coin = 6000
	},
	{
		price = 300,
		coin = 30000
	},
	{
		price = 1280,
		coin = 128000
	},
	{
		price = 1980,
		coin = 198000
	},
	{
		price = 3280,
		coin = 328000
	},
	{
		price = 6480,
		coin = 648000
	}
}

function Config.ConvertData.data_gold_exchange_fun(slot0)
	slot1 = Config.ConvertData.data_gold_exchange[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ConvertData.data_gold_exchange[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ConvertData.data_sliver_exchange_length = 6
Config.ConvertData.data_sliver_exchange = {
	{
		price = 60,
		silver_coin = 600000
	},
	{
		price = 300,
		silver_coin = 3000000
	},
	{
		price = 1280,
		silver_coin = 12800000
	},
	{
		price = 1980,
		silver_coin = 19800000
	},
	{
		price = 3280,
		silver_coin = 32800000
	},
	{
		price = 6480,
		silver_coin = 64800000
	}
}

function Config.ConvertData.data_sliver_exchange_fun(slot0)
	slot1 = Config.ConvertData.data_sliver_exchange[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ConvertData.data_sliver_exchange[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ConvertData.data_wish_reward_length = 10
Config.ConvertData.data_wish_reward = {
	{
		max_count = 1,
		min_count = 1,
		vip = 0,
		rate = 50,
		price = {
			{
				4,
				0
			}
		},
		reward = {
			{
				11,
				400
			}
		}
	},
	{
		max_count = 2,
		min_count = 2,
		vip = 2,
		rate = 50,
		price = {
			{
				4,
				20
			}
		},
		reward = {
			{
				11,
				400
			}
		}
	},
	{
		max_count = 3,
		min_count = 3,
		vip = 2,
		rate = 50,
		price = {
			{
				4,
				30
			}
		},
		reward = {
			{
				11,
				400
			}
		}
	},
	{
		max_count = 4,
		min_count = 4,
		vip = 2,
		rate = 55,
		price = {
			{
				4,
				40
			}
		},
		reward = {
			{
				11,
				400
			}
		}
	},
	{
		max_count = 6,
		min_count = 5,
		vip = 4,
		rate = 60,
		price = {
			{
				4,
				40
			}
		},
		reward = {
			{
				11,
				400
			}
		}
	},
	[7] = {
		max_count = 8,
		min_count = 7,
		vip = 6,
		rate = 65,
		price = {
			{
				4,
				50
			}
		},
		reward = {
			{
				11,
				400
			}
		}
	},
	[9] = {
		max_count = 10,
		min_count = 9,
		vip = 8,
		rate = 70,
		price = {
			{
				4,
				50
			}
		},
		reward = {
			{
				11,
				400
			}
		}
	},
	[11] = {
		max_count = 12,
		min_count = 11,
		vip = 10,
		rate = 75,
		price = {
			{
				4,
				60
			}
		},
		reward = {
			{
				11,
				400
			}
		}
	},
	[13] = {
		max_count = 14,
		min_count = 13,
		vip = 12,
		rate = 80,
		price = {
			{
				4,
				60
			}
		},
		reward = {
			{
				11,
				400
			}
		}
	},
	[15] = {
		max_count = 16,
		min_count = 15,
		vip = 14,
		rate = 90,
		price = {
			{
				4,
				60
			}
		},
		reward = {
			{
				11,
				400
			}
		}
	}
}

function Config.ConvertData.data_wish_reward_fun(slot0)
	slot1 = Config.ConvertData.data_wish_reward[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ConvertData.data_wish_reward[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ConvertData.data_trade_cost_length = 5
Config.ConvertData.data_trade_cost = {
	reward_num = {
		val = 10,
		key = "reward_num",
		desc = "X次进行循环奖励"
	},
	times_reward = {
		key = "times_reward",
		desc = "奖励内容",
		val = {
			{
				11,
				500
			}
		}
	},
	pray_rules = {
		val = 0,
		key = "pray_rules",
		desc = [[
1、每天首次许愿免费。
2、可消耗红蓝钻进行许愿，许愿有概率<div fontsize=24 fontcolor=#289b14>暴击</div>，使下一次获取奖励翻倍。
3、提升VIP等级可增加许愿次数。
4、许愿次数在5点刷新]]
	},
	point_gold_refresh = {
		key = "point_gold_refresh",
		desc = "点金刷新时间（秒）",
		val = {
			{
				0,
				0,
				0
			},
			{
				9,
				0,
				0
			},
			{
				19,
				0,
				0
			}
		}
	},
	red_lev_min = {
		val = 6,
		key = "red_lev_min",
		desc = "点金红点显示等级限制"
	}
}

function Config.ConvertData.data_trade_cost_fun(slot0)
	slot1 = Config.ConvertData.data_trade_cost[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ConvertData.data_trade_cost[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ConvertData.data_exchange_length = 2
Config.ConvertData.data_exchange = {
	[0] = {
		{
			coin = 10000,
			time = 60,
			type = 0,
			id = 1,
			num = 1,
			price = 0
		},
		{
			coin = 20000,
			time = 120,
			type = 0,
			id = 2,
			num = 1,
			price = 20
		},
		{
			coin = 50000,
			time = 300,
			type = 0,
			id = 3,
			num = 1,
			price = 50
		}
	},
	{
		{
			coin = 10000,
			time = 60,
			type = 1,
			id = 1,
			num = 3,
			price = 0
		},
		{
			coin = 20000,
			time = 120,
			type = 1,
			id = 2,
			num = 10,
			price = 20
		},
		{
			coin = 50000,
			time = 300,
			type = 1,
			id = 3,
			num = 10,
			price = 50
		}
	}
}
