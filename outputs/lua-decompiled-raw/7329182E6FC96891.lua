TipsManager = TipsManager or BaseClass()

function TipsManager.getInstance(slot0)
	if not slot0.is_init then
		slot0.tips_list = {}
		slot0.delay = 0
		slot0.is_init = true
	end

	return slot0
end

function TipsManager.hideTips(slot0)
	for slot4, slot5 in pairs(slot0.tips_list) do
		if slot5.close ~= nil then
			slot5:close()

			slot5 = nil
		end
	end

	slot0.tips_list = {}

	GlobalEvent:getInstance():Fire(TipsEvent.TipsCloseEvent)
end

function TipsManager.ishideTips(slot0)
	return slot0.is_hide
end

function TipsManager.showSkillTips(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if type(slot1) == "number" then
		slot1 = Config.SkillData.data_get_skill(slot1)
	end

	slot7 = SkillTips.New()

	slot7:open(slot1, slot2, slot3, slot4, slot5, slot6)
	table.insert(slot0.tips_list, slot7)

	return slot7
end

function TipsManager.showHalidomSkillTips(slot0, slot1)
	slot2 = HalidomSkillTips.New()

	slot2:open(slot1)
	table.insert(slot0.tips_list, slot2)

	return slot2
end

function TipsManager.showGoodsTips(slot0, slot1, slot2, slot3, slot4)
	slot5 = BackpackTips.New()

	slot5:open(slot1, slot2, slot3, slot4)
	table.insert(slot0.tips_list, slot5)

	return slot5
end

function TipsManager.showBackPackCompTips(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.comp_tips then
			slot0.comp_tips = BackpackCompTips.New()
		end

		slot0.comp_tips:open(slot2)
	elseif slot0.comp_tips then
		slot0.comp_tips:close()

		slot0.comp_tips = nil
	end
end

function TipsManager.showCompChooseTips(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.choose_tips then
			slot0.choose_tips = CompChooseTips.New()
		end

		slot0.choose_tips:open(slot2, slot3)
	elseif slot0.choose_tips then
		slot0.choose_tips:close()

		slot0.choose_tips = nil
	end
end

function TipsManager.showWeekCardTips(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.weekcard_tips then
			slot0.weekcard_tips = WeekCardTips.New()
		end

		slot0.weekcard_tips:open(slot2)
	elseif slot0.weekcard_tips then
		slot0.weekcard_tips:close()

		slot0.weekcard_tips = nil
	end
end

function TipsManager.showBuffTips(slot0, slot1, slot2, slot3)
	slot4 = BattleBuffTips.New(slot3)

	slot4:open()
	slot4:showTipsByVo(slot1)
	slot0:adjustTipsPosition(slot4, slot2)
	table.insert(slot0.tips_list, slot4)

	return slot4
end

function TipsManager.showBattleSkillTips(slot0, slot1, slot2, slot3, slot4)
	slot5 = BattleSkillTips.New(slot3, slot4, slot2)

	slot5:open()
	slot5:setSkillInfo(slot1, slot2)

	slot0.is_hide = false

	table.insert(slot0.tips_list, slot5)

	return slot5
end

function TipsManager.showBattleTacticalTips(slot0, slot1, slot2, slot3, slot4)
	slot5 = BattleTacticalSTips.New(slot2, slot3)

	slot5:open()
	slot5:setTacticalInfo(slot1, slot4)
	table.insert(slot0.tips_list, slot5)

	return slot5
end

function TipsManager.showCommonTips(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot0.common_tips ~= nil then
		slot0.common_tips:close()

		slot0.common_tips = nil
	end

	slot0.common_tips = CommonTips.New(slot4)

	slot0.common_tips:open()
	slot0.common_tips:showTips(slot1, slot5 or 400, slot3 or 24)
	slot0:adjustTipsPosition(slot0.common_tips, slot2, nil, slot6)
	table.insert(slot0.tips_list, slot0.common_tips)

	return slot0.common_tips
end

function TipsManager.showAdventureBuffTips(slot0, slot1, slot2, slot3)
	if slot0.adventure_buff_tips then
		slot0.adventure_buff_tips:close()

		slot0.adventure_buff_tips = nil
	end

	slot0.adventure_buff_tips = AdventureBuffTips.New(slot1, slot3)

	slot0.adventure_buff_tips:open()
	slot0.adventure_buff_tips:showTips()
	slot0:adjustTipsPosition(slot0.adventure_buff_tips, slot2)
	table.insert(slot0.tips_list, slot0.adventure_buff_tips)

	return slot0.adventure_buff_tips
end

function TipsManager.ShareTips(slot0, slot1, slot2, slot3, slot4)
	if slot0.share_tips ~= nil then
		slot0.share_tips:close()

		slot0.share_tips = nil
	end

	slot0.share_tips = ShareTips.New(slot4)

	slot0.share_tips:open()
	slot0.share_tips:showTips(slot1, slot3)
	slot0:adjustTipsPosition(slot0.share_tips, slot2)
	table.insert(slot0.tips_list, slot0.share_tips)

	return slot0.share_tips
end

function TipsManager.adjustTipsPosition(slot0, slot1, slot2, slot3, slot4)
	slot6 = slot3 or slot1.root_wnd:getContentSize()
	slot8 = 10
	slot10 = ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):convertToNodeSpace(slot2)
	slot12 = slot10.y

	if cc.size(SCREEN_WIDTH, SCREEN_HEIGHT).width < slot10.x + cc.size(slot6.width, slot6.height).width then
		slot11 = slot5.width - slot7.width
	elseif slot11 < slot7.width then
		slot11 = slot11 + 20
	end

	if slot4 then
		slot11 = (slot5.width - slot7.width) / 2
	end

	if slot5.height < slot12 then
		slot12 = slot5.height
	elseif slot12 < slot7.height then
		slot12 = slot12 + slot7.height + 20
	end

	slot1:setPosition(slot11, slot12 - display.getBottom())
end

function TipsManager.showFaceTips(slot0, slot1, slot2, slot3)
	slot4 = RoleFaceTips.New()

	slot4:setData(slot1, slot2)
	table.insert(slot0.tips_list, slot4)

	if slot3 then
		slot4.main_container:setAnchorPoint(cc.p(0, 0))
		slot0:adjustTipsPosition(slot4.main_container, slot3, slot4.main_container:getContentSize())
	end

	return slot4
end

function TipsManager.showElfinTips(slot0, slot1, slot2)
	slot3 = ElfinTipsWindow.New()

	slot3:open(slot1, slot2)
	table.insert(slot0.tips_list, slot3)

	return slot3
end

function TipsManager.getCompTipsRoot(slot0)
	if slot0.comp_tips ~= nil then
		return slot0.comp_tips.root_wnd
	end
end
