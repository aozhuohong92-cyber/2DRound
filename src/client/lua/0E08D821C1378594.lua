TaskPanel = class("TaskPanel", function ()
	return ccui.Layout:create()
end)

function TaskPanel.ctor(slot0, slot1)
	slot0.ctrl = slot1
	slot0.model = slot0.ctrl:getModel()
	slot0.awards_list = {}
	slot0.box_list = {
		109,
		108,
		108,
		110
	}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("task/task_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot2 = slot0.container:getChildByName("activity_container")
	slot0.progress = slot2:getChildByName("progress_container"):getChildByName("progress")

	slot0.progress:setScale9Enabled(true)

	slot0.value = slot2:getChildByName("value")

	slot0.value:setString("100/200")

	slot4 = nil

	for slot8 = 1, Config.ActivityData.data_get_length do
		if slot2:getChildByName("awards_" .. slot8) ~= nil then
			slot9.effect_container = slot9:getChildByName("effect_container")
			slot9.target_value = slot9:getChildByName("target_value")
			slot9.is_show_tips = true
			slot9.status = TaskConst.action_status.normal

			if Config.ActivityData.data_get[slot8] ~= nil then
				slot9.config = Config.ActivityData.data_get[slot8]

				slot9.target_value:setString(slot9.config.activity)
			end

			slot0.awards_list[slot8] = slot9
		end
	end

	slot0.quest_container = slot0.container:getChildByName("quest_container")
	slot0.size = slot0.quest_container:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.quest_container, cc.p(0, 10), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot0.size.width, slot0.size.height - 20), {
		start_y = 0,
		item_width = 616,
		start_x = 8,
		space_x = 0,
		row = 1,
		item_height = 121,
		space_y = 4,
		col = 1,
		need_dynamic = true,
		item_class = TaskItem
	})

	slot0:registerEvent()
end

function TaskPanel.registerEvent(slot0)
	for slot4, slot5 in ipairs(slot0.awards_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended and slot0.config ~= nil then
				if slot0.is_show_tips == true then
					CommonAlert.showItemApply(TI18N("当前活跃度奖励"), slot0.config.rewards, nil, TI18N("确定"), nil, nil, TI18N("奖励"), nil, nil, true, nil, nil, {
						off_y = 50
					})
				elseif uv0.role_vo and slot0.config.activity <= uv0.role_vo.activity then
					uv0.ctrl:requestGetActivityAwards(slot0.config.activity)
				end
			end
		end)
	end
end

function TaskPanel.addToParent(slot0, slot1)
	slot0:setVisible(slot1)
	slot0:handleDynamicEvent(slot1)

	if slot1 == true then
		slot0.ctrl:requestActivityInfo()
		slot0:updateActivity(false)
		slot0:updateTaskList(true)
	end
end

function TaskPanel.handleDynamicEvent(slot0, slot1)
	if not slot1 then
		if slot0.role_assets_event ~= nil then
			if slot0.role_vo ~= nil then
				slot0.role_vo:UnBind(slot0.role_assets_event)
			end

			slot0.role_assets_event = nil
		end

		if slot0.update_activity_event ~= nil then
			GlobalEvent:getInstance():UnBind(slot0.update_activity_event)

			slot0.update_activity_event = nil
		end

		if slot0.update_task_list ~= nil then
			GlobalEvent:getInstance():UnBind(slot0.update_task_list)

			slot0.update_task_list = nil
		end
	else
		if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
			slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
				if slot0 == "activity" then
					uv0:updateActivity(true)
				end
			end)
		end

		if slot0.update_activity_event == nil then
			slot0.update_activity_event = GlobalEvent:getInstance():Bind(TaskEvent.UpdateActivityInfo, function (slot0)
				uv0:updateActivityData(slot0)
			end)
		end

		if slot0.update_task_list == nil then
			slot0.update_task_list = GlobalEvent:getInstance():Bind(TaskEvent.UpdateTaskList, function (slot0)
				uv0:updateTaskList(slot0)
			end)
		end
	end
end

function TaskPanel.updateActivity(slot0, slot1)
	if slot0.role_vo ~= nil then
		slot3 = 100

		if Config.ActivityData.data_get[Config.ActivityData.data_get_length] ~= nil then
			slot3 = slot2.activity
		end

		slot0.value:setString(slot0.role_vo.activity .. "/" .. slot3)
		slot0.progress:setPercent(slot0.role_vo.activity / slot3 * 100)

		if slot1 == true then
			slot0:updateActivityData(slot0.model:getActivityData())
		end
	end
end

function TaskPanel.updateActivityData(slot0, slot1)
	if slot0.role_vo == nil then
		return
	end

	slot2 = slot1

	for slot7, slot8 in ipairs(slot0.awards_list) do
		if slot8 and slot8.config and not tolua.isnull(slot8.effect_container) then
			if (function (slot0)
				if uv0 == nil then
					return false
				end

				return uv0[slot0]
			end)(slot8.config.activity) == true then
				slot8.is_show_tips = true
				slot8.status = TaskConst.action_status.finish
			elseif slot8.config.activity <= slot0.role_vo.activity then
				slot8.is_show_tips = false
				slot8.status = TaskConst.action_status.activity
			else
				slot8.is_show_tips = true
				slot8.status = TaskConst.action_status.un_activity
			end

			slot9 = PlayerAction.action_1

			if slot8.status == TaskConst.action_status.finish then
				slot9 = PlayerAction.action_3
			elseif slot8.status == TaskConst.action_status.activity then
				slot9 = PlayerAction.action_2
			end

			if not tolua.isnull(slot8.effect_container.box) then
				if slot8.box_action ~= slot9 then
					if slot8.effect_container.box.setAnimation then
						slot8.effect_container.box:clearTracks()
						slot8.effect_container.box:setToSetupPose()
						slot8.effect_container.box:setAnimation(0, slot9, true)
					end

					slot8.box_action = slot9
				end
			else
				delayRun(slot0.container, 2 * slot7 / display.DEFAULT_FPS, function ()
					slot1 = createEffectSpine(PathTool.getEffectRes(uv0.box_list[uv1]), cc.p(uv2.effect_container:getContentSize().width * 0.5, 3), cc.p(0.5, 0), true, uv3)

					uv2.effect_container:addChild(slot1)

					uv2.effect_container.box = slot1
					uv2.box_action = uv3
				end)
			end
		end
	end
end

function TaskPanel.updateTaskList(slot0, slot1)
	if slot1 == true then
		slot0.item_scrollview:setData(slot0.model:getTaskList())
	else
		slot0.item_scrollview:resetPosition(SortTools.tableLowerSorter({
			"finish_sort",
			"id"
		}))
	end
end

function TaskPanel.DeleteMe(slot0)
	doStopAllActions(slot0.container)
	slot0:handleDynamicEvent(false)

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end
end
