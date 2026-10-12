GuildvoyageDonateWindow = GuildvoyageDonateWindow or BaseClass(BaseView)
slot1 = GuildvoyageController:getInstance():getModel()
slot2 = BackpackController:getInstance():getModel()
slot3 = table.insert

function GuildvoyageDonateWindow.__init(slot0)
	slot0.order_type = type
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.is_init = false
	slot0.layout_name = "guildvoyage/guildvoyage_donate_window"
	slot0.item_list = {}
end

function GuildvoyageDonateWindow.open_callback(slot0)
	slot0.root_wnd:getChildByName("background"):setScale(display.getMaxScale())

	slot2 = slot0.root_wnd:getChildByName("container")

	slot2:getChildByName("win_title"):setString(TI18N("提示"))
	slot2:getChildByName("donate_title"):setString(TI18N("捐献以下物品:"))
	slot2:getChildByName("rewards_title"):setString(TI18N("可得奖励:"))

	slot0.container_size = slot2:getContentSize()
	slot0.confirm_btn = slot2:getChildByName("confirm_btn")

	slot0.confirm_btn:getChildByName("label"):setString(TI18N("确认捐献"))

	slot0.need_item = BackPackItem.new(false, true, false, 1, false, true)

	slot0.need_item:setPosition(slot0.container_size.width * 0.5, 350)
	slot2:addChild(slot0.need_item)

	slot0.addbtn = createButton(slot2, "", slot0.container_size.width * 0.5, 350, cc.size(70, 70), PathTool.getResFrame("common", "common_90026"), 24, Config.ColorData.data_color4[1])

	slot0.addbtn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and uv0.item_bid then
			BackpackController:getInstance():openTipsSource(true, uv0.item_bid)
		end
	end)

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.container = slot2
end

function GuildvoyageDonateWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:openGuildvoyageDonateWindow(false)
		end
	end)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			uv0:requestDonateTreasure(uv1.rid, uv1.srv_id, uv1.order_id, uv1.item_bid)
		end
	end)
end

function GuildvoyageDonateWindow.openRootWnd(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.need_item:setBaseData(slot4)
	slot0.need_item:setNeedNum(slot5, uv0:getBackPackItemNumByBid(slot4))

	slot0.rid = slot1
	slot0.srv_id = slot2
	slot0.order_id = slot3
	slot0.item_bid = slot4

	if Config.GuildShippingData.data_donate_reward[slot4] and slot7.assist_rewards then
		slot0:createRandRewardsList(slot7.assist_rewards, slot5)
	end
end

function GuildvoyageDonateWindow.createRandRewardsList(slot0, slot1, slot2)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot3 = #slot1
	slot7 = nil

	for slot11, slot12 in ipairs(slot1) do
		if slot12[1] and slot12[2] then
			slot7 = BackPackItem.new(false, true, false, 1, false, true)

			slot7:setBaseData(slot12[1], slot12[2] * slot2)
			slot7:setPosition((slot0.container_size.width - (slot3 * BackPackItem.Width + (slot3 - 1) * 10)) / 2 + (slot11 - 1) * (BackPackItem.Width + slot4) + BackPackItem.Width * 0.5, 178)
			slot0.container:addChild(slot7)
			uv0(slot0.item_list, slot7)
		end
	end
end

function GuildvoyageDonateWindow.close_callback(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	uv0:openGuildvoyageDonateWindow(false)
end
