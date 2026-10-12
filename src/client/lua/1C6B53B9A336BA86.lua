CrosschampionController = CrosschampionController or BaseClass(BaseController)

function CrosschampionController.config(slot0)
	slot0.model = CrosschampionModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function CrosschampionController.getModel(slot0)
	return slot0.model
end

function CrosschampionController.registerEvents(slot0)
	slot0.role_worship_event = GlobalEvent:getInstance():Bind(RoleEvent.WorshipOtherRole, function (slot0, slot1, slot2, slot3)
		if slot3 == WorshipType.crosschampion then
			uv0.model:updateTopThreeRoleWorshipStatus(slot0, slot1)
		end
	end)
end

function CrosschampionController.registerProtocals(slot0)
	slot0:RegisterProtocal(26200, "handle26200")
	slot0:RegisterProtocal(26201, "handle26201")
	slot0:RegisterProtocal(26202, "handle26202")
	slot0:RegisterProtocal(26203, "handle26203")
	slot0:RegisterProtocal(26204, "handle26204")
	slot0:RegisterProtocal(26205, "handle26205")
	slot0:RegisterProtocal(26206, "handle26206")
	slot0:RegisterProtocal(26207, "handle26207")
	slot0:RegisterProtocal(26208, "handle26208")
	slot0:RegisterProtocal(26209, "handle26209")
	slot0:RegisterProtocal(26210, "handle26210")
	slot0:RegisterProtocal(26211, "handle26211")
	slot0:RegisterProtocal(26212, "handle26212")
	slot0:RegisterProtocal(26213, "handle26213")
	slot0:RegisterProtocal(26214, "handle26214")
	slot0:RegisterProtocal(26215, "handle26215")
end

function CrosschampionController.sender26200(slot0)
	slot0:SendProtocal(26200, {})
end

function CrosschampionController.handle26200(slot0, slot1)
	slot0.model:updateChampionBaseInfo(slot1)
	slot0:sender26201()

	if not slot0.model:checkCrossChampionIsOpen(true) then
		return
	end

	if slot1.step_status == ArenaConst.champion_step_status.opened then
		if GuideController:getInstance():isInGuide() then
			return
		end

		if StoryController:getInstance():getModel():isStoryState() then
			return
		end

		if slot0.crosschampion_wnd == nil and not ArenaController:getInstance():checkChampionWndIsOpen() then
			if slot1.round_status == ArenaConst.champion_round_status.guess then
				ActivityController:openSignView(true, ActivitySignType.cross_champion_guess, {
					timer = true
				})
			elseif not slot0.had_show_notice then
				ActivityController:openSignView(true, ActivitySignType.cross_champion, {
					timer = true
				})

				slot0.had_show_notice = true
			end
		end
	end
end

function CrosschampionController.sender26201(slot0)
	slot0:SendProtocal(26201, {})
end

function CrosschampionController.handle26201(slot0, slot1)
	slot0.model:setRoleInfo(slot1)
end

function CrosschampionController.sender26202(slot0)
	slot0:SendProtocal(26202, {})
end

function CrosschampionController.handle26202(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateMyMatchInfoEvent, slot1)
end

function CrosschampionController.sender26203(slot0)
	slot0:SendProtocal(26203, {})
end

function CrosschampionController.handle26203(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateGuessMatchInfoEvent, slot1)
end

function CrosschampionController.sender26204(slot0, slot1, slot2)
	slot0:SendProtocal(26204, {
		bet_type = slot1,
		bet_val = slot2
	})
end

function CrosschampionController.handle26204(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.code == TRUE then
		slot0.model:getRoleInfo().can_bet = slot1.can_bet

		GlobalEvent:getInstance():Fire(ArenaEvent.UpdateRoleInfoBetEvent, slot1.can_bet, slot1.bet_type)
		ArenaController:getInstance():openArenaChampionGuessWindow(false)
	end
end

function CrosschampionController.sender26205(slot0)
	slot0:SendProtocal(26205, {})
end

function CrosschampionController.handle26205(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateMyGuessListEvent, slot1.list)
end

function CrosschampionController.sender26206(slot0)
	slot0:SendProtocal(26206, {})
end

function CrosschampionController.handle26206(slot0, slot1)
	ArenaController:getInstance():openArenaChampionBestInfoWindow(true, slot1, ArenaConst.champion_type.cross)
end

function CrosschampionController.handle26207(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateBetMatchValueEvent, slot1)
end

function CrosschampionController.sender26208(slot0)
	slot0:SendProtocal(26208, {})
end

function CrosschampionController.handle26208(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateMylogListEvent, slot1.list)
end

function CrosschampionController.sender26209(slot0)
	slot0:SendProtocal(26209, {})
end

function CrosschampionController.handle26209(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateTop32InfoEvent, slot1.list)
end

function CrosschampionController.sender26210(slot0)
	slot0:SendProtocal(26210, {})
end

function CrosschampionController.handle26210(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateTop4InfoEvent, slot1.pos_list)
end

function CrosschampionController.sender26211(slot0)
	slot0:SendProtocal(26211, {})
end

function CrosschampionController.handle26211(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateTop324GuessGroupEvent, slot1.group, slot1.pos)
end

function CrosschampionController.sender26212(slot0, slot1, slot2)
	slot0:SendProtocal(26212, {
		group = slot1,
		pos = slot2
	})
end

function CrosschampionController.handle26212(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateTop324GroupPosEvent, slot1)
end

function CrosschampionController.sender26213(slot0)
	slot0:SendProtocal(26213, {})
end

function CrosschampionController.handle26213(slot0, slot1)
	if slot1 then
		slot0.model:setTopThreeRoleData(slot1.rank_list)
		GlobalEvent:getInstance():Fire(CrosschampionEvent.UpdateChampionTop3Event, slot1.rank_list)
	end
end

function CrosschampionController.sender26214(slot0)
	slot0:SendProtocal(26214, {})
end

function CrosschampionController.handle26214(slot0, slot1)
	GlobalEvent:getInstance():Fire(ArenaEvent.UpdateChampionRankEvent, slot1)
end

function CrosschampionController.sender26215(slot0)
	slot0:SendProtocal(26215, {})
end

function CrosschampionController.handle26215(slot0, slot1)
	if GuideController:getInstance():isInGuide() then
		return
	end

	if StoryController:getInstance():getModel():isStoryState() then
		return
	end

	RenderMgr:getInstance():doNextFrame(function ()
		ArenaController:getInstance():openArenaChampionTop3Window(true, uv0, ArenaConst.champion_type.cross)
	end)
end

function CrosschampionController.sender26216(slot0)
	slot0:SendProtocal(26216, {})
end

function CrosschampionController.openCrosschampionMainWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.model:checkCrossChampionIsOpen(true) then
			return
		end

		if not slot2 and slot0.model:getMyMatchStatus() ~= ArenaConst.champion_my_status.unopened and slot0.model:getOpenCrosschampionViewStatus() then
			slot0:setCrosschampionOpenFlag(true)
			slot0:sender26206()
			slot0:sender26201()
			ArenaController:getInstance():openArenaChampionMatchWindow(true, 1, ArenaConst.champion_type.cross)

			return
		end

		slot0:setCrosschampionOpenFlag(false)

		if not slot0.crosschampion_wnd then
			slot0.crosschampion_wnd = CrosschampionMainWindow.New()
		end

		if slot0.crosschampion_wnd:isOpen() == false then
			slot0.crosschampion_wnd:open()
		end
	elseif slot0.crosschampion_wnd then
		slot0.crosschampion_wnd:close()

		slot0.crosschampion_wnd = nil
	end
end

function CrosschampionController.getCrosschampionOpenFlag(slot0)
	return slot0.open_flag
end

function CrosschampionController.setCrosschampionOpenFlag(slot0, slot1)
	slot0.open_flag = slot1
end

function CrosschampionController.openCrosschampionShopWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.crosschampion_shop then
			slot0.crosschampion_shop = CrosschampionShopWindow.New()
		end

		if slot0.crosschampion_shop:isOpen() == false then
			slot0.crosschampion_shop:open()
		end
	elseif slot0.crosschampion_shop then
		slot0.crosschampion_shop:close()

		slot0.crosschampion_shop = nil
	end
end

function CrosschampionController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
