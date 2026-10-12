VoyageController = VoyageController or BaseClass(BaseController)

function VoyageController.config(slot0)
	slot0.model = VoyageModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function VoyageController.getModel(slot0)
	return slot0.model
end

function VoyageController.registerEvents(slot0)
end

function VoyageController.requestVoyageInfo(slot0)
	slot0:SendProtocal(23800, {})
end

function VoyageController.requestReceiveOrder(slot0, slot1, slot2)
	slot0:SendProtocal(23802, {
		order_id = slot1,
		assign_ids = slot2
	})
end

function VoyageController.requestFinishOrder(slot0, slot1, slot2)
	slot0:SendProtocal(23803, {
		order_id = slot1,
		type = slot2
	})
end

function VoyageController.requestRefreshOrder(slot0)
	slot0.request_flag = true

	slot0:SendProtocal(23804, {})
end

function VoyageController.requestActivityStatus(slot0)
	slot0:SendProtocal(23805, {})
end

function VoyageController.requestQuickReceiveOrder(slot0)
	slot0:SendProtocal(23806, {})
end

function VoyageController.registerProtocals(slot0)
	slot0:RegisterProtocal(23800, "handle23800")
	slot0:RegisterProtocal(23801, "handle23801")
	slot0:RegisterProtocal(23802, "handle23802")
	slot0:RegisterProtocal(23803, "handle23803")
	slot0:RegisterProtocal(23804, "handle23804")
	slot0:RegisterProtocal(23805, "handle23805")
	slot0:RegisterProtocal(23806, "handle23806")
end

function VoyageController.handle23800(slot0, slot1)
	if slot1.order_list then
		slot0.model:setOrderList(slot1.order_list)
	end

	if slot1.free_times then
		slot0.model:setFreeTimes(slot1.free_times)
	end

	if slot1.coin_times then
		slot0.model:setCoinTimes(slot1.coin_times)
	end

	GlobalEvent:getInstance():Fire(VoyageEvent.UpdateVoyageDataEvent)
	GlobalEvent:getInstance():Fire(VoyageEvent.UpdateVoyageRedEvent)
end

function VoyageController.handle23801(slot0, slot1)
	if slot1 then
		slot0.model:updateOneOrderData(slot1)
		GlobalEvent:getInstance():Fire(VoyageEvent.UpdateVoyageRedEvent)
	end
end

function VoyageController.handle23802(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		slot0:openVoyageDispatchWindow(false)
	end
end

function VoyageController.handle23803(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE and slot1.order_id then
		slot0.model:deleteOneOrderData(slot1.order_id)
		GlobalEvent:getInstance():Fire(VoyageEvent.DeleteOrderDataEvent)
		GlobalEvent:getInstance():Fire(VoyageEvent.UpdateVoyageRedEvent)
	end
end

function VoyageController.handle23804(slot0, slot1)
	message(slot1.msg)

	slot0.request_flag = false
end

function VoyageController.checkRefreshReqIsBack(slot0)
	if not slot0.request_flag then
		return true
	end

	return false
end

function VoyageController.handle23805(slot0, slot1)
	if slot1.flag then
		slot0.model:setActivityStatus(slot1.flag)
		GlobalEvent:getInstance():Fire(VoyageEvent.UpdateActivityStatusEvent)
	end
end

function VoyageController.handle23806(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.flag == TRUE then
		slot0.model:deleteSomeOrderData(slot1.order_list)
		GlobalEvent:getInstance():Fire(VoyageEvent.DeleteOrderDataEvent)
		GlobalEvent:getInstance():Fire(VoyageEvent.UpdateVoyageRedEvent)
	end
end

function VoyageController.openVoyageMainWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0:checkVoyageIsOpen(slot2) then
			return
		end

		slot0.request_flag = false

		if not slot0.voyage_main_window then
			slot0.voyage_main_window = VoyageMainWindow.New()
		end

		if slot0.voyage_main_window:isOpen() == false then
			slot0.voyage_main_window:open()
		end
	elseif slot0.voyage_main_window then
		slot0.voyage_main_window:close()

		slot0.voyage_main_window = nil
	end
end

function VoyageController.getVoyageMainRoot(slot0)
	if slot0.voyage_main_window then
		return slot0.voyage_main_window.root_wnd
	end
end

function VoyageController.openVoyageDispatchWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.voyage_dispatch_window then
			slot0.voyage_dispatch_window = VoyageDispatchWindow.New()
		end

		if slot0.voyage_dispatch_window:isOpen() == false then
			slot0.voyage_dispatch_window:open(slot2)
		end
	elseif slot0.voyage_dispatch_window then
		slot0.voyage_dispatch_window:close()

		slot0.voyage_dispatch_window = nil
	end
end

function VoyageController.getVoyageDispatchRoot(slot0)
	if slot0.voyage_dispatch_window then
		return slot0.voyage_dispatch_window.root_wnd
	end
end

function VoyageController.checkVoyageIsOpen(slot0, slot1)
	slot2 = false

	if Config.ShippingData.data_const.guild_lev and slot3.val <= RoleController:getInstance():getRoleVo().lev then
		slot2 = true
	elseif not slot1 then
		message(slot3.desc)
	end

	return slot2
end

function VoyageController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
