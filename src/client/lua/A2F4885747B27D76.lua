HeroUpgradeStarorderExhibition = HeroUpgradeStarorderExhibition or BaseClass(BaseView)
slot0 = table.insert
slot1 = string.format

function HeroUpgradeStarorderExhibition.__init(slot0, slot1, slot2)
	slot0.ctrl = slot1
	slot0.win_type = WinType.Mini
	slot0.layout_name = "hero/hero_exhibition_window"
	slot0.view_tag = ViewMgrTag.MSG_TAG
	slot0.is_csb_action = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		}
	}
	slot0.attr_list = {}
end

function HeroUpgradeStarorderExhibition.open_callback(slot0)
	slot1 = slot0.root_wnd:getChildByName("backpanel")

	slot1:setScale(display.getMaxScale())

	slot0.background = slot1:getChildByName("background")
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot2 = slot0.main_container:getContentSize()
	slot0.back_panel = slot0.main_container:getChildByName("back_panel")

	slot0.back_panel:setContentSize(cc.size(720, 400))

	slot0.Image_1 = slot0.back_panel:getChildByName("Image_1")
	slot0.Image_2 = slot0.back_panel:getChildByName("Image_2")

	slot0.Image_1:setPositionY(400)
	slot0.Image_1:setContentSize(cc.size(736, 200))
	slot0.Image_2:setContentSize(cc.size(736, 200))

	slot3 = slot0.root_wnd:getChildByName("titlepanel")

	slot3:setPositionY(853)

	slot0.title_container = slot3:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.left_item = HeroExhibitionItem.new(1, false)

	slot0.left_item:setPosition(cc.p(slot2.width / 2, 400))
	slot0.main_container:addChild(slot0.left_item)

	slot0.advanced_node = ccui.Layout:create()

	slot0.advanced_node:setPosition(cc.p(slot2.width / 2, 322))
	slot0.main_container:addChild(slot0.advanced_node)
	createLabel(24, Config.ColorData.data_color4[1], nil, slot2.width / 2, -90, "", slot0.main_container, 2, cc.p(0.5, 0)):setString(TI18N("点击任意处关闭"))
end

function HeroUpgradeStarorderExhibition.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 1)
end

function HeroUpgradeStarorderExhibition._onClickBtnClose(slot0)
	slot0.ctrl:openBreakExhibitionWindow(false, slot0.unlock_skill_id)
end

function HeroUpgradeStarorderExhibition.openRootWnd(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	playOtherSound("c_get")

	slot0.old_data = slot1
	slot0.new_data = slot2

	slot0:handleEffect(true, open_type)
	slot0:updateHead()
	slot0:updateAttrList()
end

function HeroUpgradeStarorderExhibition.updateHead(slot0)
	slot0.left_item:setData(slot0.new_data)

	slot1 = slot0.ctrl:getModel():getHeroMaxBreakCountByInitStar(slot0.new_data.init_star)
	slot2 = 35
	slot4 = -slot2 * slot1 * 0.5 + slot2 * 0.5

	for slot8 = 1, slot1 do
		slot10 = (slot8 > slot0.new_data.break_lev or createSprite(PathTool.getResFrame("hero", "hero_info_1"), slot4 + (slot8 - 1) * slot2, 0, slot0.advanced_node, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 1)) and createSprite(PathTool.getResFrame("hero", "hero_info_2"), slot4 + (slot8 - 1) * slot2, 0, slot0.advanced_node, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 0)
	end
end

function HeroUpgradeStarorderExhibition.updateAttrList(slot0)
	slot6 = Config.PartnerData.data_partner_brach[getNorKey(slot0.new_data.type, slot0.new_data.break_id, slot0.new_data.break_lev or 0)]

	if not Config.PartnerData.data_partner_brach[getNorKey(slot0.old_data.type, slot0.old_data.break_id, slot0.old_data.break_lev or 0)] or not slot6 then
		return
	end

	slot7 = slot0.old_data.use_skin or 0

	if slot4.skill_num < slot6.skill_num and Config.PartnerData.data_partner_star(getNorKey(slot0.old_data.bid, slot0.old_data.star)) then
		slot10 = nil

		for slot14, slot15 in ipairs(slot9.skills) do
			if slot15[1] == slot6.skill_num then
				slot16 = Config.PartnerSkinData.data_skilltonewskill[getNorKey(slot7, slot15[2])]

				if slot0.new_data.star >= 10 and slot16 then
					slot10 = slot16

					break
				end

				slot10 = slot15[2]

				break
			end
		end

		if slot10 ~= nil then
			slot0.unlock_skill_id = slot10
		end
	end

	slot8 = {}

	uv1(slot8, {
		left_value = uv0(" <img src='%s' />  %s", PathTool.getResFrame("common", "common_90001"), slot0.old_data.power),
		right_value = slot0.new_data.power
	})

	slot15 = {
		left_value = uv0("%s: %s", TI18N("等级上限"), slot4.lev_max),
		right_value = slot16
	}
	slot16 = slot6.lev_max

	uv1(slot8, slot15)

	for slot15, slot16 in ipairs(slot6.all_attr) do
		if slot16[1] == "hp_max" then
			slot17 = "hp"
		end

		uv1(slot8, {
			left_value = uv0("%s: %s", Config.AttrData.data_key_to_name[slot17], slot0.old_data[slot17]),
			right_value = slot0.new_data[slot17]
		})
	end

	for slot15, slot16 in ipairs(slot8) do
		if not slot0.attr_list[slot15] then
			slot0.attr_list[slot15] = {}

			createImage(slot0.main_container, PathTool.getResFrame("common", "common_90044"), 20, 230 - (slot15 - 1) * 50, cc.p(0, 0), true, 0, true):setContentSize(cc.size(675, 43))

			if slot15 ~= 1 then
				slot18:setOpacity(160)
			end

			slot19 = createRichLabel(22, cc.c4b(255, 238, 172, 255), cc.p(0, 0), cc.p(130, 290 - slot15 * 50), 0, 0, 400)

			slot0.main_container:addChild(slot19)

			slot20 = createRichLabel(22, cc.c4b(53, 255, 20, 255), cc.p(0, 0), cc.p(430, 290 - slot15 * 50), 0, 0, 400)

			slot0.main_container:addChild(slot20)

			slot0.attr_list[slot15].now_label = slot19
			slot0.attr_list[slot15].next_label = slot20
			slot0.attr_list[slot15].arrow = createImage(slot0.main_container, PathTool.getResFrame("common", "common_90017"), 330, 240 - (slot15 - 1) * 50, cc.p(0, 0), true, 0, false)
		end

		slot0.attr_list[slot15].now_label:setString(slot16.left_value)
		slot0.attr_list[slot15].next_label:setString(slot16.right_value)
	end
end

function HeroUpgradeStarorderExhibition.handleEffect(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	else
		slot3 = PlayerAction.action_5

		if slot2 and slot2 == 2 then
			slot3 = PlayerAction.action_6
		end

		if not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine(PathTool.getEffectRes(103), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_6)

			slot0.title_container:addChild(slot0.play_effect)
		end
	end
end

function HeroUpgradeStarorderExhibition.close_callback(slot0)
	slot0:handleEffect(false)

	if slot0.left_item then
		slot0.left_item:DeleteMe()

		slot0.left_item = nil
	end

	slot0.ctrl:openBreakExhibitionWindow(false)
end

function HeroUpgradeStarorderExhibition.onExitAnim(slot0)
	GlobalEvent:getInstance():Fire(EventId.CAN_OPEN_LEVUPGRADE, true)
	GlobalEvent:getInstance():Fire(PokedexEvent.Call_End_Event)
end
