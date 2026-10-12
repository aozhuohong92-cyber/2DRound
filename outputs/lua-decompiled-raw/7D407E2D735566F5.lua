PlanesBagPanel = PlanesBagPanel or BaseClass(BaseView)
slot1 = PlanesController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = math.ceil

function PlanesBagPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "planes/planes_bag_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("planes", "planes_map"),
			type = ResourcesType.plist
		}
	}
end

function PlanesBagPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("探险背包"))

	slot0.scroll_container = slot0.main_container:getChildByName("scroll_container")
	slot0.bg_tips = slot0.main_container:getChildByName("bg_tips")

	slot0.bg_tips:setString(TI18N("背包的物品只在探险玩法中生效，玩法重置后背包将被清空"))
end

function PlanesBagPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	slot0:addGlobalEvent(PlanesEvent.Iint_Bag_Data_Event, function (slot0)
		uv0:initData()
	end)
	slot0:addGlobalEvent(PlanesEvent.Update_Bag_Data_Event, function (slot0, slot1)
		if not slot1 and uv0.item_scrollview then
			uv0.item_scrollview:resetCurrentItems()
		else
			uv0:initData()
		end
	end)
	slot0:addGlobalEvent(PlanesEvent.Delete_Bag_Data_Event, function (slot0)
		uv0:initData()
	end)
end

function PlanesBagPanel.onClickBtnClose(slot0)
	uv0:openPlanesBagPanel(false)
end

function PlanesBagPanel.openRootWnd(slot0, slot1)
	if uv0:getPlanesBagData() == nil or next(slot2) == nil then
		uv1:sender23112()
	else
		slot0:initData()
	end
end

function PlanesBagPanel.initData(slot0)
	if not (uv0:getPlanesBagData() or {}) then
		return
	end

	slot0.bag_list = {}

	for slot5, slot6 in pairs(slot1) do
		uv1(slot0.bag_list, slot6)
	end

	uv2(slot0.bag_list, SortTools.tableCommonSorter({
		{
			"id",
			false
		}
	}))
	slot0:updateList()
end

function PlanesBagPanel.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 2,
			row = 1,
			space_x = 0,
			item_width = 119,
			item_height = 122,
			space_y = 0,
			col = 5
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.item_scrollview:reloadData()
end

function PlanesBagPanel.createNewCell(slot0, slot1, slot2)
	slot3 = BackPackItem.new(true, true, false, 0.9)

	slot3:setSwallowTouches(false)
	slot3:setDefaultTip()

	return slot3
end

function PlanesBagPanel.numberOfCells(slot0)
	if not slot0.bag_list then
		return 20
	end

	if #slot0.bag_list < 20 then
		return 20
	else
		return uv0(slot1 / 5) * 5
	end
end

function PlanesBagPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.bag_list[slot2] then
		slot1:setBaseData(slot3.base_id, slot3.num)
	else
		slot1:suspendAllActions()
	end
end

function PlanesBagPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openPlanesBagPanel(false)
end
