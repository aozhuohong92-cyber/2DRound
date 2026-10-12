AdventureMineFightRecordPanel = AdventureMineFightRecordPanel or BaseClass(BaseView)
slot1 = AdventureController:getInstance():getUiModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function AdventureMineFightRecordPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "adventure/adventure_mine_fight_record_panel"
	slot0.res_list = {}
end

function AdventureMineFightRecordPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("防守记录"))

	slot0.scroll_container = slot0.main_container:getChildByName("scroll_container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
end

function AdventureMineFightRecordPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_ALL_LOG_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setMineRecordRedpoint(false)
		uv1:setData(slot0)
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_STRIKE_BACK_EVENT, function (slot0)
		if not slot0 then
			return
		end

		if uv0:getAdventureBaseData() and slot1.current_id ~= slot0.floor then
			uv1:requestEnterAdventureMine(slot0.floor, {
				room_id = slot0.room_id
			})
		elseif uv1:getAdventureMineWindow() and slot2.gotoAdventureFloorRoom then
			slot2:gotoAdventureFloorRoom({
				room_id = slot0.room_id
			})
		else
			uv1:requestEnterAdventureMine(slot0.floor, {
				room_id = slot0.room_id
			})
		end
	end)
end

function AdventureMineFightRecordPanel.onClickBtnClose(slot0)
	uv0:openAdventureMineFightRecordPanel(false)
end

function AdventureMineFightRecordPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}

	uv0:send20644()
end

function AdventureMineFightRecordPanel.setData(slot0, slot1)
	slot0.show_list = slot1.log_list

	slot0:updateList()
end

function AdventureMineFightRecordPanel.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 600,
			item_height = 168,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.scroll_container, true, {
			text = TI18N("暂无防守记录")
		})
	else
		commonShowEmptyIcon(slot0.scroll_container, false)
	end

	slot0.item_scrollview:reloadData()
end

function AdventureMineFightRecordPanel.createNewCell(slot0, slot1, slot2)
	return AdventureMineFightRecordItem.new(slot1, slot2, slot0)
end

function AdventureMineFightRecordPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function AdventureMineFightRecordPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function AdventureMineFightRecordPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openAdventureMineFightRecordPanel(false)
end

AdventureMineFightRecordItem = class("AdventureMineFightRecordItem", function ()
	return ccui.Widget:create()
end)

function AdventureMineFightRecordItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function AdventureMineFightRecordItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("adventure/adventure_mine_fight_record_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.icon = slot0.container:getChildByName("icon")
	slot0.item_name = slot0.container:getChildByName("item_name")
	slot0.name = slot0.container:getChildByName("name")
	slot0.time = slot0.container:getChildByName("time")
	slot0.captured_img = slot0.container:getChildByName("captured_img")
	slot0.defence_desc = slot0.container:getChildByName("defence_desc")
	slot0.strike_back_btn = slot0.container:getChildByName("strike_back_btn")
	slot0.check_fight_btn = slot0.container:getChildByName("check_fight_btn")
	slot0.desc = createRichLabel(22, cc.c4b(217, 80, 20, 255), cc.p(0, 0.5), cc.p(183, 28), 6, nil, 900)

	slot0.container:addChild(slot0.desc)

	slot0.goto_btn_label = createRichLabel(22, cc.c4b(36, 144, 3, 255), cc.p(0.5, 0.5), cc.p(80, 26))

	slot0.goto_btn_label:setString(uv0("<div href=xxx>%s</div>", TI18N("前往查看")))
	slot0.container:addChild(slot0.goto_btn_label)
	slot0.goto_btn_label:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		if not uv0.parent then
			return
		end

		if uv0.data then
			uv0.base_data = uv1:getAdventureBaseData()

			if uv0.base_data.current_id ~= uv0.data.floor then
				uv2:requestEnterAdventureMine(uv0.data.floor, {
					room_id = uv0.data.room_id
				})
			elseif uv2:getAdventureMineWindow() and slot4.gotoAdventureFloorRoom then
				slot4:gotoAdventureFloorRoom({
					room_id = uv0.data.room_id
				})
			else
				uv2:requestEnterAdventureMine(uv0.data.floor, {
					room_id = uv0.data.room_id
				})
			end

			uv0.parent:onClickBtnClose()
			uv2:openAdventureMineMyInfoPanel(false)
		end
	end, {
		"click",
		"href"
	})
end

function AdventureMineFightRecordItem.register_event(slot0)
	registerButtonEventListener(slot0.strike_back_btn, function ()
		uv0:onStrikeBackBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.check_fight_btn, function ()
		uv0:onCheckFightBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
end

function AdventureMineFightRecordItem.onStrikeBackBtn(slot0)
	if not slot0.data then
		return
	end

	uv0:send20656(slot0.data.rid, slot0.data.srv_id)
end

function AdventureMineFightRecordItem.onCheckFightBtn(slot0)
	if not slot0.data then
		return
	end

	BattleController:getInstance():csRecordBattle(slot0.data.replay_id, slot0.data.srv_id)
end

function AdventureMineFightRecordItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.config = Config.AdventureMineData.data_mine_data(slot0.data.mine_id)

	if not slot0.config then
		return
	end

	if slot0.config.res_id == nil or slot2 == "" then
		slot2 = 1001
	end

	slot3 = PathTool.getPlistImgForDownLoad("adventure/mine_icon", slot2, false)

	if slot0.record_res == nil or slot0.record_res ~= slot3 then
		slot0.record_res = slot3
		slot0.item_load = loadSpriteTextureFromCDN(slot0.icon, slot3, ResourcesType.single, slot0.item_load)
	end

	if slot0.data.ret == 1 then
		slot0.captured_img:setVisible(false)
		slot0.defence_desc:setString(TI18N("防守成功"))
		slot0.defence_desc:setTextColor(cc.c4b(36, 144, 3, 255))
		slot0.strike_back_btn:setVisible(false)
		slot0.desc:setVisible(false)
	else
		if slot0.data.ret == 3 then
			slot0.captured_img:setVisible(true)
		else
			slot0.captured_img:setVisible(false)
		end

		slot0.strike_back_btn:setVisible(true)
		slot0.desc:setVisible(true)
		slot0.defence_desc:setString(TI18N("防守失败"))
		slot0.defence_desc:setTextColor(cc.c4b(217, 80, 20, 255))

		if slot0.data.loss and next(slot0.data.loss) ~= nil and Config.ItemData.data_get_data(slot0.data.loss[1].item_id) then
			slot0.desc:setString(uv0(TI18N("<img src=%s scale=0.3 /><div fontcolor=#d95014>-%s</div>"), PathTool.getItemRes(slot5.icon), slot0.data.loss[1].num))
		end
	end

	slot0.item_name:setString(slot0.config.name)
	slot0.name:setString(slot0.data.name)
	slot0.time:setString(TimeTool.getYMDHMS(slot0.data.time))
end

function AdventureMineFightRecordItem.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
