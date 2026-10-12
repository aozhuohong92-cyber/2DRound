GuildVoyageInteractionPanel = class("GuildVoyageInteractionPanel", function ()
	return ccui.Layout:create()
end)
slot0 = GuildvoyageController:getInstance()
slot1 = string.format

function GuildVoyageInteractionPanel.ctor(slot0)
	slot0:createRootWnd()
	slot0:registerEvent()
end

function GuildVoyageInteractionPanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guildvoyage/guildvoyage_interaction_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.interaction_notice = slot0.root_wnd:getChildByName("interaction_notice")

	slot0.interaction_notice:setString(string.format(TI18N("还可以帮助加速 %s 次"), 10))

	slot0.item = slot0.root_wnd:getChildByName("item")

	slot0.item:setVisible(false)

	slot0.empty_tips = slot0.root_wnd:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("desc"):setString(TI18N("当前没有可互助加速的订单!"))

	slot0.list_container = slot0.root_wnd:getChildByName("list_container")
end

function GuildVoyageInteractionPanel.registerEvent(slot0)
	if slot0.update_interaction_event == nil then
		slot0.update_interaction_event = GlobalEvent:getInstance():Bind(GuildvoyageEvent.UpdateGuildVoyageInteractionEvent, function (slot0, slot1)
			uv0:showInteractionCount(slot0)
			uv0:createScrollView(slot1)
		end)
	end

	if slot0.remove_interaction_event == nil then
		slot0.remove_interaction_event = GlobalEvent:getInstance():Bind(GuildvoyageEvent.RemoveGuildVoyageInteractionEvent, function (slot0, slot1)
			uv0:showInteractionCount(slot1)
			uv0:changeInteractionStatus(slot0)
		end)
	end
end

function GuildVoyageInteractionPanel.showInteractionCount(slot0, slot1)
	slot3 = 0

	if Config.GuildShippingData.data_const.help_limit then
		slot3 = slot2.val - (slot1 or 0)
	end

	if slot3 < 0 then
		slot3 = 0
	end

	slot0.interaction_count = slot3

	slot0.interaction_notice:setString(string.format(TI18N("还可以帮助加速 %s 次"), slot3))
end

function GuildVoyageInteractionPanel.createScrollView(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		if slot0.scroll_view then
			slot0.scroll_view:setVisible(false)
		end

		slot0.empty_tips:setVisible(true)
	else
		slot0.empty_tips:setVisible(false)

		if slot0.scroll_view == nil then
			slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.list_container:getContentSize(), {
				start_y = 4,
				item_width = 600,
				start_x = 4,
				space_x = 0,
				row = 0,
				item_height = 135,
				space_y = 2,
				col = 1,
				item_class = GuildVoyageInteractionItem
			}, cc.p(0, 0))
		end

		slot0.scroll_view:setData(slot1, function (slot0)
			if slot0 then
				uv0.selected_item = slot0

				if slot0.data then
					uv1:requestHelpMemberOrder(slot1.rid, slot1.srv_id, slot1.order_id)
				end
			end
		end, nil, {
			node = slot0.item,
			count = slot0.interaction_count
		})
	end
end

function GuildVoyageInteractionPanel.changeInteractionStatus(slot0, slot1)
	if slot0.selected_item == nil or slot1 == nil then
		return
	end

	slot2 = slot0.selected_item.data

	if getNorKey(slot1.rid, slot1.srv_id, slot1.order_id) == getNorKey(slot2.rid, slot2.srv_id, slot2.order_id) then
		slot0.selected_item:updateOrderStatus(slot1)
	end
end

function GuildVoyageInteractionPanel.addToParent(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 == true then
		if slot0.scroll_view == nil then
			uv0:requestInteractionList()
		end

		if slot0.time_ticket == nil then
			slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0:setTimeTicket()
			end, 1)
		end
	else
		slot0:clearTimeTicket()
	end
end

function GuildVoyageInteractionPanel.setTimeTicket(slot0)
	if slot0.scroll_view then
		for slot5, slot6 in pairs(slot0.scroll_view:getItemList()) do
			slot6:setEndTime()
		end
	end
end

function GuildVoyageInteractionPanel.clearTimeTicket(slot0)
	if slot0.time_ticket then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function GuildVoyageInteractionPanel.DeleteMe(slot0)
	slot0:clearTimeTicket()

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	if slot0.update_interaction_event then
		GlobalEvent:getInstance():UnBind(slot0.update_interaction_event)

		slot0.update_interaction_event = nil
	end

	if slot0.remove_interaction_event then
		GlobalEvent:getInstance():UnBind(slot0.remove_interaction_event)

		slot0.remove_interaction_event = nil
	end
end

GuildVoyageInteractionItem = class("GuildVoyageInteractionItem", function ()
	return ccui.Layout:create()
end)

function GuildVoyageInteractionItem.ctor(slot0)
	slot0.item_list = {}
	slot0.interaction_count = 0
	slot0.btn_status = 0
end

function GuildVoyageInteractionItem.setExtendData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.interaction_count = slot1.count

	if not tolua.isnull(slot1.node) and slot0.root_wnd == nil then
		slot0.is_completed = true
		slot3 = slot2:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot3)

		slot0.root_wnd = slot2:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot3.width * 0.5, slot3.height * 0.5)
		slot0:addChild(slot0.root_wnd)

		slot0.handle_status = slot0.root_wnd:getChildByName("handle_status")
		slot0.handle_btn = slot0.root_wnd:getChildByName("handle_btn")
		slot0.handle_btn_label = slot0.handle_btn:getChildByName("label")

		slot0.handle_btn_label:setString(TI18N("帮助加速"))

		slot0.role_name = slot0.root_wnd:getChildByName("role_name")
		slot0.order_name = slot0.root_wnd:getChildByName("order_name")
		slot0.order_time = slot0.root_wnd:getChildByName("order_time")
		slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

		slot0.role_head:setPosition(70, 68)
		slot0.root_wnd:addChild(slot0.role_head)
		slot0.role_head:setLev(99)
		slot0:setTouchEnabled(true)
		slot0:setSwallowTouches(false)
		slot0:registerEvent()
	end
end

function GuildVoyageInteractionItem.registerEvent(slot0)
	slot0.handle_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.call_back then
				uv0:call_back()
			end
		end
	end)
end

function GuildVoyageInteractionItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function GuildVoyageInteractionItem.setData(slot0, slot1)
	if slot1 then
		slot0.data = slot1

		slot0.role_head:setLev(slot1.lev)
		slot0.role_head:setHeadRes(slot1.face_id)
		slot0.role_name:setString(slot1.name)

		if Config.GuildShippingData.data_order(slot1.order_bid) ~= nil then
			slot0.order_name:setString(slot2.name)
		end

		slot0:setEndTime()
		slot0:updateInteractionCount()
	end
end

function GuildVoyageInteractionItem.updateInteractionCount(slot0, slot1)
	slot0.updateInteractionCount = slot1 or slot0.updateInteractionCount
	slot2 = 0

	if slot0.btn_status ~= (slot0.interaction_count == 0 and 1 or 0) then
		slot0.btn_status = slot2

		if slot0.btn_status == 0 then
			setChildUnEnabled(false, slot0.handle_btn)
			slot0.handle_btn:setTouchEnabled(true)
			slot0.request_btn_label:enableOutline(Config.ColorData.data_color4[177])
			slot0.handle_btn_label:setString(TI18N("帮助加速"))
		else
			setChildUnEnabled(true, slot0.handle_btn)
			slot0.handle_btn:setTouchEnabled(false)
			slot0.handle_btn_label:disableEffect()
			slot0.handle_btn_label:setString(TI18N("次数不足"))
		end
	end
end

function GuildVoyageInteractionItem.setEndTime(slot0)
	if slot0.data == nil then
		return
	end

	if slot0.data.end_time - GameNet:getInstance():getTime() < 0 then
		slot0.order_time:setString(TI18N("订单已完成"))
	else
		slot0.order_time:setString(uv0("%s:%s", TI18N("剩余时间"), TimeTool.GetTimeFormat(slot1)))
	end
end

function GuildVoyageInteractionItem.updateOrderStatus(slot0, slot1)
	if slot1 then
		slot0.data.end_time = slot1.end_time
		slot0.data.status = slot1.status

		slot0.handle_btn:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.handle_btn)
		slot0.handle_btn_label:disableEffect()
		slot0.handle_btn_label:setString(TI18N("已加速"))
	end
end

function GuildVoyageInteractionItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
