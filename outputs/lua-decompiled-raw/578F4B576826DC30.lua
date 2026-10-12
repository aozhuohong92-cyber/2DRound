require("script/utils/BaseUI")
require("script/utils/extern")
require("script/model/DataCache")
module("PlayerMoneyTreeLayer", package.seeall)

slot0 = 0
slot1, slot2 = nil

function createMoneyTreeLayer(slot0)
	slot1 = CCLayer:create()
	slot2 = slot1:getContentSize()
	uv0 = CCScale9Sprite:create("images/battle/moneytree/labelbg.png")

	uv0:setContentSize(CCSizeMake(240, 100))
	uv0:setAnchorPoint(ccp(0, 1))
	uv0:setPosition(ccp(slot2.width * 0, slot2.height * 0.67))
	slot1:addChild(uv0, 2)
	uv0:setScale(MainScene.elementScale)

	slot3 = CCRenderLabel:create(GetLocalizeStringBy("lcy_50115"), g_sFontPangWa, 24, 0, ccc3(0, 0, 0), type_stroke)

	slot3:setColor(ccc3(255, 228, 0))

	slot6 = CCRenderLabel:create("" .. DataCache.getBakBossTreeLevel(), g_sFontPangWa, 24, 0, ccc3(0, 0, 0), type_stroke)

	slot6:setColor(ccc3(255, 228, 0))

	slot7 = BaseUI.createHorizontalNode({
		slot3,
		CCSprite:create("images/common/lv.png"),
		slot6
	})

	slot7:setAnchorPoint(ccp(0, 1))
	slot7:setPosition(ccp(10, uv0:getContentSize().height - 10))
	uv0:addChild(slot7)

	slot8 = CCScale9Sprite:create("images/battle/moneytree/labelbg.png")

	slot8:setContentSize(CCSizeMake(240, 40))
	slot8:setAnchorPoint(ccp(0, 1))
	slot8:setPosition(ccp(slot2.width * 0, slot2.height * 0.55))
	slot1:addChild(slot8, 2)
	slot8:setScale(MainScene.elementScale)

	slot9 = CCSprite:create("images/battle/moneytree/damage_label.png")

	slot9:setAnchorPoint(ccp(0, 0.5))
	slot9:setPosition(slot8:getContentSize().width * 0.05, slot8:getContentSize().height * 0.5)
	slot8:addChild(slot9)

	slot10 = CCRenderLabel:create("0", g_sFontPangWa, 24, 0, ccc3(0, 0, 0), type_stroke)

	slot10:setColor(ccc3(255, 228, 0))
	slot10:setAnchorPoint(ccp(0, 0.5))
	slot10:setPosition(slot8:getContentSize().width * 0.55, slot8:getContentSize().height * 0.5)
	slot8:addChild(slot10)

	slot11 = CCScale9Sprite:create("images/battle/moneytree/labelbg.png")

	slot11:setContentSize(CCSizeMake(240, 40))
	slot11:setAnchorPoint(ccp(0, 1))
	slot11:setPosition(ccp(slot2.width * 0, slot2.height * 0.5))
	slot1:addChild(slot11, 2)
	slot11:setScale(MainScene.elementScale)

	slot12 = CCSprite:create("images/battle/moneytree/silver_label.png")

	slot12:setAnchorPoint(ccp(0, 0.5))
	slot12:setPosition(slot11:getContentSize().width * 0.05, slot11:getContentSize().height * 0.5)
	slot11:addChild(slot12)

	slot13 = CCRenderLabel:create("0", g_sFontPangWa, 24, 0, ccc3(0, 0, 0), type_stroke)

	slot13:setColor(ccc3(233, 233, 232))
	slot13:setAnchorPoint(ccp(0, 0.5))
	slot13:setPosition(slot11:getContentSize().width * 0.55, slot11:getContentSize().height * 0.5)
	slot11:addChild(slot13)

	slot14 = CCScale9Sprite:create("images/battle/moneytree/labelbg.png")

	slot14:setContentSize(CCSizeMake(240, 40))
	slot14:setAnchorPoint(ccp(0, 1))
	slot14:setPosition(ccp(slot2.width * 0, slot2.height * 0.45))
	slot1:addChild(slot14, 2)
	slot14:setScale(MainScene.elementScale)

	slot15 = CCSprite:create("images/battle/moneytree/round_label.png")

	slot15:setAnchorPoint(ccp(0, 0.5))
	slot15:setPosition(slot14:getContentSize().width * 0.05, slot14:getContentSize().height * 0.5)
	slot14:addChild(slot15)
	require("db/DB_Army")

	slot18 = CCRenderLabel:create("0/" .. DB_Army.getDataById(tonumber(slot0)).fight_round, g_sFontPangWa, 24, 0, ccc3(0, 0, 0), type_stroke)

	slot18:setColor(ccc3(0, 255, 24))
	slot18:setAnchorPoint(ccp(0, 0.5))
	slot18:setPosition(slot14:getContentSize().width * 0.55, slot14:getContentSize().height * 0.5)
	slot14:addChild(slot18)

	slot19 = 0

	function slot1.battleBlockChanged(slot0)
		if slot0 == nil then
			return
		end

		if slot1.arrReaction ~= nil then
			for slot5 = 1, #slot1.arrReaction do
				print("PlayerMoneyTreeLayer 1")

				if slot1.arrReaction[slot5].defender == 2701011 and slot1.arrReaction[slot5].arrDamage ~= nil then
					print("PlayerMoneyTreeLayer 2")

					uv0 = uv0 + tonumber(slot1.arrReaction[slot5].arrDamage[1].damageValue)

					if slot1.arrReaction[slot5].buffer ~= nil and slot1.arrReaction[slot5].buffer[1].type == 9 then
						print("PlayerMoneyTreeLayer 3", slot1.arrReaction[slot5].buffer[1].data)

						uv0 = uv0 + tonumber(slot1.arrReaction[slot5].buffer[1].data)
					end
				end
			end
		end

		if slot1.arrChild ~= nil then
			for slot5 = 1, #slot1.arrChild do
				if slot1.arrChild[slot5].arrReaction ~= nil then
					for slot9 = 1, #slot1.arrChild[slot5].arrReaction do
						if slot1.arrChild[slot5].arrReaction[slot9].defender == 2701011 and slot1.arrChild[slot5].arrReaction[slot9].arrDamage ~= nil then
							uv0 = uv0 + tonumber(slot1.arrChild[slot5].arrReaction[slot9].arrDamage[1].damageValue)

							if slot1.arrChild[slot5].arrReaction[slot9].buffer ~= nil and slot1.arrChild[slot5].arrReaction[slot9].buffer[1].type == 9 then
								uv0 = uv0 + tonumber(slot1.arrChild[slot5].arrReaction[slot9].buffer[1].data)
							end
						end
					end
				end
			end
		end

		uv1:setString(slot1.round .. "/" .. uv2)
		uv3:setString("" .. uv0)
		print("treeDamage:", uv0)

		slot2 = 0

		uv4:setString("" .. math.floor(uv0 < 5000 and uv0 * 0.1 + 0 or uv0 < 10000 and uv0 * 0.1 + 15000 or uv0 < 20000 and uv0 * 0.1 + 35000 or uv0 < 50000 and uv0 * 0.1 + 55000 or uv0 < 100000 and uv0 * 0.1 + 85000 or uv0 < 200000 and uv0 * 0.1 + 135000 or uv0 < 300000 and uv0 * 0.1 + 180000 or uv0 < 400000 and uv0 * 0.1 + 235000 or uv0 < 500000 and uv0 * 0.1 + 285000 or uv0 < 600000 and uv0 * 0.1 + 335000 or uv0 < 800000 and uv0 * 0.1 + 385000 or uv0 < 1000000 and uv0 * 0.1 + 435000 or uv0 * 0.1 + 485000))
	end

	return slot1
end

function setBoosLife(slot0)
	uv0 = slot0

	if not tolua.cast(uv1, "CCScale9Sprite") then
		return
	end

	if uv2 ~= nil then
		uv2:removeFromParentAndCleanup(true)

		uv2 = nil
	end

	slot1 = CCRenderLabel:create(GetLocalizeStringBy("lcy_50116"), g_sFontPangWa, 24, 0, ccc3(0, 0, 0), type_stroke)

	slot1:setColor(ccc3(255, 228, 0))
	slot1:setAnchorPoint(ccp(0, 0.5))

	slot3 = CCRenderLabel:create("" .. (uv0 or 0), g_sFontPangWa, 24, 0, ccc3(0, 0, 0), type_stroke)

	slot3:setColor(ccc3(0, 254, 24))
	slot3:setAnchorPoint(ccp(0, 0.5))

	slot4 = BaseUI.createHorizontalNode({
		slot1,
		slot3
	})

	slot4:setAnchorPoint(ccp(0, 0))
	slot4:setPosition(ccp(10, 10))
	uv1:addChild(slot4)
end

function release(...)
end
