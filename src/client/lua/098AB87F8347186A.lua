TaskModel = TaskModel or BaseClass()
slot0 = table.insert
slot1 = table.sort

function TaskModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function TaskModel.config(slot0)
	slot0.task_list = {}
	slot0.feat_list = {}
	slot0.task_status_list = {}
	slot0.update_feat_status_list = {}
	slot0.finish_feat_list = {}
	slot0.dic_task_exp_data = {}
end

function TaskModel.checkQuestAndFeatStatus(slot0, slot1)
	if not RoleController:getInstance():getRoleVo() then
		return
	end

	slot3 = false

	if slot1 == TaskConst.update_type.activity then
		if slot0.activity_data ~= nil then
			for slot7, slot8 in ipairs(Config.ActivityData.data_get) do
				if slot8.activity <= slot2.activity and not slot0.activity_data[slot8.activity] then
					slot3 = true

					break
				end
			end
		end
	elseif slot1 == TaskConst.update_type.quest then
		if slot0.task_list ~= nil then
			for slot7, slot8 in pairs(slot0.task_list) do
				if slot8.finish == TaskConst.task_status.finish then
					slot3 = true

					break
				end
			end
		end
	elseif slot1 == TaskConst.update_type.feat then
		if slot0.feat_list ~= nil then
			for slot7, slot8 in pairs(slot0.feat_list) do
				if slot8.finish == TaskConst.task_status.finish then
					slot3 = true

					break
				end
			end
		end
	elseif slot1 == TaskConst.update_type.exp and Config.RoomFeatData.data_const.experience_open_limit and slot4.val <= slot2.lev and slot0.dic_task_exp_data then
		for slot8, slot9 in pairs(slot0.dic_task_exp_data) do
			if slot9.finish == TaskConst.task_status.finish then
				slot3 = true

				break
			end
		end
	end

	if slot0.red_status_list == nil then
		slot0.red_status_list = {}
	end

	if slot0.red_status_list[slot1] == nil or slot0.red_status_list[slot1] ~= nil and slot0.red_status_list[slot1] ~= slot3 then
		slot0.red_status_list[slot1] = slot3

		GlobalEvent:getInstance():Fire(TaskEvent.UpdateUIRedStatus, slot1, slot3)
	end

	slot4 = FALSE

	if slot3 == true then
		slot4 = TRUE
	end

	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.daily, {
		bid = slot1,
		num = slot4
	})
end

function TaskModel.getRedStatus(slot0, slot1)
	if slot0.red_status_list == nil then
		return false
	end

	return slot0.red_status_list[slot1]
end

function TaskModel.updateActivityData(slot0, slot1)
	slot0.activity_data = {}

	for slot5, slot6 in ipairs(slot1) do
		slot0.activity_data[slot6.activity] = true
	end

	slot0:checkQuestAndFeatStatus(TaskConst.update_type.activity)
	GlobalEvent:getInstance():Fire(TaskEvent.UpdateActivityInfo, slot0.activity_data)
end

function TaskModel.updateSingleActivityData(slot0, slot1)
	if slot0.activity_data == nil then
		slot0.activity_data = {}
	end

	slot0.activity_data[slot1] = true

	slot0:checkQuestAndFeatStatus(TaskConst.update_type.activity)
	GlobalEvent:getInstance():Fire(TaskEvent.UpdateActivityInfo, slot0.activity_data)
end

function TaskModel.getActivityData(slot0)
	return slot0.activity_data
end

function TaskModel.addTaskList(slot0, slot1, slot2, slot3)
	slot4, slot5 = nil
	slot6 = false
	slot7 = {}

	if slot3 == true then
		slot0.task_list = {}
	end

	for slot11, slot12 in ipairs(slot1) do
		if Config.QuestData.data_get[slot12.id] ~= nil then
			if slot0.task_list[slot12.id] == nil then
				slot0.task_list[slot12.id] = TaskVo.New(slot12.id, TaskConst.type.quest)
				slot6 = true
			elseif slot12.finish == TRUE and slot2 == true then
				uv0(slot7, slot12.id)
			end

			slot0.task_list[slot12.id]:updateData(slot12)
		end
	end

	slot0:checkQuestAndFeatStatus(TaskConst.update_type.quest)
	GlobalEvent:getInstance():Fire(TaskEvent.UpdateTaskList, slot6, slot7)
end

function TaskModel.setTaskCompleted(slot0, slot1)
	if slot0.task_list[slot1] ~= nil then
		slot2:setCompletedStatus(TaskConst.task_status.completed)
		slot0:checkQuestAndFeatStatus(TaskConst.update_type.quest)
		GlobalEvent:getInstance():Fire(TaskEvent.UpdateTaskList, false)
	end
end

function TaskModel.getTaskList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.task_list) do
		uv0(slot1, slot6)
	end

	if next(slot1) then
		uv1(slot1, SortTools.tableLowerSorter({
			"finish_sort",
			"id"
		}))
	end

	return slot1
end

function TaskModel.getTaskById(slot0, slot1)
	return slot0.task_list[slot1]
end

function TaskModel.getFeatById(slot0, slot1)
	return slot0.feat_list[slot1]
end

function TaskModel.addFeatList(slot0, slot1, slot2, slot3)
	slot4, slot5 = nil
	slot6 = false
	slot7 = {}

	if slot3 == true then
		slot0.feat_list = {}
	end

	for slot11, slot12 in ipairs(slot1) do
		if Config.FeatData.data_get[slot12.id] ~= nil then
			if slot0.feat_list[slot12.id] == nil then
				slot0.feat_list[slot12.id] = TaskVo.New(slot12.id, TaskConst.type.feat)
				slot6 = true
			elseif slot12.finish == TRUE and slot2 == true then
				uv0(slot7, slot12.id)
			end

			slot0.feat_list[slot12.id]:updateData(slot12)
		end
	end

	slot0:checkQuestAndFeatStatus(TaskConst.update_type.feat)
	slot0:needUpdateFeat(slot6, slot7)
end

function TaskModel.setFeatCompleted(slot0, slot1)
	if slot0.feat_list[slot1] ~= nil then
		slot2:setCompletedStatus(TaskConst.task_status.completed)
		slot0:checkQuestAndFeatStatus(TaskConst.update_type.feat)
		slot0:needUpdateFeat(false)
	end
end

function TaskModel.needUpdateFeat(slot0, slot1, slot2)
	GlobalEvent:getInstance():Fire(TaskEvent.UpdateFeatList, slot2)
end

function TaskModel.getFeatList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.feat_list) do
		if slot6.finish ~= TaskConst.task_status.completed then
			uv0(slot1, slot6)
		end
	end

	if next(slot1) then
		uv1(slot1, SortTools.tableLowerSorter({
			"finish_sort",
			"id"
		}))
	end

	return slot1
end

function TaskModel.updateTaskExpList(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if slot2 == nil then
		slot0.dic_task_exp_data = {}
	end

	if slot1.feat_list then
		slot4 = {}
		slot5 = {}

		for slot9, slot10 in ipairs(slot1.feat_list) do
			if slot0.dic_task_exp_data[slot10.id] then
				for slot14, slot15 in pairs(slot10) do
					slot0.dic_task_exp_data[slot10.id][slot14] = slot15
				end
			elseif Config.RoomFeatData.data_exp_info[slot10.id] then
				slot16 = slot10.id
				slot0.dic_task_exp_data[slot10.id] = TaskVo.New(slot16, TaskConst.type.exp)

				for slot15, slot16 in pairs(slot10) do
					slot0.dic_task_exp_data[slot10.id][slot15] = slot16
				end
			end

			if slot2 and slot10.finish == TaskConst.task_status.finish and slot0.dic_task_exp_data[slot10.id] and slot0.dic_task_exp_data[slot10.id].config and (slot0.dic_task_exp_data[slot10.id].config.lev or 0) <= slot3.lev then
				if slot0.dic_task_exp_data[slot10.id].config.hide == 1 then
					uv0(slot5, slot10.id)
				else
					uv0(slot4, slot10.id)
				end
			end
		end

		if slot2 then
			if Config.RoomFeatData.data_const.experience_open_limit then
				if slot6.val <= slot3.lev then
					if next(slot4) ~= nil then
						GlobalEvent:getInstance():Fire(TaskEvent.TASK_EXP_FINISH_TIPS_EVENT, slot4)
					end

					if next(slot5) ~= nil then
						for slot10, slot11 in ipairs(slot5) do
							BattleResultMgr:getInstance():addShowData(BattleConst.Closed_Result_Type.TaskExpType, {
								id = slot11
							})
						end
					end
				end
			else
				if next(slot4) ~= nil then
					GlobalEvent:getInstance():Fire(TaskEvent.TASK_EXP_FINISH_TIPS_EVENT, slot4)
				end

				if next(slot5) ~= nil then
					for slot10, slot11 in ipairs(slot5) do
						BattleResultMgr:getInstance():addShowData(BattleConst.Closed_Result_Type.TaskExpType, {
							id = slot11
						})
					end
				end
			end
		end
	end

	if slot1.finish_list then
		for slot7, slot8 in ipairs(slot1.finish_list) do
			if Config.RoomFeatData.data_exp_info[slot8.id] then
				slot14 = slot8.id
				slot0.dic_task_exp_data[slot8.id] = TaskVo.New(slot14, TaskConst.type.exp)
				slot0.dic_task_exp_data[slot8.id].finish = TaskConst.task_status.completed

				for slot13, slot14 in pairs(slot8) do
					slot0.dic_task_exp_data[slot8.id][slot13] = slot14
				end
			end
		end
	end

	slot0:checkQuestAndFeatStatus(TaskConst.update_type.exp)
end

function TaskModel.getSaveAchieveData(slot0)
	if slot0.achieve_data then
		return slot0.achieve_data
	end

	return nil
end

function TaskModel.updateTaskExpDataByID(slot0, slot1, slot2)
	if slot0.dic_task_exp_data[slot1] then
		slot0.dic_task_exp_data[slot1].finish_time = slot2
		slot0.dic_task_exp_data[slot1].finish = TaskConst.task_status.completed

		slot0:checkQuestAndFeatStatus(TaskConst.update_type.exp)
	end
end

function TaskModel.getTaskExpList(slot0)
	return slot0.dic_task_exp_data or {}
end

function TaskModel.getTaskExpListById(slot0, slot1)
	if slot0.dic_task_exp_data then
		return slot0.dic_task_exp_data[slot1]
	end
end

function TaskModel.__delete(slot0)
end
