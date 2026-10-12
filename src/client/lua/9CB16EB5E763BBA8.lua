ActionOpenServerGiftWindow = ActionOpenServerGiftWindow or BaseClass(BaseView)
slot0 = string.format
slot1 = cc.size(642, 284)

function ActionOpenServerGiftWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "action/action_open_server_gift_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("aciontopenserver", "aciontopenserver"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_open_server_gift"),
			type = ResourcesType.single
		}
	}
	slot0.controller = ActionController:getInstance()
	slot0.model = ActionController:getInstance():getModel()
	slot0.open_server_charge_id = 0
end

function ActionOpenServerGiftWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.background:setPosition(360, 640)
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.time_text = slot0.main_container:getChildByName("label_time")

	slot0.time_text:setString("")

	slot0.btn_close = slot0.main_container:getChildByName("btn_close")
	slot1 = slot0.main_container:getChildByName("panel_item")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 2,
		start_x = 0,
		space_x = 0,
		row = 0,
		space_y = 0,
		col = 1,
		scale = 1,
		item_class = ActionOpenServerGiftItem,
		item_width = uv0.width,
		item_height = uv0.height
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:setClickEnabled(false)
end

function ActionOpenServerGiftWindow.openRootWnd(slot0, slot1)
	if slot1 then
		slot0.holiday_bid = slot1

		slot0.controller:cs16603(slot0.holiday_bid)
		MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.open_server_recharge, false)
	end
end

function ActionOpenServerGiftWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0.controller:openActionOpenServerGiftWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0.controller:openActionOpenServerGiftWindow(false)
	end, false, 2)

	if not slot0.update_action_open_server_event then
		slot0.update_action_open_server_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				uv0:setData(slot0)
			end
		end)
	end

	if not slot0.open_server_charge_data then
		slot0.open_server_charge_data = GlobalEvent:getInstance():Bind(ActionEvent.Is_Charge_Event, function (slot0)
			if slot0 and slot0.status and slot0.charge_id and Config.ChargeData.data_charge_data[slot0.charge_id] and slot0.status == 1 and slot0.charge_id == uv0.open_server_charge_id then
				sdkOnPay(slot1.val, 1, slot1.id, slot1.name, slot1.name)
			end
		end)
	end
end

function ActionOpenServerGiftWindow.setData(slot0, slot1)
	slot0.model:setCountDownTime(slot0.time_text, slot1.remain_sec or 0)
	table.sort(slot1.aim_list, function (slot0, slot1)
		if slot0.status == slot1.status then
			slot2 = 0
			slot3 = 0

			for slot7, slot8 in pairs(slot0.aim_args) do
				if slot8.aim_args_key == 27 then
					slot2 = slot8.aim_args_val
				end
			end

			for slot7, slot8 in pairs(slot1.aim_args) do
				if slot8.aim_args_key == 27 then
					slot3 = slot8.aim_args_val
				end
			end

			return slot2 < slot3
		else
			return slot0.status < slot1.status
		end
	end)

	if #slot1.aim_list > 3 then
		slot0.item_scrollview:setClickEnabled(true)
	end

	slot0.item_scrollview:setData(slot1.aim_list, function (slot0)
		if slot0 and slot0.charge_id and slot0.left_time > 0 then
			uv0.open_server_charge_id = slot0.charge_id

			ActionController:getInstance():sender21016(slot0.charge_id)
		end
	end)
end

function ActionOpenServerGiftWindow.close_callback(slot0)
	doStopAllActions(slot0.time_text)

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.update_action_open_server_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_action_open_server_event)

		slot0.update_action_open_server_event = nil
	end

	if slot0.open_server_charge_data ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.open_server_charge_data)

		slot0.open_server_charge_data = nil
	end
end

ActionOpenServerGiftItem = class("ActionOpenServerGiftItem", function ()
	return ccui.Layout:create()
end)

function ActionOpenServerGiftItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_open_server_gift_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setAnchorPoint(cc.p(0, 0))
	slot0:setContentSize(uv0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.label_title = slot0.main_container:getChildByName("label_title")

	slot0.label_title:setString("")

	slot0.label_item_desc = slot0.main_container:getChildByName("label_item_desc")

	slot0.label_item_desc:setString("")

	slot0.label_cost = slot0.main_container:getChildByName("label_cost")

	slot0.label_cost:setString("")

	slot0.label_limit = slot0.main_container:getChildByName("label_limit")

	slot0.label_limit:setString("")

	slot0.img_line = slot0.main_container:getChildByName("img_line")
	slot0.img_has_get = slot0.main_container:getChildByName("img_has_get")

	slot0.img_has_get:setVisible(false)

	slot0.btn_get = slot0.main_container:getChildByName("btn_get")

	slot0.btn_get:setTitleText("")
	slot0.btn_get:getTitleRenderer():enableOutline(Config.ColorData.data_color4[278], 2)

	slot0.good_cons = slot0.main_container:getChildByName("goods_con")
	slot0.cell_item_scrollview = CommonScrollViewLayout.new(slot0.good_cons, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.good_cons:getContentSize(), {
		start_y = 0,
		start_x = 5,
		space_x = 15,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.cell_item_scrollview:setSwallowTouches(false)
	slot0.cell_item_scrollview:setClickEnabled(false)

	slot0.touch_get_btn = true

	slot0:registerEvent()
end

function ActionOpenServerGiftItem.registerEvent(slot0)
	slot0.btn_get:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if not uv0.touch_get_btn then
				return
			end

			if uv0.get_item_ticket == nil then
				uv0.get_item_ticket = GlobalTimeTicket:getInstance():add(function ()
					uv0.touch_get_btn = true

					if uv0.get_item_ticket ~= nil then
						GlobalTimeTicket:getInstance():remove(uv0.get_item_ticket)

						uv0.get_item_ticket = nil
					end
				end, 2)
			end

			uv0.touch_get_btn = nil

			if uv0.call_back and uv0.data then
				uv0.call_back(uv0.data)
			end
		end
	end)
end

function ActionOpenServerGiftItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function ActionOpenServerGiftItem.getData(slot0)
	return slot0.data
end

function ActionOpenServerGiftItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.label_title:setString(slot1.aim_str)
	slot0.label_item_desc:setString(keyfind("aim_args_key", ActionExtType.ItemDesc, slot1.aim_args).aim_args_str or "")

	slot3, slot4 = nil
	slot4 = keyfind("aim_args_key", ActionExtType.RechageCurCount, slot1.aim_args).aim_args_val or 0
	slot3 = keyfind("aim_args_key", ActionExtType.RechageTotalCount, slot1.aim_args).aim_args_val or 0

	slot0.label_limit:setString(TI18N(uv0("限购：%d/%d", slot4, slot3)))

	slot0.data.left_time = slot3 - slot4
	slot7, slot8 = nil

	slot0.label_cost:setString(TI18N(uv0("%d元", keyfind("aim_args_key", ActionExtType.ActivityOldPrice, slot1.aim_args).aim_args_val or 0)))
	slot0.btn_get:setTitleText(TI18N(uv0("%d元领取", keyfind("aim_args_key", ActionExtType.ActivityCurrentPrice, slot1.aim_args).aim_args_val or 0)))

	slot0.data.charge_id = keyfind("aim_args_key", ActionExtType.ItemRechargeId, slot1.aim_args).aim_args_val or 0

	slot0:loadRewardList(slot1.item_list)
	slot0.btn_get:setVisible(slot0.data.left_time > 0)
	slot0.img_has_get:setVisible(slot0.data.left_time <= 0)
end

function ActionOpenServerGiftItem.loadRewardList(slot0, slot1)
	slot2 = {}

	if tableLen(slot1) > 0 then
		for slot6, slot7 in pairs(slot1) do
			if {} then
				slot8.bid = slot7.bid
				slot8.quantity = slot7.num

				table.insert(slot2, slot8)
			end
		end

		if #slot2 > 4 then
			slot0.cell_item_scrollview:setClickEnabled(true)
		else
			slot0.cell_item_scrollview:setPositionX((4 - slot3) * 65 - (3 - slot3) * 10)
		end

		slot0.cell_item_scrollview:setData(slot2)
		slot0.cell_item_scrollview:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.cell_item_scrollview:getItemList()) do
				slot5:setDefaultTip()
				slot5:setSwallowTouches(false)
			end
		end)
	end
end

function ActionOpenServerGiftItem.DeleteMe(slot0)
	if slot0.cell_item_scrollview then
		slot0.cell_item_scrollview:DeleteMe()

		slot0.cell_item_scrollview = nil
	end

	if slot0.get_item_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.get_item_ticket)

		slot0.get_item_ticket = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
