slot1 = MallController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = cc.c4b(255, 234, 117, 255)
slot5 = cc.c4b(255, 248, 210, 255)
ChargeShopWindow = ChargeShopWindow or BaseClass(BaseView)

function ChargeShopWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "mall/charge_shop_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("mall_charge", "mall_charge"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/mall", "charge_bg_1", true),
			type = ResourcesType.single
		}
	}
	slot0.panel_list = {}
end

function ChargeShopWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/mall", "charge_bg_1", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.image_bg = slot1:getChildByName("image_bg")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.sub_panel = slot1:getChildByName("sub_panel")
	slot0.tab_btn_panel = slot1:getChildByName("tab_btn_panel")
	slot0.btn_scrollview = CommonScrollViewSingleLayout.new(slot0.tab_btn_panel, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.tab_btn_panel:getContentSize(), {
		start_y = 0,
		row = 1,
		start_x = 10,
		space_x = 3,
		item_width = 175,
		item_height = 108,
		space_y = 0,
		col = 0,
		need_dynamic = true
	})

	slot0.btn_scrollview:setSwallowTouches(false)
	slot0.btn_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.btn_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.btn_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0.btn_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)

	slot0.sub_tab_btn_panel = slot1:getChildByName("sub_tab_btn_panel")
	slot0.sub_btn_scrollview = CommonScrollViewSingleLayout.new(slot0.sub_tab_btn_panel, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.sub_tab_btn_panel:getContentSize(), {
		start_y = 0,
		row = 1,
		start_x = 50,
		space_x = 40,
		item_width = 105,
		item_height = 125,
		space_y = 0,
		col = 0,
		need_dynamic = true
	})

	slot0.sub_btn_scrollview:setSwallowTouches(false)
	slot0.sub_btn_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createSubNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.sub_btn_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfSubCells), ScrollViewFuncType.NumberOfCells)
	slot0.sub_btn_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateSubCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0.sub_btn_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.onSubCellTouched), ScrollViewFuncType.OnCellTouched)
	MainuiController:getInstance():setIsShowMainUIBottom(false)

	slot8 = display.getTop(slot1)
	slot9 = display.getBottom(slot1)
	slot10, slot11 = display.getScreenWH()
	slot0.offset_y = slot8 - slot9 - SCREEN_HEIGHT

	slot0.image_bg:setPositionY(slot8 - 59)
	slot0.close_btn:setPositionY(slot9 + 95)
	slot1:getChildByName("line_1"):setPositionY(slot9 + 130)
	slot1:getChildByName("line_2"):setPositionY(slot9 + 130)
	slot0.sub_panel:setPositionY(slot8 - 151)
	slot0.tab_btn_panel:setPositionY(slot9 + 10)
	slot0.sub_tab_btn_panel:setPositionY(slot9 + 142)

	if MAKELIFEBETTER == true then
		slot0.sub_tab_btn_panel:setVisible(false)
		slot0.tab_btn_panel:setVisible(false)
	end
end

function ChargeShopWindow.createNewCell(slot0)
	slot1 = ChargeTabBtn.new()

	slot1:addClickCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot1
end

function ChargeShopWindow.numberOfCells(slot0)
	if not slot0.tab_btn_data then
		return 0
	end

	return #slot0.tab_btn_data
end

function ChargeShopWindow.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.tab_btn_data then
		return
	end

	slot1.index = slot2

	if not slot0.tab_btn_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ChargeShopWindow.onCellTouched(slot0, slot1)
	if not slot1 or not slot1.index then
		return
	end

	if slot0.cur_btn_index and slot0.cur_btn_index == slot1.index then
		return
	end

	if not slot1.config and slot0.tab_btn_data[slot1.index] then
		slot1:setData(slot2)
	end

	if not slot1.config then
		return
	end

	if slot0.cur_tab_btn then
		slot0.cur_tab_btn:setIsSelect(false)
	end

	slot1:setIsSelect(true)

	slot0.cur_tab_btn = slot1
	slot0.cur_btn_index = slot1.index
	slot0.cur_sub_btn_index = nil

	if slot1.config.id == MallConst.Charge_Shop_Type.Privilege and VipController:getInstance():getGiftRedStatusById(VIPREDPOINT.PRIVILEGE) then
		VipController:getInstance():setTipsGiftStatus(VIPREDPOINT.PRIVILEGE, false)
	end

	if slot1.config.subtype and next(slot1.config.subtype) ~= nil then
		slot0.sub_tab_btn_panel:setVisible(true)
		slot0:updateSubBtnList(slot1.config.id, slot1.config.subtype)
	else
		slot0.sub_tab_btn_panel:setVisible(false)
		slot0:showShopPanelById(slot1.config.id)
	end

	if MAKELIFEBETTER == true then
		slot0.sub_tab_btn_panel:setVisible(false)
	end
end

function ChargeShopWindow.showShopPanelById(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.cur_panel_shop_id and slot0.cur_panel_shop_id == slot1 then
		return
	end

	if slot0.cur_panel then
		slot0.cur_panel:setVisibleStatus(false)
	end

	slot0.cur_panel_shop_id = slot1

	if not slot0.panel_list[slot1] then
		if slot1 == MallConst.Charge_Shop_Type.Diamond then
			slot0.panel_list[slot1] = ChargeDiamondPanel.New(slot0.sub_panel, slot0.offset_y)
		elseif slot1 == MallConst.Charge_Shop_Type.Dialy then
			slot0.panel_list[slot1] = ChargeDialyPanel.New(slot0.sub_panel, slot0.offset_y)
		elseif slot1 == MallConst.Charge_Shop_Type.Weekly then
			slot0.panel_list[slot1] = ChargeWeeklyPanel.New(slot0.sub_panel, slot0.offset_y)
		elseif slot1 == MallConst.Charge_Shop_Type.Monthly then
			slot0.panel_list[slot1] = ChargeMonthlyPanel.New(slot0.sub_panel, slot0.offset_y)
		elseif slot1 == MallConst.Charge_Shop_Type.Privilege then
			slot0.panel_list[slot1] = ChargePrivilegePanel.New(slot0.sub_panel, slot0.offset_y)
		elseif slot1 == MallConst.Charge_Shop_Type.Time then
			slot0.panel_list[slot1] = ChargeTimePanel.New(slot0.sub_panel, slot0.offset_y)
		elseif slot1 == MallConst.Charge_Shop_Type.Cloth then
			slot0.panel_list[slot1] = ChargeClothPanel.New(slot0.sub_panel, slot0.offset_y)
		end
	end

	slot0.cur_panel = slot0.panel_list[slot1]

	if slot0.cur_panel then
		slot0.cur_panel:setVisibleStatus(true)
	end

	slot0:updateShopBgById()
end

function ChargeShopWindow.updateShopBgById(slot0)
	if not slot0.cur_panel_shop_id then
		return
	end

	if Config.ChargeMallData.data_charge_shop[slot0.cur_panel_shop_id] and slot1.bg_id ~= "" then
		slot0.image_bg_load = loadImageTextureFromCDN(slot0.image_bg, PathTool.getPlistImgForDownLoad("bigbg/mall", slot1.bg_id), ResourcesType.single, slot0.image_bg_load, nil, function ()
			uv0.image_bg:setCapInsets(cc.rect(100, 450, 1, 40))
			uv0.image_bg:setContentSize(cc.size(705, 1130 + uv0.offset_y))
		end)
	end
end

function ChargeShopWindow.updateSubBtnList(slot0, slot1, slot2)
	if slot0.cur_sub_btn_id and slot0.cur_sub_btn_id == slot1 then
		if slot0.cur_sub_panel_id then
			slot0:showShopPanelById(slot0.cur_sub_panel_id)
		end

		return
	end

	slot0.cur_sub_btn_id = slot1
	slot0.sub_tab_btn_data = {}

	for slot6, slot7 in pairs(slot2) do
		if Config.ChargeMallData.data_charge_shop[slot7] and slot0:checkShopIsOpen(slot8.id) then
			if slot8.id == MallConst.Charge_Shop_Type.Diamond then
				-- Nothing
			elseif slot8.id == MallConst.Charge_Shop_Type.Dialy then
				slot9.is_show_red = VipController:getInstance():getGiftRedStatusById(VIPREDPOINT.DAILY_AWARD) or false
			elseif slot9.config.id == MallConst.Charge_Shop_Type.Weekly then
				slot9.is_show_red = uv0:getMallRedStateByBid(MallConst.Red_Index.Weekly) or false
			elseif slot9.config.id == MallConst.Charge_Shop_Type.Monthly then
				slot9.is_show_red = uv0:getMallRedStateByBid(MallConst.Red_Index.Monthly) or false
			elseif slot9.config.id == MallConst.Charge_Shop_Type.Cloth then
				slot9.is_show_red = uv0:getMallRedStateByBid(MallConst.Red_Index.Chose) or false
			end

			uv1(slot0.sub_tab_btn_data, {
				config = slot8,
				is_show_red = false,
				is_show_red = VipController:getInstance():getVipRedStatus() or false
			})
		end
	end

	uv2(slot0.sub_tab_btn_data, function (slot0, slot1)
		return slot0.config.sort < slot1.config.sort
	end)

	slot4 = 1

	if slot0.default_sub_type then
		for slot8, slot9 in pairs(slot0.sub_tab_btn_data) do
			if slot9.config.id == slot0.default_sub_type then
				slot4 = slot8

				break
			end
		end

		slot0.default_sub_type = nil
	end

	slot0.sub_btn_scrollview:reloadData(slot4)
end

function ChargeShopWindow.createSubNewCell(slot0)
	slot1 = ChargeSubTabBtn.new()

	slot1:addCallBack(function ()
		uv0:onSubCellTouched(uv1)
	end)

	return slot1
end

function ChargeShopWindow.numberOfSubCells(slot0)
	if not slot0.sub_tab_btn_data then
		return 0
	end

	return #slot0.sub_tab_btn_data
end

function ChargeShopWindow.updateSubCellByIndex(slot0, slot1, slot2)
	if not slot0.sub_tab_btn_data then
		return
	end

	slot1.index = slot2

	if not slot0.sub_tab_btn_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ChargeShopWindow.onSubCellTouched(slot0, slot1)
	if not slot1 or not slot1.config then
		return
	end

	if slot0.cur_sub_btn_index and slot0.cur_sub_btn_index == slot1.index then
		return
	end

	if slot0.cur_sub_tab_btn then
		slot0.cur_sub_tab_btn:setIsSelect(false)
	end

	slot1:setIsSelect(true)

	slot0.cur_sub_tab_btn = slot1
	slot0.cur_sub_btn_index = slot1.index
	slot0.cur_sub_panel_id = slot1.config.id

	slot0:showShopPanelById(slot1.config.id)
end

function ChargeShopWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	slot0:addGlobalEvent(MallEvent.Get_Open_Charge_Shop_Event, function (slot0)
		if slot0 and slot0.open_id and next(slot0.open_id) ~= nil then
			uv0:updateShopBtnList(slot0.open_id)
		end
	end)
	slot0:addGlobalEvent(VipEvent.Update_Gift_Red_state, function ()
		uv0:updateBtnRedStatus()
	end)
	slot0:addGlobalEvent(MallEvent.Update_Mall_Red_Event, function ()
		uv0:updateBtnRedStatus()
	end)
end

function ChargeShopWindow.onClickCloseBtn(slot0)
	uv0:openChargeShopWindow(false)
end

function ChargeShopWindow.updateBtnRedStatus(slot0)
	slot1 = VipController:getInstance()

	if slot0.tab_btn_data then
		for slot5, slot6 in pairs(slot0.tab_btn_data) do
			slot6.is_show_red = false

			if slot6.config.id == MallConst.Charge_Shop_Type.Normal then
				slot6.is_show_red = slot1:getGiftRedStatusById(VIPREDPOINT.DAILY_AWARD) or slot1:getVipRedStatus() or uv0:getMallRedStateByBid(MallConst.Red_Index.Weekly) or uv0:getMallRedStateByBid(MallConst.Red_Index.Monthly) or false
			elseif slot6.config.id == MallConst.Charge_Shop_Type.Value then
				slot6.is_show_red = uv0:getMallRedStateByBid(MallConst.Red_Index.Chose) or false
			elseif slot6.config.id == MallConst.Charge_Shop_Type.Privilege then
				slot6.is_show_red = slot1:getGiftRedStatusById(VIPREDPOINT.PRIVILEGE) or false
			end
		end

		slot0.btn_scrollview:reloadData()
	end

	if slot0.sub_tab_btn_data then
		for slot5, slot6 in pairs(slot0.sub_tab_btn_data) do
			slot6.is_show_red = false

			if slot6.config.id == MallConst.Charge_Shop_Type.Dialy then
				slot6.is_show_red = slot1:getGiftRedStatusById(VIPREDPOINT.DAILY_AWARD) or false
			elseif slot6.config.id == MallConst.Charge_Shop_Type.Diamond then
				slot6.is_show_red = slot1:getVipRedStatus() or false
			elseif slot6.config.id == MallConst.Charge_Shop_Type.Weekly then
				slot6.is_show_red = uv0:getMallRedStateByBid(MallConst.Red_Index.Weekly) or false
			elseif slot6.config.id == MallConst.Charge_Shop_Type.Monthly then
				slot6.is_show_red = uv0:getMallRedStateByBid(MallConst.Red_Index.Monthly) or false
			elseif slot6.config.id == MallConst.Charge_Shop_Type.Cloth then
				slot6.is_show_red = uv0:getMallRedStateByBid(MallConst.Red_Index.Chose) or false
			end
		end

		slot0.sub_btn_scrollview:reloadData()
	end
end

function ChargeShopWindow.updateShopBtnList(slot0, slot1)
	slot0.open_shop_list = slot1

	if slot0.temp_sub_type then
		slot0.default_tab_type = nil
		slot0.default_sub_type = nil
		slot2 = RoleController:getInstance():getRoleVo()

		if slot0.temp_sub_type == MallConst.Charge_Shop_Type.Diamond and slot2 then
			if slot2.vip_lev == 0 then
				slot0.default_tab_type = MallConst.Charge_Shop_Type.Normal
				slot0.default_sub_type = MallConst.Charge_Shop_Type.Diamond
			elseif slot3 < 3 then
				slot0.default_tab_type = MallConst.Charge_Shop_Type.Privilege
			else
				slot0.default_tab_type = MallConst.Charge_Shop_Type.Normal

				if slot0:checkShopIsOpen(MallConst.Charge_Shop_Type.Monthly) then
					slot0.default_sub_type = MallConst.Charge_Shop_Type.Monthly
				else
					slot0.default_sub_type = MallConst.Charge_Shop_Type.Diamond
				end
			end
		else
			for slot6, slot7 in pairs(Config.ChargeMallData.data_charge_shop) do
				if next(slot7.subtype) ~= nil then
					for slot11, slot12 in pairs(slot7.subtype) do
						if slot12 == slot0.temp_sub_type then
							slot0.default_tab_type = slot7.id
							slot0.default_sub_type = slot0.temp_sub_type

							break
						end
					end
				elseif slot7.id == slot0.temp_sub_type and not slot0.default_sub_type then
					slot0.default_tab_type = slot0.temp_sub_type
				end
			end
		end

		if MAKELIFEBETTER then
			slot0.default_tab_type = MallConst.Charge_Shop_Type.Normal
			slot0.default_sub_type = MallConst.Charge_Shop_Type.Diamond
		end

		slot0:updateTabBtnList(1)

		slot0.temp_sub_type = nil
	end
end

function ChargeShopWindow.checkShopIsOpen(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.open_shop_list or {}) do
		if slot7.id == slot1 then
			slot2 = true

			break
		end
	end

	return slot2
end

function ChargeShopWindow.openRootWnd(slot0, slot1)
	slot0.temp_sub_type = slot1 or MallConst.Charge_Shop_Type.Normal

	uv0:sender21022()
end

function ChargeShopWindow.updateTabBtnList(slot0, slot1)
	if not slot0.tab_btn_data then
		slot0.tab_btn_data = {}

		for slot5, slot6 in pairs(Config.ChargeMallData.data_charge_shop) do
			if slot6.first_tab == 1 and slot0:checkShopIsOpen(slot6.id) then
				slot8 = VipController:getInstance()

				if slot6.id == MallConst.Charge_Shop_Type.Normal then
					-- Nothing
				elseif slot6.id == MallConst.Charge_Shop_Type.Value then
					slot7.is_show_red = uv0:getMallRedStateByBid(MallConst.Red_Index.Chose) or false
				elseif slot6.id == MallConst.Charge_Shop_Type.Privilege then
					slot7.is_show_red = slot8:getGiftRedStatusById(VIPREDPOINT.PRIVILEGE) or false
				end

				uv1(slot0.tab_btn_data, {
					config = slot6,
					is_show_red = false,
					is_show_red = slot8:getGiftRedStatusById(VIPREDPOINT.DAILY_AWARD) or slot8:getVipRedStatus() or uv0:getMallRedStateByBid(MallConst.Red_Index.Weekly) or uv0:getMallRedStateByBid(MallConst.Red_Index.Monthly) or false
				})
			end
		end

		uv2(slot0.tab_btn_data, function (slot0, slot1)
			return slot0.config.sort < slot1.config.sort
		end)
	end

	for slot5, slot6 in pairs(slot0.tab_btn_data) do
		if slot0.default_tab_type and slot0.default_tab_type == slot6.config.id then
			slot1 = slot5
		end
	end

	slot0.btn_scrollview:reloadData(slot1)

	slot0.default_tab_type = nil
end

function ChargeShopWindow.close_callback(slot0)
	if slot0.btn_scrollview then
		slot0.btn_scrollview:DeleteMe()

		slot0.btn_scrollview = nil
	end

	if slot0.sub_btn_scrollview then
		slot0.sub_btn_scrollview:DeleteMe()

		slot0.sub_btn_scrollview = nil
	end

	if slot0.image_bg_load then
		slot0.image_bg_load:DeleteMe()

		slot0.image_bg_load = nil
	end

	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	slot0.panel_list = {}

	MainuiController:getInstance():setIsShowMainUIBottom(true)
	uv0:openChargeShopWindow(false)
end

ChargeTabBtn = class("ChargeTabBtn", function ()
	return ccui.Layout:create()
end)

function ChargeTabBtn.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()
end

function ChargeTabBtn.configUI(slot0)
	slot0.size = cc.size(175, 107)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("mall/charge_tab_btn"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.normal_sp = slot0.container:getChildByName("normal_sp")
	slot0.normal_icon_sp = slot0.normal_sp:getChildByName("icon")
	slot0.select_sp = slot0.container:getChildByName("select_sp")

	slot0.select_sp:setVisible(false)

	slot0.select_icon_sp = slot0.select_sp:getChildByName("icon")
	slot0.name_txt = slot0.container:getChildByName("name_txt")
end

function ChargeTabBtn.registerEvent(slot0)
	registerButtonEventListener(slot0.container, handler(slot0, slot0.onClickItem), false)
end

function ChargeTabBtn.onClickItem(slot0)
	if slot0.clickCallBack then
		slot0:clickCallBack()
	end
end

function ChargeTabBtn.addClickCallBack(slot0, slot1)
	slot0.clickCallBack = slot1
end

function ChargeTabBtn.setIsSelect(slot0, slot1)
	slot0.normal_sp:setVisible(not slot1)
	slot0.select_sp:setVisible(slot1)

	if slot1 == true then
		slot0.name_txt:setTextColor(uv0)
	else
		slot0.name_txt:setTextColor(uv1)
	end
end

function ChargeTabBtn.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.config = slot1.config or {}

	if slot0.config.res_id and slot0.config.res_id ~= "" then
		loadSpriteTexture(slot0.normal_icon_sp, PathTool.getResFrame("mall_charge", slot0.config.res_id .. "_s"), LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.select_icon_sp, PathTool.getResFrame("mall_charge", slot0.config.res_id), LOADTEXT_TYPE_PLIST)
	end

	slot0.name_txt:setString(slot0.config.name or "")
	addRedPointToNodeByStatus(slot0, slot1.is_show_red)
end

function ChargeTabBtn.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

ChargeSubTabBtn = class("ChargeSubTabBtn", function ()
	return ccui.Layout:create()
end)

function ChargeSubTabBtn.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()
end

function ChargeSubTabBtn.configUI(slot0)
	slot0.size = cc.size(105, 125)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("mall/charge_sub_tab_btn"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.normal_img = slot0.container:getChildByName("normal_img")
	slot0.select_img = slot0.container:getChildByName("select_img")
	slot0.icon_sp = slot0.container:getChildByName("icon_sp")
	slot0.name_txt = slot0.container:getChildByName("name_txt")

	slot0:setIsSelect(false)
end

function ChargeSubTabBtn.registerEvent(slot0)
	registerButtonEventListener(slot0.container, handler(slot0, slot0.onClickItem), false)
end

function ChargeSubTabBtn.onClickItem(slot0)
	if slot0.clickCallBack then
		slot0:clickCallBack()
	end
end

function ChargeSubTabBtn.addCallBack(slot0, slot1)
	slot0.clickCallBack = slot1
end

function ChargeSubTabBtn.setIsSelect(slot0, slot1)
	slot0.normal_img:setVisible(not slot1)
	slot0.select_img:setVisible(slot1)

	if slot1 == true then
		slot0.icon_sp:setOpacity(255)
	else
		slot0.icon_sp:setOpacity(178)
	end
end

function ChargeSubTabBtn.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.config = slot1.config or {}

	if slot0.config.res_id and slot0.config.res_id ~= "" then
		loadSpriteTexture(slot0.icon_sp, PathTool.getResFrame("mall_charge", slot0.config.res_id), LOADTEXT_TYPE_PLIST)
	end

	slot0.name_txt:setString(slot0.config.name or "")
	addRedPointToNodeByStatus(slot0, slot1.is_show_red)
end

function ChargeSubTabBtn.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
