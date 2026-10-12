PersonnalGiftWindow = PersonnalGiftWindow or BaseClass(BaseView)
slot0 = FestivalActionController:getInstance()
slot1 = 325

function PersonnalGiftWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "festivalaction/personal_gift_window"
	slot0.res_list = {
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
	slot0.cur_index = nil
	slot0.touch_index = 2
	slot0.max_index = 3
	slot0.touch_buy_btn = true
end

function PersonnalGiftWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.image_bg_load = loadSpriteTextureFromCDN(slot0.main_container:getChildByName("image_bg"), PathTool.getPlistImgForDownLoad("bigbg/festivalaction", "personalgift_bg1"), ResourcesType.single, slot0.image_bg_load)
	slot0.item_scroll = slot0.main_container:getChildByName("item_scroll")

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

	slot3 = slot0.main_container:getChildByName("tab_page")

	slot3:setVisible(false)

	slot0.btn_left = slot3:getChildByName("btn_left")
	slot7 = "btn_right"
	slot0.btn_right = slot3:getChildByName(slot7)
	slot0.page_icon_list = {}

	for slot7 = 1, 3 do
		slot0.page_icon_list[slot7] = slot3:getChildByName("page_icon_" .. slot7)
	end

	slot0:tabPageIconView(slot0.touch_index)

	slot0.btn_close = slot0.main_container:getChildByName("btn_close")
end

function PersonnalGiftWindow.setRewardData(slot0, slot1)
	slot3 = false
	slot4 = 0.9
	slot5 = 0

	if #slot1 <= 4 then
		slot2 = slot0.item_scroll:getContentSize().height * 0.5 + 40
		slot5 = ({
			165,
			125,
			60,
			5
		})[#slot1]
		slot3 = true

		slot0.item_scroll:setTouchEnabled(false)
	else
		slot5 = 25

		slot0.item_scroll:setInnerContainerSize(cc.size(slot0.item_scroll:getContentSize().width, math.max(slot2, BackPackItem.Height * 0.8 * math.ceil(#slot1 / 4))))
	end

	slot7 = slot0.item_scroll:getInnerContainerSize().height - 60

	for slot11 = 1, #slot1 do
		if not slot0.item_list[slot11] then
			slot0.item_list[slot11] = BackPackItem.new(true, true)

			slot0.item_list[slot11]:setAnchorPoint(0, 0.5)
			slot0.item_scroll:addChild(slot0.item_list[slot11])
		end

		if slot0.item_list[slot11] then
			slot0.item_list[slot11]:setScale(slot4)
			slot0.item_list[slot11]:setDefaultTip(true)
			slot0.item_list[slot11]:setBaseData(slot1[slot11][1], slot1[slot11][2])

			if slot3 then
				slot0.item_list[slot11]:setPosition(slot5 + (BackPackItem.Width * slot4 + 10) * ((slot11 - 1) % 4), slot2)
			else
				slot0.item_list[slot11]:setPosition(slot12, slot7 - math.floor((slot11 - 1) / 4) * (BackPackItem.Height * slot4 + 10))
			end
		end
	end
end

function PersonnalGiftWindow.openRootWnd(slot0)
	uv0:sender26300()
end

function PersonnalGiftWindow.register_event(slot0)
	slot0:addGlobalEvent(FestivalActionEvent.Personal_Gift_Event, function (slot0)
		uv0:setData(slot0)
	end)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openPersonalGiftView(false)
	end, false, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openPersonalGiftView(false)
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

function PersonnalGiftWindow.setData(slot0, slot1)
	if Config.HolidayPersonalGiftData.data_gift_warehouse and slot2[slot1.award_id] then
		FestivalActionConst.CountDownTime(slot0.time, {
			less_time = slot1.end_time - GameNet:getInstance():getTime(),
			time_model = 2,
			text = TI18N("后礼包消失")
		})

		slot4 = slot2[slot1.award_id]

		slot0:setRewardData(slot4.award)
		slot0.limit_buy_text:setString(string.format(TI18N("限购: %d/%d"), slot1.count, slot4.limit_count))

		if slot4.limit_count <= slot1.count then
			slot0.btn_buy_label:setString(TI18N("已购买"))
			setChildUnEnabled(true, slot0.btn_buy)
			slot0.btn_buy:setTouchEnabled(false)
			slot0.btn_buy_label:disableEffect(cc.LabelEffect.OUTLINE)
		else
			slot0.btn_buy_label:setString(slot4.price .. TI18N("元"))
		end

		slot0.gift_percent_num:setNum(slot4.name, true)
		loadSpriteTexture(createSprite(nil, uv0 + slot0.gift_percent_num:getContentSize().width * 0.5, 185, slot0.main_container, cc.p(0, 0.5)), PathTool.getResFrame("type30", "type30_per"), LOADTEXT_TYPE_PLIST)

		if Config.HolidayPersonalGiftData.data_price and slot6[slot4.price] then
			slot0.charge_id = slot6[slot4.price].charge_id
		end
	end
end

function PersonnalGiftWindow.touchBtnCharge(slot0)
	if not slot0.charge_id then
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

	if Config.ChargeData.data_charge_data[slot0.charge_id] then
		sdkOnPay(slot1.val, 1, slot1.id, slot1.name)
	end
end

function PersonnalGiftWindow.tabPageIconView(slot0, slot1)
	if slot0.cur_index == slot1 then
		return
	end

	if slot0.cur_tab ~= nil and slot0.page_icon_list[slot0.cur_index] then
		loadSpriteTexture(slot0.page_icon_list[slot0.cur_index], PathTool.getResFrame("personalgift", "personalgift_2"), LOADTEXT_TYPE_PLIST)
	end

	slot0.cur_index = slot1
	slot0.cur_tab = slot0.page_icon_list[slot0.cur_index]

	if slot0.cur_tab and slot0.page_icon_list[slot0.cur_index] then
		loadSpriteTexture(slot0.page_icon_list[slot0.cur_index], PathTool.getResFrame("personalgift", "personalgift_1"), LOADTEXT_TYPE_PLIST)
	end
end

function PersonnalGiftWindow.onTouchLeft(slot0)
	slot0.touch_index = slot0.touch_index - 1

	if slot0.touch_index <= 1 then
		slot0.touch_index = 1
	end

	slot0:tabPageIconView(slot0.touch_index)
end

function PersonnalGiftWindow.onTouchRight(slot0)
	slot0.touch_index = slot0.touch_index + 1

	if slot0.max_index <= slot0.touch_index then
		slot0.touch_index = slot0.max_index
	end

	slot0:tabPageIconView(slot0.touch_index)
end

function PersonnalGiftWindow.close_callback(slot0)
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

	uv0:openPersonalGiftView(false)
end
