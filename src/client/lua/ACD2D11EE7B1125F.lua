MarketItem = class("MarketItem", function ()
	return ccui.Widget:create()
end)
slot0 = MarketController:getInstance()

function MarketItem.ctor(slot0)
	slot0.ctrl = MarketController:getInstance()

	slot0:configUI()
	slot0:registerEvent()
end

function MarketItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("market/market_item"))

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
	slot0.sold_icon = slot0.main_container:getChildByName("sold_icon")

	slot0.sold_icon:setLocalZOrder(20)
	slot0.sold_icon:setVisible(false)

	slot0.timeout_icon = slot0.main_container:getChildByName("timeout_icon")

	slot0.timeout_icon:setLocalZOrder(20)
	slot0.timeout_icon:setVisible(false)

	slot0.need_icon = slot0.main_container:getChildByName("need_icon")
	slot0.need_label = slot0.main_container:getChildByName("need_label")

	slot0.need_icon:setVisible(false)
	slot0.need_label:setVisible(false)
end

function MarketItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot0.goods_item == nil then
		slot0.goods_item = BackPackItem.new(true, true)

		slot0.goods_item:setPosition(75, slot0.main_container:getContentSize().height / 2)
		slot0.main_container:addChild(slot0.goods_item)
	end

	slot0.price:setString(slot1.price)

	slot2 = deepCopy(Config.ItemData.data_get_data(slot1.item_base_id or slot1.base_id))
	slot2.quantity = slot1.num

	slot0.goods_item:setData(slot2)
	slot0.goods_item:setDefaultTip()
	slot0.name:setString(slot2.name)
	slot0:changeIcon(slot1.status)

	if slot1.item_base_id then
		loadSpriteTexture(slot0.coin, PathTool.getItemRes(Config.ItemData.data_get_data(2).icon), LOADTEXT_TYPE)
	else
		loadSpriteTexture(slot0.coin, PathTool.getItemRes(Config.ItemData.data_get_data(1).icon), LOADTEXT_TYPE)
	end

	slot0:checkNeedStatus()
end

function MarketItem.checkNeedStatus(slot0, slot1)
	if slot0.data == nil then
		return
	end

	if uv0:checkIsNeedItem(slot0.data.item_base_id) then
		slot0.need_icon:setVisible(true)
		slot0.need_label:setVisible(true)
	else
		slot0.need_icon:setVisible(false)
		slot0.need_label:setVisible(false)
	end
end

function MarketItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function MarketItem.getData(slot0)
	return slot0.data
end

function MarketItem.changeIcon(slot0, slot1)
	if slot1 == 3 then
		slot0.timeout_icon:setVisible(true)
		slot0.sold_icon:setVisible(false)
		slot0:setTouchEnabled(true)
	elseif slot1 == 2 then
		slot0.sold_icon:setVisible(true)
		slot0.timeout_icon:setVisible(false)
		slot0:setTouchEnabled(false)
	elseif slot0.data.num == 0 then
		slot0.sold_icon:setVisible(true)
		slot0.timeout_icon:setVisible(false)
		slot0:setTouchEnabled(false)
	else
		slot0.timeout_icon:setVisible(false)
		slot0.sold_icon:setVisible(false)
		slot0:setTouchEnabled(true)
	end
end

function MarketItem.registerEvent(slot0)
	slot0.main_container:addTouchEventListener(function (slot0, slot1)
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

			slot0:setScale(1)
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()

			slot0:setScale(0.95)
		elseif slot1 == ccui.TouchEventType.canceled then
			slot0:setScale(1)
		end
	end)
end

function MarketItem.updateSelfInfo(slot0, slot1, slot2)
	if slot0.data == nil then
		return
	end

	slot0.data.num = slot1
	slot0.data.status = slot2

	slot0.goods_item:setNum(slot1)
	slot0:checkNeedStatus()
	slot0:changeIcon(slot2)
end

function MarketItem.DeleteMe(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
