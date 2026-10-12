Config = Config or {}
Config.HolidayFullExchangeData = Config.HolidayFullExchangeData or {}
Config.HolidayFullExchangeData.data_holiday_full_exchange_length = 4
Config.HolidayFullExchangeData.data_holiday_full_exchange = {
	[0] = {
		val = 0,
		min = 0,
		max = 998
	},
	[1999] = {
		val = 800,
		min = 1999,
		max = 4998
	},
	[4999] = {
		val = 2250,
		min = 4999,
		max = 9998
	},
	[9999] = {
		val = 5000,
		min = 9999,
		max = 999999
	}
}

function Config.HolidayFullExchangeData.data_holiday_full_exchange_fun(slot0)
	slot1 = Config.HolidayFullExchangeData.data_holiday_full_exchange[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayFullExchangeData.data_holiday_full_exchange[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
