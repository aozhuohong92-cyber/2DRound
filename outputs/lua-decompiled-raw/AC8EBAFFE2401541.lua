LadderAwardWindow = LadderAwardWindow or BaseClass(BaseView)
slot1 = LadderController:getInstance():getModel()

function LadderAwardWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "ladder/ladder_award_window"
end

function LadderAwardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot1:getChildByName("win_title"):setString(TI18N("排名奖励"))
	slot1:getChildByName("range_label"):setString(TI18N("名次"))
	slot1:getChildByName("reward_label"):setString(TI18N("奖励"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot5 = slot1:getChildByName("my_rank")

	slot5:getChildByName("award_title"):setString(TI18N("保持排名可获得奖励:"))
	slot5:getChildByName("rank_title"):setString(TI18N("我的排名:"))

	slot0.rank_label = slot5:getChildByName("rank_label")

	slot5:getChildByName("tips_label"):setString(TI18N("奖励将在周日23:00通过邮件发放"))

	slot0.good_con = slot5:getChildByName("good_con")
	slot9 = slot0.good_con:getContentSize()
	slot0.good_con_size = slot9
	slot0.item_scroll_view = createScrollView(slot9.width, slot9.height, 0, 0, slot0.good_con, ccui.ScrollViewDir.horizontal)

	slot0.item_scroll_view:setAnchorPoint(cc.p(0, 0))
	slot0.item_scroll_view:setInnerContainerSize(cc.size(slot9.width, slot9.height))
	slot0.item_scroll_view:setSwallowTouches(false)

	slot0.item_list = slot1:getChildByName("item_list")
	slot10 = slot0.item_list:getContentSize()
	slot0.award_scrollview = CommonScrollViewLayout.new(slot0.item_list, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot10.width, slot10.height - 8), {
		start_y = 0,
		item_width = 608,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 124,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = LadderAwardItem
	})

	slot0.award_scrollview:setSwallowTouches(false)
end

function LadderAwardWindow.openRootWnd(slot0)
	slot0:setData()
end

function LadderAwardWindow.setData(slot0)
	if Config.SkyLadderData.data_award then
		slot2 = {}

		for slot6, slot7 in pairs(slot1) do
			table.insert(slot2, DeepCopy(slot7))
		end

		table.sort(slot2, function (slot0, slot1)
			return slot0.min < slot1.min
		end)
		slot0.award_scrollview:setData(slot2)

		if not uv0:getLadderMyBaseInfo().rank or slot4.rank <= 0 then
			slot0.rank_label:setString(TI18N("未上榜"))
			slot0.rank_label:setTextColor(cc.c3b(169, 95, 15))
		else
			slot0.rank_label:setString(slot4.rank)
			slot0.rank_label:setTextColor(cc.c3b(336, 144, 3))
		end

		slot5 = {}

		for slot9, slot10 in pairs(slot2) do
			if slot4.rank and slot10.min <= slot4.rank and slot4.rank <= slot10.max then
				slot5 = slot10.reward
			end
		end

		slot6 = 0.8

		slot0.item_scroll_view:removeAllChildren()

		for slot12, slot13 in pairs(slot5) do
			if type(slot13) == "table" then
				if Config.ItemData.data_get_data(slot13[1]) then
					slot17 = BackPackItem.new(false, true, false, 1, false, true)

					slot17:setBaseData(slot14, slot13[2])
					slot17:setDefaultTip(true)
					slot17:setPosition(35 + (BackPackItem.Width * slot6 + 15) * (slot12 - 1) + BackPackItem.Width * slot6 * 0.5, slot0.good_con_size.height / 2)
					slot17:setScale(slot6)
					slot0.item_scroll_view:addChild(slot17)
				end
			end
		end
	end
end

function LadderAwardWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 2)
end

function LadderAwardWindow._onClickBtnClose(slot0)
	uv0:openLadderAwardWindow(false)
end

function LadderAwardWindow.close_callback(slot0)
	if slot0.award_scrollview then
		slot0.award_scrollview:DeleteMe()

		slot0.award_scrollview = nil
	end

	uv0:openLadderAwardWindow(false)
end

LadderAwardItem = class("LadderAwardItem", function ()
	return ccui.Widget:create()
end)

function LadderAwardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function LadderAwardItem.configUI(slot0)
	slot0.size = cc.size(608, 124)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("ladder/ladder_award_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("main_container")
	slot0.container = slot2
	slot0.rank_label = slot2:getChildByName("rank_label")
	slot0.image = slot2:getChildByName("image")
	slot0.good_con = slot2:getChildByName("good_con")

	slot0.image:ignoreContentAdaptWithSize(true)

	slot3 = slot0.good_con:getContentSize()
	slot0.good_con_size = slot3
	slot0.item_scroll_view = CommonScrollViewLayout.new(slot0.good_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot3, {
		start_y = 0,
		start_x = 10,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.9,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.9,
		item_height = BackPackItem.Height * 0.9
	})

	slot0.item_scroll_view:setSwallowTouches(false)
end

function LadderAwardItem.register_event(slot0)
end

function LadderAwardItem.setData(slot0, slot1)
	if (slot1 or {}).min == 1 then
		slot0.image:setVisible(true)
		slot0.rank_label:setVisible(false)
		slot0.image:loadTexture(PathTool.getResFrame("common", "common_2001"), LOADTEXT_TYPE_PLIST)
	elseif slot1.min == 2 then
		slot0.image:setVisible(true)
		slot0.rank_label:setVisible(false)
		slot0.image:loadTexture(PathTool.getResFrame("common", "common_2002"), LOADTEXT_TYPE_PLIST)
	elseif slot1.min == 3 then
		slot0.image:setVisible(true)
		slot0.rank_label:setVisible(false)
		slot0.image:loadTexture(PathTool.getResFrame("common", "common_2003"), LOADTEXT_TYPE_PLIST)
	else
		slot0.image:setVisible(false)
		slot0.rank_label:setVisible(true)

		slot2 = ""

		slot0.rank_label:setString((slot1.min ~= slot1.max or slot1.min) and string.format("%d~%d", slot1.min, slot1.max))
	end

	slot2 = {}

	for slot6, slot7 in pairs(slot1.reward) do
		table.insert(slot2, {
			bid = slot7[1],
			quantity = slot7[2]
		})
	end

	slot0.item_scroll_view:setData(slot2)
end

function LadderAwardItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
