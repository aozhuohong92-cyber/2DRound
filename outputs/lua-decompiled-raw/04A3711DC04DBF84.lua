Config = Config or {}
Config.ForecastData = Config.ForecastData or {}
Config.ForecastData.data_forecast_level_length = 13
Config.ForecastData.data_forecast_level = {
	{
		icon_res = "forecast_icon_set",
		next_id = 2,
		sub_content = "上阵第4位英雄，大幅提高领主战力！",
		title = "上阵4人",
		content = "强力英雄上阵，助领主一臂之力",
		title_res = "txt_cn_forecast_form",
		id = 1,
		open_lev = 9,
		show_level = {
			{
				99,
				99
			}
		}
	},
	{
		icon_res = "forecast_icon_arena",
		next_id = 3,
		sub_content = "冲排名，海量钻石等你来拿！",
		title = "竞技场",
		content = "攻防兼备，争夺竞技王座",
		title_res = "txt_cn_forecast_jjc",
		id = 2,
		open_lev = 10,
		show_level = {
			{
				99,
				99
			}
		}
	},
	{
		icon_res = "forecast_icon_daily",
		next_id = 4,
		sub_content = "这可是快速升级的好途径哦！",
		title = "日常任务",
		content = "每日完成日常任务，快速提升！",
		title_res = "txt_cn_forecast_rcrw",
		id = 3,
		open_lev = 11,
		show_level = {
			{
				99,
				99
			}
		}
	},
	{
		icon_res = "forecast_icon_trial",
		next_id = 5,
		sub_content = "首通送钻石，前往挑战吧!",
		title = "深海监狱",
		content = "海底监狱，只有勇者才能抵达塔顶",
		title_res = "txt_cn_forecast_slt",
		id = 4,
		open_lev = 15,
		show_level = {
			{
				99,
				99
			}
		}
	},
	{
		icon_res = "forecast_icon_guild",
		next_id = 6,
		sub_content = "快来加入联盟，和小伙伴打招呼!",
		title = "联盟",
		content = "齐心协力，共同进退",
		title_res = "txt_cn_forecast_lm",
		id = 5,
		open_lev = 17,
		show_level = {
			{
				99,
				99
			}
		}
	},
	{
		icon_res = "forecast_icon_titan",
		next_id = 7,
		sub_content = "凤凰神殿，产出大量英雄经验~",
		title = "凤凰神殿",
		content = "不灭的凤凰，你能否征服它？",
		title_res = "txt_cn_forecast_fhsd",
		id = 6,
		open_lev = 18,
		show_level = {
			{
				99,
				99
			}
		}
	},
	{
		icon_res = "forecast_icon_dragon",
		next_id = 8,
		sub_content = "巨龙巢穴，产出大量贝里~",
		title = "巨龙巢穴",
		content = "远古巨龙到底在守护什么秘密呢？",
		title_res = "txt_cn_forecast_jlsd",
		id = 7,
		open_lev = 20,
		show_level = {
			{
				99,
				99
			}
		}
	},
	{
		icon_res = "forecast_icon_eqm",
		next_id = 9,
		sub_content = "穿戴装备，快速提升英雄战斗力！",
		title = "装备副本",
		content = "千锤百炼，珍稀装备任你搭配",
		title_res = "txt_cn_forecast_zbfb",
		id = 8,
		open_lev = 22,
		show_level = {
			{
				99,
				99
			}
		}
	},
	{
		icon_res = "forecast_icon_darance",
		next_id = 10,
		sub_content = "海量钻石、万能碎片等你来拿！",
		title = "段位赛",
		content = "高手对决，赛季王者等你挑战！",
		title_res = "txt_cn_forecast_dws",
		id = 9,
		open_lev = 25,
		show_level = {
			{
				99,
				99
			}
		}
	},
	{
		icon_res = "forecast_icon_exp",
		next_id = 11,
		sub_content = "培养更多英雄，才能持久战斗！",
		title = "英雄远征",
		content = "远方的宝藏正在等待您的探索",
		title_res = "txt_cn_forecast_yxyz",
		id = 10,
		open_lev = 26,
		show_level = {
			{
				99,
				99
			}
		}
	},
	{
		icon_res = "forecast_icon_world",
		next_id = 12,
		sub_content = "培养多队伍英雄，多路出征！",
		title = "大陆争霸",
		content = "挑战世界BOSS，角逐大陆霸主！",
		title_res = "txt_cn_forecast_world",
		id = 11,
		open_lev = 28,
		show_level = {
			{
				99,
				99
			}
		}
	},
	{
		icon_res = "forecast_icon_liefeng",
		next_id = 13,
		sub_content = "极品属性洗一洗就出来了！",
		title = "异界裂缝",
		content = "洗炼石改变装备指定属性！",
		title_res = "txt_cn_forecast_liefeng",
		id = 12,
		open_lev = 32,
		show_level = {
			{
				99,
				99
			}
		}
	},
	{
		icon_res = "forecast_icon_starpalace",
		next_id = 0,
		sub_content = "英雄数量越多越好哦！",
		title = "星宫助阵",
		content = "合理放置，大幅提升英雄属性！",
		title_res = "txt_cn_forecast_starpalace",
		id = 13,
		open_lev = 40,
		show_level = {
			{
				99,
				99
			}
		}
	}
}
Config.ForecastData.data_forecast_const_length = 2
Config.ForecastData.data_forecast_const = {
	min_level = {
		val = 99,
		label = "min_level",
		desc = "最小需要显示预告栏的等级"
	},
	max_level = {
		val = 99,
		label = "max_level",
		desc = "最大需要显示预告栏的等级"
	}
}
