HeroResetReturnPanel = HeroResetReturnPanel or BaseClass(BaseView)
slot0 = table.insert
slot2 = HeroController:getInstance():getModel()

function HeroResetReturnPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "hero/hero_reset_return_panel"
end

function HeroResetReturnPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.win_title = slot1:getChildByName("win_title")

	slot0.win_title:setString(TI18N("英雄献祭"))

	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot0.confirm_btn_label = slot0.confirm_btn:getChildByName("label")

	slot0.confirm_btn_label:setString(TI18N("确 定"))
	slot0.confirm_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)

	slot0.list_view = slot1:getChildByName("list_view")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.list_view, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.list_view:getContentSize(), {
		start_y = 6,
		once_num = 4,
		start_x = 16,
		item_width = 119,
		space_x = 32,
		row = 4,
		item_height = 119,
		space_y = 10,
		col = 4,
		need_dynamic = true,
		item_class = BackPackItem
	})
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.container = slot1
end

function HeroResetReturnPanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHeroResetReturnPanel(false)
	end, true, 1)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHeroResetReturnPanel(false)
	end, false, 1)
	registerButtonEventListener(slot0.confirm_btn, function ()
		uv0:openHeroResetReturnPanel(false)
	end, true, 2)
	slot0:addGlobalEvent(HeroEvent.Hero_Reset_Look_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0.list)
	end)
end

function HeroResetReturnPanel.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	uv0:sender11075(slot1)
end

function HeroResetReturnPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		uv0(slot2, {
			id = slot7.id,
			quantity = slot7.num
		})
	end

	table.sort(slot2, SortTools.tableUpperSorter({
		"id"
	}))
	slot0.item_scrollview:setData(slot2, nil, , {
		is_show_tips = true,
		is_other = false
	})
end

function HeroResetReturnPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openHeroResetReturnPanel(false)
end
