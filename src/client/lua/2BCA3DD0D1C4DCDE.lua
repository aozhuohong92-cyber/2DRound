ActDailyLimitGiftTips = ActDailyLimitGiftTips or BaseClass(BaseView)
slot0 = ActionController:getInstance()

function ActDailyLimitGiftTips.__init(slot0)
	slot0.ctrl = MallController:getInstance()
	slot0.is_full_screen = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "action/action_daily_limit_gift_tips"
end

function ActDailyLimitGiftTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setPosition(360, 640)
	slot0.background:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.title_label = slot0.title_con:getChildByName("title_label")

	slot0.title_label:setString(TI18N("购买道具"))

	slot0.buy_btn = slot0.main_container:getChildByName("buy_btn")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot1 = slot0.main_container:getChildByName("content")
	slot0.goods_name = slot1:getChildByName("name")
	slot0.goods_desc = slot1:getChildByName("desc")
	slot0.goods_tips = slot1:getChildByName("tips")
	slot0.goods_item = BackPackItem.new()

	slot0.goods_item:setPosition(80, 220)
	slot1:addChild(slot0.goods_item)

	slot0.buy_price = createRichLabel(30, cc.c4b(236, 212, 173, 255), cc.p(0.5, 0.5), cc.p(slot0.buy_btn:getContentSize().width / 2, slot0.buy_btn:getContentSize().height / 2))

	slot0.buy_btn:addChild(slot0.buy_price)
end

function ActDailyLimitGiftTips.openRootWnd(slot0, slot1)
	slot0.config = slot1

	if Config.ItemData.data_get_data(slot1.item_bid) then
		slot0.goods_item:setData(slot2)
		slot0.goods_name:setString(string.format(TI18N("是否购买【%s】"), slot2.name))
		slot0.goods_desc:setString(slot2.desc)
		slot0.goods_tips:setString(TI18N("有缘人，是否确认购买此件商品"))
		slot0.buy_price:setString(string.format(TI18N("<img src=%s scale=0.4 visible=true /> <div outline=2,#442012>%s</div>"), PathTool.getItemRes(3), slot1.discount))
	end
end

function ActDailyLimitGiftTips.register_event(slot0)
	registerButtonEventListener(slot0.buy_btn, function ()
		MallController:getInstance():sender13402(uv0.config.id, 1)
	end, true)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openDailyLimitGiftTips(false)
	end, true, 2)

	if not slot0.buy_success_event then
		slot0.buy_success_event = GlobalEvent:getInstance():Bind(MallEvent.Buy_Success_Event, function (slot0)
			uv0:openDailyLimitGiftTips(false)
		end)
	end
end

function ActDailyLimitGiftTips.close_callback(slot0)
	if slot0.buy_success_event then
		GlobalEvent:getInstance():UnBind(slot0.buy_success_event)

		slot0.buy_success_event = nil
	end

	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0.goods_item = nil
	slot0.config = nil

	uv0:openDailyLimitGiftTips(false)
end
