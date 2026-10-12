Config = Config or {}
Config.MonopolyMapsData = Config.MonopolyMapsData or {}
Config.MonopolyMapsData.data_const_length = 14
Config.MonopolyMapsData.data_const = {
	monopoly_dice_id = {
		val = 80246,
		desc = "骰子id"
	},
	monopoly_secret_id = {
		val = 80247,
		desc = "秘籍id"
	},
	monopoly_gold_id = {
		val = 80245,
		desc = "南瓜币iD"
	},
	monopoly_dice_rand = {
		desc = "骰子点数随机范围",
		val = {
			1,
			4
		}
	},
	monopoly_secret_rand = {
		desc = "秘籍可选择范围",
		val = {
			1,
			4
		}
	},
	open_lv_limit = {
		val = 18,
		desc = "角色等级达到18级开放和之国火祭"
	},
	open_day_limit = {
		val = 8,
		desc = "开服时间达到8天开放和之国火祭"
	},
	monopoly_event_trap_power = {
		desc = "陷阱事件战力区间",
		val = {
			500,
			800
		}
	},
	monopoly_event_boss_power = {
		desc = "boss事件战力区间",
		val = {
			1100,
			1300
		}
	},
	monopoly_gift = {
		desc = "奖励展示",
		val = {
			{
				50022,
				1
			},
			{
				29905,
				200
			},
			{
				28911,
				50
			},
			{
				14001,
				4
			},
			{
				10603,
				4
			},
			{
				35,
				20
			}
		}
	},
	monopoly_rule_1 = {
		val = 1,
		desc = [[
1、和之国火祭可以使用<div fontcolor=#fca000>鬼头机</div>或<div fontcolor=#fca000>和之国地图</div>进行探索，每次探索会获取<div fontcolor=#fca000>1点</div>探索值，达成条件可解锁下一张地图
2、移动到格子上时会触发对应事件，胜利或正确的选择可以获得<div fontcolor=#fca000>大量奖励</div>！
3、每张地图探索值独立，达到一定值会解锁该地图的守关BOSS，挑战BOSS可以获得丰厚的道具奖励！
4、火祭庆典中掉落的<div fontcolor=#fca000>年糕小豆汤</div>，可以在狂死郎杂货店中兑换你喜欢的道具，活动结束后兑换商城就会消失，<div fontcolor=#fca000>请及时兑换</div>
5、<div fontcolor=#fca000>探索值与伤害buff均为公会所有</div>，没有公会将无法正常获取探索值与buff加成，请尽快加入公会哦]]
	},
	monopoly_rule_2 = {
		val = 1,
		desc = [[
1、每个地图有独立的探索值，达到一定探索值即可解锁boss
2、每次移动可获取<div fontcolor=#fca000>探索值+1</div>，移动道具可从活动任务中获取
3、使用该地图指定的<div fontcolor=#fca000>主题英雄</div>进行BOSS挑战可以大幅增加伤害
4、每次挑战boss有<div fontcolor=#fca000>挑战奖励</div>，击杀boss会获得<div fontcolor=#fca000>击杀奖励</div>，奖励会通过邮件发放，更换公会后重复击杀不会获取到任何奖励
5、探索值与buff同公会捆绑，离开公会后，个人所有的探索值与buff都会清零
6、各章节公会排行互相独立，奖励在活动结束时进行结算，结算后会进入<div fontcolor=#fca000>公会宝库</div>
7、boss全部击杀后，怪物会进入追击模式，追击模式只能获得掉落奖励，但不能增加排行榜伤害值]]
	},
	monopoly_event_trap_rewardshow = {
		desc = "陷阱事件奖励预览（客户端用）",
		val = {
			80244,
			80245,
			80252,
			80253
		}
	},
	monopoly_event_boss_rewardshow = {
		desc = "Boss事件奖励预览（客户端用）",
		val = {
			80244,
			80245,
			80252,
			80253
		}
	}
}

function Config.MonopolyMapsData.data_const_fun(slot0)
	slot1 = Config.MonopolyMapsData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.MonopolyMapsData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.MonopolyMapsData.data_customs_length = 4
Config.MonopolyMapsData.data_customs = {
	{
		start_unixtime = 0,
		name = "破落镇",
		max_develop = 1600,
		id = 1,
		develop = 0,
		res_id = "build_1"
	},
	{
		start_unixtime = 1703520000,
		name = "九里",
		max_develop = 1600,
		id = 2,
		develop = 1600,
		res_id = "build_2"
	},
	{
		start_unixtime = 1703606400,
		name = "花之都",
		max_develop = 1600,
		id = 3,
		develop = 1600,
		res_id = "build_3"
	},
	{
		start_unixtime = 1703692800,
		name = "鬼岛",
		max_develop = 1600,
		id = 4,
		develop = 1600,
		res_id = "build_4"
	}
}

function Config.MonopolyMapsData.data_customs_fun(slot0)
	slot1 = Config.MonopolyMapsData.data_customs[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.MonopolyMapsData.data_customs[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.MonopolyMapsData.data_map_info_length = 12
Config.MonopolyMapsData.data_map_info = {
	{
		id = 1,
		max_grid = 50,
		res_id = 1,
		grid_pos_list = {
			23017,
			22020,
			20023,
			19026,
			20029,
			22032,
			20035,
			19038,
			17035,
			16038,
			14041,
			13044,
			14047,
			16050,
			17053,
			19056,
			17059,
			16062,
			17065,
			16068,
			17071,
			19074,
			20077,
			22074,
			23071,
			25068,
			26071,
			28074,
			29071,
			31068,
			29065,
			31062,
			29059,
			31056,
			32053,
			34050,
			35047,
			34044,
			32041,
			34038,
			32035,
			31032,
			29035,
			28032,
			26035,
			25038,
			23041,
			22044,
			23047,
			25050
		},
		decorate_list = {}
	},
	{
		id = 2,
		max_grid = 50,
		res_id = 1,
		grid_pos_list = {
			40050,
			38053,
			37056,
			35059,
			34062,
			32065,
			31062,
			29059,
			28062,
			26065,
			28068,
			26071,
			25074,
			23071,
			22068,
			20065,
			19068,
			17071,
			16068,
			14065,
			13062,
			11059,
			13056,
			14053,
			16050,
			17047,
			16044,
			14041,
			16038,
			17035,
			19032,
			20029,
			19026,
			20023,
			22020,
			23023,
			25026,
			26029,
			28032,
			29035,
			31032,
			32035,
			34038,
			32041,
			31044,
			29047,
			28050,
			26047,
			25044,
			23047
		},
		decorate_list = {}
	},
	{
		id = 3,
		max_grid = 50,
		res_id = 1,
		grid_pos_list = {
			35059,
			34056,
			35053,
			37050,
			35047,
			34044,
			32041,
			34038,
			32035,
			31032,
			29029,
			28026,
			26023,
			25026,
			23029,
			22032,
			23035,
			25038,
			23041,
			22044,
			20047,
			19044,
			17041,
			16038,
			14041,
			13044,
			11047,
			13050,
			14053,
			16056,
			14059,
			16062,
			17065,
			19068,
			20065,
			22068,
			23071,
			25074,
			26071,
			28068,
			29065,
			28062,
			26059,
			28056,
			29053,
			28050,
			26047,
			25050,
			23053,
			22056
		},
		decorate_list = {}
	},
	{
		id = 4,
		max_grid = 50,
		res_id = 2,
		grid_pos_list = {
			23083,
			25080,
			23077,
			25074,
			26071,
			28068,
			29065,
			31062,
			32059,
			31056,
			32053,
			34050,
			35047,
			37044,
			35041,
			34038,
			32041,
			31044,
			29047,
			28044,
			26041,
			28038,
			26035,
			25032,
			23029,
			22026,
			20029,
			19032,
			17035,
			19038,
			20041,
			19044,
			20047,
			22050,
			23053,
			25056,
			23059,
			22062,
			20065,
			19062,
			17059,
			16062,
			14065,
			13062,
			11059,
			13056,
			14053,
			13050,
			11047,
			10044
		},
		decorate_list = {}
	},
	{
		id = 5,
		max_grid = 50,
		res_id = 2,
		grid_pos_list = {
			23017,
			25020,
			26023,
			25026,
			23029,
			22032,
			20035,
			19038,
			17035,
			16038,
			14041,
			16044,
			17047,
			19050,
			20053,
			22050,
			23047,
			25044,
			26041,
			28038,
			29035,
			31032,
			32035,
			34038,
			35041,
			34044,
			32047,
			31050,
			32053,
			34056,
			35059,
			34062,
			32065,
			31068,
			29065,
			28062,
			26059,
			25062,
			23065,
			22068,
			20071,
			19068,
			17065,
			16062,
			14059,
			13056,
			11053,
			10050,
			8047,
			7050
		},
		decorate_list = {}
	},
	{
		id = 6,
		max_grid = 50,
		res_id = 2,
		grid_pos_list = {
			10056,
			11053,
			13050,
			14053,
			16056,
			17059,
			19056,
			20053,
			22050,
			20047,
			19044,
			17041,
			16038,
			14035,
			16032,
			17029,
			19026,
			20023,
			22020,
			23023,
			25026,
			23029,
			22032,
			23035,
			25038,
			26035,
			28038,
			29041,
			28044,
			29047,
			31050,
			32047,
			34050,
			35053,
			34056,
			32059,
			34062,
			32065,
			31068,
			29071,
			28074,
			26071,
			25068,
			23071,
			22068,
			20065,
			22062,
			23059,
			25056,
			26053
		},
		decorate_list = {}
	},
	{
		id = 7,
		max_grid = 50,
		res_id = 3,
		grid_pos_list = {
			23017,
			22020,
			20023,
			19026,
			20029,
			22032,
			20035,
			19038,
			17035,
			16038,
			14041,
			13044,
			14047,
			16050,
			17053,
			19056,
			17059,
			16062,
			17065,
			16068,
			17071,
			19074,
			20077,
			22074,
			23071,
			25068,
			26071,
			28074,
			29071,
			31068,
			29065,
			31062,
			29059,
			31056,
			32053,
			34050,
			35047,
			34044,
			32041,
			34038,
			32035,
			31032,
			29035,
			28032,
			26035,
			25038,
			23041,
			22044,
			23047,
			25050
		},
		decorate_list = {}
	},
	{
		id = 8,
		max_grid = 50,
		res_id = 3,
		grid_pos_list = {
			40050,
			38053,
			37056,
			35059,
			34062,
			32065,
			31062,
			29059,
			28062,
			26065,
			28068,
			26071,
			25074,
			23071,
			22068,
			20065,
			19068,
			17071,
			16068,
			14065,
			13062,
			11059,
			13056,
			14053,
			16050,
			17047,
			16044,
			14041,
			16038,
			17035,
			19032,
			20029,
			19026,
			20023,
			22020,
			23023,
			25026,
			26029,
			28032,
			29035,
			31032,
			32035,
			34038,
			32041,
			31044,
			29047,
			28050,
			26047,
			25044,
			23047
		},
		decorate_list = {}
	},
	{
		id = 9,
		max_grid = 50,
		res_id = 3,
		grid_pos_list = {
			35059,
			34056,
			35053,
			37050,
			35047,
			34044,
			32041,
			34038,
			32035,
			31032,
			29029,
			28026,
			26023,
			25026,
			23029,
			22032,
			23035,
			25038,
			23041,
			22044,
			20047,
			19044,
			17041,
			16038,
			14041,
			13044,
			11047,
			13050,
			14053,
			16056,
			14059,
			16062,
			17065,
			19068,
			20065,
			22068,
			23071,
			25074,
			26071,
			28068,
			29065,
			28062,
			26059,
			28056,
			29053,
			28050,
			26047,
			25050,
			23053,
			22056
		},
		decorate_list = {}
	},
	{
		id = 10,
		max_grid = 50,
		res_id = 4,
		grid_pos_list = {
			23083,
			25080,
			23077,
			25074,
			26071,
			28068,
			29065,
			31062,
			32059,
			31056,
			32053,
			34050,
			35047,
			37044,
			35041,
			34038,
			32041,
			31044,
			29047,
			28044,
			26041,
			28038,
			26035,
			25032,
			23029,
			22026,
			20029,
			19032,
			17035,
			19038,
			20041,
			19044,
			20047,
			22050,
			23053,
			25056,
			23059,
			22062,
			20065,
			19062,
			17059,
			16062,
			14065,
			13062,
			11059,
			13056,
			14053,
			13050,
			11047,
			10044
		},
		decorate_list = {}
	},
	{
		id = 11,
		max_grid = 50,
		res_id = 4,
		grid_pos_list = {
			23017,
			25020,
			26023,
			25026,
			23029,
			22032,
			20035,
			19038,
			17035,
			16038,
			14041,
			16044,
			17047,
			19050,
			20053,
			22050,
			23047,
			25044,
			26041,
			28038,
			29035,
			31032,
			32035,
			34038,
			35041,
			34044,
			32047,
			31050,
			32053,
			34056,
			35059,
			34062,
			32065,
			31068,
			29065,
			28062,
			26059,
			25062,
			23065,
			22068,
			20071,
			19068,
			17065,
			16062,
			14059,
			13056,
			11053,
			10050,
			8047,
			7050
		},
		decorate_list = {}
	},
	{
		id = 12,
		max_grid = 50,
		res_id = 4,
		grid_pos_list = {
			10056,
			11053,
			13050,
			14053,
			16056,
			17059,
			19056,
			20053,
			22050,
			20047,
			19044,
			17041,
			16038,
			14035,
			16032,
			17029,
			19026,
			20023,
			22020,
			23023,
			25026,
			23029,
			22032,
			23035,
			25038,
			26035,
			28038,
			29041,
			28044,
			29047,
			31050,
			32047,
			34050,
			35053,
			34056,
			32059,
			34062,
			32065,
			31068,
			29071,
			28074,
			26071,
			25068,
			23071,
			22068,
			20065,
			22062,
			23059,
			25056,
			26053
		},
		decorate_list = {}
	}
}

function Config.MonopolyMapsData.data_map_info_fun(slot0)
	slot1 = Config.MonopolyMapsData.data_map_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.MonopolyMapsData.data_map_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.MonopolyMapsData.data_event_info_length = 12
Config.MonopolyMapsData.data_event_info = {
	{
		{
			show_ani = 0,
			type = 1,
			id = 1,
			grid_res_id = "grid_1",
			res_id = {},
			offset = {
				0,
				0
			}
		},
		[2] = {
			show_ani = 0,
			type = 2,
			id = 1,
			grid_res_id = "grid_3",
			res_id = {
				2,
				"E27110"
			},
			offset = {
				0,
				-10
			}
		},
		[3] = {
			show_ani = 0,
			type = 3,
			id = 1,
			grid_res_id = "grid_2",
			res_id = {
				2,
				"E27108"
			},
			offset = {
				6,
				-10
			}
		},
		[4] = {
			show_ani = 0,
			type = 4,
			id = 1,
			grid_res_id = "grid_3",
			res_id = {
				1,
				"evt_10"
			},
			offset = {
				0,
				-10
			}
		},
		[5] = {
			show_ani = 0,
			type = 5,
			id = 1,
			grid_res_id = "grid_2",
			res_id = {
				1,
				"evt_11"
			},
			offset = {
				0,
				0
			}
		},
		[6] = {
			show_ani = 1,
			type = 6,
			id = 1,
			grid_res_id = "grid_2",
			res_id = {
				1,
				"evt_7"
			},
			offset = {
				0,
				-10
			}
		},
		[7] = {
			show_ani = 0,
			type = 7,
			id = 1,
			grid_res_id = "grid_2",
			res_id = {
				2,
				"E27106"
			},
			offset = {
				-5,
				-10
			}
		},
		[8] = {
			show_ani = 0,
			type = 8,
			id = 1,
			grid_res_id = "grid_3",
			res_id = {
				1,
				"evt_3"
			},
			offset = {
				0,
				-10
			}
		},
		[9] = {
			show_ani = 1,
			type = 9,
			id = 1,
			grid_res_id = "grid_3",
			res_id = {
				1,
				"evt_5"
			},
			offset = {
				0,
				-10
			}
		},
		[10] = {
			show_ani = 0,
			type = 10,
			id = 1,
			grid_res_id = "grid_3",
			res_id = {
				2,
				"E27109"
			},
			offset = {
				-8,
				0
			}
		},
		[11] = {
			show_ani = 0,
			type = 11,
			id = 1,
			grid_res_id = "grid_3",
			res_id = {
				2,
				"E27107"
			},
			offset = {
				0,
				-10
			}
		},
		[13] = {
			show_ani = 0,
			type = 13,
			id = 1,
			grid_res_id = "grid_3",
			res_id = {
				1,
				"evt_1"
			},
			offset = {
				27,
				0
			}
		},
		[12] = {
			show_ani = 0,
			type = 12,
			id = 1,
			grid_res_id = "grid_1",
			res_id = {
				1,
				"evt_13"
			},
			offset = {
				0,
				-10
			}
		},
		[14] = {
			show_ani = 0,
			type = 14,
			id = 1,
			grid_res_id = "grid_1",
			res_id = {
				2,
				"E27111"
			},
			offset = {
				0,
				3
			}
		}
	},
	{
		{
			show_ani = 0,
			type = 1,
			id = 2,
			grid_res_id = "grid_1",
			res_id = {},
			offset = {
				0,
				0
			}
		},
		[2] = {
			show_ani = 0,
			type = 2,
			id = 2,
			grid_res_id = "grid_3",
			res_id = {
				2,
				"E27110"
			},
			offset = {
				0,
				-10
			}
		},
		[3] = {
			show_ani = 0,
			type = 3,
			id = 2,
			grid_res_id = "grid_2",
			res_id = {
				2,
				"E27108"
			},
			offset = {
				6,
				-10
			}
		},
		[4] = {
			show_ani = 0,
			type = 4,
			id = 2,
			grid_res_id = "grid_3",
			res_id = {
				1,
				"evt_10"
			},
			offset = {
				0,
				-10
			}
		},
		[5] = {
			show_ani = 0,
			type = 5,
			id = 2,
			grid_res_id = "grid_2",
			res_id = {
				1,
				"evt_11"
			},
			offset = {
				0,
				0
			}
		},
		[6] = {
			show_ani = 1,
			type = 6,
			id = 2,
			grid_res_id = "grid_2",
			res_id = {
				1,
				"evt_7"
			},
			offset = {
				0,
				-10
			}
		},
		[7] = {
			show_ani = 0,
			type = 7,
			id = 2,
			grid_res_id = "grid_2",
			res_id = {
				2,
				"E27106"
			},
			offset = {
				-5,
				-10
			}
		},
		[8] = {
			show_ani = 0,
			type = 8,
			id = 2,
			grid_res_id = "grid_3",
			res_id = {
				1,
				"evt_3"
			},
			offset = {
				0,
				-10
			}
		},
		[9] = {
			show_ani = 1,
			type = 9,
			id = 2,
			grid_res_id = "grid_3",
			res_id = {
				1,
				"evt_5"
			},
			offset = {
				0,
				-10
			}
		},
		[10] = {
			show_ani = 0,
			type = 10,
			id = 2,
			grid_res_id = "grid_3",
			res_id = {
				2,
				"E27109"
			},
			offset = {
				-8,
				0
			}
		},
		[11] = {
			show_ani = 0,
			type = 11,
			id = 2,
			grid_res_id = "grid_3",
			res_id = {
				2,
				"E27107"
			},
			offset = {
				0,
				-10
			}
		},
		[13] = {
			show_ani = 0,
			type = 13,
			id = 2,
			grid_res_id = "grid_3",
			res_id = {
				1,
				"evt_1"
			},
			offset = {
				27,
				0
			}
		},
		[12] = {
			show_ani = 0,
			type = 12,
			id = 2,
			grid_res_id = "grid_1",
			res_id = {
				1,
				"evt_13"
			},
			offset = {
				0,
				-10
			}
		},
		[14] = {
			show_ani = 0,
			type = 14,
			id = 2,
			grid_res_id = "grid_1",
			res_id = {
				2,
				"E27111"
			},
			offset = {
				0,
				3
			}
		}
	},
	{
		{
			show_ani = 0,
			type = 1,
			id = 3,
			grid_res_id = "grid_1",
			res_id = {},
			offset = {
				0,
				0
			}
		},
		[2] = {
			show_ani = 0,
			type = 2,
			id = 3,
			grid_res_id = "grid_3",
			res_id = {
				2,
				"E27110"
			},
			offset = {
				0,
				-10
			}
		},
		[3] = {
			show_ani = 0,
			type = 3,
			id = 3,
			grid_res_id = "grid_2",
			res_id = {
				2,
				"E27108"
			},
			offset = {
				6,
				-10
			}
		},
		[4] = {
			show_ani = 0,
			type = 4,
			id = 3,
			grid_res_id = "grid_3",
			res_id = {
				1,
				"evt_10"
			},
			offset = {
				0,
				-10
			}
		},
		[5] = {
			show_ani = 0,
			type = 5,
			id = 3,
			grid_res_id = "grid_2",
			res_id = {
				1,
				"evt_11"
			},
			offset = {
				0,
				0
			}
		},
		[6] = {
			show_ani = 1,
			type = 6,
			id = 3,
			grid_res_id = "grid_2",
			res_id = {
				1,
				"evt_7"
			},
			offset = {
				0,
				-10
			}
		},
		[7] = {
			show_ani = 0,
			type = 7,
			id = 3,
			grid_res_id = "grid_2",
			res_id = {
				2,
				"E27106"
			},
			offset = {
				-5,
				-10
			}
		},
		[8] = {
			show_ani = 0,
			type = 8,
			id = 3,
			grid_res_id = "grid_3",
			res_id = {
				1,
				"evt_3"
			},
			offset = {
				0,
				-10
			}
		},
		[9] = {
			show_ani = 1,
			type = 9,
			id = 3,
			grid_res_id = "grid_3",
			res_id = {
				1,
				"evt_5"
			},
			offset = {
				0,
				-10
			}
		},
		[10] = {
			show_ani = 0,
			type = 10,
			id = 3,
			grid_res_id = "grid_3",
			res_id = {
				2,
				"E27109"
			},
			offset = {
				-8,
				0
			}
		},
		[11] = {
			show_ani = 0,
			type = 11,
			id = 3,
			grid_res_id = "grid_3",
			res_id = {
				2,
				"E27107"
			},
			offset = {
				0,
				-10
			}
		},
		[13] = {
			show_ani = 0,
			type = 13,
			id = 3,
			grid_res_id = "grid_3",
			res_id = {
				1,
				"evt_1"
			},
			offset = {
				27,
				0
			}
		},
		[12] = {
			show_ani = 0,
			type = 12,
			id = 3,
			grid_res_id = "grid_1",
			res_id = {
				1,
				"evt_13"
			},
			offset = {
				0,
				-10
			}
		},
		[14] = {
			show_ani = 0,
			type = 14,
			id = 3,
			grid_res_id = "grid_1",
			res_id = {
				2,
				"E27111"
			},
			offset = {
				0,
				3
			}
		}
	},
	{
		{
			show_ani = 0,
			type = 1,
			id = 4,
			grid_res_id = "grid_4",
			res_id = {},
			offset = {
				0,
				0
			}
		},
		[2] = {
			show_ani = 0,
			type = 2,
			id = 4,
			grid_res_id = "grid_6",
			res_id = {
				2,
				"E27110"
			},
			offset = {
				0,
				-10
			}
		},
		[3] = {
			show_ani = 0,
			type = 3,
			id = 4,
			grid_res_id = "grid_5",
			res_id = {
				2,
				"E27108"
			},
			offset = {
				6,
				-10
			}
		},
		[4] = {
			show_ani = 0,
			type = 4,
			id = 4,
			grid_res_id = "grid_6",
			res_id = {
				1,
				"evt_10"
			},
			offset = {
				0,
				-10
			}
		},
		[5] = {
			show_ani = 0,
			type = 5,
			id = 4,
			grid_res_id = "grid_5",
			res_id = {
				1,
				"evt_11"
			},
			offset = {
				0,
				0
			}
		},
		[6] = {
			show_ani = 1,
			type = 6,
			id = 4,
			grid_res_id = "grid_5",
			res_id = {
				1,
				"evt_7"
			},
			offset = {
				0,
				-10
			}
		},
		[7] = {
			show_ani = 0,
			type = 7,
			id = 4,
			grid_res_id = "grid_5",
			res_id = {
				2,
				"E27106"
			},
			offset = {
				-5,
				-10
			}
		},
		[8] = {
			show_ani = 0,
			type = 8,
			id = 4,
			grid_res_id = "grid_6",
			res_id = {
				1,
				"evt_3"
			},
			offset = {
				0,
				-10
			}
		},
		[9] = {
			show_ani = 1,
			type = 9,
			id = 4,
			grid_res_id = "grid_6",
			res_id = {
				1,
				"evt_5"
			},
			offset = {
				0,
				-10
			}
		},
		[10] = {
			show_ani = 0,
			type = 10,
			id = 4,
			grid_res_id = "grid_6",
			res_id = {
				2,
				"E27109"
			},
			offset = {
				-8,
				0
			}
		},
		[11] = {
			show_ani = 0,
			type = 11,
			id = 4,
			grid_res_id = "grid_6",
			res_id = {
				2,
				"E27107"
			},
			offset = {
				0,
				-10
			}
		},
		[13] = {
			show_ani = 0,
			type = 13,
			id = 4,
			grid_res_id = "grid_6",
			res_id = {
				1,
				"evt_1"
			},
			offset = {
				27,
				0
			}
		},
		[12] = {
			show_ani = 0,
			type = 12,
			id = 4,
			grid_res_id = "grid_4",
			res_id = {
				1,
				"evt_13"
			},
			offset = {
				0,
				-10
			}
		},
		[14] = {
			show_ani = 0,
			type = 14,
			id = 4,
			grid_res_id = "grid_4",
			res_id = {
				2,
				"E27111"
			},
			offset = {
				0,
				3
			}
		}
	},
	{
		{
			show_ani = 0,
			type = 1,
			id = 5,
			grid_res_id = "grid_4",
			res_id = {},
			offset = {
				0,
				0
			}
		},
		[2] = {
			show_ani = 0,
			type = 2,
			id = 5,
			grid_res_id = "grid_6",
			res_id = {
				2,
				"E27110"
			},
			offset = {
				0,
				-10
			}
		},
		[3] = {
			show_ani = 0,
			type = 3,
			id = 5,
			grid_res_id = "grid_5",
			res_id = {
				2,
				"E27108"
			},
			offset = {
				6,
				-10
			}
		},
		[4] = {
			show_ani = 0,
			type = 4,
			id = 5,
			grid_res_id = "grid_6",
			res_id = {
				1,
				"evt_10"
			},
			offset = {
				0,
				-10
			}
		},
		[5] = {
			show_ani = 0,
			type = 5,
			id = 5,
			grid_res_id = "grid_5",
			res_id = {
				1,
				"evt_11"
			},
			offset = {
				0,
				0
			}
		},
		[6] = {
			show_ani = 1,
			type = 6,
			id = 5,
			grid_res_id = "grid_5",
			res_id = {
				1,
				"evt_7"
			},
			offset = {
				0,
				-10
			}
		},
		[7] = {
			show_ani = 0,
			type = 7,
			id = 5,
			grid_res_id = "grid_5",
			res_id = {
				2,
				"E27106"
			},
			offset = {
				-5,
				-10
			}
		},
		[8] = {
			show_ani = 0,
			type = 8,
			id = 5,
			grid_res_id = "grid_6",
			res_id = {
				1,
				"evt_3"
			},
			offset = {
				0,
				-10
			}
		},
		[9] = {
			show_ani = 1,
			type = 9,
			id = 5,
			grid_res_id = "grid_6",
			res_id = {
				1,
				"evt_5"
			},
			offset = {
				0,
				-10
			}
		},
		[10] = {
			show_ani = 0,
			type = 10,
			id = 5,
			grid_res_id = "grid_6",
			res_id = {
				2,
				"E27109"
			},
			offset = {
				-8,
				0
			}
		},
		[11] = {
			show_ani = 0,
			type = 11,
			id = 5,
			grid_res_id = "grid_6",
			res_id = {
				2,
				"E27107"
			},
			offset = {
				0,
				-10
			}
		},
		[13] = {
			show_ani = 0,
			type = 13,
			id = 5,
			grid_res_id = "grid_6",
			res_id = {
				1,
				"evt_1"
			},
			offset = {
				27,
				0
			}
		},
		[12] = {
			show_ani = 0,
			type = 12,
			id = 5,
			grid_res_id = "grid_4",
			res_id = {
				1,
				"evt_13"
			},
			offset = {
				0,
				-10
			}
		},
		[14] = {
			show_ani = 0,
			type = 14,
			id = 5,
			grid_res_id = "grid_4",
			res_id = {
				2,
				"E27111"
			},
			offset = {
				0,
				3
			}
		}
	},
	{
		{
			show_ani = 0,
			type = 1,
			id = 6,
			grid_res_id = "grid_4",
			res_id = {},
			offset = {
				0,
				0
			}
		},
		[2] = {
			show_ani = 0,
			type = 2,
			id = 6,
			grid_res_id = "grid_6",
			res_id = {
				2,
				"E27110"
			},
			offset = {
				0,
				-10
			}
		},
		[3] = {
			show_ani = 0,
			type = 3,
			id = 6,
			grid_res_id = "grid_5",
			res_id = {
				2,
				"E27108"
			},
			offset = {
				6,
				-10
			}
		},
		[4] = {
			show_ani = 0,
			type = 4,
			id = 6,
			grid_res_id = "grid_6",
			res_id = {
				1,
				"evt_10"
			},
			offset = {
				0,
				-10
			}
		},
		[5] = {
			show_ani = 0,
			type = 5,
			id = 6,
			grid_res_id = "grid_5",
			res_id = {
				1,
				"evt_11"
			},
			offset = {
				0,
				0
			}
		},
		[6] = {
			show_ani = 1,
			type = 6,
			id = 6,
			grid_res_id = "grid_5",
			res_id = {
				1,
				"evt_7"
			},
			offset = {
				0,
				-10
			}
		},
		[7] = {
			show_ani = 0,
			type = 7,
			id = 6,
			grid_res_id = "grid_5",
			res_id = {
				2,
				"E27106"
			},
			offset = {
				-5,
				-10
			}
		},
		[8] = {
			show_ani = 0,
			type = 8,
			id = 6,
			grid_res_id = "grid_6",
			res_id = {
				1,
				"evt_3"
			},
			offset = {
				0,
				-10
			}
		},
		[9] = {
			show_ani = 1,
			type = 9,
			id = 6,
			grid_res_id = "grid_6",
			res_id = {
				1,
				"evt_5"
			},
			offset = {
				0,
				-10
			}
		},
		[10] = {
			show_ani = 0,
			type = 10,
			id = 6,
			grid_res_id = "grid_6",
			res_id = {
				2,
				"E27109"
			},
			offset = {
				-8,
				0
			}
		},
		[11] = {
			show_ani = 0,
			type = 11,
			id = 6,
			grid_res_id = "grid_6",
			res_id = {
				2,
				"E27107"
			},
			offset = {
				0,
				-10
			}
		},
		[13] = {
			show_ani = 0,
			type = 13,
			id = 6,
			grid_res_id = "grid_6",
			res_id = {
				1,
				"evt_1"
			},
			offset = {
				27,
				0
			}
		},
		[12] = {
			show_ani = 0,
			type = 12,
			id = 6,
			grid_res_id = "grid_4",
			res_id = {
				1,
				"evt_13"
			},
			offset = {
				0,
				-10
			}
		},
		[14] = {
			show_ani = 0,
			type = 14,
			id = 6,
			grid_res_id = "grid_4",
			res_id = {
				2,
				"E27111"
			},
			offset = {
				0,
				3
			}
		}
	},
	{
		{
			show_ani = 0,
			type = 1,
			id = 7,
			grid_res_id = "grid_7",
			res_id = {},
			offset = {
				0,
				0
			}
		},
		[2] = {
			show_ani = 0,
			type = 2,
			id = 7,
			grid_res_id = "grid_9",
			res_id = {
				2,
				"E27110"
			},
			offset = {
				0,
				-10
			}
		},
		[3] = {
			show_ani = 0,
			type = 3,
			id = 7,
			grid_res_id = "grid_7",
			res_id = {
				2,
				"E27108"
			},
			offset = {
				6,
				-10
			}
		},
		[4] = {
			show_ani = 0,
			type = 4,
			id = 7,
			grid_res_id = "grid_8",
			res_id = {
				1,
				"evt_10"
			},
			offset = {
				0,
				-10
			}
		},
		[5] = {
			show_ani = 0,
			type = 5,
			id = 7,
			grid_res_id = "grid_8",
			res_id = {
				1,
				"evt_11"
			},
			offset = {
				0,
				0
			}
		},
		[6] = {
			show_ani = 1,
			type = 6,
			id = 7,
			grid_res_id = "grid_8",
			res_id = {
				1,
				"evt_7"
			},
			offset = {
				0,
				-10
			}
		},
		[7] = {
			show_ani = 0,
			type = 7,
			id = 7,
			grid_res_id = "grid_8",
			res_id = {
				2,
				"E27106"
			},
			offset = {
				-5,
				-10
			}
		},
		[8] = {
			show_ani = 0,
			type = 8,
			id = 7,
			grid_res_id = "grid_9",
			res_id = {
				1,
				"evt_3"
			},
			offset = {
				0,
				-10
			}
		},
		[9] = {
			show_ani = 1,
			type = 9,
			id = 7,
			grid_res_id = "grid_9",
			res_id = {
				1,
				"evt_5"
			},
			offset = {
				0,
				-10
			}
		},
		[10] = {
			show_ani = 0,
			type = 10,
			id = 7,
			grid_res_id = "grid_9",
			res_id = {
				2,
				"E27109"
			},
			offset = {
				-8,
				0
			}
		},
		[11] = {
			show_ani = 0,
			type = 11,
			id = 7,
			grid_res_id = "grid_9",
			res_id = {
				2,
				"E27107"
			},
			offset = {
				0,
				-10
			}
		},
		[13] = {
			show_ani = 0,
			type = 13,
			id = 7,
			grid_res_id = "grid_9",
			res_id = {
				1,
				"evt_1"
			},
			offset = {
				27,
				0
			}
		},
		[12] = {
			show_ani = 0,
			type = 12,
			id = 7,
			grid_res_id = "grid_7",
			res_id = {
				1,
				"evt_13"
			},
			offset = {
				0,
				-10
			}
		},
		[14] = {
			show_ani = 0,
			type = 14,
			id = 7,
			grid_res_id = "grid_7",
			res_id = {
				2,
				"E27111"
			},
			offset = {
				0,
				3
			}
		}
	},
	{
		{
			show_ani = 0,
			type = 1,
			id = 8,
			grid_res_id = "grid_7",
			res_id = {},
			offset = {
				0,
				0
			}
		},
		[2] = {
			show_ani = 0,
			type = 2,
			id = 8,
			grid_res_id = "grid_9",
			res_id = {
				2,
				"E27110"
			},
			offset = {
				0,
				-10
			}
		},
		[3] = {
			show_ani = 0,
			type = 3,
			id = 8,
			grid_res_id = "grid_7",
			res_id = {
				2,
				"E27108"
			},
			offset = {
				6,
				-10
			}
		},
		[4] = {
			show_ani = 0,
			type = 4,
			id = 8,
			grid_res_id = "grid_8",
			res_id = {
				1,
				"evt_10"
			},
			offset = {
				0,
				-10
			}
		},
		[5] = {
			show_ani = 0,
			type = 5,
			id = 8,
			grid_res_id = "grid_8",
			res_id = {
				1,
				"evt_11"
			},
			offset = {
				0,
				0
			}
		},
		[6] = {
			show_ani = 1,
			type = 6,
			id = 8,
			grid_res_id = "grid_8",
			res_id = {
				1,
				"evt_7"
			},
			offset = {
				0,
				-10
			}
		},
		[7] = {
			show_ani = 0,
			type = 7,
			id = 8,
			grid_res_id = "grid_8",
			res_id = {
				2,
				"E27106"
			},
			offset = {
				-5,
				-10
			}
		},
		[8] = {
			show_ani = 0,
			type = 8,
			id = 8,
			grid_res_id = "grid_9",
			res_id = {
				1,
				"evt_3"
			},
			offset = {
				0,
				-10
			}
		},
		[9] = {
			show_ani = 1,
			type = 9,
			id = 8,
			grid_res_id = "grid_9",
			res_id = {
				1,
				"evt_5"
			},
			offset = {
				0,
				-10
			}
		},
		[10] = {
			show_ani = 0,
			type = 10,
			id = 8,
			grid_res_id = "grid_9",
			res_id = {
				2,
				"E27109"
			},
			offset = {
				-8,
				0
			}
		},
		[11] = {
			show_ani = 0,
			type = 11,
			id = 8,
			grid_res_id = "grid_9",
			res_id = {
				2,
				"E27107"
			},
			offset = {
				0,
				-10
			}
		},
		[13] = {
			show_ani = 0,
			type = 13,
			id = 8,
			grid_res_id = "grid_9",
			res_id = {
				1,
				"evt_1"
			},
			offset = {
				27,
				0
			}
		},
		[12] = {
			show_ani = 0,
			type = 12,
			id = 8,
			grid_res_id = "grid_7",
			res_id = {
				1,
				"evt_13"
			},
			offset = {
				0,
				-10
			}
		},
		[14] = {
			show_ani = 0,
			type = 14,
			id = 8,
			grid_res_id = "grid_7",
			res_id = {
				2,
				"E27111"
			},
			offset = {
				0,
				3
			}
		}
	},
	{
		{
			show_ani = 0,
			type = 1,
			id = 9,
			grid_res_id = "grid_7",
			res_id = {},
			offset = {
				0,
				0
			}
		},
		[2] = {
			show_ani = 0,
			type = 2,
			id = 9,
			grid_res_id = "grid_9",
			res_id = {
				2,
				"E27110"
			},
			offset = {
				0,
				-10
			}
		},
		[3] = {
			show_ani = 0,
			type = 3,
			id = 9,
			grid_res_id = "grid_7",
			res_id = {
				2,
				"E27108"
			},
			offset = {
				6,
				-10
			}
		},
		[4] = {
			show_ani = 0,
			type = 4,
			id = 9,
			grid_res_id = "grid_8",
			res_id = {
				1,
				"evt_10"
			},
			offset = {
				0,
				-10
			}
		},
		[5] = {
			show_ani = 0,
			type = 5,
			id = 9,
			grid_res_id = "grid_8",
			res_id = {
				1,
				"evt_11"
			},
			offset = {
				0,
				0
			}
		},
		[6] = {
			show_ani = 1,
			type = 6,
			id = 9,
			grid_res_id = "grid_8",
			res_id = {
				1,
				"evt_7"
			},
			offset = {
				0,
				-10
			}
		},
		[7] = {
			show_ani = 0,
			type = 7,
			id = 9,
			grid_res_id = "grid_8",
			res_id = {
				2,
				"E27106"
			},
			offset = {
				-5,
				-10
			}
		},
		[8] = {
			show_ani = 0,
			type = 8,
			id = 9,
			grid_res_id = "grid_9",
			res_id = {
				1,
				"evt_3"
			},
			offset = {
				0,
				-10
			}
		},
		[9] = {
			show_ani = 1,
			type = 9,
			id = 9,
			grid_res_id = "grid_9",
			res_id = {
				1,
				"evt_5"
			},
			offset = {
				0,
				-10
			}
		},
		[10] = {
			show_ani = 0,
			type = 10,
			id = 9,
			grid_res_id = "grid_9",
			res_id = {
				2,
				"E27109"
			},
			offset = {
				-8,
				0
			}
		},
		[11] = {
			show_ani = 0,
			type = 11,
			id = 9,
			grid_res_id = "grid_9",
			res_id = {
				2,
				"E27107"
			},
			offset = {
				0,
				-10
			}
		},
		[13] = {
			show_ani = 0,
			type = 13,
			id = 9,
			grid_res_id = "grid_9",
			res_id = {
				1,
				"evt_1"
			},
			offset = {
				27,
				0
			}
		},
		[12] = {
			show_ani = 0,
			type = 12,
			id = 9,
			grid_res_id = "grid_7",
			res_id = {
				1,
				"evt_13"
			},
			offset = {
				0,
				-10
			}
		},
		[14] = {
			show_ani = 0,
			type = 14,
			id = 9,
			grid_res_id = "grid_7",
			res_id = {
				2,
				"E27111"
			},
			offset = {
				0,
				3
			}
		}
	},
	{
		{
			show_ani = 0,
			type = 1,
			id = 10,
			grid_res_id = "grid_10",
			res_id = {},
			offset = {
				0,
				0
			}
		},
		[2] = {
			show_ani = 0,
			type = 2,
			id = 10,
			grid_res_id = "grid_12",
			res_id = {
				2,
				"E27110"
			},
			offset = {
				0,
				-10
			}
		},
		[3] = {
			show_ani = 0,
			type = 3,
			id = 10,
			grid_res_id = "grid_10",
			res_id = {
				2,
				"E27108"
			},
			offset = {
				6,
				-10
			}
		},
		[4] = {
			show_ani = 0,
			type = 4,
			id = 10,
			grid_res_id = "grid_11",
			res_id = {
				1,
				"evt_10"
			},
			offset = {
				0,
				-10
			}
		},
		[5] = {
			show_ani = 0,
			type = 5,
			id = 10,
			grid_res_id = "grid_11",
			res_id = {
				1,
				"evt_11"
			},
			offset = {
				0,
				0
			}
		},
		[6] = {
			show_ani = 1,
			type = 6,
			id = 10,
			grid_res_id = "grid_11",
			res_id = {
				1,
				"evt_7"
			},
			offset = {
				0,
				-10
			}
		},
		[7] = {
			show_ani = 0,
			type = 7,
			id = 10,
			grid_res_id = "grid_11",
			res_id = {
				2,
				"E27106"
			},
			offset = {
				-5,
				-10
			}
		},
		[8] = {
			show_ani = 0,
			type = 8,
			id = 10,
			grid_res_id = "grid_12",
			res_id = {
				1,
				"evt_3"
			},
			offset = {
				0,
				-10
			}
		},
		[9] = {
			show_ani = 1,
			type = 9,
			id = 10,
			grid_res_id = "grid_12",
			res_id = {
				1,
				"evt_5"
			},
			offset = {
				0,
				-10
			}
		},
		[10] = {
			show_ani = 0,
			type = 10,
			id = 10,
			grid_res_id = "grid_12",
			res_id = {
				2,
				"E27109"
			},
			offset = {
				-8,
				0
			}
		},
		[11] = {
			show_ani = 0,
			type = 11,
			id = 10,
			grid_res_id = "grid_12",
			res_id = {
				2,
				"E27107"
			},
			offset = {
				0,
				-10
			}
		},
		[13] = {
			show_ani = 0,
			type = 13,
			id = 10,
			grid_res_id = "grid_12",
			res_id = {
				1,
				"evt_1"
			},
			offset = {
				27,
				0
			}
		},
		[12] = {
			show_ani = 0,
			type = 12,
			id = 10,
			grid_res_id = "grid_10",
			res_id = {
				1,
				"evt_13"
			},
			offset = {
				0,
				-10
			}
		},
		[14] = {
			show_ani = 0,
			type = 14,
			id = 10,
			grid_res_id = "grid_10",
			res_id = {
				2,
				"E27111"
			},
			offset = {
				0,
				3
			}
		}
	},
	{
		{
			show_ani = 0,
			type = 1,
			id = 11,
			grid_res_id = "grid_10",
			res_id = {},
			offset = {
				0,
				0
			}
		},
		[2] = {
			show_ani = 0,
			type = 2,
			id = 11,
			grid_res_id = "grid_12",
			res_id = {
				2,
				"E27110"
			},
			offset = {
				0,
				-10
			}
		},
		[3] = {
			show_ani = 0,
			type = 3,
			id = 11,
			grid_res_id = "grid_10",
			res_id = {
				2,
				"E27108"
			},
			offset = {
				6,
				-10
			}
		},
		[4] = {
			show_ani = 0,
			type = 4,
			id = 11,
			grid_res_id = "grid_11",
			res_id = {
				1,
				"evt_10"
			},
			offset = {
				0,
				-10
			}
		},
		[5] = {
			show_ani = 0,
			type = 5,
			id = 11,
			grid_res_id = "grid_11",
			res_id = {
				1,
				"evt_11"
			},
			offset = {
				0,
				0
			}
		},
		[6] = {
			show_ani = 1,
			type = 6,
			id = 11,
			grid_res_id = "grid_11",
			res_id = {
				1,
				"evt_7"
			},
			offset = {
				0,
				-10
			}
		},
		[7] = {
			show_ani = 0,
			type = 7,
			id = 11,
			grid_res_id = "grid_11",
			res_id = {
				2,
				"E27106"
			},
			offset = {
				-5,
				-10
			}
		},
		[8] = {
			show_ani = 0,
			type = 8,
			id = 11,
			grid_res_id = "grid_12",
			res_id = {
				1,
				"evt_3"
			},
			offset = {
				0,
				-10
			}
		},
		[9] = {
			show_ani = 1,
			type = 9,
			id = 11,
			grid_res_id = "grid_12",
			res_id = {
				1,
				"evt_5"
			},
			offset = {
				0,
				-10
			}
		},
		[10] = {
			show_ani = 0,
			type = 10,
			id = 11,
			grid_res_id = "grid_12",
			res_id = {
				2,
				"E27109"
			},
			offset = {
				-8,
				0
			}
		},
		[11] = {
			show_ani = 0,
			type = 11,
			id = 11,
			grid_res_id = "grid_12",
			res_id = {
				2,
				"E27107"
			},
			offset = {
				0,
				-10
			}
		},
		[13] = {
			show_ani = 0,
			type = 13,
			id = 11,
			grid_res_id = "grid_12",
			res_id = {
				1,
				"evt_1"
			},
			offset = {
				27,
				0
			}
		},
		[12] = {
			show_ani = 0,
			type = 12,
			id = 11,
			grid_res_id = "grid_10",
			res_id = {
				1,
				"evt_13"
			},
			offset = {
				0,
				-10
			}
		},
		[14] = {
			show_ani = 0,
			type = 14,
			id = 11,
			grid_res_id = "grid_10",
			res_id = {
				2,
				"E27111"
			},
			offset = {
				0,
				3
			}
		}
	},
	{
		{
			show_ani = 0,
			type = 1,
			id = 12,
			grid_res_id = "grid_10",
			res_id = {},
			offset = {
				0,
				0
			}
		},
		[2] = {
			show_ani = 0,
			type = 2,
			id = 12,
			grid_res_id = "grid_12",
			res_id = {
				2,
				"E27110"
			},
			offset = {
				0,
				-10
			}
		},
		[3] = {
			show_ani = 0,
			type = 3,
			id = 12,
			grid_res_id = "grid_10",
			res_id = {
				2,
				"E27108"
			},
			offset = {
				6,
				-10
			}
		},
		[4] = {
			show_ani = 0,
			type = 4,
			id = 12,
			grid_res_id = "grid_11",
			res_id = {
				1,
				"evt_10"
			},
			offset = {
				0,
				-10
			}
		},
		[5] = {
			show_ani = 0,
			type = 5,
			id = 12,
			grid_res_id = "grid_11",
			res_id = {
				1,
				"evt_11"
			},
			offset = {
				0,
				0
			}
		},
		[6] = {
			show_ani = 1,
			type = 6,
			id = 12,
			grid_res_id = "grid_11",
			res_id = {
				1,
				"evt_7"
			},
			offset = {
				0,
				-10
			}
		},
		[7] = {
			show_ani = 0,
			type = 7,
			id = 12,
			grid_res_id = "grid_11",
			res_id = {
				2,
				"E27106"
			},
			offset = {
				-5,
				-10
			}
		},
		[8] = {
			show_ani = 0,
			type = 8,
			id = 12,
			grid_res_id = "grid_12",
			res_id = {
				1,
				"evt_3"
			},
			offset = {
				0,
				-10
			}
		},
		[9] = {
			show_ani = 1,
			type = 9,
			id = 12,
			grid_res_id = "grid_12",
			res_id = {
				1,
				"evt_5"
			},
			offset = {
				0,
				-10
			}
		},
		[10] = {
			show_ani = 0,
			type = 10,
			id = 12,
			grid_res_id = "grid_12",
			res_id = {
				2,
				"E27109"
			},
			offset = {
				-8,
				0
			}
		},
		[11] = {
			show_ani = 0,
			type = 11,
			id = 12,
			grid_res_id = "grid_12",
			res_id = {
				2,
				"E27107"
			},
			offset = {
				0,
				-10
			}
		},
		[13] = {
			show_ani = 0,
			type = 13,
			id = 12,
			grid_res_id = "grid_12",
			res_id = {
				1,
				"evt_1"
			},
			offset = {
				27,
				0
			}
		},
		[12] = {
			show_ani = 0,
			type = 12,
			id = 12,
			grid_res_id = "grid_10",
			res_id = {
				1,
				"evt_13"
			},
			offset = {
				0,
				-10
			}
		},
		[14] = {
			show_ani = 0,
			type = 14,
			id = 12,
			grid_res_id = "grid_10",
			res_id = {
				2,
				"E27111"
			},
			offset = {
				0,
				3
			}
		}
	}
}
Config.MonopolyMapsData.data_dialog_length = 2
Config.MonopolyMapsData.data_dialog = {
	{
		[100] = {
			id = 100,
			step_id = 1,
			type = 1,
			dialogue = {
				{
					"阿鹤",
					0,
					0,
					"duzhounvwu",
					"欢迎来到我的小茶店，客官要点些什么",
					80,
					120,
					85
				},
				{
					"阿鹤",
					1,
					0,
					"duzhounvwu",
					"我们有解毒茶和年糕小豆汤，解毒茶可以解河水之毒，年糕小豆汤可以缓解饥饿。客官要哪一个？",
					80,
					120,
					85
				}
			},
			answer = {
				{
					1,
					"解毒茶"
				},
				{
					2,
					"年糕小豆汤"
				},
				{
					3,
					"成年人不做选择，都要"
				}
			}
		},
		[101] = {
			id = 101,
			step_id = 1,
			type = 1,
			dialogue = {
				{
					"多康",
					0,
					0,
					"siwangqishi",
					"哇哈哈~欢迎哈哈哈~；来到破落阵，这里的人都非常的乐观哈哈哈~。",
					250,
					120,
					70
				},
				{
					"多康",
					0,
					0,
					"siwangqishi",
					"笑一笑十年少，人生何必拥有太多情绪表情。",
					250,
					120,
					70
				},
				{
					"多康",
					1,
					0,
					"siwangqishi",
					"表面和睦乐天的破落镇隐藏着不为人知的心酸过往",
					250,
					120,
					70
				}
			},
			answer = {
				{
					1,
					"这里的人为何出现什么事情都能大笑度过"
				},
				{
					2,
					"这里的人们到底经历了些什么"
				}
			}
		},
		[110] = {
			id = 110,
			step_id = 2,
			type = 1,
			dialogue = {
				{
					"小玉",
					0,
					0,
					"heijinglingmiyan",
					"可爱的大猩猩，来，吃了这颗丸子",
					100,
					100,
					90
				},
				{
					"小玉",
					1,
					0,
					"heijinglingmiyan",
					"只要吃了我的丸子都会非常的听话，不会在做坏事了",
					100,
					100,
					90
				}
			},
			answer = {
				{
					1,
					"你是怎么做到的"
				},
				{
					2,
					"麻烦也给我来一颗。"
				}
			}
		},
		[111] = {
			id = 111,
			step_id = 2,
			type = 1,
			dialogue = {
				{
					"眠狂四郎",
					0,
					0,
					"shenvmosha",
					"反抗将军的都没有好下场，和之国大蛇将军说的算",
					100,
					100,
					85
				},
				{
					"眠狂四郎",
					1,
					0,
					"shenvmosha",
					"时间会冲淡一切，但御田大人的信念会不会灭的",
					100,
					100,
					85
				}
			},
			answer = {
				{
					1,
					"黑炭大蛇还在恐惧赤霄九侠的复仇"
				},
				{
					2,
					"和之国必然话开国"
				}
			}
		},
		[120] = {
			id = 120,
			step_id = 3,
			type = 1,
			dialogue = {
				{
					"小紫",
					0,
					0,
					"haila",
					"妾身给官人弹歌一曲吧",
					350,
					100,
					85
				},
				{
					"小紫",
					0,
					0,
					"haila",
					"想要妾身的陪伴，妾身的价格可不便宜哟”。",
					350,
					100,
					85
				},
				{
					"小紫",
					1,
					0,
					"haila",
					"恶人们的不义之财都给拿过来，那是属于和之国人们的",
					350,
					100,
					85
				}
			},
			answer = {
				{
					1,
					"身为和之国第一美女，身价是很高的哦"
				},
				{
					2,
					"我只想为和之国的人们做点什么"
				}
			}
		},
		[121] = {
			id = 121,
			step_id = 3,
			type = 1,
			dialogue = {
				{
					"锦卫门",
					0,
					0,
					"heianzhizhu",
					"在下穿越时空而来，就是为了完成御田大人的遗愿",
					600,
					100,
					70
				},
				{
					"锦卫门",
					1,
					0,
					"heianzhizhu",
					"保护好少主，他是我们唯一的希望，将来会成为将军的人",
					600,
					100,
					70
				}
			},
			answer = {
				{
					1,
					"御田大人的遗愿就是我们的愿望，请带上我们把"
				},
				{
					2,
					"就这个小屁孩，能行吗"
				}
			}
		},
		[122] = {
			id = 122,
			step_id = 3,
			type = 1,
			dialogue = {
				{
					"桃之助",
					0,
					0,
					"bingxueyuanwuqu",
					"啊，救命啊！",
					250,
					150,
					70
				},
				{
					"锦卫门",
					0,
					0,
					"heianzhizhu",
					"放开少主，不然我们就不客气了",
					600,
					100,
					70
				},
				{
					"锦卫门",
					1,
					0,
					"heianzhizhu",
					"集合同志们，决战鬼岛",
					600,
					100,
					70
				}
			},
			answer = {
				{
					1,
					"讨伐凯多，大伙行动起来"
				},
				{
					2,
					"冲啊，达到凯多，开放和之国"
				}
			}
		},
		[130] = {
			id = 130,
			step_id = 4,
			type = 1,
			dialogue = {
				{
					"大和",
					0,
					0,
					"nidehuoge",
					"在下是要成为光月御田的人",
					50,
					150,
					75
				},
				{
					"大和",
					0,
					0,
					"nidehuoge",
					"雷鸣八卦~~",
					50,
					150,
					75
				},
				{
					"润媞",
					1,
					0,
					"haila",
					"大和，我要杀了你",
					50,
					150,
					75
				}
			},
			answer = {
				{
					1,
					"这...这就是赤霄九侠吗，好帅"
				},
				{
					2,
					"我是凯多的儿子。"
				}
			}
		},
		[131] = {
			id = 131,
			step_id = 4,
			type = 1,
			dialogue = {
				{
					"大和",
					0,
					0,
					"haila",
					"你知道波特卡斯·D·艾斯吗",
					350,
					100,
					85
				},
				{
					"大和",
					0,
					0,
					"haila",
					"草帽小子，你就是他的弟弟吗，相信我带着我走",
					350,
					100,
					85
				},
				{
					"大和",
					0,
					0,
					"haila",
					"啊啊啊啊，那个混蛋，是想杀了我吗",
					350,
					100,
					85
				},
				{
					"大和",
					1,
					0,
					"haila",
					"在下就是光月御田",
					350,
					100,
					85
				}
			},
			answer = {
				{
					1,
					"我也要讨伐凯多，将和之国开国"
				},
				{
					2,
					"终于等到你了，草帽小子"
				}
			}
		},
		[132] = {
			id = 132,
			step_id = 4,
			type = 1,
			dialogue = {
				{
					"霍金斯",
					0,
					0,
					"bingxueyuanwuqu",
					"你能活到明天的概率只有0.1%",
					250,
					150,
					70
				},
				{
					"霍金斯",
					0,
					0,
					"bingxueyuanwuqu",
					"没想到会在这里遇到你们",
					250,
					150,
					70
				},
				{
					"霍金斯",
					1,
					0,
					"bingxueyuanwuqu",
					"好，抽到好卡了，你们休想来这里",
					250,
					150,
					70
				}
			},
			answer = {
				{
					1,
					"来，我来算算你今天的运气"
				},
				{
					2,
					"遇到了，那就留下来吧"
				},
				{
					3,
					"时机未到"
				}
			}
		},
		[133] = {
			id = 133,
			step_id = 4,
			type = 1,
			dialogue = {
				{
					"德雷克",
					0,
					0,
					"zhuyunqingfeng",
					"事情正往着不可预想的方向发展了）",
					150,
					180,
					70
				},
				{
					"德雷克",
					1,
					0,
					"zhuyunqingfeng",
					"飞六胞得想机会干掉一位看板",
					150,
					180,
					70
				},
				{
					"德雷克",
					0,
					0,
					"zhuyunqingfeng",
					"他真的有克比说的那好么",
					150,
					180,
					70
				}
			},
			answer = {
				{
					1,
					"看麻烦不嫌事大"
				},
				{
					2,
					"奎因么，目标是他或许不错"
				},
				{
					3,
					"也带带我吧，草帽"
				}
			}
		},
		[134] = {
			id = 134,
			step_id = 4,
			type = 1,
			dialogue = {
				{
					"黑炭大蛇",
					0,
					0,
					"nidehuoge",
					"哈哈哈，和之国是我的",
					50,
					150,
					75
				},
				{
					"凯多",
					0,
					0,
					"zhousi",
					"吵死了~（手起刀落）",
					200,
					200,
					80
				},
				{
					"群众",
					1,
					0,
					"",
					"震惊不已~(ΩДΩ)",
					0,
					0,
					100
				},
				{
					"忍者十人众",
					0,
					0,
					"zhousi",
					"我们愿意效忠凯多大人",
					200,
					200,
					80
				}
			},
			answer = {
				{
					1,
					"你什么意思，凯多~~"
				},
				{
					2,
					" 效忠和清除，选一个"
				},
				{
					3,
					" 结局就只能是这样了~"
				}
			}
		},
		[135] = {
			id = 135,
			step_id = 4,
			type = 1,
			dialogue = {
				{
					"黑炭大蛇",
					0,
					0,
					"nidehuoge",
					"哈哈哈，和之国是我的",
					50,
					150,
					75
				},
				{
					"凯多",
					0,
					0,
					"zhousi",
					"吵死了~（手起刀落）",
					200,
					200,
					80
				},
				{
					"群众",
					1,
					0,
					"",
					"震惊不已~(ΩДΩ)",
					0,
					0,
					100
				},
				{
					"忍者十人众",
					0,
					0,
					"zhousi",
					"我们愿意效忠凯多大人",
					200,
					200,
					80
				}
			},
			answer = {
				{
					1,
					"你什么意思，凯多~~"
				},
				{
					2,
					" 效忠和清除，选一个"
				},
				{
					3,
					" 结局就只能是这样了~"
				}
			}
		}
	},
	{
		[201] = {
			id = 201,
			step_id = 0,
			type = 2,
			dialogue = {
				{
					"凯多",
					0,
					0,
					"",
					"小小蝼蚁，既然敢来挑战我"
				},
				{
					"凯多",
					0,
					0,
					"panduola",
					"这感觉，有点似曾相识的感觉，隐隐约约有点光月御田的影子",
					370,
					130,
					85
				},
				{
					"凯多",
					1,
					1,
					"",
					"想打败我还早这呢"
				},
				{
					"凯多",
					0,
					0,
					"panduola",
					"让你看看这地方谁说的算",
					370,
					130,
					85
				}
			},
			answer = {
				{
					1,
					"1"
				},
				{
					2,
					"2"
				},
				{
					3,
					"3"
				},
				{
					4,
					"4"
				}
			}
		}
	}
}
Config.MonopolyMapsData.data_item_show_length = 12
Config.MonopolyMapsData.data_item_show = {
	{
		id = 1,
		title = "啊，是陷阱！",
		item_bid = 80254,
		desc = "怪物来袭，走到此处时会<div fontcolor=#9e501b>遭遇一般强度的小怪物</div>，击败可以获得大量奖励及<div fontcolor=#9e501b>火祭挑战券</div>"
	},
	{
		id = 2,
		title = "火祭挑战券",
		item_bid = 80245,
		desc = "走到此处会获得大量奖励及<div fontcolor=#9e501b>火祭挑战劵</div>"
	},
	{
		id = 3,
		title = "强者的对决",
		item_bid = 80256,
		desc = "强者的对决，<div fontcolor=#9e501b>用刀剪锤一决胜负</div>吧！获胜可以获得大量奖励"
	},
	{
		id = 4,
		title = "神秘事件",
		item_bid = 80257,
		desc = "在和之国发生的随机事件，<div fontcolor=#9e501b>做出你的选择吧</div>！有机会获得大量奖励哦"
	},
	{
		id = 5,
		title = "天降红包",
		item_bid = 80258,
		desc = "<div fontcolor=#9e501b>拾取到一个公会红包</div>，请不要忘记发给你的小伙伴"
	},
	{
		id = 6,
		title = "大boss出现了",
		item_bid = 80259,
		desc = "大boss来袭，<div fontcolor=#9e501b>触发一场高难度的boss战</div>，击败可以获得大量奖励及<div fontcolor=#9e501b>火祭挑战劵</div>"
	},
	{
		id = 7,
		title = "喷射气",
		item_bid = 80248,
		desc = "弗兰奇的奇怪装置，触发后，<div fontcolor=#9e501b>额外进行一次与上次步数相同的行动"
	},
	{
		id = 8,
		title = "和之国小米酒",
		item_bid = 80249,
		desc = "和之国限定小米酒！ \n<div fontcolor=#9e501b>火祭活动下次战斗伤害5倍（BOSS挑战除外）</div>"
	},
	{
		id = 9,
		title = "这就是希望么",
		item_bid = 80250,
		desc = "来自和之国民众的祝福！ \n<div fontcolor=#9e501b>下次行动掉落增加100%</div>"
	},
	{
		id = 10,
		title = "大量米饭",
		item_bid = 80251,
		desc = "吃饱了才有战斗力！ \n<div fontcolor=#9e501b>火祭活动下次战斗直接获得胜利（火祭BOSS除外）</div>"
	},
	{
		id = 11,
		title = "弗拉格",
		item_bid = 80260,
		desc = "立下一个FLAG，<div fontcolor=#9e501b>如果下次行走步数与选择的步数相同</div>，则可以获得大量奖励"
	},
	{
		id = 12,
		title = "终点",
		item_bid = 80261,
		desc = "这并不是终点，<div fontcolor=#9e501b>但是你可以领到大量奖励</div>（可获钻石*150，血量buff*3，攻击buff*3，挑战劵*1）"
	}
}

function Config.MonopolyMapsData.data_item_show_fun(slot0)
	slot1 = Config.MonopolyMapsData.data_item_show[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.MonopolyMapsData.data_item_show[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.MonopolyMapsData.data_drama_length = 5
Config.MonopolyMapsData.data_drama = {
	{
		type = 1,
		reward = {
			{
				1,
				{
					{
						80246,
						3
					}
				}
			}
		},
		dialogue = {
			{
				"凯多",
				0,
				0,
				"kaiduo",
				"你竟敢闯入我的领地。",
				200,
				100,
				90
			},
			{
				"凯多",
				0,
				0,
				"kaiduo",
				"Worororo",
				200,
				100,
				90
			},
			{
				"凯多",
				0,
				0,
				"kaiduo",
				"那就来试试吧，我在鬼岛等你们！",
				200,
				100,
				90
			}
		},
		answer = {
			{
				1
			}
		}
	},
	{
		type = 2,
		reward = {
			{
				1,
				{
					{
						80246,
						3
					}
				}
			}
		},
		dialogue = {
			{
				"马尔科",
				0,
				0,
				"maerke",
				"你们真的准备好登陆和之国了吗？！",
				100,
				100,
				90
			},
			{
				"马尔科",
				0,
				0,
				"maerke",
				"打败我，证明自己做好了准备！",
				100,
				100,
				90
			}
		},
		answer = {
			{
				1
			}
		}
	},
	{
		type = 3,
		reward = {
			{
				1,
				{
					{
						80246,
						3
					}
				}
			}
		},
		dialogue = {
			{
				"德雷克",
				0,
				0,
				"deleike",
				"嗯……你们怎么在这里？来捣乱吗！",
				450,
				150,
				80
			},
			{
				"德雷克",
				0,
				0,
				"deleike",
				"让我来试试你们的实力吧！",
				450,
				150,
				80
			}
		},
		answer = {
			{
				1
			}
		}
	},
	{
		type = 4,
		reward = {
			{
				1,
				{
					{
						80246,
						3
					}
				}
			}
		},
		dialogue = {
			{
				"霍金斯(台柱)",
				0,
				0,
				"huojinsi",
				"又是一群来挑战凯多的？",
				650,
				150,
				60
			},
			{
				"霍金斯(台柱)",
				0,
				0,
				"huojinsi",
				"我给你们算了一卦！",
				650,
				150,
				60
			},
			{
				"霍金斯(台柱)",
				0,
				0,
				"huojinsi",
				"你们能活下来的概率是……1%",
				650,
				150,
				60
			}
		},
		answer = {
			{
				1
			}
		}
	},
	{
		type = 5,
		reward = {
			{
				1,
				{
					{
						80246,
						3
					}
				}
			}
		},
		dialogue = {
			{
				"凯多",
				0,
				0,
				"kaiduo",
				"Worororo",
				350,
				100,
				85
			},
			{
				"凯多",
				0,
				0,
				"kaiduo",
				"来了吗？",
				350,
				100,
				85
			}
		},
		answer = {
			{
				1
			}
		}
	}
}

function Config.MonopolyMapsData.data_drama_fun(slot0)
	slot1 = Config.MonopolyMapsData.data_drama[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.MonopolyMapsData.data_drama[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.MonopolyMapsData.data_buff_tips_length = 3
Config.MonopolyMapsData.data_buff_tips = {
	[2] = {
		id = 2,
		desc = "米饭的力量！"
	},
	[3] = {
		id = 3,
		desc = "这就是希望么"
	},
	[4] = {
		id = 4,
		desc = "弗拉格"
	}
}

function Config.MonopolyMapsData.data_buff_tips_fun(slot0)
	slot1 = Config.MonopolyMapsData.data_buff_tips[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.MonopolyMapsData.data_buff_tips[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
