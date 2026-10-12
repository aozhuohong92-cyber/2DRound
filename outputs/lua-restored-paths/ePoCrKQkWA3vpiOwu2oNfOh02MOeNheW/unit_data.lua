Config = Config or {}
Config.UnitData = Config.UnitData or {}

function Config.UnitData.data_unit(slot0)
	return Config.UnitData1.data_unit1(slot0) or Config.UnitData2.data_unit1(slot0) or Config.UnitData3.data_unit1(slot0) or Config.UnitData1.data_unit2(slot0) or Config.UnitData2.data_unit2(slot0) or Config.UnitData3.data_unit2(slot0)
end

Config.UnitData.data_button_length = 4
Config.UnitData.data_button = {
	[1001] = {
		name = "每日礼包",
		priority = 1,
		type = 2,
		id = 1001,
		is_auto = 0,
		ext = {},
		condition = {},
		show_cond = {}
	},
	[1002] = {
		name = "联盟红包",
		priority = 2,
		type = 2,
		id = 1002,
		is_auto = 0,
		ext = {},
		condition = {},
		show_cond = {}
	},
	[1003] = {
		name = "等级礼包",
		priority = 1,
		type = 2,
		id = 1003,
		is_auto = 0,
		ext = {},
		condition = {},
		show_cond = {}
	},
	[1010] = {
		name = "神之试炼",
		priority = 1,
		type = 2,
		id = 1010,
		is_auto = 0,
		ext = {},
		condition = {},
		show_cond = {}
	}
}

function Config.UnitData.data_button_fun(slot0)
	slot1 = Config.UnitData.data_button[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.UnitData.data_button[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
