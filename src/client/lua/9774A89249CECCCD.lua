EndlessRankWindow = EndlessRankWindow or BaseClass(BaseView)
slot0 = Endless_trailController:getInstance()
slot1 = Endless_trailController:getInstance():getModel()
slot2 = string.format

function EndlessRankWindow.__init(slot0, slot1)
	slot0.win_type = WinType.Full
	slot0.endless_type = slot1
	slot0.is_full_screen = true
	slot0.title_str = TI18N("无尽试炼排行榜")
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"),
			type = ResourcesType.single
		}
	}
	slot0.tab_info_list = {
		{
			status = true,
			label = TI18N("排行榜"),
			index = Endless_trailEvent.type.rank
		},
		{
			status = true,
			label = TI18N("奖励一览"),
			index = Endless_trailEvent.type.reward
		}
	}
	slot0.selected_tab = nil
	slot0.tab_list = {}
	slot0.panel_list = {}
end

function EndlessRankWindow.open_callback(slot0)
end

function EndlessRankWindow.register_event(slot0)
	for slot4, slot5 in pairs(slot0.tab_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:changeSelectedTab(slot0.index)
			end
		end)
	end

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:openEndlessRankView(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:openEndlessRankView(false)
			end
		end)
	end
end

function EndlessRankWindow.openRootWnd(slot0, slot1)
	slot0:setSelecteTab(slot1 or Endless_trailEvent.type.rank)
end

function EndlessRankWindow.selectedTabCallBack(slot0, slot1)
	slot0:changeSelectedTab(slot1)
end

function EndlessRankWindow.changeSelectedTab(slot0, slot1)
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
		if slot1 == Endless_trailEvent.type.rank then
			slot0.cur_panel = EndlessRankPanel.new(slot0.endless_type)
		elseif slot1 == Endless_trailEvent.type.reward then
			slot0.cur_panel = EndlessAwardsPanel.new(slot0.endless_type)
		end

		slot0.panel_list[slot1] = slot0.cur_panel

		slot0.container:addChild(slot0.cur_panel)

		if slot0.cur_panel.addToParent then
			slot0.cur_panel:addToParent()
		end
	end

	slot0.cur_panel:setNodeVisible(true)
end

function EndlessRankWindow.close_callback(slot0)
	slot4 = false

	uv0:openEndlessRankView(slot4)

	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = {}
end
