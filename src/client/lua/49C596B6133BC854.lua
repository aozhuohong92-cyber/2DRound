Config = Config or {}
Config.HolidayExchangeData = Config.HolidayExchangeData or {}
Config.HolidayExchangeData.data_constant_length = 1
Config.HolidayExchangeData.data_constant = {
	consume_id = {
		val = 99899,
		label = "consume_id",
		desc = "消耗物品id"
	}
}

function Config.HolidayExchangeData.data_constant_fun(slot0)
	slot1 = Config.HolidayExchangeData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayExchangeData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayExchangeData.data_get_config_const_length = 26
Config.HolidayExchangeData.data_get_config_const = {
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 1,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				1,
				100000000
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 2,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				22,
				100000000
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 3,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				10006,
				130
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 4,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				10,
				50000
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 5,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				90900,
				2
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 6,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				91000,
				1
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 7,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				10095,
				1000
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 8,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				10090,
				15
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 9,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				10040,
				100
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 10,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				10041,
				2
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 11,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				10450,
				50000
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 12,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				10490,
				1
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 13,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				72002,
				10
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 14,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				72003,
				20
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 15,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				10415,
				50
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 16,
		expend = {
			{
				99899,
				300
			}
		},
		award = {
			{
				39056,
				1
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 17,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				10460,
				50
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 18,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				16202,
				1
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 19,
		expend = {
			{
				99899,
				20
			}
		},
		award = {
			{
				39082,
				1
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 20,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				888805,
				1
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 21,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				10411,
				10
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 22,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				17006,
				200
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 23,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				17011,
				100
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 24,
		expend = {
			{
				99899,
				100
			}
		},
		award = {
			{
				10030,
				200
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 25,
		expend = {
			{
				99899,
				200
			}
		},
		award = {
			{
				10004,
				1
			}
		}
	},
	{
		s_limit_all = 0,
		title = "每日限兑",
		s_limit_day = 0,
		r_limit_day = 9999,
		sub_type = 1,
		r_limit_all = 0,
		id = 26,
		expend = {
			{
				99899,
				500
			}
		},
		award = {
			{
				39078,
				1
			}
		}
	}
}

function Config.HolidayExchangeData.data_get_config_const_fun(slot0)
	slot1 = Config.HolidayExchangeData.data_get_config_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayExchangeData.data_get_config_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
