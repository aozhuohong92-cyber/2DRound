Config = Config or {}
Config.HolidayPersonalGiftData = Config.HolidayPersonalGiftData or {}
Config.HolidayPersonalGiftData.data_price_length = 6
Config.HolidayPersonalGiftData.data_price = {
	[6] = {
		charge_id = 1201,
		price = 6
	},
	[30] = {
		charge_id = 1202,
		price = 30
	},
	[68] = {
		charge_id = 1203,
		price = 68
	},
	[128] = {
		charge_id = 1204,
		price = 128
	},
	[328] = {
		charge_id = 1205,
		price = 328
	},
	[648] = {
		charge_id = 1206,
		price = 648
	}
}

function Config.HolidayPersonalGiftData.data_price_fun(slot0)
	slot1 = Config.HolidayPersonalGiftData.data_price[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayPersonalGiftData.data_price[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayPersonalGiftData.data_gift_warehouse_length = 6
Config.HolidayPersonalGiftData.data_gift_warehouse = {
	{
		price = 648,
		name = "888",
		limit_count = 1,
		award = {
			{
				3,
				6480
			},
			{
				10,
				105300
			}
		}
	},
	{
		price = 648,
		name = "888",
		limit_count = 1,
		award = {
			{
				3,
				6480
			},
			{
				28,
				4200
			}
		}
	},
	{
		price = 648,
		name = "888",
		limit_count = 1,
		award = {
			{
				3,
				6480
			},
			{
				10450,
				42100
			}
		}
	},
	{
		price = 648,
		name = "888",
		limit_count = 1,
		award = {
			{
				3,
				6480
			},
			{
				72001,
				2800
			}
		}
	},
	{
		price = 648,
		name = "888",
		limit_count = 1,
		award = {
			{
				3,
				6480
			},
			{
				32,
				2106000
			}
		}
	},
	{
		price = 648,
		name = "888",
		limit_count = 1,
		award = {
			{
				3,
				6480
			},
			{
				17009,
				2100
			}
		}
	}
}

function Config.HolidayPersonalGiftData.data_gift_warehouse_fun(slot0)
	slot1 = Config.HolidayPersonalGiftData.data_gift_warehouse[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayPersonalGiftData.data_gift_warehouse[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
