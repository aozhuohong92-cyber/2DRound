TaskMainWindow = TaskMainWindow or BaseClass(BaseView)

function TaskMainWindow.__init(slot0)
	slot0.ctrl = TaskController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.win_type = WinType.Full
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("quest", "quest"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("taskexp", "taskexp"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("taskdaily", "taskdaily"),
			type = ResourcesType.plist
		}
	}
	slot0.tab_info_list = {
		{
			status = true,
			label = TI18N("日常"),
			notice = TI18N("日常任务11级开启"),
			index = TaskConst.type.quest
		},
		{
			status = true,
			label = TI18N("成就"),
			notice = TI18N("日常任务15级开启"),
			index = TaskConst.type.feat
		},
		{
			status = true,
			label = TI18N("进阶历练"),
			notice = TI18N("日常任务15级开启"),
			index = TaskConst.type.exp
		}
	}
	slot0.panel_list = {}
	slot0.cur_panel = nil
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function TaskMainWindow.open_callback(slot0)
end

function TaskMainWindow.register_event(slot0)
	slot0:addGlobalEvent(TaskEvent.UpdateUIRedStatus, function (slot0, slot1)
		uv0:updateUIRedStatus(slot0)
	end)

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "lev" then
				uv0:checkTabUnlockInfo(slot1)
				uv0:updateUIRedStatus(TaskConst.update_type.exp)
			end
		end)
	end
end

function TaskMainWindow.openRootWnd(slot0, slot1)
	slot0:checkTabUnlockInfo()
	slot0:setSelecteTab(slot1 or TaskConst.type.quest, true)
	slot0:updateUIRedStatus(TaskConst.update_type.feat)
	slot0:updateUIRedStatus(TaskConst.update_type.quest)
	slot0:updateUIRedStatus(TaskConst.update_type.exp)
end

function TaskMainWindow.checkTabUnlockInfo(slot0, slot1)
	if not slot0.role_vo then
		return
	end

	slot0.tab_info_list[TaskConst.type.exp].status = true

	if Config.RoomFeatData.data_const.experience_open_limit then
		if (slot1 or slot0.role_vo.lev) < slot2.val then
			slot0.tab_info_list[TaskConst.type.exp].status = false

			slot0:setTabBtnTouchStatus(false, TaskConst.type.exp)

			slot0.tab_btn_list[TaskConst.type.exp].notice = slot2.desc
		else
			slot0:setTabBtnTouchStatus(true, TaskConst.type.exp)
		end
	end
end

function TaskMainWindow.updateUIRedStatus(slot0, slot1)
	if slot1 == TaskConst.update_type.feat then
		slot0:setTabTips(slot0.model:getRedStatus(TaskConst.update_type.feat), TaskConst.type.feat)
	elseif slot1 == TaskConst.update_type.exp then
		slot2 = false

		if slot0.tab_info_list[TaskConst.type.exp].status then
			slot2 = slot0.model:getRedStatus(TaskConst.update_type.exp)
		end

		slot0:setTabTips(slot2, TaskConst.type.exp)
	else
		if slot0.model:getRedStatus(TaskConst.update_type.quest) == false then
			slot2 = slot0.model:getRedStatus(TaskConst.update_type.activity)
		end

		slot0:setTabTips(slot2, TaskConst.type.quest)
	end
end

function TaskMainWindow.selectedTabCallBack(slot0, slot1)
	if slot1 == TaskConst.type.exp and not slot0.tab_info_list[slot1].status then
		return
	end

	if slot1 == TaskConst.type.quest then
		slot0:changeTitleName(TI18N("日常"))
	elseif slot1 == TaskConst.type.feat then
		slot0:changeTitleName(TI18N("成就"))
	elseif slot1 == TaskConst.type.exp then
		slot0:changeTitleName(TI18N("进阶历练"))
	end

	slot0:changePanel(slot1)
end

function TaskMainWindow.changePanel(slot0, slot1)
	if slot0.cur_panel ~= nil then
		slot0.cur_panel:addToParent(false)

		slot0.cur_panel = nil
	end

	if slot0.panel_list[slot1] == nil then
		if slot1 == TaskConst.type.quest then
			slot0.panel_list[slot1] = TaskPanel.new(slot0.ctrl)
		elseif slot1 == TaskConst.type.feat then
			slot0.panel_list[slot1] = FeatPanel.new(slot0.ctrl)
		elseif slot1 == TaskConst.type.exp then
			slot0.panel_list[slot1] = TaskExpPanel.new()
		end

		slot0.container:addChild(slot0.panel_list[slot1])
	end

	slot0.cur_panel = slot0.panel_list[slot1]

	if slot0.cur_panel ~= nil then
		slot0.cur_panel:addToParent(true)
	end
end

function TaskMainWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	if slot0.role_vo ~= nil then
		if slot0.role_assets_event ~= nil then
			slot0.role_vo:UnBind(slot0.role_assets_event)

			slot0.role_assets_event = nil
		end

		slot0.role_vo = nil
	end

	slot0.panel_list = nil

	slot0.ctrl:openTaskMainWindow(false)
end
