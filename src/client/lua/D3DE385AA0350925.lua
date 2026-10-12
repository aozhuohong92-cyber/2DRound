AdventureMineLayerPanel = AdventureMineLayerPanel or BaseClass(BaseView)
slot1 = AdventureController:getInstance():getUiModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function AdventureMineLayerPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "adventure/adventure_mine_layer_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("adventure", "adventuremine"),
			type = ResourcesType.plist
		}
	}
end

function AdventureMineLayerPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("层数跳转"))

	slot0.scroll_container = slot0.main_container:getChildByName("scroll_container")
	slot0.right_btn = slot0.main_container:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("继续冒险"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
end

function AdventureMineLayerPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.right_btn, function ()
		uv0:onClickBtnRight()
	end, true, 1)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_All_LAYER_INFO_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0.dic_floor_had = {}

		for slot4, slot5 in ipairs(slot0.floor_list) do
			uv0.dic_floor_had[slot5.floor] = true
		end

		if uv0.item_scrollview then
			uv0.item_scrollview:resetCurrentItems()
		end
	end)
end

function AdventureMineLayerPanel.onClickBtnClose(slot0)
	uv0:openAdventureMineLayerPanel(false)
end

function AdventureMineLayerPanel.onClickBtnRight(slot0)
	if uv0:getAdventureBaseData() then
		if slot1.id and slot1.id == slot1.current_id then
			if Config.AdventureMineData.data_floor_data[slot1.current_id] then
				uv1:setMustChangeWindow()
				uv1:send20620(13, AdventureEvenHandleType.handle, {})
			end
		else
			uv1:requestEnterAdventure(true)
		end
	else
		uv1:requestEnterAdventure(true)
	end

	slot0:onClickBtnClose()
end

function AdventureMineLayerPanel.openRootWnd(slot0, slot1)
	slot0.cur_floor = (slot1 or {}).floor
	slot0.dic_floor_had = {}

	slot0:setData()
	uv0:send20653()
end

function AdventureMineLayerPanel.setData(slot0)
	if uv0:getAdventureBaseData() == nil then
		return
	end

	slot0.floor = slot1.pass_id or 0
	slot0.show_list = {}

	if Config.AdventureMineData.data_floor_data then
		for slot6, slot7 in pairs(slot2) do
			if slot7.floor <= slot0.floor then
				uv1(slot0.show_list, slot7)
			end
		end
	end

	uv2(slot0.show_list, function (slot0, slot1)
		return slot1.floor < slot0.floor
	end)
	slot0:updateList()
end

function AdventureMineLayerPanel.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 600,
			item_height = 122,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.scroll_container, true, {
			text = TI18N("暂无灵矿层数据")
		})
	else
		commonShowEmptyIcon(slot0.scroll_container, false)
	end

	slot0.item_scrollview:reloadData()
end

function AdventureMineLayerPanel.createNewCell(slot0, slot1, slot2)
	return AdventureMineLayerItem.new(slot1, slot2, slot0)
end

function AdventureMineLayerPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function AdventureMineLayerPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3, slot0.dic_floor_had[slot3.floor])
end

function AdventureMineLayerPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openAdventureMineLayerPanel(false)
end

AdventureMineLayerItem = class("AdventureMineLayerItem", function ()
	return ccui.Widget:create()
end)

function AdventureMineLayerItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function AdventureMineLayerItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("adventure/adventure_mine_layer_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.name = slot0.container:getChildByName("name")
	slot0.name_x = slot0.name:getPosition()
	slot0.have_icon = slot0.container:getChildByName("have_icon")
	slot0.desc_1 = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(slot0.name_x, 28), 6, nil, 900)

	slot0.container:addChild(slot0.desc_1)

	slot0.goto_btn = slot0.container:getChildByName("goto_btn")

	slot0.goto_btn:getChildByName("label"):setString(TI18N("前 往"))
end

function AdventureMineLayerItem.register_event(slot0)
	registerButtonEventListener(slot0.goto_btn, function ()
		uv0:onGotoBtn()
	end, true, 1)
end

function AdventureMineLayerItem.onGotoBtn(slot0)
	if not slot0.data then
		return
	end

	if not slot0.parent then
		return
	end

	if slot0.parent.cur_floor == nil or slot0.parent.cur_floor ~= slot0.data.floor then
		uv0:requestEnterAdventureMine(slot0.data.floor)
	end

	slot0.parent:onClickBtnClose()
end

function AdventureMineLayerItem.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.name:setString(slot0.data.name)

	if slot2 then
		slot0.have_icon:setVisible(true)
		slot0.have_icon:setPositionX(slot0.name_x + slot0.name:getContentSize().width + 10)
	else
		slot0.have_icon:setVisible(false)
	end

	if slot0.data.min_produce and next(slot0.data.min_produce) ~= nil then
		if Config.ItemData.data_get_data(slot0.data.min_produce[1][1]) then
			slot0.desc_1:setString(uv1(TI18N("最低产出：<img src=%s scale=0.3 />%s/m"), PathTool.getItemRes(slot5.icon), uv0:getMineRate(slot0.data.floor, slot0.data.min_produce[1][2])))
		end
	end
end

function AdventureMineLayerItem.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
