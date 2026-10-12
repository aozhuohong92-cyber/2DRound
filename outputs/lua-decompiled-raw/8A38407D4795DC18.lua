EndlessRewardWindow = EndlessRewardWindow or BaseClass(BaseView)
slot0 = Endless_trailController:getInstance()
slot1 = Endless_trailController:getInstance():getModel()
slot2 = 10
slot3 = table.sort

function EndlessRewardWindow.__init(slot0, slot1)
	slot0.type = slot1 or Endless_trailEvent.endless_type.old
	slot0.touch_type = Endless_trailEvent.endless_type.old
	slot0.is_full_screen = false
	slot0.layout_name = "endlesstrail/endlesstrail_reward_window"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.partner_list = {}
end

function EndlessRewardWindow.open_callback(slot0, ...)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.win_title = slot0.main_panel:getChildByName("win_title")

	slot0.win_title:setString(TI18N("奖励一览"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.scroll_list = slot0.main_panel:getChildByName("scroll_list")
	slot0.desc = slot0.main_panel:getChildByName("desc")

	slot0.desc:setString(TI18N("累计通关越多，获得奖励越多"))

	slot1 = slot0.scroll_list:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.scroll_list, cc.p(0, 10), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot1.width, slot1.height - 20), {
		start_y = 0,
		item_width = 586,
		start_x = 10,
		space_x = 0,
		row = 0,
		item_height = 170,
		space_y = 5,
		col = 1,
		need_dynamic = true,
		item_class = EndlessRewardItem
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.emptyTips = createImage(slot0.scroll_list, PathTool.getEmptyMark(), slot1.width / 2, 450, cc.p(0.5, 1))

	slot0.emptyTips:setVisible(false)

	slot0.empty_label = createLabel(26, Config.ColorData.data_color4[274], nil, slot0.emptyTips:getContentSize().width / 2, -35, TI18N("暂时没有奖励"), slot0.emptyTips, 0, cc.p(0.5, 0))
	slot0.btn_panel = slot0.main_panel:getChildByName("btn_panel")

	if uv0:checkNewEndLessIsShow() == true then
		slot0.sub_tab_array = {
			{
				index = 1,
				title = TI18N("日常奖励")
			},
			{
				index = 2,
				title = TI18N("排行奖励")
			},
			{
				index = 3,
				title = TI18N("综合奖励")
			},
			{
				index = 4,
				title = TI18N("海贼新星奖励")
			},
			{
				index = 5,
				title = TI18N("草帽联盟奖励")
			},
			{
				index = 6,
				title = TI18N("强者奖励")
			},
			{
				index = 7,
				title = TI18N("海军皇团奖励")
			}
		}
	else
		slot0.sub_tab_array = {
			{
				index = 1,
				title = TI18N("日常奖励")
			},
			{
				index = 2,
				title = TI18N("排行奖励")
			},
			{
				index = 3,
				title = TI18N("综合奖励")
			}
		}
	end

	if not slot0.sub_tab_scrollview then
		slot0.sub_tab_scrollview = CommonSubBtnList.new(slot0.btn_panel, cc.p(0, 0.5), cc.p(0, slot0.btn_panel:getContentSize().height * 0.5), cc.size(160, 50), handler(slot0, slot0.changeSelectedTab))
	end

	slot0.sub_tab_scrollview:setData(slot0.sub_tab_array, 1)
	slot0.btn_panel:setScrollBarEnabled(false)

	slot4 = 160 * #slot0.sub_tab_array + 10

	slot0.btn_panel:setInnerContainerSize(cc.size(slot4, 50))

	if slot4 > 600 then
		slot4 = 600
	end

	slot0.btn_panel:setContentSize(cc.size(slot4, 60))
	slot0:register_event()
end

function EndlessRewardWindow.register_event(slot0, ...)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:openEndlessRewardWindow(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				uv0:openEndlessRewardWindow(false)
			end
		end)
	end

	if not slot0.update_base_event then
		slot0.update_base_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_BASE_DATA, function ()
			uv0:updateItemData()
		end)
	end

	if not slot0.update_first_event then
		slot0.update_first_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_FIRST_DATA, function ()
			uv0:updateItemData()
		end)
	end
end

function EndlessRewardWindow.changeSelectedTab(slot0, slot1)
	slot0.desc:setVisible(false)

	if slot1 == 1 then
		slot0.desc:setVisible(true)
	end

	if slot1 == 4 then
		slot0.touch_type = Endless_trailEvent.endless_type.water

		uv0:send23903(slot0.touch_type)
	elseif slot1 == 5 then
		slot0.touch_type = Endless_trailEvent.endless_type.fire

		uv0:send23903(slot0.touch_type)
	elseif slot1 == 6 then
		slot0.touch_type = Endless_trailEvent.endless_type.wind

		uv0:send23903(slot0.touch_type)
	elseif slot1 == 7 then
		slot0.touch_type = Endless_trailEvent.endless_type.light_dark

		uv0:send23903(slot0.touch_type)
	elseif slot1 == 3 then
		slot0.touch_type = Endless_trailEvent.endless_type.old

		uv0:send23903(slot0.touch_type)
	end

	slot0.cur_selected = slot1

	slot0:updateItemData()
end

function EndlessRewardWindow.updateItemData(slot0)
	slot1 = {}

	if Config.EndlessData then
		slot3 = uv0:getEndlessData()

		if slot0.cur_selected == 3 or slot0.cur_selected == 4 or slot0.cur_selected == 5 or slot0.cur_selected == 6 or slot0.cur_selected == 7 then
			if slot2.data_first_data and slot2.data_first_data[slot0.touch_type] and uv0:getFirstData(slot0.touch_type) then
				slot5 = 1
				slot9 = slot0.touch_type

				for slot9, slot10 in ipairs(slot2.data_first_data[slot9]) do
					if slot4.id <= slot10.id then
						slot11 = false

						if slot4.rewarded then
							for slot15, slot16 in pairs(slot4.rewarded) do
								if slot16.id == slot10.id then
									slot11 = true
								end
							end
						end

						table.insert(slot1, {
							select_index = slot0.cur_selected,
							id = slot10.id,
							items = deepCopy(slot10.items),
							limit_id = slot10.limit_id,
							can_receive = slot10.limit_id <= slot4.max_id and slot4.status == 1,
							is_receive = slot11,
							type = slot0.touch_type,
							max_id = slot4.max_id
						})

						if uv1 < slot5 + 1 then
							break
						end
					end
				end
			end
		elseif slot0.cur_selected == 1 then
			if slot2.data_floor_data and slot2.data_floor_data[slot0.type] and slot3 then
				slot4 = 1
				slot5 = slot3.new_current_round

				if slot0.type == Endless_trailEvent.endless_type.old then
					slot5 = slot3.current_round
				end

				slot9 = slot0.type

				for slot9, slot10 in ipairs(slot2.data_floor_data[slot9]) do
					if slot5 <= slot9 then
						table.insert(slot1, {
							select_index = slot0.cur_selected,
							is_cur_round = slot9 == slot5,
							round = slot9,
							items = deepCopy(slot10.items),
							type = slot0.type
						})

						if uv1 < slot4 + 1 then
							break
						end
					end
				end
			end
		elseif slot0.cur_selected == 2 then
			slot4 = deepCopy(Config.EndlessData.data_rank_reward_data[slot0.type])
			slot8 = SortTools.KeyLowerSorter

			uv2(slot4, slot8("min"))

			for slot8, slot9 in ipairs(slot4) do
				slot9.index = slot8
			end

			for slot8, slot9 in ipairs(slot4) do
				slot10 = string.format("%s~%s", slot9.min, slot9.max)

				if slot9.min == slot9.max then
					slot10 = string.format("%s", slot9.min)
				end

				table.insert(slot1, {
					select_index = slot0.cur_selected,
					items = deepCopy(slot9.items),
					type = slot0.type,
					title = slot10
				})
			end
		end
	end

	if next(slot1) == nil then
		slot0.emptyTips:setVisible(true)
	else
		slot0.emptyTips:setVisible(false)
	end

	slot0.item_scrollview:setData(slot1)
end

function EndlessRewardWindow.openRootWnd(slot0, ...)
end

function EndlessRewardWindow.close_callback(slot0, ...)
	if slot0.update_first_event then
		GlobalEvent:getInstance():UnBind(slot0.update_first_event)

		slot0.update_first_event = nil
	end

	if slot0.update_base_event then
		GlobalEvent:getInstance():UnBind(slot0.update_base_event)

		slot0.update_base_event = nil
	end

	uv0:openEndlessRewardWindow(false)
end

EndlessRewardItem = class("EndlessRewardItem", function ()
	return ccui.Layout:create()
end)

function EndlessRewardItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_reward_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.title_label = slot0.main_panel:getChildByName("title_label")
	slot0.reward_container = slot0.main_panel:getChildByName("reward_container")
	slot0.first_btn_container = slot0.main_panel:getChildByName("first_btn_container")
	slot0.btn_receive = slot0.first_btn_container:getChildByName("btn_receive")
	slot0.btn_receive_label = slot0.btn_receive:getChildByName("label")

	slot0.btn_receive_label:setString(TI18N("领取"))

	slot0.receive_txt = slot0.first_btn_container:getChildByName("receive_txt")

	slot0.receive_txt:setString(TI18N("关后领取"))
	UITool.SetLightColor(slot0.receive_txt)

	slot0.receive_level = slot0.first_btn_container:getChildByName("receive_level")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.reward_container, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.reward_container:getContentSize(), {
		start_y = 0,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0:registerEvent()
end

function EndlessRewardItem.registerEvent(slot0)
	if slot0.btn_receive then
		slot0.btn_receive:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if ccui.TouchEventType.ended == slot1 then
				playButtonSound()

				if uv0.data and uv0.data.id and uv0.type then
					uv1:send23904(uv0.data.id, uv0.type)
				end
			end
		end)
	end
end

function EndlessRewardItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.type = slot1.type

	if slot0.data.select_index == 3 or slot0.data.select_index == 4 or slot0.data.select_index == 5 or slot0.data.select_index == 6 or slot0.data.select_index == 7 then
		slot0.first_btn_container:setVisible(true)
		slot0.btn_receive:setVisible(slot0.data.can_receive)

		if slot0.data.is_receive then
			slot0.btn_receive_label:setString(TI18N("已领取"))
			setChildUnEnabled(true, slot0.btn_receive)
			slot0.btn_receive:setEnabled(false)
			slot0.btn_receive_label:disableEffect(cc.LabelEffect.OUTLINE)
		else
			slot0.btn_receive_label:setString(TI18N("领取"))
			setChildUnEnabled(false, slot0.btn_receive)
			slot0.btn_receive:setEnabled(true)
			slot0.btn_receive_label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
		end

		slot0.receive_level:setVisible(not slot0.data.can_receive)
		slot0.receive_txt:setVisible(not slot0.data.can_receive)

		slot2 = string.format(TI18N("首通奖励(第%s关)"), slot0.data.limit_id) or ""

		if not slot0.data.can_receive then
			if slot1.max_id <= slot0.data.limit_id then
				slot0.receive_level:setString(slot0.data.limit_id - slot3)
			else
				slot0.receive_level:setString("0")
			end
		end

		slot0.title_label:setString(slot2)
	elseif slot0.data.select_index == 1 then
		slot0.first_btn_container:setVisible(false)

		slot2 = TI18N("当前关卡")

		if not slot0.data.is_cur_round then
			slot2 = string.format(TI18N("通关第%s关"), slot0.data.round)
		end

		slot0.title_label:setString(slot2)
	elseif slot0.data.select_index == 2 then
		slot0.first_btn_container:setVisible(false)
		slot0.title_label:setString(string.format(TI18N("第%s名"), slot0.data.title))
	end

	slot2 = {}

	for slot6, slot7 in pairs(slot1.items) do
		table.insert(slot2, {
			id = slot7[1],
			quantity = slot7[2]
		})
	end

	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5.effect = false

			slot5:setDefaultTip()
			slot5:setSwallowTouches(true)
		end
	end)
	slot0.item_scrollview:setData(slot2)
end

function EndlessRewardItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
