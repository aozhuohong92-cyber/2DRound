SingleRankMainWindow = SingleRankMainWindow or BaseClass(BaseView)
slot1 = RankController:getInstance():getModel()
slot2 = string.format

function SingleRankMainWindow.__init(slot0, slot1, slot2, slot3)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.title_str = slot1 or TI18N("排行榜")
	slot0.rank_type = slot3 or RankConstant.RankType.sandybeach_boss_fight
	slot0.background_path = slot2 or PathTool.getPlistImgForDownLoad("bigbg/element", "element_main_bg", true)
	slot0.res_list = {
		{
			path = slot0.background_path,
			type = ResourcesType.single
		}
	}
	slot0.tab_info_list = {
		{
			status = true,
			label = TI18N("排行榜"),
			index = RankConstant.Rank_Type.Rank
		},
		{
			status = true,
			label = TI18N("奖励一览"),
			index = RankConstant.Rank_Type.Award
		}
	}
	slot0.selected_tab = nil
	slot0.tab_list = {}
	slot0.panel_list = {}
end

function SingleRankMainWindow.open_callback(slot0)
end

function SingleRankMainWindow.register_event(slot0)
	for slot4, slot5 in pairs(slot0.tab_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:changeSelectedTab(slot0.index)
			end
		end)
	end

	registerButtonEventListener(slot0.background, function ()
		uv0:openSingleRankMainWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openSingleRankMainWindow(false)
	end, true, 2)
end

function SingleRankMainWindow.openRootWnd(slot0, slot1, slot2)
	slot0.setting = slot1 or {}
	slot0.show_tips = slot1.show_tips or ""
	slot0.only_show_rank = slot1.only_show_rank or false
	slot3 = slot2 or RankConstant.Rank_Type.Rank

	if slot0.only_show_rank then
		slot3 = RankConstant.Rank_Type.Rank
		slot0.tab_info_list[2] = nil

		if slot0.tab_btn_list and slot0.tab_btn_list[2] then
			slot0.tab_btn_list[2]:setVisible(false)
		end
	end

	slot0:inittips()
	slot0:setSelecteTab(slot3)
end

function SingleRankMainWindow.inittips(slot0)
	if slot0.container then
		if not slot0.tips_txt then
			slot0.tips_txt = createLabel(20, cc.c3b(100, 50, 35), nil, slot0.container:getContentSize().width - 10, -10, slot0.show_tips, slot0.container, nil, cc.p(1, 0))
		end
	end
end

function SingleRankMainWindow.selectedTabCallBack(slot0, slot1)
	slot0:changeSelectedTab(slot1)
end

function SingleRankMainWindow.changeSelectedTab(slot0, slot1)
	if slot0.selected_tab ~= nil and slot0.selected_tab.index == slot1 then
		return
	end

	if slot0.selected_tab then
		slot0.selected_tab.label:setTextColor(cc.c4b(215, 226, 227, 255))
		slot0.selected_tab:setBright(false)

		slot0.selected_tab = nil
	end

	slot0.selected_tab = slot0.tab_list[slot1]

	if slot0.selected_tab then
		slot0.selected_tab.label:setTextColor(cc.c4b(255, 255, 255, 255))
		slot0.selected_tab:setBright(true)
	end

	if slot0.cur_panel ~= nil then
		slot0.cur_panel:setNodeVisible(false)

		slot0.cur_panel = nil
	end

	slot0.cur_panel = slot0.panel_list[slot1]

	if slot0.cur_panel == nil then
		if slot1 == RankConstant.Rank_Type.Rank then
			slot0.cur_panel = SingleRankPanel.new()
		elseif slot1 == RankConstant.Rank_Type.Award then
			slot0.cur_panel = SingleAwardPanel.new()
		end

		slot0.panel_list[slot1] = slot0.cur_panel

		slot0.container:addChild(slot0.cur_panel)

		if slot0.cur_panel.addToParent then
			slot0.cur_panel:addToParent(slot0.setting)
		end
	end

	slot0.cur_panel:setNodeVisible(true)
end

function SingleRankMainWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = {}

	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	uv0:openSingleRankMainWindow(false)
end
