Config = Config or {}
Config.WorldLevData = Config.WorldLevData or {}
Config.WorldLevData.data_const_length = 2
Config.WorldLevData.data_const = {
	worldlev_number = {
		val = 3,
		key = "worldlev_number",
		desc = "世界等级计算最大人数"
	},
	worldlev_des = {
		val = 0,
		key = "worldlev_des",
		desc = "世界等级由本服等级前3名玩家的等级决定"
	}
}

function Config.WorldLevData.data_const_fun(slot0)
	slot1 = Config.WorldLevData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.WorldLevData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
