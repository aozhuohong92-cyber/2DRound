Config = Config or {}
Config.RecruitHolidayData = Config.RecruitHolidayData or {}
Config.RecruitHolidayData.data_const_length = 3
Config.RecruitHolidayData.data_const = {
	common_s = {
		val = 10407,
		key = "common_s",
		desc = "召唤道具ID"
	},
	common_time = {
		val = 1,
		key = "common_time",
		desc = "特殊召唤每天免费次数"
	},
	c_interval = {
		val = 86400,
		key = "c_interval",
		desc = "普通召唤免费次数间隔/s"
	}
}

function Config.RecruitHolidayData.data_const_fun(slot0)
	slot1 = Config.RecruitHolidayData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitHolidayData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RecruitHolidayData.data_action_length = 59
Config.RecruitHolidayData.data_action = {
	[14012] = {
		group_id = 100,
		camp_id = 14012,
		desc = "活动期间，抽取限定卡池必定获取以下奖励中的一件\n每次10连招募必定获得4星及以上英雄"
	},
	[17012] = {
		group_id = 101,
		camp_id = 17012,
		desc = "活动期间，抽取限定卡池必定获取以下奖励中的一件\n每次10连招募必定获得4星及以上英雄"
	},
	[22010] = {
		group_id = 102,
		camp_id = 22010,
		desc = "活动期间，抽取限定卡池中可以抽取到高级召唤卡池中的所有英雄。同时，5星光明英雄【拉斐尔】的获取概率大幅提升！（抽中5星时有20%概率获取拉斐尔）\n每次10连招募必定获得4星及以上英雄"
	},
	[26001] = {
		group_id = 103,
		camp_id = 26001,
		desc = "活动期间，抽取限定卡池中可以抽取到高级召唤卡池中的所有英雄。同时，5星风系英雄【芬尼尔】的获取概率大幅提升！（抽中5星时有20%概率获取芬尼尔）\n每次10连招募必定获得4星及以上英雄"
	},
	[29012] = {
		group_id = 104,
		camp_id = 29012,
		desc = "活动期间，抽取限定卡池中可以抽取到高级召唤卡池中的所有英雄。同时，5星暗系英雄【海拉】的获取概率大幅提升！（抽中5星时有20%概率获取海拉）\n每次10连招募必定获得4星及以上英雄"
	},
	[32014] = {
		group_id = 105,
		camp_id = 32014,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【拉塔托斯克】的获取概率大幅提升！</div>（抽中5星时有20%概率获取 拉塔托斯克）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[35013] = {
		group_id = 106,
		camp_id = 35013,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【酒神】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【酒神】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算
5.召唤概率（整体）：
         酒神                1% 
         其他5星        4% 
         4星英雄        15% 
         3星英雄        80%]]
	},
	[37012] = {
		group_id = 107,
		camp_id = 37012,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【维纳斯】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【维纳斯】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[41013] = {
		group_id = 108,
		camp_id = 41013,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【哪吒】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【哪吒】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[45013] = {
		group_id = 109,
		camp_id = 45013,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【尼德霍格】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【尼德霍格】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[47013] = {
		group_id = 110,
		camp_id = 47013,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【辛西娅】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【辛西娅】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[49211] = {
		group_id = 111,
		camp_id = 49211,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【海姆达尔】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【海姆达尔】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[49611] = {
		group_id = 112,
		camp_id = 49611,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【阿蒙】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【阿蒙】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[49831] = {
		group_id = 113,
		camp_id = 49831,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【加百列】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【加百列】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[49931] = {
		group_id = 114,
		camp_id = 49931,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【利维坦】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【利维坦】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50095] = {
		group_id = 115,
		camp_id = 50095,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【巴雷特】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【巴雷特】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50272] = {
		group_id = 116,
		camp_id = 50272,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【奎因】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【奎因】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50292] = {
		group_id = 117,
		camp_id = 50292,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【雷玖】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【雷玖】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50572] = {
		group_id = 118,
		camp_id = 50572,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【路飞】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【路飞】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50592] = {
		group_id = 119,
		camp_id = 50592,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【尼卡】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【尼卡】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50612] = {
		group_id = 120,
		camp_id = 50612,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【凯多（神龙）】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【凯多（神龙）】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50632] = {
		group_id = 121,
		camp_id = 50632,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【金狮子·史基】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【金狮子·史基】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50653] = {
		group_id = 122,
		camp_id = 50653,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【战国大佛】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【战国大佛】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50674] = {
		group_id = 123,
		camp_id = 50674,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【三大将藤虎】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【三大将藤虎】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50694] = {
		group_id = 124,
		camp_id = 50694,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【凯撒】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【凯撒】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50715] = {
		group_id = 125,
		camp_id = 50715,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【黑胡子】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【黑胡子】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50739] = {
		group_id = 126,
		camp_id = 50739,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【山治（杰尔马）】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【山治（杰尔马）】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50761] = {
		group_id = 127,
		camp_id = 50761,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【猫蝮蛇】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【猫蝮蛇】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50781] = {
		group_id = 128,
		camp_id = 50781,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【猫蝮蛇】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【猫蝮蛇】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50802] = {
		group_id = 129,
		camp_id = 50802,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【萨坦圣】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【萨坦圣】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50829] = {
		group_id = 130,
		camp_id = 50829,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【萨坦圣】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【萨坦圣】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50850] = {
		group_id = 131,
		camp_id = 50850,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【女帝】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【女帝】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50872] = {
		group_id = 132,
		camp_id = 50872,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【克力架】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【克力架】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50919] = {
		group_id = 133,
		camp_id = 50919,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【斯慕吉】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【斯慕吉】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50947] = {
		group_id = 134,
		camp_id = 50947,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【罗杰】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【罗杰】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[50975] = {
		group_id = 135,
		camp_id = 50975,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【未来流行·鹰眼】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【未来流行·鹰眼】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51029] = {
		group_id = 136,
		camp_id = 51029,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【乌索普(新世界)】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【乌索普(新世界)】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51083] = {
		group_id = 137,
		camp_id = 51083,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【弗兰奇(新世界)】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【弗兰奇(新世界)】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51111] = {
		group_id = 138,
		camp_id = 51111,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【佩罗娜】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【佩罗娜】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51195] = {
		group_id = 139,
		camp_id = 51195,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【布鲁克】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【布鲁克】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51224] = {
		group_id = 140,
		camp_id = 51224,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【巴托洛米奥】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【巴托洛米奥】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51281] = {
		group_id = 141,
		camp_id = 51281,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【艾斯（龙年）】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【艾斯（龙年）】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51336] = {
		group_id = 142,
		camp_id = 51336,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【乌塔(世界歌姬)】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【乌塔(世界歌姬)】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51418] = {
		group_id = 143,
		camp_id = 51418,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【炎灾-烬】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【炎灾-烬】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51474] = {
		group_id = 144,
		camp_id = 51474,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【库赞】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【库赞】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51530] = {
		group_id = 145,
		camp_id = 51530,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【狼刑】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【狼刑】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51586] = {
		group_id = 146,
		camp_id = 51586,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【佩罗斯】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【佩罗斯】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51697] = {
		group_id = 147,
		camp_id = 51697,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【伽治】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【伽治】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51754] = {
		group_id = 148,
		camp_id = 51754,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【绿牛】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【绿牛】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51811] = {
		group_id = 149,
		camp_id = 51811,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【伊治】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【伊治】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51868] = {
		group_id = 150,
		camp_id = 51868,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【索隆】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【索隆】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[51951] = {
		group_id = 151,
		camp_id = 51951,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【日奈】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【日奈】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[52034] = {
		group_id = 152,
		camp_id = 52034,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【大和】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【大和】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[52118] = {
		group_id = 153,
		camp_id = 52118,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【玲玲】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【玲玲】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[52201] = {
		group_id = 154,
		camp_id = 52201,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【路飞】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【路飞】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[52339] = {
		group_id = 155,
		camp_id = 52339,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【尼治】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【尼治】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[52449] = {
		group_id = 156,
		camp_id = 52449,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【贝克曼】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【贝克曼】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[52587] = {
		group_id = 157,
		camp_id = 52587,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【路飞】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【路飞】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	},
	[52699] = {
		group_id = 158,
		camp_id = 52699,
		desc = [[
1.活动期间，抽取限定召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>【贝克曼】的获取概率大幅提升！</div>（抽中5星时有20%概率获取【贝克曼】）
2.每次10连招募必定获得<div fontcolor=#c23f35>4星及以上英雄</div>
3.在限定召唤中，草帽,强者,海贼系每110次（五皇,海军系150次）招募，<div fontcolor=#c23f35>必定获取当期概率提升的5星英雄</div>。
4.通过限定召唤获取到本期概率提升5星英雄时，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算]]
	}
}

function Config.RecruitHolidayData.data_action_fun(slot0)
	slot1 = Config.RecruitHolidayData.data_action[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitHolidayData.data_action[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RecruitHolidayData.data_summon_length = 59
Config.RecruitHolidayData.data_summon = {
	[100] = {
		name = "限定召唤_洛基",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 100,
		res_id = 1,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[101] = {
		name = "限定召唤_耶梦加得",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 101,
		res_id = 1,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[102] = {
		name = "限定召唤_圣拉斐尔",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 102,
		res_id = 2,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[103] = {
		name = "限定召唤_芬尼尔",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 103,
		res_id = 2,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[104] = {
		name = "限定召唤_海拉",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 104,
		res_id = 2,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[105] = {
		name = "限定召唤_拉塔托斯克",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 105,
		res_id = 2,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[106] = {
		name = "限定召唤_狄俄尼索斯",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 106,
		res_id = 2,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[107] = {
		name = "限定召唤_维纳斯",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 107,
		res_id = 3,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[108] = {
		name = "限定召唤_哪吒",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 108,
		res_id = 4,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[109] = {
		name = "限定召唤_尼德霍格",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 109,
		res_id = 5,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[110] = {
		name = "限定召唤_辛西娅",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 110,
		res_id = 6,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[111] = {
		name = "限定召唤_海姆达尔",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 111,
		res_id = 7,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[112] = {
		name = "限定召唤_阿蒙",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 112,
		res_id = 8,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[113] = {
		name = "限定召唤_加百列",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 113,
		res_id = 9,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[114] = {
		name = "限定召唤_利维坦",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 114,
		res_id = 10,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[115] = {
		name = "限定召唤_巴雷特",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 115,
		res_id = 11,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[116] = {
		name = "限定召唤_奎因",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 116,
		res_id = 12,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[117] = {
		name = "限定召唤_雷玖",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 117,
		res_id = 2,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[118] = {
		name = "限定召唤_雷玖",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 118,
		res_id = 14,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[119] = {
		name = "限定召唤_尼卡",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 119,
		res_id = 15,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[120] = {
		name = "限定召唤_凯多（神龙）",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 120,
		res_id = 16,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[121] = {
		name = "限定召唤_金狮子·史基",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 121,
		res_id = 17,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[122] = {
		name = "限定召唤_战国大佛",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 122,
		res_id = 18,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[123] = {
		name = "限定召唤_三大将藤虎",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 123,
		res_id = 19,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[124] = {
		name = "限定召唤_凯撒",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 124,
		res_id = 20,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[125] = {
		name = "限定召唤_黑胡子",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 125,
		res_id = 21,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[126] = {
		name = "限定召唤_山治（杰尔马）",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 126,
		res_id = 22,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[127] = {
		name = "限定召唤_猫蝮蛇",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 127,
		res_id = 23,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[128] = {
		name = "限定召唤_猫蝮蛇",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 128,
		res_id = 23,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[129] = {
		name = "限定召唤_萨坦圣",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 129,
		res_id = 24,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[130] = {
		name = "限定召唤_萨坦圣",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 130,
		res_id = 24,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[131] = {
		name = "限定召唤_女帝",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 131,
		res_id = 25,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[132] = {
		name = "限定召唤_克力架",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 132,
		res_id = 26,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[133] = {
		name = "限定召唤_克力架",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 133,
		res_id = 27,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[134] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 134,
		res_id = 28,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[135] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 135,
		res_id = 29,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[136] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 136,
		res_id = 30,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[137] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 137,
		res_id = 31,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[138] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 138,
		res_id = 32,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[139] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 139,
		res_id = 33,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[140] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 140,
		res_id = 34,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[141] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 141,
		res_id = 35,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[142] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 142,
		res_id = 36,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[143] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 143,
		res_id = 37,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[144] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 144,
		res_id = 38,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[145] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 145,
		res_id = 39,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[146] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 146,
		res_id = 40,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[147] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 147,
		res_id = 41,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[148] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 148,
		res_id = 42,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[149] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 149,
		res_id = 43,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[150] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 150,
		res_id = 44,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[151] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 151,
		res_id = 45,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[152] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 152,
		res_id = 46,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[153] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 153,
		res_id = 47,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[154] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 154,
		res_id = 48,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[155] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 155,
		res_id = 49,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[156] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 156,
		res_id = 50,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[157] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 157,
		res_id = 48,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	},
	[158] = {
		name = "限定召唤_罗杰",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg = "partnersummon_call_bg_100",
		group_id = 158,
		res_id = 48,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				220
			}
		},
		loss_gold_ten = {
			{
				3,
				2000
			}
		},
		loss_item_once = {
			{
				10407,
				1
			}
		},
		loss_item_ten = {
			{
				10407,
				10
			}
		}
	}
}

function Config.RecruitHolidayData.data_summon_fun(slot0)
	slot1 = Config.RecruitHolidayData.data_summon[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitHolidayData.data_summon[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RecruitHolidayData.data_award_length = 59
Config.RecruitHolidayData.data_award = {
	[14012] = {
		{
			id = 1,
			camp_id = 14012,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 14012,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 14012,
			times = 100,
			reward = {
				{
					29205,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 14012,
			times = 200,
			reward = {
				{
					24900,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 14012,
			times = 300,
			reward = {
				{
					25908,
					50
				}
			}
		}
	},
	[17012] = {
		{
			id = 1,
			camp_id = 17012,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 17012,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 17012,
			times = 100,
			reward = {
				{
					29105,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 17012,
			times = 200,
			reward = {
				{
					26905,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 17012,
			times = 300,
			reward = {
				{
					24909,
					50
				}
			}
		}
	},
	[22010] = {
		{
			id = 1,
			camp_id = 22010,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 22010,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 22010,
			times = 100,
			reward = {
				{
					29405,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 22010,
			times = 200,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 22010,
			times = 300,
			reward = {
				{
					27907,
					50
				}
			}
		}
	},
	[26001] = {
		{
			id = 1,
			camp_id = 26001,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 26001,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 26001,
			times = 100,
			reward = {
				{
					29105,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 26001,
			times = 200,
			reward = {
				{
					26905,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 26001,
			times = 300,
			reward = {
				{
					28907,
					50
				}
			}
		}
	},
	[29012] = {
		{
			id = 1,
			camp_id = 29012,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 29012,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 29012,
			times = 100,
			reward = {
				{
					29505,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 29012,
			times = 200,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 29012,
			times = 300,
			reward = {
				{
					28907,
					50
				}
			}
		}
	},
	[32014] = {
		{
			id = 1,
			camp_id = 32014,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 32014,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 32014,
			times = 100,
			reward = {
				{
					29305,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 32014,
			times = 200,
			reward = {
				{
					29305,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 32014,
			times = 300,
			reward = {
				{
					26909,
					50
				}
			}
		}
	},
	[35013] = {
		{
			id = 1,
			camp_id = 35013,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 35013,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 35013,
			times = 100,
			reward = {
				{
					29105,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 35013,
			times = 200,
			reward = {
				{
					29105,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 35013,
			times = 300,
			reward = {
				{
					24910,
					50
				}
			}
		}
	},
	[37012] = {
		{
			id = 1,
			camp_id = 37012,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 37012,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 37012,
			times = 100,
			reward = {
				{
					29405,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 37012,
			times = 200,
			reward = {
				{
					29105,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 37012,
			times = 300,
			reward = {
				{
					27908,
					50
				}
			}
		}
	},
	[41013] = {
		{
			id = 1,
			camp_id = 41013,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 41013,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 41013,
			times = 100,
			reward = {
				{
					29205,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 41013,
			times = 200,
			reward = {
				{
					29205,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 41013,
			times = 300,
			reward = {
				{
					25909,
					50
				}
			}
		}
	},
	[45013] = {
		{
			id = 1,
			camp_id = 45013,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 45013,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 45013,
			times = 100,
			reward = {
				{
					29505,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 45013,
			times = 200,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 45013,
			times = 300,
			reward = {
				{
					28908,
					50
				}
			}
		}
	},
	[47013] = {
		{
			id = 1,
			camp_id = 47013,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 47013,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 47013,
			times = 100,
			reward = {
				{
					29305,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 47013,
			times = 200,
			reward = {
				{
					29305,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 47013,
			times = 300,
			reward = {
				{
					26910,
					50
				}
			}
		}
	},
	[49211] = {
		{
			id = 1,
			camp_id = 49211,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 49211,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 49211,
			times = 100,
			reward = {
				{
					29205,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 49211,
			times = 200,
			reward = {
				{
					29205,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 49211,
			times = 300,
			reward = {
				{
					25910,
					50
				}
			}
		}
	},
	[49611] = {
		{
			id = 1,
			camp_id = 49611,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 49611,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 49611,
			times = 100,
			reward = {
				{
					29505,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 49611,
			times = 200,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 49611,
			times = 300,
			reward = {
				{
					28909,
					50
				}
			}
		}
	},
	[49831] = {
		{
			id = 1,
			camp_id = 49831,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 49831,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 49831,
			times = 100,
			reward = {
				{
					29405,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 49831,
			times = 200,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 49831,
			times = 300,
			reward = {
				{
					27909,
					50
				}
			}
		}
	},
	[49931] = {
		{
			id = 1,
			camp_id = 49931,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 49931,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 49931,
			times = 100,
			reward = {
				{
					29105,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 49931,
			times = 200,
			reward = {
				{
					29105,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 49931,
			times = 300,
			reward = {
				{
					24911,
					50
				}
			}
		}
	},
	[50095] = {
		{
			id = 1,
			camp_id = 50095,
			times = 30,
			reward = {
				{
					10408,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50095,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50095,
			times = 100,
			reward = {
				{
					29105,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50095,
			times = 200,
			reward = {
				{
					29105,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50095,
			times = 300,
			reward = {
				{
					24911,
					50
				}
			}
		}
	},
	[50272] = {
		{
			id = 1,
			camp_id = 50272,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50272,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50272,
			times = 100,
			reward = {
				{
					29105,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50272,
			times = 200,
			reward = {
				{
					29105,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50272,
			times = 300,
			reward = {
				{
					28916,
					50
				}
			}
		}
	},
	[50292] = {
		{
			id = 1,
			camp_id = 50292,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50292,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50292,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50292,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50292,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50292,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50292,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50292,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50292,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50292,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50292,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50572] = {
		{
			id = 1,
			camp_id = 50572,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50572,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50572,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50572,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50572,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50572,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50572,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50572,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50572,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50572,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50572,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50592] = {
		{
			id = 1,
			camp_id = 50592,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50592,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50592,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50592,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50592,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50592,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50592,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50592,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50592,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50592,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50592,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50612] = {
		{
			id = 1,
			camp_id = 50612,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50612,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50612,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50612,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50612,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50612,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50612,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50612,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50612,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50612,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50612,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50632] = {
		{
			id = 1,
			camp_id = 50632,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50632,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50632,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50632,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50632,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50632,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50632,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50632,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50632,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50632,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50632,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50653] = {
		{
			id = 1,
			camp_id = 50653,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50653,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50653,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50653,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50653,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50653,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50653,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50653,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50653,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50653,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50653,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50674] = {
		{
			id = 1,
			camp_id = 50674,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50674,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50674,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50674,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50674,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50674,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50674,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50674,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50674,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50674,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50674,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50694] = {
		{
			id = 1,
			camp_id = 50694,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50694,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50694,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50694,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50694,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50694,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50694,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50694,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50694,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50694,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50694,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50715] = {
		{
			id = 1,
			camp_id = 50715,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50715,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50715,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50715,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50715,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50715,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50715,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50715,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50715,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50715,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50715,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50739] = {
		{
			id = 1,
			camp_id = 50739,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50739,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50739,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50739,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50739,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50739,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50739,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50739,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50739,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50739,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50739,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50761] = {
		{
			id = 1,
			camp_id = 50761,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50761,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50761,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50761,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50761,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50761,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50761,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50761,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50761,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50761,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50761,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50781] = {
		{
			id = 1,
			camp_id = 50781,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50781,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50781,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50781,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50781,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50781,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50781,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50781,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50781,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50781,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50781,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50802] = {
		{
			id = 1,
			camp_id = 50802,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50802,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50802,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50802,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50802,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50802,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50802,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50802,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50802,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50802,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50802,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50829] = {
		{
			id = 1,
			camp_id = 50829,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50829,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50829,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50829,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50829,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50829,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50829,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50829,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50829,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50829,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50829,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50850] = {
		{
			id = 1,
			camp_id = 50850,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50850,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50850,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50850,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50850,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50850,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50850,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50850,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50850,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50850,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50850,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50872] = {
		{
			id = 1,
			camp_id = 50872,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50872,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50872,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50872,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50872,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50872,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50872,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50872,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50872,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50872,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50872,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50919] = {
		{
			id = 1,
			camp_id = 50919,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50919,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50919,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50919,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50919,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50919,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50919,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50919,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50919,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50919,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50919,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50947] = {
		{
			id = 1,
			camp_id = 50947,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50947,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50947,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50947,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50947,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50947,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50947,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50947,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50947,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50947,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50947,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[50975] = {
		{
			id = 1,
			camp_id = 50975,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 50975,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 50975,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 50975,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 50975,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 50975,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 50975,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 50975,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 50975,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 50975,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 50975,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51029] = {
		{
			id = 1,
			camp_id = 51029,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51029,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51029,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51029,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51029,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51029,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51029,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51029,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51029,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51029,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51029,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51083] = {
		{
			id = 1,
			camp_id = 51083,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51083,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51083,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51083,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51083,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51083,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51083,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51083,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51083,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51083,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51083,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51111] = {
		{
			id = 1,
			camp_id = 51111,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51111,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51111,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51111,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51111,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51111,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51111,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51111,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51111,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51111,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51111,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51195] = {
		{
			id = 1,
			camp_id = 51195,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51195,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51195,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51195,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51195,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51195,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51195,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51195,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51195,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51195,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51195,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51224] = {
		{
			id = 1,
			camp_id = 51224,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51224,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51224,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51224,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51224,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51224,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51224,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51224,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51224,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51224,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51224,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51281] = {
		{
			id = 1,
			camp_id = 51281,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51281,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51281,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51281,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51281,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51281,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51281,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51281,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51281,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51281,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51281,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51336] = {
		{
			id = 1,
			camp_id = 51336,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51336,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51336,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51336,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51336,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51336,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51336,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51336,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51336,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51336,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51336,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51418] = {
		{
			id = 1,
			camp_id = 51418,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51418,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51418,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51418,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51418,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51418,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51418,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51418,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51418,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51418,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51418,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51474] = {
		{
			id = 1,
			camp_id = 51474,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51474,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51474,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51474,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51474,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51474,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51474,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51474,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51474,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51474,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51474,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51530] = {
		{
			id = 1,
			camp_id = 51530,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51530,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51530,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51530,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51530,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51530,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51530,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51530,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51530,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51530,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51530,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51586] = {
		{
			id = 1,
			camp_id = 51586,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51586,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51586,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51586,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51586,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51586,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51586,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51586,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51586,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51586,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51586,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51697] = {
		{
			id = 1,
			camp_id = 51697,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51697,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51697,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51697,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51697,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51697,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51697,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51697,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51697,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51697,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51697,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51754] = {
		{
			id = 1,
			camp_id = 51754,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51754,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51754,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51754,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51754,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51754,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51754,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51754,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51754,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51754,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51754,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51811] = {
		{
			id = 1,
			camp_id = 51811,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51811,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51811,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51811,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51811,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51811,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51811,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51811,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51811,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51811,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51811,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51868] = {
		{
			id = 1,
			camp_id = 51868,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51868,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51868,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51868,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51868,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51868,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51868,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51868,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51868,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51868,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51868,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[51951] = {
		{
			id = 1,
			camp_id = 51951,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 51951,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 51951,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 51951,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 51951,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 51951,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 51951,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 51951,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 51951,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 51951,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 51951,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[52034] = {
		{
			id = 1,
			camp_id = 52034,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 52034,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 52034,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 52034,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 52034,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 52034,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 52034,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 52034,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 52034,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 52034,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 52034,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[52118] = {
		{
			id = 1,
			camp_id = 52118,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 52118,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 52118,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 52118,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 52118,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 52118,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 52118,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 52118,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 52118,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 52118,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 52118,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[52201] = {
		{
			id = 1,
			camp_id = 52201,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 52201,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 52201,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 52201,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 52201,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 52201,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 52201,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 52201,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 52201,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 52201,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 52201,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[52339] = {
		{
			id = 1,
			camp_id = 52339,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 52339,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 52339,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 52339,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 52339,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 52339,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 52339,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 52339,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 52339,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 52339,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 52339,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[52449] = {
		{
			id = 1,
			camp_id = 52449,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 52449,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 52449,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 52449,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 52449,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 52449,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 52449,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 52449,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 52449,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 52449,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 52449,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[52587] = {
		{
			id = 1,
			camp_id = 52587,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 52587,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 52587,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 52587,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 52587,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 52587,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 52587,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 52587,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 52587,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 52587,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 52587,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	},
	[52699] = {
		{
			id = 1,
			camp_id = 52699,
			times = 30,
			reward = {
				{
					10407,
					3
				}
			}
		},
		{
			id = 2,
			camp_id = 52699,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			}
		},
		{
			id = 3,
			camp_id = 52699,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			}
		},
		{
			id = 4,
			camp_id = 52699,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			}
		},
		{
			id = 5,
			camp_id = 52699,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			}
		},
		{
			id = 6,
			camp_id = 52699,
			times = 400,
			reward = {
				{
					641232,
					1
				}
			}
		},
		{
			id = 7,
			camp_id = 52699,
			times = 500,
			reward = {
				{
					641233,
					1
				}
			}
		},
		{
			id = 8,
			camp_id = 52699,
			times = 600,
			reward = {
				{
					641234,
					1
				}
			}
		},
		{
			id = 9,
			camp_id = 52699,
			times = 700,
			reward = {
				{
					641235,
					1
				}
			}
		},
		{
			id = 10,
			camp_id = 52699,
			times = 800,
			reward = {
				{
					541236,
					1
				}
			}
		},
		{
			id = 11,
			camp_id = 52699,
			times = 900,
			reward = {
				{
					641236,
					1
				}
			}
		}
	}
}
Config.RecruitHolidayData.data_probability_length = 59
Config.RecruitHolidayData.data_probability = {
	[100] = {
		{
			num = 1,
			name = "洛基",
			probability = "126",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 25408,
			group_id = 100,
			star = "5星"
		},
		{
			num = 1,
			name = "娜迦公主",
			probability = "118",
			index = 2,
			is_chip = 0,
			is_up = 1,
			id = 24400,
			group_id = 100,
			star = "5星"
		},
		{
			num = 1,
			name = "美杜莎",
			probability = "122",
			index = 3,
			is_chip = 0,
			is_up = 1,
			id = 26404,
			group_id = 100,
			star = "5星"
		},
		{
			num = 1,
			name = "蛇女墨莎",
			probability = "67",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 28400,
			group_id = 100,
			star = "5星"
		},
		{
			num = 1,
			name = "盖亚",
			probability = "67",
			index = 5,
			is_chip = 0,
			is_up = 0,
			id = 27404,
			group_id = 100,
			star = "5星"
		},
		{
			num = 0,
			name = "冰晶女巫",
			probability = "258",
			index = 6,
			is_chip = 0,
			is_up = 0,
			id = 24303,
			group_id = 100,
			star = "4星"
		},
		{
			num = 0,
			name = "竖琴海妖",
			probability = "258",
			index = 7,
			is_chip = 0,
			is_up = 0,
			id = 24301,
			group_id = 100,
			star = "4星"
		},
		{
			num = 0,
			name = "火枪艾克",
			probability = "258",
			index = 8,
			is_chip = 0,
			is_up = 0,
			id = 25300,
			group_id = 100,
			star = "4星"
		},
		{
			num = 0,
			name = "雷诺蛮锤",
			probability = "258",
			index = 9,
			is_chip = 0,
			is_up = 0,
			id = 25303,
			group_id = 100,
			star = "4星"
		},
		{
			num = 0,
			name = "亡灵收割者",
			probability = "258",
			index = 10,
			is_chip = 0,
			is_up = 0,
			id = 26301,
			group_id = 100,
			star = "4星"
		},
		{
			num = 0,
			name = "甘道夫",
			probability = "258",
			index = 11,
			is_chip = 0,
			is_up = 0,
			id = 26303,
			group_id = 100,
			star = "4星"
		},
		{
			num = 0,
			name = "光明牧师",
			probability = "186",
			index = 12,
			is_chip = 0,
			is_up = 0,
			id = 27300,
			group_id = 100,
			star = "4星"
		},
		{
			num = 0,
			name = "精灵王子",
			probability = "186",
			index = 13,
			is_chip = 0,
			is_up = 0,
			id = 27302,
			group_id = 100,
			star = "4星"
		},
		{
			num = 0,
			name = "毒咒女巫",
			probability = "186",
			index = 14,
			is_chip = 0,
			is_up = 0,
			id = 28300,
			group_id = 100,
			star = "4星"
		},
		{
			num = 0,
			name = "黑精灵密言",
			probability = "186",
			index = 15,
			is_chip = 0,
			is_up = 0,
			id = 28303,
			group_id = 100,
			star = "4星"
		},
		{
			num = 0,
			name = "5星随机碎片",
			probability = "2407",
			index = 16,
			is_chip = 1,
			is_up = 0,
			id = 29905,
			group_id = 100,
			star = "道具"
		},
		{
			num = 0,
			name = "4星随机碎片",
			probability = "4801",
			index = 17,
			is_chip = 1,
			is_up = 0,
			id = 29904,
			group_id = 100,
			star = "道具"
		}
	},
	[101] = {
		{
			num = 1,
			name = "耶梦加得",
			probability = "126",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 24409,
			group_id = 101,
			star = "5星"
		},
		{
			num = 1,
			name = "雅典娜",
			probability = "118",
			index = 2,
			is_chip = 0,
			is_up = 1,
			id = 26405,
			group_id = 101,
			star = "5星"
		},
		{
			num = 1,
			name = "剑豪卡赞",
			probability = "122",
			index = 3,
			is_chip = 0,
			is_up = 1,
			id = 25402,
			group_id = 101,
			star = "5星"
		},
		{
			num = 1,
			name = "路西法",
			probability = "67",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 28405,
			group_id = 101,
			star = "5星"
		},
		{
			num = 1,
			name = "伊西斯",
			probability = "67",
			index = 5,
			is_chip = 0,
			is_up = 0,
			id = 27400,
			group_id = 101,
			star = "5星"
		},
		{
			num = 0,
			name = "亚瑟",
			probability = "258",
			index = 6,
			is_chip = 0,
			is_up = 0,
			id = 24300,
			group_id = 101,
			star = "4星"
		},
		{
			num = 0,
			name = "水元素",
			probability = "258",
			index = 7,
			is_chip = 0,
			is_up = 0,
			id = 24302,
			group_id = 101,
			star = "4星"
		},
		{
			num = 0,
			name = "阿伽门农",
			probability = "258",
			index = 8,
			is_chip = 0,
			is_up = 0,
			id = 25302,
			group_id = 101,
			star = "4星"
		},
		{
			num = 0,
			name = "凯瑟琳",
			probability = "258",
			index = 9,
			is_chip = 0,
			is_up = 0,
			id = 25301,
			group_id = 101,
			star = "4星"
		},
		{
			num = 0,
			name = "吟游诗人",
			probability = "258",
			index = 10,
			is_chip = 0,
			is_up = 0,
			id = 26300,
			group_id = 101,
			star = "4星"
		},
		{
			num = 0,
			name = "德鲁伊",
			probability = "258",
			index = 11,
			is_chip = 0,
			is_up = 0,
			id = 26304,
			group_id = 101,
			star = "4星"
		},
		{
			num = 0,
			name = "月之祭司",
			probability = "186",
			index = 12,
			is_chip = 0,
			is_up = 0,
			id = 27301,
			group_id = 101,
			star = "4星"
		},
		{
			num = 0,
			name = "丘比特",
			probability = "186",
			index = 13,
			is_chip = 0,
			is_up = 0,
			id = 27303,
			group_id = 101,
			star = "4星"
		},
		{
			num = 0,
			name = "死亡骑士",
			probability = "186",
			index = 14,
			is_chip = 0,
			is_up = 0,
			id = 28301,
			group_id = 101,
			star = "4星"
		},
		{
			num = 0,
			name = "阿喀琉斯",
			probability = "186",
			index = 15,
			is_chip = 0,
			is_up = 0,
			id = 28302,
			group_id = 101,
			star = "4星"
		},
		{
			num = 0,
			name = "5星随机碎片",
			probability = "2407",
			index = 16,
			is_chip = 1,
			is_up = 0,
			id = 29905,
			group_id = 101,
			star = "道具"
		},
		{
			num = 0,
			name = "4星随机碎片",
			probability = "4801",
			index = 17,
			is_chip = 1,
			is_up = 0,
			id = 29904,
			group_id = 101,
			star = "道具"
		}
	},
	[102] = {
		{
			num = 1,
			name = "拉斐尔",
			probability = "100",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 27407,
			group_id = 102,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "400",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 102,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "1500",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 102,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "8000",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 102,
			star = "3星"
		}
	},
	[103] = {
		{
			num = 1,
			name = "芬尼尔",
			probability = "100",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 26408,
			group_id = 103,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "400",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 103,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "1500",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 103,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "8000",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 103,
			star = "3星"
		}
	},
	[104] = {
		{
			num = 1,
			name = "海拉",
			probability = "100",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 28407,
			group_id = 104,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "400",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 104,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "1500",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 104,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "8000",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 104,
			star = "3星"
		}
	},
	[105] = {
		{
			num = 1,
			name = "拉塔托斯克",
			probability = "100",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 26409,
			group_id = 105,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "400",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 105,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "1500",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 105,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "8000",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 105,
			star = "3星"
		}
	},
	[106] = {
		{
			num = 1,
			name = "酒神",
			probability = "1.021",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 24410,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "娜迦公主",
			probability = "0.059",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "冰雪女王",
			probability = "0.023",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "冰霜巨龙",
			probability = "0.059",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "泰坦",
			probability = "0.023",
			index = 5,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "波塞冬",
			probability = "0.023",
			index = 6,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "派西斯",
			probability = "0.296",
			index = 7,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "少年梅林",
			probability = "0.059",
			index = 8,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "海宁芙",
			probability = "0.296",
			index = 9,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "阿瑞斯",
			probability = "0.296",
			index = 10,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "耶梦加得",
			probability = "0.023",
			index = 11,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "炽天使",
			probability = "0.059",
			index = 12,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "炎魔之王",
			probability = "0.059",
			index = 13,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "剑豪卡赞",
			probability = "0.296",
			index = 14,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "菲尼克斯",
			probability = "0.059",
			index = 15,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "阿波罗",
			probability = "0.059",
			index = 16,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "吸血伯爵",
			probability = "0.296",
			index = 17,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "普罗米修斯",
			probability = "0.023",
			index = 18,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "瓦尔基里",
			probability = "0.023",
			index = 19,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "洛基",
			probability = "0.023",
			index = 20,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "奥丁",
			probability = "0.059",
			index = 21,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "影刹",
			probability = "0.023",
			index = 22,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "凯兰崔尔",
			probability = "0.296",
			index = 23,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "魅魔女王",
			probability = "0.059",
			index = 24,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "美杜莎",
			probability = "0.296",
			index = 25,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "雅典娜",
			probability = "0.059",
			index = 26,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "潘",
			probability = "0.023",
			index = 27,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "斯芬克斯",
			probability = "0.023",
			index = 28,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "芬尼尔",
			probability = "0.023",
			index = 29,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "拉塔托斯克",
			probability = "0.023",
			index = 30,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "伊西斯",
			probability = "0.116",
			index = 31,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "宙斯",
			probability = "0.016",
			index = 32,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "赫拉",
			probability = "0.093",
			index = 33,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "雷神",
			probability = "0.093",
			index = 34,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "盖亚",
			probability = "0.116",
			index = 35,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "艾蕾莉亚",
			probability = "0.093",
			index = 36,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "神灵大祭司",
			probability = "0.016",
			index = 37,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "拉斐尔",
			probability = "0.016",
			index = 38,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "蛇女墨莎",
			probability = "0.116",
			index = 39,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "哈迪斯",
			probability = "0.016",
			index = 40,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "亚巴顿",
			probability = "0.093",
			index = 41,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "黑暗之主",
			probability = "0.016",
			index = 42,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "阿努比斯",
			probability = "0.093",
			index = 43,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "路西法",
			probability = "0.116",
			index = 44,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "潘多拉",
			probability = "0.016",
			index = 45,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "海拉",
			probability = "0.016",
			index = 46,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "5星"
		},
		{
			num = 0,
			name = "亚瑟",
			probability = "0.66",
			index = 47,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "竖琴海妖",
			probability = "0.67",
			index = 48,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "水元素",
			probability = "0.67",
			index = 49,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "冰晶女巫",
			probability = "0.67",
			index = 50,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "娜迦侍女",
			probability = "0.67",
			index = 51,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "火枪艾克",
			probability = "0.67",
			index = 52,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "凯瑟琳",
			probability = "0.67",
			index = 53,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "阿伽门农",
			probability = "0.67",
			index = 54,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "雷诺蛮锤",
			probability = "0.67",
			index = 55,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "翼女",
			probability = "0.67",
			index = 56,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "吟游诗人",
			probability = "0.67",
			index = 57,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "亡灵收割者",
			probability = "0.67",
			index = 58,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "圣锤提尔",
			probability = "0.67",
			index = 59,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "甘道夫",
			probability = "0.67",
			index = 60,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "德鲁伊",
			probability = "0.67",
			index = 61,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "光明牧师",
			probability = "0.62",
			index = 62,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "月之祭司",
			probability = "0.62",
			index = 63,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "精灵王子",
			probability = "0.62",
			index = 64,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "丘比特",
			probability = "0.62",
			index = 65,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "毒咒女巫",
			probability = "0.62",
			index = 66,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "死亡骑士",
			probability = "0.62",
			index = 67,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "阿喀琉斯",
			probability = "0.62",
			index = 68,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "黑精灵密言",
			probability = "0.62",
			index = 69,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "4星"
		},
		{
			num = 0,
			name = "魔法女学徒",
			probability = "4.8",
			index = 70,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "美狄亚",
			probability = "4.7",
			index = 71,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "破坏者",
			probability = "4.7",
			index = 72,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "咒法师",
			probability = "4.7",
			index = 73,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "月之骑士",
			probability = "4.7",
			index = 74,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			index = 75,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "末日守卫",
			probability = "4.7",
			index = 76,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "吉尔伽美什",
			probability = "4.7",
			index = 77,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "地狱火",
			probability = "4.7",
			index = 78,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "奥杜尔·铜须",
			probability = "4.7",
			index = 79,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "树人",
			probability = "4.7",
			index = 80,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "风暴猎手",
			probability = "4.7",
			index = 81,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "雷霆狮鹫",
			probability = "4.7",
			index = 82,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "岩灵",
			probability = "4.7",
			index = 83,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "游侠射手",
			probability = "4.7",
			index = 84,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "巨魔巫医",
			probability = "4.7",
			index = 85,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		},
		{
			num = 0,
			name = "光之苏尔",
			probability = "4.7",
			index = 86,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 106,
			star = "3星"
		}
	},
	[107] = {
		{
			num = 1,
			name = "维纳斯",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 27408,
			group_id = 107,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 107,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 107,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 107,
			star = "3星"
		}
	},
	[108] = {
		{
			num = 1,
			name = "哪吒",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 25409,
			group_id = 108,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 108,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 108,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 108,
			star = "3星"
		}
	},
	[109] = {
		{
			num = 1,
			name = "尼德霍格",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 28408,
			group_id = 109,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 109,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 109,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 109,
			star = "3星"
		}
	},
	[110] = {
		{
			num = 1,
			name = "辛西娅",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 26410,
			group_id = 110,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 110,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 110,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 110,
			star = "3星"
		}
	},
	[111] = {
		{
			num = 1,
			name = "海姆达尔",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 25410,
			group_id = 111,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 111,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 111,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 111,
			star = "3星"
		}
	},
	[112] = {
		{
			num = 1,
			name = "阿蒙",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 28409,
			group_id = 112,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 112,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 112,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 112,
			star = "3星"
		}
	},
	[113] = {
		{
			num = 1,
			name = "加百列",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 27409,
			group_id = 113,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 113,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 113,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 113,
			star = "3星"
		}
	},
	[114] = {
		{
			num = 1,
			name = "利维坦",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 24411,
			group_id = 114,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 114,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 114,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 114,
			star = "3星"
		}
	},
	[115] = {
		{
			num = 1,
			name = "巴雷特",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 28414,
			group_id = 115,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 115,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 115,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 115,
			star = "3星"
		}
	},
	[116] = {
		{
			num = 1,
			name = "奎因",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 28416,
			group_id = 116,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 116,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 116,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 116,
			star = "3星"
		}
	},
	[117] = {
		{
			num = 1,
			name = "雷玖",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 26414,
			group_id = 117,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 117,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 117,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 117,
			star = "3星"
		}
	},
	[118] = {
		{
			num = 1,
			name = "路飞",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29402,
			group_id = 118,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 118,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 118,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 118,
			star = "3星"
		}
	},
	[119] = {
		{
			num = 1,
			name = "尼卡",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29403,
			group_id = 119,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 119,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 119,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 119,
			star = "3星"
		}
	},
	[120] = {
		{
			num = 1,
			name = "凯多（神龙）",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29414,
			group_id = 120,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 120,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 120,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 120,
			star = "3星"
		}
	},
	[121] = {
		{
			num = 1,
			name = "金狮子·史基",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29416,
			group_id = 121,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 121,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 121,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 121,
			star = "3星"
		}
	},
	[122] = {
		{
			num = 1,
			name = "战国大佛",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29415,
			group_id = 122,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 122,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 122,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 122,
			star = "3星"
		}
	},
	[123] = {
		{
			num = 1,
			name = "藤虎三大将",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29417,
			group_id = 123,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 123,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 123,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 123,
			star = "3星"
		}
	},
	[124] = {
		{
			num = 1,
			name = "凯撒",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29418,
			group_id = 124,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 124,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 124,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 124,
			star = "3星"
		}
	},
	[125] = {
		{
			num = 1,
			name = "黑胡子",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29419,
			group_id = 125,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 125,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 125,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 125,
			star = "3星"
		}
	},
	[126] = {
		{
			num = 1,
			name = "山治（杰尔马）",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29420,
			group_id = 126,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 126,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 126,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 126,
			star = "3星"
		}
	},
	[127] = {
		{
			num = 1,
			name = "猫蝮蛇",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29421,
			group_id = 127,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 127,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 127,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 127,
			star = "3星"
		}
	},
	[128] = {
		{
			num = 1,
			name = "猫蝮蛇",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29421,
			group_id = 128,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 128,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 128,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 128,
			star = "3星"
		}
	},
	[129] = {
		{
			num = 1,
			name = "萨坦圣",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29422,
			group_id = 129,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 129,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 129,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 129,
			star = "3星"
		}
	},
	[130] = {
		{
			num = 1,
			name = "萨坦圣",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29422,
			group_id = 130,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 130,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 130,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 130,
			star = "3星"
		}
	},
	[131] = {
		{
			num = 1,
			name = "女帝",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29423,
			group_id = 131,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 131,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 131,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 131,
			star = "3星"
		}
	},
	[132] = {
		{
			num = 1,
			name = "克力架",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29424,
			group_id = 132,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 132,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 132,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 132,
			star = "3星"
		}
	},
	[133] = {
		{
			num = 1,
			name = "斯慕吉",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29425,
			group_id = 133,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 133,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 133,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 133,
			star = "3星"
		}
	},
	[134] = {
		{
			num = 1,
			name = "罗杰",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29426,
			group_id = 134,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 134,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 134,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 134,
			star = "3星"
		}
	},
	[135] = {
		{
			num = 1,
			name = "鹰眼",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29427,
			group_id = 135,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 135,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 135,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 135,
			star = "3星"
		}
	},
	[136] = {
		{
			num = 1,
			name = "乌索普",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29428,
			group_id = 136,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 136,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 136,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 136,
			star = "3星"
		}
	},
	[137] = {
		{
			num = 1,
			name = "弗兰奇",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29429,
			group_id = 137,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 137,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 137,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 137,
			star = "3星"
		}
	},
	[138] = {
		{
			num = 1,
			name = "佩罗娜",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29430,
			group_id = 138,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 138,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 138,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 138,
			star = "3星"
		}
	},
	[139] = {
		{
			num = 1,
			name = "布鲁克",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29432,
			group_id = 139,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 139,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 139,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 139,
			star = "3星"
		}
	},
	[140] = {
		{
			num = 1,
			name = "巴托洛米奥",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29431,
			group_id = 140,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 140,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 140,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 140,
			star = "3星"
		}
	},
	[141] = {
		{
			num = 1,
			name = "艾斯(龙年)",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29433,
			group_id = 141,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 141,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 141,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 141,
			star = "3星"
		}
	},
	[142] = {
		{
			num = 1,
			name = "乌塔(世界歌姬)",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29434,
			group_id = 142,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 142,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 142,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 142,
			star = "3星"
		}
	},
	[143] = {
		{
			num = 1,
			name = "烬",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29435,
			group_id = 143,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 143,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 143,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 143,
			star = "3星"
		}
	},
	[144] = {
		{
			num = 1,
			name = "库赞",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29436,
			group_id = 144,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 144,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 144,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 144,
			star = "3星"
		}
	},
	[145] = {
		{
			num = 1,
			name = "狼刑",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29437,
			group_id = 145,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 145,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 145,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 145,
			star = "3星"
		}
	},
	[146] = {
		{
			num = 1,
			name = "佩罗斯",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29438,
			group_id = 146,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 146,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 146,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 146,
			star = "3星"
		}
	},
	[147] = {
		{
			num = 1,
			name = "伽治",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29439,
			group_id = 147,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 147,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 147,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 147,
			star = "3星"
		}
	},
	[148] = {
		{
			num = 1,
			name = "绿牛",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29440,
			group_id = 148,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 148,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 148,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 148,
			star = "3星"
		}
	},
	[149] = {
		{
			num = 1,
			name = "伊治",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29441,
			group_id = 149,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 149,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 149,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 149,
			star = "3星"
		}
	},
	[150] = {
		{
			num = 1,
			name = "索隆",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29442,
			group_id = 150,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 150,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 150,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 150,
			star = "3星"
		}
	},
	[151] = {
		{
			num = 1,
			name = "日奈",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29443,
			group_id = 151,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 151,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 151,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 151,
			star = "3星"
		}
	},
	[152] = {
		{
			num = 1,
			name = "大和",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29444,
			group_id = 152,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 152,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 152,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 152,
			star = "3星"
		}
	},
	[153] = {
		{
			num = 1,
			name = "玲玲",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29445,
			group_id = 153,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 153,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 153,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 153,
			star = "3星"
		}
	},
	[154] = {
		{
			num = 1,
			name = "路飞",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29446,
			group_id = 154,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 154,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 154,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 154,
			star = "3星"
		}
	},
	[155] = {
		{
			num = 1,
			name = "尼治",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29447,
			group_id = 155,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 155,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 155,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 155,
			star = "3星"
		}
	},
	[156] = {
		{
			num = 1,
			name = "贝克曼",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29448,
			group_id = 156,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 156,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 156,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 156,
			star = "3星"
		}
	},
	[157] = {
		{
			num = 1,
			name = "路飞",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29446,
			group_id = 157,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 157,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 157,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 157,
			star = "3星"
		}
	},
	[158] = {
		{
			num = 1,
			name = "贝克曼",
			probability = "1",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 29448,
			group_id = 158,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星",
			probability = "4",
			index = 2,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 158,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 158,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 158,
			star = "3星"
		}
	}
}
Config.RecruitHolidayData.data_hero_show_length = 52
Config.RecruitHolidayData.data_hero_show = {
	[107] = {
		[27408] = {
			group_id = 107,
			name = "维纳斯",
			probability = "1.001",
			id = 27408,
			num = 1
		},
		[24400] = {
			group_id = 107,
			name = "娜迦公主",
			probability = "0.059",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 107,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 107,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 107,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 107,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 107,
			name = "派西斯",
			probability = "0.296",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 107,
			name = "少年梅林",
			probability = "0.059",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 107,
			name = "海宁芙",
			probability = "0.296",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 107,
			name = "阿瑞斯",
			probability = "0.296",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 107,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 107,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[25400] = {
			group_id = 107,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 107,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 107,
			name = "剑豪卡赞",
			probability = "0.296",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 107,
			name = "菲尼克斯",
			probability = "0.059",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 107,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 107,
			name = "吸血伯爵",
			probability = "0.295",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 107,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 107,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 107,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[26400] = {
			group_id = 107,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 107,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 107,
			name = "凯兰崔尔",
			probability = "0.295",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 107,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 107,
			name = "美杜莎",
			probability = "0.295",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 107,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 107,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 107,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 107,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 107,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 107,
			name = "伊西斯",
			probability = "0.116",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 107,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 107,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 107,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 107,
			name = "盖亚",
			probability = "0.116",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 107,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 107,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 107,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[28400] = {
			group_id = 107,
			name = "蛇女墨莎",
			probability = "0.116",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 107,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 107,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 107,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 107,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 107,
			name = "路西法",
			probability = "0.116",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 107,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 107,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[24300] = {
			group_id = 107,
			name = "亚瑟",
			probability = "0.66",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 107,
			name = "竖琴海妖",
			probability = "0.67",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 107,
			name = "水元素",
			probability = "0.67",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 107,
			name = "冰晶女巫",
			probability = "0.67",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 107,
			name = "娜迦侍女",
			probability = "0.67",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 107,
			name = "火枪艾克",
			probability = "0.67",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 107,
			name = "凯瑟琳",
			probability = "0.67",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 107,
			name = "阿伽门农",
			probability = "0.67",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 107,
			name = "雷诺蛮锤",
			probability = "0.67",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 107,
			name = "翼女",
			probability = "0.67",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 107,
			name = "吟游诗人",
			probability = "0.67",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 107,
			name = "亡灵收割者",
			probability = "0.67",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 107,
			name = "圣锤提尔",
			probability = "0.67",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 107,
			name = "甘道夫",
			probability = "0.67",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 107,
			name = "德鲁伊",
			probability = "0.67",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 107,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 107,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 107,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 107,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 107,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 107,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 107,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 107,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 107,
			name = "魔法女学徒",
			probability = "4.8",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 107,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 107,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 107,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 107,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 107,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 107,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 107,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 107,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 107,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 107,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 107,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 107,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 107,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 107,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 107,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 107,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[108] = {
		[25409] = {
			group_id = 108,
			name = "哪吒",
			probability = "1.001",
			id = 25409,
			num = 1
		},
		[24400] = {
			group_id = 108,
			name = "娜迦公主",
			probability = "0.059",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 108,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 108,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 108,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 108,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 108,
			name = "派西斯",
			probability = "0.296",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 108,
			name = "少年梅林",
			probability = "0.059",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 108,
			name = "海宁芙",
			probability = "0.296",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 108,
			name = "阿瑞斯",
			probability = "0.296",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 108,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 108,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[25400] = {
			group_id = 108,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 108,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 108,
			name = "剑豪卡赞",
			probability = "0.296",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 108,
			name = "菲尼克斯",
			probability = "0.059",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 108,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 108,
			name = "吸血伯爵",
			probability = "0.295",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 108,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 108,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 108,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[26400] = {
			group_id = 108,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 108,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 108,
			name = "凯兰崔尔",
			probability = "0.295",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 108,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 108,
			name = "美杜莎",
			probability = "0.295",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 108,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 108,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 108,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 108,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 108,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 108,
			name = "伊西斯",
			probability = "0.116",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 108,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 108,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 108,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 108,
			name = "盖亚",
			probability = "0.116",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 108,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 108,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 108,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 108,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 108,
			name = "蛇女墨莎",
			probability = "0.116",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 108,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 108,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 108,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 108,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 108,
			name = "路西法",
			probability = "0.116",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 108,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 108,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[24300] = {
			group_id = 108,
			name = "亚瑟",
			probability = "0.66",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 108,
			name = "竖琴海妖",
			probability = "0.67",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 108,
			name = "水元素",
			probability = "0.67",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 108,
			name = "冰晶女巫",
			probability = "0.67",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 108,
			name = "娜迦侍女",
			probability = "0.67",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 108,
			name = "火枪艾克",
			probability = "0.67",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 108,
			name = "凯瑟琳",
			probability = "0.67",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 108,
			name = "阿伽门农",
			probability = "0.67",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 108,
			name = "雷诺蛮锤",
			probability = "0.67",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 108,
			name = "翼女",
			probability = "0.67",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 108,
			name = "吟游诗人",
			probability = "0.67",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 108,
			name = "亡灵收割者",
			probability = "0.67",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 108,
			name = "圣锤提尔",
			probability = "0.67",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 108,
			name = "甘道夫",
			probability = "0.67",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 108,
			name = "德鲁伊",
			probability = "0.67",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 108,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 108,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 108,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 108,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 108,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 108,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 108,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 108,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 108,
			name = "魔法女学徒",
			probability = "4.8",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 108,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 108,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 108,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 108,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 108,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 108,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 108,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 108,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 108,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 108,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 108,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 108,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 108,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 108,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 108,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 108,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[109] = {
		[28408] = {
			group_id = 109,
			name = "尼德霍格",
			probability = "1.001",
			id = 28408,
			num = 1
		},
		[24400] = {
			group_id = 109,
			name = "娜迦公主",
			probability = "0.059",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 109,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 109,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 109,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 109,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 109,
			name = "派西斯",
			probability = "0.291",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 109,
			name = "少年梅林",
			probability = "0.059",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 109,
			name = "海宁芙",
			probability = "0.291",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 109,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 109,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 109,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[25400] = {
			group_id = 109,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 109,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 109,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 109,
			name = "菲尼克斯",
			probability = "0.059",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 109,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 109,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 109,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 109,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 109,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 109,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[26400] = {
			group_id = 109,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 109,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 109,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 109,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 109,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 109,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 109,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 109,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 109,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 109,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 109,
			name = "伊西斯",
			probability = "0.116",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 109,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 109,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 109,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 109,
			name = "盖亚",
			probability = "0.116",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 109,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 109,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 109,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 109,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 109,
			name = "蛇女墨莎",
			probability = "0.116",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 109,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 109,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 109,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 109,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 109,
			name = "路西法",
			probability = "0.116",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 109,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 109,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[24300] = {
			group_id = 109,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 109,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 109,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 109,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 109,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 109,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 109,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 109,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 109,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 109,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 109,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 109,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 109,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 109,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 109,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 109,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 109,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 109,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 109,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 109,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 109,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 109,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 109,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 109,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 109,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 109,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 109,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 109,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 109,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 109,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 109,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 109,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 109,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 109,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 109,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 109,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 109,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 109,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 109,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 109,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[110] = {
		[26410] = {
			group_id = 110,
			name = "辛西娅",
			probability = "1.001",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 110,
			name = "娜迦公主",
			probability = "0.059",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 110,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 110,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 110,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 110,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 110,
			name = "派西斯",
			probability = "0.291",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 110,
			name = "少年梅林",
			probability = "0.059",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 110,
			name = "海宁芙",
			probability = "0.291",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 110,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 110,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 110,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[25400] = {
			group_id = 110,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 110,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 110,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 110,
			name = "菲尼克斯",
			probability = "0.059",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 110,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 110,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 110,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 110,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 110,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 110,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[26400] = {
			group_id = 110,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 110,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 110,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 110,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 110,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 110,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 110,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 110,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 110,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 110,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 110,
			name = "伊西斯",
			probability = "0.116",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 110,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 110,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 110,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 110,
			name = "盖亚",
			probability = "0.116",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 110,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 110,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 110,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 110,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 110,
			name = "蛇女墨莎",
			probability = "0.116",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 110,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 110,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 110,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 110,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 110,
			name = "路西法",
			probability = "0.116",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 110,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 110,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 110,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[24300] = {
			group_id = 110,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 110,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 110,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 110,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 110,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 110,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 110,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 110,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 110,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 110,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 110,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 110,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 110,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 110,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 110,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 110,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 110,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 110,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 110,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 110,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 110,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 110,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 110,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 110,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 110,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 110,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 110,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 110,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 110,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 110,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 110,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 110,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 110,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 110,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 110,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 110,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 110,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 110,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 110,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 110,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[111] = {
		[26410] = {
			group_id = 111,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 111,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 111,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 111,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 111,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 111,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 111,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 111,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 111,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 111,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 111,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 111,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[25400] = {
			group_id = 111,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 111,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 111,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 111,
			name = "菲尼克斯",
			probability = "0.059",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 111,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 111,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 111,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 111,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 111,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 111,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 111,
			name = "海姆达尔",
			probability = "1.001",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 111,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 111,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 111,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 111,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 111,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 111,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 111,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 111,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 111,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 111,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 111,
			name = "伊西斯",
			probability = "0.116",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 111,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 111,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 111,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 111,
			name = "盖亚",
			probability = "0.116",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 111,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 111,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 111,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 111,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 111,
			name = "蛇女墨莎",
			probability = "0.116",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 111,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 111,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 111,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 111,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 111,
			name = "路西法",
			probability = "0.116",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 111,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 111,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 111,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[24300] = {
			group_id = 111,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 111,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 111,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 111,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 111,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 111,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 111,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 111,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 111,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 111,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 111,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 111,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 111,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 111,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 111,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 111,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 111,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 111,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 111,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 111,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 111,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 111,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 111,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 111,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 111,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 111,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 111,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 111,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 111,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 111,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 111,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 111,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 111,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 111,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 111,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 111,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 111,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 111,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 111,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 111,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[112] = {
		[26410] = {
			group_id = 112,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 112,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 112,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 112,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 112,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 112,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 112,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 112,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 112,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 112,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 112,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 112,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[25400] = {
			group_id = 112,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 112,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 112,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 112,
			name = "菲尼克斯",
			probability = "0.116",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 112,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 112,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 112,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 112,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 112,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 112,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 112,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 112,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 112,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 112,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 112,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 112,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 112,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 112,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 112,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 112,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 112,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 112,
			name = "伊西斯",
			probability = "0.116",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 112,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 112,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 112,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 112,
			name = "盖亚",
			probability = "0.116",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 112,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 112,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 112,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 112,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 112,
			name = "蛇女墨莎",
			probability = "0.116",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 112,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 112,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 112,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 112,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 112,
			name = "路西法",
			probability = "0.116",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 112,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 112,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 112,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 112,
			name = "阿蒙",
			probability = "1.001",
			id = 28409,
			num = 1
		},
		[24300] = {
			group_id = 112,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 112,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 112,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 112,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 112,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 112,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 112,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 112,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 112,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 112,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 112,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 112,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 112,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 112,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 112,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 112,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 112,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 112,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 112,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 112,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 112,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 112,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 112,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 112,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 112,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 112,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 112,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 112,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 112,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 112,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 112,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 112,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 112,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 112,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 112,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 112,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 112,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 112,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 112,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 112,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[113] = {
		[26410] = {
			group_id = 113,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 113,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 113,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 113,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 113,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 113,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 113,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 113,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 113,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 113,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 113,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 113,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[25400] = {
			group_id = 113,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 113,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 113,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 113,
			name = "菲尼克斯",
			probability = "0.116",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 113,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 113,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 113,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 113,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 113,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 113,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 113,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 113,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 113,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 113,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 113,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 113,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 113,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 113,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 113,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 113,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 113,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 113,
			name = "伊西斯",
			probability = "0.116",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 113,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 113,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 113,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 113,
			name = "盖亚",
			probability = "0.116",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 113,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 113,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 113,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 113,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 113,
			name = "蛇女墨莎",
			probability = "0.116",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 113,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 113,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 113,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 113,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 113,
			name = "路西法",
			probability = "0.116",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 113,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 113,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 113,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 113,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 113,
			name = "加百列",
			probability = "1.001",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 113,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 113,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 113,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 113,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 113,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 113,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 113,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 113,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 113,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 113,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 113,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 113,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 113,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 113,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 113,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 113,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 113,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 113,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 113,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 113,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 113,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 113,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 113,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 113,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 113,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 113,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 113,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 113,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 113,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 113,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 113,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 113,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 113,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 113,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 113,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 113,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 113,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 113,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 113,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 113,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[114] = {
		[26410] = {
			group_id = 114,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 114,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 114,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 114,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 114,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 114,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 114,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 114,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 114,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 114,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 114,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 114,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[24411] = {
			group_id = 114,
			name = "利维坦",
			probability = "1.001",
			id = 24411,
			num = 1
		},
		[25400] = {
			group_id = 114,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 114,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 114,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 114,
			name = "菲尼克斯",
			probability = "0.116",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 114,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 114,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 114,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 114,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 114,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 114,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 114,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 114,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 114,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 114,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 114,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 114,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 114,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 114,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 114,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 114,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 114,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 114,
			name = "伊西斯",
			probability = "0.116",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 114,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 114,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 114,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 114,
			name = "盖亚",
			probability = "0.116",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 114,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 114,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 114,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 114,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 114,
			name = "蛇女墨莎",
			probability = "0.116",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 114,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 114,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 114,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 114,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 114,
			name = "路西法",
			probability = "0.116",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 114,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 114,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 114,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 114,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 114,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 114,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 114,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 114,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 114,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 114,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 114,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 114,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 114,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 114,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 114,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 114,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 114,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 114,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 114,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 114,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 114,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 114,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 114,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 114,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 114,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 114,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 114,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 114,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 114,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 114,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 114,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 114,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 114,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 114,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 114,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 114,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 114,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 114,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 114,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 114,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 114,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 114,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 114,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 114,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 114,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[115] = {
		[26410] = {
			group_id = 115,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 115,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 115,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 115,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 115,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 115,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 115,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 115,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 115,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 115,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 115,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 115,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[28414] = {
			group_id = 115,
			name = "巴雷特",
			probability = "1.001",
			id = 28414,
			num = 1
		},
		[25400] = {
			group_id = 115,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 115,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 115,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 115,
			name = "菲尼克斯",
			probability = "0.116",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 115,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 115,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 115,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 115,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 115,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 115,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 115,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 115,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 115,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 115,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 115,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 115,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 115,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 115,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 115,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 115,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 115,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 115,
			name = "伊西斯",
			probability = "0.116",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 115,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 115,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 115,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 115,
			name = "盖亚",
			probability = "0.116",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 115,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 115,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 115,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 115,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 115,
			name = "蛇女墨莎",
			probability = "0.116",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 115,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 115,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 115,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 115,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 115,
			name = "路西法",
			probability = "0.116",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 115,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 115,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 115,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 115,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 115,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 115,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 115,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 115,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 115,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 115,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 115,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 115,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 115,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 115,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 115,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 115,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 115,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 115,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 115,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 115,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 115,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 115,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 115,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 115,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 115,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 115,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 115,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 115,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 115,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 115,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 115,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 115,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 115,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 115,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 115,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 115,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 115,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 115,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 115,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 115,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 115,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 115,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 115,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 115,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 115,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[116] = {
		[26410] = {
			group_id = 116,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 116,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 116,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 116,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 116,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 116,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 116,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 116,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 116,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 116,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 116,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 116,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[28416] = {
			group_id = 116,
			name = "奎因",
			probability = "1.001",
			id = 28416,
			num = 1
		},
		[25400] = {
			group_id = 116,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 116,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 116,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 116,
			name = "菲尼克斯",
			probability = "0.116",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 116,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 116,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 116,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 116,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 116,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 116,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 116,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 116,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 116,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 116,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 116,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 116,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 116,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 116,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 116,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 116,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 116,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 116,
			name = "伊西斯",
			probability = "0.116",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 116,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 116,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 116,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 116,
			name = "盖亚",
			probability = "0.116",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 116,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 116,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 116,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 116,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 116,
			name = "蛇女墨莎",
			probability = "0.116",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 116,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 116,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 116,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 116,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 116,
			name = "路西法",
			probability = "0.116",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 116,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 116,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 116,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 116,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 116,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 116,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 116,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 116,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 116,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 116,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 116,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 116,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 116,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 116,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 116,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 116,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 116,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 116,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 116,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 116,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 116,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 116,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 116,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 116,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 116,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 116,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 116,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 116,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 116,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 116,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 116,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 116,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 116,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 116,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 116,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 116,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 116,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 116,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 116,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 116,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 116,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 116,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 116,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 116,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 116,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[117] = {
		[26410] = {
			group_id = 117,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 117,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 117,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 117,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 117,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 117,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 117,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 117,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 117,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 117,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 117,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 117,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[26414] = {
			group_id = 117,
			name = "雷玖",
			probability = "1.001",
			id = 26414,
			num = 1
		},
		[25400] = {
			group_id = 117,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 117,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 117,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 117,
			name = "菲尼克斯",
			probability = "0.117",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 117,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 117,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 117,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 117,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 117,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 117,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 117,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 117,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 117,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 117,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 117,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 117,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 117,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 117,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 117,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 117,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 117,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 117,
			name = "伊西斯",
			probability = "0.117",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 117,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 117,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 117,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 117,
			name = "盖亚",
			probability = "0.117",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 117,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 117,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 117,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 117,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 117,
			name = "蛇女墨莎",
			probability = "0.117",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 117,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 117,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 117,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 117,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 117,
			name = "路西法",
			probability = "0.117",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 117,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 117,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 117,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 117,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 117,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 117,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 117,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 117,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 117,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 117,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 117,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 117,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 117,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 117,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 117,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 117,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 117,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 117,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 117,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 117,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 117,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 117,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 117,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 117,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 117,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 117,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 117,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 117,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 117,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 117,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 117,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 117,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 117,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 117,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 117,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 117,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 117,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 117,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 117,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 117,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 117,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 117,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 117,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 117,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 117,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[118] = {
		[26410] = {
			group_id = 118,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 118,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 118,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 118,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 118,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 118,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 118,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 118,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 118,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 118,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 118,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 118,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29402] = {
			group_id = 118,
			name = "路飞",
			probability = "1.001",
			id = 29402,
			num = 1
		},
		[25400] = {
			group_id = 118,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 118,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 118,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 118,
			name = "菲尼克斯",
			probability = "0.118",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 118,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 118,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 118,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 118,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 118,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 118,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 118,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 118,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 118,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 118,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 118,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 118,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 118,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 118,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 118,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 118,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 118,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 118,
			name = "伊西斯",
			probability = "0.118",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 118,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 118,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 118,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 118,
			name = "盖亚",
			probability = "0.118",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 118,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 118,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 118,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 118,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 118,
			name = "蛇女墨莎",
			probability = "0.118",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 118,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 118,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 118,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 118,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 118,
			name = "路西法",
			probability = "0.118",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 118,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 118,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 118,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 118,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 118,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 118,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 118,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 118,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 118,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 118,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 118,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 118,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 118,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 118,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 118,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 118,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 118,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 118,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 118,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 118,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 118,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 118,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 118,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 118,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 118,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 118,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 118,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 118,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 118,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 118,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 118,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 118,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 118,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 118,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 118,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 118,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 118,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 118,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 118,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 118,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 118,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 118,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 118,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 118,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 118,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[119] = {
		[26410] = {
			group_id = 119,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 119,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 119,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 119,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 119,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 119,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 119,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 119,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 119,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 119,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 119,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 119,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29403] = {
			group_id = 119,
			name = "尼卡",
			probability = "1.001",
			id = 29403,
			num = 1
		},
		[25400] = {
			group_id = 119,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 119,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 119,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 119,
			name = "菲尼克斯",
			probability = "0.119",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 119,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 119,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 119,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 119,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 119,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 119,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 119,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 119,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 119,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 119,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 119,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 119,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 119,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 119,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 119,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 119,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 119,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 119,
			name = "伊西斯",
			probability = "0.119",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 119,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 119,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 119,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 119,
			name = "盖亚",
			probability = "0.119",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 119,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 119,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 119,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 119,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 119,
			name = "蛇女墨莎",
			probability = "0.119",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 119,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 119,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 119,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 119,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 119,
			name = "路西法",
			probability = "0.119",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 119,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 119,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 119,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 119,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 119,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 119,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 119,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 119,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 119,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 119,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 119,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 119,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 119,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 119,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 119,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 119,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 119,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 119,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 119,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 119,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 119,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 119,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 119,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 119,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 119,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 119,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 119,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 119,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 119,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 119,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 119,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 119,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 119,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 119,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 119,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 119,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 119,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 119,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 119,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 119,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 119,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 119,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 119,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 119,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 119,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[120] = {
		[26410] = {
			group_id = 120,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 120,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 120,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 120,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 120,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 120,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 120,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 120,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 120,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 120,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 120,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 120,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29414] = {
			group_id = 120,
			name = "凯多（神龙）",
			probability = "1.001",
			id = 29414,
			num = 1
		},
		[25400] = {
			group_id = 120,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 120,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 120,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 120,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 120,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 120,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 120,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 120,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 120,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 120,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 120,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 120,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 120,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 120,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 120,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 120,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 120,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 120,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 120,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 120,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 120,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 120,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 120,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 120,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 120,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 120,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 120,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 120,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 120,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 120,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 120,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 120,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 120,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 120,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 120,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 120,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 120,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 120,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 120,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 120,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 120,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 120,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 120,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 120,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 120,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 120,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 120,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 120,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 120,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 120,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 120,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 120,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 120,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 120,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 120,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 120,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 120,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 120,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 120,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 120,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 120,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 120,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 120,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 120,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 120,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 120,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 120,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 120,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 120,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 120,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 120,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 120,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 120,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 120,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 120,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 120,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 120,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 120,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 120,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 120,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 120,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[121] = {
		[26410] = {
			group_id = 121,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 121,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 121,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 121,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 121,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 121,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 121,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 121,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 121,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 121,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 121,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 121,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29416] = {
			group_id = 121,
			name = "金狮子·史基",
			probability = "1.001",
			id = 29416,
			num = 1
		},
		[25400] = {
			group_id = 121,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 121,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 121,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 121,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 121,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 121,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 121,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 121,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 121,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 121,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 121,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 121,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 121,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 121,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 121,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 121,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 121,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 121,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 121,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 121,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 121,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 121,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 121,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 121,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 121,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 121,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 121,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 121,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 121,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 121,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 121,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 121,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 121,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 121,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 121,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 121,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 121,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 121,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 121,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 121,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 121,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 121,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 121,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 121,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 121,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 121,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 121,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 121,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 121,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 121,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 121,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 121,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 121,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 121,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 121,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 121,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 121,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 121,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 121,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 121,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 121,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 121,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 121,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 121,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 121,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 121,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 121,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 121,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 121,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 121,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 121,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 121,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 121,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 121,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 121,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 121,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 121,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 121,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 121,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 121,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 121,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[122] = {
		[26410] = {
			group_id = 122,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 122,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 122,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 122,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 122,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 122,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 122,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 122,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 122,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 122,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 122,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 122,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29415] = {
			group_id = 122,
			name = "战国大佛",
			probability = "1.001",
			id = 29415,
			num = 1
		},
		[25400] = {
			group_id = 122,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 122,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 122,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 122,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 122,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 122,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 122,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 122,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 122,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 122,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 122,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 122,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 122,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 122,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 122,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 122,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 122,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 122,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 122,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 122,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 122,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 122,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 122,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 122,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 122,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 122,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 122,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 122,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 122,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 122,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 122,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 122,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 122,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 122,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 122,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 122,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 122,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 122,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 122,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 122,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 122,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 122,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 122,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 122,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 122,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 122,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 122,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 122,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 122,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 122,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 122,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 122,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 122,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 122,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 122,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 122,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 122,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 122,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 122,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 122,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 122,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 122,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 122,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 122,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 122,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 122,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 122,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 122,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 122,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 122,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 122,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 122,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 122,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 122,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 122,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 122,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 122,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 122,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 122,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 122,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 122,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[123] = {
		[26410] = {
			group_id = 123,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 123,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 123,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 123,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 123,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 123,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 123,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 123,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 123,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 123,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 123,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 123,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29417] = {
			group_id = 123,
			name = "藤虎三大将",
			probability = "1.001",
			id = 29417,
			num = 1
		},
		[25400] = {
			group_id = 123,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 123,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 123,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 123,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 123,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 123,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 123,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 123,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 123,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 123,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 123,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 123,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 123,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 123,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 123,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 123,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 123,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 123,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 123,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 123,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 123,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 123,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 123,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 123,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 123,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 123,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 123,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 123,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 123,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 123,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 123,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 123,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 123,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 123,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 123,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 123,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 123,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 123,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 123,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 123,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 123,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 123,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 123,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 123,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 123,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 123,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 123,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 123,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 123,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 123,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 123,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 123,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 123,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 123,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 123,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 123,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 123,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 123,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 123,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 123,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 123,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 123,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 123,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 123,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 123,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 123,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 123,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 123,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 123,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 123,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 123,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 123,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 123,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 123,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 123,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 123,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 123,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 123,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 123,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 123,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 123,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[124] = {
		[26410] = {
			group_id = 124,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 124,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 124,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 124,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 124,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 124,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 124,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 124,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 124,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 124,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 124,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 124,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29418] = {
			group_id = 124,
			name = "凯撒",
			probability = "1.001",
			id = 29418,
			num = 1
		},
		[25400] = {
			group_id = 124,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 124,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 124,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 124,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 124,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 124,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 124,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 124,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 124,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 124,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 124,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 124,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 124,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 124,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 124,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 124,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 124,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 124,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 124,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 124,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 124,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 124,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 124,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 124,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 124,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 124,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 124,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 124,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 124,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 124,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 124,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 124,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 124,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 124,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 124,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 124,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 124,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 124,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 124,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 124,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 124,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 124,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 124,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 124,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 124,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 124,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 124,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 124,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 124,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 124,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 124,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 124,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 124,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 124,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 124,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 124,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 124,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 124,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 124,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 124,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 124,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 124,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 124,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 124,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 124,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 124,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 124,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 124,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 124,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 124,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 124,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 124,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 124,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 124,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 124,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 124,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 124,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 124,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 124,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 124,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 124,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[125] = {
		[26410] = {
			group_id = 125,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 125,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 125,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 125,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 125,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 125,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 125,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 125,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 125,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 125,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 125,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 125,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29419] = {
			group_id = 125,
			name = "黑胡子",
			probability = "1.001",
			id = 29419,
			num = 1
		},
		[25400] = {
			group_id = 125,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 125,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 125,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 125,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 125,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 125,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 125,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 125,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 125,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 125,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 125,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 125,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 125,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 125,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 125,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 125,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 125,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 125,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 125,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 125,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 125,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 125,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 125,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 125,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 125,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 125,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 125,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 125,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 125,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 125,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 125,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 125,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 125,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 125,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 125,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 125,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 125,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 125,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 125,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 125,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 125,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 125,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 125,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 125,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 125,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 125,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 125,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 125,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 125,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 125,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 125,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 125,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 125,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 125,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 125,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 125,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 125,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 125,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 125,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 125,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 125,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 125,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 125,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 125,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 125,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 125,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 125,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 125,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 125,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 125,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 125,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 125,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 125,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 125,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 125,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 125,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 125,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 125,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 125,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 125,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 125,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[126] = {
		[26410] = {
			group_id = 126,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 126,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 126,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 126,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 126,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 126,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 126,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 126,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 126,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 126,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 126,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 126,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29420] = {
			group_id = 126,
			name = "山治（杰尔马）",
			probability = "1.001",
			id = 29420,
			num = 1
		},
		[25400] = {
			group_id = 126,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 126,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 126,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 126,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 126,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 126,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 126,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 126,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 126,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 126,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 126,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 126,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 126,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 126,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 126,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 126,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 126,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 126,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 126,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 126,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 126,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 126,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 126,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 126,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 126,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 126,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 126,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 126,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 126,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 126,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 126,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 126,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 126,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 126,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 126,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 126,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 126,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 126,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 126,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 126,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 126,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 126,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 126,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 126,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 126,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 126,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 126,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 126,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 126,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 126,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 126,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 126,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 126,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 126,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 126,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 126,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 126,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 126,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 126,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 126,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 126,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 126,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 126,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 126,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 126,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 126,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 126,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 126,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 126,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 126,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 126,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 126,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 126,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 126,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 126,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 126,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 126,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 126,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 126,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 126,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 126,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[127] = {
		[26410] = {
			group_id = 127,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 127,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 127,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 127,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 127,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 127,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 127,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 127,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 127,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 127,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 127,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 127,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29421] = {
			group_id = 127,
			name = "猫蝮蛇",
			probability = "1.001",
			id = 29421,
			num = 1
		},
		[25400] = {
			group_id = 127,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 127,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 127,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 127,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 127,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 127,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 127,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 127,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 127,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 127,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 127,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 127,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 127,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 127,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 127,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 127,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 127,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 127,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 127,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 127,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 127,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 127,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 127,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 127,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 127,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 127,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 127,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 127,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 127,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 127,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 127,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 127,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 127,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 127,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 127,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 127,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 127,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 127,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 127,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 127,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 127,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 127,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 127,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 127,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 127,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 127,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 127,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 127,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 127,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 127,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 127,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 127,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 127,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 127,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 127,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 127,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 127,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 127,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 127,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 127,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 127,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 127,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 127,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 127,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 127,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 127,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 127,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 127,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 127,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 127,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 127,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 127,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 127,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 127,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 127,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 127,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 127,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 127,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 127,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 127,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 127,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[128] = {
		[26410] = {
			group_id = 128,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 128,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 128,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 128,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 128,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 128,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 128,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 128,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 128,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 128,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 128,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 128,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29421] = {
			group_id = 128,
			name = "猫蝮蛇",
			probability = "1.001",
			id = 29421,
			num = 1
		},
		[25400] = {
			group_id = 128,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 128,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 128,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 128,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 128,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 128,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 128,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 128,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 128,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 128,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 128,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 128,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 128,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 128,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 128,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 128,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 128,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 128,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 128,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 128,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 128,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 128,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 128,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 128,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 128,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 128,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 128,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 128,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 128,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 128,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 128,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 128,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 128,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 128,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 128,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 128,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 128,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 128,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 128,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 128,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 128,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 128,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 128,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 128,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 128,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 128,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 128,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 128,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 128,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 128,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 128,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 128,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 128,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 128,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 128,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 128,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 128,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 128,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 128,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 128,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 128,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 128,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 128,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 128,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 128,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 128,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 128,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 128,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 128,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 128,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 128,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 128,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 128,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 128,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 128,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 128,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 128,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 128,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 128,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 128,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 128,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[129] = {
		[26410] = {
			group_id = 129,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 129,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 129,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 129,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 129,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 129,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 129,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 129,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 129,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 129,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 129,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 129,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29422] = {
			group_id = 129,
			name = "萨坦圣",
			probability = "1.001",
			id = 29422,
			num = 1
		},
		[25400] = {
			group_id = 129,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 129,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 129,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 129,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 129,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 129,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 129,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 129,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 129,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 129,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 129,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 129,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 129,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 129,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 129,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 129,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 129,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 129,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 129,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 129,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 129,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 129,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 129,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 129,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 129,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 129,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 129,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 129,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 129,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 129,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 129,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 129,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 129,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 129,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 129,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 129,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 129,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 129,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 129,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 129,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 129,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 129,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 129,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 129,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 129,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 129,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 129,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 129,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 129,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 129,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 129,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 129,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 129,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 129,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 129,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 129,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 129,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 129,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 129,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 129,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 129,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 129,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 129,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 129,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 129,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 129,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 129,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 129,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 129,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 129,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 129,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 129,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 129,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 129,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 129,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 129,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 129,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 129,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 129,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 129,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 129,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[130] = {
		[26410] = {
			group_id = 130,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 130,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 130,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 130,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 130,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 130,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 130,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 130,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 130,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 130,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 130,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 130,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29422] = {
			group_id = 130,
			name = "萨坦圣",
			probability = "1.001",
			id = 29422,
			num = 1
		},
		[25400] = {
			group_id = 130,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 130,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 130,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 130,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 130,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 130,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 130,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 130,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 130,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 130,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 130,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 130,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 130,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 130,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 130,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 130,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 130,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 130,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 130,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 130,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 130,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 130,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 130,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 130,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 130,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 130,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 130,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 130,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 130,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 130,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 130,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 130,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 130,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 130,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 130,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 130,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 130,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 130,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 130,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 130,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 130,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 130,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 130,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 130,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 130,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 130,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 130,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 130,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 130,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 130,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 130,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 130,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 130,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 130,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 130,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 130,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 130,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 130,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 130,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 130,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 130,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 130,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 130,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 130,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 130,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 130,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 130,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 130,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 130,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 130,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 130,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 130,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 130,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 130,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 130,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 130,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 130,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 130,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 130,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 130,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 130,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[131] = {
		[26410] = {
			group_id = 131,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 131,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 131,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 131,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 131,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 131,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 131,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 131,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 131,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 131,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 131,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 131,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29423] = {
			group_id = 131,
			name = "女帝",
			probability = "1.001",
			id = 29423,
			num = 1
		},
		[25400] = {
			group_id = 131,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 131,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 131,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 131,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 131,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 131,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 131,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 131,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 131,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 131,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 131,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 131,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 131,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 131,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 131,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 131,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 131,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 131,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 131,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 131,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 131,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 131,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 131,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 131,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 131,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 131,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 131,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 131,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 131,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 131,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 131,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 131,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 131,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 131,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 131,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 131,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 131,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 131,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 131,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 131,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 131,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 131,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 131,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 131,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 131,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 131,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 131,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 131,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 131,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 131,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 131,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 131,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 131,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 131,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 131,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 131,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 131,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 131,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 131,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 131,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 131,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 131,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 131,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 131,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 131,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 131,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 131,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 131,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 131,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 131,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 131,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 131,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 131,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 131,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 131,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 131,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 131,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 131,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 131,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 131,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 131,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[132] = {
		[26410] = {
			group_id = 132,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 132,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 132,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 132,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 132,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 132,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 132,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 132,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 132,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 132,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 132,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 132,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29424] = {
			group_id = 132,
			name = "克力架",
			probability = "1.001",
			id = 29424,
			num = 1
		},
		[25400] = {
			group_id = 132,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 132,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 132,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 132,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 132,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 132,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 132,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 132,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 132,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 132,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 132,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 132,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 132,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 132,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 132,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 132,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 132,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 132,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 132,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 132,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 132,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 132,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 132,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 132,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 132,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 132,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 132,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 132,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 132,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 132,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 132,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 132,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 132,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 132,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 132,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 132,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 132,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 132,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 132,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 132,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 132,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 132,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 132,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 132,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 132,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 132,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 132,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 132,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 132,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 132,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 132,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 132,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 132,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 132,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 132,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 132,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 132,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 132,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 132,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 132,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 132,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 132,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 132,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 132,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 132,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 132,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 132,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 132,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 132,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 132,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 132,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 132,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 132,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 132,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 132,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 132,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 132,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 132,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 132,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 132,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 132,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[133] = {
		[26410] = {
			group_id = 133,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 133,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 133,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 133,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 133,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 133,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 133,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 133,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 133,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 133,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 133,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 133,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29425] = {
			group_id = 133,
			name = "斯慕吉",
			probability = "1.001",
			id = 29425,
			num = 1
		},
		[25400] = {
			group_id = 133,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 133,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 133,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 133,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 133,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 133,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 133,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 133,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 133,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 133,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 133,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 133,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 133,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 133,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 133,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 133,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 133,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 133,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 133,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 133,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 133,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 133,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 133,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 133,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 133,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 133,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 133,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 133,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 133,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 133,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 133,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 133,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 133,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 133,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 133,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 133,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 133,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 133,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 133,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 133,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 133,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 133,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 133,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 133,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 133,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 133,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 133,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 133,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 133,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 133,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 133,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 133,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 133,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 133,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 133,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 133,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 133,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 133,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 133,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 133,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 133,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 133,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 133,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 133,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 133,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 133,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 133,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 133,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 133,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 133,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 133,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 133,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 133,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 133,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 133,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 133,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 133,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 133,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 133,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 133,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 133,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[134] = {
		[26410] = {
			group_id = 134,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 134,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 134,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 134,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 134,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 134,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 134,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 134,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 134,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 134,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 134,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 134,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29426] = {
			group_id = 134,
			name = "罗杰",
			probability = "1.001",
			id = 29426,
			num = 1
		},
		[25400] = {
			group_id = 134,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 134,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 134,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 134,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 134,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 134,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 134,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 134,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 134,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 134,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 134,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 134,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 134,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 134,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 134,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 134,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 134,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 134,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 134,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 134,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 134,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 134,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 134,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 134,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 134,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 134,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 134,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 134,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 134,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 134,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 134,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 134,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 134,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 134,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 134,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 134,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 134,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 134,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 134,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 134,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 134,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 134,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 134,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 134,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 134,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 134,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 134,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 134,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 134,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 134,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 134,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 134,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 134,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 134,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 134,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 134,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 134,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 134,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 134,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 134,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 134,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 134,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 134,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 134,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 134,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 134,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 134,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 134,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 134,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 134,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 134,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 134,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 134,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 134,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 134,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 134,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 134,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 134,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 134,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 134,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 134,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[135] = {
		[26410] = {
			group_id = 135,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 135,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 135,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 135,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 135,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 135,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 135,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 135,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 135,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 135,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 135,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 135,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29427] = {
			group_id = 135,
			name = "鹰眼",
			probability = "1.001",
			id = 29427,
			num = 1
		},
		[25400] = {
			group_id = 135,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 135,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 135,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 135,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 135,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 135,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 135,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 135,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 135,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 135,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 135,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 135,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 135,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 135,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 135,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 135,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 135,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 135,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 135,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 135,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 135,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 135,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 135,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 135,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 135,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 135,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 135,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 135,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 135,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 135,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 135,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 135,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 135,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 135,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 135,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 135,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 135,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 135,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 135,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 135,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 135,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 135,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 135,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 135,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 135,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 135,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 135,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 135,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 135,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 135,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 135,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 135,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 135,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 135,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 135,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 135,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 135,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 135,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 135,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 135,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 135,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 135,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 135,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 135,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 135,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 135,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 135,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 135,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 135,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 135,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 135,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 135,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 135,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 135,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 135,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 135,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 135,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 135,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 135,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 135,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 135,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[136] = {
		[26410] = {
			group_id = 136,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 136,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 136,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 136,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 136,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 136,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 136,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 136,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 136,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 136,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 136,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 136,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29428] = {
			group_id = 136,
			name = "乌索普",
			probability = "1.001",
			id = 29428,
			num = 1
		},
		[25400] = {
			group_id = 136,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 136,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 136,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 136,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 136,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 136,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 136,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 136,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 136,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 136,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 136,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 136,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 136,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 136,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 136,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 136,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 136,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 136,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 136,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 136,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 136,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 136,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 136,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 136,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 136,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 136,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 136,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 136,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 136,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 136,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 136,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 136,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 136,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 136,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 136,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 136,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 136,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 136,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 136,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 136,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 136,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 136,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 136,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 136,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 136,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 136,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 136,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 136,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 136,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 136,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 136,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 136,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 136,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 136,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 136,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 136,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 136,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 136,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 136,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 136,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 136,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 136,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 136,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 136,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 136,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 136,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 136,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 136,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 136,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 136,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 136,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 136,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 136,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 136,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 136,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 136,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 136,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 136,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 136,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 136,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 136,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[137] = {
		[26410] = {
			group_id = 137,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 137,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 137,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 137,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 137,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 137,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 137,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 137,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 137,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 137,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 137,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 137,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29429] = {
			group_id = 137,
			name = "弗兰奇",
			probability = "1.001",
			id = 29429,
			num = 1
		},
		[25400] = {
			group_id = 137,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 137,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 137,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 137,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 137,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 137,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 137,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 137,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 137,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 137,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 137,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 137,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 137,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 137,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 137,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 137,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 137,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 137,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 137,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 137,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 137,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 137,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 137,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 137,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 137,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 137,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 137,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 137,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 137,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 137,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 137,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 137,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 137,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 137,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 137,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 137,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 137,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 137,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 137,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 137,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 137,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 137,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 137,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 137,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 137,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 137,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 137,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 137,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 137,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 137,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 137,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 137,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 137,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 137,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 137,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 137,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 137,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 137,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 137,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 137,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 137,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 137,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 137,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 137,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 137,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 137,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 137,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 137,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 137,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 137,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 137,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 137,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 137,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 137,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 137,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 137,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 137,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 137,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 137,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 137,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 137,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[138] = {
		[26410] = {
			group_id = 138,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 138,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 138,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 138,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 138,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 138,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 138,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 138,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 138,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 138,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 138,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 138,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29430] = {
			group_id = 138,
			name = "佩罗娜",
			probability = "1.001",
			id = 29430,
			num = 1
		},
		[25400] = {
			group_id = 138,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 138,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 138,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 138,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 138,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 138,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 138,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 138,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 138,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 138,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 138,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 138,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 138,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 138,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 138,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 138,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 138,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 138,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 138,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 138,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 138,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 138,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 138,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 138,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 138,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 138,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 138,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 138,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 138,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 138,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 138,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 138,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 138,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 138,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 138,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 138,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 138,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 138,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 138,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 138,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 138,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 138,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 138,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 138,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 138,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 138,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 138,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 138,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 138,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 138,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 138,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 138,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 138,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 138,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 138,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 138,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 138,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 138,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 138,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 138,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 138,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 138,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 138,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 138,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 138,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 138,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 138,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 138,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 138,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 138,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 138,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 138,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 138,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 138,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 138,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 138,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 138,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 138,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 138,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 138,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 138,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[139] = {
		[26410] = {
			group_id = 139,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 139,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 139,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 139,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 139,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 139,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 139,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 139,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 139,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 139,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 139,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 139,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29432] = {
			group_id = 139,
			name = "布鲁克",
			probability = "1.001",
			id = 29432,
			num = 1
		},
		[25400] = {
			group_id = 139,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 139,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 139,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 139,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 139,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 139,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 139,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 139,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 139,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 139,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 139,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 139,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 139,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 139,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 139,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 139,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 139,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 139,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 139,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 139,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 139,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 139,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 139,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 139,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 139,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 139,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 139,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 139,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 139,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 139,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 139,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 139,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 139,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 139,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 139,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 139,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 139,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 139,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 139,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 139,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 139,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 139,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 139,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 139,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 139,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 139,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 139,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 139,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 139,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 139,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 139,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 139,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 139,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 139,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 139,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 139,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 139,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 139,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 139,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 139,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 139,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 139,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 139,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 139,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 139,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 139,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 139,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 139,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 139,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 139,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 139,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 139,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 139,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 139,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 139,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 139,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 139,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 139,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 139,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 139,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 139,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[140] = {
		[26410] = {
			group_id = 140,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 140,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 140,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 140,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 140,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 140,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 140,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 140,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 140,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 140,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 140,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 140,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29431] = {
			group_id = 140,
			name = "巴托洛米奥",
			probability = "1.001",
			id = 29431,
			num = 1
		},
		[25400] = {
			group_id = 140,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 140,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 140,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 140,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 140,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 140,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 140,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 140,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 140,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 140,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 140,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 140,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 140,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 140,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 140,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 140,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 140,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 140,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 140,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 140,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 140,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 140,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 140,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 140,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 140,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 140,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 140,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 140,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 140,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 140,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 140,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 140,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 140,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 140,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 140,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 140,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 140,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 140,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 140,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 140,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 140,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 140,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 140,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 140,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 140,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 140,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 140,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 140,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 140,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 140,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 140,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 140,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 140,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 140,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 140,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 140,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 140,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 140,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 140,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 140,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 140,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 140,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 140,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 140,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 140,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 140,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 140,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 140,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 140,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 140,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 140,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 140,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 140,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 140,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 140,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 140,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 140,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 140,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 140,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 140,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 140,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[141] = {
		[26410] = {
			group_id = 141,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 141,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 141,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 141,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 141,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 141,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 141,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 141,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 141,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 141,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 141,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 141,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29433] = {
			group_id = 141,
			name = "艾斯(龙年)",
			probability = "1.001",
			id = 29433,
			num = 1
		},
		[25400] = {
			group_id = 141,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 141,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 141,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 141,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 141,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 141,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 141,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 141,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 141,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 141,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 141,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 141,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 141,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 141,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 141,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 141,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 141,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 141,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 141,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 141,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 141,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 141,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 141,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 141,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 141,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 141,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 141,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 141,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 141,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 141,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 141,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 141,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 141,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 141,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 141,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 141,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 141,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 141,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 141,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 141,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 141,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 141,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 141,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 141,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 141,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 141,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 141,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 141,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 141,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 141,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 141,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 141,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 141,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 141,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 141,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 141,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 141,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 141,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 141,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 141,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 141,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 141,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 141,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 141,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 141,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 141,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 141,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 141,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 141,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 141,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 141,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 141,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 141,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 141,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 141,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 141,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 141,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 141,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 141,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 141,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 141,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[142] = {
		[26410] = {
			group_id = 142,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 142,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 142,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 142,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 142,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 142,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 142,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 142,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 142,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 142,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 142,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 142,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29434] = {
			group_id = 142,
			name = "乌塔(世界歌姬)",
			probability = "1.001",
			id = 29434,
			num = 1
		},
		[25400] = {
			group_id = 142,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 142,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 142,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 142,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 142,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 142,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 142,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 142,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 142,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 142,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 142,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 142,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 142,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 142,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 142,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 142,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 142,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 142,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 142,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 142,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 142,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 142,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 142,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 142,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 142,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 142,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 142,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 142,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 142,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 142,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 142,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 142,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 142,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 142,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 142,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 142,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 142,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 142,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 142,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 142,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 142,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 142,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 142,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 142,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 142,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 142,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 142,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 142,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 142,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 142,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 142,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 142,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 142,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 142,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 142,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 142,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 142,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 142,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 142,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 142,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 142,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 142,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 142,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 142,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 142,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 142,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 142,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 142,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 142,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 142,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 142,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 142,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 142,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 142,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 142,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 142,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 142,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 142,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 142,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 142,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 142,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[143] = {
		[26410] = {
			group_id = 143,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 143,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 143,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 143,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 143,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 143,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 143,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 143,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 143,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 143,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 143,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 143,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29435] = {
			group_id = 143,
			name = "烬",
			probability = "1.001",
			id = 29435,
			num = 1
		},
		[25400] = {
			group_id = 143,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 143,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 143,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 143,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 143,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 143,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 143,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 143,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 143,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 143,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 143,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 143,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 143,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 143,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 143,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 143,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 143,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 143,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 143,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 143,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 143,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 143,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 143,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 143,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 143,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 143,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 143,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 143,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 143,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 143,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 143,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 143,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 143,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 143,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 143,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 143,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 143,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 143,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 143,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 143,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 143,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 143,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 143,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 143,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 143,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 143,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 143,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 143,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 143,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 143,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 143,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 143,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 143,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 143,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 143,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 143,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 143,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 143,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 143,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 143,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 143,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 143,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 143,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 143,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 143,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 143,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 143,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 143,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 143,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 143,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 143,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 143,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 143,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 143,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 143,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 143,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 143,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 143,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 143,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 143,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 143,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[144] = {
		[26410] = {
			group_id = 144,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 144,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 144,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 144,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 144,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 144,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 144,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 144,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 144,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 144,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 144,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 144,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29436] = {
			group_id = 144,
			name = "库赞",
			probability = "1.001",
			id = 29436,
			num = 1
		},
		[25400] = {
			group_id = 144,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 144,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 144,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 144,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 144,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 144,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 144,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 144,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 144,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 144,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 144,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 144,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 144,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 144,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 144,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 144,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 144,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 144,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 144,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 144,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 144,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 144,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 144,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 144,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 144,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 144,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 144,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 144,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 144,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 144,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 144,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 144,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 144,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 144,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 144,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 144,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 144,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 144,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 144,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 144,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 144,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 144,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 144,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 144,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 144,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 144,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 144,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 144,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 144,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 144,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 144,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 144,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 144,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 144,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 144,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 144,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 144,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 144,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 144,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 144,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 144,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 144,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 144,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 144,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 144,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 144,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 144,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 144,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 144,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 144,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 144,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 144,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 144,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 144,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 144,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 144,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 144,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 144,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 144,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 144,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 144,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[145] = {
		[26410] = {
			group_id = 145,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 145,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 145,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 145,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 145,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 145,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 145,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 145,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 145,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 145,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 145,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 145,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29437] = {
			group_id = 145,
			name = "狼刑",
			probability = "1.001",
			id = 29437,
			num = 1
		},
		[25400] = {
			group_id = 145,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 145,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 145,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 145,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 145,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 145,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 145,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 145,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 145,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 145,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 145,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 145,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 145,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 145,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 145,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 145,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 145,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 145,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 145,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 145,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 145,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 145,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 145,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 145,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 145,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 145,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 145,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 145,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 145,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 145,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 145,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 145,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 145,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 145,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 145,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 145,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 145,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 145,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 145,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 145,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 145,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 145,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 145,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 145,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 145,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 145,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 145,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 145,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 145,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 145,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 145,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 145,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 145,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 145,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 145,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 145,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 145,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 145,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 145,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 145,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 145,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 145,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 145,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 145,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 145,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 145,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 145,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 145,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 145,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 145,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 145,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 145,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 145,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 145,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 145,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 145,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 145,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 145,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 145,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 145,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 145,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[146] = {
		[26410] = {
			group_id = 146,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 146,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 146,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 146,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 146,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 146,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 146,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 146,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 146,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 146,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 146,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 146,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29438] = {
			group_id = 146,
			name = "佩罗斯",
			probability = "1.001",
			id = 29438,
			num = 1
		},
		[25400] = {
			group_id = 146,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 146,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 146,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 146,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 146,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 146,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 146,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 146,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 146,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 146,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 146,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 146,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 146,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 146,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 146,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 146,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 146,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 146,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 146,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 146,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 146,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 146,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 146,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 146,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 146,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 146,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 146,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 146,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 146,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 146,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 146,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 146,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 146,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 146,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 146,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 146,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 146,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 146,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 146,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 146,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 146,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 146,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 146,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 146,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 146,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 146,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 146,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 146,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 146,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 146,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 146,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 146,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 146,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 146,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 146,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 146,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 146,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 146,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 146,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 146,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 146,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 146,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 146,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 146,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 146,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 146,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 146,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 146,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 146,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 146,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 146,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 146,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 146,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 146,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 146,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 146,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 146,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 146,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 146,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 146,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 146,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[147] = {
		[26410] = {
			group_id = 147,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 147,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 147,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 147,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 147,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 147,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 147,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 147,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 147,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 147,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 147,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 147,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29439] = {
			group_id = 147,
			name = "伽治",
			probability = "1.001",
			id = 29439,
			num = 1
		},
		[25400] = {
			group_id = 147,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 147,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 147,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 147,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 147,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 147,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 147,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 147,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 147,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 147,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 147,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 147,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 147,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 147,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 147,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 147,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 147,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 147,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 147,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 147,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 147,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 147,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 147,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 147,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 147,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 147,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 147,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 147,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 147,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 147,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 147,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 147,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 147,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 147,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 147,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 147,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 147,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 147,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 147,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 147,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 147,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 147,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 147,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 147,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 147,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 147,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 147,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 147,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 147,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 147,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 147,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 147,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 147,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 147,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 147,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 147,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 147,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 147,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 147,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 147,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 147,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 147,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 147,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 147,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 147,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 147,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 147,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 147,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 147,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 147,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 147,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 147,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 147,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 147,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 147,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 147,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 147,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 147,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 147,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 147,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 147,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[148] = {
		[26410] = {
			group_id = 148,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 148,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 148,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 148,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 148,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 148,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 148,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 148,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 148,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 148,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 148,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 148,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29440] = {
			group_id = 148,
			name = "绿牛",
			probability = "1.001",
			id = 29440,
			num = 1
		},
		[25400] = {
			group_id = 148,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 148,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 148,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 148,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 148,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 148,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 148,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 148,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 148,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 148,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 148,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 148,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 148,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 148,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 148,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 148,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 148,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 148,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 148,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 148,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 148,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 148,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 148,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 148,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 148,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 148,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 148,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 148,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 148,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 148,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 148,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 148,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 148,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 148,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 148,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 148,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 148,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 148,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 148,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 148,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 148,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 148,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 148,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 148,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 148,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 148,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 148,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 148,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 148,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 148,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 148,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 148,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 148,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 148,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 148,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 148,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 148,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 148,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 148,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 148,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 148,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 148,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 148,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 148,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 148,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 148,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 148,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 148,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 148,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 148,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 148,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 148,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 148,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 148,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 148,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 148,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 148,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 148,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 148,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 148,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 148,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[149] = {
		[26410] = {
			group_id = 149,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 149,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 149,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 149,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 149,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 149,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 149,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 149,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 149,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 149,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 149,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 149,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29441] = {
			group_id = 149,
			name = "伊治",
			probability = "1.001",
			id = 29441,
			num = 1
		},
		[25400] = {
			group_id = 149,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 149,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 149,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 149,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 149,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 149,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 149,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 149,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 149,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 149,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 149,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 149,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 149,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 149,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 149,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 149,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 149,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 149,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 149,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 149,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 149,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 149,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 149,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 149,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 149,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 149,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 149,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 149,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 149,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 149,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 149,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 149,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 149,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 149,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 149,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 149,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 149,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 149,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 149,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 149,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 149,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 149,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 149,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 149,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 149,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 149,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 149,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 149,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 149,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 149,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 149,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 149,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 149,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 149,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 149,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 149,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 149,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 149,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 149,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 149,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 149,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 149,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 149,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 149,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 149,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 149,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 149,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 149,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 149,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 149,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 149,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 149,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 149,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 149,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 149,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 149,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 149,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 149,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 149,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 149,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 149,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[150] = {
		[26410] = {
			group_id = 150,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 150,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 150,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 150,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 150,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 150,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 150,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 150,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 150,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 150,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 150,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 150,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29442] = {
			group_id = 150,
			name = "索隆",
			probability = "1.001",
			id = 29442,
			num = 1
		},
		[25400] = {
			group_id = 150,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 150,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 150,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 150,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 150,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 150,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 150,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 150,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 150,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 150,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 150,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 150,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 150,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 150,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 150,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 150,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 150,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 150,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 150,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 150,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 150,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 150,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 150,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 150,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 150,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 150,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 150,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 150,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 150,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 150,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 150,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 150,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 150,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 150,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 150,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 150,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 150,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 150,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 150,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 150,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 150,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 150,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 150,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 150,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 150,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 150,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 150,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 150,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 150,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 150,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 150,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 150,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 150,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 150,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 150,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 150,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 150,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 150,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 150,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 150,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 150,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 150,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 150,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 150,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 150,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 150,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 150,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 150,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 150,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 150,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 150,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 150,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 150,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 150,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 150,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 150,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 150,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 150,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 150,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 150,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 150,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[151] = {
		[26410] = {
			group_id = 151,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 151,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 151,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 151,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 151,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 151,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 151,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 151,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 151,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 151,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 151,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 151,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29443] = {
			group_id = 151,
			name = "日奈",
			probability = "1.001",
			id = 29443,
			num = 1
		},
		[25400] = {
			group_id = 151,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 151,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 151,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 151,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 151,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 151,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 151,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 151,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 151,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 151,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 151,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 151,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 151,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 151,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 151,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 151,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 151,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 151,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 151,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 151,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 151,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 151,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 151,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 151,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 151,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 151,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 151,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 151,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 151,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 151,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 151,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 151,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 151,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 151,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 151,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 151,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 151,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 151,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 151,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 151,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 151,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 151,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 151,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 151,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 151,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 151,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 151,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 151,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 151,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 151,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 151,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 151,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 151,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 151,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 151,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 151,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 151,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 151,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 151,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 151,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 151,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 151,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 151,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 151,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 151,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 151,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 151,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 151,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 151,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 151,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 151,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 151,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 151,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 151,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 151,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 151,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 151,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 151,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 151,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 151,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 151,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[152] = {
		[26410] = {
			group_id = 152,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 152,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 152,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 152,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 152,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 152,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 152,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 152,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 152,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 152,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 152,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 152,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29444] = {
			group_id = 152,
			name = "大和",
			probability = "1.001",
			id = 29444,
			num = 1
		},
		[25400] = {
			group_id = 152,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 152,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 152,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 152,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 152,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 152,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 152,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 152,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 152,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 152,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 152,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 152,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 152,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 152,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 152,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 152,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 152,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 152,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 152,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 152,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 152,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 152,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 152,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 152,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 152,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 152,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 152,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 152,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 152,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 152,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 152,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 152,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 152,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 152,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 152,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 152,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 152,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 152,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 152,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 152,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 152,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 152,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 152,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 152,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 152,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 152,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 152,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 152,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 152,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 152,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 152,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 152,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 152,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 152,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 152,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 152,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 152,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 152,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 152,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 152,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 152,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 152,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 152,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 152,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 152,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 152,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 152,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 152,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 152,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 152,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 152,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 152,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 152,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 152,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 152,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 152,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 152,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 152,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 152,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 152,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 152,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[153] = {
		[26410] = {
			group_id = 153,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 153,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 153,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 153,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 153,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 153,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 153,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 153,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 153,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 153,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 153,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 153,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29445] = {
			group_id = 153,
			name = "玲玲",
			probability = "1.001",
			id = 29445,
			num = 1
		},
		[25400] = {
			group_id = 153,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 153,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 153,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 153,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 153,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 153,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 153,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 153,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 153,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 153,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 153,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 153,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 153,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 153,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 153,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 153,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 153,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 153,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 153,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 153,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 153,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 153,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 153,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 153,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 153,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 153,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 153,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 153,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 153,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 153,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 153,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 153,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 153,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 153,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 153,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 153,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 153,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 153,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 153,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 153,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 153,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 153,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 153,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 153,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 153,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 153,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 153,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 153,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 153,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 153,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 153,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 153,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 153,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 153,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 153,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 153,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 153,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 153,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 153,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 153,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 153,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 153,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 153,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 153,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 153,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 153,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 153,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 153,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 153,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 153,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 153,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 153,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 153,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 153,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 153,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 153,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 153,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 153,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 153,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 153,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 153,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[154] = {
		[26410] = {
			group_id = 154,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 154,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 154,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 154,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 154,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 154,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 154,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 154,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 154,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 154,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 154,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 154,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29446] = {
			group_id = 154,
			name = "路飞",
			probability = "1.001",
			id = 29446,
			num = 1
		},
		[25400] = {
			group_id = 154,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 154,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 154,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 154,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 154,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 154,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 154,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 154,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 154,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 154,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 154,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 154,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 154,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 154,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 154,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 154,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 154,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 154,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 154,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 154,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 154,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 154,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 154,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 154,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 154,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 154,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 154,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 154,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 154,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 154,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 154,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 154,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 154,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 154,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 154,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 154,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 154,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 154,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 154,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 154,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 154,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 154,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 154,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 154,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 154,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 154,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 154,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 154,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 154,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 154,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 154,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 154,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 154,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 154,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 154,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 154,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 154,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 154,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 154,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 154,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 154,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 154,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 154,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 154,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 154,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 154,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 154,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 154,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 154,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 154,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 154,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 154,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 154,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 154,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 154,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 154,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 154,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 154,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 154,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 154,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 154,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[155] = {
		[26410] = {
			group_id = 155,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 155,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 155,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 155,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 155,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 155,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 155,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 155,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 155,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 155,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 155,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 155,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29447] = {
			group_id = 155,
			name = "尼治",
			probability = "1.001",
			id = 29447,
			num = 1
		},
		[25400] = {
			group_id = 155,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 155,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 155,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 155,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 155,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 155,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 155,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 155,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 155,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 155,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 155,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 155,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 155,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 155,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 155,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 155,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 155,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 155,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 155,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 155,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 155,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 155,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 155,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 155,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 155,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 155,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 155,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 155,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 155,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 155,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 155,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 155,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 155,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 155,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 155,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 155,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 155,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 155,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 155,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 155,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 155,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 155,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 155,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 155,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 155,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 155,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 155,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 155,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 155,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 155,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 155,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 155,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 155,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 155,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 155,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 155,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 155,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 155,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 155,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 155,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 155,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 155,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 155,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 155,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 155,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 155,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 155,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 155,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 155,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 155,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 155,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 155,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 155,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 155,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 155,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 155,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 155,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 155,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 155,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 155,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 155,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[156] = {
		[26410] = {
			group_id = 156,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 156,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 156,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 156,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 156,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 156,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 156,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 156,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 156,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 156,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 156,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 156,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29448] = {
			group_id = 156,
			name = "贝克曼",
			probability = "1.001",
			id = 29448,
			num = 1
		},
		[25400] = {
			group_id = 156,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 156,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 156,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 156,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 156,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 156,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 156,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 156,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 156,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 156,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 156,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 156,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 156,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 156,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 156,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 156,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 156,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 156,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 156,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 156,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 156,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 156,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 156,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 156,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 156,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 156,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 156,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 156,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 156,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 156,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 156,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 156,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 156,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 156,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 156,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 156,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 156,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 156,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 156,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 156,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 156,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 156,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 156,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 156,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 156,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 156,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 156,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 156,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 156,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 156,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 156,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 156,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 156,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 156,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 156,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 156,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 156,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 156,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 156,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 156,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 156,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 156,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 156,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 156,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 156,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 156,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 156,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 156,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 156,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 156,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 156,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 156,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 156,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 156,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 156,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 156,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 156,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 156,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 156,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 156,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 156,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[157] = {
		[26410] = {
			group_id = 157,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 157,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 157,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 157,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 157,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 157,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 157,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 157,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 157,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 157,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 157,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 157,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29446] = {
			group_id = 157,
			name = "路飞",
			probability = "1.001",
			id = 29446,
			num = 1
		},
		[25400] = {
			group_id = 157,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 157,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 157,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 157,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 157,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 157,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 157,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 157,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 157,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 157,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 157,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 157,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 157,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 157,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 157,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 157,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 157,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 157,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 157,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 157,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 157,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 157,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 157,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 157,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 157,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 157,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 157,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 157,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 157,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 157,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 157,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 157,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 157,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 157,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 157,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 157,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 157,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 157,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 157,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 157,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 157,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 157,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 157,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 157,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 157,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 157,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 157,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 157,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 157,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 157,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 157,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 157,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 157,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 157,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 157,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 157,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 157,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 157,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 157,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 157,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 157,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 157,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 157,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 157,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 157,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 157,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 157,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 157,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 157,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 157,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 157,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 157,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 157,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 157,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 157,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 157,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 157,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 157,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 157,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 157,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 157,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[158] = {
		[26410] = {
			group_id = 158,
			name = "辛西娅",
			probability = "0.023",
			id = 26410,
			num = 1
		},
		[24400] = {
			group_id = 158,
			name = "娜迦公主",
			probability = "0.023",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 158,
			name = "冰雪女王",
			probability = "0.023",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 158,
			name = "冰霜巨龙",
			probability = "0.059",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 158,
			name = "泰坦",
			probability = "0.023",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 158,
			name = "波塞冬",
			probability = "0.023",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 158,
			name = "派西斯",
			probability = "0.29",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 158,
			name = "少年梅林",
			probability = "0.058",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 158,
			name = "海宁芙",
			probability = "0.283",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 158,
			name = "阿瑞斯",
			probability = "0.291",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 158,
			name = "耶梦加得",
			probability = "0.023",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 158,
			name = "酒神",
			probability = "0.023",
			id = 24410,
			num = 1
		},
		[29448] = {
			group_id = 158,
			name = "贝克曼",
			probability = "1.001",
			id = 29448,
			num = 1
		},
		[25400] = {
			group_id = 158,
			name = "炽天使",
			probability = "0.059",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 158,
			name = "炎魔之王",
			probability = "0.059",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 158,
			name = "剑豪卡赞",
			probability = "0.291",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 158,
			name = "菲尼克斯",
			probability = "0.12",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 158,
			name = "阿波罗",
			probability = "0.059",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 158,
			name = "吸血伯爵",
			probability = "0.291",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 158,
			name = "普罗米修斯",
			probability = "0.023",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 158,
			name = "瓦尔基里",
			probability = "0.023",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 158,
			name = "洛基",
			probability = "0.023",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 158,
			name = "哪吒",
			probability = "0.023",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 158,
			name = "海姆达尔",
			probability = "0.059",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 158,
			name = "奥丁",
			probability = "0.059",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 158,
			name = "影刹",
			probability = "0.023",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 158,
			name = "凯兰崔尔",
			probability = "0.291",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 158,
			name = "魅魔女王",
			probability = "0.059",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 158,
			name = "美杜莎",
			probability = "0.291",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 158,
			name = "雅典娜",
			probability = "0.059",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 158,
			name = "潘",
			probability = "0.023",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 158,
			name = "斯芬克斯",
			probability = "0.023",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 158,
			name = "芬尼尔",
			probability = "0.023",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 158,
			name = "拉塔托斯克",
			probability = "0.023",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 158,
			name = "伊西斯",
			probability = "0.12",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 158,
			name = "宙斯",
			probability = "0.016",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 158,
			name = "赫拉",
			probability = "0.093",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 158,
			name = "雷神",
			probability = "0.093",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 158,
			name = "盖亚",
			probability = "0.12",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 158,
			name = "艾蕾莉亚",
			probability = "0.093",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 158,
			name = "神灵大祭司",
			probability = "0.016",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 158,
			name = "拉斐尔",
			probability = "0.016",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 158,
			name = "维纳斯",
			probability = "0.016",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 158,
			name = "蛇女墨莎",
			probability = "0.12",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 158,
			name = "哈迪斯",
			probability = "0.016",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 158,
			name = "亚巴顿",
			probability = "0.093",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 158,
			name = "黑暗之主",
			probability = "0.016",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 158,
			name = "阿努比斯",
			probability = "0.093",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 158,
			name = "路西法",
			probability = "0.12",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 158,
			name = "潘多拉",
			probability = "0.016",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 158,
			name = "海拉",
			probability = "0.016",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 158,
			name = "尼德霍格",
			probability = "0.016",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 158,
			name = "阿蒙",
			probability = "0.016",
			id = 28409,
			num = 1
		},
		[27409] = {
			group_id = 158,
			name = "加百列",
			probability = "0.016",
			id = 27409,
			num = 1
		},
		[24300] = {
			group_id = 158,
			name = "亚瑟",
			probability = "0.68",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 158,
			name = "竖琴海妖",
			probability = "0.68",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 158,
			name = "水元素",
			probability = "0.68",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 158,
			name = "冰晶女巫",
			probability = "0.68",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 158,
			name = "娜迦侍女",
			probability = "0.68",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 158,
			name = "火枪艾克",
			probability = "0.68",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 158,
			name = "凯瑟琳",
			probability = "0.68",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 158,
			name = "阿伽门农",
			probability = "0.68",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 158,
			name = "雷诺蛮锤",
			probability = "0.68",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 158,
			name = "翼女",
			probability = "0.68",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 158,
			name = "吟游诗人",
			probability = "0.68",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 158,
			name = "亡灵收割者",
			probability = "0.62",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 158,
			name = "圣锤提尔",
			probability = "0.68",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 158,
			name = "甘道夫",
			probability = "0.68",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 158,
			name = "德鲁伊",
			probability = "0.68",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 158,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 158,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 158,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 158,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 158,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 158,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 158,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 158,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 158,
			name = "魔法女学徒",
			probability = "4.7",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 158,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 158,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 158,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 158,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 158,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 158,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 158,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 158,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 158,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 158,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 158,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 158,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 158,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 158,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 158,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 158,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	}
}
