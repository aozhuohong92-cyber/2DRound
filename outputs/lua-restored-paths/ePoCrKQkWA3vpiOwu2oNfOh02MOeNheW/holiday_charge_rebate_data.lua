Config = Config or {}
Config.HolidayChargeRebateData = Config.HolidayChargeRebateData or {}
Config.HolidayChargeRebateData.data_constant_length = 4
Config.HolidayChargeRebateData.data_constant = {
	rebate_gold_sum = {
		val = 100000,
		key = "rebate_gold_sum",
		desc = "返利钻石总数"
	},
	rebate_pro = {
		val = 400,
		key = "rebate_pro",
		desc = "返利比例（扩大1000倍）"
	},
	rebate_pro_res = {
		val = "txt_cn_welfare_10",
		key = "rebate_pro_res",
		desc = "面板百分比资源（百分之30：txt_cn_welfare_9；百分之40：txt_cn_welfare_10；百分之50：txt_cn_welfare_11）"
	},
	rebate_effect = {
		key = "rebate_effect",
		desc = "活动面板招财猫特效（参数1:对应EffectData表；参数2：招财猫坐标X；参数3:招财猫坐标Y）",
		val = {
			528,
			360,
			325
		}
	}
}

function Config.HolidayChargeRebateData.data_constant_fun(slot0)
	slot1 = Config.HolidayChargeRebateData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayChargeRebateData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
