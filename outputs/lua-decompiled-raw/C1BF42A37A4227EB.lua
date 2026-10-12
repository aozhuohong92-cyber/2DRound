ArenapeakchampionController = ArenapeakchampionController or BaseClass(BaseController)

function ArenapeakchampionController.config(slot0)
	slot0.model = ArenapeakchampionModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function ArenapeakchampionController.getModel(slot0)
	return slot0.model
end

function ArenapeakchampionController.registerEvents(slot0)
end

function ArenapeakchampionController.registerProtocals(slot0)
	slot0:RegisterProtocal(27700, "handle27700")
	slot0:RegisterProtocal(27701, "handle27701")
	slot0:RegisterProtocal(27702, "handle27702")
	slot0:RegisterProtocal(27703, "handle27703")
	slot0:RegisterProtocal(27704, "handle27704")
	slot0:RegisterProtocal(27705, "handle27705")
	slot0:RegisterProtocal(27706, "handle27706")
	slot0:RegisterProtocal(27707, "handle27707")
	slot0:RegisterProtocal(27708, "handle27708")
	slot0:RegisterProtocal(27709, "handle27709")
	slot0:RegisterProtocal(27710, "handle27710")
	slot0:RegisterProtocal(27712, "handle27712")
	slot0:RegisterProtocal(27713, "handle27713")
	slot0:RegisterProtocal(27714, "handle27714")
	slot0:RegisterProtocal(27716, "handle27716")
	slot0:RegisterProtocal(27725, "handle27725")
	slot0:RegisterProtocal(27726, "handle27726")
	slot0:RegisterProtocal(27730, "handle27730")
	slot0:RegisterProtocal(27731, "handle27731")
end

function ArenapeakchampionController.sender27700(slot0)
	slot0:SendProtocal(27700, {})
end

function ArenapeakchampionController.handle27700(slot0, slot1)
	slot0.model:setMainData(slot1)
	GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_MAIN_EVENT, slot1)

	if not slot0.model:checkPeakChampionIsOpen(true) then
		return
	end

	if slot1.round_status == 2 or slot1.round_status == 1 then
		slot0.model:setMatchData256(nil, slot1.zone_id)
		slot0.model:setMatchData64(nil, slot1.zone_id)
		slot0.model:setMatchData8(nil, slot1.zone_id)
	end

	slot0.current_round_status = slot1.round_status

	if slot1.flag == 2 then
		GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_SHOW_VEDIO_EVENT, slot1)
	end

	if slot1.step_status == ArenaConst.champion_step_status.opened then
		if GuideController:getInstance():isInGuide() then
			return
		end

		if StoryController:getInstance():getModel():isStoryState() then
			return
		end

		if (slot1.flag == 3 or slot1.round_status == 2 and slot1.round_status_time - GameNet:getInstance():getTime() < 300) and not slot0.had_show_notice then
			ActivityController:openSignView(true, ActivitySignType.peak_champion_guess, {
				timer = true
			})

			slot0.had_show_notice = true
		end
	end

	if slot1.step_status == 2 and not slot0.init_27706 then
		slot0.init_27706 = true

		slot0:sender27706()
	end
end

function ArenapeakchampionController.sender27701(slot0)
	slot0:SendProtocal(27701, {})
end

function ArenapeakchampionController.handle27701(slot0, slot1)
	slot0.model:setMyGuessData(slot1)
	GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_SINGLE_INFO_EVENT, slot1)
end

function ArenapeakchampionController.sender27702(slot0)
	slot0:SendProtocal(27702, {})
end

function ArenapeakchampionController.handle27702(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_MY_MATCH_INFO_EVENT, slot1)
end

function ArenapeakchampionController.sender27708(slot0)
	slot0:SendProtocal(27708, {})
end

function ArenapeakchampionController.handle27708(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_MY_MATCH_LOG_EVENT, slot1)
end

function ArenapeakchampionController.sender27703(slot0)
	slot0:SendProtocal(27703, {})
end

function ArenapeakchampionController.handle27703(slot0, slot1)
	slot0.model:setBetTypeInfo(slot1.bet_type)
	GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_GUESSING_INFO_EVENT, slot1)
end

function ArenapeakchampionController.sender27704(slot0, slot1, slot2)
	slot0:SendProtocal(27704, {
		bet_type = slot1,
		bet_val = slot2
	})
end

function ArenapeakchampionController.handle27704(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0:sender27701()
		slot0.model:setBetTypeInfo(slot1.bet_type)
		GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_GUESSING_STAKE_EVENT, slot1)

		if slot0.arenapeakchampion_guess_count_panel then
			slot0.arenapeakchampion_guess_count_panel:onClickCloseBtn()
		end
	end
end

function ArenapeakchampionController.sender27705(slot0)
	slot0:SendProtocal(27705, {})
end

function ArenapeakchampionController.handle27705(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_MY_GUESSING_INFO_EVENT, slot1)
end

function ArenapeakchampionController.sender27706(slot0)
	slot0:SendProtocal(27706, {})
end

function ArenapeakchampionController.handle27706(slot0, slot1)
	slot0:openArenapeakchampionResultPanel(true, slot1)
end

function ArenapeakchampionController.sender27707(slot0)
	slot0:SendProtocal(27707, {})
end

function ArenapeakchampionController.handle27707(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_UPDATE_GUESSING_INFO_EVENT, slot1)
end

function ArenapeakchampionController.handle27716(slot0, slot1)
	if not slot0.arenapeakchampion_guessing_window then
		return
	end

	slot2 = os.time()

	if slot0.time == nil or slot2 - slot0.time > 3 then
		slot0.time = slot2

		slot0:sender27707()
	end
end

function ArenapeakchampionController.sender27709(slot0, slot1, slot2)
	slot0:SendProtocal(27709, {
		zone_id = slot1,
		type = slot2
	})
end

function ArenapeakchampionController.handle27709(slot0, slot1)
	if slot1.type == 1 then
		slot0.model:setMatchData256(slot1.list, slot1.zone_id)
	elseif slot1.type == 2 then
		slot0.model:setMatchData64(slot1.list, slot1.zone_id)
	else
		return
	end

	GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_TOP_64_EVENT, slot1)
end

function ArenapeakchampionController.sender27710(slot0, slot1)
	slot0:SendProtocal(27710, {
		zone_id = slot1
	})
end

function ArenapeakchampionController.handle27710(slot0, slot1)
	slot0.model:setMatchData8(slot1.pos_list, slot1.zone_id)
	GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_TOP_8_EVENT, slot1)
end

function ArenapeakchampionController.sender27712(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(27712, {
		zone_id = slot1,
		type = slot2,
		group = slot3,
		pos = slot4
	})
end

function ArenapeakchampionController.handle27712(slot0, slot1)
	slot0:openLookFightVedioPanel(slot1)
end

function ArenapeakchampionController.sender27713(slot0, slot1, slot2)
	slot0:SendProtocal(27713, {
		zone_id = slot1,
		period = slot2
	})
end

function ArenapeakchampionController.handle27713(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_RANK_EVENT, slot1)
end

function ArenapeakchampionController.sender27714(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(27714, {
		zone_id = slot1,
		start_num = slot2,
		end_num = slot3
	})
end

function ArenapeakchampionController.handle27714(slot0, slot1)
	if slot1.end_num == 1 and #slot1.rank_list > 0 then
		slot0.model:setWorshipRedPoint(slot1.day_worship, slot1)
	end

	GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_CURRENT_RANK_EVENT, slot1)
end

function ArenapeakchampionController.sender27725(slot0, slot1)
	slot0.record_formations = slot1

	slot0:SendProtocal(27725, {
		formations = slot1
	})
end

function ArenapeakchampionController.handle27725(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_SAVE_FROM_EVENT, slot1)

		if slot0.record_formations then
			for slot6, slot7 in ipairs(slot0.record_formations) do
				slot7.type = PartnerConst.Fun_Form.ArenapeakchampionDef

				HeroController:getInstance():getModel():setFormList(slot7, slot7.order)
			end
		end
	end
end

function ArenapeakchampionController.sender27726(slot0)
	slot0:SendProtocal(27726, {})
end

function ArenapeakchampionController.handle27726(slot0, slot1)
	for slot6, slot7 in ipairs(slot1.formations) do
		slot7.type = PartnerConst.Fun_Form.ArenapeakchampionDef

		HeroController:getInstance():getModel():setFormList(slot7, slot7.order)
	end

	GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_FROM_EVENT, slot1)
end

function ArenapeakchampionController.sender27730(slot0)
	slot0:SendProtocal(27730, {})
end

function ArenapeakchampionController.handle27730(slot0, slot1)
	slot0.model:setLoginRedPoint(slot1)
end

function ArenapeakchampionController.sender27731(slot0, slot1)
	slot0:SendProtocal(27731, {
		type = slot1
	})
end

function ArenapeakchampionController.handle27731(slot0, slot1)
end

function ArenapeakchampionController.openArenapeakchampionMainWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.model:getMainData() then
			return
		end

		if slot3.flag == 4 then
			message(TI18N("服务器繁忙，入口将稍后开启，请留意邮件通知"))

			if slot0.is_send_27700 == nil then
				slot0.is_send_27700 = true

				slot0:sender27700()
			end

			return
		end

		if slot0.arenapeakchampion_main_window == nil then
			slot0.arenapeakchampion_main_window = ArenapeakchampionMainWindow.New()
		end

		if slot0.arenapeakchampion_main_window:isOpen() == false then
			slot0.arenapeakchampion_main_window:open(slot2)
		end
	elseif slot0.arenapeakchampion_main_window then
		slot0.arenapeakchampion_main_window:close()

		slot0.arenapeakchampion_main_window = nil
	end
end

function ArenapeakchampionController.getArenapeakchampionGuessingWindow(slot0)
	if slot0.arenapeakchampion_guessing_window then
		return slot0.arenapeakchampion_guessing_window
	end
end

function ArenapeakchampionController.openArenapeakchampionGuessingWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.model:getMainData() then
			return
		end

		if slot3.flag == 4 then
			message(TI18N("服务器繁忙，入口将稍后开启，请留意邮件通知"))

			return
		end

		if slot0.arenapeakchampion_guessing_window == nil then
			slot0.arenapeakchampion_guessing_window = ArenapeakchampionGuessingWindow.New()
		end

		if slot0.arenapeakchampion_guessing_window:isOpen() == false then
			slot0.arenapeakchampion_guessing_window:open(slot2)
		end
	elseif slot0.arenapeakchampion_guessing_window then
		slot0.arenapeakchampion_guessing_window:close()

		slot0.arenapeakchampion_guessing_window = nil
	end
end

function ArenapeakchampionController.openArenapeakchampionMymatchPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenapeakchampion_mymatch_panel == nil then
			slot0.arenapeakchampion_mymatch_panel = ArenapeakchampionMymatchPanel.New()
		end

		if slot0.arenapeakchampion_mymatch_panel:isOpen() == false then
			slot0.arenapeakchampion_mymatch_panel:open(slot2)
		end
	elseif slot0.arenapeakchampion_mymatch_panel then
		slot0.arenapeakchampion_mymatch_panel:close()

		slot0.arenapeakchampion_mymatch_panel = nil
	end
end

function ArenapeakchampionController.openArenapeakchampionFightInfoPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenapeakchampion_fight_info_panel == nil then
			slot0.arenapeakchampion_fight_info_panel = ArenapeakchampionFightInfoPanel.New()
		end

		if slot0.arenapeakchampion_fight_info_panel:isOpen() == false then
			slot0.arenapeakchampion_fight_info_panel:open(slot2)
		end
	elseif slot0.arenapeakchampion_fight_info_panel then
		slot0.arenapeakchampion_fight_info_panel:close()

		slot0.arenapeakchampion_fight_info_panel = nil
	end
end

function ArenapeakchampionController.openArenapeakchampionGuessInfoPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenapeakchampion_guess_info_panel == nil then
			slot0.arenapeakchampion_guess_info_panel = ArenapeakchampionGuessInfoPanel.New()
		end

		if slot0.arenapeakchampion_guess_info_panel:isOpen() == false then
			slot0.arenapeakchampion_guess_info_panel:open(slot2)
		end
	elseif slot0.arenapeakchampion_guess_info_panel then
		slot0.arenapeakchampion_guess_info_panel:close()

		slot0.arenapeakchampion_guess_info_panel = nil
	end
end

function ArenapeakchampionController.openArenapeakchampionGuessCountPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenapeakchampion_guess_count_panel == nil then
			slot0.arenapeakchampion_guess_count_panel = ArenapeakchampionGuessCountPanel.New()
		end

		if slot0.arenapeakchampion_guess_count_panel:isOpen() == false then
			slot0.arenapeakchampion_guess_count_panel:open(slot2)
		end
	elseif slot0.arenapeakchampion_guess_count_panel then
		slot0.arenapeakchampion_guess_count_panel:close()

		slot0.arenapeakchampion_guess_count_panel = nil
	end
end

function ArenapeakchampionController.openArenapeakchampionResultPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenapeakchampion_result_panel == nil then
			slot0.arenapeakchampion_result_panel = ArenapeakchampionResultPanel.New()
		end

		if slot0.arenapeakchampion_result_panel:isOpen() == false then
			slot0.arenapeakchampion_result_panel:open(slot2)
		end
	elseif slot0.arenapeakchampion_result_panel then
		slot0.arenapeakchampion_result_panel:close()

		slot0.arenapeakchampion_result_panel = nil
	end
end

function ArenapeakchampionController.openArenapeakchampionShopWindow(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenapeakchampion_shop_window == nil then
			slot0.arenapeakchampion_shop_window = ArenapeakchampionShopWindow.New()
		end

		if slot0.arenapeakchampion_shop_window:isOpen() == false then
			slot0.arenapeakchampion_shop_window:open(slot2)
		end
	elseif slot0.arenapeakchampion_shop_window then
		slot0.arenapeakchampion_shop_window:close()

		slot0.arenapeakchampion_shop_window = nil
	end
end

function ArenapeakchampionController.openLookFightVedioPanel(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = {
		combat_type = BattleConst.Fight_Type.Arenapeakchampion,
		srv_id = slot1.a_srv_id,
		atk_name = slot1.a_name,
		def_srv_id = slot1.b_srv_id,
		def_name = slot1.b_name,
		win_count = 0,
		lose_count = 0
	}
	slot4 = {}

	for slot8, slot9 in ipairs(slot0.model:getSecondData(slot1, true).arena_replay_infos) do
		slot10 = false

		if slot9.ret == nil then
			if #slot9.a_plist == 0 and #slot9.b_plist == 0 then
				slot10 = true
			elseif #slot9.a_plist ~= 0 and #slot9.b_plist == 0 then
				slot9.ret = 1
				slot2.win_count = slot2.win_count + 1
			elseif #slot9.a_plist == 0 and #slot9.b_plist ~= 0 then
				slot9.ret = 2
				slot2.lose_count = slot2.lose_count + 1
			end
		elseif slot9.ret == 1 then
			slot2.win_count = slot2.win_count + 1
		else
			slot2.lose_count = slot2.lose_count + 1
		end

		if not slot10 then
			table.insert(slot4, slot9)
		end

		if slot8 == 2 and (slot2.win_count == 2 or slot2.lose_count == 2) then
			break
		end
	end

	slot3.arena_replay_infos = slot4

	ElitematchController:getInstance():openElitematchFightVedioPanel(true, slot2, 1, 3, slot3)
end

function ArenapeakchampionController.openArenapeakchampionShop(slot0)
	MallController:getInstance():openMallSingleShopPanel(true, {
		mall_type = MallConst.MallType.PeakchampionShop,
		item_id = Config.ItemData.data_assets_label2id.peak_guess_cent,
		config = Config.ExchangeData.data_shop_exchage_peakchampion,
		shop_name = TI18N("巅峰商城")
	})
end

function ArenapeakchampionController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
