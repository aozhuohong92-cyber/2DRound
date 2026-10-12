MallBuyWindow = MallBuyWindow or BaseClass(BaseView)
slot0 = MallController:getInstance():getModel()

function MallBuyWindow.__init(slot0)
	slot0.ctrl = MallController:getInstance()
	slot0.is_full_screen = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "mall/mall_buy_panel"
	slot0.res_list = {}
	slot0.is_can_buy_max = false
end

function MallBuyWindow.open_callback(slot0)
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
		slot0.ok_btn.label:enableOutline(cc.c4b(118, 69, 25, 255), 2)
	end

	slot0.cancel_btn = slot0.main_container:getChildByName("cancel_btn")

	slot0.cancel_btn:setTitleText(TI18N("取消"))

	slot0.cancel_btn.label = slot0.cancel_btn:getTitleRenderer()

	if slot0.cancel_btn.label ~= nil then
		slot0.cancel_btn.label:enableOutline(cc.c4b(41, 74, 21, 255), 2)
	end

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.item_con = slot0.main_container:getChildByName("item_con")
	slot0.name = slot0.item_con:getChildByName("name")
	slot0.coin = slot0.item_con:getChildByName("coin")
	slot0.price = slot0.item_con:getChildByName("price")
	slot0.limit = slot0.item_con:getChildByName("limit")
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
	slot0.total_price_title = slot0.info_con:getChildByName("total_price_title")

	slot0.total_price_title:setString(TI18N("总价："))

	slot0.total_price = slot0.info_con:getChildByName("total_price")
	slot0.buy_desc = slot0.main_container:getChildByName("buy_desc")

	slot0.buy_desc:setString("")

	slot0.tips_label = createLabel(22, 15, nil, 385, 277, TI18N("只能买这么多了"), slot0.main_container, nil, cc.p(0.5, 0.5))

	slot0.tips_label:setVisible(false)
end

function MallBuyWindow.openRootWnd(slot0)
end

function MallBuyWindow.setData(slot0, slot1)
	slot0.data = slot1
	slot2 = Config.ItemData.data_get_data(slot1.item_bid or slot1.item_id)
	slot0.shop_type = slot1.shop_type

	if slot1.shop_type == MallConst.MallType.FestivalAction then
		slot0.goods_item:setBaseData(slot1.item_bid, slot1.quantity)

		slot0.num = slot1.limit_num - slot1.has_buy

		slot0.buy_desc:setString(TI18N("活跃值购买后仅增加该活动总活跃值"))
	elseif slot1.shop_type == MallConst.MallType.SuitShop then
		slot0.goods_item:setBaseData(slot1.item_bid)
	elseif slot1.shop_type == MallConst.MallType.SteriousShop then
		slot0.goods_item:setBaseData(slot1.item_bid)
		slot0.total_price_title:setVisible(false)
		slot0.total_price:setVisible(false)
		slot0.ok_btn.label:setString(TI18N("兑换"))
		slot0.title_label:setString(TI18N("兑换"))
		slot0.icon_bg_image:setVisible(false)
		slot0.price:setVisible(false)
		slot0.coin:setVisible(false)
		slot0.limit:setPositionX(211)
	elseif slot1.shop_type == MallConst.MallType.AdventureShotKillBuy then
		if slot0.goods_item.item_icon then
			loadSpriteTexture(slot0.goods_item.item_icon, PathTool.getResFrame("adventurewindow", "adventurewindow_7"), LOADTEXT_TYPE_PLIST)
			slot0.goods_item.item_icon:setScale(1.2)
		end

		slot0.goods_item:setSelfBackground(3)
	elseif slot1.shop_type == MallConst.MallType.ActionYearMonsterExchange then
		slot0.goods_item:setBaseData(slot1.item_bid, slot1.quantity)
		slot0.total_price_title:setVisible(false)
		slot0.total_price:setVisible(false)
		slot0.ok_btn.label:setString(TI18N("兑换"))
		slot0.title_label:setString(TI18N("兑换"))
		slot0.icon_bg_image:setVisible(false)
		slot0.price:setVisible(false)
		slot0.coin:setVisible(false)
		slot0.limit:setPositionX(211)
	else
		slot0.goods_item:setData(slot2)

		if slot0.data and slot0.data.limit_num then
			slot0.goods_item:setSelfNum(slot0.data.item_num)
		end
	end

	if slot1.name then
		slot0.name:setString(slot1.name)
	else
		slot0.name:setString(slot2.name)
	end

	slot0.limit_num = slot0.data.limit_num

	if slot1.discount and slot1.discount > 0 then
		slot0.price:setString(slot1.discount)

		slot0.price_val = slot1.discount
	else
		slot0.price:setString(slot1.price)

		slot0.price_val = slot1.price
	end

	if slot1.shop_type == MallConst.MallType.ActionShop then
		slot0.is_can_buy_num = slot0.ctrl:getModel():checkActionMoenyByType(slot1.pay_type, slot0.price_val)
	else
		slot0.is_can_buy_num = slot0.ctrl:getModel():checkMoenyByType(slot1.pay_type, slot0.price_val)
	end

	slot3 = nil

	slot0.coin:loadTexture(PathTool.getItemRes(((type(slot1.pay_type) ~= "number" or Config.ItemData.data_get_data(slot1.pay_type)) and Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id[slot1.pay_type])).icon), LOADTEXT_TYPE)

	if slot0.limit_num > 0 and slot1.is_show_limit_label and slot1.has_buy then
		slot0.limit:setString(TI18N("限购") .. slot0.limit_num - slot1.has_buy .. TI18N("个"))

		slot0.is_can_buy_max = true
	else
		slot0.limit:setString("")

		if slot1.shop_type ~= MallConst.MallType.Recovery and slot0.is_can_buy_num < slot0.limit_num then
			slot0.limit_num = slot0.is_can_buy_num

			slot0.tips_label:setVisible(false)

			slot0.is_can_buy_max = false
		end
	end

	slot0.num = math.min(slot0.is_can_buy_num, slot0.num)

	slot0:setCurUseItemInfoByNum(slot0.num)
end

function MallBuyWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openMallBuyWindow(false)
			end
		end)
	end

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openMallBuyWindow(false)
			end
		end)
	end

	if slot0.slider ~= nil then
		slot0.slider:addEventListener(function (slot0, slot1)
			if slot1 == ccui.SliderEventType.percentChanged then
				if uv0.slider:getPercent() == 100 and uv0.limit_num <= uv0.is_can_buy_num and uv0.is_can_buy_max == false then
					uv0.tips_label:setVisible(true)
				else
					uv0.tips_label:setVisible(false)
				end

				uv0:setCurUseItemInfoByPercent(uv0.slider:getPercent())
			end
		end)
	end

	slot0.min_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.slider:getPercent() == 0 then
				return
			end

			if uv0.num == 0 then
				return
			end

			uv0.num = uv0.num - 1

			uv0:setCurUseItemInfoByNum(uv0.num)
		end
	end)
	slot0.plus_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.slider:getPercent() == 100 then
				return
			end

			if math.min(uv0.is_can_buy_num, uv0.limit_num - uv0.data.has_buy) <= uv0.num then
				return
			end

			uv0.num = uv0.num + 1

			uv0:setCurUseItemInfoByNum(uv0.num)
		end
	end)
	slot0.max_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.slider:getPercent() == 100 then
				return
			end

			if uv0.limit_num - uv0.data.has_buy <= uv0.num then
				return
			end

			uv0.num = math.min(uv0.is_can_buy_num, slot3)

			uv0:setCurUseItemInfoByNum(uv0.num)
		end
	end)

	if slot0.ok_btn then
		slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.data then
					if uv0.data.shop_type == MallConst.MallType.Recovery then
						uv0.ctrl:sender13407(uv0.data.order, uv0.data.shop_type, 1, 1)
					elseif uv0.data.shop_type == MallConst.MallType.ActionShop then
						uv0.ctrl:send16661(uv0.data.bid, uv0.data.aim, uv0.num)
					elseif uv0.data.shop_type == MallConst.MallType.FestivalAction then
						ActionController:getInstance():cs16604(uv0.data.bid, uv0.data.aim, uv0.num)
					elseif uv0.data.shop_type == MallConst.MallType.SuitShop then
						MallController:getInstance():sender13402(uv0.data.id, uv0.num)
					elseif uv0.data.shop_type == MallConst.MallType.GuessShop then
						uv0.ctrl:sender13407(uv0.data.order, uv0.data.shop_type, 1, 1)
					elseif uv0.data.shop_type == MallConst.MallType.SkillShop then
						uv0:showSkillAlert(uv0.data)
					elseif uv0.data.shop_type == MallConst.MallType.CrossarenaShop then
						uv0.ctrl:sender13407(uv0.data.order, uv0.data.shop_type, 1, uv0.num)
					elseif uv0.data.shop_type == MallConst.MallType.SteriousShop then
						ActionController:getInstance():sender16689(uv0.data.aim, uv0.num)
					elseif uv0.data.shop_type == MallConst.MallType.AdventureShotKillBuy then
						AdventureController:getInstance():send20636(uv0.num)
					elseif uv0.data.shop_type == MallConst.MallType.ActionYearMonsterExchange then
						ActionyearmonsterController:getInstance():sender28216(uv0.data.bid, uv0.num)
					elseif uv0.data.call_back then
						uv0.data.call_back(uv0.data, uv0.num)
					else
						uv0.ctrl:sender13402(uv0.data.id, uv0.num)
					end

					uv0.ctrl:openMallBuyWindow(false)
				end
			end
		end)
	end

	if slot0.cancel_btn then
		slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0.ctrl:openMallBuyWindow(false)
			end
		end)
	end
end

function MallBuyWindow.showSkillAlert(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.pay_type ~= 3 then
		slot0.ctrl:sender13407(slot1.order, slot1.shop_type, 1, 1)
	else
		slot2 = slot1.price

		if slot1.discount ~= 0 then
			slot2 = slot1.discount
		end

		if not RoleController:getInstance():getRoleVo() then
			return
		end

		if slot2 <= slot3.gold then
			CommonAlert.show(string.format(TI18N("是否使用<img src=%s visible=true scale=0.4 /><div fontColor=#289b14 fontsize= 26>%d</div>购买<div fontColor=#289b14 fontsize= 26>%s</div>？"), PathTool.getItemRes(3), slot2, Config.ItemData.data_get_data(slot1.item_id).name), TI18N("确定"), function ()
				uv0.ctrl:sender13407(uv1.order, uv1.shop_type, 1, 1)
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		elseif Config.ItemData.data_get_data(slot1.pay_type) then
			BackpackController:getInstance():openTipsSource(true, slot5)
		end
	end
end

function MallBuyWindow.setCurUseItemInfoByPercent(slot0, slot1)
	slot0:setCurUseItemInfoByNum(math.floor(slot1 * math.min(slot0.is_can_buy_num, slot0.limit_num - slot0.data.has_buy) * 0.01 + 0.5))
end

function MallBuyWindow.setCurUseItemInfoByNum(slot0, slot1)
	slot0.num = slot1
	slot2 = math.min(slot0.is_can_buy_num, slot0.limit_num - slot0.data.has_buy)

	if slot0.num < 1 then
		slot0.num = 1
	elseif slot2 < slot0.num then
		slot0.num = slot2
	end

	if slot0.num / slot2 * 100 < 1 then
		slot3 = math.ceil(slot3)
	end

	slot0.slider:setPercent(slot3)
	slot0.buy_count:setString(slot0.num)
	slot0.total_price:setString(slot0.num * slot0.price_val)
end

function MallBuyWindow.close_callback(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0.goods_item = nil

	slot0.ctrl:openMallBuyWindow(false)
end
