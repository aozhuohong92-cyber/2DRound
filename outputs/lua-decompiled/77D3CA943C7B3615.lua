NewOrderActionTaskPanel = class("NewOrderActionTaskPanel", function ()
	return ccui.Widget:create()
end)
slot0 = table.insert
slot2 = NeworderactionController:getInstance():getModel()
slot3 = string.format

function NewOrderActionTaskPanel.ctor(slot0, slot1)
	slot0.cur_period = slot1 or 1
	slot0.cur_task_index = nil

	slot0:layoutUI()
	slot0:registerEvents()
end

function NewOrderActionTaskPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("neworderaction/task_panel"))

	slot0:setAnchorPoint(cc.p(0, 0))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(720, 661))

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("task_item")
	slot0.task_goods_item = CommonScrollViewSingleLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 720,
		item_height = 139,
		space_y = 0,
		col = 1,
		need_dynamic = true
	})

	slot0.task_goods_item:setSwallowTouches(true)
	slot0.task_goods_item:registerScriptHandlerSingle(handler(slot0, slot0.createTaskCell), ScrollViewFuncType.CreateNewCell)
	slot0.task_goods_item:registerScriptHandlerSingle(handler(slot0, slot0.numberOfTaskCells), ScrollViewFuncType.NumberOfCells)
	slot0.task_goods_item:registerScriptHandlerSingle(handler(slot0, slot0.updateTaskCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function NewOrderActionTaskPanel.createTaskCell(slot0)
	return NewOrderActionTaskItem.new()
end

function NewOrderActionTaskPanel.numberOfTaskCells(slot0)
	if not slot0.task_list then
		return 0
	end

	return #slot0.task_list
end

function NewOrderActionTaskPanel.updateTaskCellByIndex(slot0, slot1, slot2)
	if not slot0.task_list then
		return
	end

	if not slot0.task_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function NewOrderActionTaskPanel.tabChargeTaskView(slot0, slot1)
	if slot0.cur_task_index == (slot1 or 1) then
		return
	end

	slot0.cur_task_index = slot1

	slot0:setTaskGetStatus()
end

function NewOrderActionTaskPanel.setTaskGetStatus(slot0)
	slot3 = 0

	if slot0:setTaskData(slot0.cur_period, uv0:getCurDay(), slot0.cur_task_index) then
		slot0.task_list = {}

		for slot7, slot8 in pairs(slot2) do
			slot8.tab_index = slot0.cur_task_index

			if uv0:getInitTaskData(slot8.goal_id) then
				slot8.status = slot9.finish
				slot8.value = slot9.value
				slot8.target_val = slot9.target_val
			end

			uv1(slot0.task_list, slot8)
		end

		uv0:sortTaskItemList(slot0.task_list)
		slot0.task_goods_item:reloadData()
	end
end

function NewOrderActionTaskPanel.setTaskData(slot0, slot1, slot2, slot3)
	slot4 = nil

	if uv0:getTaskInduct(slot3 or 1) then
		slot4 = slot5
	else
		uv0:setTaskInduct(slot1, slot2, slot3)

		if uv0:getTaskInduct(slot3) then
			slot4 = slot6
		end
	end

	return slot4
end

function NewOrderActionTaskPanel.registerEvents(slot0)
	if not slot0.update_taskget_event then
		slot0.update_taskget_event = GlobalEvent:getInstance():Bind(NeworderactionEvent.OrderAction_TaskGet_Event, function ()
			uv0:setTaskGetStatus()
		end)
	end
end

function NewOrderActionTaskPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function NewOrderActionTaskPanel.DeleteMe(slot0)
	if slot0.update_taskget_event then
		GlobalEvent:getInstance():UnBind(slot0.update_taskget_event)

		slot0.update_taskget_event = nil
	end

	if slot0.task_goods_item then
		slot0.task_goods_item:DeleteMe()

		slot0.task_goods_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

NewOrderActionTaskItem = class("NewOrderActionTaskItem", function ()
	return ccui.Widget:create()
end)
slot4 = {
	TI18N("每日"),
	TI18N("每周")
}

function NewOrderActionTaskItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function NewOrderActionTaskItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("neworderaction/task_item"))

	slot0:setContentSize(cc.size(720, 139))
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.btn_goto = slot1:getChildByName("btn_goto")

	slot0.btn_goto:getChildByName("Text_3"):setString(TI18N("前往"))
	slot0.btn_goto:setVisible(false)

	slot0.btn_get = slot1:getChildByName("btn_get")

	slot0.btn_get:getChildByName("Text_3"):setString(TI18N("领取"))
	slot0.btn_get:setVisible(false)

	slot0.spr_get = slot1:getChildByName("spr_get")

	slot0.spr_get:setVisible(false)

	slot0.big_title_head = slot1:getChildByName("big_title_head")

	slot0.big_title_head:setString("")

	slot0.big_title = slot1:getChildByName("big_title")

	slot0.big_title:setString("")

	slot0.small_title = slot1:getChildByName("small_title")

	slot0.small_title:setString("")

	if not slot0.task_reward then
		slot0.task_reward = BackPackItem.new(nil, true, nil, 0.8)

		slot1:addChild(slot0.task_reward)
		slot0.task_reward:setPosition(cc.p(59, 70))
		slot0.task_reward:setDefaultTip()
	end
end

function NewOrderActionTaskItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data and uv0.data.goal_id then
			uv1:send28702(uv0.data.goal_id)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		if uv0.data and uv0.data.show_icon ~= "" then
			StrongerController:getInstance():clickCallBack(uv0.data.show_icon)
		end
	end, true, 1)
end

function NewOrderActionTaskItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot0.task_reward and slot1.award and slot1.award[1] then
		slot0.task_reward:setBaseData(slot1.award[1][1], slot1.award[1][2])
	end

	if slot1.tab_index then
		slot0.big_title_head:setString("【" .. uv0[slot1.tab_index] .. "】")
	end

	slot0.big_title:setString(slot1.title or "")
	slot0.small_title:setString(uv1("%s (%s/%s)", slot1.desc or "", MoneyTool.GetMoneyString(slot1.value or 0), MoneyTool.GetMoneyString(slot1.target_val or 0)))
	slot0.btn_goto:setVisible(slot1.status == 0)
	slot0.btn_get:setVisible(slot1.status == 1)
	slot0.spr_get:setVisible(slot1.status == 2)
end

function NewOrderActionTaskItem.DeleteMe(slot0)
	if slot0.task_reward then
		slot0.task_reward:DeleteMe()

		slot0.task_reward = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
