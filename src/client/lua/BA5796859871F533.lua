GodBattleRewardsWindow = GodBattleRewardsWindow or BaseClass(BaseView)
slot0 = GodbattleController:getInstance()

function GodBattleRewardsWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "godbattle/godbattle_rewards_window"
	slot0.res_list = {}
	slot0.tab_list = {}
	slot0.panel_list = {}
end

function GodBattleRewardsWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display:getMaxScale())

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("main_panel")

	slot2:getChildByName("win_title"):setString(TI18N("众神战场"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.container = slot2:getChildByName("container")

	for slot7 = 1, 2 do
		slot8 = {}

		if slot2:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot7) then
			slot11 = slot9:getChildByName("tips")

			if slot7 == 1 then
				slot9:getChildByName("title"):setString(TI18N("规则说明"))
			elseif slot7 == 2 then
				slot10:setString(TI18N("奖励预览"))
			end

			slot10:setTextColor(cc.c4b(215, 226, 227, 255))
			slot9:setBright(false)

			slot8.tab_btn = slot9
			slot8.label = slot10
			slot8.index = slot7
			slot8.tips = slot11
			slot0.tab_list[slot7] = slot8
		end
	end
end

function GodBattleRewardsWindow.register_event(slot0)
	function slot4(slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openGodBattleRewardsWindow(false)
		end
	end

	slot0.close_btn:addTouchEventListener(slot4)

	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end
end

function GodBattleRewardsWindow.openRootWnd(slot0, slot1)
	slot0:changeSelectedTab(slot1 or 1)
end

function GodBattleRewardsWindow.changeSelectedTab(slot0, slot1)
	if slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.tab_btn:setBright(false)
		slot0.tab_object.label:setTextColor(cc.c4b(215, 226, 227, 255))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.label:setTextColor(cc.c4b(255, 255, 255, 255))
		slot0.tab_object.tab_btn:setBright(true)
	end

	if slot0.select_panel then
		slot0.select_panel:addToParent(false)

		slot0.select_panel = nil
	end

	slot0.select_panel = slot0.panel_list[slot1]

	if slot0.select_panel == nil then
		if slot1 == 1 then
			slot0.select_panel = GodBattleExplainPanel.New(slot0.container)
		elseif slot1 == 2 then
			slot0.select_panel = GodBattleRankRewardPanel.New(slot0.container)
		end

		if slot0.select_panel then
			slot0.panel_list[slot1] = slot0.select_panel
		end
	end

	if slot0.select_panel then
		slot0.select_panel:addToParent(true)
	end
end

function GodBattleRewardsWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = nil

	uv0:openGodBattleRewardsWindow(false)
end
