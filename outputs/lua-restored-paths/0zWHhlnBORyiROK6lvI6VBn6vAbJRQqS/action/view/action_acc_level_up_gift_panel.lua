ActionAccLevelUpGiftPanel = class("ActionAccLevelUpGiftPanel", function ()
	return ccui.Widget:create()
end)
slot0 = table.sort
slot1 = string.format

function ActionAccLevelUpGiftPanel.ctor(slot0, slot1, slot2)
	slot0.parent = container
	slot0.holiday_bid = slot1
	slot0.type = slot2
	slot0.ctrl = ActionController:getInstance()
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:configUI()
	slot0:register_event()

	slot0.cell_data_list = {}
	slot0.dic_cell_datas = {}
end

function ActionAccLevelUpGiftPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_acc_level_up_gift_panel"))

	slot0.root_wnd:setPosition(-40, -66)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.title_img = slot0.title_con:getChildByName("title_img")

	if slot0.ctrl:getActionSubTabVo(slot0.holiday_bid) then
		if slot1.aim_title == nil or slot1.aim_title == "" then
			slot1.aim_title = "txt_cn_action_acc_level_up_gift"
		end

		if not slot0.item_load1 then
			slot0.item_load1 = loadSpriteTextureFromCDN(slot0.title_img, PathTool.getTargetRes("bigbg/action", slot1.aim_title, false, false), ResourcesType.single, slot0.item_load1)
		end
	end

	slot0.quick_fight_btn = slot0.title_con:getChildByName("quick_fight_btn")
	slot0.quick_fight_img = slot0.quick_fight_btn:getChildByName("btn_img")

	loadSpriteTexture(slot0.quick_fight_img, PathTool.getItemRes(30053), LOADTEXT_TYPE)

	slot0.quick_fight_label = slot0.quick_fight_btn:getChildByName("btn_label")

	slot0.quick_fight_label:setString(TI18N("快速作战特权"))

	slot0.quick_fight_lock = slot0.quick_fight_btn:getChildByName("lock_label")

	slot0.quick_fight_lock:setString(TI18N("点击激活"))
	slot0:updateQuickFightBtn()

	slot0.charge_con = slot0.main_container:getChildByName("charge_con")
	slot3 = slot0.title_con:getChildByName("time_title")
	slot0.time_val = createRichLabel(22, Config.ColorData.data_color4[1], cc.p(1, 0.5), cc.p(0, 0), nil, nil, 1000)

	slot0.title_con:getChildByName("time_node"):addChild(slot0.time_val)
	slot0:setLessTime(slot1.remain_sec)
end

function ActionAccLevelUpGiftPanel.updateQuickFightBtn(slot0)
	if VipController:getInstance():getModel():getPrivilegeDataById(102) and slot1.expire_time and slot1.status == 1 then
		setChildUnEnabled(false, slot0.quick_fight_img)
		slot0.quick_fight_lock:setVisible(false)
	else
		setChildUnEnabled(true, slot0.quick_fight_img)
		slot0.quick_fight_lock:setVisible(true)
	end
end

function ActionAccLevelUpGiftPanel.register_event(slot0)
	registerButtonEventListener(slot0.quick_fight_btn, function ()
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.PRIVILEGE)
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	if not slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_LEVEL_UP_GIFT, function (slot0)
			if not slot0 then
				return
			end

			uv0:setData(slot0)
		end)
	end

	if slot0.update_privilege_event == nil then
		slot0.update_privilege_event = GlobalEvent:getInstance():Bind(VipEvent.PRIVILEGE_INFO, function ()
			uv0:updateQuickFightBtn()
		end)
	end
end

function ActionAccLevelUpGiftPanel.setData(slot0, slot1)
	slot2 = false

	for slot6, slot7 in ipairs(slot1.gifts) do
		if slot0.dic_cell_datas[slot7.id] == nil and Config.LevGiftData.data_level_welfare_fun(slot7.id) then
			slot9 = {
				id = slot7.id,
				config = slot8
			}

			table.insert(slot0.cell_data_list, slot9)

			slot0.dic_cell_datas[slot7.id] = slot9
		end

		if slot0.dic_cell_datas[slot7.id] then
			if slot7.status == 1 and slot0.dic_cell_datas[slot7.id].config.num <= slot7.num then
				slot7.status = 4
			end

			if slot7.status == 0 then
				slot0.dic_cell_datas[slot7.id].order = 2
			elseif slot7.status == 4 then
				slot0.dic_cell_datas[slot7.id].order = 3
				slot7.status = 0
			elseif slot7.status == 2 then
				slot0.dic_cell_datas[slot7.id].order = 4
			else
				slot0.dic_cell_datas[slot7.id].order = 1
			end

			slot0.dic_cell_datas[slot7.id].status = slot7.status

			if not slot2 and slot7.status == 1 then
				slot2 = true
			end

			slot0.dic_cell_datas[slot7.id].num = slot7.num
		end
	end

	uv0(slot0.cell_data_list, SortTools.tableLowerSorter({
		"order",
		"id"
	}))
	slot0.ctrl:setHolidayStatus(slot0.holiday_bid, slot2)
	slot0:updateScrollviewList()
end

function ActionAccLevelUpGiftPanel.updateScrollviewList(slot0)
	if slot0.common_scrollview == nil then
		slot0.common_scrollview = CommonScrollViewSingleLayout.new(slot0.charge_con, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.charge_con:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 2,
			row = 1,
			delay = 4,
			space_x = 0,
			item_width = 688,
			item_height = 150,
			space_y = 3,
			col = 1
		}, cc.p(0, 0))

		slot0.common_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.common_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.common_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.common_scrollview:reloadData()
end

function ActionAccLevelUpGiftPanel.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Widget:create()
	slot3.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_acc_level_up_gift_item"))

	slot3:addChild(slot3.root_wnd)
	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(0, 0)
	slot3:setContentSize(cc.size(slot1, slot2))

	slot3.main_container = slot3.root_wnd:getChildByName("main_container")
	slot3.title = slot3.main_container:getChildByName("title")
	slot3.portion_count = slot3.main_container:getChildByName("portion_count")
	slot3.btn_go = slot3.main_container:getChildByName("btn_go")
	slot3.btn_label = slot3.btn_go:getChildByName("label")

	slot3.btn_label:setString(TI18N("领取"))

	if slot0.btn_label ~= nil then
		slot0.btn_label:enableOutline(Config.ColorData.data_color4[277], 2)
	end

	slot3.pic_has = slot3.main_container:getChildByName("pic_has")
	slot3.item_scrollview = slot3.main_container:getChildByName("item_scrollview")

	slot3.item_scrollview:setScrollBarEnabled(false)
	slot3.item_scrollview:setSwallowTouches(false)

	slot3.item_scrollview_size = slot3.item_scrollview:getContentSize()

	registerButtonEventListener(slot3.btn_go, function ()
		uv0:setCellTouched(uv1)
	end, false, 2)

	slot3.item_list = {}

	function slot3.DeleteMe()
		doStopAllActions(uv0.item_scrollview)

		if uv0.item_list ~= nil then
			for slot3, slot4 in pairs(uv0.item_list) do
				slot4:DeleteMe()
			end

			uv0.item_list = nil
		end
	end

	return slot3
end

function ActionAccLevelUpGiftPanel.numberOfCells(slot0)
	if not slot0.cell_data_list then
		return 0
	end

	return #slot0.cell_data_list
end

function ActionAccLevelUpGiftPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.cell_data_list[slot2] then
		return
	end

	slot4 = slot3.config
	slot6 = RoleController:getInstance():getRoleVo() and slot5.lev or 0
	slot7 = nil

	slot1.title:setString((slot4.lev > slot6 or uv0(TI18N("达到%s级 (%s/%s)"), slot4.lev, slot4.lev, slot4.lev)) and uv0(TI18N("达到%s级 (%s/%s)"), slot4.lev, slot6, slot4.lev))

	if slot4.num - slot3.num < 0 then
		slot8 = 0
	end

	slot1.portion_count:setString(uv0(TI18N("还剩%s份"), slot8))

	if slot1.item_list then
		for slot13, slot14 in ipairs(slot1.item_list) do
			slot14:setVisible(false)
		end
	end

	slot12 = #slot4.reward

	slot1.item_scrollview:setInnerContainerSize(cc.size(math.max(slot1.item_scrollview_size.width, (BackPackItem.Width * 0.8 + 10) * slot12), slot1.item_scrollview_size.height))

	if slot12 <= 4 then
		slot1.item_scrollview:setTouchEnabled(false)
	end

	slot1.start_x = slot11 * 0.5

	slot1.item_scrollview:stopAllActions()

	slot16 = nil
	slot17 = #slot1.item_list

	for slot21, slot22 in ipairs(slot4.reward) do
		if slot1.item_list[slot21] then
			slot16:setVisible(true)
			slot16:setPosition(slot1.start_x + (slot21 - 1) * (slot13 + slot11) + 8, slot1.item_scrollview_size.height * 0.5)
			slot16:setBaseData(slot22[1], slot22[2], true)
			slot16:setDefaultTip()
		else
			if slot21 - slot17 <= 0 then
				slot23 = 1
			end

			delayRun(slot1.item_scrollview, slot23 / display.DEFAULT_FPS, function ()
				if not uv0.item_list[uv1] then
					uv2 = BackPackItem.new(true, true)

					uv2:setAnchorPoint(0, 0.5)
					uv2:setScale(uv3)
					uv2:setSwallowTouches(false)
					uv0.item_scrollview:addChild(uv2)

					uv0.item_list[uv1] = uv2

					uv2:setPosition(uv0.start_x + (uv1 - 1) * (uv4 + uv5) + 8, uv0.item_scrollview_size.height * 0.5)
					uv2:setBaseData(uv6[1], uv6[2], true)
					uv2:setDefaultTip()
				end
			end)
		end
	end

	if slot3.status == 0 then
		slot1.btn_go:setVisible(true)
		slot1.pic_has:setVisible(false)
		setChildUnEnabled(true, slot1.btn_go)
		slot1.btn_label:disableEffect(cc.LabelEffect.OUTLINE)
		slot1.btn_go:setTouchEnabled(false)
	elseif slot3.status == 1 then
		slot1.btn_go:setVisible(true)
		slot1.pic_has:setVisible(false)
		setChildUnEnabled(false, slot1.btn_go)
		slot1.btn_label:enableOutline(Config.ColorData.data_color4[277], 2)
		slot1.btn_go:setTouchEnabled(true)
	else
		slot1.btn_go:setVisible(false)
		slot1.pic_has:setVisible(true)
	end
end

function ActionAccLevelUpGiftPanel.setCellTouched(slot0, slot1)
	if not slot1.index then
		return
	end

	if not slot0.cell_data_list[slot1.index] then
		return
	end

	if slot2.status == 1 then
		slot0.ctrl:send21201(slot2.id)
	end
end

function ActionAccLevelUpGiftPanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_val) then
		return
	end

	slot0.time_val:stopAllActions()

	if (slot1 or 0) > 0 then
		slot0:setTimeFormatString(slot2)
		slot0.time_val:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.time_val:stopAllActions()
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot2)
	end
end

function ActionAccLevelUpGiftPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		str = string.format(TI18N("剩余时间: <div fontcolor=#14ff32>%s</div>"), TimeTool.GetTimeFormatDayIIIIII(slot1))

		slot0.time_val:setString(str)
	else
		slot0.time_val:setString("")
	end
end

function ActionAccLevelUpGiftPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		slot0.ctrl:send21200()
	end
end

function ActionAccLevelUpGiftPanel.DeleteMe(slot0)
	if slot0.item_load1 then
		slot0.item_load1:DeleteMe()

		slot0.item_load1 = nil
	end

	if slot0.common_scrollview then
		slot0.common_scrollview:DeleteMe()

		slot0.common_scrollview = nil
	end

	if slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)
		slot0.update_action_even_event = nil
	end

	if slot0.update_privilege_event then
		GlobalEvent:getInstance():UnBind(slot0.update_privilege_event)

		slot0.update_privilege_event = nil
	end

	doStopAllActions(slot0.time_val)
end
