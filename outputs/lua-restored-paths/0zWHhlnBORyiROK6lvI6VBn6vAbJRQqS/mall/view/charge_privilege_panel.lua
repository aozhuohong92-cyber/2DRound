slot0 = table.insert
slot1 = table.sort
slot2 = string.format
ChargePrivilegePanel = ChargePrivilegePanel or BaseClass()

function ChargePrivilegePanel.__init(slot0, slot1, slot2)
	slot0.is_init = true
	slot0.parent = slot1
	slot0.offset_y = slot2 or 0

	slot0:loadResListCompleted()
end

function ChargePrivilegePanel.loadResListCompleted(slot0)
	slot0:createRootWnd()
	slot0:registerEvent()
	slot0:setData()
end

function ChargePrivilegePanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("mall/charge_value_panel"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.vip_tips_txt = createLabel(20, 1, cc.c4b(75, 64, 111, 255), slot0.main_container:getContentSize().width - 10, 842, TI18N("均可获得vip积分"), slot0.main_container, 2, cc.p(1, 0.5))
	slot0.tips_txt = slot0.main_container:getChildByName("tips_txt")

	slot0.tips_txt:setVisible(true)
	slot0.tips_txt:setString(TI18N("超值强力英雄 额外远航特权 免费快速作战"))

	slot0.item_list = slot0.main_container:getChildByName("item_list")
	slot2 = slot0.item_list:getContentSize()
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.item_list, cc.p(-5, -130 - slot0.offset_y), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot2.width + 10, slot2.height + 130 + slot0.offset_y), {
		start_y = 5,
		row = 1,
		start_x = 5,
		space_x = 0,
		item_width = 680,
		item_height = 174,
		space_y = 5,
		col = 1,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot5 = slot0.main_container:getChildByName("image_1")

	slot5:setContentSize(cc.size(slot2.width + 10, slot2.height + slot0.offset_y + 20))
	slot5:setPositionY(slot5:getPositionY() - slot0.offset_y)
end

function ChargePrivilegePanel.createNewCell(slot0)
	slot1 = ChargePrivilegeItem.new()

	slot1:addCallBack(handler(slot0, slot0.onClickCallBack))

	return slot1
end

function ChargePrivilegePanel.numberOfCells(slot0)
	if not slot0.privilege_data then
		return 0
	end

	return #slot0.privilege_data
end

function ChargePrivilegePanel.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.privilege_data then
		return
	end

	slot1.index = slot2

	if not slot0.privilege_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ChargePrivilegePanel.onClickCallBack(slot0, slot1)
	if slot1 then
		slot0.privilege_charge_id = slot1
	end
end

function ChargePrivilegePanel.registerEvent(slot0)
	if slot0.update_privilege == nil then
		slot0.update_privilege = GlobalEvent:getInstance():Bind(VipEvent.PRIVILEGE_INFO, function ()
			if uv0.item_scrollview then
				uv0.item_scrollview:resetCurrentItems()
			end
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

function ChargePrivilegePanel.setVisibleStatus(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end

	if slot1 == true and slot0.is_init == true then
		slot0.is_init = false

		VipController:getInstance():getModel():setPrivilegeOpenFlag(true)
	end
end

function ChargePrivilegePanel.setData(slot0)
	slot0.privilege_data = {}

	for slot5, slot6 in pairs(Config.PrivilegeData.data_privilege_data) do
		if not slot6.limit_lev or slot6.limit_lev <= RoleController:getInstance():getRoleVo().lev then
			uv0(slot0.privilege_data, slot6)
		end
	end

	uv1(slot0.privilege_data, SortTools.KeyLowerSorter("sort_id"))
	slot0.item_scrollview:reloadData()
end

function ChargePrivilegePanel.addChild(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) and not tolua.isnull(slot1) then
		slot0.root_wnd:addChild(slot1)
	end
end

function ChargePrivilegePanel.setPosition(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setPosition(slot1)
	end
end

function ChargePrivilegePanel.__delete(slot0)
	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

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

ChargePrivilegeItem = class("ChargePrivilegeItem", function ()
	return ccui.Widget:create()
end)

function ChargePrivilegeItem.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()

	slot0.touch_buy_privilege = true
end

function ChargePrivilegeItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("vip/privilege_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(680, 174))
	slot0:setAnchorPoint(0, 0)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.image_title = slot0.container:getChildByName("image_title")
	slot0.title_txt = slot0.container:getChildByName("title_txt")
	slot0.limit_txt = slot0.container:getChildByName("limit_txt")
	slot0.image_icon = slot0.container:getChildByName("image_icon")

	slot0.image_icon:ignoreContentAdaptWithSize(true)
	slot0.image_icon:setScale(0.85)

	slot0.image_sell_out = slot0.container:getChildByName("image_sell_out")

	slot0.image_sell_out:setVisible(false)

	slot0.buy_btn = slot0.container:getChildByName("buy_btn")
	slot1 = slot0.buy_btn:getContentSize()
	slot0.buy_btn_label = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(slot1.width / 2, slot1.height / 2))

	slot0.buy_btn:addChild(slot0.buy_btn_label)

	slot0.desc_txt = createRichLabel(20, cc.c3b(100, 50, 35), cc.p(0.5, 1), cc.p(378, 160), 5, nil, 350)

	slot0.container:addChild(slot0.desc_txt)

	slot2 = slot0.container:getChildByName("good_list")
	slot0.good_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.good_scrollview:setSwallowTouches(false)
end

function ChargePrivilegeItem.registerEvent(slot0)
	registerButtonEventListener(slot0.buy_btn, handler(slot0, slot0.onClickItem), true, 1, nil, nil, nil, true)
end

function ChargePrivilegeItem.onClickItem(slot0)
	if slot0.srv_data and slot0.srv_data.status == TRUE then
		message(TI18N("该礼包已售罄"))

		return
	end

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
					slot0.callback(slot2.id)
				end

				ActionController:getInstance():sender21016(slot2.id)
			end
		elseif slot0.privilege_cfg.pay_type == 2 then
			MallController:getInstance():openChargeSureWindow(true, slot0.privilege_cfg)
		end
	end
end

function ChargePrivilegeItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function ChargePrivilegeItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.privilege_cfg = slot1
	slot0.srv_data = VipController:getInstance():getModel():getPrivilegeDataById(slot1.id) or {
		status = 0,
		expire_time = 0
	}

	slot0.title_txt:setString(slot0.privilege_cfg.name or "")

	if slot0.privilege_cfg.icon_id then
		slot0.icon_load = loadImageTextureFromCDN(slot0.image_icon, uv0("resource/mall_charge_icon/%s.png", slot0.privilege_cfg.icon_id), ResourcesType.single, slot0.icon_load)
	end

	slot0.desc_txt:setString(slot0.privilege_cfg.desc or "")

	slot3 = RoleController:getInstance():getRoleVo()

	if Config.PrivilegeData.data_privilege_award[slot1.id] then
		slot5 = {}

		for slot9, slot10 in pairs(slot4) do
			if slot10.min <= slot3.lev and slot3.lev <= slot10.max then
				slot5 = deepCopy(slot10.reward)

				break
			end
		end

		slot6 = {}

		for slot10, slot11 in pairs(slot5) do
			if deepCopy(Config.ItemData.data_get_data(slot11[1])) then
				slot12.quantity = slot11[2]

				table.insert(slot6, slot12)
			end
		end

		slot0.good_scrollview:setData(slot6)
		slot0.good_scrollview:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.good_scrollview:getItemList()) do
				slot5:setDefaultTip()
			end
		end)
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
				slot0.left_day_txt = createRichLabel(28, cc.c3b(100, 50, 35), cc.p(1, 0.5), cc.p(652, 44))

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

function ChargePrivilegeItem.DeleteMe(slot0)
	if slot0.buy_privilege_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.buy_privilege_ticket)

		slot0.buy_privilege_ticket = nil
	end

	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	if slot0.icon_load then
		slot0.icon_load:DeleteMe()

		slot0.icon_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
