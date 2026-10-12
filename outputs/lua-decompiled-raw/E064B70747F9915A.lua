Config = Config or {}
Config.HolidayGrouponData = Config.HolidayGrouponData or {}
Config.HolidayGrouponData.data_const_length = 0
Config.HolidayGrouponData.data_const = {}

function Config.HolidayGrouponData.data_const_fun(slot0)
	slot1 = Config.HolidayGrouponData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayGrouponData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayGrouponData.data_holiday_reward_length = 56
Config.HolidayGrouponData.data_holiday_reward = {
	[51185] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51215] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51244] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51271] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51301] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51327] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51356] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51382] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51409] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51438] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51465] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51494] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51521] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51550] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51577] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51606] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51633] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51661] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51688] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51717] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51745] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51774] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51802] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51831] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51858] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51888] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51915] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51942] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51971] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[51998] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52025] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52055] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52083] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52110] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52139] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52166] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52193] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52222] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52249] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52276] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52303] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52330] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52359] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52386] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52413] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52440] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52469] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52497] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52524] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52551] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52578] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52608] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52635] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52663] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52690] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	},
	[52719] = {
		{
			gold = 16000,
			all_limit = 1,
			id = 1,
			limit = 0,
			reward = {
				{
					27902,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 16000,
			all_limit = 1,
			id = 2,
			limit = 0,
			reward = {
				{
					27905,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 3,
			limit = 0,
			reward = {
				{
					27909,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					20,
					750
				},
				{
					50,
					700
				},
				{
					80,
					600
				},
				{
					100,
					500
				}
			}
		},
		{
			gold = 12000,
			all_limit = 1,
			id = 4,
			limit = 0,
			reward = {
				{
					27910,
					50
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		},
		{
			gold = 2000,
			all_limit = 0,
			id = 5,
			limit = 5,
			reward = {
				{
					10450,
					2000
				}
			},
			discount = {
				{
					0,
					800
				},
				{
					50,
					750
				},
				{
					100,
					700
				},
				{
					150,
					600
				},
				{
					200,
					500
				}
			}
		}
	}
}
