BackPackEquipInterceptWindow = BackPackEquipInterceptWindow or BaseClass(BaseView)
slot0 = table.insert
slot1 = BackpackController:getInstance()

function BackPackEquipInterceptWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.ctrl = BackpackController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.win_type = WinType.Mini
	slot0.layout_name = "backpack/backpack_equip_intercept_window"
end

function BackPackEquipInterceptWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("熔炼确认"))
	slot1:getChildByName("sell_title"):setString(TI18N("选择熔炼装备中发现下列强力装备"))

	slot0.cancel_btn = slot1:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("仍然熔炼"))

	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot0.confirm_btn_label = slot0.confirm_btn:getChildByName("label")

	slot0.confirm_btn_label:setString(TI18N("保留装备"))

	slot0.list_view = slot1:getChildByName("list_view")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.list_view, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.list_view:getContentSize(), {
		start_y = 6,
		once_num = 4,
		start_x = 16,
		item_width = 119,
		space_x = 32,
		row = 4,
		item_height = 119,
		space_y = 10,
		col = 4,
		need_dynamic = true,
		item_class = BackPackItem
	})
	slot0.sell_desc = slot1:getChildByName("sell_desc")

	slot0.sell_desc:setString(TI18N("是否保留以上装备"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.container = slot1
end

function BackPackEquipInterceptWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openBackPackEquipInterceptWindow(false)
		end
	end)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openBackPackEquipInterceptWindow(false)
		end
	end)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openSellWindow(true, BackPackConst.Bag_Code.EQUIPS, uv1.item_list)
			uv0:openBackPackEquipInterceptWindow(false)
		end
	end)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openBackPackEquipInterceptWindow(false)

			if uv1.goto_partner == true then
				MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.partner)
			else
				uv0:openSellWindow(true, BackPackConst.Bag_Code.EQUIPS, uv1.surplus_list)
			end
		end
	end)
end

function BackPackEquipInterceptWindow.openRootWnd(slot0, slot1, slot2)
	slot0.item_list = slot1
	slot0.intercept_list = slot2
	slot0.surplus_list = {}
	slot0.goto_partner = false

	slot0:checkInterceptList()
end

function BackPackEquipInterceptWindow.checkInterceptList(slot0)
	if slot0.intercept_list == nil or next(slot0.intercept_list) == nil then
		return
	end

	if slot0.item_list == nil or next(slot0.item_list) == nil then
		return
	end

	slot1 = {
		[slot6.id] = slot6
	}

	for slot5, slot6 in ipairs(slot0.intercept_list) do
		-- Nothing
	end

	slot0.surplus_list = {}

	for slot5, slot6 in ipairs(slot0.item_list) do
		if slot1[slot6.id] == nil then
			uv0(slot0.surplus_list, slot6)
		end
	end

	if next(slot0.surplus_list) == nil then
		slot0.goto_partner = true

		slot0.sell_desc:setVisible(false)
		slot0.confirm_btn_label:setString(TI18N("前往穿戴"))
	end

	slot0:setInterceptEquipList()
end

function BackPackEquipInterceptWindow.setInterceptEquipList(slot0)
	if slot0.intercept_list == nil or next(slot0.intercept_list) == nil then
		return
	end

	slot1 = {}

	for slot6, slot7 in ipairs(slot0.intercept_list) do
		uv0(slot1, DeepCopy(slot7))
	end

	table.sort(slot1, SortTools.tableUpperSorter({
		"quality",
		"gemstone_sort",
		"sort"
	}))
	slot0.item_scrollview:setData(slot1, nil, nil, {
		is_show_tips = true,
		is_other = false
	})
end

function BackPackEquipInterceptWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openBackPackEquipInterceptWindow(false)
end
