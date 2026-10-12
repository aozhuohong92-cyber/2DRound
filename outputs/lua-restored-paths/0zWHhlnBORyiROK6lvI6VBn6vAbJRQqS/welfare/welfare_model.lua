WelfareModel = WelfareModel or BaseClass()

function WelfareModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function WelfareModel.config(slot0)
	slot0.daily_award_status = 1
end

function WelfareModel.setYueka(slot0, slot1)
	slot0.yueka_data = slot1
end

function WelfareModel.getYueka(slot0)
	return slot0.yueka_data
end

function WelfareModel.setRechargeCount(slot0, slot1)
	slot0.recharge_num = slot1
end

function WelfareModel.checkWelfareSubIsOpen(slot0, slot1)
	if Config.HolidayClientData.data_info[slot1] then
		slot3 = RoleController:getInstance():getRoleVo()

		if (not MAKELIFEBETTER or MAKELIFEBETTER == true and slot2.is_verifyios == TRUE) and MainuiController:getInstance():checkIsOpenByActivate(slot2.open_lev) == true then
			return true
		end
	end

	return false
end

function WelfareModel.getYuekaStatus(slot0)
	slot1 = true

	if not slot0:checkWelfareSubIsOpen(WelfareIcon.yueka) then
		slot1 = false
	elseif slot0.yueka_data == nil then
		slot1 = true
	else
		slot2 = GameNet:getInstance():getTime()

		if slot0.yueka_data.card1_end_time and slot0.yueka_data.card2_end_time then
			slot1 = slot0.yueka_data.card1_end_time < slot2 or slot0.yueka_data.card2_end_time < slot2
		end
	end

	return slot1
end

function WelfareModel.getRechargeCount(slot0)
	return slot0.recharge_num or 0
end

function WelfareModel.setQuestOpenData(slot0, slot1)
	slot0.questOpenData = slot1
end

function WelfareModel.getQuestOpenData(slot0)
	return slot0.questOpenData or {}
end

function WelfareModel.setDailyAwardStatus(slot0, slot1)
	slot0.daily_award_status = slot1

	if slot1 == 0 then
		VipController:getInstance():setTipsGiftStatus(VIPREDPOINT.DAILY_AWARD, true)
	else
		VipController:getInstance():setTipsGiftStatus(VIPREDPOINT.DAILY_AWARD, false)
	end
end

function WelfareModel.getDailyAwardStatus(slot0)
	return slot0.daily_award_status
end

function WelfareModel.updateDailyGiftRedStatus(slot0, slot1)
	slot0.new_daily_award_red = slot1

	if slot1 == true or slot0.daily_award_status == 0 then
		VipController:getInstance():setTipsGiftStatus(VIPREDPOINT.DAILY_AWARD, true)
	else
		VipController:getInstance():setTipsGiftStatus(VIPREDPOINT.DAILY_AWARD, false)
	end

	GlobalEvent:getInstance():Fire(WelfareEvent.Update_Daily_Gift_Red_Data)
end

function WelfareModel.getDailyGiftRedStatus(slot0)
	if slot0.new_daily_award_red == true or slot0.daily_award_status == 0 then
		return true
	end

	return false
end

function WelfareModel.setWelfareShopData(slot0, slot1)
	if slot1 == 1 then
		slot0.shop_hero_data = slot0:getConfigData(Config.ExchangeData.data_shop_exchage_hero, slot1)
	elseif slot1 == 2 then
		slot0.shop_cloth_data = slot0:getConfigData(Config.ExchangeData.data_shop_exchage_cloth, slot1)
	end
end

function WelfareModel.getConfigData(slot0, slot1, slot2)
	if slot1 then
		slot3 = {}
		slot4 = HeavenController:getInstance():getModel()

		for slot8, slot9 in pairs(slot1) do
			if slot2 == 1 then
				table.insert(slot3, slot9)
			elseif slot2 == 2 and slot4:checkIsOpenByScore(slot9.buy_condit) == true then
				table.insert(slot3, slot9)
			end
		end

		table.sort(slot3, function (slot0, slot1)
			return slot0.order < slot1.order
		end)

		return slot3
	end

	return nil
end

function WelfareModel.getWelfareShopData(slot0, slot1)
	if slot1 == 1 then
		if slot0.shop_hero_data then
			return slot0.shop_hero_data
		end
	elseif slot1 == 2 and slot0.shop_cloth_data then
		return slot0.shop_cloth_data
	end

	return nil
end

function WelfareModel.setMonthWeekChargeID(slot0, slot1)
	slot0.charge_id = slot1
end

function WelfareModel.getMonthWeekChargeID(slot0)
	if slot0.charge_id then
		return slot0.charge_id
	end

	return nil
end

function WelfareModel.setIsOpenWeekGift(slot0, slot1)
	slot0.week_is_open = slot1
end

function WelfareModel.getIsOpenWeekGift(slot0)
	return true
end

function WelfareModel.__delete(slot0)
end
