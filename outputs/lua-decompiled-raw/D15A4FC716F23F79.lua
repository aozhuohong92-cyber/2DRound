ActivityController = ActivityController or BaseClass(BaseController)

function ActivityController.config(slot0)
	slot0.model = ActivityModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0._doubleTime = false
	slot0._firstComein = true
end

function ActivityController.getModel(slot0)
	return slot0.model
end

function ActivityController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil
			uv0._roleVo = RoleController:getInstance():getRoleVo()

			if uv0._roleVo ~= nil and uv0.role_assets_event == nil then
				uv0.role_assets_event = uv0._roleVo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
					if slot0 == "lev" then
						uv0:requestInitProtocal()
					end
				end)
			end
		end)
	end

	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
			uv0:requestInitProtocal()
		end)
	end
end

function ActivityController.requestInitProtocal(slot0)
	if Config.DailyplayData.data_limitactivity[2].is_open == 1 and slot0._roleVo and slot1[2].activate[1][2] <= slot0._roleVo.lev then
		slot0:SendProtocal(21322, {})
	end
end

function ActivityController.registerProtocals(slot0)
	slot0:RegisterProtocal(21322, "handle21322")
end

function ActivityController.handle21322(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.code == 0 then
		slot0._doubleTime = false
	elseif slot1.code == 1 then
		slot0._doubleTime = true
	end

	slot0._firstComein = slot0._doubleTime
	slot2 = false
	slot3 = GuildbossController:getInstance():getModel():getBaseInfo()

	if slot0._doubleTime == true and slot3 and slot3.count and slot3.count > 0 then
		slot2 = true
	end

	GlobalEvent:getInstance():Fire(GuildbossEvent.BossActivityDoubleTime, slot0._doubleTime)
end

function ActivityController.setFirstComeGuild(slot0, slot1)
	slot0._firstComein = slot1
end

function ActivityController.getFirstComeGuild(slot0)
	return slot0._firstComein
end

function ActivityController.getBossActivityDoubleTime(slot0)
	return slot0._doubleTime
end

function ActivityController.openActivityView(slot0, slot1)
	if slot1 == true then
		if not slot0.activityView then
			slot0.activityView = ActivityWindow.New()
		end

		slot0.activityView:open()
	elseif slot0.activityView then
		slot0.activityView:close()

		slot0.activityView = nil
	end
end

function ActivityController.getActivityRoot(slot0)
	if slot0.activityView then
		return slot0.activityView.root_wnd
	end
end

function ActivityController.switchLimitActivityView(slot0, slot1)
	if slot1 == ActivityConst.limit_index.escort then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Escort)
	elseif slot1 == ActivityConst.limit_index.union then
		if slot0:getBossActivityDoubleTime() == false then
			message(TI18N("当前不处于活动时段，请在活动开启后再来哦"))
		else
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildDun)
		end
	elseif slot1 == ActivityConst.limit_index.fightFirst then
		-- Nothing
	elseif slot1 == ActivityConst.limit_index.allGod then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Godbattle)
	elseif slot1 == ActivityConst.limit_index.guildwar then
		if GuildwarController:getInstance():checkIsCanOpenGuildWarWindow() == true then
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildWar)
		end
	elseif slot1 == ActivityConst.limit_index.champion then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.champion_call)
	elseif slot1 == ActivityConst.limit_index.ladder and LadderController:getInstance():getModel():getLadderOpenStatus() == true then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.LadderWar)
	end
end

function ActivityController.openSignView(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.activity_sign_view ~= nil then
			slot0.activity_sign_view:close()

			slot0.activity_sign_view = nil
		end
	else
		if slot0.activity_sign_view == nil then
			slot0.activity_sign_view = ActivitySignWindow.New()
		end

		if slot0.activity_sign_view and slot0.activity_sign_view:isOpen() == false then
			slot0.activity_sign_view:open(slot2, slot3)
		end
	end
end

function ActivityController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
