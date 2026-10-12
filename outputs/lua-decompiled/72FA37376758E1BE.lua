slot1 = ArenapeakchampionController:getInstance():getModel()
ArenapeakchampionShopWindow = ArenapeakchampionShopWindow or BaseClass(BaseView)

function ArenapeakchampionShopWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "crosschampion/crosschampion_shop_window"
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function ArenapeakchampionShopWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.container = slot1

	slot1:getChildByName("win_title"):setString(TI18N("巅峰商城"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.list_panel = slot1:getChildByName("list_panel")
	slot0.res_label = slot1:getChildByName("res_label")
	slot0.item_scroll_view = CommonScrollViewLayout.new(slot0.list_panel, nil, nil, nil, cc.size(slot0.list_panel:getContentSize().width, slot0.list_panel:getContentSize().height), {
		start_y = 0,
		item_width = 306,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 143,
		space_y = 2,
		col = 2,
		item_class = MallItem
	})

	slot0.item_scroll_view:setPosition(0, 0)
end

function ArenapeakchampionShopWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openArenapeakchampionShopWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openArenapeakchampionShopWindow(false)
	end, false, 2)
	slot0:addGlobalEvent(MallEvent.Open_View_Event, function (slot0)
		if slot0.type == MallConst.MallType.PeakchampionShop then
			uv0.item_scroll_view:setData(uv0:getConfig(slot0), function (slot0)
				MallController:getInstance():openMallBuyWindow(true, slot0:getData())
			end)
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

function ArenapeakchampionShopWindow.getConfig(slot0, slot1)
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

function ArenapeakchampionShopWindow.updateResNum(slot0)
	if slot0.role_vo then
		slot0.res_label:setString(slot0.role_vo.cluster_guess_cent)
	end
end

function ArenapeakchampionShopWindow.openRootWnd(slot0)
	MallController:getInstance():sender13401(MallConst.MallType.PeakchampionShop)
	slot0:updateResNum()
end

function ArenapeakchampionShopWindow.close_callback(slot0)
	if slot0.item_scroll_view then
		slot0.item_scroll_view:DeleteMe()

		slot0.item_scroll_view = nil
	end

	if slot0.role_lev_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end

	uv0:openArenapeakchampionShopWindow(false)
end
