EncounterController = EncounterController or BaseClass(BaseController)

function EncounterController.config(slot0)
	slot0.model = EncounterModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function EncounterController.getModel(slot0)
	return slot0.model
end

function EncounterController.registerEvents(slot0)
end

function EncounterController.registerProtocals(slot0)
	slot0:RegisterProtocal(27100, "handle27100")
	slot0:RegisterProtocal(27101, "handle27101")
	slot0:RegisterProtocal(27102, "handle27102")
	slot0:RegisterProtocal(27103, "handle27103")
	slot0:RegisterProtocal(27104, "handle27104")
end

function EncounterController.send27100(slot0)
	slot0:SendProtocal(27100, {})
end

function EncounterController.handle27100(slot0, slot1)
	if slot1 then
		slot0.model:setEncounterInfo(slot1)
	end
end

function EncounterController.send27101(slot0)
	slot0:SendProtocal(27101, {})
end

function EncounterController.handle27101(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function EncounterController.send27102(slot0)
	slot0:SendProtocal(27102, {})
end

function EncounterController.handle27102(slot0, slot1)
	slot0.model:setEncounterFinishInfo(slot1.id_list)
	GlobalEvent:getInstance():Fire(EncounterEvent.CHECK_SHOW_LIBRARY_ENCOUNTER, slot1.id_list)
end

function EncounterController.send27103(slot0, slot1, slot2)
	slot0:SendProtocal(27103, {
		id = slot1,
		page = slot2
	})
end

function EncounterController.handle27103(slot0, slot1)
end

function EncounterController.send27104(slot0, slot1)
	slot0:SendProtocal(27104, {
		choice = slot1
	})
end

function EncounterController.handle27104(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function EncounterController.openEncounterWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.encounter_window then
			slot0.encounter_window = EncounterWindow.New()
		end

		if slot0.encounter_window and slot0.encounter_window:isOpen() == false then
			slot0.encounter_window:open(slot2)
		end
	elseif slot0.encounter_window then
		slot0.encounter_window:close()

		slot0.encounter_window = nil
	end
end

function EncounterController.openEncounterLibraryWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.encounter_library_window then
			slot0.encounter_library_window = EncounterLibraryWindow.New()
		end

		if slot0.encounter_library_window and slot0.encounter_library_window:isOpen() == false then
			slot0.encounter_library_window:open()
		end
	elseif slot0.encounter_library_window then
		slot0.encounter_library_window:close()

		slot0.encounter_library_window = nil
	end
end

function EncounterController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
