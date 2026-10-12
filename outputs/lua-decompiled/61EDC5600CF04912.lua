ActionLevelGiftPanel = class("ActionLevelGiftPanel", function ()
	return ccui.Widget:create()
end)
slot0 = table.sort
slot1 = string.format

function ActionLevelGiftPanel.ctor(slot0, slot1, slot2)
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

function ActionLevelGiftPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_level_gift_panel"))

	slot0.root_wnd:setPosition(-40, -66)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_img = slot0.main_container:getChildByName("title_img")

	if slot0.ctrl:getActionSubTabVo(slot0.holiday_bid) then
		if slot1.aim_title == nil or slot1.aim_title == "" then
			slot1.aim_title = "txt_cn_action_level_gift"
		end

		if not slot0.item_load1 then
			slot0.item_load1 = loadSpriteTextureFromCDN(slot0.title_img, PathTool.getTargetRes("bigbg/action/levelgift", slot1.aim_title, false, false), ResourcesType.single, slot0.item_load1)
		end
	end

	slot0.level_img = slot0.main_container:getChildByName("level_img")

	if not slot0.item_load then
		slot0.item_load = loadSpriteTextureFromCDN(slot0.level_img, PathTool.getTargetRes("bigbg/action/levelgift", 18, false, false), ResourcesType.single, slot0.item_load)
	end

	slot0.scrollview_con = slot0.main_container:getChildByName("scrollview_con")
	slot0.time_val = createRichLabel(24, Config.ColorData.data_color4[1], cc.p(0, 0.5), cc.p(0, 0), nil, nil, 1000)

	slot0.main_container:getChildByName("time_node"):addChild(slot0.time_val)
	slot0:setLessTime(slot1.remain_sec)

	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")
	slot0.comfirm_label = slot0.comfirm_btn:getChildByName("label")
end

function ActionLevelGiftPanel.register_event(slot0)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, 2)
end

function ActionLevelGiftPanel.onComfirmBtn(slot0)
end

function ActionLevelGiftPanel.setData(slot0, slot1)
	for slot5, slot6 in ipairs(slot1.gifts) do
		if slot0.dic_cell_datas[slot6.id] == nil and Config.LevGiftData.data_level_welfare_fun(slot6.id) then
			slot8 = {
				id = slot6.id,
				config = slot7
			}

			table.insert(slot0.cell_data_list, slot8)

			slot0.dic_cell_datas[slot6.id] = slot8
		end

		if slot0.dic_cell_datas[slot6.id] then
			if slot0.dic_cell_datas[slot6.id].config.num <= slot6.num then
				slot6.status = 0
			end

			slot0.dic_cell_datas[slot6.id].status = slot6.status

			if slot6.status == 0 then
				slot0.dic_cell_datas[slot6.id].order = 3
			else
				slot0.dic_cell_datas[slot6.id].order = slot6.status
			end

			slot0.dic_cell_datas[slot6.id].num = slot6.num
		end
	end

	uv0(slot0.cell_data_list, SortTools.tableLowerSorter({
		"order",
		"id"
	}))
	slot0:updateScrollviewList()
end

function ActionLevelGiftPanel.updateScrollviewList(slot0)
	if slot0.common_scrollview == nil then
		slot0.common_scrollview = CommonScrollViewSingleLayout.new(slot0.charge_con, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scrollview_con:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 4,
			space_x = 0,
			item_width = 688,
			item_height = 150,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.common_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.common_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.common_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.common_scrollview:reloadData()
end

function ActionLevelGiftPanel.createNewCell(slot0, slot1, slot2)
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

	slot3.btn_go:setTitleText(TI18N("领取"))

	if slot3.btn_go:getTitleRenderer() ~= nil then
		slot4:enableOutline(Config.ColorData.data_color4[277], 2)
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

	return slot3
end

function ActionLevelGiftPanel.numberOfCells(slot0)
	if not slot0.cell_data_list then
		return 0
	end

	return #slot0.cell_data_list
end

function ActionLevelGiftPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.cell_data_list[slot2] then
		return
	end

	slot7 = nil

	if slot3.config.lev <= (RoleController:getInstance():getRoleVo() and slot5.lev or 0) then
		slot1.title:setColor(cc.c4b(44, 125, 8, 255))

		slot7 = uv0(TI18N("达到%s级 (%s/%s)"), slot4.lev, slot4.lev, slot4.lev)
	else
		slot1.title:setColor(cc.c3b(214, 0, 0))

		slot7 = uv0(TI18N("达到%s级 (%s/%s)"), slot4.lev, slot6, slot4.lev)
	end

	slot1.title:setString(slot7)

	if slot4.num - slot3.num < 0 then
		slot8 = 0
	end

	slot1.portion_count:setString(uv0(TI18N("还剩%s份"), slot8))

	if slot1.item_list then
		for slot13, slot14 in ipairs(slot1.item_list) do
			slot14:setVisible(false)
		end
	end

	slot11 = 10
	slot21 = math.max(slot1.item_scrollview_size.width, (BackPackItem.Width * 0.75 + slot11) * #slot4.reward)
	slot22 = slot1.item_scrollview_size.height

	slot1.item_scrollview:setInnerContainerSize(cc.size(slot21, slot22))

	slot1.start_x = slot11 * 0.5

	slot1.item_scrollview:stopAllActions()

	slot16 = nil
	slot17 = #slot1.item_list

	for slot21, slot22 in ipairs(slot4.reward) do
		if slot1.item_list[slot21] then
			slot16:setVisible(true)
			slot16:setPosition(slot1.start_x + (slot21 - 1) * (slot13 + slot11) + 8, slot1.item_scrollview_size.height * 0.5)

			slot24 = {
				bid = slot22[1],
				num = slot22[2]
			}

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

					slot1 = {
						bid = uv6[1],
						num = uv6[2]
					}

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
		slot1.btn_go:setTouchEnabled(false)
	elseif slot3.status == 1 then
		slot1.btn_go:setVisible(true)
		slot1.pic_has:setVisible(false)
		setChildUnEnabled(false, slot1.btn_go)
		slot1.btn_go:setTouchEnabled(true)
	else
		slot1.btn_go:setVisible(false)
		slot1.pic_has:setVisible(true)
	end
end

function ActionLevelGiftPanel.setCellTouched(slot0, slot1)
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

function ActionLevelGiftPanel.setLessTime(slot0, slot1)
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

function ActionLevelGiftPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		str = string.format(TI18N("剩余时间: <div fontcolor=#14ff32>%s</div>"), TimeTool.GetTimeFormatDayIIIIII(slot1))

		slot0.time_val:setString(str)
	else
		slot0.time_val:setString("")
	end
end

function ActionLevelGiftPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		-- Nothing
	end
end

function ActionLevelGiftPanel.DeleteMe(slot0)
	if slot0.item_load1 then
		slot0.item_load1:DeleteMe()

		slot0.item_load1 = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)
		slot0.update_action_even_event = nil
	end

	doStopAllActions(slot0.time_val)
end
