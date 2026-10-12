Config = Config or {}
Config.CrossShowData = Config.CrossShowData or {}
Config.CrossShowData.data_const_length = 1
Config.CrossShowData.data_const = {
	game_rule = {
		val = 1,
		code = "game_rule",
		desc = [[
1.船长所在区服世界等级达到100级时开启跨服时空
2.跨服时空开启后，相关玩法同一区服组内的区服共同参与
3.跨服组根据区服世界等级分组，每2周的周一0:00进行跨服重组
4.在跨服重组后达到世界等级要求的区服，需要等待下次跨服重组，方可开启跨服时空玩法匹配]]
	}
}

function Config.CrossShowData.data_const_fun(slot0)
	slot1 = Config.CrossShowData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.CrossShowData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.CrossShowData.data_base_length = 6
Config.CrossShowData.data_base = {
	{
		source_id = 103,
		name = "天梯争霸",
		id = 1,
		icon = "1",
		open_limit = {
			{
				"lev",
				55
			}
		}
	},
	{
		source_id = 55,
		name = "公会战",
		id = 2,
		icon = "2",
		open_limit = {
			{
				"guild_war"
			}
		}
	},
	{
		source_id = 120,
		name = "跨服竞技场",
		id = 3,
		icon = "3",
		open_limit = {
			{
				"world_lev",
				120
			},
			{
				"lev",
				115
			}
		}
	},
	{
		source_id = 121,
		name = "周冠军赛",
		id = 4,
		icon = "4",
		open_limit = {
			{
				"lev",
				55
			}
		}
	},
	{
		source_id = 123,
		name = "组队竞技场",
		id = 5,
		icon = "5",
		open_limit = {
			{
				"lev",
				70
			}
		}
	},
	{
		source_id = 124,
		name = "巅峰冠军场",
		id = 6,
		icon = "6",
		open_limit = {
			{
				"world_lev",
				120
			},
			{
				"lev",
				55
			}
		}
	}
}

function Config.CrossShowData.data_base_fun(slot0)
	slot1 = Config.CrossShowData.data_base[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.CrossShowData.data_base[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
