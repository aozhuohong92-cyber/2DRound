module("GuildBattle", package.seeall)
require("script/ui/main/BulletinLayer")
require("script/ui/main/MainScene")
require("script/utils/BaseUI")
require("script/battle/BattleCardUtil")
require("script/battle/BattleLayer")

BattleForGuild = 101
BattleForCity = 102
slot0 = BattleForGuild
IMG_PATH = "images/battle/"
slot1 = "music01.mp3"
slot2 = 5
slot3 = 40
slot4 = 1
slot5 = false
battleBaseLayer = nil
slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13 = nil
slot14 = 1
slot15 = 2
slot16, slot17, slot18, slot19, slot20 = nil
slot21 = 1
slot22 = nil
slot23 = 999
slot24 = {}
slot25 = {}
slot26 = {}
slot27 = {}
slot28 = nil
slot29 = false

function getPlayMaxWinCount(slot0)
	for slot4, slot5 in pairs(uv0.server.team1.memberList) do
		if tonumber(slot5.uid) == tonumber(slot0) then
			return slot5.maxWin
		end
	end

	for slot4, slot5 in pairs(uv0.server.team2.memberList) do
		if tonumber(slot5.uid) == tonumber(slot0) then
			return slot5.maxWin
		end
	end

	return nil
end

function getCardByTeamId(slot0)
	slot0 = slot0 .. ""

	if uv0.members ~= nil then
		for slot4, slot5 in pairs(uv0.members) do
			if slot0 == slot4 then
				slot8 = BattleCardUtil.getBattlePlayerCardImage(0, false, tonumber(slot5.htid), false, slot5.replaceImage)
				slot10 = CCLabelTTF:create(slot5.name .. "", g_sFontPangWa, 25)

				slot10:setColor(slot5.color)
				slot10:setAnchorPoint(ccp(0.5, 0.5))
				slot10:setPosition(slot8:getContentSize().width / 2, -slot8:getContentSize().height * 0.3)
				slot8:addChild(slot10, 91)

				slot11 = CCLabelTTF:create(GetLocalizeStringBy("key_1950"), g_sFontPangWa, 21)

				slot11:setColor(ccc3(255, 255, 255))
				slot11:setAnchorPoint(ccp(0.5, 0.5))
				slot11:setPosition(slot8:getContentSize().width * 0.25, -slot8:getContentSize().height * 0.6)
				slot8:addChild(slot11, 92)

				if uv1[slot0 .. ""] == nil then
					slot12 = 0
				end

				slot14 = CCLabelTTF:create(slot12 .. "/" .. (slot5.maxWin or uv2), g_sFontPangWa, 25)

				slot14:setColor(ccc3(0, 255, 24))
				slot14:setAnchorPoint(ccp(0.5, 0.5))
				slot14:setPosition(slot8:getContentSize().width * 0.7, -slot8:getContentSize().height * 0.6)
				slot8:addChild(slot14, 93, 93)

				return slot8
			end
		end
	end

	if uv3 ~= nil then
		for slot4, slot5 in pairs(uv3.members) do
			if slot0 == slot4 then
				slot8 = BattleCardUtil.getBattlePlayerCardImage(0, false, tonumber(slot5.htid), false, slot5.replaceImage)
				slot10 = CCLabelTTF:create(slot5.name .. "", g_sFontPangWa, 25)

				slot10:setColor(slot5.color)
				slot10:setAnchorPoint(ccp(0.5, 0.5))
				slot10:setPosition(slot8:getContentSize().width / 2, slot8:getContentSize().height * 1.3)
				slot8:addChild(slot10, 91)

				slot11 = CCLabelTTF:create(GetLocalizeStringBy("key_1950"), g_sFontPangWa, 21)

				slot11:setColor(ccc3(255, 255, 255))
				slot11:setAnchorPoint(ccp(0.5, 0.5))
				slot11:setPosition(slot8:getContentSize().width * 0.25, slot8:getContentSize().height * 1.6)
				slot8:addChild(slot11, 92)

				if uv1[slot0 .. ""] == nil then
					slot12 = 0
				end

				slot14 = CCLabelTTF:create(slot12 .. "/" .. (slot5.maxWin or uv2), g_sFontPangWa, 25)

				slot14:setColor(ccc3(0, 255, 24))
				slot14:setAnchorPoint(ccp(0.5, 0.5))
				slot14:setPosition(slot8:getContentSize().width * 0.7, slot8:getContentSize().height * 1.6)
				slot8:addChild(slot14, 93, 93)

				return slot8
			end
		end
	end

	return nil
end

function removeSelf(slot0)
	slot0:removeFromParentAndCleanup(true)
end

function getCardPosition(slot0)
	for slot4, slot5 in pairs(uv0) do
		if tonumber(slot5) == tonumber(slot0) then
			return tonumber(slot4)
		end
	end
end

function initBackground(slot0)
	if slot0 == nil then
		slot0 = "zuduifuben_1.jpg"
	end

	CCTexture2D:setDefaultAlphaPixelFormat(kCCTexture2DPixelFormat_RGB565)

	uv0 = CCSprite:create(IMG_PATH .. "bg/" .. slot0)
	slot2 = CCDirector:sharedDirector():getWinSize()

	uv0:setAnchorPoint(ccp(0.5, 0.5))
	uv0:setPosition(slot2.width / 2, slot2.height / 2)
	uv0:setScale(slot2.width / uv0:getContentSize().width)
	CCTexture2D:setDefaultAlphaPixelFormat(CCTexture2D:defaultAlphaPixelFormat())
end

function layerTouch()
	return true
end

function initTeamInfo()
	uv0 = {}
	uv1 = {}
	uv2 = {
		memberCount = uv3.server.team1.memberCount,
		name = uv3.server.team1.name,
		level = uv3.server.team1.level,
		members = {},
		memberCount = 0,
		leftMemberCount = 0
	}
	uv4 = {
		memberCount = uv3.server.team2.memberCount,
		name = uv3.server.team2.name,
		level = uv3.server.team2.level,
		members = {},
		memberCount = 0,
		leftMemberCount = 0
	}
	slot0 = true

	if table.count(uv3.server.team1.memberList) == 0 or table.count(uv3.server.team2.memberList) == 0 then
		return false
	end

	for slot4 = 1, #uv3.server.team1.memberList do
		slot5 = uv3.server.team1.memberList[slot4].uid .. ""
		uv0[slot5] = tonumber(uv3.server.team1.memberList[slot4].maxHp)
		uv1[slot5] = tonumber(uv3.server.team1.memberList[slot4].maxHp)
		uv2.members[slot5] = {
			maxHp = tonumber(uv3.server.team1.memberList[slot4].maxHp),
			currentHp = tonumber(uv3.server.team1.memberList[slot4].maxHp),
			name = uv3.server.team1.memberList[slot4].name,
			maxWin = uv3.server.team1.memberList[slot4].maxWin
		}
		uv2.memberCount = uv2.memberCount + 1
		uv2.leftMemberCount = uv2.leftMemberCount + 1

		if tonumber(slot5) >= 20000 then
			uv2.members[slot5].htid = tonumber(uv3.server.team1.memberList[slot4].htid)

			require("script/ui/hero/HeroPublicLua")

			uv2.members[slot5].color = HeroPublicLua.getCCColorByStarLevel(DB_Heroes.getDataById(uv2.members[slot5].htid).star_lv)
		else
			slot6 = tonumber(uv3.server.team1.memberList[slot4].name)

			require("db/DB_Army")

			slot7 = DB_Army.getDataById(slot6)

			require("db/DB_Team")

			slot9 = DB_Team.getDataById(slot7.monster_group).copyTeamShowId

			print("monsterHtid:", slot9, slot7.monster_group, slot6)
			require("db/DB_Monsters_tmpl")

			slot10 = DB_Monsters_tmpl.getDataById(slot9)
			uv2.members[slot5].htid = tonumber(slot9)
			uv2.members[slot5].name = slot10.name

			require("script/ui/hero/HeroPublicLua")

			uv2.members[slot5].color = HeroPublicLua.getCCColorByStarLevel(slot10.star_lv)
		end

		if uv3.server.team1.memberList[slot4].dress ~= nil then
			for slot9, slot10 in pairs(uv3.server.team1.memberList[slot4].dress) do
				require("db/DB_Item_dress")

				slot12 = DB_Item_dress.getDataById(tonumber(slot10))

				print("dress changeModel:", slot12.changeModel)

				if slot12.changeModel == nil then
					break
				end

				for slot17 = 1, #lua_string_split(slot12.changeModel, ",") do
					require("db/DB_Heroes")

					if DB_Heroes.getDataById(uv2.members[slot5].htid).model_id == tonumber(lua_string_split(slot13[slot17], "|")[1]) then
						uv2.members[slot5].replaceImage = lua_string_split(slot13[slot17], "|")[2]
					end
				end
			end
		end
	end

	for slot4 = 1, #uv3.server.team2.memberList do
		slot5 = uv3.server.team2.memberList[slot4].uid .. ""
		uv0[slot5] = tonumber(uv3.server.team2.memberList[slot4].maxHp)
		uv1[slot5] = tonumber(uv3.server.team2.memberList[slot4].maxHp)
		uv4.members[slot5] = {
			maxHp = tonumber(uv3.server.team2.memberList[slot4].maxHp),
			currentHp = tonumber(uv3.server.team2.memberList[slot4].maxHp),
			name = uv3.server.team2.memberList[slot4].name
		}
		uv4.memberCount = uv4.memberCount + 1
		uv4.leftMemberCount = uv4.leftMemberCount + 1
		uv4.members[slot5].maxWin = uv3.server.team2.memberList[slot4].maxWin

		if tonumber(slot5) >= 20000 then
			uv4.members[slot5].htid = tonumber(uv3.server.team2.memberList[slot4].htid)

			require("script/ui/hero/HeroPublicLua")

			uv4.members[slot5].color = HeroPublicLua.getCCColorByStarLevel(DB_Heroes.getDataById(uv4.members[slot5].htid).star_lv)
		else
			slot6 = tonumber(uv3.server.team2.memberList[slot4].name)

			require("db/DB_Army")

			slot7 = DB_Army.getDataById(slot6)

			require("db/DB_Team")

			slot9 = DB_Team.getDataById(slot7.monster_group).copyTeamShowId

			print("monsterHtid:", slot9, slot7.monster_group, slot6)
			require("db/DB_Monsters_tmpl")

			slot10 = DB_Monsters_tmpl.getDataById(slot9)
			uv4.members[slot5].htid = tonumber(slot9)
			uv4.members[slot5].name = slot10.name

			require("script/ui/hero/HeroPublicLua")

			uv4.members[slot5].color = HeroPublicLua.getCCColorByStarLevel(slot10.star_lv)
		end

		if uv3.server.team2.memberList[slot4].dress ~= nil then
			for slot9, slot10 in pairs(uv3.server.team2.memberList[slot4].dress) do
				require("db/DB_Item_dress")

				if DB_Item_dress.getDataById(tonumber(slot10)).changeModel == nil then
					break
				end

				for slot17 = 1, #lua_string_split(slot12.changeModel, ",") do
					require("db/DB_Heroes")

					if DB_Heroes.getDataById(uv4.members[slot5].htid).model_id == tonumber(lua_string_split(slot13[slot17], "|")[1]) then
						uv4.members[slot5].replaceImage = lua_string_split(slot13[slot17], "|")[2]
					end
				end
			end
		end
	end

	return true
end

function isUidInTeam1(slot0)
	return uv0.members[slot0 .. ""] ~= nil
end

function initBattleBlocks()
	slot0 = {}
	slot1 = {}
	slot2 = {}

	for slot6 = 1, #uv0.server.arrProcess do
		if uv0.server.arrProcess[slot6][1].brid ~= nil then
			slot10 = uv0.server.arrProcess[slot6][1].brid

			print("m_battleData.server.arrProcess[processId].1.brid:", slot10)

			for slot10 = 1, #uv0.server.arrProcess[slot6][1].simpleRecord do
				slot11 = #slot0 + 1
				slot0[slot11] = {
					roundNumber = slot6
				}

				if isUidInTeam1(uv0.server.arrProcess[slot6][1].attacker) == true then
					slot0[slot11].attacker = uv0.server.arrProcess[slot6][1].attacker
					slot0[slot11].defender = uv0.server.arrProcess[slot6][1].defender
					slot0[slot11].attackerDamage = uv0.server.arrProcess[slot6][1].simpleRecord[slot10][1]
					slot0[slot11].defenderDamage = uv0.server.arrProcess[slot6][1].simpleRecord[slot10][2]

					if slot10 == #uv0.server.arrProcess[slot6][1].simpleRecord then
						slot0[slot11].isFightOver = true

						if uv0.server.arrProcess[slot6][1].appraise == "F" then
							slot0[slot11].isAttackerLeave = true
							slot0[slot11].isDefenderLeave = false
							slot0[slot11].isAttackerWin = false
						elseif uv0.server.arrProcess[slot6][1].appraise == "E" then
							slot0[slot11].isAttackerLeave = true
							slot0[slot11].isDefenderLeave = true
							slot0[slot11].isAttackerWin = false
						else
							slot0[slot11].isAttackerLeave = false
							slot0[slot11].isDefenderLeave = true
							slot0[slot11].isAttackerWin = true
						end
					end
				else
					slot0[slot11].attacker = uv0.server.arrProcess[slot6][1].defender
					slot0[slot11].defender = uv0.server.arrProcess[slot6][1].attacker
					slot0[slot11].attackerDamage = uv0.server.arrProcess[slot6][1].simpleRecord[slot10][2]
					slot0[slot11].defenderDamage = uv0.server.arrProcess[slot6][1].simpleRecord[slot10][1]

					if slot10 == #uv0.server.arrProcess[slot6][1].simpleRecord then
						slot0[slot11].isFightOver = true

						if uv0.server.arrProcess[slot6][1].appraise == "F" then
							slot0[slot11].isAttackerLeave = false
							slot0[slot11].isDefenderLeave = true
							slot0[slot11].isAttackerWin = true
						elseif uv0.server.arrProcess[slot6][1].appraise == "E" then
							slot0[slot11].isAttackerLeave = true
							slot0[slot11].isDefenderLeave = true
							slot0[slot11].isAttackerWin = false
						else
							slot0[slot11].isAttackerLeave = true
							slot0[slot11].isDefenderLeave = false
							slot0[slot11].isAttackerWin = false
						end
					end
				end
			end
		end

		if uv0.server.arrProcess[slot6][2].brid ~= nil then
			slot10 = uv0.server.arrProcess[slot6][2].brid

			print("m_battleData.server.arrProcess[processId].2.brid:", slot10)

			for slot10 = 1, #uv0.server.arrProcess[slot6][2].simpleRecord do
				slot11 = #slot1 + 1
				slot1[slot11] = {
					roundNumber = slot6
				}

				if isUidInTeam1(uv0.server.arrProcess[slot6][2].attacker) == true then
					slot1[slot11].attacker = uv0.server.arrProcess[slot6][2].attacker
					slot1[slot11].defender = uv0.server.arrProcess[slot6][2].defender
					slot1[slot11].attackerDamage = uv0.server.arrProcess[slot6][2].simpleRecord[slot10][1]
					slot1[slot11].defenderDamage = uv0.server.arrProcess[slot6][2].simpleRecord[slot10][2]

					if slot10 == #uv0.server.arrProcess[slot6][2].simpleRecord then
						slot1[slot11].isFightOver = true

						if uv0.server.arrProcess[slot6][2].appraise == "F" then
							slot1[slot11].isAttackerLeave = true
							slot1[slot11].isDefenderLeave = false
							slot1[slot11].isAttackerWin = false
						elseif uv0.server.arrProcess[slot6][2].appraise == "E" then
							slot1[slot11].isAttackerLeave = true
							slot1[slot11].isDefenderLeave = true
							slot1[slot11].isAttackerWin = false
						else
							slot1[slot11].isAttackerLeave = false
							slot1[slot11].isDefenderLeave = true
							slot1[slot11].isAttackerWin = true
						end
					end
				else
					slot1[slot11].attacker = uv0.server.arrProcess[slot6][2].defender
					slot1[slot11].defender = uv0.server.arrProcess[slot6][2].attacker
					slot1[slot11].attackerDamage = uv0.server.arrProcess[slot6][2].simpleRecord[slot10][2]
					slot1[slot11].defenderDamage = uv0.server.arrProcess[slot6][2].simpleRecord[slot10][1]

					if slot10 == #uv0.server.arrProcess[slot6][2].simpleRecord then
						slot1[slot11].isFightOver = true

						if uv0.server.arrProcess[slot6][2].appraise == "F" then
							slot1[slot11].isAttackerLeave = false
							slot1[slot11].isDefenderLeave = true
							slot1[slot11].isAttackerWin = true
						elseif uv0.server.arrProcess[slot6][2].appraise == "E" then
							slot1[slot11].isAttackerLeave = true
							slot1[slot11].isDefenderLeave = true
							slot1[slot11].isAttackerWin = false
						else
							slot1[slot11].isAttackerLeave = true
							slot1[slot11].isDefenderLeave = false
							slot1[slot11].isAttackerWin = false
						end
					end
				end
			end
		end

		if uv0.server.arrProcess[slot6][3].brid ~= nil then
			slot10 = uv0.server.arrProcess[slot6][3].brid

			print("m_battleData.server.arrProcess[processId].3.brid:", slot10)

			for slot10 = 1, #uv0.server.arrProcess[slot6][3].simpleRecord do
				slot11 = #slot2 + 1
				slot2[slot11] = {
					roundNumber = slot6
				}

				if isUidInTeam1(uv0.server.arrProcess[slot6][3].attacker) == true then
					slot2[slot11].attacker = uv0.server.arrProcess[slot6][3].attacker
					slot2[slot11].defender = uv0.server.arrProcess[slot6][3].defender
					slot2[slot11].attackerDamage = uv0.server.arrProcess[slot6][3].simpleRecord[slot10][1]
					slot2[slot11].defenderDamage = uv0.server.arrProcess[slot6][3].simpleRecord[slot10][2]

					if slot10 == #uv0.server.arrProcess[slot6][3].simpleRecord then
						slot2[slot11].isFightOver = true

						if uv0.server.arrProcess[slot6][3].appraise == "F" then
							slot2[slot11].isAttackerLeave = true
							slot2[slot11].isDefenderLeave = false
							slot2[slot11].isAttackerWin = false
						elseif uv0.server.arrProcess[slot6][3].appraise == "E" then
							slot2[slot11].isAttackerLeave = true
							slot2[slot11].isDefenderLeave = true
							slot2[slot11].isAttackerWin = false
						else
							slot2[slot11].isAttackerLeave = false
							slot2[slot11].isDefenderLeave = true
							slot2[slot11].isAttackerWin = true
						end
					end
				else
					slot2[slot11].attacker = uv0.server.arrProcess[slot6][3].defender
					slot2[slot11].defender = uv0.server.arrProcess[slot6][3].attacker
					slot2[slot11].attackerDamage = uv0.server.arrProcess[slot6][3].simpleRecord[slot10][2]
					slot2[slot11].defenderDamage = uv0.server.arrProcess[slot6][3].simpleRecord[slot10][1]

					if slot10 == #uv0.server.arrProcess[slot6][3].simpleRecord then
						slot2[slot11].isFightOver = true

						if uv0.server.arrProcess[slot6][3].appraise == "F" then
							slot2[slot11].isAttackerLeave = false
							slot2[slot11].isDefenderLeave = true
							slot2[slot11].isAttackerWin = true
						elseif uv0.server.arrProcess[slot6][3].appraise == "E" then
							slot2[slot11].isAttackerLeave = true
							slot2[slot11].isDefenderLeave = true
							slot2[slot11].isAttackerWin = false
						else
							slot2[slot11].isAttackerLeave = true
							slot2[slot11].isDefenderLeave = false
							slot2[slot11].isAttackerWin = false
						end
					end
				end
			end
		end
	end

	print("============rawPosition1BlockArray==============")
	print_table("rawPosition1BlockArray", slot0)
	print("============rawPosition2BlockArray==============")
	print_table("rawPosition2BlockArray", slot1)
	print("============rawPosition3BlockArray==============")
	print_table("rawPosition3BlockArray", slot2)

	slot3 = {
		[slot7 .. ""] = 0
	}

	for slot7, slot8 in pairs(uv1.members) do
		-- Nothing
	end

	for slot7, slot8 in pairs(uv2.members) do
		slot3[slot7 .. ""] = 0
	end

	slot4 = 1
	slot5 = 1
	slot6 = 1
	uv3 = {
		["1"] = {},
		["2"] = {},
		["3"] = {}
	}

	function slot7(slot0, slot1)
		print("hasPreFight:", slot0 .. "," .. slot1)

		if tonumber(slot1) == 1 then
			print("hasPreFight false:", slot0 .. "," .. slot1)

			return false
		end

		for slot5 = 1, slot1 - 1 do
			for slot9 = 1, 3 do
				if uv0.server.arrProcess[slot5][slot9].defender ~= nil and tonumber(uv0.server.arrProcess[slot5][slot9].defender) == tonumber(slot0) then
					return true
				end

				if uv0.server.arrProcess[slot5][slot9].attacker ~= nil and tonumber(uv0.server.arrProcess[slot5][slot9].attacker) == tonumber(slot0) then
					return true
				end
			end
		end

		print("hasPreFight false:", slot0 .. "," .. slot1)

		return false
	end

	for slot11 = 1, 9999 do
		if slot4 > #slot0 and slot5 > #slot1 and slot6 > #slot2 then
			print("battleBlocks.blockLength:", uv3.blockLength)

			uv3.blockLength = slot11

			break
		end

		slot12 = {}

		if slot0[slot4] ~= nil then
			if (slot3[slot0[slot4].attacker .. ""] == 0 and not slot7(slot13.attacker, slot13.roundNumber) or slot3[slot13.attacker .. ""] == 4) == true and (slot3[slot13.defender .. ""] == 0 and not slot7(slot13.defender, slot13.roundNumber) or slot3[slot13.defender .. ""] == 4) == true or slot3[slot13.attacker .. ""] == 1 and slot3[slot13.defender .. ""] == 1 then
				uv3["1"][slot11] = slot13

				if slot13.isFightOver == true then
					slot3[slot13.attacker .. ""] = 4
					slot3[slot13.defender .. ""] = 4
				else
					slot3[slot13.attacker .. ""] = 1
					slot3[slot13.defender .. ""] = 1
				end

				slot4 = slot4 + 1
				slot12[#slot12 + 1] = slot13.attacker .. ""
				slot12[#slot12 + 1] = slot13.defender .. ""
			end
		end

		if slot1[slot5] ~= nil then
			slot13 = slot1[slot5]
			slot14 = false

			for slot18 = 1, #slot12 do
				if slot12[slot18] == slot13.attacker .. "" or slot12[slot18] == slot13.defender .. "" then
					slot14 = true
				end
			end

			if slot14 == false then
				if (slot3[slot13.attacker .. ""] == 0 and not slot7(slot13.attacker, slot13.roundNumber) or slot3[slot13.attacker .. ""] == 4) == true and (slot3[slot13.defender .. ""] == 0 and not slot7(slot13.defender, slot13.roundNumber) or slot3[slot13.defender .. ""] == 4) == true or slot3[slot13.attacker .. ""] == 2 and slot3[slot13.defender .. ""] == 2 then
					uv3["2"][slot11] = slot13

					if slot13.isFightOver == true then
						slot3[slot13.attacker .. ""] = 4
						slot3[slot13.defender .. ""] = 4
					else
						slot3[slot13.attacker .. ""] = 2
						slot3[slot13.defender .. ""] = 2
					end

					slot5 = slot5 + 1
					slot12[#slot12 + 1] = slot13.attacker .. ""
					slot12[#slot12 + 1] = slot13.defender .. ""
				end
			end
		end

		if slot2[slot6] ~= nil then
			slot13 = slot2[slot6]
			slot14 = false

			for slot18 = 1, #slot12 do
				if slot12[slot18] == slot13.attacker .. "" or slot12[slot18] == slot13.defender .. "" then
					slot14 = true
				end
			end

			if slot14 == false then
				if (slot3[slot13.attacker .. ""] == 0 and not slot7(slot13.attacker, slot13.roundNumber) or slot3[slot13.attacker .. ""] == 4) == true and (slot3[slot13.defender .. ""] == 0 and not slot7(slot13.defender, slot13.roundNumber) or slot3[slot13.defender .. ""] == 4) == true or slot3[slot13.attacker .. ""] == 3 and slot3[slot13.defender .. ""] == 3 then
					uv3["3"][slot11] = slot13

					if slot13.isFightOver == true then
						slot3[slot13.attacker .. ""] = 4
						slot3[slot13.defender .. ""] = 4
					else
						slot3[slot13.attacker .. ""] = 3
						slot3[slot13.defender .. ""] = 3
					end

					slot6 = slot6 + 1
				end
			end
		end
	end
end

function getTeam1PointByPosition(slot0)
	slot1 = uv0:getContentSize().width * 0.2

	return ccp(0.2 * uv0:getContentSize().width + (slot0 - 1) % 3 * slot1 * 1.4, 0.5 * uv0:getContentSize().height - slot1 * 1.2)
end

function playWalkEffect()
	if file_exists("audio/effect/" .. ("walk0" .. math.floor(math.random() * 5 + 1)) .. ".mp3") then
		AudioUtil.playEffect("audio/effect/" .. slot0 .. ".mp3")
	end
end

function startWalkEffect()
	if CCDirector:sharedDirector():getRunningScene():getActionByTag(5643) == nil then
		schedule(slot0, playWalkEffect, 0.45):setTag(5643)
	end
end

function endWalkEffect()
	slot0 = CCDirector:sharedDirector():getRunningScene()

	slot0:stopActionByTag(5643)
	slot0:setPosition(0, 0)
end

function getTeam2PointByPosition(slot0)
	slot1 = uv0:getContentSize().width * 0.2

	return ccp(0.2 * uv0:getContentSize().width + (slot0 - 1) % 3 * slot1 * 1.4, 0.5 * uv0:getContentSize().height + slot1 * 1.2)
end

function setTeam1Back()
	slot0 = uv0:getChildren()
	slot4 = slot0

	for slot4 = 1, slot0.count(slot4) do
		if math.floor(tolua.cast(slot0:objectAtIndex(slot4 - 1), "CCNode"):getTag() / 10) == 100 then
			slot5:setVisible(true)
		else
			slot5:cleanup()
			slot5:setVisible(false)
			slot5:setTag(0)
		end
	end

	endWalkEffect()
end

function setTeam2Back()
	slot0 = uv0:getChildren()
	slot4 = slot0

	for slot4 = 1, slot0.count(slot4) do
		if math.floor(tolua.cast(slot0:objectAtIndex(slot4 - 1), "CCNode"):getTag() / 10) == 200 then
			slot5:setVisible(true)
		else
			slot5:cleanup()
			slot5:setVisible(false)
			slot5:setTag(0)
		end
	end

	endWalkEffect()
end

function showDamage(slot0, slot1)
	damageLabel = LuaCC.createNumberSprite02(IMG_PATH .. "number/red", "" .. slot1, 43)

	damageLabel:setAnchorPoint(ccp(0.5, 0.5))

	slot3 = ccp(0, 0)

	damageLabel:setPosition((math.floor(slot0:getTag() / 1000) ~= 1 or ccp(slot0:getPositionX(), slot0:getPositionY() - slot0:getContentSize().height * 0)) and ccp(slot0:getPositionX(), slot0:getPositionY() + slot0:getContentSize().height * 0))
	slot0:getParent():addChild(damageLabel, 999)

	if damageTitleSprite ~= nil then
		damageLabel:addChild(damageTitleSprite)
	end

	slot4 = CCArray:create()

	slot4:addObject(CCScaleTo:create(0.1, 2))
	slot4:addObject(CCScaleTo:create(0.05, 1))
	slot4:addObject(CCDelayTime:create(1))
	slot4:addObject(CCScaleTo:create(0.08, 0.01))
	slot4:addObject(CCCallFuncN:create(removeSelf))
	damageLabel:runAction(CCSequence:create(slot4))
end

function closeLayer()
	CCDirector:sharedDirector():getScheduler():setTimeScale(1)

	if m_visibleViews ~= nil then
		slot1 = m_visibleViews
		slot3 = slot1

		for slot3 = 1, slot1.count(slot3) do
			slot4 = tolua.cast(m_visibleViews:objectAtIndex(slot3 - 1), "CCNode")

			print("closeLayer childNode:getTag():", slot4:getTag())

			if slot4 ~= nil and slot4:getTag() ~= 90901 then
				slot4:setVisible(true)
			end
		end

		m_visibleViews:removeAllObjects()
		m_visibleViews:release()

		m_visibleViews = nil
	end

	battleBaseLayer:removeFromParentAndCleanup(true)
	AudioUtil.playMainBgm()
	require("script/ui/login/LoginScene")
	LoginScene.setBattleStatus(false)
end

function showAfterBattleLayer()
	print("show battle report")

	if uv0 then
		battleBaseLayer:addChild(uv0, 1111, 9569)
		uv0:release()
		print("show extern battle report layer")

		return
	end

	if uv1 == BattleForGuild then
		require("script/ui/guild/GuildAfterBattleLayer")
		battleBaseLayer:addChild(GuildAfterBattleLayer.createAfterBattleLayer(uv2, uv3), 1111, 9569)
		print("show BattleForGuild report layer")
	elseif uv1 == BattleForCity then
		require("script/ui/guild/city/CityAfterBattleLayer")
		battleBaseLayer:addChild(CityAfterBattleLayer.createAfterBattleLayer(uv2, uv3), 1111, 9569)
		print("show BattleForCity report layer")
	end
end

function blockEnd()
	print("blockEnd start")

	uv0 = uv0 + 1

	print("battleBlockIndex,battleBlocks.blockLength:", uv0, uv1.blockLength)

	if uv1.blockLength <= uv0 then
		if uv2.reward == nil then
			uv2.reward = {}
		end

		if uv2.reward.silver ~= nil and uv3 then
			uv3:setString(uv2.reward.silver .. "")
		end

		if uv2.reward.soul ~= nil and uv4 then
			uv4:setString(uv2.reward.soul .. "")
		end

		if uv2.reward.item ~= nil and uv5 then
			for slot4, slot5 in pairs(uv2.reward.item) do
				slot0 = 0 + 1
			end

			uv5:setString(slot0 .. "")
		end

		slot0 = CCArray:create()

		slot0:addObject(CCDelayTime:create(1.5))
		slot0:addObject(CCCallFunc:create(showAfterBattleLayer))
		uv6:runAction(CCSequence:create(slot0))

		return
	end

	slot0 = CCArray:create()

	slot0:addObject(CCDelayTime:create(1))
	slot0:addObject(CCCallFunc:create(moveInBeforeFight))
	uv6:runAction(CCSequence:create(slot0))
end

function slot30()
	if uv0 == BattleForCity then
		require("script/ui/guild/copy/GuildBattleReportLayer")
		GuildBattleReportLayer.showLayer(uv1, true, -560, 11111, true)
	else
		require("script/ui/guild/copy/GuildBattleReportLayer")
		GuildBattleReportLayer.showLayer(uv1, true, -560, 11111)
	end
end

function slot31()
	require("script/model/user/UserModel")

	if UserModel.getHeroLevel() == nil or tonumber(UserModel.getHeroLevel()) < uv0 then
		require("script/ui/tip/AnimationTip")
		AnimationTip.showTip(GetLocalizeStringBy("key_2997") .. uv0 .. GetLocalizeStringBy("key_2293"))

		return
	end

	battleSpeedButton1:setVisible(false)
	battleSpeedButton2:setVisible(true)
	battleSpeedButton3:setVisible(false)

	uv1 = 2

	CCDirector:sharedDirector():getScheduler():setTimeScale(uv1)
end

function slot32()
	require("script/model/user/UserModel")

	if UserModel.getHeroLevel() == nil or tonumber(UserModel.getHeroLevel()) < uv0 then
		require("script/ui/tip/AnimationTip")
		AnimationTip.showTip(GetLocalizeStringBy("key_2997") .. uv0 .. GetLocalizeStringBy("key_2462"))
		battleSpeedButton2:setVisible(false)
		battleSpeedButton1:setVisible(true)
		battleSpeedButton3:setVisible(false)

		uv1 = 1

		CCDirector:sharedDirector():getScheduler():setTimeScale(uv1)

		return
	end

	battleSpeedButton2:setVisible(false)
	battleSpeedButton1:setVisible(false)
	battleSpeedButton3:setVisible(true)

	uv1 = 3

	CCDirector:sharedDirector():getScheduler():setTimeScale(uv1)
end

function slot33()
	battleSpeedButton2:setVisible(false)
	battleSpeedButton1:setVisible(true)
	battleSpeedButton3:setVisible(false)

	uv0 = 1

	CCDirector:sharedDirector():getScheduler():setTimeScale(uv0)
end

function slot34()
	require("db/DB_Normal_config")

	slot0 = lua_string_split(DB_Normal_config.getDataById(1).teamcopyisSkipFight, "|")
	slot2 = tonumber(slot0[2])

	if UserModel.getVipLevel() < tonumber(slot0[1]) or UserModel.getHeroLevel() < slot2 then
		AnimationTip.showTip(GetLocalizeStringBy("lcyx_104", slot1, slot2))

		return
	end

	uv0:removeAllChildrenWithCleanup(true)
	endWalkEffect()

	uv1 = nil
	uv2 = nil

	if uv3 then
		battleBaseLayer:addChild(uv3, 1111, 9569)
		uv3:release()
		print("show extern battle report layer")

		return
	end

	if uv4 == BattleForGuild then
		require("script/ui/guild/GuildAfterBattleLayer")
		battleBaseLayer:addChild(GuildAfterBattleLayer.createAfterBattleLayer(uv5, uv6), 1111, 9569)
	elseif uv4 == BattleForCity then
		print("skipClick BattleForCity")
		require("script/ui/guild/city/CityAfterBattleLayer")
		battleBaseLayer:addChild(CityAfterBattleLayer.createAfterBattleLayer(uv5, uv6), 1111, 9569)
	end
end

function initCityUperLayer(...)
	require("script/ui/main/MainScene")
	MainScene.initScales()

	uv0 = CCLayer:create()
	slot0 = CCLayerColor:create(ccc4(0, 0, 0, 111))

	slot0:setContentSize(CCSizeMake(CCDirector:sharedDirector():getWinSize().width, CCDirector:sharedDirector():getWinSize().height * 0.05))
	slot0:setPosition(0, CCDirector:sharedDirector():getWinSize().height * 0.96)
	uv0:addChild(slot0)

	slot1 = CCSprite:create(IMG_PATH .. "city/attacker.png")

	slot1:setAnchorPoint(ccp(0, 0.5))
	slot1:setPosition(battleBaseLayer:getContentSize().width * 0.01, battleBaseLayer:getContentSize().height * 0.98)
	uv0:addChild(slot1)

	attackerCountLabel = CCLabelTTF:create(uv1.memberCount .. "/" .. uv1.memberCount, g_sFontPangWa, battleBaseLayer:getContentSize().height / 35)

	attackerCountLabel:setAnchorPoint(ccp(0.5, 0.5))
	attackerCountLabel:setPosition(battleBaseLayer:getContentSize().width * 0.25, battleBaseLayer:getContentSize().height * 0.98)
	uv0:addChild(attackerCountLabel)
	attackerCountLabel:setColor(ccc3(232, 0, 0))

	battleRoundIcon = CCSprite:create(IMG_PATH .. "city/defender.png")

	battleRoundIcon:setAnchorPoint(ccp(0.5, 0.5))
	battleRoundIcon:setPosition(battleBaseLayer:getContentSize().width * 0.75, battleBaseLayer:getContentSize().height * 0.98)
	uv0:addChild(battleRoundIcon)

	uv2 = CCLabelTTF:create(uv3.memberCount .. "/" .. uv3.memberCount, g_sFontPangWa, battleBaseLayer:getContentSize().height / 35)

	uv2:setAnchorPoint(ccp(0.5, 0.5))
	uv2:setPosition(battleBaseLayer:getContentSize().width * 0.9, battleBaseLayer:getContentSize().height * 0.98)
	uv0:addChild(uv2)
	uv2:setColor(ccc3(0, 228, 255))

	slot2 = battleBaseLayer:getContentSize().width * 0.05
	slot3 = battleBaseLayer:getContentSize().width * 0.11
	slot4 = battleBaseLayer:getContentSize().width * 0.05
	battleSpeedButton1 = CCMenuItemImage:create(IMG_PATH .. "btn/btn_speed1_n.png", IMG_PATH .. "btn/btn_speed1_d.png")

	battleSpeedButton1:setAnchorPoint(ccp(0, 0))
	battleSpeedButton1:setPosition(0, 0)
	battleSpeedButton1:registerScriptTapHandler(uv4)
	battleSpeedButton1:setScale(MainScene.elementScale)

	battleSpeedButton2 = CCMenuItemImage:create(IMG_PATH .. "btn/btn_speed2_n.png", IMG_PATH .. "btn/btn_speed2_d.png")

	battleSpeedButton2:setAnchorPoint(ccp(0, 0))
	battleSpeedButton2:setPosition(0, 0)
	battleSpeedButton2:registerScriptTapHandler(uv5)
	battleSpeedButton2:setScale(MainScene.elementScale)

	battleSpeedButton3 = CCMenuItemImage:create(IMG_PATH .. "btn/btn_speed3_n.png", IMG_PATH .. "btn/btn_speed3_d.png")

	battleSpeedButton3:setAnchorPoint(ccp(0, 0))
	battleSpeedButton3:setPosition(0, 0)
	battleSpeedButton3:registerScriptTapHandler(uv6)
	battleSpeedButton3:setScale(MainScene.elementScale)

	if uv7 <= 1 then
		uv7 = 1

		CCDirector:sharedDirector():getScheduler():setTimeScale(uv7)
		battleSpeedButton2:setVisible(false)
		battleSpeedButton3:setVisible(false)
	else
		require("script/model/user/UserModel")

		if UserModel.getHeroLevel() == nil or tonumber(UserModel.getHeroLevel()) < uv8 then
			uv7 = 1

			CCDirector:sharedDirector():getScheduler():setTimeScale(uv7)
			battleSpeedButton2:setVisible(false)
			battleSpeedButton3:setVisible(false)
		elseif UserModel.getHeroLevel() == nil or tonumber(UserModel.getHeroLevel()) < uv9 or uv7 >= 2 and uv7 < 3 then
			uv7 = 2

			CCDirector:sharedDirector():getScheduler():setTimeScale(uv7)
			battleSpeedButton1:setVisible(false)
			battleSpeedButton3:setVisible(false)
		else
			uv7 = 3

			CCDirector:sharedDirector():getScheduler():setTimeScale(uv7)
			battleSpeedButton2:setVisible(false)
			battleSpeedButton1:setVisible(false)
		end
	end

	slot5 = CCMenu:create()

	slot5:setAnchorPoint(ccp(0, 0))
	slot5:setPosition(0, 0)
	uv0:addChild(slot5, 0, 1299)
	slot5:setTouchPriority(-550)

	skipFightButton = CCMenuItemImage:create(IMG_PATH .. "icon/icon_skip_n.png", IMG_PATH .. "icon/icon_skip_h.png")

	skipFightButton:registerScriptTapHandler(uv10)
	skipFightButton:setAnchorPoint(ccp(1, 0))
	skipFightButton:setPosition(battleBaseLayer:getContentSize().width * 1, 0)
	slot5:addChild(skipFightButton)
	skipFightButton:setScale(MainScene.elementScale)

	slot6 = CCScale9Sprite:create("images/common/btn/btn_purple2_n.png")

	slot6:setContentSize(CCSizeMake(180, 64))

	slot7 = CCScale9Sprite:create("images/common/btn/btn_purple2_h.png")

	slot7:setContentSize(CCSizeMake(180, 64))

	slot8 = CCScale9Sprite:create("images/common/btn/btn_purple2_n.png")

	slot8:setContentSize(CCSizeMake(180, 64))

	slot9 = CCMenuItemSprite:create(slot6, slot7, slot8)

	slot9:setAnchorPoint(ccp(0.5, 0))
	slot9:setPosition(ccp(battleBaseLayer:getContentSize().width * 0.5, 2))
	slot5:addChild(slot9)

	slot10 = CCRenderLabel:create(GetLocalizeStringBy("key_1924"), g_sFontPangWa, 35, 1, ccc3(0, 0, 0), type_stroke)

	slot10:setAnchorPoint(ccp(0.5, 0.5))
	slot10:setColor(ccc3(254, 219, 28))
	slot10:setPosition(ccp(slot9:getContentSize().width * 0.5, slot9:getContentSize().height * 0.5 + 2))
	slot9:addChild(slot10)
	slot9:registerScriptTapHandler(uv11)
	slot9:setScale(MainScene.elementScale)

	slot11 = CCScale9Sprite:create("images/battle/guild/iconBg.png")

	slot11:setContentSize(CCSizeMake(173, 49))
	slot11:setPosition(ccps(0, 0.47))
	slot11:setAnchorPoint(ccp(0, 0.5))
	uv0:addChild(slot11, 100)
	slot11:setScale(MainScene.elementScale)

	slot12 = CCSprite:create("images/battle/guild/attackerIcon.png")

	slot12:setAnchorPoint(ccp(0, 0.5))
	slot12:setPosition(ccp(0, slot11:getContentSize().height / 2))
	slot11:addChild(slot12)

	slot13 = CCRenderLabel:create(uv12.server.team1.name, g_sFontPangWa, 24, 1, ccc3(0, 0, 0), type_stroke)

	slot13:setAnchorPoint(ccp(0, 0.5))
	slot13:setPosition(slot12:getContentSize().width + 5, slot11:getContentSize().height / 2)
	slot11:addChild(slot13)

	slot14 = CCScale9Sprite:create("images/battle/guild/iconBg.png")

	slot14:setContentSize(CCSizeMake(173, 49))
	slot14:setPosition(ccps(1, 0.53))
	slot14:setAnchorPoint(ccp(1, 0.5))
	uv0:addChild(slot14, 100)
	slot14:setScale(MainScene.elementScale)

	slot15 = CCSprite:create("images/battle/guild/defenderIcon.png")

	slot15:setAnchorPoint(ccp(0, 0.5))
	slot15:setPosition(ccp(0, slot14:getContentSize().height / 2))
	slot14:addChild(slot15)

	slot16 = CCRenderLabel:create(uv12.server.team2.name, g_sFontPangWa, 24, 1, ccc3(0, 0, 0), type_stroke)

	slot16:setAnchorPoint(ccp(0, 0.5))
	slot16:setPosition(slot15:getContentSize().width + 5, slot14:getContentSize().height / 2)
	slot14:addChild(slot16)

	return uv0
end

function slot35()
	require("script/ui/main/MainScene")
	MainScene.initScales()

	uv0 = CCLayer:create()
	slot0 = CCLayerColor:create(ccc4(0, 0, 0, 111))

	slot0:setContentSize(CCSizeMake(CCDirector:sharedDirector():getWinSize().width, CCDirector:sharedDirector():getWinSize().height * 0.05))
	slot0:setPosition(0, CCDirector:sharedDirector():getWinSize().height * 0.96)
	uv0:addChild(slot0)

	battleRoundIcon = CCSprite:create(IMG_PATH .. "guild/enemy.png")

	battleRoundIcon:setAnchorPoint(ccp(0.5, 0.5))
	battleRoundIcon:setPosition(battleBaseLayer:getContentSize().width * 0.75, battleBaseLayer:getContentSize().height * 0.98)
	uv0:addChild(battleRoundIcon)

	uv1 = CCLabelTTF:create(uv2.memberCount .. "/" .. uv2.memberCount, g_sFontPangWa, battleBaseLayer:getContentSize().height / 35)

	uv1:setAnchorPoint(ccp(0.5, 0.5))
	uv1:setPosition(battleBaseLayer:getContentSize().width * 0.9, battleBaseLayer:getContentSize().height * 0.98)
	uv0:addChild(uv1)

	slot1 = battleBaseLayer:getContentSize().width * 0.05
	slot2 = battleBaseLayer:getContentSize().width * 0.11
	slot3 = battleBaseLayer:getContentSize().width * 0.05
	slot4 = CCSprite:create(IMG_PATH .. "icon/icon_resource.png")

	slot4:setAnchorPoint(ccp(0.5, 0.5))
	slot4:setPosition(slot1 + slot2 * 0, battleBaseLayer:getContentSize().height * 0.98)
	uv0:addChild(slot4)
	slot4:setScale(MainScene.elementScale)

	uv3 = CCLabelTTF:create("0", g_sFontName, battleBaseLayer:getContentSize().height / 35)

	uv3:setAnchorPoint(ccp(0, 0.5))
	uv3:setPosition(slot1 + slot2 * 0.5, battleBaseLayer:getContentSize().height * 0.98)
	uv0:addChild(uv3)

	slot5 = CCSprite:create(IMG_PATH .. "icon/icon_soul.png")

	slot5:setAnchorPoint(ccp(0.5, 0.5))
	slot5:setPosition(slot1 + slot2 * 1.5, battleBaseLayer:getContentSize().height * 0.98)
	uv0:addChild(slot5)
	slot5:setScale(MainScene.elementScale)

	uv4 = CCLabelTTF:create("0", g_sFontName, battleBaseLayer:getContentSize().height / 35)

	uv4:setAnchorPoint(ccp(0, 0.5))
	uv4:setPosition(slot1 + slot2 * 2, battleBaseLayer:getContentSize().height * 0.98)
	uv0:addChild(uv4)

	slot6 = CCSprite:create(IMG_PATH .. "icon/icon_money.png")

	slot6:setAnchorPoint(ccp(0.5, 0.5))
	slot6:setPosition(slot1 + slot2 * 3.5, battleBaseLayer:getContentSize().height * 0.98)
	uv0:addChild(slot6)
	slot6:setScale(MainScene.elementScale)

	uv5 = CCLabelTTF:create("0", g_sFontName, battleBaseLayer:getContentSize().height / 35)

	uv5:setAnchorPoint(ccp(0, 0.5))
	uv5:setPosition(slot1 + slot2 * 4, battleBaseLayer:getContentSize().height * 0.98)
	uv0:addChild(uv5)
	uv5:setColor(ccc3(255, 220, 32))

	battleSpeedButton1 = CCMenuItemImage:create(IMG_PATH .. "btn/btn_speed1_n.png", IMG_PATH .. "btn/btn_speed1_d.png")

	battleSpeedButton1:setAnchorPoint(ccp(0, 0))
	battleSpeedButton1:setPosition(0, 0)
	battleSpeedButton1:registerScriptTapHandler(uv6)
	battleSpeedButton1:setScale(MainScene.elementScale)

	battleSpeedButton2 = CCMenuItemImage:create(IMG_PATH .. "btn/btn_speed2_n.png", IMG_PATH .. "btn/btn_speed2_d.png")

	battleSpeedButton2:setAnchorPoint(ccp(0, 0))
	battleSpeedButton2:setPosition(0, 0)
	battleSpeedButton2:registerScriptTapHandler(uv7)
	battleSpeedButton2:setScale(MainScene.elementScale)

	battleSpeedButton3 = CCMenuItemImage:create(IMG_PATH .. "btn/btn_speed3_n.png", IMG_PATH .. "btn/btn_speed3_d.png")

	battleSpeedButton3:setAnchorPoint(ccp(0, 0))
	battleSpeedButton3:setPosition(0, 0)
	battleSpeedButton3:registerScriptTapHandler(uv8)
	battleSpeedButton3:setScale(MainScene.elementScale)

	if uv9 <= 1 then
		uv9 = 1

		CCDirector:sharedDirector():getScheduler():setTimeScale(uv9)
		battleSpeedButton2:setVisible(false)
		battleSpeedButton3:setVisible(false)
	else
		require("script/model/user/UserModel")

		if UserModel.getHeroLevel() == nil or tonumber(UserModel.getHeroLevel()) < uv10 then
			uv9 = 1

			CCDirector:sharedDirector():getScheduler():setTimeScale(uv9)
			battleSpeedButton2:setVisible(false)
			battleSpeedButton3:setVisible(false)
		elseif UserModel.getHeroLevel() == nil or tonumber(UserModel.getHeroLevel()) < uv11 or uv9 >= 2 and uv9 < 3 then
			uv9 = 2

			CCDirector:sharedDirector():getScheduler():setTimeScale(uv9)
			battleSpeedButton1:setVisible(false)
			battleSpeedButton3:setVisible(false)
		else
			uv9 = 3

			CCDirector:sharedDirector():getScheduler():setTimeScale(uv9)
			battleSpeedButton2:setVisible(false)
			battleSpeedButton1:setVisible(false)
		end
	end

	slot7 = CCMenu:create()

	slot7:setAnchorPoint(ccp(0, 0))
	slot7:setPosition(0, 0)
	uv0:addChild(slot7, 0, 1299)
	slot7:setTouchPriority(-550)

	skipFightButton = CCMenuItemImage:create(IMG_PATH .. "icon/icon_skip_n.png", IMG_PATH .. "icon/icon_skip_h.png")

	skipFightButton:registerScriptTapHandler(uv12)
	skipFightButton:setAnchorPoint(ccp(1, 0))
	skipFightButton:setPosition(battleBaseLayer:getContentSize().width * 1, 0)
	slot7:addChild(skipFightButton)
	skipFightButton:setScale(MainScene.elementScale)

	slot8 = CCScale9Sprite:create("images/common/btn/btn_purple2_n.png")

	slot8:setContentSize(CCSizeMake(180, 64))

	slot9 = CCScale9Sprite:create("images/common/btn/btn_purple2_h.png")

	slot9:setContentSize(CCSizeMake(180, 64))

	slot10 = CCScale9Sprite:create("images/common/btn/btn_purple2_n.png")

	slot10:setContentSize(CCSizeMake(180, 64))

	slot11 = CCMenuItemSprite:create(slot8, slot9, slot10)

	slot11:setAnchorPoint(ccp(0.5, 0))
	slot11:setPosition(ccp(battleBaseLayer:getContentSize().width * 0.5, 2))
	slot7:addChild(slot11)

	slot12 = CCRenderLabel:create(GetLocalizeStringBy("key_1924"), g_sFontPangWa, 35, 1, ccc3(0, 0, 0), type_stroke)

	slot12:setAnchorPoint(ccp(0.5, 0.5))
	slot12:setColor(ccc3(254, 219, 28))
	slot12:setPosition(ccp(slot11:getContentSize().width * 0.5, slot11:getContentSize().height * 0.5 + 2))
	slot11:addChild(slot12)
	slot11:registerScriptTapHandler(uv13)
	slot11:setScale(MainScene.elementScale)

	return uv0
end

function showFailAnimation(slot0)
	print("showFailAnimation start:", slot0:getTag())

	slot1 = 0

	slot0:setTag(0)

	slot2 = CCArray:create()

	slot2:addObject(CCSpawn:createWithTwoActions(CCRotateTo:create(1, 1800), CCMoveBy:create(1, ccp(0, math.floor(slot0:getTag() / 1000) == 1 and -500 or 500))))
	slot2:addObject(CCCallFuncN:create(removeSelf))
	slot0:runAction(CCSequence:create(slot2))
end

function showBump()
	print("showBump start")

	slot0 = 0
	slot1 = 0

	function slot2(slot0, slot1)
		uv0 = uv0 + 1

		print("bumpEnd start:", uv0, uv1)

		slot3 = math.floor(slot1:getTag() % 10)
		slot4 = 0
		slot5 = 0

		slot1:cleanup()
		slot1:setVisible(false)
		slot1:getParent():getChildByTag(slot1:getTag() - 500):setVisible(true)

		if math.floor(slot1:getTag() / 1000) == 1 then
			slot4 = uv2[slot3 .. ""][uv3].attackerDamage
			slot5 = uv2[slot3 .. ""][uv3].attacker
		else
			slot4 = uv2[slot3 .. ""][uv3].defenderDamage
			slot5 = uv2[slot3 .. ""][uv3].defender
		end

		uv4[slot5 .. ""] = uv4[slot5 .. ""] + slot4

		BattleCardUtil.setCardHp(slot1:getParent():getChildByTag(slot1:getTag() - 500), uv4[slot5 .. ""] / uv5[slot5 .. ""])
		showDamage(slot1:getParent():getChildByTag(slot1:getTag() - 500), slot4)

		if uv2[slot3 .. ""][uv3].isFightOver == true then
			uv6[slot5] = uv6[slot5] == nil and 0 or uv6[slot5]

			if uv2[slot3 .. ""][uv3].appraise == "E" then
				-- Nothing
			elseif uv2[slot3 .. ""][uv3].isAttackerWin == true and slot2 == 1 then
				uv6[slot5] = uv6[slot5] + 1

				showTalkDialog(slot1:getParent():getChildByTag(slot1:getTag() - 500), false, uv6[slot5], 2)
			elseif uv2[slot3 .. ""][uv3].isAttackerWin == false and slot2 == 2 then
				uv6[slot5] = uv6[slot5] + 1

				showTalkDialog(slot1:getParent():getChildByTag(slot1:getTag() - 500), true, uv6[slot5], 2)
			end

			if tonumber(getPlayMaxWinCount(slot5) or uv7) <= uv6[slot5] then
				uv8[#uv8 + 1] = slot1:getTag() - 500

				if uv9 == BattleForCity then
					for slot10, slot11 in pairs(uv10.server.team1.memberList) do
						if tonumber(slot11.uid) == tonumber(slot5) then
							if uv11.leftMemberCount < 0 then
								uv11.leftMemberCount = 0
							end

							uv11.leftMemberCount = uv11.leftMemberCount - 1

							attackerCountLabel:setString(uv11.leftMemberCount .. "/" .. uv11.memberCount)

							break
						end
					end

					for slot10, slot11 in pairs(uv10.server.team2.memberList) do
						if tonumber(slot11.uid) == tonumber(slot5) then
							uv12.leftMemberCount = uv12.leftMemberCount - 1

							if uv12.leftMemberCount < 0 then
								uv12.leftMemberCount = 0
							end

							uv13:setString(uv12.leftMemberCount .. "/" .. uv12.memberCount)

							break
						end
					end
				end
			end

			print("bumpEnd info:", slot2, uv2[slot3 .. ""][uv3].isAttackerLeave, uv2[slot3 .. ""][uv3].isDefenderLeave)

			if slot2 == 1 and uv2[slot3 .. ""][uv3].isAttackerLeave == true then
				showFailAnimation(slot1:getParent():getChildByTag(slot1:getTag() - 500))

				uv14[slot1:getTag() - 500] = nil

				if uv9 == BattleForCity then
					uv11.leftMemberCount = uv11.leftMemberCount - 1

					if uv11.leftMemberCount < 0 then
						uv11.leftMemberCount = 0
					end

					attackerCountLabel:setString(uv11.leftMemberCount .. "/" .. uv11.memberCount)
				end
			elseif slot2 == 2 and uv2[slot3 .. ""][uv3].isDefenderLeave == true then
				showFailAnimation(slot1:getParent():getChildByTag(slot1:getTag() - 500))

				uv14[slot1:getTag() - 500] = nil
				uv12.leftMemberCount = uv12.leftMemberCount - 1

				if uv12.leftMemberCount < 0 then
					uv12.leftMemberCount = 0
				end

				uv13:setString(uv12.leftMemberCount .. "/" .. uv12.memberCount)
			end

			if slot1:getParent():getChildByTag(slot1:getTag() - 500) ~= nil then
				tolua.cast(slot7:getChildByTag(93), "CCLabelTTF"):setString(uv6[slot5] .. "/" .. slot6)
			end
		end

		if uv0 < uv1 then
			-- Nothing
		elseif uv0 == uv1 then
			blockEnd()
		else
			print(" finish count out of animation count")
		end
	end

	for slot6 = 1, 3 do
		slot7 = uv0[slot6 .. ""][uv1]

		print("blockInfo:", uv1, slot7)

		if slot7 ~= nil and uv13 ~= nil then
			slot8 = uv13:getChildByTag(slot6 + 2000)

			print("m_team2CardLayer child start")

			slot9 = uv13:getChildren()
			slot13 = slot9

			for slot13 = 1, slot9.count(slot13) do
				print("m_team2CardLayer child node tag:", tolua.cast(slot9:objectAtIndex(slot13 - 1), "CCNode"):getTag())
			end

			uv14:removeChildByTag(1500 + slot6, true)
			uv13:removeChildByTag(2500 + slot6, true)

			if slot8 ~= nil and uv14 ~= nil then
				slot8:setVisible(false)

				slot10 = getCardByTeamId(slot7.defender)

				slot10:setTag(2500 + slot6)
				slot10:setAnchorPoint(ccp(0.5, 0.5))
				slot10:setPosition(getTeam2PointByPosition(slot6))
				slot10:setBasePoint(getTeam2PointByPosition(slot6))
				uv13:addChild(slot10, slot6)

				slot12 = BTAnimationEventDelegate:create()

				slot12:registerLayerEndedHandler(slot2)
				slot12:registerLayerChangedHandler(function (slot0, slot1)
				end)
				slot10:setDelegate(slot12)
				print("currentHp:", uv2[slot7.defender .. ""], uv3[slot7.defender .. ""])
				BattleCardUtil.setCardHp(slot10, uv2[slot7.defender .. ""] / uv3[slot7.defender .. ""])
				slot10:setVisible(true)
				slot10:setIsLoop(false)
				slot10:runXMLAnimation(CCString:create("images/battle/xml/action/T008_u_0"))

				slot0 = slot0 + 1
			end

			if uv14:getChildByTag(slot6 + 1000) ~= nil then
				slot10:setVisible(false)

				slot11 = getCardByTeamId(slot7.attacker)

				slot11:setTag(1500 + slot6)
				slot11:setAnchorPoint(ccp(0.5, 0.5))
				slot11:setPosition(getTeam1PointByPosition(slot6))
				slot11:setBasePoint(getTeam1PointByPosition(slot6))
				uv14:addChild(slot11, slot6)

				slot13 = BTAnimationEventDelegate:create()

				slot13:registerLayerEndedHandler(slot2)
				slot13:registerLayerChangedHandler(function (slot0, slot1)
					if slot0 == 15 then
						if file_exists("audio/effect/" .. "zhuangjitx" .. ".mp3") then
							AudioUtil.playEffect("audio/effect/" .. "zhuangjitx" .. ".mp3")
						end

						slot2 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/zhuangjitx"), -1, CCString:create(""))
						slot5 = BTAnimationEventDelegate:create()

						slot5:registerLayerEndedHandler(function ()
							uv0:removeFromParentAndCleanup(true)
						end)
						slot5:registerLayerChangedHandler(function ()
						end)
						slot2:setDelegate(slot5)
						slot2:setAnchorPoint(ccp(0.5, 0.5))
						slot2:setPosition(slot1:getPositionX(), slot1:getPositionY() + slot1:getContentSize().height / 2)
						uv0:addChild(slot2, 88)
					end
				end)
				slot11:setDelegate(slot13)
				print("currentHp:", uv2[slot7.attacker .. ""], uv3[slot7.attacker .. ""])
				BattleCardUtil.setCardHp(slot11, uv2[slot7.attacker .. ""] / uv3[slot7.attacker .. ""])
				slot11:setVisible(true)
				slot11:setIsLoop(false)
				slot11:runXMLAnimation(CCString:create("images/battle/xml/action/T008_d_0"))

				slot0 = slot0 + 1
			end
		end
	end
end

function moveInBeforeFight()
	print("moveInBeforeFight start:", uv0)

	slot0 = 0

	if uv1 ~= nil and #uv1 > 0 then
		for slot4 = 1, #uv1 do
			slot5 = uv1[slot4]
			slot6 = uv1[slot4] % 10

			print("retraitArray:", slot5, uv2[slot5 .. ""])

			if math.floor(slot5 / 1000) == 1 then
				uv3:removeChildByTag(slot5, true)

				slot7 = CCLayer:create()

				slot7:setAnchorPoint(ccp(0, 0))
				slot7:setPosition(0, 0)
				uv3:addChild(slot7, 5)

				slot8 = getCardByTeamId(uv2[slot5 .. ""])

				slot8:setTag(1510 + slot4)
				slot8:setAnchorPoint(ccp(0.5, 0.5))
				slot8:setPosition(getTeam1PointByPosition(slot6))
				slot8:setBasePoint(getTeam1PointByPosition(slot6))
				slot7:addChild(slot8, slot6)

				slot9 = CCLabelTTF:create(GetLocalizeStringBy("key_2199"), g_sFontName, 35)

				slot9:setColor(ccc3(255, 246, 0))
				slot9:setAnchorPoint(ccp(0.5, 0.5))
				slot9:setPosition(slot8:getContentSize().width * 0.5, slot8:getContentSize().height * 0.5)
				slot8:addChild(slot9, 91)
				slot8:setIsLoop(true)
				slot8:runXMLAnimation(CCString:create("images/battle/xml/action/walk_0"))

				slot11 = CCArray:create()

				slot11:addObject(CCMoveBy:create(2, ccp(0, -500)))
				slot11:addObject(CCCallFunc:create(function ()
					removeSelf(uv0)
				end))
				slot7:runAction(CCSequence:create(slot11))

				slot0 = slot0 > 2 and slot0 or 2
			elseif math.floor(slot5 / 1000) == 2 then
				uv4:removeChildByTag(slot5, true)

				slot7 = CCLayer:create()

				slot7:setAnchorPoint(ccp(0, 0))
				slot7:setPosition(0, 0)
				uv4:addChild(slot7, 5)

				slot8 = getCardByTeamId(uv2[slot5 .. ""])

				slot8:setTag(2510 + slot4)
				slot8:setAnchorPoint(ccp(0.5, 0.5))
				slot8:setPosition(getTeam2PointByPosition(slot6))
				slot8:setBasePoint(getTeam2PointByPosition(slot6))
				slot7:addChild(slot8, slot6)
				slot8:setIsLoop(true)
				slot8:runXMLAnimation(CCString:create("images/battle/xml/action/walk_0"))

				slot10 = CCArray:create()

				slot10:addObject(CCMoveBy:create(2, ccp(0, 500)))
				slot10:addObject(CCCallFunc:create(function ()
					removeSelf(uv0)
				end))
				slot7:runAction(CCSequence:create(slot10))

				slot0 = slot0 > 2 and slot0 or 2
			end
		end
	end

	uv1 = {}

	for slot4 = 1, 3 do
		slot5 = uv5[slot4 .. ""][uv0]

		print("blockInfo:", slot4, uv0)
		print_table("blockInfo", slot5)

		if slot5 ~= nil then
			slot6 = getCardPosition(tonumber(slot5.attacker))

			print("cardsPosition:", slot4, slot6, getCardPosition(tonumber(slot5.defender)), slot5.attacker, slot5.defender)
			print_table("cardsPosition", uv2)

			if slot6 == nil then
				uv3:removeChildByTag(1000 + slot4, true)
				uv3:removeChildByTag(1500 + slot4, true)

				slot8 = getCardByTeamId(slot5.attacker)

				slot8:setTag(1000 + slot4)
				slot8:setAnchorPoint(ccp(0.5, 0.5))
				slot8:setPosition(getTeam1PointByPosition(slot4))
				uv3:addChild(slot8, slot4)
				slot8:setVisible(false)

				slot9 = CCLayer:create()

				slot9:setAnchorPoint(ccp(0, 0))
				slot9:setPosition(0, -500)
				uv3:addChild(slot9, 5)

				slot10 = getCardByTeamId(slot5.attacker)

				slot10:setTag(1500 + slot4)
				slot10:setAnchorPoint(ccp(0.5, 0.5))
				slot10:setPosition(getTeam1PointByPosition(slot4))
				slot10:setBasePoint(getTeam1PointByPosition(slot4))
				slot9:addChild(slot10, slot4)
				slot10:setIsLoop(true)
				slot10:runXMLAnimation(CCString:create("images/battle/xml/action/walk_0"))

				slot12 = CCArray:create()

				slot12:addObject(CCMoveBy:create(2, ccp(0, 500)))
				slot12:addObject(CCCallFunc:create(function ()
					uv0:setVisible(true)
					removeSelf(uv1)
				end))
				slot9:runAction(CCSequence:create(slot12))

				slot0 = slot0 > 2 and slot0 or 2
			elseif slot6 ~= 1000 + slot4 then
				slot8 = uv3:getChildByTag(slot6)

				slot8:setTag(1000 + slot4)
				slot8:setAnchorPoint(ccp(0.5, 0.5))

				slot10 = CCArray:create()

				slot10:addObject(CCFadeOut:create(0.5))
				slot10:addObject(CCCallFunc:create(function ()
					uv0:setPosition(getTeam1PointByPosition(uv1))
				end))
				slot10:addObject(CCDelayTime:create(0.2))
				slot10:addObject(CCFadeIn:create(1))
				slot8:runAction(CCSequence:create(slot10))

				uv2[slot6 .. ""] = nil
				uv2[1000 + slot4 .. ""] = slot5.attacker
				slot0 = slot0 > 1.8 and slot0 or 1.8
			end

			if slot7 == nil then
				uv4:removeChildByTag(2000 + slot4, true)
				uv4:removeChildByTag(2500 + slot4, true)

				slot8 = getCardByTeamId(slot5.defender)

				slot8:setTag(2000 + slot4)
				slot8:setAnchorPoint(ccp(0.5, 0.5))
				slot8:setPosition(getTeam2PointByPosition(slot4))
				uv4:addChild(slot8, slot4)
				slot8:setVisible(false)

				slot9 = CCLayer:create()

				slot9:setAnchorPoint(ccp(0, 0))
				slot9:setPosition(0, 500)
				uv4:addChild(slot9, 5)

				slot10 = getCardByTeamId(slot5.defender)

				slot10:setTag(2500 + slot4)
				slot10:setAnchorPoint(ccp(0.5, 0.5))
				slot10:setPosition(getTeam2PointByPosition(slot4))
				slot10:setBasePoint(getTeam2PointByPosition(slot4))
				slot9:addChild(slot10, slot4)
				slot10:setIsLoop(true)
				slot10:runXMLAnimation(CCString:create("images/battle/xml/action/walk_0"))

				slot12 = CCArray:create()

				slot12:addObject(CCMoveBy:create(2, ccp(0, -500)))
				slot12:addObject(CCCallFunc:create(function ()
					uv0:setVisible(true)
					removeSelf(uv1)
				end))
				slot9:runAction(CCSequence:create(slot12))

				slot0 = slot0 > 2 and slot0 or 2
			elseif slot7 ~= 2000 + slot4 then
				slot8 = uv4:getChildByTag(slot7)

				slot8:setTag(2000 + slot4)
				slot8:setAnchorPoint(ccp(0.5, 0.5))

				slot10 = CCArray:create()

				slot10:addObject(CCFadeOut:create(0.5))
				slot10:addObject(CCCallFunc:create(function ()
					uv0:setPosition(getTeam2PointByPosition(uv1))
				end))
				slot10:addObject(CCDelayTime:create(0.2))
				slot10:addObject(CCFadeIn:create(1))
				slot8:runAction(CCSequence:create(slot10))

				uv2[slot7 .. ""] = nil
				uv2[2000 + slot4 .. ""] = slot5.defender

				print("1057 cardsPosition:", slot4, uv0, slot7, slot5.defender)
				print_table("cardsPosition", uv2)

				slot0 = slot0 > 1.8 and slot0 or 1.8
			end

			uv2[1000 + slot4 .. ""] = tonumber(slot5.attacker)
			uv2[2000 + slot4 .. ""] = tonumber(slot5.defender)
		end
	end

	if slot0 == 0 then
		showRoundTimes()
	else
		slot1 = CCArray:create()

		slot1:addObject(CCDelayTime:create(slot0))
		slot1:addObject(CCCallFunc:create(showRoundTimes))
		uv3:runAction(CCSequence:create(slot1))
	end
end

function showRoundTimes()
	slot0 = CCLayerColor:create(ccc4(1, 1, 1, 166))

	slot0:setPosition(0, 0)
	battleBaseLayer:addChild(slot0)

	slot1 = CCSprite:create(IMG_PATH .. "guild/bg.png")

	slot1:setAnchorPoint(ccp(0.5, 0.5))
	slot1:setPosition(ccp(slot0:getContentSize().width * 0.5, slot0:getContentSize().height * 0.5))
	slot0:addChild(slot1, 2)

	slot2 = CCSprite:create(IMG_PATH .. "guild/split.png")

	slot2:setAnchorPoint(ccp(0.5, 0.5))
	slot2:setPosition(ccp(-slot0:getContentSize().width * 0.1, slot0:getContentSize().height * 0.5))
	slot0:addChild(slot2, 1)
	slot2:runAction(CCMoveBy:create(0.3, ccp(slot0:getContentSize().width * 0.6, 0)))

	slot3 = LuaCC.createNumberSprite02(IMG_PATH .. "guild", "" .. uv0, 0)

	slot3:setAnchorPoint(ccp(0, 0.5))
	slot3:setPosition(ccp(slot0:getContentSize().width * 1.07 - slot3:getContentSize().width * 0.5, slot0:getContentSize().height * 0.5))
	slot0:addChild(slot3, 3)
	slot3:runAction(CCMoveBy:create(0.3, ccp(-slot0:getContentSize().width * 0.6, 0)))

	slot4 = CCArray:create()

	slot4:addObject(CCDelayTime:create(1))
	slot4:addObject(CCCallFunc:create(showBump))
	slot4:addObject(CCCallFuncN:create(removeSelf))
	slot0:runAction(CCSequence:create(slot4))
end

function startFight()
	uv0 = {}
	uv1 = 1
	slot0 = 200
	slot1 = 2
	slot2 = 0.8
	uv2 = CCLayer:create()

	uv2:setPosition(0, -slot0)

	uv3 = CCLayer:create()
	slot6 = 0

	uv3:setPosition(slot6, slot0)

	for slot6 = 1, 3 do
		if uv4[slot6 .. ""][uv1] ~= nil then
			uv0[1000 + slot6 .. ""] = tonumber(slot7.attacker)
			uv0[2000 + slot6 .. ""] = tonumber(slot7.defender)
			slot8 = getCardByTeamId(slot7.attacker)

			slot8:setTag(1000 + slot6)
			slot8:setAnchorPoint(ccp(0.5, 0.5))
			slot8:setPosition(getTeam1PointByPosition(slot6))
			uv2:addChild(slot8, slot6)

			slot9 = getCardByTeamId(slot7.attacker)

			slot9:setTag(1500 + slot6)
			slot9:setAnchorPoint(ccp(0.5, 0.5))
			slot9:setPosition(getTeam1PointByPosition(slot6))
			slot9:setBasePoint(getTeam1PointByPosition(slot6))
			uv2:addChild(slot9, slot6)
			slot9:setVisible(false)
			showTalkDialog(slot9, false, nil, 2.5)

			slot10 = getCardByTeamId(slot7.defender)

			slot10:setTag(2000 + slot6)
			slot10:setAnchorPoint(ccp(0.5, 0.5))
			slot10:setPosition(getTeam2PointByPosition(slot6))
			uv3:addChild(slot10, slot6)

			slot11 = getCardByTeamId(slot7.defender)

			slot11:setTag(2500 + slot6)
			slot11:setAnchorPoint(ccp(0.5, 0.5))
			slot11:setPosition(getTeam2PointByPosition(slot6))
			slot11:setBasePoint(getTeam2PointByPosition(slot6))
			uv3:addChild(slot11, slot6)
			slot11:setVisible(false)
			showTalkDialog(slot11, true, nil, 2.5)
		end
	end

	function startWalk()
		for slot3 = 1, 3 do
			if tolua.cast(uv0:getChildByTag(1500 + slot3), "CCXMLSprite") ~= nil then
				uv0:getChildByTag(1000 + slot3):setVisible(false)
				slot4:setVisible(true)
				slot4:setIsLoop(true)
				slot4:runXMLAnimation(CCString:create("images/battle/xml/action/walk_0"))
			end

			slot5 = tolua.cast(uv1:getChildByTag(2500 + slot3), "CCXMLSprite")

			if slot4 ~= nil then
				uv1:getChildByTag(2000 + slot3):setVisible(false)
				slot5:setVisible(true)
				slot5:setIsLoop(true)
				slot5:runXMLAnimation(CCString:create("images/battle/xml/action/walk_0"))
			end
		end

		startWalkEffect()
	end

	uv5:addChild(uv2)
	uv5:addChild(uv3)

	slot3 = CCArray:create()

	slot3:addObject(CCDelayTime:create(slot2))
	slot3:addObject(CCCallFunc:create(startWalk))
	slot3:addObject(CCMoveBy:create(slot1, ccp(0, slot0)))
	slot3:addObject(CCCallFuncN:create(setTeam1Back))
	slot3:addObject(CCDelayTime:create(0.5))
	slot3:addObject(CCCallFunc:create(moveInBeforeFight))
	uv2:runAction(CCSequence:create(slot3))

	slot4 = CCArray:create()

	slot4:addObject(CCDelayTime:create(slot2))
	slot4:addObject(CCMoveBy:create(slot1, ccp(0, -slot0)))
	slot4:addObject(CCCallFuncN:create(setTeam2Back))
	slot4:addObject(CCDelayTime:create(0.5))
	uv3:runAction(CCSequence:create(slot4))
end

function createLayer(slot0, slot1, slot2, slot3)
	print("battleData:")
	print_table("battleData", slot0)
	math.randomseed(os.time())

	slot4 = nil
	uv0 = BattleForGuild
	uv1 = nil

	if slot1 then
		uv0 = slot1
	end

	slot1 = BattleForCity

	if slot2 then
		uv1 = slot2

		uv1:retain()
	end

	uv2 = slot3 or nil

	if slot0.copyTeamInfo ~= nil and slot0.copyTeamInfo.cur_guild_copy ~= nil then
		require("db/DB_Copy_team")

		if DB_Copy_team.getDataById(tonumber(slot0.copyTeamInfo.cur_guild_copy)) ~= nil and slot5.strongHold ~= nil then
			require("db/DB_Stronghold")

			if DB_Stronghold.getDataById(tonumber(slot5.strongHold)) ~= nil then
				slot4 = slot6.fire_music
			end
		end
	end

	print("guildbattle bgmName:", slot4)

	if slot4 == nil then
		slot4 = uv3 or slot4
	end

	AudioUtil.playBgm("audio/bgm/" .. slot4)

	uv4 = slot0
	uv5 = false
	uv6 = tonumber(uv4.server.maxWin)

	print("maxWinningCount:", uv6)

	uv7 = {}
	uv8 = {}
	slot5 = false

	if initTeamInfo() == false then
		slot5 = true
	else
		initBattleBlocks()
	end

	initBackground()

	battleBaseLayer = CCLayer:create()

	battleBaseLayer:setTouchEnabled(true)
	battleBaseLayer:registerScriptTouchHandler(layerTouch, false, -499, true)
	battleBaseLayer:addChild(uv9)

	slot6 = nil

	if slot1 == nil or slot1 == BattleForGuild then
		slot6 = uv10()
	elseif slot1 == BattleForCity then
		slot6 = initCityUperLayer()
	end

	battleBaseLayer:addChild(slot6, 10)

	m_visibleViews = CCArray:create()

	m_visibleViews:retain()

	slot8 = CCDirector:sharedDirector():getRunningScene():getChildren()
	slot12 = slot8

	for slot12 = 1, slot8.count(slot12) do
		if tolua.cast(slot8:objectAtIndex(slot12 - 1), "CCNode") ~= nil and slot13:isVisible() == true then
			slot13:setVisible(false)
			m_visibleViews:addObject(slot13)
		end
	end

	BattleCardUtil.setNameVisible(false)
	slot7:addChild(battleBaseLayer, 999, 67891)

	slot9 = CCLayerColor:create(ccc4(1, 1, 1, 255))

	battleBaseLayer:addChild(slot9, 9998)

	slot10 = CCArray:create()

	slot10:addObject(CCFadeOut:create(1))
	slot10:addObject(CCCallFuncN:create(removeSelf))
	slot9:runAction(CCSequence:create(slot10))

	if slot5 == true then
		showAfterBattleLayer()
	else
		startFight()
	end

	require("script/ui/login/LoginScene")
	LoginScene.setBattleStatus(true)
end

function showTalkDialog(slot0, slot1, slot2, slot3)
	require("db/DB_Legion_copy")

	slot4 = lua_string_split(DB_Legion_copy.getDataById(1).begin_talk, "|")
	slot7 = slot4[math.random(1, #slot4)]

	if lua_string_split(DB_Legion_copy.getDataById(1).win_talk, ",")[tonumber(slot2)] then
		slot8 = lua_string_split(slot5[tonumber(slot2)], "|")
		slot7 = slot8[math.random(1, #slot8)]
	end

	CCLabelTTF:create(slot7, g_sFontName, "23"):setHorizontalAlignment(kCCTextAlignmentLeft)

	slot9 = nil

	if slot1 then
		slot9 = CCScale9Sprite:create("images/battle/talk_up_bg.png")

		slot9:setCapInsets(CCRectMake(94, 18, 70, 9))
		slot9:setAnchorPoint(ccp(0.5, 1))
		slot8:setAnchorPoint(ccp(0, 0))
		slot8:setPosition(ccp(5, 5))
	else
		slot9 = CCScale9Sprite:create("images/battle/talk_down_bg.png")

		slot9:setCapInsets(CCRectMake(11, 10, 66, 8))
		slot9:setAnchorPoint(ccp(0.5, 0))
		slot8:setAnchorPoint(ccp(0, 1))
		slot8:setPosition(ccp(5, slot8:getContentSize().height + 25))
	end

	slot9:setContentSize(CCSizeMake(slot8:getContentSize().width + 20, slot8:getContentSize().height + 30))
	slot9:addChild(slot8)
	slot0:addChild(slot9, 100)

	if slot1 then
		slot9:setPosition(ccp(slot0:getContentSize().width / 2, -10))
	else
		slot9:setPosition(ccp(slot0:getContentSize().width / 2, slot0:getContentSize().height + 30))
	end

	slot10 = CCArray:create()

	slot10:addObject(CCDelayTime:create(slot3 or 2))
	slot10:addObject(CCCallFunc:create(function (...)
		uv0:removeFromParentAndCleanup(true)
	end))
	slot9:runAction(CCSequence:create(slot10))
end
