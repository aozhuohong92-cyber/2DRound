slot1 = EliteSummonController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
SummonSelectWindow = SummonSelectWindow or BaseClass(BaseView)

function SummonSelectWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "elitesummon/summon_select_window"
	slot0.cur_item_id = nil
	slot0.select_cell = nil
	slot0.hero_data_list = {}
end

function SummonSelectWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot1:getChildByName("win_title"):setString(TI18N("英雄选择"))

	slot0.left_btn = slot1:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.right_btn = slot1:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("确 定"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.hero_info_panel = slot1:getChildByName("hero_info_panel")

	slot0.hero_info_panel:getChildByName("name_txt"):setString(TI18N("请在下面列表中选择一名英雄作为指定UP英雄"))
end

function SummonSelectWindow.register_event(slot0)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickChooseBtn), true)
	registerButtonEventListener(slot0.left_btn, function ()
		uv0:onClickCloseBtn()
	end, true, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClickCloseBtn()
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClickCloseBtn()
	end, false, 2)
end

function SummonSelectWindow.onClickCloseBtn(slot0)
	uv0:openSummonSelectWindow(false)
end

function SummonSelectWindow.onClickChooseBtn(slot0)
	if next(slot0.hero_data_list) == nil then
		message(TI18N("没有可选择的英雄"))

		return
	end

	if slot0.cur_item_id == nil or slot0.cur_item_id <= 0 then
		message(TI18N("请选择UP英雄"))

		return
	end

	uv0:send23233(slot0.cur_item_id)
	slot0:onClickCloseBtn()
end

function SummonSelectWindow.setData(slot0)
	if not uv0:getSelectSummonData() then
		return
	end

	slot0.cur_item_id = slot1.lucky_bid
	slot0.hero_data_list = {}
	slot2 = {}

	if Config.RecruitHolidayLuckyData.data_wish[slot1.camp_id] then
		for slot7, slot8 in pairs(slot3) do
			uv1(slot2, {
				id = slot7,
				sort = slot8.sort
			})
		end
	end

	slot7 = SortTools.KeyLowerSorter

	table.sort(slot2, slot7("sort"))

	for slot7, slot8 in ipairs(slot2) do
		uv1(slot0.hero_data_list, slot8.id)
	end

	slot0:updateList()
end

function SummonSelectWindow.openRootWnd(slot0)
	slot0:setData()
end

function SummonSelectWindow.updateList(slot0)
	if not slot0.hero_data_list then
		return
	end

	if slot0.hero_list_view == nil then
		slot1 = 120

		if #slot0.hero_data_list >= 6 then
			slot1 = 110
		end

		slot0.hero_list = slot0.hero_info_panel:getChildByName("hero_list")
		slot0.hero_list_view = CommonScrollViewSingleLayout.new(slot0.hero_list, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.hero_list:getContentSize(), {
			start_y = 0,
			row = 1,
			start_x = 0,
			space_x = 0,
			item_height = 175,
			space_y = 10,
			col = 5,
			need_dynamic = true,
			item_width = slot1
		}, cc.p(0, 0))

		slot0.hero_list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.hero_list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.hero_list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.hero_list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end

	slot0.hero_list_view:reloadData()
end

function SummonSelectWindow.createNewCell(slot0, slot1, slot2)
	slot3 = SummonSelectItem.new(slot1, slot2)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function SummonSelectWindow.numberOfCells(slot0)
	if not slot0.hero_data_list then
		return 0
	end

	return #slot0.hero_data_list
end

function SummonSelectWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.hero_data_list[slot2] then
		slot1:setData(slot3, #slot0.hero_data_list)

		if slot0.cur_item_id and slot0.cur_item_id == slot3 then
			slot1:IsGetStatus(true)

			slot0.select_cell = slot1
		else
			slot1:IsGetStatus(false)
		end
	end
end

function SummonSelectWindow.onCellTouched(slot0, slot1)
	slot2 = false
	slot3 = slot0.hero_data_list[slot1.index]

	if slot0.cur_item_id and slot3 and slot3 == slot0.cur_item_id then
		slot0.select_cell:IsGetStatus(true)

		return
	end

	if slot0.cur_item_id and slot0.select_cell then
		slot0.select_cell:IsGetStatus(false)

		slot0.select_cell = nil
		slot0.cur_item_id = nil
	end

	slot0.select_cell = slot1

	slot0.select_cell:IsGetStatus(true)

	slot0.cur_item_id = slot3
end

function SummonSelectWindow.close_callback(slot0)
	if slot0.hero_list_view then
		slot0.hero_list_view:DeleteMe()

		slot0.hero_list_view = nil
	end

	uv0:openSummonSelectWindow(false)
end

SummonSelectItem = class("SummonSelectItem", function ()
	return ccui.Widget:create()
end)

function SummonSelectItem.ctor(slot0, slot1, slot2)
	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function SummonSelectItem.configUI(slot0, slot1, slot2)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("elitesummon/summon_select_item"))

	slot0:setAnchorPoint(cc.p(0, 0))
	slot0:setContentSize(cc.size(slot1, slot2))
	slot0:setTouchEnabled(false)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.checkbox = slot0.container:getChildByName("checkbox")
	slot0.item_node = BackPackItem.new(false, true, false, 0.9, nil, , false)

	slot0.item_node:setPosition(cc.p(slot0:getContentSize().width * 0.5, slot0:getContentSize().height * 0.5 + 30))
	slot0.root_wnd:addChild(slot0.item_node)
end

function SummonSelectItem.register_event(slot0)
	slot0.checkbox:addEventListener(function (slot0, slot1)
		if uv0.callback then
			uv0.callback()
		end
	end)
end

function SummonSelectItem.addCallBack(slot0, slot1)
	slot0.callback = slot1

	if slot0.item_node then
		slot0.item_node:addCallBack(slot1)
	end
end

function SummonSelectItem.setData(slot0, slot1, slot2)
	if slot0.item_node then
		slot0.item_node:setBaseData(slot1, 1)

		if slot2 and slot2 >= 6 then
			slot0.item_node.scale = 0.8

			slot0.item_node:setScale(0.8)
		end
	end
end

function SummonSelectItem.IsGetStatus(slot0, slot1)
	if slot0.checkbox then
		slot0.checkbox:setSelected(slot1)
	end
end

function SummonSelectItem.DeleteMe(slot0)
	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end
end
