slot0 = table.insert
ReturnActionTaskPanel = class("ReturnActionTaskPanel", function ()
	return ccui.Widget:create()
end)
slot2 = ReturnActionController:getInstance():getModel()
slot3 = Config.HolidayReturnNewData.data_constant
slot4 = string.format

function ReturnActionTaskPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:configUI()
	slot0:register_event()

	slot0.task_items = {}
	slot0.dic_task_list = {}
	slot0.dic_limit_list = {}
	slot0.limit_list = {}
	slot0.time_desc_list = {}
end

function ReturnActionTaskPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("returnaction/returnaction_task_panel"))

	slot0.root_wnd:setPosition(-40, -66)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot2 = slot1:getChildByName("title_con")

	slot2:getChildByName("label_time_key"):setString(TI18N("剩余时间:"))

	slot0.label_time = slot2:getChildByName("label_time")

	slot0.label_time:setString("")

	slot0.desc_txt = slot2:getChildByName("desc_txt")

	slot0.desc_txt:setPosition(cc.p(56, 56))

	slot0.icon = slot2:getChildByName("icon")
	slot0.icon_count = slot2:getChildByName("icon_count")

	slot0.icon_count:setString("")

	slot0.banner_spr = slot2:getChildByName("title_img")

	slot2:getChildByName("btn_rule"):setVisible(false)

	slot4 = slot1:getChildByName("goods_item")
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot4, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot4:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 4,
		space_x = 0,
		item_width = 694,
		item_height = 141,
		space_y = 3,
		col = 1,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(true)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createTeskCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfTeskCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateTeskCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0:setLoadBanner()
	uv0:sender27905()
end

function ReturnActionTaskPanel.createTeskCell(slot0)
	return ReturnActionTaskItem.new()
end

function ReturnActionTaskPanel.numberOfTeskCells(slot0)
	if not slot0.task_items then
		return 0
	end

	return #slot0.task_items
end

function ReturnActionTaskPanel.updateTeskCellByIndex(slot0, slot1, slot2)
	if not slot0.task_items then
		return
	end

	if not slot0.task_items[slot2] then
		return
	end

	slot4 = slot1:setData(slot3)
	slot0.time_desc_list[slot2] = slot4

	slot0:updateTimeByIndex(slot2, slot4)
end

function ReturnActionTaskPanel.setLoadBanner(slot0)
	slot2 = "txt_cn_returnaction2"
	slot3 = ""

	if uv0:getReturnActionData(slot0.holiday_bid) then
		slot2 = slot1.panel_res
		slot3 = slot1.tips
	end

	slot0.desc_txt:setString(slot3)

	if not slot0.load_banner then
		slot0.load_banner = loadSpriteTextureFromCDN(slot0.banner_spr, PathTool.getReturnActionRes(slot2), ResourcesType.single, slot0.load_banner)
	end
end

function ReturnActionTaskPanel.register_event(slot0)
	if not slot0.task_event then
		slot0.task_event = GlobalEvent:getInstance():Bind(ReturnActionEvent.Task_Event, function (slot0)
			if slot0 and uv0.label_time then
				setCountDownTime(uv0.label_time, slot0.endtime - GameNet:getInstance():getTime())
			end

			uv0:setConfigData(uv1:getActionTaskQuestList())
		end)
	end

	if not slot0.task_updata_event then
		slot0.task_updata_event = GlobalEvent:getInstance():Bind(ReturnActionEvent.Task_Updata_Event, function ()
			uv1:setConfigData(uv0:getActionTaskQuestList())
		end)
	end

	if not slot0.limin_task_event then
		slot0.limin_task_event = GlobalEvent:getInstance():Bind(ReturnActionEvent.Limin_Task_Event, function (slot0)
			if not slot0 then
				return
			end

			if Config.HolidayReturnNewData.data_task_fun(getNorKey(uv0:getActionPeriod(), slot0.id)) and uv1.dic_limit_list[slot3.f_id] then
				uv1.dic_limit_list[slot3.f_id].finish = TaskConst.task_status.completed
				uv1.dic_limit_list[slot3.f_id].sort = TaskConst.task_status.completed

				if Config.HolidayReturnNewData.data_lanterm_adventure_task_list[slot1][slot3.f_id][slot3.s_id + 1] then
					if Config.HolidayReturnNewData.data_task_fun(getNorKey(slot1, slot4[slot3.s_id + 1].id)) and uv1.dic_task_list[slot6.id] then
						uv1:setConfigData({
							uv1.dic_task_list[slot6.id]
						})
					else
						uv1:sortItemList()
					end
				else
					uv1:sortItemList()
				end
			end
		end)
	end
end

function ReturnActionTaskPanel.setConfigData(slot0, slot1)
	if not slot1 then
		return
	end

	for slot6, slot7 in ipairs(slot1) do
		slot0.dic_task_list[slot7.id] = slot7

		if Config.HolidayReturnNewData.data_task_fun(getNorKey(uv0:getActionPeriod(), slot7.id)) and slot7.finish ~= TaskConst.task_status.over then
			if slot0.dic_limit_list[slot9.f_id] == nil then
				slot10 = {}
				slot0.dic_limit_list[slot9.f_id] = slot10

				uv1(slot0.task_items, slot10)
			end

			slot11 = true

			if slot10.config then
				if slot10.config.s_id < slot9.s_id then
					if slot10.finish ~= TaskConst.task_status.completed then
						slot11 = false
					end
				elseif slot9.s_id < slot10.config.s_id and slot7.finish == TaskConst.task_status.completed then
					slot11 = false
				end
			end

			if slot11 then
				slot10.config = slot9
				slot10.id = slot9.f_id

				if slot7.finish == TaskConst.task_status.finish then
					slot10.sort = 0
				elseif slot7.finish == TaskConst.task_status.un_finish then
					slot10.sort = 1
				else
					slot10.sort = slot7.finish
				end

				slot10.finish = slot7.finish
				slot10.title = slot9.title
				slot10.desc = slot9.desc
				slot10.target_val = slot7.target_val
				slot10.value = slot7.value
				slot10.end_time = slot7.ref_time
				slot10.award = slot9.award
			end
		end
	end

	slot0:sortItemList()
end

function ReturnActionTaskPanel.sortItemList(slot0)
	table.sort(slot0.task_items, SortTools.tableLowerSorter({
		"sort",
		"id"
	}))
	slot0.item_scrollview:reloadData()
end

function ReturnActionTaskPanel.updateTimeByIndex(slot0, slot1, slot2)
	if slot0.task_items[slot1] and slot2 then
		if slot3.end_time - GameNet:getInstance():getTime() < 0 then
			slot4 = 0
		end

		slot2:setString(uv0("%s%s", TI18N("剩余"), TimeTool.getDayOrHour(slot4)))
	end
end

function ReturnActionTaskPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ReturnActionTaskPanel.DeleteMe(slot0)
	doStopAllActions(slot0.label_time)

	if slot0.task_event then
		GlobalEvent:getInstance():UnBind(slot0.task_event)

		slot0.task_event = nil
	end

	if slot0.task_updata_event then
		GlobalEvent:getInstance():UnBind(slot0.task_updata_event)

		slot0.task_updata_event = nil
	end

	if slot0.limin_task_event then
		GlobalEvent:getInstance():UnBind(slot0.limin_task_event)

		slot0.limin_task_event = nil
	end

	if slot0.load_banner then
		slot0.load_banner:DeleteMe()

		slot0.load_banner = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end
end

ReturnActionTaskItem = class("ReturnActionTaskItem", function ()
	return ccui.Widget:create()
end)

function ReturnActionTaskItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ReturnActionTaskItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("returnaction/returnaction_task_item"))

	slot0:setContentSize(cc.size(694, 141))
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.title_name = slot1:getChildByName("title_name")

	slot0.title_name:setString("")

	slot0.title_desc = slot1:getChildByName("title_desc")

	slot0.title_desc:setString("")

	slot0.time_lab = slot1:getChildByName("time_lab")

	slot0.time_lab:setString("")

	slot0.get_spr = slot1:getChildByName("get_spr")

	slot0.get_spr:setVisible(false)

	slot0.btn_goto = slot1:getChildByName("btn_goto")

	slot0.btn_goto:getChildByName("Text_8"):setString(TI18N("前往"))
	slot0.btn_goto:setVisible(false)

	slot0.btn_get = slot1:getChildByName("btn_get")

	slot0.btn_get:getChildByName("Text_8"):setString(TI18N("领取"))
	slot0.btn_get:setVisible(false)

	slot0.sign_item = BackPackItem.new(nil, true, nil, 0.9)

	slot1:addChild(slot0.sign_item)
	slot0.sign_item:setPosition(cc.p(71, 69))
	slot0.sign_item:setDefaultTip()
end

function ReturnActionTaskItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data and uv0.data.config then
			uv1:sender27907(uv0.data.config.id)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		if uv0.data and uv0.data.config and uv0.data.config.source_id then
			StrongerController:clickCallBack(uv0.data.config.source_id)
		end
	end, true, 1)
end

function ReturnActionTaskItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.title_name:setString(slot1.title)

	if slot0.time_lab then
		slot0.time_lab:setVisible(slot1.status ~= TaskConst.task_status.completed)
	end

	slot0.title_desc:setString(uv0("%s (%d/%d)", slot1.desc, slot1.value or 0, slot1.target_val or 0))

	if slot1.award and slot1.award[1] and slot0.sign_item then
		slot0.sign_item:setBaseData(slot1.award[1][1], slot1.award[1][2])
	end

	slot0.btn_goto:setVisible(slot1.finish == 0)
	slot0.btn_get:setVisible(slot1.finish == 1)
	slot0.get_spr:setVisible(slot1.finish == 2)

	return slot0.time_lab
end

function ReturnActionTaskItem.DeleteMe(slot0)
	if slot0.sign_item then
		slot0.sign_item:DeleteMe()

		slot0.sign_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
