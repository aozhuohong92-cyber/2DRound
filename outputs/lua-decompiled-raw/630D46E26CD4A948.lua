Config = Config or {}
Config.PartnerCatalogData = Config.PartnerCatalogData or {}
Config.PartnerCatalogData.data_catalog_type_length = 4
Config.PartnerCatalogData.data_catalog_type = {
	[3] = {
		name = "精品",
		quality = 3,
		quality_icon = "catalog_quality_3"
	},
	[4] = {
		name = "极品",
		quality = 4,
		quality_icon = "catalog_quality_4"
	},
	[5] = {
		name = "传说",
		quality = 5,
		quality_icon = "catalog_quality_5"
	},
	[6] = {
		name = "至尊",
		quality = 6,
		quality_icon = "catalog_quality_6"
	}
}

function Config.PartnerCatalogData.data_catalog_type_fun(slot0)
	slot1 = Config.PartnerCatalogData.data_catalog_type[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerCatalogData.data_catalog_type[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerCatalogData.data_catalog_list_length = 7
Config.PartnerCatalogData.data_catalog_list = {
	[301] = {
		name = "东海四霸",
		quality = 3,
		desc = "catalog_503",
		gid = 301,
		camp_type = 0,
		career = 0,
		sort = 34
	},
	[302] = {
		name = "小丑海贼团",
		quality = 3,
		desc = "catalog_618",
		gid = 302,
		camp_type = 0,
		career = 0,
		sort = 33
	},
	[401] = {
		name = "空岛恶霸",
		quality = 4,
		desc = "catalog_601",
		gid = 401,
		camp_type = 0,
		career = 0,
		sort = 31
	},
	[502] = {
		name = "极恶世代",
		quality = 5,
		desc = "catalog_514",
		gid = 502,
		camp_type = 0,
		career = 0,
		sort = 24
	},
	[503] = {
		name = "兄弟",
		quality = 5,
		desc = "catalog_610",
		gid = 503,
		camp_type = 0,
		career = 0,
		sort = 23
	},
	[602] = {
		name = "三大将",
		quality = 6,
		desc = "catalog_510",
		gid = 602,
		camp_type = 0,
		career = 0,
		sort = 10
	},
	[606] = {
		name = "草帽传承",
		quality = 6,
		desc = "catalog_404",
		gid = 606,
		camp_type = 0,
		career = 0,
		sort = 8
	}
}

function Config.PartnerCatalogData.data_catalog_list_fun(slot0)
	slot1 = Config.PartnerCatalogData.data_catalog_list[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerCatalogData.data_catalog_list[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerCatalogData.data_get_update_length = 261
Config.PartnerCatalogData.data_get_update = {
	["301_1"] = {
		lev = 1,
		gid = 301,
		next_lev = 2,
		cards = {
			{
				50401,
				1
			},
			{
				50402,
				1
			},
			{
				50403,
				1
			},
			{
				50301,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk",
				530
			}
		}
	},
	["301_2"] = {
		lev = 2,
		gid = 301,
		next_lev = 3,
		cards = {
			{
				50401,
				1
			},
			{
				50402,
				1
			},
			{
				50403,
				1
			},
			{
				50301,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk",
				1087
			}
		}
	},
	["301_3"] = {
		lev = 3,
		gid = 301,
		next_lev = 9999,
		cards = {
			{
				50401,
				1
			},
			{
				50402,
				1
			},
			{
				50403,
				1
			},
			{
				50301,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk",
				1670
			}
		}
	},
	["302_1"] = {
		lev = 1,
		gid = 302,
		next_lev = 2,
		cards = {
			{
				10508,
				1
			},
			{
				10402,
				1
			}
		},
		materials = {},
		effect = {
			{
				"hp_max",
				5300
			}
		}
	},
	["302_2"] = {
		lev = 2,
		gid = 302,
		next_lev = 3,
		cards = {
			{
				10508,
				1
			},
			{
				10402,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"hp_max",
				10870
			}
		}
	},
	["302_3"] = {
		lev = 3,
		gid = 302,
		next_lev = 9999,
		cards = {
			{
				10508,
				1
			},
			{
				10402,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"hp_max",
				16700
			}
		}
	},
	["303_1"] = {
		lev = 1,
		gid = 303,
		next_lev = 2,
		cards = {
			{
				30101,
				1
			},
			{
				30202,
				1
			},
			{
				30305,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk",
				530
			}
		}
	},
	["303_2"] = {
		lev = 2,
		gid = 303,
		next_lev = 3,
		cards = {
			{
				30101,
				1
			},
			{
				30202,
				1
			},
			{
				30305,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk",
				1087
			}
		}
	},
	["303_3"] = {
		lev = 3,
		gid = 303,
		next_lev = 9999,
		cards = {
			{
				30101,
				1
			},
			{
				30202,
				1
			},
			{
				30305,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk",
				1670
			}
		}
	},
	["401_1"] = {
		lev = 1,
		gid = 401,
		next_lev = 2,
		cards = {
			{
				10506,
				1
			},
			{
				10401,
				1
			},
			{
				10510,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk",
				530
			},
			{
				"hp_max",
				5300
			}
		}
	},
	["401_2"] = {
		lev = 2,
		gid = 401,
		next_lev = 3,
		cards = {
			{
				10506,
				1
			},
			{
				10401,
				1
			},
			{
				10510,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk",
				1087
			},
			{
				"hp_max",
				5300
			}
		}
	},
	["401_3"] = {
		lev = 3,
		gid = 401,
		next_lev = 4,
		cards = {
			{
				10506,
				1
			},
			{
				10401,
				1
			},
			{
				10510,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk",
				1670
			},
			{
				"hp_max",
				5300
			}
		}
	},
	["401_4"] = {
		lev = 4,
		gid = 401,
		next_lev = 5,
		cards = {
			{
				10506,
				1
			},
			{
				10401,
				1
			},
			{
				10510,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"atk",
				2279
			},
			{
				"hp_max",
				5300
			}
		}
	},
	["401_5"] = {
		lev = 5,
		gid = 401,
		next_lev = 9999,
		cards = {
			{
				10506,
				1
			},
			{
				10401,
				1
			},
			{
				10510,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"atk",
				2915
			},
			{
				"hp_max",
				5300
			}
		}
	},
	["402_1"] = {
		lev = 1,
		gid = 402,
		next_lev = 2,
		cards = {
			{
				40403,
				1
			},
			{
				30403,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk",
				530
			},
			{
				"hp_max",
				5300
			}
		}
	},
	["402_2"] = {
		lev = 2,
		gid = 402,
		next_lev = 3,
		cards = {
			{
				40403,
				1
			},
			{
				30403,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk",
				1087
			},
			{
				"hp_max",
				5300
			}
		}
	},
	["402_3"] = {
		lev = 3,
		gid = 402,
		next_lev = 4,
		cards = {
			{
				40403,
				1
			},
			{
				30403,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk",
				1670
			},
			{
				"hp_max",
				5300
			}
		}
	},
	["402_4"] = {
		lev = 4,
		gid = 402,
		next_lev = 5,
		cards = {
			{
				40403,
				1
			},
			{
				30403,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"atk",
				2279
			},
			{
				"hp_max",
				5300
			}
		}
	},
	["402_5"] = {
		lev = 5,
		gid = 402,
		next_lev = 9999,
		cards = {
			{
				40403,
				1
			},
			{
				30403,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"atk",
				2915
			},
			{
				"hp_max",
				5300
			}
		}
	},
	["403_1"] = {
		lev = 1,
		gid = 403,
		next_lev = 2,
		cards = {
			{
				30402,
				1
			},
			{
				30401,
				1
			},
			{
				30404,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk",
				530
			},
			{
				"hp_max",
				5300
			}
		}
	},
	["403_2"] = {
		lev = 2,
		gid = 403,
		next_lev = 3,
		cards = {
			{
				30402,
				1
			},
			{
				30401,
				1
			},
			{
				30404,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk",
				1087
			},
			{
				"hp_max",
				5300
			}
		}
	},
	["403_3"] = {
		lev = 3,
		gid = 403,
		next_lev = 4,
		cards = {
			{
				30402,
				1
			},
			{
				30401,
				1
			},
			{
				30404,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk",
				1670
			},
			{
				"hp_max",
				5300
			}
		}
	},
	["403_4"] = {
		lev = 4,
		gid = 403,
		next_lev = 5,
		cards = {
			{
				30402,
				1
			},
			{
				30401,
				1
			},
			{
				30404,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"atk",
				2279
			},
			{
				"hp_max",
				5300
			}
		}
	},
	["403_5"] = {
		lev = 5,
		gid = 403,
		next_lev = 9999,
		cards = {
			{
				30402,
				1
			},
			{
				30401,
				1
			},
			{
				30404,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"atk",
				2915
			},
			{
				"hp_max",
				5300
			}
		}
	},
	["404_1"] = {
		lev = 1,
		gid = 404,
		next_lev = 2,
		cards = {
			{
				10509,
				1
			},
			{
				10508,
				1
			}
		},
		materials = {},
		effect = {
			{
				"hp_max",
				5300
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["404_2"] = {
		lev = 2,
		gid = 404,
		next_lev = 3,
		cards = {
			{
				10509,
				1
			},
			{
				10508,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"hp_max",
				10870
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["404_3"] = {
		lev = 3,
		gid = 404,
		next_lev = 4,
		cards = {
			{
				10509,
				1
			},
			{
				10508,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"hp_max",
				16700
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["404_4"] = {
		lev = 4,
		gid = 404,
		next_lev = 5,
		cards = {
			{
				10509,
				1
			},
			{
				10508,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"hp_max",
				22790
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["404_5"] = {
		lev = 5,
		gid = 404,
		next_lev = 9999,
		cards = {
			{
				10509,
				1
			},
			{
				10508,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"hp_max",
				29150
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["405_1"] = {
		lev = 1,
		gid = 405,
		next_lev = 2,
		cards = {
			{
				10511,
				1
			},
			{
				10506,
				1
			},
			{
				30401,
				1
			}
		},
		materials = {},
		effect = {
			{
				"hp_max",
				5300
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["405_2"] = {
		lev = 2,
		gid = 405,
		next_lev = 3,
		cards = {
			{
				10511,
				1
			},
			{
				10506,
				1
			},
			{
				30401,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"hp_max",
				10870
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["405_3"] = {
		lev = 3,
		gid = 405,
		next_lev = 4,
		cards = {
			{
				10511,
				1
			},
			{
				10506,
				1
			},
			{
				30401,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"hp_max",
				16700
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["405_4"] = {
		lev = 4,
		gid = 405,
		next_lev = 5,
		cards = {
			{
				10511,
				1
			},
			{
				10506,
				1
			},
			{
				30401,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"hp_max",
				22790
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["405_5"] = {
		lev = 5,
		gid = 405,
		next_lev = 9999,
		cards = {
			{
				10511,
				1
			},
			{
				10506,
				1
			},
			{
				30401,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"hp_max",
				29150
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["406_1"] = {
		lev = 1,
		gid = 406,
		next_lev = 2,
		cards = {
			{
				10504,
				1
			},
			{
				50401,
				1
			},
			{
				50402,
				1
			},
			{
				50403,
				1
			},
			{
				50404,
				1
			}
		},
		materials = {},
		effect = {
			{
				"hp_max",
				5300
			},
			{
				"speed",
				1
			}
		}
	},
	["406_2"] = {
		lev = 2,
		gid = 406,
		next_lev = 3,
		cards = {
			{
				10504,
				1
			},
			{
				50401,
				1
			},
			{
				50402,
				1
			},
			{
				50403,
				1
			},
			{
				50404,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"hp_max",
				10870
			},
			{
				"speed",
				1
			}
		}
	},
	["406_3"] = {
		lev = 3,
		gid = 406,
		next_lev = 4,
		cards = {
			{
				10504,
				1
			},
			{
				50401,
				1
			},
			{
				50402,
				1
			},
			{
				50403,
				1
			},
			{
				50404,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"hp_max",
				16700
			},
			{
				"speed",
				1
			}
		}
	},
	["406_4"] = {
		lev = 4,
		gid = 406,
		next_lev = 5,
		cards = {
			{
				10504,
				1
			},
			{
				50401,
				1
			},
			{
				50402,
				1
			},
			{
				50403,
				1
			},
			{
				50404,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"hp_max",
				22790
			},
			{
				"speed",
				1
			}
		}
	},
	["406_5"] = {
		lev = 5,
		gid = 406,
		next_lev = 9999,
		cards = {
			{
				10504,
				1
			},
			{
				50401,
				1
			},
			{
				50402,
				1
			},
			{
				50403,
				1
			},
			{
				50404,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"hp_max",
				29150
			},
			{
				"speed",
				1
			}
		}
	},
	["501_1"] = {
		lev = 1,
		gid = 501,
		next_lev = 2,
		cards = {
			{
				20508,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk",
				530
			},
			{
				"atk_per",
				3
			}
		}
	},
	["501_2"] = {
		lev = 2,
		gid = 501,
		next_lev = 3,
		cards = {
			{
				20508,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk",
				1087
			},
			{
				"atk_per",
				3
			}
		}
	},
	["501_3"] = {
		lev = 3,
		gid = 501,
		next_lev = 4,
		cards = {
			{
				20508,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk",
				1670
			},
			{
				"atk_per",
				3
			}
		}
	},
	["501_4"] = {
		lev = 4,
		gid = 501,
		next_lev = 5,
		cards = {
			{
				20508,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"atk",
				2279
			},
			{
				"atk_per",
				3
			}
		}
	},
	["501_5"] = {
		lev = 5,
		gid = 501,
		next_lev = 6,
		cards = {
			{
				20508,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"atk",
				2915
			},
			{
				"atk_per",
				3
			}
		}
	},
	["501_6"] = {
		lev = 6,
		gid = 501,
		next_lev = 7,
		cards = {
			{
				20508,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"atk",
				3578
			},
			{
				"atk_per",
				3
			}
		}
	},
	["501_7"] = {
		lev = 7,
		gid = 501,
		next_lev = 8,
		cards = {
			{
				20508,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"atk",
				4267
			},
			{
				"atk_per",
				3
			}
		}
	},
	["501_8"] = {
		lev = 8,
		gid = 501,
		next_lev = 9999,
		cards = {
			{
				20508,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"atk",
				4982
			},
			{
				"atk_per",
				3
			}
		}
	},
	["502_1"] = {
		lev = 1,
		gid = 502,
		next_lev = 2,
		cards = {
			{
				10503,
				1
			},
			{
				10504,
				1
			},
			{
				10505,
				1
			},
			{
				10511,
				1
			}
		},
		materials = {},
		effect = {
			{
				"hp_max",
				5300
			},
			{
				"tenacity",
				3
			}
		}
	},
	["502_2"] = {
		lev = 2,
		gid = 502,
		next_lev = 3,
		cards = {
			{
				10503,
				1
			},
			{
				10504,
				1
			},
			{
				10505,
				1
			},
			{
				10511,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"hp_max",
				10870
			},
			{
				"tenacity",
				3
			}
		}
	},
	["502_3"] = {
		lev = 3,
		gid = 502,
		next_lev = 4,
		cards = {
			{
				10503,
				1
			},
			{
				10504,
				1
			},
			{
				10505,
				1
			},
			{
				10511,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"hp_max",
				16700
			},
			{
				"tenacity",
				3
			}
		}
	},
	["502_4"] = {
		lev = 4,
		gid = 502,
		next_lev = 5,
		cards = {
			{
				10503,
				1
			},
			{
				10504,
				1
			},
			{
				10505,
				1
			},
			{
				10511,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"hp_max",
				22790
			},
			{
				"tenacity",
				3
			}
		}
	},
	["502_5"] = {
		lev = 5,
		gid = 502,
		next_lev = 6,
		cards = {
			{
				10503,
				1
			},
			{
				10504,
				1
			},
			{
				10505,
				1
			},
			{
				10511,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"hp_max",
				29150
			},
			{
				"tenacity",
				3
			}
		}
	},
	["502_6"] = {
		lev = 6,
		gid = 502,
		next_lev = 7,
		cards = {
			{
				10503,
				1
			},
			{
				10504,
				1
			},
			{
				10505,
				1
			},
			{
				10511,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"hp_max",
				35780
			},
			{
				"tenacity",
				3
			}
		}
	},
	["502_7"] = {
		lev = 7,
		gid = 502,
		next_lev = 8,
		cards = {
			{
				10503,
				1
			},
			{
				10504,
				1
			},
			{
				10505,
				1
			},
			{
				10511,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"hp_max",
				42670
			},
			{
				"tenacity",
				3
			}
		}
	},
	["502_8"] = {
		lev = 8,
		gid = 502,
		next_lev = 9999,
		cards = {
			{
				10503,
				1
			},
			{
				10504,
				1
			},
			{
				10505,
				1
			},
			{
				10511,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"hp_max",
				49820
			},
			{
				"tenacity",
				3
			}
		}
	},
	["503_1"] = {
		lev = 1,
		gid = 503,
		next_lev = 2,
		cards = {
			{
				20510,
				1
			},
			{
				30506,
				1
			},
			{
				10502,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk",
				530
			},
			{
				"tenacity",
				3
			}
		}
	},
	["503_2"] = {
		lev = 2,
		gid = 503,
		next_lev = 3,
		cards = {
			{
				20510,
				1
			},
			{
				30506,
				1
			},
			{
				10502,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk",
				1087
			},
			{
				"tenacity",
				3
			}
		}
	},
	["503_3"] = {
		lev = 3,
		gid = 503,
		next_lev = 4,
		cards = {
			{
				20510,
				1
			},
			{
				30506,
				1
			},
			{
				10502,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk",
				1670
			},
			{
				"tenacity",
				3
			}
		}
	},
	["503_4"] = {
		lev = 4,
		gid = 503,
		next_lev = 5,
		cards = {
			{
				20510,
				1
			},
			{
				30506,
				1
			},
			{
				10502,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"atk",
				2279
			},
			{
				"tenacity",
				3
			}
		}
	},
	["503_5"] = {
		lev = 5,
		gid = 503,
		next_lev = 6,
		cards = {
			{
				20510,
				1
			},
			{
				30506,
				1
			},
			{
				10502,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"atk",
				2915
			},
			{
				"tenacity",
				3
			}
		}
	},
	["503_6"] = {
		lev = 6,
		gid = 503,
		next_lev = 7,
		cards = {
			{
				20510,
				1
			},
			{
				30506,
				1
			},
			{
				10502,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"atk",
				3578
			},
			{
				"tenacity",
				3
			}
		}
	},
	["503_7"] = {
		lev = 7,
		gid = 503,
		next_lev = 8,
		cards = {
			{
				20510,
				1
			},
			{
				30506,
				1
			},
			{
				10502,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"atk",
				4267
			},
			{
				"tenacity",
				3
			}
		}
	},
	["503_8"] = {
		lev = 8,
		gid = 503,
		next_lev = 9999,
		cards = {
			{
				20510,
				1
			},
			{
				30506,
				1
			},
			{
				10502,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"atk",
				4982
			},
			{
				"tenacity",
				3
			}
		}
	},
	["504_1"] = {
		lev = 1,
		gid = 504,
		next_lev = 2,
		cards = {
			{
				50507,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {},
		effect = {
			{
				"hp_max",
				5300
			},
			{
				"tenacity",
				3
			}
		}
	},
	["504_2"] = {
		lev = 2,
		gid = 504,
		next_lev = 3,
		cards = {
			{
				50507,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"hp_max",
				10870
			},
			{
				"tenacity",
				3
			}
		}
	},
	["504_3"] = {
		lev = 3,
		gid = 504,
		next_lev = 4,
		cards = {
			{
				50507,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"hp_max",
				16700
			},
			{
				"tenacity",
				3
			}
		}
	},
	["504_4"] = {
		lev = 4,
		gid = 504,
		next_lev = 5,
		cards = {
			{
				50507,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"hp_max",
				22790
			},
			{
				"tenacity",
				3
			}
		}
	},
	["504_5"] = {
		lev = 5,
		gid = 504,
		next_lev = 6,
		cards = {
			{
				50507,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"hp_max",
				29150
			},
			{
				"tenacity",
				3
			}
		}
	},
	["504_6"] = {
		lev = 6,
		gid = 504,
		next_lev = 7,
		cards = {
			{
				50507,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"hp_max",
				35780
			},
			{
				"tenacity",
				3
			}
		}
	},
	["504_7"] = {
		lev = 7,
		gid = 504,
		next_lev = 8,
		cards = {
			{
				50507,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"hp_max",
				42670
			},
			{
				"tenacity",
				3
			}
		}
	},
	["504_8"] = {
		lev = 8,
		gid = 504,
		next_lev = 9999,
		cards = {
			{
				50507,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"hp_max",
				49820
			},
			{
				"tenacity",
				3
			}
		}
	},
	["505_1"] = {
		lev = 1,
		gid = 505,
		next_lev = 2,
		cards = {
			{
				50505,
				1
			},
			{
				30510,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk",
				530
			},
			{
				"atk_per",
				3
			}
		}
	},
	["505_2"] = {
		lev = 2,
		gid = 505,
		next_lev = 3,
		cards = {
			{
				50505,
				1
			},
			{
				30510,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk",
				1087
			},
			{
				"atk_per",
				3
			}
		}
	},
	["505_3"] = {
		lev = 3,
		gid = 505,
		next_lev = 4,
		cards = {
			{
				50505,
				1
			},
			{
				30510,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk",
				1670
			},
			{
				"atk_per",
				3
			}
		}
	},
	["505_4"] = {
		lev = 4,
		gid = 505,
		next_lev = 5,
		cards = {
			{
				50505,
				1
			},
			{
				30510,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"atk",
				2279
			},
			{
				"atk_per",
				3
			}
		}
	},
	["505_5"] = {
		lev = 5,
		gid = 505,
		next_lev = 6,
		cards = {
			{
				50505,
				1
			},
			{
				30510,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"atk",
				2915
			},
			{
				"atk_per",
				3
			}
		}
	},
	["505_6"] = {
		lev = 6,
		gid = 505,
		next_lev = 7,
		cards = {
			{
				50505,
				1
			},
			{
				30510,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"atk",
				3578
			},
			{
				"atk_per",
				3
			}
		}
	},
	["505_7"] = {
		lev = 7,
		gid = 505,
		next_lev = 8,
		cards = {
			{
				50505,
				1
			},
			{
				30510,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"atk",
				4267
			},
			{
				"atk_per",
				3
			}
		}
	},
	["505_8"] = {
		lev = 8,
		gid = 505,
		next_lev = 9999,
		cards = {
			{
				50505,
				1
			},
			{
				30510,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"atk",
				4982
			},
			{
				"atk_per",
				3
			}
		}
	},
	["506_1"] = {
		lev = 1,
		gid = 506,
		next_lev = 2,
		cards = {
			{
				20511,
				1
			},
			{
				20502,
				1
			},
			{
				20505,
				1
			}
		},
		materials = {},
		effect = {
			{
				"hp_max_per",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["506_2"] = {
		lev = 2,
		gid = 506,
		next_lev = 3,
		cards = {
			{
				20511,
				1
			},
			{
				20502,
				1
			},
			{
				20505,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"hp_max_per",
				6
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["506_3"] = {
		lev = 3,
		gid = 506,
		next_lev = 4,
		cards = {
			{
				20511,
				1
			},
			{
				20502,
				1
			},
			{
				20505,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"hp_max_per",
				9
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["506_4"] = {
		lev = 4,
		gid = 506,
		next_lev = 5,
		cards = {
			{
				20511,
				1
			},
			{
				20502,
				1
			},
			{
				20505,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"hp_max_per",
				13
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["506_5"] = {
		lev = 5,
		gid = 506,
		next_lev = 6,
		cards = {
			{
				20511,
				1
			},
			{
				20502,
				1
			},
			{
				20505,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"hp_max_per",
				17
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["506_6"] = {
		lev = 6,
		gid = 506,
		next_lev = 7,
		cards = {
			{
				20511,
				1
			},
			{
				20502,
				1
			},
			{
				20505,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"hp_max_per",
				21
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["506_7"] = {
		lev = 7,
		gid = 506,
		next_lev = 8,
		cards = {
			{
				20511,
				1
			},
			{
				20502,
				1
			},
			{
				20505,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"hp_max_per",
				25
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["506_8"] = {
		lev = 8,
		gid = 506,
		next_lev = 9999,
		cards = {
			{
				20511,
				1
			},
			{
				20502,
				1
			},
			{
				20505,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"hp_max_per",
				30
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["507_1"] = {
		lev = 1,
		gid = 507,
		next_lev = 2,
		cards = {
			{
				20504,
				1
			},
			{
				50503,
				1
			}
		},
		materials = {},
		effect = {
			{
				"hp_max_per",
				3
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["507_2"] = {
		lev = 2,
		gid = 507,
		next_lev = 3,
		cards = {
			{
				20504,
				1
			},
			{
				50503,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"hp_max_per",
				6
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["507_3"] = {
		lev = 3,
		gid = 507,
		next_lev = 4,
		cards = {
			{
				20504,
				1
			},
			{
				50503,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"hp_max_per",
				9
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["507_4"] = {
		lev = 4,
		gid = 507,
		next_lev = 5,
		cards = {
			{
				20504,
				1
			},
			{
				50503,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"hp_max_per",
				13
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["507_5"] = {
		lev = 5,
		gid = 507,
		next_lev = 6,
		cards = {
			{
				20504,
				1
			},
			{
				50503,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"hp_max_per",
				17
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["507_6"] = {
		lev = 6,
		gid = 507,
		next_lev = 7,
		cards = {
			{
				20504,
				1
			},
			{
				50503,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"hp_max_per",
				21
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["507_7"] = {
		lev = 7,
		gid = 507,
		next_lev = 8,
		cards = {
			{
				20504,
				1
			},
			{
				50503,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"hp_max_per",
				25
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["507_8"] = {
		lev = 8,
		gid = 507,
		next_lev = 9999,
		cards = {
			{
				20504,
				1
			},
			{
				50503,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"hp_max_per",
				30
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["508_1"] = {
		lev = 1,
		gid = 508,
		next_lev = 2,
		cards = {
			{
				10502,
				1
			},
			{
				50502,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk_per",
				3
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["508_2"] = {
		lev = 2,
		gid = 508,
		next_lev = 3,
		cards = {
			{
				10502,
				1
			},
			{
				50502,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk_per",
				6
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["508_3"] = {
		lev = 3,
		gid = 508,
		next_lev = 4,
		cards = {
			{
				10502,
				1
			},
			{
				50502,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk_per",
				9
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["508_4"] = {
		lev = 4,
		gid = 508,
		next_lev = 5,
		cards = {
			{
				10502,
				1
			},
			{
				50502,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"atk_per",
				13
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["508_5"] = {
		lev = 5,
		gid = 508,
		next_lev = 6,
		cards = {
			{
				10502,
				1
			},
			{
				50502,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"atk_per",
				17
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["508_6"] = {
		lev = 6,
		gid = 508,
		next_lev = 7,
		cards = {
			{
				10502,
				1
			},
			{
				50502,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"atk_per",
				21
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["508_7"] = {
		lev = 7,
		gid = 508,
		next_lev = 8,
		cards = {
			{
				10502,
				1
			},
			{
				50502,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"atk_per",
				25
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["508_8"] = {
		lev = 8,
		gid = 508,
		next_lev = 9999,
		cards = {
			{
				10502,
				1
			},
			{
				50502,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"atk_per",
				30
			},
			{
				"hp_max_per",
				3
			}
		}
	},
	["509_1"] = {
		lev = 1,
		gid = 509,
		next_lev = 2,
		cards = {
			{
				40510,
				1
			},
			{
				30508,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk_per",
				3
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_rate",
				3
			}
		}
	},
	["509_2"] = {
		lev = 2,
		gid = 509,
		next_lev = 3,
		cards = {
			{
				40510,
				1
			},
			{
				30508,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk_per",
				6
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_rate",
				3
			}
		}
	},
	["509_3"] = {
		lev = 3,
		gid = 509,
		next_lev = 4,
		cards = {
			{
				40510,
				1
			},
			{
				30508,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk_per",
				9
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_rate",
				3
			}
		}
	},
	["509_4"] = {
		lev = 4,
		gid = 509,
		next_lev = 5,
		cards = {
			{
				40510,
				1
			},
			{
				30508,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"atk_per",
				13
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_rate",
				3
			}
		}
	},
	["509_5"] = {
		lev = 5,
		gid = 509,
		next_lev = 6,
		cards = {
			{
				40510,
				1
			},
			{
				30508,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"atk_per",
				17
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_rate",
				3
			}
		}
	},
	["509_6"] = {
		lev = 6,
		gid = 509,
		next_lev = 7,
		cards = {
			{
				40510,
				1
			},
			{
				30508,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"atk_per",
				21
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_rate",
				3
			}
		}
	},
	["509_7"] = {
		lev = 7,
		gid = 509,
		next_lev = 8,
		cards = {
			{
				40510,
				1
			},
			{
				30508,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"atk_per",
				25
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_rate",
				3
			}
		}
	},
	["509_8"] = {
		lev = 8,
		gid = 509,
		next_lev = 9999,
		cards = {
			{
				40510,
				1
			},
			{
				30508,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"atk_per",
				30
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_rate",
				3
			}
		}
	},
	["510_1"] = {
		lev = 1,
		gid = 510,
		next_lev = 2,
		cards = {
			{
				10507,
				1
			},
			{
				10503,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk_per",
				3
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["510_2"] = {
		lev = 2,
		gid = 510,
		next_lev = 3,
		cards = {
			{
				10507,
				1
			},
			{
				10503,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk_per",
				6
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["510_3"] = {
		lev = 3,
		gid = 510,
		next_lev = 4,
		cards = {
			{
				10507,
				1
			},
			{
				10503,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk_per",
				9
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["510_4"] = {
		lev = 4,
		gid = 510,
		next_lev = 5,
		cards = {
			{
				10507,
				1
			},
			{
				10503,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"atk_per",
				13
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["510_5"] = {
		lev = 5,
		gid = 510,
		next_lev = 6,
		cards = {
			{
				10507,
				1
			},
			{
				10503,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"atk_per",
				17
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["510_6"] = {
		lev = 6,
		gid = 510,
		next_lev = 7,
		cards = {
			{
				10507,
				1
			},
			{
				10503,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"atk_per",
				21
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["510_7"] = {
		lev = 7,
		gid = 510,
		next_lev = 8,
		cards = {
			{
				10507,
				1
			},
			{
				10503,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"atk_per",
				25
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["510_8"] = {
		lev = 8,
		gid = 510,
		next_lev = 9999,
		cards = {
			{
				10507,
				1
			},
			{
				10503,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"atk_per",
				30
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["511_1"] = {
		lev = 1,
		gid = 511,
		next_lev = 2,
		cards = {
			{
				20508,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {},
		effect = {
			{
				"hp_max_per",
				3
			},
			{
				"dodge_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["511_2"] = {
		lev = 2,
		gid = 511,
		next_lev = 3,
		cards = {
			{
				20508,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"hp_max_per",
				6
			},
			{
				"dodge_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["511_3"] = {
		lev = 3,
		gid = 511,
		next_lev = 4,
		cards = {
			{
				20508,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"hp_max_per",
				9
			},
			{
				"dodge_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["511_4"] = {
		lev = 4,
		gid = 511,
		next_lev = 5,
		cards = {
			{
				20508,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"hp_max_per",
				13
			},
			{
				"dodge_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["511_5"] = {
		lev = 5,
		gid = 511,
		next_lev = 6,
		cards = {
			{
				20508,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"hp_max_per",
				17
			},
			{
				"dodge_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["511_6"] = {
		lev = 6,
		gid = 511,
		next_lev = 7,
		cards = {
			{
				20508,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"hp_max_per",
				21
			},
			{
				"dodge_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["511_7"] = {
		lev = 7,
		gid = 511,
		next_lev = 8,
		cards = {
			{
				20508,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"hp_max_per",
				25
			},
			{
				"dodge_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["511_8"] = {
		lev = 8,
		gid = 511,
		next_lev = 9999,
		cards = {
			{
				20508,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"hp_max_per",
				30
			},
			{
				"dodge_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["512_1"] = {
		lev = 1,
		gid = 512,
		next_lev = 2,
		cards = {
			{
				20511,
				1
			},
			{
				50506,
				1
			},
			{
				10504,
				1
			}
		},
		materials = {},
		effect = {
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["512_2"] = {
		lev = 2,
		gid = 512,
		next_lev = 3,
		cards = {
			{
				20511,
				1
			},
			{
				50506,
				1
			},
			{
				10504,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"hp_max_per",
				6
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["512_3"] = {
		lev = 3,
		gid = 512,
		next_lev = 4,
		cards = {
			{
				20511,
				1
			},
			{
				50506,
				1
			},
			{
				10504,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"hp_max_per",
				9
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["512_4"] = {
		lev = 4,
		gid = 512,
		next_lev = 5,
		cards = {
			{
				20511,
				1
			},
			{
				50506,
				1
			},
			{
				10504,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"hp_max_per",
				13
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["512_5"] = {
		lev = 5,
		gid = 512,
		next_lev = 6,
		cards = {
			{
				20511,
				1
			},
			{
				50506,
				1
			},
			{
				10504,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"hp_max_per",
				17
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["512_6"] = {
		lev = 6,
		gid = 512,
		next_lev = 7,
		cards = {
			{
				20511,
				1
			},
			{
				50506,
				1
			},
			{
				10504,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"hp_max_per",
				21
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["512_7"] = {
		lev = 7,
		gid = 512,
		next_lev = 8,
		cards = {
			{
				20511,
				1
			},
			{
				50506,
				1
			},
			{
				10504,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"hp_max_per",
				25
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["512_8"] = {
		lev = 8,
		gid = 512,
		next_lev = 9999,
		cards = {
			{
				20511,
				1
			},
			{
				50506,
				1
			},
			{
				10504,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"hp_max_per",
				30
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			}
		}
	},
	["513_1"] = {
		lev = 1,
		gid = 513,
		next_lev = 2,
		cards = {
			{
				40508,
				1
			},
			{
				50504,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk_per",
				3
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["513_2"] = {
		lev = 2,
		gid = 513,
		next_lev = 3,
		cards = {
			{
				40508,
				1
			},
			{
				50504,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk_per",
				6
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["513_3"] = {
		lev = 3,
		gid = 513,
		next_lev = 4,
		cards = {
			{
				40508,
				1
			},
			{
				50504,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk_per",
				9
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["513_4"] = {
		lev = 4,
		gid = 513,
		next_lev = 5,
		cards = {
			{
				40508,
				1
			},
			{
				50504,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"atk_per",
				13
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["513_5"] = {
		lev = 5,
		gid = 513,
		next_lev = 6,
		cards = {
			{
				40508,
				1
			},
			{
				50504,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"atk_per",
				17
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["513_6"] = {
		lev = 6,
		gid = 513,
		next_lev = 7,
		cards = {
			{
				40508,
				1
			},
			{
				50504,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"atk_per",
				21
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["513_7"] = {
		lev = 7,
		gid = 513,
		next_lev = 8,
		cards = {
			{
				40508,
				1
			},
			{
				50504,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"atk_per",
				25
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["513_8"] = {
		lev = 8,
		gid = 513,
		next_lev = 9999,
		cards = {
			{
				40508,
				1
			},
			{
				50504,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"atk_per",
				30
			},
			{
				"hp_max_per",
				3
			},
			{
				"tenacity",
				3
			}
		}
	},
	["514_1"] = {
		lev = 1,
		gid = 514,
		next_lev = 2,
		cards = {
			{
				40404,
				1
			},
			{
				30506,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk_per",
				3
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["514_2"] = {
		lev = 2,
		gid = 514,
		next_lev = 3,
		cards = {
			{
				40404,
				1
			},
			{
				30506,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk_per",
				6
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["514_3"] = {
		lev = 3,
		gid = 514,
		next_lev = 4,
		cards = {
			{
				40404,
				1
			},
			{
				30506,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk_per",
				9
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["514_4"] = {
		lev = 4,
		gid = 514,
		next_lev = 5,
		cards = {
			{
				40404,
				1
			},
			{
				30506,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"atk_per",
				13
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["514_5"] = {
		lev = 5,
		gid = 514,
		next_lev = 6,
		cards = {
			{
				40404,
				1
			},
			{
				30506,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"atk_per",
				17
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["514_6"] = {
		lev = 6,
		gid = 514,
		next_lev = 7,
		cards = {
			{
				40404,
				1
			},
			{
				30506,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"atk_per",
				21
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["514_7"] = {
		lev = 7,
		gid = 514,
		next_lev = 8,
		cards = {
			{
				40404,
				1
			},
			{
				30506,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"atk_per",
				25
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["514_8"] = {
		lev = 8,
		gid = 514,
		next_lev = 9999,
		cards = {
			{
				40404,
				1
			},
			{
				30506,
				1
			},
			{
				40509,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"atk_per",
				30
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["601_1"] = {
		lev = 1,
		gid = 601,
		next_lev = 2,
		cards = {
			{
				20511,
				1
			},
			{
				40501,
				1
			},
			{
				40504,
				1
			},
			{
				40505,
				1
			},
			{
				40507,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk_per",
				3
			},
			{
				"hp_max_per",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["601_2"] = {
		lev = 2,
		gid = 601,
		next_lev = 3,
		cards = {
			{
				20511,
				1
			},
			{
				40501,
				1
			},
			{
				40504,
				1
			},
			{
				40505,
				1
			},
			{
				40507,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk_per",
				6
			},
			{
				"hp_max_per",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["601_3"] = {
		lev = 3,
		gid = 601,
		next_lev = 4,
		cards = {
			{
				20511,
				1
			},
			{
				40501,
				1
			},
			{
				40504,
				1
			},
			{
				40505,
				1
			},
			{
				40507,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk_per",
				9
			},
			{
				"hp_max_per",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["601_4"] = {
		lev = 4,
		gid = 601,
		next_lev = 5,
		cards = {
			{
				20511,
				1
			},
			{
				40501,
				1
			},
			{
				40504,
				1
			},
			{
				40505,
				1
			},
			{
				40507,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"atk_per",
				13
			},
			{
				"hp_max_per",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["601_5"] = {
		lev = 5,
		gid = 601,
		next_lev = 6,
		cards = {
			{
				20511,
				1
			},
			{
				40501,
				1
			},
			{
				40504,
				1
			},
			{
				40505,
				1
			},
			{
				40507,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"atk_per",
				17
			},
			{
				"hp_max_per",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["601_6"] = {
		lev = 6,
		gid = 601,
		next_lev = 7,
		cards = {
			{
				20511,
				1
			},
			{
				40501,
				1
			},
			{
				40504,
				1
			},
			{
				40505,
				1
			},
			{
				40507,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"atk_per",
				21
			},
			{
				"hp_max_per",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["601_7"] = {
		lev = 7,
		gid = 601,
		next_lev = 8,
		cards = {
			{
				20511,
				1
			},
			{
				40501,
				1
			},
			{
				40504,
				1
			},
			{
				40505,
				1
			},
			{
				40507,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"atk_per",
				25
			},
			{
				"hp_max_per",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["601_8"] = {
		lev = 8,
		gid = 601,
		next_lev = 9,
		cards = {
			{
				20511,
				1
			},
			{
				40501,
				1
			},
			{
				40504,
				1
			},
			{
				40505,
				1
			},
			{
				40507,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"atk_per",
				30
			},
			{
				"hp_max_per",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["601_9"] = {
		lev = 9,
		gid = 601,
		next_lev = 10,
		cards = {
			{
				20511,
				1
			},
			{
				40501,
				1
			},
			{
				40504,
				1
			},
			{
				40505,
				1
			},
			{
				40507,
				1
			}
		},
		materials = {
			{
				10051,
				16
			},
			{
				10052,
				64
			}
		},
		effect = {
			{
				"atk_per",
				35
			},
			{
				"hp_max_per",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["601_10"] = {
		lev = 10,
		gid = 601,
		next_lev = 9999,
		cards = {
			{
				20511,
				1
			},
			{
				40501,
				1
			},
			{
				40504,
				1
			},
			{
				40505,
				1
			},
			{
				40507,
				1
			}
		},
		materials = {
			{
				10051,
				18
			},
			{
				10052,
				72
			}
		},
		effect = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["602_1"] = {
		lev = 1,
		gid = 602,
		next_lev = 2,
		cards = {
			{
				40510,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk_per",
				3
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["602_2"] = {
		lev = 2,
		gid = 602,
		next_lev = 3,
		cards = {
			{
				40510,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk_per",
				6
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["602_3"] = {
		lev = 3,
		gid = 602,
		next_lev = 4,
		cards = {
			{
				40510,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk_per",
				9
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["602_4"] = {
		lev = 4,
		gid = 602,
		next_lev = 5,
		cards = {
			{
				40510,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"atk_per",
				13
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["602_5"] = {
		lev = 5,
		gid = 602,
		next_lev = 6,
		cards = {
			{
				40510,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"atk_per",
				17
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["602_6"] = {
		lev = 6,
		gid = 602,
		next_lev = 7,
		cards = {
			{
				40510,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"atk_per",
				21
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["602_7"] = {
		lev = 7,
		gid = 602,
		next_lev = 8,
		cards = {
			{
				40510,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"atk_per",
				25
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["602_8"] = {
		lev = 8,
		gid = 602,
		next_lev = 9,
		cards = {
			{
				40510,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"atk_per",
				30
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["602_9"] = {
		lev = 9,
		gid = 602,
		next_lev = 10,
		cards = {
			{
				40510,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			}
		},
		materials = {
			{
				10051,
				16
			},
			{
				10052,
				64
			}
		},
		effect = {
			{
				"atk_per",
				35
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["602_10"] = {
		lev = 10,
		gid = 602,
		next_lev = 9999,
		cards = {
			{
				40510,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			}
		},
		materials = {
			{
				10051,
				18
			},
			{
				10052,
				72
			}
		},
		effect = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				3
			},
			{
				"crit_ratio",
				3
			}
		}
	},
	["603_1"] = {
		lev = 1,
		gid = 603,
		next_lev = 2,
		cards = {
			{
				30510,
				1
			},
			{
				10501,
				1
			},
			{
				10512,
				1
			},
			{
				10505,
				1
			}
		},
		materials = {},
		effect = {
			{
				"crit_rate",
				3
			},
			{
				"tenacity",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["603_2"] = {
		lev = 2,
		gid = 603,
		next_lev = 3,
		cards = {
			{
				30510,
				1
			},
			{
				10501,
				1
			},
			{
				10512,
				1
			},
			{
				10505,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"crit_rate",
				6
			},
			{
				"tenacity",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["603_3"] = {
		lev = 3,
		gid = 603,
		next_lev = 4,
		cards = {
			{
				30510,
				1
			},
			{
				10501,
				1
			},
			{
				10512,
				1
			},
			{
				10505,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"crit_rate",
				9
			},
			{
				"tenacity",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["603_4"] = {
		lev = 4,
		gid = 603,
		next_lev = 5,
		cards = {
			{
				30510,
				1
			},
			{
				10501,
				1
			},
			{
				10512,
				1
			},
			{
				10505,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"crit_rate",
				13
			},
			{
				"tenacity",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["603_5"] = {
		lev = 5,
		gid = 603,
		next_lev = 6,
		cards = {
			{
				30510,
				1
			},
			{
				10501,
				1
			},
			{
				10512,
				1
			},
			{
				10505,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"crit_rate",
				17
			},
			{
				"tenacity",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["603_6"] = {
		lev = 6,
		gid = 603,
		next_lev = 7,
		cards = {
			{
				30510,
				1
			},
			{
				10501,
				1
			},
			{
				10512,
				1
			},
			{
				10505,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"crit_rate",
				21
			},
			{
				"tenacity",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["603_7"] = {
		lev = 7,
		gid = 603,
		next_lev = 8,
		cards = {
			{
				30510,
				1
			},
			{
				10501,
				1
			},
			{
				10512,
				1
			},
			{
				10505,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"crit_rate",
				25
			},
			{
				"tenacity",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["603_8"] = {
		lev = 8,
		gid = 603,
		next_lev = 9,
		cards = {
			{
				30510,
				1
			},
			{
				10501,
				1
			},
			{
				10512,
				1
			},
			{
				10505,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"crit_rate",
				30
			},
			{
				"tenacity",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["603_9"] = {
		lev = 9,
		gid = 603,
		next_lev = 10,
		cards = {
			{
				30510,
				1
			},
			{
				10501,
				1
			},
			{
				10512,
				1
			},
			{
				10505,
				1
			}
		},
		materials = {
			{
				10051,
				16
			},
			{
				10052,
				64
			}
		},
		effect = {
			{
				"crit_rate",
				35
			},
			{
				"tenacity",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["603_10"] = {
		lev = 10,
		gid = 603,
		next_lev = 9999,
		cards = {
			{
				30510,
				1
			},
			{
				10501,
				1
			},
			{
				10512,
				1
			},
			{
				10505,
				1
			}
		},
		materials = {
			{
				10051,
				18
			},
			{
				10052,
				72
			}
		},
		effect = {
			{
				"crit_rate",
				40
			},
			{
				"tenacity",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["604_1"] = {
		lev = 1,
		gid = 604,
		next_lev = 2,
		cards = {
			{
				20501,
				1
			},
			{
				20508,
				1
			},
			{
				30503,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {},
		effect = {
			{
				"speed",
				1
			},
			{
				"crit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["604_2"] = {
		lev = 2,
		gid = 604,
		next_lev = 3,
		cards = {
			{
				20501,
				1
			},
			{
				20508,
				1
			},
			{
				30503,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"speed",
				2
			},
			{
				"crit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["604_3"] = {
		lev = 3,
		gid = 604,
		next_lev = 4,
		cards = {
			{
				20501,
				1
			},
			{
				20508,
				1
			},
			{
				30503,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"speed",
				3
			},
			{
				"crit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["604_4"] = {
		lev = 4,
		gid = 604,
		next_lev = 5,
		cards = {
			{
				20501,
				1
			},
			{
				20508,
				1
			},
			{
				30503,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"speed",
				4
			},
			{
				"crit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["604_5"] = {
		lev = 5,
		gid = 604,
		next_lev = 6,
		cards = {
			{
				20501,
				1
			},
			{
				20508,
				1
			},
			{
				30503,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"speed",
				5
			},
			{
				"crit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["604_6"] = {
		lev = 6,
		gid = 604,
		next_lev = 7,
		cards = {
			{
				20501,
				1
			},
			{
				20508,
				1
			},
			{
				30503,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"speed",
				6
			},
			{
				"crit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["604_7"] = {
		lev = 7,
		gid = 604,
		next_lev = 8,
		cards = {
			{
				20501,
				1
			},
			{
				20508,
				1
			},
			{
				30503,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"speed",
				7
			},
			{
				"crit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["604_8"] = {
		lev = 8,
		gid = 604,
		next_lev = 9,
		cards = {
			{
				20501,
				1
			},
			{
				20508,
				1
			},
			{
				30503,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"speed",
				8
			},
			{
				"crit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["604_9"] = {
		lev = 9,
		gid = 604,
		next_lev = 10,
		cards = {
			{
				20501,
				1
			},
			{
				20508,
				1
			},
			{
				30503,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				16
			},
			{
				10052,
				64
			}
		},
		effect = {
			{
				"speed",
				9
			},
			{
				"crit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["604_10"] = {
		lev = 10,
		gid = 604,
		next_lev = 9999,
		cards = {
			{
				20501,
				1
			},
			{
				20508,
				1
			},
			{
				30503,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				18
			},
			{
				10052,
				72
			}
		},
		effect = {
			{
				"speed",
				10
			},
			{
				"crit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["605_1"] = {
		lev = 1,
		gid = 605,
		next_lev = 2,
		cards = {
			{
				40509,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			},
			{
				40508,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk_per",
				3
			},
			{
				"crit_rate",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["605_2"] = {
		lev = 2,
		gid = 605,
		next_lev = 3,
		cards = {
			{
				40509,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			},
			{
				40508,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk_per",
				6
			},
			{
				"crit_rate",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["605_3"] = {
		lev = 3,
		gid = 605,
		next_lev = 4,
		cards = {
			{
				40509,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			},
			{
				40508,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk_per",
				9
			},
			{
				"crit_rate",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["605_4"] = {
		lev = 4,
		gid = 605,
		next_lev = 5,
		cards = {
			{
				40509,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			},
			{
				40508,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"atk_per",
				13
			},
			{
				"crit_rate",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["605_5"] = {
		lev = 5,
		gid = 605,
		next_lev = 6,
		cards = {
			{
				40509,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			},
			{
				40508,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"atk_per",
				17
			},
			{
				"crit_rate",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["605_6"] = {
		lev = 6,
		gid = 605,
		next_lev = 7,
		cards = {
			{
				40509,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			},
			{
				40508,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"atk_per",
				21
			},
			{
				"crit_rate",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["605_7"] = {
		lev = 7,
		gid = 605,
		next_lev = 8,
		cards = {
			{
				40509,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			},
			{
				40508,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"atk_per",
				25
			},
			{
				"crit_rate",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["605_8"] = {
		lev = 8,
		gid = 605,
		next_lev = 9,
		cards = {
			{
				40509,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			},
			{
				40508,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"atk_per",
				30
			},
			{
				"crit_rate",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["605_9"] = {
		lev = 9,
		gid = 605,
		next_lev = 10,
		cards = {
			{
				40509,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			},
			{
				40508,
				1
			}
		},
		materials = {
			{
				10051,
				16
			},
			{
				10052,
				64
			}
		},
		effect = {
			{
				"atk_per",
				35
			},
			{
				"crit_rate",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["605_10"] = {
		lev = 10,
		gid = 605,
		next_lev = 9999,
		cards = {
			{
				40509,
				1
			},
			{
				40506,
				1
			},
			{
				40503,
				1
			},
			{
				40508,
				1
			}
		},
		materials = {
			{
				10051,
				18
			},
			{
				10052,
				72
			}
		},
		effect = {
			{
				"atk_per",
				40
			},
			{
				"crit_rate",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["606_1"] = {
		lev = 1,
		gid = 606,
		next_lev = 2,
		cards = {
			{
				50504,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {},
		effect = {
			{
				"hp_max_per",
				3
			},
			{
				"speed",
				1
			},
			{
				"tenacity",
				3
			}
		}
	},
	["606_2"] = {
		lev = 2,
		gid = 606,
		next_lev = 3,
		cards = {
			{
				50504,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"hp_max_per",
				6
			},
			{
				"speed",
				1
			},
			{
				"tenacity",
				3
			}
		}
	},
	["606_3"] = {
		lev = 3,
		gid = 606,
		next_lev = 4,
		cards = {
			{
				50504,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"hp_max_per",
				9
			},
			{
				"speed",
				1
			},
			{
				"tenacity",
				3
			}
		}
	},
	["606_4"] = {
		lev = 4,
		gid = 606,
		next_lev = 5,
		cards = {
			{
				50504,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"hp_max_per",
				13
			},
			{
				"speed",
				1
			},
			{
				"tenacity",
				3
			}
		}
	},
	["606_5"] = {
		lev = 5,
		gid = 606,
		next_lev = 6,
		cards = {
			{
				50504,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"hp_max_per",
				17
			},
			{
				"speed",
				1
			},
			{
				"tenacity",
				3
			}
		}
	},
	["606_6"] = {
		lev = 6,
		gid = 606,
		next_lev = 7,
		cards = {
			{
				50504,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"hp_max_per",
				21
			},
			{
				"speed",
				1
			},
			{
				"tenacity",
				3
			}
		}
	},
	["606_7"] = {
		lev = 7,
		gid = 606,
		next_lev = 8,
		cards = {
			{
				50504,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"hp_max_per",
				25
			},
			{
				"speed",
				1
			},
			{
				"tenacity",
				3
			}
		}
	},
	["606_8"] = {
		lev = 8,
		gid = 606,
		next_lev = 9,
		cards = {
			{
				50504,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"hp_max_per",
				30
			},
			{
				"speed",
				1
			},
			{
				"tenacity",
				3
			}
		}
	},
	["606_9"] = {
		lev = 9,
		gid = 606,
		next_lev = 10,
		cards = {
			{
				50504,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				16
			},
			{
				10052,
				64
			}
		},
		effect = {
			{
				"hp_max_per",
				35
			},
			{
				"speed",
				1
			},
			{
				"tenacity",
				3
			}
		}
	},
	["606_10"] = {
		lev = 10,
		gid = 606,
		next_lev = 9999,
		cards = {
			{
				50504,
				1
			},
			{
				50509,
				1
			}
		},
		materials = {
			{
				10051,
				18
			},
			{
				10052,
				72
			}
		},
		effect = {
			{
				"hp_max_per",
				40
			},
			{
				"speed",
				1
			},
			{
				"tenacity",
				3
			}
		}
	},
	["607_1"] = {
		lev = 1,
		gid = 607,
		next_lev = 2,
		cards = {
			{
				30508,
				1
			},
			{
				20509,
				1
			},
			{
				30507,
				1
			},
			{
				30502,
				1
			}
		},
		materials = {},
		effect = {
			{
				"hp_max_per",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["607_2"] = {
		lev = 2,
		gid = 607,
		next_lev = 3,
		cards = {
			{
				30508,
				1
			},
			{
				20509,
				1
			},
			{
				30507,
				1
			},
			{
				30502,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"hp_max_per",
				6
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["607_3"] = {
		lev = 3,
		gid = 607,
		next_lev = 4,
		cards = {
			{
				30508,
				1
			},
			{
				20509,
				1
			},
			{
				30507,
				1
			},
			{
				30502,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"hp_max_per",
				9
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["607_4"] = {
		lev = 4,
		gid = 607,
		next_lev = 5,
		cards = {
			{
				30508,
				1
			},
			{
				20509,
				1
			},
			{
				30507,
				1
			},
			{
				30502,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"hp_max_per",
				13
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["607_5"] = {
		lev = 5,
		gid = 607,
		next_lev = 6,
		cards = {
			{
				30508,
				1
			},
			{
				20509,
				1
			},
			{
				30507,
				1
			},
			{
				30502,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"hp_max_per",
				17
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["607_6"] = {
		lev = 6,
		gid = 607,
		next_lev = 7,
		cards = {
			{
				30508,
				1
			},
			{
				20509,
				1
			},
			{
				30507,
				1
			},
			{
				30502,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"hp_max_per",
				21
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["607_7"] = {
		lev = 7,
		gid = 607,
		next_lev = 8,
		cards = {
			{
				30508,
				1
			},
			{
				20509,
				1
			},
			{
				30507,
				1
			},
			{
				30502,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"hp_max_per",
				25
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["607_8"] = {
		lev = 8,
		gid = 607,
		next_lev = 9,
		cards = {
			{
				30508,
				1
			},
			{
				20509,
				1
			},
			{
				30507,
				1
			},
			{
				30502,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"hp_max_per",
				30
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["607_9"] = {
		lev = 9,
		gid = 607,
		next_lev = 10,
		cards = {
			{
				30508,
				1
			},
			{
				20509,
				1
			},
			{
				30507,
				1
			},
			{
				30502,
				1
			}
		},
		materials = {
			{
				10051,
				16
			},
			{
				10052,
				64
			}
		},
		effect = {
			{
				"hp_max_per",
				35
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["607_10"] = {
		lev = 10,
		gid = 607,
		next_lev = 9999,
		cards = {
			{
				30508,
				1
			},
			{
				20509,
				1
			},
			{
				30507,
				1
			},
			{
				30502,
				1
			}
		},
		materials = {
			{
				10051,
				18
			},
			{
				10052,
				72
			}
		},
		effect = {
			{
				"hp_max_per",
				40
			},
			{
				"hit_rate",
				3
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["608_1"] = {
		lev = 1,
		gid = 608,
		next_lev = 2,
		cards = {
			{
				20510,
				1
			},
			{
				20503,
				1
			},
			{
				30509,
				1
			},
			{
				20508,
				1
			}
		},
		materials = {},
		effect = {
			{
				"atk_per",
				3
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["608_2"] = {
		lev = 2,
		gid = 608,
		next_lev = 3,
		cards = {
			{
				20510,
				1
			},
			{
				20503,
				1
			},
			{
				30509,
				1
			},
			{
				20508,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"atk_per",
				6
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["608_3"] = {
		lev = 3,
		gid = 608,
		next_lev = 4,
		cards = {
			{
				20510,
				1
			},
			{
				20503,
				1
			},
			{
				30509,
				1
			},
			{
				20508,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"atk_per",
				9
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["608_4"] = {
		lev = 4,
		gid = 608,
		next_lev = 5,
		cards = {
			{
				20510,
				1
			},
			{
				20503,
				1
			},
			{
				30509,
				1
			},
			{
				20508,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"atk_per",
				13
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["608_5"] = {
		lev = 5,
		gid = 608,
		next_lev = 6,
		cards = {
			{
				20510,
				1
			},
			{
				20503,
				1
			},
			{
				30509,
				1
			},
			{
				20508,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"atk_per",
				17
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["608_6"] = {
		lev = 6,
		gid = 608,
		next_lev = 7,
		cards = {
			{
				20510,
				1
			},
			{
				20503,
				1
			},
			{
				30509,
				1
			},
			{
				20508,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"atk_per",
				21
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["608_7"] = {
		lev = 7,
		gid = 608,
		next_lev = 8,
		cards = {
			{
				20510,
				1
			},
			{
				20503,
				1
			},
			{
				30509,
				1
			},
			{
				20508,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"atk_per",
				25
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["608_8"] = {
		lev = 8,
		gid = 608,
		next_lev = 9,
		cards = {
			{
				20510,
				1
			},
			{
				20503,
				1
			},
			{
				30509,
				1
			},
			{
				20508,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"atk_per",
				30
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["608_9"] = {
		lev = 9,
		gid = 608,
		next_lev = 10,
		cards = {
			{
				20510,
				1
			},
			{
				20503,
				1
			},
			{
				30509,
				1
			},
			{
				20508,
				1
			}
		},
		materials = {
			{
				10051,
				16
			},
			{
				10052,
				64
			}
		},
		effect = {
			{
				"atk_per",
				35
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["608_10"] = {
		lev = 10,
		gid = 608,
		next_lev = 9999,
		cards = {
			{
				20510,
				1
			},
			{
				20503,
				1
			},
			{
				30509,
				1
			},
			{
				20508,
				1
			}
		},
		materials = {
			{
				10051,
				18
			},
			{
				10052,
				72
			}
		},
		effect = {
			{
				"atk_per",
				40
			},
			{
				"tenacity",
				3
			},
			{
				"hit_rate",
				3
			},
			{
				"hit_magic",
				3
			}
		}
	},
	["609_1"] = {
		lev = 1,
		gid = 609,
		next_lev = 2,
		cards = {
			{
				30405,
				1
			},
			{
				20507,
				1
			},
			{
				30501,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {},
		effect = {
			{
				"hp_max_per",
				3
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["609_2"] = {
		lev = 2,
		gid = 609,
		next_lev = 3,
		cards = {
			{
				30405,
				1
			},
			{
				20507,
				1
			},
			{
				30501,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"hp_max_per",
				6
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["609_3"] = {
		lev = 3,
		gid = 609,
		next_lev = 4,
		cards = {
			{
				30405,
				1
			},
			{
				20507,
				1
			},
			{
				30501,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"hp_max_per",
				9
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["609_4"] = {
		lev = 4,
		gid = 609,
		next_lev = 5,
		cards = {
			{
				30405,
				1
			},
			{
				20507,
				1
			},
			{
				30501,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"hp_max_per",
				13
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["609_5"] = {
		lev = 5,
		gid = 609,
		next_lev = 6,
		cards = {
			{
				30405,
				1
			},
			{
				20507,
				1
			},
			{
				30501,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"hp_max_per",
				17
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["609_6"] = {
		lev = 6,
		gid = 609,
		next_lev = 7,
		cards = {
			{
				30405,
				1
			},
			{
				20507,
				1
			},
			{
				30501,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"hp_max_per",
				21
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["609_7"] = {
		lev = 7,
		gid = 609,
		next_lev = 8,
		cards = {
			{
				30405,
				1
			},
			{
				20507,
				1
			},
			{
				30501,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"hp_max_per",
				25
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["609_8"] = {
		lev = 8,
		gid = 609,
		next_lev = 9,
		cards = {
			{
				30405,
				1
			},
			{
				20507,
				1
			},
			{
				30501,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"hp_max_per",
				30
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["609_9"] = {
		lev = 9,
		gid = 609,
		next_lev = 10,
		cards = {
			{
				30405,
				1
			},
			{
				20507,
				1
			},
			{
				30501,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				16
			},
			{
				10052,
				64
			}
		},
		effect = {
			{
				"hp_max_per",
				35
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["609_10"] = {
		lev = 10,
		gid = 609,
		next_lev = 9999,
		cards = {
			{
				30405,
				1
			},
			{
				20507,
				1
			},
			{
				30501,
				1
			},
			{
				30506,
				1
			}
		},
		materials = {
			{
				10051,
				18
			},
			{
				10052,
				72
			}
		},
		effect = {
			{
				"hp_max_per",
				40
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			}
		}
	},
	["610_1"] = {
		lev = 1,
		gid = 610,
		next_lev = 2,
		cards = {
			{
				30511,
				1
			},
			{
				30504,
				1
			},
			{
				30505,
				1
			},
			{
				30503,
				1
			}
		},
		materials = {},
		effect = {
			{
				"speed",
				1
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["610_2"] = {
		lev = 2,
		gid = 610,
		next_lev = 3,
		cards = {
			{
				30511,
				1
			},
			{
				30504,
				1
			},
			{
				30505,
				1
			},
			{
				30503,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"speed",
				2
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["610_3"] = {
		lev = 3,
		gid = 610,
		next_lev = 4,
		cards = {
			{
				30511,
				1
			},
			{
				30504,
				1
			},
			{
				30505,
				1
			},
			{
				30503,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"speed",
				3
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["610_4"] = {
		lev = 4,
		gid = 610,
		next_lev = 5,
		cards = {
			{
				30511,
				1
			},
			{
				30504,
				1
			},
			{
				30505,
				1
			},
			{
				30503,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"speed",
				4
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["610_5"] = {
		lev = 5,
		gid = 610,
		next_lev = 6,
		cards = {
			{
				30511,
				1
			},
			{
				30504,
				1
			},
			{
				30505,
				1
			},
			{
				30503,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"speed",
				5
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["610_6"] = {
		lev = 6,
		gid = 610,
		next_lev = 7,
		cards = {
			{
				30511,
				1
			},
			{
				30504,
				1
			},
			{
				30505,
				1
			},
			{
				30503,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"speed",
				6
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["610_7"] = {
		lev = 7,
		gid = 610,
		next_lev = 8,
		cards = {
			{
				30511,
				1
			},
			{
				30504,
				1
			},
			{
				30505,
				1
			},
			{
				30503,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"speed",
				7
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["610_8"] = {
		lev = 8,
		gid = 610,
		next_lev = 9,
		cards = {
			{
				30511,
				1
			},
			{
				30504,
				1
			},
			{
				30505,
				1
			},
			{
				30503,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"speed",
				8
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["610_9"] = {
		lev = 9,
		gid = 610,
		next_lev = 10,
		cards = {
			{
				30511,
				1
			},
			{
				30504,
				1
			},
			{
				30505,
				1
			},
			{
				30503,
				1
			}
		},
		materials = {
			{
				10051,
				16
			},
			{
				10052,
				64
			}
		},
		effect = {
			{
				"speed",
				9
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["610_10"] = {
		lev = 10,
		gid = 610,
		next_lev = 9999,
		cards = {
			{
				30511,
				1
			},
			{
				30504,
				1
			},
			{
				30505,
				1
			},
			{
				30503,
				1
			}
		},
		materials = {
			{
				10051,
				18
			},
			{
				10052,
				72
			}
		},
		effect = {
			{
				"speed",
				10
			},
			{
				"hit_magic",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["611_1"] = {
		lev = 1,
		gid = 611,
		next_lev = 2,
		cards = {
			{
				30508,
				1
			},
			{
				30510,
				1
			},
			{
				30507,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {},
		effect = {
			{
				"hp_max_per",
				3
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["611_2"] = {
		lev = 2,
		gid = 611,
		next_lev = 3,
		cards = {
			{
				30508,
				1
			},
			{
				30510,
				1
			},
			{
				30507,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				2
			},
			{
				10052,
				8
			}
		},
		effect = {
			{
				"hp_max_per",
				6
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["611_3"] = {
		lev = 3,
		gid = 611,
		next_lev = 4,
		cards = {
			{
				30508,
				1
			},
			{
				30510,
				1
			},
			{
				30507,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				4
			},
			{
				10052,
				16
			}
		},
		effect = {
			{
				"hp_max_per",
				9
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["611_4"] = {
		lev = 4,
		gid = 611,
		next_lev = 5,
		cards = {
			{
				30508,
				1
			},
			{
				30510,
				1
			},
			{
				30507,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				6
			},
			{
				10052,
				24
			}
		},
		effect = {
			{
				"hp_max_per",
				13
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["611_5"] = {
		lev = 5,
		gid = 611,
		next_lev = 6,
		cards = {
			{
				30508,
				1
			},
			{
				30510,
				1
			},
			{
				30507,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				8
			},
			{
				10052,
				32
			}
		},
		effect = {
			{
				"hp_max_per",
				17
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["611_6"] = {
		lev = 6,
		gid = 611,
		next_lev = 7,
		cards = {
			{
				30508,
				1
			},
			{
				30510,
				1
			},
			{
				30507,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				10
			},
			{
				10052,
				40
			}
		},
		effect = {
			{
				"hp_max_per",
				21
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["611_7"] = {
		lev = 7,
		gid = 611,
		next_lev = 8,
		cards = {
			{
				30508,
				1
			},
			{
				30510,
				1
			},
			{
				30507,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				12
			},
			{
				10052,
				48
			}
		},
		effect = {
			{
				"hp_max_per",
				25
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["611_8"] = {
		lev = 8,
		gid = 611,
		next_lev = 9,
		cards = {
			{
				30508,
				1
			},
			{
				30510,
				1
			},
			{
				30507,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				14
			},
			{
				10052,
				56
			}
		},
		effect = {
			{
				"hp_max_per",
				30
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["611_9"] = {
		lev = 9,
		gid = 611,
		next_lev = 10,
		cards = {
			{
				30508,
				1
			},
			{
				30510,
				1
			},
			{
				30507,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				16
			},
			{
				10052,
				64
			}
		},
		effect = {
			{
				"hp_max_per",
				35
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	},
	["611_10"] = {
		lev = 10,
		gid = 611,
		next_lev = 9999,
		cards = {
			{
				30508,
				1
			},
			{
				30510,
				1
			},
			{
				30507,
				1
			},
			{
				20501,
				1
			}
		},
		materials = {
			{
				10051,
				18
			},
			{
				10052,
				72
			}
		},
		effect = {
			{
				"hp_max_per",
				40
			},
			{
				"speed",
				1
			},
			{
				"dodge_rate",
				3
			},
			{
				"dodge_magic",
				3
			}
		}
	}
}

function Config.PartnerCatalogData.data_get_update_fun(slot0)
	slot1 = Config.PartnerCatalogData.data_get_update[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerCatalogData.data_get_update[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
