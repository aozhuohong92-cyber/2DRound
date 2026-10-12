LimitTimeGiftWindow = LimitTimeGiftWindow or BaseClass(BaseView);
slot0 = LimitTimeActionController:getInstance();
slot1 = 325;
slot2 = string.format;
slot3 = table.insert;
slot4 = Config.HolidayPersonalFireGiftData.data_gift_info;

function LimitTimeGiftWindow.__init(slot0)
	slot0.win_type = WinType.Mini;
	slot0.is_full_screen = true;
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG;
	slot0.layout_name = "limit_time/limit_time_gift_window";
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("personalgift", "personalgift"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("num", "type30"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/festivalaction", "personalgift_bg1"),
			type = ResourcesType.single
		}
	};
	slot0.item_list = {};
	slot0.cur_index = nil;
	slot0.touch_index = 1;
	slot0.max_index = 5;
	slot0.touch_buy_btn = true;
end

function LimitTimeGiftWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background");

	slot0.background:setScale(display.getMaxScale());

	slot0.main_container = slot0.root_wnd:getChildByName("main_container");

	slot0:playEnterAnimatianByObj(main_container, 2);

	slot0.image_bg_load = loadSpriteTextureFromCDN(slot0.main_container:getChildByName("image_bg"), PathTool.getPlistImgForDownLoad("bigbg/festivalaction", "personalgift_bg1"), ResourcesType.single, slot0.image_bg_load);
	slot0.item_scroll = slot0.main_container:getChildByName("item_scroll");
	slot0.item_scroll_size = slot0.item_scroll:getContentSize();

	slot0.item_scroll:setScrollBarEnabled(false);

	slot0.btn_buy = slot0.main_container:getChildByName("btn_buy");
	slot0.btn_buy_label = slot0.btn_buy:getChildByName("Text_1");

	slot0.btn_buy_label:setString("");

	slot0.time = slot0.main_container:getChildByName("time");

	slot0.time:setString("");

	slot0.limit_buy_text = slot0.main_container:getChildByName("limit_buy_text");

	slot0.limit_buy_text:setString("");

	slot0.gift_percent_num = CommonNum.new(30, slot0.main_container, nil, -5, cc.p(0.5, 0.5));

	slot0.gift_percent_num:setPosition(uv0, 220);

	slot0.tab_page = slot0.main_container:getChildByName("tab_page");
	slot0.tab_page_size = slot0.tab_page:getContentSize();

	slot0.tab_page:setVisible(false);

	slot0.btn_left = slot0.tab_page:getChildByName("btn_left");
	slot0.btn_right = slot0.tab_page:getChildByName("btn_right");
	slot0.page_icon_list = {};
	slot0.btn_close = slot0.main_container:getChildByName("btn_close");
end

function LimitTimeGiftWindow.openRootWnd(slot0)
	uv0:sender28000();
end

function LimitTimeGiftWindow.register_event(slot0)
	slot0:addGlobalEvent(LimitTimeActionEvent.Limit_Time_Gift_Event, function (slot0)
		uv0:setData(slot0);
	end);
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openLimitTimeGiftWindow(false);
	end, false, 2);
	registerButtonEventListener(slot0.background, function ()
		uv0:openLimitTimeGiftWindow(false);
	end, false, 2);
	registerButtonEventListener(slot0.btn_buy, function ()
		uv0:BtnCharge();
	end, true, 1);
	registerButtonEventListener(slot0.btn_left, function ()
		uv0:onTouchLeft();
	end, false);
	registerButtonEventListener(slot0.btn_right, function ()
		uv0:onTouchRight();
	end, false);
end

function LimitTimeGiftWindow.CountDownTime(slot0, slot1, slot2)
	slot3 = slot2.less_time or 0;
	slot4 = slot2.time_model or 1;
	slot5 = slot2.text or "";

	if tolua.isnull(slot1) then
		return
	end

	doStopAllActions(slot1);

	if slot3 > 0 then
		(function (slot0)
			if slot0 > 0 then
				if uv0 == 1 then
					uv1:setString(TimeTool.GetTimeFormat(slot0));
				elseif uv0 == 2 then
					uv1:setString(TimeTool.GetTimeFormat(uv2) .. uv3);
				end
			else
				doStopAllActions(uv1);
				uv1:setString("00:00:00");

				if uv0 == 2 then
					uv4:openLimitTimeGiftWindow(false);
				end
			end
		end)(slot3);
		slot1:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1;

			if uv0 < 0 then
				doStopAllActions(uv1);
				uv1:setString("00:00:00");
			else
				uv2(uv0);
			end
		end))));
	else
		slot6(slot3);
	end
end

function LimitTimeGiftWindow.setData(slot0, slot1)
	slot0.data = slot1 or {};

	if slot0.data.gifts ~= nil and next(slot0.data.gifts) ~= nil then
		if #slot0.data.gifts <= 1 then
			slot0.tab_page:setVisible(false);
		else
			slot0.tab_page:setVisible(true);
		end

		slot0:setTabPos(slot0.data.gifts);
	else
		uv0:openLimitTimeGiftWindow(false);
	end
end

function LimitTimeGiftWindow.setPanelData(slot0, slot1)
	slot2 = slot1 or 1;

	slot0:CountDownTime(slot0.time, {
		less_time = slot0.data.gifts[slot2].end_time - GameNet:getInstance():getTime(),
		time_model = 2,
		text = TI18N("后礼包消失")
	});

	slot6, slot7 = slot0:setRewardSetting(uv0[slot0.data.gifts[slot2].award_id or 101].award);
	slot0.gold_scrollview = createScrollView(slot0.item_scroll_size.width, slot0.item_scroll_size.height, 0, 50, slot0.item_scroll, ScrollViewDir.horizontal);
	slot0.item_list = commonShowSingleRowItemList(slot0.gold_scrollview, slot0.item_list, slot7, slot6);

	if #slot7 <= 4 then
		slot0.item_scroll:setTouchEnabled(false);
	else
		slot0.item_scroll:setTouchEnabled(true);
	end

	slot8 = uv0[slot0.data.gifts[slot2].award_id];

	slot0.limit_buy_text:setString(string.format(TI18N("限购: %s/%s"), slot0.data.gifts[slot2].count, slot8.limit_count));

	if slot8.limit_count <= slot0.data.gifts[slot2].count then
		slot0.btn_buy_label:setString(TI18N("已购买"));
		setChildUnEnabled(true, slot0.btn_buy);
		slot0.btn_buy:setTouchEnabled(false);
		slot0.btn_buy_label:disableEffect(cc.LabelEffect.OUTLINE);
	else
		slot0.btn_buy_label:setString(slot8.price .. TI18N("元"));
	end

	slot0.gift_percent_num:setNum(slot8.art_words, true);

	if slot0.icon_per == nil then
		slot0.icon_per = createSprite(nil, uv1 + slot0.gift_percent_num:getContentSize().width * 0.5, 188, slot0.main_container, cc.p(0, 0.5));

		loadSpriteTexture(slot0.icon_per, PathTool.getResFrame("type30", "type30_per"), LOADTEXT_TYPE_PLIST);
	else
		slot0.icon_per:setPositionX(uv1 + slot0.gift_percent_num:getContentSize().width * 0.5);
	end
end

function LimitTimeGiftWindow.setTabPos(slot0, slot1)
	slot0.max_index = #slot1 or 1;

	for slot5 = 1, slot0.max_index do
		slot0.page_icon_list[slot5] = slot0.tab_page:getChildByName("page_icon_" .. slot5);

		slot0.page_icon_list[slot5]:setPositionX(slot0.tab_page_size.width * slot5 / (slot0.max_index + 1));
	end

	if slot0.max_index < 5 then
		for slot5 = slot0.max_index + 1, 5 do
			slot0.tab_page:getChildByName("page_icon_" .. slot5):setVisible(false);
		end
	end

	slot0:tabPageIconView(slot0.touch_index);
end

function LimitTimeGiftWindow.setRewardSetting(slot0, slot1)
	slot2 = {
		scale = 0.9,
		space_x = 10,
		is_center = true,
		max_count = 4
	};
	slot3 = {};

	if slot1 then
		for slot7, slot8 in pairs(slot1) do
			uv0(slot3, {
				slot8[1],
				slot8[2]
			});
		end
	end

	return slot2, slot3
end

function LimitTimeGiftWindow.tabPageIconView(slot0, slot1)
	if slot0.cur_index == slot1 then
		return
	end

	if slot0.cur_tab ~= nil and slot0.page_icon_list[slot0.cur_index] then
		loadSpriteTexture(slot0.page_icon_list[slot0.cur_index], PathTool.getResFrame("personalgift", "personalgift_2"), LOADTEXT_TYPE_PLIST);
	end

	slot0.cur_index = slot1;
	slot0.cur_tab = slot0.page_icon_list[slot0.cur_index];

	if slot0.cur_tab and slot0.page_icon_list[slot0.cur_index] then
		loadSpriteTexture(slot0.page_icon_list[slot0.cur_index], PathTool.getResFrame("personalgift", "personalgift_1"), LOADTEXT_TYPE_PLIST);
	end

	slot0:setPanelData(slot0.cur_index);
end

function LimitTimeGiftWindow.BtnCharge(slot0)
	if not slot0.touch_buy_btn then
		return
	end

	if slot0.buy_btn_ticket == nil then
		slot0.buy_btn_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0.touch_buy_btn = true;

			if uv0.buy_btn_ticket ~= nil then
				GlobalTimeTicket:getInstance():remove(uv0.buy_btn_ticket);

				uv0.buy_btn_ticket = nil;
			end
		end, 2);
	end

	slot0.touch_buy_btn = nil;

	if slot0.data ~= nil and next(slot0.data) ~= nil and Config.ChargeData.data_charge_data[uv0[slot0.data.gifts[slot0.cur_index].award_id].charge_id or 0] then
		sdkOnPay(slot2.val, 1, slot2.id, slot2.name);
	end
end

function LimitTimeGiftWindow.onTouchLeft(slot0)
	slot0.touch_index = slot0.touch_index - 1;

	if slot0.touch_index <= 1 then
		slot0.touch_index = 1;
	end

	slot0:tabPageIconView(slot0.touch_index);
end

function LimitTimeGiftWindow.onTouchRight(slot0)
	slot0.touch_index = slot0.touch_index + 1;

	if slot0.max_index <= slot0.touch_index then
		slot0.touch_index = slot0.max_index;
	end

	slot0:tabPageIconView(slot0.touch_index);
end

function LimitTimeGiftWindow.close_callback(slot0)
	doStopAllActions(slot0.time);

	if slot0.image_bg_load then
		slot0.image_bg_load:DeleteMe();

		slot0.image_bg_load = nil;
	end

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe();
		end

		slot0.item_list = nil;
	end

	if slot0.gift_percent_num then
		slot0.gift_percent_num:DeleteMe();

		slot0.gift_percent_num = nil;
	end

	if slot0.buy_btn_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.buy_btn_ticket);

		slot0.buy_btn_ticket = nil;
	end

	uv0:openLimitTimeGiftWindow(false);
end
