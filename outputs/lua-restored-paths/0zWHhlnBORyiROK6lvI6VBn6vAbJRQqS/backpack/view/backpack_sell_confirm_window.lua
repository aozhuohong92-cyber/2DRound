BackPackSellConfirmWindow = BackPackSellConfirmWindow or BaseClass(BaseView)
slot0 = BackpackController:getInstance()
slot1 = BackpackController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert

function BackPackSellConfirmWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "backpack/backpack_sell_confirm_window"
	slot0.wait_sell_list = {}
end

function BackPackSellConfirmWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.total_width = slot0.container:getContentSize().width
	slot0.cancel_btn = slot0.container:getChildByName("cancel_btn")
	slot0.confirm_btn = slot0.container:getChildByName("confirm_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("取消"))

	slot0.confirm_label = slot0.confirm_btn:getChildByName("label")
	slot0.win_title = slot0.container:getChildByName("win_title")
	slot0.sell_title = slot0.container:getChildByName("sell_title")
	slot1 = slot0.container:getChildByName("sell_desc")

	slot1:setString("")

	slot0.item_scrollview = slot0.container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)

	slot0.rich_desc = createRichLabel(24, cc.c4b(149, 83, 34, 255), cc.p(0.5, 0.5), cc.p(0, 0), nil, nil, 1000)

	slot1:addChild(slot0.rich_desc)
	slot0.rich_desc:setVisible(false)
end

function BackPackSellConfirmWindow.register_event(slot0)
	registerButtonEventListener(slot0.cancel_btn, function ()
		uv0:openSellConfirmWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.confirm_btn, function ()
		if uv0.bag_code == BackPackConst.Bag_Code.EQUIPS or BackPackConst.Bag_Code.BACKPACK then
			uv0:onComfirm()
		end
	end, true, 1)
	slot0:addGlobalEvent(BackpackEvent.BACKPACK_SELL_CONFIRM, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0.items)
	end)
end

function BackPackSellConfirmWindow.openRootWnd(slot0, slot1, slot2, slot3, slot4)
	slot0.callback = slot1
	slot0.bag_code = slot2
	slot0.is_show_tips = slot3
	slot5, slot6 = nil

	if slot2 == BackPackConst.Bag_Code.EQUIPS then
		slot5 = TI18N("装备出售")
		slot6 = TI18N("出售")
	else
		slot5 = "战技分解"
		slot6 = "分解"
	end

	slot0.confirm_lbl = slot6

	slot0.win_title:setString(slot5)
	slot0.sell_title:setString(uv0(TI18N("本次%s包含%d件装备,可获得如下奖励："), slot6, slot4))
	slot0.rich_desc:setString(uv0(TI18N("(注意：本次出售包含<div fontcolor=#d95014>橙色</div>或<div fontcolor=#d95014>红色</div>装备！)")))

	if not slot3 then
		slot0.confirm_label:setString(slot6)
	else
		slot0.rich_desc:setVisible(true)

		slot0.timer = 3

		setChildUnEnabled(true, slot0.confirm_btn)
		slot0.confirm_btn:setTouchEnabled(false)
		slot0.confirm_label:setString(TI18N(uv0("%s(%d)", slot6, slot0.timer)))
		slot0.confirm_label:enableOutline(Config.ColorData.data_color4[84], 2)
		slot0:openTimer(true)
	end
end

function BackPackSellConfirmWindow.openTimer(slot0, slot1)
	if slot1 == true then
		if slot0.show_tips_ticket == nil then
			slot0.show_tips_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0.timer = uv0.timer - 1

				if uv0.timer > 0 then
					uv0.confirm_label:setString(string.format("%s(%s)", uv0.confirm_lbl, uv0.timer))
				else
					setChildUnEnabled(false, uv0.confirm_btn)
					uv0.confirm_btn:setTouchEnabled(true)

					if uv0.confirm_label then
						uv0.confirm_label:enableOutline(Config.ColorData.data_color4[264], 2)
					end

					uv0.confirm_label:setString(string.format("%s", uv0.confirm_lbl))

					if uv0.show_tips_ticket ~= nil then
						GlobalTimeTicket:getInstance():remove(uv0.show_tips_ticket)

						uv0.show_tips_ticket = nil
					end
				end
			end, 1)
		end
	elseif slot0.show_tips_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.show_tips_ticket)

		slot0.show_tips_ticket = nil
	end
end

function BackPackSellConfirmWindow.onComfirm(slot0)
	if slot0.callback then
		slot0.callback()
	end

	uv0:openSellConfirmWindow(false)
end

function BackPackSellConfirmWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		uv0(slot2, {
			slot7.bid,
			slot7.num,
			Config.ItemData.data_get_data(slot7.bid).name
		})
	end

	if #slot2 == 0 then
		commonShowEmptyIcon(slot0.item_scrollview, true, {
			font_size = 22,
			scale = 1,
			text = TI18N("无出售奖励")
		})

		return
	end

	slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot2, {
		scale = 1,
		max_count = 5,
		is_center = true
	})
end

function BackPackSellConfirmWindow.close_callback(slot0)
	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	doStopAllActions(slot0.item_scrollview)
	slot0:openTimer(false)
end
