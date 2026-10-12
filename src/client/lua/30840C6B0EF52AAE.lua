ArenapeakchampionGuessingTabPromotion = class("ArenapeakchampionGuessingTabPromotion", function ()
	return ccui.Widget:create()
end)
slot1 = ArenapeakchampionController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
slot4 = table.sort

function ArenapeakchampionGuessingTabPromotion.ctor(slot0, slot1)
	slot0.parent = slot1
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ArenapeakchampionGuessingTabPromotion.config(slot0)
	slot0.match_panel_list = {}
	slot0.item_width = 123
	slot0.centre_btn_index = 0
end

function ArenapeakchampionGuessingTabPromotion.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenapeakchampion/arenapeakchampion_guessing_tab_promotion"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.zone_status = slot0.container:getChildByName("zone_status")

	slot0.zone_status:setString("")

	slot0.time_label = slot0.container:getChildByName("time_label")

	slot0.time_label:setString("--:--")

	slot0.zone_name = slot0.container:getChildByName("zone_name")

	slot0.zone_name:setString("--")

	slot0.zone_btn = slot0.container:getChildByName("zone_btn")
	slot0.zone_icon = slot0.container:getChildByName("promotion_16")
	slot0.centre_btn = slot0.container:getChildByName("centre_btn")
	slot0.centre_btn_label = slot0.centre_btn:getChildByName("label")

	slot0.centre_btn:setVisible(false)

	slot0.bootom_left_btn = slot0.container:getChildByName("bootom_left_btn")
	slot0.bootom_right_btn = slot0.container:getChildByName("bootom_right_btn")
	slot0.bottom_bg = slot0.container:getChildByName("bottom_bg")
	slot0.tips_label = slot0.container:getChildByName("tips_label")

	slot0.tips_label:setString(TI18N("向下滑动查看更多"))

	slot0.lay_scrollview = slot0.container:getChildByName("lay_scrollview")
	slot0.lay_scrollview_size = slot0.lay_scrollview:getContentSize()
	slot0.lay_scrollview_centre = slot0.container:getChildByName("lay_scrollview_centre")
	slot0.lay_scrollview_centre_size = slot0.lay_scrollview_centre:getContentSize()
	slot0.centre_scroll_view = createScrollView(slot0.lay_scrollview_centre_size.width, slot0.lay_scrollview_centre_size.height, 0, 0, slot0.lay_scrollview_centre, ScrollViewDir.vertical)
	slot0.match_panel_height = 782
	slot0.centre_scroll_view_height = slot0.match_panel_height * 2

	slot0.centre_scroll_view:setInnerContainerSize(cc.size(720, slot0.centre_scroll_view_height))

	slot0.stage_label = slot0.container:getChildByName("stage_label")

	if slot0.stage_label then
		slot0.stage_label:setString("")
	end

	slot0:updateTime()
end

function ArenapeakchampionGuessingTabPromotion.registerEvents(slot0)
	registerButtonEventListener(slot0.look_btn, function ()
		uv0:onClickLookBtn()
	end, true, 1)
	registerButtonEventListener(slot0.bootom_left_btn, function ()
		uv0:onClickTurnBtn(-1)
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.bootom_right_btn, function ()
		uv0:onClickTurnBtn(1)
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.centre_btn, function ()
		uv0:onClickCentreBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.zone_btn, function ()
		uv0:onClickZoneBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	if slot0.top_64_event == nil then
		slot0.top_64_event = GlobalEvent:getInstance():Bind(ArenapeakchampionEvent.ARENAPEAKCHAMPION_TOP_64_EVENT, function ()
			uv0:initData()
		end)
	end

	if slot0.top_8_event == nil then
		slot0.top_8_event = GlobalEvent:getInstance():Bind(ArenapeakchampionEvent.ARENAPEAKCHAMPION_TOP_8_EVENT, function (slot0)
			uv0:initData()
		end)
	end

	if slot0.apc_main_event == nil then
		slot0.apc_main_event = GlobalEvent:getInstance():Bind(ArenapeakchampionEvent.ARENAPEAKCHAMPION_MAIN_EVENT, function (slot0)
			uv0:updateTime()
		end)
	end
end

function ArenapeakchampionGuessingTabPromotion.updateTime(slot0)
	if not slot0.zone_status then
		return
	end

	if not slot0.time_label then
		return
	end

	if uv0:getMainData() then
		if slot1.step ~= 0 then
			doStopAllActions(slot0.time_label)

			if slot1.round_status_time - GameNet:getInstance():getTime() < 0 then
				slot2 = 0
			end

			commonCountDownTime(slot0.time_label, slot2)

			if slot0.select_zone_index == nil then
				slot0.zone_name:setString(uv1(TI18N("第%s赛区"), slot1.zone_id))
			end

			slot3, slot4 = uv0:getMacthText(slot1.step, slot1.round, slot1.round_status)

			if slot0.stage_label then
				slot0.stage_label:setString(slot4 or "")
			end
		elseif slot1.step_status == 2 then
			slot0.time_label:setString("--:--")

			if slot0.select_zone_index == nil then
				slot0.zone_name:setString(uv1(TI18N("第%s赛区"), slot1.zone_id))
			end

			slot2, slot3 = uv0:getMacthText(slot1.step, slot1.round, slot1.round_status)

			if slot0.stage_label then
				slot0.stage_label:setString(slot3 or "")
			end
		else
			slot0.zone_status:setString("")
			slot0.time_label:setString("--:--")
			slot0.zone_name:setString("--")

			if slot0.stage_label then
				slot0.stage_label:setString(TI18N("未开赛"))
			end
		end
	else
		slot0.zone_status:setString("")
		slot0.time_label:setString("--:--")
		slot0.zone_name:setString("--")

		if slot0.stage_label then
			slot0.stage_label:setString(TI18N("未开赛"))
		end
	end
end

function ArenapeakchampionGuessingTabPromotion.onClickZoneBtn(slot0)
	if uv0:getMainData() == nil or slot1.step == 0 then
		return
	end

	if slot1.max_zone_id == 0 then
		return
	end

	slot0.main_data = slot1
	slot2 = slot0.zone_btn:convertToWorldSpace(cc.p(0, 0))

	if not slot0.zone_list then
		slot0.zone_list = {}

		for slot6 = 1, slot1.max_zone_id do
			uv2(slot0.zone_list, {
				id = slot6,
				value = uv1(TI18N("第%s赛区"), slot6)
			})
		end

		uv3(slot0.zone_list, SortTools.KeyLowerSorter("id"))
	end

	slot3 = {
		other_index = slot1.zone_id or 1
	}
	slot3.select_index = slot0.select_zone_index or slot3.other_index
	slot3.offsetx = 108
	slot3.offsety = 0
	slot3.combobox_max_size = cc.size(236, 190)
	slot3.combobox_bg_size = cc.size(244, 198)
	slot3.dir_type = 1
	slot3.combo_show_type = 2

	CommonUIController:getInstance():openCommonComboboxPanel(true, slot2, handler(slot0, slot0.onChoseZoneBtn), slot0.zone_list, slot3)
end

function ArenapeakchampionGuessingTabPromotion.onChoseZoneBtn(slot0, slot1, slot2, slot3)
	if not slot0.main_data then
		return
	end

	slot0.current_zone = slot2.id

	if slot0.tab_type == ArenapeakchampionConstants.guessing_tab.ePromotion then
		uv0:sender27709(slot0.current_zone, 1)
	else
		slot0:checkSender()
	end

	slot0.select_zone_index = slot1

	slot0.zone_name:setString(slot2.value)

	if slot0.main_data.zone_id == slot2.id then
		slot0.zone_icon:setVisible(true)
	else
		slot0.zone_icon:setVisible(false)
	end
end

function ArenapeakchampionGuessingTabPromotion.onClickCentreBtn(slot0)
	if slot0.centre_btn_index == 1 then
		slot0.centre_btn_index = 2
	else
		slot0.centre_btn_index = 1
	end

	slot0:checkSender()
	slot0:updateName()
end

function ArenapeakchampionGuessingTabPromotion.initData(slot0)
	slot1 = 0

	if slot0.tab_type == ArenapeakchampionConstants.guessing_tab.ePromotion then
		slot1 = uv0.max_group_256[slot0.current_zone] or 16
		slot0.select_index = slot0.select_group_256 or 1
	elseif slot0.centre_btn_index == 1 then
		slot1 = uv0.max_group_64[slot0.current_zone] or 8
		slot0.select_index = slot0.select_group_64 or 1
	else
		slot0:updateCentreInfo8()
	end

	if slot1 > 0 then
		slot0.bootom_left_btn:setVisible(true)
		slot0.bootom_right_btn:setVisible(true)
		slot0.bottom_bg:setVisible(true)

		slot5 = true

		slot0.lay_scrollview:setVisible(slot5)

		slot0.show_list = {}

		for slot5 = 1, slot1 do
			uv1(slot0.show_list, slot5)
		end

		slot0:updateList()
	else
		slot0.bootom_left_btn:setVisible(false)
		slot0.bootom_right_btn:setVisible(false)
		slot0.bottom_bg:setVisible(false)
		slot0.lay_scrollview:setVisible(false)
	end
end

function ArenapeakchampionGuessingTabPromotion.initMatchPanelList(slot0, slot1, slot2, slot3, slot4)
	if not slot1 then
		return
	end

	if not slot0.centre_scroll_view then
		return
	end

	for slot8, slot9 in ipairs(slot0.match_panel_list) do
		slot9:setVisible(false)
	end

	for slot8 = 1, slot1 do
		if slot0.match_panel_list[slot8] == nil then
			slot0.match_panel_list[slot8] = MatchImgPanel.new()

			slot0.match_panel_list[slot8]:setPosition(360, slot0.centre_scroll_view_height - (slot8 - 1 + 0.5) * slot0.match_panel_height)
			slot0.centre_scroll_view:addChild(slot0.match_panel_list[slot8])
		else
			slot0.match_panel_list[slot8]:setVisible(true)

			if slot1 == 2 and slot8 == 1 then
				slot0.match_panel_list[slot8]:setPosition(360, slot0.centre_scroll_view_height - (slot8 - 1 + 0.5) * slot0.match_panel_height)
			end
		end

		slot0.match_panel_list[slot8]:setCetrePanelVisible(slot2)

		if slot3 and slot3[slot8] then
			slot0.match_panel_list[slot8]:setData(slot3[slot8], slot4)
			slot0.match_panel_list[slot8]:setExtendDdata(slot0.current_zone, slot0.select_index)
		else
			slot0.match_panel_list[slot8]:setData(nil, slot4)
		end
	end

	if slot1 == 1 and slot0.match_panel_list[1] then
		slot0.match_panel_list[1]:setPosition(360, slot0.centre_scroll_view_height - ((slot0.centre_scroll_view:getContentSize().height - slot0.match_panel_height) * 0.5 + slot0.match_panel_height * 0.5))
	end
end

function ArenapeakchampionGuessingTabPromotion.updateList(slot0)
	if not slot0.lay_scrollview then
		return
	end

	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.lay_scrollview_size, {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_height = 50,
			space_y = 0,
			col = 1,
			item_width = slot0.item_width
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end

	slot0.item_scrollview:reloadData(slot0.select_index or 1)
end

function ArenapeakchampionGuessingTabPromotion.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Widget:create()

	slot3:setAnchorPoint(0.5, 0.5)
	slot3:setContentSize(cc.size(slot1, slot2))
	slot3:setTouchEnabled(true)

	slot4 = PathTool.getResFrame("arenapeakchampion", "arenapeakchampion_promotion_08", false, "arenapeak_guessing")
	slot3.left_img = createSprite(slot4, -0.5, slot2 * 0.5, slot3, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot3.right_img = createSprite(slot4, slot1 + 0.5, slot2 * 0.5, slot3, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot3.select_img = createSprite(PathTool.getResFrame("arenapeakchampion", "arenapeakchampion_promotion_09", false, "arenapeak_guessing"), slot1 * 0.5, slot2 * 0.5, slot3, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot3.text_label = createLabel(24, cc.c4b(105, 55, 5, 255), nil, slot1 * 0.5, slot2 * 0.5, "0", slot3, nil, cc.p(0.5, 0.5))

	registerButtonEventListener(slot3, function ()
		uv0:onCellTouched(uv1)
	end, false, 2)

	return slot3
end

function ArenapeakchampionGuessingTabPromotion.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenapeakchampionGuessingTabPromotion.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1.text_label:setString(StringUtil.numToChinese(slot2))

	if slot0.select_index == slot2 then
		slot1.select_img:setVisible(true)
		slot1.text_label:disableEffect(cc.LabelEffect.OUTLINE)
		slot1.text_label:setTextColor(cc.c4b(105, 55, 5, 255))
	else
		slot1.select_img:setVisible(false)
		slot1.text_label:enableOutline(cc.c4b(88, 45, 20, 255), 2)
		slot1.text_label:setTextColor(cc.c4b(244, 220, 161, 255))
	end
end

function ArenapeakchampionGuessingTabPromotion.onCellTouched(slot0, slot1)
	if not slot1.index then
		return
	end

	slot0.select_index = slot2

	slot0:updateSelectIndex()
end

function ArenapeakchampionGuessingTabPromotion.onClickTurnBtn(slot0, slot1)
	if not slot0.select_index then
		return
	end

	if slot0:numberOfCells() == 0 then
		return
	end

	slot0.select_index = slot0.select_index + slot1

	if slot0.select_index <= 0 then
		slot0.select_index = 1
	elseif slot2 < slot0.select_index then
		slot0.select_index = slot2
	end

	slot0:updateSelectIndex()
end

function ArenapeakchampionGuessingTabPromotion.updateSelectIndex(slot0)
	if not slot0.select_index then
		return
	end

	if not slot0.lay_scrollview_size then
		return
	end

	if not slot0.item_scrollview:getCellByIndex(slot0.select_index) then
		return
	end

	slot3 = slot0.item_scrollview:getCellXYByIndex(slot0.select_index) - slot0.item_width * 0.5 + slot0.item_width
	slot5 = -slot0.item_scrollview:getContainerXY() + slot0.lay_scrollview_size.width

	if slot0.select_item then
		slot0.select_item.select_img:setVisible(false)
		slot0.select_item.text_label:enableOutline(cc.c4b(88, 45, 20, 255), 2)
		slot0.select_item.text_label:setTextColor(cc.c4b(244, 220, 161, 255))
	end

	slot0.select_item = slot1

	if slot0.select_item then
		slot0.select_item.select_img:setVisible(true)
		slot0.select_item.text_label:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.select_item.text_label:setTextColor(cc.c4b(105, 55, 5, 255))
	end

	if slot2 < slot4 or slot3 < slot4 then
		slot0.item_scrollview:setContainerXY(-slot2)
		slot0.item_scrollview:checkRectIntersectsRect()
	elseif slot5 < slot2 or slot5 < slot3 then
		slot0.item_scrollview:setContainerXY(-(slot3 - slot0.lay_scrollview_size.width))
		slot0.item_scrollview:checkRectIntersectsRect()
	end

	if slot0.tab_type == ArenapeakchampionConstants.guessing_tab.ePromotion then
		slot0.select_group_256 = slot0.select_index

		slot0:updateCentreInfo256(slot0.select_index)
	elseif slot0.centre_btn_index == 1 then
		slot0.select_group_64 = slot0.select_index

		slot0:updateCentreInfo64(slot0.select_index)
	else
		slot0:updateCentreInfo8()
	end
end

function ArenapeakchampionGuessingTabPromotion.changeData(slot0, slot1)
	slot2 = {
		{},
		{}
	}

	for slot7, slot8 in ipairs(slot1) do
		slot8.new_pos = ({
			1,
			2,
			3,
			4,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			5,
			6,
			7,
			8,
			9,
			10,
			9,
			10,
			11,
			12,
			11,
			12,
			13,
			14,
			13,
			14
		})[slot8.pos]

		if slot8.pos >= 1 and slot8.pos <= 4 or slot8.pos >= 9 and slot8.pos <= 12 or slot8.pos == 17 or slot8.pos == 18 or slot8.pos == 21 or slot8.pos == 22 or slot8.pos == 25 or slot8.pos == 26 then
			uv0(slot2[1], slot8)
		else
			uv0(slot2[2], slot8)
		end
	end

	return slot2
end

function ArenapeakchampionGuessingTabPromotion.updateCentreInfo256(slot0, slot1)
	if uv0:getMatchData256ByGroup(slot1, slot0.current_zone) and next(slot2) ~= nil then
		uv1(slot2, function (slot0, slot1)
			return slot0.pos < slot1.pos
		end)
		slot0:initMatchPanelList(2, false, slot0:changeData(slot2), 256)
	else
		slot0:initMatchPanelList(2, false, nil, 256)
	end
end

function ArenapeakchampionGuessingTabPromotion.updateCentreInfo64(slot0, slot1)
	if uv0:getMatchData64ByGroup(slot1, slot0.current_zone) and next(slot2) ~= nil then
		uv1(slot2, function (slot0, slot1)
			return slot0.pos < slot1.pos
		end)
		slot0:initMatchPanelList(1, true, {
			slot2
		}, 64)
	else
		slot0:initMatchPanelList(1, true, nil, 64)
	end
end

function ArenapeakchampionGuessingTabPromotion.updateCentreInfo8(slot0)
	if uv0:getMatchData8(slot0.current_zone) and next(slot1) ~= nil then
		uv1(slot1, function (slot0, slot1)
			return slot0.pos < slot1.pos
		end)
		slot0:initMatchPanelList(1, true, {
			slot1
		}, 8)
	else
		slot0:initMatchPanelList(1, true, nil, 8)
	end
end

function ArenapeakchampionGuessingTabPromotion.setVisibleStatus(slot0, slot1, slot2)
	slot0:setVisible(slot1)

	if slot1 and slot0.centre_scroll_view then
		slot3 = uv0:getMainData()

		if slot0.current_zone == nil then
			slot0.current_zone = 0
		end

		slot0.tab_type = slot2

		if slot0.tab_type == ArenapeakchampionConstants.guessing_tab.ePromotion then
			slot0.centre_btn:setVisible(false)
			slot0.centre_scroll_view:setTouchEnabled(true)

			if slot3 and slot3.step ~= 0 then
				if slot0.current_zone == 0 then
					slot0.current_zone = slot3.zone_id
				end

				if uv0:getMatchData256ByGroup(1, slot0.current_zone) then
					slot0:initData()
				else
					uv1:sender27709(slot0.current_zone, 1)
				end
			else
				slot0:initData()
			end
		else
			slot0.centre_btn:setVisible(true)
			slot0.centre_scroll_view:setTouchEnabled(false)
			slot0.centre_scroll_view:stopAutoScroll()
			slot0.centre_scroll_view:getInnerContainer():setPosition(0, slot0.centre_scroll_view:getContentSize().height - slot0.centre_scroll_view_height)
			slot0:checkSender()
		end

		slot0:updateName()
	end
end

function ArenapeakchampionGuessingTabPromotion.updateName(slot0)
	if slot0.tab_type == ArenapeakchampionConstants.guessing_tab.ePromotion then
		slot0.zone_status:setString(TI18N("晋级赛 256进64"))

		if slot0.tips_label then
			slot0.tips_label:setVisible(true)
			slot0.tips_label:setVisible(true)
			slot0.tips_label:runAction(cc.Sequence:create(cc.FadeIn:create(0.8), cc.FadeOut:create(0.8), cc.FadeIn:create(1), cc.FadeOut:create(1), cc.CallFunc:create(function ()
				uv0.tips_label:setVisible(false)
			end)))
		end
	else
		if slot0.tips_label then
			doStopAllActions(slot0.tips_label)
			slot0.tips_label:setVisible(false)
		end

		if slot0.centre_btn_index and slot0.centre_btn_index == 1 then
			slot0.zone_status:setString(TI18N("冠军赛 64进8"))
		else
			slot0.zone_status:setString(TI18N("冠军赛 8强赛"))
		end
	end
end

function ArenapeakchampionGuessingTabPromotion.checkSender(slot0)
	if not uv0:getMainData() then
		return
	end

	if slot0.centre_btn_index == 0 then
		if slot1.step ~= 0 then
			if slot0.current_zone == 0 then
				slot0.current_zone = slot1.zone_id
			end

			if slot1.step == 8 then
				slot0.centre_btn_index = 2

				uv1:sender27710(slot0.current_zone)
			else
				slot0.centre_btn_index = 1

				uv1:sender27709(slot0.current_zone, 2)
			end
		else
			slot0.centre_btn_index = 1

			slot0:initData()
		end

		slot0:updateCentreBtnImg()
	else
		if slot0.centre_btn_index == 1 then
			if slot1.step ~= 0 then
				if uv0:getMatchData64ByGroup(1, slot0.current_zone) then
					slot0:initData()
				else
					uv1:sender27709(slot0.current_zone, 2)
				end
			else
				slot0:initData()
			end
		else
			slot0.centre_btn_index = 2

			if slot1.step ~= 0 then
				if uv0:getMatchData8(slot0.current_zone) then
					slot0:initData()
				else
					uv1:sender27710(slot0.current_zone)
				end
			else
				slot0:initData()
			end
		end

		slot0:updateCentreBtnImg()
	end
end

function ArenapeakchampionGuessingTabPromotion.updateCentreBtnImg(slot0)
	if slot0.centre_btn_index == 2 then
		slot0.centre_btn:loadTexture(PathTool.getResFrame("arenapeakchampion", "arenapeakchampion_promotion_06", false, "arenapeak_guessing"), LOADTEXT_TYPE_PLIST)
		slot0.centre_btn_label:setString(TI18N("64进8"))
	else
		slot0.centre_btn:loadTexture(PathTool.getResFrame("arenapeakchampion", "arenapeakchampion_promotion_07", false, "arenapeak_guessing"), LOADTEXT_TYPE_PLIST)
		slot0.centre_btn_label:setString(TI18N("8强赛"))
	end
end

function ArenapeakchampionGuessingTabPromotion.DeleteMe(slot0)
	slot0.parent = nil

	doStopAllActions(slot0.time_label)

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.top_64_event then
		GlobalEvent:getInstance():UnBind(slot0.top_64_event)

		slot0.top_64_event = nil
	end

	if slot0.top_8_event then
		GlobalEvent:getInstance():UnBind(slot0.top_8_event)

		slot0.top_8_event = nil
	end

	if slot0.apc_main_event then
		GlobalEvent:getInstance():UnBind(slot0.apc_main_event)

		slot0.apc_main_event = nil
	end

	if slot0.match_panel_list then
		for slot4, slot5 in ipairs(slot0.match_panel_list) do
			slot5:DeleteMe()
		end

		slot0.match_panel_list = nil
	end
end
