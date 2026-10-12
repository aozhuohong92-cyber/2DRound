SeerpalaceShopWindow = SeerpalaceShopWindow or BaseClass(BaseView)
slot1 = SeerpalaceController:getInstance():getModel()

function SeerpalaceShopWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "seerpalace/seerpalace_shop_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("mall", "mall"),
			type = ResourcesType.plist
		}
	}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.camp_list = {}
	slot0.cur_index = 1
	slot0.cur_camp_type = HeroConst.CampType.eNone
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function SeerpalaceShopWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("声望商城"))

	slot6 = "close_btn"
	slot0.close_btn = slot1:getChildByName(slot6)

	for slot6 = 1, 6 do
		if slot1:getChildByName("camp_btn_" .. slot6) then
			({
				camp_btn = slot7,
				select_image = slot7:getChildByName("select_image")
			}).select_image:setVisible(slot0.cur_index == slot6)

			slot0.camp_list[slot6] = slot8
		end
	end

	if Config.ItemData.data_get_data(SeerpalaceConst.Good_JieJing) then
		slot1:getChildByName("res_icon"):loadTexture(PathTool.getItemRes(slot4.icon), LOADTEXT_TYPE)
	end

	slot0.res_label = slot1:getChildByName("res_label")

	slot0.res_label:setString(slot0.role_vo.recruithigh_hero)

	slot0.list_panel = slot1:getChildByName("list_panel")
	slot0.item_scroll_view = CommonScrollViewLayout.new(slot0.list_panel, nil, nil, nil, cc.size(slot0.list_panel:getContentSize().width, slot0.list_panel:getContentSize().height), {
		start_y = 8,
		item_width = 306,
		start_x = 2,
		space_x = 2,
		row = 0,
		item_height = 143,
		space_y = 2,
		col = 2,
		need_dynamic = true,
		item_class = MallItem
	})

	slot0.item_scroll_view:setPosition(0, 0)
end

function SeerpalaceShopWindow.openRootWnd(slot0)
	MallController:getInstance():sender13401(MallConst.MallType.Seerpalace)
end

function SeerpalaceShopWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), false, 2)

	slot4 = handler(slot0, slot0._onClickBtnClose)
	slot5 = false

	registerButtonEventListener(slot0.background, slot4, slot5, 2)

	for slot4, slot5 in ipairs(slot0.camp_list) do
		if slot5.camp_btn then
			registerButtonEventListener(slot5.camp_btn, handler(slot0, slot0._onClickCampBtn), nil, nil, slot4)
		end
	end

	if not slot0.update_have_count then
		slot0.update_have_count = GlobalEvent:getInstance():Bind(MallEvent.Open_View_Event, function (slot0)
			uv0.srv_data = slot0 or {}

			uv0.item_scroll_view:setData(uv0:getConfig(), function (slot0)
				MallController:getInstance():openMallBuyWindow(true, slot0:getData())
			end)
		end)
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "recruithigh_hero" then
				uv0.res_label:setString(slot1)
			end
		end)
	end
end

function SeerpalaceShopWindow.getConfig(slot0)
	slot1 = {}

	if Config.ExchangeData.data_shop_exchage_seer and slot0.srv_data then
		slot3 = deepCopy(slot0.srv_data.item_list)

		for slot7, slot8 in pairs(slot2) do
			if Config.ItemData.data_get_data(slot8.item_bid) and (slot0.cur_camp_type == HeroConst.CampType.eNone or slot9.lev == slot0.cur_camp_type) then
				if slot3 and next(slot3 or {}) ~= nil then
					for slot13, slot14 in pairs(slot3) do
						if slot8.id == slot14.item_id then
							if slot14.ext[1].val then
								slot8.has_buy = slot14.ext[1].val

								table.remove(slot3, slot13)
							end

							break
						else
							slot8.has_buy = 0
						end
					end
				else
					slot8.has_buy = 0
				end

				table.insert(slot1, slot8)
			end
		end
	end

	table.sort(slot1, function (slot0, slot1)
		if slot0.limit_count and slot0.limit_count > 0 and slot0.limit_count <= slot0.has_buy and (not slot1.limit_count or slot1.limit_count == 0 or slot1.has_buy < slot1.limit_count) then
			return false
		elseif slot1.limit_count and slot1.limit_count > 0 and slot1.limit_count <= slot1.has_buy and (not slot0.limit_count or slot0.limit_count == 0 or slot0.has_buy < slot0.limit_count) then
			return true
		else
			return slot0.order < slot1.order
		end
	end)

	return slot1
end

function SeerpalaceShopWindow._onClickBtnClose(slot0)
	uv0:openSeerpalaceShopWindow(false)
end

function SeerpalaceShopWindow._onClickCampBtn(slot0, slot1)
	if slot0.cur_index == slot1 then
		return
	end

	if slot0.cur_index and slot0.camp_list[slot0.cur_index] and slot2.select_image then
		slot2.select_image:setVisible(false)
	end

	if slot0.camp_list[slot1] and slot2.select_image then
		slot2.select_image:setVisible(true)
	end

	slot0.cur_index = slot1

	if slot1 == 1 then
		slot0.cur_camp_type = HeroConst.CampType.eNone
	elseif slot1 == 2 then
		slot0.cur_camp_type = HeroConst.CampType.eWater
	elseif slot1 == 3 then
		slot0.cur_camp_type = HeroConst.CampType.eFire
	elseif slot1 == 4 then
		slot0.cur_camp_type = HeroConst.CampType.eWind
	elseif slot1 == 5 then
		slot0.cur_camp_type = HeroConst.CampType.eLight
	elseif slot1 == 6 then
		slot0.cur_camp_type = HeroConst.CampType.eDark
	end

	slot0.item_scroll_view:setData(slot0:getConfig(), function (slot0)
		MallController:getInstance():openMallBuyWindow(true, slot0:getData())
	end)
end

function SeerpalaceShopWindow.close_callback(slot0)
	uv0:openSeerpalaceShopWindow(false)

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	if slot0.update_have_count then
		GlobalEvent:getInstance():UnBind(slot0.update_have_count)

		slot0.update_have_count = nil
	end

	if slot0.item_scroll_view then
		slot0.item_scroll_view:DeleteMe()

		slot0.item_scroll_view = nil
	end
end
