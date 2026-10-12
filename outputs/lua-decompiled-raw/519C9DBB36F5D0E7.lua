EmoguoshiShopView = EmoguoshiShopView or BaseClass(BaseView)
slot0 = EmoguoshiController:getInstance()

function EmoguoshiShopView.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.layout_name = "emoguoshitujian/emoguoshi_shop_panel"
	slot0.res_list = {}
	slot0.all_shop_item = {}
end

function EmoguoshiShopView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("bg")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot1 = slot0.main_panel:getChildByName("title")

	slot1:setString(TI18N(slot1:getString()))

	slot0.list_view = slot0.main_panel:getChildByName("Panel_4"):getChildByName("ListView_1")

	slot0.list_view:setClippingEnabled(true)
	slot0.list_view:setScrollBarEnabled(false)

	slot0.label_have_num = slot0.main_panel:getChildByName("Panel_5"):getChildByName("Text_4")
	slot0.label_text_5 = slot0.main_panel:getChildByName("Text_5")

	slot0.label_text_5:setString(TI18N("已消耗恶魔之种数量："))

	slot0.label_jifen = slot0.main_panel:getChildByName("Text_6")
	slot0.btn_close = slot0.main_panel:getChildByName("close_btn")
end

function EmoguoshiShopView.updateHaveNum(slot0, ...)
	slot0.label_have_num:setString(uv0:getTanEMoSeeNum())
	slot0.label_jifen:setString(uv0:getShopJiFen())
end

function EmoguoshiShopView.addColor(slot0, slot1, slot2)
	return string.format(TI18N("<div fontColor=%s outline=2,#000000>%s</div>"), slot2, slot1)
end

function EmoguoshiShopView.getLockStr(slot0, slot1)
	return ({
		[2100] = TI18N("开启铜质果盒后解锁"),
		[4200] = TI18N("开启银质果盒后解锁"),
		[6300] = TI18N("开启金质果盒后解锁")
	})[slot1] or string.format(TI18N("%d积分解锁"), slot1)
end

function EmoguoshiShopView.addItems(slot0, ...)
	slot2 = cc.size(slot0.list_view:getContentSize().width, 140)

	function slot3(...)
		slot0 = ccui.Layout:create()

		slot0:setContentSize(uv0)
		slot0:setAnchorPoint(cc.p(0.5, 0.5))

		return slot0
	end

	slot4 = nil
	slot5 = 0
	slot6 = 2
	slot7 = 10
	slot8 = {
		cc.p(150 + slot7, 70),
		cc.p(465 + slot7, 70)
	}

	slot0.list_view:setTouchEnabled(true)

	slot9 = {}

	for slot13, slot14 in pairs(Config.EmoguoshitujianData.data_get_shop_data) do
		table.insert(slot9, slot14)
	end

	function slot13(slot0, slot1)
		return slot0.id < slot1.id
	end

	table.sort(slot9, slot13)

	for slot13, slot14 in pairs(slot9) do
		if (slot5 + 1) % slot6 == 0 then
			slot15 = slot6
		end

		if slot15 == 1 then
			slot0.list_view:pushBackCustomItem(slot3())
		end

		slot16 = createCSBNote(PathTool.getTargetCSB("emoguoshitujian/emoguoshi_shop_item"))
		slot17 = slot16:getChildByName("main_container")

		slot4:addChild(slot16)
		slot16:setAnchorPoint(cc.p(0.5, 0.5))
		slot16:setPosition(slot8[slot15])

		slot0.all_shop_item[slot14.id] = slot16
		slot19 = slot17:getChildByName("item_mask")
		slot23 = slot17:getChildByName("Sprite_1")
		slot24 = slot17:getChildByName("limit")

		slot24:setVisible(false)

		slot25, slot26 = slot24:getPosition()
		slot24 = createRichLabel(16, cc.WHITE, slot24:getAnchorPoint(), cc.p(slot25, slot26), nil, , )

		slot17:addChild(slot24)
		slot24:setVisible(false)
		slot17:getChildByName("sold"):setLocalZOrder(10)
		slot17:getChildByName("condit"):setString(TI18N(slot0:getLockStr(slot14.need_jifen)))
		slot17:getChildByName("diam_count"):setString(slot14.price)

		slot30 = false

		if Config.ItemData.data_get_data(slot14.item_id) then
			slot17:getChildByName("name"):setString(TI18N(slot31.name))

			slot32 = BackPackItem.new(true, true)

			slot17:getChildByName("item_node"):addChild(slot32)
			slot32:setBaseData(slot14.item_id, slot14.item_num)
			slot32:setDefaultTip()
			slot32:setSwallowTouches(false)
			slot32:addBtnCallBack(function (...)
				TipsManager:getInstance():showGoodsTips(uv0)

				uv1 = true

				RenderMgr:getInstance():doNextFrame(function ()
					uv0 = false
				end)
			end)
		end

		function slot16.update_info(...)
			uv1:setVisible(uv0:getShopJiFen() < uv2.need_jifen)
			uv3:setVisible(slot0 < uv2.need_jifen)

			slot1 = uv0:getShopBuyTimes(uv2.id)

			if uv2.limit > 0 then
				uv4:setVisible(uv2.need_jifen <= slot0)
				uv5:setVisible(slot2 <= slot1)

				if slot2 <= slot1 then
					uv4:setString(uv6:addColor(TI18N("每月限购"), "#00ff00") .. "：" .. uv6:addColor(string.format("%s/%s", slot2 - slot1, slot2), "#ff0000"))
				else
					uv4:setString(slot4 .. uv6:addColor(slot3, "#00ff00"))
				end

				if slot2 <= slot1 then
					uv3:setVisible(true)
				end
			else
				uv4:setVisible(false)
				uv5:setVisible(false)
			end
		end

		slot16.update_info()
		slot17:setTouchEnabled(true)
		slot17:setSwallowTouches(false)

		slot32 = false
		slot33 = nil

		slot17:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.began then
				uv0 = false
				uv1 = slot0:getTouchBeganPosition()
			end

			if slot1 == ccui.TouchEventType.moved and not uv0 then
				uv1 = slot0:getTouchBeganPosition()

				if math.abs(slot0:getTouchMovePosition().x - uv1.x) > 20 or math.abs(slot2.y - uv1.y) > 20 then
					uv0 = true
				end
			end

			if slot1 == ccui.TouchEventType.ended then
				if uv0 or uv2 then
					return
				end

				playCloseSound()

				uv0 = false

				if uv3:getShopJiFen() < uv4.need_jifen then
					message(uv5)

					return
				end

				if uv4.limit <= uv3:getShopBuyTimes(uv4.id) then
					message(TI18N("购买次数已经用完"))

					return
				end

				MallController:getInstance():openMallBuyWindow(true, {
					bid = 0,
					item_bid = uv4.item_id,
					shop_type = 0,
					limit_num = uv4.limit - uv3:getShopBuyTimes(uv4.id),
					has_buy = 0,
					is_show_limit_label = true,
					name = Config.ItemData.data_get_data(uv4.item_id).name,
					aim = 0,
					pay_type = uv4.pay_type,
					price = uv4.price,
					quantity = 1,
					call_back = function (slot0, slot1)
						if uv1.limit <= uv0:getShopBuyTimes(uv1.id) then
							message(TI18N("购买次数已经用完"))

							return
						end

						uv0:reqBuy(uv1.id, slot1)
					end
				})
			end
		end)
	end
end

function EmoguoshiShopView.register_event(slot0)
	slot0.background:setTouchEnabled(true)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEmoguoShopView(false)
		end
	end)
	slot0.btn_close:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openEmoguoShopView(false)
	end, true)
	slot0:addGlobalEvent(EmoguoshiEvent.SHOP_JIFEN, function ()
		uv0:updateHaveNum()
	end)
	slot0:addGlobalEvent(EmoguoshiEvent.ONE_SHOP_INFO, function (slot0)
		if uv0.all_shop_item[slot0] then
			slot1.update_info()
		end
	end)

	slot0.role_vo = RoleController:getInstance():getRoleVo()

	if slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "emo_seed" then
				uv0:updateHaveNum()
			end
		end)
	end
end

function EmoguoshiShopView.openRootWnd(slot0, slot1)
	slot0:addItems()
	slot0:updateHaveNum()
end

function EmoguoshiShopView.close_callback(slot0)
	uv0:openEmoguoShopView(false)

	if slot0.role_vo and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end
end
