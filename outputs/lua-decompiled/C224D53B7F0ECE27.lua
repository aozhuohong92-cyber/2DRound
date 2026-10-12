FruitTreasureCultivateView = FruitTreasureCultivateView or BaseClass(BaseView)
slot1 = FruitTreasureController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot5 = HeroController:getInstance():getModel()

function FruitTreasureCultivateView.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "fruit_treasure/fruit_cultivate_view"
	slot0.lv_cost_item = {}
	slot0.lv_cost_num = {}
	slot0.star_cost_item = {}
	slot0.star_cost_num = {}
	slot0.lv_node_list = {}
	slot0.cost_partners = {}
	slot0.cost_max = 0
	slot0.tab_list = {}
	slot0.cur_tab_index = FruitTreasureConst.CultivateType.Lv
	slot0.islock = false
end

function FruitTreasureCultivateView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.n_ui = slot0.root_wnd:getChildByName("n_ui")
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.n_ui, 1)
	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot0.n_ui:getChildByName("n_title"):getChildByName("t_title"):setString(TI18N("果实强化"))

	slot0.btn_close = slot0.n_ui:getChildByName("b_close")
	slot0.base_panel = slot0.n_ui:getChildByName("n_base")
	slot0.cur_item = slot0.base_panel:getChildByName("n_cur_item")
	slot0.next_item = slot0.base_panel:getChildByName("n_next_item")
	slot0.cur_lv = slot0.cur_item:getChildByName("lv_bg"):getChildByName("num")
	slot0.next_lv = slot0.next_item:getChildByName("lv_bg"):getChildByName("num")
	slot0.cur_name = slot0.base_panel:getChildByName("n_name"):getChildByName("txt")
	slot0.next_name = slot0.base_panel:getChildByName("n_name_next"):getChildByName("txt")
	slot0.lvup_panel = slot0.main_container:getChildByName("lvcontainer")
	slot0.lvup_btn = slot0.lvup_panel:getChildByName("lvup_btn")
	slot0.starup_panel = slot0.main_container:getChildByName("starcontainer")
	slot0.starup_btn = slot0.starup_panel:getChildByName("star_btn")
	slot0.preview_node = slot0.starup_panel:getChildByName("btn_node")
	slot0.lv_list_1 = slot0.lvup_panel:getChildByName("attr_1")
	slot0.lv_list_2 = slot0.lvup_panel:getChildByName("attr_2")
	slot0.lv_node_list[1] = slot0.lvup_panel:getChildByName("node_txt_1")
	slot0.lv_node_list[2] = slot0.lvup_panel:getChildByName("node_txt_2")
	slot0.lv_node_list[3] = slot0.lvup_panel:getChildByName("node_txt_3")
	slot0.lv_cost_node = slot0.lvup_panel:getChildByName("cost_panel")
	slot0.lv_cost_txt = slot0.lvup_panel:getChildByName("cost_txt")
	slot0.no_node_text = slot0.lvup_panel:getChildByName("no_node_text")
	slot0.lv_cost_item[1] = BackPackItem.new(true, true, nil, 1, false)

	slot0.lv_cost_item[1]:setPosition(cc.p(59.5, 59.5))

	slot0.lv_cost_item[2] = BackPackItem.new(true, true, nil, 1, false)

	slot0.lv_cost_item[2]:setPosition(cc.p(59.5, 59.5))
	slot0.lv_cost_node:getChildByName("item_cost_1"):addChild(slot0.lv_cost_item[1])
	slot0.lv_cost_node:getChildByName("item_cost_2"):addChild(slot0.lv_cost_item[2])

	slot0.lv_cost_num[1] = slot0.lv_cost_node:getChildByName("num_cost_1")
	slot0.lv_cost_num[2] = slot0.lv_cost_node:getChildByName("num_cost_2")
	slot0.star_list_1 = slot0.starup_panel:getChildByName("attr_1")
	slot0.star_list_2 = slot0.starup_panel:getChildByName("attr_2")
	slot0.star_list_3 = slot0.starup_panel:getChildByName("attr_3")
	slot0.star_node_txt000 = slot0.starup_panel:getChildByName("attr_txt")

	slot0.star_node_txt000:setVisible(false)

	slot0.star_node_txt = createRichLabel(22, cc.c3b(149, 83, 34), cc.p(0, 0.5), cc.p(45, 280), nil, nil, 600)

	slot0.starup_panel:addChild(slot0.star_node_txt)

	slot0.star_cost_node = slot0.starup_panel:getChildByName("cost_panel")
	slot0.star_cost_txt = slot0.starup_panel:getChildByName("cost_txt")
	slot0.star_cost_2 = slot0.star_cost_node:getChildByName("item_cost_2")
	slot0.star_cost_item[1] = BackPackItem.new(true, true, nil, 1, false)

	slot0.star_cost_item[1]:setPosition(cc.p(59.5, 59.5))
	slot0.star_cost_node:getChildByName("item_cost_1"):addChild(slot0.star_cost_item[1])

	slot0.star_cost_num[1] = slot0.star_cost_node:getChildByName("num_cost_1")
	slot0.star_cost_num[2] = slot0.star_cost_node:getChildByName("num_cost_2")

	slot0.star_cost_num[2]:setVisible(false)

	slot0.goods_item_1 = BackPackItem.new(true, true, nil, 1, false)

	slot0.goods_item_1:setPosition(cc.p(59.5, 59.5))

	slot11 = nil
	slot0.goods_item_2 = BackPackItem.new(true, true, slot11, 1, false)

	slot0.goods_item_2:setPosition(cc.p(59.5, 59.5))
	slot0.cur_item:getChildByName("item"):addChild(slot0.goods_item_1)
	slot0.next_item:getChildByName("item"):addChild(slot0.goods_item_2)

	slot0.preview_txt = slot0.starup_panel:getChildByName("preview_txt")

	slot0.preview_txt:setString(TI18N("下级效果预览"))
	slot0.preview_txt:addTouchEventListener(function ()
		uv0:openPropTips(true)
	end)

	for slot11 = 1, 2 do
		slot12 = {}

		if slot0.main_container:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot11) then
			slot13:loadTextures(PathTool.getResFrame("common", "common_90030"), "", "", LOADTEXT_TYPE_PLIST)

			if slot11 == 1 then
				slot13:getChildByName("title"):setString(TI18N("升级"))
			elseif slot11 == 2 then
				slot14:setString(TI18N("升星"))
			end

			slot12.tab_btn = slot13
			slot12.label = slot14

			slot12.label:setTextColor(cc.c3b(255, 244, 228))

			slot12.index = slot11
			slot12.tips = slot13:getChildByName("tips")
			slot0.tab_list[slot11] = slot12
		end
	end
end

function FruitTreasureCultivateView.register_event(slot0)
	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:clickTopBtn(uv1.index)
				end
			end)
		end
	end

	registerButtonEventListener(slot0.background, function ()
		uv0:onClickCloseBtn()
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:onClickCloseBtn()
	end, true, 2)
	registerButtonEventListener(slot0.lvup_btn, function ()
		uv0:onClickLvUpBtn()
	end, true, 1)
	registerButtonEventListener(slot0.starup_btn, function ()
		uv0:onClickStarUpBtn()
	end, true, 1)
	slot0:addGlobalEvent(FruitTreasureEvent.UpdateFruitTreasureLv, function (slot0)
		uv0:setNextLevel(slot0)
	end)
	slot0:addGlobalEvent(FruitTreasureEvent.UpdateFruitTreasureStar, function (slot0)
		uv0:setNextStar(slot0)
	end)
	slot0:addGlobalEvent(FruitTreasureEvent.UpdateFruitTreasureAll, function (slot0)
		uv0:initData()
		uv1:send29605(uv0.data.id)
		uv1:send29606(uv0.data.id)
	end)
	slot0:addGlobalEvent(HeroEvent.Upgrade_Fruit_Select_Event, function (slot0)
		uv0:updateHeroItem(slot0)
	end)
	slot0:addGlobalEvent(FruitTreasureEvent.UpdateFruitTreasureRed, function (slot0, slot1)
		uv0:updateTabBtnRedStatus()
	end)
end

function FruitTreasureCultivateView.clickTopBtn(slot0, slot1, slot2)
	if slot0.islock then
		return
	end

	if not slot2 and slot0.cur_tab_index and slot0.cur_tab_index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.tab_btn:loadTextures(PathTool.getResFrame("common", "common_90030"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.label:setTextColor(cc.c3b(255, 244, 228))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.tab_btn:loadTextures(PathTool.getResFrame("common", "common_90031"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.label:setTextColor(cc.c3b(100, 50, 35))
	end

	slot0.cur_tab_index = slot1

	if slot1 == FruitTreasureConst.CultivateType.Lv then
		if slot0.lvup_panel then
			slot0.lvup_panel:setVisible(true)
		end

		if slot0.starup_panel then
			slot0.starup_panel:setVisible(false)
		end

		if slot0.data and slot0.data.id then
			uv0:send29605(slot0.data.id)
		end
	elseif slot1 == FruitTreasureConst.CultivateType.Star then
		if slot0.lvup_panel then
			slot0.lvup_panel:setVisible(false)
		end

		if slot0.starup_panel then
			slot0.starup_panel:setVisible(true)
		end

		if slot0.data and slot0.data.id then
			uv0:send29606(slot0.data.id)
		end
	end

	slot0:setBaseAttrInfo()
end

function FruitTreasureCultivateView.onClickCloseBtn(slot0)
	uv0:openFruitTreasureCultivateView(false)
end

function FruitTreasureCultivateView.onClickLvUpBtn(slot0)
	if not slot0.data then
		return
	end

	uv0:send29601(slot0.data.id)
end

function FruitTreasureCultivateView.onClickStarUpBtn(slot0)
	if not slot0.data then
		return
	end

	uv0:send29602(slot0.data.id, slot0.cost_partners)

	slot0.cost_partners = {}
end

function FruitTreasureCultivateView.openRootWnd(slot0)
	if not uv0.cultivateData then
		return
	end

	slot0.data = uv0.cultivateData
	slot0.cur_tab_index = uv0.cultivateType or FruitTreasureConst.CultivateType.Lv

	slot0:clickTopBtn(slot0.cur_tab_index, true)
	slot0:initData()
end

function FruitTreasureCultivateView.initData(slot0)
	if not slot0.data then
		return
	end

	slot0.goods_item_1:setBaseData(slot0.data.piece_id)
	slot0.goods_item_2:setBaseData(slot0.data.piece_id)
	uv0:createStar(slot0.data.star, slot0.goods_item_1, uv0:getStarMax(slot0.data.type))

	slot2 = {
		type = BackPackConst.item_type.NORMAL
	}

	slot0.goods_item_1:isChipSprite(slot2)
	slot0.goods_item_2:isChipSprite(slot2)
	slot0.cur_name:setString(slot0.data.name)
	slot0.next_name:setString(slot0.data.name)
	slot0.cur_lv:setString(slot0.data.lev)
	slot0:setBaseAttrInfo()
	slot0:updateCostInfo()

	slot3 = uv0:getLvUpCost(slot0.data.type, slot0.data.lev)

	registerButtonEventListener(slot0.lv_cost_item[1], function ()
		if uv0.expend then
			TipsManager:getInstance():showGoodsTips(uv0.expend[1][1])
		end
	end, true, 1)
	registerButtonEventListener(slot0.lv_cost_item[2], function ()
		if uv0.expend then
			TipsManager:getInstance():showGoodsTips(uv0.expend[2][1])
		end
	end, true, 1)
	registerButtonEventListener(slot0.star_cost_item[1], function ()
		TipsManager:getInstance():showGoodsTips(uv0.data.piece_id)
	end, true, 1)
	slot0:updateTabBtnRedStatus()
end

function FruitTreasureCultivateView.setBaseAttrInfo(slot0)
	if not slot0.data then
		return
	end

	slot1 = slot0.data.lev + 1

	if slot0.cur_tab_index == FruitTreasureConst.CultivateType.Star then
		slot1 = slot0.data.lev
	end

	if uv0:getLvMax(slot0.data.type) < slot1 then
		slot1 = uv0:getLvMax(slot0.data.type)
	end

	slot0.next_lv:setString(slot1)

	slot2 = uv0:getStarMax(slot0.data.type)
	slot3 = slot0.data.star + 1

	if slot0.cur_tab_index == FruitTreasureConst.CultivateType.Lv then
		slot3 = slot0.data.star
	end

	if slot2 < slot3 then
		slot3 = slot2
	end

	uv0:createStar(slot3, slot0.goods_item_2, slot2)
end

function FruitTreasureCultivateView.updateCostInfo(slot0)
	if not slot0.data then
		return
	end

	if uv0:getLvUpCost(slot0.data.type, slot0.data.lev) and slot1.expend then
		slot0.lv_cost_node:setVisible(true)

		slot5 = false

		slot0.lv_cost_txt:setVisible(slot5)

		for slot5, slot6 in pairs(slot1.expend) do
			slot7 = slot6[1]
			slot8 = slot6[2]

			slot0.lv_cost_item[slot5]:setBaseData(slot7)

			slot9 = BackpackController:getInstance():getModel():getItemNumByBid(slot7)

			slot0.lv_cost_num[slot5]:setString(MoneyTool.GetMoneyString(slot9) .. "/" .. MoneyTool.GetMoneyString(slot8))

			if slot8 <= slot9 then
				slot0.lv_cost_num[slot5]:setTextColor(cc.c3b(149, 83, 34))
			else
				slot0.lv_cost_num[slot5]:setTextColor(cc.c3b(253, 71, 71))
			end
		end
	else
		slot0.lv_cost_node:setVisible(false)
		slot0.lv_cost_txt:setVisible(true)
	end

	if uv0:getStarUpCost(slot0.data.type, slot0.data.star) and slot2.cost_hero then
		slot0.star_cost_node:setVisible(true)
		slot0.star_cost_txt:setVisible(false)

		slot3 = slot0.data.piece_id
		slot4 = slot2.cost_piece

		slot0.star_cost_item[1]:setBaseData(slot3)

		slot5 = BackpackController:getInstance():getModel():getItemNumByBid(slot3)

		slot0.star_cost_num[1]:setString(MoneyTool.GetMoneyString(slot5) .. "/" .. MoneyTool.GetMoneyString(slot4))

		if slot4 <= slot5 then
			slot0.star_cost_num[1]:setTextColor(cc.c3b(149, 83, 34))
		else
			slot0.star_cost_num[1]:setTextColor(cc.c3b(253, 71, 71))
		end

		slot0:updateItemDataByConfig(slot2.cost_hero)
	else
		slot0.star_cost_node:setVisible(false)
		slot0.star_cost_txt:setVisible(true)
	end
end

function FruitTreasureCultivateView.setNextLevel(slot0, slot1)
	if not slot0.data then
		return
	end

	slot0.lv_list_1:getChildByName("icon"):loadTexture(PathTool.getResFrame("commom", PathTool.getAttrIconByStr(slot0.data.main_attr)), LOADTEXT_TYPE_PLIST)
	slot0.lv_list_2:getChildByName("icon"):loadTexture(PathTool.getResFrame("commom", PathTool.getAttrIconByStr(slot0.data.second_attr)), LOADTEXT_TYPE_PLIST)
	slot0.lv_list_1:getChildByName("txt"):setString(Config.AttrData.data_key_to_name[slot0.data.main_attr])
	slot0.lv_list_2:getChildByName("txt"):setString(Config.AttrData.data_key_to_name[slot0.data.second_attr])
	slot0.lv_list_1:getChildByName("attr_last"):setString(uv0:getAttrByKey(slot0.data.main_attr, slot0.data.attrs))
	slot0.lv_list_2:getChildByName("attr_last"):setString(uv0:getAttrByKey(slot0.data.second_attr, slot0.data.attrs))
	slot0.lv_list_1:getChildByName("attr_next"):setString(uv0:getAttrByKey(slot0.data.main_attr, slot1.attrs))

	slot17 = uv0
	slot19 = slot17

	slot0.lv_list_2:getChildByName("attr_next"):setString(slot17.getAttrByKey(slot19, slot0.data.second_attr, slot1.attrs))

	slot14 = uv0:getNodeList(slot0.data.type)
	slot15 = 0

	for slot19 = 1, 3 do
		if slot14[slot19] then
			slot0.lv_node_list[slot19]:setVisible(true)
			slot0.lv_node_list[slot19]:setString(slot14[slot19].desc)

			if slot14[slot19].lev <= slot0.data.lev then
				slot0.lv_node_list[slot19]:setTextColor(cc.c3b(36, 144, 3))
			else
				slot0.lv_node_list[slot19]:setTextColor(cc.c3b(255, 238, 194))
			end

			slot15 = slot15 + 1
		else
			slot0.lv_node_list[slot19]:setVisible(false)
		end
	end

	if slot15 == 0 then
		slot0.no_node_text:setVisible(true)
	else
		slot0.no_node_text:setVisible(false)
	end

	if not uv0:getLvUpCost(slot0.data.type, slot0.data.lev) or not slot16.expend then
		slot0.lv_list_1:getChildByName("attr_next"):setString(TI18N("已满级"))
		slot0.lv_list_2:getChildByName("attr_next"):setString(TI18N("已满级"))
	end
end

function FruitTreasureCultivateView.setNextStar(slot0, slot1)
	if not slot0.data then
		return
	end

	slot12 = slot0.star_list_3:getChildByName("attr_next")

	slot0.star_list_1:getChildByName("icon"):loadTexture(PathTool.getResFrame("commom", PathTool.getAttrIconByStr(slot0.data.main_attr)), LOADTEXT_TYPE_PLIST)
	slot0.star_list_2:getChildByName("icon"):loadTexture(PathTool.getResFrame("commom", PathTool.getAttrIconByStr(slot0.data.second_attr)), LOADTEXT_TYPE_PLIST)
	slot0.star_list_1:getChildByName("txt"):setString(Config.AttrData.data_key_to_name[slot0.data.main_attr])
	slot0.star_list_2:getChildByName("txt"):setString(Config.AttrData.data_key_to_name[slot0.data.second_attr])
	slot0.star_list_3:getChildByName("txt"):setString(TI18N("等级上限"))
	slot0.star_list_1:getChildByName("attr_last"):setString(uv0:getAttrByKey(slot0.data.main_attr, slot0.data.attrs))
	slot0.star_list_2:getChildByName("attr_last"):setString(uv0:getAttrByKey(slot0.data.second_attr, slot0.data.attrs))
	slot0.star_list_1:getChildByName("attr_next"):setString(uv0:getAttrByKey(slot0.data.main_attr, slot1.attrs))
	slot0.star_list_2:getChildByName("attr_next"):setString(uv0:getAttrByKey(slot0.data.second_attr, slot1.attrs))
	slot0.star_list_3:getChildByName("attr_last"):setString(uv0:getMaxLvByStar(slot0.data.type, slot0.data.star))

	if uv0:getStarMax(slot0.data.type) <= slot0.data.star + 1 then
		slot18 = slot19
	end

	slot12:setString(uv0:getMaxLvByStar(slot0.data.type, slot18))
	slot0.star_node_txt:setString(uv0:getExStr(slot0.data.id, slot18))
	slot0:updateTabBtnRedStatus()

	if not uv0:getStarUpCost(slot0.data.type, slot0.data.star) or not slot22.cost_hero then
		slot0.star_list_1:getChildByName("attr_next"):setString(TI18N("已满星"))
		slot0.star_list_2:getChildByName("attr_next"):setString(TI18N("已满星"))
		slot0.star_list_3:getChildByName("attr_next"):setString(TI18N("已满星"))
		slot0.star_node_txt:setString(uv1("%s (%s)", slot0.star_node_txt:getString(), uv1("<div fontcolor=%s> %s</div>", "#249003", TI18N("已满星"))))
	end
end

function FruitTreasureCultivateView.updateItemDataByConfig(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.hero_item_data_list = {}
	slot0.dic_other_selected = {}
	slot3 = uv0
	slot5 = slot3
	slot6 = nil
	slot0.hero_item_data_list[1] = slot3.getHeroData(slot5, slot6, slot1[1], slot1[2], 0)
	slot0.cost_max = slot1[2]

	for slot5, slot6 in ipairs(slot0.hero_item_data_list) do
		if slot0.star_cost_item[2] == nil then
			slot0.star_cost_item[2] = HeroExhibitionItem.new(1, true)

			slot0.star_cost_item[2]:setPosition(cc.p(59.5, 59.5))
			slot0.star_cost_item[2]:addCallBack(function ()
				uv0:_onClickItemData(uv1)
			end)
			slot0.star_cost_2:addChild(slot0.star_cost_item[2])
		end

		slot0.star_cost_item[2]:setVisible(true)

		if slot6.bid == 0 then
			slot0.star_cost_item[2]:setData(slot6)
			slot0.star_cost_item[2]:setDefaultHead(uv1:getRandomHeroHeadByQuality(slot6.star))
			slot0.star_cost_item[2]:setHeroName(true, uv2(TI18N("%s星武将"), slot6.star))
		else
			slot0.star_cost_item[2]:setData(slot6)
			slot0.star_cost_item[2]:setHeroName(true, slot6.name)
		end

		slot0.star_cost_item[2]:setHeadUnEnabled(true)
	end
end

function FruitTreasureCultivateView._onClickItemData(slot0, slot1)
	if not slot0.hero_item_data_list[slot1] then
		return
	end

	slot0.hero_item_data_list[slot1].is_select = true
	slot2 = {}

	for slot6, slot7 in ipairs(slot0.hero_item_data_list) do
		if slot6 ~= slot1 then
			for slot11, slot12 in pairs(slot7.dic_select_list) do
				slot2[slot11] = slot12
			end
		end
	end

	uv0:openHeroUpgradeStarSelectPanel(true, slot0.hero_item_data_list[slot1], slot2, HeroConst.SelectHeroType.eFruitTreasure, {})
end

function FruitTreasureCultivateView.updateHeroItem(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.cost_partners = {}

	for slot5, slot6 in pairs(slot1) do
		if slot6.partner_id then
			table.insert(slot0.cost_partners, {
				partner_id = slot6.partner_id
			})
		end
	end

	slot0.star_cost_item[2].num_label:setString(uv0("%s/%s", #slot0.cost_partners, slot0.cost_max))
end

function FruitTreasureCultivateView.updateTabBtnRedStatus(slot0)
	for slot4, slot5 in ipairs(slot0.tab_list) do
		slot6 = false

		if slot5.index == 1 then
			slot6 = uv0:getFruitTreasureRedStatus(slot0.data.id, FruitTreasureConst.RedType.Lv)
		elseif slot5.index == 2 then
			slot6 = uv0:getFruitTreasureRedStatus(slot0.data.id, FruitTreasureConst.RedType.Star)
		end

		if slot5.tips then
			slot5.tips:setVisible(slot6)
		end
	end
end

function FruitTreasureCultivateView.close_callback(slot0)
	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end

	if slot0.item_update_event ~= nil then
		slot0.data:UnBind(slot0.item_update_event)

		slot0.item_update_event = nil
	end

	uv0:openFruitTreasureCultivateView(false)
end
