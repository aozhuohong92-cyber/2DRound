Config = Config or {}
Config.GuildData = Config.GuildData or {}
Config.GuildData.data_position_length = 3
Config.GuildData.data_position = {
	{
		id = 1,
		name = "会长",
		limit = {
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12,
			13
		}
	},
	{
		id = 2,
		name = "副会长",
		limit = {
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12
		}
	},
	{
		id = 3,
		name = "成员",
		limit = {}
	}
}

function Config.GuildData.data_position_fun(slot0)
	slot1 = Config.GuildData.data_position[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildData.data_position[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildData.data_donate_length = 3
Config.GuildData.data_donate = {
	{
		name = "贝里捐献",
		id = 1,
		desc = "滴水成川，聚沙成塔！",
		loss = {
			{
				2,
				20000
			}
		},
		gain = {
			{
				10,
				100
			},
			{
				16,
				50
			}
		}
	},
	{
		name = "钻石捐献",
		id = 2,
		desc = "愿神保佑我们！",
		loss = {
			{
				15,
				100
			}
		},
		gain = {
			{
				10,
				250
			},
			{
				16,
				100
			}
		}
	},
	{
		name = "至尊捐献",
		id = 3,
		desc = "我们公会是不可战胜的！",
		loss = {
			{
				15,
				300
			}
		},
		gain = {
			{
				10,
				800
			},
			{
				16,
				200
			}
		}
	}
}

function Config.GuildData.data_donate_fun(slot0)
	slot1 = Config.GuildData.data_donate[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildData.data_donate[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildData.data_post_length = 41
Config.GuildData.data_post = {
	["2_1"] = {
		num = 2
	},
	["2_2"] = {
		num = 2
	},
	["2_3"] = {
		num = 2
	},
	["2_4"] = {
		num = 2
	},
	["2_5"] = {
		num = 2
	},
	["2_6"] = {
		num = 3
	},
	["2_7"] = {
		num = 3
	},
	["2_8"] = {
		num = 3
	},
	["2_9"] = {
		num = 3
	},
	["2_10"] = {
		num = 3
	},
	["2_11"] = {
		num = 4
	},
	["2_12"] = {
		num = 4
	},
	["2_13"] = {
		num = 4
	},
	["2_14"] = {
		num = 4
	},
	["2_15"] = {
		num = 4
	},
	["2_16"] = {
		num = 5
	},
	["2_17"] = {
		num = 5
	},
	["2_18"] = {
		num = 5
	},
	["2_19"] = {
		num = 5
	},
	["2_20"] = {
		num = 5
	},
	["2_21"] = {
		num = 5
	},
	["3_1"] = {
		num = 999
	},
	["3_2"] = {
		num = 999
	},
	["3_3"] = {
		num = 999
	},
	["3_4"] = {
		num = 999
	},
	["3_5"] = {
		num = 999
	},
	["3_6"] = {
		num = 999
	},
	["3_7"] = {
		num = 999
	},
	["3_8"] = {
		num = 999
	},
	["3_9"] = {
		num = 999
	},
	["3_10"] = {
		num = 999
	},
	["3_11"] = {
		num = 999
	},
	["3_12"] = {
		num = 999
	},
	["3_13"] = {
		num = 999
	},
	["3_14"] = {
		num = 999
	},
	["3_15"] = {
		num = 999
	},
	["3_16"] = {
		num = 999
	},
	["3_17"] = {
		num = 999
	},
	["3_18"] = {
		num = 999
	},
	["3_19"] = {
		num = 999
	},
	["3_20"] = {
		num = 999
	}
}

function Config.GuildData.data_post_fun(slot0)
	slot1 = Config.GuildData.data_post[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildData.data_post[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildData.data_guild_lev_length = 20
Config.GuildData.data_guild_lev = {
	{
		exp = 750,
		lev = 1,
		num = 15,
		desc = "人数上限提升至<div color=#249003>15</div>人"
	},
	{
		exp = 1600,
		lev = 2,
		num = 16,
		desc = "人数上限提升至<div color=#249003>16</div>人"
	},
	{
		exp = 2560,
		lev = 3,
		num = 16,
		desc = "人数上限提升至<div color=#249003>16</div>人"
	},
	{
		exp = 4080,
		lev = 4,
		num = 17,
		desc = "人数上限提升至<div color=#249003>17</div>人"
	},
	{
		exp = 5780,
		lev = 5,
		num = 17,
		desc = "人数上限提升至<div color=#249003>17</div>人"
	},
	{
		exp = 8280,
		lev = 6,
		num = 18,
		desc = "人数上限提升至<div color=#249003>18</div>人"
	},
	{
		exp = 10800,
		lev = 7,
		num = 18,
		desc = "人数上限提升至<div color=#249003>18</div>人"
	},
	{
		exp = 14440,
		lev = 8,
		num = 19,
		desc = "人数上限提升至<div color=#249003>19</div>人"
	},
	{
		exp = 17860,
		lev = 9,
		num = 19,
		desc = "人数上限提升至<div color=#249003>19</div>人"
	},
	{
		exp = 22800,
		lev = 10,
		num = 20,
		desc = "人数上限提升至<div color=#249003>20</div>人"
	},
	{
		exp = 27200,
		lev = 11,
		num = 20,
		desc = "人数上限提升至<div color=#249003>20</div>人"
	},
	{
		exp = 33600,
		lev = 12,
		num = 21,
		desc = "人数上限提升至<div color=#249003>21</div>人"
	},
	{
		exp = 39060,
		lev = 13,
		num = 21,
		desc = "人数上限提升至<div color=#249003>21</div>人"
	},
	{
		exp = 47080,
		lev = 14,
		num = 22,
		desc = "人数上限提升至<div color=#249003>22</div>人"
	},
	{
		exp = 53680,
		lev = 15,
		num = 22,
		desc = "人数上限提升至<div color=#249003>22</div>人"
	},
	{
		exp = 63480,
		lev = 16,
		num = 23,
		desc = "人数上限提升至<div color=#249003>23</div>人"
	},
	{
		exp = 71300,
		lev = 17,
		num = 23,
		desc = "人数上限提升至<div color=#249003>23</div>人"
	},
	{
		exp = 83040,
		lev = 18,
		num = 24,
		desc = "人数上限提升至<div color=#249003>24</div>人"
	},
	{
		exp = 92160,
		lev = 19,
		num = 24,
		desc = "人数上限提升至<div color=#249003>24</div>人"
	},
	{
		exp = 106000,
		lev = 20,
		num = 25,
		desc = "人数上限提升至<div color=#249003>25</div>人"
	}
}

function Config.GuildData.data_guild_lev_fun(slot0)
	slot1 = Config.GuildData.data_guild_lev[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildData.data_guild_lev[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildData.data_sign_length = 3
Config.GuildData.data_sign = {
	{
		sign = "海量礼包，大神攻略等你来拿~"
	},
	{
		sign = "海量礼包，大神攻略等你来拿~"
	},
	{
		sign = "海量礼包，大神攻略等你来拿~"
	}
}
Config.GuildData.data_const_length = 29
Config.GuildData.data_const = {
	create_gold = {
		val = 100,
		key = "create_gold",
		desc = "创建消耗钻石"
	},
	day_exp_max = {
		val = 3000,
		key = "day_exp_max",
		desc = "每日经验上限"
	},
	ad_free = {
		val = 1,
		key = "ad_free",
		desc = "每日免费广告次数"
	},
	ad_cost = {
		val = 20,
		key = "ad_cost",
		desc = "发布广告消耗"
	},
	impeach_gold = {
		key = "impeach_gold",
		desc = "弹劾会长所需费用/钻",
		val = {
			{
				15,
				300
			}
		}
	},
	impeach_offline_day1 = {
		val = 3,
		key = "impeach_offline_day1",
		desc = "会长X天不上线副会长可弹劾"
	},
	impeach_offline_day2 = {
		val = 7,
		key = "impeach_offline_day2",
		desc = "会长X天不上线普通成员可弹劾"
	},
	rename_gold = {
		val = 500,
		key = "rename_gold",
		desc = "公会改名消耗钻石"
	},
	rename_time = {
		val = 48,
		key = "rename_time",
		desc = "公会改名冷却时间/小时"
	},
	maintain_min_exp = {
		val = 0,
		key = "maintain_min_exp",
		desc = "公会经验达到多少后自动解散"
	},
	maintain_start_time = {
		val = 21600,
		key = "maintain_start_time",
		desc = "创建公会后6小时后开启维护"
	},
	guild_merge_lev = {
		val = 2,
		key = "guild_merge_lev",
		desc = "公会等级达到X级后才可合并"
	},
	merge_cost = {
		val = 200,
		key = "merge_cost",
		desc = "合并消耗钻石"
	},
	merge_time = {
		val = 86400,
		key = "merge_time",
		desc = "合并发送请求持续时间（单位秒）"
	},
	guild_min_lev = {
		val = 18,
		key = "guild_min_lev",
		desc = "创建或加入公会所需等级"
	},
	recruit_cost = {
		val = 20,
		key = "recruit_cost",
		desc = "招募消耗钻石"
	},
	recruit_limit = {
		val = 5,
		key = "recruit_limit",
		desc = "每日招募限制次数"
	},
	red_packet_send = {
		val = 10,
		key = "red_packet_send",
		desc = "每日发红包次数"
	},
	red_packet_get = {
		val = 10,
		key = "red_packet_get",
		desc = "每日领取红包次数"
	},
	guild_quit_cd = {
		val = 43200,
		key = "guild_quit_cd",
		desc = "退会再入会时间（单位：秒）"
	},
	game_rule = {
		val = 1,
		key = "game_rule",
		desc = [[
1.会长拥有会内最高权限，拥有修改公会内部信息、管理成员、任命/罢免副会长等权限。
2.公会可发布招募消息，发布后在世界聊天频道中显示。
3.退出公会后，12小时内不可加入其他公会。
4.捐献是提高公会经验的重要途径，提高公会经验可令公会升级，公会升级后会增加总人数上限和副会长职位上限，还可开启各种公会玩法。
5.会长在离线3天时，副会长有权弹劾他成为新的会长；会长离线七天以上，所有成员可以弹劾他成为新的会长。
6.每一类型公会红包每日只可发放10次，每日的00:00重置次数。]]
	},
	game_rule1 = {
		val = 2,
		key = "game_rule1",
		desc = "1.所有公会成员每天只可捐献1次（0点重置），从3种捐献中选择，不同捐献项带来的收益不一样，捐献时请留意\n2.捐献后可获得<div fontcolor=289b14>公会经验</div>和<div fontcolor=289b14>公会贡献</div>，捐献是提升公会等级的重要途径\n3.当天捐献后若更换公会，不可继续捐献"
	},
	maintain_vip_condition = {
		val = 2,
		key = "maintain_vip_condition",
		desc = "创建公会所需vip等级"
	},
	remove_limit = {
		val = 10,
		key = "remove_limit",
		desc = "联盟每日可踢人次数"
	},
	transfer_time_condition = {
		val = 48,
		key = "transfer_time_condition",
		desc = "转让会长需要联盟创建x小时"
	},
	gold_donate_remove_limit = {
		val = 3,
		key = "gold_donate_remove_limit",
		desc = "联盟每日可踢捐钻石的人次数"
	},
	guild_limit_power_choice = {
		key = "guild_limit_power_choice",
		desc = "加入公会战力条件的分段",
		val = {
			0,
			50000,
			100000,
			200000,
			400000,
			800000,
			1500000,
			3000000
		}
	},
	guild_leader_create_guild_cd = {
		val = 24,
		key = "guild_leader_create_guild_cd",
		desc = "会长解散公会再建会CD(小时)"
	},
	guild_mem_create_guild_cd = {
		val = 12,
		key = "guild_mem_create_guild_cd",
		desc = "会员退会再建会CD(小时)"
	}
}

function Config.GuildData.data_const_fun(slot0)
	slot1 = Config.GuildData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildData.data_donate_box_length = 3
Config.GuildData.data_donate_box = {
	{
		effect_id = 109,
		box_val = 1000,
		rewards = {
			{
				10,
				50
			},
			{
				1,
				10000
			}
		}
	},
	{
		effect_id = 108,
		box_val = 2000,
		rewards = {
			{
				10,
				100
			},
			{
				1,
				15000
			}
		}
	},
	{
		effect_id = 110,
		box_val = 3000,
		rewards = {
			{
				10,
				200
			},
			{
				1,
				20000
			}
		}
	}
}

function Config.GuildData.data_donate_box_fun(slot0)
	slot1 = Config.GuildData.data_donate_box[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildData.data_donate_box[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildData.data_guild_red_bag_length = 3
Config.GuildData.data_guild_red_bag = {
	{
		name = "小清新红包",
		type = 2,
		charge_id = 501,
		num = 10,
		msg = "不问红包出处，大家开心就好！",
		desc = "试问谁不喜欢贝里？",
		id = 1,
		limit = 30,
		res_name = "redbag_4",
		val = 600000,
		assets = "coin",
		price = 12,
		loss_item = {
			{
				10800,
				1
			}
		},
		loss_assets = {},
		reward = {
			{
				3,
				120
			},
			{
				10,
				550
			}
		}
	},
	{
		name = "高端大气红包",
		type = 2,
		charge_id = 502,
		num = 10,
		msg = "美妙的一天，今天是值得庆祝的日子！",
		desc = "钻石代表我的心意",
		id = 2,
		limit = 20,
		res_name = "redbag_10",
		val = 500,
		assets = "gold",
		price = 50,
		loss_item = {
			{
				10801,
				1
			}
		},
		loss_assets = {},
		reward = {
			{
				3,
				500
			},
			{
				10,
				650
			},
			{
				10403,
				4
			}
		}
	},
	{
		name = "至尊土豪红包",
		type = 2,
		charge_id = 503,
		num = 15,
		msg = "红包发给最爱的你们，么么哒！",
		desc = "哗啦啦的钻石雨~",
		id = 3,
		limit = 10,
		res_name = "redbag_5",
		val = 6480,
		assets = "gold",
		price = 648,
		loss_item = {},
		loss_assets = {},
		reward = {
			{
				3,
				6480
			},
			{
				10,
				10000
			},
			{
				14001,
				12
			},
			{
				10403,
				36
			}
		}
	}
}

function Config.GuildData.data_guild_red_bag_fun(slot0)
	slot1 = Config.GuildData.data_guild_red_bag[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildData.data_guild_red_bag[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildData.data_guild_scene_icon_length = 18
Config.GuildData.data_guild_scene_icon = {
	{
		name = "公会秘境",
		res_type = 1,
		type = 1,
		icon = "1",
		pos = {
			{
				600,
				1130
			}
		},
		offset_pos = {
			0,
			0
		}
	},
	{
		name = "公会技能",
		res_type = 1,
		type = 2,
		icon = "2",
		pos = {
			{
				320,
				770
			}
		},
		offset_pos = {
			50,
			-50
		}
	},
	{
		name = "公会宝库",
		res_type = 1,
		type = 3,
		icon = "3",
		pos = {
			{
				230,
				390
			}
		},
		offset_pos = {
			-50,
			0
		}
	},
	{
		name = "公会副本",
		res_type = 1,
		type = 4,
		icon = "4",
		pos = {
			{
				620,
				850
			}
		},
		offset_pos = {
			0,
			0
		}
	},
	{
		name = "公会商城",
		res_type = 1,
		type = 5,
		icon = "5",
		pos = {
			{
				530,
				500
			}
		},
		offset_pos = {
			50,
			-50
		}
	},
	{
		name = "公会战",
		res_type = 1,
		type = 6,
		icon = "6",
		pos = {
			{
				300,
				1000
			}
		},
		offset_pos = {
			0,
			0
		}
	},
	{
		name = "公会活跃",
		res_type = 1,
		type = 7,
		icon = "7",
		pos = {
			{
				390,
				300
			}
		},
		offset_pos = {
			-20,
			-30
		}
	},
	{
		name = "公会捐献",
		res_type = 1,
		type = 8,
		icon = "8",
		pos = {
			{
				620,
				230
			}
		},
		offset_pos = {
			0,
			0
		}
	},
	{
		name = "公会红包",
		res_type = 1,
		type = 9,
		icon = "9",
		pos = {
			{
				90,
				880
			}
		},
		offset_pos = {
			20,
			-20
		}
	}
}

function Config.GuildData.data_guild_scene_icon_fun(slot0)
	slot1 = Config.GuildData.data_guild_scene_icon[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildData.data_guild_scene_icon[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
