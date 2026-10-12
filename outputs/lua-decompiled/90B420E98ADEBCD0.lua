Config = Config or {}
Config.HolidayConvertData = Config.HolidayConvertData or {}
Config.HolidayConvertData.data_const_length = 3
Config.HolidayConvertData.data_const = {
	item_id = {
		val = 37005,
		desc = "置换道具id"
	},
	game_rule = {
		val = 1,
		desc = [[
1、置换可以将<div fontcolor=289b14>7星以上</div>英雄转换为<div fontcolor=289b14>同阵营</div>其他英雄
2、选择1个7星以上英雄后再投入<div fontcolor=289b14>相同的</div>指定数量5星英雄，消耗一定的<div fontcolor=289b14>时光之力</div>，即可转换为指定目标英雄
3、无法升为10星以上的英雄，不能作为目标英雄或材料英雄参与十星以上的置换操作
4、参与作为置换材料的指定目标5星英雄，会返还培养材料及身上的装备、战技
5、置换后得到的7星以上目标英雄会<div fontcolor=289b14>继承</div>置换前原7星以上英雄的所有装备、战技、天赋、等级、进阶等
6、<div fontcolor=289b14>置换无法撤回，请谨慎操作</div>]]
	},
	jump_to = {
		val = 91035,
		desc = "暂无来源"
	}
}

function Config.HolidayConvertData.data_const_fun(slot0)
	slot1 = Config.HolidayConvertData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayConvertData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayConvertData.data_convert_info_length = 19
Config.HolidayConvertData.data_convert_info = {
	[7] = {
		{
			target_group = 1002,
			name = "七星海贼新星",
			src_group = 102,
			expend = 2,
			camp_type = 1,
			star = 7,
			loss = {
				{
					37005,
					4
				}
			}
		},
		{
			target_group = 2002,
			name = "七星草帽联盟",
			src_group = 202,
			expend = 2,
			camp_type = 2,
			star = 7,
			loss = {
				{
					37005,
					4
				}
			}
		},
		{
			target_group = 3002,
			name = "七星强者",
			src_group = 302,
			expend = 2,
			camp_type = 3,
			star = 7,
			loss = {
				{
					37005,
					4
				}
			}
		},
		{
			target_group = 4002,
			name = "七星海军",
			src_group = 402,
			expend = 2,
			camp_type = 4,
			star = 7,
			loss = {
				{
					37005,
					4
				}
			}
		},
		{
			target_group = 5002,
			name = "七星五皇团",
			src_group = 502,
			expend = 2,
			camp_type = 5,
			star = 7,
			loss = {
				{
					37005,
					4
				}
			}
		},
		[7] = {
			target_group = 7002,
			name = "七星传奇",
			src_group = 702,
			expend = 2,
			camp_type = 7,
			star = 7,
			loss = {
				{
					37005,
					4
				}
			}
		}
	},
	[8] = {
		{
			target_group = 1002,
			name = "八星海贼新星",
			src_group = 102,
			expend = 2,
			camp_type = 1,
			star = 8,
			loss = {
				{
					37005,
					4
				}
			}
		},
		{
			target_group = 2002,
			name = "八星草帽联盟",
			src_group = 202,
			expend = 2,
			camp_type = 2,
			star = 8,
			loss = {
				{
					37005,
					4
				}
			}
		},
		{
			target_group = 3002,
			name = "八星强者",
			src_group = 302,
			expend = 2,
			camp_type = 3,
			star = 8,
			loss = {
				{
					37005,
					4
				}
			}
		},
		{
			target_group = 4002,
			name = "八星海军",
			src_group = 402,
			expend = 2,
			camp_type = 4,
			star = 8,
			loss = {
				{
					37005,
					4
				}
			}
		},
		{
			target_group = 5002,
			name = "八星五皇团",
			src_group = 502,
			expend = 2,
			camp_type = 5,
			star = 8,
			loss = {
				{
					37005,
					4
				}
			}
		},
		[7] = {
			target_group = 7002,
			name = "八星传奇",
			src_group = 702,
			expend = 2,
			camp_type = 7,
			star = 8,
			loss = {
				{
					37005,
					4
				}
			}
		}
	},
	[9] = {
		{
			target_group = 1002,
			name = "九星海贼新星",
			src_group = 102,
			expend = 3,
			camp_type = 1,
			star = 9,
			loss = {
				{
					37005,
					6
				}
			}
		},
		{
			target_group = 2002,
			name = "九星草帽联盟",
			src_group = 202,
			expend = 3,
			camp_type = 2,
			star = 9,
			loss = {
				{
					37005,
					6
				}
			}
		},
		{
			target_group = 3002,
			name = "九星强者",
			src_group = 302,
			expend = 3,
			camp_type = 3,
			star = 9,
			loss = {
				{
					37005,
					6
				}
			}
		},
		{
			target_group = 4002,
			name = "九星海军",
			src_group = 402,
			expend = 3,
			camp_type = 4,
			star = 9,
			loss = {
				{
					37005,
					6
				}
			}
		},
		{
			target_group = 5002,
			name = "九星五皇团",
			src_group = 502,
			expend = 3,
			camp_type = 5,
			star = 9,
			loss = {
				{
					37005,
					6
				}
			}
		},
		[7] = {
			target_group = 7002,
			name = "九星传奇",
			src_group = 702,
			expend = 3,
			camp_type = 7,
			star = 9,
			loss = {
				{
					37005,
					6
				}
			}
		}
	},
	[10] = {
		{
			target_group = 1001,
			name = "十星海贼新星",
			src_group = 101,
			expend = 5,
			camp_type = 1,
			star = 10,
			loss = {
				{
					37005,
					10
				}
			}
		},
		{
			target_group = 2001,
			name = "十星草帽联盟",
			src_group = 201,
			expend = 5,
			camp_type = 2,
			star = 10,
			loss = {
				{
					37005,
					10
				}
			}
		},
		{
			target_group = 3001,
			name = "十星强者",
			src_group = 301,
			expend = 5,
			camp_type = 3,
			star = 10,
			loss = {
				{
					37005,
					10
				}
			}
		},
		{
			target_group = 4001,
			name = "十星海军",
			src_group = 401,
			expend = 5,
			camp_type = 4,
			star = 10,
			loss = {
				{
					37005,
					10
				}
			}
		},
		{
			target_group = 5001,
			name = "十星五皇团",
			src_group = 501,
			expend = 5,
			camp_type = 5,
			star = 10,
			loss = {
				{
					37005,
					10
				}
			}
		},
		[7] = {
			target_group = 7001,
			name = "十星传奇",
			src_group = 701,
			expend = 5,
			camp_type = 7,
			star = 10,
			loss = {
				{
					37005,
					10
				}
			}
		}
	},
	[11] = {
		{
			target_group = 1001,
			name = "十一星海贼新星",
			src_group = 101,
			expend = 7,
			camp_type = 1,
			star = 11,
			loss = {
				{
					37005,
					20
				}
			}
		},
		{
			target_group = 2001,
			name = "十一星草帽联盟",
			src_group = 201,
			expend = 7,
			camp_type = 2,
			star = 11,
			loss = {
				{
					37005,
					20
				}
			}
		},
		{
			target_group = 3001,
			name = "十一星强者",
			src_group = 301,
			expend = 7,
			camp_type = 3,
			star = 11,
			loss = {
				{
					37005,
					20
				}
			}
		},
		{
			target_group = 4001,
			name = "十一星海军",
			src_group = 401,
			expend = 7,
			camp_type = 4,
			star = 11,
			loss = {
				{
					37005,
					20
				}
			}
		},
		{
			target_group = 5001,
			name = "十一星五皇团",
			src_group = 501,
			expend = 7,
			camp_type = 5,
			star = 11,
			loss = {
				{
					37005,
					20
				}
			}
		},
		[7] = {
			target_group = 7001,
			name = "十一星传奇",
			src_group = 701,
			expend = 7,
			camp_type = 7,
			star = 11,
			loss = {
				{
					37005,
					20
				}
			}
		}
	},
	[12] = {
		{
			target_group = 1001,
			name = "十二星海贼新星",
			src_group = 101,
			expend = 9,
			camp_type = 1,
			star = 12,
			loss = {
				{
					37005,
					30
				}
			}
		},
		{
			target_group = 2001,
			name = "十二星草帽联盟",
			src_group = 201,
			expend = 9,
			camp_type = 2,
			star = 12,
			loss = {
				{
					37005,
					30
				}
			}
		},
		{
			target_group = 3001,
			name = "十二星强者",
			src_group = 301,
			expend = 9,
			camp_type = 3,
			star = 12,
			loss = {
				{
					37005,
					30
				}
			}
		},
		{
			target_group = 4001,
			name = "十二星海军",
			src_group = 401,
			expend = 9,
			camp_type = 4,
			star = 12,
			loss = {
				{
					37005,
					30
				}
			}
		},
		{
			target_group = 5001,
			name = "十二星五皇团",
			src_group = 501,
			expend = 9,
			camp_type = 5,
			star = 12,
			loss = {
				{
					37005,
					30
				}
			}
		},
		[7] = {
			target_group = 7001,
			name = "十二星传奇",
			src_group = 701,
			expend = 9,
			camp_type = 7,
			star = 12,
			loss = {
				{
					37005,
					30
				}
			}
		}
	},
	[13] = {
		{
			target_group = 1001,
			name = "十三星海贼新星",
			src_group = 101,
			expend = 11,
			camp_type = 1,
			star = 13,
			loss = {
				{
					37005,
					50
				}
			}
		},
		{
			target_group = 2001,
			name = "十三星草帽联盟",
			src_group = 201,
			expend = 11,
			camp_type = 2,
			star = 13,
			loss = {
				{
					37005,
					30
				}
			}
		},
		{
			target_group = 3001,
			name = "十三星强者",
			src_group = 301,
			expend = 11,
			camp_type = 3,
			star = 13,
			loss = {
				{
					37005,
					30
				}
			}
		},
		{
			target_group = 4001,
			name = "十三星海军",
			src_group = 401,
			expend = 11,
			camp_type = 4,
			star = 13,
			loss = {
				{
					37005,
					30
				}
			}
		},
		{
			target_group = 5001,
			name = "十三星五皇团",
			src_group = 501,
			expend = 11,
			camp_type = 5,
			star = 13,
			loss = {
				{
					37005,
					30
				}
			}
		},
		[7] = {
			target_group = 7001,
			name = "十三星传奇",
			src_group = 701,
			expend = 11,
			camp_type = 7,
			star = 13,
			loss = {
				{
					37005,
					30
				}
			}
		}
	},
	[14] = {
		{
			target_group = 1001,
			name = "十四星海贼新星",
			src_group = 101,
			expend = 13,
			camp_type = 1,
			star = 14,
			loss = {
				{
					37005,
					70
				}
			}
		},
		{
			target_group = 2001,
			name = "十四星草帽联盟",
			src_group = 201,
			expend = 13,
			camp_type = 2,
			star = 14,
			loss = {
				{
					37005,
					30
				}
			}
		},
		{
			target_group = 3001,
			name = "十四星强者",
			src_group = 301,
			expend = 13,
			camp_type = 3,
			star = 14,
			loss = {
				{
					37005,
					30
				}
			}
		},
		{
			target_group = 4001,
			name = "十四星海军",
			src_group = 401,
			expend = 13,
			camp_type = 4,
			star = 14,
			loss = {
				{
					37005,
					30
				}
			}
		},
		{
			target_group = 5001,
			name = "十四星五皇团",
			src_group = 501,
			expend = 13,
			camp_type = 5,
			star = 14,
			loss = {
				{
					37005,
					30
				}
			}
		},
		[7] = {
			target_group = 7001,
			name = "十四星传奇",
			src_group = 701,
			expend = 13,
			camp_type = 7,
			star = 14,
			loss = {
				{
					37005,
					30
				}
			}
		}
	},
	[15] = {
		{
			target_group = 1001,
			name = "十五星海贼新星",
			src_group = 101,
			expend = 15,
			camp_type = 1,
			star = 15,
			loss = {
				{
					37005,
					90
				}
			}
		},
		{
			target_group = 2001,
			name = "十五星草帽联盟",
			src_group = 201,
			expend = 15,
			camp_type = 2,
			star = 15,
			loss = {
				{
					37005,
					30
				}
			}
		},
		{
			target_group = 3001,
			name = "十五星强者",
			src_group = 301,
			expend = 15,
			camp_type = 3,
			star = 15,
			loss = {
				{
					37005,
					30
				}
			}
		},
		{
			target_group = 4001,
			name = "十五星海军",
			src_group = 401,
			expend = 15,
			camp_type = 4,
			star = 15,
			loss = {
				{
					37005,
					30
				}
			}
		},
		{
			target_group = 5001,
			name = "十五星五皇团",
			src_group = 501,
			expend = 15,
			camp_type = 5,
			star = 15,
			loss = {
				{
					37005,
					30
				}
			}
		},
		[7] = {
			target_group = 7001,
			name = "十五星传奇",
			src_group = 701,
			expend = 15,
			camp_type = 7,
			star = 15,
			loss = {
				{
					37005,
					30
				}
			}
		}
	},
	[16] = {
		{
			target_group = 1001,
			name = "十六星海贼新星",
			src_group = 101,
			expend = 16,
			camp_type = 1,
			star = 16,
			loss = {
				{
					37005,
					110
				}
			}
		},
		{
			target_group = 2001,
			name = "十六星草帽联盟",
			src_group = 201,
			expend = 16,
			camp_type = 2,
			star = 16,
			loss = {
				{
					37005,
					110
				}
			}
		},
		{
			target_group = 3001,
			name = "十六星强者",
			src_group = 301,
			expend = 16,
			camp_type = 3,
			star = 16,
			loss = {
				{
					37005,
					110
				}
			}
		},
		{
			target_group = 4001,
			name = "十六星海军",
			src_group = 401,
			expend = 16,
			camp_type = 4,
			star = 16,
			loss = {
				{
					37005,
					110
				}
			}
		},
		{
			target_group = 5001,
			name = "十六星五皇团",
			src_group = 501,
			expend = 16,
			camp_type = 5,
			star = 16,
			loss = {
				{
					37005,
					110
				}
			}
		},
		[7] = {
			target_group = 7001,
			name = "十六星传奇",
			src_group = 701,
			expend = 16,
			camp_type = 7,
			star = 16,
			loss = {
				{
					37005,
					110
				}
			}
		}
	},
	[17] = {
		{
			target_group = 1001,
			name = "十七星海贼新星",
			src_group = 101,
			expend = 17,
			camp_type = 1,
			star = 17,
			loss = {
				{
					37005,
					130
				}
			}
		},
		{
			target_group = 2001,
			name = "十七星草帽联盟",
			src_group = 201,
			expend = 17,
			camp_type = 2,
			star = 17,
			loss = {
				{
					37005,
					130
				}
			}
		},
		{
			target_group = 3001,
			name = "十七星强者",
			src_group = 301,
			expend = 17,
			camp_type = 3,
			star = 17,
			loss = {
				{
					37005,
					130
				}
			}
		},
		{
			target_group = 4001,
			name = "十七星海军",
			src_group = 401,
			expend = 17,
			camp_type = 4,
			star = 17,
			loss = {
				{
					37005,
					130
				}
			}
		},
		{
			target_group = 5001,
			name = "十七星五皇团",
			src_group = 501,
			expend = 17,
			camp_type = 5,
			star = 17,
			loss = {
				{
					37005,
					130
				}
			}
		},
		[7] = {
			target_group = 7001,
			name = "十七星传奇",
			src_group = 701,
			expend = 17,
			camp_type = 7,
			star = 17,
			loss = {
				{
					37005,
					130
				}
			}
		}
	},
	[18] = {
		{
			target_group = 1001,
			name = "十八星海贼新星",
			src_group = 101,
			expend = 18,
			camp_type = 1,
			star = 18,
			loss = {
				{
					37005,
					150
				}
			}
		},
		{
			target_group = 2001,
			name = "十八星草帽联盟",
			src_group = 201,
			expend = 18,
			camp_type = 2,
			star = 18,
			loss = {
				{
					37005,
					150
				}
			}
		},
		{
			target_group = 3001,
			name = "十八星强者",
			src_group = 301,
			expend = 18,
			camp_type = 3,
			star = 18,
			loss = {
				{
					37005,
					150
				}
			}
		},
		{
			target_group = 4001,
			name = "十八星海军",
			src_group = 401,
			expend = 18,
			camp_type = 4,
			star = 18,
			loss = {
				{
					37005,
					150
				}
			}
		},
		{
			target_group = 5001,
			name = "十八星五皇团",
			src_group = 501,
			expend = 18,
			camp_type = 5,
			star = 18,
			loss = {
				{
					37005,
					150
				}
			}
		},
		[7] = {
			target_group = 7001,
			name = "十八星传奇",
			src_group = 701,
			expend = 18,
			camp_type = 7,
			star = 18,
			loss = {
				{
					37005,
					150
				}
			}
		}
	},
	[19] = {
		{
			target_group = 1001,
			name = "十九星海贼新星",
			src_group = 101,
			expend = 19,
			camp_type = 1,
			star = 19,
			loss = {
				{
					37005,
					170
				}
			}
		},
		{
			target_group = 2001,
			name = "十九星草帽联盟",
			src_group = 201,
			expend = 19,
			camp_type = 2,
			star = 19,
			loss = {
				{
					37005,
					170
				}
			}
		},
		{
			target_group = 3001,
			name = "十九星强者",
			src_group = 301,
			expend = 19,
			camp_type = 3,
			star = 19,
			loss = {
				{
					37005,
					170
				}
			}
		},
		{
			target_group = 4001,
			name = "十九星海军",
			src_group = 401,
			expend = 19,
			camp_type = 4,
			star = 19,
			loss = {
				{
					37005,
					170
				}
			}
		},
		{
			target_group = 5001,
			name = "十九星五皇团",
			src_group = 501,
			expend = 19,
			camp_type = 5,
			star = 19,
			loss = {
				{
					37005,
					170
				}
			}
		},
		[7] = {
			target_group = 7001,
			name = "十九星传奇",
			src_group = 701,
			expend = 19,
			camp_type = 7,
			star = 19,
			loss = {
				{
					37005,
					170
				}
			}
		}
	},
	[20] = {
		{
			target_group = 1001,
			name = "二十星海贼新星",
			src_group = 101,
			expend = 20,
			camp_type = 1,
			star = 20,
			loss = {
				{
					37005,
					200
				}
			}
		},
		{
			target_group = 2001,
			name = "二十星草帽联盟",
			src_group = 201,
			expend = 20,
			camp_type = 2,
			star = 20,
			loss = {
				{
					37005,
					200
				}
			}
		},
		{
			target_group = 3001,
			name = "二十星强者",
			src_group = 301,
			expend = 20,
			camp_type = 3,
			star = 20,
			loss = {
				{
					37005,
					200
				}
			}
		},
		{
			target_group = 4001,
			name = "二十星海军",
			src_group = 401,
			expend = 20,
			camp_type = 4,
			star = 20,
			loss = {
				{
					37005,
					200
				}
			}
		},
		{
			target_group = 5001,
			name = "二十星五皇团",
			src_group = 501,
			expend = 20,
			camp_type = 5,
			star = 20,
			loss = {
				{
					37005,
					200
				}
			}
		},
		[7] = {
			target_group = 7001,
			name = "二十星传奇",
			src_group = 701,
			expend = 20,
			camp_type = 7,
			star = 20,
			loss = {
				{
					37005,
					200
				}
			}
		}
	},
	[21] = {
		[7] = {
			target_group = 7001,
			name = "二十一星传奇",
			src_group = 701,
			expend = 21,
			camp_type = 7,
			star = 21,
			loss = {
				{
					37005,
					200
				}
			}
		}
	},
	[22] = {
		[7] = {
			target_group = 7001,
			name = "二十二星传奇",
			src_group = 701,
			expend = 22,
			camp_type = 7,
			star = 22,
			loss = {
				{
					37005,
					200
				}
			}
		}
	},
	[23] = {
		[7] = {
			target_group = 7001,
			name = "二十三星传奇",
			src_group = 701,
			expend = 23,
			camp_type = 7,
			star = 23,
			loss = {
				{
					37005,
					200
				}
			}
		}
	},
	[24] = {
		[7] = {
			target_group = 7001,
			name = "二十四星传奇",
			src_group = 701,
			expend = 24,
			camp_type = 7,
			star = 24,
			loss = {
				{
					37005,
					200
				}
			}
		}
	},
	[25] = {
		[7] = {
			target_group = 7001,
			name = "二十五星传奇",
			src_group = 701,
			expend = 25,
			camp_type = 7,
			star = 25,
			loss = {
				{
					37005,
					200
				}
			}
		}
	}
}
Config.HolidayConvertData.data_hero_list_length = 10
Config.HolidayConvertData.data_hero_list = {
	[101] = {
		[10501] = {
			src_group = 101,
			bid = 10501
		},
		[10502] = {
			src_group = 101,
			bid = 10502
		},
		[10503] = {
			src_group = 101,
			bid = 10503
		},
		[10504] = {
			src_group = 101,
			bid = 10504
		},
		[10505] = {
			src_group = 101,
			bid = 10505
		},
		[10506] = {
			src_group = 101,
			bid = 10506
		},
		[10507] = {
			src_group = 101,
			bid = 10507
		},
		[10508] = {
			src_group = 101,
			bid = 10508
		},
		[10509] = {
			src_group = 101,
			bid = 10509
		},
		[10510] = {
			src_group = 101,
			bid = 10510
		},
		[10511] = {
			src_group = 101,
			bid = 10511
		},
		[10512] = {
			src_group = 101,
			bid = 10512
		},
		[10513] = {
			src_group = 101,
			bid = 10513
		},
		[10514] = {
			src_group = 101,
			bid = 10514
		}
	},
	[102] = {
		[10501] = {
			src_group = 102,
			bid = 10501
		},
		[10502] = {
			src_group = 102,
			bid = 10502
		},
		[10503] = {
			src_group = 102,
			bid = 10503
		},
		[10504] = {
			src_group = 102,
			bid = 10504
		},
		[10505] = {
			src_group = 102,
			bid = 10505
		},
		[10506] = {
			src_group = 102,
			bid = 10506
		},
		[10507] = {
			src_group = 102,
			bid = 10507
		},
		[10508] = {
			src_group = 102,
			bid = 10508
		},
		[10509] = {
			src_group = 102,
			bid = 10509
		},
		[10510] = {
			src_group = 102,
			bid = 10510
		},
		[10511] = {
			src_group = 102,
			bid = 10511
		},
		[10512] = {
			src_group = 102,
			bid = 10512
		},
		[10513] = {
			src_group = 102,
			bid = 10513
		},
		[10514] = {
			src_group = 102,
			bid = 10514
		}
	},
	[201] = {
		[20501] = {
			src_group = 201,
			bid = 20501
		},
		[20502] = {
			src_group = 201,
			bid = 20502
		},
		[20503] = {
			src_group = 201,
			bid = 20503
		},
		[20504] = {
			src_group = 201,
			bid = 20504
		},
		[20505] = {
			src_group = 201,
			bid = 20505
		},
		[20506] = {
			src_group = 201,
			bid = 20506
		},
		[20507] = {
			src_group = 201,
			bid = 20507
		},
		[20508] = {
			src_group = 201,
			bid = 20508
		},
		[20509] = {
			src_group = 201,
			bid = 20509
		},
		[20510] = {
			src_group = 201,
			bid = 20510
		},
		[20511] = {
			src_group = 201,
			bid = 20511
		},
		[20512] = {
			src_group = 201,
			bid = 20512
		},
		[20513] = {
			src_group = 201,
			bid = 20513
		},
		[20514] = {
			src_group = 201,
			bid = 20514
		}
	},
	[202] = {
		[20501] = {
			src_group = 202,
			bid = 20501
		},
		[20502] = {
			src_group = 202,
			bid = 20502
		},
		[20503] = {
			src_group = 202,
			bid = 20503
		},
		[20504] = {
			src_group = 202,
			bid = 20504
		},
		[20505] = {
			src_group = 202,
			bid = 20505
		},
		[20506] = {
			src_group = 202,
			bid = 20506
		},
		[20507] = {
			src_group = 202,
			bid = 20507
		},
		[20508] = {
			src_group = 202,
			bid = 20508
		},
		[20509] = {
			src_group = 202,
			bid = 20509
		},
		[20510] = {
			src_group = 202,
			bid = 20510
		},
		[20511] = {
			src_group = 202,
			bid = 20511
		},
		[20512] = {
			src_group = 202,
			bid = 20512
		},
		[20513] = {
			src_group = 202,
			bid = 20513
		},
		[20514] = {
			src_group = 202,
			bid = 20514
		}
	},
	[301] = {
		[30501] = {
			src_group = 301,
			bid = 30501
		},
		[30502] = {
			src_group = 301,
			bid = 30502
		},
		[30503] = {
			src_group = 301,
			bid = 30503
		},
		[30504] = {
			src_group = 301,
			bid = 30504
		},
		[30505] = {
			src_group = 301,
			bid = 30505
		},
		[30506] = {
			src_group = 301,
			bid = 30506
		},
		[30507] = {
			src_group = 301,
			bid = 30507
		},
		[30508] = {
			src_group = 301,
			bid = 30508
		},
		[30509] = {
			src_group = 301,
			bid = 30509
		},
		[30510] = {
			src_group = 301,
			bid = 30510
		},
		[30511] = {
			src_group = 301,
			bid = 30511
		},
		[30512] = {
			src_group = 301,
			bid = 30512
		},
		[30513] = {
			src_group = 301,
			bid = 30513
		},
		[30514] = {
			src_group = 301,
			bid = 30514
		},
		[30515] = {
			src_group = 301,
			bid = 30515
		}
	},
	[302] = {
		[30501] = {
			src_group = 302,
			bid = 30501
		},
		[30502] = {
			src_group = 302,
			bid = 30502
		},
		[30503] = {
			src_group = 302,
			bid = 30503
		},
		[30504] = {
			src_group = 302,
			bid = 30504
		},
		[30505] = {
			src_group = 302,
			bid = 30505
		},
		[30506] = {
			src_group = 302,
			bid = 30506
		},
		[30507] = {
			src_group = 302,
			bid = 30507
		},
		[30508] = {
			src_group = 302,
			bid = 30508
		},
		[30509] = {
			src_group = 302,
			bid = 30509
		},
		[30510] = {
			src_group = 302,
			bid = 30510
		},
		[30511] = {
			src_group = 302,
			bid = 30511
		},
		[30512] = {
			src_group = 302,
			bid = 30512
		},
		[30513] = {
			src_group = 302,
			bid = 30513
		},
		[30514] = {
			src_group = 302,
			bid = 30514
		},
		[30515] = {
			src_group = 302,
			bid = 30515
		}
	},
	[401] = {
		[40501] = {
			src_group = 401,
			bid = 40501
		},
		[40502] = {
			src_group = 401,
			bid = 40502
		},
		[40503] = {
			src_group = 401,
			bid = 40503
		},
		[40504] = {
			src_group = 401,
			bid = 40504
		},
		[40505] = {
			src_group = 401,
			bid = 40505
		},
		[40506] = {
			src_group = 401,
			bid = 40506
		},
		[40507] = {
			src_group = 401,
			bid = 40507
		},
		[40508] = {
			src_group = 401,
			bid = 40508
		},
		[40509] = {
			src_group = 401,
			bid = 40509
		},
		[40510] = {
			src_group = 401,
			bid = 40510
		},
		[40511] = {
			src_group = 401,
			bid = 40511
		},
		[40512] = {
			src_group = 401,
			bid = 40512
		},
		[40513] = {
			src_group = 401,
			bid = 40513
		},
		[40514] = {
			src_group = 401,
			bid = 40514
		}
	},
	[402] = {
		[40501] = {
			src_group = 402,
			bid = 40501
		},
		[40502] = {
			src_group = 402,
			bid = 40502
		},
		[40503] = {
			src_group = 402,
			bid = 40503
		},
		[40504] = {
			src_group = 402,
			bid = 40504
		},
		[40505] = {
			src_group = 402,
			bid = 40505
		},
		[40506] = {
			src_group = 402,
			bid = 40506
		},
		[40507] = {
			src_group = 402,
			bid = 40507
		},
		[40508] = {
			src_group = 402,
			bid = 40508
		},
		[40509] = {
			src_group = 402,
			bid = 40509
		},
		[40510] = {
			src_group = 402,
			bid = 40510
		},
		[40511] = {
			src_group = 402,
			bid = 40511
		},
		[40512] = {
			src_group = 402,
			bid = 40512
		},
		[40513] = {
			src_group = 402,
			bid = 40513
		},
		[40514] = {
			src_group = 402,
			bid = 40514
		}
	},
	[501] = {
		[50501] = {
			src_group = 501,
			bid = 50501
		},
		[50502] = {
			src_group = 501,
			bid = 50502
		},
		[50503] = {
			src_group = 501,
			bid = 50503
		},
		[50504] = {
			src_group = 501,
			bid = 50504
		},
		[50505] = {
			src_group = 501,
			bid = 50505
		},
		[50506] = {
			src_group = 501,
			bid = 50506
		},
		[50507] = {
			src_group = 501,
			bid = 50507
		},
		[50508] = {
			src_group = 501,
			bid = 50508
		},
		[50509] = {
			src_group = 501,
			bid = 50509
		},
		[50510] = {
			src_group = 501,
			bid = 50510
		},
		[50511] = {
			src_group = 501,
			bid = 50511
		},
		[50512] = {
			src_group = 501,
			bid = 50512
		},
		[50513] = {
			src_group = 501,
			bid = 50513
		},
		[50514] = {
			src_group = 501,
			bid = 50514
		},
		[50515] = {
			src_group = 501,
			bid = 50515
		},
		[50516] = {
			src_group = 501,
			bid = 50516
		},
		[50517] = {
			src_group = 501,
			bid = 50517
		}
	},
	[502] = {
		[50501] = {
			src_group = 502,
			bid = 50501
		},
		[50502] = {
			src_group = 502,
			bid = 50502
		},
		[50503] = {
			src_group = 502,
			bid = 50503
		},
		[50504] = {
			src_group = 502,
			bid = 50504
		},
		[50505] = {
			src_group = 502,
			bid = 50505
		},
		[50506] = {
			src_group = 502,
			bid = 50506
		},
		[50507] = {
			src_group = 502,
			bid = 50507
		},
		[50508] = {
			src_group = 502,
			bid = 50508
		},
		[50509] = {
			src_group = 502,
			bid = 50509
		},
		[50510] = {
			src_group = 502,
			bid = 50510
		},
		[50511] = {
			src_group = 502,
			bid = 50511
		},
		[50512] = {
			src_group = 502,
			bid = 50512
		},
		[50513] = {
			src_group = 502,
			bid = 50513
		},
		[50514] = {
			src_group = 502,
			bid = 50514
		},
		[50515] = {
			src_group = 502,
			bid = 50515
		},
		[50516] = {
			src_group = 502,
			bid = 50516
		},
		[50517] = {
			src_group = 502,
			bid = 50517
		}
	}
}
Config.HolidayConvertData.data_target_hero_list_length = 10
Config.HolidayConvertData.data_target_hero_list = {
	[1001] = {
		[10501] = {
			bid = 10501,
			target_group = 1001
		},
		[10502] = {
			bid = 10502,
			target_group = 1001
		},
		[10503] = {
			bid = 10503,
			target_group = 1001
		},
		[10504] = {
			bid = 10504,
			target_group = 1001
		},
		[10505] = {
			bid = 10505,
			target_group = 1001
		},
		[10506] = {
			bid = 10506,
			target_group = 1001
		},
		[10507] = {
			bid = 10507,
			target_group = 1001
		},
		[10508] = {
			bid = 10508,
			target_group = 1001
		},
		[10509] = {
			bid = 10509,
			target_group = 1001
		},
		[10510] = {
			bid = 10510,
			target_group = 1001
		},
		[10511] = {
			bid = 10511,
			target_group = 1001
		},
		[10512] = {
			bid = 10512,
			target_group = 1001
		},
		[10513] = {
			bid = 10513,
			target_group = 1001
		},
		[10514] = {
			bid = 10514,
			target_group = 1001
		}
	},
	[1002] = {
		[10501] = {
			bid = 10501,
			target_group = 1002
		},
		[10502] = {
			bid = 10502,
			target_group = 1002
		},
		[10503] = {
			bid = 10503,
			target_group = 1002
		},
		[10504] = {
			bid = 10504,
			target_group = 1002
		},
		[10505] = {
			bid = 10505,
			target_group = 1002
		},
		[10506] = {
			bid = 10506,
			target_group = 1002
		},
		[10507] = {
			bid = 10507,
			target_group = 1002
		},
		[10508] = {
			bid = 10508,
			target_group = 1002
		},
		[10509] = {
			bid = 10509,
			target_group = 1002
		},
		[10510] = {
			bid = 10510,
			target_group = 1002
		},
		[10511] = {
			bid = 10511,
			target_group = 1002
		},
		[10512] = {
			bid = 10512,
			target_group = 1002
		},
		[10513] = {
			bid = 10513,
			target_group = 1002
		},
		[10514] = {
			bid = 10514,
			target_group = 1002
		}
	},
	[2001] = {
		[20501] = {
			bid = 20501,
			target_group = 2001
		},
		[20502] = {
			bid = 20502,
			target_group = 2001
		},
		[20503] = {
			bid = 20503,
			target_group = 2001
		},
		[20504] = {
			bid = 20504,
			target_group = 2001
		},
		[20505] = {
			bid = 20505,
			target_group = 2001
		},
		[20506] = {
			bid = 20506,
			target_group = 2001
		},
		[20507] = {
			bid = 20507,
			target_group = 2001
		},
		[20508] = {
			bid = 20508,
			target_group = 2001
		},
		[20509] = {
			bid = 20509,
			target_group = 2001
		},
		[20510] = {
			bid = 20510,
			target_group = 2001
		},
		[20511] = {
			bid = 20511,
			target_group = 2001
		},
		[20512] = {
			bid = 20512,
			target_group = 2001
		},
		[20513] = {
			bid = 20513,
			target_group = 2001
		},
		[20514] = {
			bid = 20514,
			target_group = 2001
		}
	},
	[2002] = {
		[20501] = {
			bid = 20501,
			target_group = 2002
		},
		[20502] = {
			bid = 20502,
			target_group = 2002
		},
		[20503] = {
			bid = 20503,
			target_group = 2002
		},
		[20504] = {
			bid = 20504,
			target_group = 2002
		},
		[20505] = {
			bid = 20505,
			target_group = 2002
		},
		[20506] = {
			bid = 20506,
			target_group = 2002
		},
		[20507] = {
			bid = 20507,
			target_group = 2002
		},
		[20508] = {
			bid = 20508,
			target_group = 2002
		},
		[20509] = {
			bid = 20509,
			target_group = 2002
		},
		[20510] = {
			bid = 20510,
			target_group = 2002
		},
		[20511] = {
			bid = 20511,
			target_group = 2002
		},
		[20512] = {
			bid = 20512,
			target_group = 2002
		},
		[20513] = {
			bid = 20513,
			target_group = 2002
		},
		[20514] = {
			bid = 20514,
			target_group = 2002
		}
	},
	[3001] = {
		[30501] = {
			bid = 30501,
			target_group = 3001
		},
		[30502] = {
			bid = 30502,
			target_group = 3001
		},
		[30503] = {
			bid = 30503,
			target_group = 3001
		},
		[30504] = {
			bid = 30504,
			target_group = 3001
		},
		[30505] = {
			bid = 30505,
			target_group = 3001
		},
		[30506] = {
			bid = 30506,
			target_group = 3001
		},
		[30507] = {
			bid = 30507,
			target_group = 3001
		},
		[30508] = {
			bid = 30508,
			target_group = 3001
		},
		[30509] = {
			bid = 30509,
			target_group = 3001
		},
		[30510] = {
			bid = 30510,
			target_group = 3001
		},
		[30511] = {
			bid = 30511,
			target_group = 3001
		},
		[30512] = {
			bid = 30512,
			target_group = 3001
		},
		[30513] = {
			bid = 30513,
			target_group = 3001
		},
		[30514] = {
			bid = 30514,
			target_group = 3001
		},
		[30515] = {
			bid = 30515,
			target_group = 3001
		}
	},
	[3002] = {
		[30501] = {
			bid = 30501,
			target_group = 3002
		},
		[30502] = {
			bid = 30502,
			target_group = 3002
		},
		[30503] = {
			bid = 30503,
			target_group = 3002
		},
		[30504] = {
			bid = 30504,
			target_group = 3002
		},
		[30505] = {
			bid = 30505,
			target_group = 3002
		},
		[30506] = {
			bid = 30506,
			target_group = 3002
		},
		[30507] = {
			bid = 30507,
			target_group = 3002
		},
		[30508] = {
			bid = 30508,
			target_group = 3002
		},
		[30509] = {
			bid = 30509,
			target_group = 3002
		},
		[30510] = {
			bid = 30510,
			target_group = 3002
		},
		[30511] = {
			bid = 30511,
			target_group = 3002
		},
		[30512] = {
			bid = 30512,
			target_group = 3002
		},
		[30513] = {
			bid = 30513,
			target_group = 3002
		},
		[30514] = {
			bid = 30514,
			target_group = 3002
		},
		[30515] = {
			bid = 30515,
			target_group = 3002
		}
	},
	[4001] = {
		[40501] = {
			bid = 40501,
			target_group = 4001
		},
		[40502] = {
			bid = 40502,
			target_group = 4001
		},
		[40503] = {
			bid = 40503,
			target_group = 4001
		},
		[40504] = {
			bid = 40504,
			target_group = 4001
		},
		[40505] = {
			bid = 40505,
			target_group = 4001
		},
		[40506] = {
			bid = 40506,
			target_group = 4001
		},
		[40507] = {
			bid = 40507,
			target_group = 4001
		},
		[40508] = {
			bid = 40508,
			target_group = 4001
		},
		[40509] = {
			bid = 40509,
			target_group = 4001
		},
		[40510] = {
			bid = 40510,
			target_group = 4001
		},
		[40511] = {
			bid = 40511,
			target_group = 4001
		},
		[40512] = {
			bid = 40512,
			target_group = 4001
		},
		[40513] = {
			bid = 40513,
			target_group = 4001
		},
		[40514] = {
			bid = 40514,
			target_group = 4001
		}
	},
	[4002] = {
		[40501] = {
			bid = 40501,
			target_group = 4002
		},
		[40502] = {
			bid = 40502,
			target_group = 4002
		},
		[40503] = {
			bid = 40503,
			target_group = 4002
		},
		[40504] = {
			bid = 40504,
			target_group = 4002
		},
		[40505] = {
			bid = 40505,
			target_group = 4002
		},
		[40506] = {
			bid = 40506,
			target_group = 4002
		},
		[40507] = {
			bid = 40507,
			target_group = 4002
		},
		[40508] = {
			bid = 40508,
			target_group = 4002
		},
		[40509] = {
			bid = 40509,
			target_group = 4002
		},
		[40510] = {
			bid = 40510,
			target_group = 4002
		},
		[40511] = {
			bid = 40511,
			target_group = 4002
		},
		[40512] = {
			bid = 40512,
			target_group = 4002
		},
		[40513] = {
			bid = 40513,
			target_group = 4002
		},
		[40514] = {
			bid = 40514,
			target_group = 4002
		}
	},
	[5001] = {
		[50501] = {
			bid = 50501,
			target_group = 5001
		},
		[50502] = {
			bid = 50502,
			target_group = 5001
		},
		[50503] = {
			bid = 50503,
			target_group = 5001
		},
		[50504] = {
			bid = 50504,
			target_group = 5001
		},
		[50505] = {
			bid = 50505,
			target_group = 5001
		},
		[50506] = {
			bid = 50506,
			target_group = 5001
		},
		[50507] = {
			bid = 50507,
			target_group = 5001
		},
		[50508] = {
			bid = 50508,
			target_group = 5001
		},
		[50509] = {
			bid = 50509,
			target_group = 5001
		},
		[50510] = {
			bid = 50510,
			target_group = 5001
		},
		[50511] = {
			bid = 50511,
			target_group = 5001
		},
		[50512] = {
			bid = 50512,
			target_group = 5001
		},
		[50513] = {
			bid = 50513,
			target_group = 5001
		},
		[50514] = {
			bid = 50514,
			target_group = 5001
		},
		[50515] = {
			bid = 50515,
			target_group = 5001
		},
		[50516] = {
			bid = 50516,
			target_group = 5001
		},
		[50517] = {
			bid = 50517,
			target_group = 5001
		}
	},
	[5002] = {
		[50501] = {
			bid = 50501,
			target_group = 5002
		},
		[50502] = {
			bid = 50502,
			target_group = 5002
		},
		[50503] = {
			bid = 50503,
			target_group = 5002
		},
		[50504] = {
			bid = 50504,
			target_group = 5002
		},
		[50505] = {
			bid = 50505,
			target_group = 5002
		},
		[50506] = {
			bid = 50506,
			target_group = 5002
		},
		[50507] = {
			bid = 50507,
			target_group = 5002
		},
		[50508] = {
			bid = 50508,
			target_group = 5002
		},
		[50509] = {
			bid = 50509,
			target_group = 5002
		},
		[50510] = {
			bid = 50510,
			target_group = 5002
		},
		[50511] = {
			bid = 50511,
			target_group = 5002
		},
		[50512] = {
			bid = 50512,
			target_group = 5002
		},
		[50513] = {
			bid = 50513,
			target_group = 5002
		},
		[50514] = {
			bid = 50514,
			target_group = 5002
		},
		[50515] = {
			bid = 50515,
			target_group = 5002
		},
		[50516] = {
			bid = 50516,
			target_group = 5002
		},
		[50517] = {
			bid = 50517,
			target_group = 5002
		}
	}
}
