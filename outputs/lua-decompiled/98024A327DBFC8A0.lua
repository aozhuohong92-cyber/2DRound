EquipmentAllSynthesisWindow = EquipmentAllSynthesisWindow or BaseClass(BaseView)
slot0 = ForgeHouseController:getInstance()
slot1 = table.insert

function EquipmentAllSynthesisWindow.__init(slot0, slot1)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.data = slot1
	slot0.layout_name = "forgehouse/forgehouse_all_synthesis"
end

function EquipmentAllSynthesisWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("Image_7"):getChildByName("Text_6"):setString(TI18N("一键合成"))

	slot0.btn_sure = slot1:getChildByName("btn_sure")

	slot0.btn_sure:getChildByName("Text_4_0"):setString(TI18N("确 定"))

	slot0.btn_comp = slot1:getChildByName("btn_comp")

	slot0.btn_comp:getChildByName("Text_4"):setString(TI18N("取 消"))

	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 5,
		start_x = 18,
		space_x = 10,
		row = 1,
		space_y = 8,
		col = 5,
		item_class = BackPackItem,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height
	})
	slot0.comp_coin_num = createRichLabel(26, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(43, 377), nil, nil, 600)

	slot1:addChild(slot0.comp_coin_num)
end

function EquipmentAllSynthesisWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_sure, function ()
		if uv0:getModel():getCompSendID() then
			uv0:send11081(slot0)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_comp, function ()
		uv0:openEquipmentAllSynthesisWindow(false)
	end, true, 1)
end

function EquipmentAllSynthesisWindow.openRootWnd(slot0)
	if not slot0.data or next(slot0.data) == nil then
		return
	end

	slot9 = slot0.data.coin

	slot0.comp_coin_num:setString(string.format(TI18N("是否消耗 <img src='%s' scale=0.3 />%s 以及材料合成以下装备"), PathTool.getItemRes(Config.ItemData.data_get_data(1).icon), MoneyTool.GetMoneyString(slot9)))

	slot4 = {}

	for slot8, slot9 in pairs(slot0.data.list) do
		uv0(slot4, {
			bid = slot9.bid,
			quantity = slot9.num
		})
	end

	slot0.item_scrollview:setData(slot4)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
end

function EquipmentAllSynthesisWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openEquipmentAllSynthesisWindow(false)
end
