OrderActionTeskPanel1 = class("OrderActionTeskPanel1", function ()
	return ccui.Widget:create()
end)
slot0 = table.insert
slot2 = OrderActionController:getInstance():getModel()
slot3 = string.format
slot4 = {
	TI18N("每日任务"),
	TI18N("每周挑战"),
	TI18N("终极试炼")
}

function OrderActionTeskPanel1.ctor(slot0, slot1)
	slot0.cur_period = slot1 or 1
	slot0.cur_task_index = nil

	slot0:layoutUI()
	slot0:registerEvents()
end

function OrderActionTeskPanel1.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("orderaction/tesk_panel1"))

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(651, 558))

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot6 = cc.p(0, 0.5)
	slot0.time_desc = createRichLabel(22, OrderActionConstants.ColorConst[9], slot6, cc.p(5, -30), nil, , 400)

	slot1:addChild(slot0.time_desc)

	slot0.tab_view_list = {}

	for slot6 = 1, 3 do
		slot7 = {
			btn_view = slot1:getChildByName("tab_view"):getChildByName("tab_task_" .. slot6)
		}
		slot7.normal = slot7.btn_view:getChildByName("normal")
		slot7.select = slot7.btn_view:getChildByName("select")

		slot7.select:setVisible(false)

		slot7.title_name = slot7.btn_view:getChildByName("title_name")

		slot7.title_name:setString(uv0[slot6])

		slot7.redpoint = slot7.btn_view:getChildByName("redpoint")

		slot7.redpoint:setVisible(false)

		slot0.tab_view_list[slot6] = slot7
	end

	slot3 = slot1:getChildByName("task_item")
	slot0.task_goods_item = CommonScrollViewSingleLayout.new(slot3, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 635,
		item_height = 116,
		space_y = 0,
		col = 1,
		need_dynamic = true
	})

	slot0.task_goods_item:setSwallowTouches(true)
	slot0.task_goods_item:registerScriptHandlerSingle(handler(slot0, slot0.createTaskCell), ScrollViewFuncType.CreateNewCell)
	slot0.task_goods_item:registerScriptHandlerSingle(handler(slot0, slot0.numberOfTaskCells), ScrollViewFuncType.NumberOfCells)
	slot0.task_goods_item:registerScriptHandlerSingle(handler(slot0, slot0.updateTaskCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0:setTabRedPoint()
	slot0:tabChargeTaskView(1)
end

function OrderActionTeskPanel1.createTaskCell(slot0)
	return OrderActionTeskItem1.new()
end

function OrderActionTeskPanel1.numberOfTaskCells(slot0)
	if not slot0.task_list then
		return 0
	end

	return #slot0.task_list
end

function OrderActionTeskPanel1.updateTaskCellByIndex(slot0, slot1, slot2)
	if not slot0.task_list then
		return
	end

	if not slot0.task_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function OrderActionTeskPanel1.tabChargeTaskView(slot0, slot1)
	if slot0.cur_task_index == (slot1 or 1) then
		return
	end

	if slot0.cur_tab_view ~= nil then
		slot0.cur_tab_view.select:setVisible(false)
	end

	slot0.cur_task_index = slot1
	slot0.cur_tab_view = slot0.tab_view_list[slot1]

	if slot0.cur_tab_view ~= nil then
		slot0.cur_tab_view.select:setVisible(true)
	end

	slot0:setTaskGetStatus()
end

function OrderActionTeskPanel1.setTaskGetStatus(slot0)
	slot3 = 0

	if slot0:setTaskData(slot0.cur_period, uv0:getCurDay(), slot0.cur_task_index) then
		slot0.task_list = {}

		for slot7, slot8 in pairs(slot2) do
			slot8.tab_index = slot0.cur_task_index

			if uv0:getInitTaskData(slot8.goal_id) then
				slot8.status = slot9.finish
				slot8.value = slot9.value
				slot8.target_val = slot9.target_val

				if slot3 == 0 then
					slot3 = slot9.end_time - GameNet:getInstance():getTime()
				end
			end

			uv1(slot0.task_list, slot8)
		end

		uv0:sortTeskItemList(slot0.task_list)
		slot0.task_goods_item:reloadData()
	end

	commonCountDownTime(slot0.time_desc, slot3, {
		label_type = CommonAlert.type.rich,
		time_title = TI18N("刷新时间:"),
		time_color = "#249003"
	})
end

function OrderActionTeskPanel1.setTaskData(slot0, slot1, slot2, slot3)
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

function OrderActionTeskPanel1.registerEvents(slot0)
	if not slot0.update_taskget_event then
		slot0.update_taskget_event = GlobalEvent:getInstance():Bind(OrderActionEvent.OrderAction_TaskGet_Event, function ()
			uv0:setTaskGetStatus()
			uv0:setTabRedPoint()
		end)
	end

	for slot4, slot5 in pairs(slot0.tab_view_list) do
		registerButtonEventListener(slot5.btn_view, function ()
			uv0:tabChargeTaskView(uv1)
		end, false, 1)
	end
end

function OrderActionTeskPanel1.setTabRedPoint(slot0)
	for slot5 = 1, 3 do
		if slot0:setTaskData(slot0.cur_period, uv0:getCurDay(), slot5) then
			slot7 = false

			for slot11, slot12 in pairs(slot6) do
				if uv0:getInitTaskData(slot12.goal_id) and slot13.finish == 1 then
					slot7 = true

					break
				end
			end

			slot0.tab_view_list[slot5].redpoint:setVisible(slot7)
		end
	end
end

function OrderActionTeskPanel1.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function OrderActionTeskPanel1.DeleteMe(slot0)
	if slot0.update_taskget_event then
		GlobalEvent:getInstance():UnBind(slot0.update_taskget_event)

		slot0.update_taskget_event = nil
	end

	doStopAllActions(slot0.time_desc)

	if slot0.task_goods_item then
		slot0.task_goods_item:DeleteMe()

		slot0.task_goods_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

OrderActionTeskItem1 = class("OrderActionTeskItem1", function ()
	return ccui.Widget:create()
end)
slot5 = {
	TI18N("每日"),
	TI18N("每周"),
	TI18N("每月")
}

function OrderActionTeskItem1.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function OrderActionTeskItem1.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("orderaction/tesk_item1"))

	slot0:setContentSize(cc.size(635, 116))
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
		slot0.task_reward = BackPackItem.new(nil, true, nil, 0.7)

		slot1:addChild(slot0.task_reward)
		slot0.task_reward:setPosition(cc.p(59, 57))
		slot0.task_reward:setDefaultTip()
	end
end

function OrderActionTeskItem1.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data and uv0.data.goal_id then
			uv1:send25302(uv0.data.goal_id)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		if uv0.data and uv0.data.show_icon ~= "" then
			StrongerController:getInstance():clickCallBack(uv0.data.show_icon)
		end
	end, true, 1)
end

function OrderActionTeskItem1.setData(slot0, slot1)
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

function OrderActionTeskItem1.DeleteMe(slot0)
	if slot0.task_reward then
		slot0.task_reward:DeleteMe()

		slot0.task_reward = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
