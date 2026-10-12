BattleTacticalSTips = BattleTacticalSTips or BaseClass()
slot0 = string.format

function BattleTacticalSTips.__init(slot0, slot1, slot2)
	if slot2 ~= nil then
		slot0.parent = slot2
	end

	slot0.delay = slot1 or 3
	slot0.WIDTH = 475
	slot0.HEIGHT = 235

	slot0:createRootWnd()
end

function BattleTacticalSTips.createRootWnd(slot0)
	slot0:LoadLayoutFinish()
	slot0:registerCallBack()
end

function BattleTacticalSTips.LoadLayoutFinish(slot0)
	slot0.screen_bg = ccui.Layout:create()

	slot0.screen_bg:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.screen_bg:setContentSize(cc.size(SCREEN_WIDTH, display.height))
	slot0.screen_bg:setTouchEnabled(true)
	slot0.screen_bg:setSwallowTouches(false)

	slot0.root_wnd = ccui.Widget:create()

	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:setAnchorPoint(cc.p(0, 0))
	slot0.root_wnd:setPosition(cc.p(0, 0))
	slot0.screen_bg:addChild(slot0.root_wnd)

	slot0.info_layer = ccui.Layout:create()

	slot0.info_layer:setCascadeOpacityEnabled(true)
	slot0.info_layer:setOpacity(0)
	slot0.screen_bg:addChild(slot0.info_layer)
	slot0.info_layer:runAction(cc.Spawn:create(cc.FadeIn:create(0.2)))

	slot1 = ccui.ImageView:create(PathTool.getResFrame("common", "common_30001"), LOADTEXT_TYPE_PLIST)

	slot1:setAnchorPoint(cc.p(0, 1))
	slot1:setScale9Enabled(true)
	slot1:setCapInsets(cc.rect(22, 22, 1, 1))

	slot0.info_layer.back = slot1

	slot0.info_layer:addChild(slot1)
end

function BattleTacticalSTips.isShowPer(slot0, slot1)
	if slot1 == "hit_rate" or slot1 == "dodge_rate" or slot1 == "crit_rate" or slot1 == "crit_ratio" or slot1 == "hit_magic" or slot1 == "dodge_magic" or slot1 == "dam" or slot1 == "res" or slot1 == "be_cure" or slot1 == "cure" or slot1 == "res_p" or slot1 == "dam_s" or slot1 == "res_s" or slot1 == "dam_p" then
		return true
	end

	return false
end

function BattleTacticalSTips.isRestrainS(slot0, slot1, slot2)
	for slot7 = 1, #Config.FormationData.data_form_data[slot1].restrain_s do
		if slot3[slot7] == slot2 then
			return true
		end
	end

	return false
end

function BattleTacticalSTips.setTacticalInfo(slot0, slot1, slot2)
	slot4 = slot1[2]
	slot5 = createRichLabel(20, 10, cc.p(0, 1), nil, 0, 0, slot0.WIDTH - 20)
	slot6 = ""

	if Config.FormationData.data_form_data[slot1[1]] == nil then
		return
	end

	if slot2 then
		slot10 = slot2[2]

		if slot2[1] ~= slot3 then
			if slot0:isRestrainS(slot3, slot9) then
				slot6 = uv0("<div fontcolor=#14ff32 fontsize = 24>%s</div>", TI18N("[克制敌方]"))
			elseif slot0:isRestrainS(slot9, slot3) then
				slot6 = uv0("<div fontcolor=#E23737 fontsize = 24>%s</div>", TI18N("[被克]"))
			end
		end
	end

	slot5:setString(uv0("<div fontcolor=#e260ff fontsize=24>%s  </div>%s\n", slot8.name, slot6))
	slot0.info_layer.back:addChild(slot5)

	slot12 = 0
	slot11 = 0 + slot5:getSize().height
	slot15 = {}

	function slot16(slot0, slot1, slot2)
		slot3 = ""

		if not slot0[1] then
			return
		end

		for slot7 = 1, #slot0 do
			slot8 = slot0[slot7]
			slot9 = Config.AttrData.data_key_to_name[slot8[1]]

			if slot8[2] ~= nil then
				slot10 = slot8[2]

				if slot8[2] < 0 then
					if PartnerCalculate.isShowPerByStr(tostring(slot8[1])) == true then
						slot10 = tostring(slot8[2] / 10) .. "%"
					end

					slot3 = string.format("%s<div fontcolor=#ffffdc>%s</div><div fontcolor=#ff5050>%s</div>", slot3, slot9, slot10)
				else
					if PartnerCalculate.isShowPerByStr(tostring(slot8[1])) == true then
						slot10 = tostring(slot8[2] / 10) .. "%"
					end

					slot3 = string.format("%s<div fontcolor=#ffffdc>%s</div>+%s", slot3, slot9, slot10)
				end
			end
		end

		return string.format("<div fontcolor=#ffffdc>%s%s:  </div><div fontcolor=#14ff32>%s</div>", TI18N("位置"), slot1 or 0, slot3)
	end

	slot17 = #slot7[slot3].pos or 5

	for slot21 = 1, slot17 do
		slot24 = Config.FormationData.data_form_attr[slot3][slot4]["attr_" .. slot13[slot21][2]]

		if not slot15[slot21] then
			slot25 = createRichLabel(20, 159, cc.p(0, 1), nil, 0, 0, slot0.WIDTH - 20)

			slot0.info_layer.back:addChild(slot25)

			slot15[slot21] = slot25
		end

		slot15[slot21]:setString(slot16(slot24, slot23, slot21))

		slot11 = slot11 + slot15[slot21]:getSize().height
	end

	slot12 = 10 * slot17 + slot11
	slot20 = ""
	slot21 = Config.FormationData.data_form_cost.restrain_effect
	slot25 = createRichLabel(20, 159, cc.p(0, 1), nil, 8, 0, slot0.WIDTH - 20)

	slot0.info_layer.back:addChild(slot25)

	for slot25 = 1, #slot7[slot3].restrain_s do
		if slot18[slot25] and slot7[slot26] then
			if slot20 ~= "" then
				slot20 = slot20 .. ","
			end

			slot20 = uv0("%s%s", slot20, slot27.name)
		end
	end

	slot24 = ""
	slot28 = createRichLabel(20, 159, cc.p(0, 1), nil, 8, 0, slot0.WIDTH - 20)

	slot0.info_layer.back:addChild(slot28)

	for slot28 = 1, #slot7[slot3].restrain_w do
		if slot22[slot28] and slot7[slot29] then
			if slot24 ~= "" then
				slot24 = slot24 .. ","
			end

			slot24 = uv0("%s%s", slot24, slot30.name)
		end
	end

	slot19:setString(uv0(TI18N("克制:  <div fontcolor=#14ff32>%s</div>\n被克制:  <div fontcolor=#0xc81414>%s</div>\n%s"), slot20, slot24, string.gsub(slot21.desc or "", "249003", "14ff32")))
	slot0.info_layer.back:setContentSize(slot0.WIDTH, slot11 + slot19:getSize().height + cc.size(0, 0).height + 45)
	slot5:setPosition(25, slot0.info_layer.back:getContentSize().height - 17)

	for slot32 = 1, slot17 do
		slot15[slot32]:setPosition(25, slot5:getPositionY() - slot5:getSize().height - 10 - (slot32 - 1) * (10 + slot15[slot32]:getSize().height))
	end

	slot19:setPosition(25, slot0.info_layer.back:getContentSize().height - slot12 - 27)
	slot0:adjust()
end

function BattleTacticalSTips.adjust(slot0)
	if slot0.parent and not tolua.isnull(slot0.parent) then
		slot2 = slot0.info_layer:convertToNodeSpace(slot0.parent:convertToWorldSpace(cc.p(0, 0)))
		slot3 = slot2.x
		slot4 = slot2.y

		if SCREEN_WIDTH < slot2.x + slot0.info_layer.back:getContentSize().width then
			slot3 = SCREEN_WIDTH - slot5.width
		end

		if slot2.y - slot5.height < 0 then
			slot4 = slot5.height
		end

		slot0.info_layer:setPosition(slot3, slot4)
	else
		slot0.info_layer:setPosition(0 + slot0.info_layer.back:getContentSize().width / 2, display.height / 2)
	end
end

function BattleTacticalSTips.registerCallBack(slot0)
	slot0.screen_bg:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			TipsManager:getInstance():hideTips()
		end
	end)
end

function BattleTacticalSTips.setPosition(slot0, slot1, slot2)
	slot0.root_wnd:setAnchorPoint(cc.p(0, 1))
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function BattleTacticalSTips.setPos(slot0, slot1, slot2)
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function BattleTacticalSTips.getContentSize(slot0)
	return slot0.root_wnd:getContentSize()
end

function BattleTacticalSTips.getScreenBg(slot0)
	return slot0.screen_bg
end

function BattleTacticalSTips.open(slot0)
	ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):addChild(slot0.screen_bg)
	slot0.screen_bg:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)
	doStopAllActions(slot0.screen_bg)
	delayRun(slot0.screen_bg, 5000, function ()
		TipsManager:getInstance():hideTips()
	end)
end

function BattleTacticalSTips.close(slot0)
	slot0.info_layer:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.CallFunc:create(function ()
		doStopAllActions(uv0.screen_bg)
		uv0.screen_bg:removeFromParent()
	end)))
end
