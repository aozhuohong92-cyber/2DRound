BackPackWindow = BackPackWindow or BaseClass(BaseView)
slot0 = table.insert
slot1 = table.remove
slot2 = table.sort
slot3 = BackpackController:getInstance()
slot4 = BackpackController:getInstance():getModel()
slot5 = Config.PartnerData.data_get_compound_info

function BackPackWindow.__init(slot0, slot1)
	slot0.is_full_screen = true
	slot0.layout_name = "backpack/backpack_window"
	slot0.cur_index = nil
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("backpack", "backpack"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_2", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "pattern/pattern_3"),
			type = ResourcesType.single
		}
	}
	slot0.item_render_list = {}
	slot0.tab_list = {}
	slot0.default_index = slot1 or BackPackConst.item_tab_type.PROPS
	slot0.min_size = 30
	slot0.col_size = 5
end

function BackPackWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_2", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.mainContainer = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.mainContainer, 1)

	slot0.titleImage = slot0.mainContainer:getChildByName("title_img")
	slot0.container = slot0.mainContainer:getChildByName("container")

	if slot0.container:getChildByName("Image_1_0") and PathTool.getPlistImgForDownLoad("bigbg", "pattern/pattern_3") ~= nil then
		createSprite(slot2, slot1:getContentSize().width / 2, 55, slot1, cc.p(0.5, 0.5), LOADTEXT_TYPE):setScaleY(1.5)
	end

	slot0.quick_sell_btn = slot0.container:getChildByName("quick_sell_btn")

	slot0.quick_sell_btn:getChildByName("label"):setString(TI18N("一键出售"))
	UITool.SetTitleColor(slot0.quick_sell_btn:getChildByName("label"))

	slot0.left_arrow = slot0.container:getChildByName("left_arrow")
	slot0.right_arrow = slot0.container:getChildByName("right_arrow")
	slot0.order_index_list = {
		{
			order = 1,
			index = BackPackConst.item_tab_type.EQUIPS
		},
		{
			order = 2,
			index = BackPackConst.item_tab_type.PROPS
		},
		{
			order = 3,
			index = BackPackConst.item_tab_type.HERO
		},
		{
			order = 4,
			index = BackPackConst.item_tab_type.SPECIAL
		},
		{
			order = 5,
			index = BackPackConst.item_tab_type.ELFIN
		},
		{
			order = 6,
			index = BackPackConst.item_tab_type.HOLYEQUIPMENT
		}
	}
	slot0.tableContainer = slot0.container:getChildByName("tab_container")
	slot3 = slot0.tableContainer:getContentSize()
	slot0.tab_scrollview = CommonScrollViewLayout.new(slot0.tableContainer, cc.p(40, 3), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot3.width - 80, slot3.height + 5), {
		start_y = 0,
		item_width = 128,
		start_x = 0,
		space_x = 5,
		row = 1,
		item_height = 84,
		space_y = 0,
		col = 0,
		item_class = CommonTabBtn
	})

	slot0.tab_scrollview:setData({
		{
			title = TI18N("装备"),
			index = BackPackConst.item_tab_type.EQUIPS
		},
		{
			title = TI18N("道具"),
			index = BackPackConst.item_tab_type.PROPS
		},
		{
			title = TI18N("碎片"),
			index = BackPackConst.item_tab_type.HERO
		},
		{
			title = TI18N("特殊"),
			index = BackPackConst.item_tab_type.SPECIAL
		},
		{
			title = TI18N("幽灵"),
			index = BackPackConst.item_tab_type.ELFIN
		},
		{
			title = TI18N("神装"),
			index = BackPackConst.item_tab_type.HOLYEQUIPMENT
		}
	}, handler(slot0, slot0.changeTabView), nil, {
		default_index = slot0.default_index or BackPackConst.item_tab_type.PROPS,
		tab_size = cc.size(128, 64),
		select_color = cc.c4b(255, 255, 255, 255),
		select_outline = cc.c4b(2, 0, 25, 255),
		normal_color = cc.c4b(248, 194, 60, 255),
		normal_outline = cc.c4b(2, 0, 25, 255),
		select_res = PathTool.getResFrame("backpack", "backpack_3"),
		normal_res = PathTool.getResFrame("backpack", "backpack_2"),
		img_rect = cc.rect(47, 40, 0, 0),
		tab_name = "tab_btn_"
	})
	slot0.tab_scrollview:addEndCallBack(function ()
		uv0.tab_list = uv0.tab_scrollview:getItemList()

		uv0:isCompRedPoint()
	end)

	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.container, cc.p(54, 85), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(620, 600), {
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

	if GuideController:getInstance():isInGuide() then
		slot0.item_scrollview:setClickEnabled(false)
		slot0.tab_scrollview:setClickEnabled(false)
	end

	slot0:createTitleEffect()
end

function BackPackWindow.createTitleEffect(slot0)
	if MAKELIFEBETTER == true then
		return
	end

	if slot0.title_effect then
		return
	end

	slot0.title_effect = createEffectSpine(PathTool.getEffectRes(640), cc.p(-122, -180), cc.p(0, 0), true)

	slot0.title_effect:setScale(1)
	slot0.titleImage:addChild(slot0.title_effect)
end

function BackPackWindow.register_event(slot0)
	registerButtonEventListener(slot0.quick_sell_btn, function ()
		if uv0.cur_index == BackPackConst.item_tab_type.HOLYEQUIPMENT then
			uv1:openQuickSellHolyWindow(true)
		elseif uv0.cur_index == BackPackConst.item_tab_type.EQUIPS then
			uv1:openQuickSellEquipWindow(true)
		elseif uv0.cur_index == BackPackConst.item_tab_type.SPECIAL then
			uv1:openHeroSpecialBreakWindow(true)
		elseif uv0.cur_index == BackPackConst.item_tab_type.HERO then
			HeroController:getInstance():openBreakChipWindow(true)
		end
	end, true)
	registerButtonEventListener(slot0.left_arrow, function ()
		uv0:onClickDirBtn(1)
	end, true)
	registerButtonEventListener(slot0.right_arrow, function ()
		uv0:onClickDirBtn(2)
	end, true)
	slot0:addGlobalEvent(BackpackEvent.GET_ALL_DATA, function (slot0)
		if not uv0:checkCodeToType(slot0) then
			return
		end

		uv0:setPanelData(false)
	end)
	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		if not uv0:checkCodeToType(slot0) then
			return
		end

		if slot1 == nil or next(slot1) == nil then
			return
		end

		slot2 = false

		for slot6, slot7 in pairs(slot1) do
			if slot7.config and slot7.config.sub_type == uv0.cur_index then
				slot2 = true

				break
			end
		end

		if slot2 == true then
			uv0:setPanelData(false)
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
		if not uv0:checkCodeToType(slot0) then
			return
		end

		if slot1 == nil or next(slot1) == nil then
			return
		end

		slot2 = false

		for slot6, slot7 in pairs(slot1) do
			if slot7.config and slot7.config.sub_type == uv0.cur_index then
				slot2 = true

				break
			end
		end

		if slot2 == true then
			uv0:setPanelData(false)
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
		if uv0.cur_index == 3 then
			uv0:isCompRedPoint()
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.Compose_BackPack_Success, function ()
		uv0:isCompRedPoint()
		uv0:setPanelData()
	end)
	slot0:addGlobalEvent(GuideEvent.Update_Guide_Status_Event, function (slot0)
		if slot0 then
			uv0.item_scrollview:setClickEnabled(false)
		else
			uv0.item_scrollview:setClickEnabled(true)
		end
	end)
end

function BackPackWindow.openRootWnd(slot0)
end

function BackPackWindow.isCompRedPoint(slot0)
	slot2 = false

	for slot6, slot7 in pairs(uv0:getAllBackPackArray(3)) do
		if slot7.quality ~= -1 and slot7.base_id then
			if uv1[slot7.base_id] and uv1[slot7.base_id].num <= slot7.quantity then
				slot2 = true

				break
			end

			if BackpackController:getModel():getHallowsCompData(slot7.base_id) and next(slot8) ~= nil and slot8.num <= slot7.quantity then
				slot2 = true

				break
			end
		end
	end

	if slot0.tab_list[3] then
		slot0.tab_list[3]:setRedStatus(slot2)
	end
end

function BackPackWindow.setEquipRedStatus(slot0, slot1)
end

function BackPackWindow.onClickDirBtn(slot0, slot1)
	if not slot0.cur_order then
		return
	end

	if not slot0.tab_scrollview then
		return
	end

	slot2 = nil

	if slot1 == 1 then
		if slot0.cur_order - 1 < 1 then
			slot2 = 1
		end
	elseif slot1 == 2 and slot0.cur_order + 1 > 6 then
		slot2 = 6
	end

	if slot2 >= 4 then
		slot0.tab_scrollview:scrollToPercentHorizontal(100, 0.3)
	else
		slot0.tab_scrollview:scrollToPercentHorizontal(0, 0.3)
	end

	if slot0.order_index_list[slot2] and slot0.tab_list[slot0.order_index_list[slot2].order] then
		slot0:changeTabView(slot0.tab_list[slot3])
	end
end

function BackPackWindow.changeTabView(slot0, slot1)
	if not slot1 or slot1.index == slot0.cur_index then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab:setBtnSelectStatus(false)
	end

	slot0.cur_tab = slot1
	slot0.cur_index = slot1.index
	slot5 = true

	slot0.cur_tab:setBtnSelectStatus(slot5)

	slot0.cur_order = 1

	for slot5, slot6 in pairs(slot0.order_index_list) do
		if slot6.index == slot1.index then
			slot0.cur_order = slot6.order

			break
		end
	end

	slot0:setPanelData(true)
end

function BackPackWindow.setPanelData(slot0)
	if slot0.cur_index == BackPackConst.item_tab_type.OTHERS then
		slot0.cur_index = BackPackConst.item_tab_type.EQUIPS
	end

	slot0.min_size = tableLen(uv0:getAllBackPackArray(slot0.cur_index, true))

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

	slot4 = false
	slot5 = nil

	if slot0.cur_index == BackPackConst.item_tab_type.EQUIPS then
		if Config.PackageData.data_backpack_cost.open_lev and slot7.val <= RoleController:getInstance():getRoleVo().lev then
			slot4 = true
		end

		slot5 = SortTools.tableUpperSorter({
			"quality",
			"sort"
		})
	elseif slot0.cur_index == BackPackConst.item_tab_type.PROPS then
		slot5 = SortTools.tableUpperSorter({
			"quality",
			"sort",
			"base_id"
		})
	elseif slot0.cur_index == BackPackConst.item_tab_type.HERO then
		slot5 = slot0:getHeroSorFunc()
		slot4 = true

		MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.backpack, false)
	elseif slot0.cur_index == BackPackConst.item_tab_type.SPECIAL then
		slot4 = true

		function slot5(slot0, slot1)
			return slot1.quality < slot0.quality
		end
	elseif slot0.cur_index == BackPackConst.item_tab_type.HOLYEQUIPMENT then
		slot4 = true
		slot5 = SortTools.tableCommonSorter({
			{
				"eqm_star",
				true
			},
			{
				"eqm_jie",
				true
			},
			{
				"eqm_set",
				false
			},
			{
				"sort",
				true
			},
			{
				"base_id",
				true
			}
		})
	elseif slot0.cur_index == BackPackConst.item_tab_type.ELFIN then
		slot5 = SortTools.tableUpperSorter({
			"quality",
			"sort",
			"base_id"
		})
	else
		return
	end

	uv2(slot1, slot5)

	if slot0.cur_index == BackPackConst.item_tab_type.HERO then
		slot0.item_scrollview:setSpace(30, true)
	else
		slot0.item_scrollview:setSpace(10)

		slot6.is_comp_num = false
	end

	slot0.item_scrollview:setData(slot1, function (slot0, slot1)
		uv0:selectedItem(slot0)
	end, nil, {
		red_point = true,
		showCheckBox = true,
		is_other = false,
		show_use_target = true,
		is_comp_num = true
	})
	slot0.quick_sell_btn:setVisible(slot4)

	if slot0.cur_index == BackPackConst.item_tab_type.HERO then
		slot0.quick_sell_btn:getChildByName("label"):setString(TI18N("碎片分解"))
	elseif slot0.cur_index == BackPackConst.item_tab_type.SPECIAL then
		slot0.quick_sell_btn:getChildByName("label"):setString("战技分解")
	else
		slot0.quick_sell_btn:getChildByName("label"):setString(TI18N("一键出售"))
	end
end

function BackPackWindow.getHeroSorFunc(slot0)
	function slot1(slot0)
		slot1 = false

		if slot0.quality ~= -1 and slot0.base_id and uv0[slot0.base_id] and uv0[slot0.base_id].num <= slot0.quantity then
			slot1 = true
		end

		return slot1
	end

	return function (slot0, slot1)
		if uv0(slot0) and not uv0(slot1) then
			return true
		elseif not uv0(slot0) and uv0(slot1) then
			return false
		elseif slot0.quality ~= -1 and slot0.base_id and slot1.quality ~= -1 and slot1.base_id then
			if slot0.quality == slot1.quality then
				return slot0.base_id < slot1.base_id
			else
				return slot1.quality < slot0.quality
			end
		elseif slot0.quality ~= -1 and slot0.base_id and slot1.quality == -1 then
			return true
		elseif slot0.quality == -1 and slot1.quality ~= -1 and slot1.base_id then
			return false
		else
			return false
		end
	end
end

function BackPackWindow.selectedItem(slot0, slot1, slot2)
	if slot1 and slot1:getData() then
		if slot1:getData() == nil or slot3.config == nil or slot3.config.type == nil then
			return
		end

		if BackPackConst.checkIsEquip(slot3.config.type) then
			HeroController:getInstance():openEquipTips(true, slot3, PartnerConst.EqmTips.backpack)
		elseif BackPackConst.checkIsHeroSkin(slot3.config.type) then
			HeroController:getInstance():openHeroSkinTipsPanel(true, slot3, PartnerConst.EqmTips.backpack)
		elseif slot3.config.type == BackPackConst.item_type.ARTIFACTCHIPS then
			HeroController:getInstance():openArtifactTipsWindow(true, slot3, PartnerConst.ArtifactTips.backpack)
		elseif slot3.sub_type == 3 then
			TipsManager:getInstance():showBackPackCompTips(true, slot3.base_id)
		elseif BackPackConst.checkIsElfin(slot3.config.type) then
			TipsManager:getInstance():showElfinTips(slot3.config.id, true)
		else
			TipsManager:getInstance():showGoodsTips(slot3, true)
		end
	end
end

function BackPackWindow.close_callback(slot0)
	uv0:openMainView(false, slot0.cur_index)
	TipsManager:getInstance():showCompChooseTips(false)

	if slot0.tab_scrollview then
		slot0.tab_scrollview:DeleteMe()

		slot0.tab_scrollview = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end
end

function BackPackWindow.checkCodeToType(slot0, slot1)
	if slot0.cur_index == nil then
		return false
	end

	if slot0.cur_index == BackPackConst.item_tab_type.EQUIPS or slot0.cur_index == BackPackConst.item_tab_type.HOLYEQUIPMENT then
		if slot1 ~= BackPackConst.Bag_Code.EQUIPS then
			return false
		end
	elseif slot1 == BackPackConst.Bag_Code.EQUIPS then
		return false
	end

	return true
end
