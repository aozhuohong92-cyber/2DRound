PetardActionController = PetardActionController or BaseClass(BaseController)

function PetardActionController.config(slot0)
	slot0.model = PetardActionModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function PetardActionController.getModel(slot0)
	return slot0.model
end

function PetardActionController.registerEvents(slot0)
	if not slot0.close_item_event then
		slot0.close_item_event = GlobalEvent:getInstance():Bind(MainuiEvent.CLOSE_ITEM_VIEW, function (slot0)
			if uv0.red_bag_cache_data and next(uv0.red_bag_cache_data) ~= nil then
				uv0:openRedbagInfoWindow(true, uv0.red_bag_cache_data)

				uv0.red_bag_cache_data = nil
			end
		end)
	end

	if not slot0.close_hook_alert_event then
		slot0.close_hook_alert_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.Close_Hook_Alert_Event, function ()
			if uv0._show_open_tips_flag then
				uv0:openPetardActionTips(true)

				uv0._show_open_tips_flag = false
			end
		end)
	end
end

function PetardActionController.registerProtocals(slot0)
	slot0:RegisterProtocal(27000, "handle27000")
	slot0:RegisterProtocal(27001, "handle27001")
	slot0:RegisterProtocal(27002, "handle27002")
	slot0:RegisterProtocal(27003, "handle27003")
	slot0:RegisterProtocal(27004, "handle27004")
	slot0:RegisterProtocal(27005, "handle27005")
	slot0:RegisterProtocal(27006, "handle27006")
	slot0:RegisterProtocal(27007, "handle27007")
	slot0:RegisterProtocal(27008, "handle27008")
end

function PetardActionController.sender27000(slot0)
	slot0:SendProtocal(27000, {})
end

function PetardActionController.handle27000(slot0, slot1)
	slot0.model:setPetardBaseInfo(slot1)
	GlobalEvent:getInstance():Fire(PetardActionEvent.Get_Base_Info_Event)
end

function PetardActionController.sender27001(slot0, slot1, slot2)
	slot0:SendProtocal(27001, {
		id = slot1,
		num = slot2
	})
end

function PetardActionController.handle27001(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end

function PetardActionController.sender27002(slot0)
	slot0:SendProtocal(27002, {})
end

function PetardActionController.handle27002(slot0, slot1)
	slot0.model:setPetardRedbagData(slot1)
	GlobalEvent:getInstance():Fire(PetardActionEvent.Get_Redbag_Data_Event)
end

function PetardActionController.sender27003(slot0, slot1)
	slot0:SendProtocal(27003, {
		red_packet_id = slot1
	})
end

function PetardActionController.handle27003(slot0, slot1)
	slot2 = MainuiController:getInstance():itemExhibitionIsOpen()

	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.code == 0 then
		slot0:sender27002()
	end

	if slot1.get_red_packet_list and next(slot1.get_red_packet_list) ~= nil then
		if MainuiController:getInstance():itemExhibitionIsOpen() == false then
			slot0.red_bag_cache_data = slot1
		else
			slot0:openRedbagInfoWindow(true, slot1)
		end
	end
end

function PetardActionController.handle27004(slot0, slot1)
	if slot1.code then
		GlobalEvent:getInstance():Fire(PetardActionEvent.Update_Petard_Main_Redbag_Event, slot1.code)
	end
end

function PetardActionController.handle27005(slot0, slot1)
	if slot1.flag == TRUE then
		if BattleDramaController:getInstance():checkHookAlertIsOpen() then
			slot0._show_open_tips_flag = true
		else
			slot0:openPetardActionTips(true)

			slot0._show_open_tips_flag = false
		end
	else
		slot0:openPetardActionTips(false)

		slot0._show_open_tips_flag = false
	end
end

function PetardActionController.sender27006(slot0)
	slot0:SendProtocal(27006, {})
end

function PetardActionController.handle27006(slot0, slot1)
	if slot1.get_red_packet_list then
		GlobalEvent:getInstance():Fire(PetardActionEvent.Get_Redbag_Msg_Data_Event, slot1.get_red_packet_list)
	end
end

function PetardActionController.sender27007(slot0, slot1)
	slot0:SendProtocal(27007, {
		id = slot1
	})
end

function PetardActionController.handle27007(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end

function PetardActionController.handle27008(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.flag == TRUE and slot1.msg ~= "" then
		MainSceneController:getInstance():showMainSceneEffect(true, 342)
	end
end

function PetardActionController.openSelectItemWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.select_item_wnd then
			slot0.select_item_wnd = PetardSelectItemWindow.New()
		end

		if slot0.select_item_wnd:isOpen() == false then
			slot0.select_item_wnd:open()
		end
	elseif slot0.select_item_wnd then
		slot0.select_item_wnd:close()

		slot0.select_item_wnd = nil
	end
end

function PetardActionController.openAffirmWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.petard_affirm_wnd then
			slot0.petard_affirm_wnd = PetardAffirmWindow.New()
		end

		if slot0.petard_affirm_wnd:isOpen() == false then
			slot0.petard_affirm_wnd:open(slot2, slot3)
		end
	elseif slot0.petard_affirm_wnd then
		slot0.petard_affirm_wnd:close()

		slot0.petard_affirm_wnd = nil
	end
end

function PetardActionController.openRedbagWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.petard_redbag_wnd then
			slot0.petard_redbag_wnd = PetardRedbagWindow.New()
		end

		if slot0.petard_redbag_wnd:isOpen() == false then
			slot0.petard_redbag_wnd:open()
		end
	elseif slot0.petard_redbag_wnd then
		slot0.petard_redbag_wnd:close()

		slot0.petard_redbag_wnd = nil
	end
end

function PetardActionController.openRedbagInfoWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.redbag_info_wnd then
			slot0.redbag_info_wnd = PetardRedbagInfoWindow.New()
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

function PetardActionController.openPetardActionTips(slot0, slot1)
	if slot1 == true then
		if not slot0.petard_action_tips then
			slot0.petard_action_tips = PetardActionTips.New()
		end

		if slot0.petard_action_tips:isOpen() == false then
			slot0.petard_action_tips:open()
		end
	elseif slot0.petard_action_tips then
		slot0.petard_action_tips:close()

		slot0.petard_action_tips = nil
	end
end

function PetardActionController.openPetardEffectWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.petard_effect_wnd then
			slot0.petard_effect_wnd = PetardEffectWindow.new()
		end

		if slot0.petard_effect_wnd then
			slot0.petard_effect_wnd:openView(slot2)
		end
	elseif slot0.petard_effect_wnd then
		slot0.petard_effect_wnd:DeleteMe()

		slot0.petard_effect_wnd = nil
	end
end

function PetardActionController.openPetardAwardWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.petard_award_wnd then
			slot0.petard_award_wnd = PetardAwardWindow.New()
		end

		if slot0.petard_award_wnd:isOpen() == false then
			slot0.petard_award_wnd:open()
		end
	elseif slot0.petard_award_wnd then
		slot0.petard_award_wnd:close()

		slot0.petard_award_wnd = nil
	end
end

function PetardActionController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
