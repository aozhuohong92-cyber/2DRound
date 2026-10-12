MergeFirstChargePanel = class("MergeFirstChargePanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()

function MergeFirstChargePanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.touch_buy_skin = true
	slot0.attr_list = {}

	slot0:configUI()
	slot0:register_event()

	slot0.charge_status = 0
end

function MergeFirstChargePanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/merge_first_charge_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.holiday_bg = slot0.main_container:getChildByName("bg")

	slot0:setHolidayBG()

	slot0.time_text_0 = slot0.main_container:getChildByName("time_text_0")

	slot0.time_text_0:setString(TI18N("剩余时间："))

	slot0.text_attr = slot0.main_container:getChildByName("Text_32")

	slot0.text_attr:setVisible(false)
	slot0.main_container:getChildByName("Text_2"):setVisible(false)

	slot0.text_price = slot0.main_container:getChildByName("text_price")

	slot0.text_price:setVisible(false)
	slot0.text_price:setString("")

	slot0.has_get = slot0.main_container:getChildByName("has_get")

	slot0.has_get:setVisible(false)

	slot0.btn_goto = slot0.main_container:getChildByName("btn_goto")
	slot0.btn_goto_text = slot0.btn_goto:getChildByName("Text_7_0")

	slot0.btn_goto_text:setString(TI18N("前往"))
	slot0.btn_goto:setVisible(false)

	slot0.btn_buy = slot0.main_container:getChildByName("btn_buy")
	slot0.btn_buy_text = slot0.btn_buy:getChildByName("Text_4")

	slot0.btn_buy_text:setString(TI18N("领取"))
	slot0.btn_buy:setVisible(false)

	slot0.time_text = slot0.main_container:getChildByName("time_text")

	slot0.time_text:setString("")

	slot2 = slot0.main_container:getChildByName("goods")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 15,
		start_x = 75,
		space_x = 15,
		row = 0,
		space_y = 15,
		col = 4,
		scale = 0.9,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.9,
		item_height = BackPackItem.Height * 0.9
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function MergeFirstChargePanel.setHolidayBG(slot0)
	slot1 = "action_merge_first_charge"

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot2.aim_title ~= "" and slot2.aim_title then
		slot1 = slot2.aim_title
	end

	if not slot0.bg_load then
		slot0.bg_load = loadSpriteTextureFromCDN(slot0.holiday_bg, PathTool.getPlistImgForDownLoad("bigbg/action", slot1), ResourcesType.single, slot0.bg_load)
	end
end

function MergeFirstChargePanel.register_event(slot0)
	if not slot0.merge_first_charge_event then
		slot0.merge_first_charge_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if not slot0 then
				return
			end

			if slot0.bid == uv0.holiday_bid then
				uv0.data = slot0

				commonCountDownTime(uv0.time_text, slot0.remain_sec)
				uv0:setData(slot0)
			end
		end)
	end

	registerButtonEventListener(slot0.btn_buy, function ()
		ActionController:getInstance():cs16604(uv0.holiday_bid, uv0.data.aim_list[1].aim)
	end, true)
	registerButtonEventListener(slot0.btn_goto, function ()
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
	end, true)
end

function MergeFirstChargePanel.setData(slot0, slot1)
	if slot1.aim_list[1].item_list or nil then
		slot0.charge_status = slot1.aim_list[1].status

		if slot0.charge_status == 0 then
			slot0.has_get:setVisible(false)
			slot0.btn_buy:setVisible(false)
			slot0.btn_goto:setVisible(true)
		elseif slot0.charge_status == 1 then
			slot0.has_get:setVisible(false)
			slot0.btn_buy:setVisible(true)
			slot0.btn_goto:setVisible(false)
		else
			slot0.has_get:setVisible(true)
			slot0.btn_buy:setVisible(false)
			slot0.btn_goto:setVisible(false)
		end

		slot7 = cc.p(0, 0.5)
		slot8 = cc.p(25, 620)
		slot0.charge_label = createRichLabel(26, cc.c4b(255, 255, 255, 255), slot7, slot8, nil, , 450)

		slot0.main_container:addChild(slot0.charge_label)
		slot0.charge_label:setString(slot1.aim_list[1].aim_str)

		slot3 = {}

		for slot7, slot8 in pairs(slot2) do
			table.insert(slot3, {
				bid = slot8.bid,
				quantity = slot8.num
			})
		end

		if #slot3 > 8 then
			slot0.item_scrollview:setClickEnabled(true)
		else
			slot0.item_scrollview:setClickEnabled(false)
		end

		slot0.item_scrollview:setData(slot3)
		slot0.item_scrollview:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
				slot5:setDefaultTip()
			end
		end)
	end
end

function MergeFirstChargePanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		ActionController:getInstance():cs16603(slot0.holiday_bid)
	end
end

function MergeFirstChargePanel.DeleteMe(slot0)
	doStopAllActions(slot0.time_text)

	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	if slot0.merge_first_charge_event then
		GlobalEvent:getInstance():UnBind(slot0.merge_first_charge_event)

		slot0.merge_first_charge_event = nil
	end
end
