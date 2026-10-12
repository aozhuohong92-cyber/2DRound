MallBuyGiftWindow = MallBuyGiftWindow or BaseClass(BaseView)
slot0 = MallController:getInstance():getModel()

function MallBuyGiftWindow.__init(slot0)
	slot0.ctrl = MallController:getInstance()
	slot0.is_full_screen = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "mall/mall_buy_panel"
	slot0.res_list = {}
	slot0.is_can_buy_max = false
end

function MallBuyGiftWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setPosition(360, 640)
	slot0.background:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.title_label = slot0.title_con:getChildByName("title_label")

	slot0.title_label:setString("购买")

	slot0.title_img = slot0.main_container:getChildByName("title_img")
	slot0.ok_btn = slot0.main_container:getChildByName("ok_btn")

	slot0.ok_btn:setTitleText("购买")

	slot0.ok_btn.label = slot0.ok_btn:getTitleRenderer()

	if slot0.ok_btn.label ~= nil then
		slot0.ok_btn.label:enableOutline(cc.c4b(153, 96, 29, 255), 2)
	end

	slot0.cancel_btn = slot0.main_container:getChildByName("cancel_btn")

	slot0.cancel_btn:setTitleText("取消")

	slot0.cancel_btn.label = slot0.cancel_btn:getTitleRenderer()

	if slot0.cancel_btn.label ~= nil then
		slot0.cancel_btn.label:enableOutline(cc.c4b(66, 109, 128, 255), 2)
	end

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.item_con = slot0.main_container:getChildByName("item_con")
	slot0.name = slot0.item_con:getChildByName("name")
	slot0.coin = slot0.item_con:getChildByName("coin")
	slot0.price = slot0.item_con:getChildByName("price")
	slot0.limit = slot0.item_con:getChildByName("limit")
	slot0.icon_bg_image = slot0.item_con:getChildByName("Image_1")
	slot0.goods_item = BackPackItem.new()

	slot0.goods_item:setData(Config.ItemData.data_get_data(39008))
	slot0.goods_item:setPosition(170, 70)
	slot0.item_con:addChild(slot0.goods_item)
	slot0.goods_item:setPosition(110, slot0.item_con:getContentSize().height / 2 - 2)

	slot0.info_con = slot0.main_container:getChildByName("info_con")
	slot0.slider = slot0.info_con:getChildByName("slider")

	slot0.slider:setBarPercent(10, 89)

	slot0.buy_count_title = slot0.info_con:getChildByName("buy_count_title")

	slot0.buy_count_title:setString("购买数量：")

	slot0.plus_btn = slot0.info_con:getChildByName("plus_btn")
	slot0.buy_count = slot0.info_con:getChildByName("buy_count")
	slot0.num = 1

	slot0.buy_count:setString(slot0.num)
	slot0.buy_count:setPositionX(slot0.buy_count_title:getPositionX() + slot0.buy_count_title:getContentSize().width + 10)

	slot0.min_btn = slot0.info_con:getChildByName("min_btn")
	slot0.max_btn = slot0.info_con:getChildByName("max_btn")
	slot0.total_price_title = slot0.info_con:getChildByName("total_price_title")

	slot0.total_price_title:setString("总价：")

	slot0.total_price = slot0.info_con:getChildByName("total_price")
	slot0.buy_desc = slot0.main_container:getChildByName("buy_desc")

	slot0.buy_desc:setString("")

	slot0.tips_label = createLabel(22, 15, nil, 361, 213, "只能买这么多了", slot0.main_container, nil, cc.p(0.5, 0.5))

	slot0.tips_label:setVisible(false)
end

function MallBuyGiftWindow.openRootWnd(slot0)
end

function MallBuyGiftWindow.setData(slot0, slot1)
	if type(slot1) == "number" then
		slot0.data = Config.ChargeData.data_charge_data[slot1]
		slot0.gift_info = Config.MiscData.data_cycle_gift_info[2][slot1]

		if slot0.gift_info == nil then
			slot0.gift_info = Config.MiscData.data_cycle_gift_info[1][slot1]
		end

		if slot2.name then
			slot0.name:setString(slot2.name)
		end

		slot0.limit_num = slot0.gift_info.limit_count

		if slot0.gift_info.val > 0 then
			slot0.price:setString(slot0.gift_info.val)

			slot0.price_val = slot0.gift_info.val
		end

		slot0.is_can_buy_num = slot0.gift_info.count

		slot0.coin:loadTexture(PathTool.getItemRes(Config.ItemData.data_get_data(80224).icon), LOADTEXT_TYPE)

		if slot0.limit_num > 0 then
			slot0.limit:setString("限购" .. slot0.limit_num - slot2.add .. "个")

			slot0.is_can_buy_max = true
		else
			slot0.limit:setString("")

			if slot0.is_can_buy_num < slot0.limit_num then
				slot0.limit_num = slot0.is_can_buy_num

				slot0.tips_label:setVisible(false)

				slot0.is_can_buy_max = false
			end
		end

		slot0.num = math.min(slot0.is_can_buy_num, slot0.num)

		slot0:setCurUseItemInfoByNum(slot0.num)
	else
		for slot5, slot6 in pairs(slot1) do
			slot0.data = Config.ChargeData.data_charge_data[slot6.id]

			if slot0.data.name then
				slot0.name:setString(slot0.data.name)
			end

			slot0.limit_num = slot6.limit_count

			if slot0.data.val > 0 then
				slot0.price:setString(slot0.data.val)

				slot0.price_val = slot0.data.val
			end

			slot0.is_can_buy_num = slot6.limit_count

			slot0.coin:loadTexture(PathTool.getItemRes(Config.ItemData.data_get_data(80224).icon), LOADTEXT_TYPE)

			if slot0.limit_num > 0 then
				slot0.limit:setString("限购" .. slot0.limit_num - slot0.data.add .. "个")

				slot0.is_can_buy_max = true
			else
				slot0.limit:setString("")

				if slot0.is_can_buy_num < slot0.limit_num then
					slot0.limit_num = slot0.is_can_buy_num

					slot0.tips_label:setVisible(false)

					slot0.is_can_buy_max = false
				end
			end

			slot0.num = math.min(slot0.is_can_buy_num, slot0.num)

			slot0:setCurUseItemInfoByNum(slot0.num)
		end
	end
end

function MallBuyGiftWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openMallBuyGiftWindow(false)
			end
		end)
	end

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openMallBuyGiftWindow(false)
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
		customClickAction(slot0, slot1)

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
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.slider:getPercent() == 100 then
				return
			end

			if math.min(uv0.is_can_buy_num, uv0.limit_num - uv0.data.add) <= uv0.num then
				return
			end

			uv0.num = uv0.num + 1

			uv0:setCurUseItemInfoByNum(uv0.num)
		end
	end)
	slot0.max_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.slider:getPercent() == 100 then
				return
			end

			if uv0.limit_num - uv0.data.add <= uv0.num then
				return
			end

			uv0.num = math.min(uv0.is_can_buy_num, slot3)

			uv0:setCurUseItemInfoByNum(uv0.num)
		end
	end)

	if slot0.ok_btn then
		slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				slot2 = LoginController:getInstance():getModel()
				slot3 = RoleController:getInstance():getRoleVo()
				slot5, slot6 = unpack(Split(slot3.srv_id, "_"))
				slot7 = LoginController:getInstance():getModel():getLoginData()
				slot8 = slot7.srv_name
				slot9 = slot3.rid
				slot10 = slot3.skin_debris
				slot13 = slot3.srv_id
				slot14 = slot3.lev
				slot15 = "vip" .. slot3.vip_lev
				slot16 = slot3.rid .. "$$" .. slot5 .. "$$" .. slot6 .. "$$" .. LoginPlatForm:getInstance():getChannel() .. "$$" .. uv0.data.id .. "$$" .. uv0.data.name
				slot17 = slot7.host

				CommonAlert.show(string.format(TI18N("确定要充值吗?"), slot3.name), TI18N("确定"), function ()
					iceBirdOnPay1(uv0.data.id, uv0.data.name, uv0.data.name, uv0.data.val, uv0.num, uv1.gold, uv2, uv3, uv4, uv5, uv6, uv7, uv8, uv9, uv10, uv0.num * uv0.data.val, uv11.loginData.usrName)
					uv0.ctrl:openMallBuyGiftWindow(false)
				end, TI18N("取消"))
			end
		end)
	end

	if slot0.cancel_btn then
		slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0.ctrl:openMallBuyGiftWindow(false)
			end
		end)
	end
end

function MallBuyGiftWindow.showSkillAlert(slot0, slot1)
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
			CommonAlert.show(string.format("是否使用<img src=%s visible=true scale=0.4 /><div fontColor=#289b14 fontsize= 26>%d</div>购买<div fontColor=#289b14 fontsize= 26>%s</div>？", PathTool.getItemRes(3), slot2, Config.ItemData.data_get_data(slot1.item_id).name), "确定", function ()
				uv0.ctrl:sender13407(uv1.order, uv1.shop_type, 1, 1)
			end, "取消", nil, CommonAlert.type.rich)
		elseif Config.ItemData.data_get_data(slot1.pay_type) then
			BackpackController:getInstance():openTipsSource(true, slot5)
		end
	end
end

function MallBuyGiftWindow.setCurUseItemInfoByPercent(slot0, slot1)
	slot0:setCurUseItemInfoByNum(math.floor(slot1 * math.min(slot0.is_can_buy_num, slot0.limit_num - slot0.data.add) * 0.01 + 0.5))
end

function MallBuyGiftWindow.setCurUseItemInfoByNum(slot0, slot1)
	slot0.num = slot1
	slot2 = math.min(slot0.is_can_buy_num, slot0.limit_num - slot0.data.add)

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
	slot0.total_price:setString(slot0.num * slot0.price_val .. "快乐币")
end

function MallBuyGiftWindow.close_callback(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0.goods_item = nil

	slot0.ctrl:openMallBuyGiftWindow(false)
end
