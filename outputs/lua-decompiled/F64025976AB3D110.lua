ActionMainWindow = ActionMainWindow or BaseClass(BaseView)
slot0 = ActionController:getInstance()
slot1 = ActionController:getInstance():getModel()

function ActionMainWindow.__init(slot0, slot1)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "welfare/welfare_main_view"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_bg"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_bg_1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_tab"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("welfare", "welfare"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("welfaretab", "welfaretab"),
			type = ResourcesType.plist
		}
	}
	slot0.panel_list = {}
	slot0.tab_list = {}
	slot0.tab_width = 78
	slot0.off_space = 50
	slot0.selected_tab = nil
end

function ActionMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		loadSpriteTexture(slot0.background, PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_bg"), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setPositionY(display.getTop() - 196)

	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.container = slot1:getChildByName("container")
	slot0.tab_sprite_bg = slot1:getChildByName("tab_sprite_bg")

	loadSpriteTexture(slot0.tab_sprite_bg, PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_bg_1"), LOADTEXT_TYPE)

	slot0.close_btn = slot0.root_wnd:getChildByName("tab_container"):getChildByName("close_btn")

	slot0.close_btn:setPositionY(display.getBottom() + MainuiController:getInstance():getMainUi():getBottomHeight() + 25)

	slot4 = slot0.root_wnd:getChildByName("scroll_container")

	loadSpriteTexture(slot4:getChildByName("sprite_tab"), PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_tab"), LOADTEXT_TYPE)
	slot4:setPositionY(display.getTop())
	slot4:getChildByName("top_sprite1"):setLocalZOrder(10)
	slot4:getChildByName("top_sprite2"):setLocalZOrder(10)

	slot0.tab_scroll = createScrollView(slot4:getContentSize().width, slot4:getContentSize().height, 0, 0, slot4, ccui.ScrollViewDir.horizontal)
end

function ActionMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openActionMainPanel(false)
	end, true, 2)
	slot0:addGlobalEvent(ActionEvent.UPDATE_HOLIDAY_TAB_STATUS, function (slot0, slot1)
		if slot0 ~= uv0.function_id then
			return
		end

		uv0:setTabStatus(slot1.bid)
	end)
	slot0:addGlobalEvent(ActionEvent.SHOW_ACTIVITY_RED_POINT, function (slot0, slot1)
		uv0:setSpecialTabStatus(slot0, slot1)
	end)
end

function ActionMainWindow.openRootWnd(slot0, slot1, slot2)
	slot0.function_id = slot1 or MainuiConst.icon.action
	slot0.sub_list = uv0:getActionSubList(slot0.function_id)
	slot0.action_bid = slot2

	slot0:createSubType()
end

function ActionMainWindow.createSubType(slot0)
	if slot0.sub_list ~= nil and next(slot0.sub_list) ~= nil then
		slot1 = #slot0.sub_list
		slot0.max_width = math.max(slot0.tab_scroll:getContentSize().width, slot1 * (slot0.tab_width + slot0.off_space) + slot0.off_space * 2)

		slot0.tab_scroll:setInnerContainerSize(cc.size(slot0.max_width, slot0.tab_scroll:getContentSize().height))

		slot4 = 0
		slot5 = nil
		slot6 = 2
		slot7, slot8 = nil

		for slot12 = 1, slot1 do
			if slot0.sub_list[slot12] ~= nil and slot8.bid ~= nil and slot0.tab_list[slot8.bid] == nil then
				slot5 = WelfareTab.new()

				slot5:setData(slot8)
				slot5:setPosition(slot0.off_space + (slot12 - 1) * (slot0.tab_width + slot0.off_space), 79)
				slot5:setClickCallBack(function (slot0)
					uv0:handleSelectedTab(slot0)
				end)
				slot0.tab_scroll:addChild(slot5)

				slot0.tab_list[slot8.bid] = slot5

				if slot0.action_bid ~= nil and slot0.action_bid == slot8.bid then
					slot4 = slot12
				end

				slot0:setTabStatus(slot8.bid)
			end
		end

		if slot4 == 0 then
			slot4 = 1
		end

		if slot0.sub_list[slot4] ~= nil then
			if slot4 and slot4 ~= 1 then
				slot0.tab_scroll:scrollToPercentHorizontal(math.ceil(100 * slot4 / slot1), 1, true)
			end

			slot0:handleSelectedTab(slot0.tab_list[slot8.bid])
		end
	end
end

function ActionMainWindow.handleSelectedTab(slot0, slot1)
	if slot0.selected_tab ~= nil and slot0.selected_tab == slot1 then
		return
	end

	if slot0.selected_tab ~= nil then
		slot0.selected_tab:setSelecte(false)
	end

	slot0.selected_tab = slot1

	if slot0.selected_tab ~= nil then
		slot0.selected_tab:setSelecte(true)
	end

	slot0:changePanelByTab()
end

function ActionMainWindow.res_check(slot0)
	SysEnv:getInstance():set(SysEnv.keys.res_check_3, false, true)
	SysEnv:getInstance():set(SysEnv.keys.res_check_4, false, true)
	SysEnv:getInstance():set(SysEnv.keys.skip_recruit_anim, false, true)
end

function ActionMainWindow.changePanelByTab(slot0)
	slot0:res_check()

	if slot0.selected_tab == nil or slot0.selected_tab.data == nil then
		return
	end

	if slot0.selected_tab.data.bid == nil or slot1.bid == 0 then
		return
	end

	if slot1.bid and slot1.bid == ActionRankCommonType.ouqi_gift then
		uv0:openOuqiGiftTips()

		return
	end

	if slot1.panel_type == nil or slot1.panel_type == 0 or ActionPanelTypeView[slot1.panel_type] == nil then
		return
	end

	if slot0.selected_panel ~= nil then
		if slot0.selected_panel.res_check_3 then
			slot0.selected_panel.res_check_3:setSelected(false)
			slot0.selected_panel.res_check_4:setSelected(false)
			slot0.selected_panel.btn_skip_ani:setSelected(false)
		end

		if slot0.selected_panel.setVisibleStatus then
			slot0.selected_panel:setVisibleStatus(false)
		else
			slot0.selected_panel:setVisible(false)
		end

		slot0.selected_panel = nil
	end

	if slot0.panel_list[slot1.bid] == nil then
		slot2 = ActionPanelTypeView[slot1.panel_type]

		print("限时活动==========", slot2)

		if _G[slot2] then
			slot0.panel_list[slot1.bid] = _G[slot2].new(slot1.bid, slot0.function_id)

			slot0.container:addChild(slot0.panel_list[slot1.bid])
		end
	end

	slot0.selected_panel = slot0.panel_list[slot1.bid]

	if slot0.selected_panel then
		if slot0.selected_panel.setVisibleStatus then
			slot0.selected_panel:setVisibleStatus(true)
		else
			slot0.selected_panel:setVisible(true)
		end
	end
end

function ActionMainWindow.setTabStatus(slot0, slot1)
	slot2 = uv0:getHolidayAweradsStatus(slot1)

	if slot0.tab_list[slot1] == nil then
		return
	end

	if slot2 == nil or slot2.status == false then
		if slot3.updateTipsStatus then
			slot3:updateTipsStatus(false)
		end
	elseif slot3.updateTipsStatus then
		slot3:updateTipsStatus(true)
	end

	slot0:setSpecialTabStatus(slot1, uv1:getGiftRedStatusByBid(slot1))
end

function ActionMainWindow.isSpecialTabByBid(slot0, slot1)
	return slot1 == ActionRankCommonType.high_value_gift or slot1 == ActionRankCommonType.mysterious_store
end

function ActionMainWindow.setSpecialTabStatus(slot0, slot1, slot2)
	if slot0.specail_tab_status and slot0.specail_tab_status == slot2 then
		return
	end

	slot0.specail_tab_status = slot2

	if slot0:isSpecialTabByBid(slot1) then
		if slot0.tab_list[slot1] == nil then
			return
		end

		if not slot2 then
			if slot3.updateTipsStatus then
				slot3:updateTipsStatus(false)
			end
		elseif slot3.updateTipsStatus then
			slot3:updateTipsStatus(true)
		end
	end
end

function ActionMainWindow.close_callback(slot0)
	CommonAlert.closeAllWin()

	for slot4, slot5 in pairs(slot0.panel_list) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.panel_list = nil

	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.tab_list = nil

	uv0:openActionMainPanel(false)
end
