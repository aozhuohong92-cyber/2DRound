slot1 = MonopolyController:getInstance():getModel()
slot2 = string.format
MonopolyRankWindow = MonopolyRankWindow or BaseClass(BaseView)

function MonopolyRankWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.title_str = TI18N("圣夜奇境排行榜")
	slot0.background_path = PathTool.getPlistImgForDownLoad("monopoly", "monopoly_enter_bg_1", true)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("monopoly", "monopoly_enter_bg_1", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"),
			type = ResourcesType.single
		}
	}
	slot0.tab_info_list = {
		{
			status = true,
			label = TI18N("公会排行"),
			index = MonopolyConst.Rank_Type.Guild
		},
		{
			status = true,
			label = TI18N("个人贡献"),
			index = MonopolyConst.Rank_Type.Personal
		},
		{
			status = true,
			label = TI18N("公会奖励"),
			index = MonopolyConst.Rank_Type.Award
		}
	}
	slot0.selected_tab = nil
	slot0.tab_list = {}
	slot0.panel_list = {}
end

function MonopolyRankWindow.open_callback(slot0)
	if slot0.container then
		if not slot0.tips_txt then
			slot0.tips_txt = createLabel(20, cc.c3b(100, 50, 35), nil, slot0.container:getContentSize().width - 10, -10, TI18N("各章节排行奖励将在活动结束时结算，并发放进入公会宝库"), slot0.container, nil, cc.p(1, 0))
		end
	end
end

function MonopolyRankWindow.register_event(slot0)
	for slot4, slot5 in pairs(slot0.tab_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:changeSelectedTab(slot0.index)
			end
		end)
	end

	registerButtonEventListener(slot0.background, function ()
		uv0:openMonopolyRankWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openMonopolyRankWindow(false)
	end, true, 2)
end

function MonopolyRankWindow.openRootWnd(slot0, slot1, slot2)
	slot0.step_id = slot1 or 1

	slot0:setSelecteTab(slot2 or MonopolyConst.Rank_Type.Guild)
end

function MonopolyRankWindow.selectedTabCallBack(slot0, slot1)
	slot0:changeSelectedTab(slot1)
end

function MonopolyRankWindow.changeSelectedTab(slot0, slot1)
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

	if slot0.tips_txt then
		slot0.tips_txt:setVisible(slot1 ~= MonopolyConst.Rank_Type.Personal)
	end

	slot0.cur_panel = slot0.panel_list[slot1]

	if slot0.cur_panel == nil then
		if slot1 == MonopolyConst.Rank_Type.Guild then
			slot0.cur_panel = MonopolyGuildRankPanel.new(slot0.step_id)
		elseif slot1 == MonopolyConst.Rank_Type.Personal then
			slot0.cur_panel = MonopolyPersonalRankPanel.new(slot0.step_id)
		elseif slot1 == MonopolyConst.Rank_Type.Award then
			slot0.cur_panel = MonopolyRankAwardPanel.new()
		end

		slot0.panel_list[slot1] = slot0.cur_panel

		slot0.container:addChild(slot0.cur_panel)

		if slot0.cur_panel.addToParent then
			slot0.cur_panel:addToParent()
		end
	end

	slot0.cur_panel:setNodeVisible(true)
end

function MonopolyRankWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = {}

	uv0:openMonopolyRankWindow(false)
end
