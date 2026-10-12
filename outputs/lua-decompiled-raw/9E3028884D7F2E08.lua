GuildVoyageLogWindow = GuildVoyageLogWindow or BaseClass(BaseView)
slot0 = table.insert
slot1 = GuildvoyageController:getInstance()
slot2 = string.format
slot3 = Config.ItemData.data_get_data
slot4 = Config.GuildShippingData.data_order

function GuildVoyageLogWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "guildvoyage/guildvoyage_log_window"
end

function GuildVoyageLogWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot1:getChildByName("win_title"):setString(TI18N("日志"))

	slot0.list_view = slot1:getChildByName("list_view")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.finish_btn = slot1:getChildByName("finish_btn")

	slot0.finish_btn:getChildByName("label"):setString(TI18N("确定"))

	slot0.empty_tips = slot1:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("desc"):setString(TI18N("暂无日志记录!"))
end

function GuildVoyageLogWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openGuildVoyageLogWindow(false)
		end
	end)
	slot0.finish_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openGuildVoyageLogWindow(false)
		end
	end)

	if slot0.update_log_list_event == nil then
		slot0.update_log_list_event = GlobalEvent:getInstance():Bind(GuildvoyageEvent.UpdateLogListEvent, function (slot0)
			uv0:setDataList(slot0)
		end)
	end
end

function GuildVoyageLogWindow.openRootWnd(slot0)
	uv0:requestLogList()
end

function GuildVoyageLogWindow.setDataList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		if slot0.scroll_view then
			slot0.scroll_view:setVisible(false)
		end

		if slot0.empty_tips then
			slot0.empty_tips:setVisible(true)
		end
	else
		if slot0.scroll_view == nil then
			slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_view, nil, , , slot0.list_view:getContentSize(), {
				start_y = 7,
				item_width = 520,
				start_x = 10,
				space_x = 0,
				row = 0,
				item_height = 50,
				space_y = 20,
				col = 1,
				need_dynamic = true,
				item_class = GuildVoyageLogItem
			})
		end

		slot0.scroll_view:setData(slot1)
		slot0.scroll_view:setVisible(true)

		if slot0.empty_tips then
			slot0.empty_tips:setVisible(false)
		end
	end
end

function GuildVoyageLogWindow.close_callback(slot0)
	if slot0.update_log_list_event then
		GlobalEvent:getInstance():UnBind(slot0.update_log_list_event)

		slot0.update_log_list_event = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	uv0:openGuildVoyageLogWindow(false)
end

GuildVoyageLogItem = class("GuildVoyageLogItem", function ()
	return ccui.Layout:create()
end)

function GuildVoyageLogItem.ctor(slot0)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(cc.size(540, 50))

	slot0.notice_log_label = createRichLabel(22, 175, cc.p(0, 1), cc.p(10, 50), nil, , 540)

	slot0:addChild(slot0.notice_log_label)
end

function GuildVoyageLogItem.registerEvent(slot0)
end

function GuildVoyageLogItem.setData(slot0, slot1)
	if slot1 and slot1.order_bid ~= 0 and uv0(slot1.order_bid) then
		if BackPackConst.quality_color_id[slot2.quality] == nil then
			slot4 = 1
		end

		slot5 = TimeTool.getMDHM(slot1.endtime)
		slot6 = slot2.name
		slot7 = ""

		if slot2.show_rewards and slot8[1] then
			for slot12, slot13 in ipairs(slot8[1]) do
				if type(slot13) == "number" then
					slot15 = 1

					if uv1(slot13) then
						slot15 = BackPackConst.quality_color_id[slot14.quality]

						if slot7 ~= "" then
							slot7 = slot7 .. ","
						end

						slot7 = uv2("%s<div fontcolor=%s>%s</div>", slot7, tranformC3bTostr(slot15), slot14.name)
					end
				end
			end
		end

		slot0.notice_log_label:setString(uv2(TI18N("%s 会友<div fontcolor=#249003>%s</div>接取了<div fontcolor=%s>%s</div>远航护送订单,他将获得%s等奖励"), slot5, slot1.name, tranformC3bTostr(slot4), slot6, slot7))
	end
end

function GuildVoyageLogItem.suspendAllActions(slot0)
end

function GuildVoyageLogItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
