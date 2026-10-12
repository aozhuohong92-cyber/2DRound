ActionyearmonsterExchangeWindow = ActionyearmonsterExchangeWindow or BaseClass(BaseView)
slot1 = ActionyearmonsterController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert
slot5 = RoleController:getInstance():getRoleVo()

function ActionyearmonsterExchangeWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionyearmonster", "actionyearmonster"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("actionyearmonster", "actionyearmonster_ch"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/actionyearmonster", "actionyearmonster_exchang_bg"),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "actionyearmonster/actionyearmonster_exchange_panel"
end

function ActionyearmonsterExchangeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.banner_bg = slot0.main_panel:getChildByName("banner_bg")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.win_title = slot0.main_panel:getChildByName("win_title")

	slot0.win_title:setString(TI18N("集字兑换"))

	slot0.time_label = slot0.main_panel:getChildByName("label_time_key")

	slot0.time_label:setString(TI18N("海量奖励，限时兑换"))

	slot0.time_text = slot0.main_panel:getChildByName("label_time")

	slot0.time_text:setVisible(false)

	slot0.tips = slot0.main_panel:getChildByName("tips")

	slot0.tips:setString(TI18N("活动期间，收集指定文字可兑换超值道具组合"))

	slot0.btn_rule = slot0.main_panel:getChildByName("look_btn")

	slot0:loadBannerImage()

	slot1 = slot0.main_panel:getChildByName("scroll_panel")
	slot0.child_scrollview = CommonScrollViewLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		item_width = 596,
		start_x = 2,
		space_x = 0,
		row = 0,
		item_height = 129,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = ActionyearmonsterExchangeItem
	})

	slot0.child_scrollview:setSwallowTouches(false)
	uv0:sender28217()
end

function ActionyearmonsterExchangeWindow.loadBannerImage(slot0)
	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/actionyearmonster", "actionyearmonster_exchang_bg"), ResourcesType.single, function ()
			if not tolua.isnull(uv0.banner_bg) then
				loadSpriteTexture(uv0.banner_bg, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end
end

function ActionyearmonsterExchangeWindow.setPanelData(slot0)
	slot1 = slot0.start_unixtime or 0

	ActionController:getInstance():getModel():setCountDownTime(slot0.time_text, (slot0.end_unixtime or 0) - GameNet:getInstance():getTime())
end

function ActionyearmonsterExchangeWindow.setItemData(slot0)
	if slot0.child_scrollview then
		slot0.child_scrollview:setData(slot0:setConfigData())
	end
end

function ActionyearmonsterExchangeWindow.setConfigData(slot0)
	if Config.HolidayNianData.data_exchange == nil then
		return {}
	end

	for slot6, slot7 in pairs(slot2) do
		if uv0:getExchangeDataById(slot7.id) then
			if ({
				cfg = slot7,
				count = slot8.last_num or 0,
				flag = slot8.flag
			}).count <= 0 then
				slot9.sort = 1000000
			else
				slot9.sort = slot7.id
			end

			uv1(slot1, slot9)

			if slot0.start_unixtime ~= slot8.start_unixtime then
				slot0.start_unixtime = slot8.start_unixtime
			end

			if slot0.end_unixtime ~= slot8.end_unixtime then
				slot0.end_unixtime = slot8.end_unixtime
			end
		end
	end

	uv2(slot1, SortTools.tableCommonSorter({
		{
			"flag",
			true
		},
		{
			"sort",
			false
		}
	}))

	return slot1
end

function ActionyearmonsterExchangeWindow.register_event(slot0)
	if not slot0.update_exchange_data_event then
		slot0.update_exchange_data_event = GlobalEvent:getInstance():Bind(ActionyearmonsterEvent.UPDATE_EXCHANGE_DATA_EVENT, function ()
			if uv0.setItemData then
				uv0:setItemData()
			end
		end)
	end

	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openActionyearmonsterExchangeWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openActionyearmonsterExchangeWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.HolidayNianData.data_const.exchange_desc.desc, slot1:getTouchBeganPosition(), nil, , 500)
	end, true, 1)
end

function ActionyearmonsterExchangeWindow.openRootWnd(slot0)
end

function ActionyearmonsterExchangeWindow.close_callback(slot0)
	doStopAllActions(slot0.time_text)

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.child_scrollview then
		slot0.child_scrollview:DeleteMe()
	end

	slot0.child_scrollview = nil

	if slot0.update_exchange_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_exchange_data_event)

		slot0.update_exchange_data_event = nil
	end

	uv0:openActionyearmonsterExchangeWindow(false)
end

ActionyearmonsterExchangeItem = class("ActionyearmonsterExchangeItem", function ()
	return ccui.Widget:create()
end)

function ActionyearmonsterExchangeItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ActionyearmonsterExchangeItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("actionyearmonster/actionyearmonster_exchange_item"))

	slot0:setContentSize(cc.size(596, 129))
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.txt_task = slot1:getChildByName("txt_task")

	slot0.txt_task:setString("")

	slot0.btn_exchange = slot1:getChildByName("btn_exchange")
	slot0.txt_exchange = slot0.btn_exchange:getChildByName("txt_exchange")

	slot0.txt_exchange:setString(TI18N("兑换"))

	slot0.img_has_get = slot1:getChildByName("img_has_get")

	slot0.img_has_get:setVisible(false)

	slot0.cost_good_cons = slot1:getChildByName("cost_good_cons")

	slot0.cost_good_cons:setScrollBarEnabled(false)

	slot0.time_lab = createRichLabel(18, 1, cc.p(0.5, 0.5), cc.p(528, 18), 5, nil, 200)

	slot1:addChild(slot0.time_lab)

	slot0.get_good_cons = slot1:getChildByName("get_good_cons")
	slot0.get_item_scrollview = CommonScrollViewLayout.new(slot0.get_good_cons, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.get_good_cons:getContentSize(), {
		start_y = 4,
		start_x = 3,
		space_x = 5,
		row = 1,
		space_y = 4,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.get_item_scrollview:setSwallowTouches(false)
end

function ActionyearmonsterExchangeItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_exchange, function ()
		uv0:btnExchange()
	end, true, 1)
end

function ActionyearmonsterExchangeItem.btnExchange(slot0)
	if slot0.data and slot0.data.cfg and slot0.data.cfg.gain and slot0.data.cfg.gain[1] and slot0.data.cfg.loss then
		for slot5, slot6 in pairs(slot0.data.cfg.loss) do
			slot8 = slot0.loss_num_list[slot6[1]]

			if uv0:getActionAssetsNumByBid(slot6[1]) and slot8 then
				if nil == nil then
					slot1 = math.floor(slot7 / slot8)
				elseif math.floor(slot7 / slot8) < slot1 then
					slot1 = math.floor(slot7 / slot8)
				end
			end
		end

		slot2 = slot0.data.count

		if slot1 < slot0.data.count then
			slot2 = slot1
		end

		if slot2 <= 0 then
			message(TI18N("道具不足"))

			return
		end

		MallController:getInstance():openMallBuyWindow(true, {
			bid = slot0.data.charge_id,
			item_bid = slot0.data.cfg.gain[1][1],
			quantity = slot0.data.cfg.gain[1][2],
			shop_type = MallConst.MallType.ActionYearMonsterExchange,
			limit_num = slot2,
			has_buy = 0,
			is_show_limit_label = true,
			name = Config.ItemData.data_get_data(slot0.data.cfg.gain[1][1]).name,
			aim = slot0.data.charge_id or 0,
			pay_type = 3,
			price = 1
		})
	end
end

function ActionyearmonsterExchangeItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0:setChangeData(slot1)
end

function ActionyearmonsterExchangeItem.setChangeData(slot0, slot1)
	slot0.data = slot1
	slot0.data.charge_id = slot1.cfg.id
	slot5 = TI18N

	slot0.txt_task:setString(slot5(uv0("剩余:%d", slot1.count)))

	slot0.loss_num_list = {}

	for slot5, slot6 in pairs(slot1.cfg.loss) do
		slot0.loss_num_list[slot6[1]] = slot6[2]
	end

	slot0:updateCostItemList(slot1.cfg.loss)
	slot0:updateGetItemList(slot0.get_item_scrollview, slot1.cfg.gain)
	slot0.btn_exchange:setTouchEnabled(slot1.count ~= 0 and slot1.flag == 1)

	slot3 = false

	if slot1.cfg.end_unixtime - GameNet:getInstance():getTime() <= 0 then
		slot3 = true
	end

	if slot1.count == 0 or slot1.flag ~= 1 or slot3 == true then
		setChildUnEnabled(true, slot0.btn_exchange)
		slot0.txt_exchange:disableEffect(cc.LabelEffect.OUTLINE)
	else
		setChildUnEnabled(false, slot0.btn_exchange)
		slot0.txt_exchange:enableOutline(Config.ColorData.data_color4[277], 2)
	end

	if slot1.flag == 1 then
		slot0.time_lab:setString(uv0(TI18N("限时:<div fontcolor=#6CD228 fontsize=18 >%s</div>"), TimeTool.GetTimeFormatDayIIIIII(slot2)))
	elseif slot3 == true then
		slot0.time_lab:setString(TI18N("已结束"))
	else
		slot0.time_lab:setString(uv0(TI18N("%s开启"), TimeTool.getMD2(slot1.cfg.start_unixtime)))
	end
end

function ActionyearmonsterExchangeItem.updateCostItemList(slot0, slot1)
	slot0.buy_item_list = commonShowSingleRowItemList(slot0.cost_good_cons, slot0.buy_item_list, slot1, {
		scale = 0.7,
		max_count = 4,
		is_center = false,
		space_x = 0,
		start_x = -5,
		is_show_bg = false
	})

	delayRun(slot0.cost_good_cons, 0.06666666666666667, function ()
		if uv0.buy_item_list then
			for slot3, slot4 in pairs(uv0.buy_item_list) do
				if slot4 and not tolua.isnull(slot4) then
					if slot4.item_icon and not tolua.isnull(slot4.item_icon) then
						slot4.item_icon:setScale(1.3)
					end

					if slot4.cur_num_lab == nil then
						slot5 = createLabel(20, 1, nil, slot4:getRoot():getContentSize().width / 2, 5, "", slot4:getRoot(), nil, cc.p(0.5, 1))

						slot5:setScale(1.3)

						slot4.cur_num_lab = slot5
					end

					if slot4:getData() and uv0.loss_num_list then
						slot7 = uv0.loss_num_list[slot5.id]

						if uv1:getActionAssetsNumByBid(slot5.id) and slot7 then
							slot4.cur_num_lab:setString(uv2("%d/%d", slot7, slot6))

							if slot6 - slot7 >= 0 then
								slot4:setItemIconUnEnabled(false)
								slot4.cur_num_lab:setTextColor(cc.c4b(149, 83, 34, 255))
							else
								slot4:setItemIconUnEnabled(true)
								slot4.cur_num_lab:setTextColor(cc.c4b(217, 80, 20, 255))
							end
						end
					end
				end
			end
		end
	end)
end

function ActionyearmonsterExchangeItem.updateGetItemList(slot0, slot1, slot2)
	slot3 = {}

	for slot7, slot8 in pairs(slot2) do
		table.insert(slot3, {
			bid = slot8[1],
			quantity = slot8[2]
		})
	end

	slot1:setData(slot3)
	slot1:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0:getItemList()) do
			slot5:setDefaultTip(true, false)
			slot5:setSwallowTouches(false)
		end
	end)

	if #slot2 <= 2 then
		slot1:setTouchEnabled(false)
	end
end

function ActionyearmonsterExchangeItem.DeleteMe(slot0)
	doStopAllActions(slot0.cost_good_cons)

	if slot0.get_item_scrollview then
		slot0.get_item_scrollview:DeleteMe()

		slot0.get_item_scrollview = nil
	end

	if slot0.buy_item_list then
		for slot4, slot5 in pairs(slot0.buy_item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end

		slot0.buy_item_list = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
