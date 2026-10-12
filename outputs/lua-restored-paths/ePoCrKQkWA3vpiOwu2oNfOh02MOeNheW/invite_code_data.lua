Config = Config or {}
Config.InviteCodeData = Config.InviteCodeData or {}
Config.InviteCodeData.data_const_length = 2
Config.InviteCodeData.data_const = {
	bind_num = {
		val = 20,
		key = "bind_num",
		desc = "绑定数量上限"
	},
	tips = {
		val = 1,
		key = "tips",
		desc = [[
1.每个角色拥有唯一的分享邀请码
2.只有首次创角的账号，才可以填写邀请码
3.当填写邀请码的角色达到指定要求时，发出邀请码的用户，可以获得奖励，每个档次最多可领取20次
4.每个用户发出的邀请码数量不限制，但每个账号可绑定用户量为20个，每个受邀请的用户仅能填写一个邀请码
5.发出邀请的用户可以在「已邀请好友」查看受邀角色的情况
6.「先行体验服」的邀请码在版本更新期间可能存在数据延时和不可用的情况，如有问题，请在全服维护后再进行尝试]]
	}
}

function Config.InviteCodeData.data_const_fun(slot0)
	slot1 = Config.InviteCodeData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.InviteCodeData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.InviteCodeData.data_tesk_list_length = 14
Config.InviteCodeData.data_tesk_list = {
	{
		sort = 1,
		id = 1,
		num = 20,
		desc = "招募用户战力达50000",
		conds = {
			{
				"power",
				50000
			}
		},
		items = {
			{
				10001,
				50
			},
			{
				10002,
				5
			}
		}
	},
	{
		sort = 2,
		id = 2,
		num = 20,
		desc = "招募用户战力达100000",
		conds = {
			{
				"power",
				100000
			}
		},
		items = {
			{
				10450,
				100
			},
			{
				10403,
				1
			}
		}
	},
	{
		sort = 3,
		id = 3,
		num = 20,
		desc = "招募用户战力达150000",
		conds = {
			{
				"power",
				150000
			}
		},
		items = {
			{
				10450,
				200
			},
			{
				10403,
				1
			}
		}
	},
	{
		sort = 4,
		id = 4,
		num = 20,
		desc = "招募用户战力达200000",
		conds = {
			{
				"power",
				200000
			}
		},
		items = {
			{
				3,
				200
			},
			{
				10403,
				1
			}
		}
	},
	{
		sort = 5,
		id = 5,
		num = 20,
		desc = "招募用户战力达300000",
		conds = {
			{
				"power",
				300000
			}
		},
		items = {
			{
				3,
				300
			},
			{
				10403,
				2
			}
		}
	},
	{
		sort = 6,
		id = 6,
		num = 20,
		desc = "招募用户战力达500000",
		conds = {
			{
				"power",
				500000
			}
		},
		items = {
			{
				3,
				400
			},
			{
				14001,
				1
			}
		}
	},
	{
		sort = 7,
		id = 7,
		num = 20,
		desc = "招募用户战力达1000000",
		conds = {
			{
				"power",
				1000000
			}
		},
		items = {
			{
				3,
				500
			},
			{
				10453,
				1
			}
		}
	},
	{
		sort = 8,
		id = 8,
		num = 20,
		desc = "招募用户VIP等级达1级",
		conds = {
			{
				"vip",
				1
			}
		},
		items = {
			{
				3,
				100
			},
			{
				10403,
				1
			}
		}
	},
	{
		sort = 9,
		id = 9,
		num = 20,
		desc = "招募用户VIP等级达2级",
		conds = {
			{
				"vip",
				2
			}
		},
		items = {
			{
				3,
				200
			},
			{
				10403,
				2
			}
		}
	},
	{
		sort = 10,
		id = 10,
		num = 20,
		desc = "招募用户VIP等级达3级",
		conds = {
			{
				"vip",
				3
			}
		},
		items = {
			{
				3,
				300
			},
			{
				10403,
				3
			}
		}
	},
	{
		sort = 11,
		id = 11,
		num = 20,
		desc = "招募用户VIP等级达5级",
		conds = {
			{
				"vip",
				5
			}
		},
		items = {
			{
				3,
				500
			},
			{
				10403,
				5
			}
		}
	},
	{
		sort = 12,
		id = 12,
		num = 20,
		desc = "招募用户VIP等级达8级",
		conds = {
			{
				"vip",
				8
			}
		},
		items = {
			{
				3,
				800
			},
			{
				14001,
				1
			}
		}
	},
	{
		sort = 13,
		id = 13,
		num = 20,
		desc = "招募用户VIP等级达10级",
		conds = {
			{
				"vip",
				10
			}
		},
		items = {
			{
				3,
				1200
			},
			{
				14001,
				2
			}
		}
	},
	{
		sort = 14,
		id = 14,
		num = 20,
		desc = "招募用户VIP等级达12级",
		conds = {
			{
				"vip",
				12
			}
		},
		items = {
			{
				3,
				1500
			},
			{
				29905,
				50
			}
		}
	}
}

function Config.InviteCodeData.data_tesk_list_fun(slot0)
	slot1 = Config.InviteCodeData.data_tesk_list[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.InviteCodeData.data_tesk_list[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.InviteCodeData.data_return_list_length = 7
Config.InviteCodeData.data_return_list = {
	{
		sort = 1,
		id = 1,
		num = 20,
		desc = "招募用户战力达50000",
		conds = {
			{
				"power",
				50000
			}
		},
		items = {
			{
				10001,
				50
			},
			{
				10002,
				5
			}
		}
	},
	{
		sort = 2,
		id = 2,
		num = 20,
		desc = "招募用户战力达100000",
		conds = {
			{
				"power",
				100000
			}
		},
		items = {
			{
				10450,
				100
			},
			{
				10403,
				1
			}
		}
	},
	{
		sort = 3,
		id = 3,
		num = 20,
		desc = "招募用户战力达150000",
		conds = {
			{
				"power",
				150000
			}
		},
		items = {
			{
				10450,
				200
			},
			{
				10403,
				1
			}
		}
	},
	{
		sort = 4,
		id = 4,
		num = 20,
		desc = "招募用户战力达200000",
		conds = {
			{
				"power",
				200000
			}
		},
		items = {
			{
				3,
				200
			},
			{
				10403,
				1
			}
		}
	},
	{
		sort = 5,
		id = 5,
		num = 20,
		desc = "招募用户战力达300000",
		conds = {
			{
				"power",
				300000
			}
		},
		items = {
			{
				3,
				300
			},
			{
				10403,
				2
			}
		}
	},
	{
		sort = 6,
		id = 6,
		num = 20,
		desc = "招募用户战力达500000",
		conds = {
			{
				"power",
				500000
			}
		},
		items = {
			{
				3,
				400
			},
			{
				14001,
				1
			}
		}
	},
	{
		sort = 7,
		id = 7,
		num = 20,
		desc = "招募用户战力达1000000",
		conds = {
			{
				"power",
				1000000
			}
		},
		items = {
			{
				3,
				500
			},
			{
				10453,
				1
			}
		}
	}
}

function Config.InviteCodeData.data_return_list_fun(slot0)
	slot1 = Config.InviteCodeData.data_return_list[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.InviteCodeData.data_return_list[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
