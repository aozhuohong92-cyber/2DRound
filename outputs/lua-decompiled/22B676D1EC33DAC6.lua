GuildmarketplaceBuyItemPanel = GuildmarketplaceBuyItemPanel or BaseClass(BaseView)
slot0 = GuildmarketplaceController:getInstance()
slot1 = string.format

function GuildmarketplaceBuyItemPanel.__init(slot0, slot1)
	slot0.is_full_screen = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "guildmarketplace/guildmarketplace_buy_item_panel"
	slot0.res_list = {}
	slot0.show_type = slot1 or 1
	slot0.num = 1
end

function GuildmarketplaceBuyItemPanel.open_callback(slot0)
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
	slot0.tips_1 = slot0.item_con:getChildByName("tips_1")
	slot0.item_bg = slot0.item_con:getChildByName("item_bg")

	slot0.item_bg:setVisible(false)

	slot0.item_icon = slot0.item_bg:getChildByName("icon")
	slot0.item_count_label = slot0.item_bg:getChildByName("count")
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

	slot0.buy_count:setString(slot0.num)

	slot0.min_btn = slot0.info_con:getChildByName("min_btn")
	slot0.max_btn = slot0.info_con:getChildByName("max_btn")
	slot0.total_price_title = slot0.info_con:getChildByName("total_price_title")

	slot0.total_price_title:setString(TI18N("总价："))

	slot0.total_price = slot0.info_con:getChildByName("total_price")
	slot0.buy_desc = slot0.main_container:getChildByName("buy_desc")

	slot0.buy_desc:setString("")

	if slot0.show_type == 1 then
		slot0.title_label:setString(TI18N("购买"))
		slot0.ok_btn:setTitleText(TI18N("购买"))
		slot0.buy_count_title:setString(TI18N("购买数量："))
		slot0.tips_1:setString("")
		slot0.item_bg:setPosition(214, -16)

		slot0.less_time_label = createRichLabel(22, cc.c4b(149, 83, 34, 255), cc.p(0, 0.5), cc.p(214, 40), nil, nil, 1000)

		slot0.item_con:addChild(slot0.less_time_label)

		slot0.limit_buy_label = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0.5, 0.5), cc.p(434, 36), nil, nil, 1000)

		slot0.main_container:addChild(slot0.limit_buy_label)
	else
		slot0.tips_1:setString(TI18N("可获得:"))
		slot0.title_label:setString(TI18N("放入物品"))
		slot0.ok_btn:setTitleText(TI18N("放入"))
		slot0.buy_count_title:setString(TI18N("放入数量："))
	end
end

function GuildmarketplaceBuyItemPanel.register_event(slot0)
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

function GuildmarketplaceBuyItemPanel.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.setting = slot1
	slot2 = slot1.item_id
	slot0.item_count = slot1.item_count or 1
	slot3 = slot1.name
	slot4 = slot1.shop_type
	slot0.price_item_id = slot1.price_item_id
	slot0.price_val = slot1.price or 1
	slot0.goods_id = slot1.goods_id
	slot0.less_time = slot1.less_time
	slot0.less_count = slot1.less_count
	slot0.limit_num = slot1.limit_num or 1

	if slot0.limit_num > 100 then
		slot0.limit_num = 100
	end

	if slot0.setting.limit_day and slot0.setting.limit_total_num then
		if slot0.setting.limit_day == slot0.setting.limit_total_num then
			slot0.limit_num = 1
		elseif slot0.setting.limit_total_num - slot0.setting.limit_day < slot0.limit_num then
			slot0.limit_num = slot5
		elseif slot0.limit_num < 1 then
			slot0.limit_num = 1
		end
	end

	slot0.item_config = Config.ItemData.data_get_data(slot2)

	if slot0.item_config then
		slot0.goods_item:setData(slot0.item_config)
		slot0.goods_item:setSelfNum(slot0.item_count)

		if slot3 then
			slot0.name:setString(slot3)
		else
			slot0.name:setString(slot0.item_config.name)
		end
	else
		slot0.name:setString(slot3)
	end

	slot0:setCurUseItemInfoByNum(slot0.num, true)

	if slot0.price_item_id then
		slot0.item_bg:setVisible(true)

		if slot0.record_item_id == nil or slot0.record_item_id ~= slot0.price_item_id then
			slot0.record_item_id = slot0.price_item_id

			if Config.ItemData.data_get_data(slot0.price_item_id) then
				loadSpriteTexture(slot0.item_icon, PathTool.getItemRes(slot5.icon, false), LOADTEXT_TYPE)
			end
		end

		slot0.item_count_label:setString(slot0.price_val)
	end

	if slot0.less_time then
		if slot0.less_time - GameNet:getInstance():getTime() <= 0 then
			slot5 = 0
		end

		commonCountDownTime(slot0.less_time_label, slot5, {
			callback = function (slot0)
				uv0:setTimeFormatString(slot0)
			end
		})
	end

	slot0:initLimitBuyInfo()
end

function GuildmarketplaceBuyItemPanel.initLimitBuyInfo(slot0)
	if not slot0.setting then
		return
	end

	if slot0.setting.limit_day then
		slot0.limit_buy_label:setString(uv0(TI18N("每日限购<div fontcolor=#249003>%s/%s</div>个"), slot0.setting.limit_day, slot0.setting.limit_total_num or 0))
	end
end

function GuildmarketplaceBuyItemPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.less_time_label:setString(uv0(TI18N("%s个物品于<div fontcolor=#249003>%s</div>后过期"), slot0.less_count or 1, TimeTool.GetTimeFormatDayIIIIII(slot1)))
	else
		slot0.less_time_label:setString(uv0(TI18N("%s个物品已过期"), slot2))
	end
end

function GuildmarketplaceBuyItemPanel.initShopTypeUI(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1 == MallConst.MallType.TermBeginsBuy then
		slot0.buy_count_title:setString(TI18N("提交数量:"))
		slot0.ok_btn:setTitleText(TI18N("提交"))
		slot0.title_label:setString(TI18N("提交试卷"))
	end
end

function GuildmarketplaceBuyItemPanel.onClickBtnClose(slot0)
	uv0:openGuildmarketplaceBuyItemPanel(false)
end

function GuildmarketplaceBuyItemPanel.sendBuy(slot0)
	if not slot0.setting then
		return
	end

	if slot0.num > 0 and slot0.goods_id then
		if slot0.show_type == 1 then
			uv0:sender26902(slot0.goods_id, slot0.num * slot0.item_count)
		else
			slot1 = nil

			uv0:sender26901(slot0.goods_id, slot0.num * slot0.item_count, (slot0.item_config.sub_type ~= BackPackConst.item_tab_type.EQUIPS and slot0.item_config.sub_type ~= BackPackConst.item_tab_type.HOLYEQUIPMENT or BackPackConst.Bag_Code.EQUIPS) and BackPackConst.Bag_Code.BACKPACK)
		end
	end

	slot0:onClickBtnClose()
end

function GuildmarketplaceBuyItemPanel.setCurUseItemInfoByPercent(slot0, slot1)
	slot0:setCurUseItemInfoByNum(math.floor(slot1 * slot0.limit_num * 0.01))
end

function GuildmarketplaceBuyItemPanel.setCurUseItemInfoByNum(slot0, slot1, slot2)
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
	slot0.total_price:setString(slot0.num * slot0.price_val)
end

function GuildmarketplaceBuyItemPanel.close_callback(slot0)
	if slot0.less_time_label then
		doStopAllActions(slot0.less_time_label)
	end

	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0.goods_item = nil

	uv0:openGuildmarketplaceBuyItemPanel(false)
end
