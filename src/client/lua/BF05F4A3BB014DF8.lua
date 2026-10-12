slot1 = ElfinController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
ElfinBookWindow = ElfinBookWindow or BaseClass(BaseView)

function ElfinBookWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_book_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("elfin", "elfin"),
			type = ResourcesType.plist
		}
	}
	slot0.cur_tab_data = {}
end

function ElfinBookWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("幽灵图鉴"))

	slot0.have_txt = slot1:getChildByName("have_txt")

	slot0.have_txt:setString(TI18N("幽灵满级效果预览"))

	slot0.btn_close = slot1:getChildByName("btn_close")
	slot2 = slot1:getChildByName("item_list")
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 10,
		row = 0,
		start_x = 13,
		space_x = 25,
		space_y = 53,
		col = 4,
		need_dynamic = true,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function ElfinBookWindow._createNewCell(slot0)
	slot1 = BackPackItem.new(false, true, false)

	slot1:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot1
end

function ElfinBookWindow._numberOfCells(slot0)
	if not slot0.cur_tab_data then
		return 0
	end

	return #slot0.cur_tab_data
end

function ElfinBookWindow._updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.cur_tab_data[slot2] then
		slot1:setData(slot3)
		slot1:showItemQualityName(true)
	end
end

function ElfinBookWindow.onCellTouched(slot0, slot1)
	if slot1:getData() then
		uv0:openElfinInfoWindow(true, slot2)
	end
end

function ElfinBookWindow.updateCurTabData(slot0)
	slot0.cur_tab_data = {}
	slot1 = 5

	if Config.SpriteData.data_const.sprite_max_star_show then
		slot1 = slot2.val
	end

	for slot7, slot8 in ipairs(Config.SpriteData.data_elfin_book[slot1]) do
		if Config.ItemData.data_get_data(slot8) then
			uv0(slot0.cur_tab_data, slot9)
		end
	end

	table.sort(slot0.cur_tab_data, function (slot0, slot1)
		if uv0:checkElfinIsActivatedByBid(slot0.id) and not uv0:checkElfinIsActivatedByBid(slot1.id) then
			return true
		elseif not slot2 and slot3 then
			return false
		elseif slot0.quality ~= slot1.quality then
			return slot1.quality < slot0.quality
		else
			return slot0.id < slot1.id
		end
	end)
	slot0.item_scrollview:reloadData()
end

function ElfinBookWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openElfinBookWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openElfinBookWindow(false)
	end, true, 2)
end

function ElfinBookWindow.openRootWnd(slot0)
	slot0:updateCurTabData()
end

function ElfinBookWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openElfinBookWindow(false)
end
