VoyageModel = VoyageModel or BaseClass()
slot0 = table.insert

function VoyageModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function VoyageModel.config(slot0)
	slot0.order_list = {}
	slot0.free_times = 0
	slot0.coin_times = 0
end

function VoyageModel.setOrderList(slot0, slot1)
	slot0.order_list = {}

	for slot5, slot6 in pairs(slot1) do
		slot7 = VoyageOrderVo.New()

		slot7:updateData(slot6)
		uv0(slot0.order_list, slot7)
	end
end

function VoyageModel.getAllOrderList(slot0)
	return slot0.order_list
end

function VoyageModel.updateOneOrderData(slot0, slot1)
	for slot5, slot6 in pairs(slot0.order_list) do
		if slot6.order_id == slot1.order_id then
			slot6:updateData(slot1)

			break
		end
	end
end

function VoyageModel.deleteOneOrderData(slot0, slot1)
	for slot5, slot6 in pairs(slot0.order_list) do
		if slot6.order_id == slot1 then
			table.remove(slot0.order_list, slot5)

			break
		end
	end
end

function VoyageModel.deleteSomeOrderData(slot0, slot1)
	for slot5 = #slot0.order_list, 1, -1 do
		for slot10, slot11 in pairs(slot1) do
			if slot11.order_id == slot0.order_list[slot5].order_id then
				table.remove(slot0.order_list, slot5)

				break
			end
		end
	end
end

function VoyageModel.setFreeTimes(slot0, slot1)
	slot0.free_times = slot1
end

function VoyageModel.getFreeTimes(slot0)
	return slot0.free_times
end

function VoyageModel.setCoinTimes(slot0, slot1)
	slot0.coin_times = slot1
end

function VoyageModel.getCoinTimes(slot0)
	return slot0.coin_times
end

function VoyageModel.checkIsHaveHigherEpicOrder(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.order_list) do
		if slot6.status == VoyageConst.Order_Status.Unget and slot6.config and VoyageConst.Order_Rarity.Epic <= slot6.config.quality then
			slot1 = true

			break
		end
	end

	return slot1
end

function VoyageModel.checkHeroIsInTaskById(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.order_list) do
		if slot7.assign_ids then
			for slot11, slot12 in pairs(slot7.assign_ids) do
				if slot12.partner_id and slot12.partner_id == slot1 then
					slot2 = true

					break
				end
			end
		end

		if slot2 then
			break
		end
	end

	return slot2
end

function VoyageModel.getQuickFinishNeedGoldByTime(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in pairs(Config.ShippingData.data_quick_cost) do
		if slot7.min <= slot1 and slot1 <= slot7.max then
			slot2 = slot7.gold
		end
	end

	return slot2
end

function VoyageModel.checkIsHaveOrderData(slot0)
	return next(slot0.order_list) ~= nil
end

function VoyageModel.checkVoyageRedStatus(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.order_list) do
		if slot6.status == VoyageConst.Order_Status.Finish then
			slot1 = true

			break
		end
	end

	return slot1
end

function VoyageModel.setActivityStatus(slot0, slot1)
	slot0.activity_status = slot1
end

function VoyageModel.getActivityStatus(slot0)
	return slot0.activity_status or 0
end

function VoyageModel.__delete(slot0)
end
