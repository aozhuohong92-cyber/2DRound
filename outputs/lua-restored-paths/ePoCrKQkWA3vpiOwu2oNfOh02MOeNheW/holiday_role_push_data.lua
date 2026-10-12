Config = Config or {}
Config.HolidayRolePushData = Config.HolidayRolePushData or {}
Config.HolidayRolePushData.data_constant_length = 2
Config.HolidayRolePushData.data_constant = {
	count = {
		val = 1,
		desc = "每天推送次数"
	},
	off_time_push = {
		val = 1800,
		desc = "离线间隔秒数"
	}
}

function Config.HolidayRolePushData.data_constant_fun(slot0)
	slot1 = Config.HolidayRolePushData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayRolePushData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayRolePushData.data_push_list_length = 5
Config.HolidayRolePushData.data_push_list = {
	{
		jump_id = 1
	},
	{
		jump_id = 2
	},
	{
		jump_id = 3
	},
	{
		jump_id = 4
	},
	{
		jump_id = 5
	}
}

function Config.HolidayRolePushData.data_push_list_fun(slot0)
	slot1 = Config.HolidayRolePushData.data_push_list[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayRolePushData.data_push_list[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
