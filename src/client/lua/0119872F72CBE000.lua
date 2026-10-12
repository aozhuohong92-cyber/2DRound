AdventureEvtShopView = AdventureEvtShopView or BaseClass(BaseView)
slot0 = AdventureController:getInstance()
slot1 = AdventureController:getInstance():getUiModel()

function AdventureEvtShopView.__init(slot0, slot1)
	if slot1 then
		slot0.data = slot1
		slot0.config = slot1.config
	end

	slot0.is_auto_open = false
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "adventure/adventure_evt_shop_view"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_55"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("mall", "mall"),
			type = ResourcesType.plist
		}
	}
	slot0.shop_item_list = {}
end

function AdventureEvtShopView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("title_label"):setString(TI18N("神秘商城"))

	slot0.item_container = slot1:getChildByName("item_container")
	slot0.desc = slot1:getChildByName("desc")

	slot0.desc:setTextAreaSize(cc.size(330, 112))
	slot0.desc:setTextColor(cc.c3b(2, 54, 86))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.total_width = slot0.item_container:getContentSize().width
end

function AdventureEvtShopView.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openEvtViewByType(false)
		uv0:openAdventureEvtShopView(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openEvtViewByType(false)
		uv0:openAdventureEvtShopView(false)
	end, true, 2)
	slot0:addGlobalEvent(AdventureEvent.Update_Evt_Shop_Info, function (slot0)
		uv0:updateShopItem(slot0.list)
	end)
	slot0:addGlobalEvent(AdventureEvent.UpdateShopItemEvent, function (slot0)
		uv0:updateSingleShopItem(slot0)
	end)
end

function AdventureEvtShopView.openRootWnd(slot0, slot1)
	if slot1 then
		slot0.is_auto_open = true

		slot0:updateShopItem(slot1)

		if Config.AdventureData.data_adventure_const.businessman_description then
			slot0.desc:setString(slot2.desc)
		end
	else
		if slot0.config then
			slot0.desc:setString(slot0.config.desc)
		end

		if slot0.data then
			uv0:send20620(slot0.data.id, AdventureEvenHandleType.requst, {})
		end
	end
end

function AdventureEvtShopView.updateShopItem(slot0, slot1)
	slot2 = #slot1

	for slot10, slot11 in ipairs(slot1) do
		if slot0.shop_item_list[slot11.id] == nil then
			slot12 = slot0:createShopItem(slot10, (slot0.total_width - (slot2 * 100 + (slot2 - 1) * 50)) * 0.5, slot4, slot3, slot11.id)
			slot0.shop_item_list[slot11.id] = slot12

			slot12.item:setBaseData(slot11.bid, slot11.num)

			if slot12.buy_config == nil and Config.ItemData.data_get_data(slot11.pay_type) then
				slot12.label:setString(string.format("<img src=%s visible=true scale=0.3 />,<div fontColor=#ffffff fontsize=24 outline=1,#6c2b00>%s</div>", PathTool.getItemRes(slot13.icon), slot11.pay_val))

				slot12.buy_config = slot13
			end

			if slot12.item_config == nil and Config.ItemData.data_get_data(slot11.bid) then
				slot12.item_name:setString(slot13.name)

				slot12.item_config = slot13
			end

			if slot11.discount == 0 or slot11.discount == 10 then
				slot12.discount:setVisible(false)
			else
				slot12.discount:setVisible(true)
				slot12.discount_label:setString(slot11.discount .. TI18N("折"))
			end
		end

		if slot11.is_buy == 1 then
			slot12.sell_over:setVisible(true)
		else
			slot12.sell_over:setVisible(false)
		end

		slot12.data = slot11
	end
end

function AdventureEvtShopView.updateSingleShopItem(slot0, slot1)
	if slot0.shop_item_list == nil then
		return
	end

	if slot0.shop_item_list[slot1] == nil then
		return
	end

	slot2.data.is_buy = 1

	slot2.sell_over:setVisible(true)
end

function AdventureEvtShopView.clickBuyIndex(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.shop_item_list[slot1] == nil or slot2.data == nil then
		return
	end

	if slot2.data.is_buy == 1 then
		message(TI18N("该物品已被购买"))

		return
	end

	if slot2.item_config == nil or slot2.buy_config == nil then
		return
	end

	CommonAlert.show(string.format("%s<img src=%s visible=true scale=0.3 />%s%s<div fontColor=%s>%s</div>x%s", TI18N("是否消耗"), PathTool.getItemRes(slot2.buy_config.icon), slot2.data.pay_val, TI18N("购买"), tranformC3bTostr(BackPackConst.quality_color_id[slot2.item_config.quality] or 0), slot2.item_config.name, slot2.data.num), TI18N("确定"), function ()
		if uv0.is_auto_open == true then
			uv1:requestBuyShopItem(uv2.data.id)
		elseif uv0.data then
			uv1:send20620(uv0.data.id, AdventureEvenHandleType.handle, {
				{
					type = 1,
					val = uv2.data.id
				}
			})
		end
	end, TI18N("取消"), nil, CommonAlert.type.rich)
end

function AdventureEvtShopView.createShopItem(slot0, slot1, slot2, slot3, slot4, slot5)
	slot7 = ccui.Layout:create()

	slot7:setAnchorPoint(0.5, 0.5)
	slot7:setContentSize(cc.size(slot3, 100))
	slot7:setPosition(slot2 + slot3 * 0.5 + (slot1 - 1) * (slot3 + slot4), 118)
	slot0.item_container:addChild(slot7)

	slot10 = BackPackItem.new(false, true, false, 1, false, true)

	slot10:setPosition(50, 102)
	slot7:addChild(slot10)

	slot12 = createImage(slot7, PathTool.getResFrame("common", "common_1017"), 50, -20, cc.p(0.5, 0.5), true, 1, true)

	slot12:setContentSize(cc.size(140, 61))
	slot12:setTouchEnabled(true)
	slot12:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:clickBuyIndex(uv1)
		end
	end)

	slot13 = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(67, 30))

	slot13:setString(TI18N("我是按钮名字"))
	slot12:addChild(slot13)

	slot14 = createSprite(PathTool.getResFrame("mall", "txt_cn_mall_sell_finish"), 50, 96, slot7, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

	slot14:setVisible(false)

	slot15 = createSprite(PathTool.getResFrame("mall", "mall_06"), 6, 130, slot7, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

	slot15:setVisible(false)

	return {
		node = slot7,
		item = slot10,
		item_name = createLabel(24, 175, nil, 50, 25, TI18N("我是物品名字"), slot7, nil, cc.p(0.5, 0.5)),
		button = slot12,
		label = slot13,
		sell_over = slot14,
		discount = slot15,
		discount_label = createLabel(24, 1, cc.c4b(174, 42, 0, 255), 29, 52, "", slot15, nil, cc.p(0.5, 0.5))
	}
end

function AdventureEvtShopView.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.shop_item_list) do
		if slot5.item then
			slot5.item:DeleteMe()
		end
	end

	slot0.shop_item_list = nil

	uv0:openEvtViewByType(false)
	uv0:openAdventureEvtShopView(false)
end
