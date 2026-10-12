ActionLimitGiftMainWindow = ActionLimitGiftMainWindow or BaseClass(BaseView)
slot0 = ActionController:getInstance()
slot1 = ActionController:getInstance():getModel()

function ActionLimitGiftMainWindow.__init(slot0, slot1)
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

function ActionLimitGiftMainWindow.open_callback(slot0)
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

function ActionLimitGiftMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openActionLimitGiftMainWindow(false)
	end, true, 2)
	slot0:addGlobalEvent(ActionEvent.LIMIT_GIFT_MAIN_EVENT, function (slot0)
		uv0:initData(slot0)
	end)
end

function ActionLimitGiftMainWindow.openRootWnd(slot0, slot1)
	slot0.record_id = slot1

	uv0:send21210()
end

function ActionLimitGiftMainWindow.initData(slot0, slot1)
	if not slot1 then
		return
	end

	if #slot1.gifts == 0 then
		uv0:openActionLimitGiftMainWindow(false)

		return
	end

	slot0.sub_list = {}

	for slot5, slot6 in ipairs(slot1.gifts) do
		if Config.StarGiftData.data_limit_gift(slot6.id) then
			slot6.ico = slot7.ico
			slot6.config = slot7
			slot6.title = slot7.name

			table.insert(slot0.sub_list, slot6)
		end
	end

	table.sort(slot0.sub_list, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0:createSubType()
end

function ActionLimitGiftMainWindow.createSubType(slot0)
	if slot0.sub_list == nil or next(slot0.sub_list) == nil then
		return
	end

	slot0.max_width = math.max(slot0.tab_scroll:getContentSize().width, #slot0.sub_list * (slot0.tab_width + slot0.off_space) + slot0.off_space)
	slot9 = slot0.tab_scroll

	slot0.tab_scroll:setInnerContainerSize(cc.size(slot0.max_width, slot9:getContentSize().height))

	function slot3(slot0)
		uv0:handleSelectedTab(slot0)
	end

	slot4 = 0

	if slot0.selected_panel then
		slot0.selected_panel:DeleteMe()

		if slot0.selected_tab and slot0.selected_tab.data then
			slot4 = slot0.selected_tab.data.id
			slot0.selected_tab = nil
		end

		slot0.panel_list[slot4] = nil
		slot0.selected_panel = nil
	end

	for slot8, slot9 in pairs(slot0.tab_list) do
		slot9:DeleteMe()
	end

	slot0.tab_list = {}
	slot5 = nil
	slot6 = 2
	slot7, slot8 = nil
	slot9 = 1

	for slot13 = 1, slot1 do
		if slot0.tab_list[slot0.sub_list[slot13].id] == nil then
			slot5 = WelfareTab.new()

			slot5:setData(slot8)
			slot5:setPosition(slot0.off_space + (slot13 - 1) * (slot0.tab_width + slot0.off_space), 79)
			slot5:updateTipsStatus(false)
			slot5:setClickCallBack(slot3)
			slot0.tab_scroll:addChild(slot5)

			slot0.tab_list[slot8.id] = slot5
		end

		if slot4 ~= 0 and slot4 == slot8.id then
			slot9 = slot13
		elseif slot0.record_id and slot0.record_id == slot8.id then
			slot9 = slot13
		end
	end

	slot0:handleSelectedTab(slot0.tab_list[slot0.sub_list[slot9].id], true)
end

function ActionLimitGiftMainWindow.handleSelectedTab(slot0, slot1, slot2)
	if not slot2 and slot0.selected_tab ~= nil and slot0.selected_tab == slot1 then
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

function ActionLimitGiftMainWindow.changePanelByTab(slot0)
	if slot0.selected_tab == nil or slot0.selected_tab.data == nil then
		return
	end

	if slot0.selected_tab.data.id == nil or slot1.id == 0 then
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

	if slot0.panel_list[slot1.id] == nil then
		slot0.panel_list[slot1.id] = ActionLimitGiftMainPanel.new(slot1)

		slot0.container:addChild(slot0.panel_list[slot1.id])
	end

	slot0.selected_panel = slot0.panel_list[slot1.id]

	if slot0.selected_panel.setVisibleStatus then
		slot0.selected_panel:setVisibleStatus(true)
	else
		slot0.selected_panel:setVisible(true)
	end
end

function ActionLimitGiftMainWindow.setTabStatus(slot0, slot1)
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
end

function ActionLimitGiftMainWindow.close_callback(slot0)
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

	uv0:openActionLimitGiftMainWindow(false)
end
