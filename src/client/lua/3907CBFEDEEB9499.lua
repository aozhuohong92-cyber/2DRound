require("script/utils/extern")
require("script/libs/LuaCCLabel")
module("BattleReportLayer", package.seeall)

slot0 = "images/battle/report/"
slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16 = nil
slot17 = 1.3
slot18 = false
slot19 = nil

function slot20(slot0, slot1, slot2)
	return true
end

function replayClick()
	print("==========replayClick===============")
end

function commitClick()
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/guanbi.mp3")

	uv0 = nil

	if uv1 ~= nil then
		uv1:removeFromParentAndCleanup(true)
	end

	if uv2 ~= nil then
		uv2:removeFromParentAndCleanup(true)
	end

	if uv3 ~= nil then
		uv3:removeFromParentAndCleanup(true)
	end

	uv1 = nil
	uv2 = nil
	uv3 = nil

	require("script/battle/BattleLayer")
	BattleLayer.closeLayer()
end

function shareCallBack()
end

function shareClick()
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	require("script/utils/BaseUI")
	require("script/ui/share/ShareLayer")
	ShareLayer.show(nil, BaseUI.getScreenshots(), 9999, -1000, shareCallBack)
end

function strengthenHeroFun()
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	print(GetLocalizeStringBy("key_2409"))
	commitClick()

	if not DataCache.getSwitchNodeState(ksSwitchGeneralForge) then
		return
	end

	require("script/ui/hero/HeroLayer")
	MainScene.changeLayer(HeroLayer.createLayer(), "HeroLayer")
	AudioUtil.playMainBgm()
end

function strengthenArmFun()
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	print(GetLocalizeStringBy("key_1244"))
	commitClick()

	if not DataCache.getSwitchNodeState(ksSwitchWeaponForge) then
		return
	end

	require("script/ui/bag/BagLayer")
	MainScene.changeLayer(BagLayer.createLayer(BagLayer.Tag_Init_Arming), "bagLayer")
	AudioUtil.playMainBgm()
end

function trainStarFun()
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	print(GetLocalizeStringBy("key_2827"))
	commitClick()

	if not DataCache.getSwitchNodeState(ksSwitchGreatSoldier) then
		return
	end

	require("script/ui/star/StarLayer")
	MainScene.changeLayer(StarLayer.createLayer(), "starLayer")
	AudioUtil.playMainBgm()
end

function feedPetFun()
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	print(GetLocalizeStringBy("key_2236"))
	commitClick()

	if not DataCache.getSwitchNodeState(ksSwitchPet) then
		return
	end

	require("script/ui/pet/PetMainLayer")
	MainScene.changeLayer(PetMainLayer.createLayer(), "PetMainLayer")
end

function formationFun()
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	print(GetLocalizeStringBy("key_2236"))
	commitClick()
	require("script/ui/formation/FormationLayer")
	MainScene.changeLayer(FormationLayer.createLayer(), "formationLayer")
end

function fightSoulFun()
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	print(GetLocalizeStringBy("key_2236"))
	commitClick()

	if not DataCache.getSwitchNodeState(ksSwitchBattleSoul) then
		return
	end

	require("script/ui/huntSoul/HuntSoulLayer")
	MainScene.changeLayer(HuntSoulLayer.createHuntSoulLayer(), "huntSoulLayer")
end

function stopAnimation(slot0)
end

function animationEnd(slot0, slot1, slot2)
	if uv0 ~= nil then
		uv0:cleanup()
	end

	if uv1 ~= nil then
		uv1:cleanup()
	end
end

function animationFrameChanged(slot0, slot1, slot2)
end

function updateExpNumber()
	if tonumber(uv0:getString()) ~= nil and slot0 < uv1 then
		uv0:setString("" .. slot0 + math.ceil(uv1 / uv2 / 30))
	else
		uv0:setString("" .. uv1)
		uv3:stopActionByTag(10001)
	end
end

function updateSoulNumber()
	if tonumber(uv0:getString()) ~= nil and slot0 < uv1 then
		uv0:setString("" .. slot0 + math.ceil(uv1 / uv2 / 30))
	else
		uv0:setString("" .. uv1)
		uv3:stopActionByTag(10002)
	end
end

function updateSilverNumber()
	if tonumber(uv0:getString()) ~= nil and slot0 < uv1 then
		uv0:setString("" .. slot0 + math.ceil(uv1 / uv2 / 30))
	else
		uv0:setString("" .. uv1)
		uv3:stopActionByTag(10003)
	end
end

function updateExpLine()
	print("updateExpLine:", uv0, uv1 < uv0)

	if uv0 ~= nil and uv0 <= uv1 and uv1 > 0 then
		uv0 = uv0 + uv1 / uv2 / 30

		require("db/DB_Level_up_exp")

		slot1 = 1

		if DB_Level_up_exp.getDataById(2) ~= nil and slot0["lv_" .. tonumber(UserModel.getHeroLevel()) + 1] ~= nil and UserModel.getExpValue() ~= nil then
			slot1 = (UserModel.getExpValue() + uv0) / slot0["lv_" .. tonumber(UserModel.getHeroLevel()) + 1]
		end

		if slot1 >= 1 and uv3 ~= nil then
			uv3:setString(tonumber(UserModel.getHeroLevel()) + 1 .. "")

			slot1 = (UserModel.getExpValue() + uv0 - slot0["lv_" .. tonumber(UserModel.getHeroLevel()) + 1]) / slot0["lv_" .. tonumber(UserModel.getHeroLevel()) + 2]
		end

		uv4:setTextureRect(CCRectMake(0, 0, uv4:getTexture():getContentSize().width * (slot1 - math.floor(slot1)), uv4:getContentSize().height))
	else
		uv5:stopActionByTag(10004)
		uv6:setEnabled(true)

		if Platform.getOS() ~= "wp" then
			uv7:setEnabled(true)
		end

		require("script/model/user/UserModel")

		if uv8 and uv9 == false then
			uv9 = true

			UserModel.addExpValue(tonumber(uv1), "dobattle")
			UserModel.changeSilverNumber(tonumber(uv10))
			UserModel.changeHeroSoulNumber(tonumber(uv11))
		end
	end
end

function getBattleReportLayer(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
	if uv0 ~= nil then
		-- Nothing
	end

	uv1 = slot8

	if slot10 == nil then
		slot10 = "false"
	end

	uv2 = false

	require("script/battle/BattleLayer")
	BattleLayer.endShake()

	uv3 = slot4
	uv4 = slot6
	uv5 = slot7

	print("getBattleReportLayer m_expNumber", uv5)

	uv6 = 0

	require("script/ui/main/MainScene")

	slot11 = CCSizeMake(520, 720)
	slot12 = MainScene.elementScale
	slot13 = CCSizeMake(640, 960)
	slot14 = CCDirector:sharedDirector():getWinSize()

	if slot14.height / slot14.width > slot13.height / slot13.width then
		bgScale = slot14.height / slot13.height
		elementScale = slot14.width / slot13.width
		g_fElementScaleRatio = elementScale
		g_fBgScaleRatio = bgScale
		slot12 = elementScale
	else
		elementScale = slot14.height / slot13.height
		bgScale = slot14.width / slot13.width
		g_fElementScaleRatio = elementScale
		g_fBgScaleRatio = bgScale
		slot12 = elementScale
	end

	uv0 = CCLayer:create()
	slot15 = CCLayer:create()

	slot15:setScale(slot12)
	slot15:setPosition((CCDirector:sharedDirector():getWinSize().width - slot11.width * slot12) / 2, CCDirector:sharedDirector():getWinSize().height * 0.755 - slot11.height * slot12)
	uv0:addChild(slot15)
	uv0:setTouchEnabled(true)
	uv0:registerScriptTouchHandler(uv7, false, -700, true)

	uv8 = slot0

	require("script/model/user/UserModel")
	AudioUtil.stopBgm()

	if slot0 then
		uv9 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/xml/report/zhandoushengli02"), -1, CCString:create(""))

		uv9:setAnchorPoint(ccp(0.5, 0.5))
		uv9:setPosition(CCDirector:sharedDirector():getWinSize().width / 2, CCDirector:sharedDirector():getWinSize().height * 0.74)
		uv9:setScale(slot12)
		uv0:addChild(uv9, -1)

		slot17 = CCArray:create()

		slot17:addObject(CCDelayTime:create(1.5))
		slot17:addObject(CCCallFunc:create(function ()
			slot0 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/xml/report/zhandoushengli03"), -1, CCString:create(""))

			slot0:setAnchorPoint(ccp(0.5, 0.5))
			slot0:setPosition(CCDirector:sharedDirector():getWinSize().width / 2, CCDirector:sharedDirector():getWinSize().height * 0.74)
			slot0:setScale(uv0)
			uv1:addChild(slot0, -2)
		end))
		uv9:runAction(CCSequence:create(slot17))

		uv10 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/xml/report/zhandoushengli01"), -1, CCString:create(""))

		if file_exists("audio/effect/zhandoushengli.mp3") then
			AudioUtil.playEffect("audio/effect/zhandoushengli.mp3")
		end
	else
		uv9 = nil
		uv10 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/xml/report/zhandoushibai"), -1, CCString:create(""))

		if file_exists("audio/effect/zhandoushibai.mp3") then
			print("zhandoushibai.mp3")
			AudioUtil.playEffect("audio/effect/zhandoushibai.mp3")
		end
	end

	slot16 = BTAnimationEventDelegate:create()

	slot16:registerLayerEndedHandler(animationEnd)
	slot16:registerLayerChangedHandler(animationFrameChanged)
	uv10:setDelegate(slot16)
	uv10:retain()
	uv10:setAnchorPoint(ccp(0.5, 0.5))
	uv10:setPosition(CCDirector:sharedDirector():getWinSize().width / 2, CCDirector:sharedDirector():getWinSize().height * 0.74)
	uv10:setScale(slot12)
	uv0:addChild(uv10)
	uv10:release()

	slot17 = CCScale9Sprite:create(CCRectMake(100, 80, 10, 20), uv11 .. "bg.png")

	slot17:setContentSize(slot11)
	slot17:setAnchorPoint(ccp(0, 0))
	slot17:setPosition(0, 0)
	slot15:addChild(slot17)

	slot18 = nil

	if slot8 == 1 then
		require("db/DB_Copy")

		slot18 = DB_Copy.getDataById(slot1)
	elseif slot8 == 2 then
		require("db/DB_Elitecopy")

		slot18 = DB_Elitecopy.getDataById(slot1)
	elseif slot8 == 3 then
		require("db/DB_Activitycopy")

		slot18 = DB_Activitycopy.getDataById(slot1)
	elseif slot8 == 4 then
		require("db/DB_Tower_layer")

		slot18 = DB_Tower_layer.getDataById(slot1)
	end

	require("db/DB_Stronghold")

	slot20 = CCRenderLabel:create(DB_Stronghold.getDataById(slot2).name, g_sFontPangWa, 30, 2, ccc3(0, 0, 0), type_stroke)

	slot20:setColor(ccc3(255, 228, 0))
	slot20:setAnchorPoint(ccp(0.5, 0.5))
	slot20:setPosition(slot11.width * 0.5, slot11.height * 0.94)
	slot17:addChild(slot20)
	require("script/utils/LuaUtil")

	slot21 = nil
	slot22 = nil

	if (slot3 == 0 and 0 or slot19["cost_energy_" .. (slot3 == 1 and "simple" or slot3 == 2 and "normal" or slot3 == 3 and "hard" or "simple")]) == nil then
		slot22 = 0
	end

	if uv8 == true and uv1 ~= 5 then
		UserModel.changeEnergyValue(-1 * tonumber(slot22))
	end

	slot23 = CCSprite:create(uv11 .. "level_" .. slot21 .. ".png")

	slot23:setAnchorPoint(ccp(0.5, 0.5))
	slot23:setPosition(slot11.width * 0.15, slot11.height * 0.87)
	slot17:addChild(slot23)

	slot24 = CCSprite:create("images/copy/stronghold/starbg.png")
	slot30 = 0.5

	slot24:setAnchorPoint(ccp(slot30, 0.5))
	slot24:setPosition(slot11.width * 0.5, slot11.height * 0.87)
	slot17:addChild(slot24)
	require("script/model/DataCache")

	slot26 = 0

	for slot30 = 1, #DataCache.getNormalCopyData() do
		if slot25[slot30].va_copy_info ~= nil and slot31.progress ~= nil and slot31.progress["" .. slot2] ~= nil then
			slot26 = tonumber(slot31.progress["" .. slot2]) == nil and 0 or tonumber(slot31.progress["" .. slot2]) - 2

			break
		end
	end

	if uv8 == true and (slot10 == true or slot10 == "true") then
		slot27 = slot3 == 0 and 1 or slot3
		slot26 = slot27 < slot26 and slot26 or slot27
	end

	slot27 = 1

	if slot19.army_ids_hard ~= nil then
		slot27 = 3
	elseif slot19.army_ids_normal ~= nil then
		slot27 = 2
	end

	for slot31 = 1, slot27 do
		slot33 = CCSprite:create(uv11 .. (slot26 < slot31 and "star_d.png" or "star.png"))

		slot33:setAnchorPoint(ccp(0.5, 0.5))
		slot33:setPosition(slot24:getContentSize().width * 1 / (slot27 + 1) * slot31, slot24:getContentSize().height * 0.5)
		slot24:addChild(slot33)
	end

	if uv8 == true then
		slot28 = CCScale9Sprite:create(CCRectMake(20, 20, 10, 10), "images/common/labelbg_white.png")

		slot28:setContentSize(CCSizeMake(380, 40))
		slot28:setAnchorPoint(ccp(0.5, 0.5))
		slot28:setPosition(slot11.width * 0.5, slot11.height * 0.8)
		slot17:addChild(slot28)

		slot29 = CCLabelTTF:create(GetLocalizeStringBy("key_2470"), g_sFontName, 24)

		slot29:setAnchorPoint(ccp(0.5, 0.5))
		slot29:setPosition(slot28:getContentSize().width * 0.32, slot28:getContentSize().height * 0.5)
		slot29:setColor(ccc3(120, 37, 0))
		slot28:addChild(slot29)

		slot30 = CCSprite:create("images/battle/icon/icon_money.png")

		slot30:setAnchorPoint(ccp(0.5, 0.5))
		slot30:setPosition(slot28:getContentSize().width * 0.61, slot28:getContentSize().height * 0.5)
		slot28:addChild(slot30)

		uv12 = CCLabelTTF:create("" .. 0, g_sFontName, 24)

		uv12:setAnchorPoint(ccp(0, 0.5))
		uv12:setPosition(slot28:getContentSize().width * 0.67, slot28:getContentSize().height * 0.5)
		uv12:setColor(ccc3(0, 0, 0))
		slot28:addChild(uv12)
		schedule(uv0, updateSilverNumber, 0.016666666666666666):setTag(10003)

		slot32 = CCScale9Sprite:create(CCRectMake(20, 20, 10, 10), "images/common/labelbg_white.png")

		slot32:setContentSize(CCSizeMake(380, 40))
		slot32:setAnchorPoint(ccp(0.5, 0.5))
		slot32:setPosition(slot11.width * 0.5, slot11.height * 0.735)
		slot17:addChild(slot32)

		slot33 = CCLabelTTF:create(GetLocalizeStringBy("key_1008"), g_sFontName, 24)

		slot33:setAnchorPoint(ccp(0.5, 0.5))
		slot33:setPosition(slot32:getContentSize().width * 0.32, slot32:getContentSize().height * 0.5)
		slot33:setColor(ccc3(120, 37, 0))
		slot32:addChild(slot33)

		slot34 = CCSprite:create("images/battle/icon/icon_soul.png")

		slot34:setAnchorPoint(ccp(0.5, 0.5))
		slot34:setPosition(slot32:getContentSize().width * 0.61, slot32:getContentSize().height * 0.5)
		slot32:addChild(slot34)

		uv13 = CCLabelTTF:create("" .. 0, g_sFontName, 24)

		uv13:setAnchorPoint(ccp(0, 0.5))
		uv13:setPosition(slot32:getContentSize().width * 0.67, slot32:getContentSize().height * 0.5)
		uv13:setColor(ccc3(0, 0, 0))
		slot32:addChild(uv13)
		schedule(uv0, updateSoulNumber, 0.016666666666666666):setTag(10002)

		slot36 = CCScale9Sprite:create(CCRectMake(20, 20, 10, 10), "images/common/labelbg_white.png")

		slot36:setContentSize(CCSizeMake(380, 40))
		slot36:setAnchorPoint(ccp(0.5, 0.5))
		slot36:setPosition(slot11.width * 0.5, slot11.height * 0.67)
		slot17:addChild(slot36)

		slot37 = CCLabelTTF:create(GetLocalizeStringBy("key_2969"), g_sFontName, 24)

		slot37:setAnchorPoint(ccp(0.5, 0.5))
		slot37:setPosition(slot36:getContentSize().width * 0.32, slot36:getContentSize().height * 0.5)
		slot37:setColor(ccc3(120, 37, 0))
		slot36:addChild(slot37)

		slot38 = CCSprite:create("images/common/exp.png")

		slot38:setAnchorPoint(ccp(0.5, 0.5))
		slot38:setPosition(slot36:getContentSize().width * 0.57, slot36:getContentSize().height * 0.5)
		slot36:addChild(slot38)

		uv14 = CCLabelTTF:create("" .. 0, g_sFontName, 24)

		uv14:setAnchorPoint(ccp(0, 0.5))
		uv14:setPosition(slot36:getContentSize().width * 0.67, slot36:getContentSize().height * 0.5)
		uv14:setColor(ccc3(0, 0, 0))
		slot36:addChild(uv14)
		require("script/ui/rechargeActive/ActiveCache")

		if ActiveCache.isWealActivityOpen(ActiveCache.WealType.MULT_COPY) and uv1 == BattleLayer.kNormalCopy then
			slot39 = XMLSprite:create("images/battle/report/effect/huodongfanbei")

			slot39:setPosition(ccpsprite(0.95, 0.5, slot36))
			slot36:addChild(slot39, 20)
		end

		schedule(uv0, updateExpNumber, 0.016666666666666666):setTag(10001)

		slot40 = CCSprite:create("images/common/lv.png")

		slot40:setAnchorPoint(ccp(0.5, 0.5))
		slot40:setPosition(slot11.width * 0.3, slot11.height * 0.61)
		slot17:addChild(slot40)

		uv15 = CCRenderLabel:create("" .. UserModel.getHeroLevel(), g_sFontName, 24, 1.5, ccc3(0, 0, 3), type_stroke)

		uv15:setAnchorPoint(ccp(0.5, 0.5))
		uv15:setPosition(slot11.width * 0.37, slot11.height * 0.61)
		uv15:setColor(ccc3(255, 246, 0))
		slot17:addChild(uv15)

		if UserModel.hasReachedMaxLevel() == true then
			slot41 = CCSprite:create("images/battle/report/max.png")

			slot41:setAnchorPoint(ccp(0.5, 0.5))
			slot41:setPosition(slot11.width * 0.65, slot11.height * 0.61)
			slot17:addChild(slot41, 12)
		end

		slot41 = CCSprite:create("images/main/progress_black.png")

		slot41:setAnchorPoint(ccp(0, 0.5))
		slot41:setPosition(slot11.width * 0.47, slot11.height * 0.61)
		slot17:addChild(slot41)
		require("db/DB_Level_up_exp")

		slot43 = 1

		if DB_Level_up_exp.getDataById(2) ~= nil and slot42["lv_" .. tonumber(UserModel.getHeroLevel()) + 1] ~= nil and UserModel.getExpValue() ~= nil then
			slot43 = UserModel.getExpValue() / slot42["lv_" .. tonumber(UserModel.getHeroLevel()) + 1]
		end

		uv16 = CCSprite:create("images/main/progress_blue.png")

		uv16:setAnchorPoint(ccp(0, 0.5))
		uv16:setPosition(0, slot41:getContentSize().height * 0.5)
		uv16:setTextureRect(CCRectMake(0, 0, uv16:getContentSize().width * slot43, uv16:getContentSize().height))
		slot41:addChild(uv16)

		slot44 = CCSprite:create("images/common/cur_fight.png")

		slot44:setAnchorPoint(ccp(0.5, 0.5))
		slot44:setPosition(ccp(slot11.width * 0.4, slot11.height * 0.57))
		slot17:addChild(slot44)

		slot45 = CCRenderLabel:create(UserModel.getFightForceValue(), g_sFontPangWa, 23, 1, ccc3(0, 0, 0), type_stroke)

		slot45:setColor(ccc3(255, 246, 0))
		slot45:setAnchorPoint(ccp(0, 0.5))
		slot45:setPosition(slot44:getPositionX() + slot44:getContentSize().width / 2 + 10, slot44:getPositionY())
		slot17:addChild(slot45)

		uv17 = LuaCC.create9ScaleMenuItem("images/common/btn/btn_green_n.png", "images/common/btn/btn_green_h.png", CCSizeMake(200, 73), GetLocalizeStringBy("key_1061"), ccc3(255, 222, 0))

		uv17:setAnchorPoint(ccp(0.5, 0.5))

		if Platform.getOS() == "wp" then
			uv17:setPosition(ccp(slot11.width * 0.5, slot11.height * 0.08))
		else
			uv17:setPosition(ccp(slot11.width * 0.7, slot11.height * 0.08))
		end

		uv17:registerScriptTapHandler(BattleReportLayer.commitClick)

		uv18 = LuaCC.create9ScaleMenuItem("images/common/btn/btn_green_n.png", "images/common/btn/btn_green_h.png", CCSizeMake(200, 73), GetLocalizeStringBy("key_2391"), ccc3(255, 222, 0))

		uv18:setAnchorPoint(ccp(0.5, 0.5))
		uv18:setPosition(ccp(slot11.width * 0.3, slot11.height * 0.08))
		uv18:registerScriptTapHandler(shareClick)

		if uv8 == true and tonumber(uv5) > 0 then
			uv17:setEnabled(false)

			if Platform.getOS() ~= "wp" then
				uv18:setEnabled(false)
			end
		end

		uv17:setCascadeColorEnabled(true)

		slot46 = CCMenu:create()

		slot46:setAnchorPoint(ccp(0, 0))
		slot46:setPosition(0, 0)
		slot46:addChild(uv17)

		if Platform.getOS() ~= "wp" then
			slot46:addChild(uv18)
		end

		slot17:addChild(slot46)
		slot46:setTouchPriority(-720)

		slot47 = CCScale9Sprite:create(CCRectMake(20, 20, 10, 10), "images/common/bg/9s_1.png")

		slot47:setContentSize(CCSizeMake(slot11.width - 50, 270))
		slot47:setAnchorPoint(ccp(0, 0))
		slot47:setPosition(25, 100)
		slot17:addChild(slot47)

		slot48 = CCScale9Sprite:create(CCRectMake(25, 15, 20, 10), "images/common/astro_labelbg.png")

		slot48:setPreferredSize(CCSizeMake(slot11.width * 0.4, slot11.height * 0.05))
		slot48:setAnchorPoint(ccp(0.5, 0.5))
		slot48:setPosition(slot47:getContentSize().width * 0.5, slot47:getContentSize().height * 1)
		slot47:addChild(slot48)

		slot49 = CCLabelTTF:create(GetLocalizeStringBy("key_2882"), g_sFontName, 24)

		slot49:setAnchorPoint(ccp(0.5, 0.5))
		slot49:setPosition(slot47:getContentSize().width * 0.5, slot47:getContentSize().height * 1)
		slot49:setColor(ccc3(255, 246, 0))
		slot47:addChild(slot49)

		if uv8 then
			slot50 = CCScrollView:create()

			slot50:setTouchPriority(-720)
			slot50:setContentSize(CCSizeMake(520, 240))
			slot50:setViewSize(CCSizeMake(520, 240))
			slot50:setBounceable(true)
			slot50:setDirection(kCCScrollViewDirectionVertical)
			slot50:setAnchorPoint(ccp(0, 0))
			slot50:setPosition(ccp(slot47:getContentSize().width * 0.05, slot47:getContentSize().height * 0.05))
			slot47:addChild(slot50)

			slot53 = slot47:getContentSize().width * 0.2 - slot50:getPositionX()
			slot55 = slot47:getContentSize().width * 0.3
			slot56 = slot47:getContentSize().height * 0.43

			if math.ceil((#slot5 + #slot9) / 3) > 2 then
				slot54 = slot47:getContentSize().height * 0.75 - slot50:getPositionY() + (math.ceil(slot51 / slot52) - 2) * slot56
			end

			slot57 = CCLayer:create()

			slot57:setContentSize(CCSizeMake(520, slot54 + slot56 * 0.4))
			slot57:setAnchorPoint(ccp(0, 0))
			slot57:setPosition(0, slot50:getContentSize().height < slot57:getContentSize().height and -slot57:getContentSize().height + slot50:getContentSize().height or 0)
			slot50:setContainer(slot57)
			require("script/ui/item/ItemSprite")
			require("script/ui/item/ItemUtil")

			for slot62 = 1, #slot5 do
				slot63 = ItemSprite.getItemSpriteById(tonumber(slot5[slot62].item_template_id))

				slot63:setAnchorPoint(ccp(0.5, 0.5))
				slot63:setPosition(slot53 + slot55 * math.floor((slot62 - 1) % slot52), slot54 - slot56 * math.floor((slot62 - 1) / slot52))
				slot57:addChild(slot63)

				if Platform.getLayout ~= nil and Platform.getLayout() == "enLayout" then
					-- Nothing
				elseif ItemUtil.getItemById(tonumber(slot5[slot62].item_template_id)) ~= nil and slot64.name ~= nil then
					slot65 = CCRenderLabel:create(slot64.name, g_sFontName, 18, 1, ccc3(16, 16, 16), type_stroke)

					slot65:setColor(HeroPublicLua.getCCColorByStarLevel(ItemUtil.getEquipQualityByTid(slot5[slot62].item_template_id)) or ccc3(255, 246, 0))
					slot65:setAnchorPoint(ccp(0.5, 0.5))
					slot65:setPosition(slot63:getContentSize().width * 0.5, -slot63:getContentSize().height * 0.15)
					slot63:addChild(slot65)
				end

				slot64 = nil
				slot65 = CCRenderLabel:create(((slot5[slot62].item_num == nil or tonumber(slot5[slot62].item_num) == nil) and "" or tonumber(slot5[slot62].item_num)) .. "", g_sFontName, 18, 1, ccc3(0, 0, 0), type_stroke)

				slot65:setColor(ccc3(102, 255, 102))
				slot65:setAnchorPoint(ccp(1, 0))
				slot65:setPosition(slot63:getContentSize().width * 0.92, slot63:getContentSize().height * 0.05)
				slot63:addChild(slot65)
			end

			if slot9 == nil then
				slot9 = {} or slot9
			end

			require("script/ui/hero/HeroPublicCC")
			require("db/DB_Monsters_tmpl")

			for slot62 = 1, #slot9 do
				slot63 = HeroPublicCC.getCMISHeadIconByHtid(tonumber(slot9[slot62].htid))

				slot63:setAnchorPoint(ccp(0.5, 0.5))
				slot63:setPosition(slot53 + slot55 * math.floor((slot62 + #slot5 - 1) % slot52), slot54 - slot56 * math.floor((slot62 + #slot5 - 1) / slot52))
				slot57:addChild(slot63)

				if Platform.getLayout ~= nil and Platform.getLayout() == "enLayout" then
					-- Nothing
				elseif DB_Monsters_tmpl.getDataById(tonumber(slot9[slot62].htid)) ~= nil and slot64.name ~= nil then
					slot65 = CCRenderLabel:create(slot64.name, g_sFontName, 18, 1.5, ccc3(16, 16, 16), type_stroke)

					slot65:setColor(ccc3(255, 246, 0))
					slot65:setAnchorPoint(ccp(0.5, 0.5))
					slot65:setPosition(slot63:getContentSize().width * 0.5, -slot63:getContentSize().height * 0.1)
					slot63:addChild(slot65)
				end
			end
		end

		schedule(uv0, updateExpLine, 0.03333333333333333):setTag(10004)
	else
		uv17 = CCMenuItemImage:create("images/battle/btn/btn_commit_n.png", "images/battle/btn/btn_commit_h.png")

		uv17:setAnchorPoint(ccp(0.5, 0.5))
		uv17:setPosition(ccp(slot11.width * 0.5, slot11.height * 0.09))
		uv17:registerScriptTapHandler(BattleReportLayer.commitClick)

		slot28 = CCMenu:create()

		slot28:setAnchorPoint(ccp(0, 0))
		slot28:setPosition(0, 0)
		slot28:addChild(uv17)
		slot17:addChild(slot28)
		slot28:setTouchPriority(-720)

		slot29 = CCScale9Sprite:create(CCRectMake(20, 20, 10, 10), "images/common/bg/bg_ng_attr.png")

		slot29:setContentSize(CCSizeMake(slot11.width - 50, 450))
		slot29:setAnchorPoint(ccp(0.5, 1))
		slot29:setPosition(ccp(slot17:getContentSize().width * 0.5, slot17:getContentSize().height - 150))
		slot17:addChild(slot29)

		slot31 = CCRenderLabel:create(GetLocalizeStringBy("key_3053"), g_sFontPangWa, 26, 1, ccc3(0, 0, 0), type_stroke)

		slot31:setColor(ccc3(255, 255, 255))
		slot31:setPosition(ccp(45, slot29:getContentSize().height - 10))
		slot29:addChild(slot31)

		slot33 = CCRenderLabel:create(GetLocalizeStringBy("key_1175"), g_sFontPangWa, 26, 1, ccc3(0, 0, 0), type_stroke)

		slot33:setColor(ccc3(255, 255, 255))
		slot33:setPosition(ccp(10, slot29:getContentSize().height - 50))
		slot29:addChild(slot33)

		slot35 = CCRenderLabel:create(GetLocalizeStringBy("key_2265"), g_sFontPangWa, 26, 1, ccc3(0, 0, 0), type_stroke)

		slot35:setColor(ccc3(255, 255, 255))
		slot35:setPosition(ccp(10, slot29:getContentSize().height - 90))
		slot29:addChild(slot35)

		slot36 = CCSprite:create("images/common/cur_fight.png")

		slot36:setAnchorPoint(ccp(0.5, 0.5))
		slot36:setPosition(ccp(slot11.width * 0.4, slot29:getContentSize().height - 150))
		slot29:addChild(slot36)

		slot37 = CCRenderLabel:create(UserModel.getFightForceValue(), g_sFontPangWa, 23, 1, ccc3(0, 0, 0), type_stroke)

		slot37:setColor(ccc3(255, 246, 0))
		slot37:setAnchorPoint(ccp(0, 0.5))
		slot37:setPosition(slot36:getPositionX() + slot36:getContentSize().width / 2 + 10, slot36:getPositionY())
		slot29:addChild(slot37)

		slot38 = CCMenu:create()

		slot38:setPosition(ccp(0, 0))
		slot38:setTouchPriority(-720)
		slot29:addChild(slot38)

		slot39 = CCMenuItemImage:create("images/common/strengthen_hero_n.png", "images/common/strengthen_hero_h.png")

		slot39:setAnchorPoint(ccp(0, 0.5))
		slot39:setPosition(ccp(18, 181))
		slot38:addChild(slot39)
		slot39:registerScriptTapHandler(strengthenHeroFun)

		slot40 = CCMenuItemImage:create("images/common/change_formation_n.png", "images/common/change_formation_h.png")

		slot40:setAnchorPoint(ccp(0.5, 0.5))
		slot40:setPosition(ccp(slot29:getContentSize().width / 2, 181))
		slot38:addChild(slot40)
		slot40:registerScriptTapHandler(formationFun)

		slot41 = CCMenuItemImage:create("images/common/strengthen_arm_n.png", "images/common/strengthen_arm_h.png")

		slot41:setAnchorPoint(ccp(0.5, 0.5))
		slot41:setPosition(ccp(387, 181))
		slot38:addChild(slot41)
		slot41:registerScriptTapHandler(strengthenArmFun)

		slot42 = CCMenuItemImage:create("images/common/train_star_n.png", "images/common/train_star_h.png")

		slot42:setAnchorPoint(ccp(0.5, 0.5))
		slot42:setPosition(ccp(123, 58))
		slot38:addChild(slot42)
		slot42:registerScriptTapHandler(trainStarFun)

		slot43 = CCMenuItemImage:create("images/common/up_fightsoul_n.png", "images/common/up_fightsoul_h.png")

		slot43:setAnchorPoint(ccp(0.5, 0.5))
		slot43:setPosition(ccp(337, 56))
		slot38:addChild(slot43)
		slot43:registerScriptTapHandler(fightSoulFun)
	end

	return uv0
end

function getScene()
	slot0 = CCScene:create()

	slot0:addChild(getBattleReportLayer(true, 1, 1001, 1, 1234, {}, 1234, 54321))

	return slot0
end

function release(...)
end
