SliverSellItem = class("SliverSellItem", function ()
	return ccui.Widget:create()
end)

function SliverSellItem.ctor(slot0)
	slot0.ctrl = MarketController:getInstance()

	slot0:configUI()
	slot0:registerEvent()
end

function SliverSellItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("market/sliver_item"))

	slot0:setAnchorPoint(cc.p(0, 1))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(306, 143))
	slot0:setTouchEnabled(true)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setTouchEnabled(true)
	slot0.main_container:setSwallowTouches(false)

	slot0.name = slot0.main_container:getChildByName("name")
	slot0.coin = slot0.main_container:getChildByName("coin")
	slot0.price = slot0.main_container:getChildByName("price")
	slot0.price_bg = slot0.main_container:getChildByName("price_bg")
	slot0.empty_item = slot0.main_container:getChildByName("empty_item")
	slot0.add_icon = slot0.empty_item:getChildByName("add_icon")
	slot0.lock_icon = slot0.empty_item:getChildByName("lock_icon")

	slot0.empty_item:setVisible(false)

	slot0.sold_icon = slot0.main_container:getChildByName("sold_icon")

	slot0.sold_icon:setLocalZOrder(20)
	slot0.sold_icon:setVisible(false)

	slot0.timeout_icon = slot0.main_container:getChildByName("timeout_icon")

	slot0.timeout_icon:setLocalZOrder(20)
	slot0.timeout_icon:setVisible(false)

	slot0.get_icon = slot0.main_container:getChildByName("get_icon")

	slot0.get_icon:setLocalZOrder(20)
	slot0.get_icon:setVisible(false)

	slot0.goods_item = BackPackItem.new(true, true)

	slot0.goods_item:setPosition(78, slot0.main_container:getContentSize().height / 2)
	slot0.main_container:addChild(slot0.goods_item)
	slot0.goods_item:setVisible(false)
end

function SliverSellItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1.is_free then
		if slot1.is_free == 0 then
			slot0.goods_item:setVisible(false)
			slot0.empty_item:setVisible(true)
			slot0.add_icon:setVisible(true)
			slot0.lock_icon:setVisible(false)
			slot0.coin:setVisible(false)
			slot0.name:setString("")
			slot0.price:setString("")
			slot0.price_bg:setVisible(false)
			slot0.timeout_icon:setVisible(false)
			slot0.get_icon:setVisible(false)
			slot0.sold_icon:setVisible(false)
		elseif slot1.is_free == 1 then
			slot0.empty_item:setVisible(false)
			slot0.goods_item:setVisible(true)

			slot2 = deepCopy(Config.ItemData.data_get_data(slot1.item_base_id))
			slot2.quantity = slot1.num

			slot0.name:setString(slot2.name)
			slot0.goods_item:setData(slot2)
			slot0.goods_item:setDefaultTip()
			slot0.coin:setVisible(true)
			slot0.price:setString(slot1.price)
			slot0.price_bg:setVisible(true)

			if slot1.status == 1 then
				slot0.get_icon:setVisible(false)
				slot0.timeout_icon:setVisible(false)
				slot0.sold_icon:setVisible(true)
			elseif slot1.status == 5 then
				slot0.sold_icon:setVisible(false)
				slot0.get_icon:setVisible(true)
				slot0.timeout_icon:setVisible(false)
			elseif slot1.status == 6 then
				slot0.timeout_icon:setVisible(true)
				slot0.get_icon:setVisible(false)
				slot0.sold_icon:setVisible(false)
			else
				slot0.timeout_icon:setVisible(false)
				slot0.get_icon:setVisible(false)
				slot0.sold_icon:setVisible(false)
			end
		end

		loadSpriteTexture(slot0.coin, PathTool.getItemRes(Config.ItemData.data_get_data(2).icon), LOADTEXT_TYPE)
	end

	if slot1.is_lock then
		slot0.goods_item:setVisible(false)
		slot0.empty_item:setVisible(true)
		slot0.add_icon:setVisible(false)
		slot0.lock_icon:setVisible(true)
		slot0.coin:setVisible(true)
		slot0.name:setString("")
		slot0.price:setString(Config.MarketSilverData.data_shop_open[slot1.cell_id].loss[1][2])
		slot0.price_bg:setVisible(true)
		loadSpriteTexture(slot0.coin, PathTool.getItemRes(Config.ItemData.data_get_data(Config.MarketSilverData.data_shop_open[slot1.cell_id].loss[1][1]).icon), LOADTEXT_TYPE)
		slot0.timeout_icon:setVisible(false)
		slot0.get_icon:setVisible(false)
		slot0.sold_icon:setVisible(false)
	end
end

function SliverSellItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function SliverSellItem.getData(slot0)
	return slot0.data
end

function SliverSellItem.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		customClickAction(uv0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.callback then
					uv0:callback()
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
end

function SliverSellItem.DeleteMe(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
