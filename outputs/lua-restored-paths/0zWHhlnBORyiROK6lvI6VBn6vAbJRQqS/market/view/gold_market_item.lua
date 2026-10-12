GoldMarketItem = class("GoldMarketItem", function ()
	return ccui.Widget:create()
end)

function GoldMarketItem.ctor(slot0)
	slot0.ctrl = MarketController:getInstance()

	slot0:configUI()
	slot0:registerEvent()
end

function GoldMarketItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("market/gold_market_item"))

	slot0:setAnchorPoint(cc.p(0, 1))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(622, 123))
	slot0:setTouchEnabled(true)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setTouchEnabled(true)
	slot0.main_container:setSwallowTouches(false)

	slot0.name = slot0.main_container:getChildByName("name")
	slot0.coin = slot0.main_container:getChildByName("coin")
	slot0.price = slot0.main_container:getChildByName("price")
	slot0.limit_tips = createRichLabel(20, 175, cc.p(0, 0.5), cc.p(310, 40))

	slot0.main_container:addChild(slot0.limit_tips)
	slot0.limit_tips:setVisible(false)

	slot0.buy_btn = slot0.main_container:getChildByName("buy_btn")
	slot0.buy_btn.label = slot0.buy_btn:getTitleRenderer()

	if slot0.buy_btn.label ~= nil then
		slot0.buy_btn.label:enableOutline(Config.ColorData.data_color4[178], 2)
	end

	slot0.buy_btn:setTitleText(TI18N("购买"))

	slot0.limit_icon = slot0.main_container:getChildByName("limit_icon")

	slot0.limit_icon:setLocalZOrder(20)
	slot0.limit_icon:setVisible(false)

	slot0.increase = createRichLabel(22, 175, cc.p(0.5, 0.5), cc.p(380, 80), 0, 0, 150)

	slot0.main_container:addChild(slot0.increase)
	slot0.increase:setString(string.format("<div fontcolor=%s>%s <img src=%s visible=true />", tranformC3bTostr(178), 123, PathTool.getResFrame("common", "common_90020")))

	slot0.goods_item = BackPackItem.new(true, true)

	slot0.goods_item:setData(Config.ItemData.data_get_data(1))
	slot0.goods_item:setScale(0.8)
	slot0.goods_item:setPosition(5 + slot0.goods_item:getContentSize().width / 2, slot0:getContentSize().height / 2)
	slot0.main_container:addChild(slot0.goods_item)

	slot0.need_icon = slot0.main_container:getChildByName("need_icon")
	slot0.need_label = slot0.main_container:getChildByName("need_label")

	slot0.need_icon:setVisible(false)
	slot0.need_label:setVisible(false)
end

function GoldMarketItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1 == nil then
		return
	end

	if Config.ItemData.data_get_data(slot1.base_id) then
		slot0.buy_btn:setTag(slot1.base_id)
		slot0.goods_item:setData(slot2)
		slot0.goods_item:setDefaultTip()
		slot0.name:setString(slot2.name)
		slot0.price:setString(slot1.cur_price)

		slot3 = 182
		slot4 = "一 一"
		slot5 = ""
		slot6 = ""

		if slot1.margin == "" or slot1.margin == nil then
			slot1.margin = 1000
		end

		slot0.margin = string.format("%0.1f", (slot1.margin - 1000) / 10)

		slot0.increase:setString((slot1.margin >= 1000 or string.format("<div fontcolor=%s>%s<img src=%s visible=true />", tranformC3bTostr(183), slot0.margin .. "%", PathTool.getResFrame("market", "market_down"))) and (slot1.margin <= 1000 or string.format("<div fontcolor=%s>%s<img src=%s visible=true />", tranformC3bTostr(178), slot0.margin .. "%", PathTool.getResFrame("market", "market_up"))) and slot4)

		if slot1.limit_num and slot1.limit_num > 0 then
			slot7 = ""

			if slot1.limit_type == 1 then
				slot7 = TI18N("每日限购")
			elseif slot1.limit_type == 2 then
				slot7 = TI18N("每周限购")
			end

			slot0.limit_tips:setString(string.format(TI18N("%s<div fontcolor=#249003>%s/%s</div>个"), slot7, slot1.has_buy, slot1.limit_num))
			slot0.limit_tips:setVisible(true)
			slot0.limit_icon:setVisible(true)
			slot0.increase:setPositionY(80)
		else
			slot0.limit_tips:setVisible(false)
			slot0.limit_icon:setVisible(false)
			slot0.increase:setPositionY(60)
		end
	end

	if slot0.ctrl:checkIsNeedItem(slot1.base_id) == true then
		slot0.need_icon:setVisible(true)
		slot0.need_label:setVisible(true)
	else
		slot0.need_icon:setVisible(false)
		slot0.need_label:setVisible(false)
	end
end

function GoldMarketItem.setSoldAll(slot0, slot1)
end

function GoldMarketItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function GoldMarketItem.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
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

	if slot0.buy_btn then
		slot0.buy_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.data then
					if uv0.data.limit_num and uv0.data.limit_num > 0 and uv0.data.has_buy == uv0.data.limit_num then
						message(TI18N("已经购买完啦"))
					elseif math.floor(RoleController:getInstance():getRoleVo().coin / (uv0.data.cur_price or uv0.data.price or 1)) < 1 then
						if Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id.coin) then
							BackpackController:getInstance():openTipsSource(true, slot5)
						end
					elseif tonumber(uv0.margin) >= 10 and not GuideController:getInstance():isInGuide() then
						CommonAlert.show(TI18N("目前该物品涨幅超过10%,继续购买将以130%的价格支付,是否继续？"), TI18N("确定"), function ()
							uv0.ctrl:openBuyOrSellWindow(true, 1, uv0.data)
						end, TI18N("取消"), nil, CommonAlert.type.rich)
					else
						uv0.ctrl:openBuyOrSellWindow(true, 1, uv0.data)
					end
				end
			end
		end)
	end
end

function GoldMarketItem.DeleteMe(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
