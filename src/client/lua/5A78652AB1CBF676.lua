ActivityWindow = ActivityWindow or BaseClass(BaseView)
slot0 = table.sort
slot1 = RoleController:getInstance():getRoleVo()
slot2 = ActivityController:getInstance()

function ActivityWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.title_str = TI18N("限时活动")
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("activity", "activity"),
			type = ResourcesType.plist
		}
	}
end

function ActivityWindow.open_callback(slot0)
	slot0.activityRoot = createCSBNote(PathTool.getTargetCSB("activity/activity_window"))

	slot0.activityRoot:setPosition(5, -26)
	slot0.container:addChild(slot0.activityRoot)

	slot0._main_container = slot0.activityRoot:getChildByName("main_container")
	slot0._scoreView = slot0._main_container:getChildByName("scoreView")
	slot0.itemScrollview = CommonScrollViewLayout.new(slot0._scoreView, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0._scoreView:getContentSize(), {
		start_y = 3,
		item_width = 605,
		start_x = 7.5,
		delay = 2,
		space_x = 6,
		row = 0,
		item_height = 165,
		space_y = 0,
		col = 1,
		item_class = ActivityItem
	})
end

function ActivityWindow.register_event(slot0)
	slot0:addGlobalEvent(ActivityEvent.EscortCount, function ()
		if uv0.itemScrollview and uv0.itemScrollview:getItemList() then
			for slot4, slot5 in pairs(slot0) do
				slot5:changeEscortCount()
			end
		end
	end)

	if uv0 then
		slot0:addGlobalEvent(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "lev" and uv0.itemScrollview and next(uv0.dataInfo) ~= nil then
				uv0.itemScrollview:setData(uv0.dataInfo)
			end
		end)
	end
end

function ActivityWindow.openRootWnd(slot0)
end

function ActivityWindow.updateItemListRedStatus(slot0)
	if slot0.itemScrollview:getItemList() then
		for slot5, slot6 in pairs(slot1) do
			slot6:updateRedStatus()
		end
	end
end

function ActivityWindow.close_callback(slot0)
	slot0.build_vo = nil

	if slot0.itemScrollview then
		slot0.itemScrollview:DeleteMe()

		slot0.itemScrollview = nil
	end

	uv0:openActivityView(false)
end
