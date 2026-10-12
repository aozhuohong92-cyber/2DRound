NewPartnersummonModel = NewPartnersummonModel or BaseClass()

function NewPartnersummonModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function NewPartnersummonModel.config(slot0)
end

function NewPartnersummonModel.setSummonItemData(slot0, slot1)
	if not slot0.summon_data then
		slot0.summon_data = {}
	end

	for slot5, slot6 in pairs(slot1) do
		slot7 = 0
		slot8 = 0

		for slot12, slot13 in pairs(slot6.draw_list) do
			if keyfind("key", 4, slot13.kv_list) or nil then
				slot7 = slot14.val or 0
			end

			if keyfind("key", 5, slot13.kv_list) or nil then
				slot8 = slot15.val or 0
			end
		end

		slot0.summon_data[slot6.group_id] = {
			free_num = slot7,
			time_num = slot8
		}
	end

	slot0:SummonSceneBuild()
end

function NewPartnersummonModel.getSummonItemData(slot0, slot1)
	if slot0.summon_data[slot1] then
		return slot0.summon_data[slot1]
	end
end

function NewPartnersummonModel.updataSummonItemData(slot0, slot1)
	if slot0.summon_data[slot1.group_id] then
		slot0.summon_data[slot1.group_id].free_num = slot1.free_times
		slot0.summon_data[slot1.group_id].time_num = slot1.free_cd_end
	end

	slot0:SummonSceneBuild()
end

function NewPartnersummonModel.SummonSceneBuild(slot0)
	if not slot0.summon_data then
		return
	end

	slot1 = false

	for slot5, slot6 in pairs(slot0.summon_data) do
		if slot6.free_num == 1 then
			slot1 = true

			break
		end
	end

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.summon, slot1)
end

function NewPartnersummonModel.__delete(slot0)
end
