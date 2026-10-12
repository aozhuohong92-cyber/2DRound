DayChargeWindow = DayChargeWindow or BaseClass(BaseView)
slot0 = DayChargeController:getInstance()

function DayChargeWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "action/action_day_charge_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("exchange", "exchange"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_bigbg_2"),
			type = ResourcesType.single
		}
	}
	slot0.first_effect = {}
	slot0.item_list = {}
end

function DayChargeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.background:setPosition(360, 640)
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.btn_charge = slot0.main_container:getChildByName("btn_charge")

	slot0.btn_charge:setVisible(false)

	slot0.btn_get = slot0.main_container:getChildByName("btn_get")

	slot0.btn_get:setVisible(false)

	slot0.charge_num = CommonNum.new(5, slot0.main_container, 1, 1, cc.p(0, 0.5))

	slot0.charge_num:setPosition(241, 614)

	slot0.diamond = slot0.main_container:getChildByName("Sprite_9")
	slot1 = slot0.main_container:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot1, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 15,
		row = 1,
		start_x = 5,
		space_x = 14,
		space_y = 0,
		col = 0,
		scale = 0.9,
		item_width = BackPackItem.Width * 0.9,
		item_height = BackPackItem.Height * 0.9
	}, cc.p(0, 0))

	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:setClickEnabled(false)
end

function DayChargeWindow.createNewCell(slot0)
	slot1 = BackPackItem.new()

	slot1:setDefaultTip()
	slot1:setScale(0.9)

	return slot1
end

function DayChargeWindow.numberOfCells(slot0)
	if not slot0.item_list then
		return 0
	end

	return #slot0.item_list
end

function DayChargeWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.item_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function DayChargeWindow.openRootWnd(slot0)
	uv0:sender21010()

	slot1 = RoleController:getInstance():getRoleVo()
	slot2 = Config.ChargeData.data_daily_reward_length

	for slot7, slot8 in pairs(Config.ChargeData.data_daily_reward) do
		if slot8.min <= slot1.open_day and slot1.open_day <= slot8.max then
			slot2 = slot8.id

			break
		end
	end

	if slot0.item_scrollview then
		slot4 = {}

		for slot8, slot9 in pairs(slot3[slot2].reward) do
			table.insert(slot4, {
				bid = slot9[1],
				quantity = slot9[2]
			})
		end

		slot0.item_list = slot4

		slot0.item_scrollview:reloadData()
	end

	slot0.charge_num:setCallBack(function ()
		uv0.diamond:setPositionX(uv0.charge_num:getPositionX() + uv0.charge_num:getContentSize().width)
	end)
	slot0.diamond:setPositionX(slot0.charge_num:getPositionX() + slot0.charge_num:getContentSize().width)

	slot0.first_effect[1] = createEffectSpine(PathTool.getEffectRes(650), cc.p(360, 673), cc.p(0.5, 0.5), true, PlayerAction.action)

	slot0.main_container:addChild(slot0.first_effect[1])

	slot0.first_effect[2] = createEffectSpine(PathTool.getEffectRes(651), cc.p(360, 305), cc.p(0.5, 0.5), true, PlayerAction.action)

	slot0.main_container:addChild(slot0.first_effect[2])
	slot0.first_effect[2]:setVisible(false)
end

function DayChargeWindow.register_event(slot0)
	slot0:addGlobalEvent(DayChargetEvent.DAY_FIRST_CHARGE_EVENT, function (slot0)
		if not slot0 then
			return
		end

		if Config.ChargeData.data_constant.day_charge_goal.val - slot0.num <= 0 then
			slot2 = 0
		end

		uv0.charge_num:setNum(slot2)

		if slot0.status == 0 then
			uv0.first_effect[2]:setVisible(true)
			uv0.btn_charge:setVisible(true)
			uv0.btn_get:setVisible(false)
		elseif slot0.status == 1 then
			uv0.first_effect[2]:setVisible(false)
			uv0.btn_charge:setVisible(false)
			uv0.btn_get:setVisible(true)
		end
	end)
	registerButtonEventListener(slot0.background, function ()
		uv0:openDayFirstChargeView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_charge, function ()
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
	end, true, 1)
	registerButtonEventListener(slot0.btn_get, function ()
		uv0:sender21011()
	end, true, 1)
end

function DayChargeWindow.close_callback(slot0)
	doStopAllActions(slot0.main_container)

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.charge_num then
		slot0.charge_num:DeleteMe()

		slot0.charge_num = nil
	end

	for slot4, slot5 in pairs(slot0.first_effect) do
		if slot5 then
			slot5:clearTracks()
			slot5:removeFromParent()

			slot5 = nil
		end
	end

	uv0:openDayFirstChargeView(false)
end
