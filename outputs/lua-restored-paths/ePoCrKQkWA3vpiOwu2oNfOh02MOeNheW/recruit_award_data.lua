Config = Config or {}
Config.RecruitAwardData = Config.RecruitAwardData or {}
Config.RecruitAwardData.data_const_length = 3
Config.RecruitAwardData.data_const = {
	open_day = {
		val = 0,
		desc = "注册第几天开始"
	},
	end_day = {
		val = 0,
		desc = "注册第几天结束"
	},
	desc_rult = {
		val = 0,
		desc = "1.消耗钻石参与召唤可得好礼；\n2.免费召唤、贝里召唤、召唤券召唤次数不计算在内。"
	}
}

function Config.RecruitAwardData.data_const_fun(slot0)
	slot1 = Config.RecruitAwardData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitAwardData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RecruitAwardData.data_huoli_length = 9
Config.RecruitAwardData.data_huoli = {
	{
		count = 5,
		type = 0,
		id = 1,
		desc = "钻石召唤5次",
		award = {
			{
				3,
				100
			}
		}
	},
	{
		count = 10,
		type = 0,
		id = 2,
		desc = "钻石召唤10次",
		award = {
			{
				3,
				100
			},
			{
				3,
				100
			}
		}
	},
	{
		count = 20,
		type = 0,
		id = 3,
		desc = "钻石召唤20次",
		award = {
			{
				3,
				100
			},
			{
				3,
				100
			}
		}
	},
	{
		count = 30,
		type = 0,
		id = 4,
		desc = "钻石召唤30次",
		award = {
			{
				3,
				100
			},
			{
				3,
				100
			}
		}
	},
	{
		count = 50,
		type = 0,
		id = 5,
		desc = "钻石召唤50次",
		award = {
			{
				3,
				100
			},
			{
				3,
				100
			}
		}
	},
	{
		count = 80,
		type = 0,
		id = 6,
		desc = "钻石召唤80次",
		award = {
			{
				3,
				100
			},
			{
				3,
				100
			}
		}
	},
	{
		count = 100,
		type = 0,
		id = 7,
		desc = "钻石召唤100次",
		award = {
			{
				3,
				100
			},
			{
				3,
				100
			}
		}
	},
	{
		count = 150,
		type = 0,
		id = 8,
		desc = "钻石召唤150次",
		award = {
			{
				3,
				100
			},
			{
				3,
				100
			}
		}
	},
	{
		count = 200,
		type = 0,
		id = 9,
		desc = "钻石召唤200次",
		award = {
			{
				3,
				100
			},
			{
				3,
				100
			}
		}
	}
}

function Config.RecruitAwardData.data_huoli_fun(slot0)
	slot1 = Config.RecruitAwardData.data_huoli[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitAwardData.data_huoli[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
