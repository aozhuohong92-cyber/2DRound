Config = Config or {}
Config.CrossHallData = Config.CrossHallData or {}
Config.CrossHallData.data_const_length = 5
Config.CrossHallData.data_const = {
	initial_hall_num = {
		val = 4,
		key = "initial_hall_num",
		desc = "初始大厅数量"
	},
	hall_map = {
		val = 10003,
		key = "hall_map",
		desc = "副本大厅地图ID"
	},
	join_lev = {
		val = 50,
		key = "join_lev",
		desc = "副本大厅进入等级"
	},
	hall_max_num = {
		val = 30,
		key = "hall_max_num",
		desc = "大厅人数上限"
	},
	join_point = {
		key = "join_point",
		desc = "进入地图位置",
		val = {
			{
				1260,
				720
			},
			{
				1380,
				690
			},
			{
				1560,
				720
			},
			{
				1770,
				720
			},
			{
				1710,
				930
			},
			{
				1530,
				930
			},
			{
				1380,
				900
			}
		}
	}
}
