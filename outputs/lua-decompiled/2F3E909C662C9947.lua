NewUntieRewardWindow = NewUntieRewardWindow or BaseClass(BaseView)
slot0 = OrderActionController:getInstance()
slot1 = Config.HolidayNewWarOrderData.data_lev_reward_list
slot2 = table.insert
slot3 = table.sort

function NewUntieRewardWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "orderaction/untie_reward_window"
end

function NewUntieRewardWindow.open_callback(slot0)
	slot0.root_wnd:getChildByName("background"):setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)
	slot0.main_container:getChildByName("title_con"):getChildByName("title_label"):setString(TI18N("奖励总览"))

	slot0.btn_buy = slot0.main_container:getChildByName("btn_buy")

	slot0.btn_buy:getChildByName("Text_1"):setString(TI18N("解锁领取"))

	if uv0:getModel():getGiftStatus() == 1 then
		slot0.btn_buy:getChildByName("Text_1"):setString(TI18N("查看进阶卡"))
	end

	slot0:commonShowReward()

	slot0.btn_close = slot0.main_container:getChildByName("btn_close")
end

function NewUntieRewardWindow.commonShowReward(slot0)
	slot1 = slot0.main_container:getChildByName("goods_1")
	slot0.item_good_1 = CommonScrollViewLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		start_x = 32,
		space_x = 20,
		row = 1,
		space_y = 0,
		col = 4,
		item_class = BackPackItem,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height
	})

	slot0.item_good_1:setSwallowTouches(false)

	if uv1[uv0:getModel():getCurPeriod()] then
		slot6 = {}
		slot7 = {}

		for slot11 = 1, #uv1[slot4] do
			if uv1[slot4][slot11] and uv1[slot4][slot11].reward then
				for slot15, slot16 in ipairs(uv1[slot4][slot11].reward) do
					if slot7[slot16[1]] then
						slot7[slot16[1]] = slot7[slot16[1]] + slot16[2]
					else
						slot7[slot16[1]] = slot16[2]
					end
				end

				for slot15, slot16 in ipairs(uv1[slot4][slot11].rmb_reward) do
					if slot7[slot16[1]] then
						slot7[slot16[1]] = slot7[slot16[1]] + slot16[2]
					else
						slot7[slot16[1]] = slot16[2]
					end
				end
			end
		end

		slot8 = Config.HolidayNewWarOrderData.data_price_list

		for slot12, slot13 in pairs(slot7) do
			slot14 = 0

			if slot8[slot12] then
				slot14 = slot8[slot12].sort or 0
			end

			uv2(slot6, {
				bid = slot12,
				quantity = slot13,
				sort = slot14
			})
		end

		uv3(slot6, function (slot0, slot1)
			return slot0.sort < slot1.sort
		end)
		slot0.item_good_1:setData(slot6)
		slot0.item_good_1:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.item_good_1:getItemList()) do
				slot5:setDefaultTip()
			end
		end)
	end
end

function NewUntieRewardWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openUntieRewardView(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_buy, function ()
		if uv0:getModel():getCurPeriod() == 1 or slot0 == 2 then
			if uv0:getOrderActionMainRoot() then
				uv0:openUntieRewardView(false)
				slot1:tabChargeView(3, slot0)
			end
		else
			uv0:openBuyCardView(true)
		end
	end, true, 1)
end

function NewUntieRewardWindow.openRootWnd(slot0)
end

function NewUntieRewardWindow.close_callback(slot0)
	if slot0.item_good_1 then
		slot0.item_good_1:DeleteMe()

		slot0.item_good_1 = nil
	end

	uv0:openUntieRewardView(false)
end
