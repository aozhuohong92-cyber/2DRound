Config = Config or {}
Config.HolidayTimeAwardData = Config.HolidayTimeAwardData or {}
Config.HolidayTimeAwardData.data_const_length = 2
Config.HolidayTimeAwardData.data_const = {
	time_quantum = {
		desc = "图标每日出现时间段",
		val = {
			{
				12,
				0,
				0
			},
			{
				22,
				0,
				0
			}
		}
	},
	award = {
		desc = "奖励",
		val = {
			{
				39069,
				1
			}
		}
	}
}

function Config.HolidayTimeAwardData.data_const_fun(slot0)
	slot1 = Config.HolidayTimeAwardData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayTimeAwardData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayTimeAwardData.data_dialog_length = 1
Config.HolidayTimeAwardData.data_dialog = {
	[31817] = {
		{
			partner_id = 1,
			pro = 120,
			camp_id = 31817,
			dialogue = {
				{
					"娜美",
					0,
					"namei",
					"船长，新年到了，到处都在发红包！",
					350,
					150,
					70
				},
				{
					"",
					1,
					"anyingbaojun",
					"耶嘿？红包？",
					350,
					150,
					70
				},
				{
					"娜美",
					0,
					"namei",
					"红包！好包！贝里！钻石！我来啦！",
					350,
					150,
					70
				}
			}
		},
		{
			partner_id = 2,
			pro = 0,
			camp_id = 31817,
			dialogue = {
				{
					"娜美",
					0,
					"namei",
					"船长，新年到了，到处都在发红包！",
					350,
					150,
					70
				},
				{
					"",
					1,
					"anyingbaojun",
					"耶嘿？红包？",
					350,
					150,
					70
				},
				{
					"娜美",
					0,
					"namei",
					"红包！好包！贝里！钻石！我来啦！",
					350,
					150,
					70
				}
			}
		},
		{
			partner_id = 3,
			pro = 0,
			camp_id = 31817,
			dialogue = {
				{
					"乔巴",
					0,
					"qiaoba",
					"船长！新年快乐",
					220,
					150,
					70
				},
				{
					"",
					1,
					"anyingbaojun",
					"新年快乐！",
					220,
					150,
					70
				},
				{
					"乔巴",
					0,
					"qiaoba",
					"今年我们要朝着更精彩的冒险出发啦！",
					220,
					150,
					70
				}
			}
		},
		{
			partner_id = 4,
			pro = 0,
			camp_id = 31817,
			dialogue = {
				{
					"娜美",
					0,
					"namei",
					"船长，新年到了，到处都在发红包！",
					350,
					150,
					70
				},
				{
					"",
					1,
					"anyingbaojun",
					"耶嘿？红包？",
					350,
					150,
					70
				},
				{
					"娜美",
					0,
					"namei",
					"红包！好包！贝里！钻石！我来啦！",
					350,
					150,
					70
				}
			}
		},
		{
			partner_id = 5,
			pro = 0,
			camp_id = 31817,
			dialogue = {
				{
					"娜美",
					0,
					"namei",
					"船长，新年到了，到处都在发红包！",
					350,
					150,
					70
				},
				{
					"",
					1,
					"anyingbaojun",
					"耶嘿？红包？",
					350,
					150,
					70
				},
				{
					"娜美",
					0,
					"namei",
					"红包！好包！贝里！钻石！我来啦！",
					350,
					150,
					70
				}
			}
		},
		{
			partner_id = 6,
			pro = 0,
			camp_id = 31817,
			dialogue = {
				{
					"娜美",
					0,
					"namei",
					"船长，新年到了，到处都在发红包！",
					350,
					150,
					70
				},
				{
					"",
					1,
					"anyingbaojun",
					"耶嘿？红包？",
					350,
					150,
					70
				},
				{
					"娜美",
					0,
					"namei",
					"红包！好包！贝里！钻石！我来啦！",
					350,
					150,
					70
				}
			}
		},
		{
			partner_id = 7,
			pro = 0,
			camp_id = 31817,
			dialogue = {
				{
					"娜美",
					0,
					"namei",
					"船长，新年到了，到处都在发红包！",
					350,
					150,
					70
				},
				{
					"",
					1,
					"anyingbaojun",
					"耶嘿？红包？",
					350,
					150,
					70
				},
				{
					"娜美",
					0,
					"namei",
					"红包！好包！贝里！钻石！我来啦！",
					350,
					150,
					70
				}
			}
		},
		{
			partner_id = 8,
			pro = 0,
			camp_id = 31817,
			dialogue = {
				{
					"娜美",
					0,
					"namei",
					"船长，新年到了，到处都在发红包！",
					350,
					150,
					70
				},
				{
					"",
					1,
					"anyingbaojun",
					"耶嘿？红包？",
					350,
					150,
					70
				},
				{
					"娜美",
					0,
					"namei",
					"红包！好包！贝里！钻石！我来啦！",
					350,
					150,
					70
				}
			}
		},
		{
			partner_id = 9,
			pro = 0,
			camp_id = 31817,
			dialogue = {
				{
					"娜美",
					0,
					"namei",
					"船长，新年到了，到处都在发红包！",
					350,
					150,
					70
				},
				{
					"",
					1,
					"anyingbaojun",
					"耶嘿？红包？",
					350,
					150,
					70
				},
				{
					"娜美",
					0,
					"namei",
					"红包！好包！贝里！钻石！我来啦！",
					350,
					150,
					70
				}
			}
		},
		{
			partner_id = 10,
			pro = 0,
			camp_id = 31817,
			dialogue = {
				{
					"娜美",
					0,
					"namei",
					"船长，新年到了，到处都在发红包！",
					350,
					150,
					70
				},
				{
					"",
					1,
					"anyingbaojun",
					"耶嘿？红包？",
					350,
					150,
					70
				},
				{
					"娜美",
					0,
					"namei",
					"红包！好包！贝里！钻石！我来啦！",
					350,
					150,
					70
				}
			}
		},
		{
			partner_id = 11,
			pro = 0,
			camp_id = 31817,
			dialogue = {
				{
					"娜美",
					0,
					"namei",
					"船长，新年到了，到处都在发红包！",
					350,
					150,
					70
				},
				{
					"",
					1,
					"anyingbaojun",
					"耶嘿？红包？",
					350,
					150,
					70
				},
				{
					"娜美",
					0,
					"namei",
					"红包！好包！贝里！钻石！我来啦！",
					350,
					150,
					70
				}
			}
		},
		{
			partner_id = 12,
			pro = 0,
			camp_id = 31817,
			dialogue = {
				{
					"娜美",
					0,
					"namei",
					"船长，新年到了，到处都在发红包！",
					350,
					150,
					70
				},
				{
					"",
					1,
					"anyingbaojun",
					"耶嘿？红包？",
					350,
					150,
					70
				},
				{
					"娜美",
					0,
					"namei",
					"红包！好包！贝里！钻石！我来啦！",
					350,
					150,
					70
				}
			}
		}
	}
}
