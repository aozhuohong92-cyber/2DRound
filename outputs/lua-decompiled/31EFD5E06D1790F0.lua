Config = Config or {}
Config.ResearchData = Config.ResearchData or {}
Config.ResearchData.data_research_length = 10
Config.ResearchData.data_research = {
	{
		limit_count = 0,
		expend = 0,
		lv = 1,
		limit_lv = 0
	},
	{
		limit_count = 3,
		expend = 200000,
		lv = 2,
		limit_lv = 1
	},
	{
		limit_count = 4,
		expend = 300000,
		lv = 3,
		limit_lv = 2
	},
	{
		limit_count = 5,
		expend = 400000,
		lv = 4,
		limit_lv = 3
	},
	{
		limit_count = 6,
		expend = 500000,
		lv = 5,
		limit_lv = 4
	},
	{
		limit_count = 6,
		expend = 600000,
		lv = 6,
		limit_lv = 5
	},
	{
		limit_count = 6,
		expend = 700000,
		lv = 7,
		limit_lv = 6
	},
	{
		limit_count = 6,
		expend = 800000,
		lv = 8,
		limit_lv = 7
	},
	{
		limit_count = 6,
		expend = 900000,
		lv = 9,
		limit_lv = 8
	},
	{
		limit_count = 6,
		expend = 1000000,
		lv = 10,
		limit_lv = 9
	}
}
Config.ResearchData.data_attrLev_length = 6
Config.ResearchData.data_attrLev = {
	{
		{
			desc = "所有英雄攻击额外加成5%",
			name = "御火术",
			id = 1,
			lv = 1,
			attr = {
				{
					"atk_per",
					50
				}
			},
			expend = {
				{
					1,
					10000
				},
				{
					6,
					100
				}
			}
		},
		{
			desc = "所有英雄攻击额外加成8%",
			name = "烈火术",
			id = 1,
			lv = 2,
			attr = {
				{
					"atk_per",
					80
				}
			},
			expend = {
				{
					1,
					25000
				},
				{
					6,
					200
				}
			}
		},
		{
			desc = "所有英雄攻击额外加成11%",
			name = "焰火环",
			id = 1,
			lv = 3,
			attr = {
				{
					"atk_per",
					110
				}
			},
			expend = {
				{
					1,
					50000
				},
				{
					6,
					300
				}
			}
		},
		{
			desc = "所有英雄攻击额外加成14%",
			name = "炽炎波",
			id = 1,
			lv = 4,
			attr = {
				{
					"atk_per",
					140
				}
			},
			expend = {
				{
					1,
					75000
				},
				{
					6,
					400
				}
			}
		},
		{
			desc = "所有英雄攻击额外加成17%",
			name = "炙炎旋流",
			id = 1,
			lv = 5,
			attr = {
				{
					"atk_per",
					170
				}
			},
			expend = {
				{
					1,
					100000
				},
				{
					6,
					500
				}
			}
		},
		{
			desc = "所有英雄攻击额外加成20%",
			name = "火山熔岩",
			id = 1,
			lv = 6,
			attr = {
				{
					"atk_per",
					200
				}
			},
			expend = {
				{
					1,
					150000
				},
				{
					6,
					600
				}
			}
		},
		{
			desc = "所有英雄攻击额外加成23%",
			name = "烈日蚀晴",
			id = 1,
			lv = 7,
			attr = {
				{
					"atk_per",
					230
				}
			},
			expend = {
				{
					1,
					600000
				},
				{
					6,
					700
				}
			}
		},
		{
			desc = "所有英雄攻击额外加成26%",
			name = "地狱烈焰",
			id = 1,
			lv = 8,
			attr = {
				{
					"atk_per",
					260
				}
			},
			expend = {
				{
					1,
					400000
				},
				{
					6,
					800
				}
			}
		},
		{
			desc = "所有英雄攻击额外加成29%",
			name = "烈火熊熊",
			id = 1,
			lv = 9,
			attr = {
				{
					"atk_per",
					290
				}
			},
			expend = {
				{
					1,
					600000
				},
				{
					6,
					900
				}
			}
		},
		{
			desc = "所有英雄攻击额外加成32%",
			name = "末日风暴",
			id = 1,
			lv = 10,
			attr = {
				{
					"atk_per",
					320
				}
			},
			expend = {
				{
					1,
					800000
				},
				{
					6,
					1000
				}
			}
		}
	},
	{
		{
			desc = "所有英雄法术防御额外加成5%",
			name = "御水术",
			id = 2,
			lv = 1,
			attr = {
				{
					"def_s_per",
					50
				}
			},
			expend = {
				{
					1,
					10000
				},
				{
					6,
					100
				}
			}
		},
		{
			desc = "所有英雄法术防御额外加成8%",
			name = "水泡术",
			id = 2,
			lv = 2,
			attr = {
				{
					"def_s_per",
					80
				}
			},
			expend = {
				{
					1,
					25000
				},
				{
					6,
					200
				}
			}
		},
		{
			desc = "所有英雄法术防御额外加成11%",
			name = "流水盾",
			id = 2,
			lv = 3,
			attr = {
				{
					"def_s_per",
					110
				}
			},
			expend = {
				{
					1,
					50000
				},
				{
					6,
					300
				}
			}
		},
		{
			desc = "所有英雄法术防御额外加成14%",
			name = "寒冰墙",
			id = 2,
			lv = 4,
			attr = {
				{
					"def_s_per",
					140
				}
			},
			expend = {
				{
					1,
					75000
				},
				{
					6,
					400
				}
			}
		},
		{
			desc = "所有英雄法术防御额外加成17%",
			name = "冰霜护盾",
			id = 2,
			lv = 5,
			attr = {
				{
					"def_s_per",
					170
				}
			},
			expend = {
				{
					1,
					100000
				},
				{
					6,
					500
				}
			}
		},
		{
			desc = "所有英雄法术防御额外加成20%",
			name = "水纹护体",
			id = 2,
			lv = 6,
			attr = {
				{
					"def_s_per",
					200
				}
			},
			expend = {
				{
					1,
					150000
				},
				{
					6,
					600
				}
			}
		},
		{
			desc = "所有英雄法术防御额外加成23%",
			name = "瀑布冲击",
			id = 2,
			lv = 7,
			attr = {
				{
					"def_s_per",
					230
				}
			},
			expend = {
				{
					1,
					600000
				},
				{
					6,
					700
				}
			}
		},
		{
			desc = "所有英雄法术防御额外加成26%",
			name = "冰天雪地",
			id = 2,
			lv = 8,
			attr = {
				{
					"def_s_per",
					260
				}
			},
			expend = {
				{
					1,
					400000
				},
				{
					6,
					800
				}
			}
		},
		{
			desc = "所有英雄法术防御额外加成29%",
			name = "雪地冰雕",
			id = 2,
			lv = 9,
			attr = {
				{
					"def_s_per",
					290
				}
			},
			expend = {
				{
					1,
					600000
				},
				{
					6,
					900
				}
			}
		},
		{
			desc = "所有英雄法术防御额外加成32%",
			name = "炙热领域",
			id = 2,
			lv = 10,
			attr = {
				{
					"def_s_per",
					320
				}
			},
			expend = {
				{
					1,
					800000
				},
				{
					6,
					1000
				}
			}
		}
	},
	{
		{
			desc = "所有英雄物理防御额外加成5%",
			name = "御土术",
			id = 3,
			lv = 1,
			attr = {
				{
					"def_p_per",
					50
				}
			},
			expend = {
				{
					1,
					10000
				},
				{
					6,
					100
				}
			}
		},
		{
			desc = "所有英雄物理防御额外加成8%",
			name = "土墙术",
			id = 3,
			lv = 2,
			attr = {
				{
					"def_p_per",
					80
				}
			},
			expend = {
				{
					1,
					25000
				},
				{
					6,
					200
				}
			}
		},
		{
			desc = "所有英雄物理防御额外加成11%",
			name = "岩石盾",
			id = 3,
			lv = 3,
			attr = {
				{
					"def_p_per",
					110
				}
			},
			expend = {
				{
					1,
					50000
				},
				{
					6,
					300
				}
			}
		},
		{
			desc = "所有英雄物理防御额外加成14%",
			name = "流沙迷雾",
			id = 3,
			lv = 4,
			attr = {
				{
					"def_p_per",
					140
				}
			},
			expend = {
				{
					1,
					75000
				},
				{
					6,
					400
				}
			}
		},
		{
			desc = "所有英雄物理防御额外加成17%",
			name = "护体石肤",
			id = 3,
			lv = 5,
			attr = {
				{
					"def_p_per",
					170
				}
			},
			expend = {
				{
					1,
					100000
				},
				{
					6,
					500
				}
			}
		},
		{
			desc = "所有英雄物理防御额外加成20%",
			name = "火山熔岩",
			id = 3,
			lv = 6,
			attr = {
				{
					"def_p_per",
					200
				}
			},
			expend = {
				{
					1,
					150000
				},
				{
					6,
					600
				}
			}
		},
		{
			desc = "所有英雄物理防御额外加成23%",
			name = "元素守护",
			id = 3,
			lv = 7,
			attr = {
				{
					"def_p_per",
					230
				}
			},
			expend = {
				{
					1,
					600000
				},
				{
					6,
					700
				}
			}
		},
		{
			desc = "所有英雄物理防御额外加成26%",
			name = "石化森卡莉法",
			id = 3,
			lv = 8,
			attr = {
				{
					"def_p_per",
					260
				}
			},
			expend = {
				{
					1,
					400000
				},
				{
					6,
					800
				}
			}
		},
		{
			desc = "所有英雄物理防御额外加成29%",
			name = "绝对防御",
			id = 3,
			lv = 9,
			attr = {
				{
					"def_p_per",
					290
				}
			},
			expend = {
				{
					1,
					600000
				},
				{
					6,
					900
				}
			}
		},
		{
			desc = "所有英雄物理防御额外加成32%",
			name = "叹息之墙",
			id = 3,
			lv = 10,
			attr = {
				{
					"def_p_per",
					320
				}
			},
			expend = {
				{
					1,
					800000
				},
				{
					6,
					1000
				}
			}
		}
	},
	{
		{
			desc = "所有英雄气血上限额外加成5%",
			name = "御木术",
			id = 4,
			lv = 1,
			attr = {
				{
					"hp_max_per",
					50
				}
			},
			expend = {
				{
					1,
					10000
				},
				{
					6,
					100
				}
			}
		},
		{
			desc = "所有英雄气血上限额外加成8%",
			name = "叶舞术",
			id = 4,
			lv = 2,
			attr = {
				{
					"hp_max_per",
					80
				}
			},
			expend = {
				{
					1,
					25000
				},
				{
					6,
					200
				}
			}
		},
		{
			desc = "所有英雄气血上限额外加成11%",
			name = "护卡莉法阵",
			id = 4,
			lv = 3,
			attr = {
				{
					"hp_max_per",
					110
				}
			},
			expend = {
				{
					1,
					50000
				},
				{
					6,
					300
				}
			}
		},
		{
			desc = "所有英雄气血上限额外加成14%",
			name = "护心花",
			id = 4,
			lv = 4,
			attr = {
				{
					"hp_max_per",
					140
				}
			},
			expend = {
				{
					1,
					75000
				},
				{
					6,
					400
				}
			}
		},
		{
			desc = "所有英雄气血上限额外加成17%",
			name = "藤蔓缠绕",
			id = 4,
			lv = 5,
			attr = {
				{
					"hp_max_per",
					170
				}
			},
			expend = {
				{
					1,
					100000
				},
				{
					6,
					500
				}
			}
		},
		{
			desc = "所有英雄气血上限额外加成20%",
			name = "落地生根",
			id = 4,
			lv = 6,
			attr = {
				{
					"hp_max_per",
					200
				}
			},
			expend = {
				{
					1,
					150000
				},
				{
					6,
					600
				}
			}
		},
		{
			desc = "所有英雄气血上限额外加成23%",
			name = "众生觉醒",
			id = 4,
			lv = 7,
			attr = {
				{
					"hp_max_per",
					230
				}
			},
			expend = {
				{
					1,
					600000
				},
				{
					6,
					700
				}
			}
		},
		{
			desc = "所有英雄气血上限额外加成26%",
			name = "森卡莉法之歌",
			id = 4,
			lv = 8,
			attr = {
				{
					"hp_max_per",
					260
				}
			},
			expend = {
				{
					1,
					400000
				},
				{
					6,
					800
				}
			}
		},
		{
			desc = "所有英雄气血上限额外加成29%",
			name = "万木守护",
			id = 4,
			lv = 9,
			attr = {
				{
					"hp_max_per",
					290
				}
			},
			expend = {
				{
					1,
					600000
				},
				{
					6,
					900
				}
			}
		},
		{
			desc = "所有英雄气血上限额外加成32%",
			name = "生生不息",
			id = 4,
			lv = 10,
			attr = {
				{
					"hp_max_per",
					320
				}
			},
			expend = {
				{
					1,
					800000
				},
				{
					6,
					1000
				}
			}
		}
	},
	{
		{
			desc = "所有英雄暴击伤害额外加成5%",
			name = "御雷术",
			id = 5,
			lv = 1,
			attr = {
				{
					"crit_ratio",
					50
				}
			},
			expend = {
				{
					1,
					10000
				},
				{
					6,
					100
				}
			}
		},
		{
			desc = "所有英雄暴击伤害额外加成8%",
			name = "龙马箭",
			id = 5,
			lv = 2,
			attr = {
				{
					"crit_ratio",
					80
				}
			},
			expend = {
				{
					1,
					25000
				},
				{
					6,
					200
				}
			}
		},
		{
			desc = "所有英雄暴击伤害额外加成11%",
			name = "静电术",
			id = 5,
			lv = 3,
			attr = {
				{
					"crit_ratio",
					110
				}
			},
			expend = {
				{
					1,
					50000
				},
				{
					6,
					300
				}
			}
		},
		{
			desc = "所有英雄暴击伤害额外加成14%",
			name = "雷爆术",
			id = 5,
			lv = 4,
			attr = {
				{
					"crit_ratio",
					140
				}
			},
			expend = {
				{
					1,
					75000
				},
				{
					6,
					400
				}
			}
		},
		{
			desc = "所有英雄暴击伤害额外加成17%",
			name = "天雷闪",
			id = 5,
			lv = 5,
			attr = {
				{
					"crit_ratio",
					170
				}
			},
			expend = {
				{
					1,
					100000
				},
				{
					6,
					500
				}
			}
		},
		{
			desc = "所有英雄暴击伤害额外加成20%",
			name = "雷鸣爆弹",
			id = 5,
			lv = 6,
			attr = {
				{
					"crit_ratio",
					200
				}
			},
			expend = {
				{
					1,
					150000
				},
				{
					6,
					600
				}
			}
		},
		{
			desc = "所有英雄暴击伤害额外加成23%",
			name = "雷动九天",
			id = 5,
			lv = 7,
			attr = {
				{
					"crit_ratio",
					230
				}
			},
			expend = {
				{
					1,
					600000
				},
				{
					6,
					700
				}
			}
		},
		{
			desc = "所有英雄暴击伤害额外加成26%",
			name = "连锁龙马",
			id = 5,
			lv = 8,
			attr = {
				{
					"crit_ratio",
					260
				}
			},
			expend = {
				{
					1,
					400000
				},
				{
					6,
					800
				}
			}
		},
		{
			desc = "所有英雄暴击伤害额外加成29%",
			name = "龙马风暴",
			id = 5,
			lv = 9,
			attr = {
				{
					"crit_ratio",
					290
				}
			},
			expend = {
				{
					1,
					600000
				},
				{
					6,
					900
				}
			}
		},
		{
			desc = "所有英雄暴击伤害额外加成32%",
			name = "天罚",
			id = 5,
			lv = 10,
			attr = {
				{
					"crit_ratio",
					320
				}
			},
			expend = {
				{
					1,
					800000
				},
				{
					6,
					1000
				}
			}
		}
	},
	{
		{
			desc = "所有英雄速度额外增加5",
			name = "御风术",
			id = 6,
			lv = 1,
			attr = {
				{
					"speed",
					5
				}
			},
			expend = {
				{
					1,
					10000
				},
				{
					6,
					100
				}
			}
		},
		{
			desc = "所有英雄速度额外增加8",
			name = "加速术",
			id = 6,
			lv = 2,
			attr = {
				{
					"speed",
					8
				}
			},
			expend = {
				{
					1,
					25000
				},
				{
					6,
					200
				}
			}
		},
		{
			desc = "所有英雄速度额外增加11",
			name = "飞行术",
			id = 6,
			lv = 3,
			attr = {
				{
					"speed",
					11
				}
			},
			expend = {
				{
					1,
					50000
				},
				{
					6,
					300
				}
			}
		},
		{
			desc = "所有英雄速度额外增加14",
			name = "风行步",
			id = 6,
			lv = 4,
			attr = {
				{
					"speed",
					14
				}
			},
			expend = {
				{
					1,
					75000
				},
				{
					6,
					400
				}
			}
		},
		{
			desc = "所有英雄速度额外增加17",
			name = "空气盾",
			id = 6,
			lv = 5,
			attr = {
				{
					"speed",
					17
				}
			},
			expend = {
				{
					1,
					100000
				},
				{
					6,
					500
				}
			}
		},
		{
			desc = "所有英雄速度额外增加20",
			name = "风卷残云",
			id = 6,
			lv = 6,
			attr = {
				{
					"speed",
					20
				}
			},
			expend = {
				{
					1,
					150000
				},
				{
					6,
					600
				}
			}
		},
		{
			desc = "所有英雄速度额外增加23",
			name = "随风飘动",
			id = 6,
			lv = 7,
			attr = {
				{
					"speed",
					23
				}
			},
			expend = {
				{
					1,
					600000
				},
				{
					6,
					700
				}
			}
		},
		{
			desc = "所有英雄速度额外增加26",
			name = "风之翔翼",
			id = 6,
			lv = 8,
			attr = {
				{
					"speed",
					26
				}
			},
			expend = {
				{
					1,
					400000
				},
				{
					6,
					800
				}
			}
		},
		{
			desc = "所有英雄速度额外增加29",
			name = "天风之舞",
			id = 6,
			lv = 9,
			attr = {
				{
					"speed",
					29
				}
			},
			expend = {
				{
					1,
					600000
				},
				{
					6,
					900
				}
			}
		},
		{
			desc = "所有英雄速度额外增加32",
			name = "瞬间移动",
			id = 6,
			lv = 10,
			attr = {
				{
					"speed",
					32
				}
			},
			expend = {
				{
					1,
					800000
				},
				{
					6,
					1000
				}
			}
		}
	}
}
Config.ResearchData.data_const_length = 5
Config.ResearchData.data_const = {
	research_init = {
		val = 1,
		key = "research_init",
		desc = "研究所初始等级"
	},
	research_max = {
		val = 10,
		key = "research_max",
		desc = "研究所最大等级"
	},
	attr_init = {
		val = 0,
		key = "attr_init",
		desc = "属性初始等级"
	},
	attr_max = {
		val = 10,
		key = "attr_max",
		desc = "属性最大等级"
	},
	lv_up = {
		val = 10,
		key = "lv_up",
		desc = "研究所开启等级"
	}
}
