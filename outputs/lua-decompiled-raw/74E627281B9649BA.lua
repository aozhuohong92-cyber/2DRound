ActionAccChargePanel = class("ActionAccChargePanel", function ()
	return ccui.Widget:create()
end)

function ActionAccChargePanel.ctor(slot0, slot1, slot2)
	slot0.holiday_bid = slot1
	slot0.type = slot2
	slot0.ctrl = ActionController:getInstance()
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.cur_select = nil
	slot0.cur_index = nil

	slot0:configUI()
	slot0:register_event()
end

function ActionAccChargePanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_acc_charge_panel"))

	slot0.root_wnd:setPosition(-40, -118)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.bg = slot0.main_container:getChildByName("background")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getTargetRes("bigbg/action", "action_acc_bg", false, false), ResourcesType.single, function ()
			if not tolua.isnull(uv0.bg) then
				uv0.bg:loadTexture(uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.title_img = slot0.title_con:getChildByName("title_img")

	if slot0.ctrl:getActionSubTabVo(slot0.holiday_bid) then
		if slot2.aim_title == nil or slot2.aim_title == "" then
			slot2.aim_title = "txt_cn_action_acc_title"
		end

		if not slot0.item_load1 then
			slot0.item_load1 = loadSpriteTextureFromCDN(slot0.title_img, PathTool.getTargetRes("bigbg/action", slot2.aim_title, false, false), ResourcesType.single, slot0.item_load1)
		end
	end

	slot0.tab_con = slot0.main_container:getChildByName("tab_con")
	slot0.btn_list = {}

	for slot7 = 1, 2 do
		slot8 = slot0.tab_con:getChildByName("btn" .. slot7)
		slot0.btn_list[slot7] = slot8
		slot0.btn_list[slot7].arrow = slot8:getChildByName("arrow")

		slot0.btn_list[slot7].arrow:setVisible(false)

		slot0.btn_list[slot7].red_point = slot8:getChildByName("red_point")

		slot0.btn_list[slot7].red_point:setVisible(false)
		slot0.btn_list[slot7]:setBright(false)

		slot0.btn_list[slot7].label = slot0.btn_list[slot7]:getTitleRenderer()

		slot0.btn_list[slot7].label:setTextColor(Config.ColorData.data_color4[141])
		slot8:setTitleText(({
			TI18N("每日充值"),
			TI18N("连续充值")
		})[slot7])
	end

	slot0.charge_con = slot0.main_container:getChildByName("charge_con")

	slot0.title_con:getChildByName("time_title"):setString(TI18N("剩余时间："))

	slot0.time_val = slot0.title_con:getChildByName("time_val")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.charge_con, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.charge_con:getContentSize(), {
		start_y = 12,
		start_x = 13,
		space_x = 2,
		row = 0,
		space_y = 12,
		col = 1,
		item_class = ActionAccDayItem,
		item_width = ActionAccDayItem.Width,
		item_height = ActionAccDayItem.Height
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.charge_btn = slot0.main_container:getChildByName("charge_btn")

	slot0.charge_btn:setTitleText(TI18N("立即充值"))

	slot0.charge_btn.label = slot0.charge_btn:getTitleRenderer()

	if slot0.charge_btn.label ~= nil then
		slot0.charge_btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
	end

	slot0.acc_charge_con = slot0.main_container:getChildByName("acc_charge_con")
	slot0.item_scrollview1 = CommonScrollViewLayout.new(slot0.acc_charge_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.acc_charge_con:getContentSize(), {
		start_y = 4,
		start_x = 3,
		space_x = 15,
		row = 1,
		space_y = 0,
		col = 0,
		item_class = ActionAccChargeItem,
		item_width = ActionAccChargeItem.Width,
		item_height = ActionAccChargeItem.Height
	})

	slot0.item_scrollview1:setSwallowTouches(false)
end

function ActionAccChargePanel.register_event(slot0)
	if not slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				uv0.item_effect_list = slot0.item_effect_list

				uv0:setLessTime(slot0.remain_sec)

				if slot0.args and next(slot0.args) ~= nil then
					for slot4, slot5 in pairs(slot0.args) do
						if slot5.args_key == 1 then
							uv0.has_num = slot5.args_val
						end
					end
				end

				uv0.today_list = {}
				uv0.acc_list = {}
				slot1 = {}

				if slot0.aim_list and next(slot0.aim_list) ~= nil then
					for slot5, slot6 in pairs(slot0.aim_list) do
						for slot10, slot11 in pairs(slot6.aim_args) do
							if slot11.aim_args_key == 3 then
								if slot11.aim_args_val == 1 then
									uv0.today_list[slot5] = slot6
									uv0.today_list[slot5].has_num = uv0.has_num
									uv0.today_list[slot5].item_effect_list = uv0.item_effect_list
								elseif slot11.aim_args_val == 2 then
									uv0.acc_list[slot5] = slot6
									uv0.acc_list[slot5].item_effect_list = uv0.item_effect_list
								end
							elseif slot11.aim_args_key == 4 then
								if uv0.today_list[slot5] then
									uv0.today_list[slot5].need_charge = slot11.aim_args_val
								end

								if uv0.acc_list[slot5] then
									uv0.acc_list[slot5].need_charge = slot11.aim_args_val
								end
							elseif slot11.aim_args_key == 5 then
								if uv0.today_list[slot5] then
									uv0.today_list[slot5].charge_day = slot11.aim_args_val
								end

								if uv0.acc_list[slot5] then
									uv0.acc_list[slot5].charge_day = slot11.aim_args_val
								end
							elseif slot11.aim_args_key == 6 then
								if uv0.today_list[slot5] then
									uv0.today_list[slot5].has_charge = slot11.aim_args_val
								end

								if uv0.acc_list[slot5] then
									uv0.acc_list[slot5].has_charge = slot11.aim_args_val
								end
							end
						end
					end
				end

				if uv0.cur_index then
					uv0:updateByIndex(uv0.cur_index)
				end
			end
		end)
	end

	for slot4, slot5 in pairs(slot0.btn_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:selectByBtn(uv1)
			end
		end)
	end

	slot0.charge_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			VipController:getInstance():openVipMainWindow(true)
		end
	end)
end

function ActionAccChargePanel.selectByBtn(slot0, slot1)
	if slot0.cur_index and slot0.cur_index == slot1 then
		return
	end

	if slot0.cur_select then
		slot0.cur_select:setBright(false)
		slot0.cur_select.arrow:setVisible(false)
		slot0.cur_select.label:setTextColor(Config.ColorData.data_color4[141])
	end

	slot0.cur_index = slot1
	slot0.cur_select = slot0.btn_list[slot1]

	slot0.cur_select:setBright(true)
	slot0.cur_select.arrow:setVisible(true)
	slot0.cur_select.label:setTextColor(Config.ColorData.data_color4[175])

	if slot1 == 1 then
		slot0.acc_charge_con:setVisible(false)
		slot0.charge_con:setVisible(true)

		if slot0.today_list and next(slot0.today_list) ~= nil then
			slot0:createDaysList(slot0.today_list)
		end
	elseif slot1 == 2 then
		slot0.acc_charge_con:setVisible(true)
		slot0.charge_con:setVisible(false)

		if slot0.acc_list and next(slot0.acc_list) ~= nil then
			slot0:createGoodsList(slot0.acc_list)
		end
	end
end

function ActionAccChargePanel.updateByIndex(slot0, slot1)
	if slot1 == 1 then
		slot0.acc_charge_con:setVisible(false)
		slot0.charge_con:setVisible(true)

		if slot0.today_list and next(slot0.today_list) ~= nil then
			slot0:createDaysList(slot0.today_list)
		end
	elseif slot1 == 2 then
		slot0.acc_charge_con:setVisible(true)
		slot0.charge_con:setVisible(false)

		if slot0.acc_list and next(slot0.acc_list) ~= nil then
			slot0:createGoodsList(slot0.acc_list)
		end
	end

	slot0:checkBtnRedList()
end

function ActionAccChargePanel.checkBtnRedList(slot0)
	if slot0.btn_list[1] then
		slot0.btn_list[1].red_point:setVisible(slot0:checkStatus(slot0.today_list))
	end

	for slot6, slot7 in pairs(slot0.acc_list) do
		table.insert({}, slot7)
	end

	if slot0.btn_list[2] then
		slot0.btn_list[2].red_point:setVisible(slot0:checkGoodStatus(slot2))
	end
end

function ActionAccChargePanel.createGoodsList(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		table.insert(slot2, slot7)
	end

	slot0.item_scrollview1:setData(slot2)
	slot0.item_scrollview1:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview1:getItemList()) do
			slot5:setHolidayBid(uv0.holiday_bid)
		end
	end)
	slot0:checkBtnRedList()
end

function ActionAccChargePanel.checkGoodStatus(slot0, slot1)
	slot2 = false

	if slot1 and next(slot1 or {}) ~= 0 then
		for slot6, slot7 in ipairs(slot1) do
			if slot7.status == 1 then
				slot2 = true
			end
		end
	end

	return slot2
end

function ActionAccChargePanel.createDaysList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		table.insert(slot2, slot7)
	end

	slot0.charge_btn:setVisible(false)
	slot0.item_scrollview:setData(slot2)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setHolidayBid(uv0.holiday_bid)
		end
	end)
	slot0:checkBtnRedList()
end

function ActionAccChargePanel.checkGetStatus(slot0, slot1)
	slot2 = 0

	if slot1 and next(slot1 or {}) ~= 0 then
		for slot6, slot7 in ipairs(slot1) do
			if slot7.status == 1 or slot7.status == 2 then
				slot2 = slot2 + 1
			end
		end
	end

	return slot2
end

function ActionAccChargePanel.checkStatus(slot0, slot1)
	slot2 = false

	if slot1 and next(slot1 or {}) ~= 0 then
		for slot6, slot7 in ipairs(slot1) do
			if slot7.status == 1 then
				slot2 = true
			end
		end
	end

	return slot2
end

function ActionAccChargePanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_val) then
		return
	end

	slot0.time_val:stopAllActions()

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.time_val:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.time_val:stopAllActions()
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function ActionAccChargePanel.setTimeFormatString(slot0, slot1)
	slot0.rest_time = slot1

	if slot1 > 0 then
		slot0.time_val:setString(TimeTool.GetTimeFormatDayIIIIII(slot1))
	else
		slot0.time_val:setString("")
	end
end

function ActionAccChargePanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		ActionController:getInstance():cs16603(slot0.holiday_bid)
		slot0:selectByBtn(1)
	end
end

function ActionAccChargePanel.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.item_load1 then
		slot0.item_load1:DeleteMe()

		slot0.item_load1 = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.item_scrollview1 then
		slot0.item_scrollview1:DeleteMe()

		slot0.item_scrollview1 = nil
	end

	if slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)
		slot0.update_action_even_event = nil
	end

	doStopAllActions(slot0.time_val)
end

ActionAccChargeItem = class("ActionAccChargeItem", function ()
	return ccui.Widget:create()
end)
ActionAccChargeItem.Width = 219
ActionAccChargeItem.Height = 439

function ActionAccChargeItem.ctor(slot0)
	slot0.ctrl = ActionController:getInstance()
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:configUI()
	slot0:register_event()
end

function ActionAccChargeItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_acc_charge_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)
	slot0:setContentSize(cc.size(ActionAccChargeItem.Width, ActionAccChargeItem.Height))

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.desc = createRichLabel(26, 175, cc.p(0.5, 1), cc.p(slot0.main_container:getContentSize().width / 2, 360))

	slot0.main_container:addChild(slot0.desc)

	slot0.scroll = slot0.main_container:getChildByName("scroll")
	slot0.btn = slot0.main_container:getChildByName("btn")

	slot0.btn:setTitleText(TI18N("领取"))

	slot0.btn.label = slot0.btn:getTitleRenderer()

	if slot0.btn.label ~= nil then
		slot0.btn.label:enableOutline(Config.ColorData.data_color4[277], 2)
	end

	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.scroll, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.scroll:getContentSize(), {
		start_y = 24,
		start_x = 49,
		space_x = 10,
		row = 1,
		space_y = 4,
		col = 0,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function ActionAccChargeItem.setData(slot0, slot1)
	slot0.data = slot1
	slot3 = {}

	for slot7, slot8 in pairs(slot1.item_list) do
		slot9 = deepCopy(Config.ItemData.data_get_data(slot8.bid))
		slot9.quantity = slot8.num

		table.insert(slot3, slot9)
	end

	slot0.item_scrollview:setData(slot3)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()

			if slot5:getData() and slot6.id then
				slot7 = slot6.id

				for slot12, slot13 in pairs(uv1.item_effect_list) do
					if slot7 and slot7 == slot13.bid then
						if slot6.quality >= 4 then
							slot5:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
						else
							slot5:showItemEffect(true, 263, PlayerAction.action_2, true, 1.1)
						end
					end
				end
			end
		end
	end)
	slot0.desc:setString(string.format(TI18N("累计%s天 (%s/%s)\n  充值<div fontcolor=#249003>%s</div><img src=%s scale=0.25 visible=true />"), slot1.charge_day, slot1.has_charge, slot1.charge_day, slot1.need_charge, PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold)))
	slot0:changeChargeBtn(slot1.status)
end

function ActionAccChargeItem.register_event(slot0)
	slot0.btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				if uv0.data.status == 1 then
					uv0.ctrl:cs16604(uv0.holiday_bid, uv0.data.aim, 0)
				elseif slot2 == 0 then
					VipController:getInstance():openVipMainWindow(true)
				elseif slot2 == 2 then
					message(TI18N("已经领取过了"))
				end
			end
		end
	end)
end

function ActionAccChargeItem.setHolidayBid(slot0, slot1)
	slot0.holiday_bid = slot1
end

function ActionAccChargeItem.changeChargeBtn(slot0, slot1)
	if slot1 == 0 then
		slot0.btn:setTitleText(TI18N("去充值"))
		slot0.btn.label:enableOutline(Config.ColorData.data_color4[177], 2)
		slot0.btn:loadTextures(PathTool.getResFrame("common", "common_1018"), "", "", LOADTEXT_TYPE_PLIST)
	elseif slot1 == 1 then
		slot0.btn:setTitleText(TI18N("领取"))
		setChildUnEnabled(false, slot0.btn)
		slot0.btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
		slot0.btn:loadTextures(PathTool.getResFrame("common", "common_1017"), "", "", LOADTEXT_TYPE_PLIST)
	elseif slot1 == 2 then
		slot0.btn:setTitleText(TI18N("已领取"))
		setChildUnEnabled(true, slot0.btn)
		slot0.btn.label:disableEffect(cc.LabelEffect.OUTLINE)
	end
end

function ActionAccChargeItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

ActionAccDayItem = class("ActionAccDayItem", function ()
	return ccui.Widget:create()
end)
ActionAccDayItem.Width = 679
ActionAccDayItem.Height = 154

function ActionAccDayItem.ctor(slot0)
	slot0.ctrl = ActionController:getInstance()
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:configUI()
	slot0:register_event()
end

function ActionAccDayItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_acc_day_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)
	slot0:setContentSize(cc.size(ActionAccDayItem.Width, ActionAccDayItem.Height))

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_label = slot0.main_container:getChildByName("title_label")
	slot0.coin = slot0.main_container:getChildByName("coin")
	slot0.exp = slot0.main_container:getChildByName("exp")

	slot0.exp:setString("")

	slot0.get = slot0.main_container:getChildByName("get")

	slot0.get:setVisible(false)

	slot0.btn = slot0.main_container:getChildByName("btn")
	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot0.btn = slot0.main_container:getChildByName("btn")

	slot0.btn:setTitleText(TI18N("领取"))

	slot0.btn.label = slot0.btn:getTitleRenderer()

	if slot0.btn.label ~= nil then
		slot0.btn.label:enableOutline(Config.ColorData.data_color4[277], 2)
	end

	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.goods_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.goods_con:getContentSize(), {
		start_y = 11,
		start_x = 3,
		space_x = 15,
		row = 1,
		space_y = 4,
		col = 0,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function ActionAccDayItem.register_event(slot0)
	slot0.btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				if uv0.data.status == 1 then
					uv0.ctrl:cs16604(uv0.holiday_bid, uv0.data.aim, 0)
				elseif slot2 == 0 then
					VipController:getInstance():openVipMainWindow(true)
				end
			end
		end
	end)
end

function ActionAccDayItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.title_label:setString(TI18N("累充") .. slot1.need_charge .. TI18N("钻"))
	slot0.exp:setString(slot1.has_num .. "/" .. slot1.need_charge)

	slot5 = slot0.exp
	slot7 = slot5
	slot6 = slot0.exp
	slot8 = slot6

	slot0.coin:setPositionX(slot5.getPositionX(slot7) - slot6.getContentSize(slot8).width)
	slot0:changeBtn(slot1.status)

	slot3 = {}

	for slot7, slot8 in pairs(slot1.item_list) do
		slot9 = deepCopy(Config.ItemData.data_get_data(slot8.bid))
		slot9.quantity = slot8.num

		table.insert(slot3, slot9)
	end

	slot0.item_scrollview:setData(slot3)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()

			if slot5:getData() and slot6.id then
				slot7 = slot6.id

				for slot12, slot13 in pairs(uv1.item_effect_list) do
					if slot7 and slot7 == slot13.bid then
						if slot6.quality >= 4 then
							slot5:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
						else
							slot5:showItemEffect(true, 263, PlayerAction.action_2, true, 1.1)
						end
					end
				end
			end
		end
	end)
end

function ActionAccDayItem.setHolidayBid(slot0, slot1)
	slot0.holiday_bid = slot1
end

function ActionAccDayItem.changeBtn(slot0, slot1)
	if slot1 == 0 then
		slot0.btn:setVisible(true)
		slot0.get:setVisible(false)
		slot0.btn:setTitleText(TI18N("去充值"))
		slot0.btn:loadTextures(PathTool.getResFrame("common", "common_1018"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.btn.label:enableOutline(Config.ColorData.data_color4[177], 2)
	elseif slot1 == 1 then
		slot0.btn:setVisible(true)
		slot0.get:setVisible(false)
		slot0.btn:setTitleText(TI18N("领取"))
		slot0.btn:loadTextures(PathTool.getResFrame("common", "common_1017"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
	elseif slot1 == 2 then
		slot0.btn:setVisible(false)
		slot0.get:setVisible(true)
	end
end

function ActionAccDayItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
