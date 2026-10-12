PrivilegePanel = class("PrivilegePanel", function ()
	return ccui.Widget:create()
end)
slot1 = VipController:getInstance():getModel()

function PrivilegePanel.ctor(slot0)
	slot0.privilege_charge_id = 0

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
	slot0:setData()
	uv0:setPrivilegeOpenFlag(true)
end

function PrivilegePanel.config(slot0)
	slot0.size = cc.size(673, 661)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0, 0))

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("vip/privilege_panel"))

	slot0.root_wnd:setPosition(-6.5, -8.5)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
end

function PrivilegePanel.registerEvents(slot0)
	if slot0.update_privilege == nil then
		slot0.update_privilege = GlobalEvent:getInstance():Bind(VipEvent.PRIVILEGE_INFO, function ()
			uv0:setData()
		end)
	end

	if slot0.privilege_charge_data == nil then
		slot0.privilege_charge_data = GlobalEvent:getInstance():Bind(ActionEvent.Is_Charge_Event, function (slot0)
			if slot0 and slot0.status and slot0.charge_id and Config.ChargeData.data_charge_data[slot0.charge_id] and slot0.status == 1 and slot0.charge_id == uv0.privilege_charge_id then
				sdkOnPay(slot1.val, 1, slot1.id, slot1.name, slot1.name)
			end
		end)
	end
end

function PrivilegePanel.layoutUI(slot0)
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot1 = slot0.main_container:getChildByName("scrollCon")
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 636,
		item_height = 177,
		space_y = -5,
		col = 1,
		need_dynamic = true
	})

	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function PrivilegePanel.createNewCell(slot0, slot1, slot2)
	slot3 = PrivilegeItem.new(1, true)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function PrivilegePanel.numberOfCells(slot0)
	return #slot0.show_list
end

function PrivilegePanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	slot1:setData(slot0.show_list[slot2])
end

function PrivilegePanel.onCellTouched(slot0, slot1)
	if slot1 then
		slot0.privilege_charge_id = slot1:getData().charge_id or 0
	end
end

function PrivilegePanel.setData(slot0)
	slot0.show_list = {}

	for slot5, slot6 in pairs(Config.PrivilegeData.data_privilege_data) do
		if not slot6.limit_lev or slot6.limit_lev <= RoleController:getInstance():getRoleVo().lev then
			table.insert(slot0.show_list, slot6)
		end
	end

	table.sort(slot0.show_list, SortTools.KeyLowerSorter("sort_id"))
	slot0.item_scrollview:reloadData()
end

function PrivilegePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function PrivilegePanel.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.update_privilege then
		GlobalEvent:getInstance():UnBind(slot0.update_privilege)

		slot0.update_privilege = nil
	end

	if slot0.privilege_charge_data ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.privilege_charge_data)

		slot0.privilege_charge_data = nil
	end
end

PrivilegeItem = class("PrivilegeItem", function ()
	return ccui.Widget:create()
end)

function PrivilegeItem.ctor(slot0)
	slot0.touch_buy_privilege = true

	slot0:configUI()
	slot0:register_event()
end

function PrivilegeItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("vip/privilege_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(636, 177))
	slot0:setAnchorPoint(0, 0)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.image_title = slot0.container:getChildByName("image_title")
	slot0.title_txt = slot0.container:getChildByName("title_txt")
	slot0.limit_txt = slot0.container:getChildByName("limit_txt")
	slot0.image_icon = slot0.container:getChildByName("image_icon")

	slot0.image_icon:ignoreContentAdaptWithSize(true)

	slot0.image_sell_out = slot0.container:getChildByName("image_sell_out")

	slot0.image_sell_out:setVisible(false)

	slot0.buy_btn = slot0.container:getChildByName("buy_btn")
	slot1 = slot0.buy_btn:getContentSize()
	slot0.buy_btn_label = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(slot1.width / 2, slot1.height / 2))

	slot0.buy_btn:addChild(slot0.buy_btn_label)

	slot0.desc_txt = createRichLabel(20, Config.ColorData.data_color3[175], cc.p(0.5, 1), cc.p(354, 160), 5, nil, 350)

	slot0.container:addChild(slot0.desc_txt)

	slot2 = slot0.container:getChildByName("good_list")
	slot3 = slot2:getContentSize()
	slot0.good_scrollview = createScrollView(slot3.width, slot3.height, 0, 0, slot2, ScrollViewDir.horizontal)
end

function PrivilegeItem.register_event(slot0)
	registerButtonEventListener(slot0.buy_btn, handler(slot0, slot0._onClickBuyBtn), true)
end

function PrivilegeItem._onClickBuyBtn(slot0)
	if slot0.privilege_cfg then
		if slot0.privilege_cfg.pay_type == 1 then
			if not slot0.touch_buy_privilege then
				return
			end

			if slot0.buy_privilege_ticket == nil then
				slot0.buy_privilege_ticket = GlobalTimeTicket:getInstance():add(function ()
					uv0.touch_buy_privilege = true

					if uv0.buy_privilege_ticket ~= nil then
						GlobalTimeTicket:getInstance():remove(uv0.buy_privilege_ticket)

						uv0.buy_privilege_ticket = nil
					end
				end, 2)
			end

			slot0.touch_buy_privilege = nil

			if Config.ChargeData.data_charge_data[slot0.privilege_cfg.charge_id or 0] then
				if slot0.callback then
					slot0:callback()
				end

				ActionController:getInstance():sender21016(slot2.id)
			end
		elseif slot0.privilege_cfg.pay_type == 2 then
			uv0:sender24501(slot0.privilege_cfg.id)
		end
	end
end

function PrivilegeItem.getData(slot0)
	return slot0.privilege_cfg
end

function PrivilegeItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function PrivilegeItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.privilege_cfg = slot1
	slot2 = uv0:getPrivilegeDataById(slot1.id) or {
		status = 0,
		expire_time = 0
	}

	if slot0.privilege_cfg.title_type == 1 then
		slot0.image_title:loadTexture(PathTool.getResFrame("vip", "vip_image_1"), LOADTEXT_TYPE_PLIST)
	elseif slot0.privilege_cfg.title_type == 2 then
		slot0.image_title:loadTexture(PathTool.getResFrame("vip", "vip_image_3"), LOADTEXT_TYPE_PLIST)
	elseif slot0.privilege_cfg.title_type == 3 then
		slot0.image_title:loadTexture(PathTool.getResFrame("vip", "vip_image_7"), LOADTEXT_TYPE_PLIST)
	end

	slot0.title_txt:setString(slot0.privilege_cfg.name or "")

	if slot0.privilege_cfg.icon_id then
		slot0.image_icon:loadTexture(PathTool.getResFrame("vip", "vip_icon" .. slot0.privilege_cfg.icon_id), LOADTEXT_TYPE_PLIST)
	end

	slot0.desc_txt:setString(slot0.privilege_cfg.desc or "")

	slot3 = RoleController:getInstance():getRoleVo()

	if Config.PrivilegeData.data_privilege_award[slot1.id] then
		slot5 = {}

		for slot9, slot10 in pairs(slot4) do
			if slot10.min <= slot3.lev and slot3.lev <= slot10.max then
				slot5 = slot10.reward

				break
			end
		end

		slot0.item_list = commonShowSingleRowItemList(slot0.good_scrollview, slot0.item_list, slot5, {
			scale = 0.7,
			max_count = 3,
			is_center = true,
			space_x = 10
		})
	end

	if slot0.privilege_cfg.limit_type == 0 then
		slot0.limit_txt:setString(TI18N("永久限购"))
	elseif slot0.privilege_cfg.limit_day < 2 then
		slot0.limit_txt:setString(TI18N("每日限购"))
	elseif slot0.privilege_cfg.limit_day < 8 then
		slot0.limit_txt:setString(TI18N("每周限购"))
	elseif slot0.privilege_cfg.limit_day < 32 then
		slot0.limit_txt:setString(TI18N("每月限购"))
	end

	if slot2.status == TRUE then
		if slot0.privilege_cfg.limit_type == 0 then
			slot0.image_sell_out:setVisible(true)
			slot0.buy_btn:setVisible(false)

			if slot0.left_day_txt then
				slot0.left_day_txt:setVisible(false)
			end
		else
			slot0.image_sell_out:setVisible(false)
			slot0.buy_btn:setVisible(false)

			if not slot0.left_day_txt then
				slot0.left_day_txt = createRichLabel(28, cc.c3b(139, 69, 19), cc.p(1, 0.5), cc.p(615, 44))

				slot0.container:addChild(slot0.left_day_txt)
			end

			if (slot2.expire_time or 0) - GameNet:getInstance():getTime() < 0 then
				slot6 = 0
			end

			if TimeTool.GetTimeName(slot6) < 1 then
				slot0.left_day_txt:setString(string.format(TI18N("<div fontsize=24>还有</div><div fontsize=24 fontcolor=#249003>%s</div>"), TimeTool.GetTimeFormatTwo(slot6)))
			else
				slot0.left_day_txt:setString(string.format(TI18N("还有<div fontcolor=#249003>%s</div>天"), tostring(slot7)))
			end

			slot0.left_day_txt:setVisible(true)
		end
	else
		slot0.image_sell_out:setVisible(false)
		slot0.buy_btn:setVisible(true)

		if slot0.left_day_txt then
			slot0.left_day_txt:setVisible(false)
		end

		if slot0.privilege_cfg.pay_type == 1 then
			slot0.buy_btn_label:setString(string.format(TI18N("<div outline=2,#020019>%d元</div>"), slot0.privilege_cfg.loss))
		elseif slot0.privilege_cfg.pay_type == 2 then
			slot0.buy_btn_label:setString(string.format("<img src='%s' scale=0.3 /><div outline=2,#020019>%d</div>", PathTool.getItemRes(3), slot0.privilege_cfg.loss))
		end
	end
end

function PrivilegeItem.DeleteMe(slot0)
	if slot0.buy_privilege_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.buy_privilege_ticket)

		slot0.buy_privilege_ticket = nil
	end

	if slot0.item_list ~= nil then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
