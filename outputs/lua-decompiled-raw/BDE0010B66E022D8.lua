OrderActionRewardPanel1 = class("OrderActionRewardPanel1", function ()
	return ccui.Widget:create()
end)
slot0 = table.sort
slot1 = table.insert
slot2 = math.ceil
slot4 = OrderActionController:getInstance():getModel()
slot5 = Config.HolidayWarOrderData.data_lev_reward_list

function OrderActionRewardPanel1.ctor(slot0, slot1)
	slot0.cur_period = slot1 or 1
	slot0.cur_move_num = nil

	slot0:layoutUI()
	slot0:registerEvents()
end

function OrderActionRewardPanel1.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("orderaction/reward_panel1"))

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(651, 558))

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:getChildByName("Image_1"):getChildByName("Text_1"):setString(TI18N("等级"))
	slot0.main_container:getChildByName("Image_1"):getChildByName("Text_1_0"):setString(TI18N("奖励"))
	slot0.main_container:getChildByName("Image_1"):getChildByName("Text_1_1"):setString(TI18N("进阶奖励"))
	slot0.main_container:getChildByName("Image_14"):getChildByName("Text_2"):setString(TI18N("奖励预览"))

	slot0.lev_num = slot0.main_container:getChildByName("Image_14"):getChildByName("lev_num")

	slot0.lev_num:setString("")

	slot0.slide_goods_item = slot0.main_container:getChildByName("slide_goods_item")

	slot0.slide_goods_item:setScrollBarEnabled(false)

	slot0.lock_image = slot0.main_container:getChildByName("lock_image")
	slot0.btn_change_advance = slot0.lock_image:getChildByName("btn_change_advance")

	slot0.lock_image:setVisible(true)

	if uv0:getGiftStatus() == 1 then
		slot0.lock_image:setVisible(false)
	else
		slot0.lock_image:setVisible(true)
	end

	slot1 = slot0.main_container:getChildByName("goods_item")
	slot0.reward_goods_item = CommonScrollViewSingleLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 635,
		item_height = 116,
		space_y = 0,
		col = 1,
		need_dynamic = true
	})

	slot0.reward_goods_item:setSwallowTouches(true)
	slot0.reward_goods_item:registerScriptHandlerSingle(handler(slot0, slot0.createTaskCell), ScrollViewFuncType.CreateNewCell)
	slot0.reward_goods_item:registerScriptHandlerSingle(handler(slot0, slot0.numberOfTaskCells), ScrollViewFuncType.NumberOfCells)
	slot0.reward_goods_item:registerScriptHandlerSingle(handler(slot0, slot0.updateTaskCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function OrderActionRewardPanel1.createTaskCell(slot0)
	return OrderActiodRewardItem1.new()
end

function OrderActionRewardPanel1.numberOfTaskCells(slot0)
	if not slot0.reward_list then
		return 0
	end

	return #slot0.reward_list
end

function OrderActionRewardPanel1.updateTaskCellByIndex(slot0, slot1, slot2)
	if not slot0.reward_list then
		return
	end

	if not slot0.reward_list[slot2] then
		return
	end

	slot1:setData(slot3)
	slot0:setSlideGoodsItem(slot3.lev)
end

function OrderActionRewardPanel1.setSlideGoodsItem(slot0, slot1)
	slot2 = #uv0[slot0.cur_period] or 1

	if slot0.cur_move_num == uv1(slot1 * 0.1) then
		return
	end

	slot0.cur_move_num = slot1

	if slot2 <= slot0.cur_move_num * 10 then
		slot3 = slot2
	end

	if slot3 == 0 then
		slot3 = 1
	end

	if not uv0[slot0.cur_period] then
		return
	end

	if not uv0[slot0.cur_period][slot3] then
		return
	end

	slot0.lev_num:setString("(" .. slot4.lev .. ")")

	if not slot0.common_item then
		slot0.common_item = BackPackItem.new(nil, true, nil, 0.8)

		slot0.main_container:addChild(slot0.common_item)
		slot0.common_item:setPosition(cc.p(263, 58))
		slot0.common_item:setDefaultTip()
	end

	if slot4.reward and next(slot4.reward) ~= nil then
		slot0.common_item:setBaseData(slot4.reward[1][1], slot4.reward[1][2])
		slot0.common_item:setVisible(true)
	else
		slot0.common_item:setVisible(false)
	end

	slot0.slide_goods_list = commonShowSingleRowItemList(slot0.slide_goods_item, slot0.slide_goods_list, slot4.rmb_reward or {}, {
		scale = 0.8,
		max_count = 3
	})
end

function OrderActionRewardPanel1.setChangeLevelStatus(slot0, slot1)
	if uv0 and uv0[slot0.cur_period] then
		slot0.reward_list = {}
		slot5 = slot0.cur_period

		for slot5, slot6 in pairs(uv0[slot5]) do
			slot6.cur_lev = slot1
			slot6.status = 0
			slot6.rmb_status = 0
			slot6.is_locak = uv1:getGiftStatus()

			if uv1:getLevShowData(slot6.lev) then
				slot6.status = slot7.status
				slot6.rmb_status = slot7.rmb_status
			end

			if slot6.status ~= 1 or slot6.rmb_status ~= 1 then
				uv2(slot0.reward_list, slot6)
			end
		end

		if next(slot0.reward_list) == nil then
			if slot0.common_item then
				slot0.common_item:setVisible(false)
			end

			if slot0.slide_goods_item then
				slot0.slide_goods_item:setVisible(false)
			end

			slot0.lev_num:setString(TI18N("(领取完毕)"))
			slot0.reward_goods_item:reloadData()
			commonShowEmptyIcon(slot0.main_container, true, {
				font_size = 22,
				scale = 1,
				text = TI18N("已领取所有奖励")
			})
		else
			uv3(slot0.reward_list, function (slot0, slot1)
				return slot0.lev < slot1.lev
			end)
			slot0.reward_goods_item:reloadData()
		end
	end
end

function OrderActionRewardPanel1.registerEvents(slot0)
	if not slot0.update_lev_event then
		slot0.update_lev_event = GlobalEvent:getInstance():Bind(OrderActionEvent.OrderAction_Updata_LevExp_Event, function (slot0)
			if slot0 then
				uv0:setChangeLevelStatus(slot0.lev)
			end
		end)
	end

	if not slot0.update_levreward_event then
		slot0.update_levreward_event = GlobalEvent:getInstance():Bind(OrderActionEvent.OrderAction_LevReward_Event, function (slot0)
			uv0:setChangeLevelStatus(slot0)
		end)
	end

	if not slot0.update_lockopen_event then
		slot0.update_lockopen_event = GlobalEvent:getInstance():Bind(OrderActionEvent.OrderAction_BuyGiftCard_Event, function ()
			uv1:setChangeLevelStatus(uv0:getCurLev())

			if uv0:getGiftStatus() == 1 then
				uv1.lock_image:setVisible(false)
			else
				uv1.lock_image:setVisible(true)
			end
		end)
	end

	registerButtonEventListener(slot0.btn_change_advance, function ()
		uv0:openBuyCardView(true)
	end, true, 1)
end

function OrderActionRewardPanel1.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function OrderActionRewardPanel1.DeleteMe(slot0)
	if slot0.update_lev_event then
		GlobalEvent:getInstance():UnBind(slot0.update_lev_event)

		slot0.update_lev_event = nil
	end

	if slot0.update_levreward_event then
		GlobalEvent:getInstance():UnBind(slot0.update_levreward_event)

		slot0.update_levreward_event = nil
	end

	if slot0.update_lockopen_event then
		GlobalEvent:getInstance():UnBind(slot0.update_lockopen_event)

		slot0.update_lockopen_event = nil
	end

	if slot0.reward_goods_item then
		slot0.reward_goods_item:DeleteMe()

		slot0.reward_goods_item = nil
	end

	if slot0.slide_goods_list then
		for slot4, slot5 in pairs(slot0.slide_goods_list) do
			slot5:DeleteMe()
		end

		slot0.slide_goods_list = nil
	end

	if slot0.common_item then
		slot0.common_item:DeleteMe()

		slot0.common_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

OrderActiodRewardItem1 = class("OrderActiodRewardItem1", function ()
	return ccui.Widget:create()
end)

function OrderActiodRewardItem1.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function OrderActiodRewardItem1.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("orderaction/reward_item1"))

	slot0:setContentSize(cc.size(635, 116))
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.goods_item = slot1:getChildByName("goods_item")

	slot0.goods_item:setScrollBarEnabled(false)

	slot0.mark = slot1:getChildByName("mark")

	slot0.mark:setVisible(false)

	slot0.lev_num = slot1:getChildByName("lev_num")

	slot0.lev_num:setString("")

	slot0.common_goods_item = BackPackItem.new(nil, true, nil, 0.8)

	slot1:addChild(slot0.common_goods_item)
	slot0.common_goods_item:setPosition(cc.p(263, 58))
	slot0.common_goods_item:addCallBack(function ()
		if uv0.data and uv0.data.lev and uv0.data.status and uv0.data.status == 0 then
			uv1:send25304(uv0.data.lev)
		end
	end)
end

function OrderActiodRewardItem1.register_event(slot0)
end

function OrderActiodRewardItem1.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.lev_num:setString(slot1.lev or 1)

	slot2 = true

	if slot0.common_goods_item then
		if slot1.reward and slot1.reward[1] then
			slot0.common_goods_item:setBaseData(slot1.reward[1][1], slot1.reward[1][2])
			slot0.common_goods_item:setVisible(true)
			slot0.common_goods_item:showOrderWarLock(true)
		else
			slot0.common_goods_item:setVisible(false)
		end

		if slot1.status == 1 then
			slot0.common_goods_item:IsGetStatus(true)
		else
			slot0.common_goods_item:IsGetStatus(false)
		end
	end

	slot3 = true

	if slot1.lev <= slot1.cur_lev then
		if slot0.common_goods_item then
			slot0.common_goods_item:showOrderWarLock(false)

			slot2 = false
		end

		if slot1.is_locak == 1 then
			slot3 = false
		else
			slot3 = true
		end
	else
		if slot0.common_goods_item then
			slot0.common_goods_item:showOrderWarLock(true)

			slot2 = true
		end

		slot3 = true
	end

	if slot2 == false then
		if slot1.status == 1 then
			slot0.common_goods_item:showItemEffect(false)
		else
			slot0.common_goods_item:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
		end
	else
		slot0.common_goods_item:showItemEffect(false)
	end

	if slot1.status ~= 0 then
		slot2 = false
	end

	slot0.common_goods_item:setDefaultTip(slot2)

	slot4 = true
	slot5 = nil

	if uv0:getGiftStatus() == 1 and slot1.rmb_status == 0 and slot1.lev <= slot1.cur_lev then
		slot4 = false
	end

	if slot4 == false then
		slot5 = 263
	end

	slot0.item_list = commonShowSingleRowItemList(slot0.goods_item, slot0.item_list, slot1.rmb_reward or {}, {
		start_x = 10,
		scale = 0.8,
		max_count = 3,
		lock = slot3,
		is_tip = slot4,
		show_effect_id = slot5,
		callback = function ()
			if uv0.data and uv0.data.lev and uv0.data.rmb_status and uv0.data.rmb_status == 0 then
				uv1:send25304(uv0.data.lev)
			end
		end
	})
end

function OrderActiodRewardItem1.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	if slot0.common_goods_item then
		slot0.common_goods_item:DeleteMe()

		slot0.common_goods_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
