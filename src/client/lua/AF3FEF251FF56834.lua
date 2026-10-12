ActionyearmonsterBagPanel = ActionyearmonsterBagPanel or BaseClass(BaseView)
slot1 = ActionyearmonsterController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = math.ceil

function ActionyearmonsterBagPanel.__init(slot0)
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

function ActionyearmonsterBagPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("福袋背包"))

	slot0.scroll_container = slot0.main_container:getChildByName("scroll_container")
	slot0.bg_tips = slot0.main_container:getChildByName("bg_tips")

	slot0.bg_tips:setString(TI18N("福袋的道具只在本玩法中生效，玩法结束后背包将被清空"))
end

function ActionyearmonsterBagPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)

	if slot0.role_assets_event == nil then
		slot0.role_vo = RoleController:getInstance():getRoleVo()

		if slot0.role_vo then
			slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ACTION_ASSETS, function (slot0, slot1)
				uv0:initData()
			end)
		end
	end
end

function ActionyearmonsterBagPanel.onClickBtnClose(slot0)
	uv0:openActionyearmonsterBagPanel(false)
end

function ActionyearmonsterBagPanel.openRootWnd(slot0, slot1)
	slot0.dic_item_list = {}

	if Config.HolidayNianData.data_const.package_item then
		for slot6, slot7 in ipairs(slot2.val) do
			slot0.dic_item_list[slot7] = true
		end
	end

	slot0:initData()
end

function ActionyearmonsterBagPanel.initData(slot0)
	slot0.bag_list = {}

	if slot0.role_vo and slot0.role_vo.dic_action_assets then
		for slot4, slot5 in pairs(slot0.role_vo.dic_action_assets) do
			if slot0.dic_item_list and slot0.dic_item_list[slot4] and slot5 ~= 0 then
				uv0(slot0.bag_list, {
					base_id = slot4,
					num = slot5
				})
			end
		end
	end

	uv1(slot0.bag_list, SortTools.tableCommonSorter({
		{
			"base_id",
			false
		}
	}))
	slot0:updateList()
end

function ActionyearmonsterBagPanel.updateList(slot0)
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

function ActionyearmonsterBagPanel.createNewCell(slot0, slot1, slot2)
	slot3 = BackPackItem.new(true, true, false, 0.9)

	slot3:setSwallowTouches(false)
	slot3:setDefaultTip()

	return slot3
end

function ActionyearmonsterBagPanel.numberOfCells(slot0)
	if not slot0.bag_list then
		return 20
	end

	if #slot0.bag_list < 20 then
		return 20
	else
		return uv0(slot1 / 5) * 5
	end
end

function ActionyearmonsterBagPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.bag_list[slot2] then
		slot1:setBaseData(slot3.base_id, slot3.num)
	else
		slot1:suspendAllActions()
	end
end

function ActionyearmonsterBagPanel.close_callback(slot0)
	if slot0.role_assets_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openActionyearmonsterBagPanel(false)
end
