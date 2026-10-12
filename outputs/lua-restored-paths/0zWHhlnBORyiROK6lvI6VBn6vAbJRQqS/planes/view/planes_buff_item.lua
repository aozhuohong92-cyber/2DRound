slot0 = string.format
PlanesBuffItem = class("PlanesBuffItem", function ()
	return ccui.Widget:create()
end)

function PlanesBuffItem.ctor(slot0, slot1)
	slot0.callback = slot1

	slot0:configUI()
	slot0:registerEvent()
end

function PlanesBuffItem.configUI(slot0)
	slot0.size = cc.size(195, 362)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("planes/planes_buff_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")

	slot2:setSwallowTouches(false)

	slot0.container = slot2
	slot0.pos_node = slot2:getChildByName("pos_node")
	slot0.name_txt = slot2:getChildByName("name_txt")
	slot0.icon_sp = slot2:getChildByName("icon_sp")
	slot0.quality_sp = slot2:getChildByName("quality_sp")
	slot0.effect_sp = slot2:getChildByName("effect_sp")

	slot0.effect_sp:setVisible(false)

	slot0.desc_txt = createRichLabel(16, cc.c4b(251, 228, 185), cc.p(0.5, 1), cc.p(slot0.size.width * 0.5, 150), 0, 0, slot0.size.width - 20)

	slot2:addChild(slot0.desc_txt)
end

function PlanesBuffItem.registerEvent(slot0)
	registerButtonEventListener(slot0.container, handler(slot0, slot0.onClickItem), true)
end

function PlanesBuffItem.onClickItem(slot0)
	if slot0.is_select then
		return
	end

	if slot0.callback then
		slot0:callback()
	end
end

function PlanesBuffItem.setIsSelect(slot0, slot1)
	slot0.is_select = slot1

	if slot1 == true then
		slot0:setPositionY(320)
		slot0:handleSelectEffect(true)
	else
		slot0:setPositionY(290)
		slot0:handleSelectEffect(false)
	end
end

function PlanesBuffItem.handleCardEffect(slot0, slot1)
	if slot1 == true then
		action = PlayerAction.action_9

		if slot0.buff_cfg then
			if slot0.buff_cfg.quality == PlanesafkConst.Buff_Quility.Blue then
				action = PlayerAction.action_9
			elseif slot0.buff_cfg.quality == PlanesafkConst.Buff_Quility.Purple then
				action = PlayerAction.action_8
			elseif slot0.buff_cfg.quality == PlanesafkConst.Buff_Quility.Orange then
				action = PlayerAction.action_7
			end
		end

		if not tolua.isnull(slot0.pos_node) and slot0.card_effect == nil then
			slot0.card_effect = createEffectSpine(Config.EffectData.data_effect_info[1701], cc.p(0, 0), cc.p(0.5, 0.5), true, action)

			slot0.pos_node:addChild(slot0.card_effect)
		end
	elseif slot0.card_effect then
		slot0.card_effect:clearTracks()
		slot0.card_effect:removeFromParent()

		slot0.card_effect = nil
	end
end

function PlanesBuffItem.handleSelectEffect(slot0, slot1)
	if slot1 == true then
		action = PlayerAction.action_4

		if slot0.buff_cfg then
			if slot0.buff_cfg.quality == PlanesafkConst.Buff_Quility.Blue then
				action = PlayerAction.action_6
			elseif slot0.buff_cfg.quality == PlanesafkConst.Buff_Quility.Purple then
				action = PlayerAction.action_5
			elseif slot0.buff_cfg.quality == PlanesafkConst.Buff_Quility.Orange then
				action = PlayerAction.action_4
			end
		end

		slot0.is_enter_effect = true

		if not tolua.isnull(slot0.pos_node) and slot0.select_effect == nil then
			slot0.select_effect = createEffectSpine(Config.EffectData.data_effect_info[1701], cc.p(0, 0), cc.p(0.5, 0.5), false, action, handler(slot0, slot0.onSelectEffectEnd))

			slot0.pos_node:addChild(slot0.select_effect)
		end
	elseif slot0.select_effect then
		slot0.select_effect:clearTracks()
		slot0.select_effect:removeFromParent()

		slot0.select_effect = nil
	end
end

function PlanesBuffItem.onSelectEffectEnd(slot0)
	if slot0.select_effect and slot0.is_enter_effect then
		slot0.is_enter_effect = false
		slot1 = PlayerAction.action_1

		if slot0.buff_cfg then
			if slot0.buff_cfg.quality == PlanesafkConst.Buff_Quility.Blue then
				slot1 = PlayerAction.action_3
			elseif slot0.buff_cfg.quality == PlanesafkConst.Buff_Quility.Purple then
				slot1 = PlayerAction.action_2
			elseif slot0.buff_cfg.quality == PlanesafkConst.Buff_Quility.Orange then
				slot1 = PlayerAction.action_1
			end
		end

		slot0.select_effect:setAnimation(0, slot1, true)
	end
end

function PlanesBuffItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.buff_cfg = slot1

	if not slot0.buff_cfg then
		return
	end

	slot0.name_txt:setString(slot0.buff_cfg.name)
	slot0.name_txt:setTextColor(slot0:getNameColorByQuality(slot0.buff_cfg.quality))
	slot0.desc_txt:setString(slot0.buff_cfg.desc)

	slot0.icon_sp_load = loadSpriteTextureFromCDN(slot0.icon_sp, uv0("resource/planes/buff_icon/%s.png", slot0.buff_cfg.res_id), ResourcesType.single, slot0.icon_sp_load)

	loadSpriteTexture(slot0.quality_sp, slot0:getQualityIconRes(slot0.buff_cfg.quality), LOADTEXT_TYPE_PLIST)

	slot4 = nil

	if slot0.buff_cfg.range and slot5[1] and next(slot5[1]) ~= nil then
		if slot5[1][1] == "career_type" then
			slot4 = slot0:getCareerRes(slot5[1][2])

			slot0.effect_sp:setScale(1)
		elseif slot6 == "camp_type" then
			slot4 = PathTool.getHeroCampTypeIcon(slot7)

			slot0.effect_sp:setScale(0.82)
		elseif slot6 == "partner" then
			slot0.hero_item = PlayerHead.new(PlayerHead.type.circle)

			slot0.hero_item:setScale(0.5)
			slot0.hero_item:setPosition(97, 26)
			slot0.container:addChild(slot0.hero_item)
			slot0.hero_item:setHeadRes(slot7)
		else
			slot0.effect_sp:setScale(1)

			slot4 = PathTool.getResFrame("planes", "planes_buff_6", false, "planes_buff")
		end
	else
		slot0.effect_sp:setScale(1)

		slot4 = PathTool.getResFrame("planes", "planes_buff_6", false, "planes_buff")
	end

	if slot4 then
		slot0.effect_sp:setVisible(true)
		loadSpriteTexture(slot0.effect_sp, slot4, LOADTEXT_TYPE_PLIST)

		if slot0.hero_item then
			slot0.hero_item:setVisible(false)
		end
	else
		if slot0.hero_item then
			slot0.hero_item:setVisible(true)
		end

		slot0.effect_sp:setVisible(false)
	end

	slot0:handleCardEffect(true)
end

function PlanesBuffItem.getBuffId(slot0)
	if slot0.buff_cfg then
		return slot0.buff_cfg.buff_id
	end
end

function PlanesBuffItem.getNameColorByQuality(slot0, slot1)
	if slot1 == PlanesafkConst.Buff_Quility.Orange then
		return Config.ColorData.data_color4[246]
	elseif slot1 == PlanesafkConst.Buff_Quility.Purple then
		return Config.ColorData.data_color4[245]
	else
		return Config.ColorData.data_color4[244]
	end
end

function PlanesBuffItem.getQualityIconRes(slot0, slot1)
	if slot1 == PlanesafkConst.Buff_Quility.Blue then
		return PathTool.getResFrame("planes", "planes_buff_10", false, "planes_buff")
	elseif slot1 == PlanesafkConst.Buff_Quility.Purple then
		return PathTool.getResFrame("planes", "planes_buff_12", false, "planes_buff")
	elseif slot1 == PlanesafkConst.Buff_Quility.Orange then
		return PathTool.getResFrame("planes", "planes_buff_8", false, "planes_buff")
	else
		return PathTool.getResFrame("planes", "planes_buff_10", false, "planes_buff")
	end
end

function PlanesBuffItem.getCareerRes(slot0, slot1)
	if slot1 == 2 then
		return PathTool.getResFrame("planes", "planes_buff_3", false, "planes_buff")
	elseif slot1 == 3 then
		return PathTool.getResFrame("planes", "planes_buff_2", false, "planes_buff")
	elseif slot1 == 4 then
		return PathTool.getResFrame("planes", "planes_buff_4", false, "planes_buff")
	elseif slot1 == 5 then
		return PathTool.getResFrame("planes", "planes_buff_5", false, "planes_buff")
	end
end

function PlanesBuffItem.suspendAllActions(slot0)
end

function PlanesBuffItem.DeleteMe(slot0)
	if slot0.icon_sp_load then
		slot0.icon_sp_load:DeleteMe()

		slot0.icon_sp_load = nil
	end

	if slot0.hero_item then
		slot0.hero_item:DeleteMe()

		slot0.hero_item = nil
	end

	slot0:handleCardEffect(false)
	slot0:handleSelectEffect(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
