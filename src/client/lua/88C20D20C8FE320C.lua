ActiontermbeginsCollectResultPanel = ActiontermbeginsCollectResultPanel or BaseClass(BaseView)
slot1 = ActiontermbeginsController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function ActiontermbeginsCollectResultPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "actiontermbegins/action_term_begins_collect_reward_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("termbeginsreward", "termbeginsreward"),
			type = ResourcesType.plist
		}
	}
	slot0.dic_collect_schedule = {}
	slot0.paper_item_id = 1

	if Config.HolidayTermBeginsData.data_const.paper_item_id then
		slot0.paper_item_id = slot1.val
	end
end

function ActiontermbeginsCollectResultPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("收集奖励"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.scroll_container = slot0.main_container:getChildByName("scroll_container")
	slot0.tip_1 = slot0.main_container:getChildByName("tip_1")

	slot0.tip_1:setString(TI18N("关卡大挑战活动可以掉落满分试卷"))

	slot0.tip_2 = slot0.main_container:getChildByName("tip_2")

	slot0.tip_2:setString(TI18N("达成条件未领取的奖励,将会在活动结束后通过邮件发放"))

	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")
	slot0.comfirm_label = slot0.comfirm_btn:getChildByName("label")

	slot0.comfirm_label:setString(TI18N("提交试卷"))
end

function ActiontermbeginsCollectResultPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.comfirm_btn, handler(slot0, slot0.onClickBtnComfirm), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	slot0:addGlobalEvent(ActiontermbeginsEvent.TERM_BEGINS_PAPER_REWARD_LIST_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
	slot0:addGlobalEvent(ActiontermbeginsEvent.TERM_BEGINS_RECEIVE_PAPER_EVENT, function (slot0)
		if not slot0 then
			return
		end

		if uv0.dic_collect_schedule and uv0.dic_collect_schedule[slot0.id] then
			uv0.dic_collect_schedule[slot0.id].staus = 2
			uv0.dic_collect_schedule[slot0.id].sort = 3

			uv0:updateList()
			GlobalEvent:getInstance():Fire(ActiontermbeginsEvent.TERM_BEGINS_REWARD_REDPOINT_EVENT, slot0)
		end
	end)
	slot0:addGlobalEvent(ActiontermbeginsEvent.TERM_BEGINS_SUBIT_PAPER_EVENT, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.show_list then
			return
		end

		uv1:sender26705()
		uv0:updateComfirmRedPoint()
	end)
end

function ActiontermbeginsCollectResultPanel.onClickBtnClose(slot0)
	uv0:openActiontermbeginsCollectResultPanel(false)
end

function ActiontermbeginsCollectResultPanel.onClickBtnComfirm(slot0)
	slot1 = {}
	slot0.paper_item_id = 1

	if Config.HolidayTermBeginsData.data_const.paper_item_id then
		slot0.paper_item_id = slot2.val
	end

	slot1.item_id = slot0.paper_item_id
	slot1.shop_type = MallConst.MallType.TermBeginsBuy

	ActiontermbeginsController:getInstance():openActionBuyPanel(true, slot1)
end

function ActiontermbeginsCollectResultPanel.openRootWnd(slot0, slot1)
	slot0.is_time_out = (slot1 or {}).is_time_out

	if not Config.HolidayTermBeginsData.data_cellect_reward_info then
		return
	end

	function slot7(slot0, slot1)
		return slot0.id < slot1.id
	end

	uv0(slot3, slot7)

	slot0.show_list = {}
	slot0.dic_collect_schedule = {}

	for slot7, slot8 in ipairs(slot3) do
		slot0.dic_collect_schedule[slot8.id] = {
			config = slot8,
			staus = 0,
			sort = 2,
			id = slot8.id
		}

		uv1(slot0.show_list, slot0.dic_collect_schedule[slot8.id])
	end

	uv2:sender26705()
	slot0:updateComfirmRedPoint()
end

function ActiontermbeginsCollectResultPanel.updateComfirmRedPoint(slot0)
	if not slot0.is_time_out and BackpackController:getInstance():getModel():getItemNumByBid(slot0.paper_item_id) > 0 then
		addRedPointToNodeByStatus(slot0.comfirm_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.comfirm_btn, false, 5, 5)
	end
end

function ActiontermbeginsCollectResultPanel.setData(slot0, slot1)
	if not slot0.show_list then
		return
	end

	for slot5, slot6 in ipairs(slot1.collect_schedule) do
		if slot0.dic_collect_schedule[slot6.id] then
			for slot10, slot11 in pairs(slot6) do
				slot0.dic_collect_schedule[slot6.id][slot10] = slot11
			end

			if slot6.staus == 2 then
				slot0.dic_collect_schedule[slot6.id].sort = 3
			elseif slot6.staus == 1 then
				slot0.dic_collect_schedule[slot6.id].sort = 1
			else
				slot0.dic_collect_schedule[slot6.id].sort = 2
			end
		end
	end

	slot0.paper_num = slot1.num or 0

	slot0:updateList()
end

function ActiontermbeginsCollectResultPanel.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 612,
			item_height = 150,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	uv0(slot0.show_list, SortTools.tableLowerSorter({
		"sort",
		"id"
	}))

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.scroll_container, true, {
			text = TI18N("暂无奖励数据")
		})
	else
		commonShowEmptyIcon(slot0.scroll_container, false)
	end

	slot0.item_scrollview:reloadData()
end

function ActiontermbeginsCollectResultPanel.createNewCell(slot0, slot1, slot2)
	return ActionTermBeginsCollectRewardItem.new(slot1, slot2, slot0)
end

function ActiontermbeginsCollectResultPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ActiontermbeginsCollectResultPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3, slot0.paper_num)
end

function ActiontermbeginsCollectResultPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openActiontermbeginsCollectResultPanel(false)
end

ActionTermBeginsCollectRewardItem = class("ActionTermBeginsCollectRewardItem", function ()
	return ccui.Widget:create()
end)

function ActionTermBeginsCollectRewardItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ActionTermBeginsCollectRewardItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("actiontermbegins/action_term_begins_collect_reward_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.name = slot0.container:getChildByName("name")
	slot0.count = slot0.container:getChildByName("count")
	slot0.box_img = slot0.container:getChildByName("box_img")
	slot0.is_receive = slot0.container:getChildByName("is_receive")
	slot0.receive_btn = slot0.container:getChildByName("receive_btn")

	slot0.receive_btn:getChildByName("label"):setString(TI18N("领 取"))

	slot0.goto_btn = slot0.container:getChildByName("goto_btn")

	slot0.goto_btn:getChildByName("label"):setString(TI18N("前 往"))

	slot0.item_scrollview = slot0.container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)
end

function ActionTermBeginsCollectRewardItem.register_event(slot0)
	registerButtonEventListener(slot0.receive_btn, function ()
		uv0:onReceiveBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.goto_btn, function ()
		uv0:onGotoBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
end

function ActionTermBeginsCollectRewardItem.onReceiveBtn(slot0)
	if not slot0.data then
		return
	end

	uv0:sender26706(slot0.data.id)
end

function ActionTermBeginsCollectRewardItem.onGotoBtn(slot0)
	if not slot0.data then
		return
	end

	slot0.parent:onClickBtnClose()
end

function ActionTermBeginsCollectRewardItem.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if not slot1.config then
		return
	end

	slot0.data = slot1

	if slot0.box_img then
		slot3 = slot1.config.res or "termbeginsreward_02"

		if slot0.record_res == nil or slot0.record_res ~= slot3 then
			slot0.record_res = slot3

			loadSpriteTexture(slot0.box_img, PathTool.getResFrame("termbeginsreward", slot3), LOADTEXT_TYPE_PLIST)
		end
	end

	slot0.name:setString(uv0(TI18N("提交%s份满分试卷可以获得"), slot1.config.count))

	slot4 = nil
	slot5 = slot2 or 0

	slot0.count:setString(uv0("(%s/%s)", (slot1.config.count >= slot5 or slot1.config.count) and slot5, slot1.config.count))

	slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot1.config.award, {
		scale = 0.7,
		max_count = 3
	})
	slot9 = slot1.staus or 0

	slot0.is_receive:setVisible(slot9 == 2)
	slot0.receive_btn:setVisible(slot9 == 1)
	slot0.goto_btn:setVisible(slot9 == 0)
end

function ActionTermBeginsCollectRewardItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	doStopAllActions(slot0.item_scrollview)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
