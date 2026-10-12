slot1 = CrossarenaController:getInstance():getModel()
CrossareanShopWindow = CrossareanShopWindow or BaseClass(BaseView)

function CrossareanShopWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "crossarena/crossarena_shop_window"
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function CrossareanShopWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("勇者商城"))
	slot1:getChildByName("title_time"):setString(TI18N("免费刷新:"))
	slot1:getChildByName("title_count"):setString(TI18N("刷新次数:"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.refresh_btn = slot1:getChildByName("refresh_btn")
	slot2 = slot0.refresh_btn:getContentSize()
	slot0.refresh_btn_label = createRichLabel(26, 1, cc.p(0.5, 0.5), cc.p(slot2.width / 2, slot2.height / 2))

	slot0.refresh_btn:addChild(slot0.refresh_btn_label)

	slot0.res_label = slot1:getChildByName("res_label")
	slot0.txt_time = slot1:getChildByName("txt_time")
	slot0.txt_count = slot1:getChildByName("txt_count")
	slot3 = slot1:getChildByName("list_panel")
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot3, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 4,
		item_height = 143,
		start_x = 0,
		space_y = 0,
		col = 2,
		space_x = 0,
		need_dynamic = true,
		item_width = 306
	}, cc.p(0, 0))

	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function CrossareanShopWindow.createNewCell(slot0)
	slot1 = MallItem.new()

	slot1:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot1
end

function CrossareanShopWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function CrossareanShopWindow.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.show_list then
		return
	end

	slot1.index = slot2

	slot1:setData(slot0.show_list[slot2])
end

function CrossareanShopWindow.onCellTouched(slot0, slot1)
	if slot0.show_list[slot1.index] then
		if slot3.has_buy == nil then
			if slot3.ext and slot3.ext[1] then
				slot3.has_buy = slot3.ext[1].val
			else
				slot3.has_buy = 0
			end
		end

		slot3.shop_type = MallConst.MallType.CrossarenaShop

		MallController:getInstance():openMallBuyWindow(true, slot3)
	end
end

function CrossareanShopWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openCrossarenaShopWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openCrossarenaShopWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.refresh_btn, function ()
		uv0:_onClickRefreshBtn()
	end, true)
	slot0:addGlobalEvent(MallEvent.Get_Buy_list, function (slot0)
		if slot0.type == MallConst.MallType.CrossarenaShop then
			uv0.data = slot0
			slot5 = GameNet:getInstance():getTime()

			uv0:setLessTime(slot0.refresh_time - slot5)

			slot4 = slot0

			uv0:setResetCount(slot4)

			for slot4, slot5 in pairs(slot0.item_list) do
				slot5.shop_type = MallConst.MallType.CrossarenaShop
			end

			uv0.show_list = uv0.data.item_list or {}

			uv0.item_scrollview:reloadData()
		end
	end)

	if not slot0.role_lev_event and slot0.role_vo then
		slot0.role_lev_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 and slot0 == "cluster_coin" then
				uv0:updateResNum()
			end
		end)
	end
end

function CrossareanShopWindow._onClickRefreshBtn(slot0)
	MallController:getInstance():sender13405(MallConst.MallType.CrossarenaShop)
end

function CrossareanShopWindow.openRootWnd(slot0)
	MallController:getInstance():sender13403(MallConst.MallType.CrossarenaShop)
	slot0:updateResNum()
end

function CrossareanShopWindow.updateResNum(slot0)
	if slot0.role_vo then
		slot0.res_label:setString(slot0.role_vo.cluster_coin)
	end
end

function CrossareanShopWindow.setResetCount(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = TI18N("免费刷新")

	if (slot1.free_count or 0) <= 0 then
		if Config.ExchangeData.data_shop_list[MallConst.MallType.CrossarenaShop] then
			slot5 = slot4.cost_list
			slot3 = string.format(TI18N("<img src=%s scale=0.3 visible=true /><div outline=2,#020019>%s刷新</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot5[1][1]).icon), slot5[1][2])
		end
	elseif Config.ExchangeData.data_shop_exchage_cost.cluster_refresh_free then
		slot3 = string.format("<div fontsize=24 outline=2,#020019>%s(%s/%s)</div>", TI18N("免费刷新"), slot2, slot4.val)
	end

	slot0.refresh_btn_label:setString(slot3)
	slot0.txt_count:setVisible(true)

	slot5 = 0

	if Config.ExchangeData.data_shop_exchage_cost.cluster_refresh_number then
		slot5 = slot4.val
	end

	slot0.txt_count:setString(string.format("%s/%s", slot1.count or 0, slot5))
end

function CrossareanShopWindow.setLessTime(slot0, slot1)
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

function CrossareanShopWindow.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.txt_time:setString(TimeTool.GetTimeFormat(slot1))
	else
		slot0.txt_time:setString("00:00:00")
	end
end

function CrossareanShopWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.role_lev_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end

	uv0:openCrossarenaShopWindow(false)
end
