GiftSelectPanel = GiftSelectPanel or BaseClass(BaseView)

function GiftSelectPanel.__init(slot0)
	slot0.layout_name = "backpack/gift_select"
	slot0.win_type = WinType.Mini

	slot0:config()
end

function GiftSelectPanel.config(slot0)
	slot0.WIDTH = 460
	slot0.HEIGHT = 350
	slot0.GOODS_WIDTH = 68
	slot0.select_type = 1
	slot0.ctrl = BackpackController:getInstance()
end

function GiftSelectPanel.open_callback(slot0)
	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot1 = slot0.main_panel:getContentSize()
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.top_panel = slot0.main_panel:getChildByName("top_panel")

	slot0.top_panel:getChildByName("title_label"):setString(TI18N("自选礼包"))

	slot0.use_btn = slot0.main_panel:getChildByName("use_btn")

	slot0.use_btn:getChildByName("label"):setString(TI18N("使用"))

	slot0.scroll_view = createScrollView(585, 495, slot1.width / 2, 105, slot0.main_panel, ccui.ScrollViewDir.vertical)

	slot0.scroll_view:setAnchorPoint(cc.p(0.5, 0))

	slot0.desc_label = createRichLabel(24, Config.ColorData.data_color4[156], cc.p(0.5, 1), cc.p(slot1.width / 2, 655), 2, nil, 400)

	slot0.main_panel:addChild(slot0.desc_label)
end

function GiftSelectPanel.updateGiftList(slot0, slot1, slot2, slot3, slot4)
	slot0.giftid = slot1
	slot0.giftBid = slot2
	slot0.goods_list = slot3 or {}
	slot0.choose_num = slot4 or 1

	slot0.desc_label:setString(string.format(TI18N("请从以下奖励中选择%s个"), slot0.choose_num))

	if not slot0.item_list then
		slot0.item_list = {}
	end

	if not slot0.name_list then
		slot0.name_list = {}
	end

	slot5 = slot0.scroll_view:getContentSize()
	slot6 = true
	slot7 = 0
	slot8 = RoleController:getInstance():getRoleVo()
	slot9 = {}

	for slot13, slot14 in ipairs(slot0.goods_list) do
		if slot14.min_lev <= slot8.lev and slot8.lev <= slot14.max_lev then
			if slot9[slot14.sort_id] == nil then
				slot9[slot14.sort_id] = {}
			end

			table.insert(slot9[slot14.sort_id], slot14)

			if #slot9[slot14.sort_id] > 1 then
				slot6 = false
			end
		end
	end

	for slot13, slot14 in pairs(slot9) do
		slot7 = slot7 + 1
	end

	slot16 = slot5.width

	slot0.scroll_view:setInnerContainerSize(cc.size(slot16, math.max(slot5.height, slot7 * 130 + 20)))

	slot11 = 1

	for slot15, slot16 in pairs(slot9) do
		slot17, slot18 = nil
		slot17 = slot5.width / 2
		slot18 = slot10 - 130 * slot11

		if not slot0.item_list[slot11] then
			slot0.item_list[slot11] = GiftSelectItem.new(slot11, slot6)

			slot0.scroll_view:addChild(slot0.item_list[slot11])
		end

		slot22 = cc.p

		slot0.item_list[slot11]:setPosition(slot22(slot17, slot18))

		slot0.item_data = {}

		for slot22, slot23 in ipairs(slot16) do
			table.insert(slot0.item_data, {
				sort_id = slot15,
				base_id = slot23.bid,
				quantity = slot23.num
			})
		end

		slot0.item_list[slot11]:setData(slot0.item_data)
		slot0.item_list[slot11]:addCallBack(function (slot0, slot1)
			uv0:clickCallBack(slot0.index or 1, slot1)
		end)

		slot11 = slot11 + 1
	end

	slot0.select_list = {}
end

function GiftSelectPanel.clickCallBack(slot0, slot1, slot2)
	if slot0.select_list and #slot0.select_list > 0 then
		for slot6 = #slot0.select_list, 1, -1 do
			if slot0.select_list[slot6].goods_id == slot1 then
				table.remove(slot0.select_list, slot6)
				slot0:setSelectedState(slot1, false)

				return
			end
		end
	end

	if slot0.choose_num <= #slot0.select_list then
		slot0:setSelectedState(table.remove(slot0.select_list, 1).goods_id, false)
	end

	table.insert(slot0.select_list, {
		goods_id = slot1
	})
	slot0:setSelectedState(slot1, true)
end

function GiftSelectPanel.register_event(slot0)
	slot0.use_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:onUseBtn()
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.ctrl:closeGiftSelectPanel()
		end
	end)
end

function GiftSelectPanel.onUseBtn(slot0)
	if not slot0.gift_vo then
		return
	end

	if slot0.select_list and slot0.choose_num <= #slot0.select_list then
		slot1 = slot0.giftid
		slot2 = {}
		slot3 = 1

		for slot7, slot8 in ipairs(slot0.select_list) do
			slot9 = {}

			if slot0.item_list then
				for slot13, slot14 in pairs(slot0.item_list) do
					if slot14.index and slot14.index == slot8.goods_id then
						slot9 = slot14.vo

						break
					end
				end
			end

			slot10 = -1

			for slot14, slot15 in ipairs(slot9) do
				table.insert(slot2, {
					name = 1,
					str = "",
					value = slot15.base_id
				})

				slot10 = slot15.sort_id
			end

			if slot10 >= 0 then
				table.insert(slot2, {
					name = 2,
					str = "",
					value = slot10
				})
			end

			slot3 = slot8.num
		end

		if BackpackController:getInstance():getModel():getPackItemNumByBid(BackPackConst.Bag_Code.BACKPACK, slot0.giftBid) > 1 and slot0.choose_num == 1 then
			if Config.ItemData.data_get_data(slot0.gift_vo.base_id) and slot6.overlap == 1 then
				slot0.ctrl:sender10515(slot1, 1, slot2)
				slot0.ctrl:closeGiftSelectPanel()
			else
				slot0.ctrl:openBatchUseItemView(true, slot0.gift_vo, 1, slot2)
			end
		else
			slot0.ctrl:sender10515(slot1, 1, slot2)
			slot0.ctrl:closeGiftSelectPanel()
		end
	else
		message2(StringFormat(TI18N("请选择{0}个物品！"), slot0.choose_num))
	end
end

function GiftSelectPanel.setSelectedState(slot0, slot1, slot2)
	if slot0.item_list then
		for slot6, slot7 in pairs(slot0.item_list) do
			if slot7.index and slot7.index == slot1 then
				slot7:setSelected(slot2)
			end
		end
	end
end

function GiftSelectPanel.createTitleTxt(slot0, slot1, slot2, slot3)
	slot4 = ccui.Widget:create()

	slot4:setAnchorPoint(cc.p(0.5, 1))

	slot5 = cc.size(400, 20)

	slot4:setContentSize(slot5)
	slot4:setPosition(cc.p(slot2, slot3))

	slot6 = createSprite(PathTool.getCommonRes("line7"), 0, 20)

	slot6:setAnchorPoint(cc.p(0, 1))
	slot4:addChild(slot6)

	slot6 = createSprite(PathTool.getCommonRes("line7"), slot5.width, 20)

	slot6:setFlippedX(true)
	slot6:setAnchorPoint(cc.p(1, 1))
	slot4:addChild(slot6)

	slot7 = createLabel(22, Config.ColorData.data_color4[1], nil, slot5.width / 2, 12, "", slot0.scroll_view, nil, cc.p(0, 0))

	slot7:setString(slot1)
	slot4:addChild(slot7)

	return slot4, slot7
end

function GiftSelectPanel.close_callback(slot0, ...)
	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil
	slot0.select_list = nil
	slot0.name_list = nil
end

function GiftSelectPanel.openRootWnd(slot0, slot1)
	slot2 = 1
	slot0.gift_vo = slot1

	if not slot1 then
		return
	end

	slot3 = slot1.id
	slot5 = {}

	if Config.GiftData.data_choose_gift[slot1.base_id] then
		for slot10, slot11 in pairs(Config.GiftData.data_choose_gift[slot4]) do
			table.insert(slot5, slot11)
		end
	end

	table.sort(slot5, SortTools.KeyLowerSorter("sort_id"))
	slot0:updateGiftList(slot3, slot4, slot5, slot2)
end

GiftSelectItem = class("GiftSelectItem", function ()
	return ccui.Widget:create()
end)

function GiftSelectItem.ctor(slot0, slot1, slot2)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("backpack/gift_select_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.select_btn = slot0.container:getChildByName("select_btn")
	slot0.goods_con = slot0.container:getChildByName("goods_con")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.goods_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.goods_con:getContentSize(), {
		start_y = 0,
		start_x = 0,
		space_x = 20,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.9,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.9,
		item_height = BackPackItem.Height * 0.9
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.is_single = slot2

	slot0:setTouchEnabled(true)

	slot0.index = slot1 or 1
	slot0.is_break = false
	slot0.old_lev = 0
	slot0.attr_list = {}

	slot0:register_event()
	slot0.select_btn:setSelected(false)
end

function GiftSelectItem.register_event(slot0)
	registerButtonEventListener(slot0, function ()
		uv0:clickSelect()
	end, false, 2)
	slot0.select_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.check_box_status = uv0.select_btn:isSelected()
		elseif slot1 == ccui.TouchEventType.ended then
			uv0:clickSelect()
		elseif slot1 == ccui.TouchEventType.canceled then
			uv0.select_btn:setSelected(uv0.check_box_status or false)
		end
	end)
end

function GiftSelectItem.clickSelect(slot0)
	if slot0.call_fun then
		slot0:call_fun(slot0.vo)
	end
end

function GiftSelectItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function GiftSelectItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.vo = slot1
	slot2 = {}

	for slot6, slot7 in ipairs(slot0.vo) do
		if deepCopy(Config.ItemData.data_get_data(slot7.base_id)) then
			slot8.quantity = slot7.quantity or 1

			table.insert(slot2, slot8)
		end
	end

	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5.effect = false

			slot5:setDefaultTip()
			slot5:setSwallowTouches(true)
		end

		if uv0.is_single then
			if uv0.item_name == nil then
				uv0.item_name = createLabel(26, Config.ColorData.data_color4[156], nil, 180, 65, slot0[1].data.name .. "X" .. slot0[1].data.quantity, uv0.container, nil, cc.p(0, 0.5))
			else
				uv0.item_name:setVisible(true)
				uv0.item_name:setString(slot1 .. "X" .. slot2)
			end

			uv0.item_scrollview:setClickEnabled(false)
		elseif uv0.item_name ~= nil then
			uv0.item_name:setVisible(false)
			uv0.item_scrollview:setClickEnabled(true)
		end
	end)
	slot0.item_scrollview:setData(slot2)
end

function GiftSelectItem.setSelected(slot0, slot1)
	slot0.select_btn:setSelected(slot1 or false)
end

function GiftSelectItem.isHaveData(slot0)
	if slot0.vo then
		return true
	end

	return false
end

function GiftSelectItem.getData(slot0)
	return slot0.vo
end

function GiftSelectItem.DeleteMe(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()

		slot0.goods_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()

	slot0.vo = nil
end
