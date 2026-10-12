Config = Config or {}
Config.VideoData = Config.VideoData or {}
Config.VideoData.data_const_length = 27
Config.VideoData.data_const = {
	likes_limit = {
		val = 3,
		key = "likes_limit",
		desc = "每天点赞上限"
	},
	likes_reward = {
		key = "likes_reward",
		desc = "点赞奖励",
		val = {
			{
				1,
				30000
			}
		}
	},
	self_video_limit = {
		val = 30,
		key = "self_video_limit",
		desc = "个人录像上限"
	},
	self_collection_limit = {
		val = 30,
		key = "self_collection_limit",
		desc = "个人收藏上限"
	},
	area_video_condition = {
		val = 500,
		key = "area_video_condition",
		desc = "竞技场录像录入条件（其中方满足前x名，包含x）"
	},
	public_round_condition = {
		val = 6,
		key = "public_round_condition",
		desc = "所有录像满足录入的回合数条件"
	},
	lev_interval_uplimit = {
		val = 5,
		key = "lev_interval_uplimit",
		desc = "竞技场录像筛选中区间的浮动值（上）"
	},
	lev_interval_lowlimit = {
		val = 5,
		key = "lev_interval_lowlimit",
		desc = "竞技场录像筛选中区间的浮动值（下）"
	},
	hot_round_condition = {
		val = 8,
		key = "hot_round_condition",
		desc = "所有录像满足录入的回合数条件"
	},
	video_base_weight = {
		val = 100,
		key = "video_base_weight",
		desc = "录像基础权重——热门录像"
	},
	play_weight_condition = {
		val = 100,
		key = "play_weight_condition",
		desc = "播放数加成权重条件（需要播放超过x次）——热门录像"
	},
	play_weight_increase = {
		val = 80,
		key = "play_weight_increase",
		desc = "播放数加成权重值——热门录像"
	},
	battlenum_weight_condition = {
		val = 10,
		key = "battlenum_weight_condition",
		desc = "战力相差范围在x%内——热门录像"
	},
	battlenum_weight_increase = {
		val = 80,
		key = "battlenum_weight_increase",
		desc = "战力相近加成权重值——热门录像"
	},
	elite_lev_float_section = {
		key = "elite_lev_float_section",
		desc = "精英段位赛录像筛选的玩家等级上下浮动区间",
		val = {
			10,
			10
		}
	},
	elite_battlenum_conditon = {
		val = 70,
		key = "elite_battlenum_conditon",
		desc = "段位精英赛战力差条件（单位：千分比）"
	},
	elitelev_conditon = {
		val = 1,
		key = "elitelev_conditon",
		desc = "段位精英赛录像筛选段位等级条件，达到该等级则满足"
	},
	fresh_hero_id = {
		val = 20512,
		key = "fresh_hero_id",
		desc = "新英雄ID"
	},
	nh_video_base_weight = {
		val = 100,
		key = "nh_video_base_weight",
		desc = "录像基础权重——新英雄集锦"
	},
	nh_play_weight_condition = {
		val = 100,
		key = "nh_play_weight_condition",
		desc = "播放数加成权重条件（需要播放超过x次）——新英雄集锦"
	},
	nh_play_weight_increase = {
		val = 80,
		key = "nh_play_weight_increase",
		desc = "播放数加成权重值——新英雄集锦"
	},
	nh_battlenum_weight_condition = {
		val = 100,
		key = "nh_battlenum_weight_condition",
		desc = "战力相差范围在x%内——新英雄集锦"
	},
	nh_battlenum_weight_increase = {
		val = 0,
		key = "nh_battlenum_weight_increase",
		desc = "战力相近加成权重值——新英雄集锦"
	},
	nh_hot_round_condition = {
		val = 1,
		key = "nh_hot_round_condition",
		desc = "所有录像满足录入的回合数条件——新英雄集锦"
	},
	hero_add_weight = {
		val = 200,
		key = "hero_add_weight",
		desc = "胜利方拥有英雄ID则加成权重——热门录像"
	},
	hero_add_weight_condition = {
		key = "hero_add_weight_condition",
		desc = "满足加成的英雄ID——热门录像",
		val = {
			10510,
			10512,
			30508
		}
	},
	open_time = {
		val = 7,
		key = "open_time",
		desc = "只在开服7天内走该权重加成规则——热门录像"
	}
}

function Config.VideoData.data_const_fun(slot0)
	slot1 = Config.VideoData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.VideoData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.VideoData.data_vedio_length = 9
Config.VideoData.data_vedio = {
	{
		sort_id = 3,
		name = "竞技场",
		id = 1,
		is_show = 1,
		evt = {
			{
				"all"
			},
			{
				"rank",
				1,
				10
			},
			{
				"rank",
				11,
				50
			},
			{
				"rank",
				51,
				100
			},
			{
				"rank",
				101
			}
		}
	},
	{
		sort_id = 4,
		name = "冠军赛",
		id = 2,
		is_show = 1,
		evt = {
			{
				"all"
			},
			{
				"cham",
				2
			},
			{
				"cham",
				4
			},
			{
				"cham",
				8
			},
			{
				"cham",
				16
			},
			{
				"cham",
				32
			},
			{
				"cham",
				128
			}
		}
	},
	{
		sort_id = 5,
		name = "切磋",
		id = 3,
		is_show = 1,
		evt = {
			{
				"all"
			},
			{
				"lev",
				151
			},
			{
				"lev",
				101,
				150
			},
			{
				"lev",
				51,
				100
			},
			{
				"lev",
				1,
				50
			}
		}
	},
	{
		sort_id = 6,
		name = "公会战",
		id = 4,
		is_show = 1,
		evt = {
			{
				"all"
			}
		}
	},
	{
		sort_id = 7,
		name = "跨服天梯",
		id = 5,
		is_show = 1,
		evt = {
			{
				"all"
			}
		}
	},
	{
		sort_id = 8,
		name = "超凡段位",
		id = 6,
		is_show = 1,
		evt = {
			{
				"all"
			}
		}
	},
	{
		sort_id = 9,
		name = "周冠军赛",
		id = 7,
		is_show = 1,
		evt = {
			{
				"all"
			},
			{
				"cham",
				2
			},
			{
				"cham",
				4
			},
			{
				"cham",
				8
			},
			{
				"cham",
				16
			},
			{
				"cham",
				32
			},
			{
				"cham",
				64
			},
			{
				"cham",
				256
			}
		}
	},
	[97] = {
		sort_id = 1,
		name = "新英雄集锦",
		id = 97,
		is_show = 1,
		evt = {
			{
				"all"
			}
		}
	},
	[98] = {
		sort_id = 2,
		name = "本周热门",
		id = 98,
		is_show = 1,
		evt = {
			{
				"all"
			}
		}
	}
}

function Config.VideoData.data_vedio_fun(slot0)
	slot1 = Config.VideoData.data_vedio[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.VideoData.data_vedio[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
