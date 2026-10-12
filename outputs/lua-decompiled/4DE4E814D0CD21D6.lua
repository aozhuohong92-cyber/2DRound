Config = Config or {}
Config.HolidaySpecialSummonData = Config.HolidaySpecialSummonData or {}
Config.HolidaySpecialSummonData.data_const_length = 2
Config.HolidaySpecialSummonData.data_const = {
	loss_item = {
		desc = "召唤神龙需要的物品",
		val = {
			{
				11010,
				1
			},
			{
				11011,
				1
			},
			{
				11012,
				1
			},
			{
				11013,
				1
			}
		}
	},
	award_item = {
		desc = "召唤获得的物品",
		val = {
			{
				39186,
				1
			}
		}
	},
	tips = {
		val = 1,
		desc = "参与主题活动中的【寻找历史】活动，收集4块红色历史正文，即可获得奖励。"
	}
}

function Config.HolidaySpecialSummonData.data_const_fun(slot0)
	slot1 = Config.HolidaySpecialSummonData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidaySpecialSummonData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
