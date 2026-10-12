Config = Config or {}
Config.SubscriberData = Config.SubscriberData or {}
Config.SubscriberData.data_constant_length = 7
Config.SubscriberData.data_constant = {
	rules = {
		val = 1,
		desc = "1.获得专属万里阳光头像框使用权\n2.每日额外一次免费高级召唤\n3.每7天额外获得一颗生命金卡"
	},
	agreement_ios = {
		val = 1,
		desc = [[
1、订阅可以由用户管理，并且可以在购买后前往用户账号设置内取消自动续订 
2、账号将在当前期间结束前24小时内收取续订费用，并确定自动续费费用 
3、除非在当前期间结束前至少24小时关闭自动续订，订阅将自动续订 
4、付款将在确认购买时从iTunes账户中扣除 
5、苹果将对所有通过iTunes进行的支付操作进行监控和管理
6、季度按90天计算，月度按30天计算
7、幸运冒险召唤卷及生命金卡将会通过邮件发放，请注意查收
8、幸运冒险召唤卷需要在高级召唤库使用]]
	},
	agreement2_and = {
		val = 1,
		desc = "1、季度按90天计算，月度按30天计算\n2、精英召唤券、天命礼包及强化训练将会通过邮件发放，请注意查收\n3、精英召唤券需要在精英召唤中使用"
	},
	circle_id = {
		val = 5000,
		desc = "头像框资源"
	},
	item_avatar = {
		val = 50034,
		desc = "头像框id"
	},
	item_recuit = {
		val = 10408,
		desc = "特权召唤卷id"
	},
	item_stone = {
		val = 10450,
		desc = "强化训练ID"
	}
}

function Config.SubscriberData.data_constant_fun(slot0)
	slot1 = Config.SubscriberData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.SubscriberData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.SubscriberData.data_id_info_length = 2
Config.SubscriberData.data_id_info = {
	{
		days = 30,
		charge_id = 1701,
		type = 1,
		id = 1,
		reward = {
			{
				50034,
				1
			}
		},
		day_reward = {
			{
				10408,
				1
			},
			{
				39185,
				1
			}
		},
		seven_day_reward = {
			{
				10450,
				3500
			}
		}
	},
	{
		days = 90,
		charge_id = 1702,
		type = 2,
		id = 2,
		reward = {
			{
				50035,
				1
			}
		},
		day_reward = {
			{
				10408,
				1
			},
			{
				39185,
				1
			}
		},
		seven_day_reward = {
			{
				10450,
				3500
			}
		}
	}
}
Config.SubscriberData.data_type_info_length = 2
Config.SubscriberData.data_type_info = {
	{
		days = 30,
		charge_id = 1701,
		type = 1,
		id = 1,
		reward = {
			{
				50034,
				1
			}
		},
		day_reward = {
			{
				10408,
				1
			},
			{
				39185,
				1
			}
		},
		seven_day_reward = {
			{
				10450,
				3500
			}
		}
	},
	{
		days = 90,
		charge_id = 1702,
		type = 2,
		id = 2,
		reward = {
			{
				50035,
				1
			}
		},
		day_reward = {
			{
				10408,
				1
			},
			{
				39185,
				1
			}
		},
		seven_day_reward = {
			{
				10450,
				3500
			}
		}
	}
}
