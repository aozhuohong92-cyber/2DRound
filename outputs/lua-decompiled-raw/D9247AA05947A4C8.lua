RedbagModel = RedbagModel or BaseClass()

function RedbagModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function RedbagModel.config(slot0)
	slot0.redbag_list = {}
	slot0.redbag_num = 0
	slot0.redbag_send_num = 0
	slot0.redbag_rec_num = 0
	slot0.is_get_redbag = 0
	slot0.red_bag_item_num = {}
	slot0.all_red_show = false
end

function RedbagModel.resetData(slot0)
	slot0:config()
end

function RedbagModel.__delete(slot0)
end

function RedbagModel.updateData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.type and slot1.type == 0 then
		slot0.redbag_list = {}
	end

	for slot6, slot7 in pairs(slot1.list or {}) do
		slot7.order = 0 - slot7.time

		if slot7.flag == 0 and slot7.num < slot7.max_num and slot7.time - GameNet:getInstance():getTime() >= 0 then
			slot7.order = GameNet:getInstance():getTime() - slot7.time
		end

		slot0.redbag_list[slot7.id] = slot7
	end

	GlobalEvent:getInstance():Fire(RedbagEvent.Get_Data_Event, slot1)

	if slot0.is_get_redbag ~= 0 then
		slot0:checkRedBagRedPoint()
	else
		GuildController:getInstance():SendProtocal(13523, {})
	end

	slot0.is_get_redbag = 0
end

function RedbagModel.updateRedBagNum(slot0, slot1, slot2)
	slot0.redbag_send_num = slot1 or 0
	slot0.redbag_rec_num = slot2 or 0
	slot0.is_get_redbag = 1

	if Config.GuildData.data_const.red_packet_get.val <= slot0.redbag_rec_num then
		slot0.is_get_redbag = 2
	end

	slot0:checkRedBagRedPoint()
end

function RedbagModel.checkRedBagRedPoint(slot0)
	slot1 = nil
	slot0.is_have_red = false
	slot0.all_red_show = false
	slot0.redbag_num = 0

	for slot5, slot6 in pairs(slot0.redbag_list) do
		slot0.redbag_num = slot0.redbag_num + 1

		if slot6.num < slot6.max_num and slot6.time - GameNet:getInstance():getTime() >= 0 and slot6.flag == 0 then
			slot1 = slot6
			slot0.is_have_red = true
			slot0.all_red_show = true

			break
		end
	end

	if slot0.is_get_redbag == 2 then
		slot1 = nil
		slot0.is_have_red = false
		slot0.all_red_show = false
	end

	slot0:checkItemNumRedPoint()

	if slot0.red_bag_item_num and next(slot0.red_bag_item_num or {}) ~= nil then
		for slot5, slot6 in ipairs(slot0.red_bag_item_num) do
			if slot6.status == true then
				slot0.all_red_show = true

				break
			end
		end
	end

	GlobalEvent:getInstance():Fire(RedbagEvent.Can_Get_Red_Bag, slot1)
	GlobalEvent:getInstance():Fire(GuildEvent.UpdateGuildRedStatus, GuildConst.red_index.red_bag, slot0.all_red_show)

	if MainuiController:getInstance():checkIsOpenByActivate(Config.FunctionData.data_base[6].activate) == true then
		MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.guild, {
			bid = GuildConst.red_index.red_bag,
			status = slot0.all_red_show
		})
	end
end

function RedbagModel.checkItemNumRedPoint(slot0)
	if Config.GuildData.data_guild_red_bag then
		slot0.red_bag_item_num = {}

		for slot4, slot5 in ipairs(Config.GuildData.data_guild_red_bag) do
			if slot5 and slot5.loss_item and slot5.loss_item[1] then
				slot7 = false

				if slot5.loss_item[1][2] <= BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot5.loss_item[1][1]) then
					slot7 = true
				end

				table.insert(slot0.red_bag_item_num, {
					id = slot5.id,
					status = slot7,
					bid = slot5.loss_item[1][1]
				})
			end
		end
	end
end

function RedbagModel.getRedBagNum(slot0)
	return slot0.redbag_num or 0
end

function RedbagModel.getIsHaveRedBag(slot0)
	return slot0.is_have_red or false
end

function RedbagModel.getAllRedBagStatus(slot0)
	return slot0.all_red_show or false
end

function RedbagModel.getHaveItemID(slot0)
	if slot0.red_bag_item_num and next(slot0.red_bag_item_num or {}) ~= nil then
		for slot5, slot6 in ipairs(slot0.red_bag_item_num) do
			if slot6.status == true and slot6.id <= 99 then
				slot1 = slot6.id
			end
		end

		return slot1
	end
end

function RedbagModel.getSendRedBagStatue(slot0, slot1)
	slot2 = false

	if slot0.red_bag_item_num and next(slot0.red_bag_item_num or {}) ~= nil then
		for slot6, slot7 in ipairs(slot0.red_bag_item_num) do
			if slot1 then
				if slot7.id ~= slot1 and slot7.status == true then
					slot2 = true

					break
				end
			elseif slot7.status == true then
				slot2 = true

				break
			end
		end
	end

	return slot2
end

function RedbagModel.getRebBagItemNumList(slot0)
	if slot0.red_bag_item_num and next(slot0.red_bag_item_num or {}) ~= nil then
		return slot0.red_bag_item_num
	end
end

function RedbagModel.getRedBagList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.redbag_list) do
		table.insert(slot1, slot6)
	end

	return slot1
end

function RedbagModel.getRedBagListById(slot0, slot1)
	return slot0.redbag_list[slot1]
end
