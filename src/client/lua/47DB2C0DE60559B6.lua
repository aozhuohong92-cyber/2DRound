Config = Config or {}
Config.HolidaySnowmanData = Config.HolidaySnowmanData or {}
Config.HolidaySnowmanData.data_const_data_length = 1
Config.HolidaySnowmanData.data_const_data = {
	cost_item = {
		val = 14803,
		key = "cost_item",
		desc = "消耗道具"
	}
}
Config.HolidaySnowmanData.data_item_data_length = 1
Config.HolidaySnowmanData.data_item_data = {
	[14803] = {
		reward_id = 14800,
		happy_val = 1,
		base_id = 14803
	}
}
Config.HolidaySnowmanData.data_happy_list_length = 4
Config.HolidaySnowmanData.data_happy_list = {
	[100] = {
		happy_val = 100,
		rewards = {
			{
				14801,
				1
			}
		}
	},
	[250] = {
		happy_val = 250,
		rewards = {
			{
				14801,
				1
			}
		}
	},
	[400] = {
		happy_val = 400,
		rewards = {
			{
				14801,
				1
			}
		}
	},
	[600] = {
		happy_val = 600,
		rewards = {
			{
				14802,
				1
			}
		}
	}
}
