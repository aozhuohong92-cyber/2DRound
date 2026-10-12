Config = Config or {}
Config.CityData = Config.CityData or {}
Config.CityData.data_base_length = 16
Config.CityData.data_base = {
	{
		is_verifyios = 1,
		name = "商城",
		desc = "6级解锁",
		activate = {
			{
				"lev",
				6
			}
		}
	},
	{
		is_verifyios = 1,
		name = "铁匠铺",
		desc = "5级解锁",
		activate = {
			{
				"lev",
				5
			}
		}
	},
	{
		is_verifyios = 1,
		name = "竞技场",
		desc = "8级解锁",
		activate = {
			{
				"lev",
				8
			}
		}
	},
	{
		is_verifyios = 1,
		name = "海底监狱",
		desc = "16级解锁",
		activate = {
			{
				"lev",
				16
			}
		}
	},
	{
		is_verifyios = 1,
		name = "召唤",
		desc = "1级解锁",
		activate = {
			{
				"lev",
				1
			}
		}
	},
	{
		is_verifyios = 1,
		name = "融合祭坛",
		desc = "1级解锁",
		activate = {
			{
				"lev",
				1
			}
		}
	},
	{
		is_verifyios = 1,
		name = "祭坛",
		desc = "1级解锁",
		activate = {
			{
				"lev",
				1
			}
		}
	},
	{
		is_verifyios = 1,
		name = "伟大召唤处",
		desc = "20级解锁",
		activate = {
			{
				"lev",
				20
			}
		}
	},
	{
		is_verifyios = 0,
		name = "图书馆",
		desc = "10级解锁",
		activate = {
			{
				"lev",
				10
			}
		}
	},
	{
		is_verifyios = 1,
		name = "酒吧柜台",
		desc = "2关解锁",
		activate = {
			{
				"dun",
				10020
			}
		}
	},
	{
		is_verifyios = 0,
		name = "冒险",
		desc = "50级解锁",
		activate = {
			{
				"lev",
				50
			}
		}
	},
	{
		is_verifyios = 0,
		name = "跨服天梯",
		desc = "55级解锁",
		activate = {
			{
				"lev",
				55
			}
		}
	},
	{
		is_verifyios = 0,
		name = "跨服时空",
		desc = "世界100级解锁",
		activate = {
			{
				"world_lev",
				100
			}
		}
	},
	[15] = {
		is_verifyios = 0,
		name = "共鸣水晶",
		desc = "90级解锁",
		activate = {
			{
				"lev",
				90
			}
		}
	},
	[16] = {
		is_verifyios = 0,
		name = "幸运探宝",
		desc = "10级解锁",
		activate = {
			{
				"lev",
				10
			}
		}
	},
	[17] = {
		is_verifyios = 0,
		name = "恶魔果实",
		desc = "10级解锁",
		activate = {
			{
				"lev",
				10
			}
		}
	}
}

function Config.CityData.data_base_fun(slot0)
	slot1 = Config.CityData.data_base[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.CityData.data_base[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.CityData.data_const_length = 1
Config.CityData.data_const = {
	camera_default_x_pos = {
		val = -505,
		desc = "主城摄像机初始位置"
	}
}

function Config.CityData.data_const_fun(slot0)
	slot1 = Config.CityData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.CityData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
