Config = Config or {}
Config.SourceData = Config.SourceData or {}
Config.SourceData.data_source_data_length = 124
Config.SourceData.data_source_data = {
	{
		name = "召唤",
		id = 1,
		res_id = 0,
		evt_type = "evt_partner_call",
		desc = "前往召唤进行召唤吧！",
		lev_limit = {
			"lev",
			1
		},
		extend = {
			0
		},
		drops = {}
	},
	{
		name = "道具商城",
		id = 2,
		res_id = 0,
		evt_type = "evt_mall_buy",
		desc = "道具商城肯定有你需要的！",
		lev_limit = {
			"lev",
			1
		},
		extend = {
			1
		},
		drops = {}
	},
	{
		name = "精灵商店",
		id = 3,
		res_id = 0,
		evt_type = "evt_grocery_store",
		desc = "刷刷刷，小店有惊喜噢！",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	{
		name = "竞技商城",
		id = 4,
		res_id = 0,
		evt_type = "evt_mall_buy",
		desc = "消耗竞技积分，兑换商品吧！",
		lev_limit = {
			"lev",
			8
		},
		extend = {
			6
		},
		drops = {}
	},
	{
		name = "公会商城",
		id = 5,
		res_id = 0,
		evt_type = "evt_mall_buy",
		desc = "消耗公会积分，兑换商品吧！",
		lev_limit = {
			"guild",
			1
		},
		extend = {
			5
		},
		drops = {}
	},
	{
		name = "英雄商城",
		id = 6,
		res_id = 0,
		evt_type = "evt_mall_buy",
		desc = "消耗神格积分，兑换英雄碎片吧！",
		lev_limit = {
			"lev",
			1
		},
		extend = {
			2
		},
		drops = {}
	},
	{
		name = "征战商店",
		id = 7,
		res_id = 0,
		evt_type = "evt_mall_buy",
		desc = "消耗征战勋章，兑换积分吧！",
		lev_limit = {
			"lev",
			30
		},
		extend = {
			8
		},
		drops = {}
	},
	{
		name = "段位商城",
		id = 8,
		res_id = 0,
		evt_type = "evt_mall_buy",
		desc = "消耗荣誉勋章，兑换物品吧！",
		lev_limit = {
			"world_lev",
			100,
			"lev",
			100
		},
		extend = {
			17
		},
		drops = {}
	},
	{
		name = "探宝商城",
		id = 9,
		res_id = 0,
		evt_type = "evt_mall_buy",
		desc = "消耗探宝积分，兑换物品吧！",
		lev_limit = {
			"lev",
			10
		},
		extend = {
			16
		},
		drops = {}
	},
	{
		name = "跨服与组队竞技商店",
		id = 10,
		res_id = 0,
		evt_type = "evt_mall_competition",
		desc = "消耗勇者印记，兑换物品吧！",
		lev_limit = {
			"lev",
			70
		},
		extend = {},
		drops = {}
	},
	{
		name = "激活特权",
		id = 11,
		res_id = 0,
		evt_type = "evt_privilege",
		desc = "激活特权，尊贵游戏体验",
		lev_limit = {
			"lev",
			80
		},
		extend = {},
		drops = {}
	},
	{
		name = "巅峰商店",
		id = 12,
		res_id = 0,
		evt_type = "evt_peak_mall_buy",
		desc = "消耗巅峰币，兑换商品吧！",
		lev_limit = {
			"lev",
			115
		},
		extend = {},
		drops = {}
	},
	{
		name = "星命商店",
		id = 13,
		res_id = 0,
		evt_type = "evt_mall_buy",
		desc = "消耗星灵积分，兑换星命",
		lev_limit = {
			"dungeon",
			20380
		},
		extend = {
			15
		},
		drops = {}
	},
	[20] = {
		name = "VIP5礼包",
		id = 20,
		res_id = 0,
		evt_type = "evt_vip",
		desc = "超值VIP礼包,尊贵游戏体验",
		lev_limit = {
			"dungeon",
			10100
		},
		extend = {
			5
		},
		drops = {}
	},
	[21] = {
		name = "VIP8礼包",
		id = 21,
		res_id = 0,
		evt_type = "evt_vip",
		desc = "超值VIP礼包,尊贵游戏体验",
		lev_limit = {
			"dungeon",
			10100
		},
		extend = {
			8
		},
		drops = {}
	},
	[22] = {
		name = "VIP10礼包",
		id = 22,
		res_id = 0,
		evt_type = "evt_vip",
		desc = "超值VIP礼包,尊贵游戏体验",
		lev_limit = {
			"dungeon",
			10100
		},
		extend = {
			10
		},
		drops = {}
	},
	[23] = {
		name = "VIP12礼包",
		id = 23,
		res_id = 0,
		evt_type = "evt_vip",
		desc = "超值VIP礼包,尊贵游戏体验",
		lev_limit = {
			"dungeon",
			10100
		},
		extend = {
			12
		},
		drops = {}
	},
	[24] = {
		name = "VIP14礼包",
		id = 24,
		res_id = 0,
		evt_type = "evt_vip",
		desc = "超值VIP礼包,尊贵游戏体验",
		lev_limit = {
			"dungeon",
			10100
		},
		extend = {
			14
		},
		drops = {}
	},
	[25] = {
		name = "VIP13礼包",
		id = 25,
		res_id = 0,
		evt_type = "evt_vip",
		desc = "超值VIP礼包,尊贵游戏体验",
		lev_limit = {
			"dungeon",
			10100
		},
		extend = {
			13
		},
		drops = {}
	},
	[30] = {
		name = "装备背包",
		id = 30,
		res_id = 0,
		evt_type = "evt_bag_eqm",
		desc = "出售装备获得",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[31] = {
		name = "碎片背包",
		id = 31,
		res_id = 0,
		evt_type = "evt_bag_partner",
		desc = "碎片合成获得",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[32] = {
		name = "特殊背包",
		id = 32,
		res_id = 0,
		evt_type = "evt_bag_star_life",
		desc = "分解符文获得",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[33] = {
		name = "精灵背包",
		id = 33,
		res_id = 0,
		evt_type = "evt_bag_elfin",
		desc = "精灵羽化获得",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[40] = {
		name = "个人Boss",
		id = 40,
		res_id = 0,
		evt_type = "evt_boss",
		desc = "挑战个人Boss获得",
		lev_limit = {
			"dungeon",
			10400
		},
		extend = {},
		drops = {}
	},
	[41] = {
		name = "世界Boss",
		id = 41,
		res_id = 0,
		evt_type = "evt_world_boss",
		desc = "挑战世界Boss获得",
		lev_limit = {
			"dungeon",
			10400
		},
		extend = {},
		drops = {}
	},
	[42] = {
		name = "竞技场挑战",
		id = 42,
		res_id = 0,
		evt_type = "evt_arena",
		desc = "前往竞技场挑战获得",
		lev_limit = {
			"lev",
			8
		},
		extend = {},
		drops = {}
	},
	[43] = {
		name = "竞技宝箱",
		id = 43,
		res_id = 0,
		evt_type = "evt_arena_box",
		desc = "在竞技场宝箱中获得",
		lev_limit = {
			"lev",
			8
		},
		extend = {},
		drops = {}
	},
	[44] = {
		name = "试练塔",
		id = 44,
		res_id = 0,
		evt_type = "evt_tower",
		desc = "挑战试练塔可获得",
		lev_limit = {
			"lev",
			16
		},
		extend = {},
		drops = {}
	},
	[45] = {
		name = "观星",
		id = 45,
		res_id = 0,
		evt_type = "evt_divination",
		desc = "观星获得",
		lev_limit = {
			"dungeon",
			20380
		},
		extend = {},
		drops = {}
	},
	[46] = {
		name = "神界冒险",
		id = 46,
		res_id = 0,
		evt_type = "evt_god_world",
		desc = "神界冒险中获得",
		lev_limit = {
			"dungeon",
			10150
		},
		extend = {},
		drops = {}
	},
	[47] = {
		name = "冒险情报兑换",
		id = 47,
		res_id = 0,
		evt_type = "evt_god_world_exchange",
		desc = "在冒险中兑换冒险情报",
		lev_limit = {
			"dungeon",
			10150
		},
		extend = {},
		drops = {}
	},
	[48] = {
		name = "冒险探索宝箱",
		id = 48,
		res_id = 0,
		evt_type = "evt_god_world",
		desc = "神界冒险探索宝箱获得",
		lev_limit = {
			"dungeon",
			10150
		},
		extend = {},
		drops = {}
	},
	[50] = {
		name = "公会",
		id = 50,
		res_id = 0,
		evt_type = "evt_league",
		desc = "在公会中获得",
		lev_limit = {
			"guild",
			1
		},
		extend = {},
		drops = {}
	},
	[51] = {
		name = "公会副本",
		id = 51,
		res_id = 0,
		evt_type = "evt_league_dungeon",
		desc = "在公会副本中获得",
		lev_limit = {
			"guild",
			1
		},
		extend = {},
		drops = {}
	},
	[52] = {
		name = "公会捐献",
		id = 52,
		res_id = 0,
		evt_type = "evt_league_donate",
		desc = "在公会捐献中获得",
		lev_limit = {
			"guild",
			1
		},
		extend = {},
		drops = {}
	},
	[53] = {
		name = "远航商人",
		id = 53,
		res_id = 0,
		evt_type = "evt_league_sail",
		desc = "在远航商人中获得",
		lev_limit = {
			"lev",
			12
		},
		extend = {},
		drops = {}
	},
	[54] = {
		name = "公会求助",
		id = 54,
		res_id = 0,
		evt_type = "evt_league_help",
		desc = "在公会求助中获得",
		lev_limit = {
			"guild",
			3
		},
		extend = {},
		drops = {}
	},
	[55] = {
		name = "公会战",
		id = 55,
		res_id = 0,
		evt_type = "evt_league_war",
		desc = "公会战",
		lev_limit = {
			"guild",
			3
		},
		extend = {},
		drops = {}
	},
	[56] = {
		name = "公会秘境",
		id = 56,
		res_id = 0,
		evt_type = "evt_league_secret_area",
		desc = "在公会秘境中讨伐领主获得",
		lev_limit = {
			"guild",
			1
		},
		extend = {},
		drops = {}
	},
	[57] = {
		name = "公会宝库",
		id = 57,
		res_id = 0,
		evt_type = "evt_league_marketplace",
		desc = "在公会宝库中出售物品获得",
		lev_limit = {
			"guild",
			1
		},
		extend = {},
		drops = {}
	},
	[60] = {
		name = "好友界面",
		id = 60,
		res_id = 0,
		evt_type = "evt_friend",
		desc = "广交好友，交换礼物",
		lev_limit = {
			"lev",
			5
		},
		extend = {},
		drops = {}
	},
	[62] = {
		name = "点金",
		id = 62,
		res_id = 0,
		evt_type = "evt_exchange",
		desc = "点石成金了解一下！",
		lev_limit = {
			"lev",
			1
		},
		extend = {
			2
		},
		drops = {}
	},
	[63] = {
		name = "幸运探宝",
		id = 63,
		res_id = 0,
		evt_type = "evt_treasure",
		desc = "探宝获取积分",
		lev_limit = {
			"lev",
			10
		},
		extend = {},
		drops = {}
	},
	[71] = {
		name = "剧情副本",
		id = 71,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "挂机或打挑战Boss大量掉落",
		lev_limit = {
			"dungeon",
			10010
		},
		extend = {},
		drops = {}
	},
	[80] = {
		name = "冠军赛",
		id = 80,
		res_id = 0,
		evt_type = "evt_arena_champion",
		desc = "参与冠军赛获得",
		lev_limit = {
			"lev",
			8
		},
		extend = {},
		drops = {}
	},
	[81] = {
		name = "冠军商店",
		id = 81,
		res_id = 0,
		evt_type = "evt_mall_buy",
		desc = "消耗精彩积分，兑换商品吧！",
		lev_limit = {
			"lev",
			8
		},
		extend = {
			16
		},
		drops = {}
	},
	[90] = {
		name = "无尽试炼",
		id = 90,
		res_id = 0,
		evt_type = "evt_endless",
		desc = "无尽试炼中根据排行榜排名获得",
		lev_limit = {
			"lev",
			25
		},
		extend = {},
		drops = {}
	},
	[93] = {
		name = "金币副本",
		id = 93,
		res_id = 0,
		evt_type = "evt_dun_stone",
		desc = "金币副本中获得",
		lev_limit = {
			"lev",
			15
		},
		extend = {},
		drops = {}
	},
	[94] = {
		name = "英雄副本",
		id = 94,
		res_id = 0,
		evt_type = "evt_dun_stone",
		desc = "英雄副本中获得",
		lev_limit = {
			"lev",
			18
		},
		extend = {},
		drops = {}
	},
	[95] = {
		name = "神器副本",
		id = 95,
		res_id = 0,
		evt_type = "evt_dun_stone",
		desc = "神器副本中获得",
		lev_limit = {
			"lev",
			20
		},
		extend = {},
		drops = {}
	},
	[96] = {
		name = "经验副本",
		id = 96,
		res_id = 0,
		evt_type = "evt_dun_stone",
		desc = "经验副本中获得",
		lev_limit = {
			"lev",
			17
		},
		extend = {},
		drops = {}
	},
	[97] = {
		name = "符文副本",
		id = 97,
		res_id = 0,
		evt_type = "evt_dun_stone",
		desc = "符文副本中获得",
		lev_limit = {
			"lev",
			70
		},
		extend = {},
		drops = {}
	},
	[102] = {
		name = "星河神殿",
		id = 102,
		res_id = 0,
		evt_type = "evt_primus",
		desc = "星河神殿激活Buff",
		lev_limit = {
			"lev",
			35
		},
		extend = {},
		drops = {}
	},
	[103] = {
		name = "跨服天梯",
		id = 103,
		res_id = 0,
		evt_type = "evt_skyladder",
		desc = "参与玩法获天梯积分奖励",
		lev_limit = {
			"lev",
			55
		},
		extend = {},
		drops = {}
	},
	[104] = {
		name = "天梯积分商城",
		id = 104,
		res_id = 0,
		evt_type = "evt_skyshop",
		desc = "可在天梯积分商城中兑换",
		lev_limit = {
			"lev",
			35
		},
		extend = {},
		drops = {}
	},
	[105] = {
		name = "先知召唤",
		id = 105,
		res_id = 0,
		evt_type = "evt_recruit_high",
		desc = "先知召唤获得",
		lev_limit = {
			"lev",
			20
		},
		extend = {},
		drops = {}
	},
	[106] = {
		name = "英雄转换",
		id = 106,
		res_id = 0,
		evt_type = "evt_hero_conversion",
		desc = "英雄转换获得",
		lev_limit = {
			"lev",
			30
		},
		extend = {},
		drops = {}
	},
	[107] = {
		name = "英雄神殿",
		id = 107,
		res_id = 0,
		evt_type = "evt_partner_synthesis",
		desc = "融合神殿合成获得",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[108] = {
		name = "英雄神殿",
		id = 108,
		res_id = 0,
		evt_type = "evt_partner_decompose",
		desc = "分解英雄获得",
		lev_limit = {
			"lev",
			12
		},
		extend = {},
		drops = {}
	},
	[109] = {
		name = "装备锻造",
		id = 109,
		res_id = 0,
		evt_type = "evt_partner_eqm_synthesis",
		desc = "锻造屋合成装备！",
		lev_limit = {
			"lev",
			5
		},
		extend = {},
		drops = {}
	},
	[110] = {
		name = "位面征战",
		id = 110,
		res_id = 0,
		evt_type = "evt_expedition",
		desc = "位面征战中获得！",
		lev_limit = {
			"lev",
			30
		},
		extend = {},
		drops = {}
	},
	[111] = {
		name = "日常任务宝箱",
		id = 111,
		res_id = 0,
		evt_type = "evt_daily_quest",
		desc = "日常任务进度宝箱获得！",
		lev_limit = {
			"lev",
			10
		},
		extend = {},
		drops = {}
	},
	[112] = {
		name = "成就任务",
		id = 112,
		res_id = 0,
		evt_type = "evt_achievement",
		desc = "完成成就任务获得！",
		lev_limit = {
			"lev",
			10
		},
		extend = {},
		drops = {}
	},
	[113] = {
		name = "符文锻造",
		id = 113,
		res_id = 0,
		evt_type = "evt_rune_synthesis",
		desc = "锻造屋合成符文！",
		lev_limit = {
			"lev",
			5
		},
		extend = {},
		drops = {}
	},
	[114] = {
		name = "技能商店",
		id = 114,
		res_id = 0,
		evt_type = "evt_skillshop",
		desc = "使用精华兑换技能符石",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[115] = {
		name = "超凡段位赛",
		id = 115,
		res_id = 0,
		evt_type = "evt_elitematch",
		desc = "通过参与超凡段位赛获得",
		lev_limit = {
			"world_lev",
			100,
			"lev",
			100
		},
		extend = {},
		drops = {}
	},
	[116] = {
		name = "元素圣殿",
		id = 116,
		res_id = 0,
		evt_type = "evt_element_temple",
		desc = "参与元素圣殿玩法获得",
		lev_limit = {
			"lev",
			80
		},
		extend = {},
		drops = {}
	},
	[117] = {
		name = "天界副本",
		id = 117,
		res_id = 0,
		evt_type = "evt_dungeon_heaven",
		desc = "参与天界副本玩法获得",
		lev_limit = {
			"lev",
			105
		},
		extend = {},
		drops = {}
	},
	[118] = {
		name = "天界副本",
		id = 118,
		res_id = 0,
		evt_type = "evt_dungeon_heaven_inside",
		desc = "参与天界副本玩法获得",
		lev_limit = {
			"lev",
			105
		},
		extend = {},
		drops = {}
	},
	[120] = {
		name = "跨服竞技场",
		id = 120,
		res_id = 0,
		evt_type = "evt_arena_cluster",
		desc = "参与跨服竞技场玩法获得",
		lev_limit = {
			"lev",
			115
		},
		extend = {},
		drops = {}
	},
	[121] = {
		name = "周冠军赛",
		id = 121,
		res_id = 0,
		evt_type = "evt_cluster_champion",
		desc = "参与周冠军赛玩法获得",
		lev_limit = {
			"lev",
			55
		},
		extend = {},
		drops = {}
	},
	[122] = {
		name = "冠军商店",
		id = 122,
		res_id = 0,
		evt_type = "evt_mall_cluster_champion",
		desc = "消耗冠军币，兑换物品吧！",
		lev_limit = {
			"lev",
			55
		},
		extend = {},
		drops = {}
	},
	[123] = {
		name = "组队竞技场",
		id = 123,
		res_id = 0,
		evt_type = "evt_arena_team",
		desc = "参与组队竞技场玩法获得",
		lev_limit = {
			"lev",
			70
		},
		extend = {},
		drops = {}
	},
	[124] = {
		name = "巅峰冠军赛",
		id = 124,
		res_id = 0,
		evt_type = "evt_arena_peak_champion",
		desc = "参与巅峰冠军赛玩法获得",
		lev_limit = {
			"lev",
			55
		},
		extend = {},
		drops = {}
	},
	[131] = {
		name = "家园",
		id = 131,
		res_id = 0,
		evt_type = "evt_home",
		desc = "收取家园挂机收入获得",
		lev_limit = {
			"lev",
			70
		},
		extend = {},
		drops = {}
	},
	[132] = {
		name = "家园家具商店",
		id = 132,
		res_id = 0,
		evt_type = "evt_home_shop_furniture",
		desc = "【家园商店-家具商店】购买获得",
		lev_limit = {
			"lev",
			70
		},
		extend = {},
		drops = {}
	},
	[133] = {
		name = "出行物品商店",
		id = 133,
		res_id = 0,
		evt_type = "evt_home_shop_travel",
		desc = "【家园商店-出行物品】购买获得",
		lev_limit = {
			"lev",
			70
		},
		extend = {},
		drops = {}
	},
	[134] = {
		name = "家园随机商店",
		id = 134,
		res_id = 0,
		evt_type = "evt_home_shop_random",
		desc = "【家园商店-随机商店】购买获得",
		lev_limit = {
			"lev",
			70
		},
		extend = {},
		drops = {}
	},
	[135] = {
		name = "萌宠出行",
		id = 135,
		res_id = 0,
		evt_type = "evt_home",
		desc = "萌宠旅行获得",
		lev_limit = {
			"lev",
			70
		},
		extend = {},
		drops = {}
	},
	[142] = {
		name = "果实招募",
		id = 142,
		res_id = 0,
		evt_type = "evt_emoguoshi_zhaohuan_source",
		desc = "通过恶魔果实招募获得",
		lev_limit = {
			"lev",
			70
		},
		extend = {},
		drops = {}
	},
	[200] = {
		name = "英雄合成",
		id = 200,
		res_id = 0,
		evt_type = "evt_fragment_synthesis",
		desc = "英雄碎片合成",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[201] = {
		name = "物品来源",
		id = 201,
		res_id = 0,
		evt_type = "evt_item_source",
		desc = "物品来源窗口",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[202] = {
		name = "装备出售",
		id = 202,
		res_id = 0,
		evt_type = "evt_eqm_sale",
		desc = "装备道具出售",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[203] = {
		name = "符文合成",
		id = 203,
		res_id = 0,
		evt_type = "evt_rune_synthesis",
		desc = "符文碎片合成",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[204] = {
		name = "符文升星",
		id = 204,
		res_id = 0,
		evt_type = "evt_rune_star",
		desc = "符文升星",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[205] = {
		name = "符文重铸",
		id = 205,
		res_id = 0,
		evt_type = "evt_rune_recast",
		desc = "符文重铸",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[206] = {
		name = "符文分解",
		id = 206,
		res_id = 0,
		evt_type = "evt_rune_decomposition",
		desc = "符文分解",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[207] = {
		name = "符文穿戴",
		id = 207,
		res_id = 0,
		evt_type = "evt_rune_wear",
		desc = "符文穿戴",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[208] = {
		name = "秘矿争夺 (冒险层10层开启)",
		id = 208,
		res_id = 0,
		evt_type = "evt_veins_competition",
		desc = "抢夺矿场，获取收益",
		lev_limit = {
			"lev",
			55
		},
		extend = {},
		drops = {}
	},
	[209] = {
		name = "魔液炼金",
		id = 209,
		res_id = 0,
		evt_type = "evt_experience_alchemy",
		desc = "提炼经验，获取魔液",
		lev_limit = {
			"lev",
			60
		},
		extend = {},
		drops = {}
	},
	[212] = {
		name = "先知豪礼",
		id = 212,
		res_id = 0,
		evt_type = "evt_festival_feather",
		desc = "通过参与先知豪礼获得",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[213] = {
		name = "召唤豪礼",
		id = 213,
		res_id = 0,
		evt_type = "evt_summon_feather",
		desc = "通过参与召唤豪礼获得",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[214] = {
		name = "限时活动与礼包",
		id = 214,
		res_id = 0,
		evt_type = "",
		desc = "可通过其他限时活动与礼包获得",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[215] = {
		name = "共鸣石碑",
		id = 215,
		res_id = 0,
		evt_type = "evt_resonate",
		desc = "共鸣石碑",
		lev_limit = {
			"lev",
			60
		},
		extend = {},
		drops = {}
	},
	[300] = {
		name = "节日活动",
		id = 300,
		res_id = 0,
		evt_type = "",
		desc = "节日活动获得",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[301] = {
		name = "圣夜奇境",
		id = 301,
		res_id = 0,
		evt_type = "evt_monopoly_1",
		desc = "魔女之森的地图界面",
		lev_limit = {
			"lev",
			10
		},
		extend = {},
		drops = {}
	},
	[302] = {
		name = "圣夜奇境",
		id = 302,
		res_id = 0,
		evt_type = "evt_monopoly_2",
		desc = "蔷薇庭院的地图界面",
		lev_limit = {
			"lev",
			10
		},
		extend = {},
		drops = {}
	},
	[303] = {
		name = "圣夜奇境",
		id = 303,
		res_id = 0,
		evt_type = "evt_monopoly_3",
		desc = "魔王之城的地图界面",
		lev_limit = {
			"lev",
			10
		},
		extend = {},
		drops = {}
	},
	[304] = {
		name = "圣夜奇境",
		id = 304,
		res_id = 0,
		evt_type = "evt_monopoly_4",
		desc = "时之隙间的地图界面",
		lev_limit = {
			"lev",
			10
		},
		extend = {},
		drops = {}
	},
	[305] = {
		name = "圣夜奇境",
		id = 305,
		res_id = 0,
		evt_type = "evt_monopoly_boss",
		desc = "奇境BOSS面板",
		lev_limit = {
			"lev",
			10
		},
		extend = {},
		drops = {}
	},
	[306] = {
		name = "圣夜奇境",
		id = 306,
		res_id = 0,
		evt_type = "evt_monopoly",
		desc = "圣夜奇境主活动界面",
		lev_limit = {
			"lev",
			10
		},
		extend = {},
		drops = {}
	},
	[307] = {
		name = "每周礼包",
		id = 307,
		res_id = 0,
		evt_type = "evt_weekly_gift",
		desc = "每周礼包获得",
		lev_limit = {
			"lev",
			6
		},
		extend = {},
		drops = {}
	},
	[309] = {
		name = "专属特权订阅",
		id = 309,
		res_id = 0,
		evt_type = "evt_subscribe",
		desc = "专属特权订阅赠送",
		lev_limit = {
			"lev",
			10
		},
		extend = {},
		drops = {}
	},
	[310] = {
		name = "成长自选礼包",
		id = 310,
		res_id = 0,
		evt_type = "evt_grow_gift",
		desc = "成长自选礼包获得",
		lev_limit = {
			"lev",
			110
		},
		extend = {},
		drops = {}
	},
	[311] = {
		name = "成长自选礼包",
		id = 311,
		res_id = 0,
		evt_type = "evt_grow_gift",
		desc = "成长自选礼包获得",
		lev_limit = {
			"lev",
			80
		},
		extend = {},
		drops = {}
	},
	[320] = {
		name = "活动获得",
		id = 320,
		res_id = 0,
		evt_type = "",
		desc = "活动获得",
		lev_limit = {
			"lev",
			1
		},
		extend = {},
		drops = {}
	},
	[10180] = {
		name = "卡达尔森林18",
		id = 10180,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "卡达尔森林18",
		lev_limit = {
			"dungeon",
			10180
		},
		extend = {
			{
				1,
				10180
			}
		},
		drops = {}
	},
	[10300] = {
		name = "卡达尔森林30",
		id = 10300,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "卡达尔森林30",
		lev_limit = {
			"dungeon",
			10300
		},
		extend = {
			{
				1,
				10300
			}
		},
		drops = {}
	},
	[10420] = {
		name = "卡达尔森林42",
		id = 10420,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "卡达尔森林42",
		lev_limit = {
			"dungeon",
			10420
		},
		extend = {
			{
				1,
				10420
			}
		},
		drops = {}
	},
	[20120] = {
		name = "维瑟斯沙漠54",
		id = 20120,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "维瑟斯沙漠54",
		lev_limit = {
			"dungeon",
			20120
		},
		extend = {
			{
				1,
				20120
			}
		},
		drops = {}
	},
	[20240] = {
		name = "维瑟斯沙漠66",
		id = 20240,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "维瑟斯沙漠66",
		lev_limit = {
			"dungeon",
			20240
		},
		extend = {
			{
				1,
				20240
			}
		},
		drops = {}
	},
	[20360] = {
		name = "维瑟斯沙漠78",
		id = 20360,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "维瑟斯沙漠78",
		lev_limit = {
			"dungeon",
			20360
		},
		extend = {
			{
				1,
				20360
			}
		},
		drops = {}
	},
	[30060] = {
		name = "达齐尔雪地90",
		id = 30060,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "达齐尔雪地90",
		lev_limit = {
			"dungeon",
			30060
		},
		extend = {
			{
				1,
				30060
			}
		},
		drops = {}
	},
	[30180] = {
		name = "达齐尔雪地102",
		id = 30180,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "达齐尔雪地102",
		lev_limit = {
			"dungeon",
			30180
		},
		extend = {
			{
				1,
				30180
			}
		},
		drops = {}
	},
	[30300] = {
		name = "达齐尔雪地114",
		id = 30300,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "达齐尔雪地114",
		lev_limit = {
			"dungeon",
			30300
		},
		extend = {
			{
				1,
				30300
			}
		},
		drops = {}
	},
	[30420] = {
		name = "达齐尔雪地126",
		id = 30420,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "达齐尔雪地126",
		lev_limit = {
			"dungeon",
			30420
		},
		extend = {
			{
				1,
				30420
			}
		},
		drops = {}
	},
	[40120] = {
		name = "安格拉玛山138",
		id = 40120,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "安格拉玛山138",
		lev_limit = {
			"dungeon",
			40120
		},
		extend = {
			{
				1,
				40120
			}
		},
		drops = {}
	},
	[40240] = {
		name = "安格拉玛山150",
		id = 40240,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "安格拉玛山150",
		lev_limit = {
			"dungeon",
			40240
		},
		extend = {
			{
				1,
				40240
			}
		},
		drops = {}
	},
	[40360] = {
		name = "安格拉玛山162",
		id = 40360,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "安格拉玛山162",
		lev_limit = {
			"dungeon",
			40360
		},
		extend = {
			{
				1,
				40360
			}
		},
		drops = {}
	},
	[80180] = {
		name = "斐尼雪山312",
		id = 80180,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "斐尼雪山312",
		lev_limit = {
			"dungeon",
			80180
		},
		extend = {
			{
				1,
				80180
			}
		},
		drops = {}
	},
	[80360] = {
		name = "斐尼雪山330",
		id = 80360,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "斐尼雪山330",
		lev_limit = {
			"dungeon",
			80360
		},
		extend = {
			{
				1,
				80360
			}
		},
		drops = {}
	},
	[90120] = {
		name = "旭日平原348",
		id = 90120,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "旭日平原348",
		lev_limit = {
			"dungeon",
			90120
		},
		extend = {
			{
				1,
				90120
			}
		},
		drops = {}
	},
	[90300] = {
		name = "旭日平原366",
		id = 90300,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "旭日平原366",
		lev_limit = {
			"dungeon",
			90300
		},
		extend = {
			{
				1,
				90300
			}
		},
		drops = {}
	},
	[100060] = {
		name = "乌塔塔神庙384",
		id = 100060,
		res_id = 1,
		evt_type = "evt_dun_chapter",
		desc = "乌塔塔神庙384",
		lev_limit = {
			"dungeon",
			100060
		},
		extend = {
			{
				1,
				100060
			}
		},
		drops = {}
	}
}

function Config.SourceData.data_source_data_fun(slot0)
	slot1 = Config.SourceData.data_source_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.SourceData.data_source_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
