HeroChipsBreakWindow = HeroChipsBreakWindow or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert
slot5 = Config.PartnerData.data_get_compound_info

function HeroChipsBreakWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.layout_name = "hero/hero_reset_chip_window"
	slot0.select_count = 0
	slot0.select_max_count = 15
	slot0.cur_chip_count = 0
	slot0.setting = {
		y = -14
	}
end

function HeroChipsBreakWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.disband_container = slot0.main_panel:getChildByName("disband_container")
	slot0.spine_node = slot0.disband_container:getChildByName("spine_node")
	slot0.tip_btn = slot0.disband_container:getChildByName("tip_btn")
	slot0.partner_btn = slot0.disband_container:getChildByName("partner_btn")
	slot0.disband_btn = slot0.disband_container:getChildByName("disband_btn")
	slot0.disband_btn_lable = slot0.disband_btn:getChildByName("label")

	slot0.disband_btn_lable:setString(TI18N("碎片分解"))

	slot0.title_img = slot0.disband_container:getChildByName("title_img")

	slot0.title_img:getChildByName("label"):setString(TI18N("碎片分解"))

	slot0.item_bg_1 = slot0.disband_container:getChildByName("item_bg_1")
	slot0.max_btn = slot0.item_bg_1:getChildByName("max_btn")
	slot0.max_btn_label = slot0.max_btn:getChildByName("label")

	slot0.max_btn_label:setString(TI18N("max"))

	slot0.add_btn = slot0.item_bg_1:getChildByName("add_btn")
	slot0.add_btn_label = slot0.add_btn:getChildByName("label")
	slot0.redu_btn = slot0.item_bg_1:getChildByName("redu_btn")
	slot0.redu_btn_label = slot0.redu_btn:getChildByName("label")
	slot0.resolve_count = slot0.item_bg_1:getChildByName("resolve_count")
	slot0.lab_have_count = slot0.disband_container:getChildByName("lab_have_count")

	slot0.lab_have_count:setString(TI18N("选择一种碎片后，请再选择数量"))

	slot1 = slot0.disband_container:getChildByName("camp_node")
	slot0.camp_btn_list = {
		[0] = slot1:getChildByName("camp_btn0"),
		[HeroConst.CampType.eWater] = slot1:getChildByName("camp_btn1"),
		[HeroConst.CampType.eFire] = slot1:getChildByName("camp_btn2"),
		[HeroConst.CampType.eWind] = slot1:getChildByName("camp_btn3"),
		[HeroConst.CampType.eLight] = slot1:getChildByName("camp_btn4"),
		[HeroConst.CampType.eDark] = slot1:getChildByName("camp_btn5")
	}
	slot0.img_select = slot1:getChildByName("img_select")
	slot2, slot3 = slot0.camp_btn_list[0]:getPosition()

	slot0.img_select:setPosition(slot2 - 0.5, slot3 + 1)

	slot5 = createEditBox(slot0.item_bg_1, PathTool.getResFrame("common", "common_99998"), cc.size(90, 50), nil, 22, nil, 22, "", nil, nil, LOADTEXT_TYPE_PLIST)
	slot0.edit_content = slot5

	slot5:setAnchorPoint(cc.p(0.5, 0.5))
	slot5:setPlaceholderFontColor(cc.c4b(255, 246, 228, 255))
	slot5:setFontColor(cc.c4b(255, 246, 228, 255))
	slot5:setPosition(cc.p(114, 27))

	slot6 = false

	slot5:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0 then
				uv0 = false

				uv1.resolve_count:setVisible(true)
				slot1:setText("")

				if slot1:getText() ~= "" then
					if tonumber(slot2) ~= nil and slot3 > 0 then
						uv1:showEditNum(slot3)
					else
						uv1:showEditNum(0)
						message(TI18N("请输入数字"))
					end
				else
					uv1:showEditNum(0)
				end
			end
		elseif slot0 == "began" then
			if not uv0 then
				uv1.resolve_count:setVisible(false)

				uv0 = true
			end
		elseif slot0 == "changed" then
			-- Nothing
		end
	end)
end

function HeroChipsBreakWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.tip_btn, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.PartnerData.data_partner_const.game_rule1.desc, slot1:getTouchBeganPosition())
	end, true, 1)
	registerButtonEventListener(slot0.partner_btn, function ()
		MallController:getInstance():openMallPanel(true, MallConst.MallType.Recovery)
	end, true, 2)
	registerButtonEventListener(slot0.disband_btn, handler(slot0, slot0._onClickBtnDisband), true, 1)
	registerButtonEventListener(slot0.max_btn, handler(slot0, slot0.onClickBtnMax), true, 1)
	registerButtonEventListener(slot0.add_btn, handler(slot0, slot0.onClickBtnAdd), true, 1)

	slot4 = handler(slot0, slot0.onClickBtnRedu)
	slot5 = true

	registerButtonEventListener(slot0.redu_btn, slot4, slot5, 1)

	for slot4, slot5 in pairs(slot0.camp_btn_list) do
		registerButtonEventListener(slot5, function ()
			uv0:onClickBtnShowByIndex(uv1)
		end, true, 2)
	end

	slot0:addGlobalEvent(HeroEvent.Del_Hero_Event, function ()
		uv0.select_count = 0

		uv0:updateHeroList(uv0.select_camp, true)

		uv0.is_send_proto = false
	end)
	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
			return
		end

		slot2 = false

		for slot6, slot7 in pairs(slot1) do
			if slot7.config and slot7.config.sub_type == BackPackConst.item_tab_type.HERO then
				slot2 = true

				break
			end
		end

		if slot2 == true then
			uv0:onClickBtnShowByIndex(uv0.select_camp, true)

			uv0.is_send_proto = false
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
			return
		end

		if slot1 == nil or next(slot1) == nil then
			return
		end

		slot2 = false

		for slot6, slot7 in pairs(slot1) do
			if slot7.config and slot7.config.sub_type == BackPackConst.item_tab_type.HERO then
				slot2 = true

				break
			end
		end

		if slot2 == true then
			uv0:onClickBtnShowByIndex(uv0.select_camp, true)

			uv0.is_send_proto = false
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
			return
		end

		if slot1 == nil or next(slot1) == nil then
			return
		end

		slot2 = false

		for slot6, slot7 in pairs(slot1) do
			if slot7.config and slot7.config.sub_type == BackPackConst.item_tab_type.HERO then
				slot2 = true

				break
			end
		end

		if slot2 == true then
			uv0:onClickBtnShowByIndex(uv0.select_camp, true)

			uv0.is_send_proto = false
		end
	end)
end

function HeroChipsBreakWindow._onClickBtnClose(slot0)
	uv0:openBreakChipWindow(false)
end

function HeroChipsBreakWindow.onClickBtnMax(slot0)
	if not slot0.select_chip_data then
		return
	end

	slot0.cur_chip_count = slot0.select_chip_data.quantity

	slot0:updateLabelNum(slot0.cur_chip_count)
end

function HeroChipsBreakWindow.onClickBtnAdd(slot0)
	if not slot0.select_chip_data then
		return
	end

	slot0.cur_chip_count = slot0.cur_chip_count + 1

	if slot0.select_chip_data.quantity < slot0.cur_chip_count then
		slot0.cur_chip_count = slot0.select_chip_data.quantity
	end

	slot0:updateLabelNum(slot0.cur_chip_count)
end

function HeroChipsBreakWindow.onClickBtnRedu(slot0)
	if not slot0.select_chip_data then
		return
	end

	slot0.cur_chip_count = slot0.cur_chip_count - 1

	if slot0.cur_chip_count < 0 then
		slot0.cur_chip_count = 0
	end

	slot0:updateLabelNum(slot0.cur_chip_count)
end

function HeroChipsBreakWindow.updateLabelNum(slot0, slot1)
	if not slot0.select_chip_data then
		slot0:setTouchEnable_Redu(true)
		slot0:setTouchEnable_Add(true)
		slot0:setTouchEnable_Max(true)
		slot0.resolve_count:setString(0)
		slot0.edit_content:setVisible(false)

		return
	end

	slot0:setTouchEnable_Max(false)
	slot0.edit_content:setVisible(true)

	if slot1 == 0 then
		slot0:setTouchEnable_Redu(true)
		slot0:setTouchEnable_Add(false)
	elseif slot1 == slot0.select_chip_data.quantity then
		slot0:setTouchEnable_Redu(false)
		slot0:setTouchEnable_Add(true)
	else
		slot0:setTouchEnable_Redu(false)
		slot0:setTouchEnable_Add(false)
	end

	slot0.resolve_count:setString(slot1)
end

function HeroChipsBreakWindow.showEditNum(slot0, slot1)
	if not slot0.select_chip_data then
		return
	end

	slot0.cur_chip_count = slot1

	if slot0.select_chip_data.quantity < slot0.cur_chip_count then
		slot0.cur_chip_count = slot0.select_chip_data.quantity
	elseif slot0.cur_chip_count < 0 then
		slot0.cur_chip_count = 0
	end

	slot0:updateLabelNum(slot0.cur_chip_count)
end

function HeroChipsBreakWindow.setTouchEnable_Add(slot0, slot1)
	setChildUnEnabled(slot1, slot0.add_btn)
	slot0.add_btn:setTouchEnabled(not slot1)

	if slot1 then
		slot0.add_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	else
		slot0.add_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
	end
end

function HeroChipsBreakWindow.setTouchEnable_Redu(slot0, slot1)
	setChildUnEnabled(slot1, slot0.redu_btn)
	slot0.redu_btn:setTouchEnabled(not slot1)

	if slot1 then
		slot0.redu_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	else
		slot0.redu_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
	end
end

function HeroChipsBreakWindow.setTouchEnable_Max(slot0, slot1)
	setChildUnEnabled(slot1, slot0.max_btn)
	slot0.max_btn:setTouchEnabled(not slot1)

	if slot1 then
		slot0.max_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	else
		slot0.max_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
	end
end

function HeroChipsBreakWindow._onClickBtnDisband(slot0)
	if slot0.is_send_proto then
		return
	end

	slot0:disbandChip()
end

function HeroChipsBreakWindow.disbandChip(slot0)
	if not slot0.select_chip_data then
		message("没有选中英雄碎片")

		return
	end

	slot1 = slot0.select_chip_data.config

	if (slot0.cur_chip_count or 0) == 0 then
		message("没有放入英雄碎片")

		return
	end

	slot3 = slot0.select_chip_data.sort_order == 1
	slot4 = {}

	for slot8, slot9 in ipairs(slot1.value) do
		if slot9[1] ~= nil then
			uv0(slot4, {
				id = slot10,
				num = (slot9[2] or 0) * slot2
			})
		end
	end

	uv0({}, {
		id = slot0.select_chip_data.id,
		bid = slot0.select_chip_data.base_id,
		num = slot2
	})

	if #slot4 > 0 then
		uv2:openHeroResetOfferPanel(true, slot4, slot3, function ()
			uv0.is_send_proto = true

			delayRun(uv0.disband_container, 0, function ()
				BackpackController:getInstance():sender10522(BackPackConst.Bag_Code.BACKPACK, uv0)
			end)
		end, HeroConst.ResetType.eChipReset, uv1(TI18N("本次分解 <div fontcolor=#289b14>%s</div> 个<div fontcolor=%s>【%s】</div>可获得以下资源:"), slot2, BackPackConst.getWhiteQualityColorStr(slot0.select_chip_data.quality), slot1.name))
	end
end

function HeroChipsBreakWindow.onClickBtnShowByIndex(slot0, slot1, slot2)
	if slot0.img_select and slot0.camp_btn_list[slot1] then
		slot3, slot4 = slot0.camp_btn_list[slot1]:getPosition()

		slot0.img_select:setPosition(slot3 - 0.5, slot4 + 1)
	end

	slot0.select_count = 0

	slot0:updateHeroList(slot1, slot2)
end

function HeroChipsBreakWindow.openRootWnd(slot0)
	slot0.is_send_proto = nil

	slot0.item_bg_1:setVisible(true)

	slot0.select_chip_data = nil

	slot0:onClickBtnShowByIndex(0, true)
	slot0:updateLabelNum(0)
end

function HeroChipsBreakWindow.getChipListByCamp(slot0, slot1)
	slot3 = {}
	slot4 = nil

	for slot8, slot9 in ipairs(BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.HERO) or {}) do
		if slot9.config and (slot1 == 0 or slot1 == slot10.lev) then
			if BackpackController:getInstance():getModel():checkHeroChipRedPoint(slot9) then
				-- Nothing
			else
				slot11.sort_order = 0
			end

			if slot9.quantity > 0 then
				uv0(slot3, slot11)
			end

			if slot0.select_chip_data and slot0.select_chip_data.id == ({
				id = slot9.id,
				bid = 0,
				base_id = slot10.id,
				star = slot10.eqm_jie,
				camp_type = slot10.lev,
				icon = slot10.icon,
				quantity = slot9.quantity,
				quality = slot9.quality,
				config = slot10,
				sort_order = 1
			}).id then
				slot4 = slot11
			end
		end
	end

	uv1(slot3, SortTools.tableCommonSorter({
		{
			"sort_order",
			true
		},
		{
			"quality",
			true
		},
		{
			"base_id",
			false
		}
	}))

	return slot3, slot4
end

function HeroChipsBreakWindow.updateHeroList(slot0, slot1, slot2)
	if not slot2 and (slot1 or 0) == slot0.select_camp then
		return
	end

	if not slot0.list_view then
		slot0.hero_setting = {
			start_y = 4,
			start_x = 0,
			delay = 1,
			space_x = 0,
			item_width = 128,
			item_height = 122,
			space_y = 0,
			col = 5,
			need_dynamic = true
		}
		slot6, slot7 = slot0.disband_container:getChildByName("img_box_0"):getPosition()
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.disband_container, cc.p(slot6, slot7), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(640, 330), slot0.hero_setting, cc.p(0.5, 0.5))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end

	slot0.select_camp = slot3
	slot0.show_list, cur_select_chip_data = slot0:getChipListByCamp(slot3)

	if cur_select_chip_data == nil then
		slot0.select_chip_data = nil

		slot0.list_view:reloadData(nil, {
			item_height = 140
		})
	else
		slot0.select_chip_data = cur_select_chip_data

		slot0.list_view:resetCurrentItems()
	end

	slot0.cur_chip_count = 1

	slot0:updateLabelNum(1)

	if #slot0.show_list == 0 then
		slot0:showEmptyIcon(true)
	else
		slot0:showEmptyIcon(false)
	end
end

function HeroChipsBreakWindow.showEmptyIcon(slot0, slot1)
	if not slot0.empty_con and slot1 == false then
		return
	end

	if not slot0.empty_con then
		slot3, slot4 = slot0.disband_container:getChildByName("img_box_0"):getPosition()
		slot5 = cc.size(200, 200)
		slot0.empty_con = ccui.Widget:create()

		slot0.empty_con:setContentSize(slot5)
		slot0.empty_con:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.empty_con:setPosition(slot3, slot4)
		slot0.disband_container:addChild(slot0.empty_con, 10)

		slot7 = createImage(slot0.empty_con, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), slot5.width / 2, slot5.height / 2, cc.p(0.5, 0.5), false)
		slot8 = LoginController:getInstance():getModel():getLoginData()
		slot9 = nil
		slot0.empty_label = createLabel(26, Config.ColorData.data_color4[175], nil, slot5.width / 2, -10, "", slot0.empty_con, 0, cc.p(0.5, 0))
	end

	slot0.empty_label:setString(TI18N("暂无该类型英雄"))
	slot0.empty_con:setVisible(slot1)
end

function HeroChipsBreakWindow.createNewCell(slot0, slot1, slot2)
	slot3 = 122
	slot4 = ccui.Widget:create()
	slot5 = HeroExhibitionItem.new(0.9, true)

	slot5:setPosition(slot1 * 0.5, slot3 * 0.5)
	slot4:addChild(slot5)
	slot4:setCascadeOpacityEnabled(true)
	slot4:setAnchorPoint(0, 0)
	slot4:setContentSize(cc.size(slot1, slot3))

	slot4.hero_item = slot5

	slot4.hero_item:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot4
end

function HeroChipsBreakWindow.numberOfCells(slot0)
	return #slot0.show_list
end

function HeroChipsBreakWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.show_list[slot2] then
		slot1.hero_item:setData(slot3)

		if slot0.select_chip_data and slot0.select_chip_data.base_id == slot3.base_id then
			slot1.hero_item:setSelected(true)
		else
			slot1.hero_item:setSelected(false)
		end

		slot1.hero_item:showLockIcon(false)
		slot1.hero_item:setPositionY(70)

		slot5 = (uv0[slot3.base_id] or {}).num or 50
		slot6 = slot3.quantity or 0

		slot1.hero_item:showProgressbarStatus(true, slot6 * 100 / slot5, uv1("%s/%s", slot6, slot5), slot0.setting)
		slot1.hero_item:showChipIcon(true)
		slot1.hero_item:setDefaultHead(slot3.icon)
	end
end

function HeroChipsBreakWindow.onCellTouched(slot0, slot1)
	if slot0.show_list[slot1.index] then
		slot0:selectChip(slot1, slot3)
	end
end

function HeroChipsBreakWindow.selectChip(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	if not slot1 then
		return
	end

	for slot7, slot8 in ipairs(slot0.list_view:getActiveCellList()) do
		slot8.hero_item:setSelected(false)
	end

	if slot0.select_chip_data and slot0.select_chip_data == slot2 then
		slot0.select_chip_data = nil
	else
		slot0.select_chip_data = slot2
		slot0.select_chip_cell = slot1

		if slot0.select_chip_cell then
			slot0.select_chip_cell.hero_item:setSelected(true)
		end
	end

	slot0.cur_chip_count = 1

	slot0:updateLabelNum(slot0.cur_chip_count)
end

function HeroChipsBreakWindow.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	for slot5, slot6 in pairs(uv0:getHeroList()) do
		slot6.is_ui_select = nil
	end

	doStopAllActions(slot0.disband_container)
	uv1:openBreakChipWindow(false)
end
