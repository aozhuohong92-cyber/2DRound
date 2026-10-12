VoyageOrderVo = VoyageOrderVo or BaseClass(EventDispatcher)

function VoyageOrderVo.__init(slot0)
	slot0.order_id = 0
	slot0.order_bid = 0
	slot0.status = VoyageConst.Order_Status.Finish
	slot0.end_time = 0
	slot0.assign_ids = {}
	slot0.config = {}
	slot0.old_status = 0
end

function VoyageOrderVo.updateData(slot0, slot1)
	slot0.old_status = slot0.status

	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6

		if slot5 == "order_bid" then
			slot0.config = Config.ShippingData.data_order[slot6] or {}
		end
	end

	slot0:dispatchUpdateAttrByKey()
end

function VoyageOrderVo.dispatchUpdateAttrByKey(slot0)
	slot0:Fire(VoyageEvent.UpdateOrderDataEvent)
end

function VoyageOrderVo.__delete(slot0)
end
