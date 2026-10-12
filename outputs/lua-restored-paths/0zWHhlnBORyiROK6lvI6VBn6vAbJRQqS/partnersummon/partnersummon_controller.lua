PartnersummonController = PartnersummonController or BaseClass(BaseController)

function PartnersummonController.config(slot0)
	slot0.model = PartnersummonModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function PartnersummonController.getModel(slot0)
	return slot0.model
end

function PartnersummonController.registerEvents(slot0)
	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
			if GuideController:getInstance():isInGuide() == false then
				uv0:openPartnerSummonWindow(false)
			end

			uv0.req_flag = false
		end)
	end

	if not slot0.get_new_partner_event then
		slot0.get_new_partner_event = GlobalEvent:getInstance():Bind(MainuiEvent.CLOSE_ITEM_VIEW, function ()
			if uv0.is_add_partner == true and uv0.add_partner_data then
				uv0:openSummonGainShowWindow(true, uv0.add_partner_data)

				uv0.is_add_partner = false
				uv0.add_partner_data = nil
			end
		end)
	end

	if not slot0.battle_result_event then
		slot0.battle_result_event = GlobalEvent:getInstance():Bind(BattleEvent.CLOSE_RESULT_VIEW, function ()
			if uv0.is_add_partner == true and uv0.add_partner_data then
				uv0:openSummonGainShowWindow(true, uv0.add_partner_data)

				uv0.is_add_partner = false
				uv0.add_partner_data = nil
			end
		end)
	end
end

function PartnersummonController.registerProtocals(slot0)
	slot0:RegisterProtocal(23203, "handle23203")
	slot0:RegisterProtocal(23204, "handle23204")
	slot0:RegisterProtocal(11095, "handle11095")
	slot0:RegisterProtocal(23212, "handle23212")
end

function PartnersummonController.send23200(slot0)
	slot0:SendProtocal(23200, {})
end

function PartnersummonController.handle23200(slot0, slot1)
	if slot1 then
		slot0.model:setSummonData(slot1)
	end
end

function PartnersummonController.send23201(slot0, slot1, slot2, slot3)
	slot0.req_flag = true

	slot0:SendProtocal(23201, {
		group_id = slot1,
		times = slot2,
		recruit_type = slot3
	})
end

function PartnersummonController.handle23201(slot0, slot1)
	if slot1 then
		slot0:openSummonGainWindow(false)
		slot0:openSummonGainWindow(true, slot1, TRUE)

		slot0.req_flag = false

		slot0.model:setFiveStarHeroIsOut(slot1.must_five_num)
		GlobalEvent:getInstance():Fire(PartnersummonEvent.SummonMustFiveStarEvent)
	end
end

function PartnersummonController.handle23202(slot0, slot1)
	if slot1 then
		slot0.model:updateExtendData(slot1)
	end
end

function PartnersummonController.send23203(slot0)
	slot0:SendProtocal(23203, {})
end

function PartnersummonController.handle23203(slot0, slot1)
	message(slot1.msg)

	if slot1 and slot1.code == 1 then
		slot0.model:setShareData(slot1)
	end
end

function PartnersummonController.handle23204(slot0, slot1)
	if slot1 and slot1.recruit_group then
		slot0.model:updateRecruitData(slot1.recruit_group)
	end
end

function PartnersummonController.openPartnerSummonWindow(slot0, slot1)
	NewPartnersummonController:getInstance():openNewPartnerSummonWindow(slot1)
end

function PartnersummonController.openGodPartnerSummonView(slot0, slot1)
	if slot1 == true then
		if slot0.godpartner_summon_view == nil then
			slot0.godpartner_summon_view = PartnerSummonGodView.New()
		end

		if slot0.godpartner_summon_view:isOpen() == false then
			slot0.godpartner_summon_view:open()
		end
	elseif slot0.godpartner_summon_view then
		slot0.godpartner_summon_view:close()

		slot0.godpartner_summon_view = nil
	end
end

function PartnersummonController.openPartnerSummonScoreWindow(slot0, slot1)
	if slot1 == true then
		if slot0.score_summon_window == nil then
			slot0.score_summon_window = PartnerSummonScoreWindow.New()
		end

		if slot0.score_summon_window:isOpen() == false then
			slot0.score_summon_window:open()
		end
	elseif slot0.score_summon_window then
		slot0.score_summon_window:close()

		slot0.score_summon_window = nil
	end
end

function PartnersummonController.getSummonRoot(slot0)
	return NewPartnersummonController:getInstance():getSummonRoot()
end

function PartnersummonController.getSummonResultRoot(slot0)
	if slot0.partner_summon_gain_window then
		return slot0.partner_summon_gain_window.root_wnd
	end
end

function PartnersummonController.handle11095(slot0, slot1)
	if slot1.status == 1 then
		slot0:openSummonGainShowWindow(true, slot1)
	else
		slot0.is_add_partner = true
		slot0.add_partner_data = slot1
	end
end

function PartnersummonController.openSummonGainWindow(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.partner_summon_gain_window ~= nil then
			slot0.partner_summon_gain_window:close()

			slot0.partner_summon_gain_window = nil
		end
	else
		if slot0.partner_summon_gain_window == nil then
			slot0.partner_summon_gain_window = PartnerSummonGainWindow.New(slot3)
		end

		if slot0.partner_summon_gain_window:isOpen() == false then
			slot0.partner_summon_gain_window:open(slot2, slot3)
		end
	end
end

function PartnersummonController.openSummonGainShowWindow(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.partner_summon_gain_show_window ~= nil then
			slot0.partner_summon_gain_show_window:close()

			slot0.partner_summon_gain_show_window = nil
		end
	elseif slot2.partner_bid and Config.PartnerData.data_partner_base[slot2.partner_bid] and slot4.show_effect and slot4.show_effect == 1 then
		if slot0.partner_summon_gain_show_window == nil then
			slot0.partner_summon_gain_show_window = PartnerSummonGainShowWindow.New(slot3)
		end

		if slot0.partner_summon_gain_show_window:isOpen() == false then
			slot0.partner_summon_gain_show_window:open(slot2)
		end
	end
end

function PartnersummonController.handle23212(slot0, slot1)
end

function PartnersummonController.getSummonShowRoot(slot0)
	if slot0.partner_summon_gain_show_window then
		return slot0.partner_summon_gain_show_window.root_wnd
	end
end

function PartnersummonController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
