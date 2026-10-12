PlanesafkOrderactionUntieRewardWindow = PlanesafkOrderactionUntieRewardWindow or BaseClass(BaseView)
slot1 = PlanesafkController:getInstance():getModel()

function PlanesafkOrderactionUntieRewardWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "planesafk/planesafk_orderaction_untie_reward_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("planes", "orderaction_bg"),
			type = ResourcesType.single
		}
	}
end

function PlanesafkOrderactionUntieRewardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("Text_3"):setString(TI18N("征战之证"))
	slot1:getChildByName("Text_3_0"):setString(TI18N("现在购买可立即解锁"))
	slot1:getChildByName("Text_3_1"):setString(TI18N("累计通关积分总计可获得"))

	slot2 = createRichLabel(22, cc.c4b(43, 25, 94, 255), cc.p(0.5, 0.5), cc.p(305, 365), nil, , 400)

	slot2:setString(string.format(TI18N("<div fontcolor=#ffecac >激活征战之证，立即解锁</div><div fontcolor=#0DFD00 >5阶</div><div fontcolor=#ffecac >奖励！</div>")))
	slot1:addChild(slot2)

	slot0.btn_change = slot1:getChildByName("btn_change")
	slot0.btn_change_label = slot0.btn_change:getChildByName("Text_6")

	if not slot0.image_bg_load then
		slot0.image_bg_load = loadSpriteTextureFromCDN(slot1:getChildByName("Sprite_1"), PathTool.getPlistImgForDownLoad("planes", "orderaction_bg"), ResourcesType.single, slot0.image_bg_load)
	end

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
end

function PlanesafkOrderactionUntieRewardWindow.setData(slot0)
	slot2 = uv0:getCurPeriod()

	if Config.PlanesWarOrderData.data_advance_card_list and slot1[slot2] then
		slot0.item_list1 = commonShowSingleRowItemList(slot0.goods_1, slot0.item_list1, slot1[slot2].client_reward_1 or {}, {
			scale = 0.7,
			space_x = 3,
			max_count = 4,
			is_center = true
		})
		slot0.item_list2 = commonShowSingleRowItemList(slot0.goods_2, slot0.item_list2, slot1[slot2].client_reward_2 or {}, {
			scale = 0.7,
			max_count = 4,
			is_center = true
		})
		slot7 = Config.ChargeData.data_charge_data

		if (slot1[slot2].charge_id or nil) and slot7[slot8] then
			slot0.btn_change_label:setString(string.format(TI18N("￥%d购买"), slot7[slot8].val))
		end
	end
end

function PlanesafkOrderactionUntieRewardWindow.register_event(slot0)
	slot0:addGlobalEvent(PlanesafkEvent.Planesafk_OrderAction_Init_Event, function ()
		if uv0:getGiftStatus() == 1 then
			uv1.btn_change:setTouchEnabled(false)
			setChildUnEnabled(true, uv1.btn_change)
			uv1.btn_change_label:disableEffect(cc.LabelEffect.OUTLINE)
		end
	end)
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

			if Config.PlanesWarOrderData.data_advance_card_list and slot2[slot3] and (slot2[slot3].charge_id or nil) and slot1[slot4] then
				sdkOnPay(slot1[slot4].val, 1, slot1[slot4].id, slot1[slot4].name)
			end
		end
	end)
end

function PlanesafkOrderactionUntieRewardWindow.changeWarn(slot0)
	slot1 = uv0:getCurDay()
	slot2 = Config.ChargeData.data_charge_data

	if Config.PlanesWarOrderData.data_advance_card_list and slot3[uv0:getCurPeriod()] then
		slot5 = nil

		if slot1 >= 39 then
			slot5 = (slot1 ~= 44 or TI18N("活动将在今天结束，是否确认充值")) and string.format(TI18N("活动将在 %d 天后结束，是否确认充值"), 44 - slot1)
		end

		if slot5 then
			CommonAlert.show(slot5, TI18N("确定"), function ()
				if (uv0[uv1].charge_id or nil) and uv2[slot0] then
					uv3.cur_charge_id = uv2[slot0].id

					ActionController:getInstance():sender21016(uv3.cur_charge_id)
				end
			end, TI18N("取消"), nil, CommonAlert.type.common, nil, {
				timer_for = true,
				timer = 5
			}, 26)
		elseif (slot3[slot4].charge_id or nil) and slot2[slot6] then
			slot0.cur_charge_id = slot2[slot6].id

			ActionController:getInstance():sender21016(slot0.cur_charge_id)
		end
	end
end

function PlanesafkOrderactionUntieRewardWindow.openRootWnd(slot0)
end

function PlanesafkOrderactionUntieRewardWindow.close_callback(slot0)
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
