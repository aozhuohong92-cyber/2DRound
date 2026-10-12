slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
HeroSkinUpgradeWindow = HeroSkinUpgradeWindow or BaseClass(BaseView)

function HeroSkinUpgradeWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "hero/hero_skin_upgrade_window"
end

function HeroSkinUpgradeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.arrow_sp_1 = slot0.container:getChildByName("arrow_sp_1")

	slot0.arrow_sp_1:setVisible(false)

	slot0.arrow_sp_2 = slot0.container:getChildByName("arrow_sp_2")

	slot0.arrow_sp_2:setVisible(false)

	slot0.btn_close = slot0.container:getChildByName("btn_close")
	slot0.compound_btn = slot0.container:getChildByName("compound_btn")

	slot0.compound_btn:getChildByName("label"):setString(TI18N("升级"))
	slot0.compound_btn:getChildByName("label"):enableOutline(cc.c3b(0, 0, 0), 2)
	slot0.container:getChildByName("win_title"):setString(TI18N("升级"))
	slot0.container:getChildByName("com_title"):setString(TI18N("皮肤升级"))
	slot0.container:getChildByName("cost_title"):setString(TI18N("升级消耗"))
	slot0.container:getChildByName("com_tips"):setString(TI18N("皮肤升级后技能变化"))

	slot0.skill_type_1 = slot0.container:getChildByName("skill_type_1")
	slot0.skill_name_1 = slot0.container:getChildByName("skill_name_1")
	slot0.skill_type_2 = slot0.container:getChildByName("skill_type_2")
	slot4 = "skill_name_2"
	slot0.skill_name_2 = slot0.container:getChildByName(slot4)
	slot0.cost_objects = {}

	for slot4 = 1, 2 do
		slot5 = {
			item_node = BackPackItem.new(false, true, false, 0.8, nil, true)
		}

		slot5.item_node:setPosition(cc.p(137 + (slot4 - 1) * 271, 170))
		slot0.container:addChild(slot5.item_node)

		slot5.cost_name = slot0.container:getChildByName("cost_name_" .. slot4)
		slot5.cost_num = slot0.container:getChildByName("cost_num_" .. slot4)

		uv0(slot0.cost_objects, slot5)
	end

	slot0.cur_skill_desc_scroll = createScrollView(350, 75, 282, 614, slot0.container, ccui.ScrollViewDir.vertical)
	slot0.next_skill_desc_scroll = createScrollView(350, 75, 282, 336, slot0.container, ccui.ScrollViewDir.vertical)
end

function HeroSkinUpgradeWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openHeroSkinUpgradeWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHeroSkinUpgradeWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.compound_btn, handler(slot0, slot0.onClickCompoundBtn), true)
end

function HeroSkinUpgradeWindow.onClickCompoundBtn(slot0)
	uv0:sender11021(slot0.hero_vo.partner_id, slot0.config.skin_id)
	uv0:openHeroSkinUpgradeWindow(false)
end

function HeroSkinUpgradeWindow.openRootWnd(slot0, slot1, slot2)
	slot0.config = slot1.config
	slot0.hero_vo = slot2
	slot0.next_config = Config.PartnerSkinData.data_skin_info[slot0.config.next_id]

	slot0:setData()
end

function HeroSkinUpgradeWindow.setData(slot0)
	if not slot0.config then
		return
	end

	if not slot0.next_config then
		return
	end

	slot3, slot4 = nil

	if Config.PartnerData.data_partner_star(getNorKey(slot0.config.bid, slot0.hero_vo.star)) == nil then
		return
	end

	for slot8, slot9 in ipairs(slot2.skills) do
		if slot9[1] ~= 1 and not slot3 and Config.PartnerSkinData.data_skilltonewskill[getNorKey(slot0.next_config.skin_id, slot9[2])] then
			slot3 = slot9[2]

			break
		end
	end

	if not slot3 or not slot4 then
		return
	end

	slot5 = PathTool.getHeadIcon(slot0.config.head_id)

	if not slot0.cur_skin_item then
		slot0.cur_skin_item = BackPackItem.new(true, false)

		slot0.cur_skin_item:setPosition(cc.p(130, 720))
		slot0.container:addChild(slot0.cur_skin_item)
	end

	slot0.cur_skin_item:setItemIcon(slot5)

	for slot10, slot11 in ipairs(slot0.config.skin_attr) do
		slot12, slot13, slot14 = commonGetAttrInfoByKeyValue(slot11[1], slot11[2])
		slot6 = "" .. string.format("<img src='%s' scale=1 /> %s + %s", slot12, slot13, slot14) .. "    "
	end

	if not slot0.old_attr then
		slot0.old_attr = createRichLabel(20, cc.c3b(100, 50, 35), cc.p(0, 0.5), cc.p(70, 606), nil, , 99999)

		slot0.container:addChild(slot0.old_attr)
	end

	slot0.old_attr:setString(slot6)

	if not slot0.cur_skill then
		slot0.cur_skill = SkillItem.new(false, false, false, 0.7)

		slot0.cur_skill:setPosition(cc.p(320, 750))
		slot0.container:addChild(slot0.cur_skill)
	end

	if slot3 and Config.SkillData.data_get_skill(slot3) then
		slot0.cur_skill:setData(slot7)
		slot0.skill_name_1:setString(uv0("%s Lv.%d", slot7.name, slot7.level))

		if slot7.type == "active_skill" then
			slot0.skill_type_1:setString(TI18N("类型：主动技能"))
		else
			slot0.skill_type_1:setString(TI18N("类型：被动技能"))
		end

		if not slot0.cur_skill_desc_txt then
			slot0.cur_skill_desc_txt = createRichLabel(18, cc.c4b(154, 109, 77, 255), cc.p(0, 1), cc.p(0, 0), 5, nil, 350)

			slot0.cur_skill_desc_scroll:addChild(slot0.cur_skill_desc_txt)
		end

		slot0.cur_skill_desc_txt:setString(slot7.des)

		slot8 = slot0.cur_skill_desc_txt:getSize()
		slot9 = math.max(slot8.height, 85)

		slot0.cur_skill_desc_txt:setPositionY(slot9)
		slot0.cur_skill_desc_scroll:setInnerContainerSize(cc.size(slot0.cur_skill_desc_scroll:getContentSize().width, slot9))
		slot0.cur_skill_desc_scroll:setTouchEnabled(slot8.height > 85)
		slot0.arrow_sp_1:setVisible(slot8.height > 85)
	end

	slot8 = PathTool.getHeadIcon(slot0.next_config.head_id == 0 and slot0.config.head_id or slot0.next_config.head_id)

	if not slot0.next_skin_item then
		slot0.next_skin_item = BackPackItem.new(true, false)

		slot0.next_skin_item:setPosition(cc.p(130, 448))
		slot0.container:addChild(slot0.next_skin_item)
	end

	slot0.next_skin_item:setItemIcon(slot8)

	for slot13, slot14 in ipairs(slot0.next_config.skin_attr) do
		slot15, slot16, slot17 = commonGetAttrInfoByKeyValue(slot14[1], slot14[2])
		slot9 = "" .. string.format("<img src='%s' scale=1 /> %s + %s", slot15, slot16, slot17) .. "    "
	end

	if not slot0.new_attr then
		slot0.new_attr = createRichLabel(20, cc.c3b(100, 50, 35), cc.p(0, 0.5), cc.p(70, 330), nil, , 99999)

		slot0.container:addChild(slot0.new_attr)
	end

	slot0.new_attr:setString(slot9)

	if not slot0.next_skill then
		slot0.next_skill = SkillItem.new(false, false, false, 0.7)

		slot0.next_skill:setPosition(cc.p(320, 474))
		slot0.container:addChild(slot0.next_skill)
	end

	if slot4 and Config.SkillData.data_get_skill(slot4) then
		slot0.next_skill:setData(slot10)
		slot0.skill_name_2:setString(uv0("%s Lv.%d", slot10.name, slot10.level))

		if slot10.type == "active_skill" then
			slot0.skill_type_2:setString(TI18N("类型：主动技能"))
		else
			slot0.skill_type_2:setString(TI18N("类型：被动技能"))
		end

		if not slot0.next_skill_desc_txt then
			slot0.next_skill_desc_txt = createRichLabel(18, cc.c4b(154, 109, 77, 255), cc.p(0, 1), cc.p(0, 0), 5, nil, 350)

			slot0.next_skill_desc_scroll:addChild(slot0.next_skill_desc_txt)
		end

		slot0.next_skill_desc_txt:setString(slot10.des)

		slot11 = slot0.next_skill_desc_txt:getSize()
		slot12 = math.max(slot11.height, 85)

		slot0.next_skill_desc_txt:setPositionY(slot12)
		slot0.next_skill_desc_scroll:setInnerContainerSize(cc.size(slot0.next_skill_desc_scroll:getContentSize().width, slot12))
		slot0.next_skill_desc_scroll:setTouchEnabled(slot11.height > 85)
		slot0.arrow_sp_2:setVisible(slot11.height > 85)
	end

	slot10 = true

	for slot14, slot15 in ipairs(slot0.config.upgrade_loss) do
		slot17 = slot15[2]
		slot19 = slot0.cost_objects[slot14]

		if Config.ItemData.data_get_data(slot15[1]) and slot19 then
			slot19.item_node:setData(slot18)
			slot19.cost_name:setString(slot18.name)

			if not slot0.elfin_pos and slot16 == slot0.elfin_bid then
				slot20 = BackpackController:getInstance():getModel():getItemNumByBid(slot16) - 1
			end

			slot19.cost_num:setString(uv0("%s/%s", MoneyTool.GetMoneyString(slot20, false), MoneyTool.GetMoneyString(slot17, false)))

			if slot20 < slot17 then
				slot10 = false

				slot19.cost_num:setTextColor(cc.c3b(255, 93, 93))
			else
				slot19.cost_num:setTextColor(cc.c3b(255, 246, 228))
			end
		end
	end

	if slot10 then
		addRedPointToNodeByStatus(slot0.compound_btn, true, 10, 10)
	else
		addRedPointToNodeByStatus(slot0.compound_btn, false)
	end
end

function HeroSkinUpgradeWindow.close_callback(slot0)
	if slot0.cur_skill then
		slot0.cur_skill:DeleteMe()

		slot0.cur_skill = nil
	end

	if slot0.cur_skin_item then
		slot0.cur_skin_item:DeleteMe()

		slot0.cur_skin_item = nil
	end

	if slot0.next_skill then
		slot0.next_skill:DeleteMe()

		slot0.next_skill = nil
	end

	if slot0.next_skin_item then
		slot0.next_skin_item:DeleteMe()

		slot0.next_skin_item = nil
	end

	for slot4, slot5 in pairs(slot0.cost_objects) do
		if slot5.item_node then
			slot5.item_node:DeleteMe()

			slot5.item_node = nil
		end
	end

	uv0:openHeroSkinUpgradeWindow(false)
end
