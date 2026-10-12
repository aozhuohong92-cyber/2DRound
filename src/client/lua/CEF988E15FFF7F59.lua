GuildsecretareaController = GuildsecretareaController or BaseClass(BaseController)

function GuildsecretareaController.config(slot0)
	slot0.model = GuildsecretareaModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function GuildsecretareaController.getModel(slot0)
	return slot0.model
end

function GuildsecretareaController.registerEvents(slot0)
end

function GuildsecretareaController.registerProtocals(slot0)
	slot0:RegisterProtocal(26800, "handle26800")
	slot0:RegisterProtocal(26801, "handle26801")
	slot0:RegisterProtocal(26802, "handle26802")
	slot0:RegisterProtocal(26803, "handle26803")
	slot0:RegisterProtocal(26804, "handle26804")
	slot0:RegisterProtocal(26805, "handle26805")
	slot0:RegisterProtocal(26806, "handle26806")
	slot0:RegisterProtocal(26807, "handle26807")
	slot0:RegisterProtocal(26808, "handle26808")
	slot0:RegisterProtocal(26809, "handle26809")
	slot0:RegisterProtocal(26810, "handle26810")
end

function GuildsecretareaController.request26800(slot0)
end

function GuildsecretareaController.sender26800(slot0)
	slot0:SendProtocal(26800, {})
end

function GuildsecretareaController.handle26800(slot0, slot1)
	slot0.model:updateSecretareaData(slot1)
	GlobalEvent:getInstance():Fire(GuildsecretareaEvent.GUILD_SECRET_AREA_MAIN_EVENT, slot1)
end

function GuildsecretareaController.sender26801(slot0, slot1)
	slot0:SendProtocal(26801, {
		boss_id = slot1
	})
end

function GuildsecretareaController.handle26801(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		-- Nothing
	end
end

function GuildsecretareaController.sender26802(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(26802, {
		boss_id = slot1,
		formation_type = slot2,
		pos_info = slot3,
		hallows_id = slot4
	})
end

function GuildsecretareaController.handle26802(slot0, slot1)
	message(slot1.msg)
end

function GuildsecretareaController.sender26803(slot0, slot1)
	slot0:SendProtocal(26803, {
		boss_id = slot1
	})
end

function GuildsecretareaController.handle26803(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		slot0.model:updateSecretareaBuyCount(slot1)
		GlobalEvent:getInstance():Fire(GuildsecretareaEvent.GUILD_SECRET_AREA_BUY_COUNT_EVENT, slot1)
	end
end

function GuildsecretareaController.sender26804(slot0, slot1, slot2)
	slot0:SendProtocal(26804, {
		boss_id = slot1,
		number = slot2
	})
end

function GuildsecretareaController.handle26804(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		GlobalEvent:getInstance():Fire(GuildsecretareaEvent.TERM_BEGINS_RECEIVE_REWARD_EVENT, slot1)
	end
end

function GuildsecretareaController.sender26805(slot0, slot1)
	slot0:SendProtocal(26805, {
		boss_id = slot1
	})
end

function GuildsecretareaController.handle26805(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		slot0:sender26800()
		GlobalEvent:getInstance():Fire(GuildsecretareaEvent.GUILD_SECRET_AREA_REFRESH_RANK_EVENT)
	end
end

function GuildsecretareaController.sender26806(slot0, slot1, slot2)
	slot0:SendProtocal(26806, {
		boss_id = slot1,
		num = slot2
	})
end

function GuildsecretareaController.handle26806(slot0, slot1)
	slot0.model:updateBossRankInfo(slot1)
	GlobalEvent:getInstance():Fire(GuildsecretareaEvent.GUILD_SECRET_AREA_RANK_COUNT_EVENT, slot1)
end

function GuildsecretareaController.sender26807(slot0)
	slot0:SendProtocal(26807, {})
end

function GuildsecretareaController.handle26807(slot0, slot1)
	slot0.model:updateStartCrusadeInfo(slot1)

	if slot1.flag == 0 and slot1.end_time ~= 0 then
		slot0:openGuildsecretareaStartCrusadePanel(true)
	end
end

function GuildsecretareaController.sender26808(slot0)
	slot0:SendProtocal(26808, {})
end

function GuildsecretareaController.handle26808(slot0, slot1)
	slot0:openGuildsecretareaEndCrusadePanel(true, slot1.flag, slot1)
end

function GuildsecretareaController.sender26809(slot0)
	slot0:SendProtocal(26809, {})
end

function GuildsecretareaController.handle26809(slot0, slot1)
	slot0:sender26800()
	GlobalEvent:getInstance():Fire(GuildsecretareaEvent.GUILD_SECRET_AREA_REFRESH_RANK_EVENT)

	slot1.item_rewards = slot1.reward

	BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.GuildSecretArea, slot1)
end

function GuildsecretareaController.sender26810(slot0)
	slot0:SendProtocal(26810, {})
end

function GuildsecretareaController.handle26810(slot0, slot1)
	if GuildController:getInstance():getModel():getMyGuildInfo() then
		slot2:setGuildAttribute("vitality", slot1.vitality)
	end
end

function GuildsecretareaController.openGuildsecretareaMainWindow(slot0, slot1, slot2)
	if RoleController:getInstance():getRoleVo():isHasGuild() == false then
		message(TI18N("您当前未加入任何公会，加入公会后才能参与该玩法！"))

		return
	end

	if slot1 == false then
		if slot0.guildsecretarea_main_window ~= nil then
			slot0.guildsecretarea_main_window:close()

			slot0.guildsecretarea_main_window = nil
		end
	else
		if slot0.guildsecretarea_main_window == nil then
			slot0.guildsecretarea_main_window = GuildsecretareaMainWindow.New()
		end

		slot0.guildsecretarea_main_window:open(slot2)
	end
end

function GuildsecretareaController.openGuildsecretareaStartCrusadePanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.guildsecretarea_start_crusade_panel ~= nil then
			slot0.guildsecretarea_start_crusade_panel:close()

			slot0.guildsecretarea_start_crusade_panel = nil
		end
	else
		if slot0.guildsecretarea_start_crusade_panel == nil then
			slot0.guildsecretarea_start_crusade_panel = GuildsecretareaStartCrusadePanel.New()
		end

		slot0.guildsecretarea_start_crusade_panel:open(slot2)
	end
end

function GuildsecretareaController.openGuildsecretareaEndCrusadePanel(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.guildsecretarea_end_crusade_panel ~= nil then
			slot0.guildsecretarea_end_crusade_panel:close()

			slot0.guildsecretarea_end_crusade_panel = nil
		end
	else
		if slot0.guildsecretarea_end_crusade_panel == nil then
			slot0.guildsecretarea_end_crusade_panel = GuildsecretareaEndCrusadePanel.New(slot2)
		end

		slot0.guildsecretarea_end_crusade_panel:open(slot3)
	end
end

function GuildsecretareaController.openGuildsecretareaRewardWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.guildsecretarea_raward_window ~= nil then
			slot0.guildsecretarea_raward_window:close()

			slot0.guildsecretarea_raward_window = nil
		end
	else
		if slot0.guildsecretarea_raward_window == nil then
			slot0.guildsecretarea_raward_window = GuildsecretareaRewardWindow.New()
		end

		slot0.guildsecretarea_raward_window:open(slot2)
	end
end

function GuildsecretareaController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
