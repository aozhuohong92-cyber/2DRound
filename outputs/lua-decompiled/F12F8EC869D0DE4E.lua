slot1 = HomeworldController:getInstance():getModel()
slot2 = string.format
HomeworldBuyUnitWindow = HomeworldBuyUnitWindow or BaseClass(BaseView)

function HomeworldBuyUnitWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "homeworld/homeworld_buy_unit_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("homeworld", "homeworld"),
			type = ResourcesType.plist
		}
	}
	slot0.buy_num = 1
end

function HomeworldBuyUnitWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)
	slot1:getChildByName("win_title"):setString(TI18N("购买提示"))
	slot1:getChildByName("num_title"):setString(TI18N("购买数量:"))
	slot1:getChildByName("price_title"):setString(TI18N("总        价:"))

	slot0.sp_icon = slot1:getChildByName("sp_icon")
	slot0.res_bg_1 = slot1:getChildByName("res_bg_1")
	slot0.res_sp_1 = slot0.res_bg_1:getChildByName("sp_res")
	slot0.res_label_1 = slot0.res_bg_1:getChildByName("label")
	slot0.res_bg_2 = slot1:getChildByName("res_bg_2")
	slot0.res_sp_2 = slot0.res_bg_2:getChildByName("sp_res")
	slot0.res_label_2 = slot0.res_bg_2:getChildByName("label")
	slot0.price_bg = slot1:getChildByName("price_bg")
	slot0.price_sp = slot0.price_bg:getChildByName("sp_res")

	slot0.price_sp:setScale(0.35)

	slot0.price_label = slot0.price_bg:getChildByName("label")
	slot0.set_right = slot1:getChildByName("set_right")
	slot0.set_left = slot1:getChildByName("set_left")
	slot0.set_max = slot1:getChildByName("set_max")
	slot0.slider = slot1:getChildByName("slider")

	slot0.slider:setBarPercent(10, 90)

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.check_btn = slot1:getChildByName("check_btn")

	slot0.check_btn:setVisible(false)

	slot0.buy_btn = slot1:getChildByName("buy_btn")
	slot0.buy_btn_label = slot0.buy_btn:getChildByName("label"):setString(TI18N("确认购买"))

	slot0.buy_btn:setName("guide_buy_btn")

	slot0.num_txt = slot1:getChildByName("num_txt")
end

function HomeworldBuyUnitWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHomeworldBuyWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.check_btn, function ()
		uv0:_onClickCheckBtn()
	end, true, 1)
	registerButtonEventListener(slot0.buy_btn, function ()
		uv0:_onClickBuyBtn()
	end, true, 1)
	slot0.set_left:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				if uv0.buy_num - 1 < 1 then
					slot2 = 1
				end

				uv0:updateBuyNumAndPrice(slot2)
				uv0:setSliderPercent()
			end
		end
	end)
	slot0.set_right:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				if uv0.max_num < uv0.buy_num + 1 then
					slot2 = uv0.max_num
				end

				uv0:updateBuyNumAndPrice(slot2)
				uv0:setSliderPercent()
			end
		end
	end)
	slot0.set_max:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				uv0:updateBuyNumAndPrice(uv0.max_num)
				uv0:setSliderPercent()
			end
		end
	end)

	if slot0.slider ~= nil then
		slot0.slider:addEventListener(function (slot0, slot1)
			if slot1 == ccui.SliderEventType.percentChanged then
				slot2 = uv0.slider:getPercent()

				uv0:setCurBuyNumByPercent()
			end
		end)
	end
end

function HomeworldBuyUnitWindow.setSliderPercent(slot0)
	if slot0.buy_num then
		slot0.slider:setPercent(slot0.buy_num / slot0.max_num * 100)
	end
end

function HomeworldBuyUnitWindow.setCurBuyNumByPercent(slot0)
	if not slot0.slider then
		return
	end

	if math.floor(slot0.max_num * slot0.slider:getPercent() / 100) < 1 then
		slot0:setSliderPercent()
		slot0:updateBuyNumAndPrice(1)
	else
		slot0:updateBuyNumAndPrice(slot2)
	end
end

function HomeworldBuyUnitWindow.openRootWnd(slot0, slot1, slot2)
	slot0.data = slot1
	slot0.open_type = slot2 or 1
	slot0.price = slot1.price or 0
	slot0.max_num = MallController:getInstance():getModel():checkMoenyByType(slot0.data.pay_type, slot1.price)

	if slot0.max_num < 1 then
		slot0.max_num = 1
	elseif slot0.max_num > 10 then
		slot0.max_num = 10
	end

	slot0:setLimitCount(slot0.data.limit_count)
	slot0:setLimitCount(slot0.data.limit_day)
	slot0:setLimitCount(slot0.data.limit_week)
	slot0:setLimitCount(slot0.data.limit_month)
	slot0:setData()
end

function HomeworldBuyUnitWindow.setLimitCount(slot0, slot1)
	if not slot0.data then
		return
	end

	if slot1 and slot1 > 0 and slot1 - slot0.data.has_buy < slot0.max_num then
		slot0.max_num = slot2
	end
end

function HomeworldBuyUnitWindow.setData(slot0)
	if not slot0.data then
		return
	end

	slot0.shop_item_type = 1

	if slot0.data.type == 42 or slot0.data.type == 3 then
		slot0.shop_item_type = 2
	end

	if not Config.ItemData.data_get_data(slot0.data.item_bid or slot0.data.item_id) then
		return
	end

	slot0.item_config = slot2
	slot3 = Config.HomeData.data_home_unit(slot1)

	if not slot0.name_label then
		slot0.name_label = createRichLabel(22, cc.c4b(248, 194, 60, 255), cc.p(0, 0.5), cc.p(207, 420), nil, nil, 450)

		slot0.main_container:addChild(slot0.name_label)
	end

	if slot3 and Config.HomeData.data_suit[slot3.set_id] then
		slot4 = uv0("<div fontcolor=%s>%s</div>", BackPackConst.getWhiteQualityColorStr(slot2.quality), slot2.name) .. uv0(TI18N(" <div fontcolor=39D839>【所属主题:%s】</div>"), slot5.name)
	end

	slot0.name_label:setString(slot4)

	slot5 = nil

	loadSpriteTexture(slot0.sp_icon, (not slot3 or PathTool.getFurnitureNormalRes(slot3.icon)) and PathTool.getItemRes(slot2.icon), LOADTEXT_TYPE)

	slot6 = slot2.desc

	if slot3 then
		slot6 = slot3.desc
	end

	if not slot0.desc_txt then
		slot0.desc_txt = createRichLabel(20, cc.c4b(248, 194, 60, 255), cc.p(0, 0.5), cc.p(207, 376), 5, nil, 380)

		slot0.main_container:addChild(slot0.desc_txt)
	end

	slot0.desc_txt:setString(slot6)

	if type(slot0.data.pay_type) == "number" then
		pay_config = Config.ItemData.data_get_data(slot0.data.pay_type)
	else
		pay_config = Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id[slot0.data.pay_type])
	end

	if pay_config then
		loadSpriteTexture(slot0.price_sp, PathTool.getItemRes(pay_config.icon), LOADTEXT_TYPE)
	end

	if slot0.shop_item_type ~= 2 and slot3 then
		slot0.res_label_1:setString(uv0(TI18N("舒适度+%d"), slot3.soft))
		slot0.res_label_2:setString(uv0(TI18N("占地:%s"), slot3.grid_desc))
	end

	slot0.res_bg_1:setVisible(slot0.shop_item_type ~= 2)
	slot0.res_bg_2:setVisible(slot0.shop_item_type ~= 2)
	slot0:updateBuyNumAndPrice(1)
	slot0:setSliderPercent()
end

function HomeworldBuyUnitWindow.updateBuyNumAndPrice(slot0, slot1)
	slot0.buy_num = slot1

	slot0.num_txt:setString(slot1)
	slot0.price_label:setString(MoneyTool.GetMoneyString(slot0.price * slot1))
end

function HomeworldBuyUnitWindow._onClickCheckBtn(slot0)
	if slot0.item_config then
		uv0:openFurnitureInfoWindow(true, slot0.item_config.id)
	end
end

function HomeworldBuyUnitWindow._onClickBuyBtn(slot0)
	if slot0.data then
		if slot0.open_type == 1 or slot0.open_type == 2 then
			MallController:getInstance():sender13402(slot0.data.id, slot0.buy_num)
		else
			MallController:getInstance():sender13407(slot0.data.order, MallConst.MallType.HomeRandomShop, 1, slot0.buy_num)
		end

		uv0:openHomeworldBuyWindow(false)
	end
end

function HomeworldBuyUnitWindow.close_callback(slot0)
	uv0:openHomeworldBuyWindow(false)
end
