Config = Config or {}
Config.PartnerFieldData = Config.PartnerFieldData or {}
Config.PartnerFieldData.data_field_const_length = 3
Config.PartnerFieldData.data_field_const = {
	open_level = {
		val = 30160,
		code = "open_level",
		desc = "通关剧情第100关开启助阵"
	},
	field_name = {
		val = 0,
		code = "field_name",
		desc = "合力之阵"
	},
	des_text = {
		val = 0,
		code = "des_text",
		desc = "1、所有战斗中出战的英雄都会享受助阵属性加成\n2、助阵的英雄战力越高，加成的属性越高\n3、升级助阵等级可额外百分比增加助阵属性"
	}
}
Config.PartnerFieldData.data_field_attr_length = 6
Config.PartnerFieldData.data_field_attr = {
	{
		limit_lev = 1,
		pos = 1,
		ratio = 84,
		attr_atom = "atk",
		expend = {}
	},
	{
		limit_lev = 40,
		pos = 2,
		ratio = 420,
		attr_atom = "hp_max",
		expend = {
			{
				2,
				100000
			}
		}
	},
	{
		limit_lev = 50,
		pos = 3,
		ratio = 63,
		attr_atom = "def",
		expend = {
			{
				2,
				200000
			}
		}
	},
	{
		limit_lev = 60,
		pos = 4,
		ratio = 84,
		attr_atom = "atk",
		expend = {
			{
				2,
				300000
			}
		}
	},
	{
		limit_lev = 70,
		pos = 5,
		ratio = 420,
		attr_atom = "hp_max",
		expend = {
			{
				2,
				400000
			}
		}
	},
	{
		limit_lev = 80,
		pos = 6,
		ratio = 63,
		attr_atom = "def",
		expend = {
			{
				2,
				500000
			}
		}
	}
}
Config.PartnerFieldData.data_field_lev_length = 21
Config.PartnerFieldData.data_field_lev = {
	{
		add_num = 0,
		lev = 1,
		expend = {
			{
				10120,
				1
			},
			{
				2,
				10000
			}
		}
	},
	{
		add_num = 20,
		lev = 2,
		expend = {
			{
				10120,
				2
			},
			{
				2,
				20000
			}
		}
	},
	{
		add_num = 40,
		lev = 3,
		expend = {
			{
				10120,
				3
			},
			{
				2,
				30000
			}
		}
	},
	{
		add_num = 60,
		lev = 4,
		expend = {
			{
				10120,
				4
			},
			{
				2,
				40000
			}
		}
	},
	{
		add_num = 80,
		lev = 5,
		expend = {
			{
				10120,
				5
			},
			{
				2,
				50000
			}
		}
	},
	{
		add_num = 100,
		lev = 6,
		expend = {
			{
				10120,
				6
			},
			{
				2,
				60000
			}
		}
	},
	{
		add_num = 120,
		lev = 7,
		expend = {
			{
				10120,
				7
			},
			{
				2,
				70000
			}
		}
	},
	{
		add_num = 140,
		lev = 8,
		expend = {
			{
				10120,
				8
			},
			{
				2,
				80000
			}
		}
	},
	{
		add_num = 160,
		lev = 9,
		expend = {
			{
				10120,
				9
			},
			{
				2,
				90000
			}
		}
	},
	{
		add_num = 180,
		lev = 10,
		expend = {
			{
				10120,
				10
			},
			{
				2,
				100000
			}
		}
	},
	{
		add_num = 200,
		lev = 11,
		expend = {
			{
				10120,
				11
			},
			{
				2,
				110000
			}
		}
	},
	{
		add_num = 220,
		lev = 12,
		expend = {
			{
				10120,
				12
			},
			{
				2,
				120000
			}
		}
	},
	{
		add_num = 240,
		lev = 13,
		expend = {
			{
				10120,
				13
			},
			{
				2,
				130000
			}
		}
	},
	{
		add_num = 260,
		lev = 14,
		expend = {
			{
				10120,
				14
			},
			{
				2,
				140000
			}
		}
	},
	{
		add_num = 280,
		lev = 15,
		expend = {
			{
				10120,
				15
			},
			{
				2,
				150000
			}
		}
	},
	{
		add_num = 300,
		lev = 16,
		expend = {
			{
				10120,
				16
			},
			{
				2,
				160000
			}
		}
	},
	{
		add_num = 320,
		lev = 17,
		expend = {
			{
				10120,
				17
			},
			{
				2,
				170000
			}
		}
	},
	{
		add_num = 340,
		lev = 18,
		expend = {
			{
				10120,
				18
			},
			{
				2,
				180000
			}
		}
	},
	{
		add_num = 360,
		lev = 19,
		expend = {
			{
				10120,
				19
			},
			{
				2,
				190000
			}
		}
	},
	{
		add_num = 380,
		lev = 20,
		expend = {
			{
				10120,
				20
			},
			{
				2,
				200000
			}
		}
	},
	{
		add_num = 400,
		lev = 21,
		expend = {}
	}
}
