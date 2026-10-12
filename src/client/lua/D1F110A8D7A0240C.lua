slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
HorcruxStrengthenWindow = HorcruxStrengthenWindow or BaseClass(BaseView)

function HorcruxStrengthenWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.is_use_hero = true
	slot0.layout_name = "hero/horcrux_strengthen_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("elfin", "elfin"),
			type = ResourcesType.plist
		}
	}
	slot0.attr_data_list = {}
	slot0.cost_item_list = {}
	slot0.expend = {}
	slot0.hero_item_data = {}
	slot0.hero_item = nil
	slot0.conditions_hero = {}
	slot0.need_star = 5
end

function HorcruxStrengthenWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1

	slot0:playEnterAnimatianByObj(slot0.container, 2)
	slot1:getChildByName("win_title"):setString(TI18N("魂器强化"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.base_panel = slot0.container:getChildByName("base_panel")
	slot0.original_panel = slot0.base_panel:getChildByName("original_panel")
	slot0.original_node = slot0.original_panel:getChildByName("original_node")
	slot0.original_label = slot0.original_panel:getChildByName("original_label")
	slot0.original_label_bg = slot0.original_panel:getChildByName("Image_2")
	slot0.upgrade_panel = slot0.base_panel:getChildByName("upgrade_panel")
	slot0.upgrade_node = slot0.upgrade_panel:getChildByName("upgrade_node")
	slot0.upgrade_label = slot0.upgrade_panel:getChildByName("upgrade_label")
	slot0.upgrade_label_bg = slot0.upgrade_panel:getChildByName("Image_2")
	slot0.arrow_img = slot0.base_panel:getChildByName("arrow_img")
	slot0.original_item = HorcruxItem.new(false, 0.95, false, false)

	slot0.original_node:addChild(slot0.original_item)

	slot0.upgrade_item = HorcruxItem.new(false, 0.95, false, false)

	slot0.upgrade_node:addChild(slot0.upgrade_item)

	slot0.attr_panel = slot0.container:getChildByName("attr_panel")
	slot0.base_attr_title = slot0.attr_panel:getChildByName("label")

	slot0.base_attr_title:setString(TI18N("基础属性"))

	slot0.attr_scroll = slot0.attr_panel:getChildByName("attr_scroll")
	slot0.strengthen_effect_panel = slot0.container:getChildByName("strengthen_effect_panel")
	slot0.scroll_bg = slot0.strengthen_effect_panel:getChildByName("Image_11_0")
	slot0.scroll_size = slot0.scroll_bg:getContentSize()
	slot0.strengthen_effect_title = slot0.strengthen_effect_panel:getChildByName("label")

	slot0.strengthen_effect_title:setString(TI18N("强化属性"))

	slot0.strengthen_effect_scroll = createScrollView(slot0.scroll_size.width, slot0.scroll_size.height, 0, 0, slot0.strengthen_effect_panel, ScrollViewDir.vertical)
	slot0.scroll_container = slot0.strengthen_effect_scroll:getInnerContainer()
	slot0.strengthen_panel = slot0.container:getChildByName("strengthen_panel")
	slot0.consume_txt = slot0.strengthen_panel:getChildByName("consume_txt")

	slot0.consume_txt:setString(TI18N("消\n耗"))

	slot0.strengthen_condition = slot0.strengthen_panel:getChildByName("strengthen_condition")

	slot0.strengthen_condition:setVisible(false)

	slot0.strengthen_btn = slot0.strengthen_panel:getChildByName("strengthen_btn")
	slot0.strengthen_btn_label = slot0.strengthen_btn:getChildByName("label")

	slot0.strengthen_btn_label:setString(TI18N("强化"))
	slot0.strengthen_btn:setEnabled(false)

	slot0.cost_node = slot0.strengthen_panel:getChildByName("cost_node")
	slot0.hero_node = slot0.strengthen_panel:getChildByName("hero_node")
	slot0.max_label = slot0.container:getChildByName("max_label")
	slot0.change_btn = slot0.strengthen_panel:getChildByName("change_btn")
	slot0.change_btn_label = slot0.change_btn:getChildByName("label")

	slot0.max_label:setString(TI18N("已满级"))
	slot0.max_label:setVisible(false)
	slot0:updateScrollviewList()
end

function HorcruxStrengthenWindow.updateScrollviewList(slot0)
	if slot0.child_scrollview == nil then
		slot0.child_scrollview = CommonScrollViewSingleLayout.new(slot0.attr_scroll, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.attr_scroll:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 0,
			delay = 4,
			space_x = 0,
			item_width = 590,
			item_height = 35,
			space_y = 10,
			col = 1
		}, cc.p(0, 0))

		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.child_scrollview:setSwallowTouches(false)
end

function HorcruxStrengthenWindow.createNewCell(slot0, slot1, slot2)
	return HorcruxAttrItem2.new()
end

function HorcruxStrengthenWindow.numberOfCells(slot0)
	if not slot0.attr_data_list then
		return 0
	end

	return #slot0.attr_data_list
end

function HorcruxStrengthenWindow.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.attr_data_list then
		return
	end

	slot1.index = slot2

	if not slot0.attr_data_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function HorcruxStrengthenWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHorcruxStrengtPanel(false)
	end, false, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHorcruxStrengtPanel(false)
	end, false, 2)
	registerButtonEventListener(slot0.change_btn, function ()
		uv0.is_use_hero = not uv0.is_use_hero

		uv0:updateChangeBtn()
	end, true, 1)
	registerButtonEventListener(slot0.strengthen_btn, function ()
		uv0:onStrengthenBtn()
	end, true, 1)
	slot0:addGlobalEvent(HeroEvent.Upgrade_Star_Select_Event, function (slot0)
		if slot0 then
			uv0:updateHeroItemInfo(slot0)
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Data_Update, function (slot0)
		if not slot0 or not uv0.horcrux_data then
			return
		end

		if slot0.partner_id == uv0.horcrux_data.partner_id then
			uv0.horcrux_data = {
				bid = slot0.bid,
				horcrux_status = slot0.horcrux_status,
				horcrux_lev = slot0.horcrux_lev,
				partner_id = slot0.partner_id,
				star = slot0.star
			}

			uv1:sender11404(uv0.horcrux_data.partner_id)
		end
	end)
	slot0:addGlobalEvent(HeroEvent.HORCRUX_CAN_ACTIVATE, function (slot0)
		uv0:setData(slot0)
	end)
	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		uv0:updateItemList(slot1)
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
		uv0:updateItemList(slot1)
	end)
end

function HorcruxStrengthenWindow.onStrengthenBtn(slot0)
	if not slot0.horcrux_attr_config then
		return
	end

	if slot0.horcrux_data and slot0.horcrux_data.partner_id then
		if (slot0.horcrux_attr_config.num or 0) > 0 then
			if slot0.touch_summon then
				return
			end

			if slot0.touch_summon_ticket == nil then
				slot0.touch_summon_ticket = GlobalTimeTicket:getInstance():add(function ()
					uv0.touch_summon = nil

					if uv0.touch_summon_ticket ~= nil then
						GlobalTimeTicket:getInstance():remove(uv0.touch_summon_ticket)

						uv0.touch_summon_ticket = nil
					end
				end, 0.8)
			end

			slot0.touch_summon = true
		end

		slot0.expend = {}

		for slot5, slot6 in pairs(slot0.hero_item_data.dic_select_list) do
			uv0(slot0.expend, {
				partner_id = slot6.partner_id
			})
		end

		uv1:sender11403(slot0.horcrux_data.partner_id, slot0.expend or {}, slot0.is_use_hero and FALSE or TRUE)
	end
end

function HorcruxStrengthenWindow.openRootWnd(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.horcrux_data = slot1

	uv0:sender11404(slot0.horcrux_data.partner_id)

	slot0.horcrux_attr_config = uv1:getHorcruxAttrConfig(slot0.horcrux_data.horcrux_lev)
	slot0.partner_horcrux_config = uv1:getPartnerHorcruxConfig(slot0.horcrux_data.bid)
	slot0.hero_item_data = slot0:getHeroData(slot0.horcrux_data.bid, 5, slot0.horcrux_attr_config.num or 0)

	if slot0.horcrux_data == nil or slot0.horcrux_attr_config == nil or slot0.partner_horcrux_config == nil then
		return
	end

	slot0:setBaseInfo()
	slot0:setAttrInfo()
	slot0:setStrengthenEffectInfo()
	slot0:setStrengthenInfo()
	slot0:updateConditionsHero()
end

function HorcruxStrengthenWindow.setData(slot0, slot1)
	slot0.can_strengthen = false

	if slot1 and slot1.result == 1 then
		slot0.can_strengthen = true
	end

	slot0.msg = slot1.msg
	slot0.horcrux_attr_config = uv0:getHorcruxAttrConfig(slot0.horcrux_data.horcrux_lev)
	slot0.partner_horcrux_config = uv0:getPartnerHorcruxConfig(slot0.horcrux_data.bid)
	slot0.hero_item_data = slot0:getHeroData(slot0.horcrux_data.bid, 5, slot0.horcrux_attr_config.num or 0)

	if slot0.horcrux_data == nil or slot0.horcrux_attr_config == nil or slot0.partner_horcrux_config == nil then
		return
	end

	slot0:setBaseInfo()
	slot0:setAttrInfo()
	slot0:setStrengthenEffectInfo()
	slot0:setStrengthenInfo()
	slot0:updateConditionsHero()
end

function HorcruxStrengthenWindow.setBaseInfo(slot0)
	slot0.original_item:setData({
		bid = slot0.horcrux_data.bid,
		horcrux_status = slot0.horcrux_data.horcrux_status,
		horcrux_lev = slot0.horcrux_data.horcrux_lev,
		star = slot0.horcrux_data.star
	})
	slot0.original_label:setString(slot0.partner_horcrux_config.horcrux_name .. "+" .. slot0.horcrux_data.horcrux_lev)

	if slot0.original_label:getContentSize().width > slot0.original_label_bg:getContentSize().width - 15 then
		slot0.original_label_bg:setContentSize(cc.size(slot2.width + 15, slot3.height))
	end

	if slot0:checkIsMax() then
		slot0.upgrade_panel:setVisible(false)
		slot0.arrow_img:setVisible(false)
		slot0.original_panel:setPositionX(300)
	else
		slot0.upgrade_panel:setVisible(true)
		slot0.arrow_img:setVisible(true)
		slot0.original_panel:setPositionX(135)
		slot0.upgrade_item:setData({
			bid = slot0.horcrux_data.bid,
			horcrux_status = slot0.horcrux_data.horcrux_status,
			horcrux_lev = slot0.horcrux_data.horcrux_lev + 1,
			star = slot0.horcrux_data.star
		})
		slot0.upgrade_label:setString(slot0.partner_horcrux_config.horcrux_name .. "+" .. slot0.horcrux_data.horcrux_lev + 1)

		if slot0.upgrade_label:getContentSize().width > slot0.upgrade_label_bg:getContentSize().width - 15 then
			slot0.upgrade_label_bg:setContentSize(cc.size(slot2.width + 15, slot3.height))
		end
	end
end

function HorcruxStrengthenWindow.setAttrInfo(slot0)
	slot0:getAttrListData()
	slot0.child_scrollview:setClickEnabled(#slot0.attr_data_list > 3)
	slot0.child_scrollview:reloadData()
end

function HorcruxStrengthenWindow.updateItemList(slot0, slot1)
	slot2 = {
		[slot7.base_id] = true
	}

	for slot6, slot7 in pairs(slot1) do
		if slot7.base_id then
			-- Nothing
		end
	end

	for slot6, slot7 in ipairs(slot0.cost_item_list) do
		if slot0.goods_consume and slot7:getData().id and slot2[slot7:getData().id] then
			for slot11, slot12 in pairs(slot0.goods_consume) do
				if slot7:getData().id == slot12[1] then
					slot7:setNeedNum(slot12[2], BackpackController:getInstance():getModel():getItemNumByBid(slot7:getData().id))
				end
			end
		end
	end
end

function HorcruxStrengthenWindow.updateChangeBtn(slot0)
	if slot0.is_use_hero == true and slot0.horcrux_attr_config and slot0.horcrux_attr_config.num > 0 then
		slot0.change_btn_label:setString(TI18N("万能材料"))
		slot0.cost_node:setVisible(false)
		slot0.hero_node:setVisible(true)
	else
		slot0.change_btn_label:setString(TI18N("消耗本体"))
		slot0.cost_node:setVisible(true)
		slot0.hero_node:setVisible(false)
	end
end

function HorcruxStrengthenWindow.updateConditionsHero(slot0)
	if slot0.horcrux_data == nil or slot0.horcrux_data.bid == nil or slot0.horcrux_attr_config.num <= 0 then
		return
	end

	slot0.conditions_hero = {}

	for slot5, slot6 in pairs(uv0:getHeroList()) do
		if uv0:isSameHero(slot6.bid, slot0.horcrux_data.bid) and slot6.star == slot0.need_star then
			uv1(slot0.conditions_hero, slot6)
		end
	end

	if slot0.hero_item_data then
		uv2(slot0.conditions_hero, SortTools.tableCommonSorter({
			{
				"lev",
				false
			},
			{
				"id",
				true
			}
		}))

		slot3 = 0

		for slot7, slot8 in ipairs(slot0.conditions_hero) do
			if not slot8:checkHeroLockTips(true, nil, true) and not slot8:isLimitTimeHero() and not slot8:isLimitTimeHelpHero() and not slot8:isOptionTryHero() and not slot8:isWakeUpGodMonster() then
				slot0.hero_item_data.dic_select_list[slot8.id] = slot8

				if slot0.hero_item_data.count <= slot3 + 1 then
					break
				end
			end
		end

		if slot3 < slot0.hero_item_data.count then
			slot0.hero_item_data.dic_select_list = {}
		else
			slot0.hero_item_data.lev = uv3("%s/%s", slot3, slot0.hero_item_data.count)

			if slot0.hero_item then
				slot0.hero_item.num_label:setString(slot0.hero_item_data.lev)

				if slot3 > 0 then
					slot0.hero_item:setHeadUnEnabled(false)
				else
					slot0.hero_item:setHeadUnEnabled(true)
				end
			end
		end
	end
end

function HorcruxStrengthenWindow.setStrengthenEffectInfo(slot0)
	if slot0.effect_item ~= nil then
		slot0.effect_item:removeFromParent()

		slot0.effect_item = nil
	end

	slot2 = nil

	if uv0:getStrengthenDesc(slot0.horcrux_data.bid, slot0.horcrux_data.horcrux_lev) then
		for slot6, slot7 in ipairs(slot1) do
			slot2 = slot7

			if slot7.is_achieve == false then
				break
			end
		end
	end

	if slot2 then
		slot3 = cc.size(550, 150)
		slot0.effect_item = ccui.Widget:create()

		slot0.effect_item:setAnchorPoint(0, 0.5)

		slot4 = PathTool.getResFrame("hero", "hero_info_65")
		slot5 = cc.c4b(124, 79, 61, 255)

		if slot2.is_achieve then
			slot4 = PathTool.getResFrame("hero", "hero_info_64")
			slot5 = cc.c4b(36, 144, 3, 255)
		end

		slot6 = createRichLabel(22, slot5, cc.p(0, 0.5), cc.p(50, 0), 8, nil, 500)

		slot6:setString(slot2.desc_str)
		slot0.effect_item:setContentSize(cc.size(slot3.width, slot3.height))
		slot0.effect_item:addChild(slot6)
		slot6:setPositionY(slot3.height / 2)

		slot7 = createImage(slot0.effect_item, slot4, 15, slot3.height / 2 + slot6:getContentSize().height / 2 + 3, cc.p(0.5, 1), true)
		slot8 = slot6:getSize()
		slot8.height = slot8.height + 20
		slot8.height = math.max(slot8.height, slot0.scroll_size.height)

		slot0.effect_item:setPosition(35, slot8.height / 2)
		slot0.scroll_container:addChild(slot0.effect_item)
		slot0.scroll_container:setContentSize(cc.size(slot0.scroll_size.width, slot8.height))
		slot0.scroll_container:setPosition(cc.p(0, slot0.scroll_size.height - slot8.height))

		if slot2.is_achieve then
			slot0.strengthen_effect_title:setString(TI18N("强化属性"))
		else
			slot0.strengthen_effect_title:setString(TI18N("强化属性(即将激活的强化效果)"))
		end
	end
end

function HorcruxStrengthenWindow.setStrengthenInfo(slot0)
	if slot0:checkIsMax() then
		slot0.strengthen_panel:setVisible(false)
		slot0.max_label:setVisible(true)
	else
		slot4 = true

		slot0.strengthen_panel:setVisible(slot4)

		for slot4, slot5 in pairs(slot0.cost_item_list) do
			slot5:setVisible(false)
		end

		if slot0.horcrux_attr_config then
			slot1 = 0

			if slot0.horcrux_attr_config.loss and slot0.horcrux_attr_config.num then
				slot1 = #slot0.horcrux_attr_config.loss + (slot0.horcrux_attr_config.num > 0 and 1 or 0)
			end

			slot2 = slot1 * BackPackItem.Width * 0.9 + (slot1 - 1) * 10
			slot3 = -(slot2 / 2) + BackPackItem.Width * 0.9 / 2

			slot0.consume_txt:setPositionX(slot0.cost_node:getPositionX() - slot2 / 2 - 25)

			slot0.goods_consume = {}

			if slot0.horcrux_attr_config then
				if next(slot0.horcrux_attr_config.loss) ~= nil then
					slot0.goods_consume = slot0.horcrux_attr_config.loss
				elseif slot0.horcrux_attr_config.replace_loss then
					slot0.goods_consume = slot0.horcrux_attr_config.replace_loss
				end
			end

			if next(slot0.goods_consume) ~= nil then
				for slot7, slot8 in ipairs(slot0.goods_consume) do
					slot9 = slot8[1]
					slot10 = slot8[2]

					if not slot0.cost_item_list[slot7] then
						slot11 = BackPackItem.new(false, true, false, 0.9)

						slot0.cost_node:addChild(slot11)

						slot0.cost_item_list[slot7] = slot11
					end

					slot12 = slot3 + (slot7 - 1) * (BackPackItem.Width * 0.9 + 10)

					slot11:setPosition(slot3 + (slot7 - 1) * (BackPackItem.Width * 0.9 + 10), 0)

					slot13 = BackpackController:getInstance():getModel():getItemNumByBid(slot9)

					slot11:setBaseData(slot9)
					slot11:setNeedNum(slot10, slot13, 1, true, 2)

					if slot13 < slot10 then
						slot11:setDefaultTip(true, true)
					else
						slot11:setDefaultTip()
					end

					slot11:setVisible(true)
				end
			end

			if slot0.hero_item then
				slot0.hero_item:setVisible(false)
			end

			slot0.change_btn:setVisible(false)

			if slot0.horcrux_attr_config.num > 0 then
				if slot0.hero_item == nil then
					slot0.hero_item = HeroExhibitionItem.new(0.9, true)

					slot0.hero_node:addChild(slot0.hero_item)
					slot0.hero_item:setPosition(slot3 + (slot1 - 1) * (BackPackItem.Width * 0.9 + 10), 0)
					slot0.hero_item:addCallBack(function ()
						uv0:onClickItemData()
					end)
				end

				slot0.hero_item:setData(slot0.hero_item_data)
				slot0.hero_item:setVisible(true)
				slot0.hero_item:setHeadUnEnabled(true)

				if uv0:checkHorcruxCanReplace(slot0.hero_item_data.bid) then
					slot0.change_btn:setVisible(false)

					slot0.is_use_hero = false
				end
			end

			slot0.strengthen_condition:setString(slot0.horcrux_attr_config.strengthen_desc)
		end

		if slot0.can_strengthen then
			slot0.strengthen_btn:setEnabled(true)
			slot0.strengthen_condition:setVisible(false)
			setChildUnEnabled(false, slot0.strengthen_btn)
			slot0.strengthen_btn_label:enableOutline(Config.ColorData.data_color3[277], 2)
		else
			slot0.strengthen_condition:setString(slot0.msg or slot0.horcrux_attr_config.strengthen_desc)
			slot0.strengthen_btn:setEnabled(false)
			slot0.strengthen_condition:setVisible(true)
			setChildUnEnabled(true, slot0.strengthen_btn)
			slot0.strengthen_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
		end
	end

	slot0:updateChangeBtn()
end

function HorcruxStrengthenWindow.onClickItemData(slot0)
	if not slot0.hero_item_data or not slot0.horcrux_data then
		return
	end

	uv0:openHeroUpgradeStarSelectPanel(true, slot0.hero_item_data, {}, HeroConst.SelectHeroType.eHorcrux)
end

function HorcruxStrengthenWindow.getHeroData(slot0, slot1, slot2, slot3)
	if Config.PartnerData.data_partner_base[slot1] then
		-- Nothing
	else
		return nil
	end

	for slot10, slot11 in ipairs(slot0.horcrux_attr_config.target_partner_cost) do
		if slot11[1] == slot1 then
			slot4.bid = slot11[2]

			break
		end
	end

	return {
		star = slot2 or 0,
		count = slot3 or 0,
		lev = uv0("%s/%s", 0, slot3),
		bid = slot1,
		camp_type = slot5.camp_type,
		name = slot5.name,
		dic_select_list = {}
	}
end

function HorcruxStrengthenWindow.updateHeroItemInfo(slot0, slot1)
	if not slot1 or not slot0.hero_item_data then
		return
	end

	for slot6, slot7 in pairs(slot0.hero_item_data.dic_select_list) do
		slot2 = 0 + 1
	end

	slot0.hero_item_data.lev = uv0("%s/%s", slot2, slot0.hero_item_data.count)

	if slot0.hero_item then
		slot0.hero_item.num_label:setString(slot0.hero_item_data.lev)

		if slot2 > 0 then
			slot0.hero_item:setHeadUnEnabled(false)
		else
			slot0.hero_item:setHeadUnEnabled(true)
		end
	end

	slot0:updateCentreHeroItemRedPoint()
end

function HorcruxStrengthenWindow.getAttrListData(slot0)
	slot1 = uv0:getHorcruxAttrList(slot0.horcrux_data.bid, slot0.horcrux_data.horcrux_lev)
	slot0.attr_data_list = {}

	if slot0:checkIsMax() and slot1 then
		for slot5, slot6 in pairs(slot1) do
			table.insert(slot0.attr_data_list, {
				attr_key = slot6[1][1],
				attr_val = slot6[1][2]
			})
		end
	elseif slot1 and uv0:getHorcruxAttrList(slot0.horcrux_data.bid, slot0.horcrux_data.horcrux_lev + 1) then
		for slot6 = 1, #slot1 do
			table.insert(slot0.attr_data_list, {
				attr_key = slot1[slot6][1][1],
				attr_val = slot1[slot6][1][2],
				attr_key1 = slot2[slot6][1][1],
				attr_val1 = slot2[slot6][1][2]
			})
		end
	end
end

function HorcruxStrengthenWindow.updateCentreHeroItemRedPoint(slot0)
	if not slot0.hero_item then
		return
	end

	if slot0.hero_item_data then
		for slot6, slot7 in pairs(slot1.dic_select_list) do
			slot2 = 0 + 1
		end

		if slot2 < slot1.count then
			slot0.hero_item:showRedPoint(slot1.count <= #slot0.conditions_hero and slot0.can_strengthen, 8, 8)
		else
			slot0.hero_item:showRedPoint(false)
		end
	end
end

function HorcruxStrengthenWindow.checkIsMax(slot0)
	if slot0.horcrux_data and slot0.horcrux_data.horcrux_lev and uv0:getHorcruxAttrConfig(slot0.horcrux_data.horcrux_lev + 1) then
		return false
	end

	return true
end

function HorcruxStrengthenWindow.close_callback(slot0)
	if slot0.child_scrollview then
		slot0.child_scrollview:DeleteMe()
	end

	slot0.child_scrollview = nil

	if slot0.cost_item_list and next(slot0.cost_item_list) ~= nil then
		for slot4, slot5 in pairs(slot0.cost_item_list) do
			if slot5.item then
				slot5.item:DeleteMe()
			end
		end

		slot0.cost_item_list = {}
	end

	if slot0.horcrux_item then
		slot0.horcrux_item:DeleteMe()

		slot0.horcrux_item = nil
	end

	uv0:openHorcruxStrengtPanel(false)
end

HorcruxAttrItem2 = class("HorcruxAttrItem2", function ()
	return ccui.Widget:create()
end)

function HorcruxAttrItem2.ctor(slot0)
	slot0:configUI()
end

function HorcruxAttrItem2.configUI(slot0)
	slot0.size = cc.size(599, 35)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/horcrux_attr_item2"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.attr_icon = slot0.container:getChildByName("attr_icon")
	slot0.attr_name = slot0.container:getChildByName("attr_name")
	slot0.attr_val = slot0.container:getChildByName("attr_val")
	slot0.arrow_img = slot0.container:getChildByName("arrow_img")
	slot0.attr_val1 = slot0.container:getChildByName("attr_val1")
end

function HorcruxAttrItem2.setData(slot0, slot1)
	slot0.data = slot1

	if slot0.data then
		slot2 = slot1.attr_key
		slot4 = Config.AttrData.data_key_to_name[slot2]
		slot5 = PathTool.getAttrIconByStr(slot2)

		if PartnerCalculate.isShowPerByStr(slot2) == true then
			slot3 = slot1.attr_val * 0.1 .. "%"
		end

		loadSpriteTexture(slot0.attr_icon, PathTool.getResFrame("common", slot5), LOADTEXT_TYPE_PLIST)
		slot0.attr_name:setString(slot4)
		slot0.attr_val:setString("+" .. slot3)

		if slot0.data.attr_key1 and slot0.data.attr_val1 then
			slot0.arrow_img:setVisible(true)
			slot0.attr_val1:setVisible(true)

			if PartnerCalculate.isShowPerByStr(slot1.attr_key1) == true then
				slot8 = slot1.attr_val1 * 0.1 .. "%"
			end

			slot0.attr_val1:setString("+" .. slot8)
			slot0.attr_val:setTextColor(cc.c4b(123, 79, 61, 255))
			slot0.attr_val:setPositionX(216)
		else
			slot0.arrow_img:setVisible(false)
			slot0.attr_val1:setVisible(false)
			slot0.attr_val:setTextColor(cc.c4b(36, 144, 3, 255))
			slot0.attr_val:setPositionX(275)
		end
	end
end

function HorcruxAttrItem2.DeleteMe(slot0)
	slot0:removeAllChildren()
end
