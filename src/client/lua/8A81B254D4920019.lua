Config = Config or {}
Config.HolidayHolyEqmData = Config.HolidayHolyEqmData or {}
Config.HolidayHolyEqmData.data_constant_length = 0
Config.HolidayHolyEqmData.data_constant = {}

function Config.HolidayHolyEqmData.data_constant_fun(slot0)
	slot1 = Config.HolidayHolyEqmData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayHolyEqmData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayHolyEqmData.data_reward_list_length = 5
Config.HolidayHolyEqmData.data_reward_list = {
	{
		{
			min_dun_id = 10001,
			limit_type = 4,
			charge_id = 725,
			id = 1,
			limit_all = 1,
			limit_day = 0,
			limit_week = 0,
			limit_month = 0,
			max_dun_id = 10049,
			f_id = 1,
			price = 128,
			award = {
				{
					3,
					1280
				},
				{
					39497,
					1
				},
				{
					17201,
					20
				},
				{
					10030,
					80
				}
			}
		},
		{
			min_dun_id = 10001,
			limit_type = 2,
			charge_id = 721,
			id = 2,
			limit_all = 0,
			limit_day = 0,
			limit_week = 3,
			limit_month = 0,
			max_dun_id = 10049,
			f_id = 1,
			price = 128,
			award = {
				{
					3,
					1280
				},
				{
					17201,
					32
				},
				{
					28,
					120
				},
				{
					1,
					2000000
				}
			}
		},
		{
			min_dun_id = 10001,
			limit_type = 2,
			charge_id = 722,
			id = 3,
			limit_all = 0,
			limit_day = 0,
			limit_week = 3,
			limit_month = 0,
			max_dun_id = 10049,
			f_id = 1,
			price = 328,
			award = {
				{
					3,
					3280
				},
				{
					17201,
					68
				},
				{
					28,
					300
				},
				{
					1,
					5000000
				}
			}
		}
	},
	{
		{
			min_dun_id = 10050,
			limit_type = 4,
			charge_id = 726,
			id = 1,
			limit_all = 1,
			limit_day = 0,
			limit_week = 0,
			limit_month = 0,
			max_dun_id = 10089,
			f_id = 2,
			price = 198,
			award = {
				{
					3,
					1980
				},
				{
					39501,
					1
				},
				{
					17202,
					26
				},
				{
					10030,
					120
				}
			}
		},
		{
			min_dun_id = 10050,
			limit_type = 2,
			charge_id = 721,
			id = 2,
			limit_all = 0,
			limit_day = 0,
			limit_week = 3,
			limit_month = 0,
			max_dun_id = 10089,
			f_id = 2,
			price = 128,
			award = {
				{
					3,
					1280
				},
				{
					17202,
					32
				},
				{
					28,
					120
				},
				{
					1,
					2000000
				}
			}
		},
		{
			min_dun_id = 10050,
			limit_type = 2,
			charge_id = 722,
			id = 3,
			limit_all = 0,
			limit_day = 0,
			limit_week = 3,
			limit_month = 0,
			max_dun_id = 10089,
			f_id = 2,
			price = 328,
			award = {
				{
					3,
					3280
				},
				{
					17202,
					68
				},
				{
					28,
					300
				},
				{
					1,
					5000000
				}
			}
		}
	},
	{
		{
			min_dun_id = 10090,
			limit_type = 4,
			charge_id = 727,
			id = 1,
			limit_all = 1,
			limit_day = 0,
			limit_week = 0,
			limit_month = 0,
			max_dun_id = 10159,
			f_id = 3,
			price = 328,
			award = {
				{
					3,
					3280
				},
				{
					39505,
					1
				},
				{
					17203,
					36
				},
				{
					10030,
					220
				}
			}
		},
		{
			min_dun_id = 10090,
			limit_type = 2,
			charge_id = 721,
			id = 2,
			limit_all = 0,
			limit_day = 0,
			limit_week = 3,
			limit_month = 0,
			max_dun_id = 10159,
			f_id = 3,
			price = 128,
			award = {
				{
					3,
					1280
				},
				{
					17203,
					32
				},
				{
					28,
					120
				},
				{
					1,
					2000000
				}
			}
		},
		{
			min_dun_id = 10090,
			limit_type = 2,
			charge_id = 722,
			id = 3,
			limit_all = 0,
			limit_day = 0,
			limit_week = 3,
			limit_month = 0,
			max_dun_id = 10159,
			f_id = 3,
			price = 328,
			award = {
				{
					3,
					3280
				},
				{
					17203,
					68
				},
				{
					28,
					300
				},
				{
					1,
					5000000
				}
			}
		}
	},
	{
		{
			min_dun_id = 10160,
			limit_type = 4,
			charge_id = 728,
			id = 1,
			limit_all = 1,
			limit_day = 0,
			limit_week = 0,
			limit_month = 0,
			max_dun_id = 10249,
			f_id = 4,
			price = 448,
			award = {
				{
					3,
					4480
				},
				{
					39509,
					1
				},
				{
					17204,
					42
				},
				{
					10030,
					300
				}
			}
		},
		{
			min_dun_id = 10160,
			limit_type = 2,
			charge_id = 721,
			id = 2,
			limit_all = 0,
			limit_day = 0,
			limit_week = 3,
			limit_month = 0,
			max_dun_id = 10249,
			f_id = 4,
			price = 128,
			award = {
				{
					3,
					1280
				},
				{
					17204,
					32
				},
				{
					28,
					120
				},
				{
					1,
					2000000
				}
			}
		},
		{
			min_dun_id = 10160,
			limit_type = 2,
			charge_id = 722,
			id = 3,
			limit_all = 0,
			limit_day = 0,
			limit_week = 3,
			limit_month = 0,
			max_dun_id = 10249,
			f_id = 4,
			price = 328,
			award = {
				{
					3,
					3280
				},
				{
					17204,
					68
				},
				{
					28,
					300
				},
				{
					1,
					5000000
				}
			}
		}
	},
	{
		{
			min_dun_id = 10250,
			limit_type = 4,
			charge_id = 728,
			id = 1,
			limit_all = 1,
			limit_day = 0,
			limit_week = 0,
			limit_month = 0,
			max_dun_id = 10350,
			f_id = 5,
			price = 448,
			award = {
				{
					3,
					4480
				},
				{
					39509,
					1
				},
				{
					17205,
					42
				},
				{
					10030,
					300
				}
			}
		},
		{
			min_dun_id = 10250,
			limit_type = 2,
			charge_id = 721,
			id = 2,
			limit_all = 0,
			limit_day = 0,
			limit_week = 3,
			limit_month = 0,
			max_dun_id = 10350,
			f_id = 5,
			price = 128,
			award = {
				{
					3,
					1280
				},
				{
					17205,
					32
				},
				{
					28,
					120
				},
				{
					1,
					2000000
				}
			}
		},
		{
			min_dun_id = 10250,
			limit_type = 2,
			charge_id = 722,
			id = 3,
			limit_all = 0,
			limit_day = 0,
			limit_week = 3,
			limit_month = 0,
			max_dun_id = 10350,
			f_id = 5,
			price = 328,
			award = {
				{
					3,
					3280
				},
				{
					17205,
					68
				},
				{
					28,
					300
				},
				{
					1,
					5000000
				}
			}
		}
	}
}
