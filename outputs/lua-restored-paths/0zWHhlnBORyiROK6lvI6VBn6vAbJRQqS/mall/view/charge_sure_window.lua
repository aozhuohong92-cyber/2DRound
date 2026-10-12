slot0 = MallController:getInstance()
slot1 = table.insert
ChargeSureWindow = ChargeSureWindow or BaseClass(BaseView)

function ChargeSureWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "forgehouse/forgehouse_all_synthesis"
end

function ChargeSureWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("Image_7"):getChildByName("Text_6"):setString(TI18N("购买确认"))

	slot0.btn_sure = slot1:getChildByName("btn_sure")

	slot0.btn_sure:getChildByName("Text_4_0"):setString(TI18N("购 买"))

	slot0.btn_comp = slot1:getChildByName("btn_comp")

	slot0.btn_comp:getChildByName("Text_4"):setString(TI18N("取 消"))

	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 50,
		start_x = 115,
		space_x = 40,
		row = 1,
		space_y = 8,
		col = 5,
		item_class = BackPackItem,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height
	})
	slot0.tips_txt = createLabel(26, 274, nil, 26, 376, TI18N("购买该特权立即获得:"), slot1, nil, cc.p(0, 0.5))
end

function ChargeSureWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_sure, handler(slot0, slot0.onClickSureBtn), true)
	registerButtonEventListener(slot0.btn_comp, function ()
		uv0:openChargeSureWindow(false)
	end, true, 2)
end

function ChargeSureWindow.onClickSureBtn(slot0)
	if slot0.data then
		VipController:getInstance():sender24501(slot0.data.id)
		uv0:openChargeSureWindow(false)
	end
end

function ChargeSureWindow.openRootWnd(slot0, slot1)
	slot0:setData(slot1)
end

function ChargeSureWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2 = {}
	slot3 = RoleController:getInstance():getRoleVo()

	if Config.PrivilegeData.data_privilege_award[slot1.id] then
		slot5 = {}

		for slot9, slot10 in pairs(slot4) do
			if slot10.min <= slot3.lev and slot3.lev <= slot10.max then
				slot5 = deepCopy(slot10.reward)

				break
			end
		end

		for slot9, slot10 in pairs(slot5) do
			if deepCopy(Config.ItemData.data_get_data(slot10[1])) then
				slot11.quantity = slot10[2]

				uv0(slot2, slot11)
			end
		end
	end

	slot0.item_scrollview:setData(slot2)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
end

function ChargeSureWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openChargeSureWindow(false)
end
