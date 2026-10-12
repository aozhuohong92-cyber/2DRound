RfmPersonnalGiftWindow = RfmPersonnalGiftWindow or BaseClass(BaseView)
slot0 = RfmPersonnalGiftController:getInstance()
slot1 = table.insert
slot2 = table.sort
slot3 = 325

function RfmPersonnalGiftWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.TOP_TAG

	if BaseView and BaseView.winMap then
		slot1 = false

		for slot5, slot6 in pairs(BaseView.winMap) do
			if slot6.layout_name and (slot6.layout_name == "mainui/item_exhibition_view" or slot6.layout_name == "heaven/heaven_main_window") then
				slot0.win_type = WinType.Mini
				slot0.view_tag = ViewMgrTag.TOP_TAG
				slot1 = true

				break
			end
		end

		if not slot1 then
			for slot5, slot6 in pairs(BaseView.winMap) do
				if slot6.win_type == WinType.Mini then
					slot0.win_type = WinType.Mini
					slot0.view_tag = ViewMgrTag.DIALOGUE_TAG

					break
				end
			end
		end
	end

	slot0.layout_name = "rfmpersonalgift/rfm_personal_gift_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("personalgift", "rfmpersonalgift_bg"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("personalgift", "personalgift"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("num", "type30"),
			type = ResourcesType.plist
		}
	}
	slot0.item_list = {}
	slot0.max_index = 1
	slot0.touch_buy_btn = true
	slot0.charge_config = nil
end

function RfmPersonnalGiftWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot1 = slot0.main_container:getChildByName("image_bg")

	slot1:setPositionY(180)

	slot0.image_bg_load = loadSpriteTextureFromCDN(slot1, PathTool.getPlistImgForDownLoad("personalgift", "rfmpersonalgift_bg"), ResourcesType.single, slot0.image_bg_load)
	slot0.item_scroll = slot0.main_container:getChildByName("item_scroll")
	slot0.item_scroll_size = slot0.item_scroll:getContentSize()

	slot0.item_scroll:setScrollBarEnabled(false)

	slot0.btn_buy = slot0.main_container:getChildByName("btn_buy")
	slot0.btn_buy_label = slot0.btn_buy:getChildByName("Text_1")

	slot0.btn_buy_label:setString("")

	slot0.time = slot0.main_container:getChildByName("time")

	slot0.time:setString("")

	slot0.limit_buy_text = slot0.main_container:getChildByName("limit_buy_text")

	slot0.limit_buy_text:setString("")

	slot0.gift_percent_num = CommonNum.new(30, slot0.main_container, nil, -5, cc.p(0.5, 0.5))

	slot0.gift_percent_num:setPosition(uv0, 217)

	slot0.btn_close = slot0.main_container:getChildByName("btn_close")
	slot0.bubble_img = slot0.main_container:getChildByName("bubble_img")
	slot0.bubble_label = createRichLabel(22, cc.c4b(255, 242, 168, 255), cc.p(0, 0.5), cc.p(8, slot0.bubble_img:getContentSize().height / 2 + 5), 5, nil, 410)

	slot0.bubble_img:addChild(slot0.bubble_label)

	slot0.tab_page = slot0.main_container:getChildByName("tab_page")

	slot0.tab_page:setVisible(false)

	slot0.btn_left = slot0.tab_page:getChildByName("btn_left")
	slot0.btn_right = slot0.tab_page:getChildByName("btn_right")
	slot0.page_icon_group = slot0.tab_page:getChildByName("page_icon_group")
	slot0.page_icon_list = {}

	slot0:createEffect()
end

function RfmPersonnalGiftWindow.openRootWnd(slot0)
	uv0:sender28900()
end

function RfmPersonnalGiftWindow.register_event(slot0)
	slot0:addGlobalEvent(ActionEvent.Is_Charge_Event, function (slot0)
		if uv0.charge_config and slot0 and uv0.charge_config.id == slot0.charge_id and slot0.status == 1 then
			sdkOnPay(uv0.charge_config.val, 1, uv0.charge_config.id, uv0.charge_config.name)
		end
	end)
	slot0:addGlobalEvent(RfmPersonnalGiftEvent.Rfm_Personal_Gift_Event, function (slot0)
		uv0:selectData(slot0)
	end)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openRfmPersonalGiftView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_buy, function ()
		uv0:touchBtnCharge()
	end, true, 1)
	registerButtonEventListener(slot0.btn_left, function ()
		uv0:onTouchLeft()
	end, false)
	registerButtonEventListener(slot0.btn_right, function ()
		uv0:onTouchRight()
	end, false)
end

function RfmPersonnalGiftWindow.createEffect(slot0)
	slot0.bg_effect = createEffectSpine(PathTool.getEffectRes(519), cc.p(0, 0), cc.p(0.5, 0.5), true, PlayerAction.action_1)

	slot0.bg_effect:setPosition(slot0.main_container:getContentSize().width / 2, 280)
	slot0.main_container:addChild(slot0.bg_effect, -1)

	slot0.fg_effect = createEffectSpine(PathTool.getEffectRes(519), cc.p(40, 22), cc.p(0, 0), true, PlayerAction.action_2)

	slot0.main_container:addChild(slot0.fg_effect)
	slot0.fg_effect:setPosition(300, 180)
end

function RfmPersonnalGiftWindow.createTab(slot0, slot1)
	if not slot1 then
		slot0.tab_page:setVisible(false)
	else
		slot0.tab_page:setVisible(true)

		slot2 = #slot0.data
		slot0.max_index = slot2
		slot3 = slot0.page_icon_group:getContentSize().width / slot2
		slot0.max_index = slot2

		for slot7 = 1, slot2 do
			slot8, slot9 = math.modf(slot2 / 2)
			slot10 = slot0.page_icon_group:getContentSize()
			slot11 = 0
			slot11 = slot9 == 0 and (slot7 - slot8 - 0.5) * slot3 + slot10.width / 2 or (slot7 - slot8 - 1) * slot3 + slot10.width / 2
			slot12 = nil

			if slot0.tab_list == nil then
				slot0.tab_list = {}
			end

			for slot16, slot17 in pairs(slot0.tab_list) do
				slot17:setVisible(true)
			end

			if slot0.tab_list ~= nil and slot0.tab_list[slot7] ~= nil then
				slot0.tab_list[slot7]:setPosition(cc.p(slot11, slot10.height / 2))
			else
				slot12 = createSprite(PathTool.getResFrame("personalgift", "personalgift_2"), slot11, slot10.height / 2, slot0.page_icon_group, cc.p(0.5, 0.5))
			end

			slot0.tab_list[slot7] = slot12
		end

		for slot7 = 1, #slot0.tab_list do
			if slot7 <= slot2 then
				slot0.tab_list[slot7]:setVisible(true)
			else
				slot0.tab_list[slot7]:setVisible(false)
			end
		end
	end
end

function RfmPersonnalGiftWindow.selectData(slot0, slot1)
	slot2 = nil

	if ((slot1 == nil or slot1.gift_list == nil or slot1.gift_list) and slot0.data) ~= nil then
		slot0.data = {}

		for slot6, slot7 in pairs(slot2) do
			if slot7.over_time - GameNet:getInstance():getTime() > 0 and slot7.buy_count < slot7.limit_count then
				uv0(slot0.data, slot7)
			end
		end

		if #slot0.data <= 0 then
			uv1:openRfmPersonalGiftView(false)
		else
			uv2(slot0.data, function (slot0, slot1)
				return slot1.over_time < slot0.over_time
			end)
			slot0:setData()
		end
	end
end

function RfmPersonnalGiftWindow.setData(slot0)
	slot0.select_index = 0

	if #slot0.data > 1 then
		slot0:createTab(true)
	else
		slot0:createTab(false)
	end

	slot0:tabPageIconChange(1)
end

function RfmPersonnalGiftWindow.touchBtnCharge(slot0)
	if not slot0.charge_config then
		return
	end

	if not slot0.touch_buy_btn then
		return
	end

	if slot0.buy_btn_ticket == nil then
		slot0.buy_btn_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0.touch_buy_btn = true

			if uv0.buy_btn_ticket ~= nil then
				GlobalTimeTicket:getInstance():remove(uv0.buy_btn_ticket)

				uv0.buy_btn_ticket = nil
			end
		end, 2)
	end

	slot0.touch_buy_btn = nil

	if slot0.charge_config.id then
		ActionController:getInstance():sender21016(slot0.charge_config.id)
	end
end

function RfmPersonnalGiftWindow.setRewardSetting(slot0, slot1)
	slot2 = {
		scale = 0.7,
		space_x = 10,
		start_x = 0,
		is_center = true,
		max_count = 5
	}
	slot3 = {}

	if slot1 then
		for slot7, slot8 in pairs(slot1) do
			uv0(slot3, {
				slot8.id,
				slot8.num
			})
		end
	end

	return slot2, slot3
end

function RfmPersonnalGiftWindow.tabPageIconChange(slot0, slot1)
	if slot0.select_index == slot1 then
		return
	end

	if slot0.data[slot1] == nil then
		return
	end

	doStopAllActions(slot0.time)
	commonCountDownTime(slot0.time, slot2.over_time - GameNet:getInstance():getTime(), {
		callback = function (slot0)
			uv0:countDownTimeCallBack(slot0)
		end
	})
	slot0.bubble_label:setString(slot2.desc)

	slot4, slot5 = slot0:setRewardSetting(slot2.award)
	slot0.item_list = commonShowSingleRowItemList(slot0.item_scroll, slot0.item_list, slot5, slot4)

	slot0.limit_buy_text:setString(string.format(TI18N("限购: %d/%d"), slot2.limit_count - slot2.buy_count, slot2.limit_count))

	slot0.charge_config = Config.ChargeData.data_charge_data[slot2.charge_id]

	if slot2.limit_count <= slot2.buy_count then
		slot0.btn_buy_label:setString(TI18N("已购买"))
		setChildUnEnabled(true, slot0.btn_buy)
		slot0.btn_buy:setTouchEnabled(false)
		slot0.btn_buy_label:disableEffect(cc.LabelEffect.OUTLINE)
	else
		setChildUnEnabled(false, slot0.btn_buy, Config.ColorData.data_color4[1])
		slot0.btn_buy_label:enableOutline(Config.ColorData.data_color4[277], 2)
		slot0.btn_buy:setTouchEnabled(true)

		if slot0.charge_config then
			slot0.btn_buy_label:setString(slot0.charge_config.val .. TI18N("元"))
		end
	end

	slot0.gift_percent_num:setNum(slot2.costly_num, true)

	if slot0.icon_per == nil then
		slot0.icon_per = createSprite(nil, uv0 + slot0.gift_percent_num:getContentSize().width * 0.5, 188, slot0.main_container, cc.p(0, 0.5))

		loadSpriteTexture(slot0.icon_per, PathTool.getResFrame("type30", "type30_per"), LOADTEXT_TYPE_PLIST)
	else
		slot0.icon_per:setPositionX(uv0 + slot0.gift_percent_num:getContentSize().width * 0.5)
	end

	if slot0.tab_list then
		for slot9, slot10 in pairs(slot0.tab_list) do
			loadSpriteTexture(slot10, PathTool.getResFrame("personalgift", "personalgift_2"), LOADTEXT_TYPE_PLIST)
		end

		if slot0.tab_list[slot1] then
			loadSpriteTexture(slot0.tab_list[slot1], PathTool.getResFrame("personalgift", "personalgift_1"), LOADTEXT_TYPE_PLIST)
		end
	end

	slot0.select_index = slot1
end

function RfmPersonnalGiftWindow.onTouchLeft(slot0)
	if slot0.select_index - 1 < 1 then
		slot1 = slot0.max_index
	end

	slot0:tabPageIconChange(slot1)
end

function RfmPersonnalGiftWindow.onTouchRight(slot0)
	if slot0.max_index < slot0.select_index + 1 then
		slot1 = 1
	end

	slot0:tabPageIconChange(slot1)
end

function RfmPersonnalGiftWindow.countDownTimeCallBack(slot0, slot1)
	for slot5, slot6 in pairs(slot0.data) do
		less_time = slot6.over_time - GameNet:getInstance():getTime()

		if less_time <= 0 then
			slot0:selectData()
		end
	end

	if slot1 >= 0 then
		slot0.time:setString(TimeTool.GetTimeFormat(slot1) .. TI18N("后礼包消失"))
	end
end

function RfmPersonnalGiftWindow.close_callback(slot0)
	doStopAllActions(slot0.time)

	if slot0.image_bg_load then
		slot0.image_bg_load:DeleteMe()

		slot0.image_bg_load = nil
	end

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	if slot0.gift_percent_num then
		slot0.gift_percent_num:DeleteMe()

		slot0.gift_percent_num = nil
	end

	if slot0.buy_btn_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.buy_btn_ticket)

		slot0.buy_btn_ticket = nil
	end

	if slot0.fg_effect then
		slot0.fg_effect:clearTracks()
		slot0.fg_effect:removeFromParent()
	end

	slot0.fg_effect = nil

	if slot0.bg_effect then
		slot0.bg_effect:clearTracks()
		slot0.bg_effect:removeFromParent()
	end

	slot0.bg_effect = nil

	uv0:openRfmPersonalGiftView(false)
end
