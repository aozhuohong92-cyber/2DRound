FruitTreasureChipBagView = FruitTreasureChipBagView or BaseClass(BaseView)
slot1 = FruitTreasureController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = table.remove
slot5 = BackpackController:getInstance():getModel()

function FruitTreasureChipBagView.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "fruit_treasure/fruit_chip_bag_view"
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.camp_btns = {}
	slot0.cur_camp = HeroConst.CampType.eNone
	slot0.need_hero_num = 0
	slot0.chose_heros = {}
	slot0.hero_boxs = {}
	slot0.hero_icons = {}
	slot0.camp_icons = {}
	slot0.conditions = {}
	slot0.con_status = false
	slot0.con_tips = TI18N("不满足派遣条件")
	slot0.col_size = 5
end

function FruitTreasureChipBagView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("win_title"):setString(TI18N("碎片背包"))

	slot0.no_image = slot1:getChildByName("no_image")
	slot0.no_label = slot1:getChildByName("no_label")

	slot0.no_label:setVisible(false)
	slot0.no_label:setVisible(false)

	slot0.btn_close = slot1:getChildByName("close_btn")
	slot3 = slot1:getChildByName("lay_scrollview")
	slot4 = slot3:getContentSize()
	slot0.chips_scrollview = CommonScrollViewLayout.new(slot3, cc.p(10, 10), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot4.width - 20, slot4.height - 20), {
		start_y = 0,
		once_num = 5,
		start_x = 0,
		item_width = 119,
		space_x = 4,
		row = 5,
		item_height = 119,
		space_y = 10,
		col = 5,
		need_dynamic = true,
		item_class = BackPackItem
	})
end

function FruitTreasureChipBagView.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.btn_close, handler(slot0, slot0._onClickCloseBtn), false, 2)

	if not slot0.del_goods_event then
		slot0.del_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 == BackPackConst.Bag_Code.BACKPACK then
				uv0:setPanelData()
			end
		end)
	end
end

function FruitTreasureChipBagView.openRootWnd(slot0, slot1)
	slot0:setPanelData()
end

function FruitTreasureChipBagView.setPanelData(slot0)
	slot0.min_size = tableLen(uv0:getAllBackPackArray(BackPackConst.item_tab_type.Fruit, true))

	if slot0.min_size <= 30 then
		slot0.min_size = 30
	end

	if slot0.min_size > #slot1 then
		for slot7 = 1, slot2 - slot3 do
			uv1(slot1, {
				eqm_jie = -1,
				quality = -1,
				eqm_star = -1,
				gemstone_sort = -1,
				sort = -1
			})
		end
	else
		slot4 = 0

		if slot3 % slot0.col_size ~= 0 then
			slot4 = slot0.col_size - slot3 % slot0.col_size
		end

		if slot4 ~= 0 then
			for slot8 = 1, slot4 do
				uv1(slot1, {
					eqm_jie = -1,
					quality = -1,
					eqm_star = -1,
					gemstone_sort = -1,
					sort = -1
				})
			end
		end
	end

	slot4 = nil

	uv2(slot1, SortTools.tableUpperSorter({
		"quality",
		"sort",
		"base_id"
	}))
	slot0.chips_scrollview:setSpace(10)
	slot0.chips_scrollview:setData(slot1, function (slot0, slot1)
		uv0:selectedItem(slot0)
	end, nil, {
		red_point = true,
		showCheckBox = true,
		is_other = false,
		show_use_target = true,
		is_comp_num = false
	})
end

function FruitTreasureChipBagView.selectedItem(slot0, slot1, slot2)
	if slot1 and slot1:getData() then
		if slot1:getData() == nil or slot3.config == nil or slot3.config.type == nil then
			return
		end

		TipsManager:getInstance():showFruitChipTips(slot3, true, true, false, false, true)
	end
end

function FruitTreasureChipBagView._onClickCampBtn(slot0, slot1, slot2)
	if slot0.cur_camp == slot1 then
		return
	end

	slot0.cur_camp = slot1
	slot3, slot4 = slot2:getPosition()

	slot0.img_select:setPosition(cc.p(slot3, slot4))
	slot0:refreshChipsList()
end

function FruitTreasureChipBagView._onClickCloseBtn(slot0)
	uv0:openFruitTreasureChipBagView(false)
end

function FruitTreasureChipBagView.close_callback(slot0)
	if slot0.chips_scrollview then
		slot0.chips_scrollview:DeleteMe()

		slot0.chips_scrollview = nil
	end

	if slot0.del_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.del_goods_event)

		slot0.del_goods_event = nil
	end

	uv0:openFruitTreasureChipBagView(false)
end
