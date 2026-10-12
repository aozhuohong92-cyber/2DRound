ElementRankWindow = ElementRankWindow or BaseClass(BaseView)
slot1 = ElementController:getInstance():getModel()
slot2 = string.format

function ElementRankWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.title_str = TI18N("领地副本排行榜")
	slot0.background_path = PathTool.getPlistImgForDownLoad("bigbg/element", "element_main_bg", true)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/element", "element_main_bg", true),
			type = ResourcesType.single
		}
	}
	slot0.tab_info_list = {
		{
			status = true,
			label = TI18N("排行榜"),
			index = ElementConst.Rank_Type.Rank
		},
		{
			status = true,
			label = TI18N("奖励一览"),
			index = ElementConst.Rank_Type.Award
		}
	}
	slot0.selected_tab = nil
	slot0.tab_list = {}
	slot0.panel_list = {}
end

function ElementRankWindow.open_callback(slot0)
	if slot0.container then
		if not slot0.tips_txt then
			slot0.tips_txt = createLabel(20, cc.c3b(100, 50, 35), nil, slot0.container:getContentSize().width - 10, -4, TI18N("奖励每周一00:00通过邮件发放"), slot0.container, nil, cc.p(1, 0))
		end
	end
end

function ElementRankWindow.register_event(slot0)
	for slot4, slot5 in pairs(slot0.tab_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:changeSelectedTab(slot0.index)
			end
		end)
	end

	registerButtonEventListener(slot0.background, function ()
		uv0:openElementRankWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openElementRankWindow(false)
	end, false, 2)
end

function ElementRankWindow.openRootWnd(slot0, slot1)
	slot0:setSelecteTab(slot1 or ElementConst.Rank_Type.Rank)
end

function ElementRankWindow.selectedTabCallBack(slot0, slot1)
	slot0:changeSelectedTab(slot1)
end

function ElementRankWindow.changeSelectedTab(slot0, slot1)
	if slot0.selected_tab ~= nil and slot0.selected_tab.index == slot1 then
		return
	end

	if slot0.selected_tab then
		slot0.selected_tab.label:setTextColor(cc.c4b(245, 224, 185, 255))
		slot0.selected_tab:setBright(false)

		slot0.selected_tab = nil
	end

	slot0.selected_tab = slot0.tab_list[slot1]

	if slot0.selected_tab then
		slot0.selected_tab.label:setTextColor(cc.c4b(89, 52, 41, 255))
		slot0.selected_tab:setBright(true)
	end

	if slot0.cur_panel ~= nil then
		slot0.cur_panel:setNodeVisible(false)

		slot0.cur_panel = nil
	end

	slot0.cur_panel = slot0.panel_list[slot1]

	if slot0.cur_panel == nil then
		if slot1 == ElementConst.Rank_Type.Rank then
			slot0.cur_panel = ElementRankPanel.new()
		elseif slot1 == ElementConst.Rank_Type.Award then
			slot0.cur_panel = ElementAwardPanel.new()
		end

		slot0.panel_list[slot1] = slot0.cur_panel

		slot0.container:addChild(slot0.cur_panel)

		if slot0.cur_panel.addToParent then
			slot0.cur_panel:addToParent()
		end
	end

	slot0.cur_panel:setNodeVisible(true)
end

function ElementRankWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = {}

	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	uv0:openElementRankWindow(false)
end
