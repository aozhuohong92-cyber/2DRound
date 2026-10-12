Config = Config or {}
Config.DailyData = Config.DailyData or {}
Config.DailyData.data_richanghuodong_length = 2
Config.DailyData.data_richanghuodong = {
	[111] = {
		limit_lev = 1,
		name = "狂暴魂兽",
		type = 2,
		open_time_str = "定时刷新",
		cli_state = 0,
		desc = "这是狂暴魂兽的描述",
		desc_cond = "等级达到1级",
		ico = 1,
		max_num = 6,
		is_use = 1,
		desc_time = "全天开启，2点刷新次数",
		cli_assets = "baotu",
		id = 111,
		ord = 11,
		add_huoli = {
			{
				1,
				99,
				100
			}
		},
		limit_week = {},
		limit_time = {},
		item_show = {
			{
				30000,
				1
			},
			{
				30001,
				1
			},
			{
				30002,
				1
			},
			{
				30003,
				1
			}
		}
	},
	[112] = {
		limit_lev = 1,
		name = "剧情副本",
		type = 1,
		open_time_str = "",
		cli_state = 0,
		desc = "这是剧情副本的描述",
		desc_cond = "等级达到1级",
		ico = 1,
		max_num = 3,
		is_use = 1,
		desc_time = "全天开启",
		cli_assets = "baotu",
		id = 112,
		ord = 11,
		add_huoli = {
			{
				1,
				99,
				100
			}
		},
		limit_week = {},
		limit_time = {},
		item_show = {
			{
				30000,
				1
			},
			{
				30001,
				1
			},
			{
				30002,
				1
			},
			{
				30003,
				2
			}
		}
	}
}
Config.DailyData.data_huoli_length = 5
Config.DailyData.data_huoli = {
	[100] = {
		num = 100,
		items = {
			{
				30000,
				1,
				1
			}
		}
	},
	[200] = {
		num = 200,
		items = {
			{
				30001,
				1,
				1
			}
		}
	},
	[300] = {
		num = 300,
		items = {
			{
				30002,
				1,
				1
			}
		}
	},
	[400] = {
		num = 400,
		items = {
			{
				30003,
				1,
				1
			}
		}
	},
	[500] = {
		num = 500,
		items = {
			{
				30004,
				1,
				1
			}
		}
	}
}
Config.DailyData.data_constant_length = 0
Config.DailyData.data_constant = {}
