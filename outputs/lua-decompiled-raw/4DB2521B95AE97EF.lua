ReturnActionShopPanel = class("ReturnActionShopPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ReturnActionController:getInstance():getModel()
slot2 = Config.HolidayReturnNewData.data_constant
slot3 = table.sort
slot4 = {
	TI18N("活动每日每人限兑%d次"),
	TI18N("活动每人总限兑%d次")
}
slot5 = string.format

function ReturnActionShopPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.first_come = true

	if uv0.exchange_item_id then
		slot0.summon_item_bid = uv0.exchange_item_id.val
	end

	slot0:configUI()
	slot0:register_event()
end

function ReturnActionShopPanel.configUI(slot0)
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

	slot0.desc_txt:setPosition(cc.p(30, 56))
	slot0.desc_txt:setTextColor(cc.c4b(255, 221, 149, 255))
	slot0.desc_txt:enableOutline(cc.c4b(77, 25, 33, 255), 1)

	slot0.icon = slot2:getChildByName("icon")
	slot0.icon_count = slot2:getChildByName("icon_count")

	slot0.icon_count:setVisible(true)
	slot0.icon_count:setString("")

	slot0.banner_spr = slot2:getChildByName("title_img")
	slot0.btn_rule = slot2:getChildByName("btn_rule")

	slot0.btn_rule:setScale(0.8)

	slot0.cur_cum = createRichLabel(20, cc.c4b(255, 221, 149, 255), cc.p(1, 0.5), cc.p(680, 24), nil, , 300)

	slot2:addChild(slot0.cur_cum)

	slot3 = slot1:getChildByName("goods_item")
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot3, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 3,
		space_x = 0,
		item_width = 688,
		item_height = 146,
		space_y = 3,
		col = 1,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(true)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createTeskCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfTeskCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateTeskCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0:setLoadBanner()
	uv0:setShopData()
	uv1:sender27914()
	ActionController:getInstance():setReturnActionShopFirstRedStatus(false)
end

function ReturnActionShopPanel.createTeskCell(slot0)
	return ReturnActionShopItem.new()
end

function ReturnActionShopPanel.numberOfTeskCells(slot0)
	if not slot0.task_items then
		return 0
	end

	return #slot0.task_items
end

function ReturnActionShopPanel.updateTeskCellByIndex(slot0, slot1, slot2)
	if not slot0.task_items then
		return
	end

	if not slot0.task_items[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ReturnActionShopPanel.setLoadBanner(slot0)
	if Config.ItemData.data_get_data(slot0.summon_item_bid) and slot0.icon then
		loadSpriteTexture(slot0.icon, PathTool.getItemRes(slot1.icon), LOADTEXT_TYPE)
		slot0.icon:setScale(0.3)
	end

	slot0.icon_count:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid) or 0)

	slot4 = "txt_cn_returnaction4"

	if uv0:getReturnActionData(slot0.holiday_bid) then
		slot4 = slot3.panel_res
	end

	if not slot0.load_banner then
		slot0.load_banner = loadSpriteTextureFromCDN(slot0.banner_spr, PathTool.getReturnActionRes(slot4), ResourcesType.single, slot0.load_banner)
	end

	if uv1 and uv1.exchange_item_id and slot0.summon_item_bid and Config.ItemData.data_get_data(slot0.summon_item_bid) then
		slot0.desc_txt:setString(uv2(TI18N("每日与回归玩家完成指定玩法 收集%s兑好礼"), slot6.name))
	end
end

function ReturnActionShopPanel.register_event(slot0)
	if not slot0.shop_event then
		slot0.shop_event = GlobalEvent:getInstance():Bind(ReturnActionEvent.Shop_Event, function (slot0)
			setCountDownTime(uv0.label_time, slot0.endtime - GameNet:getInstance():getTime())

			if uv0.cur_cum then
				uv0.cur_cum:setString(uv1(TI18N("今天已获得：%d/%d"), slot0.get_count, slot0.limit_count))
			end

			uv0:shopItemData()
		end)
	end

	if not slot0.update_add_good_event then
		slot0.update_add_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end

	if not slot0.update_delete_good_event then
		slot0.update_delete_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end

	if not slot0.update_modify_good_event then
		slot0.update_modify_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end

	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(uv0.tips_2.desc, slot1:getTouchBeganPosition(), nil, , 500)
	end, true, 1, nil, 0.8)
end

function ReturnActionShopPanel.updateItemNum(slot0, slot1, slot2)
	if slot0.summon_item_bid then
		if slot1 and slot2 then
			if slot1 == BackPackConst.Bag_Code.BACKPACK then
				for slot6, slot7 in pairs(slot2) do
					if slot7 and slot7.base_id and slot0.summon_item_bid == slot7.base_id then
						slot0.icon_count:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid))

						break
					end
				end
			end
		else
			slot0.icon_count:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid))
		end
	end
end

function ReturnActionShopPanel.shopItemData(slot0)
	slot0.task_items = uv0:getShopData()

	if not slot0.task_items then
		return
	end

	for slot4, slot5 in pairs(slot0.task_items) do
		slot5.count, slot5.totle, slot5.sort = slot0:remainCount(slot5)
	end

	uv1(slot0.task_items, SortTools.tableCommonSorter({
		{
			"sort",
			true
		},
		{
			"id",
			false
		}
	}))

	if slot0.first_come == true then
		slot0.first_come = false

		slot0.item_scrollview:reloadData()
	else
		slot0.item_scrollview:resetCurrentItems()
	end
end

function ReturnActionShopPanel.remainCount(slot0, slot1)
	slot2 = 0
	slot3 = 0
	slot4 = 10

	if uv0:getServerShopData(slot1.id) then
		if slot1.sub_type == 1 then
			slot3 = slot1.r_limit_day
			slot2 = slot1.r_limit_day - slot5.day_num
		elseif slot1.sub_type == 2 then
			slot3 = slot1.r_limit_all
			slot2 = slot1.r_limit_all - slot5.all_num
		end

		if slot2 <= 0 then
			slot2 = 0
			slot4 = 0
		end
	end

	return slot2, slot3, slot4
end

function ReturnActionShopPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ReturnActionShopPanel.DeleteMe(slot0)
	doStopAllActions(slot0.label_time)

	if slot0.update_add_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_add_good_event)

		slot0.update_add_good_event = nil
	end

	if slot0.update_delete_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_delete_good_event)

		slot0.update_delete_good_event = nil
	end

	if slot0.update_modify_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_modify_good_event)

		slot0.update_modify_good_event = nil
	end

	if slot0.shop_event then
		GlobalEvent:getInstance():UnBind(slot0.shop_event)

		slot0.shop_event = nil
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

ReturnActionShopItem = class("ReturnActionShopItem", function ()
	return ccui.Widget:create()
end)

function ReturnActionShopItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ReturnActionShopItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("returnaction/returnaction_shop_item"))

	slot0:setContentSize(cc.size(688, 146))
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.title = slot1:getChildByName("title")

	slot0.title:setString("")

	slot0.remain_count = slot1:getChildByName("remain_count")

	slot0.remain_count:setString("")

	slot0.btn_change = slot1:getChildByName("btn_change")

	slot0.btn_change:getChildByName("Text_11"):setString(TI18N("兑 换"))

	slot0.goods = slot1:getChildByName("goods")

	slot0.goods:setScrollBarEnabled(false)

	slot0.change_current_item = BackPackItem.new(nil, true, nil, 0.8)

	slot1:addChild(slot0.change_current_item)
	slot0.change_current_item:setPosition(cc.p(78, 56))
	slot0.change_current_item:setDefaultTip()
end

function ReturnActionShopItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_change, function ()
		if uv0.data and uv0.data.id and uv0.data.expend then
			if uv0.data.expend[1][2] <= BackpackController:getInstance():getModel():getItemNumByBid(uv0.data.expend[1][1]) then
				uv1:sender27915(uv0.data.id)
			else
				message(TI18N("物品不足~~~"))
			end
		end
	end, true, 1)
end

function ReturnActionShopItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.title:setString(uv0(uv1[slot1.sub_type], slot1.totle))
	slot0.remain_count:setString(TI18N("活动剩余: ") .. slot1.count)

	if slot1.count == 0 then
		setChildUnEnabled(true, slot0.btn_change)
		slot0.btn_change:setTouchEnabled(false)
	else
		setChildUnEnabled(false, slot0.btn_change)
		slot0.btn_change:setTouchEnabled(true)
	end

	if slot1.expend and slot1.expend[1] and slot0.change_current_item then
		slot0.change_current_item:setBaseData(slot1.expend[1][1], slot1.expend[1][2])
	end

	slot0.change_item_list = commonShowSingleRowItemList(slot0.goods, slot0.change_item_list, slot1.award or {}, {
		scale = 0.8,
		max_count = 3,
		is_center = false,
		space_x = 10
	})
end

function ReturnActionShopItem.DeleteMe(slot0)
	if slot0.change_current_item then
		slot0.change_current_item:DeleteMe()

		slot0.change_current_item = nil
	end

	if slot0.change_item_list then
		for slot4, slot5 in pairs(slot0.change_item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end

		slot0.change_item_list = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
