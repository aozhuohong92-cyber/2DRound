Config = Config or {}
Config.BreakEggData = Config.BreakEggData or {}
Config.BreakEggData.data_const_length = 15
Config.BreakEggData.data_const = {
	holiday_rule = {
		val = 1,
		desc = [[
<div fontcolor=#fca000>玩法说明：</div><div fontcolor=#e7d499>
1.活动期间，消耗</div><div fontcolor=#00ff00>小金锤</div><div fontcolor=#e7d499>砸金蛋，可获得金蛋内的道具奖励</div><div fontcolor=#e7d499>
2.每次刷新金蛋，都有概率可刷出</div><div fontcolor=#00ff00>极品蛋</div><div fontcolor=#e7d499>，砸开</div><div fontcolor=#00ff00>极品蛋</div><div fontcolor=#e7d499>必定获得极品奖励</div><div fontcolor=#e7d499>
3.砸开所有蛋后自动免费刷新</div><div fontcolor=#e7d499>
4.砸金蛋会获得幸运值,幸运值越高刷新出</div><div fontcolor=#00ff00>极品蛋</div><div fontcolor=#e7d499>的概率也越高</div><div fontcolor=#e7d499>
5.幸运值满后下次刷新必出</div><div fontcolor=#00ff00>极品蛋</div><div fontcolor=#e7d499>，刷出极品蛋后幸运值清零。</div><div fontcolor=#e7d499>
6.极品蛋中奖概率</div><div fontcolor=#e7d499>
5星随机碎片*25：</div><div fontcolor=#15ee5c>15%</div><div fontcolor=#e7d499>
强者招募令*1：</div><div fontcolor=#15ee5c>15%</div><div fontcolor=#e7d499>
皮肤碎片*3：</div><div fontcolor=#15ee5c>35%</div><div fontcolor=#e7d499>
高级召唤券*2：</div><div fontcolor=#15ee5c>35%</div><div fontcolor=#e7d499>
7.普通蛋中奖概率</div><div fontcolor=#e7d499>
皮肤碎片*1：</div><div fontcolor=#15ee5c>10%</div><div fontcolor=#e7d499>
强化训练*100：</div><div fontcolor=#15ee5c>10%</div><div fontcolor=#e7d499>
其他道具：</div><div fontcolor=#15ee5c>80%</div>]]
	},
	lev_limit = {
		val = 10,
		desc = "开放等级"
	},
	item_bid = {
		val = 37004,
		desc = "小金锤"
	},
	item_price = {
		val = 200,
		desc = "单个小金锤价格"
	},
	give_exp = {
		val = 5000,
		desc = "单次购买赠送经验"
	},
	gold_once = {
		val = 20000000000.0,
		desc = "单次砸蛋消耗钻石"
	},
	free_time = {
		val = 1,
		desc = "免费刷新次数"
	},
	best_egg_max = {
		val = 1,
		desc = "极品蛋出现个数上限"
	},
	lucky_min = {
		val = 8,
		desc = "极品蛋出现所需幸运值下限"
	},
	refresh_gold = {
		val = 500000,
		desc = "刷新所需钻石"
	},
	add_lucky = {
		val = 1,
		desc = "砸蛋加幸运值"
	},
	egg_num = {
		val = 6,
		desc = "金蛋数量"
	},
	lucky_max = {
		val = 8,
		desc = "幸运值上限"
	},
	record_len = {
		val = 30,
		desc = "全服记录条数"
	},
	open_lev = {
		val = 10,
		desc = "开放等级"
	}
}

function Config.BreakEggData.data_const_fun(slot0)
	slot1 = Config.BreakEggData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.BreakEggData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.BreakEggData.data_award_length = 4
Config.BreakEggData.data_award = {
	{
		num = 1,
		bid = 99956,
		show_effect = 1
	},
	{
		num = 1,
		bid = 39528,
		show_effect = 1
	},
	{
		num = 1,
		bid = 39527,
		show_effect = 1
	},
	{
		num = 1,
		bid = 641236,
		show_effect = 1
	}
}

function Config.BreakEggData.data_award_fun(slot0)
	slot1 = Config.BreakEggData.data_award[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.BreakEggData.data_award[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
