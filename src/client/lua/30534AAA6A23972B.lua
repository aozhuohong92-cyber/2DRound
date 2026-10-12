Config = Config or {}
Config.SubtitleData = Config.SubtitleData or {}
Config.SubtitleData.data_list_length = 3
Config.SubtitleData.data_list = {
	[101] = {
		id = 101,
		name = "冠军赛",
		msg_len = 40,
		save_len = 30,
		loss = {
			{
				2,
				500
			}
		}
	},
	[102] = {
		id = 102,
		name = "跨服冠军赛",
		msg_len = 40,
		save_len = 30,
		loss = {
			{
				1,
				500
			}
		}
	},
	[103] = {
		id = 103,
		name = "巅峰冠军赛",
		msg_len = 40,
		save_len = 30,
		loss = {
			{
				1,
				500
			}
		}
	}
}

function Config.SubtitleData.data_list_fun(slot0)
	slot1 = Config.SubtitleData.data_list[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.SubtitleData.data_list[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.SubtitleData.data_system_length = 3
Config.SubtitleData.data_system = {
	[103] = {
		{
			msg = "晚上八点半正式开打，再问**"
		},
		{
			msg = "世纪大战么，感觉这里能见到好多大佬"
		},
		{
			msg = "三局两胜是指第一队打第一队，第二队打第二队！"
		},
		{
			msg = "商城奖励好像很不错的样子~"
		},
		{
			msg = "请各位懂事，让我们多拿竞猜币~"
		},
		{
			msg = "一天一局，不慌哈哈"
		}
	},
	[102] = {
		{
			msg = "666666666"
		},
		{
			msg = "一边拉满幸福美满"
		},
		{
			msg = "冲冲冲"
		},
		{
			msg = "参与竞猜，赢取大量冠军币可以去商城兑换奖励哦"
		}
	},
	[101] = {
		{
			msg = "666666666"
		},
		{
			msg = "一边拉满幸福美满"
		},
		{
			msg = "冲冲冲"
		},
		{
			msg = "参与竞猜，赢取大量冠军积分可以去商城兑换奖励哦"
		}
	}
}
Config.SubtitleData.data_const_length = 6
Config.SubtitleData.data_const = {
	sub_speed = {
		key = "sub_speed",
		desc = "弹幕速度",
		val = {
			8,
			14
		}
	},
	sub_space = {
		val = 2,
		key = "sub_space",
		desc = "弹幕间隔(秒)"
	},
	subcircle_space = {
		val = 3,
		key = "subcircle_space",
		desc = "弹幕循环间隔(秒)"
	},
	sub_color = {
		key = "sub_color",
		desc = "弹幕颜色编号(color表)",
		val = {
			91,
			97
		}
	},
	sub_font = {
		key = "sub_font",
		desc = "弹幕字体大小",
		val = {
			25,
			30
		}
	},
	sub_cost = {
		val = 500,
		key = "sub_cost",
		desc = "弹幕发送消耗(银币)"
	}
}

function Config.SubtitleData.data_const_fun(slot0)
	slot1 = Config.SubtitleData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.SubtitleData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
