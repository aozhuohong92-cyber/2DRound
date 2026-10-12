DayChargeController = DayChargeController or BaseClass(BaseController)

function DayChargeController.config(slot0)
	slot0.model = EscortModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function DayChargeController.getModel(slot0)
	return slot0.model
end

function DayChargeController.registerEvents(slot0)
end

function DayChargeController.registerProtocals(slot0)
	slot0:RegisterProtocal(21010, "handle21010")
	slot0:RegisterProtocal(21011, "handle21011")
end

function DayChargeController.sender21010(slot0)
	slot0:SendProtocal(21010, {})
end

function DayChargeController.handle21010(slot0, slot1)
	slot2 = false

	if slot1.status == 1 then
		slot2 = true
	end

	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.day_first_charge, slot2)
	GlobalEvent:getInstance():Fire(DayChargetEvent.DAY_FIRST_CHARGE_EVENT, slot1)
end

function DayChargeController.sender21011(slot0)
	slot0:SendProtocal(21011, {})
end

function DayChargeController.handle21011(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0:openDayFirstChargeView(false)
	end
end

function DayChargeController.openDayFirstChargeView(slot0, slot1)
	if slot1 then
		if not slot0.daycharge_window then
			slot0.daycharge_window = DayChargeWindow.New()
		end

		slot0.daycharge_window:open()
	elseif slot0.daycharge_window then
		slot0.daycharge_window:close()

		slot0.daycharge_window = nil
	end
end

function DayChargeController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
