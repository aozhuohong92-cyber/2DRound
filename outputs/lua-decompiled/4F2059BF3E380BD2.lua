Config = Config or {}
Config.HolidayLantermFestivalData = Config.HolidayLantermFestivalData or {}
Config.HolidayLantermFestivalData.data_constant_length = 3
Config.HolidayLantermFestivalData.data_constant = {
	awards_4_expend = {
		desc = "4奖池消耗",
		val = {
			80201,
			40
		}
	},
	awards_expend_items = {
		val = 80201,
		desc = "抽奖道具"
	},
	holiday_content_tips = {
		desc = [[
1.通过节日期间各类玩法可以获得「英雄酒」。
2.消耗「英雄酒」可以进行抽奖，共有「壮士酒」「百夫长酒」「千夫长酒」三个抽奖池可以抽取，其中「壮士酒」与「百夫长酒」分别需要累计消耗「英雄酒」100，200个才能开启
3.每种花灯各项物品的抽取概率相等，获取后的物品不会重复获得
4.所有物品都抽取完成后，还能继续抽取「将军酒」，将军酒没有数量限制，会随机掉落一些成长道具。
5.活动结束后，未使用的「英雄酒」将无法继续使用，请大人及时使用]],
		val = {}
	}
}

function Config.HolidayLantermFestivalData.data_constant_fun(slot0)
	slot1 = Config.HolidayLantermFestivalData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayLantermFestivalData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayLantermFestivalData.data_consume_num_length = 4
Config.HolidayLantermFestivalData.data_consume_num = {
	{
		id = 1,
		need_num = 0
	},
	{
		id = 2,
		need_num = 100
	},
	{
		id = 3,
		need_num = 200
	},
	{
		id = 4,
		need_num = 645
	}
}

function Config.HolidayLantermFestivalData.data_consume_num_fun(slot0)
	slot1 = Config.HolidayLantermFestivalData.data_consume_num[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayLantermFestivalData.data_consume_num[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayLantermFestivalData.data_consume_list_length = 3
Config.HolidayLantermFestivalData.data_consume_list = {
	{
		{
			id = 1,
			expend = 0,
			count = 1
		},
		{
			id = 1,
			expend = 5,
			count = 2
		},
		{
			id = 1,
			expend = 10,
			count = 3
		},
		{
			id = 1,
			expend = 10,
			count = 4
		},
		{
			id = 1,
			expend = 15,
			count = 5
		},
		{
			id = 1,
			expend = 15,
			count = 6
		},
		{
			id = 1,
			expend = 20,
			count = 7
		},
		{
			id = 1,
			expend = 20,
			count = 8
		},
		{
			id = 1,
			expend = 20,
			count = 9
		},
		{
			id = 1,
			expend = 20,
			count = 10
		},
		{
			id = 1,
			expend = 40,
			count = 11
		},
		{
			id = 1,
			expend = 40,
			count = 12
		}
	},
	{
		{
			id = 2,
			expend = 0,
			count = 1
		},
		{
			id = 2,
			expend = 5,
			count = 2
		},
		{
			id = 2,
			expend = 10,
			count = 3
		},
		{
			id = 2,
			expend = 10,
			count = 4
		},
		{
			id = 2,
			expend = 15,
			count = 5
		},
		{
			id = 2,
			expend = 15,
			count = 6
		},
		{
			id = 2,
			expend = 20,
			count = 7
		},
		{
			id = 2,
			expend = 20,
			count = 8
		},
		{
			id = 2,
			expend = 20,
			count = 9
		},
		{
			id = 2,
			expend = 20,
			count = 10
		},
		{
			id = 2,
			expend = 40,
			count = 11
		},
		{
			id = 2,
			expend = 40,
			count = 12
		}
	},
	{
		{
			id = 3,
			expend = 0,
			count = 1
		},
		{
			id = 3,
			expend = 5,
			count = 2
		},
		{
			id = 3,
			expend = 10,
			count = 3
		},
		{
			id = 3,
			expend = 10,
			count = 4
		},
		{
			id = 3,
			expend = 15,
			count = 5
		},
		{
			id = 3,
			expend = 15,
			count = 6
		},
		{
			id = 3,
			expend = 20,
			count = 7
		},
		{
			id = 3,
			expend = 20,
			count = 8
		},
		{
			id = 3,
			expend = 20,
			count = 9
		},
		{
			id = 3,
			expend = 20,
			count = 10
		},
		{
			id = 3,
			expend = 40,
			count = 11
		},
		{
			id = 3,
			expend = 40,
			count = 12
		}
	}
}
Config.HolidayLantermFestivalData.data_rand_list_length = 4
Config.HolidayLantermFestivalData.data_rand_list = {
	{
		{
			max_open_day = 9999,
			must_no_count = 4,
			award_id = 1,
			limit_count = 1,
			effect = 1,
			item_num = 20,
			pro = 200,
			item_id = 10403,
			id = 1,
			min_open_day = 7,
			order = 1
		},
		{
			max_open_day = 9999,
			must_no_count = 3,
			award_id = 2,
			limit_count = 1,
			effect = 1,
			item_num = 20,
			pro = 200,
			item_id = 10408,
			id = 1,
			min_open_day = 7,
			order = 2
		},
		{
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 3,
			limit_count = 1,
			effect = 1,
			item_num = 20,
			pro = 200,
			item_id = 10407,
			id = 1,
			min_open_day = 7,
			order = 3
		},
		{
			max_open_day = 9999,
			must_no_count = 8,
			award_id = 4,
			limit_count = 1,
			effect = 1,
			item_num = 20,
			pro = 200,
			item_id = 14001,
			id = 1,
			min_open_day = 7,
			order = 4
		},
		{
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 5,
			limit_count = 1,
			effect = 1,
			item_num = 10,
			pro = 200,
			item_id = 29907,
			id = 1,
			min_open_day = 7,
			order = 5
		},
		{
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 6,
			limit_count = 1,
			effect = 1,
			item_num = 5,
			pro = 200,
			item_id = 10470,
			id = 1,
			min_open_day = 7,
			order = 6
		},
		{
			max_open_day = 9999,
			must_no_count = 5,
			award_id = 7,
			limit_count = 1,
			effect = 1,
			item_num = 5,
			pro = 200,
			item_id = 10603,
			id = 1,
			min_open_day = 7,
			order = 7
		},
		{
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 8,
			limit_count = 1,
			effect = 1,
			item_num = 5,
			pro = 200,
			item_id = 10460,
			id = 1,
			min_open_day = 7,
			order = 8
		},
		{
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 9,
			limit_count = 1,
			effect = 1,
			item_num = 1,
			pro = 200,
			item_id = 10455,
			id = 1,
			min_open_day = 7,
			order = 9
		},
		{
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 10,
			limit_count = 1,
			effect = 1,
			item_num = 20,
			pro = 200,
			item_id = 10006,
			id = 1,
			min_open_day = 7,
			order = 10
		},
		{
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 11,
			limit_count = 1,
			effect = 1,
			item_num = 5,
			pro = 200,
			item_id = 16201,
			id = 1,
			min_open_day = 7,
			order = 11
		},
		{
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 12,
			limit_count = 1,
			effect = 1,
			item_num = 5,
			pro = 200,
			item_id = 16202,
			id = 1,
			min_open_day = 7,
			order = 12
		}
	},
	{
		[13] = {
			max_open_day = 9999,
			must_no_count = 6,
			award_id = 13,
			limit_count = 1,
			effect = 1,
			item_num = 20,
			pro = 200,
			item_id = 10403,
			id = 2,
			min_open_day = 7,
			order = 1
		},
		[14] = {
			max_open_day = 9999,
			must_no_count = 3,
			award_id = 14,
			limit_count = 1,
			effect = 1,
			item_num = 20,
			pro = 200,
			item_id = 10408,
			id = 2,
			min_open_day = 7,
			order = 2
		},
		[15] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 15,
			limit_count = 1,
			effect = 1,
			item_num = 20,
			pro = 200,
			item_id = 10407,
			id = 2,
			min_open_day = 7,
			order = 3
		},
		[16] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 16,
			limit_count = 1,
			effect = 1,
			item_num = 20,
			pro = 200,
			item_id = 14001,
			id = 2,
			min_open_day = 7,
			order = 4
		},
		[17] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 17,
			limit_count = 1,
			effect = 1,
			item_num = 10,
			pro = 200,
			item_id = 29907,
			id = 2,
			min_open_day = 7,
			order = 5
		},
		[18] = {
			max_open_day = 9999,
			must_no_count = 5,
			award_id = 18,
			limit_count = 1,
			effect = 1,
			item_num = 5,
			pro = 200,
			item_id = 10470,
			id = 2,
			min_open_day = 7,
			order = 6
		},
		[19] = {
			max_open_day = 9999,
			must_no_count = 1,
			award_id = 19,
			limit_count = 1,
			effect = 1,
			item_num = 5,
			pro = 200,
			item_id = 10603,
			id = 2,
			min_open_day = 7,
			order = 7
		},
		[20] = {
			max_open_day = 9999,
			must_no_count = 8,
			award_id = 20,
			limit_count = 1,
			effect = 1,
			item_num = 5,
			pro = 200,
			item_id = 10460,
			id = 2,
			min_open_day = 7,
			order = 8
		},
		[21] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 21,
			limit_count = 1,
			effect = 1,
			item_num = 1,
			pro = 200,
			item_id = 10455,
			id = 2,
			min_open_day = 7,
			order = 9
		},
		[22] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 22,
			limit_count = 1,
			effect = 1,
			item_num = 20,
			pro = 200,
			item_id = 10006,
			id = 2,
			min_open_day = 7,
			order = 10
		},
		[23] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 23,
			limit_count = 1,
			effect = 1,
			item_num = 5,
			pro = 200,
			item_id = 16201,
			id = 2,
			min_open_day = 7,
			order = 11
		},
		[24] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 24,
			limit_count = 1,
			effect = 1,
			item_num = 5,
			pro = 200,
			item_id = 16202,
			id = 2,
			min_open_day = 7,
			order = 12
		}
	},
	{
		[25] = {
			max_open_day = 9999,
			must_no_count = 7,
			award_id = 25,
			limit_count = 1,
			effect = 1,
			item_num = 20,
			pro = 200,
			item_id = 10403,
			id = 3,
			min_open_day = 7,
			order = 1
		},
		[26] = {
			max_open_day = 9999,
			must_no_count = 5,
			award_id = 26,
			limit_count = 1,
			effect = 1,
			item_num = 20,
			pro = 200,
			item_id = 10408,
			id = 3,
			min_open_day = 7,
			order = 2
		},
		[27] = {
			max_open_day = 9999,
			must_no_count = 2,
			award_id = 27,
			limit_count = 1,
			effect = 1,
			item_num = 20,
			pro = 200,
			item_id = 10407,
			id = 3,
			min_open_day = 7,
			order = 3
		},
		[28] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 28,
			limit_count = 1,
			effect = 1,
			item_num = 20,
			pro = 200,
			item_id = 14001,
			id = 3,
			min_open_day = 7,
			order = 4
		},
		[29] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 29,
			limit_count = 1,
			effect = 1,
			item_num = 10,
			pro = 200,
			item_id = 29907,
			id = 3,
			min_open_day = 7,
			order = 5
		},
		[30] = {
			max_open_day = 9999,
			must_no_count = 9,
			award_id = 30,
			limit_count = 1,
			effect = 1,
			item_num = 5,
			pro = 200,
			item_id = 10470,
			id = 3,
			min_open_day = 7,
			order = 6
		},
		[31] = {
			max_open_day = 9999,
			must_no_count = 8,
			award_id = 31,
			limit_count = 1,
			effect = 1,
			item_num = 5,
			pro = 200,
			item_id = 10603,
			id = 3,
			min_open_day = 7,
			order = 7
		},
		[32] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 32,
			limit_count = 1,
			effect = 1,
			item_num = 5,
			pro = 200,
			item_id = 10460,
			id = 3,
			min_open_day = 7,
			order = 8
		},
		[33] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 33,
			limit_count = 1,
			effect = 1,
			item_num = 1,
			pro = 200,
			item_id = 10455,
			id = 3,
			min_open_day = 7,
			order = 9
		},
		[34] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 34,
			limit_count = 1,
			effect = 1,
			item_num = 20,
			pro = 200,
			item_id = 10006,
			id = 3,
			min_open_day = 7,
			order = 10
		},
		[35] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 35,
			limit_count = 1,
			effect = 1,
			item_num = 5,
			pro = 200,
			item_id = 16201,
			id = 3,
			min_open_day = 7,
			order = 11
		},
		[36] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 36,
			limit_count = 1,
			effect = 1,
			item_num = 5,
			pro = 200,
			item_id = 16202,
			id = 3,
			min_open_day = 7,
			order = 12
		}
	},
	{
		[37] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 37,
			limit_count = 999,
			effect = 1,
			item_num = 50,
			pro = 200,
			item_id = 10403,
			id = 4,
			min_open_day = 7,
			order = 1
		},
		[38] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 38,
			limit_count = 999,
			effect = 1,
			item_num = 50,
			pro = 200,
			item_id = 10408,
			id = 4,
			min_open_day = 7,
			order = 2
		},
		[39] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 39,
			limit_count = 999,
			effect = 1,
			item_num = 50,
			pro = 200,
			item_id = 10407,
			id = 4,
			min_open_day = 7,
			order = 3
		},
		[40] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 40,
			limit_count = 999,
			effect = 1,
			item_num = 50,
			pro = 200,
			item_id = 14001,
			id = 4,
			min_open_day = 7,
			order = 4
		},
		[41] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 41,
			limit_count = 999,
			effect = 1,
			item_num = 25,
			pro = 200,
			item_id = 29907,
			id = 4,
			min_open_day = 7,
			order = 5
		},
		[42] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 42,
			limit_count = 999,
			effect = 1,
			item_num = 10,
			pro = 200,
			item_id = 10470,
			id = 4,
			min_open_day = 7,
			order = 6
		},
		[43] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 43,
			limit_count = 999,
			effect = 1,
			item_num = 10,
			pro = 200,
			item_id = 10603,
			id = 4,
			min_open_day = 7,
			order = 7
		},
		[44] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 44,
			limit_count = 999,
			effect = 1,
			item_num = 10,
			pro = 200,
			item_id = 10460,
			id = 4,
			min_open_day = 7,
			order = 8
		},
		[45] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 45,
			limit_count = 999,
			effect = 1,
			item_num = 1,
			pro = 200,
			item_id = 10455,
			id = 4,
			min_open_day = 7,
			order = 9
		},
		[46] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 46,
			limit_count = 999,
			effect = 1,
			item_num = 50,
			pro = 200,
			item_id = 10006,
			id = 4,
			min_open_day = 7,
			order = 10
		},
		[47] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 47,
			limit_count = 999,
			effect = 1,
			item_num = 10,
			pro = 200,
			item_id = 16201,
			id = 4,
			min_open_day = 7,
			order = 11
		},
		[48] = {
			max_open_day = 9999,
			must_no_count = 0,
			award_id = 48,
			limit_count = 999,
			effect = 1,
			item_num = 10,
			pro = 200,
			item_id = 16202,
			id = 4,
			min_open_day = 7,
			order = 12
		}
	}
}
