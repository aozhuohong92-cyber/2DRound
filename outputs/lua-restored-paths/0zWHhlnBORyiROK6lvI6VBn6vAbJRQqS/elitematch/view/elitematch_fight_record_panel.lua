ElitematchFightRecordPanel = ElitematchFightRecordPanel or BaseClass(BaseView)
slot0 = ElitematchController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function ElitematchFightRecordPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "elitematch/elitematch_fight_record_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("vedio", "vedio"),
			type = ResourcesType.plist
		}
	}
	slot0.arena_elite_log_list = {}
end

function ElitematchFightRecordPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot5 = 1

	slot0:playEnterAnimatianByObj(slot0.main_container, slot5)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.tab_container = slot0.main_panel:getChildByName("tab_container")
	slot1 = {
		TI18N("我的录像"),
		TI18N("大师风采")
	}
	slot0.tab_list = {}

	for slot5 = 1, 2 do
		if slot0.tab_container:getChildByName("tab_btn_" .. slot5) then
			slot7 = {
				select_bg = slot6:getChildByName("select_bg")
			}

			slot7.select_bg:setVisible(false)

			slot7.unselect_bg = slot6:getChildByName("unselect_bg")
			slot7.title = slot6:getChildByName("title")

			slot7.title:setTextColor(cc.c4b(207, 181, 147, 255))

			if slot1[slot5] then
				slot7.title:setString(slot1[slot5])
			end

			slot7.tab_btn = slot6
			slot7.index = slot5
			slot0.tab_list[slot5] = slot7
		end
	end

	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("战斗记录"))

	slot0.scroll_container = slot0.main_panel:getChildByName("scroll_container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.top_label = slot0.main_panel:getChildByName("top_label")
	slot0.bottom_label = slot0.main_panel:getChildByName("bottom_label")

	slot0.top_label:setString(TI18N("录像可以在\"详细\"中观看"))
end

function ElitematchFightRecordPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)

	slot4 = handler(slot0, slot0.onClickBtnClose)
	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end

	slot0:addGlobalEvent(ElitematchEvent.Elite_Challenge_Record_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0.arena_elite_log_list[slot0.type] = slot0

		if uv0.index == slot0.type then
			uv0:setData(slot0.arena_elite_log)
		end
	end)
end

function ElitematchFightRecordPanel.onClickBtnClose(slot0)
	uv0:openElitematchFightRecordPanel(false)
end

function ElitematchFightRecordPanel.changeSelectedTab(slot0, slot1)
	if slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)
		slot0.tab_object.title:setTextColor(cc.c4b(207, 181, 147, 255))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
		slot0.tab_object.title:setTextColor(cc.c4b(255, 237, 214, 255))
	end

	slot0.index = slot1

	if slot0.arena_elite_log_list[slot1] == nil then
		uv0:sender24930(slot1)
	else
		slot0:setData(slot0.arena_elite_log_list[slot1].arena_elite_log)
	end
end

function ElitematchFightRecordPanel.openRootWnd(slot0, slot1, slot2)
	slot0.index = slot1 or 1
	slot0.level_id = slot2 or 1

	if Config.ArenaEliteData.data_elite_level[slot0.level_id] then
		slot0.bottom_label:setString(TI18N("当前你的段位为:") .. slot3.name)
	end

	slot0:changeSelectedTab(slot0.index)
end

function ElitematchFightRecordPanel.setData(slot0, slot1)
	slot0.show_list = slot1

	slot0:updateList()
end

function ElitematchFightRecordPanel.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 628,
			item_height = 244,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if #slot0.show_list == 0 then
		slot0:showEmptyIcon(true)
	else
		slot0:showEmptyIcon(false)
	end

	slot0.item_scrollview:reloadData()
end

function ElitematchFightRecordPanel.showEmptyIcon(slot0, slot1)
	if not slot0.empty_con and slot1 == false then
		return
	end

	if not slot0.empty_con then
		slot3 = cc.size(200, 200)
		slot0.empty_con = ccui.Widget:create()

		slot0.empty_con:setContentSize(slot3)
		slot0.empty_con:setAnchorPoint(cc.p(0.5, 0))
		slot0.empty_con:setPosition(cc.p(slot0.scroll_container:getContentSize().width / 2, 330))
		slot0.scroll_container:addChild(slot0.empty_con, 10)

		slot5 = createImage(slot0.empty_con, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), slot3.width / 2, slot3.height / 2, cc.p(0.5, 0.5), false)
		slot7 = nil

		if LoginController:getInstance():getModel():getLoginData() and slot6.isTry then
			slot0:updateNotCanMatchIngInfo({
				"先行体验服暂时无法显示该内容",
				"其他服务器同步跨服数据后将正常显示",
				"请耐心等待"
			}, slot0.empty_con, slot3.width / 2, -10)
		else
			slot0.empty_label = createLabel(26, Config.ColorData.data_color4[175], nil, slot3.width / 2, -10, "", slot0.empty_con, 0, cc.p(0.5, 0))

			slot0.empty_label:setString(TI18N("暂无数据"))
		end
	end

	slot0.empty_con:setVisible(slot1)
end

function ElitematchFightRecordPanel.updateNotCanMatchIngInfo(slot0, slot1, slot2, slot3, slot4)
	if not slot1 then
		return
	end

	if slot0.tips_label_list == nil then
		slot0.tips_label_list = {}
	end

	for slot8, slot9 in ipairs(slot0.tips_label_list) do
		slot9:setVisible(false)
	end

	for slot10, slot11 in ipairs(slot1) do
		if slot0.tips_label_list[slot10] == nil then
			slot0.tips_label_list[slot10] = createLabel(26, Config.ColorData.data_color4[175], nil, slot3, slot4 - 28 * (slot10 - 1), "", slot2, 2, cc.p(0.5, 0.5))
		else
			slot0.tips_label_list[slot10]:setPositionY(slot12)
		end

		slot0.tips_label_list[slot10]:setString(TI18N(slot11))
	end
end

function ElitematchFightRecordPanel.createNewCell(slot0, slot1, slot2)
	return ElitematchFightRecordItem.new()
end

function ElitematchFightRecordPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ElitematchFightRecordPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3, slot0.index)
end

function ElitematchFightRecordPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openElitematchFightRecordPanel(false)
end
