EliteSummonModel = EliteSummonModel or BaseClass()

function EliteSummonModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function EliteSummonModel.config(slot0)
	slot0.drop_data = {}

	for slot4 = 1, 2 do
		slot0.drop_data[slot4] = {}
	end
end

function EliteSummonModel.setGoodsItemPos(slot0, slot1)
	slot0.goods_item = {}
	slot0.get_button_status = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.goods_item[slot6.type] = slot6
		slot0.get_button_status[slot6.type] = slot6.flag
	end
end

function EliteSummonModel.getGoodsItemPos(slot0, slot1)
	if slot0.goods_item and slot0.goods_item[slot1] then
		return slot0.goods_item[slot1]
	end

	return nil
end

function EliteSummonModel.setPineBaseData(slot0, slot1)
	slot0.refresh_count = {
		slot1.ref_1,
		slot1.ref_2
	}
	slot0.presage_status = {
		slot1.status_1 or 0,
		slot1.status_2 or 0
	}
	slot0.buycount_data = {
		slot1.buy_1 or 0,
		slot1.buy_2 or 0
	}
end

function EliteSummonModel.getIsStatus(slot0, slot1)
	if slot0.presage_status and slot0.presage_status[slot1] then
		return slot0.presage_status[slot1]
	end

	return 0
end

function EliteSummonModel.updataPresageStatus(slot0, slot1)
	if slot0.presage_status[slot1.type] then
		slot0.presage_status[slot1.type] = 1
	end
end

function EliteSummonModel.getbuyCount(slot0, slot1)
	if slot0.buycount_data and slot0.buycount_data[slot1] then
		return slot0.buycount_data[slot1]
	end

	return 0
end

function EliteSummonModel.updataBuyData(slot0, slot1)
	if slot0.buycount_data[slot1.type1] then
		slot0.buycount_data[slot1.type1] = slot1.ref_count
	end
end

function EliteSummonModel.updataPromptGetBtnStatus(slot0, slot1)
	if slot0.get_button_status and slot0.get_button_status[slot1.type] then
		slot0.get_button_status[slot1.type] = slot1.flag
	end
end

function EliteSummonModel.getReFreshCount(slot0, slot1)
	if slot0.refresh_count and slot0.refresh_count[slot1] then
		return slot0.refresh_count[slot1]
	end

	return 0
end

function EliteSummonModel.updataOpenPeelPineData(slot0, slot1)
	slot0:updataPromptGetBtnStatus(slot1)

	if slot0.refresh_count and slot0.refresh_count[slot1.type1] then
		slot0.refresh_count[slot1.type1] = slot1.ref_count
	end

	if slot0.goods_item[slot1.type1] then
		slot0.goods_item[slot1.type1].rand_lists = slot1.rand_lists
		slot0.goods_item[slot1.type1].count = slot1.count
	end
end

function EliteSummonModel.getGetButtonStatus(slot0, slot1)
	if slot0.get_button_status and slot0.get_button_status[slot1] then
		return slot0.get_button_status[slot1]
	end

	return 0
end

function EliteSummonModel.setDropData(slot0, slot1)
	if Config.HolidayPredictData.data_magnificat_list and slot2[slot1] then
		slot3 = {}

		for slot7, slot8 in pairs(slot2[slot1]) do
			table.insert(slot0.drop_data[slot1], slot8)
		end
	end

	return {}
end

function EliteSummonModel.getDropData(slot0, slot1)
	if slot0.drop_data and slot0.drop_data[slot1] then
		return slot0.drop_data[slot1]
	end

	return {}
end

function EliteSummonModel.isHolidayHasID(slot0, slot1)
	slot2 = false

	if Config.RecruitHolidayEliteData.data_action then
		for slot7, slot8 in pairs(slot3) do
			if slot1 == slot8.camp_id then
				slot2 = true

				break
			end
		end
	end

	return slot2
end

function EliteSummonModel.setSelectSummonData(slot0, slot1)
	slot0.select_summon_data = slot1
end

function EliteSummonModel.getSelectSummonData(slot0)
	return slot0.select_summon_data
end

function EliteSummonModel.isHolidayLuckyHasID(slot0, slot1)
	slot2 = false

	if Config.RecruitHolidayLuckyData.data_action then
		for slot7, slot8 in pairs(slot3) do
			if slot1 == slot8.camp_id then
				slot2 = true

				break
			end
		end
	end

	return slot2
end

function EliteSummonModel.getSummonBg(slot0)
	slot1 = "timesummon_bg"

	if slot0.select_summon_data and Config.RecruitHolidayLuckyData.data_wish[slot0.select_summon_data.camp_id] then
		slot5 = slot0.select_summon_data.camp_id

		for slot5, slot6 in pairs(Config.RecruitHolidayLuckyData.data_wish[slot5]) do
			if slot5 == slot0.select_summon_data.lucky_bid then
				slot1 = slot6.bg

				break
			end
		end
	end

	return slot1
end

function EliteSummonModel.__delete(slot0)
end
