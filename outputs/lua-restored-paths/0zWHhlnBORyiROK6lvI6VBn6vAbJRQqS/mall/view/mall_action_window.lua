MallActionWindow = MallActionWindow or BaseClass(BaseView)
slot0 = {
	cc.c4b(207, 181, 147, 255),
	cc.c4b(255, 237, 214, 255)
}
slot1 = table.sort
slot2 = string.format

function MallActionWindow.__init(slot0)
	slot0.ctrl = MallController:getInstance()
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "mall/mall_action_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("mall", "mall"),
			type = ResourcesType.plist
		}
	}
	slot0.tab_list = {}
	slot0.cur_tab = nil
	slot0.cur_index = nil
	slot0.data_list = {}
end

function MallActionWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_2", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.mainContainer = slot0.root_wnd:getChildByName("main_container")
	slot5 = 1

	slot0:playEnterAnimatianByObj(slot0.mainContainer, slot5)

	slot0.main_panel = slot0.mainContainer:getChildByName("main_panel")
	slot0.tableContainer = slot0.main_panel:getChildByName("tab_container")
	slot1 = nil

	for slot5 = 1, 4 do
		slot1 = slot0.tableContainer:getChildByName(string.format("tab_btn_%s", slot5))
		slot1.red = slot1:getChildByName("tab_tips")

		slot1.red:setVisible(false)

		slot1.red_num = slot1:getChildByName("red_num")

		slot1.red_num:setVisible(false)

		slot1.select_bg = slot1:getChildByName("select_bg")

		slot1.select_bg:setVisible(false)

		slot1.unselect_bg = slot1:getChildByName("unselect_bg")
		slot1.label = slot1:getChildByName("title")

		slot1:setBright(false)

		slot1.index = slot5

		slot1:setVisible(false)

		slot0.tab_list[slot5] = slot1
	end

	slot0.container = slot0.main_panel:getChildByName("container")
	slot0.btn = slot0.container:getChildByName("btn")
	slot0.btn_label = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(slot0.btn:getContentSize().width / 2, slot0.btn:getContentSize().height / 2))

	slot0.btn_label:setString(TI18N("刷新"))
	slot0.btn:addChild(slot0.btn_label)
	slot0.btn:setVisible(false)

	slot0.coin_bg = slot0.container:getChildByName("Image_50")
	slot0.coin = slot0.container:getChildByName("coin")
	slot0.count = slot0.container:getChildByName("count")
	slot0.add_btn = slot0.container:getChildByName("add_btn")

	slot0.add_btn:setVisible(false)

	slot0.refresh_count = slot0.container:getChildByName("refresh_count")

	slot0.refresh_count:setString("")

	slot0.tips_btn = slot0.container:getChildByName("tips_btn")

	slot0.tips_btn:setVisible(false)

	slot0.time = createRichLabel(22, 58, cc.p(1, 0.5), cc.p(650, slot0.count:getPositionY()))

	slot0.container:addChild(slot0.time)
	slot0.time:setVisible(false)

	slot0.good_cons = slot0.container:getChildByName("good_cons")
	slot0.winTitle = slot0.main_panel:getChildByName("win_title")

	slot0.winTitle:setString(TI18N("活动商城"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
end

function MallActionWindow.register_event(slot0)
	function slot4()
		uv0:onCloseBtn()
	end

	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

	for slot4, slot5 in ipairs(slot0.tab_list) do
		registerButtonEventListener(slot5, function ()
			uv0:changeTabView(uv1.index, true)
		end, false, 3)
	end

	slot0:addGlobalEvent(MallEvent.Update_Action_event, function (slot0)
		uv0:updateData(slot0)
	end)
	slot0:addGlobalEvent(MallEvent.Buy_Action_Shop_Success_event, function (slot0)
		if not uv0.action_data_list then
			return
		end

		if uv0.cur_index and uv0.action_data_list[uv0.cur_index] and uv0.action_data_list[uv0.cur_index].bid == slot0.bid then
			slot1 = uv0.action_data_list[uv0.cur_index].exchange_list

			for slot6, slot7 in ipairs(uv0.common_scrollview:getActiveCellList()) do
				if slot7.index and slot1[slot7.index].aim == slot0.aim then
					slot1[slot7.index].buy_count = slot0.buy_count

					uv0.common_scrollview:resetItemByIndex(slot7.index)
				end
			end
		end
	end)

	if slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ACTION_ASSETS, function (slot0, slot1)
			if not uv0.action_data_list then
				return
			end

			if uv0.cur_index and uv0.action_data_list[uv0.cur_index] and slot0 == uv0.action_data_list[uv0.cur_index].need_id then
				uv0.count:setString(slot1)
			end
		end)
	end
end

function MallActionWindow.onCloseBtn(slot0)
	slot0.ctrl:openMallActionWindow(false)
end

function MallActionWindow.openRootWnd(slot0, slot1)
	slot0.first_bid = slot1

	slot0.ctrl:send16660()
end

function MallActionWindow.updateData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.holiday_exchanges and next(slot1.holiday_exchanges) == nil then
		return
	end

	slot0.dic_item_config = {}
	slot0.action_data_list = {}
	slot0.cur_index = 1

	function slot5(slot0, slot1)
		return slot0.bid < slot1.bid
	end

	uv0(slot1.holiday_exchanges, slot5)

	for slot5, slot6 in ipairs(slot1.holiday_exchanges) do
		if slot0.tab_list[slot5] then
			slot0.tab_list[slot5].label:setString(slot6.exchange_name)
			slot0.tab_list[slot5]:setVisible(true)

			if slot0.first_bid and slot0.first_bid == slot6.bid then
				slot0.cur_index = slot5
			end
		end

		for slot10, slot11 in ipairs(slot6.exchange_list) do
			slot11.sort_lock = 0

			if slot11.aim_args and next(slot11.aim_args) ~= nil then
				for slot15, slot16 in ipairs(slot11.aim_args) do
					if slot16.aim_args_key == 3 and slot16.aim_args_val ~= 1 then
						slot11.sort_lock = 1

						break
					end
				end
			end
		end

		uv0(slot6.exchange_list, SortTools.tableCommonSorter({
			{
				"sort_lock",
				false
			},
			{
				"aim",
				false
			}
		}))

		slot0.action_data_list[slot5] = slot6
	end

	slot0:changeTabView(slot0.cur_index)
end

function MallActionWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time) then
		return
	end

	slot0.time:stopAllActions()

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.time:stopAllActions()
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function MallActionWindow.setTimeFormatString(slot0, slot1)
	slot0.rest_time = slot1

	if slot1 > 0 then
		slot0.time:setString(string.format(TI18N("剩余时间: %s"), TimeTool.GetTimeFormatDayIIIIII(slot1)))
	else
		slot0.time:setString("剩余时间: 0")
	end
end

function MallActionWindow.changeTabView(slot0, slot1, slot2)
	if slot2 and slot0.cur_index == slot1 then
		return
	end

	if slot0.cur_tab ~= nil then
		if slot0.cur_tab.label then
			slot0.cur_tab.label:setTextColor(cc.c4b(207, 181, 147, 255))
			slot0.cur_tab.label:enableOutline(cc.c4b(42, 22, 14, 255), 2)
		end

		slot0.cur_tab.select_bg:setVisible(false)
	end

	slot0.cur_index = slot1
	slot0.cur_tab = slot0.tab_list[slot1]

	if slot0.cur_tab ~= nil then
		if slot0.cur_tab.label then
			slot0.cur_tab.label:setTextColor(cc.c4b(255, 237, 214, 255))
			slot0.cur_tab.label:enableOutline(cc.c4b(42, 22, 14, 255), 2)
		end

		slot0.cur_tab.select_bg:setVisible(true)
	end

	slot0.tips_btn:setVisible(false)
	slot0:updateScrollviewList()
	slot0:updateInfo()
end

function MallActionWindow.updateInfo(slot0)
	if Config.ItemData.data_get_data(slot0.action_data_list[slot0.cur_index].need_id) and slot1 ~= 0 then
		slot3 = PathTool.getItemRes(slot2.icon, false)

		if slot0.record_cost_res == nil or slot0.record_cost_res ~= slot3 then
			loadSpriteTexture(slot0.coin, slot3, LOADTEXT_TYPE)
		end

		slot0.coin_bg:setVisible(true)
		slot0.coin:setVisible(true)
		slot0.count:setVisible(true)
	else
		slot0.coin_bg:setVisible(false)
		slot0.coin:setVisible(false)
		slot0.count:setVisible(false)
	end

	slot0.count:setString(slot0.role_vo:getActionAssetsNumByBid(slot1))
	slot0.time:setVisible(true)

	if slot0.action_data_list[slot0.cur_index].end_time - GameNet:getInstance():getTime() < 0 then
		slot4 = 0
	end

	slot0:setLessTime(slot4)
end

function MallActionWindow.updateScrollviewList(slot0)
	if slot0.common_scrollview == nil then
		slot0.common_scrollview = CommonScrollViewSingleLayout.new(slot0.good_cons, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.good_cons:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 4,
			row = 1,
			delay = 4,
			space_x = 0,
			item_width = 306,
			item_height = 147,
			space_y = 0,
			col = 2
		}, cc.p(0, 0))

		slot0.common_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.common_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.common_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.common_scrollview:reloadData()
end

function MallActionWindow.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Widget:create()
	slot3.root_wnd = createCSBNote(PathTool.getTargetCSB("mall/mall_item"))

	slot3:addChild(slot3.root_wnd)
	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(0, 0)
	slot3:setContentSize(cc.size(slot1, slot2))
	slot3:setTouchEnabled(true)

	slot3.main_container = slot3.root_wnd:getChildByName("main_container")

	slot3.main_container:setSwallowTouches(false)

	slot4 = slot3.main_container:getChildByName("count_bg")
	slot3.name_panel = slot3.main_container:getChildByName("name_panel")
	slot3.name = slot3.name_panel:getChildByName("name")
	slot3.coin = slot4:getChildByName("coin")
	slot3.price = slot4:getChildByName("price")
	slot3.discount = slot3.main_container:getChildByName("discount")

	slot3.discount:setLocalZOrder(20)

	slot3.discount_num = slot3.discount:getChildByName("discount_num")

	slot3.discount_num:setString(TI18N("超值"))

	slot3.sold = slot3.main_container:getChildByName("sold")

	slot3.sold:setLocalZOrder(20)

	slot3.grey = slot3.main_container:getChildByName("grey")

	slot3.main_container:getChildByName("need_icon"):setVisible(false)
	slot3.main_container:getChildByName("need_label"):setVisible(false)

	slot3.discount_label = createRichLabel(20, 58, cc.p(0, 0), cc.p(133, 25))

	slot3.main_container:addChild(slot3.discount_label)

	slot3.lock_label = createRichLabel(26, 1, cc.p(0.5, 0.5), cc.p(slot1 * 0.5, slot2 * 0.5))

	slot3.main_container:addChild(slot3.lock_label, 99)

	slot3.goods_item = BackPackItem.new(true, true)

	slot3.goods_item:setPosition(10 + slot3.goods_item:getContentSize().width / 2, slot2 / 2)
	slot3.goods_item:setDefaultTip()
	slot3.main_container:addChild(slot3.goods_item)
	registerButtonEventListener(slot3, function ()
		uv0:setCellTouched(uv1)
	end, false, 0)

	function slot3.DeleteMe()
		if uv0.goods_item ~= nil then
			uv0.goods_item:DeleteMe()

			uv0.goods_item = nil
		end
	end

	return slot3
end

function MallActionWindow.numberOfCells(slot0)
	if not slot0.action_data_list then
		return 0
	end

	return #slot0.action_data_list[slot0.cur_index].exchange_list
end

function MallActionWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.action_data_list[slot0.cur_index].exchange_list[slot2] then
		return
	end

	if slot0.dic_item_config[slot3.expend_id] == nil then
		slot0.dic_item_config[slot3.expend_id] = Config.ItemData.data_get_data(slot3.expend_id)
	end

	slot1.name:setString(slot3.aim_str)

	if slot0.dic_item_config[slot3.expend_id] then
		slot5 = PathTool.getItemRes(slot4.icon, false)

		if slot1.record_cost_res == nil or slot1.record_cost_res ~= slot5 then
			loadSpriteTexture(slot1.coin, slot5, LOADTEXT_TYPE)
		end
	end

	slot1.price:setString(slot3.expend_num)

	if slot3.lable == 1 then
		slot1.discount:setVisible(true)
	else
		slot1.discount:setVisible(false)
	end

	slot5 = nil
	slot6 = 4

	for slot10, slot11 in pairs(slot3.aim_args) do
		if slot11.aim_args_key == 1 then
			slot5 = slot11.aim_args_val
		elseif slot11.aim_args_key == 2 then
			slot6 = slot11.aim_args_val
		end
	end

	slot7 = false

	if slot3.limit_buy <= slot3.buy_count then
		slot1.sold:setVisible(true)
		slot1.grey:setVisible(true)
		slot1.discount_label:setString("")

		slot7 = true
	else
		slot1.sold:setVisible(false)
		slot1.grey:setVisible(false)
		slot0:showLimitBuyInfo(slot1, slot3, slot6)
	end

	if slot3.sort_lock == 1 then
		slot1.grey:setVisible(true)

		if slot5 then
			if Config.MonopolyMapsData.data_customs[slot5] then
				slot1.lock_label:setString(string.format(TI18N("<div outline=2,#8D1404>解锁【%s】</div>"), slot8.name))
			end
		else
			slot1.lock_label:setString(string.format(TI18N("<div outline=2,#8D1404>未解锁</div>")))
		end

		slot1.is_lock = true
	else
		if not slot7 then
			slot1.grey:setVisible(false)
		end

		slot1.lock_label:setString("")

		slot1.is_lock = false
	end

	if slot3.item_list and #slot3.item_list > 0 then
		slot8 = slot3.item_list[1].bid
		slot1.bid = slot8

		slot1.goods_item:setBaseData(slot8, slot3.item_list[1].num, true)
	end
end

function MallActionWindow.setCellTouched(slot0, slot1)
	if not slot1.index then
		return
	end

	if not slot0.action_data_list[slot0.cur_index].exchange_list[slot1.index] then
		return
	end

	if slot1.is_lock then
		return
	end

	if slot2.limit_buy <= slot2.buy_count then
		return
	end

	if slot2.item_list and slot2.item_list[1] then
		-- Nothing
	end

	slot0.ctrl:openMallBuyWindow(true, {
		shop_type = MallConst.MallType.ActionShop,
		item_id = slot1.bid or 1,
		name = slot2.aim_str,
		limit_num = slot2.limit_buy,
		has_buy = slot2.buy_count,
		price = slot2.expend_num,
		pay_type = slot2.expend_id,
		is_show_limit_label = true,
		bid = slot0.action_data_list[slot0.cur_index].bid,
		aim = slot2.aim,
		item_num = slot2.item_list[1].num or 1
	})
end

function MallActionWindow.showLimitBuyInfo(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	if slot3 == 1 then
		slot1.discount_label:setString(uv0(TI18N("日限购%s/%s个"), slot2.buy_count, slot2.limit_buy))
	elseif slot3 == 2 then
		slot1.discount_label:setString(uv0(TI18N("周限购%s/%s个"), slot2.buy_count, slot2.limit_buy))
	elseif slot3 == 3 then
		slot1.discount_label:setString(uv0(TI18N("月限购%s/%s个"), slot2.buy_count, slot2.limit_buy))
	else
		slot1.discount_label:setString(uv0(TI18N("限购%s/%s个"), slot2.buy_count, slot2.limit_buy))
	end
end

function MallActionWindow.close_callback(slot0)
	if slot0.role_assets_event then
		if slot0.role_vo then
			slot0.role_vo:UnBind(slot0.role_assets_event)
		end

		slot0.role_assets_event = nil
		slot0.role_vo = nil
	end

	if slot0.common_scrollview then
		slot0.common_scrollview:DeleteMe()

		slot0.common_scrollview = nil
	end

	slot0.ctrl:openMallActionWindow(false)
end
