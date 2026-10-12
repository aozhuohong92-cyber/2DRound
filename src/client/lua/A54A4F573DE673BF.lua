Config = Config or {}
Config.HolidaySkinDrawData = Config.HolidaySkinDrawData or {}
Config.HolidaySkinDrawData.data_const_length = 4
Config.HolidaySkinDrawData.data_const = {
	item = {
		val = 37009,
		desc = "海军海选石"
	},
	rule = {
		val = 0,
		desc = "1、活动期间，进行N次【皮肤活动XX字】祈愿，必定可以获得包括【XX皮肤】皮肤在内的全部祈愿池物品！"
	},
	change_diamo = {
		desc = "1星等额钻石",
		val = {
			3,
			25
		}
	},
	change_gold = {
		desc = "1星转换贝里",
		val = {
			1,
			100000
		}
	}
}

function Config.HolidaySkinDrawData.data_const_fun(slot0)
	slot1 = Config.HolidaySkinDrawData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidaySkinDrawData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidaySkinDrawData.data_consum_count_length = 1
Config.HolidaySkinDrawData.data_consum_count = {
	[1001] = {
		{
			num = 0,
			loss_id = 37009
		},
		{
			num = 16,
			loss_id = 37009
		},
		{
			num = 24,
			loss_id = 37009
		},
		{
			num = 40,
			loss_id = 37009
		},
		{
			num = 65,
			loss_id = 37009
		},
		{
			num = 90,
			loss_id = 37009
		},
		{
			num = 125,
			loss_id = 37009
		},
		{
			num = 160,
			loss_id = 37009
		},
		{
			num = 200,
			loss_id = 37009
		},
		{
			num = 240,
			loss_id = 37009
		}
	}
}
Config.HolidaySkinDrawData.data_lottery_stock_length = 1
Config.HolidaySkinDrawData.data_lottery_stock = {
	[1001] = {
		{
			reward_id = 27910,
			num = 50,
			sort = 1
		},
		[10] = {
			reward_id = 10450,
			num = 500,
			sort = 10
		},
		[9] = {
			reward_id = 10002,
			num = 10,
			sort = 9
		},
		[8] = {
			reward_id = 37001,
			num = 10,
			sort = 8
		},
		[7] = {
			reward_id = 10403,
			num = 1,
			sort = 7
		},
		[6] = {
			reward_id = 37002,
			num = 1,
			sort = 6
		},
		[5] = {
			reward_id = 29905,
			num = 25,
			sort = 5
		},
		[4] = {
			reward_id = 10408,
			num = 5,
			sort = 4
		},
		[3] = {
			reward_id = 35,
			num = 8,
			sort = 3
		},
		[2] = {
			reward_id = 14001,
			num = 1,
			sort = 2
		}
	}
}
Config.HolidaySkinDrawData.data_lottery_msg_length = 1
Config.HolidaySkinDrawData.data_lottery_msg = {
	[1001] = {
		lottery_id = 1001,
		lottery_item = 37009,
		desc = [[
1、活动期间，进行10次【世界征兵】，必定可以获得包括【藤虎】在内的<div fontcolor=#65df74>全部</div>物品！
2、<div fontcolor=#65df74>首次征兵免费</div>，后续征兵需要消耗【世界征兵令】进行，且消耗数量依次提高。
3、【世界征兵令】可在征兵按钮直接购买下次征兵所需的数量，10次征兵需求的数量分别是<div fontcolor=#65df74>0个，16个，24个，40个，65个，90个，125个，160个，200个，240个</div>
4、【世界征兵令】每个价值25钻石，<div fontcolor=#65df74>活动结束后将无法使用并会1：1回收为10万贝里(以邮件形式发放)</div>，请船长大人不要在可征兵次数为零后额外购买。
5、<div fontcolor=#65df74>第5次征兵开始</div>，即有机率可以获得【藤虎】，参与征兵的<div fontcolor=#65df74>次数越多</div>，获得【藤虎】的概率越大。<div fontcolor=#65df74>10次征兵必定可以获得【藤虎】！</div>]],
		star_diammond = {
			{
				3,
				25
			}
		},
		star_coin = {
			{
				1,
				100000
			}
		}
	}
}

function Config.HolidaySkinDrawData.data_lottery_msg_fun(slot0)
	slot1 = Config.HolidaySkinDrawData.data_lottery_msg[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidaySkinDrawData.data_lottery_msg[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
