NewFirstChargeController = NewFirstChargeController or BaseClass(BaseController)

function NewFirstChargeController.config(slot0)
	slot0.model = NewFirstChargeModel.New(slot0)
end

function NewFirstChargeController.getModel(slot0)
	return slot0.model
end

function NewFirstChargeController.registerEvents(slot0)
end

function NewFirstChargeController.registerProtocals(slot0)
	slot0:RegisterProtocal(21000, "handle21000")
	slot0:RegisterProtocal(21001, "handle21001")
	slot0:RegisterProtocal(21012, "handle21012")
	slot0:RegisterProtocal(21013, "handle21013")
	slot0:RegisterProtocal(21014, "handle21014")
	slot0:RegisterProtocal(21015, "handle21015")
	slot0:RegisterProtocal(21030, "handle21030")
	slot0:RegisterProtocal(21031, "handle21031")
	slot0:RegisterProtocal(21032, "handle21032")
	slot0:RegisterProtocal(21033, "handle21033")
	slot0:RegisterProtocal(21034, "handle21034")
end

function NewFirstChargeController.openNewFirstChargeView(slot0, slot1)
	if FILTER_CHARGE then
		return
	end

	if slot1 == true then
		if MainuiController:getInstance():getFunctionIconById(MainuiConst.icon.first_charge_new2) and not slot0.new_first_charge_window then
			slot0.new_first_charge_window = NewFirstChargeWindow2.New()
		end

		if MainuiController:getInstance():getFunctionIconById(MainuiConst.icon.first_charge_new3) and not slot0.new_first_charge_window then
			slot0.new_first_charge_window = NewFirstChargeWindow3.New()
		end

		if MainuiController:getInstance():getFunctionIconById(MainuiConst.icon.first_charge_new1) and not slot0.new_first_charge_window then
			slot0.new_first_charge_window = NewFirstChargeWindow1.New()
		end

		if MainuiController:getInstance():getFunctionIconById(MainuiConst.icon.first_charge_new) and not slot0.new_first_charge_window then
			slot0.new_first_charge_window = NewFirstChargeWindow.New()
		end

		if not slot0.new_first_charge_window then
			return
		end

		slot7 = 1

		if RoleController:getInstance():getRoleVo().vip_exp ~= 0 then
			slot7 = 2
		end

		if slot0.new_first_get_data then
			slot8 = false

			for slot12 = 1, 3 do
				if slot0.new_first_get_data[slot12] and slot0.new_first_get_data[slot12].status == 1 then
					slot8 = true
					slot7 = 1

					break
				end
			end

			slot9 = false

			for slot13 = 4, 6 do
				if slot0.new_first_get_data[slot13] and slot0.new_first_get_data[slot13].status == 1 then
					slot9 = true
					slot7 = 2

					break
				end
			end

			if slot8 == true and slot9 == true then
				slot7 = 1
			end
		end

		slot0.new_first_charge_window:open(slot7)
	elseif slot0.new_first_charge_window then
		slot0.new_first_charge_window:close()

		slot0.new_first_charge_window = nil
	end
end

function NewFirstChargeController.sender21000(slot0)
	slot0:SendProtocal(21000, {})
end

function NewFirstChargeController.handle21000(slot0, slot1)
	slot0.new_first_get_data = slot1.first_gift

	slot0.model:setFirstBtnNewStatus(slot1.first_gift)
	GlobalEvent:getInstance():Fire(NewFirstChargeEvent.New_First_Charge_Event, slot1)
end

function NewFirstChargeController.sender21001(slot0, slot1)
	slot0:SendProtocal(21001, {
		id = slot1
	})
end

function NewFirstChargeController.handle21001(slot0, slot1)
	message(slot1.msg)
end

function NewFirstChargeController.sender21012(slot0)
	slot0:SendProtocal(21012, {})
end

function NewFirstChargeController.handle21012(slot0, slot1)
	slot0.new_first_get_data = slot1.first_gift

	slot0.model:setFirstBtnStatus(slot1.first_gift)
	GlobalEvent:getInstance():Fire(NewFirstChargeEvent.New_First_Charge_Event, slot1)
end

function NewFirstChargeController.sender21013(slot0, slot1)
	slot0:SendProtocal(21013, {
		id = slot1
	})
end

function NewFirstChargeController.handle21013(slot0, slot1)
	message(slot1.msg)
end

function NewFirstChargeController.sender21014(slot0, slot1)
	slot0:SendProtocal(21014, {
		id = slot1
	})
end

function NewFirstChargeController.handle21014(slot0, slot1)
	message(slot1.msg)
end

function NewFirstChargeController.handle21015(slot0, slot1)
	if slot1.open_id and next(slot1.open_id) ~= nil then
		WelfareController:getInstance():getModel():updateDailyGiftRedStatus(true)
	end
end

function NewFirstChargeController.sender21030(slot0)
	slot0:SendProtocal(21030, {})
end

function NewFirstChargeController.handle21030(slot0, slot1)
	slot0.new_first_get_data = slot1.first_gift

	slot0.model:setFirstBtnNewStatus2(slot1.first_gift)
	GlobalEvent:getInstance():Fire(NewFirstChargeEvent.New_First_Charge_Event, slot1)
end

function NewFirstChargeController.sender21031(slot0, slot1)
	slot0:SendProtocal(21031, {
		id = slot1
	})
end

function NewFirstChargeController.handle21031(slot0, slot1)
	message(slot1.msg)
end

function NewFirstChargeController.sender21032(slot0)
	slot0:SendProtocal(21032, {})
end

function NewFirstChargeController.handle21032(slot0, slot1)
	slot0.new_first_get_data = slot1.first_gift

	slot0.model:setFirstBtnNewStatus3(slot1.first_gift)
	GlobalEvent:getInstance():Fire(NewFirstChargeEvent.New_First_Charge_Event, slot1)
end

function NewFirstChargeController.sender21033(slot0, slot1)
	slot0:SendProtocal(21033, {
		id = slot1
	})
end

function NewFirstChargeController.handle21033(slot0, slot1)
	message(slot1.msg)
end

function NewFirstChargeController.handle21034(slot0, slot1)
	report_pay(slot1.package_id, slot1.order_id, slot1.money)
end

function NewFirstChargeController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
