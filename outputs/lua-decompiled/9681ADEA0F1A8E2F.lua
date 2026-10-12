EquipmakeController = EquipmakeController or BaseClass(BaseController)

function EquipmakeController.config(slot0)
	slot0.model = EquipmakeModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function EquipmakeController.getModel(slot0)
	return slot0.model
end

function EquipmakeController.registerEvents(slot0)
end

function EquipmakeController.registerProtocals(slot0)
	slot0:RegisterProtocal(11080, "on11080")
end

function EquipmakeController.openEquipmakeMainWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.equipmake_window ~= nil then
			slot0.equipmake_window:close()

			slot0.equipmake_window = nil
		end
	else
		if slot0.equipmake_window == nil then
			slot0.equipmake_window = EquipmakeMainWindow.New()
		end

		slot0.equipmake_window:open(slot2)
	end
end

function EquipmakeController.openEquipmakeSourcesWindow(slot0, slot1)
	if not slot1 then
		if slot0.equipmake_sources_window ~= nil then
			slot0.equipmake_sources_window:close()

			slot0.equipmake_sources_window = nil
		end
	else
		if slot0.equipmake_sources_window == nil then
			slot0.equipmake_sources_window = EquipmakeSourcesWindow.New()
		end

		slot0.equipmake_sources_window:open()
	end
end

function EquipmakeController.requestEquipmake(slot0, slot1, slot2)
	slot0:SendProtocal(11080, {
		partner_id = slot1,
		eqm_type = slot2
	})
end

function EquipmakeController.on11080(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		GlobalEvent:getInstance():Fire(EquipmakeEvent.UpdateEquipmakeEvent, slot1.partner_id, slot1.eqm_type)
	end
end

function EquipmakeController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
