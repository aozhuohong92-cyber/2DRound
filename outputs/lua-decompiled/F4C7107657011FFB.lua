Config = Config or {}
Config.HolidayPetardData = Config.HolidayPetardData or {}
Config.HolidayPetardData.data_const_length = 22
Config.HolidayPetardData.data_const = {
	petard_start_time = {
		val = 19,
		desc = "花火大会开始时间"
	},
	petard_end_time = {
		val = 23,
		desc = "花火大会结束时间"
	},
	meteor_bid = {
		val = 80237,
		desc = "流星弹bid"
	},
	firework_bid = {
		val = 80238,
		desc = "礼花炮Bid"
	},
	meteor_score = {
		val = 1,
		desc = "使用流星弹所获得积分"
	},
	firework_score = {
		val = 12,
		desc = "使用礼花炮所获得积分"
	},
	holiday_time = {
		val = 0,
		desc = "4月30日-5月6日"
	},
	max_get_num = {
		val = 10,
		desc = "红包最大可领人数"
	},
	effect_time = {
		val = 24,
		desc = "红包有效时间（小时）"
	},
	max_day_get_num = {
		val = 8,
		desc = "每日可领红包最大数"
	},
	max_day_send_num = {
		val = 10,
		desc = "每日可发红包最大数"
	},
	broadcast_num = {
		val = 40,
		desc = "传闻显示数量"
	},
	petard_score = {
		val = 80236,
		desc = "花火积分"
	},
	firework_cd = {
		val = 2,
		desc = "礼花炮燃放间隔CD（秒）"
	},
	holiday_rule = {
		val = 1,
		desc = [[
1、活动期间可通过完成任务获取<div fontcolor=289b14>【流星弹】、【礼花炮】</div>来燃放烟花（【礼花炮】只能在每日<div fontcolor=289b14>19:00-23:00</div>时间段内燃放），燃放可获得道具奖励、花火积分、和增加全服花火热度进度；活动结束后剩余的烟花道具将被清空（通过邮件发放对应补偿）
2、燃放【礼花炮】同时能向全服玩家发放<div fontcolor=289b14>1次</div>红包，开红包有机会领取大量钻石，手快有手慢无！每人每日最多可发放<div fontcolor=289b14>10次</div>红包（达上限后，可继续燃放礼花炮并获得奖励与积分），每人每日最多可领取<div fontcolor=289b14>8次</div>红包
3、使用1个流星弹能获得<div fontcolor=289b14>1点</div>花火积分，使用1个礼花炮能获得<div fontcolor=289b14>12点</div>花火积分，花火积分可在活动商城兑换物品，活动结束后积分将清空，同时关闭商城，请及时兑换
4、花火进度达到一定值能领取进度奖励，活动结束后进度奖励不会补发，请及时领取]]
	},
	holiday_open_lev = {
		val = 20,
		desc = "花火大会开启等级"
	},
	holiday_open_day = {
		val = 8,
		desc = "花火大会开启天数要求"
	},
	firework_rule1 = {
		val = 1,
		desc = "获得积分与道具奖励"
	},
	firework_rule2 = {
		val = 1,
		desc = "获得积分与道具奖励并发放全服红包"
	},
	meteor_item_reward = {
		desc = "流星弹返还价值",
		val = {
			1,
			20000
		}
	},
	firework_item_reward = {
		desc = "礼花炮返还价值",
		val = {
			3,
			200
		}
	},
	base_max_score = {
		val = 100000,
		desc = "基础热度"
	}
}

function Config.HolidayPetardData.data_const_fun(slot0)
	slot1 = Config.HolidayPetardData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayPetardData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayPetardData.data_award_length = 7
Config.HolidayPetardData.data_award = {
	{
		id = 1,
		count = 160,
		award = {
			{
				10403,
				3
			}
		}
	},
	{
		id = 2,
		count = 300,
		award = {
			{
				37002,
				1
			}
		}
	},
	{
		id = 3,
		count = 440,
		award = {
			{
				10408,
				3
			}
		}
	},
	{
		id = 4,
		count = 580,
		award = {
			{
				14001,
				1
			}
		}
	},
	{
		id = 5,
		count = 720,
		award = {
			{
				3,
				888
			}
		}
	},
	{
		id = 6,
		count = 860,
		award = {
			{
				80238,
				1
			}
		}
	},
	{
		id = 7,
		count = 1000,
		award = {
			{
				29905,
				50
			}
		}
	}
}

function Config.HolidayPetardData.data_award_fun(slot0)
	slot1 = Config.HolidayPetardData.data_award[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayPetardData.data_award[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayPetardData.data_wish_length = 10
Config.HolidayPetardData.data_wish = {
	{
		id = 1,
		msg = "大吉大利！",
		pro = 100
	},
	{
		id = 2,
		msg = "以劳动之名，予你红包之礼",
		pro = 100
	},
	{
		id = 3,
		msg = "愿你开心每一天",
		pro = 100
	},
	{
		id = 4,
		msg = "致以最诚挚的祝福",
		pro = 100
	},
	{
		id = 5,
		msg = "最美的礼物送给最美的你",
		pro = 100
	},
	{
		id = 6,
		msg = "红包运气看颜值！",
		pro = 100
	},
	{
		id = 7,
		msg = "五一，我与你！",
		pro = 100
	},
	{
		id = 8,
		msg = "送给星空下最亮的崽",
		pro = 100
	},
	{
		id = 9,
		msg = "星空灿烂，花火闪耀",
		pro = 100
	},
	{
		id = 10,
		msg = "小小红包，以表心意",
		pro = 100
	}
}

function Config.HolidayPetardData.data_wish_fun(slot0)
	slot1 = Config.HolidayPetardData.data_wish[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayPetardData.data_wish[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
