GuildwarController = GuildwarController or BaseClass(BaseController)

function GuildwarController.config(slot0)
	slot0.model = GuildwarModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function GuildwarController.getModel(slot0)
	return slot0.model
end

function GuildwarController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil
			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if uv0.role_vo ~= nil and uv0.role_assets_event == nil then
				uv0.role_assets_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
					if slot0 == "guild_lev" then
						if slot1 == 0 then
							uv0.model:config()
						end

						uv0:requestInitProtocal()
					end
				end)
			end
		end)
	end

	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
			uv0.model:clearEnemyCacheData()
		end)
	end
end

function GuildwarController.requestInitProtocal(slot0)
	slot0:reqestGuildWarStatus()
	slot0:requestAwardBoxData()
end

function GuildwarController.requestGuildWarData(slot0)
	slot0:SendProtocal(24200, {})
end

function GuildwarController.requestEnemyPositionData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0:SendProtocal(24201, {
		pos = slot1
	})
end

function GuildwarController.requestGuildWarFighting(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	slot0:SendProtocal(24202, {
		pos = slot1,
		hp = slot2,
		flag = slot3
	})
end

function GuildwarController.reqestGuildWarStatus(slot0)
	slot0:SendProtocal(24204, {})
end

function GuildwarController.requestGuildWarBattleList(slot0)
	slot0:SendProtocal(24205, {})
end

function GuildwarController.requestMyGuildPositionData(slot0)
	slot0:SendProtocal(24208, {})
end

function GuildwarController.requestPositionDefendData(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(24209, {
		g_id1 = slot1,
		g_sid1 = slot2,
		pos = slot3
	})
end

function GuildwarController.requestBattleLogData(slot0)
	slot0:SendProtocal(24212, {})
end

function GuildwarController.requestGuildWarRankData(slot0)
	slot0:SendProtocal(24213, {})
end

function GuildwarController.requestAwardBoxData(slot0)
	slot0:SendProtocal(24220, {})
end

function GuildwarController.requestGetBoxAward(slot0, slot1)
	slot0:SendProtocal(24221, {
		order = slot1
	})
end

function GuildwarController.registerProtocals(slot0)
	slot0:RegisterProtocal(24200, "handle24200")
	slot0:RegisterProtocal(24201, "handle24201")
	slot0:RegisterProtocal(24202, "handle24202")
	slot0:RegisterProtocal(24203, "handle24203")
	slot0:RegisterProtocal(24204, "handle24204")
	slot0:RegisterProtocal(24205, "handle24205")
	slot0:RegisterProtocal(24206, "handle24206")
	slot0:RegisterProtocal(24207, "handle24207")
	slot0:RegisterProtocal(24208, "handle24208")
	slot0:RegisterProtocal(24209, "handle24209")
	slot0:RegisterProtocal(24210, "handle24210")
	slot0:RegisterProtocal(24212, "handle24212")
	slot0:RegisterProtocal(24213, "handle24213")
	slot0:RegisterProtocal(24214, "handle24214")
	slot0:RegisterProtocal(24220, "handle24220")
	slot0:RegisterProtocal(24221, "handle24221")
	slot0:RegisterProtocal(24223, "handle24223")
end

function GuildwarController.handle24200(slot0, slot1)
	if (slot1 or {}).count then
		slot0.model:setGuildWarChallengeCount(slot1.count)
	end

	if slot1.result then
		slot0.model:setGuildWarResult(slot1.result)
	end

	if slot1.ranks then
		slot0.model:setGuildWarTopThreeRank(slot1.ranks)
	end

	slot0.model:setMyGuildWarBaseInfo({
		gname = slot1.gname1,
		hp = slot1.hp1,
		buff_lev = slot1.buff_lev1
	})
	slot0.model:setEnemyGuildWarData(slot1)
	GlobalEvent:getInstance():Fire(GuildwarEvent.GuildWarEnemyPositionDataInitEvent)
end

function GuildwarController.handle24201(slot0, slot1)
	if slot1 and slot0.attk_position_window then
		slot0.attk_position_window:setData(slot1)
	end
end

function GuildwarController.handle24202(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:setGuildWarChallengeCount(slot1.count)
		GlobalEvent:getInstance():Fire(GuildwarEvent.UpdateGuildwarChallengeCountEvent)
		slot0:openAttkPositionWindow(false)
		slot0:openAttkLookWindow(false)
	end
end

function GuildwarController.handle24203(slot0, slot1)
	BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.GuildWar, slot1)
end

function GuildwarController.handle24204(slot0, slot1)
	if slot1 then
		slot0.model:setGuildWarStatus(slot1)
		GlobalEvent:getInstance():Fire(GuildwarEvent.UpdateGuildWarStatusEvent, slot1.status, slot1.flag)
	end
end

function GuildwarController.handle24205(slot0, slot1)
	if slot1 and slot0.battle_list_window then
		slot0.battle_list_window:setData(slot1)
	end
end

function GuildwarController.handle24206(slot0, slot1)
	if slot1 then
		if slot1.flag and slot1.flag == TRUE then
			slot0.model:updateMyGuildWarPositionData(slot1.defense)
		else
			slot0.model:updateEnemyGuildWarPositionData(slot1.defense)
		end
	end
end

function GuildwarController.handle24207(slot0, slot1)
	if slot1 then
		if slot1.result then
			slot0.model:setGuildWarResult(slot1.result)
		end

		if slot1.hp and slot1.buff_lev then
			slot0.model:updateMyGuildWarBaseInfo({
				hp = slot1.hp,
				buff_lev = slot1.buff_lev
			})
		end

		if slot1.hp2 then
			slot0.model:updateEnemyGuildWarBaseInfo(slot1.hp2)
		end

		if slot1.ranks then
			slot0.model:setGuildWarTopThreeRank(slot1.ranks)
		end

		GlobalEvent:getInstance():Fire(GuildwarEvent.UpdateGuildWarBaseInfoEvent)
	end
end

function GuildwarController.handle24208(slot0, slot1)
	if slot1 then
		slot0.model:setMyGuildWarPositionData(slot1.defense)
		slot0.model:setAvgPower(slot1.avg_power)
		GlobalEvent:getInstance():Fire(GuildwarEvent.GetGuildWarMyPositionDataEvent)
	end
end

function GuildwarController.handle24209(slot0, slot1)
	if slot1 and slot0.defend_look_window then
		slot0.defend_look_window:setData(slot1)
	end
end

function GuildwarController.handle24210(slot0)
	slot0.model:updateGuildWarRedStatus(GuildConst.red_index.guildwar_log, true, true)
end

function GuildwarController.handle24212(slot0, slot1)
	if slot0.battle_log_window and slot1 then
		slot0.battle_log_window:setData(slot1.guild_war_log)
	end
end

function GuildwarController.handle24213(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(GuildwarEvent.UpdateGuildWarRankDataEvent, slot1.ranks)
	end
end

function GuildwarController.handle24214(slot0, slot1)
	if slot1 and slot1.result then
		slot0.model:setGuildWarResult(slot1.result)
		GlobalEvent:getInstance():Fire(GuildwarEvent.UpdateGuildWarBaseInfoEvent)
	end
end

function GuildwarController.handle24220(slot0, slot1)
	if slot1 then
		slot0.model:setGuildWarBoxData(slot1)
		GlobalEvent:getInstance():Fire(GuildwarEvent.UpdateGuildWarBoxDataEvent, slot1)
	end
end

function GuildwarController.handle24221(slot0, slot1)
	message(slot1.msg)
end

function GuildwarController.handle24223(slot0, slot1)
	if slot1 then
		slot0.model:updateGuildWarBoxData(slot1)

		if slot0.role_vo and slot1.rid == slot0.role_vo.rid and slot1.sid == slot0.role_vo.srv_id then
			GlobalEvent:getInstance():Fire(GuildwarEvent.UpdateMyAwardBoxEvent)
		end
	end
end

function GuildwarController.openMainWindow(slot0, slot1)
	if slot1 == false then
		if slot0.main_window then
			slot0.main_window:close()

			slot0.main_window = nil
		end
	else
		if FILTER_CHARGE == true then
			return
		end

		if slot0.role_vo == nil or slot0.role_vo.gid == 0 then
			message(TI18N("您当前未加入任何公会，加入公会后才能参与该玩法！"))

			return
		end

		if Config.GuildWarData.data_const.limit_lev == nil then
			message(TI18N("公会战数据异常!"))

			return
		end

		if slot0.role_vo.guild_lev < slot2.val then
			message(TI18N("您所在的公会未达参赛条件，不能参与哦，请努力提高公会等级！"))

			return
		end

		if slot0.main_window == nil then
			slot0.main_window = GuildwarMainWindow.New()
		end

		if slot0.main_window:isOpen() == false then
			slot0.main_window:open()
		end
	end
end

function GuildwarController.openAttkLookWindow(slot0, slot1)
	if slot1 == false then
		if slot0.attk_look_window then
			slot0.attk_look_window:close()

			slot0.attk_look_window = nil
		end
	else
		if slot0.attk_look_window == nil then
			slot0.attk_look_window = GuildwarAttkLookWindow.New()
		end

		if slot0.attk_look_window:isOpen() == false then
			slot0.attk_look_window:open()
		end
	end
end

function GuildwarController.openDefendLookWindow(slot0, slot1, slot2, slot3, slot4)
	if slot1 == false then
		if slot0.defend_look_window then
			slot0.defend_look_window:close()

			slot0.defend_look_window = nil
		end
	else
		if slot0.defend_look_window == nil then
			slot0.defend_look_window = GuildwarDefendLookWindow.New()
		end

		if slot0.defend_look_window:isOpen() == false then
			slot0.defend_look_window:open(slot2, slot3, slot4)
		end
	end
end

function GuildwarController.openBattleListWindow(slot0, slot1)
	if slot1 == false then
		if slot0.battle_list_window then
			slot0.battle_list_window:close()

			slot0.battle_list_window = nil
		end
	else
		if slot0.battle_list_window == nil then
			slot0.battle_list_window = GuildwarBattleListWindow.New()
		end

		if slot0.battle_list_window:isOpen() == false then
			slot0.battle_list_window:open()
		end
	end
end

function GuildwarController.openBattleLogWindow(slot0, slot1)
	if slot1 == false then
		if slot0.battle_log_window then
			slot0.battle_log_window:close()

			slot0.battle_log_window = nil
		end
	else
		if slot0.battle_log_window == nil then
			slot0.battle_log_window = GuildwarBattleLogWindow.New()
		end

		if slot0.battle_log_window:isOpen() == false then
			slot0.battle_log_window:open()
		end
	end
end

function GuildwarController.openGuildWarAwardWindow(slot0, slot1)
	if slot1 == false then
		if slot0.guildwar_award_window then
			slot0.guildwar_award_window:close()

			slot0.guildwar_award_window = nil
		end
	else
		if slot0.guildwar_award_window == nil then
			slot0.guildwar_award_window = GuildwarAwardWindow.New()
		end

		if slot0.guildwar_award_window:isOpen() == false then
			slot0.guildwar_award_window:open()
		end
	end
end

function GuildwarController.openAttkPositionWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.attk_position_window then
			slot0.attk_position_window:close()

			slot0.attk_position_window = nil
		end
	else
		if slot0.attk_position_window == nil then
			slot0.attk_position_window = GuildwarAttkPositionWindow.New()
		end

		if slot0.attk_position_window:isOpen() == false then
			slot0.attk_position_window:open(slot2)
		end
	end
end

function GuildwarController.openGuildWarRankView(slot0, slot1)
	if slot1 == false then
		if slot0.guildwar_rank_window then
			slot0.guildwar_rank_window:close()

			slot0.guildwar_rank_window = nil
		end
	else
		if slot0.guildwar_rank_window == nil then
			slot0.guildwar_rank_window = GuildWarRankWindow.New()
		end

		if slot0.guildwar_rank_window:isOpen() == false then
			slot0.guildwar_rank_window:open()
		end
	end
end

function GuildwarController.checkIsCanOpenGuildWarWindow(slot0, slot1)
	slot2 = true
	slot3 = Config.GuildWarData.data_const.limit_lev.val
	slot4 = Config.GuildWarData.data_const.limit_open_time
	slot6 = RoleController:getInstance():getModel():getOpenSrvDay()

	if not RoleController:getInstance():getRoleVo():isHasGuild() then
		if not slot1 then
			message(TI18N("您当前未加入任何公会，加入公会后才能参与该玩法！"))
		end

		slot2 = false
	elseif slot5.guild_lev < slot3 then
		if not slot1 then
			message(TI18N("您所在的公会未达参赛条件，不能参与哦，请努力提高公会等级！"))
		end

		slot2 = false
	elseif slot6 <= slot4.val then
		if not slot1 then
			message(slot4.desc)
		end

		slot2 = false
	end

	return slot2, slot3
end

function GuildwarController.openAwardBoxWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.award_box_win then
			slot0.award_box_win = GuildwarAwardBoxWindow.New()
		end

		if slot0.award_box_win:isOpen() == false then
			slot0.award_box_win:open()
		end
	elseif slot0.award_box_win then
		slot0.award_box_win:close()

		slot0.award_box_win = nil
	end
end

function GuildwarController.openAwardBoxPreview(slot0, slot1)
	if slot1 == true then
		if not slot0.award_box_preview then
			slot0.award_box_preview = GuildwarAwardBoxPreview.New()
		end

		if slot0.award_box_preview:isOpen() == false then
			slot0.award_box_preview:open()
		end
	elseif slot0.award_box_preview then
		slot0.award_box_preview:close()

		slot0.award_box_preview = nil
	end
end

function GuildwarController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
