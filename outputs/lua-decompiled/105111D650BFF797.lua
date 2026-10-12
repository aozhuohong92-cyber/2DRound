Config = Config or {}
Config.GuildSkillData = Config.GuildSkillData or {}
Config.GuildSkillData.data_const_length = 15
Config.GuildSkillData.data_const = {
	attr_show_1 = {
		key = "attr_show_1",
		desc = "物理职业需要显示的面板属性",
		val = {
			"hp_max_per",
			"atk_per",
			"crit_rate",
			"crit_ratio",
			"speed",
			"dam"
		}
	},
	attr_show_2 = {
		key = "attr_show_2",
		desc = "法系职业需要显示的面板属性",
		val = {
			"hp_max_per",
			"atk_per",
			"crit_rate",
			"crit_ratio",
			"speed",
			"dam"
		}
	},
	attr_show_3 = {
		key = "attr_show_3",
		desc = "肉盾职业需要显示的面板属性",
		val = {
			"hp_max_per",
			"atk_per",
			"hit_magic",
			"tenacity",
			"speed",
			"res_p"
		}
	},
	attr_show_4 = {
		key = "attr_show_4",
		desc = "辅助职业需要显示的面板属性",
		val = {
			"hp_max_per",
			"atk_per",
			"dodge_magic",
			"tenacity",
			"speed",
			"res_s"
		}
	},
	max_lv = {
		val = 40,
		key = "max_lv",
		desc = "公会技能最大等级（客户端用）"
	},
	pvp_max_lv = {
		val = 160,
		key = "pvp_max_lv",
		desc = "pvp属性最大等级和（客户端用）"
	},
	game_rule = {
		val = 1,
		key = "game_rule",
		desc = [[
1.<div fontcolor=289b14>战士、法师、坦克、辅助</div>4个职业对应各自的公会技能，每一类只对对应职业加成
2.玩家将职业中每个轮次的技能激活，开启下一阶段的技能轮次
3.玩家退出或被移除出公会后，公会技能将失效；下次再加入其他公会时，技能继续生效且已升级的技能会被保留下来
4.常规技能重置后，该系常规技能等级清空，同时返还所消耗的<div fontcolor=289b14>50%金币</div>和<div fontcolor=289b14>100%公会贡献</div>。常规技能总等级越高，重置消耗的钻石越高，常规技能首次重置只需消耗300钻石
5.PVP技能重置后，本系PVP属性和技能等级清空，同时返还所消耗的<div fontcolor=289b14>100%养成材料</div>。PVP属性总等级越高，重置消耗的钻石越高，PVP技能首次重置只需消耗300钻石]]
	},
	pvp_game_rule = {
		val = 1,
		key = "pvp_game_rule",
		desc = "1.公会PVP部分属性和技能仅在PVP战斗中生效\n2.PVP战斗包含但不限于：<div fontcolor=289b14>竞技场、切磋、冠军赛、公会战、跨服天梯、段位赛、跨服竞技场、周冠军赛、组队竞技场、巅峰冠军赛、协力段位赛</div>等"
	},
	reset_consume_var1 = {
		val = 500,
		key = "reset_consume_var1",
		desc = "重置消耗计算公式参数1"
	},
	reset_consume_var2 = {
		val = 15,
		key = "reset_consume_var2",
		desc = "重置消耗计算公式参数2"
	},
	return_resource_ratio = {
		key = "return_resource_ratio",
		desc = "资源返还比率",
		val = {
			{
				10,
				1000
			},
			{
				1,
				500
			}
		}
	},
	first_reset_consume = {
		val = 300,
		key = "first_reset_consume",
		desc = "首次重置固定消耗钻石数"
	},
	pvp_reset_consume_var1 = {
		val = 500,
		key = "pvp_reset_consume_var1",
		desc = "pvp重置消耗计算公式参数1"
	},
	pvp_reset_consume_var2 = {
		val = 15,
		key = "pvp_reset_consume_var2",
		desc = "pvp重置消耗计算公式参数2"
	},
	pvp_first_reset_consume = {
		val = 300,
		key = "pvp_first_reset_consume",
		desc = "pvp首次重置固定消耗钻石数"
	}
}

function Config.GuildSkillData.data_const_fun(slot0)
	slot1 = Config.GuildSkillData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildSkillData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildSkillData.data_group_length = 160
Config.GuildSkillData.data_group = {
	["3_1001"] = {
		group_seq = 1,
		group_id = 1001,
		career = 3,
		group_name = "力量1重天"
	},
	["3_1002"] = {
		group_seq = 2,
		group_id = 1002,
		career = 3,
		group_name = "力量2重天"
	},
	["3_1003"] = {
		group_seq = 3,
		group_id = 1003,
		career = 3,
		group_name = "力量3重天"
	},
	["3_1004"] = {
		group_seq = 4,
		group_id = 1004,
		career = 3,
		group_name = "力量4重天"
	},
	["3_1005"] = {
		group_seq = 5,
		group_id = 1005,
		career = 3,
		group_name = "力量5重天"
	},
	["3_1006"] = {
		group_seq = 6,
		group_id = 1006,
		career = 3,
		group_name = "力量6重天"
	},
	["3_1007"] = {
		group_seq = 7,
		group_id = 1007,
		career = 3,
		group_name = "力量7重天"
	},
	["3_1008"] = {
		group_seq = 8,
		group_id = 1008,
		career = 3,
		group_name = "力量8重天"
	},
	["3_1009"] = {
		group_seq = 9,
		group_id = 1009,
		career = 3,
		group_name = "力量9重天"
	},
	["3_1010"] = {
		group_seq = 10,
		group_id = 1010,
		career = 3,
		group_name = "力量10重天"
	},
	["3_1011"] = {
		group_seq = 11,
		group_id = 1011,
		career = 3,
		group_name = "力量11重天"
	},
	["3_1012"] = {
		group_seq = 12,
		group_id = 1012,
		career = 3,
		group_name = "力量12重天"
	},
	["3_1013"] = {
		group_seq = 13,
		group_id = 1013,
		career = 3,
		group_name = "力量13重天"
	},
	["3_1014"] = {
		group_seq = 14,
		group_id = 1014,
		career = 3,
		group_name = "力量14重天"
	},
	["3_1015"] = {
		group_seq = 15,
		group_id = 1015,
		career = 3,
		group_name = "力量15重天"
	},
	["3_1016"] = {
		group_seq = 16,
		group_id = 1016,
		career = 3,
		group_name = "力量16重天"
	},
	["3_1017"] = {
		group_seq = 17,
		group_id = 1017,
		career = 3,
		group_name = "力量17重天"
	},
	["3_1018"] = {
		group_seq = 18,
		group_id = 1018,
		career = 3,
		group_name = "力量18重天"
	},
	["3_1019"] = {
		group_seq = 19,
		group_id = 1019,
		career = 3,
		group_name = "力量19重天"
	},
	["3_1020"] = {
		group_seq = 20,
		group_id = 1020,
		career = 3,
		group_name = "力量20重天"
	},
	["3_1021"] = {
		group_seq = 21,
		group_id = 1021,
		career = 3,
		group_name = "力量21重天"
	},
	["3_1022"] = {
		group_seq = 22,
		group_id = 1022,
		career = 3,
		group_name = "力量22重天"
	},
	["3_1023"] = {
		group_seq = 23,
		group_id = 1023,
		career = 3,
		group_name = "力量23重天"
	},
	["3_1024"] = {
		group_seq = 24,
		group_id = 1024,
		career = 3,
		group_name = "力量24重天"
	},
	["3_1025"] = {
		group_seq = 25,
		group_id = 1025,
		career = 3,
		group_name = "力量25重天"
	},
	["3_1026"] = {
		group_seq = 26,
		group_id = 1026,
		career = 3,
		group_name = "力量26重天"
	},
	["3_1027"] = {
		group_seq = 27,
		group_id = 1027,
		career = 3,
		group_name = "力量27重天"
	},
	["3_1028"] = {
		group_seq = 28,
		group_id = 1028,
		career = 3,
		group_name = "力量28重天"
	},
	["3_1029"] = {
		group_seq = 29,
		group_id = 1029,
		career = 3,
		group_name = "力量29重天"
	},
	["3_1030"] = {
		group_seq = 30,
		group_id = 1030,
		career = 3,
		group_name = "力量30重天"
	},
	["3_1031"] = {
		group_seq = 31,
		group_id = 1031,
		career = 3,
		group_name = "力量31重天"
	},
	["3_1032"] = {
		group_seq = 32,
		group_id = 1032,
		career = 3,
		group_name = "力量32重天"
	},
	["3_1033"] = {
		group_seq = 33,
		group_id = 1033,
		career = 3,
		group_name = "力量33重天"
	},
	["3_1034"] = {
		group_seq = 34,
		group_id = 1034,
		career = 3,
		group_name = "力量34重天"
	},
	["3_1035"] = {
		group_seq = 35,
		group_id = 1035,
		career = 3,
		group_name = "力量35重天"
	},
	["3_1036"] = {
		group_seq = 36,
		group_id = 1036,
		career = 3,
		group_name = "力量36重天"
	},
	["3_1037"] = {
		group_seq = 37,
		group_id = 1037,
		career = 3,
		group_name = "力量37重天"
	},
	["3_1038"] = {
		group_seq = 38,
		group_id = 1038,
		career = 3,
		group_name = "力量38重天"
	},
	["3_1039"] = {
		group_seq = 39,
		group_id = 1039,
		career = 3,
		group_name = "力量39重天"
	},
	["3_1040"] = {
		group_seq = 40,
		group_id = 1040,
		career = 3,
		group_name = "力量40重天"
	},
	["2_2001"] = {
		group_seq = 1,
		group_id = 2001,
		career = 2,
		group_name = "智慧1重天"
	},
	["2_2002"] = {
		group_seq = 2,
		group_id = 2002,
		career = 2,
		group_name = "智慧2重天"
	},
	["2_2003"] = {
		group_seq = 3,
		group_id = 2003,
		career = 2,
		group_name = "智慧3重天"
	},
	["2_2004"] = {
		group_seq = 4,
		group_id = 2004,
		career = 2,
		group_name = "智慧4重天"
	},
	["2_2005"] = {
		group_seq = 5,
		group_id = 2005,
		career = 2,
		group_name = "智慧5重天"
	},
	["2_2006"] = {
		group_seq = 6,
		group_id = 2006,
		career = 2,
		group_name = "智慧6重天"
	},
	["2_2007"] = {
		group_seq = 7,
		group_id = 2007,
		career = 2,
		group_name = "智慧7重天"
	},
	["2_2008"] = {
		group_seq = 8,
		group_id = 2008,
		career = 2,
		group_name = "智慧8重天"
	},
	["2_2009"] = {
		group_seq = 9,
		group_id = 2009,
		career = 2,
		group_name = "智慧9重天"
	},
	["2_2010"] = {
		group_seq = 10,
		group_id = 2010,
		career = 2,
		group_name = "智慧10重天"
	},
	["2_2011"] = {
		group_seq = 11,
		group_id = 2011,
		career = 2,
		group_name = "智慧11重天"
	},
	["2_2012"] = {
		group_seq = 12,
		group_id = 2012,
		career = 2,
		group_name = "智慧12重天"
	},
	["2_2013"] = {
		group_seq = 13,
		group_id = 2013,
		career = 2,
		group_name = "智慧13重天"
	},
	["2_2014"] = {
		group_seq = 14,
		group_id = 2014,
		career = 2,
		group_name = "智慧14重天"
	},
	["2_2015"] = {
		group_seq = 15,
		group_id = 2015,
		career = 2,
		group_name = "智慧15重天"
	},
	["2_2016"] = {
		group_seq = 16,
		group_id = 2016,
		career = 2,
		group_name = "智慧16重天"
	},
	["2_2017"] = {
		group_seq = 17,
		group_id = 2017,
		career = 2,
		group_name = "智慧17重天"
	},
	["2_2018"] = {
		group_seq = 18,
		group_id = 2018,
		career = 2,
		group_name = "智慧18重天"
	},
	["2_2019"] = {
		group_seq = 19,
		group_id = 2019,
		career = 2,
		group_name = "智慧19重天"
	},
	["2_2020"] = {
		group_seq = 20,
		group_id = 2020,
		career = 2,
		group_name = "智慧20重天"
	},
	["2_2021"] = {
		group_seq = 21,
		group_id = 2021,
		career = 2,
		group_name = "智慧21重天"
	},
	["2_2022"] = {
		group_seq = 22,
		group_id = 2022,
		career = 2,
		group_name = "智慧22重天"
	},
	["2_2023"] = {
		group_seq = 23,
		group_id = 2023,
		career = 2,
		group_name = "智慧23重天"
	},
	["2_2024"] = {
		group_seq = 24,
		group_id = 2024,
		career = 2,
		group_name = "智慧24重天"
	},
	["2_2025"] = {
		group_seq = 25,
		group_id = 2025,
		career = 2,
		group_name = "智慧25重天"
	},
	["2_2026"] = {
		group_seq = 26,
		group_id = 2026,
		career = 2,
		group_name = "智慧26重天"
	},
	["2_2027"] = {
		group_seq = 27,
		group_id = 2027,
		career = 2,
		group_name = "智慧27重天"
	},
	["2_2028"] = {
		group_seq = 28,
		group_id = 2028,
		career = 2,
		group_name = "智慧28重天"
	},
	["2_2029"] = {
		group_seq = 29,
		group_id = 2029,
		career = 2,
		group_name = "智慧29重天"
	},
	["2_2030"] = {
		group_seq = 30,
		group_id = 2030,
		career = 2,
		group_name = "智慧30重天"
	},
	["2_2031"] = {
		group_seq = 31,
		group_id = 2031,
		career = 2,
		group_name = "智慧31重天"
	},
	["2_2032"] = {
		group_seq = 32,
		group_id = 2032,
		career = 2,
		group_name = "智慧32重天"
	},
	["2_2033"] = {
		group_seq = 33,
		group_id = 2033,
		career = 2,
		group_name = "智慧33重天"
	},
	["2_2034"] = {
		group_seq = 34,
		group_id = 2034,
		career = 2,
		group_name = "智慧34重天"
	},
	["2_2035"] = {
		group_seq = 35,
		group_id = 2035,
		career = 2,
		group_name = "智慧35重天"
	},
	["2_2036"] = {
		group_seq = 36,
		group_id = 2036,
		career = 2,
		group_name = "智慧36重天"
	},
	["2_2037"] = {
		group_seq = 37,
		group_id = 2037,
		career = 2,
		group_name = "智慧37重天"
	},
	["2_2038"] = {
		group_seq = 38,
		group_id = 2038,
		career = 2,
		group_name = "智慧38重天"
	},
	["2_2039"] = {
		group_seq = 39,
		group_id = 2039,
		career = 2,
		group_name = "智慧39重天"
	},
	["2_2040"] = {
		group_seq = 40,
		group_id = 2040,
		career = 2,
		group_name = "智慧40重天"
	},
	["4_3001"] = {
		group_seq = 1,
		group_id = 3001,
		career = 4,
		group_name = "勇气1重天"
	},
	["4_3002"] = {
		group_seq = 2,
		group_id = 3002,
		career = 4,
		group_name = "勇气2重天"
	},
	["4_3003"] = {
		group_seq = 3,
		group_id = 3003,
		career = 4,
		group_name = "勇气3重天"
	},
	["4_3004"] = {
		group_seq = 4,
		group_id = 3004,
		career = 4,
		group_name = "勇气4重天"
	},
	["4_3005"] = {
		group_seq = 5,
		group_id = 3005,
		career = 4,
		group_name = "勇气5重天"
	},
	["4_3006"] = {
		group_seq = 6,
		group_id = 3006,
		career = 4,
		group_name = "勇气6重天"
	},
	["4_3007"] = {
		group_seq = 7,
		group_id = 3007,
		career = 4,
		group_name = "勇气7重天"
	},
	["4_3008"] = {
		group_seq = 8,
		group_id = 3008,
		career = 4,
		group_name = "勇气8重天"
	},
	["4_3009"] = {
		group_seq = 9,
		group_id = 3009,
		career = 4,
		group_name = "勇气9重天"
	},
	["4_3010"] = {
		group_seq = 10,
		group_id = 3010,
		career = 4,
		group_name = "勇气10重天"
	},
	["4_3011"] = {
		group_seq = 11,
		group_id = 3011,
		career = 4,
		group_name = "勇气11重天"
	},
	["4_3012"] = {
		group_seq = 12,
		group_id = 3012,
		career = 4,
		group_name = "勇气12重天"
	},
	["4_3013"] = {
		group_seq = 13,
		group_id = 3013,
		career = 4,
		group_name = "勇气13重天"
	},
	["4_3014"] = {
		group_seq = 14,
		group_id = 3014,
		career = 4,
		group_name = "勇气14重天"
	},
	["4_3015"] = {
		group_seq = 15,
		group_id = 3015,
		career = 4,
		group_name = "勇气15重天"
	},
	["4_3016"] = {
		group_seq = 16,
		group_id = 3016,
		career = 4,
		group_name = "勇气16重天"
	},
	["4_3017"] = {
		group_seq = 17,
		group_id = 3017,
		career = 4,
		group_name = "勇气17重天"
	},
	["4_3018"] = {
		group_seq = 18,
		group_id = 3018,
		career = 4,
		group_name = "勇气18重天"
	},
	["4_3019"] = {
		group_seq = 19,
		group_id = 3019,
		career = 4,
		group_name = "勇气19重天"
	},
	["4_3020"] = {
		group_seq = 20,
		group_id = 3020,
		career = 4,
		group_name = "勇气20重天"
	},
	["4_3021"] = {
		group_seq = 21,
		group_id = 3021,
		career = 4,
		group_name = "勇气21重天"
	},
	["4_3022"] = {
		group_seq = 22,
		group_id = 3022,
		career = 4,
		group_name = "勇气22重天"
	},
	["4_3023"] = {
		group_seq = 23,
		group_id = 3023,
		career = 4,
		group_name = "勇气23重天"
	},
	["4_3024"] = {
		group_seq = 24,
		group_id = 3024,
		career = 4,
		group_name = "勇气24重天"
	},
	["4_3025"] = {
		group_seq = 25,
		group_id = 3025,
		career = 4,
		group_name = "勇气25重天"
	},
	["4_3026"] = {
		group_seq = 26,
		group_id = 3026,
		career = 4,
		group_name = "勇气26重天"
	},
	["4_3027"] = {
		group_seq = 27,
		group_id = 3027,
		career = 4,
		group_name = "勇气27重天"
	},
	["4_3028"] = {
		group_seq = 28,
		group_id = 3028,
		career = 4,
		group_name = "勇气28重天"
	},
	["4_3029"] = {
		group_seq = 29,
		group_id = 3029,
		career = 4,
		group_name = "勇气29重天"
	},
	["4_3030"] = {
		group_seq = 30,
		group_id = 3030,
		career = 4,
		group_name = "勇气30重天"
	},
	["4_3031"] = {
		group_seq = 31,
		group_id = 3031,
		career = 4,
		group_name = "勇气31重天"
	},
	["4_3032"] = {
		group_seq = 32,
		group_id = 3032,
		career = 4,
		group_name = "勇气32重天"
	},
	["4_3033"] = {
		group_seq = 33,
		group_id = 3033,
		career = 4,
		group_name = "勇气33重天"
	},
	["4_3034"] = {
		group_seq = 34,
		group_id = 3034,
		career = 4,
		group_name = "勇气34重天"
	},
	["4_3035"] = {
		group_seq = 35,
		group_id = 3035,
		career = 4,
		group_name = "勇气35重天"
	},
	["4_3036"] = {
		group_seq = 36,
		group_id = 3036,
		career = 4,
		group_name = "勇气36重天"
	},
	["4_3037"] = {
		group_seq = 37,
		group_id = 3037,
		career = 4,
		group_name = "勇气37重天"
	},
	["4_3038"] = {
		group_seq = 38,
		group_id = 3038,
		career = 4,
		group_name = "勇气38重天"
	},
	["4_3039"] = {
		group_seq = 39,
		group_id = 3039,
		career = 4,
		group_name = "勇气39重天"
	},
	["4_3040"] = {
		group_seq = 40,
		group_id = 3040,
		career = 4,
		group_name = "勇气40重天"
	},
	["5_4001"] = {
		group_seq = 1,
		group_id = 4001,
		career = 5,
		group_name = "圣光1重天"
	},
	["5_4002"] = {
		group_seq = 2,
		group_id = 4002,
		career = 5,
		group_name = "圣光2重天"
	},
	["5_4003"] = {
		group_seq = 3,
		group_id = 4003,
		career = 5,
		group_name = "圣光3重天"
	},
	["5_4004"] = {
		group_seq = 4,
		group_id = 4004,
		career = 5,
		group_name = "圣光4重天"
	},
	["5_4005"] = {
		group_seq = 5,
		group_id = 4005,
		career = 5,
		group_name = "圣光5重天"
	},
	["5_4006"] = {
		group_seq = 6,
		group_id = 4006,
		career = 5,
		group_name = "圣光6重天"
	},
	["5_4007"] = {
		group_seq = 7,
		group_id = 4007,
		career = 5,
		group_name = "圣光7重天"
	},
	["5_4008"] = {
		group_seq = 8,
		group_id = 4008,
		career = 5,
		group_name = "圣光8重天"
	},
	["5_4009"] = {
		group_seq = 9,
		group_id = 4009,
		career = 5,
		group_name = "圣光9重天"
	},
	["5_4010"] = {
		group_seq = 10,
		group_id = 4010,
		career = 5,
		group_name = "圣光10重天"
	},
	["5_4011"] = {
		group_seq = 11,
		group_id = 4011,
		career = 5,
		group_name = "圣光11重天"
	},
	["5_4012"] = {
		group_seq = 12,
		group_id = 4012,
		career = 5,
		group_name = "圣光12重天"
	},
	["5_4013"] = {
		group_seq = 13,
		group_id = 4013,
		career = 5,
		group_name = "圣光13重天"
	},
	["5_4014"] = {
		group_seq = 14,
		group_id = 4014,
		career = 5,
		group_name = "圣光14重天"
	},
	["5_4015"] = {
		group_seq = 15,
		group_id = 4015,
		career = 5,
		group_name = "圣光15重天"
	},
	["5_4016"] = {
		group_seq = 16,
		group_id = 4016,
		career = 5,
		group_name = "圣光16重天"
	},
	["5_4017"] = {
		group_seq = 17,
		group_id = 4017,
		career = 5,
		group_name = "圣光17重天"
	},
	["5_4018"] = {
		group_seq = 18,
		group_id = 4018,
		career = 5,
		group_name = "圣光18重天"
	},
	["5_4019"] = {
		group_seq = 19,
		group_id = 4019,
		career = 5,
		group_name = "圣光19重天"
	},
	["5_4020"] = {
		group_seq = 20,
		group_id = 4020,
		career = 5,
		group_name = "圣光20重天"
	},
	["5_4021"] = {
		group_seq = 21,
		group_id = 4021,
		career = 5,
		group_name = "圣光21重天"
	},
	["5_4022"] = {
		group_seq = 22,
		group_id = 4022,
		career = 5,
		group_name = "圣光22重天"
	},
	["5_4023"] = {
		group_seq = 23,
		group_id = 4023,
		career = 5,
		group_name = "圣光23重天"
	},
	["5_4024"] = {
		group_seq = 24,
		group_id = 4024,
		career = 5,
		group_name = "圣光24重天"
	},
	["5_4025"] = {
		group_seq = 25,
		group_id = 4025,
		career = 5,
		group_name = "圣光25重天"
	},
	["5_4026"] = {
		group_seq = 26,
		group_id = 4026,
		career = 5,
		group_name = "圣光26重天"
	},
	["5_4027"] = {
		group_seq = 27,
		group_id = 4027,
		career = 5,
		group_name = "圣光27重天"
	},
	["5_4028"] = {
		group_seq = 28,
		group_id = 4028,
		career = 5,
		group_name = "圣光28重天"
	},
	["5_4029"] = {
		group_seq = 29,
		group_id = 4029,
		career = 5,
		group_name = "圣光29重天"
	},
	["5_4030"] = {
		group_seq = 30,
		group_id = 4030,
		career = 5,
		group_name = "圣光30重天"
	},
	["5_4031"] = {
		group_seq = 31,
		group_id = 4031,
		career = 5,
		group_name = "圣光31重天"
	},
	["5_4032"] = {
		group_seq = 32,
		group_id = 4032,
		career = 5,
		group_name = "圣光32重天"
	},
	["5_4033"] = {
		group_seq = 33,
		group_id = 4033,
		career = 5,
		group_name = "圣光33重天"
	},
	["5_4034"] = {
		group_seq = 34,
		group_id = 4034,
		career = 5,
		group_name = "圣光34重天"
	},
	["5_4035"] = {
		group_seq = 35,
		group_id = 4035,
		career = 5,
		group_name = "圣光35重天"
	},
	["5_4036"] = {
		group_seq = 36,
		group_id = 4036,
		career = 5,
		group_name = "圣光36重天"
	},
	["5_4037"] = {
		group_seq = 37,
		group_id = 4037,
		career = 5,
		group_name = "圣光37重天"
	},
	["5_4038"] = {
		group_seq = 38,
		group_id = 4038,
		career = 5,
		group_name = "圣光38重天"
	},
	["5_4039"] = {
		group_seq = 39,
		group_id = 4039,
		career = 5,
		group_name = "圣光39重天"
	},
	["5_4040"] = {
		group_seq = 40,
		group_id = 4040,
		career = 5,
		group_name = "圣光40重天"
	}
}

function Config.GuildSkillData.data_group_fun(slot0)
	slot1 = Config.GuildSkillData.data_group[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildSkillData.data_group[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildSkillData.data_group_sep_length = 160
Config.GuildSkillData.data_group_sep = {
	["3_1"] = {
		group_name = "力量1重天"
	},
	["3_2"] = {
		group_name = "力量2重天"
	},
	["3_3"] = {
		group_name = "力量3重天"
	},
	["3_4"] = {
		group_name = "力量4重天"
	},
	["3_5"] = {
		group_name = "力量5重天"
	},
	["3_6"] = {
		group_name = "力量6重天"
	},
	["3_7"] = {
		group_name = "力量7重天"
	},
	["3_8"] = {
		group_name = "力量8重天"
	},
	["3_9"] = {
		group_name = "力量9重天"
	},
	["3_10"] = {
		group_name = "力量10重天"
	},
	["3_11"] = {
		group_name = "力量11重天"
	},
	["3_12"] = {
		group_name = "力量12重天"
	},
	["3_13"] = {
		group_name = "力量13重天"
	},
	["3_14"] = {
		group_name = "力量14重天"
	},
	["3_15"] = {
		group_name = "力量15重天"
	},
	["3_16"] = {
		group_name = "力量16重天"
	},
	["3_17"] = {
		group_name = "力量17重天"
	},
	["3_18"] = {
		group_name = "力量18重天"
	},
	["3_19"] = {
		group_name = "力量19重天"
	},
	["3_20"] = {
		group_name = "力量20重天"
	},
	["3_21"] = {
		group_name = "力量21重天"
	},
	["3_22"] = {
		group_name = "力量22重天"
	},
	["3_23"] = {
		group_name = "力量23重天"
	},
	["3_24"] = {
		group_name = "力量24重天"
	},
	["3_25"] = {
		group_name = "力量25重天"
	},
	["3_26"] = {
		group_name = "力量26重天"
	},
	["3_27"] = {
		group_name = "力量27重天"
	},
	["3_28"] = {
		group_name = "力量28重天"
	},
	["3_29"] = {
		group_name = "力量29重天"
	},
	["3_30"] = {
		group_name = "力量30重天"
	},
	["3_31"] = {
		group_name = "力量31重天"
	},
	["3_32"] = {
		group_name = "力量32重天"
	},
	["3_33"] = {
		group_name = "力量33重天"
	},
	["3_34"] = {
		group_name = "力量34重天"
	},
	["3_35"] = {
		group_name = "力量35重天"
	},
	["3_36"] = {
		group_name = "力量36重天"
	},
	["3_37"] = {
		group_name = "力量37重天"
	},
	["3_38"] = {
		group_name = "力量38重天"
	},
	["3_39"] = {
		group_name = "力量39重天"
	},
	["3_40"] = {
		group_name = "力量40重天"
	},
	["2_1"] = {
		group_name = "智慧1重天"
	},
	["2_2"] = {
		group_name = "智慧2重天"
	},
	["2_3"] = {
		group_name = "智慧3重天"
	},
	["2_4"] = {
		group_name = "智慧4重天"
	},
	["2_5"] = {
		group_name = "智慧5重天"
	},
	["2_6"] = {
		group_name = "智慧6重天"
	},
	["2_7"] = {
		group_name = "智慧7重天"
	},
	["2_8"] = {
		group_name = "智慧8重天"
	},
	["2_9"] = {
		group_name = "智慧9重天"
	},
	["2_10"] = {
		group_name = "智慧10重天"
	},
	["2_11"] = {
		group_name = "智慧11重天"
	},
	["2_12"] = {
		group_name = "智慧12重天"
	},
	["2_13"] = {
		group_name = "智慧13重天"
	},
	["2_14"] = {
		group_name = "智慧14重天"
	},
	["2_15"] = {
		group_name = "智慧15重天"
	},
	["2_16"] = {
		group_name = "智慧16重天"
	},
	["2_17"] = {
		group_name = "智慧17重天"
	},
	["2_18"] = {
		group_name = "智慧18重天"
	},
	["2_19"] = {
		group_name = "智慧19重天"
	},
	["2_20"] = {
		group_name = "智慧20重天"
	},
	["2_21"] = {
		group_name = "智慧21重天"
	},
	["2_22"] = {
		group_name = "智慧22重天"
	},
	["2_23"] = {
		group_name = "智慧23重天"
	},
	["2_24"] = {
		group_name = "智慧24重天"
	},
	["2_25"] = {
		group_name = "智慧25重天"
	},
	["2_26"] = {
		group_name = "智慧26重天"
	},
	["2_27"] = {
		group_name = "智慧27重天"
	},
	["2_28"] = {
		group_name = "智慧28重天"
	},
	["2_29"] = {
		group_name = "智慧29重天"
	},
	["2_30"] = {
		group_name = "智慧30重天"
	},
	["2_31"] = {
		group_name = "智慧31重天"
	},
	["2_32"] = {
		group_name = "智慧32重天"
	},
	["2_33"] = {
		group_name = "智慧33重天"
	},
	["2_34"] = {
		group_name = "智慧34重天"
	},
	["2_35"] = {
		group_name = "智慧35重天"
	},
	["2_36"] = {
		group_name = "智慧36重天"
	},
	["2_37"] = {
		group_name = "智慧37重天"
	},
	["2_38"] = {
		group_name = "智慧38重天"
	},
	["2_39"] = {
		group_name = "智慧39重天"
	},
	["2_40"] = {
		group_name = "智慧40重天"
	},
	["4_1"] = {
		group_name = "勇气1重天"
	},
	["4_2"] = {
		group_name = "勇气2重天"
	},
	["4_3"] = {
		group_name = "勇气3重天"
	},
	["4_4"] = {
		group_name = "勇气4重天"
	},
	["4_5"] = {
		group_name = "勇气5重天"
	},
	["4_6"] = {
		group_name = "勇气6重天"
	},
	["4_7"] = {
		group_name = "勇气7重天"
	},
	["4_8"] = {
		group_name = "勇气8重天"
	},
	["4_9"] = {
		group_name = "勇气9重天"
	},
	["4_10"] = {
		group_name = "勇气10重天"
	},
	["4_11"] = {
		group_name = "勇气11重天"
	},
	["4_12"] = {
		group_name = "勇气12重天"
	},
	["4_13"] = {
		group_name = "勇气13重天"
	},
	["4_14"] = {
		group_name = "勇气14重天"
	},
	["4_15"] = {
		group_name = "勇气15重天"
	},
	["4_16"] = {
		group_name = "勇气16重天"
	},
	["4_17"] = {
		group_name = "勇气17重天"
	},
	["4_18"] = {
		group_name = "勇气18重天"
	},
	["4_19"] = {
		group_name = "勇气19重天"
	},
	["4_20"] = {
		group_name = "勇气20重天"
	},
	["4_21"] = {
		group_name = "勇气21重天"
	},
	["4_22"] = {
		group_name = "勇气22重天"
	},
	["4_23"] = {
		group_name = "勇气23重天"
	},
	["4_24"] = {
		group_name = "勇气24重天"
	},
	["4_25"] = {
		group_name = "勇气25重天"
	},
	["4_26"] = {
		group_name = "勇气26重天"
	},
	["4_27"] = {
		group_name = "勇气27重天"
	},
	["4_28"] = {
		group_name = "勇气28重天"
	},
	["4_29"] = {
		group_name = "勇气29重天"
	},
	["4_30"] = {
		group_name = "勇气30重天"
	},
	["4_31"] = {
		group_name = "勇气31重天"
	},
	["4_32"] = {
		group_name = "勇气32重天"
	},
	["4_33"] = {
		group_name = "勇气33重天"
	},
	["4_34"] = {
		group_name = "勇气34重天"
	},
	["4_35"] = {
		group_name = "勇气35重天"
	},
	["4_36"] = {
		group_name = "勇气36重天"
	},
	["4_37"] = {
		group_name = "勇气37重天"
	},
	["4_38"] = {
		group_name = "勇气38重天"
	},
	["4_39"] = {
		group_name = "勇气39重天"
	},
	["4_40"] = {
		group_name = "勇气40重天"
	},
	["5_1"] = {
		group_name = "圣光1重天"
	},
	["5_2"] = {
		group_name = "圣光2重天"
	},
	["5_3"] = {
		group_name = "圣光3重天"
	},
	["5_4"] = {
		group_name = "圣光4重天"
	},
	["5_5"] = {
		group_name = "圣光5重天"
	},
	["5_6"] = {
		group_name = "圣光6重天"
	},
	["5_7"] = {
		group_name = "圣光7重天"
	},
	["5_8"] = {
		group_name = "圣光8重天"
	},
	["5_9"] = {
		group_name = "圣光9重天"
	},
	["5_10"] = {
		group_name = "圣光10重天"
	},
	["5_11"] = {
		group_name = "圣光11重天"
	},
	["5_12"] = {
		group_name = "圣光12重天"
	},
	["5_13"] = {
		group_name = "圣光13重天"
	},
	["5_14"] = {
		group_name = "圣光14重天"
	},
	["5_15"] = {
		group_name = "圣光15重天"
	},
	["5_16"] = {
		group_name = "圣光16重天"
	},
	["5_17"] = {
		group_name = "圣光17重天"
	},
	["5_18"] = {
		group_name = "圣光18重天"
	},
	["5_19"] = {
		group_name = "圣光19重天"
	},
	["5_20"] = {
		group_name = "圣光20重天"
	},
	["5_21"] = {
		group_name = "圣光21重天"
	},
	["5_22"] = {
		group_name = "圣光22重天"
	},
	["5_23"] = {
		group_name = "圣光23重天"
	},
	["5_24"] = {
		group_name = "圣光24重天"
	},
	["5_25"] = {
		group_name = "圣光25重天"
	},
	["5_26"] = {
		group_name = "圣光26重天"
	},
	["5_27"] = {
		group_name = "圣光27重天"
	},
	["5_28"] = {
		group_name = "圣光28重天"
	},
	["5_29"] = {
		group_name = "圣光29重天"
	},
	["5_30"] = {
		group_name = "圣光30重天"
	},
	["5_31"] = {
		group_name = "圣光31重天"
	},
	["5_32"] = {
		group_name = "圣光32重天"
	},
	["5_33"] = {
		group_name = "圣光33重天"
	},
	["5_34"] = {
		group_name = "圣光34重天"
	},
	["5_35"] = {
		group_name = "圣光35重天"
	},
	["5_36"] = {
		group_name = "圣光36重天"
	},
	["5_37"] = {
		group_name = "圣光37重天"
	},
	["5_38"] = {
		group_name = "圣光38重天"
	},
	["5_39"] = {
		group_name = "圣光39重天"
	},
	["5_40"] = {
		group_name = "圣光40重天"
	}
}

function Config.GuildSkillData.data_group_sep_fun(slot0)
	slot1 = Config.GuildSkillData.data_group_sep[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildSkillData.data_group_sep[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildSkillData.data_career_list_length = 4
Config.GuildSkillData.data_career_list = {
	[5] = {
		{
			group_seq = 1
		},
		{
			group_seq = 2
		},
		{
			group_seq = 3
		},
		{
			group_seq = 4
		},
		{
			group_seq = 5
		},
		{
			group_seq = 6
		},
		{
			group_seq = 7
		},
		{
			group_seq = 8
		},
		{
			group_seq = 9
		},
		{
			group_seq = 10
		},
		{
			group_seq = 11
		},
		{
			group_seq = 12
		},
		{
			group_seq = 13
		},
		{
			group_seq = 14
		},
		{
			group_seq = 15
		},
		{
			group_seq = 16
		},
		{
			group_seq = 17
		},
		{
			group_seq = 18
		},
		{
			group_seq = 19
		},
		{
			group_seq = 20
		},
		{
			group_seq = 21
		},
		{
			group_seq = 22
		},
		{
			group_seq = 23
		},
		{
			group_seq = 24
		},
		{
			group_seq = 25
		},
		{
			group_seq = 26
		},
		{
			group_seq = 27
		},
		{
			group_seq = 28
		},
		{
			group_seq = 29
		},
		{
			group_seq = 30
		},
		{
			group_seq = 31
		},
		{
			group_seq = 32
		},
		{
			group_seq = 33
		},
		{
			group_seq = 34
		},
		{
			group_seq = 35
		},
		{
			group_seq = 36
		},
		{
			group_seq = 37
		},
		{
			group_seq = 38
		},
		{
			group_seq = 39
		},
		{
			group_seq = 40
		}
	},
	[4] = {
		{
			group_seq = 1
		},
		{
			group_seq = 2
		},
		{
			group_seq = 3
		},
		{
			group_seq = 4
		},
		{
			group_seq = 5
		},
		{
			group_seq = 6
		},
		{
			group_seq = 7
		},
		{
			group_seq = 8
		},
		{
			group_seq = 9
		},
		{
			group_seq = 10
		},
		{
			group_seq = 11
		},
		{
			group_seq = 12
		},
		{
			group_seq = 13
		},
		{
			group_seq = 14
		},
		{
			group_seq = 15
		},
		{
			group_seq = 16
		},
		{
			group_seq = 17
		},
		{
			group_seq = 18
		},
		{
			group_seq = 19
		},
		{
			group_seq = 20
		},
		{
			group_seq = 21
		},
		{
			group_seq = 22
		},
		{
			group_seq = 23
		},
		{
			group_seq = 24
		},
		{
			group_seq = 25
		},
		{
			group_seq = 26
		},
		{
			group_seq = 27
		},
		{
			group_seq = 28
		},
		{
			group_seq = 29
		},
		{
			group_seq = 30
		},
		{
			group_seq = 31
		},
		{
			group_seq = 32
		},
		{
			group_seq = 33
		},
		{
			group_seq = 34
		},
		{
			group_seq = 35
		},
		{
			group_seq = 36
		},
		{
			group_seq = 37
		},
		{
			group_seq = 38
		},
		{
			group_seq = 39
		},
		{
			group_seq = 40
		}
	},
	[2] = {
		{
			group_seq = 1
		},
		{
			group_seq = 2
		},
		{
			group_seq = 3
		},
		{
			group_seq = 4
		},
		{
			group_seq = 5
		},
		{
			group_seq = 6
		},
		{
			group_seq = 7
		},
		{
			group_seq = 8
		},
		{
			group_seq = 9
		},
		{
			group_seq = 10
		},
		{
			group_seq = 11
		},
		{
			group_seq = 12
		},
		{
			group_seq = 13
		},
		{
			group_seq = 14
		},
		{
			group_seq = 15
		},
		{
			group_seq = 16
		},
		{
			group_seq = 17
		},
		{
			group_seq = 18
		},
		{
			group_seq = 19
		},
		{
			group_seq = 20
		},
		{
			group_seq = 21
		},
		{
			group_seq = 22
		},
		{
			group_seq = 23
		},
		{
			group_seq = 24
		},
		{
			group_seq = 25
		},
		{
			group_seq = 26
		},
		{
			group_seq = 27
		},
		{
			group_seq = 28
		},
		{
			group_seq = 29
		},
		{
			group_seq = 30
		},
		{
			group_seq = 31
		},
		{
			group_seq = 32
		},
		{
			group_seq = 33
		},
		{
			group_seq = 34
		},
		{
			group_seq = 35
		},
		{
			group_seq = 36
		},
		{
			group_seq = 37
		},
		{
			group_seq = 38
		},
		{
			group_seq = 39
		},
		{
			group_seq = 40
		}
	},
	[3] = {
		{
			group_seq = 1
		},
		{
			group_seq = 2
		},
		{
			group_seq = 3
		},
		{
			group_seq = 4
		},
		{
			group_seq = 5
		},
		{
			group_seq = 6
		},
		{
			group_seq = 7
		},
		{
			group_seq = 8
		},
		{
			group_seq = 9
		},
		{
			group_seq = 10
		},
		{
			group_seq = 11
		},
		{
			group_seq = 12
		},
		{
			group_seq = 13
		},
		{
			group_seq = 14
		},
		{
			group_seq = 15
		},
		{
			group_seq = 16
		},
		{
			group_seq = 17
		},
		{
			group_seq = 18
		},
		{
			group_seq = 19
		},
		{
			group_seq = 20
		},
		{
			group_seq = 21
		},
		{
			group_seq = 22
		},
		{
			group_seq = 23
		},
		{
			group_seq = 24
		},
		{
			group_seq = 25
		},
		{
			group_seq = 26
		},
		{
			group_seq = 27
		},
		{
			group_seq = 28
		},
		{
			group_seq = 29
		},
		{
			group_seq = 30
		},
		{
			group_seq = 31
		},
		{
			group_seq = 32
		},
		{
			group_seq = 33
		},
		{
			group_seq = 34
		},
		{
			group_seq = 35
		},
		{
			group_seq = 36
		},
		{
			group_seq = 37
		},
		{
			group_seq = 38
		},
		{
			group_seq = 39
		},
		{
			group_seq = 40
		}
	}
}
Config.GuildSkillData.data_info_length = 960
Config.GuildSkillData.data_info_cache = {}

function Config.GuildSkillData.data_info(slot0)
	if Config.GuildSkillData.data_info_cache[slot0] == nil then
		if not Config.GuildSkillData.data_info_table[slot0] then
			return
		end

		if not loadstring(string.format("return %s", slot1))() then
			return
		end

		Config.GuildSkillData.data_info_cache[slot0] = {
			id = slot1[1],
			name = slot1[2],
			group_id = slot1[3],
			loss = slot1[4],
			seq = slot1[5],
			guild_lev = slot1[6],
			attr_list = slot1[7],
			lev = slot1[8]
		}
	end

	return Config.GuildSkillData.data_info_cache[slot0]
end

Config.GuildSkillData.data_info_table = {
	[40225.0] = "{40225, \"速度\", 4022, {{10,1350},{1,810000}}, 5, 1, {{'speed',4}}, 22}",
	[30204.0] = "{30204, \"抗暴\", 3020, {{10,1008},{1,604800}}, 4, 1, {{'tenacity',5}}, 20}",
	[40256.0] = "{40256, \"魔法免伤\", 4025, {{10,1860},{1,1116000}}, 6, 1, {{'res_s',5}}, 25}",
	[20161.0] = "{20161, \"气血比\", 2016, {{10,450},{1,270000}}, 1, 1, {{'hp_max_per',5}}, 16}",
	[10314.0] = "{10314, \"暴伤\", 1031, {{10,2128},{1,1276800}}, 4, 1, {{'crit_ratio',10}}, 31}",
	[30171.0] = "{30171, \"气血比\", 3017, {{10,490},{1,294000}}, 1, 1, {{'hp_max_per',5}}, 17}",
	[30394.0] = "{30394, \"抗暴\", 3039, {{10,3152},{1,1891200}}, 4, 1, {{'tenacity',5}}, 39}",
	[10225.0] = "{10225, \"速度\", 1022, {{10,1350},{1,810000}}, 5, 1, {{'speed',4}}, 22}",
	[30121.0] = "{30121, \"气血比\", 3012, {{10,290},{1,174000}}, 1, 1, {{'hp_max_per',5}}, 12}",
	[20095.0] = "{20095, \"速度\", 2009, {{10,306},{1,183600}}, 5, 1, {{'speed',4}}, 9}",
	[30361.0] = "{30361, \"气血比\", 3036, {{10,1730},{1,1038000}}, 1, 1, {{'hp_max_per',5}}, 36}",
	[10345.0] = "{10345, \"速度\", 1034, {{10,2826},{1,1695600}}, 5, 1, {{'speed',4}}, 34}",
	[40305.0] = "{40305, \"速度\", 4030, {{10,2250},{1,1350000}}, 5, 1, {{'speed',4}}, 30}",
	[20351.0] = "{20351, \"气血比\", 2035, {{10,1650},{1,990000}}, 1, 1, {{'hp_max_per',5}}, 35}",
	[30105.0] = "{30105, \"速度\", 3010, {{10,378},{1,226800}}, 5, 1, {{'speed',4}}, 10}",
	[30072.0] = "{30072, \"攻击比\", 3007, {{10,156},{1,109200}}, 2, 1, {{'atk_per',5}}, 7}",
	[20254.0] = "{20254, \"暴伤\", 2025, {{10,1488},{1,892800}}, 4, 1, {{'crit_ratio',10}}, 25}",
	[10031.0] = "{10031, \"气血比\", 1003, {{10,50},{1,30000}}, 1, 1, {{'hp_max_per',5}}, 3}",
	[40023.0] = "{40023, \"抗控\", 4002, {{10,42},{1,25200}}, 3, 1, {{'dodge_magic',5}}, 2}",
	[30142.0] = "{30142, \"攻击比\", 3014, {{10,444},{1,310800}}, 2, 1, {{'atk_per',5}}, 14}",
	[30262.0] = "{30262, \"攻击比\", 3026, {{10,1188},{1,831600}}, 2, 1, {{'atk_per',5}}, 26}",
	[30285.0] = "{30285, \"速度\", 3028, {{10,1998},{1,1198800}}, 5, 1, {{'speed',4}}, 28}",
	[10376.0] = "{10376, \"伤害加成\", 1037, {{10,3620},{1,2172000}}, 6, 1, {{'dam',5}}, 37}",
	[40085.0] = "{40085, \"速度\", 4008, {{10,270},{1,162000}}, 5, 1, {{'speed',4}}, 8}",
	[30355.0] = "{30355, \"速度\", 3035, {{10,2970},{1,1782000}}, 5, 1, {{'speed',4}}, 35}",
	[40116.0] = "{40116, \"魔法免伤\", 4011, {{10,500},{1,300000}}, 6, 1, {{'res_s',5}}, 11}",
	[10062.0] = "{10062, \"攻击比\", 1006, {{10,132},{1,92400}}, 2, 1, {{'atk_per',5}}, 6}",
	[30322.0] = "{30322, \"攻击比\", 3032, {{10,1692},{1,1184400}}, 2, 1, {{'atk_per',5}}, 32}",
	[30235.0] = "{30235, \"速度\", 3023, {{10,1458},{1,874800}}, 5, 1, {{'speed',4}}, 23}",
	[30013.0] = "{30013, \"控制\", 3001, {{10,14},{1,8400}}, 3, 1, {{'hit_magic',5}}, 1}",
	[20122.0] = "{20122, \"攻击比\", 2012, {{10,348},{1,243600}}, 2, 1, {{'atk_per',5}}, 12}",
	[40206.0] = "{40206, \"魔法免伤\", 4020, {{10,1260},{1,756000}}, 6, 1, {{'res_s',5}}, 20}",
	[40051.0] = "{40051, \"气血比\", 4005, {{10,90},{1,54000}}, 1, 1, {{'hp_max_per',5}}, 5}",
	[30196.0] = "{30196, \"物理免伤\", 3019, {{10,1140},{1,684000}}, 6, 1, {{'res_p',5}}, 19}",
	[20153.0] = "{20153, \"暴击\", 2015, {{10,574},{1,344400}}, 3, 1, {{'crit_rate',5}}, 15}",
	[10093.0] = "{10093, \"暴击\", 1009, {{10,238},{1,142800}}, 3, 1, {{'crit_rate',5}}, 9}",
	[40271.0] = "{40271, \"气血比\", 4027, {{10,1050},{1,630000}}, 1, 1, {{'hp_max_per',5}}, 27}",
	[30163.0] = "{30163, \"控制\", 3016, {{10,630},{1,378000}}, 3, 1, {{'hit_magic',5}}, 16}",
	[40302.0] = "{40302, \"攻击比\", 4030, {{10,1500},{1,1050000}}, 2, 1, {{'atk_per',5}}, 30}",
	[10221.0] = "{10221, \"气血比\", 1022, {{10,750},{1,450000}}, 1, 1, {{'hp_max_per',5}}, 22}",
	[40152.0] = "{40152, \"攻击比\", 4015, {{10,492},{1,344400}}, 2, 1, {{'atk_per',5}}, 15}",
	[40333.0] = "{40333, \"抗控\", 4033, {{10,2086},{1,1251600}}, 3, 1, {{'dodge_magic',5}}, 33}",
	[30353.0] = "{30353, \"控制\", 3035, {{10,2310},{1,1386000}}, 3, 1, {{'hit_magic',5}}, 35}",
	[40364.0] = "{40364, \"抗暴\", 4036, {{10,2768},{1,1660800}}, 4, 1, {{'tenacity',5}}, 36}",
	[10124.0] = "{10124, \"暴伤\", 1012, {{10,464},{1,278400}}, 4, 1, {{'crit_ratio',10}}, 12}",
	[40395.0] = "{40395, \"速度\", 4039, {{10,3546},{1,2127600}}, 5, 1, {{'speed',4}}, 39}",
	[30284.0] = "{30284, \"抗暴\", 3028, {{10,1776},{1,1065600}}, 4, 1, {{'tenacity',5}}, 28}",
	[30064.0] = "{30064, \"抗暴\", 3006, {{10,176},{1,105600}}, 4, 1, {{'tenacity',5}}, 6}",
	[20246.0] = "{20246, \"伤害加成\", 2024, {{10,1740},{1,1044000}}, 6, 1, {{'dam',5}}, 24}",
	[10244.0] = "{10244, \"暴伤\", 1024, {{10,1392},{1,835200}}, 4, 1, {{'crit_ratio',10}}, 24}",
	[40351.0] = "{40351, \"气血比\", 4035, {{10,1650},{1,990000}}, 1, 1, {{'hp_max_per',5}}, 35}",
	[30031.0] = "{30031, \"气血比\", 3003, {{10,50},{1,30000}}, 1, 1, {{'hp_max_per',5}}, 3}",
	[30254.0] = "{30254, \"抗暴\", 3025, {{10,1488},{1,892800}}, 4, 1, {{'tenacity',5}}, 25}",
	[10155.0] = "{10155, \"速度\", 1015, {{10,738},{1,442800}}, 5, 1, {{'speed',4}}, 15}",
	[10372.0] = "{10372, \"攻击比\", 1037, {{10,2172},{1,1520400}}, 2, 1, {{'atk_per',5}}, 37}",
	[30154.0] = "{30154, \"抗暴\", 3015, {{10,656},{1,393600}}, 4, 1, {{'tenacity',5}}, 15}",
	[30221.0] = "{30221, \"气血比\", 3022, {{10,750},{1,450000}}, 1, 1, {{'hp_max_per',5}}, 22}",
	[10275.0] = "{10275, \"速度\", 1027, {{10,1890},{1,1134000}}, 5, 1, {{'speed',4}}, 27}",
	[40176.0] = "{40176, \"魔法免伤\", 4017, {{10,980},{1,588000}}, 6, 1, {{'res_s',5}}, 17}",
	[40131.0] = "{40131, \"气血比\", 4013, {{10,330},{1,198000}}, 1, 1, {{'hp_max_per',5}}, 13}",
	[30224.0] = "{30224, \"抗暴\", 3022, {{10,1200},{1,720000}}, 4, 1, {{'tenacity',5}}, 22}",
	[40162.0] = "{40162, \"攻击比\", 4016, {{10,540},{1,378000}}, 2, 1, {{'atk_per',5}}, 16}",
	[20114.0] = "{20114, \"暴伤\", 2011, {{10,400},{1,240000}}, 4, 1, {{'crit_ratio',10}}, 11}",
	[40021.0] = "{40021, \"气血比\", 4002, {{10,30},{1,18000}}, 1, 1, {{'hp_max_per',5}}, 2}",
	[40193.0] = "{40193, \"抗控\", 4019, {{10,798},{1,478800}}, 3, 1, {{'dodge_magic',5}}, 19}",
	[40122.0] = "{40122, \"攻击比\", 4012, {{10,348},{1,243600}}, 2, 1, {{'atk_per',5}}, 12}",
	[40224.0] = "{40224, \"抗暴\", 4022, {{10,1200},{1,720000}}, 4, 1, {{'tenacity',5}}, 22}",
	[30296.0] = "{30296, \"物理免伤\", 3029, {{10,2340},{1,1404000}}, 6, 1, {{'res_p',5}}, 29}",
	[40255.0] = "{40255, \"速度\", 4025, {{10,1674},{1,1004400}}, 5, 1, {{'speed',4}}, 25}",
	[30155.0] = "{30155, \"速度\", 3015, {{10,738},{1,442800}}, 5, 1, {{'speed',4}}, 15}",
	[40286.0] = "{40286, \"魔法免伤\", 4028, {{10,2220},{1,1332000}}, 6, 1, {{'res_s',5}}, 28}",
	[30404.0] = "{30404, \"抗暴\", 3040, {{10,3312},{1,1987200}}, 4, 1, {{'tenacity',5}}, 40}",
	[40386.0] = "{40386, \"魔法免伤\", 4038, {{10,3780},{1,2268000}}, 6, 1, {{'res_s',5}}, 38}",
	[20304.0] = "{20304, \"暴伤\", 2030, {{10,2000},{1,1200000}}, 4, 1, {{'crit_ratio',10}}, 30}",
	[30122.0] = "{30122, \"攻击比\", 3012, {{10,348},{1,243600}}, 2, 1, {{'atk_per',5}}, 12}",
	[30312.0] = "{30312, \"攻击比\", 3031, {{10,1596},{1,1117200}}, 2, 1, {{'atk_per',5}}, 31}",
	[30366.0] = "{30366, \"物理免伤\", 3036, {{10,3460},{1,2076000}}, 6, 1, {{'res_p',5}}, 36}",
	[20335.0] = "{20335, \"速度\", 2033, {{10,2682},{1,1609200}}, 5, 1, {{'speed',4}}, 33}",
	[30215.0] = "{30215, \"速度\", 3021, {{10,1242},{1,745200}}, 5, 1, {{'speed',4}}, 21}",
	[30056.0] = "{30056, \"物理免伤\", 3005, {{10,180},{1,108000}}, 6, 1, {{'res_p',5}}, 5}",
	[20013.0] = "{20013, \"暴击\", 2001, {{10,14},{1,8400}}, 3, 1, {{'crit_rate',5}}, 1}",
	[10023.0] = "{10023, \"暴击\", 1002, {{10,42},{1,25200}}, 3, 1, {{'crit_rate',5}}, 2}",
	[40014.0] = "{40014, \"抗暴\", 4001, {{10,16},{1,9600}}, 4, 1, {{'tenacity',5}}, 1}",
	[30023.0] = "{30023, \"控制\", 3002, {{10,42},{1,25200}}, 3, 1, {{'hit_magic',5}}, 2}",
	[30246.0] = "{30246, \"物理免伤\", 3024, {{10,1740},{1,1044000}}, 6, 1, {{'res_p',5}}, 24}",
	[10151.0] = "{10151, \"气血比\", 1015, {{10,410},{1,246000}}, 1, 1, {{'hp_max_per',5}}, 15}",
	[40053.0] = "{40053, \"抗控\", 4005, {{10,126},{1,75600}}, 3, 1, {{'dodge_magic',5}}, 5}",
	[20172.0] = "{20172, \"攻击比\", 2017, {{10,588},{1,411600}}, 2, 1, {{'atk_per',5}}, 17}",
	[30213.0] = "{30213, \"控制\", 3021, {{10,966},{1,579600}}, 3, 1, {{'hit_magic',5}}, 21}",
	[40084.0] = "{40084, \"抗暴\", 4008, {{10,240},{1,144000}}, 4, 1, {{'tenacity',5}}, 8}",
	[10054.0] = "{10054, \"暴伤\", 1005, {{10,144},{1,86400}}, 4, 1, {{'crit_ratio',10}}, 5}",
	[40115.0] = "{40115, \"速度\", 4011, {{10,450},{1,270000}}, 5, 1, {{'speed',4}}, 11}",
	[40022.0] = "{40022, \"攻击比\", 4002, {{10,36},{1,25200}}, 2, 1, {{'atk_per',5}}, 2}",
	[40146.0] = "{40146, \"魔法免伤\", 4014, {{10,740},{1,444000}}, 6, 1, {{'res_s',5}}, 14}",
	[20106.0] = "{20106, \"伤害加成\", 2010, {{10,420},{1,252000}}, 6, 1, {{'dam',5}}, 10}",
	[30395.0] = "{30395, \"速度\", 3039, {{10,3546},{1,2127600}}, 5, 1, {{'speed',4}}, 39}",
	[40216.0] = "{40216, \"魔法免伤\", 4021, {{10,1380},{1,828000}}, 6, 1, {{'res_s',5}}, 21}",
	[30403.0] = "{30403, \"控制\", 3040, {{10,2898},{1,1738800}}, 3, 1, {{'hit_magic',5}}, 40}",
	[20362.0] = "{20362, \"攻击比\", 2036, {{10,2076},{1,1453200}}, 2, 1, {{'atk_per',5}}, 36}",
	[10085.0] = "{10085, \"速度\", 1008, {{10,270},{1,162000}}, 5, 1, {{'speed',4}}, 8}",
	[30336.0] = "{30336, \"物理免伤\", 3033, {{10,2980},{1,1788000}}, 6, 1, {{'res_p',5}}, 33}",
	[30364.0] = "{30364, \"抗暴\", 3036, {{10,2768},{1,1660800}}, 4, 1, {{'tenacity',5}}, 36}",
	[20393.0] = "{20393, \"暴击\", 2039, {{10,2758},{1,1654800}}, 3, 1, {{'crit_rate',5}}, 39}",
	[10213.0] = "{10213, \"暴击\", 1021, {{10,966},{1,579600}}, 3, 1, {{'crit_rate',5}}, 21}",
	[40301.0] = "{40301, \"气血比\", 4030, {{10,1250},{1,750000}}, 1, 1, {{'hp_max_per',5}}, 30}",
	[20296.0] = "{20296, \"伤害加成\", 2029, {{10,2340},{1,1404000}}, 6, 1, {{'dam',5}}, 29}",
	[30114.0] = "{30114, \"抗暴\", 3011, {{10,400},{1,240000}}, 4, 1, {{'tenacity',5}}, 11}",
	[30304.0] = "{30304, \"抗暴\", 3030, {{10,2000},{1,1200000}}, 4, 1, {{'tenacity',5}}, 30}",
	[10116.0] = "{10116, \"伤害加成\", 1011, {{10,500},{1,300000}}, 6, 1, {{'dam',5}}, 11}",
	[40363.0] = "{40363, \"抗控\", 4036, {{10,2422},{1,1453200}}, 3, 1, {{'dodge_magic',5}}, 36}",
	[30081.0] = "{30081, \"气血比\", 3008, {{10,150},{1,90000}}, 1, 1, {{'hp_max_per',5}}, 8}",
	[40394.0] = "{40394, \"抗暴\", 4039, {{10,3152},{1,1891200}}, 4, 1, {{'tenacity',5}}, 39}",
	[30271.0] = "{30271, \"气血比\", 3027, {{10,1050},{1,630000}}, 1, 1, {{'hp_max_per',5}}, 27}",
	[30234.0] = "{30234, \"抗暴\", 3023, {{10,1296},{1,777600}}, 4, 1, {{'tenacity',5}}, 23}",
	[40262.0] = "{40262, \"攻击比\", 4026, {{10,1188},{1,831600}}, 2, 1, {{'atk_per',5}}, 26}",
	[10364.0] = "{10364, \"暴伤\", 1036, {{10,2768},{1,1660800}}, 4, 1, {{'crit_ratio',10}}, 36}",
	[30015.0] = "{30015, \"速度\", 3001, {{10,18},{1,10800}}, 5, 1, {{'speed',4}}, 1}",
	[30164.0] = "{30164, \"抗暴\", 3016, {{10,720},{1,432000}}, 4, 1, {{'tenacity',5}}, 16}",
	[40294.0] = "{40294, \"抗暴\", 4029, {{10,1872},{1,1123200}}, 4, 1, {{'tenacity',5}}, 29}",
	[20164.0] = "{20164, \"暴伤\", 2016, {{10,720},{1,432000}}, 4, 1, {{'crit_ratio',10}}, 16}",
	[40362.0] = "{40362, \"攻击比\", 4036, {{10,2076},{1,1453200}}, 2, 1, {{'atk_per',5}}, 36}",
	[30024.0] = "{30024, \"抗暴\", 3002, {{10,48},{1,28800}}, 4, 1, {{'tenacity',5}}, 2}",
	[40254.0] = "{40254, \"抗暴\", 4025, {{10,1488},{1,892800}}, 4, 1, {{'tenacity',5}}, 25}",
	[20195.0] = "{20195, \"速度\", 2019, {{10,1026},{1,615600}}, 5, 1, {{'speed',4}}, 19}",
	[30063.0] = "{30063, \"控制\", 3006, {{10,154},{1,92400}}, 3, 1, {{'hit_magic',5}}, 6}",
	[30205.0] = "{30205, \"速度\", 3020, {{10,1134},{1,680400}}, 5, 1, {{'speed',4}}, 20}",
	[10395.0] = "{10395, \"速度\", 1039, {{10,3546},{1,2127600}}, 5, 1, {{'speed',4}}, 39}",
	[40161.0] = "{40161, \"气血比\", 4016, {{10,450},{1,270000}}, 1, 1, {{'hp_max_per',5}}, 16}",
	[40346.0] = "{40346, \"魔法免伤\", 4034, {{10,3140},{1,1884000}}, 6, 1, {{'res_s',5}}, 34}",
	[30172.0] = "{30172, \"攻击比\", 3017, {{10,588},{1,411600}}, 2, 1, {{'atk_per',5}}, 17}",
	[40192.0] = "{40192, \"攻击比\", 4019, {{10,684},{1,478800}}, 2, 1, {{'atk_per',5}}, 19}",
	[10081.0] = "{10081, \"气血比\", 1008, {{10,150},{1,90000}}, 1, 1, {{'hp_max_per',5}}, 8}",
	[40223.0] = "{40223, \"抗控\", 4022, {{10,1050},{1,630000}}, 3, 1, {{'dodge_magic',5}}, 22}",
	[20032.0] = "{20032, \"攻击比\", 2003, {{10,60},{1,42000}}, 2, 1, {{'atk_per',5}}, 3}",
	[30362.0] = "{30362, \"攻击比\", 3036, {{10,2076},{1,1453200}}, 2, 1, {{'atk_per',5}}, 36}",
	[30173.0] = "{30173, \"控制\", 3017, {{10,686},{1,411600}}, 3, 1, {{'hit_magic',5}}, 17}",
	[40285.0] = "{40285, \"速度\", 4028, {{10,1998},{1,1198800}}, 5, 1, {{'speed',4}}, 28}",
	[20063.0] = "{20063, \"暴击\", 2006, {{10,154},{1,92400}}, 3, 1, {{'crit_rate',5}}, 6}",
	[30106.0] = "{30106, \"物理免伤\", 3010, {{10,420},{1,252000}}, 6, 1, {{'res_p',5}}, 10}",
	[30073.0] = "{30073, \"控制\", 3007, {{10,182},{1,109200}}, 3, 1, {{'hit_magic',5}}, 7}",
	[10112.0] = "{10112, \"攻击比\", 1011, {{10,300},{1,210000}}, 2, 1, {{'atk_per',5}}, 11}",
	[40341.0] = "{40341, \"气血比\", 4034, {{10,1570},{1,942000}}, 1, 1, {{'hp_max_per',5}}, 34}",
	[40381.0] = "{40381, \"气血比\", 4038, {{10,1890},{1,1134000}}, 1, 1, {{'hp_max_per',5}}, 38}",
	[20222.0] = "{20222, \"攻击比\", 2022, {{10,900},{1,630000}}, 2, 1, {{'atk_per',5}}, 22}",
	[30263.0] = "{30263, \"控制\", 3026, {{10,1386},{1,831600}}, 3, 1, {{'hit_magic',5}}, 26}",
	[40181.0] = "{40181, \"气血比\", 4018, {{10,530},{1,318000}}, 1, 1, {{'hp_max_per',5}}, 18}",
	[40054.0] = "{40054, \"抗暴\", 4005, {{10,144},{1,86400}}, 4, 1, {{'tenacity',5}}, 5}",
	[30086.0] = "{30086, \"物理免伤\", 3008, {{10,300},{1,180000}}, 6, 1, {{'res_p',5}}, 8}",
	[20253.0] = "{20253, \"暴击\", 2025, {{10,1302},{1,781200}}, 3, 1, {{'crit_rate',5}}, 25}",
	[40141.0] = "{40141, \"气血比\", 4014, {{10,370},{1,222000}}, 1, 1, {{'hp_max_per',5}}, 14}",
	[20156.0] = "{20156, \"伤害加成\", 2015, {{10,820},{1,492000}}, 6, 1, {{'dam',5}}, 15}",
	[40222.0] = "{40222, \"攻击比\", 4022, {{10,900},{1,630000}}, 2, 1, {{'atk_per',5}}, 22}",
	[40052.0] = "{40052, \"攻击比\", 4005, {{10,108},{1,75600}}, 2, 1, {{'atk_per',5}}, 5}",
	[10046.0] = "{10046, \"伤害加成\", 1004, {{10,140},{1,84000}}, 6, 1, {{'dam',5}}, 4}",
	[40101.0] = "{40101, \"气血比\", 4010, {{10,210},{1,126000}}, 1, 1, {{'hp_max_per',5}}, 10}",
	[40083.0] = "{40083, \"抗控\", 4008, {{10,210},{1,126000}}, 3, 1, {{'dodge_magic',5}}, 8}",
	[40111.0] = "{40111, \"气血比\", 4011, {{10,250},{1,150000}}, 1, 1, {{'hp_max_per',5}}, 11}",
	[40114.0] = "{40114, \"抗暴\", 4011, {{10,400},{1,240000}}, 4, 1, {{'tenacity',5}}, 11}",
	[10391.0] = "{10391, \"气血比\", 1039, {{10,1970},{1,1182000}}, 1, 1, {{'hp_max_per',5}}, 39}",
	[40145.0] = "{40145, \"速度\", 4014, {{10,666},{1,399600}}, 5, 1, {{'speed',4}}, 14}",
	[30294.0] = "{30294, \"抗暴\", 3029, {{10,1872},{1,1123200}}, 4, 1, {{'tenacity',5}}, 29}",
	[20346.0] = "{20346, \"伤害加成\", 2034, {{10,3140},{1,1884000}}, 6, 1, {{'dam',5}}, 34}",
	[20121.0] = "{20121, \"气血比\", 2012, {{10,290},{1,174000}}, 1, 1, {{'hp_max_per',5}}, 12}",
	[30266.0] = "{30266, \"物理免伤\", 3026, {{10,1980},{1,1188000}}, 6, 1, {{'res_p',5}}, 26}",
	[20024.0] = "{20024, \"暴伤\", 2002, {{10,48},{1,28800}}, 4, 1, {{'crit_ratio',10}}, 2}",
	[20266.0] = "{20266, \"伤害加成\", 2026, {{10,1980},{1,1188000}}, 6, 1, {{'dam',5}}, 26}",
	[30131.0] = "{30131, \"气血比\", 3013, {{10,330},{1,198000}}, 1, 1, {{'hp_max_per',5}}, 13}",
	[30321.0] = "{30321, \"气血比\", 3032, {{10,1410},{1,846000}}, 1, 1, {{'hp_max_per',5}}, 32}",
	[20086.0] = "{20086, \"伤害加成\", 2008, {{10,300},{1,180000}}, 6, 1, {{'dam',5}}, 8}",
	[20055.0] = "{20055, \"速度\", 2005, {{10,162},{1,97200}}, 5, 1, {{'speed',4}}, 5}",
	[20066.0] = "{20066, \"伤害加成\", 2006, {{10,220},{1,132000}}, 6, 1, {{'dam',5}}, 6}",
	[30065.0] = "{30065, \"速度\", 3006, {{10,198},{1,118800}}, 5, 1, {{'speed',4}}, 6}",
	[10325.0] = "{10325, \"速度\", 1032, {{10,2538},{1,1522800}}, 5, 1, {{'speed',4}}, 32}",
	[40331.0] = "{40331, \"气血比\", 4033, {{10,1490},{1,894000}}, 1, 1, {{'hp_max_per',5}}, 33}",
	[20046.0] = "{20046, \"伤害加成\", 2004, {{10,140},{1,84000}}, 6, 1, {{'dam',5}}, 4}",
	[30032.0] = "{30032, \"攻击比\", 3003, {{10,60},{1,42000}}, 2, 1, {{'atk_per',5}}, 3}",
	[30255.0] = "{30255, \"速度\", 3025, {{10,1674},{1,1004400}}, 5, 1, {{'speed',4}}, 25}",
	[40393.0] = "{40393, \"抗控\", 4039, {{10,2758},{1,1654800}}, 3, 1, {{'dodge_magic',5}}, 39}",
	[20405.0] = "{20405, \"速度\", 2040, {{10,3726},{1,2235600}}, 5, 1, {{'speed',4}}, 40}",
	[10356.0] = "{10356, \"伤害加成\", 1035, {{10,3300},{1,1980000}}, 6, 1, {{'dam',5}}, 35}",
	[30222.0] = "{30222, \"攻击比\", 3022, {{10,900},{1,630000}}, 2, 1, {{'atk_per',5}}, 22}",
	[20385.0] = "{20385, \"速度\", 2038, {{10,3402},{1,2041200}}, 5, 1, {{'speed',4}}, 38}",
	[20375.0] = "{20375, \"速度\", 2037, {{10,3258},{1,1954800}}, 5, 1, {{'speed',4}}, 37}",
	[20365.0] = "{20365, \"速度\", 2036, {{10,3114},{1,1868400}}, 5, 1, {{'speed',4}}, 36}",
	[40036.0] = "{40036, \"魔法免伤\", 4003, {{10,100},{1,60000}}, 6, 1, {{'res_s',5}}, 3}",
	[10042.0] = "{10042, \"攻击比\", 1004, {{10,84},{1,58800}}, 2, 1, {{'atk_per',5}}, 4}",
	[20404.0] = "{20404, \"暴伤\", 2040, {{10,3312},{1,1987200}}, 4, 1, {{'crit_ratio',10}}, 40}",
	[20325.0] = "{20325, \"速度\", 2032, {{10,2538},{1,1522800}}, 5, 1, {{'speed',4}}, 32}",
	[20305.0] = "{20305, \"速度\", 2030, {{10,2250},{1,1350000}}, 5, 1, {{'speed',4}}, 30}",
	[20082.0] = "{20082, \"攻击比\", 2008, {{10,180},{1,126000}}, 2, 1, {{'atk_per',5}}, 8}",
	[20275.0] = "{20275, \"速度\", 2027, {{10,1890},{1,1134000}}, 5, 1, {{'speed',4}}, 27}",
	[20265.0] = "{20265, \"速度\", 2026, {{10,1782},{1,1069200}}, 5, 1, {{'speed',4}}, 26}",
	[20255.0] = "{20255, \"速度\", 2025, {{10,1674},{1,1004400}}, 5, 1, {{'speed',4}}, 25}",
	[30156.0] = "{30156, \"物理免伤\", 3015, {{10,820},{1,492000}}, 6, 1, {{'res_p',5}}, 15}",
	[20113.0] = "{20113, \"暴击\", 2011, {{10,350},{1,210000}}, 3, 1, {{'crit_rate',5}}, 11}",
	[40191.0] = "{40191, \"气血比\", 4019, {{10,570},{1,342000}}, 1, 1, {{'hp_max_per',5}}, 19}",
	[20016.0] = "{20016, \"伤害加成\", 2001, {{10,20},{1,12000}}, 6, 1, {{'dam',5}}, 1}",
	[20235.0] = "{20235, \"速度\", 2023, {{10,1458},{1,874800}}, 5, 1, {{'speed',4}}, 23}",
	[30123.0] = "{30123, \"控制\", 3012, {{10,406},{1,243600}}, 3, 1, {{'hit_magic',5}}, 12}",
	[30313.0] = "{30313, \"控制\", 3031, {{10,1862},{1,1117200}}, 3, 1, {{'hit_magic',5}}, 31}",
	[40253.0] = "{40253, \"抗控\", 4025, {{10,1302},{1,781200}}, 3, 1, {{'dodge_magic',5}}, 25}",
	[20205.0] = "{20205, \"速度\", 2020, {{10,1134},{1,680400}}, 5, 1, {{'speed',4}}, 20}",
	[40284.0] = "{40284, \"抗暴\", 4028, {{10,1776},{1,1065600}}, 4, 1, {{'tenacity',5}}, 28}",
	[10104.0] = "{10104, \"暴伤\", 1010, {{10,336},{1,201600}}, 4, 1, {{'crit_ratio',10}}, 10}",
	[40315.0] = "{40315, \"速度\", 4031, {{10,2394},{1,1436400}}, 5, 1, {{'speed',4}}, 31}",
	[20303.0] = "{20303, \"暴击\", 2030, {{10,1750},{1,1050000}}, 3, 1, {{'crit_rate',5}}, 30}",
	[20125.0] = "{20125, \"速度\", 2012, {{10,522},{1,313200}}, 5, 1, {{'speed',4}}, 12}",
	[20206.0] = "{20206, \"伤害加成\", 2020, {{10,1260},{1,756000}}, 6, 1, {{'dam',5}}, 20}",
	[20115.0] = "{20115, \"速度\", 2011, {{10,450},{1,270000}}, 5, 1, {{'speed',4}}, 11}",
	[20105.0] = "{20105, \"速度\", 2010, {{10,378},{1,226800}}, 5, 1, {{'speed',4}}, 10}",
	[40033.0] = "{40033, \"抗控\", 4003, {{10,70},{1,42000}}, 3, 1, {{'dodge_magic',5}}, 3}",
	[10352.0] = "{10352, \"攻击比\", 1035, {{10,1980},{1,1386000}}, 2, 1, {{'atk_per',5}}, 35}",
	[30214.0] = "{30214, \"抗暴\", 3021, {{10,1104},{1,662400}}, 4, 1, {{'tenacity',5}}, 21}",
	[20065.0] = "{20065, \"速度\", 2006, {{10,198},{1,118800}}, 5, 1, {{'speed',4}}, 6}",
	[20076.0] = "{20076, \"伤害加成\", 2007, {{10,260},{1,156000}}, 6, 1, {{'dam',5}}, 7}",
	[30135.0] = "{30135, \"速度\", 3013, {{10,594},{1,356400}}, 5, 1, {{'speed',4}}, 13}",
	[20394.0] = "{20394, \"暴伤\", 2039, {{10,3152},{1,1891200}}, 4, 1, {{'crit_ratio',10}}, 39}",
	[10255.0] = "{10255, \"速度\", 1025, {{10,1674},{1,1004400}}, 5, 1, {{'speed',4}}, 25}",
	[20396.0] = "{20396, \"伤害加成\", 2039, {{10,3940},{1,2364000}}, 6, 1, {{'dam',5}}, 39}",
	[20171.0] = "{20171, \"气血比\", 2017, {{10,490},{1,294000}}, 1, 1, {{'hp_max_per',5}}, 17}",
	[20344.0] = "{20344, \"暴伤\", 2034, {{10,2512},{1,1507200}}, 4, 1, {{'crit_ratio',10}}, 34}",
	[30181.0] = "{30181, \"气血比\", 3018, {{10,530},{1,318000}}, 1, 1, {{'hp_max_per',5}}, 18}",
	[10383.0] = "{10383, \"暴击\", 1038, {{10,2646},{1,1587600}}, 3, 1, {{'crit_rate',5}}, 38}",
	[40113.0] = "{40113, \"抗控\", 4011, {{10,350},{1,210000}}, 3, 1, {{'dodge_magic',5}}, 11}",
	[20314.0] = "{20314, \"暴伤\", 2031, {{10,2128},{1,1276800}}, 4, 1, {{'crit_ratio',10}}, 31}",
	[40144.0] = "{40144, \"抗暴\", 4014, {{10,592},{1,355200}}, 4, 1, {{'tenacity',5}}, 14}",
	[30371.0] = "{30371, \"气血比\", 3037, {{10,1810},{1,1086000}}, 1, 1, {{'hp_max_per',5}}, 37}",
	[40175.0] = "{40175, \"速度\", 4017, {{10,882},{1,529200}}, 5, 1, {{'speed',4}}, 17}",
	[30075.0] = "{30075, \"速度\", 3007, {{10,234},{1,140400}}, 5, 1, {{'speed',4}}, 7}",
	[20294.0] = "{20294, \"暴伤\", 2029, {{10,1872},{1,1123200}}, 4, 1, {{'crit_ratio',10}}, 29}",
	[30115.0] = "{30115, \"速度\", 3011, {{10,450},{1,270000}}, 5, 1, {{'speed',4}}, 11}",
	[30305.0] = "{30305, \"速度\", 3030, {{10,2250},{1,1350000}}, 5, 1, {{'speed',4}}, 30}",
	[20264.0] = "{20264, \"暴伤\", 2026, {{10,1584},{1,950400}}, 4, 1, {{'crit_ratio',10}}, 26}",
	[20274.0] = "{20274, \"暴伤\", 2027, {{10,1680},{1,1008000}}, 4, 1, {{'crit_ratio',10}}, 27}",
	[30082.0] = "{30082, \"攻击比\", 3008, {{10,180},{1,126000}}, 2, 1, {{'atk_per',5}}, 8}",
	[30272.0] = "{30272, \"攻击比\", 3027, {{10,1260},{1,882000}}, 2, 1, {{'atk_per',5}}, 27}",
	[40096.0] = "{40096, \"魔法免伤\", 4009, {{10,340},{1,204000}}, 6, 1, {{'res_s',5}}, 9}",
	[20295.0] = "{20295, \"速度\", 2029, {{10,2106},{1,1263600}}, 5, 1, {{'speed',4}}, 29}",
	[20224.0] = "{20224, \"暴伤\", 2022, {{10,1200},{1,720000}}, 4, 1, {{'crit_ratio',10}}, 22}",
	[30016.0] = "{30016, \"物理免伤\", 3001, {{10,20},{1,12000}}, 6, 1, {{'res_p',5}}, 1}",
	[20214.0] = "{20214, \"暴伤\", 2021, {{10,1104},{1,662400}}, 4, 1, {{'crit_ratio',10}}, 21}",
	[40361.0] = "{40361, \"气血比\", 4036, {{10,1730},{1,1038000}}, 1, 1, {{'hp_max_per',5}}, 36}",
	[20204.0] = "{20204, \"暴伤\", 2020, {{10,1008},{1,604800}}, 4, 1, {{'crit_ratio',10}}, 20}",
	[40392.0] = "{40392, \"攻击比\", 4039, {{10,2364},{1,1654800}}, 2, 1, {{'atk_per',5}}, 39}",
	[10131.0] = "{10131, \"气血比\", 1013, {{10,330},{1,198000}}, 1, 1, {{'hp_max_per',5}}, 13}",
	[40151.0] = "{40151, \"气血比\", 4015, {{10,410},{1,246000}}, 1, 1, {{'hp_max_per',5}}, 15}",
	[20132.0] = "{20132, \"攻击比\", 2013, {{10,396},{1,277200}}, 2, 1, {{'atk_per',5}}, 13}",
	[20134.0] = "{20134, \"暴伤\", 2013, {{10,528},{1,316800}}, 4, 1, {{'crit_ratio',10}}, 13}",
	[30094.0] = "{30094, \"抗暴\", 3009, {{10,272},{1,163200}}, 4, 1, {{'tenacity',5}}, 9}",
	[30206.0] = "{30206, \"物理免伤\", 3020, {{10,1260},{1,756000}}, 6, 1, {{'res_p',5}}, 20}",
	[40035.0] = "{40035, \"速度\", 4003, {{10,90},{1,54000}}, 5, 1, {{'speed',4}}, 3}",
	[20163.0] = "{20163, \"暴击\", 2016, {{10,630},{1,378000}}, 3, 1, {{'crit_rate',5}}, 16}",
	[20084.0] = "{20084, \"暴伤\", 2008, {{10,240},{1,144000}}, 4, 1, {{'crit_ratio',10}}, 8}",
	[40066.0] = "{40066, \"魔法免伤\", 4006, {{10,220},{1,132000}}, 6, 1, {{'res_s',5}}, 6}",
	[30396.0] = "{30396, \"物理免伤\", 3039, {{10,3940},{1,2364000}}, 6, 1, {{'res_p',5}}, 39}",
	[20074.0] = "{20074, \"暴伤\", 2007, {{10,208},{1,124800}}, 4, 1, {{'crit_ratio',10}}, 7}",
	[20064.0] = "{20064, \"暴伤\", 2006, {{10,176},{1,105600}}, 4, 1, {{'crit_ratio',10}}, 6}",
	[20322.0] = "{20322, \"攻击比\", 2032, {{10,1692},{1,1184400}}, 2, 1, {{'atk_per',5}}, 32}",
	[30363.0] = "{30363, \"控制\", 3036, {{10,2422},{1,1453200}}, 3, 1, {{'hit_magic',5}}, 36}",
	[20044.0] = "{20044, \"暴伤\", 2004, {{10,112},{1,67200}}, 4, 1, {{'crit_ratio',10}}, 4}",
	[40226.0] = "{40226, \"魔法免伤\", 4022, {{10,1500},{1,900000}}, 6, 1, {{'res_s',5}}, 22}",
	[40316.0] = "{40316, \"魔法免伤\", 4031, {{10,2660},{1,1596000}}, 6, 1, {{'res_s',5}}, 31}",
	[20353.0] = "{20353, \"暴击\", 2035, {{10,2310},{1,1386000}}, 3, 1, {{'crit_rate',5}}, 35}",
	[30074.0] = "{30074, \"抗暴\", 3007, {{10,208},{1,124800}}, 4, 1, {{'tenacity',5}}, 7}",
	[20256.0] = "{20256, \"伤害加成\", 2025, {{10,1860},{1,1116000}}, 6, 1, {{'dam',5}}, 25}",
	[20383.0] = "{20383, \"暴击\", 2038, {{10,2646},{1,1587600}}, 3, 1, {{'crit_rate',5}}, 38}",
	[40252.0] = "{40252, \"攻击比\", 4025, {{10,1116},{1,781200}}, 2, 1, {{'atk_per',5}}, 25}",
	[30041.0] = "{30041, \"气血比\", 3004, {{10,70},{1,42000}}, 1, 1, {{'hp_max_per',5}}, 4}",
	[40283.0] = "{40283, \"抗控\", 4028, {{10,1554},{1,932400}}, 3, 1, {{'dodge_magic',5}}, 28}",
	[20343.0] = "{20343, \"暴击\", 2034, {{10,2198},{1,1318800}}, 3, 1, {{'crit_rate',5}}, 34}",
	[40314.0] = "{40314, \"抗暴\", 4031, {{10,2128},{1,1276800}}, 4, 1, {{'tenacity',5}}, 31}",
	[10224.0] = "{10224, \"暴伤\", 1022, {{10,1200},{1,720000}}, 4, 1, {{'crit_ratio',10}}, 22}",
	[30231.0] = "{30231, \"气血比\", 3023, {{10,810},{1,486000}}, 1, 1, {{'hp_max_per',5}}, 23}",
	[40345.0] = "{40345, \"速度\", 4034, {{10,2826},{1,1695600}}, 5, 1, {{'speed',4}}, 34}",
	[20145.0] = "{20145, \"速度\", 2014, {{10,666},{1,399600}}, 5, 1, {{'speed',4}}, 14}",
	[40376.0] = "{40376, \"魔法免伤\", 4037, {{10,3620},{1,2172000}}, 6, 1, {{'res_s',5}}, 37}",
	[20283.0] = "{20283, \"暴击\", 2028, {{10,1554},{1,932400}}, 3, 1, {{'crit_rate',5}}, 28}",
	[20263.0] = "{20263, \"暴击\", 2026, {{10,1386},{1,831600}}, 3, 1, {{'crit_rate',5}}, 26}",
	[20124.0] = "{20124, \"暴伤\", 2012, {{10,464},{1,278400}}, 4, 1, {{'crit_ratio',10}}, 12}",
	[30244.0] = "{30244, \"抗暴\", 3024, {{10,1392},{1,835200}}, 4, 1, {{'tenacity',5}}, 24}",
	[20243.0] = "{20243, \"暴击\", 2024, {{10,1218},{1,730800}}, 3, 1, {{'crit_rate',5}}, 24}",
	[20223.0] = "{20223, \"暴击\", 2022, {{10,1050},{1,630000}}, 3, 1, {{'crit_rate',5}}, 22}",
	[20155.0] = "{20155, \"速度\", 2015, {{10,738},{1,442800}}, 5, 1, {{'speed',4}}, 15}",
	[20203.0] = "{20203, \"暴击\", 2020, {{10,882},{1,529200}}, 3, 1, {{'crit_rate',5}}, 20}",
	[20183.0] = "{20183, \"暴击\", 2018, {{10,742},{1,445200}}, 3, 1, {{'crit_rate',5}}, 18}",
	[30165.0] = "{30165, \"速度\", 3016, {{10,810},{1,486000}}, 5, 1, {{'speed',4}}, 16}",
	[10375.0] = "{10375, \"速度\", 1037, {{10,3258},{1,1954800}}, 5, 1, {{'speed',4}}, 37}",
	[40081.0] = "{40081, \"气血比\", 4008, {{10,150},{1,90000}}, 1, 1, {{'hp_max_per',5}}, 8}",
	[40082.0] = "{40082, \"攻击比\", 4008, {{10,180},{1,126000}}, 2, 1, {{'atk_per',5}}, 8}",
	[40112.0] = "{40112, \"攻击比\", 4011, {{10,300},{1,210000}}, 2, 1, {{'atk_per',5}}, 11}",
	[30132.0] = "{30132, \"攻击比\", 3013, {{10,396},{1,277200}}, 2, 1, {{'atk_per',5}}, 13}",
	[40143.0] = "{40143, \"抗控\", 4014, {{10,518},{1,310800}}, 3, 1, {{'dodge_magic',5}}, 14}",
	[20245.0] = "{20245, \"速度\", 2024, {{10,1566},{1,939600}}, 5, 1, {{'speed',4}}, 24}",
	[40174.0] = "{40174, \"抗暴\", 4017, {{10,784},{1,470400}}, 4, 1, {{'tenacity',5}}, 17}",
	[20083.0] = "{20083, \"暴击\", 2008, {{10,210},{1,126000}}, 3, 1, {{'crit_rate',5}}, 8}",
	[30066.0] = "{30066, \"物理免伤\", 3006, {{10,220},{1,132000}}, 6, 1, {{'res_p',5}}, 6}",
	[40205.0] = "{40205, \"速度\", 4020, {{10,1134},{1,680400}}, 5, 1, {{'speed',4}}, 20}",
	[30133.0] = "{30133, \"控制\", 3013, {{10,462},{1,277200}}, 3, 1, {{'hit_magic',5}}, 13}",
	[40236.0] = "{40236, \"魔法免伤\", 4023, {{10,1620},{1,972000}}, 6, 1, {{'res_s',5}}, 23}",
	[30033.0] = "{30033, \"控制\", 3003, {{10,70},{1,42000}}, 3, 1, {{'hit_magic',5}}, 3}",
	[30256.0] = "{30256, \"物理免伤\", 3025, {{10,1860},{1,1116000}}, 6, 1, {{'res_p',5}}, 25}",
	[20023.0] = "{20023, \"暴击\", 2002, {{10,42},{1,25200}}, 3, 1, {{'crit_rate',5}}, 2}",
	[40332.0] = "{40332, \"攻击比\", 4033, {{10,1788},{1,1251600}}, 2, 1, {{'atk_per',5}}, 33}",
	[20182.0] = "{20182, \"攻击比\", 2018, {{10,636},{1,445200}}, 2, 1, {{'atk_per',5}}, 18}",
	[30223.0] = "{30223, \"控制\", 3022, {{10,1050},{1,630000}}, 3, 1, {{'hit_magic',5}}, 22}",
	[30166.0] = "{30166, \"物理免伤\", 3016, {{10,900},{1,540000}}, 6, 1, {{'res_p',5}}, 16}",
	[20352.0] = "{20352, \"攻击比\", 2035, {{10,1980},{1,1386000}}, 2, 1, {{'atk_per',5}}, 35}",
	[20213.0] = "{20213, \"暴击\", 2021, {{10,966},{1,579600}}, 3, 1, {{'crit_rate',5}}, 21}",
	[10123.0] = "{10123, \"暴击\", 1012, {{10,406},{1,243600}}, 3, 1, {{'crit_rate',5}}, 12}",
	[40391.0] = "{40391, \"气血比\", 4039, {{10,1970},{1,1182000}}, 1, 1, {{'hp_max_per',5}}, 39}",
	[20116.0] = "{20116, \"伤害加成\", 2011, {{10,500},{1,300000}}, 6, 1, {{'dam',5}}, 11}",
	[20054.0] = "{20054, \"暴伤\", 2005, {{10,144},{1,86400}}, 4, 1, {{'crit_ratio',10}}, 5}",
	[20312.0] = "{20312, \"攻击比\", 2031, {{10,1596},{1,1117200}}, 2, 1, {{'atk_per',5}}, 31}",
	[10026.0] = "{10026, \"伤害加成\", 1002, {{10,60},{1,36000}}, 6, 1, {{'dam',5}}, 2}",
	[20372.0] = "{20372, \"攻击比\", 2037, {{10,2172},{1,1520400}}, 2, 1, {{'atk_per',5}}, 37}",
	[20252.0] = "{20252, \"攻击比\", 2025, {{10,1116},{1,781200}}, 2, 1, {{'atk_per',5}}, 25}",
	[40034.0] = "{40034, \"抗暴\", 4003, {{10,80},{1,48000}}, 4, 1, {{'tenacity',5}}, 3}",
	[10154.0] = "{10154, \"暴伤\", 1015, {{10,656},{1,393600}}, 4, 1, {{'crit_ratio',10}}, 15}",
	[20403.0] = "{20403, \"暴击\", 2040, {{10,2898},{1,1738800}}, 3, 1, {{'crit_rate',5}}, 40}",
	[40065.0] = "{40065, \"速度\", 4006, {{10,198},{1,118800}}, 5, 1, {{'speed',4}}, 6}",
	[20212.0] = "{20212, \"攻击比\", 2021, {{10,828},{1,579600}}, 2, 1, {{'atk_per',5}}, 21}",
	[20306.0] = "{20306, \"伤害加成\", 2030, {{10,2500},{1,1500000}}, 6, 1, {{'dam',5}}, 30}",
	[30124.0] = "{30124, \"抗暴\", 3012, {{10,464},{1,278400}}, 4, 1, {{'tenacity',5}}, 12}",
	[30314.0] = "{30314, \"抗暴\", 3031, {{10,2128},{1,1276800}}, 4, 1, {{'tenacity',5}}, 31}",
	[20192.0] = "{20192, \"攻击比\", 2019, {{10,684},{1,478800}}, 2, 1, {{'atk_per',5}}, 19}",
	[10402.0] = "{10402, \"攻击比\", 1040, {{10,2484},{1,1738800}}, 2, 1, {{'atk_per',5}}, 40}",
	[30091.0] = "{30091, \"气血比\", 3009, {{10,170},{1,102000}}, 1, 1, {{'hp_max_per',5}}, 9}",
	[30281.0] = "{30281, \"气血比\", 3028, {{10,1110},{1,666000}}, 1, 1, {{'hp_max_per',5}}, 28}",
	[20015.0] = "{20015, \"速度\", 2001, {{10,18},{1,10800}}, 5, 1, {{'speed',4}}, 1}",
	[30046.0] = "{30046, \"物理免伤\", 3004, {{10,140},{1,84000}}, 6, 1, {{'res_p',5}}, 4}",
	[20152.0] = "{20152, \"攻击比\", 2015, {{10,492},{1,344400}}, 2, 1, {{'atk_per',5}}, 15}",
	[30025.0] = "{30025, \"速度\", 3002, {{10,54},{1,32400}}, 5, 1, {{'speed',4}}, 2}",
	[40251.0] = "{40251, \"气血比\", 4025, {{10,930},{1,558000}}, 1, 1, {{'hp_max_per',5}}, 25}",
	[20154.0] = "{20154, \"暴伤\", 2015, {{10,656},{1,393600}}, 4, 1, {{'crit_ratio',10}}, 15}",
	[40282.0] = "{40282, \"攻击比\", 4028, {{10,1332},{1,932400}}, 2, 1, {{'atk_per',5}}, 28}",
	[20174.0] = "{20174, \"暴伤\", 2017, {{10,784},{1,470400}}, 4, 1, {{'crit_ratio',10}}, 17}",
	[40313.0] = "{40313, \"抗控\", 4031, {{10,1862},{1,1117200}}, 3, 1, {{'dodge_magic',5}}, 31}",
	[40136.0] = "{40136, \"魔法免伤\", 4013, {{10,660},{1,396000}}, 6, 1, {{'res_s',5}}, 13}",
	[20092.0] = "{20092, \"攻击比\", 2009, {{10,204},{1,142800}}, 2, 1, {{'atk_per',5}}, 9}",
	[40344.0] = "{40344, \"抗暴\", 4034, {{10,2512},{1,1507200}}, 4, 1, {{'tenacity',5}}, 34}",
	[20285.0] = "{20285, \"速度\", 2028, {{10,1998},{1,1198800}}, 5, 1, {{'speed',4}}, 28}",
	[40375.0] = "{40375, \"速度\", 4037, {{10,3258},{1,1954800}}, 5, 1, {{'speed',4}}, 37}",
	[20072.0] = "{20072, \"攻击比\", 2007, {{10,156},{1,109200}}, 2, 1, {{'atk_per',5}}, 7}",
	[40406.0] = "{40406, \"魔法免伤\", 4040, {{10,4140},{1,2484000}}, 6, 1, {{'res_s',5}}, 40}",
	[40214.0] = "{40214, \"抗暴\", 4021, {{10,1104},{1,662400}}, 4, 1, {{'tenacity',5}}, 21}",
	[30405.0] = "{30405, \"速度\", 3040, {{10,3726},{1,2235600}}, 5, 1, {{'speed',4}}, 40}",
	[20364.0] = "{20364, \"暴伤\", 2036, {{10,2768},{1,1660800}}, 4, 1, {{'crit_ratio',10}}, 36}",
	[20401.0] = "{20401, \"气血比\", 2040, {{10,2070},{1,1242000}}, 1, 1, {{'hp_max_per',5}}, 40}",
	[20391.0] = "{20391, \"气血比\", 2039, {{10,1970},{1,1182000}}, 1, 1, {{'hp_max_per',5}}, 39}",
	[20042.0] = "{20042, \"攻击比\", 2004, {{10,84},{1,58800}}, 2, 1, {{'atk_per',5}}, 4}",
	[30372.0] = "{30372, \"攻击比\", 3037, {{10,2172},{1,1520400}}, 2, 1, {{'atk_per',5}}, 37}",
	[20381.0] = "{20381, \"气血比\", 2038, {{10,1890},{1,1134000}}, 1, 1, {{'hp_max_per',5}}, 38}",
	[20371.0] = "{20371, \"气血比\", 2037, {{10,1810},{1,1086000}}, 1, 1, {{'hp_max_per',5}}, 37}",
	[20073.0] = "{20073, \"暴击\", 2007, {{10,182},{1,109200}}, 3, 1, {{'crit_rate',5}}, 7}",
	[30116.0] = "{30116, \"物理免伤\", 3011, {{10,500},{1,300000}}, 6, 1, {{'res_p',5}}, 11}",
	[30306.0] = "{30306, \"物理免伤\", 3030, {{10,2500},{1,1500000}}, 6, 1, {{'res_p',5}}, 30}",
	[20361.0] = "{20361, \"气血比\", 2036, {{10,1730},{1,1038000}}, 1, 1, {{'hp_max_per',5}}, 36}",
	[40142.0] = "{40142, \"攻击比\", 4014, {{10,444},{1,310800}}, 2, 1, {{'atk_per',5}}, 14}",
	[30083.0] = "{30083, \"控制\", 3008, {{10,210},{1,126000}}, 3, 1, {{'hit_magic',5}}, 8}",
	[40173.0] = "{40173, \"抗控\", 4017, {{10,686},{1,411600}}, 3, 1, {{'dodge_magic',5}}, 17}",
	[20232.0] = "{20232, \"攻击比\", 2023, {{10,972},{1,680400}}, 2, 1, {{'atk_per',5}}, 23}",
	[10301.0] = "{10301, \"气血比\", 1030, {{10,1250},{1,750000}}, 1, 1, {{'hp_max_per',5}}, 30}",
	[40204.0] = "{40204, \"抗暴\", 4020, {{10,1008},{1,604800}}, 4, 1, {{'tenacity',5}}, 20}",
	[10084.0] = "{10084, \"暴伤\", 1008, {{10,240},{1,144000}}, 4, 1, {{'crit_ratio',10}}, 8}",
	[40235.0] = "{40235, \"速度\", 4023, {{10,1458},{1,874800}}, 5, 1, {{'speed',4}}, 23}",
	[20331.0] = "{20331, \"气血比\", 2033, {{10,1490},{1,894000}}, 1, 1, {{'hp_max_per',5}}, 33}",
	[40266.0] = "{40266, \"魔法免伤\", 4026, {{10,1980},{1,1188000}}, 6, 1, {{'res_s',5}}, 26}",
	[20166.0] = "{20166, \"伤害加成\", 2016, {{10,900},{1,540000}}, 6, 1, {{'dam',5}}, 16}",
	[20321.0] = "{20321, \"气血比\", 2032, {{10,1410},{1,846000}}, 1, 1, {{'hp_max_per',5}}, 32}",
	[20311.0] = "{20311, \"气血比\", 2031, {{10,1330},{1,798000}}, 1, 1, {{'hp_max_per',5}}, 31}",
	[20301.0] = "{20301, \"气血比\", 2030, {{10,1250},{1,750000}}, 1, 1, {{'hp_max_per',5}}, 30}",
	[20281.0] = "{20281, \"气血比\", 2028, {{10,1110},{1,666000}}, 1, 1, {{'hp_max_per',5}}, 28}",
	[10115.0] = "{10115, \"速度\", 1011, {{10,450},{1,270000}}, 5, 1, {{'speed',4}}, 11}",
	[20261.0] = "{20261, \"气血比\", 2026, {{10,990},{1,594000}}, 1, 1, {{'hp_max_per',5}}, 26}",
	[20251.0] = "{20251, \"气血比\", 2025, {{10,930},{1,558000}}, 1, 1, {{'hp_max_per',5}}, 25}",
	[20221.0] = "{20221, \"气血比\", 2022, {{10,750},{1,450000}}, 1, 1, {{'hp_max_per',5}}, 22}",
	[20211.0] = "{20211, \"气血比\", 2021, {{10,690},{1,414000}}, 1, 1, {{'hp_max_per',5}}, 21}",
	[30174.0] = "{30174, \"抗暴\", 3017, {{10,784},{1,470400}}, 4, 1, {{'tenacity',5}}, 17}",
	[20356.0] = "{20356, \"伤害加成\", 2035, {{10,3300},{1,1980000}}, 6, 1, {{'dam',5}}, 35}",
	[10363.0] = "{10363, \"暴击\", 1036, {{10,2422},{1,1453200}}, 3, 1, {{'crit_rate',5}}, 36}",
	[20191.0] = "{20191, \"气血比\", 2019, {{10,570},{1,342000}}, 1, 1, {{'hp_max_per',5}}, 19}",
	[20034.0] = "{20034, \"暴伤\", 2003, {{10,80},{1,48000}}, 4, 1, {{'crit_ratio',10}}, 3}",
	[30141.0] = "{30141, \"气血比\", 3014, {{10,370},{1,222000}}, 1, 1, {{'hp_max_per',5}}, 14}",
	[30331.0] = "{30331, \"气血比\", 3033, {{10,1490},{1,894000}}, 1, 1, {{'hp_max_per',5}}, 33}",
	[20354.0] = "{20354, \"暴伤\", 2035, {{10,2640},{1,1584000}}, 4, 1, {{'crit_ratio',10}}, 35}",
	[40064.0] = "{40064, \"抗暴\", 4006, {{10,176},{1,105600}}, 4, 1, {{'tenacity',5}}, 6}",
	[20386.0] = "{20386, \"伤害加成\", 2038, {{10,3780},{1,2268000}}, 6, 1, {{'dam',5}}, 38}",
	[40095.0] = "{40095, \"速度\", 4009, {{10,306},{1,183600}}, 5, 1, {{'speed',4}}, 9}",
	[20151.0] = "{20151, \"气血比\", 2015, {{10,410},{1,246000}}, 1, 1, {{'hp_max_per',5}}, 15}",
	[40126.0] = "{40126, \"魔法免伤\", 4012, {{10,580},{1,348000}}, 6, 1, {{'res_s',5}}, 12}",
	[10394.0] = "{10394, \"暴伤\", 1039, {{10,3152},{1,1891200}}, 4, 1, {{'crit_ratio',10}}, 39}",
	[30042.0] = "{30042, \"攻击比\", 3004, {{10,84},{1,58800}}, 2, 1, {{'atk_per',5}}, 4}",
	[30265.0] = "{30265, \"速度\", 3026, {{10,1782},{1,1069200}}, 5, 1, {{'speed',4}}, 26}",
	[20131.0] = "{20131, \"气血比\", 2013, {{10,330},{1,198000}}, 1, 1, {{'hp_max_per',5}}, 13}",
	[30051.0] = "{30051, \"气血比\", 3005, {{10,90},{1,54000}}, 1, 1, {{'hp_max_per',5}}, 5}",
	[20091.0] = "{20091, \"气血比\", 2009, {{10,170},{1,102000}}, 1, 1, {{'hp_max_per',5}}, 9}",
	[30232.0] = "{30232, \"攻击比\", 3023, {{10,972},{1,680400}}, 2, 1, {{'atk_per',5}}, 23}",
	[20081.0] = "{20081, \"气血比\", 2008, {{10,150},{1,90000}}, 1, 1, {{'hp_max_per',5}}, 8}",
	[20071.0] = "{20071, \"气血比\", 2007, {{10,130},{1,78000}}, 1, 1, {{'hp_max_per',5}}, 7}",
	[20031.0] = "{20031, \"气血比\", 2003, {{10,50},{1,30000}}, 1, 1, {{'hp_max_per',5}}, 3}",
	[40281.0] = "{40281, \"气血比\", 4028, {{10,1110},{1,666000}}, 1, 1, {{'hp_max_per',5}}, 28}",
	[20021.0] = "{20021, \"气血比\", 2002, {{10,30},{1,18000}}, 1, 1, {{'hp_max_per',5}}, 2}",
	[40312.0] = "{40312, \"攻击比\", 4031, {{10,1596},{1,1117200}}, 2, 1, {{'atk_per',5}}, 31}",
	[10111.0] = "{10111, \"气血比\", 1011, {{10,250},{1,150000}}, 1, 1, {{'hp_max_per',5}}, 11}",
	[10406.0] = "{10406, \"伤害加成\", 1040, {{10,4140},{1,2484000}}, 6, 1, {{'dam',5}}, 40}",
	[40343.0] = "{40343, \"抗控\", 4034, {{10,2198},{1,1318800}}, 3, 1, {{'dodge_magic',5}}, 34}",
	[40011.0] = "{40011, \"气血比\", 4001, {{10,10},{1,6000}}, 1, 1, {{'hp_max_per',5}}, 1}",
	[40374.0] = "{40374, \"抗暴\", 4037, {{10,2896},{1,1737600}}, 4, 1, {{'tenacity',5}}, 37}",
	[10014.0] = "{10014, \"暴伤\", 1001, {{10,16},{1,9600}}, 4, 1, {{'crit_ratio',10}}, 1}",
	[40405.0] = "{40405, \"速度\", 4040, {{10,3726},{1,2235600}}, 5, 1, {{'speed',4}}, 40}",
	[20123.0] = "{20123, \"暴击\", 2012, {{10,406},{1,243600}}, 3, 1, {{'crit_rate',5}}, 12}",
	[10346.0] = "{10346, \"伤害加成\", 1034, {{10,3140},{1,1884000}}, 6, 1, {{'dam',5}}, 34}",
	[20026.0] = "{20026, \"伤害加成\", 2002, {{10,60},{1,36000}}, 6, 1, {{'dam',5}}, 2}",
	[10336.0] = "{10336, \"伤害加成\", 1033, {{10,2980},{1,1788000}}, 6, 1, {{'dam',5}}, 33}",
	[30356.0] = "{30356, \"物理免伤\", 3035, {{10,3300},{1,1980000}}, 6, 1, {{'res_p',5}}, 35}",
	[30323.0] = "{30323, \"控制\", 3032, {{10,1974},{1,1184400}}, 3, 1, {{'hit_magic',5}}, 32}",
	[20282.0] = "{20282, \"攻击比\", 2028, {{10,1332},{1,932400}}, 2, 1, {{'atk_per',5}}, 28}",
	[10045.0] = "{10045, \"速度\", 1004, {{10,126},{1,75600}}, 5, 1, {{'speed',4}}, 4}",
	[10306.0] = "{10306, \"伤害加成\", 1030, {{10,2500},{1,1500000}}, 6, 1, {{'dam',5}}, 30}",
	[10296.0] = "{10296, \"伤害加成\", 1029, {{10,2340},{1,1404000}}, 6, 1, {{'dam',5}}, 29}",
	[10286.0] = "{10286, \"伤害加成\", 1028, {{10,2220},{1,1332000}}, 6, 1, {{'dam',5}}, 28}",
	[20313.0] = "{20313, \"暴击\", 2031, {{10,1862},{1,1117200}}, 3, 1, {{'crit_rate',5}}, 31}",
	[10276.0] = "{10276, \"伤害加成\", 1027, {{10,2100},{1,1260000}}, 6, 1, {{'dam',5}}, 27}",
	[20216.0] = "{20216, \"伤害加成\", 2021, {{10,1380},{1,828000}}, 6, 1, {{'dam',5}}, 21}",
	[10266.0] = "{10266, \"伤害加成\", 1026, {{10,1980},{1,1188000}}, 6, 1, {{'dam',5}}, 26}",
	[40172.0] = "{40172, \"攻击比\", 4017, {{10,588},{1,411600}}, 2, 1, {{'atk_per',5}}, 17}",
	[10076.0] = "{10076, \"伤害加成\", 1007, {{10,260},{1,156000}}, 6, 1, {{'dam',5}}, 7}",
	[10236.0] = "{10236, \"伤害加成\", 1023, {{10,1620},{1,972000}}, 6, 1, {{'dam',5}}, 23}",
	[40203.0] = "{40203, \"抗控\", 4020, {{10,882},{1,529200}}, 3, 1, {{'dodge_magic',5}}, 20}",
	[10226.0] = "{10226, \"伤害加成\", 1022, {{10,1500},{1,900000}}, 6, 1, {{'dam',5}}, 22}",
	[40234.0] = "{40234, \"抗暴\", 4023, {{10,1296},{1,777600}}, 4, 1, {{'tenacity',5}}, 23}",
	[10216.0] = "{10216, \"伤害加成\", 1021, {{10,1380},{1,828000}}, 6, 1, {{'dam',5}}, 21}",
	[40265.0] = "{40265, \"速度\", 4026, {{10,1782},{1,1069200}}, 5, 1, {{'speed',4}}, 26}",
	[10206.0] = "{10206, \"伤害加成\", 1020, {{10,1260},{1,756000}}, 6, 1, {{'dam',5}}, 20}",
	[40296.0] = "{40296, \"魔法免伤\", 4029, {{10,2340},{1,1404000}}, 6, 1, {{'res_s',5}}, 29}",
	[20181.0] = "{20181, \"气血比\", 2018, {{10,530},{1,318000}}, 1, 1, {{'hp_max_per',5}}, 18}",
	[10324.0] = "{10324, \"暴伤\", 1032, {{10,2256},{1,1353600}}, 4, 1, {{'crit_ratio',10}}, 32}",
	[30191.0] = "{30191, \"气血比\", 3019, {{10,570},{1,342000}}, 1, 1, {{'hp_max_per',5}}, 19}",
	[10186.0] = "{10186, \"伤害加成\", 1018, {{10,1060},{1,636000}}, 6, 1, {{'dam',5}}, 18}",
	[10235.0] = "{10235, \"速度\", 1023, {{10,1458},{1,874800}}, 5, 1, {{'speed',4}}, 23}",
	[10156.0] = "{10156, \"伤害加成\", 1015, {{10,820},{1,492000}}, 6, 1, {{'dam',5}}, 15}",
	[10146.0] = "{10146, \"伤害加成\", 1014, {{10,740},{1,444000}}, 6, 1, {{'dam',5}}, 14}",
	[30381.0] = "{30381, \"气血比\", 3038, {{10,1890},{1,1134000}}, 1, 1, {{'hp_max_per',5}}, 38}",
	[10355.0] = "{10355, \"速度\", 1035, {{10,2970},{1,1782000}}, 5, 1, {{'speed',4}}, 35}",
	[30264.0] = "{30264, \"抗暴\", 3026, {{10,1584},{1,950400}}, 4, 1, {{'tenacity',5}}, 26}",
	[10106.0] = "{10106, \"伤害加成\", 1010, {{10,420},{1,252000}}, 6, 1, {{'dam',5}}, 10}",
	[30125.0] = "{30125, \"速度\", 3012, {{10,522},{1,313200}}, 5, 1, {{'speed',4}}, 12}",
	[30315.0] = "{30315, \"速度\", 3031, {{10,2394},{1,1436400}}, 5, 1, {{'speed',4}}, 31}",
	[40032.0] = "{40032, \"攻击比\", 4003, {{10,60},{1,42000}}, 2, 1, {{'atk_per',5}}, 3}",
	[10041.0] = "{10041, \"气血比\", 1004, {{10,70},{1,42000}}, 1, 1, {{'hp_max_per',5}}, 4}",
	[40063.0] = "{40063, \"抗控\", 4006, {{10,154},{1,92400}}, 3, 1, {{'dodge_magic',5}}, 6}",
	[30282.0] = "{30282, \"攻击比\", 3028, {{10,1332},{1,932400}}, 2, 1, {{'atk_per',5}}, 28}",
	[10086.0] = "{10086, \"伤害加成\", 1008, {{10,300},{1,180000}}, 6, 1, {{'dam',5}}, 8}",
	[40094.0] = "{40094, \"抗暴\", 4009, {{10,272},{1,163200}}, 4, 1, {{'tenacity',5}}, 9}",
	[10386.0] = "{10386, \"伤害加成\", 1038, {{10,3780},{1,2268000}}, 6, 1, {{'dam',5}}, 38}",
	[40125.0] = "{40125, \"速度\", 4012, {{10,522},{1,313200}}, 5, 1, {{'speed',4}}, 12}",
	[10256.0] = "{10256, \"伤害加成\", 1025, {{10,1860},{1,1116000}}, 6, 1, {{'dam',5}}, 25}",
	[40156.0] = "{40156, \"魔法免伤\", 4015, {{10,820},{1,492000}}, 6, 1, {{'res_s',5}}, 15}",
	[10072.0] = "{10072, \"攻击比\", 1007, {{10,156},{1,109200}}, 2, 1, {{'atk_per',5}}, 7}",
	[20272.0] = "{20272, \"攻击比\", 2027, {{10,1260},{1,882000}}, 2, 1, {{'atk_per',5}}, 27}",
	[30216.0] = "{30216, \"物理免伤\", 3021, {{10,1380},{1,828000}}, 6, 1, {{'res_p',5}}, 21}",
	[30346.0] = "{30346, \"物理免伤\", 3034, {{10,3140},{1,1884000}}, 6, 1, {{'res_p',5}}, 34}",
	[20142.0] = "{20142, \"攻击比\", 2014, {{10,444},{1,310800}}, 2, 1, {{'atk_per',5}}, 14}",
	[20094.0] = "{20094, \"暴伤\", 2009, {{10,272},{1,163200}}, 4, 1, {{'crit_ratio',10}}, 9}",
	[10136.0] = "{10136, \"伤害加成\", 1013, {{10,660},{1,396000}}, 6, 1, {{'dam',5}}, 13}",
	[30195.0] = "{30195, \"速度\", 3019, {{10,1026},{1,615600}}, 5, 1, {{'speed',4}}, 19}",
	[20056.0] = "{20056, \"伤害加成\", 2005, {{10,180},{1,108000}}, 6, 1, {{'dam',5}}, 5}",
	[20173.0] = "{20173, \"暴击\", 2017, {{10,686},{1,411600}}, 3, 1, {{'crit_rate',5}}, 17}",
	[40311.0] = "{40311, \"气血比\", 4031, {{10,1330},{1,798000}}, 1, 1, {{'hp_max_per',5}}, 31}",
	[30406.0] = "{30406, \"物理免伤\", 3040, {{10,4140},{1,2484000}}, 6, 1, {{'res_p',5}}, 40}",
	[10315.0] = "{10315, \"速度\", 1031, {{10,2394},{1,1436400}}, 5, 1, {{'speed',4}}, 31}",
	[40342.0] = "{40342, \"攻击比\", 4034, {{10,1884},{1,1318800}}, 2, 1, {{'atk_per',5}}, 34}",
	[10305.0] = "{10305, \"速度\", 1030, {{10,2250},{1,1350000}}, 5, 1, {{'speed',4}}, 30}",
	[40373.0] = "{40373, \"抗控\", 4037, {{10,2534},{1,1520400}}, 3, 1, {{'dodge_magic',5}}, 37}",
	[30373.0] = "{30373, \"控制\", 3037, {{10,2534},{1,1520400}}, 3, 1, {{'hit_magic',5}}, 37}",
	[40404.0] = "{40404, \"抗暴\", 4040, {{10,3312},{1,1987200}}, 4, 1, {{'tenacity',5}}, 40}",
	[10134.0] = "{10134, \"暴伤\", 1013, {{10,528},{1,316800}}, 4, 1, {{'crit_ratio',10}}, 13}",
	[20374.0] = "{20374, \"暴伤\", 2037, {{10,2896},{1,1737600}}, 4, 1, {{'crit_ratio',10}}, 37}",
	[20363.0] = "{20363, \"暴击\", 2036, {{10,2422},{1,1453200}}, 3, 1, {{'crit_rate',5}}, 36}",
	[10245.0] = "{10245, \"速度\", 1024, {{10,1566},{1,939600}}, 5, 1, {{'speed',4}}, 24}",
	[40016.0] = "{40016, \"魔法免伤\", 4001, {{10,20},{1,12000}}, 6, 1, {{'res_s',5}}, 1}",
	[20041.0] = "{20041, \"气血比\", 2004, {{10,70},{1,42000}}, 1, 1, {{'hp_max_per',5}}, 4}",
	[30084.0] = "{30084, \"抗暴\", 3008, {{10,240},{1,144000}}, 4, 1, {{'tenacity',5}}, 8}",
	[30274.0] = "{30274, \"抗暴\", 3027, {{10,1680},{1,1008000}}, 4, 1, {{'tenacity',5}}, 27}",
	[10166.0] = "{10166, \"伤害加成\", 1016, {{10,900},{1,540000}}, 6, 1, {{'dam',5}}, 16}",
	[10165.0] = "{10165, \"速度\", 1016, {{10,810},{1,486000}}, 5, 1, {{'speed',4}}, 16}",
	[10382.0] = "{10382, \"攻击比\", 1038, {{10,2268},{1,1587600}}, 2, 1, {{'atk_per',5}}, 38}",
	[10195.0] = "{10195, \"速度\", 1019, {{10,1026},{1,615600}}, 5, 1, {{'speed',4}}, 19}",
	[30241.0] = "{30241, \"气血比\", 3024, {{10,870},{1,522000}}, 1, 1, {{'hp_max_per',5}}, 24}",
	[10285.0] = "{10285, \"速度\", 1028, {{10,1998},{1,1198800}}, 5, 1, {{'speed',4}}, 28}",
	[10185.0] = "{10185, \"速度\", 1018, {{10,954},{1,572400}}, 5, 1, {{'speed',4}}, 18}",
	[40171.0] = "{40171, \"气血比\", 4017, {{10,490},{1,294000}}, 1, 1, {{'hp_max_per',5}}, 17}",
	[20231.0] = "{20231, \"气血比\", 2023, {{10,810},{1,486000}}, 1, 1, {{'hp_max_per',5}}, 23}",
	[40056.0] = "{40056, \"魔法免伤\", 4005, {{10,180},{1,108000}}, 6, 1, {{'res_s',5}}, 5}",
	[40202.0] = "{40202, \"攻击比\", 4020, {{10,756},{1,529200}}, 2, 1, {{'atk_per',5}}, 20}",
	[40106.0] = "{40106, \"魔法免伤\", 4010, {{10,420},{1,252000}}, 6, 1, {{'res_s',5}}, 10}",
	[40233.0] = "{40233, \"抗控\", 4023, {{10,1134},{1,680400}}, 3, 1, {{'dodge_magic',5}}, 23}",
	[10135.0] = "{10135, \"速度\", 1013, {{10,594},{1,356400}}, 5, 1, {{'speed',4}}, 13}",
	[40264.0] = "{40264, \"抗暴\", 4026, {{10,1584},{1,950400}}, 4, 1, {{'tenacity',5}}, 26}",
	[20165.0] = "{20165, \"速度\", 2016, {{10,810},{1,486000}}, 5, 1, {{'speed',4}}, 16}",
	[40295.0] = "{40295, \"速度\", 4029, {{10,2106},{1,1263600}}, 5, 1, {{'speed',4}}, 29}",
	[30175.0] = "{30175, \"速度\", 3017, {{10,882},{1,529200}}, 5, 1, {{'speed',4}}, 17}",
	[20271.0] = "{20271, \"气血比\", 2027, {{10,1050},{1,630000}}, 1, 1, {{'hp_max_per',5}}, 27}",
	[40326.0] = "{40326, \"魔法免伤\", 4032, {{10,2820},{1,1692000}}, 6, 1, {{'res_s',5}}, 32}",
	[30345.0] = "{30345, \"速度\", 3034, {{10,2826},{1,1695600}}, 5, 1, {{'speed',4}}, 34}",
	[20324.0] = "{20324, \"暴伤\", 2032, {{10,2256},{1,1353600}}, 4, 1, {{'crit_ratio',10}}, 32}",
	[30365.0] = "{30365, \"速度\", 3036, {{10,3114},{1,1868400}}, 5, 1, {{'speed',4}}, 36}",
	[30332.0] = "{30332, \"攻击比\", 3033, {{10,1788},{1,1251600}}, 2, 1, {{'atk_per',5}}, 33}",
	[10075.0] = "{10075, \"速度\", 1007, {{10,234},{1,140400}}, 5, 1, {{'speed',4}}, 7}",
	[10065.0] = "{10065, \"速度\", 1006, {{10,198},{1,118800}}, 5, 1, {{'speed',4}}, 6}",
	[20355.0] = "{20355, \"速度\", 2035, {{10,2970},{1,1782000}}, 5, 1, {{'speed',4}}, 35}",
	[30076.0] = "{30076, \"物理免伤\", 3007, {{10,260},{1,156000}}, 6, 1, {{'res_p',5}}, 7}",
	[10055.0] = "{10055, \"速度\", 1005, {{10,162},{1,97200}}, 5, 1, {{'speed',4}}, 5}",
	[20033.0] = "{20033, \"暴击\", 2003, {{10,70},{1,42000}}, 3, 1, {{'crit_rate',5}}, 3}",
	[40031.0] = "{40031, \"气血比\", 4003, {{10,50},{1,30000}}, 1, 1, {{'hp_max_per',5}}, 3}",
	[30043.0] = "{30043, \"控制\", 3004, {{10,98},{1,58800}}, 3, 1, {{'hit_magic',5}}, 4}",
	[40062.0] = "{40062, \"攻击比\", 4006, {{10,132},{1,92400}}, 2, 1, {{'atk_per',5}}, 6}",
	[10161.0] = "{10161, \"气血比\", 1016, {{10,450},{1,270000}}, 1, 1, {{'hp_max_per',5}}, 16}",
	[10015.0] = "{10015, \"速度\", 1001, {{10,18},{1,10800}}, 5, 1, {{'speed',4}}, 1}",
	[40093.0] = "{40093, \"抗控\", 4009, {{10,238},{1,142800}}, 3, 1, {{'dodge_magic',5}}, 9}",
	[30233.0] = "{30233, \"控制\", 3023, {{10,1134},{1,680400}}, 3, 1, {{'hit_magic',5}}, 23}",
	[40124.0] = "{40124, \"抗暴\", 4012, {{10,464},{1,278400}}, 4, 1, {{'tenacity',5}}, 12}",
	[10064.0] = "{10064, \"暴伤\", 1006, {{10,176},{1,105600}}, 4, 1, {{'crit_ratio',10}}, 6}",
	[40155.0] = "{40155, \"速度\", 4015, {{10,738},{1,442800}}, 5, 1, {{'speed',4}}, 15}",
	[20141.0] = "{20141, \"气血比\", 2014, {{10,370},{1,222000}}, 1, 1, {{'hp_max_per',5}}, 14}",
	[40186.0] = "{40186, \"魔法免伤\", 4018, {{10,1060},{1,636000}}, 6, 1, {{'res_s',5}}, 18}",
	[20126.0] = "{20126, \"伤害加成\", 2012, {{10,580},{1,348000}}, 6, 1, {{'dam',5}}, 12}",
	[30316.0] = "{30316, \"物理免伤\", 3031, {{10,2660},{1,1596000}}, 6, 1, {{'res_p',5}}, 31}",
	[10344.0] = "{10344, \"暴伤\", 1034, {{10,2512},{1,1507200}}, 4, 1, {{'crit_ratio',10}}, 34}",
	[10196.0] = "{10196, \"伤害加成\", 1019, {{10,1140},{1,684000}}, 6, 1, {{'dam',5}}, 19}",
	[20382.0] = "{20382, \"攻击比\", 2038, {{10,2268},{1,1587600}}, 2, 1, {{'atk_per',5}}, 38}",
	[10095.0] = "{10095, \"速度\", 1009, {{10,306},{1,183600}}, 5, 1, {{'speed',4}}, 9}",
	[10312.0] = "{10312, \"攻击比\", 1031, {{10,1596},{1,1117200}}, 2, 1, {{'atk_per',5}}, 31}",
	[10294.0] = "{10294, \"暴伤\", 1029, {{10,1872},{1,1123200}}, 4, 1, {{'crit_ratio',10}}, 29}",
	[10284.0] = "{10284, \"暴伤\", 1028, {{10,1776},{1,1065600}}, 4, 1, {{'crit_ratio',10}}, 28}",
	[10223.0] = "{10223, \"暴击\", 1022, {{10,1050},{1,630000}}, 3, 1, {{'crit_rate',5}}, 22}",
	[10264.0] = "{10264, \"暴伤\", 1026, {{10,1584},{1,950400}}, 4, 1, {{'crit_ratio',10}}, 26}",
	[20316.0] = "{20316, \"伤害加成\", 2031, {{10,2660},{1,1596000}}, 6, 1, {{'dam',5}}, 31}",
	[30134.0] = "{30134, \"抗暴\", 3013, {{10,528},{1,316800}}, 4, 1, {{'tenacity',5}}, 13}",
	[30324.0] = "{30324, \"抗暴\", 3032, {{10,2256},{1,1353600}}, 4, 1, {{'tenacity',5}}, 32}",
	[10126.0] = "{10126, \"伤害加成\", 1012, {{10,580},{1,348000}}, 6, 1, {{'dam',5}}, 12}",
	[40403.0] = "{40403, \"抗控\", 4040, {{10,2898},{1,1738800}}, 3, 1, {{'dodge_magic',5}}, 40}",
	[30101.0] = "{30101, \"气血比\", 3010, {{10,210},{1,126000}}, 1, 1, {{'hp_max_per',5}}, 10}",
	[30291.0] = "{30291, \"气血比\", 3029, {{10,1170},{1,702000}}, 1, 1, {{'hp_max_per',5}}, 29}",
	[20025.0] = "{20025, \"速度\", 2002, {{10,54},{1,32400}}, 5, 1, {{'speed',4}}, 2}",
	[10246.0] = "{10246, \"伤害加成\", 1024, {{10,1740},{1,1044000}}, 6, 1, {{'dam',5}}, 24}",
	[40015.0] = "{40015, \"速度\", 4001, {{10,18},{1,10800}}, 5, 1, {{'speed',4}}, 1}",
	[30035.0] = "{30035, \"速度\", 3003, {{10,90},{1,54000}}, 5, 1, {{'speed',4}}, 3}",
	[40046.0] = "{40046, \"魔法免伤\", 4004, {{10,140},{1,84000}}, 6, 1, {{'res_s',5}}, 4}",
	[10254.0] = "{10254, \"暴伤\", 1025, {{10,1488},{1,892800}}, 4, 1, {{'crit_ratio',10}}, 25}",
	[10374.0] = "{10374, \"暴伤\", 1037, {{10,2896},{1,1737600}}, 4, 1, {{'crit_ratio',10}}, 37}",
	[20184.0] = "{20184, \"暴伤\", 2018, {{10,848},{1,508800}}, 4, 1, {{'crit_ratio',10}}, 18}",
	[30225.0] = "{30225, \"速度\", 3022, {{10,1350},{1,810000}}, 5, 1, {{'speed',4}}, 22}",
	[30034.0] = "{30034, \"抗暴\", 3003, {{10,80},{1,48000}}, 4, 1, {{'tenacity',5}}, 3}",
	[10234.0] = "{10234, \"暴伤\", 1023, {{10,1296},{1,777600}}, 4, 1, {{'crit_ratio',10}}, 23}",
	[20215.0] = "{20215, \"速度\", 2021, {{10,1242},{1,745200}}, 5, 1, {{'speed',4}}, 21}",
	[20323.0] = "{20323, \"暴击\", 2032, {{10,1974},{1,1184400}}, 3, 1, {{'crit_rate',5}}, 32}",
	[10405.0] = "{10405, \"速度\", 1040, {{10,3726},{1,2235600}}, 5, 1, {{'speed',4}}, 40}",
	[10204.0] = "{10204, \"暴伤\", 1020, {{10,1008},{1,604800}}, 4, 1, {{'crit_ratio',10}}, 20}",
	[10194.0] = "{10194, \"暴伤\", 1019, {{10,912},{1,547200}}, 4, 1, {{'crit_ratio',10}}, 19}",
	[40201.0] = "{40201, \"气血比\", 4020, {{10,630},{1,378000}}, 1, 1, {{'hp_max_per',5}}, 20}",
	[30192.0] = "{30192, \"攻击比\", 3019, {{10,684},{1,478800}}, 2, 1, {{'atk_per',5}}, 19}",
	[40232.0] = "{40232, \"攻击比\", 4023, {{10,972},{1,680400}}, 2, 1, {{'atk_per',5}}, 23}",
	[10091.0] = "{10091, \"气血比\", 1009, {{10,170},{1,102000}}, 1, 1, {{'hp_max_per',5}}, 9}",
	[40263.0] = "{40263, \"抗控\", 4026, {{10,1386},{1,831600}}, 3, 1, {{'dodge_magic',5}}, 26}",
	[20052.0] = "{20052, \"攻击比\", 2005, {{10,108},{1,75600}}, 2, 1, {{'atk_per',5}}, 5}",
	[30382.0] = "{30382, \"攻击比\", 3038, {{10,2268},{1,1587600}}, 2, 1, {{'atk_per',5}}, 38}",
	[10164.0] = "{10164, \"暴伤\", 1016, {{10,720},{1,432000}}, 4, 1, {{'crit_ratio',10}}, 16}",
	[30182.0] = "{30182, \"攻击比\", 3018, {{10,636},{1,445200}}, 2, 1, {{'atk_per',5}}, 18}",
	[40325.0] = "{40325, \"速度\", 4032, {{10,2538},{1,1522800}}, 5, 1, {{'speed',4}}, 32}",
	[30126.0] = "{30126, \"物理免伤\", 3012, {{10,580},{1,348000}}, 6, 1, {{'res_p',5}}, 12}",
	[40356.0] = "{40356, \"魔法免伤\", 4035, {{10,3300},{1,1980000}}, 6, 1, {{'res_s',5}}, 35}",
	[10122.0] = "{10122, \"攻击比\", 1012, {{10,348},{1,243600}}, 2, 1, {{'atk_per',5}}, 12}",
	[30273.0] = "{30273, \"控制\", 3027, {{10,1470},{1,882000}}, 3, 1, {{'hit_magic',5}}, 27}",
	[30093.0] = "{30093, \"控制\", 3009, {{10,238},{1,142800}}, 3, 1, {{'hit_magic',5}}, 9}",
	[30283.0] = "{30283, \"控制\", 3028, {{10,1554},{1,932400}}, 3, 1, {{'hit_magic',5}}, 28}",
	[20242.0] = "{20242, \"攻击比\", 2024, {{10,1044},{1,730800}}, 2, 1, {{'atk_per',5}}, 24}",
	[10025.0] = "{10025, \"速度\", 1002, {{10,54},{1,32400}}, 5, 1, {{'speed',4}}, 2}",
	[40071.0] = "{40071, \"气血比\", 4007, {{10,130},{1,78000}}, 1, 1, {{'hp_max_per',5}}, 7}",
	[20341.0] = "{20341, \"气血比\", 2034, {{10,1570},{1,942000}}, 1, 1, {{'hp_max_per',5}}, 34}",
	[20273.0] = "{20273, \"暴击\", 2027, {{10,1470},{1,882000}}, 3, 1, {{'crit_rate',5}}, 27}",
	[10153.0] = "{10153, \"暴击\", 1015, {{10,574},{1,344400}}, 3, 1, {{'crit_rate',5}}, 15}",
	[40061.0] = "{40061, \"气血比\", 4006, {{10,110},{1,66000}}, 1, 1, {{'hp_max_per',5}}, 6}",
	[20176.0] = "{20176, \"伤害加成\", 2017, {{10,980},{1,588000}}, 6, 1, {{'dam',5}}, 17}",
	[40402.0] = "{40402, \"攻击比\", 4040, {{10,2484},{1,1738800}}, 2, 1, {{'atk_per',5}}, 40}",
	[40092.0] = "{40092, \"攻击比\", 4009, {{10,204},{1,142800}}, 2, 1, {{'atk_per',5}}, 9}",
	[10056.0] = "{10056, \"伤害加成\", 1005, {{10,180},{1,108000}}, 6, 1, {{'dam',5}}, 5}",
	[40123.0] = "{40123, \"抗控\", 4012, {{10,406},{1,243600}}, 3, 1, {{'dodge_magic',5}}, 12}",
	[10034.0] = "{10034, \"暴伤\", 1003, {{10,80},{1,48000}}, 4, 1, {{'crit_ratio',10}}, 3}",
	[40154.0] = "{40154, \"抗暴\", 4015, {{10,656},{1,393600}}, 4, 1, {{'tenacity',5}}, 15}",
	[10184.0] = "{10184, \"暴伤\", 1018, {{10,848},{1,508800}}, 4, 1, {{'crit_ratio',10}}, 18}",
	[40185.0] = "{40185, \"速度\", 4018, {{10,954},{1,572400}}, 5, 1, {{'speed',4}}, 18}",
	[10024.0] = "{10024, \"暴伤\", 1002, {{10,48},{1,28800}}, 4, 1, {{'crit_ratio',10}}, 2}",
	[30184.0] = "{30184, \"抗暴\", 3018, {{10,848},{1,508800}}, 4, 1, {{'tenacity',5}}, 18}",
	[20366.0] = "{20366, \"伤害加成\", 2036, {{10,3460},{1,2076000}}, 6, 1, {{'dam',5}}, 36}",
	[20395.0] = "{20395, \"速度\", 2039, {{10,3546},{1,2127600}}, 5, 1, {{'speed',4}}, 39}",
	[10304.0] = "{10304, \"暴伤\", 1030, {{10,2000},{1,1200000}}, 4, 1, {{'crit_ratio',10}}, 30}",
	[30151.0] = "{30151, \"气血比\", 3015, {{10,410},{1,246000}}, 1, 1, {{'hp_max_per',5}}, 15}",
	[30374.0] = "{30374, \"抗暴\", 3037, {{10,2896},{1,1737600}}, 4, 1, {{'tenacity',5}}, 37}",
	[10215.0] = "{10215, \"速度\", 1021, {{10,1242},{1,745200}}, 5, 1, {{'speed',4}}, 21}",
	[10403.0] = "{10403, \"暴击\", 1040, {{10,2898},{1,1738800}}, 3, 1, {{'crit_rate',5}}, 40}",
	[20075.0] = "{20075, \"速度\", 2007, {{10,234},{1,140400}}, 5, 1, {{'speed',4}}, 7}",
	[30341.0] = "{30341, \"气血比\", 3034, {{10,1570},{1,942000}}, 1, 1, {{'hp_max_per',5}}, 34}",
	[10393.0] = "{10393, \"暴击\", 1039, {{10,2758},{1,1654800}}, 3, 1, {{'crit_rate',5}}, 39}",
	[10335.0] = "{10335, \"速度\", 1033, {{10,2682},{1,1609200}}, 5, 1, {{'speed',4}}, 33}",
	[40371.0] = "{40371, \"气血比\", 4037, {{10,1810},{1,1086000}}, 1, 1, {{'hp_max_per',5}}, 37}",
	[30085.0] = "{30085, \"速度\", 3008, {{10,270},{1,162000}}, 5, 1, {{'speed',4}}, 8}",
	[30052.0] = "{30052, \"攻击比\", 3005, {{10,108},{1,75600}}, 2, 1, {{'atk_per',5}}, 5}",
	[20234.0] = "{20234, \"暴伤\", 2023, {{10,1296},{1,777600}}, 4, 1, {{'crit_ratio',10}}, 23}",
	[10021.0] = "{10021, \"气血比\", 1002, {{10,30},{1,18000}}, 1, 1, {{'hp_max_per',5}}, 2}",
	[10373.0] = "{10373, \"暴击\", 1037, {{10,2534},{1,1520400}}, 3, 1, {{'crit_rate',5}}, 37}",
	[10366.0] = "{10366, \"伤害加成\", 1036, {{10,3460},{1,2076000}}, 6, 1, {{'dam',5}}, 36}",
	[30242.0] = "{30242, \"攻击比\", 3024, {{10,1044},{1,730800}}, 2, 1, {{'atk_per',5}}, 24}",
	[20201.0] = "{20201, \"气血比\", 2020, {{10,630},{1,378000}}, 1, 1, {{'hp_max_per',5}}, 20}",
	[40045.0] = "{40045, \"速度\", 4004, {{10,126},{1,75600}}, 5, 1, {{'speed',4}}, 4}",
	[10343.0] = "{10343, \"暴击\", 1034, {{10,2198},{1,1318800}}, 3, 1, {{'crit_rate',5}}, 34}",
	[10333.0] = "{10333, \"暴击\", 1033, {{10,2086},{1,1251600}}, 3, 1, {{'crit_rate',5}}, 33}",
	[40076.0] = "{40076, \"魔法免伤\", 4007, {{10,260},{1,156000}}, 6, 1, {{'res_s',5}}, 7}",
	[10052.0] = "{10052, \"攻击比\", 1005, {{10,108},{1,75600}}, 2, 1, {{'atk_per',5}}, 5}",
	[10293.0] = "{10293, \"暴击\", 1029, {{10,1638},{1,982800}}, 3, 1, {{'crit_rate',5}}, 29}",
	[10283.0] = "{10283, \"暴击\", 1028, {{10,1554},{1,932400}}, 3, 1, {{'crit_rate',5}}, 28}",
	[10273.0] = "{10273, \"暴击\", 1027, {{10,1470},{1,882000}}, 3, 1, {{'crit_rate',5}}, 27}",
	[20102.0] = "{20102, \"攻击比\", 2010, {{10,252},{1,176400}}, 2, 1, {{'atk_per',5}}, 10}",
	[10263.0] = "{10263, \"暴击\", 1026, {{10,1386},{1,831600}}, 3, 1, {{'crit_rate',5}}, 26}",
	[10253.0] = "{10253, \"暴击\", 1025, {{10,1302},{1,781200}}, 3, 1, {{'crit_rate',5}}, 25}",
	[30176.0] = "{30176, \"物理免伤\", 3017, {{10,980},{1,588000}}, 6, 1, {{'res_p',5}}, 17}",
	[20133.0] = "{20133, \"暴击\", 2013, {{10,462},{1,277200}}, 3, 1, {{'crit_rate',5}}, 13}",
	[10083.0] = "{10083, \"暴击\", 1008, {{10,210},{1,126000}}, 3, 1, {{'crit_rate',5}}, 8}",
	[40231.0] = "{40231, \"气血比\", 4023, {{10,810},{1,486000}}, 1, 1, {{'hp_max_per',5}}, 23}",
	[20036.0] = "{20036, \"伤害加成\", 2003, {{10,100},{1,60000}}, 6, 1, {{'dam',5}}, 3}",
	[30143.0] = "{30143, \"控制\", 3014, {{10,518},{1,310800}}, 3, 1, {{'hit_magic',5}}, 14}",
	[30333.0] = "{30333, \"控制\", 3033, {{10,2086},{1,1251600}}, 3, 1, {{'hit_magic',5}}, 33}",
	[40293.0] = "{40293, \"抗控\", 4029, {{10,1638},{1,982800}}, 3, 1, {{'dodge_magic',5}}, 29}",
	[20292.0] = "{20292, \"攻击比\", 2029, {{10,1404},{1,982800}}, 2, 1, {{'atk_per',5}}, 29}",
	[10274.0] = "{10274, \"暴伤\", 1027, {{10,1680},{1,1008000}}, 4, 1, {{'crit_ratio',10}}, 27}",
	[40324.0] = "{40324, \"抗暴\", 4032, {{10,2256},{1,1353600}}, 4, 1, {{'tenacity',5}}, 32}",
	[10114.0] = "{10114, \"暴伤\", 1011, {{10,400},{1,240000}}, 4, 1, {{'crit_ratio',10}}, 11}",
	[40355.0] = "{40355, \"速度\", 4035, {{10,2970},{1,1782000}}, 5, 1, {{'speed',4}}, 35}",
	[30354.0] = "{30354, \"抗暴\", 3035, {{10,2640},{1,1584000}}, 4, 1, {{'tenacity',5}}, 35}",
	[30044.0] = "{30044, \"抗暴\", 3004, {{10,112},{1,67200}}, 4, 1, {{'tenacity',5}}, 4}",
	[20226.0] = "{20226, \"伤害加成\", 2022, {{10,1500},{1,900000}}, 6, 1, {{'dam',5}}, 22}",
	[10203.0] = "{10203, \"暴击\", 1020, {{10,882},{1,529200}}, 3, 1, {{'crit_rate',5}}, 20}",
	[10193.0] = "{10193, \"暴击\", 1019, {{10,798},{1,478800}}, 3, 1, {{'crit_rate',5}}, 19}",
	[10362.0] = "{10362, \"攻击比\", 1036, {{10,2076},{1,1453200}}, 2, 1, {{'atk_per',5}}, 36}",
	[30011.0] = "{30011, \"气血比\", 3001, {{10,10},{1,6000}}, 1, 1, {{'hp_max_per',5}}, 1}",
	[10145.0] = "{10145, \"速度\", 1014, {{10,666},{1,399600}}, 5, 1, {{'speed',4}}, 14}",
	[10163.0] = "{10163, \"暴击\", 1016, {{10,630},{1,378000}}, 3, 1, {{'crit_rate',5}}, 16}",
	[10404.0] = "{10404, \"暴伤\", 1040, {{10,3312},{1,1987200}}, 4, 1, {{'crit_ratio',10}}, 40}",
	[10143.0] = "{10143, \"暴击\", 1014, {{10,518},{1,310800}}, 3, 1, {{'crit_rate',5}}, 14}",
	[10265.0] = "{10265, \"速度\", 1026, {{10,1782},{1,1069200}}, 5, 1, {{'speed',4}}, 26}",
	[10133.0] = "{10133, \"暴击\", 1013, {{10,462},{1,277200}}, 3, 1, {{'crit_rate',5}}, 13}",
	[40091.0] = "{40091, \"气血比\", 4009, {{10,170},{1,102000}}, 1, 1, {{'hp_max_per',5}}, 9}",
	[20332.0] = "{20332, \"攻击比\", 2033, {{10,1788},{1,1251600}}, 2, 1, {{'atk_per',5}}, 33}",
	[30201.0] = "{30201, \"气血比\", 3020, {{10,630},{1,378000}}, 1, 1, {{'hp_max_per',5}}, 20}",
	[10176.0] = "{10176, \"伤害加成\", 1017, {{10,980},{1,588000}}, 6, 1, {{'dam',5}}, 17}",
	[40153.0] = "{40153, \"抗控\", 4015, {{10,574},{1,344400}}, 3, 1, {{'dodge_magic',5}}, 15}",
	[10103.0] = "{10103, \"暴击\", 1010, {{10,294},{1,176400}}, 3, 1, {{'crit_rate',5}}, 10}",
	[40184.0] = "{40184, \"抗暴\", 4018, {{10,848},{1,508800}}, 4, 1, {{'tenacity',5}}, 18}",
	[30391.0] = "{30391, \"气血比\", 3039, {{10,1970},{1,1182000}}, 1, 1, {{'hp_max_per',5}}, 39}",
	[30276.0] = "{30276, \"物理免伤\", 3027, {{10,2100},{1,1260000}}, 6, 1, {{'res_p',5}}, 27}",
	[40215.0] = "{40215, \"速度\", 4021, {{10,1242},{1,745200}}, 5, 1, {{'speed',4}}, 21}",
	[10243.0] = "{10243, \"暴击\", 1024, {{10,1218},{1,730800}}, 3, 1, {{'crit_rate',5}}, 24}",
	[40246.0] = "{40246, \"魔法免伤\", 4024, {{10,1740},{1,1044000}}, 6, 1, {{'res_s',5}}, 24}",
	[30325.0] = "{30325, \"速度\", 3032, {{10,2538},{1,1522800}}, 5, 1, {{'speed',4}}, 32}",
	[20284.0] = "{20284, \"暴伤\", 2028, {{10,1776},{1,1065600}}, 4, 1, {{'crit_ratio',10}}, 28}",
	[10073.0] = "{10073, \"暴击\", 1007, {{10,182},{1,109200}}, 3, 1, {{'crit_rate',5}}, 7}",
	[30102.0] = "{30102, \"攻击比\", 3010, {{10,252},{1,176400}}, 2, 1, {{'atk_per',5}}, 10}",
	[30292.0] = "{30292, \"攻击比\", 3029, {{10,1404},{1,982800}}, 2, 1, {{'atk_per',5}}, 29}",
	[10063.0] = "{10063, \"暴击\", 1006, {{10,154},{1,92400}}, 3, 1, {{'crit_rate',5}}, 6}",
	[20315.0] = "{20315, \"速度\", 2031, {{10,2394},{1,1436400}}, 5, 1, {{'speed',4}}, 31}",
	[10053.0] = "{10053, \"暴击\", 1005, {{10,126},{1,75600}}, 3, 1, {{'crit_rate',5}}, 5}",
	[30036.0] = "{30036, \"物理免伤\", 3003, {{10,100},{1,60000}}, 6, 1, {{'res_p',5}}, 3}",
	[10013.0] = "{10013, \"暴击\", 1001, {{10,14},{1,8400}}, 3, 1, {{'crit_rate',5}}, 1}",
	[40401.0] = "{40401, \"气血比\", 4040, {{10,2070},{1,1242000}}, 1, 1, {{'hp_max_per',5}}, 40}",
	[10033.0] = "{10033, \"暴击\", 1003, {{10,70},{1,42000}}, 3, 1, {{'crit_rate',5}}, 3}",
	[30275.0] = "{30275, \"速度\", 3027, {{10,1890},{1,1134000}}, 5, 1, {{'speed',4}}, 27}",
	[30226.0] = "{30226, \"物理免伤\", 3022, {{10,1500},{1,900000}}, 6, 1, {{'res_p',5}}, 22}",
	[10043.0] = "{10043, \"暴击\", 1004, {{10,98},{1,58800}}, 3, 1, {{'crit_rate',5}}, 4}",
	[40013.0] = "{40013, \"抗控\", 4001, {{10,14},{1,8400}}, 3, 1, {{'dodge_magic',5}}, 1}",
	[20392.0] = "{20392, \"攻击比\", 2039, {{10,2364},{1,1654800}}, 2, 1, {{'atk_per',5}}, 39}",
	[40044.0] = "{40044, \"抗暴\", 4004, {{10,112},{1,67200}}, 4, 1, {{'tenacity',5}}, 4}",
	[10044.0] = "{10044, \"暴伤\", 1004, {{10,112},{1,67200}}, 4, 1, {{'crit_ratio',10}}, 4}",
	[10205.0] = "{10205, \"速度\", 1020, {{10,1134},{1,680400}}, 5, 1, {{'speed',4}}, 20}",
	[40075.0] = "{40075, \"速度\", 4007, {{10,234},{1,140400}}, 5, 1, {{'speed',4}}, 7}",
	[40261.0] = "{40261, \"气血比\", 4026, {{10,990},{1,594000}}, 1, 1, {{'hp_max_per',5}}, 26}",
	[30193.0] = "{30193, \"控制\", 3019, {{10,798},{1,478800}}, 3, 1, {{'hit_magic',5}}, 19}",
	[10173.0] = "{10173, \"暴击\", 1017, {{10,686},{1,411600}}, 3, 1, {{'crit_rate',5}}, 17}",
	[20085.0] = "{20085, \"速度\", 2008, {{10,270},{1,162000}}, 5, 1, {{'speed',4}}, 8}",
	[10332.0] = "{10332, \"攻击比\", 1033, {{10,1788},{1,1251600}}, 2, 1, {{'atk_per',5}}, 33}",
	[20342.0] = "{20342, \"攻击比\", 2034, {{10,1884},{1,1318800}}, 2, 1, {{'atk_per',5}}, 34}",
	[30383.0] = "{30383, \"控制\", 3038, {{10,2646},{1,1587600}}, 3, 1, {{'hit_magic',5}}, 38}",
	[20406.0] = "{20406, \"伤害加成\", 2040, {{10,4140},{1,2484000}}, 6, 1, {{'dam',5}}, 40}",
	[10302.0] = "{10302, \"攻击比\", 1030, {{10,1500},{1,1050000}}, 2, 1, {{'atk_per',5}}, 30}",
	[10292.0] = "{10292, \"攻击比\", 1029, {{10,1404},{1,982800}}, 2, 1, {{'atk_per',5}}, 29}",
	[20373.0] = "{20373, \"暴击\", 2037, {{10,2534},{1,1520400}}, 3, 1, {{'crit_rate',5}}, 37}",
	[10282.0] = "{10282, \"攻击比\", 1028, {{10,1332},{1,932400}}, 2, 1, {{'atk_per',5}}, 28}",
	[20276.0] = "{20276, \"伤害加成\", 2027, {{10,2100},{1,1260000}}, 6, 1, {{'dam',5}}, 27}",
	[20051.0] = "{20051, \"气血比\", 2005, {{10,90},{1,54000}}, 1, 1, {{'hp_max_per',5}}, 5}",
	[40292.0] = "{40292, \"攻击比\", 4029, {{10,1404},{1,982800}}, 2, 1, {{'atk_per',5}}, 29}",
	[30061.0] = "{30061, \"气血比\", 3006, {{10,110},{1,66000}}, 1, 1, {{'hp_max_per',5}}, 6}",
	[10323.0] = "{10323, \"暴击\", 1032, {{10,1974},{1,1184400}}, 3, 1, {{'crit_rate',5}}, 32}",
	[40323.0] = "{40323, \"抗控\", 4032, {{10,1974},{1,1184400}}, 3, 1, {{'dodge_magic',5}}, 32}",
	[10262.0] = "{10262, \"攻击比\", 1026, {{10,1188},{1,831600}}, 2, 1, {{'atk_per',5}}, 26}",
	[40354.0] = "{40354, \"抗暴\", 4035, {{10,2640},{1,1584000}}, 4, 1, {{'tenacity',5}}, 35}",
	[30251.0] = "{30251, \"气血比\", 3025, {{10,930},{1,558000}}, 1, 1, {{'hp_max_per',5}}, 25}",
	[40385.0] = "{40385, \"速度\", 4038, {{10,3402},{1,2041200}}, 5, 1, {{'speed',4}}, 38}",
	[10252.0] = "{10252, \"攻击比\", 1025, {{10,1116},{1,781200}}, 2, 1, {{'atk_per',5}}, 25}",
	[10354.0] = "{10354, \"暴伤\", 1035, {{10,2640},{1,1584000}}, 4, 1, {{'crit_ratio',10}}, 35}",
	[20241.0] = "{20241, \"气血比\", 2024, {{10,870},{1,522000}}, 1, 1, {{'hp_max_per',5}}, 24}",
	[10242.0] = "{10242, \"攻击比\", 1024, {{10,1044},{1,730800}}, 2, 1, {{'atk_per',5}}, 24}",
	[20144.0] = "{20144, \"暴伤\", 2014, {{10,592},{1,355200}}, 4, 1, {{'crit_ratio',10}}, 14}",
	[10232.0] = "{10232, \"攻击比\", 1023, {{10,972},{1,680400}}, 2, 1, {{'atk_per',5}}, 23}",
	[10222.0] = "{10222, \"攻击比\", 1022, {{10,900},{1,630000}}, 2, 1, {{'atk_per',5}}, 22}",
	[10212.0] = "{10212, \"攻击比\", 1021, {{10,828},{1,579600}}, 2, 1, {{'atk_per',5}}, 21}",
	[10202.0] = "{10202, \"攻击比\", 1020, {{10,756},{1,529200}}, 2, 1, {{'atk_per',5}}, 20}",
	[20175.0] = "{20175, \"速度\", 2017, {{10,882},{1,529200}}, 5, 1, {{'speed',4}}, 17}",
	[10192.0] = "{10192, \"攻击比\", 1019, {{10,684},{1,478800}}, 2, 1, {{'atk_per',5}}, 19}",
	[30185.0] = "{30185, \"速度\", 3018, {{10,954},{1,572400}}, 5, 1, {{'speed',4}}, 18}",
	[10385.0] = "{10385, \"速度\", 1038, {{10,3402},{1,2041200}}, 5, 1, {{'speed',4}}, 38}",
	[40121.0] = "{40121, \"气血比\", 4012, {{10,290},{1,174000}}, 1, 1, {{'hp_max_per',5}}, 12}",
	[10182.0] = "{10182, \"攻击比\", 1018, {{10,636},{1,445200}}, 2, 1, {{'atk_per',5}}, 18}",
	[30152.0] = "{30152, \"攻击比\", 3015, {{10,492},{1,344400}}, 2, 1, {{'atk_per',5}}, 15}",
	[30375.0] = "{30375, \"速度\", 3037, {{10,3258},{1,1954800}}, 5, 1, {{'speed',4}}, 37}",
	[40183.0] = "{40183, \"抗控\", 4018, {{10,742},{1,445200}}, 3, 1, {{'dodge_magic',5}}, 18}",
	[20012.0] = "{20012, \"攻击比\", 2001, {{10,12},{1,8400}}, 2, 1, {{'atk_per',5}}, 1}",
	[10172.0] = "{10172, \"攻击比\", 1017, {{10,588},{1,411600}}, 2, 1, {{'atk_per',5}}, 17}",
	[30342.0] = "{30342, \"攻击比\", 3034, {{10,1884},{1,1318800}}, 2, 1, {{'atk_per',5}}, 34}",
	[10162.0] = "{10162, \"攻击比\", 1016, {{10,540},{1,378000}}, 2, 1, {{'atk_per',5}}, 16}",
	[40245.0] = "{40245, \"速度\", 4024, {{10,1566},{1,939600}}, 5, 1, {{'speed',4}}, 24}",
	[20043.0] = "{20043, \"暴击\", 2004, {{10,98},{1,58800}}, 3, 1, {{'crit_rate',5}}, 4}",
	[40276.0] = "{40276, \"魔法免伤\", 4027, {{10,2100},{1,1260000}}, 6, 1, {{'res_s',5}}, 27}",
	[30053.0] = "{30053, \"控制\", 3005, {{10,126},{1,75600}}, 3, 1, {{'hit_magic',5}}, 5}",
	[10152.0] = "{10152, \"攻击比\", 1015, {{10,492},{1,344400}}, 2, 1, {{'atk_per',5}}, 15}",
	[10142.0] = "{10142, \"攻击比\", 1014, {{10,444},{1,310800}}, 2, 1, {{'atk_per',5}}, 14}",
	[30146.0] = "{30146, \"物理免伤\", 3014, {{10,740},{1,444000}}, 6, 1, {{'res_p',5}}, 14}",
	[20202.0] = "{20202, \"攻击比\", 2020, {{10,756},{1,529200}}, 2, 1, {{'atk_per',5}}, 20}",
	[30243.0] = "{30243, \"控制\", 3024, {{10,1218},{1,730800}}, 3, 1, {{'hit_magic',5}}, 24}",
	[40372.0] = "{40372, \"攻击比\", 4037, {{10,2172},{1,1520400}}, 2, 1, {{'atk_per',5}}, 37}",
	[10102.0] = "{10102, \"攻击比\", 1010, {{10,252},{1,176400}}, 2, 1, {{'atk_per',5}}, 10}",
	[10092.0] = "{10092, \"攻击比\", 1009, {{10,204},{1,142800}}, 2, 1, {{'atk_per',5}}, 9}",
	[20233.0] = "{20233, \"暴击\", 2023, {{10,1134},{1,680400}}, 3, 1, {{'crit_rate',5}}, 23}",
	[30295.0] = "{30295, \"速度\", 3029, {{10,2106},{1,1263600}}, 5, 1, {{'speed',4}}, 29}",
	[20136.0] = "{20136, \"伤害加成\", 2013, {{10,660},{1,396000}}, 6, 1, {{'dam',5}}, 13}",
	[40221.0] = "{40221, \"气血比\", 4022, {{10,750},{1,450000}}, 1, 1, {{'hp_max_per',5}}, 22}",
	[40012.0] = "{40012, \"攻击比\", 4001, {{10,12},{1,8400}}, 2, 1, {{'atk_per',5}}, 1}",
	[10036.0] = "{10036, \"伤害加成\", 1003, {{10,100},{1,60000}}, 6, 1, {{'dam',5}}, 3}",
	[40043.0] = "{40043, \"抗控\", 4004, {{10,98},{1,58800}}, 3, 1, {{'dodge_magic',5}}, 4}",
	[10313.0] = "{10313, \"暴击\", 1031, {{10,1862},{1,1117200}}, 3, 1, {{'crit_rate',5}}, 31}",
	[20345.0] = "{20345, \"速度\", 2034, {{10,2826},{1,1695600}}, 5, 1, {{'speed',4}}, 34}",
	[40074.0] = "{40074, \"抗暴\", 4007, {{10,208},{1,124800}}, 4, 1, {{'tenacity',5}}, 7}",
	[10381.0] = "{10381, \"气血比\", 1038, {{10,1890},{1,1134000}}, 1, 1, {{'hp_max_per',5}}, 38}",
	[40105.0] = "{40105, \"速度\", 4010, {{10,378},{1,226800}}, 5, 1, {{'speed',4}}, 10}",
	[10022.0] = "{10022, \"攻击比\", 1002, {{10,36},{1,25200}}, 2, 1, {{'atk_per',5}}, 2}",
	[20326.0] = "{20326, \"伤害加成\", 2032, {{10,2820},{1,1692000}}, 6, 1, {{'dam',5}}, 32}",
	[20101.0] = "{20101, \"气血比\", 2010, {{10,210},{1,126000}}, 1, 1, {{'hp_max_per',5}}, 10}",
	[30334.0] = "{30334, \"抗暴\", 3033, {{10,2384},{1,1430400}}, 4, 1, {{'tenacity',5}}, 33}",
	[10401.0] = "{10401, \"气血比\", 1040, {{10,2070},{1,1242000}}, 1, 1, {{'hp_max_per',5}}, 40}",
	[40103.0] = "{40103, \"抗控\", 4010, {{10,294},{1,176400}}, 3, 1, {{'dodge_magic',5}}, 10}",
	[30111.0] = "{30111, \"气血比\", 3011, {{10,250},{1,150000}}, 1, 1, {{'hp_max_per',5}}, 11}",
	[30301.0] = "{30301, \"气血比\", 3030, {{10,1250},{1,750000}}, 1, 1, {{'hp_max_per',5}}, 30}",
	[10032.0] = "{10032, \"攻击比\", 1003, {{10,60},{1,42000}}, 2, 1, {{'atk_per',5}}, 3}",
	[20035.0] = "{20035, \"速度\", 2003, {{10,90},{1,54000}}, 5, 1, {{'speed',4}}, 3}",
	[10371.0] = "{10371, \"气血比\", 1037, {{10,1810},{1,1086000}}, 1, 1, {{'hp_max_per',5}}, 37}",
	[30045.0] = "{30045, \"速度\", 3004, {{10,126},{1,75600}}, 5, 1, {{'speed',4}}, 4}",
	[40291.0] = "{40291, \"气血比\", 4029, {{10,1170},{1,702000}}, 1, 1, {{'hp_max_per',5}}, 29}",
	[20291.0] = "{20291, \"气血比\", 2029, {{10,1170},{1,702000}}, 1, 1, {{'hp_max_per',5}}, 29}",
	[10351.0] = "{10351, \"气血比\", 1035, {{10,1650},{1,990000}}, 1, 1, {{'hp_max_per',5}}, 35}",
	[40322.0] = "{40322, \"攻击比\", 4032, {{10,1692},{1,1184400}}, 2, 1, {{'atk_per',5}}, 32}",
	[30012.0] = "{30012, \"攻击比\", 3001, {{10,12},{1,8400}}, 2, 1, {{'atk_per',5}}, 1}",
	[40353.0] = "{40353, \"抗控\", 4035, {{10,2310},{1,1386000}}, 3, 1, {{'dodge_magic',5}}, 35}",
	[10341.0] = "{10341, \"气血比\", 1034, {{10,1570},{1,942000}}, 1, 1, {{'hp_max_per',5}}, 34}",
	[40384.0] = "{40384, \"抗暴\", 4038, {{10,3024},{1,1814400}}, 4, 1, {{'tenacity',5}}, 38}",
	[20225.0] = "{20225, \"速度\", 2022, {{10,1350},{1,810000}}, 5, 1, {{'speed',4}}, 22}",
	[10331.0] = "{10331, \"气血比\", 1033, {{10,1490},{1,894000}}, 1, 1, {{'hp_max_per',5}}, 33}",
	[10321.0] = "{10321, \"气血比\", 1032, {{10,1410},{1,846000}}, 1, 1, {{'hp_max_per',5}}, 32}",
	[10311.0] = "{10311, \"气血比\", 1031, {{10,1330},{1,798000}}, 1, 1, {{'hp_max_per',5}}, 31}",
	[30144.0] = "{30144, \"抗暴\", 3014, {{10,592},{1,355200}}, 4, 1, {{'tenacity',5}}, 14}",
	[30202.0] = "{30202, \"攻击比\", 3020, {{10,756},{1,529200}}, 2, 1, {{'atk_per',5}}, 20}",
	[20384.0] = "{20384, \"暴伤\", 2038, {{10,3024},{1,1814400}}, 4, 1, {{'crit_ratio',10}}, 38}",
	[10291.0] = "{10291, \"气血比\", 1029, {{10,1170},{1,702000}}, 1, 1, {{'hp_max_per',5}}, 29}",
	[10281.0] = "{10281, \"气血比\", 1028, {{10,1110},{1,666000}}, 1, 1, {{'hp_max_per',5}}, 28}",
	[20062.0] = "{20062, \"攻击比\", 2006, {{10,132},{1,92400}}, 2, 1, {{'atk_per',5}}, 6}",
	[30392.0] = "{30392, \"攻击比\", 3039, {{10,2364},{1,1654800}}, 2, 1, {{'atk_per',5}}, 39}",
	[10271.0] = "{10271, \"气血比\", 1027, {{10,1050},{1,630000}}, 1, 1, {{'hp_max_per',5}}, 27}",
	[10261.0] = "{10261, \"气血比\", 1026, {{10,990},{1,594000}}, 1, 1, {{'hp_max_per',5}}, 26}",
	[20093.0] = "{20093, \"暴击\", 2009, {{10,238},{1,142800}}, 3, 1, {{'crit_rate',5}}, 9}",
	[30136.0] = "{30136, \"物理免伤\", 3013, {{10,660},{1,396000}}, 6, 1, {{'res_p',5}}, 13}",
	[30326.0] = "{30326, \"物理免伤\", 3032, {{10,2820},{1,1692000}}, 6, 1, {{'res_p',5}}, 32}",
	[10251.0] = "{10251, \"气血比\", 1025, {{10,930},{1,558000}}, 1, 1, {{'hp_max_per',5}}, 25}",
	[40182.0] = "{40182, \"攻击比\", 4018, {{10,636},{1,445200}}, 2, 1, {{'atk_per',5}}, 18}",
	[30103.0] = "{30103, \"控制\", 3010, {{10,294},{1,176400}}, 3, 1, {{'hit_magic',5}}, 10}",
	[30293.0] = "{30293, \"控制\", 3029, {{10,1638},{1,982800}}, 3, 1, {{'hit_magic',5}}, 29}",
	[40213.0] = "{40213, \"抗控\", 4021, {{10,966},{1,579600}}, 3, 1, {{'dodge_magic',5}}, 21}",
	[10241.0] = "{10241, \"气血比\", 1024, {{10,870},{1,522000}}, 1, 1, {{'hp_max_per',5}}, 24}",
	[40244.0] = "{40244, \"抗暴\", 4024, {{10,1392},{1,835200}}, 4, 1, {{'tenacity',5}}, 24}",
	[10094.0] = "{10094, \"暴伤\", 1009, {{10,272},{1,163200}}, 4, 1, {{'crit_ratio',10}}, 9}",
	[40275.0] = "{40275, \"速度\", 4027, {{10,1890},{1,1134000}}, 5, 1, {{'speed',4}}, 27}",
	[10231.0] = "{10231, \"气血比\", 1023, {{10,810},{1,486000}}, 1, 1, {{'hp_max_per',5}}, 23}",
	[40306.0] = "{40306, \"魔法免伤\", 4030, {{10,2500},{1,1500000}}, 6, 1, {{'res_s',5}}, 30}",
	[20186.0] = "{20186, \"伤害加成\", 2018, {{10,1060},{1,636000}}, 6, 1, {{'dam',5}}, 18}",
	[30183.0] = "{30183, \"控制\", 3018, {{10,742},{1,445200}}, 3, 1, {{'hit_magic',5}}, 18}",
	[10211.0] = "{10211, \"气血比\", 1021, {{10,690},{1,414000}}, 1, 1, {{'hp_max_per',5}}, 21}",
	[10201.0] = "{10201, \"气血比\", 1020, {{10,630},{1,378000}}, 1, 1, {{'hp_max_per',5}}, 20}",
	[10342.0] = "{10342, \"攻击比\", 1034, {{10,1884},{1,1318800}}, 2, 1, {{'atk_per',5}}, 34}",
	[10125.0] = "{10125, \"速度\", 1012, {{10,522},{1,313200}}, 5, 1, {{'speed',4}}, 12}",
	[10191.0] = "{10191, \"气血比\", 1019, {{10,570},{1,342000}}, 1, 1, {{'hp_max_per',5}}, 19}",
	[10181.0] = "{10181, \"气血比\", 1018, {{10,530},{1,318000}}, 1, 1, {{'hp_max_per',5}}, 18}",
	[10171.0] = "{10171, \"气血比\", 1017, {{10,490},{1,294000}}, 1, 1, {{'hp_max_per',5}}, 17}",
	[10316.0] = "{10316, \"伤害加成\", 1031, {{10,2660},{1,1596000}}, 6, 1, {{'dam',5}}, 31}",
	[30194.0] = "{30194, \"抗暴\", 3019, {{10,912},{1,547200}}, 4, 1, {{'tenacity',5}}, 19}",
	[20376.0] = "{20376, \"伤害加成\", 2037, {{10,3620},{1,2172000}}, 6, 1, {{'dam',5}}, 37}",
	[30026.0] = "{30026, \"物理免伤\", 3002, {{10,60},{1,36000}}, 6, 1, {{'res_p',5}}, 2}",
	[40042.0] = "{40042, \"攻击比\", 4004, {{10,84},{1,58800}}, 2, 1, {{'atk_per',5}}, 4}",
	[30161.0] = "{30161, \"气血比\", 3016, {{10,450},{1,270000}}, 1, 1, {{'hp_max_per',5}}, 16}",
	[30384.0] = "{30384, \"抗暴\", 3038, {{10,3024},{1,1814400}}, 4, 1, {{'tenacity',5}}, 38}",
	[40073.0] = "{40073, \"抗控\", 4007, {{10,182},{1,109200}}, 3, 1, {{'dodge_magic',5}}, 7}",
	[10141.0] = "{10141, \"气血比\", 1014, {{10,370},{1,222000}}, 1, 1, {{'hp_max_per',5}}, 14}",
	[40104.0] = "{40104, \"抗暴\", 4010, {{10,336},{1,201600}}, 4, 1, {{'tenacity',5}}, 10}",
	[30351.0] = "{30351, \"气血比\", 3035, {{10,1650},{1,990000}}, 1, 1, {{'hp_max_per',5}}, 35}",
	[40135.0] = "{40135, \"速度\", 4013, {{10,594},{1,356400}}, 5, 1, {{'speed',4}}, 13}",
	[20194.0] = "{20194, \"暴伤\", 2019, {{10,912},{1,547200}}, 4, 1, {{'crit_ratio',10}}, 19}",
	[40166.0] = "{40166, \"魔法免伤\", 4016, {{10,900},{1,540000}}, 6, 1, {{'res_s',5}}, 16}",
	[30095.0] = "{30095, \"速度\", 3009, {{10,306},{1,183600}}, 5, 1, {{'speed',4}}, 9}",
	[30062.0] = "{30062, \"攻击比\", 3006, {{10,132},{1,92400}}, 2, 1, {{'atk_per',5}}, 6}",
	[20244.0] = "{20244, \"暴伤\", 2024, {{10,1392},{1,835200}}, 4, 1, {{'crit_ratio',10}}, 24}",
	[20011.0] = "{20011, \"气血比\", 2001, {{10,10},{1,6000}}, 1, 1, {{'hp_max_per',5}}, 1}",
	[10174.0] = "{10174, \"暴伤\", 1017, {{10,784},{1,470400}}, 4, 1, {{'crit_ratio',10}}, 17}",
	[30386.0] = "{30386, \"物理免伤\", 3038, {{10,3780},{1,2268000}}, 6, 1, {{'res_p',5}}, 38}",
	[30252.0] = "{30252, \"攻击比\", 3025, {{10,1116},{1,781200}}, 2, 1, {{'atk_per',5}}, 25}",
	[10071.0] = "{10071, \"气血比\", 1007, {{10,130},{1,78000}}, 1, 1, {{'hp_max_per',5}}, 7}",
	[10061.0] = "{10061, \"气血比\", 1006, {{10,110},{1,66000}}, 1, 1, {{'hp_max_per',5}}, 6}",
	[10051.0] = "{10051, \"气血比\", 1005, {{10,90},{1,54000}}, 1, 1, {{'hp_max_per',5}}, 5}",
	[10096.0] = "{10096, \"伤害加成\", 1009, {{10,340},{1,204000}}, 6, 1, {{'dam',5}}, 9}",
	[40321.0] = "{40321, \"气血比\", 4032, {{10,1410},{1,846000}}, 1, 1, {{'hp_max_per',5}}, 32}",
	[30092.0] = "{30092, \"攻击比\", 3009, {{10,204},{1,142800}}, 2, 1, {{'atk_per',5}}, 9}",
	[40352.0] = "{40352, \"攻击比\", 4035, {{10,1980},{1,1386000}}, 2, 1, {{'atk_per',5}}, 35}",
	[10121.0] = "{10121, \"气血比\", 1012, {{10,290},{1,174000}}, 1, 1, {{'hp_max_per',5}}, 12}",
	[40383.0] = "{40383, \"抗控\", 4038, {{10,2646},{1,1587600}}, 3, 1, {{'dodge_magic',5}}, 38}",
	[20112.0] = "{20112, \"攻击比\", 2011, {{10,300},{1,210000}}, 2, 1, {{'atk_per',5}}, 11}",
	[20334.0] = "{20334, \"暴伤\", 2033, {{10,2384},{1,1430400}}, 4, 1, {{'crit_ratio',10}}, 33}",
	[10011.0] = "{10011, \"气血比\", 1001, {{10,10},{1,6000}}, 1, 1, {{'hp_max_per',5}}, 1}",
	[30186.0] = "{30186, \"物理免伤\", 3018, {{10,1060},{1,636000}}, 6, 1, {{'res_p',5}}, 18}",
	[20143.0] = "{20143, \"暴击\", 2014, {{10,518},{1,310800}}, 3, 1, {{'crit_rate',5}}, 14}",
	[40026.0] = "{40026, \"魔法免伤\", 4002, {{10,60},{1,36000}}, 6, 1, {{'res_s',5}}, 2}",
	[30153.0] = "{30153, \"控制\", 3015, {{10,574},{1,344400}}, 3, 1, {{'hit_magic',5}}, 15}",
	[30376.0] = "{30376, \"物理免伤\", 3037, {{10,3620},{1,2172000}}, 6, 1, {{'res_p',5}}, 37}",
	[10272.0] = "{10272, \"攻击比\", 1027, {{10,1260},{1,882000}}, 2, 1, {{'atk_per',5}}, 27}",
	[20302.0] = "{20302, \"攻击比\", 2030, {{10,1500},{1,1050000}}, 2, 1, {{'atk_per',5}}, 30}",
	[30343.0] = "{30343, \"控制\", 3034, {{10,2198},{1,1318800}}, 3, 1, {{'hit_magic',5}}, 34}",
	[20333.0] = "{20333, \"暴击\", 2033, {{10,2086},{1,1251600}}, 3, 1, {{'crit_rate',5}}, 33}",
	[10183.0] = "{10183, \"暴击\", 1018, {{10,742},{1,445200}}, 3, 1, {{'crit_rate',5}}, 18}",
	[30054.0] = "{30054, \"抗暴\", 3005, {{10,144},{1,86400}}, 4, 1, {{'tenacity',5}}, 5}",
	[20236.0] = "{20236, \"伤害加成\", 2023, {{10,1620},{1,972000}}, 6, 1, {{'dam',5}}, 23}",
	[10303.0] = "{10303, \"暴击\", 1030, {{10,1750},{1,1050000}}, 3, 1, {{'crit_rate',5}}, 30}",
	[40212.0] = "{40212, \"攻击比\", 4021, {{10,828},{1,579600}}, 2, 1, {{'atk_per',5}}, 21}",
	[30021.0] = "{30021, \"气血比\", 3002, {{10,30},{1,18000}}, 1, 1, {{'hp_max_per',5}}, 2}",
	[40243.0] = "{40243, \"抗控\", 4024, {{10,1218},{1,730800}}, 3, 1, {{'dodge_magic',5}}, 24}",
	[40274.0] = "{40274, \"抗暴\", 4027, {{10,1680},{1,1008000}}, 4, 1, {{'tenacity',5}}, 27}",
	[10214.0] = "{10214, \"暴伤\", 1021, {{10,1104},{1,662400}}, 4, 1, {{'crit_ratio',10}}, 21}",
	[30211.0] = "{30211, \"气血比\", 3021, {{10,690},{1,414000}}, 1, 1, {{'hp_max_per',5}}, 21}",
	[40336.0] = "{40336, \"魔法免伤\", 4033, {{10,2980},{1,1788000}}, 6, 1, {{'res_s',5}}, 33}",
	[10334.0] = "{10334, \"暴伤\", 1033, {{10,2384},{1,1430400}}, 4, 1, {{'crit_ratio',10}}, 33}",
	[20104.0] = "{20104, \"暴伤\", 2010, {{10,336},{1,201600}}, 4, 1, {{'crit_ratio',10}}, 10}",
	[30401.0] = "{30401, \"气血比\", 3040, {{10,2070},{1,1242000}}, 1, 1, {{'hp_max_per',5}}, 40}",
	[20135.0] = "{20135, \"速度\", 2013, {{10,594},{1,356400}}, 5, 1, {{'speed',4}}, 13}",
	[10365.0] = "{10365, \"速度\", 1036, {{10,3114},{1,1868400}}, 5, 1, {{'speed',4}}, 36}",
	[30145.0] = "{30145, \"速度\", 3014, {{10,666},{1,399600}}, 5, 1, {{'speed',4}}, 14}",
	[40041.0] = "{40041, \"气血比\", 4004, {{10,70},{1,42000}}, 1, 1, {{'hp_max_per',5}}, 4}",
	[30335.0] = "{30335, \"速度\", 3033, {{10,2682},{1,1609200}}, 5, 1, {{'speed',4}}, 33}",
	[40072.0] = "{40072, \"攻击比\", 4007, {{10,156},{1,109200}}, 2, 1, {{'atk_per',5}}, 7}",
	[30112.0] = "{30112, \"攻击比\", 3011, {{10,300},{1,210000}}, 2, 1, {{'atk_per',5}}, 11}",
	[30302.0] = "{30302, \"攻击比\", 3030, {{10,1500},{1,1050000}}, 2, 1, {{'atk_per',5}}, 30}",
	[40134.0] = "{40134, \"抗暴\", 4013, {{10,528},{1,316800}}, 4, 1, {{'tenacity',5}}, 13}",
	[10396.0] = "{10396, \"伤害加成\", 1039, {{10,3940},{1,2364000}}, 6, 1, {{'dam',5}}, 39}",
	[40165.0] = "{40165, \"速度\", 4016, {{10,810},{1,486000}}, 5, 1, {{'speed',4}}, 16}",
	[40196.0] = "{40196, \"魔法免伤\", 4019, {{10,1140},{1,684000}}, 6, 1, {{'res_s',5}}, 19}",
	[10082.0] = "{10082, \"攻击比\", 1008, {{10,180},{1,126000}}, 2, 1, {{'atk_per',5}}, 8}",
	[30236.0] = "{30236, \"物理免伤\", 3023, {{10,1620},{1,972000}}, 6, 1, {{'res_p',5}}, 23}",
	[20162.0] = "{20162, \"攻击比\", 2016, {{10,540},{1,378000}}, 2, 1, {{'atk_per',5}}, 16}",
	[20193.0] = "{20193, \"暴击\", 2019, {{10,798},{1,478800}}, 3, 1, {{'crit_rate',5}}, 19}",
	[10113.0] = "{10113, \"暴击\", 1011, {{10,350},{1,210000}}, 3, 1, {{'crit_rate',5}}, 11}",
	[30203.0] = "{30203, \"控制\", 3020, {{10,882},{1,529200}}, 3, 1, {{'hit_magic',5}}, 20}",
	[20096.0] = "{20096, \"伤害加成\", 2009, {{10,340},{1,204000}}, 6, 1, {{'dam',5}}, 9}",
	[40382.0] = "{40382, \"攻击比\", 4038, {{10,2268},{1,1587600}}, 2, 1, {{'atk_per',5}}, 38}",
	[10016.0] = "{10016, \"伤害加成\", 1001, {{10,20},{1,12000}}, 6, 1, {{'dam',5}}, 1}",
	[30393.0] = "{30393, \"控制\", 3039, {{10,2758},{1,1654800}}, 3, 1, {{'hit_magic',5}}, 39}",
	[10361.0] = "{10361, \"气血比\", 1036, {{10,1730},{1,1038000}}, 1, 1, {{'hp_max_per',5}}, 36}",
	[10144.0] = "{10144, \"暴伤\", 1014, {{10,592},{1,355200}}, 4, 1, {{'crit_ratio',10}}, 14}",
	[40025.0] = "{40025, \"速度\", 4002, {{10,54},{1,32400}}, 5, 1, {{'speed',4}}, 2}",
	[20286.0] = "{20286, \"伤害加成\", 2028, {{10,2220},{1,1332000}}, 6, 1, {{'dam',5}}, 28}",
	[20061.0] = "{20061, \"气血比\", 2006, {{10,110},{1,66000}}, 1, 1, {{'hp_max_per',5}}, 6}",
	[30104.0] = "{30104, \"抗暴\", 3010, {{10,336},{1,201600}}, 4, 1, {{'tenacity',5}}, 10}",
	[30071.0] = "{30071, \"气血比\", 3007, {{10,130},{1,78000}}, 1, 1, {{'hp_max_per',5}}, 7}",
	[10175.0] = "{10175, \"速度\", 1017, {{10,882},{1,529200}}, 5, 1, {{'speed',4}}, 17}",
	[10392.0] = "{10392, \"攻击比\", 1039, {{10,2364},{1,1654800}}, 2, 1, {{'atk_per',5}}, 39}",
	[30261.0] = "{30261, \"气血比\", 3026, {{10,990},{1,594000}}, 1, 1, {{'hp_max_per',5}}, 26}",
	[10295.0] = "{10295, \"速度\", 1029, {{10,2106},{1,1263600}}, 5, 1, {{'speed',4}}, 29}",
	[40211.0] = "{40211, \"气血比\", 4021, {{10,690},{1,414000}}, 1, 1, {{'hp_max_per',5}}, 21}",
	[40242.0] = "{40242, \"攻击比\", 4024, {{10,1044},{1,730800}}, 2, 1, {{'atk_per',5}}, 24}",
	[40273.0] = "{40273, \"抗控\", 4027, {{10,1470},{1,882000}}, 3, 1, {{'dodge_magic',5}}, 27}",
	[40304.0] = "{40304, \"抗暴\", 4030, {{10,2000},{1,1200000}}, 4, 1, {{'tenacity',5}}, 30}",
	[20185.0] = "{20185, \"速度\", 2018, {{10,954},{1,572400}}, 5, 1, {{'speed',4}}, 18}",
	[10326.0] = "{10326, \"伤害加成\", 1032, {{10,2820},{1,1692000}}, 6, 1, {{'dam',5}}, 32}",
	[40335.0] = "{40335, \"速度\", 4033, {{10,2682},{1,1609200}}, 5, 1, {{'speed',4}}, 33}",
	[40366.0] = "{40366, \"魔法免伤\", 4036, {{10,3460},{1,2076000}}, 6, 1, {{'res_s',5}}, 36}",
	[10012.0] = "{10012, \"攻击比\", 1001, {{10,12},{1,8400}}, 2, 1, {{'atk_per',5}}, 1}",
	[30162.0] = "{30162, \"攻击比\", 3016, {{10,540},{1,378000}}, 2, 1, {{'atk_per',5}}, 16}",
	[30385.0] = "{30385, \"速度\", 3038, {{10,3402},{1,2041200}}, 5, 1, {{'speed',4}}, 38}",
	[20022.0] = "{20022, \"攻击比\", 2002, {{10,36},{1,25200}}, 2, 1, {{'atk_per',5}}, 2}",
	[30352.0] = "{30352, \"攻击比\", 3035, {{10,1980},{1,1386000}}, 2, 1, {{'atk_per',5}}, 35}",
	[20053.0] = "{20053, \"暴击\", 2005, {{10,126},{1,75600}}, 3, 1, {{'crit_rate',5}}, 5}",
	[30096.0] = "{30096, \"物理免伤\", 3009, {{10,340},{1,204000}}, 6, 1, {{'res_p',5}}, 9}",
	[30286.0] = "{30286, \"物理免伤\", 3028, {{10,2220},{1,1332000}}, 6, 1, {{'res_p',5}}, 28}",
	[40102.0] = "{40102, \"攻击比\", 4010, {{10,252},{1,176400}}, 2, 1, {{'atk_per',5}}, 10}",
	[40133.0] = "{40133, \"抗控\", 4013, {{10,462},{1,277200}}, 3, 1, {{'dodge_magic',5}}, 13}",
	[30253.0] = "{30253, \"控制\", 3025, {{10,1302},{1,781200}}, 3, 1, {{'hit_magic',5}}, 25}",
	[40164.0] = "{40164, \"抗暴\", 4016, {{10,720},{1,432000}}, 4, 1, {{'tenacity',5}}, 16}",
	[10074.0] = "{10074, \"暴伤\", 1007, {{10,208},{1,124800}}, 4, 1, {{'crit_ratio',10}}, 7}",
	[40195.0] = "{40195, \"速度\", 4019, {{10,1026},{1,615600}}, 5, 1, {{'speed',4}}, 19}",
	[20146.0] = "{20146, \"伤害加成\", 2014, {{10,740},{1,444000}}, 6, 1, {{'dam',5}}, 14}",
	[20402.0] = "{20402, \"攻击比\", 2040, {{10,2484},{1,1738800}}, 2, 1, {{'atk_per',5}}, 40}",
	[10105.0] = "{10105, \"速度\", 1010, {{10,378},{1,226800}}, 5, 1, {{'speed',4}}, 10}",
	[10322.0] = "{10322, \"攻击比\", 1032, {{10,1692},{1,1184400}}, 2, 1, {{'atk_per',5}}, 32}",
	[10233.0] = "{10233, \"暴击\", 1023, {{10,1134},{1,680400}}, 3, 1, {{'crit_rate',5}}, 23}",
	[20336.0] = "{20336, \"伤害加成\", 2033, {{10,2980},{1,1788000}}, 6, 1, {{'dam',5}}, 33}",
	[20111.0] = "{20111, \"气血比\", 2011, {{10,250},{1,150000}}, 1, 1, {{'hp_max_per',5}}, 11}",
	[10353.0] = "{10353, \"暴击\", 1035, {{10,2310},{1,1386000}}, 3, 1, {{'crit_rate',5}}, 35}",
	[20014.0] = "{20014, \"暴伤\", 2001, {{10,16},{1,9600}}, 4, 1, {{'crit_ratio',10}}, 1}",
	[30344.0] = "{30344, \"抗暴\", 3034, {{10,2512},{1,1507200}}, 4, 1, {{'tenacity',5}}, 34}",
	[30311.0] = "{30311, \"气血比\", 3031, {{10,1330},{1,798000}}, 1, 1, {{'hp_max_per',5}}, 31}",
	[40024.0] = "{40024, \"抗暴\", 4002, {{10,48},{1,28800}}, 4, 1, {{'tenacity',5}}, 2}",
	[20045.0] = "{20045, \"速度\", 2004, {{10,126},{1,75600}}, 5, 1, {{'speed',4}}, 4}",
	[40055.0] = "{40055, \"速度\", 4005, {{10,162},{1,97200}}, 5, 1, {{'speed',4}}, 5}",
	[30055.0] = "{30055, \"速度\", 3005, {{10,162},{1,97200}}, 5, 1, {{'speed',4}}, 5}",
	[40086.0] = "{40086, \"魔法免伤\", 4008, {{10,300},{1,180000}}, 6, 1, {{'res_s',5}}, 8}",
	[10384.0] = "{10384, \"暴伤\", 1038, {{10,3024},{1,1814400}}, 4, 1, {{'crit_ratio',10}}, 38}",
	[30022.0] = "{30022, \"攻击比\", 3002, {{10,36},{1,25200}}, 2, 1, {{'atk_per',5}}, 2}",
	[30245.0] = "{30245, \"速度\", 3024, {{10,1566},{1,939600}}, 5, 1, {{'speed',4}}, 24}",
	[30212.0] = "{30212, \"攻击比\", 3021, {{10,828},{1,579600}}, 2, 1, {{'atk_per',5}}, 21}",
	[40241.0] = "{40241, \"气血比\", 4024, {{10,870},{1,522000}}, 1, 1, {{'hp_max_per',5}}, 24}",
	[40272.0] = "{40272, \"攻击比\", 4027, {{10,1260},{1,882000}}, 2, 1, {{'atk_per',5}}, 27}",
	[10101.0] = "{10101, \"气血比\", 1010, {{10,210},{1,126000}}, 1, 1, {{'hp_max_per',5}}, 10}",
	[40303.0] = "{40303, \"抗控\", 4030, {{10,1750},{1,1050000}}, 3, 1, {{'dodge_magic',5}}, 30}",
	[30402.0] = "{30402, \"攻击比\", 3040, {{10,2484},{1,1738800}}, 2, 1, {{'atk_per',5}}, 40}",
	[40334.0] = "{40334, \"抗暴\", 4033, {{10,2384},{1,1430400}}, 4, 1, {{'tenacity',5}}, 33}",
	[40365.0] = "{40365, \"速度\", 4036, {{10,3114},{1,1868400}}, 5, 1, {{'speed',4}}, 36}",
	[20103.0] = "{20103, \"暴击\", 2010, {{10,294},{1,176400}}, 3, 1, {{'crit_rate',5}}, 10}",
	[40396.0] = "{40396, \"魔法免伤\", 4039, {{10,3940},{1,2364000}}, 6, 1, {{'res_s',5}}, 39}",
	[10132.0] = "{10132, \"攻击比\", 1013, {{10,396},{1,277200}}, 2, 1, {{'atk_per',5}}, 13}",
	[30113.0] = "{30113, \"控制\", 3011, {{10,350},{1,210000}}, 3, 1, {{'hit_magic',5}}, 11}",
	[30303.0] = "{30303, \"控制\", 3030, {{10,1750},{1,1050000}}, 3, 1, {{'hit_magic',5}}, 30}",
	[20262.0] = "{20262, \"攻击比\", 2026, {{10,1188},{1,831600}}, 2, 1, {{'atk_per',5}}, 26}",
	[10035.0] = "{10035, \"速度\", 1003, {{10,90},{1,54000}}, 5, 1, {{'speed',4}}, 3}",
	[20293.0] = "{20293, \"暴击\", 2029, {{10,1638},{1,982800}}, 3, 1, {{'crit_rate',5}}, 29}",
	[20196.0] = "{20196, \"伤害加成\", 2019, {{10,1140},{1,684000}}, 6, 1, {{'dam',5}}, 19}",
	[30014.0] = "{30014, \"抗暴\", 3001, {{10,16},{1,9600}}, 4, 1, {{'tenacity',5}}, 1}",
	[40132.0] = "{40132, \"攻击比\", 4013, {{10,396},{1,277200}}, 2, 1, {{'atk_per',5}}, 13}",
	[10066.0] = "{10066, \"伤害加成\", 1006, {{10,220},{1,132000}}, 6, 1, {{'dam',5}}, 6}",
	[40163.0] = "{40163, \"抗控\", 4016, {{10,630},{1,378000}}, 3, 1, {{'dodge_magic',5}}, 16}",
	[40194.0] = "{40194, \"抗暴\", 4019, {{10,912},{1,547200}}, 4, 1, {{'tenacity',5}}, 19}"
}
Config.GuildSkillData.data_info_group_length = 160
Config.GuildSkillData.data_info_group = {
	[4040] = {
		{
			id = 40401,
			seq = 1
		},
		{
			id = 40402,
			seq = 2
		},
		{
			id = 40403,
			seq = 3
		},
		{
			id = 40404,
			seq = 4
		},
		{
			id = 40405,
			seq = 5
		},
		{
			id = 40406,
			seq = 6
		}
	},
	[4039] = {
		{
			id = 40391,
			seq = 1
		},
		{
			id = 40392,
			seq = 2
		},
		{
			id = 40393,
			seq = 3
		},
		{
			id = 40394,
			seq = 4
		},
		{
			id = 40395,
			seq = 5
		},
		{
			id = 40396,
			seq = 6
		}
	},
	[4038] = {
		{
			id = 40381,
			seq = 1
		},
		{
			id = 40382,
			seq = 2
		},
		{
			id = 40383,
			seq = 3
		},
		{
			id = 40384,
			seq = 4
		},
		{
			id = 40385,
			seq = 5
		},
		{
			id = 40386,
			seq = 6
		}
	},
	[4037] = {
		{
			id = 40371,
			seq = 1
		},
		{
			id = 40372,
			seq = 2
		},
		{
			id = 40373,
			seq = 3
		},
		{
			id = 40374,
			seq = 4
		},
		{
			id = 40375,
			seq = 5
		},
		{
			id = 40376,
			seq = 6
		}
	},
	[4036] = {
		{
			id = 40361,
			seq = 1
		},
		{
			id = 40362,
			seq = 2
		},
		{
			id = 40363,
			seq = 3
		},
		{
			id = 40364,
			seq = 4
		},
		{
			id = 40365,
			seq = 5
		},
		{
			id = 40366,
			seq = 6
		}
	},
	[4035] = {
		{
			id = 40351,
			seq = 1
		},
		{
			id = 40352,
			seq = 2
		},
		{
			id = 40353,
			seq = 3
		},
		{
			id = 40354,
			seq = 4
		},
		{
			id = 40355,
			seq = 5
		},
		{
			id = 40356,
			seq = 6
		}
	},
	[4034] = {
		{
			id = 40341,
			seq = 1
		},
		{
			id = 40342,
			seq = 2
		},
		{
			id = 40343,
			seq = 3
		},
		{
			id = 40344,
			seq = 4
		},
		{
			id = 40345,
			seq = 5
		},
		{
			id = 40346,
			seq = 6
		}
	},
	[4033] = {
		{
			id = 40331,
			seq = 1
		},
		{
			id = 40332,
			seq = 2
		},
		{
			id = 40333,
			seq = 3
		},
		{
			id = 40334,
			seq = 4
		},
		{
			id = 40335,
			seq = 5
		},
		{
			id = 40336,
			seq = 6
		}
	},
	[4032] = {
		{
			id = 40321,
			seq = 1
		},
		{
			id = 40322,
			seq = 2
		},
		{
			id = 40323,
			seq = 3
		},
		{
			id = 40324,
			seq = 4
		},
		{
			id = 40325,
			seq = 5
		},
		{
			id = 40326,
			seq = 6
		}
	},
	[4031] = {
		{
			id = 40311,
			seq = 1
		},
		{
			id = 40312,
			seq = 2
		},
		{
			id = 40313,
			seq = 3
		},
		{
			id = 40314,
			seq = 4
		},
		{
			id = 40315,
			seq = 5
		},
		{
			id = 40316,
			seq = 6
		}
	},
	[4030] = {
		{
			id = 40301,
			seq = 1
		},
		{
			id = 40302,
			seq = 2
		},
		{
			id = 40303,
			seq = 3
		},
		{
			id = 40304,
			seq = 4
		},
		{
			id = 40305,
			seq = 5
		},
		{
			id = 40306,
			seq = 6
		}
	},
	[4029] = {
		{
			id = 40291,
			seq = 1
		},
		{
			id = 40292,
			seq = 2
		},
		{
			id = 40293,
			seq = 3
		},
		{
			id = 40294,
			seq = 4
		},
		{
			id = 40295,
			seq = 5
		},
		{
			id = 40296,
			seq = 6
		}
	},
	[4028] = {
		{
			id = 40281,
			seq = 1
		},
		{
			id = 40282,
			seq = 2
		},
		{
			id = 40283,
			seq = 3
		},
		{
			id = 40284,
			seq = 4
		},
		{
			id = 40285,
			seq = 5
		},
		{
			id = 40286,
			seq = 6
		}
	},
	[4027] = {
		{
			id = 40271,
			seq = 1
		},
		{
			id = 40272,
			seq = 2
		},
		{
			id = 40273,
			seq = 3
		},
		{
			id = 40274,
			seq = 4
		},
		{
			id = 40275,
			seq = 5
		},
		{
			id = 40276,
			seq = 6
		}
	},
	[4026] = {
		{
			id = 40261,
			seq = 1
		},
		{
			id = 40262,
			seq = 2
		},
		{
			id = 40263,
			seq = 3
		},
		{
			id = 40264,
			seq = 4
		},
		{
			id = 40265,
			seq = 5
		},
		{
			id = 40266,
			seq = 6
		}
	},
	[4025] = {
		{
			id = 40251,
			seq = 1
		},
		{
			id = 40252,
			seq = 2
		},
		{
			id = 40253,
			seq = 3
		},
		{
			id = 40254,
			seq = 4
		},
		{
			id = 40255,
			seq = 5
		},
		{
			id = 40256,
			seq = 6
		}
	},
	[4024] = {
		{
			id = 40241,
			seq = 1
		},
		{
			id = 40242,
			seq = 2
		},
		{
			id = 40243,
			seq = 3
		},
		{
			id = 40244,
			seq = 4
		},
		{
			id = 40245,
			seq = 5
		},
		{
			id = 40246,
			seq = 6
		}
	},
	[4023] = {
		{
			id = 40231,
			seq = 1
		},
		{
			id = 40232,
			seq = 2
		},
		{
			id = 40233,
			seq = 3
		},
		{
			id = 40234,
			seq = 4
		},
		{
			id = 40235,
			seq = 5
		},
		{
			id = 40236,
			seq = 6
		}
	},
	[4022] = {
		{
			id = 40221,
			seq = 1
		},
		{
			id = 40222,
			seq = 2
		},
		{
			id = 40223,
			seq = 3
		},
		{
			id = 40224,
			seq = 4
		},
		{
			id = 40225,
			seq = 5
		},
		{
			id = 40226,
			seq = 6
		}
	},
	[4021] = {
		{
			id = 40211,
			seq = 1
		},
		{
			id = 40212,
			seq = 2
		},
		{
			id = 40213,
			seq = 3
		},
		{
			id = 40214,
			seq = 4
		},
		{
			id = 40215,
			seq = 5
		},
		{
			id = 40216,
			seq = 6
		}
	},
	[4020] = {
		{
			id = 40201,
			seq = 1
		},
		{
			id = 40202,
			seq = 2
		},
		{
			id = 40203,
			seq = 3
		},
		{
			id = 40204,
			seq = 4
		},
		{
			id = 40205,
			seq = 5
		},
		{
			id = 40206,
			seq = 6
		}
	},
	[4019] = {
		{
			id = 40191,
			seq = 1
		},
		{
			id = 40192,
			seq = 2
		},
		{
			id = 40193,
			seq = 3
		},
		{
			id = 40194,
			seq = 4
		},
		{
			id = 40195,
			seq = 5
		},
		{
			id = 40196,
			seq = 6
		}
	},
	[4018] = {
		{
			id = 40181,
			seq = 1
		},
		{
			id = 40182,
			seq = 2
		},
		{
			id = 40183,
			seq = 3
		},
		{
			id = 40184,
			seq = 4
		},
		{
			id = 40185,
			seq = 5
		},
		{
			id = 40186,
			seq = 6
		}
	},
	[4017] = {
		{
			id = 40171,
			seq = 1
		},
		{
			id = 40172,
			seq = 2
		},
		{
			id = 40173,
			seq = 3
		},
		{
			id = 40174,
			seq = 4
		},
		{
			id = 40175,
			seq = 5
		},
		{
			id = 40176,
			seq = 6
		}
	},
	[4016] = {
		{
			id = 40161,
			seq = 1
		},
		{
			id = 40162,
			seq = 2
		},
		{
			id = 40163,
			seq = 3
		},
		{
			id = 40164,
			seq = 4
		},
		{
			id = 40165,
			seq = 5
		},
		{
			id = 40166,
			seq = 6
		}
	},
	[4015] = {
		{
			id = 40151,
			seq = 1
		},
		{
			id = 40152,
			seq = 2
		},
		{
			id = 40153,
			seq = 3
		},
		{
			id = 40154,
			seq = 4
		},
		{
			id = 40155,
			seq = 5
		},
		{
			id = 40156,
			seq = 6
		}
	},
	[4014] = {
		{
			id = 40141,
			seq = 1
		},
		{
			id = 40142,
			seq = 2
		},
		{
			id = 40143,
			seq = 3
		},
		{
			id = 40144,
			seq = 4
		},
		{
			id = 40145,
			seq = 5
		},
		{
			id = 40146,
			seq = 6
		}
	},
	[4013] = {
		{
			id = 40131,
			seq = 1
		},
		{
			id = 40132,
			seq = 2
		},
		{
			id = 40133,
			seq = 3
		},
		{
			id = 40134,
			seq = 4
		},
		{
			id = 40135,
			seq = 5
		},
		{
			id = 40136,
			seq = 6
		}
	},
	[4012] = {
		{
			id = 40121,
			seq = 1
		},
		{
			id = 40122,
			seq = 2
		},
		{
			id = 40123,
			seq = 3
		},
		{
			id = 40124,
			seq = 4
		},
		{
			id = 40125,
			seq = 5
		},
		{
			id = 40126,
			seq = 6
		}
	},
	[4011] = {
		{
			id = 40111,
			seq = 1
		},
		{
			id = 40112,
			seq = 2
		},
		{
			id = 40113,
			seq = 3
		},
		{
			id = 40114,
			seq = 4
		},
		{
			id = 40115,
			seq = 5
		},
		{
			id = 40116,
			seq = 6
		}
	},
	[4010] = {
		{
			id = 40101,
			seq = 1
		},
		{
			id = 40102,
			seq = 2
		},
		{
			id = 40103,
			seq = 3
		},
		{
			id = 40104,
			seq = 4
		},
		{
			id = 40105,
			seq = 5
		},
		{
			id = 40106,
			seq = 6
		}
	},
	[4009] = {
		{
			id = 40091,
			seq = 1
		},
		{
			id = 40092,
			seq = 2
		},
		{
			id = 40093,
			seq = 3
		},
		{
			id = 40094,
			seq = 4
		},
		{
			id = 40095,
			seq = 5
		},
		{
			id = 40096,
			seq = 6
		}
	},
	[4008] = {
		{
			id = 40081,
			seq = 1
		},
		{
			id = 40082,
			seq = 2
		},
		{
			id = 40083,
			seq = 3
		},
		{
			id = 40084,
			seq = 4
		},
		{
			id = 40085,
			seq = 5
		},
		{
			id = 40086,
			seq = 6
		}
	},
	[4007] = {
		{
			id = 40071,
			seq = 1
		},
		{
			id = 40072,
			seq = 2
		},
		{
			id = 40073,
			seq = 3
		},
		{
			id = 40074,
			seq = 4
		},
		{
			id = 40075,
			seq = 5
		},
		{
			id = 40076,
			seq = 6
		}
	},
	[4006] = {
		{
			id = 40061,
			seq = 1
		},
		{
			id = 40062,
			seq = 2
		},
		{
			id = 40063,
			seq = 3
		},
		{
			id = 40064,
			seq = 4
		},
		{
			id = 40065,
			seq = 5
		},
		{
			id = 40066,
			seq = 6
		}
	},
	[4005] = {
		{
			id = 40051,
			seq = 1
		},
		{
			id = 40052,
			seq = 2
		},
		{
			id = 40053,
			seq = 3
		},
		{
			id = 40054,
			seq = 4
		},
		{
			id = 40055,
			seq = 5
		},
		{
			id = 40056,
			seq = 6
		}
	},
	[4004] = {
		{
			id = 40041,
			seq = 1
		},
		{
			id = 40042,
			seq = 2
		},
		{
			id = 40043,
			seq = 3
		},
		{
			id = 40044,
			seq = 4
		},
		{
			id = 40045,
			seq = 5
		},
		{
			id = 40046,
			seq = 6
		}
	},
	[4003] = {
		{
			id = 40031,
			seq = 1
		},
		{
			id = 40032,
			seq = 2
		},
		{
			id = 40033,
			seq = 3
		},
		{
			id = 40034,
			seq = 4
		},
		{
			id = 40035,
			seq = 5
		},
		{
			id = 40036,
			seq = 6
		}
	},
	[4002] = {
		{
			id = 40021,
			seq = 1
		},
		{
			id = 40022,
			seq = 2
		},
		{
			id = 40023,
			seq = 3
		},
		{
			id = 40024,
			seq = 4
		},
		{
			id = 40025,
			seq = 5
		},
		{
			id = 40026,
			seq = 6
		}
	},
	[4001] = {
		{
			id = 40011,
			seq = 1
		},
		{
			id = 40012,
			seq = 2
		},
		{
			id = 40013,
			seq = 3
		},
		{
			id = 40014,
			seq = 4
		},
		{
			id = 40015,
			seq = 5
		},
		{
			id = 40016,
			seq = 6
		}
	},
	[3040] = {
		{
			id = 30401,
			seq = 1
		},
		{
			id = 30402,
			seq = 2
		},
		{
			id = 30403,
			seq = 3
		},
		{
			id = 30404,
			seq = 4
		},
		{
			id = 30405,
			seq = 5
		},
		{
			id = 30406,
			seq = 6
		}
	},
	[3039] = {
		{
			id = 30391,
			seq = 1
		},
		{
			id = 30392,
			seq = 2
		},
		{
			id = 30393,
			seq = 3
		},
		{
			id = 30394,
			seq = 4
		},
		{
			id = 30395,
			seq = 5
		},
		{
			id = 30396,
			seq = 6
		}
	},
	[3038] = {
		{
			id = 30381,
			seq = 1
		},
		{
			id = 30382,
			seq = 2
		},
		{
			id = 30383,
			seq = 3
		},
		{
			id = 30384,
			seq = 4
		},
		{
			id = 30385,
			seq = 5
		},
		{
			id = 30386,
			seq = 6
		}
	},
	[3037] = {
		{
			id = 30371,
			seq = 1
		},
		{
			id = 30372,
			seq = 2
		},
		{
			id = 30373,
			seq = 3
		},
		{
			id = 30374,
			seq = 4
		},
		{
			id = 30375,
			seq = 5
		},
		{
			id = 30376,
			seq = 6
		}
	},
	[3036] = {
		{
			id = 30361,
			seq = 1
		},
		{
			id = 30362,
			seq = 2
		},
		{
			id = 30363,
			seq = 3
		},
		{
			id = 30364,
			seq = 4
		},
		{
			id = 30365,
			seq = 5
		},
		{
			id = 30366,
			seq = 6
		}
	},
	[3035] = {
		{
			id = 30351,
			seq = 1
		},
		{
			id = 30352,
			seq = 2
		},
		{
			id = 30353,
			seq = 3
		},
		{
			id = 30354,
			seq = 4
		},
		{
			id = 30355,
			seq = 5
		},
		{
			id = 30356,
			seq = 6
		}
	},
	[3034] = {
		{
			id = 30341,
			seq = 1
		},
		{
			id = 30342,
			seq = 2
		},
		{
			id = 30343,
			seq = 3
		},
		{
			id = 30344,
			seq = 4
		},
		{
			id = 30345,
			seq = 5
		},
		{
			id = 30346,
			seq = 6
		}
	},
	[3033] = {
		{
			id = 30331,
			seq = 1
		},
		{
			id = 30332,
			seq = 2
		},
		{
			id = 30333,
			seq = 3
		},
		{
			id = 30334,
			seq = 4
		},
		{
			id = 30335,
			seq = 5
		},
		{
			id = 30336,
			seq = 6
		}
	},
	[3032] = {
		{
			id = 30321,
			seq = 1
		},
		{
			id = 30322,
			seq = 2
		},
		{
			id = 30323,
			seq = 3
		},
		{
			id = 30324,
			seq = 4
		},
		{
			id = 30325,
			seq = 5
		},
		{
			id = 30326,
			seq = 6
		}
	},
	[3031] = {
		{
			id = 30311,
			seq = 1
		},
		{
			id = 30312,
			seq = 2
		},
		{
			id = 30313,
			seq = 3
		},
		{
			id = 30314,
			seq = 4
		},
		{
			id = 30315,
			seq = 5
		},
		{
			id = 30316,
			seq = 6
		}
	},
	[3030] = {
		{
			id = 30301,
			seq = 1
		},
		{
			id = 30302,
			seq = 2
		},
		{
			id = 30303,
			seq = 3
		},
		{
			id = 30304,
			seq = 4
		},
		{
			id = 30305,
			seq = 5
		},
		{
			id = 30306,
			seq = 6
		}
	},
	[3029] = {
		{
			id = 30291,
			seq = 1
		},
		{
			id = 30292,
			seq = 2
		},
		{
			id = 30293,
			seq = 3
		},
		{
			id = 30294,
			seq = 4
		},
		{
			id = 30295,
			seq = 5
		},
		{
			id = 30296,
			seq = 6
		}
	},
	[3028] = {
		{
			id = 30281,
			seq = 1
		},
		{
			id = 30282,
			seq = 2
		},
		{
			id = 30283,
			seq = 3
		},
		{
			id = 30284,
			seq = 4
		},
		{
			id = 30285,
			seq = 5
		},
		{
			id = 30286,
			seq = 6
		}
	},
	[3027] = {
		{
			id = 30271,
			seq = 1
		},
		{
			id = 30272,
			seq = 2
		},
		{
			id = 30273,
			seq = 3
		},
		{
			id = 30274,
			seq = 4
		},
		{
			id = 30275,
			seq = 5
		},
		{
			id = 30276,
			seq = 6
		}
	},
	[3026] = {
		{
			id = 30261,
			seq = 1
		},
		{
			id = 30262,
			seq = 2
		},
		{
			id = 30263,
			seq = 3
		},
		{
			id = 30264,
			seq = 4
		},
		{
			id = 30265,
			seq = 5
		},
		{
			id = 30266,
			seq = 6
		}
	},
	[3025] = {
		{
			id = 30251,
			seq = 1
		},
		{
			id = 30252,
			seq = 2
		},
		{
			id = 30253,
			seq = 3
		},
		{
			id = 30254,
			seq = 4
		},
		{
			id = 30255,
			seq = 5
		},
		{
			id = 30256,
			seq = 6
		}
	},
	[3024] = {
		{
			id = 30241,
			seq = 1
		},
		{
			id = 30242,
			seq = 2
		},
		{
			id = 30243,
			seq = 3
		},
		{
			id = 30244,
			seq = 4
		},
		{
			id = 30245,
			seq = 5
		},
		{
			id = 30246,
			seq = 6
		}
	},
	[3023] = {
		{
			id = 30231,
			seq = 1
		},
		{
			id = 30232,
			seq = 2
		},
		{
			id = 30233,
			seq = 3
		},
		{
			id = 30234,
			seq = 4
		},
		{
			id = 30235,
			seq = 5
		},
		{
			id = 30236,
			seq = 6
		}
	},
	[3022] = {
		{
			id = 30221,
			seq = 1
		},
		{
			id = 30222,
			seq = 2
		},
		{
			id = 30223,
			seq = 3
		},
		{
			id = 30224,
			seq = 4
		},
		{
			id = 30225,
			seq = 5
		},
		{
			id = 30226,
			seq = 6
		}
	},
	[3021] = {
		{
			id = 30211,
			seq = 1
		},
		{
			id = 30212,
			seq = 2
		},
		{
			id = 30213,
			seq = 3
		},
		{
			id = 30214,
			seq = 4
		},
		{
			id = 30215,
			seq = 5
		},
		{
			id = 30216,
			seq = 6
		}
	},
	[3020] = {
		{
			id = 30201,
			seq = 1
		},
		{
			id = 30202,
			seq = 2
		},
		{
			id = 30203,
			seq = 3
		},
		{
			id = 30204,
			seq = 4
		},
		{
			id = 30205,
			seq = 5
		},
		{
			id = 30206,
			seq = 6
		}
	},
	[3019] = {
		{
			id = 30191,
			seq = 1
		},
		{
			id = 30192,
			seq = 2
		},
		{
			id = 30193,
			seq = 3
		},
		{
			id = 30194,
			seq = 4
		},
		{
			id = 30195,
			seq = 5
		},
		{
			id = 30196,
			seq = 6
		}
	},
	[3018] = {
		{
			id = 30181,
			seq = 1
		},
		{
			id = 30182,
			seq = 2
		},
		{
			id = 30183,
			seq = 3
		},
		{
			id = 30184,
			seq = 4
		},
		{
			id = 30185,
			seq = 5
		},
		{
			id = 30186,
			seq = 6
		}
	},
	[3017] = {
		{
			id = 30171,
			seq = 1
		},
		{
			id = 30172,
			seq = 2
		},
		{
			id = 30173,
			seq = 3
		},
		{
			id = 30174,
			seq = 4
		},
		{
			id = 30175,
			seq = 5
		},
		{
			id = 30176,
			seq = 6
		}
	},
	[3016] = {
		{
			id = 30161,
			seq = 1
		},
		{
			id = 30162,
			seq = 2
		},
		{
			id = 30163,
			seq = 3
		},
		{
			id = 30164,
			seq = 4
		},
		{
			id = 30165,
			seq = 5
		},
		{
			id = 30166,
			seq = 6
		}
	},
	[3015] = {
		{
			id = 30151,
			seq = 1
		},
		{
			id = 30152,
			seq = 2
		},
		{
			id = 30153,
			seq = 3
		},
		{
			id = 30154,
			seq = 4
		},
		{
			id = 30155,
			seq = 5
		},
		{
			id = 30156,
			seq = 6
		}
	},
	[3014] = {
		{
			id = 30141,
			seq = 1
		},
		{
			id = 30142,
			seq = 2
		},
		{
			id = 30143,
			seq = 3
		},
		{
			id = 30144,
			seq = 4
		},
		{
			id = 30145,
			seq = 5
		},
		{
			id = 30146,
			seq = 6
		}
	},
	[3013] = {
		{
			id = 30131,
			seq = 1
		},
		{
			id = 30132,
			seq = 2
		},
		{
			id = 30133,
			seq = 3
		},
		{
			id = 30134,
			seq = 4
		},
		{
			id = 30135,
			seq = 5
		},
		{
			id = 30136,
			seq = 6
		}
	},
	[3012] = {
		{
			id = 30121,
			seq = 1
		},
		{
			id = 30122,
			seq = 2
		},
		{
			id = 30123,
			seq = 3
		},
		{
			id = 30124,
			seq = 4
		},
		{
			id = 30125,
			seq = 5
		},
		{
			id = 30126,
			seq = 6
		}
	},
	[3011] = {
		{
			id = 30111,
			seq = 1
		},
		{
			id = 30112,
			seq = 2
		},
		{
			id = 30113,
			seq = 3
		},
		{
			id = 30114,
			seq = 4
		},
		{
			id = 30115,
			seq = 5
		},
		{
			id = 30116,
			seq = 6
		}
	},
	[3010] = {
		{
			id = 30101,
			seq = 1
		},
		{
			id = 30102,
			seq = 2
		},
		{
			id = 30103,
			seq = 3
		},
		{
			id = 30104,
			seq = 4
		},
		{
			id = 30105,
			seq = 5
		},
		{
			id = 30106,
			seq = 6
		}
	},
	[3009] = {
		{
			id = 30091,
			seq = 1
		},
		{
			id = 30092,
			seq = 2
		},
		{
			id = 30093,
			seq = 3
		},
		{
			id = 30094,
			seq = 4
		},
		{
			id = 30095,
			seq = 5
		},
		{
			id = 30096,
			seq = 6
		}
	},
	[3008] = {
		{
			id = 30081,
			seq = 1
		},
		{
			id = 30082,
			seq = 2
		},
		{
			id = 30083,
			seq = 3
		},
		{
			id = 30084,
			seq = 4
		},
		{
			id = 30085,
			seq = 5
		},
		{
			id = 30086,
			seq = 6
		}
	},
	[3007] = {
		{
			id = 30071,
			seq = 1
		},
		{
			id = 30072,
			seq = 2
		},
		{
			id = 30073,
			seq = 3
		},
		{
			id = 30074,
			seq = 4
		},
		{
			id = 30075,
			seq = 5
		},
		{
			id = 30076,
			seq = 6
		}
	},
	[3006] = {
		{
			id = 30061,
			seq = 1
		},
		{
			id = 30062,
			seq = 2
		},
		{
			id = 30063,
			seq = 3
		},
		{
			id = 30064,
			seq = 4
		},
		{
			id = 30065,
			seq = 5
		},
		{
			id = 30066,
			seq = 6
		}
	},
	[3005] = {
		{
			id = 30051,
			seq = 1
		},
		{
			id = 30052,
			seq = 2
		},
		{
			id = 30053,
			seq = 3
		},
		{
			id = 30054,
			seq = 4
		},
		{
			id = 30055,
			seq = 5
		},
		{
			id = 30056,
			seq = 6
		}
	},
	[3004] = {
		{
			id = 30041,
			seq = 1
		},
		{
			id = 30042,
			seq = 2
		},
		{
			id = 30043,
			seq = 3
		},
		{
			id = 30044,
			seq = 4
		},
		{
			id = 30045,
			seq = 5
		},
		{
			id = 30046,
			seq = 6
		}
	},
	[3003] = {
		{
			id = 30031,
			seq = 1
		},
		{
			id = 30032,
			seq = 2
		},
		{
			id = 30033,
			seq = 3
		},
		{
			id = 30034,
			seq = 4
		},
		{
			id = 30035,
			seq = 5
		},
		{
			id = 30036,
			seq = 6
		}
	},
	[3002] = {
		{
			id = 30021,
			seq = 1
		},
		{
			id = 30022,
			seq = 2
		},
		{
			id = 30023,
			seq = 3
		},
		{
			id = 30024,
			seq = 4
		},
		{
			id = 30025,
			seq = 5
		},
		{
			id = 30026,
			seq = 6
		}
	},
	[3001] = {
		{
			id = 30011,
			seq = 1
		},
		{
			id = 30012,
			seq = 2
		},
		{
			id = 30013,
			seq = 3
		},
		{
			id = 30014,
			seq = 4
		},
		{
			id = 30015,
			seq = 5
		},
		{
			id = 30016,
			seq = 6
		}
	},
	[2040] = {
		{
			id = 20401,
			seq = 1
		},
		{
			id = 20402,
			seq = 2
		},
		{
			id = 20403,
			seq = 3
		},
		{
			id = 20404,
			seq = 4
		},
		{
			id = 20405,
			seq = 5
		},
		{
			id = 20406,
			seq = 6
		}
	},
	[2039] = {
		{
			id = 20391,
			seq = 1
		},
		{
			id = 20392,
			seq = 2
		},
		{
			id = 20393,
			seq = 3
		},
		{
			id = 20394,
			seq = 4
		},
		{
			id = 20395,
			seq = 5
		},
		{
			id = 20396,
			seq = 6
		}
	},
	[2038] = {
		{
			id = 20381,
			seq = 1
		},
		{
			id = 20382,
			seq = 2
		},
		{
			id = 20383,
			seq = 3
		},
		{
			id = 20384,
			seq = 4
		},
		{
			id = 20385,
			seq = 5
		},
		{
			id = 20386,
			seq = 6
		}
	},
	[2037] = {
		{
			id = 20371,
			seq = 1
		},
		{
			id = 20372,
			seq = 2
		},
		{
			id = 20373,
			seq = 3
		},
		{
			id = 20374,
			seq = 4
		},
		{
			id = 20375,
			seq = 5
		},
		{
			id = 20376,
			seq = 6
		}
	},
	[2036] = {
		{
			id = 20361,
			seq = 1
		},
		{
			id = 20362,
			seq = 2
		},
		{
			id = 20363,
			seq = 3
		},
		{
			id = 20364,
			seq = 4
		},
		{
			id = 20365,
			seq = 5
		},
		{
			id = 20366,
			seq = 6
		}
	},
	[2035] = {
		{
			id = 20351,
			seq = 1
		},
		{
			id = 20352,
			seq = 2
		},
		{
			id = 20353,
			seq = 3
		},
		{
			id = 20354,
			seq = 4
		},
		{
			id = 20355,
			seq = 5
		},
		{
			id = 20356,
			seq = 6
		}
	},
	[2034] = {
		{
			id = 20341,
			seq = 1
		},
		{
			id = 20342,
			seq = 2
		},
		{
			id = 20343,
			seq = 3
		},
		{
			id = 20344,
			seq = 4
		},
		{
			id = 20345,
			seq = 5
		},
		{
			id = 20346,
			seq = 6
		}
	},
	[2033] = {
		{
			id = 20331,
			seq = 1
		},
		{
			id = 20332,
			seq = 2
		},
		{
			id = 20333,
			seq = 3
		},
		{
			id = 20334,
			seq = 4
		},
		{
			id = 20335,
			seq = 5
		},
		{
			id = 20336,
			seq = 6
		}
	},
	[2032] = {
		{
			id = 20321,
			seq = 1
		},
		{
			id = 20322,
			seq = 2
		},
		{
			id = 20323,
			seq = 3
		},
		{
			id = 20324,
			seq = 4
		},
		{
			id = 20325,
			seq = 5
		},
		{
			id = 20326,
			seq = 6
		}
	},
	[2031] = {
		{
			id = 20311,
			seq = 1
		},
		{
			id = 20312,
			seq = 2
		},
		{
			id = 20313,
			seq = 3
		},
		{
			id = 20314,
			seq = 4
		},
		{
			id = 20315,
			seq = 5
		},
		{
			id = 20316,
			seq = 6
		}
	},
	[2030] = {
		{
			id = 20301,
			seq = 1
		},
		{
			id = 20302,
			seq = 2
		},
		{
			id = 20303,
			seq = 3
		},
		{
			id = 20304,
			seq = 4
		},
		{
			id = 20305,
			seq = 5
		},
		{
			id = 20306,
			seq = 6
		}
	},
	[2029] = {
		{
			id = 20291,
			seq = 1
		},
		{
			id = 20292,
			seq = 2
		},
		{
			id = 20293,
			seq = 3
		},
		{
			id = 20294,
			seq = 4
		},
		{
			id = 20295,
			seq = 5
		},
		{
			id = 20296,
			seq = 6
		}
	},
	[2028] = {
		{
			id = 20281,
			seq = 1
		},
		{
			id = 20282,
			seq = 2
		},
		{
			id = 20283,
			seq = 3
		},
		{
			id = 20284,
			seq = 4
		},
		{
			id = 20285,
			seq = 5
		},
		{
			id = 20286,
			seq = 6
		}
	},
	[2027] = {
		{
			id = 20271,
			seq = 1
		},
		{
			id = 20272,
			seq = 2
		},
		{
			id = 20273,
			seq = 3
		},
		{
			id = 20274,
			seq = 4
		},
		{
			id = 20275,
			seq = 5
		},
		{
			id = 20276,
			seq = 6
		}
	},
	[2026] = {
		{
			id = 20261,
			seq = 1
		},
		{
			id = 20262,
			seq = 2
		},
		{
			id = 20263,
			seq = 3
		},
		{
			id = 20264,
			seq = 4
		},
		{
			id = 20265,
			seq = 5
		},
		{
			id = 20266,
			seq = 6
		}
	},
	[2025] = {
		{
			id = 20251,
			seq = 1
		},
		{
			id = 20252,
			seq = 2
		},
		{
			id = 20253,
			seq = 3
		},
		{
			id = 20254,
			seq = 4
		},
		{
			id = 20255,
			seq = 5
		},
		{
			id = 20256,
			seq = 6
		}
	},
	[2024] = {
		{
			id = 20241,
			seq = 1
		},
		{
			id = 20242,
			seq = 2
		},
		{
			id = 20243,
			seq = 3
		},
		{
			id = 20244,
			seq = 4
		},
		{
			id = 20245,
			seq = 5
		},
		{
			id = 20246,
			seq = 6
		}
	},
	[2023] = {
		{
			id = 20231,
			seq = 1
		},
		{
			id = 20232,
			seq = 2
		},
		{
			id = 20233,
			seq = 3
		},
		{
			id = 20234,
			seq = 4
		},
		{
			id = 20235,
			seq = 5
		},
		{
			id = 20236,
			seq = 6
		}
	},
	[2022] = {
		{
			id = 20221,
			seq = 1
		},
		{
			id = 20222,
			seq = 2
		},
		{
			id = 20223,
			seq = 3
		},
		{
			id = 20224,
			seq = 4
		},
		{
			id = 20225,
			seq = 5
		},
		{
			id = 20226,
			seq = 6
		}
	},
	[2021] = {
		{
			id = 20211,
			seq = 1
		},
		{
			id = 20212,
			seq = 2
		},
		{
			id = 20213,
			seq = 3
		},
		{
			id = 20214,
			seq = 4
		},
		{
			id = 20215,
			seq = 5
		},
		{
			id = 20216,
			seq = 6
		}
	},
	[2020] = {
		{
			id = 20201,
			seq = 1
		},
		{
			id = 20202,
			seq = 2
		},
		{
			id = 20203,
			seq = 3
		},
		{
			id = 20204,
			seq = 4
		},
		{
			id = 20205,
			seq = 5
		},
		{
			id = 20206,
			seq = 6
		}
	},
	[2019] = {
		{
			id = 20191,
			seq = 1
		},
		{
			id = 20192,
			seq = 2
		},
		{
			id = 20193,
			seq = 3
		},
		{
			id = 20194,
			seq = 4
		},
		{
			id = 20195,
			seq = 5
		},
		{
			id = 20196,
			seq = 6
		}
	},
	[2018] = {
		{
			id = 20181,
			seq = 1
		},
		{
			id = 20182,
			seq = 2
		},
		{
			id = 20183,
			seq = 3
		},
		{
			id = 20184,
			seq = 4
		},
		{
			id = 20185,
			seq = 5
		},
		{
			id = 20186,
			seq = 6
		}
	},
	[2017] = {
		{
			id = 20171,
			seq = 1
		},
		{
			id = 20172,
			seq = 2
		},
		{
			id = 20173,
			seq = 3
		},
		{
			id = 20174,
			seq = 4
		},
		{
			id = 20175,
			seq = 5
		},
		{
			id = 20176,
			seq = 6
		}
	},
	[2016] = {
		{
			id = 20161,
			seq = 1
		},
		{
			id = 20162,
			seq = 2
		},
		{
			id = 20163,
			seq = 3
		},
		{
			id = 20164,
			seq = 4
		},
		{
			id = 20165,
			seq = 5
		},
		{
			id = 20166,
			seq = 6
		}
	},
	[2015] = {
		{
			id = 20151,
			seq = 1
		},
		{
			id = 20152,
			seq = 2
		},
		{
			id = 20153,
			seq = 3
		},
		{
			id = 20154,
			seq = 4
		},
		{
			id = 20155,
			seq = 5
		},
		{
			id = 20156,
			seq = 6
		}
	},
	[2014] = {
		{
			id = 20141,
			seq = 1
		},
		{
			id = 20142,
			seq = 2
		},
		{
			id = 20143,
			seq = 3
		},
		{
			id = 20144,
			seq = 4
		},
		{
			id = 20145,
			seq = 5
		},
		{
			id = 20146,
			seq = 6
		}
	},
	[2013] = {
		{
			id = 20131,
			seq = 1
		},
		{
			id = 20132,
			seq = 2
		},
		{
			id = 20133,
			seq = 3
		},
		{
			id = 20134,
			seq = 4
		},
		{
			id = 20135,
			seq = 5
		},
		{
			id = 20136,
			seq = 6
		}
	},
	[2012] = {
		{
			id = 20121,
			seq = 1
		},
		{
			id = 20122,
			seq = 2
		},
		{
			id = 20123,
			seq = 3
		},
		{
			id = 20124,
			seq = 4
		},
		{
			id = 20125,
			seq = 5
		},
		{
			id = 20126,
			seq = 6
		}
	},
	[2011] = {
		{
			id = 20111,
			seq = 1
		},
		{
			id = 20112,
			seq = 2
		},
		{
			id = 20113,
			seq = 3
		},
		{
			id = 20114,
			seq = 4
		},
		{
			id = 20115,
			seq = 5
		},
		{
			id = 20116,
			seq = 6
		}
	},
	[2010] = {
		{
			id = 20101,
			seq = 1
		},
		{
			id = 20102,
			seq = 2
		},
		{
			id = 20103,
			seq = 3
		},
		{
			id = 20104,
			seq = 4
		},
		{
			id = 20105,
			seq = 5
		},
		{
			id = 20106,
			seq = 6
		}
	},
	[2009] = {
		{
			id = 20091,
			seq = 1
		},
		{
			id = 20092,
			seq = 2
		},
		{
			id = 20093,
			seq = 3
		},
		{
			id = 20094,
			seq = 4
		},
		{
			id = 20095,
			seq = 5
		},
		{
			id = 20096,
			seq = 6
		}
	},
	[2008] = {
		{
			id = 20081,
			seq = 1
		},
		{
			id = 20082,
			seq = 2
		},
		{
			id = 20083,
			seq = 3
		},
		{
			id = 20084,
			seq = 4
		},
		{
			id = 20085,
			seq = 5
		},
		{
			id = 20086,
			seq = 6
		}
	},
	[2007] = {
		{
			id = 20071,
			seq = 1
		},
		{
			id = 20072,
			seq = 2
		},
		{
			id = 20073,
			seq = 3
		},
		{
			id = 20074,
			seq = 4
		},
		{
			id = 20075,
			seq = 5
		},
		{
			id = 20076,
			seq = 6
		}
	},
	[2006] = {
		{
			id = 20061,
			seq = 1
		},
		{
			id = 20062,
			seq = 2
		},
		{
			id = 20063,
			seq = 3
		},
		{
			id = 20064,
			seq = 4
		},
		{
			id = 20065,
			seq = 5
		},
		{
			id = 20066,
			seq = 6
		}
	},
	[2005] = {
		{
			id = 20051,
			seq = 1
		},
		{
			id = 20052,
			seq = 2
		},
		{
			id = 20053,
			seq = 3
		},
		{
			id = 20054,
			seq = 4
		},
		{
			id = 20055,
			seq = 5
		},
		{
			id = 20056,
			seq = 6
		}
	},
	[2004] = {
		{
			id = 20041,
			seq = 1
		},
		{
			id = 20042,
			seq = 2
		},
		{
			id = 20043,
			seq = 3
		},
		{
			id = 20044,
			seq = 4
		},
		{
			id = 20045,
			seq = 5
		},
		{
			id = 20046,
			seq = 6
		}
	},
	[2003] = {
		{
			id = 20031,
			seq = 1
		},
		{
			id = 20032,
			seq = 2
		},
		{
			id = 20033,
			seq = 3
		},
		{
			id = 20034,
			seq = 4
		},
		{
			id = 20035,
			seq = 5
		},
		{
			id = 20036,
			seq = 6
		}
	},
	[2002] = {
		{
			id = 20021,
			seq = 1
		},
		{
			id = 20022,
			seq = 2
		},
		{
			id = 20023,
			seq = 3
		},
		{
			id = 20024,
			seq = 4
		},
		{
			id = 20025,
			seq = 5
		},
		{
			id = 20026,
			seq = 6
		}
	},
	[2001] = {
		{
			id = 20011,
			seq = 1
		},
		{
			id = 20012,
			seq = 2
		},
		{
			id = 20013,
			seq = 3
		},
		{
			id = 20014,
			seq = 4
		},
		{
			id = 20015,
			seq = 5
		},
		{
			id = 20016,
			seq = 6
		}
	},
	[1040] = {
		{
			id = 10401,
			seq = 1
		},
		{
			id = 10402,
			seq = 2
		},
		{
			id = 10403,
			seq = 3
		},
		{
			id = 10404,
			seq = 4
		},
		{
			id = 10405,
			seq = 5
		},
		{
			id = 10406,
			seq = 6
		}
	},
	[1039] = {
		{
			id = 10391,
			seq = 1
		},
		{
			id = 10392,
			seq = 2
		},
		{
			id = 10393,
			seq = 3
		},
		{
			id = 10394,
			seq = 4
		},
		{
			id = 10395,
			seq = 5
		},
		{
			id = 10396,
			seq = 6
		}
	},
	[1038] = {
		{
			id = 10381,
			seq = 1
		},
		{
			id = 10382,
			seq = 2
		},
		{
			id = 10383,
			seq = 3
		},
		{
			id = 10384,
			seq = 4
		},
		{
			id = 10385,
			seq = 5
		},
		{
			id = 10386,
			seq = 6
		}
	},
	[1037] = {
		{
			id = 10371,
			seq = 1
		},
		{
			id = 10372,
			seq = 2
		},
		{
			id = 10373,
			seq = 3
		},
		{
			id = 10374,
			seq = 4
		},
		{
			id = 10375,
			seq = 5
		},
		{
			id = 10376,
			seq = 6
		}
	},
	[1036] = {
		{
			id = 10361,
			seq = 1
		},
		{
			id = 10362,
			seq = 2
		},
		{
			id = 10363,
			seq = 3
		},
		{
			id = 10364,
			seq = 4
		},
		{
			id = 10365,
			seq = 5
		},
		{
			id = 10366,
			seq = 6
		}
	},
	[1035] = {
		{
			id = 10351,
			seq = 1
		},
		{
			id = 10352,
			seq = 2
		},
		{
			id = 10353,
			seq = 3
		},
		{
			id = 10354,
			seq = 4
		},
		{
			id = 10355,
			seq = 5
		},
		{
			id = 10356,
			seq = 6
		}
	},
	[1034] = {
		{
			id = 10341,
			seq = 1
		},
		{
			id = 10342,
			seq = 2
		},
		{
			id = 10343,
			seq = 3
		},
		{
			id = 10344,
			seq = 4
		},
		{
			id = 10345,
			seq = 5
		},
		{
			id = 10346,
			seq = 6
		}
	},
	[1033] = {
		{
			id = 10331,
			seq = 1
		},
		{
			id = 10332,
			seq = 2
		},
		{
			id = 10333,
			seq = 3
		},
		{
			id = 10334,
			seq = 4
		},
		{
			id = 10335,
			seq = 5
		},
		{
			id = 10336,
			seq = 6
		}
	},
	[1032] = {
		{
			id = 10321,
			seq = 1
		},
		{
			id = 10322,
			seq = 2
		},
		{
			id = 10323,
			seq = 3
		},
		{
			id = 10324,
			seq = 4
		},
		{
			id = 10325,
			seq = 5
		},
		{
			id = 10326,
			seq = 6
		}
	},
	[1031] = {
		{
			id = 10311,
			seq = 1
		},
		{
			id = 10312,
			seq = 2
		},
		{
			id = 10313,
			seq = 3
		},
		{
			id = 10314,
			seq = 4
		},
		{
			id = 10315,
			seq = 5
		},
		{
			id = 10316,
			seq = 6
		}
	},
	[1030] = {
		{
			id = 10301,
			seq = 1
		},
		{
			id = 10302,
			seq = 2
		},
		{
			id = 10303,
			seq = 3
		},
		{
			id = 10304,
			seq = 4
		},
		{
			id = 10305,
			seq = 5
		},
		{
			id = 10306,
			seq = 6
		}
	},
	[1029] = {
		{
			id = 10291,
			seq = 1
		},
		{
			id = 10292,
			seq = 2
		},
		{
			id = 10293,
			seq = 3
		},
		{
			id = 10294,
			seq = 4
		},
		{
			id = 10295,
			seq = 5
		},
		{
			id = 10296,
			seq = 6
		}
	},
	[1028] = {
		{
			id = 10281,
			seq = 1
		},
		{
			id = 10282,
			seq = 2
		},
		{
			id = 10283,
			seq = 3
		},
		{
			id = 10284,
			seq = 4
		},
		{
			id = 10285,
			seq = 5
		},
		{
			id = 10286,
			seq = 6
		}
	},
	[1027] = {
		{
			id = 10271,
			seq = 1
		},
		{
			id = 10272,
			seq = 2
		},
		{
			id = 10273,
			seq = 3
		},
		{
			id = 10274,
			seq = 4
		},
		{
			id = 10275,
			seq = 5
		},
		{
			id = 10276,
			seq = 6
		}
	},
	[1026] = {
		{
			id = 10261,
			seq = 1
		},
		{
			id = 10262,
			seq = 2
		},
		{
			id = 10263,
			seq = 3
		},
		{
			id = 10264,
			seq = 4
		},
		{
			id = 10265,
			seq = 5
		},
		{
			id = 10266,
			seq = 6
		}
	},
	[1025] = {
		{
			id = 10251,
			seq = 1
		},
		{
			id = 10252,
			seq = 2
		},
		{
			id = 10253,
			seq = 3
		},
		{
			id = 10254,
			seq = 4
		},
		{
			id = 10255,
			seq = 5
		},
		{
			id = 10256,
			seq = 6
		}
	},
	[1024] = {
		{
			id = 10241,
			seq = 1
		},
		{
			id = 10242,
			seq = 2
		},
		{
			id = 10243,
			seq = 3
		},
		{
			id = 10244,
			seq = 4
		},
		{
			id = 10245,
			seq = 5
		},
		{
			id = 10246,
			seq = 6
		}
	},
	[1023] = {
		{
			id = 10231,
			seq = 1
		},
		{
			id = 10232,
			seq = 2
		},
		{
			id = 10233,
			seq = 3
		},
		{
			id = 10234,
			seq = 4
		},
		{
			id = 10235,
			seq = 5
		},
		{
			id = 10236,
			seq = 6
		}
	},
	[1022] = {
		{
			id = 10221,
			seq = 1
		},
		{
			id = 10222,
			seq = 2
		},
		{
			id = 10223,
			seq = 3
		},
		{
			id = 10224,
			seq = 4
		},
		{
			id = 10225,
			seq = 5
		},
		{
			id = 10226,
			seq = 6
		}
	},
	[1021] = {
		{
			id = 10211,
			seq = 1
		},
		{
			id = 10212,
			seq = 2
		},
		{
			id = 10213,
			seq = 3
		},
		{
			id = 10214,
			seq = 4
		},
		{
			id = 10215,
			seq = 5
		},
		{
			id = 10216,
			seq = 6
		}
	},
	[1020] = {
		{
			id = 10201,
			seq = 1
		},
		{
			id = 10202,
			seq = 2
		},
		{
			id = 10203,
			seq = 3
		},
		{
			id = 10204,
			seq = 4
		},
		{
			id = 10205,
			seq = 5
		},
		{
			id = 10206,
			seq = 6
		}
	},
	[1019] = {
		{
			id = 10191,
			seq = 1
		},
		{
			id = 10192,
			seq = 2
		},
		{
			id = 10193,
			seq = 3
		},
		{
			id = 10194,
			seq = 4
		},
		{
			id = 10195,
			seq = 5
		},
		{
			id = 10196,
			seq = 6
		}
	},
	[1018] = {
		{
			id = 10181,
			seq = 1
		},
		{
			id = 10182,
			seq = 2
		},
		{
			id = 10183,
			seq = 3
		},
		{
			id = 10184,
			seq = 4
		},
		{
			id = 10185,
			seq = 5
		},
		{
			id = 10186,
			seq = 6
		}
	},
	[1017] = {
		{
			id = 10171,
			seq = 1
		},
		{
			id = 10172,
			seq = 2
		},
		{
			id = 10173,
			seq = 3
		},
		{
			id = 10174,
			seq = 4
		},
		{
			id = 10175,
			seq = 5
		},
		{
			id = 10176,
			seq = 6
		}
	},
	[1016] = {
		{
			id = 10161,
			seq = 1
		},
		{
			id = 10162,
			seq = 2
		},
		{
			id = 10163,
			seq = 3
		},
		{
			id = 10164,
			seq = 4
		},
		{
			id = 10165,
			seq = 5
		},
		{
			id = 10166,
			seq = 6
		}
	},
	[1015] = {
		{
			id = 10151,
			seq = 1
		},
		{
			id = 10152,
			seq = 2
		},
		{
			id = 10153,
			seq = 3
		},
		{
			id = 10154,
			seq = 4
		},
		{
			id = 10155,
			seq = 5
		},
		{
			id = 10156,
			seq = 6
		}
	},
	[1014] = {
		{
			id = 10141,
			seq = 1
		},
		{
			id = 10142,
			seq = 2
		},
		{
			id = 10143,
			seq = 3
		},
		{
			id = 10144,
			seq = 4
		},
		{
			id = 10145,
			seq = 5
		},
		{
			id = 10146,
			seq = 6
		}
	},
	[1013] = {
		{
			id = 10131,
			seq = 1
		},
		{
			id = 10132,
			seq = 2
		},
		{
			id = 10133,
			seq = 3
		},
		{
			id = 10134,
			seq = 4
		},
		{
			id = 10135,
			seq = 5
		},
		{
			id = 10136,
			seq = 6
		}
	},
	[1012] = {
		{
			id = 10121,
			seq = 1
		},
		{
			id = 10122,
			seq = 2
		},
		{
			id = 10123,
			seq = 3
		},
		{
			id = 10124,
			seq = 4
		},
		{
			id = 10125,
			seq = 5
		},
		{
			id = 10126,
			seq = 6
		}
	},
	[1011] = {
		{
			id = 10111,
			seq = 1
		},
		{
			id = 10112,
			seq = 2
		},
		{
			id = 10113,
			seq = 3
		},
		{
			id = 10114,
			seq = 4
		},
		{
			id = 10115,
			seq = 5
		},
		{
			id = 10116,
			seq = 6
		}
	},
	[1010] = {
		{
			id = 10101,
			seq = 1
		},
		{
			id = 10102,
			seq = 2
		},
		{
			id = 10103,
			seq = 3
		},
		{
			id = 10104,
			seq = 4
		},
		{
			id = 10105,
			seq = 5
		},
		{
			id = 10106,
			seq = 6
		}
	},
	[1009] = {
		{
			id = 10091,
			seq = 1
		},
		{
			id = 10092,
			seq = 2
		},
		{
			id = 10093,
			seq = 3
		},
		{
			id = 10094,
			seq = 4
		},
		{
			id = 10095,
			seq = 5
		},
		{
			id = 10096,
			seq = 6
		}
	},
	[1008] = {
		{
			id = 10081,
			seq = 1
		},
		{
			id = 10082,
			seq = 2
		},
		{
			id = 10083,
			seq = 3
		},
		{
			id = 10084,
			seq = 4
		},
		{
			id = 10085,
			seq = 5
		},
		{
			id = 10086,
			seq = 6
		}
	},
	[1007] = {
		{
			id = 10071,
			seq = 1
		},
		{
			id = 10072,
			seq = 2
		},
		{
			id = 10073,
			seq = 3
		},
		{
			id = 10074,
			seq = 4
		},
		{
			id = 10075,
			seq = 5
		},
		{
			id = 10076,
			seq = 6
		}
	},
	[1006] = {
		{
			id = 10061,
			seq = 1
		},
		{
			id = 10062,
			seq = 2
		},
		{
			id = 10063,
			seq = 3
		},
		{
			id = 10064,
			seq = 4
		},
		{
			id = 10065,
			seq = 5
		},
		{
			id = 10066,
			seq = 6
		}
	},
	[1005] = {
		{
			id = 10051,
			seq = 1
		},
		{
			id = 10052,
			seq = 2
		},
		{
			id = 10053,
			seq = 3
		},
		{
			id = 10054,
			seq = 4
		},
		{
			id = 10055,
			seq = 5
		},
		{
			id = 10056,
			seq = 6
		}
	},
	[1004] = {
		{
			id = 10041,
			seq = 1
		},
		{
			id = 10042,
			seq = 2
		},
		{
			id = 10043,
			seq = 3
		},
		{
			id = 10044,
			seq = 4
		},
		{
			id = 10045,
			seq = 5
		},
		{
			id = 10046,
			seq = 6
		}
	},
	[1003] = {
		{
			id = 10031,
			seq = 1
		},
		{
			id = 10032,
			seq = 2
		},
		{
			id = 10033,
			seq = 3
		},
		{
			id = 10034,
			seq = 4
		},
		{
			id = 10035,
			seq = 5
		},
		{
			id = 10036,
			seq = 6
		}
	},
	[1002] = {
		{
			id = 10021,
			seq = 1
		},
		{
			id = 10022,
			seq = 2
		},
		{
			id = 10023,
			seq = 3
		},
		{
			id = 10024,
			seq = 4
		},
		{
			id = 10025,
			seq = 5
		},
		{
			id = 10026,
			seq = 6
		}
	},
	[1001] = {
		{
			id = 10011,
			seq = 1
		},
		{
			id = 10012,
			seq = 2
		},
		{
			id = 10013,
			seq = 3
		},
		{
			id = 10014,
			seq = 4
		},
		{
			id = 10015,
			seq = 5
		},
		{
			id = 10016,
			seq = 6
		}
	}
}
Config.GuildSkillData.data_pvp_attr_info_length = 656
Config.GuildSkillData.data_pvp_attr_info_cache = {}

function Config.GuildSkillData.data_pvp_attr_info(slot0)
	if Config.GuildSkillData.data_pvp_attr_info_cache[slot0] == nil then
		if not Config.GuildSkillData.data_pvp_attr_info_table[slot0] then
			return
		end

		if not loadstring(string.format("return %s", slot1))() then
			return
		end

		Config.GuildSkillData.data_pvp_attr_info_cache[slot0] = {
			id = slot1[1],
			lev = slot1[2],
			need_lev = slot1[3],
			loss = slot1[4],
			power = slot1[5],
			return_res = slot1[6],
			desc = slot1[7],
			client_attr = slot1[8]
		}
	end

	return Config.GuildSkillData.data_pvp_attr_info_cache[slot0]
end

Config.GuildSkillData.data_pvp_attr_info_table = {
	["30004_28"] = "{30004, 28, 19, {{10,3192},{10006,7}}, 108520, {{10,65112},{10006,111}}, \"抗暴\", {{'tenacity',84}}}",
	["30003_24"] = "{30003, 24, 15, {{10,2904},{10006,6}}, 88440, {{10,53064},{10006,84}}, \"生命\", {{'hp_max_per',120}}}",
	["10004_28"] = "{10004, 28, 19, {{10,3192},{10006,7}}, 108520, {{10,65112},{10006,111}}, \"暴伤\", {{'crit_ratio',140}}}",
	["20001_10"] = "{20001, 10, 1, {{10,1740},{10006,4}}, 28656, {{10,15920},{10006,15}}, \"对坦克增伤\", {{'dam',50}}}",
	["30001_5"] = "{30001, 5, 0, {{10,1600},{10006,2}}, 13860, {{10,7700},{10006,5}}, \"对战士免伤\", {{'res_p',25}}}",
	["30003_36"] = "{30003, 36, 27, {{10,3960},{10006,10}}, 155560, {{10,93336},{10006,180}}, \"生命\", {{'hp_max_per',180}}}",
	["20004_12"] = "{20004, 12, 3, {{10,2184},{10006,4}}, 38880, {{10,23328},{10006,23}}, \"暴击\", {{'crit_rate',36}}}",
	["10003_36"] = "{10003, 36, 27, {{10,3960},{10006,10}}, 155560, {{10,93336},{10006,180}}, \"攻击\", {{'atk_per',180}}}",
	["30002_20"] = "{30002, 20, 11, {{10,2180},{10006,6}}, 63252, {{10,35140},{10006,60}}, \"对法师免伤\", {{'res_p',100}}}",
	["40001_13"] = "{40001, 13, 4, {{10,1860},{10006,4}}, 38268, {{10,21260},{10006,27}}, \"对战士免伤\", {{'res_p',65}}}",
	["20001_35"] = "{20001, 35, 26, {{10,3220},{10006,10}}, 134208, {{10,74560},{10006,170}}, \"对坦克增伤\", {{'dam',175}}}",
	["20001_37"] = "{20001, 37, 28, {{10,3380},{10006,10}}, 145944, {{10,81080},{10006,190}}, \"对坦克增伤\", {{'dam',185}}}",
	["20001_30"] = "{20001, 30, 21, {{10,2820},{10006,9}}, 107388, {{10,59660},{10006,125}}, \"对坦克增伤\", {{'dam',150}}}",
	["20001_38"] = "{20001, 38, 29, {{10,3460},{10006,10}}, 152028, {{10,84460},{10006,200}}, \"对坦克增伤\", {{'dam',190}}}",
	["10001_37"] = "{10001, 37, 28, {{10,3380},{10006,10}}, 145944, {{10,81080},{10006,190}}, \"对坦克增伤\", {{'dam',185}}}",
	["30004_35"] = "{30004, 35, 26, {{10,3864},{10006,10}}, 149120, {{10,89472},{10006,170}}, \"抗暴\", {{'tenacity',105}}}",
	["40004_38"] = "{40004, 38, 29, {{10,4152},{10006,10}}, 168920, {{10,101352},{10006,200}}, \"治疗\", {{'cure',190}}}",
	["40001_15"] = "{40001, 15, 6, {{10,1940},{10006,5}}, 45036, {{10,25020},{10006,35}}, \"对战士免伤\", {{'res_p',75}}}",
	["20004_38"] = "{20004, 38, 29, {{10,4152},{10006,10}}, 168920, {{10,101352},{10006,200}}, \"暴击\", {{'crit_rate',114}}}",
	["20004_4"] = "{20004, 4, 0, {{10,1896},{10006,1}}, 12240, {{10,7344},{10006,4}}, \"暴击\", {{'crit_rate',12}}}",
	["10001_20"] = "{10001, 20, 11, {{10,2180},{10006,6}}, 63252, {{10,35140},{10006,60}}, \"对坦克增伤\", {{'dam',100}}}",
	["20003_26"] = "{20003, 26, 17, {{10,3048},{10006,7}}, 98240, {{10,58944},{10006,97}}, \"攻击\", {{'atk_per',130}}}",
	["40001_27"] = "{40001, 27, 18, {{10,2600},{10006,7}}, 92988, {{10,51660},{10006,104}}, \"对战士免伤\", {{'res_p',135}}}",
	["20002_36"] = "{20002, 36, 27, {{10,3300},{10006,10}}, 140004, {{10,77780},{10006,180}}, \"对辅助增伤\", {{'dam',180}}}",
	["30002_0"] = "{30002, 0, 0, {{10,1500},{10006,1}}, 0, {}, \"对法师免伤\", {{'res_p',0}}}",
	["30001_8"] = "{30001, 8, 0, {{10,1660},{10006,2}}, 22608, {{10,12560},{10006,11}}, \"对战士免伤\", {{'res_p',40}}}",
	["30001_20"] = "{30001, 20, 11, {{10,2180},{10006,6}}, 63252, {{10,35140},{10006,60}}, \"对战士免伤\", {{'res_p',100}}}",
	["40001_39"] = "{40001, 39, 30, {{10,3560},{10006,10}}, 158256, {{10,87920},{10006,210}}, \"对战士免伤\", {{'res_p',195}}}",
	["30001_9"] = "{30001, 9, 0, {{10,1700},{10006,2}}, 25596, {{10,14220},{10006,13}}, \"对战士免伤\", {{'res_p',45}}}",
	["20004_24"] = "{20004, 24, 15, {{10,2904},{10006,6}}, 88440, {{10,53064},{10006,84}}, \"暴击\", {{'crit_rate',72}}}",
	["20001_3"] = "{20001, 3, 0, {{10,1560},{10006,1}}, 8208, {{10,4560},{10006,3}}, \"对坦克增伤\", {{'dam',15}}}",
	["30002_5"] = "{30002, 5, 0, {{10,1600},{10006,2}}, 13860, {{10,7700},{10006,5}}, \"对法师免伤\", {{'res_p',25}}}",
	["20001_27"] = "{20001, 27, 18, {{10,2600},{10006,7}}, 92988, {{10,51660},{10006,104}}, \"对坦克增伤\", {{'dam',135}}}",
	["40001_38"] = "{40001, 38, 29, {{10,3460},{10006,10}}, 152028, {{10,84460},{10006,200}}, \"对战士免伤\", {{'res_p',190}}}",
	["30003_0"] = "{30003, 0, 0, {{10,1800},{10006,1}}, 0, {}, \"生命\", {{'hp_max_per',0}}}",
	["30004_11"] = "{30004, 11, 2, {{10,2136},{10006,4}}, 35320, {{10,21192},{10006,19}}, \"抗暴\", {{'tenacity',33}}}",
	["30001_33"] = "{30001, 33, 24, {{10,3060},{10006,9}}, 123048, {{10,68360},{10006,152}}, \"对战士免伤\", {{'res_p',165}}}",
	["40001_11"] = "{40001, 11, 2, {{10,1780},{10006,4}}, 31788, {{10,17660},{10006,19}}, \"对战士免伤\", {{'res_p',55}}}",
	["30002_24"] = "{30002, 24, 15, {{10,2420},{10006,6}}, 79596, {{10,44220},{10006,84}}, \"对法师免伤\", {{'res_p',120}}}",
	["20002_31"] = "{20002, 31, 22, {{10,2900},{10006,9}}, 112464, {{10,62480},{10006,134}}, \"对辅助增伤\", {{'dam',155}}}",
	["10002_24"] = "{10002, 24, 15, {{10,2420},{10006,6}}, 79596, {{10,44220},{10006,84}}, \"对辅助增伤\", {{'dam',120}}}",
	["20004_16"] = "{20004, 16, 7, {{10,2376},{10006,5}}, 53920, {{10,32352},{10006,40}}, \"暴击\", {{'crit_rate',48}}}",
	["40003_16"] = "{40003, 16, 7, {{10,2376},{10006,5}}, 53920, {{10,32352},{10006,40}}, \"生命\", {{'hp_max_per',80}}}",
	["20004_0"] = "{20004, 0, 0, {{10,1800},{10006,1}}, 0, {}, \"暴击\", {{'crit_rate',0}}}",
	["20003_16"] = "{20003, 16, 7, {{10,2376},{10006,5}}, 53920, {{10,32352},{10006,40}}, \"攻击\", {{'atk_per',80}}}",
	["20002_33"] = "{20002, 33, 24, {{10,3060},{10006,9}}, 123048, {{10,68360},{10006,152}}, \"对辅助增伤\", {{'dam',165}}}",
	["40001_23"] = "{40001, 23, 14, {{10,2360},{10006,6}}, 75348, {{10,41860},{10006,78}}, \"对战士免伤\", {{'res_p',115}}}",
	["30001_29"] = "{30001, 29, 20, {{10,2740},{10006,7}}, 102456, {{10,56920},{10006,118}}, \"对战士免伤\", {{'res_p',145}}}",
	["20004_36"] = "{20004, 36, 27, {{10,3960},{10006,10}}, 155560, {{10,93336},{10006,180}}, \"暴击\", {{'crit_rate',108}}}",
	["10001_29"] = "{10001, 29, 20, {{10,2740},{10006,7}}, 102456, {{10,56920},{10006,118}}, \"对坦克增伤\", {{'dam',145}}}",
	["40002_34"] = "{40002, 34, 25, {{10,3140},{10006,9}}, 128556, {{10,71420},{10006,161}}, \"对法师免伤\", {{'res_p',170}}}",
	["20001_11"] = "{20001, 11, 2, {{10,1780},{10006,4}}, 31788, {{10,17660},{10006,19}}, \"对坦克增伤\", {{'dam',55}}}",
	["20002_34"] = "{20002, 34, 25, {{10,3140},{10006,9}}, 128556, {{10,71420},{10006,161}}, \"对辅助增伤\", {{'dam',170}}}",
	["10001_40"] = "{10001, 40, 0, {}, 164664, {{10,91480},{10006,220}}, \"对坦克增伤\", {{'dam',200}}}",
	["40003_8"] = "{40003, 8, 0, {{10,1992},{10006,2}}, 25120, {{10,15072},{10006,11}}, \"生命\", {{'hp_max_per',40}}}",
	["30002_9"] = "{30002, 9, 0, {{10,1700},{10006,2}}, 25596, {{10,14220},{10006,13}}, \"对法师免伤\", {{'res_p',45}}}",
	["20001_23"] = "{20001, 23, 14, {{10,2360},{10006,6}}, 75348, {{10,41860},{10006,78}}, \"对坦克增伤\", {{'dam',115}}}",
	["20002_7"] = "{20002, 7, 0, {{10,1640},{10006,2}}, 19656, {{10,10920},{10006,9}}, \"对辅助增伤\", {{'dam',35}}}",
	["30001_2"] = "{30001, 2, 0, {{10,1540},{10006,1}}, 5436, {{10,3020},{10006,2}}, \"对战士免伤\", {{'res_p',10}}}",
	["30001_40"] = "{30001, 40, 0, {}, 164664, {{10,91480},{10006,220}}, \"对战士免伤\", {{'res_p',200}}}",
	["30002_38"] = "{30002, 38, 29, {{10,3460},{10006,10}}, 152028, {{10,84460},{10006,200}}, \"对法师免伤\", {{'res_p',190}}}",
	["20004_39"] = "{20004, 39, 30, {{10,4272},{10006,10}}, 175840, {{10,105504},{10006,210}}, \"暴击\", {{'crit_rate',117}}}",
	["40002_38"] = "{40002, 38, 29, {{10,3460},{10006,10}}, 152028, {{10,84460},{10006,200}}, \"对法师免伤\", {{'res_p',190}}}",
	["30003_20"] = "{30003, 20, 11, {{10,2616},{10006,6}}, 70280, {{10,42168},{10006,60}}, \"生命\", {{'hp_max_per',100}}}",
	["30001_13"] = "{30001, 13, 4, {{10,1860},{10006,4}}, 38268, {{10,21260},{10006,27}}, \"对战士免伤\", {{'res_p',65}}}",
	["30001_14"] = "{30001, 14, 5, {{10,1900},{10006,4}}, 41616, {{10,23120},{10006,31}}, \"对战士免伤\", {{'res_p',70}}}",
	["30001_16"] = "{30001, 16, 7, {{10,1980},{10006,5}}, 48528, {{10,26960},{10006,40}}, \"对战士免伤\", {{'res_p',80}}}",
	["20001_19"] = "{20001, 19, 10, {{10,2120},{10006,5}}, 59436, {{10,33020},{10006,55}}, \"对坦克增伤\", {{'dam',95}}}",
	["30002_36"] = "{30002, 36, 27, {{10,3300},{10006,10}}, 140004, {{10,77780},{10006,180}}, \"对法师免伤\", {{'res_p',180}}}",
	["40002_21"] = "{40002, 21, 12, {{10,2240},{10006,6}}, 67176, {{10,37320},{10006,66}}, \"对法师免伤\", {{'res_p',105}}}",
	["30001_27"] = "{30001, 27, 18, {{10,2600},{10006,7}}, 92988, {{10,51660},{10006,104}}, \"对战士免伤\", {{'res_p',135}}}",
	["40001_22"] = "{40001, 22, 13, {{10,2300},{10006,6}}, 71208, {{10,39560},{10006,72}}, \"对战士免伤\", {{'res_p',110}}}",
	["30001_31"] = "{30001, 31, 22, {{10,2900},{10006,9}}, 112464, {{10,62480},{10006,134}}, \"对战士免伤\", {{'res_p',155}}}",
	["30004_6"] = "{30004, 6, 0, {{10,1944},{10006,2}}, 18600, {{10,11160},{10006,7}}, \"抗暴\", {{'tenacity',18}}}",
	["30003_28"] = "{30003, 28, 19, {{10,3192},{10006,7}}, 108520, {{10,65112},{10006,111}}, \"生命\", {{'hp_max_per',140}}}",
	["30004_37"] = "{30004, 37, 28, {{10,4056},{10006,10}}, 162160, {{10,97296},{10006,190}}, \"抗暴\", {{'tenacity',111}}}",
	["40001_32"] = "{40001, 32, 23, {{10,2980},{10006,9}}, 117684, {{10,65380},{10006,143}}, \"对战士免伤\", {{'res_p',160}}}",
	["40002_22"] = "{40002, 22, 13, {{10,2300},{10006,6}}, 71208, {{10,39560},{10006,72}}, \"对法师免伤\", {{'res_p',110}}}",
	["20004_3"] = "{20004, 3, 0, {{10,1872},{10006,1}}, 9120, {{10,5472},{10006,3}}, \"暴击\", {{'crit_rate',9}}}",
	["20002_22"] = "{20002, 22, 13, {{10,2300},{10006,6}}, 71208, {{10,39560},{10006,72}}, \"对辅助增伤\", {{'dam',110}}}",
	["30002_8"] = "{30002, 8, 0, {{10,1660},{10006,2}}, 22608, {{10,12560},{10006,11}}, \"对法师免伤\", {{'res_p',40}}}",
	["30001_23"] = "{30001, 23, 14, {{10,2360},{10006,6}}, 75348, {{10,41860},{10006,78}}, \"对战士免伤\", {{'res_p',115}}}",
	["30004_1"] = "{30004, 1, 0, {{10,1824},{10006,1}}, 3000, {{10,1800},{10006,1}}, \"抗暴\", {{'tenacity',3}}}",
	["30002_12"] = "{30002, 12, 3, {{10,1820},{10006,4}}, 34992, {{10,19440},{10006,23}}, \"对法师免伤\", {{'res_p',60}}}",
	["30002_16"] = "{30002, 16, 7, {{10,1980},{10006,5}}, 48528, {{10,26960},{10006,40}}, \"对法师免伤\", {{'res_p',80}}}",
	["20001_31"] = "{20001, 31, 22, {{10,2900},{10006,9}}, 112464, {{10,62480},{10006,134}}, \"对坦克增伤\", {{'dam',155}}}",
	["40001_31"] = "{40001, 31, 22, {{10,2900},{10006,9}}, 112464, {{10,62480},{10006,134}}, \"对战士免伤\", {{'res_p',155}}}",
	["30002_32"] = "{30002, 32, 23, {{10,2980},{10006,9}}, 117684, {{10,65380},{10006,143}}, \"对法师免伤\", {{'res_p',160}}}",
	["40002_14"] = "{40002, 14, 5, {{10,1900},{10006,4}}, 41616, {{10,23120},{10006,31}}, \"对法师免伤\", {{'res_p',70}}}",
	["40004_3"] = "{40004, 3, 0, {{10,1872},{10006,1}}, 9120, {{10,5472},{10006,3}}, \"治疗\", {{'cure',15}}}",
	["20002_14"] = "{20002, 14, 5, {{10,1900},{10006,4}}, 41616, {{10,23120},{10006,31}}, \"对辅助增伤\", {{'dam',70}}}",
	["30004_34"] = "{30004, 34, 25, {{10,3768},{10006,9}}, 142840, {{10,85704},{10006,161}}, \"抗暴\", {{'tenacity',102}}}",
	["30002_17"] = "{30002, 17, 8, {{10,2020},{10006,5}}, 52092, {{10,28940},{10006,45}}, \"对法师免伤\", {{'res_p',85}}}",
	["40003_20"] = "{40003, 20, 11, {{10,2616},{10006,6}}, 70280, {{10,42168},{10006,60}}, \"生命\", {{'hp_max_per',100}}}",
	["30003_8"] = "{30003, 8, 0, {{10,1992},{10006,2}}, 25120, {{10,15072},{10006,11}}, \"生命\", {{'hp_max_per',40}}}",
	["40003_3"] = "{40003, 3, 0, {{10,1872},{10006,1}}, 9120, {{10,5472},{10006,3}}, \"生命\", {{'hp_max_per',15}}}",
	["40004_13"] = "{40004, 13, 4, {{10,2232},{10006,4}}, 42520, {{10,25512},{10006,27}}, \"治疗\", {{'cure',65}}}",
	["30002_1"] = "{30002, 1, 0, {{10,1520},{10006,1}}, 2700, {{10,1500},{10006,1}}, \"对法师免伤\", {{'res_p',5}}}",
	["30004_15"] = "{30004, 15, 6, {{10,2328},{10006,5}}, 50040, {{10,30024},{10006,35}}, \"抗暴\", {{'tenacity',45}}}",
	["20003_3"] = "{20003, 3, 0, {{10,1872},{10006,1}}, 9120, {{10,5472},{10006,3}}, \"攻击\", {{'atk_per',15}}}",
	["30004_13"] = "{30004, 13, 4, {{10,2232},{10006,4}}, 42520, {{10,25512},{10006,27}}, \"抗暴\", {{'tenacity',39}}}",
	["20001_39"] = "{20001, 39, 30, {{10,3560},{10006,10}}, 158256, {{10,87920},{10006,210}}, \"对坦克增伤\", {{'dam',195}}}",
	["40004_29"] = "{40004, 29, 20, {{10,3288},{10006,7}}, 113840, {{10,68304},{10006,118}}, \"治疗\", {{'cure',145}}}",
	["30001_36"] = "{30001, 36, 27, {{10,3300},{10006,10}}, 140004, {{10,77780},{10006,180}}, \"对战士免伤\", {{'res_p',180}}}",
	["40002_3"] = "{40002, 3, 0, {{10,1560},{10006,1}}, 8208, {{10,4560},{10006,3}}, \"对法师免伤\", {{'res_p',15}}}",
	["30004_29"] = "{30004, 29, 20, {{10,3288},{10006,7}}, 113840, {{10,68304},{10006,118}}, \"抗暴\", {{'tenacity',87}}}",
	["40002_36"] = "{40002, 36, 27, {{10,3300},{10006,10}}, 140004, {{10,77780},{10006,180}}, \"对法师免伤\", {{'res_p',180}}}",
	["40003_12"] = "{40003, 12, 3, {{10,2184},{10006,4}}, 38880, {{10,23328},{10006,23}}, \"生命\", {{'hp_max_per',60}}}",
	["30001_1"] = "{30001, 1, 0, {{10,1520},{10006,1}}, 2700, {{10,1500},{10006,1}}, \"对战士免伤\", {{'res_p',5}}}",
	["40004_4"] = "{40004, 4, 0, {{10,1896},{10006,1}}, 12240, {{10,7344},{10006,4}}, \"治疗\", {{'cure',20}}}",
	["20004_40"] = "{20004, 40, 0, {}, 182960, {{10,109776},{10006,220}}, \"暴击\", {{'crit_rate',120}}}",
	["40002_29"] = "{40002, 29, 20, {{10,2740},{10006,7}}, 102456, {{10,56920},{10006,118}}, \"对法师免伤\", {{'res_p',145}}}",
	["40004_19"] = "{40004, 19, 10, {{10,2544},{10006,5}}, 66040, {{10,39624},{10006,55}}, \"治疗\", {{'cure',95}}}",
	["40004_8"] = "{40004, 8, 0, {{10,1992},{10006,2}}, 25120, {{10,15072},{10006,11}}, \"治疗\", {{'cure',40}}}",
	["20004_19"] = "{20004, 19, 10, {{10,2544},{10006,5}}, 66040, {{10,39624},{10006,55}}, \"暴击\", {{'crit_rate',57}}}",
	["30001_4"] = "{30001, 4, 0, {{10,1580},{10006,1}}, 11016, {{10,6120},{10006,4}}, \"对战士免伤\", {{'res_p',20}}}",
	["40004_1"] = "{40004, 1, 0, {{10,1824},{10006,1}}, 3000, {{10,1800},{10006,1}}, \"治疗\", {{'cure',5}}}",
	["40002_26"] = "{40002, 26, 17, {{10,2540},{10006,7}}, 88416, {{10,49120},{10006,97}}, \"对法师免伤\", {{'res_p',130}}}",
	["30001_0"] = "{30001, 0, 0, {{10,1500},{10006,1}}, 0, {}, \"对战士免伤\", {{'res_p',0}}}",
	["20002_26"] = "{20002, 26, 17, {{10,2540},{10006,7}}, 88416, {{10,49120},{10006,97}}, \"对辅助增伤\", {{'dam',130}}}",
	["30003_5"] = "{30003, 5, 0, {{10,1920},{10006,2}}, 15400, {{10,9240},{10006,5}}, \"生命\", {{'hp_max_per',25}}}",
	["40003_23"] = "{40003, 23, 14, {{10,2832},{10006,6}}, 83720, {{10,50232},{10006,78}}, \"生命\", {{'hp_max_per',115}}}",
	["40001_35"] = "{40001, 35, 26, {{10,3220},{10006,10}}, 134208, {{10,74560},{10006,170}}, \"对战士免伤\", {{'res_p',175}}}",
	["40003_38"] = "{40003, 38, 29, {{10,4152},{10006,10}}, 168920, {{10,101352},{10006,200}}, \"生命\", {{'hp_max_per',190}}}",
	["40004_0"] = "{40004, 0, 0, {{10,1800},{10006,1}}, 0, {}, \"治疗\", {{'cure',0}}}",
	["20004_31"] = "{20004, 31, 22, {{10,3480},{10006,9}}, 124960, {{10,74976},{10006,134}}, \"暴击\", {{'crit_rate',93}}}",
	["20004_29"] = "{20004, 29, 20, {{10,3288},{10006,7}}, 113840, {{10,68304},{10006,118}}, \"暴击\", {{'crit_rate',87}}}",
	["40001_20"] = "{40001, 20, 11, {{10,2180},{10006,6}}, 63252, {{10,35140},{10006,60}}, \"对战士免伤\", {{'res_p',100}}}",
	["20004_21"] = "{20004, 21, 12, {{10,2688},{10006,6}}, 74640, {{10,44784},{10006,66}}, \"暴击\", {{'crit_rate',63}}}",
	["40003_29"] = "{40003, 29, 20, {{10,3288},{10006,7}}, 113840, {{10,68304},{10006,118}}, \"生命\", {{'hp_max_per',145}}}",
	["20002_28"] = "{20002, 28, 19, {{10,2660},{10006,7}}, 97668, {{10,54260},{10006,111}}, \"对辅助增伤\", {{'dam',140}}}",
	["20003_31"] = "{20003, 31, 22, {{10,3480},{10006,9}}, 124960, {{10,74976},{10006,134}}, \"攻击\", {{'atk_per',155}}}",
	["10004_30"] = "{10004, 30, 21, {{10,3384},{10006,9}}, 119320, {{10,71592},{10006,125}}, \"暴伤\", {{'crit_ratio',150}}}",
	["40002_24"] = "{40002, 24, 15, {{10,2420},{10006,6}}, 79596, {{10,44220},{10006,84}}, \"对法师免伤\", {{'res_p',120}}}",
	["30003_2"] = "{30003, 2, 0, {{10,1848},{10006,1}}, 6040, {{10,3624},{10006,2}}, \"生命\", {{'hp_max_per',10}}}",
	["30002_21"] = "{30002, 21, 12, {{10,2240},{10006,6}}, 67176, {{10,37320},{10006,66}}, \"对法师免伤\", {{'res_p',105}}}",
	["40004_15"] = "{40004, 15, 6, {{10,2328},{10006,5}}, 50040, {{10,30024},{10006,35}}, \"治疗\", {{'cure',75}}}",
	["40003_30"] = "{40003, 30, 21, {{10,3384},{10006,9}}, 119320, {{10,71592},{10006,125}}, \"生命\", {{'hp_max_per',150}}}",
	["20004_15"] = "{20004, 15, 6, {{10,2328},{10006,5}}, 50040, {{10,30024},{10006,35}}, \"暴击\", {{'crit_rate',45}}}",
	["20003_30"] = "{20003, 30, 21, {{10,3384},{10006,9}}, 119320, {{10,71592},{10006,125}}, \"攻击\", {{'atk_per',150}}}",
	["10004_29"] = "{10004, 29, 20, {{10,3288},{10006,7}}, 113840, {{10,68304},{10006,118}}, \"暴伤\", {{'crit_ratio',145}}}",
	["40004_23"] = "{40004, 23, 14, {{10,2832},{10006,6}}, 83720, {{10,50232},{10006,78}}, \"治疗\", {{'cure',115}}}",
	["30002_28"] = "{30002, 28, 19, {{10,2660},{10006,7}}, 97668, {{10,54260},{10006,111}}, \"对法师免伤\", {{'res_p',140}}}",
	["20004_23"] = "{20004, 23, 14, {{10,2832},{10006,6}}, 83720, {{10,50232},{10006,78}}, \"暴击\", {{'crit_rate',69}}}",
	["10002_28"] = "{10002, 28, 19, {{10,2660},{10006,7}}, 97668, {{10,54260},{10006,111}}, \"对辅助增伤\", {{'dam',140}}}",
	["40001_3"] = "{40001, 3, 0, {{10,1560},{10006,1}}, 8208, {{10,4560},{10006,3}}, \"对战士免伤\", {{'res_p',15}}}",
	["40002_15"] = "{40002, 15, 6, {{10,1940},{10006,5}}, 45036, {{10,25020},{10006,35}}, \"对法师免伤\", {{'res_p',75}}}",
	["20003_12"] = "{20003, 12, 3, {{10,2184},{10006,4}}, 38880, {{10,23328},{10006,23}}, \"攻击\", {{'atk_per',60}}}",
	["30004_14"] = "{30004, 14, 5, {{10,2280},{10006,4}}, 46240, {{10,27744},{10006,31}}, \"抗暴\", {{'tenacity',42}}}",
	["30002_35"] = "{30002, 35, 26, {{10,3220},{10006,10}}, 134208, {{10,74560},{10006,170}}, \"对法师免伤\", {{'res_p',175}}}",
	["30004_8"] = "{30004, 8, 0, {{10,1992},{10006,2}}, 25120, {{10,15072},{10006,11}}, \"抗暴\", {{'tenacity',24}}}",
	["40002_31"] = "{40002, 31, 22, {{10,2900},{10006,9}}, 112464, {{10,62480},{10006,134}}, \"对法师免伤\", {{'res_p',155}}}",
	["20003_5"] = "{20003, 5, 0, {{10,1920},{10006,2}}, 15400, {{10,9240},{10006,5}}, \"攻击\", {{'atk_per',25}}}",
	["40003_4"] = "{40003, 4, 0, {{10,1896},{10006,1}}, 12240, {{10,7344},{10006,4}}, \"生命\", {{'hp_max_per',20}}}",
	["40004_39"] = "{40004, 39, 30, {{10,4272},{10006,10}}, 175840, {{10,105504},{10006,210}}, \"治疗\", {{'cure',195}}}",
	["10003_20"] = "{10003, 20, 11, {{10,2616},{10006,6}}, 70280, {{10,42168},{10006,60}}, \"攻击\", {{'atk_per',100}}}",
	["20002_38"] = "{20002, 38, 29, {{10,3460},{10006,10}}, 152028, {{10,84460},{10006,200}}, \"对辅助增伤\", {{'dam',190}}}",
	["20003_4"] = "{20003, 4, 0, {{10,1896},{10006,1}}, 12240, {{10,7344},{10006,4}}, \"攻击\", {{'atk_per',20}}}",
	["30003_1"] = "{30003, 1, 0, {{10,1824},{10006,1}}, 3000, {{10,1800},{10006,1}}, \"生命\", {{'hp_max_per',5}}}",
	["30004_33"] = "{30004, 33, 24, {{10,3672},{10006,9}}, 136720, {{10,82032},{10006,152}}, \"抗暴\", {{'tenacity',99}}}",
	["40004_40"] = "{40004, 40, 0, {}, 182960, {{10,109776},{10006,220}}, \"治疗\", {{'cure',200}}}",
	["10004_33"] = "{10004, 33, 24, {{10,3672},{10006,9}}, 136720, {{10,82032},{10006,152}}, \"暴伤\", {{'crit_ratio',165}}}",
	["30004_25"] = "{30004, 25, 16, {{10,2976},{10006,7}}, 93280, {{10,55968},{10006,90}}, \"抗暴\", {{'tenacity',75}}}",
	["30003_39"] = "{30003, 39, 30, {{10,4272},{10006,10}}, 175840, {{10,105504},{10006,210}}, \"生命\", {{'hp_max_per',195}}}",
	["10004_25"] = "{10004, 25, 16, {{10,2976},{10006,7}}, 93280, {{10,55968},{10006,90}}, \"暴伤\", {{'crit_ratio',125}}}",
	["10003_39"] = "{10003, 39, 30, {{10,4272},{10006,10}}, 175840, {{10,105504},{10006,210}}, \"攻击\", {{'atk_per',195}}}",
	["40003_33"] = "{40003, 33, 24, {{10,3672},{10006,9}}, 136720, {{10,82032},{10006,152}}, \"生命\", {{'hp_max_per',165}}}",
	["40003_1"] = "{40003, 1, 0, {{10,1824},{10006,1}}, 3000, {{10,1800},{10006,1}}, \"生命\", {{'hp_max_per',5}}}",
	["20003_33"] = "{20003, 33, 24, {{10,3672},{10006,9}}, 136720, {{10,82032},{10006,152}}, \"攻击\", {{'atk_per',165}}}",
	["20004_32"] = "{20004, 32, 23, {{10,3576},{10006,9}}, 130760, {{10,78456},{10006,143}}, \"暴击\", {{'crit_rate',96}}}",
	["40001_37"] = "{40001, 37, 28, {{10,3380},{10006,10}}, 145944, {{10,81080},{10006,190}}, \"对战士免伤\", {{'res_p',185}}}",
	["40001_5"] = "{40001, 5, 0, {{10,1600},{10006,2}}, 13860, {{10,7700},{10006,5}}, \"对战士免伤\", {{'res_p',25}}}",
	["40002_39"] = "{40002, 39, 30, {{10,3560},{10006,10}}, 158256, {{10,87920},{10006,210}}, \"对法师免伤\", {{'res_p',195}}}",
	["40003_36"] = "{40003, 36, 27, {{10,3960},{10006,10}}, 155560, {{10,93336},{10006,180}}, \"生命\", {{'hp_max_per',180}}}",
	["40001_30"] = "{40001, 30, 21, {{10,2820},{10006,9}}, 107388, {{10,59660},{10006,125}}, \"对战士免伤\", {{'res_p',150}}}",
	["40003_10"] = "{40003, 10, 1, {{10,2088},{10006,4}}, 31840, {{10,19104},{10006,15}}, \"生命\", {{'hp_max_per',50}}}",
	["30001_7"] = "{30001, 7, 0, {{10,1640},{10006,2}}, 19656, {{10,10920},{10006,9}}, \"对战士免伤\", {{'res_p',35}}}",
	["20003_10"] = "{20003, 10, 1, {{10,2088},{10006,4}}, 31840, {{10,19104},{10006,15}}, \"攻击\", {{'atk_per',50}}}",
	["30003_29"] = "{30003, 29, 20, {{10,3288},{10006,7}}, 113840, {{10,68304},{10006,118}}, \"生命\", {{'hp_max_per',145}}}",
	["30003_6"] = "{30003, 6, 0, {{10,1944},{10006,2}}, 18600, {{10,11160},{10006,7}}, \"生命\", {{'hp_max_per',30}}}",
	["20004_35"] = "{20004, 35, 26, {{10,3864},{10006,10}}, 149120, {{10,89472},{10006,170}}, \"暴击\", {{'crit_rate',105}}}",
	["20003_8"] = "{20003, 8, 0, {{10,1992},{10006,2}}, 25120, {{10,15072},{10006,11}}, \"攻击\", {{'atk_per',40}}}",
	["30003_23"] = "{30003, 23, 14, {{10,2832},{10006,6}}, 83720, {{10,50232},{10006,78}}, \"生命\", {{'hp_max_per',115}}}",
	["30003_14"] = "{30003, 14, 5, {{10,2280},{10006,4}}, 46240, {{10,27744},{10006,31}}, \"生命\", {{'hp_max_per',70}}}",
	["10003_23"] = "{10003, 23, 14, {{10,2832},{10006,6}}, 83720, {{10,50232},{10006,78}}, \"攻击\", {{'atk_per',115}}}",
	["10004_18"] = "{10004, 18, 9, {{10,2472},{10006,5}}, 61920, {{10,37152},{10006,50}}, \"暴伤\", {{'crit_ratio',90}}}",
	["10004_16"] = "{10004, 16, 7, {{10,2376},{10006,5}}, 53920, {{10,32352},{10006,40}}, \"暴伤\", {{'crit_ratio',80}}}",
	["30003_35"] = "{30003, 35, 26, {{10,3864},{10006,10}}, 149120, {{10,89472},{10006,170}}, \"生命\", {{'hp_max_per',175}}}",
	["10004_15"] = "{10004, 15, 6, {{10,2328},{10006,5}}, 50040, {{10,30024},{10006,35}}, \"暴伤\", {{'crit_ratio',75}}}",
	["40002_11"] = "{40002, 11, 2, {{10,1780},{10006,4}}, 31788, {{10,17660},{10006,19}}, \"对法师免伤\", {{'res_p',55}}}",
	["10004_14"] = "{10004, 14, 5, {{10,2280},{10006,4}}, 46240, {{10,27744},{10006,31}}, \"暴伤\", {{'crit_ratio',70}}}",
	["20002_11"] = "{20002, 11, 2, {{10,1780},{10006,4}}, 31788, {{10,17660},{10006,19}}, \"对辅助增伤\", {{'dam',55}}}",
	["40002_18"] = "{40002, 18, 9, {{10,2060},{10006,5}}, 55728, {{10,30960},{10006,50}}, \"对法师免伤\", {{'res_p',90}}}",
	["10004_13"] = "{10004, 13, 4, {{10,2232},{10006,4}}, 42520, {{10,25512},{10006,27}}, \"暴伤\", {{'crit_ratio',65}}}",
	["20002_18"] = "{20002, 18, 9, {{10,2060},{10006,5}}, 55728, {{10,30960},{10006,50}}, \"对辅助增伤\", {{'dam',90}}}",
	["10004_11"] = "{10004, 11, 2, {{10,2136},{10006,4}}, 35320, {{10,21192},{10006,19}}, \"暴伤\", {{'crit_ratio',55}}}",
	["10004_10"] = "{10004, 10, 1, {{10,2088},{10006,4}}, 31840, {{10,19104},{10006,15}}, \"暴伤\", {{'crit_ratio',50}}}",
	["10004_9"] = "{10004, 9, 0, {{10,2040},{10006,2}}, 28440, {{10,17064},{10006,13}}, \"暴伤\", {{'crit_ratio',45}}}",
	["10004_8"] = "{10004, 8, 0, {{10,1992},{10006,2}}, 25120, {{10,15072},{10006,11}}, \"暴伤\", {{'crit_ratio',40}}}",
	["10004_7"] = "{10004, 7, 0, {{10,1968},{10006,2}}, 21840, {{10,13104},{10006,9}}, \"暴伤\", {{'crit_ratio',35}}}",
	["40003_19"] = "{40003, 19, 10, {{10,2544},{10006,5}}, 66040, {{10,39624},{10006,55}}, \"生命\", {{'hp_max_per',95}}}",
	["40003_25"] = "{40003, 25, 16, {{10,2976},{10006,7}}, 93280, {{10,55968},{10006,90}}, \"生命\", {{'hp_max_per',125}}}",
	["20003_19"] = "{20003, 19, 10, {{10,2544},{10006,5}}, 66040, {{10,39624},{10006,55}}, \"攻击\", {{'atk_per',95}}}",
	["20003_25"] = "{20003, 25, 16, {{10,2976},{10006,7}}, 93280, {{10,55968},{10006,90}}, \"攻击\", {{'atk_per',125}}}",
	["10004_6"] = "{10004, 6, 0, {{10,1944},{10006,2}}, 18600, {{10,11160},{10006,7}}, \"暴伤\", {{'crit_ratio',30}}}",
	["30003_13"] = "{30003, 13, 4, {{10,2232},{10006,4}}, 42520, {{10,25512},{10006,27}}, \"生命\", {{'hp_max_per',65}}}",
	["10004_5"] = "{10004, 5, 0, {{10,1920},{10006,2}}, 15400, {{10,9240},{10006,5}}, \"暴伤\", {{'crit_ratio',25}}}",
	["10003_13"] = "{10003, 13, 4, {{10,2232},{10006,4}}, 42520, {{10,25512},{10006,27}}, \"攻击\", {{'atk_per',65}}}",
	["10004_3"] = "{10004, 3, 0, {{10,1872},{10006,1}}, 9120, {{10,5472},{10006,3}}, \"暴伤\", {{'crit_ratio',15}}}",
	["10004_2"] = "{10004, 2, 0, {{10,1848},{10006,1}}, 6040, {{10,3624},{10006,2}}, \"暴伤\", {{'crit_ratio',10}}}",
	["10004_1"] = "{10004, 1, 0, {{10,1824},{10006,1}}, 3000, {{10,1800},{10006,1}}, \"暴伤\", {{'crit_ratio',5}}}",
	["10004_0"] = "{10004, 0, 0, {{10,1800},{10006,1}}, 0, {}, \"暴伤\", {{'crit_ratio',0}}}",
	["10003_40"] = "{10003, 40, 0, {}, 182960, {{10,109776},{10006,220}}, \"攻击\", {{'atk_per',200}}}",
	["30001_37"] = "{30001, 37, 28, {{10,3380},{10006,10}}, 145944, {{10,81080},{10006,190}}, \"对战士免伤\", {{'res_p',185}}}",
	["10003_37"] = "{10003, 37, 28, {{10,4056},{10006,10}}, 162160, {{10,97296},{10006,190}}, \"攻击\", {{'atk_per',185}}}",
	["20003_38"] = "{20003, 38, 29, {{10,4152},{10006,10}}, 168920, {{10,101352},{10006,200}}, \"攻击\", {{'atk_per',190}}}",
	["30004_10"] = "{30004, 10, 1, {{10,2088},{10006,4}}, 31840, {{10,19104},{10006,15}}, \"抗暴\", {{'tenacity',30}}}",
	["10003_35"] = "{10003, 35, 26, {{10,3864},{10006,10}}, 149120, {{10,89472},{10006,170}}, \"攻击\", {{'atk_per',175}}}",
	["10003_31"] = "{10003, 31, 22, {{10,3480},{10006,9}}, 124960, {{10,74976},{10006,134}}, \"攻击\", {{'atk_per',155}}}",
	["10003_30"] = "{10003, 30, 21, {{10,3384},{10006,9}}, 119320, {{10,71592},{10006,125}}, \"攻击\", {{'atk_per',150}}}",
	["10003_29"] = "{10003, 29, 20, {{10,3288},{10006,7}}, 113840, {{10,68304},{10006,118}}, \"攻击\", {{'atk_per',145}}}",
	["30004_17"] = "{30004, 17, 8, {{10,2424},{10006,5}}, 57880, {{10,34728},{10006,45}}, \"抗暴\", {{'tenacity',51}}}",
	["10003_28"] = "{10003, 28, 19, {{10,3192},{10006,7}}, 108520, {{10,65112},{10006,111}}, \"攻击\", {{'atk_per',140}}}",
	["10004_17"] = "{10004, 17, 8, {{10,2424},{10006,5}}, 57880, {{10,34728},{10006,45}}, \"暴伤\", {{'crit_ratio',85}}}",
	["40003_15"] = "{40003, 15, 6, {{10,2328},{10006,5}}, 50040, {{10,30024},{10006,35}}, \"生命\", {{'hp_max_per',75}}}",
	["10003_27"] = "{10003, 27, 18, {{10,3120},{10006,7}}, 103320, {{10,61992},{10006,104}}, \"攻击\", {{'atk_per',135}}}",
	["20003_15"] = "{20003, 15, 6, {{10,2328},{10006,5}}, 50040, {{10,30024},{10006,35}}, \"攻击\", {{'atk_per',75}}}",
	["10003_26"] = "{10003, 26, 17, {{10,3048},{10006,7}}, 98240, {{10,58944},{10006,97}}, \"攻击\", {{'atk_per',130}}}",
	["10003_25"] = "{10003, 25, 16, {{10,2976},{10006,7}}, 93280, {{10,55968},{10006,90}}, \"攻击\", {{'atk_per',125}}}",
	["10003_24"] = "{10003, 24, 15, {{10,2904},{10006,6}}, 88440, {{10,53064},{10006,84}}, \"攻击\", {{'atk_per',120}}}",
	["10004_19"] = "{10004, 19, 10, {{10,2544},{10006,5}}, 66040, {{10,39624},{10006,55}}, \"暴伤\", {{'crit_ratio',95}}}",
	["40003_26"] = "{40003, 26, 17, {{10,3048},{10006,7}}, 98240, {{10,58944},{10006,97}}, \"生命\", {{'hp_max_per',130}}}",
	["10003_18"] = "{10003, 18, 9, {{10,2472},{10006,5}}, 61920, {{10,37152},{10006,50}}, \"攻击\", {{'atk_per',90}}}",
	["10004_4"] = "{10004, 4, 0, {{10,1896},{10006,1}}, 12240, {{10,7344},{10006,4}}, \"暴伤\", {{'crit_ratio',20}}}",
	["10003_10"] = "{10003, 10, 1, {{10,2088},{10006,4}}, 31840, {{10,19104},{10006,15}}, \"攻击\", {{'atk_per',50}}}",
	["10003_9"] = "{10003, 9, 0, {{10,2040},{10006,2}}, 28440, {{10,17064},{10006,13}}, \"攻击\", {{'atk_per',45}}}",
	["30002_2"] = "{30002, 2, 0, {{10,1540},{10006,1}}, 5436, {{10,3020},{10006,2}}, \"对法师免伤\", {{'res_p',10}}}",
	["10001_11"] = "{10001, 11, 2, {{10,1780},{10006,4}}, 31788, {{10,17660},{10006,19}}, \"对坦克增伤\", {{'dam',55}}}",
	["10003_7"] = "{10003, 7, 0, {{10,1968},{10006,2}}, 21840, {{10,13104},{10006,9}}, \"攻击\", {{'atk_per',35}}}",
	["40001_18"] = "{40001, 18, 9, {{10,2060},{10006,5}}, 55728, {{10,30960},{10006,50}}, \"对战士免伤\", {{'res_p',90}}}",
	["40004_20"] = "{40004, 20, 11, {{10,2616},{10006,6}}, 70280, {{10,42168},{10006,60}}, \"治疗\", {{'cure',100}}}",
	["10003_6"] = "{10003, 6, 0, {{10,1944},{10006,2}}, 18600, {{10,11160},{10006,7}}, \"攻击\", {{'atk_per',30}}}",
	["20004_20"] = "{20004, 20, 11, {{10,2616},{10006,6}}, 70280, {{10,42168},{10006,60}}, \"暴击\", {{'crit_rate',60}}}",
	["30001_11"] = "{30001, 11, 2, {{10,1780},{10006,4}}, 31788, {{10,17660},{10006,19}}, \"对战士免伤\", {{'res_p',55}}}",
	["40002_7"] = "{40002, 7, 0, {{10,1640},{10006,2}}, 19656, {{10,10920},{10006,9}}, \"对法师免伤\", {{'res_p',35}}}",
	["40004_27"] = "{40004, 27, 18, {{10,3120},{10006,7}}, 103320, {{10,61992},{10006,104}}, \"治疗\", {{'cure',135}}}",
	["10003_5"] = "{10003, 5, 0, {{10,1920},{10006,2}}, 15400, {{10,9240},{10006,5}}, \"攻击\", {{'atk_per',25}}}",
	["20004_27"] = "{20004, 27, 18, {{10,3120},{10006,7}}, 103320, {{10,61992},{10006,104}}, \"暴击\", {{'crit_rate',81}}}",
	["10003_4"] = "{10003, 4, 0, {{10,1896},{10006,1}}, 12240, {{10,7344},{10006,4}}, \"攻击\", {{'atk_per',20}}}",
	["20001_18"] = "{20001, 18, 9, {{10,2060},{10006,5}}, 55728, {{10,30960},{10006,50}}, \"对坦克增伤\", {{'dam',90}}}",
	["10003_3"] = "{10003, 3, 0, {{10,1872},{10006,1}}, 9120, {{10,5472},{10006,3}}, \"攻击\", {{'atk_per',15}}}",
	["10003_2"] = "{10003, 2, 0, {{10,1848},{10006,1}}, 6040, {{10,3624},{10006,2}}, \"攻击\", {{'atk_per',10}}}",
	["40001_4"] = "{40001, 4, 0, {{10,1580},{10006,1}}, 11016, {{10,6120},{10006,4}}, \"对战士免伤\", {{'res_p',20}}}",
	["10003_1"] = "{10003, 1, 0, {{10,1824},{10006,1}}, 3000, {{10,1800},{10006,1}}, \"攻击\", {{'atk_per',5}}}",
	["10003_0"] = "{10003, 0, 0, {{10,1800},{10006,1}}, 0, {}, \"攻击\", {{'atk_per',0}}}",
	["10002_38"] = "{10002, 38, 29, {{10,3460},{10006,10}}, 152028, {{10,84460},{10006,200}}, \"对辅助增伤\", {{'dam',190}}}",
	["10002_37"] = "{10002, 37, 28, {{10,3380},{10006,10}}, 145944, {{10,81080},{10006,190}}, \"对辅助增伤\", {{'dam',185}}}",
	["40003_0"] = "{40003, 0, 0, {{10,1800},{10006,1}}, 0, {}, \"生命\", {{'hp_max_per',0}}}",
	["30004_30"] = "{30004, 30, 21, {{10,3384},{10006,9}}, 119320, {{10,71592},{10006,125}}, \"抗暴\", {{'tenacity',90}}}",
	["30003_40"] = "{30003, 40, 0, {}, 182960, {{10,109776},{10006,220}}, \"生命\", {{'hp_max_per',200}}}",
	["10001_36"] = "{10001, 36, 27, {{10,3300},{10006,10}}, 140004, {{10,77780},{10006,180}}, \"对坦克增伤\", {{'dam',180}}}",
	["20003_0"] = "{20003, 0, 0, {{10,1800},{10006,1}}, 0, {}, \"攻击\", {{'atk_per',0}}}",
	["10002_34"] = "{10002, 34, 25, {{10,3140},{10006,9}}, 128556, {{10,71420},{10006,161}}, \"对辅助增伤\", {{'dam',170}}}",
	["40001_14"] = "{40001, 14, 5, {{10,1900},{10006,4}}, 41616, {{10,23120},{10006,31}}, \"对战士免伤\", {{'res_p',70}}}",
	["10002_33"] = "{10002, 33, 24, {{10,3060},{10006,9}}, 123048, {{10,68360},{10006,152}}, \"对辅助增伤\", {{'dam',165}}}",
	["10004_37"] = "{10004, 37, 28, {{10,4056},{10006,10}}, 162160, {{10,97296},{10006,190}}, \"暴伤\", {{'crit_ratio',185}}}",
	["10002_32"] = "{10002, 32, 23, {{10,2980},{10006,9}}, 117684, {{10,65380},{10006,143}}, \"对辅助增伤\", {{'dam',160}}}",
	["10002_29"] = "{10002, 29, 20, {{10,2740},{10006,7}}, 102456, {{10,56920},{10006,118}}, \"对辅助增伤\", {{'dam',145}}}",
	["40001_26"] = "{40001, 26, 17, {{10,2540},{10006,7}}, 88416, {{10,49120},{10006,97}}, \"对战士免伤\", {{'res_p',130}}}",
	["20003_9"] = "{20003, 9, 0, {{10,2040},{10006,2}}, 28440, {{10,17064},{10006,13}}, \"攻击\", {{'atk_per',45}}}",
	["40003_37"] = "{40003, 37, 28, {{10,4056},{10006,10}}, 162160, {{10,97296},{10006,190}}, \"生命\", {{'hp_max_per',185}}}",
	["10001_31"] = "{10001, 31, 22, {{10,2900},{10006,9}}, 112464, {{10,62480},{10006,134}}, \"对坦克增伤\", {{'dam',155}}}",
	["20003_37"] = "{20003, 37, 28, {{10,4056},{10006,10}}, 162160, {{10,97296},{10006,190}}, \"攻击\", {{'atk_per',185}}}",
	["20001_14"] = "{20001, 14, 5, {{10,1900},{10006,4}}, 41616, {{10,23120},{10006,31}}, \"对坦克增伤\", {{'dam',70}}}",
	["10002_16"] = "{10002, 16, 7, {{10,1980},{10006,5}}, 48528, {{10,26960},{10006,40}}, \"对辅助增伤\", {{'dam',80}}}",
	["10002_15"] = "{10002, 15, 6, {{10,1940},{10006,5}}, 45036, {{10,25020},{10006,35}}, \"对辅助增伤\", {{'dam',75}}}",
	["40001_8"] = "{40001, 8, 0, {{10,1660},{10006,2}}, 22608, {{10,12560},{10006,11}}, \"对战士免伤\", {{'res_p',40}}}",
	["40004_5"] = "{40004, 5, 0, {{10,1920},{10006,2}}, 15400, {{10,9240},{10006,5}}, \"治疗\", {{'cure',25}}}",
	["20001_26"] = "{20001, 26, 17, {{10,2540},{10006,7}}, 88416, {{10,49120},{10006,97}}, \"对坦克增伤\", {{'dam',130}}}",
	["40002_23"] = "{40002, 23, 14, {{10,2360},{10006,6}}, 75348, {{10,41860},{10006,78}}, \"对法师免伤\", {{'res_p',115}}}",
	["10002_12"] = "{10002, 12, 3, {{10,1820},{10006,4}}, 34992, {{10,19440},{10006,23}}, \"对辅助增伤\", {{'dam',60}}}",
	["20002_23"] = "{20002, 23, 14, {{10,2360},{10006,6}}, 75348, {{10,41860},{10006,78}}, \"对辅助增伤\", {{'dam',115}}}",
	["10002_9"] = "{10002, 9, 0, {{10,1700},{10006,2}}, 25596, {{10,14220},{10006,13}}, \"对辅助增伤\", {{'dam',45}}}",
	["40001_21"] = "{40001, 21, 12, {{10,2240},{10006,6}}, 67176, {{10,37320},{10006,66}}, \"对战士免伤\", {{'res_p',105}}}",
	["10002_8"] = "{10002, 8, 0, {{10,1660},{10006,2}}, 22608, {{10,12560},{10006,11}}, \"对辅助增伤\", {{'dam',40}}}",
	["10002_7"] = "{10002, 7, 0, {{10,1640},{10006,2}}, 19656, {{10,10920},{10006,9}}, \"对辅助增伤\", {{'dam',35}}}",
	["30003_27"] = "{30003, 27, 18, {{10,3120},{10006,7}}, 103320, {{10,61992},{10006,104}}, \"生命\", {{'hp_max_per',135}}}",
	["10002_6"] = "{10002, 6, 0, {{10,1620},{10006,2}}, 16740, {{10,9300},{10006,7}}, \"对辅助增伤\", {{'dam',30}}}",
	["20002_3"] = "{20002, 3, 0, {{10,1560},{10006,1}}, 8208, {{10,4560},{10006,3}}, \"对辅助增伤\", {{'dam',15}}}",
	["10002_5"] = "{10002, 5, 0, {{10,1600},{10006,2}}, 13860, {{10,7700},{10006,5}}, \"对辅助增伤\", {{'dam',25}}}",
	["10002_4"] = "{10002, 4, 0, {{10,1580},{10006,1}}, 11016, {{10,6120},{10006,4}}, \"对辅助增伤\", {{'dam',20}}}",
	["10002_3"] = "{10002, 3, 0, {{10,1560},{10006,1}}, 8208, {{10,4560},{10006,3}}, \"对辅助增伤\", {{'dam',15}}}",
	["10002_2"] = "{10002, 2, 0, {{10,1540},{10006,1}}, 5436, {{10,3020},{10006,2}}, \"对辅助增伤\", {{'dam',10}}}",
	["30001_28"] = "{30001, 28, 19, {{10,2660},{10006,7}}, 97668, {{10,54260},{10006,111}}, \"对战士免伤\", {{'res_p',140}}}",
	["10002_1"] = "{10002, 1, 0, {{10,1520},{10006,1}}, 2700, {{10,1500},{10006,1}}, \"对辅助增伤\", {{'dam',5}}}",
	["10001_28"] = "{10001, 28, 19, {{10,2660},{10006,7}}, 97668, {{10,54260},{10006,111}}, \"对坦克增伤\", {{'dam',140}}}",
	["20001_0"] = "{20001, 0, 0, {{10,1500},{10006,1}}, 0, {}, \"对坦克增伤\", {{'dam',0}}}",
	["40001_34"] = "{40001, 34, 25, {{10,3140},{10006,9}}, 128556, {{10,71420},{10006,161}}, \"对战士免伤\", {{'res_p',170}}}",
	["40004_35"] = "{40004, 35, 26, {{10,3864},{10006,10}}, 149120, {{10,89472},{10006,170}}, \"治疗\", {{'cure',175}}}",
	["40002_4"] = "{40002, 4, 0, {{10,1580},{10006,1}}, 11016, {{10,6120},{10006,4}}, \"对法师免伤\", {{'res_p',20}}}",
	["10001_39"] = "{10001, 39, 30, {{10,3560},{10006,10}}, 158256, {{10,87920},{10006,210}}, \"对坦克增伤\", {{'dam',195}}}",
	["30002_33"] = "{30002, 33, 24, {{10,3060},{10006,9}}, 123048, {{10,68360},{10006,152}}, \"对法师免伤\", {{'res_p',165}}}",
	["20002_6"] = "{20002, 6, 0, {{10,1620},{10006,2}}, 16740, {{10,9300},{10006,7}}, \"对辅助增伤\", {{'dam',30}}}",
	["20002_4"] = "{20002, 4, 0, {{10,1580},{10006,1}}, 11016, {{10,6120},{10006,4}}, \"对辅助增伤\", {{'dam',20}}}",
	["30002_25"] = "{30002, 25, 16, {{10,2480},{10006,7}}, 83952, {{10,46640},{10006,90}}, \"对法师免伤\", {{'res_p',125}}}",
	["10002_36"] = "{10002, 36, 27, {{10,3300},{10006,10}}, 140004, {{10,77780},{10006,180}}, \"对辅助增伤\", {{'dam',180}}}",
	["10001_35"] = "{10001, 35, 26, {{10,3220},{10006,10}}, 134208, {{10,74560},{10006,170}}, \"对坦克增伤\", {{'dam',175}}}",
	["20001_34"] = "{20001, 34, 25, {{10,3140},{10006,9}}, 128556, {{10,71420},{10006,161}}, \"对坦克增伤\", {{'dam',170}}}",
	["10001_33"] = "{10001, 33, 24, {{10,3060},{10006,9}}, 123048, {{10,68360},{10006,152}}, \"对坦克增伤\", {{'dam',165}}}",
	["30003_17"] = "{30003, 17, 8, {{10,2424},{10006,5}}, 57880, {{10,34728},{10006,45}}, \"生命\", {{'hp_max_per',85}}}",
	["40001_0"] = "{40001, 0, 0, {{10,1500},{10006,1}}, 0, {}, \"对战士免伤\", {{'res_p',0}}}",
	["10003_17"] = "{10003, 17, 8, {{10,2424},{10006,5}}, 57880, {{10,34728},{10006,45}}, \"攻击\", {{'atk_per',85}}}",
	["30001_12"] = "{30001, 12, 3, {{10,1820},{10006,4}}, 34992, {{10,19440},{10006,23}}, \"对战士免伤\", {{'res_p',60}}}",
	["10001_30"] = "{10001, 30, 21, {{10,2820},{10006,9}}, 107388, {{10,59660},{10006,125}}, \"对坦克增伤\", {{'dam',150}}}",
	["10001_12"] = "{10001, 12, 3, {{10,1820},{10006,4}}, 34992, {{10,19440},{10006,23}}, \"对坦克增伤\", {{'dam',60}}}",
	["10002_0"] = "{10002, 0, 0, {{10,1500},{10006,1}}, 0, {}, \"对辅助增伤\", {{'dam',0}}}",
	["40002_35"] = "{40002, 35, 26, {{10,3220},{10006,10}}, 134208, {{10,74560},{10006,170}}, \"对法师免伤\", {{'res_p',175}}}",
	["30001_24"] = "{30001, 24, 15, {{10,2420},{10006,6}}, 79596, {{10,44220},{10006,84}}, \"对战士免伤\", {{'res_p',120}}}",
	["20002_35"] = "{20002, 35, 26, {{10,3220},{10006,10}}, 134208, {{10,74560},{10006,170}}, \"对辅助增伤\", {{'dam',175}}}",
	["30004_7"] = "{30004, 7, 0, {{10,1968},{10006,2}}, 21840, {{10,13104},{10006,9}}, \"抗暴\", {{'tenacity',21}}}",
	["10001_27"] = "{10001, 27, 18, {{10,2600},{10006,7}}, 92988, {{10,51660},{10006,104}}, \"对坦克增伤\", {{'dam',135}}}",
	["10001_24"] = "{10001, 24, 15, {{10,2420},{10006,6}}, 79596, {{10,44220},{10006,84}}, \"对坦克增伤\", {{'dam',120}}}",
	["10001_23"] = "{10001, 23, 14, {{10,2360},{10006,6}}, 75348, {{10,41860},{10006,78}}, \"对坦克增伤\", {{'dam',115}}}",
	["40002_8"] = "{40002, 8, 0, {{10,1660},{10006,2}}, 22608, {{10,12560},{10006,11}}, \"对法师免伤\", {{'res_p',40}}}",
	["10001_22"] = "{10001, 22, 13, {{10,2300},{10006,6}}, 71208, {{10,39560},{10006,72}}, \"对坦克增伤\", {{'dam',110}}}",
	["10001_21"] = "{10001, 21, 12, {{10,2240},{10006,6}}, 67176, {{10,37320},{10006,66}}, \"对坦克增伤\", {{'dam',105}}}",
	["30002_30"] = "{30002, 30, 21, {{10,2820},{10006,9}}, 107388, {{10,59660},{10006,125}}, \"对法师免伤\", {{'res_p',150}}}",
	["20002_8"] = "{20002, 8, 0, {{10,1660},{10006,2}}, 22608, {{10,12560},{10006,11}}, \"对辅助增伤\", {{'dam',40}}}",
	["10001_18"] = "{10001, 18, 9, {{10,2060},{10006,5}}, 55728, {{10,30960},{10006,50}}, \"对坦克增伤\", {{'dam',90}}}",
	["20004_5"] = "{20004, 5, 0, {{10,1920},{10006,2}}, 15400, {{10,9240},{10006,5}}, \"暴击\", {{'crit_rate',15}}}",
	["10002_21"] = "{10002, 21, 12, {{10,2240},{10006,6}}, 67176, {{10,37320},{10006,66}}, \"对辅助增伤\", {{'dam',105}}}",
	["10001_17"] = "{10001, 17, 8, {{10,2020},{10006,5}}, 52092, {{10,28940},{10006,45}}, \"对坦克增伤\", {{'dam',85}}}",
	["10001_16"] = "{10001, 16, 7, {{10,1980},{10006,5}}, 48528, {{10,26960},{10006,40}}, \"对坦克增伤\", {{'dam',80}}}",
	["10001_15"] = "{10001, 15, 6, {{10,1940},{10006,5}}, 45036, {{10,25020},{10006,35}}, \"对坦克增伤\", {{'dam',75}}}",
	["10001_13"] = "{10001, 13, 4, {{10,1860},{10006,4}}, 38268, {{10,21260},{10006,27}}, \"对坦克增伤\", {{'dam',65}}}",
	["20004_37"] = "{20004, 37, 28, {{10,4056},{10006,10}}, 162160, {{10,97296},{10006,190}}, \"暴击\", {{'crit_rate',111}}}",
	["10003_8"] = "{10003, 8, 0, {{10,1992},{10006,2}}, 25120, {{10,15072},{10006,11}}, \"攻击\", {{'atk_per',40}}}",
	["10001_9"] = "{10001, 9, 0, {{10,1700},{10006,2}}, 25596, {{10,14220},{10006,13}}, \"对坦克增伤\", {{'dam',45}}}",
	["10001_8"] = "{10001, 8, 0, {{10,1660},{10006,2}}, 22608, {{10,12560},{10006,11}}, \"对坦克增伤\", {{'dam',40}}}",
	["30002_13"] = "{30002, 13, 4, {{10,1860},{10006,4}}, 38268, {{10,21260},{10006,27}}, \"对法师免伤\", {{'res_p',65}}}",
	["10001_7"] = "{10001, 7, 0, {{10,1640},{10006,2}}, 19656, {{10,10920},{10006,9}}, \"对坦克增伤\", {{'dam',35}}}",
	["10002_13"] = "{10002, 13, 4, {{10,1860},{10006,4}}, 38268, {{10,21260},{10006,27}}, \"对辅助增伤\", {{'dam',65}}}",
	["10001_6"] = "{10001, 6, 0, {{10,1620},{10006,2}}, 16740, {{10,9300},{10006,7}}, \"对坦克增伤\", {{'dam',30}}}",
	["10001_5"] = "{10001, 5, 0, {{10,1600},{10006,2}}, 13860, {{10,7700},{10006,5}}, \"对坦克增伤\", {{'dam',25}}}",
	["10001_4"] = "{10001, 4, 0, {{10,1580},{10006,1}}, 11016, {{10,6120},{10006,4}}, \"对坦克增伤\", {{'dam',20}}}",
	["10001_3"] = "{10001, 3, 0, {{10,1560},{10006,1}}, 8208, {{10,4560},{10006,3}}, \"对坦克增伤\", {{'dam',15}}}",
	["30001_32"] = "{30001, 32, 23, {{10,2980},{10006,9}}, 117684, {{10,65380},{10006,143}}, \"对战士免伤\", {{'res_p',160}}}",
	["10001_2"] = "{10001, 2, 0, {{10,1540},{10006,1}}, 5436, {{10,3020},{10006,2}}, \"对坦克增伤\", {{'dam',10}}}",
	["10001_32"] = "{10001, 32, 23, {{10,2980},{10006,9}}, 117684, {{10,65380},{10006,143}}, \"对坦克增伤\", {{'dam',160}}}",
	["10001_1"] = "{10001, 1, 0, {{10,1520},{10006,1}}, 2700, {{10,1500},{10006,1}}, \"对坦克增伤\", {{'dam',5}}}",
	["10001_0"] = "{10001, 0, 0, {{10,1500},{10006,1}}, 0, {}, \"对坦克增伤\", {{'dam',0}}}",
	["30004_2"] = "{30004, 2, 0, {{10,1848},{10006,1}}, 6040, {{10,3624},{10006,2}}, \"抗暴\", {{'tenacity',6}}}",
	["20002_15"] = "{20002, 15, 6, {{10,1940},{10006,5}}, 45036, {{10,25020},{10006,35}}, \"对辅助增伤\", {{'dam',75}}}",
	["20001_22"] = "{20001, 22, 13, {{10,2300},{10006,6}}, 71208, {{10,39560},{10006,72}}, \"对坦克增伤\", {{'dam',110}}}",
	["10002_25"] = "{10002, 25, 16, {{10,2480},{10006,7}}, 83952, {{10,46640},{10006,90}}, \"对辅助增伤\", {{'dam',125}}}",
	["40004_21"] = "{40004, 21, 12, {{10,2688},{10006,6}}, 74640, {{10,44784},{10006,66}}, \"治疗\", {{'cure',105}}}",
	["40002_20"] = "{40002, 20, 11, {{10,2180},{10006,6}}, 63252, {{10,35140},{10006,60}}, \"对法师免伤\", {{'res_p',100}}}",
	["20002_20"] = "{20002, 20, 11, {{10,2180},{10006,6}}, 63252, {{10,35140},{10006,60}}, \"对辅助增伤\", {{'dam',100}}}",
	["40002_27"] = "{40002, 27, 18, {{10,2600},{10006,7}}, 92988, {{10,51660},{10006,104}}, \"对法师免伤\", {{'res_p',135}}}",
	["20002_27"] = "{20002, 27, 18, {{10,2600},{10006,7}}, 92988, {{10,51660},{10006,104}}, \"对辅助增伤\", {{'dam',135}}}",
	["30004_31"] = "{30004, 31, 22, {{10,3480},{10006,9}}, 124960, {{10,74976},{10006,134}}, \"抗暴\", {{'tenacity',93}}}",
	["10004_31"] = "{10004, 31, 22, {{10,3480},{10006,9}}, 124960, {{10,74976},{10006,134}}, \"暴伤\", {{'crit_ratio',155}}}",
	["10002_30"] = "{10002, 30, 21, {{10,2820},{10006,9}}, 107388, {{10,59660},{10006,125}}, \"对辅助增伤\", {{'dam',150}}}",
	["30003_31"] = "{30003, 31, 22, {{10,3480},{10006,9}}, 124960, {{10,74976},{10006,134}}, \"生命\", {{'hp_max_per',155}}}",
	["30002_37"] = "{30002, 37, 28, {{10,3380},{10006,10}}, 145944, {{10,81080},{10006,190}}, \"对法师免伤\", {{'res_p',185}}}",
	["30001_15"] = "{30001, 15, 6, {{10,1940},{10006,5}}, 45036, {{10,25020},{10006,35}}, \"对战士免伤\", {{'res_p',75}}}",
	["40004_24"] = "{40004, 24, 15, {{10,2904},{10006,6}}, 88440, {{10,53064},{10006,84}}, \"治疗\", {{'cure',120}}}",
	["30002_29"] = "{30002, 29, 20, {{10,2740},{10006,7}}, 102456, {{10,56920},{10006,118}}, \"对法师免伤\", {{'res_p',145}}}",
	["30003_38"] = "{30003, 38, 29, {{10,4152},{10006,10}}, 168920, {{10,101352},{10006,200}}, \"生命\", {{'hp_max_per',190}}}",
	["10003_38"] = "{10003, 38, 29, {{10,4152},{10006,10}}, 168920, {{10,101352},{10006,200}}, \"攻击\", {{'atk_per',190}}}",
	["40003_21"] = "{40003, 21, 12, {{10,2688},{10006,6}}, 74640, {{10,44784},{10006,66}}, \"生命\", {{'hp_max_per',105}}}",
	["40003_5"] = "{40003, 5, 0, {{10,1920},{10006,2}}, 15400, {{10,9240},{10006,5}}, \"生命\", {{'hp_max_per',25}}}",
	["20003_21"] = "{20003, 21, 12, {{10,2688},{10006,6}}, 74640, {{10,44784},{10006,66}}, \"攻击\", {{'atk_per',105}}}",
	["20002_39"] = "{20002, 39, 30, {{10,3560},{10006,10}}, 158256, {{10,87920},{10006,210}}, \"对辅助增伤\", {{'dam',195}}}",
	["40003_28"] = "{40003, 28, 19, {{10,3192},{10006,7}}, 108520, {{10,65112},{10006,111}}, \"生命\", {{'hp_max_per',140}}}",
	["40001_6"] = "{40001, 6, 0, {{10,1620},{10006,2}}, 16740, {{10,9300},{10006,7}}, \"对战士免伤\", {{'res_p',30}}}",
	["20003_28"] = "{20003, 28, 19, {{10,3192},{10006,7}}, 108520, {{10,65112},{10006,111}}, \"攻击\", {{'atk_per',140}}}",
	["40004_12"] = "{40004, 12, 3, {{10,2184},{10006,4}}, 38880, {{10,23328},{10006,23}}, \"治疗\", {{'cure',60}}}",
	["10004_34"] = "{10004, 34, 25, {{10,3768},{10006,9}}, 142840, {{10,85704},{10006,161}}, \"暴伤\", {{'crit_ratio',170}}}",
	["20001_6"] = "{20001, 6, 0, {{10,1620},{10006,2}}, 16740, {{10,9300},{10006,7}}, \"对坦克增伤\", {{'dam',30}}}",
	["30003_34"] = "{30003, 34, 25, {{10,3768},{10006,9}}, 142840, {{10,85704},{10006,161}}, \"生命\", {{'hp_max_per',170}}}",
	["10003_34"] = "{10003, 34, 25, {{10,3768},{10006,9}}, 142840, {{10,85704},{10006,161}}, \"攻击\", {{'atk_per',170}}}",
	["30002_10"] = "{30002, 10, 1, {{10,1740},{10006,4}}, 28656, {{10,15920},{10006,15}}, \"对法师免伤\", {{'res_p',50}}}",
	["10002_10"] = "{10002, 10, 1, {{10,1740},{10006,4}}, 28656, {{10,15920},{10006,15}}, \"对辅助增伤\", {{'dam',50}}}",
	["30001_35"] = "{30001, 35, 26, {{10,3220},{10006,10}}, 134208, {{10,74560},{10006,170}}, \"对战士免伤\", {{'res_p',175}}}",
	["30003_11"] = "{30003, 11, 2, {{10,2136},{10006,4}}, 35320, {{10,21192},{10006,19}}, \"生命\", {{'hp_max_per',55}}}",
	["40003_9"] = "{40003, 9, 0, {{10,2040},{10006,2}}, 28440, {{10,17064},{10006,13}}, \"生命\", {{'hp_max_per',45}}}",
	["10003_11"] = "{10003, 11, 2, {{10,2136},{10006,4}}, 35320, {{10,21192},{10006,19}}, \"攻击\", {{'atk_per',55}}}",
	["10002_17"] = "{10002, 17, 8, {{10,2020},{10006,5}}, 52092, {{10,28940},{10006,45}}, \"对辅助增伤\", {{'dam',85}}}",
	["40003_18"] = "{40003, 18, 9, {{10,2472},{10006,5}}, 61920, {{10,37152},{10006,50}}, \"生命\", {{'hp_max_per',90}}}",
	["40003_24"] = "{40003, 24, 15, {{10,2904},{10006,6}}, 88440, {{10,53064},{10006,84}}, \"生命\", {{'hp_max_per',120}}}",
	["20003_18"] = "{20003, 18, 9, {{10,2472},{10006,5}}, 61920, {{10,37152},{10006,50}}, \"攻击\", {{'atk_per',90}}}",
	["20003_24"] = "{20003, 24, 15, {{10,2904},{10006,6}}, 88440, {{10,53064},{10006,84}}, \"攻击\", {{'atk_per',120}}}",
	["30004_22"] = "{30004, 22, 13, {{10,2760},{10006,6}}, 79120, {{10,47472},{10006,72}}, \"抗暴\", {{'tenacity',66}}}",
	["10004_22"] = "{10004, 22, 13, {{10,2760},{10006,6}}, 79120, {{10,47472},{10006,72}}, \"暴伤\", {{'crit_ratio',110}}}",
	["40002_19"] = "{40002, 19, 10, {{10,2120},{10006,5}}, 59436, {{10,33020},{10006,55}}, \"对法师免伤\", {{'res_p',95}}}",
	["20002_19"] = "{20002, 19, 10, {{10,2120},{10006,5}}, 59436, {{10,33020},{10006,55}}, \"对辅助增伤\", {{'dam',95}}}",
	["40004_16"] = "{40004, 16, 7, {{10,2376},{10006,5}}, 53920, {{10,32352},{10006,40}}, \"治疗\", {{'cure',80}}}",
	["40004_32"] = "{40004, 32, 23, {{10,3576},{10006,9}}, 130760, {{10,78456},{10006,143}}, \"治疗\", {{'cure',160}}}",
	["40003_14"] = "{40003, 14, 5, {{10,2280},{10006,4}}, 46240, {{10,27744},{10006,31}}, \"生命\", {{'hp_max_per',70}}}",
	["20003_14"] = "{20003, 14, 5, {{10,2280},{10006,4}}, 46240, {{10,27744},{10006,31}}, \"攻击\", {{'atk_per',70}}}",
	["30003_32"] = "{30003, 32, 23, {{10,3576},{10006,9}}, 130760, {{10,78456},{10006,143}}, \"生命\", {{'hp_max_per',160}}}",
	["10003_32"] = "{10003, 32, 23, {{10,3576},{10006,9}}, 130760, {{10,78456},{10006,143}}, \"攻击\", {{'atk_per',160}}}",
	["10001_10"] = "{10001, 10, 1, {{10,1740},{10006,4}}, 28656, {{10,15920},{10006,15}}, \"对坦克增伤\", {{'dam',50}}}",
	["40001_17"] = "{40001, 17, 8, {{10,2020},{10006,5}}, 52092, {{10,28940},{10006,45}}, \"对战士免伤\", {{'res_p',85}}}",
	["40002_40"] = "{40002, 40, 0, {}, 164664, {{10,91480},{10006,220}}, \"对法师免伤\", {{'res_p',200}}}",
	["30004_18"] = "{30004, 18, 9, {{10,2472},{10006,5}}, 61920, {{10,37152},{10006,50}}, \"抗暴\", {{'tenacity',54}}}",
	["20002_40"] = "{20002, 40, 0, {}, 164664, {{10,91480},{10006,220}}, \"对辅助增伤\", {{'dam',200}}}",
	["30001_10"] = "{30001, 10, 1, {{10,1740},{10006,4}}, 28656, {{10,15920},{10006,15}}, \"对战士免伤\", {{'res_p',50}}}",
	["40003_22"] = "{40003, 22, 13, {{10,2760},{10006,6}}, 79120, {{10,47472},{10006,72}}, \"生命\", {{'hp_max_per',110}}}",
	["30004_26"] = "{30004, 26, 17, {{10,3048},{10006,7}}, 98240, {{10,58944},{10006,97}}, \"抗暴\", {{'tenacity',78}}}",
	["20003_22"] = "{20003, 22, 13, {{10,2760},{10006,6}}, 79120, {{10,47472},{10006,72}}, \"攻击\", {{'atk_per',110}}}",
	["10004_26"] = "{10004, 26, 17, {{10,3048},{10006,7}}, 98240, {{10,58944},{10006,97}}, \"暴伤\", {{'crit_ratio',130}}}",
	["20001_17"] = "{20001, 17, 8, {{10,2020},{10006,5}}, 52092, {{10,28940},{10006,45}}, \"对坦克增伤\", {{'dam',85}}}",
	["40004_36"] = "{40004, 36, 27, {{10,3960},{10006,10}}, 155560, {{10,93336},{10006,180}}, \"治疗\", {{'cure',180}}}",
	["30003_7"] = "{30003, 7, 0, {{10,1968},{10006,2}}, 21840, {{10,13104},{10006,9}}, \"生命\", {{'hp_max_per',35}}}",
	["30001_19"] = "{30001, 19, 10, {{10,2120},{10006,5}}, 59436, {{10,33020},{10006,55}}, \"对战士免伤\", {{'res_p',95}}}",
	["40004_28"] = "{40004, 28, 19, {{10,3192},{10006,7}}, 108520, {{10,65112},{10006,111}}, \"治疗\", {{'cure',140}}}",
	["10001_19"] = "{10001, 19, 10, {{10,2120},{10006,5}}, 59436, {{10,33020},{10006,55}}, \"对坦克增伤\", {{'dam',95}}}",
	["20004_28"] = "{20004, 28, 19, {{10,3192},{10006,7}}, 108520, {{10,65112},{10006,111}}, \"暴击\", {{'crit_rate',84}}}",
	["30003_12"] = "{30003, 12, 3, {{10,2184},{10006,4}}, 38880, {{10,23328},{10006,23}}, \"生命\", {{'hp_max_per',60}}}",
	["30002_6"] = "{30002, 6, 0, {{10,1620},{10006,2}}, 16740, {{10,9300},{10006,7}}, \"对法师免伤\", {{'res_p',30}}}",
	["10003_12"] = "{10003, 12, 3, {{10,2184},{10006,4}}, 38880, {{10,23328},{10006,23}}, \"攻击\", {{'atk_per',60}}}",
	["20003_36"] = "{20003, 36, 27, {{10,3960},{10006,10}}, 155560, {{10,93336},{10006,180}}, \"攻击\", {{'atk_per',180}}}",
	["20001_13"] = "{20001, 13, 4, {{10,1860},{10006,4}}, 38268, {{10,21260},{10006,27}}, \"对坦克增伤\", {{'dam',65}}}",
	["20001_5"] = "{20001, 5, 0, {{10,1600},{10006,2}}, 13860, {{10,7700},{10006,5}}, \"对坦克增伤\", {{'dam',25}}}",
	["30001_30"] = "{30001, 30, 21, {{10,2820},{10006,9}}, 107388, {{10,59660},{10006,125}}, \"对战士免伤\", {{'res_p',150}}}",
	["20001_25"] = "{20001, 25, 16, {{10,2480},{10006,7}}, 83952, {{10,46640},{10006,90}}, \"对坦克增伤\", {{'dam',125}}}",
	["10004_40"] = "{10004, 40, 0, {}, 182960, {{10,109776},{10006,220}}, \"暴伤\", {{'crit_ratio',200}}}",
	["20003_1"] = "{20003, 1, 0, {{10,1824},{10006,1}}, 3000, {{10,1800},{10006,1}}, \"攻击\", {{'atk_per',5}}}",
	["30004_38"] = "{30004, 38, 29, {{10,4152},{10006,10}}, 168920, {{10,101352},{10006,200}}, \"抗暴\", {{'tenacity',114}}}",
	["40002_0"] = "{40002, 0, 0, {{10,1500},{10006,1}}, 0, {}, \"对法师免伤\", {{'res_p',0}}}",
	["10004_38"] = "{10004, 38, 29, {{10,4152},{10006,10}}, 168920, {{10,101352},{10006,200}}, \"暴伤\", {{'crit_ratio',190}}}",
	["30003_26"] = "{30003, 26, 17, {{10,3048},{10006,7}}, 98240, {{10,58944},{10006,97}}, \"生命\", {{'hp_max_per',130}}}",
	["20002_0"] = "{20002, 0, 0, {{10,1500},{10006,1}}, 0, {}, \"对辅助增伤\", {{'dam',0}}}",
	["30001_3"] = "{30001, 3, 0, {{10,1560},{10006,1}}, 8208, {{10,4560},{10006,3}}, \"对战士免伤\", {{'res_p',15}}}",
	["20001_20"] = "{20001, 20, 11, {{10,2180},{10006,6}}, 63252, {{10,35140},{10006,60}}, \"对坦克增伤\", {{'dam',100}}}",
	["30004_4"] = "{30004, 4, 0, {{10,1896},{10006,1}}, 12240, {{10,7344},{10006,4}}, \"抗暴\", {{'tenacity',12}}}",
	["40001_9"] = "{40001, 9, 0, {{10,1700},{10006,2}}, 25596, {{10,14220},{10006,13}}, \"对战士免伤\", {{'res_p',45}}}",
	["40001_33"] = "{40001, 33, 24, {{10,3060},{10006,9}}, 123048, {{10,68360},{10006,152}}, \"对战士免伤\", {{'res_p',165}}}",
	["30001_39"] = "{30001, 39, 30, {{10,3560},{10006,10}}, 158256, {{10,87920},{10006,210}}, \"对战士免伤\", {{'res_p',195}}}",
	["40002_5"] = "{40002, 5, 0, {{10,1600},{10006,2}}, 13860, {{10,7700},{10006,5}}, \"对法师免伤\", {{'res_p',25}}}",
	["20001_9"] = "{20001, 9, 0, {{10,1700},{10006,2}}, 25596, {{10,14220},{10006,13}}, \"对坦克增伤\", {{'dam',45}}}",
	["20002_24"] = "{20002, 24, 15, {{10,2420},{10006,6}}, 79596, {{10,44220},{10006,84}}, \"对辅助增伤\", {{'dam',120}}}",
	["20002_5"] = "{20002, 5, 0, {{10,1600},{10006,2}}, 13860, {{10,7700},{10006,5}}, \"对辅助增伤\", {{'dam',25}}}",
	["20001_33"] = "{20001, 33, 24, {{10,3060},{10006,9}}, 123048, {{10,68360},{10006,152}}, \"对坦克增伤\", {{'dam',165}}}",
	["40001_29"] = "{40001, 29, 20, {{10,2740},{10006,7}}, 102456, {{10,56920},{10006,118}}, \"对战士免伤\", {{'res_p',145}}}",
	["30003_16"] = "{30003, 16, 7, {{10,2376},{10006,5}}, 53920, {{10,32352},{10006,40}}, \"生命\", {{'hp_max_per',80}}}",
	["10003_16"] = "{10003, 16, 7, {{10,2376},{10006,5}}, 53920, {{10,32352},{10006,40}}, \"攻击\", {{'atk_per',80}}}",
	["40001_40"] = "{40001, 40, 0, {}, 164664, {{10,91480},{10006,220}}, \"对战士免伤\", {{'res_p',200}}}",
	["30002_7"] = "{30002, 7, 0, {{10,1640},{10006,2}}, 19656, {{10,10920},{10006,9}}, \"对法师免伤\", {{'res_p',35}}}",
	["30004_0"] = "{30004, 0, 0, {{10,1800},{10006,1}}, 0, {}, \"抗暴\", {{'tenacity',0}}}",
	["30002_34"] = "{30002, 34, 25, {{10,3140},{10006,9}}, 128556, {{10,71420},{10006,161}}, \"对法师免伤\", {{'res_p',170}}}",
	["40002_9"] = "{40002, 9, 0, {{10,1700},{10006,2}}, 25596, {{10,14220},{10006,13}}, \"对法师免伤\", {{'res_p',45}}}",
	["20001_40"] = "{20001, 40, 0, {}, 164664, {{10,91480},{10006,220}}, \"对坦克增伤\", {{'dam',200}}}",
	["20002_9"] = "{20002, 9, 0, {{10,1700},{10006,2}}, 25596, {{10,14220},{10006,13}}, \"对辅助增伤\", {{'dam',45}}}",
	["20004_6"] = "{20004, 6, 0, {{10,1944},{10006,2}}, 18600, {{10,11160},{10006,7}}, \"暴击\", {{'crit_rate',18}}}",
	["40001_25"] = "{40001, 25, 16, {{10,2480},{10006,7}}, 83952, {{10,46640},{10006,90}}, \"对战士免伤\", {{'res_p',125}}}",
	["40004_6"] = "{40004, 6, 0, {{10,1944},{10006,2}}, 18600, {{10,11160},{10006,7}}, \"治疗\", {{'cure',30}}}",
	["30002_22"] = "{30002, 22, 13, {{10,2300},{10006,6}}, 71208, {{10,39560},{10006,72}}, \"对法师免伤\", {{'res_p',110}}}",
	["10002_22"] = "{10002, 22, 13, {{10,2300},{10006,6}}, 71208, {{10,39560},{10006,72}}, \"对辅助增伤\", {{'dam',110}}}",
	["30004_3"] = "{30004, 3, 0, {{10,1872},{10006,1}}, 9120, {{10,5472},{10006,3}}, \"抗暴\", {{'tenacity',9}}}",
	["30002_14"] = "{30002, 14, 5, {{10,1900},{10006,4}}, 41616, {{10,23120},{10006,31}}, \"对法师免伤\", {{'res_p',70}}}",
	["40002_32"] = "{40002, 32, 23, {{10,2980},{10006,9}}, 117684, {{10,65380},{10006,143}}, \"对法师免伤\", {{'res_p',160}}}",
	["10002_14"] = "{10002, 14, 5, {{10,1900},{10006,4}}, 41616, {{10,23120},{10006,31}}, \"对辅助增伤\", {{'dam',70}}}",
	["20002_32"] = "{20002, 32, 23, {{10,2980},{10006,9}}, 117684, {{10,65380},{10006,143}}, \"对辅助增伤\", {{'dam',160}}}",
	["20004_1"] = "{20004, 1, 0, {{10,1824},{10006,1}}, 3000, {{10,1800},{10006,1}}, \"暴击\", {{'crit_rate',3}}}",
	["20001_21"] = "{20001, 21, 12, {{10,2240},{10006,6}}, 67176, {{10,37320},{10006,66}}, \"对坦克增伤\", {{'dam',105}}}",
	["30003_3"] = "{30003, 3, 0, {{10,1872},{10006,1}}, 9120, {{10,5472},{10006,3}}, \"生命\", {{'hp_max_per',15}}}",
	["40001_1"] = "{40001, 1, 0, {{10,1520},{10006,1}}, 2700, {{10,1500},{10006,1}}, \"对战士免伤\", {{'res_p',5}}}",
	["30004_19"] = "{30004, 19, 10, {{10,2544},{10006,5}}, 66040, {{10,39624},{10006,55}}, \"抗暴\", {{'tenacity',57}}}",
	["20001_1"] = "{20001, 1, 0, {{10,1520},{10006,1}}, 2700, {{10,1500},{10006,1}}, \"对坦克增伤\", {{'dam',5}}}",
	["10004_20"] = "{10004, 20, 11, {{10,2616},{10006,6}}, 70280, {{10,42168},{10006,60}}, \"暴伤\", {{'crit_ratio',100}}}",
	["20001_29"] = "{20001, 29, 20, {{10,2740},{10006,7}}, 102456, {{10,56920},{10006,118}}, \"对坦克增伤\", {{'dam',145}}}",
	["20004_13"] = "{20004, 13, 4, {{10,2232},{10006,4}}, 42520, {{10,25512},{10006,27}}, \"暴击\", {{'crit_rate',39}}}",
	["30002_26"] = "{30002, 26, 17, {{10,2540},{10006,7}}, 88416, {{10,49120},{10006,97}}, \"对法师免伤\", {{'res_p',130}}}",
	["10002_26"] = "{10002, 26, 17, {{10,2540},{10006,7}}, 88416, {{10,49120},{10006,97}}, \"对辅助增伤\", {{'dam',130}}}",
	["40002_12"] = "{40002, 12, 3, {{10,1820},{10006,4}}, 34992, {{10,19440},{10006,23}}, \"对法师免伤\", {{'res_p',60}}}",
	["20002_12"] = "{20002, 12, 3, {{10,1820},{10006,4}}, 34992, {{10,19440},{10006,23}}, \"对辅助增伤\", {{'dam',60}}}",
	["20002_21"] = "{20002, 21, 12, {{10,2240},{10006,6}}, 67176, {{10,37320},{10006,66}}, \"对辅助增伤\", {{'dam',105}}}",
	["40002_28"] = "{40002, 28, 19, {{10,2660},{10006,7}}, 97668, {{10,54260},{10006,111}}, \"对法师免伤\", {{'res_p',140}}}",
	["30003_30"] = "{30003, 30, 21, {{10,3384},{10006,9}}, 119320, {{10,71592},{10006,125}}, \"生命\", {{'hp_max_per',150}}}",
	["30004_40"] = "{30004, 40, 0, {}, 182960, {{10,109776},{10006,220}}, \"抗暴\", {{'tenacity',120}}}",
	["20004_8"] = "{20004, 8, 0, {{10,1992},{10006,2}}, 25120, {{10,15072},{10006,11}}, \"暴击\", {{'crit_rate',24}}}",
	["30004_23"] = "{30004, 23, 14, {{10,2832},{10006,6}}, 83720, {{10,50232},{10006,78}}, \"抗暴\", {{'tenacity',69}}}",
	["10004_23"] = "{10004, 23, 14, {{10,2832},{10006,6}}, 83720, {{10,50232},{10006,78}}, \"暴伤\", {{'crit_ratio',115}}}",
	["30002_31"] = "{30002, 31, 22, {{10,2900},{10006,9}}, 112464, {{10,62480},{10006,134}}, \"对法师免伤\", {{'res_p',155}}}",
	["20003_20"] = "{20003, 20, 11, {{10,2616},{10006,6}}, 70280, {{10,42168},{10006,60}}, \"攻击\", {{'atk_per',100}}}",
	["30004_39"] = "{30004, 39, 30, {{10,4272},{10006,10}}, 175840, {{10,105504},{10006,210}}, \"抗暴\", {{'tenacity',117}}}",
	["10004_39"] = "{10004, 39, 30, {{10,4272},{10006,10}}, 175840, {{10,105504},{10006,210}}, \"暴伤\", {{'crit_ratio',195}}}",
	["40004_33"] = "{40004, 33, 24, {{10,3672},{10006,9}}, 136720, {{10,82032},{10006,152}}, \"治疗\", {{'cure',165}}}",
	["30003_4"] = "{30003, 4, 0, {{10,1896},{10006,1}}, 12240, {{10,7344},{10006,4}}, \"生命\", {{'hp_max_per',20}}}",
	["20004_33"] = "{20004, 33, 24, {{10,3672},{10006,9}}, 136720, {{10,82032},{10006,152}}, \"暴击\", {{'crit_rate',99}}}",
	["40004_25"] = "{40004, 25, 16, {{10,2976},{10006,7}}, 93280, {{10,55968},{10006,90}}, \"治疗\", {{'cure',125}}}",
	["40003_39"] = "{40003, 39, 30, {{10,4272},{10006,10}}, 175840, {{10,105504},{10006,210}}, \"生命\", {{'hp_max_per',195}}}",
	["20004_25"] = "{20004, 25, 16, {{10,2976},{10006,7}}, 93280, {{10,55968},{10006,90}}, \"暴击\", {{'crit_rate',75}}}",
	["20003_39"] = "{20003, 39, 30, {{10,4272},{10006,10}}, 175840, {{10,105504},{10006,210}}, \"攻击\", {{'atk_per',195}}}",
	["30003_33"] = "{30003, 33, 24, {{10,3672},{10006,9}}, 136720, {{10,82032},{10006,152}}, \"生命\", {{'hp_max_per',165}}}",
	["10003_33"] = "{10003, 33, 24, {{10,3672},{10006,9}}, 136720, {{10,82032},{10006,152}}, \"攻击\", {{'atk_per',165}}}",
	["40002_16"] = "{40002, 16, 7, {{10,1980},{10006,5}}, 48528, {{10,26960},{10006,40}}, \"对法师免伤\", {{'res_p',80}}}",
	["20002_16"] = "{20002, 16, 7, {{10,1980},{10006,5}}, 48528, {{10,26960},{10006,40}}, \"对辅助增伤\", {{'dam',80}}}",
	["30003_10"] = "{30003, 10, 1, {{10,2088},{10006,4}}, 31840, {{10,19104},{10006,15}}, \"生命\", {{'hp_max_per',50}}}",
	["20003_6"] = "{20003, 6, 0, {{10,1944},{10006,2}}, 18600, {{10,11160},{10006,7}}, \"攻击\", {{'atk_per',30}}}",
	["40001_7"] = "{40001, 7, 0, {{10,1640},{10006,2}}, 19656, {{10,10920},{10006,9}}, \"对战士免伤\", {{'res_p',35}}}",
	["20003_29"] = "{20003, 29, 20, {{10,3288},{10006,7}}, 113840, {{10,68304},{10006,118}}, \"攻击\", {{'atk_per',145}}}",
	["10004_35"] = "{10004, 35, 26, {{10,3864},{10006,10}}, 149120, {{10,89472},{10006,170}}, \"暴伤\", {{'crit_ratio',175}}}",
	["20001_7"] = "{20001, 7, 0, {{10,1640},{10006,2}}, 19656, {{10,10920},{10006,9}}, \"对坦克增伤\", {{'dam',35}}}",
	["20003_23"] = "{20003, 23, 14, {{10,2832},{10006,6}}, 83720, {{10,50232},{10006,78}}, \"攻击\", {{'atk_per',115}}}",
	["40003_35"] = "{40003, 35, 26, {{10,3864},{10006,10}}, 149120, {{10,89472},{10006,170}}, \"生命\", {{'hp_max_per',175}}}",
	["20003_35"] = "{20003, 35, 26, {{10,3864},{10006,10}}, 149120, {{10,89472},{10006,170}}, \"攻击\", {{'atk_per',175}}}",
	["30002_11"] = "{30002, 11, 2, {{10,1780},{10006,4}}, 31788, {{10,17660},{10006,19}}, \"对法师免伤\", {{'res_p',55}}}",
	["30002_18"] = "{30002, 18, 9, {{10,2060},{10006,5}}, 55728, {{10,30960},{10006,50}}, \"对法师免伤\", {{'res_p',90}}}",
	["10002_18"] = "{10002, 18, 9, {{10,2060},{10006,5}}, 55728, {{10,30960},{10006,50}}, \"对辅助增伤\", {{'dam',90}}}",
	["30003_19"] = "{30003, 19, 10, {{10,2544},{10006,5}}, 66040, {{10,39624},{10006,55}}, \"生命\", {{'hp_max_per',95}}}",
	["30003_25"] = "{30003, 25, 16, {{10,2976},{10006,7}}, 93280, {{10,55968},{10006,90}}, \"生命\", {{'hp_max_per',125}}}",
	["10003_19"] = "{10003, 19, 10, {{10,2544},{10006,5}}, 66040, {{10,39624},{10006,55}}, \"攻击\", {{'atk_per',95}}}",
	["40003_13"] = "{40003, 13, 4, {{10,2232},{10006,4}}, 42520, {{10,25512},{10006,27}}, \"生命\", {{'hp_max_per',65}}}",
	["20003_13"] = "{20003, 13, 4, {{10,2232},{10006,4}}, 42520, {{10,25512},{10006,27}}, \"攻击\", {{'atk_per',65}}}",
	["40004_10"] = "{40004, 10, 1, {{10,2088},{10006,4}}, 31840, {{10,19104},{10006,15}}, \"治疗\", {{'cure',50}}}",
	["20004_10"] = "{20004, 10, 1, {{10,2088},{10006,4}}, 31840, {{10,19104},{10006,15}}, \"暴击\", {{'crit_rate',30}}}",
	["40001_16"] = "{40001, 16, 7, {{10,1980},{10006,5}}, 48528, {{10,26960},{10006,40}}, \"对战士免伤\", {{'res_p',80}}}",
	["40004_17"] = "{40004, 17, 8, {{10,2424},{10006,5}}, 57880, {{10,34728},{10006,45}}, \"治疗\", {{'cure',85}}}",
	["20004_17"] = "{20004, 17, 8, {{10,2424},{10006,5}}, 57880, {{10,34728},{10006,45}}, \"暴击\", {{'crit_rate',51}}}",
	["30003_15"] = "{30003, 15, 6, {{10,2328},{10006,5}}, 50040, {{10,30024},{10006,35}}, \"生命\", {{'hp_max_per',75}}}",
	["10003_15"] = "{10003, 15, 6, {{10,2328},{10006,5}}, 50040, {{10,30024},{10006,35}}, \"攻击\", {{'atk_per',75}}}",
	["20001_16"] = "{20001, 16, 7, {{10,1980},{10006,5}}, 48528, {{10,26960},{10006,40}}, \"对坦克增伤\", {{'dam',80}}}",
	["40002_2"] = "{40002, 2, 0, {{10,1540},{10006,1}}, 5436, {{10,3020},{10006,2}}, \"对法师免伤\", {{'res_p',10}}}",
	["20002_2"] = "{20002, 2, 0, {{10,1540},{10006,1}}, 5436, {{10,3020},{10006,2}}, \"对辅助增伤\", {{'dam',10}}}",
	["40003_6"] = "{40003, 6, 0, {{10,1944},{10006,2}}, 18600, {{10,11160},{10006,7}}, \"生命\", {{'hp_max_per',30}}}",
	["30004_20"] = "{30004, 20, 11, {{10,2616},{10006,6}}, 70280, {{10,42168},{10006,60}}, \"抗暴\", {{'tenacity',60}}}",
	["30001_18"] = "{30001, 18, 9, {{10,2060},{10006,5}}, 55728, {{10,30960},{10006,50}}, \"对战士免伤\", {{'res_p',90}}}",
	["30004_27"] = "{30004, 27, 18, {{10,3120},{10006,7}}, 103320, {{10,61992},{10006,104}}, \"抗暴\", {{'tenacity',81}}}",
	["10004_27"] = "{10004, 27, 18, {{10,3120},{10006,7}}, 103320, {{10,61992},{10006,104}}, \"暴伤\", {{'crit_ratio',135}}}",
	["40001_36"] = "{40001, 36, 27, {{10,3300},{10006,10}}, 140004, {{10,77780},{10006,180}}, \"对战士免伤\", {{'res_p',180}}}",
	["40004_30"] = "{40004, 30, 21, {{10,3384},{10006,9}}, 119320, {{10,71592},{10006,125}}, \"治疗\", {{'cure',150}}}",
	["40003_40"] = "{40003, 40, 0, {}, 182960, {{10,109776},{10006,220}}, \"生命\", {{'hp_max_per',200}}}",
	["20004_30"] = "{20004, 30, 21, {{10,3384},{10006,9}}, 119320, {{10,71592},{10006,125}}, \"暴击\", {{'crit_rate',90}}}",
	["20003_40"] = "{20003, 40, 0, {}, 182960, {{10,109776},{10006,220}}, \"攻击\", {{'atk_per',200}}}",
	["40004_37"] = "{40004, 37, 28, {{10,4056},{10006,10}}, 162160, {{10,97296},{10006,190}}, \"治疗\", {{'cure',185}}}",
	["20001_36"] = "{20001, 36, 27, {{10,3300},{10006,10}}, 140004, {{10,77780},{10006,180}}, \"对坦克增伤\", {{'dam',180}}}",
	["40002_1"] = "{40002, 1, 0, {{10,1520},{10006,1}}, 2700, {{10,1500},{10006,1}}, \"对法师免伤\", {{'res_p',5}}}",
	["20002_1"] = "{20002, 1, 0, {{10,1520},{10006,1}}, 2700, {{10,1500},{10006,1}}, \"对辅助增伤\", {{'dam',5}}}",
	["10001_14"] = "{10001, 14, 5, {{10,1900},{10006,4}}, 41616, {{10,23120},{10006,31}}, \"对坦克增伤\", {{'dam',70}}}",
	["30003_37"] = "{30003, 37, 28, {{10,4056},{10006,10}}, 162160, {{10,97296},{10006,190}}, \"生命\", {{'hp_max_per',185}}}",
	["40001_2"] = "{40001, 2, 0, {{10,1540},{10006,1}}, 5436, {{10,3020},{10006,2}}, \"对战士免伤\", {{'res_p',10}}}",
	["30001_26"] = "{30001, 26, 17, {{10,2540},{10006,7}}, 88416, {{10,49120},{10006,97}}, \"对战士免伤\", {{'res_p',130}}}",
	["10001_26"] = "{10001, 26, 17, {{10,2540},{10006,7}}, 88416, {{10,49120},{10006,97}}, \"对坦克增伤\", {{'dam',130}}}",
	["20001_2"] = "{20001, 2, 0, {{10,1540},{10006,1}}, 5436, {{10,3020},{10006,2}}, \"对坦克增伤\", {{'dam',10}}}",
	["30001_38"] = "{30001, 38, 29, {{10,3460},{10006,10}}, 152028, {{10,84460},{10006,200}}, \"对战士免伤\", {{'res_p',190}}}",
	["10001_38"] = "{10001, 38, 29, {{10,3460},{10006,10}}, 152028, {{10,84460},{10006,200}}, \"对坦克增伤\", {{'dam',190}}}",
	["20003_2"] = "{20003, 2, 0, {{10,1848},{10006,1}}, 6040, {{10,3624},{10006,2}}, \"攻击\", {{'atk_per',10}}}",
	["30002_23"] = "{30002, 23, 14, {{10,2360},{10006,6}}, 75348, {{10,41860},{10006,78}}, \"对法师免伤\", {{'res_p',115}}}",
	["40003_27"] = "{40003, 27, 18, {{10,3120},{10006,7}}, 103320, {{10,61992},{10006,104}}, \"生命\", {{'hp_max_per',135}}}",
	["10002_23"] = "{10002, 23, 14, {{10,2360},{10006,6}}, 75348, {{10,41860},{10006,78}}, \"对辅助增伤\", {{'dam',115}}}",
	["20003_27"] = "{20003, 27, 18, {{10,3120},{10006,7}}, 103320, {{10,61992},{10006,104}}, \"攻击\", {{'atk_per',135}}}",
	["40001_28"] = "{40001, 28, 19, {{10,2660},{10006,7}}, 97668, {{10,54260},{10006,111}}, \"对战士免伤\", {{'res_p',140}}}",
	["30002_3"] = "{30002, 3, 0, {{10,1560},{10006,1}}, 8208, {{10,4560},{10006,3}}, \"对法师免伤\", {{'res_p',15}}}",
	["30001_21"] = "{30001, 21, 12, {{10,2240},{10006,6}}, 67176, {{10,37320},{10006,66}}, \"对战士免伤\", {{'res_p',105}}}",
	["40002_33"] = "{40002, 33, 24, {{10,3060},{10006,9}}, 123048, {{10,68360},{10006,152}}, \"对法师免伤\", {{'res_p',165}}}",
	["30002_4"] = "{30002, 4, 0, {{10,1580},{10006,1}}, 11016, {{10,6120},{10006,4}}, \"对法师免伤\", {{'res_p',20}}}",
	["20001_28"] = "{20001, 28, 19, {{10,2660},{10006,7}}, 97668, {{10,54260},{10006,111}}, \"对坦克增伤\", {{'dam',140}}}",
	["40002_25"] = "{40002, 25, 16, {{10,2480},{10006,7}}, 83952, {{10,46640},{10006,90}}, \"对法师免伤\", {{'res_p',125}}}",
	["20002_25"] = "{20002, 25, 16, {{10,2480},{10006,7}}, 83952, {{10,46640},{10006,90}}, \"对辅助增伤\", {{'dam',125}}}",
	["30001_34"] = "{30001, 34, 25, {{10,3140},{10006,9}}, 128556, {{10,71420},{10006,161}}, \"对战士免伤\", {{'res_p',170}}}",
	["10001_34"] = "{10001, 34, 25, {{10,3140},{10006,9}}, 128556, {{10,71420},{10006,161}}, \"对坦克增伤\", {{'dam',170}}}",
	["40001_12"] = "{40001, 12, 3, {{10,1820},{10006,4}}, 34992, {{10,19440},{10006,23}}, \"对战士免伤\", {{'res_p',60}}}",
	["40003_17"] = "{40003, 17, 8, {{10,2424},{10006,5}}, 57880, {{10,34728},{10006,45}}, \"生命\", {{'hp_max_per',85}}}",
	["20004_7"] = "{20004, 7, 0, {{10,1968},{10006,2}}, 21840, {{10,13104},{10006,9}}, \"暴击\", {{'crit_rate',21}}}",
	["20003_17"] = "{20003, 17, 8, {{10,2424},{10006,5}}, 57880, {{10,34728},{10006,45}}, \"攻击\", {{'atk_per',85}}}",
	["40001_24"] = "{40001, 24, 15, {{10,2420},{10006,6}}, 79596, {{10,44220},{10006,84}}, \"对战士免伤\", {{'res_p',120}}}",
	["20001_12"] = "{20001, 12, 3, {{10,1820},{10006,4}}, 34992, {{10,19440},{10006,23}}, \"对坦克增伤\", {{'dam',60}}}",
	["40004_7"] = "{40004, 7, 0, {{10,1968},{10006,2}}, 21840, {{10,13104},{10006,9}}, \"治疗\", {{'cure',35}}}",
	["20001_24"] = "{20001, 24, 15, {{10,2420},{10006,6}}, 79596, {{10,44220},{10006,84}}, \"对坦克增伤\", {{'dam',120}}}",
	["40002_13"] = "{40002, 13, 4, {{10,1860},{10006,4}}, 38268, {{10,21260},{10006,27}}, \"对法师免伤\", {{'res_p',65}}}",
	["20002_13"] = "{20002, 13, 4, {{10,1860},{10006,4}}, 38268, {{10,21260},{10006,27}}, \"对辅助增伤\", {{'dam',65}}}",
	["30004_5"] = "{30004, 5, 0, {{10,1920},{10006,2}}, 15400, {{10,9240},{10006,5}}, \"抗暴\", {{'tenacity',15}}}",
	["40003_2"] = "{40003, 2, 0, {{10,1848},{10006,1}}, 6040, {{10,3624},{10006,2}}, \"生命\", {{'hp_max_per',10}}}",
	["20004_2"] = "{20004, 2, 0, {{10,1848},{10006,1}}, 6040, {{10,3624},{10006,2}}, \"暴击\", {{'crit_rate',6}}}",
	["10002_31"] = "{10002, 31, 22, {{10,2900},{10006,9}}, 112464, {{10,62480},{10006,134}}, \"对辅助增伤\", {{'dam',155}}}",
	["20001_32"] = "{20001, 32, 23, {{10,2980},{10006,9}}, 117684, {{10,65380},{10006,143}}, \"对坦克增伤\", {{'dam',160}}}",
	["40004_11"] = "{40004, 11, 2, {{10,2136},{10006,4}}, 35320, {{10,21192},{10006,19}}, \"治疗\", {{'cure',55}}}",
	["20004_11"] = "{20004, 11, 2, {{10,2136},{10006,4}}, 35320, {{10,21192},{10006,19}}, \"暴击\", {{'crit_rate',33}}}",
	["40004_2"] = "{40004, 2, 0, {{10,1848},{10006,1}}, 6040, {{10,3624},{10006,2}}, \"治疗\", {{'cure',10}}}",
	["30002_15"] = "{30002, 15, 6, {{10,1940},{10006,5}}, 45036, {{10,25020},{10006,35}}, \"对法师免伤\", {{'res_p',75}}}",
	["30001_22"] = "{30001, 22, 13, {{10,2300},{10006,6}}, 71208, {{10,39560},{10006,72}}, \"对战士免伤\", {{'res_p',110}}}",
	["10002_39"] = "{10002, 39, 30, {{10,3560},{10006,10}}, 158256, {{10,87920},{10006,210}}, \"对辅助增伤\", {{'dam',195}}}",
	["30004_21"] = "{30004, 21, 12, {{10,2688},{10006,6}}, 74640, {{10,44784},{10006,66}}, \"抗暴\", {{'tenacity',63}}}",
	["10004_21"] = "{10004, 21, 12, {{10,2688},{10006,6}}, 74640, {{10,44784},{10006,66}}, \"暴伤\", {{'crit_ratio',105}}}",
	["40004_14"] = "{40004, 14, 5, {{10,2280},{10006,4}}, 46240, {{10,27744},{10006,31}}, \"治疗\", {{'cure',70}}}",
	["10002_20"] = "{10002, 20, 11, {{10,2180},{10006,6}}, 63252, {{10,35140},{10006,60}}, \"对辅助增伤\", {{'dam',100}}}",
	["20004_14"] = "{20004, 14, 5, {{10,2280},{10006,4}}, 46240, {{10,27744},{10006,31}}, \"暴击\", {{'crit_rate',42}}}",
	["10002_11"] = "{10002, 11, 2, {{10,1780},{10006,4}}, 31788, {{10,17660},{10006,19}}, \"对辅助增伤\", {{'dam',55}}}",
	["10002_35"] = "{10002, 35, 26, {{10,3220},{10006,10}}, 134208, {{10,74560},{10006,170}}, \"对辅助增伤\", {{'dam',175}}}",
	["30002_27"] = "{30002, 27, 18, {{10,2600},{10006,7}}, 92988, {{10,51660},{10006,104}}, \"对法师免伤\", {{'res_p',135}}}",
	["10002_27"] = "{10002, 27, 18, {{10,2600},{10006,7}}, 92988, {{10,51660},{10006,104}}, \"对辅助增伤\", {{'dam',135}}}",
	["40004_31"] = "{40004, 31, 22, {{10,3480},{10006,9}}, 124960, {{10,74976},{10006,134}}, \"治疗\", {{'cure',155}}}",
	["40002_30"] = "{40002, 30, 21, {{10,2820},{10006,9}}, 107388, {{10,59660},{10006,125}}, \"对法师免伤\", {{'res_p',150}}}",
	["40004_9"] = "{40004, 9, 0, {{10,2040},{10006,2}}, 28440, {{10,17064},{10006,13}}, \"治疗\", {{'cure',45}}}",
	["20002_30"] = "{20002, 30, 21, {{10,2820},{10006,9}}, 107388, {{10,59660},{10006,125}}, \"对辅助增伤\", {{'dam',150}}}",
	["40002_37"] = "{40002, 37, 28, {{10,3380},{10006,10}}, 145944, {{10,81080},{10006,190}}, \"对法师免伤\", {{'res_p',185}}}",
	["10002_19"] = "{10002, 19, 10, {{10,2120},{10006,5}}, 59436, {{10,33020},{10006,55}}, \"对辅助增伤\", {{'dam',95}}}",
	["20002_37"] = "{20002, 37, 28, {{10,3380},{10006,10}}, 145944, {{10,81080},{10006,190}}, \"对辅助增伤\", {{'dam',185}}}",
	["40003_31"] = "{40003, 31, 22, {{10,3480},{10006,9}}, 124960, {{10,74976},{10006,134}}, \"生命\", {{'hp_max_per',155}}}",
	["20002_29"] = "{20002, 29, 20, {{10,2740},{10006,7}}, 102456, {{10,56920},{10006,118}}, \"对辅助增伤\", {{'dam',145}}}",
	["30004_24"] = "{30004, 24, 15, {{10,2904},{10006,6}}, 88440, {{10,53064},{10006,84}}, \"抗暴\", {{'tenacity',72}}}",
	["10004_24"] = "{10004, 24, 15, {{10,2904},{10006,6}}, 88440, {{10,53064},{10006,84}}, \"暴伤\", {{'crit_ratio',120}}}",
	["30003_21"] = "{30003, 21, 12, {{10,2688},{10006,6}}, 74640, {{10,44784},{10006,66}}, \"生命\", {{'hp_max_per',105}}}",
	["10003_21"] = "{10003, 21, 12, {{10,2688},{10006,6}}, 74640, {{10,44784},{10006,66}}, \"攻击\", {{'atk_per',105}}}",
	["30001_6"] = "{30001, 6, 0, {{10,1620},{10006,2}}, 16740, {{10,9300},{10006,7}}, \"对战士免伤\", {{'res_p',30}}}",
	["40004_34"] = "{40004, 34, 25, {{10,3768},{10006,9}}, 142840, {{10,85704},{10006,161}}, \"治疗\", {{'cure',170}}}",
	["30002_39"] = "{30002, 39, 30, {{10,3560},{10006,10}}, 158256, {{10,87920},{10006,210}}, \"对法师免伤\", {{'res_p',195}}}",
	["20004_34"] = "{20004, 34, 25, {{10,3768},{10006,9}}, 142840, {{10,85704},{10006,161}}, \"暴击\", {{'crit_rate',102}}}",
	["30004_12"] = "{30004, 12, 3, {{10,2184},{10006,4}}, 38880, {{10,23328},{10006,23}}, \"抗暴\", {{'tenacity',36}}}",
	["10004_12"] = "{10004, 12, 3, {{10,2184},{10006,4}}, 38880, {{10,23328},{10006,23}}, \"暴伤\", {{'crit_ratio',60}}}",
	["40003_34"] = "{40003, 34, 25, {{10,3768},{10006,9}}, 142840, {{10,85704},{10006,161}}, \"生命\", {{'hp_max_per',170}}}",
	["20003_34"] = "{20003, 34, 25, {{10,3768},{10006,9}}, 142840, {{10,85704},{10006,161}}, \"攻击\", {{'atk_per',170}}}",
	["40002_10"] = "{40002, 10, 1, {{10,1740},{10006,4}}, 28656, {{10,15920},{10006,15}}, \"对法师免伤\", {{'res_p',50}}}",
	["20002_10"] = "{20002, 10, 1, {{10,1740},{10006,4}}, 28656, {{10,15920},{10006,15}}, \"对辅助增伤\", {{'dam',50}}}",
	["40002_17"] = "{40002, 17, 8, {{10,2020},{10006,5}}, 52092, {{10,28940},{10006,45}}, \"对法师免伤\", {{'res_p',85}}}",
	["20002_17"] = "{20002, 17, 8, {{10,2020},{10006,5}}, 52092, {{10,28940},{10006,45}}, \"对辅助增伤\", {{'dam',85}}}",
	["40003_11"] = "{40003, 11, 2, {{10,2136},{10006,4}}, 35320, {{10,21192},{10006,19}}, \"生命\", {{'hp_max_per',55}}}",
	["20003_11"] = "{20003, 11, 2, {{10,2136},{10006,4}}, 35320, {{10,21192},{10006,19}}, \"攻击\", {{'atk_per',55}}}",
	["30003_18"] = "{30003, 18, 9, {{10,2472},{10006,5}}, 61920, {{10,37152},{10006,50}}, \"生命\", {{'hp_max_per',90}}}",
	["20001_4"] = "{20001, 4, 0, {{10,1580},{10006,1}}, 11016, {{10,6120},{10006,4}}, \"对坦克增伤\", {{'dam',20}}}",
	["30003_9"] = "{30003, 9, 0, {{10,2040},{10006,2}}, 28440, {{10,17064},{10006,13}}, \"生命\", {{'hp_max_per',45}}}",
	["20004_9"] = "{20004, 9, 0, {{10,2040},{10006,2}}, 28440, {{10,17064},{10006,13}}, \"暴击\", {{'crit_rate',27}}}",
	["40004_22"] = "{40004, 22, 13, {{10,2760},{10006,6}}, 79120, {{10,47472},{10006,72}}, \"治疗\", {{'cure',110}}}",
	["20004_22"] = "{20004, 22, 13, {{10,2760},{10006,6}}, 79120, {{10,47472},{10006,72}}, \"暴击\", {{'crit_rate',66}}}",
	["30001_25"] = "{30001, 25, 16, {{10,2480},{10006,7}}, 83952, {{10,46640},{10006,90}}, \"对战士免伤\", {{'res_p',125}}}",
	["10001_25"] = "{10001, 25, 16, {{10,2480},{10006,7}}, 83952, {{10,46640},{10006,90}}, \"对坦克增伤\", {{'dam',125}}}",
	["30004_9"] = "{30004, 9, 0, {{10,2040},{10006,2}}, 28440, {{10,17064},{10006,13}}, \"抗暴\", {{'tenacity',27}}}",
	["30002_19"] = "{30002, 19, 10, {{10,2120},{10006,5}}, 59436, {{10,33020},{10006,55}}, \"对法师免伤\", {{'res_p',95}}}",
	["30004_16"] = "{30004, 16, 7, {{10,2376},{10006,5}}, 53920, {{10,32352},{10006,40}}, \"抗暴\", {{'tenacity',48}}}",
	["30004_32"] = "{30004, 32, 23, {{10,3576},{10006,9}}, 130760, {{10,78456},{10006,143}}, \"抗暴\", {{'tenacity',96}}}",
	["10004_32"] = "{10004, 32, 23, {{10,3576},{10006,9}}, 130760, {{10,78456},{10006,143}}, \"暴伤\", {{'crit_ratio',160}}}",
	["20001_8"] = "{20001, 8, 0, {{10,1660},{10006,2}}, 22608, {{10,12560},{10006,11}}, \"对坦克增伤\", {{'dam',40}}}",
	["10003_14"] = "{10003, 14, 5, {{10,2280},{10006,4}}, 46240, {{10,27744},{10006,31}}, \"攻击\", {{'atk_per',70}}}",
	["20001_15"] = "{20001, 15, 6, {{10,1940},{10006,5}}, 45036, {{10,25020},{10006,35}}, \"对坦克增伤\", {{'dam',75}}}",
	["40003_32"] = "{40003, 32, 23, {{10,3576},{10006,9}}, 130760, {{10,78456},{10006,143}}, \"生命\", {{'hp_max_per',160}}}",
	["20003_32"] = "{20003, 32, 23, {{10,3576},{10006,9}}, 130760, {{10,78456},{10006,143}}, \"攻击\", {{'atk_per',160}}}",
	["40001_10"] = "{40001, 10, 1, {{10,1740},{10006,4}}, 28656, {{10,15920},{10006,15}}, \"对战士免伤\", {{'res_p',50}}}",
	["40004_18"] = "{40004, 18, 9, {{10,2472},{10006,5}}, 61920, {{10,37152},{10006,50}}, \"治疗\", {{'cure',90}}}",
	["30002_40"] = "{30002, 40, 0, {}, 164664, {{10,91480},{10006,220}}, \"对法师免伤\", {{'res_p',200}}}",
	["20004_18"] = "{20004, 18, 9, {{10,2472},{10006,5}}, 61920, {{10,37152},{10006,50}}, \"暴击\", {{'crit_rate',54}}}",
	["10002_40"] = "{10002, 40, 0, {}, 164664, {{10,91480},{10006,220}}, \"对辅助增伤\", {{'dam',200}}}",
	["30001_17"] = "{30001, 17, 8, {{10,2020},{10006,5}}, 52092, {{10,28940},{10006,45}}, \"对战士免伤\", {{'res_p',85}}}",
	["40004_26"] = "{40004, 26, 17, {{10,3048},{10006,7}}, 98240, {{10,58944},{10006,97}}, \"治疗\", {{'cure',130}}}",
	["30003_22"] = "{30003, 22, 13, {{10,2760},{10006,6}}, 79120, {{10,47472},{10006,72}}, \"生命\", {{'hp_max_per',110}}}",
	["20004_26"] = "{20004, 26, 17, {{10,3048},{10006,7}}, 98240, {{10,58944},{10006,97}}, \"暴击\", {{'crit_rate',78}}}",
	["10003_22"] = "{10003, 22, 13, {{10,2760},{10006,6}}, 79120, {{10,47472},{10006,72}}, \"攻击\", {{'atk_per',110}}}",
	["40003_7"] = "{40003, 7, 0, {{10,1968},{10006,2}}, 21840, {{10,13104},{10006,9}}, \"生命\", {{'hp_max_per',35}}}",
	["40001_19"] = "{40001, 19, 10, {{10,2120},{10006,5}}, 59436, {{10,33020},{10006,55}}, \"对战士免伤\", {{'res_p',95}}}",
	["20003_7"] = "{20003, 7, 0, {{10,1968},{10006,2}}, 21840, {{10,13104},{10006,9}}, \"攻击\", {{'atk_per',35}}}",
	["30004_36"] = "{30004, 36, 27, {{10,3960},{10006,10}}, 155560, {{10,93336},{10006,180}}, \"抗暴\", {{'tenacity',108}}}",
	["40002_6"] = "{40002, 6, 0, {{10,1620},{10006,2}}, 16740, {{10,9300},{10006,7}}, \"对法师免伤\", {{'res_p',30}}}",
	["10004_36"] = "{10004, 36, 27, {{10,3960},{10006,10}}, 155560, {{10,93336},{10006,180}}, \"暴伤\", {{'crit_ratio',180}}}"
}
Config.GuildSkillData.data_pvp_attr_max_lev_length = 16
Config.GuildSkillData.data_pvp_attr_max_lev = {
	[20001.0] = 40,
	[10002.0] = 40,
	[10001.0] = 40,
	[10003.0] = 40,
	[20004.0] = 40,
	[10004.0] = 40,
	[30001.0] = 40,
	[30002.0] = 40,
	[20003.0] = 40,
	[30003.0] = 40,
	[40003.0] = 40,
	[40002.0] = 40,
	[20002.0] = 40,
	[30004.0] = 40,
	[40001.0] = 40,
	[40004.0] = 40
}
Config.GuildSkillData.data_pvp_skill_info_length = 36
Config.GuildSkillData.data_pvp_skill_info_cache = {}

function Config.GuildSkillData.data_pvp_skill_info(slot0)
	if Config.GuildSkillData.data_pvp_skill_info_cache[slot0] == nil then
		if not Config.GuildSkillData.data_pvp_skill_info_table[slot0] then
			return
		end

		if not loadstring(string.format("return %s", slot1))() then
			return
		end

		Config.GuildSkillData.data_pvp_skill_info_cache[slot0] = {
			skill_id = slot1[1],
			career = slot1[2],
			lev = slot1[3],
			need_lev = slot1[4],
			loss = slot1[5],
			power = slot1[6],
			return_res = slot1[7]
		}
	end

	return Config.GuildSkillData.data_pvp_skill_info_cache[slot0]
end

Config.GuildSkillData.data_pvp_skill_info_table = {
	["3_7"] = "{1001107, 3, 7, 40, {{10,10000},{10006,40}}, 210000, {{10,42000},{10006,145}}}",
	["2_4"] = "{1001204, 2, 4, 25, {{10,7000},{10006,25}}, 120000, {{10,18000},{10006,55}}}",
	["4_8"] = "{1001308, 4, 8, 0, {}, 240000, {{10,52000},{10006,185}}}",
	["2_8"] = "{1001208, 2, 8, 0, {}, 240000, {{10,52000},{10006,185}}}",
	["4_4"] = "{1001304, 4, 4, 25, {{10,7000},{10006,25}}, 120000, {{10,18000},{10006,55}}}",
	["3_0"] = "{0, 3, 0, 5, {{10,3000},{10006,10}}, 0, {}}",
	["5_0"] = "{0, 5, 0, 5, {{10,3000},{10006,10}}, 0, {}}",
	["5_5"] = "{1001405, 5, 5, 30, {{10,8000},{10006,30}}, 150000, {{10,25000},{10006,80}}}",
	["3_2"] = "{1001102, 3, 2, 15, {{10,5000},{10006,15}}, 60000, {{10,7000},{10006,20}}}",
	["3_6"] = "{1001106, 3, 6, 35, {{10,9000},{10006,35}}, 180000, {{10,33000},{10006,110}}}",
	["5_2"] = "{1001402, 5, 2, 15, {{10,5000},{10006,15}}, 60000, {{10,7000},{10006,20}}}",
	["2_2"] = "{1001202, 2, 2, 15, {{10,5000},{10006,15}}, 60000, {{10,7000},{10006,20}}}",
	["2_6"] = "{1001206, 2, 6, 35, {{10,9000},{10006,35}}, 180000, {{10,33000},{10006,110}}}",
	["4_2"] = "{1001302, 4, 2, 15, {{10,5000},{10006,15}}, 60000, {{10,7000},{10006,20}}}",
	["4_6"] = "{1001306, 4, 6, 35, {{10,9000},{10006,35}}, 180000, {{10,33000},{10006,110}}}",
	["3_3"] = "{1001103, 3, 3, 20, {{10,6000},{10006,20}}, 90000, {{10,12000},{10006,35}}}",
	["4_5"] = "{1001305, 4, 5, 30, {{10,8000},{10006,30}}, 150000, {{10,25000},{10006,80}}}",
	["3_1"] = "{1001101, 3, 1, 10, {{10,4000},{10006,10}}, 30000, {{10,3000},{10006,10}}}",
	["5_4"] = "{1001404, 5, 4, 25, {{10,7000},{10006,25}}, 120000, {{10,18000},{10006,55}}}",
	["4_7"] = "{1001307, 4, 7, 40, {{10,10000},{10006,40}}, 210000, {{10,42000},{10006,145}}}",
	["3_5"] = "{1001105, 3, 5, 30, {{10,8000},{10006,30}}, 150000, {{10,25000},{10006,80}}}",
	["5_1"] = "{1001401, 5, 1, 10, {{10,4000},{10006,10}}, 30000, {{10,3000},{10006,10}}}",
	["2_5"] = "{1001205, 2, 5, 30, {{10,8000},{10006,30}}, 150000, {{10,25000},{10006,80}}}",
	["4_1"] = "{1001301, 4, 1, 10, {{10,4000},{10006,10}}, 30000, {{10,3000},{10006,10}}}",
	["5_6"] = "{1001406, 5, 6, 35, {{10,9000},{10006,35}}, 180000, {{10,33000},{10006,110}}}",
	["2_0"] = "{0, 2, 0, 5, {{10,3000},{10006,10}}, 0, {}}",
	["3_4"] = "{1001104, 3, 4, 25, {{10,7000},{10006,25}}, 120000, {{10,18000},{10006,55}}}",
	["4_0"] = "{0, 4, 0, 5, {{10,3000},{10006,10}}, 0, {}}",
	["5_8"] = "{1001408, 5, 8, 0, {}, 240000, {{10,52000},{10006,185}}}",
	["3_8"] = "{1001108, 3, 8, 0, {}, 240000, {{10,52000},{10006,185}}}",
	["2_1"] = "{1001201, 2, 1, 10, {{10,4000},{10006,10}}, 30000, {{10,3000},{10006,10}}}",
	["2_3"] = "{1001203, 2, 3, 20, {{10,6000},{10006,20}}, 90000, {{10,12000},{10006,35}}}",
	["2_7"] = "{1001207, 2, 7, 40, {{10,10000},{10006,40}}, 210000, {{10,42000},{10006,145}}}",
	["4_3"] = "{1001303, 4, 3, 20, {{10,6000},{10006,20}}, 90000, {{10,12000},{10006,35}}}",
	["5_3"] = "{1001403, 5, 3, 20, {{10,6000},{10006,20}}, 90000, {{10,12000},{10006,35}}}",
	["5_7"] = "{1001407, 5, 7, 40, {{10,10000},{10006,40}}, 210000, {{10,42000},{10006,145}}}"
}
