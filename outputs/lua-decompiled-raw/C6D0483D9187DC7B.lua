OnecentgiftController = OnecentgiftController or BaseClass(BaseController)

function OnecentgiftController.config(slot0)
	slot0.model = OnecentgiftModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function OnecentgiftController.getModel(slot0)
	return slot0.model
end

function OnecentgiftController.registerEvents(slot0)
end

function OnecentgiftController.registerProtocals(slot0)
	slot0:RegisterProtocal(16651, "handle16651")
	slot0:RegisterProtocal(16652, "handle16652")
end

function OnecentgiftController.send16651(slot0)
	slot0:SendProtocal(16651, {})
end

function OnecentgiftController.handle16651(slot0, slot1)
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	if slot0.role_power_exchange_event == nil and slot0.role_vo then
		slot0.role_power_exchange_event = slot0.role_vo:Bind(RoleEvent.UPDATE_POWER_VALUE, function (slot0, slot1)
			uv0.model:updateRed(slot0)
		end)
	end

	slot0.model:setBaseInfo(slot1)
	slot0.dispather:Fire(OnecentgiftEvent.Onecentgift_Init_Event)
end

function OnecentgiftController.send16652(slot0, slot1)
	slot0:SendProtocal(16652, {
		id = slot1
	})
end

function OnecentgiftController.handle16652(slot0, slot1)
	message(slot1.msg)
end

function OnecentgiftController.openOnecentiftView(slot0, slot1)
	if slot1 == true then
		if not slot0.onecentgift_window then
			slot0.onecentgift_window = OneCentGiftWindow.New()
		end

		slot0.onecentgift_window:open()
	elseif slot0.onecentgift_window then
		slot0.onecentgift_window:close()

		slot0.onecentgift_window = nil
	end
end

function OnecentgiftController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
