ActionPreferentialWindow = ActionPreferentialWindow or BaseClass(BaseView)

function ActionPreferentialWindow.__init(slot0, slot1)
	slot0.icon_id = slot1 or MainuiConst.icon.preferential
	slot0.ctrl = ActionController:getInstance()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "action/action_preferential_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("welfare", "welfare"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("welfaretab", "welfaretab"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("pokedex", "pokedex"),
			type = ResourcesType.plist
		}
	}
end

function ActionPreferentialWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)
	slot0.main_container:getChildByName("price_label_1"):setString(TI18N("总价值"))
	slot0.main_container:getChildByName("title_label"):setString(TI18N("购买奖励"))
	slot0.main_container:getChildByName("time_title"):setString(TI18N("抢购倒计时:"))

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.explain_btn = slot0.main_container:getChildByName("explain_btn")
	slot0.buy_btn = slot0.main_container:getChildByName("buy_btn")
	slot0.buy_btn_label = slot0.buy_btn:getChildByName("label")
	slot0.price_label = slot0.main_container:getChildByName("price_label_2")
	slot0.time_label = slot0.main_container:getChildByName("time_label")
	slot0.role_bg = slot0.main_container:getChildByName("role_bg")

	slot0.role_bg:ignoreContentAdaptWithSize(true)

	slot0.goods_con = slot0.main_container:getChildByName("good_con")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.goods_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.goods_con:getContentSize(), {
		start_y = 4,
		start_x = 20,
		space_x = 20,
		row = 1,
		space_y = 4,
		col = 0,
		item_class = BackPackItem,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function ActionPreferentialWindow.openRootWnd(slot0, slot1)
	if slot1 then
		slot0.holiday_bid = slot1

		slot0.ctrl:cs16603(slot0.holiday_bid)
	end
end

function ActionPreferentialWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openPreferentialWindow(false)
			end
		end)
	end

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openPreferentialWindow(false)
			end
		end)
	end

	if slot0.explain_btn then
		slot0.explain_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if Config.HolidayClientData.data_constant.preferential_rules then
					TipsManager:getInstance():showCommonTips(slot2.desc or "", slot0:getTouchBeganPosition())
				end
			end
		end)
	end

	if slot0.buy_btn then
		slot0.buy_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if Config.ChargeData.data_charge_data[uv0.recharge_id or 0] then
					sdkOnPay(slot2.val, nil, slot2.id, slot2.name, slot2.name)
				end
			end
		end)
	end

	if not slot0.update_action_preferential_event then
		slot0.update_action_preferential_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				uv0:setData(slot0)
			end
		end)
	end
end

function ActionPreferentialWindow.setData(slot0, slot1)
	if not (slot1 or {}).aim_list or next(slot2) == nil then
		slot0.ctrl:openPreferentialWindow(false)

		return
	elseif slot2[1].status and slot2[1].status == 2 then
		slot0.ctrl:openPreferentialWindow(false)

		return
	end

	slot3 = slot2[1].item_list or {}
	slot4 = 0
	slot5 = 0
	slot0.recharge_id = slot2[1].aim

	for slot9, slot10 in pairs(slot2[1].aim_args) do
		if slot10.aim_args_key == ActionExtType.ActivityOldPrice then
			slot4 = slot10.aim_args_val
		elseif slot10.aim_args_key == ActionExtType.ActivityCurrentPrice then
			slot5 = slot10.aim_args_val
		end
	end

	slot6 = {}

	for slot10, slot11 in pairs(slot3) do
		slot12 = deepCopy(Config.ItemData.data_get_data(slot11.bid))
		slot12.quantity = slot11.num

		table.insert(slot6, slot12)
	end

	slot0.item_scrollview:setData(slot6)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)

			if slot5:getData() and slot6.id and slot6.quality then
				for slot10, slot11 in pairs(uv1.item_effect_list) do
					if slot6.id == slot11.bid then
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

	slot7 = 1

	for slot11, slot12 in pairs(slot1.args) do
		if slot12.args_key == 1 then
			slot7 = slot12.args_val

			break
		end
	end

	slot8 = nil

	if slot7 == 1 then
		slot8 = PathTool.getTargetRes("bigbg/action", "txt_cn_action_preferential_1", false, false)
	elseif slot7 == 2 then
		slot8 = PathTool.getTargetRes("bigbg/action", "txt_cn_action_preferential_2", false, false)
	elseif slot7 == 3 then
		slot8 = PathTool.getTargetRes("bigbg/action", "txt_cn_action_preferential_5", false, false)
	elseif slot7 == 4 then
		slot8 = PathTool.getTargetRes("bigbg/action", "txt_cn_action_preferential_4", false, false)
	elseif slot7 == 5 then
		slot8 = PathTool.getTargetRes("bigbg/action", "txt_cn_action_preferential_3", false, false)
	end

	slot0.role_bg_load = loadImageTextureFromCDN(slot0.role_bg, slot8, ResourcesType.single, slot0.role_bg_load)

	slot0.price_label:setString(string.format("￥%d", slot4))
	slot0.buy_btn_label:setString(string.format(TI18N("￥%d购买"), slot5))

	slot0.leftTime = slot1.remain_sec or 0

	slot0.time_label:setString(TimeTool.GetTimeFormat(slot0.leftTime))
	slot0:openPrefertialTimer(true)
end

function ActionPreferentialWindow.openPrefertialTimer(slot0, slot1)
	if slot1 == true then
		if slot0.action_timer == nil then
			slot0.action_timer = GlobalTimeTicket:getInstance():add(function ()
				uv0.leftTime = uv0.leftTime - 1

				if uv0.leftTime < 0 then
					GlobalTimeTicket:getInstance():remove(uv0.action_timer)

					uv0.action_timer = nil
				else
					uv0.time_label:setString(TimeTool.GetTimeFormat(uv0.leftTime))
				end
			end, 1)
		end
	elseif slot0.action_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.action_timer)

		slot0.action_timer = nil
	end
end

function ActionPreferentialWindow.close_callback(slot0)
	ActionController:getInstance():getModel():updataPreferentialRedStatus(false, slot0.icon_id)
	slot0.ctrl:openPreferentialWindow(false)
	slot0:openPrefertialTimer(false)

	if slot0.update_action_preferential_event then
		GlobalEvent:getInstance():UnBind(slot0.update_action_preferential_event)

		slot0.update_action_preferential_event = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.role_bg_load then
		slot0.role_bg_load:DeleteMe()

		slot0.role_bg_load = nil
	end
end
