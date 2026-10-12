UntieRewardWindow1 = UntieRewardWindow1 or BaseClass(BaseView)
slot1 = OrderActionController:getInstance():getModel()

function UntieRewardWindow1.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "orderaction/untie_reward_window1"
end

function UntieRewardWindow1.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot2 = slot1:getChildByName("Sprite_1")
	slot3 = PathTool.getPlistImgForDownLoad("bigbg/orderaction", "orderaction_banner4_3")
	slot0.title = slot1:getChildByName("Text_3")

	slot0.title:setString(TI18N("进阶赠礼"))

	slot0.title_1 = slot1:getChildByName("Text_3_0")

	slot0.title_1:setString(TI18N("激活可直接领取奖励"))

	slot0.title_2 = slot1:getChildByName("Text_3_1")

	slot0.title_2:setString(TI18N("激活进阶卡额外奖励"))

	slot5 = createRichLabel(20, cc.c4b(43, 25, 94, 255), cc.p(0.5, 0.5), cc.p(325, 310), nil, nil, 400)
	slot6 = string.format(TI18N("<div fontcolor=#f8d37b >解锁进阶赠礼，激活专属奖励，</div><div fontcolor=#98d747 >直升10级\n</div><div fontcolor=#f8d37b >限定头像框、绝版称号立刻拥有！</div>"))
	slot7 = cc.c3b(43, 25, 94)
	slot8 = cc.c3b(18, 43, 77)

	if uv0:getCurPeriod() == 7 then
		slot3 = PathTool.getPlistImgForDownLoad("bigbg/orderaction", "orderaction_banner4_3")
		slot7 = cc.c3b(248, 211, 123)
		slot8 = cc.c3b(43, 25, 94)
	elseif slot4 == 8 then
		slot3 = PathTool.getPlistImgForDownLoad("bigbg/orderaction", "orderaction_banner4_2")
		slot7 = cc.c3b(255, 232, 184)
		slot8 = cc.c3b(18, 43, 77)
	elseif slot4 == 9 then
		slot3 = PathTool.getPlistImgForDownLoad("bigbg/orderaction", "orderaction_banner4")
		slot7 = cc.c3b(255, 232, 184)
		slot8 = cc.c3b(18, 43, 77)
	else
		slot3 = PathTool.getPlistImgForDownLoad("bigbg/orderaction", "orderaction_banner4")
		slot7 = cc.c3b(255, 232, 184)
		slot8 = cc.c3b(43, 25, 94)
	end

	slot0.title:setTextColor(slot7)
	slot0.title_1:setTextColor(slot8)
	slot0.title_2:setTextColor(slot8)
	slot0.title_2:setPositionX(325)

	if not slot0.image_bg_load then
		slot0.image_bg_load = loadSpriteTextureFromCDN(slot2, slot3, ResourcesType.single, slot0.image_bg_load)
	end

	slot5:setString(slot6)
	slot1:addChild(slot5)

	slot0.btn_change = slot1:getChildByName("btn_change")
	slot0.btn_change_label = slot0.btn_change:getChildByName("Text_6")

	slot0.btn_change_label:setString(TI18N("￥198购买"))

	if uv0:getGiftStatus() == 1 then
		slot0.btn_change:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.btn_change)
		slot0.btn_change_label:disableEffect(cc.LabelEffect.OUTLINE)
	end

	slot0.goods_1 = slot1:getChildByName("goods_1")

	slot0.goods_1:setScrollBarEnabled(false)

	slot0.goods_2 = slot1:getChildByName("goods_2")

	slot0.goods_2:setScrollBarEnabled(false)
	slot0:setData()

	slot0.btn_close = slot1:getChildByName("btn_close")
end

function UntieRewardWindow1.setData(slot0)
	slot2 = uv0:getCurPeriod()

	if Config.HolidayWarOrderData.data_advance_card_list and slot1[slot2] and slot1[slot2][1] then
		slot0.item_list1 = commonShowSingleRowItemList(slot0.goods_1, slot0.item_list1, slot1[slot2][1].reward_1 or {}, {
			scale = 0.7,
			space_x = 3,
			max_count = 4,
			is_center = true
		})
		slot0.item_list2 = commonShowSingleRowItemList(slot0.goods_2, slot0.item_list2, slot1[slot2][1].reward_2 or {}, {
			scale = 0.7,
			max_count = 4,
			is_center = true
		})
	end
end

function UntieRewardWindow1.register_event(slot0)
	slot0:addGlobalEvent(OrderActionEvent.OrderAction_BuyGiftCard_Event, function ()
		if uv0:getGiftStatus() == 1 then
			uv1.btn_change:setTouchEnabled(false)
			setChildUnEnabled(true, uv1.btn_change)
			uv1.btn_change_label:disableEffect(cc.LabelEffect.OUTLINE)
		end
	end)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openBuyCardView(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openBuyCardView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_change, function ()
		uv0:changeWarn()
	end, true, 1)
	slot0:addGlobalEvent(ActionEvent.Is_Charge_Event, function (slot0)
		if uv0.cur_charge_id and slot0 and uv0.cur_charge_id == slot0.charge_id and slot0.status == 1 then
			slot1 = Config.ChargeData.data_charge_data
			slot3 = uv1:getCurPeriod()

			if Config.HolidayWarOrderData.data_advance_card_list and slot2[slot3] and slot2[slot3][1] and (slot2[slot3][1].charge_id or nil) and slot1[slot4] then
				sdkOnPay(slot1[slot4].val, 1, slot1[slot4].id, slot1[slot4].name)
			end
		end
	end)
end

function UntieRewardWindow1.changeWarn(slot0)
	slot1 = uv0:getCurDay()
	slot2 = Config.ChargeData.data_charge_data
	slot4 = uv0:getCurPeriod()

	if Config.HolidayWarOrderData.data_advance_card_list and slot3[slot4] and slot3[slot4][1] then
		slot5 = nil

		if slot1 >= 25 then
			slot6 = 30

			if slot4 == 10 then
				slot6 = 29
			end

			slot5 = (slot1 ~= slot6 or TI18N("活动将在今天结束，是否确认充值")) and string.format(TI18N("活动将在 %d 天后结束，是否确认充值"), slot6 - slot1)
		end

		if slot5 then
			CommonAlert.show(slot5, TI18N("确定"), function ()
				if (uv0[uv1][1].charge_id or nil) and uv2[slot0] then
					uv3.cur_charge_id = uv2[slot0].id

					ActionController:getInstance():sender21016(uv3.cur_charge_id)
				end
			end, TI18N("取消"), nil, CommonAlert.type.common, nil, {
				timer_for = true,
				timer = 5
			}, 26)
		elseif (slot3[slot4][1].charge_id or nil) and slot2[slot6] then
			slot0.cur_charge_id = slot2[slot6].id

			ActionController:getInstance():sender21016(slot0.cur_charge_id)
		end
	end
end

function UntieRewardWindow1.openRootWnd(slot0)
end

function UntieRewardWindow1.close_callback(slot0)
	if slot0.image_bg_load then
		slot0.image_bg_load:DeleteMe()
	end

	slot0.image_bg_load = nil

	if slot0.item_list1 then
		for slot4, slot5 in pairs(slot0.item_list1) do
			slot5:DeleteMe()
		end

		slot0.item_list1 = nil
	end

	if slot0.item_list2 then
		for slot4, slot5 in pairs(slot0.item_list2) do
			slot5:DeleteMe()
		end

		slot0.item_list2 = nil
	end

	uv0:openBuyCardView(false)
end
