Config = Config or {}
Config.GroupControlData = Config.GroupControlData or {}
Config.GroupControlData.data_step_length = 4
Config.GroupControlData.data_step = {
	{
		name = "跨服社交",
		desc = "领主参与<div fontcolor=#14ff32>众神战场</div>可增加本阶段进程值！",
		need_value = 7000,
		timeout_day = 4,
		step = 1,
		step_quest = {
			104
		},
		step_function = {
			1000,
			1001,
			1004
		},
		step_reward = {
			{
				2,
				30
			},
			{
				1,
				30000
			}
		}
	},
	{
		name = "跨服战场",
		desc = "领主参与<div fontcolor=#14ff32>段位赛</div>可增加本阶段进程值！",
		need_value = 14000,
		timeout_day = 4,
		step = 2,
		step_quest = {
			103
		},
		step_function = {
			1003,
			1005
		},
		step_reward = {
			{
				2,
				40
			},
			{
				1,
				50000
			}
		}
	},
	{
		name = "跨服段位赛",
		desc = "领主参与<div fontcolor=#14ff32>剧情/地下城副本</div>可增加进程值！",
		need_value = 21000,
		timeout_day = 4,
		step = 3,
		step_quest = {
			101,
			102
		},
		step_function = {
			1002,
			1006
		},
		step_reward = {
			{
				2,
				50
			},
			{
				1,
				80000
			}
		}
	},
	{
		name = "时空融合",
		desc = "",
		need_value = 0,
		timeout_day = 0,
		step = 4,
		step_quest = {},
		step_function = {},
		step_reward = {}
	}
}
Config.GroupControlData.data_mission_length = 4
Config.GroupControlData.data_mission = {
	[101] = {
		quest_id = 101,
		add_value = 2,
		desc = "参与一次地下城副本"
	},
	[102] = {
		quest_id = 102,
		add_value = 2,
		desc = "参与一次剧情副本"
	},
	[103] = {
		quest_id = 103,
		add_value = 20,
		desc = "参与一次段位赛"
	},
	[104] = {
		quest_id = 104,
		add_value = 200,
		desc = "参与一次众神战场"
	}
}
Config.GroupControlData.data_function_length = 7
Config.GroupControlData.data_function = {
	[1000] = {
		id = 1000,
		icon = "txt_cn_group_1",
		desc = "跨服聊天"
	},
	[1001] = {
		id = 1001,
		icon = "txt_cn_group_2",
		desc = "跨服好友"
	},
	[1002] = {
		id = 1002,
		icon = "txt_cn_group_3",
		desc = "跨服段位赛"
	},
	[1003] = {
		id = 1003,
		icon = "txt_cn_group_4",
		desc = "跨服战场"
	},
	[1004] = {
		id = 1004,
		icon = "txt_cn_group_5",
		desc = "跨服切磋"
	},
	[1005] = {
		id = 1005,
		icon = "txt_cn_group_6",
		desc = "跨服首席争霸"
	},
	[1006] = {
		id = 1006,
		icon = "txt_cn_group_7",
		desc = "跨服钻石争霸"
	}
}
Config.GroupControlData.data_const_length = 3
Config.GroupControlData.data_const = {
	rule_desc = {
		val = 1,
		key = "rule_desc",
		desc = [[
1.跨服时空开放时，每次进入一个阶段时，将开放当前阶段对应的跨服功能；同时领主完成本阶段指定任务来提升进程值，推进服务器进入下一阶段；
2.各个阶段中，本服进程值达到任务上限后，领主可领取阶段宝箱奖励；
3.各个阶段中需要全部服务器都达到进程值上限才可进入下一阶段，缺一不可，领主们努力推进吧；
4.时空融合阶段已开放全部跨服功能，请期待下次惊喜到来！]]
	},
	max_level = {
		val = 4,
		key = "max_level",
		desc = "最大阶段"
	},
	original_value = {
		val = 7000,
		key = "original_value",
		desc = "初始进程值"
	}
}
