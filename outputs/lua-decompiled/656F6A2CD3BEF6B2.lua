ReturnActionPrivilegePanel = class("ReturnActionPrivilegePanel", function ()
	return ccui.Widget:create()
end)
slot1 = ReturnActionController:getInstance():getModel()
slot2 = Config.HolidayReturnNewData.data_constant
slot3 = Config.HolidayReturnNewData.data_gift

function ReturnActionPrivilegePanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.touch_buy_gift = nil

	slot0:configUI()
	slot0:register_event()
end

function ReturnActionPrivilegePanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("returnaction/returnaction_privilege_panel"))

	slot0.root_wnd:setPosition(-40, -81)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("load_bg")
	slot4 = "txt_cn_returnaction1"

	if uv0:getReturnActionData(slot0.holiday_bid) then
		slot4 = slot3.panel_res
	end

	if not slot0.bg_load then
		slot0.bg_load = loadSpriteTextureFromCDN(slot2, PathTool.getPlistImgForDownLoad("bigbg/returnaction", slot4, true), ResourcesType.single, slot0.bg_load)
	end

	slot1:getChildByName("Text_1"):setString(TI18N("我们准备了一些特权和奖励\n可以帮你更快地融入游戏"))
	slot1:getChildByName("Text_4"):setString(TI18N("剩余时间："))

	slot0.remain_time = slot1:getChildByName("remain_time")

	slot0.remain_time:setString("")

	slot0.goods_item = slot1:getChildByName("goods_item")

	slot0.goods_item:setScrollBarEnabled(false)

	slot0.btn_buy = slot1:getChildByName("btn_buy")

	slot0.btn_buy:setVisible(false)

	slot0.btn_buy_text = slot0.btn_buy:getChildByName("Text_6")

	slot0.btn_buy_text:setString("")

	slot0.desc_val = createRichLabel(20, cc.c4b(112, 109, 183, 255), cc.p(0, 1), cc.p(100, 480), 20, nil, 530)

	slot1:addChild(slot0.desc_val)
	slot0:setData()
	uv1:sender27900()
end

function ReturnActionPrivilegePanel.register_event(slot0)
	if not slot0.privilege_event then
		slot0.privilege_event = GlobalEvent:getInstance():Bind(ReturnActionEvent.Gift_Data_Event, function ()
			uv0:receveSetData()
		end)
	end

	registerButtonEventListener(slot0.btn_buy, function ()
		if uv0.touch_buy_gift == true then
			return
		end

		uv0.touch_buy_gift = true

		if uv1:getActionGiftStatus() == 0 then
			uv2:sender27901()

			if uv0.buy_gift_ticket == nil then
				uv0.buy_gift_ticket = GlobalTimeTicket:getInstance():add(function ()
					uv0:clearTicket()
				end, 2)
			end
		end
	end, true, 1)
end

function ReturnActionPrivilegePanel.clearTicket(slot0)
	slot0.touch_buy_gift = nil

	if slot0.buy_gift_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.buy_gift_ticket)

		slot0.buy_gift_ticket = nil
	end
end

function ReturnActionPrivilegePanel.setData(slot0)
	if not uv1[uv0:getActionPeriod()] then
		return
	end

	if uv0:getReturnActionData(slot0.holiday_bid) then
		slot0.desc_val:setString(slot2.tips)
	end

	slot0.buy_item_list = commonShowSingleRowItemList(slot0.goods_item, slot0.buy_item_list, uv1[slot1].rewards, {
		scale = 0.9,
		max_count = 4,
		is_center = true,
		space_x = 10
	})
end

function ReturnActionPrivilegePanel.receveSetData(slot0)
	setCountDownTime(slot0.remain_time, uv0:getActionGiftEndTime() - GameNet:getInstance():getTime())
	slot0.btn_buy:setVisible(true)

	if uv0:getActionGiftStatus() == 1 then
		slot0.btn_buy:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.btn_buy)
		slot0.btn_buy_text:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.btn_buy_text:setString(TI18N("已领取"))
	else
		slot0.btn_buy_text:setString(TI18N("立即领取"))
		slot0.btn_buy_text:enableOutline(cc.c4b(108, 43, 0, 255), 2)
	end

	delayRun(slot0.goods_item, 0.1, function ()
		if uv0.buy_item_list then
			for slot3, slot4 in pairs(uv0.buy_item_list) do
				if slot4 and not tolua.isnull(slot4) then
					if uv1 == 1 then
						slot4:showItemEffect(false)
					else
						slot4:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
					end
				end
			end
		end
	end)
end

function ReturnActionPrivilegePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ReturnActionPrivilegePanel.DeleteMe(slot0)
	doStopAllActions(slot0.goods_item)
	slot0:clearTicket()
	doStopAllActions(slot0.remain_time)

	if slot0.privilege_event then
		GlobalEvent:getInstance():UnBind(slot0.privilege_event)

		slot0.privilege_event = nil
	end

	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	if slot0.buy_item_list then
		for slot4, slot5 in pairs(slot0.buy_item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end

		slot0.buy_item_list = nil
	end
end
