Config = Config or {}
Config.WelfareData = Config.WelfareData or {}
Config.WelfareData.data_welfare_const_length = 7
Config.WelfareData.data_welfare_const = {
	award = {
		code = "award",
		type = "所有任务达成后奖励",
		val = {
			{
				26907,
				50
			}
		}
	},
	min_reg_day = {
		val = 1,
		code = "min_reg_day",
		type = "最小注册天数要求"
	},
	max_reg_day = {
		val = 3,
		code = "max_reg_day",
		type = "最大注册天数限制"
	},
	dun_max_id = {
		val = 75,
		code = "dun_max_id",
		type = "剧情副本通关数"
	},
	invade_id = {
		val = 99940,
		code = "invade_id",
		type = "进攻id（展示方）"
	},
	defend_id = {
		val = 99941,
		code = "defend_id",
		type = "防守id（强力的怪物）"
	},
	limit_open_srv_date = {
		code = "limit_open_srv_date",
		type = "该时间后开的新服不开启该活动",
		val = {
			{
				2020,
				4,
				2
			},
			{
				9,
				59,
				0
			}
		}
	}
}

function Config.WelfareData.data_welfare_const_fun(slot0)
	slot1 = Config.WelfareData.data_welfare_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.WelfareData.data_welfare_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
