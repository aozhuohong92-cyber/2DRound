Config = Config or {}
Config.HolidayFreedomSummonData = Config.HolidayFreedomSummonData or {}
Config.HolidayFreedomSummonData.data_const_length = 3
Config.HolidayFreedomSummonData.data_const = {
	loss_item = {
		desc = "字段第一个值为类型，1为英雄，2为物品",
		val = {
			{
				1,
				20508,
				1,
				5
			},
			{
				1,
				30509,
				1,
				5
			},
			{
				1,
				50501,
				1,
				5
			},
			{
				1,
				50514,
				1,
				5
			}
		}
	},
	award_item = {
		desc = "和之国索隆碎片",
		val = {
			{
				29900,
				50
			}
		}
	},
	preview_hero = {
		desc = "预览队伍",
		val = {
			99942,
			99943
		}
	}
}

function Config.HolidayFreedomSummonData.data_const_fun(slot0)
	slot1 = Config.HolidayFreedomSummonData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayFreedomSummonData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
