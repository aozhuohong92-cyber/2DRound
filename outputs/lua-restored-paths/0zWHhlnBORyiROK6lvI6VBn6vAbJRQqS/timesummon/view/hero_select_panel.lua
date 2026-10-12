slot0 = Config.RecruitHolidayLuckyData.data_award
HeroSelectPanel = HeroSelectPanel or BaseClass(BaseView)

function HeroSelectPanel.__init(slot0)
	slot0.layout_name = "elitesummon/hero_select_panel"
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.cur_item = nil
end

function HeroSelectPanel.open_callback(slot0)
	slot1 = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.close_btn = slot1:getChildByName("close_btn")

	slot1:getChildByName("top_panel"):getChildByName("title_label"):setString(TI18N("自选奖励"))

	slot0.desc_label = createRichLabel(24, Config.ColorData.data_color4[156], cc.p(0.5, 1), cc.p(315, 710), 2, nil, 600)

	slot1:addChild(slot0.desc_label)
	slot0.desc_label:setString("")

	slot0.item_scroll = slot1:getChildByName("item_scroll")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.item_scroll, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.item_scroll:getContentSize(), {
		start_y = 0,
		start_x = 8,
		space_x = 20,
		row = 0,
		space_y = 0,
		col = 1,
		item_class = HeroSelectItem,
		item_width = HeroSelectItem.width,
		item_height = HeroSelectItem.height
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.use_btn = slot1:getChildByName("use_btn")

	slot0.use_btn:getChildByName("label"):setString(TI18N("使用"))
	slot0.use_btn:setVisible(false)
end

function HeroSelectPanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		TimesummonController:getInstance():openHeroSelectView(false)
	end, false, 2)
	registerButtonEventListener(slot0.use_btn, function ()
		if uv0.group_id and uv0.self_award_id then
			EliteSummonController:getInstance():send23232(5, uv0.self_award_id)
		end
	end, false, 1)
end

function HeroSelectPanel.openRootWnd(slot0, slot1, slot2)
	if slot0.item_scrollview then
		slot0.group_id = slot1.camp_id

		if uv0[slot0.group_id] and uv0[slot0.group_id][5] and uv0[slot0.group_id][5].self_reward then
			if slot1.status == false and uv0[slot0.group_id][5].times <= slot2 then
				slot1.status = true
			end

			if slot1.status then
				slot0.use_btn:setVisible(true)
				slot0.desc_label:setString(TI18N("请从以下奖励中选择1个"))
			else
				slot0.desc_label:setString(TI18N("达到指定招募次数后可从以下奖励中任选1个"))
			end

			slot0.item_scrollview:setData(uv0[slot0.group_id][5].self_reward, function (slot0)
				if uv0.cur_item ~= nil then
					uv0.cur_item:setSelected(false)
				end

				uv0.cur_item = slot0
				uv0.self_award_id = slot0:getData()[1]
				uv0.award_index = slot0:getData()._index

				slot0:setSelected(true)
			end, nil, slot1.status)
		end
	end
end

function HeroSelectPanel.close_callback(slot0)
	TimesummonController:getInstance():openHeroSelectView(false)
end

HeroSelectItem = class("HeroSelectItem", function ()
	return ccui.Widget:create()
end)
HeroSelectItem.width = 585
HeroSelectItem.height = 130

function HeroSelectItem.ctor(slot0, slot1, slot2)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("elitesummon/hero_select_item"))

	slot0:setContentSize(cc.size(HeroSelectItem.width, HeroSelectItem.height))
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.select_btn = slot0.container:getChildByName("select_btn")

	slot0.select_btn:setVisible(false)

	slot0.select_choose = slot0.select_btn:getChildByName("Sprite_6_0")

	slot0.select_choose:setVisible(false)

	slot0.item = BackPackItem.new(true, true)

	slot0.item:setAnchorPoint(0.5, 0.5)
	slot0.item:setPosition(80, 65)
	slot0.item:setScale(0.85)
	slot0.container:addChild(slot0.item)
	slot0:register_event()
end

function HeroSelectItem.register_event(slot0)
	registerButtonEventListener(slot0.select_btn, function ()
		if uv0.call_fun then
			uv0:call_fun(uv0.item_data)
		end
	end, false, 1)
end

function HeroSelectItem.setExtendData(slot0, slot1)
	slot0.item_status = slot1 or false
end

function HeroSelectItem.setData(slot0, slot1)
	slot0.item_data = slot1

	slot0.select_btn:setVisible(slot0.item_status)

	if slot1 and slot0.item then
		slot0.item:setBaseData(slot1[1], slot1[2])

		if slot0.item_name == nil then
			slot0.item_name = createLabel(26, Config.ColorData.data_color4[156], nil, 180, 65, "", slot0.container, nil, cc.p(0, 0.5))
		end

		slot0.item_name:setString(Config.ItemData.data_get_data(slot1[1]).name .. "X" .. slot1[2])
	end
end

function HeroSelectItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function HeroSelectItem.setSelected(slot0, slot1)
	slot0.select_choose:setVisible(slot1 or false)
end

function HeroSelectItem.getData(slot0)
	return slot0.item_data
end

function HeroSelectItem.DeleteMe(slot0)
	if slot0.item then
		slot0.item:DeleteMe()

		slot0.item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
