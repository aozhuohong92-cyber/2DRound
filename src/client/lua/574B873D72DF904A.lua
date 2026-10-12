GuildwarAwardBoxPreview = GuildwarAwardBoxPreview or BaseClass(BaseView)
slot0 = GuildwarController:getInstance()

function GuildwarAwardBoxPreview.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "guildwar/guildwar_award_preview"
end

function GuildwarAwardBoxPreview.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("奖励预览"))
	slot1:getChildByName("tips_label_1"):setString(TI18N("黄金宝箱可开出下列物品"))
	slot1:getChildByName("tips_label_2"):setString(TI18N("青铜宝箱可开出下列物品"))

	slot0.ok_btn = slot1:getChildByName("ok_btn")

	slot0.ok_btn:getChildByName("label"):setString(TI18N("确定"))

	slot5 = slot1:getChildByName("good_con_1")
	slot6 = slot5:getContentSize()
	slot0.item_scrollview_1 = CommonScrollViewLayout.new(slot5, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot6, {
		start_y = 0,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		item_class = BackPackItem,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height
	})
	slot0.item_scrollview_2 = CommonScrollViewLayout.new(slot1:getChildByName("good_con_2"), cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot6, {
		start_y = 0,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		item_class = BackPackItem,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height
	})
end

function GuildwarAwardBoxPreview.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openAwardBoxPreview(false)
	end, false, 2)
	registerButtonEventListener(slot0.ok_btn, function ()
		uv0:openAwardBoxPreview(false)
	end, true, 2)
end

function GuildwarAwardBoxPreview.openRootWnd(slot0)
	slot0:setData()
end

function GuildwarAwardBoxPreview.setData(slot0)
	if Config.GuildWarData.data_box_award[1].award then
		slot2 = {}

		for slot6, slot7 in ipairs(slot1.award) do
			if Config.ItemData.data_get_data(slot7) then
				table.insert(slot2, deepCopy(slot8))
			end
		end

		slot0.item_scrollview_1:setData(slot2)
		slot0.item_scrollview_1:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.item_scrollview_1:getItemList()) do
				slot5:setDefaultTip()
			end
		end)
	end

	if Config.GuildWarData.data_box_award[2].award then
		slot3 = {}

		for slot7, slot8 in ipairs(slot2.award) do
			if Config.ItemData.data_get_data(slot8) then
				table.insert(slot3, deepCopy(slot9))
			end
		end

		slot0.item_scrollview_2:setData(slot3)
		slot0.item_scrollview_2:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.item_scrollview_2:getItemList()) do
				slot5:setDefaultTip()
			end
		end)
	end
end

function GuildwarAwardBoxPreview.close_callback(slot0)
	if slot0.item_scrollview_1 then
		slot0.item_scrollview_1:DeleteMe()

		slot0.item_scrollview_1 = nil
	end

	if slot0.item_scrollview_2 then
		slot0.item_scrollview_2:DeleteMe()

		slot0.item_scrollview_2 = nil
	end

	uv0:openAwardBoxPreview(false)
end
