RefController = RefController or BaseClass(BaseController)

function RefController.config(slot0)
end

function RefController.openView(slot0, slot1, slot2, slot3)
	if not slot0.ref_ui then
		slot0.ref_ui = RefPanel.New()
	end

	slot0:setFrom(slot1)
	slot0.ref_ui:open(slot2, slot3)

	slot0.open_flag = true
end

function RefController.closeView(slot0)
	if slot0.ref_ui then
		slot0.ref_ui:close()

		slot0.ref_ui = nil
	end

	slot0:setFrom(nil)
end

function RefController.registerProtocals(slot0)
	slot0:RegisterProtocal(12418, "handle12418")
	slot0:RegisterProtocal(12419, "handle12419")
	slot0:RegisterProtocal(11221, "handle11221")
	slot0:RegisterProtocal(11222, "handle11222")
	slot0:RegisterProtocal(10535, "handle10535")
	slot0:RegisterProtocal(10536, "handle10536")
end

function RefController.buildItemMsg(slot0, slot1, slot2, slot3, slot4)
	if (slot4 or 0) > 1 then
		slot6 = Config.ItemData.data_get_data(slot1).name .. "x" .. slot4
	end

	if slot5 then
		return string.format("<div fontcolor=%s href=%s|%s|%s>[%s]</div>", tranformC3bTostr(BackPackConst.ref_color[slot5.quality]), ChatConst.Link.Item_Show, slot2, slot3, slot6)
	end
end

function RefController.buildMisMsg(slot0, slot1, slot2)
	if slot1 then
		return string.format("<div fontcolor=%s click=%s|%s|%s>[%s]</div>", tranformC3bTostr(18), ChatConst.Link.Mission, slot2, slot1.mis_bid, MissionTitleII[slot1.mis_type] .. "-" .. MissionUtil.replaceColor(slot1.mis_content, MissionLinkColor, true))
	end
end

function RefController.buildPartnerMsg(slot0, slot1, slot2)
	if HeroCalculate.getPartnerById(slot1) and Config.PartnerBase[slot3.bid] then
		slot5 = slot3.color or 2
		slot7 = HeroCalculate.getPrefixNameByVoForSpecial(slot3)

		if slot3.stage > 0 then
			slot6 = string.format("%s+%s", slot4.name, slot3.stage)
		end

		return string.format("<div fontcolor=%s click=%s|%s|%s>[%s]</div>", c3bToStr(BackPackConst.quality_3_color[slot5]), ChatConst.Link.Partner, slot2, slot1, string.format("%s%s", slot7, slot6))
	end
end

function RefController.getFrom(slot0)
	return slot0.where or "chatPanel"
end

function RefController.setFrom(slot0, slot1)
	slot0.where = slot1
end

function RefController.getChannel(slot0)
	return ChatCtrl:getRefChannel(slot0.where)
end

function RefController.showGoods(slot0, slot1, slot2)
end

function RefController.getGoodsTips(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0:SendProtocal(10536, {
		srv_id = slot2,
		id = slot1
	})
end

function RefController.handle10536(slot0, slot1)
	slot2 = GoodsVo.New()

	slot2:initAttrData(slot1)

	if slot2.config == nil then
		message(TI18N("数据异常"))

		return
	end

	if BackPackConst.checkIsEquip(slot2.config.type) then
		HeroController:getInstance():openEquipTips(true, slot2, PartnerConst.EqmTips.other)
	elseif BackPackConst.checkIsArtifact(slot2.config.type) then
		HeroController:getInstance():openArtifactTipsWindow(true, slot2, PartnerConst.ArtifactTips.normal)
	else
		TipsManager:getInstance():showGoodsTips(slot2.config)
	end
end

function RefController.showMission(slot0, slot1, slot2)
	if GameData:getInstance():getRoleVo().lev < 25 then
		message(getString("25级方可发送，请提升等级！"))

		return
	end

	if not ChatMgr:getInstance():canSpeak(slot2) then
		return
	end

	slot0.show_mission_vo = slot1
	slot0.show_channel = slot2
	slot3 = ProtocalRulesMgr:getInstance():GetPrototype(12418)
	slot3.mission_bid = slot1.mis_bid

	slot0:SendProtocal(slot3)
end

function RefController.clickMission(slot0, slot1, slot2, slot3)
	slot0.show_click_pos = slot2
	slot4 = ProtocalRulesMgr:getInstance():GetPrototype(12419)
	slot4.srv_id = slot3
	slot4.uniq_id = slot1

	slot0:SendProtocal(slot4)
end

function RefController.handle12418(slot0, slot1)
	if slot1.uniq_id > 0 and slot0:buildMisMsg(slot0.show_mission_vo, slot1.uniq_id) then
		ChatCtrl:getInstance():sendMessage(slot2, slot0.show_channel, nil, 2)
	end
end

function RefController.handle12419(slot0, slot1)
	if slot1.mission_bid == 0 then
		message(getString("任务数据已过期"))

		return
	end

	slot2 = MissionCtrl:getInstance():createMis(slot1, true, true)

	if slot0.show_click_pos and slot2 then
		CommonTipsManager:getInstance():showCommonTipsII(string.format(getString("任务名称：<div fontcolor=#00ff00>%s</div>"), slot2.mis_config.name) .. string.format(getString("\n任务目标：<div fontcolor=#00ff00>%s</div>"), MissionUtil.replaceColor(slot2.mis_content, MissionColor)) .. string.format(getString("\n任务描述：<div fontcolor=#00ff00>%s</div>"), MissionUtil.replaceColor(slot2.mis_config.desc, MissionColor)), slot0.show_click_pos)
	end
end

function RefController.showPartner(slot0, slot1, slot2, slot3)
	if GameData:getInstance():getRoleVo().lev < 25 then
		message(getString("25级方可发送，请提升等级！"))

		return
	end

	if not ChatMgr:getInstance():canSpeak(slot3) then
		return
	end

	slot0.show_channel = slot3
	slot0.show_partner_id = slot2
	slot4 = ProtocalRulesMgr:getInstance():GetPrototype(11222)
	slot4.id = slot2

	slot0:SendProtocal(slot4)
end

function RefController.clickPartner(slot0, slot1, slot2, slot3)
	slot0.show_click_pos = slot2
	slot4 = ProtocalRulesMgr:getInstance():GetPrototype(11221)
	slot4.srv_id = slot3
	slot4.cache_id = slot1

	slot0:SendProtocal(slot4)
end

function RefController.handle11222(slot0, slot1)
	message(slot1.msg)

	if slot1.code > 0 and slot0.show_partner_id > 0 and slot0:buildPartnerMsg(slot0.show_partner_id, slot1.code) then
		ChatCtrl:getInstance():sendMessage(slot2, slot0.show_channel, nil, 2)
	end
end

function RefController.handle11221(slot0, slot1)
	if #slot1.partner_list == 0 then
		message(getString("伙伴数据已过期"))

		return
	else
		slot2 = {}

		for slot6, slot7 in pairs(slot1.eqm_list) do
			slot8 = GoodsVo.New()

			slot8:initAttrData(slot7)
			table.insert(slot2, slot8)
		end

		slot3 = HeroVo.New()

		slot3:updateHeroVo(slot1.partner_list[1])

		slot3.eqv_list = slot2

		HeroEquipCtrl:getInstance():openShowPanel(slot3)
	end
end

function RefController.send10535(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(10535, {
		type = slot1,
		id = slot2,
		partner_id = slot3,
		code = slot4
	})
end

function RefController.handle10535(slot0, slot1)
	if slot1.flag == 1 then
		GlobalEvent:getInstance():Fire(EventId.CHAT_SELECT_ITEM, slot1, slot0:getFrom())
	else
		message(slot1.msg)
	end
end

function RefController.setGreenting(slot0, slot1)
	if slot1 then
		slot0.greeting_now = slot1
	end
end
