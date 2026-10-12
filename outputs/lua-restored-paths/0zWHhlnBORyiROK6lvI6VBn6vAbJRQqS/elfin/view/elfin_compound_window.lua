slot1 = ElfinController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
ElfinCompoundWindow = ElfinCompoundWindow or BaseClass(BaseView)

function ElfinCompoundWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_compound_window"
end

function ElfinCompoundWindow.open_callback(slot0)
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
	slot0.change_btn = slot0.container:getChildByName("change_btn")

	slot0.change_btn:getChildByName("label"):setString(TI18N("更换"))

	slot0.compound_btn = slot0.container:getChildByName("compound_btn")

	slot0.compound_btn:getChildByName("label"):setString(TI18N("灵合"))
	slot0.container:getChildByName("win_title"):setString(TI18N("灵合"))
	slot0.container:getChildByName("com_title"):setString(TI18N("幽灵融合"))
	slot0.container:getChildByName("cost_title"):setString(TI18N("升级消耗"))
	slot0.container:getChildByName("com_tips"):setString(TI18N("灵合后技能等级提升"))

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

		slot5.item_node:setPosition(cc.p(137 + (slot4 - 1) * 271, 189))
		slot0.container:addChild(slot5.item_node)

		slot5.cost_name = slot0.container:getChildByName("cost_name_" .. slot4)
		slot5.cost_num = slot0.container:getChildByName("cost_num_" .. slot4)

		uv0(slot0.cost_objects, slot5)
	end

	slot0.cur_skill_desc_scroll = createScrollView(350, 85, 282, 584, slot0.container, ccui.ScrollViewDir.vertical)
	slot0.next_skill_desc_scroll = createScrollView(350, 85, 282, 334, slot0.container, ccui.ScrollViewDir.vertical)
end

function ElfinCompoundWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openElfinCompoundWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openElfinCompoundWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.change_btn, handler(slot0, slot0.onClickChangeBtn), true)
	registerButtonEventListener(slot0.compound_btn, handler(slot0, slot0.onClickCompoundBtn), true)
end

function ElfinCompoundWindow.onClickChangeBtn(slot0)
	if slot0.elfin_pos then
		uv0:openElfinChooseWindow(true, {
			elfin_pos = slot0.elfin_pos,
			elfin_bid = slot0.elfin_bid
		})
		uv0:openElfinCompoundWindow(false)
	end
end

function ElfinCompoundWindow.onClickCompoundBtn(slot0)
	if slot0.elfin_bid then
		uv0:sender26508(slot0.elfin_bid, 1, slot0.elfin_pos or 0)
	end
end

function ElfinCompoundWindow.openRootWnd(slot0, slot1, slot2)
	slot0.elfin_bid = slot1
	slot0.elfin_pos = slot2

	slot0:setData()

	if not slot0.elfin_pos then
		slot0.change_btn:setVisible(false)
		slot0.compound_btn:setPositionX(340)
	else
		slot0.change_btn:setVisible(true)
	end
end

function ElfinCompoundWindow.setData(slot0)
	if not slot0.elfin_bid then
		return
	end

	if not Config.SpriteData.data_elfin_com[slot0.elfin_bid] then
		return
	end

	slot2 = slot1.award

	if not Config.ItemData.data_get_data(slot0.elfin_bid) or not Config.SpriteData.data_elfin_data(slot0.elfin_bid) or not Config.ItemData.data_get_data(slot2) or not Config.SpriteData.data_elfin_data(slot2) then
		return
	end

	if not slot0.cur_elfin_item then
		slot0.cur_elfin_item = BackPackItem.new(true, false)

		slot0.cur_elfin_item:setPosition(cc.p(130, 698))
		slot0.container:addChild(slot0.cur_elfin_item)
	end

	slot0.cur_elfin_item:setData(slot3)
	slot0.cur_elfin_item:showItemQualityName(true)

	if not slot0.cur_elfin_skill then
		slot0.cur_elfin_skill = SkillItem.new(false, false, false, 0.7)

		slot0.cur_elfin_skill:setPosition(cc.p(320, 716))
		slot0.container:addChild(slot0.cur_elfin_skill)
	end

	if slot4.skill and Config.SkillData.data_get_skill(slot4.skill) then
		slot0.cur_elfin_skill:setData(slot7)
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

	if not slot0.next_elfin_item then
		slot0.next_elfin_item = BackPackItem.new(true, false)

		slot0.next_elfin_item:setPosition(cc.p(130, 448))
		slot0.container:addChild(slot0.next_elfin_item)
	end

	slot0.next_elfin_item:setData(slot5)
	slot0.next_elfin_item:showItemQualityName(true)

	if not slot0.next_elfin_skill then
		slot0.next_elfin_skill = SkillItem.new(false, false, false, 0.7)

		slot0.next_elfin_skill:setPosition(cc.p(320, 466))
		slot0.container:addChild(slot0.next_elfin_skill)
	end

	if slot6.skill and Config.SkillData.data_get_skill(slot6.skill) then
		slot0.next_elfin_skill:setData(slot7)
		slot0.skill_name_2:setString(uv0("%s Lv.%d", slot7.name, slot7.level))

		if slot7.type == "active_skill" then
			slot0.skill_type_2:setString(TI18N("类型：主动技能"))
		else
			slot0.skill_type_2:setString(TI18N("类型：被动技能"))
		end

		if not slot0.next_skill_desc_txt then
			slot0.next_skill_desc_txt = createRichLabel(18, cc.c4b(154, 109, 77, 255), cc.p(0, 1), cc.p(0, 0), 5, nil, 350)

			slot0.next_skill_desc_scroll:addChild(slot0.next_skill_desc_txt)
		end

		slot0.next_skill_desc_txt:setString(slot7.des)

		slot8 = slot0.next_skill_desc_txt:getSize()
		slot9 = math.max(slot8.height, 85)

		slot0.next_skill_desc_txt:setPositionY(slot9)
		slot0.next_skill_desc_scroll:setInnerContainerSize(cc.size(slot0.next_skill_desc_scroll:getContentSize().width, slot9))
		slot0.next_skill_desc_scroll:setTouchEnabled(slot8.height > 85)
		slot0.arrow_sp_2:setVisible(slot8.height > 85)
	end

	slot7 = true

	for slot11, slot12 in ipairs(slot1.expend) do
		slot14 = slot12[2]
		slot16 = slot0.cost_objects[slot11]

		if Config.ItemData.data_get_data(slot12[1]) and slot16 then
			slot16.item_node:setData(slot15)
			slot16.cost_name:setString(slot15.name)

			if not slot0.elfin_pos and slot13 == slot0.elfin_bid then
				slot17 = BackpackController:getInstance():getModel():getItemNumByBid(slot13) - 1
			end

			slot16.cost_num:setString(uv0("%s/%s", MoneyTool.GetMoneyString(slot17, false), MoneyTool.GetMoneyString(slot14, false)))

			if slot17 < slot14 then
				slot7 = false

				slot16.cost_num:setTextColor(cc.c3b(255, 93, 93))
			else
				slot16.cost_num:setTextColor(cc.c3b(255, 246, 228))
			end
		end
	end

	if slot0.elfin_pos and slot7 then
		addRedPointToNodeByStatus(slot0.compound_btn, true, 10, 10)
	else
		addRedPointToNodeByStatus(slot0.compound_btn, false)
	end

	if slot0.elfin_pos then
		slot8 = false

		for slot13, slot14 in pairs(BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.ELFIN) or {}) do
			if Config.SpriteData.data_elfin_data(slot14.base_id) and slot15.sprite_type == slot4.sprite_type and slot4.step < slot15.step then
				slot8 = true

				break
			end
		end

		addRedPointToNodeByStatus(slot0.change_btn, slot8, 10, 10)
	else
		addRedPointToNodeByStatus(slot0.change_btn, false)
	end
end

function ElfinCompoundWindow.close_callback(slot0)
	if slot0.cur_elfin_item then
		slot0.cur_elfin_item:DeleteMe()

		slot0.cur_elfin_item = nil
	end

	if slot0.cur_elfin_skill then
		slot0.cur_elfin_skill:DeleteMe()

		slot0.cur_elfin_skill = nil
	end

	if slot0.next_elfin_item then
		slot0.next_elfin_item:DeleteMe()

		slot0.next_elfin_item = nil
	end

	if slot0.next_elfin_skill then
		slot0.next_elfin_skill:DeleteMe()

		slot0.next_elfin_skill = nil
	end

	for slot4, slot5 in pairs(slot0.cost_objects) do
		if slot5.item_node then
			slot5.item_node:DeleteMe()

			slot5.item_node = nil
		end
	end

	uv0:openElfinCompoundWindow(false)
end
