Config = Config or {}
Config.ActivityData = Config.ActivityData or {}
Config.ActivityData.data_get_length = 4
Config.ActivityData.data_get = {
	{
		index = 1,
		activity = 25,
		rewards = {
			{
				3,
				20
			},
			{
				1,
				10000
			}
		}
	},
	{
		index = 2,
		activity = 50,
		rewards = {
			{
				3,
				30
			},
			{
				10401,
				2
			}
		}
	},
	{
		index = 3,
		activity = 75,
		rewards = {
			{
				3,
				50
			},
			{
				37001,
				1
			}
		}
	},
	{
		index = 4,
		activity = 100,
		rewards = {
			{
				3,
				100
			},
			{
				1,
				50000
			}
		}
	}
}

function Config.ActivityData.data_get_fun(slot0)
	slot1 = Config.ActivityData.data_get[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ActivityData.data_get[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ActivityData.data_sign_info_length = 8
Config.ActivityData.data_sign_info = {
	{
		ok = "前往参与",
		time = 10,
		id = 1,
		cancel = "取消",
		desc = "<div fontcolor=#d95014>冠军赛</div>马上开始！谁将登上冠军宝座，参与比赛和趣味竞猜可活动丰厚奖励哦~",
		items = {
			50012,
			1,
			8,
			29905
		}
	},
	{
		ok = "前往参与",
		time = 10,
		id = 2,
		cancel = "取消",
		desc = "<div fontcolor=#d95014>冠军赛</div>已经开始啦，正在进行竞猜阶段。是否前往参与竞猜？",
		items = {
			50012,
			1,
			8,
			29905
		}
	},
	{
		ok = "前往报名",
		time = 10,
		id = 3,
		cancel = "取消",
		desc = "<div fontcolor=#d95014>顶上战争</div>马上开始啦，正在进行报名阶段，快来参与强者之间的较量吧！",
		items = {
			50603,
			8,
			10030,
			30302,
			2
		}
	},
	{
		ok = "进入战场",
		time = 10,
		id = 4,
		cancel = "取消",
		desc = "<div fontcolor=#d95014>顶上战争</div>正在进行中，大量奖励等你来拿，是否进入？",
		items = {
			50603,
			8,
			10030,
			30302,
			2
		}
	},
	[11] = {
		ok = "前往参与",
		time = 10,
		id = 11,
		cancel = "取消",
		desc = "<div fontcolor=#d95014>周冠军赛</div>已经开始啦，正在进行竞猜阶段。是否前往参与竞猜？",
		items = {
			72109,
			10453,
			29905,
			34,
			1450
		}
	},
	[12] = {
		ok = "前往参与",
		time = 10,
		id = 12,
		cancel = "取消",
		desc = "<div fontcolor=#d95014>周冠军赛</div>马上开始！谁将登上冠军宝座，参与比赛和趣味竞猜可活动丰厚奖励哦~",
		items = {
			72109,
			10453,
			29905,
			34,
			1450
		}
	},
	[13] = {
		ok = "前往参与",
		time = 10,
		id = 13,
		cancel = "取消",
		desc = "<div fontcolor=#d95014>巅峰冠军赛</div>已经开始啦，正在进行竞猜阶段。是否前往参与竞猜？",
		items = {
			72112,
			50024,
			10603,
			27907,
			38
		}
	},
	[14] = {
		ok = "前往参与",
		time = 10,
		id = 14,
		cancel = "取消",
		desc = "<div fontcolor=#d95014>巅峰冠军赛</div>已经开始啦，正在进行竞猜阶段。是否前往参与竞猜？",
		items = {
			72112,
			50024,
			10603,
			27907,
			38
		}
	}
}

function Config.ActivityData.data_sign_info_fun(slot0)
	slot1 = Config.ActivityData.data_sign_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ActivityData.data_sign_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
