Config = Config or {}
Config.StarDivinationData = Config.StarDivinationData or {}
Config.StarDivinationData.data_divination_const_length = 11
Config.StarDivinationData.data_divination_const = {
	divine_cost = {
		code = "divine_cost",
		desc = "单次占卜消耗星魂数量",
		val = {
			17,
			500
		}
	},
	divine_cost10 = {
		code = "divine_cost10",
		desc = "10次占卜消耗星魂数量",
		val = {
			17,
			4888
		}
	},
	divine_change = {
		code = "divine_change",
		desc = "单次观星",
		val = {
			15,
			50
		}
	},
	divine_change10 = {
		code = "divine_change10",
		desc = "十连观星",
		val = {
			15,
			488
		}
	},
	divine_times = {
		val = 9999,
		code = "divine_times",
		desc = "每日钻石可兑换抽取次数"
	},
	divine_free = {
		val = 1,
		code = "divine_free",
		desc = "每日星魂单抽免费次数"
	},
	divine_buy = {
		code = "divine_buy",
		desc = "钻石单抽购买获得的星灵积分数量",
		val = {
			18,
			100
		}
	},
	divine_buy10 = {
		code = "divine_buy10",
		desc = "钻石10连抽购买获得的星灵积分数量",
		val = {
			18,
			1000
		}
	},
	up_item = {
		val = 10301,
		code = "up_item",
		desc = "星命精华"
	},
	exchange_item = {
		val = 18,
		code = "exchange_item",
		desc = "星灵积分"
	},
	divine_open = {
		code = "divine_open",
		desc = "开服第3天且等级达到42级开启观星",
		val = {
			{
				"open_day",
				3
			},
			{
				"lev",
				42
			}
		}
	}
}
Config.StarDivinationData.data_divination_flash_name_length = 12
Config.StarDivinationData.data_divination_flash_name = {
	{
		star_name = "白羊",
		id = 1
	},
	{
		star_name = "金牛",
		id = 2
	},
	{
		star_name = "双子",
		id = 3
	},
	{
		star_name = "巨蟹",
		id = 4
	},
	{
		star_name = "狮子",
		id = 5
	},
	{
		star_name = "处女",
		id = 6
	},
	{
		star_name = "天秤",
		id = 7
	},
	{
		star_name = "天蝎",
		id = 8
	},
	{
		star_name = "射手",
		id = 9
	},
	{
		star_name = "摩羯",
		id = 10
	},
	{
		star_name = "水瓶",
		id = 11
	},
	{
		star_name = "双鱼",
		id = 12
	}
}
Config.StarDivinationData.data_divination_flash_length = 20
Config.StarDivinationData.data_divination_flash = {
	{
		count = 1,
		expend = {
			{
				15,
				20
			}
		}
	},
	{
		count = 2,
		expend = {
			{
				15,
				20
			}
		}
	},
	{
		count = 3,
		expend = {
			{
				15,
				20
			}
		}
	},
	{
		count = 4,
		expend = {
			{
				15,
				30
			}
		}
	},
	{
		count = 5,
		expend = {
			{
				15,
				30
			}
		}
	},
	{
		count = 6,
		expend = {
			{
				15,
				30
			}
		}
	},
	{
		count = 7,
		expend = {
			{
				15,
				40
			}
		}
	},
	{
		count = 8,
		expend = {
			{
				15,
				40
			}
		}
	},
	{
		count = 9,
		expend = {
			{
				15,
				40
			}
		}
	},
	{
		count = 10,
		expend = {
			{
				15,
				50
			}
		}
	},
	{
		count = 11,
		expend = {
			{
				15,
				50
			}
		}
	},
	{
		count = 12,
		expend = {
			{
				15,
				50
			}
		}
	},
	{
		count = 13,
		expend = {
			{
				15,
				50
			}
		}
	},
	{
		count = 14,
		expend = {
			{
				15,
				50
			}
		}
	},
	{
		count = 15,
		expend = {
			{
				15,
				80
			}
		}
	},
	{
		count = 16,
		expend = {
			{
				15,
				80
			}
		}
	},
	{
		count = 17,
		expend = {
			{
				15,
				80
			}
		}
	},
	{
		count = 18,
		expend = {
			{
				15,
				80
			}
		}
	},
	{
		count = 19,
		expend = {
			{
				15,
				80
			}
		}
	},
	{
		count = 20,
		expend = {
			{
				15,
				80
			}
		}
	}
}
Config.StarDivinationData.data_explain_length = 3
Config.StarDivinationData.data_explain = {
	{
		id = 1,
		title = "观星规则",
		desc = [[
1.观星可获得命格和星命升级材料，但只能获得已解锁的命格种类
2.可通过挑战星命塔来解锁新的命格类型
3.命格的品质由低到高分为：绿、蓝、紫、橙、红5种
4.当前点亮的宝石颜色决定下一次抽取到的命格品质
5.当前运势可提高获得对应类型命格的概率，可消耗少量钻石进行刷新]]
	},
	{
		id = 2,
		title = "观星掉落",
		desc = "应国家有关法律规定，对游戏内容观星物品产出概率进行公布，这些“概率”均是在大样本（大量用户）下的统计数值，与单个玩家的少量测试数据之间可能存在一定差异，<div fontcolor=#a95f0f>希望广大玩家理性消费，健康游戏。"
	},
	{
		id = 3,
		title = "",
		desc = [[
绿色命格                                                                      37.86%
蓝色命格                                                                      31.88%
紫色命格                                                                      8.3%
橙色命格                                                                      2.90%
红色命格                                                                      0.6%
星命精华                                                                      15.47%
炼星石                                                                        1.76%
中级炼星石                                                                    1.22%]]
	}
}
