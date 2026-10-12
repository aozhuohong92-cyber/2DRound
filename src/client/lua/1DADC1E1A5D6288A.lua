ActiontermbeginsMainWindow = ActiontermbeginsMainWindow or BaseClass(BaseView)
slot1 = ActiontermbeginsController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert

function ActiontermbeginsMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "actiontermbegins/action_term_begins_main_window"
	slot0.res_list = {}
	slot0.view_list = {}
	slot0.paper_item_id = 1

	if Config.HolidayTermBeginsData.data_const.paper_item_id then
		slot0.paper_item_id = slot1.val
	end

	slot0.ticket_item_id = 1

	if Config.HolidayTermBeginsData.data_const.ticket_item_id then
		slot0.ticket_item_id = slot2.val
	end
end

function ActiontermbeginsMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0:setBackgroundImg("term_begins_chapter_bg")

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot0.main_container:setZOrder(2)

	slot0.container = slot0.main_container:getChildByName("container")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.top_panel = slot0.main_container:getChildByName("top_panel")
	slot0.tab_list = {}
	slot5 = "tab_container"
	slot0.tab_container = slot0.top_panel:getChildByName(slot5)

	for slot5 = 1, 2 do
		if slot0.tab_container:getChildByName("tab_btn_" .. slot5) then
			slot7 = {
				unselect_bg = slot6:getChildByName("unselect_bg")
			}

			slot7.unselect_bg:setVisible(true)

			slot7.select_bg = slot6:getChildByName("select_bg")

			slot7.select_bg:setVisible(false)

			slot7.lable = slot6:getChildByName("title")

			slot7.lable:setString(({
				TI18N("关卡大挑战"),
				TI18N("boss大挑战")
			})[slot5])

			slot7.tab_btn = slot6
			slot7.index = slot5
			slot0.tab_list[slot5] = slot7
		end
	end

	slot0:adaptationScreen()
end

function ActiontermbeginsMainWindow.adaptationScreen(slot0)
	slot3 = display.getLeft(slot0.main_container)
	slot4 = display.getRight(slot0.main_container)

	slot0.top_panel:setPositionY(display.getTop(slot0.main_container) - (slot0.main_container:getContentSize().height - slot0.top_panel:getPositionY()))
	slot0.close_btn:setPositionY(display.getBottom(slot0.main_container) + slot0.close_btn:getPositionY())
end

function ActiontermbeginsMainWindow.setBackgroundImg(slot0, slot1)
	if slot0.record_bg_res ~= PathTool.getPlistImgForDownLoad("bigbg/termbegins", slot1, true) then
		slot0.record_bg_res = slot2
		slot0.item_load_bg = loadImageTextureFromCDN(slot0.background, slot2, ResourcesType.single, slot0.item_load_bg)
	end
end

function ActiontermbeginsMainWindow.register_event(slot0)
	slot4 = handler(slot0, slot0.onClickBtnClose)
	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end

	slot0:addGlobalEvent(ActiontermbeginsEvent.TERM_BEGINS_MAIN_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0.scdata = slot0

		uv0:initData()

		for slot4, slot5 in pairs(uv0.view_list) do
			if slot5.setScdata then
				slot5:setScdata(slot0)
			end
		end

		uv0:initTimeOut()
		uv0:updateLeftRedPoint()
		uv0:updateRightRedPoint()
	end)
	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		uv0:updateRightRedPoint()
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
		uv0:updateRightRedPoint()
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
		uv0:updateRightRedPoint()
	end)
	slot0:addGlobalEvent(ActiontermbeginsEvent.TERM_BEGINS_PAPER_REWARD_LIST_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0.paper_reward_scdata = slot0

		uv0:updateRightRedPoint()

		if uv0.view_list[ActiontermbeginsConstants.TabType.eBoss] then
			uv0.view_list[ActiontermbeginsConstants.TabType.eBoss]:updateRewardBtnRedpoint()
		end
	end)
	slot0:addGlobalEvent(ActiontermbeginsEvent.TERM_BEGINS_REWARD_REDPOINT_EVENT, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.paper_reward_scdata then
			return
		end

		for slot4, slot5 in ipairs(uv0.paper_reward_scdata.collect_schedule) do
			if slot5.id == slot0.id then
				slot5.staus = 2
			end
		end

		if uv0.view_list[ActiontermbeginsConstants.TabType.eBoss] then
			uv0.view_list[ActiontermbeginsConstants.TabType.eBoss]:updateRewardBtnRedpoint()
		end
	end)
end

function ActiontermbeginsMainWindow.initTimeOut(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.end_time - GameNet:getInstance():getTime() <= 0 then
		slot1 = 0
		slot0.is_time_out = true
	elseif slot0.time_ticket == nil then
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0 = uv0 - 1

			if uv0 <= 0 then
				uv1.is_time_out = true

				uv1:updateLeftRedPoint()
				uv1:updateRightRedPoint()
				uv1:clearTimeTicket()
			end
		end, 1)
	end
end

function ActiontermbeginsMainWindow.clearTimeTicket(slot0)
	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function ActiontermbeginsMainWindow.updateLeftRedPoint(slot0)
	if not slot0.scdata then
		return
	end

	if not slot0.select_index then
		return
	end

	if slot0.select_index ~= ActiontermbeginsConstants.TabType.eChapter then
		if not slot0.is_time_out and slot0.scdata.cha_count > 0 and slot0.scdata.order < (Config.HolidayTermBeginsData.data_max_chapter_id[slot0.scdata.round] or 0) then
			slot0:updateRedPointByindex(ActiontermbeginsConstants.TabType.eChapter, true)
		else
			slot0:updateRedPointByindex(ActiontermbeginsConstants.TabType.eChapter, false)
		end
	else
		slot0:updateRedPointByindex(ActiontermbeginsConstants.TabType.eChapter, false)
	end
end

function ActiontermbeginsMainWindow.updateRightRedPoint(slot0)
	if not slot0.scdata then
		return
	end

	if not slot0.paper_reward_scdata then
		return
	end

	if not slot0.select_index then
		return
	end

	if slot0.select_index ~= ActiontermbeginsConstants.TabType.eBoss then
		slot1 = 0
		slot2 = nil

		if slot0.scdata.boss_flag == 1 then
			slot1 = BackpackController:getInstance():getModel():getItemNumByBid(slot0.ticket_item_id)
		end

		slot3 = BackpackController:getInstance():getModel():getItemNumByBid(slot0.paper_item_id)
		slot4 = false

		for slot8, slot9 in ipairs(slot0.paper_reward_scdata.collect_schedule) do
			if slot9.staus == 1 then
				slot4 = true

				break
			end
		end

		if not slot0.is_time_out and (slot1 > 0 or slot3 > 0 or slot4) then
			slot0:updateRedPointByindex(ActiontermbeginsConstants.TabType.eBoss, true)
		else
			slot0:updateRedPointByindex(ActiontermbeginsConstants.TabType.eBoss, false)
		end
	else
		slot0:updateRedPointByindex(ActiontermbeginsConstants.TabType.eBoss, false)
	end
end

function ActiontermbeginsMainWindow.updateRedPointByindex(slot0, slot1, slot2)
	if slot0.tab_list[slot1] then
		if slot1 == 1 then
			addRedPointToNodeByStatus(slot3.tab_btn, slot2 or false, -130, 5)
		else
			addRedPointToNodeByStatus(slot3.tab_btn, slot4, 0, 5)
		end
	end
end

function ActiontermbeginsMainWindow.onClickBtnClose(slot0)
	uv0:openActiontermbeginsMainWindow(false)
end

function ActiontermbeginsMainWindow.changeSelectedTab(slot0, slot1, slot2)
	if slot0.is_move_effect then
		return
	end

	if not slot2 and slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	slot3 = false

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)

		slot0.tab_object = nil
		slot3 = true
	end

	slot0.select_index = slot1
	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
	end

	if slot1 == ActiontermbeginsConstants.TabType.eChapter then
		slot0:setBackgroundImg("term_begins_chapter_bg")
	else
		slot0:setBackgroundImg("term_begins_boss_bg")
	end

	slot0:updateLeftRedPoint()
	slot0:updateRightRedPoint()

	if slot0.pre_panel ~= nil then
		if slot0.pre_panel.setVisibleStatus then
			slot0.pre_panel:setVisibleStatus(false)
		else
			slot0.pre_panel:setVisible(false)
		end
	end

	slot0.pre_panel = slot0:createSubPanel(slot0.select_index)

	if slot0.pre_panel ~= nil then
		if slot0.pre_panel.setVisibleStatus then
			slot0.pre_panel:setVisibleStatus(true)
		else
			slot0.pre_panel:setVisible(true)
		end
	end

	slot0.pre_panel:setData()
end

function ActiontermbeginsMainWindow.createSubPanel(slot0, slot1)
	if slot0.view_list[slot1] == nil then
		if slot1 == ActiontermbeginsConstants.TabType.eChapter then
			slot2 = ActiontermbeginsTabChapterPanel.new(slot0)
		elseif slot1 == ActiontermbeginsConstants.TabType.eBoss then
			slot2 = ActiontermbeginsTabBossPanel.new(slot0)
		end

		slot3 = slot0.container:getContentSize()

		slot2:setPosition(cc.p(slot3.width * 0.5, slot3.height * 0.5))
		slot0.container:addChild(slot2)

		slot0.view_list[slot1] = slot2
	end

	return slot2
end

function ActiontermbeginsMainWindow.openRootWnd(slot0, slot1)
	slot0.select_index = (slot1 or {}).index

	uv0:sender26705()
	uv0:sender26700()
end

function ActiontermbeginsMainWindow.initData(slot0)
	if slot0.is_init then
		return
	end

	if not slot0.scdata then
		return
	end

	slot0.is_init = true

	if slot0.select_index then
		slot0:changeSelectedTab(slot0.select_index)
	elseif slot0.scdata.boss_flag == 1 then
		slot0:changeSelectedTab(2)
	else
		slot0:changeSelectedTab(1)
	end
end

function ActiontermbeginsMainWindow.close_callback(slot0)
	if slot0.item_load_bg then
		slot0.item_load_bg:DeleteMe()
	end

	slot0.item_load_bg = nil

	if slot0.view_list then
		for slot4, slot5 in pairs(slot0.view_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.view_list = nil

	uv0:openActiontermbeginsMainWindow(false)
end
