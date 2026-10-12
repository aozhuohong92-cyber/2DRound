Config = Config or {}
Config.AvatarData = Config.AvatarData or {}
Config.AvatarData.data_avatar_length = 53
Config.AvatarData.data_avatar = {
	[1000] = {
		expire_time = 0,
		name = "冒险徽章",
		lev_res_id = 0,
		group = 100,
		effect_id = "",
		is_show = 1,
		desc = "冒险者的象征",
		is_panel = 0,
		effect_pos_y = 0,
		base_id = 1000,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 0,
		loss = {},
		attr = {}
	},
	[2000] = {
		expire_time = 10080,
		name = "王者之姿",
		lev_res_id = 2,
		group = 200,
		effect_id = "",
		is_show = 1,
		desc = "竞技场周结算排名第一获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 2000,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 20,
		loss = {
			{
				50001,
				1
			}
		},
		attr = {}
	},
	[2100] = {
		expire_time = 10080,
		name = "竞技达人",
		lev_res_id = 2,
		group = 210,
		effect_id = "",
		is_show = 1,
		desc = "竞技场周结算排名第二获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 2100,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 21,
		loss = {
			{
				50002,
				1
			}
		},
		attr = {}
	},
	[2200] = {
		expire_time = 10080,
		name = "无畏斗士",
		lev_res_id = 2,
		group = 220,
		effect_id = "",
		is_show = 1,
		desc = "竞技场周结算排名第三获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 2200,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 22,
		loss = {
			{
				50003,
				1
			}
		},
		attr = {}
	},
	[2300] = {
		expire_time = 0,
		name = "贵族气质",
		lev_res_id = 2,
		group = 230,
		effect_id = "",
		is_show = 1,
		desc = "达到Vip5获得该头像框",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 2300,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 23,
		loss = {
			{
				60101,
				1
			}
		},
		attr = {}
	},
	[2400] = {
		expire_time = 0,
		name = "冒险领主",
		lev_res_id = 2,
		group = 240,
		effect_id = "",
		is_show = 1,
		desc = "达到Vip10获得该头像框",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 2400,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 24,
		loss = {
			{
				60102,
				1
			}
		},
		attr = {}
	},
	[2500] = {
		expire_time = 17280,
		name = "冠世王者",
		lev_res_id = 2,
		group = 250,
		effect_id = "",
		is_show = 1,
		desc = "超凡段位赛赛季结算时达到“超凡王者 III”或以上段位可得，有效期为当前半个赛季",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 2500,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 25,
		loss = {
			{
				50010,
				1
			}
		},
		attr = {}
	},
	[2600] = {
		expire_time = 0,
		name = "英灵勇者",
		lev_res_id = 2,
		group = 260,
		effect_id = "",
		is_show = 1,
		desc = "勇者征召活动付费奖励所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 2600,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 26,
		loss = {
			{
				50005,
				1
			}
		},
		attr = {}
	},
	[2700] = {
		expire_time = 10080,
		name = "众星捧月",
		lev_res_id = 2,
		group = 270,
		effect_id = "",
		is_show = 1,
		desc = "本服粉丝排行前五名获得，每周一00:00通过邮件发放",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 2700,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 27,
		loss = {
			{
				50004,
				1
			}
		},
		attr = {}
	},
	[2800] = {
		expire_time = 0,
		name = "逐浪之夏",
		lev_res_id = 2,
		group = 280,
		effect_id = "",
		is_show = 1,
		desc = "冒险战纪活动付费奖励所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 2800,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 28,
		loss = {
			{
				50006,
				1
			}
		},
		attr = {}
	},
	[2900] = {
		expire_time = 0,
		name = "缤纷盛夏",
		lev_res_id = 2,
		group = 290,
		effect_id = "",
		is_show = 1,
		desc = "缤纷盛夏活动付费奖励所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 2900,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 29,
		loss = {
			{
				50007,
				1
			}
		},
		attr = {}
	},
	[3000] = {
		expire_time = 0,
		name = "音舞绚蝶",
		lev_res_id = 2,
		group = 300,
		effect_id = "",
		is_show = 1,
		desc = "轻音乐章活动付费奖励所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 3000,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 30,
		loss = {
			{
				50008,
				1
			}
		},
		attr = {}
	},
	[3100] = {
		expire_time = 0,
		name = "三好学生",
		lev_res_id = 2,
		group = 310,
		effect_id = "",
		is_show = 1,
		desc = "开学迎新活动付费奖励所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 3100,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 31,
		loss = {
			{
				50009,
				1
			}
		},
		attr = {}
	},
	[3200] = {
		expire_time = 0,
		name = "我的王之力",
		lev_res_id = 2,
		group = 320,
		effect_id = "",
		is_show = 1,
		desc = "开学季活动副本伤害排行第一名获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 3200,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 32,
		loss = {
			{
				50016,
				1
			}
		},
		attr = {}
	},
	[3300] = {
		expire_time = 0,
		name = "深藏功与名",
		lev_res_id = 2,
		group = 330,
		effect_id = "",
		is_show = 1,
		desc = "开学季活动副本伤害排行第二名获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 3300,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 33,
		loss = {
			{
				50017,
				1
			}
		},
		attr = {}
	},
	[3400] = {
		expire_time = 0,
		name = "被选中之人",
		lev_res_id = 2,
		group = 340,
		effect_id = "",
		is_show = 1,
		desc = "开学季活动副本伤害排行第三名获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 3400,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 34,
		loss = {
			{
				50018,
				1
			}
		},
		attr = {}
	},
	[3500] = {
		expire_time = 1440,
		name = "指导员",
		lev_res_id = 2,
		group = 350,
		effect_id = "",
		is_show = 1,
		desc = "新服官方指导员专属",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 3500,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 35,
		loss = {
			{
				50019,
				1
			}
		},
		attr = {}
	},
	[3600] = {
		expire_time = 0,
		name = "秋日私语",
		lev_res_id = 2,
		group = 360,
		effect_id = "",
		is_show = 1,
		desc = "花火映秋活动付费奖励所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 3600,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 36,
		loss = {
			{
				50020,
				1
			}
		},
		attr = {}
	},
	[3700] = {
		expire_time = 0,
		name = "万圣南瓜夜",
		lev_res_id = 2,
		group = 370,
		effect_id = "",
		is_show = 1,
		desc = "奇妙之夜活动付费奖励所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 3700,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 37,
		loss = {
			{
				50021,
				1
			}
		},
		attr = {}
	},
	[3800] = {
		expire_time = 0,
		name = "恶魔之息",
		lev_res_id = 2,
		group = 380,
		effect_id = "",
		is_show = 1,
		desc = "圣夜奇境活动排行榜获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 3800,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 38,
		loss = {
			{
				50022,
				1
			}
		},
		attr = {}
	},
	[3900] = {
		expire_time = 0,
		name = "纯白雪舞",
		lev_res_id = 2,
		group = 390,
		effect_id = "",
		is_show = 1,
		desc = "雪舞冬季活动付费奖励所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 3900,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 39,
		loss = {
			{
				50023,
				1
			}
		},
		attr = {}
	},
	[4000] = {
		expire_time = 20160,
		name = "巅峰至尊",
		lev_res_id = 2,
		group = 400,
		effect_id = "E27451",
		is_show = 1,
		desc = "巅峰冠军赛结算排名第一获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 4000,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 40,
		loss = {
			{
				50024,
				1
			}
		},
		attr = {}
	},
	[4100] = {
		expire_time = 20160,
		name = "巅峰王者",
		lev_res_id = 2,
		group = 410,
		effect_id = "E27452",
		is_show = 1,
		desc = "巅峰冠军赛结算排名8强获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 4100,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 41,
		loss = {
			{
				50025,
				1
			}
		},
		attr = {}
	},
	[4200] = {
		expire_time = 20160,
		name = "巅峰斗者",
		lev_res_id = 2,
		group = 420,
		effect_id = "E27453",
		is_show = 1,
		desc = "巅峰冠军赛结算排名64强获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 4200,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 42,
		loss = {
			{
				50026,
				1
			}
		},
		attr = {}
	},
	[4300] = {
		expire_time = 20160,
		name = "巅峰勇者",
		lev_res_id = 2,
		group = 430,
		effect_id = "E27454",
		is_show = 1,
		desc = "巅峰冠军赛结算排名256强获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 4300,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 43,
		loss = {
			{
				50027,
				1
			}
		},
		attr = {}
	},
	[4400] = {
		expire_time = 0,
		name = "岁初礼赞",
		lev_res_id = 2,
		group = 440,
		effect_id = "",
		is_show = 1,
		desc = "岁初礼赞活动付费奖励所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 4400,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 44,
		loss = {
			{
				50028,
				1
			}
		},
		attr = {}
	},
	[4500] = {
		expire_time = 0,
		name = "金鼠贺岁",
		lev_res_id = 2,
		group = 450,
		effect_id = "",
		is_show = 1,
		desc = "新春签到七日活动所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 4500,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 45,
		loss = {
			{
				50029,
				1
			}
		},
		attr = {}
	},
	[4600] = {
		expire_time = 0,
		name = "祥瑞送福",
		lev_res_id = 2,
		group = 460,
		effect_id = "",
		is_show = 1,
		desc = "新年瑞兽挑战活动所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 4600,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 46,
		loss = {
			{
				50030,
				1
			}
		},
		attr = {}
	},
	[4700] = {
		expire_time = 0,
		name = "祥瑞贺岁",
		lev_res_id = 2,
		group = 470,
		effect_id = "",
		is_show = 1,
		desc = "新年瑞兽挑战活动所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 4700,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 47,
		loss = {
			{
				50031,
				1
			}
		},
		attr = {}
	},
	[4800] = {
		expire_time = 0,
		name = "初春新芽",
		lev_res_id = 2,
		group = 480,
		effect_id = "",
		is_show = 1,
		desc = "踏雪拾春活动付费奖励所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 4800,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 48,
		loss = {
			{
				50032,
				1
			}
		},
		attr = {}
	},
	[4900] = {
		expire_time = 0,
		name = "玫瑰恋人",
		lev_res_id = 2,
		group = 490,
		effect_id = "",
		is_show = 1,
		desc = "情人节活动甜蜜大作战排行榜奖励所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 4900,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 49,
		loss = {
			{
				50033,
				1
			}
		},
		attr = {}
	},
	[5000] = {
		expire_time = 43200,
		name = "猫咪物语",
		lev_res_id = 2,
		group = 500,
		effect_id = "E31354",
		is_show = 1,
		desc = "月度特权付费所得",
		is_panel = 1,
		effect_pos_y = 54,
		base_id = 5000,
		effect_pos_x = 54,
		is_only_effect = 1,
		offy = 0,
		res_id = 50,
		loss = {
			{
				50034,
				1
			}
		},
		attr = {}
	},
	[5100] = {
		expire_time = 129600,
		name = "猫咪物语",
		lev_res_id = 2,
		group = 510,
		effect_id = "E31354",
		is_show = 1,
		desc = "季度特权付费所得",
		is_panel = 1,
		effect_pos_y = 54,
		base_id = 5100,
		effect_pos_x = 54,
		is_only_effect = 1,
		offy = 0,
		res_id = 50,
		loss = {
			{
				50035,
				1
			}
		},
		attr = {}
	},
	[5200] = {
		expire_time = 0,
		name = "星光熠熠",
		lev_res_id = 2,
		group = 520,
		effect_id = "",
		is_show = 1,
		desc = "限时活动奖励所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 5200,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 51,
		loss = {
			{
				50036,
				1
			}
		},
		attr = {}
	},
	[5300] = {
		expire_time = 0,
		name = "英灵武神",
		lev_res_id = 2,
		group = 530,
		effect_id = "",
		is_show = 1,
		desc = "英灵武神殿活动排行奖励所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 5300,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 52,
		loss = {
			{
				50037,
				1
			}
		},
		attr = {}
	},
	[6000] = {
		expire_time = 0,
		name = "巅峰至尊",
		lev_res_id = 2,
		group = 600,
		effect_id = "",
		is_show = 1,
		desc = "在协力段位赛中取得第1的好名次时获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 6000,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 60,
		loss = {
			{
				60131,
				1
			}
		},
		attr = {}
	},
	[6100] = {
		expire_time = 0,
		name = "不凡传说",
		lev_res_id = 2,
		group = 610,
		effect_id = "",
		is_show = 1,
		desc = "在协力段位赛中取得第2-3的好名次时获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 6100,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 61,
		loss = {
			{
				60132,
				1
			}
		},
		attr = {}
	},
	[6200] = {
		expire_time = 0,
		name = "卓尔不群",
		lev_res_id = 2,
		group = 620,
		effect_id = "",
		is_show = 1,
		desc = "在协力段位赛中取得第4-10的好名次时获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 6200,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 62,
		loss = {
			{
				60133,
				1
			}
		},
		attr = {}
	},
	[6300] = {
		expire_time = 0,
		name = "合作至上",
		lev_res_id = 2,
		group = 630,
		effect_id = "",
		is_show = 1,
		desc = "参与协力段位赛，并挑战一定次数时获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 6300,
		effect_pos_x = 0,
		is_only_effect = 0,
		offy = 0,
		res_id = 63,
		loss = {
			{
				60134,
				1
			}
		},
		attr = {}
	},
	[7300] = {
		expire_time = 0,
		name = "航海大师",
		lev_res_id = 2,
		group = 730,
		effect_id = "E31357",
		is_show = 1,
		desc = "剧情冲榜第一所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 7300,
		effect_pos_x = 0,
		is_only_effect = 1,
		offy = 0,
		res_id = 64,
		loss = {
			{
				50038,
				1
			}
		},
		attr = {}
	},
	[7400] = {
		expire_time = 0,
		name = "远航舵手",
		lev_res_id = 2,
		group = 740,
		effect_id = "E31358",
		is_show = 1,
		desc = "远航冲榜第一所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 7400,
		effect_pos_x = 0,
		is_only_effect = 1,
		offy = 0,
		res_id = 65,
		loss = {
			{
				50039,
				1
			}
		},
		attr = {}
	},
	[7500] = {
		expire_time = 0,
		name = "大探宝家",
		lev_res_id = 2,
		group = 750,
		effect_id = "E31359",
		is_show = 1,
		desc = "探宝冲榜第一所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 7500,
		effect_pos_x = 0,
		is_only_effect = 1,
		offy = 0,
		res_id = 66,
		loss = {
			{
				50040,
				1
			}
		},
		attr = {}
	},
	[7600] = {
		expire_time = 0,
		name = "强者征召",
		lev_res_id = 2,
		group = 760,
		effect_id = "E31360",
		is_show = 1,
		desc = "强者招募冲榜第一所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 7600,
		effect_pos_x = 0,
		is_only_effect = 1,
		offy = 0,
		res_id = 67,
		loss = {
			{
				50041,
				1
			}
		},
		attr = {}
	},
	[7700] = {
		expire_time = 0,
		name = "战技导师",
		lev_res_id = 2,
		group = 770,
		effect_id = "E31361",
		is_show = 1,
		desc = "战技冲榜第一所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 7700,
		effect_pos_x = 0,
		is_only_effect = 1,
		offy = 0,
		res_id = 68,
		loss = {
			{
				50042,
				1
			}
		},
		attr = {}
	},
	[7800] = {
		expire_time = 0,
		name = "世界征兵",
		lev_res_id = 2,
		group = 780,
		effect_id = "E31362",
		is_show = 1,
		desc = "限定召唤冲榜第一所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 7800,
		effect_pos_x = 0,
		is_only_effect = 1,
		offy = 0,
		res_id = 69,
		loss = {
			{
				50043,
				1
			}
		},
		attr = {}
	},
	[7900] = {
		expire_time = 0,
		name = "海贼之巅",
		lev_res_id = 2,
		group = 790,
		effect_id = "E31363",
		is_show = 1,
		desc = "战力冲榜第一所得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 7900,
		effect_pos_x = 0,
		is_only_effect = 1,
		offy = 0,
		res_id = 70,
		loss = {
			{
				50044,
				1
			}
		},
		attr = {}
	},
	[8000] = {
		expire_time = 0,
		name = "顶上传奇",
		lev_res_id = 2,
		group = 800,
		effect_id = "E31364",
		is_show = 1,
		desc = "顶上战争中获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 8000,
		effect_pos_x = 0,
		is_only_effect = 1,
		offy = 0,
		res_id = 71,
		loss = {
			{
				50045,
				1
			}
		},
		attr = {}
	},
	[8100] = {
		expire_time = 0,
		name = "万国新春",
		lev_res_id = 2,
		group = 810,
		effect_id = "E31365",
		is_show = 1,
		desc = "万国新春活动中获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 8100,
		effect_pos_x = 0,
		is_only_effect = 1,
		offy = 0,
		res_id = 72,
		loss = {
			{
				50046,
				1
			}
		},
		attr = {}
	},
	[9000] = {
		expire_time = 0,
		name = "蛋糕物语",
		lev_res_id = 2,
		group = 900,
		effect_id = "E31366",
		is_show = 1,
		desc = "万国新春活动中获得",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 9000,
		effect_pos_x = 0,
		is_only_effect = 1,
		offy = 0,
		res_id = 73,
		loss = {
			{
				50047,
				1
			}
		},
		attr = {}
	},
	[9100] = {
		expire_time = 0,
		name = "大茗鼎鼎",
		lev_res_id = 2,
		group = 910,
		effect_id = "E31369",
		is_show = 1,
		desc = "冠名大哥专属头像框",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 9100,
		effect_pos_x = 0,
		is_only_effect = 1,
		offy = 0,
		res_id = 74,
		loss = {
			{
				50048,
				1
			}
		},
		attr = {}
	},
	[9200] = {
		expire_time = 0,
		name = "Ace",
		lev_res_id = 2,
		group = 920,
		effect_id = "E31370",
		is_show = 1,
		desc = "订制头像框",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 9200,
		effect_pos_x = 0,
		is_only_effect = 1,
		offy = 0,
		res_id = 75,
		loss = {
			{
				50049,
				1
			}
		},
		attr = {}
	},
	[9300] = {
		expire_time = 0,
		name = "全服之巅",
		lev_res_id = 2,
		group = 930,
		effect_id = "E31371",
		is_show = 1,
		desc = "订制头像框",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 9300,
		effect_pos_x = 0,
		is_only_effect = 1,
		offy = 0,
		res_id = 76,
		loss = {
			{
				50050,
				1
			}
		},
		attr = {}
	},
	[9400] = {
		expire_time = 0,
		name = "海皇",
		lev_res_id = 2,
		group = 940,
		effect_id = "E31372",
		is_show = 1,
		desc = "累计充值10000订制头像框",
		is_panel = 1,
		effect_pos_y = 0,
		base_id = 9400,
		effect_pos_x = 0,
		is_only_effect = 1,
		offy = 0,
		res_id = 77,
		loss = {
			{
				50051,
				1
			}
		},
		attr = {}
	}
}

function Config.AvatarData.data_avatar_fun(slot0)
	slot1 = Config.AvatarData.data_avatar[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.AvatarData.data_avatar[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.AvatarData.data_avatar_effect_length = 53
Config.AvatarData.data_avatar_effect = {
	[0] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[20] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[21] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[22] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[23] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[24] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[25] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[26] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[27] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[28] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[29] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[30] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[31] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[32] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[33] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[34] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[35] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[36] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[37] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[38] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[39] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[40] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "E27451",
		effect_pos_y = 0
	},
	[41] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "E27452",
		effect_pos_y = 0
	},
	[42] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "E27453",
		effect_pos_y = 0
	},
	[43] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "E27454",
		effect_pos_y = 0
	},
	[44] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[45] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[46] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[47] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[48] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[49] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[50] = {
		effect_pos_x = 54,
		is_only_effect = 1,
		effect_id = "E31354",
		effect_pos_y = 54
	},
	[50] = {
		effect_pos_x = 54,
		is_only_effect = 1,
		effect_id = "E31354",
		effect_pos_y = 54
	},
	[51] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[52] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[60] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[61] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[62] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[63] = {
		effect_pos_x = 0,
		is_only_effect = 0,
		effect_id = "",
		effect_pos_y = 0
	},
	[64] = {
		effect_pos_x = 0,
		is_only_effect = 1,
		effect_id = "E31357",
		effect_pos_y = 0
	},
	[65] = {
		effect_pos_x = 0,
		is_only_effect = 1,
		effect_id = "E31358",
		effect_pos_y = 0
	},
	[66] = {
		effect_pos_x = 0,
		is_only_effect = 1,
		effect_id = "E31359",
		effect_pos_y = 0
	},
	[67] = {
		effect_pos_x = 0,
		is_only_effect = 1,
		effect_id = "E31360",
		effect_pos_y = 0
	},
	[68] = {
		effect_pos_x = 0,
		is_only_effect = 1,
		effect_id = "E31361",
		effect_pos_y = 0
	},
	[69] = {
		effect_pos_x = 0,
		is_only_effect = 1,
		effect_id = "E31362",
		effect_pos_y = 0
	},
	[70] = {
		effect_pos_x = 0,
		is_only_effect = 1,
		effect_id = "E31363",
		effect_pos_y = 0
	},
	[71] = {
		effect_pos_x = 0,
		is_only_effect = 1,
		effect_id = "E31364",
		effect_pos_y = 0
	},
	[72] = {
		effect_pos_x = 0,
		is_only_effect = 1,
		effect_id = "E31365",
		effect_pos_y = 0
	},
	[73] = {
		effect_pos_x = 0,
		is_only_effect = 1,
		effect_id = "E31366",
		effect_pos_y = 0
	},
	[74] = {
		effect_pos_x = 0,
		is_only_effect = 1,
		effect_id = "E31369",
		effect_pos_y = 0
	},
	[75] = {
		effect_pos_x = 0,
		is_only_effect = 1,
		effect_id = "E31370",
		effect_pos_y = 0
	},
	[76] = {
		effect_pos_x = 0,
		is_only_effect = 1,
		effect_id = "E31371",
		effect_pos_y = 0
	},
	[77] = {
		effect_pos_x = 0,
		is_only_effect = 1,
		effect_id = "E31372",
		effect_pos_y = 0
	}
}

function Config.AvatarData.data_avatar_effect_fun(slot0)
	slot1 = Config.AvatarData.data_avatar_effect[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.AvatarData.data_avatar_effect[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
