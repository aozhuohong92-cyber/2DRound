PartnerComboDetailView = PartnerComboDetailView or BaseClass(BaseView)
slot1 = PartnerComboCtrl:getInstance():getModel()
slot2 = string.format
slot3 = table.insert

function PartnerComboDetailView.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Big
	slot0.layout_name = "partnercombo/ui_partner_combo_detail_view"
	slot0.res_list = {}
	slot0.unactivated = false
	slot0.max_level = false
	slot0.hero_item_list = {}
	slot0.cost_item_list = {}
	slot0.attr_item_list = {}
	slot0.selected_hero_id = {}
	slot0.default_materials = {
		{
			10051,
			0
		},
		{
			10052,
			0
		}
	}
end

function PartnerComboDetailView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N(""))

	slot0.title1 = slot0.main_container:getChildByName("title1")
	slot0.title2 = slot0.main_container:getChildByName("title2")

	slot0.title1:enableOutline(cc.c3b(0, 0, 0), 2)
	slot0.title2:enableOutline(cc.c3b(0, 0, 0), 2)
	slot0.title1:setString(TI18N("解锁材料"))
	slot0.title2:setString(TI18N("升级属性"))

	slot0.card_pic = slot0.main_container:getChildByName("card_pic")
	slot0.item_layout = slot0.main_container:getChildByName("item_layout")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.upgrade_btn = slot0.main_container:getChildByName("upgrade_btn")
	slot0.upgrade_btn_lb = slot0.upgrade_btn:getChildByName("label")

	slot0.upgrade_btn_lb:setFontSize(24)

	slot4 = cc.c3b(0, 0, 0)

	slot0.upgrade_btn_lb:enableOutline(slot4, 2)

	for slot4 = 1, 2 do
		slot0.cost_item_list[slot4] = {
			bg = slot0.main_container:getChildByName(uv0("cost_bg%d", slot4)),
			icon = slot0.main_container:getChildByName(uv0("cost_icon%d", slot4))
		}

		slot0.cost_item_list[slot4].icon:setScale(0.5)

		slot0.cost_item_list[slot4].label = slot0.main_container:getChildByName(uv0("cost_lb%d", slot4))
		slot0.cost_item_list[slot4].add_btn = slot0.main_container:getChildByName(uv0("add_btn%d", slot4))
	end

	slot0.level_lb = createRichLabel(24, 175, cc.p(0, 0.5), cc.p(35, 150), nil, , 170)

	slot0.level_lb:setString(TI18N("等级:"))

	slot5 = slot0.level_lb

	slot0.main_container:getChildByName("attr_layout"):addChild(slot5)

	for slot5 = 1, 4 do
		slot0.attr_item_list[slot5] = {
			bg = slot1:getChildByName(uv0("attr_bg%d", slot5))
		}

		slot0.attr_item_list[slot5].bg:setVisible(false)

		slot0.attr_item_list[slot5].icon = slot1:getChildByName(uv0("attr_icon%d", slot5))

		slot0.attr_item_list[slot5].icon:setVisible(false)

		slot0.attr_item_list[slot5].label = createRichLabel(22, 175, cc.p(0, 0.5), cc.p(50, 17), nil, , 210)

		slot0.attr_item_list[slot5].bg:addChild(slot0.attr_item_list[slot5].label)
		slot0.attr_item_list[slot5].label:setString("")
	end
end

function PartnerComboDetailView.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.upgrade_btn, handler(slot0, slot0.onClickUpgradeBtn), true, 2)

	slot4 = HeroEvent.PARTNER_COMBO_SELECTED_RESULT

	function slot5(slot0, slot1)
		uv0:_selectHeroResult(slot0, slot1)
	end

	slot0:addGlobalEvent(slot4, slot5)

	for slot4, slot5 in pairs(slot0.cost_item_list) do
		registerButtonEventListener(slot5.add_btn, function ()
			uv0:onClickAddBtn(uv1)
		end, true, 2)
	end
end

function PartnerComboDetailView.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.title:setString(slot1.name)

	slot2 = PathTool.getPlistImgForDownLoad("hero/photo", slot1.desc, false)

	if slot0.card_pic_load then
		slot0.card_pic_load:DeleteMe()

		slot0.card_pic_load = nil
	end

	slot0.card_pic_load = loadImageTextureFromCDN(slot0.card_pic, slot2, ResourcesType.single, slot0.card_pic_load)
	slot4 = Config.PartnerCatalogData.data_get_update
	slot5 = {}

	if uv0:getActivetedLevel(slot0.data.gid) == 0 then
		slot0.unactivated = true
	else
		slot5 = slot4[uv1("%d_%d", slot0.data.gid, slot3)]
	end

	if not slot4[uv1("%d_%d", slot0.data.gid, slot3 + 1)] then
		slot0.max_level = true
		slot7 = slot4[uv1("%d_%d", slot0.data.gid, slot3 - 1)]
	end

	if not slot7 then
		return
	end

	if slot0.max_level then
		slot0.level_lb:setString(TI18N("等级:已满"))
	else
		slot0.level_lb:setString(uv1("等级: %d <div fontcolor=#249003> <img src=%s scale=1 visible=true />  %d</div>", slot7.lev - 1, PathTool.getResFrame("common", "common_90017"), slot7.lev))
	end

	for slot11 = 1, 2 do
		if not slot7.materials[slot11] or not slot12[slot11] or slot0.max_level then
			slot12 = slot0.default_materials[slot11]
		end

		print(slot12[1])
		loadSpriteTexture(slot0.cost_item_list[slot11].icon, PathTool.getItemRes(Config.ItemData.data_get_data(slot12[1]).icon, false), LOADTEXT_TYPE)

		if slot12[2] <= BackpackController:getInstance():getModel():getItemNumByBid(slot12[1]) then
			slot0.cost_item_list[slot11].label:setTextColor(cc.c4b(58, 226, 45, 255))
		else
			slot0.cost_item_list[slot11].label:setTextColor(cc.c4b(255, 13, 13, 255))
		end

		slot0.cost_item_list[slot11].label:setString(uv1("%d/%d", slot15, slot12[2]))

		slot0.cost_item_list[slot11].have_count = slot15
		slot0.cost_item_list[slot11].cost_count = slot12[2]
		slot0.cost_item_list[slot11].cost_id = slot12[1]
	end

	for slot11, slot12 in ipairs(slot7.effect) do
		if slot11 > 4 then
			break
		end

		slot0.attr_item_list[slot11].bg:setVisible(true)
		slot0.attr_item_list[slot11].icon:setVisible(true)
		loadSpriteTexture(slot0.attr_item_list[slot11].icon, PathTool.getResFrame("common", PathTool.getAttrIconByStr(slot12[1])), LOADTEXT_TYPE_PLIST)

		slot15 = Config.AttrData.data_key_to_name[slot12[1]]

		if uv2.isShowPerByStr(slot12[1]) then
			slot16 = (slot12[2] or 0) / 10 .. "%"
		end

		slot18 = ""

		if slot0.unactivated then
			slot18 = uv1("%s：0 <div fontcolor=#249003>+ %s</div>", slot15, slot16)
		elseif slot0.max_level then
			slot18 = uv1("%s：%s", slot15, slot16)
		else
			slot19 = slot5.effect[slot11]

			if uv2.isShowPerByStr(slot19[1]) then
				slot20 = deepCopy(slot19[2]) / 10 .. "%"
				slot21 = (slot12[2] - slot19[2]) / 10 .. "%"
			end

			slot18 = uv1("%s：%s <div fontcolor=#249003>+ %s</div>", slot15, slot20, slot21)
		end

		slot0.attr_item_list[slot11].label:setString(slot18)
	end

	slot8 = slot0.item_layout:getContentSize()

	for slot12, slot13 in ipairs(slot7.cards) do
		slot0.selected_hero_id[slot12] = 0
		slot0.hero_item_list[slot12] = HeroExhibitionItem.new(0.8, true)

		slot0.hero_item_list[slot12]:setPosition((slot12 - 1) * (HeroExhibitionItem.Width * 0.8 + 15) + HeroExhibitionItem.Width * 0.8 / 2 + 15, slot8.height * 0.5)
		slot0.hero_item_list[slot12]:addCallBack(function ()
			uv0:_onClickItemData(uv1)
		end)
		slot0.item_layout:addChild(slot0.hero_item_list[slot12])

		slot16 = slot0:imitateHeroVo(slot13[1], slot13[2])

		slot0.hero_item_list[slot12]:setData(slot16)
		slot0.hero_item_list[slot12]:setHeroName(true, slot16.name, {
			color = cc.c4b(0, 0, 0, 255)
		})
		slot0.hero_item_list[slot12]:setHeadUnEnabled(not slot0.max_level)

		if uv0:getMeetConditionsHeroList()[slot0.data.gid] and slot17[slot0.data.gid][slot14] and slot13[2] <= #slot17[slot0.data.gid][slot14] then
			slot0.hero_item_list[slot12]:showRedPoint(true, 8, 8)
		else
			slot0.hero_item_list[slot12]:showRedPoint(false)
		end
	end

	slot9 = #slot0.hero_item_list

	slot0.item_layout:setContentSize(cc.size(HeroExhibitionItem.Width * 0.8 * slot9 + slot9 * 15 + 15, slot8.height))

	if slot0.max_level then
		slot0.upgrade_btn_lb:setString(TI18N("已满"))
		setChildUnEnabled(true, slot0.upgrade_btn)
	elseif slot0.unactivated then
		slot0.upgrade_btn_lb:setString(TI18N("激活"))
		setChildUnEnabled(false, slot0.upgrade_btn)
	else
		slot0.upgrade_btn_lb:setString(TI18N("升级"))
		setChildUnEnabled(false, slot0.upgrade_btn)
	end
end

function PartnerComboDetailView.onClickAddBtn(slot0, slot1)
	slot3 = Config.ItemData.data_get_data(slot0.default_materials[slot1][1])
end

function PartnerComboDetailView.onClickUpgradeBtn(slot0)
	if slot0.max_level then
		return
	end

	slot1 = true
	slot3 = {}
	slot5 = Config.PartnerCatalogData.data_get_update
	slot6 = {}
	slot7 = 0

	for slot11, slot12 in ipairs((slot5[(uv0:getActivetedLevel(slot0.data.gid) ~= 0 or uv1("%d_%d", slot0.data.gid, slot4 + 1)) and uv1("%d_%d", slot0.data.gid, slot4 + 1)] or slot5[uv1("%d_%d", slot0.data.gid, slot4)]).cards) do
		uv2({}, {
			partner_bid = slot12[1]
		})
	end

	for slot11, slot12 in ipairs(slot0.selected_hero_id) do
		slot2[slot11].expend1 = {}

		uv2(slot2[slot11].expend1, {
			partner_id = slot12
		})

		if slot12 == 0 then
			slot1 = false

			break
		end
	end

	if not slot1 then
		message(TI18N("请先选择英雄"))

		return
	end

	for slot11, slot12 in ipairs(slot0.cost_item_list) do
		if slot12.have_count < slot12.cost_count then
			BackpackController:getInstance():openSourceTipsVIew(true, slot12.cost_id)
			message(TI18N(uv1("%s不足", Config.ItemData.data_get_data(slot12.cost_id).name)))

			return
		end
	end

	uv3:sender18101(slot0.data.gid, slot2)
end

function PartnerComboDetailView._onClickItemData(slot0, slot1)
	if slot0.max_level then
		return
	end

	slot3 = slot0.hero_item_list[slot1]:getData().bid
	slot4 = {}

	if uv0:getMeetConditionsHeroList()[slot0.data.gid] and slot5[slot0.data.gid][slot3] then
		slot4 = deepCopy(slot5[slot0.data.gid][slot3])
	end

	if uv0:getNotMeetConditionsHeroList()[slot0.data.gid] and slot6[slot0.data.gid][slot3] then
		for slot10, slot11 in ipairs(slot6[slot0.data.gid][slot3]) do
			uv1(slot4, slot11)
		end
	end

	uv2:openPartnerComboSelectView(true, slot4, slot0.selected_hero_id[slot1], slot1)
end

function PartnerComboDetailView._selectHeroResult(slot0, slot1, slot2)
	slot0.selected_hero_id[slot1] = slot2

	slot0.hero_item_list[slot1]:setHeadUnEnabled(false)
	slot0.hero_item_list[slot1]:showRedPoint(false)
	slot0.hero_item_list[slot1].num_label:setString("1/1")
end

function PartnerComboDetailView.imitateHeroVo(slot0, slot1, slot2)
	if Config.PartnerData.data_partner_base[slot1] then
		if not slot0.max_level then
			-- Nothing
		end
	else
		return nil
	end

	return {
		bid = slot1,
		star = slot3.init_star,
		camp_type = slot3.camp_type,
		name = slot3.name,
		count = slot2 or 0,
		lev = uv0("%s/%s", 0, slot2)
	}
end

function PartnerComboDetailView.onClickCloseBtn(slot0)
	uv0:openPartnerComboDetailView(false)
end

function PartnerComboDetailView.close_callback(slot0)
	doStopAllActions(slot0.background)

	if slot0.card_pic_load then
		slot0.card_pic_load:DeleteMe()

		slot0.card_pic_load = nil
	end

	if slot0.hero_item_list then
		for slot4, slot5 in ipairs(slot0.hero_item_list) do
			slot5:DeleteMe()
		end

		slot0.hero_item_list = nil
	end

	uv0:openPartnerComboDetailView(false)
end
