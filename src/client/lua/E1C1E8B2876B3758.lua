PrimusChallengeRecordPanel = PrimusChallengeRecordPanel or BaseClass(BaseView)
slot1 = PrimusController:getInstance():getModel()

function PrimusChallengeRecordPanel.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.res_list = {}
	slot0.layout_name = "primus/primus_challenge_record_panel"
end

function PrimusChallengeRecordPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1

	slot0:playEnterAnimatianByObj(slot0.container, 1)
	slot1:getChildByName("win_title"):setString(TI18N("挑战记录"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.no_vedio_image = slot1:getChildByName("no_vedio_image")
	slot0.no_vedio_label = slot1:getChildByName("no_vedio_label")
	slot0.time_label = slot1:getChildByName("time_label")
	slot0.list_panel = slot1:getChildByName("list_panel")
	slot3 = slot0.list_panel:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.list_panel, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot3.width, slot3.height - 8), {
		start_y = 0,
		item_width = 616,
		start_x = 0,
		delay = 6,
		space_x = 0,
		row = 0,
		item_height = 218,
		space_y = 0,
		col = 1,
		item_class = PrimusChallengeRecordItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function PrimusChallengeRecordPanel.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openPrimusChallengeRecordPanel(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openPrimusChallengeRecordPanel(false)
		end
	end)
end

function PrimusChallengeRecordPanel.setData(slot0, slot1)
	if (slot1 or {}).list and next(slot1.list) ~= nil then
		slot0.item_scrollview:setData(slot1.list)
		slot0.no_vedio_image:setVisible(false)
		slot0.no_vedio_label:setVisible(false)
	else
		slot0.no_vedio_image:setVisible(true)
		slot0.no_vedio_label:setVisible(true)
	end
end

function PrimusChallengeRecordPanel.openRootWnd(slot0, slot1, slot2, slot3, slot4)
	slot0:setData(slot1)
end

function PrimusChallengeRecordPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.enemy_battle_array_panel then
		slot0.enemy_battle_array_panel:DeleteMe()

		slot0.enemy_battle_array_panel = nil
	end

	uv0:openPrimusChallengeRecordPanel(false)
end
