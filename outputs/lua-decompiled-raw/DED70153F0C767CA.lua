PractisetowerRankWindow = PractisetowerRankWindow or BaseClass(BaseView)
slot1 = PractisetowerController:getInstance():getModel()
slot2 = string.format

function PractisetowerRankWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
	slot0.layout_name = "practisetower/practise_tower_rank_window"
	slot0.view_list = {}
end

function PractisetowerRankWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot6 = 0.25

	ActionHelp.itemUpAction(slot0.main_container, 720, 0, slot6)

	slot0.container = slot0.main_container:getChildByName("container")
	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("排行榜"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.time_lab = slot1:getChildByName("time_lab")
	slot0.tab_container = slot0.main_container:getChildByName("tab_container")
	slot2 = {
		TI18N("排行榜"),
		TI18N("排行奖励")
	}
	slot0.tab_item_type = {
		PractisetowerEvent.type.rank,
		PractisetowerEvent.type.reward
	}
	slot0.tab_list = {}

	for slot6 = 1, 2 do
		if slot0.tab_container:getChildByName("tab_btn_" .. slot6) then
			slot8 = {
				select_bg = slot7:getChildByName("select_bg")
			}

			slot8.select_bg:setVisible(false)

			slot8.unselect_bg = slot7:getChildByName("unselect_bg")
			slot8.title = slot7:getChildByName("title")

			slot8.title:setTextColor(cc.c4b(207, 181, 147, 255))

			if slot2[slot6] then
				slot8.title:setString(slot2[slot6])
			end

			slot8.tab_btn = slot7
			slot8.index = slot0.tab_item_type[slot6] or PractisetowerEvent.type.rank
			slot0.tab_list[slot6] = slot8
		end
	end
end

function PractisetowerRankWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)

	function slot4()
		uv0:onClosedBtn()
	end

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
end

function PractisetowerRankWindow.onClosedBtn(slot0)
	uv0:openRankWindow(false)
end

function PractisetowerRankWindow.setTimeValFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_lab:setString(uv0("剩余时间：%s", TimeTool.GetTimeFormatDayIIIIIIII(slot1)))
	else
		slot0.time_lab:setString("")
	end
end

function PractisetowerRankWindow.changeSelectedTab(slot0, slot1)
	if slot0.tab_object and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)
		slot0.tab_object.title:setTextColor(cc.c4b(207, 181, 147, 255))

		slot0.tab_object = nil
	end

	slot0.cur_tab_index = slot1
	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
		slot0.tab_object.title:setTextColor(cc.c4b(255, 237, 214, 255))
	end

	if slot0.pre_panel then
		if slot0.pre_panel.setVisibleStatus then
			slot0.pre_panel:setVisibleStatus(false)
		else
			slot0.pre_panel:setVisible(false)
		end
	end

	slot0.pre_panel = slot0:createSubPanel(slot0.cur_tab_index)

	if slot0.pre_panel ~= nil then
		if slot0.pre_panel.setVisibleStatus then
			slot0.pre_panel:setVisibleStatus(true)
		else
			slot0.pre_panel:setVisible(true)
		end
	end
end

function PractisetowerRankWindow.createSubPanel(slot0, slot1)
	if not slot0.view_list then
		return
	end

	if slot0.view_list[slot1] == nil then
		if slot1 == PractisetowerEvent.type.rank then
			slot2 = PractisetowerRankPanel.new()
		elseif slot1 == PractisetowerEvent.type.reward then
			slot2 = PractisetowerAwardsPanel.new()
		end

		slot0.container:addChild(slot2)

		slot0.view_list[slot1] = slot2
	end

	return slot2
end

function PractisetowerRankWindow.openRootWnd(slot0)
	if not slot0.tab_item_type then
		return
	end

	slot0:changeSelectedTab(PractisetowerEvent.type.rank)

	if uv0:getPractiseTowerData() then
		if slot1.last_unixtime - GameNet:getInstance():getTime() < 0 then
			slot2 = 0
		end

		commonCountDownTime(slot0.time_lab, slot2, {
			callback = function (slot0)
				uv0:setTimeValFormatString(slot0)
			end
		})
	end
end

function PractisetowerRankWindow.close_callback(slot0)
	doStopAllActions(slot0.time_lab)

	if slot0.view_list then
		for slot4, slot5 in pairs(slot0.view_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.view_list = nil

	uv0:openRankWindow(false)
end
