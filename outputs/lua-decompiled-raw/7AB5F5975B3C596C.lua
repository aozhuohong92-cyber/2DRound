SevenGoalTotleChargeWindow = SevenGoalTotleChargeWindow or BaseClass(BaseView)
slot0 = SevenGoalController:getInstance()
slot1 = Config.DayGoalsNewData.data_charge_list
slot2 = table.sort
slot3 = table.insert

function SevenGoalTotleChargeWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "seven_goal/seven_goal_adventure_lev_reward"
end

function SevenGoalTotleChargeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("Text_1"):setString(TI18N("累充奖励"))

	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 608,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 167,
		space_y = 10,
		col = 1,
		need_dynamic = true,
		item_class = SevenGoalTotleChargeItem
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.btn_close = slot1:getChildByName("btn_close")
end

function SevenGoalTotleChargeWindow.openRootWnd(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:setData(uv0:getModel():getPeriodChargeTotalData(), nil, , uv0:getModel():getSevenGoalPeriod())
	end
end

function SevenGoalTotleChargeWindow.register_event(slot0)
	slot0:addGlobalEvent(SevenGoalEvent.Tesk_Updata, function (slot0)
		if uv0.item_scrollview then
			uv0.item_scrollview:setData(uv1:getModel():getPeriodChargeTotalData(), nil, , uv1:getModel():getSevenGoalPeriod())
		end
	end)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openSevenGoalTotleChargeView(false)
	end, true, 1)
end

function SevenGoalTotleChargeWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openSevenGoalTotleChargeView(false)
end

SevenGoalTotleChargeItem = class("SevenGoalTotleChargeItem", function ()
	return ccui.Widget:create()
end)

function SevenGoalTotleChargeItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function SevenGoalTotleChargeItem.configUI(slot0)
	slot0.size = cc.size(608, 167)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("seven_goal/seven_goal_adventure_lev_reward_item"))

	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.title_name = slot1:getChildByName("title_name")
	slot0.btn_get = slot1:getChildByName("btn_get")
	slot0.btn_get_label = slot0.btn_get:getChildByName("Text_1")

	slot0.btn_get_label:setString(TI18N("领取"))
	slot0.btn_get:setVisible(false)

	slot0.has_spr = slot1:getChildByName("has_spr")

	slot0.has_spr:setVisible(false)

	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 5,
		start_x = 0,
		need_dynamic = true,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function SevenGoalTotleChargeItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data then
			uv1:sender13606(uv0.data.id)
		end
	end, true, 1)
end

function SevenGoalTotleChargeItem.setExtendData(slot0, slot1)
	slot0.cur_item_period = slot1
end

function SevenGoalTotleChargeItem.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.data = slot1

	if uv0[slot0.cur_item_period] and uv0[slot0.cur_item_period][slot1.id] then
		if slot1.finish == 0 then
			setChildUnEnabled(true, slot0.btn_get)
			slot0.btn_get_label:disableEffect(cc.LabelEffect.OUTLINE)
		else
			setChildUnEnabled(false, slot0.btn_get)
			slot0.btn_get_label:enableOutline(Config.ColorData.data_color4[264], 2)
		end

		slot0.btn_get:setVisible(slot1.finish == 0 or slot1.finish == 1)
		slot0.has_spr:setVisible(slot1.finish == 2)
		slot0.title_name:setString(uv0[slot0.cur_item_period][slot1.id].desc)

		slot2 = {}
		slot6 = slot1.id

		for slot6, slot7 in pairs(uv0[slot0.cur_item_period][slot6].award) do
			table.insert(slot2, {
				bid = slot7[1],
				quantity = slot7[2]
			})
		end

		if #slot2 > 4 then
			slot0.item_scrollview:setClickEnabled(true)
		else
			slot0.item_scrollview:setClickEnabled(false)
		end

		slot0.item_scrollview:setData(slot2)
		slot0.item_scrollview:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
				slot5:setDefaultTip()
				slot5:setSwallowTouches(false)
			end
		end)
	end
end

function SevenGoalTotleChargeItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
