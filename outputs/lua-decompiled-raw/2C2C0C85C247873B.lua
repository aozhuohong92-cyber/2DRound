Config = Config or {}
Config.FormationData = Config.FormationData or {}
Config.FormationData.data_form_cost_length = 8
Config.FormationData.data_form_cost = {
	lineup = {
		val = 3,
		code = "lineup",
		desc = ""
	},
	lineup_max = {
		val = 6,
		code = "lineup_max",
		desc = ""
	},
	lineup_unit = {
		val = 5,
		code = "lineup_unit",
		desc = ""
	},
	exp_a = {
		val = 200,
		code = "exp_a",
		desc = ""
	},
	exp_b = {
		val = 100,
		code = "exp_b",
		desc = ""
	},
	item_zf = {
		val = 10130,
		code = "item_zf",
		desc = ""
	},
	restrain_effect = {
		code = "restrain_effect",
		desc = "克制方全体<div fontcolor=249003>伤害+0%，免伤+0%</div>",
		val = {
			{
				"dam",
				0
			},
			{
				"res",
				0
			}
		}
	},
	restrain_des = {
		val = 0,
		code = "restrain_des",
		desc = "1、不同的阵法，英雄<div fontcolor=#249003>站位</div>不同，前、中、后排加成效果不同\n2、阵法<div fontcolor=#249003>等级</div>越高，属性加成越高\n3、阵法之间存在克制效果，克制将<div fontcolor=#249003>对敌方造成的伤害提高5%</div>，同时<div fontcolor=#249003>受到敌方的伤害降低5%</div>"
	}
}

function Config.FormationData.data_form_cost_fun(slot0)
	slot1 = Config.FormationData.data_form_cost[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.FormationData.data_form_cost[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.FormationData.data_form_data_length = 6
Config.FormationData.data_form_data = {
	{
		desc = "坚守阵",
		name = "坚守阵",
		type = 1,
		need_lev = 1,
		order = 1,
		pos = {
			{
				1,
				9
			},
			{
				2,
				7
			},
			{
				3,
				6
			},
			{
				4,
				4
			},
			{
				5,
				5
			},
			{
				6,
				2
			}
		},
		pos_list = {
			{
				1,
				312,
				283
			},
			{
				2,
				358,
				299
			},
			{
				3,
				226,
				215
			},
			{
				4,
				356,
				189
			},
			{
				5,
				278,
				147
			},
			{
				6,
				198,
				98
			}
		}
	},
	{
		desc = "狂暴阵",
		name = "狂暴阵",
		type = 2,
		need_lev = 20,
		order = 2,
		pos = {
			{
				1,
				1
			},
			{
				2,
				3
			},
			{
				3,
				4
			},
			{
				4,
				6
			},
			{
				5,
				8
			},
			{
				6,
				5
			}
		},
		pos_list = {
			{
				1,
				312,
				283
			},
			{
				2,
				226,
				215
			},
			{
				3,
				356,
				198
			},
			{
				4,
				278,
				147
			},
			{
				5,
				266,
				139
			},
			{
				6,
				196,
				98
			}
		}
	},
	{
		desc = "激战阵",
		name = "激战阵",
		type = 3,
		need_lev = 30,
		order = 3,
		pos = {
			{
				1,
				1
			},
			{
				2,
				2
			},
			{
				3,
				3
			},
			{
				4,
				5
			},
			{
				5,
				8
			},
			{
				6,
				9
			}
		},
		pos_list = {
			{
				1,
				312,
				283
			},
			{
				2,
				226,
				215
			},
			{
				3,
				356,
				198
			},
			{
				4,
				278,
				147
			},
			{
				5,
				266,
				139
			},
			{
				6,
				196,
				98
			}
		}
	},
	{
		desc = "对决阵",
		name = "对决阵",
		type = 4,
		need_lev = 60,
		order = 6,
		pos = {
			{
				1,
				2
			},
			{
				2,
				4
			},
			{
				3,
				5
			},
			{
				4,
				6
			},
			{
				5,
				8
			},
			{
				6,
				7
			}
		},
		pos_list = {
			{
				1,
				308,
				111
			},
			{
				2,
				142,
				138
			},
			{
				3,
				286,
				231
			},
			{
				4,
				55,
				200
			},
			{
				5,
				214,
				292
			},
			{
				6,
				196,
				98
			}
		}
	},
	[5] = {
		desc = "战魂阵",
		name = "战魂阵",
		type = 5,
		need_lev = 40,
		order = 4,
		pos = {
			{
				1,
				2
			},
			{
				2,
				5
			},
			{
				3,
				7
			},
			{
				4,
				8
			},
			{
				5,
				9
			},
			{
				6,
				4
			}
		},
		pos_list = {
			{
				1,
				358,
				299
			},
			{
				2,
				210,
				170
			},
			{
				3,
				356,
				198
			},
			{
				4,
				50,
				126
			},
			{
				5,
				278,
				147
			},
			{
				6,
				196,
				98
			}
		}
	},
	[6] = {
		desc = "核心阵",
		name = "核心阵",
		type = 6,
		need_lev = 50,
		order = 5,
		pos = {
			{
				1,
				1
			},
			{
				2,
				3
			},
			{
				3,
				5
			},
			{
				4,
				7
			},
			{
				5,
				8
			},
			{
				6,
				9
			}
		},
		pos_list = {
			{
				1,
				358,
				299
			},
			{
				2,
				356,
				198
			},
			{
				3,
				50,
				126
			},
			{
				4,
				278,
				147
			},
			{
				5,
				266,
				139
			},
			{
				6,
				196,
				98
			}
		}
	}
}

function Config.FormationData.data_form_data_fun(slot0)
	slot1 = Config.FormationData.data_form_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.FormationData.data_form_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
