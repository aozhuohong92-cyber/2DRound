Config = Config or {}
Config.LevGiftData = Config.LevGiftData or {}
Config.LevGiftData.data_level_welfare_length = 6
Config.LevGiftData.data_level_welfare = {
	{
		name = "15级礼包",
		lev = 15,
		id = 1,
		num = 5000,
		reward = {
			{
				3,
				100
			},
			{
				10001,
				100
			},
			{
				1,
				50000
			},
			{
				22,
				50000
			}
		}
	},
	{
		name = "25级礼包",
		lev = 25,
		id = 2,
		num = 3000,
		reward = {
			{
				10403,
				1
			},
			{
				10001,
				200
			},
			{
				1,
				100000
			},
			{
				22,
				100000
			}
		}
	},
	{
		name = "35级礼包",
		lev = 35,
		id = 3,
		num = 1500,
		reward = {
			{
				10403,
				2
			},
			{
				72002,
				3
			},
			{
				1,
				200000
			},
			{
				22,
				150000
			}
		}
	},
	{
		name = "45级礼包",
		lev = 45,
		id = 4,
		num = 500,
		reward = {
			{
				10403,
				3
			},
			{
				40408,
				1
			},
			{
				1,
				300000
			},
			{
				22,
				200000
			}
		}
	},
	{
		name = "50级礼包",
		lev = 50,
		id = 5,
		num = 100,
		reward = {
			{
				10403,
				5
			},
			{
				72003,
				1
			},
			{
				1,
				400000
			},
			{
				22,
				250000
			}
		}
	},
	{
		name = "55级礼包",
		lev = 55,
		id = 6,
		num = 10,
		reward = {
			{
				10403,
				10
			},
			{
				40111,
				1
			},
			{
				1,
				500000
			},
			{
				22,
				300000
			}
		}
	}
}

function Config.LevGiftData.data_level_welfare_fun(slot0)
	slot1 = Config.LevGiftData.data_level_welfare[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.LevGiftData.data_level_welfare[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
