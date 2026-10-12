HeroHolyEquipClothPanel = HeroHolyEquipClothPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = math.floor
slot5 = string.format

function HeroHolyEquipClothPanel.__init(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.is_full_screen = false
	slot0.layout_name = "hero/hero_holy_equip_cloth_panel"
	slot0.enter_type = slot5 or HeroConst.EnterType.eOhter
	slot0.holy_data = slot4
	slot0.cloth_data = slot3 or {}
	slot0.empty_res = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3")
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("stronger", "stronger"),
			type = ResourcesType.plist
		},
		{
			path = slot0.empty_res,
			type = ResourcesType.single
		}
	}
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_init = true
	slot0.click_pos = slot1 or BackPackConst.item_type.GOD_EARRING
	slot0.click_partner = slot2 or 0
	slot0.hero_vo = slot6
	slot0.equip_list = slot7
	slot0.is_put_off = false
	slot0.cur_hero_item_list = {}
end

function HeroHolyEquipClothPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 1)
	slot0.main_panel:getChildByName("wnd_title"):setString(TI18N("神装更换"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.cur_panel = slot0.main_panel:getChildByName("cur_panel")
	slot0.plan_list = slot0.main_panel:getChildByName("plan_list")
	slot0.name_lab = slot0.main_panel:getChildByName("name_lab")
	slot0.zone_btn_1 = slot0.main_panel:getChildByName("zone_btn_1")
	slot0.zone_name_1 = slot0.zone_btn_1:getChildByName("zone_name")
	slot0.zone_btn_2 = slot0.main_panel:getChildByName("zone_btn_2")
	slot0.zone_name_2 = slot0.zone_btn_2:getChildByName("zone_name")
	slot0.filter_panel = slot0.main_panel:getChildByName("filter_panel")

	slot0.filter_panel:setSwallowTouches(false)
	slot0.filter_panel:setVisible(false)

	slot0.combobox_panel = slot0.main_panel:getChildByName("combobox_panel")

	slot0.combobox_panel:setVisible(false)

	slot0.combobox_bg = slot0.combobox_panel:getChildByName("bg")
	slot0.combobox_bg_size = slot0.combobox_bg:getContentSize()
	slot0.combobox_max_size = cc.size(200, 300)
	slot0.combobox_panel2 = slot0.main_panel:getChildByName("combobox_panel2")

	slot0.combobox_panel2:setVisible(false)

	slot0.combobox_bg2 = slot0.combobox_panel2:getChildByName("bg")
	slot0.combobox_bg_size2 = slot0.combobox_bg:getContentSize()
	slot0.combobox_max_size2 = cc.size(230, 300)
end

function HeroHolyEquipClothPanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHeroHolyEquipClothPanel(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHeroHolyEquipClothPanel(false)
	end, false, 2)
	registerButtonEventListener(slot0.filter_panel, function ()
		uv0.filter_panel:setVisible(false)
		uv0.combobox_panel:setVisible(false)
		uv0.combobox_panel2:setVisible(false)
	end, false, 2)
	registerButtonEventListener(slot0.zone_btn_1, function ()
		uv0:onZoneBtn1()
	end, false, 2)
	registerButtonEventListener(slot0.zone_btn_2, function ()
		uv0:onZoneBtn2()
	end, false, 2)
	slot0:addGlobalEvent(HeroEvent.Del_Hero_Event, function (slot0)
		if uv0.click_partner then
			for slot4, slot5 in ipairs(slot0) do
				if uv0.click_partner == slot5.partner_id then
					uv1:openHeroHolyEquipClothPanel(false)
				end
			end
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Get_Holy_Equipment_Event, function (slot0)
		if not slot0 or not uv0.hero_vo then
			return
		end

		for slot4, slot5 in ipairs(slot0) do
			if slot5.partner_id == uv0.hero_vo.partner_id then
				uv0:updateCurHeroHolyItemList()
				uv0:updateEquipList()
			end
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Holy_Equipment_Update_Event, function (slot0)
		if not slot0 or not uv0.hero_vo then
			return
		end

		if slot0.partner_id == uv0.hero_vo.partner_id then
			uv0:updateCurHeroHolyItemList()

			uv0.total_show_list = nil

			uv0:updateEquipList()
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Get_Holy_Equipment_Plan_Event, function (slot0)
		if not slot0 then
			return
		end

		uv1:updateHolyPlanList(uv0:getHolyEquipmentPlanData())
	end)
end

function HeroHolyEquipClothPanel.onZoneBtn1(slot0)
	if not slot0.show_list then
		return
	end

	slot0.filter_panel:setVisible(true)
	slot0.combobox_panel:setVisible(false)
	slot0.combobox_panel2:setVisible(true)
	slot0:updateComboboxList2(slot0.dic_suit_list)
end

function HeroHolyEquipClothPanel.onZoneBtn2(slot0)
	if not slot0.show_list then
		return
	end

	slot0.filter_panel:setVisible(true)
	slot0.combobox_panel:setVisible(true)
	slot0.combobox_panel2:setVisible(false)
	slot0:updateComboboxList1(slot0.dic_star_list)
end

function HeroHolyEquipClothPanel.updateComboboxList1(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot0.combobox_scrollview == nil then
		slot0.combobox_scrollview = CommonScrollViewSingleLayout.new(slot0.combobox_panel, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.combobox_max_size, {
			start_y = 0,
			once_num = 1,
			start_x = 2,
			row = 1,
			delay = 1,
			space_x = 0,
			item_width = 200,
			space_y = 0,
			col = 1,
			item_height = 55
		}, cc.p(0, 0))

		slot0.combobox_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCellCombobox), ScrollViewFuncType.CreateNewCell)
		slot0.combobox_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCellsCombobox), ScrollViewFuncType.NumberOfCells)
		slot0.combobox_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndexCombobox), ScrollViewFuncType.UpdateCellByIndex)
	end

	if next(slot1) ~= nil then
		if #slot1 > 5 then
			slot0.combobox_scrollview:setClickEnabled(true)
			slot0.combobox_bg:setContentSize(slot0.combobox_bg_size)
		else
			slot0.combobox_scrollview:setClickEnabled(false)
			slot0.combobox_bg:setContentSize(cc.size(slot0.combobox_bg_size.width, slot4 * slot3 + slot0.combobox_bg_size.height - slot0.combobox_max_size.height))
		end

		slot0.comboboxshow_list = slot1

		slot0.combobox_scrollview:reloadData(nil)
	end
end

function HeroHolyEquipClothPanel.createNewCellCombobox(slot0, slot1, slot2)
	slot3 = ccui.Layout:create()

	slot3:setAnchorPoint(0.5, 0.5)
	slot3:setContentSize(cc.size(slot1, slot2))

	slot3.root_wnd = createCSBNote(PathTool.getTargetCSB("hero/hero_holy_equip_filter_item"))

	slot3:addChild(slot3.root_wnd)

	slot4 = slot3.root_wnd:getChildByName("container")
	slot3.name = slot4:getChildByName("name")
	slot3.checkbox = slot4:getChildByName("checkbox")

	slot3.checkbox:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.check_box_status = uv0.checkbox:isSelected()
		elseif slot1 == ccui.TouchEventType.ended then
			uv1:setCellTouchedCombobox(uv0)
		elseif slot1 == ccui.TouchEventType.canceled then
			uv0.checkbox:setSelected(uv0.check_box_status or false)
		end
	end)

	return slot3
end

function HeroHolyEquipClothPanel.numberOfCellsCombobox(slot0)
	if not slot0.comboboxshow_list then
		return 0
	end

	return #slot0.comboboxshow_list
end

function HeroHolyEquipClothPanel.updateCellByIndexCombobox(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.comboboxshow_list[slot2] then
		return
	end

	slot1.name:setString(slot3.name)

	if slot3.is_select then
		slot1.checkbox:setSelected(true)
	else
		slot1.checkbox:setSelected(false)
	end
end

function HeroHolyEquipClothPanel.setCellTouchedCombobox(slot0, slot1)
	if not slot0.comboboxshow_list[slot1.index] then
		return
	end

	if slot3.is_select == true then
		slot1.checkbox:setSelected(true)

		return
	end

	for slot7, slot8 in ipairs(slot0.comboboxshow_list) do
		slot8.is_select = false
	end

	slot3.is_select = slot1.checkbox:isSelected()

	slot0.combobox_scrollview:resetCurrentItems()

	if slot0.zone_name_2 then
		slot0.zone_name_2:setString(slot3.name)
	end

	slot0:updateEquipList()
end

function HeroHolyEquipClothPanel.updateComboboxList2(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot0.combobox_scrollview2 == nil then
		slot0.combobox_scrollview2 = CommonScrollViewSingleLayout.new(slot0.combobox_panel2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.combobox_max_size2, {
			start_y = 0,
			once_num = 1,
			start_x = 2,
			row = 1,
			delay = 1,
			space_x = 0,
			item_width = 230,
			space_y = 0,
			col = 1,
			item_height = 55
		}, cc.p(0, 0))

		slot0.combobox_scrollview2:registerScriptHandlerSingle(handler(slot0, slot0.createNewCellCombobox2), ScrollViewFuncType.CreateNewCell)
		slot0.combobox_scrollview2:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCellsCombobox2), ScrollViewFuncType.NumberOfCells)
		slot0.combobox_scrollview2:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndexCombobox2), ScrollViewFuncType.UpdateCellByIndex)
	end

	if next(slot1) ~= nil then
		if #slot1 > 5 then
			slot0.combobox_scrollview2:setClickEnabled(true)
			slot0.combobox_bg:setContentSize(slot0.combobox_bg_size)
		else
			slot0.combobox_scrollview2:setClickEnabled(false)
			slot0.combobox_bg:setContentSize(cc.size(slot0.combobox_bg_size.width, slot4 * slot3 + slot0.combobox_bg_size.height - slot0.combobox_max_size.height))
		end

		slot0.comboboxshow_list2 = slot1

		slot0.combobox_scrollview2:reloadData(nil)
	end
end

function HeroHolyEquipClothPanel.createNewCellCombobox2(slot0, slot1, slot2)
	slot3 = ccui.Layout:create()

	slot3:setAnchorPoint(0.5, 0.5)
	slot3:setContentSize(cc.size(slot1, slot2))

	slot3.root_wnd = createCSBNote(PathTool.getTargetCSB("hero/hero_holy_equip_filter_item2"))

	slot3:addChild(slot3.root_wnd)

	slot4 = slot3.root_wnd:getChildByName("container")
	slot3.name = slot4:getChildByName("name")
	slot3.checkbox = slot4:getChildByName("checkbox")

	slot3.checkbox:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.check_box_status = uv0.checkbox:isSelected()
		elseif slot1 == ccui.TouchEventType.ended then
			uv1:setCellTouchedCombobox2(uv0)
		elseif slot1 == ccui.TouchEventType.canceled then
			uv0.checkbox:setSelected(uv0.check_box_status or false)
		end
	end)

	return slot3
end

function HeroHolyEquipClothPanel.numberOfCellsCombobox2(slot0)
	if not slot0.comboboxshow_list2 then
		return 0
	end

	return #slot0.comboboxshow_list2
end

function HeroHolyEquipClothPanel.updateCellByIndexCombobox2(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.comboboxshow_list2[slot2] then
		return
	end

	slot1.name:setString(slot3.name)

	if slot3.is_select then
		slot1.checkbox:setSelected(true)
	else
		slot1.checkbox:setSelected(false)
	end
end

function HeroHolyEquipClothPanel.setCellTouchedCombobox2(slot0, slot1)
	if not slot0.comboboxshow_list2[slot1.index] then
		return
	end

	if slot3.is_select == true then
		slot1.checkbox:setSelected(true)

		return
	end

	slot3.is_select = slot1.checkbox:isSelected()

	for slot8, slot9 in ipairs(slot0.comboboxshow_list2) do
		slot9.is_select = false
	end

	slot3.is_select = slot1.checkbox:isSelected()

	slot0.combobox_scrollview2:resetCurrentItems()

	if slot0.zone_name_1 then
		slot0.zone_name_1:setString(slot3.name)
	end

	slot0:updateEquipList()
end

function HeroHolyEquipClothPanel.updateHolyPlanList(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.plan_data = {}

	for slot7 = 1, uv0.holy_equip_plan_count do
		if slot1[Config.PartnerHolyEqmData.data_holy_suit_manage[slot7].id] then
			slot0.plan_data[slot7] = slot1[slot8.id]
			slot0.plan_data[slot7].equip_list = slot0:getEquipList(slot0.plan_data[slot7].list)
		else
			slot0.plan_data[slot7] = {
				name = uv1(TI18N("方案%s"), slot7),
				id = slot8.id
			}
		end

		slot0.plan_data[slot7].config = slot8
		slot0.plan_data[slot7].is_open = 1
	end

	if slot2 < Config.PartnerHolyEqmData.data_holy_suit_manage_length then
		uv2(slot0.plan_data, slot3[slot2 + 1])
	end

	slot7 = SortTools.KeyLowerSorter

	uv3(slot0.plan_data, slot7("id"))

	for slot7, slot8 in pairs(slot0.plan_data) do
		if slot0.holy_data and slot0.holy_data.id == slot8.id then
			slot0.holy_data = slot8
			slot0.equip_list = slot8.equip_list

			break
		end
	end

	slot0:updateCurHeroHolyItemList()
	slot0:updateEquipList()
end

function HeroHolyEquipClothPanel.getEquipList(slot0, slot1)
	if not slot1 then
		return
	end

	if #slot1 == 0 then
		return {}
	end

	for slot6, slot7 in ipairs(slot1) do
		if slot7.item_id then
			slot8 = nil

			if (slot7.partner_id ~= 0 or BackpackController:getModel():getBagItemById(BackPackConst.Bag_Code.EQUIPS, slot7.item_id)) and uv0:getHolyEquipById(slot7.item_id) and slot8.config then
				-- Nothing
			end
		end
	end

	return {
		[slot8.config.type] = slot8
	}
end

function HeroHolyEquipClothPanel.initCurHeroHolyInfo(slot0)
	slot1 = TI18N("当前配置")

	if slot0.holy_data and slot0.holy_data.name then
		slot1 = slot0.holy_data.name
	end

	slot0.name_lab:setString(slot1)

	if not slot0.cur_hero_head then
		slot0.cur_hero_head = HeroExhibitionItem.new(1, true, 0, false)

		slot0.cur_hero_head:setPosition(cc.p(530, 220))
		slot0.cur_panel:addChild(slot0.cur_hero_head)
	end

	if slot0.hero_vo then
		slot0.cur_hero_head:setData(slot0.hero_vo)
		slot0.cur_hero_head:showStrTips(false)
	else
		slot0.cur_hero_head:showStrTips(true, TI18N("无英雄"), nil, 22)
	end

	slot2 = 80

	for slot6, slot7 in ipairs(HeroConst.HolyequipmentPosList) do
		if not slot0.cur_hero_item_list[slot7] then
			slot8 = BackPackItem.new(false, true, nil, 1, false)

			slot8:addCallBack(function ()
				uv0:selectHolyByIndex(uv1, uv2)
			end)
			slot0.cur_panel:addChild(slot8)

			slot8.empty_icon = createImage(slot8:getRoot(), PathTool.getResFrame("hero", HeroConst.HolyEmptyIconName[slot7]), 60, 60, cc.p(0.5, 0.5), true, 10, false)
			slot0.cur_hero_item_list[slot7] = slot8
		end

		slot8:setPosition(cc.p(slot2 + (slot6 - 1) * (BackPackItem.Width + 29), 67.5))
	end

	if not slot0.holy_tips_label then
		slot0.holy_tips_label = createRichLabel(22, cc.c4b(149, 83, 34, 255), cc.p(0, 1), cc.p(20, 230), 10, nil, 600)

		slot0.cur_panel:addChild(slot0.holy_tips_label)
	end

	slot0:updateCurHeroHolyItemList()
end

function HeroHolyEquipClothPanel.selectHolyByIndex(slot0, slot1, slot2)
	if slot1.is_ui_select == true then
		return
	end

	if slot0.cur_hero_item then
		slot0.cur_hero_item.is_ui_select = false

		slot0.cur_hero_item:setBoxSelected(false)
	end

	slot1.is_ui_select = true

	slot1:setBoxSelected(true)

	slot0.cur_hero_item = slot1
	slot0.click_pos = slot2
	slot0.cloth_data = slot0.cur_hero_item.equip_vo or {}
	slot0.total_show_list = slot0:initEquipData()

	slot0:updateEquipList()
end

function HeroHolyEquipClothPanel.updateCurHeroHolyItemList(slot0)
	slot1 = {}

	if slot0.hero_vo then
		slot1 = uv0:getHeroHolyEquipList(slot0.hero_vo.partner_id)
	elseif slot0.equip_list then
		slot1 = slot0.equip_list
	end

	for slot5, slot6 in ipairs(HeroConst.HolyequipmentPosList) do
		slot8 = slot0.cur_hero_item_list[slot6]

		if slot1[slot6] then
			slot8:setData(slot7)

			if slot8.empty_icon then
				slot8.empty_icon:setVisible(false)
			end

			slot8.equip_vo = slot7
		else
			slot8:setData()

			if slot8.empty_icon then
				slot8.empty_icon:setVisible(true)
			end

			slot8.equip_vo = nil
		end

		slot8.is_ui_select = false

		if slot0.cloth_data and slot6 == slot0.cloth_data.type or slot0.click_pos == slot6 then
			slot8.is_ui_select = true
			slot0.cur_hero_item = slot8
			slot0.cloth_data = slot0.cur_hero_item.equip_vo or {}
		end

		slot8:setBoxSelected(slot8.is_ui_select)
	end

	if slot0.holy_tips_label then
		if next(uv0:getHolyEquipSuitDes(slot1)) ~= nil then
			for slot7, slot8 in ipairs(slot2) do
				slot3 = "" .. uv1("<img src='%s' scale=0.8 /> %s\n", slot8.icon_res, slot8.name)
			end

			slot0.holy_tips_label:setString(slot3)
		else
			slot0.holy_tips_label:setString(TI18N("暂无组合套装"))
		end
	end
end

function HeroHolyEquipClothPanel.showEmptyIcon(slot0, slot1)
	if not slot0.empty_con and slot1 == false then
		return
	end

	if not slot0.empty_con then
		slot2 = cc.size(200, 200)
		slot0.empty_con = ccui.Widget:create()

		slot0.empty_con:setContentSize(slot2)
		slot0.empty_con:setPosition(cc.p(310, 220))
		slot0.plan_list:addChild(slot0.empty_con, 100)

		slot3 = createImage(slot0.empty_con, slot0.empty_res, slot2.width / 2, slot2.height / 2, cc.p(0.5, 0.5), false)
		slot0.empty_label = createLabel(24, cc.c4b(118, 69, 25, 255), nil, slot2.width / 2, -10, "", slot0.empty_con, 0, cc.p(0.5, 0))
	end

	slot0.empty_label:setString(TI18N("背包中无可穿戴装备"))
	slot0.empty_con:setVisible(slot1)
end

function HeroHolyEquipClothPanel.openRootWnd(slot0)
	slot0:initCurHeroHolyInfo()
	slot0:updateStarFilterList()
	slot0:updateSuitFilterList()
	slot0:updateEquipList(true)
end

function HeroHolyEquipClothPanel.updateStarFilterList(slot0)
	if slot0.dic_star_list == nil then
		slot0.dic_star_list = {}

		for slot5 = 1, 5 + 1 do
			slot0.dic_star_list[slot5] = {
				eqm_star = slot5 - 1
			}

			if slot5 == 1 then
				slot0.dic_star_list[slot5].name = TI18N("全部神装")
				slot0.dic_star_list[slot5].is_select = true
			else
				slot0.dic_star_list[slot5].name = uv0(TI18N("%s星神装"), slot5 - 1)
				slot0.dic_star_list[slot5].is_select = false
			end
		end
	else
		for slot4, slot5 in ipairs(slot0.dic_star_list) do
			if slot4 == 1 then
				slot5.is_select = true
			else
				slot5.is_select = false
			end
		end
	end

	if slot0.zone_name_2 then
		slot0.zone_name_2:setString(slot0.dic_star_list[1].name)
	end
end

function HeroHolyEquipClothPanel.updateSuitFilterList(slot0)
	if slot0.dic_suit_list == nil then
		slot0.dic_suit_list = {}

		for slot5, slot6 in pairs(Config.PartnerHolyEqmData.data_suit_res_prefix) do
			uv0(slot0.dic_suit_list, {
				id = slot6.id,
				name = slot6.name,
				is_select = false
			})
		end

		uv0(slot0.dic_suit_list, {
			id = 0,
			name = TI18N("全部套装"),
			is_select = true
		})
		uv1(slot0.dic_suit_list, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
	else
		for slot4, slot5 in ipairs(slot0.dic_suit_list) do
			if slot5.id == 0 then
				slot5.is_select = true
			else
				slot5.is_select = false
			end
		end
	end

	if slot0.zone_name_1 then
		slot0.zone_name_1:setString(slot0.dic_suit_list[1].name)
	end
end

function HeroHolyEquipClothPanel.initEquipData(slot0)
	slot1 = slot0.click_pos or BackPackConst.item_type.GOD_EARRING

	if slot0.cloth_data and next(slot0.cloth_data) ~= nil then
		uv0({}, {
			open_type = 2,
			sort = 1,
			data = slot0.cloth_data,
			eqm_set = slot0.cloth_data.config.eqm_set,
			eqm_star = slot0.cloth_data.eqm_star
		})
	end

	for slot7, slot8 in pairs(BackpackController:getInstance():getModel():getBagItemList(BackPackConst.Bag_Code.EQUIPS) or {}) do
		if slot8 and slot8.config and slot8.config.type and slot1 == slot8.config.type and slot0.cloth_data and slot0.cloth_data.id ~= slot8.id then
			uv0(slot2, {
				open_type = 1,
				sort = 0,
				data = slot8,
				eqm_set = slot8.config.eqm_set,
				eqm_star = slot8.eqm_star,
				eqm_jie = slot8.eqm_jie,
				base_id = slot8.base_id
			})
		end
	end

	if slot0.holy_data and next(slot0.holy_data) ~= nil and BackPackConst.checkIsHolyEquipment(slot1) then
		for slot8, slot9 in pairs(uv1:getAllHeroHolyEquipList()) do
			if slot9.config and slot9.config.type and slot1 == slot9.config.type and slot0.cloth_data and slot0.cloth_data.id ~= slot9.id then
				uv0(slot2, {
					open_type = 1,
					sort = 0,
					data = slot9,
					eqm_set = slot9.config.eqm_set,
					eqm_star = slot9.eqm_star,
					eqm_jie = slot9.eqm_jie,
					base_id = slot9.base_id
				})
			end
		end
	end

	return slot2
end

function HeroHolyEquipClothPanel.filterCondition(slot0)
	slot1 = slot0.total_show_list or {}
	slot2 = {}
	slot3 = false

	if slot0.dic_star_list then
		for slot7, slot8 in ipairs(slot0.dic_star_list) do
			if slot7 == 1 and slot8.is_select then
				slot3 = true

				break
			elseif slot8.is_select then
				slot2[slot8.eqm_star] = true
			end
		end
	end

	if not slot3 then
		slot4 = {}

		for slot8, slot9 in ipairs(slot1) do
			if slot9.sort == 1 or slot9.eqm_star and slot2[slot9.eqm_star] then
				uv0(slot4, slot9)
			end
		end

		slot1 = slot4
	end

	slot4 = {}
	slot3 = false

	if slot0.dic_suit_list then
		for slot8, slot9 in ipairs(slot0.dic_suit_list) do
			if slot9.id == 0 and slot9.is_select then
				slot3 = true

				break
			elseif slot9.is_select then
				slot4[slot9.id] = true
			end
		end
	end

	if not slot3 then
		slot5 = {}

		for slot9, slot10 in ipairs(slot1) do
			if slot10.sort == 1 or slot10.eqm_set then
				if slot10.sort == 1 or slot4[uv1(slot10.eqm_set / 100)] then
					uv0(slot5, slot10)
				end
			end
		end

		slot1 = slot5
	end

	return slot1
end

function HeroHolyEquipClothPanel.updateEquipList(slot0, slot1)
	if slot0.list_view == nil then
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.plan_list, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.plan_list:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 595,
			item_height = 141,
			space_y = 2,
			col = 1
		})

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end

	if slot0.total_show_list == nil then
		slot0.total_show_list = slot0:initEquipData()
	end

	if slot1 then
		slot0.show_list = slot0.total_show_list
	else
		slot0.show_list = slot0:filterCondition()
	end

	if slot0.show_list == nil then
		return
	end

	if #slot0.show_list > 0 then
		uv0(slot0.show_list, SortTools.tableUpperSorter({
			"sort",
			"eqm_star",
			"eqm_jie",
			"base_id"
		}))
	end

	if next(slot0.show_list) == nil then
		slot0:showEmptyIcon(true)
	else
		slot0:showEmptyIcon(false)
	end

	slot0.list_view:reloadData()
end

function HeroHolyEquipClothPanel.createNewCell(slot0, slot1, slot2)
	slot3 = EquipClothItem2.new()

	slot3:setExtendData({
		my_equip_score = slot0.cloth_data.all_score,
		enter_type = slot0.enter_type
	})
	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function HeroHolyEquipClothPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function HeroHolyEquipClothPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function HeroHolyEquipClothPanel.onCellTouched(slot0, slot1)
	slot0:clickFun(slot0.show_list[slot1.index])
end

function HeroHolyEquipClothPanel.clickFun(slot0, slot1)
	if not slot1 or not slot1.data then
		return
	end

	slot2 = slot1.data

	if slot0.holy_data and next(slot0.holy_data) ~= nil and BackPackConst.checkIsHolyEquipment(slot0.click_pos) then
		slot3 = slot0.holy_data.partner_id or 0

		if slot1.open_type and slot1.open_type == 2 then
			slot4 = {}

			if slot0.holy_data.list and next(slot0.holy_data.list) ~= 0 then
				for slot8, slot9 in ipairs(slot0.holy_data.list) do
					if slot9 and slot9.item_id then
						table.insert(slot4, {
							partner_id = slot9.partner_id,
							item_id = slot9.item_id
						})
					end
				end
			end

			for slot8 = #slot4, 1, -1 do
				if slot4[slot8] and slot4[slot8].item_id == slot2.id then
					table.remove(slot4, slot8)
				end
			end

			uv0:sender25221(slot0.holy_data.id, slot3, slot0.holy_data.name, slot4)
		else
			slot4, slot5 = uv1:checkHolyEquipmentPalnByItemID(slot2.id)

			if slot4 and not SysEnv:getInstance():getBool(SysEnv.keys.holy_plan_save_tip, false) then
				slot7 = {
					id = slot0.holy_data.id,
					name = slot0.holy_data.name,
					partner_id = slot3,
					item_list = {},
					equip_list = slot0.holy_data.equip_list,
					select_vo = slot2
				}

				for slot13, slot14 in pairs(slot5.list) do
					if slot14 and slot2.id == slot14.item_id then
						uv2(slot7.item_list, (uv1:getHolyEquipById(slot2.id) or BackpackController:getModel():getBagItemById(BackPackConst.Bag_Code.EQUIPS, slot2.id)).config.type, {
							item_vo = slot8,
							name = slot5.name
						})
					end
				end

				if slot7 and next(slot7.item_list) ~= nil then
					uv0:openHolyequipmentSaveTips(true, slot7)
				end
			else
				slot7 = true
				slot8 = {}

				if slot0.holy_data.equip_list then
					for slot12, slot13 in pairs(slot0.holy_data.equip_list) do
						slot14 = 0

						if slot2.config.type == slot12 then
							if uv1.dic_itemid_to_partner_id[slot2.id] then
								slot14 = uv1.dic_itemid_to_partner_id[slot2.id]
							end

							table.insert(slot8, {
								partner_id = slot14,
								item_id = slot2.id
							})

							slot7 = false
						else
							if uv1.dic_itemid_to_partner_id[slot13.id] then
								slot14 = uv1.dic_itemid_to_partner_id[slot13.id]
							end

							table.insert(slot8, {
								partner_id = slot14,
								item_id = slot13.id
							})
						end
					end
				end

				if slot7 then
					slot9 = 0

					if uv1.dic_itemid_to_partner_id[slot2.id] then
						slot9 = uv1.dic_itemid_to_partner_id[slot2.id]
					end

					table.insert(slot8, {
						partner_id = slot9,
						item_id = slot2.id
					})
				end

				uv0:sender25221(slot0.holy_data.id, slot3, slot0.holy_data.name, slot8)
			end
		end
	elseif slot1.open_type and slot1.open_type == 2 then
		uv0:sender11093(slot0.click_partner, slot2.id, 0)
	else
		uv0:sender11093(slot0.click_partner, slot2.id, 1)
	end
end

function HeroHolyEquipClothPanel.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.cur_hero_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.cur_hero_head then
		slot0.cur_hero_head:DeleteMe()

		slot0.cur_hero_head = nil
	end

	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.combobox_scrollview then
		slot0.combobox_scrollview:DeleteMe()

		slot0.combobox_scrollview = nil
	end

	if slot0.combobox_scrollview2 then
		slot0.combobox_scrollview2:DeleteMe()

		slot0.combobox_scrollview2 = nil
	end

	uv0:openHeroHolyEquipClothPanel(false)
end

EquipClothItem2 = class("EquipClothItem2", function ()
	return ccui.Widget:create()
end)

function EquipClothItem2.ctor(slot0, slot1)
	slot0.open_type = slot1 or 1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function EquipClothItem2.setExtendData(slot0, slot1)
	slot0.my_equip_score = slot1.my_equip_score or 0
	slot0.enter_type = slot1.enter_type
end

function EquipClothItem2.config(slot0)
	slot0.size = cc.size(595, 141)

	slot0:setContentSize(slot0.size)

	slot0.attr_list = {}
	slot0.star_list = {}
end

function EquipClothItem2.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_holy_equip_cloth_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.equip_item = BackPackItem.new(false, true)

	slot0.equip_item:setPosition(cc.p(70, slot0.size.height / 2))
	slot0.main_panel:addChild(slot0.equip_item)
	slot0.equip_item:addCallBack(function ()
		uv0:openEquipTips(true, uv1.data, PartnerConst.EqmTips.other)
	end)

	slot0.bg = slot0.main_panel:getChildByName("bg")
	slot0.cloth_btn = slot0.main_panel:getChildByName("lev_btn")

	slot0.cloth_btn:setTitleText(TI18N("穿戴"))

	slot0.cloth_title = slot0.cloth_btn:getTitleRenderer()
	slot0.equip_name = createLabel(24, cc.c4b(144, 93, 56, 255), nil, 146, 98, "", slot0.main_panel, 0, cc.p(0, 0))
	slot0.plan_eqm_name = createRichLabel(22, cc.c4b(217, 80, 20, 255), cc.p(0.5, 0.5), cc.p(526, 118), nil, nil, 380)

	slot0.main_panel:addChild(slot0.plan_eqm_name)
end

function EquipClothItem2.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot1.data or not slot1.data.config then
		return
	end

	if slot0.index then
		slot0.cloth_btn:setName("guildsign_equip_list_item_" .. slot0.index)
	end

	slot0.open_type = slot1.open_type or 1
	slot2 = PathTool.getResFrame("common", "common_1029")

	slot0.cloth_btn:setBright(true)
	slot0.cloth_title:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.cloth_btn:setTitleText(TI18N("穿戴"))

	if slot0.open_type == 2 then
		slot2 = PathTool.getResFrame("common", "common_1020")

		slot0.cloth_btn:setBright(false)
		slot0.cloth_btn:setTitleText(TI18N("卸下"))
		slot0.cloth_title:enableOutline(Config.ColorData.data_color4[263], 2)
	end

	slot0.bg:loadTexture(slot2, LOADTEXT_TYPE_PLIST)

	slot3, slot4 = uv0:checkHolyEquipmentPalnByItemID(slot1.data.id)

	if slot3 then
		slot0.plan_eqm_name:setString(uv1(TI18N("【%s】"), slot4.name))
	else
		slot0.plan_eqm_name:setString("")
	end

	if slot0.enter_type == HeroConst.EnterType.eHolyPlan and slot0.open_type ~= 2 then
		slot0.cloth_btn:setTitleText(TI18N("装配"))
	end

	slot0.data = slot1.data

	slot0.equip_item:setData(slot1.data)
	slot0.equip_item:setEnchantLev(slot1.data.enchant)

	slot6 = slot1.data.config.name or ""

	if (slot1.data.enchant or 0) > 0 then
		slot6 = slot5 .. "+" .. slot7
	end

	slot0.equip_name:setString(slot6)

	if slot0.data.config.sub_type == BackPackConst.item_tab_type.HOLYEQUIPMENT then
		slot0:updateHolyEquipInfo()
	end
end

function EquipClothItem2.updateHolyEquipInfo(slot0)
	slot0.equip_name:setPositionY(106)

	slot3 = 44
	slot4 = 210
	slot5 = 333

	if slot0.holy_base_label == nil then
		slot0.holy_base_label = createLabel(20, cc.c4b(144, 93, 56, 255), nil, 146, 76, "", slot0.main_panel, 0, cc.p(0, 0.5))

		slot0.holy_base_label:setString(TI18N("基础:"))
	end

	if (slot0.data.main_attr or {}) and next(slot6) ~= nil then
		slot7 = slot6[1] or {}
		slot8, slot9, slot10 = commonGetAttrInfoByIDValue(slot7.attr_id, slot7.attr_val)

		if slot8 then
			if slot0.base_attr_label == nil then
				slot0.base_attr_label = createRichLabel(20, cc.c4b(149, 83, 34, 255), cc.p(0, 0.5), cc.p(slot4, slot2), nil, nil, 380)

				slot0.main_panel:addChild(slot0.base_attr_label)
			end

			slot0.base_attr_label:setString(uv0("<div fontcolor=#955322> %s %s </div>", slot9, slot10))
		end
	end

	if slot0.holy_random_label == nil then
		slot0.holy_random_label = createLabel(20, cc.c4b(144, 93, 56, 255), nil, slot1, slot3, "", slot0.main_panel, 0, cc.p(0, 0.5))

		slot0.holy_random_label:setString(TI18N("随机:"))
	end

	slot7 = {
		[slot12.pos] = slot12
	}

	for slot11, slot12 in ipairs(slot0.data.holy_eqm_attr) do
		-- Nothing
	end

	if slot0.random_holy_equip_attr == nil then
		slot0.random_holy_equip_attr = {}
	end

	for slot11 = 1, 2 do
		if slot0.random_holy_equip_attr[slot11] == nil then
			slot12 = slot4

			if slot11 >= 2 then
				slot12 = slot5
			end

			slot0.random_holy_equip_attr[slot11] = createRichLabel(20, cc.c4b(149, 83, 34, 255), cc.p(0, 0.5), cc.p(slot12, slot3), nil, nil, 380)

			slot0.main_panel:addChild(slot0.random_holy_equip_attr[slot11])
		end

		if slot7[slot11] then
			slot13, slot14, slot15 = commonGetAttrInfoByIDValue(slot12.attr_id, slot12.attr_val)

			if slot13 then
				slot0.random_holy_equip_attr[slot11]:setString(uv0("<div fontcolor=#955322> %s </div><div fontcolor=%s>%s</div>", slot14, uv1:getHolyEquipmentColorByItemIdAttrKey(slot0.data.config.id, Config.AttrData.data_id_to_key[slot12.attr_id], slot12.attr_val, 1, 2), slot15))
			end
		elseif slot11 == 1 then
			slot0.random_holy_equip_attr[slot11]:setString(TI18N("无"))
		else
			slot0.random_holy_equip_attr[slot11]:setString("")
		end
	end
end

function EquipClothItem2.registerEvents(slot0)
	slot0.cloth_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.call_fun then
				uv0:call_fun(uv0.data)
			end
		end
	end)
end

function EquipClothItem2.clickHandler(slot0)
	if slot0.call_fun then
		slot0:call_fun(slot0.data)
	end
end

function EquipClothItem2.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function EquipClothItem2.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function EquipClothItem2.DeleteMe(slot0)
	if slot0.equip_item then
		slot0.equip_item:DeleteMe()

		slot0.equip_item = nil
	end

	slot0.data = nil

	slot0:removeFromParent()
end
