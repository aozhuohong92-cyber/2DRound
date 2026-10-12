GuildvoyageChooseConfirmWindow = GuildvoyageChooseConfirmWindow or BaseClass(BaseView)
slot1 = GuildvoyageController:getInstance():getModel()
slot2 = table.insert

function GuildvoyageChooseConfirmWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.is_init = false
	slot0.item_list = {}
	slot0.res_list = {}
	slot0.layout_name = "guildvoyage/guildvoyage_choose_confirm_window"
end

function GuildvoyageChooseConfirmWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("奖励选择确认"))
	slot1:getChildByName("title_1"):setString(TI18N("单倍奖励"))
	slot1:getChildByName("title_2"):setString(TI18N("双倍奖励"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.scroll_view_1 = slot1:getChildByName("scroll_view_1")

	slot0.scroll_view_1:setScrollBarEnabled(false)

	slot0.scroll_view_2 = slot1:getChildByName("scroll_view_2")

	slot0.scroll_view_2:setScrollBarEnabled(false)

	slot0.scroll_size = slot0.scroll_view_1:getContentSize()
	slot0.cancel_btn = slot1:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("单倍奖励"))

	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot0.confirm_btn_label = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(105, 31))

	slot0.confirm_btn:addChild(slot0.confirm_btn_label)
end

function GuildvoyageChooseConfirmWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:openGuildvoyageChooseConfirmWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:openGuildvoyageChooseConfirmWindow(false)
		end
	end)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended and uv0.order then
			uv1:requestSubmitVoyage(uv0.order.order_id, 0)
		end
	end)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended and uv0.order then
			uv1:requestSubmitVoyage(uv0.order.order_id, 1)
		end
	end)
end

function GuildvoyageChooseConfirmWindow.openRootWnd(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.order = slot1

	slot0:createRewardsList()
	slot0:createDoubleRewardsList()

	if slot1.config then
		slot0.confirm_btn_label:setString(string.format("<img src=%s visible=true scale=0.35 />,<div fontcolor=#ffffff fontsize=24 outline=1,#c45a14>%s %s</div>", PathTool.getItemRes(15), slot1.config.double_cost, TI18N("双倍奖励")))
	end
end

function GuildvoyageChooseConfirmWindow.createRewardsList(slot0)
	if slot0.order == nil or slot0.order.config == nil then
		return
	end

	slot1 = slot0.order
	slot3 = slot1.is_gain

	for slot7, slot8 in ipairs(slot1.config.rewards) do
		uv0({}, {
			is_gain = 2,
			bid = slot8[1],
			num = slot8[2]
		})
	end

	for slot7, slot8 in ipairs(slot1.config.rand_rewards) do
		uv0(slot2, {
			bid = slot8[1],
			num = slot8[2],
			is_gain = slot3
		})
	end

	if slot2 == nil or next(slot2) == nil then
		return
	end

	slot4 = #slot2
	slot7 = 20
	slot8 = 65
	slot9 = 0
	slot10 = nil
	slot15 = cc.size

	slot0.scroll_view_1:setInnerContainerSize(slot15(math.max(slot0.scroll_size.width, slot4 * BackPackItem.Width * 0.9 + (slot4 - 1) * 40), slot0.scroll_size.height))

	for slot15, slot16 in ipairs(slot2) do
		delayRun(slot0.scroll_view_1, 2 * slot15 / display.DEFAULT_FPS, function ()
			if uv0.bid and uv0.num then
				uv1 = BackPackItem.new(false, true, false, uv2, false, true)

				uv1:setBaseData(uv0.bid, uv0.num)

				uv3 = uv4 + (uv5 - 1) * (BackPackItem.Width * uv2 + uv6) + BackPackItem.Width * uv2 * 0.5

				uv1:setPosition(uv3, uv7)
				uv1:setDefaultTip(true)

				if uv0.is_gain == 1 then
					setChildUnEnabled(true, uv1)
				end

				uv8.scroll_view_1:addChild(uv1)
				uv9(uv8.item_list, uv1)
			end
		end)
	end
end

function GuildvoyageChooseConfirmWindow.createDoubleRewardsList(slot0)
	if slot0.order == nil or slot0.order.config == nil then
		return
	end

	slot1 = slot0.order
	slot3 = slot1.is_gain

	for slot7, slot8 in ipairs(slot1.config.rewards) do
		uv0({}, {
			is_gain = 2,
			bid = slot8[1],
			num = slot8[2] * 2
		})
	end

	for slot7, slot8 in ipairs(slot1.config.rand_rewards) do
		uv0(slot2, {
			bid = slot8[1],
			num = slot8[2] * 2,
			is_gain = slot3
		})
	end

	if slot2 == nil or next(slot2) == nil then
		return
	end

	slot4 = #slot2
	slot7 = 20
	slot8 = 65
	slot9 = 0
	slot10 = nil
	slot15 = cc.size

	slot0.scroll_view_2:setInnerContainerSize(slot15(math.max(slot0.scroll_size.width, slot4 * BackPackItem.Width * 0.9 + (slot4 - 1) * 40), slot0.scroll_size.height))

	for slot15, slot16 in ipairs(slot2) do
		delayRun(slot0.scroll_view_2, 4 * slot15 / display.DEFAULT_FPS, function ()
			if uv0.bid and uv0.num then
				uv1 = BackPackItem.new(false, true, false, uv2, false, true)

				uv1:setBaseData(uv0.bid, uv0.num)

				uv3 = uv4 + (uv5 - 1) * (BackPackItem.Width * uv2 + uv6) + BackPackItem.Width * uv2 * 0.5

				uv1:setPosition(uv3, uv7)
				uv1:setDefaultTip(true)

				if uv0.is_gain == 1 then
					setChildUnEnabled(true, uv1)
				else
					uv1:setDoubleIcon(true)
				end

				uv8.scroll_view_2:addChild(uv1)
				uv9(uv8.item_list, uv1)
			end
		end)
	end
end

function GuildvoyageChooseConfirmWindow.close_callback(slot0)
	doStopAllActions(slot0.scroll_view_1)
	doStopAllActions(slot0.scroll_view_2)

	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	uv0:openGuildvoyageChooseConfirmWindow(false)
end
