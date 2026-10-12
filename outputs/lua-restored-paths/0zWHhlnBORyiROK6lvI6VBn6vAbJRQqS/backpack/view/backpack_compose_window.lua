BackPackComposeWindow = BackPackComposeWindow or BaseClass(BaseView)
slot0 = table.sort

function BackPackComposeWindow.__init(slot0, slot1)
	slot0.ctrl = BackpackController:getInstance()
	slot0.is_full_screen = false
	slot0.layout_name = "backpack/backpack_compose_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("backpack", "backpack"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Big
	slot0.compose_list = {}
	slot0.view_list = {}
	slot0.select_btn = nil
	slot0.data = slot1
end

function BackPackComposeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.fast_compose_btn = slot0.main_panel:getChildByName("fast_compose_btn")

	slot0.fast_compose_btn:setTitleText(TI18N("一键合成"))
	slot0.fast_compose_btn:getTitleRenderer():enableOutline(cc.c4b(2, 0, 25, 255), 2)

	slot0.compose_btn = slot0.main_panel:getChildByName("compose_btn")

	slot0.compose_btn:setTitleText(TI18N("合成"))
	slot0.compose_btn:getTitleRenderer():enableOutline(cc.c4b(2, 0, 25, 255), 2)

	slot0.title = slot0.main_panel:getChildByName("title")

	slot0.title:setString(TI18N("物品合成"))

	slot0.cost_label = createRichLabel(24, Config.ColorData.data_color4[175], cc.p(0, 0), cc.p(265, 200), 500)

	slot0.main_panel:addChild(slot0.cost_label)
	slot0:createComposeList()
	slot0:updateItemList()
end

function BackPackComposeWindow.createComposeList(slot0)
	slot1 = slot0.main_panel:getContentSize()

	createLabel(26, Config.ColorData.data_color4[175], nil, slot1.width / 2, 172, "", slot0.main_panel, 2, cc.p(0.5, 0)):setString(TI18N("合成费用"))

	slot7 = nil
	slot0.goods_name = createLabel(26, Config.ColorData.data_color4[175], slot7, slot1.width / 2, 726, "", slot0.main_panel, 2, cc.p(0.5, 0))
	slot3 = {
		{
			y = 650,
			x = slot1.width / 2
		},
		{
			y = 480,
			x = slot1.width / 2 + 200
		},
		{
			y = 310,
			x = slot1.width / 2
		},
		{
			y = 480,
			x = slot1.width / 2 - 200
		}
	}

	for slot7 = 1, 4 do
		if not slot0.compose_list[slot7] then
			slot8 = BackPackItem.new(false, true)

			slot0.main_panel:addChild(slot8)
			slot8:setPosition(cc.p(slot3[slot7].x, slot3[slot7].y))

			slot0.compose_list[slot7] = slot8

			slot8:addCallBack(function (slot0)
				if slot0:getData() and next(slot1) ~= nil then
					uv0.ctrl:openTipsSource(true, slot1)
				end
			end)
		end
	end

	slot0.last_item = BackPackItem.new(false, true)

	slot0.main_panel:addChild(slot0.last_item)
	slot0.last_item:setPosition(cc.p(slot1.width / 2, slot1.height / 2 + 75))
end

function BackPackComposeWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openBackPackComposeWindow(false)
		end
	end)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openBackPackComposeWindow(false)
		end
	end)
	slot0.fast_compose_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if not uv0.select_vo then
				return
			end

			uv0.ctrl:sender10523(uv0.select_vo.bid or 0, 0)
		end
	end)
	slot0.compose_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if not uv0.select_vo then
				return
			end

			uv0.ctrl:sender10523(uv0.select_vo.bid or 0, 1)
		end
	end)

	if not slot0.compose_goods_success then
		slot0.compose_goods_success = GlobalEvent:getInstance():Bind(BackpackEvent.Compose_Goods_Success, function ()
			uv0:clickFun(uv0.select_vo)
			uv0:checkIsCanCompose()
		end)
	end
end

function BackPackComposeWindow.updateItemList(slot0)
	if not slot0.list_view then
		slot0.list_view = CommonScrollViewLayout.new(slot0.main_panel, cc.p(32, 30), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(610, 140), {
			start_y = 9,
			item_width = 119,
			start_x = 5.5,
			space_x = 20,
			row = 1,
			item_height = 119,
			space_y = 0,
			col = 0,
			item_class = BackPackItem
		})
	end

	slot2 = {
		[slot3] = slot8
	}
	slot3 = 1

	for slot7, slot8 in pairs(Config.ItemProductData.data_product_data) do
		slot3 = slot3 + 1
	end

	if not slot2 or next(slot2) == nil then
		return
	end

	uv0(slot2, SortTools.KeyLowerSorter("order"))
	slot0.list_view:setData(slot2, function (slot0)
		if slot0:getData() and next(slot1) ~= nil then
			if uv0.select_vo and uv0.select_vo.bid == slot1.bid then
				return
			end

			if uv0.select_item then
				uv0.select_item:setSelected(false)
			end

			uv0.select_vo = slot1
			uv0.select_item = slot0

			if uv0.select_item then
				uv0.select_item:setSelected(true)
			end

			uv0:clickFun(slot1)
		end
	end)
	slot0.list_view:addEndCallBack(function ()
		uv0:checkIsCanCompose()
	end)
end

function BackPackComposeWindow.clickFun(slot0, slot1)
	if not slot1 or not slot1.need_items then
		return false
	end

	slot2 = slot1.need_items or {}
	slot3 = slot1.loss or {}
	slot4 = slot0.ctrl:getModel()
	slot5 = true

	for slot9 = 1, 4 do
		slot0.compose_list[slot9]:setData()
		slot0.compose_list[slot9]:showArtifactLock(true)
	end

	for slot9 = 1, #slot2 do
		if slot2[slot9] and slot10[1] and slot10[2] then
			slot0.compose_list[slot9]:setData(Config.ItemData.data_get_data(slot10[1]))
			slot0.compose_list[slot9]:showArtifactLock(false)
			slot0.compose_list[slot9]:setNeedNum(slot10[2], slot4:getBackPackItemNumByBid(slot10[1]))
		end
	end

	slot6 = RoleController:getInstance():getRoleVo()

	if slot3 and slot3[1] then
		slot9 = slot7[2] or 0
		slot10 = Config.ItemData.data_get_data(slot3[1][1] or 0)
		slot12 = 175

		if slot6[Config.ItemData.data_assets_id2label[slot7[1]]] and slot6[slot11] < slot7[2] then
			slot12 = 183
		end

		slot0.cost_label:setString(string.format("<img src='%s' scale=0.4 /><div fontcolor=%s> %s</div>", PathTool.getItemRes(slot10.icon), tranformC3bTostr(slot12), slot9))
	end

	slot0.last_item:setData(slot1)
	slot0.goods_name:setString(slot1.name or "")
end

function BackPackComposeWindow.checkIsCanCompose(slot0)
	for slot5, slot6 in pairs(slot0.list_view:getItemList() or {}) do
		slot6:showRedPoint(slot0:checkGoodsIsEnough(slot6:getData()) or false)

		if slot0.data and next(slot0.data) ~= nil and slot0.data.bid == slot7.bid then
			slot0.select_item = slot6

			slot0.select_item:setSelected(true)

			slot9 = slot0.select_item:getData()
			slot0.select_vo = slot9

			slot0:clickFun(slot9)
		end

		if not slot0.select_item and slot8 == true then
			slot0.select_item = slot6

			slot0.select_item:setSelected(true)

			slot9 = slot0.select_item:getData()
			slot0.select_vo = slot9

			slot0:clickFun(slot9)
		end
	end

	if not slot0.select_item and (slot0.list_view:getItemList() or {}) and slot2[1] then
		slot0.select_item = slot2[1]

		slot0.select_item:setSelected(true)

		slot3 = slot0.select_item:getData()
		slot0.select_vo = slot3

		slot0:clickFun(slot3)
	end
end

function BackPackComposeWindow.checkGoodsIsEnough(slot0, slot1)
	if not slot1 or not slot1.need_items then
		return false
	end

	slot3 = slot1.loss or {}

	for slot8, slot9 in pairs(slot1.need_items or {}) do
		if slot9 and slot9[1] and slot9[2] and slot0.ctrl:getModel():getBackPackItemNumByBid(slot9[1]) < slot9[2] then
			return false
		end
	end

	slot5 = RoleController:getInstance():getRoleVo()

	for slot9, slot10 in pairs(slot3) do
		if slot10 and slot10[1] and slot10[2] then
			if slot5[Config.ItemData.data_assets_id2label[slot10[1]]] then
				if slot5[slot11] < slot10[2] then
					return false
				end
			else
				return false
			end
		end
	end

	return true
end

function BackPackComposeWindow.openRootWnd(slot0)
end

function BackPackComposeWindow.setPanelData(slot0)
end

function BackPackComposeWindow.close_callback(slot0)
	slot0.ctrl:openBackPackComposeWindow(false)

	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	for slot4, slot5 in pairs(slot0.compose_list) do
		slot5:DeleteMe()
	end

	slot0.compose_list = nil

	if slot0.last_item then
		slot0.last_item:DeleteMe()
	end

	slot0.last_item = nil

	if slot0.compose_goods_success then
		GlobalEvent:getInstance():UnBind(slot0.compose_goods_success)

		slot0.compose_goods_success = nil
	end
end
