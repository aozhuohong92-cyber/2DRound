GuildVoyageOrderPanel = class("GuildVoyageOrderPanel", function ()
	return ccui.Layout:create()
end)
slot1 = GuildvoyageController:getInstance():getModel()
slot2 = BackpackController:getInstance():getModel()
slot3 = string.format
slot4 = table.insert
slot5 = table.remove
slot6 = HeroController:getInstance():getModel()
slot7 = Config.ItemData.data_get_data

function GuildVoyageOrderPanel.ctor(slot0)
	slot0:createRootWnd()
	slot0:registerNodeEvent()
end

function GuildVoyageOrderPanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guildvoyage/guildvoyage_order_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.dispatch_notice = slot0.root_wnd:getChildByName("dispatch_notice")

	slot0.dispatch_notice:setString(string.format(TI18N("可派遣英雄数:%s"), 20))

	slot0.order_desc = slot0.root_wnd:getChildByName("order_desc")

	slot0.order_desc:setString(TI18N("(每日00:00、12:00自动补充订单)"))

	slot0.item = slot0.root_wnd:getChildByName("item")

	slot0.item:setVisible(false)

	slot0.empty_tips = slot0.root_wnd:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("desc"):setString(TI18N("暂无任何订单!"))

	slot0.list_container = slot0.root_wnd:getChildByName("list_container")
	slot0.refresh_btn = slot0.root_wnd:getChildByName("refresh_btn")
	slot0.refresh_btn_label = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(105, 31))

	slot0.refresh_btn:addChild(slot0.refresh_btn_label)

	slot0.log_container = slot0.root_wnd:getChildByName("log_container")
	slot0.notice_log_label = createRichLabel(22, 188, cc.p(0, 1), cc.p(10, 60), nil, , 600)

	slot0.log_container:addChild(slot0.notice_log_label)

	slot0.left_times = slot0.root_wnd:getChildByName("left_times")

	slot0.left_times:setString("今日护送次数:10/10")
end

function GuildVoyageOrderPanel.registerNodeEvent(slot0)
	slot0.refresh_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:requestRefresh()
		end
	end)
	slot0.log_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openGuildVoyageLogWindow()
		end
	end)
end

function GuildVoyageOrderPanel.addToParent(slot0, slot1)
	slot0:setVisible(slot1)
	slot0:registerEvent(slot1)

	if slot1 == true then
		if slot0.scroll_view == nil then
			if uv0:acceptList() == nil or next(slot2) == nil then
				uv1:requestOrderList()
			else
				slot0:updateOrderList(slot2)
			end
		end

		slot0:setLog()
		slot0:escortDailyLeftTimes()
	end
end

function GuildVoyageOrderPanel.registerEvent(slot0, slot1)
	if slot1 == true then
		if slot0.init_list_event == nil then
			slot0.init_list_event = GlobalEvent:getInstance():Bind(GuildvoyageEvent.UpdateGuildvoyageOrderListEvent, function ()
				uv1:updateOrderList(uv0:acceptList())
			end)
		end

		if slot0.update_near_log_info_event == nil then
			slot0.update_near_log_info_event = GlobalEvent:getInstance():Bind(GuildvoyageEvent.UpdateNearLogInfoEvent, function ()
				uv0:setLog()
			end)
		end

		if slot0.update_escort_daily_times == nil then
			slot0.update_escort_daily_times = GlobalEvent:getInstance():Bind(GuildvoyageEvent.UpdateDailyEscortTimes, function (slot0)
				uv0:escortDailyLeftTimes()
			end)
		end
	else
		if slot0.update_near_log_info_event ~= nil then
			GlobalEvent:getInstance():UnBind(slot0.init_list_event)

			slot0.init_list_event = nil
		end

		if slot0.update_near_log_info_event ~= nil then
			GlobalEvent:getInstance():UnBind(slot0.update_near_log_info_event)

			slot0.update_near_log_info_event = nil
		end

		if slot0.update_escort_daily_times ~= nil then
			GlobalEvent:getInstance():UnBind(slot0.update_escort_daily_times)

			slot0.update_escort_daily_times = nil
		end
	end
end

function GuildVoyageOrderPanel.escortDailyLeftTimes(slot0)
	if Config.GuildShippingData.data_const.receive_limit then
		if slot2.val - uv0:getDailyTimes() < 0 then
			slot1 = 0
		end

		slot0.left_times:setString(uv1("今日护送次数:%s/%s", slot1, slot2.val))
	end
end

function GuildVoyageOrderPanel.updateOrderList(slot0, slot1)
	if slot1 == nil then
		return
	end

	if next(slot1) == nil then
		if slot0.scroll_view then
			slot0.scroll_view:setVisible(false)
		end

		if slot0.empty_tips then
			slot0.empty_tips:setVisible(true)
		end
	else
		if slot0.scroll_view == nil then
			slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_container, nil, , , slot0.list_container:getContentSize(), {
				start_y = 7,
				item_width = 594,
				start_x = 7,
				space_x = 0,
				row = 0,
				item_height = 197,
				space_y = 2,
				col = 1,
				need_dynamic = true,
				item_class = GuildVoyageOrderItem
			})
		end

		slot0.scroll_view:setData(slot1, nil, , slot0.item)
		slot0.scroll_view:setVisible(true)

		if slot0.empty_tips then
			slot0.empty_tips:setVisible(false)
		end
	end

	if tableLen(uv0:getHeroList()) - uv1:getEscortPartnerSum() < 0 then
		slot5 = 0
	end

	slot0.dispatch_notice:setString(string.format(TI18N("可派遣英雄数:%s"), slot5))
	slot0:setRefreshCost()
end

function GuildVoyageOrderPanel.setRefreshCost(slot0)
	if uv0:getRefreshTimes() == nil then
		slot1 = 0
	end

	if Config.GuildShippingData.data_refresh[slot1 + 1] == nil then
		slot0.refresh_btn_label:setString(TI18N("今日刷次次数已满"))
	elseif slot3.loss_fee and slot3.loss_fee[1] then
		if slot3.loss_fee[1] == nil or #slot4 < 2 then
			return
		end

		if Config.ItemData.data_get_data(slot4[1]) then
			slot0.refresh_btn_label:setString(string.format("<img src=%s visible=true scale=0.35 />,<div fontcolor=#ffffff fontsize=24 outline=1,#c45a14>%s %s</div>", PathTool.getItemRes(slot5.icon), slot4[2], TI18N("刷新订单")))
		end
	end
end

function GuildVoyageOrderPanel.setLog(slot0)
	if uv0:getNearLogInfo().order_bid ~= 0 and Config.GuildShippingData.data_order(slot1.order_bid) then
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

function GuildVoyageOrderPanel.DeleteMe(slot0)
	slot0:registerEvent(false)

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end

GuildVoyageOrderItem = class("GuildVoyageOrderItem", function ()
	return ccui.Layout:create()
end)

function GuildVoyageOrderItem.ctor(slot0)
	slot0.item_list = {}
	slot0.item_pool_list = {}
	slot0.is_completed = false
end

function GuildVoyageOrderItem.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot0.is_completed = true
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0:addChild(slot0.root_wnd)

		slot0.quality_img = slot0.root_wnd:getChildByName("quality_img")
		slot0.order_name = slot0.root_wnd:getChildByName("order_name")
		slot0.order_time = slot0.root_wnd:getChildByName("order_time")
		slot0.item_status = slot0.root_wnd:getChildByName("item_status")
		slot0.confirm_btn = slot0.root_wnd:getChildByName("confirm_btn")

		slot0.confirm_btn:getChildByName("label"):setString(TI18N("接取"))
		slot0.root_wnd:getChildByName("rewards_title_1"):setString(TI18N("固定奖励"))

		slot3 = slot0.root_wnd:getChildByName("rewards_title_2")

		slot3:setString(TI18N("概率奖励"))

		slot0.init_radio = slot0.root_wnd:getChildByName("init_radio")

		slot0.init_radio:setPositionX(slot3:getPositionX() + slot3:getContentSize().width + 2)
		slot0:setTouchEnabled(true)
		slot0:setSwallowTouches(false)
		slot0:registerEvent()
	end
end

function GuildVoyageOrderItem.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.data then
					uv1:openGuildvoyageOrderEscortWindow(true, GuildvoyageConst.escort_type.prepare, uv0.data.order_id)
				end
			end
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		end
	end)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended and uv0.data then
			playButtonSound2()

			if uv0.data then
				uv1:openGuildvoyageOrderEscortWindow(true, GuildvoyageConst.escort_type.prepare, uv0.data.order_id)
			end
		end
	end)

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 == BackPackConst.Bag_Code.BACKPACK and uv0.data and Config.GuildShippingData.data_consume[uv0.data.loss_id or 0] and slot2.loss then
				for slot6, slot7 in ipairs(slot2.loss) do
					for slot12, slot13 in pairs(slot1) do
						if slot13 and slot13.base_id == slot7[1] then
							uv0:updateInfo()
						end
					end
				end
			end
		end)
	end

	if not slot0.modify_goods_event then
		slot0.modify_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 and slot0 == BackPackConst.Bag_Code.BACKPACK and uv0.data and Config.GuildShippingData.data_consume[uv0.data.loss_id or 0] and slot2.loss then
				for slot6, slot7 in ipairs(slot2.loss) do
					for slot12, slot13 in pairs(slot1) do
						if slot13 and slot13.base_id == slot7[1] then
							uv0:updateInfo()
						end
					end
				end
			end
		end)
	end
end

function GuildVoyageOrderItem.setData(slot0, slot1)
	if slot0.is_completed == false then
		return
	end

	if slot1 == nil or slot1.config == nil then
		return
	end

	slot0.data = slot1

	slot0:updateInfo()
end

function GuildVoyageOrderItem.updateInfo(slot0)
	if slot0.data == nil then
		return
	end

	if slot0.quality ~= slot0.data.config.quality then
		slot0.quality = slot1.config.quality

		slot0.quality_img:loadTexture(PathTool.getResFrame("guildvoyage", "guildvoyage_100" .. slot0.quality), LOADTEXT_TYPE_PLIST)
	end

	slot0.order_name:setString(slot1.config.name)
	slot0.order_time:setString(TimeTool.GetTimeFormat(slot1.config.time))
	slot0.init_radio:setString(uv0(TI18N("(初始%s%s)"), slot1.config.rate * 0.1, "%"))

	slot3 = slot1.loss_id or 0
	slot3 = true

	if Config.GuildShippingData.data_consume[slot3] and slot2.loss then
		for slot7, slot8 in ipairs(slot2.loss) do
			if uv1:getBackPackItemNumByBid(slot8[1]) < slot8[2] then
				slot3 = false

				break
			end
		end
	end

	if slot3 == true then
		slot0.item_status:setString(TI18N("宝物充足"))
		slot0.item_status:setTextColor(Config.ColorData.data_color4[178])
	else
		slot0.item_status:setString(TI18N("宝物不足"))
		slot0.item_status:setTextColor(Config.ColorData.data_color4[183])
	end

	for slot7, slot8 in ipairs(slot0.item_list) do
		slot8:setVisible(false)
		uv2(slot0.item_pool_list, slot8)
	end

	slot0.item_list = {}

	slot0:createRewardsList(slot1.config.rewards)
	slot0:createRandRewardsList(slot1.config.rand_rewards)
end

function GuildVoyageOrderItem.createRewardsList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot2 = nil
	slot3 = 0.65
	slot4 = 6
	slot5 = 0
	slot6 = 53

	for slot10, slot11 in ipairs(slot1) do
		if #slot0.item_pool_list == 0 then
			slot0.root_wnd:addChild(BackPackItem.new(false, true, false, slot3, false))
		else
			uv0(slot0.item_pool_list, 1):setVisible(true)
		end

		slot2:setPosition(25 + (slot10 - 1) * (BackPackItem.Width * slot3 + slot4) + BackPackItem.Width * slot3 * 0.5, slot6)
		slot2:setBaseData(slot11[1], slot11[2])
		slot2:setDefaultTip(true)
		slot2:setVisible(true)
		uv1(slot0.item_list, slot2)
	end
end

function GuildVoyageOrderItem.createRandRewardsList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot2 = nil
	slot3 = 0.65
	slot4 = 6
	slot5 = 0
	slot6 = 53

	for slot10, slot11 in ipairs(slot1) do
		if #slot0.item_pool_list == 0 then
			slot0.root_wnd:addChild(BackPackItem.new(false, true, false, slot3, false))
		else
			slot2 = uv0(slot0.item_pool_list, 1)
		end

		slot2:setPosition(213 + (slot10 - 1) * (BackPackItem.Width * slot3 + slot4) + BackPackItem.Width * slot3 * 0.5, slot6)
		slot2:setBaseData(slot11[1], slot11[2])
		slot2:setDefaultTip(true, true)
		slot2:setVisible(true)
		uv1(slot0.item_list, slot2)
	end
end

function GuildVoyageOrderItem.suspendAllActions(slot0)
end

function GuildVoyageOrderItem.DeleteMe(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	if slot0.modify_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.modify_goods_event)

		slot0.modify_goods_event = nil
	end

	if slot0.add_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.add_goods_event)

		slot0.add_goods_event = nil
	end

	slot0.item_list = nil

	for slot4, slot5 in ipairs(slot0.item_pool_list) do
		slot5:DeleteMe()
	end

	slot0.item_pool_list = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
