Config = Config or {}
Config.EmoguoshitujianData = Config.EmoguoshitujianData or {}
Config.EmoguoshitujianData.data_const_length = 9
Config.EmoguoshitujianData.data_const = {
	emo_fenjie_zi = {
		key = "emo_fenjie_zi",
		desc = "紫色已觉醒的恶魔果实碎片可分解为25力量源质",
		val = {
			19502,
			25
		}
	},
	emo_fenjie_cheng = {
		key = "emo_fenjie_cheng",
		desc = "橙色已觉醒的恶魔果实碎片可分解为50力量源质",
		val = {
			19502,
			50
		}
	},
	emo_rule = {
		val = 1,
		key = "emo_rule",
		desc = [[
1、恶魔果实系统是个独立的养成系统，每个恶魔果实都可对全体伙伴提供属性加成，且都具有独特的特殊效果(不同恶魔果实提供的相同效果可以叠加)。
2、恶魔果实常规升级仅提升其第一属性(生命/攻击)加成值，恶魔果实升星或激活等级节点效果可同时提升第一与第二属性(防御/速度)加成值。
3、恶魔果实升星可逐步提升恶魔果实专属效果的强度。
4、恶魔果实等级上限受其当前星级影响，星级越高，恶魔果实的等级上限越高。
5、不同恶魔果实分属不同品质，品质越高，则其星级上限越高，潜力越大。
6、恶魔果实的收益加成类效果，仅在恶魔果实正式激活后生效，对于激活前已经累计的收益无加成效果。
7、恶魔果实满星后，可消耗指定品质与对应数量的恶魔果实碎片进行觉醒，觉醒后可提升恶魔果实专属效果的强度或获得一条全新效果。
8、已满星的恶魔果实，其碎片可被转化为其他恶魔果实觉醒的消耗材料。
9、已觉醒的恶魔果实，其碎片可被分解为[力量源质]。
10、果实赠礼结束后，将重置为全新内容，重置后的果实赠礼层数与解锁的盒子挂钩，例如解锁了[铜质果盒]，则在果实赠礼下次重置时，会进入第二层果实赠礼。]]
	},
	emo_zhaohuan_rule = {
		val = 1,
		key = "emo_zhaohuan_rule",
		desc = [[
1、[木质果盒]解锁条件:玩家等级达到50级
  [铜质果盒]解锁条件:玩家等级达到70级，且累计在果实商店消耗2100个[恶魔之种]
  [银质果盒]解锁条件:玩家等级达到90级，且累计在果实商店消耗4200个[恶魔之种]
  [金质果盒]解锁条件:玩家等级达到120级，且累计在果实商店消耗6300个[恶魔之种]
2、每次抽奖，必定获得10个[恶魔之种]
3、概率展示只保留小数点后三位，余下部分会四舍五入显示
4、果实赠礼结束后，将重置为全新内容，重置后的果实赠礼层数与解锁的盒子挂钩，例如解锁了[铜质果盒]，则在果实赠礼下次重置时，会进入第二层果实赠礼
5、[果实秘宝]的每天10次钻石抽奖次数为所有盒子共享]]
	},
	emo_zhanling_rule = {
		val = 1,
		key = "emo_zhanling_rule",
		desc = "1、果实的馈赠为15天一个周期，周期结束后，活跃度进度、领奖状态均被重置，此外基础和进阶奖励需要重新解锁，且若达到要求，可进入下一层奖励\n2、基础奖励需要消耗钻石解锁，进阶奖励则需要付费解锁，进阶奖励更丰厚\n3、活动周期内，完成日常任务获得的【活跃度】达指定值可获得进度奖励"
	},
	emo_choujaing_times = {
		val = 10,
		key = "emo_choujaing_times",
		desc = "每天钻石抽奖次数"
	},
	emo_zhanling_jiesuo = {
		val = 50,
		key = "emo_zhanling_jiesuo",
		desc = "果实赠礼的解锁条件"
	},
	emo_xuyuan = {
		val = 20,
		key = "emo_xuyuan",
		desc = "许愿果实增加权重"
	},
	emo_zhaohuan_xiaohao = {
		val = 10411,
		key = "emo_zhaohuan_xiaohao",
		desc = "召唤消耗道具"
	}
}

function Config.EmoguoshitujianData.data_const_fun(slot0)
	slot1 = Config.EmoguoshitujianData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.EmoguoshitujianData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.EmoguoshitujianData.data_get_emoguoshitujian_level_length = 2650
Config.EmoguoshitujianData.data_get_emoguoshitujian_level = {
	["1_1"] = {
		need_star = 1,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 1,
		need_items = {
			{
				19001,
				50
			}
		},
		atts = {
			{
				"hp_max",
				10000
			},
			{
				"speed",
				10
			}
		}
	},
	["1_2"] = {
		need_star = 1,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				10125
			},
			{
				"speed",
				10
			}
		}
	},
	["1_3"] = {
		need_star = 1,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				10250
			},
			{
				"speed",
				10
			}
		}
	},
	["1_4"] = {
		need_star = 1,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				10375
			},
			{
				"speed",
				10
			}
		}
	},
	["1_5"] = {
		need_star = 1,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				10500
			},
			{
				"speed",
				10
			}
		}
	},
	["1_6"] = {
		need_star = 1,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				10625
			},
			{
				"speed",
				10
			}
		}
	},
	["1_7"] = {
		need_star = 1,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				10750
			},
			{
				"speed",
				10
			}
		}
	},
	["1_8"] = {
		need_star = 1,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				10875
			},
			{
				"speed",
				10
			}
		}
	},
	["1_9"] = {
		need_star = 1,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				11000
			},
			{
				"speed",
				10
			}
		}
	},
	["1_10"] = {
		need_star = 1,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				11125
			},
			{
				"speed",
				10
			}
		}
	},
	["1_11"] = {
		need_star = 2,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				11260
			},
			{
				"speed",
				10
			}
		}
	},
	["1_12"] = {
		need_star = 2,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				11395
			},
			{
				"speed",
				10
			}
		}
	},
	["1_13"] = {
		need_star = 2,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				11530
			},
			{
				"speed",
				10
			}
		}
	},
	["1_14"] = {
		need_star = 2,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				11665
			},
			{
				"speed",
				10
			}
		}
	},
	["1_15"] = {
		need_star = 2,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				11800
			},
			{
				"speed",
				10
			}
		}
	},
	["1_16"] = {
		need_star = 2,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				11935
			},
			{
				"speed",
				10
			}
		}
	},
	["1_17"] = {
		need_star = 2,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				12070
			},
			{
				"speed",
				10
			}
		}
	},
	["1_18"] = {
		need_star = 2,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				12205
			},
			{
				"speed",
				10
			}
		}
	},
	["1_19"] = {
		need_star = 2,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				12340
			},
			{
				"speed",
				10
			}
		}
	},
	["1_20"] = {
		need_star = 2,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				12475
			},
			{
				"speed",
				10
			}
		}
	},
	["1_21"] = {
		need_star = 3,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				12620
			},
			{
				"speed",
				10
			}
		}
	},
	["1_22"] = {
		need_star = 3,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				12765
			},
			{
				"speed",
				10
			}
		}
	},
	["1_23"] = {
		need_star = 3,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				12910
			},
			{
				"speed",
				10
			}
		}
	},
	["1_24"] = {
		need_star = 3,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				13055
			},
			{
				"speed",
				10
			}
		}
	},
	["1_25"] = {
		need_star = 3,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"speed",
				10
			}
		}
	},
	["1_26"] = {
		need_star = 3,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				13345
			},
			{
				"speed",
				10
			}
		}
	},
	["1_27"] = {
		need_star = 3,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				13490
			},
			{
				"speed",
				10
			}
		}
	},
	["1_28"] = {
		need_star = 3,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				13635
			},
			{
				"speed",
				10
			}
		}
	},
	["1_29"] = {
		need_star = 3,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				13780
			},
			{
				"speed",
				10
			}
		}
	},
	["1_30"] = {
		need_star = 3,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				13925
			},
			{
				"speed",
				10
			}
		}
	},
	["1_31"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				14085
			},
			{
				"speed",
				10
			}
		}
	},
	["1_32"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				14245
			},
			{
				"speed",
				10
			}
		}
	},
	["1_33"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				14405
			},
			{
				"speed",
				10
			}
		}
	},
	["1_34"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				14565
			},
			{
				"speed",
				10
			}
		}
	},
	["1_35"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				14725
			},
			{
				"speed",
				10
			}
		}
	},
	["1_36"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				14885
			},
			{
				"speed",
				10
			}
		}
	},
	["1_37"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				15045
			},
			{
				"speed",
				10
			}
		}
	},
	["1_38"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				15205
			},
			{
				"speed",
				10
			}
		}
	},
	["1_39"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				15365
			},
			{
				"speed",
				10
			}
		}
	},
	["1_40"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 1,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				17525
			},
			{
				"speed",
				12
			}
		}
	},
	["1_41"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				17685
			},
			{
				"speed",
				12
			}
		}
	},
	["1_42"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				17845
			},
			{
				"speed",
				12
			}
		}
	},
	["1_43"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				18005
			},
			{
				"speed",
				12
			}
		}
	},
	["1_44"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				18165
			},
			{
				"speed",
				12
			}
		}
	},
	["1_45"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				18325
			},
			{
				"speed",
				12
			}
		}
	},
	["1_46"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				18485
			},
			{
				"speed",
				12
			}
		}
	},
	["1_47"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				18645
			},
			{
				"speed",
				12
			}
		}
	},
	["1_48"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				18805
			},
			{
				"speed",
				12
			}
		}
	},
	["1_49"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				18965
			},
			{
				"speed",
				12
			}
		}
	},
	["1_50"] = {
		need_star = 4,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				19125
			},
			{
				"speed",
				12
			}
		}
	},
	["1_51"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				19315
			},
			{
				"speed",
				12
			}
		}
	},
	["1_52"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				19505
			},
			{
				"speed",
				12
			}
		}
	},
	["1_53"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				19695
			},
			{
				"speed",
				12
			}
		}
	},
	["1_54"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				19885
			},
			{
				"speed",
				12
			}
		}
	},
	["1_55"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				20075
			},
			{
				"speed",
				12
			}
		}
	},
	["1_56"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				20265
			},
			{
				"speed",
				12
			}
		}
	},
	["1_57"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				20455
			},
			{
				"speed",
				12
			}
		}
	},
	["1_58"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				20645
			},
			{
				"speed",
				12
			}
		}
	},
	["1_59"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				20835
			},
			{
				"speed",
				12
			}
		}
	},
	["1_60"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 1,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				24025
			},
			{
				"speed",
				15
			}
		}
	},
	["1_61"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				24215
			},
			{
				"speed",
				15
			}
		}
	},
	["1_62"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				24405
			},
			{
				"speed",
				15
			}
		}
	},
	["1_63"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				24595
			},
			{
				"speed",
				15
			}
		}
	},
	["1_64"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				24785
			},
			{
				"speed",
				15
			}
		}
	},
	["1_65"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				24975
			},
			{
				"speed",
				15
			}
		}
	},
	["1_66"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				25165
			},
			{
				"speed",
				15
			}
		}
	},
	["1_67"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				25355
			},
			{
				"speed",
				15
			}
		}
	},
	["1_68"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				25545
			},
			{
				"speed",
				15
			}
		}
	},
	["1_69"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				25735
			},
			{
				"speed",
				15
			}
		}
	},
	["1_70"] = {
		need_star = 5,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				25925
			},
			{
				"speed",
				15
			}
		}
	},
	["1_71"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"hp_max",
				26155
			},
			{
				"speed",
				15
			}
		}
	},
	["1_72"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"hp_max",
				26385
			},
			{
				"speed",
				15
			}
		}
	},
	["1_73"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"hp_max",
				26615
			},
			{
				"speed",
				15
			}
		}
	},
	["1_74"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"hp_max",
				26845
			},
			{
				"speed",
				15
			}
		}
	},
	["1_75"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"hp_max",
				27075
			},
			{
				"speed",
				15
			}
		}
	},
	["1_76"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"hp_max",
				27305
			},
			{
				"speed",
				15
			}
		}
	},
	["1_77"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"hp_max",
				27535
			},
			{
				"speed",
				15
			}
		}
	},
	["1_78"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"hp_max",
				27765
			},
			{
				"speed",
				15
			}
		}
	},
	["1_79"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"hp_max",
				27995
			},
			{
				"speed",
				15
			}
		}
	},
	["1_80"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 1,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"hp_max",
				33225
			},
			{
				"speed",
				20
			}
		}
	},
	["1_81"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"hp_max",
				33455
			},
			{
				"speed",
				20
			}
		}
	},
	["1_82"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"hp_max",
				33685
			},
			{
				"speed",
				20
			}
		}
	},
	["1_83"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"hp_max",
				33915
			},
			{
				"speed",
				20
			}
		}
	},
	["1_84"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"hp_max",
				34145
			},
			{
				"speed",
				20
			}
		}
	},
	["1_85"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"hp_max",
				34375
			},
			{
				"speed",
				20
			}
		}
	},
	["1_86"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"hp_max",
				34605
			},
			{
				"speed",
				20
			}
		}
	},
	["1_87"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"hp_max",
				34835
			},
			{
				"speed",
				20
			}
		}
	},
	["1_88"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"hp_max",
				35065
			},
			{
				"speed",
				20
			}
		}
	},
	["1_89"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"hp_max",
				35295
			},
			{
				"speed",
				20
			}
		}
	},
	["1_90"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"hp_max",
				35525
			},
			{
				"speed",
				20
			}
		}
	},
	["1_91"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"hp_max",
				35755
			},
			{
				"speed",
				20
			}
		}
	},
	["1_92"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"hp_max",
				35985
			},
			{
				"speed",
				20
			}
		}
	},
	["1_93"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"hp_max",
				36215
			},
			{
				"speed",
				20
			}
		}
	},
	["1_94"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"hp_max",
				36445
			},
			{
				"speed",
				20
			}
		}
	},
	["1_95"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"hp_max",
				36675
			},
			{
				"speed",
				20
			}
		}
	},
	["1_96"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"hp_max",
				36905
			},
			{
				"speed",
				20
			}
		}
	},
	["1_97"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"hp_max",
				37135
			},
			{
				"speed",
				20
			}
		}
	},
	["1_98"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"hp_max",
				37365
			},
			{
				"speed",
				20
			}
		}
	},
	["1_99"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"hp_max",
				37595
			},
			{
				"speed",
				20
			}
		}
	},
	["1_100"] = {
		need_star = 6,
		name = "冰冻果实",
		desc = "",
		id = 1,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"hp_max",
				37825
			},
			{
				"speed",
				20
			}
		}
	},
	["2_1"] = {
		need_star = 1,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 1,
		need_items = {
			{
				19002,
				50
			}
		},
		atts = {
			{
				"atk",
				2000
			},
			{
				"def",
				20
			}
		}
	},
	["2_2"] = {
		need_star = 1,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"atk",
				2025
			},
			{
				"def",
				20
			}
		}
	},
	["2_3"] = {
		need_star = 1,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"atk",
				2050
			},
			{
				"def",
				20
			}
		}
	},
	["2_4"] = {
		need_star = 1,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"atk",
				2075
			},
			{
				"def",
				20
			}
		}
	},
	["2_5"] = {
		need_star = 1,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"atk",
				2100
			},
			{
				"def",
				20
			}
		}
	},
	["2_6"] = {
		need_star = 1,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"atk",
				2125
			},
			{
				"def",
				20
			}
		}
	},
	["2_7"] = {
		need_star = 1,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"atk",
				2150
			},
			{
				"def",
				20
			}
		}
	},
	["2_8"] = {
		need_star = 1,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"atk",
				2175
			},
			{
				"def",
				20
			}
		}
	},
	["2_9"] = {
		need_star = 1,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"atk",
				2200
			},
			{
				"def",
				20
			}
		}
	},
	["2_10"] = {
		need_star = 1,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"atk",
				2225
			},
			{
				"def",
				20
			}
		}
	},
	["2_11"] = {
		need_star = 2,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"atk",
				2252
			},
			{
				"def",
				20
			}
		}
	},
	["2_12"] = {
		need_star = 2,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"atk",
				2279
			},
			{
				"def",
				20
			}
		}
	},
	["2_13"] = {
		need_star = 2,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"atk",
				2306
			},
			{
				"def",
				20
			}
		}
	},
	["2_14"] = {
		need_star = 2,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"atk",
				2333
			},
			{
				"def",
				20
			}
		}
	},
	["2_15"] = {
		need_star = 2,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"atk",
				2360
			},
			{
				"def",
				20
			}
		}
	},
	["2_16"] = {
		need_star = 2,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"atk",
				2387
			},
			{
				"def",
				20
			}
		}
	},
	["2_17"] = {
		need_star = 2,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"atk",
				2414
			},
			{
				"def",
				20
			}
		}
	},
	["2_18"] = {
		need_star = 2,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"atk",
				2441
			},
			{
				"def",
				20
			}
		}
	},
	["2_19"] = {
		need_star = 2,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"atk",
				2468
			},
			{
				"def",
				20
			}
		}
	},
	["2_20"] = {
		need_star = 2,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"atk",
				2495
			},
			{
				"def",
				20
			}
		}
	},
	["2_21"] = {
		need_star = 3,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"atk",
				2525
			},
			{
				"def",
				20
			}
		}
	},
	["2_22"] = {
		need_star = 3,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"atk",
				2555
			},
			{
				"def",
				20
			}
		}
	},
	["2_23"] = {
		need_star = 3,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"atk",
				2585
			},
			{
				"def",
				20
			}
		}
	},
	["2_24"] = {
		need_star = 3,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"atk",
				2615
			},
			{
				"def",
				20
			}
		}
	},
	["2_25"] = {
		need_star = 3,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"atk",
				2645
			},
			{
				"def",
				20
			}
		}
	},
	["2_26"] = {
		need_star = 3,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"atk",
				2675
			},
			{
				"def",
				20
			}
		}
	},
	["2_27"] = {
		need_star = 3,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"atk",
				2705
			},
			{
				"def",
				20
			}
		}
	},
	["2_28"] = {
		need_star = 3,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"atk",
				2735
			},
			{
				"def",
				20
			}
		}
	},
	["2_29"] = {
		need_star = 3,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"atk",
				2765
			},
			{
				"def",
				20
			}
		}
	},
	["2_30"] = {
		need_star = 3,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"atk",
				2795
			},
			{
				"def",
				20
			}
		}
	},
	["2_31"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"atk",
				2830
			},
			{
				"def",
				20
			}
		}
	},
	["2_32"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"atk",
				2865
			},
			{
				"def",
				20
			}
		}
	},
	["2_33"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"atk",
				2900
			},
			{
				"def",
				20
			}
		}
	},
	["2_34"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"atk",
				2935
			},
			{
				"def",
				20
			}
		}
	},
	["2_35"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"atk",
				2970
			},
			{
				"def",
				20
			}
		}
	},
	["2_36"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"atk",
				3005
			},
			{
				"def",
				20
			}
		}
	},
	["2_37"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"atk",
				3040
			},
			{
				"def",
				20
			}
		}
	},
	["2_38"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"atk",
				3075
			},
			{
				"def",
				20
			}
		}
	},
	["2_39"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"atk",
				3110
			},
			{
				"def",
				20
			}
		}
	},
	["2_40"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 2,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"atk",
				3545
			},
			{
				"def",
				24
			}
		}
	},
	["2_41"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"atk",
				3580
			},
			{
				"def",
				24
			}
		}
	},
	["2_42"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"atk",
				3615
			},
			{
				"def",
				24
			}
		}
	},
	["2_43"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"atk",
				3650
			},
			{
				"def",
				24
			}
		}
	},
	["2_44"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"atk",
				3685
			},
			{
				"def",
				24
			}
		}
	},
	["2_45"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"atk",
				3720
			},
			{
				"def",
				24
			}
		}
	},
	["2_46"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"atk",
				3755
			},
			{
				"def",
				24
			}
		}
	},
	["2_47"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"atk",
				3790
			},
			{
				"def",
				24
			}
		}
	},
	["2_48"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"atk",
				3825
			},
			{
				"def",
				24
			}
		}
	},
	["2_49"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"atk",
				3860
			},
			{
				"def",
				24
			}
		}
	},
	["2_50"] = {
		need_star = 4,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"atk",
				3895
			},
			{
				"def",
				24
			}
		}
	},
	["2_51"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"atk",
				3940
			},
			{
				"def",
				24
			}
		}
	},
	["2_52"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"atk",
				3985
			},
			{
				"def",
				24
			}
		}
	},
	["2_53"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"atk",
				4030
			},
			{
				"def",
				24
			}
		}
	},
	["2_54"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"atk",
				4075
			},
			{
				"def",
				24
			}
		}
	},
	["2_55"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"atk",
				4120
			},
			{
				"def",
				24
			}
		}
	},
	["2_56"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"atk",
				4165
			},
			{
				"def",
				24
			}
		}
	},
	["2_57"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"atk",
				4210
			},
			{
				"def",
				24
			}
		}
	},
	["2_58"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"atk",
				4255
			},
			{
				"def",
				24
			}
		}
	},
	["2_59"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"atk",
				4300
			},
			{
				"def",
				24
			}
		}
	},
	["2_60"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 2,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"atk",
				4945
			},
			{
				"def",
				30
			}
		}
	},
	["2_61"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"atk",
				4990
			},
			{
				"def",
				30
			}
		}
	},
	["2_62"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"atk",
				5035
			},
			{
				"def",
				30
			}
		}
	},
	["2_63"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"atk",
				5080
			},
			{
				"def",
				30
			}
		}
	},
	["2_64"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"atk",
				5125
			},
			{
				"def",
				30
			}
		}
	},
	["2_65"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"atk",
				5170
			},
			{
				"def",
				30
			}
		}
	},
	["2_66"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"atk",
				5215
			},
			{
				"def",
				30
			}
		}
	},
	["2_67"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"atk",
				5260
			},
			{
				"def",
				30
			}
		}
	},
	["2_68"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"atk",
				5305
			},
			{
				"def",
				30
			}
		}
	},
	["2_69"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"atk",
				5350
			},
			{
				"def",
				30
			}
		}
	},
	["2_70"] = {
		need_star = 5,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"atk",
				5395
			},
			{
				"def",
				30
			}
		}
	},
	["2_71"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"atk",
				5455
			},
			{
				"def",
				30
			}
		}
	},
	["2_72"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"atk",
				5515
			},
			{
				"def",
				30
			}
		}
	},
	["2_73"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"atk",
				5575
			},
			{
				"def",
				30
			}
		}
	},
	["2_74"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"atk",
				5635
			},
			{
				"def",
				30
			}
		}
	},
	["2_75"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"atk",
				5695
			},
			{
				"def",
				30
			}
		}
	},
	["2_76"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"atk",
				5755
			},
			{
				"def",
				30
			}
		}
	},
	["2_77"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"atk",
				5815
			},
			{
				"def",
				30
			}
		}
	},
	["2_78"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"atk",
				5875
			},
			{
				"def",
				30
			}
		}
	},
	["2_79"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"atk",
				5935
			},
			{
				"def",
				30
			}
		}
	},
	["2_80"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 2,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"atk",
				6995
			},
			{
				"def",
				40
			}
		}
	},
	["2_81"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"atk",
				7055
			},
			{
				"def",
				40
			}
		}
	},
	["2_82"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"atk",
				7115
			},
			{
				"def",
				40
			}
		}
	},
	["2_83"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"atk",
				7175
			},
			{
				"def",
				40
			}
		}
	},
	["2_84"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"atk",
				7235
			},
			{
				"def",
				40
			}
		}
	},
	["2_85"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"atk",
				7295
			},
			{
				"def",
				40
			}
		}
	},
	["2_86"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"atk",
				7355
			},
			{
				"def",
				40
			}
		}
	},
	["2_87"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"atk",
				7415
			},
			{
				"def",
				40
			}
		}
	},
	["2_88"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"atk",
				7475
			},
			{
				"def",
				40
			}
		}
	},
	["2_89"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"atk",
				7535
			},
			{
				"def",
				40
			}
		}
	},
	["2_90"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"atk",
				7595
			},
			{
				"def",
				40
			}
		}
	},
	["2_91"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"atk",
				7655
			},
			{
				"def",
				40
			}
		}
	},
	["2_92"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"atk",
				7715
			},
			{
				"def",
				40
			}
		}
	},
	["2_93"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"atk",
				7775
			},
			{
				"def",
				40
			}
		}
	},
	["2_94"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"atk",
				7835
			},
			{
				"def",
				40
			}
		}
	},
	["2_95"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"atk",
				7895
			},
			{
				"def",
				40
			}
		}
	},
	["2_96"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"atk",
				7955
			},
			{
				"def",
				40
			}
		}
	},
	["2_97"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"atk",
				8015
			},
			{
				"def",
				40
			}
		}
	},
	["2_98"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"atk",
				8075
			},
			{
				"def",
				40
			}
		}
	},
	["2_99"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"atk",
				8135
			},
			{
				"def",
				40
			}
		}
	},
	["2_100"] = {
		need_star = 6,
		name = "烧烧果实",
		desc = "",
		id = 2,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"atk",
				8195
			},
			{
				"def",
				40
			}
		}
	},
	["3_1"] = {
		need_star = 1,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 1,
		need_items = {
			{
				19003,
				50
			}
		},
		atts = {
			{
				"atk",
				2000
			},
			{
				"speed",
				10
			}
		}
	},
	["3_2"] = {
		need_star = 1,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"atk",
				2025
			},
			{
				"speed",
				10
			}
		}
	},
	["3_3"] = {
		need_star = 1,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"atk",
				2050
			},
			{
				"speed",
				10
			}
		}
	},
	["3_4"] = {
		need_star = 1,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"atk",
				2075
			},
			{
				"speed",
				10
			}
		}
	},
	["3_5"] = {
		need_star = 1,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"atk",
				2100
			},
			{
				"speed",
				10
			}
		}
	},
	["3_6"] = {
		need_star = 1,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"atk",
				2125
			},
			{
				"speed",
				10
			}
		}
	},
	["3_7"] = {
		need_star = 1,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"atk",
				2150
			},
			{
				"speed",
				10
			}
		}
	},
	["3_8"] = {
		need_star = 1,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"atk",
				2175
			},
			{
				"speed",
				10
			}
		}
	},
	["3_9"] = {
		need_star = 1,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"atk",
				2200
			},
			{
				"speed",
				10
			}
		}
	},
	["3_10"] = {
		need_star = 1,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"atk",
				2225
			},
			{
				"speed",
				10
			}
		}
	},
	["3_11"] = {
		need_star = 2,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"atk",
				2252
			},
			{
				"speed",
				10
			}
		}
	},
	["3_12"] = {
		need_star = 2,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"atk",
				2279
			},
			{
				"speed",
				10
			}
		}
	},
	["3_13"] = {
		need_star = 2,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"atk",
				2306
			},
			{
				"speed",
				10
			}
		}
	},
	["3_14"] = {
		need_star = 2,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"atk",
				2333
			},
			{
				"speed",
				10
			}
		}
	},
	["3_15"] = {
		need_star = 2,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"atk",
				2360
			},
			{
				"speed",
				10
			}
		}
	},
	["3_16"] = {
		need_star = 2,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"atk",
				2387
			},
			{
				"speed",
				10
			}
		}
	},
	["3_17"] = {
		need_star = 2,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"atk",
				2414
			},
			{
				"speed",
				10
			}
		}
	},
	["3_18"] = {
		need_star = 2,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"atk",
				2441
			},
			{
				"speed",
				10
			}
		}
	},
	["3_19"] = {
		need_star = 2,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"atk",
				2468
			},
			{
				"speed",
				10
			}
		}
	},
	["3_20"] = {
		need_star = 2,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"atk",
				2495
			},
			{
				"speed",
				10
			}
		}
	},
	["3_21"] = {
		need_star = 3,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"atk",
				2525
			},
			{
				"speed",
				10
			}
		}
	},
	["3_22"] = {
		need_star = 3,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"atk",
				2555
			},
			{
				"speed",
				10
			}
		}
	},
	["3_23"] = {
		need_star = 3,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"atk",
				2585
			},
			{
				"speed",
				10
			}
		}
	},
	["3_24"] = {
		need_star = 3,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"atk",
				2615
			},
			{
				"speed",
				10
			}
		}
	},
	["3_25"] = {
		need_star = 3,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"atk",
				2645
			},
			{
				"speed",
				10
			}
		}
	},
	["3_26"] = {
		need_star = 3,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"atk",
				2675
			},
			{
				"speed",
				10
			}
		}
	},
	["3_27"] = {
		need_star = 3,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"atk",
				2705
			},
			{
				"speed",
				10
			}
		}
	},
	["3_28"] = {
		need_star = 3,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"atk",
				2735
			},
			{
				"speed",
				10
			}
		}
	},
	["3_29"] = {
		need_star = 3,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"atk",
				2765
			},
			{
				"speed",
				10
			}
		}
	},
	["3_30"] = {
		need_star = 3,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"atk",
				2795
			},
			{
				"speed",
				10
			}
		}
	},
	["3_31"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"atk",
				2830
			},
			{
				"speed",
				10
			}
		}
	},
	["3_32"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"atk",
				2865
			},
			{
				"speed",
				10
			}
		}
	},
	["3_33"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"atk",
				2900
			},
			{
				"speed",
				10
			}
		}
	},
	["3_34"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"atk",
				2935
			},
			{
				"speed",
				10
			}
		}
	},
	["3_35"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"atk",
				2970
			},
			{
				"speed",
				10
			}
		}
	},
	["3_36"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"atk",
				3005
			},
			{
				"speed",
				10
			}
		}
	},
	["3_37"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"atk",
				3040
			},
			{
				"speed",
				10
			}
		}
	},
	["3_38"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"atk",
				3075
			},
			{
				"speed",
				10
			}
		}
	},
	["3_39"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"atk",
				3110
			},
			{
				"speed",
				10
			}
		}
	},
	["3_40"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 3,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"atk",
				3545
			},
			{
				"speed",
				12
			}
		}
	},
	["3_41"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"atk",
				3580
			},
			{
				"speed",
				12
			}
		}
	},
	["3_42"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"atk",
				3615
			},
			{
				"speed",
				12
			}
		}
	},
	["3_43"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"atk",
				3650
			},
			{
				"speed",
				12
			}
		}
	},
	["3_44"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"atk",
				3685
			},
			{
				"speed",
				12
			}
		}
	},
	["3_45"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"atk",
				3720
			},
			{
				"speed",
				12
			}
		}
	},
	["3_46"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"atk",
				3755
			},
			{
				"speed",
				12
			}
		}
	},
	["3_47"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"atk",
				3790
			},
			{
				"speed",
				12
			}
		}
	},
	["3_48"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"atk",
				3825
			},
			{
				"speed",
				12
			}
		}
	},
	["3_49"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"atk",
				3860
			},
			{
				"speed",
				12
			}
		}
	},
	["3_50"] = {
		need_star = 4,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"atk",
				3895
			},
			{
				"speed",
				12
			}
		}
	},
	["3_51"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"atk",
				3940
			},
			{
				"speed",
				12
			}
		}
	},
	["3_52"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"atk",
				3985
			},
			{
				"speed",
				12
			}
		}
	},
	["3_53"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"atk",
				4030
			},
			{
				"speed",
				12
			}
		}
	},
	["3_54"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"atk",
				4075
			},
			{
				"speed",
				12
			}
		}
	},
	["3_55"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"atk",
				4120
			},
			{
				"speed",
				12
			}
		}
	},
	["3_56"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"atk",
				4165
			},
			{
				"speed",
				12
			}
		}
	},
	["3_57"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"atk",
				4210
			},
			{
				"speed",
				12
			}
		}
	},
	["3_58"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"atk",
				4255
			},
			{
				"speed",
				12
			}
		}
	},
	["3_59"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"atk",
				4300
			},
			{
				"speed",
				12
			}
		}
	},
	["3_60"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 3,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"atk",
				4945
			},
			{
				"speed",
				15
			}
		}
	},
	["3_61"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"atk",
				4990
			},
			{
				"speed",
				15
			}
		}
	},
	["3_62"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"atk",
				5035
			},
			{
				"speed",
				15
			}
		}
	},
	["3_63"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"atk",
				5080
			},
			{
				"speed",
				15
			}
		}
	},
	["3_64"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"atk",
				5125
			},
			{
				"speed",
				15
			}
		}
	},
	["3_65"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"atk",
				5170
			},
			{
				"speed",
				15
			}
		}
	},
	["3_66"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"atk",
				5215
			},
			{
				"speed",
				15
			}
		}
	},
	["3_67"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"atk",
				5260
			},
			{
				"speed",
				15
			}
		}
	},
	["3_68"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"atk",
				5305
			},
			{
				"speed",
				15
			}
		}
	},
	["3_69"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"atk",
				5350
			},
			{
				"speed",
				15
			}
		}
	},
	["3_70"] = {
		need_star = 5,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"atk",
				5395
			},
			{
				"speed",
				15
			}
		}
	},
	["3_71"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"atk",
				5455
			},
			{
				"speed",
				15
			}
		}
	},
	["3_72"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"atk",
				5515
			},
			{
				"speed",
				15
			}
		}
	},
	["3_73"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"atk",
				5575
			},
			{
				"speed",
				15
			}
		}
	},
	["3_74"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"atk",
				5635
			},
			{
				"speed",
				15
			}
		}
	},
	["3_75"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"atk",
				5695
			},
			{
				"speed",
				15
			}
		}
	},
	["3_76"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"atk",
				5755
			},
			{
				"speed",
				15
			}
		}
	},
	["3_77"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"atk",
				5815
			},
			{
				"speed",
				15
			}
		}
	},
	["3_78"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"atk",
				5875
			},
			{
				"speed",
				15
			}
		}
	},
	["3_79"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"atk",
				5935
			},
			{
				"speed",
				15
			}
		}
	},
	["3_80"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 3,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"atk",
				6995
			},
			{
				"speed",
				20
			}
		}
	},
	["3_81"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"atk",
				7055
			},
			{
				"speed",
				20
			}
		}
	},
	["3_82"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"atk",
				7115
			},
			{
				"speed",
				20
			}
		}
	},
	["3_83"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"atk",
				7175
			},
			{
				"speed",
				20
			}
		}
	},
	["3_84"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"atk",
				7235
			},
			{
				"speed",
				20
			}
		}
	},
	["3_85"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"atk",
				7295
			},
			{
				"speed",
				20
			}
		}
	},
	["3_86"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"atk",
				7355
			},
			{
				"speed",
				20
			}
		}
	},
	["3_87"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"atk",
				7415
			},
			{
				"speed",
				20
			}
		}
	},
	["3_88"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"atk",
				7475
			},
			{
				"speed",
				20
			}
		}
	},
	["3_89"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"atk",
				7535
			},
			{
				"speed",
				20
			}
		}
	},
	["3_90"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"atk",
				7595
			},
			{
				"speed",
				20
			}
		}
	},
	["3_91"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"atk",
				7655
			},
			{
				"speed",
				20
			}
		}
	},
	["3_92"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"atk",
				7715
			},
			{
				"speed",
				20
			}
		}
	},
	["3_93"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"atk",
				7775
			},
			{
				"speed",
				20
			}
		}
	},
	["3_94"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"atk",
				7835
			},
			{
				"speed",
				20
			}
		}
	},
	["3_95"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"atk",
				7895
			},
			{
				"speed",
				20
			}
		}
	},
	["3_96"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"atk",
				7955
			},
			{
				"speed",
				20
			}
		}
	},
	["3_97"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"atk",
				8015
			},
			{
				"speed",
				20
			}
		}
	},
	["3_98"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"atk",
				8075
			},
			{
				"speed",
				20
			}
		}
	},
	["3_99"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"atk",
				8135
			},
			{
				"speed",
				20
			}
		}
	},
	["3_100"] = {
		need_star = 6,
		name = "沙沙果实",
		desc = "",
		id = 3,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"atk",
				8195
			},
			{
				"speed",
				20
			}
		}
	},
	["4_1"] = {
		need_star = 1,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 1,
		need_items = {
			{
				19004,
				50
			}
		},
		atts = {
			{
				"hp_max",
				10000
			},
			{
				"def",
				20
			}
		}
	},
	["4_2"] = {
		need_star = 1,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				10125
			},
			{
				"def",
				20
			}
		}
	},
	["4_3"] = {
		need_star = 1,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				10250
			},
			{
				"def",
				20
			}
		}
	},
	["4_4"] = {
		need_star = 1,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				10375
			},
			{
				"def",
				20
			}
		}
	},
	["4_5"] = {
		need_star = 1,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				10500
			},
			{
				"def",
				20
			}
		}
	},
	["4_6"] = {
		need_star = 1,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				10625
			},
			{
				"def",
				20
			}
		}
	},
	["4_7"] = {
		need_star = 1,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				10750
			},
			{
				"def",
				20
			}
		}
	},
	["4_8"] = {
		need_star = 1,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				10875
			},
			{
				"def",
				20
			}
		}
	},
	["4_9"] = {
		need_star = 1,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				11000
			},
			{
				"def",
				20
			}
		}
	},
	["4_10"] = {
		need_star = 1,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				11125
			},
			{
				"def",
				20
			}
		}
	},
	["4_11"] = {
		need_star = 2,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				11260
			},
			{
				"def",
				20
			}
		}
	},
	["4_12"] = {
		need_star = 2,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				11395
			},
			{
				"def",
				20
			}
		}
	},
	["4_13"] = {
		need_star = 2,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				11530
			},
			{
				"def",
				20
			}
		}
	},
	["4_14"] = {
		need_star = 2,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				11665
			},
			{
				"def",
				20
			}
		}
	},
	["4_15"] = {
		need_star = 2,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				11800
			},
			{
				"def",
				20
			}
		}
	},
	["4_16"] = {
		need_star = 2,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				11935
			},
			{
				"def",
				20
			}
		}
	},
	["4_17"] = {
		need_star = 2,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				12070
			},
			{
				"def",
				20
			}
		}
	},
	["4_18"] = {
		need_star = 2,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				12205
			},
			{
				"def",
				20
			}
		}
	},
	["4_19"] = {
		need_star = 2,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				12340
			},
			{
				"def",
				20
			}
		}
	},
	["4_20"] = {
		need_star = 2,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				12475
			},
			{
				"def",
				20
			}
		}
	},
	["4_21"] = {
		need_star = 3,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				12620
			},
			{
				"def",
				20
			}
		}
	},
	["4_22"] = {
		need_star = 3,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				12765
			},
			{
				"def",
				20
			}
		}
	},
	["4_23"] = {
		need_star = 3,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				12910
			},
			{
				"def",
				20
			}
		}
	},
	["4_24"] = {
		need_star = 3,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				13055
			},
			{
				"def",
				20
			}
		}
	},
	["4_25"] = {
		need_star = 3,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"def",
				20
			}
		}
	},
	["4_26"] = {
		need_star = 3,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				13345
			},
			{
				"def",
				20
			}
		}
	},
	["4_27"] = {
		need_star = 3,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				13490
			},
			{
				"def",
				20
			}
		}
	},
	["4_28"] = {
		need_star = 3,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				13635
			},
			{
				"def",
				20
			}
		}
	},
	["4_29"] = {
		need_star = 3,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				13780
			},
			{
				"def",
				20
			}
		}
	},
	["4_30"] = {
		need_star = 3,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				13925
			},
			{
				"def",
				20
			}
		}
	},
	["4_31"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				14085
			},
			{
				"def",
				20
			}
		}
	},
	["4_32"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				14245
			},
			{
				"def",
				20
			}
		}
	},
	["4_33"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				14405
			},
			{
				"def",
				20
			}
		}
	},
	["4_34"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				14565
			},
			{
				"def",
				20
			}
		}
	},
	["4_35"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				14725
			},
			{
				"def",
				20
			}
		}
	},
	["4_36"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				14885
			},
			{
				"def",
				20
			}
		}
	},
	["4_37"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				15045
			},
			{
				"def",
				20
			}
		}
	},
	["4_38"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				15205
			},
			{
				"def",
				20
			}
		}
	},
	["4_39"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				15365
			},
			{
				"def",
				20
			}
		}
	},
	["4_40"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 4,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				17525
			},
			{
				"def",
				24
			}
		}
	},
	["4_41"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				17685
			},
			{
				"def",
				24
			}
		}
	},
	["4_42"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				17845
			},
			{
				"def",
				24
			}
		}
	},
	["4_43"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				18005
			},
			{
				"def",
				24
			}
		}
	},
	["4_44"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				18165
			},
			{
				"def",
				24
			}
		}
	},
	["4_45"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				18325
			},
			{
				"def",
				24
			}
		}
	},
	["4_46"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				18485
			},
			{
				"def",
				24
			}
		}
	},
	["4_47"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				18645
			},
			{
				"def",
				24
			}
		}
	},
	["4_48"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				18805
			},
			{
				"def",
				24
			}
		}
	},
	["4_49"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				18965
			},
			{
				"def",
				24
			}
		}
	},
	["4_50"] = {
		need_star = 4,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				19125
			},
			{
				"def",
				24
			}
		}
	},
	["4_51"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				19315
			},
			{
				"def",
				24
			}
		}
	},
	["4_52"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				19505
			},
			{
				"def",
				24
			}
		}
	},
	["4_53"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				19695
			},
			{
				"def",
				24
			}
		}
	},
	["4_54"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				19885
			},
			{
				"def",
				24
			}
		}
	},
	["4_55"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				20075
			},
			{
				"def",
				24
			}
		}
	},
	["4_56"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				20265
			},
			{
				"def",
				24
			}
		}
	},
	["4_57"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				20455
			},
			{
				"def",
				24
			}
		}
	},
	["4_58"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				20645
			},
			{
				"def",
				24
			}
		}
	},
	["4_59"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				20835
			},
			{
				"def",
				24
			}
		}
	},
	["4_60"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 4,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				24025
			},
			{
				"def",
				30
			}
		}
	},
	["4_61"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				24215
			},
			{
				"def",
				30
			}
		}
	},
	["4_62"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				24405
			},
			{
				"def",
				30
			}
		}
	},
	["4_63"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				24595
			},
			{
				"def",
				30
			}
		}
	},
	["4_64"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				24785
			},
			{
				"def",
				30
			}
		}
	},
	["4_65"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				24975
			},
			{
				"def",
				30
			}
		}
	},
	["4_66"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				25165
			},
			{
				"def",
				30
			}
		}
	},
	["4_67"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				25355
			},
			{
				"def",
				30
			}
		}
	},
	["4_68"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				25545
			},
			{
				"def",
				30
			}
		}
	},
	["4_69"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				25735
			},
			{
				"def",
				30
			}
		}
	},
	["4_70"] = {
		need_star = 5,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				25925
			},
			{
				"def",
				30
			}
		}
	},
	["4_71"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"hp_max",
				26155
			},
			{
				"def",
				30
			}
		}
	},
	["4_72"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"hp_max",
				26385
			},
			{
				"def",
				30
			}
		}
	},
	["4_73"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"hp_max",
				26615
			},
			{
				"def",
				30
			}
		}
	},
	["4_74"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"hp_max",
				26845
			},
			{
				"def",
				30
			}
		}
	},
	["4_75"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"hp_max",
				27075
			},
			{
				"def",
				30
			}
		}
	},
	["4_76"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"hp_max",
				27305
			},
			{
				"def",
				30
			}
		}
	},
	["4_77"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"hp_max",
				27535
			},
			{
				"def",
				30
			}
		}
	},
	["4_78"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"hp_max",
				27765
			},
			{
				"def",
				30
			}
		}
	},
	["4_79"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"hp_max",
				27995
			},
			{
				"def",
				30
			}
		}
	},
	["4_80"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 4,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"hp_max",
				33225
			},
			{
				"def",
				40
			}
		}
	},
	["4_81"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"hp_max",
				33455
			},
			{
				"def",
				40
			}
		}
	},
	["4_82"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"hp_max",
				33685
			},
			{
				"def",
				40
			}
		}
	},
	["4_83"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"hp_max",
				33915
			},
			{
				"def",
				40
			}
		}
	},
	["4_84"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"hp_max",
				34145
			},
			{
				"def",
				40
			}
		}
	},
	["4_85"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"hp_max",
				34375
			},
			{
				"def",
				40
			}
		}
	},
	["4_86"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"hp_max",
				34605
			},
			{
				"def",
				40
			}
		}
	},
	["4_87"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"hp_max",
				34835
			},
			{
				"def",
				40
			}
		}
	},
	["4_88"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"hp_max",
				35065
			},
			{
				"def",
				40
			}
		}
	},
	["4_89"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"hp_max",
				35295
			},
			{
				"def",
				40
			}
		}
	},
	["4_90"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"hp_max",
				35525
			},
			{
				"def",
				40
			}
		}
	},
	["4_91"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"hp_max",
				35755
			},
			{
				"def",
				40
			}
		}
	},
	["4_92"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"hp_max",
				35985
			},
			{
				"def",
				40
			}
		}
	},
	["4_93"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"hp_max",
				36215
			},
			{
				"def",
				40
			}
		}
	},
	["4_94"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"hp_max",
				36445
			},
			{
				"def",
				40
			}
		}
	},
	["4_95"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"hp_max",
				36675
			},
			{
				"def",
				40
			}
		}
	},
	["4_96"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"hp_max",
				36905
			},
			{
				"def",
				40
			}
		}
	},
	["4_97"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"hp_max",
				37135
			},
			{
				"def",
				40
			}
		}
	},
	["4_98"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"hp_max",
				37365
			},
			{
				"def",
				40
			}
		}
	},
	["4_99"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"hp_max",
				37595
			},
			{
				"def",
				40
			}
		}
	},
	["4_100"] = {
		need_star = 6,
		name = "闪闪果实",
		desc = "",
		id = 4,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"hp_max",
				37825
			},
			{
				"def",
				40
			}
		}
	},
	["5_1"] = {
		need_star = 1,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 1,
		need_items = {
			{
				19005,
				50
			}
		},
		atts = {
			{
				"atk",
				2000
			},
			{
				"def",
				20
			}
		}
	},
	["5_2"] = {
		need_star = 1,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"atk",
				2025
			},
			{
				"def",
				20
			}
		}
	},
	["5_3"] = {
		need_star = 1,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"atk",
				2050
			},
			{
				"def",
				20
			}
		}
	},
	["5_4"] = {
		need_star = 1,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"atk",
				2075
			},
			{
				"def",
				20
			}
		}
	},
	["5_5"] = {
		need_star = 1,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"atk",
				2100
			},
			{
				"def",
				20
			}
		}
	},
	["5_6"] = {
		need_star = 1,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"atk",
				2125
			},
			{
				"def",
				20
			}
		}
	},
	["5_7"] = {
		need_star = 1,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"atk",
				2150
			},
			{
				"def",
				20
			}
		}
	},
	["5_8"] = {
		need_star = 1,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"atk",
				2175
			},
			{
				"def",
				20
			}
		}
	},
	["5_9"] = {
		need_star = 1,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"atk",
				2200
			},
			{
				"def",
				20
			}
		}
	},
	["5_10"] = {
		need_star = 1,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"atk",
				2225
			},
			{
				"def",
				20
			}
		}
	},
	["5_11"] = {
		need_star = 2,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"atk",
				2252
			},
			{
				"def",
				20
			}
		}
	},
	["5_12"] = {
		need_star = 2,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"atk",
				2279
			},
			{
				"def",
				20
			}
		}
	},
	["5_13"] = {
		need_star = 2,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"atk",
				2306
			},
			{
				"def",
				20
			}
		}
	},
	["5_14"] = {
		need_star = 2,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"atk",
				2333
			},
			{
				"def",
				20
			}
		}
	},
	["5_15"] = {
		need_star = 2,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"atk",
				2360
			},
			{
				"def",
				20
			}
		}
	},
	["5_16"] = {
		need_star = 2,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"atk",
				2387
			},
			{
				"def",
				20
			}
		}
	},
	["5_17"] = {
		need_star = 2,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"atk",
				2414
			},
			{
				"def",
				20
			}
		}
	},
	["5_18"] = {
		need_star = 2,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"atk",
				2441
			},
			{
				"def",
				20
			}
		}
	},
	["5_19"] = {
		need_star = 2,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"atk",
				2468
			},
			{
				"def",
				20
			}
		}
	},
	["5_20"] = {
		need_star = 2,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"atk",
				2495
			},
			{
				"def",
				20
			}
		}
	},
	["5_21"] = {
		need_star = 3,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"atk",
				2525
			},
			{
				"def",
				20
			}
		}
	},
	["5_22"] = {
		need_star = 3,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"atk",
				2555
			},
			{
				"def",
				20
			}
		}
	},
	["5_23"] = {
		need_star = 3,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"atk",
				2585
			},
			{
				"def",
				20
			}
		}
	},
	["5_24"] = {
		need_star = 3,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"atk",
				2615
			},
			{
				"def",
				20
			}
		}
	},
	["5_25"] = {
		need_star = 3,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"atk",
				2645
			},
			{
				"def",
				20
			}
		}
	},
	["5_26"] = {
		need_star = 3,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"atk",
				2675
			},
			{
				"def",
				20
			}
		}
	},
	["5_27"] = {
		need_star = 3,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"atk",
				2705
			},
			{
				"def",
				20
			}
		}
	},
	["5_28"] = {
		need_star = 3,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"atk",
				2735
			},
			{
				"def",
				20
			}
		}
	},
	["5_29"] = {
		need_star = 3,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"atk",
				2765
			},
			{
				"def",
				20
			}
		}
	},
	["5_30"] = {
		need_star = 3,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"atk",
				2795
			},
			{
				"def",
				20
			}
		}
	},
	["5_31"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"atk",
				2830
			},
			{
				"def",
				20
			}
		}
	},
	["5_32"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"atk",
				2865
			},
			{
				"def",
				20
			}
		}
	},
	["5_33"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"atk",
				2900
			},
			{
				"def",
				20
			}
		}
	},
	["5_34"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"atk",
				2935
			},
			{
				"def",
				20
			}
		}
	},
	["5_35"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"atk",
				2970
			},
			{
				"def",
				20
			}
		}
	},
	["5_36"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"atk",
				3005
			},
			{
				"def",
				20
			}
		}
	},
	["5_37"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"atk",
				3040
			},
			{
				"def",
				20
			}
		}
	},
	["5_38"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"atk",
				3075
			},
			{
				"def",
				20
			}
		}
	},
	["5_39"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"atk",
				3110
			},
			{
				"def",
				20
			}
		}
	},
	["5_40"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 5,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"atk",
				3545
			},
			{
				"def",
				24
			}
		}
	},
	["5_41"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"atk",
				3580
			},
			{
				"def",
				24
			}
		}
	},
	["5_42"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"atk",
				3615
			},
			{
				"def",
				24
			}
		}
	},
	["5_43"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"atk",
				3650
			},
			{
				"def",
				24
			}
		}
	},
	["5_44"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"atk",
				3685
			},
			{
				"def",
				24
			}
		}
	},
	["5_45"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"atk",
				3720
			},
			{
				"def",
				24
			}
		}
	},
	["5_46"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"atk",
				3755
			},
			{
				"def",
				24
			}
		}
	},
	["5_47"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"atk",
				3790
			},
			{
				"def",
				24
			}
		}
	},
	["5_48"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"atk",
				3825
			},
			{
				"def",
				24
			}
		}
	},
	["5_49"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"atk",
				3860
			},
			{
				"def",
				24
			}
		}
	},
	["5_50"] = {
		need_star = 4,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"atk",
				3895
			},
			{
				"def",
				24
			}
		}
	},
	["5_51"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"atk",
				3940
			},
			{
				"def",
				24
			}
		}
	},
	["5_52"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"atk",
				3985
			},
			{
				"def",
				24
			}
		}
	},
	["5_53"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"atk",
				4030
			},
			{
				"def",
				24
			}
		}
	},
	["5_54"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"atk",
				4075
			},
			{
				"def",
				24
			}
		}
	},
	["5_55"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"atk",
				4120
			},
			{
				"def",
				24
			}
		}
	},
	["5_56"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"atk",
				4165
			},
			{
				"def",
				24
			}
		}
	},
	["5_57"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"atk",
				4210
			},
			{
				"def",
				24
			}
		}
	},
	["5_58"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"atk",
				4255
			},
			{
				"def",
				24
			}
		}
	},
	["5_59"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"atk",
				4300
			},
			{
				"def",
				24
			}
		}
	},
	["5_60"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 5,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"atk",
				4945
			},
			{
				"def",
				30
			}
		}
	},
	["5_61"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"atk",
				4990
			},
			{
				"def",
				30
			}
		}
	},
	["5_62"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"atk",
				5035
			},
			{
				"def",
				30
			}
		}
	},
	["5_63"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"atk",
				5080
			},
			{
				"def",
				30
			}
		}
	},
	["5_64"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"atk",
				5125
			},
			{
				"def",
				30
			}
		}
	},
	["5_65"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"atk",
				5170
			},
			{
				"def",
				30
			}
		}
	},
	["5_66"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"atk",
				5215
			},
			{
				"def",
				30
			}
		}
	},
	["5_67"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"atk",
				5260
			},
			{
				"def",
				30
			}
		}
	},
	["5_68"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"atk",
				5305
			},
			{
				"def",
				30
			}
		}
	},
	["5_69"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"atk",
				5350
			},
			{
				"def",
				30
			}
		}
	},
	["5_70"] = {
		need_star = 5,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"atk",
				5395
			},
			{
				"def",
				30
			}
		}
	},
	["5_71"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"atk",
				5455
			},
			{
				"def",
				30
			}
		}
	},
	["5_72"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"atk",
				5515
			},
			{
				"def",
				30
			}
		}
	},
	["5_73"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"atk",
				5575
			},
			{
				"def",
				30
			}
		}
	},
	["5_74"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"atk",
				5635
			},
			{
				"def",
				30
			}
		}
	},
	["5_75"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"atk",
				5695
			},
			{
				"def",
				30
			}
		}
	},
	["5_76"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"atk",
				5755
			},
			{
				"def",
				30
			}
		}
	},
	["5_77"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"atk",
				5815
			},
			{
				"def",
				30
			}
		}
	},
	["5_78"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"atk",
				5875
			},
			{
				"def",
				30
			}
		}
	},
	["5_79"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"atk",
				5935
			},
			{
				"def",
				30
			}
		}
	},
	["5_80"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 5,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"atk",
				6995
			},
			{
				"def",
				40
			}
		}
	},
	["5_81"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"atk",
				7055
			},
			{
				"def",
				40
			}
		}
	},
	["5_82"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"atk",
				7115
			},
			{
				"def",
				40
			}
		}
	},
	["5_83"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"atk",
				7175
			},
			{
				"def",
				40
			}
		}
	},
	["5_84"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"atk",
				7235
			},
			{
				"def",
				40
			}
		}
	},
	["5_85"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"atk",
				7295
			},
			{
				"def",
				40
			}
		}
	},
	["5_86"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"atk",
				7355
			},
			{
				"def",
				40
			}
		}
	},
	["5_87"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"atk",
				7415
			},
			{
				"def",
				40
			}
		}
	},
	["5_88"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"atk",
				7475
			},
			{
				"def",
				40
			}
		}
	},
	["5_89"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"atk",
				7535
			},
			{
				"def",
				40
			}
		}
	},
	["5_90"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"atk",
				7595
			},
			{
				"def",
				40
			}
		}
	},
	["5_91"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"atk",
				7655
			},
			{
				"def",
				40
			}
		}
	},
	["5_92"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"atk",
				7715
			},
			{
				"def",
				40
			}
		}
	},
	["5_93"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"atk",
				7775
			},
			{
				"def",
				40
			}
		}
	},
	["5_94"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"atk",
				7835
			},
			{
				"def",
				40
			}
		}
	},
	["5_95"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"atk",
				7895
			},
			{
				"def",
				40
			}
		}
	},
	["5_96"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"atk",
				7955
			},
			{
				"def",
				40
			}
		}
	},
	["5_97"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"atk",
				8015
			},
			{
				"def",
				40
			}
		}
	},
	["5_98"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"atk",
				8075
			},
			{
				"def",
				40
			}
		}
	},
	["5_99"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"atk",
				8135
			},
			{
				"def",
				40
			}
		}
	},
	["5_100"] = {
		need_star = 6,
		name = "暗暗果实",
		desc = "",
		id = 5,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"atk",
				8195
			},
			{
				"def",
				40
			}
		}
	},
	["6_1"] = {
		need_star = 1,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 1,
		need_items = {
			{
				19006,
				50
			}
		},
		atts = {
			{
				"hp_max",
				10000
			},
			{
				"def",
				20
			}
		}
	},
	["6_2"] = {
		need_star = 1,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				10125
			},
			{
				"def",
				20
			}
		}
	},
	["6_3"] = {
		need_star = 1,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				10250
			},
			{
				"def",
				20
			}
		}
	},
	["6_4"] = {
		need_star = 1,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				10375
			},
			{
				"def",
				20
			}
		}
	},
	["6_5"] = {
		need_star = 1,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				10500
			},
			{
				"def",
				20
			}
		}
	},
	["6_6"] = {
		need_star = 1,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				10625
			},
			{
				"def",
				20
			}
		}
	},
	["6_7"] = {
		need_star = 1,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				10750
			},
			{
				"def",
				20
			}
		}
	},
	["6_8"] = {
		need_star = 1,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				10875
			},
			{
				"def",
				20
			}
		}
	},
	["6_9"] = {
		need_star = 1,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				11000
			},
			{
				"def",
				20
			}
		}
	},
	["6_10"] = {
		need_star = 1,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				11125
			},
			{
				"def",
				20
			}
		}
	},
	["6_11"] = {
		need_star = 2,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				11260
			},
			{
				"def",
				20
			}
		}
	},
	["6_12"] = {
		need_star = 2,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				11395
			},
			{
				"def",
				20
			}
		}
	},
	["6_13"] = {
		need_star = 2,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				11530
			},
			{
				"def",
				20
			}
		}
	},
	["6_14"] = {
		need_star = 2,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				11665
			},
			{
				"def",
				20
			}
		}
	},
	["6_15"] = {
		need_star = 2,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				11800
			},
			{
				"def",
				20
			}
		}
	},
	["6_16"] = {
		need_star = 2,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				11935
			},
			{
				"def",
				20
			}
		}
	},
	["6_17"] = {
		need_star = 2,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				12070
			},
			{
				"def",
				20
			}
		}
	},
	["6_18"] = {
		need_star = 2,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				12205
			},
			{
				"def",
				20
			}
		}
	},
	["6_19"] = {
		need_star = 2,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				12340
			},
			{
				"def",
				20
			}
		}
	},
	["6_20"] = {
		need_star = 2,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				12475
			},
			{
				"def",
				20
			}
		}
	},
	["6_21"] = {
		need_star = 3,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				12620
			},
			{
				"def",
				20
			}
		}
	},
	["6_22"] = {
		need_star = 3,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				12765
			},
			{
				"def",
				20
			}
		}
	},
	["6_23"] = {
		need_star = 3,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				12910
			},
			{
				"def",
				20
			}
		}
	},
	["6_24"] = {
		need_star = 3,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				13055
			},
			{
				"def",
				20
			}
		}
	},
	["6_25"] = {
		need_star = 3,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"def",
				20
			}
		}
	},
	["6_26"] = {
		need_star = 3,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				13345
			},
			{
				"def",
				20
			}
		}
	},
	["6_27"] = {
		need_star = 3,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				13490
			},
			{
				"def",
				20
			}
		}
	},
	["6_28"] = {
		need_star = 3,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				13635
			},
			{
				"def",
				20
			}
		}
	},
	["6_29"] = {
		need_star = 3,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				13780
			},
			{
				"def",
				20
			}
		}
	},
	["6_30"] = {
		need_star = 3,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				13925
			},
			{
				"def",
				20
			}
		}
	},
	["6_31"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				14085
			},
			{
				"def",
				20
			}
		}
	},
	["6_32"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				14245
			},
			{
				"def",
				20
			}
		}
	},
	["6_33"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				14405
			},
			{
				"def",
				20
			}
		}
	},
	["6_34"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				14565
			},
			{
				"def",
				20
			}
		}
	},
	["6_35"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				14725
			},
			{
				"def",
				20
			}
		}
	},
	["6_36"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				14885
			},
			{
				"def",
				20
			}
		}
	},
	["6_37"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				15045
			},
			{
				"def",
				20
			}
		}
	},
	["6_38"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				15205
			},
			{
				"def",
				20
			}
		}
	},
	["6_39"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				15365
			},
			{
				"def",
				20
			}
		}
	},
	["6_40"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 6,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				17525
			},
			{
				"def",
				24
			}
		}
	},
	["6_41"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				17685
			},
			{
				"def",
				24
			}
		}
	},
	["6_42"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				17845
			},
			{
				"def",
				24
			}
		}
	},
	["6_43"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				18005
			},
			{
				"def",
				24
			}
		}
	},
	["6_44"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				18165
			},
			{
				"def",
				24
			}
		}
	},
	["6_45"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				18325
			},
			{
				"def",
				24
			}
		}
	},
	["6_46"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				18485
			},
			{
				"def",
				24
			}
		}
	},
	["6_47"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				18645
			},
			{
				"def",
				24
			}
		}
	},
	["6_48"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				18805
			},
			{
				"def",
				24
			}
		}
	},
	["6_49"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				18965
			},
			{
				"def",
				24
			}
		}
	},
	["6_50"] = {
		need_star = 4,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				19125
			},
			{
				"def",
				24
			}
		}
	},
	["6_51"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				19315
			},
			{
				"def",
				24
			}
		}
	},
	["6_52"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				19505
			},
			{
				"def",
				24
			}
		}
	},
	["6_53"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				19695
			},
			{
				"def",
				24
			}
		}
	},
	["6_54"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				19885
			},
			{
				"def",
				24
			}
		}
	},
	["6_55"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				20075
			},
			{
				"def",
				24
			}
		}
	},
	["6_56"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				20265
			},
			{
				"def",
				24
			}
		}
	},
	["6_57"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				20455
			},
			{
				"def",
				24
			}
		}
	},
	["6_58"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				20645
			},
			{
				"def",
				24
			}
		}
	},
	["6_59"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				20835
			},
			{
				"def",
				24
			}
		}
	},
	["6_60"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 6,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				24025
			},
			{
				"def",
				30
			}
		}
	},
	["6_61"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				24215
			},
			{
				"def",
				30
			}
		}
	},
	["6_62"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				24405
			},
			{
				"def",
				30
			}
		}
	},
	["6_63"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				24595
			},
			{
				"def",
				30
			}
		}
	},
	["6_64"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				24785
			},
			{
				"def",
				30
			}
		}
	},
	["6_65"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				24975
			},
			{
				"def",
				30
			}
		}
	},
	["6_66"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				25165
			},
			{
				"def",
				30
			}
		}
	},
	["6_67"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				25355
			},
			{
				"def",
				30
			}
		}
	},
	["6_68"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				25545
			},
			{
				"def",
				30
			}
		}
	},
	["6_69"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				25735
			},
			{
				"def",
				30
			}
		}
	},
	["6_70"] = {
		need_star = 5,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				25925
			},
			{
				"def",
				30
			}
		}
	},
	["6_71"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"hp_max",
				26155
			},
			{
				"def",
				30
			}
		}
	},
	["6_72"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"hp_max",
				26385
			},
			{
				"def",
				30
			}
		}
	},
	["6_73"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"hp_max",
				26615
			},
			{
				"def",
				30
			}
		}
	},
	["6_74"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"hp_max",
				26845
			},
			{
				"def",
				30
			}
		}
	},
	["6_75"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"hp_max",
				27075
			},
			{
				"def",
				30
			}
		}
	},
	["6_76"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"hp_max",
				27305
			},
			{
				"def",
				30
			}
		}
	},
	["6_77"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"hp_max",
				27535
			},
			{
				"def",
				30
			}
		}
	},
	["6_78"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"hp_max",
				27765
			},
			{
				"def",
				30
			}
		}
	},
	["6_79"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"hp_max",
				27995
			},
			{
				"def",
				30
			}
		}
	},
	["6_80"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 6,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"hp_max",
				33225
			},
			{
				"def",
				40
			}
		}
	},
	["6_81"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"hp_max",
				33455
			},
			{
				"def",
				40
			}
		}
	},
	["6_82"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"hp_max",
				33685
			},
			{
				"def",
				40
			}
		}
	},
	["6_83"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"hp_max",
				33915
			},
			{
				"def",
				40
			}
		}
	},
	["6_84"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"hp_max",
				34145
			},
			{
				"def",
				40
			}
		}
	},
	["6_85"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"hp_max",
				34375
			},
			{
				"def",
				40
			}
		}
	},
	["6_86"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"hp_max",
				34605
			},
			{
				"def",
				40
			}
		}
	},
	["6_87"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"hp_max",
				34835
			},
			{
				"def",
				40
			}
		}
	},
	["6_88"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"hp_max",
				35065
			},
			{
				"def",
				40
			}
		}
	},
	["6_89"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"hp_max",
				35295
			},
			{
				"def",
				40
			}
		}
	},
	["6_90"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"hp_max",
				35525
			},
			{
				"def",
				40
			}
		}
	},
	["6_91"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"hp_max",
				35755
			},
			{
				"def",
				40
			}
		}
	},
	["6_92"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"hp_max",
				35985
			},
			{
				"def",
				40
			}
		}
	},
	["6_93"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"hp_max",
				36215
			},
			{
				"def",
				40
			}
		}
	},
	["6_94"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"hp_max",
				36445
			},
			{
				"def",
				40
			}
		}
	},
	["6_95"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"hp_max",
				36675
			},
			{
				"def",
				40
			}
		}
	},
	["6_96"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"hp_max",
				36905
			},
			{
				"def",
				40
			}
		}
	},
	["6_97"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"hp_max",
				37135
			},
			{
				"def",
				40
			}
		}
	},
	["6_98"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"hp_max",
				37365
			},
			{
				"def",
				40
			}
		}
	},
	["6_99"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"hp_max",
				37595
			},
			{
				"def",
				40
			}
		}
	},
	["6_100"] = {
		need_star = 6,
		name = "岩浆果实",
		desc = "",
		id = 6,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"hp_max",
				37825
			},
			{
				"def",
				40
			}
		}
	},
	["7_1"] = {
		need_star = 1,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 1,
		need_items = {
			{
				19007,
				50
			}
		},
		atts = {
			{
				"atk",
				2000
			},
			{
				"speed",
				10
			}
		}
	},
	["7_2"] = {
		need_star = 1,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"atk",
				2025
			},
			{
				"speed",
				10
			}
		}
	},
	["7_3"] = {
		need_star = 1,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"atk",
				2050
			},
			{
				"speed",
				10
			}
		}
	},
	["7_4"] = {
		need_star = 1,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"atk",
				2075
			},
			{
				"speed",
				10
			}
		}
	},
	["7_5"] = {
		need_star = 1,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"atk",
				2100
			},
			{
				"speed",
				10
			}
		}
	},
	["7_6"] = {
		need_star = 1,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"atk",
				2125
			},
			{
				"speed",
				10
			}
		}
	},
	["7_7"] = {
		need_star = 1,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"atk",
				2150
			},
			{
				"speed",
				10
			}
		}
	},
	["7_8"] = {
		need_star = 1,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"atk",
				2175
			},
			{
				"speed",
				10
			}
		}
	},
	["7_9"] = {
		need_star = 1,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"atk",
				2200
			},
			{
				"speed",
				10
			}
		}
	},
	["7_10"] = {
		need_star = 1,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"atk",
				2225
			},
			{
				"speed",
				10
			}
		}
	},
	["7_11"] = {
		need_star = 2,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"atk",
				2252
			},
			{
				"speed",
				10
			}
		}
	},
	["7_12"] = {
		need_star = 2,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"atk",
				2279
			},
			{
				"speed",
				10
			}
		}
	},
	["7_13"] = {
		need_star = 2,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"atk",
				2306
			},
			{
				"speed",
				10
			}
		}
	},
	["7_14"] = {
		need_star = 2,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"atk",
				2333
			},
			{
				"speed",
				10
			}
		}
	},
	["7_15"] = {
		need_star = 2,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"atk",
				2360
			},
			{
				"speed",
				10
			}
		}
	},
	["7_16"] = {
		need_star = 2,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"atk",
				2387
			},
			{
				"speed",
				10
			}
		}
	},
	["7_17"] = {
		need_star = 2,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"atk",
				2414
			},
			{
				"speed",
				10
			}
		}
	},
	["7_18"] = {
		need_star = 2,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"atk",
				2441
			},
			{
				"speed",
				10
			}
		}
	},
	["7_19"] = {
		need_star = 2,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"atk",
				2468
			},
			{
				"speed",
				10
			}
		}
	},
	["7_20"] = {
		need_star = 2,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"atk",
				2495
			},
			{
				"speed",
				10
			}
		}
	},
	["7_21"] = {
		need_star = 3,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"atk",
				2525
			},
			{
				"speed",
				10
			}
		}
	},
	["7_22"] = {
		need_star = 3,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"atk",
				2555
			},
			{
				"speed",
				10
			}
		}
	},
	["7_23"] = {
		need_star = 3,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"atk",
				2585
			},
			{
				"speed",
				10
			}
		}
	},
	["7_24"] = {
		need_star = 3,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"atk",
				2615
			},
			{
				"speed",
				10
			}
		}
	},
	["7_25"] = {
		need_star = 3,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"atk",
				2645
			},
			{
				"speed",
				10
			}
		}
	},
	["7_26"] = {
		need_star = 3,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"atk",
				2675
			},
			{
				"speed",
				10
			}
		}
	},
	["7_27"] = {
		need_star = 3,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"atk",
				2705
			},
			{
				"speed",
				10
			}
		}
	},
	["7_28"] = {
		need_star = 3,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"atk",
				2735
			},
			{
				"speed",
				10
			}
		}
	},
	["7_29"] = {
		need_star = 3,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"atk",
				2765
			},
			{
				"speed",
				10
			}
		}
	},
	["7_30"] = {
		need_star = 3,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"atk",
				2795
			},
			{
				"speed",
				10
			}
		}
	},
	["7_31"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"atk",
				2830
			},
			{
				"speed",
				10
			}
		}
	},
	["7_32"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"atk",
				2865
			},
			{
				"speed",
				10
			}
		}
	},
	["7_33"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"atk",
				2900
			},
			{
				"speed",
				10
			}
		}
	},
	["7_34"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"atk",
				2935
			},
			{
				"speed",
				10
			}
		}
	},
	["7_35"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"atk",
				2970
			},
			{
				"speed",
				10
			}
		}
	},
	["7_36"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"atk",
				3005
			},
			{
				"speed",
				10
			}
		}
	},
	["7_37"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"atk",
				3040
			},
			{
				"speed",
				10
			}
		}
	},
	["7_38"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"atk",
				3075
			},
			{
				"speed",
				10
			}
		}
	},
	["7_39"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"atk",
				3110
			},
			{
				"speed",
				10
			}
		}
	},
	["7_40"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 7,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"atk",
				3545
			},
			{
				"speed",
				12
			}
		}
	},
	["7_41"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"atk",
				3580
			},
			{
				"speed",
				12
			}
		}
	},
	["7_42"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"atk",
				3615
			},
			{
				"speed",
				12
			}
		}
	},
	["7_43"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"atk",
				3650
			},
			{
				"speed",
				12
			}
		}
	},
	["7_44"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"atk",
				3685
			},
			{
				"speed",
				12
			}
		}
	},
	["7_45"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"atk",
				3720
			},
			{
				"speed",
				12
			}
		}
	},
	["7_46"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"atk",
				3755
			},
			{
				"speed",
				12
			}
		}
	},
	["7_47"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"atk",
				3790
			},
			{
				"speed",
				12
			}
		}
	},
	["7_48"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"atk",
				3825
			},
			{
				"speed",
				12
			}
		}
	},
	["7_49"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"atk",
				3860
			},
			{
				"speed",
				12
			}
		}
	},
	["7_50"] = {
		need_star = 4,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"atk",
				3895
			},
			{
				"speed",
				12
			}
		}
	},
	["7_51"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"atk",
				3940
			},
			{
				"speed",
				12
			}
		}
	},
	["7_52"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"atk",
				3985
			},
			{
				"speed",
				12
			}
		}
	},
	["7_53"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"atk",
				4030
			},
			{
				"speed",
				12
			}
		}
	},
	["7_54"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"atk",
				4075
			},
			{
				"speed",
				12
			}
		}
	},
	["7_55"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"atk",
				4120
			},
			{
				"speed",
				12
			}
		}
	},
	["7_56"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"atk",
				4165
			},
			{
				"speed",
				12
			}
		}
	},
	["7_57"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"atk",
				4210
			},
			{
				"speed",
				12
			}
		}
	},
	["7_58"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"atk",
				4255
			},
			{
				"speed",
				12
			}
		}
	},
	["7_59"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"atk",
				4300
			},
			{
				"speed",
				12
			}
		}
	},
	["7_60"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 7,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"atk",
				4945
			},
			{
				"speed",
				15
			}
		}
	},
	["7_61"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"atk",
				4990
			},
			{
				"speed",
				15
			}
		}
	},
	["7_62"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"atk",
				5035
			},
			{
				"speed",
				15
			}
		}
	},
	["7_63"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"atk",
				5080
			},
			{
				"speed",
				15
			}
		}
	},
	["7_64"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"atk",
				5125
			},
			{
				"speed",
				15
			}
		}
	},
	["7_65"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"atk",
				5170
			},
			{
				"speed",
				15
			}
		}
	},
	["7_66"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"atk",
				5215
			},
			{
				"speed",
				15
			}
		}
	},
	["7_67"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"atk",
				5260
			},
			{
				"speed",
				15
			}
		}
	},
	["7_68"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"atk",
				5305
			},
			{
				"speed",
				15
			}
		}
	},
	["7_69"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"atk",
				5350
			},
			{
				"speed",
				15
			}
		}
	},
	["7_70"] = {
		need_star = 5,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"atk",
				5395
			},
			{
				"speed",
				15
			}
		}
	},
	["7_71"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"atk",
				5455
			},
			{
				"speed",
				15
			}
		}
	},
	["7_72"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"atk",
				5515
			},
			{
				"speed",
				15
			}
		}
	},
	["7_73"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"atk",
				5575
			},
			{
				"speed",
				15
			}
		}
	},
	["7_74"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"atk",
				5635
			},
			{
				"speed",
				15
			}
		}
	},
	["7_75"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"atk",
				5695
			},
			{
				"speed",
				15
			}
		}
	},
	["7_76"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"atk",
				5755
			},
			{
				"speed",
				15
			}
		}
	},
	["7_77"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"atk",
				5815
			},
			{
				"speed",
				15
			}
		}
	},
	["7_78"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"atk",
				5875
			},
			{
				"speed",
				15
			}
		}
	},
	["7_79"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"atk",
				5935
			},
			{
				"speed",
				15
			}
		}
	},
	["7_80"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 7,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"atk",
				6995
			},
			{
				"speed",
				20
			}
		}
	},
	["7_81"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"atk",
				7055
			},
			{
				"speed",
				20
			}
		}
	},
	["7_82"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"atk",
				7115
			},
			{
				"speed",
				20
			}
		}
	},
	["7_83"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"atk",
				7175
			},
			{
				"speed",
				20
			}
		}
	},
	["7_84"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"atk",
				7235
			},
			{
				"speed",
				20
			}
		}
	},
	["7_85"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"atk",
				7295
			},
			{
				"speed",
				20
			}
		}
	},
	["7_86"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"atk",
				7355
			},
			{
				"speed",
				20
			}
		}
	},
	["7_87"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"atk",
				7415
			},
			{
				"speed",
				20
			}
		}
	},
	["7_88"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"atk",
				7475
			},
			{
				"speed",
				20
			}
		}
	},
	["7_89"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"atk",
				7535
			},
			{
				"speed",
				20
			}
		}
	},
	["7_90"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"atk",
				7595
			},
			{
				"speed",
				20
			}
		}
	},
	["7_91"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"atk",
				7655
			},
			{
				"speed",
				20
			}
		}
	},
	["7_92"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"atk",
				7715
			},
			{
				"speed",
				20
			}
		}
	},
	["7_93"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"atk",
				7775
			},
			{
				"speed",
				20
			}
		}
	},
	["7_94"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"atk",
				7835
			},
			{
				"speed",
				20
			}
		}
	},
	["7_95"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"atk",
				7895
			},
			{
				"speed",
				20
			}
		}
	},
	["7_96"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"atk",
				7955
			},
			{
				"speed",
				20
			}
		}
	},
	["7_97"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"atk",
				8015
			},
			{
				"speed",
				20
			}
		}
	},
	["7_98"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"atk",
				8075
			},
			{
				"speed",
				20
			}
		}
	},
	["7_99"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"atk",
				8135
			},
			{
				"speed",
				20
			}
		}
	},
	["7_100"] = {
		need_star = 6,
		name = "橡胶果实",
		desc = "",
		id = 7,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"atk",
				8195
			},
			{
				"speed",
				20
			}
		}
	},
	["8_1"] = {
		need_star = 1,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 1,
		need_items = {
			{
				19008,
				50
			}
		},
		atts = {
			{
				"hp_max",
				10000
			},
			{
				"def",
				20
			}
		}
	},
	["8_2"] = {
		need_star = 1,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				10125
			},
			{
				"def",
				20
			}
		}
	},
	["8_3"] = {
		need_star = 1,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				10250
			},
			{
				"def",
				20
			}
		}
	},
	["8_4"] = {
		need_star = 1,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				10375
			},
			{
				"def",
				20
			}
		}
	},
	["8_5"] = {
		need_star = 1,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				10500
			},
			{
				"def",
				20
			}
		}
	},
	["8_6"] = {
		need_star = 1,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				10625
			},
			{
				"def",
				20
			}
		}
	},
	["8_7"] = {
		need_star = 1,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				10750
			},
			{
				"def",
				20
			}
		}
	},
	["8_8"] = {
		need_star = 1,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				10875
			},
			{
				"def",
				20
			}
		}
	},
	["8_9"] = {
		need_star = 1,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				11000
			},
			{
				"def",
				20
			}
		}
	},
	["8_10"] = {
		need_star = 1,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				11125
			},
			{
				"def",
				20
			}
		}
	},
	["8_11"] = {
		need_star = 2,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				11260
			},
			{
				"def",
				20
			}
		}
	},
	["8_12"] = {
		need_star = 2,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				11395
			},
			{
				"def",
				20
			}
		}
	},
	["8_13"] = {
		need_star = 2,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				11530
			},
			{
				"def",
				20
			}
		}
	},
	["8_14"] = {
		need_star = 2,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				11665
			},
			{
				"def",
				20
			}
		}
	},
	["8_15"] = {
		need_star = 2,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				11800
			},
			{
				"def",
				20
			}
		}
	},
	["8_16"] = {
		need_star = 2,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				11935
			},
			{
				"def",
				20
			}
		}
	},
	["8_17"] = {
		need_star = 2,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				12070
			},
			{
				"def",
				20
			}
		}
	},
	["8_18"] = {
		need_star = 2,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				12205
			},
			{
				"def",
				20
			}
		}
	},
	["8_19"] = {
		need_star = 2,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				12340
			},
			{
				"def",
				20
			}
		}
	},
	["8_20"] = {
		need_star = 2,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				12475
			},
			{
				"def",
				20
			}
		}
	},
	["8_21"] = {
		need_star = 3,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				12620
			},
			{
				"def",
				20
			}
		}
	},
	["8_22"] = {
		need_star = 3,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				12765
			},
			{
				"def",
				20
			}
		}
	},
	["8_23"] = {
		need_star = 3,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				12910
			},
			{
				"def",
				20
			}
		}
	},
	["8_24"] = {
		need_star = 3,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				13055
			},
			{
				"def",
				20
			}
		}
	},
	["8_25"] = {
		need_star = 3,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"def",
				20
			}
		}
	},
	["8_26"] = {
		need_star = 3,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				13345
			},
			{
				"def",
				20
			}
		}
	},
	["8_27"] = {
		need_star = 3,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				13490
			},
			{
				"def",
				20
			}
		}
	},
	["8_28"] = {
		need_star = 3,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				13635
			},
			{
				"def",
				20
			}
		}
	},
	["8_29"] = {
		need_star = 3,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				13780
			},
			{
				"def",
				20
			}
		}
	},
	["8_30"] = {
		need_star = 3,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				13925
			},
			{
				"def",
				20
			}
		}
	},
	["8_31"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				14085
			},
			{
				"def",
				20
			}
		}
	},
	["8_32"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				14245
			},
			{
				"def",
				20
			}
		}
	},
	["8_33"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				14405
			},
			{
				"def",
				20
			}
		}
	},
	["8_34"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				14565
			},
			{
				"def",
				20
			}
		}
	},
	["8_35"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				14725
			},
			{
				"def",
				20
			}
		}
	},
	["8_36"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				14885
			},
			{
				"def",
				20
			}
		}
	},
	["8_37"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				15045
			},
			{
				"def",
				20
			}
		}
	},
	["8_38"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				15205
			},
			{
				"def",
				20
			}
		}
	},
	["8_39"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				15365
			},
			{
				"def",
				20
			}
		}
	},
	["8_40"] = {
		need_star = 4,
		name = "震震果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 8,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				17525
			},
			{
				"def",
				24
			}
		}
	},
	["8_41"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				17685
			},
			{
				"def",
				24
			}
		}
	},
	["8_42"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				17845
			},
			{
				"def",
				24
			}
		}
	},
	["8_43"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				18005
			},
			{
				"def",
				24
			}
		}
	},
	["8_44"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				18165
			},
			{
				"def",
				24
			}
		}
	},
	["8_45"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				18325
			},
			{
				"def",
				24
			}
		}
	},
	["8_46"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				18485
			},
			{
				"def",
				24
			}
		}
	},
	["8_47"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				18645
			},
			{
				"def",
				24
			}
		}
	},
	["8_48"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				18805
			},
			{
				"def",
				24
			}
		}
	},
	["8_49"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				18965
			},
			{
				"def",
				24
			}
		}
	},
	["8_50"] = {
		need_star = 4,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				19125
			},
			{
				"def",
				24
			}
		}
	},
	["8_51"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				19315
			},
			{
				"def",
				24
			}
		}
	},
	["8_52"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				19505
			},
			{
				"def",
				24
			}
		}
	},
	["8_53"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				19695
			},
			{
				"def",
				24
			}
		}
	},
	["8_54"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				19885
			},
			{
				"def",
				24
			}
		}
	},
	["8_55"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				20075
			},
			{
				"def",
				24
			}
		}
	},
	["8_56"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				20265
			},
			{
				"def",
				24
			}
		}
	},
	["8_57"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				20455
			},
			{
				"def",
				24
			}
		}
	},
	["8_58"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				20645
			},
			{
				"def",
				24
			}
		}
	},
	["8_59"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				20835
			},
			{
				"def",
				24
			}
		}
	},
	["8_60"] = {
		need_star = 5,
		name = "震震果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 8,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				24025
			},
			{
				"def",
				30
			}
		}
	},
	["8_61"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				24215
			},
			{
				"def",
				30
			}
		}
	},
	["8_62"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				24405
			},
			{
				"def",
				30
			}
		}
	},
	["8_63"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				24595
			},
			{
				"def",
				30
			}
		}
	},
	["8_64"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				24785
			},
			{
				"def",
				30
			}
		}
	},
	["8_65"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				24975
			},
			{
				"def",
				30
			}
		}
	},
	["8_66"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				25165
			},
			{
				"def",
				30
			}
		}
	},
	["8_67"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				25355
			},
			{
				"def",
				30
			}
		}
	},
	["8_68"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				25545
			},
			{
				"def",
				30
			}
		}
	},
	["8_69"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				25735
			},
			{
				"def",
				30
			}
		}
	},
	["8_70"] = {
		need_star = 5,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				25925
			},
			{
				"def",
				30
			}
		}
	},
	["8_71"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"hp_max",
				26155
			},
			{
				"def",
				30
			}
		}
	},
	["8_72"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"hp_max",
				26385
			},
			{
				"def",
				30
			}
		}
	},
	["8_73"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"hp_max",
				26615
			},
			{
				"def",
				30
			}
		}
	},
	["8_74"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"hp_max",
				26845
			},
			{
				"def",
				30
			}
		}
	},
	["8_75"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"hp_max",
				27075
			},
			{
				"def",
				30
			}
		}
	},
	["8_76"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"hp_max",
				27305
			},
			{
				"def",
				30
			}
		}
	},
	["8_77"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"hp_max",
				27535
			},
			{
				"def",
				30
			}
		}
	},
	["8_78"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"hp_max",
				27765
			},
			{
				"def",
				30
			}
		}
	},
	["8_79"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"hp_max",
				27995
			},
			{
				"def",
				30
			}
		}
	},
	["8_80"] = {
		need_star = 6,
		name = "震震果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 8,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"hp_max",
				33225
			},
			{
				"def",
				40
			}
		}
	},
	["8_81"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"hp_max",
				33455
			},
			{
				"def",
				40
			}
		}
	},
	["8_82"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"hp_max",
				33685
			},
			{
				"def",
				40
			}
		}
	},
	["8_83"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"hp_max",
				33915
			},
			{
				"def",
				40
			}
		}
	},
	["8_84"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"hp_max",
				34145
			},
			{
				"def",
				40
			}
		}
	},
	["8_85"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"hp_max",
				34375
			},
			{
				"def",
				40
			}
		}
	},
	["8_86"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"hp_max",
				34605
			},
			{
				"def",
				40
			}
		}
	},
	["8_87"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"hp_max",
				34835
			},
			{
				"def",
				40
			}
		}
	},
	["8_88"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"hp_max",
				35065
			},
			{
				"def",
				40
			}
		}
	},
	["8_89"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"hp_max",
				35295
			},
			{
				"def",
				40
			}
		}
	},
	["8_90"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"hp_max",
				35525
			},
			{
				"def",
				40
			}
		}
	},
	["8_91"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"hp_max",
				35755
			},
			{
				"def",
				40
			}
		}
	},
	["8_92"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"hp_max",
				35985
			},
			{
				"def",
				40
			}
		}
	},
	["8_93"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"hp_max",
				36215
			},
			{
				"def",
				40
			}
		}
	},
	["8_94"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"hp_max",
				36445
			},
			{
				"def",
				40
			}
		}
	},
	["8_95"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"hp_max",
				36675
			},
			{
				"def",
				40
			}
		}
	},
	["8_96"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"hp_max",
				36905
			},
			{
				"def",
				40
			}
		}
	},
	["8_97"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"hp_max",
				37135
			},
			{
				"def",
				40
			}
		}
	},
	["8_98"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"hp_max",
				37365
			},
			{
				"def",
				40
			}
		}
	},
	["8_99"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"hp_max",
				37595
			},
			{
				"def",
				40
			}
		}
	},
	["8_100"] = {
		need_star = 6,
		name = "震震果实",
		desc = "",
		id = 8,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"hp_max",
				37825
			},
			{
				"def",
				40
			}
		}
	},
	["9_1"] = {
		need_star = 1,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 1,
		need_items = {
			{
				19009,
				50
			}
		},
		atts = {
			{
				"atk",
				2000
			},
			{
				"def",
				20
			}
		}
	},
	["9_2"] = {
		need_star = 1,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"atk",
				2025
			},
			{
				"def",
				20
			}
		}
	},
	["9_3"] = {
		need_star = 1,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"atk",
				2050
			},
			{
				"def",
				20
			}
		}
	},
	["9_4"] = {
		need_star = 1,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"atk",
				2075
			},
			{
				"def",
				20
			}
		}
	},
	["9_5"] = {
		need_star = 1,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"atk",
				2100
			},
			{
				"def",
				20
			}
		}
	},
	["9_6"] = {
		need_star = 1,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"atk",
				2125
			},
			{
				"def",
				20
			}
		}
	},
	["9_7"] = {
		need_star = 1,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"atk",
				2150
			},
			{
				"def",
				20
			}
		}
	},
	["9_8"] = {
		need_star = 1,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"atk",
				2175
			},
			{
				"def",
				20
			}
		}
	},
	["9_9"] = {
		need_star = 1,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"atk",
				2200
			},
			{
				"def",
				20
			}
		}
	},
	["9_10"] = {
		need_star = 1,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"atk",
				2225
			},
			{
				"def",
				20
			}
		}
	},
	["9_11"] = {
		need_star = 2,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"atk",
				2252
			},
			{
				"def",
				20
			}
		}
	},
	["9_12"] = {
		need_star = 2,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"atk",
				2279
			},
			{
				"def",
				20
			}
		}
	},
	["9_13"] = {
		need_star = 2,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"atk",
				2306
			},
			{
				"def",
				20
			}
		}
	},
	["9_14"] = {
		need_star = 2,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"atk",
				2333
			},
			{
				"def",
				20
			}
		}
	},
	["9_15"] = {
		need_star = 2,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"atk",
				2360
			},
			{
				"def",
				20
			}
		}
	},
	["9_16"] = {
		need_star = 2,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"atk",
				2387
			},
			{
				"def",
				20
			}
		}
	},
	["9_17"] = {
		need_star = 2,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"atk",
				2414
			},
			{
				"def",
				20
			}
		}
	},
	["9_18"] = {
		need_star = 2,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"atk",
				2441
			},
			{
				"def",
				20
			}
		}
	},
	["9_19"] = {
		need_star = 2,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"atk",
				2468
			},
			{
				"def",
				20
			}
		}
	},
	["9_20"] = {
		need_star = 2,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"atk",
				2495
			},
			{
				"def",
				20
			}
		}
	},
	["9_21"] = {
		need_star = 3,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"atk",
				2525
			},
			{
				"def",
				20
			}
		}
	},
	["9_22"] = {
		need_star = 3,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"atk",
				2555
			},
			{
				"def",
				20
			}
		}
	},
	["9_23"] = {
		need_star = 3,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"atk",
				2585
			},
			{
				"def",
				20
			}
		}
	},
	["9_24"] = {
		need_star = 3,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"atk",
				2615
			},
			{
				"def",
				20
			}
		}
	},
	["9_25"] = {
		need_star = 3,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"atk",
				2645
			},
			{
				"def",
				20
			}
		}
	},
	["9_26"] = {
		need_star = 3,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"atk",
				2675
			},
			{
				"def",
				20
			}
		}
	},
	["9_27"] = {
		need_star = 3,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"atk",
				2705
			},
			{
				"def",
				20
			}
		}
	},
	["9_28"] = {
		need_star = 3,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"atk",
				2735
			},
			{
				"def",
				20
			}
		}
	},
	["9_29"] = {
		need_star = 3,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"atk",
				2765
			},
			{
				"def",
				20
			}
		}
	},
	["9_30"] = {
		need_star = 3,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"atk",
				2795
			},
			{
				"def",
				20
			}
		}
	},
	["9_31"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"atk",
				2830
			},
			{
				"def",
				20
			}
		}
	},
	["9_32"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"atk",
				2865
			},
			{
				"def",
				20
			}
		}
	},
	["9_33"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"atk",
				2900
			},
			{
				"def",
				20
			}
		}
	},
	["9_34"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"atk",
				2935
			},
			{
				"def",
				20
			}
		}
	},
	["9_35"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"atk",
				2970
			},
			{
				"def",
				20
			}
		}
	},
	["9_36"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"atk",
				3005
			},
			{
				"def",
				20
			}
		}
	},
	["9_37"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"atk",
				3040
			},
			{
				"def",
				20
			}
		}
	},
	["9_38"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"atk",
				3075
			},
			{
				"def",
				20
			}
		}
	},
	["9_39"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"atk",
				3110
			},
			{
				"def",
				20
			}
		}
	},
	["9_40"] = {
		need_star = 4,
		name = "金金果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 9,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"atk",
				3545
			},
			{
				"def",
				24
			}
		}
	},
	["9_41"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"atk",
				3580
			},
			{
				"def",
				24
			}
		}
	},
	["9_42"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"atk",
				3615
			},
			{
				"def",
				24
			}
		}
	},
	["9_43"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"atk",
				3650
			},
			{
				"def",
				24
			}
		}
	},
	["9_44"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"atk",
				3685
			},
			{
				"def",
				24
			}
		}
	},
	["9_45"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"atk",
				3720
			},
			{
				"def",
				24
			}
		}
	},
	["9_46"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"atk",
				3755
			},
			{
				"def",
				24
			}
		}
	},
	["9_47"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"atk",
				3790
			},
			{
				"def",
				24
			}
		}
	},
	["9_48"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"atk",
				3825
			},
			{
				"def",
				24
			}
		}
	},
	["9_49"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"atk",
				3860
			},
			{
				"def",
				24
			}
		}
	},
	["9_50"] = {
		need_star = 4,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"atk",
				3895
			},
			{
				"def",
				24
			}
		}
	},
	["9_51"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"atk",
				3940
			},
			{
				"def",
				24
			}
		}
	},
	["9_52"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"atk",
				3985
			},
			{
				"def",
				24
			}
		}
	},
	["9_53"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"atk",
				4030
			},
			{
				"def",
				24
			}
		}
	},
	["9_54"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"atk",
				4075
			},
			{
				"def",
				24
			}
		}
	},
	["9_55"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"atk",
				4120
			},
			{
				"def",
				24
			}
		}
	},
	["9_56"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"atk",
				4165
			},
			{
				"def",
				24
			}
		}
	},
	["9_57"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"atk",
				4210
			},
			{
				"def",
				24
			}
		}
	},
	["9_58"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"atk",
				4255
			},
			{
				"def",
				24
			}
		}
	},
	["9_59"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"atk",
				4300
			},
			{
				"def",
				24
			}
		}
	},
	["9_60"] = {
		need_star = 5,
		name = "金金果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 9,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"atk",
				4945
			},
			{
				"def",
				30
			}
		}
	},
	["9_61"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"atk",
				4990
			},
			{
				"def",
				30
			}
		}
	},
	["9_62"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"atk",
				5035
			},
			{
				"def",
				30
			}
		}
	},
	["9_63"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"atk",
				5080
			},
			{
				"def",
				30
			}
		}
	},
	["9_64"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"atk",
				5125
			},
			{
				"def",
				30
			}
		}
	},
	["9_65"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"atk",
				5170
			},
			{
				"def",
				30
			}
		}
	},
	["9_66"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"atk",
				5215
			},
			{
				"def",
				30
			}
		}
	},
	["9_67"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"atk",
				5260
			},
			{
				"def",
				30
			}
		}
	},
	["9_68"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"atk",
				5305
			},
			{
				"def",
				30
			}
		}
	},
	["9_69"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"atk",
				5350
			},
			{
				"def",
				30
			}
		}
	},
	["9_70"] = {
		need_star = 5,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"atk",
				5395
			},
			{
				"def",
				30
			}
		}
	},
	["9_71"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"atk",
				5455
			},
			{
				"def",
				30
			}
		}
	},
	["9_72"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"atk",
				5515
			},
			{
				"def",
				30
			}
		}
	},
	["9_73"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"atk",
				5575
			},
			{
				"def",
				30
			}
		}
	},
	["9_74"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"atk",
				5635
			},
			{
				"def",
				30
			}
		}
	},
	["9_75"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"atk",
				5695
			},
			{
				"def",
				30
			}
		}
	},
	["9_76"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"atk",
				5755
			},
			{
				"def",
				30
			}
		}
	},
	["9_77"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"atk",
				5815
			},
			{
				"def",
				30
			}
		}
	},
	["9_78"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"atk",
				5875
			},
			{
				"def",
				30
			}
		}
	},
	["9_79"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"atk",
				5935
			},
			{
				"def",
				30
			}
		}
	},
	["9_80"] = {
		need_star = 6,
		name = "金金果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 9,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"atk",
				6995
			},
			{
				"def",
				40
			}
		}
	},
	["9_81"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"atk",
				7055
			},
			{
				"def",
				40
			}
		}
	},
	["9_82"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"atk",
				7115
			},
			{
				"def",
				40
			}
		}
	},
	["9_83"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"atk",
				7175
			},
			{
				"def",
				40
			}
		}
	},
	["9_84"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"atk",
				7235
			},
			{
				"def",
				40
			}
		}
	},
	["9_85"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"atk",
				7295
			},
			{
				"def",
				40
			}
		}
	},
	["9_86"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"atk",
				7355
			},
			{
				"def",
				40
			}
		}
	},
	["9_87"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"atk",
				7415
			},
			{
				"def",
				40
			}
		}
	},
	["9_88"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"atk",
				7475
			},
			{
				"def",
				40
			}
		}
	},
	["9_89"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"atk",
				7535
			},
			{
				"def",
				40
			}
		}
	},
	["9_90"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"atk",
				7595
			},
			{
				"def",
				40
			}
		}
	},
	["9_91"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"atk",
				7655
			},
			{
				"def",
				40
			}
		}
	},
	["9_92"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"atk",
				7715
			},
			{
				"def",
				40
			}
		}
	},
	["9_93"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"atk",
				7775
			},
			{
				"def",
				40
			}
		}
	},
	["9_94"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"atk",
				7835
			},
			{
				"def",
				40
			}
		}
	},
	["9_95"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"atk",
				7895
			},
			{
				"def",
				40
			}
		}
	},
	["9_96"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"atk",
				7955
			},
			{
				"def",
				40
			}
		}
	},
	["9_97"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"atk",
				8015
			},
			{
				"def",
				40
			}
		}
	},
	["9_98"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"atk",
				8075
			},
			{
				"def",
				40
			}
		}
	},
	["9_99"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"atk",
				8135
			},
			{
				"def",
				40
			}
		}
	},
	["9_100"] = {
		need_star = 6,
		name = "金金果实",
		desc = "",
		id = 9,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"atk",
				8195
			},
			{
				"def",
				40
			}
		}
	},
	["10_1"] = {
		need_star = 1,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 1,
		need_items = {
			{
				19010,
				50
			}
		},
		atts = {
			{
				"hp_max",
				10000
			},
			{
				"speed",
				10
			}
		}
	},
	["10_2"] = {
		need_star = 1,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				10125
			},
			{
				"speed",
				10
			}
		}
	},
	["10_3"] = {
		need_star = 1,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				10250
			},
			{
				"speed",
				10
			}
		}
	},
	["10_4"] = {
		need_star = 1,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				10375
			},
			{
				"speed",
				10
			}
		}
	},
	["10_5"] = {
		need_star = 1,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				10500
			},
			{
				"speed",
				10
			}
		}
	},
	["10_6"] = {
		need_star = 1,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				10625
			},
			{
				"speed",
				10
			}
		}
	},
	["10_7"] = {
		need_star = 1,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				10750
			},
			{
				"speed",
				10
			}
		}
	},
	["10_8"] = {
		need_star = 1,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				10875
			},
			{
				"speed",
				10
			}
		}
	},
	["10_9"] = {
		need_star = 1,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				11000
			},
			{
				"speed",
				10
			}
		}
	},
	["10_10"] = {
		need_star = 1,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				11125
			},
			{
				"speed",
				10
			}
		}
	},
	["10_11"] = {
		need_star = 2,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				11260
			},
			{
				"speed",
				10
			}
		}
	},
	["10_12"] = {
		need_star = 2,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				11395
			},
			{
				"speed",
				10
			}
		}
	},
	["10_13"] = {
		need_star = 2,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				11530
			},
			{
				"speed",
				10
			}
		}
	},
	["10_14"] = {
		need_star = 2,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				11665
			},
			{
				"speed",
				10
			}
		}
	},
	["10_15"] = {
		need_star = 2,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				11800
			},
			{
				"speed",
				10
			}
		}
	},
	["10_16"] = {
		need_star = 2,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				11935
			},
			{
				"speed",
				10
			}
		}
	},
	["10_17"] = {
		need_star = 2,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				12070
			},
			{
				"speed",
				10
			}
		}
	},
	["10_18"] = {
		need_star = 2,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				12205
			},
			{
				"speed",
				10
			}
		}
	},
	["10_19"] = {
		need_star = 2,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				12340
			},
			{
				"speed",
				10
			}
		}
	},
	["10_20"] = {
		need_star = 2,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				12475
			},
			{
				"speed",
				10
			}
		}
	},
	["10_21"] = {
		need_star = 3,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				12620
			},
			{
				"speed",
				10
			}
		}
	},
	["10_22"] = {
		need_star = 3,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				12765
			},
			{
				"speed",
				10
			}
		}
	},
	["10_23"] = {
		need_star = 3,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				12910
			},
			{
				"speed",
				10
			}
		}
	},
	["10_24"] = {
		need_star = 3,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				13055
			},
			{
				"speed",
				10
			}
		}
	},
	["10_25"] = {
		need_star = 3,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"speed",
				10
			}
		}
	},
	["10_26"] = {
		need_star = 3,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				13345
			},
			{
				"speed",
				10
			}
		}
	},
	["10_27"] = {
		need_star = 3,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				13490
			},
			{
				"speed",
				10
			}
		}
	},
	["10_28"] = {
		need_star = 3,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				13635
			},
			{
				"speed",
				10
			}
		}
	},
	["10_29"] = {
		need_star = 3,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				13780
			},
			{
				"speed",
				10
			}
		}
	},
	["10_30"] = {
		need_star = 3,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				13925
			},
			{
				"speed",
				10
			}
		}
	},
	["10_31"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				14085
			},
			{
				"speed",
				10
			}
		}
	},
	["10_32"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				14245
			},
			{
				"speed",
				10
			}
		}
	},
	["10_33"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				14405
			},
			{
				"speed",
				10
			}
		}
	},
	["10_34"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				14565
			},
			{
				"speed",
				10
			}
		}
	},
	["10_35"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				14725
			},
			{
				"speed",
				10
			}
		}
	},
	["10_36"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				14885
			},
			{
				"speed",
				10
			}
		}
	},
	["10_37"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				15045
			},
			{
				"speed",
				10
			}
		}
	},
	["10_38"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				15205
			},
			{
				"speed",
				10
			}
		}
	},
	["10_39"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				15365
			},
			{
				"speed",
				10
			}
		}
	},
	["10_40"] = {
		need_star = 4,
		name = "合体果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 10,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				17525
			},
			{
				"speed",
				12
			}
		}
	},
	["10_41"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				17685
			},
			{
				"speed",
				12
			}
		}
	},
	["10_42"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				17845
			},
			{
				"speed",
				12
			}
		}
	},
	["10_43"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				18005
			},
			{
				"speed",
				12
			}
		}
	},
	["10_44"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				18165
			},
			{
				"speed",
				12
			}
		}
	},
	["10_45"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				18325
			},
			{
				"speed",
				12
			}
		}
	},
	["10_46"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				18485
			},
			{
				"speed",
				12
			}
		}
	},
	["10_47"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				18645
			},
			{
				"speed",
				12
			}
		}
	},
	["10_48"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				18805
			},
			{
				"speed",
				12
			}
		}
	},
	["10_49"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				18965
			},
			{
				"speed",
				12
			}
		}
	},
	["10_50"] = {
		need_star = 4,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				19125
			},
			{
				"speed",
				12
			}
		}
	},
	["10_51"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				19315
			},
			{
				"speed",
				12
			}
		}
	},
	["10_52"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				19505
			},
			{
				"speed",
				12
			}
		}
	},
	["10_53"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				19695
			},
			{
				"speed",
				12
			}
		}
	},
	["10_54"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				19885
			},
			{
				"speed",
				12
			}
		}
	},
	["10_55"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				20075
			},
			{
				"speed",
				12
			}
		}
	},
	["10_56"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				20265
			},
			{
				"speed",
				12
			}
		}
	},
	["10_57"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				20455
			},
			{
				"speed",
				12
			}
		}
	},
	["10_58"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				20645
			},
			{
				"speed",
				12
			}
		}
	},
	["10_59"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				20835
			},
			{
				"speed",
				12
			}
		}
	},
	["10_60"] = {
		need_star = 5,
		name = "合体果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 10,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				24025
			},
			{
				"speed",
				15
			}
		}
	},
	["10_61"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				24215
			},
			{
				"speed",
				15
			}
		}
	},
	["10_62"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				24405
			},
			{
				"speed",
				15
			}
		}
	},
	["10_63"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				24595
			},
			{
				"speed",
				15
			}
		}
	},
	["10_64"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				24785
			},
			{
				"speed",
				15
			}
		}
	},
	["10_65"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				24975
			},
			{
				"speed",
				15
			}
		}
	},
	["10_66"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				25165
			},
			{
				"speed",
				15
			}
		}
	},
	["10_67"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				25355
			},
			{
				"speed",
				15
			}
		}
	},
	["10_68"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				25545
			},
			{
				"speed",
				15
			}
		}
	},
	["10_69"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				25735
			},
			{
				"speed",
				15
			}
		}
	},
	["10_70"] = {
		need_star = 5,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				25925
			},
			{
				"speed",
				15
			}
		}
	},
	["10_71"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"hp_max",
				26155
			},
			{
				"speed",
				15
			}
		}
	},
	["10_72"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"hp_max",
				26385
			},
			{
				"speed",
				15
			}
		}
	},
	["10_73"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"hp_max",
				26615
			},
			{
				"speed",
				15
			}
		}
	},
	["10_74"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"hp_max",
				26845
			},
			{
				"speed",
				15
			}
		}
	},
	["10_75"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"hp_max",
				27075
			},
			{
				"speed",
				15
			}
		}
	},
	["10_76"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"hp_max",
				27305
			},
			{
				"speed",
				15
			}
		}
	},
	["10_77"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"hp_max",
				27535
			},
			{
				"speed",
				15
			}
		}
	},
	["10_78"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"hp_max",
				27765
			},
			{
				"speed",
				15
			}
		}
	},
	["10_79"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"hp_max",
				27995
			},
			{
				"speed",
				15
			}
		}
	},
	["10_80"] = {
		need_star = 6,
		name = "合体果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 10,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"hp_max",
				33225
			},
			{
				"speed",
				20
			}
		}
	},
	["10_81"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"hp_max",
				33455
			},
			{
				"speed",
				20
			}
		}
	},
	["10_82"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"hp_max",
				33685
			},
			{
				"speed",
				20
			}
		}
	},
	["10_83"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"hp_max",
				33915
			},
			{
				"speed",
				20
			}
		}
	},
	["10_84"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"hp_max",
				34145
			},
			{
				"speed",
				20
			}
		}
	},
	["10_85"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"hp_max",
				34375
			},
			{
				"speed",
				20
			}
		}
	},
	["10_86"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"hp_max",
				34605
			},
			{
				"speed",
				20
			}
		}
	},
	["10_87"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"hp_max",
				34835
			},
			{
				"speed",
				20
			}
		}
	},
	["10_88"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"hp_max",
				35065
			},
			{
				"speed",
				20
			}
		}
	},
	["10_89"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"hp_max",
				35295
			},
			{
				"speed",
				20
			}
		}
	},
	["10_90"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"hp_max",
				35525
			},
			{
				"speed",
				20
			}
		}
	},
	["10_91"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"hp_max",
				35755
			},
			{
				"speed",
				20
			}
		}
	},
	["10_92"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"hp_max",
				35985
			},
			{
				"speed",
				20
			}
		}
	},
	["10_93"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"hp_max",
				36215
			},
			{
				"speed",
				20
			}
		}
	},
	["10_94"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"hp_max",
				36445
			},
			{
				"speed",
				20
			}
		}
	},
	["10_95"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"hp_max",
				36675
			},
			{
				"speed",
				20
			}
		}
	},
	["10_96"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"hp_max",
				36905
			},
			{
				"speed",
				20
			}
		}
	},
	["10_97"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"hp_max",
				37135
			},
			{
				"speed",
				20
			}
		}
	},
	["10_98"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"hp_max",
				37365
			},
			{
				"speed",
				20
			}
		}
	},
	["10_99"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"hp_max",
				37595
			},
			{
				"speed",
				20
			}
		}
	},
	["10_100"] = {
		need_star = 6,
		name = "合体果实",
		desc = "",
		id = 10,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"hp_max",
				37825
			},
			{
				"speed",
				20
			}
		}
	},
	["11_1"] = {
		need_star = 1,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 1,
		need_items = {
			{
				19011,
				50
			}
		},
		atts = {
			{
				"hp_max",
				10000
			},
			{
				"def",
				20
			}
		}
	},
	["11_2"] = {
		need_star = 1,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				10125
			},
			{
				"def",
				20
			}
		}
	},
	["11_3"] = {
		need_star = 1,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				10250
			},
			{
				"def",
				20
			}
		}
	},
	["11_4"] = {
		need_star = 1,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				10375
			},
			{
				"def",
				20
			}
		}
	},
	["11_5"] = {
		need_star = 1,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				10500
			},
			{
				"def",
				20
			}
		}
	},
	["11_6"] = {
		need_star = 1,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				10625
			},
			{
				"def",
				20
			}
		}
	},
	["11_7"] = {
		need_star = 1,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				10750
			},
			{
				"def",
				20
			}
		}
	},
	["11_8"] = {
		need_star = 1,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				10875
			},
			{
				"def",
				20
			}
		}
	},
	["11_9"] = {
		need_star = 1,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				11000
			},
			{
				"def",
				20
			}
		}
	},
	["11_10"] = {
		need_star = 1,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				11125
			},
			{
				"def",
				20
			}
		}
	},
	["11_11"] = {
		need_star = 2,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				11260
			},
			{
				"def",
				20
			}
		}
	},
	["11_12"] = {
		need_star = 2,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				11395
			},
			{
				"def",
				20
			}
		}
	},
	["11_13"] = {
		need_star = 2,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				11530
			},
			{
				"def",
				20
			}
		}
	},
	["11_14"] = {
		need_star = 2,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				11665
			},
			{
				"def",
				20
			}
		}
	},
	["11_15"] = {
		need_star = 2,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				11800
			},
			{
				"def",
				20
			}
		}
	},
	["11_16"] = {
		need_star = 2,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				11935
			},
			{
				"def",
				20
			}
		}
	},
	["11_17"] = {
		need_star = 2,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				12070
			},
			{
				"def",
				20
			}
		}
	},
	["11_18"] = {
		need_star = 2,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				12205
			},
			{
				"def",
				20
			}
		}
	},
	["11_19"] = {
		need_star = 2,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				12340
			},
			{
				"def",
				20
			}
		}
	},
	["11_20"] = {
		need_star = 2,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				12475
			},
			{
				"def",
				20
			}
		}
	},
	["11_21"] = {
		need_star = 3,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				12620
			},
			{
				"def",
				20
			}
		}
	},
	["11_22"] = {
		need_star = 3,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				12765
			},
			{
				"def",
				20
			}
		}
	},
	["11_23"] = {
		need_star = 3,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				12910
			},
			{
				"def",
				20
			}
		}
	},
	["11_24"] = {
		need_star = 3,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				13055
			},
			{
				"def",
				20
			}
		}
	},
	["11_25"] = {
		need_star = 3,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"def",
				20
			}
		}
	},
	["11_26"] = {
		need_star = 3,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				13345
			},
			{
				"def",
				20
			}
		}
	},
	["11_27"] = {
		need_star = 3,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				13490
			},
			{
				"def",
				20
			}
		}
	},
	["11_28"] = {
		need_star = 3,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				13635
			},
			{
				"def",
				20
			}
		}
	},
	["11_29"] = {
		need_star = 3,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				13780
			},
			{
				"def",
				20
			}
		}
	},
	["11_30"] = {
		need_star = 3,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				13925
			},
			{
				"def",
				20
			}
		}
	},
	["11_31"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				14085
			},
			{
				"def",
				20
			}
		}
	},
	["11_32"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				14245
			},
			{
				"def",
				20
			}
		}
	},
	["11_33"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				14405
			},
			{
				"def",
				20
			}
		}
	},
	["11_34"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				14565
			},
			{
				"def",
				20
			}
		}
	},
	["11_35"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				14725
			},
			{
				"def",
				20
			}
		}
	},
	["11_36"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				14885
			},
			{
				"def",
				20
			}
		}
	},
	["11_37"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				15045
			},
			{
				"def",
				20
			}
		}
	},
	["11_38"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				15205
			},
			{
				"def",
				20
			}
		}
	},
	["11_39"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				15365
			},
			{
				"def",
				20
			}
		}
	},
	["11_40"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 11,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				17525
			},
			{
				"def",
				24
			}
		}
	},
	["11_41"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				17685
			},
			{
				"def",
				24
			}
		}
	},
	["11_42"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				17845
			},
			{
				"def",
				24
			}
		}
	},
	["11_43"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				18005
			},
			{
				"def",
				24
			}
		}
	},
	["11_44"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				18165
			},
			{
				"def",
				24
			}
		}
	},
	["11_45"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				18325
			},
			{
				"def",
				24
			}
		}
	},
	["11_46"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				18485
			},
			{
				"def",
				24
			}
		}
	},
	["11_47"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				18645
			},
			{
				"def",
				24
			}
		}
	},
	["11_48"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				18805
			},
			{
				"def",
				24
			}
		}
	},
	["11_49"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				18965
			},
			{
				"def",
				24
			}
		}
	},
	["11_50"] = {
		need_star = 4,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				19125
			},
			{
				"def",
				24
			}
		}
	},
	["11_51"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				19315
			},
			{
				"def",
				24
			}
		}
	},
	["11_52"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				19505
			},
			{
				"def",
				24
			}
		}
	},
	["11_53"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				19695
			},
			{
				"def",
				24
			}
		}
	},
	["11_54"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				19885
			},
			{
				"def",
				24
			}
		}
	},
	["11_55"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				20075
			},
			{
				"def",
				24
			}
		}
	},
	["11_56"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				20265
			},
			{
				"def",
				24
			}
		}
	},
	["11_57"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				20455
			},
			{
				"def",
				24
			}
		}
	},
	["11_58"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				20645
			},
			{
				"def",
				24
			}
		}
	},
	["11_59"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				20835
			},
			{
				"def",
				24
			}
		}
	},
	["11_60"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 11,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				24025
			},
			{
				"def",
				30
			}
		}
	},
	["11_61"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				24215
			},
			{
				"def",
				30
			}
		}
	},
	["11_62"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				24405
			},
			{
				"def",
				30
			}
		}
	},
	["11_63"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				24595
			},
			{
				"def",
				30
			}
		}
	},
	["11_64"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				24785
			},
			{
				"def",
				30
			}
		}
	},
	["11_65"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				24975
			},
			{
				"def",
				30
			}
		}
	},
	["11_66"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				25165
			},
			{
				"def",
				30
			}
		}
	},
	["11_67"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				25355
			},
			{
				"def",
				30
			}
		}
	},
	["11_68"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				25545
			},
			{
				"def",
				30
			}
		}
	},
	["11_69"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				25735
			},
			{
				"def",
				30
			}
		}
	},
	["11_70"] = {
		need_star = 5,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				25925
			},
			{
				"def",
				30
			}
		}
	},
	["11_71"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"hp_max",
				26155
			},
			{
				"def",
				30
			}
		}
	},
	["11_72"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"hp_max",
				26385
			},
			{
				"def",
				30
			}
		}
	},
	["11_73"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"hp_max",
				26615
			},
			{
				"def",
				30
			}
		}
	},
	["11_74"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"hp_max",
				26845
			},
			{
				"def",
				30
			}
		}
	},
	["11_75"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"hp_max",
				27075
			},
			{
				"def",
				30
			}
		}
	},
	["11_76"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"hp_max",
				27305
			},
			{
				"def",
				30
			}
		}
	},
	["11_77"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"hp_max",
				27535
			},
			{
				"def",
				30
			}
		}
	},
	["11_78"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"hp_max",
				27765
			},
			{
				"def",
				30
			}
		}
	},
	["11_79"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"hp_max",
				27995
			},
			{
				"def",
				30
			}
		}
	},
	["11_80"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 11,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"hp_max",
				33225
			},
			{
				"def",
				40
			}
		}
	},
	["11_81"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"hp_max",
				33455
			},
			{
				"def",
				40
			}
		}
	},
	["11_82"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"hp_max",
				33685
			},
			{
				"def",
				40
			}
		}
	},
	["11_83"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"hp_max",
				33915
			},
			{
				"def",
				40
			}
		}
	},
	["11_84"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"hp_max",
				34145
			},
			{
				"def",
				40
			}
		}
	},
	["11_85"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"hp_max",
				34375
			},
			{
				"def",
				40
			}
		}
	},
	["11_86"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"hp_max",
				34605
			},
			{
				"def",
				40
			}
		}
	},
	["11_87"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"hp_max",
				34835
			},
			{
				"def",
				40
			}
		}
	},
	["11_88"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"hp_max",
				35065
			},
			{
				"def",
				40
			}
		}
	},
	["11_89"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"hp_max",
				35295
			},
			{
				"def",
				40
			}
		}
	},
	["11_90"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"hp_max",
				35525
			},
			{
				"def",
				40
			}
		}
	},
	["11_91"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"hp_max",
				35755
			},
			{
				"def",
				40
			}
		}
	},
	["11_92"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"hp_max",
				35985
			},
			{
				"def",
				40
			}
		}
	},
	["11_93"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"hp_max",
				36215
			},
			{
				"def",
				40
			}
		}
	},
	["11_94"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"hp_max",
				36445
			},
			{
				"def",
				40
			}
		}
	},
	["11_95"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"hp_max",
				36675
			},
			{
				"def",
				40
			}
		}
	},
	["11_96"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"hp_max",
				36905
			},
			{
				"def",
				40
			}
		}
	},
	["11_97"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"hp_max",
				37135
			},
			{
				"def",
				40
			}
		}
	},
	["11_98"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"hp_max",
				37365
			},
			{
				"def",
				40
			}
		}
	},
	["11_99"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"hp_max",
				37595
			},
			{
				"def",
				40
			}
		}
	},
	["11_100"] = {
		need_star = 6,
		name = "蛇蛇果实",
		desc = "",
		id = 11,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"hp_max",
				37825
			},
			{
				"def",
				40
			}
		}
	},
	["12_1"] = {
		need_star = 1,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 1,
		need_items = {
			{
				19012,
				50
			}
		},
		atts = {
			{
				"hp_max",
				10000
			},
			{
				"speed",
				10
			}
		}
	},
	["12_2"] = {
		need_star = 1,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				10125
			},
			{
				"speed",
				10
			}
		}
	},
	["12_3"] = {
		need_star = 1,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				10250
			},
			{
				"speed",
				10
			}
		}
	},
	["12_4"] = {
		need_star = 1,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				10375
			},
			{
				"speed",
				10
			}
		}
	},
	["12_5"] = {
		need_star = 1,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				10500
			},
			{
				"speed",
				10
			}
		}
	},
	["12_6"] = {
		need_star = 1,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				10625
			},
			{
				"speed",
				10
			}
		}
	},
	["12_7"] = {
		need_star = 1,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				10750
			},
			{
				"speed",
				10
			}
		}
	},
	["12_8"] = {
		need_star = 1,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				10875
			},
			{
				"speed",
				10
			}
		}
	},
	["12_9"] = {
		need_star = 1,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				11000
			},
			{
				"speed",
				10
			}
		}
	},
	["12_10"] = {
		need_star = 1,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				11125
			},
			{
				"speed",
				10
			}
		}
	},
	["12_11"] = {
		need_star = 2,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				11260
			},
			{
				"speed",
				10
			}
		}
	},
	["12_12"] = {
		need_star = 2,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				11395
			},
			{
				"speed",
				10
			}
		}
	},
	["12_13"] = {
		need_star = 2,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				11530
			},
			{
				"speed",
				10
			}
		}
	},
	["12_14"] = {
		need_star = 2,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				11665
			},
			{
				"speed",
				10
			}
		}
	},
	["12_15"] = {
		need_star = 2,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				11800
			},
			{
				"speed",
				10
			}
		}
	},
	["12_16"] = {
		need_star = 2,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				11935
			},
			{
				"speed",
				10
			}
		}
	},
	["12_17"] = {
		need_star = 2,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				12070
			},
			{
				"speed",
				10
			}
		}
	},
	["12_18"] = {
		need_star = 2,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				12205
			},
			{
				"speed",
				10
			}
		}
	},
	["12_19"] = {
		need_star = 2,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				12340
			},
			{
				"speed",
				10
			}
		}
	},
	["12_20"] = {
		need_star = 2,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				12475
			},
			{
				"speed",
				10
			}
		}
	},
	["12_21"] = {
		need_star = 3,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				12620
			},
			{
				"speed",
				10
			}
		}
	},
	["12_22"] = {
		need_star = 3,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				12765
			},
			{
				"speed",
				10
			}
		}
	},
	["12_23"] = {
		need_star = 3,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				12910
			},
			{
				"speed",
				10
			}
		}
	},
	["12_24"] = {
		need_star = 3,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				13055
			},
			{
				"speed",
				10
			}
		}
	},
	["12_25"] = {
		need_star = 3,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"speed",
				10
			}
		}
	},
	["12_26"] = {
		need_star = 3,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				13345
			},
			{
				"speed",
				10
			}
		}
	},
	["12_27"] = {
		need_star = 3,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				13490
			},
			{
				"speed",
				10
			}
		}
	},
	["12_28"] = {
		need_star = 3,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				13635
			},
			{
				"speed",
				10
			}
		}
	},
	["12_29"] = {
		need_star = 3,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				13780
			},
			{
				"speed",
				10
			}
		}
	},
	["12_30"] = {
		need_star = 3,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				13925
			},
			{
				"speed",
				10
			}
		}
	},
	["12_31"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				14085
			},
			{
				"speed",
				10
			}
		}
	},
	["12_32"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				14245
			},
			{
				"speed",
				10
			}
		}
	},
	["12_33"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				14405
			},
			{
				"speed",
				10
			}
		}
	},
	["12_34"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				14565
			},
			{
				"speed",
				10
			}
		}
	},
	["12_35"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				14725
			},
			{
				"speed",
				10
			}
		}
	},
	["12_36"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				14885
			},
			{
				"speed",
				10
			}
		}
	},
	["12_37"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				15045
			},
			{
				"speed",
				10
			}
		}
	},
	["12_38"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				15205
			},
			{
				"speed",
				10
			}
		}
	},
	["12_39"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				15365
			},
			{
				"speed",
				10
			}
		}
	},
	["12_40"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 12,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				17525
			},
			{
				"speed",
				12
			}
		}
	},
	["12_41"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				17685
			},
			{
				"speed",
				12
			}
		}
	},
	["12_42"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				17845
			},
			{
				"speed",
				12
			}
		}
	},
	["12_43"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				18005
			},
			{
				"speed",
				12
			}
		}
	},
	["12_44"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				18165
			},
			{
				"speed",
				12
			}
		}
	},
	["12_45"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				18325
			},
			{
				"speed",
				12
			}
		}
	},
	["12_46"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				18485
			},
			{
				"speed",
				12
			}
		}
	},
	["12_47"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				18645
			},
			{
				"speed",
				12
			}
		}
	},
	["12_48"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				18805
			},
			{
				"speed",
				12
			}
		}
	},
	["12_49"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				18965
			},
			{
				"speed",
				12
			}
		}
	},
	["12_50"] = {
		need_star = 4,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				19125
			},
			{
				"speed",
				12
			}
		}
	},
	["12_51"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				19315
			},
			{
				"speed",
				12
			}
		}
	},
	["12_52"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				19505
			},
			{
				"speed",
				12
			}
		}
	},
	["12_53"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				19695
			},
			{
				"speed",
				12
			}
		}
	},
	["12_54"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				19885
			},
			{
				"speed",
				12
			}
		}
	},
	["12_55"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				20075
			},
			{
				"speed",
				12
			}
		}
	},
	["12_56"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				20265
			},
			{
				"speed",
				12
			}
		}
	},
	["12_57"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				20455
			},
			{
				"speed",
				12
			}
		}
	},
	["12_58"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				20645
			},
			{
				"speed",
				12
			}
		}
	},
	["12_59"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				20835
			},
			{
				"speed",
				12
			}
		}
	},
	["12_60"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 12,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				24025
			},
			{
				"speed",
				15
			}
		}
	},
	["12_61"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				24215
			},
			{
				"speed",
				15
			}
		}
	},
	["12_62"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				24405
			},
			{
				"speed",
				15
			}
		}
	},
	["12_63"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				24595
			},
			{
				"speed",
				15
			}
		}
	},
	["12_64"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				24785
			},
			{
				"speed",
				15
			}
		}
	},
	["12_65"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				24975
			},
			{
				"speed",
				15
			}
		}
	},
	["12_66"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				25165
			},
			{
				"speed",
				15
			}
		}
	},
	["12_67"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				25355
			},
			{
				"speed",
				15
			}
		}
	},
	["12_68"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				25545
			},
			{
				"speed",
				15
			}
		}
	},
	["12_69"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				25735
			},
			{
				"speed",
				15
			}
		}
	},
	["12_70"] = {
		need_star = 5,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				25925
			},
			{
				"speed",
				15
			}
		}
	},
	["12_71"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"hp_max",
				26155
			},
			{
				"speed",
				15
			}
		}
	},
	["12_72"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"hp_max",
				26385
			},
			{
				"speed",
				15
			}
		}
	},
	["12_73"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"hp_max",
				26615
			},
			{
				"speed",
				15
			}
		}
	},
	["12_74"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"hp_max",
				26845
			},
			{
				"speed",
				15
			}
		}
	},
	["12_75"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"hp_max",
				27075
			},
			{
				"speed",
				15
			}
		}
	},
	["12_76"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"hp_max",
				27305
			},
			{
				"speed",
				15
			}
		}
	},
	["12_77"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"hp_max",
				27535
			},
			{
				"speed",
				15
			}
		}
	},
	["12_78"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"hp_max",
				27765
			},
			{
				"speed",
				15
			}
		}
	},
	["12_79"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"hp_max",
				27995
			},
			{
				"speed",
				15
			}
		}
	},
	["12_80"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 12,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"hp_max",
				33225
			},
			{
				"speed",
				20
			}
		}
	},
	["12_81"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"hp_max",
				33455
			},
			{
				"speed",
				20
			}
		}
	},
	["12_82"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"hp_max",
				33685
			},
			{
				"speed",
				20
			}
		}
	},
	["12_83"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"hp_max",
				33915
			},
			{
				"speed",
				20
			}
		}
	},
	["12_84"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"hp_max",
				34145
			},
			{
				"speed",
				20
			}
		}
	},
	["12_85"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"hp_max",
				34375
			},
			{
				"speed",
				20
			}
		}
	},
	["12_86"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"hp_max",
				34605
			},
			{
				"speed",
				20
			}
		}
	},
	["12_87"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"hp_max",
				34835
			},
			{
				"speed",
				20
			}
		}
	},
	["12_88"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"hp_max",
				35065
			},
			{
				"speed",
				20
			}
		}
	},
	["12_89"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"hp_max",
				35295
			},
			{
				"speed",
				20
			}
		}
	},
	["12_90"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"hp_max",
				35525
			},
			{
				"speed",
				20
			}
		}
	},
	["12_91"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"hp_max",
				35755
			},
			{
				"speed",
				20
			}
		}
	},
	["12_92"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"hp_max",
				35985
			},
			{
				"speed",
				20
			}
		}
	},
	["12_93"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"hp_max",
				36215
			},
			{
				"speed",
				20
			}
		}
	},
	["12_94"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"hp_max",
				36445
			},
			{
				"speed",
				20
			}
		}
	},
	["12_95"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"hp_max",
				36675
			},
			{
				"speed",
				20
			}
		}
	},
	["12_96"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"hp_max",
				36905
			},
			{
				"speed",
				20
			}
		}
	},
	["12_97"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"hp_max",
				37135
			},
			{
				"speed",
				20
			}
		}
	},
	["12_98"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"hp_max",
				37365
			},
			{
				"speed",
				20
			}
		}
	},
	["12_99"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"hp_max",
				37595
			},
			{
				"speed",
				20
			}
		}
	},
	["12_100"] = {
		need_star = 6,
		name = "鱼鱼果实",
		desc = "",
		id = 12,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"hp_max",
				37825
			},
			{
				"speed",
				20
			}
		}
	},
	["13_1"] = {
		need_star = 1,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 1,
		need_items = {
			{
				19013,
				50
			}
		},
		atts = {
			{
				"atk",
				2000
			},
			{
				"def",
				20
			}
		}
	},
	["13_2"] = {
		need_star = 1,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"atk",
				2025
			},
			{
				"def",
				20
			}
		}
	},
	["13_3"] = {
		need_star = 1,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"atk",
				2050
			},
			{
				"def",
				20
			}
		}
	},
	["13_4"] = {
		need_star = 1,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"atk",
				2075
			},
			{
				"def",
				20
			}
		}
	},
	["13_5"] = {
		need_star = 1,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"atk",
				2100
			},
			{
				"def",
				20
			}
		}
	},
	["13_6"] = {
		need_star = 1,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"atk",
				2125
			},
			{
				"def",
				20
			}
		}
	},
	["13_7"] = {
		need_star = 1,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"atk",
				2150
			},
			{
				"def",
				20
			}
		}
	},
	["13_8"] = {
		need_star = 1,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"atk",
				2175
			},
			{
				"def",
				20
			}
		}
	},
	["13_9"] = {
		need_star = 1,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"atk",
				2200
			},
			{
				"def",
				20
			}
		}
	},
	["13_10"] = {
		need_star = 1,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"atk",
				2225
			},
			{
				"def",
				20
			}
		}
	},
	["13_11"] = {
		need_star = 2,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"atk",
				2252
			},
			{
				"def",
				20
			}
		}
	},
	["13_12"] = {
		need_star = 2,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"atk",
				2279
			},
			{
				"def",
				20
			}
		}
	},
	["13_13"] = {
		need_star = 2,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"atk",
				2306
			},
			{
				"def",
				20
			}
		}
	},
	["13_14"] = {
		need_star = 2,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"atk",
				2333
			},
			{
				"def",
				20
			}
		}
	},
	["13_15"] = {
		need_star = 2,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"atk",
				2360
			},
			{
				"def",
				20
			}
		}
	},
	["13_16"] = {
		need_star = 2,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"atk",
				2387
			},
			{
				"def",
				20
			}
		}
	},
	["13_17"] = {
		need_star = 2,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"atk",
				2414
			},
			{
				"def",
				20
			}
		}
	},
	["13_18"] = {
		need_star = 2,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"atk",
				2441
			},
			{
				"def",
				20
			}
		}
	},
	["13_19"] = {
		need_star = 2,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"atk",
				2468
			},
			{
				"def",
				20
			}
		}
	},
	["13_20"] = {
		need_star = 2,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"atk",
				2495
			},
			{
				"def",
				20
			}
		}
	},
	["13_21"] = {
		need_star = 3,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"atk",
				2525
			},
			{
				"def",
				20
			}
		}
	},
	["13_22"] = {
		need_star = 3,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"atk",
				2555
			},
			{
				"def",
				20
			}
		}
	},
	["13_23"] = {
		need_star = 3,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"atk",
				2585
			},
			{
				"def",
				20
			}
		}
	},
	["13_24"] = {
		need_star = 3,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"atk",
				2615
			},
			{
				"def",
				20
			}
		}
	},
	["13_25"] = {
		need_star = 3,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"atk",
				2645
			},
			{
				"def",
				20
			}
		}
	},
	["13_26"] = {
		need_star = 3,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"atk",
				2675
			},
			{
				"def",
				20
			}
		}
	},
	["13_27"] = {
		need_star = 3,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"atk",
				2705
			},
			{
				"def",
				20
			}
		}
	},
	["13_28"] = {
		need_star = 3,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"atk",
				2735
			},
			{
				"def",
				20
			}
		}
	},
	["13_29"] = {
		need_star = 3,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"atk",
				2765
			},
			{
				"def",
				20
			}
		}
	},
	["13_30"] = {
		need_star = 3,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"atk",
				2795
			},
			{
				"def",
				20
			}
		}
	},
	["13_31"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"atk",
				2830
			},
			{
				"def",
				20
			}
		}
	},
	["13_32"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"atk",
				2865
			},
			{
				"def",
				20
			}
		}
	},
	["13_33"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"atk",
				2900
			},
			{
				"def",
				20
			}
		}
	},
	["13_34"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"atk",
				2935
			},
			{
				"def",
				20
			}
		}
	},
	["13_35"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"atk",
				2970
			},
			{
				"def",
				20
			}
		}
	},
	["13_36"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"atk",
				3005
			},
			{
				"def",
				20
			}
		}
	},
	["13_37"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"atk",
				3040
			},
			{
				"def",
				20
			}
		}
	},
	["13_38"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"atk",
				3075
			},
			{
				"def",
				20
			}
		}
	},
	["13_39"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"atk",
				3110
			},
			{
				"def",
				20
			}
		}
	},
	["13_40"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 13,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"atk",
				3545
			},
			{
				"def",
				24
			}
		}
	},
	["13_41"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"atk",
				3580
			},
			{
				"def",
				24
			}
		}
	},
	["13_42"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"atk",
				3615
			},
			{
				"def",
				24
			}
		}
	},
	["13_43"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"atk",
				3650
			},
			{
				"def",
				24
			}
		}
	},
	["13_44"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"atk",
				3685
			},
			{
				"def",
				24
			}
		}
	},
	["13_45"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"atk",
				3720
			},
			{
				"def",
				24
			}
		}
	},
	["13_46"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"atk",
				3755
			},
			{
				"def",
				24
			}
		}
	},
	["13_47"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"atk",
				3790
			},
			{
				"def",
				24
			}
		}
	},
	["13_48"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"atk",
				3825
			},
			{
				"def",
				24
			}
		}
	},
	["13_49"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"atk",
				3860
			},
			{
				"def",
				24
			}
		}
	},
	["13_50"] = {
		need_star = 4,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"atk",
				3895
			},
			{
				"def",
				24
			}
		}
	},
	["13_51"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"atk",
				3940
			},
			{
				"def",
				24
			}
		}
	},
	["13_52"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"atk",
				3985
			},
			{
				"def",
				24
			}
		}
	},
	["13_53"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"atk",
				4030
			},
			{
				"def",
				24
			}
		}
	},
	["13_54"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"atk",
				4075
			},
			{
				"def",
				24
			}
		}
	},
	["13_55"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"atk",
				4120
			},
			{
				"def",
				24
			}
		}
	},
	["13_56"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"atk",
				4165
			},
			{
				"def",
				24
			}
		}
	},
	["13_57"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"atk",
				4210
			},
			{
				"def",
				24
			}
		}
	},
	["13_58"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"atk",
				4255
			},
			{
				"def",
				24
			}
		}
	},
	["13_59"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"atk",
				4300
			},
			{
				"def",
				24
			}
		}
	},
	["13_60"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 13,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"atk",
				4945
			},
			{
				"def",
				30
			}
		}
	},
	["13_61"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"atk",
				4990
			},
			{
				"def",
				30
			}
		}
	},
	["13_62"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"atk",
				5035
			},
			{
				"def",
				30
			}
		}
	},
	["13_63"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"atk",
				5080
			},
			{
				"def",
				30
			}
		}
	},
	["13_64"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"atk",
				5125
			},
			{
				"def",
				30
			}
		}
	},
	["13_65"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"atk",
				5170
			},
			{
				"def",
				30
			}
		}
	},
	["13_66"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"atk",
				5215
			},
			{
				"def",
				30
			}
		}
	},
	["13_67"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"atk",
				5260
			},
			{
				"def",
				30
			}
		}
	},
	["13_68"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"atk",
				5305
			},
			{
				"def",
				30
			}
		}
	},
	["13_69"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"atk",
				5350
			},
			{
				"def",
				30
			}
		}
	},
	["13_70"] = {
		need_star = 5,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"atk",
				5395
			},
			{
				"def",
				30
			}
		}
	},
	["13_71"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"atk",
				5455
			},
			{
				"def",
				30
			}
		}
	},
	["13_72"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"atk",
				5515
			},
			{
				"def",
				30
			}
		}
	},
	["13_73"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"atk",
				5575
			},
			{
				"def",
				30
			}
		}
	},
	["13_74"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"atk",
				5635
			},
			{
				"def",
				30
			}
		}
	},
	["13_75"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"atk",
				5695
			},
			{
				"def",
				30
			}
		}
	},
	["13_76"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"atk",
				5755
			},
			{
				"def",
				30
			}
		}
	},
	["13_77"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"atk",
				5815
			},
			{
				"def",
				30
			}
		}
	},
	["13_78"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"atk",
				5875
			},
			{
				"def",
				30
			}
		}
	},
	["13_79"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"atk",
				5935
			},
			{
				"def",
				30
			}
		}
	},
	["13_80"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 13,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"atk",
				6995
			},
			{
				"def",
				40
			}
		}
	},
	["13_81"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"atk",
				7055
			},
			{
				"def",
				40
			}
		}
	},
	["13_82"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"atk",
				7115
			},
			{
				"def",
				40
			}
		}
	},
	["13_83"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"atk",
				7175
			},
			{
				"def",
				40
			}
		}
	},
	["13_84"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"atk",
				7235
			},
			{
				"def",
				40
			}
		}
	},
	["13_85"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"atk",
				7295
			},
			{
				"def",
				40
			}
		}
	},
	["13_86"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"atk",
				7355
			},
			{
				"def",
				40
			}
		}
	},
	["13_87"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"atk",
				7415
			},
			{
				"def",
				40
			}
		}
	},
	["13_88"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"atk",
				7475
			},
			{
				"def",
				40
			}
		}
	},
	["13_89"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"atk",
				7535
			},
			{
				"def",
				40
			}
		}
	},
	["13_90"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"atk",
				7595
			},
			{
				"def",
				40
			}
		}
	},
	["13_91"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"atk",
				7655
			},
			{
				"def",
				40
			}
		}
	},
	["13_92"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"atk",
				7715
			},
			{
				"def",
				40
			}
		}
	},
	["13_93"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"atk",
				7775
			},
			{
				"def",
				40
			}
		}
	},
	["13_94"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"atk",
				7835
			},
			{
				"def",
				40
			}
		}
	},
	["13_95"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"atk",
				7895
			},
			{
				"def",
				40
			}
		}
	},
	["13_96"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"atk",
				7955
			},
			{
				"def",
				40
			}
		}
	},
	["13_97"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"atk",
				8015
			},
			{
				"def",
				40
			}
		}
	},
	["13_98"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"atk",
				8075
			},
			{
				"def",
				40
			}
		}
	},
	["13_99"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"atk",
				8135
			},
			{
				"def",
				40
			}
		}
	},
	["13_100"] = {
		need_star = 6,
		name = "犬犬果实",
		desc = "",
		id = 13,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"atk",
				8195
			},
			{
				"def",
				40
			}
		}
	},
	["14_1"] = {
		need_star = 1,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 1,
		need_items = {
			{
				19014,
				50
			}
		},
		atts = {
			{
				"atk",
				2000
			},
			{
				"def",
				20
			}
		}
	},
	["14_2"] = {
		need_star = 1,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"atk",
				2025
			},
			{
				"def",
				20
			}
		}
	},
	["14_3"] = {
		need_star = 1,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"atk",
				2050
			},
			{
				"def",
				20
			}
		}
	},
	["14_4"] = {
		need_star = 1,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"atk",
				2075
			},
			{
				"def",
				20
			}
		}
	},
	["14_5"] = {
		need_star = 1,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"atk",
				2100
			},
			{
				"def",
				20
			}
		}
	},
	["14_6"] = {
		need_star = 1,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"atk",
				2125
			},
			{
				"def",
				20
			}
		}
	},
	["14_7"] = {
		need_star = 1,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"atk",
				2150
			},
			{
				"def",
				20
			}
		}
	},
	["14_8"] = {
		need_star = 1,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"atk",
				2175
			},
			{
				"def",
				20
			}
		}
	},
	["14_9"] = {
		need_star = 1,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"atk",
				2200
			},
			{
				"def",
				20
			}
		}
	},
	["14_10"] = {
		need_star = 1,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"atk",
				2225
			},
			{
				"def",
				20
			}
		}
	},
	["14_11"] = {
		need_star = 2,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"atk",
				2252
			},
			{
				"def",
				20
			}
		}
	},
	["14_12"] = {
		need_star = 2,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"atk",
				2279
			},
			{
				"def",
				20
			}
		}
	},
	["14_13"] = {
		need_star = 2,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"atk",
				2306
			},
			{
				"def",
				20
			}
		}
	},
	["14_14"] = {
		need_star = 2,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"atk",
				2333
			},
			{
				"def",
				20
			}
		}
	},
	["14_15"] = {
		need_star = 2,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"atk",
				2360
			},
			{
				"def",
				20
			}
		}
	},
	["14_16"] = {
		need_star = 2,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"atk",
				2387
			},
			{
				"def",
				20
			}
		}
	},
	["14_17"] = {
		need_star = 2,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"atk",
				2414
			},
			{
				"def",
				20
			}
		}
	},
	["14_18"] = {
		need_star = 2,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"atk",
				2441
			},
			{
				"def",
				20
			}
		}
	},
	["14_19"] = {
		need_star = 2,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"atk",
				2468
			},
			{
				"def",
				20
			}
		}
	},
	["14_20"] = {
		need_star = 2,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"atk",
				2495
			},
			{
				"def",
				20
			}
		}
	},
	["14_21"] = {
		need_star = 3,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"atk",
				2525
			},
			{
				"def",
				20
			}
		}
	},
	["14_22"] = {
		need_star = 3,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"atk",
				2555
			},
			{
				"def",
				20
			}
		}
	},
	["14_23"] = {
		need_star = 3,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"atk",
				2585
			},
			{
				"def",
				20
			}
		}
	},
	["14_24"] = {
		need_star = 3,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"atk",
				2615
			},
			{
				"def",
				20
			}
		}
	},
	["14_25"] = {
		need_star = 3,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"atk",
				2645
			},
			{
				"def",
				20
			}
		}
	},
	["14_26"] = {
		need_star = 3,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"atk",
				2675
			},
			{
				"def",
				20
			}
		}
	},
	["14_27"] = {
		need_star = 3,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"atk",
				2705
			},
			{
				"def",
				20
			}
		}
	},
	["14_28"] = {
		need_star = 3,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"atk",
				2735
			},
			{
				"def",
				20
			}
		}
	},
	["14_29"] = {
		need_star = 3,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"atk",
				2765
			},
			{
				"def",
				20
			}
		}
	},
	["14_30"] = {
		need_star = 3,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"atk",
				2795
			},
			{
				"def",
				20
			}
		}
	},
	["14_31"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"atk",
				2830
			},
			{
				"def",
				20
			}
		}
	},
	["14_32"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"atk",
				2865
			},
			{
				"def",
				20
			}
		}
	},
	["14_33"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"atk",
				2900
			},
			{
				"def",
				20
			}
		}
	},
	["14_34"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"atk",
				2935
			},
			{
				"def",
				20
			}
		}
	},
	["14_35"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"atk",
				2970
			},
			{
				"def",
				20
			}
		}
	},
	["14_36"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"atk",
				3005
			},
			{
				"def",
				20
			}
		}
	},
	["14_37"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"atk",
				3040
			},
			{
				"def",
				20
			}
		}
	},
	["14_38"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"atk",
				3075
			},
			{
				"def",
				20
			}
		}
	},
	["14_39"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"atk",
				3110
			},
			{
				"def",
				20
			}
		}
	},
	["14_40"] = {
		need_star = 4,
		name = "手术果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 14,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"atk",
				3545
			},
			{
				"def",
				24
			}
		}
	},
	["14_41"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"atk",
				3580
			},
			{
				"def",
				24
			}
		}
	},
	["14_42"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"atk",
				3615
			},
			{
				"def",
				24
			}
		}
	},
	["14_43"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"atk",
				3650
			},
			{
				"def",
				24
			}
		}
	},
	["14_44"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"atk",
				3685
			},
			{
				"def",
				24
			}
		}
	},
	["14_45"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"atk",
				3720
			},
			{
				"def",
				24
			}
		}
	},
	["14_46"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"atk",
				3755
			},
			{
				"def",
				24
			}
		}
	},
	["14_47"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"atk",
				3790
			},
			{
				"def",
				24
			}
		}
	},
	["14_48"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"atk",
				3825
			},
			{
				"def",
				24
			}
		}
	},
	["14_49"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"atk",
				3860
			},
			{
				"def",
				24
			}
		}
	},
	["14_50"] = {
		need_star = 4,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"atk",
				3895
			},
			{
				"def",
				24
			}
		}
	},
	["14_51"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"atk",
				3940
			},
			{
				"def",
				24
			}
		}
	},
	["14_52"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"atk",
				3985
			},
			{
				"def",
				24
			}
		}
	},
	["14_53"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"atk",
				4030
			},
			{
				"def",
				24
			}
		}
	},
	["14_54"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"atk",
				4075
			},
			{
				"def",
				24
			}
		}
	},
	["14_55"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"atk",
				4120
			},
			{
				"def",
				24
			}
		}
	},
	["14_56"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"atk",
				4165
			},
			{
				"def",
				24
			}
		}
	},
	["14_57"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"atk",
				4210
			},
			{
				"def",
				24
			}
		}
	},
	["14_58"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"atk",
				4255
			},
			{
				"def",
				24
			}
		}
	},
	["14_59"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"atk",
				4300
			},
			{
				"def",
				24
			}
		}
	},
	["14_60"] = {
		need_star = 5,
		name = "手术果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 14,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"atk",
				4945
			},
			{
				"def",
				30
			}
		}
	},
	["14_61"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"atk",
				4990
			},
			{
				"def",
				30
			}
		}
	},
	["14_62"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"atk",
				5035
			},
			{
				"def",
				30
			}
		}
	},
	["14_63"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"atk",
				5080
			},
			{
				"def",
				30
			}
		}
	},
	["14_64"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"atk",
				5125
			},
			{
				"def",
				30
			}
		}
	},
	["14_65"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"atk",
				5170
			},
			{
				"def",
				30
			}
		}
	},
	["14_66"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"atk",
				5215
			},
			{
				"def",
				30
			}
		}
	},
	["14_67"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"atk",
				5260
			},
			{
				"def",
				30
			}
		}
	},
	["14_68"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"atk",
				5305
			},
			{
				"def",
				30
			}
		}
	},
	["14_69"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"atk",
				5350
			},
			{
				"def",
				30
			}
		}
	},
	["14_70"] = {
		need_star = 5,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"atk",
				5395
			},
			{
				"def",
				30
			}
		}
	},
	["14_71"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"atk",
				5455
			},
			{
				"def",
				30
			}
		}
	},
	["14_72"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"atk",
				5515
			},
			{
				"def",
				30
			}
		}
	},
	["14_73"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"atk",
				5575
			},
			{
				"def",
				30
			}
		}
	},
	["14_74"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"atk",
				5635
			},
			{
				"def",
				30
			}
		}
	},
	["14_75"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"atk",
				5695
			},
			{
				"def",
				30
			}
		}
	},
	["14_76"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"atk",
				5755
			},
			{
				"def",
				30
			}
		}
	},
	["14_77"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"atk",
				5815
			},
			{
				"def",
				30
			}
		}
	},
	["14_78"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"atk",
				5875
			},
			{
				"def",
				30
			}
		}
	},
	["14_79"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"atk",
				5935
			},
			{
				"def",
				30
			}
		}
	},
	["14_80"] = {
		need_star = 6,
		name = "手术果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 14,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"atk",
				6995
			},
			{
				"def",
				40
			}
		}
	},
	["14_81"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"atk",
				7055
			},
			{
				"def",
				40
			}
		}
	},
	["14_82"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"atk",
				7115
			},
			{
				"def",
				40
			}
		}
	},
	["14_83"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"atk",
				7175
			},
			{
				"def",
				40
			}
		}
	},
	["14_84"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"atk",
				7235
			},
			{
				"def",
				40
			}
		}
	},
	["14_85"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"atk",
				7295
			},
			{
				"def",
				40
			}
		}
	},
	["14_86"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"atk",
				7355
			},
			{
				"def",
				40
			}
		}
	},
	["14_87"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"atk",
				7415
			},
			{
				"def",
				40
			}
		}
	},
	["14_88"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"atk",
				7475
			},
			{
				"def",
				40
			}
		}
	},
	["14_89"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"atk",
				7535
			},
			{
				"def",
				40
			}
		}
	},
	["14_90"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"atk",
				7595
			},
			{
				"def",
				40
			}
		}
	},
	["14_91"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"atk",
				7655
			},
			{
				"def",
				40
			}
		}
	},
	["14_92"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"atk",
				7715
			},
			{
				"def",
				40
			}
		}
	},
	["14_93"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"atk",
				7775
			},
			{
				"def",
				40
			}
		}
	},
	["14_94"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"atk",
				7835
			},
			{
				"def",
				40
			}
		}
	},
	["14_95"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"atk",
				7895
			},
			{
				"def",
				40
			}
		}
	},
	["14_96"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"atk",
				7955
			},
			{
				"def",
				40
			}
		}
	},
	["14_97"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"atk",
				8015
			},
			{
				"def",
				40
			}
		}
	},
	["14_98"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"atk",
				8075
			},
			{
				"def",
				40
			}
		}
	},
	["14_99"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"atk",
				8135
			},
			{
				"def",
				40
			}
		}
	},
	["14_100"] = {
		need_star = 6,
		name = "手术果实",
		desc = "",
		id = 14,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"atk",
				8195
			},
			{
				"def",
				40
			}
		}
	},
	["15_1"] = {
		need_star = 1,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 1,
		need_items = {
			{
				19015,
				50
			}
		},
		atts = {
			{
				"hp_max",
				10000
			},
			{
				"def",
				20
			}
		}
	},
	["15_2"] = {
		need_star = 1,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				10125
			},
			{
				"def",
				20
			}
		}
	},
	["15_3"] = {
		need_star = 1,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				10250
			},
			{
				"def",
				20
			}
		}
	},
	["15_4"] = {
		need_star = 1,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				10375
			},
			{
				"def",
				20
			}
		}
	},
	["15_5"] = {
		need_star = 1,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				10500
			},
			{
				"def",
				20
			}
		}
	},
	["15_6"] = {
		need_star = 1,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				10625
			},
			{
				"def",
				20
			}
		}
	},
	["15_7"] = {
		need_star = 1,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				10750
			},
			{
				"def",
				20
			}
		}
	},
	["15_8"] = {
		need_star = 1,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				10875
			},
			{
				"def",
				20
			}
		}
	},
	["15_9"] = {
		need_star = 1,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				11000
			},
			{
				"def",
				20
			}
		}
	},
	["15_10"] = {
		need_star = 1,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				11125
			},
			{
				"def",
				20
			}
		}
	},
	["15_11"] = {
		need_star = 2,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				11260
			},
			{
				"def",
				20
			}
		}
	},
	["15_12"] = {
		need_star = 2,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				11395
			},
			{
				"def",
				20
			}
		}
	},
	["15_13"] = {
		need_star = 2,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				11530
			},
			{
				"def",
				20
			}
		}
	},
	["15_14"] = {
		need_star = 2,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				11665
			},
			{
				"def",
				20
			}
		}
	},
	["15_15"] = {
		need_star = 2,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				11800
			},
			{
				"def",
				20
			}
		}
	},
	["15_16"] = {
		need_star = 2,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				11935
			},
			{
				"def",
				20
			}
		}
	},
	["15_17"] = {
		need_star = 2,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				12070
			},
			{
				"def",
				20
			}
		}
	},
	["15_18"] = {
		need_star = 2,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				12205
			},
			{
				"def",
				20
			}
		}
	},
	["15_19"] = {
		need_star = 2,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				12340
			},
			{
				"def",
				20
			}
		}
	},
	["15_20"] = {
		need_star = 2,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				12475
			},
			{
				"def",
				20
			}
		}
	},
	["15_21"] = {
		need_star = 3,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				12620
			},
			{
				"def",
				20
			}
		}
	},
	["15_22"] = {
		need_star = 3,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				12765
			},
			{
				"def",
				20
			}
		}
	},
	["15_23"] = {
		need_star = 3,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				12910
			},
			{
				"def",
				20
			}
		}
	},
	["15_24"] = {
		need_star = 3,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				13055
			},
			{
				"def",
				20
			}
		}
	},
	["15_25"] = {
		need_star = 3,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"def",
				20
			}
		}
	},
	["15_26"] = {
		need_star = 3,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				13345
			},
			{
				"def",
				20
			}
		}
	},
	["15_27"] = {
		need_star = 3,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				13490
			},
			{
				"def",
				20
			}
		}
	},
	["15_28"] = {
		need_star = 3,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				13635
			},
			{
				"def",
				20
			}
		}
	},
	["15_29"] = {
		need_star = 3,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				13780
			},
			{
				"def",
				20
			}
		}
	},
	["15_30"] = {
		need_star = 3,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				13925
			},
			{
				"def",
				20
			}
		}
	},
	["15_31"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				14085
			},
			{
				"def",
				20
			}
		}
	},
	["15_32"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				14245
			},
			{
				"def",
				20
			}
		}
	},
	["15_33"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				14405
			},
			{
				"def",
				20
			}
		}
	},
	["15_34"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				14565
			},
			{
				"def",
				20
			}
		}
	},
	["15_35"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				14725
			},
			{
				"def",
				20
			}
		}
	},
	["15_36"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				14885
			},
			{
				"def",
				20
			}
		}
	},
	["15_37"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				15045
			},
			{
				"def",
				20
			}
		}
	},
	["15_38"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				15205
			},
			{
				"def",
				20
			}
		}
	},
	["15_39"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				15365
			},
			{
				"def",
				20
			}
		}
	},
	["15_40"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 15,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				17525
			},
			{
				"def",
				24
			}
		}
	},
	["15_41"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				17685
			},
			{
				"def",
				24
			}
		}
	},
	["15_42"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				17845
			},
			{
				"def",
				24
			}
		}
	},
	["15_43"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				18005
			},
			{
				"def",
				24
			}
		}
	},
	["15_44"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				18165
			},
			{
				"def",
				24
			}
		}
	},
	["15_45"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				18325
			},
			{
				"def",
				24
			}
		}
	},
	["15_46"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				18485
			},
			{
				"def",
				24
			}
		}
	},
	["15_47"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				18645
			},
			{
				"def",
				24
			}
		}
	},
	["15_48"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				18805
			},
			{
				"def",
				24
			}
		}
	},
	["15_49"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				18965
			},
			{
				"def",
				24
			}
		}
	},
	["15_50"] = {
		need_star = 4,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				19125
			},
			{
				"def",
				24
			}
		}
	},
	["15_51"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				19315
			},
			{
				"def",
				24
			}
		}
	},
	["15_52"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				19505
			},
			{
				"def",
				24
			}
		}
	},
	["15_53"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				19695
			},
			{
				"def",
				24
			}
		}
	},
	["15_54"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				19885
			},
			{
				"def",
				24
			}
		}
	},
	["15_55"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				20075
			},
			{
				"def",
				24
			}
		}
	},
	["15_56"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				20265
			},
			{
				"def",
				24
			}
		}
	},
	["15_57"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				20455
			},
			{
				"def",
				24
			}
		}
	},
	["15_58"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				20645
			},
			{
				"def",
				24
			}
		}
	},
	["15_59"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				20835
			},
			{
				"def",
				24
			}
		}
	},
	["15_60"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 15,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				24025
			},
			{
				"def",
				30
			}
		}
	},
	["15_61"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				24215
			},
			{
				"def",
				30
			}
		}
	},
	["15_62"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				24405
			},
			{
				"def",
				30
			}
		}
	},
	["15_63"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				24595
			},
			{
				"def",
				30
			}
		}
	},
	["15_64"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				24785
			},
			{
				"def",
				30
			}
		}
	},
	["15_65"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				24975
			},
			{
				"def",
				30
			}
		}
	},
	["15_66"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				25165
			},
			{
				"def",
				30
			}
		}
	},
	["15_67"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				25355
			},
			{
				"def",
				30
			}
		}
	},
	["15_68"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				25545
			},
			{
				"def",
				30
			}
		}
	},
	["15_69"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				25735
			},
			{
				"def",
				30
			}
		}
	},
	["15_70"] = {
		need_star = 5,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				25925
			},
			{
				"def",
				30
			}
		}
	},
	["15_71"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"hp_max",
				26155
			},
			{
				"def",
				30
			}
		}
	},
	["15_72"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"hp_max",
				26385
			},
			{
				"def",
				30
			}
		}
	},
	["15_73"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"hp_max",
				26615
			},
			{
				"def",
				30
			}
		}
	},
	["15_74"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"hp_max",
				26845
			},
			{
				"def",
				30
			}
		}
	},
	["15_75"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"hp_max",
				27075
			},
			{
				"def",
				30
			}
		}
	},
	["15_76"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"hp_max",
				27305
			},
			{
				"def",
				30
			}
		}
	},
	["15_77"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"hp_max",
				27535
			},
			{
				"def",
				30
			}
		}
	},
	["15_78"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"hp_max",
				27765
			},
			{
				"def",
				30
			}
		}
	},
	["15_79"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"hp_max",
				27995
			},
			{
				"def",
				30
			}
		}
	},
	["15_80"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 15,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"hp_max",
				33225
			},
			{
				"def",
				40
			}
		}
	},
	["15_81"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"hp_max",
				33455
			},
			{
				"def",
				40
			}
		}
	},
	["15_82"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"hp_max",
				33685
			},
			{
				"def",
				40
			}
		}
	},
	["15_83"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"hp_max",
				33915
			},
			{
				"def",
				40
			}
		}
	},
	["15_84"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"hp_max",
				34145
			},
			{
				"def",
				40
			}
		}
	},
	["15_85"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"hp_max",
				34375
			},
			{
				"def",
				40
			}
		}
	},
	["15_86"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"hp_max",
				34605
			},
			{
				"def",
				40
			}
		}
	},
	["15_87"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"hp_max",
				34835
			},
			{
				"def",
				40
			}
		}
	},
	["15_88"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"hp_max",
				35065
			},
			{
				"def",
				40
			}
		}
	},
	["15_89"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"hp_max",
				35295
			},
			{
				"def",
				40
			}
		}
	},
	["15_90"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"hp_max",
				35525
			},
			{
				"def",
				40
			}
		}
	},
	["15_91"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"hp_max",
				35755
			},
			{
				"def",
				40
			}
		}
	},
	["15_92"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"hp_max",
				35985
			},
			{
				"def",
				40
			}
		}
	},
	["15_93"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"hp_max",
				36215
			},
			{
				"def",
				40
			}
		}
	},
	["15_94"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"hp_max",
				36445
			},
			{
				"def",
				40
			}
		}
	},
	["15_95"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"hp_max",
				36675
			},
			{
				"def",
				40
			}
		}
	},
	["15_96"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"hp_max",
				36905
			},
			{
				"def",
				40
			}
		}
	},
	["15_97"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"hp_max",
				37135
			},
			{
				"def",
				40
			}
		}
	},
	["15_98"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"hp_max",
				37365
			},
			{
				"def",
				40
			}
		}
	},
	["15_99"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"hp_max",
				37595
			},
			{
				"def",
				40
			}
		}
	},
	["15_100"] = {
		need_star = 6,
		name = "响雷果实",
		desc = "",
		id = 15,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"hp_max",
				37825
			},
			{
				"def",
				40
			}
		}
	},
	["16_1"] = {
		need_star = 1,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 1,
		need_items = {
			{
				19016,
				50
			}
		},
		atts = {
			{
				"atk",
				2000
			},
			{
				"speed",
				10
			}
		}
	},
	["16_2"] = {
		need_star = 1,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"atk",
				2025
			},
			{
				"speed",
				10
			}
		}
	},
	["16_3"] = {
		need_star = 1,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"atk",
				2050
			},
			{
				"speed",
				10
			}
		}
	},
	["16_4"] = {
		need_star = 1,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"atk",
				2075
			},
			{
				"speed",
				10
			}
		}
	},
	["16_5"] = {
		need_star = 1,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"atk",
				2100
			},
			{
				"speed",
				10
			}
		}
	},
	["16_6"] = {
		need_star = 1,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"atk",
				2125
			},
			{
				"speed",
				10
			}
		}
	},
	["16_7"] = {
		need_star = 1,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"atk",
				2150
			},
			{
				"speed",
				10
			}
		}
	},
	["16_8"] = {
		need_star = 1,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"atk",
				2175
			},
			{
				"speed",
				10
			}
		}
	},
	["16_9"] = {
		need_star = 1,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"atk",
				2200
			},
			{
				"speed",
				10
			}
		}
	},
	["16_10"] = {
		need_star = 1,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"atk",
				2225
			},
			{
				"speed",
				10
			}
		}
	},
	["16_11"] = {
		need_star = 2,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"atk",
				2252
			},
			{
				"speed",
				10
			}
		}
	},
	["16_12"] = {
		need_star = 2,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"atk",
				2279
			},
			{
				"speed",
				10
			}
		}
	},
	["16_13"] = {
		need_star = 2,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"atk",
				2306
			},
			{
				"speed",
				10
			}
		}
	},
	["16_14"] = {
		need_star = 2,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"atk",
				2333
			},
			{
				"speed",
				10
			}
		}
	},
	["16_15"] = {
		need_star = 2,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"atk",
				2360
			},
			{
				"speed",
				10
			}
		}
	},
	["16_16"] = {
		need_star = 2,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"atk",
				2387
			},
			{
				"speed",
				10
			}
		}
	},
	["16_17"] = {
		need_star = 2,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"atk",
				2414
			},
			{
				"speed",
				10
			}
		}
	},
	["16_18"] = {
		need_star = 2,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"atk",
				2441
			},
			{
				"speed",
				10
			}
		}
	},
	["16_19"] = {
		need_star = 2,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"atk",
				2468
			},
			{
				"speed",
				10
			}
		}
	},
	["16_20"] = {
		need_star = 2,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"atk",
				2495
			},
			{
				"speed",
				10
			}
		}
	},
	["16_21"] = {
		need_star = 3,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"atk",
				2525
			},
			{
				"speed",
				10
			}
		}
	},
	["16_22"] = {
		need_star = 3,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"atk",
				2555
			},
			{
				"speed",
				10
			}
		}
	},
	["16_23"] = {
		need_star = 3,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"atk",
				2585
			},
			{
				"speed",
				10
			}
		}
	},
	["16_24"] = {
		need_star = 3,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"atk",
				2615
			},
			{
				"speed",
				10
			}
		}
	},
	["16_25"] = {
		need_star = 3,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"atk",
				2645
			},
			{
				"speed",
				10
			}
		}
	},
	["16_26"] = {
		need_star = 3,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"atk",
				2675
			},
			{
				"speed",
				10
			}
		}
	},
	["16_27"] = {
		need_star = 3,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"atk",
				2705
			},
			{
				"speed",
				10
			}
		}
	},
	["16_28"] = {
		need_star = 3,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"atk",
				2735
			},
			{
				"speed",
				10
			}
		}
	},
	["16_29"] = {
		need_star = 3,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"atk",
				2765
			},
			{
				"speed",
				10
			}
		}
	},
	["16_30"] = {
		need_star = 3,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"atk",
				2795
			},
			{
				"speed",
				10
			}
		}
	},
	["16_31"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"atk",
				2830
			},
			{
				"speed",
				10
			}
		}
	},
	["16_32"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"atk",
				2865
			},
			{
				"speed",
				10
			}
		}
	},
	["16_33"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"atk",
				2900
			},
			{
				"speed",
				10
			}
		}
	},
	["16_34"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"atk",
				2935
			},
			{
				"speed",
				10
			}
		}
	},
	["16_35"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"atk",
				2970
			},
			{
				"speed",
				10
			}
		}
	},
	["16_36"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"atk",
				3005
			},
			{
				"speed",
				10
			}
		}
	},
	["16_37"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"atk",
				3040
			},
			{
				"speed",
				10
			}
		}
	},
	["16_38"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"atk",
				3075
			},
			{
				"speed",
				10
			}
		}
	},
	["16_39"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"atk",
				3110
			},
			{
				"speed",
				10
			}
		}
	},
	["16_40"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "【Lv.40】恶魔果实基础属性提升20%",
		id = 16,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"atk",
				3545
			},
			{
				"speed",
				12
			}
		}
	},
	["16_41"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"atk",
				3580
			},
			{
				"speed",
				12
			}
		}
	},
	["16_42"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"atk",
				3615
			},
			{
				"speed",
				12
			}
		}
	},
	["16_43"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"atk",
				3650
			},
			{
				"speed",
				12
			}
		}
	},
	["16_44"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"atk",
				3685
			},
			{
				"speed",
				12
			}
		}
	},
	["16_45"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"atk",
				3720
			},
			{
				"speed",
				12
			}
		}
	},
	["16_46"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"atk",
				3755
			},
			{
				"speed",
				12
			}
		}
	},
	["16_47"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"atk",
				3790
			},
			{
				"speed",
				12
			}
		}
	},
	["16_48"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"atk",
				3825
			},
			{
				"speed",
				12
			}
		}
	},
	["16_49"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"atk",
				3860
			},
			{
				"speed",
				12
			}
		}
	},
	["16_50"] = {
		need_star = 4,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"atk",
				3895
			},
			{
				"speed",
				12
			}
		}
	},
	["16_51"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"atk",
				3940
			},
			{
				"speed",
				12
			}
		}
	},
	["16_52"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"atk",
				3985
			},
			{
				"speed",
				12
			}
		}
	},
	["16_53"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"atk",
				4030
			},
			{
				"speed",
				12
			}
		}
	},
	["16_54"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"atk",
				4075
			},
			{
				"speed",
				12
			}
		}
	},
	["16_55"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"atk",
				4120
			},
			{
				"speed",
				12
			}
		}
	},
	["16_56"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"atk",
				4165
			},
			{
				"speed",
				12
			}
		}
	},
	["16_57"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"atk",
				4210
			},
			{
				"speed",
				12
			}
		}
	},
	["16_58"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"atk",
				4255
			},
			{
				"speed",
				12
			}
		}
	},
	["16_59"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"atk",
				4300
			},
			{
				"speed",
				12
			}
		}
	},
	["16_60"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "【Lv.60】恶魔果实基础属性提升30%",
		id = 16,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"atk",
				4945
			},
			{
				"speed",
				15
			}
		}
	},
	["16_61"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"atk",
				4990
			},
			{
				"speed",
				15
			}
		}
	},
	["16_62"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"atk",
				5035
			},
			{
				"speed",
				15
			}
		}
	},
	["16_63"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"atk",
				5080
			},
			{
				"speed",
				15
			}
		}
	},
	["16_64"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"atk",
				5125
			},
			{
				"speed",
				15
			}
		}
	},
	["16_65"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"atk",
				5170
			},
			{
				"speed",
				15
			}
		}
	},
	["16_66"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"atk",
				5215
			},
			{
				"speed",
				15
			}
		}
	},
	["16_67"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"atk",
				5260
			},
			{
				"speed",
				15
			}
		}
	},
	["16_68"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"atk",
				5305
			},
			{
				"speed",
				15
			}
		}
	},
	["16_69"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"atk",
				5350
			},
			{
				"speed",
				15
			}
		}
	},
	["16_70"] = {
		need_star = 5,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"atk",
				5395
			},
			{
				"speed",
				15
			}
		}
	},
	["16_71"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 71,
		need_items = {
			{
				1,
				400000
			},
			{
				19502,
				220
			}
		},
		atts = {
			{
				"atk",
				5455
			},
			{
				"speed",
				15
			}
		}
	},
	["16_72"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 72,
		need_items = {
			{
				1,
				405000
			},
			{
				19502,
				224
			}
		},
		atts = {
			{
				"atk",
				5515
			},
			{
				"speed",
				15
			}
		}
	},
	["16_73"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 73,
		need_items = {
			{
				1,
				410000
			},
			{
				19502,
				228
			}
		},
		atts = {
			{
				"atk",
				5575
			},
			{
				"speed",
				15
			}
		}
	},
	["16_74"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 74,
		need_items = {
			{
				1,
				415000
			},
			{
				19502,
				232
			}
		},
		atts = {
			{
				"atk",
				5635
			},
			{
				"speed",
				15
			}
		}
	},
	["16_75"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 75,
		need_items = {
			{
				1,
				420000
			},
			{
				19502,
				236
			}
		},
		atts = {
			{
				"atk",
				5695
			},
			{
				"speed",
				15
			}
		}
	},
	["16_76"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 76,
		need_items = {
			{
				1,
				425000
			},
			{
				19502,
				240
			}
		},
		atts = {
			{
				"atk",
				5755
			},
			{
				"speed",
				15
			}
		}
	},
	["16_77"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 77,
		need_items = {
			{
				1,
				430000
			},
			{
				19502,
				244
			}
		},
		atts = {
			{
				"atk",
				5815
			},
			{
				"speed",
				15
			}
		}
	},
	["16_78"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 78,
		need_items = {
			{
				1,
				435000
			},
			{
				19502,
				248
			}
		},
		atts = {
			{
				"atk",
				5875
			},
			{
				"speed",
				15
			}
		}
	},
	["16_79"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 79,
		need_items = {
			{
				1,
				440000
			},
			{
				19502,
				252
			}
		},
		atts = {
			{
				"atk",
				5935
			},
			{
				"speed",
				15
			}
		}
	},
	["16_80"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "【Lv.80】恶魔果实基础属性提升50%",
		id = 16,
		level = 80,
		need_items = {
			{
				1,
				445000
			},
			{
				19502,
				256
			}
		},
		atts = {
			{
				"atk",
				6995
			},
			{
				"speed",
				20
			}
		}
	},
	["16_81"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 81,
		need_items = {
			{
				1,
				450000
			},
			{
				19502,
				260
			}
		},
		atts = {
			{
				"atk",
				7055
			},
			{
				"speed",
				20
			}
		}
	},
	["16_82"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 82,
		need_items = {
			{
				1,
				455000
			},
			{
				19502,
				264
			}
		},
		atts = {
			{
				"atk",
				7115
			},
			{
				"speed",
				20
			}
		}
	},
	["16_83"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 83,
		need_items = {
			{
				1,
				460000
			},
			{
				19502,
				268
			}
		},
		atts = {
			{
				"atk",
				7175
			},
			{
				"speed",
				20
			}
		}
	},
	["16_84"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 84,
		need_items = {
			{
				1,
				465000
			},
			{
				19502,
				272
			}
		},
		atts = {
			{
				"atk",
				7235
			},
			{
				"speed",
				20
			}
		}
	},
	["16_85"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 85,
		need_items = {
			{
				1,
				470000
			},
			{
				19502,
				276
			}
		},
		atts = {
			{
				"atk",
				7295
			},
			{
				"speed",
				20
			}
		}
	},
	["16_86"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 86,
		need_items = {
			{
				1,
				475000
			},
			{
				19502,
				280
			}
		},
		atts = {
			{
				"atk",
				7355
			},
			{
				"speed",
				20
			}
		}
	},
	["16_87"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 87,
		need_items = {
			{
				1,
				480000
			},
			{
				19502,
				284
			}
		},
		atts = {
			{
				"atk",
				7415
			},
			{
				"speed",
				20
			}
		}
	},
	["16_88"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 88,
		need_items = {
			{
				1,
				485000
			},
			{
				19502,
				288
			}
		},
		atts = {
			{
				"atk",
				7475
			},
			{
				"speed",
				20
			}
		}
	},
	["16_89"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 89,
		need_items = {
			{
				1,
				490000
			},
			{
				19502,
				292
			}
		},
		atts = {
			{
				"atk",
				7535
			},
			{
				"speed",
				20
			}
		}
	},
	["16_90"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 90,
		need_items = {
			{
				1,
				495000
			},
			{
				19502,
				296
			}
		},
		atts = {
			{
				"atk",
				7595
			},
			{
				"speed",
				20
			}
		}
	},
	["16_91"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 91,
		need_items = {
			{
				1,
				500000
			},
			{
				19502,
				300
			}
		},
		atts = {
			{
				"atk",
				7655
			},
			{
				"speed",
				20
			}
		}
	},
	["16_92"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 92,
		need_items = {
			{
				1,
				505000
			},
			{
				19502,
				304
			}
		},
		atts = {
			{
				"atk",
				7715
			},
			{
				"speed",
				20
			}
		}
	},
	["16_93"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 93,
		need_items = {
			{
				1,
				510000
			},
			{
				19502,
				308
			}
		},
		atts = {
			{
				"atk",
				7775
			},
			{
				"speed",
				20
			}
		}
	},
	["16_94"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 94,
		need_items = {
			{
				1,
				515000
			},
			{
				19502,
				312
			}
		},
		atts = {
			{
				"atk",
				7835
			},
			{
				"speed",
				20
			}
		}
	},
	["16_95"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 95,
		need_items = {
			{
				1,
				520000
			},
			{
				19502,
				316
			}
		},
		atts = {
			{
				"atk",
				7895
			},
			{
				"speed",
				20
			}
		}
	},
	["16_96"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 96,
		need_items = {
			{
				1,
				525000
			},
			{
				19502,
				320
			}
		},
		atts = {
			{
				"atk",
				7955
			},
			{
				"speed",
				20
			}
		}
	},
	["16_97"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 97,
		need_items = {
			{
				1,
				530000
			},
			{
				19502,
				324
			}
		},
		atts = {
			{
				"atk",
				8015
			},
			{
				"speed",
				20
			}
		}
	},
	["16_98"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 98,
		need_items = {
			{
				1,
				535000
			},
			{
				19502,
				328
			}
		},
		atts = {
			{
				"atk",
				8075
			},
			{
				"speed",
				20
			}
		}
	},
	["16_99"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 99,
		need_items = {
			{
				1,
				540000
			},
			{
				19502,
				332
			}
		},
		atts = {
			{
				"atk",
				8135
			},
			{
				"speed",
				20
			}
		}
	},
	["16_100"] = {
		need_star = 6,
		name = "糯糯果实",
		desc = "",
		id = 16,
		level = 100,
		need_items = {
			{
				1,
				545000
			},
			{
				19502,
				336
			}
		},
		atts = {
			{
				"atk",
				8195
			},
			{
				"speed",
				20
			}
		}
	},
	["101_1"] = {
		need_star = 1,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 1,
		need_items = {
			{
				19101,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6000
			},
			{
				"def",
				15
			}
		}
	},
	["101_2"] = {
		need_star = 1,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6125
			},
			{
				"def",
				15
			}
		}
	},
	["101_3"] = {
		need_star = 1,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				6250
			},
			{
				"def",
				15
			}
		}
	},
	["101_4"] = {
		need_star = 1,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				6375
			},
			{
				"def",
				15
			}
		}
	},
	["101_5"] = {
		need_star = 1,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"def",
				15
			}
		}
	},
	["101_6"] = {
		need_star = 1,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				6625
			},
			{
				"def",
				15
			}
		}
	},
	["101_7"] = {
		need_star = 1,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				6750
			},
			{
				"def",
				15
			}
		}
	},
	["101_8"] = {
		need_star = 1,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				6875
			},
			{
				"def",
				15
			}
		}
	},
	["101_9"] = {
		need_star = 1,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				7000
			},
			{
				"def",
				15
			}
		}
	},
	["101_10"] = {
		need_star = 1,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				7125
			},
			{
				"def",
				15
			}
		}
	},
	["101_11"] = {
		need_star = 2,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				7260
			},
			{
				"def",
				15
			}
		}
	},
	["101_12"] = {
		need_star = 2,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				7395
			},
			{
				"def",
				15
			}
		}
	},
	["101_13"] = {
		need_star = 2,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				7530
			},
			{
				"def",
				15
			}
		}
	},
	["101_14"] = {
		need_star = 2,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				7665
			},
			{
				"def",
				15
			}
		}
	},
	["101_15"] = {
		need_star = 2,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				7800
			},
			{
				"def",
				15
			}
		}
	},
	["101_16"] = {
		need_star = 2,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				7935
			},
			{
				"def",
				15
			}
		}
	},
	["101_17"] = {
		need_star = 2,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				8070
			},
			{
				"def",
				15
			}
		}
	},
	["101_18"] = {
		need_star = 2,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				8205
			},
			{
				"def",
				15
			}
		}
	},
	["101_19"] = {
		need_star = 2,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				8340
			},
			{
				"def",
				15
			}
		}
	},
	["101_20"] = {
		need_star = 2,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				8475
			},
			{
				"def",
				15
			}
		}
	},
	["101_21"] = {
		need_star = 3,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				8620
			},
			{
				"def",
				15
			}
		}
	},
	["101_22"] = {
		need_star = 3,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				8765
			},
			{
				"def",
				15
			}
		}
	},
	["101_23"] = {
		need_star = 3,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				8910
			},
			{
				"def",
				15
			}
		}
	},
	["101_24"] = {
		need_star = 3,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				9055
			},
			{
				"def",
				15
			}
		}
	},
	["101_25"] = {
		need_star = 3,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				9200
			},
			{
				"def",
				15
			}
		}
	},
	["101_26"] = {
		need_star = 3,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				9345
			},
			{
				"def",
				15
			}
		}
	},
	["101_27"] = {
		need_star = 3,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				9490
			},
			{
				"def",
				15
			}
		}
	},
	["101_28"] = {
		need_star = 3,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				9635
			},
			{
				"def",
				15
			}
		}
	},
	["101_29"] = {
		need_star = 3,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				9780
			},
			{
				"def",
				15
			}
		}
	},
	["101_30"] = {
		need_star = 3,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				9925
			},
			{
				"def",
				15
			}
		}
	},
	["101_31"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				10085
			},
			{
				"def",
				15
			}
		}
	},
	["101_32"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				10245
			},
			{
				"def",
				15
			}
		}
	},
	["101_33"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				10405
			},
			{
				"def",
				15
			}
		}
	},
	["101_34"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				10565
			},
			{
				"def",
				15
			}
		}
	},
	["101_35"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				10725
			},
			{
				"def",
				15
			}
		}
	},
	["101_36"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				10885
			},
			{
				"def",
				15
			}
		}
	},
	["101_37"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				11045
			},
			{
				"def",
				15
			}
		}
	},
	["101_38"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				11205
			},
			{
				"def",
				15
			}
		}
	},
	["101_39"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				11365
			},
			{
				"def",
				15
			}
		}
	},
	["101_40"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "【lv.40】恶魔果实基础属性提升20%",
		id = 101,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				12725
			},
			{
				"def",
				18
			}
		}
	},
	["101_41"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				12885
			},
			{
				"def",
				18
			}
		}
	},
	["101_42"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				13045
			},
			{
				"def",
				18
			}
		}
	},
	["101_43"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				13205
			},
			{
				"def",
				18
			}
		}
	},
	["101_44"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				13365
			},
			{
				"def",
				18
			}
		}
	},
	["101_45"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				13525
			},
			{
				"def",
				18
			}
		}
	},
	["101_46"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				13685
			},
			{
				"def",
				18
			}
		}
	},
	["101_47"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				13845
			},
			{
				"def",
				18
			}
		}
	},
	["101_48"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				14005
			},
			{
				"def",
				18
			}
		}
	},
	["101_49"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				14165
			},
			{
				"def",
				18
			}
		}
	},
	["101_50"] = {
		need_star = 4,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				14325
			},
			{
				"def",
				18
			}
		}
	},
	["101_51"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				14515
			},
			{
				"def",
				18
			}
		}
	},
	["101_52"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				14705
			},
			{
				"def",
				18
			}
		}
	},
	["101_53"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				14895
			},
			{
				"def",
				18
			}
		}
	},
	["101_54"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				15085
			},
			{
				"def",
				18
			}
		}
	},
	["101_55"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				15275
			},
			{
				"def",
				18
			}
		}
	},
	["101_56"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				15465
			},
			{
				"def",
				18
			}
		}
	},
	["101_57"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				15655
			},
			{
				"def",
				18
			}
		}
	},
	["101_58"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				15845
			},
			{
				"def",
				18
			}
		}
	},
	["101_59"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				16035
			},
			{
				"def",
				18
			}
		}
	},
	["101_60"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "【lv.60】恶魔果实基础属性提升30%",
		id = 101,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				18025
			},
			{
				"def",
				23
			}
		}
	},
	["101_61"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				18215
			},
			{
				"def",
				23
			}
		}
	},
	["101_62"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				18405
			},
			{
				"def",
				23
			}
		}
	},
	["101_63"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				18595
			},
			{
				"def",
				23
			}
		}
	},
	["101_64"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				18785
			},
			{
				"def",
				23
			}
		}
	},
	["101_65"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				18975
			},
			{
				"def",
				23
			}
		}
	},
	["101_66"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				19165
			},
			{
				"def",
				23
			}
		}
	},
	["101_67"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				19355
			},
			{
				"def",
				23
			}
		}
	},
	["101_68"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				19545
			},
			{
				"def",
				23
			}
		}
	},
	["101_69"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				19735
			},
			{
				"def",
				23
			}
		}
	},
	["101_70"] = {
		need_star = 5,
		name = "磁磁果实",
		desc = "",
		id = 101,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				19925
			},
			{
				"def",
				23
			}
		}
	},
	["102_1"] = {
		need_star = 1,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 1,
		need_items = {
			{
				19102,
				30
			}
		},
		atts = {
			{
				"atk",
				1200
			},
			{
				"speed",
				7
			}
		}
	},
	["102_2"] = {
		need_star = 1,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"atk",
				1225
			},
			{
				"speed",
				7
			}
		}
	},
	["102_3"] = {
		need_star = 1,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"atk",
				1250
			},
			{
				"speed",
				7
			}
		}
	},
	["102_4"] = {
		need_star = 1,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"atk",
				1275
			},
			{
				"speed",
				7
			}
		}
	},
	["102_5"] = {
		need_star = 1,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"atk",
				1300
			},
			{
				"speed",
				7
			}
		}
	},
	["102_6"] = {
		need_star = 1,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"atk",
				1325
			},
			{
				"speed",
				7
			}
		}
	},
	["102_7"] = {
		need_star = 1,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"atk",
				1350
			},
			{
				"speed",
				7
			}
		}
	},
	["102_8"] = {
		need_star = 1,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"atk",
				1375
			},
			{
				"speed",
				7
			}
		}
	},
	["102_9"] = {
		need_star = 1,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"atk",
				1400
			},
			{
				"speed",
				7
			}
		}
	},
	["102_10"] = {
		need_star = 1,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"atk",
				1425
			},
			{
				"speed",
				7
			}
		}
	},
	["102_11"] = {
		need_star = 2,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"atk",
				1452
			},
			{
				"speed",
				7
			}
		}
	},
	["102_12"] = {
		need_star = 2,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"atk",
				1479
			},
			{
				"speed",
				7
			}
		}
	},
	["102_13"] = {
		need_star = 2,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"atk",
				1506
			},
			{
				"speed",
				7
			}
		}
	},
	["102_14"] = {
		need_star = 2,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"atk",
				1533
			},
			{
				"speed",
				7
			}
		}
	},
	["102_15"] = {
		need_star = 2,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"atk",
				1560
			},
			{
				"speed",
				7
			}
		}
	},
	["102_16"] = {
		need_star = 2,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"atk",
				1587
			},
			{
				"speed",
				7
			}
		}
	},
	["102_17"] = {
		need_star = 2,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"atk",
				1614
			},
			{
				"speed",
				7
			}
		}
	},
	["102_18"] = {
		need_star = 2,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"atk",
				1641
			},
			{
				"speed",
				7
			}
		}
	},
	["102_19"] = {
		need_star = 2,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"atk",
				1668
			},
			{
				"speed",
				7
			}
		}
	},
	["102_20"] = {
		need_star = 2,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"atk",
				1695
			},
			{
				"speed",
				7
			}
		}
	},
	["102_21"] = {
		need_star = 3,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"atk",
				1725
			},
			{
				"speed",
				7
			}
		}
	},
	["102_22"] = {
		need_star = 3,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"atk",
				1755
			},
			{
				"speed",
				7
			}
		}
	},
	["102_23"] = {
		need_star = 3,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"atk",
				1785
			},
			{
				"speed",
				7
			}
		}
	},
	["102_24"] = {
		need_star = 3,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"atk",
				1815
			},
			{
				"speed",
				7
			}
		}
	},
	["102_25"] = {
		need_star = 3,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"atk",
				1845
			},
			{
				"speed",
				7
			}
		}
	},
	["102_26"] = {
		need_star = 3,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"atk",
				1875
			},
			{
				"speed",
				7
			}
		}
	},
	["102_27"] = {
		need_star = 3,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"atk",
				1905
			},
			{
				"speed",
				7
			}
		}
	},
	["102_28"] = {
		need_star = 3,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"atk",
				1935
			},
			{
				"speed",
				7
			}
		}
	},
	["102_29"] = {
		need_star = 3,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"atk",
				1965
			},
			{
				"speed",
				7
			}
		}
	},
	["102_30"] = {
		need_star = 3,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"atk",
				1995
			},
			{
				"speed",
				7
			}
		}
	},
	["102_31"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"atk",
				2030
			},
			{
				"speed",
				7
			}
		}
	},
	["102_32"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"atk",
				2065
			},
			{
				"speed",
				7
			}
		}
	},
	["102_33"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"atk",
				2100
			},
			{
				"speed",
				7
			}
		}
	},
	["102_34"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"atk",
				2135
			},
			{
				"speed",
				7
			}
		}
	},
	["102_35"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"atk",
				2170
			},
			{
				"speed",
				7
			}
		}
	},
	["102_36"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"atk",
				2205
			},
			{
				"speed",
				7
			}
		}
	},
	["102_37"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"atk",
				2240
			},
			{
				"speed",
				7
			}
		}
	},
	["102_38"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"atk",
				2275
			},
			{
				"speed",
				7
			}
		}
	},
	["102_39"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"atk",
				2310
			},
			{
				"speed",
				7
			}
		}
	},
	["102_40"] = {
		need_star = 4,
		name = "花花果实",
		desc = "【lv.40】恶魔果实基础属性提升20%",
		id = 102,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"atk",
				2585
			},
			{
				"speed",
				8
			}
		}
	},
	["102_41"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"atk",
				2620
			},
			{
				"speed",
				8
			}
		}
	},
	["102_42"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"atk",
				2655
			},
			{
				"speed",
				8
			}
		}
	},
	["102_43"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"atk",
				2690
			},
			{
				"speed",
				8
			}
		}
	},
	["102_44"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"atk",
				2725
			},
			{
				"speed",
				8
			}
		}
	},
	["102_45"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"atk",
				2760
			},
			{
				"speed",
				8
			}
		}
	},
	["102_46"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"atk",
				2795
			},
			{
				"speed",
				8
			}
		}
	},
	["102_47"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"atk",
				2830
			},
			{
				"speed",
				8
			}
		}
	},
	["102_48"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"atk",
				2865
			},
			{
				"speed",
				8
			}
		}
	},
	["102_49"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"atk",
				2900
			},
			{
				"speed",
				8
			}
		}
	},
	["102_50"] = {
		need_star = 4,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"atk",
				2935
			},
			{
				"speed",
				8
			}
		}
	},
	["102_51"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"atk",
				2980
			},
			{
				"speed",
				8
			}
		}
	},
	["102_52"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"atk",
				3025
			},
			{
				"speed",
				8
			}
		}
	},
	["102_53"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"atk",
				3070
			},
			{
				"speed",
				8
			}
		}
	},
	["102_54"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"atk",
				3115
			},
			{
				"speed",
				8
			}
		}
	},
	["102_55"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"atk",
				3160
			},
			{
				"speed",
				8
			}
		}
	},
	["102_56"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"atk",
				3205
			},
			{
				"speed",
				8
			}
		}
	},
	["102_57"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"atk",
				3250
			},
			{
				"speed",
				8
			}
		}
	},
	["102_58"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"atk",
				3295
			},
			{
				"speed",
				8
			}
		}
	},
	["102_59"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"atk",
				3340
			},
			{
				"speed",
				8
			}
		}
	},
	["102_60"] = {
		need_star = 5,
		name = "花花果实",
		desc = "【lv.60】恶魔果实基础属性提升30%",
		id = 102,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"atk",
				3745
			},
			{
				"speed",
				10
			}
		}
	},
	["102_61"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"atk",
				3790
			},
			{
				"speed",
				10
			}
		}
	},
	["102_62"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"atk",
				3835
			},
			{
				"speed",
				10
			}
		}
	},
	["102_63"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"atk",
				3880
			},
			{
				"speed",
				10
			}
		}
	},
	["102_64"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"atk",
				3925
			},
			{
				"speed",
				10
			}
		}
	},
	["102_65"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"atk",
				3970
			},
			{
				"speed",
				10
			}
		}
	},
	["102_66"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"atk",
				4015
			},
			{
				"speed",
				10
			}
		}
	},
	["102_67"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"atk",
				4060
			},
			{
				"speed",
				10
			}
		}
	},
	["102_68"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"atk",
				4105
			},
			{
				"speed",
				10
			}
		}
	},
	["102_69"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"atk",
				4150
			},
			{
				"speed",
				10
			}
		}
	},
	["102_70"] = {
		need_star = 5,
		name = "花花果实",
		desc = "",
		id = 102,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"atk",
				4195
			},
			{
				"speed",
				10
			}
		}
	},
	["103_1"] = {
		need_star = 1,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 1,
		need_items = {
			{
				19103,
				30
			}
		},
		atts = {
			{
				"atk",
				1200
			},
			{
				"def",
				15
			}
		}
	},
	["103_2"] = {
		need_star = 1,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"atk",
				1225
			},
			{
				"def",
				15
			}
		}
	},
	["103_3"] = {
		need_star = 1,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"atk",
				1250
			},
			{
				"def",
				15
			}
		}
	},
	["103_4"] = {
		need_star = 1,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"atk",
				1275
			},
			{
				"def",
				15
			}
		}
	},
	["103_5"] = {
		need_star = 1,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"atk",
				1300
			},
			{
				"def",
				15
			}
		}
	},
	["103_6"] = {
		need_star = 1,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"atk",
				1325
			},
			{
				"def",
				15
			}
		}
	},
	["103_7"] = {
		need_star = 1,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"atk",
				1350
			},
			{
				"def",
				15
			}
		}
	},
	["103_8"] = {
		need_star = 1,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"atk",
				1375
			},
			{
				"def",
				15
			}
		}
	},
	["103_9"] = {
		need_star = 1,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"atk",
				1400
			},
			{
				"def",
				15
			}
		}
	},
	["103_10"] = {
		need_star = 1,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"atk",
				1425
			},
			{
				"def",
				15
			}
		}
	},
	["103_11"] = {
		need_star = 2,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"atk",
				1452
			},
			{
				"def",
				15
			}
		}
	},
	["103_12"] = {
		need_star = 2,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"atk",
				1479
			},
			{
				"def",
				15
			}
		}
	},
	["103_13"] = {
		need_star = 2,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"atk",
				1506
			},
			{
				"def",
				15
			}
		}
	},
	["103_14"] = {
		need_star = 2,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"atk",
				1533
			},
			{
				"def",
				15
			}
		}
	},
	["103_15"] = {
		need_star = 2,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"atk",
				1560
			},
			{
				"def",
				15
			}
		}
	},
	["103_16"] = {
		need_star = 2,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"atk",
				1587
			},
			{
				"def",
				15
			}
		}
	},
	["103_17"] = {
		need_star = 2,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"atk",
				1614
			},
			{
				"def",
				15
			}
		}
	},
	["103_18"] = {
		need_star = 2,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"atk",
				1641
			},
			{
				"def",
				15
			}
		}
	},
	["103_19"] = {
		need_star = 2,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"atk",
				1668
			},
			{
				"def",
				15
			}
		}
	},
	["103_20"] = {
		need_star = 2,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"atk",
				1695
			},
			{
				"def",
				15
			}
		}
	},
	["103_21"] = {
		need_star = 3,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"atk",
				1725
			},
			{
				"def",
				15
			}
		}
	},
	["103_22"] = {
		need_star = 3,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"atk",
				1755
			},
			{
				"def",
				15
			}
		}
	},
	["103_23"] = {
		need_star = 3,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"atk",
				1785
			},
			{
				"def",
				15
			}
		}
	},
	["103_24"] = {
		need_star = 3,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"atk",
				1815
			},
			{
				"def",
				15
			}
		}
	},
	["103_25"] = {
		need_star = 3,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"atk",
				1845
			},
			{
				"def",
				15
			}
		}
	},
	["103_26"] = {
		need_star = 3,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"atk",
				1875
			},
			{
				"def",
				15
			}
		}
	},
	["103_27"] = {
		need_star = 3,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"atk",
				1905
			},
			{
				"def",
				15
			}
		}
	},
	["103_28"] = {
		need_star = 3,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"atk",
				1935
			},
			{
				"def",
				15
			}
		}
	},
	["103_29"] = {
		need_star = 3,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"atk",
				1965
			},
			{
				"def",
				15
			}
		}
	},
	["103_30"] = {
		need_star = 3,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"atk",
				1995
			},
			{
				"def",
				15
			}
		}
	},
	["103_31"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"atk",
				2030
			},
			{
				"def",
				15
			}
		}
	},
	["103_32"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"atk",
				2065
			},
			{
				"def",
				15
			}
		}
	},
	["103_33"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"atk",
				2100
			},
			{
				"def",
				15
			}
		}
	},
	["103_34"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"atk",
				2135
			},
			{
				"def",
				15
			}
		}
	},
	["103_35"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"atk",
				2170
			},
			{
				"def",
				15
			}
		}
	},
	["103_36"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"atk",
				2205
			},
			{
				"def",
				15
			}
		}
	},
	["103_37"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"atk",
				2240
			},
			{
				"def",
				15
			}
		}
	},
	["103_38"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"atk",
				2275
			},
			{
				"def",
				15
			}
		}
	},
	["103_39"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"atk",
				2310
			},
			{
				"def",
				15
			}
		}
	},
	["103_40"] = {
		need_star = 4,
		name = "人人果实",
		desc = "【lv.40】恶魔果实基础属性提升20%",
		id = 103,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"atk",
				2585
			},
			{
				"def",
				18
			}
		}
	},
	["103_41"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"atk",
				2620
			},
			{
				"def",
				18
			}
		}
	},
	["103_42"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"atk",
				2655
			},
			{
				"def",
				18
			}
		}
	},
	["103_43"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"atk",
				2690
			},
			{
				"def",
				18
			}
		}
	},
	["103_44"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"atk",
				2725
			},
			{
				"def",
				18
			}
		}
	},
	["103_45"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"atk",
				2760
			},
			{
				"def",
				18
			}
		}
	},
	["103_46"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"atk",
				2795
			},
			{
				"def",
				18
			}
		}
	},
	["103_47"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"atk",
				2830
			},
			{
				"def",
				18
			}
		}
	},
	["103_48"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"atk",
				2865
			},
			{
				"def",
				18
			}
		}
	},
	["103_49"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"atk",
				2900
			},
			{
				"def",
				18
			}
		}
	},
	["103_50"] = {
		need_star = 4,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"atk",
				2935
			},
			{
				"def",
				18
			}
		}
	},
	["103_51"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"atk",
				2980
			},
			{
				"def",
				18
			}
		}
	},
	["103_52"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"atk",
				3025
			},
			{
				"def",
				18
			}
		}
	},
	["103_53"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"atk",
				3070
			},
			{
				"def",
				18
			}
		}
	},
	["103_54"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"atk",
				3115
			},
			{
				"def",
				18
			}
		}
	},
	["103_55"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"atk",
				3160
			},
			{
				"def",
				18
			}
		}
	},
	["103_56"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"atk",
				3205
			},
			{
				"def",
				18
			}
		}
	},
	["103_57"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"atk",
				3250
			},
			{
				"def",
				18
			}
		}
	},
	["103_58"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"atk",
				3295
			},
			{
				"def",
				18
			}
		}
	},
	["103_59"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"atk",
				3340
			},
			{
				"def",
				18
			}
		}
	},
	["103_60"] = {
		need_star = 5,
		name = "人人果实",
		desc = "【lv.60】恶魔果实基础属性提升30%",
		id = 103,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"atk",
				3745
			},
			{
				"def",
				23
			}
		}
	},
	["103_61"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"atk",
				3790
			},
			{
				"def",
				23
			}
		}
	},
	["103_62"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"atk",
				3835
			},
			{
				"def",
				23
			}
		}
	},
	["103_63"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"atk",
				3880
			},
			{
				"def",
				23
			}
		}
	},
	["103_64"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"atk",
				3925
			},
			{
				"def",
				23
			}
		}
	},
	["103_65"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"atk",
				3970
			},
			{
				"def",
				23
			}
		}
	},
	["103_66"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"atk",
				4015
			},
			{
				"def",
				23
			}
		}
	},
	["103_67"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"atk",
				4060
			},
			{
				"def",
				23
			}
		}
	},
	["103_68"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"atk",
				4105
			},
			{
				"def",
				23
			}
		}
	},
	["103_69"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"atk",
				4150
			},
			{
				"def",
				23
			}
		}
	},
	["103_70"] = {
		need_star = 5,
		name = "人人果实",
		desc = "",
		id = 103,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"atk",
				4195
			},
			{
				"def",
				23
			}
		}
	},
	["104_1"] = {
		need_star = 1,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 1,
		need_items = {
			{
				19104,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6000
			},
			{
				"speed",
				7
			}
		}
	},
	["104_2"] = {
		need_star = 1,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6125
			},
			{
				"speed",
				7
			}
		}
	},
	["104_3"] = {
		need_star = 1,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				6250
			},
			{
				"speed",
				7
			}
		}
	},
	["104_4"] = {
		need_star = 1,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				6375
			},
			{
				"speed",
				7
			}
		}
	},
	["104_5"] = {
		need_star = 1,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"speed",
				7
			}
		}
	},
	["104_6"] = {
		need_star = 1,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				6625
			},
			{
				"speed",
				7
			}
		}
	},
	["104_7"] = {
		need_star = 1,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				6750
			},
			{
				"speed",
				7
			}
		}
	},
	["104_8"] = {
		need_star = 1,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				6875
			},
			{
				"speed",
				7
			}
		}
	},
	["104_9"] = {
		need_star = 1,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				7000
			},
			{
				"speed",
				7
			}
		}
	},
	["104_10"] = {
		need_star = 1,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				7125
			},
			{
				"speed",
				7
			}
		}
	},
	["104_11"] = {
		need_star = 2,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				7260
			},
			{
				"speed",
				7
			}
		}
	},
	["104_12"] = {
		need_star = 2,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				7395
			},
			{
				"speed",
				7
			}
		}
	},
	["104_13"] = {
		need_star = 2,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				7530
			},
			{
				"speed",
				7
			}
		}
	},
	["104_14"] = {
		need_star = 2,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				7665
			},
			{
				"speed",
				7
			}
		}
	},
	["104_15"] = {
		need_star = 2,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				7800
			},
			{
				"speed",
				7
			}
		}
	},
	["104_16"] = {
		need_star = 2,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				7935
			},
			{
				"speed",
				7
			}
		}
	},
	["104_17"] = {
		need_star = 2,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				8070
			},
			{
				"speed",
				7
			}
		}
	},
	["104_18"] = {
		need_star = 2,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				8205
			},
			{
				"speed",
				7
			}
		}
	},
	["104_19"] = {
		need_star = 2,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				8340
			},
			{
				"speed",
				7
			}
		}
	},
	["104_20"] = {
		need_star = 2,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				8475
			},
			{
				"speed",
				7
			}
		}
	},
	["104_21"] = {
		need_star = 3,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				8620
			},
			{
				"speed",
				7
			}
		}
	},
	["104_22"] = {
		need_star = 3,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				8765
			},
			{
				"speed",
				7
			}
		}
	},
	["104_23"] = {
		need_star = 3,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				8910
			},
			{
				"speed",
				7
			}
		}
	},
	["104_24"] = {
		need_star = 3,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				9055
			},
			{
				"speed",
				7
			}
		}
	},
	["104_25"] = {
		need_star = 3,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				9200
			},
			{
				"speed",
				7
			}
		}
	},
	["104_26"] = {
		need_star = 3,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				9345
			},
			{
				"speed",
				7
			}
		}
	},
	["104_27"] = {
		need_star = 3,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				9490
			},
			{
				"speed",
				7
			}
		}
	},
	["104_28"] = {
		need_star = 3,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				9635
			},
			{
				"speed",
				7
			}
		}
	},
	["104_29"] = {
		need_star = 3,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				9780
			},
			{
				"speed",
				7
			}
		}
	},
	["104_30"] = {
		need_star = 3,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				9925
			},
			{
				"speed",
				7
			}
		}
	},
	["104_31"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				10085
			},
			{
				"speed",
				7
			}
		}
	},
	["104_32"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				10245
			},
			{
				"speed",
				7
			}
		}
	},
	["104_33"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				10405
			},
			{
				"speed",
				7
			}
		}
	},
	["104_34"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				10565
			},
			{
				"speed",
				7
			}
		}
	},
	["104_35"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				10725
			},
			{
				"speed",
				7
			}
		}
	},
	["104_36"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				10885
			},
			{
				"speed",
				7
			}
		}
	},
	["104_37"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				11045
			},
			{
				"speed",
				7
			}
		}
	},
	["104_38"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				11205
			},
			{
				"speed",
				7
			}
		}
	},
	["104_39"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				11365
			},
			{
				"speed",
				7
			}
		}
	},
	["104_40"] = {
		need_star = 4,
		name = "影影果实",
		desc = "【lv.40】恶魔果实基础属性提升20%",
		id = 104,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				12725
			},
			{
				"speed",
				8
			}
		}
	},
	["104_41"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				12885
			},
			{
				"speed",
				8
			}
		}
	},
	["104_42"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				13045
			},
			{
				"speed",
				8
			}
		}
	},
	["104_43"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				13205
			},
			{
				"speed",
				8
			}
		}
	},
	["104_44"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				13365
			},
			{
				"speed",
				8
			}
		}
	},
	["104_45"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				13525
			},
			{
				"speed",
				8
			}
		}
	},
	["104_46"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				13685
			},
			{
				"speed",
				8
			}
		}
	},
	["104_47"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				13845
			},
			{
				"speed",
				8
			}
		}
	},
	["104_48"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				14005
			},
			{
				"speed",
				8
			}
		}
	},
	["104_49"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				14165
			},
			{
				"speed",
				8
			}
		}
	},
	["104_50"] = {
		need_star = 4,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				14325
			},
			{
				"speed",
				8
			}
		}
	},
	["104_51"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				14515
			},
			{
				"speed",
				8
			}
		}
	},
	["104_52"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				14705
			},
			{
				"speed",
				8
			}
		}
	},
	["104_53"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				14895
			},
			{
				"speed",
				8
			}
		}
	},
	["104_54"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				15085
			},
			{
				"speed",
				8
			}
		}
	},
	["104_55"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				15275
			},
			{
				"speed",
				8
			}
		}
	},
	["104_56"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				15465
			},
			{
				"speed",
				8
			}
		}
	},
	["104_57"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				15655
			},
			{
				"speed",
				8
			}
		}
	},
	["104_58"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				15845
			},
			{
				"speed",
				8
			}
		}
	},
	["104_59"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				16035
			},
			{
				"speed",
				8
			}
		}
	},
	["104_60"] = {
		need_star = 5,
		name = "影影果实",
		desc = "【lv.60】恶魔果实基础属性提升30%",
		id = 104,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				18025
			},
			{
				"speed",
				10
			}
		}
	},
	["104_61"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				18215
			},
			{
				"speed",
				10
			}
		}
	},
	["104_62"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				18405
			},
			{
				"speed",
				10
			}
		}
	},
	["104_63"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				18595
			},
			{
				"speed",
				10
			}
		}
	},
	["104_64"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				18785
			},
			{
				"speed",
				10
			}
		}
	},
	["104_65"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				18975
			},
			{
				"speed",
				10
			}
		}
	},
	["104_66"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				19165
			},
			{
				"speed",
				10
			}
		}
	},
	["104_67"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				19355
			},
			{
				"speed",
				10
			}
		}
	},
	["104_68"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				19545
			},
			{
				"speed",
				10
			}
		}
	},
	["104_69"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				19735
			},
			{
				"speed",
				10
			}
		}
	},
	["104_70"] = {
		need_star = 5,
		name = "影影果实",
		desc = "",
		id = 104,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				19925
			},
			{
				"speed",
				10
			}
		}
	},
	["105_1"] = {
		need_star = 1,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 1,
		need_items = {
			{
				19105,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6000
			},
			{
				"def",
				15
			}
		}
	},
	["105_2"] = {
		need_star = 1,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6125
			},
			{
				"def",
				15
			}
		}
	},
	["105_3"] = {
		need_star = 1,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				6250
			},
			{
				"def",
				15
			}
		}
	},
	["105_4"] = {
		need_star = 1,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				6375
			},
			{
				"def",
				15
			}
		}
	},
	["105_5"] = {
		need_star = 1,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"def",
				15
			}
		}
	},
	["105_6"] = {
		need_star = 1,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				6625
			},
			{
				"def",
				15
			}
		}
	},
	["105_7"] = {
		need_star = 1,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				6750
			},
			{
				"def",
				15
			}
		}
	},
	["105_8"] = {
		need_star = 1,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				6875
			},
			{
				"def",
				15
			}
		}
	},
	["105_9"] = {
		need_star = 1,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				7000
			},
			{
				"def",
				15
			}
		}
	},
	["105_10"] = {
		need_star = 1,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				7125
			},
			{
				"def",
				15
			}
		}
	},
	["105_11"] = {
		need_star = 2,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				7260
			},
			{
				"def",
				15
			}
		}
	},
	["105_12"] = {
		need_star = 2,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				7395
			},
			{
				"def",
				15
			}
		}
	},
	["105_13"] = {
		need_star = 2,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				7530
			},
			{
				"def",
				15
			}
		}
	},
	["105_14"] = {
		need_star = 2,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				7665
			},
			{
				"def",
				15
			}
		}
	},
	["105_15"] = {
		need_star = 2,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				7800
			},
			{
				"def",
				15
			}
		}
	},
	["105_16"] = {
		need_star = 2,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				7935
			},
			{
				"def",
				15
			}
		}
	},
	["105_17"] = {
		need_star = 2,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				8070
			},
			{
				"def",
				15
			}
		}
	},
	["105_18"] = {
		need_star = 2,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				8205
			},
			{
				"def",
				15
			}
		}
	},
	["105_19"] = {
		need_star = 2,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				8340
			},
			{
				"def",
				15
			}
		}
	},
	["105_20"] = {
		need_star = 2,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				8475
			},
			{
				"def",
				15
			}
		}
	},
	["105_21"] = {
		need_star = 3,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				8620
			},
			{
				"def",
				15
			}
		}
	},
	["105_22"] = {
		need_star = 3,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				8765
			},
			{
				"def",
				15
			}
		}
	},
	["105_23"] = {
		need_star = 3,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				8910
			},
			{
				"def",
				15
			}
		}
	},
	["105_24"] = {
		need_star = 3,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				9055
			},
			{
				"def",
				15
			}
		}
	},
	["105_25"] = {
		need_star = 3,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				9200
			},
			{
				"def",
				15
			}
		}
	},
	["105_26"] = {
		need_star = 3,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				9345
			},
			{
				"def",
				15
			}
		}
	},
	["105_27"] = {
		need_star = 3,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				9490
			},
			{
				"def",
				15
			}
		}
	},
	["105_28"] = {
		need_star = 3,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				9635
			},
			{
				"def",
				15
			}
		}
	},
	["105_29"] = {
		need_star = 3,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				9780
			},
			{
				"def",
				15
			}
		}
	},
	["105_30"] = {
		need_star = 3,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				9925
			},
			{
				"def",
				15
			}
		}
	},
	["105_31"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				10085
			},
			{
				"def",
				15
			}
		}
	},
	["105_32"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				10245
			},
			{
				"def",
				15
			}
		}
	},
	["105_33"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				10405
			},
			{
				"def",
				15
			}
		}
	},
	["105_34"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				10565
			},
			{
				"def",
				15
			}
		}
	},
	["105_35"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				10725
			},
			{
				"def",
				15
			}
		}
	},
	["105_36"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				10885
			},
			{
				"def",
				15
			}
		}
	},
	["105_37"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				11045
			},
			{
				"def",
				15
			}
		}
	},
	["105_38"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				11205
			},
			{
				"def",
				15
			}
		}
	},
	["105_39"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				11365
			},
			{
				"def",
				15
			}
		}
	},
	["105_40"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "【lv.40】恶魔果实基础属性提升20%",
		id = 105,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				12725
			},
			{
				"def",
				18
			}
		}
	},
	["105_41"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				12885
			},
			{
				"def",
				18
			}
		}
	},
	["105_42"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				13045
			},
			{
				"def",
				18
			}
		}
	},
	["105_43"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				13205
			},
			{
				"def",
				18
			}
		}
	},
	["105_44"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				13365
			},
			{
				"def",
				18
			}
		}
	},
	["105_45"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				13525
			},
			{
				"def",
				18
			}
		}
	},
	["105_46"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				13685
			},
			{
				"def",
				18
			}
		}
	},
	["105_47"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				13845
			},
			{
				"def",
				18
			}
		}
	},
	["105_48"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				14005
			},
			{
				"def",
				18
			}
		}
	},
	["105_49"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				14165
			},
			{
				"def",
				18
			}
		}
	},
	["105_50"] = {
		need_star = 4,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				14325
			},
			{
				"def",
				18
			}
		}
	},
	["105_51"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				14515
			},
			{
				"def",
				18
			}
		}
	},
	["105_52"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				14705
			},
			{
				"def",
				18
			}
		}
	},
	["105_53"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				14895
			},
			{
				"def",
				18
			}
		}
	},
	["105_54"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				15085
			},
			{
				"def",
				18
			}
		}
	},
	["105_55"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				15275
			},
			{
				"def",
				18
			}
		}
	},
	["105_56"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				15465
			},
			{
				"def",
				18
			}
		}
	},
	["105_57"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				15655
			},
			{
				"def",
				18
			}
		}
	},
	["105_58"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				15845
			},
			{
				"def",
				18
			}
		}
	},
	["105_59"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				16035
			},
			{
				"def",
				18
			}
		}
	},
	["105_60"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "【lv.60】恶魔果实基础属性提升30%",
		id = 105,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				18025
			},
			{
				"def",
				23
			}
		}
	},
	["105_61"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				18215
			},
			{
				"def",
				23
			}
		}
	},
	["105_62"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				18405
			},
			{
				"def",
				23
			}
		}
	},
	["105_63"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				18595
			},
			{
				"def",
				23
			}
		}
	},
	["105_64"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				18785
			},
			{
				"def",
				23
			}
		}
	},
	["105_65"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				18975
			},
			{
				"def",
				23
			}
		}
	},
	["105_66"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				19165
			},
			{
				"def",
				23
			}
		}
	},
	["105_67"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				19355
			},
			{
				"def",
				23
			}
		}
	},
	["105_68"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				19545
			},
			{
				"def",
				23
			}
		}
	},
	["105_69"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				19735
			},
			{
				"def",
				23
			}
		}
	},
	["105_70"] = {
		need_star = 5,
		name = "笔笔果实",
		desc = "",
		id = 105,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				19925
			},
			{
				"def",
				23
			}
		}
	},
	["106_1"] = {
		need_star = 1,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 1,
		need_items = {
			{
				19106,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6000
			},
			{
				"speed",
				7
			}
		}
	},
	["106_2"] = {
		need_star = 1,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6125
			},
			{
				"speed",
				7
			}
		}
	},
	["106_3"] = {
		need_star = 1,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				6250
			},
			{
				"speed",
				7
			}
		}
	},
	["106_4"] = {
		need_star = 1,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				6375
			},
			{
				"speed",
				7
			}
		}
	},
	["106_5"] = {
		need_star = 1,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"speed",
				7
			}
		}
	},
	["106_6"] = {
		need_star = 1,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				6625
			},
			{
				"speed",
				7
			}
		}
	},
	["106_7"] = {
		need_star = 1,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				6750
			},
			{
				"speed",
				7
			}
		}
	},
	["106_8"] = {
		need_star = 1,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				6875
			},
			{
				"speed",
				7
			}
		}
	},
	["106_9"] = {
		need_star = 1,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				7000
			},
			{
				"speed",
				7
			}
		}
	},
	["106_10"] = {
		need_star = 1,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				7125
			},
			{
				"speed",
				7
			}
		}
	},
	["106_11"] = {
		need_star = 2,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				7260
			},
			{
				"speed",
				7
			}
		}
	},
	["106_12"] = {
		need_star = 2,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				7395
			},
			{
				"speed",
				7
			}
		}
	},
	["106_13"] = {
		need_star = 2,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				7530
			},
			{
				"speed",
				7
			}
		}
	},
	["106_14"] = {
		need_star = 2,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				7665
			},
			{
				"speed",
				7
			}
		}
	},
	["106_15"] = {
		need_star = 2,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				7800
			},
			{
				"speed",
				7
			}
		}
	},
	["106_16"] = {
		need_star = 2,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				7935
			},
			{
				"speed",
				7
			}
		}
	},
	["106_17"] = {
		need_star = 2,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				8070
			},
			{
				"speed",
				7
			}
		}
	},
	["106_18"] = {
		need_star = 2,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				8205
			},
			{
				"speed",
				7
			}
		}
	},
	["106_19"] = {
		need_star = 2,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				8340
			},
			{
				"speed",
				7
			}
		}
	},
	["106_20"] = {
		need_star = 2,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				8475
			},
			{
				"speed",
				7
			}
		}
	},
	["106_21"] = {
		need_star = 3,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				8620
			},
			{
				"speed",
				7
			}
		}
	},
	["106_22"] = {
		need_star = 3,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				8765
			},
			{
				"speed",
				7
			}
		}
	},
	["106_23"] = {
		need_star = 3,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				8910
			},
			{
				"speed",
				7
			}
		}
	},
	["106_24"] = {
		need_star = 3,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				9055
			},
			{
				"speed",
				7
			}
		}
	},
	["106_25"] = {
		need_star = 3,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				9200
			},
			{
				"speed",
				7
			}
		}
	},
	["106_26"] = {
		need_star = 3,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				9345
			},
			{
				"speed",
				7
			}
		}
	},
	["106_27"] = {
		need_star = 3,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				9490
			},
			{
				"speed",
				7
			}
		}
	},
	["106_28"] = {
		need_star = 3,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				9635
			},
			{
				"speed",
				7
			}
		}
	},
	["106_29"] = {
		need_star = 3,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				9780
			},
			{
				"speed",
				7
			}
		}
	},
	["106_30"] = {
		need_star = 3,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				9925
			},
			{
				"speed",
				7
			}
		}
	},
	["106_31"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				10085
			},
			{
				"speed",
				7
			}
		}
	},
	["106_32"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				10245
			},
			{
				"speed",
				7
			}
		}
	},
	["106_33"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				10405
			},
			{
				"speed",
				7
			}
		}
	},
	["106_34"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				10565
			},
			{
				"speed",
				7
			}
		}
	},
	["106_35"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				10725
			},
			{
				"speed",
				7
			}
		}
	},
	["106_36"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				10885
			},
			{
				"speed",
				7
			}
		}
	},
	["106_37"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				11045
			},
			{
				"speed",
				7
			}
		}
	},
	["106_38"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				11205
			},
			{
				"speed",
				7
			}
		}
	},
	["106_39"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				11365
			},
			{
				"speed",
				7
			}
		}
	},
	["106_40"] = {
		need_star = 4,
		name = "线线果实",
		desc = "【lv.40】恶魔果实基础属性提升20%",
		id = 106,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				12725
			},
			{
				"speed",
				8
			}
		}
	},
	["106_41"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				12885
			},
			{
				"speed",
				8
			}
		}
	},
	["106_42"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				13045
			},
			{
				"speed",
				8
			}
		}
	},
	["106_43"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				13205
			},
			{
				"speed",
				8
			}
		}
	},
	["106_44"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				13365
			},
			{
				"speed",
				8
			}
		}
	},
	["106_45"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				13525
			},
			{
				"speed",
				8
			}
		}
	},
	["106_46"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				13685
			},
			{
				"speed",
				8
			}
		}
	},
	["106_47"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				13845
			},
			{
				"speed",
				8
			}
		}
	},
	["106_48"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				14005
			},
			{
				"speed",
				8
			}
		}
	},
	["106_49"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				14165
			},
			{
				"speed",
				8
			}
		}
	},
	["106_50"] = {
		need_star = 4,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				14325
			},
			{
				"speed",
				8
			}
		}
	},
	["106_51"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				14515
			},
			{
				"speed",
				8
			}
		}
	},
	["106_52"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				14705
			},
			{
				"speed",
				8
			}
		}
	},
	["106_53"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				14895
			},
			{
				"speed",
				8
			}
		}
	},
	["106_54"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				15085
			},
			{
				"speed",
				8
			}
		}
	},
	["106_55"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				15275
			},
			{
				"speed",
				8
			}
		}
	},
	["106_56"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				15465
			},
			{
				"speed",
				8
			}
		}
	},
	["106_57"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				15655
			},
			{
				"speed",
				8
			}
		}
	},
	["106_58"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				15845
			},
			{
				"speed",
				8
			}
		}
	},
	["106_59"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				16035
			},
			{
				"speed",
				8
			}
		}
	},
	["106_60"] = {
		need_star = 5,
		name = "线线果实",
		desc = "【lv.60】恶魔果实基础属性提升30%",
		id = 106,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				18025
			},
			{
				"speed",
				10
			}
		}
	},
	["106_61"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				18215
			},
			{
				"speed",
				10
			}
		}
	},
	["106_62"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				18405
			},
			{
				"speed",
				10
			}
		}
	},
	["106_63"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				18595
			},
			{
				"speed",
				10
			}
		}
	},
	["106_64"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				18785
			},
			{
				"speed",
				10
			}
		}
	},
	["106_65"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				18975
			},
			{
				"speed",
				10
			}
		}
	},
	["106_66"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				19165
			},
			{
				"speed",
				10
			}
		}
	},
	["106_67"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				19355
			},
			{
				"speed",
				10
			}
		}
	},
	["106_68"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				19545
			},
			{
				"speed",
				10
			}
		}
	},
	["106_69"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				19735
			},
			{
				"speed",
				10
			}
		}
	},
	["106_70"] = {
		need_star = 5,
		name = "线线果实",
		desc = "",
		id = 106,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				19925
			},
			{
				"speed",
				10
			}
		}
	},
	["107_1"] = {
		need_star = 1,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 1,
		need_items = {
			{
				19107,
				30
			}
		},
		atts = {
			{
				"atk",
				1200
			},
			{
				"speed",
				7
			}
		}
	},
	["107_2"] = {
		need_star = 1,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"atk",
				1225
			},
			{
				"speed",
				7
			}
		}
	},
	["107_3"] = {
		need_star = 1,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"atk",
				1250
			},
			{
				"speed",
				7
			}
		}
	},
	["107_4"] = {
		need_star = 1,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"atk",
				1275
			},
			{
				"speed",
				7
			}
		}
	},
	["107_5"] = {
		need_star = 1,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"atk",
				1300
			},
			{
				"speed",
				7
			}
		}
	},
	["107_6"] = {
		need_star = 1,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"atk",
				1325
			},
			{
				"speed",
				7
			}
		}
	},
	["107_7"] = {
		need_star = 1,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"atk",
				1350
			},
			{
				"speed",
				7
			}
		}
	},
	["107_8"] = {
		need_star = 1,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"atk",
				1375
			},
			{
				"speed",
				7
			}
		}
	},
	["107_9"] = {
		need_star = 1,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"atk",
				1400
			},
			{
				"speed",
				7
			}
		}
	},
	["107_10"] = {
		need_star = 1,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"atk",
				1425
			},
			{
				"speed",
				7
			}
		}
	},
	["107_11"] = {
		need_star = 2,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"atk",
				1452
			},
			{
				"speed",
				7
			}
		}
	},
	["107_12"] = {
		need_star = 2,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"atk",
				1479
			},
			{
				"speed",
				7
			}
		}
	},
	["107_13"] = {
		need_star = 2,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"atk",
				1506
			},
			{
				"speed",
				7
			}
		}
	},
	["107_14"] = {
		need_star = 2,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"atk",
				1533
			},
			{
				"speed",
				7
			}
		}
	},
	["107_15"] = {
		need_star = 2,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"atk",
				1560
			},
			{
				"speed",
				7
			}
		}
	},
	["107_16"] = {
		need_star = 2,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"atk",
				1587
			},
			{
				"speed",
				7
			}
		}
	},
	["107_17"] = {
		need_star = 2,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"atk",
				1614
			},
			{
				"speed",
				7
			}
		}
	},
	["107_18"] = {
		need_star = 2,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"atk",
				1641
			},
			{
				"speed",
				7
			}
		}
	},
	["107_19"] = {
		need_star = 2,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"atk",
				1668
			},
			{
				"speed",
				7
			}
		}
	},
	["107_20"] = {
		need_star = 2,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"atk",
				1695
			},
			{
				"speed",
				7
			}
		}
	},
	["107_21"] = {
		need_star = 3,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"atk",
				1725
			},
			{
				"speed",
				7
			}
		}
	},
	["107_22"] = {
		need_star = 3,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"atk",
				1755
			},
			{
				"speed",
				7
			}
		}
	},
	["107_23"] = {
		need_star = 3,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"atk",
				1785
			},
			{
				"speed",
				7
			}
		}
	},
	["107_24"] = {
		need_star = 3,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"atk",
				1815
			},
			{
				"speed",
				7
			}
		}
	},
	["107_25"] = {
		need_star = 3,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"atk",
				1845
			},
			{
				"speed",
				7
			}
		}
	},
	["107_26"] = {
		need_star = 3,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"atk",
				1875
			},
			{
				"speed",
				7
			}
		}
	},
	["107_27"] = {
		need_star = 3,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"atk",
				1905
			},
			{
				"speed",
				7
			}
		}
	},
	["107_28"] = {
		need_star = 3,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"atk",
				1935
			},
			{
				"speed",
				7
			}
		}
	},
	["107_29"] = {
		need_star = 3,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"atk",
				1965
			},
			{
				"speed",
				7
			}
		}
	},
	["107_30"] = {
		need_star = 3,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"atk",
				1995
			},
			{
				"speed",
				7
			}
		}
	},
	["107_31"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"atk",
				2030
			},
			{
				"speed",
				7
			}
		}
	},
	["107_32"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"atk",
				2065
			},
			{
				"speed",
				7
			}
		}
	},
	["107_33"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"atk",
				2100
			},
			{
				"speed",
				7
			}
		}
	},
	["107_34"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"atk",
				2135
			},
			{
				"speed",
				7
			}
		}
	},
	["107_35"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"atk",
				2170
			},
			{
				"speed",
				7
			}
		}
	},
	["107_36"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"atk",
				2205
			},
			{
				"speed",
				7
			}
		}
	},
	["107_37"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"atk",
				2240
			},
			{
				"speed",
				7
			}
		}
	},
	["107_38"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"atk",
				2275
			},
			{
				"speed",
				7
			}
		}
	},
	["107_39"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"atk",
				2310
			},
			{
				"speed",
				7
			}
		}
	},
	["107_40"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "【lv.40】恶魔果实基础属性提升20%",
		id = 107,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"atk",
				2585
			},
			{
				"speed",
				8
			}
		}
	},
	["107_41"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"atk",
				2620
			},
			{
				"speed",
				8
			}
		}
	},
	["107_42"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"atk",
				2655
			},
			{
				"speed",
				8
			}
		}
	},
	["107_43"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"atk",
				2690
			},
			{
				"speed",
				8
			}
		}
	},
	["107_44"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"atk",
				2725
			},
			{
				"speed",
				8
			}
		}
	},
	["107_45"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"atk",
				2760
			},
			{
				"speed",
				8
			}
		}
	},
	["107_46"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"atk",
				2795
			},
			{
				"speed",
				8
			}
		}
	},
	["107_47"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"atk",
				2830
			},
			{
				"speed",
				8
			}
		}
	},
	["107_48"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"atk",
				2865
			},
			{
				"speed",
				8
			}
		}
	},
	["107_49"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"atk",
				2900
			},
			{
				"speed",
				8
			}
		}
	},
	["107_50"] = {
		need_star = 4,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"atk",
				2935
			},
			{
				"speed",
				8
			}
		}
	},
	["107_51"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"atk",
				2980
			},
			{
				"speed",
				8
			}
		}
	},
	["107_52"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"atk",
				3025
			},
			{
				"speed",
				8
			}
		}
	},
	["107_53"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"atk",
				3070
			},
			{
				"speed",
				8
			}
		}
	},
	["107_54"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"atk",
				3115
			},
			{
				"speed",
				8
			}
		}
	},
	["107_55"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"atk",
				3160
			},
			{
				"speed",
				8
			}
		}
	},
	["107_56"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"atk",
				3205
			},
			{
				"speed",
				8
			}
		}
	},
	["107_57"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"atk",
				3250
			},
			{
				"speed",
				8
			}
		}
	},
	["107_58"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"atk",
				3295
			},
			{
				"speed",
				8
			}
		}
	},
	["107_59"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"atk",
				3340
			},
			{
				"speed",
				8
			}
		}
	},
	["107_60"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "【lv.60】恶魔果实基础属性提升30%",
		id = 107,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"atk",
				3745
			},
			{
				"speed",
				10
			}
		}
	},
	["107_61"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"atk",
				3790
			},
			{
				"speed",
				10
			}
		}
	},
	["107_62"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"atk",
				3835
			},
			{
				"speed",
				10
			}
		}
	},
	["107_63"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"atk",
				3880
			},
			{
				"speed",
				10
			}
		}
	},
	["107_64"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"atk",
				3925
			},
			{
				"speed",
				10
			}
		}
	},
	["107_65"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"atk",
				3970
			},
			{
				"speed",
				10
			}
		}
	},
	["107_66"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"atk",
				4015
			},
			{
				"speed",
				10
			}
		}
	},
	["107_67"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"atk",
				4060
			},
			{
				"speed",
				10
			}
		}
	},
	["107_68"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"atk",
				4105
			},
			{
				"speed",
				10
			}
		}
	},
	["107_69"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"atk",
				4150
			},
			{
				"speed",
				10
			}
		}
	},
	["107_70"] = {
		need_star = 5,
		name = "瓦斯果实",
		desc = "",
		id = 107,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"atk",
				4195
			},
			{
				"speed",
				10
			}
		}
	},
	["108_1"] = {
		need_star = 1,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 1,
		need_items = {
			{
				19108,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6000
			},
			{
				"speed",
				7
			}
		}
	},
	["108_2"] = {
		need_star = 1,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6125
			},
			{
				"speed",
				7
			}
		}
	},
	["108_3"] = {
		need_star = 1,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				6250
			},
			{
				"speed",
				7
			}
		}
	},
	["108_4"] = {
		need_star = 1,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				6375
			},
			{
				"speed",
				7
			}
		}
	},
	["108_5"] = {
		need_star = 1,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"speed",
				7
			}
		}
	},
	["108_6"] = {
		need_star = 1,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				6625
			},
			{
				"speed",
				7
			}
		}
	},
	["108_7"] = {
		need_star = 1,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				6750
			},
			{
				"speed",
				7
			}
		}
	},
	["108_8"] = {
		need_star = 1,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				6875
			},
			{
				"speed",
				7
			}
		}
	},
	["108_9"] = {
		need_star = 1,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				7000
			},
			{
				"speed",
				7
			}
		}
	},
	["108_10"] = {
		need_star = 1,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				7125
			},
			{
				"speed",
				7
			}
		}
	},
	["108_11"] = {
		need_star = 2,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				7260
			},
			{
				"speed",
				7
			}
		}
	},
	["108_12"] = {
		need_star = 2,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				7395
			},
			{
				"speed",
				7
			}
		}
	},
	["108_13"] = {
		need_star = 2,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				7530
			},
			{
				"speed",
				7
			}
		}
	},
	["108_14"] = {
		need_star = 2,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				7665
			},
			{
				"speed",
				7
			}
		}
	},
	["108_15"] = {
		need_star = 2,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				7800
			},
			{
				"speed",
				7
			}
		}
	},
	["108_16"] = {
		need_star = 2,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				7935
			},
			{
				"speed",
				7
			}
		}
	},
	["108_17"] = {
		need_star = 2,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				8070
			},
			{
				"speed",
				7
			}
		}
	},
	["108_18"] = {
		need_star = 2,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				8205
			},
			{
				"speed",
				7
			}
		}
	},
	["108_19"] = {
		need_star = 2,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				8340
			},
			{
				"speed",
				7
			}
		}
	},
	["108_20"] = {
		need_star = 2,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				8475
			},
			{
				"speed",
				7
			}
		}
	},
	["108_21"] = {
		need_star = 3,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				8620
			},
			{
				"speed",
				7
			}
		}
	},
	["108_22"] = {
		need_star = 3,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				8765
			},
			{
				"speed",
				7
			}
		}
	},
	["108_23"] = {
		need_star = 3,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				8910
			},
			{
				"speed",
				7
			}
		}
	},
	["108_24"] = {
		need_star = 3,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				9055
			},
			{
				"speed",
				7
			}
		}
	},
	["108_25"] = {
		need_star = 3,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				9200
			},
			{
				"speed",
				7
			}
		}
	},
	["108_26"] = {
		need_star = 3,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				9345
			},
			{
				"speed",
				7
			}
		}
	},
	["108_27"] = {
		need_star = 3,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				9490
			},
			{
				"speed",
				7
			}
		}
	},
	["108_28"] = {
		need_star = 3,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				9635
			},
			{
				"speed",
				7
			}
		}
	},
	["108_29"] = {
		need_star = 3,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				9780
			},
			{
				"speed",
				7
			}
		}
	},
	["108_30"] = {
		need_star = 3,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				9925
			},
			{
				"speed",
				7
			}
		}
	},
	["108_31"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				10085
			},
			{
				"speed",
				7
			}
		}
	},
	["108_32"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				10245
			},
			{
				"speed",
				7
			}
		}
	},
	["108_33"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				10405
			},
			{
				"speed",
				7
			}
		}
	},
	["108_34"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				10565
			},
			{
				"speed",
				7
			}
		}
	},
	["108_35"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				10725
			},
			{
				"speed",
				7
			}
		}
	},
	["108_36"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				10885
			},
			{
				"speed",
				7
			}
		}
	},
	["108_37"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				11045
			},
			{
				"speed",
				7
			}
		}
	},
	["108_38"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				11205
			},
			{
				"speed",
				7
			}
		}
	},
	["108_39"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				11365
			},
			{
				"speed",
				7
			}
		}
	},
	["108_40"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "【lv.40】恶魔果实基础属性提升20%",
		id = 108,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				12725
			},
			{
				"speed",
				8
			}
		}
	},
	["108_41"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				12885
			},
			{
				"speed",
				8
			}
		}
	},
	["108_42"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				13045
			},
			{
				"speed",
				8
			}
		}
	},
	["108_43"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				13205
			},
			{
				"speed",
				8
			}
		}
	},
	["108_44"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				13365
			},
			{
				"speed",
				8
			}
		}
	},
	["108_45"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				13525
			},
			{
				"speed",
				8
			}
		}
	},
	["108_46"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				13685
			},
			{
				"speed",
				8
			}
		}
	},
	["108_47"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				13845
			},
			{
				"speed",
				8
			}
		}
	},
	["108_48"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				14005
			},
			{
				"speed",
				8
			}
		}
	},
	["108_49"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				14165
			},
			{
				"speed",
				8
			}
		}
	},
	["108_50"] = {
		need_star = 4,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				14325
			},
			{
				"speed",
				8
			}
		}
	},
	["108_51"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				14515
			},
			{
				"speed",
				8
			}
		}
	},
	["108_52"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				14705
			},
			{
				"speed",
				8
			}
		}
	},
	["108_53"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				14895
			},
			{
				"speed",
				8
			}
		}
	},
	["108_54"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				15085
			},
			{
				"speed",
				8
			}
		}
	},
	["108_55"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				15275
			},
			{
				"speed",
				8
			}
		}
	},
	["108_56"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				15465
			},
			{
				"speed",
				8
			}
		}
	},
	["108_57"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				15655
			},
			{
				"speed",
				8
			}
		}
	},
	["108_58"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				15845
			},
			{
				"speed",
				8
			}
		}
	},
	["108_59"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				16035
			},
			{
				"speed",
				8
			}
		}
	},
	["108_60"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "【lv.60】恶魔果实基础属性提升30%",
		id = 108,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				18025
			},
			{
				"speed",
				10
			}
		}
	},
	["108_61"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				18215
			},
			{
				"speed",
				10
			}
		}
	},
	["108_62"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				18405
			},
			{
				"speed",
				10
			}
		}
	},
	["108_63"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				18595
			},
			{
				"speed",
				10
			}
		}
	},
	["108_64"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				18785
			},
			{
				"speed",
				10
			}
		}
	},
	["108_65"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				18975
			},
			{
				"speed",
				10
			}
		}
	},
	["108_66"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				19165
			},
			{
				"speed",
				10
			}
		}
	},
	["108_67"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				19355
			},
			{
				"speed",
				10
			}
		}
	},
	["108_68"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				19545
			},
			{
				"speed",
				10
			}
		}
	},
	["108_69"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				19735
			},
			{
				"speed",
				10
			}
		}
	},
	["108_70"] = {
		need_star = 5,
		name = "牛牛果实",
		desc = "",
		id = 108,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				19925
			},
			{
				"speed",
				10
			}
		}
	},
	["109_1"] = {
		need_star = 1,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 1,
		need_items = {
			{
				19109,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6000
			},
			{
				"def",
				15
			}
		}
	},
	["109_2"] = {
		need_star = 1,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6125
			},
			{
				"def",
				15
			}
		}
	},
	["109_3"] = {
		need_star = 1,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				6250
			},
			{
				"def",
				15
			}
		}
	},
	["109_4"] = {
		need_star = 1,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				6375
			},
			{
				"def",
				15
			}
		}
	},
	["109_5"] = {
		need_star = 1,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"def",
				15
			}
		}
	},
	["109_6"] = {
		need_star = 1,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				6625
			},
			{
				"def",
				15
			}
		}
	},
	["109_7"] = {
		need_star = 1,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				6750
			},
			{
				"def",
				15
			}
		}
	},
	["109_8"] = {
		need_star = 1,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				6875
			},
			{
				"def",
				15
			}
		}
	},
	["109_9"] = {
		need_star = 1,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				7000
			},
			{
				"def",
				15
			}
		}
	},
	["109_10"] = {
		need_star = 1,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				7125
			},
			{
				"def",
				15
			}
		}
	},
	["109_11"] = {
		need_star = 2,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				7260
			},
			{
				"def",
				15
			}
		}
	},
	["109_12"] = {
		need_star = 2,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				7395
			},
			{
				"def",
				15
			}
		}
	},
	["109_13"] = {
		need_star = 2,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				7530
			},
			{
				"def",
				15
			}
		}
	},
	["109_14"] = {
		need_star = 2,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				7665
			},
			{
				"def",
				15
			}
		}
	},
	["109_15"] = {
		need_star = 2,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				7800
			},
			{
				"def",
				15
			}
		}
	},
	["109_16"] = {
		need_star = 2,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				7935
			},
			{
				"def",
				15
			}
		}
	},
	["109_17"] = {
		need_star = 2,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				8070
			},
			{
				"def",
				15
			}
		}
	},
	["109_18"] = {
		need_star = 2,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				8205
			},
			{
				"def",
				15
			}
		}
	},
	["109_19"] = {
		need_star = 2,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				8340
			},
			{
				"def",
				15
			}
		}
	},
	["109_20"] = {
		need_star = 2,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				8475
			},
			{
				"def",
				15
			}
		}
	},
	["109_21"] = {
		need_star = 3,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				8620
			},
			{
				"def",
				15
			}
		}
	},
	["109_22"] = {
		need_star = 3,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				8765
			},
			{
				"def",
				15
			}
		}
	},
	["109_23"] = {
		need_star = 3,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				8910
			},
			{
				"def",
				15
			}
		}
	},
	["109_24"] = {
		need_star = 3,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				9055
			},
			{
				"def",
				15
			}
		}
	},
	["109_25"] = {
		need_star = 3,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				9200
			},
			{
				"def",
				15
			}
		}
	},
	["109_26"] = {
		need_star = 3,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				9345
			},
			{
				"def",
				15
			}
		}
	},
	["109_27"] = {
		need_star = 3,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				9490
			},
			{
				"def",
				15
			}
		}
	},
	["109_28"] = {
		need_star = 3,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				9635
			},
			{
				"def",
				15
			}
		}
	},
	["109_29"] = {
		need_star = 3,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				9780
			},
			{
				"def",
				15
			}
		}
	},
	["109_30"] = {
		need_star = 3,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				9925
			},
			{
				"def",
				15
			}
		}
	},
	["109_31"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				10085
			},
			{
				"def",
				15
			}
		}
	},
	["109_32"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				10245
			},
			{
				"def",
				15
			}
		}
	},
	["109_33"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				10405
			},
			{
				"def",
				15
			}
		}
	},
	["109_34"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				10565
			},
			{
				"def",
				15
			}
		}
	},
	["109_35"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				10725
			},
			{
				"def",
				15
			}
		}
	},
	["109_36"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				10885
			},
			{
				"def",
				15
			}
		}
	},
	["109_37"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				11045
			},
			{
				"def",
				15
			}
		}
	},
	["109_38"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				11205
			},
			{
				"def",
				15
			}
		}
	},
	["109_39"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				11365
			},
			{
				"def",
				15
			}
		}
	},
	["109_40"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "【lv.40】恶魔果实基础属性提升20%",
		id = 109,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				12725
			},
			{
				"def",
				18
			}
		}
	},
	["109_41"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				12885
			},
			{
				"def",
				18
			}
		}
	},
	["109_42"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				13045
			},
			{
				"def",
				18
			}
		}
	},
	["109_43"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				13205
			},
			{
				"def",
				18
			}
		}
	},
	["109_44"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				13365
			},
			{
				"def",
				18
			}
		}
	},
	["109_45"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				13525
			},
			{
				"def",
				18
			}
		}
	},
	["109_46"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				13685
			},
			{
				"def",
				18
			}
		}
	},
	["109_47"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				13845
			},
			{
				"def",
				18
			}
		}
	},
	["109_48"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				14005
			},
			{
				"def",
				18
			}
		}
	},
	["109_49"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				14165
			},
			{
				"def",
				18
			}
		}
	},
	["109_50"] = {
		need_star = 4,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				14325
			},
			{
				"def",
				18
			}
		}
	},
	["109_51"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				14515
			},
			{
				"def",
				18
			}
		}
	},
	["109_52"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				14705
			},
			{
				"def",
				18
			}
		}
	},
	["109_53"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				14895
			},
			{
				"def",
				18
			}
		}
	},
	["109_54"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				15085
			},
			{
				"def",
				18
			}
		}
	},
	["109_55"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				15275
			},
			{
				"def",
				18
			}
		}
	},
	["109_56"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				15465
			},
			{
				"def",
				18
			}
		}
	},
	["109_57"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				15655
			},
			{
				"def",
				18
			}
		}
	},
	["109_58"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				15845
			},
			{
				"def",
				18
			}
		}
	},
	["109_59"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				16035
			},
			{
				"def",
				18
			}
		}
	},
	["109_60"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "【lv.60】恶魔果实基础属性提升30%",
		id = 109,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				18025
			},
			{
				"def",
				23
			}
		}
	},
	["109_61"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				18215
			},
			{
				"def",
				23
			}
		}
	},
	["109_62"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				18405
			},
			{
				"def",
				23
			}
		}
	},
	["109_63"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				18595
			},
			{
				"def",
				23
			}
		}
	},
	["109_64"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				18785
			},
			{
				"def",
				23
			}
		}
	},
	["109_65"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				18975
			},
			{
				"def",
				23
			}
		}
	},
	["109_66"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				19165
			},
			{
				"def",
				23
			}
		}
	},
	["109_67"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				19355
			},
			{
				"def",
				23
			}
		}
	},
	["109_68"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				19545
			},
			{
				"def",
				23
			}
		}
	},
	["109_69"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				19735
			},
			{
				"def",
				23
			}
		}
	},
	["109_70"] = {
		need_star = 5,
		name = "滑滑果实",
		desc = "",
		id = 109,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				19925
			},
			{
				"def",
				23
			}
		}
	},
	["110_1"] = {
		need_star = 1,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 1,
		need_items = {
			{
				19110,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6000
			},
			{
				"def",
				15
			}
		}
	},
	["110_2"] = {
		need_star = 1,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6125
			},
			{
				"def",
				15
			}
		}
	},
	["110_3"] = {
		need_star = 1,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				6250
			},
			{
				"def",
				15
			}
		}
	},
	["110_4"] = {
		need_star = 1,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				6375
			},
			{
				"def",
				15
			}
		}
	},
	["110_5"] = {
		need_star = 1,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"def",
				15
			}
		}
	},
	["110_6"] = {
		need_star = 1,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				6625
			},
			{
				"def",
				15
			}
		}
	},
	["110_7"] = {
		need_star = 1,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				6750
			},
			{
				"def",
				15
			}
		}
	},
	["110_8"] = {
		need_star = 1,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				6875
			},
			{
				"def",
				15
			}
		}
	},
	["110_9"] = {
		need_star = 1,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				7000
			},
			{
				"def",
				15
			}
		}
	},
	["110_10"] = {
		need_star = 1,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				7125
			},
			{
				"def",
				15
			}
		}
	},
	["110_11"] = {
		need_star = 2,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				7260
			},
			{
				"def",
				15
			}
		}
	},
	["110_12"] = {
		need_star = 2,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				7395
			},
			{
				"def",
				15
			}
		}
	},
	["110_13"] = {
		need_star = 2,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				7530
			},
			{
				"def",
				15
			}
		}
	},
	["110_14"] = {
		need_star = 2,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				7665
			},
			{
				"def",
				15
			}
		}
	},
	["110_15"] = {
		need_star = 2,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				7800
			},
			{
				"def",
				15
			}
		}
	},
	["110_16"] = {
		need_star = 2,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				7935
			},
			{
				"def",
				15
			}
		}
	},
	["110_17"] = {
		need_star = 2,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				8070
			},
			{
				"def",
				15
			}
		}
	},
	["110_18"] = {
		need_star = 2,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				8205
			},
			{
				"def",
				15
			}
		}
	},
	["110_19"] = {
		need_star = 2,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				8340
			},
			{
				"def",
				15
			}
		}
	},
	["110_20"] = {
		need_star = 2,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				8475
			},
			{
				"def",
				15
			}
		}
	},
	["110_21"] = {
		need_star = 3,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				8620
			},
			{
				"def",
				15
			}
		}
	},
	["110_22"] = {
		need_star = 3,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				8765
			},
			{
				"def",
				15
			}
		}
	},
	["110_23"] = {
		need_star = 3,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				8910
			},
			{
				"def",
				15
			}
		}
	},
	["110_24"] = {
		need_star = 3,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				9055
			},
			{
				"def",
				15
			}
		}
	},
	["110_25"] = {
		need_star = 3,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				9200
			},
			{
				"def",
				15
			}
		}
	},
	["110_26"] = {
		need_star = 3,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				9345
			},
			{
				"def",
				15
			}
		}
	},
	["110_27"] = {
		need_star = 3,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				9490
			},
			{
				"def",
				15
			}
		}
	},
	["110_28"] = {
		need_star = 3,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				9635
			},
			{
				"def",
				15
			}
		}
	},
	["110_29"] = {
		need_star = 3,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				9780
			},
			{
				"def",
				15
			}
		}
	},
	["110_30"] = {
		need_star = 3,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				9925
			},
			{
				"def",
				15
			}
		}
	},
	["110_31"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				10085
			},
			{
				"def",
				15
			}
		}
	},
	["110_32"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				10245
			},
			{
				"def",
				15
			}
		}
	},
	["110_33"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				10405
			},
			{
				"def",
				15
			}
		}
	},
	["110_34"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				10565
			},
			{
				"def",
				15
			}
		}
	},
	["110_35"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				10725
			},
			{
				"def",
				15
			}
		}
	},
	["110_36"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				10885
			},
			{
				"def",
				15
			}
		}
	},
	["110_37"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				11045
			},
			{
				"def",
				15
			}
		}
	},
	["110_38"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				11205
			},
			{
				"def",
				15
			}
		}
	},
	["110_39"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				11365
			},
			{
				"def",
				15
			}
		}
	},
	["110_40"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "【lv.40】恶魔果实基础属性提升20%",
		id = 110,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				12725
			},
			{
				"def",
				18
			}
		}
	},
	["110_41"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				12885
			},
			{
				"def",
				18
			}
		}
	},
	["110_42"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				13045
			},
			{
				"def",
				18
			}
		}
	},
	["110_43"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				13205
			},
			{
				"def",
				18
			}
		}
	},
	["110_44"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				13365
			},
			{
				"def",
				18
			}
		}
	},
	["110_45"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				13525
			},
			{
				"def",
				18
			}
		}
	},
	["110_46"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				13685
			},
			{
				"def",
				18
			}
		}
	},
	["110_47"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				13845
			},
			{
				"def",
				18
			}
		}
	},
	["110_48"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				14005
			},
			{
				"def",
				18
			}
		}
	},
	["110_49"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				14165
			},
			{
				"def",
				18
			}
		}
	},
	["110_50"] = {
		need_star = 4,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				14325
			},
			{
				"def",
				18
			}
		}
	},
	["110_51"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				14515
			},
			{
				"def",
				18
			}
		}
	},
	["110_52"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				14705
			},
			{
				"def",
				18
			}
		}
	},
	["110_53"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				14895
			},
			{
				"def",
				18
			}
		}
	},
	["110_54"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				15085
			},
			{
				"def",
				18
			}
		}
	},
	["110_55"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				15275
			},
			{
				"def",
				18
			}
		}
	},
	["110_56"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				15465
			},
			{
				"def",
				18
			}
		}
	},
	["110_57"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				15655
			},
			{
				"def",
				18
			}
		}
	},
	["110_58"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				15845
			},
			{
				"def",
				18
			}
		}
	},
	["110_59"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				16035
			},
			{
				"def",
				18
			}
		}
	},
	["110_60"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "【lv.60】恶魔果实基础属性提升30%",
		id = 110,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				18025
			},
			{
				"def",
				23
			}
		}
	},
	["110_61"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				18215
			},
			{
				"def",
				23
			}
		}
	},
	["110_62"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				18405
			},
			{
				"def",
				23
			}
		}
	},
	["110_63"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				18595
			},
			{
				"def",
				23
			}
		}
	},
	["110_64"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				18785
			},
			{
				"def",
				23
			}
		}
	},
	["110_65"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				18975
			},
			{
				"def",
				23
			}
		}
	},
	["110_66"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				19165
			},
			{
				"def",
				23
			}
		}
	},
	["110_67"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				19355
			},
			{
				"def",
				23
			}
		}
	},
	["110_68"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				19545
			},
			{
				"def",
				23
			}
		}
	},
	["110_69"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				19735
			},
			{
				"def",
				23
			}
		}
	},
	["110_70"] = {
		need_star = 5,
		name = "爆炸果实",
		desc = "",
		id = 110,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				19925
			},
			{
				"def",
				23
			}
		}
	},
	["111_1"] = {
		need_star = 1,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 1,
		need_items = {
			{
				19111,
				30
			}
		},
		atts = {
			{
				"atk",
				1200
			},
			{
				"def",
				15
			}
		}
	},
	["111_2"] = {
		need_star = 1,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"atk",
				1225
			},
			{
				"def",
				15
			}
		}
	},
	["111_3"] = {
		need_star = 1,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"atk",
				1250
			},
			{
				"def",
				15
			}
		}
	},
	["111_4"] = {
		need_star = 1,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"atk",
				1275
			},
			{
				"def",
				15
			}
		}
	},
	["111_5"] = {
		need_star = 1,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"atk",
				1300
			},
			{
				"def",
				15
			}
		}
	},
	["111_6"] = {
		need_star = 1,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"atk",
				1325
			},
			{
				"def",
				15
			}
		}
	},
	["111_7"] = {
		need_star = 1,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"atk",
				1350
			},
			{
				"def",
				15
			}
		}
	},
	["111_8"] = {
		need_star = 1,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"atk",
				1375
			},
			{
				"def",
				15
			}
		}
	},
	["111_9"] = {
		need_star = 1,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"atk",
				1400
			},
			{
				"def",
				15
			}
		}
	},
	["111_10"] = {
		need_star = 1,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"atk",
				1425
			},
			{
				"def",
				15
			}
		}
	},
	["111_11"] = {
		need_star = 2,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"atk",
				1452
			},
			{
				"def",
				15
			}
		}
	},
	["111_12"] = {
		need_star = 2,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"atk",
				1479
			},
			{
				"def",
				15
			}
		}
	},
	["111_13"] = {
		need_star = 2,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"atk",
				1506
			},
			{
				"def",
				15
			}
		}
	},
	["111_14"] = {
		need_star = 2,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"atk",
				1533
			},
			{
				"def",
				15
			}
		}
	},
	["111_15"] = {
		need_star = 2,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"atk",
				1560
			},
			{
				"def",
				15
			}
		}
	},
	["111_16"] = {
		need_star = 2,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"atk",
				1587
			},
			{
				"def",
				15
			}
		}
	},
	["111_17"] = {
		need_star = 2,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"atk",
				1614
			},
			{
				"def",
				15
			}
		}
	},
	["111_18"] = {
		need_star = 2,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"atk",
				1641
			},
			{
				"def",
				15
			}
		}
	},
	["111_19"] = {
		need_star = 2,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"atk",
				1668
			},
			{
				"def",
				15
			}
		}
	},
	["111_20"] = {
		need_star = 2,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"atk",
				1695
			},
			{
				"def",
				15
			}
		}
	},
	["111_21"] = {
		need_star = 3,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"atk",
				1725
			},
			{
				"def",
				15
			}
		}
	},
	["111_22"] = {
		need_star = 3,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"atk",
				1755
			},
			{
				"def",
				15
			}
		}
	},
	["111_23"] = {
		need_star = 3,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"atk",
				1785
			},
			{
				"def",
				15
			}
		}
	},
	["111_24"] = {
		need_star = 3,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"atk",
				1815
			},
			{
				"def",
				15
			}
		}
	},
	["111_25"] = {
		need_star = 3,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"atk",
				1845
			},
			{
				"def",
				15
			}
		}
	},
	["111_26"] = {
		need_star = 3,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"atk",
				1875
			},
			{
				"def",
				15
			}
		}
	},
	["111_27"] = {
		need_star = 3,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"atk",
				1905
			},
			{
				"def",
				15
			}
		}
	},
	["111_28"] = {
		need_star = 3,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"atk",
				1935
			},
			{
				"def",
				15
			}
		}
	},
	["111_29"] = {
		need_star = 3,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"atk",
				1965
			},
			{
				"def",
				15
			}
		}
	},
	["111_30"] = {
		need_star = 3,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"atk",
				1995
			},
			{
				"def",
				15
			}
		}
	},
	["111_31"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"atk",
				2030
			},
			{
				"def",
				15
			}
		}
	},
	["111_32"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"atk",
				2065
			},
			{
				"def",
				15
			}
		}
	},
	["111_33"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"atk",
				2100
			},
			{
				"def",
				15
			}
		}
	},
	["111_34"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"atk",
				2135
			},
			{
				"def",
				15
			}
		}
	},
	["111_35"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"atk",
				2170
			},
			{
				"def",
				15
			}
		}
	},
	["111_36"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"atk",
				2205
			},
			{
				"def",
				15
			}
		}
	},
	["111_37"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"atk",
				2240
			},
			{
				"def",
				15
			}
		}
	},
	["111_38"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"atk",
				2275
			},
			{
				"def",
				15
			}
		}
	},
	["111_39"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"atk",
				2310
			},
			{
				"def",
				15
			}
		}
	},
	["111_40"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "【lv.40】恶魔果实基础属性提升20%",
		id = 111,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"atk",
				2585
			},
			{
				"def",
				18
			}
		}
	},
	["111_41"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"atk",
				2620
			},
			{
				"def",
				18
			}
		}
	},
	["111_42"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"atk",
				2655
			},
			{
				"def",
				18
			}
		}
	},
	["111_43"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"atk",
				2690
			},
			{
				"def",
				18
			}
		}
	},
	["111_44"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"atk",
				2725
			},
			{
				"def",
				18
			}
		}
	},
	["111_45"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"atk",
				2760
			},
			{
				"def",
				18
			}
		}
	},
	["111_46"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"atk",
				2795
			},
			{
				"def",
				18
			}
		}
	},
	["111_47"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"atk",
				2830
			},
			{
				"def",
				18
			}
		}
	},
	["111_48"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"atk",
				2865
			},
			{
				"def",
				18
			}
		}
	},
	["111_49"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"atk",
				2900
			},
			{
				"def",
				18
			}
		}
	},
	["111_50"] = {
		need_star = 4,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"atk",
				2935
			},
			{
				"def",
				18
			}
		}
	},
	["111_51"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"atk",
				2980
			},
			{
				"def",
				18
			}
		}
	},
	["111_52"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"atk",
				3025
			},
			{
				"def",
				18
			}
		}
	},
	["111_53"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"atk",
				3070
			},
			{
				"def",
				18
			}
		}
	},
	["111_54"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"atk",
				3115
			},
			{
				"def",
				18
			}
		}
	},
	["111_55"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"atk",
				3160
			},
			{
				"def",
				18
			}
		}
	},
	["111_56"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"atk",
				3205
			},
			{
				"def",
				18
			}
		}
	},
	["111_57"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"atk",
				3250
			},
			{
				"def",
				18
			}
		}
	},
	["111_58"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"atk",
				3295
			},
			{
				"def",
				18
			}
		}
	},
	["111_59"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"atk",
				3340
			},
			{
				"def",
				18
			}
		}
	},
	["111_60"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "【lv.60】恶魔果实基础属性提升30%",
		id = 111,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"atk",
				3745
			},
			{
				"def",
				23
			}
		}
	},
	["111_61"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"atk",
				3790
			},
			{
				"def",
				23
			}
		}
	},
	["111_62"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"atk",
				3835
			},
			{
				"def",
				23
			}
		}
	},
	["111_63"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"atk",
				3880
			},
			{
				"def",
				23
			}
		}
	},
	["111_64"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"atk",
				3925
			},
			{
				"def",
				23
			}
		}
	},
	["111_65"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"atk",
				3970
			},
			{
				"def",
				23
			}
		}
	},
	["111_66"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"atk",
				4015
			},
			{
				"def",
				23
			}
		}
	},
	["111_67"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"atk",
				4060
			},
			{
				"def",
				23
			}
		}
	},
	["111_68"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"atk",
				4105
			},
			{
				"def",
				23
			}
		}
	},
	["111_69"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"atk",
				4150
			},
			{
				"def",
				23
			}
		}
	},
	["111_70"] = {
		need_star = 5,
		name = "泡泡果实",
		desc = "",
		id = 111,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"atk",
				4195
			},
			{
				"def",
				23
			}
		}
	},
	["112_1"] = {
		need_star = 1,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 1,
		need_items = {
			{
				19112,
				30
			}
		},
		atts = {
			{
				"atk",
				1200
			},
			{
				"speed",
				7
			}
		}
	},
	["112_2"] = {
		need_star = 1,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"atk",
				1225
			},
			{
				"speed",
				7
			}
		}
	},
	["112_3"] = {
		need_star = 1,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"atk",
				1250
			},
			{
				"speed",
				7
			}
		}
	},
	["112_4"] = {
		need_star = 1,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"atk",
				1275
			},
			{
				"speed",
				7
			}
		}
	},
	["112_5"] = {
		need_star = 1,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"atk",
				1300
			},
			{
				"speed",
				7
			}
		}
	},
	["112_6"] = {
		need_star = 1,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"atk",
				1325
			},
			{
				"speed",
				7
			}
		}
	},
	["112_7"] = {
		need_star = 1,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"atk",
				1350
			},
			{
				"speed",
				7
			}
		}
	},
	["112_8"] = {
		need_star = 1,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"atk",
				1375
			},
			{
				"speed",
				7
			}
		}
	},
	["112_9"] = {
		need_star = 1,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"atk",
				1400
			},
			{
				"speed",
				7
			}
		}
	},
	["112_10"] = {
		need_star = 1,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"atk",
				1425
			},
			{
				"speed",
				7
			}
		}
	},
	["112_11"] = {
		need_star = 2,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"atk",
				1452
			},
			{
				"speed",
				7
			}
		}
	},
	["112_12"] = {
		need_star = 2,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"atk",
				1479
			},
			{
				"speed",
				7
			}
		}
	},
	["112_13"] = {
		need_star = 2,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"atk",
				1506
			},
			{
				"speed",
				7
			}
		}
	},
	["112_14"] = {
		need_star = 2,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"atk",
				1533
			},
			{
				"speed",
				7
			}
		}
	},
	["112_15"] = {
		need_star = 2,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"atk",
				1560
			},
			{
				"speed",
				7
			}
		}
	},
	["112_16"] = {
		need_star = 2,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"atk",
				1587
			},
			{
				"speed",
				7
			}
		}
	},
	["112_17"] = {
		need_star = 2,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"atk",
				1614
			},
			{
				"speed",
				7
			}
		}
	},
	["112_18"] = {
		need_star = 2,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"atk",
				1641
			},
			{
				"speed",
				7
			}
		}
	},
	["112_19"] = {
		need_star = 2,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"atk",
				1668
			},
			{
				"speed",
				7
			}
		}
	},
	["112_20"] = {
		need_star = 2,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"atk",
				1695
			},
			{
				"speed",
				7
			}
		}
	},
	["112_21"] = {
		need_star = 3,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"atk",
				1725
			},
			{
				"speed",
				7
			}
		}
	},
	["112_22"] = {
		need_star = 3,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"atk",
				1755
			},
			{
				"speed",
				7
			}
		}
	},
	["112_23"] = {
		need_star = 3,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"atk",
				1785
			},
			{
				"speed",
				7
			}
		}
	},
	["112_24"] = {
		need_star = 3,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"atk",
				1815
			},
			{
				"speed",
				7
			}
		}
	},
	["112_25"] = {
		need_star = 3,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"atk",
				1845
			},
			{
				"speed",
				7
			}
		}
	},
	["112_26"] = {
		need_star = 3,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"atk",
				1875
			},
			{
				"speed",
				7
			}
		}
	},
	["112_27"] = {
		need_star = 3,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"atk",
				1905
			},
			{
				"speed",
				7
			}
		}
	},
	["112_28"] = {
		need_star = 3,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"atk",
				1935
			},
			{
				"speed",
				7
			}
		}
	},
	["112_29"] = {
		need_star = 3,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"atk",
				1965
			},
			{
				"speed",
				7
			}
		}
	},
	["112_30"] = {
		need_star = 3,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"atk",
				1995
			},
			{
				"speed",
				7
			}
		}
	},
	["112_31"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"atk",
				2030
			},
			{
				"speed",
				7
			}
		}
	},
	["112_32"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"atk",
				2065
			},
			{
				"speed",
				7
			}
		}
	},
	["112_33"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"atk",
				2100
			},
			{
				"speed",
				7
			}
		}
	},
	["112_34"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"atk",
				2135
			},
			{
				"speed",
				7
			}
		}
	},
	["112_35"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"atk",
				2170
			},
			{
				"speed",
				7
			}
		}
	},
	["112_36"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"atk",
				2205
			},
			{
				"speed",
				7
			}
		}
	},
	["112_37"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"atk",
				2240
			},
			{
				"speed",
				7
			}
		}
	},
	["112_38"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"atk",
				2275
			},
			{
				"speed",
				7
			}
		}
	},
	["112_39"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"atk",
				2310
			},
			{
				"speed",
				7
			}
		}
	},
	["112_40"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "【lv.40】恶魔果实基础属性提升20%",
		id = 112,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"atk",
				2585
			},
			{
				"speed",
				8
			}
		}
	},
	["112_41"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"atk",
				2620
			},
			{
				"speed",
				8
			}
		}
	},
	["112_42"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"atk",
				2655
			},
			{
				"speed",
				8
			}
		}
	},
	["112_43"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"atk",
				2690
			},
			{
				"speed",
				8
			}
		}
	},
	["112_44"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"atk",
				2725
			},
			{
				"speed",
				8
			}
		}
	},
	["112_45"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"atk",
				2760
			},
			{
				"speed",
				8
			}
		}
	},
	["112_46"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"atk",
				2795
			},
			{
				"speed",
				8
			}
		}
	},
	["112_47"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"atk",
				2830
			},
			{
				"speed",
				8
			}
		}
	},
	["112_48"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"atk",
				2865
			},
			{
				"speed",
				8
			}
		}
	},
	["112_49"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"atk",
				2900
			},
			{
				"speed",
				8
			}
		}
	},
	["112_50"] = {
		need_star = 4,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"atk",
				2935
			},
			{
				"speed",
				8
			}
		}
	},
	["112_51"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"atk",
				2980
			},
			{
				"speed",
				8
			}
		}
	},
	["112_52"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"atk",
				3025
			},
			{
				"speed",
				8
			}
		}
	},
	["112_53"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"atk",
				3070
			},
			{
				"speed",
				8
			}
		}
	},
	["112_54"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"atk",
				3115
			},
			{
				"speed",
				8
			}
		}
	},
	["112_55"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"atk",
				3160
			},
			{
				"speed",
				8
			}
		}
	},
	["112_56"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"atk",
				3205
			},
			{
				"speed",
				8
			}
		}
	},
	["112_57"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"atk",
				3250
			},
			{
				"speed",
				8
			}
		}
	},
	["112_58"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"atk",
				3295
			},
			{
				"speed",
				8
			}
		}
	},
	["112_59"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"atk",
				3340
			},
			{
				"speed",
				8
			}
		}
	},
	["112_60"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "【lv.60】恶魔果实基础属性提升30%",
		id = 112,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"atk",
				3745
			},
			{
				"speed",
				10
			}
		}
	},
	["112_61"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"atk",
				3790
			},
			{
				"speed",
				10
			}
		}
	},
	["112_62"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"atk",
				3835
			},
			{
				"speed",
				10
			}
		}
	},
	["112_63"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"atk",
				3880
			},
			{
				"speed",
				10
			}
		}
	},
	["112_64"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"atk",
				3925
			},
			{
				"speed",
				10
			}
		}
	},
	["112_65"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"atk",
				3970
			},
			{
				"speed",
				10
			}
		}
	},
	["112_66"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"atk",
				4015
			},
			{
				"speed",
				10
			}
		}
	},
	["112_67"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"atk",
				4060
			},
			{
				"speed",
				10
			}
		}
	},
	["112_68"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"atk",
				4105
			},
			{
				"speed",
				10
			}
		}
	},
	["112_69"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"atk",
				4150
			},
			{
				"speed",
				10
			}
		}
	},
	["112_70"] = {
		need_star = 5,
		name = "蜡蜡果实",
		desc = "",
		id = 112,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"atk",
				4195
			},
			{
				"speed",
				10
			}
		}
	},
	["113_1"] = {
		need_star = 1,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 1,
		need_items = {
			{
				19113,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6000
			},
			{
				"def",
				15
			}
		}
	},
	["113_2"] = {
		need_star = 1,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6125
			},
			{
				"def",
				15
			}
		}
	},
	["113_3"] = {
		need_star = 1,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				6250
			},
			{
				"def",
				15
			}
		}
	},
	["113_4"] = {
		need_star = 1,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				6375
			},
			{
				"def",
				15
			}
		}
	},
	["113_5"] = {
		need_star = 1,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"def",
				15
			}
		}
	},
	["113_6"] = {
		need_star = 1,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				6625
			},
			{
				"def",
				15
			}
		}
	},
	["113_7"] = {
		need_star = 1,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				6750
			},
			{
				"def",
				15
			}
		}
	},
	["113_8"] = {
		need_star = 1,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				6875
			},
			{
				"def",
				15
			}
		}
	},
	["113_9"] = {
		need_star = 1,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				7000
			},
			{
				"def",
				15
			}
		}
	},
	["113_10"] = {
		need_star = 1,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				7125
			},
			{
				"def",
				15
			}
		}
	},
	["113_11"] = {
		need_star = 2,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				7260
			},
			{
				"def",
				15
			}
		}
	},
	["113_12"] = {
		need_star = 2,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				7395
			},
			{
				"def",
				15
			}
		}
	},
	["113_13"] = {
		need_star = 2,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				7530
			},
			{
				"def",
				15
			}
		}
	},
	["113_14"] = {
		need_star = 2,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				7665
			},
			{
				"def",
				15
			}
		}
	},
	["113_15"] = {
		need_star = 2,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				7800
			},
			{
				"def",
				15
			}
		}
	},
	["113_16"] = {
		need_star = 2,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				7935
			},
			{
				"def",
				15
			}
		}
	},
	["113_17"] = {
		need_star = 2,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				8070
			},
			{
				"def",
				15
			}
		}
	},
	["113_18"] = {
		need_star = 2,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				8205
			},
			{
				"def",
				15
			}
		}
	},
	["113_19"] = {
		need_star = 2,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				8340
			},
			{
				"def",
				15
			}
		}
	},
	["113_20"] = {
		need_star = 2,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				8475
			},
			{
				"def",
				15
			}
		}
	},
	["113_21"] = {
		need_star = 3,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				8620
			},
			{
				"def",
				15
			}
		}
	},
	["113_22"] = {
		need_star = 3,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				8765
			},
			{
				"def",
				15
			}
		}
	},
	["113_23"] = {
		need_star = 3,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				8910
			},
			{
				"def",
				15
			}
		}
	},
	["113_24"] = {
		need_star = 3,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				9055
			},
			{
				"def",
				15
			}
		}
	},
	["113_25"] = {
		need_star = 3,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				9200
			},
			{
				"def",
				15
			}
		}
	},
	["113_26"] = {
		need_star = 3,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				9345
			},
			{
				"def",
				15
			}
		}
	},
	["113_27"] = {
		need_star = 3,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				9490
			},
			{
				"def",
				15
			}
		}
	},
	["113_28"] = {
		need_star = 3,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				9635
			},
			{
				"def",
				15
			}
		}
	},
	["113_29"] = {
		need_star = 3,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				9780
			},
			{
				"def",
				15
			}
		}
	},
	["113_30"] = {
		need_star = 3,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				9925
			},
			{
				"def",
				15
			}
		}
	},
	["113_31"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				10085
			},
			{
				"def",
				15
			}
		}
	},
	["113_32"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				10245
			},
			{
				"def",
				15
			}
		}
	},
	["113_33"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				10405
			},
			{
				"def",
				15
			}
		}
	},
	["113_34"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				10565
			},
			{
				"def",
				15
			}
		}
	},
	["113_35"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				10725
			},
			{
				"def",
				15
			}
		}
	},
	["113_36"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				10885
			},
			{
				"def",
				15
			}
		}
	},
	["113_37"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				11045
			},
			{
				"def",
				15
			}
		}
	},
	["113_38"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				11205
			},
			{
				"def",
				15
			}
		}
	},
	["113_39"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				11365
			},
			{
				"def",
				15
			}
		}
	},
	["113_40"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "【lv.40】恶魔果实基础属性提升20%",
		id = 113,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				12725
			},
			{
				"def",
				18
			}
		}
	},
	["113_41"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				12885
			},
			{
				"def",
				18
			}
		}
	},
	["113_42"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				13045
			},
			{
				"def",
				18
			}
		}
	},
	["113_43"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				13205
			},
			{
				"def",
				18
			}
		}
	},
	["113_44"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				13365
			},
			{
				"def",
				18
			}
		}
	},
	["113_45"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				13525
			},
			{
				"def",
				18
			}
		}
	},
	["113_46"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				13685
			},
			{
				"def",
				18
			}
		}
	},
	["113_47"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				13845
			},
			{
				"def",
				18
			}
		}
	},
	["113_48"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				14005
			},
			{
				"def",
				18
			}
		}
	},
	["113_49"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				14165
			},
			{
				"def",
				18
			}
		}
	},
	["113_50"] = {
		need_star = 4,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				14325
			},
			{
				"def",
				18
			}
		}
	},
	["113_51"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				14515
			},
			{
				"def",
				18
			}
		}
	},
	["113_52"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				14705
			},
			{
				"def",
				18
			}
		}
	},
	["113_53"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				14895
			},
			{
				"def",
				18
			}
		}
	},
	["113_54"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				15085
			},
			{
				"def",
				18
			}
		}
	},
	["113_55"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				15275
			},
			{
				"def",
				18
			}
		}
	},
	["113_56"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				15465
			},
			{
				"def",
				18
			}
		}
	},
	["113_57"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				15655
			},
			{
				"def",
				18
			}
		}
	},
	["113_58"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				15845
			},
			{
				"def",
				18
			}
		}
	},
	["113_59"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				16035
			},
			{
				"def",
				18
			}
		}
	},
	["113_60"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "【lv.60】恶魔果实基础属性提升30%",
		id = 113,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				18025
			},
			{
				"def",
				23
			}
		}
	},
	["113_61"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				18215
			},
			{
				"def",
				23
			}
		}
	},
	["113_62"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				18405
			},
			{
				"def",
				23
			}
		}
	},
	["113_63"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				18595
			},
			{
				"def",
				23
			}
		}
	},
	["113_64"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				18785
			},
			{
				"def",
				23
			}
		}
	},
	["113_65"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				18975
			},
			{
				"def",
				23
			}
		}
	},
	["113_66"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				19165
			},
			{
				"def",
				23
			}
		}
	},
	["113_67"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				19355
			},
			{
				"def",
				23
			}
		}
	},
	["113_68"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				19545
			},
			{
				"def",
				23
			}
		}
	},
	["113_69"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				19735
			},
			{
				"def",
				23
			}
		}
	},
	["113_70"] = {
		need_star = 5,
		name = "公斤果实",
		desc = "",
		id = 113,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				19925
			},
			{
				"def",
				23
			}
		}
	},
	["114_1"] = {
		need_star = 1,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 1,
		need_items = {
			{
				19114,
				30
			}
		},
		atts = {
			{
				"atk",
				1200
			},
			{
				"speed",
				7
			}
		}
	},
	["114_2"] = {
		need_star = 1,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"atk",
				1225
			},
			{
				"speed",
				7
			}
		}
	},
	["114_3"] = {
		need_star = 1,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"atk",
				1250
			},
			{
				"speed",
				7
			}
		}
	},
	["114_4"] = {
		need_star = 1,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"atk",
				1275
			},
			{
				"speed",
				7
			}
		}
	},
	["114_5"] = {
		need_star = 1,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"atk",
				1300
			},
			{
				"speed",
				7
			}
		}
	},
	["114_6"] = {
		need_star = 1,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"atk",
				1325
			},
			{
				"speed",
				7
			}
		}
	},
	["114_7"] = {
		need_star = 1,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"atk",
				1350
			},
			{
				"speed",
				7
			}
		}
	},
	["114_8"] = {
		need_star = 1,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"atk",
				1375
			},
			{
				"speed",
				7
			}
		}
	},
	["114_9"] = {
		need_star = 1,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"atk",
				1400
			},
			{
				"speed",
				7
			}
		}
	},
	["114_10"] = {
		need_star = 1,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"atk",
				1425
			},
			{
				"speed",
				7
			}
		}
	},
	["114_11"] = {
		need_star = 2,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"atk",
				1452
			},
			{
				"speed",
				7
			}
		}
	},
	["114_12"] = {
		need_star = 2,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"atk",
				1479
			},
			{
				"speed",
				7
			}
		}
	},
	["114_13"] = {
		need_star = 2,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"atk",
				1506
			},
			{
				"speed",
				7
			}
		}
	},
	["114_14"] = {
		need_star = 2,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"atk",
				1533
			},
			{
				"speed",
				7
			}
		}
	},
	["114_15"] = {
		need_star = 2,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"atk",
				1560
			},
			{
				"speed",
				7
			}
		}
	},
	["114_16"] = {
		need_star = 2,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"atk",
				1587
			},
			{
				"speed",
				7
			}
		}
	},
	["114_17"] = {
		need_star = 2,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"atk",
				1614
			},
			{
				"speed",
				7
			}
		}
	},
	["114_18"] = {
		need_star = 2,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"atk",
				1641
			},
			{
				"speed",
				7
			}
		}
	},
	["114_19"] = {
		need_star = 2,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"atk",
				1668
			},
			{
				"speed",
				7
			}
		}
	},
	["114_20"] = {
		need_star = 2,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"atk",
				1695
			},
			{
				"speed",
				7
			}
		}
	},
	["114_21"] = {
		need_star = 3,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"atk",
				1725
			},
			{
				"speed",
				7
			}
		}
	},
	["114_22"] = {
		need_star = 3,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"atk",
				1755
			},
			{
				"speed",
				7
			}
		}
	},
	["114_23"] = {
		need_star = 3,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"atk",
				1785
			},
			{
				"speed",
				7
			}
		}
	},
	["114_24"] = {
		need_star = 3,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"atk",
				1815
			},
			{
				"speed",
				7
			}
		}
	},
	["114_25"] = {
		need_star = 3,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"atk",
				1845
			},
			{
				"speed",
				7
			}
		}
	},
	["114_26"] = {
		need_star = 3,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"atk",
				1875
			},
			{
				"speed",
				7
			}
		}
	},
	["114_27"] = {
		need_star = 3,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"atk",
				1905
			},
			{
				"speed",
				7
			}
		}
	},
	["114_28"] = {
		need_star = 3,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"atk",
				1935
			},
			{
				"speed",
				7
			}
		}
	},
	["114_29"] = {
		need_star = 3,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"atk",
				1965
			},
			{
				"speed",
				7
			}
		}
	},
	["114_30"] = {
		need_star = 3,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"atk",
				1995
			},
			{
				"speed",
				7
			}
		}
	},
	["114_31"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"atk",
				2030
			},
			{
				"speed",
				7
			}
		}
	},
	["114_32"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"atk",
				2065
			},
			{
				"speed",
				7
			}
		}
	},
	["114_33"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"atk",
				2100
			},
			{
				"speed",
				7
			}
		}
	},
	["114_34"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"atk",
				2135
			},
			{
				"speed",
				7
			}
		}
	},
	["114_35"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"atk",
				2170
			},
			{
				"speed",
				7
			}
		}
	},
	["114_36"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"atk",
				2205
			},
			{
				"speed",
				7
			}
		}
	},
	["114_37"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"atk",
				2240
			},
			{
				"speed",
				7
			}
		}
	},
	["114_38"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"atk",
				2275
			},
			{
				"speed",
				7
			}
		}
	},
	["114_39"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"atk",
				2310
			},
			{
				"speed",
				7
			}
		}
	},
	["114_40"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "【lv.40】恶魔果实基础属性提升20%",
		id = 114,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"atk",
				2585
			},
			{
				"speed",
				8
			}
		}
	},
	["114_41"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"atk",
				2620
			},
			{
				"speed",
				8
			}
		}
	},
	["114_42"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"atk",
				2655
			},
			{
				"speed",
				8
			}
		}
	},
	["114_43"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"atk",
				2690
			},
			{
				"speed",
				8
			}
		}
	},
	["114_44"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"atk",
				2725
			},
			{
				"speed",
				8
			}
		}
	},
	["114_45"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"atk",
				2760
			},
			{
				"speed",
				8
			}
		}
	},
	["114_46"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"atk",
				2795
			},
			{
				"speed",
				8
			}
		}
	},
	["114_47"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"atk",
				2830
			},
			{
				"speed",
				8
			}
		}
	},
	["114_48"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"atk",
				2865
			},
			{
				"speed",
				8
			}
		}
	},
	["114_49"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"atk",
				2900
			},
			{
				"speed",
				8
			}
		}
	},
	["114_50"] = {
		need_star = 4,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"atk",
				2935
			},
			{
				"speed",
				8
			}
		}
	},
	["114_51"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"atk",
				2980
			},
			{
				"speed",
				8
			}
		}
	},
	["114_52"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"atk",
				3025
			},
			{
				"speed",
				8
			}
		}
	},
	["114_53"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"atk",
				3070
			},
			{
				"speed",
				8
			}
		}
	},
	["114_54"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"atk",
				3115
			},
			{
				"speed",
				8
			}
		}
	},
	["114_55"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"atk",
				3160
			},
			{
				"speed",
				8
			}
		}
	},
	["114_56"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"atk",
				3205
			},
			{
				"speed",
				8
			}
		}
	},
	["114_57"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"atk",
				3250
			},
			{
				"speed",
				8
			}
		}
	},
	["114_58"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"atk",
				3295
			},
			{
				"speed",
				8
			}
		}
	},
	["114_59"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"atk",
				3340
			},
			{
				"speed",
				8
			}
		}
	},
	["114_60"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "【lv.60】恶魔果实基础属性提升30%",
		id = 114,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"atk",
				3745
			},
			{
				"speed",
				10
			}
		}
	},
	["114_61"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"atk",
				3790
			},
			{
				"speed",
				10
			}
		}
	},
	["114_62"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"atk",
				3835
			},
			{
				"speed",
				10
			}
		}
	},
	["114_63"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"atk",
				3880
			},
			{
				"speed",
				10
			}
		}
	},
	["114_64"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"atk",
				3925
			},
			{
				"speed",
				10
			}
		}
	},
	["114_65"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"atk",
				3970
			},
			{
				"speed",
				10
			}
		}
	},
	["114_66"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"atk",
				4015
			},
			{
				"speed",
				10
			}
		}
	},
	["114_67"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"atk",
				4060
			},
			{
				"speed",
				10
			}
		}
	},
	["114_68"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"atk",
				4105
			},
			{
				"speed",
				10
			}
		}
	},
	["114_69"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"atk",
				4150
			},
			{
				"speed",
				10
			}
		}
	},
	["114_70"] = {
		need_star = 5,
		name = "幻影果实",
		desc = "",
		id = 114,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"atk",
				4195
			},
			{
				"speed",
				10
			}
		}
	},
	["115_1"] = {
		need_star = 1,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 1,
		need_items = {
			{
				19115,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6000
			},
			{
				"def",
				15
			}
		}
	},
	["115_2"] = {
		need_star = 1,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 2,
		need_items = {
			{
				1,
				55000
			},
			{
				19502,
				30
			}
		},
		atts = {
			{
				"hp_max",
				6125
			},
			{
				"def",
				15
			}
		}
	},
	["115_3"] = {
		need_star = 1,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 3,
		need_items = {
			{
				1,
				60000
			},
			{
				19502,
				32
			}
		},
		atts = {
			{
				"hp_max",
				6250
			},
			{
				"def",
				15
			}
		}
	},
	["115_4"] = {
		need_star = 1,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 4,
		need_items = {
			{
				1,
				65000
			},
			{
				19502,
				34
			}
		},
		atts = {
			{
				"hp_max",
				6375
			},
			{
				"def",
				15
			}
		}
	},
	["115_5"] = {
		need_star = 1,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 5,
		need_items = {
			{
				1,
				70000
			},
			{
				19502,
				36
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"def",
				15
			}
		}
	},
	["115_6"] = {
		need_star = 1,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 6,
		need_items = {
			{
				1,
				75000
			},
			{
				19502,
				38
			}
		},
		atts = {
			{
				"hp_max",
				6625
			},
			{
				"def",
				15
			}
		}
	},
	["115_7"] = {
		need_star = 1,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 7,
		need_items = {
			{
				1,
				80000
			},
			{
				19502,
				40
			}
		},
		atts = {
			{
				"hp_max",
				6750
			},
			{
				"def",
				15
			}
		}
	},
	["115_8"] = {
		need_star = 1,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 8,
		need_items = {
			{
				1,
				85000
			},
			{
				19502,
				42
			}
		},
		atts = {
			{
				"hp_max",
				6875
			},
			{
				"def",
				15
			}
		}
	},
	["115_9"] = {
		need_star = 1,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 9,
		need_items = {
			{
				1,
				90000
			},
			{
				19502,
				44
			}
		},
		atts = {
			{
				"hp_max",
				7000
			},
			{
				"def",
				15
			}
		}
	},
	["115_10"] = {
		need_star = 1,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 10,
		need_items = {
			{
				1,
				95000
			},
			{
				19502,
				46
			}
		},
		atts = {
			{
				"hp_max",
				7125
			},
			{
				"def",
				15
			}
		}
	},
	["115_11"] = {
		need_star = 2,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 11,
		need_items = {
			{
				1,
				100000
			},
			{
				19502,
				50
			}
		},
		atts = {
			{
				"hp_max",
				7260
			},
			{
				"def",
				15
			}
		}
	},
	["115_12"] = {
		need_star = 2,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 12,
		need_items = {
			{
				1,
				105000
			},
			{
				19502,
				52
			}
		},
		atts = {
			{
				"hp_max",
				7395
			},
			{
				"def",
				15
			}
		}
	},
	["115_13"] = {
		need_star = 2,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 13,
		need_items = {
			{
				1,
				110000
			},
			{
				19502,
				54
			}
		},
		atts = {
			{
				"hp_max",
				7530
			},
			{
				"def",
				15
			}
		}
	},
	["115_14"] = {
		need_star = 2,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 14,
		need_items = {
			{
				1,
				115000
			},
			{
				19502,
				56
			}
		},
		atts = {
			{
				"hp_max",
				7665
			},
			{
				"def",
				15
			}
		}
	},
	["115_15"] = {
		need_star = 2,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 15,
		need_items = {
			{
				1,
				120000
			},
			{
				19502,
				58
			}
		},
		atts = {
			{
				"hp_max",
				7800
			},
			{
				"def",
				15
			}
		}
	},
	["115_16"] = {
		need_star = 2,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 16,
		need_items = {
			{
				1,
				125000
			},
			{
				19502,
				60
			}
		},
		atts = {
			{
				"hp_max",
				7935
			},
			{
				"def",
				15
			}
		}
	},
	["115_17"] = {
		need_star = 2,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 17,
		need_items = {
			{
				1,
				130000
			},
			{
				19502,
				62
			}
		},
		atts = {
			{
				"hp_max",
				8070
			},
			{
				"def",
				15
			}
		}
	},
	["115_18"] = {
		need_star = 2,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 18,
		need_items = {
			{
				1,
				135000
			},
			{
				19502,
				64
			}
		},
		atts = {
			{
				"hp_max",
				8205
			},
			{
				"def",
				15
			}
		}
	},
	["115_19"] = {
		need_star = 2,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 19,
		need_items = {
			{
				1,
				140000
			},
			{
				19502,
				66
			}
		},
		atts = {
			{
				"hp_max",
				8340
			},
			{
				"def",
				15
			}
		}
	},
	["115_20"] = {
		need_star = 2,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 20,
		need_items = {
			{
				1,
				145000
			},
			{
				19502,
				68
			}
		},
		atts = {
			{
				"hp_max",
				8475
			},
			{
				"def",
				15
			}
		}
	},
	["115_21"] = {
		need_star = 3,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 21,
		need_items = {
			{
				1,
				150000
			},
			{
				19502,
				70
			}
		},
		atts = {
			{
				"hp_max",
				8620
			},
			{
				"def",
				15
			}
		}
	},
	["115_22"] = {
		need_star = 3,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 22,
		need_items = {
			{
				1,
				155000
			},
			{
				19502,
				72
			}
		},
		atts = {
			{
				"hp_max",
				8765
			},
			{
				"def",
				15
			}
		}
	},
	["115_23"] = {
		need_star = 3,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 23,
		need_items = {
			{
				1,
				160000
			},
			{
				19502,
				74
			}
		},
		atts = {
			{
				"hp_max",
				8910
			},
			{
				"def",
				15
			}
		}
	},
	["115_24"] = {
		need_star = 3,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 24,
		need_items = {
			{
				1,
				165000
			},
			{
				19502,
				76
			}
		},
		atts = {
			{
				"hp_max",
				9055
			},
			{
				"def",
				15
			}
		}
	},
	["115_25"] = {
		need_star = 3,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 25,
		need_items = {
			{
				1,
				170000
			},
			{
				19502,
				78
			}
		},
		atts = {
			{
				"hp_max",
				9200
			},
			{
				"def",
				15
			}
		}
	},
	["115_26"] = {
		need_star = 3,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 26,
		need_items = {
			{
				1,
				175000
			},
			{
				19502,
				80
			}
		},
		atts = {
			{
				"hp_max",
				9345
			},
			{
				"def",
				15
			}
		}
	},
	["115_27"] = {
		need_star = 3,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 27,
		need_items = {
			{
				1,
				180000
			},
			{
				19502,
				82
			}
		},
		atts = {
			{
				"hp_max",
				9490
			},
			{
				"def",
				15
			}
		}
	},
	["115_28"] = {
		need_star = 3,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 28,
		need_items = {
			{
				1,
				185000
			},
			{
				19502,
				84
			}
		},
		atts = {
			{
				"hp_max",
				9635
			},
			{
				"def",
				15
			}
		}
	},
	["115_29"] = {
		need_star = 3,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 29,
		need_items = {
			{
				1,
				190000
			},
			{
				19502,
				86
			}
		},
		atts = {
			{
				"hp_max",
				9780
			},
			{
				"def",
				15
			}
		}
	},
	["115_30"] = {
		need_star = 3,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 30,
		need_items = {
			{
				1,
				195000
			},
			{
				19502,
				88
			}
		},
		atts = {
			{
				"hp_max",
				9925
			},
			{
				"def",
				15
			}
		}
	},
	["115_31"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 31,
		need_items = {
			{
				1,
				200000
			},
			{
				19502,
				90
			}
		},
		atts = {
			{
				"hp_max",
				10085
			},
			{
				"def",
				15
			}
		}
	},
	["115_32"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 32,
		need_items = {
			{
				1,
				205000
			},
			{
				19502,
				93
			}
		},
		atts = {
			{
				"hp_max",
				10245
			},
			{
				"def",
				15
			}
		}
	},
	["115_33"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 33,
		need_items = {
			{
				1,
				210000
			},
			{
				19502,
				96
			}
		},
		atts = {
			{
				"hp_max",
				10405
			},
			{
				"def",
				15
			}
		}
	},
	["115_34"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 34,
		need_items = {
			{
				1,
				215000
			},
			{
				19502,
				99
			}
		},
		atts = {
			{
				"hp_max",
				10565
			},
			{
				"def",
				15
			}
		}
	},
	["115_35"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 35,
		need_items = {
			{
				1,
				220000
			},
			{
				19502,
				102
			}
		},
		atts = {
			{
				"hp_max",
				10725
			},
			{
				"def",
				15
			}
		}
	},
	["115_36"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 36,
		need_items = {
			{
				1,
				225000
			},
			{
				19502,
				105
			}
		},
		atts = {
			{
				"hp_max",
				10885
			},
			{
				"def",
				15
			}
		}
	},
	["115_37"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 37,
		need_items = {
			{
				1,
				230000
			},
			{
				19502,
				108
			}
		},
		atts = {
			{
				"hp_max",
				11045
			},
			{
				"def",
				15
			}
		}
	},
	["115_38"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 38,
		need_items = {
			{
				1,
				235000
			},
			{
				19502,
				111
			}
		},
		atts = {
			{
				"hp_max",
				11205
			},
			{
				"def",
				15
			}
		}
	},
	["115_39"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 39,
		need_items = {
			{
				1,
				240000
			},
			{
				19502,
				114
			}
		},
		atts = {
			{
				"hp_max",
				11365
			},
			{
				"def",
				15
			}
		}
	},
	["115_40"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "【lv.40】恶魔果实基础属性提升20%",
		id = 115,
		level = 40,
		need_items = {
			{
				1,
				245000
			},
			{
				19502,
				117
			}
		},
		atts = {
			{
				"hp_max",
				12725
			},
			{
				"def",
				18
			}
		}
	},
	["115_41"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 41,
		need_items = {
			{
				1,
				250000
			},
			{
				19502,
				120
			}
		},
		atts = {
			{
				"hp_max",
				12885
			},
			{
				"def",
				18
			}
		}
	},
	["115_42"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 42,
		need_items = {
			{
				1,
				255000
			},
			{
				19502,
				123
			}
		},
		atts = {
			{
				"hp_max",
				13045
			},
			{
				"def",
				18
			}
		}
	},
	["115_43"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 43,
		need_items = {
			{
				1,
				260000
			},
			{
				19502,
				126
			}
		},
		atts = {
			{
				"hp_max",
				13205
			},
			{
				"def",
				18
			}
		}
	},
	["115_44"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 44,
		need_items = {
			{
				1,
				265000
			},
			{
				19502,
				129
			}
		},
		atts = {
			{
				"hp_max",
				13365
			},
			{
				"def",
				18
			}
		}
	},
	["115_45"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 45,
		need_items = {
			{
				1,
				270000
			},
			{
				19502,
				132
			}
		},
		atts = {
			{
				"hp_max",
				13525
			},
			{
				"def",
				18
			}
		}
	},
	["115_46"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 46,
		need_items = {
			{
				1,
				275000
			},
			{
				19502,
				135
			}
		},
		atts = {
			{
				"hp_max",
				13685
			},
			{
				"def",
				18
			}
		}
	},
	["115_47"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 47,
		need_items = {
			{
				1,
				280000
			},
			{
				19502,
				138
			}
		},
		atts = {
			{
				"hp_max",
				13845
			},
			{
				"def",
				18
			}
		}
	},
	["115_48"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 48,
		need_items = {
			{
				1,
				285000
			},
			{
				19502,
				141
			}
		},
		atts = {
			{
				"hp_max",
				14005
			},
			{
				"def",
				18
			}
		}
	},
	["115_49"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 49,
		need_items = {
			{
				1,
				290000
			},
			{
				19502,
				144
			}
		},
		atts = {
			{
				"hp_max",
				14165
			},
			{
				"def",
				18
			}
		}
	},
	["115_50"] = {
		need_star = 4,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 50,
		need_items = {
			{
				1,
				295000
			},
			{
				19502,
				147
			}
		},
		atts = {
			{
				"hp_max",
				14325
			},
			{
				"def",
				18
			}
		}
	},
	["115_51"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 51,
		need_items = {
			{
				1,
				300000
			},
			{
				19502,
				150
			}
		},
		atts = {
			{
				"hp_max",
				14515
			},
			{
				"def",
				18
			}
		}
	},
	["115_52"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 52,
		need_items = {
			{
				1,
				305000
			},
			{
				19502,
				153
			}
		},
		atts = {
			{
				"hp_max",
				14705
			},
			{
				"def",
				18
			}
		}
	},
	["115_53"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 53,
		need_items = {
			{
				1,
				310000
			},
			{
				19502,
				156
			}
		},
		atts = {
			{
				"hp_max",
				14895
			},
			{
				"def",
				18
			}
		}
	},
	["115_54"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 54,
		need_items = {
			{
				1,
				315000
			},
			{
				19502,
				159
			}
		},
		atts = {
			{
				"hp_max",
				15085
			},
			{
				"def",
				18
			}
		}
	},
	["115_55"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 55,
		need_items = {
			{
				1,
				320000
			},
			{
				19502,
				162
			}
		},
		atts = {
			{
				"hp_max",
				15275
			},
			{
				"def",
				18
			}
		}
	},
	["115_56"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 56,
		need_items = {
			{
				1,
				325000
			},
			{
				19502,
				165
			}
		},
		atts = {
			{
				"hp_max",
				15465
			},
			{
				"def",
				18
			}
		}
	},
	["115_57"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 57,
		need_items = {
			{
				1,
				330000
			},
			{
				19502,
				168
			}
		},
		atts = {
			{
				"hp_max",
				15655
			},
			{
				"def",
				18
			}
		}
	},
	["115_58"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 58,
		need_items = {
			{
				1,
				335000
			},
			{
				19502,
				171
			}
		},
		atts = {
			{
				"hp_max",
				15845
			},
			{
				"def",
				18
			}
		}
	},
	["115_59"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 59,
		need_items = {
			{
				1,
				340000
			},
			{
				19502,
				174
			}
		},
		atts = {
			{
				"hp_max",
				16035
			},
			{
				"def",
				18
			}
		}
	},
	["115_60"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "【lv.60】恶魔果实基础属性提升30%",
		id = 115,
		level = 60,
		need_items = {
			{
				1,
				345000
			},
			{
				19502,
				177
			}
		},
		atts = {
			{
				"hp_max",
				18025
			},
			{
				"def",
				23
			}
		}
	},
	["115_61"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 61,
		need_items = {
			{
				1,
				350000
			},
			{
				19502,
				180
			}
		},
		atts = {
			{
				"hp_max",
				18215
			},
			{
				"def",
				23
			}
		}
	},
	["115_62"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 62,
		need_items = {
			{
				1,
				355000
			},
			{
				19502,
				184
			}
		},
		atts = {
			{
				"hp_max",
				18405
			},
			{
				"def",
				23
			}
		}
	},
	["115_63"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 63,
		need_items = {
			{
				1,
				360000
			},
			{
				19502,
				188
			}
		},
		atts = {
			{
				"hp_max",
				18595
			},
			{
				"def",
				23
			}
		}
	},
	["115_64"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 64,
		need_items = {
			{
				1,
				365000
			},
			{
				19502,
				192
			}
		},
		atts = {
			{
				"hp_max",
				18785
			},
			{
				"def",
				23
			}
		}
	},
	["115_65"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 65,
		need_items = {
			{
				1,
				370000
			},
			{
				19502,
				196
			}
		},
		atts = {
			{
				"hp_max",
				18975
			},
			{
				"def",
				23
			}
		}
	},
	["115_66"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 66,
		need_items = {
			{
				1,
				375000
			},
			{
				19502,
				200
			}
		},
		atts = {
			{
				"hp_max",
				19165
			},
			{
				"def",
				23
			}
		}
	},
	["115_67"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 67,
		need_items = {
			{
				1,
				380000
			},
			{
				19502,
				204
			}
		},
		atts = {
			{
				"hp_max",
				19355
			},
			{
				"def",
				23
			}
		}
	},
	["115_68"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 68,
		need_items = {
			{
				1,
				385000
			},
			{
				19502,
				208
			}
		},
		atts = {
			{
				"hp_max",
				19545
			},
			{
				"def",
				23
			}
		}
	},
	["115_69"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 69,
		need_items = {
			{
				1,
				390000
			},
			{
				19502,
				212
			}
		},
		atts = {
			{
				"hp_max",
				19735
			},
			{
				"def",
				23
			}
		}
	},
	["115_70"] = {
		need_star = 5,
		name = "吞吞果实",
		desc = "",
		id = 115,
		level = 70,
		need_items = {
			{
				1,
				395000
			},
			{
				19502,
				216
			}
		},
		atts = {
			{
				"hp_max",
				19925
			},
			{
				"def",
				23
			}
		}
	}
}

function Config.EmoguoshitujianData.data_get_emoguoshitujian_level_fun(slot0)
	slot1 = Config.EmoguoshitujianData.data_get_emoguoshitujian_level[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.EmoguoshitujianData.data_get_emoguoshitujian_level[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.EmoguoshitujianData.data_get_emoguoshitujian_star_length = 171
Config.EmoguoshitujianData.data_get_emoguoshitujian_star = {
	["1_1"] = {
		effect = "zhenying",
		name = "冰冻果实",
		max_level = 10,
		star = 1,
		desc = "【1星】水系伙伴，对克制单位造成的伤害+3%",
		id = 1,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {},
		effect_param = {
			{
				1,
				2,
				30
			}
		}
	},
	["1_2"] = {
		effect = "zhenying",
		name = "冰冻果实",
		max_level = 20,
		star = 2,
		desc = "【2星】水系伙伴，对克制单位造成的伤害+3.5%",
		id = 1,
		need_items = {
			{
				19001,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				4000
			},
			{
				"speed",
				5
			}
		},
		effect_cond = {},
		effect_param = {
			{
				1,
				2,
				35
			}
		}
	},
	["1_3"] = {
		effect = "zhenying",
		name = "冰冻果实",
		max_level = 30,
		star = 3,
		desc = "【3星】水系伙伴，对克制单位造成的伤害+4%",
		id = 1,
		need_items = {
			{
				19001,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				8500
			},
			{
				"speed",
				10
			}
		},
		effect_cond = {},
		effect_param = {
			{
				1,
				2,
				40
			}
		}
	},
	["1_4"] = {
		effect = "zhenying",
		name = "冰冻果实",
		max_level = 50,
		star = 4,
		desc = "【4星】水系伙伴，对克制单位造成的伤害+4.5%",
		id = 1,
		need_items = {
			{
				19001,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				13500
			},
			{
				"speed",
				15
			}
		},
		effect_cond = {},
		effect_param = {
			{
				1,
				2,
				45
			}
		}
	},
	["1_5"] = {
		effect = "zhenying",
		name = "冰冻果实",
		max_level = 70,
		star = 5,
		desc = "【5星】水系伙伴，对克制单位造成的伤害+5%",
		id = 1,
		need_items = {
			{
				19001,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				19000
			},
			{
				"speed",
				20
			}
		},
		effect_cond = {},
		effect_param = {
			{
				1,
				2,
				50
			}
		}
	},
	["1_6"] = {
		effect = "zhenying",
		name = "冰冻果实",
		max_level = 100,
		star = 6,
		desc = "【6星】水系伙伴，对克制单位造成的伤害+6%",
		id = 1,
		need_items = {
			{
				19001,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"hp_max",
				25000
			},
			{
				"speed",
				25
			}
		},
		effect_cond = {},
		effect_param = {
			{
				1,
				2,
				60
			}
		}
	},
	["2_1"] = {
		effect = "zhenying",
		name = "烧烧果实",
		max_level = 10,
		star = 1,
		desc = "【1星】火系伙伴，对克制单位造成的伤害+3%",
		id = 2,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {},
		effect_param = {
			{
				2,
				3,
				30
			}
		}
	},
	["2_2"] = {
		effect = "zhenying",
		name = "烧烧果实",
		max_level = 20,
		star = 2,
		desc = "【2星】火系伙伴，对克制单位造成的伤害+3.5%",
		id = 2,
		need_items = {
			{
				19002,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"atk",
				800
			},
			{
				"def",
				12
			}
		},
		effect_cond = {},
		effect_param = {
			{
				2,
				3,
				35
			}
		}
	},
	["2_3"] = {
		effect = "zhenying",
		name = "烧烧果实",
		max_level = 30,
		star = 3,
		desc = "【3星】火系伙伴，对克制单位造成的伤害+4%",
		id = 2,
		need_items = {
			{
				19002,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"atk",
				1700
			},
			{
				"def",
				24
			}
		},
		effect_cond = {},
		effect_param = {
			{
				2,
				3,
				40
			}
		}
	},
	["2_4"] = {
		effect = "zhenying",
		name = "烧烧果实",
		max_level = 50,
		star = 4,
		desc = "【4星】火系伙伴，对克制单位造成的伤害+4.5%",
		id = 2,
		need_items = {
			{
				19002,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"atk",
				2700
			},
			{
				"def",
				36
			}
		},
		effect_cond = {},
		effect_param = {
			{
				2,
				3,
				45
			}
		}
	},
	["2_5"] = {
		effect = "zhenying",
		name = "烧烧果实",
		max_level = 70,
		star = 5,
		desc = "【5星】火系伙伴，对克制单位造成的伤害+5%",
		id = 2,
		need_items = {
			{
				19002,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"atk",
				3800
			},
			{
				"def",
				48
			}
		},
		effect_cond = {},
		effect_param = {
			{
				2,
				3,
				50
			}
		}
	},
	["2_6"] = {
		effect = "zhenying",
		name = "烧烧果实",
		max_level = 100,
		star = 6,
		desc = "【6星】火系伙伴，对克制单位造成的伤害+6%",
		id = 2,
		need_items = {
			{
				19002,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"atk",
				5000
			},
			{
				"def",
				60
			}
		},
		effect_cond = {},
		effect_param = {
			{
				2,
				3,
				60
			}
		}
	},
	["3_1"] = {
		effect = "zhenying",
		name = "沙沙果实",
		max_level = 10,
		star = 1,
		desc = "【1星】风系伙伴，对克制单位造成的伤害+3%",
		id = 3,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {},
		effect_param = {
			{
				3,
				1,
				30
			}
		}
	},
	["3_2"] = {
		effect = "zhenying",
		name = "沙沙果实",
		max_level = 20,
		star = 2,
		desc = "【2星】风系伙伴，对克制单位造成的伤害+3.5%",
		id = 3,
		need_items = {
			{
				19003,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"atk",
				800
			},
			{
				"speed",
				5
			}
		},
		effect_cond = {},
		effect_param = {
			{
				3,
				1,
				35
			}
		}
	},
	["3_3"] = {
		effect = "zhenying",
		name = "沙沙果实",
		max_level = 30,
		star = 3,
		desc = "【3星】风系伙伴，对克制单位造成的伤害+4%",
		id = 3,
		need_items = {
			{
				19003,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"atk",
				1700
			},
			{
				"speed",
				10
			}
		},
		effect_cond = {},
		effect_param = {
			{
				3,
				1,
				40
			}
		}
	},
	["3_4"] = {
		effect = "zhenying",
		name = "沙沙果实",
		max_level = 50,
		star = 4,
		desc = "【4星】风系伙伴，对克制单位造成的伤害+4.5%",
		id = 3,
		need_items = {
			{
				19003,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"atk",
				2700
			},
			{
				"speed",
				15
			}
		},
		effect_cond = {},
		effect_param = {
			{
				3,
				1,
				45
			}
		}
	},
	["3_5"] = {
		effect = "zhenying",
		name = "沙沙果实",
		max_level = 70,
		star = 5,
		desc = "【5星】风系伙伴，对克制单位造成的伤害+5%",
		id = 3,
		need_items = {
			{
				19003,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"atk",
				3800
			},
			{
				"speed",
				20
			}
		},
		effect_cond = {},
		effect_param = {
			{
				3,
				1,
				50
			}
		}
	},
	["3_6"] = {
		effect = "zhenying",
		name = "沙沙果实",
		max_level = 100,
		star = 6,
		desc = "【6星】风系伙伴，对克制单位造成的伤害+6%",
		id = 3,
		need_items = {
			{
				19003,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"atk",
				5000
			},
			{
				"speed",
				25
			}
		},
		effect_cond = {},
		effect_param = {
			{
				3,
				1,
				60
			}
		}
	},
	["4_1"] = {
		effect = "zhenying",
		name = "闪闪果实",
		max_level = 10,
		star = 1,
		desc = "【1星】光系伙伴，对克制单位造成的伤害+3%",
		id = 4,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {},
		effect_param = {
			{
				4,
				5,
				30
			}
		}
	},
	["4_2"] = {
		effect = "zhenying",
		name = "闪闪果实",
		max_level = 20,
		star = 2,
		desc = "【2星】光系伙伴，对克制单位造成的伤害+3.5%",
		id = 4,
		need_items = {
			{
				19004,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				4000
			},
			{
				"def",
				12
			}
		},
		effect_cond = {},
		effect_param = {
			{
				4,
				5,
				35
			}
		}
	},
	["4_3"] = {
		effect = "zhenying",
		name = "闪闪果实",
		max_level = 30,
		star = 3,
		desc = "【3星】光系伙伴，对克制单位造成的伤害+4%",
		id = 4,
		need_items = {
			{
				19004,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				8500
			},
			{
				"def",
				24
			}
		},
		effect_cond = {},
		effect_param = {
			{
				4,
				5,
				40
			}
		}
	},
	["4_4"] = {
		effect = "zhenying",
		name = "闪闪果实",
		max_level = 50,
		star = 4,
		desc = "【4星】光系伙伴，对克制单位造成的伤害+4.5%",
		id = 4,
		need_items = {
			{
				19004,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				13500
			},
			{
				"def",
				36
			}
		},
		effect_cond = {},
		effect_param = {
			{
				4,
				5,
				45
			}
		}
	},
	["4_5"] = {
		effect = "zhenying",
		name = "闪闪果实",
		max_level = 70,
		star = 5,
		desc = "【5星】光系伙伴，对克制单位造成的伤害+5%",
		id = 4,
		need_items = {
			{
				19004,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				19000
			},
			{
				"def",
				48
			}
		},
		effect_cond = {},
		effect_param = {
			{
				4,
				5,
				50
			}
		}
	},
	["4_6"] = {
		effect = "zhenying",
		name = "闪闪果实",
		max_level = 100,
		star = 6,
		desc = "【6星】光系伙伴，对克制单位造成的伤害+6%",
		id = 4,
		need_items = {
			{
				19004,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"hp_max",
				25000
			},
			{
				"def",
				60
			}
		},
		effect_cond = {},
		effect_param = {
			{
				4,
				5,
				60
			}
		}
	},
	["5_1"] = {
		effect = "zhenying",
		name = "暗暗果实",
		max_level = 10,
		star = 1,
		desc = "【1星】暗系伙伴，对克制单位造成的伤害+3%",
		id = 5,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {},
		effect_param = {
			{
				5,
				4,
				30
			}
		}
	},
	["5_2"] = {
		effect = "zhenying",
		name = "暗暗果实",
		max_level = 20,
		star = 2,
		desc = "【2星】暗系伙伴，对克制单位造成的伤害+3.5%",
		id = 5,
		need_items = {
			{
				19005,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"atk",
				800
			},
			{
				"def",
				12
			}
		},
		effect_cond = {},
		effect_param = {
			{
				5,
				4,
				35
			}
		}
	},
	["5_3"] = {
		effect = "zhenying",
		name = "暗暗果实",
		max_level = 30,
		star = 3,
		desc = "【3星】暗系伙伴，对克制单位造成的伤害+4%",
		id = 5,
		need_items = {
			{
				19005,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"atk",
				1700
			},
			{
				"def",
				24
			}
		},
		effect_cond = {},
		effect_param = {
			{
				5,
				4,
				40
			}
		}
	},
	["5_4"] = {
		effect = "zhenying",
		name = "暗暗果实",
		max_level = 50,
		star = 4,
		desc = "【4星】暗系伙伴，对克制单位造成的伤害+4.5%",
		id = 5,
		need_items = {
			{
				19005,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"atk",
				2700
			},
			{
				"def",
				36
			}
		},
		effect_cond = {},
		effect_param = {
			{
				5,
				4,
				45
			}
		}
	},
	["5_5"] = {
		effect = "zhenying",
		name = "暗暗果实",
		max_level = 70,
		star = 5,
		desc = "【5星】暗系伙伴，对克制单位造成的伤害+5%",
		id = 5,
		need_items = {
			{
				19005,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"atk",
				3800
			},
			{
				"def",
				48
			}
		},
		effect_cond = {},
		effect_param = {
			{
				5,
				4,
				50
			}
		}
	},
	["5_6"] = {
		effect = "zhenying",
		name = "暗暗果实",
		max_level = 100,
		star = 6,
		desc = "【6星】暗系伙伴，对克制单位造成的伤害+6%",
		id = 5,
		need_items = {
			{
				19005,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"atk",
				5000
			},
			{
				"def",
				60
			}
		},
		effect_cond = {},
		effect_param = {
			{
				5,
				4,
				60
			}
		}
	},
	["6_1"] = {
		effect = "add_att",
		name = "岩浆果实",
		max_level = 10,
		star = 1,
		desc = "【1星】每通关100层试练塔，全体伙伴伤害加成+0.1%",
		id = 6,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"slzt",
			100,
			900
		},
		effect_param = {
			{
				"dam",
				1
			}
		}
	},
	["6_2"] = {
		effect = "add_att",
		name = "岩浆果实",
		max_level = 20,
		star = 2,
		desc = "【2星】每通关100层试练塔，全体伙伴伤害加成+0.2%",
		id = 6,
		need_items = {
			{
				19006,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				4000
			},
			{
				"def",
				12
			}
		},
		effect_cond = {
			"slzt",
			100,
			900
		},
		effect_param = {
			{
				"dam",
				2
			}
		}
	},
	["6_3"] = {
		effect = "add_att",
		name = "岩浆果实",
		max_level = 30,
		star = 3,
		desc = "【3星】每通关100层试练塔，全体伙伴伤害加成+0.3%",
		id = 6,
		need_items = {
			{
				19006,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				8500
			},
			{
				"def",
				24
			}
		},
		effect_cond = {
			"slzt",
			100,
			900
		},
		effect_param = {
			{
				"dam",
				3
			}
		}
	},
	["6_4"] = {
		effect = "add_att",
		name = "岩浆果实",
		max_level = 50,
		star = 4,
		desc = "【4星】每通关100层试练塔，全体伙伴伤害加成+0.4%",
		id = 6,
		need_items = {
			{
				19006,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				13500
			},
			{
				"def",
				36
			}
		},
		effect_cond = {
			"slzt",
			100,
			900
		},
		effect_param = {
			{
				"dam",
				4
			}
		}
	},
	["6_5"] = {
		effect = "add_att",
		name = "岩浆果实",
		max_level = 70,
		star = 5,
		desc = "【5星】每通关100层试练塔，全体伙伴伤害加成+0.5%",
		id = 6,
		need_items = {
			{
				19006,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				19000
			},
			{
				"def",
				48
			}
		},
		effect_cond = {
			"slzt",
			100,
			900
		},
		effect_param = {
			{
				"dam",
				5
			}
		}
	},
	["6_6"] = {
		effect = "add_att",
		name = "岩浆果实",
		max_level = 100,
		star = 6,
		desc = "【6星】每通关100层试练塔，全体伙伴伤害加成+0.6%",
		id = 6,
		need_items = {
			{
				19006,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"hp_max",
				25000
			},
			{
				"def",
				60
			}
		},
		effect_cond = {
			"slzt",
			100,
			900
		},
		effect_param = {
			{
				"dam",
				6
			}
		}
	},
	["7_1"] = {
		effect = "add_att",
		name = "橡胶果实",
		max_level = 10,
		star = 1,
		desc = "【1星】全体伙伴伤害减免+2%",
		id = 7,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {},
		effect_param = {
			{
				"res",
				20
			}
		}
	},
	["7_2"] = {
		effect = "add_att",
		name = "橡胶果实",
		max_level = 20,
		star = 2,
		desc = "【2星】全体伙伴伤害减免+2.5%",
		id = 7,
		need_items = {
			{
				19007,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"atk",
				800
			},
			{
				"def",
				12
			}
		},
		effect_cond = {},
		effect_param = {
			{
				"res",
				25
			}
		}
	},
	["7_3"] = {
		effect = "add_att",
		name = "橡胶果实",
		max_level = 30,
		star = 3,
		desc = "【3星】全体伙伴伤害减免+3%",
		id = 7,
		need_items = {
			{
				19007,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"atk",
				1700
			},
			{
				"def",
				24
			}
		},
		effect_cond = {},
		effect_param = {
			{
				"res",
				30
			}
		}
	},
	["7_4"] = {
		effect = "add_att",
		name = "橡胶果实",
		max_level = 50,
		star = 4,
		desc = "【4星】全体伙伴伤害减免+3.5%",
		id = 7,
		need_items = {
			{
				19007,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"atk",
				2700
			},
			{
				"def",
				36
			}
		},
		effect_cond = {},
		effect_param = {
			{
				"res",
				35
			}
		}
	},
	["7_5"] = {
		effect = "add_att",
		name = "橡胶果实",
		max_level = 70,
		star = 5,
		desc = "【5星】全体伙伴伤害减免+4%",
		id = 7,
		need_items = {
			{
				19007,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"atk",
				3800
			},
			{
				"def",
				48
			}
		},
		effect_cond = {},
		effect_param = {
			{
				"res",
				40
			}
		}
	},
	["7_6"] = {
		effect = "add_att",
		name = "橡胶果实",
		max_level = 100,
		star = 6,
		desc = "【6星】全体伙伴伤害减免+5%",
		id = 7,
		need_items = {
			{
				19007,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"atk",
				5000
			},
			{
				"def",
				60
			}
		},
		effect_cond = {},
		effect_param = {
			{
				"res",
				50
			}
		}
	},
	["8_1"] = {
		effect = "skill",
		name = "震震果实",
		max_level = 10,
		star = 1,
		desc = "【1星】战斗中，全体伙伴攻击时无视目标200点防御",
		id = 8,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {},
		effect_param = {
			1010001
		}
	},
	["8_2"] = {
		effect = "skill",
		name = "震震果实",
		max_level = 20,
		star = 2,
		desc = "【2星】战斗中，全体伙伴攻击时无视目标300点防御",
		id = 8,
		need_items = {
			{
				19008,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				4000
			},
			{
				"def",
				12
			}
		},
		effect_cond = {},
		effect_param = {
			1010002
		}
	},
	["8_3"] = {
		effect = "skill",
		name = "震震果实",
		max_level = 30,
		star = 3,
		desc = "【3星】战斗中，全体伙伴攻击时无视目标400点防御",
		id = 8,
		need_items = {
			{
				19008,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				8500
			},
			{
				"def",
				24
			}
		},
		effect_cond = {},
		effect_param = {
			1010003
		}
	},
	["8_4"] = {
		effect = "skill",
		name = "震震果实",
		max_level = 50,
		star = 4,
		desc = "【4星】战斗中，全体伙伴攻击时无视目标（3%+500）点防御",
		id = 8,
		need_items = {
			{
				19008,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				13500
			},
			{
				"def",
				36
			}
		},
		effect_cond = {},
		effect_param = {
			1010004
		}
	},
	["8_5"] = {
		effect = "skill",
		name = "震震果实",
		max_level = 70,
		star = 5,
		desc = "【5星】战斗中，全体伙伴攻击时无视目标（6%+500）点防御",
		id = 8,
		need_items = {
			{
				19008,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				19000
			},
			{
				"def",
				48
			}
		},
		effect_cond = {},
		effect_param = {
			1010005
		}
	},
	["8_6"] = {
		effect = "skill",
		name = "震震果实",
		max_level = 100,
		star = 6,
		desc = "【6星】战斗中，全体伙伴攻击时无视目标（9%+500）点防御",
		id = 8,
		need_items = {
			{
				19008,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"hp_max",
				25000
			},
			{
				"def",
				60
			}
		},
		effect_cond = {},
		effect_param = {
			1010006
		}
	},
	["9_1"] = {
		effect = "other",
		name = "金金果实",
		max_level = 10,
		star = 1,
		desc = "【1星】每次刷新技能商店，有4%的概率额外刷出一个随机专属天赋符石",
		id = 9,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"shop_tianfu",
			160
		},
		effect_param = {
			40
		}
	},
	["9_2"] = {
		effect = "other",
		name = "金金果实",
		max_level = 20,
		star = 2,
		desc = "【2星】每次刷新技能商店，有9%的概率额外刷出一个随机专属天赋符石",
		id = 9,
		need_items = {
			{
				19009,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"atk",
				800
			},
			{
				"def",
				12
			}
		},
		effect_cond = {
			"shop_tianfu",
			160
		},
		effect_param = {
			90
		}
	},
	["9_3"] = {
		effect = "other",
		name = "金金果实",
		max_level = 30,
		star = 3,
		desc = "【3星】每次刷新技能商店，有15%的概率额外刷出一个随机专属天赋符石",
		id = 9,
		need_items = {
			{
				19009,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"atk",
				1700
			},
			{
				"def",
				24
			}
		},
		effect_cond = {
			"shop_tianfu",
			160
		},
		effect_param = {
			150
		}
	},
	["9_4"] = {
		effect = "other",
		name = "金金果实",
		max_level = 50,
		star = 4,
		desc = "【4星】每次刷新技能商店，有22%的概率额外刷出一个随机专属天赋符石",
		id = 9,
		need_items = {
			{
				19009,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"atk",
				2700
			},
			{
				"def",
				36
			}
		},
		effect_cond = {
			"shop_tianfu",
			160
		},
		effect_param = {
			220
		}
	},
	["9_5"] = {
		effect = "other",
		name = "金金果实",
		max_level = 70,
		star = 5,
		desc = "【5星】每次刷新技能商店，有31%的概率额外刷出一个随机专属天赋符石",
		id = 9,
		need_items = {
			{
				19009,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"atk",
				3800
			},
			{
				"def",
				48
			}
		},
		effect_cond = {
			"shop_tianfu",
			160
		},
		effect_param = {
			310
		}
	},
	["9_6"] = {
		effect = "other",
		name = "金金果实",
		max_level = 100,
		star = 6,
		desc = "【6星】每次刷新技能商店，有40%的概率额外刷出一个随机专属天赋符石",
		id = 9,
		need_items = {
			{
				19009,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"atk",
				5000
			},
			{
				"def",
				60
			}
		},
		effect_cond = {
			"shop_tianfu",
			160
		},
		effect_param = {
			400
		}
	},
	["10_1"] = {
		effect = "other",
		name = "合体果实",
		max_level = 10,
		star = 1,
		desc = "【1星】符文锻造，每次合成失败时，熔炼值额外获得5%",
		id = 10,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"fuwen_duanzao"
		},
		effect_param = {
			50
		}
	},
	["10_2"] = {
		effect = "other",
		name = "合体果实",
		max_level = 20,
		star = 2,
		desc = "【2星】符文锻造，每次合成失败时，熔炼值额外获得10%",
		id = 10,
		need_items = {
			{
				19010,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				4000
			},
			{
				"speed",
				5
			}
		},
		effect_cond = {
			"fuwen_duanzao"
		},
		effect_param = {
			100
		}
	},
	["10_3"] = {
		effect = "other",
		name = "合体果实",
		max_level = 30,
		star = 3,
		desc = "【3星】符文锻造，每次合成失败时，熔炼值额外获得15%",
		id = 10,
		need_items = {
			{
				19010,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				8500
			},
			{
				"speed",
				10
			}
		},
		effect_cond = {
			"fuwen_duanzao"
		},
		effect_param = {
			150
		}
	},
	["10_4"] = {
		effect = "other",
		name = "合体果实",
		max_level = 50,
		star = 4,
		desc = "【4星】符文锻造，每次合成失败时，熔炼值额外获得20%",
		id = 10,
		need_items = {
			{
				19010,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				13500
			},
			{
				"speed",
				15
			}
		},
		effect_cond = {
			"fuwen_duanzao"
		},
		effect_param = {
			200
		}
	},
	["10_5"] = {
		effect = "other",
		name = "合体果实",
		max_level = 70,
		star = 5,
		desc = "【5星】符文锻造，每次合成失败时，熔炼值额外获得30%",
		id = 10,
		need_items = {
			{
				19010,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				19000
			},
			{
				"speed",
				20
			}
		},
		effect_cond = {
			"fuwen_duanzao"
		},
		effect_param = {
			300
		}
	},
	["10_6"] = {
		effect = "other",
		name = "合体果实",
		max_level = 100,
		star = 6,
		desc = "【6星】符文锻造，每次合成失败时，熔炼值额外获得40%",
		id = 10,
		need_items = {
			{
				19010,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"hp_max",
				25000
			},
			{
				"speed",
				25
			}
		},
		effect_cond = {
			"fuwen_duanzao"
		},
		effect_param = {
			400
		}
	},
	["11_1"] = {
		effect = "add_att",
		name = "蛇蛇果实",
		max_level = 10,
		star = 1,
		desc = "【1星】战舰养成中，所有的加固等级每有1级，全体伙伴生命值+50点",
		id = 11,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"zhanjian_jiagu",
			1,
			216
		},
		effect_param = {
			{
				"hp_max",
				50
			}
		}
	},
	["11_2"] = {
		effect = "add_att",
		name = "蛇蛇果实",
		max_level = 20,
		star = 2,
		desc = "【2星】战舰养成中，所有的加固等级每有1级，全体伙伴生命值+100点",
		id = 11,
		need_items = {
			{
				19011,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				4000
			},
			{
				"def",
				12
			}
		},
		effect_cond = {
			"zhanjian_jiagu",
			1,
			216
		},
		effect_param = {
			{
				"hp_max",
				100
			}
		}
	},
	["11_3"] = {
		effect = "add_att",
		name = "蛇蛇果实",
		max_level = 30,
		star = 3,
		desc = "【3星】战舰养成中，所有的加固等级每有1级，全体伙伴生命值+150点",
		id = 11,
		need_items = {
			{
				19011,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				8500
			},
			{
				"def",
				24
			}
		},
		effect_cond = {
			"zhanjian_jiagu",
			1,
			216
		},
		effect_param = {
			{
				"hp_max",
				150
			}
		}
	},
	["11_4"] = {
		effect = "add_att",
		name = "蛇蛇果实",
		max_level = 50,
		star = 4,
		desc = "【4星】战舰养成中，所有的加固等级每有1级，全体伙伴生命值+200点",
		id = 11,
		need_items = {
			{
				19011,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				13500
			},
			{
				"def",
				36
			}
		},
		effect_cond = {
			"zhanjian_jiagu",
			1,
			216
		},
		effect_param = {
			{
				"hp_max",
				200
			}
		}
	},
	["11_5"] = {
		effect = "add_att",
		name = "蛇蛇果实",
		max_level = 70,
		star = 5,
		desc = "【5星】战舰养成中，所有的加固等级每有1级，全体伙伴生命值+250点",
		id = 11,
		need_items = {
			{
				19011,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				19000
			},
			{
				"def",
				48
			}
		},
		effect_cond = {
			"zhanjian_jiagu",
			1,
			216
		},
		effect_param = {
			{
				"hp_max",
				250
			}
		}
	},
	["11_6"] = {
		effect = "add_att",
		name = "蛇蛇果实",
		max_level = 100,
		star = 6,
		desc = "【6星】战舰养成中，所有的加固等级每有1级，全体伙伴生命值+300点",
		id = 11,
		need_items = {
			{
				19011,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"hp_max",
				25000
			},
			{
				"def",
				60
			}
		},
		effect_cond = {
			"zhanjian_jiagu",
			1,
			216
		},
		effect_param = {
			{
				"hp_max",
				300
			}
		}
	},
	["12_1"] = {
		effect = "add_att",
		name = "鱼鱼果实",
		max_level = 10,
		star = 1,
		desc = "【1星】战舰养成中，所有的技能等级每有1级，全体伙伴防御力+8点",
		id = 12,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"zhanjian_jineng",
			1,
			36
		},
		effect_param = {
			{
				"def",
				8
			}
		}
	},
	["12_2"] = {
		effect = "add_att",
		name = "鱼鱼果实",
		max_level = 20,
		star = 2,
		desc = "【2星】战舰养成中，所有的技能等级每有1级，全体伙伴防御力+9点",
		id = 12,
		need_items = {
			{
				19012,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				4000
			},
			{
				"speed",
				5
			}
		},
		effect_cond = {
			"zhanjian_jineng",
			1,
			36
		},
		effect_param = {
			{
				"def",
				9
			}
		}
	},
	["12_3"] = {
		effect = "add_att",
		name = "鱼鱼果实",
		max_level = 30,
		star = 3,
		desc = "【3星】战舰养成中，所有的技能等级每有1级，全体伙伴防御力+10点",
		id = 12,
		need_items = {
			{
				19012,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				8500
			},
			{
				"speed",
				10
			}
		},
		effect_cond = {
			"zhanjian_jineng",
			1,
			36
		},
		effect_param = {
			{
				"def",
				10
			}
		}
	},
	["12_4"] = {
		effect = "add_att",
		name = "鱼鱼果实",
		max_level = 50,
		star = 4,
		desc = "【4星】战舰养成中，所有的技能等级每有1级，全体伙伴防御力+11点",
		id = 12,
		need_items = {
			{
				19012,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				13500
			},
			{
				"speed",
				15
			}
		},
		effect_cond = {
			"zhanjian_jineng",
			1,
			36
		},
		effect_param = {
			{
				"def",
				11
			}
		}
	},
	["12_5"] = {
		effect = "add_att",
		name = "鱼鱼果实",
		max_level = 70,
		star = 5,
		desc = "【5星】战舰养成中，所有的技能等级每有1级，全体伙伴防御力+12点",
		id = 12,
		need_items = {
			{
				19012,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				19000
			},
			{
				"speed",
				20
			}
		},
		effect_cond = {
			"zhanjian_jineng",
			1,
			36
		},
		effect_param = {
			{
				"def",
				12
			}
		}
	},
	["12_6"] = {
		effect = "add_att",
		name = "鱼鱼果实",
		max_level = 100,
		star = 6,
		desc = "【6星】战舰养成中，所有的技能等级每有1级，全体伙伴防御力+13点",
		id = 12,
		need_items = {
			{
				19012,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"hp_max",
				25000
			},
			{
				"speed",
				25
			}
		},
		effect_cond = {
			"zhanjian_jineng",
			1,
			36
		},
		effect_param = {
			{
				"def",
				13
			}
		}
	},
	["13_1"] = {
		effect = "add_att",
		name = "犬犬果实",
		max_level = 10,
		star = 1,
		desc = "【1星】战舰养成中，所有的升级等级每有1级，全体伙伴攻击力+30点",
		id = 13,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"zhanjian_shengji",
			1,
			72
		},
		effect_param = {
			{
				"atk",
				30
			}
		}
	},
	["13_2"] = {
		effect = "add_att",
		name = "犬犬果实",
		max_level = 20,
		star = 2,
		desc = "【2星】战舰养成中，所有的升级等级每有1级，全体伙伴攻击力+50点",
		id = 13,
		need_items = {
			{
				19013,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"atk",
				800
			},
			{
				"def",
				12
			}
		},
		effect_cond = {
			"zhanjian_shengji",
			1,
			72
		},
		effect_param = {
			{
				"atk",
				50
			}
		}
	},
	["13_3"] = {
		effect = "add_att",
		name = "犬犬果实",
		max_level = 30,
		star = 3,
		desc = "【3星】战舰养成中，所有的升级等级每有1级，全体伙伴攻击力+70点",
		id = 13,
		need_items = {
			{
				19013,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"atk",
				1700
			},
			{
				"def",
				24
			}
		},
		effect_cond = {
			"zhanjian_shengji",
			1,
			72
		},
		effect_param = {
			{
				"atk",
				70
			}
		}
	},
	["13_4"] = {
		effect = "add_att",
		name = "犬犬果实",
		max_level = 50,
		star = 4,
		desc = "【4星】战舰养成中，所有的升级等级每有1级，全体伙伴攻击力+90点",
		id = 13,
		need_items = {
			{
				19013,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"atk",
				2700
			},
			{
				"def",
				36
			}
		},
		effect_cond = {
			"zhanjian_shengji",
			1,
			72
		},
		effect_param = {
			{
				"atk",
				90
			}
		}
	},
	["13_5"] = {
		effect = "add_att",
		name = "犬犬果实",
		max_level = 70,
		star = 5,
		desc = "【5星】战舰养成中，所有的升级等级每有1级，全体伙伴攻击力+120点",
		id = 13,
		need_items = {
			{
				19013,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"atk",
				3800
			},
			{
				"def",
				48
			}
		},
		effect_cond = {
			"zhanjian_shengji",
			1,
			72
		},
		effect_param = {
			{
				"atk",
				120
			}
		}
	},
	["13_6"] = {
		effect = "add_att",
		name = "犬犬果实",
		max_level = 100,
		star = 6,
		desc = "【6星】战舰养成中，所有的升级等级每有1级，全体伙伴攻击力+160点",
		id = 13,
		need_items = {
			{
				19013,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"atk",
				5000
			},
			{
				"def",
				60
			}
		},
		effect_cond = {
			"zhanjian_shengji",
			1,
			72
		},
		effect_param = {
			{
				"atk",
				160
			}
		}
	},
	["14_1"] = {
		effect = "add_att",
		name = "手术果实",
		max_level = 10,
		star = 1,
		desc = "【1星】组队竞技场每挑战胜利10次，全体伙伴物理伤害提升0.2%",
		id = 14,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"zuduijingjichang",
			10,
			100
		},
		effect_param = {
			{
				"dam_p",
				2
			}
		}
	},
	["14_2"] = {
		effect = "add_att",
		name = "手术果实",
		max_level = 20,
		star = 2,
		desc = "【2星】组队竞技场每挑战胜利10次，全体伙伴物理伤害提升0.3%",
		id = 14,
		need_items = {
			{
				19014,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"atk",
				800
			},
			{
				"def",
				12
			}
		},
		effect_cond = {
			"zuduijingjichang",
			10,
			100
		},
		effect_param = {
			{
				"dam_p",
				3
			}
		}
	},
	["14_3"] = {
		effect = "add_att",
		name = "手术果实",
		max_level = 30,
		star = 3,
		desc = "【3星】组队竞技场每挑战胜利10次，全体伙伴物理伤害提升0.4%",
		id = 14,
		need_items = {
			{
				19014,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"atk",
				1700
			},
			{
				"def",
				24
			}
		},
		effect_cond = {
			"zuduijingjichang",
			10,
			100
		},
		effect_param = {
			{
				"dam_p",
				4
			}
		}
	},
	["14_4"] = {
		effect = "add_att",
		name = "手术果实",
		max_level = 50,
		star = 4,
		desc = "【4星】组队竞技场每挑战胜利10次，全体伙伴物理伤害提升0.5%",
		id = 14,
		need_items = {
			{
				19014,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"atk",
				2700
			},
			{
				"def",
				36
			}
		},
		effect_cond = {
			"zuduijingjichang",
			10,
			100
		},
		effect_param = {
			{
				"dam_p",
				5
			}
		}
	},
	["14_5"] = {
		effect = "add_att",
		name = "手术果实",
		max_level = 70,
		star = 5,
		desc = "【5星】组队竞技场每挑战胜利10次，全体伙伴物理伤害提升0.6%",
		id = 14,
		need_items = {
			{
				19014,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"atk",
				3800
			},
			{
				"def",
				48
			}
		},
		effect_cond = {
			"zuduijingjichang",
			10,
			100
		},
		effect_param = {
			{
				"dam_p",
				6
			}
		}
	},
	["14_6"] = {
		effect = "add_att",
		name = "手术果实",
		max_level = 100,
		star = 6,
		desc = "【6星】组队竞技场每挑战胜利10次，全体伙伴物理伤害提升0.7%",
		id = 14,
		need_items = {
			{
				19014,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"atk",
				5000
			},
			{
				"def",
				60
			}
		},
		effect_cond = {
			"zuduijingjichang",
			10,
			100
		},
		effect_param = {
			{
				"dam_p",
				7
			}
		}
	},
	["15_1"] = {
		effect = "add_att",
		name = "响雷果实",
		max_level = 10,
		star = 1,
		desc = "【1星】超凡段位赛每挑战胜利20次，全体伙伴魔法伤害提升0.2%",
		id = 15,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"chaofanduanweisai",
			20,
			200
		},
		effect_param = {
			{
				"dam_s",
				2
			}
		}
	},
	["15_2"] = {
		effect = "add_att",
		name = "响雷果实",
		max_level = 20,
		star = 2,
		desc = "【2星】超凡段位赛每挑战胜利20次，全体伙伴魔法伤害提升0.3%",
		id = 15,
		need_items = {
			{
				19015,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				4000
			},
			{
				"def",
				12
			}
		},
		effect_cond = {
			"chaofanduanweisai",
			20,
			200
		},
		effect_param = {
			{
				"dam_s",
				3
			}
		}
	},
	["15_3"] = {
		effect = "add_att",
		name = "响雷果实",
		max_level = 30,
		star = 3,
		desc = "【3星】超凡段位赛每挑战胜利20次，全体伙伴魔法伤害提升0.4%",
		id = 15,
		need_items = {
			{
				19015,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				8500
			},
			{
				"def",
				24
			}
		},
		effect_cond = {
			"chaofanduanweisai",
			20,
			200
		},
		effect_param = {
			{
				"dam_s",
				4
			}
		}
	},
	["15_4"] = {
		effect = "add_att",
		name = "响雷果实",
		max_level = 50,
		star = 4,
		desc = "【4星】超凡段位赛每挑战胜利20次，全体伙伴魔法伤害提升0.5%",
		id = 15,
		need_items = {
			{
				19015,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				13500
			},
			{
				"def",
				36
			}
		},
		effect_cond = {
			"chaofanduanweisai",
			20,
			200
		},
		effect_param = {
			{
				"dam_s",
				5
			}
		}
	},
	["15_5"] = {
		effect = "add_att",
		name = "响雷果实",
		max_level = 70,
		star = 5,
		desc = "【5星】超凡段位赛每挑战胜利20次，全体伙伴魔法伤害提升0.6%",
		id = 15,
		need_items = {
			{
				19015,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				19000
			},
			{
				"def",
				48
			}
		},
		effect_cond = {
			"chaofanduanweisai",
			20,
			200
		},
		effect_param = {
			{
				"dam_s",
				6
			}
		}
	},
	["15_6"] = {
		effect = "add_att",
		name = "响雷果实",
		max_level = 100,
		star = 6,
		desc = "【6星】超凡段位赛每挑战胜利20次，全体伙伴魔法伤害提升0.7%",
		id = 15,
		need_items = {
			{
				19015,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"hp_max",
				25000
			},
			{
				"def",
				60
			}
		},
		effect_cond = {
			"chaofanduanweisai",
			20,
			200
		},
		effect_param = {
			{
				"dam_s",
				7
			}
		}
	},
	["16_1"] = {
		effect = "add_att",
		name = "糯糯果实",
		max_level = 10,
		star = 1,
		desc = "【1星】竞技场每挑战胜利100次，全体伙伴抗暴提升0.2%",
		id = 16,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"jingjichang",
			100,
			1000
		},
		effect_param = {
			{
				"tenacity",
				2
			}
		}
	},
	["16_2"] = {
		effect = "add_att",
		name = "糯糯果实",
		max_level = 20,
		star = 2,
		desc = "【2星】竞技场每挑战胜利100次，全体伙伴抗暴提升0.3%",
		id = 16,
		need_items = {
			{
				19016,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"atk",
				800
			},
			{
				"speed",
				5
			}
		},
		effect_cond = {
			"jingjichang",
			100,
			1000
		},
		effect_param = {
			{
				"tenacity",
				3
			}
		}
	},
	["16_3"] = {
		effect = "add_att",
		name = "糯糯果实",
		max_level = 30,
		star = 3,
		desc = "【3星】竞技场每挑战胜利100次，全体伙伴抗暴提升0.4%",
		id = 16,
		need_items = {
			{
				19016,
				30
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"atk",
				1700
			},
			{
				"speed",
				10
			}
		},
		effect_cond = {
			"jingjichang",
			100,
			1000
		},
		effect_param = {
			{
				"tenacity",
				4
			}
		}
	},
	["16_4"] = {
		effect = "add_att",
		name = "糯糯果实",
		max_level = 50,
		star = 4,
		desc = "【4星】竞技场每挑战胜利100次，全体伙伴抗暴提升0.6%",
		id = 16,
		need_items = {
			{
				19016,
				50
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"atk",
				2700
			},
			{
				"speed",
				15
			}
		},
		effect_cond = {
			"jingjichang",
			100,
			1000
		},
		effect_param = {
			{
				"tenacity",
				6
			}
		}
	},
	["16_5"] = {
		effect = "add_att",
		name = "糯糯果实",
		max_level = 70,
		star = 5,
		desc = "【5星】竞技场每挑战胜利100次，全体伙伴抗暴提升0.8%",
		id = 16,
		need_items = {
			{
				19016,
				100
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"atk",
				3800
			},
			{
				"speed",
				20
			}
		},
		effect_cond = {
			"jingjichang",
			100,
			1000
		},
		effect_param = {
			{
				"tenacity",
				8
			}
		}
	},
	["16_6"] = {
		effect = "add_att",
		name = "糯糯果实",
		max_level = 100,
		star = 6,
		desc = "【6星】竞技场每挑战胜利100次，全体伙伴抗暴提升1%",
		id = 16,
		need_items = {
			{
				19016,
				150
			}
		},
		need_partner = {
			{
				0,
				6,
				1
			}
		},
		atts = {
			{
				"atk",
				5000
			},
			{
				"speed",
				25
			}
		},
		effect_cond = {
			"jingjichang",
			100,
			1000
		},
		effect_param = {
			{
				"tenacity",
				10
			}
		}
	},
	["101_1"] = {
		effect = "other",
		name = "磁磁果实",
		max_level = 10,
		star = 1,
		desc = "【1星】贝里24小时挂机收益+122400",
		id = 101,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"beiliguaji"
		},
		effect_param = {
			85
		}
	},
	["101_2"] = {
		effect = "other",
		name = "磁磁果实",
		max_level = 20,
		star = 2,
		desc = "【2星】贝里24小时挂机收益+180000",
		id = 101,
		need_items = {
			{
				19101,
				10
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				2400
			},
			{
				"def",
				8
			}
		},
		effect_cond = {
			"beiliguaji"
		},
		effect_param = {
			125
		}
	},
	["101_3"] = {
		effect = "other",
		name = "磁磁果实",
		max_level = 30,
		star = 3,
		desc = "【3星】贝里24小时挂机收益+252000",
		id = 101,
		need_items = {
			{
				19101,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				5400
			},
			{
				"def",
				16
			}
		},
		effect_cond = {
			"beiliguaji"
		},
		effect_param = {
			175
		}
	},
	["101_4"] = {
		effect = "other",
		name = "磁磁果实",
		max_level = 50,
		star = 4,
		desc = "【4星】贝里24小时挂机收益+352800",
		id = 101,
		need_items = {
			{
				19101,
				30
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				9000
			},
			{
				"def",
				24
			}
		},
		effect_cond = {
			"beiliguaji"
		},
		effect_param = {
			245
		}
	},
	["101_5"] = {
		effect = "other",
		name = "磁磁果实",
		max_level = 70,
		star = 5,
		desc = "【5星】贝里24小时挂机收益+504000",
		id = 101,
		need_items = {
			{
				19101,
				60
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"def",
				32
			}
		},
		effect_cond = {
			"beiliguaji"
		},
		effect_param = {
			350
		}
	},
	["102_1"] = {
		effect = "other",
		name = "花花果实",
		max_level = 10,
		star = 1,
		desc = "【1星】伙伴经验24小时挂机收益+79200",
		id = 102,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"jingyanguaji"
		},
		effect_param = {
			55
		}
	},
	["102_2"] = {
		effect = "other",
		name = "花花果实",
		max_level = 20,
		star = 2,
		desc = "【2星】伙伴经验24小时挂机收益+129600",
		id = 102,
		need_items = {
			{
				19102,
				10
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"atk",
				480
			},
			{
				"speed",
				4
			}
		},
		effect_cond = {
			"jingyanguaji"
		},
		effect_param = {
			90
		}
	},
	["102_3"] = {
		effect = "other",
		name = "花花果实",
		max_level = 30,
		star = 3,
		desc = "【3星】伙伴经验24小时挂机收益+180000",
		id = 102,
		need_items = {
			{
				19102,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"atk",
				1080
			},
			{
				"speed",
				8
			}
		},
		effect_cond = {
			"jingyanguaji"
		},
		effect_param = {
			125
		}
	},
	["102_4"] = {
		effect = "other",
		name = "花花果实",
		max_level = 50,
		star = 4,
		desc = "【4星】伙伴经验24小时挂机收益+230400",
		id = 102,
		need_items = {
			{
				19102,
				30
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"atk",
				1800
			},
			{
				"speed",
				12
			}
		},
		effect_cond = {
			"jingyanguaji"
		},
		effect_param = {
			160
		}
	},
	["102_5"] = {
		effect = "other",
		name = "花花果实",
		max_level = 70,
		star = 5,
		desc = "【5星】伙伴经验24小时挂机收益+302400",
		id = 102,
		need_items = {
			{
				19102,
				60
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"atk",
				2640
			},
			{
				"speed",
				16
			}
		},
		effect_cond = {
			"jingyanguaji"
		},
		effect_param = {
			210
		}
	},
	["103_1"] = {
		effect = "other",
		name = "人人果实",
		max_level = 10,
		star = 1,
		desc = "【1星】剧情挂机，进阶石24小时产量+5%（满24小时增加）",
		id = 103,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"juqingguaji"
		},
		effect_param = {
			50
		}
	},
	["103_2"] = {
		effect = "other",
		name = "人人果实",
		max_level = 20,
		star = 2,
		desc = "【2星】剧情挂机，进阶石24小时产量+7%（满24小时增加）",
		id = 103,
		need_items = {
			{
				19103,
				10
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"atk",
				480
			},
			{
				"def",
				8
			}
		},
		effect_cond = {
			"juqingguaji"
		},
		effect_param = {
			70
		}
	},
	["103_3"] = {
		effect = "other",
		name = "人人果实",
		max_level = 30,
		star = 3,
		desc = "【3星】剧情挂机，进阶石24小时产量+9%（满24小时增加）",
		id = 103,
		need_items = {
			{
				19103,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"atk",
				1080
			},
			{
				"def",
				16
			}
		},
		effect_cond = {
			"juqingguaji"
		},
		effect_param = {
			90
		}
	},
	["103_4"] = {
		effect = "other",
		name = "人人果实",
		max_level = 50,
		star = 4,
		desc = "【4星】剧情挂机，进阶石24小时产量+12%（满24小时增加）",
		id = 103,
		need_items = {
			{
				19103,
				30
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"atk",
				1800
			},
			{
				"def",
				24
			}
		},
		effect_cond = {
			"juqingguaji"
		},
		effect_param = {
			120
		}
	},
	["103_5"] = {
		effect = "other",
		name = "人人果实",
		max_level = 70,
		star = 5,
		desc = "【5星】剧情挂机，进阶石24小时产量+15%（满24小时增加）",
		id = 103,
		need_items = {
			{
				19103,
				60
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"atk",
				2640
			},
			{
				"def",
				32
			}
		},
		effect_cond = {
			"juqingguaji"
		},
		effect_param = {
			150
		}
	},
	["104_1"] = {
		effect = "other",
		name = "影影果实",
		max_level = 10,
		star = 1,
		desc = "【1星】位面征战，征战勋章产出+10%",
		id = 104,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"weimianzhengzhan"
		},
		effect_param = {
			100
		}
	},
	["104_2"] = {
		effect = "other",
		name = "影影果实",
		max_level = 20,
		star = 2,
		desc = "【2星】位面征战，征战勋章产出+12%",
		id = 104,
		need_items = {
			{
				19104,
				10
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				2400
			},
			{
				"speed",
				4
			}
		},
		effect_cond = {
			"weimianzhengzhan"
		},
		effect_param = {
			120
		}
	},
	["104_3"] = {
		effect = "other",
		name = "影影果实",
		max_level = 30,
		star = 3,
		desc = "【3星】位面征战，征战勋章产出+14%",
		id = 104,
		need_items = {
			{
				19104,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				5400
			},
			{
				"speed",
				8
			}
		},
		effect_cond = {
			"weimianzhengzhan"
		},
		effect_param = {
			140
		}
	},
	["104_4"] = {
		effect = "other",
		name = "影影果实",
		max_level = 50,
		star = 4,
		desc = "【4星】位面征战，征战勋章产出+16%",
		id = 104,
		need_items = {
			{
				19104,
				30
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				9000
			},
			{
				"speed",
				12
			}
		},
		effect_cond = {
			"weimianzhengzhan"
		},
		effect_param = {
			160
		}
	},
	["104_5"] = {
		effect = "other",
		name = "影影果实",
		max_level = 70,
		star = 5,
		desc = "【5星】位面征战，征战勋章产出+20%",
		id = 104,
		need_items = {
			{
				19104,
				60
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"speed",
				16
			}
		},
		effect_cond = {
			"weimianzhengzhan"
		},
		effect_param = {
			200
		}
	},
	["105_1"] = {
		effect = "add_att",
		name = "笔笔果实",
		max_level = 10,
		star = 1,
		desc = "【1星】图书馆，每激活1个伙伴图鉴，全体伙伴生命值+50点",
		id = 105,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"tushuguan",
			1,
			150
		},
		effect_param = {
			{
				"hp_max",
				50
			}
		}
	},
	["105_2"] = {
		effect = "add_att",
		name = "笔笔果实",
		max_level = 20,
		star = 2,
		desc = "【2星】图书馆，每激活1个伙伴图鉴，全体伙伴生命值+100点",
		id = 105,
		need_items = {
			{
				19105,
				10
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				2400
			},
			{
				"def",
				8
			}
		},
		effect_cond = {
			"tushuguan",
			1,
			150
		},
		effect_param = {
			{
				"hp_max",
				100
			}
		}
	},
	["105_3"] = {
		effect = "add_att",
		name = "笔笔果实",
		max_level = 30,
		star = 3,
		desc = "【3星】图书馆，每激活1个伙伴图鉴，全体伙伴生命值+150点",
		id = 105,
		need_items = {
			{
				19105,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				5400
			},
			{
				"def",
				16
			}
		},
		effect_cond = {
			"tushuguan",
			1,
			150
		},
		effect_param = {
			{
				"hp_max",
				150
			}
		}
	},
	["105_4"] = {
		effect = "add_att",
		name = "笔笔果实",
		max_level = 50,
		star = 4,
		desc = "【4星】图书馆，每激活1个伙伴图鉴，全体伙伴生命值+225点",
		id = 105,
		need_items = {
			{
				19105,
				30
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				9000
			},
			{
				"def",
				24
			}
		},
		effect_cond = {
			"tushuguan",
			1,
			150
		},
		effect_param = {
			{
				"hp_max",
				225
			}
		}
	},
	["105_5"] = {
		effect = "add_att",
		name = "笔笔果实",
		max_level = 70,
		star = 5,
		desc = "【5星】图书馆，每激活1个伙伴图鉴，全体伙伴生命值+350点",
		id = 105,
		need_items = {
			{
				19105,
				60
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"def",
				32
			}
		},
		effect_cond = {
			"tushuguan",
			1,
			150
		},
		effect_param = {
			{
				"hp_max",
				350
			}
		}
	},
	["106_1"] = {
		effect = "add_att",
		name = "线线果实",
		max_level = 10,
		star = 1,
		desc = "【1星】每1000点神装最高总评分，全体伙伴攻击力+20点",
		id = 106,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"shenzhuang_pingfen",
			1000,
			120000
		},
		effect_param = {
			{
				"atk",
				20
			}
		}
	},
	["106_2"] = {
		effect = "add_att",
		name = "线线果实",
		max_level = 20,
		star = 2,
		desc = "【2星】每1000点神装最高总评分，全体伙伴攻击力+30点",
		id = 106,
		need_items = {
			{
				19106,
				10
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				2400
			},
			{
				"speed",
				4
			}
		},
		effect_cond = {
			"shenzhuang_pingfen",
			1000,
			120000
		},
		effect_param = {
			{
				"atk",
				30
			}
		}
	},
	["106_3"] = {
		effect = "add_att",
		name = "线线果实",
		max_level = 30,
		star = 3,
		desc = "【3星】每1000点神装最高总评分，全体伙伴攻击力+40点",
		id = 106,
		need_items = {
			{
				19106,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				5400
			},
			{
				"speed",
				8
			}
		},
		effect_cond = {
			"shenzhuang_pingfen",
			1000,
			120000
		},
		effect_param = {
			{
				"atk",
				40
			}
		}
	},
	["106_4"] = {
		effect = "add_att",
		name = "线线果实",
		max_level = 50,
		star = 4,
		desc = "【4星】每1000点神装最高总评分，全体伙伴攻击力+55点",
		id = 106,
		need_items = {
			{
				19106,
				30
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				9000
			},
			{
				"speed",
				12
			}
		},
		effect_cond = {
			"shenzhuang_pingfen",
			1000,
			120000
		},
		effect_param = {
			{
				"atk",
				55
			}
		}
	},
	["106_5"] = {
		effect = "add_att",
		name = "线线果实",
		max_level = 70,
		star = 5,
		desc = "【5星】每1000点神装最高总评分，全体伙伴攻击力+75点",
		id = 106,
		need_items = {
			{
				19106,
				60
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"speed",
				16
			}
		},
		effect_cond = {
			"shenzhuang_pingfen",
			1000,
			120000
		},
		effect_param = {
			{
				"atk",
				75
			}
		}
	},
	["107_1"] = {
		effect = "other",
		name = "瓦斯果实",
		max_level = 10,
		star = 1,
		desc = "【1星】点金贝里收益+5%",
		id = 107,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"dianjin"
		},
		effect_param = {
			50
		}
	},
	["107_2"] = {
		effect = "other",
		name = "瓦斯果实",
		max_level = 20,
		star = 2,
		desc = "【2星】点金贝里收益+8%",
		id = 107,
		need_items = {
			{
				19107,
				10
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"atk",
				480
			},
			{
				"speed",
				4
			}
		},
		effect_cond = {
			"dianjin"
		},
		effect_param = {
			80
		}
	},
	["107_3"] = {
		effect = "other",
		name = "瓦斯果实",
		max_level = 30,
		star = 3,
		desc = "【3星】点金贝里收益+12%",
		id = 107,
		need_items = {
			{
				19107,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"atk",
				1080
			},
			{
				"speed",
				8
			}
		},
		effect_cond = {
			"dianjin"
		},
		effect_param = {
			120
		}
	},
	["107_4"] = {
		effect = "other",
		name = "瓦斯果实",
		max_level = 50,
		star = 4,
		desc = "【4星】点金贝里收益+16%",
		id = 107,
		need_items = {
			{
				19107,
				30
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"atk",
				1800
			},
			{
				"speed",
				12
			}
		},
		effect_cond = {
			"dianjin"
		},
		effect_param = {
			160
		}
	},
	["107_5"] = {
		effect = "other",
		name = "瓦斯果实",
		max_level = 70,
		star = 5,
		desc = "【5星】点金贝里收益+20%",
		id = 107,
		need_items = {
			{
				19107,
				60
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"atk",
				2640
			},
			{
				"speed",
				16
			}
		},
		effect_cond = {
			"dianjin"
		},
		effect_param = {
			200
		}
	},
	["108_1"] = {
		effect = "add_att",
		name = "牛牛果实",
		max_level = 10,
		star = 1,
		desc = "【1星】天界副本，每通关1章天界副本，全体伙伴防御力+2点",
		id = 108,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"tianjie",
			1,
			35
		},
		effect_param = {
			{
				"def",
				2
			}
		}
	},
	["108_2"] = {
		effect = "add_att",
		name = "牛牛果实",
		max_level = 20,
		star = 2,
		desc = "【2星】天界副本，每通关1章天界副本，全体伙伴防御力+4点",
		id = 108,
		need_items = {
			{
				19108,
				10
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				2400
			},
			{
				"speed",
				4
			}
		},
		effect_cond = {
			"tianjie",
			1,
			35
		},
		effect_param = {
			{
				"def",
				4
			}
		}
	},
	["108_3"] = {
		effect = "add_att",
		name = "牛牛果实",
		max_level = 30,
		star = 3,
		desc = "【3星】天界副本，每通关1章天界副本，全体伙伴防御力+6点",
		id = 108,
		need_items = {
			{
				19108,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				5400
			},
			{
				"speed",
				8
			}
		},
		effect_cond = {
			"tianjie",
			1,
			35
		},
		effect_param = {
			{
				"def",
				6
			}
		}
	},
	["108_4"] = {
		effect = "add_att",
		name = "牛牛果实",
		max_level = 50,
		star = 4,
		desc = "【4星】天界副本，每通关1章天界副本，全体伙伴防御力+8点",
		id = 108,
		need_items = {
			{
				19108,
				30
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				9000
			},
			{
				"speed",
				12
			}
		},
		effect_cond = {
			"tianjie",
			1,
			35
		},
		effect_param = {
			{
				"def",
				8
			}
		}
	},
	["108_5"] = {
		effect = "add_att",
		name = "牛牛果实",
		max_level = 70,
		star = 5,
		desc = "【5星】天界副本，每通关1章天界副本，全体伙伴防御力+10点",
		id = 108,
		need_items = {
			{
				19108,
				60
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"speed",
				16
			}
		},
		effect_cond = {
			"tianjie",
			1,
			35
		},
		effect_param = {
			{
				"def",
				10
			}
		}
	},
	["109_1"] = {
		effect = "other",
		name = "滑滑果实",
		max_level = 10,
		star = 1,
		desc = "【1星】快速作战额外获得5分钟收益",
		id = 109,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"kuaisuzuozhan"
		},
		effect_param = {
			5
		}
	},
	["109_2"] = {
		effect = "other",
		name = "滑滑果实",
		max_level = 20,
		star = 2,
		desc = "【2星】快速作战额外获得8分钟收益",
		id = 109,
		need_items = {
			{
				19109,
				10
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				2400
			},
			{
				"def",
				8
			}
		},
		effect_cond = {
			"kuaisuzuozhan"
		},
		effect_param = {
			8
		}
	},
	["109_3"] = {
		effect = "other",
		name = "滑滑果实",
		max_level = 30,
		star = 3,
		desc = "【3星】快速作战额外获得12分钟收益",
		id = 109,
		need_items = {
			{
				19109,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				5400
			},
			{
				"def",
				16
			}
		},
		effect_cond = {
			"kuaisuzuozhan"
		},
		effect_param = {
			12
		}
	},
	["109_4"] = {
		effect = "other",
		name = "滑滑果实",
		max_level = 50,
		star = 4,
		desc = "【4星】快速作战额外获得16分钟收益",
		id = 109,
		need_items = {
			{
				19109,
				30
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				9000
			},
			{
				"def",
				24
			}
		},
		effect_cond = {
			"kuaisuzuozhan"
		},
		effect_param = {
			16
		}
	},
	["109_5"] = {
		effect = "other",
		name = "滑滑果实",
		max_level = 70,
		star = 5,
		desc = "【5星】快速作战额外获得20分钟收益",
		id = 109,
		need_items = {
			{
				19109,
				60
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"def",
				32
			}
		},
		effect_cond = {
			"kuaisuzuozhan"
		},
		effect_param = {
			20
		}
	},
	["110_1"] = {
		effect = "add_att",
		name = "爆炸果实",
		max_level = 10,
		star = 1,
		desc = "【1星】无尽试炼，每通关1层综合试炼，全体伙伴攻击力+2点",
		id = 110,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"wujinshilian_zonghe",
			1,
			500
		},
		effect_param = {
			{
				"atk",
				2
			}
		}
	},
	["110_2"] = {
		effect = "add_att",
		name = "爆炸果实",
		max_level = 20,
		star = 2,
		desc = "【2星】无尽试炼，每通关1层综合试炼，全体伙伴攻击力+4点",
		id = 110,
		need_items = {
			{
				19110,
				10
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				2400
			},
			{
				"def",
				8
			}
		},
		effect_cond = {
			"wujinshilian_zonghe",
			1,
			500
		},
		effect_param = {
			{
				"atk",
				4
			}
		}
	},
	["110_3"] = {
		effect = "add_att",
		name = "爆炸果实",
		max_level = 30,
		star = 3,
		desc = "【3星】无尽试炼，每通关1层综合试炼，全体伙伴攻击力+7点",
		id = 110,
		need_items = {
			{
				19110,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				5400
			},
			{
				"def",
				16
			}
		},
		effect_cond = {
			"wujinshilian_zonghe",
			1,
			500
		},
		effect_param = {
			{
				"atk",
				7
			}
		}
	},
	["110_4"] = {
		effect = "add_att",
		name = "爆炸果实",
		max_level = 50,
		star = 4,
		desc = "【4星】无尽试炼，每通关1层综合试炼，全体伙伴攻击力+10点",
		id = 110,
		need_items = {
			{
				19110,
				30
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				9000
			},
			{
				"def",
				24
			}
		},
		effect_cond = {
			"wujinshilian_zonghe",
			1,
			500
		},
		effect_param = {
			{
				"atk",
				10
			}
		}
	},
	["110_5"] = {
		effect = "add_att",
		name = "爆炸果实",
		max_level = 70,
		star = 5,
		desc = "【5星】无尽试炼，每通关1层综合试炼，全体伙伴攻击力+15点",
		id = 110,
		need_items = {
			{
				19110,
				60
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"def",
				32
			}
		},
		effect_cond = {
			"wujinshilian_zonghe",
			1,
			500
		},
		effect_param = {
			{
				"atk",
				15
			}
		}
	},
	["111_1"] = {
		effect = "add_att",
		name = "泡泡果实",
		max_level = 10,
		star = 1,
		desc = "【1星】无尽试炼，每通关1波无尽深渊（单人模式），全体伙伴生命值+20点",
		id = 111,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"wujinshenyuan_danren",
			1,
			500
		},
		effect_param = {
			{
				"hp_max",
				20
			}
		}
	},
	["111_2"] = {
		effect = "add_att",
		name = "泡泡果实",
		max_level = 20,
		star = 2,
		desc = "【2星】无尽试炼，每通关1波无尽深渊（单人模式），全体伙伴生命值+30点",
		id = 111,
		need_items = {
			{
				19111,
				10
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"atk",
				480
			},
			{
				"def",
				8
			}
		},
		effect_cond = {
			"wujinshenyuan_danren",
			1,
			500
		},
		effect_param = {
			{
				"hp_max",
				30
			}
		}
	},
	["111_3"] = {
		effect = "add_att",
		name = "泡泡果实",
		max_level = 30,
		star = 3,
		desc = "【3星】无尽试炼，每通关1波无尽深渊（单人模式），全体伙伴生命值+45点",
		id = 111,
		need_items = {
			{
				19111,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"atk",
				1080
			},
			{
				"def",
				16
			}
		},
		effect_cond = {
			"wujinshenyuan_danren",
			1,
			500
		},
		effect_param = {
			{
				"hp_max",
				45
			}
		}
	},
	["111_4"] = {
		effect = "add_att",
		name = "泡泡果实",
		max_level = 50,
		star = 4,
		desc = "【4星】无尽试炼，每通关1波无尽深渊（单人模式），全体伙伴生命值+65点",
		id = 111,
		need_items = {
			{
				19111,
				30
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"atk",
				1800
			},
			{
				"def",
				24
			}
		},
		effect_cond = {
			"wujinshenyuan_danren",
			1,
			500
		},
		effect_param = {
			{
				"hp_max",
				65
			}
		}
	},
	["111_5"] = {
		effect = "add_att",
		name = "泡泡果实",
		max_level = 70,
		star = 5,
		desc = "【5星】无尽试炼，每通关1波无尽深渊（单人模式），全体伙伴生命值+105点",
		id = 111,
		need_items = {
			{
				19111,
				60
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"atk",
				2640
			},
			{
				"def",
				32
			}
		},
		effect_cond = {
			"wujinshenyuan_danren",
			1,
			500
		},
		effect_param = {
			{
				"hp_max",
				105
			}
		}
	},
	["112_1"] = {
		effect = "add_att",
		name = "蜡蜡果实",
		max_level = 10,
		star = 1,
		desc = "【1星】无尽试炼，每通关1波无尽深渊（全体模式），全体伙伴生命值+20点",
		id = 112,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"wujinshenyuan_quanti",
			1,
			500
		},
		effect_param = {
			{
				"hp_max",
				20
			}
		}
	},
	["112_2"] = {
		effect = "add_att",
		name = "蜡蜡果实",
		max_level = 20,
		star = 2,
		desc = "【2星】无尽试炼，每通关1波无尽深渊（全体模式），全体伙伴生命值+30点",
		id = 112,
		need_items = {
			{
				19112,
				10
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"atk",
				480
			},
			{
				"speed",
				4
			}
		},
		effect_cond = {
			"wujinshenyuan_quanti",
			1,
			500
		},
		effect_param = {
			{
				"hp_max",
				30
			}
		}
	},
	["112_3"] = {
		effect = "add_att",
		name = "蜡蜡果实",
		max_level = 30,
		star = 3,
		desc = "【3星】无尽试炼，每通关1波无尽深渊（全体模式），全体伙伴生命值+45点",
		id = 112,
		need_items = {
			{
				19112,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"atk",
				1080
			},
			{
				"speed",
				8
			}
		},
		effect_cond = {
			"wujinshenyuan_quanti",
			1,
			500
		},
		effect_param = {
			{
				"hp_max",
				45
			}
		}
	},
	["112_4"] = {
		effect = "add_att",
		name = "蜡蜡果实",
		max_level = 50,
		star = 4,
		desc = "【4星】无尽试炼，每通关1波无尽深渊（全体模式），全体伙伴生命值+65点",
		id = 112,
		need_items = {
			{
				19112,
				30
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"atk",
				1800
			},
			{
				"speed",
				12
			}
		},
		effect_cond = {
			"wujinshenyuan_quanti",
			1,
			500
		},
		effect_param = {
			{
				"hp_max",
				65
			}
		}
	},
	["112_5"] = {
		effect = "add_att",
		name = "蜡蜡果实",
		max_level = 70,
		star = 5,
		desc = "【5星】无尽试炼，每通关1波无尽深渊（全体模式），全体伙伴生命值+105点",
		id = 112,
		need_items = {
			{
				19112,
				60
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"atk",
				2640
			},
			{
				"speed",
				16
			}
		},
		effect_cond = {
			"wujinshenyuan_quanti",
			1,
			500
		},
		effect_param = {
			{
				"hp_max",
				105
			}
		}
	},
	["113_1"] = {
		effect = "add_att",
		name = "公斤果实",
		max_level = 10,
		star = 1,
		desc = "【1星】无尽试炼，每通关1波无尽深渊（梦魇模式），全体伙伴攻击力+2点",
		id = 113,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"wujinshenyuan_mengyan",
			1,
			500
		},
		effect_param = {
			{
				"atk",
				2
			}
		}
	},
	["113_2"] = {
		effect = "add_att",
		name = "公斤果实",
		max_level = 20,
		star = 2,
		desc = "【2星】无尽试炼，每通关1波无尽深渊（梦魇模式），全体伙伴攻击力+4点",
		id = 113,
		need_items = {
			{
				19113,
				10
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				2400
			},
			{
				"def",
				8
			}
		},
		effect_cond = {
			"wujinshenyuan_mengyan",
			1,
			500
		},
		effect_param = {
			{
				"atk",
				4
			}
		}
	},
	["113_3"] = {
		effect = "add_att",
		name = "公斤果实",
		max_level = 30,
		star = 3,
		desc = "【3星】无尽试炼，每通关1波无尽深渊（梦魇模式），全体伙伴攻击力+7点",
		id = 113,
		need_items = {
			{
				19113,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				5400
			},
			{
				"def",
				16
			}
		},
		effect_cond = {
			"wujinshenyuan_mengyan",
			1,
			500
		},
		effect_param = {
			{
				"atk",
				7
			}
		}
	},
	["113_4"] = {
		effect = "add_att",
		name = "公斤果实",
		max_level = 50,
		star = 4,
		desc = "【4星】无尽试炼，每通关1波无尽深渊（梦魇模式），全体伙伴攻击力+10点",
		id = 113,
		need_items = {
			{
				19113,
				30
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				9000
			},
			{
				"def",
				24
			}
		},
		effect_cond = {
			"wujinshenyuan_mengyan",
			1,
			500
		},
		effect_param = {
			{
				"atk",
				10
			}
		}
	},
	["113_5"] = {
		effect = "add_att",
		name = "公斤果实",
		max_level = 70,
		star = 5,
		desc = "【5星】无尽试炼，每通关1波无尽深渊（梦魇模式），全体伙伴攻击力+15点",
		id = 113,
		need_items = {
			{
				19113,
				60
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"def",
				32
			}
		},
		effect_cond = {
			"wujinshenyuan_mengyan",
			1,
			500
		},
		effect_param = {
			{
				"atk",
				15
			}
		}
	},
	["114_1"] = {
		effect = "other",
		name = "幻影果实",
		max_level = 10,
		star = 1,
		desc = "【1星】远航每刷新10次，20%额外获得1个史诗、传说或不朽任务",
		id = 114,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"yuanhang",
			10
		},
		effect_param = {
			200
		}
	},
	["114_2"] = {
		effect = "other",
		name = "幻影果实",
		max_level = 20,
		star = 2,
		desc = "【2星】远航每刷新10次，35%额外获得1个史诗、传说或不朽任务",
		id = 114,
		need_items = {
			{
				19114,
				10
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"atk",
				480
			},
			{
				"speed",
				4
			}
		},
		effect_cond = {
			"yuanhang",
			10
		},
		effect_param = {
			350
		}
	},
	["114_3"] = {
		effect = "other",
		name = "幻影果实",
		max_level = 30,
		star = 3,
		desc = "【3星】远航每刷新10次，50%额外获得1个史诗、传说或不朽任务",
		id = 114,
		need_items = {
			{
				19114,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"atk",
				1080
			},
			{
				"speed",
				8
			}
		},
		effect_cond = {
			"yuanhang",
			10
		},
		effect_param = {
			500
		}
	},
	["114_4"] = {
		effect = "other",
		name = "幻影果实",
		max_level = 50,
		star = 4,
		desc = "【4星】远航每刷新10次，65%额外获得1个史诗、传说或不朽任务",
		id = 114,
		need_items = {
			{
				19114,
				30
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"atk",
				1800
			},
			{
				"speed",
				12
			}
		},
		effect_cond = {
			"yuanhang",
			10
		},
		effect_param = {
			650
		}
	},
	["114_5"] = {
		effect = "other",
		name = "幻影果实",
		max_level = 70,
		star = 5,
		desc = "【5星】远航每刷新10次，80%额外获得1个史诗、传说或不朽任务",
		id = 114,
		need_items = {
			{
				19114,
				60
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"atk",
				2640
			},
			{
				"speed",
				16
			}
		},
		effect_cond = {
			"yuanhang",
			10
		},
		effect_param = {
			800
		}
	},
	["115_1"] = {
		effect = "other",
		name = "吞吞果实",
		max_level = 10,
		star = 1,
		desc = "【1星】伙伴背包上限+25",
		id = 115,
		need_items = {},
		need_partner = {},
		atts = {},
		effect_cond = {
			"beibao"
		},
		effect_param = {
			25
		}
	},
	["115_2"] = {
		effect = "other",
		name = "吞吞果实",
		max_level = 20,
		star = 2,
		desc = "【2星】伙伴背包上限+50",
		id = 115,
		need_items = {
			{
				19115,
				10
			}
		},
		need_partner = {
			{
				0,
				4,
				1
			}
		},
		atts = {
			{
				"hp_max",
				2400
			},
			{
				"def",
				8
			}
		},
		effect_cond = {
			"beibao"
		},
		effect_param = {
			50
		}
	},
	["115_3"] = {
		effect = "other",
		name = "吞吞果实",
		max_level = 30,
		star = 3,
		desc = "【3星】伙伴背包上限+75",
		id = 115,
		need_items = {
			{
				19115,
				20
			}
		},
		need_partner = {
			{
				0,
				4,
				3
			}
		},
		atts = {
			{
				"hp_max",
				5400
			},
			{
				"def",
				16
			}
		},
		effect_cond = {
			"beibao"
		},
		effect_param = {
			75
		}
	},
	["115_4"] = {
		effect = "other",
		name = "吞吞果实",
		max_level = 50,
		star = 4,
		desc = "【4星】伙伴背包上限+100",
		id = 115,
		need_items = {
			{
				19115,
				30
			}
		},
		need_partner = {
			{
				0,
				5,
				1
			}
		},
		atts = {
			{
				"hp_max",
				9000
			},
			{
				"def",
				24
			}
		},
		effect_cond = {
			"beibao"
		},
		effect_param = {
			100
		}
	},
	["115_5"] = {
		effect = "other",
		name = "吞吞果实",
		max_level = 70,
		star = 5,
		desc = "【5星】伙伴背包上限+125",
		id = 115,
		need_items = {
			{
				19115,
				60
			}
		},
		need_partner = {
			{
				0,
				5,
				2
			}
		},
		atts = {
			{
				"hp_max",
				13200
			},
			{
				"def",
				32
			}
		},
		effect_cond = {
			"beibao"
		},
		effect_param = {
			125
		}
	}
}

function Config.EmoguoshitujianData.data_get_emoguoshitujian_star_fun(slot0)
	slot1 = Config.EmoguoshitujianData.data_get_emoguoshitujian_star[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.EmoguoshitujianData.data_get_emoguoshitujian_star[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.EmoguoshitujianData.data_get_emoguoshitujian_juexing_length = 31
Config.EmoguoshitujianData.data_get_emoguoshitujian_juexing = {
	{
		id = 1,
		effect = "zhenying",
		name = "冰冻果实",
		desc = "【觉醒】水系伙伴，对克制单位造成的伤害额外+2%（至8%）",
		need_star = 6,
		need_items1 = {
			{
				19001,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"speed",
				5
			}
		},
		effect_cond = {},
		effect_param = {
			{
				1,
				2,
				20
			}
		}
	},
	{
		id = 2,
		effect = "zhenying",
		name = "烧烧果实",
		desc = "【觉醒】火系伙伴，对克制单位造成的伤害额外+2%（至8%）",
		need_star = 6,
		need_items1 = {
			{
				19002,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"atk",
				1300
			},
			{
				"def",
				12
			}
		},
		effect_cond = {},
		effect_param = {
			{
				2,
				3,
				20
			}
		}
	},
	{
		id = 3,
		effect = "zhenying",
		name = "沙沙果实",
		desc = "【觉醒】风系伙伴，对克制单位造成的伤害额外+2%（至8%）",
		need_star = 6,
		need_items1 = {
			{
				19003,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"atk",
				1300
			},
			{
				"speed",
				5
			}
		},
		effect_cond = {},
		effect_param = {
			{
				3,
				1,
				20
			}
		}
	},
	{
		id = 4,
		effect = "zhenying",
		name = "闪闪果实",
		desc = "【觉醒】光系伙伴，对克制单位造成的伤害额外+2%（至8%）",
		need_star = 6,
		need_items1 = {
			{
				19004,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"def",
				12
			}
		},
		effect_cond = {},
		effect_param = {
			{
				4,
				5,
				20
			}
		}
	},
	{
		id = 5,
		effect = "zhenying",
		name = "暗暗果实",
		desc = "【觉醒】暗系伙伴，对克制单位造成的伤害额外+2%（至8%）",
		need_star = 6,
		need_items1 = {
			{
				19005,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"atk",
				1300
			},
			{
				"def",
				12
			}
		},
		effect_cond = {},
		effect_param = {
			{
				5,
				4,
				20
			}
		}
	},
	{
		id = 6,
		effect = "add_att",
		name = "岩浆果实",
		desc = "【觉醒】每通关100层试练塔，全体伙伴伤害额外加成+0.1%（至0.7%）",
		need_star = 6,
		need_items1 = {
			{
				19006,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"def",
				12
			}
		},
		effect_cond = {
			"slzt",
			100,
			900
		},
		effect_param = {
			{
				"dam",
				7
			}
		}
	},
	{
		id = 7,
		effect = "add_att",
		name = "橡胶果实",
		desc = "【觉醒】全体伙伴伤害减免额外+1%（至6%）",
		need_star = 6,
		need_items1 = {
			{
				19007,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"atk",
				1300
			},
			{
				"def",
				12
			}
		},
		effect_cond = {},
		effect_param = {
			{
				"res",
				10
			}
		}
	},
	{
		id = 8,
		effect = "skill",
		name = "震震果实",
		desc = "【觉醒】战斗中，全体伙伴攻击时额外无视目标（3%+100）点防御（至12%+600）",
		need_star = 6,
		need_items1 = {
			{
				19008,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"def",
				12
			}
		},
		effect_cond = {},
		effect_param = {
			1010007
		}
	},
	{
		id = 9,
		effect = "other",
		name = "金金果实",
		desc = "【觉醒】额外刷新出一个随机专属天赋符石的概率提升10%（至50%）",
		need_star = 6,
		need_items1 = {
			{
				19009,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"atk",
				1300
			},
			{
				"def",
				12
			}
		},
		effect_cond = {
			"shop_tianfu",
			160
		},
		effect_param = {
			500
		}
	},
	{
		id = 10,
		effect = "other",
		name = "合体果实",
		desc = "【觉醒】额外获得10%（至50%）",
		need_star = 6,
		need_items1 = {
			{
				19010,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"speed",
				5
			}
		},
		effect_cond = {
			"fuwen_duanzao"
		},
		effect_param = {
			500
		}
	},
	{
		id = 11,
		effect = "add_att",
		name = "蛇蛇果实",
		desc = "【觉醒】每级额外+60点（至360点）",
		need_star = 6,
		need_items1 = {
			{
				19011,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"def",
				12
			}
		},
		effect_cond = {
			"zhanjian_jiagu",
			1,
			216
		},
		effect_param = {
			{
				"hp_max",
				360
			}
		}
	},
	{
		id = 12,
		effect = "add_att",
		name = "鱼鱼果实",
		desc = "【觉醒】每级额外+3点（至16点）",
		need_star = 6,
		need_items1 = {
			{
				19012,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"speed",
				5
			}
		},
		effect_cond = {
			"zhanjian_jineng",
			1,
			36
		},
		effect_param = {
			{
				"def",
				16
			}
		}
	},
	{
		id = 13,
		effect = "add_att",
		name = "犬犬果实",
		desc = "【觉醒】每级额外+50点（至210点）",
		need_star = 6,
		need_items1 = {
			{
				19013,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"atk",
				1300
			},
			{
				"def",
				12
			}
		},
		effect_cond = {
			"zhanjian_shengji",
			1,
			72
		},
		effect_param = {
			{
				"atk",
				210
			}
		}
	},
	{
		id = 14,
		effect = "add_att",
		name = "手术果实",
		desc = "【觉醒】每胜利10次，额外提升0.2%（至0.9%）",
		need_star = 6,
		need_items1 = {
			{
				19014,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"atk",
				1300
			},
			{
				"def",
				12
			}
		},
		effect_cond = {
			"zuduijingjichang",
			10,
			100
		},
		effect_param = {
			{
				"dam_p",
				9
			}
		}
	},
	{
		id = 15,
		effect = "add_att",
		name = "响雷果实",
		desc = "【觉醒】每胜利20次，额外提升0.2%（至0.9%）",
		need_star = 6,
		need_items1 = {
			{
				19015,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"hp_max",
				6500
			},
			{
				"def",
				12
			}
		},
		effect_cond = {
			"chaofanduanweisai",
			20,
			200
		},
		effect_param = {
			{
				"dam_s",
				9
			}
		}
	},
	{
		id = 16,
		effect = "add_att",
		name = "糯糯果实",
		desc = "【觉醒】每胜利100次，额外提升0.2%（至1.2%）",
		need_star = 6,
		need_items1 = {
			{
				19016,
				50
			},
			{
				1,
				750000
			}
		},
		need_items2 = {
			{
				19500,
				50
			}
		},
		atts = {
			{
				"atk",
				1300
			},
			{
				"speed",
				5
			}
		},
		effect_cond = {
			"jingjichang",
			100,
			1000
		},
		effect_param = {
			{
				"tenacity",
				12
			}
		}
	},
	[101] = {
		id = 101,
		effect = "other",
		name = "磁磁果实",
		desc = "【觉醒】贝里副本免费次数+1",
		need_star = 5,
		need_items1 = {
			{
				19101,
				30
			},
			{
				1,
				500000
			}
		},
		need_items2 = {
			{
				19501,
				60
			}
		},
		atts = {
			{
				"hp_max",
				4800
			},
			{
				"def",
				8
			}
		},
		effect_cond = {
			"beilifuben"
		},
		effect_param = {
			1
		}
	},
	[102] = {
		id = 102,
		effect = "other",
		name = "花花果实",
		desc = "【觉醒】经验副本免费次数+1",
		need_star = 5,
		need_items1 = {
			{
				19102,
				30
			},
			{
				1,
				500000
			}
		},
		need_items2 = {
			{
				19501,
				60
			}
		},
		atts = {
			{
				"atk",
				960
			},
			{
				"speed",
				4
			}
		},
		effect_cond = {
			"jingyanfuben"
		},
		effect_param = {
			1
		}
	},
	[103] = {
		id = 103,
		effect = "other",
		name = "人人果实",
		desc = "【觉醒】船坞副本免费次数+1",
		need_star = 5,
		need_items1 = {
			{
				19103,
				30
			},
			{
				1,
				500000
			}
		},
		need_items2 = {
			{
				19501,
				60
			}
		},
		atts = {
			{
				"atk",
				960
			},
			{
				"def",
				8
			}
		},
		effect_cond = {
			"chuanwufuben"
		},
		effect_param = {
			1
		}
	},
	[104] = {
		id = 104,
		effect = "other",
		name = "影影果实",
		desc = "【觉醒】位面重置时，免费获得1个恢复水晶",
		need_star = 5,
		need_items1 = {
			{
				19104,
				30
			},
			{
				1,
				500000
			}
		},
		need_items2 = {
			{
				19501,
				60
			}
		},
		atts = {
			{
				"hp_max",
				4800
			},
			{
				"speed",
				4
			}
		},
		effect_cond = {
			"weimianzhengzhan_chongzhi"
		},
		effect_param = {
			{
				10034,
				1
			}
		}
	},
	[105] = {
		id = 105,
		effect = "other",
		name = "笔笔果实",
		desc = "【觉醒】伙伴副本免费次数+1",
		need_star = 5,
		need_items1 = {
			{
				19105,
				30
			},
			{
				1,
				500000
			}
		},
		need_items2 = {
			{
				19501,
				60
			}
		},
		atts = {
			{
				"hp_max",
				4800
			},
			{
				"def",
				8
			}
		},
		effect_cond = {
			"huobanfuben"
		},
		effect_param = {
			1
		}
	},
	[106] = {
		id = 106,
		effect = "other",
		name = "线线果实",
		desc = "【觉醒】天界祈祷，每次祈祷有50%的概率额外获得1个洗练石",
		need_star = 5,
		need_items1 = {
			{
				19106,
				30
			},
			{
				1,
				500000
			}
		},
		need_items2 = {
			{
				19501,
				60
			}
		},
		atts = {
			{
				"hp_max",
				4800
			},
			{
				"speed",
				4
			}
		},
		effect_cond = {
			"tianjie_qidao"
		},
		effect_param = {
			{
				500,
				{
					10030,
					1
				}
			}
		}
	},
	[107] = {
		id = 107,
		effect = "other",
		name = "瓦斯果实",
		desc = "【觉醒】点金贝里收益额外+4%（至24%）",
		need_star = 5,
		need_items1 = {
			{
				19107,
				30
			},
			{
				1,
				500000
			}
		},
		need_items2 = {
			{
				19501,
				60
			}
		},
		atts = {
			{
				"atk",
				960
			},
			{
				"speed",
				4
			}
		},
		effect_cond = {
			"dianjin"
		},
		effect_param = {
			240
		}
	},
	[108] = {
		id = 108,
		effect = "add_att",
		name = "牛牛果实",
		desc = "【觉醒】恶魔果实基础属性提升100%",
		need_star = 5,
		need_items1 = {
			{
				19108,
				30
			},
			{
				1,
				500000
			}
		},
		need_items2 = {
			{
				19501,
				60
			}
		},
		atts = {
			{
				"hp_max",
				4800
			},
			{
				"speed",
				4
			}
		},
		effect_cond = {},
		effect_param = {
			{
				"hp_max",
				6000
			},
			{
				"speed",
				7
			}
		}
	},
	[109] = {
		id = 109,
		effect = "other",
		name = "滑滑果实",
		desc = "【觉醒】快速作战额外收益+4分钟（至24分钟）",
		need_star = 5,
		need_items1 = {
			{
				19109,
				30
			},
			{
				1,
				500000
			}
		},
		need_items2 = {
			{
				19501,
				60
			}
		},
		atts = {
			{
				"hp_max",
				4800
			},
			{
				"def",
				8
			}
		},
		effect_cond = {
			"kuaisuzuozhan"
		},
		effect_param = {
			24
		}
	},
	[110] = {
		id = 110,
		effect = "add_att",
		name = "爆炸果实",
		desc = "【觉醒】恶魔果实基础属性提升100%",
		need_star = 5,
		need_items1 = {
			{
				19110,
				30
			},
			{
				1,
				500000
			}
		},
		need_items2 = {
			{
				19501,
				60
			}
		},
		atts = {
			{
				"hp_max",
				4800
			},
			{
				"def",
				8
			}
		},
		effect_cond = {},
		effect_param = {
			{
				"hp_max",
				6000
			},
			{
				"def",
				15
			}
		}
	},
	[111] = {
		id = 111,
		effect = "add_att",
		name = "泡泡果实",
		desc = "【觉醒】恶魔果实基础属性提升100%",
		need_star = 5,
		need_items1 = {
			{
				19111,
				30
			},
			{
				1,
				500000
			}
		},
		need_items2 = {
			{
				19501,
				60
			}
		},
		atts = {
			{
				"atk",
				960
			},
			{
				"def",
				8
			}
		},
		effect_cond = {},
		effect_param = {
			{
				"atk",
				1200
			},
			{
				"def",
				15
			}
		}
	},
	[112] = {
		id = 112,
		effect = "add_att",
		name = "蜡蜡果实",
		desc = "【觉醒】恶魔果实基础属性提升100%",
		need_star = 5,
		need_items1 = {
			{
				19112,
				30
			},
			{
				1,
				500000
			}
		},
		need_items2 = {
			{
				19501,
				60
			}
		},
		atts = {
			{
				"atk",
				960
			},
			{
				"speed",
				4
			}
		},
		effect_cond = {},
		effect_param = {
			{
				"atk",
				1200
			},
			{
				"speed",
				7
			}
		}
	},
	[113] = {
		id = 113,
		effect = "add_att",
		name = "公斤果实",
		desc = "【觉醒】恶魔果实基础属性提升100%",
		need_star = 5,
		need_items1 = {
			{
				19113,
				30
			},
			{
				1,
				500000
			}
		},
		need_items2 = {
			{
				19501,
				60
			}
		},
		atts = {
			{
				"hp_max",
				4800
			},
			{
				"def",
				8
			}
		},
		effect_cond = {},
		effect_param = {
			{
				"hp_max",
				6000
			},
			{
				"def",
				15
			}
		}
	},
	[114] = {
		id = 114,
		effect = "other",
		name = "幻影果实",
		desc = "【觉醒】远航每刷新10次，100%额外获得1个史诗、传说或不朽任务",
		need_star = 5,
		need_items1 = {
			{
				19114,
				30
			},
			{
				1,
				500000
			}
		},
		need_items2 = {
			{
				19501,
				60
			}
		},
		atts = {
			{
				"atk",
				960
			},
			{
				"speed",
				4
			}
		},
		effect_cond = {
			"yuanhang",
			10
		},
		effect_param = {
			1000
		}
	},
	[115] = {
		id = 115,
		effect = "other",
		name = "吞吞果实",
		desc = "【觉醒】伙伴背包上限额外+25（至150）",
		need_star = 5,
		need_items1 = {
			{
				19115,
				30
			},
			{
				1,
				500000
			}
		},
		need_items2 = {
			{
				19501,
				60
			}
		},
		atts = {
			{
				"hp_max",
				4800
			},
			{
				"def",
				8
			}
		},
		effect_cond = {
			"beibao"
		},
		effect_param = {
			150
		}
	}
}

function Config.EmoguoshitujianData.data_get_emoguoshitujian_juexing_fun(slot0)
	slot1 = Config.EmoguoshitujianData.data_get_emoguoshitujian_juexing[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.EmoguoshitujianData.data_get_emoguoshitujian_juexing[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.EmoguoshitujianData.data_get_random_data_length = 4
Config.EmoguoshitujianData.data_get_random_data = {
	[10001] = {
		name = "果实秘宝",
		bid = 10001,
		need_jifen = 0,
		one_add_items = {
			{
				42,
				10
			}
		},
		ten_add_items = {
			{
				42,
				100
			}
		},
		one_need_items1 = {
			{
				3,
				300
			}
		},
		ten_need_items1 = {
			{
				3,
				3000
			}
		},
		one_need_items2 = {
			{
				10411,
				1
			}
		},
		ten_need_items2 = {
			{
				10411,
				10
			}
		}
	},
	[10002] = {
		name = "果实秘宝",
		bid = 10002,
		need_jifen = 2100,
		one_add_items = {
			{
				42,
				10
			}
		},
		ten_add_items = {
			{
				42,
				100
			}
		},
		one_need_items1 = {
			{
				3,
				300
			}
		},
		ten_need_items1 = {
			{
				3,
				3000
			}
		},
		one_need_items2 = {
			{
				10411,
				1
			}
		},
		ten_need_items2 = {
			{
				10411,
				10
			}
		}
	},
	[10003] = {
		name = "果实秘宝",
		bid = 10003,
		need_jifen = 4200,
		one_add_items = {
			{
				42,
				10
			}
		},
		ten_add_items = {
			{
				42,
				100
			}
		},
		one_need_items1 = {
			{
				3,
				300
			}
		},
		ten_need_items1 = {
			{
				3,
				3000
			}
		},
		one_need_items2 = {
			{
				10411,
				1
			}
		},
		ten_need_items2 = {
			{
				10411,
				10
			}
		}
	},
	[10004] = {
		name = "果实秘宝",
		bid = 10004,
		need_jifen = 6300,
		one_add_items = {
			{
				42,
				10
			}
		},
		ten_add_items = {
			{
				42,
				100
			}
		},
		one_need_items1 = {
			{
				3,
				300
			}
		},
		ten_need_items1 = {
			{
				3,
				3000
			}
		},
		one_need_items2 = {
			{
				10411,
				1
			}
		},
		ten_need_items2 = {
			{
				10411,
				10
			}
		}
	}
}

function Config.EmoguoshitujianData.data_get_random_data_fun(slot0)
	slot1 = Config.EmoguoshitujianData.data_get_random_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.EmoguoshitujianData.data_get_random_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.EmoguoshitujianData.data_get_random_do_data_length = 4
Config.EmoguoshitujianData.data_get_random_do_data = {
	[10004] = {
		{
			group_type = 1,
			name = "力量源质",
			not_get_n = 0,
			is_ten_get = 0,
			bid = 10004,
			first_get_n = 0,
			first_not_get_n = 0,
			group_id = 4001,
			weight = 7500,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "紫色恶魔果实碎片*3",
			not_get_n = 6,
			is_ten_get = 0,
			bid = 10004,
			first_get_n = 0,
			first_not_get_n = 0,
			group_id = 4002,
			weight = 1800,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "紫色恶魔果实碎片*30",
			not_get_n = 6,
			is_ten_get = 0,
			bid = 10004,
			first_get_n = 0,
			first_not_get_n = 0,
			group_id = 4003,
			weight = 500,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "橙色恶魔果实碎片*5",
			not_get_n = 8,
			is_ten_get = 0,
			bid = 10004,
			first_get_n = 19,
			first_not_get_n = 0,
			group_id = 4004,
			weight = 150,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "橙色恶魔果实碎片*50",
			not_get_n = 30,
			is_ten_get = 0,
			bid = 10004,
			first_get_n = 0,
			first_not_get_n = 20,
			group_id = 4005,
			weight = 50,
			must_get_n = 70
		}
	},
	[10003] = {
		{
			group_type = 1,
			name = "力量源质",
			not_get_n = 0,
			is_ten_get = 0,
			bid = 10003,
			first_get_n = 0,
			first_not_get_n = 0,
			group_id = 3001,
			weight = 7500,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "紫色恶魔果实碎片*3",
			not_get_n = 6,
			is_ten_get = 0,
			bid = 10003,
			first_get_n = 0,
			first_not_get_n = 0,
			group_id = 3002,
			weight = 1800,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "紫色恶魔果实碎片*30",
			not_get_n = 6,
			is_ten_get = 0,
			bid = 10003,
			first_get_n = 0,
			first_not_get_n = 0,
			group_id = 3003,
			weight = 500,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "橙色恶魔果实碎片*5",
			not_get_n = 8,
			is_ten_get = 0,
			bid = 10003,
			first_get_n = 19,
			first_not_get_n = 0,
			group_id = 3004,
			weight = 150,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "橙色恶魔果实碎片*50",
			not_get_n = 30,
			is_ten_get = 0,
			bid = 10003,
			first_get_n = 0,
			first_not_get_n = 20,
			group_id = 3005,
			weight = 50,
			must_get_n = 70
		}
	},
	[10002] = {
		{
			group_type = 1,
			name = "力量源质",
			not_get_n = 0,
			is_ten_get = 0,
			bid = 10002,
			first_get_n = 0,
			first_not_get_n = 0,
			group_id = 2001,
			weight = 7500,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "紫色恶魔果实碎片*3",
			not_get_n = 6,
			is_ten_get = 0,
			bid = 10002,
			first_get_n = 0,
			first_not_get_n = 0,
			group_id = 2002,
			weight = 1800,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "紫色恶魔果实碎片*30",
			not_get_n = 6,
			is_ten_get = 0,
			bid = 10002,
			first_get_n = 0,
			first_not_get_n = 0,
			group_id = 2003,
			weight = 500,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "橙色恶魔果实碎片*5",
			not_get_n = 8,
			is_ten_get = 0,
			bid = 10002,
			first_get_n = 19,
			first_not_get_n = 0,
			group_id = 2004,
			weight = 150,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "橙色恶魔果实碎片*50",
			not_get_n = 30,
			is_ten_get = 0,
			bid = 10002,
			first_get_n = 0,
			first_not_get_n = 20,
			group_id = 2005,
			weight = 50,
			must_get_n = 70
		}
	},
	[10001] = {
		{
			group_type = 1,
			name = "力量源质",
			not_get_n = 0,
			is_ten_get = 0,
			bid = 10001,
			first_get_n = 0,
			first_not_get_n = 0,
			group_id = 1001,
			weight = 7500,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "紫色恶魔果实碎片*3",
			not_get_n = 6,
			is_ten_get = 0,
			bid = 10001,
			first_get_n = 0,
			first_not_get_n = 0,
			group_id = 1002,
			weight = 1800,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "紫色恶魔果实碎片*30",
			not_get_n = 6,
			is_ten_get = 0,
			bid = 10001,
			first_get_n = 0,
			first_not_get_n = 0,
			group_id = 1003,
			weight = 500,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "橙色恶魔果实碎片*5",
			not_get_n = 8,
			is_ten_get = 0,
			bid = 10001,
			first_get_n = 19,
			first_not_get_n = 0,
			group_id = 1004,
			weight = 150,
			must_get_n = 0
		},
		{
			group_type = 1,
			name = "橙色恶魔果实碎片*50",
			not_get_n = 30,
			is_ten_get = 0,
			bid = 10001,
			first_get_n = 0,
			first_not_get_n = 20,
			group_id = 1005,
			weight = 50,
			must_get_n = 70
		}
	}
}
Config.EmoguoshitujianData.data_get_random_group_data_length = 20
Config.EmoguoshitujianData.data_get_random_group_data = {
	[4005] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10004,
			item_name = "犬犬果实碎片",
			item_id = 19013,
			id = 100336,
			group_id = 4005,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10004,
			item_name = "手术果实碎片",
			item_id = 19014,
			id = 100337,
			group_id = 4005,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10004,
			item_name = "响雷果实碎片",
			item_id = 19015,
			id = 100338,
			group_id = 4005,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10004,
			item_name = "糯糯果实碎片",
			item_id = 19016,
			id = 100339,
			group_id = 4005,
			weight = 100
		}
	},
	[4004] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10004,
			item_name = "犬犬果实碎片",
			item_id = 19013,
			id = 100332,
			group_id = 4004,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10004,
			item_name = "手术果实碎片",
			item_id = 19014,
			id = 100333,
			group_id = 4004,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10004,
			item_name = "响雷果实碎片",
			item_id = 19015,
			id = 100334,
			group_id = 4004,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10004,
			item_name = "糯糯果实碎片",
			item_id = 19016,
			id = 100335,
			group_id = 4004,
			weight = 100
		}
	},
	[4003] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19101,
			id = 100317,
			group_id = 4003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19102,
			id = 100318,
			group_id = 4003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19103,
			id = 100319,
			group_id = 4003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19104,
			id = 100320,
			group_id = 4003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19105,
			id = 100321,
			group_id = 4003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19106,
			id = 100322,
			group_id = 4003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19107,
			id = 100323,
			group_id = 4003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19108,
			id = 100324,
			group_id = 4003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19109,
			id = 100325,
			group_id = 4003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19110,
			id = 100326,
			group_id = 4003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19111,
			id = 100327,
			group_id = 4003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			id = 100328,
			group_id = 4003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10004,
			item_name = "公斤果实碎片",
			item_id = 19113,
			id = 100329,
			group_id = 4003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10004,
			item_name = "幻影果实碎片",
			item_id = 19114,
			id = 100330,
			group_id = 4003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10004,
			item_name = "吞吞果实碎片",
			item_id = 19115,
			id = 100331,
			group_id = 4003,
			weight = 100
		}
	},
	[4002] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19101,
			id = 100302,
			group_id = 4002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19102,
			id = 100303,
			group_id = 4002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19103,
			id = 100304,
			group_id = 4002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19104,
			id = 100305,
			group_id = 4002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19105,
			id = 100306,
			group_id = 4002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19106,
			id = 100307,
			group_id = 4002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19107,
			id = 100308,
			group_id = 4002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19108,
			id = 100309,
			group_id = 4002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19109,
			id = 100310,
			group_id = 4002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19110,
			id = 100311,
			group_id = 4002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19111,
			id = 100312,
			group_id = 4002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10004,
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			id = 100313,
			group_id = 4002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10004,
			item_name = "公斤果实碎片",
			item_id = 19113,
			id = 100314,
			group_id = 4002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10004,
			item_name = "幻影果实碎片",
			item_id = 19114,
			id = 100315,
			group_id = 4002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10004,
			item_name = "吞吞果实碎片",
			item_id = 19115,
			id = 100316,
			group_id = 4002,
			weight = 100
		}
	},
	[4001] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 100,
			bid = 10004,
			item_name = "力量源质",
			item_id = 19502,
			id = 100301,
			group_id = 4001,
			weight = 100
		}
	},
	[3005] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10003,
			item_name = "橡胶果实碎片",
			item_id = 19007,
			id = 100236,
			group_id = 3005,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10003,
			item_name = "震震果实碎片",
			item_id = 19008,
			id = 100237,
			group_id = 3005,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10003,
			item_name = "蛇蛇果实碎片",
			item_id = 19003,
			id = 100238,
			group_id = 3005,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10003,
			item_name = "鱼鱼果实碎片",
			item_id = 19006,
			id = 100239,
			group_id = 3005,
			weight = 100
		}
	},
	[3004] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10003,
			item_name = "橡胶果实碎片",
			item_id = 19007,
			id = 100232,
			group_id = 3004,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10003,
			item_name = "震震果实碎片",
			item_id = 19008,
			id = 100233,
			group_id = 3004,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10003,
			item_name = "蛇蛇果实碎片",
			item_id = 19003,
			id = 100234,
			group_id = 3004,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10003,
			item_name = "鱼鱼果实碎片",
			item_id = 19006,
			id = 100235,
			group_id = 3004,
			weight = 100
		}
	},
	[3003] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19101,
			id = 100217,
			group_id = 3003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19102,
			id = 100218,
			group_id = 3003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19103,
			id = 100219,
			group_id = 3003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19104,
			id = 100220,
			group_id = 3003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19105,
			id = 100221,
			group_id = 3003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19106,
			id = 100222,
			group_id = 3003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19107,
			id = 100223,
			group_id = 3003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19108,
			id = 100224,
			group_id = 3003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19109,
			id = 100225,
			group_id = 3003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19110,
			id = 100226,
			group_id = 3003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19111,
			id = 100227,
			group_id = 3003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			id = 100228,
			group_id = 3003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10003,
			item_name = "公斤果实碎片",
			item_id = 19113,
			id = 100229,
			group_id = 3003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10003,
			item_name = "幻影果实碎片",
			item_id = 19114,
			id = 100230,
			group_id = 3003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10003,
			item_name = "吞吞果实碎片",
			item_id = 19115,
			id = 100231,
			group_id = 3003,
			weight = 100
		}
	},
	[3002] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19101,
			id = 100202,
			group_id = 3002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19102,
			id = 100203,
			group_id = 3002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19103,
			id = 100204,
			group_id = 3002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19104,
			id = 100205,
			group_id = 3002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19105,
			id = 100206,
			group_id = 3002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19106,
			id = 100207,
			group_id = 3002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19107,
			id = 100208,
			group_id = 3002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19108,
			id = 100209,
			group_id = 3002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19109,
			id = 100210,
			group_id = 3002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19110,
			id = 100211,
			group_id = 3002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19111,
			id = 100212,
			group_id = 3002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10003,
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			id = 100213,
			group_id = 3002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10003,
			item_name = "公斤果实碎片",
			item_id = 19113,
			id = 100214,
			group_id = 3002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10003,
			item_name = "幻影果实碎片",
			item_id = 19114,
			id = 100215,
			group_id = 3002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10003,
			item_name = "吞吞果实碎片",
			item_id = 19115,
			id = 100216,
			group_id = 3002,
			weight = 100
		}
	},
	[3001] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 100,
			bid = 10003,
			item_name = "力量源质",
			item_id = 19502,
			id = 100201,
			group_id = 3001,
			weight = 100
		}
	},
	[2005] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10002,
			item_name = "闪闪果实碎片",
			item_id = 19004,
			id = 100136,
			group_id = 2005,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10002,
			item_name = "暗暗果实碎片",
			item_id = 19005,
			id = 100137,
			group_id = 2005,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10002,
			item_name = "金金果实碎片",
			item_id = 19009,
			id = 100138,
			group_id = 2005,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10002,
			item_name = "合体果实碎片",
			item_id = 19010,
			id = 100139,
			group_id = 2005,
			weight = 100
		}
	},
	[2004] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10002,
			item_name = "闪闪果实碎片",
			item_id = 19004,
			id = 100132,
			group_id = 2004,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10002,
			item_name = "暗暗果实碎片",
			item_id = 19005,
			id = 100133,
			group_id = 2004,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10002,
			item_name = "金金果实碎片",
			item_id = 19009,
			id = 100134,
			group_id = 2004,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10002,
			item_name = "合体果实碎片",
			item_id = 19010,
			id = 100135,
			group_id = 2004,
			weight = 100
		}
	},
	[2003] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10002,
			item_name = "磁磁果实碎片",
			item_id = 19101,
			id = 100117,
			group_id = 2003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10002,
			item_name = "花花果实碎片",
			item_id = 19102,
			id = 100118,
			group_id = 2003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10002,
			item_name = "人人果实碎片",
			item_id = 19103,
			id = 100119,
			group_id = 2003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10002,
			item_name = "影影果实碎片",
			item_id = 19104,
			id = 100120,
			group_id = 2003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10002,
			item_name = "笔笔果实碎片",
			item_id = 19105,
			id = 100121,
			group_id = 2003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10002,
			item_name = "线线果实碎片",
			item_id = 19106,
			id = 100122,
			group_id = 2003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10002,
			item_name = "瓦斯果实碎片",
			item_id = 19107,
			id = 100123,
			group_id = 2003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10002,
			item_name = "牛牛果实碎片",
			item_id = 19108,
			id = 100124,
			group_id = 2003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10002,
			item_name = "滑滑果实碎片",
			item_id = 19109,
			id = 100125,
			group_id = 2003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10002,
			item_name = "爆炸果实碎片",
			item_id = 19110,
			id = 100126,
			group_id = 2003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10002,
			item_name = "泡泡果实碎片",
			item_id = 19111,
			id = 100127,
			group_id = 2003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10002,
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			id = 100128,
			group_id = 2003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10002,
			item_name = "公斤果实碎片",
			item_id = 19113,
			id = 100129,
			group_id = 2003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10002,
			item_name = "幻影果实碎片",
			item_id = 19114,
			id = 100130,
			group_id = 2003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10002,
			item_name = "吞吞果实碎片",
			item_id = 19115,
			id = 100131,
			group_id = 2003,
			weight = 100
		}
	},
	[2002] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10002,
			item_name = "磁磁果实碎片",
			item_id = 19101,
			id = 100102,
			group_id = 2002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10002,
			item_name = "花花果实碎片",
			item_id = 19102,
			id = 100103,
			group_id = 2002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10002,
			item_name = "人人果实碎片",
			item_id = 19103,
			id = 100104,
			group_id = 2002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10002,
			item_name = "影影果实碎片",
			item_id = 19104,
			id = 100105,
			group_id = 2002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10002,
			item_name = "笔笔果实碎片",
			item_id = 19105,
			id = 100106,
			group_id = 2002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10002,
			item_name = "线线果实碎片",
			item_id = 19106,
			id = 100107,
			group_id = 2002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10002,
			item_name = "瓦斯果实碎片",
			item_id = 19107,
			id = 100108,
			group_id = 2002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10002,
			item_name = "牛牛果实碎片",
			item_id = 19108,
			id = 100109,
			group_id = 2002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10002,
			item_name = "滑滑果实碎片",
			item_id = 19109,
			id = 100110,
			group_id = 2002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10002,
			item_name = "爆炸果实碎片",
			item_id = 19110,
			id = 100111,
			group_id = 2002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10002,
			item_name = "泡泡果实碎片",
			item_id = 19111,
			id = 100112,
			group_id = 2002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10002,
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			id = 100113,
			group_id = 2002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10002,
			item_name = "公斤果实碎片",
			item_id = 19113,
			id = 100114,
			group_id = 2002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10002,
			item_name = "幻影果实碎片",
			item_id = 19114,
			id = 100115,
			group_id = 2002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10002,
			item_name = "吞吞果实碎片",
			item_id = 19115,
			id = 100116,
			group_id = 2002,
			weight = 100
		}
	},
	[2001] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 100,
			bid = 10002,
			item_name = "力量源质",
			item_id = 19502,
			id = 100101,
			group_id = 2001,
			weight = 100
		}
	},
	[1005] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10001,
			item_name = "冰冻果实碎片",
			item_id = 19001,
			id = 100036,
			group_id = 1005,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10001,
			item_name = "烧烧果实碎片",
			item_id = 19002,
			id = 100037,
			group_id = 1005,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10001,
			item_name = "沙沙果实碎片",
			item_id = 19003,
			id = 100038,
			group_id = 1005,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 50,
			item_num = 50,
			bid = 10001,
			item_name = "岩浆果实碎片",
			item_id = 19006,
			id = 100039,
			group_id = 1005,
			weight = 100
		}
	},
	[1004] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10001,
			item_name = "冰冻果实碎片",
			item_id = 19001,
			id = 100032,
			group_id = 1004,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10001,
			item_name = "烧烧果实碎片",
			item_id = 19002,
			id = 100033,
			group_id = 1004,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10001,
			item_name = "沙沙果实碎片",
			item_id = 19003,
			id = 100034,
			group_id = 1004,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 5,
			bid = 10001,
			item_name = "岩浆果实碎片",
			item_id = 19004,
			id = 100035,
			group_id = 1004,
			weight = 100
		}
	},
	[1003] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10001,
			item_name = "岩浆果实碎片",
			item_id = 19101,
			id = 100017,
			group_id = 1003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10001,
			item_name = "岩浆果实碎片",
			item_id = 19102,
			id = 100018,
			group_id = 1003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10001,
			item_name = "岩浆果实碎片",
			item_id = 19103,
			id = 100019,
			group_id = 1003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10001,
			item_name = "岩浆果实碎片",
			item_id = 19104,
			id = 100020,
			group_id = 1003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10001,
			item_name = "岩浆果实碎片",
			item_id = 19105,
			id = 100021,
			group_id = 1003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10001,
			item_name = "岩浆果实碎片",
			item_id = 19106,
			id = 100022,
			group_id = 1003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10001,
			item_name = "岩浆果实碎片",
			item_id = 19107,
			id = 100023,
			group_id = 1003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10001,
			item_name = "岩浆果实碎片",
			item_id = 19108,
			id = 100024,
			group_id = 1003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10001,
			item_name = "岩浆果实碎片",
			item_id = 19109,
			id = 100025,
			group_id = 1003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10001,
			item_name = "岩浆果实碎片",
			item_id = 19110,
			id = 100026,
			group_id = 1003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10001,
			item_name = "岩浆果实碎片",
			item_id = 19111,
			id = 100027,
			group_id = 1003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10001,
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			id = 100028,
			group_id = 1003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10001,
			item_name = "公斤果实碎片",
			item_id = 19113,
			id = 100029,
			group_id = 1003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10001,
			item_name = "幻影果实碎片",
			item_id = 19114,
			id = 100030,
			group_id = 1003,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 600,
			item_num = 30,
			bid = 10001,
			item_name = "吞吞果实碎片",
			item_id = 19115,
			id = 100031,
			group_id = 1003,
			weight = 100
		}
	},
	[1002] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10001,
			item_name = "蜡蜡果实碎片",
			item_id = 19101,
			id = 100002,
			group_id = 1002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10001,
			item_name = "蜡蜡果实碎片",
			item_id = 19102,
			id = 100003,
			group_id = 1002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10001,
			item_name = "蜡蜡果实碎片",
			item_id = 19103,
			id = 100004,
			group_id = 1002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10001,
			item_name = "蜡蜡果实碎片",
			item_id = 19104,
			id = 100005,
			group_id = 1002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10001,
			item_name = "蜡蜡果实碎片",
			item_id = 19105,
			id = 100006,
			group_id = 1002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10001,
			item_name = "蜡蜡果实碎片",
			item_id = 19106,
			id = 100007,
			group_id = 1002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10001,
			item_name = "蜡蜡果实碎片",
			item_id = 19107,
			id = 100008,
			group_id = 1002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10001,
			item_name = "蜡蜡果实碎片",
			item_id = 19108,
			id = 100009,
			group_id = 1002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10001,
			item_name = "蜡蜡果实碎片",
			item_id = 19109,
			id = 100010,
			group_id = 1002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10001,
			item_name = "蜡蜡果实碎片",
			item_id = 19110,
			id = 100011,
			group_id = 1002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10001,
			item_name = "蜡蜡果实碎片",
			item_id = 19111,
			id = 100012,
			group_id = 1002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10001,
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			id = 100013,
			group_id = 1002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10001,
			item_name = "公斤果实碎片",
			item_id = 19113,
			id = 100014,
			group_id = 1002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10001,
			item_name = "幻影果实碎片",
			item_id = 19114,
			id = 100015,
			group_id = 1002,
			weight = 100
		},
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 3,
			bid = 10001,
			item_name = "吞吞果实碎片",
			item_id = 19115,
			id = 100016,
			group_id = 1002,
			weight = 100
		}
	},
	[1001] = {
		{
			is_notice = 0,
			name = "魔盒秘宝",
			must_after_m_times = 0,
			up_add_weight = 0,
			item_num = 100,
			bid = 10001,
			item_name = "力量源质",
			item_id = 19502,
			id = 100001,
			group_id = 1001,
			weight = 100
		}
	}
}
Config.EmoguoshitujianData.data_get_random_show_data_length = 4
Config.EmoguoshitujianData.data_get_random_show_data = {
	[10001] = {
		{
			item_name = "冰冻果实碎片",
			item_id = 19001,
			prob = 0.00375,
			item_num = 5,
			bid = 10001
		},
		{
			item_name = "烧烧果实碎片",
			item_id = 19002,
			prob = 0.00375,
			item_num = 5,
			bid = 10001
		},
		{
			item_name = "沙沙果实i碎片",
			item_id = 19003,
			prob = 0.00375,
			item_num = 5,
			bid = 10001
		},
		{
			item_name = "岩浆果实碎片",
			item_id = 19006,
			prob = 0.00375,
			item_num = 5,
			bid = 10001
		},
		{
			item_name = "冰冻果实碎片",
			item_id = 19001,
			prob = 0.00125,
			item_num = 50,
			bid = 10001
		},
		{
			item_name = "烧烧果实碎片",
			item_id = 19002,
			prob = 0.00125,
			item_num = 50,
			bid = 10001
		},
		{
			item_name = "沙沙果实i碎片",
			item_id = 19003,
			prob = 0.00125,
			item_num = 50,
			bid = 10001
		},
		{
			item_name = "岩浆果实碎片",
			item_id = 19006,
			prob = 0.00125,
			item_num = 50,
			bid = 10001
		},
		{
			item_name = "磁磁果实碎片",
			item_id = 19101,
			prob = 0.012,
			item_num = 3,
			bid = 10001
		},
		{
			item_name = "花花果实碎片",
			item_id = 19102,
			prob = 0.012,
			item_num = 3,
			bid = 10001
		},
		{
			item_name = "人人果实碎片",
			item_id = 19103,
			prob = 0.012,
			item_num = 3,
			bid = 10001
		},
		{
			item_name = "影影果实碎片",
			item_id = 19104,
			prob = 0.012,
			item_num = 3,
			bid = 10001
		},
		{
			item_name = "笔笔果实碎片",
			item_id = 19105,
			prob = 0.012,
			item_num = 3,
			bid = 10001
		},
		{
			item_name = "线线果实碎片",
			item_id = 19106,
			prob = 0.012,
			item_num = 3,
			bid = 10001
		},
		{
			item_name = "瓦斯果实碎片",
			item_id = 19107,
			prob = 0.012,
			item_num = 3,
			bid = 10001
		},
		{
			item_name = "牛牛果实碎片",
			item_id = 19108,
			prob = 0.012,
			item_num = 3,
			bid = 10001
		},
		{
			item_name = "滑滑果实碎片",
			item_id = 19109,
			prob = 0.012,
			item_num = 3,
			bid = 10001
		},
		{
			item_name = "爆炸果实碎片",
			item_id = 19110,
			prob = 0.012,
			item_num = 3,
			bid = 10001
		},
		{
			item_name = "泡泡果实碎片",
			item_id = 19111,
			prob = 0.012,
			item_num = 3,
			bid = 10001
		},
		{
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			prob = 0.012,
			item_num = 3,
			bid = 10001
		},
		{
			item_name = "公斤果实碎片",
			item_id = 19113,
			prob = 0.012,
			item_num = 3,
			bid = 10001
		},
		{
			item_name = "幻影果实碎片",
			item_id = 19114,
			prob = 0.012,
			item_num = 3,
			bid = 10001
		},
		{
			item_name = "吞吞果实碎片",
			item_id = 19115,
			prob = 0.012,
			item_num = 3,
			bid = 10001
		},
		{
			item_name = "磁磁果实碎片",
			item_id = 19101,
			prob = 0.0034,
			item_num = 30,
			bid = 10001
		},
		{
			item_name = "花花果实碎片",
			item_id = 19102,
			prob = 0.0034,
			item_num = 30,
			bid = 10001
		},
		{
			item_name = "人人果实碎片",
			item_id = 19103,
			prob = 0.0034,
			item_num = 30,
			bid = 10001
		},
		{
			item_name = "影影果实碎片",
			item_id = 19104,
			prob = 0.0034,
			item_num = 30,
			bid = 10001
		},
		{
			item_name = "笔笔果实碎片",
			item_id = 19105,
			prob = 0.0034,
			item_num = 30,
			bid = 10001
		},
		{
			item_name = "线线果实碎片",
			item_id = 19106,
			prob = 0.0033,
			item_num = 30,
			bid = 10001
		},
		{
			item_name = "瓦斯果实碎片",
			item_id = 19107,
			prob = 0.0033,
			item_num = 30,
			bid = 10001
		},
		{
			item_name = "牛牛果实碎片",
			item_id = 19108,
			prob = 0.0033,
			item_num = 30,
			bid = 10001
		},
		{
			item_name = "滑滑果实碎片",
			item_id = 19109,
			prob = 0.0033,
			item_num = 30,
			bid = 10001
		},
		{
			item_name = "爆炸果实碎片",
			item_id = 19110,
			prob = 0.0033,
			item_num = 30,
			bid = 10001
		},
		{
			item_name = "泡泡果实碎片",
			item_id = 19111,
			prob = 0.0033,
			item_num = 30,
			bid = 10001
		},
		{
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			prob = 0.0033,
			item_num = 30,
			bid = 10001
		},
		{
			item_name = "公斤果实碎片",
			item_id = 19113,
			prob = 0.0033,
			item_num = 30,
			bid = 10001
		},
		{
			item_name = "幻影果实碎片",
			item_id = 19114,
			prob = 0.0033,
			item_num = 30,
			bid = 10001
		},
		{
			item_name = "吞吞果实碎片",
			item_id = 19115,
			prob = 0.0033,
			item_num = 30,
			bid = 10001
		},
		{
			item_name = "力量源质",
			item_id = 19502,
			prob = 0.75,
			item_num = 100,
			bid = 10001
		}
	},
	[10002] = {
		{
			item_name = "闪闪果实碎片",
			item_id = 19004,
			prob = 0.00375,
			item_num = 5,
			bid = 10002
		},
		{
			item_name = "暗暗果实碎片",
			item_id = 19005,
			prob = 0.00375,
			item_num = 5,
			bid = 10002
		},
		{
			item_name = "金金果实i碎片",
			item_id = 19009,
			prob = 0.00375,
			item_num = 5,
			bid = 10002
		},
		{
			item_name = "合体果实碎片",
			item_id = 19010,
			prob = 0.00375,
			item_num = 5,
			bid = 10002
		},
		{
			item_name = "闪闪果实碎片",
			item_id = 19004,
			prob = 0.00125,
			item_num = 50,
			bid = 10002
		},
		{
			item_name = "暗暗果实碎片",
			item_id = 19005,
			prob = 0.00125,
			item_num = 50,
			bid = 10002
		},
		{
			item_name = "金金果实i碎片",
			item_id = 19009,
			prob = 0.00125,
			item_num = 50,
			bid = 10002
		},
		{
			item_name = "合体果实碎片",
			item_id = 19010,
			prob = 0.00125,
			item_num = 50,
			bid = 10002
		},
		{
			item_name = "磁磁果实碎片",
			item_id = 19101,
			prob = 0.012,
			item_num = 3,
			bid = 10002
		},
		{
			item_name = "花花果实碎片",
			item_id = 19102,
			prob = 0.012,
			item_num = 3,
			bid = 10002
		},
		{
			item_name = "人人果实碎片",
			item_id = 19103,
			prob = 0.012,
			item_num = 3,
			bid = 10002
		},
		{
			item_name = "影影果实碎片",
			item_id = 19104,
			prob = 0.012,
			item_num = 3,
			bid = 10002
		},
		{
			item_name = "笔笔果实碎片",
			item_id = 19105,
			prob = 0.012,
			item_num = 3,
			bid = 10002
		},
		{
			item_name = "线线果实碎片",
			item_id = 19106,
			prob = 0.012,
			item_num = 3,
			bid = 10002
		},
		{
			item_name = "瓦斯果实碎片",
			item_id = 19107,
			prob = 0.012,
			item_num = 3,
			bid = 10002
		},
		{
			item_name = "牛牛果实碎片",
			item_id = 19108,
			prob = 0.012,
			item_num = 3,
			bid = 10002
		},
		{
			item_name = "滑滑果实碎片",
			item_id = 19109,
			prob = 0.012,
			item_num = 3,
			bid = 10002
		},
		{
			item_name = "爆炸果实碎片",
			item_id = 19110,
			prob = 0.012,
			item_num = 3,
			bid = 10002
		},
		{
			item_name = "泡泡果实碎片",
			item_id = 19111,
			prob = 0.012,
			item_num = 3,
			bid = 10002
		},
		{
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			prob = 0.012,
			item_num = 3,
			bid = 10002
		},
		{
			item_name = "公斤果实碎片",
			item_id = 19113,
			prob = 0.012,
			item_num = 3,
			bid = 10002
		},
		{
			item_name = "幻影果实碎片",
			item_id = 19114,
			prob = 0.012,
			item_num = 3,
			bid = 10002
		},
		{
			item_name = "吞吞果实碎片",
			item_id = 19115,
			prob = 0.012,
			item_num = 3,
			bid = 10002
		},
		{
			item_name = "磁磁果实碎片",
			item_id = 19101,
			prob = 0.0034,
			item_num = 30,
			bid = 10002
		},
		{
			item_name = "花花果实碎片",
			item_id = 19102,
			prob = 0.0034,
			item_num = 30,
			bid = 10002
		},
		{
			item_name = "人人果实碎片",
			item_id = 19103,
			prob = 0.0034,
			item_num = 30,
			bid = 10002
		},
		{
			item_name = "影影果实碎片",
			item_id = 19104,
			prob = 0.0034,
			item_num = 30,
			bid = 10002
		},
		{
			item_name = "笔笔果实碎片",
			item_id = 19105,
			prob = 0.0034,
			item_num = 30,
			bid = 10002
		},
		{
			item_name = "线线果实碎片",
			item_id = 19106,
			prob = 0.0033,
			item_num = 30,
			bid = 10002
		},
		{
			item_name = "瓦斯果实碎片",
			item_id = 19107,
			prob = 0.0033,
			item_num = 30,
			bid = 10002
		},
		{
			item_name = "牛牛果实碎片",
			item_id = 19108,
			prob = 0.0033,
			item_num = 30,
			bid = 10002
		},
		{
			item_name = "滑滑果实碎片",
			item_id = 19109,
			prob = 0.0033,
			item_num = 30,
			bid = 10002
		},
		{
			item_name = "爆炸果实碎片",
			item_id = 19110,
			prob = 0.0033,
			item_num = 30,
			bid = 10002
		},
		{
			item_name = "泡泡果实碎片",
			item_id = 19111,
			prob = 0.0033,
			item_num = 30,
			bid = 10002
		},
		{
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			prob = 0.0033,
			item_num = 30,
			bid = 10002
		},
		{
			item_name = "公斤果实碎片",
			item_id = 19113,
			prob = 0.0033,
			item_num = 30,
			bid = 10002
		},
		{
			item_name = "幻影果实碎片",
			item_id = 19114,
			prob = 0.0033,
			item_num = 30,
			bid = 10002
		},
		{
			item_name = "吞吞果实碎片",
			item_id = 19115,
			prob = 0.0033,
			item_num = 30,
			bid = 10002
		},
		{
			item_name = "力量源质",
			item_id = 19502,
			prob = 0.75,
			item_num = 100,
			bid = 10002
		}
	},
	[10003] = {
		{
			item_name = "橡胶果实碎片",
			item_id = 19007,
			prob = 0.00375,
			item_num = 5,
			bid = 10003
		},
		{
			item_name = "震震果实碎片",
			item_id = 19008,
			prob = 0.00375,
			item_num = 5,
			bid = 10003
		},
		{
			item_name = "蛇蛇果实i碎片",
			item_id = 19003,
			prob = 0.00375,
			item_num = 5,
			bid = 10003
		},
		{
			item_name = "鱼鱼果实碎片",
			item_id = 19006,
			prob = 0.00375,
			item_num = 5,
			bid = 10003
		},
		{
			item_name = "橡胶果实碎片",
			item_id = 19007,
			prob = 0.00125,
			item_num = 50,
			bid = 10003
		},
		{
			item_name = "震震果实碎片",
			item_id = 19008,
			prob = 0.00125,
			item_num = 50,
			bid = 10003
		},
		{
			item_name = "蛇蛇果实i碎片",
			item_id = 19003,
			prob = 0.00125,
			item_num = 50,
			bid = 10003
		},
		{
			item_name = "鱼鱼果实碎片",
			item_id = 19006,
			prob = 0.00125,
			item_num = 50,
			bid = 10003
		},
		{
			item_name = "磁磁果实碎片",
			item_id = 19101,
			prob = 0.012,
			item_num = 3,
			bid = 10003
		},
		{
			item_name = "花花果实碎片",
			item_id = 19102,
			prob = 0.012,
			item_num = 3,
			bid = 10003
		},
		{
			item_name = "人人果实碎片",
			item_id = 19103,
			prob = 0.012,
			item_num = 3,
			bid = 10003
		},
		{
			item_name = "影影果实碎片",
			item_id = 19104,
			prob = 0.012,
			item_num = 3,
			bid = 10003
		},
		{
			item_name = "笔笔果实碎片",
			item_id = 19105,
			prob = 0.012,
			item_num = 3,
			bid = 10003
		},
		{
			item_name = "线线果实碎片",
			item_id = 19106,
			prob = 0.012,
			item_num = 3,
			bid = 10003
		},
		{
			item_name = "瓦斯果实碎片",
			item_id = 19107,
			prob = 0.012,
			item_num = 3,
			bid = 10003
		},
		{
			item_name = "牛牛果实碎片",
			item_id = 19108,
			prob = 0.012,
			item_num = 3,
			bid = 10003
		},
		{
			item_name = "滑滑果实碎片",
			item_id = 19109,
			prob = 0.012,
			item_num = 3,
			bid = 10003
		},
		{
			item_name = "爆炸果实碎片",
			item_id = 19110,
			prob = 0.012,
			item_num = 3,
			bid = 10003
		},
		{
			item_name = "泡泡果实碎片",
			item_id = 19111,
			prob = 0.012,
			item_num = 3,
			bid = 10003
		},
		{
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			prob = 0.012,
			item_num = 3,
			bid = 10003
		},
		{
			item_name = "公斤果实碎片",
			item_id = 19113,
			prob = 0.012,
			item_num = 3,
			bid = 10003
		},
		{
			item_name = "幻影果实碎片",
			item_id = 19114,
			prob = 0.012,
			item_num = 3,
			bid = 10003
		},
		{
			item_name = "吞吞果实碎片",
			item_id = 19115,
			prob = 0.012,
			item_num = 3,
			bid = 10003
		},
		{
			item_name = "磁磁果实碎片",
			item_id = 19101,
			prob = 0.0034,
			item_num = 30,
			bid = 10003
		},
		{
			item_name = "花花果实碎片",
			item_id = 19102,
			prob = 0.0034,
			item_num = 30,
			bid = 10003
		},
		{
			item_name = "人人果实碎片",
			item_id = 19103,
			prob = 0.0034,
			item_num = 30,
			bid = 10003
		},
		{
			item_name = "影影果实碎片",
			item_id = 19104,
			prob = 0.0034,
			item_num = 30,
			bid = 10003
		},
		{
			item_name = "笔笔果实碎片",
			item_id = 19105,
			prob = 0.0034,
			item_num = 30,
			bid = 10003
		},
		{
			item_name = "线线果实碎片",
			item_id = 19106,
			prob = 0.0033,
			item_num = 30,
			bid = 10003
		},
		{
			item_name = "瓦斯果实碎片",
			item_id = 19107,
			prob = 0.0033,
			item_num = 30,
			bid = 10003
		},
		{
			item_name = "牛牛果实碎片",
			item_id = 19108,
			prob = 0.0033,
			item_num = 30,
			bid = 10003
		},
		{
			item_name = "滑滑果实碎片",
			item_id = 19109,
			prob = 0.0033,
			item_num = 30,
			bid = 10003
		},
		{
			item_name = "爆炸果实碎片",
			item_id = 19110,
			prob = 0.0033,
			item_num = 30,
			bid = 10003
		},
		{
			item_name = "泡泡果实碎片",
			item_id = 19111,
			prob = 0.0033,
			item_num = 30,
			bid = 10003
		},
		{
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			prob = 0.0033,
			item_num = 30,
			bid = 10003
		},
		{
			item_name = "公斤果实碎片",
			item_id = 19113,
			prob = 0.0033,
			item_num = 30,
			bid = 10003
		},
		{
			item_name = "幻影果实碎片",
			item_id = 19114,
			prob = 0.0033,
			item_num = 30,
			bid = 10003
		},
		{
			item_name = "吞吞果实碎片",
			item_id = 19115,
			prob = 0.0033,
			item_num = 30,
			bid = 10003
		},
		{
			item_name = "力量源质",
			item_id = 19502,
			prob = 0.75,
			item_num = 100,
			bid = 10003
		}
	},
	[10004] = {
		{
			item_name = "犬犬果实碎片",
			item_id = 19013,
			prob = 0.00375,
			item_num = 5,
			bid = 10004
		},
		{
			item_name = "手术果实碎片",
			item_id = 19014,
			prob = 0.00375,
			item_num = 5,
			bid = 10004
		},
		{
			item_name = "响雷果实i碎片",
			item_id = 19015,
			prob = 0.00375,
			item_num = 5,
			bid = 10004
		},
		{
			item_name = "糯糯果实碎片",
			item_id = 19016,
			prob = 0.00375,
			item_num = 5,
			bid = 10004
		},
		{
			item_name = "犬犬果实碎片",
			item_id = 19013,
			prob = 0.00125,
			item_num = 50,
			bid = 10004
		},
		{
			item_name = "手术果实碎片",
			item_id = 19014,
			prob = 0.00125,
			item_num = 50,
			bid = 10004
		},
		{
			item_name = "响雷果实i碎片",
			item_id = 19015,
			prob = 0.00125,
			item_num = 50,
			bid = 10004
		},
		{
			item_name = "糯糯果实碎片",
			item_id = 19016,
			prob = 0.00125,
			item_num = 50,
			bid = 10004
		},
		{
			item_name = "磁磁果实碎片",
			item_id = 19101,
			prob = 0.012,
			item_num = 3,
			bid = 10004
		},
		{
			item_name = "花花果实碎片",
			item_id = 19102,
			prob = 0.012,
			item_num = 3,
			bid = 10004
		},
		{
			item_name = "人人果实碎片",
			item_id = 19103,
			prob = 0.012,
			item_num = 3,
			bid = 10004
		},
		{
			item_name = "影影果实碎片",
			item_id = 19104,
			prob = 0.012,
			item_num = 3,
			bid = 10004
		},
		{
			item_name = "笔笔果实碎片",
			item_id = 19105,
			prob = 0.012,
			item_num = 3,
			bid = 10004
		},
		{
			item_name = "线线果实碎片",
			item_id = 19106,
			prob = 0.012,
			item_num = 3,
			bid = 10004
		},
		{
			item_name = "瓦斯果实碎片",
			item_id = 19107,
			prob = 0.012,
			item_num = 3,
			bid = 10004
		},
		{
			item_name = "牛牛果实碎片",
			item_id = 19108,
			prob = 0.012,
			item_num = 3,
			bid = 10004
		},
		{
			item_name = "滑滑果实碎片",
			item_id = 19109,
			prob = 0.012,
			item_num = 3,
			bid = 10004
		},
		{
			item_name = "爆炸果实碎片",
			item_id = 19110,
			prob = 0.012,
			item_num = 3,
			bid = 10004
		},
		{
			item_name = "泡泡果实碎片",
			item_id = 19111,
			prob = 0.012,
			item_num = 3,
			bid = 10004
		},
		{
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			prob = 0.012,
			item_num = 3,
			bid = 10004
		},
		{
			item_name = "公斤果实碎片",
			item_id = 19113,
			prob = 0.012,
			item_num = 3,
			bid = 10004
		},
		{
			item_name = "幻影果实碎片",
			item_id = 19114,
			prob = 0.012,
			item_num = 3,
			bid = 10004
		},
		{
			item_name = "吞吞果实碎片",
			item_id = 19115,
			prob = 0.012,
			item_num = 3,
			bid = 10004
		},
		{
			item_name = "磁磁果实碎片",
			item_id = 19101,
			prob = 0.0034,
			item_num = 30,
			bid = 10004
		},
		{
			item_name = "花花果实碎片",
			item_id = 19102,
			prob = 0.0034,
			item_num = 30,
			bid = 10004
		},
		{
			item_name = "人人果实碎片",
			item_id = 19103,
			prob = 0.0034,
			item_num = 30,
			bid = 10004
		},
		{
			item_name = "影影果实碎片",
			item_id = 19104,
			prob = 0.0034,
			item_num = 30,
			bid = 10004
		},
		{
			item_name = "笔笔果实碎片",
			item_id = 19105,
			prob = 0.0034,
			item_num = 30,
			bid = 10004
		},
		{
			item_name = "线线果实碎片",
			item_id = 19106,
			prob = 0.0033,
			item_num = 30,
			bid = 10004
		},
		{
			item_name = "瓦斯果实碎片",
			item_id = 19107,
			prob = 0.0033,
			item_num = 30,
			bid = 10004
		},
		{
			item_name = "牛牛果实碎片",
			item_id = 19108,
			prob = 0.0033,
			item_num = 30,
			bid = 10004
		},
		{
			item_name = "滑滑果实碎片",
			item_id = 19109,
			prob = 0.0033,
			item_num = 30,
			bid = 10004
		},
		{
			item_name = "爆炸果实碎片",
			item_id = 19110,
			prob = 0.0033,
			item_num = 30,
			bid = 10004
		},
		{
			item_name = "泡泡果实碎片",
			item_id = 19111,
			prob = 0.0033,
			item_num = 30,
			bid = 10004
		},
		{
			item_name = "蜡蜡果实碎片",
			item_id = 19112,
			prob = 0.0033,
			item_num = 30,
			bid = 10004
		},
		{
			item_name = "公斤果实碎片",
			item_id = 19113,
			prob = 0.0033,
			item_num = 30,
			bid = 10004
		},
		{
			item_name = "幻影果实碎片",
			item_id = 19114,
			prob = 0.0033,
			item_num = 30,
			bid = 10004
		},
		{
			item_name = "吞吞果实碎片",
			item_id = 19115,
			prob = 0.0033,
			item_num = 30,
			bid = 10004
		},
		{
			item_name = "力量源质",
			item_id = 19502,
			prob = 0.75,
			item_num = 100,
			bid = 10004
		}
	}
}
Config.EmoguoshitujianData.data_get_shop_data_length = 27
Config.EmoguoshitujianData.data_get_shop_data = {
	[8801] = {
		limit = 1,
		item_id = 19001,
		item_num = 50,
		need_level = 50,
		item_name = "冰冻果实碎片",
		pay_type = 42,
		id = 8801,
		need_jifen = 0,
		price = 1500
	},
	[8802] = {
		limit = 1,
		item_id = 19002,
		item_num = 50,
		need_level = 50,
		item_name = "烧烧果实碎片",
		pay_type = 42,
		id = 8802,
		need_jifen = 0,
		price = 1500
	},
	[8803] = {
		limit = 1,
		item_id = 19003,
		item_num = 50,
		need_level = 50,
		item_name = "沙沙果实碎片",
		pay_type = 42,
		id = 8803,
		need_jifen = 0,
		price = 1500
	},
	[8804] = {
		limit = 1,
		item_id = 19006,
		item_num = 50,
		need_level = 50,
		item_name = "岩浆果实碎片",
		pay_type = 42,
		id = 8804,
		need_jifen = 0,
		price = 1500
	},
	[8805] = {
		limit = 1,
		item_id = 19004,
		item_num = 50,
		need_level = 70,
		item_name = "闪闪果实碎片",
		pay_type = 42,
		id = 8805,
		need_jifen = 2100,
		price = 1500
	},
	[8806] = {
		limit = 1,
		item_id = 19005,
		item_num = 50,
		need_level = 70,
		item_name = "暗暗果实碎片",
		pay_type = 42,
		id = 8806,
		need_jifen = 2100,
		price = 1500
	},
	[8807] = {
		limit = 1,
		item_id = 19012,
		item_num = 50,
		need_level = 90,
		item_name = "鱼鱼果实碎片",
		pay_type = 42,
		id = 8807,
		need_jifen = 4200,
		price = 1500
	},
	[8808] = {
		limit = 1,
		item_id = 19011,
		item_num = 50,
		need_level = 90,
		item_name = "蛇蛇果实碎片",
		pay_type = 42,
		id = 8808,
		need_jifen = 4200,
		price = 1500
	},
	[8809] = {
		limit = 1,
		item_id = 19008,
		item_num = 50,
		need_level = 120,
		item_name = "震震果实碎片",
		pay_type = 42,
		id = 8809,
		need_jifen = 6300,
		price = 1500
	},
	[8810] = {
		limit = 1,
		item_id = 19009,
		item_num = 50,
		need_level = 120,
		item_name = "金金果实碎片",
		pay_type = 42,
		id = 8810,
		need_jifen = 6300,
		price = 1500
	},
	[8811] = {
		limit = 2,
		item_id = 19101,
		item_num = 30,
		need_level = 50,
		item_name = "磁磁果实碎片",
		pay_type = 42,
		id = 8811,
		need_jifen = 0,
		price = 600
	},
	[8812] = {
		limit = 2,
		item_id = 19102,
		item_num = 30,
		need_level = 50,
		item_name = "花花果实碎片",
		pay_type = 42,
		id = 8812,
		need_jifen = 0,
		price = 600
	},
	[8813] = {
		limit = 2,
		item_id = 19103,
		item_num = 30,
		need_level = 50,
		item_name = "人人果实碎片",
		pay_type = 42,
		id = 8813,
		need_jifen = 0,
		price = 600
	},
	[8814] = {
		limit = 2,
		item_id = 19104,
		item_num = 30,
		need_level = 50,
		item_name = "影影果实碎片",
		pay_type = 42,
		id = 8814,
		need_jifen = 0,
		price = 600
	},
	[8815] = {
		limit = 2,
		item_id = 19105,
		item_num = 30,
		need_level = 50,
		item_name = "笔笔果实碎片",
		pay_type = 42,
		id = 8815,
		need_jifen = 0,
		price = 600
	},
	[8816] = {
		limit = 2,
		item_id = 19106,
		item_num = 30,
		need_level = 50,
		item_name = "线线果实碎片",
		pay_type = 42,
		id = 8816,
		need_jifen = 0,
		price = 600
	},
	[8817] = {
		limit = 2,
		item_id = 19107,
		item_num = 30,
		need_level = 50,
		item_name = "瓦斯果实碎片",
		pay_type = 42,
		id = 8817,
		need_jifen = 0,
		price = 600
	},
	[8818] = {
		limit = 2,
		item_id = 19108,
		item_num = 30,
		need_level = 50,
		item_name = "牛牛果实碎片",
		pay_type = 42,
		id = 8818,
		need_jifen = 0,
		price = 600
	},
	[8819] = {
		limit = 2,
		item_id = 19109,
		item_num = 30,
		need_level = 50,
		item_name = "滑滑果实碎片",
		pay_type = 42,
		id = 8819,
		need_jifen = 0,
		price = 600
	},
	[8820] = {
		limit = 2,
		item_id = 19110,
		item_num = 30,
		need_level = 50,
		item_name = "爆炸果实碎片",
		pay_type = 42,
		id = 8820,
		need_jifen = 0,
		price = 600
	},
	[8821] = {
		limit = 2,
		item_id = 19111,
		item_num = 30,
		need_level = 50,
		item_name = "泡泡果实碎片",
		pay_type = 42,
		id = 8821,
		need_jifen = 0,
		price = 600
	},
	[8822] = {
		limit = 2,
		item_id = 19112,
		item_num = 30,
		need_level = 50,
		item_name = "蜡蜡果实碎片",
		pay_type = 42,
		id = 8822,
		need_jifen = 0,
		price = 600
	},
	[8823] = {
		limit = 2,
		item_id = 19113,
		item_num = 30,
		need_level = 50,
		item_name = "公斤果实碎片",
		pay_type = 42,
		id = 8823,
		need_jifen = 0,
		price = 600
	},
	[8824] = {
		limit = 2,
		item_id = 19114,
		item_num = 30,
		need_level = 50,
		item_name = "幻影果实碎片",
		pay_type = 42,
		id = 8824,
		need_jifen = 0,
		price = 600
	},
	[8825] = {
		limit = 999,
		item_id = 19502,
		item_num = 100,
		need_level = 50,
		item_name = "力量源质",
		pay_type = 42,
		id = 8825,
		need_jifen = 0,
		price = 35
	},
	[8826] = {
		limit = 999,
		item_id = 1,
		item_num = 100000000,
		need_level = 50,
		item_name = "力量源质",
		pay_type = 42,
		id = 8826,
		need_jifen = 0,
		price = 10000
	},
	[8827] = {
		limit = 999,
		item_id = 22,
		item_num = 100000000,
		need_level = 50,
		item_name = "力量源质",
		pay_type = 42,
		id = 8827,
		need_jifen = 0,
		price = 10000
	}
}

function Config.EmoguoshitujianData.data_get_shop_data_fun(slot0)
	slot1 = Config.EmoguoshitujianData.data_get_shop_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.EmoguoshitujianData.data_get_shop_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.EmoguoshitujianData.data_get_emoguoshitujian_data_length = 31
Config.EmoguoshitujianData.data_get_emoguoshitujian_data = {
	{
		id = 1,
		name = "冰冻果实",
		icon = "19001"
	},
	{
		id = 2,
		name = "烧烧果实",
		icon = "19002"
	},
	{
		id = 3,
		name = "沙沙果实",
		icon = "19003"
	},
	{
		id = 4,
		name = "闪闪果实",
		icon = "19004"
	},
	{
		id = 5,
		name = "暗暗果实",
		icon = "19005"
	},
	{
		id = 6,
		name = "岩浆果实",
		icon = "19006"
	},
	{
		id = 7,
		name = "橡胶果实",
		icon = "19007"
	},
	{
		id = 8,
		name = "震震果实",
		icon = "19008"
	},
	{
		id = 9,
		name = "金金果实",
		icon = "19009"
	},
	{
		id = 10,
		name = "合体果实",
		icon = "19010"
	},
	{
		id = 11,
		name = "蛇蛇果实",
		icon = "19011"
	},
	{
		id = 12,
		name = "鱼鱼果实",
		icon = "19012"
	},
	{
		id = 13,
		name = "犬犬果实",
		icon = "19013"
	},
	{
		id = 14,
		name = "手术果实",
		icon = "19014"
	},
	{
		id = 15,
		name = "响雷果实",
		icon = "19015"
	},
	{
		id = 16,
		name = "糯糯果实",
		icon = "19016"
	},
	[101] = {
		id = 101,
		name = "磁磁果实",
		icon = "19101"
	},
	[102] = {
		id = 102,
		name = "花花果实",
		icon = "19102"
	},
	[103] = {
		id = 103,
		name = "人人果实",
		icon = "19103"
	},
	[104] = {
		id = 104,
		name = "影影果实",
		icon = "19104"
	},
	[105] = {
		id = 105,
		name = "笔笔果实",
		icon = "19105"
	},
	[106] = {
		id = 106,
		name = "线线果实",
		icon = "19106"
	},
	[107] = {
		id = 107,
		name = "瓦斯果实",
		icon = "19107"
	},
	[108] = {
		id = 108,
		name = "牛牛果实",
		icon = "19108"
	},
	[109] = {
		id = 109,
		name = "滑滑果实",
		icon = "19109"
	},
	[110] = {
		id = 110,
		name = "爆炸果实",
		icon = "19110"
	},
	[111] = {
		id = 111,
		name = "泡泡果实",
		icon = "19111"
	},
	[112] = {
		id = 112,
		name = "蜡蜡果实",
		icon = "19112"
	},
	[113] = {
		id = 113,
		name = "公斤果实",
		icon = "19113"
	},
	[114] = {
		id = 114,
		name = "幻影果实",
		icon = "19114"
	},
	[115] = {
		id = 115,
		name = "吞吞果实",
		icon = "19115"
	}
}

function Config.EmoguoshitujianData.data_get_emoguoshitujian_data_fun(slot0)
	slot1 = Config.EmoguoshitujianData.data_get_emoguoshitujian_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.EmoguoshitujianData.data_get_emoguoshitujian_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.EmoguoshitujianData.data_get_zhanling_data_length = 4
Config.EmoguoshitujianData.data_get_zhanling_data = {
	{
		{
			process = 0,
			id = 1,
			need_jifen = 0,
			price = 30,
			charge_id = 60,
			unlock_items = {
				{
					3,
					300
				}
			},
			items1 = {
				{
					19502,
					10
				}
			},
			items2 = {
				{
					10411,
					1
				},
				{
					3,
					300
				}
			}
		},
		{
			process = 100,
			id = 1,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					39301,
					10
				},
				{
					19502,
					30
				}
			}
		},
		{
			process = 200,
			id = 1,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					20
				}
			},
			items2 = {
				{
					10411,
					1
				},
				{
					19502,
					40
				}
			}
		},
		{
			process = 300,
			id = 1,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					50
				}
			}
		},
		{
			process = 400,
			id = 1,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					30
				}
			},
			items2 = {
				{
					39301,
					10
				},
				{
					19502,
					60
				}
			}
		},
		{
			process = 500,
			id = 1,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					10411,
					1
				},
				{
					19502,
					70
				}
			}
		},
		{
			process = 600,
			id = 1,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					40
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					80
				}
			}
		},
		{
			process = 700,
			id = 1,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					39301,
					10
				},
				{
					19502,
					90
				}
			}
		},
		{
			process = 800,
			id = 1,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					50
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					100
				}
			}
		},
		{
			process = 900,
			id = 1,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					2
				}
			},
			items2 = {
				{
					10411,
					3
				},
				{
					19502,
					110
				}
			}
		},
		{
			process = 1000,
			id = 1,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					60
				}
			},
			items2 = {
				{
					39301,
					10
				},
				{
					19502,
					120
				}
			}
		},
		{
			process = 1100,
			id = 1,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					2
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					130
				}
			}
		},
		{
			process = 1200,
			id = 1,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					70
				}
			},
			items2 = {
				{
					10411,
					3
				},
				{
					19502,
					140
				}
			}
		},
		{
			process = 1300,
			id = 1,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					2
				}
			},
			items2 = {
				{
					39301,
					10
				},
				{
					19502,
					150
				}
			}
		},
		{
			process = 1400,
			id = 1,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					80
				}
			},
			items2 = {
				{
					10411,
					3
				},
				{
					19502,
					160
				}
			}
		},
		{
			process = 1500,
			id = 1,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					39300,
					15
				}
			},
			items2 = {
				{
					14001,
					1
				},
				{
					19502,
					170
				}
			}
		}
	},
	{
		{
			process = 0,
			id = 2,
			need_jifen = 2100,
			price = 30,
			charge_id = 60,
			unlock_items = {
				{
					3,
					300
				}
			},
			items1 = {
				{
					19502,
					10
				}
			},
			items2 = {
				{
					10411,
					1
				},
				{
					3,
					300
				}
			}
		},
		{
			process = 100,
			id = 2,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					39302,
					10
				},
				{
					19502,
					50
				}
			}
		},
		{
			process = 200,
			id = 2,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					20
				}
			},
			items2 = {
				{
					10411,
					1
				},
				{
					19502,
					60
				}
			}
		},
		{
			process = 300,
			id = 2,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					70
				}
			}
		},
		{
			process = 400,
			id = 2,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					30
				}
			},
			items2 = {
				{
					39302,
					10
				},
				{
					19502,
					80
				}
			}
		},
		{
			process = 500,
			id = 2,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					10411,
					1
				},
				{
					19502,
					90
				}
			}
		},
		{
			process = 600,
			id = 2,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					40
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					100
				}
			}
		},
		{
			process = 700,
			id = 2,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					39302,
					10
				},
				{
					19502,
					110
				}
			}
		},
		{
			process = 800,
			id = 2,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					50
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					120
				}
			}
		},
		{
			process = 900,
			id = 2,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					2
				}
			},
			items2 = {
				{
					10411,
					3
				},
				{
					19502,
					130
				}
			}
		},
		{
			process = 1000,
			id = 2,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					60
				}
			},
			items2 = {
				{
					39302,
					10
				},
				{
					19502,
					140
				}
			}
		},
		{
			process = 1100,
			id = 2,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					2
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					150
				}
			}
		},
		{
			process = 1200,
			id = 2,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					70
				}
			},
			items2 = {
				{
					10411,
					3
				},
				{
					19502,
					160
				}
			}
		},
		{
			process = 1300,
			id = 2,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					2
				}
			},
			items2 = {
				{
					39302,
					10
				},
				{
					19502,
					170
				}
			}
		},
		{
			process = 1400,
			id = 2,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					80
				}
			},
			items2 = {
				{
					10411,
					3
				},
				{
					19502,
					180
				}
			}
		},
		{
			process = 1500,
			id = 2,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					39300,
					15
				}
			},
			items2 = {
				{
					14001,
					1
				},
				{
					19502,
					190
				}
			}
		}
	},
	{
		{
			process = 0,
			id = 3,
			need_jifen = 4200,
			price = 30,
			charge_id = 60,
			unlock_items = {
				{
					3,
					300
				}
			},
			items1 = {
				{
					19502,
					10
				}
			},
			items2 = {
				{
					10411,
					1
				},
				{
					3,
					300
				}
			}
		},
		{
			process = 100,
			id = 3,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					39303,
					10
				},
				{
					19502,
					70
				}
			}
		},
		{
			process = 200,
			id = 3,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					20
				}
			},
			items2 = {
				{
					10411,
					1
				},
				{
					19502,
					80
				}
			}
		},
		{
			process = 300,
			id = 3,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					90
				}
			}
		},
		{
			process = 400,
			id = 3,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					30
				}
			},
			items2 = {
				{
					39303,
					10
				},
				{
					19502,
					100
				}
			}
		},
		{
			process = 500,
			id = 3,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					10411,
					1
				},
				{
					19502,
					110
				}
			}
		},
		{
			process = 600,
			id = 3,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					40
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					120
				}
			}
		},
		{
			process = 700,
			id = 3,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					39303,
					10
				},
				{
					19502,
					130
				}
			}
		},
		{
			process = 800,
			id = 3,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					50
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					140
				}
			}
		},
		{
			process = 900,
			id = 3,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					2
				}
			},
			items2 = {
				{
					10411,
					3
				},
				{
					19502,
					150
				}
			}
		},
		{
			process = 1000,
			id = 3,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					60
				}
			},
			items2 = {
				{
					39303,
					10
				},
				{
					19502,
					160
				}
			}
		},
		{
			process = 1100,
			id = 3,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					2
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					170
				}
			}
		},
		{
			process = 1200,
			id = 3,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					70
				}
			},
			items2 = {
				{
					10411,
					3
				},
				{
					19502,
					180
				}
			}
		},
		{
			process = 1300,
			id = 3,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					2
				}
			},
			items2 = {
				{
					39303,
					10
				},
				{
					19502,
					190
				}
			}
		},
		{
			process = 1400,
			id = 3,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					80
				}
			},
			items2 = {
				{
					10411,
					3
				},
				{
					19502,
					200
				}
			}
		},
		{
			process = 1500,
			id = 3,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					39300,
					15
				}
			},
			items2 = {
				{
					14001,
					1
				},
				{
					19502,
					210
				}
			}
		}
	},
	{
		{
			process = 0,
			id = 4,
			need_jifen = 6300,
			price = 30,
			charge_id = 60,
			unlock_items = {
				{
					3,
					300
				}
			},
			items1 = {
				{
					19502,
					10
				}
			},
			items2 = {
				{
					10411,
					1
				},
				{
					3,
					300
				}
			}
		},
		{
			process = 100,
			id = 4,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					39304,
					10
				},
				{
					19502,
					90
				}
			}
		},
		{
			process = 200,
			id = 4,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					20
				}
			},
			items2 = {
				{
					10411,
					1
				},
				{
					19502,
					100
				}
			}
		},
		{
			process = 300,
			id = 4,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					110
				}
			}
		},
		{
			process = 400,
			id = 4,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					30
				}
			},
			items2 = {
				{
					39304,
					10
				},
				{
					19502,
					120
				}
			}
		},
		{
			process = 500,
			id = 4,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					10411,
					1
				},
				{
					19502,
					130
				}
			}
		},
		{
			process = 600,
			id = 4,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					40
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					140
				}
			}
		},
		{
			process = 700,
			id = 4,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					1
				}
			},
			items2 = {
				{
					39304,
					10
				},
				{
					19502,
					150
				}
			}
		},
		{
			process = 800,
			id = 4,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					50
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					160
				}
			}
		},
		{
			process = 900,
			id = 4,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					2
				}
			},
			items2 = {
				{
					10411,
					3
				},
				{
					19502,
					170
				}
			}
		},
		{
			process = 1000,
			id = 4,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					60
				}
			},
			items2 = {
				{
					39304,
					10
				},
				{
					19502,
					180
				}
			}
		},
		{
			process = 1100,
			id = 4,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					2
				}
			},
			items2 = {
				{
					10411,
					2
				},
				{
					19502,
					190
				}
			}
		},
		{
			process = 1200,
			id = 4,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					70
				}
			},
			items2 = {
				{
					10411,
					3
				},
				{
					19502,
					200
				}
			}
		},
		{
			process = 1300,
			id = 4,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					10411,
					2
				}
			},
			items2 = {
				{
					39304,
					10
				},
				{
					19502,
					210
				}
			}
		},
		{
			process = 1400,
			id = 4,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					19502,
					80
				}
			},
			items2 = {
				{
					10411,
					3
				},
				{
					19502,
					220
				}
			}
		},
		{
			process = 1500,
			id = 4,
			need_jifen = 0,
			price = 0,
			charge_id = 0,
			unlock_items = {},
			items1 = {
				{
					39300,
					15
				}
			},
			items2 = {
				{
					14001,
					1
				},
				{
					19502,
					230
				}
			}
		}
	}
}
