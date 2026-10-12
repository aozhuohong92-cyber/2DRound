slot1 = MonopolyController:getInstance():getModel()
slot2 = table.insert
MonopolyShowItemWindow = MonopolyShowItemWindow or BaseClass(BaseView)

function MonopolyShowItemWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "monopoly/monopoly_item_show_window"
end

function MonopolyShowItemWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("图例说明"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot2 = slot1:getChildByName("item_list")
	slot3 = slot2:getContentSize()
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot3.width, slot3.height), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 600,
		item_height = 142,
		space_y = 8,
		col = 1,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function MonopolyShowItemWindow._createNewCell(slot0)
	return MonopolyShowItem.new()
end

function MonopolyShowItemWindow._numberOfCells(slot0)
	if not slot0.show_data then
		return 0
	end

	return #slot0.show_data
end

function MonopolyShowItemWindow._updateCellByIndex(slot0, slot1, slot2)
	if not slot0.show_data then
		return
	end

	slot1.index = slot2

	if not slot0.show_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function MonopolyShowItemWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
end

function MonopolyShowItemWindow.onClickCloseBtn(slot0)
	uv0:openMonopolyItemShowWindow(false)
end

function MonopolyShowItemWindow.openRootWnd(slot0)
	slot0:setData()
end

function MonopolyShowItemWindow.setData(slot0)
	slot0.show_data = {}

	for slot4, slot5 in pairs(Config.MonopolyMapsData.data_item_show) do
		uv0(slot0.show_data, slot5)
	end

	table.sort(slot0.show_data, SortTools.KeyLowerSorter("id"))
	slot0.item_scrollview:reloadData()
end

function MonopolyShowItemWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openMonopolyItemShowWindow(false)
end

MonopolyShowItem = class("MonopolyShowItem", function ()
	return ccui.Widget:create()
end)

function MonopolyShowItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function MonopolyShowItem.configUI(slot0)
	slot0.size = cc.size(600, 142)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("monopoly/monopoly_show_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.title_txt = slot2:getChildByName("title_txt")
	slot0.desc_txt = createRichLabel(20, cc.c4b(142, 129, 119, 255), cc.p(0, 1), cc.p(123, 80), 5, nil, 445)

	slot2:addChild(slot0.desc_txt)
end

function MonopolyShowItem.register_event(slot0)
end

function MonopolyShowItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.title_txt:setString(slot1.title or "")
	slot0.desc_txt:setString(slot1.desc or "")

	slot2 = Config.ItemData.data_get_data(slot1.item_bid)

	if not slot0.item_node then
		slot0.item_node = BackPackItem.new(true, true, false, 0.8)

		slot0.item_node:setPosition(67, 71)
		slot0.container:addChild(slot0.item_node)
	end

	slot0.item_node:setData(slot2)
end

function MonopolyShowItem.DeleteMe(slot0)
	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end
end
