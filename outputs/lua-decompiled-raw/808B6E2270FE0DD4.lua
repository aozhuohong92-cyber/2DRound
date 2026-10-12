EncounterModel = EncounterModel or BaseClass()

function EncounterModel.__init(slot0, slot1)
	slot0.ctrl = slot1
	slot0.finishArr = {}
	slot0.is_show_red = false

	slot0:config()
end

function EncounterModel.config(slot0)
	slot0.encounter_id = 0
	slot0.encounter_page = 0
end

function EncounterModel.setEncounterInfo(slot0, slot1)
	if slot0.encounter_id ~= 0 then
		table.insert(slot0.finishArr, {
			id = slot0.encounter_id
		})
	end

	slot0.encounter_id = slot1.id
	slot0.encounter_page = slot1.page

	slot0:updateRedStatus()
end

function EncounterModel.getEncounterId(slot0)
	return slot0.encounter_id
end

function EncounterModel.setEncounterPage(slot0, slot1)
	if slot0.encounter_id > 0 then
		slot0.encounter_page = slot1
	end
end

function EncounterModel.getEncounterPage(slot0)
	return slot0.encounter_page
end

function EncounterModel.setEncounterFinishInfo(slot0, slot1)
	slot0.finishArr = slot1
end

function EncounterModel.isFinishByid(slot0, slot1)
	for slot5, slot6 in pairs(slot0.finishArr) do
		if slot6 and slot6.id == slot1 then
			return true
		end
	end

	return false
end

function EncounterModel.updateRedStatus(slot0)
	slot1 = false

	if slot0.encounter_id > 0 then
		slot1 = true
	end

	slot0.is_show_red = slot1

	GlobalEvent:getInstance():Fire(EncounterEvent.UPDATA_RED_STATUS, slot1)
	BattleDramaController:getInstance():getModel():checkRedPoint()
end

function EncounterModel.getRedStatus(slot0)
	return slot0.is_show_red
end

function EncounterModel.__delete(slot0)
end
