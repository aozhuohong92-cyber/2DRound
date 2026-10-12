Config = Config or {}
Config.TradeData = Config.TradeData or {}
Config.TradeData.data_trade_cost_length = 3
Config.TradeData.data_trade_cost = {
	open_lev = {
		val = 14,
		label = "open_lev",
		desc = "开启等级"
	},
	cost_item1 = {
		val = 10401,
		label = "cost_item1",
		desc = "大瓶体力（购买体力显示物品，优先级高）"
	},
	cost_item2 = {
		val = 10400,
		label = "cost_item2",
		desc = "小瓶体力（购买体力显示物品，优先级低）"
	}
}
Config.TradeData.data_trade_base_length = 3
Config.TradeData.data_trade_base = {
	{
		ui_desc = "4800贝里/时",
		name = "贝里",
		type = 1,
		assets = "coin",
		make_max = 50000,
		make_speed = {
			30,
			40
		}
	},
	{
		ui_desc = "480经验/时",
		name = "英雄经验",
		type = 2,
		assets = "partner_exp_all",
		make_max = 5000,
		make_speed = {
			30,
			4
		}
	},
	{
		ui_desc = "",
		name = "体力",
		type = 3,
		assets = "energy",
		make_max = 100,
		make_speed = {}
	}
}
Config.TradeData.data_trade_count_length = 3
Config.TradeData.data_trade_count = {
	{
		[0] = {
			vip_lev = 0,
			max = 2,
			type = 1
		},
		{
			vip_lev = 1,
			max = 3,
			type = 1
		},
		{
			vip_lev = 2,
			max = 5,
			type = 1
		},
		{
			vip_lev = 3,
			max = 7,
			type = 1
		},
		{
			vip_lev = 4,
			max = 9,
			type = 1
		},
		{
			vip_lev = 5,
			max = 11,
			type = 1
		},
		{
			vip_lev = 6,
			max = 13,
			type = 1
		},
		{
			vip_lev = 7,
			max = 15,
			type = 1
		},
		{
			vip_lev = 8,
			max = 17,
			type = 1
		},
		{
			vip_lev = 9,
			max = 19,
			type = 1
		},
		{
			vip_lev = 10,
			max = 21,
			type = 1
		},
		{
			vip_lev = 11,
			max = 23,
			type = 1
		},
		{
			vip_lev = 12,
			max = 25,
			type = 1
		},
		{
			vip_lev = 13,
			max = 27,
			type = 1
		},
		{
			vip_lev = 14,
			max = 29,
			type = 1
		},
		{
			vip_lev = 15,
			max = 31,
			type = 1
		}
	},
	{
		[0] = {
			vip_lev = 0,
			max = 2,
			type = 2
		},
		{
			vip_lev = 1,
			max = 3,
			type = 2
		},
		{
			vip_lev = 2,
			max = 4,
			type = 2
		},
		{
			vip_lev = 3,
			max = 5,
			type = 2
		},
		{
			vip_lev = 4,
			max = 6,
			type = 2
		},
		{
			vip_lev = 5,
			max = 7,
			type = 2
		},
		{
			vip_lev = 6,
			max = 8,
			type = 2
		},
		{
			vip_lev = 7,
			max = 9,
			type = 2
		},
		{
			vip_lev = 8,
			max = 10,
			type = 2
		},
		{
			vip_lev = 9,
			max = 11,
			type = 2
		},
		{
			vip_lev = 10,
			max = 12,
			type = 2
		},
		{
			vip_lev = 11,
			max = 13,
			type = 2
		},
		{
			vip_lev = 12,
			max = 14,
			type = 2
		},
		{
			vip_lev = 13,
			max = 15,
			type = 2
		},
		{
			vip_lev = 14,
			max = 16,
			type = 2
		},
		{
			vip_lev = 15,
			max = 17,
			type = 2
		}
	},
	{
		[0] = {
			vip_lev = 0,
			max = 2,
			type = 3
		},
		{
			vip_lev = 1,
			max = 3,
			type = 3
		},
		{
			vip_lev = 2,
			max = 4,
			type = 3
		},
		{
			vip_lev = 3,
			max = 5,
			type = 3
		},
		{
			vip_lev = 4,
			max = 6,
			type = 3
		},
		{
			vip_lev = 5,
			max = 7,
			type = 3
		},
		{
			vip_lev = 6,
			max = 8,
			type = 3
		},
		{
			vip_lev = 7,
			max = 9,
			type = 3
		},
		{
			vip_lev = 8,
			max = 10,
			type = 3
		},
		{
			vip_lev = 9,
			max = 11,
			type = 3
		},
		{
			vip_lev = 10,
			max = 12,
			type = 3
		},
		{
			vip_lev = 11,
			max = 13,
			type = 3
		},
		{
			vip_lev = 12,
			max = 14,
			type = 3
		},
		{
			vip_lev = 13,
			max = 15,
			type = 3
		},
		{
			vip_lev = 14,
			max = 16,
			type = 3
		},
		{
			vip_lev = 15,
			max = 17,
			type = 3
		}
	}
}
Config.TradeData.data_trade_use_length = 3
Config.TradeData.data_trade_use = {
	{
		{
			loss = 20,
			count = 1,
			type = 1
		},
		{
			loss = 20,
			count = 2,
			type = 1
		},
		{
			loss = 30,
			count = 3,
			type = 1
		},
		{
			loss = 30,
			count = 4,
			type = 1
		},
		{
			loss = 30,
			count = 5,
			type = 1
		},
		{
			loss = 30,
			count = 6,
			type = 1
		},
		{
			loss = 30,
			count = 7,
			type = 1
		},
		{
			loss = 30,
			count = 8,
			type = 1
		},
		{
			loss = 40,
			count = 9,
			type = 1
		},
		{
			loss = 40,
			count = 10,
			type = 1
		},
		{
			loss = 40,
			count = 11,
			type = 1
		},
		{
			loss = 40,
			count = 12,
			type = 1
		},
		{
			loss = 40,
			count = 13,
			type = 1
		},
		{
			loss = 40,
			count = 14,
			type = 1
		},
		{
			loss = 40,
			count = 15,
			type = 1
		},
		{
			loss = 50,
			count = 16,
			type = 1
		},
		{
			loss = 50,
			count = 17,
			type = 1
		},
		{
			loss = 50,
			count = 18,
			type = 1
		},
		{
			loss = 50,
			count = 19,
			type = 1
		},
		{
			loss = 50,
			count = 20,
			type = 1
		},
		{
			loss = 50,
			count = 21,
			type = 1
		},
		{
			loss = 50,
			count = 22,
			type = 1
		},
		{
			loss = 50,
			count = 23,
			type = 1
		},
		{
			loss = 50,
			count = 24,
			type = 1
		},
		{
			loss = 50,
			count = 25,
			type = 1
		},
		{
			loss = 60,
			count = 26,
			type = 1
		},
		{
			loss = 60,
			count = 27,
			type = 1
		},
		{
			loss = 60,
			count = 28,
			type = 1
		},
		{
			loss = 60,
			count = 29,
			type = 1
		},
		{
			loss = 60,
			count = 30,
			type = 1
		},
		{
			loss = 60,
			count = 31,
			type = 1
		},
		{
			loss = 60,
			count = 32,
			type = 1
		},
		{
			loss = 60,
			count = 33,
			type = 1
		},
		{
			loss = 60,
			count = 34,
			type = 1
		},
		{
			loss = 60,
			count = 35,
			type = 1
		}
	},
	{
		{
			loss = 20,
			count = 1,
			type = 2
		},
		{
			loss = 20,
			count = 2,
			type = 2
		},
		{
			loss = 30,
			count = 3,
			type = 2
		},
		{
			loss = 30,
			count = 4,
			type = 2
		},
		{
			loss = 30,
			count = 5,
			type = 2
		},
		{
			loss = 30,
			count = 6,
			type = 2
		},
		{
			loss = 30,
			count = 7,
			type = 2
		},
		{
			loss = 30,
			count = 8,
			type = 2
		},
		{
			loss = 40,
			count = 9,
			type = 2
		},
		{
			loss = 40,
			count = 10,
			type = 2
		},
		{
			loss = 40,
			count = 11,
			type = 2
		},
		{
			loss = 40,
			count = 12,
			type = 2
		},
		{
			loss = 40,
			count = 13,
			type = 2
		},
		{
			loss = 40,
			count = 14,
			type = 2
		},
		{
			loss = 40,
			count = 15,
			type = 2
		},
		{
			loss = 60,
			count = 16,
			type = 2
		},
		{
			loss = 60,
			count = 17,
			type = 2
		},
		{
			loss = 60,
			count = 18,
			type = 2
		},
		{
			loss = 60,
			count = 19,
			type = 2
		},
		{
			loss = 60,
			count = 20,
			type = 2
		},
		{
			loss = 60,
			count = 21,
			type = 2
		},
		{
			loss = 60,
			count = 22,
			type = 2
		},
		{
			loss = 60,
			count = 23,
			type = 2
		},
		{
			loss = 60,
			count = 24,
			type = 2
		},
		{
			loss = 60,
			count = 25,
			type = 2
		}
	},
	{
		{
			loss = 50,
			count = 1,
			type = 3
		},
		{
			loss = 50,
			count = 2,
			type = 3
		},
		{
			loss = 100,
			count = 3,
			type = 3
		},
		{
			loss = 100,
			count = 4,
			type = 3
		},
		{
			loss = 150,
			count = 5,
			type = 3
		},
		{
			loss = 150,
			count = 6,
			type = 3
		},
		{
			loss = 200,
			count = 7,
			type = 3
		},
		{
			loss = 200,
			count = 8,
			type = 3
		},
		{
			loss = 250,
			count = 9,
			type = 3
		},
		{
			loss = 300,
			count = 10,
			type = 3
		},
		{
			loss = 350,
			count = 11,
			type = 3
		},
		{
			loss = 400,
			count = 12,
			type = 3
		},
		{
			loss = 450,
			count = 13,
			type = 3
		},
		{
			loss = 500,
			count = 14,
			type = 3
		},
		{
			loss = 550,
			count = 15,
			type = 3
		},
		{
			loss = 600,
			count = 16,
			type = 3
		},
		{
			loss = 650,
			count = 17,
			type = 3
		},
		{
			loss = 700,
			count = 18,
			type = 3
		},
		{
			loss = 750,
			count = 19,
			type = 3
		},
		{
			loss = 800,
			count = 20,
			type = 3
		},
		{
			loss = 850,
			count = 21,
			type = 3
		},
		{
			loss = 900,
			count = 22,
			type = 3
		},
		{
			loss = 950,
			count = 23,
			type = 3
		},
		{
			loss = 1000,
			count = 24,
			type = 3
		},
		{
			loss = 1050,
			count = 25,
			type = 3
		}
	}
}
Config.TradeData.data_trade_event_length = 2
Config.TradeData.data_trade_event = {
	{
		{
			id = 1,
			res = "E51105",
			action = "action1",
			type = 1
		},
		{
			id = 2,
			res = "E51105",
			action = "action2",
			type = 1
		},
		{
			id = 3,
			res = "E51105",
			action = "action3",
			type = 1
		},
		{
			id = 4,
			res = "E51105",
			action = "action4",
			type = 1
		},
		{
			id = 5,
			res = "E51105",
			action = "action5",
			type = 1
		}
	},
	{
		{
			id = 1,
			res = "E51105",
			action = "action1",
			type = 2
		},
		{
			id = 2,
			res = "E51105",
			action = "action2",
			type = 2
		},
		{
			id = 3,
			res = "E51105",
			action = "action3",
			type = 2
		},
		{
			id = 4,
			res = "E51105",
			action = "action4",
			type = 2
		},
		{
			id = 5,
			res = "E51105",
			action = "action5",
			type = 2
		}
	}
}
