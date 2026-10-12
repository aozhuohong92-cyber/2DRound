slot1 = HomeworldController:getInstance():getModel()
slot2 = string.format
HomeworldShopItem = class("HomeworldShopItem", function ()
	return ccui.Widget:create()
end)

function HomeworldShopItem.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()

	slot0.is_can_buy = true
end

function HomeworldShopItem.configUI(slot0)
	slot0.size = cc.size(194, 274)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("homeworld/homeworld_shop_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0.container:setSwallowTouches(false)

	slot0.name_txt = slot0.container:getChildByName("name_txt")
	slot0.limit_image = slot0.container:getChildByName("limit_image")

	slot0.limit_image:setLocalZOrder(4)

	slot0.limit_tips = slot0.limit_image:getChildByName("limit_tips")
	slot0.limit_num = slot0.limit_image:getChildByName("limit_num")
	slot0.sell_out_panel = slot0.container:getChildByName("sell_out_panel")

	slot0.sell_out_panel:setOpacity(150)
	slot0.sell_out_panel:setLocalZOrder(4)
	slot0.sell_out_panel:getChildByName("sell_out_sp"):setOpacity(255)

	slot0.lock_panel = slot0.container:getChildByName("lock_panel")

	slot0.lock_panel:setOpacity(150)
	slot0.lock_panel:setLocalZOrder(4)

	slot0.lock_label = slot0.lock_panel:getChildByName("lock_label")

	slot0.lock_label:setOpacity(255)

	slot0.num_txt = slot0.container:getChildByName("num_txt")
end

function HomeworldShopItem.registerEvent(slot0)
	registerButtonEventListener(slot0.container, function ()
		if uv0.data and uv0.is_can_buy then
			uv1:openHomeworldBuyWindow(true, uv0.data, uv0.shop_type)
		end
	end, true, nil, , , , true)

	if not slot0.buy_success_random then
		slot0.buy_success_random = GlobalEvent:getInstance():Bind(MallEvent.Buy_One_Success, function (slot0)
			if not slot0 or not uv0.data then
				return
			end

			if uv0.data.order and slot0.order == uv0.data.order then
				if not uv0.data.has_buy then
					uv0.data.has_buy = slot0.num or 1
				else
					uv0.data.has_buy = uv0.data.has_buy + (slot0.num or 1)
				end

				uv0:updateSellStatus()
			end
		end)
	end

	if not slot0.buy_success_item then
		slot0.buy_success_item = GlobalEvent:getInstance():Bind(MallEvent.Buy_Success_Event, function (slot0)
			if not slot0 or not uv0.data then
				return
			end

			if uv0.data.id and slot0.eid == uv0.data.id and next(slot0.ext or {}) ~= nil then
				if not uv0.data.has_buy then
					uv0.data.has_buy = slot0.ext[1].val or 1
				else
					uv0.data.has_buy = uv0.data.has_buy + (slot1 or 1)
				end

				uv0:updateSellStatus()
			end
		end)
	end

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if not uv0.item_config then
				return
			end

			if not uv0.data then
				return
			end

			for slot5, slot6 in pairs(slot1) do
				if slot6.base_id == uv0.item_config.id then
					uv0:updateHaveNum()
				end
			end
		end)
	end

	if not slot0.del_goods_event then
		slot0.del_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if not uv0.item_config then
				return
			end

			if not uv0.data then
				return
			end

			for slot5, slot6 in pairs(slot1) do
				if slot6.base_id == uv0.item_config.id then
					uv0:updateHaveNum()
				end
			end
		end)
	end

	if not slot0.modify_goods_event then
		slot0.modify_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if not uv0.item_config then
				return
			end

			if not uv0.data then
				return
			end

			for slot5, slot6 in pairs(slot1) do
				if slot6.base_id == uv0.item_config.id then
					uv0:updateHaveNum()
				end
			end
		end)
	end
end

function HomeworldShopItem.setData(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	slot0.data = slot1
	slot0.shop_type = slot2
	slot0.shop_item_type = 1
	slot0.is_can_buy = true

	if slot1.type == 42 then
		slot0.shop_item_type = 2
	end

	slot0.item_config = Config.ItemData.data_get_data(slot1.item_bid or slot1.item_id)

	if not slot0.item_config then
		return
	end

	slot0.container:setName("guide_shop_item_" .. slot3)
	slot0.name_txt:setString(slot0.item_config.name)
	slot0.name_txt:setTextColor(BackPackConst.getBlackQualityColorC4B(slot0.item_config.quality))

	if not slot0.desc_txt then
		slot0.desc_txt = createRichLabel(20, cc.c4b(57, 152, 216, 255), cc.p(0.5, 0.5), cc.p(slot0.size.width * 0.5, 218))

		slot0.container:addChild(slot0.desc_txt)
	end

	slot0.desc_txt:setString(slot1.item_desc)

	slot4 = nil

	if not slot0.item_icon then
		slot0.item_icon = createSprite((not Config.HomeData.data_home_unit(slot3) or PathTool.getFurnitureNormalRes(slot5.icon)) and PathTool.getItemRes(slot0.item_config.icon), slot0.size.width * 0.5, 137, slot0.container, cc.p(0.5, 0.5), LOADTEXT_TYPE)

		slot0.item_icon:setScale(0.75)
	else
		loadSpriteTexture(slot0.item_icon, slot4, LOADTEXT_TYPE)
	end

	if not slot0.price_txt then
		slot0.price_txt = createRichLabel(20, cc.c4b(255, 246, 228, 255), cc.p(0.5, 0.5), cc.p(slot0.size.width * 0.5, 27))

		slot0.container:addChild(slot0.price_txt)
	end

	if type(slot1.pay_type) == "number" then
		pay_config = Config.ItemData.data_get_data(slot1.pay_type)
	else
		pay_config = Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id[slot1.pay_type])
	end

	if pay_config then
		slot0.price_txt:setString(uv0(TI18N("<img src='%s' scale=0.35 />  <div fontcolor=fff6e4 outline=2,#694a37>%d</div>"), PathTool.getItemRes(pay_config.icon), slot1.price))
	end

	if slot0.data.limit_soft and uv1:getMaxComfortValue() < slot0.data.limit_soft then
		slot0.lock_label:setString(uv0(TI18N("舒适度%d解锁"), slot0.data.limit_soft))
		slot0.lock_panel:setVisible(true)

		slot0.is_can_buy = false
	else
		slot0.lock_panel:setVisible(false)
	end

	slot0:updateSellStatus()
	slot0:updateHaveNum()
end

function HomeworldShopItem.updateSellStatus(slot0)
	if not slot0.data then
		return
	end

	if slot0.data.limit_count and slot0.data.limit_count > 0 then
		slot0.limit_image:setVisible(true)

		slot1 = slot0.data.limit_count
		slot2 = slot0.data.has_buy or 0

		slot0.limit_tips:setString(TI18N("限购"))
		slot0.limit_num:setString(slot2 .. "/" .. slot1)

		if slot2 < slot1 then
			slot0.limit_num:setTextColor(cc.c4b(41, 64, 3, 255))
			slot0.sell_out_panel:setVisible(false)
		else
			slot0.limit_num:setTextColor(cc.c4b(217, 80, 20, 255))
			slot0.sell_out_panel:setVisible(true)

			slot0.is_can_buy = false
		end
	elseif slot0.data.limit_day and slot0.data.limit_day > 0 then
		slot0.limit_image:setVisible(true)

		slot1 = slot0.data.limit_day
		slot2 = slot0.data.has_buy or 0

		slot0.limit_tips:setString(TI18N("日限"))
		slot0.limit_num:setString(slot2 .. "/" .. slot1)

		if slot2 < slot1 then
			slot0.limit_num:setTextColor(cc.c4b(41, 64, 3, 255))
			slot0.sell_out_panel:setVisible(false)
		else
			slot0.limit_num:setTextColor(cc.c4b(217, 80, 20, 255))
			slot0.sell_out_panel:setVisible(true)

			slot0.is_can_buy = false
		end
	elseif slot0.data.limit_week and slot0.data.limit_week > 0 then
		slot0.limit_image:setVisible(true)

		slot1 = slot0.data.limit_week
		slot2 = slot0.data.has_buy or 0

		slot0.limit_tips:setString(TI18N("周限"))
		slot0.limit_num:setString(slot2 .. "/" .. slot1)

		if slot2 < slot1 then
			slot0.limit_num:setTextColor(cc.c4b(41, 64, 3, 255))
			slot0.sell_out_panel:setVisible(false)
		else
			slot0.limit_num:setTextColor(cc.c4b(217, 80, 20, 255))
			slot0.sell_out_panel:setVisible(true)

			slot0.is_can_buy = false
		end
	elseif slot0.data.limit_month and slot0.data.limit_month > 0 then
		slot0.limit_image:setVisible(true)

		slot1 = slot0.data.limit_month
		slot2 = slot0.data.has_buy or 0

		slot0.limit_tips:setString(TI18N("月限"))
		slot0.limit_num:setString(slot2 .. "/" .. slot1)

		if slot2 < slot1 then
			slot0.limit_num:setTextColor(cc.c4b(41, 64, 3, 255))
			slot0.sell_out_panel:setVisible(false)
		else
			slot0.limit_num:setTextColor(cc.c4b(217, 80, 20, 255))
			slot0.sell_out_panel:setVisible(true)

			slot0.is_can_buy = false
		end
	else
		slot0.limit_image:setVisible(false)
		slot0.sell_out_panel:setVisible(false)
	end
end

function HomeworldShopItem.updateHaveNum(slot0)
	if not slot0.item_config then
		return
	end

	if not slot0.num_txt then
		return
	end

	slot1 = 0

	if BackPackConst.Gain_To_Bag_Code[slot0.item_config.gain_type] then
		slot1 = (slot2 ~= BackPackConst.Bag_Code.HOME or uv0:getFurnitureAllNumByBid(slot0.item_config.id)) and BackpackController:getInstance():getModel():getPackItemNumByBid(slot2, slot0.item_config.id)
	end

	slot0.num_txt:setString(uv1(TI18N("已拥有:%d"), slot1))
end

function HomeworldShopItem.DeleteMe(slot0)
	if slot0.buy_success_random then
		GlobalEvent:getInstance():UnBind(slot0.buy_success_random)

		slot0.buy_success_random = nil
	end

	if slot0.buy_success_item then
		GlobalEvent:getInstance():UnBind(slot0.buy_success_item)

		slot0.buy_success_item = nil
	end

	if slot0.modify_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.modify_goods_event)

		slot0.modify_goods_event = nil
	end

	if slot0.add_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.add_goods_event)

		slot0.add_goods_event = nil
	end

	if slot0.del_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.del_goods_event)

		slot0.del_goods_event = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
