TaskItem = class("TaskItem", function ()
	return ccui.Layout:create()
end)

function TaskItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("task/task_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.btn_img_res = PathTool.getResFrame("common", "common_1098")
	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.task_desc = slot0.container:getChildByName("task_desc")
	slot0.btn_container = slot0.container:getChildByName("btn_container")
	slot0.goto_btn = slot0.btn_container:getChildByName("goto_btn")
	slot0.goto_btn_label = slot0.goto_btn:getChildByName("label")

	slot0.goto_btn_label:setString(TI18N("前往"))

	slot0.progress = slot0.btn_container:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)

	slot0.value = slot0.btn_container:getChildByName("value")

	slot0.value:setString(string.format("%s/%s", 0, 0))

	slot0.completed_img = slot0.container:getChildByName("completed_img")
	slot0.goods_con = slot0.container:getChildByName("goods_con")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.goods_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.goods_con:getContentSize(), {
		start_y = 11,
		start_x = 0,
		space_x = 8.5,
		row = 1,
		space_y = 4,
		col = 0,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.item_list = {}

	slot0:registerEvent()
end

function TaskItem.registerEvent(slot0)
	slot0.goto_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data ~= nil and uv0.data.config ~= nil then
				if uv0.data.finish == TaskConst.task_status.un_finish then
					if uv0.data.progress ~= nil then
						for slot5, slot6 in ipairs(uv0.data.progress) do
							if slot6.finish == FALSE then
								TaskController:getInstance():handleTaskProgress(uv0.data, slot5)

								break
							end
						end
					end
				elseif uv0.data.finish == TaskConst.task_status.finish then
					if uv0.data.type == TaskConst.type.quest then
						TaskController:getInstance():requestSubmitTask(uv0.data.id)
					elseif uv0.data.type == TaskConst.type.feat then
						TaskController:getInstance():requestSubmitFeat(uv0.data.id)
					end
				end
			end
		end
	end)
	slot0:registerScriptHandler(function (slot0)
		if slot0 == "enter" then
			-- Nothing
		elseif slot0 == "exit" and uv0.data ~= nil then
			if uv0.update_self_event ~= nil then
				uv0.data:UnBind(uv0.update_self_event)

				uv0.update_self_event = nil
			end

			uv0.data = nil
		end
	end)
end

function TaskItem.setData(slot0, slot1)
	if slot0.data ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end

	slot0.data = slot1

	if slot0.update_self_event == nil then
		slot0.update_self_event = slot0.data:Bind(TaskEvent.UpdateSingleQuest, function ()
			uv0:updateSelf()
		end)
	end

	slot0:updateSelf()
	slot0:fillAwardsItems()
end

function TaskItem.fillAwardsItems(slot0)
	if slot0.data == nil or slot0.data.config == nil or slot0.data.config.commit_rewards == nil then
		return
	end

	slot1 = {}

	for slot5, slot6 in ipairs(slot0.data.config.commit_rewards) do
		if deepCopy(Config.ItemData.data_get_data(slot6[1])) then
			slot7.quantity = slot6[2]

			table.insert(slot1, slot7)
		end
	end

	if slot1 ~= nil and next(slot1) ~= nil and #slot1 <= 2 then
		slot0.item_scrollview:setClickEnabled(false)
	else
		slot0.item_scrollview:setClickEnabled(true)
	end

	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5.effect = false

			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
	slot0.item_scrollview:setData(slot1)
end

function TaskItem.updateSelf(slot0)
	if slot0.data == nil then
		return
	end

	slot0.id = slot0.data.id
	slot0.finish_sort = slot0.data.finish_sort

	slot0.completed_img:setVisible(slot0.data.finish == TaskConst.task_status.completed)
	slot0.btn_container:setVisible(slot0.data.finish ~= TaskConst.task_status.completed)

	slot1 = PathTool.getResFrame("common", "common_1098")
	slot2 = 167

	if slot0.data.finish == TaskConst.task_status.un_finish then
		slot0.goto_btn_label:setString(TI18N("前往"))
		slot0.goto_btn_label:enableOutline(cc.c4b(41, 74, 21, 255), 2)
	elseif slot0.data.finish == TaskConst.task_status.finish then
		slot0.goto_btn_label:setString(TI18N("提交"))

		slot1 = PathTool.getResFrame("common", "common_1027")

		slot0.goto_btn_label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
	end

	if slot0.btn_img_res ~= slot1 then
		slot0.btn_img_res = slot1

		slot0.goto_btn:loadTexture(slot1, LOADTEXT_TYPE_PLIST)
	end

	if slot0.data.finish ~= TaskConst.task_status.completed and slot0.data.progress ~= nil and slot0.data.progress[1] ~= nil then
		slot0.value:setString(string.format("%s/%s", MoneyTool.GetMoneyString(slot3.value), MoneyTool.GetMoneyString(slot3.target_val)))
		slot0.progress:setPercent(100 * slot3.value / slot3.target_val)
	end

	slot0.task_desc:setString(slot0.data:getTaskContent())
end

function TaskItem.suspendAllActions(slot0)
	if slot0.data ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end
end

function TaskItem.DeleteMe(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	slot0.item_list = nil

	if slot0.data ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
