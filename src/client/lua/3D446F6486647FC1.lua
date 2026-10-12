ArenapeakchampionFightInfoItem = class("ArenapeakchampionFightInfoItem", function ()
	return ccui.Widget:create()
end)
slot0 = string.format

function ArenapeakchampionFightInfoItem.ctor(slot0, slot1, slot2)
	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ArenapeakchampionFightInfoItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenapeakchampion/arenapeakchampion_fight_info_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")

	function slot5(slot0)
		slot1 = {
			team_name = uv0:getChildByName(slot0 .. "team_name"),
			fight_count = uv0:getChildByName(slot0 .. "fight_count"),
			wenhao = uv0:getChildByName(slot0 .. "wenhao"),
			equip_node = uv0:getChildByName(slot0 .. "equip_node"),
			elfin_key = uv0:getChildByName(slot0 .. "elfin_key")
		}

		slot1.elfin_key:setString(TI18N("佩罗娜"))

		slot1.elfin_lev = uv0:getChildByName(slot0 .. "elfin_lev")
		slot5 = slot0 .. "panel_elfin"
		slot1.panel_elfin = uv0:getChildByName(slot5)
		slot1.elfin_list = {}
		slot1.pos_list = {}
		slot1.hero_item_list = {}

		for slot5 = 1, 9 do
			slot7, slot8 = uv0:getChildByName(slot0 .. "hero_bg_" .. slot5):getPosition()
			slot1.pos_list[slot5] = cc.p(slot7, slot8)
		end

		return slot1
	end

	slot0.left_item = slot5("left_")
	slot0.right_item = slot5("right_")
end

function ArenapeakchampionFightInfoItem.register_event(slot0)
end

function ArenapeakchampionFightInfoItem.setData(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0:initItemInfo(slot0.left_item, slot1.a_order, name, slot1.a_power, slot1.a_plist, slot1.a_formation_type, slot1.rid, slot1.srv_id, slot1.a_tree_lv or 0, slot1.a_sprite_data or {}, slot1.a_hallows_id or 0, slot1.a_hallows_look_id or 0, slot2 or false)
	slot0:initItemInfo(slot0.right_item, slot1.b_order, name, slot1.b_power, slot1.b_plist, slot1.b_formation_type, slot1.b_rid, slot1.b_srv_id, slot1.b_tree_lv or 0, slot1.b_sprite_data or {}, slot1.b_hallows_id or 0, slot1.b_hallows_look_id or 0, slot3 or false)
end

function ArenapeakchampionFightInfoItem.initItemInfo(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13)
	slot1.team_name:setString(uv0("[%s%s]", TI18N("队伍"), slot2))
	slot0:updateHeroInfo(slot1, slot5, slot6, slot7, slot8, slot13)

	if slot13 then
		slot1.fight_count:setString("?")
		slot1.elfin_lev:setVisible(false)
		slot1.elfin_key:setVisible(false)
		slot1.panel_elfin:setVisible(false)
		slot1.equip_node:setVisible(false)
	else
		slot1.elfin_lev:setVisible(true)
		slot1.elfin_key:setVisible(true)
		slot1.panel_elfin:setVisible(true)
		slot1.equip_node:setVisible(true)
		slot1.fight_count:setString(slot4)

		slot20 = TI18N("%s级")

		slot1.elfin_lev:setString(uv0(slot20, slot9))

		slot16 = 34

		for slot20 = 1, 4 do
			if not slot1.elfin_list[slot20] then
				slot21 = SkillItem.new(true, true, true, 0.27, true)

				slot21:setPosition(slot16 * ((slot20 - 1) % 2) + slot16 * 0.5, 68 - (math.floor((slot20 - 1) / 2) * slot16 + slot16 * 0.5))
				slot1.panel_elfin:addChild(slot21)

				slot1.elfin_list[slot20] = slot21
			end

			slot0:setElfinSkillItemData(slot21, slot10, slot20)
		end

		slot0:updateHallowsIcon(slot1, slot11, slot12)
	end
end

function ArenapeakchampionFightInfoItem.updateHallowsIcon(slot0, slot1, slot2, slot3)
	if not slot2 then
		return
	end

	if not slot1 then
		return
	end

	if slot1.hallows_item == nil then
		slot1.hallows_item = BackPackItem.new(false, false, false, 0.5)

		slot1.equip_node:addChild(slot1.hallows_item)
	end

	if slot2 == 0 then
		slot1.hallows_item:setBaseData()
		slot1.hallows_item:setMagicIcon(false)
	else
		if not Config.HallowsData.data_base[slot2] then
			return
		end

		if slot3 and slot3 ~= 0 then
			if Config.HallowsData.data_magic[slot3] then
				slot1.hallows_item:setBaseData(slot5.item_id)
				slot1.hallows_item:setMagicIcon(true)
			else
				slot1.hallows_item:setBaseData(slot4.item_id)
				slot1.hallows_item:setMagicIcon(false)
			end
		else
			slot1.hallows_item:setBaseData(slot4.item_id)
			slot1.hallows_item:setMagicIcon(false)
		end
	end
end

function ArenapeakchampionFightInfoItem.getElfinBidByPos(slot0, slot1, slot2)
	if not slot1 or next(slot1) == nil then
		return
	end

	for slot6, slot7 in pairs(slot1) do
		if slot7.pos == slot2 then
			return slot7.item_bid
		end
	end
end

function ArenapeakchampionFightInfoItem.setElfinSkillItemData(slot0, slot1, slot2, slot3)
	if slot0:getElfinBidByPos(slot2, slot3) then
		slot1:showLockIcon(false)

		if slot4 == 0 or not Config.SpriteData.data_elfin_data(slot4) then
			slot1:setData()
			slot1:showLevel(false)
		elseif Config.SkillData.data_get_skill(slot5.skill) then
			slot1:showLevel(true)
			slot1:setData(slot6)
		end
	else
		slot1:setData()
		slot1:showLevel(false)
		slot1:showLockIcon(true)
	end
end

function ArenapeakchampionFightInfoItem.updateHeroInfo(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if not slot1 then
		return
	end

	if slot6 then
		for slot10, slot11 in pairs(slot1.hero_item_list) do
			slot11:setVisible(false)
		end

		slot1.wenhao:setVisible(true)
	else
		slot1.wenhao:setVisible(false)

		if Config.FormationData.data_form_data[slot3] then
			slot8 = {}

			if slot2 then
				for slot12, slot13 in pairs(slot2) do
					slot8[slot13.pos] = slot13
				end
			end

			for slot12, slot13 in pairs(slot1.hero_item_list) do
				slot13:setVisible(false)
			end

			for slot12, slot13 in ipairs(slot7.pos) do
				slot14 = slot13[1]

				if slot8[slot13[2]] and slot16.ext then
					for slot20, slot21 in ipairs(slot16.ext) do
						if slot21.key == 5 then
							slot16.use_skin = slot21.val
						end
					end
				end

				if slot1.hero_item_list[slot14] == nil then
					slot1.hero_item_list[slot14] = HeroExhibitionItem.new(0.5, false)

					slot0.container:addChild(slot1.hero_item_list[slot14])
				else
					slot1.hero_item_list[slot14]:setVisible(true)
				end

				slot1.hero_item_list[slot14]:setPosition(slot1.pos_list[slot15])

				if slot16 then
					slot1.hero_item_list[slot14]:setData(slot16)
					slot1.hero_item_list[slot14]:addCallBack(function ()
						if uv0 and uv1 then
							-- Nothing
						end
					end)
				else
					slot1.hero_item_list[slot14]:setData(nil)
				end
			end
		end
	end
end

function ArenapeakchampionFightInfoItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.left_item and slot0.left_item.elfin_list and next(slot0.left_item.elfin_list) ~= nil then
		for slot4, slot5 in pairs(slot0.left_item.elfin_list) do
			slot5:DeleteMe()
		end

		slot0.left_item.elfin_list = {}
	end

	if slot0.right_item and slot0.right_item.elfin_list and next(slot0.right_item.elfin_list) ~= nil then
		for slot4, slot5 in pairs(slot0.right_item.elfin_list) do
			slot5:DeleteMe()
		end

		slot0.right_item.elfin_list = {}
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
