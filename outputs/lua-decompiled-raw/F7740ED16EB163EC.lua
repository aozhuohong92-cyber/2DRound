AdventureMineMyInfoPanel = AdventureMineMyInfoPanel or BaseClass(BaseView)
slot1 = AdventureController:getInstance():getUiModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function AdventureMineMyInfoPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "adventure/adventure_mine_my_info_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("adventure", "adventureminemgr"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_88"),
			type = ResourcesType.single
		}
	}
	slot0.time_desc_list = {}
	slot0.primary_time = 30

	if Config.AdventureMineData.data_const.primary_time then
		slot0.primary_time = slot1.val
	end

	slot0.senior_time = 60

	if Config.AdventureMineData.data_const.senior_time then
		slot0.senior_time = slot2.val
	end

	slot0.primary_count = 2

	if Config.AdventureMineData.data_const.primary_count then
		slot0.primary_count = slot3.val
	end

	slot0.senior_count = 3

	if Config.AdventureMineData.data_const.senior_count then
		slot0.senior_count = slot4.val
	end

	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function AdventureMineMyInfoPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("我的灵矿"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.scroll_container1 = slot0.main_container:getChildByName("scroll_container1")
	slot0.scroll_container2 = slot0.main_container:getChildByName("scroll_container2")
	slot0.bg = slot0.main_container:getChildByName("bg")

	loadSpriteTexture(slot0.bg, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_88"), LOADTEXT_TYPE)

	slot0.all_desc1 = createRichLabel(22, cc.c4b(255, 249, 213, 255), cc.p(0, 0.5), cc.p(46, 738), 6, nil, 900)

	slot0.main_container:addChild(slot0.all_desc1)

	slot0.all_desc2 = createRichLabel(22, cc.c4b(255, 249, 213, 255), cc.p(1, 0.5), cc.p(636, 738), 6, nil, 900)

	slot0.main_container:addChild(slot0.all_desc2)

	slot0.goto_btn_label = createRichLabel(22, cc.c4b(121, 255, 80, 255), cc.p(0.5, 0.5), cc.p(593, 696))

	slot0.goto_btn_label:setString(uv0("<div href=xxx outline=2,#000000>%s</div>", TI18N("防守记录")))
	slot0.main_container:addChild(slot0.goto_btn_label)
	slot0.goto_btn_label:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		uv0:openAdventureMineFightRecordPanel(true)
	end, {
		"click",
		"href"
	})
end

function AdventureMineMyInfoPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_MY_MINE_INFO_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_BUY_EMPLOY_EVENT, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.my_mine_list then
			return
		end

		for slot4, slot5 in ipairs(uv0.my_mine_list) do
			if slot0.floor == slot5.floor and slot5.room_id == slot0.room_id then
				if slot0.type == 2 then
					slot5.senior_count = slot5.senior_count + 1
				elseif slot0.type == 1 then
					slot5.primary_count = slot5.primary_count + 1
				end

				uv0:setData()

				break
			end
		end
	end)

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "vip" or slot0 == "lev" then
				uv0:initMineData(true)
				uv0:setData()

				if slot0 == "vip" then
					sdkSubmitUserData(8)
				end
			end
		end)
	end
end

function AdventureMineMyInfoPanel.checkRedpoint(slot0)
	if uv0:isMineRecordRedpoint() then
		addRedPointToNodeByStatus(slot0.goto_btn_label, true, 10, 10)
	else
		addRedPointToNodeByStatus(slot0.goto_btn_label, false, 10, 10)
	end
end

function AdventureMineMyInfoPanel.onClickBtnClose(slot0)
	uv0:openAdventureMineMyInfoPanel(false)
end

function AdventureMineMyInfoPanel.openRootWnd(slot0, slot1)
	slot0:initMineData()
	uv0:send20652()
	slot0:checkRedpoint()
end

function AdventureMineMyInfoPanel.initMineData(slot0, slot1)
	if slot0.mine_List and not slot1 then
		return
	end

	slot0.mine_List = {}

	for slot6, slot7 in pairs(Config.AdventureMineData.data_mine_unlock_info) do
		if next(slot7.open_cond) ~= nil then
			if slot7.open_cond[1][1] == "lev" then
				if slot0.role_vo and slot9[2] <= slot0.role_vo.lev then
					-- Nothing
				else
					slot8.lock_sort = 1
					slot8.lock_str = uv0(TI18N("达到%s级解锁"), slot9[2])
				end
			elseif slot9[1] == "vip" then
				if slot0.role_vo and slot9[2] <= slot0.role_vo.vip_lev then
					slot8.lock_sort = 0
				else
					slot8.lock_sort = 1
					slot8.lock_str = uv0(TI18N("达到vip%s解锁"), slot9[2])
				end
			end
		else
			slot8.lock_sort = 0
		end

		uv1(slot0.mine_List, {
			lock_sort = 0,
			config = slot7
		})
	end

	uv2(slot0.mine_List, function (slot0, slot1)
		return slot0.lock_sort < slot1.lock_sort
	end)
end

function AdventureMineMyInfoPanel.setData(slot0, slot1)
	if not slot1 and not slot0.my_mine_list then
		return
	end

	if slot1 then
		slot0.my_mine_list = slot1.mine_list
	end

	slot4 = PathTool.getItemRes(Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id.hallow_refine).icon)
	slot5 = 0
	slot6 = 0

	for slot10, slot11 in ipairs(slot0.my_mine_list) do
		for slot15, slot16 in ipairs(slot11.hook_items) do
			if slot2 and slot16.item_id == slot2 then
				slot6 = slot6 + slot16.num
			end
		end

		slot11.config = Config.AdventureMineData.data_mine_data(slot11.mine_id)

		if slot11.config then
			for slot15, slot16 in ipairs(slot11.config.hook_items) do
				if slot2 and slot16[1] == slot2 then
					slot5 = slot5 + uv0:getMineRate(slot11.floor, slot16[2])
				end
			end

			slot11.give_up_time = slot11.occupy_time + slot11.config.max_time * 60 + slot11.primary_count * slot0.primary_time * 60 + slot11.senior_count * slot0.senior_time * 60
		end
	end

	slot0.all_desc1:setString(uv1(TI18N("<div outline=2,#000000>总收益效率:<img src=%s scale=0.3 /><div fontcolor=#79ff50 outline=2,#000000>%s</div>/m</div>"), slot4, slot5))
	slot0.all_desc2:setString(uv1(TI18N("<div outline=2,#000000>总收益:<img src=%s scale=0.3 /><div fontcolor=#79ff50 outline=2,#000000>%s</div></div>"), slot4, slot6))
	slot0:startTimeTicket()
	slot0:updateMineList()

	if #slot0.my_mine_list == 0 then
		slot0:updateEmployList()
	end
end

function AdventureMineMyInfoPanel.updateEmployList(slot0, slot1)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container2:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 600,
			item_height = 142,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.item_scrollview:setClickEnabled(false)
	end

	slot0.show_list = {
		{}
	}
	slot0.show_list[1].name = TI18N("雇佣初级矿工")
	slot0.show_list[1].time = slot0.primary_time or 30
	slot0.show_list[1].buy_type = 1

	if slot1 == nil then
		slot0.show_list[1].count = slot0.primary_count or 2
		slot0.show_list[1].cost = {
			1,
			0
		}
	else
		if slot0.primary_count - slot1.primary_count < 0 then
			slot2 = 0
		end

		slot0.show_list[1].count = slot2

		if slot1.config and next(slot1.config.primary_loss) ~= nil then
			slot0.show_list[1].cost = slot1.config.primary_loss[1]
		else
			slot0.show_list[1].cost = {
				1,
				0
			}
		end
	end

	slot0.show_list[2] = {
		name = TI18N("雇佣高级矿工"),
		time = slot0.senior_time or 60,
		buy_type = 2
	}

	if slot1 == nil then
		slot0.show_list[2].count = slot0.senior_count or 3
		slot0.show_list[2].cost = {
			3,
			0
		}
	else
		if slot0.senior_count - slot1.senior_count < 0 then
			slot2 = 0
		end

		slot0.show_list[2].count = slot2

		if slot1.config and next(slot1.config.senior_loss) ~= nil then
			slot0.show_list[2].cost = slot1.config.senior_loss[1]
		else
			slot0.show_list[2].cost = {
				1,
				0
			}
		end
	end

	slot0.item_scrollview:reloadData()
end

function AdventureMineMyInfoPanel.createNewCell(slot0, slot1, slot2)
	return AdventureMineEmployItem.new(slot1, slot2, slot0)
end

function AdventureMineMyInfoPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function AdventureMineMyInfoPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function AdventureMineMyInfoPanel.updateMineList(slot0)
	if slot0.mine_item_scrollview == nil then
		slot0.mine_item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container1, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.scroll_container1:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 203,
			item_height = 268,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.mine_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCellMine), ScrollViewFuncType.CreateNewCell)
		slot0.mine_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCellsMine), ScrollViewFuncType.NumberOfCells)
		slot0.mine_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndexMine), ScrollViewFuncType.UpdateCellByIndex)
		slot0.mine_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouchedMine), ScrollViewFuncType.OnCellTouched)
		slot0.mine_item_scrollview:setClickEnabled(false)
	end

	if #slot0.mine_List == 0 then
		commonShowEmptyIcon(slot0.scroll_container, true, {
			text = TI18N("暂无数据")
		})
	else
		commonShowEmptyIcon(slot0.scroll_container, false)
	end

	if slot0.select_index then
		slot0.mine_item_scrollview:reloadData(slot0.select_index)
	else
		slot0.mine_item_scrollview:reloadData(1)
	end
end

function AdventureMineMyInfoPanel.createNewCellMine(slot0, slot1, slot2)
	slot3 = AdventureMineMineMyInfoItem.new(slot1, slot2, slot0)

	slot3:addCallBack(function ()
		uv0:onCellTouchedMine(uv1)
	end)

	return slot3
end

function AdventureMineMyInfoPanel.numberOfCellsMine(slot0)
	if not slot0.mine_List then
		return 0
	end

	return #slot0.mine_List
end

function AdventureMineMyInfoPanel.updateCellByIndexMine(slot0, slot1, slot2)
	slot1.index = slot2
	slot4 = slot0.my_mine_list[slot2]

	if not slot0.mine_List[slot2] then
		return
	end

	slot5 = slot1:setData(slot3, slot4)
	slot0.time_desc_list[slot2] = slot5

	slot0:updateTimeByIndex(slot2, slot5)
end

function AdventureMineMyInfoPanel.onCellTouchedMine(slot0, slot1)
	if slot0.my_mine_list[slot1.index] == nil then
		return
	end

	if slot0.select_cell then
		-- Nothing
	end

	slot0.select_index = slot2
	slot0.select_cell = slot1

	slot0:showSelectEffect(slot1)

	if slot0.select_cell then
		-- Nothing
	end

	if slot3 then
		slot0:updateEmployList(slot3)
	end
end

function AdventureMineMyInfoPanel.showSelectEffect(slot0, slot1)
	if not slot0.mine_item_scrollview then
		return
	end

	if not slot0.mine_item_scrollview.scroll_view then
		return
	end

	if slot0.select_effect == nil then
		slot0.select_effect = createEffectSpine("E23015", cc.p(0, 0), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.mine_item_scrollview.scroll_view:addChild(slot0.select_effect, 1)
	end

	slot1:setZOrder(2)

	if slot1:getPositionX() < 0 then
		slot2 = 102
	end

	slot0.select_effect:setPosition(slot2, 106)
end

function AdventureMineMyInfoPanel.removeSelectEffect(slot0)
	if slot0.select_effect then
		slot0.select_effect:setVisible(false)
		slot0.select_effect:removeFromParent()

		slot0.select_effect = nil
	end
end

function AdventureMineMyInfoPanel.startTimeTicket(slot0)
	if slot0.timeticket == nil then
		slot0:countDownEndTime()

		slot0.timeticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:countDownEndTime()
		end, 1)
	end
end

function AdventureMineMyInfoPanel.countDownEndTime(slot0)
	if slot0.mine_item_scrollview then
		for slot4, slot5 in pairs(slot0.mine_item_scrollview.activeCellIdx) do
			if slot5 and slot0.time_desc_list[slot4] then
				slot0:updateTimeByIndex(slot4, slot0.time_desc_list[slot4])
			end
		end
	end
end

function AdventureMineMyInfoPanel.updateTimeByIndex(slot0, slot1, slot2)
	if slot0.my_mine_list[slot1] and slot2 then
		if slot3.give_up_time - GameNet:getInstance():getTime() < 0 then
			slot4 = 0
			slot0.my_mine_list[slot1] = nil

			slot0:setData()
		end

		slot2:setString(TimeTool.GetTimeFormatDayIIIIIIII(slot4))
	end
end

function AdventureMineMyInfoPanel.close_callback(slot0)
	slot0:removeSelectEffect()

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	if slot0.mine_item_scrollview then
		slot0.mine_item_scrollview:DeleteMe()
	end

	slot0.mine_item_scrollview = nil

	if slot0.timeticket then
		GlobalTimeTicket:getInstance():remove(slot0.timeticket)

		slot0.timeticket = nil
	end

	if slot0.role_vo ~= nil then
		if slot0.role_assets_event ~= nil then
			slot0.role_vo:UnBind(slot0.role_assets_event)

			slot0.role_assets_event = nil
		end

		slot0.role_vo = nil
	end

	uv0:openAdventureMineMyInfoPanel(false)
end

AdventureMineEmployItem = class("AdventureMineEmployItem", function ()
	return ccui.Widget:create()
end)

function AdventureMineEmployItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function AdventureMineEmployItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("adventure/adventure_mine_employ_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.icon = slot0.container:getChildByName("icon")
	slot0.count = slot0.container:getChildByName("count")
	slot0.name = slot0.container:getChildByName("name")
	slot0.desc = slot0.container:getChildByName("desc")
	slot0.times_lable = createRichLabel(20, cc.c4b(149, 83, 34, 255), cc.p(1, 0.5), cc.p(422, 86), 6, nil, 900)

	slot0.container:addChild(slot0.times_lable)

	slot0.goto_btn = slot0.container:getChildByName("goto_btn")

	slot0.goto_btn:getChildByName("label"):setString(TI18N("雇 佣"))
end

function AdventureMineEmployItem.register_event(slot0)
	registerButtonEventListener(slot0.goto_btn, function ()
		uv0:onGotoBtn()
	end, true, 1)
end

function AdventureMineEmployItem.onGotoBtn(slot0)
	if not slot0.data then
		return
	end

	if not slot0.parent then
		return
	end

	if slot0.parent.my_mine_list == nil or #slot0.parent.my_mine_list == 0 then
		message(TI18N("暂无占领灵矿"))

		return
	end

	if slot0.data.count <= 0 then
		message(TI18N("该矿工已无购买次数"))

		return
	end

	if slot0.parent.select_index and slot0.parent.my_mine_list and slot0.parent.my_mine_list[slot0.parent.select_index] then
		slot1 = slot0.parent.my_mine_list[slot0.parent.select_index]

		uv0:send20654(slot1.floor, slot1.room_id, slot0.data.buy_type)
	end
end

function AdventureMineEmployItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot0.data.cost and next(slot0.data.cost) ~= nil then
		slot2 = Config.ItemData.data_assets_label2id.gold

		if Config.ItemData.data_get_data(slot0.data.cost[1]) then
			loadSpriteTexture(slot0.icon, PathTool.getItemRes(slot3.icon), LOADTEXT_TYPE)
		end

		slot0.count:setString(slot0.data.cost[2])
	end

	slot0.name:setString(slot0.data.name)
	slot0.desc:setString(uv0(TI18N("当前灵矿可采矿时间+%s分钟"), slot0.data.time))
	slot0.times_lable:setString(uv0(TI18N("剩余次数：<div fontcolor=#157e22>%s</div>"), slot0.data.count))
end

function AdventureMineEmployItem.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

AdventureMineMineMyInfoItem = class("AdventureMineMineMyInfoItem", function ()
	return ccui.Widget:create()
end)

function AdventureMineMineMyInfoItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function AdventureMineMineMyInfoItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("adventure/adventure_mine_my_info_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.lock_img = slot0.container:getChildByName("lock_img")
	slot0.lock_label = slot0.container:getChildByName("lock_label")
	slot0.info_lay = slot0.container:getChildByName("info_lay")
	slot0.icon = slot0.info_lay:getChildByName("icon")
	slot0.item_name = slot0.info_lay:getChildByName("item_name")
	slot0.occupy_time = slot0.info_lay:getChildByName("occupy_time")
	slot0.emplay_count = slot0.info_lay:getChildByName("emplay_count")
	slot0.item_icon = slot0.info_lay:getChildByName("item_icon")
	slot0.item_count = slot0.info_lay:getChildByName("item_count")
	slot0.goto_btn = slot0.info_lay:getChildByName("goto_btn")

	slot0.goto_btn:getChildByName("label"):setString(TI18N("前 往"))
end

function AdventureMineMineMyInfoItem.register_event(slot0)
	registerButtonEventListener(slot0.goto_btn, function ()
		uv0:onGotoBtn()
	end, true, 1)
	registerButtonEventListener(slot0.container, function ()
		if uv0.callback then
			uv0.callback()
		end
	end, false, 1)
end

function AdventureMineMineMyInfoItem.onGotoBtn(slot0)
	if not slot0.data then
		return
	end

	if not slot0.my_mine_data then
		return
	end

	if not slot0.parent then
		return
	end

	if uv0:getAdventureBaseData() and slot1.current_id ~= slot0.my_mine_data.floor then
		uv1:requestEnterAdventureMine(slot0.my_mine_data.floor, {
			room_id = slot0.my_mine_data.room_id
		})
	elseif uv1:getAdventureMineWindow() and slot2.gotoAdventureFloorRoom then
		slot2:gotoAdventureFloorRoom({
			room_id = slot0.my_mine_data.room_id
		})
	end

	slot0.parent:onClickBtnClose()
end

function AdventureMineMineMyInfoItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function AdventureMineMineMyInfoItem.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.my_mine_data = slot2

	if slot0.data.lock_sort == 1 then
		slot0.info_lay:setVisible(false)
		slot0.lock_img:setVisible(true)
		slot0.lock_label:setVisible(true)
		slot0.lock_label:setString(slot0.data.lock_str or "")
	elseif slot0.my_mine_data == nil then
		slot0.info_lay:setVisible(false)
		slot0.lock_img:setVisible(false)
		slot0.lock_label:setVisible(false)
	else
		slot0.info_lay:setVisible(true)
		slot0.lock_img:setVisible(false)
		slot0.lock_label:setVisible(false)

		slot0.mine_config = slot2.config or Config.AdventureMineData.data_mine_data(110031)

		if not slot0.mine_config then
			return
		end

		slot4 = PathTool.getPlistImgForDownLoad("adventure/mine_icon", slot0.mine_config.res_id, false)

		if slot0.record_res == nil or slot0.record_res ~= slot4 then
			slot0.record_res = slot4
			slot0.item_load = loadSpriteTextureFromCDN(slot0.icon, slot4, ResourcesType.single, slot0.item_load)
		end

		slot0.item_name:setString(slot0.mine_config.name)
		slot0.emplay_count:setString(uv0("+%sh", math.floor((slot0.parent.primary_time * slot0.my_mine_data.primary_count + slot0.parent.senior_time * slot0.my_mine_data.senior_count) / 60 * 10) / 10))

		if next(slot0.mine_config.hook_items) ~= nil then
			loadSpriteTexture(slot0.item_icon, PathTool.getItemRes(Config.ItemData.data_get_data(slot0.mine_config.hook_items[1][1]).icon), LOADTEXT_TYPE)

			if uv1:getMineRate(slot2.floor, slot0.mine_config.hook_items[1][2]) < 0 then
				slot9 = 0
			end

			slot0.item_count:setString(slot9 .. "/m")
		end

		return slot0.occupy_time
	end
end

function AdventureMineMineMyInfoItem.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
