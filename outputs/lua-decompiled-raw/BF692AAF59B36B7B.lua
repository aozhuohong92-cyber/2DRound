ActionFortuneBagSelectWindow = ActionFortuneBagSelectWindow or BaseClass(BaseView)
slot1 = ActionController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format

function ActionFortuneBagSelectWindow.__init(slot0)
	slot0.camp_id = uv0:getFortuneBagCampId()
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
	slot0.layout_name = "action/action_fortune_bag_select_window"
end

function ActionFortuneBagSelectWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("设置终极大奖"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")
	slot0.comfirm_btn_label = slot0.comfirm_btn:getChildByName("label")

	slot0.comfirm_btn_label:setString(TI18N("确 定"))

	slot0.cancel_btn = slot0.main_container:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.lay_srollview = slot0.main_container:getChildByName("lay_srollview")
	slot0.tips_label = slot0.main_container:getChildByName("tips_label")

	slot0.tips_label:setString(TI18N("选择本轮终极大奖"))
end

function ActionFortuneBagSelectWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClosedBtn()
	end, true, 2)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, 1)
	registerButtonEventListener(slot0.cancel_btn, function ()
		uv0:onCancelBtn()
	end, true, 1)

	if not slot0.update_fortune_bag_ultimate_event then
		slot0.update_fortune_bag_ultimate_event = GlobalEvent:getInstance():Bind(ActionEvent.FORTUNE_BAG_ULTIMATE_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0:setPanelData(slot0)
		end)
	end
end

function ActionFortuneBagSelectWindow.onClosedBtn(slot0)
	uv0:openFortuneBagSelectWindow(false)
end

function ActionFortuneBagSelectWindow.onComfirmBtn(slot0)
	if slot0.select_type_id and slot0.select_type_id ~= 0 then
		uv0:sender28305(slot0.select_type_id)
	end

	slot0:onClosedBtn()
end

function ActionFortuneBagSelectWindow.onCancelBtn(slot0)
	slot0:onClosedBtn()
end

function ActionFortuneBagSelectWindow.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.cur_round = slot1.cur_round or 0
	slot0.select_type_id = slot1.select_type_id or 0

	uv0:sender28303()
end

function ActionFortuneBagSelectWindow.setPanelData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot0.item_scrollview == nil then
		slot2 = slot0.lay_srollview:getContentSize()
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.lay_srollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2, {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_height = 158,
			space_y = 0,
			col = 4,
			item_width = slot2.width / 4
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end

	slot2 = {}
	slot3 = Config.HolidayOptionalLotteryData.data_optional_award[slot0.camp_id]

	for slot7, slot8 in pairs(slot1.award_list) do
		if slot3[slot8.type_id] then
			uv0(slot2, {
				rewards = slot3[slot8.type_id].rewards,
				get_count = slot8.get_count,
				count = slot8.count,
				round = slot8.round,
				cur_round = slot0.cur_round,
				type_id = slot8.type_id
			})
		end
	end

	uv1(slot2, function (slot0, slot1)
		if slot0.round < slot1.round then
			return true
		elseif slot1.round == slot0.round then
			return slot0.type_id < slot1.type_id
		end
	end)

	slot0.show_list = slot2 or {}

	slot0.item_scrollview:reloadData()
end

function ActionFortuneBagSelectWindow.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Widget:create()

	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(0.5, 0)
	slot3:setContentSize(cc.size(slot1, slot2))

	slot3.goods_item = BackPackItem.new(true, true, false, nil, , false)

	slot3.goods_item:setPosition(slot1 * 0.5, 90)
	slot3:addChild(slot3.goods_item)

	slot3.txt_surplus_count = createLabel(22, Config.ColorData.data_color4[175], nil, slot1 * 0.5, 5, nil, slot3, nil, cc.p(0.5, 0))

	if slot3.lay_select == nil then
		slot4, slot5 = slot3.goods_item:getPosition()
		slot6 = slot3.goods_item:getContentSize()
		slot3.lay_select = ccui.Layout:create()

		slot3.lay_select:setAnchorPoint(cc.p(0.5, 0.5))
		slot3.lay_select:setContentSize(slot6)
		slot3.lay_select:setPosition(slot4, slot5)
		slot3.lay_select:setTouchEnabled(false)
		showLayoutRect(slot3.lay_select, 150)
		createImage(slot3.lay_select, PathTool.getResFrame("common", "common_1043"), slot6.width / 2, slot6.height / 2, cc.p(0.5, 0.5), true, 0, false)
		slot3:addChild(slot3.lay_select, 1)
		slot3.lay_select:setVisible(false)

		slot3.lay_lock = ccui.Layout:create()

		slot3.lay_lock:setAnchorPoint(cc.p(0.5, 0.5))
		slot3.lay_lock:setContentSize(slot6)
		slot3.lay_lock:setPosition(slot4, slot5)
		slot3.lay_lock:setTouchEnabled(false)
		showLayoutRect(slot3.lay_lock, 150)
		createImage(slot3.lay_lock, PathTool.getResFrame("common", "common_90009"), 0, slot6.height, cc.p(0, 1), true, 0, false)
		slot3:addChild(slot3.lay_lock, 1)
		slot3.lay_lock:setVisible(false)
	end

	slot3.goods_item:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function ActionFortuneBagSelectWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ActionFortuneBagSelectWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	if slot0.select_type_id == slot3.type_id then
		slot1.lay_select:setVisible(true)

		slot0.select_cell = slot1
	end

	if slot3.rewards and next(slot3.rewards) ~= nil then
		slot4 = {}

		if deepCopy(Config.ItemData.data_get_data(slot3.rewards[1][1])) ~= nil then
			slot4.quantity = slot3.rewards[1][2]

			slot1.goods_item:setData(slot4)
		end
	end

	if slot3.round <= slot3.cur_round then
		str = uv0("%d/%d", slot3.count - slot3.get_count, slot3.count)

		slot1.lay_lock:setVisible(false)
		slot1.goods_item:setReceivedIcon(slot3.count <= slot3.get_count)
	else
		str = uv0(TI18N("第%d轮可选"), slot3.round)

		slot1.lay_lock:setVisible(true)
	end

	slot1.txt_surplus_count:setString(str)
end

function ActionFortuneBagSelectWindow.onCellTouched(slot0, slot1, slot2)
	if not slot1.index then
		return
	end

	if not slot0.show_list[slot1.index] then
		return
	end

	if slot3.round <= slot3.cur_round then
		if slot3.count <= slot3.get_count then
			message(TI18N("已经没有可选次数了"))

			return
		end
	else
		message(TI18N("暂时未到可选轮次"))

		return
	end

	if slot0.select_cell and slot0.select_cell.goods_item then
		slot0.select_cell.lay_select:setVisible(false)
	end

	if slot0.select_type_id and slot0.select_type_id == slot3.type_id then
		slot0.select_type_id = nil
		slot0.select_cell = nil

		return
	else
		slot0.select_type_id = slot3.type_id
		slot0.select_cell = slot1

		if slot0.select_cell and slot0.select_cell.goods_item then
			slot0.select_cell.lay_select:setVisible(true)
		end

		return
	end
end

function ActionFortuneBagSelectWindow.close_callback(slot0)
	if slot0.update_fortune_bag_ultimate_event then
		GlobalEvent:getInstance():UnBind(slot0.update_fortune_bag_ultimate_event)

		slot0.update_fortune_bag_ultimate_event = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openFortuneBagSelectWindow(false)
end
