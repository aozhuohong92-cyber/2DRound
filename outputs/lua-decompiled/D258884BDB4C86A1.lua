GuildvoyageOrderVo = GuildvoyageOrderVo or BaseClass(EventDispatcher)

function GuildvoyageOrderVo.__init(slot0, slot1)
	slot0.order_id = 0
	slot0.order_bid = slot1 or 0
	slot0.type = 0
	slot0.status = 0
	slot0.loss_id = 0
	slot0.end_time = 0
	slot0.assign_ids = {}
	slot0.cond_ids = {}
	slot0.is_success = 0
	slot0.is_double = 0
	slot0.success_rate = 0
	slot0.line_id = 0
	slot0.refresh_count = 0
	slot0.is_gain = 0
	slot0.config = Config.GuildShippingData.data_order(slot0.order_bid)
	slot0.quality = slot0.config.quality or 0
end

function GuildvoyageOrderVo.updateData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if type(slot6) ~= "table" then
			slot0:setBaseData(slot5, slot6)
		elseif slot5 == "cond_ids" then
			for slot10, slot11 in ipairs(slot6) do
				slot0.cond_ids[slot11.cond_id] = true
			end
		else
			slot0[slot5] = slot6
		end
	end
end

function GuildvoyageOrderVo.setBaseData(slot0, slot1, slot2)
	if slot0[slot1] ~= slot2 then
		slot0[slot1] = slot2

		if slot1 == "order_bid" then
			slot0.config = Config.GuildShippingData.data_order(slot2)

			if slot0.config == nil then
				print("远航订单有误,id为 ", slot2)
			else
				slot0.quality = slot0.config.quality or 0
			end
		end
	end
end
