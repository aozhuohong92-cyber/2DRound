slot1 = CrosschampionController:getInstance():getModel()
CrosschampionShopWindow = CrosschampionShopWindow or BaseClass(BaseView)

function CrosschampionShopWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "crosschampion/crosschampion_shop_window"
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.show_list = {}
end

function CrosschampionShopWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("冠军商城"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.list_panel = slot1:getChildByName("list_panel")
	slot0.res_label = slot1:getChildByName("res_label")
	slot0.item_scroll_view = CommonScrollViewSingleLayout.new(slot0.list_panel, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot0.list_panel:getContentSize().width, slot0.list_panel:getContentSize().height), {
		start_y = 0,
		item_height = 143,
		start_x = 0,
		space_y = 2,
		col = 2,
		space_x = 0,
		row = 0,
		item_width = 306
	}, cc.p(0, 0))

	slot0.item_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function CrosschampionShopWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openCrosschampionShopWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openCrosschampionShopWindow(false)
	end, false, 2)
	slot0:addGlobalEvent(MallEvent.Open_View_Event, function (slot0)
		if slot0.type == MallConst.MallType.CrosschampionShop then
			uv0.show_list = uv0:getConfig(slot0)

			uv0.item_scroll_view:reloadData()
		end
	end)

	if not slot0.role_lev_event and slot0.role_vo then
		slot0.role_lev_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 and slot0 == "cluster_guess_cent" then
				uv0:updateResNum()
			end
		end)
	end
end

function CrosschampionShopWindow.createNewCell(slot0)
	slot1 = MallItem.new()

	slot1:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot1
end

function CrosschampionShopWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function CrosschampionShopWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function CrosschampionShopWindow.onCellTouched(slot0, slot1)
	MallController:getInstance():openMallBuyWindow(true, slot1:getData())
end

function CrosschampionShopWindow.getConfig(slot0, slot1)
	slot2 = {}

	if Config.ExchangeData.data_shop_exchage_crosschampion then
		slot4 = deepCopy(slot1.item_list)

		for slot8, slot9 in pairs(slot3) do
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

			table.insert(slot2, slot9)
		end
	end

	table.sort(slot2, function (slot0, slot1)
		if slot0.limit_count and slot0.limit_count > 0 and slot0.limit_count <= slot0.has_buy and (not slot1.limit_count or slot1.limit_count == 0 or slot1.has_buy < slot1.limit_count) then
			return false
		elseif slot1.limit_count and slot1.limit_count > 0 and slot1.limit_count <= slot1.has_buy and (not slot0.limit_count or slot0.limit_count == 0 or slot0.has_buy < slot0.limit_count) then
			return true
		else
			return slot0.order < slot1.order
		end
	end)

	return slot2
end

function CrosschampionShopWindow.updateResNum(slot0)
	if slot0.role_vo then
		slot0.res_label:setString(slot0.role_vo.cluster_guess_cent)
	end
end

function CrosschampionShopWindow.openRootWnd(slot0)
	MallController:getInstance():sender13401(MallConst.MallType.CrosschampionShop)
	slot0:updateResNum()
end

function CrosschampionShopWindow.close_callback(slot0)
	if slot0.item_scroll_view then
		slot0.item_scroll_view:DeleteMe()

		slot0.item_scroll_view = nil
	end

	if slot0.role_lev_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end

	uv0:openCrosschampionShopWindow(false)
end
