GuildvoyageModel = GuildvoyageModel or BaseClass()
slot0 = table.insert
slot1 = table.sort

function GuildvoyageModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function GuildvoyageModel.config(slot0)
	slot0.order_list = {}
	slot0.guildvoyage_red_list = {}
	slot0.refresh_order_times = 0
	slot0.log_info = {}
	slot0.daily_times = 0
end

function GuildvoyageModel.clearGuildVoyageInfo(slot0)
	slot0.order_list = {}
	slot0.guildvoyage_red_list = {}
end

function GuildvoyageModel.setDailyTimes(slot0, slot1)
	slot0.daily_times = slot1 or 0

	GlobalEvent:getInstance():Fire(GuildvoyageEvent.UpdateDailyEscortTimes, slot0.daily_times)

	slot3 = false

	if Config.GuildShippingData.data_const.receive_limit then
		slot3 = slot1 < slot2.val
	end

	slot4 = slot0:acceptList()

	slot0:updateGuildRedStatus(GuildConst.red_index.voyage_order, slot3 and slot4 ~= nil and next(slot4) ~= nil)
end

function GuildvoyageModel.getDailyTimes(slot0)
	return slot0.daily_times or 0
end

function GuildvoyageModel.updateLogInfo(slot0, slot1)
	slot0.log_info = slot1

	GlobalEvent:getInstance():Fire(GuildvoyageEvent.UpdateNearLogInfoEvent)
end

function GuildvoyageModel.getNearLogInfo(slot0)
	return slot0.log_info
end

function GuildvoyageModel.updateGuildRedStatus(slot0, slot1, slot2)
	if slot0.guildvoyage_red_list[slot1] == slot2 then
		return
	end

	slot0.guildvoyage_red_list[slot1] = slot2
end

function GuildvoyageModel.checkGuildVoyageRedStatus(slot0)
	for slot4, slot5 in pairs(slot0.guildvoyage_red_list) do
		if slot5 == true then
			return true
		end
	end

	return false
end

function GuildvoyageModel.getRedStatusByType(slot0, slot1)
	return slot0.guildvoyage_red_list[slot1]
end

function GuildvoyageModel.getEscortStatus(slot0)
	if slot0:getRedStatusByType(GuildConst.red_index.voyage_escort) == true then
		return slot1
	end

	return slot0:getRedStatusByType(GuildConst.red_index.voyage_temp_escort)
end

function GuildvoyageModel.acceptList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.order_list) do
		if slot6.status == GuildvoyageConst.status.accept then
			uv0(slot1, slot6)
		end
	end

	if next(slot1) then
		uv1(slot1, function (slot0, slot1)
			return slot1.quality < slot0.quality
		end)
	end

	return slot1
end

function GuildvoyageModel.escortList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.order_list) do
		if slot6.status == GuildvoyageConst.status.doing or slot6.status == GuildvoyageConst.status.submit then
			uv0(slot1, slot6)
		end
	end

	return slot1
end

function GuildvoyageModel.getBaseInfo(slot0)
	return slot0.order_list
end

function GuildvoyageModel.getRefreshTimes(slot0)
	return slot0.refresh_order_times
end

function GuildvoyageModel.initGuildVoyageOrderList(slot0, slot1)
	if slot1 == nil or slot1.order_list == nil then
		return
	end

	slot0.refresh_order_times = slot1.buy_order_times
	slot2 = false
	slot3 = slot1.is_assist == TRUE

	for slot7, slot8 in pairs(slot0.order_list) do
		if slot8.status == GuildvoyageConst.status.accept then
			slot0.order_list[slot7] = nil
		end
	end

	for slot7, slot8 in ipairs(slot1.order_list) do
		if slot0.order_list[slot8.order_id] == nil then
			slot0.order_list[slot8.order_id] = GuildvoyageOrderVo.New(slot8.order_bid)
		end

		slot9:updateData(slot8)

		if slot8.status == GuildvoyageConst.status.submit and slot2 == false then
			slot2 = true
		end
	end

	GlobalEvent:getInstance():Fire(GuildvoyageEvent.UpdateGuildvoyageOrderListEvent)

	slot0.guildvoyage_red_list[GuildConst.red_index.voyage_escort] = slot2
	slot0.guildvoyage_red_list[GuildConst.red_index.voyage_interaction] = slot3

	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.guild, {
		{
			bid = GuildConst.red_index.voyage_interaction,
			status = slot3
		},
		{
			bid = GuildConst.red_index.voyage_escort,
			status = slot2
		}
	})
end

function GuildvoyageModel.updateGuildVoyageOrderList(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot3 = 0

	if slot0.order_list[slot1.order_id] == nil then
		slot0.order_list[slot1.order_id] = GuildvoyageOrderVo.New(slot1.order_bid)
		slot3 = 1
	elseif slot2.status ~= slot1.status then
		if slot1.status == GuildvoyageConst.status.doing then
			slot3 = 1
		elseif slot1.status == GuildvoyageConst.status.submit then
			slot3 = 2
		end
	end

	slot2:updateData(slot1)

	if slot3 == 1 then
		GlobalEvent:getInstance():Fire(GuildvoyageEvent.UpdateGuildvoyageOrderListEvent)

		if slot1.status == GuildvoyageConst.status.doing then
			slot0:updateGuildRedStatus(GuildConst.red_index.voyage_temp_escort, true)
		end
	else
		GlobalEvent:getInstance():Fire(GuildvoyageEvent.UpdateGuildvoyageOrderStatus, slot1.order_id, slot1.status)
	end

	slot0:checkEscortRedStatus(slot1.status)
end

function GuildvoyageModel.checkEscortRedStatus(slot0, slot1)
	if slot1 == GuildvoyageConst.status.over or slot1 == GuildvoyageConst.status.submit then
		slot2 = false

		for slot6, slot7 in pairs(slot0.order_list) do
			if slot7.status == GuildvoyageConst.status.submit then
				slot2 = true

				break
			end
		end

		slot0:updateGuildRedStatus(GuildConst.red_index.voyage_escort, slot2)
	end
end

function GuildvoyageModel.changeGuildVoyageStatus(slot0, slot1, slot2)
	if slot0.order_list[slot1] then
		slot3:setBaseData("status", slot2)
		GlobalEvent:getInstance():Fire(GuildvoyageEvent.UpdateGuildvoyageOrderStatus, slot1, slot2)
		slot0:checkEscortRedStatus(slot2)
	end
end

function GuildvoyageModel.updateVoyageInfo(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.order_list[slot1.order_id] == nil then
		return
	end

	slot2:setBaseData("status", slot1.status)
	slot2:setBaseData("end_time", slot1.end_time)
	GlobalEvent:getInstance():Fire(GuildvoyageEvent.UpdateGuildvoyageOrderStatus, slot1.order_id, slot1.status)
	slot0:checkEscortRedStatus(slot1.status)
end

function GuildvoyageModel.getEscortPartnerSum(slot0)
	slot1 = 0

	if slot0.order_list then
		for slot5, slot6 in pairs(slot0.order_list) do
			if slot6.assign_ids and (slot6.status == GuildvoyageConst.status.doing or slot6.status == GuildvoyageConst.status.submit) then
				slot1 = slot1 + #slot6.assign_ids
			end
		end
	end

	return slot1
end

function GuildvoyageModel.getBusyPartnerList(slot0)
	slot1 = {}

	if slot0.order_list then
		for slot5, slot6 in pairs(slot0.order_list) do
			if slot6.status == GuildvoyageConst.status.doing or slot6.status == GuildvoyageConst.status.submit then
				for slot10, slot11 in pairs(slot6.assign_ids) do
					slot1[slot11.partner_id] = true
				end
			end
		end
	end

	return slot1
end

function GuildvoyageModel.getOrderById(slot0, slot1)
	return slot0.order_list[slot1]
end

function GuildvoyageModel.updateGuildVoyageInteractionList(slot0, slot1)
	slot0.interaction_count = slot1.count
	slot0.can_interaction_total = #slot1.assist_list

	GlobalEvent:getInstance():Fire(GuildvoyageEvent.UpdateGuildVoyageInteractionEvent, slot0.interaction_count, slot1.assist_list)

	if Config.GuildShippingData.data_const.help_limit ~= nil then
		slot0:updateGuildRedStatus(GuildConst.red_index.voyage_interaction, slot0.interaction_count < slot2.val and slot0.can_interaction_total > 0)
	end
end

function GuildvoyageModel.removeGuildVoyageInteraction(slot0, slot1)
	if slot0.interaction_count == nil then
		slot0.interaction_count = 0
	end

	slot0.interaction_count = slot0.interaction_count + 1

	GlobalEvent:getInstance():Fire(GuildvoyageEvent.RemoveGuildVoyageInteractionEvent, slot1, slot0.interaction_count)

	slot0.can_interaction_total = slot0.can_interaction_total - 1

	if Config.GuildShippingData.data_const.help_limit ~= nil then
		slot0:updateGuildRedStatus(GuildConst.red_index.voyage_interaction, slot0.interaction_count < slot2.val and slot0.can_interaction_total > 0)
	end
end

function GuildvoyageModel.getFinishCost(slot0, slot1)
	if slot0.guild_cost_data == nil then
		slot0.guild_cost_data = Config.GuildShippingData.data_cost
	end

	if slot0.guild_cost_data == nil or next(slot0.guild_cost_data) == nil then
		return 0
	end

	for slot5, slot6 in ipairs(slot0.guild_cost_data) do
		if slot1 <= slot6.time then
			return slot6.loss or 0
		end
	end

	return 0
end

function GuildvoyageModel.refreshCost(slot0, slot1)
	if slot0.refresh_data == nil then
		slot0.refresh_data = DeepCopy(Config.GuildShippingData.data_refresh)

		table.sort(slot0.refresh_data, function (slot0, slot1)
			return slot0.count < slot1.count
		end)
	end

	for slot5, slot6 in ipairs(slot0.refresh_data) do
		if slot1 <= slot6.count then
			return slot6.cost or 0
		end
	end

	return 0
end

function GuildvoyageModel.getMaxRefreshTimes(slot0)
	if slot0.max_refresh_times then
		return slot0.max_refresh_times
	end

	slot0.max_refresh_times = 0

	for slot4, slot5 in ipairs(Config.GuildShippingData.data_refresh) do
		if slot0.max_refresh_times <= slot5.count then
			slot0.max_refresh_times = slot5.count
		end
	end

	return slot0.max_refresh_times
end

function GuildvoyageModel.getMaxSubTimes(slot0)
	if RoleController:getInstance():getRoleVo() == nil then
		return 0
	end

	if slot0.vip_limite_data == nil then
		slot0.vip_limite_data = DeepCopy(Config.GuildShippingData.data_vip_limit)

		table.sort(slot0.vip_limite_data, function (slot0, slot1)
			return slot1.vip < slot0.vip
		end)
	end

	for slot5, slot6 in ipairs(slot0.vip_limite_data) do
		if slot6.vip <= slot1.vip_lev then
			return slot6.limit or 0
		end
	end

	return 0
end

function GuildvoyageModel.__delete(slot0)
end
