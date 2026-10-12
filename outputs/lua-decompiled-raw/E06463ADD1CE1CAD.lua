TrainingcampModel = TrainingcampModel or BaseClass()

function TrainingcampModel.__init(slot0, slot1)
	slot0.ctrl = slot1
	slot0.isFinish = false
	slot0.finish_ids = {}

	slot0:config()
end

function TrainingcampModel.config(slot0)
end

function TrainingcampModel.setInfo(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot1.flag == 1 then
		slot0.isFinish = true
	else
		slot0.isFinish = false
	end

	slot0.finish_ids = slot1.ids
end

function TrainingcampModel.getIsFinish(slot0)
	return slot0.isFinish
end

function TrainingcampModel.getIsALLFinish(slot0)
	slot1 = true

	if Config.TrainingCampData and Config.TrainingCampData.data_info then
		for slot5, slot6 in ipairs(Config.TrainingCampData.data_info) do
			if slot0:IsFinishById(slot6.id) == false then
				slot1 = false

				break
			end
		end
	end

	return slot1
end

function TrainingcampModel.IsFinishById(slot0, slot1)
	slot2 = false

	for slot6, slot7 in ipairs(slot0.finish_ids) do
		if slot7.id == slot1 then
			slot2 = true
		end
	end

	return slot2
end

function TrainingcampModel.__delete(slot0)
end
