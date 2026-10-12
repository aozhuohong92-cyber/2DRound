Config = Config or {}
Config.MarketSilverData = Config.MarketSilverData or {}
Config.MarketSilverData.data_market_sliver_cost_length = 9
Config.MarketSilverData.data_market_sliver_cost = {
	silvermarket_time = {
		val = 180,
		key = "silvermarket_time",
		desc = "银币市场刷新时间"
	},
	silvermarket_cost = {
		val = 3000,
		key = "silvermarket_cost",
		desc = "银币市场刷新消耗银币"
	},
	silvermarket_tax = {
		val = 0.05,
		key = "silvermarket_tax",
		desc = "银币市场税率"
	},
	silvermarket_type = {
		key = "silvermarket_type",
		desc = "银币市场类型显示",
		val = {
			1
		}
	},
	silvermarket_booth = {
		val = 6,
		key = "silvermarket_booth",
		desc = "初始摊位开放数"
	},
	silvermarket_boothnum = {
		val = 8,
		key = "silvermarket_boothnum",
		desc = "摊位总数"
	},
	silvermarket_saleplus = {
		val = 95,
		key = "silvermarket_saleplus",
		desc = "摆摊价格调整下限"
	},
	silvermarket_salereduce = {
		val = 105,
		key = "silvermarket_salereduce",
		desc = "摆摊价格调整上限"
	},
	silvermarket_salechange = {
		val = 5,
		key = "silvermarket_salechange",
		desc = "摆摊价格调整幅度"
	}
}
Config.MarketSilverData.data_antique_list_length = 10
Config.MarketSilverData.data_antique_list = {
	[11000] = {
		gain_label = "silver_coin",
		type = 1,
		base_id = 11000,
		min_price = 570000,
		def_price = 600000,
		max_price = 630000,
		is_quest_need = 0
	},
	[11001] = {
		gain_label = "silver_coin",
		type = 1,
		base_id = 11001,
		min_price = 570000,
		def_price = 600000,
		max_price = 630000,
		is_quest_need = 0
	},
	[11002] = {
		gain_label = "silver_coin",
		type = 1,
		base_id = 11002,
		min_price = 285000,
		def_price = 300000,
		max_price = 315000,
		is_quest_need = 0
	},
	[11003] = {
		gain_label = "silver_coin",
		type = 1,
		base_id = 11003,
		min_price = 285000,
		def_price = 300000,
		max_price = 315000,
		is_quest_need = 0
	},
	[11004] = {
		gain_label = "silver_coin",
		type = 1,
		base_id = 11004,
		min_price = 285000,
		def_price = 300000,
		max_price = 315000,
		is_quest_need = 0
	},
	[11005] = {
		gain_label = "silver_coin",
		type = 1,
		base_id = 11005,
		min_price = 285000,
		def_price = 300000,
		max_price = 315000,
		is_quest_need = 0
	},
	[11006] = {
		gain_label = "silver_coin",
		type = 1,
		base_id = 11006,
		min_price = 95000,
		def_price = 100000,
		max_price = 105000,
		is_quest_need = 0
	},
	[11007] = {
		gain_label = "silver_coin",
		type = 1,
		base_id = 11007,
		min_price = 95000,
		def_price = 100000,
		max_price = 105000,
		is_quest_need = 0
	},
	[11008] = {
		gain_label = "silver_coin",
		type = 1,
		base_id = 11008,
		min_price = 95000,
		def_price = 100000,
		max_price = 105000,
		is_quest_need = 0
	},
	[11009] = {
		gain_label = "silver_coin",
		type = 1,
		base_id = 11009,
		min_price = 95000,
		def_price = 100000,
		max_price = 105000,
		is_quest_need = 0
	}
}
Config.MarketSilverData.data_shop_open_length = 6
Config.MarketSilverData.data_shop_open = {
	[7] = {
		loss = {
			{
				2,
				100000
			}
		}
	},
	[8] = {
		loss = {
			{
				2,
				200000
			}
		}
	},
	[9] = {
		loss = {
			{
				2,
				300000
			}
		}
	},
	[10] = {
		loss = {
			{
				2,
				400000
			}
		}
	},
	[11] = {
		loss = {
			{
				3,
				100
			}
		}
	},
	[12] = {
		loss = {
			{
				3,
				200
			}
		}
	}
}
