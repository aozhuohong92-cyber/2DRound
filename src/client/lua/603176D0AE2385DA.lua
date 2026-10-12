require("script/utils/extern")
module("PlayerCardLayer", package.seeall)
require("script/battle/BattleCardUtil")

slot0 = "images/battle/"
slot1, slot2, slot3, slot4, slot5, slot6, slot7 = nil

function getPointByPosition(slot0)
	slot1 = uv0.width * 0.2

	return ccp(0.2 * uv0.width + slot0 % 3 * slot1 * 1.4, 0.48 * uv0.height - math.floor(slot0 / 3) * slot1 * 1.2 * 1.2)
end

function slot8()
	slot0 = uv0:count()

	for slot4 = 0, 5 do
		if uv1:getChildByTag(2000 + slot4) then
			slot5:setPosition(getPointByPosition(slot5:getTag() - 2000))

			slot7 = CCArray:create()

			slot7:addObject(CCFadeOut:create(0.8))
			slot7:addObject(CCFadeIn:create(0.8))
			slot7:addObject(CCDelayTime:create(0.2))
			slot5:runAction(CCRepeatForever:create(CCSequence:create(slot7)))
		end
	end

	for slot4 = 0, slot0 - 1 do
		if tolua.cast(uv0:objectAtIndex(slot4), "CCXMLSprite") then
			slot6 = slot5:getTag() - 1000

			slot5:setPosition(getPointByPosition(slot6))
			slot5:setBasePoint(getPointByPosition(slot6))
		end
	end
end

function slot9()
	uv0:setPosition(ccp(0, 0))
	uv0:setAnchorPoint(ccp(0, 0))

	if uv1 ~= nil then
		uv1:release()

		uv1 = nil
	end

	uv1 = CCArray:create()

	uv1:retain()

	for slot3 = 0, 5 do
		slot4 = CCSprite:create(uv2 .. "card/card_bg.png")

		slot4:setAnchorPoint(ccp(0.5, 0.5))
		slot4:setTag(2000 + slot3)
		uv0:addChild(slot4, 1)

		if uv3["" .. slot3] ~= nil and uv3["" .. slot3] ~= 0 then
			slot5 = BattleLayer.createBattleCard(uv3["" .. slot3])

			slot5:setTag(1000 + slot3)
			uv0:addChild(slot5, 2, 1000 + slot3)
			uv1:addObject(slot5)
		end
	end

	uv4()
end

function slot10()
	uv0:removeAllObjects()

	for slot3 = 0, 5 do
		if uv1:getChildByTag(1000 + slot3) ~= nil then
			uv0:addObject(slot4)
		end
	end

	return uv0
end

function getFormation()
	return uv0
end

function slot11(slot0, slot1)
	slot2 = false

	for slot6 = 0, 5 do
		if uv0:getChildByTag(2000 + slot6) then
			print("switchCard:", slot7:getTag(), uv1:getTag())

			if slot7:getTag() - 1000 == uv1:getTag() then
				if slot7:convertToNodeSpace(ccp(slot0, slot1)).x >= 0 and slot8.y >= 0 and slot8.x <= slot7:getContentSize().width and slot8.y <= slot7:getContentSize().height then
					BattleLayer.reviveCardByHid(uv2["" .. uv1:getTag() - 1000])
				end
			elseif slot7:convertToNodeSpace(ccp(slot0, slot1)).x >= 0 and slot8.y >= 0 and slot8.x <= slot7:getContentSize().width and slot8.y <= slot7:getContentSize().height then
				slot9 = uv1:getTag() - 1000

				require("script/ui/formation/FormationUtil")

				slot11 = FormationUtil.getFormationOpenedNum()

				if FormationUtil.isOpenedByPosition(slot7:getTag() - 2000) == false or FormationUtil.isOpenedByPosition(slot9) == false then
					slot2 = false

					require("script/ui/tip/AnimationTip")
					AnimationTip.showTip(GetLocalizeStringBy("key_1513"))

					break
				end

				uv2["" .. slot9] = uv2["" .. slot10]
				uv2["" .. slot10] = uv2["" .. slot9]

				if uv0:getChildByTag(1000 + slot10) ~= nil then
					slot14:setPosition(getPointByPosition(slot9))
					slot14:setTag(1000 + slot9)
				end

				uv1:setPosition(getPointByPosition(slot10))
				uv1:setTag(1000 + slot10)

				slot2 = true

				break
			end
		end
	end

	if slot2 ~= true then
		uv1:setPosition(getPointByPosition(uv1:getTag() - 1000))
	end
end

function slot12(slot0, slot1, slot2)
	if uv0 ~= true then
		return false
	end

	if slot0 == "began" then
		slot4 = uv1
		slot6 = slot4

		for slot6 = 0, slot4.count(slot6) - 1 do
			if tolua.cast(uv1:objectAtIndex(slot6), "CCSprite"):convertToNodeSpace(ccp(slot1, slot2)).x >= 0 and slot8.y >= 0 and slot8.x <= slot7:getContentSize().width and slot8.y <= slot7:getContentSize().height then
				uv2 = slot7

				uv3:reorderChild(slot7, 9)

				return true
			end
		end

		uv2 = nil

		return false
	elseif slot0 == "moved" then
		if uv2 ~= nil then
			uv2:setPosition(uv3:convertToNodeSpace(ccp(slot1, slot2)))
		end
	elseif uv2 ~= nil then
		uv3:reorderChild(uv2, 2)
		uv4(slot1, slot2)
	end
end

function getPlayerCardLayer(slot0, slot1)
	uv0 = slot0
	uv1 = false
	uv2 = CCLayer:create()
	uv3 = {}

	for slot5, slot6 in pairs(slot1) do
		uv3["" .. slot5] = slot6
	end

	require("script/utils/LuaUtil")

	uv4 = uv0.width * 0.2

	uv5()
	uv2:setTouchEnabled(true)
	uv2:registerScriptTouchHandler(uv6, false, -500, true)

	return uv2
end

function getPlayerCardList(slot0)
	playerCardList = CCArray:create()

	for slot4 = 0, 5 do
		if uv0:getChildByTag(1000 + slot4) ~= nil then
			playerCardList:addObject(slot5)
		end
	end

	playerCardList:retain()

	return playerCardList
end

function setSwitchable(slot0)
	uv0 = slot0

	require("script/ui/formation/FormationUtil")

	for slot4 = 0, 5 do
		if FormationUtil.isOpenedByPosition(slot4) == true then
			if uv1:getChildByTag(2000 + slot4) then
				slot5:setVisible(uv0)
			end
		elseif uv1:getChildByTag(2000 + slot4) then
			slot5:setVisible(false)
		end
	end
end

function release(...)
end
