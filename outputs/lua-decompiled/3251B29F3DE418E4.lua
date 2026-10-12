PractiseTowerWindow = PractiseTowerWindow or BaseClass(BaseView)
slot0 = table.insert

function PractiseTowerWindow.__init(slot0)
	slot0.ctrl = PractisetowerController:getInstance()
	slot0.is_full_screen = true
	slot0.layout_name = "practisetower/practise_tower_window"
	slot0.cur_type = 0
	slot0.win_type = WinType.Full
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("practisetower", "practisetower"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("practisetower", "practisetower_bg_2"),
			type = ResourcesType.single
		}
	}
	slot0.tab_list = {}
	slot0.select_type = 1
	slot0.view_list = {}
	slot0.is_change = false
	slot0.top3_item_list = {}
	slot0.cell_data_list = {}
	slot0.bg_param = 3
	slot0.cur_id = 0
end

function PractiseTowerWindow.open_callback(slot0)
	slot0.mainContainer = slot0.root_wnd:getChildByName("main_container")
	slot1 = display.getTop(slot0.mainContainer)
	slot2 = display.getBottom(slot0.mainContainer)
	slot3 = MainuiController:getInstance():getMainUi():getTopViewHeight()
	slot4 = MainuiController:getInstance():getMainUi():getBottomHeight()
	slot0.mainContainer_size = slot0.mainContainer:getContentSize()
	slot0.bg = slot0.mainContainer:getChildByName("bg")

	if slot0.bg ~= nil then
		slot0.bg:setScale(display.getMaxScale())
		slot0.bg:setPositionY(slot1)
	end

	slot0.container = slot0.mainContainer:getChildByName("container")
	slot0.black_bg = slot0.mainContainer:getChildByName("black_bg")
	slot0.close_btn = slot0.black_bg:getChildByName("close_btn")
	slot0.buy_panel = slot0.black_bg:getChildByName("buy_panel")

	slot0.buy_panel:setVisible(false)
	slot0.buy_panel:getChildByName("key"):setString(TI18N("挑战次数："))

	slot0.buy_count = slot0.buy_panel:getChildByName("label")
	slot0.buy_btn = slot0.buy_panel:getChildByName("add_btn")
	slot0.buy_tips = createRichLabel(20, cc.c4b(255, 245, 240, 255), cc.p(0.5, 0.5), cc.p(-14, -20), nil, nil, 600)

	slot0.buy_panel:addChild(slot0.buy_tips)

	slot0.top_panel = slot0.mainContainer:getChildByName("top_panel")
	slot0.title_lab = slot0.top_panel:getChildByName("title_lab")

	slot0.title_lab:setString(TI18N("兔丼监狱"))
	UITool.SetTitleColor(slot0.title_lab)

	slot0.rank_container = slot0.black_bg:getChildByName("rank_container")
	slot0.rank_desc_label = createRichLabel(20, 1, cc.p(0, 0.5), cc.p(35, 20), nil, nil, 400)

	slot0.rank_container:addChild(slot0.rank_desc_label)

	slot0.award_panel = slot0.top_panel:getChildByName("award_panel")
	slot0.award_title = slot0.award_panel:getChildByName("award_title")
	slot0.item_scrollview = slot0.award_panel:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)
	slot0.item_scrollview:setSwallowTouches(false)
	slot0.black_bg:setPositionY(slot2)
	slot0.top_panel:setPositionY(slot1)
	slot0.container:setPositionY(slot2 + 70)
	slot0.container:setContentSize(cc.size(720, slot1 - slot2 - 70 - 50))
end

function PractiseTowerWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0.ctrl:openMainView(false)
	end, true, 2)
	registerButtonEventListener(slot0.rank_container, function ()
		uv0.ctrl:openRankWindow(true)
	end, true, 1)
	registerButtonEventListener(slot0.buy_btn, function ()
		function slot0()
			uv0.ctrl:sender29104()
		end

		if (uv0.ctrl:getModel():getBuyCount() or 0) <= 0 then
			message(TI18N("购买次数已达上限"))
		else
			slot3 = RoleController:getInstance():getRoleVo()

			if Config.HolidayPractiseTowerData.data_const.holiday_practise_tower_buy_loss and slot2.val and slot2.val[1] and slot2.val[1][1] and slot2.val[1][2] and slot3 then
				if slot2.val[1][2] <= slot3.gold then
					if Config.ItemData.data_get_data(slot2.val[1][1]) and slot7.icon then
						CommonAlert.show(string.format(TI18N("是否花费<img src='%s' scale=0.25 />%s购买一次挑战次数？"), PathTool.getItemRes(slot7.icon), slot2.val[1][2] or 0), TI18N("确定"), slot0, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, 24)
					end
				else
					slot5 = nil

					if (type(slot2.val[1][1]) ~= "number" or Config.ItemData.data_get_data(slot6)) and Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id[slot6]) then
						if slot5.id == Config.ItemData.data_assets_label2id.gold then
							if FILTER_CHARGE then
								message(TI18N("钻石不足"))
							else
								CommonAlert.show(string.format(TI18N("%s不足，是否前往充值？"), slot5.name), TI18N("确定"), function ()
									VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
								end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, nil, true)
							end
						else
							BackpackController:getInstance():openTipsSource(true, slot5)
						end
					end
				end
			end
		end
	end, true, 1)
	slot0:addGlobalEvent(PractisetowerEvent.Update_All_Data, function ()
		uv0.pt_data = uv0.ctrl:getModel():getPractiseTowerData()

		uv0:updateTowerList(true)
		uv0:updateCount()
		uv0:updateRank()
		uv0:updateAwardInfo()
	end)
	slot0:addGlobalEvent(PractisetowerEvent.Update_My_rank, function ()
		uv0.pt_data = uv0.ctrl:getModel():getPractiseTowerData()

		uv0:updateRank()
	end)
end

function PractiseTowerWindow.updateCount(slot0)
	slot0.buy_count:setString(string.format("%s/%s", slot0.ctrl:getModel():getTowerLessCount() or 0, Config.HolidayPractiseTowerData.data_const.holiday_practise_tower_free_time.val or 0))
	slot0.buy_tips:setString(string.format(TI18N("<div outline=1,#552e20>今日可购买次数：%s</div>"), slot0.ctrl:getModel():getBuyCount() or 0))

	if slot0.pt_data and slot0.pt_data.last_unixtime - GameNet:getInstance():getTime() <= 0 then
		slot0.buy_panel:setVisible(false)
		slot0.rank_container:setPositionY(150)
	else
		slot0.buy_panel:setVisible(true)
		slot0.rank_container:setPositionY(201.57)
	end
end

function PractiseTowerWindow.openRootWnd(slot0)
	slot0.pt_data = slot0.ctrl:getModel():getPractiseTowerData()

	if slot0.pt_data ~= nil then
		slot0:updateTowerList(true)
	end

	slot0.ctrl:sender29100()
	slot0.ctrl:sender29107(2)
end

function PractiseTowerWindow.updateTowerList(slot0, slot1)
	slot0.max_count = #Config.HolidayPractiseTowerData.data_tower

	if not slot0.list_view then
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.bottom, slot0.container:getContentSize(), {
			start_y = -180,
			once_num = 1,
			start_x = 0,
			col = 1,
			delay = 4,
			space_x = 0,
			item_width = 720,
			row = 0,
			item_height = 331,
			space_y = 0,
			end_y = 300
		}, cc.p(0, 0))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.list_view:setSwallowTouches(false)
		slot0.list_view:setBounceEnabled(false)
	end

	if slot0.ctrl:getModel():getNowTowerId() > 0 then
		slot2 = slot2 + 1
	end

	if slot1 and not slot0.is_init_list then
		slot0.is_init_list = true
		slot0.cell_data_list = deepCopy(Config.HolidayPractiseTowerData.data_tower)

		uv0(slot0.cell_data_list, 1, {
			id = 0,
			type = 2
		})
		uv0(slot0.cell_data_list, {
			type = 1,
			id = slot0.max_count + 1
		})
		slot0.list_view:reloadData(slot2)
		slot0.list_view:jumpToMoveByIndex(slot2)
	else
		slot0.list_view:resetCurrentItems()

		if slot0.pt_data and slot0.cur_id ~= slot0.pt_data.id then
			slot0.list_view:jumpToMoveByIndex(slot2)

			slot0.cur_id = slot0.pt_data.id
		end
	end
end

function PractiseTowerWindow.createNewCell(slot0, slot1, slot2)
	return PractisetowerItem.new()
end

function PractiseTowerWindow.numberOfCells(slot0)
	if not slot0.cell_data_list then
		return 0
	end

	return #slot0.cell_data_list
end

function PractiseTowerWindow.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.cell_data_list then
		return
	end

	slot1.index = slot2

	if not slot0.cell_data_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function PractiseTowerWindow.updateAwardInfo(slot0)
	if not Config.HolidayPractiseTowerData.data_const.special_floor or not slot1.val or not slot0.pt_data then
		return
	end

	for slot6, slot7 in pairs(slot1.val) do
		if slot7 >= slot0.pt_data.id + 1 and slot7 < (slot1.val[#slot1.val] or 40) then
			slot2 = slot7
		end
	end

	slot3 = {}

	if Config.HolidayPractiseTowerData.data_tower[slot2] then
		slot3 = slot4.reward

		slot0.award_title:setString(string.format(TI18N("%d层奖励"), slot4.id))
	end

	slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot3, {
		scale = 0.65,
		max_count = 2,
		is_center = true,
		show_effect_id = 263
	})
end

function PractiseTowerWindow.updateRank(slot0)
	if not slot0.pt_data then
		return
	end

	if (slot0.pt_data.role_rank or 0) == 0 then
		slot1 = TI18N("未上榜")
	end

	slot0.rank_desc_label:setString(string.format(TI18N("<div outline=2,#d87a00 >当前排名：%s</div>"), slot1))
end

function PractiseTowerWindow.close_callback(slot0)
	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	slot0.ctrl:openMainView(false)

	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	slot0.select_item = nil
end
