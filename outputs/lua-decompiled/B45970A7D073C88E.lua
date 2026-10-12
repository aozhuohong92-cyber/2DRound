ActionBuyPanel = ActionBuyPanel or BaseClass(BaseView)
slot0 = ActiontermbeginsController:getInstance()

function ActionBuyPanel.__init(slot0)
	slot0.is_full_screen = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "actiontermbegins/action_buy_panel"
	slot0.res_list = {}
	slot0.is_can_buy_max = false
end

function ActionBuyPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setPosition(360, 640)
	slot0.background:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.title_label = slot0.title_con:getChildByName("title_label")

	slot0.title_label:setString(TI18N("购买"))

	slot0.ok_btn = slot0.main_container:getChildByName("ok_btn")

	slot0.ok_btn:setTitleText(TI18N("购买"))

	slot0.ok_btn.label = slot0.ok_btn:getTitleRenderer()

	if slot0.ok_btn.label ~= nil then
		slot0.ok_btn.label:enableOutline(Config.ColorData.data_color4[264], 2)
	end

	slot0.cancel_btn = slot0.main_container:getChildByName("cancel_btn")

	slot0.cancel_btn:setTitleText(TI18N("取消"))

	slot0.cancel_btn.label = slot0.cancel_btn:getTitleRenderer()

	if slot0.cancel_btn.label ~= nil then
		slot0.cancel_btn.label:enableOutline(Config.ColorData.data_color4[263], 2)
	end

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.item_con = slot0.main_container:getChildByName("item_con")
	slot0.name = slot0.item_con:getChildByName("name")
	slot0.have_count_title = slot0.item_con:getChildByName("have_count_title")

	slot0.have_count_title:setString(TI18N("当前拥有:"))

	slot0.have_count = slot0.item_con:getChildByName("have_count")
	slot0.icon_bg_image = slot0.item_con:getChildByName("Image_1")
	slot0.goods_item = BackPackItem.new()

	slot0.goods_item:setPosition(110, slot0.item_con:getContentSize().height / 2 - 2)
	slot0.item_con:addChild(slot0.goods_item)

	slot0.info_con = slot0.main_container:getChildByName("info_con")
	slot0.slider = slot0.info_con:getChildByName("slider")

	slot0.slider:setBarPercent(10, 89)

	slot0.buy_count_title = slot0.info_con:getChildByName("buy_count_title")

	slot0.buy_count_title:setString(TI18N("购买数量："))

	slot0.plus_btn = slot0.info_con:getChildByName("plus_btn")
	slot0.buy_count = slot0.info_con:getChildByName("buy_count")
	slot0.num = 1

	slot0.buy_count:setString(slot0.num)

	slot0.min_btn = slot0.info_con:getChildByName("min_btn")
	slot0.max_btn = slot0.info_con:getChildByName("max_btn")
	slot0.buy_desc = slot0.main_container:getChildByName("buy_desc")

	slot0.buy_desc:setString("")
end

function ActionBuyPanel.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.setting = slot1
	slot3 = slot1.name
	slot4 = slot1.shop_type
	slot0.limit_num = slot1.limit_num

	if Config.ItemData.data_get_data(slot1.item_id) then
		slot0.goods_item:setData(slot5)

		if slot3 then
			slot0.name:setString(slot3)
		else
			slot0.name:setString(slot5.name)
		end

		slot0.have_count:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot5.id))

		if slot0.limit_num == nil or slot0.limit_num == 0 then
			slot0.limit_num = slot6
		end
	else
		slot0.name:setString(slot3)
	end

	slot0:initShopTypeUI(slot4)
	slot0:setCurUseItemInfoByNum(slot0.num, true)
end

function ActionBuyPanel.initShopTypeUI(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1 == MallConst.MallType.TermBeginsBuy then
		slot0.buy_count_title:setString(TI18N("提交数量:"))
		slot0.ok_btn:setTitleText(TI18N("提交"))
		slot0.title_label:setString(TI18N("提交试卷"))
	end
end

function ActionBuyPanel.onClickBtnClose(slot0)
	uv0:openActionBuyPanel(false)
end

function ActionBuyPanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.cancel_btn, handler(slot0, slot0.onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.ok_btn, handler(slot0, slot0.sendBuy), true, 1)

	if slot0.slider ~= nil then
		slot0.slider:addEventListener(function (slot0, slot1)
			if slot1 == ccui.SliderEventType.percentChanged then
				if uv0.limit_num <= 0 then
					uv0.slider:setPercent(0)

					return
				end

				uv0:setCurUseItemInfoByPercent(uv0.slider:getPercent())
			end
		end)
	end

	slot0.min_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.num <= 0 then
				return
			end

			uv0.num = uv0.num - 1

			uv0:setCurUseItemInfoByNum(uv0.num)
		end
	end)
	slot0.plus_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			uv0.num = uv0.num + 1

			uv0:setCurUseItemInfoByNum(uv0.num)
		end
	end)
	slot0.max_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			uv0.num = uv0.limit_num

			uv0:setCurUseItemInfoByNum(uv0.num)
		end
	end)
end

function ActionBuyPanel.sendBuy(slot0)
	if not slot0.setting then
		return
	end

	if slot0.num > 0 and slot0.setting.shop_type == MallConst.MallType.TermBeginsBuy then
		ActiontermbeginsController:getInstance():sender26704(slot0.num)
	end

	uv0:openActionBuyPanel(false)
end

function ActionBuyPanel.setCurUseItemInfoByPercent(slot0, slot1)
	slot0:setCurUseItemInfoByNum(math.floor(slot1 * slot0.limit_num * 0.01))
end

function ActionBuyPanel.setCurUseItemInfoByNum(slot0, slot1, slot2)
	if not slot2 and slot0.limit_num <= 0 then
		message(TI18N("数量不足"))

		return
	end

	slot0.num = slot1

	if slot0.num < 1 then
		slot0.num = 1
	end

	if slot0.limit_num < slot0.num then
		slot0.num = slot0.limit_num
	end

	if slot0.num / slot0.limit_num * 100 < 1 then
		slot3 = math.ceil(slot3)
	end

	slot0.slider:setPercent(slot3)
	slot0.buy_count:setString(slot0.num)
end

function ActionBuyPanel.close_callback(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0.goods_item = nil

	uv0:openActionBuyPanel(false)
end
