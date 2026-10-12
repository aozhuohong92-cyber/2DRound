OneCentGiftWindow = OneCentGiftWindow or BaseClass(BaseView)
slot1 = ActionController:getInstance()
slot2 = OnecentgiftController:getInstance():getModel()
slot3 = Config.HolidayDimeData
slot4 = string.format

function OneCentGiftWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "action/action_one_cent_gift_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("onecent", "onecent"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("onecent", "onecent_bg"),
			type = ResourcesType.single
		}
	}
end

function OneCentGiftWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.background:setPosition(360, 640)
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.btn_buy = slot0.main_container:getChildByName("btn_buy")
	slot0.btn_label = slot0.btn_buy:getChildByName("label")
	slot0.btn_close = slot0.main_container:getChildByName("btn_close")
	slot0.price_img = slot0.main_container:getChildByName("price_img")

	UITool.SetTitleColor(slot0.btn_label)

	slot0.original_price = slot0.main_container:getChildByName("original_price")

	slot0.original_price:setString(TI18N("原价："))

	slot0.original_price_val = slot0.main_container:getChildByName("original_price_val")
	slot0.time_text = slot0.main_container:getChildByName("time_text")

	slot0.time_text:setString(TI18N("剩余可购买时间："))

	slot0.time_text_val = slot0.main_container:getChildByName("time_text_val")

	UITool.SetLightColor(slot0.time_text)

	slot0.image_bg = slot0.main_container:getChildByName("image_bg")

	if not slot0.background_load then
		slot0.background_load = loadSpriteTextureFromCDN(slot0.image_bg, PathTool.getPlistImgForDownLoad("onecent", "onecent_bg"), ResourcesType.single, slot0.background_load)
	end

	slot0.goods_item = slot0.main_container:getChildByName("goods_item")
	slot0.reward_goods_item = CommonScrollViewSingleLayout.new(slot0.goods_item, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.goods_item:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 720,
		item_height = 115,
		space_y = 0,
		col = 1,
		need_dynamic = true
	})

	slot0.reward_goods_item:setSwallowTouches(true)
	slot0.reward_goods_item:registerScriptHandlerSingle(handler(slot0, slot0.CreateNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.reward_goods_item:registerScriptHandlerSingle(handler(slot0, slot0.NumberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.reward_goods_item:registerScriptHandlerSingle(handler(slot0, slot0.UpdateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function OneCentGiftWindow.openRootWnd(slot0)
	uv0:setFirstRed(false)
	print("----------------")
	uv1:send16651()

	if uv2.data_constant and slot1.original_price then
		slot0.original_price_val:setString(slot1.original_price.val .. TI18N("元"))
	end
end

function OneCentGiftWindow.register_event(slot0)
	slot0:addGlobalEvent(OnecentgiftEvent.Onecentgift_Init_Event, function ()
		uv0:setPanelData()
	end)
	slot0:addGlobalEvent(ActionEvent.Is_Charge_Event, function (slot0)
		if uv0.cur_charge_id and slot0 and uv0.cur_charge_id == slot0.charge_id and slot0.status == 1 then
			slot1 = Config.ChargeData.data_charge_data

			if uv0.cur_charge_id and slot1[uv0.cur_charge_id] then
				sdkOnPay(slot1[uv0.cur_charge_id].val, 1, slot1[uv0.cur_charge_id].id, slot1[uv0.cur_charge_id].name)
			end
		end
	end)
	registerButtonEventListener(slot0.background, function ()
		uv0:openOnecentiftView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_buy, function ()
		slot0 = uv0:getCurPeriod()
		slot2 = nil

		if uv1.data_period_list and slot1[slot0] then
			slot2 = slot1[slot0].change_id
		end

		slot3 = Config.ChargeData.data_charge_data

		if slot2 and slot3[slot2] then
			uv2.cur_charge_id = slot3[slot2].id

			ActionController:getInstance():sender21016(uv2.cur_charge_id)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openOnecentiftView(false)
	end, true, 1)
end

function OneCentGiftWindow.CreateNewCell(slot0)
	return OneCentGiftItem.new()
end

function OneCentGiftWindow.NumberOfCells(slot0)
	if not slot0.reward_list then
		return 0
	end

	return #slot0.reward_list
end

function OneCentGiftWindow.UpdateCellByIndex(slot0, slot1, slot2)
	if not slot0.reward_list then
		return
	end

	slot3 = slot0.reward_list[slot2]
	slot3.index = slot2

	if not slot3 then
		return
	end

	slot1:setData(slot3)
end

function OneCentGiftWindow.setPanelData(slot0)
	slot1 = uv0:getCurPeriod()
	slot3 = Config.ChargeData.data_charge_data

	if uv1.data_period_list and slot2[slot1] and slot2[slot1].change_id and slot3[slot4] then
		slot0.btn_label:setString(slot3[slot4].val .. TI18N("元购买"))
	end

	if uv0:getIsBuy() then
		setChildUnEnabled(true, slot0.btn_buy, Config.ColorData.data_color4[1])
		slot0.btn_buy:setTouchEnabled(false)
		slot0.btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	else
		setChildUnEnabled(false, slot0.btn_buy, Config.ColorData.data_color4[1])
		slot0.btn_label:enableOutline(Config.ColorData.data_color4[277], 2)
		slot0.btn_buy:setTouchEnabled(true)
	end

	slot0.btn_buy:setTouchEnabled(false)

	slot0.reward_list = uv0:getAwardData()

	slot0.reward_goods_item:reloadData()

	slot4 = ""

	if uv0:getEndTime() == 0 then
		slot0.time_text:setVisible(false)
		slot0.time_text_val:setVisible(false)
	else
		commonCountDownTime(slot0.time_text_val, uv0:getEndTime() - GameNet:getInstance():getTime(), {
			callback = function (slot0)
				uv0:countDownTimeCallBack(slot0)
			end
		})
	end
end

function OneCentGiftWindow.countDownTimeCallBack(slot0, slot1)
	if slot1 <= 0 then
		uv0:openOnecentiftView(false)
	else
		slot0.time_text_val:setString(TimeTool.GetTimeForFunction(slot1))
	end
end

function OneCentGiftWindow.close_callback(slot0)
	doStopAllActions(slot0.main_container)
	doStopAllActions(slot0.time_text_val)

	if slot0.background_load then
		slot0.background_load:DeleteMe()

		slot0.background_load = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.text_effect then
		slot0.text_effect:clearTracks()
		slot0.text_effect:removeFromParent()
	end

	slot0.text_effect = nil

	uv0:openOnecentiftView(false)
end

OneCentGiftItem = class("OneCentGiftItem", function ()
	return ccui.Widget:create()
end)

function OneCentGiftItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function OneCentGiftItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_one_cent_gift_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(720, 115))
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.pic_has = slot0.main_container:getChildByName("pic_has")
	slot0.btn_get = slot0.main_container:getChildByName("btn_get")
	slot0.btn_txt = slot0.btn_get:getChildByName("label")
	slot0.text_remian = slot0.main_container:getChildByName("Text_4")
	slot0.condition_txt = slot0.main_container:getChildByName("condition_txt")
	slot0.select_group = slot0.main_container:getChildByName("select_group")

	slot0.select_group:setTouchEnabled(false)

	slot0.goods_item = BackPackItem.new(true, true, nil, 1, false)

	slot0.goods_item:setPosition(cc.p(170, slot0.main_container:getContentSize().height / 2))
	slot0.goods_item:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.goods_item:setScale(0.8)
	slot0.goods_item:setDefaultTip()
	slot0.goods_item:setSwallowTouches(false)
	slot0.main_container:addChild(slot0.goods_item)
end

function OneCentGiftItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data and uv0.data.id then
			uv1:send16652(uv0.data.id)
		end
	end, true)
end

function OneCentGiftItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.goods_item:setData({
		bid = slot1.award[1][1],
		quantity = slot1.award[1][2]
	})

	if slot1.rev_state == 0 then
		slot0.btn_get:setVisible(true)
		slot0.btn_txt:setString(TI18N("未达成"))
		slot0.pic_has:setVisible(false)
		setChildUnEnabled(true, slot0.btn_get, Config.ColorData.data_color4[1])
		slot0.btn_txt:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.btn_get:setTouchEnabled(false)
	elseif slot1.rev_state == 1 then
		slot0.btn_get:setVisible(true)
		slot0.pic_has:setVisible(false)
		slot0.btn_txt:setString(TI18N("领取"))
		setChildUnEnabled(false, slot0.btn_get, Config.ColorData.data_color4[1])
		slot0.btn_txt:enableOutline(Config.ColorData.data_color4[277], 2)
		slot0.btn_get:setTouchEnabled(true)
	elseif slot1.rev_state == 2 then
		slot0.btn_get:setVisible(false)
		slot0.pic_has:setVisible(true)
	end

	slot0.condition_txt:setString(uv0(TI18N("%s"), slot1.tget))
	slot0.select_group:setVisible(slot1.is_select)
	slot0:setLightEffect()
end

function OneCentGiftItem.setLightEffect(slot0)
	if slot0.data and slot0.data.is_show_effect and slot0.data.is_show_effect == 1 then
		if slot0.lightEffect == nil then
			slot0.lightEffect = createEffectSpine(PathTool.getEffectRes(356), cc.p(360, 57), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.main_container:addChild(slot0.lightEffect)
		else
			slot0.lightEffect:setVisible(true)
		end
	elseif slot0.lightEffect ~= nil then
		slot0.lightEffect:setVisible(false)
	end
end

function OneCentGiftItem.DeleteMe(slot0)
	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	if slot0.lightEffect then
		slot0.lightEffect:clearTracks()
		slot0.lightEffect:removeFromParent()
	end

	slot0.lightEffect = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
