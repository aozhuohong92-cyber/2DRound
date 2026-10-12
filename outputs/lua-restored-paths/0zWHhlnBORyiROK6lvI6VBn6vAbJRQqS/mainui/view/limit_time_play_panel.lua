LimitTimePlayPanel = LimitTimePlayPanel or BaseClass(BaseView)
slot0 = MainuiController:getInstance()
slot1 = table.insert
slot2 = string.format

function LimitTimePlayPanel.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "mainui/limit_time_play_panel"
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.time_desc_list = {}
end

function LimitTimePlayPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
		slot0.background:setSwallowTouches(false)
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.combobox_panel = slot0.main_panel:getChildByName("combobox_panel")
	slot0.combobox_bg = slot0.combobox_panel:getChildByName("bg")
	slot0.combobox_bg_size = slot0.combobox_bg:getContentSize()
	slot0.combobox_max_size = cc.size(220, 450)
	slot0.show_max_count = 6
end

function LimitTimePlayPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 1)
end

function LimitTimePlayPanel.onClickCloseBtn(slot0)
	uv0:openLimitTimePlayPanel(false)
end

function LimitTimePlayPanel.openRootWnd(slot0, slot1)
	if ActionController:getInstance():getModel():getLimitIconData() == nil and next(slot2) == nil then
		return
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot2) do
		if uv0:createFunctionVo(Config.FunctionData.data_info[slot8.id]) then
			slot10:update({
				slot8
			})
			uv1(slot3, slot10)
		end
	end

	table.sort(slot3, SortTools.tableLowerSorter({
		"pos",
		"sort"
	}))

	slot5 = slot1 or {}
	slot0.setting = slot5

	if slot0.main_panel:convertToNodeSpace(slot5.world_pos) then
		slot0.combobox_panel:setPosition(cc.p(slot7.x + 92, slot7.y + 83))
	end

	slot0:updateComboboxList(slot3)
	slot0:startTimeTicket()
end

function LimitTimePlayPanel.startTimeTicket(slot0)
	if slot0.timeticket == nil then
		slot0:countDownEndTime()

		slot0.timeticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:countDownEndTime()
		end, 1)
	end
end

function LimitTimePlayPanel.countDownEndTime(slot0)
	if slot0.combobox_scrollview then
		for slot4, slot5 in pairs(slot0.combobox_scrollview.activeCellIdx) do
			if slot5 and slot0.time_desc_list[slot4] then
				slot0:updateTimeByIndex(slot4, slot0.time_desc_list[slot4])
			end
		end
	end
end

function LimitTimePlayPanel.updateComboboxList(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.combobox_scrollview == nil then
		slot0.combobox_scrollview = CommonScrollViewSingleLayout.new(slot0.combobox_panel, cc.p(4, 3), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.combobox_max_size, {
			start_y = 2,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 1,
			space_x = 0,
			space_y = 0,
			col = 1,
			item_width = slot0.combobox_max_size.width,
			item_height = 75
		}, cc.p(0, 0))

		slot0.combobox_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.combobox_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.combobox_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if next(slot1) ~= nil then
		if slot0.show_max_count < #slot1 then
			slot0.combobox_scrollview:setClickEnabled(true)
			slot0.combobox_bg:setContentSize(slot0.combobox_bg_size)
		else
			slot0.combobox_scrollview:setClickEnabled(false)
			slot0.combobox_bg:setContentSize(cc.size(slot0.combobox_bg_size.width, slot3 * slot2 + slot0.combobox_bg_size.height - slot0.combobox_max_size.height))
		end

		slot0.show_list = slot1

		slot0.combobox_scrollview:reloadData(slot0.select_index)
	end
end

function LimitTimePlayPanel.createNewCell(slot0, slot1, slot2)
	slot3 = LimitTimePlayItem.new(slot1, slot2)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function LimitTimePlayPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function LimitTimePlayPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot4 = slot1:setData(slot3)
	slot0.time_desc_list[slot2] = slot4

	slot0:updateTimeByIndex(slot2, slot4)
end

function LimitTimePlayPanel.onCellTouched(slot0, slot1)
	if not slot0.show_list[slot1.index] then
		return
	end

	MainuiController:getInstance():iconClickHandle(slot3.config.id, nil, slot3.action_id)
	slot0:onClickCloseBtn()
end

function LimitTimePlayPanel.updateTimeByIndex(slot0, slot1, slot2)
	if slot0.show_list[slot1] and slot2 then
		TimeTool.GetTimeForFunction(time)

		if slot3.end_time - GameNet:getInstance():getTime() < 0 then
			slot4 = 0
		end

		slot5 = "0"

		if slot3.config.id == MainuiConst.icon.champion then
			if slot3.status == 1 then
				slot5 = uv0(TI18N("<div fontcolor=#249003>%s</div>后开启"), TimeTool.GetTimeForFunction(slot4))
			elseif slot3.status == 2 then
				slot5 = uv0(TI18N("进行中:<div fontcolor=#249003>%s</div>"), TimeTool.GetTimeForFunction(slot4))
			end
		elseif slot3.config.id == MainuiConst.icon.godbattle then
			if slot3.status == 1 then
				slot5 = uv0(TI18N("报名中:<div fontcolor=#249003>%s</div>"), TimeTool.GetTimeForFunction(slot4))
			elseif slot3.status == 2 then
				slot5 = uv0(TI18N("进行中:<div fontcolor=#249003>%s</div>"), TimeTool.GetTimeForFunction(slot4))
			end
		elseif slot3.config.id == MainuiConst.icon.guildwar then
			if slot3.status == 1 then
				slot5 = uv0(TI18N("<div fontcolor=#249003>%s</div>后开启"), TimeTool.GetTimeForFunction(slot4))
			elseif slot3.status == 2 then
				slot5 = uv0(TI18N("<div fontcolor=#249003>%s</div>后结束"), TimeTool.GetTimeForFunction(slot4))
			end
		else
			slot5 = (slot3.config.id ~= MainuiConst.icon.peak_champion or uv0(TI18N("<div fontcolor=#249003>%s</div>"), TimeTool.GetTimeForFunction(slot4))) and uv0(TI18N("<div fontcolor=#249003>%s</div>"), TimeTool.GetTimeForFunction(slot4))
		end

		slot2:setString(slot5)
	end
end

function LimitTimePlayPanel.close_callback(slot0)
	if slot0.combobox_scrollview then
		slot0.combobox_scrollview:DeleteMe()

		slot0.combobox_scrollview = nil
	end

	if slot0.timeticket then
		GlobalTimeTicket:getInstance():remove(slot0.timeticket)

		slot0.timeticket = nil
	end

	uv0:openLimitTimePlayPanel(false)
end

LimitTimePlayItem = class("LimitTimePlayItem", function ()
	return ccui.Widget:create()
end)

function LimitTimePlayItem.ctor(slot0, slot1, slot2)
	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function LimitTimePlayItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("mainui/limit_time_play_item"))

	slot0:addChild(slot0.root_wnd)
	slot0.root_wnd:setPosition(-1, 0)

	slot4 = slot0.root_wnd:getChildByName("main_container")
	slot0.btn_name = slot4:getChildByName("btn_name")

	slot0.btn_name:setTextColor(cc.c4b(128, 61, 24, 255))

	slot0.time_val = createRichLabel(18, cc.c4b(144, 93, 56, 255), cc.p(1, 0.5), cc.p(200, 22), 6, nil, 900)

	slot4:addChild(slot0.time_val)

	slot0.goto_btn = slot4:getChildByName("goto_btn")
	slot0.icon = slot0.goto_btn:getChildByName("icon")
end

function LimitTimePlayItem.register_event(slot0)
	registerButtonEventListener(slot0.goto_btn, function ()
		uv0:onGotoBtn()
	end, true, 1)
end

function LimitTimePlayItem.onGotoBtn(slot0)
	if not slot0.data then
		return
	end

	if slot0.callback then
		slot0.callback()
	end
end

function LimitTimePlayItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function LimitTimePlayItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot0.data == nil or slot0.data.config == nil then
		return
	end

	if slot0.data.real_name and slot0.data.real_name ~= "" and slot0.data.real_name ~= "null" then
		slot0.btn_name:setString(slot0.data.real_name)
	else
		slot0.btn_name:setString(slot0.data.config.icon_name)
	end

	if slot0.data.real_res_id == "" then
		slot2 = slot0.data.res_id
	end

	if PathTool.getFunctionRes(slot2) ~= slot0.res_id then
		slot0.res_id = slot3

		loadSpriteTexture(slot0.icon, slot0.res_id, LOADTEXT_TYPE)
	end

	return slot0.time_val
end

function LimitTimePlayItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
