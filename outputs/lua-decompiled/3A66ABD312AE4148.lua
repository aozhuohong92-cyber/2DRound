Config = Config or {}
Config.RoomFeatData = Config.RoomFeatData or {}
Config.RoomFeatData.data_const_length = 3
Config.RoomFeatData.data_const = {
	experience_open_limit = {
		val = 55,
		key = "experience_open_limit",
		desc = "55级开启进阶历练"
	},
	badge_open_limit = {
		val = 55,
		key = "badge_open_limit",
		desc = "55级开启荣誉墙"
	},
	home_world_feat = {
		val = 1001,
		key = "home_world_feat",
		desc = "家园彩蛋特殊显示ID"
	}
}

function Config.RoomFeatData.data_const_fun(slot0)
	slot1 = Config.RoomFeatData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RoomFeatData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RoomFeatData.data_exp_info_length = 117
Config.RoomFeatData.data_exp_info = {
	[40000] = {
		lev = 16,
		hide = 0,
		type = 3,
		id = 40000,
		name = "海底监狱",
		desc = "通关海底监狱第300层",
		commit_rewards = {
			{
				55501,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[40010] = {
		lev = 16,
		hide = 0,
		type = 3,
		id = 40010,
		name = "海底监狱",
		desc = "通关海底监狱第600层",
		commit_rewards = {
			{
				55502,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[41000] = {
		lev = 8,
		hide = 0,
		type = 1,
		id = 41000,
		name = "越界战斗Ⅰ",
		desc = "PVP中，六回合内战胜战力高于自身的对手，累计3次",
		commit_rewards = {
			{
				29,
				3
			},
			{
				3,
				50
			}
		}
	},
	[41010] = {
		lev = 8,
		hide = 0,
		type = 1,
		id = 41010,
		name = "越界战斗Ⅱ",
		desc = "PVP中，四回合内战胜战力高于自身的对手，累计3次",
		commit_rewards = {
			{
				29,
				3
			},
			{
				3,
				100
			}
		}
	},
	[42000] = {
		lev = 8,
		hide = 0,
		type = 1,
		id = 42000,
		name = "冠军赛Ⅰ",
		desc = "冠军赛累计进入3次前32强",
		commit_rewards = {
			{
				55411,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[42010] = {
		lev = 8,
		hide = 0,
		type = 1,
		id = 42010,
		name = "冠军赛Ⅱ",
		desc = "冠军赛累计进入2次前8强",
		commit_rewards = {
			{
				55412,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[42020] = {
		lev = 8,
		hide = 0,
		type = 1,
		id = 42020,
		name = "冠军之冕",
		desc = "获得一次冠军赛第1名",
		commit_rewards = {
			{
				55413,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[42100] = {
		lev = 55,
		hide = 0,
		type = 1,
		id = 42100,
		name = "小试周冠",
		desc = "参与一次周冠军赛战斗",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				150
			}
		}
	},
	[42110] = {
		lev = 55,
		hide = 0,
		type = 1,
		id = 42110,
		name = "荣耀之冠Ⅰ",
		desc = "周冠军赛累计进入3次前64强",
		commit_rewards = {
			{
				55421,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[42120] = {
		lev = 55,
		hide = 0,
		type = 1,
		id = 42120,
		name = "荣耀之冠Ⅱ",
		desc = "周冠军赛累计进入2次前8强",
		commit_rewards = {
			{
				55422,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[42130] = {
		lev = 55,
		hide = 0,
		type = 1,
		id = 42130,
		name = "勇冠神界",
		desc = "获得一次周冠军赛第1名",
		commit_rewards = {
			{
				55423,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[42200] = {
		lev = 55,
		hide = 0,
		type = 1,
		id = 42200,
		name = "初登巅峰",
		desc = "参与一次巅峰冠军赛战斗",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				150
			}
		}
	},
	[42210] = {
		lev = 55,
		hide = 0,
		type = 1,
		id = 42210,
		name = "巅峰荣耀Ⅰ",
		desc = "巅峰冠军赛累计进入3次前64强",
		commit_rewards = {
			{
				55431,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[42220] = {
		lev = 55,
		hide = 0,
		type = 1,
		id = 42220,
		name = "巅峰荣耀Ⅱ",
		desc = "巅峰冠军赛累计进入2次前8强",
		commit_rewards = {
			{
				55432,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[42230] = {
		lev = 55,
		hide = 0,
		type = 1,
		id = 42230,
		name = "众神之巅",
		desc = "获得一次巅峰冠军赛第1名",
		commit_rewards = {
			{
				55433,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[43000] = {
		lev = 10,
		hide = 0,
		type = 3,
		id = 43000,
		name = "你好毒Ⅰ",
		desc = "单场战斗累计造成150万中毒伤害",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				100
			}
		}
	},
	[43010] = {
		lev = 10,
		hide = 0,
		type = 3,
		id = 43010,
		name = "你好毒Ⅱ",
		desc = "单场战斗累计造成300万中毒伤害",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				150
			}
		}
	},
	[43110] = {
		lev = 10,
		hide = 0,
		type = 3,
		id = 43110,
		name = "疼疼疼Ⅰ",
		desc = "单场战斗累计造成150万流血伤害",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				100
			}
		}
	},
	[43120] = {
		lev = 10,
		hide = 0,
		type = 3,
		id = 43120,
		name = "疼疼疼Ⅱ",
		desc = "单场战斗累计造成300万流血伤害",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				150
			}
		}
	},
	[43210] = {
		lev = 10,
		hide = 0,
		type = 3,
		id = 43210,
		name = "熊熊烈焰Ⅰ",
		desc = "单场战斗累计造成150万出血伤害",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				100
			}
		}
	},
	[43220] = {
		lev = 10,
		hide = 0,
		type = 3,
		id = 43220,
		name = "熊熊烈焰Ⅱ",
		desc = "单场战斗累计造成300万出血伤害",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				150
			}
		}
	},
	[44000] = {
		lev = 18,
		hide = 0,
		type = 3,
		id = 44000,
		name = "输出担当Ⅰ",
		desc = "公会副本中，单场战斗累计造成150万伤害",
		commit_rewards = {
			{
				40112,
				1
			},
			{
				3,
				50
			}
		}
	},
	[44010] = {
		lev = 18,
		hide = 0,
		type = 3,
		id = 44010,
		name = "输出担当Ⅱ",
		desc = "公会副本中，单场战斗累计造成300万伤害",
		commit_rewards = {
			{
				40212,
				1
			},
			{
				3,
				100
			}
		}
	},
	[44020] = {
		lev = 18,
		hide = 0,
		type = 3,
		id = 44020,
		name = "输出担当Ⅲ",
		desc = "公会副本中，单场战斗累计造成500万伤害",
		commit_rewards = {
			{
				40412,
				1
			},
			{
				40312,
				1
			}
		}
	},
	[45000] = {
		lev = 18,
		hide = 0,
		type = 3,
		id = 45000,
		name = "攻无不克",
		desc = "参与并累计获得10次公会战胜利",
		commit_rewards = {
			{
				55311,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[45010] = {
		lev = 18,
		hide = 0,
		type = 3,
		id = 45010,
		name = "战无不胜",
		desc = "参与并累计获得50次公会战胜利",
		commit_rewards = {
			{
				55312,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[45020] = {
		lev = 18,
		hide = 0,
		type = 3,
		id = 45020,
		name = "所向披靡",
		desc = "参与并累计获得100次公会战胜利",
		commit_rewards = {
			{
				55313,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[46000] = {
		lev = 25,
		hide = 0,
		type = 3,
		id = 46000,
		name = "无尽·初级",
		desc = "首次通关试炼之地第300关",
		commit_rewards = {
			{
				55301,
				1
			},
			{
				3,
				100
			}
		}
	},
	[46010] = {
		lev = 25,
		hide = 0,
		type = 3,
		id = 46010,
		name = "无尽·中级",
		desc = "首次通关试炼之地第450关",
		commit_rewards = {
			{
				55302,
				1
			},
			{
				3,
				150
			}
		}
	},
	[46020] = {
		lev = 25,
		hide = 0,
		type = 3,
		id = 46020,
		name = "无尽·高级",
		desc = "首次通关试炼之地第600关",
		commit_rewards = {
			{
				55303,
				1
			},
			{
				3,
				200
			}
		}
	},
	[46030] = {
		lev = 25,
		hide = 0,
		type = 3,
		id = 46030,
		name = "无尽·巅峰",
		desc = "首次通关试炼之地第900关",
		commit_rewards = {
			{
				55304,
				1
			},
			{
				3,
				300
			}
		}
	},
	[46800] = {
		lev = 30,
		hide = 0,
		type = 3,
		id = 46800,
		name = "长环岛·探险",
		desc = "达成历练：通关第三层任意难度5次",
		commit_rewards = {
			{
				55181,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[46810] = {
		lev = 30,
		hide = 0,
		type = 3,
		id = 46810,
		name = "长环岛·突破",
		desc = "达成历练：通关第三层任意难度10次",
		commit_rewards = {
			{
				55182,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[46820] = {
		lev = 30,
		hide = 0,
		type = 3,
		id = 46820,
		name = "长环岛·引领",
		desc = "达成历练：通关第三层任意难度15次",
		commit_rewards = {
			{
				55183,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[46830] = {
		lev = 30,
		hide = 0,
		type = 3,
		id = 46830,
		name = "长环岛·巅峰",
		desc = "达成历练：通关第三层任意难度20次",
		commit_rewards = {
			{
				55184,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[46840] = {
		lev = 30,
		hide = 0,
		type = 3,
		id = 46840,
		name = "长环岛·征战",
		desc = "达成历练：通关第三层任意难度30次",
		commit_rewards = {
			{
				55185,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[47000] = {
		lev = 30,
		hide = 1,
		type = 3,
		id = 47000,
		name = "长环岛冒险·水",
		desc = "长环岛冒险【极冰雪原】达100%进度3次",
		commit_rewards = {
			{
				55201,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[47010] = {
		lev = 30,
		hide = 1,
		type = 3,
		id = 47010,
		name = "长环岛冒险·火",
		desc = "长环岛冒险【熔火炼狱】达100%进度3次",
		commit_rewards = {
			{
				55202,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[47020] = {
		lev = 30,
		hide = 1,
		type = 3,
		id = 47020,
		name = "长环岛冒险·风",
		desc = "长环岛冒险【风棘之森】达100%进度3次",
		commit_rewards = {
			{
				55203,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[47030] = {
		lev = 30,
		hide = 1,
		type = 3,
		id = 47030,
		name = "长环岛冒险·光",
		desc = "长环岛冒险【大海遗迹】达100%进度5次",
		commit_rewards = {
			{
				55204,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[47040] = {
		lev = 30,
		hide = 1,
		type = 3,
		id = 47040,
		name = "长环岛冒险·暗",
		desc = "长环岛冒险【荒黯之墟】达100%进度5次",
		commit_rewards = {
			{
				55205,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[48000] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 48000,
		name = "超级战技",
		desc = "累计获得10个超级战技",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				100
			}
		}
	},
	[48010] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 48010,
		name = "传说战技",
		desc = "累计获得10个传说战技",
		commit_rewards = {
			{
				37002,
				3
			},
			{
				3,
				200
			}
		}
	},
	[49000] = {
		lev = 35,
		hide = 0,
		type = 2,
		id = 49000,
		name = "交友广泛",
		desc = "拥有10个跨服好友",
		commit_rewards = {
			{
				37001,
				5
			},
			{
				3,
				100
			}
		}
	},
	[50000] = {
		lev = 55,
		hide = 0,
		type = 3,
		id = 50000,
		name = "寻宝者",
		desc = "进入空岛冒险第40层",
		commit_rewards = {
			{
				55401,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[50010] = {
		lev = 55,
		hide = 0,
		type = 3,
		id = 50010,
		name = "探险者",
		desc = "进入空岛冒险第70层",
		commit_rewards = {
			{
				55402,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[50020] = {
		lev = 55,
		hide = 0,
		type = 3,
		id = 50020,
		name = "大探险家",
		desc = "进入空岛冒险第90层",
		commit_rewards = {
			{
				55403,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[50110] = {
		lev = 55,
		hide = 0,
		type = 3,
		id = 50110,
		name = "空岛冒险Ⅰ",
		desc = "空岛冒险累计击杀500个守卫",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				50
			}
		}
	},
	[50120] = {
		lev = 55,
		hide = 0,
		type = 3,
		id = 50120,
		name = "空岛冒险Ⅱ",
		desc = "空岛冒险累计击杀2000个守卫",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				100
			}
		}
	},
	[50130] = {
		lev = 55,
		hide = 0,
		type = 3,
		id = 50130,
		name = "空岛冒险Ⅲ",
		desc = "空岛冒险累计击杀5000个守卫",
		commit_rewards = {
			{
				37002,
				3
			},
			{
				3,
				150
			}
		}
	},
	[51000] = {
		lev = 55,
		hide = 0,
		type = 1,
		id = 51000,
		name = "天梯之路Ⅰ",
		desc = "跨服天梯累计挑战胜利100次",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				50
			}
		}
	},
	[51010] = {
		lev = 55,
		hide = 0,
		type = 1,
		id = 51010,
		name = "天梯之路Ⅱ",
		desc = "跨服天梯累计挑战胜利300次",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				100
			}
		}
	},
	[51020] = {
		lev = 55,
		hide = 0,
		type = 1,
		id = 51020,
		name = "天梯之路Ⅲ",
		desc = "跨服天梯累计挑战胜利600次",
		commit_rewards = {
			{
				37002,
				3
			},
			{
				3,
				150
			}
		}
	},
	[51110] = {
		lev = 55,
		hide = 0,
		type = 1,
		id = 51110,
		name = "天梯之路",
		desc = "跨服天梯赛季结算时获得前20名",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				100
			}
		}
	},
	[51120] = {
		lev = 55,
		hide = 0,
		type = 1,
		id = 51120,
		name = "登峰造极",
		desc = "跨服天梯赛季结算时获得第1名",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				150
			}
		}
	},
	[52000] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 52000,
		name = "初露锋芒",
		desc = "最高战力达到100万",
		commit_rewards = {
			{
				55702,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[52010] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 52010,
		name = "冠绝一时",
		desc = "最高战力达到200万",
		commit_rewards = {
			{
				55703,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[52020] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 52020,
		name = "谁与争锋",
		desc = "最高战力达到350万",
		commit_rewards = {
			{
				55704,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[53000] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 53000,
		name = "英雄培养Ⅰ",
		desc = "当前拥有5个10星英雄",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				100
			}
		}
	},
	[53010] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 53010,
		name = "英雄培养Ⅱ",
		desc = "当前拥有5个11星英雄",
		commit_rewards = {
			{
				37002,
				3
			},
			{
				3,
				200
			}
		}
	},
	[53110] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 53110,
		name = "海贼英雄Ⅰ",
		desc = "使3个海贼英雄达到10星",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				150
			}
		}
	},
	[53120] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 53120,
		name = "海贼英雄Ⅱ",
		desc = "使1个海贼英雄达到11星",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				200
			}
		}
	},
	[53210] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 53210,
		name = "草帽联盟英雄Ⅰ",
		desc = "使3个草帽联盟英雄达到10星",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				150
			}
		}
	},
	[53220] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 53220,
		name = "草帽联盟英雄Ⅱ",
		desc = "使1个草帽联盟英雄达到11星",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				200
			}
		}
	},
	[53310] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 53310,
		name = "强者英雄Ⅰ",
		desc = "使3个强者英雄达到10星",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				150
			}
		}
	},
	[53320] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 53320,
		name = "强者英雄Ⅱ",
		desc = "使1个强者英雄达到11星",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				200
			}
		}
	},
	[53410] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 53410,
		name = "海军英雄Ⅰ",
		desc = "使3个海军英雄达到10星",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				150
			}
		}
	},
	[53420] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 53420,
		name = "海军英雄Ⅱ",
		desc = "使1个海军英雄达到11星",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				200
			}
		}
	},
	[53510] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 53510,
		name = "五皇团英雄Ⅰ",
		desc = "使3个五皇团英雄达到10星",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				150
			}
		}
	},
	[53520] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 53520,
		name = "五皇团英雄Ⅱ",
		desc = "使1个五皇团英雄达到11星",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				200
			}
		}
	},
	[53610] = {
		lev = 8,
		hide = 0,
		type = 2,
		id = 53610,
		name = "神来之手Ⅰ",
		desc = "任意一届冠军赛中11场竞猜全部正确",
		commit_rewards = {
			{
				55701,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[53620] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 53620,
		name = "神来之手Ⅱ",
		desc = "任意一届周冠军赛中12场竞猜全部正确",
		commit_rewards = {
			{
				55707,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[53630] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 53630,
		name = "神来之手Ⅲ",
		desc = "任意一届巅峰冠军赛中14场竞猜全部正确",
		commit_rewards = {
			{
				55708,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[53710] = {
		lev = 170,
		hide = 0,
		type = 2,
		id = 53710,
		name = "神力觉醒",
		desc = "获得一位13星英雄",
		commit_rewards = {
			{
				55709,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[75000] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 75000,
		name = "霸气领悟Ⅰ",
		desc = "累计领悟10个初级技能",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				50
			}
		}
	},
	[75010] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 75010,
		name = "霸气领悟Ⅱ",
		desc = "累计领悟10个中级技能",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				100
			}
		}
	},
	[75020] = {
		lev = 55,
		hide = 0,
		type = 2,
		id = 75020,
		name = "霸气领悟Ⅲ",
		desc = "累计领悟10个高级技能",
		commit_rewards = {
			{
				37002,
				3
			},
			{
				3,
				150
			}
		}
	},
	[76000] = {
		lev = 90,
		hide = 0,
		type = 3,
		id = 76000,
		name = "信念之力",
		desc = "通关任意领地的第6关",
		commit_rewards = {
			{
				55101,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[76010] = {
		lev = 90,
		hide = 0,
		type = 3,
		id = 76010,
		name = "信念掌控",
		desc = "本周内通过每个领地的第6关",
		commit_rewards = {
			{
				55102,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[76110] = {
		lev = 90,
		hide = 0,
		type = 3,
		id = 76110,
		name = "信念领主",
		desc = "通关任意领地的第10关",
		commit_rewards = {
			{
				55103,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[76120] = {
		lev = 90,
		hide = 0,
		type = 3,
		id = 76120,
		name = "信念主宰",
		desc = "本周内通过每个领地的第10关",
		commit_rewards = {
			{
				55104,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[76210] = {
		lev = 90,
		hide = 0,
		type = 3,
		id = 76210,
		name = "领地副本Ⅰ",
		desc = "排行榜结算时累计获得3次前10名",
		commit_rewards = {
			{
				29,
				3
			},
			{
				3,
				100
			}
		}
	},
	[76220] = {
		lev = 90,
		hide = 0,
		type = 3,
		id = 76220,
		name = "领地副本Ⅱ",
		desc = "排行榜结算时累计获得3次前3名",
		commit_rewards = {
			{
				29,
				3
			},
			{
				3,
				150
			}
		}
	},
	[77000] = {
		lev = 100,
		hide = 0,
		type = 1,
		id = 77000,
		name = "段位精英Ⅰ",
		desc = "超凡段位赛累计获胜100场",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				100
			}
		}
	},
	[77010] = {
		lev = 100,
		hide = 0,
		type = 1,
		id = 77010,
		name = "段位精英Ⅱ",
		desc = "超凡段位赛累计获胜1000场",
		commit_rewards = {
			{
				37002,
				3
			},
			{
				3,
				150
			}
		}
	},
	[77110] = {
		lev = 100,
		hide = 0,
		type = 1,
		id = 77110,
		name = "赛季精英",
		desc = "超凡段位赛赛季结算时达到铂金及以上段位",
		commit_rewards = {
			{
				55601,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[77120] = {
		lev = 100,
		hide = 0,
		type = 1,
		id = 77120,
		name = "强者之证",
		desc = "超凡段位赛赛季结算时达到钻石及以上段位",
		commit_rewards = {
			{
				55602,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[77210] = {
		lev = 100,
		hide = 0,
		type = 1,
		id = 77210,
		name = "王者之心",
		desc = "超凡段位赛赛季结算时获得前10名",
		commit_rewards = {
			{
				55603,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[77220] = {
		lev = 100,
		hide = 0,
		type = 1,
		id = 77220,
		name = "超凡之巅",
		desc = "超凡段位赛赛季结算时获得第1名",
		commit_rewards = {
			{
				55604,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[77310] = {
		lev = 100,
		hide = 0,
		type = 1,
		id = 77310,
		name = "王者争霸",
		desc = "参与一次王者赛",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				100
			}
		}
	},
	[78000] = {
		lev = 105,
		hide = 0,
		type = 3,
		id = 78000,
		name = "传奇挑战Ⅰ",
		desc = "完美通关传奇挑战前12章",
		commit_rewards = {
			{
				17210,
				3
			},
			{
				3,
				50
			}
		}
	},
	[78010] = {
		lev = 105,
		hide = 0,
		type = 3,
		id = 78010,
		name = "传奇挑战Ⅱ",
		desc = "完美通关传奇挑战前24章",
		commit_rewards = {
			{
				17210,
				3
			},
			{
				3,
				50
			}
		}
	},
	[78020] = {
		lev = 105,
		hide = 0,
		type = 3,
		id = 78020,
		name = "传奇挑战Ⅲ",
		desc = "完美通关传奇挑战前36章",
		commit_rewards = {
			{
				17211,
				3
			},
			{
				3,
				50
			}
		}
	},
	[80000] = {
		lev = 115,
		hide = 0,
		type = 1,
		id = 80000,
		name = "跨服竞技Ⅰ",
		desc = "跨服竞技场累计获胜100场",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				50
			}
		}
	},
	[80010] = {
		lev = 115,
		hide = 0,
		type = 1,
		id = 80010,
		name = "跨服竞技Ⅱ",
		desc = "跨服竞技场累计获胜1000场",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				100
			}
		}
	},
	[80020] = {
		lev = 0,
		hide = 0,
		type = 1,
		id = 80020,
		name = "跨服竞技Ⅲ",
		desc = "跨服竞技场累计获胜2500场",
		commit_rewards = {
			{
				37002,
				3
			},
			{
				3,
				150
			}
		}
	},
	[80110] = {
		lev = 115,
		hide = 0,
		type = 1,
		id = 80110,
		name = "战场勇者",
		desc = "跨服竞技场赛季结算时获得前10名",
		commit_rewards = {
			{
				29,
				3
			},
			{
				3,
				100
			}
		}
	},
	[80120] = {
		lev = 115,
		hide = 0,
		type = 1,
		id = 80120,
		name = "天启战神",
		desc = "跨服竞技场赛季结算时获得第1名",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				150
			}
		}
	},
	[90010] = {
		lev = 10,
		hide = 1,
		type = 2,
		id = 90010,
		name = "极品战技",
		desc = "出现拥有高级迅捷+高级迟缓的战技",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				150
			}
		}
	},
	[90020] = {
		lev = 10,
		hide = 1,
		type = 2,
		id = 90020,
		name = "极品战技",
		desc = "出现拥有高级物连+高级法连的战技",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				150
			}
		}
	},
	[90030] = {
		lev = 10,
		hide = 1,
		type = 2,
		id = 90030,
		name = "欧气满满",
		desc = "友情召唤累计获得3个五星英雄",
		commit_rewards = {
			{
				55705,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[90040] = {
		lev = 10,
		hide = 1,
		type = 2,
		id = 90040,
		name = "欧皇降临",
		desc = "普通召唤累计获得3个五星英雄",
		commit_rewards = {
			{
				55706,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[90050] = {
		lev = 18,
		hide = 1,
		type = 2,
		id = 90050,
		name = "手气最佳",
		desc = "获得3次公会红包的手气最佳",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				100
			}
		}
	},
	[90060] = {
		lev = 18,
		hide = 1,
		type = 2,
		id = 90060,
		name = "中流砥柱",
		desc = "公会捐献累计捐献3万钻石",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				100
			}
		}
	},
	[90070] = {
		lev = 55,
		hide = 1,
		type = 2,
		id = 90070,
		name = "我是拳王",
		desc = "冒险猜拳累计获胜100次",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				100
			}
		}
	},
	[90080] = {
		lev = 10,
		hide = 1,
		type = 2,
		id = 90080,
		name = "旗鼓相当",
		desc = "战斗中累计触发100次天平模式",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				100
			}
		}
	},
	[90090] = {
		lev = 18,
		hide = 1,
		type = 2,
		id = 90090,
		name = "家里有矿",
		desc = "发放的红包累计超过5万钻石",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				100
			}
		}
	},
	[90100] = {
		lev = 10,
		hide = 1,
		type = 2,
		id = 90100,
		name = "试炼之境",
		desc = "试炼之境击杀难度5及以上难度第15关boss",
		commit_rewards = {
			{
				55801,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[90110] = {
		lev = 10,
		hide = 1,
		type = 2,
		id = 90110,
		name = "黄金的勇者",
		desc = "累计充值100000钻石",
		commit_rewards = {
			{
				55802,
				1
			},
			{
				1,
				100000
			}
		}
	},
	[100010] = {
		lev = 70,
		hide = 0,
		type = 1,
		id = 100010,
		name = "组队竞技",
		desc = "组队竞技场队伍累计胜利100次（队伍挑战次数）",
		commit_rewards = {
			{
				10403,
				1
			},
			{
				3,
				50
			}
		}
	},
	[100020] = {
		lev = 70,
		hide = 0,
		type = 1,
		id = 100020,
		name = "友谊与荣耀",
		desc = "作为队长参与组队竞技场挑战100次（队伍挑战次数）",
		commit_rewards = {
			{
				55901,
				1
			},
			{
				3,
				100
			}
		}
	},
	[100030] = {
		lev = 70,
		hide = 0,
		type = 1,
		id = 100030,
		name = "无人可挡",
		desc = "组队竞技场仅用己方前两位出战的选手就击败了对方全部选手累计75次",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				100
			}
		}
	},
	[100040] = {
		lev = 70,
		hide = 0,
		type = 1,
		id = 100040,
		name = "勇攀高峰",
		desc = "累计获得组队竞技场赛季结算前5名3次",
		commit_rewards = {
			{
				55902,
				1
			},
			{
				3,
				150
			}
		}
	},
	[100050] = {
		lev = 70,
		hide = 0,
		type = 1,
		id = 100050,
		name = "群山之巅",
		desc = "获得组队竞技场赛季结算第1名1次",
		commit_rewards = {
			{
				55903,
				1
			},
			{
				3,
				150
			}
		}
	},
	[100060] = {
		lev = 70,
		hide = 1,
		type = 1,
		id = 100060,
		name = "勇冠三军",
		desc = "作为队伍首个出战的选手击败对方全部三位选手累计25次",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				150
			}
		}
	},
	[100070] = {
		lev = 70,
		hide = 1,
		type = 1,
		id = 100070,
		name = "力挽狂澜",
		desc = "作为队伍最后出战的选手击败对方全部三位选手累计25次",
		commit_rewards = {
			{
				37002,
				1
			},
			{
				3,
				150
			}
		}
	}
}

function Config.RoomFeatData.data_exp_info_fun(slot0)
	slot1 = Config.RoomFeatData.data_exp_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RoomFeatData.data_exp_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RoomFeatData.data_honor_icon_info_length = 60
Config.RoomFeatData.data_honor_icon_info = {
	[1001] = {
		type_name = "海底监狱",
		name = "试练·突破者",
		effect_res = "",
		desc1 = "达成历练：通关海底监狱300层",
		icon_res = "wall_icon_001",
		type_id = 1,
		is_show = 0,
		quality = 3,
		desc2 = "目标只有一个，那就是再突破一层",
		point = 200,
		id = 1001,
		need_items = {
			{
				{
					55501,
					1
				}
			}
		}
	},
	[1002] = {
		type_name = "海底监狱",
		name = "试练·引领者",
		effect_res = "E24605",
		desc1 = "达成历练：通关海底监狱600层",
		icon_res = "wall_icon_002",
		type_id = 1,
		is_show = 0,
		quality = 4,
		desc2 = "通往塔顶的道路，就由我来引领你前行吧！",
		point = 500,
		id = 1002,
		need_items = {
			{
				{
					55502,
					1
				}
			}
		}
	},
	[2001] = {
		type_name = "试炼之地",
		name = "无尽·初级",
		effect_res = "",
		desc1 = "达成历练：首次通关试炼之地第300关",
		icon_res = "wall_icon_011",
		type_id = 2,
		is_show = 0,
		quality = 3,
		desc2 = "去追寻无尽的意义所在吧！",
		point = 50,
		id = 2001,
		need_items = {
			{
				{
					55301,
					1
				}
			}
		}
	},
	[2002] = {
		type_name = "试炼之地",
		name = "无尽·中级",
		effect_res = "",
		desc1 = "达成历练：首次通关试炼之地第450关",
		icon_res = "wall_icon_012",
		type_id = 2,
		is_show = 0,
		quality = 4,
		desc2 = "再向前走，也许你就能追寻它的尽头",
		point = 200,
		id = 2002,
		need_items = {
			{
				{
					55302,
					1
				}
			}
		}
	},
	[2003] = {
		type_name = "试炼之地",
		name = "无尽·高级",
		effect_res = "E24605",
		desc1 = "达成历练：首次通关试炼之地第600关",
		icon_res = "wall_icon_013",
		type_id = 2,
		is_show = 0,
		quality = 5,
		desc2 = "这场试炼的终极意义，在于不断超越昨天的自己",
		point = 500,
		id = 2003,
		need_items = {
			{
				{
					55303,
					1
				}
			}
		}
	},
	[2004] = {
		type_name = "试炼之地",
		name = "无尽·巅峰",
		effect_res = "E24605",
		desc1 = "达成历练：首次通关试炼之地第900关",
		icon_res = "wall_icon_014",
		type_id = 2,
		is_show = 0,
		quality = 5,
		desc2 = "成为巅峰？还是超越巅峰？",
		point = 800,
		id = 2004,
		need_items = {
			{
				{
					55304,
					1
				}
			}
		}
	},
	[2081] = {
		type_name = "长环岛冒险",
		name = "长环岛·探险",
		effect_res = "",
		desc1 = "达成历练：通关第三层任意难度5次",
		icon_res = "wall_icon_1301",
		type_id = 3,
		is_show = 0,
		quality = 4,
		desc2 = "去冒险，去追寻！",
		point = 50,
		id = 2081,
		need_items = {
			{
				{
					55181,
					1
				}
			}
		}
	},
	[2082] = {
		type_name = "长环岛冒险",
		name = "长环岛·突破",
		effect_res = "",
		desc1 = "达成历练：通关第三层任意难度10次",
		icon_res = "wall_icon_1302",
		type_id = 3,
		is_show = 0,
		quality = 4,
		desc2 = "再向前走，也许你就能有所突破",
		point = 200,
		id = 2082,
		need_items = {
			{
				{
					55182,
					1
				}
			}
		}
	},
	[2083] = {
		type_name = "长环岛冒险",
		name = "长环岛·引领",
		effect_res = "",
		desc1 = "达成历练：通关第三层任意难度15次",
		icon_res = "wall_icon_1303",
		type_id = 3,
		is_show = 0,
		quality = 4,
		desc2 = "通往魔王的道路，就由我来引领你前行吧！",
		point = 500,
		id = 2083,
		need_items = {
			{
				{
					55183,
					1
				}
			}
		}
	},
	[2084] = {
		type_name = "长环岛冒险",
		name = "长环岛·巅峰",
		effect_res = "",
		desc1 = "达成历练：通关第三层任意难度20次",
		icon_res = "wall_icon_1304",
		type_id = 3,
		is_show = 0,
		quality = 5,
		desc2 = "成为巅峰？还是超越巅峰？",
		point = 800,
		id = 2084,
		need_items = {
			{
				{
					55184,
					1
				}
			}
		}
	},
	[2085] = {
		type_name = "长环岛冒险",
		name = "长环岛·征战",
		effect_res = "E24605",
		desc1 = "达成历练：通关第三层任意难度30次",
		icon_res = "wall_icon_1305",
		type_id = 3,
		is_show = 0,
		quality = 5,
		desc2 = "无休止征战的终极意义，究竟是什么？",
		point = 1000,
		id = 2085,
		need_items = {
			{
				{
					55185,
					1
				}
			}
		}
	},
	[3001] = {
		type_name = "长环岛冒险",
		name = "长环岛冒险·水",
		effect_res = "",
		desc1 = "达成历练：长环岛冒险【极冰雪原】达100%进度3次",
		icon_res = "wall_icon_1201",
		type_id = 3,
		is_show = 1,
		quality = 4,
		desc2 = "水主生长，滋润万物。",
		point = 50,
		id = 3001,
		need_items = {
			{
				{
					55201,
					1
				}
			}
		}
	},
	[3002] = {
		type_name = "长环岛冒险",
		name = "长环岛冒险·火",
		effect_res = "",
		desc1 = "达成历练：长环岛冒险【熔火炼狱】达100%进度3次",
		icon_res = "wall_icon_1202",
		type_id = 3,
		is_show = 1,
		quality = 4,
		desc2 = "火主消亡，梵烧殆尽。",
		point = 200,
		id = 3002,
		need_items = {
			{
				{
					55202,
					1
				}
			}
		}
	},
	[3003] = {
		type_name = "长环岛冒险",
		name = "长环岛冒险·风",
		effect_res = "",
		desc1 = "达成历练：长环岛冒险【风棘之森】达100%进度3次",
		icon_res = "wall_icon_1203",
		type_id = 3,
		is_show = 1,
		quality = 4,
		desc2 = "风主传承，生意盎然。",
		point = 500,
		id = 3003,
		need_items = {
			{
				{
					55203,
					1
				}
			}
		}
	},
	[3004] = {
		type_name = "长环岛冒险",
		name = "长环岛冒险·光",
		effect_res = "",
		desc1 = "达成历练：长环岛冒险【大海遗迹】达100%进度5次",
		icon_res = "wall_icon_1204",
		type_id = 3,
		is_show = 1,
		quality = 5,
		desc2 = "光主创造，万物敬仰。",
		point = 800,
		id = 3004,
		need_items = {
			{
				{
					55204,
					1
				}
			}
		}
	},
	[3005] = {
		type_name = "长环岛冒险",
		name = "长环岛冒险·暗",
		effect_res = "",
		desc1 = "达成历练：长环岛冒险【荒黯之墟】达100%进度5次",
		icon_res = "wall_icon_1205",
		type_id = 3,
		is_show = 1,
		quality = 5,
		desc2 = "暗主毁灭，归于虚无。",
		point = 1000,
		id = 3005,
		need_items = {
			{
				{
					55205,
					1
				}
			}
		}
	},
	[4001] = {
		type_name = "公会战",
		name = "攻无不克",
		effect_res = "",
		desc1 = "达成历练：参与并累计获得10次公会战胜利",
		icon_res = "wall_icon_031",
		type_id = 4,
		is_show = 0,
		quality = 3,
		desc2 = "愿你我携手，共同成就公会的辉煌",
		point = 50,
		id = 4001,
		need_items = {
			{
				{
					55311,
					1
				}
			}
		}
	},
	[4002] = {
		type_name = "公会战",
		name = "战无不胜",
		effect_res = "",
		desc1 = "达成历练：参与并累计获得50次公会战胜利",
		icon_res = "wall_icon_032",
		type_id = 4,
		is_show = 0,
		quality = 4,
		desc2 = "以此记录你为公会做出的卓越贡献",
		point = 200,
		id = 4002,
		need_items = {
			{
				{
					55312,
					1
				}
			}
		}
	},
	[4003] = {
		type_name = "公会战",
		name = "所向披靡",
		effect_res = "E24604",
		desc1 = "达成历练：参与并累计获得100次公会战胜利",
		icon_res = "wall_icon_033",
		type_id = 4,
		is_show = 0,
		quality = 5,
		desc2 = "以此纪念我们共同的荣耀与辉煌",
		point = 500,
		id = 4003,
		need_items = {
			{
				{
					55313,
					1
				}
			}
		}
	},
	[5001] = {
		type_name = "空岛冒险",
		name = "寻宝者",
		effect_res = "",
		desc1 = "达成历练：进入空岛冒险第40层",
		icon_res = "wall_icon_041",
		type_id = 5,
		is_show = 0,
		quality = 3,
		desc2 = "神界还有无尽的宝藏等待着你去探寻",
		point = 50,
		id = 5001,
		need_items = {
			{
				{
					55401,
					1
				}
			}
		}
	},
	[5002] = {
		type_name = "空岛冒险",
		name = "探险者",
		effect_res = "",
		desc1 = "达成历练：进入空岛冒险第70层",
		icon_res = "wall_icon_042",
		type_id = 5,
		is_show = 0,
		quality = 4,
		desc2 = "危险与机遇并存，真正的船长才能见到别样的风景",
		point = 200,
		id = 5002,
		need_items = {
			{
				{
					55402,
					1
				}
			}
		}
	},
	[5003] = {
		type_name = "空岛冒险",
		name = "大探险家",
		effect_res = "E24604",
		desc1 = "达成历练：进入空岛冒险第90层",
		icon_res = "wall_icon_043",
		type_id = 5,
		is_show = 0,
		quality = 5,
		desc2 = "大探险家的眼里，一定会有不一样的风景吧",
		point = 500,
		id = 5003,
		need_items = {
			{
				{
					55403,
					1
				}
			}
		}
	},
	[6001] = {
		type_name = "冠军赛",
		name = "冠军赛·32强",
		effect_res = "",
		desc1 = "达成历练：冠军赛累计进入3次前32强",
		icon_res = "wall_icon_051",
		type_id = 6,
		is_show = 0,
		quality = 3,
		desc2 = "此徽章的持有者已在冒险大陆上初露锋芒",
		point = 50,
		id = 6001,
		need_items = {
			{
				{
					55411,
					1
				}
			}
		}
	},
	[6002] = {
		type_name = "冠军赛",
		name = "冠军赛·8强",
		effect_res = "",
		desc1 = "达成历练：冠军赛累计进入2次前8强",
		icon_res = "wall_icon_052",
		type_id = 6,
		is_show = 0,
		quality = 4,
		desc2 = "做好准备，冠军的宝座已经近在咫尺",
		point = 200,
		id = 6002,
		need_items = {
			{
				{
					55412,
					1
				}
			}
		}
	},
	[6003] = {
		type_name = "冠军赛",
		name = "冠军之冕",
		effect_res = "E24605",
		desc1 = "达成历练：获得一次冠军赛第1名",
		icon_res = "wall_icon_053",
		type_id = 6,
		is_show = 0,
		quality = 5,
		desc2 = "以冠军之名，为今夜的王者加冕",
		point = 500,
		id = 6003,
		need_items = {
			{
				{
					55413,
					1
				}
			}
		}
	},
	[6011] = {
		type_name = "周冠军赛",
		name = "荣耀之冠·64强",
		effect_res = "",
		desc1 = "达成历练：周冠军赛累计进入3次前64强",
		icon_res = "wall_icon_055",
		type_id = 7,
		is_show = 0,
		quality = 3,
		desc2 = "被征召而至的船长将在神域之中崭露头角",
		point = 50,
		id = 6011,
		need_items = {
			{
				{
					55421,
					1
				}
			}
		}
	},
	[6012] = {
		type_name = "周冠军赛",
		name = "荣耀之冠·8强",
		effect_res = "",
		desc1 = "达成历练：周冠军赛累计进入2次前8强",
		icon_res = "wall_icon_056",
		type_id = 7,
		is_show = 0,
		quality = 4,
		desc2 = "前进一步，就是离终点更近一步",
		point = 200,
		id = 6012,
		need_items = {
			{
				{
					55422,
					1
				}
			}
		}
	},
	[6013] = {
		type_name = "周冠军赛",
		name = "勇冠神界",
		effect_res = "E24605",
		desc1 = "达成历练：获得一次周冠军赛第1名",
		icon_res = "wall_icon_057",
		type_id = 7,
		is_show = 0,
		quality = 5,
		desc2 = "唯有一往无前的勇气，才配得上这份万人敬仰的荣誉",
		point = 500,
		id = 6013,
		need_items = {
			{
				{
					55423,
					1
				}
			}
		}
	},
	[6021] = {
		type_name = "巅峰冠军赛",
		name = "巅峰荣耀·64强",
		effect_res = "",
		desc1 = "达成历练：巅峰冠军赛累计进入3次前64强",
		icon_res = "wall_icon_058",
		type_id = 8,
		is_show = 0,
		quality = 3,
		desc2 = "极少船长凭卓越表现走到了这一步",
		point = 50,
		id = 6021,
		need_items = {
			{
				{
					55431,
					1
				}
			}
		}
	},
	[6022] = {
		type_name = "巅峰冠军赛",
		name = "巅峰荣耀·8强",
		effect_res = "",
		desc1 = "达成历练：巅峰冠军赛累计进入2次前8强",
		icon_res = "wall_icon_059",
		type_id = 8,
		is_show = 0,
		quality = 4,
		desc2 = "前进一步，就是离终点更近一步",
		point = 200,
		id = 6022,
		need_items = {
			{
				{
					55432,
					1
				}
			}
		}
	},
	[6023] = {
		type_name = "巅峰冠军赛",
		name = "众神之巅",
		effect_res = "E24605",
		desc1 = "达成历练：获得一次巅峰冠军赛第1名",
		icon_res = "wall_icon_060",
		type_id = 8,
		is_show = 0,
		quality = 5,
		desc2 = "唯有万夫莫开的实力，才配得上这份众神敬仰的称号",
		point = 500,
		id = 6023,
		need_items = {
			{
				{
					55433,
					1
				}
			}
		}
	},
	[7001] = {
		type_name = "领地副本",
		name = "信念之力",
		effect_res = "E24601",
		desc1 = "达成历练：通关任意领地副本的第6关",
		icon_res = "wall_icon_061",
		type_id = 9,
		is_show = 0,
		quality = 3,
		desc2 = "世界的元素一分为五，这将是你主宰世界的起点",
		point = 200,
		id = 7001,
		need_items = {
			{
				{
					55101,
					1
				}
			}
		}
	},
	[7002] = {
		type_name = "领地副本",
		name = "信念掌控",
		effect_res = "E24601",
		desc1 = "达成历练：本周内通过每个领地副本的第6关",
		icon_res = "wall_icon_062",
		type_id = 9,
		is_show = 0,
		quality = 4,
		desc2 = "世界的元素一分为五，而你已成就了这世界1/5的意志",
		point = 500,
		id = 7002,
		need_items = {
			{
				{
					55102,
					1
				}
			}
		}
	},
	[7003] = {
		type_name = "领地副本",
		name = "信念领主",
		effect_res = "E24602",
		desc1 = "达成历练：通关任意领地副本的第10关",
		icon_res = "wall_icon_063",
		type_id = 9,
		is_show = 0,
		quality = 4,
		desc2 = "如果不为成为信念主宰而前行，那掌控元素也将失去意义",
		point = 500,
		id = 7003,
		need_items = {
			{
				{
					55103,
					1
				}
			}
		}
	},
	[7004] = {
		type_name = "领地副本",
		name = "信念主宰",
		effect_res = "E24603",
		desc1 = "达成历练：本周内通过每个领地副本的第10关",
		icon_res = "wall_icon_064",
		type_id = 9,
		is_show = 0,
		quality = 5,
		desc2 = "呼啸汹涌燃烧，就连那光与暗，都愿与他的意志共存亡",
		point = 1200,
		id = 7004,
		need_items = {
			{
				{
					55104,
					1
				}
			}
		}
	},
	[8001] = {
		type_name = "超凡段位赛",
		name = "赛季精英",
		effect_res = "",
		desc1 = "达成历练：超凡段位赛赛季结算时达到铂金及以上段位",
		icon_res = "wall_icon_071",
		type_id = 10,
		is_show = 0,
		quality = 3,
		desc2 = "精英，便是你迈上强者之路的第一步",
		point = 50,
		id = 8001,
		need_items = {
			{
				{
					55601,
					1
				}
			}
		}
	},
	[8002] = {
		type_name = "超凡段位赛",
		name = "强者之证",
		effect_res = "",
		desc1 = "达成历练：超凡段位赛赛季结算时达到钻石及以上段位",
		icon_res = "wall_icon_072",
		type_id = 10,
		is_show = 0,
		quality = 4,
		desc2 = "强者一称，只有更强，没有最强",
		point = 200,
		id = 8002,
		need_items = {
			{
				{
					55602,
					1
				}
			}
		}
	},
	[8003] = {
		type_name = "超凡段位赛",
		name = "王者之心",
		effect_res = "E24604",
		desc1 = "达成历练：超凡段位赛赛季结算时获得前10名",
		icon_res = "wall_icon_073",
		type_id = 10,
		is_show = 0,
		quality = 5,
		desc2 = "所谓王者，从不会止步于王者",
		point = 1200,
		id = 8003,
		need_items = {
			{
				{
					55603,
					1
				}
			}
		}
	},
	[8004] = {
		type_name = "超凡段位赛",
		name = "超凡之巅",
		effect_res = "E24605",
		desc1 = "达成历练：超凡段位赛赛季结算时获得第1名",
		icon_res = "wall_icon_074",
		type_id = 10,
		is_show = 0,
		quality = 5,
		desc2 = "千锤万炼成钢，百战百胜超凡",
		point = 1200,
		id = 8004,
		need_items = {
			{
				{
					55604,
					1
				}
			}
		}
	},
	[9001] = {
		type_name = "特殊成就I",
		name = "神明眷顾",
		effect_res = "E24605",
		desc1 = "达成历练：任意一届冠军赛中11场竞猜全部正确",
		icon_res = "wall_icon_900",
		type_id = 12,
		is_show = 0,
		quality = 4,
		desc2 = "智慧、博学与幸运，将会指引着你",
		point = 200,
		id = 9001,
		need_items = {
			{
				{
					55701,
					1
				}
			}
		}
	},
	[9007] = {
		type_name = "特殊成就I",
		name = "神之恩宠",
		effect_res = "E24605",
		desc1 = "达成历练：任意一届周冠军赛中12场竞猜全部正确",
		icon_res = "wall_icon_906",
		type_id = 12,
		is_show = 0,
		quality = 4,
		desc2 = "如同得到神的恩宠一般，你拥有化腐朽为神奇的力量",
		point = 200,
		id = 9007,
		need_items = {
			{
				{
					55707,
					1
				}
			}
		}
	},
	[9008] = {
		type_name = "特殊成就I",
		name = "智慧之神",
		effect_res = "E24605",
		desc1 = "达成历练：任意一届巅峰冠军赛中14场竞猜全部正确",
		icon_res = "wall_icon_907",
		type_id = 12,
		is_show = 0,
		quality = 5,
		desc2 = "智慧、学识都犹如神明一般，远胜凡人",
		point = 200,
		id = 9008,
		need_items = {
			{
				{
					55708,
					1
				}
			}
		}
	},
	[9009] = {
		type_name = "特殊成就II",
		name = "神力觉醒",
		effect_res = "E24605",
		desc1 = "达成历练：获得一位13星英雄",
		icon_res = "wall_icon_908",
		type_id = 13,
		is_show = 1,
		quality = 5,
		desc2 = "在神的面前，绝对的力量皆为谎言",
		point = 500,
		id = 9009,
		need_items = {
			{
				{
					55709,
					1
				}
			}
		}
	},
	[9002] = {
		type_name = "特殊成就II",
		name = "初露锋芒",
		effect_res = "",
		desc1 = "达成历练：最高战力达到100万",
		icon_res = "wall_icon_901",
		type_id = 13,
		is_show = 0,
		quality = 3,
		desc2 = "利刃出鞘，便是初露锋芒之时",
		point = 50,
		id = 9002,
		need_items = {
			{
				{
					55702,
					1
				}
			}
		}
	},
	[9003] = {
		type_name = "特殊成就II",
		name = "冠绝一时",
		effect_res = "",
		desc1 = "达成历练：最高战力达到200万",
		icon_res = "wall_icon_902",
		type_id = 13,
		is_show = 0,
		quality = 4,
		desc2 = "他人眼中的终点，于他而言不过是起点",
		point = 200,
		id = 9003,
		need_items = {
			{
				{
					55703,
					1
				}
			}
		}
	},
	[9004] = {
		type_name = "特殊成就II",
		name = "谁与争锋",
		effect_res = "E24605",
		desc1 = "达成历练：最高战力达到350万",
		icon_res = "wall_icon_903",
		type_id = 13,
		is_show = 0,
		quality = 5,
		desc2 = "立于顶点的人，必将受到万人敬仰",
		point = 500,
		id = 9004,
		need_items = {
			{
				{
					55704,
					1
				}
			}
		}
	},
	[9005] = {
		type_name = "特殊成就III",
		name = "欧气满满",
		effect_res = "E24605",
		desc1 = "达成隐藏历练：友情召唤累计获得3个五星英雄",
		icon_res = "wall_icon_904",
		type_id = 14,
		is_show = 1,
		quality = 4,
		desc2 = "当你需要五星英雄时，他就这么来了",
		point = 200,
		id = 9005,
		need_items = {
			{
				{
					55705,
					1
				}
			}
		}
	},
	[9006] = {
		type_name = "特殊成就III",
		name = "欧皇降临",
		effect_res = "E24605",
		desc1 = "达成隐藏历练：普通召唤累计获得3个五星英雄",
		icon_res = "wall_icon_905",
		type_id = 14,
		is_show = 1,
		quality = 4,
		desc2 = "这枚徽章只象征一件事：你就是天选之人",
		point = 200,
		id = 9006,
		need_items = {
			{
				{
					55706,
					1
				}
			}
		}
	},
	[9101] = {
		type_name = "特殊徽章",
		name = "试炼之境",
		effect_res = "E24605",
		desc1 = "达成历练：试炼之境击杀难度5及以上难度第15关boss",
		icon_res = "wall_icon_1000",
		type_id = 99,
		is_show = 1,
		quality = 4,
		desc2 = "授予在试炼之境中最勇敢的挑战者的证明，极其珍贵",
		point = 200,
		id = 9101,
		need_items = {
			{
				{
					55801,
					1
				}
			}
		}
	},
	[9102] = {
		type_name = "特殊徽章",
		name = "黄金的勇者",
		effect_res = "E24605",
		desc1 = "累计充值100000钻石后获得",
		icon_res = "wall_icon_1001",
		type_id = 99,
		is_show = 1,
		quality = 4,
		desc2 = "你所拥有的财富，让所有船长都感到不简单，特此为你颁发了这枚纯金打造的徽章",
		point = 200,
		id = 9102,
		need_items = {
			{
				{
					55802,
					1
				}
			}
		}
	},
	[9103] = {
		type_name = "特殊徽章",
		name = "冒险的领航人",
		effect_res = "E24605",
		desc1 = "参与游戏社区活动，投稿征集，攻略评测获得",
		icon_res = "wall_icon_1002",
		type_id = 99,
		is_show = 1,
		quality = 4,
		desc2 = "声名远扬的船长，也将成为我们的前行的领航之人\n——献予伟大的冒险领航人",
		point = 200,
		id = 9103,
		need_items = {
			{
				{
					55803,
					1
				}
			}
		}
	},
	[9104] = {
		type_name = "特殊徽章",
		name = "皇家骑士团",
		effect_res = "E24605",
		desc1 = "参与游戏社区活动，投稿征集，攻略评测获得",
		icon_res = "wall_icon_1003",
		type_id = 99,
		is_show = 1,
		quality = 4,
		desc2 = "手中的剑与盾，为皇家的荣誉而生\n——授予拥有杰出贡献的骑士们",
		point = 200,
		id = 9104,
		need_items = {
			{
				{
					55804,
					1
				}
			}
		}
	},
	[9105] = {
		type_name = "特殊徽章",
		name = "智慧之贤者",
		effect_res = "E24605",
		desc1 = "参与游戏社区活动，投稿征集，攻略评测获得",
		icon_res = "wall_icon_1004",
		type_id = 99,
		is_show = 1,
		quality = 4,
		desc2 = "贤者的智慧，是冒险大陆前行的希望之光\n——授予无私奉献的贤者们",
		point = 200,
		id = 9105,
		need_items = {
			{
				{
					55805,
					1
				}
			}
		}
	},
	[9106] = {
		type_name = "特殊徽章",
		name = "试炼之星",
		effect_res = "E24605",
		desc1 = "星空试炼活动中获得服务器前10名",
		icon_res = "wall_icon_1005",
		type_id = 99,
		is_show = 1,
		quality = 4,
		desc2 = "授予在星空试炼中超越自我，达到巅峰的最强船长们",
		point = 200,
		id = 9106,
		need_items = {
			{
				{
					55806,
					1
				}
			}
		}
	},
	[9107] = {
		type_name = "特殊徽章",
		name = "奇境探险家",
		effect_res = "E24605",
		desc1 = "参与和之国火祭活动，达成挑战目标",
		icon_res = "wall_icon_1006",
		type_id = 99,
		is_show = 1,
		quality = 4,
		desc2 = "授予在和之国火祭中出色表现的船长们，表彰你们的成就",
		point = 200,
		id = 9107,
		need_items = {
			{
				{
					55807,
					1
				}
			}
		}
	},
	[9108] = {
		type_name = "特殊徽章",
		name = "冒险嘉年华",
		effect_res = "E24605",
		desc1 = "参与欧皇派对七日登陆活动获得",
		icon_res = "wall_icon_1007",
		type_id = 99,
		is_show = 1,
		quality = 4,
		desc2 = "一场欧皇的盛宴，就缺你了",
		point = 200,
		id = 9108,
		need_items = {
			{
				{
					55808,
					1
				}
			}
		}
	},
	[9109] = {
		type_name = "特殊徽章",
		name = "万国贺新春",
		effect_res = "E24605",
		desc1 = "在新年活动中，挑战一次巅峰大妈可获得",
		icon_res = "wall_icon_1008",
		type_id = 99,
		is_show = 1,
		quality = 4,
		desc2 = "献给在万国新春中表现优异，坚强勇敢的船长们",
		point = 200,
		id = 9109,
		need_items = {
			{
				{
					55809,
					1
				}
			}
		}
	},
	[9201] = {
		type_name = "组队竞技场",
		name = "友谊与荣耀",
		effect_res = "E24605",
		desc1 = "作为队长参与组队竞技场挑战100次",
		icon_res = "wall_icon_1101",
		type_id = 11,
		is_show = 0,
		quality = 4,
		desc2 = "你就是群众领袖",
		point = 500,
		id = 9201,
		need_items = {
			{
				{
					55901,
					1
				}
			}
		}
	},
	[9202] = {
		type_name = "组队竞技场",
		name = "勇攀高峰",
		effect_res = "E24605",
		desc1 = "累计获得组队竞技场赛季结算前5名3次",
		icon_res = "wall_icon_1102",
		type_id = 11,
		is_show = 0,
		quality = 4,
		desc2 = "不畏惧艰辛，勇于攀登高峰，挑战强者",
		point = 800,
		id = 9202,
		need_items = {
			{
				{
					55902,
					1
				}
			}
		}
	},
	[9203] = {
		type_name = "组队竞技场",
		name = "群山之巅",
		effect_res = "E24605",
		desc1 = "获得组队竞技场赛季结算第1名1次",
		icon_res = "wall_icon_1103",
		type_id = 11,
		is_show = 0,
		quality = 5,
		desc2 = "众生为你铺平一条通天之路",
		point = 1200,
		id = 9203,
		need_items = {
			{
				{
					55903,
					1
				}
			}
		}
	}
}

function Config.RoomFeatData.data_honor_icon_info_fun(slot0)
	slot1 = Config.RoomFeatData.data_honor_icon_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RoomFeatData.data_honor_icon_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RoomFeatData.data_honor_title_info_length = 6
Config.RoomFeatData.data_honor_title_info = {
	{
		name = "见习骑士",
		min = 0,
		res_id = 1,
		max = 199
	},
	{
		name = "白银骑士",
		min = 200,
		res_id = 2,
		max = 1999
	},
	{
		name = "暗夜男爵",
		min = 2000,
		res_id = 3,
		max = 4999
	},
	{
		name = "雷霆子爵",
		min = 5000,
		res_id = 4,
		max = 9999
	},
	{
		name = "红莲伯爵",
		min = 10000,
		res_id = 5,
		max = 49999
	},
	{
		name = "耀光公爵",
		min = 50000,
		res_id = 6,
		max = 999999
	}
}
Config.RoomFeatData.data_type_list_length = 3
Config.RoomFeatData.data_type_list = {
	{
		{
			id = 100070
		},
		{
			id = 100060
		},
		{
			id = 100050
		},
		{
			id = 100040
		},
		{
			id = 100030
		},
		{
			id = 100020
		},
		{
			id = 100010
		},
		{
			id = 80120
		},
		{
			id = 80110
		},
		{
			id = 80020
		},
		{
			id = 80010
		},
		{
			id = 80000
		},
		{
			id = 77310
		},
		{
			id = 77220
		},
		{
			id = 77210
		},
		{
			id = 77120
		},
		{
			id = 77110
		},
		{
			id = 77010
		},
		{
			id = 77000
		},
		{
			id = 51120
		},
		{
			id = 51110
		},
		{
			id = 51020
		},
		{
			id = 51010
		},
		{
			id = 51000
		},
		{
			id = 42230
		},
		{
			id = 42220
		},
		{
			id = 42210
		},
		{
			id = 42200
		},
		{
			id = 42130
		},
		{
			id = 42120
		},
		{
			id = 42110
		},
		{
			id = 42100
		},
		{
			id = 42020
		},
		{
			id = 42010
		},
		{
			id = 42000
		},
		{
			id = 41010
		},
		{
			id = 41000
		}
	},
	[2] = {
		{
			id = 90110
		},
		{
			id = 90100
		},
		{
			id = 90090
		},
		{
			id = 90080
		},
		{
			id = 90070
		},
		{
			id = 90060
		},
		{
			id = 90050
		},
		{
			id = 90040
		},
		{
			id = 90030
		},
		{
			id = 90020
		},
		{
			id = 90010
		},
		{
			id = 75020
		},
		{
			id = 75010
		},
		{
			id = 75000
		},
		{
			id = 53710
		},
		{
			id = 53630
		},
		{
			id = 53620
		},
		{
			id = 53610
		},
		{
			id = 53520
		},
		{
			id = 53510
		},
		{
			id = 53420
		},
		{
			id = 53410
		},
		{
			id = 53320
		},
		{
			id = 53310
		},
		{
			id = 53220
		},
		{
			id = 53210
		},
		{
			id = 53120
		},
		{
			id = 53110
		},
		{
			id = 53010
		},
		{
			id = 53000
		},
		{
			id = 52020
		},
		{
			id = 52010
		},
		{
			id = 52000
		},
		{
			id = 49000
		},
		{
			id = 48010
		},
		{
			id = 48000
		},
		{
			id = 1001
		}
	},
	[3] = {
		{
			id = 78020
		},
		{
			id = 78010
		},
		{
			id = 78000
		},
		{
			id = 76220
		},
		{
			id = 76210
		},
		{
			id = 76120
		},
		{
			id = 76110
		},
		{
			id = 76010
		},
		{
			id = 76000
		},
		{
			id = 50130
		},
		{
			id = 50120
		},
		{
			id = 50110
		},
		{
			id = 50020
		},
		{
			id = 50010
		},
		{
			id = 50000
		},
		{
			id = 47040
		},
		{
			id = 47030
		},
		{
			id = 47020
		},
		{
			id = 47010
		},
		{
			id = 47000
		},
		{
			id = 46840
		},
		{
			id = 46830
		},
		{
			id = 46820
		},
		{
			id = 46810
		},
		{
			id = 46800
		},
		{
			id = 46030
		},
		{
			id = 46020
		},
		{
			id = 46010
		},
		{
			id = 46000
		},
		{
			id = 45020
		},
		{
			id = 45010
		},
		{
			id = 45000
		},
		{
			id = 44020
		},
		{
			id = 44010
		},
		{
			id = 44000
		},
		{
			id = 43220
		},
		{
			id = 43210
		},
		{
			id = 43120
		},
		{
			id = 43110
		},
		{
			id = 43010
		},
		{
			id = 43000
		},
		{
			id = 40010
		},
		{
			id = 40000
		}
	}
}
Config.RoomFeatData.data_show_list_length = 2
Config.RoomFeatData.data_show_list = {
	[0] = {
		{
			id = 9203
		},
		{
			id = 9202
		},
		{
			id = 9201
		},
		{
			id = 9004
		},
		{
			id = 9003
		},
		{
			id = 9002
		},
		{
			id = 9008
		},
		{
			id = 9007
		},
		{
			id = 9001
		},
		{
			id = 8004
		},
		{
			id = 8003
		},
		{
			id = 8002
		},
		{
			id = 8001
		},
		{
			id = 7004
		},
		{
			id = 7003
		},
		{
			id = 7002
		},
		{
			id = 7001
		},
		{
			id = 6023
		},
		{
			id = 6022
		},
		{
			id = 6021
		},
		{
			id = 6013
		},
		{
			id = 6012
		},
		{
			id = 6011
		},
		{
			id = 6003
		},
		{
			id = 6002
		},
		{
			id = 6001
		},
		{
			id = 5003
		},
		{
			id = 5002
		},
		{
			id = 5001
		},
		{
			id = 4003
		},
		{
			id = 4002
		},
		{
			id = 4001
		},
		{
			id = 2085
		},
		{
			id = 2084
		},
		{
			id = 2083
		},
		{
			id = 2082
		},
		{
			id = 2081
		},
		{
			id = 2004
		},
		{
			id = 2003
		},
		{
			id = 2002
		},
		{
			id = 2001
		},
		{
			id = 1002
		},
		{
			id = 1001
		}
	},
	{
		{
			id = 9109
		},
		{
			id = 9108
		},
		{
			id = 9107
		},
		{
			id = 9106
		},
		{
			id = 9105
		},
		{
			id = 9104
		},
		{
			id = 9103
		},
		{
			id = 9102
		},
		{
			id = 9101
		},
		{
			id = 9006
		},
		{
			id = 9005
		},
		{
			id = 9009
		},
		{
			id = 3005
		},
		{
			id = 3004
		},
		{
			id = 3003
		},
		{
			id = 3002
		},
		{
			id = 3001
		}
	}
}
