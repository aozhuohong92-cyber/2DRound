Config = Config or {}
Config.HolidayDimeData = Config.HolidayDimeData or {}
Config.HolidayDimeData.data_constant_length = 1
Config.HolidayDimeData.data_constant = {
	original_price = {
		val = 2592,
		label = "original_price",
		desc = "原价"
	}
}

function Config.HolidayDimeData.data_constant_fun(slot0)
	slot1 = Config.HolidayDimeData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayDimeData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayDimeData.data_period_list_length = 5
Config.HolidayDimeData.data_period_list = {
	{
		period = 1,
		change_id = 1705,
		is_cheap = 0
	},
	{
		period = 2,
		change_id = 1707,
		is_cheap = 0
	},
	{
		period = 3,
		change_id = 1708,
		is_cheap = 0
	},
	{
		period = 4,
		change_id = 1708,
		is_cheap = 0
	},
	{
		period = 5,
		change_id = 1708,
		is_cheap = 0
	}
}
Config.HolidayDimeData.data_award_list_length = 5
Config.HolidayDimeData.data_award_list = {
	{
		{
			id = 1,
			is_show_effect = 0,
			power_limit = 0,
			period = 1,
			tget = "0",
			award = {
				{
					3,
					200
				}
			}
		},
		{
			id = 2,
			is_show_effect = 0,
			power_limit = 50000,
			period = 1,
			tget = "0",
			award = {
				{
					10403,
					1
				}
			}
		},
		{
			id = 3,
			is_show_effect = 0,
			power_limit = 150000,
			period = 1,
			tget = "0",
			award = {
				{
					10001,
					200
				}
			}
		},
		{
			id = 4,
			is_show_effect = 1,
			power_limit = 300000,
			period = 1,
			tget = "0",
			award = {
				{
					24912,
					50
				}
			}
		}
	},
	{
		[5] = {
			id = 5,
			is_show_effect = 0,
			power_limit = 0,
			period = 2,
			tget = "立即获得",
			award = {
				{
					3,
					3280
				}
			}
		},
		[6] = {
			id = 6,
			is_show_effect = 0,
			power_limit = 1634774400,
			period = 2,
			tget = "10月21号8点获得",
			award = {
				{
					10403,
					30
				}
			}
		},
		[7] = {
			id = 7,
			is_show_effect = 0,
			power_limit = 1634947200,
			period = 2,
			tget = "10月23号8点获得",
			award = {
				{
					14001,
					10
				}
			}
		},
		[8] = {
			id = 8,
			is_show_effect = 1,
			power_limit = 1635206400,
			period = 2,
			tget = "10月26号8点获得",
			award = {
				{
					10420,
					1
				}
			}
		}
	},
	{
		[9] = {
			id = 9,
			is_show_effect = 0,
			power_limit = 0,
			period = 3,
			tget = "立即获得",
			award = {
				{
					3,
					6480
				}
			}
		},
		[10] = {
			id = 10,
			is_show_effect = 0,
			power_limit = 1635379200,
			period = 3,
			tget = "10月28号8点获得",
			award = {
				{
					28908,
					50
				}
			}
		},
		[11] = {
			id = 11,
			is_show_effect = 0,
			power_limit = 1635465600,
			period = 3,
			tget = "10月29号8点获得",
			award = {
				{
					28904,
					50
				}
			}
		},
		[12] = {
			id = 12,
			is_show_effect = 1,
			power_limit = 1635552000,
			period = 3,
			tget = "10月30号8点获得",
			award = {
				{
					10420,
					1
				}
			}
		}
	},
	{
		[13] = {
			id = 13,
			is_show_effect = 0,
			power_limit = 0,
			period = 4,
			tget = "立即获得",
			award = {
				{
					3,
					6480
				}
			}
		},
		[14] = {
			id = 14,
			is_show_effect = 0,
			power_limit = 1638144000,
			period = 4,
			tget = "11月29号8点获得",
			award = {
				{
					28909,
					50
				}
			}
		},
		[15] = {
			id = 15,
			is_show_effect = 0,
			power_limit = 1638316800,
			period = 4,
			tget = "12月1号8点获得",
			award = {
				{
					27907,
					50
				}
			}
		},
		[16] = {
			id = 16,
			is_show_effect = 1,
			power_limit = 1638547200,
			period = 4,
			tget = "12月4号0点获得",
			award = {
				{
					11421,
					1
				}
			}
		}
	},
	{
		[13] = {
			id = 13,
			is_show_effect = 0,
			power_limit = 0,
			period = 5,
			tget = "立即获得",
			award = {
				{
					3,
					6480
				}
			}
		},
		[14] = {
			id = 14,
			is_show_effect = 0,
			power_limit = 1638144000,
			period = 5,
			tget = "立即获得",
			award = {
				{
					14001,
					15
				}
			}
		},
		[15] = {
			id = 15,
			is_show_effect = 0,
			power_limit = 1638316800,
			period = 5,
			tget = "立即获得",
			award = {
				{
					28910,
					50
				}
			}
		},
		[16] = {
			id = 16,
			is_show_effect = 1,
			power_limit = 1638547200,
			period = 5,
			tget = "立即获得",
			award = {
				{
					11422,
					1
				}
			}
		}
	}
}
