OrderActionMainWindow = OrderActionMainWindow or BaseClass(BaseView)
slot1 = OrderActionController:getInstance():getModel()
slot2 = ActionController:getInstance()
slot3 = Config.HolidayWarOrderData.data_lev_reward_list

function OrderActionMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "orderaction/orderaction_main_window1"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("orderaction", "orderaction"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("orderwar", "orderwar"),
			type = ResourcesType.plist
		}
	}
	slot0.tab_view = {}
	slot0.tab_panel_list = {}
	slot0.cur_index = nil
	slot0.cur_box_status = nil
end

function OrderActionMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.btn_untie_reward = slot0.main_container:getChildByName("btn_untie_reward")
	slot0.btn_open_lock = slot0.main_container:getChildByName("btn_open_lock")
	slot0.btn_open_lock_label = slot0.btn_open_lock:getChildByName("name")

	slot0.btn_open_lock_label:setString("")
	slot0.btn_open_lock_label:setFontSize(22)
	slot0.btn_open_lock:loadTexture(PathTool.getResFrame("common", "common_1027"), LOADTEXT_TYPE_PLIST)

	slot0.btn_buy_lev = slot0.main_container:getChildByName("btn_buy_lev")
	slot1 = slot0.btn_buy_lev:getChildByName("Text_2")
	slot7 = "购买等级"

	slot1:setString(TI18N(slot7))
	slot1:setFontSize(22)

	for slot7 = 1, 2 do
		slot8 = {
			btn_tab_view = slot0.main_container:getChildByName("tab_view"):getChildByName("tab_" .. slot7)
		}
		slot8.normal = slot8.btn_tab_view:getChildByName("normal")
		slot8.select = slot8.btn_tab_view:getChildByName("select")

		slot8.select:setVisible(false)

		slot8.name = slot8.btn_tab_view:getChildByName("name")

		slot8.name:setTextColor(cc.c4b(248, 194, 60, 255))
		slot8.name:setString(({
			TI18N("奖励"),
			TI18N("任务")
		})[slot7])

		slot8.icon = slot8.btn_tab_view:getChildByName("icon")

		slot8.icon:setOpacity(178)

		slot8.index = slot7
		slot0.tab_view[slot7] = slot8
	end

	slot0.bar_bg = slot0.main_container:getChildByName("bar_bg")
	slot0.bar = slot0.bar_bg:getChildByName("bar")

	slot0.bar:setPercent(0)
	slot0.bar:setScale9Enabled(true)

	slot0.bar_num = slot0.bar_bg:getChildByName("bar_num")

	slot0.bar_num:setString("")

	slot0.banner_botton = slot0.main_container:getChildByName("banner_botton")
	slot0.time_text_bg = slot0.main_container:getChildByName("Text_4")

	slot0.time_text_bg:setString(TI18N("活动剩余时间:"))

	slot0.time_text = slot0.main_container:getChildByName("time_text")

	slot0.time_text:setString("")

	slot0.all_get = slot0.main_container:getChildByName("all_get")

	slot0.all_get:getChildByName("Text_6"):setString(TI18N("一键领取"))

	slot0.advance_card_buy = slot0.main_container:getChildByName("advance_card_buy")
	slot0.advance_card_buy_label = slot0.advance_card_buy:getChildByName("Text")

	slot0.advance_card_buy_label:setString("")
	slot0.advance_card_buy:setVisible(false)
	slot0:tabMainPeriodView()

	slot0.btn_rule = slot0.main_container:getChildByName("btn_rule")
	slot0.btn_close = slot0.main_container:getChildByName("btn_close")
end

function OrderActionMainWindow.tabMainPeriodView(slot0)
	slot0.level_num = slot0.main_container:getChildByName("level_num")

	slot0.level_num:setString("")
	slot0.main_container:getChildByName("Text_21"):setString(TI18N("战令等级"))
	slot0.main_container:addChild(createRichLabel(20, cc.c4b(255, 255, 255, 255), cc.p(0, 0.5), cc.p(244, 805), nil, nil, 400))

	slot5 = " "

	slot0.main_container:getChildByName("Image_1"):getChildByName("Text_1"):setString(TI18N("开学迎新"))
	slot0.main_container:getChildByName("title_barner"):setPositionX(353)

	slot8 = "orderaction_banner3_1"
	slot9 = "orderaction_banner1_1"
	slot10 = cc.c4b(255, 255, 255, 255)
	slot11 = cc.c4b(107, 42, 6, 255)
	slot12 = cc.c4b(11, 68, 154, 255)
	slot13 = cc.c4b(127, 58, 24, 255)
	slot14 = 95
	slot15 = 0
	slot16 = "34564a"

	if uv0:getCurPeriod() == 6 then
		slot6 = TI18N("花火映秋")
		slot10 = cc.c4b(255, 255, 255, 255)
		slot11 = cc.c4b(107, 42, 6, 255)
		slot15 = 95
		slot14 = 95
		slot13 = cc.c4b(127, 58, 24, 255)
		slot16 = "7f3a18"
	elseif slot7 == 7 then
		slot6 = TI18N("奇妙之夜")
		slot10 = cc.c4b(255, 255, 255, 255)
		slot11 = cc.c4b(85, 24, 127, 255)
		slot15 = 103
		slot14 = 103
		slot13 = cc.c4b(85, 24, 127, 255)

		slot0.banner_botton:setPositionY(-30)

		slot16 = "55187f"
	elseif slot7 == 8 then
		slot6 = TI18N("雪舞冬季")
		slot10 = cc.c4b(255, 255, 255, 255)
		slot11 = cc.c4b(11, 68, 154, 255)
		slot15 = 101
		slot14 = 103
		slot12 = cc.c4b(11, 68, 154, 255)
		slot13 = cc.c4b(11, 68, 154, 255)

		slot0.banner_botton:setPositionY(-57)
		slot3:setPositionY(678)

		slot16 = "0b449a"
	elseif slot7 == 9 then
		slot6 = TI18N("岁初礼赞")
		slot10 = cc.c4b(255, 255, 255, 255)
		slot11 = cc.c4b(107, 20, 43, 255)
		slot15 = 101
		slot14 = 103
		slot12 = cc.c4b(107, 20, 43, 255)
		slot13 = cc.c4b(107, 20, 43, 255)

		slot0.banner_botton:setPositionY(-57)
		slot3:setPositionY(678)

		slot16 = "6b142b"
	elseif slot7 == 10 then
		slot6 = TI18N("踏雪拾春")
		slot10 = cc.c4b(255, 255, 255, 255)
		slot11 = cc.c4b(103, 21, 21, 255)
		slot15 = 101
		slot14 = 103
		slot12 = cc.c4b(103, 21, 21, 255)
		slot13 = cc.c4b(103, 21, 21, 255)

		slot0.banner_botton:setPositionY(-13)
		slot3:setPositionY(678)

		slot16 = "671515"
	end

	slot4:setString(slot6)
	slot0.bar_num:setTextColor(slot10)
	slot0.bar_num:enableOutline(slot11, 2)
	slot0.level_num:setPositionX(slot14)
	slot0.level_num:enableOutline(slot12, 2)
	slot1:setPositionX(slot15)
	slot1:enableOutline(slot13, 2)
	slot3:setPositionY(678)
	slot2:setString(string.format(TI18N("<div fontcolor=#ffffff outline=2,#%s >通过</div><div fontcolor=#ffd200 outline=2,#%s>完成任务</div><div fontcolor=#ffffff outline=2,#%s>提升等级，领取奖励</div>"), slot16, slot16, slot16))

	slot18 = PathTool.getPlistImgForDownLoad("bigbg/orderaction", "orderaction_buttom" .. slot7) or nil

	if not slot0.title_barner_load then
		slot0.title_barner_load = loadSpriteTextureFromCDN(slot3, PathTool.getPlistImgForDownLoad("bigbg/orderaction", "orderaction_top" .. slot7) or nil, ResourcesType.single, slot0.title_barner_load)
	end

	if not slot0.barner_botton_load then
		slot0.barner_botton_load = loadSpriteTextureFromCDN(slot0.banner_botton, slot18, ResourcesType.single, slot0.barner_botton_load)
	end

	slot0.activity_time = slot0.main_container:getChildByName("activity_time")

	slot0.activity_time:setString("")
	slot0.activity_time:disableEffect(cc.LabelEffect.OUTLINE)
	slot0.btn_untie_reward:getChildByName("Text_3"):setString(TI18N("额外经验包"))

	if slot7 == 10 then
		slot19:setTextColor(cc.c4b(255, 255, 255, 255))
		slot19:enableOutline(cc.c4b(2, 0, 25, 255), 2)
	end
end

function OrderActionMainWindow.tabChargeView(slot0, slot1, slot2)
	if slot0.cur_index == (slot1 or 1) then
		return
	end

	slot0.cur_index = slot1

	slot0:setButtonShowORHide(slot1)

	if slot1 ~= 3 then
		slot0:tabHeadTitle(slot1)
	end

	if slot0.cur_panel ~= nil and slot0.cur_panel.setVisibleStatus then
		slot0.cur_panel:setVisibleStatus(false)
	end

	slot0.cur_panel = slot0:createTabViewPanel(slot0.cur_index, slot2)

	if slot0.cur_panel ~= nil and slot0.cur_panel.setVisibleStatus then
		slot0.cur_panel:setVisibleStatus(true)
	end
end

function OrderActionMainWindow.tabHeadTitle(slot0, slot1)
	if slot0.cur_herd_title ~= nil then
		slot0.cur_herd_title.select:setVisible(false)
		slot0.cur_herd_title.icon:setOpacity(178)
		slot0.cur_herd_title.name:setTextColor(cc.c4b(248, 194, 60, 255))
	end

	slot0.cur_herd_title = slot0.tab_view[slot1]

	if slot0.cur_herd_title ~= nil then
		slot0.cur_herd_title.select:setVisible(true)
		slot0.cur_herd_title.icon:setOpacity(255)
		slot0.cur_herd_title.name:setTextColor(cc.c4b(255, 255, 255, 255))
	end
end

function OrderActionMainWindow.createTabViewPanel(slot0, slot1, slot2)
	if slot0.tab_panel_list[slot1] == nil then
		if slot1 == OrderActionView.reward_panel then
			slot3 = OrderActionRewardPanel1.new(slot2)
		elseif slot1 == OrderActionView.tesk_panel then
			slot3 = OrderActionTeskPanel1.new(slot2)
		end

		if slot3 then
			slot3:setPosition(cc.p(slot0.main_container:getContentSize().width / 2, 394))
			slot0.main_container:addChild(slot3)
		end

		slot0.tab_panel_list[slot1] = slot3
	end

	return slot3
end

function OrderActionMainWindow.updateBoxStatus(slot0)
	slot1 = 0
	slot3 = uv0:getExtraStatus()

	if uv0:getRMBStatus() == 0 then
		slot1 = 0
	elseif slot2 == 1 then
		if slot3 == 0 then
			slot1 = 1
		elseif slot3 == 1 then
			slot1 = 2
		end
	end

	if slot0.cur_box_status == slot1 then
		return
	end

	slot0.cur_box_status = slot1
	slot4 = PlayerAction.action_1

	if slot1 == 0 then
		slot4 = PlayerAction.action_1
	elseif slot1 == 1 then
		slot4 = PlayerAction.action_2
	elseif slot1 == 2 then
		slot4 = PlayerAction.action_3
	end

	if slot0.box_effect then
		slot0.box_effect:clearTracks()
		slot0.box_effect:removeFromParent()

		slot0.box_effect = nil
	end

	if uv0:getCurPeriod() == 1 or slot5 == 2 then
		if not tolua.isnull(slot0.extra_exp) and slot0.box_effect == nil then
			slot0.box_effect = createEffectSpine(PathTool.getEffectRes(110), cc.p(40, 15), cc.p(0, 0), true, slot4)

			slot0.extra_exp:addChild(slot0.box_effect)
		end
	elseif not tolua.isnull(slot0.btn_untie_reward) and slot0.box_effect == nil then
		slot0.box_effect = createEffectSpine(PathTool.getEffectRes(110), cc.p(40, 22), cc.p(0, 0), true, slot4)

		slot0.btn_untie_reward:addChild(slot0.box_effect)
	end
end

function OrderActionMainWindow.getTaskRedPoint(slot0)
	addRedPointToNodeByStatus(slot0.tab_view[2].btn_tab_view, uv0:getTaskRedPoint())
end

function OrderActionMainWindow.register_event(slot0)
	slot0:addGlobalEvent(OrderActionEvent.OrderAction_Init_Event, function (slot0)
		uv0:tabChargeView(1, slot0.period)
		uv0:setBasicInitData(slot0)
		uv0:updateBoxStatus()
		uv0:getTaskRedPoint()
		uv1:getModel():setCountDownTime(uv0.time_text, slot0.end_time - GameNet:getInstance():getTime())

		if uv0.activity_time then
			slot3 = Config.ColorData.data_color4[1]

			if Config.HolidayWarOrderData.data_constant and slot2.action_time then
				slot4 = slot2.action_time.desc
				slot5 = cc.c4b(52, 86, 74, 255)

				if slot0.period == 5 and slot2.action_time4 then
					slot4 = slot2.action_time4.desc or ""
					slot5 = cc.c4b(52, 86, 74, 255)
				elseif slot0.period == 6 and slot2.action_time5 then
					slot4 = slot2.action_time5.desc or ""
					slot5 = cc.c4b(127, 58, 24, 255)
				elseif slot0.period == 7 and slot2.action_time6 then
					slot4 = slot2.action_time6.desc or ""
					slot5 = cc.c4b(85, 24, 127, 255)
				elseif slot0.period == 8 and slot2.action_time7 then
					slot4 = slot2.action_time7.desc or ""
					slot5 = cc.c4b(11, 68, 154, 255)
				elseif slot0.period == 9 and slot2.action_time8 then
					slot4 = slot2.action_time8.desc or ""
					slot5 = cc.c4b(107, 20, 43, 255)
				elseif slot0.period == 10 and slot2.action_time9 then
					slot4 = slot2.action_time9.desc or ""
					slot5 = cc.c4b(103, 21, 21, 255)
					slot3 = cc.c4b(250, 210, 137, 255)
				end

				uv0.activity_time:setString(TI18N("活动时间：") .. slot4)
				uv0.activity_time:setTextColor(slot3)
				uv0.activity_time:enableOutline(slot5, 2)
			end
		end
	end)
	slot0:addGlobalEvent(OrderActionEvent.OrderAction_TaskGet_Event, function ()
		uv0:getTaskRedPoint()
	end)
	slot0:addGlobalEvent(OrderActionEvent.OrderAction_LevReward_Event, function ()
		uv0:statusTabRewardRedPoint()
	end)
	slot0:addGlobalEvent(OrderActionEvent.OrderAction_Updata_LevExp_Event, function (slot0)
		uv0:setBasicInitData(slot0)
		uv1:setRewardLevRedPoint()
		uv0:statusTabRewardRedPoint()
	end)
	slot0:addGlobalEvent(OrderActionEvent.OrderAction_IsPopWarn_Event, function (slot0)
		if slot0 then
			slot1 = 30

			if uv0:getCurPeriod() == 10 then
				slot1 = 29
			end

			if (slot1 - slot0.cur_day == 7 or slot1 - slot0.cur_day == 3 or slot1 - slot0.cur_day == 0) and slot0.is_pop == 1 then
				uv1:openEndWarnView(true, slot0.cur_day)
			end
		end
	end)
	slot0:addGlobalEvent(OrderActionEvent.OrderAction_BuyGiftCard_Event, function ()
		uv0:updateBoxStatus()

		if uv1:getGiftStatus() == 1 then
			uv0.advance_card_buy:setEnabled(false)
			setChildUnEnabled(true, uv0.advance_card_buy)
			uv0.btn_open_lock_label:setString(TI18N("奖励总览"))
			uv0.btn_open_lock:loadTexture(PathTool.getResFrame("common", "common_1027"), LOADTEXT_TYPE_PLIST)
		else
			uv0.advance_card_buy:setEnabled(true)
			setChildUnEnabled(false, uv0.advance_card_buy)
			uv0.btn_open_lock_label:setString(TI18N("解锁领取"))
		end
	end)
	registerButtonEventListener(slot0.btn_buy_lev, function ()
		if uv1[uv0:getCurPeriod()] then
			if uv0:getCurLev() >= 40 then
				message(TI18N("您已满级，无法购买~~~"))
			else
				uv2:openBuyLevView(true)
			end
		end
	end, true, 1)

	function slot4()
		slot0 = uv0:getCurPeriod()

		if uv0:getGiftStatus() == 1 then
			uv1:send25308()
		else
			uv1:openBuyCardView(true)
		end
	end

	slot5 = false

	registerButtonEventListener(slot0.btn_untie_reward, slot4, slot5, 1)

	for slot4, slot5 in pairs(slot0.tab_view) do
		registerButtonEventListener(slot5.btn_tab_view, function ()
			slot0 = uv0:getCurDay()

			uv1:tabChargeView(uv2.index, uv0:getCurPeriod())
		end, false, 3)
	end

	registerButtonEventListener(slot0.btn_open_lock, function ()
		slot0 = uv0:getCurDay()
		slot1 = uv0:getCurPeriod()

		if uv0:getGiftStatus() == 1 then
			uv1:openUntieRewardView(true)
		else
			uv1:openBuyCardView(true)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openOrderActionMainView(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openOrderActionMainView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if Config.HolidayWarOrderData.data_constant then
			slot5 = slot3.action_rule4

			if uv0:getCurPeriod() == 6 then
				slot5 = slot3.action_rule5
			elseif slot4 == 7 then
				slot5 = slot3.action_rule6
			elseif slot4 == 8 then
				slot5 = slot3.action_rule7
			elseif slot4 == 9 then
				slot5 = slot3.action_rule8
			elseif slot4 == 10 then
				slot5 = slot3.action_rule9
			end

			TipsManager:getInstance():showCommonTips(slot5.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
		end
	end, false, 1)
	registerButtonEventListener(slot0.all_get, function ()
		uv0:send25304(0)
	end, true, 1)
	registerButtonEventListener(slot0.advance_card_buy, function ()
		uv0:changeWarn()
	end, true, 1)
	registerButtonEventListener(slot0.extra_exp, function ()
		if uv0:getGiftStatus() == 1 then
			uv1:send25308()
		else
			message(TI18N("请激活进阶卡解锁经验包"))

			slot0 = uv0:getCurDay()

			uv2:tabChargeView(3, uv0:getCurPeriod())
		end
	end, false, 1)
end

function OrderActionMainWindow.statusTabRewardRedPoint(slot0)
	slot1 = uv0:getRewardLevRedPoint()

	addRedPointToNodeByStatus(slot0.tab_view[1].btn_tab_view, slot1)
	addRedPointToNodeByStatus(slot0.all_get, slot1, 9, 6)
end

function OrderActionMainWindow.changeWarn(slot0)
	slot1 = uv0:getCurDay()
	slot2 = Config.ChargeData.data_charge_data
	slot4 = uv0:getCurPeriod()

	if Config.HolidayWarOrderData.data_advance_card_list and slot3[slot4] and slot3[slot4][1] then
		slot5 = nil

		if slot1 >= 24 then
			slot5 = (slot4 ~= 10 or (slot1 ~= 29 or TI18N("活动将在今天结束，是否确认充值")) and string.format(TI18N("活动将在 %d 天后结束，是否确认充值"), 29 - slot1)) and (slot1 ~= 30 or TI18N("活动将在今天结束，是否确认充值")) and string.format(TI18N("活动将在 %d 天后结束，是否确认充值"), 30 - slot1)
		end

		if slot5 then
			CommonAlert.show(slot5, TI18N("确定"), function ()
				if (uv0[uv1][1].charge_id or nil) and uv2[slot0] then
					sdkOnPay(uv2[slot0].val, 1, uv2[slot0].id, uv2[slot0].name)
				end
			end, TI18N("取消"), nil, CommonAlert.type.common, nil, nil, 26)
		elseif (slot3[slot4][1].charge_id or nil) and slot2[slot6] then
			sdkOnPay(slot2[slot6].val, 1, slot2[slot6].id, slot2[slot6].name)
		end
	end
end

function OrderActionMainWindow.setBasicInitData(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = uv0:getCurPeriod()

	if slot0.level_num then
		slot0.level_num:setString(slot1.lev or 0)
	end

	if uv1 and uv1[slot3] then
		if slot2 + 1 >= #uv1[slot3] then
			slot4 = #uv1[slot3]
		end

		if uv1[slot3][slot4] then
			slot5 = uv1[slot3][slot4].exp or 0

			if slot1.lev == 0 then
				slot0.bar:setPercent(slot1.exp / slot5 * 100)
				slot0.bar_num:setString(slot1.exp .. "/" .. slot5)
			else
				slot6 = uv1[slot3][slot2].exp or 0
				slot7 = slot5 - slot6

				slot0.bar:setPercent((slot1.exp - slot6) / (slot5 - slot6) * 100)
				slot0.bar_num:setString(slot1.exp .. "/" .. slot5)
			end
		end
	end
end

function OrderActionMainWindow.setButtonShowORHide(slot0, slot1)
	slot1 = slot1 or 1

	slot0.time_text_bg:setVisible(slot1 == 1)
	slot0.time_text:setVisible(slot1 == 1)
	slot0.all_get:setVisible(slot1 == 1)
	slot0.advance_card_buy:setVisible(slot1 == 3)
end

function OrderActionMainWindow.openRootWnd(slot0)
	uv0:send25309()
	uv0:send25300()
	uv0:send25303()
	uv0:send25306()
	uv0:getModel():initTaskData()
end

function OrderActionMainWindow.close_callback(slot0)
	doStopAllActions(slot0.time_text)

	if slot0.box_effect then
		slot0.box_effect:clearTracks()
		slot0.box_effect:removeFromParent()

		slot0.box_effect = nil
	end

	if slot0.title_barner_load then
		slot0.title_barner_load:DeleteMe()
	end

	slot0.title_barner_load = nil

	if slot0.barner_botton_load then
		slot0.barner_botton_load:DeleteMe()
	end

	slot0.barner_botton_load = nil

	if slot0.tab_panel_list then
		for slot4, slot5 in pairs(slot0.tab_panel_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end

		slot0.tab_panel_list = nil
	end

	if slot0.cur_lev_num then
		slot0.cur_lev_num:DeleteMe()

		slot0.cur_lev_num = nil
	end

	uv0:openOrderActionMainView(false)
end
