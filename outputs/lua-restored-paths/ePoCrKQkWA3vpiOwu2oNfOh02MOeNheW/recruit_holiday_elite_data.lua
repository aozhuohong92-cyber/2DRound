Config = Config or {}
Config.RecruitHolidayEliteData = Config.RecruitHolidayEliteData or {}
Config.RecruitHolidayEliteData.data_const_length = 3
Config.RecruitHolidayEliteData.data_const = {
	common_s = {
		val = 37010,
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

function Config.RecruitHolidayEliteData.data_const_fun(slot0)
	slot1 = Config.RecruitHolidayEliteData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitHolidayEliteData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RecruitHolidayEliteData.data_action_length = 53
Config.RecruitHolidayEliteData.data_action = {
	[51193] = {
		group_id = 10027,
		camp_id = 51193,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51222] = {
		group_id = 10028,
		camp_id = 51222,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51279] = {
		group_id = 10029,
		camp_id = 51279,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51334] = {
		group_id = 10030,
		camp_id = 51334,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51389] = {
		group_id = 10031,
		camp_id = 51389,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51416] = {
		group_id = 10032,
		camp_id = 51416,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51445] = {
		group_id = 10033,
		camp_id = 51445,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51472] = {
		group_id = 10034,
		camp_id = 51472,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51501] = {
		group_id = 10035,
		camp_id = 51501,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51528] = {
		group_id = 10036,
		camp_id = 51528,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51557] = {
		group_id = 10037,
		camp_id = 51557,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51584] = {
		group_id = 10038,
		camp_id = 51584,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51613] = {
		group_id = 10039,
		camp_id = 51613,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51640] = {
		group_id = 10040,
		camp_id = 51640,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51668] = {
		group_id = 10041,
		camp_id = 51668,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51695] = {
		group_id = 10042,
		camp_id = 51695,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51724] = {
		group_id = 10043,
		camp_id = 51724,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51752] = {
		group_id = 10044,
		camp_id = 51752,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51781] = {
		group_id = 10045,
		camp_id = 51781,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51809] = {
		group_id = 10046,
		camp_id = 51809,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51838] = {
		group_id = 10047,
		camp_id = 51838,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51865] = {
		group_id = 10048,
		camp_id = 51865,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51895] = {
		group_id = 10049,
		camp_id = 51895,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51922] = {
		group_id = 10050,
		camp_id = 51922,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51949] = {
		group_id = 10051,
		camp_id = 51949,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[51978] = {
		group_id = 10052,
		camp_id = 51978,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52005] = {
		group_id = 10053,
		camp_id = 52005,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52032] = {
		group_id = 10054,
		camp_id = 52032,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52062] = {
		group_id = 10055,
		camp_id = 52062,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52090] = {
		group_id = 10056,
		camp_id = 52090,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52117] = {
		group_id = 10057,
		camp_id = 52117,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52146] = {
		group_id = 10058,
		camp_id = 52146,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52173] = {
		group_id = 10059,
		camp_id = 52173,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52200] = {
		group_id = 10060,
		camp_id = 52200,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52229] = {
		group_id = 10061,
		camp_id = 52229,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52256] = {
		group_id = 10062,
		camp_id = 52256,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52283] = {
		group_id = 10063,
		camp_id = 52283,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52310] = {
		group_id = 10064,
		camp_id = 52310,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52337] = {
		group_id = 10065,
		camp_id = 52337,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52366] = {
		group_id = 10066,
		camp_id = 52366,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52393] = {
		group_id = 10067,
		camp_id = 52393,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52420] = {
		group_id = 10068,
		camp_id = 52420,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52447] = {
		group_id = 10069,
		camp_id = 52447,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52476] = {
		group_id = 10070,
		camp_id = 52476,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52504] = {
		group_id = 10071,
		camp_id = 52504,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52531] = {
		group_id = 10072,
		camp_id = 52531,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52558] = {
		group_id = 10073,
		camp_id = 52558,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52585] = {
		group_id = 10074,
		camp_id = 52585,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52615] = {
		group_id = 10075,
		camp_id = 52615,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52642] = {
		group_id = 10076,
		camp_id = 52642,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52670] = {
		group_id = 10077,
		camp_id = 52670,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52697] = {
		group_id = 10078,
		camp_id = 52697,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	},
	[52726] = {
		group_id = 10079,
		camp_id = 52726,
		desc = [[
1.活动期间，抽取新春赐福可以抽取到高级赐福中的所有道具。同时，<div fontcolor=#c23f35>【本期UP道具】的获取概率大幅提升！</div>（抽中道具时有<div fontcolor=#c23f35>50%</div>概率获取 UP内到具）
2.每次10连抽取必定获得<div fontcolor=#c23f35>橙色品质以上道具</div>
3.在新春赐福中，每60次抽取，<div fontcolor=#c23f35>必定获取当期概率提升的极品道具</div>。
4.通过新春赐福获取到本期概率提升极品道具时，最大剩余抽奖次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算]]
	}
}

function Config.RecruitHolidayEliteData.data_action_fun(slot0)
	slot1 = Config.RecruitHolidayEliteData.data_action[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitHolidayEliteData.data_action[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RecruitHolidayEliteData.data_summon_length = 53
Config.RecruitHolidayEliteData.data_summon = {
	[10027] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10027,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10028] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10028,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10029] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10029,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10030] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10030,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10031] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10031,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10032] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10032,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10033] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10033,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10034] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10034,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10035] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10035,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10036] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10036,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10037] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10037,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10038] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10038,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10039] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10039,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10040] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10040,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10041] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10041,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10042] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10042,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10043] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10043,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10044] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10044,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10045] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10045,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10046] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10046,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10047] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10047,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10048] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10048,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10049] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10049,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10050] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10050,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10051] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10051,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10052] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10052,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10053] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10053,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10054] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10054,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10055] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10055,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10056] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10056,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10057] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10057,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10058] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10058,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10059] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10059,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10060] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10060,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10061] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10061,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10062] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10062,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10063] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10063,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10064] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10064,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10065] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10065,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10066] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10066,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10067] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10067,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10068] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10068,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10069] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10069,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10070] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10070,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10071] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10071,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10072] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10072,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10073] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10073,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10074] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10074,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10075] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10075,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10076] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10076,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10077] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10077,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10078] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10078,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	},
	[10079] = {
		name = "精英召唤_加百列",
		action_name = "action",
		call_bg_action = 30,
		action_card_name = "action2",
		call_bg_card = "partnersummon_call_bg_118",
		call_bg = "partnersummon_call_bg_100",
		group_id = 10079,
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
				2200000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				200000000000.0
			}
		},
		loss_item_once = {
			{
				37010,
				1
			}
		},
		loss_item_ten = {
			{
				37010,
				10
			}
		}
	}
}

function Config.RecruitHolidayEliteData.data_summon_fun(slot0)
	slot1 = Config.RecruitHolidayEliteData.data_summon[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitHolidayEliteData.data_summon[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RecruitHolidayEliteData.data_award_length = 53
Config.RecruitHolidayEliteData.data_award = {
	[51193] = {
		{
			id = 1,
			camp_id = 51193,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51193,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51193,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51193,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51193,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51222] = {
		{
			id = 1,
			camp_id = 51222,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51222,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51222,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51222,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51222,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51279] = {
		{
			id = 1,
			camp_id = 51279,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51279,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51279,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51279,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51279,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51334] = {
		{
			id = 1,
			camp_id = 51334,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51334,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51334,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51334,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51334,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51389] = {
		{
			id = 1,
			camp_id = 51389,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51389,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51389,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51389,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51389,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51416] = {
		{
			id = 1,
			camp_id = 51416,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51416,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51416,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51416,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51416,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51445] = {
		{
			id = 1,
			camp_id = 51445,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51445,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51445,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51445,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51445,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51472] = {
		{
			id = 1,
			camp_id = 51472,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51472,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51472,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51472,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51472,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51501] = {
		{
			id = 1,
			camp_id = 51501,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51501,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51501,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51501,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51501,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51528] = {
		{
			id = 1,
			camp_id = 51528,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51528,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51528,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51528,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51528,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51557] = {
		{
			id = 1,
			camp_id = 51557,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51557,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51557,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51557,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51557,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51584] = {
		{
			id = 1,
			camp_id = 51584,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51584,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51584,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51584,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51584,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51613] = {
		{
			id = 1,
			camp_id = 51613,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51613,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51613,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51613,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51613,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51640] = {
		{
			id = 1,
			camp_id = 51640,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51640,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51640,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51640,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51640,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51668] = {
		{
			id = 1,
			camp_id = 51668,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51668,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51668,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51668,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51668,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51695] = {
		{
			id = 1,
			camp_id = 51695,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51695,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51695,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51695,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51695,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51724] = {
		{
			id = 1,
			camp_id = 51724,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51724,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51724,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51724,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51724,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51752] = {
		{
			id = 1,
			camp_id = 51752,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51752,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51752,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51752,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51752,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51781] = {
		{
			id = 1,
			camp_id = 51781,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51781,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51781,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51781,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51781,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51809] = {
		{
			id = 1,
			camp_id = 51809,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51809,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51809,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51809,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51809,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51838] = {
		{
			id = 1,
			camp_id = 51838,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51838,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51838,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51838,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51838,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51865] = {
		{
			id = 1,
			camp_id = 51865,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51865,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51865,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51865,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51865,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51895] = {
		{
			id = 1,
			camp_id = 51895,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51895,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51895,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51895,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51895,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51922] = {
		{
			id = 1,
			camp_id = 51922,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51922,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51922,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51922,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51922,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51949] = {
		{
			id = 1,
			camp_id = 51949,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51949,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51949,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51949,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51949,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[51978] = {
		{
			id = 1,
			camp_id = 51978,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 51978,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 51978,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 51978,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 51978,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52005] = {
		{
			id = 1,
			camp_id = 52005,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52005,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52005,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52005,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52005,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52032] = {
		{
			id = 1,
			camp_id = 52032,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52032,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52032,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52032,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52032,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52062] = {
		{
			id = 1,
			camp_id = 52062,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52062,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52062,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52062,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52062,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52090] = {
		{
			id = 1,
			camp_id = 52090,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52090,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52090,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52090,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52090,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52117] = {
		{
			id = 1,
			camp_id = 52117,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52117,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52117,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52117,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52117,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52146] = {
		{
			id = 1,
			camp_id = 52146,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52146,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52146,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52146,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52146,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52173] = {
		{
			id = 1,
			camp_id = 52173,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52173,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52173,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52173,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52173,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52200] = {
		{
			id = 1,
			camp_id = 52200,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52200,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52200,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52200,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52200,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52229] = {
		{
			id = 1,
			camp_id = 52229,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52229,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52229,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52229,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52229,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52256] = {
		{
			id = 1,
			camp_id = 52256,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52256,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52256,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52256,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52256,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52283] = {
		{
			id = 1,
			camp_id = 52283,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52283,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52283,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52283,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52283,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52310] = {
		{
			id = 1,
			camp_id = 52310,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52310,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52310,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52310,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52310,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52337] = {
		{
			id = 1,
			camp_id = 52337,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52337,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52337,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52337,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52337,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52366] = {
		{
			id = 1,
			camp_id = 52366,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52366,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52366,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52366,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52366,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52393] = {
		{
			id = 1,
			camp_id = 52393,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52393,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52393,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52393,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52393,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52420] = {
		{
			id = 1,
			camp_id = 52420,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52420,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52420,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52420,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52420,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52447] = {
		{
			id = 1,
			camp_id = 52447,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52447,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52447,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52447,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52447,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52476] = {
		{
			id = 1,
			camp_id = 52476,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52476,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52476,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52476,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52476,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52504] = {
		{
			id = 1,
			camp_id = 52504,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52504,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52504,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52504,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52504,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52531] = {
		{
			id = 1,
			camp_id = 52531,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52531,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52531,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52531,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52531,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52558] = {
		{
			id = 1,
			camp_id = 52558,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52558,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52558,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52558,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52558,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52585] = {
		{
			id = 1,
			camp_id = 52585,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52585,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52585,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52585,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52585,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52615] = {
		{
			id = 1,
			camp_id = 52615,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52615,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52615,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52615,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52615,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52642] = {
		{
			id = 1,
			camp_id = 52642,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52642,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52642,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52642,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52642,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52670] = {
		{
			id = 1,
			camp_id = 52670,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52670,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52670,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52670,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52670,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52697] = {
		{
			id = 1,
			camp_id = 52697,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52697,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52697,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52697,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52697,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	},
	[52726] = {
		{
			id = 1,
			camp_id = 52726,
			times = 30,
			reward = {
				{
					10490,
					10
				}
			}
		},
		{
			id = 2,
			camp_id = 52726,
			times = 50,
			reward = {
				{
					10490,
					40
				}
			}
		},
		{
			id = 3,
			camp_id = 52726,
			times = 100,
			reward = {
				{
					10490,
					100
				}
			}
		},
		{
			id = 4,
			camp_id = 52726,
			times = 200,
			reward = {
				{
					10490,
					200
				}
			}
		},
		{
			id = 5,
			camp_id = 52726,
			times = 300,
			reward = {
				{
					10490,
					300
				}
			}
		}
	}
}
Config.RecruitHolidayEliteData.data_probability_length = 53
Config.RecruitHolidayEliteData.data_probability = {
	[10027] = {
		{
			group_id = 10027,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10027,
			is_up = 1,
			index = 2,
			name = "皮肤自选礼盒",
			id = 200001,
			num = 1,
			star = "皮肤",
			probability = "1"
		},
		{
			group_id = 10027,
			is_up = 1,
			index = 3,
			name = "传奇自选卡",
			id = 641236,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10027,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10027,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10027,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10028] = {
		{
			group_id = 10028,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10028,
			is_up = 1,
			index = 2,
			name = "皮肤自选礼盒",
			id = 200001,
			num = 1,
			star = "皮肤",
			probability = "1"
		},
		{
			group_id = 10028,
			is_up = 1,
			index = 3,
			name = "传奇自选卡",
			id = 641236,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10028,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10028,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10028,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10029] = {
		{
			group_id = 10029,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10029,
			is_up = 1,
			index = 2,
			name = "皮肤自选礼盒",
			id = 200001,
			num = 1,
			star = "皮肤",
			probability = "1"
		},
		{
			group_id = 10029,
			is_up = 1,
			index = 3,
			name = "传奇自选卡",
			id = 641236,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10029,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10029,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10029,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10030] = {
		{
			group_id = 10030,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10030,
			is_up = 1,
			index = 2,
			name = "皮肤自选礼盒",
			id = 200001,
			num = 1,
			star = "皮肤",
			probability = "1"
		},
		{
			group_id = 10030,
			is_up = 1,
			index = 3,
			name = "传奇自选卡",
			id = 641236,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10030,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10030,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10030,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10031] = {
		{
			group_id = 10031,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10031,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10031,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10031,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10031,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10031,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10032] = {
		{
			group_id = 10032,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10032,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10032,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10032,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10032,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10032,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10033] = {
		{
			group_id = 10033,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10033,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10033,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10033,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10033,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10033,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10034] = {
		{
			group_id = 10034,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10034,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10034,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10034,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10034,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10034,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10035] = {
		{
			group_id = 10035,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10035,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10035,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10035,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10035,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10035,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10036] = {
		{
			group_id = 10036,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10036,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10036,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10036,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10036,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10036,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10037] = {
		{
			group_id = 10037,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10037,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10037,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10037,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10037,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10037,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10038] = {
		{
			group_id = 10038,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10038,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10038,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10038,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10038,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10038,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10039] = {
		{
			group_id = 10039,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10039,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10039,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10039,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10039,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10039,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10040] = {
		{
			group_id = 10040,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10040,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10040,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10040,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10040,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10040,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10041] = {
		{
			group_id = 10041,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10041,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10041,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10041,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10041,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10041,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10042] = {
		{
			group_id = 10042,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10042,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10042,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10042,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10042,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10042,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10043] = {
		{
			group_id = 10043,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10043,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10043,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10043,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10043,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10043,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10044] = {
		{
			group_id = 10044,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10044,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10044,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10044,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10044,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10044,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10045] = {
		{
			group_id = 10045,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10045,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10045,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10045,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10045,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10045,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10046] = {
		{
			group_id = 10046,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10046,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10046,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10046,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10046,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10046,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10047] = {
		{
			group_id = 10047,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10047,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10047,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10047,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10047,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10047,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10048] = {
		{
			group_id = 10048,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10048,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10048,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10048,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10048,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10048,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10049] = {
		{
			group_id = 10049,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10049,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10049,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10049,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10049,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10049,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10050] = {
		{
			group_id = 10050,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10050,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10050,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10050,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10050,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10050,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10051] = {
		{
			group_id = 10051,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10051,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10051,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10051,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10051,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10051,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10052] = {
		{
			group_id = 10052,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10052,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10052,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10052,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10052,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10052,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10053] = {
		{
			group_id = 10053,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10053,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10053,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10053,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10053,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10053,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10054] = {
		{
			group_id = 10054,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10054,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10054,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10054,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10054,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10054,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10055] = {
		{
			group_id = 10055,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10055,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10055,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10055,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10055,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10055,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10056] = {
		{
			group_id = 10056,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10056,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10056,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10056,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10056,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10056,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10057] = {
		{
			group_id = 10057,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10057,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10057,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10057,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10057,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10057,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10058] = {
		{
			group_id = 10058,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10058,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10058,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10058,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10058,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10058,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10059] = {
		{
			group_id = 10059,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10059,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10059,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10059,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10059,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10059,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10060] = {
		{
			group_id = 10060,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10060,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10060,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10060,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10060,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10060,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10061] = {
		{
			group_id = 10061,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10061,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10061,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10061,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10061,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10061,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10062] = {
		{
			group_id = 10062,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10062,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10062,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10062,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10062,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10062,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10063] = {
		{
			group_id = 10063,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10063,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10063,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10063,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10063,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10063,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10064] = {
		{
			group_id = 10064,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10064,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10064,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10064,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10064,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10064,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10065] = {
		{
			group_id = 10065,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10065,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10065,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10065,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10065,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10065,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10066] = {
		{
			group_id = 10066,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10066,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10066,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10066,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10066,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10066,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10067] = {
		{
			group_id = 10067,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10067,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10067,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10067,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10067,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10067,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10068] = {
		{
			group_id = 10068,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10068,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10068,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10068,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10068,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10068,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10069] = {
		{
			group_id = 10069,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10069,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10069,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10069,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10069,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10069,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10070] = {
		{
			group_id = 10070,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10070,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10070,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10070,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10070,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10070,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10071] = {
		{
			group_id = 10071,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10071,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10071,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10071,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10071,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10071,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10072] = {
		{
			group_id = 10072,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10072,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10072,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10072,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10072,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10072,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10073] = {
		{
			group_id = 10073,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10073,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10073,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10073,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10073,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10073,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10074] = {
		{
			group_id = 10074,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10074,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10074,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10074,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10074,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10074,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10075] = {
		{
			group_id = 10075,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10075,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10075,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10075,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10075,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10075,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10076] = {
		{
			group_id = 10076,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10076,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10076,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10076,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10076,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10076,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10077] = {
		{
			group_id = 10077,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10077,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10077,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10077,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10077,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10077,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10078] = {
		{
			group_id = 10078,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10078,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10078,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10078,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10078,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10078,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	},
	[10079] = {
		{
			group_id = 10079,
			is_up = 1,
			index = 1,
			name = "6星金装自选礼包",
			id = 88828,
			num = 1,
			star = "装备",
			probability = "1"
		},
		{
			group_id = 10079,
			is_up = 1,
			index = 2,
			name = "极品9星神装自选礼包",
			id = 39527,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10079,
			is_up = 1,
			index = 3,
			name = "英雄称号自选礼包",
			id = 888805,
			num = 1,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10079,
			is_up = 0,
			index = 4,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10079,
			is_up = 0,
			index = 5,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		},
		{
			group_id = 10079,
			is_up = 0,
			index = 6,
			name = "其他道具",
			id = 0,
			num = 0,
			star = "道具",
			probability = "1"
		}
	}
}
Config.RecruitHolidayEliteData.data_hero_show_length = 53
slot3[1] = {
	group_id = 10027,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10028,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10029,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10030,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10031,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10032,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10033,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10034,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10035,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10036,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10037,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10038,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10039,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10040,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10041,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10042,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10043,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10044,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10045,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10046,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10047,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10048,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10049,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10050,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10051,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10052,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10053,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10054,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10055,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10056,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10057,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10058,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10059,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10060,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10061,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10062,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10063,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10064,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10065,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10066,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10067,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10068,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10069,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10070,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10071,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10072,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10073,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10074,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10075,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10076,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10077,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10078,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
slot3[1] = {
	group_id = 10079,
	name = "贝里",
	probability = "10",
	id = 1,
	num = 1000000
}
Config.RecruitHolidayEliteData.data_hero_show = {
	[10027] = {
		{
			group_id = 10027,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10027,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10027,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10027,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10027,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10027,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10027,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10027,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10027,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10027,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10027,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10027,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10027,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10027,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10027,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10027,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10027,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10027,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10027,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10027,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10027,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10027,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10027,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10027,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10027,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10027,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10027,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		{
			group_id = 10027,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		{
			group_id = 10027,
			name = "传奇皮肤自选礼盒",
			probability = "0.5",
			id = 200002,
			num = 2
		},
		[10] = {
			group_id = 10027,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10027,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10027,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10027,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10027,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10027,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10027,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10027,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10027,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10027,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10027,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10027,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10027,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10027,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10027,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10027,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10027,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10027,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10027,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10027,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10027,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10027,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10027,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10027,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10027,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10027,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10027,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10027,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10027,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10027,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10027,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10027,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10027,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10027,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10027,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10027,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10027,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10027,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10027,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10027,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10027,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10027,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10027,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10027,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10027,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10027,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10027,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10027,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10027,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10027,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10027,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10027,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10027,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10027,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10027,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10027,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10027,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10027,
			name = "传奇自选卡",
			probability = "0.67",
			id = 641236,
			num = 10
		},
		[200001] = {
			group_id = 10027,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[200002] = {
			group_id = 10027,
			name = "传奇皮肤自选礼盒",
			probability = "0.67",
			id = 200002,
			num = 10
		}
	},
	[10028] = {
		{
			group_id = 10028,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10028,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10028,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10028,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10028,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10028,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10028,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10028,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10028,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10028,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10028,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10028,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10028,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10028,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10028,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10028,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10028,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10028,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10028,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10028,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10028,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10028,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10028,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10028,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10028,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10028,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10028,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		{
			group_id = 10028,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		{
			group_id = 10028,
			name = "传奇皮肤自选礼盒",
			probability = "0.5",
			id = 200002,
			num = 2
		},
		[10] = {
			group_id = 10028,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10028,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10028,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10028,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10028,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10028,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10028,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10028,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10028,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10028,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10028,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10028,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10028,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10028,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10028,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10028,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10028,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10028,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10028,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10028,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10028,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10028,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10028,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10028,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10028,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10028,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10028,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10028,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10028,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10028,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10028,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10028,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10028,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10028,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10028,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10028,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10028,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10028,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10028,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10028,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10028,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10028,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10028,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10028,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10028,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10028,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10028,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10028,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10028,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10028,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10028,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10028,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10028,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10028,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10028,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10028,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10028,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10028,
			name = "传奇自选卡",
			probability = "0.67",
			id = 641236,
			num = 10
		},
		[200001] = {
			group_id = 10028,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[200002] = {
			group_id = 10028,
			name = "传奇皮肤自选礼盒",
			probability = "0.67",
			id = 200002,
			num = 10
		}
	},
	[10029] = {
		{
			group_id = 10029,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10029,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10029,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10029,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10029,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10029,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10029,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10029,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10029,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10029,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10029,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10029,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10029,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10029,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10029,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10029,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10029,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10029,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10029,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10029,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10029,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10029,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10029,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10029,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10029,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10029,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10029,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		{
			group_id = 10029,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		{
			group_id = 10029,
			name = "传奇皮肤自选礼盒",
			probability = "0.5",
			id = 200002,
			num = 2
		},
		[10] = {
			group_id = 10029,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10029,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10029,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10029,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10029,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10029,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10029,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10029,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10029,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10029,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10029,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10029,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10029,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10029,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10029,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10029,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10029,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10029,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10029,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10029,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10029,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10029,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10029,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10029,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10029,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10029,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10029,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10029,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10029,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10029,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10029,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10029,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10029,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10029,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10029,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10029,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10029,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10029,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10029,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10029,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10029,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10029,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10029,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10029,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10029,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10029,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10029,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10029,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10029,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10029,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10029,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10029,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10029,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10029,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10029,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10029,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10029,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10029,
			name = "传奇自选卡",
			probability = "0.67",
			id = 641236,
			num = 10
		},
		[200001] = {
			group_id = 10029,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[200002] = {
			group_id = 10029,
			name = "传奇皮肤自选礼盒",
			probability = "0.67",
			id = 200002,
			num = 10
		}
	},
	[10030] = {
		{
			group_id = 10030,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10030,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10030,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10030,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10030,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10030,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10030,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10030,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10030,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10030,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10030,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10030,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10030,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10030,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10030,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10030,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10030,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10030,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10030,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10030,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10030,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10030,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10030,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10030,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10030,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10030,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10030,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		{
			group_id = 10030,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		{
			group_id = 10030,
			name = "传奇皮肤自选礼盒",
			probability = "0.5",
			id = 200002,
			num = 2
		},
		[10] = {
			group_id = 10030,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10030,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10030,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10030,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10030,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10030,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10030,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10030,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10030,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10030,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10030,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10030,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10030,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10030,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10030,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10030,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10030,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10030,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10030,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10030,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10030,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10030,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10030,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10030,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10030,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10030,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10030,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10030,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10030,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10030,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10030,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10030,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10030,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10030,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10030,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10030,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10030,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10030,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10030,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10030,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10030,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10030,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10030,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10030,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10030,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10030,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10030,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10030,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10030,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10030,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10030,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10030,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10030,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10030,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10030,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10030,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10030,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10030,
			name = "传奇自选卡",
			probability = "0.67",
			id = 641236,
			num = 10
		},
		[200001] = {
			group_id = 10030,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[200002] = {
			group_id = 10030,
			name = "传奇皮肤自选礼盒",
			probability = "0.67",
			id = 200002,
			num = 10
		}
	},
	[10031] = {
		{
			group_id = 10031,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10031,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10031,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10031,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10031,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10031,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10031,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10031,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10031,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10031,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10031,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10031,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10031,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10031,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10031,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10031,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10031,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10031,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10031,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10031,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10031,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10031,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10031,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10031,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10031,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10031,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10031,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10031,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10031,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10031,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10031,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10031,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10031,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10031,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10031,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10031,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10031,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10031,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10031,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10031,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10031,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10031,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10031,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10031,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10031,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10031,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10031,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10031,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10031,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10031,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10031,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10031,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10031,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10031,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10031,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10031,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10031,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10031,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10031,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10031,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10031,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10031,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10031,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10031,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10031,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10031,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10031,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10031,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10031,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10031,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10031,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10031,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10031,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10031,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10031,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10031,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10031,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10031,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10031,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10031,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10031,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10031,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10031,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10031,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10031,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10031,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10031,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10031,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10032] = {
		{
			group_id = 10032,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10032,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10032,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10032,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10032,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10032,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10032,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10032,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10032,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10032,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10032,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10032,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10032,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10032,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10032,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10032,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10032,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10032,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10032,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10032,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10032,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10032,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10032,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10032,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10032,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10032,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10032,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10032,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10032,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10032,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10032,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10032,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10032,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10032,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10032,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10032,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10032,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10032,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10032,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10032,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10032,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10032,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10032,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10032,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10032,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10032,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10032,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10032,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10032,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10032,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10032,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10032,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10032,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10032,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10032,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10032,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10032,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10032,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10032,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10032,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10032,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10032,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10032,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10032,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10032,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10032,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10032,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10032,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10032,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10032,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10032,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10032,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10032,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10032,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10032,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10032,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10032,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10032,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10032,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10032,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10032,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10032,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10032,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10032,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10032,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10032,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10032,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10032,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10033] = {
		{
			group_id = 10033,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10033,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10033,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10033,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10033,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10033,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10033,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10033,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10033,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10033,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10033,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10033,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10033,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10033,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10033,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10033,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10033,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10033,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10033,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10033,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10033,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10033,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10033,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10033,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10033,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10033,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10033,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10033,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10033,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10033,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10033,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10033,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10033,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10033,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10033,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10033,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10033,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10033,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10033,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10033,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10033,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10033,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10033,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10033,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10033,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10033,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10033,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10033,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10033,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10033,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10033,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10033,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10033,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10033,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10033,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10033,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10033,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10033,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10033,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10033,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10033,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10033,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10033,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10033,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10033,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10033,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10033,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10033,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10033,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10033,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10033,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10033,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10033,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10033,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10033,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10033,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10033,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10033,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10033,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10033,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10033,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10033,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10033,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10033,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10033,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10033,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10033,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10033,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10034] = {
		{
			group_id = 10034,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10034,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10034,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10034,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10034,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10034,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10034,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10034,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10034,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10034,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10034,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10034,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10034,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10034,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10034,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10034,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10034,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10034,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10034,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10034,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10034,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10034,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10034,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10034,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10034,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10034,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10034,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10034,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10034,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10034,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10034,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10034,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10034,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10034,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10034,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10034,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10034,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10034,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10034,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10034,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10034,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10034,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10034,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10034,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10034,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10034,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10034,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10034,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10034,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10034,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10034,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10034,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10034,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10034,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10034,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10034,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10034,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10034,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10034,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10034,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10034,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10034,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10034,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10034,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10034,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10034,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10034,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10034,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10034,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10034,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10034,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10034,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10034,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10034,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10034,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10034,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10034,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10034,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10034,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10034,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10034,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10034,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10034,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10034,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10034,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10034,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10034,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10034,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10035] = {
		{
			group_id = 10035,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10035,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10035,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10035,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10035,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10035,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10035,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10035,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10035,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10035,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10035,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10035,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10035,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10035,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10035,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10035,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10035,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10035,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10035,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10035,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10035,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10035,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10035,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10035,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10035,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10035,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10035,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10035,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10035,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10035,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10035,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10035,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10035,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10035,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10035,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10035,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10035,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10035,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10035,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10035,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10035,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10035,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10035,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10035,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10035,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10035,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10035,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10035,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10035,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10035,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10035,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10035,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10035,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10035,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10035,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10035,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10035,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10035,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10035,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10035,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10035,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10035,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10035,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10035,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10035,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10035,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10035,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10035,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10035,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10035,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10035,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10035,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10035,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10035,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10035,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10035,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10035,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10035,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10035,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10035,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10035,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10035,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10035,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10035,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10035,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10035,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10035,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10035,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10036] = {
		{
			group_id = 10036,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10036,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10036,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10036,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10036,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10036,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10036,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10036,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10036,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10036,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10036,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10036,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10036,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10036,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10036,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10036,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10036,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10036,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10036,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10036,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10036,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10036,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10036,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10036,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10036,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10036,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10036,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10036,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10036,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10036,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10036,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10036,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10036,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10036,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10036,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10036,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10036,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10036,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10036,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10036,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10036,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10036,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10036,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10036,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10036,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10036,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10036,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10036,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10036,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10036,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10036,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10036,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10036,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10036,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10036,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10036,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10036,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10036,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10036,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10036,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10036,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10036,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10036,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10036,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10036,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10036,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10036,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10036,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10036,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10036,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10036,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10036,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10036,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10036,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10036,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10036,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10036,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10036,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10036,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10036,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10036,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10036,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10036,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10036,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10036,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10036,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10036,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10036,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10037] = {
		{
			group_id = 10037,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10037,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10037,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10037,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10037,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10037,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10037,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10037,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10037,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10037,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10037,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10037,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10037,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10037,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10037,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10037,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10037,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10037,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10037,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10037,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10037,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10037,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10037,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10037,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10037,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10037,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10037,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10037,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10037,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10037,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10037,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10037,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10037,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10037,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10037,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10037,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10037,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10037,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10037,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10037,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10037,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10037,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10037,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10037,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10037,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10037,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10037,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10037,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10037,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10037,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10037,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10037,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10037,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10037,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10037,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10037,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10037,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10037,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10037,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10037,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10037,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10037,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10037,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10037,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10037,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10037,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10037,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10037,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10037,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10037,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10037,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10037,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10037,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10037,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10037,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10037,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10037,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10037,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10037,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10037,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10037,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10037,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10037,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10037,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10037,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10037,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10037,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10037,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10038] = {
		{
			group_id = 10038,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10038,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10038,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10038,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10038,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10038,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10038,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10038,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10038,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10038,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10038,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10038,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10038,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10038,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10038,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10038,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10038,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10038,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10038,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10038,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10038,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10038,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10038,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10038,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10038,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10038,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10038,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10038,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10038,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10038,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10038,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10038,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10038,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10038,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10038,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10038,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10038,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10038,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10038,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10038,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10038,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10038,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10038,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10038,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10038,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10038,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10038,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10038,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10038,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10038,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10038,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10038,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10038,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10038,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10038,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10038,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10038,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10038,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10038,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10038,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10038,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10038,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10038,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10038,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10038,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10038,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10038,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10038,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10038,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10038,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10038,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10038,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10038,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10038,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10038,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10038,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10038,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10038,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10038,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10038,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10038,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10038,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10038,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10038,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10038,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10038,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10038,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10038,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10039] = {
		{
			group_id = 10039,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10039,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10039,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10039,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10039,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10039,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10039,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10039,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10039,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10039,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10039,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10039,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10039,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10039,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10039,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10039,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10039,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10039,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10039,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10039,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10039,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10039,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10039,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10039,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10039,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10039,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10039,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10039,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10039,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10039,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10039,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10039,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10039,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10039,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10039,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10039,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10039,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10039,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10039,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10039,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10039,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10039,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10039,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10039,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10039,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10039,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10039,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10039,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10039,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10039,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10039,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10039,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10039,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10039,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10039,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10039,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10039,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10039,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10039,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10039,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10039,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10039,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10039,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10039,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10039,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10039,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10039,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10039,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10039,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10039,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10039,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10039,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10039,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10039,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10039,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10039,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10039,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10039,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10039,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10039,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10039,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10039,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10039,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10039,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10039,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10039,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10039,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10039,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10040] = {
		{
			group_id = 10040,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10040,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10040,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10040,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10040,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10040,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10040,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10040,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10040,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10040,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10040,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10040,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10040,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10040,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10040,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10040,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10040,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10040,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10040,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10040,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10040,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10040,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10040,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10040,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10040,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10040,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10040,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10040,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10040,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10040,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10040,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10040,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10040,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10040,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10040,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10040,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10040,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10040,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10040,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10040,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10040,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10040,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10040,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10040,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10040,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10040,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10040,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10040,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10040,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10040,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10040,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10040,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10040,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10040,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10040,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10040,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10040,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10040,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10040,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10040,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10040,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10040,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10040,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10040,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10040,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10040,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10040,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10040,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10040,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10040,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10040,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10040,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10040,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10040,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10040,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10040,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10040,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10040,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10040,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10040,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10040,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10040,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10040,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10040,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10040,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10040,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10040,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10040,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10041] = {
		{
			group_id = 10041,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10041,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10041,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10041,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10041,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10041,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10041,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10041,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10041,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10041,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10041,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10041,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10041,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10041,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10041,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10041,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10041,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10041,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10041,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10041,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10041,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10041,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10041,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10041,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10041,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10041,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10041,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10041,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10041,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10041,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10041,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10041,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10041,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10041,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10041,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10041,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10041,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10041,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10041,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10041,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10041,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10041,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10041,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10041,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10041,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10041,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10041,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10041,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10041,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10041,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10041,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10041,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10041,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10041,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10041,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10041,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10041,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10041,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10041,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10041,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10041,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10041,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10041,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10041,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10041,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10041,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10041,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10041,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10041,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10041,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10041,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10041,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10041,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10041,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10041,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10041,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10041,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10041,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10041,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10041,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10041,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10041,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10041,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10041,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10041,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10041,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10041,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10041,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10042] = {
		{
			group_id = 10042,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10042,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10042,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10042,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10042,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10042,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10042,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10042,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10042,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10042,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10042,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10042,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10042,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10042,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10042,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10042,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10042,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10042,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10042,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10042,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10042,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10042,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10042,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10042,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10042,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10042,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10042,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10042,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10042,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10042,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10042,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10042,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10042,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10042,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10042,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10042,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10042,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10042,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10042,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10042,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10042,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10042,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10042,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10042,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10042,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10042,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10042,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10042,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10042,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10042,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10042,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10042,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10042,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10042,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10042,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10042,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10042,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10042,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10042,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10042,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10042,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10042,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10042,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10042,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10042,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10042,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10042,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10042,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10042,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10042,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10042,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10042,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10042,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10042,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10042,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10042,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10042,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10042,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10042,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10042,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10042,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10042,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10042,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10042,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10042,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10042,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10042,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10042,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10043] = {
		{
			group_id = 10043,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10043,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10043,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10043,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10043,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10043,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10043,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10043,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10043,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10043,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10043,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10043,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10043,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10043,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10043,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10043,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10043,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10043,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10043,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10043,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10043,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10043,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10043,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10043,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10043,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10043,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10043,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10043,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10043,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10043,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10043,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10043,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10043,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10043,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10043,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10043,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10043,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10043,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10043,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10043,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10043,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10043,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10043,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10043,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10043,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10043,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10043,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10043,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10043,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10043,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10043,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10043,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10043,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10043,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10043,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10043,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10043,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10043,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10043,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10043,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10043,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10043,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10043,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10043,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10043,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10043,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10043,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10043,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10043,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10043,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10043,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10043,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10043,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10043,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10043,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10043,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10043,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10043,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10043,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10043,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10043,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10043,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10043,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10043,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10043,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10043,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10043,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10043,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10044] = {
		{
			group_id = 10044,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10044,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10044,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10044,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10044,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10044,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10044,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10044,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10044,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10044,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10044,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10044,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10044,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10044,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10044,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10044,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10044,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10044,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10044,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10044,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10044,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10044,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10044,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10044,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10044,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10044,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10044,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10044,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10044,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10044,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10044,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10044,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10044,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10044,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10044,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10044,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10044,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10044,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10044,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10044,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10044,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10044,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10044,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10044,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10044,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10044,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10044,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10044,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10044,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10044,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10044,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10044,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10044,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10044,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10044,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10044,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10044,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10044,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10044,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10044,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10044,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10044,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10044,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10044,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10044,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10044,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10044,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10044,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10044,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10044,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10044,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10044,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10044,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10044,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10044,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10044,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10044,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10044,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10044,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10044,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10044,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10044,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10044,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10044,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10044,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10044,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10044,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10044,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10045] = {
		{
			group_id = 10045,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10045,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10045,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10045,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10045,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10045,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10045,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10045,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10045,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10045,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10045,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10045,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10045,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10045,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10045,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10045,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10045,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10045,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10045,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10045,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10045,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10045,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10045,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10045,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10045,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10045,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10045,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10045,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10045,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10045,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10045,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10045,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10045,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10045,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10045,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10045,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10045,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10045,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10045,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10045,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10045,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10045,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10045,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10045,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10045,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10045,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10045,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10045,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10045,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10045,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10045,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10045,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10045,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10045,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10045,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10045,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10045,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10045,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10045,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10045,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10045,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10045,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10045,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10045,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10045,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10045,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10045,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10045,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10045,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10045,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10045,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10045,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10045,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10045,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10045,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10045,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10045,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10045,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10045,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10045,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10045,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10045,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10045,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10045,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10045,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10045,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10045,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10045,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10046] = {
		{
			group_id = 10046,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10046,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10046,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10046,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10046,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10046,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10046,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10046,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10046,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10046,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10046,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10046,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10046,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10046,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10046,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10046,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10046,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10046,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10046,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10046,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10046,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10046,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10046,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10046,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10046,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10046,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10046,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10046,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10046,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10046,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10046,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10046,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10046,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10046,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10046,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10046,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10046,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10046,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10046,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10046,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10046,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10046,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10046,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10046,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10046,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10046,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10046,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10046,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10046,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10046,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10046,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10046,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10046,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10046,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10046,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10046,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10046,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10046,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10046,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10046,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10046,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10046,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10046,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10046,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10046,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10046,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10046,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10046,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10046,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10046,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10046,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10046,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10046,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10046,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10046,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10046,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10046,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10046,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10046,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10046,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10046,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10046,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10046,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10046,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10046,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10046,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10046,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10046,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10047] = {
		{
			group_id = 10047,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10047,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10047,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10047,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10047,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10047,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10047,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10047,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10047,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10047,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10047,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10047,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10047,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10047,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10047,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10047,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10047,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10047,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10047,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10047,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10047,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10047,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10047,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10047,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10047,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10047,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10047,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10047,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10047,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10047,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10047,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10047,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10047,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10047,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10047,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10047,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10047,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10047,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10047,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10047,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10047,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10047,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10047,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10047,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10047,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10047,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10047,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10047,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10047,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10047,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10047,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10047,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10047,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10047,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10047,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10047,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10047,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10047,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10047,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10047,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10047,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10047,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10047,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10047,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10047,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10047,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10047,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10047,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10047,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10047,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10047,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10047,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10047,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10047,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10047,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10047,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10047,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10047,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10047,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10047,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10047,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10047,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10047,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10047,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10047,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10047,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10047,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10047,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10048] = {
		{
			group_id = 10048,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10048,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10048,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10048,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10048,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10048,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10048,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10048,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10048,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10048,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10048,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10048,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10048,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10048,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10048,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10048,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10048,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10048,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10048,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10048,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10048,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10048,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10048,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10048,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10048,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10048,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10048,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10048,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10048,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10048,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10048,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10048,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10048,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10048,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10048,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10048,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10048,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10048,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10048,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10048,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10048,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10048,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10048,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10048,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10048,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10048,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10048,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10048,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10048,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10048,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10048,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10048,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10048,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10048,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10048,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10048,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10048,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10048,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10048,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10048,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10048,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10048,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10048,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10048,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10048,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10048,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10048,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10048,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10048,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10048,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10048,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10048,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10048,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10048,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10048,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10048,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10048,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10048,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10048,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10048,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10048,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10048,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10048,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10048,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10048,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10048,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10048,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10048,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10049] = {
		{
			group_id = 10049,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10049,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10049,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10049,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10049,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10049,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10049,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10049,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10049,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10049,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10049,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10049,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10049,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10049,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10049,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10049,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10049,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10049,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10049,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10049,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10049,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10049,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10049,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10049,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10049,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10049,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10049,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10049,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10049,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10049,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10049,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10049,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10049,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10049,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10049,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10049,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10049,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10049,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10049,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10049,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10049,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10049,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10049,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10049,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10049,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10049,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10049,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10049,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10049,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10049,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10049,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10049,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10049,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10049,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10049,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10049,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10049,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10049,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10049,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10049,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10049,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10049,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10049,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10049,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10049,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10049,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10049,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10049,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10049,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10049,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10049,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10049,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10049,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10049,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10049,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10049,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10049,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10049,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10049,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10049,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10049,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10049,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10049,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10049,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10049,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10049,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10049,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10049,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10050] = {
		{
			group_id = 10050,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10050,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10050,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10050,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10050,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10050,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10050,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10050,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10050,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10050,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10050,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10050,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10050,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10050,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10050,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10050,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10050,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10050,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10050,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10050,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10050,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10050,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10050,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10050,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10050,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10050,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10050,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10050,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10050,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10050,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10050,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10050,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10050,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10050,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10050,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10050,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10050,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10050,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10050,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10050,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10050,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10050,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10050,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10050,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10050,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10050,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10050,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10050,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10050,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10050,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10050,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10050,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10050,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10050,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10050,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10050,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10050,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10050,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10050,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10050,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10050,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10050,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10050,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10050,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10050,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10050,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10050,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10050,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10050,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10050,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10050,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10050,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10050,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10050,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10050,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10050,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10050,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10050,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10050,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10050,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10050,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10050,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10050,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10050,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10050,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10050,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10050,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10050,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10051] = {
		{
			group_id = 10051,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10051,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10051,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10051,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10051,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10051,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10051,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10051,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10051,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10051,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10051,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10051,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10051,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10051,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10051,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10051,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10051,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10051,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10051,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10051,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10051,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10051,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10051,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10051,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10051,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10051,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10051,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10051,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10051,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10051,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10051,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10051,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10051,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10051,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10051,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10051,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10051,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10051,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10051,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10051,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10051,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10051,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10051,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10051,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10051,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10051,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10051,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10051,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10051,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10051,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10051,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10051,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10051,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10051,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10051,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10051,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10051,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10051,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10051,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10051,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10051,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10051,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10051,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10051,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10051,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10051,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10051,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10051,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10051,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10051,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10051,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10051,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10051,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10051,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10051,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10051,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10051,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10051,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10051,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10051,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10051,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10051,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10051,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10051,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10051,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10051,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10051,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10051,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10052] = {
		{
			group_id = 10052,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10052,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10052,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10052,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10052,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10052,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10052,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10052,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10052,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10052,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10052,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10052,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10052,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10052,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10052,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10052,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10052,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10052,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10052,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10052,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10052,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10052,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10052,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10052,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10052,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10052,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10052,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10052,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10052,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10052,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10052,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10052,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10052,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10052,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10052,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10052,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10052,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10052,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10052,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10052,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10052,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10052,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10052,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10052,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10052,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10052,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10052,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10052,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10052,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10052,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10052,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10052,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10052,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10052,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10052,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10052,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10052,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10052,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10052,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10052,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10052,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10052,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10052,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10052,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10052,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10052,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10052,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10052,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10052,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10052,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10052,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10052,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10052,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10052,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10052,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10052,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10052,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10052,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10052,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10052,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10052,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10052,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10052,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10052,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10052,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10052,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10052,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10052,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10053] = {
		{
			group_id = 10053,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10053,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10053,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10053,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10053,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10053,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10053,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10053,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10053,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10053,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10053,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10053,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10053,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10053,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10053,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10053,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10053,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10053,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10053,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10053,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10053,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10053,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10053,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10053,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10053,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10053,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10053,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10053,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10053,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10053,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10053,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10053,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10053,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10053,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10053,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10053,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10053,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10053,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10053,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10053,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10053,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10053,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10053,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10053,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10053,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10053,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10053,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10053,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10053,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10053,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10053,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10053,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10053,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10053,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10053,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10053,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10053,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10053,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10053,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10053,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10053,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10053,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10053,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10053,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10053,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10053,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10053,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10053,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10053,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10053,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10053,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10053,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10053,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10053,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10053,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10053,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10053,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10053,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10053,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10053,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10053,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10053,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10053,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10053,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10053,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10053,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10053,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10053,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10054] = {
		{
			group_id = 10054,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10054,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10054,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10054,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10054,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10054,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10054,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10054,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10054,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10054,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10054,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10054,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10054,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10054,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10054,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10054,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10054,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10054,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10054,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10054,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10054,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10054,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10054,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10054,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10054,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10054,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10054,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10054,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10054,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10054,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10054,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10054,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10054,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10054,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10054,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10054,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10054,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10054,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10054,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10054,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10054,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10054,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10054,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10054,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10054,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10054,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10054,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10054,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10054,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10054,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10054,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10054,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10054,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10054,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10054,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10054,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10054,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10054,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10054,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10054,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10054,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10054,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10054,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10054,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10054,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10054,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10054,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10054,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10054,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10054,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10054,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10054,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10054,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10054,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10054,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10054,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10054,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10054,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10054,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10054,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10054,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10054,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10054,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10054,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10054,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10054,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10054,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10054,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10055] = {
		{
			group_id = 10055,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10055,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10055,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10055,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10055,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10055,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10055,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10055,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10055,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10055,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10055,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10055,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10055,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10055,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10055,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10055,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10055,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10055,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10055,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10055,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10055,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10055,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10055,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10055,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10055,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10055,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10055,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10055,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10055,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10055,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10055,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10055,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10055,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10055,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10055,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10055,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10055,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10055,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10055,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10055,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10055,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10055,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10055,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10055,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10055,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10055,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10055,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10055,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10055,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10055,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10055,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10055,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10055,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10055,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10055,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10055,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10055,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10055,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10055,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10055,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10055,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10055,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10055,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10055,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10055,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10055,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10055,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10055,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10055,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10055,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10055,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10055,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10055,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10055,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10055,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10055,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10055,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10055,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10055,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10055,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10055,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10055,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10055,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10055,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10055,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10055,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10055,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10055,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10056] = {
		{
			group_id = 10056,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10056,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10056,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10056,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10056,
			name = "神装碎片",
			probability = "10",
			id = 28,
			num = 100
		},
		{
			group_id = 10056,
			name = "皮肤碎片",
			probability = "10",
			id = 29,
			num = 100
		},
		{
			group_id = 10056,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10056,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10056,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10056,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10056,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10056,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10056,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10056,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10056,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10056,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10056,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10056,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10056,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10056,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10056,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10056,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10056,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10056,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10056,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10056,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10056,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10056,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10056,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10056,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[28] = {
			group_id = 10056,
			name = "神装碎片",
			probability = "0.62",
			id = 28,
			num = 50
		},
		[29] = {
			group_id = 10056,
			name = "皮肤碎片",
			probability = "0.62",
			id = 29,
			num = 50
		},
		[32] = {
			group_id = 10056,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10056,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10056,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10056,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10056,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10056,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10056,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10056,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10056,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10056,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10056,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10056,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10056,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10056,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10056,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10056,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10056,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10056,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10056,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10056,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10056,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10056,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10056,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10056,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10056,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10056,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10056,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10056,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10056,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10056,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10056,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10056,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10056,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10056,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10056,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10056,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10056,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10056,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10056,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10056,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10056,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10056,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10056,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10056,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10056,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10056,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10056,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10056,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10056,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10056,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10056,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10056,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10056,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10056,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10056,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10056,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10057] = {
		{
			group_id = 10057,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10057,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10057,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10057,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10057,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10057,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10057,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10057,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10057,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10057,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10057,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10057,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10057,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10057,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10057,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10057,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10057,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10057,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10057,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10057,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10057,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10057,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10057,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10057,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10057,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10057,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10057,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10057,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10057,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10057,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10057,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10057,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10057,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10057,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10057,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10057,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10057,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10057,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10057,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10057,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10057,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10057,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10057,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10057,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10057,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10057,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10057,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10057,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10057,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10057,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10057,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10057,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10057,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10057,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10057,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10057,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10057,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10057,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10057,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10057,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10057,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10057,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10057,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10057,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10057,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10057,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10057,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10057,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10057,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10057,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10057,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10057,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10057,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10057,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10057,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10057,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10057,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10057,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10057,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10057,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10057,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10057,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10057,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10057,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10057,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10057,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10057,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10057,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10058] = {
		{
			group_id = 10058,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10058,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10058,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10058,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10058,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10058,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10058,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10058,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10058,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10058,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10058,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10058,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10058,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10058,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10058,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10058,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10058,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10058,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10058,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10058,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10058,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10058,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10058,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10058,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10058,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10058,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10058,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10058,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10058,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10058,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10058,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10058,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10058,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10058,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10058,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10058,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10058,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10058,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10058,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10058,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10058,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10058,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10058,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10058,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10058,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10058,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10058,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10058,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10058,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10058,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10058,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10058,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10058,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10058,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10058,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10058,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10058,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10058,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10058,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10058,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10058,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10058,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10058,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10058,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10058,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10058,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10058,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10058,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10058,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10058,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10058,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10058,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10058,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10058,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10058,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10058,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10058,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10058,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10058,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10058,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10058,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10058,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10058,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10058,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10058,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10058,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10058,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10058,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10059] = {
		{
			group_id = 10059,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10059,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10059,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10059,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10059,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10059,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10059,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10059,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10059,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10059,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10059,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10059,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10059,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10059,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10059,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10059,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10059,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10059,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10059,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10059,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10059,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10059,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10059,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10059,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10059,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10059,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10059,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10059,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10059,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10059,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10059,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10059,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10059,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10059,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10059,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10059,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10059,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10059,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10059,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10059,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10059,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10059,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10059,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10059,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10059,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10059,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10059,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10059,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10059,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10059,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10059,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10059,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10059,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10059,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10059,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10059,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10059,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10059,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10059,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10059,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10059,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10059,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10059,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10059,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10059,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10059,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10059,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10059,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10059,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10059,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10059,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10059,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10059,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10059,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10059,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10059,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10059,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10059,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10059,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10059,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10059,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10059,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10059,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10059,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10059,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10059,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10059,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10059,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10060] = {
		{
			group_id = 10060,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10060,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10060,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10060,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10060,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10060,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10060,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10060,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10060,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10060,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10060,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10060,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10060,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10060,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10060,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10060,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10060,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10060,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10060,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10060,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10060,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10060,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10060,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10060,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10060,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10060,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10060,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10060,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10060,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10060,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10060,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10060,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10060,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10060,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10060,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10060,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10060,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10060,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10060,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10060,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10060,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10060,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10060,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10060,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10060,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10060,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10060,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10060,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10060,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10060,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10060,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10060,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10060,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10060,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10060,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10060,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10060,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10060,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10060,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10060,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10060,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10060,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10060,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10060,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10060,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10060,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10060,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10060,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10060,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10060,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10060,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10060,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10060,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10060,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10060,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10060,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10060,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10060,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10060,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10060,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10060,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10060,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10060,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10060,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10060,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10060,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10060,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10060,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10061] = {
		{
			group_id = 10061,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10061,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10061,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10061,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10061,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10061,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10061,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10061,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10061,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10061,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10061,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10061,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10061,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10061,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10061,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10061,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10061,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10061,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10061,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10061,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10061,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10061,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10061,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10061,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10061,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10061,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10061,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10061,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10061,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10061,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10061,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10061,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10061,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10061,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10061,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10061,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10061,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10061,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10061,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10061,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10061,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10061,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10061,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10061,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10061,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10061,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10061,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10061,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10061,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10061,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10061,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10061,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10061,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10061,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10061,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10061,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10061,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10061,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10061,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10061,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10061,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10061,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10061,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10061,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10061,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10061,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10061,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10061,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10061,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10061,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10061,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10061,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10061,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10061,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10061,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10061,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10061,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10061,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10061,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10061,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10061,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10061,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10061,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10061,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10061,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10061,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10061,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10061,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10062] = {
		{
			group_id = 10062,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10062,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10062,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10062,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10062,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10062,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10062,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10062,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10062,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10062,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10062,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10062,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10062,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10062,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10062,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10062,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10062,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10062,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10062,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10062,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10062,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10062,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10062,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10062,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10062,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10062,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10062,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10062,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10062,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10062,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10062,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10062,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10062,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10062,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10062,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10062,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10062,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10062,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10062,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10062,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10062,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10062,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10062,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10062,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10062,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10062,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10062,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10062,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10062,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10062,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10062,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10062,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10062,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10062,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10062,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10062,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10062,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10062,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10062,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10062,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10062,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10062,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10062,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10062,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10062,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10062,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10062,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10062,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10062,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10062,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10062,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10062,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10062,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10062,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10062,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10062,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10062,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10062,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10062,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10062,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10062,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10062,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10062,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10062,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10062,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10062,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10062,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10062,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10063] = {
		{
			group_id = 10063,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10063,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10063,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10063,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10063,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10063,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10063,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10063,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10063,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10063,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10063,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10063,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10063,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10063,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10063,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10063,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10063,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10063,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10063,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10063,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10063,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10063,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10063,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10063,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10063,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10063,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10063,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10063,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10063,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10063,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10063,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10063,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10063,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10063,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10063,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10063,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10063,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10063,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10063,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10063,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10063,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10063,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10063,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10063,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10063,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10063,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10063,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10063,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10063,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10063,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10063,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10063,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10063,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10063,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10063,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10063,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10063,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10063,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10063,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10063,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10063,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10063,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10063,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10063,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10063,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10063,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10063,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10063,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10063,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10063,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10063,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10063,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10063,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10063,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10063,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10063,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10063,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10063,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10063,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10063,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10063,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10063,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10063,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10063,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10063,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10063,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10063,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10063,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10064] = {
		{
			group_id = 10064,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10064,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10064,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10064,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10064,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10064,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10064,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10064,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10064,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10064,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10064,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10064,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10064,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10064,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10064,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10064,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10064,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10064,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10064,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10064,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10064,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10064,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10064,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10064,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10064,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10064,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10064,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10064,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10064,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10064,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10064,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10064,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10064,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10064,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10064,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10064,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10064,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10064,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10064,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10064,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10064,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10064,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10064,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10064,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10064,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10064,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10064,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10064,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10064,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10064,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10064,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10064,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10064,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10064,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10064,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10064,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10064,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10064,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10064,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10064,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10064,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10064,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10064,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10064,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10064,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10064,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10064,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10064,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10064,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10064,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10064,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10064,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10064,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10064,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10064,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10064,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10064,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10064,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10064,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10064,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10064,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10064,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10064,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10064,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10064,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10064,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10064,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10064,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10065] = {
		{
			group_id = 10065,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10065,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10065,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10065,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10065,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10065,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10065,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10065,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10065,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10065,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10065,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10065,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10065,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10065,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10065,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10065,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10065,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10065,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10065,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10065,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10065,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10065,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10065,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10065,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10065,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10065,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10065,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10065,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10065,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10065,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10065,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10065,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10065,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10065,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10065,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10065,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10065,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10065,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10065,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10065,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10065,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10065,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10065,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10065,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10065,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10065,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10065,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10065,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10065,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10065,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10065,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10065,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10065,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10065,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10065,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10065,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10065,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10065,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10065,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10065,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10065,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10065,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10065,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10065,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10065,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10065,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10065,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10065,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10065,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10065,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10065,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10065,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10065,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10065,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10065,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10065,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10065,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10065,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10065,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10065,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10065,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10065,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10065,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10065,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10065,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10065,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10065,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10065,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10066] = {
		{
			group_id = 10066,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10066,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10066,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10066,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10066,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10066,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10066,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10066,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10066,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10066,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10066,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10066,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10066,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10066,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10066,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10066,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10066,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10066,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10066,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10066,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10066,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10066,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10066,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10066,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10066,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10066,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10066,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10066,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10066,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10066,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10066,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10066,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10066,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10066,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10066,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10066,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10066,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10066,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10066,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10066,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10066,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10066,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10066,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10066,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10066,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10066,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10066,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10066,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10066,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10066,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10066,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10066,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10066,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10066,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10066,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10066,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10066,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10066,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10066,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10066,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10066,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10066,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10066,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10066,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10066,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10066,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10066,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10066,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10066,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10066,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10066,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10066,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10066,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10066,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10066,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10066,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10066,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10066,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10066,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10066,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10066,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10066,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10066,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10066,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10066,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10066,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10066,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10066,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10067] = {
		{
			group_id = 10067,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10067,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10067,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10067,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10067,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10067,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10067,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10067,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10067,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10067,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10067,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10067,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10067,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10067,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10067,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10067,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10067,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10067,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10067,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10067,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10067,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10067,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10067,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10067,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10067,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10067,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10067,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10067,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10067,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10067,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10067,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10067,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10067,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10067,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10067,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10067,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10067,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10067,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10067,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10067,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10067,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10067,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10067,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10067,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10067,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10067,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10067,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10067,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10067,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10067,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10067,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10067,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10067,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10067,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10067,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10067,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10067,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10067,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10067,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10067,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10067,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10067,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10067,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10067,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10067,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10067,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10067,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10067,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10067,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10067,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10067,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10067,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10067,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10067,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10067,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10067,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10067,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10067,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10067,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10067,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10067,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10067,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10067,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10067,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10067,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10067,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10067,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10067,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10068] = {
		{
			group_id = 10068,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10068,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10068,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10068,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10068,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10068,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10068,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10068,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10068,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10068,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10068,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10068,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10068,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10068,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10068,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10068,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10068,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10068,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10068,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10068,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10068,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10068,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10068,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10068,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10068,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10068,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10068,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10068,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10068,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10068,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10068,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10068,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10068,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10068,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10068,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10068,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10068,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10068,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10068,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10068,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10068,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10068,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10068,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10068,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10068,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10068,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10068,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10068,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10068,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10068,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10068,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10068,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10068,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10068,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10068,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10068,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10068,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10068,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10068,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10068,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10068,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10068,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10068,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10068,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10068,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10068,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10068,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10068,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10068,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10068,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10068,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10068,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10068,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10068,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10068,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10068,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10068,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10068,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10068,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10068,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10068,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10068,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10068,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10068,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10068,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10068,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10068,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10068,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10069] = {
		{
			group_id = 10069,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10069,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10069,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10069,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10069,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10069,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10069,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10069,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10069,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10069,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10069,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10069,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10069,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10069,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10069,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10069,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10069,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10069,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10069,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10069,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10069,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10069,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10069,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10069,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10069,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10069,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10069,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10069,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10069,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10069,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10069,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10069,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10069,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10069,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10069,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10069,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10069,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10069,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10069,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10069,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10069,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10069,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10069,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10069,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10069,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10069,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10069,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10069,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10069,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10069,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10069,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10069,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10069,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10069,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10069,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10069,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10069,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10069,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10069,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10069,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10069,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10069,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10069,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10069,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10069,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10069,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10069,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10069,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10069,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10069,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10069,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10069,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10069,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10069,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10069,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10069,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10069,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10069,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10069,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10069,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10069,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10069,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10069,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10069,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10069,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10069,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10069,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10069,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10070] = {
		{
			group_id = 10070,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10070,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10070,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10070,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10070,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10070,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10070,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10070,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10070,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10070,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10070,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10070,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10070,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10070,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10070,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10070,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10070,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10070,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10070,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10070,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10070,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10070,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10070,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10070,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10070,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10070,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10070,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10070,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10070,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10070,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10070,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10070,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10070,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10070,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10070,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10070,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10070,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10070,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10070,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10070,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10070,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10070,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10070,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10070,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10070,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10070,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10070,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10070,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10070,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10070,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10070,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10070,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10070,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10070,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10070,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10070,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10070,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10070,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10070,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10070,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10070,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10070,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10070,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10070,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10070,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10070,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10070,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10070,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10070,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10070,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10070,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10070,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10070,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10070,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10070,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10070,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10070,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10070,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10070,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10070,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10070,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10070,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10070,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10070,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10070,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10070,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10070,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10070,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10071] = {
		{
			group_id = 10071,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10071,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10071,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10071,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10071,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10071,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10071,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10071,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10071,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10071,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10071,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10071,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10071,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10071,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10071,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10071,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10071,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10071,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10071,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10071,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10071,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10071,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10071,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10071,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10071,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10071,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10071,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10071,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10071,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10071,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10071,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10071,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10071,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10071,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10071,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10071,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10071,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10071,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10071,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10071,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10071,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10071,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10071,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10071,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10071,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10071,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10071,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10071,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10071,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10071,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10071,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10071,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10071,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10071,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10071,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10071,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10071,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10071,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10071,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10071,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10071,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10071,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10071,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10071,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10071,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10071,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10071,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10071,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10071,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10071,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10071,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10071,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10071,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10071,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10071,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10071,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10071,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10071,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10071,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10071,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10071,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10071,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10071,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10071,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10071,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10071,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10071,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10071,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10072] = {
		{
			group_id = 10072,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10072,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10072,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10072,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10072,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10072,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10072,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10072,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10072,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10072,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10072,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10072,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10072,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10072,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10072,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10072,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10072,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10072,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10072,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10072,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10072,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10072,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10072,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10072,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10072,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10072,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10072,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10072,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10072,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10072,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10072,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10072,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10072,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10072,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10072,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10072,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10072,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10072,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10072,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10072,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10072,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10072,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10072,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10072,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10072,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10072,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10072,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10072,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10072,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10072,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10072,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10072,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10072,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10072,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10072,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10072,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10072,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10072,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10072,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10072,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10072,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10072,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10072,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10072,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10072,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10072,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10072,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10072,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10072,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10072,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10072,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10072,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10072,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10072,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10072,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10072,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10072,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10072,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10072,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10072,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10072,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10072,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10072,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10072,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10072,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10072,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10072,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10072,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10073] = {
		{
			group_id = 10073,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10073,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10073,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10073,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10073,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10073,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10073,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10073,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10073,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10073,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10073,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10073,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10073,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10073,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10073,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10073,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10073,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10073,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10073,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10073,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10073,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10073,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10073,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10073,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10073,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10073,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10073,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10073,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10073,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10073,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10073,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10073,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10073,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10073,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10073,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10073,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10073,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10073,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10073,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10073,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10073,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10073,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10073,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10073,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10073,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10073,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10073,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10073,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10073,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10073,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10073,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10073,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10073,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10073,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10073,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10073,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10073,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10073,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10073,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10073,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10073,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10073,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10073,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10073,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10073,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10073,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10073,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10073,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10073,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10073,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10073,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10073,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10073,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10073,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10073,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10073,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10073,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10073,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10073,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10073,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10073,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10073,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10073,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10073,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10073,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10073,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10073,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10073,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10074] = {
		{
			group_id = 10074,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10074,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10074,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10074,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10074,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10074,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10074,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10074,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10074,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10074,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10074,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10074,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10074,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10074,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10074,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10074,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10074,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10074,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10074,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10074,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10074,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10074,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10074,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10074,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10074,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10074,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10074,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10074,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10074,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10074,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10074,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10074,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10074,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10074,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10074,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10074,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10074,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10074,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10074,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10074,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10074,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10074,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10074,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10074,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10074,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10074,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10074,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10074,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10074,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10074,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10074,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10074,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10074,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10074,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10074,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10074,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10074,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10074,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10074,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10074,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10074,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10074,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10074,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10074,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10074,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10074,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10074,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10074,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10074,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10074,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10074,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10074,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10074,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10074,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10074,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10074,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10074,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10074,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10074,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10074,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10074,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10074,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10074,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10074,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10074,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10074,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10074,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10074,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10075] = {
		{
			group_id = 10075,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10075,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10075,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10075,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10075,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10075,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10075,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10075,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10075,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10075,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10075,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10075,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10075,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10075,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10075,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10075,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10075,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10075,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10075,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10075,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10075,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10075,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10075,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10075,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10075,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10075,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10075,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10075,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10075,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10075,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10075,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10075,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10075,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10075,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10075,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10075,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10075,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10075,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10075,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10075,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10075,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10075,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10075,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10075,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10075,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10075,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10075,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10075,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10075,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10075,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10075,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10075,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10075,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10075,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10075,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10075,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10075,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10075,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10075,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10075,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10075,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10075,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10075,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10075,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10075,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10075,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10075,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10075,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10075,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10075,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10075,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10075,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10075,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10075,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10075,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10075,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10075,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10075,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10075,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10075,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10075,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10075,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10075,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10075,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10075,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10075,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10075,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10075,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10076] = {
		{
			group_id = 10076,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10076,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10076,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10076,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10076,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10076,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10076,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10076,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10076,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10076,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10076,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10076,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10076,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10076,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10076,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10076,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10076,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10076,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10076,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10076,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10076,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10076,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10076,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10076,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10076,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10076,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10076,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10076,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10076,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10076,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10076,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10076,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10076,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10076,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10076,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10076,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10076,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10076,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10076,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10076,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10076,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10076,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10076,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10076,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10076,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10076,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10076,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10076,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10076,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10076,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10076,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10076,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10076,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10076,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10076,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10076,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10076,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10076,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10076,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10076,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10076,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10076,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10076,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10076,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10076,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10076,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10076,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10076,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10076,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10076,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10076,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10076,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10076,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10076,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10076,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10076,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10076,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10076,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10076,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10076,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10076,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10076,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10076,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10076,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10076,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10076,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10076,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10076,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10077] = {
		{
			group_id = 10077,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10077,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10077,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10077,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10077,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10077,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10077,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10077,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10077,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10077,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10077,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10077,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10077,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10077,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10077,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10077,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10077,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10077,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10077,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10077,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10077,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10077,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10077,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10077,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10077,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10077,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10077,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10077,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10077,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10077,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10077,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10077,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10077,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10077,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10077,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10077,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10077,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10077,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10077,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10077,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10077,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10077,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10077,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10077,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10077,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10077,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10077,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10077,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10077,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10077,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10077,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10077,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10077,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10077,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10077,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10077,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10077,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10077,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10077,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10077,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10077,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10077,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10077,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10077,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10077,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10077,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10077,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10077,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10077,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10077,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10077,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10077,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10077,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10077,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10077,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10077,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10077,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10077,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10077,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10077,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10077,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10077,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10077,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10077,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10077,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10077,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10077,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10077,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10078] = {
		{
			group_id = 10078,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10078,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10078,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10078,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10078,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10078,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10078,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10078,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10078,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10078,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10078,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10078,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10078,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10078,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10078,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10078,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10078,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10078,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10078,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10078,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10078,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10078,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10078,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10078,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10078,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10078,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10078,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10078,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10078,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10078,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10078,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10078,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10078,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10078,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10078,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10078,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10078,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10078,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10078,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10078,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10078,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10078,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10078,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10078,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10078,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10078,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10078,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10078,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10078,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10078,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10078,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10078,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10078,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10078,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10078,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10078,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10078,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10078,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10078,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10078,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10078,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10078,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10078,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10078,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10078,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10078,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10078,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10078,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10078,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10078,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10078,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10078,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10078,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10078,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10078,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10078,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10078,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10078,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10078,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10078,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10078,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10078,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10078,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10078,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10078,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10078,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10078,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10078,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	},
	[10079] = {
		{
			group_id = 10079,
			name = "贝里",
			probability = "0.67",
			id = 1,
			num = 100000
		},
		{
			group_id = 10079,
			name = "公会贡献",
			probability = "10",
			id = 10,
			num = 10000
		},
		{
			group_id = 10079,
			name = "英雄经验",
			probability = "10",
			id = 22,
			num = 1000000
		},
		{
			group_id = 10079,
			name = "强者声望",
			probability = "10",
			id = 24,
			num = 1000
		},
		{
			group_id = 10079,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		{
			group_id = 10079,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10079,
			name = "圣露",
			probability = "10",
			id = 10041,
			num = 20
		},
		{
			group_id = 10079,
			name = "神技石头",
			probability = "10",
			id = 32,
			num = 10000
		},
		{
			group_id = 10079,
			name = "突破卡",
			probability = "10",
			id = 10001,
			num = 100000
		},
		{
			group_id = 10079,
			name = "英魂之心",
			probability = "10",
			id = 10005,
			num = 100
		},
		{
			group_id = 10079,
			name = "霸气秘典",
			probability = "10",
			id = 10006,
			num = 100
		},
		{
			group_id = 10079,
			name = "空岛原石",
			probability = "10",
			id = 10030,
			num = 1000
		},
		{
			group_id = 10079,
			name = "训练果实",
			probability = "10",
			id = 10040,
			num = 1000
		},
		{
			group_id = 10079,
			name = "能力觉醒纹石",
			probability = "10",
			id = 10090,
			num = 50
		},
		{
			group_id = 10079,
			name = "影影魔夜",
			probability = "10",
			id = 10095,
			num = 1000
		},
		{
			group_id = 10079,
			name = "高级召唤卷",
			probability = "10",
			id = 10403,
			num = 100
		},
		{
			group_id = 10079,
			name = "限定召唤卷",
			probability = "10",
			id = 10407,
			num = 100
		},
		{
			group_id = 10079,
			name = "精英召唤卷",
			probability = "10",
			id = 10408,
			num = 100
		},
		{
			group_id = 10079,
			name = "幽灵幸运石",
			probability = "10",
			id = 10415,
			num = 50
		},
		{
			group_id = 10079,
			name = "超级战技",
			probability = "10",
			id = 10454,
			num = 10
		},
		{
			group_id = 10079,
			name = "传说战技",
			probability = "10",
			id = 10455,
			num = 10
		},
		{
			group_id = 10079,
			name = "恶魔战技",
			probability = "10",
			id = 10456,
			num = 5
		},
		{
			group_id = 10079,
			name = "觉醒战技",
			probability = "10",
			id = 10457,
			num = 2
		},
		{
			group_id = 10079,
			name = "觉醒石",
			probability = "10",
			id = 10460,
			num = 50
		},
		{
			group_id = 10079,
			name = "好运宝珠",
			probability = "10",
			id = 10470,
			num = 100
		},
		{
			group_id = 10079,
			name = "史诗灵碑",
			probability = "10",
			id = 10602,
			num = 100
		},
		{
			group_id = 10079,
			name = "传奇灵碑",
			probability = "10",
			id = 10603,
			num = 30
		},
		{
			group_id = 10079,
			name = "6星金装自选礼包",
			probability = "1",
			id = 88828,
			num = 1
		},
		[10] = {
			group_id = 10079,
			name = "公会贡献",
			probability = "0.67",
			id = 10,
			num = 1000
		},
		[22] = {
			group_id = 10079,
			name = "英雄经验",
			probability = "0.67",
			id = 22,
			num = 100000
		},
		[24] = {
			group_id = 10079,
			name = "强者声望",
			probability = "0.67",
			id = 24,
			num = 100
		},
		[10041] = {
			group_id = 10079,
			name = "圣露",
			probability = "0.62",
			id = 10041,
			num = 20
		},
		[32] = {
			group_id = 10079,
			name = "神技石头",
			probability = "0.62",
			id = 32,
			num = 5000
		},
		[10001] = {
			group_id = 10079,
			name = "突破卡",
			probability = "0.62",
			id = 10001,
			num = 50000
		},
		[10005] = {
			group_id = 10079,
			name = "英魂之心",
			probability = "0.62",
			id = 10005,
			num = 20
		},
		[10006] = {
			group_id = 10079,
			name = "霸气秘典",
			probability = "0.62",
			id = 10006,
			num = 20
		},
		[10030] = {
			group_id = 10079,
			name = "空岛原石",
			probability = "0.62",
			id = 10030,
			num = 200
		},
		[10040] = {
			group_id = 10079,
			name = "训练果实",
			probability = "0.62",
			id = 10040,
			num = 200
		},
		[10090] = {
			group_id = 10079,
			name = "能力觉醒纹石",
			probability = "4.8",
			id = 10090,
			num = 5
		},
		[10095] = {
			group_id = 10079,
			name = "影影魔夜",
			probability = "4.7",
			id = 10095,
			num = 20
		},
		[10403] = {
			group_id = 10079,
			name = "高级召唤卷",
			probability = "4.7",
			id = 10403,
			num = 10
		},
		[10407] = {
			group_id = 10079,
			name = "限定召唤卷",
			probability = "4.7",
			id = 10407,
			num = 10
		},
		[10408] = {
			group_id = 10079,
			name = "精英召唤卷",
			probability = "4.7",
			id = 10408,
			num = 10
		},
		[10415] = {
			group_id = 10079,
			name = "幽灵幸运石",
			probability = "4.7",
			id = 10415,
			num = 5
		},
		[10454] = {
			group_id = 10079,
			name = "超级战技",
			probability = "4.7",
			id = 10454,
			num = 5
		},
		[10455] = {
			group_id = 10079,
			name = "传说战技",
			probability = "4.7",
			id = 10455,
			num = 2
		},
		[10456] = {
			group_id = 10079,
			name = "恶魔战技",
			probability = "4.7",
			id = 10456,
			num = 1
		},
		[10457] = {
			group_id = 10079,
			name = "觉醒战技",
			probability = "4.7",
			id = 10457,
			num = 1
		},
		[10460] = {
			group_id = 10079,
			name = "觉醒石",
			probability = "4.7",
			id = 10460,
			num = 10
		},
		[10470] = {
			group_id = 10079,
			name = "好运宝珠",
			probability = "4.7",
			id = 10470,
			num = 10
		},
		[10602] = {
			group_id = 10079,
			name = "史诗灵碑",
			probability = "4.7",
			id = 10602,
			num = 5
		},
		[10603] = {
			group_id = 10079,
			name = "传奇灵碑",
			probability = "4.7",
			id = 10603,
			num = 5
		},
		[10490] = {
			group_id = 10079,
			name = "高级好运宝珠",
			probability = "10",
			id = 10490,
			num = 10
		},
		[14001] = {
			group_id = 10079,
			name = "强者招募令",
			probability = "10",
			id = 14001,
			num = 100
		},
		[16201] = {
			group_id = 10079,
			name = "随机觉醒符石",
			probability = "10",
			id = 16201,
			num = 100
		},
		[16202] = {
			group_id = 10079,
			name = "自选觉醒符石礼包",
			probability = "10",
			id = 16202,
			num = 100
		},
		[17006] = {
			group_id = 10079,
			name = "传奇意志",
			probability = "10",
			id = 17006,
			num = 1000
		},
		[17011] = {
			group_id = 10079,
			name = "信念之灵",
			probability = "10",
			id = 17011,
			num = 1000
		},
		[39095] = {
			group_id = 10079,
			name = "红色5星装备自选箱",
			probability = "3",
			id = 39095,
			num = 50
		},
		[39096] = {
			group_id = 10079,
			name = "红色4星装备自选箱",
			probability = "12",
			id = 39096,
			num = 50
		},
		[39097] = {
			group_id = 10079,
			name = "红色3星装备自选箱",
			probability = "16",
			id = 39097,
			num = 50
		},
		[39098] = {
			group_id = 10079,
			name = "红色2星装备自选箱",
			probability = "0.5",
			id = 39098,
			num = 50
		},
		[39099] = {
			group_id = 10079,
			name = "红色1星装备自选箱",
			probability = "16",
			id = 39099,
			num = 50
		},
		[39159] = {
			group_id = 10079,
			name = "极品5星神装自选箱",
			probability = "0.5",
			id = 39159,
			num = 10
		},
		[90500] = {
			group_id = 10079,
			name = "5星英魂",
			probability = "0.5",
			id = 90500,
			num = 50
		},
		[90601] = {
			group_id = 10079,
			name = "6星海贼新星英魂",
			probability = "0.5",
			id = 90601,
			num = 50
		},
		[90602] = {
			group_id = 10079,
			name = "6星草帽联盟英魂",
			probability = "29",
			id = 90602,
			num = 50
		},
		[90603] = {
			group_id = 10079,
			name = "6星强者英魂",
			probability = "16",
			id = 90603,
			num = 50
		},
		[90604] = {
			group_id = 10079,
			name = "6星海军英魂",
			probability = "12",
			id = 90604,
			num = 50
		},
		[90605] = {
			group_id = 10079,
			name = "6星五皇团英魂",
			probability = "30",
			id = 90605,
			num = 50
		},
		[90900] = {
			group_id = 10079,
			name = "9星英魂",
			probability = "12",
			id = 90900,
			num = 30
		},
		[91000] = {
			group_id = 10079,
			name = "10星英魂",
			probability = "0.4",
			id = 91000,
			num = 10
		},
		[38094] = {
			group_id = 10079,
			name = "6星红装自选礼",
			probability = "0.4",
			id = 38094,
			num = 10
		},
		[88823] = {
			group_id = 10079,
			name = "1星金装自选礼包",
			probability = "0.4",
			id = 88823,
			num = 5
		},
		[88824] = {
			group_id = 10079,
			name = "2星金装自选礼包",
			probability = "0.4",
			id = 88824,
			num = 5
		},
		[88825] = {
			group_id = 10079,
			name = "3星金装自选礼包",
			probability = "23",
			id = 88825,
			num = 5
		},
		[88826] = {
			group_id = 10079,
			name = "4星金装自选礼包",
			probability = "29",
			id = 88826,
			num = 5
		},
		[88827] = {
			group_id = 10079,
			name = "5星金装自选礼包",
			probability = "23",
			id = 88827,
			num = 5
		},
		[88828] = {
			group_id = 10079,
			name = "6星金装自选礼包",
			probability = "5",
			id = 88828,
			num = 2
		},
		[641231] = {
			group_id = 10079,
			name = "海贼精英自选卡",
			probability = "0.6",
			id = 641231,
			num = 10
		},
		[641232] = {
			group_id = 10079,
			name = "草帽团自选卡",
			probability = "17",
			id = 641232,
			num = 10
		},
		[641233] = {
			group_id = 10079,
			name = "强者自选卡",
			probability = "30",
			id = 641233,
			num = 10
		},
		[641234] = {
			group_id = 10079,
			name = "海军自选卡",
			probability = "0.5",
			id = 641234,
			num = 10
		},
		[641235] = {
			group_id = 10079,
			name = "五皇团自选卡",
			probability = "0.5",
			id = 641235,
			num = 10
		},
		[641236] = {
			group_id = 10079,
			name = "传奇自选卡",
			probability = "0.5",
			id = 641236,
			num = 5
		},
		[200001] = {
			group_id = 10079,
			name = "皮肤自选礼盒",
			probability = "0.5",
			id = 200001,
			num = 5
		},
		[39527] = {
			group_id = 10079,
			name = "极品9星神装自选礼包",
			probability = "0.67",
			id = 39527,
			num = 2
		},
		[888805] = {
			group_id = 10079,
			name = "英雄称号自选礼包",
			probability = "0.67",
			id = 888805,
			num = 2
		}
	}
}
