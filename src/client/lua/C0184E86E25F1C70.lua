Config = Config or {}
Config.DayBargainData = Config.DayBargainData or {}
Config.DayBargainData.data_info_length = 4
Config.DayBargainData.data_info = {
	[10] = {
		name = "超值三星",
		charge_id = 26,
		time = 1,
		charge_num = 128,
		return_day = 7,
		open_day = 7,
		id = 10,
		award = {
			{
				80019,
				1
			},
			{
				20023,
				30
			},
			{
				2,
				1280
			},
			{
				1,
				500000
			}
		},
		return_award = {
			{
				2,
				150
			}
		},
		effect_list = {
			{
				80019,
				1,
				0
			},
			{
				2,
				1,
				0
			},
			{
				10401,
				1,
				0
			},
			{
				10220,
				1,
				0
			}
		}
	},
	[20] = {
		name = "豪华三星",
		charge_id = 27,
		time = 15,
		charge_num = 198,
		return_day = 7,
		open_day = 7,
		id = 20,
		award = {
			{
				10220,
				1
			},
			{
				10212,
				1
			},
			{
				2,
				1980
			},
			{
				1,
				500000
			}
		},
		return_award = {
			{
				2,
				200
			}
		},
		effect_list = {
			{
				80011,
				1,
				0
			},
			{
				2,
				1,
				0
			},
			{
				10401,
				1,
				0
			},
			{
				10220,
				1,
				0
			}
		}
	},
	[30] = {
		name = "超强橙装",
		charge_id = 28,
		time = 7,
		charge_num = 328,
		return_day = 7,
		open_day = 7,
		id = 30,
		award = {
			{
				81109,
				1
			},
			{
				20023,
				50
			},
			{
				2,
				3280
			},
			{
				1,
				1000000
			}
		},
		return_award = {
			{
				2,
				250
			}
		},
		effect_list = {
			{
				30202,
				1,
				0
			},
			{
				10212,
				1,
				0
			},
			{
				2,
				1,
				0
			},
			{
				81109,
				1,
				0
			}
		}
	},
	[40] = {
		name = "极品红装",
		charge_id = 29,
		time = 15,
		charge_num = 648,
		return_day = 7,
		open_day = 7,
		id = 40,
		award = {
			{
				81110,
				1
			},
			{
				10212,
				2
			},
			{
				2,
				6480
			},
			{
				1,
				1000000
			}
		},
		return_award = {
			{
				2,
				300
			}
		},
		effect_list = {
			{
				30202,
				1,
				0
			},
			{
				10212,
				1,
				0
			},
			{
				2,
				1,
				0
			},
			{
				81110,
				1,
				0
			}
		}
	}
}
Config.DayBargainData.data_const_length = 2
Config.DayBargainData.data_const = {
	vip_gift_id = {
		val = 10,
		label = "vip_gift_id"
	},
	vip_lev = {
		val = 6,
		label = "vip_lev"
	}
}
