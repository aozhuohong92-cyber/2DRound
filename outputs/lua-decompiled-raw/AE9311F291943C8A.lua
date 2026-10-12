TaskExpPanel = class("TaskExpPanel", function ()
	return ccui.Layout:create()
end)
slot1 = TaskController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function TaskExpPanel.ctor(slot0)
	slot0.exp_type_list = {
		TaskConst.exp_type.total,
		TaskConst.exp_type.pvp,
		TaskConst.exp_type.common,
		TaskConst.exp_type.special
	}
	slot0.tab_list = {}
	slot0.dic_max_count = {}

	for slot4, slot5 in pairs(slot0.exp_type_list) do
		slot0.dic_max_count[slot5] = 0
	end

	if Config.RoomFeatData.data_type_list then
		for slot5, slot6 in pairs(slot1) do
			slot0.dic_max_count[slot5] = #slot6
		end

		for slot6, slot7 in pairs(slot0.dic_max_count) do
			slot2 = 0 + slot7
		end

		slot0.dic_max_count[TaskConst.exp_type.total] = slot2
	end

	slot0:configUI()
	slot0:registerEvent()
end

function TaskExpPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("task/task_exp_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.tab_btn = slot0.container:getChildByName("tab_btn")
	slot1 = {
		TI18N("总览"),
		TI18N("竞技历练"),
		TI18N("战斗历练"),
		TI18N("特殊历练")
	}
	slot3 = PathTool.getResFrame("taskexp", "task_exp_08")

	for slot7 = 1, 4 do
		slot8 = {
			btn = slot9,
			exp_type = slot0.exp_type_list[slot7],
			select_bg = slot9:getChildByName("select_img")
		}
		slot9 = slot0.container:getChildByName("tab_btn"):getChildByName("tab_btn_" .. slot7)

		slot8.select_bg:setVisible(false)

		slot8.title = slot9:getChildByName("label")

		if slot1[slot7] then
			slot8.title:setString(slot1[slot7])
		end

		slot10 = slot9:getChildByName("bar_node")
		slot8.progress = cc.ProgressTimer:create(createSprite(slot3, 0, 0, nil, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST))

		slot8.progress:setType(cc.PROGRESS_TIMER_TYPE_RADIAL)
		slot10:addChild(slot8.progress)
		slot10:setScale(-1, 1)
		slot8.progress:setPercentage(slot7 * 25)

		slot8.per_label = slot9:getChildByName("per_label")

		slot8.per_label:setString(slot7 * 25 .. "%")

		slot0.tab_list[slot7] = slot8
	end

	slot0.exp_container = slot0.container:getChildByName("exp_container")
end

function TaskExpPanel.registerEvent(slot0)
	for slot4, slot5 in ipairs(slot0.tab_list) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:changeTabType(uv1.exp_type)
		end, false, 1)
	end

	if slot0.task_exp_update_event == nil then
		slot0.task_exp_update_event = GlobalEvent:getInstance():Bind(TaskEvent.TASK_EXP_UPDATE_EVENT, function ()
			uv0:updateExpList(true)
		end)
	end

	if slot0.task_exp_update_time_event == nil then
		slot0.task_exp_update_time_event = GlobalEvent:getInstance():Bind(TaskEvent.TASK_EXP_UPDATE_TINE_EVENT, function ()
			uv0:updateProgressInfo()
			uv0:updateExpList(true)
		end)
	end
end

function TaskExpPanel.changeTabType(slot0, slot1, slot2)
	if not slot2 and slot0.select_exp_type and slot0.select_exp_type == slot1 then
		return
	end

	for slot6, slot7 in ipairs(slot0.tab_list) do
		if slot7.exp_type == slot1 then
			slot7.select_bg:setVisible(true)
		else
			slot7.select_bg:setVisible(false)
		end
	end

	slot0.select_exp_type = slot1

	slot0:updateExpList()
end

function TaskExpPanel.updateProgressInfo(slot0)
	slot2 = {}

	for slot6, slot7 in pairs(uv0:getTaskExpList()) do
		if slot7.finish == TaskConst.task_status.completed then
			if slot2[slot7.config.type] == nil then
				slot2[slot7.config.type] = 1
			else
				slot2[slot7.config.type] = slot2[slot7.config.type] + 1
			end
		end
	end

	for slot7, slot8 in pairs(slot2) do
		slot3 = 0 + slot8
	end

	slot2[TaskConst.exp_type.total] = slot3

	for slot7, slot8 in pairs(slot0.tab_list) do
		slot9 = slot2[slot8.exp_type] or 0

		if (slot0.dic_max_count[slot8.exp_type] or 0) == 0 then
			slot8.progress:setPercentage(100)
			slot8.per_label:setString("100%")
		else
			if slot9 * 100 / slot10 > 100 then
				slot11 = 100
			end

			slot8.progress:setPercentage(slot11)
			slot8.per_label:setString(math.floor(slot11) .. "%")
		end
	end
end

function TaskExpPanel.updateExpList(slot0, slot1)
	if not slot0.select_exp_type then
		return
	end

	if not slot0.list_view then
		slot4 = slot0.exp_container:getContentSize()
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.exp_container, cc.p(slot4.width * 0.5, slot4.height * 0.5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(628, 608), {
			start_y = 4,
			start_x = 0,
			delay = 1,
			space_x = 0,
			item_width = 628,
			item_height = 140,
			space_y = 0,
			col = 1,
			need_dynamic = true
		}, cc.p(0.5, 0.5))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.show_list = {}

	for slot6, slot7 in pairs(uv0:getTaskExpList()) do
		if slot7.config and (slot0.select_exp_type == TaskConst.exp_type.total or slot0.select_exp_type == slot7.config.type) then
			if slot7.finish == TaskConst.task_status.un_finish then
				slot7.sort = 2

				if slot7.config.hide == FALSE then
					uv1(slot0.show_list, slot7)
				end
			elseif slot7.finish == TaskConst.task_status.finish then
				slot7.sort = 1

				uv1(slot0.show_list, slot7)
			else
				slot7.sort = 3

				uv1(slot0.show_list, slot7)
			end
		end
	end

	uv2(slot0.show_list, SortTools.tableCommonSorter({
		{
			"sort",
			false
		},
		{
			"id",
			false
		}
	}))
	slot0.list_view:reloadData(nil, , slot1)

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.exp_container, true)
	else
		commonShowEmptyIcon(slot0.exp_container, false)
	end
end

function TaskExpPanel.createNewCell(slot0, slot1, slot2)
	return taskExpItem.new(slot1, slot2)
end

function TaskExpPanel.numberOfCells(slot0)
	return #slot0.show_list
end

function TaskExpPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.show_list[slot2] then
		slot1:setData(slot3)
	end
end

function TaskExpPanel.addToParent(slot0, slot1)
	slot0:setVisible(slot1)
	slot0:updateProgressInfo()
	slot0:changeTabType(TaskConst.exp_type.total, true)

	if slot1 == true then
		-- Nothing
	end
end

function TaskExpPanel.DeleteMe(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.task_exp_update_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.task_exp_update_event)

		slot0.task_exp_update_event = nil
	end

	if slot0.task_exp_update_time_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.task_exp_update_time_event)

		slot0.task_exp_update_time_event = nil
	end
end

taskExpItem = class("taskExpItem", function ()
	return ccui.Widget:create()
end)

function taskExpItem.ctor(slot0, slot1, slot2)
	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function taskExpItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("task/task_exp_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot4 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot4
	slot0.comfirm_btn = slot4:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("领取"))
	slot0.comfirm_btn:getChildByName("label"):enableOutline(cc.c4b(2, 0, 25, 255), 2)

	slot0.share_btn = slot4:getChildByName("share_btn")

	slot0.share_btn:getChildByName("label"):setString(TI18N("分享"))
	UITool.SetTitleColor(slot0.share_btn:getChildByName("label"))

	slot0.pic_has = slot4:getChildByName("pic_has")
	slot0.title = slot4:getChildByName("title")
	slot0.recrod_time_bg = slot4:getChildByName("recrod_time_bg")
	slot8 = "recrod_time"
	slot0.recrod_time = slot4:getChildByName(slot8)

	UITool.SetLightColor(slot0.recrod_time)

	slot0.item_list = {}

	for slot8 = 1, 2 do
		slot0.item_list[slot8] = BackPackItem.new(false, true, false, 0.6, false, true, true)

		slot4:getChildByName("item_node_" .. slot8):addChild(slot0.item_list[slot8])
	end

	slot0.task_desc = createRichLabel(20, cc.c4b(144, 93, 59, 255), cc.p(0, 1), cc.p(26, 85), nil, , 270)

	slot4:addChild(slot0.task_desc)
end

function taskExpItem.register_event(slot0)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onClickComfirmBtn()
	end, true, 1)
	registerButtonEventListener(slot0.share_btn, function (slot0, slot1, slot2)
		uv0:onClickShareBtn(slot1)
	end, true, 1)
end

function taskExpItem.onClickComfirmBtn(slot0)
	if not slot0.data then
		return
	end

	uv0:sender25812(slot0.data.id)
end

function taskExpItem.onClickShareBtn(slot0, slot1)
	if not slot0.data then
		return
	end

	if not slot0.data.config then
		return
	end

	uv0:openTaskSharePanel(true, {
		world_pos = slot1:convertToWorldSpace(cc.p(0.5, 0.5)),
		callback = function (slot0)
			uv0:shareCallback(slot0)
		end
	})
end

function taskExpItem.shareCallback(slot0, slot1)
	if not slot0.data then
		return
	end

	if not slot0.data.config then
		return
	end

	if slot1 == VedioConst.Share_Btn_Type.eWorldBtn then
		RoleController:getInstance():send25817(slot0.data.config.id, ChatConst.Channel.World)
	elseif slot1 == VedioConst.Share_Btn_Type.eGuildBtn then
		RoleController:getInstance():send25817(slot0.data.config.id, ChatConst.Channel.Gang)
	elseif slot1 == VedioConst.Share_Btn_Type.eCrossBtn then
		RoleController:getInstance():send25817(slot0.data.config.id, ChatConst.Channel.Cross)
	end
end

function taskExpItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function taskExpItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot0.data.config then
		slot0.title:setString(slot0.data.config.name)
		slot0.task_desc:setString(slot0.data.config.desc)

		slot2 = slot0.data.config.commit_rewards

		for slot6 = 1, 2 do
			if slot0.item_list[slot6] then
				if slot2[slot6] then
					slot0.item_list[slot6]:setVisible(true)
					slot0.item_list[slot6]:setBaseData(slot2[slot6][1], slot2[slot6][2])
				else
					slot0.item_list[slot6]:setVisible(false)
				end
			end
		end
	end

	if slot1.finish then
		if slot1.finish == TaskConst.task_status.finish then
			slot0:updateFinish()
		elseif slot1.finish == TaskConst.task_status.un_finish then
			slot0:updateUnFinish()
		else
			slot0:updateAllFinish()
		end
	end
end

function taskExpItem.updateFinish(slot0)
	slot0.share_btn:setVisible(false)
	slot0.pic_has:setVisible(false)
	slot0.comfirm_btn:setVisible(true)
	slot0:showProgress(false)
	slot0.recrod_time:setVisible(false)
	slot0.recrod_time_bg:setVisible(false)
end

function taskExpItem.updateUnFinish(slot0)
	slot0.share_btn:setVisible(false)
	slot0.pic_has:setVisible(false)
	slot0.comfirm_btn:setVisible(false)
	slot0.recrod_time:setVisible(false)
	slot0.recrod_time_bg:setVisible(false)

	slot1 = 0
	slot2 = 0

	if slot0.data.progress[1] then
		slot1 = slot0.data.progress[1].target_val
		slot2 = slot0.data.progress[1].value
	end

	slot0:showProgress(true, slot2 * 100 / slot1, uv0("(%s/%s)", MoneyTool.GetMoneyString(slot2), MoneyTool.GetMoneyString(slot1)))
end

function taskExpItem.updateAllFinish(slot0)
	slot0.share_btn:setVisible(true)
	slot0.pic_has:setVisible(true)
	slot0.comfirm_btn:setVisible(false)
	slot0:showProgress(false)
	slot0.recrod_time:setVisible(true)
	slot0.recrod_time_bg:setVisible(true)
	slot0.recrod_time:setString(TimeTool.getYMD3(slot0.data.finish_time or 0))
end

function taskExpItem.showProgress(slot0, slot1, slot2, slot3)
	if slot1 then
		if slot0.comp_bar == nil then
			slot0.comp_bar_bg, slot0.comp_bar = createLoadingBar(PathTool.getResFrame("common", "common_90005"), PathTool.getResFrame("common", "common_90006"), cc.size(115, 19), slot0.main_container, cc.p(0.5, 0.5), 540, 64, true, true)
		else
			slot0.comp_bar_bg:setVisible(true)
		end

		if not slot0.comp_bar_label then
			slot4 = cc.size(115, 19)
			slot0.comp_bar_label = createLabel(18, cc.c3b(19, 162, 19), nil, slot4.width / 2, slot4.height / 2 + 30, "", slot0.comp_bar, 2, cc.p(0.5, 0.5))
		end

		slot0.comp_bar:setPercent(slot2)
		slot0.comp_bar_label:setString(slot3)
	elseif slot0.comp_bar_bg then
		slot0.comp_bar_bg:setVisible(false)
	end
end

function taskExpItem.DeleteMe(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
