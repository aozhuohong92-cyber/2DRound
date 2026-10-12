TaskVo = TaskVo or BaseClass(EventDispatcher)

function TaskVo.__init(slot0, slot1, slot2)
	slot0.id = slot1
	slot0.type = slot2 or TaskConst.type.quest

	if slot0.type == TaskConst.type.quest then
		slot0.config = Config.QuestData.data_get[slot1]
	elseif slot0.type == TaskConst.type.feat then
		slot0.config = Config.FeatData.data_get[slot1]
	elseif slot0.type == TaskConst.type.exp then
		slot0.config = Config.RoomFeatData.data_exp_info[slot1]
	end

	slot0.finish = TaskConst.task_status.un_finish
	slot0.finish_sort = 0
end

function TaskVo.getTaskContent(slot0)
	return splitDataStr(slot0.config.desc)
end

function TaskVo.getTaskName(slot0)
	if slot0.config then
		return slot0.config.name or ""
	else
		return ""
	end
end

function TaskVo.setCompletedStatus(slot0, slot1)
	slot0.finish = slot1

	slot0:setFinishSort()
	slot0:dispatchUpdate()
end

function TaskVo.updateData(slot0, slot1)
	slot0.finish = slot1.finish
	slot0.progress = slot1.progress

	slot0:setFinishSort()
	slot0:dispatchUpdate()
end

function TaskVo.dispatchUpdate(slot0)
	slot0:Fire(TaskEvent.UpdateSingleQuest, slot0.id)
end

function TaskVo.setFinishSort(slot0)
	if slot0.finish == TaskConst.task_status.un_finish then
		slot0.finish_sort = 1
	elseif slot0.finish == TaskConst.task_status.finish then
		slot0.finish_sort = 0
	elseif slot0.finish == TaskConst.task_status.completed then
		slot0.finish_sort = 2
	else
		slot0.finish_sort = 3
	end
end

function TaskVo.__delete(slot0)
end
