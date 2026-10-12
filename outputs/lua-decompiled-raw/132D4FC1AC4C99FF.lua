StrongerPanel = class("StrongerPanel", function ()
	return ccui.Widget:create()
end)

function StrongerPanel.ctor(slot0, slot1)
	slot0.ctrl = StrongerController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.cur_hero_item = nil
	slot0.partner_id = slot1 or 0

	slot0:configUI()
	slot0:register_event()
end

function StrongerPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("stronger/stronger_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:getChildByName("title_role"):setString(TI18N("我的阵容"))

	slot2 = slot0.main_container:getChildByName("info_bg")
	slot3 = slot2:getChildByName("now_hero")

	slot3:setString(TI18N("当前英雄："))
	UITool.SetTitleColor(slot3)

	slot0.now_hero_val = slot2:getChildByName("now_hero_val")

	UITool.SetLightColor(slot0.now_hero_val)

	slot4 = slot2:getChildByName("title")

	slot4:setString(TI18N("评分/本服最高"))
	slot4:setTextColor(cc.c4b(87, 177, 233, 255))

	slot0.loadingbar = slot2:getChildByName("loadingbar")

	slot0.loadingbar:setScale9Enabled(true)

	slot0.loadingbar_exp = slot2:getChildByName("loadingbar_exp")
	slot0.hero_con = slot0.main_container:getChildByName("hero_con")
	slot5 = slot0.hero_con:getContentSize()
	slot7 = 0.8
	slot0.hero_scroll = CommonScrollViewLayout.new(slot0.hero_con, cc.p(0, -20), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot5.width, slot5.height + 40), {
		start_y = 20,
		start_x = 5,
		space_x = 12,
		row = 1,
		space_y = 0,
		col = 0,
		item_class = HeroExhibitionItem,
		item_width = HeroExhibitionItem.Width * slot7,
		item_height = HeroExhibitionItem.Height * slot7,
		scale = slot7
	})

	slot0.hero_scroll:setSwallowTouches(false)
	slot0.hero_scroll:setBounceEnabled(false)

	slot0.scroll_con = slot0.main_container:getChildByName("scroll_con")
	slot0.item_scroll = CommonScrollViewLayout.new(slot0.scroll_con, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_con:getContentSize(), {
		start_y = 0,
		item_width = 617,
		start_x = 0,
		space_x = 10,
		row = 0,
		item_height = 142,
		space_y = 8,
		col = 1,
		item_class = StrongerPanelItem
	})

	slot0.item_scroll:setSwallowTouches(false)
	slot0:createHeroList()
end

function StrongerPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function StrongerPanel.createHeroList(slot0)
	slot2 = {}

	for slot6, slot7 in pairs(HeroController:getInstance():getModel():getMyPosList()) do
		slot8 = HeroController:getInstance():getModel():getHeroById(slot7.id)

		if slot0.partner_id == 0 and #slot2 == 0 then
			slot0.partner_id = slot8.partner_id
		end

		table.insert(slot2, slot8)
	end

	slot0.hero_scroll:setData(slot2, function (slot0, slot1)
		uv0:_onClickHero(slot0, slot1)
	end, nil, {
		scale = 0.8,
		click_delay = 0.5,
		can_click = true,
		from_type = HeroConst.ExhibitionItemType.eStronger
	})
	slot0.hero_scroll:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.hero_scroll:getItemList()) do
			if slot5:getData().partner_id == uv0.partner_id then
				uv0:_onClickHero(slot5, slot6)

				break
			end
		end
	end)
end

function StrongerPanel._onClickHero(slot0, slot1, slot2)
	if slot2.is_ui_select == true then
		return
	end

	if slot0.cur_hero_item then
		slot0.cur_hero_item:getData().is_ui_select = false

		slot0.cur_hero_item:setBoxSelected(false)
	end

	slot2.is_ui_select = true

	slot1:setBoxSelected(true)

	slot0.cur_hero_item = slot1

	slot0.ctrl:sender11070(slot2.partner_id)
end

function StrongerPanel.refreshViewByHero(slot0, slot1)
	slot0.now_hero_val:setString(slot1.name)

	slot2, slot3 = slot0.model:getTotalAndMaxValByBid(slot1.bid)

	slot0.loadingbar:setPercent(slot2 / slot3 * 100)
	slot0.loadingbar_exp:setString(slot2 .. "/" .. slot3)
	slot0:refreshItemList(slot1.bid)
end

function StrongerPanel.getCurHero(slot0)
	return slot0.cur_hero_item
end

function StrongerPanel.refreshItemList(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(Config.StrongerData.data_stronger_two) do
		slot8 = true

		for slot12, slot13 in pairs(slot7.limit) do
			if slot0.model:checkStrongItemIsOpen(slot13) == false then
				slot8 = false
			end
		end

		if slot8 then
			slot9 = deepCopy(slot7)
			slot9.score_val, slot9.max_val = slot0.model:getStrongerValByBid(slot1, slot7.id)

			table.insert(slot2, slot9)
		end
	end

	table.sort(slot2, SortTools.KeyLowerSorter("sort"))
	slot0.item_scroll:setData(slot2)
end

function StrongerPanel.register_event(slot0)
	if not slot0.partner_stronger_event then
		slot0.partner_stronger_event = GlobalEvent:getInstance():Bind(StrongerEvent.UPDATE_SCROE, function (slot0)
			if uv0.cur_hero_item and uv0.cur_hero_item:getData().bid == slot0.partner_bid then
				uv0:refreshViewByHero(slot1)
			end
		end)
	end
end

function StrongerPanel.DeleteMe(slot0)
	if slot0.hero_scroll then
		slot0.hero_scroll:DeleteMe()

		slot0.hero_scroll = nil
	end

	if slot0.item_scroll then
		slot0.item_scroll:DeleteMe()

		slot0.item_scroll = nil
	end

	if slot0.partner_stronger_event then
		GlobalEvent:getInstance():UnBind(slot0.partner_stronger_event)

		slot0.partner_stronger_event = nil
	end

	for slot5, slot6 in pairs(HeroController:getInstance():getModel():getHeroList()) do
		slot6.is_ui_select = nil
	end
end

StrongerPanelItem = class("StrongerPanelItem", function ()
	return ccui.Widget:create()
end)

function StrongerPanelItem.ctor(slot0)
	slot0.ctrl = StrongerController:getInstance()

	slot0:configUI()
	slot0:register_event()
end

function StrongerPanelItem.configUI(slot0)
	slot0.size = cc.size(617, 142)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("stronger/stronger_panel_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("main_container")
	slot3 = slot2:getChildByName("score_title")

	slot3:setString(TI18N("评分/本服最高"))
	slot3:setTextColor(cc.c4b(87, 177, 233, 255))

	slot0.name_label = slot2:getChildByName("name")
	slot0.desc_label = slot2:getChildByName("desc_label")
	slot0.goods_icon = slot2:getChildByName("goods_icon")

	UITool.SetTitleColor(slot0.name_label)
	UITool.SetLightColor(slot0.desc_label)

	slot0.loadingbar = slot2:getChildByName("loadingbar")

	slot0.loadingbar:setScale9Enabled(true)

	slot0.loadingbar_exp = slot2:getChildByName("loadingbar_exp")
	slot0.go_btn = slot2:getChildByName("go_btn")

	slot0.go_btn:getChildByName("label"):setString(TI18N("前往"))
end

function StrongerPanelItem.register_event(slot0)
	registerButtonEventListener(slot0.go_btn, handler(slot0, slot0._onClickGoBtn), true)
end

function StrongerPanelItem._onClickGoBtn(slot0)
	if slot0.data and slot0.data.evt_type then
		slot0.ctrl:clickCallBack(slot0.data.evt_type)
	end
end

function StrongerPanelItem.setData(slot0, slot1)
	if slot1 then
		if slot1._index then
			slot0.go_btn:setName("go_btn_" .. slot1._index)
		end

		slot0.data = slot1

		slot0.name_label:setString(slot1.name)
		loadSpriteTexture(slot0.goods_icon, PathTool.getStrongerIconRes(slot1.icon), LOADTEXT_TYPE)
		slot0.desc_label:setString(slot1.desc)
		slot0.loadingbar:setPercent(slot1.score_val / slot1.max_val * 100)
		slot0.loadingbar_exp:setString(slot1.score_val .. "/" .. slot1.max_val)
	end
end

function StrongerPanelItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
