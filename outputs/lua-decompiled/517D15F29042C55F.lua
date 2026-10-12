GuildskillController = GuildskillController or BaseClass(BaseController)

function GuildskillController.config(slot0)
	slot0.model = GuildskillModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function GuildskillController.getModel(slot0)
	return slot0.model
end

function GuildskillController.registerEvents(slot0)
	if slot0.backpack_init_event == nil then
		slot0.backpack_init_event = GlobalEvent:getInstance():Bind(BackpackEvent.GET_ALL_DATA, function (slot0)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if uv0.role_vo == nil then
				if uv0.init_role_event == nil then
					uv0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
						GlobalEvent:getInstance():UnBind(uv0.init_role_event)

						uv0.role_vo = RoleController:getInstance():getRoleVo()

						if uv0.role_vo then
							uv0:registerRoleEvent()
						end
					end)
				end
			else
				uv0:registerRoleEvent()
			end
		end)
	end

	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
			uv0:openGuildSkillMainWindow(false)
			uv0.model:clearGuildCareerSkill()
			uv0:requestInitProtocal()
		end)
	end
end

function GuildskillController.registerRoleEvent(slot0)
	slot0:requestInitProtocal(true)

	if slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "gid" then
				uv0:requestInitProtocal()
			elseif slot0 == "guild" then
				uv0.model:checkGuildSkillRedStatus()
			end
		end)
	end
end

function GuildskillController.requestInitProtocal(slot0)
	if slot0.role_vo ~= nil then
		if slot0.role_vo.gid ~= 0 then
			slot0:SendProtocal(23703, {})
			slot0:send23711()
		else
			slot0:openGuildSkillMainWindow(false)
			slot0.model:clearGuildCareerSkill()
		end
	end
end

function GuildskillController.registerProtocals(slot0)
	slot0:RegisterProtocal(23700, "handle23700")
	slot0:RegisterProtocal(23701, "handle23701")
	slot0:RegisterProtocal(23702, "handle23702")
	slot0:RegisterProtocal(23703, "handle23703")
	slot0:RegisterProtocal(23704, "handle23704")
	slot0:RegisterProtocal(23705, "handle23705")
	slot0:RegisterProtocal(23706, "handle23706")
	slot0:RegisterProtocal(23707, "handle23707")
	slot0:RegisterProtocal(23708, "handle23708")
	slot0:RegisterProtocal(23709, "handle23709")
	slot0:RegisterProtocal(23710, "handle23710")
	slot0:RegisterProtocal(23711, "handle23711")
end

function GuildskillController.openGuildSkillMainWindow(slot0, slot1)
	if slot1 == false then
		if slot0.main_window ~= nil then
			slot0.main_window:close()

			slot0.main_window = nil
		end
	else
		if slot0.main_window == nil then
			slot0.main_window = GuildskillMainWindow.New()
		end

		slot0.main_window:open()
	end
end

function GuildskillController.openGuildskillResetPanel(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.guild_skill_reset_panel ~= nil then
			slot0.guild_skill_reset_panel:close()

			slot0.guild_skill_reset_panel = nil
		end
	else
		if slot0.guild_skill_reset_panel == nil then
			slot0.guild_skill_reset_panel = GuildskillResetPanel.New()
		end

		slot0.guild_skill_reset_panel:open(slot2, slot3)
	end
end

function GuildskillController.openGuildskillLevelUpPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.guildskill_level_up_panel ~= nil then
			slot0.guildskill_level_up_panel:close()

			slot0.guildskill_level_up_panel = nil
		end
	else
		if slot0.guildskill_level_up_panel == nil then
			slot0.guildskill_level_up_panel = GuildskillLevelUpPanel.New()
		end

		slot0.guildskill_level_up_panel:open(slot2)
	end
end

function GuildskillController.openGuildskillLevelSuccessPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.guildskill_level_success_panel ~= nil then
			slot0.guildskill_level_success_panel:close()

			slot0.guildskill_level_success_panel = nil
		end
	else
		if slot0.guildskill_level_success_panel == nil then
			slot0.guildskill_level_success_panel = GuildskillLevelSuccessPanel.New()
		end

		slot0.guildskill_level_success_panel:open(slot2)
	end
end

function GuildskillController.requestCareerSkillInfo(slot0, slot1)
	slot0:SendProtocal(23700, {
		career = slot1 or GuildskillConst.index.physics
	})
end

function GuildskillController.handle23700(slot0, slot1)
	slot0.model:initGuildCareerSkill(slot1)
end

function GuildskillController.requestActivitySkill(slot0, slot1)
	slot0:SendProtocal(23701, {
		skill_id = slot1
	})
end

function GuildskillController.handle23701(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:updateGuildCareerSkill(slot1.career, slot1.skill_id)
		HeroController:getInstance():getModel():clearHeroVoDetailedInfo()
	end
end

function GuildskillController.handle23702(slot0, slot1)
	slot0.model:upgradeGuildCareerSkill(slot1.career, slot1.group_id)
end

function GuildskillController.handle23703(slot0, slot1)
	slot0.model:initGuildSkillStatus(slot1)
end

function GuildskillController.send23704(slot0, slot1)
	slot0:SendProtocal(23704, {
		career = slot1
	})
end

function GuildskillController.handle23704(slot0, slot1)
	GlobalEvent:getInstance():Fire(GuildskillEvent.UpdateSkillResetEvent, slot1)
end

function GuildskillController.send23705(slot0, slot1)
	slot0:SendProtocal(23705, {
		career = slot1
	})
end

function GuildskillController.handle23705(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:resetCareerSkillInfo(slot1.career)
	end
end

function GuildskillController.send23706(slot0, slot1)
	slot0:SendProtocal(23706, {
		career = slot1 or GuildskillConst.index.physics
	})
end

function GuildskillController.handle23706(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		GlobalEvent:getInstance():Fire(GuildskillEvent.Guild_Pvp_Career_Break_Event, slot1.career)
	end
end

function GuildskillController.send23707(slot0, slot1, slot2)
	slot0.record_id = slot2

	slot0:SendProtocal(23707, {
		career = slot1 or GuildskillConst.index.physics,
		id = slot2
	})
end

function GuildskillController.handle23707(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		GlobalEvent:getInstance():Fire(GuildskillEvent.Guild_Pvp_Career_Update_Event, slot1.career, 2, slot0.record_id)
	end
end

function GuildskillController.send23708(slot0, slot1)
	slot0:SendProtocal(23708, {
		career = slot1 or GuildskillConst.index.physics
	})
end

function GuildskillController.handle23708(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		if slot0.guildskill_level_up_panel then
			slot0:openGuildskillLevelUpPanel(false)
		end

		slot0:openGuildskillLevelSuccessPanel(true, slot1.career)
		GlobalEvent:getInstance():Fire(GuildskillEvent.Guild_Pvp_Career_Update_Event, slot1.career, 1)
	end
end

function GuildskillController.send23709(slot0, slot1)
	slot0:SendProtocal(23709, {
		career = slot1
	})
end

function GuildskillController.handle23709(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		slot0.model:setPvpFisrtReset(false)
	end
end

function GuildskillController.send23710(slot0, slot1)
	slot0:SendProtocal(23710, {
		career = slot1 or GuildskillConst.index.physics
	})
end

function GuildskillController.handle23710(slot0, slot1)
	slot0.model:initPvpCareerSkillInfo({
		slot1
	})
	slot0.model:setPvpFisrtReset(slot1.is_first == 1)
	GlobalEvent:getInstance():Fire(GuildskillEvent.Guild_Pvp_Career_Info_Event, slot1.career)
end

function GuildskillController.send23711(slot0)
	slot0:SendProtocal(23711, {})
end

function GuildskillController.handle23711(slot0, slot1)
	slot0.model:initPvpCareerSkillInfo(slot1.guild_skill_break_group)
	slot0.model:setPvpFisrtReset(slot1.is_first == 1)
	GlobalEvent:getInstance():Fire(GuildskillEvent.Guild_Pvp_Skill_Info_Event, slot1)
end

function GuildskillController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
