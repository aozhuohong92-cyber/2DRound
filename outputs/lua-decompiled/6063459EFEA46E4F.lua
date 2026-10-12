Config = Config or {}
Config.HolidayReturnNewData = Config.HolidayReturnNewData or {}
Config.HolidayReturnNewData.data_constant_length = 22
Config.HolidayReturnNewData.data_constant = {
	free_draw_time = {
		val = 1,
		label = "free_draw_time",
		desc = "活动期间免费抽奖次数"
	},
	draw_item_cost = {
		label = "draw_item_cost",
		desc = "一次抽奖道具消耗",
		val = {
			{
				10416,
				100
			}
		}
	},
	draw_item_value = {
		label = "draw_item_value",
		desc = "抽奖道具价值",
		val = {
			{
				3,
				1
			}
		}
	},
	red_item_id = {
		val = 10417,
		label = "red_item_id",
		desc = "红包道具id"
	},
	max_day_get_num = {
		val = 5,
		label = "max_day_get_num",
		desc = "每日可领红包最大数"
	},
	broadcast_num = {
		val = 30,
		label = "broadcast_num",
		desc = "传闻显示数量"
	},
	max_get_num = {
		val = 8,
		label = "max_get_num",
		desc = "红包最大可领人数"
	},
	effect_time = {
		val = 24,
		label = "effect_time",
		desc = "红包有效时间（小时）"
	},
	red_packet_cond = {
		label = "red_packet_cond",
		desc = "领红包玩家条件",
		val = {
			{
				"open_day",
				17
			},
			{
				"lev",
				10
			}
		}
	},
	exchange_item_id = {
		val = 10418,
		label = "exchange_item_id",
		desc = "兑换商城道具id"
	},
	exchange_item_day_limit_num = {
		val = 100,
		label = "exchange_item_day_limit_num",
		desc = "兑换道具每日获取上限"
	},
	tips_1 = {
		val = 1,
		label = "tips_1",
		desc = [[
1、活动期间，累计进行100次祈愿，必定可获得奖池包括【英雄祈愿自选礼盒】在内的<div fontcolor=#ef3a3a></div>全部物品！
2、<div fontcolor=#ef3a3a>首次祈愿免费</div>，后续祈愿需要消耗【英雄祈愿券】。
3、【英雄祈愿券】每个价值1钻石，<div fontcolor=#ef3a3a>活动结束后将无法使用并会按1：1回收为5千贝里(以邮件形式发放)</div>，请船长大人尽快使用。
4、<div fontcolor=#ef3a3a>第80次祈愿开始</div>，即有机率可以获得【英雄祈愿自选礼盒】，强力英雄<div fontcolor=#ef3a3a>【路飞】、【麦哲伦】、【路飞(新世界)】</div>三选一。]]
	},
	tips_2 = {
		val = 2,
		label = "tips_2",
		desc = [[
1、活动期间，玩家每日与<div fontcolor=#65df74>回归玩家</div>完成以下指定玩法可获得对应的【时光漂流瓶】，使用一定数量的【时光漂流瓶】可兑换相应奖励；
（1）与回归玩家完成好友切磋1次可获得10个漂流瓶，同个回归好友每日只能获得1次奖励
（2）在无尽试炼-好友支援中使用回归玩家支援英雄可获得20个漂流瓶，同个回归好友每日只能获得1次奖励
（3）与回归玩家完成组队竞技场组队并参与1次挑战可获得5个漂流瓶
2、活动期间，40级以上玩家在登录之前连续15日未登录游戏，即为回归玩家，<div fontcolor=#65df74>头像将会显示“回归”字眼</div>的特殊标记，可前往查看自己的回归好友。
3、通过指定玩法每日最高可获得<div fontcolor=#65df74>100个</div>【时光漂流瓶】。
4、除完成指定玩法外，也可以通过领取回归玩家发送的全服回归红包获得【时光漂流瓶】，请关注游戏内提示哦~
5、【时光漂流瓶】<div fontcolor=#65df74>活动结束后将无法使用并会按1：1回收为5千贝里(以邮件形式发放)</div>，请船长大人尽快使用。]]
	},
	exchange_cond = {
		label = "exchange_cond",
		desc = "兑换商城玩家条件",
		val = {
			{
				"open_day",
				17
			},
			{
				"lev",
				10
			}
		}
	},
	arena_team_award = {
		label = "arena_team_award",
		desc = "组队竞技场奖励",
		val = {
			{
				10418,
				5
			}
		}
	},
	pk_award = {
		label = "pk_award",
		desc = "pk奖励",
		val = {
			{
				10418,
				10
			}
		}
	},
	endless_award = {
		label = "endless_award",
		desc = "无尽试炼奖励",
		val = {
			{
				10418,
				20
			}
		}
	},
	invade_id = {
		val = 99936,
		label = "invade_id",
		desc = "id"
	},
	defend_id = {
		val = 99937,
		label = "defend_id",
		desc = "id"
	},
	red_item_value = {
		label = "red_item_value",
		desc = "红包道具返还价值",
		val = {
			{
				1,
				100000
			}
		}
	},
	exchange_item_value = {
		label = "exchange_item_value",
		desc = "兑换道具返还价值",
		val = {
			{
				1,
				5000
			}
		}
	},
	draw_item_reward_value = {
		label = "draw_item_reward_value",
		desc = "抽奖道具返还价值",
		val = {
			{
				1,
				5000
			}
		}
	}
}

function Config.HolidayReturnNewData.data_constant_fun(slot0)
	slot1 = Config.HolidayReturnNewData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayReturnNewData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayReturnNewData.data_action_holiday_length = 1
Config.HolidayReturnNewData.data_action_holiday = {
	{
		[101] = {
			panel_res = "txt_cn_returnaction1",
			panel_type = 121,
			camp_id = 101,
			max_day = 14,
			tips = "1、活动期间，40级以上玩家在登录之前连续15日未登录游戏，即为回归玩家；\n2、回归玩家头像左下角将显示“回归”字眼的特殊标记；\n3、回归玩家可免费立领以下祝福好礼；",
			title = "重逢之礼",
			min_day = 0,
			period = 1,
			ico = "222"
		},
		[102] = {
			panel_res = "txt_cn_return_summon_1",
			panel_type = 122,
			camp_id = 102,
			max_day = 14,
			tips = "",
			title = "英雄祈愿",
			min_day = 0,
			period = 1,
			ico = "220"
		},
		[103] = {
			panel_res = "txt_cn_returnaction2",
			panel_type = 123,
			camp_id = 103,
			max_day = 14,
			tips = "重聚冒险大陆，协力再创辉煌",
			title = "重聚作战",
			min_day = 0,
			period = 1,
			ico = "223"
		},
		[104] = {
			panel_res = "txt_cn_returnaction3",
			panel_type = 124,
			camp_id = 104,
			max_day = 14,
			tips = "每日登录领取回归专属好礼",
			title = "专属签到",
			min_day = 0,
			period = 1,
			ico = "224"
		}
	}
}
Config.HolidayReturnNewData.data_privilege_length = 1
Config.HolidayReturnNewData.data_privilege = {
	{
		holiday_day = 14,
		period = 1,
		start_time = {
			2019,
			12,
			19,
			0,
			0,
			0
		},
		end_time = {
			2020,
			1,
			1,
			23,
			59,
			59
		},
		open_cond = {
			{
				"prevlogout_day",
				16
			},
			{
				"lev",
				40
			}
		}
	}
}

function Config.HolidayReturnNewData.data_privilege_fun(slot0)
	slot1 = Config.HolidayReturnNewData.data_privilege[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayReturnNewData.data_privilege[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayReturnNewData.data_gift_length = 1
Config.HolidayReturnNewData.data_gift = {
	{
		period = 1,
		rewards = {
			{
				50917,
				1
			},
			{
				10403,
				2
			},
			{
				10416,
				500
			},
			{
				39059,
				1
			}
		}
	}
}

function Config.HolidayReturnNewData.data_gift_fun(slot0)
	slot1 = Config.HolidayReturnNewData.data_gift[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayReturnNewData.data_gift[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayReturnNewData.data_signin_length = 1
Config.HolidayReturnNewData.data_signin = {
	{
		{
			period = 1,
			name = "天",
			day = 1,
			rewards = {
				{
					10416,
					100
				},
				{
					10417,
					1
				}
			}
		},
		{
			period = 1,
			name = "天",
			day = 2,
			rewards = {
				{
					10416,
					100
				},
				{
					10417,
					1
				}
			}
		},
		{
			period = 1,
			name = "天",
			day = 3,
			rewards = {
				{
					10416,
					100
				},
				{
					10417,
					1
				}
			}
		},
		{
			period = 1,
			name = "天",
			day = 4,
			rewards = {
				{
					10416,
					100
				},
				{
					10417,
					1
				}
			}
		},
		{
			period = 1,
			name = "天",
			day = 5,
			rewards = {
				{
					10416,
					100
				},
				{
					10417,
					1
				}
			}
		},
		{
			period = 1,
			name = "天",
			day = 6,
			rewards = {
				{
					10416,
					100
				},
				{
					10417,
					1
				}
			}
		},
		{
			period = 1,
			name = "天",
			day = 7,
			rewards = {
				{
					10416,
					100
				},
				{
					10417,
					1
				}
			}
		}
	}
}
Config.HolidayReturnNewData.data_summon_length = 1
Config.HolidayReturnNewData.data_summon = {
	{
		{
			id = 1,
			sort = 0,
			type_id = 1,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 15,
			show = 0,
			rewards = {
				{
					72001,
					5
				}
			}
		},
		{
			id = 2,
			sort = 0,
			type_id = 1,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 15,
			show = 0,
			rewards = {
				{
					72001,
					5
				}
			}
		},
		{
			id = 3,
			sort = 0,
			type_id = 1,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 15,
			show = 0,
			rewards = {
				{
					72001,
					5
				}
			}
		},
		{
			id = 4,
			sort = 0,
			type_id = 1,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 15,
			show = 0,
			rewards = {
				{
					72001,
					5
				}
			}
		},
		{
			id = 5,
			sort = 0,
			type_id = 1,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 15,
			show = 0,
			rewards = {
				{
					72001,
					5
				}
			}
		},
		{
			id = 6,
			sort = 0,
			type_id = 1,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 15,
			show = 0,
			rewards = {
				{
					72001,
					5
				}
			}
		},
		{
			id = 7,
			sort = 0,
			type_id = 1,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 15,
			show = 0,
			rewards = {
				{
					72001,
					5
				}
			}
		},
		{
			id = 8,
			sort = 0,
			type_id = 1,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 15,
			show = 0,
			rewards = {
				{
					72001,
					5
				}
			}
		},
		{
			id = 9,
			sort = 0,
			type_id = 1,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 15,
			show = 0,
			rewards = {
				{
					72001,
					5
				}
			}
		},
		{
			id = 10,
			sort = 0,
			type_id = 1,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 15,
			show = 0,
			rewards = {
				{
					72001,
					5
				}
			}
		},
		{
			id = 11,
			sort = 0,
			type_id = 1,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 15,
			show = 0,
			rewards = {
				{
					72001,
					5
				}
			}
		},
		{
			id = 12,
			sort = 0,
			type_id = 1,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 15,
			show = 0,
			rewards = {
				{
					72001,
					5
				}
			}
		},
		{
			id = 13,
			sort = 0,
			type_id = 1,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 15,
			show = 0,
			rewards = {
				{
					72001,
					5
				}
			}
		},
		{
			id = 14,
			sort = 0,
			type_id = 1,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 15,
			show = 0,
			rewards = {
				{
					72001,
					5
				}
			}
		},
		{
			id = 15,
			sort = 0,
			type_id = 1,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 15,
			show = 0,
			rewards = {
				{
					72001,
					5
				}
			}
		},
		{
			id = 16,
			sort = 0,
			type_id = 2,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 5,
			show = 0,
			rewards = {
				{
					10040,
					5
				}
			}
		},
		{
			id = 17,
			sort = 0,
			type_id = 2,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 5,
			show = 0,
			rewards = {
				{
					10040,
					5
				}
			}
		},
		{
			id = 18,
			sort = 0,
			type_id = 2,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 5,
			show = 0,
			rewards = {
				{
					10040,
					5
				}
			}
		},
		{
			id = 19,
			sort = 0,
			type_id = 2,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 5,
			show = 0,
			rewards = {
				{
					10040,
					5
				}
			}
		},
		{
			id = 20,
			sort = 0,
			type_id = 2,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 5,
			show = 0,
			rewards = {
				{
					10040,
					5
				}
			}
		},
		{
			id = 21,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 22,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 23,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 24,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 25,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 26,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 27,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 28,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 29,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 30,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 31,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 32,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 33,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 34,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 35,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 36,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 37,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 38,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 39,
			sort = 0,
			type_id = 3,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 19,
			show = 0,
			rewards = {
				{
					28,
					10
				}
			}
		},
		{
			id = 40,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 41,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 42,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 43,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 44,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 45,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 46,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 47,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 48,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 49,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 50,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 51,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 52,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 53,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 54,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 55,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 56,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 57,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 58,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 59,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 60,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 61,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 62,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 63,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 64,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 65,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 66,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 67,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 68,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 69,
			sort = 0,
			type_id = 4,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 30,
			show = 0,
			rewards = {
				{
					10450,
					100
				}
			}
		},
		{
			id = 70,
			sort = 0,
			type_id = 5,
			pro = 100,
			must_not = 62,
			must = 0,
			period = 1,
			show_pro = 5,
			show = 0,
			rewards = {
				{
					35,
					1
				}
			}
		},
		{
			id = 71,
			sort = 0,
			type_id = 5,
			pro = 100,
			must_not = 40,
			must = 0,
			period = 1,
			show_pro = 5,
			show = 0,
			rewards = {
				{
					35,
					1
				}
			}
		},
		{
			id = 72,
			sort = 0,
			type_id = 5,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 5,
			show = 0,
			rewards = {
				{
					35,
					1
				}
			}
		},
		{
			id = 73,
			sort = 0,
			type_id = 5,
			pro = 100,
			must_not = 91,
			must = 0,
			period = 1,
			show_pro = 5,
			show = 0,
			rewards = {
				{
					35,
					1
				}
			}
		},
		{
			id = 74,
			sort = 0,
			type_id = 5,
			pro = 100,
			must_not = 0,
			must = 18,
			period = 1,
			show_pro = 5,
			show = 0,
			rewards = {
				{
					35,
					1
				}
			}
		},
		{
			id = 75,
			sort = 0,
			type_id = 6,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 2,
			show = 0,
			rewards = {
				{
					10602,
					1
				}
			}
		},
		{
			id = 76,
			sort = 0,
			type_id = 6,
			pro = 100,
			must_not = 15,
			must = 0,
			period = 1,
			show_pro = 2,
			show = 0,
			rewards = {
				{
					10602,
					1
				}
			}
		},
		{
			id = 77,
			sort = 3,
			type_id = 7,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					29905,
					5
				}
			}
		},
		{
			id = 78,
			sort = 3,
			type_id = 7,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					29905,
					5
				}
			}
		},
		{
			id = 79,
			sort = 3,
			type_id = 7,
			pro = 100,
			must_not = 81,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					29905,
					5
				}
			}
		},
		{
			id = 80,
			sort = 3,
			type_id = 7,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					29905,
					5
				}
			}
		},
		{
			id = 81,
			sort = 3,
			type_id = 7,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					29905,
					5
				}
			}
		},
		{
			id = 82,
			sort = 3,
			type_id = 7,
			pro = 100,
			must_not = 30,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					29905,
					5
				}
			}
		},
		{
			id = 83,
			sort = 3,
			type_id = 7,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					29905,
					5
				}
			}
		},
		{
			id = 84,
			sort = 3,
			type_id = 7,
			pro = 100,
			must_not = 70,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					29905,
					5
				}
			}
		},
		{
			id = 85,
			sort = 3,
			type_id = 7,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					29905,
					5
				}
			}
		},
		{
			id = 86,
			sort = 3,
			type_id = 7,
			pro = 100,
			must_not = 0,
			must = 10,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					29905,
					5
				}
			}
		},
		{
			id = 87,
			sort = 4,
			type_id = 8,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					10403,
					1
				}
			}
		},
		{
			id = 88,
			sort = 4,
			type_id = 8,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					10403,
					1
				}
			}
		},
		{
			id = 89,
			sort = 4,
			type_id = 8,
			pro = 100,
			must_not = 60,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					10403,
					1
				}
			}
		},
		{
			id = 90,
			sort = 4,
			type_id = 8,
			pro = 100,
			must_not = 61,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					10403,
					1
				}
			}
		},
		{
			id = 91,
			sort = 4,
			type_id = 8,
			pro = 100,
			must_not = 90,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					10403,
					1
				}
			}
		},
		{
			id = 92,
			sort = 4,
			type_id = 8,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					10403,
					1
				}
			}
		},
		{
			id = 93,
			sort = 4,
			type_id = 8,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					10403,
					1
				}
			}
		},
		{
			id = 94,
			sort = 4,
			type_id = 8,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					10403,
					1
				}
			}
		},
		{
			id = 95,
			sort = 4,
			type_id = 8,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					10403,
					1
				}
			}
		},
		{
			id = 96,
			sort = 4,
			type_id = 8,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 10,
			show = 1,
			rewards = {
				{
					10403,
					1
				}
			}
		},
		{
			id = 97,
			sort = 2,
			type_id = 9,
			pro = 100,
			must_not = 0,
			must = 28,
			period = 1,
			show_pro = 3,
			show = 1,
			rewards = {
				{
					14001,
					1
				}
			}
		},
		{
			id = 98,
			sort = 2,
			type_id = 9,
			pro = 100,
			must_not = 50,
			must = 0,
			period = 1,
			show_pro = 3,
			show = 1,
			rewards = {
				{
					14001,
					1
				}
			}
		},
		{
			id = 99,
			sort = 2,
			type_id = 9,
			pro = 100,
			must_not = 0,
			must = 0,
			period = 1,
			show_pro = 3,
			show = 1,
			rewards = {
				{
					14001,
					1
				}
			}
		},
		{
			id = 100,
			sort = 1,
			type_id = 10,
			pro = 100,
			must_not = 80,
			must = 0,
			period = 1,
			show_pro = 1,
			show = 1,
			rewards = {
				{
					39060,
					1
				}
			}
		}
	}
}
Config.HolidayReturnNewData.data_task_length = 7
Config.HolidayReturnNewData.data_task = {
	["1_101"] = {
		id = 101,
		title = "欢迎来我家做客",
		desc = "拜访任意好友家园1次",
		source_id = 418,
		period = 1,
		f_id = 101,
		s_id = 1,
		progress = {
			{
				cli_label = "evt_visit_home",
				target = 0,
				target_val = 1,
				param = {}
			}
		},
		award = {
			{
				10417,
				1
			}
		}
	},
	["1_102"] = {
		id = 102,
		title = "我们的友谊，情比金坚",
		desc = "好友赠送获得80点友情点",
		source_id = 402,
		period = 1,
		f_id = 102,
		s_id = 1,
		progress = {
			{
				cli_label = "evt_get_friend_point",
				target = 0,
				target_val = 80,
				param = {}
			}
		},
		award = {
			{
				10416,
				100
			}
		}
	},
	["1_103"] = {
		id = 103,
		title = "今天开始是第一天",
		desc = "新增1个好友",
		source_id = 402,
		period = 1,
		f_id = 103,
		s_id = 1,
		progress = {
			{
				cli_label = "evt_add_friend",
				target = 0,
				target_val = 1,
				param = {}
			}
		},
		award = {
			{
				10416,
				100
			}
		}
	},
	["1_104"] = {
		id = 104,
		title = "今天开始是第一天",
		desc = "新增3个好友",
		source_id = 402,
		period = 1,
		f_id = 103,
		s_id = 2,
		progress = {
			{
				cli_label = "evt_add_friend",
				target = 0,
				target_val = 3,
				param = {}
			}
		},
		award = {
			{
				10416,
				100
			}
		}
	},
	["1_105"] = {
		id = 105,
		title = "今天开始是第一天",
		desc = "新增5个好友",
		source_id = 402,
		period = 1,
		f_id = 103,
		s_id = 3,
		progress = {
			{
				cli_label = "evt_add_friend",
				target = 0,
				target_val = 5,
				param = {}
			}
		},
		award = {
			{
				10416,
				100
			}
		}
	},
	["1_106"] = {
		id = 106,
		title = "我们的公会无人能敌！",
		desc = "完成1次公会副本",
		source_id = 419,
		period = 1,
		f_id = 104,
		s_id = 1,
		progress = {
			{
				cli_label = "evt_guild_dun_fight",
				target = 0,
				target_val = 1,
				param = {}
			}
		},
		award = {
			{
				10416,
				100
			}
		}
	},
	["1_107"] = {
		id = 107,
		title = "哇！一起探险吧",
		desc = "完成1次公会秘境",
		source_id = 419,
		period = 1,
		f_id = 105,
		s_id = 1,
		progress = {
			{
				cli_label = "evt_guild_secret_area_combat",
				target = 0,
				target_val = 1,
				param = {}
			}
		},
		award = {
			{
				10416,
				100
			}
		}
	}
}

function Config.HolidayReturnNewData.data_task_fun(slot0)
	slot1 = Config.HolidayReturnNewData.data_task[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayReturnNewData.data_task[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayReturnNewData.data_lanterm_adventure_task_list_length = 1
Config.HolidayReturnNewData.data_lanterm_adventure_task_list = {
	{
		[101] = {
			{
				id = 101
			}
		},
		[102] = {
			{
				id = 102
			}
		},
		[103] = {
			{
				id = 103
			},
			{
				id = 104
			},
			{
				id = 105
			}
		},
		[104] = {
			{
				id = 106
			}
		},
		[105] = {
			{
				id = 107
			}
		}
	}
}
Config.HolidayReturnNewData.data_shop_length = 1
Config.HolidayReturnNewData.data_shop = {
	{
		{
			r_limit_day = 0,
			sub_type = 2,
			period = 1,
			title = "",
			r_limit_all = 1,
			id = 1,
			expend = {
				{
					10418,
					300
				}
			},
			award = {
				{
					14001,
					1
				}
			}
		},
		{
			r_limit_day = 0,
			sub_type = 2,
			period = 1,
			title = "",
			r_limit_all = 3,
			id = 2,
			expend = {
				{
					10418,
					60
				}
			},
			award = {
				{
					10403,
					1
				}
			}
		},
		{
			r_limit_day = 0,
			sub_type = 2,
			period = 1,
			title = "",
			r_limit_all = 1,
			id = 3,
			expend = {
				{
					10418,
					100
				}
			},
			award = {
				{
					10602,
					1
				}
			}
		},
		{
			r_limit_day = 0,
			sub_type = 2,
			period = 1,
			title = "",
			r_limit_all = 10,
			id = 4,
			expend = {
				{
					10418,
					50
				}
			},
			award = {
				{
					10450,
					100
				}
			}
		},
		{
			r_limit_day = 0,
			sub_type = 2,
			period = 1,
			title = "",
			r_limit_all = 10,
			id = 5,
			expend = {
				{
					10418,
					50
				}
			},
			award = {
				{
					10040,
					5
				}
			}
		},
		{
			r_limit_day = 0,
			sub_type = 2,
			period = 1,
			title = "",
			r_limit_all = 99,
			id = 6,
			expend = {
				{
					10418,
					10
				}
			},
			award = {
				{
					1,
					50000
				}
			}
		},
		{
			r_limit_day = 0,
			sub_type = 2,
			period = 1,
			title = "",
			r_limit_all = 99,
			id = 7,
			expend = {
				{
					10418,
					10
				}
			},
			award = {
				{
					22,
					10000
				}
			}
		}
	}
}
