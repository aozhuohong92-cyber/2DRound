module("ChatBattleReportLayer", package.seeall)

slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7 = nil
slot8 = 101

function slot9(slot0, slot1, slot2)
	return true
end

function createAfterMineralLayer(slot0, slot1, slot2, slot3)
	uv0 = slot2
	uv1 = slot3
	uv2 = CCDirector:sharedDirector():getWinSize()
	uv3 = CCLayerColor:create(ccc4(11, 11, 11, 200))

	uv3:setTouchEnabled(true)
	uv3:registerScriptTouchHandler(uv4, false, -600, true)

	slot4 = nil

	if slot0 ~= "E" and slot0 ~= "F" then
		slot4 = true
		uv5 = BaseUI.createViewBg(CCSizeMake(520, 320))

		uv5:setAnchorPoint(ccp(0.5, 0.5))
		uv5:setPosition(ccp(uv2.width / 2, uv2.height * 0.484))
		uv3:addChild(uv5)
	else
		slot4 = false
		uv5 = BaseUI.createViewBg(CCSizeMake(520, 320))

		uv5:setAnchorPoint(ccp(0.5, 0.5))
		uv5:setPosition(ccp(uv2.width / 2, uv2.height * 0.42))
		uv3:addChild(uv5)
	end

	uv6 = CCMenu:create()

	uv6:setPosition(ccp(0, 0))
	uv6:setTouchPriority(-600)
	uv5:addChild(uv6)

	slot5 = createButtonItem(GetLocalizeStringBy("key_2184"))

	slot5:setAnchorPoint(ccp(0.5, 0.5))
	slot5:registerScriptTapHandler(replayItemFun)
	uv6:addChild(slot5)

	slot6 = createButtonItem(GetLocalizeStringBy("key_1985"))

	slot6:setAnchorPoint(ccp(0.5, 0.5))
	slot6:registerScriptTapHandler(okItemFun)
	uv6:addChild(slot6)

	uv7 = nil

	if slot4 then
		slot5:setPosition(ccp(uv5:getContentSize().width * 0.3, 117))
		slot6:setPosition(ccp(uv5:getContentSize().width * 0.7, 117))

		backAnimSprite2 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/xml/report/zhandoushengli03"), -1, CCString:create(""))

		backAnimSprite2:setAnchorPoint(ccp(0.5, 0.5))
		backAnimSprite2:setPosition(uv5:getContentSize().width * 0.5, uv5:getContentSize().height)
		uv5:addChild(backAnimSprite2, -1)
		backAnimSprite2:setVisible(false)

		slot8 = CCArray:create()

		slot8:addObject(CCDelayTime:create(0.1))
		slot8:addObject(CCCallFunc:create(function ()
			backAnimSprite2:setVisible(true)
		end))
		backAnimSprite2:runAction(CCSequence:create(slot8))

		uv8 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/xml/report/zhandoushengli02"), -1, CCString:create(""))

		uv8:setAnchorPoint(ccp(0.5, 0.5))
		uv8:setPosition(uv5:getContentSize().width * 0.5, uv5:getContentSize().height - 10)
		uv5:addChild(uv8, 0)

		uv7 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/xml/report/zhandoushengli01"), -1, CCString:create(""))

		uv5:registerScriptHandler(function (slot0, slot1)
			if slot0 == "enter" and file_exists("audio/effect/zhandoushengli.mp3") then
				AudioUtil.playEffect("audio/effect/zhandoushengli.mp3")
			end

			if slot0 == "exit" then
				-- Nothing
			end
		end)
	else
		slot5:setPosition(ccp(uv5:getContentSize().width * 0.3, 100))
		slot6:setPosition(ccp(uv5:getContentSize().width * 0.7, 100))

		uv8 = nil
		uv7 = CCLayerSprite:layerSpriteWithName(CCString:create("images/battle/xml/report/zhandoushibai"), -1, CCString:create(""))

		uv5:registerScriptHandler(function (slot0, slot1)
			if slot0 == "enter" and file_exists("audio/effect/zhandoushibai.mp3") then
				AudioUtil.playEffect("audio/effect/zhandoushibai.mp3")
			end

			if slot0 == "exit" then
				-- Nothing
			end
		end)
	end

	uv7:retain()
	uv7:setAnchorPoint(ccp(0.5, 0.5))
	uv7:setPosition(uv5:getContentSize().width * 0.5, uv5:getContentSize().height - 50)
	uv5:addChild(uv7)
	uv7:release()

	delegate = BTAnimationEventDelegate:create()

	delegate:registerLayerEndedHandler(animationEnd)
	delegate:registerLayerChangedHandler(animationFrameChanged)
	uv7:setDelegate(delegate)
	setAdaptNode(uv5)

	return uv3
end

function animationEnd(...)
	if uv0 ~= nil then
		uv0:cleanup()
	end

	if uv1 ~= nil then
		uv1:cleanup()
	end
end

function animationFrameChanged(...)
end

function createButtonItem(slot0)
	slot4 = CCMenuItemSprite:create(CCScale9Sprite:create("images/common/btn/btn_green_n.png"), CCScale9Sprite:create("images/common/btn/btn_green_h.png"), CCScale9Sprite:create("images/common/btn/btn_hui.png"))
	slot5 = CCRenderLabel:create(slot0, g_sFontPangWa, 35, 2, ccc3(0, 0, 0), type_stroke)

	slot5:setColor(ccc3(254, 219, 28))
	slot5:setAnchorPoint(ccp(0.5, 0.5))
	slot5:setPosition(ccp(slot4:getContentSize().width * 0.5, slot4:getContentSize().height * 0.5))
	slot4:addChild(slot5, 1, uv0)

	return slot4
end

function userFormationItemFun(slot0, slot1)
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	print(GetLocalizeStringBy("key_2710") .. slot0)
	require("script/ui/active/RivalInfoLayer")
	RivalInfoLayer.createLayer(tonumber(slot0))
end

function replayItemFun(slot0, slot1)
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	print(GetLocalizeStringBy("key_2460") .. slot0)
	require("script/battle/BattleLayer")
	BattleLayer.replay()
end

function okItemFun(slot0, slot1)
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	print(GetLocalizeStringBy("key_2060") .. slot0)
	require("script/battle/BattleLayer")
	BattleLayer.closeLayer()

	if uv0 ~= nil then
		uv0()
	end
end

function sendMegFun(slot0, slot1)
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	require("script/ui.chat/ChatUtil")

	function slot2()
		uv0:setEnabled(false)
		tolua.cast(uv0:getChildByTag(uv1), "CCRenderLabel"):setColor(ccc3(241, 241, 241))
		AnimationTip.showTip(GetLocalizeStringBy("key_4001"))
	end

	if uv1 == nil then
		AnimationTip.showTip(GetLocalizeStringBy("key_4002"))

		return
	end

	ChatUtil.sendChatinfo(amf3.decode(Base64.decodeWithZip(uv1)), ChatCache.ChatInfoType.battle_report_player, ChatCache.ChannelType.world, slot2)
end

function strengthenHeroFun()
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	print(GetLocalizeStringBy("key_2409"))

	if not DataCache.getSwitchNodeState(ksSwitchGeneralForge) then
		return
	end

	require("script/battle/BattleLayer")
	BattleLayer.closeLayer()
	require("script/ui/hero/HeroLayer")
	MainScene.changeLayer(HeroLayer.createLayer(), "HeroLayer")
end

function strengthenArmFun()
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	print(GetLocalizeStringBy("key_1244"))

	if not DataCache.getSwitchNodeState(ksSwitchWeaponForge) then
		return
	end

	require("script/battle/BattleLayer")
	BattleLayer.closeLayer()
	require("script/ui/bag/BagLayer")
	MainScene.changeLayer(BagLayer.createLayer(BagLayer.Tag_Init_Arming), "bagLayer")
end

function trainStarFun()
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	print(GetLocalizeStringBy("key_2827"))

	if not DataCache.getSwitchNodeState(ksSwitchGreatSoldier) then
		return
	end

	require("script/battle/BattleLayer")
	BattleLayer.closeLayer()
	require("script/ui/star/StarLayer")
	MainScene.changeLayer(StarLayer.createLayer(), "starLayer")
end

function feedPetFun()
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	print(GetLocalizeStringBy("key_2236"))

	if not DataCache.getSwitchNodeState(ksSwitchPet) then
		return
	end

	require("script/battle/BattleLayer")
	BattleLayer.closeLayer()
	require("script/ui/pet/PetMainLayer")
	MainScene.changeLayer(PetMainLayer.createLayer(), "PetMainLayer")
end

function formationFun()
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	print(GetLocalizeStringBy("key_2236"))
	require("script/battle/BattleLayer")
	BattleLayer.closeLayer()
	require("script/ui/formation/FormationLayer")
	MainScene.changeLayer(FormationLayer.createLayer(), "formationLayer")
end

function fightSoulFun()
	require("script/audio/AudioUtil")
	AudioUtil.playEffect("audio/effect/zhujiemian.mp3")
	print(GetLocalizeStringBy("key_2236"))
	require("script/battle/BattleLayer")
	BattleLayer.closeLayer()

	if not DataCache.getSwitchNodeState(ksSwitchBattleSoul) then
		return
	end

	require("script/ui/huntSoul/HuntSoulLayer")
	MainScene.changeLayer(HuntSoulLayer.createHuntSoulLayer(), "huntSoulLayer")
end
