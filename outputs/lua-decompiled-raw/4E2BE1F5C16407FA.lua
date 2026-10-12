AuguryController = AuguryController or BaseClass(BaseController)

function AuguryController.config(slot0)
	slot0.model = AuguryModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function AuguryController.getModel(slot0)
	return slot0.model
end

function AuguryController.registerEvents(slot0)
end

function AuguryController.registerProtocals(slot0)
	slot0:RegisterProtocal(11330, "handle11330")
	slot0:RegisterProtocal(11331, "handle11331")
	slot0:RegisterProtocal(11332, "handle11332")
end

function AuguryController.requestInitProtocal(slot0)
	if Config.CityData.data_base[CenterSceneBuild.study] == nil then
		return
	end

	if MainuiController:getInstance():checkIsOpenByActivate(slot1.activate) == true then
		if slot0.role_assets_event and slot0.role_vo then
			slot0.role_vo:UnBind(slot0.role_assets_event)

			slot0.role_assets_event = nil
		end

		slot0:sender11330()
	end
end

function AuguryController.getAuguryRoot(slot0)
	if slot0.main_view then
		return slot0.main_view.root_wnd
	end
end

function AuguryController.openMainView(slot0, slot1)
	if slot1 == false then
		if slot0.main_view ~= nil then
			slot0.main_view:close()

			slot0.main_view = nil
		end
	else
		if MainSceneController:getInstance():getBuildVo(CenterSceneBuild.study) and slot2.is_lock then
			message(slot2.desc)

			return
		end

		if not slot0.main_view then
			slot0.main_view = AuguryWindow.New()
		end

		if slot0.main_view and slot0.main_view:isOpen() == false then
			slot0.main_view:open()
		end
	end
end

function AuguryController.openAlertWidnow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.alert_window then
			slot0.alert_window = AuguryAlertWindow.New(slot2)
		end

		if slot0.alert_window and slot0.alert_window:isOpen() == false then
			slot0.alert_window:open()
		end
	elseif slot0.alert_window then
		slot0.alert_window:close()

		slot0.alert_window = nil
	end
end

function AuguryController.openGetWidnow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.get_window then
			slot0.get_window = AuguryGetWindow.New(slot2)
		end

		if slot0.get_window and slot0.get_window:isOpen() == false then
			slot0.get_window:open()
		end
	elseif slot0.get_window then
		slot0.get_window:close()

		slot0.get_window = nil
	end
end

function AuguryController.sender11330(slot0)
	slot0:SendProtocal(11330, {})
end

function AuguryController.handle11330(slot0, slot1)
	slot0.model:updateData(slot1)
end

function AuguryController.sender11331(slot0, slot1, slot2)
	slot0:SendProtocal(11331, {
		type = slot1,
		count = slot2
	})
end

function AuguryController.handle11331(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		GlobalEvent:getInstance():Fire(AuguryEvent.Augury_Success_Event, slot1)
		slot0.model:updateData(slot1)
	end
end

function AuguryController.sender11332(slot0)
	slot0:SendProtocal(11332, {})
end

function AuguryController.handle11332(slot0, slot1)
	message(slot1.msg)
	slot0.model:updateData(slot1)
end

function AuguryController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
