ArenaChampionReportWindow = ArenaChampionReportWindow or BaseClass(BaseView)
slot0 = ArenaController:getInstance()
slot1 = ArenaController:getInstance():getModel()
slot2 = table.insert

function ArenaChampionReportWindow.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Big
	slot0.layout_name = "arena/arena_champion_report_window"
	slot0.res_list = {}
	slot0.view_type = slot1 or ArenaConst.champion_type.normal
end

function ArenaChampionReportWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot6 = TI18N

	slot1:getChildByName("main_panel"):getChildByName("win_title"):setString(slot6("数据统计"))

	for slot6 = 1, 3 do
		if slot2:getChildByName("desc_" .. slot6) then
			if slot6 == 1 then
				slot7:setString(TI18N("伤害"))
			elseif slot6 == 2 then
				slot7:setString(TI18N("承受伤害"))
			else
				slot7:setString(TI18N("治疗"))
			end
		end
	end

	slot0.item = slot2:getChildByName("item")

	slot0.item:setVisible(false)

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.top_list_view = slot2:getChildByName("top_list_view")
	slot0.bottom_list_view = slot2:getChildByName("bottom_list_view")
	slot0.check_btn = slot2:getChildByName("check_btn")
	slot0.top_name = slot2:getChildByName("top_name")
	slot0.bottom_name = slot2:getChildByName("bottom_name")
	slot0.success_img = slot2:getChildByName("success_img")
	slot0.top_y = 702
	slot0.bottom_y = 360
end

function ArenaChampionReportWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openArenaChampionReportWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openArenaChampionReportWindow(false)
		end
	end)
	slot0.check_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.data.replay_id ~= 0 then
				if uv0.view_type == ArenaConst.champion_type.cross then
					if CrosschampionController:getInstance():getModel():getBaseInfo() then
						BattleController:getInstance():csRecordBattle(uv0.data.replay_id, slot2.srv_id)
					else
						BattleController:getInstance():csRecordBattle(uv0.data.replay_id)
					end
				else
					BattleController:getInstance():csRecordBattle(uv0.data.replay_id)
				end
			end
		end
	end)
end

function ArenaChampionReportWindow.openRootWnd(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.data = slot1

	slot0:setBaseInfo()
	slot0:setTopInfo()
	slot0:setBottomInfo()
end

function ArenaChampionReportWindow.setBaseInfo(slot0)
	slot0.success_img:setVisible(slot0.data.ret ~= 0)

	if slot0.data.ret == 1 then
		slot0.success_img:setPositionY(slot0.top_y)
	elseif slot0.data.ret == 2 then
		slot0.success_img:setPositionY(slot0.bottom_y)
	end

	slot0.top_name:setString(slot0.data.a_name or "")
	slot0.bottom_name:setString(slot0.data.b_name or "")
end

function ArenaChampionReportWindow.setTopInfo(slot0)
	for slot7, slot8 in ipairs(slot0.data.a_plist) do
		slot1 = 0 + slot8.hurt
		slot2 = 0 + slot8.behurt
		slot3 = 0 + slot8.curt
	end

	if slot0.top_scroll_view == nil then
		slot0.top_scroll_view = CommonScrollViewLayout.new(slot0.top_list_view, nil, ScrollViewDir.horizontal, nil, slot0.top_list_view:getContentSize(), {
			start_y = 0,
			item_width = 122,
			start_x = 0,
			space_x = 0,
			row = 1,
			item_height = 278,
			space_y = 0,
			col = 1,
			item_class = ArenaChampionReportItem
		})
	end

	slot0.top_scroll_view:setVisible(true)
	slot0.top_scroll_view:setData(slot0.data.a_plist, nil, , {
		total_hurt = slot1,
		total_behurt = slot2,
		total_curt = slot3,
		node = slot0.item
	})
end

function ArenaChampionReportWindow.setBottomInfo(slot0)
	for slot7, slot8 in ipairs(slot0.data.b_plist) do
		slot1 = 0 + slot8.hurt
		slot2 = 0 + slot8.behurt
		slot3 = 0 + slot8.curt
	end

	if slot0.bottom_scroll_view == nil then
		slot0.bottom_scroll_view = CommonScrollViewLayout.new(slot0.bottom_list_view, nil, ScrollViewDir.horizontal, nil, slot0.bottom_list_view:getContentSize(), {
			start_y = 0,
			item_width = 122,
			start_x = 0,
			space_x = 0,
			row = 1,
			item_height = 278,
			space_y = 0,
			col = 1,
			item_class = ArenaChampionReportItem
		})
	end

	slot0.bottom_scroll_view:setVisible(true)
	slot0.bottom_scroll_view:setData(slot0.data.b_plist, nil, , {
		total_hurt = slot1,
		total_behurt = slot2,
		total_curt = slot3,
		node = slot0.item
	})
end

function ArenaChampionReportWindow.close_callback(slot0)
	if slot0.top_scroll_view then
		slot0.top_scroll_view:DeleteMe()
	end

	slot0.top_scroll_view = nil

	if slot0.bottom_scroll_view then
		slot0.bottom_scroll_view:DeleteMe()
	end

	slot0.bottom_scroll_view = nil

	uv0:openArenaChampionReportWindow(false)
end

ArenaChampionReportItem = class("ArenaChampionReportItem", function ()
	return ccui.Layout:create()
end)

function ArenaChampionReportItem.ctor(slot0)
	slot0.is_completed = false
end

function ArenaChampionReportItem.setExtendData(slot0, slot1)
	slot0.total_hurt = slot1.total_hurt
	slot0.total_behurt = slot1.total_behurt
	slot0.total_curt = slot1.total_curt

	if not tolua.isnull(slot1.node) and slot0.root_wnd == nil then
		slot0.is_completed = true
		slot3 = slot2:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot3)

		slot0.root_wnd = slot2:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot3.width * 0.5, slot3.height * 0.5)

		slot7 = slot0.root_wnd

		slot0:addChild(slot7)

		for slot7 = 1, 3 do
			slot0["progress_" .. slot7] = slot0.root_wnd:getChildByName("progress_" .. slot7)

			if slot0["progress_" .. slot7] then
				slot0["progress_" .. slot7]:setScale9Enabled(true)
			end

			slot0["desc_" .. slot7] = slot0.root_wnd:getChildByName("desc_" .. slot7)
		end

		slot0.partner_item = HeroExhibitionItem.new(0.8, false)

		slot0.partner_item:setPosition(61, 198)
		slot0.root_wnd:addChild(slot0.partner_item)
	end
end

function ArenaChampionReportItem.setData(slot0, slot1)
	if slot1 then
		slot0.partner_item:setData(slot1, true)
		slot0.desc_1:setString(slot1.hurt)
		slot0.desc_2:setString(slot1.behurt)
		slot0.desc_3:setString(slot1.curt)

		if slot0.total_hurt == 0 then
			slot0.progress_1:setPercent(0)
		else
			slot0.progress_1:setPercent(100 * slot1.hurt / slot0.total_hurt)
		end

		if slot0.total_behurt == 0 then
			slot0.progress_2:setPercent(0)
		else
			slot0.progress_2:setPercent(100 * slot1.behurt / slot0.total_behurt)
		end

		if slot0.total_curt == 0 then
			slot0.progress_3:setPercent(0)
		else
			slot0.progress_3:setPercent(100 * slot1.curt / slot0.total_curt)
		end
	end
end

function ArenaChampionReportItem.DeleteMe(slot0)
	if slot0.partner_item then
		slot0.partner_item:DeleteMe()

		slot0.partner_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
