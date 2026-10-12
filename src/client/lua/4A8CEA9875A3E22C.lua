ActiontermbeginsRankMainPanel = ActiontermbeginsRankMainPanel or BaseClass(BaseView)
slot0 = ActiontermbeginsController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function ActiontermbeginsRankMainPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "actiontermbegins/action_term_begins_rank_main_panel"
	slot0.res_list = {}
	slot0.view_list = {}
end

function ActiontermbeginsRankMainPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot5 = 1

	slot0:playEnterAnimatianByObj(slot0.main_container, slot5)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.tab_container = slot0.main_panel:getChildByName("tab_container")
	slot1 = {
		TI18N("伤害排行"),
		TI18N("排行奖励")
	}
	slot0.tab_list = {}

	for slot5 = 1, 2 do
		if slot0.tab_container:getChildByName("tab_btn_" .. slot5) then
			slot7 = {
				select_bg = slot6:getChildByName("select_bg")
			}

			slot7.select_bg:setVisible(false)

			slot7.unselect_bg = slot6:getChildByName("unselect_bg")
			slot7.title = slot6:getChildByName("title")

			slot7.title:setTextColor(cc.c4b(207, 181, 147, 255))

			if slot1[slot5] then
				slot7.title:setString(slot1[slot5])
			end

			slot7.tab_btn = slot6
			slot7.index = slot5
			slot0.tab_list[slot5] = slot7
		end
	end

	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("伤害排行"))

	slot0.container = slot0.main_container:getChildByName("container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.top_label = slot0.main_panel:getChildByName("top_label")
	slot0.bottom_label = slot0.main_panel:getChildByName("bottom_label")

	slot0.top_label:setString(TI18N(""))
	slot0.bottom_label:setString(TI18N(""))
end

function ActiontermbeginsRankMainPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)

	slot4 = handler(slot0, slot0.onClickBtnClose)
	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

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

	slot0:addGlobalEvent(ActiontermbeginsEvent.TERM_BEGINS_RANK_EVENT, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.view_list then
			return
		end

		uv0.scdata = slot0

		for slot4, slot5 in pairs(uv0.view_list) do
			if slot5.setScdata then
				slot5:setScdata(slot0)
			end
		end

		uv0:changeIndexExtendInfo()
	end)
end

function ActiontermbeginsRankMainPanel.onClickBtnClose(slot0)
	uv0:openActiontermbeginsRankMainPanel(false)
end

function ActiontermbeginsRankMainPanel.changeSelectedTab(slot0, slot1)
	if slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)
		slot0.tab_object.title:setTextColor(cc.c4b(207, 181, 147, 255))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
		slot0.tab_object.title:setTextColor(cc.c4b(255, 237, 214, 255))
	end

	slot0.select_index = slot1

	if slot0.pre_panel ~= nil then
		if slot0.pre_panel.setVisibleStatus then
			slot0.pre_panel:setVisibleStatus(false)
		else
			slot0.pre_panel:setVisible(false)
		end
	end

	slot0.pre_panel = slot0:createSubPanel(slot0.select_index)

	if slot0.pre_panel ~= nil then
		if slot0.pre_panel.setVisibleStatus then
			slot0.pre_panel:setVisibleStatus(true)
		else
			slot0.pre_panel:setVisible(true)
		end
	end

	slot0.pre_panel:setData()
	slot0:changeIndexExtendInfo()
end

function ActiontermbeginsRankMainPanel.createSubPanel(slot0, slot1)
	if slot0.view_list[slot1] == nil then
		if slot1 == 1 then
			slot2 = ActiontermbeginsRankTabRank.new(slot0)
		elseif slot1 == 2 then
			slot2 = ActiontermbeginsRankTabReward.new(slot0)
		end

		slot3 = slot0.container:getContentSize()

		slot2:setPosition(cc.p(slot3.width * 0.5, slot3.height * 0.5))
		slot0.container:addChild(slot2)

		slot0.view_list[slot1] = slot2
	end

	return slot2
end

function ActiontermbeginsRankMainPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.select_index = slot2.index or 1
	slot0.rank_type = slot2.rank_type or RankConstant.RankType.sandybeach_boss_fight

	if slot0.rank_type == RankConstant.RankType.termbegins then
		uv0:sender26710()
	end

	slot0:extendInfo()
	slot0:changeSelectedTab(slot0.select_index)
end

function ActiontermbeginsRankMainPanel.extendInfo(slot0)
	if slot0.rank_type == RankConstant.RankType.termbegins then
		-- Nothing
	end
end

function ActiontermbeginsRankMainPanel.changeIndexExtendInfo(slot0)
	if slot0.rank_type == RankConstant.RankType.termbegins then
		if slot0.select_index == 1 then
			slot0.top_label:setVisible(false)
			slot0.bottom_label:setVisible(false)
		else
			slot0.top_label:setVisible(true)
			slot0.bottom_label:setVisible(true)
			slot0.top_label:setString(TI18N("排名奖励在活动结束后通过邮件发放"))

			if slot0.scdata then
				slot0.bottom_label:setString(uv0(TI18N("再提升%s伤害可获得下一阶段奖励"), slot0.scdata.next_power))
			end
		end
	end
end

function ActiontermbeginsRankMainPanel.close_callback(slot0)
	if slot0.view_list then
		for slot4, slot5 in pairs(slot0.view_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.view_list = nil

	uv0:openActiontermbeginsRankMainPanel(false)
end
