ActionFundMainWindow = ActionFundMainWindow or BaseClass(BaseView)
slot0 = ActionController:getInstance()
slot1 = ActionController:getInstance():getModel()

function ActionFundMainWindow.__init(slot0, slot1)
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
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_fund_bg_1", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_fund_bg_2", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("welfare", "welfare"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("welfaretab", "welfaretab"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("actionfund", "actionfund"),
			type = ResourcesType.plist
		}
	}
	slot0.panel_list = {}
	slot0.tab_list = {}
	slot0.tab_width = 78
	slot0.off_space = 50
	slot0.selected_tab = nil
end

function ActionFundMainWindow.open_callback(slot0)
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

function ActionFundMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openActionFundWindow(false)
	end, true, 2)
	slot0:addGlobalEvent(ActionEvent.UPDATA_FUND_ID_LIST_EVENT, function ()
		uv0:updateTabBtns()
	end)
	slot0:addGlobalEvent(ActionEvent.UPDATA_FUND_RED_STATUS_EVENT, function ()
		uv0:updateTabRedStatus()
	end)
end

function ActionFundMainWindow.openRootWnd(slot0, slot1)
	slot0.fund_type = slot1 or FundType.type_one

	slot0:updateTabBtns()
end

function ActionFundMainWindow.updateTabBtns(slot0)
	slot0.sub_list = {}

	for slot5, slot6 in pairs(uv0:getOpenFundIds()) do
		if Config.MonthFundData.data_fund_data[slot6.id] then
			table.insert(slot0.sub_list, {
				bid = slot6.id,
				title = slot7.name,
				ico = slot7.icon_id
			})
		end
	end

	table.sort(slot0.sub_list, SortTools.KeyLowerSorter("bid"))
	slot0:createSubType()
	slot0:updateTabRedStatus()
end

function ActionFundMainWindow.createSubType(slot0)
	if slot0.sub_list == nil or next(slot0.sub_list) == nil then
		return
	end

	for slot4, slot5 in pairs(slot0.tab_list) do
		slot5:setVisible(false)
	end

	slot1 = #slot0.sub_list
	slot0.max_width = math.max(slot0.tab_scroll:getContentSize().width, slot1 * (slot0.tab_width + slot0.off_space) + slot0.off_space)

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

			if slot0.fund_type ~= nil and slot0.fund_type == slot8.bid then
				slot4 = slot12
			end
		end

		if slot5 then
			slot5:setVisible(true)
		end
	end

	if slot4 == 0 then
		slot4 = 1
	end

	if slot0.sub_list[slot4] ~= nil then
		slot0:handleSelectedTab(slot0.tab_list[slot8.bid])
	end
end

function ActionFundMainWindow.handleSelectedTab(slot0, slot1)
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

	if slot0.selected_tab.data and slot2.bid then
		if slot2.bid == FundType.type_one then
			uv0:updateFundRedStatus(FundRedIndex.fund_buy_one, false)
		elseif slot2.bid == FundType.type_two then
			uv0:updateFundRedStatus(FundRedIndex.fund_buy_two, false)
		end
	end

	slot0:changePanelByTab()
end

function ActionFundMainWindow.changePanelByTab(slot0)
	if slot0.selected_tab == nil or slot0.selected_tab.data == nil then
		return
	end

	if slot0.selected_tab.data.bid == nil or slot1.bid == 0 then
		return
	end

	if slot0.selected_panel ~= nil then
		if slot0.selected_panel.setVisibleStatus then
			slot0.selected_panel:setVisibleStatus(false)
		else
			slot0.selected_panel:setVisible(false)
		end

		slot0.selected_panel = nil
	end

	if slot0.panel_list[slot1.bid] == nil then
		slot2 = nil

		if slot1.bid == FundType.type_one then
			slot2 = ActionFundOnePanel.new(slot1.bid)
		elseif slot1.bid == FundType.type_two then
			slot2 = ActionFundTwoPanel.new(slot1.bid)
		end

		if slot2 then
			slot0.panel_list[slot1.bid] = slot2

			slot0.container:addChild(slot2)
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

function ActionFundMainWindow.updateTabRedStatus(slot0)
	for slot4, slot5 in pairs(slot0.tab_list) do
		slot6 = false

		if slot4 == FundType.type_one then
			if not uv0:getFundRedStatusByBid(FundRedIndex.fund_get_one) then
				slot6 = uv0:getFundRedStatusByBid(FundRedIndex.fund_buy_one)
			end
		elseif slot4 == FundType.type_two then
			slot6 = uv0:getFundRedStatusByBid(FundRedIndex.fund_get_two) or uv0:getFundRedStatusByBid(FundRedIndex.fund_buy_two)
		end

		if slot5.updateTipsStatus then
			slot5:updateTipsStatus(slot6)
		end
	end
end

function ActionFundMainWindow.close_callback(slot0)
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

	uv0:openActionFundWindow(false)
end
