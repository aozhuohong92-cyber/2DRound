ArenapeakchampionFightInfoPanel = ArenapeakchampionFightInfoPanel or BaseClass(BaseView)
slot1 = ArenapeakchampionController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function ArenapeakchampionFightInfoPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "arenapeakchampion/arenapeakchampion_fight_info_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("vedio", "vedio"),
			type = ResourcesType.plist
		}
	}
	slot0.show_list = {}
end

function ArenapeakchampionFightInfoPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("对战详情"))

	slot0.scroll_container = slot0.main_panel:getChildByName("scroll_container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.bottom_label = slot0.main_panel:getChildByName("bottom_label")

	slot0.bottom_label:setString(TI18N("系统默认将第三队伍信息隐藏"))
end

function ArenapeakchampionFightInfoPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
end

function ArenapeakchampionFightInfoPanel.onClickBtnClose(slot0)
	uv0:openArenapeakchampionFightInfoPanel(false)
end

function ArenapeakchampionFightInfoPanel.openRootWnd(slot0, slot1)
	slot0.data = (slot1 or {}).data

	if not slot0.data then
		return
	end

	slot0:setData(slot0.data)
end

function ArenapeakchampionFightInfoPanel.setData(slot0, slot1)
	slot0.show_list = uv0:getSecondData(slot1, nil, 3).arena_replay_infos or {}

	uv1(slot0.show_list, function (slot0, slot1)
		return slot0.order < slot1.order
	end)
	slot0:updateList()
end

function ArenapeakchampionFightInfoPanel.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 606,
			item_height = 280,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.item_scrollview:reloadData()

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.scroll_container, true, {
			text = TI18N("暂无数据")
		})
	else
		commonShowEmptyIcon(slot0.scroll_container, false)
	end
end

function ArenapeakchampionFightInfoPanel.createNewCell(slot0, slot1, slot2)
	return ArenapeakchampionFightInfoItem.new(slot1, slot2)
end

function ArenapeakchampionFightInfoPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenapeakchampionFightInfoPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	if slot2 == 3 then
		slot1:setData(slot3, true, true)
	else
		slot1:setData(slot3)
	end
end

function ArenapeakchampionFightInfoPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openArenapeakchampionFightInfoPanel(false)
end
