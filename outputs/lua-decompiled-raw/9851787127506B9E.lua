ActDailyLimitGiftItem = ActDailyLimitGiftItem or class("ActDailyLimitGiftItem", function ()
	return ccui.Widget:create()
end)

function ActDailyLimitGiftItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_daily_limit_gift_item"))

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(cc.size(640, 135))
	slot0:setTouchEnabled(true)
	slot0:setSwallowTouches(false)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot1 = slot0:getContentSize().height / 2
	slot0.goods_item = BackPackItem.new(true, true, false, 0.8, true, true)

	slot0.goods_item:setPosition(70, slot1)
	slot0.container:addChild(slot0.goods_item)

	slot0.goods_name = createLabel(24, cc.c4b(104, 69, 42, 255), nil, 160, slot1, "", slot0.container, nil, cc.p(0, 0.5))
	slot0.goods_count = createLabel(30, cc.c4b(147, 83, 34, 255), nil, 650, slot1, "", slot0.container, nil, cc.p(1, 0.5))
end

function ActDailyLimitGiftItem.setData(slot0, slot1)
	if Config.ItemData.data_get_data(slot1[1]) then
		slot0.goods_item:setData(slot4)
		slot0.goods_name:setString(slot4.name)
		slot0.goods_count:setString("x" .. MoneyTool.GetMoneyString(slot1[2]))
	end
end

function ActDailyLimitGiftItem.DeleteMe(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()

		slot0.goods_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
