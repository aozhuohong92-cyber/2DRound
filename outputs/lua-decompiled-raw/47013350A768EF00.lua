LimitActionWindowTips = LimitActionWindowTips or BaseClass(BaseView)
slot0 = MainuiController:getInstance()
slot1 = table.insert
slot2 = string.format
slot3 = GameNet:getInstance()

function LimitActionWindowTips.__init(slot0)
	slot0.view_tag = ViewMgrTag.TOP_TAG
	slot0.win_type = WinType.Tips
	slot0.layout_name = "mainui/limit_action_window_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("limitactiontips", "limitactiontips"),
			type = ResourcesType.plist
		}
	}
end

function LimitActionWindowTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_panel")
	slot0.check_panel = slot1:getChildByName("check_panel")

	slot0.check_panel:getChildByName("label"):setString(TI18N("查看全天活动"))

	slot0.list_view = slot1:getChildByName("list_view")
	slot0.item = slot1:getChildByName("item")

	slot0.item:setVisible(false)

	slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_view, nil, , , slot0.list_view:getContentSize(), {
		start_y = 7,
		item_width = 376,
		start_x = 6,
		space_x = 0,
		row = 0,
		item_height = 100,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = LimitActionTipsItem
	})
end

function LimitActionWindowTips.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:openLimitActionTips(false)
		end
	end)
	slot0.check_panel:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.limit_action)
			uv0:openLimitActionTips(false)
		end
	end)
end

function LimitActionWindowTips.openRootWnd(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(Config.FunctionData.data_limit_action) do
		slot8 = DeepCopy(slot6)
		slot8.status = 3
		slot8.end_time = 0
		slot8.show_line = true
		slot8.is_open = uv0:checkMainFunctionOpenStatus(slot6.id, MainuiConst.function_type.other, true)

		if uv0:getFucntionIconVoById(slot6.id) then
			slot8.status = slot7.status or 3
			slot8.end_time = slot7.end_time or 0
		end

		uv1(slot1, slot8)
	end

	if slot1 and next(slot1) then
		table.sort(slot1, SortTools.tableLowerSorter({
			"status",
			"end_time",
			"id"
		}))

		slot1[#slot1].show_line = false

		slot0.scroll_view:setData(slot1, function (slot0)
			uv0:clickItem(slot0)
		end, nil, slot0.item)
	end

	if slot0.time_ticket == nil then
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:countTimeTicket()
		end, 1)
	end
end

function LimitActionWindowTips.countTimeTicket(slot0)
	if slot0.scroll_view:getItemList() then
		for slot5, slot6 in pairs(slot1) do
			if slot6.setCoolTime then
				slot6:setCoolTime()
			end
		end
	end
end

function LimitActionWindowTips.clearTimeTicket(slot0)
	if slot0.time_ticket then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function LimitActionWindowTips.clickItem(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot1.id == MainuiConst.icon.godbattle and slot1.status ~= 1 and slot1.status ~= 2 then
		uv0:changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.limit_action)
	else
		uv0:changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.function_icon, slot1.id)
	end

	uv0:openLimitActionTips(false)
end

function LimitActionWindowTips.close_callback(slot0)
	slot0:clearTimeTicket()

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil

	uv0:openLimitActionTips(false)
end

LimitActionTipsItem = class("LimitActionTipsItem", function ()
	return ccui.Layout:create()
end)

function LimitActionTipsItem.ctor(slot0)
	slot0.is_completed = false
	slot0.is_open = true
end

function LimitActionTipsItem.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot0.is_completed = true
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0.root_wnd:setTouchEnabled(true)
		slot0:addChild(slot0.root_wnd)

		slot0.icon = slot0.root_wnd:getChildByName("icon")

		slot0.icon:ignoreContentAdaptWithSize(true)

		slot0.line = slot0.root_wnd:getChildByName("line")
		slot0.status_icon = slot0.root_wnd:getChildByName("status_icon")
		slot0.item_name = slot0.root_wnd:getChildByName("name")
		slot0.item_time = slot0.root_wnd:getChildByName("time")

		slot0:registerEvent()
	end
end

function LimitActionTipsItem.registerEvent(slot0)
	slot0.root_wnd:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				if uv0.call_back and uv0.data.is_open == true then
					uv0.call_back(uv0.data)
				else
					message(uv0.data.desc)
				end
			end
		end
	end)
end

function LimitActionTipsItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1 then
		if slot1.status == 2 then
			slot0.item_time:setTextColor(cc.c4b(85, 236, 69, 255))
		else
			slot0.item_time:setTextColor(cc.c4b(207, 190, 163, 255))
		end

		slot0.item_name:setString(slot1.icon_name)

		if PathTool.getFunctionRes(slot1.icon_res) ~= slot0.res_id then
			slot0.res_id = slot2

			slot0.icon:loadTexture(slot2, LOADTEXT_TYPE)
		end

		if slot1.status == 1 then
			slot0.status_icon:loadTexture(PathTool.getResFrame("limitaction", "limitaction_5"), LOADTEXT_TYPE_PLIST)
		elseif slot1.status == 2 then
			slot0.status_icon:loadTexture(PathTool.getResFrame("limitaction", "limitaction_4"), LOADTEXT_TYPE_PLIST)
		else
			slot0.status_icon:loadTexture(PathTool.getResFrame("limitaction", "limitaction_6"), LOADTEXT_TYPE_PLIST)
		end

		slot0.line:setVisible(slot1.show_line or false)

		if slot1.status == 3 then
			if slot1.is_open == false then
				slot0.item_time:setString(slot1.desc)
			else
				slot0.item_time:setString(TI18N("活动暂未开启"))
			end
		else
			slot0:setCoolTime()
		end
	end
end

function LimitActionTipsItem.setCoolTime(slot0)
	if slot0.data == nil or slot0.data.status == 3 then
		return
	end

	if slot0.data.end_time - uv0:getTime() < 0 then
		slot1 = 0
	end

	slot2 = ""

	if slot0.data.status == 1 then
		slot2 = uv1(TI18N("%s后开启"), TimeTool.GetTimeForFunction(slot1))
	elseif slot0.data.status == 2 then
		slot2 = uv1(TI18N("%s后结束"), TimeTool.GetTimeForFunction(slot1))
	end

	if slot1 == 0 then
		slot2 = ""
	end

	if slot0.time_desc ~= slot2 then
		slot0.time_desc = slot2

		slot0.item_time:setString(slot2)
	end
end

function LimitActionTipsItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function LimitActionTipsItem.suspendAllActions(slot0)
end

function LimitActionTipsItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
