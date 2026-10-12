ReturnActionController = ReturnActionController or BaseClass(BaseController)
slot0 = Config.HolidayReturnNewData.data_constant

function ReturnActionController.config(slot0)
	slot0.model = ReturnActionModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.action_status_list = {}
end

function ReturnActionController.getModel(slot0)
	return slot0.model
end

function ReturnActionController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil

			uv0:sender27902()

			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if uv0.role_update_event == nil and uv0.role_vo then
				uv0.role_update_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
					if slot0 == "lev" and uv0.model and uv0.model:getActionIsOpen() == 1 then
						uv0:sender27902()
					end
				end)
			end
		end)
	end

	if not slot0.close_item_event then
		slot0.close_item_event = GlobalEvent:getInstance():Bind(MainuiEvent.CLOSE_ITEM_VIEW, function (slot0)
			if uv0.red_bag_cache_data and next(uv0.red_bag_cache_data) ~= nil then
				uv0:openReturnRedbagInfoWindow(true, uv0.red_bag_cache_data)

				uv0.red_bag_cache_data = nil
			end
		end)
	end
end

function ReturnActionController.initProto(slot0)
	slot0:sender27900()
	slot0:sender27905()
	slot0:sender27908()
	slot0:sender27903()
end

function ReturnActionController.registerProtocals(slot0)
	slot0:RegisterProtocal(27900, "handle27900")
	slot0:RegisterProtocal(27901, "handle27901")
	slot0:RegisterProtocal(27902, "handle27902")
	slot0:RegisterProtocal(27903, "handle27903")
	slot0:RegisterProtocal(27904, "handle27904")
	slot0:RegisterProtocal(27905, "handle27905")
	slot0:RegisterProtocal(27906, "handle27906")
	slot0:RegisterProtocal(27907, "handle27907")
	slot0:RegisterProtocal(27908, "handle27908")
	slot0:RegisterProtocal(27909, "handle27909")
	slot0:RegisterProtocal(27910, "handle27910")
	slot0:RegisterProtocal(27911, "handle27911")
	slot0:RegisterProtocal(27912, "handle27912")
	slot0:RegisterProtocal(27913, "handle27913")
	slot0:RegisterProtocal(27914, "handle27914")
	slot0:RegisterProtocal(27915, "handle27915")
	slot0:RegisterProtocal(27916, "handle27916")
end

function ReturnActionController.sender27900(slot0)
	slot0:SendProtocal(27900, {})
end

function ReturnActionController.handle27900(slot0, slot1)
	slot0.model:setActionGiftData(slot1)
	slot0.dispather:Fire(ReturnActionEvent.Gift_Data_Event)
end

function ReturnActionController.sender27901(slot0)
	slot0:SendProtocal(27901, {})
end

function ReturnActionController.handle27901(slot0, slot1)
	message(slot1.msg)
end

function ReturnActionController.sender27902(slot0)
	slot0:SendProtocal(27902, {})
end

function ReturnActionController.handle27902(slot0, slot1)
	slot0.model:setActionPeriod(slot1.period)
	slot0.model:setActionDay(slot1.open_day)
	slot0.model:setActionIsOpen(slot1.is_open)

	if slot1.is_open == 1 then
		slot0:initProto()
	end
end

function ReturnActionController.sender27903(slot0)
	slot0:SendProtocal(27903, {})
end

function ReturnActionController.handle27903(slot0, slot1)
	slot0.model:setActionSummonData(slot1)
	slot0.dispather:Fire(ReturnActionEvent.Summon_Data_Event, slot1)
end

function ReturnActionController.sender27904(slot0, slot1)
	slot0:SendProtocal(27904, {
		type = slot1
	})
end

function ReturnActionController.handle27904(slot0, slot1)
	message(slot1.msg)
end

function ReturnActionController.sender27905(slot0)
	slot0:SendProtocal(27905, {})
end

function ReturnActionController.handle27905(slot0, slot1)
	slot0.model:setActionTaskData(slot1)
	slot0.dispather:Fire(ReturnActionEvent.Task_Event, slot1)
end

function ReturnActionController.sender27906(slot0)
	slot0:SendProtocal(27906, {})
end

function ReturnActionController.handle27906(slot0, slot1)
	slot0.model:updateActionTaskData(slot1)
	slot0.dispather:Fire(ReturnActionEvent.Task_Updata_Event)
end

function ReturnActionController.sender27907(slot0, slot1)
	slot0:SendProtocal(27907, {
		id = slot1
	})
end

function ReturnActionController.handle27907(slot0, slot1)
	message(slot1.msg)

	if slot1 and slot1.code == 1 then
		slot0.model:updateActionTaskDataById(slot1)
		slot0.dispather:Fire(ReturnActionEvent.Limin_Task_Event, slot1)
	end
end

function ReturnActionController.sender27908(slot0)
	slot0:SendProtocal(27908, {})
end

function ReturnActionController.handle27908(slot0, slot1)
	slot0.model:setServerSignData(slot1)
	slot0.dispather:Fire(ReturnActionEvent.Sign_Event, slot1)
end

function ReturnActionController.sender27909(slot0, slot1)
	slot0:SendProtocal(27909, {
		day = slot1
	})
end

function ReturnActionController.handle27909(slot0, slot1)
	message(slot1.msg)

	if slot1 and slot1.code == 1 then
		slot0.model:updataServerSignData(slot1)
	end
end

function ReturnActionController.sender27910(slot0)
	slot0:SendProtocal(27910, {})
end

function ReturnActionController.handle27910(slot0, slot1)
	slot0.model:setReturnRedbagData(slot1)
	slot0.dispather:Fire(ReturnActionEvent.Get_Redbag_Data_Event)
end

function ReturnActionController.sender27911(slot0, slot1)
	slot0:SendProtocal(27911, {
		red_packet_id = slot1
	})
end

function ReturnActionController.handle27911(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.code == 0 then
		slot0:sender27910()
	end

	if slot1.get_red_packet_list and next(slot1.get_red_packet_list) ~= nil then
		if MainuiController:getInstance():itemExhibitionIsOpen() == false then
			slot0.red_bag_cache_data = slot1
		else
			slot0:openReturnRedbagInfoWindow(true, slot1)
		end
	end
end

function ReturnActionController.handle27912(slot0, slot1)
	slot0.model:setReturnRedbagNumData(slot1)

	if slot1.code then
		slot0.dispather:Fire(ReturnActionEvent.Update_Return_Main_Redbag_Event, slot1.code)
	end
end

function ReturnActionController.sender27913(slot0)
	slot0:SendProtocal(27913, {})
end

function ReturnActionController.handle27913(slot0, slot1)
	if slot1.get_red_packet_list then
		slot0.dispather:Fire(ReturnActionEvent.Get_Redbag_Msg_Data_Event, slot1.get_red_packet_list)
	end
end

function ReturnActionController.sender27914(slot0)
	slot0:SendProtocal(27914, {})
end

function ReturnActionController.handle27914(slot0, slot1)
	slot0.model:setServerShopData(slot1)
	slot0.dispather:Fire(ReturnActionEvent.Shop_Event, slot1)
end

function ReturnActionController.sender27915(slot0, slot1)
	slot0:SendProtocal(27915, {
		id = slot1
	})
end

function ReturnActionController.handle27915(slot0, slot1)
	message(slot1.msg)
end

function ReturnActionController.sender27916(slot0)
	slot0:SendProtocal(27916, {})
end

function ReturnActionController.handle27916(slot0, slot1)
	message(slot1.msg)
end

function ReturnActionController.openReturnActionMainPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.return_action_view ~= nil then
			slot0.return_action_view:close()

			slot0.return_action_view = nil
		end
	else
		if slot0.return_action_view == nil then
			slot0.return_action_view = ReturnActionMainWindow.New()
		end

		if slot0.return_action_view:isOpen() == false then
			slot0.return_action_view:open(slot2)
		end
	end
end

function ReturnActionController.openReturnActionSummonAwardView(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if slot0.summon_award_view == nil then
			slot0.summon_award_view = ReturnActionSummonAwardView.New()
		end

		if slot0.summon_award_view:isOpen() == false then
			slot0.summon_award_view:open(slot2, slot3, slot4)
		end
	elseif slot0.summon_award_view then
		slot0.summon_award_view:close()

		slot0.summon_award_view = nil
	end
end

function ReturnActionController.openReturnRedbagWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.petard_redbag_wnd then
			slot0.petard_redbag_wnd = ReturnActionRedbagWindow.New()
		end

		if slot0.petard_redbag_wnd:isOpen() == false then
			slot0.petard_redbag_wnd:open()
		end
	elseif slot0.petard_redbag_wnd then
		slot0.petard_redbag_wnd:close()

		slot0.petard_redbag_wnd = nil
	end
end

function ReturnActionController.openReturnRedbagInfoWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.redbag_info_wnd then
			slot0.redbag_info_wnd = ReturnActionRedbagInfoWindow.New()
		end

		if slot0.redbag_info_wnd:isOpen() == false then
			slot0.redbag_info_wnd:open(slot2)
		end
	else
		if slot0.redbag_info_wnd then
			slot0.redbag_info_wnd:close()

			slot0.redbag_info_wnd = nil
		end

		slot0.red_bag_cache_data = nil
	end
end

function ReturnActionController.setReturnActionTabStatus(slot0, slot1, slot2)
	if slot0.model:returnActionIsOpen() then
		slot4 = 0

		if slot2 then
			slot4 = 1
		end

		MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.return_action, {
			bid = slot1,
			num = slot4
		})

		if slot0.action_status_list == nil then
			slot0.action_status_list = {}
		end

		slot6 = {
			bid = slot1,
			status = slot2
		}
		slot0.action_status_list[slot1] = slot6

		slot0.dispather:Fire(ReturnActionEvent.RedPoint_Event, slot6)
	end
end

function ReturnActionController.getRedPointStatusData(slot0, slot1)
	if slot0.action_status_list and slot0.action_status_list[slot1] then
		return slot0.action_status_list[slot1]
	end

	return nil
end

function ReturnActionController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
