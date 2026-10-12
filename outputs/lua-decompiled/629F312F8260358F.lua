slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
HeroSkinUpgradeWindow2 = HeroSkinUpgradeWindow2 or BaseClass(BaseView)

function HeroSkinUpgradeWindow2.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "hero/hero_skin_upgrade_window2"
end

function HeroSkinUpgradeWindow2.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.btn_close = slot0.container:getChildByName("btn_close")
	slot0.compound_btn = slot0.container:getChildByName("compound_btn")

	slot0.compound_btn:getChildByName("label"):setString(TI18N("升级"))
	slot0.compound_btn:getChildByName("label"):enableOutline(cc.c3b(0, 0, 0), 2)
	slot0.container:getChildByName("win_title"):setString(TI18N("升级"))
	slot0.container:getChildByName("com_title"):setString(TI18N("皮肤升级"))

	slot4 = TI18N

	slot0.container:getChildByName("cost_title"):setString(slot4("升级消耗"))

	slot0.old_attr_list = {}
	slot0.new_attr_list = {}
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
end

function HeroSkinUpgradeWindow2.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openHeroSkinUpgradeWindow2(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHeroSkinUpgradeWindow2(false)
	end, false, 2)
	registerButtonEventListener(slot0.compound_btn, handler(slot0, slot0.onClickCompoundBtn), true)
end

function HeroSkinUpgradeWindow2.onClickCompoundBtn(slot0)
	uv0:sender11021(slot0.hero_vo.partner_id, slot0.config.skin_id)
	uv0:openHeroSkinUpgradeWindow2(false)
end

function HeroSkinUpgradeWindow2.openRootWnd(slot0, slot1, slot2)
	slot0.config = slot1.config
	slot0.hero_vo = slot2
	slot0.next_config = Config.PartnerSkinData.data_skin_info[slot0.config.next_id]

	slot0:setData()
end

function HeroSkinUpgradeWindow2.setData(slot0)
	if not slot0.config then
		return
	end

	if not slot0.next_config then
		return
	end

	for slot5, slot6 in ipairs(slot0.config.skin_attr) do
		if not slot0.old_attr_list[slot5] then
			slot0.old_attr_list[slot5] = slot0:createAttrItem(100, 470 - (slot5 - 1) * 50)
		end

		slot7, slot8, slot9 = commonGetAttrInfoByKeyValue(slot6[1], slot6[2])

		slot0.old_attr_list[slot5]:setString(string.format("<img src='%s' scale=1 /> %s + %s", slot7, slot8, slot9))
	end

	for slot5, slot6 in ipairs(slot0.next_config.skin_attr) do
		if not slot0.new_attr_list[slot5] then
			slot0.new_attr_list[slot5] = slot0:createAttrItem(450, slot1 - (slot5 - 1) * 50, cc.c3b(0, 128, 0))
		end

		slot7, slot8, slot9 = commonGetAttrInfoByKeyValue(slot6[1], slot6[2])

		slot0.new_attr_list[slot5]:setString(string.format("+ %s", slot9))
	end

	slot2 = true

	for slot6, slot7 in ipairs(slot0.config.upgrade_loss) do
		slot9 = slot7[2]
		slot11 = slot0.cost_objects[slot6]

		if Config.ItemData.data_get_data(slot7[1]) and slot11 then
			slot11.item_node:setData(slot10)
			slot11.cost_name:setString(slot10.name)

			if not slot0.elfin_pos and slot8 == slot0.elfin_bid then
				slot12 = BackpackController:getInstance():getModel():getItemNumByBid(slot8) - 1
			end

			slot11.cost_num:setString(uv0("%s/%s", MoneyTool.GetMoneyString(slot12, false), MoneyTool.GetMoneyString(slot9, false)))

			if slot12 < slot9 then
				slot2 = false

				slot11.cost_num:setTextColor(cc.c3b(255, 93, 93))
			else
				slot11.cost_num:setTextColor(cc.c3b(255, 246, 228))
			end
		end
	end

	if slot2 then
		addRedPointToNodeByStatus(slot0.compound_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.compound_btn, false)
	end
end

function HeroSkinUpgradeWindow2.createAttrItem(slot0, slot1, slot2, slot3)
	slot4 = createRichLabel(24, slot3 or cc.c3b(100, 50, 35), cc.p(0, 0.5), cc.p(slot1, slot2), nil, nil, 99999)

	slot0.container:addChild(slot4)

	return slot4
end

function HeroSkinUpgradeWindow2.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.cost_objects) do
		if slot5.item_node then
			slot5.item_node:DeleteMe()

			slot5.item_node = nil
		end
	end

	uv0:openHeroSkinUpgradeWindow2(false)
end
