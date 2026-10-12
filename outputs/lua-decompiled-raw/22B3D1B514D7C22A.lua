Config = Config or {}
Config.DungeonHeavenData = Config.DungeonHeavenData or {}
Config.DungeonHeavenData.data_const_length = 7
Config.DungeonHeavenData.data_const = {
	open_world_lev = {
		val = 110,
		desc = "世界等级到达110级开启"
	},
	open_lev = {
		val = 105,
		desc = "个人等级到达105级开启"
	},
	open_lev_second = {
		val = 120,
		desc = "个人等级到达120级开启"
	},
	refresh_number = {
		val = 2,
		desc = "挑战次数上限"
	},
	rank_number = {
		val = 100,
		desc = "排行榜最大人数"
	},
	dunheaven_rule = {
		val = 1,
		desc = [[
1.每次挑战都将消耗<div fontcolor=65df74>1</div>点挑战次数，挑战失败<div fontcolor=65df74>不消耗</div>次数
2.每个关卡在<div fontcolor=65df74>完成三星目标</div>后将开启对应的<div fontcolor=65df74>扫荡</div>功能，每次扫荡消耗1点次数

3.挑战次数将在每日<div fontcolor=65df74>0点重置</div>，每日可消耗钻石购买<div fontcolor=65df74>2</div>点次数
4.需通关上一章的所有关卡后方可开启下一章
5.每章的第<div fontcolor=65df74>10</div>关为<div fontcolor=65df74>Boss关</div>，Boss关有<div fontcolor=65df74>2队怪物</div>，需要将他们全部击败方可通过关卡
6.部分章节的开启需要其他章节满足指定数量的星级目标
7.完成每章的星级目标可获得稀有的神器套装奖励]]
	},
	heaven_handbook = {
		desc = "神器图鉴tips",
		val = {
			28,
			17191,
			17192,
			17193
		}
	}
}

function Config.DungeonHeavenData.data_const_fun(slot0)
	slot1 = Config.DungeonHeavenData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DungeonHeavenData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.DungeonHeavenData.data_customs_length = 48
Config.DungeonHeavenData.data_customs = {
	{
		{
			type = 0,
			power = 250380,
			res_id = 3,
			id = 1,
			order_id = 1,
			dun_id = 10001,
			unit_id = {
				71000
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40100
			},
			auto_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2401
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					17191,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 251778,
			res_id = 3,
			id = 1,
			order_id = 2,
			dun_id = 10002,
			unit_id = {
				71001
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40100
			},
			auto_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2003
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					17191,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 253143,
			res_id = 3,
			id = 1,
			order_id = 3,
			dun_id = 10003,
			unit_id = {
				71002
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40100
			},
			auto_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2202
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					17191,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 254553,
			res_id = 1,
			id = 1,
			order_id = 4,
			dun_id = 10004,
			unit_id = {
				71003
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40100
			},
			auto_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3001
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					17191,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 260982,
			res_id = 3,
			id = 1,
			order_id = 5,
			dun_id = 10005,
			unit_id = {
				71004
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40100
			},
			auto_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2003
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					17191,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 281717,
			res_id = 3,
			id = 1,
			order_id = 6,
			dun_id = 10006,
			unit_id = {
				71005
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40100
			},
			auto_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2402
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					17191,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 283088,
			res_id = 3,
			id = 1,
			order_id = 7,
			dun_id = 10007,
			unit_id = {
				71006
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40100
			},
			auto_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2391
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					17191,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 284518,
			res_id = 1,
			id = 1,
			order_id = 8,
			dun_id = 10008,
			unit_id = {
				71007
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40100
			},
			auto_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2003
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					17191,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 285922,
			res_id = 3,
			id = 1,
			order_id = 9,
			dun_id = 10009,
			unit_id = {
				71008
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40100
			},
			auto_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3201
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					17191,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 1,
			power = 309435,
			res_id = 5,
			id = 1,
			order_id = 10,
			dun_id = 10010,
			unit_id = {
				71009,
				72009
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40100
			},
			auto_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					17191,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					5
				},
				{
					10030,
					1
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 358508,
			res_id = 1,
			id = 2,
			order_id = 1,
			dun_id = 10011,
			unit_id = {
				71010
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40200
			},
			auto_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2403
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					17192,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 393640,
			res_id = 1,
			id = 2,
			order_id = 2,
			dun_id = 10012,
			unit_id = {
				71011
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40200
			},
			auto_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2003
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					17192,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 395629,
			res_id = 1,
			id = 2,
			order_id = 3,
			dun_id = 10013,
			unit_id = {
				71012
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40200
			},
			auto_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2201
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					17192,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 397553,
			res_id = 2,
			id = 2,
			order_id = 4,
			dun_id = 10014,
			unit_id = {
				71013
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40200
			},
			auto_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3001
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					17192,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 399542,
			res_id = 1,
			id = 2,
			order_id = 5,
			dun_id = 10015,
			unit_id = {
				71014
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40200
			},
			auto_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2003
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					17192,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 407316,
			res_id = 1,
			id = 2,
			order_id = 6,
			dun_id = 10016,
			unit_id = {
				71015
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40200
			},
			auto_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2404
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					17192,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 426758,
			res_id = 1,
			id = 2,
			order_id = 7,
			dun_id = 10017,
			unit_id = {
				71016
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40200
			},
			auto_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					17192,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 428740,
			res_id = 2,
			id = 2,
			order_id = 8,
			dun_id = 10018,
			unit_id = {
				71017
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40200
			},
			auto_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2003
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					17192,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 430775,
			res_id = 1,
			id = 2,
			order_id = 9,
			dun_id = 10019,
			unit_id = {
				71018
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40200
			},
			auto_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3201
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					17192,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 1,
			power = 466081,
			res_id = 4,
			id = 2,
			order_id = 10,
			dun_id = 10020,
			unit_id = {
				71019,
				72019
			},
			f_award = {
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			f_drops = {
				40200
			},
			auto_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2393
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					17192,
					1
				},
				{
					3,
					50
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					6
				},
				{
					10030,
					1
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 434818,
			res_id = 2,
			id = 3,
			order_id = 1,
			dun_id = 10021,
			unit_id = {
				71020
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2405
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 560749,
			res_id = 2,
			id = 3,
			order_id = 2,
			dun_id = 10022,
			unit_id = {
				71021
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2002
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 563524,
			res_id = 2,
			id = 3,
			order_id = 3,
			dun_id = 10023,
			unit_id = {
				71022
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2204
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 566313,
			res_id = 3,
			id = 3,
			order_id = 4,
			dun_id = 10024,
			unit_id = {
				71023
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3001
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 569088,
			res_id = 2,
			id = 3,
			order_id = 5,
			dun_id = 10025,
			unit_id = {
				71024
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2002
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 571792,
			res_id = 2,
			id = 3,
			order_id = 6,
			dun_id = 10026,
			unit_id = {
				71025
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2406
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 574574,
			res_id = 2,
			id = 3,
			order_id = 7,
			dun_id = 10027,
			unit_id = {
				71026
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2393
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 577350,
			res_id = 3,
			id = 3,
			order_id = 8,
			dun_id = 10028,
			unit_id = {
				71027
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2002
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 580138,
			res_id = 2,
			id = 3,
			order_id = 9,
			dun_id = 10029,
			unit_id = {
				71028
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3201
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 1,
			power = 630686,
			res_id = 5,
			id = 3,
			order_id = 10,
			dun_id = 10030,
			unit_id = {
				71029,
				72029
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2392
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					21
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					7
				},
				{
					10030,
					1
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 588426,
			res_id = 3,
			id = 4,
			order_id = 1,
			dun_id = 10031,
			unit_id = {
				71030
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2401
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 591201,
			res_id = 3,
			id = 4,
			order_id = 2,
			dun_id = 10032,
			unit_id = {
				71031
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2002
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 593918,
			res_id = 3,
			id = 4,
			order_id = 3,
			dun_id = 10033,
			unit_id = {
				71032
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2203
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 596707,
			res_id = 1,
			id = 4,
			order_id = 4,
			dun_id = 10034,
			unit_id = {
				71033
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3001
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 605989,
			res_id = 3,
			id = 4,
			order_id = 5,
			dun_id = 10035,
			unit_id = {
				71034
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2002
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 628063,
			res_id = 3,
			id = 4,
			order_id = 6,
			dun_id = 10036,
			unit_id = {
				71035
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2402
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 630832,
			res_id = 3,
			id = 4,
			order_id = 7,
			dun_id = 10037,
			unit_id = {
				71036
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2392
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 633646,
			res_id = 1,
			id = 4,
			order_id = 8,
			dun_id = 10038,
			unit_id = {
				71037
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2002
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 0,
			power = 636467,
			res_id = 3,
			id = 4,
			order_id = 9,
			dun_id = 10039,
			unit_id = {
				71038
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3201
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			}
		},
		{
			type = 1,
			power = 688471,
			res_id = 5,
			id = 4,
			order_id = 10,
			dun_id = 10040,
			unit_id = {
				71039,
				72039
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2391
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					24
				},
				{
					10030,
					3
				}
			},
			show_award = {
				{
					28,
					8
				},
				{
					10030,
					1
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 848543,
			res_id = 1,
			id = 5,
			order_id = 1,
			dun_id = 10041,
			unit_id = {
				71040
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2403
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 852488,
			res_id = 1,
			id = 5,
			order_id = 2,
			dun_id = 10042,
			unit_id = {
				71041
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2001
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 856414,
			res_id = 1,
			id = 5,
			order_id = 3,
			dun_id = 10043,
			unit_id = {
				71042
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2202
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 860347,
			res_id = 2,
			id = 5,
			order_id = 4,
			dun_id = 10044,
			unit_id = {
				71043
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3001
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 864234,
			res_id = 1,
			id = 5,
			order_id = 5,
			dun_id = 10045,
			unit_id = {
				71044
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2001
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 868160,
			res_id = 1,
			id = 5,
			order_id = 6,
			dun_id = 10046,
			unit_id = {
				71045
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2391
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 872112,
			res_id = 1,
			id = 5,
			order_id = 7,
			dun_id = 10047,
			unit_id = {
				71046
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2404
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 876044,
			res_id = 2,
			id = 5,
			order_id = 8,
			dun_id = 10048,
			unit_id = {
				71047
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2001
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 879951,
			res_id = 1,
			id = 5,
			order_id = 9,
			dun_id = 10049,
			unit_id = {
				71048
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3201
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 1,
			power = 951860,
			res_id = 4,
			id = 5,
			order_id = 10,
			dun_id = 10050,
			unit_id = {
				71049,
				72049
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					9
				},
				{
					10030,
					2
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 887822,
			res_id = 2,
			id = 6,
			order_id = 1,
			dun_id = 10051,
			unit_id = {
				71050
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2405
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 891755,
			res_id = 2,
			id = 6,
			order_id = 2,
			dun_id = 10052,
			unit_id = {
				71051
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2001
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 895648,
			res_id = 2,
			id = 6,
			order_id = 3,
			dun_id = 10053,
			unit_id = {
				71052
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2201
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 899581,
			res_id = 3,
			id = 6,
			order_id = 4,
			dun_id = 10054,
			unit_id = {
				71053
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3001
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 910741,
			res_id = 2,
			id = 6,
			order_id = 5,
			dun_id = 10055,
			unit_id = {
				71054
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2001
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 977795,
			res_id = 2,
			id = 6,
			order_id = 6,
			dun_id = 10056,
			unit_id = {
				71055
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2406
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 981949,
			res_id = 2,
			id = 6,
			order_id = 7,
			dun_id = 10057,
			unit_id = {
				71056
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 986115,
			res_id = 3,
			id = 6,
			order_id = 8,
			dun_id = 10058,
			unit_id = {
				71057
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2001
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 990288,
			res_id = 2,
			id = 6,
			order_id = 9,
			dun_id = 10059,
			unit_id = {
				71058
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3201
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 1,
			power = 1148350,
			res_id = 5,
			id = 6,
			order_id = 10,
			dun_id = 10060,
			unit_id = {
				71059,
				72059
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2393
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					30
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					10
				},
				{
					10030,
					2
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1066325,
			res_id = 3,
			id = 7,
			order_id = 1,
			dun_id = 10061,
			unit_id = {
				71060
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2401
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1071039,
			res_id = 3,
			id = 7,
			order_id = 2,
			dun_id = 10062,
			unit_id = {
				71061
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2004
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1076934,
			res_id = 3,
			id = 7,
			order_id = 3,
			dun_id = 10063,
			unit_id = {
				71062
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2204
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1084430,
			res_id = 1,
			id = 7,
			order_id = 4,
			dun_id = 10064,
			unit_id = {
				71063
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3001
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1100735,
			res_id = 3,
			id = 7,
			order_id = 5,
			dun_id = 10065,
			unit_id = {
				71064
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2004
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1106729,
			res_id = 3,
			id = 7,
			order_id = 6,
			dun_id = 10066,
			unit_id = {
				71065
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2402
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1112723,
			res_id = 3,
			id = 7,
			order_id = 7,
			dun_id = 10067,
			unit_id = {
				71066
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2393
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1120457,
			res_id = 1,
			id = 7,
			order_id = 8,
			dun_id = 10068,
			unit_id = {
				71067
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2004
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1136719,
			res_id = 3,
			id = 7,
			order_id = 9,
			dun_id = 10069,
			unit_id = {
				71068
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3201
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 1,
			power = 1230718,
			res_id = 5,
			id = 7,
			order_id = 10,
			dun_id = 10070,
			unit_id = {
				71069,
				72069
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2392
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					33
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					11
				},
				{
					10030,
					2
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1138196,
			res_id = 1,
			id = 8,
			order_id = 1,
			dun_id = 10071,
			unit_id = {
				71070
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2403
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1147623,
			res_id = 1,
			id = 8,
			order_id = 2,
			dun_id = 10072,
			unit_id = {
				71071
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2004
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1159414,
			res_id = 1,
			id = 8,
			order_id = 3,
			dun_id = 10073,
			unit_id = {
				71072
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2203
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1174406,
			res_id = 2,
			id = 8,
			order_id = 4,
			dun_id = 10074,
			unit_id = {
				71073
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3001
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1207015,
			res_id = 1,
			id = 8,
			order_id = 5,
			dun_id = 10075,
			unit_id = {
				71074
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2004
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1219004,
			res_id = 1,
			id = 8,
			order_id = 6,
			dun_id = 10076,
			unit_id = {
				71075
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2404
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1230992,
			res_id = 1,
			id = 8,
			order_id = 7,
			dun_id = 10077,
			unit_id = {
				71076
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2392
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1246460,
			res_id = 2,
			id = 8,
			order_id = 8,
			dun_id = 10078,
			unit_id = {
				71077
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2004
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 0,
			power = 1278983,
			res_id = 1,
			id = 8,
			order_id = 9,
			dun_id = 10079,
			unit_id = {
				71078
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3201
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			}
		},
		{
			type = 1,
			power = 1390484,
			res_id = 4,
			id = 8,
			order_id = 10,
			dun_id = 10080,
			unit_id = {
				71079,
				72079
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2391
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					36
				},
				{
					10030,
					6
				}
			},
			show_award = {
				{
					28,
					12
				},
				{
					10030,
					2
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1147623,
			res_id = 2,
			id = 9,
			order_id = 1,
			dun_id = 10081,
			unit_id = {
				71080
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2405
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1159414,
			res_id = 2,
			id = 9,
			order_id = 2,
			dun_id = 10082,
			unit_id = {
				71081
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2005
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1174406,
			res_id = 2,
			id = 9,
			order_id = 3,
			dun_id = 10083,
			unit_id = {
				71082
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2202
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1207015,
			res_id = 3,
			id = 9,
			order_id = 4,
			dun_id = 10084,
			unit_id = {
				71083
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3001
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1219004,
			res_id = 2,
			id = 9,
			order_id = 5,
			dun_id = 10085,
			unit_id = {
				71084
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2005
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1230992,
			res_id = 2,
			id = 9,
			order_id = 6,
			dun_id = 10086,
			unit_id = {
				71085
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2406
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1246460,
			res_id = 2,
			id = 9,
			order_id = 7,
			dun_id = 10087,
			unit_id = {
				71086
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2391
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1278983,
			res_id = 3,
			id = 9,
			order_id = 8,
			dun_id = 10088,
			unit_id = {
				71087
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2005
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1291164,
			res_id = 2,
			id = 9,
			order_id = 9,
			dun_id = 10089,
			unit_id = {
				71088
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3201
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 1,
			power = 1403608,
			res_id = 5,
			id = 9,
			order_id = 10,
			dun_id = 10090,
			unit_id = {
				71089,
				72089
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					39
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					13
				},
				{
					10030,
					3
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1224207,
			res_id = 3,
			id = 10,
			order_id = 1,
			dun_id = 10091,
			unit_id = {
				71090
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2401
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1241894,
			res_id = 3,
			id = 10,
			order_id = 2,
			dun_id = 10092,
			unit_id = {
				71091
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2005
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1264381,
			res_id = 3,
			id = 10,
			order_id = 3,
			dun_id = 10093,
			unit_id = {
				71092
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2201
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1313295,
			res_id = 1,
			id = 10,
			order_id = 4,
			dun_id = 10094,
			unit_id = {
				71093
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3001
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1331278,
			res_id = 3,
			id = 10,
			order_id = 5,
			dun_id = 10095,
			unit_id = {
				71094
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2005
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1349261,
			res_id = 3,
			id = 10,
			order_id = 6,
			dun_id = 10096,
			unit_id = {
				71095
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2402
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1372462,
			res_id = 3,
			id = 10,
			order_id = 7,
			dun_id = 10097,
			unit_id = {
				71096
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1421247,
			res_id = 1,
			id = 10,
			order_id = 8,
			dun_id = 10098,
			unit_id = {
				71097
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2005
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1439519,
			res_id = 3,
			id = 10,
			order_id = 9,
			dun_id = 10099,
			unit_id = {
				71098
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3201
				},
				{
					3,
					3001
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 1,
			power = 1569936,
			res_id = 5,
			id = 10,
			order_id = 10,
			dun_id = 10100,
			unit_id = {
				71099,
				72099
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2393
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					14
				},
				{
					10030,
					3
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1224207,
			res_id = 1,
			id = 11,
			order_id = 1,
			dun_id = 10101,
			unit_id = {
				71100
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2015
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1241894,
			res_id = 1,
			id = 11,
			order_id = 2,
			dun_id = 10102,
			unit_id = {
				71101
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2404
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1264381,
			res_id = 1,
			id = 11,
			order_id = 3,
			dun_id = 10103,
			unit_id = {
				71102
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2101
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1313295,
			res_id = 2,
			id = 11,
			order_id = 4,
			dun_id = 10104,
			unit_id = {
				71103
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1331278,
			res_id = 1,
			id = 11,
			order_id = 5,
			dun_id = 10105,
			unit_id = {
				71104
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2015
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1349261,
			res_id = 1,
			id = 11,
			order_id = 6,
			dun_id = 10106,
			unit_id = {
				71105
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2102
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1372462,
			res_id = 1,
			id = 11,
			order_id = 7,
			dun_id = 10107,
			unit_id = {
				71106
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1421247,
			res_id = 2,
			id = 11,
			order_id = 8,
			dun_id = 10108,
			unit_id = {
				71107
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2014
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1439519,
			res_id = 1,
			id = 11,
			order_id = 9,
			dun_id = 10109,
			unit_id = {
				71108
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2102
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 1,
			power = 1569936,
			res_id = 4,
			id = 11,
			order_id = 10,
			dun_id = 10110,
			unit_id = {
				71109,
				72109
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2304
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					15
				},
				{
					10030,
					3
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1300792,
			res_id = 2,
			id = 12,
			order_id = 1,
			dun_id = 10111,
			unit_id = {
				71110
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2102
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1324374,
			res_id = 2,
			id = 12,
			order_id = 2,
			dun_id = 10112,
			unit_id = {
				71111
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2103
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1354357,
			res_id = 2,
			id = 12,
			order_id = 3,
			dun_id = 10113,
			unit_id = {
				71112
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2102
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1419575,
			res_id = 3,
			id = 12,
			order_id = 4,
			dun_id = 10114,
			unit_id = {
				71113
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2023
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1443553,
			res_id = 2,
			id = 12,
			order_id = 5,
			dun_id = 10115,
			unit_id = {
				71114
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2211
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1467530,
			res_id = 2,
			id = 12,
			order_id = 6,
			dun_id = 10116,
			unit_id = {
				71115
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2103
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1498465,
			res_id = 2,
			id = 12,
			order_id = 7,
			dun_id = 10117,
			unit_id = {
				71116
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2203
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1563511,
			res_id = 3,
			id = 12,
			order_id = 8,
			dun_id = 10118,
			unit_id = {
				71117
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2402
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 0,
			power = 1587873,
			res_id = 2,
			id = 12,
			order_id = 9,
			dun_id = 10119,
			unit_id = {
				71118
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2211
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			}
		},
		{
			type = 1,
			power = 1736265,
			res_id = 5,
			id = 12,
			order_id = 10,
			dun_id = 10120,
			unit_id = {
				71119,
				72119
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2304
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					9
				}
			},
			show_award = {
				{
					28,
					16
				},
				{
					10030,
					3
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1300792,
			res_id = 3,
			id = 13,
			order_id = 1,
			dun_id = 10121,
			unit_id = {
				71120
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2102
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1324374,
			res_id = 3,
			id = 13,
			order_id = 2,
			dun_id = 10122,
			unit_id = {
				71121
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2404
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1354357,
			res_id = 3,
			id = 13,
			order_id = 3,
			dun_id = 10123,
			unit_id = {
				71122
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2203
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1419575,
			res_id = 1,
			id = 13,
			order_id = 4,
			dun_id = 10124,
			unit_id = {
				71123
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2004
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1443553,
			res_id = 3,
			id = 13,
			order_id = 5,
			dun_id = 10125,
			unit_id = {
				71124
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2005
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1467530,
			res_id = 3,
			id = 13,
			order_id = 6,
			dun_id = 10126,
			unit_id = {
				71125
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2103
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1498465,
			res_id = 3,
			id = 13,
			order_id = 7,
			dun_id = 10127,
			unit_id = {
				71126
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2004
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1563511,
			res_id = 1,
			id = 13,
			order_id = 8,
			dun_id = 10128,
			unit_id = {
				71127
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2202
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1587873,
			res_id = 3,
			id = 13,
			order_id = 9,
			dun_id = 10129,
			unit_id = {
				71128
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2401
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 1,
			power = 1902593,
			res_id = 5,
			id = 13,
			order_id = 10,
			dun_id = 10130,
			unit_id = {
				71129,
				72129
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2042
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					17
				},
				{
					10030,
					4
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1440365,
			res_id = 3,
			id = 14,
			order_id = 1,
			dun_id = 10131,
			unit_id = {
				71130
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2211
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1452435,
			res_id = 3,
			id = 14,
			order_id = 2,
			dun_id = 10132,
			unit_id = {
				71131
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3101
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1459349,
			res_id = 3,
			id = 14,
			order_id = 3,
			dun_id = 10133,
			unit_id = {
				71132
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2011
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1497014,
			res_id = 1,
			id = 14,
			order_id = 4,
			dun_id = 10134,
			unit_id = {
				71133
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2101
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1552865,
			res_id = 3,
			id = 14,
			order_id = 5,
			dun_id = 10135,
			unit_id = {
				71134
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2104
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1570249,
			res_id = 3,
			id = 14,
			order_id = 6,
			dun_id = 10136,
			unit_id = {
				71135
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1592769,
			res_id = 3,
			id = 14,
			order_id = 7,
			dun_id = 10137,
			unit_id = {
				71136
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2401
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1599860,
			res_id = 1,
			id = 14,
			order_id = 8,
			dun_id = 10138,
			unit_id = {
				71137
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2311
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1627608,
			res_id = 3,
			id = 14,
			order_id = 9,
			dun_id = 10139,
			unit_id = {
				71138
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3201
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 1,
			power = 1966560,
			res_id = 5,
			id = 14,
			order_id = 10,
			dun_id = 10140,
			unit_id = {
				71139,
				72139
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2014
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					18
				},
				{
					10030,
					4
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1481976,
			res_id = 1,
			id = 15,
			order_id = 1,
			dun_id = 10141,
			unit_id = {
				71140
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2311
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1552498,
			res_id = 1,
			id = 15,
			order_id = 2,
			dun_id = 10142,
			unit_id = {
				71141
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1569884,
			res_id = 1,
			id = 15,
			order_id = 3,
			dun_id = 10143,
			unit_id = {
				71142
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2102
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1569839,
			res_id = 2,
			id = 15,
			order_id = 4,
			dun_id = 10144,
			unit_id = {
				71143
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3201
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1592769,
			res_id = 1,
			id = 15,
			order_id = 5,
			dun_id = 10145,
			unit_id = {
				71144
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2105
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1609875,
			res_id = 1,
			id = 15,
			order_id = 6,
			dun_id = 10146,
			unit_id = {
				71145
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2211
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1616026,
			res_id = 1,
			id = 15,
			order_id = 7,
			dun_id = 10147,
			unit_id = {
				71146
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2312
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1616031,
			res_id = 2,
			id = 15,
			order_id = 8,
			dun_id = 10148,
			unit_id = {
				71147
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2012
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1804800,
			res_id = 1,
			id = 15,
			order_id = 9,
			dun_id = 10149,
			unit_id = {
				71148
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2402
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 1,
			power = 2027370,
			res_id = 4,
			id = 15,
			order_id = 10,
			dun_id = 10150,
			unit_id = {
				71149,
				72149
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3101
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					19
				},
				{
					10030,
					4
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1599203,
			res_id = 2,
			id = 16,
			order_id = 1,
			dun_id = 10151,
			unit_id = {
				71150
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2103
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1598685,
			res_id = 2,
			id = 16,
			order_id = 2,
			dun_id = 10152,
			unit_id = {
				71151
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2403
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1604819,
			res_id = 2,
			id = 16,
			order_id = 3,
			dun_id = 10153,
			unit_id = {
				71152
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3201
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1610268,
			res_id = 3,
			id = 16,
			order_id = 4,
			dun_id = 10154,
			unit_id = {
				71153
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1633249,
			res_id = 2,
			id = 16,
			order_id = 5,
			dun_id = 10155,
			unit_id = {
				71154
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2101
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1616919,
			res_id = 2,
			id = 16,
			order_id = 6,
			dun_id = 10156,
			unit_id = {
				71155
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1804384,
			res_id = 2,
			id = 16,
			order_id = 7,
			dun_id = 10157,
			unit_id = {
				71156
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3101
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1833041,
			res_id = 3,
			id = 16,
			order_id = 8,
			dun_id = 10158,
			unit_id = {
				71157
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2011
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 0,
			power = 1862209,
			res_id = 2,
			id = 16,
			order_id = 9,
			dun_id = 10159,
			unit_id = {
				71158
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2211
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			}
		},
		{
			type = 1,
			power = 2085199,
			res_id = 5,
			id = 16,
			order_id = 10,
			dun_id = 10160,
			unit_id = {
				71159,
				72159
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2313
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					12
				}
			},
			show_award = {
				{
					28,
					20
				},
				{
					10030,
					4
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1633849,
			res_id = 3,
			id = 17,
			order_id = 1,
			dun_id = 10161,
			unit_id = {
				71160
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3101
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1804661,
			res_id = 3,
			id = 17,
			order_id = 2,
			dun_id = 10162,
			unit_id = {
				71161
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2104
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1832911,
			res_id = 3,
			id = 17,
			order_id = 3,
			dun_id = 10163,
			unit_id = {
				71162
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1861905,
			res_id = 1,
			id = 17,
			order_id = 4,
			dun_id = 10164,
			unit_id = {
				71163
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1890544,
			res_id = 3,
			id = 17,
			order_id = 5,
			dun_id = 10165,
			unit_id = {
				71164
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2404
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1919433,
			res_id = 3,
			id = 17,
			order_id = 6,
			dun_id = 10166,
			unit_id = {
				71165
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2314
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1948168,
			res_id = 3,
			id = 17,
			order_id = 7,
			dun_id = 10167,
			unit_id = {
				71166
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3201
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1975669,
			res_id = 1,
			id = 17,
			order_id = 8,
			dun_id = 10168,
			unit_id = {
				71167
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2312
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2006271,
			res_id = 3,
			id = 17,
			order_id = 9,
			dun_id = 10169,
			unit_id = {
				71168
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2014
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 1,
			power = 2146669,
			res_id = 5,
			id = 17,
			order_id = 10,
			dun_id = 10170,
			unit_id = {
				71169,
				72169
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2102
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					21
				},
				{
					10030,
					5
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1861490,
			res_id = 1,
			id = 18,
			order_id = 1,
			dun_id = 10171,
			unit_id = {
				71170
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2105
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1890369,
			res_id = 1,
			id = 18,
			order_id = 2,
			dun_id = 10172,
			unit_id = {
				71171
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2015
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1919519,
			res_id = 1,
			id = 18,
			order_id = 3,
			dun_id = 10173,
			unit_id = {
				71172
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1948875,
			res_id = 2,
			id = 18,
			order_id = 4,
			dun_id = 10174,
			unit_id = {
				71173
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3101
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1976915,
			res_id = 1,
			id = 18,
			order_id = 5,
			dun_id = 10175,
			unit_id = {
				71174
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2211
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2006099,
			res_id = 1,
			id = 18,
			order_id = 6,
			dun_id = 10176,
			unit_id = {
				71175
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2405
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2035208,
			res_id = 1,
			id = 18,
			order_id = 7,
			dun_id = 10177,
			unit_id = {
				71176
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2311
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2062693,
			res_id = 2,
			id = 18,
			order_id = 8,
			dun_id = 10178,
			unit_id = {
				71177
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					3201
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2092779,
			res_id = 1,
			id = 18,
			order_id = 9,
			dun_id = 10179,
			unit_id = {
				71178
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2103
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 1,
			power = 2236555,
			res_id = 4,
			id = 18,
			order_id = 10,
			dun_id = 10180,
			unit_id = {
				71179,
				72179
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					3003
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					22
				},
				{
					10030,
					5
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1903907,
			res_id = 7,
			id = 19,
			order_id = 1,
			dun_id = 10181,
			unit_id = {
				71180
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2405
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1928729,
			res_id = 7,
			id = 19,
			order_id = 2,
			dun_id = 10182,
			unit_id = {
				71181
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2011
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1973549,
			res_id = 7,
			id = 19,
			order_id = 3,
			dun_id = 10183,
			unit_id = {
				71182
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2302
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1985344,
			res_id = 8,
			id = 19,
			order_id = 4,
			dun_id = 10184,
			unit_id = {
				71183
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2211
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2020816,
			res_id = 7,
			id = 19,
			order_id = 5,
			dun_id = 10185,
			unit_id = {
				71184
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2392
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2046936,
			res_id = 7,
			id = 19,
			order_id = 6,
			dun_id = 10186,
			unit_id = {
				71185
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2076374,
			res_id = 7,
			id = 19,
			order_id = 7,
			dun_id = 10187,
			unit_id = {
				71186
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2095428,
			res_id = 8,
			id = 19,
			order_id = 8,
			dun_id = 10188,
			unit_id = {
				71187
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2022
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2132053,
			res_id = 7,
			id = 19,
			order_id = 9,
			dun_id = 10189,
			unit_id = {
				71188
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2393
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 1,
			power = 2273378,
			res_id = 10,
			id = 19,
			order_id = 10,
			dun_id = 10190,
			unit_id = {
				71189,
				72189
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2021
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					23
				},
				{
					10030,
					5
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1925228,
			res_id = 8,
			id = 20,
			order_id = 1,
			dun_id = 10191,
			unit_id = {
				71190
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2301
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1963195,
			res_id = 8,
			id = 20,
			order_id = 2,
			dun_id = 10192,
			unit_id = {
				71191
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2124
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 1996690,
			res_id = 8,
			id = 20,
			order_id = 3,
			dun_id = 10193,
			unit_id = {
				71192
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2403
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2023430,
			res_id = 6,
			id = 20,
			order_id = 4,
			dun_id = 10194,
			unit_id = {
				71193
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2044869,
			res_id = 8,
			id = 20,
			order_id = 5,
			dun_id = 10195,
			unit_id = {
				71194
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2011
				},
				{
					3,
					2013
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2058257,
			res_id = 8,
			id = 20,
			order_id = 6,
			dun_id = 10196,
			unit_id = {
				71195
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2211
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2081261,
			res_id = 8,
			id = 20,
			order_id = 7,
			dun_id = 10197,
			unit_id = {
				71196
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2392
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2131813,
			res_id = 6,
			id = 20,
			order_id = 8,
			dun_id = 10198,
			unit_id = {
				71197
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2223
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 0,
			power = 2146685,
			res_id = 8,
			id = 20,
			order_id = 9,
			dun_id = 10199,
			unit_id = {
				71198
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			}
		},
		{
			type = 1,
			power = 2313161,
			res_id = 10,
			id = 20,
			order_id = 10,
			dun_id = 10200,
			unit_id = {
				71199,
				72199
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2025
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					15
				}
			},
			show_award = {
				{
					28,
					24
				},
				{
					10030,
					5
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1949327,
			res_id = 8,
			id = 21,
			order_id = 1,
			dun_id = 10201,
			unit_id = {
				71200
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2405
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 1973762,
			res_id = 8,
			id = 21,
			order_id = 2,
			dun_id = 10202,
			unit_id = {
				71201
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2393
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2013546,
			res_id = 8,
			id = 21,
			order_id = 3,
			dun_id = 10203,
			unit_id = {
				71202
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2405
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2014850,
			res_id = 6,
			id = 21,
			order_id = 4,
			dun_id = 10204,
			unit_id = {
				71203
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2066028,
			res_id = 8,
			id = 21,
			order_id = 5,
			dun_id = 10205,
			unit_id = {
				71204
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					2212
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2077119,
			res_id = 8,
			id = 21,
			order_id = 6,
			dun_id = 10206,
			unit_id = {
				71205
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2015
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2117232,
			res_id = 8,
			id = 21,
			order_id = 7,
			dun_id = 10207,
			unit_id = {
				71206
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2121
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2125452,
			res_id = 6,
			id = 21,
			order_id = 8,
			dun_id = 10208,
			unit_id = {
				71207
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2224
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2150968,
			res_id = 8,
			id = 21,
			order_id = 9,
			dun_id = 10209,
			unit_id = {
				71208
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 1,
			power = 2311249,
			res_id = 10,
			id = 21,
			order_id = 10,
			dun_id = 10210,
			unit_id = {
				71209,
				72209
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2024
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					25
				},
				{
					10030,
					6
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1967928,
			res_id = 6,
			id = 22,
			order_id = 1,
			dun_id = 10211,
			unit_id = {
				71210
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2303
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 1992341,
			res_id = 6,
			id = 22,
			order_id = 2,
			dun_id = 10212,
			unit_id = {
				71211
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2011586,
			res_id = 6,
			id = 22,
			order_id = 3,
			dun_id = 10213,
			unit_id = {
				71212
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2301
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2044022,
			res_id = 7,
			id = 22,
			order_id = 4,
			dun_id = 10214,
			unit_id = {
				71213
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2052120,
			res_id = 6,
			id = 22,
			order_id = 5,
			dun_id = 10215,
			unit_id = {
				71214
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2084595,
			res_id = 6,
			id = 22,
			order_id = 6,
			dun_id = 10216,
			unit_id = {
				71215
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2015
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2118472,
			res_id = 6,
			id = 22,
			order_id = 7,
			dun_id = 10217,
			unit_id = {
				71216
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					2012
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2134737,
			res_id = 7,
			id = 22,
			order_id = 8,
			dun_id = 10218,
			unit_id = {
				71217
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2022
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2156283,
			res_id = 6,
			id = 22,
			order_id = 9,
			dun_id = 10219,
			unit_id = {
				71218
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					2212
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 1,
			power = 2338195,
			res_id = 9,
			id = 22,
			order_id = 10,
			dun_id = 10220,
			unit_id = {
				71219,
				72219
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2224
				},
				{
					3,
					3005
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					26
				},
				{
					10030,
					6
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 1984114,
			res_id = 7,
			id = 23,
			order_id = 1,
			dun_id = 10221,
			unit_id = {
				71220
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2404
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 1990627,
			res_id = 7,
			id = 23,
			order_id = 2,
			dun_id = 10222,
			unit_id = {
				71221
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2012
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2019341,
			res_id = 7,
			id = 23,
			order_id = 3,
			dun_id = 10223,
			unit_id = {
				71222
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2403
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2060038,
			res_id = 8,
			id = 23,
			order_id = 4,
			dun_id = 10224,
			unit_id = {
				71223
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2082135,
			res_id = 7,
			id = 23,
			order_id = 5,
			dun_id = 10225,
			unit_id = {
				71224
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2392
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2088211,
			res_id = 7,
			id = 23,
			order_id = 6,
			dun_id = 10226,
			unit_id = {
				71225
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2130410,
			res_id = 7,
			id = 23,
			order_id = 7,
			dun_id = 10227,
			unit_id = {
				71226
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2391
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2145755,
			res_id = 8,
			id = 23,
			order_id = 8,
			dun_id = 10228,
			unit_id = {
				71227
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2223
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2167810,
			res_id = 7,
			id = 23,
			order_id = 9,
			dun_id = 10229,
			unit_id = {
				71228
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2014
				},
				{
					3,
					2013
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 1,
			power = 2364404,
			res_id = 10,
			id = 23,
			order_id = 10,
			dun_id = 10230,
			unit_id = {
				71229,
				72229
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2023
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					27
				},
				{
					10030,
					6
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 2062826,
			res_id = 8,
			id = 24,
			order_id = 1,
			dun_id = 10231,
			unit_id = {
				71230
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2112
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2078110,
			res_id = 8,
			id = 24,
			order_id = 2,
			dun_id = 10232,
			unit_id = {
				71231
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2122
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2110619,
			res_id = 8,
			id = 24,
			order_id = 3,
			dun_id = 10233,
			unit_id = {
				71232
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2404
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2128942,
			res_id = 6,
			id = 24,
			order_id = 4,
			dun_id = 10234,
			unit_id = {
				71233
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2393
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2133399,
			res_id = 8,
			id = 24,
			order_id = 5,
			dun_id = 10235,
			unit_id = {
				71234
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2166097,
			res_id = 8,
			id = 24,
			order_id = 6,
			dun_id = 10236,
			unit_id = {
				71235
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2011
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2199616,
			res_id = 8,
			id = 24,
			order_id = 7,
			dun_id = 10237,
			unit_id = {
				71236
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2214547,
			res_id = 6,
			id = 24,
			order_id = 8,
			dun_id = 10238,
			unit_id = {
				71237
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2021
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 0,
			power = 2232069,
			res_id = 8,
			id = 24,
			order_id = 9,
			dun_id = 10239,
			unit_id = {
				71238
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					2012
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			}
		},
		{
			type = 1,
			power = 2364134,
			res_id = 10,
			id = 24,
			order_id = 10,
			dun_id = 10240,
			unit_id = {
				71239,
				72239
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2022
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					18
				}
			},
			show_award = {
				{
					28,
					28
				},
				{
					10030,
					6
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 2134694,
			res_id = 6,
			id = 25,
			order_id = 1,
			dun_id = 10241,
			unit_id = {
				71240
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2404
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2167389,
			res_id = 6,
			id = 25,
			order_id = 2,
			dun_id = 10242,
			unit_id = {
				71241
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2200906,
			res_id = 6,
			id = 25,
			order_id = 3,
			dun_id = 10243,
			unit_id = {
				71242
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2114
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2225342,
			res_id = 7,
			id = 25,
			order_id = 4,
			dun_id = 10244,
			unit_id = {
				71243
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2241617,
			res_id = 6,
			id = 25,
			order_id = 5,
			dun_id = 10245,
			unit_id = {
				71244
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2012
				},
				{
					3,
					2011
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2263604,
			res_id = 6,
			id = 25,
			order_id = 6,
			dun_id = 10246,
			unit_id = {
				71245
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2122
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2282325,
			res_id = 6,
			id = 25,
			order_id = 7,
			dun_id = 10247,
			unit_id = {
				71246
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2222
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2301504,
			res_id = 7,
			id = 25,
			order_id = 8,
			dun_id = 10248,
			unit_id = {
				71247
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2224
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2334378,
			res_id = 6,
			id = 25,
			order_id = 9,
			dun_id = 10249,
			unit_id = {
				71248
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2015
				},
				{
					3,
					2014
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 1,
			power = 2367340,
			res_id = 9,
			id = 25,
			order_id = 10,
			dun_id = 10250,
			unit_id = {
				71249,
				72249
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2224
				},
				{
					3,
					3005
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					29
				},
				{
					10030,
					7
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 2194268,
			res_id = 7,
			id = 26,
			order_id = 1,
			dun_id = 10251,
			unit_id = {
				71250
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2401
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2218332,
			res_id = 7,
			id = 26,
			order_id = 2,
			dun_id = 10252,
			unit_id = {
				71251
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2392
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2239767,
			res_id = 7,
			id = 26,
			order_id = 3,
			dun_id = 10253,
			unit_id = {
				71252
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2405
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2269433,
			res_id = 8,
			id = 26,
			order_id = 4,
			dun_id = 10254,
			unit_id = {
				71253
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2283477,
			res_id = 7,
			id = 26,
			order_id = 5,
			dun_id = 10255,
			unit_id = {
				71254
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2393
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2309177,
			res_id = 7,
			id = 26,
			order_id = 6,
			dun_id = 10256,
			unit_id = {
				71255
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2329128,
			res_id = 7,
			id = 26,
			order_id = 7,
			dun_id = 10257,
			unit_id = {
				71256
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2123
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2365538,
			res_id = 8,
			id = 26,
			order_id = 8,
			dun_id = 10258,
			unit_id = {
				71257
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2023
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2371608,
			res_id = 7,
			id = 26,
			order_id = 9,
			dun_id = 10259,
			unit_id = {
				71258
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2011
				},
				{
					3,
					2013
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 1,
			power = 2398876,
			res_id = 10,
			id = 26,
			order_id = 10,
			dun_id = 10260,
			unit_id = {
				71259,
				72259
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2024
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 2229226,
			res_id = 8,
			id = 27,
			order_id = 1,
			dun_id = 10261,
			unit_id = {
				71260
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2406
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2260830,
			res_id = 8,
			id = 27,
			order_id = 2,
			dun_id = 10262,
			unit_id = {
				71261
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2276182,
			res_id = 8,
			id = 27,
			order_id = 3,
			dun_id = 10263,
			unit_id = {
				71262
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2404
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2302631,
			res_id = 6,
			id = 27,
			order_id = 4,
			dun_id = 10264,
			unit_id = {
				71263
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2011
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2324953,
			res_id = 8,
			id = 27,
			order_id = 5,
			dun_id = 10265,
			unit_id = {
				71264
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2015
				},
				{
					3,
					2014
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2349920,
			res_id = 8,
			id = 27,
			order_id = 6,
			dun_id = 10266,
			unit_id = {
				71265
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2362612,
			res_id = 8,
			id = 27,
			order_id = 7,
			dun_id = 10267,
			unit_id = {
				71266
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					2212
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2404082,
			res_id = 6,
			id = 27,
			order_id = 8,
			dun_id = 10268,
			unit_id = {
				71267
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2223
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2409461,
			res_id = 8,
			id = 27,
			order_id = 9,
			dun_id = 10269,
			unit_id = {
				71268
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2011
				},
				{
					3,
					2013
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 1,
			power = 2448730,
			res_id = 10,
			id = 27,
			order_id = 10,
			dun_id = 10270,
			unit_id = {
				71269,
				72269
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2025
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 2284629,
			res_id = 6,
			id = 28,
			order_id = 1,
			dun_id = 10271,
			unit_id = {
				71270
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2304
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2302147,
			res_id = 6,
			id = 28,
			order_id = 2,
			dun_id = 10272,
			unit_id = {
				71271
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2124
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2332161,
			res_id = 6,
			id = 28,
			order_id = 3,
			dun_id = 10273,
			unit_id = {
				71272
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2114
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2353997,
			res_id = 7,
			id = 28,
			order_id = 4,
			dun_id = 10274,
			unit_id = {
				71273
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2211
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2375853,
			res_id = 6,
			id = 28,
			order_id = 5,
			dun_id = 10275,
			unit_id = {
				71274
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2378679,
			res_id = 6,
			id = 28,
			order_id = 6,
			dun_id = 10276,
			unit_id = {
				71275
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2391
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2409991,
			res_id = 6,
			id = 28,
			order_id = 7,
			dun_id = 10277,
			unit_id = {
				71276
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2221
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2426547,
			res_id = 7,
			id = 28,
			order_id = 8,
			dun_id = 10278,
			unit_id = {
				71277
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2223
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 0,
			power = 2462130,
			res_id = 6,
			id = 28,
			order_id = 9,
			dun_id = 10279,
			unit_id = {
				71278
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					2212
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		},
		{
			type = 1,
			power = 2475340,
			res_id = 9,
			id = 28,
			order_id = 10,
			dun_id = 10280,
			unit_id = {
				71279,
				72279
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2022
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					21
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					7
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 2538146,
			res_id = 6,
			id = 29,
			order_id = 1,
			dun_id = 10281,
			unit_id = {
				71280
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2405
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2572054,
			res_id = 6,
			id = 29,
			order_id = 2,
			dun_id = 10282,
			unit_id = {
				71281
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2581427,
			res_id = 6,
			id = 29,
			order_id = 3,
			dun_id = 10283,
			unit_id = {
				71282
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2302
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2607517,
			res_id = 7,
			id = 29,
			order_id = 4,
			dun_id = 10284,
			unit_id = {
				71283
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2211
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2641610,
			res_id = 6,
			id = 29,
			order_id = 5,
			dun_id = 10285,
			unit_id = {
				71284
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2392
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2664806,
			res_id = 6,
			id = 29,
			order_id = 6,
			dun_id = 10286,
			unit_id = {
				71285
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2677031,
			res_id = 6,
			id = 29,
			order_id = 7,
			dun_id = 10287,
			unit_id = {
				71286
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2700133,
			res_id = 7,
			id = 29,
			order_id = 8,
			dun_id = 10288,
			unit_id = {
				71287
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2023
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2734421,
			res_id = 6,
			id = 29,
			order_id = 9,
			dun_id = 10289,
			unit_id = {
				71288
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2393
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 1,
			power = 2770891,
			res_id = 9,
			id = 29,
			order_id = 10,
			dun_id = 10290,
			unit_id = {
				71289,
				72289
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2043
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 2655113,
			res_id = 6,
			id = 30,
			order_id = 1,
			dun_id = 10291,
			unit_id = {
				71290
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2301
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2679499,
			res_id = 6,
			id = 30,
			order_id = 2,
			dun_id = 10292,
			unit_id = {
				71291
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2123
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2700184,
			res_id = 6,
			id = 30,
			order_id = 3,
			dun_id = 10293,
			unit_id = {
				71292
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2403
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2734421,
			res_id = 7,
			id = 30,
			order_id = 4,
			dun_id = 10294,
			unit_id = {
				71293
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2746525,
			res_id = 6,
			id = 30,
			order_id = 5,
			dun_id = 10295,
			unit_id = {
				71294
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2012
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2769667,
			res_id = 6,
			id = 30,
			order_id = 6,
			dun_id = 10296,
			unit_id = {
				71295
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2211
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2792876,
			res_id = 6,
			id = 30,
			order_id = 7,
			dun_id = 10297,
			unit_id = {
				71296
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2392
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2828373,
			res_id = 7,
			id = 30,
			order_id = 8,
			dun_id = 10298,
			unit_id = {
				71297
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2223
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2840382,
			res_id = 6,
			id = 30,
			order_id = 9,
			dun_id = 10299,
			unit_id = {
				71298
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 1,
			power = 2876702,
			res_id = 9,
			id = 30,
			order_id = 10,
			dun_id = 10300,
			unit_id = {
				71299,
				72299
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2035
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 2778294,
			res_id = 6,
			id = 31,
			order_id = 1,
			dun_id = 10301,
			unit_id = {
				71300
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2405
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2803997,
			res_id = 6,
			id = 31,
			order_id = 2,
			dun_id = 10302,
			unit_id = {
				71301
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2393
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2816023,
			res_id = 6,
			id = 31,
			order_id = 3,
			dun_id = 10303,
			unit_id = {
				71302
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2405
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2849514,
			res_id = 7,
			id = 31,
			order_id = 4,
			dun_id = 10304,
			unit_id = {
				71303
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2023
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2871631,
			res_id = 6,
			id = 31,
			order_id = 5,
			dun_id = 10305,
			unit_id = {
				71304
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					2212
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2875493,
			res_id = 6,
			id = 31,
			order_id = 6,
			dun_id = 10306,
			unit_id = {
				71305
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2015
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2920517,
			res_id = 6,
			id = 31,
			order_id = 7,
			dun_id = 10307,
			unit_id = {
				71306
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2121
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2941955,
			res_id = 7,
			id = 31,
			order_id = 8,
			dun_id = 10308,
			unit_id = {
				71307
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2222
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2946043,
			res_id = 6,
			id = 31,
			order_id = 9,
			dun_id = 10309,
			unit_id = {
				71308
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 1,
			power = 3000125,
			res_id = 9,
			id = 31,
			order_id = 10,
			dun_id = 10310,
			unit_id = {
				71309,
				72309
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2034
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 2886063,
			res_id = 6,
			id = 32,
			order_id = 1,
			dun_id = 10311,
			unit_id = {
				71310
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2303
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2919927,
			res_id = 6,
			id = 32,
			order_id = 2,
			dun_id = 10312,
			unit_id = {
				71311
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2943830,
			res_id = 6,
			id = 32,
			order_id = 3,
			dun_id = 10313,
			unit_id = {
				71312
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2301
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2953331,
			res_id = 7,
			id = 32,
			order_id = 4,
			dun_id = 10314,
			unit_id = {
				71313
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2991896,
			res_id = 6,
			id = 32,
			order_id = 5,
			dun_id = 10315,
			unit_id = {
				71314
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 2992604,
			res_id = 6,
			id = 32,
			order_id = 6,
			dun_id = 10316,
			unit_id = {
				71315
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2015
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 3025634,
			res_id = 6,
			id = 32,
			order_id = 7,
			dun_id = 10317,
			unit_id = {
				71316
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					2012
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 3038521,
			res_id = 7,
			id = 32,
			order_id = 8,
			dun_id = 10318,
			unit_id = {
				71317
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2022
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 0,
			power = 3061682,
			res_id = 6,
			id = 32,
			order_id = 9,
			dun_id = 10319,
			unit_id = {
				71318
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					2212
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		},
		{
			type = 1,
			power = 3119489,
			res_id = 9,
			id = 32,
			order_id = 10,
			dun_id = 10320,
			unit_id = {
				71319,
				72319
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2224
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					24
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					8
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 3012736,
			res_id = 6,
			id = 33,
			order_id = 1,
			dun_id = 10321,
			unit_id = {
				71320
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2404
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3025423,
			res_id = 6,
			id = 33,
			order_id = 2,
			dun_id = 10322,
			unit_id = {
				71321
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2012
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3049987,
			res_id = 6,
			id = 33,
			order_id = 3,
			dun_id = 10323,
			unit_id = {
				71322
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2403
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3071943,
			res_id = 7,
			id = 33,
			order_id = 4,
			dun_id = 10324,
			unit_id = {
				71323
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3105480,
			res_id = 6,
			id = 33,
			order_id = 5,
			dun_id = 10325,
			unit_id = {
				71324
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2392
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3117125,
			res_id = 6,
			id = 33,
			order_id = 6,
			dun_id = 10326,
			unit_id = {
				71325
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3140304,
			res_id = 6,
			id = 33,
			order_id = 7,
			dun_id = 10327,
			unit_id = {
				71326
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2391
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3174154,
			res_id = 7,
			id = 33,
			order_id = 8,
			dun_id = 10328,
			unit_id = {
				71327
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2223
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3186574,
			res_id = 6,
			id = 33,
			order_id = 9,
			dun_id = 10329,
			unit_id = {
				71328
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2014
				},
				{
					3,
					2013
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 1,
			power = 3244006,
			res_id = 9,
			id = 33,
			order_id = 10,
			dun_id = 10330,
			unit_id = {
				71329,
				72329
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2041
				},
				{
					3,
					3005
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 3128683,
			res_id = 6,
			id = 34,
			order_id = 1,
			dun_id = 10331,
			unit_id = {
				71330
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2112
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3131076,
			res_id = 6,
			id = 34,
			order_id = 2,
			dun_id = 10332,
			unit_id = {
				71331
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2122
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3163456,
			res_id = 6,
			id = 34,
			order_id = 3,
			dun_id = 10333,
			unit_id = {
				71332
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2404
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3199731,
			res_id = 7,
			id = 34,
			order_id = 4,
			dun_id = 10334,
			unit_id = {
				71333
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2393
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3210985,
			res_id = 6,
			id = 34,
			order_id = 5,
			dun_id = 10335,
			unit_id = {
				71334
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3232958,
			res_id = 6,
			id = 34,
			order_id = 6,
			dun_id = 10336,
			unit_id = {
				71335
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2011
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3234392,
			res_id = 6,
			id = 34,
			order_id = 7,
			dun_id = 10337,
			unit_id = {
				71336
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3279901,
			res_id = 7,
			id = 34,
			order_id = 8,
			dun_id = 10338,
			unit_id = {
				71337
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2021
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3314245,
			res_id = 6,
			id = 34,
			order_id = 9,
			dun_id = 10339,
			unit_id = {
				71338
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					2012
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 1,
			power = 3349900,
			res_id = 9,
			id = 34,
			order_id = 10,
			dun_id = 10340,
			unit_id = {
				71339,
				72339
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2042
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 3222882,
			res_id = 6,
			id = 35,
			order_id = 1,
			dun_id = 10341,
			unit_id = {
				71340
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2404
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3256690,
			res_id = 6,
			id = 35,
			order_id = 2,
			dun_id = 10342,
			unit_id = {
				71341
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3280447,
			res_id = 6,
			id = 35,
			order_id = 3,
			dun_id = 10343,
			unit_id = {
				71342
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2114
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3313084,
			res_id = 7,
			id = 35,
			order_id = 4,
			dun_id = 10344,
			unit_id = {
				71343
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3324418,
			res_id = 6,
			id = 35,
			order_id = 5,
			dun_id = 10345,
			unit_id = {
				71344
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2012
				},
				{
					3,
					2011
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3349900,
			res_id = 6,
			id = 35,
			order_id = 6,
			dun_id = 10346,
			unit_id = {
				71345
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2122
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3372112,
			res_id = 6,
			id = 35,
			order_id = 7,
			dun_id = 10347,
			unit_id = {
				71346
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2222
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3406953,
			res_id = 7,
			id = 35,
			order_id = 8,
			dun_id = 10348,
			unit_id = {
				71347
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2224
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3419357,
			res_id = 6,
			id = 35,
			order_id = 9,
			dun_id = 10349,
			unit_id = {
				71348
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2015
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 1,
			power = 3475278,
			res_id = 9,
			id = 35,
			order_id = 10,
			dun_id = 10350,
			unit_id = {
				71349,
				72349
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2224
				},
				{
					3,
					3005
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 3360336,
			res_id = 6,
			id = 36,
			order_id = 1,
			dun_id = 10351,
			unit_id = {
				71350
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2401
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3382680,
			res_id = 6,
			id = 36,
			order_id = 2,
			dun_id = 10352,
			unit_id = {
				71351
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2392
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3394904,
			res_id = 6,
			id = 36,
			order_id = 3,
			dun_id = 10353,
			unit_id = {
				71352
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2405
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3429026,
			res_id = 7,
			id = 36,
			order_id = 4,
			dun_id = 10354,
			unit_id = {
				71353
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3442523,
			res_id = 6,
			id = 36,
			order_id = 5,
			dun_id = 10355,
			unit_id = {
				71354
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2393
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3464521,
			res_id = 6,
			id = 36,
			order_id = 6,
			dun_id = 10356,
			unit_id = {
				71355
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3486622,
			res_id = 6,
			id = 36,
			order_id = 7,
			dun_id = 10357,
			unit_id = {
				71356
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2123
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3512000,
			res_id = 7,
			id = 36,
			order_id = 8,
			dun_id = 10358,
			unit_id = {
				71357
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2023
				},
				{
					3,
					3201
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 0,
			power = 3534009,
			res_id = 6,
			id = 36,
			order_id = 9,
			dun_id = 10359,
			unit_id = {
				71358
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2011
				},
				{
					3,
					2013
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		},
		{
			type = 1,
			power = 3568790,
			res_id = 9,
			id = 36,
			order_id = 10,
			dun_id = 10360,
			unit_id = {
				71359,
				72359
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2034
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					27
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					9
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 3453635,
			res_id = 7,
			id = 37,
			order_id = 1,
			dun_id = 10361,
			unit_id = {
				71360
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2403
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3487761,
			res_id = 7,
			id = 37,
			order_id = 2,
			dun_id = 10362,
			unit_id = {
				71361
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3512295,
			res_id = 7,
			id = 37,
			order_id = 3,
			dun_id = 10363,
			unit_id = {
				71362
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2401
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3547645,
			res_id = 8,
			id = 37,
			order_id = 4,
			dun_id = 10364,
			unit_id = {
				71363
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3569400,
			res_id = 7,
			id = 37,
			order_id = 5,
			dun_id = 10365,
			unit_id = {
				71364
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2011
				},
				{
					3,
					2013
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3583162,
			res_id = 7,
			id = 37,
			order_id = 6,
			dun_id = 10366,
			unit_id = {
				71365
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2211
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3605301,
			res_id = 7,
			id = 37,
			order_id = 7,
			dun_id = 10367,
			unit_id = {
				71366
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					2012
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3626701,
			res_id = 8,
			id = 37,
			order_id = 8,
			dun_id = 10368,
			unit_id = {
				71367
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2022
				},
				{
					3,
					3202
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3664425,
			res_id = 7,
			id = 37,
			order_id = 9,
			dun_id = 10369,
			unit_id = {
				71368
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					2012
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 1,
			power = 3708583,
			res_id = 10,
			id = 37,
			order_id = 10,
			dun_id = 10370,
			unit_id = {
				71369,
				72369
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2223
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 3581511,
			res_id = 8,
			id = 38,
			order_id = 1,
			dun_id = 10371,
			unit_id = {
				71370
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2302
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3605301,
			res_id = 8,
			id = 38,
			order_id = 2,
			dun_id = 10372,
			unit_id = {
				71371
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2123
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3638977,
			res_id = 8,
			id = 38,
			order_id = 3,
			dun_id = 10373,
			unit_id = {
				71372
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2111
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3662183,
			res_id = 6,
			id = 38,
			order_id = 4,
			dun_id = 10374,
			unit_id = {
				71373
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2121
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3686490,
			res_id = 8,
			id = 38,
			order_id = 5,
			dun_id = 10375,
			unit_id = {
				71374
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2222
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3685888,
			res_id = 8,
			id = 38,
			order_id = 6,
			dun_id = 10376,
			unit_id = {
				71375
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2124
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3708002,
			res_id = 8,
			id = 38,
			order_id = 7,
			dun_id = 10377,
			unit_id = {
				71376
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3744630,
			res_id = 6,
			id = 38,
			order_id = 8,
			dun_id = 10378,
			unit_id = {
				71377
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2022
				},
				{
					3,
					3202
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3766689,
			res_id = 8,
			id = 38,
			order_id = 9,
			dun_id = 10379,
			unit_id = {
				71378
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2391
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 1,
			power = 3825793,
			res_id = 10,
			id = 38,
			order_id = 10,
			dun_id = 10380,
			unit_id = {
				71379,
				72379
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2224
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 3721514,
			res_id = 8,
			id = 39,
			order_id = 1,
			dun_id = 10381,
			unit_id = {
				71380
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2404
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3730003,
			res_id = 8,
			id = 39,
			order_id = 2,
			dun_id = 10382,
			unit_id = {
				71381
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3776914,
			res_id = 8,
			id = 39,
			order_id = 3,
			dun_id = 10383,
			unit_id = {
				71382
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2113
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3801222,
			res_id = 6,
			id = 39,
			order_id = 4,
			dun_id = 10384,
			unit_id = {
				71383
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2015
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3811956,
			res_id = 8,
			id = 39,
			order_id = 5,
			dun_id = 10385,
			unit_id = {
				71384
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3836189,
			res_id = 8,
			id = 39,
			order_id = 6,
			dun_id = 10386,
			unit_id = {
				71385
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2012
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3860443,
			res_id = 8,
			id = 39,
			order_id = 7,
			dun_id = 10387,
			unit_id = {
				71386
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2221
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3869852,
			res_id = 6,
			id = 39,
			order_id = 8,
			dun_id = 10388,
			unit_id = {
				71387
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2025
				},
				{
					3,
					3202
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3894088,
			res_id = 8,
			id = 39,
			order_id = 9,
			dun_id = 10389,
			unit_id = {
				71388
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 1,
			power = 3963667,
			res_id = 10,
			id = 39,
			order_id = 10,
			dun_id = 10390,
			unit_id = {
				71389,
				72389
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2022
				},
				{
					3,
					3202
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 3873423,
			res_id = 6,
			id = 40,
			order_id = 1,
			dun_id = 10391,
			unit_id = {
				71390
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2405
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3894010,
			res_id = 6,
			id = 40,
			order_id = 2,
			dun_id = 10392,
			unit_id = {
				71391
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2014
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3905636,
			res_id = 6,
			id = 40,
			order_id = 3,
			dun_id = 10393,
			unit_id = {
				71392
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2403
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3939424,
			res_id = 7,
			id = 40,
			order_id = 4,
			dun_id = 10394,
			unit_id = {
				71393
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3963667,
			res_id = 6,
			id = 40,
			order_id = 5,
			dun_id = 10395,
			unit_id = {
				71394
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2392
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 3986829,
			res_id = 6,
			id = 40,
			order_id = 6,
			dun_id = 10396,
			unit_id = {
				71395
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2124
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 4008954,
			res_id = 6,
			id = 40,
			order_id = 7,
			dun_id = 10397,
			unit_id = {
				71396
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					2212
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 4021216,
			res_id = 7,
			id = 40,
			order_id = 8,
			dun_id = 10398,
			unit_id = {
				71397
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2224
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 0,
			power = 4031494,
			res_id = 6,
			id = 40,
			order_id = 9,
			dun_id = 10399,
			unit_id = {
				71398
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		},
		{
			type = 1,
			power = 4077703,
			res_id = 9,
			id = 40,
			order_id = 10,
			dun_id = 10400,
			unit_id = {
				71399,
				72399
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2224
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					30
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					10
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 3981413,
			res_id = 7,
			id = 41,
			order_id = 1,
			dun_id = 10401,
			unit_id = {
				71400
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2303
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4020138,
			res_id = 7,
			id = 41,
			order_id = 2,
			dun_id = 10402,
			unit_id = {
				71401
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4055256,
			res_id = 7,
			id = 41,
			order_id = 3,
			dun_id = 10403,
			unit_id = {
				71402
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2115
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4055693,
			res_id = 8,
			id = 41,
			order_id = 4,
			dun_id = 10404,
			unit_id = {
				71403
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2015
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4102648,
			res_id = 7,
			id = 41,
			order_id = 5,
			dun_id = 10405,
			unit_id = {
				71404
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2015
				},
				{
					3,
					2014
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4113862,
			res_id = 7,
			id = 41,
			order_id = 6,
			dun_id = 10406,
			unit_id = {
				71405
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2125
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4140473,
			res_id = 7,
			id = 41,
			order_id = 7,
			dun_id = 10407,
			unit_id = {
				71406
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4172250,
			res_id = 8,
			id = 41,
			order_id = 8,
			dun_id = 10408,
			unit_id = {
				71407
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2033
				},
				{
					3,
					3202
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4183353,
			res_id = 7,
			id = 41,
			order_id = 9,
			dun_id = 10409,
			unit_id = {
				71408
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2015
				},
				{
					3,
					2014
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 1,
			power = 4229703,
			res_id = 10,
			id = 41,
			order_id = 10,
			dun_id = 10410,
			unit_id = {
				71409,
				72409
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2035
				},
				{
					3,
					3202
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 4139408,
			res_id = 8,
			id = 42,
			order_id = 1,
			dun_id = 10411,
			unit_id = {
				71410
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2302
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4142564,
			res_id = 8,
			id = 42,
			order_id = 2,
			dun_id = 10412,
			unit_id = {
				71411
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2012
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4193293,
			res_id = 8,
			id = 42,
			order_id = 3,
			dun_id = 10413,
			unit_id = {
				71412
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2111
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4219733,
			res_id = 6,
			id = 42,
			order_id = 4,
			dun_id = 10414,
			unit_id = {
				71413
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2123
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4229703,
			res_id = 8,
			id = 42,
			order_id = 5,
			dun_id = 10415,
			unit_id = {
				71414
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4265043,
			res_id = 8,
			id = 42,
			order_id = 6,
			dun_id = 10416,
			unit_id = {
				71415
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2014
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4276133,
			res_id = 8,
			id = 42,
			order_id = 7,
			dun_id = 10417,
			unit_id = {
				71416
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4300344,
			res_id = 6,
			id = 42,
			order_id = 8,
			dun_id = 10418,
			unit_id = {
				71417
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2224
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4323434,
			res_id = 8,
			id = 42,
			order_id = 9,
			dun_id = 10419,
			unit_id = {
				71418
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2222
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 1,
			power = 4380037,
			res_id = 10,
			id = 42,
			order_id = 10,
			dun_id = 10420,
			unit_id = {
				71419,
				72419
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2224
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 4288318,
			res_id = 6,
			id = 43,
			order_id = 1,
			dun_id = 10421,
			unit_id = {
				71420
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2115
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4281004,
			res_id = 6,
			id = 43,
			order_id = 2,
			dun_id = 10422,
			unit_id = {
				71421
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2011
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4325402,
			res_id = 6,
			id = 43,
			order_id = 3,
			dun_id = 10423,
			unit_id = {
				71422
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2304
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4346593,
			res_id = 7,
			id = 43,
			order_id = 4,
			dun_id = 10424,
			unit_id = {
				71423
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4355415,
			res_id = 6,
			id = 43,
			order_id = 5,
			dun_id = 10425,
			unit_id = {
				71424
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4405311,
			res_id = 6,
			id = 43,
			order_id = 6,
			dun_id = 10426,
			unit_id = {
				71425
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4426498,
			res_id = 6,
			id = 43,
			order_id = 7,
			dun_id = 10427,
			unit_id = {
				71426
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					2212
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4452740,
			res_id = 7,
			id = 43,
			order_id = 8,
			dun_id = 10428,
			unit_id = {
				71427
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2032
				},
				{
					3,
					3202
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4462388,
			res_id = 6,
			id = 43,
			order_id = 9,
			dun_id = 10429,
			unit_id = {
				71428
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2391
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 1,
			power = 4507699,
			res_id = 9,
			id = 43,
			order_id = 10,
			dun_id = 10430,
			unit_id = {
				71429,
				72429
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2224
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 4405034,
			res_id = 7,
			id = 44,
			order_id = 1,
			dun_id = 10431,
			unit_id = {
				71430
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2403
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4450680,
			res_id = 7,
			id = 44,
			order_id = 2,
			dun_id = 10432,
			unit_id = {
				71431
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4451460,
			res_id = 7,
			id = 44,
			order_id = 3,
			dun_id = 10433,
			unit_id = {
				71432
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2115
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4495975,
			res_id = 8,
			id = 44,
			order_id = 4,
			dun_id = 10434,
			unit_id = {
				71433
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4521215,
			res_id = 7,
			id = 44,
			order_id = 5,
			dun_id = 10435,
			unit_id = {
				71434
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					2212
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4517379,
			res_id = 7,
			id = 44,
			order_id = 6,
			dun_id = 10436,
			unit_id = {
				71435
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4558983,
			res_id = 7,
			id = 44,
			order_id = 7,
			dun_id = 10437,
			unit_id = {
				71436
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					2212
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4578232,
			res_id = 8,
			id = 44,
			order_id = 8,
			dun_id = 10438,
			unit_id = {
				71437
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2032
				},
				{
					3,
					3203
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 0,
			power = 4586775,
			res_id = 7,
			id = 44,
			order_id = 9,
			dun_id = 10439,
			unit_id = {
				71438
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		},
		{
			type = 1,
			power = 4654255,
			res_id = 10,
			id = 44,
			order_id = 10,
			dun_id = 10440,
			unit_id = {
				71439,
				72439
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2035
				},
				{
					3,
					3203
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					33
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					11
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 4539524,
			res_id = 8,
			id = 45,
			order_id = 1,
			dun_id = 10441,
			unit_id = {
				71440
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2111
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4588799,
			res_id = 8,
			id = 45,
			order_id = 2,
			dun_id = 10442,
			unit_id = {
				71441
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4600385,
			res_id = 8,
			id = 45,
			order_id = 3,
			dun_id = 10443,
			unit_id = {
				71442
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2114
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4636309,
			res_id = 6,
			id = 45,
			order_id = 4,
			dun_id = 10444,
			unit_id = {
				71443
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4637307,
			res_id = 8,
			id = 45,
			order_id = 5,
			dun_id = 10445,
			unit_id = {
				71444
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2011
				},
				{
					3,
					2013
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4656155,
			res_id = 8,
			id = 45,
			order_id = 6,
			dun_id = 10446,
			unit_id = {
				71445
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2211
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4710205,
			res_id = 8,
			id = 45,
			order_id = 7,
			dun_id = 10447,
			unit_id = {
				71446
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2391
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4702487,
			res_id = 6,
			id = 45,
			order_id = 8,
			dun_id = 10448,
			unit_id = {
				71447
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2035
				},
				{
					3,
					3203
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4725664,
			res_id = 8,
			id = 45,
			order_id = 9,
			dun_id = 10449,
			unit_id = {
				71448
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2212
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 1,
			power = 4803375,
			res_id = 10,
			id = 45,
			order_id = 10,
			dun_id = 10450,
			unit_id = {
				71449,
				72449
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2224
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 4705845,
			res_id = 6,
			id = 46,
			order_id = 1,
			dun_id = 10451,
			unit_id = {
				71450
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2302
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4727008,
			res_id = 6,
			id = 46,
			order_id = 2,
			dun_id = 10452,
			unit_id = {
				71451
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2124
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4752254,
			res_id = 6,
			id = 46,
			order_id = 3,
			dun_id = 10453,
			unit_id = {
				71452
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2114
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4749808,
			res_id = 7,
			id = 46,
			order_id = 4,
			dun_id = 10454,
			unit_id = {
				71453
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4798680,
			res_id = 6,
			id = 46,
			order_id = 5,
			dun_id = 10455,
			unit_id = {
				71454
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2393
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4795024,
			res_id = 6,
			id = 46,
			order_id = 6,
			dun_id = 10456,
			unit_id = {
				71455
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2125
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4849851,
			res_id = 6,
			id = 46,
			order_id = 7,
			dun_id = 10457,
			unit_id = {
				71456
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4870127,
			res_id = 7,
			id = 46,
			order_id = 8,
			dun_id = 10458,
			unit_id = {
				71457
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2033
				},
				{
					3,
					3203
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4879356,
			res_id = 6,
			id = 46,
			order_id = 9,
			dun_id = 10459,
			unit_id = {
				71458
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2393
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 1,
			power = 4911671,
			res_id = 9,
			id = 46,
			order_id = 10,
			dun_id = 10460,
			unit_id = {
				71459,
				72459
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2034
				},
				{
					3,
					3203
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 4842996,
			res_id = 7,
			id = 47,
			order_id = 1,
			dun_id = 10461,
			unit_id = {
				71460
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2402
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4842269,
			res_id = 7,
			id = 47,
			order_id = 2,
			dun_id = 10462,
			unit_id = {
				71461
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4891351,
			res_id = 7,
			id = 47,
			order_id = 3,
			dun_id = 10463,
			unit_id = {
				71462
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2403
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4914564,
			res_id = 8,
			id = 47,
			order_id = 4,
			dun_id = 10464,
			unit_id = {
				71463
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2123
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4937759,
			res_id = 7,
			id = 47,
			order_id = 5,
			dun_id = 10465,
			unit_id = {
				71464
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2214
				},
				{
					3,
					2211
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4947881,
			res_id = 7,
			id = 47,
			order_id = 6,
			dun_id = 10466,
			unit_id = {
				71465
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2014
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4983155,
			res_id = 7,
			id = 47,
			order_id = 7,
			dun_id = 10467,
			unit_id = {
				71466
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2221
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 4980121,
			res_id = 8,
			id = 47,
			order_id = 8,
			dun_id = 10468,
			unit_id = {
				71467
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2223
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 5015485,
			res_id = 7,
			id = 47,
			order_id = 9,
			dun_id = 10469,
			unit_id = {
				71468
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					2212
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 1,
			power = 5063754,
			res_id = 10,
			id = 47,
			order_id = 10,
			dun_id = 10470,
			unit_id = {
				71469,
				72469
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2033
				},
				{
					3,
					3203
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		}
	},
	{
		{
			type = 0,
			power = 4990480,
			res_id = 8,
			id = 48,
			order_id = 1,
			dun_id = 10471,
			unit_id = {
				71470
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2401
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 5013795,
			res_id = 8,
			id = 48,
			order_id = 2,
			dun_id = 10472,
			unit_id = {
				71471
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2013
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 5029619,
			res_id = 8,
			id = 48,
			order_id = 3,
			dun_id = 10473,
			unit_id = {
				71472
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2404
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 5027333,
			res_id = 6,
			id = 48,
			order_id = 4,
			dun_id = 10474,
			unit_id = {
				71473
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2124
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 5076033,
			res_id = 8,
			id = 48,
			order_id = 5,
			dun_id = 10475,
			unit_id = {
				71474
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2221
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 5093669,
			res_id = 8,
			id = 48,
			order_id = 6,
			dun_id = 10476,
			unit_id = {
				71475
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2011
				},
				{
					3,
					3004
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 5123378,
			res_id = 8,
			id = 48,
			order_id = 7,
			dun_id = 10477,
			unit_id = {
				71476
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2213
				},
				{
					3,
					2212
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 5132307,
			res_id = 6,
			id = 48,
			order_id = 8,
			dun_id = 10478,
			unit_id = {
				71477
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2031
				},
				{
					3,
					3203
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 0,
			power = 5156372,
			res_id = 8,
			id = 48,
			order_id = 9,
			dun_id = 10479,
			unit_id = {
				71478
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2394
				},
				{
					3,
					3101
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		},
		{
			type = 1,
			power = 5216184,
			res_id = 10,
			id = 48,
			order_id = 10,
			dun_id = 10480,
			unit_id = {
				71479,
				72479
			},
			f_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			f_drops = {},
			auto_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			},
			auto_drops = {},
			cond_info = {
				{
					1,
					1001
				},
				{
					2,
					2034
				},
				{
					3,
					3203
				}
			},
			f_show_award = {
				{
					3,
					50
				},
				{
					28,
					40
				},
				{
					10030,
					36
				}
			},
			show_award = {
				{
					28,
					30
				},
				{
					10030,
					12
				}
			}
		}
	}
}
Config.DungeonHeavenData.data_customs_num_length = 48
Config.DungeonHeavenData.data_customs_num = {
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10
}
Config.DungeonHeavenData.data_chapter_length = 48
Config.DungeonHeavenData.data_chapter = {
	{
		bust_id = 12,
		limit_id = 0,
		type = "第一章",
		map_id = 84,
		pos_id = 1,
		id = 1,
		ico = 1,
		cond_info = {},
		check_open = {}
	},
	{
		bust_id = 1,
		limit_id = 0,
		type = "第二章",
		map_id = 84,
		pos_id = 2,
		id = 2,
		ico = 2,
		cond_info = {},
		check_open = {}
	},
	{
		bust_id = 2,
		limit_id = 0,
		type = "第三章",
		map_id = 84,
		pos_id = 3,
		id = 3,
		ico = 3,
		cond_info = {},
		check_open = {}
	},
	{
		bust_id = 3,
		limit_id = 0,
		type = "第四章",
		map_id = 84,
		pos_id = 4,
		id = 4,
		ico = 4,
		cond_info = {},
		check_open = {
			6
		}
	},
	{
		bust_id = 4,
		limit_id = 0,
		type = "第五章",
		map_id = 84,
		pos_id = 1,
		id = 5,
		ico = 5,
		cond_info = {},
		check_open = {
			7
		}
	},
	{
		bust_id = 5,
		limit_id = 0,
		type = "第六章",
		map_id = 84,
		pos_id = 2,
		id = 6,
		ico = 6,
		cond_info = {
			{
				4,
				20
			}
		},
		check_open = {
			8
		}
	},
	{
		bust_id = 6,
		limit_id = 6,
		type = "第七章",
		map_id = 84,
		pos_id = 3,
		id = 7,
		ico = 7,
		cond_info = {
			{
				5,
				20
			}
		},
		check_open = {
			9
		}
	},
	{
		bust_id = 7,
		limit_id = 7,
		type = "第八章",
		map_id = 84,
		pos_id = 4,
		id = 8,
		ico = 8,
		cond_info = {
			{
				6,
				20
			}
		},
		check_open = {
			10
		}
	},
	{
		bust_id = 8,
		limit_id = 8,
		type = "第九章",
		map_id = 84,
		pos_id = 1,
		id = 9,
		ico = 9,
		cond_info = {
			{
				7,
				20
			}
		},
		check_open = {
			11
		}
	},
	{
		bust_id = 9,
		limit_id = 9,
		type = "第十章",
		map_id = 84,
		pos_id = 2,
		id = 10,
		ico = 10,
		cond_info = {
			{
				8,
				20
			}
		},
		check_open = {
			12
		}
	},
	{
		bust_id = 10,
		limit_id = 10,
		type = "第十一章",
		map_id = 84,
		pos_id = 3,
		id = 11,
		ico = 11,
		cond_info = {
			{
				9,
				20
			}
		},
		check_open = {
			13
		}
	},
	{
		bust_id = 11,
		limit_id = 11,
		type = "第十二章",
		map_id = 84,
		pos_id = 4,
		id = 12,
		ico = 12,
		cond_info = {
			{
				10,
				20
			}
		},
		check_open = {
			14
		}
	},
	{
		bust_id = 12,
		limit_id = 12,
		type = "第十三章",
		map_id = 84,
		pos_id = 1,
		id = 13,
		ico = 13,
		cond_info = {
			{
				11,
				20
			}
		},
		check_open = {
			15
		}
	},
	{
		bust_id = 1,
		limit_id = 13,
		type = "第十四章",
		map_id = 84,
		pos_id = 2,
		id = 14,
		ico = 14,
		cond_info = {
			{
				12,
				20
			}
		},
		check_open = {
			16
		}
	},
	{
		bust_id = 2,
		limit_id = 14,
		type = "第十五章",
		map_id = 84,
		pos_id = 3,
		id = 15,
		ico = 15,
		cond_info = {
			{
				13,
				20
			}
		},
		check_open = {
			17
		}
	},
	{
		bust_id = 3,
		limit_id = 15,
		type = "第十六章",
		map_id = 84,
		pos_id = 4,
		id = 16,
		ico = 16,
		cond_info = {
			{
				14,
				20
			}
		},
		check_open = {
			18
		}
	},
	{
		bust_id = 4,
		limit_id = 16,
		type = "第十七章",
		map_id = 84,
		pos_id = 1,
		id = 17,
		ico = 17,
		cond_info = {
			{
				15,
				20
			}
		},
		check_open = {
			19
		}
	},
	{
		bust_id = 5,
		limit_id = 17,
		type = "第十八章",
		map_id = 84,
		pos_id = 2,
		id = 18,
		ico = 18,
		cond_info = {
			{
				16,
				20
			}
		},
		check_open = {
			20
		}
	},
	{
		bust_id = 6,
		limit_id = 18,
		type = "第十九章",
		map_id = 84,
		pos_id = 3,
		id = 19,
		ico = 19,
		cond_info = {
			{
				17,
				20
			}
		},
		check_open = {
			21
		}
	},
	{
		bust_id = 7,
		limit_id = 19,
		type = "第二十章",
		map_id = 84,
		pos_id = 4,
		id = 20,
		ico = 20,
		cond_info = {
			{
				18,
				20
			}
		},
		check_open = {
			22
		}
	},
	{
		bust_id = 8,
		limit_id = 20,
		type = "第二十一章",
		map_id = 84,
		pos_id = 1,
		id = 21,
		ico = 21,
		cond_info = {
			{
				19,
				20
			}
		},
		check_open = {
			23
		}
	},
	{
		bust_id = 9,
		limit_id = 21,
		type = "第二十二章",
		map_id = 84,
		pos_id = 2,
		id = 22,
		ico = 22,
		cond_info = {
			{
				20,
				20
			}
		},
		check_open = {
			24
		}
	},
	{
		bust_id = 10,
		limit_id = 22,
		type = "第二十三章",
		map_id = 84,
		pos_id = 3,
		id = 23,
		ico = 23,
		cond_info = {
			{
				21,
				20
			}
		},
		check_open = {
			25
		}
	},
	{
		bust_id = 11,
		limit_id = 23,
		type = "第二十四章",
		map_id = 84,
		pos_id = 4,
		id = 24,
		ico = 24,
		cond_info = {
			{
				22,
				20
			}
		},
		check_open = {
			26
		}
	},
	{
		bust_id = 12,
		limit_id = 24,
		type = "第二十五章",
		map_id = 84,
		pos_id = 1,
		id = 25,
		ico = 25,
		cond_info = {
			{
				23,
				20
			}
		},
		check_open = {
			27
		}
	},
	{
		bust_id = 1,
		limit_id = 25,
		type = "第二十六章",
		map_id = 84,
		pos_id = 2,
		id = 26,
		ico = 26,
		cond_info = {
			{
				24,
				20
			}
		},
		check_open = {
			28
		}
	},
	{
		bust_id = 2,
		limit_id = 26,
		type = "第二十七章",
		map_id = 84,
		pos_id = 3,
		id = 27,
		ico = 27,
		cond_info = {
			{
				25,
				20
			}
		},
		check_open = {
			29
		}
	},
	{
		bust_id = 3,
		limit_id = 27,
		type = "第二十八章",
		map_id = 84,
		pos_id = 4,
		id = 28,
		ico = 28,
		cond_info = {
			{
				26,
				20
			}
		},
		check_open = {
			30
		}
	},
	{
		bust_id = 4,
		limit_id = 28,
		type = "第二十九章",
		map_id = 84,
		pos_id = 1,
		id = 29,
		ico = 29,
		cond_info = {
			{
				27,
				20
			}
		},
		check_open = {
			31
		}
	},
	{
		bust_id = 5,
		limit_id = 29,
		type = "第三十章",
		map_id = 84,
		pos_id = 2,
		id = 30,
		ico = 30,
		cond_info = {
			{
				28,
				20
			}
		},
		check_open = {
			32
		}
	},
	{
		bust_id = 6,
		limit_id = 30,
		type = "第三十一章",
		map_id = 84,
		pos_id = 3,
		id = 31,
		ico = 31,
		cond_info = {
			{
				29,
				20
			}
		},
		check_open = {
			33
		}
	},
	{
		bust_id = 7,
		limit_id = 31,
		type = "第三十二章",
		map_id = 84,
		pos_id = 4,
		id = 32,
		ico = 32,
		cond_info = {
			{
				30,
				20
			}
		},
		check_open = {
			34
		}
	},
	{
		bust_id = 8,
		limit_id = 32,
		type = "第三十三章",
		map_id = 84,
		pos_id = 1,
		id = 33,
		ico = 33,
		cond_info = {
			{
				31,
				20
			}
		},
		check_open = {
			35
		}
	},
	{
		bust_id = 9,
		limit_id = 33,
		type = "第三十四章",
		map_id = 84,
		pos_id = 2,
		id = 34,
		ico = 34,
		cond_info = {
			{
				32,
				20
			}
		},
		check_open = {
			36
		}
	},
	{
		bust_id = 10,
		limit_id = 34,
		type = "第三十五章",
		map_id = 84,
		pos_id = 3,
		id = 35,
		ico = 35,
		cond_info = {
			{
				33,
				20
			}
		},
		check_open = {
			37
		}
	},
	{
		bust_id = 11,
		limit_id = 35,
		type = "第三十六章",
		map_id = 84,
		pos_id = 4,
		id = 36,
		ico = 36,
		cond_info = {
			{
				34,
				20
			}
		},
		check_open = {
			38
		}
	},
	{
		bust_id = 12,
		limit_id = 36,
		type = "第三十七章",
		map_id = 84,
		pos_id = 1,
		id = 37,
		ico = 37,
		cond_info = {
			{
				35,
				20
			}
		},
		check_open = {
			39
		}
	},
	{
		bust_id = 1,
		limit_id = 37,
		type = "第三十八章",
		map_id = 84,
		pos_id = 2,
		id = 38,
		ico = 38,
		cond_info = {
			{
				36,
				20
			}
		},
		check_open = {
			40
		}
	},
	{
		bust_id = 2,
		limit_id = 38,
		type = "第三十九章",
		map_id = 84,
		pos_id = 3,
		id = 39,
		ico = 39,
		cond_info = {
			{
				37,
				20
			}
		},
		check_open = {
			41
		}
	},
	{
		bust_id = 3,
		limit_id = 39,
		type = "第四十章",
		map_id = 84,
		pos_id = 4,
		id = 40,
		ico = 40,
		cond_info = {
			{
				38,
				20
			}
		},
		check_open = {
			42
		}
	},
	{
		bust_id = 4,
		limit_id = 40,
		type = "第四十一章",
		map_id = 84,
		pos_id = 1,
		id = 41,
		ico = 41,
		cond_info = {
			{
				39,
				20
			}
		},
		check_open = {
			43
		}
	},
	{
		bust_id = 5,
		limit_id = 41,
		type = "第四十二章",
		map_id = 84,
		pos_id = 2,
		id = 42,
		ico = 42,
		cond_info = {
			{
				40,
				20
			}
		},
		check_open = {
			44
		}
	},
	{
		bust_id = 6,
		limit_id = 42,
		type = "第四十三章",
		map_id = 84,
		pos_id = 3,
		id = 43,
		ico = 43,
		cond_info = {
			{
				41,
				20
			}
		},
		check_open = {
			45
		}
	},
	{
		bust_id = 7,
		limit_id = 43,
		type = "第四十四章",
		map_id = 84,
		pos_id = 4,
		id = 44,
		ico = 44,
		cond_info = {
			{
				42,
				20
			}
		},
		check_open = {
			46
		}
	},
	{
		bust_id = 8,
		limit_id = 44,
		type = "第四十五章",
		map_id = 84,
		pos_id = 1,
		id = 45,
		ico = 45,
		cond_info = {
			{
				43,
				20
			}
		},
		check_open = {
			47
		}
	},
	{
		bust_id = 9,
		limit_id = 45,
		type = "第四十六章",
		map_id = 84,
		pos_id = 2,
		id = 46,
		ico = 46,
		cond_info = {
			{
				44,
				20
			}
		},
		check_open = {
			48
		}
	},
	{
		bust_id = 10,
		limit_id = 46,
		type = "第四十七章",
		map_id = 84,
		pos_id = 3,
		id = 47,
		ico = 47,
		cond_info = {
			{
				45,
				20
			}
		},
		check_open = {}
	},
	{
		bust_id = 11,
		limit_id = 47,
		type = "第四十八章",
		map_id = 84,
		pos_id = 4,
		id = 48,
		ico = 48,
		cond_info = {
			{
				46,
				20
			}
		},
		check_open = {}
	}
}

function Config.DungeonHeavenData.data_chapter_fun(slot0)
	slot1 = Config.DungeonHeavenData.data_chapter[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DungeonHeavenData.data_chapter[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.DungeonHeavenData.data_star_award_length = 48
Config.DungeonHeavenData.data_star_award = {
	{
		{
			award_id = 1,
			id = 1,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					1010103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 1,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					1010101,
					1
				},
				{
					17210,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 1,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					1010102,
					1
				},
				{
					1010104,
					1
				},
				{
					17210,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 2,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					2010103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 2,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					2010101,
					1
				},
				{
					17210,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 2,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					2010102,
					1
				},
				{
					2010104,
					1
				},
				{
					17210,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 3,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					3010103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 3,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					3010101,
					1
				},
				{
					17210,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 3,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					3010102,
					1
				},
				{
					3010104,
					1
				},
				{
					17210,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 4,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					4010103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 4,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					4010101,
					1
				},
				{
					17210,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 4,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					4010102,
					1
				},
				{
					4010104,
					1
				},
				{
					17210,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 5,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					5010103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 5,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					5010101,
					1
				},
				{
					17210,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 5,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					5010102,
					1
				},
				{
					5010104,
					1
				},
				{
					17210,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 6,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					6010103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 6,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					6010101,
					1
				},
				{
					17210,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 6,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					6010102,
					1
				},
				{
					6010104,
					1
				},
				{
					17210,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 7,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					7010103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 7,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					7010101,
					1
				},
				{
					17210,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 7,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					7010102,
					1
				},
				{
					7010104,
					1
				},
				{
					17210,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 8,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					8010103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 8,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					8010101,
					1
				},
				{
					17210,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 8,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					8010102,
					1
				},
				{
					8010104,
					1
				},
				{
					17210,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 9,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					9010103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 9,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					9010101,
					1
				},
				{
					17210,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 9,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					9010102,
					1
				},
				{
					9010104,
					1
				},
				{
					17210,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 10,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					10010103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 10,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					10010101,
					1
				},
				{
					17210,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 10,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					10010102,
					1
				},
				{
					10010104,
					1
				},
				{
					17210,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 11,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					11010103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 11,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					11010101,
					1
				},
				{
					17210,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 11,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					11010102,
					1
				},
				{
					11010104,
					1
				},
				{
					17210,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 12,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					12010103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 12,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					12010101,
					1
				},
				{
					17210,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 12,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					12010102,
					1
				},
				{
					12010104,
					1
				},
				{
					17210,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 13,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					1020103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 13,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					1020101,
					1
				},
				{
					17210,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 13,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					1020102,
					1
				},
				{
					1020104,
					1
				},
				{
					17210,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 14,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					2020103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 14,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					2020101,
					1
				},
				{
					17210,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 14,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					2020102,
					1
				},
				{
					2020104,
					1
				},
				{
					17210,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 15,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					3020103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 15,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					3020101,
					1
				},
				{
					17210,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 15,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					3020102,
					1
				},
				{
					3020104,
					1
				},
				{
					17210,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 16,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					4020103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 16,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					4020101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 16,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					4020102,
					1
				},
				{
					4020104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 17,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					5020103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 17,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					5020101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 17,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					5020102,
					1
				},
				{
					5020104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 18,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					6020103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 18,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					6020101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 18,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					6020102,
					1
				},
				{
					6020104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 19,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					7020103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 19,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					7020101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 19,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					7020102,
					1
				},
				{
					7020104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 20,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					8020103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 20,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					8020101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 20,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					8020102,
					1
				},
				{
					8020104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 21,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					9020103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 21,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					9020101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 21,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					9020102,
					1
				},
				{
					9020104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 22,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					10020103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 22,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					10020101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 22,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					10020102,
					1
				},
				{
					10020104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 23,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					11020103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 23,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					11020101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 23,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					11020102,
					1
				},
				{
					11020104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 24,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					12020103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 24,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					12020101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 24,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					12020102,
					1
				},
				{
					12020104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 25,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					1030103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 25,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					1030101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 25,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					1030102,
					1
				},
				{
					1030104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 26,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					2030103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 26,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					2030101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 26,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					2030102,
					1
				},
				{
					2030104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 27,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					3030103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 27,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					3030101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 27,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					3030102,
					1
				},
				{
					3030104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 28,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					4030103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 28,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					4030101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 28,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					4030102,
					1
				},
				{
					4030104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 29,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					5030103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 29,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					5030101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 29,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					5030102,
					1
				},
				{
					5030104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 30,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					6030103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 30,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					6030101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 30,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					6030102,
					1
				},
				{
					6030104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 31,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					7030103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 31,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					7030101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 31,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					7030102,
					1
				},
				{
					7030104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 32,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					8030103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 32,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					8030101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 32,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					8030102,
					1
				},
				{
					8030104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 33,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					9030103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 33,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					9030101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 33,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					9030102,
					1
				},
				{
					9030104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 34,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					10030103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 34,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					10030101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 34,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					10030102,
					1
				},
				{
					10030104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 35,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					11030103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 35,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					11030101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 35,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					11030102,
					1
				},
				{
					11030104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 36,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					12030103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 36,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					12030101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 36,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					12030102,
					1
				},
				{
					12030104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 37,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					1040103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 37,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					1040101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 37,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					1040102,
					1
				},
				{
					1040104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 38,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					2040103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 38,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					2040101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 38,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					2040102,
					1
				},
				{
					2040104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 39,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					3040103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 39,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					3040101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 39,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					3040102,
					1
				},
				{
					3040104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 40,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					4040103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 40,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					4040101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 40,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					4040102,
					1
				},
				{
					4040104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 41,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					5040103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 41,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					5040101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 41,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					5040102,
					1
				},
				{
					5040104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 42,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					6040103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 42,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					6040101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 42,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					6040102,
					1
				},
				{
					6040104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 43,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					7040103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 43,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					7040101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 43,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					7040102,
					1
				},
				{
					7040104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 44,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					8040103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 44,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					8040101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 44,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					8040102,
					1
				},
				{
					8040104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 45,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					9040103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 45,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					9040101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 45,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					9040102,
					1
				},
				{
					9040104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 46,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					10040103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 46,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					10040101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 46,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					10040102,
					1
				},
				{
					10040104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 47,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					11040103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 47,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					11040101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 47,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					11040102,
					1
				},
				{
					11040104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	},
	{
		{
			award_id = 1,
			id = 48,
			effect_id = 109,
			limit_star = 10,
			award = {
				{
					12040103,
					1
				},
				{
					28,
					5
				}
			}
		},
		{
			award_id = 2,
			id = 48,
			effect_id = 108,
			limit_star = 20,
			award = {
				{
					12040101,
					1
				},
				{
					17211,
					1
				}
			}
		},
		{
			award_id = 3,
			id = 48,
			effect_id = 110,
			limit_star = 30,
			award = {
				{
					12040102,
					1
				},
				{
					12040104,
					1
				},
				{
					17211,
					1
				}
			}
		}
	}
}
Config.DungeonHeavenData.data_star_cond_length = 86
Config.DungeonHeavenData.data_star_cond = {
	[1001] = {
		id = 1001,
		type = "战斗胜利",
		condition = {
			{
				"combat_result",
				"==",
				1
			}
		}
	},
	[2001] = {
		id = 2001,
		type = "至少上阵1位海贼新星英雄",
		condition = {
			{
				{
					"combat_camp_type",
					1
				},
				">=",
				1
			}
		}
	},
	[2002] = {
		id = 2002,
		type = "至少上阵1位草帽团英雄",
		condition = {
			{
				{
					"combat_camp_type",
					2
				},
				">=",
				1
			}
		}
	},
	[2003] = {
		id = 2003,
		type = "至少上阵1位强者英雄",
		condition = {
			{
				{
					"combat_camp_type",
					3
				},
				">=",
				1
			}
		}
	},
	[2004] = {
		id = 2004,
		type = "至少上阵1位海军英雄",
		condition = {
			{
				{
					"combat_camp_type",
					4
				},
				">=",
				1
			}
		}
	},
	[2005] = {
		id = 2005,
		type = "至少上阵1位皇团英雄",
		condition = {
			{
				{
					"combat_camp_type",
					5
				},
				">=",
				1
			}
		}
	},
	[2011] = {
		id = 2011,
		type = "至少上阵2位海贼新星英雄",
		condition = {
			{
				{
					"combat_camp_type",
					1
				},
				">=",
				2
			}
		}
	},
	[2012] = {
		id = 2012,
		type = "至少上阵2位草帽联盟英雄",
		condition = {
			{
				{
					"combat_camp_type",
					2
				},
				">=",
				2
			}
		}
	},
	[2013] = {
		id = 2013,
		type = "至少上阵2位强者英雄",
		condition = {
			{
				{
					"combat_camp_type",
					3
				},
				">=",
				2
			}
		}
	},
	[2014] = {
		id = 2014,
		type = "至少上阵2位海军英雄",
		condition = {
			{
				{
					"combat_camp_type",
					4
				},
				">=",
				2
			}
		}
	},
	[2015] = {
		id = 2015,
		type = "至少上阵2位皇团英雄",
		condition = {
			{
				{
					"combat_camp_type",
					5
				},
				">=",
				2
			}
		}
	},
	[2021] = {
		id = 2021,
		type = "至少上阵3位海贼新星英雄",
		condition = {
			{
				{
					"combat_camp_type",
					1
				},
				">=",
				3
			}
		}
	},
	[2022] = {
		id = 2022,
		type = "至少上阵3位草帽联盟英雄",
		condition = {
			{
				{
					"combat_camp_type",
					2
				},
				">=",
				3
			}
		}
	},
	[2023] = {
		id = 2023,
		type = "至少上阵3位强者英雄",
		condition = {
			{
				{
					"combat_camp_type",
					3
				},
				">=",
				3
			}
		}
	},
	[2024] = {
		id = 2024,
		type = "至少上阵3位海军英雄",
		condition = {
			{
				{
					"combat_camp_type",
					4
				},
				">=",
				3
			}
		}
	},
	[2025] = {
		id = 2025,
		type = "至少上阵3位皇团英雄",
		condition = {
			{
				{
					"combat_camp_type",
					5
				},
				">=",
				3
			}
		}
	},
	[2031] = {
		id = 2031,
		type = "至少上阵4位海贼新星英雄",
		condition = {
			{
				{
					"combat_camp_type",
					1
				},
				">=",
				4
			}
		}
	},
	[2032] = {
		id = 2032,
		type = "至少上阵4位草帽联盟英雄",
		condition = {
			{
				{
					"combat_camp_type",
					2
				},
				">=",
				4
			}
		}
	},
	[2033] = {
		id = 2033,
		type = "至少上阵4位强者英雄",
		condition = {
			{
				{
					"combat_camp_type",
					3
				},
				">=",
				4
			}
		}
	},
	[2034] = {
		id = 2034,
		type = "至少上阵4位海军英雄",
		condition = {
			{
				{
					"combat_camp_type",
					4
				},
				">=",
				4
			}
		}
	},
	[2035] = {
		id = 2035,
		type = "至少上阵4位皇团英雄",
		condition = {
			{
				{
					"combat_camp_type",
					5
				},
				">=",
				4
			}
		}
	},
	[2041] = {
		id = 2041,
		type = "至少上阵5位海贼新星英雄",
		condition = {
			{
				{
					"combat_camp_type",
					1
				},
				">=",
				5
			}
		}
	},
	[2042] = {
		id = 2042,
		type = "至少上阵5位草帽联盟英雄",
		condition = {
			{
				{
					"combat_camp_type",
					2
				},
				">=",
				5
			}
		}
	},
	[2043] = {
		id = 2043,
		type = "至少上阵5位强者英雄",
		condition = {
			{
				{
					"combat_camp_type",
					3
				},
				">=",
				5
			}
		}
	},
	[2044] = {
		id = 2044,
		type = "至少上阵5位海军英雄",
		condition = {
			{
				{
					"combat_camp_type",
					4
				},
				">=",
				5
			}
		}
	},
	[2045] = {
		id = 2045,
		type = "至少上阵5位皇团英雄",
		condition = {
			{
				{
					"combat_camp_type",
					5
				},
				">=",
				5
			}
		}
	},
	[2101] = {
		id = 2101,
		type = "上阵的海贼新星英雄总共不超过2个",
		condition = {
			{
				{
					"combat_camp_type",
					1
				},
				"=<",
				2
			}
		}
	},
	[2102] = {
		id = 2102,
		type = "上阵的草帽联盟英雄总共不超过2个",
		condition = {
			{
				{
					"combat_camp_type",
					2
				},
				"=<",
				2
			}
		}
	},
	[2103] = {
		id = 2103,
		type = "上阵的强者英雄总共不超过2个",
		condition = {
			{
				{
					"combat_camp_type",
					3
				},
				"=<",
				2
			}
		}
	},
	[2104] = {
		id = 2104,
		type = "上阵的海军英雄总共不超过2个",
		condition = {
			{
				{
					"combat_camp_type",
					4
				},
				"=<",
				2
			}
		}
	},
	[2105] = {
		id = 2105,
		type = "上阵的皇团英雄总共不超过2个",
		condition = {
			{
				{
					"combat_camp_type",
					5
				},
				"=<",
				2
			}
		}
	},
	[2111] = {
		id = 2111,
		type = "上阵的海贼新星英雄总共不超过1个",
		condition = {
			{
				{
					"combat_camp_type",
					1
				},
				"=<",
				1
			}
		}
	},
	[2112] = {
		id = 2112,
		type = "上阵的草帽联盟英雄总共不超过1个",
		condition = {
			{
				{
					"combat_camp_type",
					2
				},
				"=<",
				1
			}
		}
	},
	[2113] = {
		id = 2113,
		type = "上阵的强者英雄总共不超过1个",
		condition = {
			{
				{
					"combat_camp_type",
					3
				},
				"=<",
				1
			}
		}
	},
	[2114] = {
		id = 2114,
		type = "上阵的海军英雄总共不超过1个",
		condition = {
			{
				{
					"combat_camp_type",
					4
				},
				"=<",
				1
			}
		}
	},
	[2115] = {
		id = 2115,
		type = "上阵的皇团英雄总共不超过1个",
		condition = {
			{
				{
					"combat_camp_type",
					5
				},
				"=<",
				1
			}
		}
	},
	[2121] = {
		id = 2121,
		type = "不得上阵海贼新星英雄",
		condition = {
			{
				{
					"combat_camp_type",
					1
				},
				"=<",
				0
			}
		}
	},
	[2122] = {
		id = 2122,
		type = "不得上阵草帽联盟英雄",
		condition = {
			{
				{
					"combat_camp_type",
					2
				},
				"=<",
				0
			}
		}
	},
	[2123] = {
		id = 2123,
		type = "不得上阵强者英雄",
		condition = {
			{
				{
					"combat_camp_type",
					3
				},
				"=<",
				0
			}
		}
	},
	[2124] = {
		id = 2124,
		type = "不得上阵皇团英雄",
		condition = {
			{
				{
					"combat_camp_type",
					5
				},
				"=<",
				0
			}
		}
	},
	[2125] = {
		id = 2125,
		type = "不得上阵皇团英雄",
		condition = {
			{
				{
					"combat_camp_type",
					5
				},
				"=<",
				0
			}
		}
	},
	[2201] = {
		id = 2201,
		type = "至少上阵1个法师英雄",
		condition = {
			{
				{
					"career_type",
					2
				},
				">=",
				1
			}
		}
	},
	[2202] = {
		id = 2202,
		type = "至少上阵1个战士英雄",
		condition = {
			{
				{
					"career_type",
					3
				},
				">=",
				1
			}
		}
	},
	[2203] = {
		id = 2203,
		type = "至少上阵1个坦克英雄",
		condition = {
			{
				{
					"career_type",
					4
				},
				">=",
				1
			}
		}
	},
	[2204] = {
		id = 2204,
		type = "至少上阵1个辅助英雄",
		condition = {
			{
				{
					"career_type",
					5
				},
				">=",
				1
			}
		}
	},
	[2211] = {
		id = 2211,
		type = "至少上阵2个法师英雄",
		condition = {
			{
				{
					"career_type",
					2
				},
				">=",
				2
			}
		}
	},
	[2212] = {
		id = 2212,
		type = "至少上阵2个战士英雄",
		condition = {
			{
				{
					"career_type",
					3
				},
				">=",
				2
			}
		}
	},
	[2213] = {
		id = 2213,
		type = "至少上阵2个坦克英雄",
		condition = {
			{
				{
					"career_type",
					4
				},
				">=",
				2
			}
		}
	},
	[2214] = {
		id = 2214,
		type = "至少上阵2个辅助英雄",
		condition = {
			{
				{
					"career_type",
					5
				},
				">=",
				2
			}
		}
	},
	[2221] = {
		id = 2221,
		type = "至少上阵3个法师英雄",
		condition = {
			{
				{
					"career_type",
					2
				},
				">=",
				3
			}
		}
	},
	[2222] = {
		id = 2222,
		type = "至少上阵3个战士英雄",
		condition = {
			{
				{
					"career_type",
					3
				},
				">=",
				3
			}
		}
	},
	[2223] = {
		id = 2223,
		type = "至少上阵3个坦克英雄",
		condition = {
			{
				{
					"career_type",
					4
				},
				">=",
				3
			}
		}
	},
	[2224] = {
		id = 2224,
		type = "至少上阵3个辅助英雄",
		condition = {
			{
				{
					"career_type",
					5
				},
				">=",
				3
			}
		}
	},
	[2301] = {
		id = 2301,
		type = "上阵的法师英雄总共不超过1个",
		condition = {
			{
				{
					"career_type",
					2
				},
				"=<",
				1
			}
		}
	},
	[2302] = {
		id = 2302,
		type = "上阵的战士英雄总共不超过1个",
		condition = {
			{
				{
					"career_type",
					3
				},
				"=<",
				1
			}
		}
	},
	[2303] = {
		id = 2303,
		type = "上阵的坦克英雄总共不超过1个",
		condition = {
			{
				{
					"career_type",
					4
				},
				"=<",
				1
			}
		}
	},
	[2304] = {
		id = 2304,
		type = "上阵的辅助英雄总共不超过1个",
		condition = {
			{
				{
					"career_type",
					5
				},
				"=<",
				1
			}
		}
	},
	[2311] = {
		id = 2311,
		type = "上阵的法师英雄总共不超过2个",
		condition = {
			{
				{
					"career_type",
					2
				},
				"=<",
				2
			}
		}
	},
	[2312] = {
		id = 2312,
		type = "上阵的战士英雄总共不超过2个",
		condition = {
			{
				{
					"career_type",
					3
				},
				"=<",
				2
			}
		}
	},
	[2313] = {
		id = 2313,
		type = "上阵的坦克英雄总共不超过2个",
		condition = {
			{
				{
					"career_type",
					4
				},
				"=<",
				2
			}
		}
	},
	[2314] = {
		id = 2314,
		type = "上阵的辅助英雄总共不超过2个",
		condition = {
			{
				{
					"career_type",
					5
				},
				"=<",
				2
			}
		}
	},
	[2321] = {
		id = 2321,
		type = "上阵的法师英雄总共不超过3个",
		condition = {
			{
				{
					"career_type",
					2
				},
				"=<",
				3
			}
		}
	},
	[2322] = {
		id = 2322,
		type = "上阵的战士英雄总共不超过3个",
		condition = {
			{
				{
					"career_type",
					3
				},
				"=<",
				3
			}
		}
	},
	[2323] = {
		id = 2323,
		type = "上阵的坦克英雄总共不超过3个",
		condition = {
			{
				{
					"career_type",
					4
				},
				"=<",
				3
			}
		}
	},
	[2324] = {
		id = 2324,
		type = "上阵的辅助英雄总共不超过3个",
		condition = {
			{
				{
					"career_type",
					5
				},
				"=<",
				3
			}
		}
	},
	[2391] = {
		id = 2391,
		type = "不得上阵法师英雄",
		condition = {
			{
				{
					"career_type",
					2
				},
				"=<",
				0
			}
		}
	},
	[2392] = {
		id = 2392,
		type = "不得上阵战士英雄",
		condition = {
			{
				{
					"career_type",
					3
				},
				"=<",
				0
			}
		}
	},
	[2393] = {
		id = 2393,
		type = "不得上阵肉盾英雄",
		condition = {
			{
				{
					"career_type",
					4
				},
				"=<",
				0
			}
		}
	},
	[2394] = {
		id = 2394,
		type = "不得上阵辅助英雄",
		condition = {
			{
				{
					"career_type",
					5
				},
				"=<",
				0
			}
		}
	},
	[2401] = {
		id = 2401,
		type = "使用坚守阵获得战斗胜利",
		condition = {
			{
				"formation_type",
				"==",
				1
			}
		}
	},
	[2402] = {
		id = 2402,
		type = "使用狂暴阵获得战斗胜利",
		condition = {
			{
				"formation_type",
				"==",
				2
			}
		}
	},
	[2403] = {
		id = 2403,
		type = "使用激战阵获得战斗胜利",
		condition = {
			{
				"formation_type",
				"==",
				3
			}
		}
	},
	[2404] = {
		id = 2404,
		type = "使用战魂阵获得战斗胜利",
		condition = {
			{
				"formation_type",
				"==",
				5
			}
		}
	},
	[2405] = {
		id = 2405,
		type = "使用核心阵获得战斗胜利",
		condition = {
			{
				"formation_type",
				"==",
				6
			}
		}
	},
	[2406] = {
		id = 2406,
		type = "使用对决阵获得战斗胜利",
		condition = {
			{
				"formation_type",
				"==",
				4
			}
		}
	},
	[3001] = {
		id = 3001,
		type = "战斗时间不超过8回合",
		condition = {
			{
				"combat_order",
				"=<",
				8
			}
		}
	},
	[3002] = {
		id = 3002,
		type = "战斗时间不超过10回合",
		condition = {
			{
				"combat_order",
				"=<",
				10
			}
		}
	},
	[3003] = {
		id = 3003,
		type = "战斗时间不超过14回合",
		condition = {
			{
				"combat_order",
				"=<",
				14
			}
		}
	},
	[3004] = {
		id = 3004,
		type = "战斗时间不超过6回合",
		condition = {
			{
				"combat_order",
				"=<",
				6
			}
		}
	},
	[3005] = {
		id = 3005,
		type = "战斗时间不超过12回合",
		condition = {
			{
				"combat_order",
				"=<",
				12
			}
		}
	},
	[3101] = {
		id = 3101,
		type = "本场战斗无队友阵亡",
		condition = {
			{
				"dead_num",
				"==",
				0
			}
		}
	},
	[3201] = {
		id = 3201,
		type = "胜利时存活英雄血量在50%以上",
		condition = {
			{
				"attk_hp_per",
				">=",
				500
			}
		}
	},
	[3202] = {
		id = 3202,
		type = "胜利时存活英雄血量在60%以上",
		condition = {
			{
				"attk_hp_per",
				">=",
				600
			}
		}
	},
	[3203] = {
		id = 3203,
		type = "胜利时存活英雄血量在70%以上",
		condition = {
			{
				"attk_hp_per",
				">=",
				700
			}
		}
	},
	[3204] = {
		id = 3204,
		type = "胜利时存活英雄血量在80%以上",
		condition = {
			{
				"attk_hp_per",
				">=",
				800
			}
		}
	},
	[3205] = {
		id = 3205,
		type = "胜利时存活英雄血量在90%以上",
		condition = {
			{
				"attk_hp_per",
				">=",
				900
			}
		}
	}
}

function Config.DungeonHeavenData.data_star_cond_fun(slot0)
	slot1 = Config.DungeonHeavenData.data_star_cond[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DungeonHeavenData.data_star_cond[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.DungeonHeavenData.data_count_buy_length = 2
Config.DungeonHeavenData.data_count_buy = {
	{
		cost = 100,
		count = 1,
		limit_vip = 0
	},
	{
		cost = 100,
		count = 2,
		limit_vip = 0
	}
}

function Config.DungeonHeavenData.data_count_buy_fun(slot0)
	slot1 = Config.DungeonHeavenData.data_count_buy[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DungeonHeavenData.data_count_buy[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.DungeonHeavenData.data_customs_pos_length = 4
Config.DungeonHeavenData.data_customs_pos = {
	{
		{
			order_id = 1,
			id = 1,
			pos = {
				98,
				539
			},
			start_pos = {
				144,
				524
			},
			end_pos = {
				234,
				520
			},
			bessel_pos_1 = {},
			bessel_pos_2 = {}
		},
		{
			order_id = 2,
			id = 1,
			pos = {
				294,
				530
			},
			start_pos = {
				348,
				524
			},
			end_pos = {
				438,
				522
			},
			bessel_pos_1 = {},
			bessel_pos_2 = {}
		},
		{
			order_id = 3,
			id = 1,
			pos = {
				488,
				536
			},
			start_pos = {
				548,
				534
			},
			end_pos = {
				624,
				616
			},
			bessel_pos_1 = {
				620,
				550
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 4,
			id = 1,
			pos = {
				638,
				672
			},
			start_pos = {
				594,
				684
			},
			end_pos = {
				486,
				712
			},
			bessel_pos_1 = {
				540,
				722
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 5,
			id = 1,
			pos = {
				438,
				728
			},
			start_pos = {
				386,
				724
			},
			end_pos = {
				286,
				726
			},
			bessel_pos_1 = {},
			bessel_pos_2 = {}
		},
		{
			order_id = 6,
			id = 1,
			pos = {
				232,
				732
			},
			start_pos = {
				170,
				732
			},
			end_pos = {
				78,
				786
			},
			bessel_pos_1 = {
				102,
				736
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 7,
			id = 1,
			pos = {
				76,
				852
			},
			start_pos = {
				132,
				868
			},
			end_pos = {
				218,
				892
			},
			bessel_pos_1 = {
				168,
				886
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 8,
			id = 1,
			pos = {
				266,
				902
			},
			start_pos = {
				312,
				912
			},
			end_pos = {
				402,
				916
			},
			bessel_pos_1 = {
				356,
				918
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 9,
			id = 1,
			pos = {
				450,
				934
			},
			start_pos = {
				510,
				918
			},
			end_pos = {
				570,
				928
			},
			bessel_pos_1 = {},
			bessel_pos_2 = {}
		},
		{
			order_id = 10,
			id = 1,
			pos = {
				620,
				972
			},
			start_pos = {},
			end_pos = {},
			bessel_pos_1 = {},
			bessel_pos_2 = {}
		}
	},
	{
		{
			order_id = 1,
			id = 2,
			pos = {
				108,
				570
			},
			start_pos = {
				170,
				580
			},
			end_pos = {
				134,
				682
			},
			bessel_pos_1 = {
				162,
				638
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 2,
			id = 2,
			pos = {
				130,
				734
			},
			start_pos = {
				114,
				780
			},
			end_pos = {
				110,
				874
			},
			bessel_pos_1 = {
				58,
				810
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 3,
			id = 2,
			pos = {
				110,
				920
			},
			start_pos = {
				164,
				940
			},
			end_pos = {
				234,
				926
			},
			bessel_pos_1 = {},
			bessel_pos_2 = {}
		},
		{
			order_id = 4,
			id = 2,
			pos = {
				282,
				934
			},
			start_pos = {
				342,
				944
			},
			end_pos = {
				398,
				908
			},
			bessel_pos_1 = {},
			bessel_pos_2 = {}
		},
		{
			order_id = 5,
			id = 2,
			pos = {
				450,
				916
			},
			start_pos = {
				456,
				880
			},
			end_pos = {
				344,
				728
			},
			bessel_pos_1 = {
				352,
				808
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 6,
			id = 2,
			pos = {
				394,
				716
			},
			start_pos = {
				398,
				660
			},
			end_pos = {
				380,
				544
			},
			bessel_pos_1 = {
				418,
				604
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 7,
			id = 2,
			pos = {
				330,
				554
			},
			start_pos = {
				376,
				526
			},
			end_pos = {
				522,
				532
			},
			bessel_pos_1 = {
				426,
				516
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 8,
			id = 2,
			pos = {
				556,
				552
			},
			start_pos = {
				610,
				574
			},
			end_pos = {
				592,
				724
			},
			bessel_pos_1 = {
				556,
				678
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 9,
			id = 2,
			pos = {
				604,
				780
			},
			start_pos = {
				646,
				810
			},
			end_pos = {
				674,
				948
			},
			bessel_pos_1 = {
				660,
				880
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 10,
			id = 2,
			pos = {
				650,
				996
			},
			start_pos = {},
			end_pos = {},
			bessel_pos_1 = {},
			bessel_pos_2 = {}
		}
	},
	{
		{
			order_id = 1,
			id = 3,
			pos = {
				92,
				890
			},
			start_pos = {
				136,
				890
			},
			end_pos = {
				268,
				932
			},
			bessel_pos_1 = {
				192,
				928
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 2,
			id = 3,
			pos = {
				316,
				918
			},
			start_pos = {
				360,
				934
			},
			end_pos = {
				490,
				966
			},
			bessel_pos_1 = {
				418,
				926
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 3,
			id = 3,
			pos = {
				538,
				968
			},
			start_pos = {
				592,
				980
			},
			end_pos = {
				666,
				844
			},
			bessel_pos_1 = {
				678,
				910
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 4,
			id = 3,
			pos = {
				638,
				804
			},
			start_pos = {
				582,
				792
			},
			end_pos = {
				480,
				800
			},
			bessel_pos_1 = {
				534,
				770
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 5,
			id = 3,
			pos = {
				432,
				796
			},
			start_pos = {
				386,
				786
			},
			end_pos = {
				270,
				746
			},
			bessel_pos_1 = {
				332,
				794
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 6,
			id = 3,
			pos = {
				200,
				736
			},
			start_pos = {
				158,
				740
			},
			end_pos = {
				110,
				646
			},
			bessel_pos_1 = {
				102,
				708
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 7,
			id = 3,
			pos = {
				74,
				624
			},
			start_pos = {
				130,
				586
			},
			end_pos = {
				208,
				566
			},
			bessel_pos_1 = {},
			bessel_pos_2 = {}
		},
		{
			order_id = 8,
			id = 3,
			pos = {
				256,
				574
			},
			start_pos = {
				304,
				576
			},
			end_pos = {
				394,
				564
			},
			bessel_pos_1 = {
				352,
				582
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 9,
			id = 3,
			pos = {
				444,
				580
			},
			start_pos = {
				492,
				568
			},
			end_pos = {
				600,
				560
			},
			bessel_pos_1 = {
				532,
				540
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 10,
			id = 3,
			pos = {
				624,
				546
			},
			start_pos = {},
			end_pos = {},
			bessel_pos_1 = {},
			bessel_pos_2 = {}
		}
	},
	{
		{
			order_id = 1,
			id = 4,
			pos = {
				628,
				536
			},
			start_pos = {
				600,
				550
			},
			end_pos = {
				488,
				558
			},
			bessel_pos_1 = {
				542,
				518
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 2,
			id = 4,
			pos = {
				440,
				556
			},
			start_pos = {
				400,
				564
			},
			end_pos = {
				318,
				608
			},
			bessel_pos_1 = {
				368,
				602
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 3,
			id = 4,
			pos = {
				270,
				608
			},
			start_pos = {
				214,
				570
			},
			end_pos = {
				142,
				552
			},
			bessel_pos_1 = {
				202,
				534
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 4,
			id = 4,
			pos = {
				96,
				550
			},
			start_pos = {
				60,
				564
			},
			end_pos = {
				78,
				724
			},
			bessel_pos_1 = {
				36,
				654
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 5,
			id = 4,
			pos = {
				126,
				720
			},
			start_pos = {
				168,
				728
			},
			end_pos = {
				326,
				760
			},
			bessel_pos_1 = {
				242,
				762
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 6,
			id = 4,
			pos = {
				376,
				762
			},
			start_pos = {
				420,
				754
			},
			end_pos = {
				532,
				750
			},
			bessel_pos_1 = {
				478,
				726
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 7,
			id = 4,
			pos = {
				582,
				738
			},
			start_pos = {
				632,
				736
			},
			end_pos = {
				660,
				860
			},
			bessel_pos_1 = {
				676,
				800
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 8,
			id = 4,
			pos = {
				636,
				908
			},
			start_pos = {
				596,
				924
			},
			end_pos = {
				488,
				930
			},
			bessel_pos_1 = {
				550,
				958
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 9,
			id = 4,
			pos = {
				438,
				936
			},
			start_pos = {
				394,
				920
			},
			end_pos = {
				258,
				892
			},
			bessel_pos_1 = {
				330,
				938
			},
			bessel_pos_2 = {}
		},
		{
			order_id = 10,
			id = 4,
			pos = {
				204,
				892
			},
			start_pos = {},
			end_pos = {},
			bessel_pos_1 = {},
			bessel_pos_2 = {}
		}
	}
}
