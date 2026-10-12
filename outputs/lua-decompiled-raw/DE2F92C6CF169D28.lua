ActionGrowFundPanel = class("ActionGrowFundPanel", function ()
	return ccui.Widget:create()
end)
slot0 = string.format
slot1 = table.insert
slot2 = table.sort
slot3 = ActionController:getInstance()

function ActionGrowFundPanel.ctor(slot0, slot1, slot2)
	slot0.touch_buy_growfund = true
	slot0.holiday_bid = slot1
	slot0.type = slot2
	slot0.item_list = {}

	slot0:configUI()
	slot0:register_event()
end

function ActionGrowFundPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_grow_fund_panel"))

	slot0.root_wnd:setPosition(-40, -148)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.challenge_btn = slot0.main_container:getChildByName("challenge_btn")
	slot0.challenge_btn_label = slot0.challenge_btn:getChildByName("label")
	slot0.item = slot0.root_wnd:getChildByName("item")

	slot0.item:setVisible(false)

	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot0.empty_tips = slot0.main_container:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("label"):setString(TI18N("您已获得全部成长基金!!"))

	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.title_img = slot0.title_con:getChildByName("title_img")

	if not slot0.resources_load then
		slot0.resources_load = createResourcesLoad(PathTool.getTargetRes("bigbg/action", "txt_cn_action_grow_fund_title", false, false), ResourcesType.single, function ()
			if not tolua.isnull(uv0.title_img) then
				loadSpriteTexture(uv0.title_img, uv1, LOADTEXT_TYPE)
			end
		end)
	end
end

function ActionGrowFundPanel.register_event(slot0)
	slot0.challenge_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if Config.ChargeData.data_charge_data[101] and uv0.touch_buy_growfund == true then
				uv0.touch_buy_growfund = nil

				sdkOnPay(slot2.val, nil, slot2.id, slot2.name)

				if uv0.send_buy_growfund_ticket == nil then
					uv0.send_buy_growfund_ticket = GlobalTimeTicket:getInstance():add(function ()
						uv0.touch_buy_growfund = true

						if uv0.send_buy_growfund_ticket ~= nil then
							GlobalTimeTicket:getInstance():remove(uv0.send_buy_growfund_ticket)

							uv0.send_buy_growfund_ticket = nil
						end
					end, 2)
				end
			end
		end
	end)

	if not slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				uv0:createList(slot0)
				uv0:checkTabIconStatus()
			end
		end)
	end
end

function ActionGrowFundPanel.checkTabIconStatus(slot0, slot1)
	if SysEnv:getInstance():getBool(SysEnv.keys.grow_fund_redpoint) then
		uv0:setHolidayStatus(slot0.holiday_bid, false)

		if slot0.holiday_bid == ActionSpecialID.growfund then
			WelfareController:getInstance():setWelfareStatus(ActionSpecialID.growfund, false)
		end

		SysEnv:getInstance():set(SysEnv.keys.grow_fund_redpoint, false)
	end
end

function ActionGrowFundPanel.createList(slot0, slot1)
	if slot1 == nil or slot1.aim_list == nil then
		return
	end

	if slot0.challenge_btn_status ~= (slot1.finish == FALSE and next(slot1.aim_list) ~= nil) then
		slot0.challenge_btn_status = slot2

		if slot2 == false then
			setChildUnEnabled(true, slot0.challenge_btn)
			slot0.challenge_btn:setTouchEnabled(false)
			slot0.challenge_btn_label:disableEffect()
			slot0.challenge_btn_label:setString(TI18N("已充值"))
		else
			setChildUnEnabled(false, slot0.challenge_btn)
			slot0.challenge_btn:setTouchEnabled(true)
			slot0.challenge_btn_label:enableOutline(Config.ColorData.data_color4[277], 2)

			slot4 = 88

			if Config.ChargeData.data_charge_data[101] then
				slot4 = slot3.val
			end

			slot0.challenge_btn_label:setString(string.format(TI18N("￥%s购买"), slot4))
		end
	end

	slot3 = {}

	for slot7, slot8 in ipairs(slot1.aim_list) do
		slot8.sort_index = 0

		if slot8.status == ActionStatus.un_finish then
			slot8.sort_index = 1
		elseif slot8.status == ActionStatus.finish then
			slot8.sort_index = 0
		elseif slot8.status == ActionStatus.completed then
			slot8.sort_index = 2
		end

		slot8.challenge_btn_status = slot0.challenge_btn_status

		uv0(slot3, slot8)
	end

	if next(slot3) == nil then
		slot0.empty_tips:setVisible(true)

		if slot0.scroll_view then
			slot0.scroll_view:setVisible(false)
		end
	else
		uv1(slot3, SortTools.tableLowerSorter({
			"sort_index",
			"aim"
		}))

		if slot0.scroll_view == nil then
			slot0.scroll_view = CommonScrollViewLayout.new(slot0.goods_con, nil, , , slot0.goods_con:getContentSize(), {
				start_y = 4,
				item_width = 678,
				start_x = 8,
				space_x = 4,
				row = 0,
				item_height = 90,
				space_y = 2,
				col = 1,
				need_dynamic = true,
				item_class = ActionGrowFundItem
			})
		end

		slot0.scroll_view:setData(slot3, function (slot0)
			if slot0 and slot0.aim then
				uv0:cs16604(uv1.holiday_bid, slot0.aim, 0)
			end
		end, nil, slot0.item)
		slot0.empty_tips:setVisible(false)
		slot0.scroll_view:setVisible(true)
	end
end

function ActionGrowFundPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 and slot0.scroll_view == nil then
		ActionController:getInstance():cs16603(slot0.holiday_bid)
	end
end

function ActionGrowFundPanel.DeleteMe(slot0)
	if slot0.update_action_even_event then
		GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)

		slot0.update_action_even_event = nil
	end

	if slot0.send_buy_growfund_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.send_buy_growfund_ticket)

		slot0.send_buy_growfund_ticket = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()
	end

	slot0.resources_load = nil
end

ActionGrowFundItem = class("ActionGrowFundItem", function ()
	return ccui.Layout:create()
end)

function ActionGrowFundItem.ctor(slot0)
	slot0.is_completed = false
end

function ActionGrowFundItem.setExtendData(slot0, slot1)
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

		slot0.title_bg = slot0.root_wnd:getChildByName("title_bg")
		slot0.title = slot0.root_wnd:getChildByName("title")
		slot0.get_btn = slot0.root_wnd:getChildByName("get_btn")
		slot0.get_btn_label = slot0.get_btn:getChildByName("label")

		slot0.get_btn_label:setString(TI18N("领取"))

		slot0.item_icon_1 = slot0.root_wnd:getChildByName("item_icon_1")
		slot0.item_icon_2 = slot0.root_wnd:getChildByName("item_icon_2")
		slot0.item_value_1 = slot0.root_wnd:getChildByName("item_value_1")
		slot0.item_value_2 = slot0.root_wnd:getChildByName("item_value_2")
		slot0.pass_icon = slot0.root_wnd:getChildByName("pass_icon")

		slot0:registerEvent()
	end
end

function ActionGrowFundItem.registerEvent(slot0)
	slot0.get_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.call_back and uv0.data then
				uv0.call_back(uv0.data)
			end
		end
	end)
end

function ActionGrowFundItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function ActionGrowFundItem.setData(slot0, slot1)
	if slot1 then
		slot0.data = slot1

		slot0.title:setString(slot1.aim_str or "")
		slot0.get_btn:setVisible(slot1.status ~= ActionStatus.completed)
		slot0.pass_icon:setVisible(slot1.status == ActionStatus.completed)

		if slot1.status == ActionStatus.un_finish then
			setChildUnEnabled(true, slot0.get_btn)
			slot0.get_btn:setTouchEnabled(false)
			slot0.get_btn_label:disableEffect()
			slot0.get_btn_label:setString(TI18N("未达成"))
			slot0.title_bg:setOpacity(255)
		elseif slot1.status == ActionStatus.finish then
			if slot1.challenge_btn_status == false then
				slot0.get_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
				slot0.get_btn_label:setString(TI18N("领取"))
				setChildUnEnabled(false, slot0.get_btn)
				slot0.get_btn:setTouchEnabled(true)
			else
				slot0.get_btn_label:enableOutline(cc.c3b(51, 51, 51), 2)
				slot0.get_btn_label:setString(TI18N("未购买"))
				setChildUnEnabled(true, slot0.get_btn)
				slot0.get_btn:setTouchEnabled(false)
			end

			slot0.title_bg:setOpacity(255)
		elseif slot1.status == ActionStatus.completed then
			slot0.title_bg:setOpacity(128)
		end

		if slot1.item_list then
			for slot5, slot6 in ipairs(slot1.item_list) do
				if slot0["item_icon_" .. slot5] then
					slot0["item_icon_" .. slot5]:loadTexture(PathTool.getItemRes(slot6.bid), LOADTEXT_TYPE)
				end

				if slot0["item_value_" .. slot5] then
					slot0["item_value_" .. slot5]:setString("X" .. (slot6.num or 0))
				end
			end
		end
	end
end

function ActionGrowFundItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
