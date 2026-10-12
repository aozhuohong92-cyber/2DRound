Config = Config or {}
Config.HolidayClientData = Config.HolidayClientData or {}
Config.HolidayClientData.data_info_length = 17
Config.HolidayClientData.data_info = {
	[8003] = {
		sort_val = 1,
		is_verifyios = 1,
		type = 2,
		title = "签到",
		bid = 8003,
		type_ico = 0,
		panel_type = 3,
		ico = "3",
		open_lev = {
			{
				"lev",
				5
			}
		},
		items = {}
	},
	[8010] = {
		sort_val = 14,
		is_verifyios = 1,
		type = 2,
		title = "问卷调查",
		bid = 8010,
		type_ico = 0,
		panel_type = 11,
		ico = "44",
		open_lev = {
			{
				"lev",
				999
			}
		},
		items = {}
	},
	[8011] = {
		sort_val = 7,
		is_verifyios = 1,
		type = 2,
		title = "每周限购",
		bid = 8011,
		type_ico = 0,
		panel_type = 12,
		ico = "45",
		open_lev = {
			{
				"lev",
				10
			}
		},
		items = {}
	},
	[8012] = {
		sort_val = 8,
		is_verifyios = 1,
		type = 2,
		title = "月度限量",
		bid = 8012,
		type_ico = 0,
		panel_type = 12,
		ico = "46",
		open_lev = {
			{
				"lev",
				10
			}
		},
		items = {}
	},
	[8009] = {
		sort_val = 2,
		is_verifyios = 1,
		type = 2,
		title = "荣耀月卡",
		bid = 8009,
		type_ico = 0,
		panel_type = 10,
		ico = "40",
		open_lev = {
			{
				"lev",
				990
			}
		},
		items = {}
	},
	[8001] = {
		sort_val = 3,
		is_verifyios = 1,
		type = 2,
		title = "至尊月卡",
		bid = 8001,
		type_ico = 0,
		panel_type = 1,
		ico = "1",
		open_lev = {
			{
				"lev",
				990
			}
		},
		items = {}
	},
	[991008] = {
		sort_val = 9,
		is_verifyios = 1,
		type = 2,
		title = "成长基金",
		bid = 991008,
		type_ico = 0,
		panel_type = 8,
		ico = "20",
		open_lev = {
			{
				"lev",
				10
			}
		},
		items = {}
	},
	[8007] = {
		sort_val = 13,
		is_verifyios = 0,
		type = 2,
		title = "游戏分享",
		bid = 8007,
		type_ico = 0,
		panel_type = 9,
		ico = "36",
		open_lev = {
			{
				"lev",
				10
			}
		},
		items = {}
	},
	[8014] = {
		sort_val = 11,
		is_verifyios = 0,
		type = 2,
		title = "官微福利",
		bid = 8014,
		type_ico = 0,
		panel_type = 14,
		ico = "68",
		open_lev = {
			{
				"lev",
				999
			}
		},
		items = {}
	},
	[8015] = {
		sort_val = 12,
		is_verifyios = 0,
		type = 2,
		title = "手机绑定",
		bid = 8015,
		type_ico = 0,
		panel_type = 15,
		ico = "67",
		open_lev = {
			{
				"lev",
				999
			}
		},
		items = {}
	},
	[8016] = {
		sort_val = 10,
		is_verifyios = 0,
		type = 2,
		title = "推荐码",
		bid = 8016,
		type_ico = 0,
		panel_type = 16,
		ico = "79",
		open_lev = {
			{
				"lev",
				999
			}
		},
		items = {}
	},
	[8017] = {
		sort_val = 15,
		is_verifyios = 0,
		type = 2,
		title = "贴吧福利",
		bid = 8017,
		type_ico = 0,
		panel_type = 17,
		ico = "83",
		open_lev = {
			{
				"lev",
				999
			}
		},
		items = {
			{
				3,
				200
			},
			{
				10403,
				1
			},
			{
				37001,
				1
			}
		}
	},
	[8018] = {
		sort_val = 4,
		is_verifyios = 1,
		type = 2,
		title = "悬赏商城",
		bid = 8018,
		type_ico = 0,
		panel_type = 18,
		ico = "157",
		open_lev = {
			{
				"lev",
				10
			},
			{
				"open_day",
				7
			}
		},
		items = {}
	},
	[101] = {
		sort_val = 5,
		is_verifyios = 0,
		type = 2,
		title = "月基金128",
		bid = 101,
		type_ico = 0,
		panel_type = 19,
		ico = "48",
		open_lev = {
			{
				"lev",
				10
			}
		},
		items = {}
	},
	[102] = {
		sort_val = 6,
		is_verifyios = 0,
		type = 2,
		title = "月基金328",
		bid = 102,
		type_ico = 0,
		panel_type = 20,
		ico = "49",
		open_lev = {
			{
				"lev",
				10
			}
		},
		items = {}
	},
	[8019] = {
		sort_val = 2,
		is_verifyios = 1,
		type = 2,
		title = "超值月卡",
		bid = 8019,
		type_ico = 0,
		panel_type = 21,
		ico = "214",
		open_lev = {
			{
				"lev",
				10
			}
		},
		items = {}
	},
	[8020] = {
		sort_val = 9,
		is_verifyios = 0,
		type = 2,
		title = "专属特权",
		bid = 8020,
		type_ico = 0,
		panel_type = 22,
		ico = "262",
		open_lev = {
			{
				"lev",
				10
			}
		},
		items = {}
	}
}

function Config.HolidayClientData.data_info_fun(slot0)
	slot1 = Config.HolidayClientData.data_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayClientData.data_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayClientData.data_constant_length = 17
Config.HolidayClientData.data_constant = {
	chargegift_rules = {
		sign = "chargegift_rules",
		desc = "1.每充值对应金额可获1次抽奖次数\n2.点击对应档次开始抽奖\n3.直购礼包不计入本次活动",
		items = {
			{
				128,
				198
			},
			{
				328
			},
			{
				648
			}
		}
	},
	preferential_rules = {
		sign = "preferential_rules",
		desc = "1.购买礼包不会获得充值钻石。\n2.购买礼包会正常增加vip经验。",
		items = {}
	},
	checkmore1 = {
		sign = "checkmore1",
		desc = "",
		items = {
			{
				3,
				120
			},
			{
				10404,
				100
			},
			{
				10430,
				100
			},
			{
				10030,
				150
			},
			{
				34007,
				100
			},
			{
				14000,
				100
			},
			{
				35113,
				150
			},
			{
				10420,
				120
			},
			{
				34008,
				60
			}
		}
	},
	checkmore2 = {
		sign = "checkmore2",
		desc = "",
		items = {
			{
				3,
				150
			},
			{
				10404,
				200
			},
			{
				10431,
				100
			},
			{
				10030,
				150
			},
			{
				30019,
				10
			},
			{
				14000,
				100
			},
			{
				35113,
				100
			},
			{
				10421,
				80
			},
			{
				34008,
				110
			}
		}
	},
	checkmore3 = {
		sign = "checkmore3",
		desc = "",
		items = {
			{
				3,
				150
			},
			{
				10404,
				100
			},
			{
				10431,
				150
			},
			{
				10030,
				150
			},
			{
				34009,
				10
			},
			{
				30019,
				30
			},
			{
				35113,
				150
			},
			{
				10421,
				125
			},
			{
				34008,
				135
			}
		}
	},
	title_rules = {
		sign = "title_rules",
		desc = "1.在活动时间内激活首充、荣耀月卡、至尊月卡、投资计划、成长基金便可领取尊贵的称号。\n2.任务完成后，称号将以邮件形式发送。",
		items = {
			{
				10
			},
			{
				"hp_max",
				300
			},
			{
				"atk",
				60
			},
			{
				"def",
				45
			}
		}
	},
	card_1_rules = {
		sign = "card_1_rules",
		desc = "6666_4",
		items = {}
	},
	card_2_rules = {
		sign = "card_2_rules",
		desc = "66666_5",
		items = {}
	},
	luxury_rules = {
		sign = "luxury_rules",
		desc = "1.单日充值单笔6元以上可激活奖励，每日激活1次\n2.15档奖励为一轮，领取满15档奖励自动刷新第二轮积天豪礼活动\n3.普通充值、直购礼包、基金等均可触发该活动奖励",
		items = {}
	},
	expedit_rules = {
		sign = "expedit_rules",
		desc = [[
1.远征排行榜活动根据每日通关层数进行积分，积分越高，排名越高
 2.积分相同时，根据达成分数的时间先后进行排序，达成的越早，排名越高
3.完成每种难度的远征可以获得不同数量的积分，其中,简单：1分/关；普通：2分/关；困难：3分/关
4.远征自动扫荡的关卡也计为通关，并可获得对应难度的积分
5.远征次数任务以每通关一层+1进行计算]],
		items = {}
	},
	adventure_rules = {
		sign = "adventure_rules",
		desc = [[
1.活动期间，以所达到的冒险层数最大值计算冒险排行榜的排名。
 2.击败该层最终boss并进入下一层，方计算为通关1层。
3.当有多名玩家层数相同时，以探索度进行排名。
4.当冒险层数与探索度均相同时，根据达成的时间进行排名，达成的越早，排名越高]],
		items = {}
	},
	mysterious_store_rules = {
		sign = "mysterious_store_rules",
		desc = "1.活动期间，消耗指定物品可兑换对应奖励\n2.限兑类型分为每日限兑、活动限兑\n3.标明每日限兑的物品，将进行每日刷新，标明活动限兑的物品，在活动期间内不进行每日刷新",
		items = {}
	},
	seven_charge_rules = {
		sign = "seven_charge_rules",
		desc = [[
1.活动期间，每日充值满足指定金额即可签到领奖。
 2.如出现漏签，充值满足当天签到金额后，继续充值可以进行补签，每天至多补签1天。
3.当天多充值98元时（即当日累计充值68+98=166元），可补签前1天奖励；
4.当天签到奖励和补签奖励可以同时领取。
5.活动结束后，将不能再领取奖励，请及时领取哦！]],
		items = {}
	},
	welfare_shop_rules = {
		sign = "welfare_shop_rules",
		desc = [[
1.强者印记可通过限时活动或礼包获取
2.悬赏商城内的商品兑换没有数量与次数限制
3.强者印记永久有效，不会过期
4.强者印记-神装商城内的商品有解锁条件]],
		items = {}
	},
	carnival_report_rules = {
		sign = "carnival_report_rules",
		desc = "1.活动期间，<div fontcolor=289b14>9月1日至12月7日登录游戏的40级以上</div>的船长会生成【时光漂流】报告；\n2.在界面下方点击查看可浏览船长大人这半年多在冒险大陆上奋战的点滴事迹，<div fontcolor=289b14>完成分享可立获100钻石奖励</div>；\n3.分享链接可获得礼包码，最多可分享给<div fontcolor=289b14>6位</div>好友使用，在界面使用礼包码可获得【嘉年华蛋糕】1份，每人最多可获得5份，<div fontcolor=289b14>未生成报告的船长大人也可以使用好友的礼包码获得奖励</div>，快去向你的好友讨要分享链接吧！",
		items = {}
	},
	recharge_rebate_rules = {
		sign = "recharge_rebate_rules",
		desc = "新年投资计划限时来袭！\n1.活动期间，玩家充值任意金额会通过邮件额外获得金额对应<div fontcolor=289b14>40%</div>的钻石，普通充值和各个直购礼包的充值都会计入；\n2.最多可额外获得<div fontcolor=289b14>10000钻石</div>，当剩余钻石小于玩家充值金额按比例对应的钻石数量时，邮件获得的钻石数量为剩余钻石数量；当剩余钻石为0后，充值将不再获得额外钻石；",
		items = {}
	},
	upstar_rules = {
		sign = "upstar_rules",
		desc = "1.将对应英雄升级到指定星数可以免费领取一份奖励\n2.购买拓展礼包可领取额外奖励",
		items = {}
	}
}

function Config.HolidayClientData.data_constant_fun(slot0)
	slot1 = Config.HolidayClientData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayClientData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
