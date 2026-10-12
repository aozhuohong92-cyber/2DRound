AdventureFormWindow = AdventureFormWindow or BaseClass(BaseView)
slot0 = AdventureController:getInstance()
slot1 = AdventureController:getInstance():getUiModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = GameNet:getInstance()
slot6 = HeroController:getInstance():getModel()

function AdventureFormWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.index = 2
	slot0.layout_name = "adventure/adventure_form_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("form", "form"),
			type = ResourcesType.plist
		}
	}
	slot0.five_hero_vo = {}
	slot0.hero_item_list = {}
	slot0.select_list = {}
end

function AdventureFormWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("win_title"):setString(TI18N("冒险出战"))

	slot2 = slot1:getChildByName("top_panel")
	slot0.lay_scrollview = slot2:getChildByName("lay_scrollview")
	slot0.no_vedio_image = slot2:getChildByName("no_vedio_image")

	slot0.no_vedio_image:getChildByName("label"):setString(TI18N("暂无该类型英雄"))

	slot3 = slot2:getChildByName("camp_node")
	slot0.camp_btn_list = {
		[0] = slot3:getChildByName("camp_btn0"),
		[HeroConst.CampType.eWater] = slot3:getChildByName("camp_btn1"),
		[HeroConst.CampType.eFire] = slot3:getChildByName("camp_btn2"),
		[HeroConst.CampType.eWind] = slot3:getChildByName("camp_btn3"),
		[HeroConst.CampType.eLight] = slot3:getChildByName("camp_btn4"),
		[HeroConst.CampType.eDark] = slot3:getChildByName("camp_btn5")
	}
	slot0.img_select = slot3:getChildByName("img_select")
	slot4, slot5 = slot0.camp_btn_list[0]:getPosition()
	slot10 = slot5 + 1

	slot0.img_select:setPosition(slot4 - 0.5, slot10)

	slot6 = slot1:getChildByName("bottom_panel")

	for slot10 = 1, 5 do
		slot11 = HeroExhibitionItem.new(0.9, false)

		slot11:setPosition(104 + (slot10 - 1) * 128, 229)
		slot6:addChild(slot11)

		slot0.hero_item_list[slot10] = slot11
	end

	slot6:getChildByName("pos_tips"):setString(TI18N("从列表中选择英雄"))
	slot6:getChildByName("pos_tips"):setTextColor(cc.c4b(144, 93, 56, 255))

	slot0.fight_btn = slot6:getChildByName("fight_btn")
	slot0.key_up_btn = slot6:getChildByName("key_up_btn")

	slot0.fight_btn:getChildByName("label"):setString(TI18N("进入冒险"))
	slot0.key_up_btn:getChildByName("label"):setString(TI18N("一键布阵"))

	slot0.power_click = slot6:getChildByName("power_click")
	slot0.fight_label = CommonNum.new(20, slot0.power_click, 0, -2, cc.p(0.5, 0.5))

	slot0.fight_label:setPosition(103, 28)
end

function AdventureFormWindow.register_event(slot0)
	function slot4()
		uv0:openAdventureFormWindow(false)
	end

	slot5 = false

	registerButtonEventListener(slot0.background, slot4, slot5, 2)

	for slot4, slot5 in pairs(slot0.camp_btn_list) do
		registerButtonEventListener(slot5, function ()
			uv0:onClickBtnShowByIndex(uv1)
		end, true, 2)
	end

	registerButtonEventListener(slot0.key_up_btn, handler(slot0, slot0.onClickKeyUpBtn), true, 2)

	slot4 = handler(slot0, slot0.onClickSaveBtn)
	slot5 = true

	registerButtonEventListener(slot0.fight_btn, slot4, slot5, 2)

	for slot4, slot5 in ipairs(slot0.hero_item_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:onClickHeroItemEnd(uv1, slot0)
			end
		end)
	end
end

function AdventureFormWindow.openRootWnd(slot0, slot1)
	slot0.max_floor = (slot1 or {}).max_floor

	slot0:onClickBtnShowByIndex(0)
end

function AdventureFormWindow.onClickBtnShowByIndex(slot0, slot1)
	if slot0.img_select and slot0.camp_btn_list[slot1] then
		slot2, slot3 = slot0.camp_btn_list[slot1]:getPosition()

		slot0.img_select:setPosition(slot2 - 0.5, slot3 + 1)
	end

	slot0:updateHeroList(slot1)
end

function AdventureFormWindow.updateHeroList(slot0, slot1)
	if (slot1 or 0) == slot0.select_camp then
		return
	end

	if not slot0.list_view then
		slot0.list_view = CommonScrollViewLayout.new(slot0.lay_scrollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.lay_scrollview:getContentSize(), {
			start_y = 0,
			once_num = 5,
			start_x = 0,
			item_width = 119,
			space_x = 8,
			row = 5,
			item_height = 119,
			space_y = 10,
			col = 5,
			need_dynamic = true,
			item_class = HeroExhibitionItem
		})
	end

	slot0.select_camp = slot2

	function slot3(slot0, slot1)
		uv0:selectHero(slot0, slot1)
	end

	slot4 = uv0:getAllHeroArray()
	slot5 = {}
	slot9 = slot4

	for slot9 = 1, slot4.GetSize(slot9) do
		slot10 = slot4:Get(slot9 - 1)

		if slot2 == 0 or slot2 == slot10.camp_type then
			uv1(slot5, slot10)
		end
	end

	if #slot5 > 0 then
		uv2(slot5, SortTools.tableUpperSorter({
			"star",
			"power",
			"lev",
			"sort_order"
		}))
		slot0.list_view:setData(slot5, slot3, nil, {
			can_click = true,
			scale = 0.9,
			from_type = HeroConst.ExhibitionItemType.eAdventure
		})
		slot0.no_vedio_image:setVisible(false)
	else
		slot0.list_view:setData({})
		slot0.no_vedio_image:setVisible(true)
	end

	slot0.show_list = slot5
end

function AdventureFormWindow.onClickKeyUpBtn(slot0)
	if tableLen(slot0.five_hero_vo) >= 5 then
		message(TI18N("上阵人数已满"))

		return
	end

	if slot0.show_list == nil or next(slot0.show_list) == nil then
		message(TI18N("当前列表没有可上阵的英雄"))

		return
	end

	for slot5 = 1, 5 do
		if slot0.five_hero_vo[slot5] == nil and slot0:getFreeHero() then
			slot6.is_ui_select = true
			slot0.five_hero_vo[slot5] = slot6

			slot0.hero_item_list[slot5]:setData(slot6)
			slot0:setTopSelect(slot6, slot5)
		end
	end

	slot0:updateFightPower()
end

function AdventureFormWindow.setTopSelect(slot0, slot1, slot2)
	if slot0.list_view == nil then
		return
	end

	if slot0.select_list[slot2] then
		return
	end

	for slot7, slot8 in pairs(slot0.list_view:getItemList()) do
		if slot8:getData() and slot9.partner_id == slot1.partner_id then
			slot8:setSelected(slot1.is_ui_select)

			slot0.select_list[slot2] = slot8

			break
		end
	end
end

function AdventureFormWindow.getFreeHero(slot0)
	for slot4, slot5 in ipairs(slot0.show_list) do
		slot6 = true

		if slot5.isResonateHero and slot5:isResonateHero() then
			slot6 = false
		end

		if slot6 == true then
			for slot10, slot11 in pairs(slot0.five_hero_vo) do
				if slot5.partner_id == slot11.partner_id or slot5.bid == slot11.bid then
					slot6 = false

					break
				end
			end
		end

		if slot6 == true then
			return slot5
		end
	end
end

function AdventureFormWindow.selectHero(slot0, slot1, slot2)
	if slot1 == nil or slot2 == nil then
		return
	end

	slot3 = -1

	for slot8, slot9 in pairs(slot0.five_hero_vo) do
		if slot2.partner_id == slot9.partner_id then
			slot3 = slot8

			break
		end
	end

	if slot3 ~= -1 then
		slot2.is_ui_select = false

		slot1:setSelected(slot2.is_ui_select)
		slot0.hero_item_list[slot3]:setData(nil)

		slot0.five_hero_vo[slot3] = nil
		slot0.select_list[slot3] = nil
	else
		if slot2.checkResonateHero and slot2:checkResonateHero() then
			return
		end

		slot5 = 0

		for slot9, slot10 in pairs(slot0.five_hero_vo) do
			if slot10.bid == slot2.bid then
				message(TI18N("不能同时上阵2个相同英雄"))

				return
			end

			slot5 = slot5 + 1
		end

		if slot5 >= 5 then
			message(TI18N("上阵人数已满"))

			return
		end

		slot6 = 0

		for slot10 = 1, 5 do
			if slot0.five_hero_vo[slot10] == nil then
				slot6 = slot10

				break
			end
		end

		if slot6 == 0 then
			message(TI18N("没有上阵位置"))

			return
		end

		slot0.five_hero_vo[slot6] = slot2

		slot0.hero_item_list[slot6]:setData(slot2)

		slot0.select_list[slot6] = slot1
		slot2.is_ui_select = true

		slot1:setSelected(slot2.is_ui_select)
	end

	slot0:updateFightPower()
end

function AdventureFormWindow.updateFightPower(slot0)
	for slot5, slot6 in pairs(slot0.five_hero_vo) do
		slot1 = 0 + slot6.power
	end

	slot0.fight_label:setNum(slot1)
end

function AdventureFormWindow.onClickHeroItemEnd(slot0, slot1, slot2)
	if slot0.five_hero_vo[slot1] == nil then
		return
	end

	slot3.is_ui_select = false

	for slot8, slot9 in ipairs(slot0.list_view:getItemList()) do
		if slot9:getData().partner_id == slot3.partner_id then
			slot9:setSelected(slot3.is_ui_select)
		end
	end

	slot0.five_hero_vo[slot1] = nil
	slot0.select_list[slot1] = nil

	slot0.hero_item_list[slot1]:setData(nil)
	slot0:updateFightPower()
end

function AdventureFormWindow.onClickSaveBtn(slot0)
	for slot6, slot7 in pairs(slot0.five_hero_vo) do
		uv0({}, {
			id = slot7.partner_id
		})

		slot2 = 0 + 1
	end

	if slot2 == 0 then
		message(TI18N("请设置出战英雄"))

		return
	end

	if slot2 < 5 and slot2 < uv1:getAllHeroArray():GetSize() then
		CommonAlert.show(TI18N("当前上阵英雄不足5个，是否确认以此阵容进入冒险？"), TI18N("确定"), function ()
			uv0:requestSetForm(uv1, uv2.max_floor)
		end, TI18N("取消"))
	else
		uv2:requestSetForm(slot1, slot0.max_floor)
	end
end

function AdventureFormWindow.close_callback(slot0)
	if slot0.fight_label then
		slot0.fight_label:DeleteMe()
	end

	slot0.fight_label = nil

	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.hero_item_list then
		for slot4, slot5 in ipairs(slot0.hero_item_list) do
			slot5:DeleteMe()
		end

		slot0.hero_item_list = nil
	end

	for slot5, slot6 in pairs(uv0:getHeroList()) do
		slot6.is_ui_select = nil
	end

	uv1:openAdventureFormWindow(false)
end
