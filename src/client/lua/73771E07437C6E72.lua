slot1 = HomeworldController:getInstance():getModel()
slot2 = table.insert
HomeworldMyUnit = HomeworldMyUnit or BaseClass()

function HomeworldMyUnit.__init(slot0, slot1)
	slot0.parent = slot1

	slot0:createRoorWnd()
	slot0:registerEvent()

	slot0.my_all_unit_data = {}
end

function HomeworldMyUnit.createRoorWnd(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("homeworld/homeworld_my_unit"))

	slot0.root_wnd:setPosition(cc.p(0, 185))
	slot0.parent:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.image_bg = slot0.container:getChildByName("image_bg")
	slot0.type_btn_panel = slot0.container:getChildByName("type_btn_panel")
	slot0.comfort_label = slot0.container:getChildByName("cur_soft_panel"):getChildByName("comfort_label")
	slot3 = slot0.container:getChildByName("grid_num_panel")

	slot3:getChildByName("grid_num_title"):setString(TI18N("地面可用格子数:"))

	slot0.grid_num_txt = slot3:getChildByName("grid_num_txt")
	slot0.unit_panel = slot0.container:getChildByName("unit_panel")
	slot0.sub_btn_panel = slot0.unit_panel:getChildByName("sub_btn_panel")
	slot0.unit_list = slot0.unit_panel:getChildByName("unit_list")
	slot0.plan_panel = slot0.container:getChildByName("plan_panel")
	slot0.plan_tips_txt = slot0.plan_panel:getChildByName("tips_txt")

	slot0.plan_tips_txt:setString(TI18N("可将你当前的宅室布置保存为方案"))

	slot0.plan_list = slot0.plan_panel:getChildByName("plan_list")
	slot0.book_panel = slot0.container:getChildByName("book_panel")
	slot0.book_tips_txt = slot0.book_panel:getChildByName("tips_txt")

	slot0.book_tips_txt:setString(TI18N("集齐指定数量的主题家具可获得收集奖励！"))

	slot0.book_list = slot0.book_panel:getChildByName("book_list")
	slot0.clear_btn = slot0.container:getChildByName("clear_btn")

	slot0.clear_btn:getChildByName("label"):setString(TI18N("清空装饰"))

	slot0.save_btn = slot0.container:getChildByName("save_btn")

	slot0.save_btn:getChildByName("label"):setString(TI18N("保存"))
	slot0.save_btn:setName("guide_save_btn")
	slot0:initTypeBtnList()
end

function HomeworldMyUnit.registerEvent(slot0)
	registerButtonEventListener(slot0.clear_btn, function ()
		CommonAlert.show(TI18N("确定是否清空所有家具？（墙壁、地板不会被清空）"), TI18N("确定"), function ()
			uv0:_onClickClearBtn()
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, nil, true)
	end, true)
	registerButtonEventListener(slot0.save_btn, function ()
		GlobalEvent:getInstance():Fire(HomeworldEvent.Save_My_Home_Data_Event)
	end, true)

	if not slot0.discharge_unit_event then
		slot0.discharge_unit_event = GlobalEvent:getInstance():Bind(HomeworldEvent.Discharge_Furniture_Event, function (slot0)
			if not uv0.cur_show_status then
				return
			end

			uv0:updateCurSoft()
			uv0:checkNeedUpdateItemNum(slot0, 1)
		end)
	end

	if not slot0.add_unit_event then
		slot0.add_unit_event = GlobalEvent:getInstance():Bind(HomeworldEvent.Add_Furniture_Event, function (slot0)
			if not uv0.cur_show_status then
				return
			end

			uv0:updateCurSoft()
			uv0:checkNeedUpdateItemNum(slot0, 2)
		end)
	end

	if not slot0.update_add_good_event then
		slot0.update_add_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.HOME then
				return
			end

			if not uv0.cur_show_status then
				return
			end

			uv0:checkAddMyUnitItem(slot1)
		end)
	end

	if not slot0.update_delete_good_event then
		slot0.update_delete_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.HOME then
				return
			end

			if not uv0.cur_show_status then
				return
			end

			uv0:checkDeleteMyUnitItem(slot1)
		end)
	end

	if not slot0.update_modify_good_event then
		slot0.update_modify_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.HOME then
				return
			end

			if not uv0.cur_show_status then
				return
			end

			uv0:checkUpdateBagItemNum(slot1)
		end)
	end

	if not slot0.update_red_status_event then
		slot0.update_red_status_event = GlobalEvent:getInstance():Bind(HomeworldEvent.Update_Red_Status_Data, function (slot0, slot1)
			if slot0 == HomeworldConst.Red_Index.Suit then
				uv0:updateSuitAwardRedStatus()
			end
		end)
	end
end

function HomeworldMyUnit.checkNeedUpdateItemNum(slot0, slot1, slot2)
	if not slot0.unit_scrollview then
		return
	end

	slot3 = false

	for slot7, slot8 in pairs(slot0.my_all_unit_data) do
		if slot8.base_id == slot1 then
			slot3 = true

			if (slot2 or 1) == 1 then
				slot8.have_num = slot8.have_num + 1
			else
				slot8.have_num = slot8.have_num - 1

				if slot8.have_num <= 0 then
					slot8.have_num = 0
				end
			end
		end
	end

	if slot3 then
		slot0.unit_scrollview:resetCurrentItems()
	end
end

function HomeworldMyUnit.checkUpdateBagItemNum(slot0, slot1)
	if not slot0.unit_scrollview then
		return
	end

	slot2 = false

	for slot6, slot7 in pairs(slot1) do
		for slot11, slot12 in pairs(slot0.my_all_unit_data) do
			if slot12.base_id == slot7.base_id then
				slot12.bag_num = slot7.quantity
				slot12.have_num = slot12.have_num + slot7.quantity - slot12.bag_num
				slot2 = true

				break
			end
		end
	end

	if slot2 then
		slot0.unit_scrollview:resetCurrentItems()
	end
end

function HomeworldMyUnit._onClickClearBtn(slot0)
	GlobalEvent:getInstance():Fire(HomeworldEvent.Clear_All_Furniture_Event)

	slot0.my_all_unit_data = {}

	for slot5, slot6 in pairs(BackpackController:getInstance():getModel():getBagItemList(BackPackConst.Bag_Code.HOME)) do
		uv0(slot0.my_all_unit_data, deepCopy(slot6))
	end

	for slot5, slot6 in pairs(slot0.my_all_unit_data) do
		slot6.bag_num = slot6.quantity or 0
		slot6.have_num = slot6.quantity or 0
	end

	for slot6, slot7 in pairs(uv1:getOtherStoreyFurnitureData()) do
		slot8 = false

		for slot12, slot13 in pairs(slot0.my_all_unit_data) do
			if slot13.base_id == slot7.bid then
				slot8 = true

				break
			end
		end

		if not slot8 then
			slot10 = GoodsVo.New()

			slot10:initAttrData({
				base_id = slot7.bid,
				bag_num = 0,
				have_num = 0
			})
			uv0(slot0.my_all_unit_data, slot10)
		end
	end

	for slot7, slot8 in pairs(uv1:getMyHomeFurnitureData()) do
		slot9 = false

		for slot13, slot14 in pairs(slot0.my_all_unit_data) do
			if slot14.base_id == slot8.bid then
				slot14.have_num = slot14.have_num + 1
				slot9 = true

				break
			end
		end

		if not slot9 then
			slot11 = GoodsVo.New()

			slot11:initAttrData({
				base_id = slot8.bid,
				bag_num = 0,
				have_num = 1
			})
			uv0(slot0.my_all_unit_data, slot11)
		end
	end

	if uv1:getMyHomeWallId() and slot4 ~= 0 then
		slot5 = false

		for slot9, slot10 in pairs(slot0.my_all_unit_data) do
			if slot10.base_id == slot4 then
				slot5 = true

				break
			end
		end

		if not slot5 then
			slot7 = GoodsVo.New()

			slot7:initAttrData({
				base_id = slot4,
				bag_num = 0,
				have_num = 0
			})
			uv0(slot0.my_all_unit_data, slot7)
		end
	end

	if uv1:getMyHomeFloorId() and slot5 ~= 0 then
		slot6 = false

		for slot10, slot11 in pairs(slot0.my_all_unit_data) do
			if slot11.base_id == slot5 then
				slot6 = true

				break
			end
		end

		if not slot6 then
			slot8 = GoodsVo.New()

			slot8:initAttrData({
				base_id = slot5,
				bag_num = 0,
				have_num = 0
			})
			uv0(slot0.my_all_unit_data, slot8)
		end
	end

	slot0:updateMyUnitShowData()
	slot0.unit_scrollview:reloadData(nil, nil, true)
end

function HomeworldMyUnit.checkAddMyUnitItem(slot0, slot1)
	if not slot0.unit_scrollview then
		return
	end

	slot2 = false

	for slot6, slot7 in pairs(slot1) do
		slot8 = false

		for slot12, slot13 in pairs(slot0.my_all_unit_data) do
			if slot13.base_id == slot7.base_id then
				slot13.bag_num = slot13.bag_num + 1
				slot13.have_num = slot13.have_num + 1
				slot8 = true

				break
			end
		end

		if not slot8 then
			slot9.bag_num = deepCopy(slot7).quantity or 0
			slot9.have_num = slot9.quantity or 0

			uv0(slot0.my_all_unit_data, slot9)

			slot2 = true
		end
	end

	if slot2 then
		slot0:updateMyUnitShowData()
		slot0.unit_scrollview:reloadData(nil, nil, true)
	else
		slot0.unit_scrollview:resetCurrentItems()
	end
end

function HomeworldMyUnit.checkDeleteMyUnitItem(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot1) do
		for slot11 = #slot0.my_all_unit_data, 1, -1 do
			if slot0.my_all_unit_data[slot11].base_id == slot7.base_id then
				slot12.have_num = slot12.have_num - slot12.bag_num
				slot12.bag_num = 0

				if slot12.have_num == 0 and not uv0:checkCurHomeIsHaveUnitByBid(slot12.base_id) then
					table.remove(slot0.my_all_unit_data, slot11)
				end

				slot2 = true

				break
			end
		end
	end

	if slot2 then
		slot0:updateMyUnitShowData()
		slot0.unit_scrollview:reloadData(nil, nil, true)
	end
end

function HomeworldMyUnit.open(slot0)
	slot0:updateCurSoft()

	if not slot0.unit_scrollview then
		return
	end

	slot0:initAllUnitData()
	slot0:updateMyUnitShowData()
	slot0.unit_scrollview:reloadData(nil, nil, true)
end

function HomeworldMyUnit.initAllUnitData(slot0)
	slot0.my_all_unit_data = {}

	for slot5, slot6 in pairs(BackpackController:getInstance():getModel():getBagItemList(BackPackConst.Bag_Code.HOME)) do
		uv0(slot0.my_all_unit_data, deepCopy(slot6))
	end

	for slot5, slot6 in pairs(slot0.my_all_unit_data) do
		slot6.bag_num = slot6.quantity or 0
		slot6.have_num = slot6.quantity or 0
	end

	for slot6, slot7 in pairs(uv1:getMyHomeFurnitureData()) do
		if BackpackController:getInstance():getModel():getItemNumByBid(slot7.bid, BackPackConst.Bag_Code.HOME) <= 0 then
			slot9 = false

			for slot13, slot14 in pairs(slot0.my_all_unit_data) do
				if slot14.base_id == slot7.bid then
					slot9 = true

					break
				end
			end

			if not slot9 then
				slot11 = GoodsVo.New()

				slot11:initAttrData({
					base_id = slot7.bid,
					bag_num = 0,
					have_num = 0
				})
				uv0(slot0.my_all_unit_data, slot11)
			end
		end
	end

	for slot7, slot8 in pairs(uv1:getOtherStoreyFurnitureData()) do
		slot9 = false

		for slot13, slot14 in pairs(slot0.my_all_unit_data) do
			if slot14.base_id == slot8.bid then
				slot9 = true

				break
			end
		end

		if not slot9 then
			slot11 = GoodsVo.New()

			slot11:initAttrData({
				base_id = slot8.bid,
				bag_num = 0,
				have_num = 0
			})
			uv0(slot0.my_all_unit_data, slot11)
		end
	end

	if uv1:getMyHomeWallId() and slot4 ~= 0 then
		slot5 = false

		for slot9, slot10 in pairs(slot0.my_all_unit_data) do
			if slot10.base_id == slot4 then
				slot5 = true

				break
			end
		end

		if not slot5 then
			slot7 = GoodsVo.New()

			slot7:initAttrData({
				base_id = slot4,
				bag_num = 0,
				have_num = 0
			})
			uv0(slot0.my_all_unit_data, slot7)
		end
	end

	if uv1:getMyHomeFloorId() and slot5 ~= 0 then
		slot6 = false

		for slot10, slot11 in pairs(slot0.my_all_unit_data) do
			if slot11.base_id == slot5 then
				slot6 = true

				break
			end
		end

		if not slot6 then
			slot8 = GoodsVo.New()

			slot8:initAttrData({
				base_id = slot5,
				bag_num = 0,
				have_num = 0
			})
			uv0(slot0.my_all_unit_data, slot8)
		end
	end
end

function HomeworldMyUnit.initTypeBtnList(slot0)
	slot0.tab_array = {
		{
			index = 1,
			title = TI18N("装饰")
		},
		{
			index = 3,
			title = TI18N("图鉴")
		}
	}
	slot1 = slot0.type_btn_panel:getContentSize()
	slot0.tab_scrollview = CommonScrollViewLayout.new(slot0.type_btn_panel, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot1.width, slot1.height), {
		start_y = 0,
		item_width = 149,
		start_x = 0,
		space_x = -5,
		row = 1,
		item_height = 61,
		space_y = 0,
		col = 0,
		item_class = CommonTabBtn
	})

	slot0.tab_scrollview:setData(slot0.tab_array, handler(slot0, slot0._onClickTabBtn), nil, {
		red_scale = 0.7,
		default_index = 1,
		tab_size = cc.size(149, 61),
		red_offset = cc.p(7, -4),
		title_offset = cc.p(0, -5)
	})
	slot0.tab_scrollview:setClickEnabled(#slot0.tab_array > 4)
	slot0.tab_scrollview:addEndCallBack(function ()
		uv0.tab_btn_list = uv0.tab_scrollview:getItemList()

		uv0:updateSuitAwardRedStatus()
	end)
end

function HomeworldMyUnit._onClickTabBtn(slot0, slot1)
	if slot0.cur_tab_btn then
		slot0.cur_tab_btn:setBtnSelectStatus(false)
	end

	if slot1 then
		slot0.cur_tab_btn = slot1

		slot0.cur_tab_btn:setBtnSelectStatus(true)
		slot0:updateSubTabBtn(slot1.index)
	end
end

function HomeworldMyUnit.updateSubTabBtn(slot0, slot1)
	if slot1 == 1 then
		slot0.image_bg:setContentSize(cc.size(669, 184))

		if not slot0._init_unit then
			slot0._init_unit = true

			slot0:initUnitPanel()
		end
	elseif slot1 == 2 then
		slot0.image_bg:setContentSize(cc.size(669, 208))

		if not slot0._init_plan then
			slot0._init_plan = true

			slot0:initPlanPanel()
		end
	elseif slot1 == 3 then
		slot0.image_bg:setContentSize(cc.size(669, 208))

		if not slot0._init_book then
			slot0._init_book = true

			slot0:initBookPanel()
		end
	end

	slot0.unit_panel:setVisible(slot1 == 1)
	slot0.plan_panel:setVisible(slot1 == 2)
	slot0.book_panel:setVisible(slot1 == 3)
end

function HomeworldMyUnit.initUnitPanel(slot0)
	slot1 = slot0.unit_list:getContentSize()
	slot0.unit_scrollview = CommonScrollViewSingleLayout.new(slot0.unit_list, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot1.width, slot1.height), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 5,
		item_width = 155,
		item_height = 172,
		space_y = 0,
		col = 1,
		need_dynamic = true
	})

	slot0.unit_scrollview:setSwallowTouches(true)
	slot0.unit_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCellUnit), ScrollViewFuncType.CreateNewCell)
	slot0.unit_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCellsUnit), ScrollViewFuncType.NumberOfCells)
	slot0.unit_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateCellByIndexUnit), ScrollViewFuncType.UpdateCellByIndex)
	slot0:initAllUnitData()

	slot0.sub_tab_array = {
		{
			index = 1,
			title = TI18N("墙壁")
		},
		{
			index = 2,
			title = TI18N("地板")
		},
		{
			index = 3,
			title = TI18N("墙饰")
		},
		{
			index = 4,
			title = TI18N("家具")
		},
		{
			index = 5,
			title = TI18N("地毯")
		}
	}

	if not slot0.sub_tab_scrollview then
		slot4 = slot0.sub_btn_panel:getContentSize()
		slot0.sub_tab_scrollview = CommonSubBtnList.new(slot0.sub_btn_panel, cc.p(0.5, 0.5), cc.p(slot4.width * 0.5, slot4.height * 0.5), cc.size(101, 50), handler(slot0, slot0._onClickSubTabBtn))
	end

	slot0.sub_tab_scrollview:setData(slot0.sub_tab_array, 1)
	slot0.sub_tab_scrollview:setGuideName("my_unit_")
end

function HomeworldMyUnit._createNewCellUnit(slot0)
	slot1 = HomeworldMyUnitItem.new()

	slot1:addCallBack(handler(slot0, slot0._onClickMyUnitCallback))

	return slot1
end

function HomeworldMyUnit._numberOfCellsUnit(slot0)
	if not slot0.show_unit_data then
		return 0
	end

	return #slot0.show_unit_data
end

function HomeworldMyUnit._updateCellByIndexUnit(slot0, slot1, slot2)
	if not slot0.show_unit_data then
		return
	end

	slot1.index = slot2

	if not slot0.show_unit_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function HomeworldMyUnit._onClickMyUnitCallback(slot0, slot1)
	for slot5, slot6 in pairs(slot0.my_all_unit_data) do
		if slot6.base_id == slot1 then
			slot6.quantity = slot6.quantity - 1
			is_have = true

			break
		end
	end

	GlobalEvent:getInstance():Fire(HomeworldEvent.Add_One_Furniture_Event, slot1)
end

function HomeworldMyUnit._onClickSubTabBtn(slot0, slot1)
	if slot0.cur_myunit_index and slot0.cur_myunit_index == slot1 then
		return
	end

	slot0.cur_myunit_index = slot1

	slot0:updateMyUnitShowData()
	slot0.unit_scrollview:reloadData()
end

function HomeworldMyUnit.updateMyUnitShowData(slot0)
	if not slot0.cur_myunit_index then
		return
	end

	slot1 = nil

	if slot0.cur_myunit_index == 1 then
		slot1 = HomeworldConst.Unit_Type.Wall
	elseif slot0.cur_myunit_index == 2 then
		slot1 = HomeworldConst.Unit_Type.Floor
	elseif slot0.cur_myunit_index == 3 then
		slot1 = HomeworldConst.Unit_Type.WallAcc
	elseif slot0.cur_myunit_index == 4 then
		slot1 = HomeworldConst.Unit_Type.Furniture
	elseif slot0.cur_myunit_index == 5 then
		slot1 = HomeworldConst.Unit_Type.Carpet
	end

	if slot1 and slot0.my_all_unit_data then
		slot0.show_unit_data = {}

		for slot5, slot6 in pairs(slot0.my_all_unit_data) do
			if slot6.unit_type == slot1 then
				uv0(slot0.show_unit_data, slot6)
			end
		end

		table.sort(slot0.show_unit_data, SortTools.KeyLowerSorter("bid"))
	end
end

function HomeworldMyUnit.initPlanPanel(slot0)
	slot1 = slot0.plan_list:getContentSize()
	slot0.plan_scrollview = CommonScrollViewSingleLayout.new(slot0.plan_list, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot1.width, slot1.height), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 5,
		item_width = 155,
		item_height = 196,
		space_y = 0,
		col = 1,
		need_dynamic = true
	})

	slot0.plan_scrollview:setSwallowTouches(true)
	slot0.plan_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCellPlan), ScrollViewFuncType.CreateNewCell)
	slot0.plan_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCellsPlan), ScrollViewFuncType.NumberOfCells)

	slot7 = handler(slot0, slot0._updateCellByIndexPlan)

	slot0.plan_scrollview:registerScriptHandlerSingle(slot7, ScrollViewFuncType.UpdateCellByIndex)

	slot0.my_plan_data = {}

	for slot7 = 1, 10 do
		table.insert(slot0.my_plan_data, {})
	end

	slot0.plan_scrollview:reloadData()
end

function HomeworldMyUnit._createNewCellPlan(slot0)
	return HomeworldMyPlanItem.new(2)
end

function HomeworldMyUnit._numberOfCellsPlan(slot0)
	if not slot0.my_plan_data then
		return 0
	end

	return #slot0.my_plan_data
end

function HomeworldMyUnit._updateCellByIndexPlan(slot0, slot1, slot2)
	if not slot0.my_plan_data then
		return
	end

	slot1.index = slot2

	if not slot0.my_plan_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function HomeworldMyUnit.initBookPanel(slot0)
	slot1 = slot0.book_list:getContentSize()
	slot0.book_scrollview = CommonScrollViewSingleLayout.new(slot0.book_list, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot1.width, slot1.height), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 5,
		item_width = 155,
		item_height = 196,
		space_y = 0,
		col = 1,
		need_dynamic = true
	})

	slot0.book_scrollview:setSwallowTouches(true)
	slot0.book_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCellBook), ScrollViewFuncType.CreateNewCell)
	slot0.book_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCellsBook), ScrollViewFuncType.NumberOfCells)

	slot7 = handler(slot0, slot0._updateCellByIndexBook)
	slot8 = ScrollViewFuncType.UpdateCellByIndex

	slot0.book_scrollview:registerScriptHandlerSingle(slot7, slot8)

	slot0.my_book_data = {}

	for slot7, slot8 in pairs(Config.HomeData.data_suit) do
		uv0(slot0.my_book_data, slot8)
	end

	table.sort(slot0.my_book_data, SortTools.KeyLowerSorter("set_id"))
	slot0.book_scrollview:reloadData()
end

function HomeworldMyUnit._createNewCellBook(slot0)
	return HomeworldMyPlanItem.new(1)
end

function HomeworldMyUnit._numberOfCellsBook(slot0)
	if not slot0.my_book_data then
		return 0
	end

	return #slot0.my_book_data
end

function HomeworldMyUnit._updateCellByIndexBook(slot0, slot1, slot2)
	if not slot0.my_book_data then
		return
	end

	slot1.index = slot2

	if not slot0.my_book_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function HomeworldMyUnit.setVisible(slot0, slot1)
	slot0.cur_show_status = slot1

	slot0.root_wnd:setVisible(slot1)
end

function HomeworldMyUnit.updateCurSoft(slot0)
	if Config.HomeData.data_const.comfort_limit then
		slot0.comfort_label:setString(uv0:getCurHomeSoftVal() .. "/" .. slot2.val)
	else
		slot0.comfort_label:setString(slot1)
	end

	if Config.HomeData.data_const.floor_effective_area_limit then
		slot0.grid_num_txt:setString(uv0:getCurOccupyGridNum() .. "/" .. slot4.val)
	else
		slot0.grid_num_txt:setString(slot3)
	end
end

function HomeworldMyUnit.updateSuitAwardRedStatus(slot0)
	if not slot0.tab_btn_list then
		return
	end

	for slot4, slot5 in pairs(slot0.tab_btn_list) do
		if slot5:getIndex() == 3 then
			slot5:setRedStatus(uv0:getRedStatusById(HomeworldConst.Red_Index.Suit))

			break
		end
	end
end

function HomeworldMyUnit.__delete(slot0)
	if slot0.tab_scrollview then
		slot0.tab_scrollview:DeleteMe()

		slot0.tab_scrollview = nil
	end

	if slot0.sub_tab_scrollview then
		slot0.sub_tab_scrollview:DeleteMe()

		slot0.sub_tab_scrollview = nil
	end

	if slot0.unit_scrollview then
		slot0.unit_scrollview:DeleteMe()

		slot0.unit_scrollview = nil
	end

	if slot0.plan_scrollview then
		slot0.plan_scrollview:DeleteMe()

		slot0.plan_scrollview = nil
	end

	if slot0.book_scrollview then
		slot0.book_scrollview:DeleteMe()

		slot0.book_scrollview = nil
	end

	if slot0.discharge_unit_event then
		GlobalEvent:getInstance():UnBind(slot0.discharge_unit_event)

		slot0.discharge_unit_event = nil
	end

	if slot0.add_unit_event then
		GlobalEvent:getInstance():UnBind(slot0.add_unit_event)

		slot0.add_unit_event = nil
	end

	if slot0.update_add_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_add_good_event)

		slot0.update_add_good_event = nil
	end

	if slot0.update_delete_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_delete_good_event)

		slot0.update_delete_good_event = nil
	end

	if slot0.update_modify_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_modify_good_event)

		slot0.update_modify_good_event = nil
	end

	if slot0.update_red_status_event then
		GlobalEvent:getInstance():UnBind(slot0.update_red_status_event)

		slot0.update_red_status_event = nil
	end
end
