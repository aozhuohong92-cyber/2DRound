slot1 = HomeworldController:getInstance():getModel()
slot2 = table.insert
HomeworldShopWindow = HomeworldShopWindow or BaseClass(BaseView)

function HomeworldShopWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "homeworld/homeworld_shop_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("homeworld", "homeworld"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("homeworld", "homeworld_big_bg_2"),
			type = ResourcesType.single
		}
	}
	slot0.res_object_list = {}
	slot0.show_item_data = {}
	slot0.furniture_shop_data = {}
	slot0.pet_shop_data = {}
	slot0.random_shop_data = {}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function HomeworldShopWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.title_load = loadSpriteTextureFromCDN(slot1:getChildByName("title_icon"), PathTool.getPlistImgForDownLoad("homeworld", "homeworld_big_bg_2"), ResourcesType.single, slot0.title_load)
	slot0.close_btn = slot1:getChildByName("close_btn")

	slot0.close_btn:setName("guide_close_btn")

	slot0.refresh_btn = slot1:getChildByName("refresh_btn")

	slot0.refresh_btn:setVisible(false)

	slot4 = slot0.refresh_btn:getContentSize()
	slot0.refresh_btn_label = createRichLabel(26, 1, cc.p(0.5, 0.5), cc.p(slot4.width / 2, slot4.height / 2))

	slot0.refresh_btn:addChild(slot0.refresh_btn_label)

	slot0.btn_rule = slot1:getChildByName("btn_rule")

	slot0.btn_rule:setVisible(false)

	slot0.txt_time = slot1:getChildByName("txt_time")
	slot0.title_time = slot1:getChildByName("title_time"):setString(TI18N("免费刷新:"))

	slot1:getChildByName("win_title"):setString(TI18N("宅室商城"))

	slot8 = TI18N

	slot1:getChildByName("tips_label"):setString(slot8("随机商城中有几率出现稀有家具"))

	for slot8 = 1, 2 do
		uv0(slot0.res_object_list, {
			res_icon = slot1:getChildByName("res_icon_" .. slot8),
			res_label = slot1:getChildByName("res_label_" .. slot8)
		})
	end

	slot5 = slot1:getChildByName("list_panel")
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot5, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot5:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 7,
		item_width = 194,
		item_height = 274,
		space_y = 7,
		col = 3,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot0.shop_btn_panel = slot1:getChildByName("shop_btn_panel")
	slot0.shop_sub_panel = slot1:getChildByName("shop_sub_panel")
end

function HomeworldShopWindow._createNewCell(slot0)
	return HomeworldShopItem.new()
end

function HomeworldShopWindow._numberOfCells(slot0)
	if not slot0.show_item_data then
		return 0
	end

	return #slot0.show_item_data
end

function HomeworldShopWindow._updateCellByIndex(slot0, slot1, slot2)
	if not slot0.show_item_data then
		return
	end

	slot1.index = slot2

	if not slot0.show_item_data[slot2] then
		return
	end

	slot1:setData(slot3, slot0.cur_tab_index)
end

function HomeworldShopWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHomeworldShopWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHomeworldShopWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if Config.HomeData.data_const.shop_refresh_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end, true, 1)
	registerButtonEventListener(slot0.refresh_btn, function ()
		uv0:_onClickRefreshBtn()
	end, true, 1)
	slot0:addGlobalEvent(MallEvent.Open_View_Event, function (slot0)
		if slot0.type == MallConst.MallType.FurnitureShop then
			uv0.furniture_shop_data = slot0
		elseif slot0.type == MallConst.MallType.HomePetShop then
			uv0.pet_shop_data = slot0
		end

		uv0:updateShopItemList()
	end)
	slot0:addGlobalEvent(MallEvent.Get_Buy_list, function (slot0)
		if slot0.type == MallConst.MallType.HomeRandomShop then
			uv0.random_shop_data = slot0

			uv0:setLessTime(slot0.refresh_time - GameNet:getInstance():getTime())
			uv0:setResetCount(slot0)
			uv0:updateShopItemList()
		end
	end)

	if not slot0.role_lev_event and slot0.role_vo then
		slot0.role_lev_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 and slot0 == "gold" or slot0 == "home_coin" then
				uv0:updateResNum()
			end
		end)
	end
end

function HomeworldShopWindow._onClickRefreshBtn(slot0)
	if slot0.cur_tab_index and slot0.cur_tab_index == 3 then
		MallController:getInstance():sender13405(MallConst.MallType.HomeRandomShop)
	end
end

function HomeworldShopWindow.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.select_sub_index = slot2.sub_index

	slot0:initShopTypeBtn(slot2.index or 1)
	slot0:updateResNum()
end

function HomeworldShopWindow.initShopTypeBtn(slot0, slot1)
	slot0.tab_array = {
		{
			index = 1,
			title = TI18N("家具")
		},
		{
			index = 2,
			title = TI18N("出行物品")
		},
		{
			index = 3,
			title = TI18N("随机商城")
		}
	}
	slot3 = slot0.shop_btn_panel:getContentSize()
	slot0.tab_scrollview = CommonScrollViewLayout.new(slot0.shop_btn_panel, cc.p(0, -7), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot3.width + 20, slot3.height), {
		start_y = 0,
		item_width = 149,
		start_x = 0,
		space_x = -5,
		row = 1,
		item_height = 64,
		space_y = 0,
		col = 0,
		item_class = CommonTabBtn
	})

	slot0.tab_scrollview:setData(slot0.tab_array, handler(slot0, slot0._onClickTabBtn), nil, {
		default_index = slot1 or 1,
		tab_size = cc.size(149, 64),
		title_offset = cc.p(0, -5)
	})
	slot0.tab_scrollview:setClickEnabled(#slot0.tab_array > 4)
end

function HomeworldShopWindow.updateSubTabBtn(slot0, slot1, slot2)
	slot3 = slot2 or 1
	slot0.cur_tab_index = slot1
	slot0.cur_sub_tab_index = nil

	if slot1 == 1 or slot1 == 2 then
		slot0.sub_tab_array = {
			{
				{
					index = 1,
					title = TI18N("墙壁")
				},
				{
					index = 2,
					title = TI18N("地板")
				},
				{
					index = 3,
					title = TI18N("墙饰")
				},
				{
					index = 4,
					title = TI18N("家具")
				},
				{
					index = 5,
					title = TI18N("地毯")
				}
			},
			{
				{
					index = 1,
					title = TI18N("食物")
				},
				{
					index = 2,
					title = TI18N("道具")
				}
			}
		}

		if not slot0.sub_tab_list then
			slot4 = slot0.shop_sub_panel:getContentSize()
			slot0.sub_tab_list = CommonSubBtnList.new(slot0.shop_sub_panel, cc.p(0.5, 0.5), cc.p(slot4.width * 0.5, slot4.height * 0.5), cc.size(101, 50), handler(slot0, slot0._onClickSubTabBtn))
		end

		slot0.sub_tab_list:setData(slot0.sub_tab_array[slot1], slot3)
		slot0.sub_tab_list:setGuideName("shop_")
		slot0.shop_sub_panel:setVisible(true)
		slot0.refresh_btn:setVisible(false)
		slot0.btn_rule:setVisible(false)
		slot0.title_time:setVisible(false)
		slot0.txt_time:setVisible(false)

		if slot1 == 1 then
			if not slot0.req_furniture_flag then
				slot0.req_furniture_flag = true

				MallController:getInstance():sender13401(MallConst.MallType.FurnitureShop)
			end
		elseif not slot0.req_pet_flag then
			slot0.req_pet_flag = true

			MallController:getInstance():sender13401(MallConst.MallType.HomePetShop)
		end
	else
		if not slot0.req_random_flag then
			slot0.req_random_flag = true

			MallController:getInstance():sender13403(MallConst.MallType.HomeRandomShop)
		else
			slot0:updateShopItemList()
		end

		slot0.shop_sub_panel:setVisible(false)
		slot0.refresh_btn:setVisible(true)
		slot0.btn_rule:setVisible(true)
		slot0.title_time:setVisible(true)
		slot0.txt_time:setVisible(true)
	end
end

function HomeworldShopWindow.updateRandowShopRefreshTime(slot0)
end

function HomeworldShopWindow._onClickTabBtn(slot0, slot1)
	if slot0.cur_tab_btn and slot0.cur_tab_btn.index == slot1.index then
		return
	end

	if slot0.cur_tab_btn then
		slot0.cur_tab_btn:setBtnSelectStatus(false)
	end

	if slot1 then
		slot0.cur_tab_btn = slot1

		slot0.cur_tab_btn:setBtnSelectStatus(true)

		if slot0.select_sub_index then
			slot0:updateSubTabBtn(slot1.index, slot0.select_sub_index)

			slot0.select_sub_index = nil
		else
			slot0:updateSubTabBtn(slot1.index)
		end
	end
end

function HomeworldShopWindow._onClickSubTabBtn(slot0, slot1)
	if slot0.cur_sub_tab_index and slot0.cur_sub_tab_index == slot1 then
		return
	end

	slot0.cur_sub_tab_index = slot1

	slot0:updateShopItemList()
end

function HomeworldShopWindow.updateShopItemList(slot0, slot1)
	slot0.show_item_data = {}

	if slot0.cur_tab_index == 1 or slot0.cur_tab_index == 2 then
		slot2 = {}
		slot3 = {}

		if slot0.cur_tab_index == 1 then
			slot3 = slot0.furniture_shop_data

			for slot7, slot8 in pairs(Config.ExchangeData.data_shop_exchage_furniture) do
				if slot8.item_type == slot0.cur_sub_tab_index then
					uv0(slot2, slot8)
				end
			end
		else
			slot3 = slot0.pet_shop_data

			for slot7, slot8 in pairs(Config.ExchangeData.data_shop_exchage_pet) do
				if slot8.item_type == slot0.cur_sub_tab_index then
					uv0(slot2, slot8)
				end
			end
		end

		slot4 = deepCopy(slot3.item_list)

		for slot8, slot9 in pairs(slot2) do
			if slot4 and next(slot4 or {}) ~= nil then
				for slot13, slot14 in pairs(slot4) do
					if slot9.id == slot14.item_id then
						if slot14.ext[1].val then
							slot9.has_buy = slot14.ext[1].val

							table.remove(slot4, slot13)
						end

						break
					else
						slot9.has_buy = 0
					end
				end
			else
				slot9.has_buy = 0
			end

			uv0(slot0.show_item_data, slot9)
		end

		table.sort(slot0.show_item_data, SortTools.KeyLowerSorter("order"))
	elseif slot0.cur_tab_index == 3 then
		slot0.show_item_data = slot0.random_shop_data.item_list or {}
	end

	slot0.item_scrollview:reloadData(nil, , slot1)
end

function HomeworldShopWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.txt_time) then
		return
	end

	doStopAllActions(slot0.txt_time)

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.txt_time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.txt_time)
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function HomeworldShopWindow.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.txt_time:setString(TimeTool.GetTimeFormat(slot1))
	else
		slot0.txt_time:setString("00:00:00")
	end
end

function HomeworldShopWindow.setResetCount(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = TI18N("免费刷新")

	if (slot1.free_count or 0) <= 0 then
		if Config.ExchangeData.data_shop_exchage_cost.furniture_spend then
			slot3 = string.format(TI18N("<img src=%s scale=0.3 visible=true /><div outline=2,#020019>%s刷新</div>"), PathTool.getItemRes(31), slot4.val)
		end
	elseif Config.ExchangeData.data_shop_exchage_cost.furniture_refresh_free then
		slot3 = string.format("<div fontsize=24 outline=2,#020019>%s(%s/%s)</div>", TI18N("免费刷新"), slot2, slot4.val)
	end

	slot0.refresh_btn_label:setString(slot3)
end

function HomeworldShopWindow.updateResNum(slot0)
	if not slot0.role_vo then
		return
	end

	for slot4, slot5 in pairs(slot0.res_object_list) do
		if slot5.res_label then
			slot6 = 0

			if slot4 == 1 then
				slot6 = slot0.role_vo.home_coin
			elseif slot4 == 2 then
				slot6 = slot0.role_vo.gold
			end

			slot5.res_label:setString(MoneyTool.GetMoneyString(slot6))
		end
	end
end

function HomeworldShopWindow.close_callback(slot0)
	doStopAllActions(slot0.txt_time)

	if slot0.title_load then
		slot0.title_load:DeleteMe()

		slot0.title_load = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.sub_tab_list then
		slot0.sub_tab_list:DeleteMe()

		slot0.sub_tab_list = nil
	end

	if slot0.tab_scrollview then
		slot0.tab_scrollview:DeleteMe()

		slot0.tab_scrollview = nil
	end

	if slot0.role_lev_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end

	uv0:openHomeworldShopWindow(false)
end
