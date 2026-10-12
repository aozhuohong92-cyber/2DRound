require("script/utils/extern")
require("script/battle/BT_Skill")
module("BattleLayer", package.seeall)

kNormalCopy = 1
kEliteCopy = 2
kActivityCopy = 3
kTowerCopy = 4
kMysicalFloorCopy = 5
kHeroCopy = 6
kMoneyTree = 7
kFogEffectTag = 1000001
kMaskLayerTag = 100001
kHeroCooperateIconTag = 11110
kCooperateEffectTag = 100002
isBattleOnGoing = false
slot0 = false
slot1 = 1
slot2 = 20
slot3 = 0.3

require("script/network/RequestCenter")
require("script/utils/LuaUtil")
require("script/battle/PlayerCardLayer")
require("script/battle/BattleCardUtil")
require("script/audio/AudioUtil")
require("script/libs/LuaCC")
require("script/ui/warcraft/WarcraftData")
require("script/model/hero/HeroModel")

slot4 = "images/battle/"
MoveDistence = (2400 - 640 * CCDirector:sharedDirector():getWinSize().height / CCDirector:sharedDirector():getWinSize().width) / 3
slot5 = "music01.mp3"
slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26 = nil
slot27 = true
slot28, slot29, slot30, slot31 = nil
slot32 = 1
slot33 = 1
slot34, slot35, slot36, slot37, slot38, slot39, slot40, slot41, slot42 = nil
slot43 = 0
slot44 = 200
slot45, slot46, slot47, slot48, slot49, slot50, slot51 = nil
slot52 = {}
slot53 = {}
slot54 = {}
slot55, slot56, slot57, slot58, slot59, slot60, slot61, slot62, slot63, slot64, slot65, slot66, slot67, slot68 = nil
slot69 = {}
slot70 = {}
slot71 = {}
slot72 = {}
m_playerCardHidMap = {}
slot73 = false
slot74, slot75, slot76, slot77, slot78, slot79, slot80 = nil
slot81 = 1
slot82 = 1
slot83 = 0
slot84 = false
slot85 = false
slot86 = nil
slot87 = g_winSize
slot88 = g_origin
slot89 = true
slot90 = {}
slot91 = {}
slot92 = -1
slot93 = false
slot94 = 0
slot95, slot96 = nil
slot97 = false
slot98 = ServerList.getSelectServerInfo().group
slot99 = UserModel.getUserUid()
slot100 = 1
slot101 = 2
slot102 = 1001
slot103 = nil
slot104 = {}
slot105 = false
slot106 = nil

function init(...)
	uv0 = false
end

function getMainHero()
	for slot4, slot5 in pairs(HeroModel.getAllHeroes()) do
		if tonumber(slot5.htid) == tonumber(UserModel.getUserInfo().htid) then
			return slot5
		end
	end

	return 0
end

function checkHeroInfoForDress(slot0, slot1)
	slot0.dress = slot0.dress or {}

	if slot0.dress["1"] ~= nil and tonumber(slot0.dress["1"]) ~= 0 then
		require("db/DB_Item_dress")

		if DB_Item_dress.getDataById(tonumber(slot0.dress["1"])).changeModel == nil then
			return
		end

		m_playerCardHidMap[slot0.hid .. ""] = {}

		for slot8 = 1, #lua_string_split(slot3.changeModel, ",") do
			require("db/DB_Heroes")

			if DB_Heroes.getDataById(tonumber(slot0.htid)).model_id == tonumber(lua_string_split(slot4[slot8], "|")[1]) then
				m_playerCardHidMap[slot0.hid .. ""].actionFile = lua_string_split(slot4[slot8], "|")[2]
			end
		end

		for slot9 = 1, #lua_string_split(slot3.changeRageHeadIcon, ",") do
			require("db/DB_Heroes")

			if DB_Heroes.getDataById(tonumber(slot0.htid)).model_id == tonumber(lua_string_split(slot5[slot9], "|")[1]) then
				m_playerCardHidMap[slot0.hid .. ""].rageHead = lua_string_split(slot5[slot9], "|")[2]
			end
		end
	end
end

function initPlayerCardHidMap()
	m_playerCardHidMap = {}

	checkHeroInfoForDress(getMainHero(), "equip")

	if uv0 ~= nil and uv0.team1 ~= nil and uv0.team1.arrHero ~= nil then
		for slot4 = 1, #uv0.team1.arrHero do
			if uv0.team1.arrHero[slot4].dress ~= nil then
				checkHeroInfoForDress(uv0.team1.arrHero[slot4], "equipInfo")
			end
		end
	end

	if uv0 ~= nil and uv0.team2 ~= nil and uv0.team2.arrHero ~= nil then
		for slot4 = 1, #uv0.team2.arrHero do
			if uv0.team2.arrHero[slot4].dress ~= nil then
				checkHeroInfoForDress(uv0.team2.arrHero[slot4], "equipInfo")
			end
		end
	end
end

function removeSelf(slot0)
	slot0:removeFromParentAndCleanup(true)
end

function setNodeVisible(slot0)
	if tolua.cast(slot0, "CCNode") ~= nil then
		slot0:setVisible(true)
	end
end

function setNodeNotVisible(slot0)
	if slot0 ~= nil and tolua.cast(slot0, "CCNode") ~= nil then
		slot0:setVisible(false)
	end
end

function showAttackerVisible()
	setNodeVisible(uv0)
end

function doShake()
	math.randomseed(os.time())

	if CCDirector:sharedDirector():getRunningScene():getPositionY() >= 0 then
		slot1 = -(math.floor(math.random() * 3 + 1) * CCDirector:sharedDirector():getWinSize().height * 0.003)
	end

	slot0:setPosition(0, slot1)
end

function startShake()
	if CCDirector:sharedDirector():getRunningScene():getActionByTag(5678) == nil then
		schedule(slot0, doShake, 0.05):setTag(5678)
	end
end

function endShake()
	slot0 = CCDirector:sharedDirector():getRunningScene()

	slot0:stopActionByTag(5678)
	slot0:setPosition(0, 0)
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

function currentRoundOver()
	uv0 = true
end

function createBattleCard(slot0)
	BattleCardUtil.setBattleData(uv0)

	if HeroModel.getHeroByHid(slot0) ~= nil and HeroModel.isNecessaryHero(slot1.htid) then
		checkHeroInfoForDress({
			hid = slot0,
			htid = slot1.htid,
			dress = UserModel.getDress()
		})
	end

	if tonumber(slot0) >= 10000000 then
		require("script/model/hero/HeroModel")

		if HeroModel.getAllHeroes() == nil then
			return BattleCardUtil.getBattlePlayerCardImage(slot0, nil, , , )
		end

		require("script/utils/LuaUtil")

		if m_playerCardHidMap[slot0 .. ""] ~= nil then
			slot3 = nil

			if uv0 ~= nil then
				for slot7 = 1, #uv0.team1.arrHero do
					if tonumber(uv0.team1.arrHero[slot7].hid) == tonumber(slot0) then
						slot3 = slot8.htid

						break
					end
				end

				for slot7 = 1, #uv0.team2.arrHero do
					if tonumber(uv0.team2.arrHero[slot7].hid) == tonumber(slot0) then
						slot3 = slot8.htid

						break
					end
				end
			end

			return BattleCardUtil.getBattlePlayerCardImage(slot0, nil, slot3, nil, m_playerCardHidMap[slot0 .. ""].actionFile)
		elseif slot2[slot0 .. ""] == nil then
			slot3 = -1

			for slot7 = 1, #uv0.team1.arrHero do
				if tonumber(uv0.team1.arrHero[slot7].hid) == tonumber(slot0) then
					slot3 = slot8.htid

					break
				end
			end

			for slot7 = 1, #uv0.team2.arrHero do
				if tonumber(uv0.team2.arrHero[slot7].hid) == tonumber(slot0) then
					slot3 = slot8.htid

					break
				end
			end

			return BattleCardUtil.getBattlePlayerCardImage(slot0, nil, slot3, nil, )
		else
			return BattleCardUtil.getBattlePlayerCardImage(slot0, nil, , , )
		end
	else
		if uv1 == nil then
			return BattleCardUtil.getBattlePlayerCardImage(slot0, nil, , , )
		end

		require("db/DB_Army")
		require("db/DB_Team")

		slot3 = DB_Team.getDataById(DB_Army.getDataById(uv1).monster_group)
		slot4 = lua_string_split(slot3.monsterID, ",")
		slot5 = {}

		if slot3.bossID ~= nil then
			slot5 = lua_string_split(slot3.bossID, ",")
		end

		slot6 = false

		for slot10 = 1, #slot5 do
			if tonumber(slot5[slot10]) == tonumber(slot0) then
				slot6 = true

				break
			end
		end

		slot7 = false
		slot9 = {}

		if slot3.outlineId ~= nil then
			slot9 = lua_string_split(slot8, ",")
		end

		for slot13 = 1, #slot9 do
			if tonumber(slot9[slot13]) == tonumber(slot0) then
				slot7 = true

				break
			end
		end

		slot10 = false
		slot12 = {}

		if slot3.demonLoadId ~= nil then
			slot12 = lua_string_split(slot11, ",")
		end

		for slot16 = 1, #slot12 do
			if tonumber(slot12[slot16]) == tonumber(slot0) then
				slot10 = true

				break
			end
		end

		if slot7 == true then
			return BattleCardUtil.getBattleOutLinePlayerCard(slot0)
		else
			return BattleCardUtil.getBattlePlayerCardImage(slot0, slot6, nil, slot10, nil)
		end
	end
end

function doReviveCard(slot0, slot1)
	if slot0 == false then
		return
	end

	if uv3 == 1 then
		RequestCenter.ncopy_reviveCard(function (slot0, slot1, slot2)
			if slot1.ret ~= nil and slot1.ret == "ok" then
				uv0 = uv0 + 1

				require("script/model/user/UserModel")

				slot6 = uv1

				for slot6 = 1, table.maxn(slot6) do
					if uv1[slot6] == uv2 then
						uv1[slot6] = nil

						break
					end
				end

				slot4 = -1

				for slot8 = 0, 5 do
					if PlayerCardLayer.getFormation()["" .. slot8] == uv2 then
						slot4 = slot8

						break
					end
				end

				if tolua.cast(uv3:getChildByTag(1000 + slot4), "CCSprite") ~= nil then
					slot5:stopAllActions()
					slot5:setCascadeOpacityEnabled(true)
					slot5:runAction(CCFadeIn:create(0.01))
					slot5:removeChildByTag(9115, true)
					slot5:removeChildByTag(9116, true)
				end

				slot6 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/fuhuo_1"), -1, CCString:create(""))

				slot6:retain()
				slot6:setAnchorPoint(ccp(0.5, 0.5))
				slot6:setPosition(slot5:getPositionX(), slot5:getPositionY())
				uv3:addChild(slot6, 99999)
				slot6:release()

				if file_exists("audio/effect/fuhuo_1.mp3") then
					AudioUtil.playEffect("audio/effect/fuhuo_1.mp3")
				end

				slot9 = BTAnimationEventDelegate:create()

				slot9:registerLayerEndedHandler(function (slot0, slot1)
					removeSelf(uv0)
				end)
				slot9:registerLayerChangedHandler(function (slot0, slot1)
				end)
				slot6:setDelegate(slot9)

				return
			end

			if slot1.ret ~= nil and slot1.ret == "silver" then
				require("script/ui/tip/AlertTip")
				AlertTip.showAlert(GetLocalizeStringBy("key_3276"), nil, false, nil)
			else
				require("script/ui/tip/AlertTip")
				AlertTip.showAlert(GetLocalizeStringBy("key_2070"), nil, false, nil)
			end
		end, Network.argsHandler(uv4, uv5, slot1))
	elseif uv3 == kEliteCopy then
		slot2(nil, {
			ret = "ok"
		})
	elseif uv3 == 4 then
		RequestCenter.ecopy_reviveCard(slot2, Network.argsHandler(uv4, slot1))
	else
		RequestCenter.acopy_reviveCard(slot2, Network.argsHandler(uv4, uv5, slot1))
	end
end

function reviveCardByHid(slot0)
	require("db/DB_Stronghold")

	if DB_Stronghold.getDataById(uv0) ~= nil and slot1.revive_mode_simple == 1 then
		slot2 = false
		slot6 = uv1

		for slot6 = 1, table.maxn(slot6) do
			if uv1[slot6] == slot0 then
				slot2 = true

				break
			end
		end

		if slot2 then
			require("script/ui/tip/AlertTip")
			AlertTip.showAlert(GetLocalizeStringBy("key_1003") .. (uv2 + 1) * uv3 .. GetLocalizeStringBy("key_1687"), doReviveCard, true, slot0)
		end
	end
end

function checkDialogChanges()
	require("db/DB_Army")

	slot1 = true

	if DB_Army.getDataById(uv0) ~= nil and slot0.dialog_scene_over ~= nil then
		for slot7 = 1, #lua_string_split(slot0.dialog_scene_over, ",") do
			if tonumber(lua_string_split(slot3[slot7], "|")[1]) ~= nil and uv1 == slot8 then
				if lua_string_split(slot3[slot7], "|")[2] ~= nil then
					-- Nothing
				end

				slot1 = false

				require("script/ui/main/MainScene")

				if slot9 ~= nil then
					slot10 = CCLayerSprite:layerSpriteWithName(CCString:create("images/guide/effect/zhuangchang/zhuangchang"), -1, CCString:create(""))

					slot10:setScale(MainScene.elementScale)
					slot10:setPosition(ccp(g_winSize.width * 0.5 - 640 * MainScene.elementScale * 0.5, g_winSize.height * 0.5 + 960 * MainScene.elementScale * 0.5))

					slot13 = BTAnimationEventDelegate:create()

					slot13:registerLayerEndedHandler(function (slot0, slot1)
						uv0:removeFromParentAndCleanup(true)

						uv0 = nil

						initBackground(uv1)

						if uv2 ~= nil then
							uv2()
						end
					end)
					slot13:registerLayerChangedHandler(function ()
					end)
					slot10:setDelegate(slot13)
					CCDirector:sharedDirector():getRunningScene():addChild(slot10, 1202)
				end
			end
		end
	end

	if slot0 ~= nil and slot0.dialog_music_over ~= nil then
		for slot7 = 1, #lua_string_split(slot0.dialog_music_over, ",") do
			if tonumber(lua_string_split(slot3[slot7], "|")[1]) ~= nil and uv1 == slot8 and lua_string_split(slot3[slot7], "|")[2] ~= nil then
				AudioUtil.playBgm("audio/bgm/" .. slot9)
			end
		end
	end

	if slot1 == true and uv2 ~= nil then
		uv2()
	end
end

function doTalk(slot0, slot1)
	uv0 = slot1
	uv1 = slot0

	require("script/ui/talk/talkLayer")
	CCDirector:sharedDirector():getRunningScene():addChild(TalkLayer.createTalkLayer(slot0), 999999)
	TalkLayer.setCallbackFunction(checkDialogChanges)
end

function showBattlePrepare()
	if (uv0 == true or uv1 == 1) and g_network_status == g_network_connected then
		uv2:setVisible(true)
		doBattleClick(false)

		return
	end

	uv2:setVisible(true)
	require("db/DB_Army")

	if tonumber(DB_Army.getDataById(uv3).type) == 2 or uv4 == 0 then
		PlayerCardLayer.setSwitchable(false)
	else
		PlayerCardLayer.setSwitchable(true)
	end

	require("script/ui/login/LoginScene")
	LoginScene.setBattleStatus(false)

	uv5 = false
end

function checkPreFightDialog()
	function slot0()
		require("db/DB_Army")

		if DB_Army.getDataById(uv0).dialog_id_pre ~= nil and uv1 == true then
			doTalk(tonumber(slot0.dialog_id_pre), showBattlePrepare)
		else
			showBattlePrepare()
		end
	end

	for slot5 = 0, 5 do
		if uv2:getChildByTag(1000 + slot5) ~= nil and slot6:isVisible() == false then
			slot1 = 0 + 1
			slot7 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/meffevt_15"), -1, CCString:create(""))

			slot7:setAnchorPoint(ccp(0.5, 0.5))
			slot7:setPosition(slot6:getPositionX(), slot6:getPositionY())
			uv2:addChild(slot7, 99999)

			slot10 = BTAnimationEventDelegate:create()

			slot10:registerLayerEndedHandler(function (slot0, slot1)
				uv0 = tolua.cast(uv0, "CCSprite")

				uv0:setOpacity(0)
				uv0:setVisible(true)
				uv0:runAction(CCFadeIn:create(0.5))

				uv1 = uv1 - 1

				if uv1 == 0 then
					slot2 = CCArray:create()

					slot2:addObject(CCDelayTime:create(1))
					slot2:addObject(CCCallFunc:create(uv2))
					uv3:runAction(CCSequence:create(slot2))
				end

				removeSelf(uv4)
			end)
			slot10:registerLayerChangedHandler(function (slot0, slot1)
			end)
			slot7:setDelegate(slot10)
		end
	end

	if slot1 == 0 then
		slot0()
	end
end

function showTitle()
	require("db/DB_Stronghold")

	slot0 = DB_Stronghold.getDataById(uv0)
	slot1 = nil
	slot1 = uv1 == 1 and "simple" or uv1 == 2 and "normal" or uv1 == 3 and "hard" or "simple"
	slot2 = nil
	slot3 = lua_string_split((uv1 ~= 0 or slot0["npc_army_ids_" .. slot1]) and slot0["army_ids_" .. slot1], ",")

	require("db/DB_Army")

	tileName = DB_Army.getDataById(slot3[uv2]).display_name
	number1 = uv2
	number2 = #slot3

	require("script/ui/main/MainScene")

	slot5 = CCSprite:create(uv3 .. "title/title_bg.png")

	slot5:setAnchorPoint(ccp(0.5, 0.5))
	slot5:setPosition(uv4:getContentSize().width / 2, uv4:getContentSize().height * 0.7)
	slot5:setCascadeOpacityEnabled(true)
	uv4:addChild(slot5, 999, 999)
	slot5:setScale(MainScene.elementScale)

	slot6 = CCLabelTTF:create(tileName, g_sFontName, slot5:getContentSize().height * 0.4)

	slot6:setAnchorPoint(ccp(0.5, 0.5))
	slot6:setPosition(slot5:getContentSize().width / 2, slot5:getContentSize().height * 0.7)
	slot5:addChild(slot6)

	slot7 = CCLabelTTF:create(GetLocalizeStringBy("key_1343"), g_sFontName, slot5:getContentSize().height / 4)

	slot7:setAnchorPoint(ccp(0.5, 0.5))
	slot7:setPosition(slot5:getContentSize().width * 0.35, slot5:getContentSize().height * 0.25)
	slot5:addChild(slot7)
	require("script/libs/LuaCC")

	slot8 = LuaCC.createNumberSprite02(uv3 .. "title", "" .. number1, 15)

	slot8:setAnchorPoint(ccp(0.5, 0.5))
	slot8:setPosition(slot5:getContentSize().width * 0.45, slot5:getContentSize().height * 0.25)
	slot5:addChild(slot8)

	slot9 = CCSprite:create(uv3 .. "title/separator.png")

	slot9:setAnchorPoint(ccp(0.5, 0.5))
	slot9:setPosition(slot5:getContentSize().width * 0.55, slot5:getContentSize().height * 0.25)
	slot5:addChild(slot9)

	slot10 = LuaCC.createNumberSprite02(uv3 .. "title", "" .. number2, 15)

	slot10:setAnchorPoint(ccp(0.5, 0.5))
	slot10:setPosition(slot5:getContentSize().width * 0.6, slot5:getContentSize().height * 0.25)
	slot5:addChild(slot10)

	slot11 = CCArray:create()

	slot11:addObject(CCDelayTime:create(0.5))
	slot11:addObject(CCFadeOut:create(0.5))
	slot11:addObject(CCCallFuncN:create(BattleLayer.removeSelf))
	slot5:runAction(CCSequence:create(slot11))
end

function showDefenderVisible()
	for slot3 = 1, #uv0.arrReaction do
		slot4 = nil

		for slot9 = 1, #uv1.team1.arrHero do
			if uv1.team1.arrHero[slot9].hid == uv0.arrReaction[slot3].defender then
				slot4 = tolua.cast(uv2:getChildByTag(1000 + slot10.position), "CCXMLSprite")

				break
			end
		end

		for slot9 = 1, #uv1.team2.arrHero do
			if uv1.team2.arrHero[slot9].hid == slot5 then
				slot4 = tolua.cast(uv3:getChildByTag(3000 + slot10.position), "CCXMLSprite")

				break
			end
		end

		if slot4 ~= nil then
			setNodeVisible(slot4)
		end
	end
end

function getEnemyCardPointByPosition(slot0)
	slot1 = uv0:getContentSize().width * 0.2

	return ccp(0.2 * uv0:getContentSize().width + slot0 % 3 * slot1 * 1.4, CCDirector:sharedDirector():getWinSize().height / uv0:getScale() - slot1 * 2.4 + math.floor(slot0 / 3) * slot1 * 1.2 * 1.2)
end

function getPlayerCardPointByPosition(slot0)
	return PlayerCardLayer.getPointByPosition(slot0)
end

function showStrength()
	slot0 = CCSprite:create(uv0 .. "strength/strength_bg.png")

	slot0:setAnchorPoint(ccp(0.5, 0))
	slot0:setPosition(uv1:getContentSize().width * 0.13, getPlayerCardPointByPosition(0).y + uv1:getContentSize().width * 0.14)
	uv1:addChild(slot0, 99)

	slot2 = CCLabelTTF:create((uv2.team1.fightForce == nil and 0 or uv2.team1.fightForce) .. "", g_sFontName, 21)

	slot2:setAnchorPoint(ccp(0.5, 0.5))
	slot2:setPosition(slot0:getContentSize().width * 0.65, slot0:getContentSize().height * 0.43)
	slot0:addChild(slot2)

	slot3 = CCSprite:create(uv0 .. "strength/strength_bg.png")

	slot3:setAnchorPoint(ccp(0.5, 1))
	slot3:setPosition(uv1:getContentSize().width * 0.87, getEnemyCardPointByPosition(0).y - uv1:getContentSize().width * 0.14)
	uv1:addChild(slot3, 99)

	slot5 = CCLabelTTF:create((uv2.team2.fightForce == nil and 0 or uv2.team2.fightForce) .. "", g_sFontName, 21)

	slot5:setAnchorPoint(ccp(0.5, 0.5))
	slot5:setPosition(slot3:getContentSize().width * 0.65, slot3:getContentSize().height * 0.43)
	slot3:addChild(slot5)
	CCSprite:create(uv0 .. "strength/firstAttack.png"):setAnchorPoint(ccp(0.5, 0.5))

	if tonumber(uv2.firstAttack) == 1 then
		slot6:setPosition(slot0:getContentSize().width * 0.5, slot0:getContentSize().height * 1.5)
		slot0:addChild(slot6)
	else
		slot6:setPosition(slot0:getContentSize().width * 0.5, -slot0:getContentSize().height * 0.5)
		slot3:addChild(slot6)
	end

	if m_isShowStrengthNumber == false then
		slot0:setOpacity(0)
		slot3:setOpacity(0)
		slot2:setVisible(false)
		slot5:setVisible(false)

		if uv3 then
			slot6:setVisible(true)
		else
			slot6:setVisible(false)
		end
	end
end

function showDropEffect(slot0, slot1)
	for slot5 = 1, #uv0 do
		if tonumber(slot0) == tonumber(uv0[slot5].mstId) then
			uv1 = uv1 + 1

			if uv1 ~= nil then
				uv2:setString("" .. uv1)
			end

			slot7 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/fubendiaoluo"), -1, CCString:create(""))

			slot7:setAnchorPoint(ccp(0.5, 0.5))
			slot7:setPosition(uv3:convertToNodeSpace(slot1))
			uv3:addChild(slot7, 99999)

			slot10 = BTAnimationEventDelegate:create()

			slot10:registerLayerEndedHandler(function (slot0, slot1)
				removeSelf(uv0)

				slot3 = CCSprite:create("images/shop/pub/card_opp.png")

				slot3:setAnchorPoint(ccp(0.5, 0.5))
				slot3:setPosition(uv1)
				CCDirector:sharedDirector():getRunningScene():addChild(slot3, 99999)
				slot3:setScale(0.23)
				slot3:runAction(CCRotateBy:create(1, 7200))

				slot5 = CCArray:create()
				slot6 = CCArray:create()

				slot6:addObject(CCEaseIn:create(CCMoveTo:create(1, uv2:convertToWorldSpace(ccpsprite(0.5, 0.5, uv2))), 0.5))
				slot6:addObject(CCScaleTo:create(1, 0.05))
				slot5:addObject(CCSpawn:create(slot6))
				slot5:addObject(CCCallFunc:create(function (...)
					uv0:removeFromParentAndCleanup(true)

					uv0 = nil

					if tolua.cast(uv1, "CCSprite") then
						slot2 = CCArray:create()

						slot2:addObject(CCEaseIn:create(CCScaleTo:create(0.5, 1.5), 0.5))
						slot2:addObject(CCEaseOut:create(CCScaleTo:create(0.5, 1), 0.5))
						uv1:runAction(CCSequence:create(slot2))
					end
				end))
				slot3:runAction(CCSequence:create(slot5))
			end)
			slot10:registerLayerChangedHandler(function (slot0, slot1)
			end)
			slot7:setDelegate(slot10)

			break
		end
	end
end

function showCardNumber(slot0, slot1, slot2, slot3)
	slot1 = tonumber(slot1)
	slot4, slot5 = nil
	slot6 = 0

	if slot3 ~= nil then
		slot5 = CCSprite:create(slot3)

		slot5:setAnchorPoint(ccp(1, 0.5))
		slot5:setPosition(ccp(0, 23))

		slot6 = slot5:getContentSize().width
	end

	if slot0 == nil or tolua.cast(slot0, "CCSprite") == nil then
		return
	end

	if slot2 == 0 then
		if slot1 == 0 then
			return
		end

		slot4 = LuaCC.createNumberSprite02(uv0 .. "number/red", "" .. slot1, 43)

		slot4:setAnchorPoint(ccp(0.5, 0.5))
		slot4:setPosition(ccp(slot0:getPositionX(), slot0:getPositionY() + slot0:getContentSize().height * 0.5))
		slot0:getParent():addChild(slot4, 999)

		if slot0:getParent():getScale() == 1 then
			slot4:setScale(slot0:getScale())

			slot9 = slot0:getScale()
		end

		if slot5 ~= nil then
			slot4:addChild(slot5)
		end

		slot10 = CCArray:create()

		slot10:addObject(CCScaleTo:create(0.1, 2))
		slot10:addObject(CCScaleTo:create(0.05, slot9))
		slot10:addObject(CCDelayTime:create(1))
		slot10:addObject(CCScaleTo:create(0.08, 0.01))
		slot10:addObject(CCCallFuncN:create(removeSelf))
		slot4:runAction(CCSequence:create(slot10))

		return
	elseif slot2 == 1 then
		slot4 = LuaCC.createNumberSprite02(uv0 .. "number/green", "+" .. slot1, 43)

		slot4:setAnchorPoint(ccp(0.5, 0.5))
		slot4:setPosition(slot0:getPositionX(), slot0:getPositionY())
		slot0:getParent():addChild(slot4, 999)

		if slot5 ~= nil then
			slot4:addChild(slot5)
		end

		slot8 = CCArray:create()

		slot8:addObject(CCScaleTo:create(0.1, 2))
		slot8:addObject(CCScaleTo:create(0.05, 1))
		slot8:addObject(CCDelayTime:create(1))
		slot8:addObject(CCScaleTo:create(0.08, 0.01))
		slot8:addObject(CCCallFuncN:create(removeSelf))
		slot4:runAction(CCSequence:create(slot8))

		return
	elseif slot2 == 2 then
		slot7 = CCSprite:create(uv0 .. "number/critical.png")

		slot7:setAnchorPoint(ccp(0.5, 0.5))
		slot7:setPosition(slot0:getContentSize().width * 0.5, slot0:getContentSize().height * 0.75)
		slot0:addChild(slot7, 999)
		slot7:setOpacity(0)

		slot8 = CCArray:create()

		slot8:addObject(CCFadeIn:create(0.3))
		slot8:addObject(CCDelayTime:create(0.7))
		slot8:addObject(CCFadeOut:create(0.3))
		slot8:addObject(CCCallFuncN:create(removeSelf))
		slot7:runAction(CCSequence:create(slot8))

		slot4 = LuaCC.createNumberSprite02(uv0 .. "number/critical", "-" .. slot1, 50)

		slot4:setAnchorPoint(ccp(0.5, 0.5))
		slot4:setPosition(slot0:getContentSize().width * 0.5, slot0:getContentSize().height * 0.5)
		slot0:addChild(slot4, 999)

		if slot5 ~= nil then
			slot4:addChild(slot5)
		end

		slot10 = CCArray:create()

		slot10:addObject(CCScaleTo:create(0.1, 2))
		slot10:addObject(CCScaleTo:create(0.05, 1))
		slot10:addObject(CCDelayTime:create(1))
		slot10:addObject(CCScaleTo:create(0.08, 0.01))
		slot10:addObject(CCCallFuncN:create(removeSelf))
		slot4:runAction(CCSequence:create(slot10))

		return
	elseif slot2 == 3 then
		slot4 = (slot1 <= 0 or CCSprite:create(uv0 .. "number/angerup.png")) and CCSprite:create(uv0 .. "number/angerdown.png")

		slot4:setAnchorPoint(ccp(0.5, 0.5))
		slot4:setPosition(slot0:getContentSize().width * 0.5, slot0:getContentSize().height * 0.5)
		slot0:addChild(slot4, 999)

		if slot1 > 0 then
			slot7 = CCArray:create()

			slot7:addObject(CCMoveBy:create(1, ccp(0, slot0:getContentSize().height / 2)))
			slot7:addObject(CCCallFuncN:create(removeSelf))
			slot4:runAction(CCSequence:create(slot7))
		else
			slot4:setPosition(slot0:getContentSize().width * 0.5, slot0:getContentSize().height * 0.8)

			slot7 = CCArray:create()

			slot7:addObject(CCMoveBy:create(1, ccp(0, -slot0:getContentSize().height / 2)))
			slot7:addObject(CCCallFuncN:create(removeSelf))
			slot4:runAction(CCSequence:create(slot7))
		end

		return
	elseif slot2 == 4 then
		slot4 = CCSprite:create(uv0 .. "number/dodge.png")

		slot4:setAnchorPoint(ccp(0.5, 0.5))
		slot4:setPosition(slot0:getContentSize().width * 0.5, slot0:getContentSize().height * 0.5)
		slot0:addChild(slot4, 999)
	else
		slot4 = CCSprite:create(uv0 .. "number/block.png")

		slot4:setAnchorPoint(ccp(0.5, 0.5))
		slot4:setPosition(slot0:getPositionX(), slot0:getPositionY() + slot0:getContentSize().height * 0.9)
		slot0:getParent():addChild(slot4, 999999)

		slot7 = CCArray:create()

		slot7:addObject(CCFadeIn:create(0.3))
		slot7:addObject(CCDelayTime:create(1.5))
		slot7:addObject(CCFadeOut:create(0.3))
		slot7:addObject(CCCallFuncN:create(removeSelf))
		slot4:runAction(CCSequence:create(slot7))

		return
	end

	if slot5 ~= nil then
		slot4:addChild(slot5)
	end

	slot7 = CCArray:create()

	slot7:addObject(CCMoveBy:create(1, ccp(0, slot0:getContentSize().height / 2)))
	slot7:addObject(CCCallFuncN:create(removeSelf))
	slot4:runAction(CCSequence:create(slot7))
end

function updateCardBuff(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	if slot3 == nil then
		slot3 = {} or slot3
	end

	if slot4 == nil then
		slot4 = {} or slot4
	end

	if slot5 == nil then
		slot5 = {} or slot5
	end

	if slot6 == nil then
		slot6 = {} or slot6
	end

	if slot4 ~= nil and slot8 <= #slot4 then
		require("db/DB_Buffer")

		if DB_Buffer.getDataById(slot4[slot8]) ~= nil and (slot9.removeTimeType == slot2 or slot2 == nil or slot9.removeTimeType == 2 and slot2 == 3) then
			if slot9.disappearEff ~= nil and slot9.disappearEff ~= "" then
				slot10 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot9.disappearEff), -1, CCString:create(""))

				slot10:retain()
				slot10:setAnchorPoint(ccp(0.5, 0.5))
				slot10:setPosition(slot1:getPositionX(), slot1:getPositionY())

				if isDefenderEnemy then
					uv0:addChild(slot10, 99999)
				else
					uv1:addChild(slot10, 99999)
				end

				slot10:release()

				slot13 = BTAnimationEventDelegate:create()

				slot13:registerLayerEndedHandler(function (slot0, slot1)
					updateCardBuff(uv0, uv1, uv2, uv3, uv4, uv5, uv6, uv7, uv8 + 1)

					if uv9[uv1:getTag()] == nil then
						uv9[uv1:getTag()] = {}
					end

					for slot5 = 1, #uv9[uv1:getTag()] do
						if uv9[uv1:getTag()][slot5] == uv10.id then
							uv9[uv1:getTag()][slot5] = 0
						end
					end

					uv1:removeChildByTag(100000 + uv10.id, true)
					removeSelf(uv11)
				end)
				slot13:registerLayerChangedHandler(function (slot0, slot1)
				end)
				slot10:setDelegate(slot13)

				return
			else
				slot1:removeChildByTag(100000 + slot9.id, true)
				updateCardBuff(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8 + 1)

				if uv2[slot1:getTag()] == nil then
					uv2[slot1:getTag()] = {}
				end

				for slot13 = 1, #uv2[slot1:getTag()] do
					if uv2[slot1:getTag()][slot13] == slot9.id then
						uv2[slot1:getTag()][slot13] = 0
					end
				end

				return
			end
		else
			updateCardBuff(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8 + 1)

			return
		end
	end

	if slot5 ~= nil and #slot5 >= slot8 - #slot4 then
		require("db/DB_Buffer")

		if DB_Buffer.getDataById(slot5[slot8 - #slot4]) ~= nil and (slot9.addTimeType == slot2 or slot2 == nil or slot9.addTimeType == 2 and slot2 == 3) then
			if slot9.addEff ~= nil and slot9.addEff ~= "" then
				slot10 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot9.addEff), -1, CCString:create(""))

				slot10:retain()
				slot10:setAnchorPoint(ccp(0.5, 0.5))
				slot10:setPosition(slot1:getPositionX(), slot1:getPositionY())

				if isDefenderEnemy then
					uv0:addChild(slot10, 99999)
				else
					uv1:addChild(slot10, 99999)
				end

				slot10:release()

				slot13 = BTAnimationEventDelegate:create()

				slot13:registerLayerEndedHandler(function (slot0, slot1)
					damageLabel = CCSprite:create(uv0 .. "number/immunity.png")

					damageLabel:setAnchorPoint(ccp(0.5, 0.5))
					damageLabel:setPosition(uv1:getContentSize().width * 0.5, uv1:getContentSize().height * 0.2)
					uv1:addChild(damageLabel, 999)

					slot2 = CCArray:create()

					slot2:addObject(CCScaleTo:create(0.1, 2))
					slot2:addObject(CCScaleTo:create(0.05, 1))
					slot2:addObject(CCDelayTime:create(1))
					slot2:addObject(CCScaleTo:create(0.08, 0.01))
					slot2:addObject(CCCallFuncN:create(removeSelf))
					damageLabel:runAction(CCSequence:create(slot2))
					updateCardBuff(uv2, uv1, uv3, uv4, uv5, uv6, uv7, uv8, uv9 + 1)
					removeSelf(uv10)
				end)
				slot13:registerLayerChangedHandler(function (slot0, slot1)
				end)
				slot10:setDelegate(slot13)

				return
			else
				damageLabel = CCSprite:create(uv3 .. "number/immunity.png")

				damageLabel:setAnchorPoint(ccp(0.5, 0.5))
				damageLabel:setPosition(slot1:getContentSize().width * 0.5, slot1:getContentSize().height * 0.2)
				slot1:addChild(damageLabel, 999)

				slot10 = CCArray:create()

				slot10:addObject(CCScaleTo:create(0.1, 2))
				slot10:addObject(CCScaleTo:create(0.05, 1))
				slot10:addObject(CCDelayTime:create(1))
				slot10:addObject(CCScaleTo:create(0.08, 0.01))
				slot10:addObject(CCCallFuncN:create(removeSelf))
				damageLabel:runAction(CCSequence:create(slot10))
				updateCardBuff(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8 + 1)

				return
			end
		else
			damageLabel = CCSprite:create(uv3 .. "number/immunity.png")

			damageLabel:setAnchorPoint(ccp(0.5, 0.5))
			damageLabel:setPosition(slot1:getContentSize().width * 0.5, slot1:getContentSize().height * 0.2)
			slot1:addChild(damageLabel, 999)

			slot10 = CCArray:create()

			slot10:addObject(CCScaleTo:create(0.1, 2))
			slot10:addObject(CCScaleTo:create(0.05, 1))
			slot10:addObject(CCDelayTime:create(1))
			slot10:addObject(CCScaleTo:create(0.08, 0.01))
			slot10:addObject(CCCallFuncN:create(removeSelf))
			damageLabel:runAction(CCSequence:create(slot10))
			updateCardBuff(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8 + 1)

			return
		end
	end

	if slot3 ~= nil and #slot3 >= slot8 - #slot4 - #slot5 then
		require("db/DB_Buffer")

		if DB_Buffer.getDataById(slot3[slot8 - #slot4 - #slot5]) ~= nil and (slot9.addTimeType == slot2 or slot2 == nil or slot9.addTimeType == 2 and slot2 == 3) then
			if slot9.addEff ~= nil and slot9.addEff ~= "" then
				slot10 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot9.addEff), -1, CCString:create(""))

				slot10:retain()
				slot10:setAnchorPoint(ccp(0.5, 0.5))
				slot10:setPosition(slot1:getPositionX(), slot1:getPositionY())

				if isDefenderEnemy then
					uv0:addChild(slot10, 99999)
				else
					uv1:addChild(slot10, 99999)
				end

				slot10:release()

				slot13 = BTAnimationEventDelegate:create()

				slot13:registerLayerEndedHandler(function (slot0, slot1)
					if uv0.icon ~= nil and uv0.icon ~= "" then
						slot2 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. uv0.icon), -1, CCString:create(""))

						slot2:retain()
						slot2:setAnchorPoint(ccp(0.5, 0))

						if uv0.positon == 1 then
							slot2:setPosition(uv1:getContentSize().width * 0.5, uv1:getContentSize().height * 0.85)
						elseif uv0.positon == 2 then
							slot2:setPosition(uv1:getContentSize().width * 0.5, uv1:getContentSize().height * 0.55)
						else
							slot2:setPosition(uv1:getContentSize().width * 0.5, uv1:getContentSize().height * 0.15)
						end

						uv1:addChild(slot2, 10, 100000 + uv0.id)
						slot2:release()

						if uv2[uv1:getTag()] == nil then
							uv2[uv1:getTag()] = {}
						end

						uv2[uv1:getTag()][#uv2[uv1:getTag()] + 1] = uv0.id
					end

					updateCardBuff(uv3, uv1, uv4, uv5, uv6, uv7, uv8, uv9, uv10 + 1)
					removeSelf(uv11)
				end)
				slot13:registerLayerChangedHandler(function (slot0, slot1)
				end)
				slot10:setDelegate(slot13)

				return
			else
				if slot9.icon ~= nil and slot9.icon ~= "" then
					slot10 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot9.icon), -1, CCString:create(""))

					slot10:retain()
					slot10:setAnchorPoint(ccp(0.5, 0))

					if slot9.positon == 1 then
						slot10:setPosition(slot1:getContentSize().width * 0.5, slot1:getContentSize().height * 0.85)
					elseif slot9.positon == 2 then
						slot10:setPosition(slot1:getContentSize().width * 0.5, slot1:getContentSize().height * 0.55)
					else
						slot10:setPosition(slot1:getContentSize().width * 0.5, slot1:getContentSize().height * 0.15)
					end

					slot1:addChild(slot10, 10, 100000 + slot9.id)
					slot10:release()

					if uv2[slot1:getTag()] == nil then
						uv2[slot1:getTag()] = {}
					end

					uv2[slot1:getTag()][#uv2[slot1:getTag()] + 1] = slot9.id
				end

				updateCardBuff(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8 + 1)

				return
			end
		else
			updateCardBuff(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8 + 1)

			return
		end
	end

	if slot6 ~= nil and #slot6 >= slot8 - #slot4 - #slot5 - #slot3 then
		require("db/DB_Buffer")

		if DB_Buffer.getDataById(tonumber(slot6[slot8 - #slot4 - #slot5 - #slot3].bufferId)) ~= nil and (slot10.damageTimeType == slot2 or slot2 == nil or slot10.damageTimeType == 2 and slot2 == 3) then
			if slot9.type == 9 then
				if slot10 ~= nil and slot10.damageEff ~= nil then
					if file_exists("audio/effect/" .. slot10.damageEff .. ".mp3") then
						AudioUtil.playEffect("audio/effect/" .. slot10.damageEff .. ".mp3")
					end

					slot11 = nil
					slot11 = (not file_exists("images/battle/effect/" .. slot10.damageEff .. ".plist") or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot10.damageEff), -1, CCString:create(""))) and CCLayerSprite:layerSpriteWithName(CCString:create(isDefenderEnemy == true and "images/battle/effect/" .. slot10.damageEff .. "_u" or "images/battle/effect/" .. slot10.damageEff .. "_d"), -1, CCString:create(""))

					slot11:setAnchorPoint(ccp(0.5, 0.5))
					slot11:setPosition(slot1:getPositionX(), slot1:getPositionY())
					slot1:getParent():addChild(slot11, 998, slot1:getTag() + 5000)

					slot14 = BTAnimationEventDelegate:create()

					slot14:registerLayerEndedHandler(function (slot0, slot1)
						updateCardBuff(uv0, uv1, uv2, uv3, uv4, uv5, uv6, uv7, uv8 + 1)
						removeSelf(uv9)
					end)
					slot14:registerLayerChangedHandler(function (slot0, slot1)
					end)
					tolua.cast(slot11, "CCLayerSprite"):setDelegate(slot14)
				end

				slot11 = nil

				if slot10.damagetitle ~= nil then
					slot11 = uv3 .. "number/" .. slot10.damagetitle
				end

				if tonumber(slot9.data) >= 0 then
					showCardNumber(slot1, tonumber(slot9.data), 1, slot11)
				else
					showCardNumber(slot1, tonumber(slot9.data), 0, slot11)
				end

				if slot0 ~= nil then
					uv4[slot0] = uv4[slot0] + tonumber(slot9.data)

					if slot1 ~= nil then
						if slot13 < 1 then
							slot13 = 0

							slot1:setOpacity(0)
							slot1:removeChildByTag(BattleLayer.kHeroCooperateIconTag, true)
							slot1:removeChildByTag(BattleCardUtil.kCooperateIconTag, true)

							slot14 = createBattleCard(slot0)

							slot14:setPosition(slot1:getPositionX(), slot1:getPositionY())
							slot14:setBasePoint(ccp(slot14:getPositionX(), slot14:getPositionY()))
							BattleCardUtil.setCardHp(slot14, 0)

							slot17 = BTAnimationEventDelegate:create()

							slot17:registerLayerEndedHandler(function (slot0, slot1)
								uv0:removeFromParentAndCleanup(true)
							end)
							slot17:registerLayerChangedHandler(function (slot0, slot1)
							end)
							slot14:setDelegate(slot17)
							slot14:runXMLAnimation(CCString:create("images/battle/xml/action/T007_0"))
							slot1:getParent():addChild(slot14, slot1:getZOrder())

							if uv5 == false then
								uv6[table.maxn(uv6) + 1] = uv7["" .. slot1:getTag() % 10]
								slot18 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/deada"), -1, CCString:create(""))

								slot18:setAnchorPoint(ccp(0.5, 0.5))
								slot18:setPosition(slot1:getPositionX(), slot1:getPositionY() - slot1:getContentSize().height * 0.1)
								uv1:addChild(slot18, 0, slot1:getTag() + 8115)

								slot21 = BTAnimationEventDelegate:create()

								slot21:registerLayerEndedHandler(function (slot0, slot1)
									uv0:cleanup()

									slot2 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/guihuo"), -1, CCString:create(""))

									slot2:setAnchorPoint(ccp(0.5, 0.5))
									slot2:setPosition(0, -50)
									uv0:addChild(slot2, 1)
								end)
								slot21:registerLayerChangedHandler(function (slot0, slot1)
								end)
								slot18:setDelegate(slot21)
							end

							showDropEffect(slot0, slot1:convertToWorldSpace(ccp(slot1:getContentSize().width * 0.5, slot1:getContentSize().height * 0.5)))
						end

						if slot13 and uv8[slot0] then
							BattleCardUtil.setCardHp(slot1, slot13 / uv8[slot0])
						end
					end
				end
			elseif slot9.type == 28 then
				showCardNumber(slot1, tonumber(slot9.data), 3)

				if uv9[slot0] == nil then
					uv9[slot11] = 0
				end

				uv9[slot11] = uv9[slot11] + tonumber(slot9.data)

				BattleCardUtil.setCardAnger(slot1, uv9[slot11], slot11)
			end

			if slot10 == nil or slot10.damageEff == nil then
				updateCardBuff(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8 + 1)
			end

			return false
		end
	end

	if slot7 then
		slot7()
	end
end

function afterAttackUpdateBuff()
	slot0 = os.clock()

	updateCardBuff(uv0.attacker, uv1, 3, uv0.enBuffer, uv0.deBuffer, uv0.imBuffer, uv0.buffer, showNextMove, 1)

	slot1 = os.clock()
end

function goBack()
	slot0 = os.clock()

	if uv0 ~= nil then
		uv0.battleBlockChanged(uv1)
	end

	if tolua.cast(uv2, "CCXMLSprite") == nil or uv3 == nil then
		showNextMove()

		return
	end

	if uv4 then
		if getEnemyCardPointByPosition(uv3).x > uv2:getPositionX() - 1 and slot1.x < uv2:getPositionX() + 1 and slot1.y > uv2:getPositionY() - 1 and slot1.y < uv2:getPositionY() + 1 then
			afterAttackUpdateBuff()
		else
			slot2 = CCArray:create()

			slot2:addObject(CCMoveTo:create(0.2, slot1))
			slot2:addObject(CCCallFunc:create(afterAttackUpdateBuff))
			uv2:runAction(CCSequence:create(slot2))
		end
	elseif getPlayerCardPointByPosition(uv3).x > uv2:getPositionX() - 1 and slot1.x < uv2:getPositionX() + 1 and slot1.y > uv2:getPositionY() - 1 and slot1.y < uv2:getPositionY() + 1 then
		afterAttackUpdateBuff()
	else
		slot2 = CCArray:create()

		slot2:addObject(CCMoveTo:create(0.2, getPlayerCardPointByPosition(uv3)))
		slot2:addObject(CCCallFunc:create(afterAttackUpdateBuff))
		uv2:runAction(CCSequence:create(slot2))
	end

	slot1 = os.clock()
end

function updateChildDefendersBuff()
	if uv0 == nil or uv1.arrChild == nil or uv1.arrChild[uv0] == nil then
		return
	end

	if uv1.arrChild[uv0].arrReaction == nil then
		showChildBattleAttack()

		return
	end

	slot2 = nil

	for slot6 = 1, #uv2.team1.arrHero do
		if uv2.team1.arrHero[slot6].hid == uv1.arrChild[slot0].attacker then
			slot2 = tolua.cast(uv3:getChildByTag(1000 + slot7.position), "CCXMLSprite")
			isDefenderEnemy = false

			break
		end
	end

	for slot6 = 1, #uv2.team2.arrHero do
		if uv2.team2.arrHero[slot6].hid == slot1 then
			slot2 = tolua.cast(uv4:getChildByTag(3000 + slot7.position), "CCXMLSprite")

			break
		end
	end

	if slot2 ~= nil then
		updateCardBuff(slot1, slot2, nil, uv1.arrChild[slot0].enBuffer, uv1.arrChild[slot0].deBuffer, uv1.arrChild[slot0].imBuffer, uv1.arrChild[slot0].buffer, nil, 1)
	end

	for slot6 = 1, #uv1.arrChild[slot0].arrReaction do
		slot7 = nil

		for slot12 = 1, #uv2.team1.arrHero do
			if uv2.team1.arrHero[slot12].hid == uv1.arrChild[slot0].arrReaction[slot6].defender then
				slot7 = tolua.cast(uv3:getChildByTag(1000 + slot13.position), "CCXMLSprite")
				isDefenderEnemy = false

				break
			end
		end

		for slot12 = 1, #uv2.team2.arrHero do
			if uv2.team2.arrHero[slot12].hid == slot8 then
				slot7 = tolua.cast(uv4:getChildByTag(3000 + slot13.position), "CCXMLSprite")
				isDefenderEnemy = true

				break
			end
		end

		if slot7 ~= nil then
			playClearBufferEffect(slot7, uv1.arrChild[slot0].arrReaction[slot6].clear)

			if slot6 == #uv1.arrChild[slot0].arrReaction then
				updateCardBuff(slot8, slot7, nil, uv1.arrChild[slot0].arrReaction[slot6].enBuffer, uv1.arrChild[slot0].arrReaction[slot6].deBuffer, uv1.arrChild[slot0].arrReaction[slot6].imBuffer, uv1.arrChild[slot0].arrReaction[slot6].buffer, showChildBattleAttack, 1)
			else
				updateCardBuff(slot8, slot7, nil, uv1.arrChild[slot0].arrReaction[slot6].enBuffer, uv1.arrChild[slot0].arrReaction[slot6].deBuffer, uv1.arrChild[slot0].arrReaction[slot6].imBuffer, uv1.arrChild[slot0].arrReaction[slot6].buffer, nil, 1)
			end
		end
	end
end

function showChildDefenderDamage(slot0, slot1, slot2, slot3)
	slot4 = uv0.battle[slot1]
	slot5 = true

	if math.floor(slot0:getTag() / 1000) == 4 then
		slot5 = false
	end

	slot6 = 0
	slot7 = 0
	slot8 = false
	slot9 = nil

	if slot5 == true then
		for slot13 = 1, #uv0.team2.arrHero do
			if uv0.team2.arrHero[slot13].position == slot0:getTag() % 10 then
				slot6 = slot14.hid
				slot9 = tolua.cast(uv1:getChildByTag(3000 + slot14.position), "CCXMLSprite")

				break
			end
		end
	else
		for slot13 = 1, #uv0.team1.arrHero do
			if uv0.team1.arrHero[slot13].position == slot0:getTag() % 10 then
				slot6 = slot14.hid
				slot9 = tolua.cast(uv2:getChildByTag(1000 + slot14.position), "CCXMLSprite")

				break
			end
		end
	end

	slot10 = false

	for slot14 = 1, #slot4.arrChild[uv3].arrReaction do
		if slot4.arrChild[uv3].arrReaction[slot14].arrDamage ~= nil and slot4.arrChild[uv3].arrReaction[slot14].defender == slot6 then
			for slot18 = 1, #slot4.arrChild[uv3].arrReaction[slot14].arrDamage do
				slot7 = slot7 + slot4.arrChild[uv3].arrReaction[slot14].arrDamage[slot18].damageValue
			end

			if slot4.arrChild[uv3].arrReaction[slot14].fatal ~= nil and slot4.arrChild[uv3].arrReaction[slot14].fatal == true then
				slot8 = true
			end

			if slot4.arrChild[uv3].arrReaction[slot14].mandown ~= nil and slot4.arrChild[uv3].arrReaction[slot14].mandown == true then
				slot10 = true
			end
		end
	end

	if uv5 <= uv4 then
		uv6[slot6] = uv6[slot6] - slot7

		if slot9 ~= nil then
			if slot11 < 1 then
				slot11 = 0

				slot9:setOpacity(0)
				slot9:removeChildByTag(BattleLayer.kHeroCooperateIconTag, true)
				slot9:removeChildByTag(BattleCardUtil.kCooperateIconTag, true)

				slot12 = createBattleCard(slot6)

				slot12:setPosition(slot9:getPositionX(), slot9:getPositionY())
				slot12:setBasePoint(ccp(slot12:getPositionX(), slot12:getPositionY()))
				BattleCardUtil.setCardHp(slot12, 0)

				slot15 = BTAnimationEventDelegate:create()

				slot15:registerLayerEndedHandler(function (slot0, slot1)
					uv0:removeFromParentAndCleanup(true)
				end)
				slot15:registerLayerChangedHandler(function (slot0, slot1)
				end)
				slot12:setDelegate(slot15)
				slot12:runXMLAnimation(CCString:create("images/battle/xml/action/T007_0"))
				slot9:getParent():addChild(slot12, slot9:getZOrder())

				if slot5 == false then
					uv7[table.maxn(uv7) + 1] = uv8["" .. slot0:getTag() % 10]
					slot16 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/deada"), -1, CCString:create(""))

					slot16:setAnchorPoint(ccp(0.5, 0.5))
					slot16:setPosition(slot9:getPositionX(), slot9:getPositionY() - slot9:getContentSize().height * 0.1)
					uv2:addChild(slot16, 0, slot9:getTag() + 8115)

					slot19 = BTAnimationEventDelegate:create()

					slot19:registerLayerEndedHandler(function (slot0, slot1)
						uv0:cleanup()

						slot2 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/guihuo"), -1, CCString:create(""))

						slot2:setAnchorPoint(ccp(0.5, 0.5))
						slot2:setPosition(0, -50)
						uv0:addChild(slot2, 1)
					end)
					slot19:registerLayerChangedHandler(function (slot0, slot1)
					end)
					slot16:setDelegate(slot19)
				end

				showDropEffect(slot6, slot9:convertToWorldSpace(ccp(slot9:getContentSize().width * 0.5, slot9:getContentSize().height * 0.5)))
			end

			if slot11 and uv9[slot6] then
				BattleCardUtil.setCardHp(slot9, slot11 / uv9[slot6])
			end
		end

		if slot0 ~= nil then
			if slot11 < 1 then
				slot11 = 0
			end

			if slot11 and uv9[slot6] then
				BattleCardUtil.setCardHp(slot0, slot11 / uv9[slot6])
			end
		end
	end

	if uv5 ~= 0 then
		slot7 = slot7 / uv5
	end

	slot11 = 43
	slot12 = "number/red"

	if slot8 then
		slot12 = "number/critical"
		slot11 = 50
		slot13 = CCSprite:create(uv10 .. "number/critical.png")

		slot13:setAnchorPoint(ccp(0.5, 0))
		slot13:setPosition(slot0:getPositionX(), slot0:getPositionY() + slot0:getContentSize().height * 0.75)

		if slot5 then
			uv1:addChild(slot13, 999999)
		else
			uv2:addChild(slot13, 999999)
		end

		slot13:setOpacity(0)

		slot14 = CCArray:create()

		slot14:addObject(CCFadeIn:create(0.3))
		slot14:addObject(CCDelayTime:create(0.7))
		slot14:addObject(CCFadeOut:create(0.3))
		slot14:addObject(CCCallFuncN:create(removeSelf))
		slot13:runAction(CCSequence:create(slot14))
	end

	slot13 = LuaCC.createNumberSprite02(uv10 .. slot12, "-" .. math.ceil(slot7), slot11)

	slot13:setAnchorPoint(ccp(0.5, 0.5))
	slot13:setPosition(slot0:getPositionX(), slot0:getPositionY() + slot0:getContentSize().height * 0.5)

	if slot5 then
		uv1:addChild(slot13, 999999)
	else
		uv2:addChild(slot13, 999999)
	end

	slot14 = CCArray:create()

	slot14:addObject(CCScaleTo:create(0.1, 2))
	slot14:addObject(CCScaleTo:create(0.05, 1))
	slot14:addObject(CCDelayTime:create(1))
	slot14:addObject(CCScaleTo:create(0.08, 0.01))
	slot14:addObject(CCCallFuncN:create(removeSelf))
	slot13:runAction(CCSequence:create(slot14))
end

function showChildDefenderEffect(slot0, slot1, slot2)
	slot3 = 0
	slot4 = uv0.battle[slot0]

	if uv1 == nil or slot4.arrChild == nil or slot4.arrChild[uv1] == nil then
		slot5 = CCArray:create()

		slot5:addObject(CCDelayTime:create(1))
		slot5:addObject(CCCallFunc:create(currentRoundOver))
		uv2:runAction(CCSequence:create(slot5))

		return
	end

	slot5 = uv1

	for slot9 = 1, #slot4.arrChild[uv1].arrReaction do
		slot10 = nil
		slot11 = false

		for slot16 = 1, #uv0.team1.arrHero do
			if uv0.team1.arrHero[slot16].hid == slot4.arrChild[uv1].arrReaction[slot9].defender then
				slot10 = tolua.cast(uv3:getChildByTag(1000 + slot17.position), "CCXMLSprite")
				slot11 = false

				break
			end
		end

		for slot16 = 1, #uv0.team2.arrHero do
			if uv0.team2.arrHero[slot16].hid == slot12 then
				slot10 = tolua.cast(uv4:getChildByTag(3000 + slot17.position), "CCXMLSprite")
				slot11 = true

				break
			end
		end

		if slot4.arrChild[uv1].arrReaction[slot9].arrDamage ~= nil and slot10 ~= nil then
			if uv5 <= 1 then
				setNodeNotVisible(slot10)
			end

			require("db/skill")

			slot14 = BT_Skill.getDataById(slot4.arrChild[uv1].action, getAttackDressId(), getAttackTid(), getAttackTurnedId())
			slot15 = nil

			if ((not slot11 or tolua.cast(uv4:getChildByTag(slot10:getTag() + 3000), "CCXMLSprite")) and tolua.cast(uv3:getChildByTag(slot10:getTag() + 3000), "CCXMLSprite")) == nil then
				if slot11 then
					uv4:addChild(createBattleCard(slot12), slot10:getZOrder())
				else
					uv3:addChild(slot15, slot10:getZOrder())
				end
			end

			slot15:setVisible(true)
			slot15:setTag(slot10:getTag() + 3000)
			slot15:setAnchorPoint(ccp(0.5, 0))
			slot15:setPosition(ccp(slot10:getPositionX(), slot10:getPositionY() - slot10:getContentSize().height * 0.5))
			slot15:setBasePoint(ccp(slot15:getPositionX(), slot15:getPositionY()))

			if uv6[slot12] and uv7[slot12] then
				BattleCardUtil.setCardHp(slot15, uv6[slot12] / uv7[slot12])
			end

			if uv8[slot12] == nil then
				uv8[slot12] = 0
			end

			slot16 = nil

			slot15:setColor(ccc3(255, 0, 0))

			slot20 = CCArray:create()

			slot20:addObject(CCCallFuncN:create(function ()
				showChildDefenderDamage(uv0, uv1, uv2, uv3)
			end))
			slot20:addObject(CCDelayTime:create(slot15:runXMLAnimation((tonumber(slot14.mpostionType) ~= 7 or (not slot11 or CCString:create("images/battle/xml/action/hurt2_u_0")) and CCString:create("images/battle/xml/action/hurt2_d_0")) and (not slot11 or CCString:create("images/battle/xml/action/hurt1_u_0")) and CCString:create("images/battle/xml/action/hurt1_d_0")) * slot15:getFpsInterval()))

			if uv9 < uv5 then
				-- Nothing
			end

			if uv9 <= uv5 then
				slot20:addObject(CCCallFunc:create(currentRoundOver))
				slot20:addObject(CCCallFuncN:create(BattleLayer.removeSelf))
			end

			slot15:stopAllActions()
			slot15:runAction(CCSequence:create(slot20))

			slot21 = slot14.hitEffct

			if slot4.arrChild[uv1].arrReaction[slot9].reaction == 4 then
				slot21 = "heffect_10"

				showCardNumber(slot15, GetLocalizeStringBy("key_2305"), 5)
			end

			slot3 = slot18 < slot3 and slot3 or slot18

			if slot21 ~= nil and tonumber(slot14.mpostionType) ~= 7 then
				if file_exists("audio/effect/" .. slot21 .. ".mp3") and uv5 == 1 and slot9 == 1 then
					AudioUtil.playEffect("audio/effect/" .. slot21 .. ".mp3")
				end

				slot22 = nil

				if ((not slot11 or uv4:getChildByTag(slot10:getTag() + 5000)) and uv3:getChildByTag(slot10:getTag() + 5000)) == nil then
					slot22 = (not file_exists("images/battle/effect/" .. slot21 .. ".plist") or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot21), -1, CCString:create(""))) and CCLayerSprite:layerSpriteWithName(CCString:create(slot11 == true and "images/battle/effect/" .. slot21 .. "_u" or "images/battle/effect/" .. slot21 .. "_d"), -1, CCString:create(""))

					slot22:retain()
					slot22:setAnchorPoint(ccp(0.5, 0.5))
					slot22:setPosition(slot10:getPositionX(), slot10:getPositionY())

					if slot11 then
						uv4:addChild(slot22, 99999, slot10:getTag() + 5000)
					else
						uv3:addChild(slot22, 99999, slot10:getTag() + 5000)
					end

					slot22:release()
				end

				if uv9 <= uv5 or uv9 == 0 then
					slot25 = BTAnimationEventDelegate:create()

					slot25:registerLayerEndedHandler(function (slot0, slot1)
						removeSelf(uv0)
					end)
					slot25:registerLayerChangedHandler(function (slot0, slot1)
					end)
					tolua.cast(slot22, "CCLayerSprite"):setDelegate(slot25)
				end
			end

			if uv9 <= uv5 or uv9 == 0 then
				slot22 = CCArray:create()

				slot22:addObject(CCDelayTime:create(slot3))
				slot22:addObject(CCCallFuncN:create(setNodeVisible))
				slot22:addObject(CCCallFunc:create(currentRoundOver))
				slot10:runAction(CCSequence:create(slot22))
			end
		elseif slot4.arrChild[uv1].arrReaction[slot9].reaction == 2 then
			if uv5 <= 1 then
				setNodeNotVisible(slot10)
			end

			slot13 = createBattleCard(slot12)

			slot13:setTag(slot10:getTag() + 3000)
			slot13:setAnchorPoint(ccp(0.5, 0.5))
			slot13:setPosition(ccp(slot10:getPositionX(), slot10:getPositionY()))
			slot13:setBasePoint(ccp(slot13:getPositionX(), slot13:getPositionY()))

			if slot11 then
				uv4:addChild(slot13, slot10:getZOrder())
			else
				uv3:addChild(slot13, slot10:getZOrder())
			end

			if uv6[slot12] and uv7[slot12] then
				BattleCardUtil.setCardHp(slot13, uv6[slot12] / uv7[slot12])
			end

			slot14 = nil
			slot16 = slot13:runXMLAnimation((not slot11 or CCString:create("images/battle/xml/action/dodge_u")) and CCString:create("images/battle/xml/action/dodge_d")) * slot13:getFpsInterval()
			slot17 = CCArray:create()

			slot17:addObject(CCDelayTime:create(slot16))
			slot17:addObject(CCCallFuncN:create(BattleLayer.removeSelf))
			slot13:runAction(CCSequence:create(slot17))
			showCardNumber(slot13, GetLocalizeStringBy("key_2368"), 4)

			slot3 = slot16 < slot3 and slot3 or slot16

			if uv9 <= uv5 or uv9 == 0 then
				slot18 = CCArray:create()

				slot18:addObject(CCDelayTime:create(slot3))
				slot18:addObject(CCCallFuncN:create(setNodeVisible))
				slot18:addObject(CCCallFunc:create(currentRoundOver))
				slot10:runAction(CCSequence:create(slot18))
			end

			require("db/skill")

			slot3 = slot16 < slot3 and slot3 or slot16

			if BT_Skill.getDataById(slot4.arrChild[uv1].action, getAttackDressId(), getAttackTid(), getAttackTurnedId()).hitEffct ~= nil and tonumber(slot19.mpostionType) ~= 7 then
				if file_exists("audio/effect/" .. slot20 .. ".mp3") and uv5 == 1 and slot9 == 1 then
					AudioUtil.playEffect("audio/effect/" .. slot20 .. ".mp3")
				end

				slot21 = nil

				if ((not slot11 or uv4:getChildByTag(slot10:getTag() + 5000)) and uv3:getChildByTag(slot10:getTag() + 5000)) == nil then
					slot21 = (not file_exists("images/battle/effect/" .. slot20 .. ".plist") or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot20), -1, CCString:create(""))) and CCLayerSprite:layerSpriteWithName(CCString:create(slot11 == true and "images/battle/effect/" .. slot20 .. "_u" or "images/battle/effect/" .. slot20 .. "_d"), -1, CCString:create(""))

					slot21:retain()
					slot21:setAnchorPoint(ccp(0.5, 0.5))
					slot21:setPosition(slot10:getPositionX(), slot10:getPositionY())

					if slot11 then
						uv4:addChild(slot21, 99999, slot10:getTag() + 5000)
					else
						uv3:addChild(slot21, 99999, slot10:getTag() + 5000)
					end

					slot21:release()
				end

				if uv9 <= uv5 or uv9 == 0 then
					slot24 = BTAnimationEventDelegate:create()

					slot24:registerLayerEndedHandler(function (slot0, slot1)
						removeSelf(uv0)
					end)
					slot24:registerLayerChangedHandler(function (slot0, slot1)
					end)
					tolua.cast(slot21, "CCLayerSprite"):setDelegate(slot24)
				end
			end
		elseif uv9 <= uv5 or uv9 == 0 then
			slot13 = CCArray:create()

			slot13:addObject(CCDelayTime:create(1.5))
			slot13:addObject(CCCallFuncN:create(setNodeVisible))
			slot13:addObject(CCCallFunc:create(currentRoundOver))
			slot10:runAction(CCSequence:create(slot13))
		end
	end
end

function showChildAttackTrail(slot0, slot1, slot2)
	if uv0.battle[slot0].arrChild[uv1].arrReaction == nil then
		updateChildDefendersBuff()

		return
	end

	slot4 = 0

	for slot8 = 1, #slot3.arrChild[uv1].arrReaction do
		slot9 = nil
		slot10 = false

		for slot15 = 1, #uv0.team1.arrHero do
			if uv0.team1.arrHero[slot15].hid == slot3.arrChild[uv1].arrReaction[slot8].defender then
				slot9 = tolua.cast(uv2:getChildByTag(1000 + slot16.position), "CCXMLSprite")
				slot10 = false

				break
			end
		end

		for slot15 = 1, #uv0.team2.arrHero do
			if uv0.team2.arrHero[slot15].hid == slot11 then
				slot9 = tolua.cast(uv3:getChildByTag(3000 + slot16.position), "CCXMLSprite")
				slot10 = true

				break
			end
		end

		require("db/skill")

		slot13 = BT_Skill.getDataById(slot3.arrChild[uv1].action, getAttackDressId(), getAttackTid(), getAttackTurnedId())

		if slot3.arrChild[uv1].arrReaction[slot8].arrDamage ~= nil and slot9 ~= nil and (slot13.mpostionType == 4 or slot13.mpostionType == 3) and slot13.distancePath ~= nil then
			slot14 = uv4:convertToWorldSpace(ccp(uv4:getContentSize().width * uv4:getScale() * 0.5, uv4:getContentSize().height * uv4:getScale() * 0.5))
			slot15 = slot9:convertToWorldSpace(ccp(slot9:getContentSize().width * slot9:getScale() * 0.5, slot9:getContentSize().height * slot9:getScale() * 0.5))

			if file_exists("audio/effect/" .. slot13.distancePath .. ".mp3") and uv5 == 1 and slot8 == 1 then
				AudioUtil.playEffect("audio/effect/" .. slot13.distancePath .. ".mp3")
			end

			slot16 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot13.distancePath), -1, CCString:create(""))

			slot16:retain()
			slot16:setAnchorPoint(ccp(0.5, 0.5))
			slot16:setPosition(uv6:convertToNodeSpace(slot14))
			uv6:addChild(slot16, 11)
			slot16:release()

			if slot10 == false then
				slot17 = slot16:getChildren()
				slot21 = slot17

				for slot21 = 0, slot17.count(slot21) - 1 do
					tolua.cast(slot17:objectAtIndex(slot21), "CCXMLSprite"):setFlipY(true)
				end
			end

			slot17 = CCArray:create()
			slot18 = uv6:convertToNodeSpace(slot15)

			if slot10 == false then
				slot16:setPositionY(slot16:getPositionY() + uv4:getContentSize().height)

				slot18 = ccp(slot18.x, slot18.y + uv4:getContentSize().height)
			end

			slot17:addObject(CCMoveTo:create(uv7, slot18))
			slot17:addObject(CCCallFuncN:create(removeSelf))
			slot16:runAction(CCSequence:create(slot17))

			slot4 = uv7 < slot4 and slot4 or uv7
		end
	end

	if slot4 == 0 then
		showChildDefenderEffect(slot0, slot1, slot2)
	else
		slot6 = CCArray:create()

		slot6:addObject(CCDelayTime:create(slot4))
		slot6:addObject(CCCallFunc:create(function ()
			showChildDefenderEffect(uv0, uv1, uv2)
		end))
		uv6:runAction(CCSequence:create(slot6))
	end
end

function showChildAttackEffect()
	if uv0.arrChild == nil then
		return
	end

	require("db/skill")

	if BT_Skill.getDataById(uv0.arrChild[uv1].action, getAttackDressId(), getAttackTid(), getAttackTurnedId()).attackEffct == nil or slot1.attackEffct == "" or uv0.arrChild[uv1].arrReaction == nil then
		uv2 = 1
		uv3 = 1

		showChildAttackTrail(uv4 - 1, uv2, uv3)

		return
	end

	if slot1.attackEffct ~= nil and file_exists("audio/effect/" .. slot1.attackEffct .. ".mp3") then
		AudioUtil.playEffect("audio/effect/" .. slot1.attackEffct .. ".mp3")
	end

	slot2 = false
	slot3 = false

	if tonumber(slot1.functionWay) == 2 or tonumber(slot1.showDamage) == 1 then
		slot2 = true
	end

	if uv0.arrReaction and slot2 and table.count(uv0.arrChild[uv1].arrReaction) > 1 then
		slot3 = true
		slot4 = uv0.arrChild[uv1]

		performWithDelay(uv5, function (...)
			showTotalDamage(uv0)
		end, 0.5)
	end

	if slot1.attackEffctPosition == nil or slot1.meffectType ~= 1 then
		slot4 = nil

		((not file_exists("images/battle/effect/" .. slot1.attackEffct .. ".plist") or not file_exists("images/battle/effect/" .. slot1.attackEffct .. "_0.xml") or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot1.attackEffct), -1, CCString:create(""))) and (not uv6 or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot1.attackEffct .. "_u"), -1, CCString:create(""))) and CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot1.attackEffct .. "_d"), -1, CCString:create(""))):setAnchorPoint(ccp(0.5, 0.5))

		if slot1.meffectType == nil or slot1.meffectType == 1 then
			slot4:setPosition(ccp(uv7:getPositionX(), uv7:getPositionY() - uv7:getContentSize().height / 2))

			if uv6 then
				uv8:addChild(slot4, 9999, 9182)
			else
				uv9:addChild(slot4, 9999, 9182)
			end
		elseif uv10 then
			slot7 = getEnemyCardPointByPosition(1)

			slot4:setPosition(ccp(slot7.x, slot7.y - uv7:getContentSize().height * 0.5))
			uv8:addChild(slot4, 9999, 9182)
		else
			slot7 = getPlayerCardPointByPosition(4)

			slot4:setPosition(ccp(slot7.x, slot7.y - uv7:getContentSize().height * 0.5))
			uv9:addChild(slot4, 9999, 9182)
		end

		uv3 = slot4:getKeySprie():getMyKeyFrameCount()
		uv2 = 0
		slot7 = uv0.arrChild[uv1]
		slot10 = BTAnimationEventDelegate:create()

		slot10:registerLayerEndedHandler(function (slot0, slot1)
			if uv0 > 1 and uv1 == false and uv2 then
				showTotalDamage(uv3)
			end

			endShake()
			updateChildDefendersBuff()
			uv4:removeFromParentAndCleanup(true)
		end)
		slot10:registerLayerChangedHandler(function (slot0, slot1)
			if tolua.cast(slot1, "CCXMLSprite"):getIsKeyFrame() then
				uv0 = uv0 + 1

				showChildAttackTrail(uv1 - 1, uv0, uv2)
			end
		end)
		slot4:setDelegate(slot10)

		if uv3 > 1 then
			startShake()
		end

		return
	end

	for slot7 = 1, #uv0.arrChild[uv1].arrReaction do
		slot8 = nil
		slot9 = false

		for slot14 = 1, #uv11.team1.arrHero do
			if uv11.team1.arrHero[slot14].hid == uv0.arrChild[uv1].arrReaction[slot7].defender then
				slot8 = tolua.cast(uv9:getChildByTag(1000 + slot15.position), "CCXMLSprite")
				slot9 = false

				break
			end
		end

		for slot14 = 1, #uv11.team2.arrHero do
			if uv11.team2.arrHero[slot14].hid == slot10 then
				slot8 = tolua.cast(uv8:getChildByTag(3000 + slot15.position), "CCXMLSprite")
				slot9 = true

				break
			end
		end

		if slot8 ~= nil then
			slot11 = nil
			slot11 = (not file_exists("images/battle/effect/" .. slot1.attackEffct .. ".plist") or not file_exists("images/battle/effect/" .. slot1.attackEffct .. "_0.xml") or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot1.attackEffct), -1, CCString:create(""))) and (not uv6 or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot1.attackEffct .. "_u"), -1, CCString:create(""))) and CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot1.attackEffct .. "_d"), -1, CCString:create(""))

			slot11:retain()
			slot11:setAnchorPoint(ccp(0.5, 0))

			if slot1.attackEffctPosition == 2 then
				slot11:setPosition(ccp(slot8:getPositionX(), slot8:getPositionY()))

				if uv6 then
					uv8:addChild(slot11, 9999, 9182)
				else
					uv9:addChild(slot11, 9999, 9182)
				end
			else
				slot11:setPosition(ccp(slot8:getPositionX(), slot8:getPositionY() - slot8:getContentSize().height / 2))

				if uv6 then
					uv8:addChild(slot11, 9999, 9182)
				else
					uv9:addChild(slot11, 9999, 9182)
				end
			end

			slot11:release()

			uv3 = slot11:getKeySprie():getMyKeyFrameCount()
			uv2 = 0
			slot14 = uv0.arrChild[uv1]

			function slot17(slot0, slot1)
				uv0:removeFromParentAndCleanup(true)
			end

			function slot18(slot0, slot1)
			end

			slot19 = BTAnimationEventDelegate:create()

			if slot7 == 1 then
				slot19:registerLayerEndedHandler(function (slot0, slot1)
					if uv0 > 1 and uv1 == false and uv2 then
						showTotalDamage(uv3)
					end

					endShake()
					updateChildDefendersBuff()
					uv4:removeFromParentAndCleanup(true)
				end)
				slot19:registerLayerChangedHandler(function (slot0, slot1)
					if tolua.cast(slot1, "CCXMLSprite"):getIsKeyFrame() then
						uv0 = uv0 + 1

						showChildAttackTrail(uv1 - 1, uv0, uv2)
					end
				end)
			else
				slot19:registerLayerEndedHandler(slot17)
				slot19:registerLayerChangedHandler(slot18)
			end

			slot11:setDelegate(slot19)

			if uv3 > 1 then
				startShake()
			end
		end
	end
end

function showChildBattleAttack()
	slot0 = os.clock()
	uv0 = uv0 + 1

	if uv1.arrChild == nil or uv0 > #uv1.arrChild then
		goBack()

		return
	end

	if uv1.arrChild[uv0].arrReaction == nil and uv1.arrChild[uv0].enBuffer == nil and uv1.arrChild[uv0].deBuffer == nil and uv1.arrChild[uv0].imBuffer == nil and uv1.arrChild[uv0].buffer == nil then
		showChildBattleAttack()

		return
	end

	print("child skill index =》", uv0)
	setNodeNotVisible(uv2)
	require("db/skill")

	slot2 = BT_Skill.getDataById(uv1.arrChild[uv0].action, getAttackDressId(), getAttackTid(), getAttackTurnedId())
	slot3 = createBattleCard(uv1.arrChild[uv0].attacker)

	slot3:setTag(4900)
	slot3:setAnchorPoint(ccp(0.5, 0.5))
	slot3:setPosition(ccp(uv2:getPositionX(), uv2:getPositionY()))
	slot3:setBasePoint(ccp(slot3:getPositionX(), slot3:getPositionY()))

	if uv3 then
		uv4:addChild(slot3, uv2:getZOrder())
	else
		uv5:addChild(slot3, uv2:getZOrder())
	end

	if uv6[uv1.arrChild[uv0].attacker] and uv7[uv1.arrChild[uv0].attacker] then
		BattleCardUtil.setCardHp(slot3, uv6[uv1.arrChild[uv0].attacker] / uv7[uv1.arrChild[uv0].attacker])
	end

	if uv8[uv1.arrChild[uv0].attacker] == nil then
		uv8[uv1.arrChild[uv0].attacker] = 0
	end

	slot6 = uv1.arrChild[uv0].attacker

	BattleCardUtil.setCardAnger(slot3, uv8[slot6], slot6)
	BattleCardUtil.setCardAnger(uv2, uv8[slot6], slot6)

	slot9 = BTAnimationEventDelegate:create()

	slot9:registerLayerEndedHandler(function ()
		showAttackerVisible()

		if uv0.attackEffct == nil or uv0.attackEffct == "" then
			print("child skill index 1=》", uv1)

			slot0 = CCArray:create()

			slot0:addObject(CCDelayTime:create(1))
			slot0:addObject(CCCallFunc:create(updateChildDefendersBuff))
			uv2:runAction(CCSequence:create(slot0))
		end

		uv3:removeFromParentAndCleanup(true)
	end)
	slot9:registerLayerChangedHandler(function (slot0, slot1)
		if tolua.cast(slot1, "CCXMLSprite"):getIsKeyFrame() then
			print("child skill index 2=》", uv0)
			showChildAttackEffect()
			print("child skill index 3=》", uv0)
		end
	end)
	slot3:setDelegate(slot9)

	if file_exists("audio/effect/" .. slot2.actionid .. ".mp3") then
		AudioUtil.playEffect("audio/effect/" .. slot2.actionid .. ".mp3")
	end

	slot10 = nil
	slot11 = ((not file_exists("images/battle/xml/action/" .. slot2.actionid .. ".xml") or slot3:runXMLAnimation(CCString:create("images/battle/xml/action/" .. slot2.actionid))) and slot3:runXMLAnimation(CCString:create("images/battle/xml/action/" .. (uv3 and slot2.actionid .. "_u_0" or slot2.actionid .. "_d_0")))) * slot3:getFpsInterval()

	if uv8[uv1.arrChild[uv0].attacker] == nil then
		uv8[uv1.arrChild[uv0].attacker] = 0
	end

	if uv1.arrChild[uv0].rage ~= nil then
		uv8[uv1.arrChild[uv0].attacker] = uv8[uv1.arrChild[uv0].attacker] + tonumber(uv1.arrChild[uv0].rage)
	end

	slot12 = uv1.arrChild[uv0].attacker

	BattleCardUtil.setCardAnger(uv2, uv8[slot12], slot12)
end

slot107 = false

function updateDefendersBuff()
	slot0 = os.clock()

	if uv0 == nil or uv0.arrReaction == nil then
		if uv0.arrChild == nil then
			currentRoundOver()
		end

		showChildBattleAttack()

		return
	end

	for slot4 = 1, #uv0.arrReaction do
		slot5 = nil
		slot6 = false

		for slot11 = 1, #uv1.team1.arrHero do
			if uv1.team1.arrHero[slot11].hid == uv0.arrReaction[slot4].defender then
				slot5 = tolua.cast(uv2:getChildByTag(1000 + slot12.position), "CCXMLSprite")
				slot6 = false

				break
			end
		end

		for slot11 = 1, #uv1.team2.arrHero do
			if uv1.team2.arrHero[slot11].hid == slot7 then
				slot5 = tolua.cast(uv3:getChildByTag(3000 + slot12.position), "CCXMLSprite")
				slot6 = true

				break
			end
		end

		slot8 = false

		for slot12 = 1, #uv0.arrReaction do
			if uv0.arrReaction[slot12].defender == slot7 and uv0.arrReaction[slot12].mandown ~= nil and uv0.arrReaction[slot12].mandown == true then
				slot8 = true
			end
		end

		if slot5 ~= nil and slot8 ~= true then
			playClearBufferEffect(slot5, uv0.arrReaction[slot4].clear)

			if slot4 == #uv0.arrReaction then
				updateCardBuff(slot7, slot5, nil, uv0.arrReaction[slot4].enBuffer, uv0.arrReaction[slot4].deBuffer, uv0.arrReaction[slot4].imBuffer, uv0.arrReaction[slot4].buffer, showChildBattleAttack, 1)
			else
				updateCardBuff(slot7, slot5, nil, uv0.arrReaction[slot4].enBuffer, uv0.arrReaction[slot4].deBuffer, uv0.arrReaction[slot4].imBuffer, uv0.arrReaction[slot4].buffer, nil, 1)
			end
		elseif slot8 == true and slot5 ~= nil then
			if slot5:getOpacity() > 240 then
				slot5:stopAllActions()
				slot5:setOpacity(0)
				slot5:removeChildByTag(BattleLayer.kHeroCooperateIconTag, true)
				slot5:removeChildByTag(BattleCardUtil.kCooperateIconTag, true)

				slot9 = createBattleCard(slot7)

				slot9:setPosition(slot5:getPositionX(), slot5:getPositionY())
				slot9:setBasePoint(ccp(slot9:getPositionX(), slot9:getPositionY()))
				BattleCardUtil.setCardHp(slot9, 0)

				slot12 = BTAnimationEventDelegate:create()

				slot12:registerLayerEndedHandler(function (slot0, slot1)
					uv0:removeFromParentAndCleanup(true)
				end)
				slot12:registerLayerChangedHandler(function (slot0, slot1)
				end)
				slot9:setDelegate(slot12)
				slot9:runXMLAnimation(CCString:create("images/battle/xml/action/T007_0"))
				slot5:getParent():addChild(slot9, slot5:getZOrder())

				if slot5:getTag() >= 1000 and slot5:getTag() <= 1005 then
					uv4[table.maxn(uv4) + 1] = uv5["" .. slot5:getTag() % 10]
					slot13 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/deada"), -1, CCString:create(""))

					slot13:setAnchorPoint(ccp(0.5, 0.5))
					slot13:setPosition(slot5:getPositionX(), slot5:getPositionY() - slot5:getContentSize().height * 0.1)
					uv2:addChild(slot13, 0, slot5:getTag() + 8115)

					slot16 = BTAnimationEventDelegate:create()

					slot16:registerLayerEndedHandler(function (slot0, slot1)
						uv0:cleanup()

						slot2 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/guihuo"), -1, CCString:create(""))

						slot2:setAnchorPoint(ccp(0.5, 0.5))
						slot2:setPosition(0, -50)
						uv0:addChild(slot2, 1)
					end)
					slot16:registerLayerChangedHandler(function (slot0, slot1)
					end)
					slot13:setDelegate(slot16)
				end

				showDropEffect(hid, slot5:convertToWorldSpace(ccp(slot5:getContentSize().width * 0.5, slot5:getContentSize().height * 0.5)))
			end

			if slot4 == #uv0.arrReaction then
				showChildBattleAttack()
			end
		end
	end

	slot1 = os.clock()
end

function showDefenderDamage(slot0, slot1, slot2, slot3)
	slot4 = os.clock()
	slot5 = uv0.battle[slot1]
	slot6 = slot2
	slot7 = slot3
	slot8 = true

	if math.floor(slot0:getTag() / 1000) == 4 then
		slot8 = false
	end

	slot9 = 0
	slot10 = 0
	slot11 = false
	slot12 = nil

	if slot8 == true then
		for slot16 = 1, #uv0.team2.arrHero do
			if uv0.team2.arrHero[slot16].position == slot0:getTag() % 10 then
				slot9 = slot17.hid
				slot12 = tolua.cast(uv1:getChildByTag(3000 + slot17.position), "CCXMLSprite")

				break
			end
		end
	else
		for slot16 = 1, #uv0.team1.arrHero do
			if uv0.team1.arrHero[slot16].position == slot0:getTag() % 10 then
				slot9 = slot17.hid
				slot12 = tolua.cast(uv2:getChildByTag(1000 + slot17.position), "CCXMLSprite")

				break
			end
		end
	end

	for slot16 = 1, #slot5.arrReaction do
		if slot5.arrReaction[slot16].arrDamage ~= nil and slot5.arrReaction[slot16].defender == slot9 then
			for slot20 = 1, #slot5.arrReaction[slot16].arrDamage do
				slot10 = slot10 + slot5.arrReaction[slot16].arrDamage[slot20].damageValue
			end

			if slot5.arrReaction[slot16].fatal ~= nil and slot5.arrReaction[slot16].fatal == true then
				slot11 = true
			end
		end
	end

	if slot7 <= slot6 then
		uv3[slot9] = uv3[slot9] - slot10

		if slot12 ~= nil then
			if slot13 < 1 then
				slot13 = 0

				slot12:setOpacity(0)
				slot12:removeChildByTag(BattleLayer.kHeroCooperateIconTag, true)
				slot12:removeChildByTag(BattleCardUtil.kCooperateIconTag, true)

				slot14 = createBattleCard(slot9)

				slot14:setPosition(slot12:getPositionX(), slot12:getPositionY())
				slot14:setBasePoint(ccp(slot14:getPositionX(), slot14:getPositionY()))
				BattleCardUtil.setCardHp(slot14, 0)

				slot17 = BTAnimationEventDelegate:create()

				slot17:registerLayerEndedHandler(function (slot0, slot1)
					uv0:removeFromParentAndCleanup(true)
				end)
				slot17:registerLayerChangedHandler(function (slot0, slot1)
				end)
				slot14:setDelegate(slot17)
				slot14:runXMLAnimation(CCString:create("images/battle/xml/action/T007_0"))
				slot12:getParent():addChild(slot14, slot12:getZOrder())

				if slot8 == false then
					uv4[table.maxn(uv4) + 1] = uv5["" .. slot0:getTag() % 10]
					slot18 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/deada"), -1, CCString:create(""))

					slot18:setAnchorPoint(ccp(0.5, 0.5))
					slot18:setPosition(slot12:getPositionX(), slot12:getPositionY() - slot12:getContentSize().height * 0.1)
					uv2:addChild(slot18, 0, slot12:getTag() + 8115)

					slot21 = BTAnimationEventDelegate:create()

					slot21:registerLayerEndedHandler(function (slot0, slot1)
						uv0:cleanup()

						slot2 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/guihuo"), -1, CCString:create(""))

						slot2:setAnchorPoint(ccp(0.5, 0.5))
						slot2:setPosition(0, -50)
						uv0:addChild(slot2, 1)
					end)
					slot21:registerLayerChangedHandler(function (slot0, slot1)
					end)
					slot18:setDelegate(slot21)
				end

				showDropEffect(slot9, slot12:convertToWorldSpace(ccp(slot12:getContentSize().width * 0.5, slot12:getContentSize().height * 0.5)))
			end

			if slot13 and uv6[slot9] then
				BattleCardUtil.setCardHp(slot12, slot13 / uv6[slot9])
			end
		end

		if slot0 ~= nil then
			if slot13 < 1 then
				slot13 = 0
			end

			if slot13 and uv6[slot9] then
				BattleCardUtil.setCardHp(slot0, slot13 / uv6[slot9])
			end
		end
	end

	if slot7 ~= 0 then
		slot10 = slot10 / slot7
	end

	slot13 = 43
	slot14 = "number/red"

	if slot11 then
		slot14 = "number/critical"
		slot13 = 50
		slot15 = CCSprite:create(uv7 .. "number/critical.png")

		slot15:setAnchorPoint(ccp(0.5, 0))
		slot15:setPosition(uv8:convertToNodeSpace(slot0:getParent():convertToWorldSpace(ccp(slot0:getPositionX(), slot0:getPositionY() + slot0:getContentSize().height * 0.75))))
		uv8:addChild(slot15, 9999)
		slot15:setOpacity(0)

		slot18 = CCArray:create()

		slot18:addObject(CCFadeIn:create(0.3))
		slot18:addObject(CCDelayTime:create(0.7))
		slot18:addObject(CCFadeOut:create(0.3))
		slot18:addObject(CCCallFuncN:create(removeSelf))
		slot15:runAction(CCSequence:create(slot18))
	end

	LuaCC.createNumberSprite02(uv7 .. slot14, "-" .. math.ceil(slot10), slot13):setAnchorPoint(ccp(0.5, 0.5))

	if slot3 > 1 then
		slot15:setPosition(uv8:convertToNodeSpace(slot0:getParent():convertToWorldSpace(ccp(slot0:getPositionX() + math.random(-slot0:getContentSize().width * 0.3, slot0:getContentSize().width * 0.3), slot0:getPositionY() + slot0:getContentSize().height * 0.5 + math.random(-slot0:getContentSize().width * 0.3, slot0:getContentSize().width * 0.3)))))
		uv8:addChild(slot15, 9999)
	else
		slot15:setPosition(uv8:convertToNodeSpace(slot0:getParent():convertToWorldSpace(ccp(slot0:getPositionX(), slot0:getPositionY() + slot0:getContentSize().height * 0.5))))
		uv8:addChild(slot15, 9999)
	end

	slot16 = CCArray:create()

	slot16:addObject(CCScaleTo:create(0.1, 2))
	slot16:addObject(CCScaleTo:create(0.05, 1))
	slot16:addObject(CCDelayTime:create(1))
	slot16:addObject(CCScaleTo:create(0.08, 0.01))
	slot16:addObject(CCCallFuncN:create(removeSelf))
	slot15:runAction(CCSequence:create(slot16))

	slot17 = os.clock()
end

function showDefenderEffect(slot0, slot1, slot2, slot3)
	slot4 = os.clock()
	slot6 = 0

	for slot10 = 1, #uv0.battle[slot1].arrReaction do
		slot11 = nil
		slot12 = false

		for slot17 = 1, #uv0.team1.arrHero do
			if uv0.team1.arrHero[slot17].hid == slot5.arrReaction[slot10].defender then
				slot11 = tolua.cast(uv1:getChildByTag(1000 + slot18.position), "CCXMLSprite")
				slot12 = false

				break
			end
		end

		for slot17 = 1, #uv0.team2.arrHero do
			if uv0.team2.arrHero[slot17].hid == slot13 then
				slot11 = tolua.cast(uv2:getChildByTag(3000 + slot18.position), "CCXMLSprite")
				slot12 = true

				break
			end
		end

		if slot0 ~= nil and slot13 ~= slot0 then
			-- Nothing
		elseif slot5.arrReaction[slot10].arrDamage ~= nil and slot11 ~= nil then
			if uv3 <= 1 then
				setNodeNotVisible(slot11)
			end

			require("db/skill")

			slot15 = BT_Skill.getDataById(slot5.action, getAttackDressId(), getAttackTid(), getAttackTurnedId())
			slot16 = nil

			if ((not slot12 or tolua.cast(uv2:getChildByTag(slot11:getTag() + 3000), "CCXMLSprite")) and tolua.cast(uv1:getChildByTag(slot11:getTag() + 3000), "CCXMLSprite")) == nil then
				if slot12 then
					uv2:addChild(createBattleCard(slot13), slot11:getZOrder())
				else
					uv1:addChild(slot16, slot11:getZOrder())
				end
			end

			slot16:setVisible(true)
			slot16:setTag(slot11:getTag() + 3000)
			slot16:setAnchorPoint(ccp(0.5, 0))
			slot16:setPosition(ccp(slot11:getPositionX(), slot11:getPositionY() - slot11:getContentSize().height * 0.5))
			slot16:setBasePoint(ccp(slot16:getPositionX(), slot16:getPositionY()))

			if uv4[slot13] and uv5[slot13] then
				BattleCardUtil.setCardHp(slot16, uv4[slot13] / uv5[slot13])
			end

			if uv6[slot13] == nil then
				uv6[slot13] = 0
			end

			slot17 = nil

			slot16:setColor(ccc3(255, 0, 0))

			slot21 = CCArray:create()

			slot21:addObject(CCCallFuncN:create(function ()
				showDefenderDamage(uv0, uv1, uv2, uv3)
			end))
			slot21:addObject(CCDelayTime:create(slot16:runXMLAnimation((tonumber(slot15.mpostionType) ~= 7 or (not slot12 or CCString:create("images/battle/xml/action/hurt2_u_0")) and CCString:create("images/battle/xml/action/hurt2_d_0")) and (not slot12 or CCString:create("images/battle/xml/action/hurt1_u_0")) and CCString:create("images/battle/xml/action/hurt1_d_0")) * slot16:getFpsInterval()))

			if uv7 < uv3 then
				-- Nothing
			end

			if uv7 <= uv3 then
				slot21:addObject(CCCallFuncN:create(BattleLayer.removeSelf))
			end

			slot16:stopAllActions()
			slot16:runAction(CCSequence:create(slot21))

			slot22 = slot15.hitEffct

			if slot5.arrReaction[slot10].reaction == 4 then
				slot22 = "heffect_10"

				showCardNumber(slot16, GetLocalizeStringBy("key_2305"), 5)
			end

			slot6 = slot19 < slot6 and slot6 or slot19

			if slot22 ~= nil and tonumber(slot15.mpostionType) ~= 7 then
				if file_exists("audio/effect/" .. slot22 .. ".mp3") and uv3 == 1 and slot10 == 1 then
					AudioUtil.playEffect("audio/effect/" .. slot22 .. ".mp3")
				end

				slot23 = nil

				if ((not slot12 or uv2:getChildByTag(slot11:getTag() + 5000)) and uv1:getChildByTag(slot11:getTag() + 5000)) == nil then
					slot23 = (not file_exists("images/battle/effect/" .. slot22 .. ".plist") or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot22), -1, CCString:create(""))) and CCLayerSprite:layerSpriteWithName(CCString:create(slot12 == true and "images/battle/effect/" .. slot22 .. "_u" or "images/battle/effect/" .. slot22 .. "_d"), -1, CCString:create(""))

					slot23:retain()
					slot23:setAnchorPoint(ccp(0.5, 0.5))
					slot23:setPosition(slot11:getPositionX(), slot11:getPositionY())

					if slot12 then
						uv2:addChild(slot23, 99999, slot11:getTag() + 5000)
					else
						uv1:addChild(slot23, 99999, slot11:getTag() + 5000)
					end

					slot23:release()
				end

				slot26 = BTAnimationEventDelegate:create()

				slot26:registerLayerEndedHandler(function (slot0, slot1)
					removeSelf(uv0)
				end)
				slot26:registerLayerChangedHandler(function (slot0, slot1)
				end)
				tolua.cast(slot23, "CCLayerSprite"):setDelegate(slot26)
			end

			if uv7 <= uv3 or uv7 == 0 then
				slot23 = CCArray:create()

				slot23:addObject(CCDelayTime:create(slot6))
				slot23:addObject(CCCallFuncN:create(setNodeVisible))

				if slot5.arrChild == nil and slot15.mpostionType ~= 5 then
					slot23:addObject(CCDelayTime:create(0.5))
					slot23:addObject(CCCallFunc:create(currentRoundOver))
				end

				slot11:runAction(CCSequence:create(slot23))
			end
		elseif slot5.arrReaction[slot10].reaction == 2 and slot11 ~= nil then
			if uv3 <= 1 then
				setNodeNotVisible(slot11)
			end

			slot14 = createBattleCard(slot13)

			slot14:setTag(slot11:getTag() + 17000)
			slot14:setAnchorPoint(ccp(0.5, 0.5))
			slot14:setPosition(ccp(slot11:getPositionX(), slot11:getPositionY()))
			slot14:setBasePoint(ccp(slot14:getPositionX(), slot14:getPositionY()))

			if slot12 then
				uv2:addChild(slot14, slot11:getZOrder())
			else
				uv1:addChild(slot14, slot11:getZOrder())
			end

			if uv4[slot13] and uv5[slot13] then
				BattleCardUtil.setCardHp(slot14, uv4[slot13] / uv5[slot13])
			end

			slot15 = nil
			slot17 = slot14:runXMLAnimation((not slot12 or CCString:create("images/battle/xml/action/dodge_u")) and CCString:create("images/battle/xml/action/dodge_d")) * slot14:getFpsInterval()
			slot18 = CCArray:create()

			slot18:addObject(CCDelayTime:create(slot17))
			slot18:addObject(CCCallFuncN:create(BattleLayer.removeSelf))
			slot14:stopAllActions()
			slot14:runAction(CCSequence:create(slot18))
			showCardNumber(slot14, GetLocalizeStringBy("key_2368"), 4)

			if uv7 <= uv3 or uv7 == 0 then
				slot19 = CCArray:create()

				slot19:addObject(CCDelayTime:create(slot17 < slot6 and slot6 or slot17))
				slot19:addObject(CCCallFuncN:create(setNodeVisible))

				if slot5.arrChild == nil then
					slot19:addObject(CCCallFunc:create(currentRoundOver))
				end

				slot11:runAction(CCSequence:create(slot19))
			end

			require("db/skill")

			if BT_Skill.getDataById(slot5.action, getAttackDressId(), getAttackTid(), getAttackTurnedId()).hitEffct ~= nil and tonumber(slot20.mpostionType) ~= 7 then
				if file_exists("audio/effect/" .. slot21 .. ".mp3") and uv3 == 1 and slot10 == 1 then
					AudioUtil.playEffect("audio/effect/" .. slot21 .. ".mp3")
				end

				slot22 = nil

				if ((not slot12 or uv2:getChildByTag(slot11:getTag() + 5000)) and uv1:getChildByTag(slot11:getTag() + 5000)) == nil then
					slot22 = (not file_exists("images/battle/effect/" .. slot21 .. ".plist") or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot21), -1, CCString:create(""))) and CCLayerSprite:layerSpriteWithName(CCString:create(slot12 == true and "images/battle/effect/" .. slot21 .. "_u" or "images/battle/effect/" .. slot21 .. "_d"), -1, CCString:create(""))

					slot22:retain()
					slot22:setAnchorPoint(ccp(0.5, 0.5))
					slot22:setPosition(slot11:getPositionX(), slot11:getPositionY())

					if slot12 then
						uv2:addChild(slot22, 99999, slot11:getTag() + 5000)
					else
						uv1:addChild(slot22, 99999, slot11:getTag() + 5000)
					end

					slot22:release()
				end

				slot25 = BTAnimationEventDelegate:create()

				slot25:registerLayerEndedHandler(function (slot0, slot1)
					removeSelf(uv0)
				end)
				slot25:registerLayerChangedHandler(function (slot0, slot1)
				end)
				tolua.cast(slot22, "CCLayerSprite"):setDelegate(slot25)
			end
		elseif slot5.arrChild == nil then
			currentRoundOver()
		end
	end

	slot7 = os.clock()
end

function showAttackTrailThough(slot0)
	if uv0.battle[slot0].arrReaction == nil then
		updateDefendersBuff()

		return
	end

	slot2 = 0

	require("db/skill")

	slot4 = BT_Skill.getDataById(slot1.action, getAttackDressId(), getAttackTid(), getAttackTurnedId())
	slot6 = ccp(uv1:convertToWorldSpace(ccp(uv1:getContentSize().width * uv1:getScale() * 0.5, uv1:getContentSize().height * uv1:getScale() * 0.5)).x, CCDirector:sharedDirector():getWinSize().height + uv1:getContentSize().height)

	if uv2 == true then
		slot6 = ccp(slot5.x, -uv1:getContentSize().height)
	end

	if file_exists("audio/effect/" .. slot4.distancePath .. ".mp3") and uv3 == 1 then
		AudioUtil.playEffect("audio/effect/" .. slot4.distancePath .. ".mp3")
	end

	slot7 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot4.distancePath), -1, CCString:create(""))

	slot7:retain()
	slot7:setAnchorPoint(ccp(0.5, 0.5))
	slot7:setPosition(uv4:convertToNodeSpace(slot5))
	uv4:addChild(slot7, 11)
	slot7:release()

	slot8 = 0
	slot9 = ccp(slot6.x - slot5.x, slot6.y - slot5.y)

	if slot9.x < 0 then
		slot10 = 360 - math.deg(math.atan(math.abs(slot9.x / slot9.y)))
	end

	if slot9.y < 0 then
		slot10 = slot10 > 180 and 540 - slot10 or 180 - slot10
	end

	slot7:setRotation(slot10)

	slot11 = 0.5
	slot12 = CCArray:create()
	slot13 = uv4:convertToNodeSpace(slot6)

	if currentIsDefenderEnemy == false then
		-- Nothing
	end

	slot12:addObject(CCMoveTo:create(slot11, slot13))
	slot12:addObject(CCCallFuncN:create(removeSelf))

	slot17 = CCSequence
	slot17 = slot17.create

	slot7:runAction(slot17(slot17, slot12))

	for slot17 = 1, #slot1.arrReaction do
		slot18 = nil
		slot19 = false
		slot20 = 0

		for slot25 = 1, #uv0.team1.arrHero do
			if uv0.team1.arrHero[slot25].hid == slot1.arrReaction[slot17].defender then
				slot18 = tolua.cast(uv5:getChildByTag(1000 + slot26.position), "CCXMLSprite")
				slot19 = false
				slot20 = slot26.position

				break
			end
		end

		for slot25 = 1, #uv0.team2.arrHero do
			if uv0.team2.arrHero[slot25].hid == slot21 then
				slot18 = tolua.cast(uv6:getChildByTag(3000 + slot26.position), "CCXMLSprite")
				slot19 = true
				slot20 = slot26.position

				break
			end
		end

		if slot18 ~= nil and slot4.distancePath ~= nil then
			slot23 = CCArray:create()

			slot23:addObject(CCDelayTime:create(slot11 * 0.2 + slot11 * 0.4 * math.floor(tonumber(slot20) / 3)))
			slot23:addObject(CCCallFunc:create(function ()
				showDefenderEffect(uv0, uv1, 1, 1)
			end))
			slot18:runAction(CCSequence:create(slot23))
		end
	end

	slot14 = CCArray:create()

	slot14:addObject(CCDelayTime:create(slot11))
	slot14:addObject(CCCallFunc:create(updateDefendersBuff))
	slot14:addObject(CCDelayTime:create(0.5))
	slot14:addObject(CCCallFunc:create(currentRoundOver))
	uv4:runAction(CCSequence:create(slot14))
end

function showAttackTrail(slot0, slot1, slot2)
	if uv0.battle[slot0].arrReaction == nil then
		return
	end

	slot4 = 0

	for slot8 = 1, #slot3.arrReaction do
		slot9 = nil
		slot10 = false

		for slot15 = 1, #uv0.team1.arrHero do
			if uv0.team1.arrHero[slot15].hid == slot3.arrReaction[slot8].defender then
				slot9 = tolua.cast(uv1:getChildByTag(1000 + slot16.position), "CCXMLSprite")
				slot10 = false

				break
			end
		end

		for slot15 = 1, #uv0.team2.arrHero do
			if uv0.team2.arrHero[slot15].hid == slot11 then
				slot9 = tolua.cast(uv2:getChildByTag(3000 + slot16.position), "CCXMLSprite")
				slot10 = true

				break
			end
		end

		require("db/skill")

		slot13 = BT_Skill.getDataById(slot3.action, getAttackDressId(), getAttackTid(), getAttackTurnedId())

		if slot9 ~= nil and (slot13.mpostionType == 4 or slot13.mpostionType == 3) and slot13.distancePath ~= nil then
			slot14 = uv3:convertToWorldSpace(ccp(uv3:getContentSize().width * uv3:getScale() * 0.5, uv3:getContentSize().height * uv3:getScale() * 0.5))
			slot15 = slot9:convertToWorldSpace(ccp(slot9:getContentSize().width * slot9:getScale() * 0.5, slot9:getContentSize().height * slot9:getScale() * 0.5))

			if file_exists("audio/effect/" .. slot13.distancePath .. ".mp3") and uv4 == 1 and slot8 == 1 then
				AudioUtil.playEffect("audio/effect/" .. slot13.distancePath .. ".mp3")
			end

			slot16 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot13.distancePath), -1, CCString:create(""))

			slot16:retain()
			slot16:setAnchorPoint(ccp(0.5, 0.5))
			slot16:setPosition(uv5:convertToNodeSpace(slot14))
			uv5:addChild(slot16, 11)
			slot16:release()

			slot17 = 0

			if slot10 == false then
				-- Nothing
			end

			slot18 = ccp(slot15.x - slot14.x, slot15.y - slot14.y)

			if slot18.x < 0 then
				slot19 = 360 - math.deg(math.atan(math.abs(slot18.x / slot18.y)))
			end

			if slot18.y < 0 then
				slot19 = slot19 > 180 and 540 - slot19 or 180 - slot19
			end

			slot16:setRotation(slot19)

			slot20 = CCArray:create()
			slot21 = uv5:convertToNodeSpace(slot15)

			if slot10 == false then
				slot16:setPositionY(slot16:getPositionY() + uv3:getContentSize().height)

				slot21 = ccp(slot21.x, slot21.y + uv3:getContentSize().height)
			end

			slot20:addObject(CCMoveTo:create(uv6, slot21))
			slot20:addObject(CCCallFuncN:create(removeSelf))
			slot16:runAction(CCSequence:create(slot20))

			slot4 = uv6 < slot4 and slot4 or uv6
		end
	end

	slot6 = CCArray:create()

	slot6:addObject(CCDelayTime:create(slot4))
	slot6:addObject(CCCallFunc:create(function ()
		showDefenderEffect(nil, uv0, uv1, uv2)
	end))
	uv5:runAction(CCSequence:create(slot6))
end

function showTotalDamage(slot0)
	slot1 = 0

	if slot0.arrReaction == nil then
		return
	end

	for slot5 = 1, #slot0.arrReaction do
		if slot0.arrReaction[slot5].arrDamage ~= nil then
			for slot10 = 1, #slot0.arrReaction[slot5].arrDamage do
				slot6 = 0 + slot0.arrReaction[slot5].arrDamage[slot10].damageValue
			end

			slot1 = slot1 + slot6
		end
	end

	if slot1 == 0 then
		return
	end

	if file_exists("audio/effect/" .. "zongshanghai" .. ".mp3") then
		AudioUtil.playEffect("audio/effect/" .. "zongshanghai" .. ".mp3")
	end

	slot2 = nil

	if file_exists("images/battle/effect/" .. "zongshanghai" .. ".plist") then
		slot2 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. "zongshanghai"), -1, CCString:create(""))
	end

	slot3 = LuaCC.createNumberSprite02(uv0 .. "number/red", "" .. slot1, 43)

	slot3:setAnchorPoint(ccp(0.5, 0.5))
	slot3:setPosition(100, 0)
	slot2:addChild(slot3, 999)
	slot2:retain()
	slot2:setPosition(ccps(0.5, 0.5))
	slot2:setAnchorPoint(ccp(0.5, 0.5))
	uv1:addChild(slot2, 201)
	slot2:setScale(uv2:getScale())
	slot2:release()

	slot6 = BTAnimationEventDelegate:create()

	slot6:registerLayerEndedHandler(function (slot0, slot1)
		uv0:removeFromParentAndCleanup(true)
	end)
	slot6:registerLayerChangedHandler(function (slot0, slot1)
	end)
	slot2:setDelegate(slot6)
end

function showAttackEffectConnect()
	require("db/skill")

	if BT_Skill.getDataById(uv0.action, getAttackDressId(), getAttackTid(), getAttackTurnedId()) == nil or slot1.attackEffct == nil or slot1.attackEffct == "" then
		uv1 = 1
		uv2 = 1

		showAttackTrail(uv3 - 1, uv1, uv2)

		return
	end

	if slot1.attackEffct ~= nil and file_exists("audio/effect/" .. slot1.attackEffct .. ".mp3") then
		AudioUtil.playEffect("audio/effect/" .. slot1.attackEffct .. ".mp3")
	end

	slot7 = uv4
	slot9 = slot7
	slot3 = uv5:convertToNodeSpace(uv4:convertToWorldSpace(ccp(slot7.getContentSize(slot9).width / 2, uv4:getContentSize().height / 2)))
	slot4 = 1
	slot5 = false

	for slot9 = 1, #uv0.arrReaction do
		slot10 = nil

		for slot15 = 1, #uv6.team1.arrHero do
			if uv6.team1.arrHero[slot15].hid == uv0.arrReaction[slot9].defender then
				slot10 = tolua.cast(uv7:getChildByTag(1000 + slot16.position), "CCXMLSprite")
				slot5 = false

				break
			end
		end

		for slot15 = 1, #uv6.team2.arrHero do
			if uv6.team2.arrHero[slot15].hid == slot11 then
				slot10 = tolua.cast(uv8:getChildByTag(3000 + slot16.position), "CCXMLSprite")
				slot5 = true

				break
			end
		end

		if slot10 ~= nil then
			slot12 = CCAnimation:create()
			slot13 = 1
			slot14 = 1

			for slot18 = 1, 30 do
				if file_exists(string.format(uv9 .. "effect/" .. slot1.attackEffct .. "%i.png", slot18)) then
					slot12:addSpriteFrameWithFileName(slot19)

					slot13 = slot18

					if slot18 == 1 then
						slot14 = CCTextureCache:sharedTextureCache():addImage(slot19):getContentSize().height
					elseif slot20 < slot14 then
						slot14 = slot20 or slot14
					end
				else
					break
				end
			end

			slot12:setDelayPerUnit(0.1)

			slot4 = slot13 * 0.1

			uv8:setPosition(ccp(0, -uv5:getPositionY() / uv5:getScale()))
			uv8:setVisible(true)

			slot16 = CCSprite:create()

			slot16:setPosition(slot3)
			slot16:setAnchorPoint(ccp(0.5, 0))
			slot16:setScale(math.pow(math.pow(slot10:getPositionX() - uv4:getPositionX(), 2) + math.pow(slot10:getPositionY() - uv4:getPositionY(), 2), 0.5) / slot14)

			slot18 = ccp(slot10:getPositionX() - uv4:getPositionX(), slot10:getPositionY() - uv4:getPositionY())

			if slot18.x < 0 then
				slot19 = 360 - math.deg(math.atan(math.abs(slot18.x / slot18.y)))
			end

			if slot18.y < 0 then
				slot19 = slot19 > 180 and 540 - slot19 or 180 - slot19
			end

			slot16:setRotation(slot19)
			uv5:addChild(slot16, 999, 1234)

			slot20 = CCArray:create()

			slot20:addObject(CCAnimate:create(slot12))
			slot20:addObject(CCCallFuncN:create(removeSelf))
			slot16:runAction(CCSequence:create(slot20))
		end
	end

	uv1 = 1
	uv2 = 1
	slot6 = uv0
	slot9 = CCArray:create()

	slot9:addObject(CCDelayTime:create(slot4))
	slot9:addObject(CCCallFunc:create(function (slot0, slot1)
		showAttackTrail(uv0 - 1, uv1, uv2)
	end))
	slot9:addObject(CCCallFunc:create(function (slot0, slot1)
		endShake()

		if uv0 > 1 then
			showTotalDamage(uv1)
		end

		updateDefendersBuff()
	end))
	uv5:runAction(CCSequence:create(slot9))
end

function showAttackEffect()
	slot0 = os.clock()

	require("db/skill")

	slot3 = false
	slot4 = false

	if tonumber(BT_Skill.getDataById(uv0.action, getAttackDressId(), getAttackTid(), getAttackTurnedId()).functionWay) == 2 or tonumber(slot2.showDamage) == 1 then
		slot3 = true
	end

	if slot2.mpostionType == 9 and slot3 then
		showAttackEffectConnect()

		return
	end

	if slot2.attackEffct ~= nil and file_exists("audio/effect/" .. slot2.attackEffct .. ".mp3") then
		AudioUtil.playEffect("audio/effect/" .. slot2.attackEffct .. ".mp3")
	end

	print("block index", uv1)
	print("m_currentBattleBlock.arrReaction", uv0.arrReaction)
	print("isShowCountDamage", slot3)

	if uv0.arrReaction and slot3 and table.count(uv0.arrReaction) > 1 then
		slot4 = true
		slot5 = uv0

		performWithDelay(uv2, function (...)
			showTotalDamage(uv0)
		end, 0.5)
	end

	if slot2 == nil or slot2.attackEffct == nil or slot2.attackEffct == "" then
		uv3 = 1
		uv4 = 1

		if slot2.mpostionType ~= 5 or slot2.distancePath == nil then
			showAttackTrail(uv1 - 1, uv3, uv4)
		else
			showAttackTrailThough(uv1 - 1)
		end

		return
	end

	if slot2.attackEffctPosition == nil or slot2.meffectType ~= 1 then
		slot5 = nil
		slot5 = (not file_exists("images/battle/effect/" .. slot2.attackEffct .. ".plist") or not file_exists("images/battle/effect/" .. slot2.attackEffct .. "_0.xml") or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot2.attackEffct), -1, CCString:create(""))) and (not uv5 or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot2.attackEffct .. "_u"), -1, CCString:create(""))) and CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot2.attackEffct .. "_d"), -1, CCString:create(""))

		slot5:retain()
		slot5:setAnchorPoint(ccp(0.5, 0.5))

		if slot2.meffectType == nil or slot2.meffectType == 1 then
			slot5:setPosition(ccp(uv6:getPositionX(), uv6:getPositionY() - uv6:getContentSize().height / 2))

			if uv5 then
				uv7:addChild(slot5, 9999, 9182)
			else
				uv8:addChild(slot5, 9999, 9182)
			end
		elseif uv9 then
			slot8 = getEnemyCardPointByPosition(1)

			slot5:setPosition(uv2:convertToNodeSpace(uv7:convertToWorldSpace(ccp(slot8.x, slot8.y - uv6:getContentSize().height * 0.5))))
			uv2:addChild(slot5, 9999, 9182)
		else
			slot8 = getPlayerCardPointByPosition(1)

			slot5:setPosition(uv2:convertToNodeSpace(uv8:convertToWorldSpace(ccp(slot8.x, slot8.y - uv6:getContentSize().height * 0.5))))
			uv2:addChild(slot5, 9999, 9182)
		end

		slot5:release()

		uv4 = slot5:getKeySprie():getMyKeyFrameCount()
		uv3 = 0
		slot10 = BTAnimationEventDelegate:create()

		slot10:registerLayerEndedHandler(function (slot0, slot1)
			endShake()

			if uv1 > 1 and uv2 == false and uv3 then
				showTotalDamage(uv0)

				uv2 = true
			end

			if uv4.mpostionType ~= 5 or uv4.distancePath == nil then
				if uv4.distancePath == nil then
					updateDefendersBuff()
				else
					slot3 = CCArray:create()

					slot3:addObject(CCDelayTime:create(uv5))
					slot3:addObject(CCCallFunc:create(updateDefendersBuff))
					uv6:runAction(CCSequence:create(slot3))
				end
			end

			uv7:removeFromParentAndCleanup(true)
		end)
		slot10:registerLayerChangedHandler(function (slot0, slot1)
			if tolua.cast(slot1, "CCXMLSprite"):getIsKeyFrame() then
				uv0 = uv0 + 1

				if uv1.mpostionType ~= 5 or uv1.distancePath == nil then
					showAttackTrail(uv2 - 1, uv0, uv3)
				else
					showAttackTrailThough(uv2 - 1)
				end
			end
		end)
		slot5:setDelegate(slot10)

		if uv4 > 1 then
			startShake()
		end
	else
		if uv0.arrReaction == nil then
			uv4 = 1
			uv3 = 1

			showAttackTrail(uv1 - 1, uv3, uv4)
			updateDefendersBuff()

			return
		end

		slot5 = false

		for slot9 = 1, #uv0.arrReaction do
			slot10 = nil

			for slot15 = 1, #uv11.team1.arrHero do
				if uv11.team1.arrHero[slot15].hid == uv0.arrReaction[slot9].defender then
					slot10 = tolua.cast(uv8:getChildByTag(1000 + slot16.position), "CCXMLSprite")
					slot5 = false

					break
				end
			end

			for slot15 = 1, #uv11.team2.arrHero do
				if uv11.team2.arrHero[slot15].hid == slot11 then
					slot10 = tolua.cast(uv7:getChildByTag(3000 + slot16.position), "CCXMLSprite")
					slot5 = true

					break
				end
			end

			if slot10 ~= nil then
				slot12 = nil
				slot12 = (not file_exists("images/battle/effect/" .. slot2.attackEffct .. ".plist") or not file_exists("images/battle/effect/" .. slot2.attackEffct .. "_0.xml") or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot2.attackEffct), -1, CCString:create(""))) and (not uv5 or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot2.attackEffct .. "_u"), -1, CCString:create(""))) and CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot2.attackEffct .. "_d"), -1, CCString:create(""))

				slot12:retain()
				slot12:setAnchorPoint(ccp(0.5, 0))

				if slot2.attackEffctPosition == 2 then
					slot12:setPosition(uv2:convertToNodeSpace(slot10:convertToWorldSpace(ccp(slot10:getContentSize().width / 2, slot10:getContentSize().height / 2))))
					uv2:addChild(slot12, 999, 9182)
				else
					slot12:setPosition(uv2:convertToNodeSpace(slot10:convertToWorldSpace(ccp(slot10:getContentSize().width / 2, 0))))
					uv2:addChild(slot12, 999, 9182)
				end

				slot12:release()

				uv4 = slot12:getKeySprie():getMyKeyFrameCount()
				uv3 = 0
				slot15 = uv0

				function slot18(slot0, slot1)
					uv0:removeFromParentAndCleanup(true)
				end

				function slot19(slot0, slot1)
				end

				slot20 = BTAnimationEventDelegate:create()

				if slot9 == 1 then
					slot20:registerLayerEndedHandler(function (slot0, slot1)
						endShake()

						if uv0 > 1 and uv1 == false and uv2 then
							showTotalDamage(uv3)
						end

						if uv4.distancePath == nil then
							updateDefendersBuff()
						else
							slot2 = CCArray:create()

							slot2:addObject(CCDelayTime:create(uv5))
							slot2:addObject(CCCallFunc:create(updateDefendersBuff))
							uv6:runAction(CCSequence:create(slot2))
						end

						uv7:removeFromParentAndCleanup(true)
					end)
					slot20:registerLayerChangedHandler(function (slot0, slot1)
						if tolua.cast(slot1, "CCXMLSprite"):getIsKeyFrame() == true then
							uv0 = uv0 + 1

							showAttackTrail(uv1 - 1, uv0, uv2)
						end
					end)
				else
					slot20:registerLayerEndedHandler(slot18)
					slot20:registerLayerChangedHandler(slot19)
				end

				slot12:setDelegate(slot20)

				if uv4 > 1 then
					startShake()
				end
			end

			if slot2.skipAble ~= nil and slot2.skipAble ~= "" then
				slot13 = uv12:getTag() % 1000

				for slot17 = 1, #lua_string_split(slot2.skipAble, ",") do
					slot19 = slot13 % 3 + (slot17 - 1) % 5 - 2
					slot20 = slot13 + (math.floor((slot17 - 1) / 5) - 1) * 3 + (slot17 - 1) % 5 - 2

					if slot12[slot17] == "1" and slot20 >= 0 and slot20 <= 5 and slot19 >= 0 and slot19 <= 2 then
						slot21 = nil

						if ((slot5 ~= true or tolua.cast(uv7:getChildByTag(3000 + slot20), "CCXMLSprite")) and tolua.cast(uv8:getChildByTag(1000 + slot20), "CCXMLSprite")) == nil or slot21:getOpacity() < 240 then
							slot22 = nil
							slot22 = (slot5 ~= true or getEnemyCardPointByPosition(slot20)) and getPlayerCardPointByPosition(slot20)
							slot23 = nil
							slot23 = (not file_exists("images/battle/effect/" .. slot2.attackEffct .. ".plist") or not file_exists("images/battle/effect/" .. slot2.attackEffct .. "_0.xml") or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot2.attackEffct), -1, CCString:create(""))) and (not uv5 or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot2.attackEffct .. "_u"), -1, CCString:create(""))) and CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot2.attackEffct .. "_d"), -1, CCString:create(""))

							slot23:retain()
							slot23:setAnchorPoint(ccp(0.5, 0))

							if slot2.attackEffctPosition == 2 then
								slot23:setPosition(ccp(slot22.x, slot22.y))

								if slot5 then
									uv7:addChild(slot23, 9999, 9182)
								else
									uv8:addChild(slot23, 9999, 9182)
								end
							else
								slot23:setPosition(ccp(slot22.x, slot22.y - uv6:getContentSize().height / 2))

								if slot5 then
									uv7:addChild(slot23, 9999, 9182)
								else
									uv8:addChild(slot23, 9999, 9182)
								end
							end

							slot23:release()

							uv4 = slot23:getKeySprie():getMyKeyFrameCount()
							uv3 = 0
							slot28 = BTAnimationEventDelegate:create()

							slot28:registerLayerEndedHandler(function (slot0, slot1)
								uv0:removeFromParentAndCleanup(true)
							end)
							slot28:registerLayerChangedHandler(function (slot0, slot1)
							end)
							slot23:setDelegate(slot28)
						end
					end
				end
			end
		end
	end

	slot5 = os.clock()
end

function flyAttackCrush(slot0)
	if file_exists("audio/effect/" .. "zhuangjitx" .. ".mp3") then
		AudioUtil.playEffect("audio/effect/" .. "zhuangjitx" .. ".mp3")
	end

	slot0:setPositionY(slot0:getPositionY() - slot0:getContentSize().height * 0.6)
	startShake()

	slot3 = BTAnimationEventDelegate:create()

	slot3:registerLayerEndedHandler(function ()
		endShake()
		showAttackerVisible()

		if uv0:getTag() == 12121 then
			updateDefendersBuff()
		end

		uv0:removeFromParentAndCleanup(true)
	end)
	slot3:registerLayerChangedHandler(function (slot0, slot1)
	end)

	slot0 = tolua.cast(slot0, "CCXMLSprite")

	slot0:setDelegate(slot3)
	slot0:setBasePoint(ccp(slot0:getPositionX(), slot0:getPositionY()))
	slot0:runXMLAnimation(CCString:create("images/battle/xml/action/T003_d2_0"))
	require("db/skill")

	if BT_Skill.getDataById(uv0.action, getAttackDressId(), getAttackTid(), getAttackTurnedId()).hitEffct ~= nil then
		slot6 = nil
		slot6 = (not file_exists("images/battle/effect/" .. slot5.hitEffct .. ".plist") or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. slot5.hitEffct), -1, CCString:create(""))) and CCLayerSprite:layerSpriteWithName(CCString:create(isDefenderEnemy == true and "images/battle/effect/" .. slot5.hitEffct .. "_u" or "images/battle/effect/" .. slot5.hitEffct .. "_d"), -1, CCString:create(""))

		slot6:retain()
		slot6:setAnchorPoint(ccp(0.5, 0.5))
		slot6:setPosition(slot0:getPositionX(), slot0:getPositionY() + slot0:getContentSize().height * 0.5)
		uv1:addChild(slot6, 99999)
		slot6:release()

		slot9 = BTAnimationEventDelegate:create()

		slot9:registerLayerEndedHandler(function (slot0, slot1)
			removeSelf(uv0)
		end)
		slot9:registerLayerChangedHandler(function (slot0, slot1)
		end)
		tolua.cast(slot6, "CCLayerSprite"):setDelegate(slot9)
	end
end

function flyAttack(slot0)
	if uv0.arrReaction == nil then
		updateDefendersBuff()

		return
	end

	slot1 = 0

	for slot5 = 1, #uv0.arrReaction do
		slot6, slot7 = nil

		for slot12 = 1, #uv1.team1.arrHero do
			if uv1.team1.arrHero[slot12].hid == uv0.arrReaction[slot5].defender then
				slot6 = tolua.cast(uv2:getChildByTag(1000 + slot13.position), "CCXMLSprite")
				slot7 = false

				break
			end
		end

		for slot12 = 1, #uv1.team2.arrHero do
			if uv1.team2.arrHero[slot12].hid == slot8 then
				slot6 = tolua.cast(uv3:getChildByTag(3000 + slot13.position), "CCXMLSprite")
				slot7 = true

				break
			end
		end

		require("db/skill")

		slot10 = BT_Skill.getDataById(uv0.action, getAttackDressId(), getAttackTid(), getAttackTurnedId())

		if slot6 ~= nil then
			slot12 = slot6:convertToWorldSpace(ccp(slot6:getContentSize().width * slot6:getScale() * 0.5, slot6:getContentSize().height * slot6:getScale() * 0.2))
			slot13 = createBattleCard(uv0.attacker)

			slot13:retain()
			slot13:setAnchorPoint(ccp(0.5, 0.5))
			slot13:setPosition(uv5:convertToNodeSpace(uv4:convertToWorldSpace(ccp(uv4:getContentSize().width * uv4:getScale() * 0.5, uv4:getContentSize().height * uv4:getScale() * 0.5))))
			slot13:setBasePoint(ccp(slot13:getPositionX(), slot13:getPositionY()))
			uv5:addChild(slot13)
			slot13:release()

			if slot5 == 1 then
				slot13:setTag(12121)
			end

			slot14 = 0.1
			slot15 = CCArray:create()

			slot15:addObject(CCMoveTo:create(slot14, uv5:convertToNodeSpace(slot12)))
			slot15:addObject(CCCallFuncN:create(flyAttackCrush))
			slot13:runAction(CCSequence:create(slot15))
			startShake()

			slot1 = slot14 < slot1 and slot1 or slot14
		end
	end

	slot3 = CCArray:create()

	slot3:addObject(CCDelayTime:create(slot1))
	slot3:addObject(CCCallFunc:create(function ()
		showDefenderEffect(nil, uv0, 1, 1)
	end))
	uv5:runAction(CCSequence:create(slot3))
end

function showFlyAttack()
	setNodeNotVisible(uv0)
	require("db/skill")

	slot1 = BT_Skill.getDataById(uv1.action, getAttackDressId(), getAttackTid(), getAttackTurnedId())
	slot2 = createBattleCard(uv1.attacker)

	slot2:setTag(4900)
	slot2:setAnchorPoint(ccp(0.5, 0.5))
	slot2:setPosition(ccp(uv0:getPositionX(), uv0:getPositionY()))
	slot2:setBasePoint(ccp(slot2:getPositionX(), slot2:getPositionY()))

	if uv2 then
		uv3:addChild(slot2, uv0:getZOrder())
	else
		uv4:addChild(slot2, uv0:getZOrder())
	end

	if uv5[uv1.attacker] and uv6[uv1.attacker] then
		BattleCardUtil.setCardHp(slot2, uv5[uv1.attacker] / uv6[uv1.attacker])
	end

	if uv7[uv1.attacker] == nil then
		uv7[uv1.attacker] = 0
	end

	BattleCardUtil.setCardAnger(slot2, uv7[uv1.attacker], uv1.attacker)
	BattleCardUtil.setCardAnger(uv0, uv7[uv1.attacker], uv1.attacker)

	slot5 = BTAnimationEventDelegate:create()

	slot5:registerLayerEndedHandler(function ()
		flyAttack(uv0 - 1)
		uv1:removeFromParentAndCleanup(true)
	end)
	slot5:registerLayerChangedHandler(function (slot0, slot1)
		if tolua.cast(slot1, "CCXMLSprite"):getIsKeyFrame() then
			showAttackEffect()
		end
	end)
	slot2:setDelegate(slot5)

	slot7 = slot2:runXMLAnimation(CCString:create("images/battle/xml/action/" .. (uv2 and "T003_u1_0" or "T003_d1_0"))) * slot2:getFpsInterval()

	if uv7[uv1.attacker] == nil then
		uv7[uv1.attacker] = 0
	end

	if uv1.rage ~= nil then
		uv7[uv1.attacker] = uv7[uv1.attacker] + tonumber(uv1.rage)
	end

	BattleCardUtil.setCardAnger(uv0, uv7[uv1.attacker], uv1.attacker)
end

function showBattleAttack()
	slot0 = os.clock()

	require("db/skill")

	if BT_Skill.getDataById(uv0.action, getAttackDressId(), getAttackTid()).functionWay == 2 then
		slot2 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. "meffect_31"), -1, CCString:create(""))

		slot2:retain()
		slot2:setPosition(uv2:convertToNodeSpace(uv1:convertToWorldSpace(ccp(uv1:getContentSize().width / 2, uv1:getContentSize().height * 0.5))))
		slot2:setAnchorPoint(ccp(0.5, 0.5))
		uv2:addChild(slot2, 9999)
		slot2:release()

		slot7 = BTAnimationEventDelegate:create()

		slot7:registerLayerEndedHandler(function (slot0, slot1)
			uv0:removeFromParentAndCleanup(true)
		end)
		slot7:registerLayerChangedHandler(function (slot0, slot1)
		end)
		slot2:setDelegate(slot7)
	end

	uv1:setVisible(false)
	setNodeNotVisible(uv1)

	slot2 = uv0.action
	slot3 = createBattleCard(uv0.attacker)

	slot3:setTag(4900)
	slot3:setAnchorPoint(ccp(0.5, 0.5))
	slot3:setPosition(ccp(uv1:getPositionX(), uv1:getPositionY()))
	slot3:setBasePoint(ccp(slot3:getPositionX(), slot3:getPositionY()))

	if uv3 then
		uv4:addChild(slot3, uv1:getZOrder())
	else
		uv5:addChild(slot3, uv1:getZOrder())
	end

	if uv6[uv0.attacker] and uv7[uv0.attacker] then
		BattleCardUtil.setCardHp(slot3, uv6[uv0.attacker] / uv7[uv0.attacker])
	end

	if uv8[uv0.attacker] == nil then
		uv8[uv0.attacker] = 0
	end

	BattleCardUtil.setCardAnger(slot3, uv8[uv0.attacker], uv0.attacker)
	BattleCardUtil.setCardAnger(uv1, uv8[uv0.attacker], uv0.attacker)

	slot6 = BTAnimationEventDelegate:create()

	slot6:registerLayerEndedHandler(function ()
		showAttackerVisible()

		if (uv0.attackEffct == nil or uv0.attackEffct == "") and (uv0.mpostionType ~= 5 or uv0.distancePath == nil) then
			if uv0.distancePath == nil then
				updateDefendersBuff()
			else
				slot0 = CCArray:create()

				slot0:addObject(CCDelayTime:create(uv1))
				slot0:addObject(CCCallFunc:create(updateDefendersBuff))
				uv2:runAction(CCSequence:create(slot0))
			end
		end

		uv3:removeFromParentAndCleanup(true)
	end)
	slot6:registerLayerChangedHandler(function (slot0, slot1)
		if tolua.cast(slot1, "CCXMLSprite"):getIsKeyFrame() then
			showAttackEffect()
		end
	end)
	slot3:setDelegate(slot6)

	if file_exists("audio/effect/" .. (slot1.actionid or "") .. ".mp3") then
		AudioUtil.playEffect("audio/effect/" .. slot1.actionid .. ".mp3")
	end

	slot7 = nil
	slot8 = ((not file_exists("images/battle/xml/action/" .. slot1.actionid .. ".xml") or slot3:runXMLAnimation(CCString:create("images/battle/xml/action/" .. slot1.actionid))) and slot3:runXMLAnimation(CCString:create("images/battle/xml/action/" .. (uv3 and slot1.actionid .. "_u_0" or slot1.actionid .. "_d_0")))) * slot3:getFpsInterval()

	if uv8[uv0.attacker] == nil then
		uv8[uv0.attacker] = 0
	end

	if uv0.rage ~= nil then
		uv8[uv0.attacker] = uv8[uv0.attacker] + tonumber(uv0.rage)
	end

	BattleCardUtil.setCardAnger(uv1, uv8[uv0.attacker], uv0.attacker)

	slot9 = os.clock()
end

function showRageEffect()
	slot0 = os.clock()

	require("db/skill")

	if BT_Skill.getDataById(uv0.action, getAttackDressId(), getAttackTid(), getAttackTurnedId()).functionWay ~= 2 then
		showBattleAttack()

		return
	end

	slot4, slot5, slot6, slot7 = nil

	if tonumber(uv0.attacker) < 10000000 then
		require("db/DB_Monsters")

		if DB_Monsters.getDataById(slot3) == nil then
			slot8 = DB_Monsters.getDataById(1002011)
		end

		require("db/DB_Monsters_tmpl")

		slot9 = DB_Monsters_tmpl.getDataById(slot8.htid)
		slot7 = slot8.htid
		slot6 = slot9.star_lv
		slot4 = slot9.rage_head_icon_id
		slot5 = slot9.body_img_id
	else
		require("script/model/hero/HeroModel")
		require("script/utils/LuaUtil")

		if HeroModel.getAllHeroes() == nil or slot8[slot3 .. ""] == nil then
			slot6 = slot3 % 6 + 1
		else
			slot9 = slot8[slot3 .. ""].htid
			slot7 = slot9

			require("db/DB_Heroes")

			slot10 = DB_Heroes.getDataById(slot9)
			slot6 = slot10.star_lv
			slot4 = slot10.rage_head_icon_id
			slot5 = slot10.body_img_id

			if m_playerCardHidMap[slot3 .. ""] ~= nil then
				slot4 = m_playerCardHidMap[slot3 .. ""].rageHead
			end
		end
	end

	slot8.turned_id = tonumber(BattleCardUtil.getBattleHeroInfo(slot3).turned_id) or 0

	if slot8.turned_id ~= 0 then
		turnedId = slot8.turned_id

		print("showRageEffect", turnedId, HeroTurnedData.getTurnDBInfoById(slot8.turned_id).rage_head_icon_id, slot3)
	end

	if slot2.icon == nil and slot2.name ~= nil and slot2.name ~= "" then
		slot10 = CCSprite:create(uv2 .. "skill_bg.png")

		slot10:setAnchorPoint(ccp(0.5, 0.5))
		slot10:setPosition(uv3:convertToNodeSpace(uv1:convertToWorldSpace(ccp(uv1:getContentSize().width * uv1:getScale() * 0.5, uv1:getContentSize().height * uv1:getScale() * 0.5))))
		uv3:addChild(slot10, 9999)

		slot11 = CCLabelTTF:create(slot2.name, g_sFontName, 30)

		slot11:setAnchorPoint(ccp(0.5, 0.5))
		slot11:setPosition(slot10:getContentSize().width * 0.5, slot10:getContentSize().height * 0.5)
		slot10:addChild(slot11)

		slot12 = CCArray:create()

		slot12:addObject(CCDelayTime:create(1.5))
		slot12:addObject(CCCallFuncN:create(removeSelf))
		slot10:runAction(CCSequence:create(slot12))
	end

	if slot2.functionWay == 2 and slot2.cooperateSkill == 1 then
		slot9 = string.split(slot2.cooperateSkillEffect, ",")
		slot11 = slot9[2]
		slot12 = slot9[3]
		slot13 = slot9[4]
		slot15 = getHeroCooperateIcon(slot3, slot9[1])
		slot16 = nil

		if not getAssistHeroInfo() then
			slot16 = getHeroCooperateIconByHtid(slot2.cooperateSkillHeroId, slot10)
		else
			slot15 = getHeroCooperateIcon(slot3, slot10)
			slot16 = getHeroCooperateIcon(slot14.hid, slot10)
		end

		uv4 = XMLSprite:create("images/battle/cooperate/effect/" .. slot10)

		uv4:setReplayTimes(1, true)
		uv4:replaceImage(slot11, "images/battle/cooperate/name/" .. slot2.icon)
		uv4:replaceImage(slot12, slot15)
		uv4:replaceImage(slot13, slot16)
		uv4:registerEndCallback(function (...)
			print("合体技怒气技能")
			showBattleAttack()
		end)
		uv4:setPosition(320, (-uv3:getPositionY() + CCDirector:sharedDirector():getWinSize().height * 0.5) / uv3:getScale())
		uv3:addChild(uv4, kCooperateEffectTag)

		return
	end

	if slot2.functionWay == 2 and slot2.icon ~= nil and slot4 ~= nil then
		if file_exists("audio/effect/" .. "nuqitouxiang" .. ".mp3") then
			AudioUtil.playEffect("audio/effect/" .. "nuqitouxiang" .. ".mp3")
		end

		slot9 = nil
		slot11 = nil

		if file_exists("images/battle/rage_head/" .. slot4) then
			tolua.cast(((not file_exists("images/battle/effect/" .. "nuqitouxiang" .. ".plist") or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. "nuqitouxiang"), -1, CCString:create(""))) and (not uv5 or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. "nuqitouxiang" .. "_u"), -1, CCString:create(""))) and CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. "nuqitouxiang" .. "_d"), -1, CCString:create(""))):getChildByTag(1003), "CCXMLSprite"):setReplaceFileName(CCString:create("images/battle/rage_head/" .. slot4))
		else
			slot10:setReplaceFileName(CCString:create("images/battle/card/blankcard.png"))

			slot12 = CCSprite:create("images/battle/rage_head/nuqitouxiang_04.png")

			slot12:setAnchorPoint(ccp(0.5, 0.5))
			slot12:setPosition(ccp(0, 0))

			slot13 = CCClippingNode:create()

			slot13:setContentSize(CCSizeMake(slot12:getContentSize().width, slot12:getContentSize().height))
			slot13:setAnchorPoint(ccp(0.5, 0.5))
			slot13:setPosition(ccp(slot12:getContentSize().width, slot12:getContentSize().height))
			slot13:setInverted(false)
			slot13:setAlphaThreshold(0.9)
			slot13:setStencil(slot12)
			slot13:setScale(2)
			slot10:addChild(slot13)

			slot11 = CCSprite:create("images/base/hero/body_img/" .. slot5)

			slot11:setAnchorPoint(ccp(0.5, 0.5))
			slot11:setPosition(ccp(0, 0))
			slot13:addChild(slot11)
			slot11:setVisible(false)
		end

		slot9:retain()
		slot9:setPosition(320, (-uv3:getPositionY() + CCDirector:sharedDirector():getWinSize().height * 0.5) / uv3:getScale())
		slot9:setAnchorPoint(ccp(0.5, 0.5))
		uv3:addChild(slot9, 9999)
		slot9:release()

		slot14 = BTAnimationEventDelegate:create()

		slot14:registerLayerEndedHandler(function (slot0, slot1)
			showBattleAttack()
			uv0:removeFromParentAndCleanup(true)
		end)
		slot14:registerLayerChangedHandler(function (slot0, slot1)
			if slot0 == 1 and uv0 ~= nil then
				uv0:setVisible(true)
			end
		end)
		slot9:setDelegate(slot14)

		slot15 = nil
		slot15 = (not file_exists("images/battle/effect/" .. "nqtxjnmz" .. ".plist") or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. "nqtxjnmz"), -1, CCString:create(""))) and (not uv5 or CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. "nqtxjnmz" .. "_u"), -1, CCString:create(""))) and CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/" .. "nqtxjnmz" .. "_d"), -1, CCString:create(""))

		tolua.cast(slot15:getChildByTag(1000), "CCXMLSprite"):setReplaceFileName(CCString:create("images/battle/rage_head/" .. slot2.icon))
		slot15:retain()
		slot15:setPosition(320, (-uv3:getPositionY() + CCDirector:sharedDirector():getWinSize().height * 0.5) / uv3:getScale())
		slot15:setAnchorPoint(ccp(0.5, 0.5))
		uv3:addChild(slot15, 9999)
		slot15:release()

		slot19 = BTAnimationEventDelegate:create()

		slot19:registerLayerEndedHandler(function (slot0, slot1)
			uv0:removeFromParentAndCleanup(true)
		end)
		slot19:registerLayerChangedHandler(function (slot0, slot1)
		end)
		slot15:setDelegate(slot19)

		if slot7 ~= nil then
			require("script/utils/SoundEffectUtil")

			if SoundEffectUtil.getHeroAudioDataByHtid(slot7) and slot20.skill_sound then
				SoundEffectUtil.stopHeroAudio()
				SoundEffectUtil.playHeroAudio(slot20.skill_sound)
			end
		end
	else
		showBattleAttack()
	end

	slot9 = os.clock()
end

function showFullSceneEffect()
	require("db/skill")

	if BT_Skill.getDataById(uv0.action, getAttackDressId(), getAttackTid(), getAttackTurnedId()).fullScreen == 0 then
		showRageEffect()
	else
		showRageEffect()
	end
end

function goToAttackLocation()
	slot0 = os.clock()

	if uv0.action == 0 then
		showNextMove()

		return
	end

	require("db/skill")

	slot7 = getAttackTurnedId
	slot2 = BT_Skill.getDataById(slot1, getAttackDressId(), getAttackTid(), slot7())

	require("script/utils/LuaUtil")

	for slot7 = 1, #uv1.team1.arrHero do
		if uv1.team1.arrHero[slot7] ~= nil and slot8.hid == uv0.attacker then
			uv2 = tolua.cast(uv3:getChildByTag(1000 + slot8.position), "CCXMLSprite")
			uv4 = false
			uv5 = slot8.position

			break
		end
	end

	for slot7 = 1, #uv1.team2.arrHero do
		if uv1.team2.arrHero[slot7] ~= nil and slot8.hid == slot3 then
			uv2 = tolua.cast(uv6:getChildByTag(3000 + slot8.position), "CCXMLSprite")
			uv4 = true
			uv5 = slot8.position

			break
		end
	end

	for slot8 = 1, #uv1.team1.arrHero do
		if uv1.team1.arrHero[slot8].hid == uv0.defender then
			uv7 = tolua.cast(uv3:getChildByTag(1000 + slot9.position), "CCXMLSprite")
			uv8 = false
			uv9 = slot9.position

			break
		end
	end

	for slot8 = 1, #uv1.team2.arrHero do
		if uv1.team2.arrHero[slot8].hid == slot4 then
			uv7 = tolua.cast(uv6:getChildByTag(3000 + slot9.position), "CCXMLSprite")
			uv8 = true
			uv9 = slot9.position

			break
		end
	end

	if uv2 == nil then
		-- Nothing
	end

	if slot2.mpostionType == 1 then
		slot8 = CCArray:create()

		slot8:addObject(CCMoveTo:create(0.1, uv2:getParent():convertToNodeSpace(uv7:convertToWorldSpace(ccp(uv7:getContentSize().width / 2, uv7:getContentSize().height * (uv8 and -0.6 or 1.6))))))
		slot8:addObject(CCCallFunc:create(showFullSceneEffect))
		uv2:runAction(CCSequence:create(slot8))
	elseif slot2.mpostionType == 2 then
		uv2:runAction(CCCallFunc:create(showFullSceneEffect))
	elseif slot2.mpostionType == 3 then
		slot7 = CCArray:create()

		slot7:addObject(CCMoveTo:create(0.1, uv2:getParent():convertToNodeSpace(ccp(CCDirector:sharedDirector():getWinSize().width / 2, CCDirector:sharedDirector():getWinSize().height / 2))))
		slot7:addObject(CCCallFunc:create(showFullSceneEffect))
		uv2:runAction(CCSequence:create(slot7))
	elseif slot2.mpostionType == 4 then
		uv2:runAction(CCCallFunc:create(showFullSceneEffect))
	elseif slot2.mpostionType == 5 then
		if uv7:getTag() % 10 > 2 then
			slot5 = (uv8 and -0.6 or 1.6) + (uv8 == true and -1.1 or 1.1)
		end

		slot8 = CCArray:create()

		slot8:addObject(CCMoveTo:create(0.1, uv2:getParent():convertToNodeSpace(uv7:convertToWorldSpace(ccp(uv7:getContentSize().width / 2, uv7:getContentSize().height * slot5)))))
		slot8:addObject(CCCallFunc:create(showFullSceneEffect))
		uv2:runAction(CCSequence:create(slot8))
	elseif slot2.mpostionType == 7 then
		showFlyAttack()
	else
		uv2:runAction(CCCallFunc:create(showFullSceneEffect))
	end

	slot5 = os.clock()
end

function beforeAttackUpdateBuff()
	for slot4 = 1, #uv1.team1.arrHero do
		if uv1.team1.arrHero[slot4] ~= nil and slot5.hid == uv0.attacker then
			uv2 = tolua.cast(uv3:getChildByTag(1000 + slot5.position), "CCXMLSprite")
			uv4 = false
			uv5 = slot5.position

			break
		end
	end

	for slot4 = 1, #uv1.team2.arrHero do
		if uv1.team2.arrHero[slot4] ~= nil and slot5.hid == slot0 then
			uv2 = tolua.cast(uv6:getChildByTag(3000 + slot5.position), "CCXMLSprite")
			uv4 = true
			uv5 = slot5.position

			break
		end
	end

	for slot5 = 1, #uv1.team1.arrHero do
		if uv1.team1.arrHero[slot5].hid == uv0.defender then
			uv7 = tolua.cast(uv3:getChildByTag(1000 + slot6.position), "CCXMLSprite")
			uv8 = false
			uv9 = slot6.position

			break
		end
	end

	for slot5 = 1, #uv1.team2.arrHero do
		if uv1.team2.arrHero[slot5].hid == slot1 then
			uv7 = tolua.cast(uv6:getChildByTag(3000 + slot6.position), "CCXMLSprite")
			uv8 = true
			uv9 = slot6.position

			break
		end
	end

	if uv0.action == 0 then
		currentRoundOver()
		updateCardBuff(slot0, uv2, 1, uv0.enBuffer, uv0.deBuffer, uv0.imBuffer, uv0.buffer, afterAttackUpdateBuff, 1)

		return
	end

	require("db/skill")

	slot8 = getAttackTurnedId
	slot3 = BT_Skill.getDataById(slot2, getAttackDressId(), getAttackTid(), slot8())

	require("script/utils/LuaUtil")

	for slot8 = 1, #uv1.team1.arrHero do
		if uv1.team1.arrHero[slot8] ~= nil and slot9.hid == uv0.attacker then
			uv2 = tolua.cast(uv3:getChildByTag(1000 + slot9.position), "CCXMLSprite")
			uv4 = false
			uv5 = slot9.position

			break
		end
	end

	for slot8 = 1, #uv1.team2.arrHero do
		if uv1.team2.arrHero[slot8] ~= nil and slot9.hid == slot4 then
			uv2 = tolua.cast(uv6:getChildByTag(3000 + slot9.position), "CCXMLSprite")
			uv4 = true
			uv5 = slot9.position

			break
		end
	end

	for slot9 = 1, #uv1.team1.arrHero do
		if uv1.team1.arrHero[slot9].hid == uv0.defender then
			uv7 = tolua.cast(uv3:getChildByTag(1000 + slot10.position), "CCXMLSprite")
			uv8 = false
			uv9 = slot10.position

			break
		end
	end

	for slot9 = 1, #uv1.team2.arrHero do
		if uv1.team2.arrHero[slot9].hid == slot5 then
			uv7 = tolua.cast(uv6:getChildByTag(3000 + slot10.position), "CCXMLSprite")
			uv8 = true
			uv9 = slot10.position

			break
		end
	end

	if uv4 then
		uv3:getParent():reorderChild(uv3, 0)

		slot9 = uv6

		uv6:getParent():reorderChild(slot9, 1)

		for slot9 = 0, 5 do
			if uv6:getChildByTag(3000 + slot9) ~= nil then
				uv6:reorderChild(uv2, 0)
			end
		end

		uv6:reorderChild(uv2, 10)
	else
		uv3:getParent():reorderChild(uv3, 1)

		slot9 = uv6

		uv6:getParent():reorderChild(slot9, 0)

		for slot9 = 0, 5 do
			if uv3:getChildByTag(1000 + slot9) ~= nil then
				uv3:reorderChild(uv2, 0)
			end
		end

		uv3:reorderChild(uv2, 10)
	end

	updateCardBuff(slot4, uv2, 1, uv0.enBuffer, uv0.deBuffer, uv0.imBuffer, uv0.buffer, goToAttackLocation, 1)
end

function initCurrentEnemy()
	require("db/DB_Army")
	require("db/DB_Team")
	uv1:setPosition(ccp(0, 0))
	initEnemyLayer(DB_Team.getDataById(DB_Army.getDataById(uv0).monster_group).monsterID)
	uv1:setPosition(ccp(0, -uv2:getPositionY() / uv2:getScale()))
	uv1:setVisible(true)
end

function showNextMove()
	slot0 = os.clock()

	SimpleAudioEngine:sharedEngine():resumeAllEffects()

	uv0 = 0

	if uv1 > 1 and not tolua.isnull(uv2) then
		if uv3 then
			uv4:reorderChild(uv2, 5 - uv2:getTag() + 2000)
		else
			uv5:reorderChild(uv2, 2)
		end
	end

	if g_system_type == kBT_PLATFORM_ANDROID then
		require("script/utils/LuaUtil")
		checkMem()
	else
		CCTextureCache:sharedTextureCache():removeUnusedTextures()
	end

	if uv6 ~= true and uv7 == true then
		require("db/DB_Army")

		slot1 = DB_Army.getDataById(uv8)

		if uv9 ~= uv1 and slot1 ~= nil and slot1.dialog_ids_fighting ~= nil and uv10 ~= nil and uv11.battle[uv1] ~= nil and uv10.round ~= uv11.battle[uv1].round then
			for slot7 = 1, #lua_string_split(slot1.dialog_ids_fighting, ",") do
				if tonumber(lua_string_split(slot3[slot7], "|")[1]) ~= nil and uv10.round == slot8 and tonumber(lua_string_split(slot3[slot7], "|")[2]) ~= nil then
					doTalk(slot9, showNextMove)

					uv9 = uv1

					return
				end
			end
		end
	end

	uv9 = -1

	require("script/utils/LuaUtil")

	uv12 = 0

	if uv1 > #uv11.battle and uv13 ~= "E" and uv13 ~= "F" then
		endShake()

		if uv6 == true then
			CCDirector:sharedDirector():getScheduler():setTimeScale(1)

			if uv14 ~= nil then
				uv15:addChild(uv14, 99999)
				uv14:release()
				uv16:setVisible(false)
			else
				closeLayer()
			end

			return
		end

		require("db/DB_Army")

		if DB_Army.getDataById(uv8).dialog_id_over ~= nil and uv17 == false and uv7 == true then
			doTalk(tonumber(slot1.dialog_id_over), showNextMove)

			uv17 = true

			return
		end

		uv17 = false
		uv18 = uv19.soul == nil and uv18 or uv18 + tonumber(uv19.soul)

		if uv19.item ~= nil and #uv19.item > 0 then
			for slot5 = 1, #uv19.item do
				uv20[#uv20 + 1] = uv19.item[slot5]
			end
		end

		if uv19.hero ~= nil and #uv19.hero > 0 then
			for slot5 = 1, #uv19.hero do
				uv21[#uv21 + 1] = uv19.hero[slot5]
			end
		end

		uv22 = uv19.silver == nil and uv22 or uv22 + tonumber(uv19.silver)
		uv23 = uv19.exp == nil and uv23 or uv23 + tonumber(uv19.exp)
		uv24 = uv24 + #uv20

		if uv24 ~= nil then
			uv25:setString("" .. uv24)
		end

		uv26:setString("" .. uv18)
		uv27:setString("" .. uv22)

		uv1 = 1
		slot2 = CCArray:create()

		slot2:addObject(CCDelayTime:create(0.5))
		slot2:addObject(CCCallFunc:create(showNextArmy))
		uv15:runAction(CCSequence:create(slot2))

		return
	elseif uv1 > #uv11.battle and (uv13 == "E" or uv13 == "F") then
		CCDirector:sharedDirector():getScheduler():setTimeScale(1)
		endShake()

		uv1 = 1

		if uv6 == true then
			if uv14 ~= nil then
				uv15:addChild(uv14, 99999)
				uv14:release()
				uv16:setVisible(false)
			else
				closeLayer()
			end

			return
		end

		uv18 = uv19.soul == nil and uv18 or uv18 + tonumber(uv19.soul)

		if uv19.item ~= nil and #uv19.item > 0 then
			for slot4 = 1, #uv19.item do
				uv20[#uv20 + 1] = uv19.item[slot4]
			end
		end

		uv22 = uv19.silver == nil and uv22 or uv22 + tonumber(uv19.silver)
		uv23 = uv19.exp == nil and uv23 or uv23 + tonumber(uv19.exp)

		if tonumber(uv25:getString()) ~= nil then
			uv25:setString("" .. slot1 + #uv20)
		end

		uv26:setString("" .. uv18)
		uv27:setString("" .. uv22)
		require("script/battle/BattleReportLayer")
		uv15:addChild(BattleReportLayer.getBattleReportLayer(false, uv28, uv29, uv30, uv18, uv20, uv22, uv23, uv31, false), 99999)
		uv16:setVisible(false)

		return
	end

	hiddenHeroMask()

	uv10 = uv11.battle[uv1]
	uv1 = uv1 + 1

	uv32:setString(uv10.round .. "/30")

	uv33 = false
	slot1 = uv10.attacker

	if uv10.action ~= 0 then
		require("db/skill")

		if BT_Skill.getDataById(slot2, getAttackDressId(), getAttackTid(), getAttackTurnedId()).functionWay == 2 and slot3.cooperateSkill == 1 then
			showHeroMask()
		end
	end

	if tonumber(slot1) > 200 then
		beforeAttackUpdateBuff()
	else
		showWarCarAction(function (...)
			updateDefendersBuff()
		end)
	end

	print("battleIndex", uv1)
	print_t(uv34)
end

function clearEnemyLayer()
	if uv0 ~= NULL then
		uv0:removeAllChildrenWithCleanup(true)
	end
end

function initEnemyLayer(slot0)
	clearEnemyLayer()

	slot2 = 0.28 * uv0:getContentSize().width
	slot3 = CCDirector:sharedDirector():getWinSize().height / uv0:getScale() - uv0:getContentSize().width * 0.2 * 0.7
	slot4 = lua_string_split(slot0, ",")

	for slot8 = 0, 5 do
		if slot8 + 1 <= #slot4 then
			if slot4[slot8 + 1] ~= "0" then
				slot9 = createBattleCard(slot4[slot8 + 1])

				slot9:setTag(3000 + slot8)
				slot9:setAnchorPoint(ccp(0.5, 0.5))
				slot9:setPosition(getEnemyCardPointByPosition(slot8))
				slot9:setBasePoint(ccp(slot9:getPositionX(), slot9:getPositionY()))
				uv1:addChild(slot9, 5 - slot8)
			end
		end
	end
end

function layerTouch(slot0, slot1, slot2)
	if slot0 == "began" then
		if uv0 == true then
			uv0 = false
		else
			uv0 = true
		end

		BattleCardUtil.setNameVisible(uv0)

		return true
	elseif slot0 == "moved" then
		return true
	else
		return true
	end
end

function closeLayer()
	if isBattleOnGoing == false and uv0 == nil then
		return
	end

	if uv1 ~= nil then
		uv1:removeFromParentAndCleanup(true)
	end

	uv1 = nil

	AudioUtil.playMainBgm()
	endShake()

	if uv2 ~= nil then
		uv2:removeFromParentAndCleanup(true)
	end

	if uv3 ~= nil then
		slot0 = true

		if uv4 == "E" or uv4 == "F" then
			slot0 = false
		end

		uv3(uv5, slot0, uv6, uv7)
	end

	CCNotificationCenter:sharedNotificationCenter():postNotification("NC_FightOver")

	uv3 = nil

	if g_network_status == g_network_connected and (uv8 == nil or uv8 == false) then
		if uv9 == 1 then
			RequestCenter.ncopy_leaveBaseLevel(nil, Network.argsHandler(uv10, uv11, uv12))
		elseif uv9 == 2 then
			RequestCenter.ecopy_leaveCopy(nil, Network.argsHandler(uv10))
		elseif uv9 == 4 then
			RequestCenter.tower_leaveLevel(nil, Network.argsHandler(uv10))
		elseif uv9 == 5 then
			RequestCenter.tower_leaveLevel(nil, Network.argsHandler(uv10))
		elseif uv9 == 6 then
			RequestCenter.Hcopy_leaveBaseLevel(nil, Network.argsHandler(uv10, uv11, uv12))
		else
			RequestCenter.acopy_leaveBaseLevel(nil, Network.argsHandler(uv10, uv12))
		end
	end

	uv8 = nil
	uv2 = nil
	uv13 = nil

	CCDirector:sharedDirector():getRunningScene():removeChild(uv0, true)

	uv0 = nil

	CCDirector:sharedDirector():getScheduler():setTimeScale(1)

	if uv14 ~= nil then
		slot2 = uv14
		slot4 = slot2

		for slot4 = 1, slot2.count(slot4) do
			if tolua.cast(uv14:objectAtIndex(slot4 - 1), "CCNode") ~= nil then
				slot5:setVisible(true)
			end
		end

		uv14:removeAllObjects()
		uv14:release()

		uv14 = nil
	end

	isBattleOnGoing = false

	if g_system_type == kBT_PLATFORM_ANDROID then
		require("script/utils/LuaUtil")
		checkMem()
	else
		CCTextureCache:sharedTextureCache():removeUnusedTextures()
	end

	slot1 = true

	if uv4 == "E" or uv4 == "F" then
		slot1 = false
	end

	require("script/ui/login/LoginScene")
	LoginScene.setBattleStatus(false)

	uv15 = false

	collectgarbage("collect", 100)
end

function getTowerInfoCallback(slot0, slot1, slot2)
	if slot1.err == "ok" and not table.isEmpty(slot1.ret) then
		TowerCache.setTowerInfo(slot1.ret)
	end
end

function autoFightClick()
	uv0 = uv0 == false and true or false

	if tolua.cast(uv1:getChildByTag(110), "CCLabelTTF") ~= nil then
		slot1:setString(uv0 == true and GetLocalizeStringBy("key_1712") or GetLocalizeStringBy("key_2379"))
	end
end

function canSkipBattle(...)
	require("db/DB_Vip")
	require("db/DB_Normal_config")
	require("script/model/user/UserModel")

	slot0 = tonumber(UserModel.getVipLevel())
	slot1 = UserModel.getHeroLevel()
	slot2 = DB_Vip.getDataById(tostring(vipLevel))
	slot3 = DB_Normal_config.getDataById("1")
	slot4 = 0
	slot5 = 0
	slot6, slot7 = nil

	if uv0 == kNormalCopy then
		slot8 = 1

		for slot12, slot13 in pairs(DB_Vip.Vip) do
			if tonumber(DB_Vip.getDataById(tostring(slot8)).isSkipFight) ~= 0 then
				slot4 = tonumber(slot14.level)
				slot5 = tonumber(slot14.isSkipFight)

				break
			end

			slot8 = slot8 + 1
		end

		slot6 = "VIP" .. slot4 .. GetLocalizeStringBy("key_1181") .. slot5 .. GetLocalizeStringBy("key_2067")

		if slot5 <= slot1 and slot4 <= slot0 then
			slot7 = true
		else
			AnimationTip.showTip(slot6)

			slot7 = false
		end
	elseif uv0 == kEliteCopy then
		slot8 = string.split(slot3.eliteisSkipFight, "|")
		slot5 = tonumber(slot8[2])
		slot6 = "VIP" .. tonumber(slot8[1]) .. GetLocalizeStringBy("lcy_50107") .. slot5 .. GetLocalizeStringBy("lcy_50101")

		if slot5 <= slot1 or slot4 <= slot0 then
			slot7 = true
		else
			AnimationTip.showTip(slot6)

			slot7 = false
		end
	elseif uv0 == kActivityCopy then
		slot8 = string.split(slot3.activitycopyisSkipFight, "|")
		slot5 = tonumber(slot8[2])
		slot6 = "VIP" .. tonumber(slot8[1]) .. GetLocalizeStringBy("lcy_50107") .. slot5 .. GetLocalizeStringBy("lcy_50101")

		if slot5 <= slot1 or slot4 <= slot0 then
			slot7 = true
		else
			AnimationTip.showTip(slot6)

			slot7 = false
		end
	elseif uv0 == kTowerCopy then
		slot8 = string.split(slot3.TesttowerisSkipFight, "|")
		slot5 = tonumber(slot8[2])
		slot6 = "VIP" .. tonumber(slot8[1]) .. GetLocalizeStringBy("lcy_50107") .. slot5 .. GetLocalizeStringBy("lcy_50101")

		if slot5 <= slot1 or slot4 <= slot0 then
			slot7 = true
		else
			AnimationTip.showTip(slot6)

			slot7 = false
		end
	elseif uv0 == kMysicalFloorCopy then
		slot8 = string.split(slot3.MysicalTowerisSkipFight, "|")
		slot5 = tonumber(slot8[2])
		slot6 = "VIP" .. tonumber(slot8[1]) .. GetLocalizeStringBy("lcy_50107") .. slot5 .. GetLocalizeStringBy("lcy_50101")

		if slot5 <= slot1 or slot4 <= slot0 then
			slot7 = true
		else
			AnimationTip.showTip(slot6)

			slot7 = false
		end
	elseif uv0 == kHeroCopy then
		slot8 = string.split(slot3.GeneralsbiographyisSkipFight, "|")
		slot5 = tonumber(slot8[2])
		slot6 = "VIP" .. tonumber(slot8[1]) .. GetLocalizeStringBy("lcy_50107") .. slot5 .. GetLocalizeStringBy("lcy_50101")

		if slot5 <= slot1 or slot4 <= slot0 then
			slot7 = true
		else
			AnimationTip.showTip(slot6)

			slot7 = false
		end
	else
		slot7 = true
	end

	return slot7
end

function skipClick(slot0, slot1)
	if uv0 == false then
		return
	end

	if uv1 == true and canSkipBattle() == false then
		return
	end

	if uv2 == false then
		require("script/ui/tip/AnimationTip")
		AnimationTip.showTip(GetLocalizeStringBy("key_1879"))

		return
	end

	for slot5, slot6 in pairs(uv3) do
		if tolua.cast(slot6, "CCNode") then
			slot7:cleanup()
			slot7:removeFromParentAndCleanup(true)

			uv3[slot5] = nil
		end
	end

	if uv4 then
		removeWarCarMask()
	end

	if uv5 then
		uv5 = tolua.cast(uv5, "CCNode")

		if uv5 then
			uv5:removeFromParentAndCleanup(true)
		end
	end

	tolua.cast(slot1, "CCNode"):setVisible(false)
	endShake()

	uv2 = false

	uv6:cleanup()

	slot2 = uv6:getChildren()
	slot6 = slot2

	for slot6 = 0, slot2.count(slot6) - 1 do
		slot7 = tolua.cast(slot2:objectAtIndex(slot6), "CCNode")

		slot7:cleanup()
		slot7:setVisible(true)

		if slot7:getTag() ~= 1188 and slot7:getTag() ~= 1177 then
			if slot7:getTag() ~= 2121 then
				slot7:setVisible(false)
			end
		end
	end

	if uv7 ~= nil then
		slot3 = uv7:getChildren()
		slot7 = slot3

		for slot7 = 0, slot3.count(slot7) - 1 do
			slot8 = tolua.cast(slot3:objectAtIndex(slot7), "CCNode")

			slot8:cleanup()
			slot8:setVisible(true)

			if slot8:getTag() > 3005 or slot8:getTag() < 3000 then
				slot8:setVisible(false)
			else
				slot8:setVisible(true)
				slot8:setPosition(getEnemyCardPointByPosition(slot8:getTag() - 3000))
			end
		end
	end

	if uv8 ~= nil then
		slot3 = uv8:getChildren()
		slot7 = slot3

		for slot7 = 0, slot3.count(slot7) - 1 do
			slot8 = tolua.cast(slot3:objectAtIndex(slot7), "CCNode")

			slot8:cleanup()
			slot8:setVisible(true)

			if slot8:getTag() <= 1005 and slot8:getTag() >= 1000 then
				slot8:setVisible(true)
				slot8:setPosition(getPlayerCardPointByPosition(slot8:getTag() % 1000))
			else
				slot8:setVisible(false)
			end
		end
	end

	uv9 = uv10.soul == nil and uv9 or uv9 + tonumber(uv10.soul)

	if uv10.item ~= nil and #uv10.item > 0 then
		for slot6 = 1, #uv10.item do
			uv11[#uv11 + 1] = uv10.item[slot6]
		end
	end

	if uv10.hero ~= nil and #uv10.hero > 0 then
		for slot6 = 1, #uv10.hero do
			uv12[#uv12 + 1] = uv10.hero[slot6]
		end
	end

	uv13 = uv10.silver == nil and uv13 or uv13 + tonumber(uv10.silver)
	uv14 = uv10.exp == nil and uv14 or uv14 + tonumber(uv10.exp)
	uv15 = uv15 + #uv11

	if uv15 ~= nil then
		uv16:setString("" .. uv15)
	end

	uv17:setString("" .. uv9)
	uv18:setString("" .. uv13)

	slot3 = nil

	if uv19 == nil then
		uv19 = false
	end

	if uv19 == false and (uv20 == "E" or uv20 == "F") then
		function slot3()
			require("script/battle/BattleReportLayer")
			uv8:addChild(BattleReportLayer.getBattleReportLayer(false, uv0, uv1, uv2, uv3, uv4, uv5, uv6, uv7, false), 99999)
			uv9:setVisible(false)
		end
	elseif uv19 == false then
		function slot3()
			showNextArmy()
		end
	else
		CCDirector:sharedDirector():getScheduler():setTimeScale(1)

		function slot3()
			if uv0 ~= nil then
				if tolua.cast(uv0:getParent(), "CCNode") == null then
					CCDirector:sharedDirector():getScheduler():setTimeScale(1)
					uv1:addChild(uv0, 99999)
					uv0:release()
					uv2:setVisible(false)
				end
			else
				closeLayer()
			end
		end
	end

	slot4 = {}

	if uv28 - 1 < 1 then
		slot5 = 1
	end

	slot6 = {}

	while slot5 <= #uv29.battle do
		if uv29.battle[slot5].arrReaction ~= nil then
			for slot11 = 1, #slot7.arrReaction do
				if slot7.arrReaction[slot11].mandown == true then
					slot12 = false

					for slot16 = 1, #slot4 do
						if tonumber(slot7.arrReaction[slot11].defender) == slot4[slot16] then
							slot12 = true

							break
						end
					end

					if slot12 == false then
						slot4[#slot4 + 1] = tonumber(slot7.arrReaction[slot11].defender)
					end
				end

				if slot7.arrReaction[slot11].arrDamage ~= nil then
					slot12 = tonumber(slot7.arrReaction[slot11].defender)

					for slot16 = 1, #slot7.arrReaction[slot11].arrDamage do
						if slot12 ~= nil and tonumber(slot7.arrReaction[slot11].arrDamage[slot16].damageValue) ~= nil then
							if slot6[slot12] == nil then
								slot6[slot12] = 0
							end

							slot6[slot12] = slot6[slot12] + tonumber(slot7.arrReaction[slot11].arrDamage[slot16].damageValue)
							uv30[slot12] = uv30[slot12] - tonumber(slot7.arrReaction[slot11].arrDamage[slot16].damageValue)
						end
					end
				end

				if slot7.arrReaction[slot11].buffer ~= nil then
					slot12 = tonumber(slot7.arrReaction[slot11].defender)

					for slot16 = 1, #slot7.arrReaction[slot11].buffer do
						if slot12 ~= nil and tonumber(slot7.arrReaction[slot11].buffer[slot16].type) == 9 then
							if slot6[slot12] == nil then
								slot6[slot12] = 0
							end

							slot6[slot12] = slot6[slot12] + tonumber(slot7.arrReaction[slot11].buffer[slot16].data)
							uv30[slot12] = uv30[slot12] + tonumber(slot7.arrReaction[slot11].buffer[slot16].data)
						end
					end
				end
			end
		end

		if slot7.arrChild ~= nil then
			for slot11 = 1, #slot7.arrChild do
				if slot7.arrChild[slot11].arrReaction ~= nil then
					for slot15 = 1, #slot7.arrChild[slot11].arrReaction do
						if slot7.arrChild[slot11].arrReaction[slot15].mandown == true then
							slot16 = false

							for slot20 = 1, #slot4 do
								if tonumber(slot7.arrChild[slot11].arrReaction[slot15].defender) == slot4[slot20] then
									slot16 = true

									break
								end
							end

							if slot16 == false then
								slot4[#slot4 + 1] = tonumber(slot7.arrChild[slot11].arrReaction[slot15].defender)
							end
						end

						if slot7.arrChild[slot11].arrReaction[slot15].arrDamage ~= nil then
							slot16 = tonumber(slot7.arrChild[slot11].arrReaction[slot15].defender)

							for slot20 = 1, #slot7.arrChild[slot11].arrReaction[slot15].arrDamage do
								if slot16 ~= nil and tonumber(slot7.arrChild[slot11].arrReaction[slot15].arrDamage[slot20].damageValue) ~= nil then
									if slot6[slot16] == nil then
										slot6[slot16] = 0
									end

									slot6[slot16] = slot6[slot16] + tonumber(slot7.arrChild[slot11].arrReaction[slot15].arrDamage[slot20].damageValue)
									uv30[slot16] = uv30[slot16] - tonumber(slot7.arrChild[slot11].arrReaction[slot15].arrDamage[slot20].damageValue)
								end
							end
						end

						if slot7.arrChild[slot11].arrReaction[slot15].buffer ~= nil then
							slot16 = tonumber(slot7.arrChild[slot11].arrReaction[slot15].defender)

							for slot20 = 1, #slot7.arrChild[slot11].arrReaction[slot15].buffer do
								if slot16 ~= nil and tonumber(slot7.arrChild[slot11].arrReaction[slot15].buffer[slot20].type) == 9 then
									if slot6[slot16] == nil then
										slot6[slot16] = 0
									end

									slot6[slot16] = slot6[slot16] + tonumber(slot7.arrChild[slot11].arrReaction[slot15].buffer[slot20].data)
									uv30[slot16] = uv30[slot16] + tonumber(slot7.arrChild[slot11].arrReaction[slot15].buffer[slot20].data)
								end
							end
						end
					end
				end
			end
		end

		if slot7.mandown == true then
			slot8 = false

			for slot12 = 1, #slot4 do
				if tonumber(slot7.attacker) == slot4[slot12] then
					slot8 = true

					break
				end
			end

			if slot8 == false then
				slot4[#slot4 + 1] = tonumber(slot7.attacker)
			end
		end

		slot5 = slot5 + 1
	end

	if #slot4 == 0 then
		function ()
			if uv0 == true then
				slot0 = CCArray:create()

				slot0:addObject(CCDelayTime:create(1))
				slot0:addObject(CCCallFunc:create(uv1))
				uv2:runAction(CCSequence:create(slot0))

				return
			end

			require("db/DB_Stronghold")

			slot0 = DB_Stronghold.getDataById(uv3)
			slot1 = nil
			slot1 = uv4 == 1 and "simple" or uv4 == 2 and "normal" or uv4 == 3 and "hard" or "simple"
			slot2 = nil

			if lua_string_split((uv4 ~= 0 or slot0["npc_army_ids_" .. slot1]) and slot0["army_ids_" .. slot1], ",")[uv5 + 1] == nil then
				slot4 = CCArray:create()

				slot4:addObject(CCDelayTime:create(1))
				slot4:addObject(CCCallFunc:create(uv1))
				uv2:runAction(CCSequence:create(slot4))
			else
				uv1()
			end
		end()
	end

	slot8 = 0

	for slot13 = 1, #uv29.team2.arrHero do
		slot14 = slot9[slot13]
		slot15 = false

		for slot19 = 1, #slot4 do
			if tonumber(slot14.hid) == slot4[slot19] then
				slot15 = true

				break
			end
		end

		if uv30[tonumber(slot14.hid)] and uv32[tonumber(slot14.hid)] then
			BattleCardUtil.setCardHp(uv7:getChildByTag(3000 + tonumber(slot14.position)), uv30[tonumber(slot14.hid)] / uv32[tonumber(slot14.hid)])
		end

		if slot6[tonumber(slot14.hid)] ~= nil then
			showCardNumber(slot16, 0 - slot6[tonumber(slot14.hid)], 0)
		end

		if slot15 == true and slot14.position ~= nil and uv7:getChildByTag(3000 + tonumber(slot14.position)) ~= nil then
			slot16 = tolua.cast(slot16, "CCXMLSprite")

			slot16:setOpacity(0)
			slot16:removeChildByTag(BattleLayer.kHeroCooperateIconTag, true)
			slot16:removeChildByTag(BattleCardUtil.kCooperateIconTag, true)

			slot17 = createBattleCard(tonumber(slot14.hid))

			slot17:setPosition(slot16:getPositionX(), slot16:getPositionY())
			slot17:setBasePoint(ccp(slot17:getPositionX(), slot17:getPositionY()))
			BattleCardUtil.setCardHp(slot17, 0)

			slot20 = BTAnimationEventDelegate:create()

			slot20:registerLayerEndedHandler(function (slot0, slot1)
				uv0 = uv0 + 1

				if uv0 >= #uv1 then
					uv2()
				end

				uv3:removeFromParentAndCleanup(true)
			end)
			slot20:registerLayerChangedHandler(function (slot0, slot1)
			end)
			slot17:setDelegate(slot20)
			slot17:runXMLAnimation(CCString:create("images/battle/xml/action/T007_0"))
			slot16:getParent():addChild(slot17, slot16:getZOrder())
		end
	end

	for slot14 = 1, #uv29.team1.arrHero do
		slot15 = slot10[slot14]
		slot16 = false

		for slot20 = 1, #slot4 do
			if tonumber(slot15.hid) == slot4[slot20] then
				slot16 = true

				break
			end
		end

		if uv30[tonumber(slot15.hid)] and uv32[tonumber(slot15.hid)] then
			BattleCardUtil.setCardHp(uv8:getChildByTag(1000 + tonumber(slot15.position)), uv30[tonumber(slot15.hid)] / uv32[tonumber(slot15.hid)])
		end

		if slot6[tonumber(slot15.hid)] ~= nil then
			showCardNumber(slot17, 0 - slot6[tonumber(slot15.hid)], 0)
		end

		if slot16 == true and slot15.position ~= nil and uv8:getChildByTag(1000 + tonumber(slot15.position)) ~= nil then
			slot17 = tolua.cast(slot17, "CCXMLSprite")

			slot17:setOpacity(0)
			slot17:removeChildByTag(BattleLayer.kHeroCooperateIconTag, true)
			slot17:removeChildByTag(BattleCardUtil.kCooperateIconTag, true)

			slot18 = createBattleCard(tonumber(slot15.hid))

			slot18:setPosition(slot17:getPositionX(), slot17:getPositionY())
			slot18:setBasePoint(ccp(slot18:getPositionX(), slot18:getPositionY()))
			BattleCardUtil.setCardHp(slot18, 0)

			slot21 = BTAnimationEventDelegate:create()

			slot21:registerLayerEndedHandler(function (slot0, slot1)
				uv0 = uv0 + 1

				if uv0 >= #uv1 then
					uv2()
				end

				uv3:removeFromParentAndCleanup(true)
			end)
			slot21:registerLayerChangedHandler(function (slot0, slot1)
			end)
			slot18:setDelegate(slot21)
			slot18:runXMLAnimation(CCString:create("images/battle/xml/action/T007_0"))
			slot17:getParent():addChild(slot18, slot17:getZOrder())
		end
	end

	for slot14, slot15 in pairs(slot4) do
		table.insert(uv33, slot15)
	end
end

function speedClick1()
	require("script/model/user/UserModel")

	if UserModel.getHeroLevel() == nil or tonumber(UserModel.getHeroLevel()) < uv0 then
		require("script/ui/tip/AnimationTip")
		AnimationTip.showTip(GetLocalizeStringBy("key_2997") .. uv0 .. GetLocalizeStringBy("key_2293"))

		return
	end

	uv1:setVisible(false)
	uv2:setVisible(true)
	battleSpeedButton3:setVisible(false)

	uv3 = 2

	CCDirector:sharedDirector():getScheduler():setTimeScale(uv3)
	CCUserDefault:sharedUserDefault():setIntegerForKey("battle_speed_" .. uv4 .. "_" .. uv5, uv3)
	CCUserDefault:sharedUserDefault():flush()
end

function speedClick2()
	require("script/model/user/UserModel")

	if UserModel.getHeroLevel() == nil or tonumber(UserModel.getHeroLevel()) < uv0 then
		require("script/ui/tip/AnimationTip")
		AnimationTip.showTip(GetLocalizeStringBy("key_2997") .. uv0 .. GetLocalizeStringBy("key_2462"))
		uv1:setVisible(false)
		uv2:setVisible(true)
		battleSpeedButton3:setVisible(false)

		uv3 = 1

		CCDirector:sharedDirector():getScheduler():setTimeScale(uv3)

		return
	end

	uv1:setVisible(false)
	uv2:setVisible(false)
	battleSpeedButton3:setVisible(true)

	uv3 = 3

	CCDirector:sharedDirector():getScheduler():setTimeScale(uv3)
	CCUserDefault:sharedUserDefault():setIntegerForKey("battle_speed_" .. uv4 .. "_" .. uv5, uv3)
	CCUserDefault:sharedUserDefault():flush()
end

function speedClick3()
	uv0:setVisible(false)
	uv1:setVisible(true)
	battleSpeedButton3:setVisible(false)

	uv2 = 1

	CCDirector:sharedDirector():getScheduler():setTimeScale(uv2)
	CCUserDefault:sharedUserDefault():setIntegerForKey("battle_speed_" .. uv3 .. "_" .. uv4, uv2)
	CCUserDefault:sharedUserDefault():flush()
end

function doBattleClick(slot0)
	if slot0 == nil or slot0 == -1 then
		slot0 = true
	end

	if slot0 == true and file_exists("audio/effect/" .. "start_fight" .. ".mp3") then
		AudioUtil.playEffect("audio/effect/" .. "start_fight" .. ".mp3")
	end

	if tonumber(DB_Army.getDataById(uv0).type) == 2 then
		doBattleNpc()
	else
		doBattle()
	end
end

function initBackground(slot0, slot1)
	slot3 = MoveDistence * (slot1 == nil and 0 or 0 - 1) * CCDirector:sharedDirector():getWinSize().width / 640

	if slot0 == nil then
		-- Nothing
	end

	slot4 = CCTexture2D:defaultAlphaPixelFormat()

	CCTexture2D:setDefaultAlphaPixelFormat(kCCTexture2DPixelFormat_RGB565)

	if uv0 == nil then
		if file_exists(uv1 .. "bg/" .. string.sub(slot0, 1, string.len(slot0) - 4) .. "_0" .. string.sub(slot0, string.len(slot0) - 3, string.len(slot0))) then
			uv0 = CCSprite:create(uv1 .. "bg/" .. string.sub(slot0, 1, string.len(slot0) - 4) .. "_0" .. string.sub(slot0, string.len(slot0) - 3, string.len(slot0)))
		else
			uv0 = CCSprite:create(uv1 .. "bg/" .. string.sub(slot0, 1, string.len(slot0) - 4) .. "_0.webp")
		end

		if uv0 ~= nil then
			uv0:setAnchorPoint(ccp(0, 0))
			uv0:setPosition(ccp(0, -slot3))
			uv0:setScale(slot2.width / uv0:getContentSize().width)

			slot5 = nil
			slot5 = (not file_exists(uv1 .. "bg/" .. string.sub(slot0, 1, string.len(slot0) - 4) .. "_1" .. string.sub(slot0, string.len(slot0) - 3, string.len(slot0))) or CCSprite:create(uv1 .. "bg/" .. string.sub(slot0, 1, string.len(slot0) - 4) .. "_1" .. string.sub(slot0, string.len(slot0) - 3, string.len(slot0)))) and CCSprite:create(uv1 .. "bg/" .. string.sub(slot0, 1, string.len(slot0) - 4) .. "_1.webp")

			slot5:setPosition(0, uv0:getContentSize().height)
			slot5:setAnchorPoint(ccp(0, 0))
			uv0:addChild(slot5, -1, 2121)
		end
	else
		slot5 = nil

		if ((not file_exists(uv1 .. "bg/" .. string.sub(slot0, 1, string.len(slot0) - 4) .. "_0" .. string.sub(slot0, string.len(slot0) - 3, string.len(slot0))) or CCTextureCache:sharedTextureCache():addImage(uv1 .. "bg/" .. string.sub(slot0, 1, string.len(slot0) - 4) .. "_0" .. string.sub(slot0, string.len(slot0) - 3, string.len(slot0)))) and CCTextureCache:sharedTextureCache():addImage(uv1 .. "bg/" .. string.sub(slot0, 1, string.len(slot0) - 4) .. "_0.webp")) ~= nil then
			uv0:setTexture(slot5)
			uv0:setTextureRect(CCRectMake(0, 0, slot5:getContentSize().width, slot5:getContentSize().height))
			uv0:removeChildByTag(2121, true)

			slot6 = nil

			if ((not file_exists(uv1 .. "bg/" .. string.sub(slot0, 1, string.len(slot0) - 4) .. "_1" .. string.sub(slot0, string.len(slot0) - 3, string.len(slot0))) or CCSprite:create(uv1 .. "bg/" .. string.sub(slot0, 1, string.len(slot0) - 4) .. "_1" .. string.sub(slot0, string.len(slot0) - 3, string.len(slot0)))) and CCSprite:create(uv1 .. "bg/" .. string.sub(slot0, 1, string.len(slot0) - 4) .. "_1.webp")) ~= nil then
				slot6:setPosition(0, uv0:getContentSize().height)
				slot6:setAnchorPoint(ccp(0, 0))
				uv0:addChild(slot6, -1, 2121)
			end
		end
	end

	CCTexture2D:setDefaultAlphaPixelFormat(slot4)
end

function setPlayerCardsBack()
	slot0 = uv0:getContentSize().width * 0.2

	for slot4 = 0, 5 do
		if tolua.cast(uv1:getChildByTag(1000 + slot4), "CCNode") ~= nil then
			slot5:setPosition(getPlayerCardPointByPosition(slot4))
			slot5:setVisible(true)
		end
	end

	if uv2 > 1 then
		require("db/DB_Stronghold")

		slot1 = DB_Stronghold.getDataById(uv3)
		slot2 = nil
		slot2 = uv4 == 1 and "simple" or uv4 == 2 and "normal" or uv4 == 3 and "hard" or "simple"
		slot3 = nil

		require("db/DB_Army")

		if DB_Army.getDataById(lua_string_split((uv4 ~= 0 or slot1["npc_army_ids_" .. slot2]) and slot1["army_ids_" .. slot2], ",")[uv2 - 1]).monster_group_npc ~= nil then
			require("db/DB_Team")

			for slot11 = 0, 5 do
				if slot11 + 1 > #lua_string_split(DB_Team.getDataById(slot5.monster_group_npc).monsterID, ",") then
					if uv1:getChildByTag(1000 + slot11) ~= nil then
						slot12:setVisible(false)
					end
				elseif tonumber(slot7[slot11 + 1]) == 1 then
					-- Nothing
				elseif uv5["" .. slot11] ~= 0 and uv5["" .. slot11] ~= nil then
					slot13 = tonumber(uv5["" .. slot11])
					slot14 = {}

					if tonumber(slot7[slot11 + 1]) ~= 0 then
						require("db/DB_Monsters")
						require("db/DB_Monsters_tmpl")

						slot14 = DB_Monsters_tmpl.getDataById(DB_Monsters.getDataById(slot12).htid)
					end

					require("db/DB_Monsters")
					require("db/DB_Monsters_tmpl")

					if slot14.action_module_id ~= DB_Monsters_tmpl.getDataById(DB_Monsters.getDataById(slot13).htid).action_module_id and uv1:getChildByTag(1000 + slot11) ~= nil then
						slot17:setVisible(false)
					end
				end
			end
		end
	end
end

function initPlayerCards()
	uv0 = CCLayer:create()

	uv0:setPosition(ccp(0, -uv1:getPositionY() / uv1:getScale()))
	uv0:setAnchorPoint(ccp(0, 0))

	slot3 = uv0

	uv1:addChild(slot3, 0, 1177)

	for slot3 = 0, 5 do
		slot4 = CCSprite:create(uv2 .. "card/card_1.jpg")

		slot4:setAnchorPoint(ccp(0.5, 0.5))
		uv0:addChild(slot4)
	end

	setPlayerCardsBack()
end

function move0()
	uv0:setVisible(false)
	clearEnemyLayer()
	initCurrentEnemy()
	uv1:setPosition(ccp(0, MoveDistence - uv2:getPositionY() / uv2:getScale()))
	uv1:setVisible(true)

	slot0 = 2.5

	uv2:runAction(CCMoveBy:create(slot0, ccp(0, -MoveDistence * uv2:getScale())))

	slot1 = CCArray:create()

	slot1:addObject(CCMoveBy:create(slot0, ccp(0, MoveDistence)))
	slot1:addObject(CCCallFunc:create(setPlayerCardsBack))
	slot1:addObject(CCCallFunc:create(showTitle))
	slot1:addObject(CCDelayTime:create(1))
	slot1:addObject(CCCallFunc:create(checkPreFightDialog))

	slot8 = slot1

	uv3:runAction(CCSequence:create(slot8))

	slot2 = 4
	slot3 = CCDirector:sharedDirector():getWinSize().height / uv2:getScale() * 0.05
	slot4 = 1.05

	for slot8 = 0, 5 do
		slot9 = tolua.cast(uv3:getChildByTag(1000 + slot8), "CCNode")
		slot10 = false
		slot14 = uv4

		for slot14 = 1, table.maxn(slot14) do
			if uv5["" .. slot8] == uv4[slot14] then
				slot10 = true

				break
			end
		end

		if slot9 ~= nil and slot10 ~= true and slot9:isVisible() == true then
			slot9:setVisible(false)

			slot11 = createBattleCard(uv5["" .. slot8])

			slot11:setTag(slot9:getTag() + 3000)
			slot11:setAnchorPoint(ccp(0.5, 0.5))
			slot11:setPosition(ccp(slot9:getPositionX(), slot9:getPositionY()))
			slot11:setBasePoint(ccp(slot11:getPositionX(), slot11:getPositionY()))
			slot11:setIsLoop(true)
			slot11:getChildByTag(6):setVisible(false)
			uv3:addChild(slot11, slot9:getZOrder())

			slot13 = slot11:runXMLAnimation(CCString:create("images/battle/xml/action/walk_0")) * slot11:getFpsInterval()
			slot14 = CCArray:create()

			slot14:addObject(CCDelayTime:create(slot0))
			slot14:addObject(CCCallFuncN:create(BattleLayer.removeSelf))
			slot14:addObject(CCCallFunc:create(endWalkEffect))
			slot11:runAction(CCSequence:create(slot14))
		end
	end

	startWalkEffect()
end

function move1ShowEnemey()
	uv0:removeChildByTag(1234, true)

	slot1 = 0.28 * uv1:getContentSize().width
	slot2 = CCDirector:sharedDirector():getWinSize().height / uv1:getScale() - uv1:getContentSize().width * 0.2 * 0.7

	for slot6 = 0, 5 do
		if uv0:getChildByTag(3000 + slot6) ~= nil then
			slot7 = tolua.cast(slot7, "CCSprite")

			slot7:setOpacity(0)
			slot7:setVisible(true)
			slot7:runAction(CCFadeIn:create(0.5))
		end
	end

	slot3 = CCArray:create()

	slot3:addObject(CCDelayTime:create(1))
	slot3:addObject(CCCallFunc:create(showTitle))
	slot3:addObject(CCDelayTime:create(1))
	slot3:addObject(CCCallFunc:create(checkPreFightDialog))
	uv2:runAction(CCSequence:create(slot3))
end

function move1()
	uv0:setVisible(false)
	clearEnemyLayer()
	initCurrentEnemy()

	slot1 = 0

	for slot5 = 0, 5 do
		if uv1:getChildByTag(3000 + slot5) ~= nil then
			slot6:setVisible(false)

			slot0 = 0 + 1
			slot7 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/meffevt_15"), -1, CCString:create(""))

			slot7:retain()
			slot7:setAnchorPoint(ccp(0.5, 0.5))
			slot7:setPosition(slot6:getPositionX(), slot6:getPositionY())
			uv1:addChild(slot7, 99999)
			slot7:release()

			slot10 = BTAnimationEventDelegate:create()

			slot10:registerLayerEndedHandler(function (slot0, slot1)
				uv0 = uv0 + 1

				if uv0 == uv1 then
					move1ShowEnemey()
				end

				removeSelf(uv2)
			end)
			slot10:registerLayerChangedHandler(function (slot0, slot1)
			end)
			slot7:setDelegate(slot10)
		end
	end
end

function move2ShowEnemy()
	for slot3 = 0, 5 do
		if tolua.cast(uv0:getChildByTag(3000 + slot3), "CCNode") ~= nil then
			slot4:setVisible(true)
		end
	end

	slot0 = CCArray:create()

	slot0:addObject(CCCallFunc:create(showTitle))
	slot0:addObject(CCDelayTime:create(1))
	slot0:addObject(CCCallFunc:create(checkPreFightDialog))
	uv1:runAction(CCSequence:create(slot0))
end

function move2()
	uv0:setVisible(false)
	clearEnemyLayer()
	initCurrentEnemy()
	uv1:setVisible(true)

	slot0 = CCDirector:sharedDirector():getWinSize().height / uv2:getScale() * 0.4

	uv1:setVisible(true)
	uv1:setPosition(ccp(0, slot0 - uv2:getPositionY() / uv2:getScale()))

	slot3 = CCArray:create()

	slot3:addObject(CCMoveBy:create(2, ccp(0, -slot0)))
	slot3:addObject(CCCallFunc:create(move2ShowEnemy))

	slot10 = slot3

	uv1:runAction(CCSequence:create(slot10))
	require("db/DB_Army")
	require("db/DB_Team")

	for slot10 = 0, 5 do
		if tolua.cast(uv1:getChildByTag(3000 + slot10), "CCNode") ~= nil then
			slot11:setVisible(false)

			slot12 = createBattleCard(lua_string_split(DB_Team.getDataById(DB_Army.getDataById(uv3).monster_group).monsterID, ",")[slot10 + 1])

			slot12:setTag(slot11:getTag() + 3000)
			slot12:setAnchorPoint(ccp(0.5, 0.5))
			slot12:setPosition(ccp(slot11:getPositionX(), slot11:getPositionY()))
			slot12:setBasePoint(ccp(slot12:getPositionX(), slot12:getPositionY()))
			slot12:setIsLoop(true)
			slot12:getChildByTag(6):setVisible(false)
			uv1:addChild(slot12, slot11:getZOrder())

			slot15 = slot12:runXMLAnimation(CCString:create("images/battle/xml/action/walk_0")) * slot12:getFpsInterval()
			slot16 = CCArray:create()

			slot16:addObject(CCDelayTime:create(slot2))
			slot16:addObject(CCCallFuncN:create(BattleLayer.removeSelf))
			slot16:addObject(CCCallFunc:create(endWalkEffect))
			slot12:runAction(CCSequence:create(slot16))
		end
	end

	startWalkEffect()
end

function move3ShowTitle()
	slot0 = CCArray:create()

	slot0:addObject(CCCallFunc:create(showTitle))
	slot0:addObject(CCDelayTime:create(1))
	slot0:addObject(CCCallFunc:create(checkPreFightDialog))
	uv0:runAction(CCSequence:create(slot0))
end

function move3ShowAfterTalk()
	if lua_string_split(uv0, "|")[3] ~= nil and slot0 ~= 0 then
		doTalk(slot0, move3ShowTitle)
	else
		move3ShowTitle()
	end
end

function move3ShowEnemy()
	uv0:removeChildByTag(1234, true)

	slot0 = 0.5
	slot2 = 0

	for slot6 = 0, 5 do
		if uv0:getChildByTag(3000 + slot6) ~= nil and slot7:isVisible() == false then
			slot1 = 0 + 1
			slot8 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/meffevt_15"), -1, CCString:create(""))

			slot8:setAnchorPoint(ccp(0.5, 0.5))
			slot8:setPosition(slot7:getPositionX(), slot7:getPositionY())
			uv0:addChild(slot8, 99999)

			slot11 = BTAnimationEventDelegate:create()

			slot11:registerLayerEndedHandler(function (slot0, slot1)
				uv0 = uv0 + 1
				uv1 = tolua.cast(uv1, "CCSprite")

				uv1:setOpacity(0)
				uv1:setVisible(true)
				uv1:runAction(CCFadeIn:create(uv2))

				if uv0 == uv3 then
					slot2 = CCArray:create()

					slot2:addObject(CCDelayTime:create(uv2 + 0.5))
					slot2:addObject(CCCallFunc:create(move3ShowAfterTalk))
					uv4:runAction(CCSequence:create(slot2))
				end

				removeSelf(uv5)
			end)
			slot11:registerLayerChangedHandler(function (slot0, slot1)
			end)
			slot8:setDelegate(slot11)
		end
	end
end

function move3_1()
	if lua_string_split(uv0, "|")[2] ~= nil and slot0 ~= 0 then
		doTalk(slot0, move3ShowEnemy)
	else
		move3ShowEnemy()
	end
end

function move3()
	uv0:setVisible(false)
	clearEnemyLayer()
	initCurrentEnemy()
	uv2:setVisible(true)
	uv2:setPosition(ccp(0, -uv1:getPositionY() / uv1:getScale()))
	require("db/DB_Army")
	require("db/DB_Team")

	slot2 = DB_Team.getDataById(DB_Army.getDataById(uv3).monster_group)
	slot3 = lua_string_split(slot2.monsterID, ",")
	slot4 = {}

	if slot2.bossID ~= nil then
		slot4 = lua_string_split(slot2.bossID, ",")
	end

	slot5 = 0.5

	for slot9 = 0, 5 do
		if uv2:getChildByTag(3000 + slot9) ~= nil then
			slot10:setVisible(false)
		end
	end

	slot6 = 0
	slot7 = 0

	for slot11 = 1, #slot4 do
		for slot16 = 1, #slot3 do
			if slot3[slot16] == slot4[slot11] then
				if uv2:getChildByTag(3000 + slot16 - 1) ~= nil then
					slot17 = tolua.cast(slot17, "CCSprite")

					slot17:setVisible(true)
					slot17:setOpacity(0)

					slot6 = slot6 + 1
					slot18 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/meffevt_15"), -1, CCString:create(""))

					slot18:setAnchorPoint(ccp(0.5, 0.5))
					slot18:setPosition(slot17:getPositionX(), slot17:getPositionY())
					uv2:addChild(slot18, 99999)

					slot21 = BTAnimationEventDelegate:create()

					slot21:registerLayerEndedHandler(function (slot0, slot1)
						uv0 = uv0 + 1

						uv1:runAction(CCFadeIn:create(uv2))

						if uv0 == uv3 then
							slot2 = CCArray:create()

							slot2:addObject(CCDelayTime:create(uv2))
							slot2:addObject(CCCallFunc:create(move3_1))
							uv4:runAction(CCSequence:create(slot2))
						end

						removeSelf(uv5)
					end)
					slot21:registerLayerChangedHandler(function (slot0, slot1)
					end)
					slot18:setDelegate(slot21)
				end
			end
		end
	end
end

function move4ShowTitle()
	slot0 = CCArray:create()

	slot0:addObject(CCCallFunc:create(showTitle))
	slot0:addObject(CCDelayTime:create(1))
	slot0:addObject(CCCallFunc:create(checkPreFightDialog))
	uv0:runAction(CCSequence:create(slot0))
end

function move4ShowTalk3()
	if lua_string_split(uv0, "|")[4] ~= nil and slot0 ~= 0 then
		doTalk(slot0, move4ShowTitle)
	else
		move4ShowTitle()
	end
end

function move4ShowEnemey()
	slot1 = 0

	for slot5 = 0, 5 do
		if tolua.cast(uv0:getChildByTag(3000 + slot5), "CCSprite") ~= nil and slot6:isVisible() == false then
			slot6:setOpacity(0)
			slot6:setVisible(true)

			slot0 = 0 + 1
			slot7 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/meffevt_15"), -1, CCString:create(""))

			slot7:setAnchorPoint(ccp(0.5, 0.5))
			slot7:setPosition(slot6:getPositionX(), slot6:getPositionY())
			uv0:addChild(slot7, 99999)

			slot10 = BTAnimationEventDelegate:create()

			slot10:registerLayerEndedHandler(function (slot0, slot1)
				uv0 = uv0 + 1

				uv1:runAction(CCFadeIn:create(0.5))

				if uv0 == uv2 then
					slot2 = CCArray:create()

					slot2:addObject(CCDelayTime:create(1))
					slot2:addObject(CCCallFunc:create(move4ShowTalk3))
					uv3:runAction(CCSequence:create(slot2))
				end

				removeSelf(uv4)
			end)
			slot10:registerLayerChangedHandler(function (slot0, slot1)
			end)
			slot7:setDelegate(slot10)
		end
	end
end

function move4ShowTalk2()
	endWalkEffect()
	require("db/DB_Army")
	require("db/DB_Team")

	slot1 = DB_Team.getDataById(DB_Army.getDataById(uv0).monster_group)
	slot2 = lua_string_split(slot1.monsterID, ",")
	slot3 = {}

	if slot1.bossID ~= nil then
		slot3 = lua_string_split(slot1.bossID, ",")
	end

	slot4 = 1

	for slot8 = 0, 5 do
		if uv1:getChildByTag(3000 + slot8) ~= nil then
			slot9:setVisible(false)
		end
	end

	for slot8 = 1, #slot3 do
		for slot13 = 1, #slot2 do
			if slot2[slot13] == slot3[slot8] and uv1:getChildByTag(3000 + slot13 - 1) ~= nil then
				slot14:setVisible(true)
			end
		end
	end

	if lua_string_split(uv2, "|")[3] ~= nil and slot5 ~= 0 then
		doTalk(slot5, move4ShowEnemey)
	else
		move4ShowEnemey()
	end
end

function move4backoff()
	slot0 = 2
	slot1 = 2.5

	uv0:runAction(CCMoveBy:create(slot1, ccp(0, -MoveDistence * uv0:getScale())))
	uv1:runAction(CCMoveBy:create(slot1, ccp(0, MoveDistence)))

	slot2 = CCArray:create()

	slot2:addObject(CCMoveBy:create(slot1, ccp(0, MoveDistence)))
	slot2:addObject(CCCallFunc:create(setPlayerCardsBack))
	slot2:addObject(CCCallFunc:create(move4ShowTalk2))
	slot2:addObject(CCDelayTime:create(0.5))

	slot9 = slot2

	uv2:runAction(CCSequence:create(slot9))
	require("db/DB_Army")
	require("db/DB_Team")

	slot5 = lua_string_split(DB_Team.getDataById(DB_Army.getDataById(uv3).monster_group).monsterID, ",")

	for slot9 = 0, 5 do
		if uv1:getChildByTag(3000 + slot9) ~= nil then
			slot10 = tolua.cast(uv1:getChildByTag(3000 + slot9), "CCNode")
		end

		if slot10 ~= nil and slot10:isVisible() == true then
			slot10:setVisible(false)

			slot11 = createBattleCard(slot5[slot9 + 1])

			slot11:setTag(slot10:getTag() + 3000)
			slot11:setAnchorPoint(ccp(0.5, 0.5))
			slot11:setPosition(ccp(slot10:getPositionX(), slot10:getPositionY()))
			slot11:setBasePoint(ccp(slot11:getPositionX(), slot11:getPositionY()))
			slot11:setIsLoop(true)
			slot11:getChildByTag(6):setVisible(false)
			uv1:addChild(slot11, slot10:getZOrder())

			slot13 = slot11:runXMLAnimation(CCString:create("images/battle/xml/action/walk_0"))
			slot14 = CCArray:create()

			slot14:addObject(CCDelayTime:create(slot1))
			slot14:addObject(CCCallFuncN:create(BattleLayer.removeSelf))
			slot11:runAction(CCSequence:create(slot14))
		end
	end

	startWalkEffect()

	for slot9 = 0, 5 do
		if tolua.cast(uv2:getChildByTag(1000 + slot9), "CCNode") ~= nil and slot10:isVisible() == true then
			slot10:setVisible(false)

			slot11 = createBattleCard(uv4["" .. slot9])

			slot11:setTag(slot10:getTag() + 3000)
			slot11:setAnchorPoint(ccp(0.5, 0.5))
			slot11:setPosition(ccp(slot10:getPositionX(), slot10:getPositionY()))
			slot11:setBasePoint(ccp(slot11:getPositionX(), slot11:getPositionY()))
			slot11:setIsLoop(true)
			slot11:getChildByTag(6):setVisible(false)
			uv2:addChild(slot11, slot10:getZOrder())

			slot14 = slot11:runXMLAnimation(CCString:create("images/battle/xml/action/walk_0")) * slot11:getFpsInterval()
			slot15 = CCArray:create()

			slot15:addObject(CCDelayTime:create(slot1))
			slot15:addObject(CCCallFuncN:create(BattleLayer.removeSelf))
			slot11:runAction(CCSequence:create(slot15))
		end
	end
end

function move4ShowTalk1()
	if lua_string_split(uv0, "|")[2] ~= nil and slot0 ~= 0 then
		doTalk(slot0, move4backoff)
	else
		move4backoff()
	end
end

function move4()
	uv0:setVisible(false)
	clearEnemyLayer()
	initCurrentEnemy()
	uv2:setVisible(true)
	uv2:setPosition(ccp(0, -uv1:getPositionY() / uv1:getScale()))
	require("db/DB_Army")
	require("db/DB_Team")

	slot2 = DB_Team.getDataById(DB_Army.getDataById(uv3).monster_group)
	slot3 = lua_string_split(slot2.monsterID, ",")
	slot4 = {}

	if slot2.bossID ~= nil then
		slot4 = lua_string_split(slot2.bossID, ",")
	end

	slot5 = 0.5

	for slot9 = 0, 5 do
		if uv2:getChildByTag(3000 + slot9) ~= nil then
			slot10:setVisible(false)
		end
	end

	slot6 = 0
	slot7 = 0

	for slot11 = 1, #slot4 do
		for slot16 = 1, #slot3 do
			if slot3[slot16] == slot4[slot11] then
				if uv2:getChildByTag(3000 + slot16 - 1) ~= nil then
					slot17 = tolua.cast(slot17, "CCSprite")

					slot17:setVisible(true)
					slot17:setOpacity(0)

					slot6 = slot6 + 1
					slot18 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/meffevt_15"), -1, CCString:create(""))

					slot18:setAnchorPoint(ccp(0.5, 0.5))
					slot18:setPosition(slot17:getPositionX(), slot17:getPositionY())
					uv2:addChild(slot18, 99999)

					slot21 = BTAnimationEventDelegate:create()

					slot21:registerLayerEndedHandler(function (slot0, slot1)
						uv0 = uv0 + 1

						uv1:runAction(CCFadeIn:create(uv2))

						if uv0 == uv3 then
							slot2 = CCArray:create()

							slot2:addObject(CCDelayTime:create(uv2))
							slot2:addObject(CCCallFunc:create(move4ShowTalk1))
							uv4:runAction(CCSequence:create(slot2))
						end

						removeSelf(uv5)
					end)
					slot21:registerLayerChangedHandler(function (slot0, slot1)
					end)
					slot18:setDelegate(slot21)
				end
			end
		end
	end
end

function move5ShowTitle()
	slot0 = CCArray:create()

	slot0:addObject(CCCallFunc:create(showTitle))
	slot0:addObject(CCDelayTime:create(1))
	slot0:addObject(CCCallFunc:create(checkPreFightDialog))
	uv0:runAction(CCSequence:create(slot0))
end

function move5ShowTalk3()
	if lua_string_split(uv0, "|")[5] ~= nil and slot0 ~= 0 then
		doTalk(slot0, move5ShowTitle)
	else
		move5ShowTitle()
	end
end

function move5ShowEnemey()
	slot1 = 0

	for slot5 = 0, 5 do
		if tolua.cast(uv0:getChildByTag(3000 + slot5), "CCNode") ~= nil and slot6:isVisible() == false then
			slot7 = tolua.cast(slot6, "CCSprite")

			slot7:setOpacity(0)
			slot7:setVisible(true)

			slot0 = 0 + 1
			slot8 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/meffevt_15"), -1, CCString:create(""))

			slot8:setAnchorPoint(ccp(0.5, 0.5))
			slot8:setPosition(slot7:getPositionX(), slot7:getPositionY())
			uv0:addChild(slot8, 99999)

			slot11 = BTAnimationEventDelegate:create()

			slot11:registerLayerEndedHandler(function (slot0, slot1)
				uv0 = uv0 + 1

				uv1:runAction(CCFadeIn:create(0.5))

				if uv0 == uv2 then
					slot2 = CCArray:create()

					slot2:addObject(CCDelayTime:create(1))
					slot2:addObject(CCCallFunc:create(move5ShowTalk3))
					uv3:runAction(CCSequence:create(slot2))
				end

				removeSelf(uv4)
			end)
			slot11:registerLayerChangedHandler(function (slot0, slot1)
			end)
			slot8:setDelegate(slot11)
		end
	end
end

function move5ShowTalk2()
	if lua_string_split(uv0, "|")[4] ~= nil and slot0 ~= 0 then
		doTalk(slot0, move5ShowEnemey)
	else
		move5ShowEnemey()
	end
end

function move5change2()
	require("db/DB_Army")
	require("db/DB_Team")

	slot1 = DB_Team.getDataById(DB_Army.getDataById(uv0).monster_group)
	slot2 = lua_string_split(slot1.monsterID, ",")
	slot3 = {}

	if slot1.bossID ~= nil then
		slot3 = lua_string_split(slot1.bossID, ",")
	end

	slot4 = 0.5

	for slot8 = 0, 5 do
		if uv1:getChildByTag(3000 + slot8) ~= nil then
			slot9:setVisible(false)
		end
	end

	slot5 = 0
	slot6 = 0

	for slot10 = 1, #slot3 do
		for slot15 = 1, #slot2 do
			if slot2[slot15] == slot3[slot10] and uv1:getChildByTag(3000 + slot15 - 1) ~= nil then
				slot17 = tolua.cast(slot16, "CCSprite")

				slot17:setOpacity(0)
				slot17:setVisible(true)

				slot5 = slot5 + 1
				slot18 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/meffevt_15"), -1, CCString:create(""))

				slot18:setAnchorPoint(ccp(0.5, 0.5))
				slot18:setPosition(slot17:getPositionX(), slot17:getPositionY())
				uv1:addChild(slot18, 99999)

				slot21 = BTAnimationEventDelegate:create()

				slot21:registerLayerEndedHandler(function (slot0, slot1)
					uv0 = uv0 + 1

					uv1:runAction(CCFadeIn:create(uv2))

					if uv0 == uv3 then
						slot2 = CCArray:create()

						slot2:addObject(CCDelayTime:create(1))
						slot2:addObject(CCCallFunc:create(move5ShowTalk2))
						uv4:runAction(CCSequence:create(slot2))
					end

					removeSelf(uv5)
				end)
				slot21:registerLayerChangedHandler(function (slot0, slot1)
				end)
				slot18:setDelegate(slot21)
			end
		end
	end
end

function move5change()
	slot1 = 0

	for slot5 = 0, 5 do
		if uv0:getChildByTag(6000 + slot5) ~= nil and slot6:isVisible() == true then
			slot7 = tolua.cast(slot6, "CCSprite")

			slot7:setVisible(true)

			slot0 = 0 + 1
			slot8 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/meffect_16"), -1, CCString:create(""))

			slot8:setAnchorPoint(ccp(0.5, 0.5))
			slot8:setPosition(slot7:getPositionX(), slot7:getPositionY())
			uv0:addChild(slot8, 99999)

			slot11 = BTAnimationEventDelegate:create()

			slot11:registerLayerEndedHandler(function (slot0, slot1)
				uv0 = uv0 + 1
				slot2 = CCArray:create()

				slot2:addObject(CCFadeOut:create(1))
				slot2:addObject(CCCallFuncN:create(removeSelf))
				uv1:runAction(CCSequence:create(slot2))

				if uv0 == uv2 then
					slot3 = CCArray:create()

					slot3:addObject(CCDelayTime:create(1))
					slot3:addObject(CCCallFunc:create(move5change2))
					uv3:runAction(CCSequence:create(slot3))
				end

				removeSelf(uv4)
			end)
			slot11:registerLayerChangedHandler(function (slot0, slot1)
			end)
			slot8:setDelegate(slot11)
		end
	end
end

function move5ShowTalk1()
	if lua_string_split(uv0, "|")[3] ~= nil and slot0 ~= 0 then
		doTalk(slot0, move5change)
	else
		move5change()
	end
end

function move5()
	uv0:setVisible(false)
	clearEnemyLayer()
	initCurrentEnemy()
	uv2:setVisible(true)
	uv2:setPosition(ccp(0, -uv1:getPositionY() / uv1:getScale()))
	require("db/DB_Army")
	require("db/DB_Team")

	slot2 = DB_Team.getDataById(DB_Army.getDataById(uv3).monster_group)
	slot3 = lua_string_split(slot2.monsterID, ",")
	slot4 = {}

	if slot2.bossID ~= nil then
		slot4 = lua_string_split(slot2.bossID, ",")
	end

	slot5 = 0.5

	for slot9 = 0, 5 do
		if uv2:getChildByTag(3000 + slot9) ~= nil then
			slot10:setVisible(false)
		end
	end

	slot7 = lua_string_split(lua_string_split(uv4, "|")[2], ",")
	slot8 = 0
	slot9 = 0

	for slot13 = 1, #slot4 do
		for slot18 = 1, #slot3 do
			if slot3[slot18] == slot4[slot13] and uv2:getChildByTag(3000 + slot18 - 1) ~= nil and slot13 <= #slot7 then
				require("db/DB_Monsters")

				slot21 = createBattleCard(DB_Monsters.getDataById(slot7[slot13]).hid)

				slot21:setPosition(slot19:getPositionX(), slot19:getPositionY())
				slot21:setTag(6000 + slot13)
				uv2:addChild(slot21, slot19:getZOrder())
				slot21:getChildByTag(6):setVisible(false)

				slot22 = slot21

				slot22:setOpacity(0)
				slot22:setVisible(true)

				slot8 = slot8 + 1
				slot23 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/meffevt_15"), -1, CCString:create(""))

				slot23:setAnchorPoint(ccp(0.5, 0.5))
				slot23:setPosition(slot22:getPositionX(), slot22:getPositionY())
				uv2:addChild(slot23, 99999)

				slot26 = BTAnimationEventDelegate:create()

				slot26:registerLayerEndedHandler(function (slot0, slot1)
					uv0 = uv0 + 1

					uv1:runAction(CCFadeIn:create(uv2))

					if uv0 == uv3 then
						slot2 = CCArray:create()

						slot2:addObject(CCDelayTime:create(uv2))
						slot2:addObject(CCCallFunc:create(move5ShowTalk1))
						uv4:runAction(CCSequence:create(slot2))
					end

					removeSelf(uv5)
				end)
				slot26:registerLayerChangedHandler(function (slot0, slot1)
				end)
				slot23:setDelegate(slot26)
			end
		end
	end
end

function showNextArmy()
	if uv0 ~= nil then
		-- Nothing
	end

	endShake()
	require("script/ui/login/LoginScene")

	uv1 = false
	uv2 = uv2 + 1
	uv3 = nil

	require("db/DB_Stronghold")

	slot0 = DB_Stronghold.getDataById(uv4)
	slot1 = nil
	slot1 = uv5 == 1 and "simple" or uv5 == 2 and "normal" or uv5 == 3 and "hard" or "simple"
	slot2 = nil

	if lua_string_split((uv5 ~= 0 or slot0["npc_army_ids_" .. slot1]) and slot0["army_ids_" .. slot1], ",")[uv2] == nil then
		CCDirector:sharedDirector():getScheduler():setTimeScale(1)

		if uv6 == "E" or uv6 == "F" then
			require("script/battle/BattleReportLayer")
			uv13:addChild(BattleReportLayer.getBattleReportLayer(false, uv7, uv4, uv5, uv8, uv9, uv10, uv11, uv12, false), 99999)
			uv0:setVisible(false)

			return
		else
			require("script/battle/BattleReportLayer")
			uv13:addChild(BattleReportLayer.getBattleReportLayer(true, uv7, uv4, uv5, uv8, uv9, uv10, uv11, uv12, uv14, uv15), 99999)
			uv0:setVisible(false)

			return
		end
	end

	require("db/DB_Army")

	slot4 = DB_Army.getDataById(slot3[uv2])
	uv16 = slot4.id
	uv17 = slot4.appear_style

	require("db/DB_Team")

	slot6 = DB_Team.getDataById(slot4.monster_group).monsterID

	uv19:setPosition(ccp(0, -uv18:getPositionY() / uv18:getScale()))
	uv19:setVisible(true)

	if tonumber(slot4.type) == 2 then
		uv20 = {}
		slot9 = lua_string_split(DB_Team.getDataById(slot4.monster_group_npc).monsterID, ",")

		for slot13 = 0, 5 do
			if slot13 + 1 <= #slot9 then
				if slot9[slot13 + 1] == "0" then
					-- Nothing
				elseif tonumber(slot9[slot13 + 1]) == 1 then
					uv20["" .. slot13] = tonumber(getMainHero().hid)
				else
					uv20["" .. slot13] = tonumber(slot9[slot13 + 1])
				end
			end
		end

		uv21:removeFromParentAndCleanup(true)

		uv21 = PlayerCardLayer.getPlayerCardLayer(CCSizeMake(640, 600), uv20)

		uv21:setPosition(ccp(0, -uv18:getPositionY() / uv18:getScale()))
		uv21:setAnchorPoint(ccp(0, 0))
		uv18:addChild(uv21, 0, 1177)
		PlayerCardLayer.setSwitchable(false)

		uv22 = uv20

		if uv2 > 1 then
			require("db/DB_Army")
			require("db/DB_Team")

			for slot16 = 0, 5 do
				if slot16 + 1 > #lua_string_split(DB_Team.getDataById(DB_Army.getDataById(slot3[uv2 - 1]).monster_group_npc).monsterID, ",") then
					if uv21:getChildByTag(1000 + slot16) ~= nil then
						slot17:setVisible(false)
					end
				elseif tonumber(slot12[slot16 + 1]) == 1 then
					-- Nothing
				elseif uv20["" .. slot16] ~= 0 and uv20["" .. slot16] ~= nil then
					slot18 = tonumber(uv20["" .. slot16])
					slot19 = {}

					if tonumber(slot12[slot16 + 1]) ~= 0 then
						require("db/DB_Monsters")
						require("db/DB_Monsters_tmpl")

						slot19 = DB_Monsters_tmpl.getDataById(DB_Monsters.getDataById(slot17).htid)
					end

					require("db/DB_Monsters")
					require("db/DB_Monsters_tmpl")

					if slot19.action_module_id ~= DB_Monsters_tmpl.getDataById(DB_Monsters.getDataById(slot18).htid).action_module_id and uv21:getChildByTag(1000 + slot16) ~= nil then
						slot22:setVisible(false)
					end
				end
			end
		end
	elseif slot3[uv2 - 1] ~= nil and tonumber(DB_Army.getDataById(slot3[uv2 - 1]).type) == 2 then
		uv22 = uv23

		uv21:removeFromParentAndCleanup(true)

		uv21 = PlayerCardLayer.getPlayerCardLayer(CCSizeMake(640, 600), uv22)

		uv21:setPosition(ccp(0, -uv18:getPositionY() / uv18:getScale()))
		uv21:setAnchorPoint(ccp(0, 0))
		uv18:addChild(uv21, 0, 1177)
		PlayerCardLayer.setSwitchable(false)
	end

	if uv24 ~= nil then
		slot8 = uv24.team1.arrHero
		slot12 = uv25

		for slot12 = 1, table.maxn(slot12) do
			slot13 = -1

			for slot17 = 1, #slot8 do
				if slot8[slot17].hid == uv25[slot12] then
					slot13 = slot18.position

					break
				end
			end

			if uv21:getChildByTag(1000 + slot13) ~= nil then
				slot15 = CCArray:create()

				slot15:addObject(CCFadeIn:create(0.5))
				slot15:addObject(CCFadeOut:create(0.5))
				slot14:runAction(CCRepeatForever:create(CCSequence:create(slot15)))

				slot16 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/fuhuo_2"), -1, CCString:create(""))

				slot16:setAnchorPoint(ccp(0.5, 0.5))
				slot16:setPosition(slot14:getContentSize().width / 2, slot14:getContentSize().height * 0.7)
				slot14:addChild(slot16, 99999, 9115)

				slot17 = CCSprite:create(uv26 .. "icon/icon_revive.png")

				slot17:setAnchorPoint(ccp(0.5, 0.5))
				slot17:setPosition(slot14:getContentSize().width / 2, slot14:getContentSize().height * 0.2)
				slot14:addChild(slot17, 99999, 9116)
				uv21:removeChildByTag(slot14:getTag() + 8115, true)

				if uv12 == kEliteCopy then
					doReviveCard(true, uv25[slot12])
				end
			end
		end
	end

	for slot11 = 0, 5 do
		if uv21:getChildByTag(1000 + slot11) ~= nil then
			BattleCardUtil.setCardAnger(slot12, 0)
			BattleCardUtil.setCardHp(slot12, 1)

			if uv27[1000 + slot11] ~= nil then
				for slot16 = 1, #uv27[1000 + slot11] do
					slot12:removeChildByTag(100000 + uv27[1000 + slot11][slot16], true)
				end
			end

			if tolua.cast(slot12:getChildByTag(6), "CCNode") then
				slot13:setVisible(false)
			end
		end
	end

	uv27 = {}

	uv28:setString("0/30")

	slot8 = nil

	if string.sub(uv17, 1, 1) == "0" then
		slot8 = CCCallFunc:create(move0)
	elseif slot9 == "1" then
		slot8 = CCCallFunc:create(move1)
	elseif slot9 == "2" then
		slot8 = CCCallFunc:create(move2)
	elseif slot9 == "3" then
		slot8 = CCCallFunc:create(move3)
	elseif slot9 == "4" then
		slot8 = CCCallFunc:create(move4)
	elseif slot9 == "5" then
		slot8 = CCCallFunc:create(move5)
	end

	slot10 = CCArray:create()

	slot10:addObject(CCDelayTime:create(1))
	slot10:addObject(slot8)
	uv13:runAction(CCSequence:create(slot10))
end

function initUperLayer()
	require("script/ui/main/MainScene")
	MainScene.initScales()

	uv0 = CCLayer:create()
	slot0 = CCLayerColor:create(ccc4(0, 0, 0, 111))

	slot0:setContentSize(CCSizeMake(CCDirector:sharedDirector():getWinSize().width, CCDirector:sharedDirector():getWinSize().height * 0.05))
	slot0:setPosition(0, CCDirector:sharedDirector():getWinSize().height * 0.96)
	uv0:addChild(slot0)

	uv1 = CCLabelTTF:create(GetLocalizeStringBy("key_1672"), g_sFontName, uv2:getContentSize().height / 35)

	uv1:setAnchorPoint(ccp(0.5, 0.5))
	uv1:setPosition(uv2:getContentSize().width * 0.75, uv2:getContentSize().height * 0.98)
	uv0:addChild(uv1)

	uv3 = CCLabelTTF:create("0/30", g_sFontName, uv2:getContentSize().height / 35)

	uv3:setAnchorPoint(ccp(0.5, 0.5))
	uv3:setPosition(uv2:getContentSize().width * 0.9, uv2:getContentSize().height * 0.98)
	uv0:addChild(uv3)

	if g_debug_mode and uv4 then
		slot1 = CCLayerColor:create(ccc4(0, 0, 0, 111))

		slot1:setContentSize(CCSizeMake(200, 200))
		slot1:setAnchorPoint(ccp(0, 0.5))
		slot1:setPosition(ccps(0, 0.5))
		uv0:addChild(slot1)
		slot1:setScale(g_fElementScaleRatio)

		slot2 = 30
		slot3 = CCLabelTTF:create("brid:" .. uv4.brid or 0, g_sFontName, 22)

		slot3:setAnchorPoint(ccp(0, 1))
		slot3:setPosition(10, slot1:getContentSize().height - 10)
		slot1:addChild(slot3)

		slot4 = CCLabelTTF:create("firstAttack:" .. (uv4.firstAttack or 0), g_sFontName, 22)

		slot4:setAnchorPoint(ccp(0, 1))
		slot4:setPosition(10, slot1:getContentSize().height - 10 - slot2 * 1)
		slot1:addChild(slot4)

		slot5 = CCLabelTTF:create("musicId:" .. uv4.musicId or 0, g_sFontName, 22)

		slot5:setAnchorPoint(ccp(0, 1))
		slot5:setPosition(10, slot1:getContentSize().height - 10 - slot2 * 2)
		slot1:addChild(slot5)

		slot6 = CCLabelTTF:create("appraisal:" .. uv4.appraisal or 0, g_sFontName, 22)

		slot6:setAnchorPoint(ccp(0, 1))
		slot6:setPosition(10, slot1:getContentSize().height - 10 - slot2 * 3)
		slot1:addChild(slot6)
	end

	slot1 = uv2:getContentSize().width * 0.05
	slot2 = uv2:getContentSize().width * 0.11
	slot3 = uv2:getContentSize().width * 0.05
	uv5 = CCSprite:create(uv6 .. "icon/icon_resource.png")

	uv5:setAnchorPoint(ccp(0.5, 0.5))
	uv5:setPosition(slot1 + slot2 * 0, uv2:getContentSize().height * 0.98)
	uv0:addChild(uv5)
	uv5:setScale(MainScene.elementScale)

	uv7 = CCLabelTTF:create("0", g_sFontName, uv2:getContentSize().height / 35)

	uv7:setAnchorPoint(ccp(0, 0.5))
	uv7:setPosition(slot1 + slot2 * 0.5, uv2:getContentSize().height * 0.98)
	uv0:addChild(uv7)

	uv8 = CCSprite:create(uv6 .. "icon/icon_soul.png")

	uv8:setAnchorPoint(ccp(0.5, 0.5))
	uv8:setPosition(slot1 + slot2 * 2, uv2:getContentSize().height * 0.98)
	uv0:addChild(uv8)
	uv8:setScale(MainScene.elementScale)

	uv9 = CCLabelTTF:create("0", g_sFontName, uv2:getContentSize().height / 35)

	uv9:setAnchorPoint(ccp(0, 0.5))
	uv9:setPosition(slot1 + slot2 * 2.5, uv2:getContentSize().height * 0.98)
	uv0:addChild(uv9)

	uv10 = CCSprite:create(uv6 .. "icon/icon_money.png")

	uv10:setAnchorPoint(ccp(0.5, 0.5))
	uv10:setPosition(slot1 + slot2 * 4, uv2:getContentSize().height * 0.98)
	uv0:addChild(uv10)
	uv10:setScale(MainScene.elementScale)

	uv11 = CCLabelTTF:create("0", g_sFontName, uv2:getContentSize().height / 35)

	uv11:setAnchorPoint(ccp(0, 0.5))
	uv11:setPosition(slot1 + slot2 * 4.5, uv2:getContentSize().height * 0.98)
	uv0:addChild(uv11)
	uv11:setColor(ccc3(255, 220, 32))

	uv12 = CCMenuItemImage:create(uv6 .. "btn/btn_speed1_n.png", uv6 .. "btn/btn_speed1_d.png")

	uv12:setAnchorPoint(ccp(0, 0))
	uv12:setPosition(0, 0)
	uv12:registerScriptTapHandler(speedClick1)
	uv12:setScale(MainScene.elementScale)

	uv13 = CCMenuItemImage:create(uv6 .. "btn/btn_speed2_n.png", uv6 .. "btn/btn_speed2_d.png")

	uv13:setAnchorPoint(ccp(0, 0))
	uv13:setPosition(0, 0)
	uv13:registerScriptTapHandler(speedClick2)
	uv13:setScale(MainScene.elementScale)

	battleSpeedButton3 = CCMenuItemImage:create(uv6 .. "btn/btn_speed3_n.png", uv6 .. "btn/btn_speed3_d.png")

	battleSpeedButton3:setAnchorPoint(ccp(0, 0))
	battleSpeedButton3:setPosition(0, 0)
	battleSpeedButton3:registerScriptTapHandler(speedClick3)
	battleSpeedButton3:setScale(MainScene.elementScale)

	uv14 = CCUserDefault:sharedUserDefault():getIntegerForKey("battle_speed_" .. uv15 .. "_" .. uv16)

	if uv14 <= 1 then
		uv14 = 1

		CCDirector:sharedDirector():getScheduler():setTimeScale(uv14)
		uv13:setVisible(false)
		battleSpeedButton3:setVisible(false)
		uv12:setVisible(true)
	else
		require("script/model/user/UserModel")

		if UserModel.getHeroLevel() == nil or tonumber(UserModel.getHeroLevel()) < uv17 then
			uv14 = 1

			CCDirector:sharedDirector():getScheduler():setTimeScale(uv14)
			uv13:setVisible(false)
			battleSpeedButton3:setVisible(false)
			uv12:setVisible(true)
		elseif UserModel.getHeroLevel() == nil or tonumber(UserModel.getHeroLevel()) < uv18 or uv14 >= 2 and uv14 < 3 then
			uv14 = 2

			CCDirector:sharedDirector():getScheduler():setTimeScale(uv14)
			uv12:setVisible(false)
			battleSpeedButton3:setVisible(false)
			uv13:setVisible(true)
		else
			uv14 = 3

			CCDirector:sharedDirector():getScheduler():setTimeScale(uv14)
			uv13:setVisible(false)
			uv12:setVisible(false)
			battleSpeedButton3:setVisible(true)
		end
	end

	CCUserDefault:sharedUserDefault():setIntegerForKey("battle_speed_" .. uv15 .. "_" .. uv16, uv14)
	CCUserDefault:sharedUserDefault():flush()

	uv19 = CCMenuItemImage:create(uv6 .. "btn/btn_start_n.png", uv6 .. "btn/btn_start_d.png")

	uv19:setAnchorPoint(ccp(0.5, 0.5))
	uv19:setPosition(uv2:getContentSize().width / 2, uv2:getContentSize().height / 2)
	uv19:registerScriptTapHandler(doBattleClick)
	uv19:setScale(MainScene.elementScale)
	uv19:setVisible(false)

	slot4 = CCMenu:create()

	slot4:setAnchorPoint(ccp(0, 0))
	slot4:setPosition(0, 0)
	slot4:addChild(uv12)
	slot4:addChild(uv13)
	slot4:addChild(battleSpeedButton3)
	slot4:addChild(uv19)
	uv0:addChild(slot4, 0, 1299)
	slot4:setTouchPriority(-1000)

	uv20 = CCMenuItemImage:create(uv6 .. "icon/icon_skip_n.png", uv6 .. "icon/icon_skip_h.png")

	uv20:registerScriptTapHandler(skipClick)
	uv20:setAnchorPoint(ccp(1, 0))
	uv20:setPosition(uv2:getContentSize().width * 1, 0)
	slot4:addChild(uv20)
	uv20:setScale(MainScene.elementScale)

	uv21 = CCMenuItemImage:create(uv6 .. "icon/icon_autofight.png", uv6 .. "icon/icon_autofight.png")

	uv21:registerScriptTapHandler(autoFightClick)
	uv21:setAnchorPoint(ccp(1, 0))
	uv21:setPosition(uv2:getContentSize().width, 0)
	slot4:addChild(uv21)
	uv21:setScale(MainScene.elementScale)

	slot6 = CCLabelTTF:create(uv22 == true and GetLocalizeStringBy("key_1712") or GetLocalizeStringBy("key_2379"), g_sFontPangWa, uv21:getContentSize().height * 0.55)

	slot6:setAnchorPoint(ccp(0.5, 0.5))
	slot6:setPosition(uv21:getContentSize().width / 2, uv21:getContentSize().height / 2)
	slot6:setColor(ccc3(255, 220, 0))
	uv21:addChild(slot6, 9, 110)

	if uv23 == 2 then
		uv21:setVisible(true)
		uv20:setPosition(uv20:getPositionX(), slot6:getContentSize().height * MainScene.elementScale + 20 * MainScene.elementScale)
	else
		uv21:setVisible(false)
	end

	if uv24 ~= true or uv25 ~= true then
		uv20:setVisible(false)
	else
		uv20:setVisible(true)
	end

	return uv0
end

function doBattleCallback(slot0, slot1, slot2)
	uv0 = {}
	uv1 = {}

	if slot1 == nil or slot1.ret == nil then
		require("script/ui/tip/AlertTip")
		AlertTip.showAlert(GetLocalizeStringBy("key_2070"), nil, false, nil)
		closeLayer()

		return
	end

	if slot1.ret.err == "nodefeatnum" then
		require("script/ui/tip/AlertTip")
		AlertTip.showAlert(GetLocalizeStringBy("key_1001"), nil, false, nil)
		closeLayer()

		return
	end

	require("script/utils/LuaUtil")

	uv2 = amf3.decode(Base64.decodeWithZip(slot1.ret.fightRet == nil and slot1.ret or slot1.ret.fightRet))

	printTable("m_battleInfo", uv2)
	initPlayerCardHidMap()

	uv0 = slot1.ret.newcopyorbase
	uv3 = slot1.ret.extra_reward
	uv4 = slot1.ret.extra
	uv5 = slot1.ret.appraisal
	uv6 = slot1.ret.curHp
	uv7 = slot1.ret.reward
	uv8 = slot1.ret.getscore

	if slot1.ret.reward.hero ~= nil then
		uv9 = slot1.ret.reward.hero

		for slot9 = 1, #slot1.ret.reward.hero do
			uv10[#uv10 + 1] = slot1.ret.reward.hero[slot9]
		end
	end

	clearEnemyLayer()

	slot7 = uv11:getContentSize().width * 0.2

	for slot11 = 1, #uv2.team2.arrHero do
		slot12 = slot6[slot11]
		slot13 = slot12.position
		slot14 = createBattleCard(slot12.hid)

		slot14:setTag(3000 + slot13)
		slot14:setAnchorPoint(ccp(0.5, 0.5))
		slot14:setPosition(getEnemyCardPointByPosition(slot13))
		slot14:setBasePoint(ccp(slot14:getPositionX(), slot14:getPositionY()))
		uv12:addChild(slot14, 5 - slot11)

		slot15 = 0
		uv13[slot12.hid] = slot12.maxHp
		uv14[slot12.hid] = (slot12.currHp ~= nil or slot12.maxHp) and slot12.currHp
		uv15[slot12.hid] = slot12.currRage == nil and 0 or tonumber(slot12.currRage)

		if uv15[slot12.hid] == nil then
			uv15[slot12.hid] = 0
		end

		BattleCardUtil.setCardAnger(slot14, uv15[slot12.hid], slot12.hid)
	end

	uv12:setPosition(ccp(0, -uv11:getPositionY() / uv11:getScale()))
	uv16:removeFromParentAndCleanup(true)

	uv17 = {}
	uv18 = {}

	for slot13 = 1, #uv2.team1.arrHero do
		if slot9[slot13].position ~= nil then
			uv17["" .. slot14.position] = slot14.hid
			slot15 = 0

			if ((slot14.currHp ~= nil or slot14.maxHp) and slot14.currHp) == 0 then
				uv18[table.maxn(uv18) + 1] = slot14.hid
			else
				uv13[slot14.hid] = slot14.maxHp
				uv14[slot14.hid] = slot15
				uv15[slot14.hid] = slot14.currRage == nil and 0 or tonumber(slot14.currRage)

				if uv15[slot14.hid] == nil then
					uv15[slot14.hid] = 0
				end
			end
		end
	end

	uv16 = PlayerCardLayer.getPlayerCardLayer(CCSizeMake(640, 600), uv17)

	uv16:setPosition(ccp(0, -uv11:getPositionY() / uv11:getScale()))

	slot13 = ccp

	uv16:setAnchorPoint(slot13(0, 0))

	for slot13 = 1, #slot9 do
		if slot9[slot13].position ~= nil then
			uv17["" .. slot14.position] = slot14.hid

			if uv16:getChildByTag(1000 + tonumber(slot14.position)) ~= nil then
				BattleCardUtil.setCardAnger(tolua.cast(slot15, "CCXMLSprite"), uv15[slot14.hid], slot14.hid)
			end
		end
	end

	slot13 = uv18

	for slot13 = 1, table.maxn(slot13) do
		slot14 = -1

		for slot18 = 1, #slot9 do
			if slot9[slot18].hid == uv18[slot13] then
				slot14 = slot19.position

				break
			end
		end

		if uv16:getChildByTag(1000 + slot14) ~= nil then
			slot16 = CCArray:create()

			slot16:addObject(CCFadeIn:create(0.5))
			slot16:addObject(CCFadeOut:create(0.5))
			slot15:runAction(CCRepeatForever:create(CCSequence:create(slot16)))
		end
	end

	uv11:addChild(uv16, 0, 1177)

	uv19 = 1

	require("script/ui/login/LoginScene")
	LoginScene.setBattleStatus(true)

	uv20 = true

	PlayerCardLayer.setSwitchable(false)
	uv21:setVisible(false)
	BattleCardUtil.setNameVisible(true)
	addCraftInBattle()
	showPetAtBattle(function (...)
		currentRoundOver()
		showNextMove()
	end)
	uv22:setVisible(true)
end

function createPetInfoPanel(slot0, slot1, slot2)
	slot3 = DB_Pet.getDataById(slot0)
	slot4 = CCSprite:create("images/battle/pet/pet_info_panel.png")

	slot4:setAnchorPoint(ccp(0.5, 0.5))
	slot4:setScale(g_fScaleX)

	slot5 = CCSprite:create("images/battle/pet/battle_pet.png")

	slot5:setPosition(ccpsprite(0.53, 0.95, slot4))
	slot5:setAnchorPoint(ccp(0.5, 0.5))
	slot4:addChild(slot5, 2006)

	slot6 = CCSprite:create("images/pet/body_img/" .. slot3.roleModelID)

	slot6:setPosition(ccpsprite(-0.15, 0.5, slot4))
	slot6:setAnchorPoint(ccp(0, 0.5))
	slot4:addChild(slot6)
	slot6:setScale(0.5)

	slot7 = CCRenderLabel:create(slot3.roleName, g_sFontPangWa, 21, 1, ccc3(0, 0, 0), type_stroke)

	slot7:setPosition(ccpsprite(0, 0, slot4))
	slot4:addChild(slot7, 2)
	slot7:setColor(HeroPublicLua.getCCColorByStarLevel(slot3.quality))

	slot10 = nil
	slot11 = CCRenderLabel:create(slot1.name, g_sFontPangWa, 21, 1, ccc3(0, 0, 0), type_stroke)

	slot11:setColor(ccc3(255, 246, 0))

	slot12 = BaseUI.createHorizontalNode({
		(not slot2 or CCSprite:create("images/battle/strength/firstAttack.png")) and CCSprite:create("images/battle/strength/lastAttack.png"),
		slot11
	})

	slot12:setAnchorPoint(ccp(0.5, 0.5))
	slot12:setPosition(ccpsprite(0.5, 1.15, slot4))
	slot4:addChild(slot12)
	require("script/ui/pet/PetUtil")
	require("script/ui/pet/PetData")

	if table.isEmpty(PetUtil.getPetValueByInfo(slot1.arrPet[1])) then
		slot13 = PetUtil.getPetValueByInfo(slot1.arrPet[1].arrSkill)
	end

	slot13 = slot13 or {}
	slot14 = {}

	if PetData.getPetTrainAttrTotalValue then
		slot14 = PetData.getPetTrainAttrTotalValue(slot1.arrPet[1])
	end

	slot13["1"] = slot13["1"] or {}
	slot14["51"] = slot14["51"] or {}

	CCRenderLabel:create(GetLocalizeStringBy("lcy_10012"), g_sFontName, 21, 1, ccc3(0, 0, 0), type_stroke):setColor(ccc3(255, 246, 0))
	CCRenderLabel:create("+" .. (slot13["1"].displayNum or 0), g_sFontName, 21, 1, ccc3(0, 0, 0), type_stroke):setColor(ccc3(255, 255, 255))

	slot17 = CCRenderLabel:create("+" .. (slot14["51"].displayNum or 0), g_sFontName, 21, 1, ccc3(0, 0, 0), type_stroke)

	slot17:setColor(ccc3(0, 255, 24))

	slot18 = BaseUI.createHorizontalNode({
		slot15,
		slot16,
		slot17
	})

	slot18:setAnchorPoint(ccp(0.5, 0.5))
	slot18:setPosition(ccpsprite(0.4, 0.7, slot4))
	slot4:addChild(slot18)

	slot13["9"] = slot13["9"] or {}
	slot14["100"] = slot14["100"] or {}

	CCRenderLabel:create(GetLocalizeStringBy("lcy_10013"), g_sFontName, 21, 1, ccc3(0, 0, 0), type_stroke):setColor(ccc3(255, 246, 0))
	CCRenderLabel:create("+" .. (slot13["9"].displayNum or 0), g_sFontName, 21, 1, ccc3(0, 0, 0), type_stroke):setColor(ccc3(255, 255, 255))

	slot21 = CCRenderLabel:create("+" .. (slot14["100"].displayNum or 0), g_sFontName, 21, 1, ccc3(0, 0, 0), type_stroke)

	slot21:setColor(ccc3(0, 255, 24))

	slot22 = BaseUI.createHorizontalNode({
		slot19,
		slot20,
		slot21
	})

	slot22:setAnchorPoint(ccp(0.5, 0.5))
	slot22:setPosition(ccpsprite(0.7, 0.7, slot4))
	slot4:addChild(slot22)

	slot13["4"] = slot13["4"] or {}
	slot14["54"] = slot14["54"] or {}

	CCRenderLabel:create(GetLocalizeStringBy("lcy_10014"), g_sFontName, 21, 1, ccc3(0, 0, 0), type_stroke):setColor(ccc3(255, 246, 0))
	CCRenderLabel:create("+" .. (slot13["4"].displayNum or 0), g_sFontName, 21, 1, ccc3(0, 0, 0), type_stroke):setColor(ccc3(255, 255, 255))

	slot25 = CCRenderLabel:create("+" .. (slot14["54"].displayNum or 0), g_sFontName, 21, 1, ccc3(0, 0, 0), type_stroke)

	slot25:setColor(ccc3(0, 255, 24))

	slot26 = BaseUI.createHorizontalNode({
		slot23,
		slot24,
		slot25
	})

	slot26:setAnchorPoint(ccp(0.5, 0.5))
	slot26:setPosition(ccpsprite(0.4, 0.3, slot4))
	slot4:addChild(slot26)

	slot13["5"] = slot13["5"] or {}
	slot14["55"] = slot14["55"] or {}

	CCRenderLabel:create(GetLocalizeStringBy("lcy_10015"), g_sFontName, 21, 1, ccc3(0, 0, 0), type_stroke):setColor(ccc3(255, 246, 0))
	CCRenderLabel:create("+" .. (slot13["5"].displayNum or 0), g_sFontName, 21, 1, ccc3(0, 0, 0), type_stroke):setColor(ccc3(255, 255, 255))

	slot29 = CCRenderLabel:create("+" .. (slot14["55"].displayNum or 0), g_sFontName, 21, 1, ccc3(0, 0, 0), type_stroke)

	slot29:setColor(ccc3(0, 255, 24))

	slot30 = BaseUI.createHorizontalNode({
		slot27,
		slot28,
		slot29
	})

	slot30:setAnchorPoint(ccp(0.5, 0.5))
	slot30:setPosition(ccpsprite(0.7, 0.3, slot4))
	slot4:addChild(slot30)

	return slot4
end

function showPetAtBattle(slot0)
	uv0 = {}
	slot1, slot2 = nil

	if uv1.team1.arrPet ~= nil then
		slot1 = uv1.team1.arrPet[1].pet_tmpl
	end

	if uv1.team2.arrPet ~= nil then
		slot2 = uv1.team2.arrPet[1].pet_tmpl
	end

	if slot1 == nil and slot2 == nil then
		if slot0 then
			slot0()
		end

		return
	end

	slot3, slot4 = nil
	slot5 = false
	slot6 = false

	function slot7(...)
		if uv0 == true then
			return
		end

		uv0 = true

		if uv1 and uv2 == false then
			uv3()

			return
		end

		if uv4 and (uv2 == true or uv1 == nil) then
			uv4()
		end
	end

	function slot8(...)
		if uv0 == true then
			return
		end

		uv0 = true

		if uv1 and uv2 == false then
			uv3()

			return
		end

		if uv4 and (uv2 == true or uv1 == nil) then
			uv4()
		end
	end

	function slot9(slot0)
		for slot4, slot5 in pairs(uv0) do
			if slot5 == slot0 then
				uv0[slot4] = nil
			end
		end
	end

	slot10, slot11 = nil
	slot12 = false

	function slot13(slot0)
		uv0 = true

		if uv1 ~= nil and slot0 == 1 then
			slot1 = uv2:getChildren()
			slot5 = slot1

			for slot5 = 0, slot1.count(slot5) - 1 do
				if tolua.cast(slot1:objectAtIndex(slot5), "CCSprite") then
					slot7 = CCLayerSprite:layerSpriteWithNameAndCount("images/battle/pet/cwzhandouli", 1, CCString:create(""))

					slot7:setPosition(ccpsprite(0.5, 0.5, slot6))
					slot6:addChild(slot7, 2000)

					slot8 = BTAnimationEventDelegate:create()

					slot8:registerLayerEndedHandler(uv3)
					slot7:setDelegate(slot8)
					slot7:registerScriptHandler(function (slot0)
						if slot0 == "exit" then
							uv0(uv1)
						end
					end)
					table.insert(uv5, slot7)
				end
			end
		end

		if uv6 ~= nil and slot0 == 2 then
			slot1 = uv7:getChildren()
			slot5 = slot1

			for slot5 = 0, slot1.count(slot5) - 1 do
				if tolua.cast(slot1:objectAtIndex(slot5), "CCSprite") then
					slot7 = CCLayerSprite:layerSpriteWithNameAndCount("images/battle/pet/cwzhandouli", 1, CCString:create(""))

					slot7:setPosition(ccpsprite(0.5, 0.5, slot6))
					slot6:addChild(slot7, 2000)

					slot8 = BTAnimationEventDelegate:create()

					slot8:registerLayerEndedHandler(uv8)
					slot7:setDelegate(slot8)
					slot7:registerScriptHandler(function (slot0)
						if slot0 == "exit" then
							uv0(uv1)
						end
					end)
					table.insert(uv5, slot7)
				end
			end
		end
	end

	slot14 = false
	slot15 = false

	if tonumber(uv1.firstAttack) == 1 then
		slot14 = true

		if slot1 == nil then
			slot14 = false
			slot15 = true
		end
	else
		slot15 = true

		if slot2 == nil then
			slot14 = true
			slot15 = false
		end
	end

	function slot4(...)
		if uv0 ~= nil then
			slot1 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/pet/cwdchup"), -1, CCString:create(""))

			setAdaptNode(slot1)
			slot1:setPosition(ccps(0.5, 0.5))
			uv1:addChild(slot1, 2000)
			slot1:registerScriptHandler(function (slot0)
				if slot0 == "exit" then
					uv0(uv1)
				end
			end)
			table.insert(uv3, slot1)

			slot2 = tolua.cast(slot1:getChildByTag(1002), "CCXMLSprite")
			slot3 = nil

			if file_exists("images/pet/body_img/" .. DB_Pet.getDataById(uv0).roleModelID) then
				slot2:setReplaceFileName(CCString:create("images/pet/body_img/" .. slot0.roleModelID))
			end

			slot2:setVisible(false)

			slot4 = createPetInfoPanel(uv0, uv4.team2, uv5)

			slot4:setPosition(ccps(1.5, 0.5))
			uv1:addChild(slot4, 2005)
			slot4:runAction(CCMoveTo:create(0.4, ccps(0.55, 0.5)))
			slot4:registerScriptHandler(function (slot0)
				if slot0 == "exit" then
					uv0(uv1)
				end
			end)
			table.insert(uv3, slot4)

			slot6 = BTAnimationEventDelegate:create()

			slot6:registerLayerEndedHandler(function (...)
				uv0:removeFromParentAndCleanup(true)

				uv0 = nil

				uv1:removeFromParentAndCleanup(true)

				uv1 = nil

				uv2(2)
			end)
			slot1:setDelegate(slot6)

			return
		end

		uv7()
	end

	if tonumber(uv1.firstAttack) == 1 then
		slot10 = "images/battle/strength/firstAttack.png"
		slot11 = "images/battle/strength/lastAttack.png"

		function (...)
			require("db/DB_Pet")

			if uv0 ~= nil then
				slot1 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/pet/cwdchdown"), -1, CCString:create(""))

				setAdaptNode(slot1)
				slot1:setPosition(ccps(0.5, 0.5))
				uv1:addChild(slot1, 2000)
				slot1:registerScriptHandler(function (slot0)
					if slot0 == "exit" then
						uv0(uv1)
					end
				end)
				table.insert(uv3, slot1)

				slot2 = tolua.cast(slot1:getChildByTag(1002), "CCXMLSprite")
				slot3 = nil

				if file_exists("images/pet/body_img/" .. DB_Pet.getDataById(uv0).roleModelID) then
					slot2:setReplaceFileName(CCString:create("images/pet/body_img/" .. slot0.roleModelID))
				end

				slot2:setVisible(false)

				slot4 = createPetInfoPanel(uv0, uv4.team1, uv5)

				slot4:setPosition(ccps(-0.5, 0.5))
				uv1:addChild(slot4, 2005)
				slot4:runAction(CCMoveTo:create(0.4, ccps(0.55, 0.5)))
				slot4:registerScriptHandler(function (slot0)
					if slot0 == "exit" then
						uv0(uv1)
					end
				end)
				table.insert(uv3, slot4)

				slot6 = BTAnimationEventDelegate:create()

				slot6:registerLayerEndedHandler(function (...)
					uv0:removeFromParentAndCleanup(true)

					uv0 = nil

					uv1:removeFromParentAndCleanup(true)

					uv1 = nil

					uv2(1)
				end)
				slot1:setDelegate(slot6)

				return
			end

			uv7()
		end()
	else
		slot11 = "images/battle/strength/firstAttack.png"
		slot10 = "images/battle/strength/lastAttack.png"

		slot4()
	end
end

function getWarCardSide(slot0)
	if uv0.team1.arrCar then
		for slot5, slot6 in pairs(slot1) do
			if tonumber(slot6.cid) == tonumber(slot0) then
				return uv1
			end
		end
	end

	if uv0.team2.arrCar then
		for slot6, slot7 in pairs(slot2) do
			if tonumber(slot7.cid) == tonumber(slot0) then
				return uv2
			end
		end
	end
end

function getWarCarInfo(slot0)
	if uv0.team1.arrCar then
		for slot5, slot6 in pairs(slot1) do
			if tonumber(slot6.cid) == tonumber(slot0) then
				return slot6
			end
		end
	end

	if uv0.team2.arrCar then
		for slot6, slot7 in pairs(slot2) do
			if tonumber(slot7.cid) == tonumber(slot0) then
				return slot7
			end
		end
	end
end

function showWarCarAction(slot0)
	if tonumber(uv0.attacker) > 200 then
		slot0()

		return
	end

	require("db/DB_Warcar_skill")
	require("db/DB_Item_warcar")

	slot2 = getWarCardSide(slot1)
	slot6 = DB_Warcar_skill.getDataById(DB_Item_warcar.getDataById(tonumber(getWarCarInfo(slot1).tid)).showSkillId)

	addWarCarMask()
	playWarCarAtkAction(function (...)
		removeWarCarMask()
		uv0()
	end)
end

function addWarCarAim()
	for slot4, slot5 in pairs(uv0.arrReaction) do
		-- Nothing
	end

	for slot4, slot5 in pairs({
		[slot5.defender] = slot5.defender
	}) do
		slot6 = getCardByHid(slot5)
		slot7 = XMLSprite:create("images/battle/warcar/effect/jujimiaozhunTX/jujimiaozhunTX")

		slot7:setPosition(ccpsprite(0.5, 0.5, slot6))
		slot6:addChild(slot7, 10, uv1)
		table.insert(uv2, slot7)
	end

	AudioUtil.playEffect("audio/effect/aim.mp3")
end

function removeCarAim()
	for slot4, slot5 in pairs(uv0.arrReaction) do
		-- Nothing
	end

	for slot4, slot5 in pairs({
		[slot5.defender] = slot5.defender
	}) do
		getCardByHid(slot5):removeChildByTag(uv1, true)
	end
end

function playWarCarHitAction(slot0)
	slot1 = uv0.attacker
	slot2 = getWarCardSide(slot1)
	slot7 = DB_Warcar_skill.getDataById(DB_Item_warcar.getDataById(tonumber(getWarCarInfo(slot1).tid)).showSkillId).hitEffect
	slot8 = {
		[slot13.defender] = {}
	}

	for slot12, slot13 in pairs(uv0.arrReaction) do
		slot8[slot13.defender].cardId = slot13.defender

		for slot18, slot19 in pairs(slot13.arrDamage) do
			slot14 = 0 + tonumber(slot19.damageValue)
		end

		slot8[slot13.defender].damage = slot14
	end

	slot9 = 0
	slot10 = table.count(slot8)

	function slot11(...)
		uv0 = uv0 + 1

		if uv0 == uv1 then
			if uv2 then
				uv2()
			end

			return
		end
	end

	if slot6.hitMusic then
		AudioUtil.playEffect("audio/effect/" .. slot12 .. ".mp3")
	end

	for slot16, slot17 in pairs(slot8) do
		slot18 = getCardByHid(slot17.cardId)
		slot19 = XMLSprite:create("images/battle/effect/" .. slot7)

		slot19:setPosition(ccpsprite(0.5, 0.5, slot18))
		slot19:setReplayTimes(1, true)
		slot19:setScale(g_fElementScaleRatio)
		slot18:addChild(slot19, 10, uv1)
		slot19:registerEndCallback(function (...)
			showCardNumber(uv0, -uv1.damage, 0)

			uv2[uv1.cardId] = uv2[uv1.cardId] - uv1.damage

			BattleCardUtil.setCardHp(uv0, uv2[uv1.cardId] / uv3[uv1.cardId])
			performWithDelay(uv0, function (...)
				uv0()
			end, 0.5)
		end)
		table.insert(uv4, slot19)
	end

	showTotalDamage(uv0)
end

function addWarCarMask()
	slot5 = 0
	uv0 = CCLayerColor:create(ccc4(slot5, 0, 0, 200))
	slot4 = 100

	uv1:addChild(uv0, slot4)

	uv2 = {}

	for slot4, slot5 in pairs(uv3.arrReaction) do
		-- Nothing
	end

	for slot4, slot5 in pairs({
		[slot5.defender] = slot5.defender
	}) do
		slot6 = getCardByHid(slot5)
		uv2[slot5] = {
			card = slot6
		}
		slot7, slot8 = slot6:getPosition()
		uv2[slot5].position = ccp(slot7, slot8)
		uv2[slot5].parent = slot6:getParent()
		uv2[slot5].tag = slot6:getTag()

		slot6:retain()
		slot6:removeFromParentAndCleanup(false)
		slot6:setScale(uv4:getScale())
		uv0:addChild(slot6, 10, slot6:getTag())
		slot6:release()
		slot6:setPosition(slot6:convertToWorldSpace(ccpsprite(0.5, 0.5, slot6)))
	end

	uv5 = true
end

function removeWarCarMask()
	for slot3, slot4 in pairs(uv0) do
		slot5 = slot4.card

		slot5:retain()
		slot5:removeFromParentAndCleanup(false)
		slot5:setPosition(slot4.position)
		slot5:setScale(1)
		slot4.parent:addChild(slot5, 10, slot4.tag)
		slot5:release()
	end

	if uv1 then
		uv1:removeFromParentAndCleanup(true)

		uv1 = nil
		uv0 = {}
		uv2 = false
	end
end

function playBulletEffect(slot0, slot1)
	slot2 = uv0.attacker
	slot3 = getWarCardSide(slot2)
	slot8 = DB_Warcar_skill.getDataById(DB_Item_warcar.getDataById(tonumber(getWarCarInfo(slot2).tid)).showSkillId).bulletEffect
	slot9 = {
		[slot14.defender] = {}
	}

	for slot13, slot14 in pairs(uv0.arrReaction) do
		slot9[slot14.defender].cardId = slot14.defender
	end

	slot10 = 0
	slot11 = table.count(slot9)

	function slot12(...)
		uv0 = uv0 + 1

		if uv0 == uv1 then
			if uv2 then
				uv2()
			end

			return
		end
	end

	if slot7.bulletMusic then
		AudioUtil.playEffect("audio/effect/" .. slot13 .. ".mp3")
	end

	for slot17, slot18 in pairs(slot9) do
		slot19 = getCardByHid(slot18.cardId)
		slot21 = XMLSprite:create("images/battle/warcar/effect/" .. slot8 .. "/" .. slot8)

		slot21:setPosition(slot0)
		slot21:setScale(g_fElementScaleRatio)
		uv1:addChild(slot21, 100)

		slot22 = 0
		slot23 = slot0
		slot24 = slot19:convertToWorldSpace(ccpsprite(0.5, 0.5, slot19))
		slot25 = ccp(slot24.x - slot23.x, slot24.y - slot23.y)

		if slot25.x < 0 then
			slot26 = 360 - math.deg(math.atan(math.abs(slot25.x / slot25.y)))
		end

		if slot25.y < 0 then
			slot26 = slot26 > 180 and 540 - slot26 or 180 - slot26
		end

		slot21:setRotation(slot26)

		slot27 = CCArray:create()

		slot27:addObject(CCMoveTo:create(0.2, slot20))
		slot27:addObject(CCCallFunc:create(function (...)
			uv0:removeFromParentAndCleanup(true)

			uv0 = nil

			uv1()
		end))
		slot21:runAction(CCSequence:create(slot27))
		table.insert(uv2, slot21)
	end
end

function playWarCarAtkAction(slot0)
	if tonumber(uv0.attacker) > 200 then
		callback()

		return
	end

	require("db/DB_Warcar_skill")
	require("db/DB_Item_warcar")

	slot6 = DB_Warcar_skill.getDataById(DB_Item_warcar.getDataById(tonumber(getWarCarInfo(slot1).tid)).showSkillId)
	slot7 = CCSprite:create("images/battle/warcar/icon/" .. slot6.icon)

	slot7:setPosition(ccps(0.5, 0.5))
	slot7:setAnchorPoint(ccp(0.5, 0.5))
	slot7:setScale(uv1:getScale())
	uv2:addChild(slot7)

	slot8 = slot6.modelEffect
	slot9 = XMLSprite:create("images/battle/warcar/effect/" .. slot8 .. "/" .. slot8)

	if getWarCardSide(slot1) == uv3 then
		slot9:setPosition(g_winSize.width / 2, 0)
		slot9:setScale(g_fElementScaleRatio)
	else
		slot9:setScale(-1 * uv1:getScale())
		slot9:setPosition(g_winSize.width / 2, g_winSize.height)
	end

	uv2:addChild(slot9, 100)
	table.insert(uv4, slot9)
	slot9:setReplayTimes(1, true)
	slot9:registerKeyFrameCallback(function (slot0)
		if string.split(slot0, "|")[1] == "aim_start" then
			print("playWarCarAtkAction aim_start")
			addWarCarAim()
		elseif slot2 == "aim_end" then
			print("playWarCarAtkAction aim_end")
			removeCarAim()
			uv0:removeFromParentAndCleanup(true)
		elseif slot2 == "hit" then
			print("playWarCarAtkAction hit")
			playWarCarHitAction(function (...)
				if uv0 then
					uv0()
				end
			end)
		elseif slot2 == "bullet" then
			print("playWarCarAtkAction bullet")

			slot4 = uv2:getFrameByName(slot1[2])

			playBulletEffect(slot4:convertToWorldSpace(ccpsprite(tonumber(slot1[3]), tonumber(slot1[4]), slot4)), function ()
				playWarCarHitAction(function (...)
					if uv0 then
						uv0()
					end
				end)
			end)
		end
	end)

	if slot6.enterMusic then
		AudioUtil.playEffect("audio/effect/" .. slot10 .. ".mp3")
	end
end

function getCardByHid(slot0)
	slot1 = nil

	for slot5 = 1, #uv0.team1.arrHero do
		if tonumber(uv0.team1.arrHero[slot5].hid) == tonumber(slot0) then
			slot1 = tolua.cast(uv1:getChildByTag(1000 + slot6.position), "CCXMLSprite")

			break
		end
	end

	for slot5 = 1, #uv0.team2.arrHero do
		if tonumber(uv0.team2.arrHero[slot5].hid) == tonumber(slot0) then
			slot1 = tolua.cast(uv2:getChildByTag(3000 + slot6.position), "CCXMLSprite")

			break
		end
	end

	if uv3 then
		for slot5, slot6 in pairs(uv3) do
			if tonumber(slot5) == tonumber(slot0) then
				slot1 = slot6.card

				break
			end
		end
	end

	return slot1
end

function doBattleNpc()
	slot0 = CCArray:create()

	slot0:addObject(CCInteger:create(uv0))
	slot0:addObject(CCInteger:create(uv1))
	slot0:addObject(CCInteger:create(uv2))
	slot0:addObject(CCInteger:create(uv3))
	slot0:addObject(CCArray:create())
	require("script/utils/LuaUtil")

	slot1 = CCDictionary:create()

	for slot5 = 0, 5 do
		if uv4["" .. slot5] ~= nil and slot6 ~= 0 then
			slot1:setObject(CCInteger:create(slot6), "" .. slot5)
		else
			slot1:setObject(CCInteger:create(0), "" .. slot5)
		end
	end

	slot0:addObject(slot1)

	if uv5 == 1 then
		RequestCenter.doBattle(BattleLayer.doBattleCallback, slot0)
	elseif uv5 == 2 then
		slot2 = Network.argsHandler(uv0, uv3)

		slot2:addObject(slot1)
		RequestCenter.ecopy_doBattle(BattleLayer.doBattleCallback, slot2)
	elseif uv5 == 4 then
		RequestCenter.tower_defeatMonster(BattleLayer.doBattleCallback, Network.argsHandler(uv0, uv3))
	elseif uv5 == 5 then
		RequestCenter.tower_defeatSpecialTower(BattleLayer.doBattleCallback, Network.argsHandler(uv0, uv3))
	elseif uv5 == 6 then
		RequestCenter.Hcopy_doBattle(BattleLayer.doBattleCallback, slot0)
	else
		slot2 = Network.argsHandler(uv0, uv1, uv3)

		slot2:addObject(slot1)
		RequestCenter.acopy_doBattle(BattleLayer.doBattleCallback, slot2)
	end
end

function doBattle()
	slot0 = CCArray:create()

	slot0:addObject(CCInteger:create(uv0))
	slot0:addObject(CCInteger:create(uv1))
	slot0:addObject(CCInteger:create(uv2))

	slot4 = CCInteger
	slot6 = slot4

	slot0:addObject(slot4.create(slot6, uv3))

	newFormation = PlayerCardLayer.getFormation()
	slot1 = false

	for slot5, slot6 in pairs(newFormation) do
		if uv4[slot5] ~= slot6 then
			slot1 = true
		end
	end

	for slot5, slot6 in pairs(uv4) do
		if newFormation[slot5] ~= slot6 then
			slot1 = true
		end
	end

	uv4 = {}

	for slot5, slot6 in pairs(newFormation) do
		uv4["" .. slot5] = slot6
	end

	require("script/utils/LuaUtil")

	slot2 = CCDictionary:create()

	if slot1 then
		for slot6 = 0, 5 do
			if uv4["" .. slot6] ~= nil and slot7 ~= 0 then
				slot2:setObject(CCInteger:create(slot7), "" .. slot6)
			end
		end
	end

	slot6 = slot2

	slot0:addObject(slot6)

	for slot6 = 0, 5 do
		if uv4["" .. slot6] == nil then
			uv4["" .. slot6] = 0
		end
	end

	require("script/model/user/FormationModel")
	FormationModel.setFormationInfo(uv4)

	if uv5 == 1 then
		RequestCenter.doBattle(BattleLayer.doBattleCallback, slot0)
	elseif uv5 == 2 then
		slot3 = Network.argsHandler(uv0, uv3)

		slot3:addObject(slot2)
		RequestCenter.ecopy_doBattle(BattleLayer.doBattleCallback, slot3)
	elseif uv5 == 4 then
		RequestCenter.tower_defeatMonster(BattleLayer.doBattleCallback, Network.argsHandler(uv0, uv3))
	elseif uv5 == 5 then
		RequestCenter.tower_defeatSpecialTower(BattleLayer.doBattleCallback, Network.argsHandler(uv0, uv3))
	elseif uv5 == 6 then
		RequestCenter.Hcopy_doBattle(BattleLayer.doBattleCallback, slot0)
	else
		slot3 = Network.argsHandler(uv0, uv1, uv3)

		slot3:addObject(slot2)
		RequestCenter.acopy_doBattle(BattleLayer.doBattleCallback, slot3)
	end
end

function getFormationCallBack(slot0, slot1, slot2)
	require("script/utils/LuaUtil")
	require("script/model/user/FormationModel")

	uv0 = {}

	for slot6, slot7 in pairs(slot1.ret) do
		uv0["" .. tonumber(slot6) - 1] = tonumber(slot7)
	end

	FormationModel.setFormationInfo(uv0)

	uv1 = uv0

	enterBattle2(uv2, uv3, uv4)
end

function replay()
	CCDirector:sharedDirector():getScheduler():setTimeScale(uv0)

	uv1 = {}
	uv2 = {}
	uv3 = {}
	uv4 = 0
	uv5 = {}
	uv6 = {}
	uv7 = 0
	uv8 = 0
	uv9 = 0
	uv10 = {}
	uv11 = 0
	uv12 = {}
	uv13 = true

	if uv14 ~= nil then
		uv14:retain()
		uv14:removeFromParentAndCleanup(false)
	end

	uv15 = 1

	uv16:removeAllChildrenWithCleanup(true)

	uv17 = CCLayer:create()

	uv17:setPosition(ccp(0, 0))

	slot5 = 1188

	uv16:addChild(uv17, 0, slot5)

	uv18 = 0

	clearEnemyLayer()

	slot1 = uv16:getContentSize().width * 0.2

	for slot5 = 1, #uv19.team2.arrHero do
		slot6 = slot0[slot5]
		slot7 = slot6.position
		slot8 = createBattleCard(slot6.hid)

		slot8:setTag(3000 + slot7)
		slot8:setAnchorPoint(ccp(0.5, 0.5))
		slot8:setPosition(getEnemyCardPointByPosition(slot7))
		slot8:setBasePoint(ccp(slot8:getPositionX(), slot8:getPositionY()))
		uv17:addChild(slot8, 5 - slot5)

		slot9 = 0
		uv1[slot6.hid] = slot6.maxHp
		uv2[slot6.hid] = (slot6.currHp ~= nil or slot6.maxHp) and slot6.currHp
		uv3[slot6.hid] = slot6.currRage == nil and 0 or tonumber(slot6.currRage)

		if uv3[slot6.hid] == nil then
			uv3[slot6.hid] = 0
		end

		BattleCardUtil.setCardAnger(slot8, uv3[slot6.hid], slot6.hid)
	end

	uv17:setPosition(ccp(0, -uv16:getPositionY() / uv16:getScale()))

	uv20 = {}
	uv10 = {}

	for slot7 = 1, #uv19.team1.arrHero do
		if slot3[slot7].position ~= nil then
			uv20["" .. slot8.position] = slot8.hid
			slot9 = 0

			if ((slot8.currHp ~= nil or slot8.maxHp) and slot8.currHp) == 0 then
				uv10[table.maxn(uv10) + 1] = slot8.hid
			else
				uv1[slot8.hid] = slot8.maxHp
				uv2[slot8.hid] = slot9
				uv3[slot8.hid] = slot8.currRage == nil and 0 or tonumber(slot8.currRage)

				if uv3[slot8.hid] == nil then
					uv3[slot8.hid] = 0
				end
			end
		end
	end

	uv21 = PlayerCardLayer.getPlayerCardLayer(CCSizeMake(640, 600), uv20)

	uv21:setPosition(ccp(0, -uv16:getPositionY() / uv16:getScale()))

	slot7 = ccp

	uv21:setAnchorPoint(slot7(0, 0))

	for slot7 = 1, #slot3 do
		if slot3[slot7].position ~= nil then
			uv20["" .. slot8.position] = slot8.hid

			if uv21:getChildByTag(1000 + tonumber(slot8.position)) ~= nil then
				BattleCardUtil.setCardAnger(tolua.cast(slot9, "CCXMLSprite"), uv3[slot8.hid], slot8.hid)

				if uv2[slot8.hid] and uv1[slot8.hid] then
					BattleCardUtil.setCardHp(slot9, uv2[slot8.hid] / uv1[slot8.hid])
				end
			end
		end
	end

	slot7 = uv10

	for slot7 = 1, table.maxn(slot7) do
		slot8 = -1

		for slot12 = 1, #slot3 do
			if slot3[slot12].hid == uv10[slot7] then
				slot8 = slot13.position

				break
			end
		end

		if uv21:getChildByTag(1000 + slot8) ~= nil then
			slot10 = CCArray:create()

			slot10:addObject(CCFadeIn:create(0.5))
			slot10:addObject(CCFadeOut:create(0.5))
			slot9:runAction(CCRepeatForever:create(CCSequence:create(slot10)))
		end
	end

	showStrength()
	uv16:addChild(uv21, 0, 1177)

	uv15 = 1

	PlayerCardLayer.setSwitchable(false)
	uv22:setVisible(false)
	BattleCardUtil.setNameVisible(true)
	showPetAtBattle(function (...)
		currentRoundOver()
		showNextMove()
	end)
	addCraftInBattle()
	uv23:setVisible(true)
end

function showBattleWithString(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11)
	init()
	require("script/utils/LuaUtil")

	uv0 = amf3.decode(Base64.decodeWithZip(slot0))

	BattleCardUtil.setBattleData(uv0)
	printTable("m_battleInfo", uv0)

	uv1 = changeSelfTeam1()
	uv2 = nil
	uv3 = {}

	if slot0 == nil then
		require("script/ui/tip/AlertTip")
		AlertTip.showAlert(GetLocalizeStringBy("key_2070"), nil, false, nil)
		closeLayer()

		return
	end

	if slot7 == nil then
		slot7 = true
	end

	uv4 = slot7

	if slot8 == nil then
		slot8 = false
	end

	m_isShowStrengthNumber = slot8

	require("script/ui/login/LoginScene")
	LoginScene.setBattleStatus(true)

	uv5 = true
	uv6 = slot5
	uv7 = slot10 or false
	uv8 = {}

	if slot4 == nil then
		slot4 = uv9 or slot4
	end

	AudioUtil.playBgm("audio/bgm/" .. slot4)

	uv10 = {}
	uv11 = {}
	uv12 = {}
	uv13 = 0
	uv14 = {}
	uv15 = {}
	uv16 = 0
	uv17 = 0
	uv18 = 0
	uv19 = {}
	uv20 = 0
	uv21 = false
	uv22 = kNormalCopy
	uv23 = true
	uv24 = slot1
	uv25 = slot2

	if uv25 ~= nil then
		uv25:retain()
	end

	uv22 = slot9 or kNormalCopy

	CCNotificationCenter:sharedNotificationCenter():postNotification("NC_BeginFight")

	uv26 = 1
	uv27 = CCLayer:create()

	uv27:setTouchEnabled(true)
	uv27:registerScriptTouchHandler(layerTouch, false, -498, true)
	initUperLayer()
	uv27:addChild(uv28, 200)

	if slot3 == nil then
		slot3 = "chengqiang.jpg"
	end

	initBackground(slot3, slot11)
	initPlayerCardHidMap()
	uv27:addChild(uv29)

	uv30 = slot6

	if uv30 ~= nil then
		uv27:addChild(uv30, 9)
	end

	uv31 = CCLayer:create()

	uv31:setPosition(ccp(0, 0))
	uv29:addChild(uv31, 0, 1188)

	uv32 = 0
	uv33 = CCArray:create()

	uv33:retain()

	slot15 = CCDirector:sharedDirector():getRunningScene():getChildren()
	slot19 = slot15

	for slot19 = 1, slot15.count(slot19) do
		if tolua.cast(slot15:objectAtIndex(slot19 - 1), "CCNode") ~= nil and slot20:isVisible() == true and slot20:getTag() ~= 90901 and slot20:getTag() ~= kFogEffectTag then
			slot20:setVisible(false)
			uv33:addObject(slot20)
		end
	end

	slot14:addChild(uv27, 1000, 67890)

	slot16 = CCLayerColor:create(ccc4(1, 1, 1, 255))

	uv27:addChild(slot16, 9999)

	slot17 = CCArray:create()

	slot17:addObject(CCFadeOut:create(1))
	slot17:addObject(CCCallFuncN:create(removeSelf))
	slot16:runAction(CCSequence:create(slot17))

	if uv22 == kMoneyTree then
		require("script/battle/PlayerMoneyTreeLayer")
		PlayerMoneyTreeLayer.setBoosLife(tonumber(uv0.team2.arrHero[1].maxHp))
	end

	initPlayerCardHidMap()

	uv34 = {}
	uv35 = {}
	uv36 = {}
	uv37 = slot13.appraisal
	uv38 = 1000
	uv39 = {}
	uv40 = false

	clearEnemyLayer()

	slot20 = uv29:getContentSize().width * 0.2

	for slot24 = 1, #uv0.team2.arrHero do
		slot25 = slot19[slot24]
		slot26 = slot25.position
		slot27 = createBattleCard(slot25.hid)

		slot27:setTag(3000 + slot26)
		slot27:setAnchorPoint(ccp(0.5, 0.5))
		slot27:setPosition(getEnemyCardPointByPosition(slot26))
		slot27:setBasePoint(ccp(slot27:getPositionX(), slot27:getPositionY()))
		uv31:addChild(slot27, 5 - slot24)

		slot28 = 0
		uv10[slot25.hid] = slot25.maxHp
		uv11[slot25.hid] = (slot25.currHp ~= nil or slot25.maxHp) and slot25.currHp
		uv12[slot25.hid] = slot25.currRage == nil and 0 or tonumber(slot25.currRage)

		if uv12[slot25.hid] == nil then
			uv12[slot25.hid] = 0
		end

		BattleCardUtil.setCardAnger(slot27, uv12[slot25.hid], slot25.hid)

		if uv11[slot25.hid] and uv10[slot25.hid] then
			BattleCardUtil.setCardHp(slot27, uv11[slot25.hid] / uv10[slot25.hid])
		end
	end

	uv31:setPosition(ccp(0, -uv29:getPositionY() / uv29:getScale()))

	uv41 = {}
	uv19 = {}

	for slot26 = 1, #uv0.team1.arrHero do
		if slot22[slot26].position ~= nil then
			uv41["" .. slot27.position] = slot27.hid
			slot28 = 0

			if ((slot27.currHp ~= nil or slot27.maxHp) and slot27.currHp) == 0 then
				uv19[table.maxn(uv19) + 1] = slot27.hid
			else
				uv10[slot27.hid] = slot27.maxHp
				uv11[slot27.hid] = slot28
				uv12[slot27.hid] = slot27.currRage == nil and 0 or tonumber(slot27.currRage)

				if uv12[slot27.hid] == nil then
					uv12[slot27.hid] = 0
				end
			end
		end
	end

	slot27 = 640
	uv42 = PlayerCardLayer.getPlayerCardLayer(CCSizeMake(slot27, 600), uv41)

	uv42:setPosition(ccp(0, -uv29:getPositionY() / uv29:getScale()))

	slot26 = ccp

	uv42:setAnchorPoint(slot26(0, 0))

	for slot26, slot27 in pairs(slot22) do
		if slot27.position ~= nil then
			uv41["" .. slot27.position] = slot27.hid
			slot28 = uv42:getChildByTag(1000 + tonumber(slot27.position))

			print("create card", slot28)

			if slot28 ~= nil then
				print("setCardAnger player:", uv12[slot27.hid])
				BattleCardUtil.setCardAnger(tolua.cast(slot28, "CCXMLSprite"), uv12[slot27.hid], slot27.hid)

				if uv11[slot27.hid] and uv10[slot27.hid] then
					BattleCardUtil.setCardHp(slot28, uv11[slot27.hid] / uv10[slot27.hid])
				end

				BattleCardUtil.setCardAnger(slot28, uv12[slot27.hid], slot27.hid)
			end
		end
	end

	slot26 = uv19

	for slot26 = 1, table.maxn(slot26) do
		slot27 = -1

		for slot31 = 1, #slot22 do
			if slot22[slot31].hid == uv19[slot26] then
				slot27 = slot32.position

				break
			end
		end

		if uv42:getChildByTag(1000 + slot27) ~= nil then
			slot29 = CCArray:create()

			slot29:addObject(CCFadeIn:create(0.5))
			slot29:addObject(CCFadeOut:create(0.5))
			slot28:runAction(CCRepeatForever:create(CCSequence:create(slot29)))
		end
	end

	showStrength()
	uv29:addChild(uv42, 0, 1177)

	uv26 = 1

	PlayerCardLayer.setSwitchable(false)
	uv43:setVisible(false)
	BattleCardUtil.setNameVisible(true)
	showStartEffect(function (...)
		showPetAtBattle(function (...)
			currentRoundOver()

			slot0 = CCArray:create()

			slot0:addObject(CCDelayTime:create(2))
			slot0:addObject(CCCallFunc:create(showNextMove))
			uv0:runAction(CCSequence:create(slot0))

			isBattleOnGoing = true
		end)
		addCraftInBattle()
	end)
end

function enterBattle(slot0, slot1, slot2, slot3, slot4, slot5)
	uv0 = nil
	uv1 = nil
	m_isShowStrengthNumber = false
	uv2 = {}
	uv3 = p_isShowSkip or false

	init()
	require("db/DB_Stronghold")

	if DB_Stronghold.getDataById(slot1) ~= nil and slot6.fire_music ~= nil then
		AudioUtil.playBgm("audio/bgm/" .. slot6.fire_music)
	else
		AudioUtil.playBgm("audio/bgm/" .. uv4)
	end

	uv5 = slot0
	uv6 = slot1
	uv7 = slot2
	uv8 = slot3
	uv9 = slot4 == nil and 1 or slot4

	if uv9 ~= 1 and uv9 ~= 6 then
		uv7 = 1
	end

	require("script/model/DataCache")

	slot8 = 0

	for slot12 = 1, #DataCache.getNormalCopyData() do
		if slot7[slot12].va_copy_info ~= nil and slot13.progress ~= nil and slot13.progress["" .. uv6] ~= nil then
			slot8 = tonumber(slot13.progress["" .. uv6]) == nil and 0 or tonumber(slot13.progress["" .. uv6]) - 2

			break
		end
	end

	if uv7 <= slot8 and uv7 > 0 then
		uv10 = false
	else
		uv10 = true
	end

	uv11 = {}
	uv12 = {}
	uv13 = {}
	uv14 = 0
	uv15 = {}
	uv16 = {}
	uv17 = 0
	uv18 = 0
	uv19 = 0
	uv20 = nil
	uv21 = {}
	uv22 = 0
	uv23 = nil
	uv24 = {}
	slot9 = CCArray:create()

	slot9:addObject(CCInteger:create(slot0))
	slot9:addObject(CCInteger:create(slot1))
	slot9:addObject(CCInteger:create(slot2))
	RequestCenter.getFormationInfo(BattleLayer.getFormationCallBack)
	CCNotificationCenter:sharedNotificationCenter():postNotification("NC_BeginFight")

	isBattleOnGoing = true
end

function enterBaseLvCallback(slot0, slot1, slot2)
	if slot1.err ~= "ok" then
		require("script/ui/tip/AlertTip")
		AlertTip.showAlert(GetLocalizeStringBy("key_3168"), nil, false, nil)
		closeLayer()

		return
	end

	if slot1.ret == "execution" then
		require("script/ui/tip/AlertTip")
		AlertTip.showAlert(GetLocalizeStringBy("key_3355"), nil, false, nil)
		closeLayer()
	elseif slot1.ret == "bag" then
		require("script/ui/tip/AlertTip")
		AlertTip.showAlert(GetLocalizeStringBy("key_2027"), nil, false, nil)
		closeLayer()
	end
end

function enterBattle2(slot0, slot1, slot2)
	uv0 = 1

	initPlayerCardHidMap()

	uv1 = CCLayer:create()

	uv1:setTouchEnabled(true)
	uv1:registerScriptTouchHandler(layerTouch, false, -498, true)

	slot3 = false

	initUperLayer()
	uv1:addChild(uv2, 200)
	require("db/DB_Stronghold")

	if slot2 == 0 then
		initBackground(DB_Stronghold.getDataById(slot1).fire_scene, 1)
	else
		initBackground(slot4.fire_scene, tonumber(slot4.startposition))
	end

	uv1:addChild(uv3)

	uv4 = CCLayer:create()

	uv4:setPosition(ccp(0, 0))
	uv3:addChild(uv4, 0, 1188)

	uv5 = 0
	slot5 = CCArray:create()

	slot5:addObject(CCInteger:create(slot0))
	slot5:addObject(CCInteger:create(slot1))
	slot5:addObject(CCInteger:create(slot2))

	if uv6 == 1 then
		RequestCenter.ncopy_enterBaseLevel(BattleLayer.enterBaseLvCallback, slot5)
	elseif uv6 == 2 then
		RequestCenter.ecopy_enterCopy(BattleLayer.enterBaseLvCallback, Network.argsHandler(uv7))
	elseif uv6 == 4 then
		RequestCenter.tower_enterLevel(BattleLayer.enterBaseLvCallback, Network.argsHandler(uv7))
	elseif uv6 == 5 then
		RequestCenter.tower_enterSpecailLevel(BattleLayer.enterBaseLvCallback, Network.argsHandler(uv7))
	elseif uv6 == 6 then
		RequestCenter.Hcopy_enterBaseLevel(BattleLayer.enterBaseLvCallback, slot5)
	else
		RequestCenter.acopy_enterBaseLevel(BattleLayer.enterBaseLvCallback, Network.argsHandler(uv7, uv8))
	end

	uv9 = CCArray:create()

	uv9:retain()

	slot7 = CCDirector:sharedDirector():getRunningScene():getChildren()
	slot11 = slot7

	for slot11 = 1, slot7.count(slot11) do
		if tolua.cast(slot7:objectAtIndex(slot11 - 1), "CCNode") ~= nil and slot12:isVisible() == true and slot12:getTag() ~= kFogEffectTag then
			slot12:setVisible(false)
			uv9:addObject(slot12)
		end
	end

	slot6:addChild(uv1, 1000, 67890)

	slot8 = CCLayerColor:create(ccc4(1, 1, 1, 255))

	uv1:addChild(slot8, 9999)

	slot9 = CCArray:create()

	slot9:addObject(CCFadeOut:create(1))
	slot9:addObject(CCCallFuncN:create(removeSelf))
	slot8:runAction(CCSequence:create(slot9))
	initPlayerCardHidMap()

	uv10 = PlayerCardLayer.getPlayerCardLayer(CCSizeMake(640, 600), uv11)

	uv10:setPosition(ccp(0, -uv3:getPositionY() / uv3:getScale()))
	uv10:setAnchorPoint(ccp(0, 0))
	uv3:addChild(uv10, 0, 1177)
	PlayerCardLayer.setSwitchable(false)

	slot11 = {
		id = WarcraftData.getUsed() or 0,
		level = WarcraftData.getUsedWarcraftLevel() or 0
	}

	print("id", WarcraftData.getUsed(), "level", WarcraftData.getUsedWarcraftLevel())
	printTable("craftInfo", slot11)

	if slot11 then
		addCraftInBattle(slot11)
	end

	showStartEffect(function (...)
		showNextArmy()

		if uv0 then
			slot0 = CCArray:create()

			slot0:addObject(CCDelayTime:create(1))
			slot0:addObject(CCCallFunc:create(move1))
			uv1:runAction(CCSequence:create(slot0))
		end
	end)
end

function addCraftInBattle(slot0)
	require("db/DB_Method")

	slot1 = slot0

	print("addCraftInBattle team1CraftId", team1CraftId)

	if tonumber((slot0 and slot0 or uv0.team1.craft or {
		id = 0,
		level = 0
	}).id) ~= 0 and tonumber(DB_Method.getDataById(slot1.id).needmethodlv) <= tonumber(slot1.level) then
		require("db/DB_Method")

		slot3 = DB_Method.getDataById(slot1.id).effect
		slot5 = CCLayerSprite:layerSpriteWithName(CCString:create("images/warcraft/effect/" .. slot3 .. "/" .. slot3), -1, CCString:create(""))

		slot5:setPosition(uv1:convertToNodeSpace(ccps(0.5, 0.21)))
		uv1:addChild(slot5, -1000)
		slot5:setCascadeColorEnabled(true)
		slot5:setColor(ccc3(200, 200, 200))
		print("addCraftInBattle 1")
	end

	if uv0 ~= nil and tonumber((uv0.team2.craft or {
		id = 0,
		level = 0
	}).id) ~= 0 and tonumber(DB_Method.getDataById(slot2.id).needmethodlv) <= tonumber(slot2.level) then
		require("db/DB_Method")

		slot4 = DB_Method.getDataById(slot2.id).effect
		slot6 = CCLayerSprite:layerSpriteWithName(CCString:create("images/warcraft/effect/" .. slot4 .. "/" .. slot4), -1, CCString:create(""))

		slot6:setPosition(uv2:convertToNodeSpace(ccps(0.5, 0.79)))
		slot6:setCascadeColorEnabled(true)
		slot6:setColor(ccc3(200, 200, 200))
		uv2:addChild(slot6, -1000)
		slot6:setScaleY(-1)
		print("addCraftInBattle 2")
	end
end

function playClearBufferEffect(slot0, slot1)
	if slot1 == nil or slot1 == "false" or slot1 == false then
		return
	end

	if tolua.isnull(slot0) then
		return
	end

	slot2 = XMLSprite:create("images/battle/effect/jiebuff")

	slot2:setReplayTimes(1, true)
	slot2:setPosition(ccpsprite(0.5, 0.5, slot0))
	slot0:addChild(slot2)
end

function getAttackDressId(...)
	slot1 = nil

	for slot5, slot6 in pairs(uv1.team1.arrHero) do
		if slot6.dress ~= nil and slot6.dress[tostring(1)] ~= nil and tonumber(slot6.dress[tostring(1)]) ~= 0 and tonumber(slot6.hid) == tonumber(uv0.attacker) then
			return slot6.dress[tostring(1)]
		end
	end

	for slot5, slot6 in pairs(uv1.team2.arrHero) do
		if slot6.dress ~= nil and slot6.dress[tostring(1)] ~= nil and tonumber(slot6.dress[tostring(1)]) ~= 0 and tonumber(slot6.hid) == slot0 then
			return slot6.dress[tostring(1)]
		end
	end

	return nil
end

function getAttackTid(...)
	for slot4, slot5 in pairs(uv1.team1.arrHero) do
		if tonumber(slot5.hid) == tonumber(uv0.attacker) then
			return slot5.htid
		end
	end

	for slot4, slot5 in pairs(uv1.team2.arrHero) do
		if tonumber(slot5.hid) == slot0 then
			return slot5.htid
		end
	end
end

function getAttackTurnedId()
	for slot4, slot5 in pairs(uv1.team1.arrHero) do
		if tonumber(slot5.hid) == tonumber(uv0.attacker) then
			return slot5.turned_id
		end
	end

	for slot4, slot5 in pairs(uv1.team2.arrHero) do
		if tonumber(slot5.hid) == slot0 then
			return slot5.turned_id
		end
	end
end

function getAssistHeroInfo()
	slot2 = BT_Skill.getDataById(uv0.action, getAttackDressId(), getAttackTid(), getAttackTurnedId()).cooperateSkillHeroId
	slot3 = nil
	slot5 = nil

	for slot9, slot10 in pairs(uv1.team1.arrHero) do
		if uv0.attacker == slot10.hid then
			slot5 = uv1.team1

			break
		end
	end

	slot5 = slot5 or uv1.team2

	for slot9, slot10 in pairs(slot5.arrHero) do
		if tonumber(HeroModel.getHeroModelId(slot10.htid)) == tonumber(slot2) then
			slot3 = slot10

			break
		end
	end

	for slot9, slot10 in pairs(slot5.littleFriend) do
		if tonumber(HeroModel.getHeroModelId(slot10.htid)) == tonumber(slot2) then
			slot3 = slot10

			break
		end
	end

	for slot9, slot10 in pairs(slot5.attrFriend) do
		if tonumber(HeroModel.getHeroModelId(slot10.htid)) == tonumber(slot2) then
			slot3 = slot10

			break
		end
	end

	return slot3
end

function getBattleHeroInfo(slot0)
	if table.isEmpty(uv0) then
		return
	end

	slot1 = nil

	for slot5, slot6 in pairs(uv0.team1.arrHero) do
		if tonumber(slot6.hid) == tonumber(slot0) then
			slot1 = slot6
		end
	end

	uv0.team1.littleFriend = uv0.team1.littleFriend or {}

	for slot5, slot6 in pairs(uv0.team1.littleFriend) do
		if tonumber(slot6.hid) == tonumber(slot0) then
			slot1 = slot6
		end
	end

	uv0.team1.attrFriend = uv0.team1.attrFriend or {}

	for slot5, slot6 in pairs(uv0.team1.attrFriend) do
		if tonumber(slot6.hid) == tonumber(slot0) then
			slot1 = slot6
		end
	end

	for slot5, slot6 in pairs(uv0.team2.arrHero) do
		if tonumber(slot6.hid) == tonumber(slot0) then
			slot1 = slot6
		end
	end

	uv0.team2.littleFriend = uv0.team2.littleFriend or {}

	for slot5, slot6 in pairs(uv0.team2.littleFriend) do
		if tonumber(slot6.hid) == tonumber(slot0) then
			slot1 = slot6
		end
	end

	uv0.team2.attrFriend = uv0.team2.attrFriend or {}

	for slot5, slot6 in pairs(uv0.team2.attrFriend) do
		if tonumber(slot6.hid) == tonumber(slot0) then
			slot1 = slot6
		end
	end

	return slot1
end

function getHeroCooperateIcon(slot0, slot1)
	slot3 = nil

	if getBattleHeroInfo(slot0).turned_id ~= 0 then
		require("script/ui/turnedSys/HeroTurnedData")

		slot3 = HeroTurnedData.getCooperateIcon(slot2.turned_id)
	else
		slot3 = HeroModel.getCooperateIcon(slot2.htid)
	end

	slot5 = ""

	for slot9, slot10 in pairs(string.split(slot3, ",")) do
		slot11 = string.split(slot10, "|")

		if slot11[1] == slot1 then
			slot5 = slot11[2]

			break
		end
	end

	print("getHeroCooperateIcon", slot5)

	return "images/battle/cooperate/hero/" .. slot5
end

function getHeroCooperateIconByHtid(slot0, slot1)
	slot2 = nil
	slot5 = ""

	for slot9, slot10 in pairs(string.split(HeroModel.getCooperateIcon(slot0), ",")) do
		slot11 = string.split(slot10, "|")

		if slot11[1] == slot1 then
			slot5 = slot11[2]

			break
		end
	end

	print("getHeroCooperateIconByHtid", slot5)

	return "images/battle/cooperate/hero/" .. slot5
end

function showHeroMask()
	slot2 = skill.getDataById(uv0.action)
	slot7 = tonumber

	table.insert({}, slot7(uv0.attacker))

	for slot7, slot8 in pairs(uv0.arrReaction) do
		table.insert(slot3, tonumber(slot8.defender))
	end

	slot4 = uv1:getContentSize().width
	slot6 = CCDirector:sharedDirector():getWinSize().height / uv1:getScale()

	if not tolua.cast(uv2:getChildByTag(kMaskLayerTag), "CCLayerColor") then
		slot8 = CCLayerColor:create(ccc4(0, 0, 0, 200), slot4, g_winSize.height / g_fScaleX / 2)

		slot8:setAnchorPoint(ccp(0.5, 0))
		slot8:setPosition(ccp(0.5 * slot4, 0))
		slot8:setTag(kMaskLayerTag)
		slot8:ignoreAnchorPointForPosition(false)
		uv2:addChild(slot8, 10)
	end

	if not tolua.cast(uv3:getChildByTag(kMaskLayerTag), "CCLayerColor") then
		slot9 = CCLayerColor:create(ccc4(0, 0, 0, 200), slot4, slot5 / 2)

		slot9:setAnchorPoint(ccp(0.5, 1))
		slot9:setPosition(ccp(0.5 * slot4, slot6))
		slot9:setTag(kMaskLayerTag)
		slot9:ignoreAnchorPointForPosition(false)
		uv3:addChild(slot9, 10)
	end

	for slot12, slot13 in pairs(uv4.team1.arrHero) do
		if table.isIn(slot3, tonumber(slot13.hid)) then
			uv2:reorderChild(tolua.cast(uv2:getChildByTag(1000 + slot13.position), "CCXMLSprite"), 20 + slot13.position)
		end
	end

	for slot12, slot13 in pairs(uv4.team2.arrHero) do
		if table.isIn(slot3, tonumber(slot13.hid)) then
			uv3:reorderChild(tolua.cast(uv3:getChildByTag(3000 + slot13.position), "CCXMLSprite"), 20 + slot13.position)
			print("m_enemyCardLayer ", slot13.hid)
		end
	end

	slot9 = "nuqizhubei"

	if slot2.cooperateCardEffect then
		slot9 = slot2.cooperateCardEffect
	end

	slot10 = getCardByHid(slot0)
	slot11 = XMLSprite:create("images/battle/cooperate/effect/" .. slot9)

	slot11:setPosition(ccpsprite(0.5, 0.1, slot10))
	slot11:setTag(kHeroCooperateIconTag)
	slot10:addChild(slot11, 1000)
	printTable("topHeroHids", slot3)
end

function isShowCooperateIcon(slot0)
	slot1 = false

	if getBattleHeroInfo(slot0) and slot2.rageSkill and skill.getDataById(slot2.rageSkill).cooperateSkill == 1 then
		slot1 = true
	end

	return slot1
end

function getCooprateEffectName(slot0)
	slot2 = nil

	if getBattleHeroInfo(slot0) and slot1.rageSkill then
		slot2 = skill.getDataById(slot1.rageSkill).cooperateCardEffect
	end

	return slot2 or "nuqizhubei"
end

function hiddenHeroMask()
	if not uv0 then
		return
	end

	if tolua.cast(uv1:getChildByTag(kMaskLayerTag), "CCLayerColor") then
		slot0:setVisible(false)
	end

	if tolua.cast(uv2:getChildByTag(kMaskLayerTag), "CCLayerColor") then
		slot1:setVisible(false)
	end

	for slot5, slot6 in pairs(uv3.team1.arrHero) do
		uv1:reorderChild(tolua.cast(uv1:getChildByTag(1000 + slot6.position), "CCXMLSprite"), 2)
	end

	for slot5, slot6 in pairs(uv3.team2.arrHero) do
		uv2:reorderChild(tolua.cast(uv2:getChildByTag(3000 + slot6.position), "CCXMLSprite"), 2)
	end

	if getCardByHid(uv0.attacker) then
		slot3:removeChildByTag(kHeroCooperateIconTag, true)
	end
end

function showStartEffect(slot0)
	slot2 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/effect/chuchangyun"), -1, CCString:create(""))

	slot2:setPosition(g_winSize.width / 2, g_winSize.height * 0.5)
	slot2:setScale(g_fBgScaleRatio)
	slot2:setFPS_interval(0.016666666666666666)
	CCDirector:sharedDirector():getRunningScene():addChild(slot2, 5000, kFogEffectTag)

	slot3 = slot0

	function animationEnd(...)
		uv0:removeFromParentAndCleanup(true)

		uv0 = nil
		uv1 = true

		if uv2 then
			uv2()
		end
	end

	slot4 = BTAnimationEventDelegate:create()

	slot4:registerLayerEndedHandler(animationEnd)
	slot4:registerLayerChangedHandler(function (...)
	end)
	slot2:setDelegate(slot4)
end

function preloadBattleData()
	for slot4, slot5 in pairs(uv0.battle) do
		if slot5.arrChild ~= nil then
			for slot9, slot10 in pairs(slot5.arrChild) do
				table.insert(slot0, slot4 + slot9, slot10)
			end

			slot0[slot4].arrChild = nil
		end
	end

	printTable("newBattleInfo", slot0)
end

function changeSelfTeam1()
	slot0 = UserModel.getUserUid()
	slot1 = false

	print("userUid", slot0)
	print("m_battleInfo.team2.uid", uv0.team2.uid)
	print("m_battleInfo.team1.uid", uv0.team1.uid)

	if tonumber(uv0.team2.uid) == tonumber(slot0) then
		slot1 = true
	end

	if slot1 then
		uv0.team1 = uv0.team2
		uv0.team2 = uv0.team1
	end

	print("isUserTeam2:", slot1)

	if slot1 then
		if tonumber(uv0.firstAttack) == 1 then
			uv0.firstAttack = 2
		else
			uv0.firstAttack = 1
		end
	end

	return slot1
end

function release(...)
end
