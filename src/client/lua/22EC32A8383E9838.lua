GuildbossController = GuildbossController or BaseClass(BaseController)

function GuildbossController.config(slot0)
	slot0.model = GuildbossModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function GuildbossController.getModel(slot0)
	return slot0.model
end

function GuildbossController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil
			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if uv0.role_vo ~= nil then
				uv0:requestInitProtocal(true)

				if uv0.role_assets_event == nil then
					uv0.role_assets_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
						if slot0 == "guild_lev" then
							uv0:requestInitProtocal()
						elseif slot0 == "gid" and slot1 == 0 then
							uv0:openMainWindow(false)
						end
					end)
				end
			end
		end)
	end

	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
			uv0:openGuildBossPassRewardWindow(false)
			uv0:requestInitProtocal(true)
		end)
	end
end

function GuildbossController.requestInitProtocal(slot0, slot1)
	if slot0.role_vo == nil then
		return
	end

	if slot0.role_vo.gid == 0 then
		slot0.model:clearGuildBossInfo({})
	elseif slot1 == true then
		slot0:requestGuildDunBaseInfo()
	elseif slot0.model:getBaseInfo() == nil or next(slot2) == nil then
		slot0:requestGuildDunBaseInfo()
	end
end

function GuildbossController.registerProtocals(slot0)
	slot0:RegisterProtocal(21300, "handle21300")
	slot0:RegisterProtocal(21307, "handle21307")
	slot0:RegisterProtocal(21308, "handle21308")
	slot0:RegisterProtocal(21312, "handle21312")
	slot0:RegisterProtocal(21318, "handle21318")
	slot0:RegisterProtocal(21319, "handle21319")
	slot0:RegisterProtocal(21303, "handle21303")
	slot0:RegisterProtocal(21304, "handle21304")
	slot0:RegisterProtocal(21309, "handle21309")
	slot0:RegisterProtocal(21317, "handle21317")
	slot0:RegisterProtocal(21305, "handle21305")
	slot0:RegisterProtocal(21323, "handle21323")
end

function GuildbossController.openMainWindow(slot0, slot1)
	if not slot1 then
		if slot0.main_window then
			slot0.main_window:close()

			slot0.main_window = nil
		end
	else
		if slot0.role_vo == nil or slot0.role_vo.gid == 0 then
			message(TI18N("你当前还没有加入任何公会!"))

			return
		end

		if Config.GuildDunData.data_const.guild_lev == nil then
			message(TI18N("公会副本数据异常!"))

			return
		end

		if slot0.role_vo.guild_lev < slot2.val then
			message(slot2.desc)

			return
		end

		if MainuiController:getInstance():checkIsOpenByActivate(Config.FunctionData.data_base[6].activate) == false then
			message(slot3.desc)

			return
		end

		if slot0.main_window == nil then
			slot0.main_window = GuildBossMainWindow.New()
		end

		slot0.main_window:open()
	end
end

function GuildbossController.openGuildBossPreviewWindow(slot0, slot1)
	if not slot1 then
		if slot0.boss_preview_window then
			slot0.boss_preview_window:close()

			slot0.boss_preview_window = nil
		end
	else
		if slot0.boss_preview_window == nil then
			slot0.boss_preview_window = GuildBossPreviewWindow.New()
		end

		slot0.boss_preview_window:open()
	end
end

function GuildbossController.openGuildBossResetWindow(slot0, slot1)
	if not slot1 then
		if slot0.reset_window then
			slot0.reset_window:close()

			slot0.reset_window = nil
		end
	else
		if slot0.reset_window == nil then
			slot0.reset_window = GuildBossResetWindow.New()
		end

		slot0.reset_window:open()
	end
end

function GuildbossController.openGuildBossPassRewardWindow(slot0, slot1)
	if not slot1 then
		if slot0.pass_reward_window then
			slot0.pass_reward_window:close()

			slot0.pass_reward_window = nil
		end
	else
		if slot0.pass_reward_window == nil then
			slot0.pass_reward_window = GuildBossPassRewardWindow.New()
		end

		slot0.pass_reward_window:open()
	end
end

function GuildbossController.openGuildBossBoxRewardWindow(slot0, slot1)
	if not slot1 then
		if slot0.box_reward_window then
			slot0.box_reward_window:close()

			slot0.box_reward_window = nil
		end
	else
		if slot0.box_reward_window == nil then
			slot0.box_reward_window = GuildBossBoxRewardWindow.New()
		end

		slot0.box_reward_window:open()
	end
end

function GuildbossController.openGuildbossResultWindow(slot0, slot1, slot2, slot3)
	if not slot1 then
		if slot0.result_window then
			slot0.result_window:close()

			slot0.result_window = nil
		end
	else
		if slot0.result_window == nil then
			slot0.result_window = GuildbossResultWindow.New()
		end

		if slot0.result_window:isOpen() == false then
			slot0.result_window:open(slot2, slot3)
		end
	end
end

function GuildbossController.hideGuildbossResultWindow(slot0, slot1)
	if slot0.result_window then
		slot0.result_window:setVisible(slot1)
	end
end

function GuildbossController.openGuildbossRankRoleWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.guildboos_rank_role_window then
			slot0.guildboos_rank_role_window:close()

			slot0.guildboos_rank_role_window = nil
		end
	else
		if slot0.guildboos_rank_role_window == nil then
			slot0.guildboos_rank_role_window = GuildBossRankRoleWindow.New()
		end

		if slot0.guildboos_rank_role_window:isOpen() == false then
			slot0.guildboos_rank_role_window:open(slot2)
		end
	end
end

function GuildbossController.openGuildbossResultDpsRankWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.dpsrank_window then
			slot0.dpsrank_window:close()

			slot0.dpsrank_window = nil
		end
	else
		if slot2 == nil then
			return
		end

		if slot0.dpsrank_window == nil then
			slot0.dpsrank_window = GuildbossResultDpsRankWindow.New()
		end

		if slot0.dpsrank_window:isOpen() == false then
			slot0.dpsrank_window:open(slot2)
		end
	end
end

function GuildbossController.openGuildBossRankWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.rank_window then
			slot0.rank_window:close()

			slot0.rank_window = nil
		end
	else
		type = type or GuildBossConst.rank.guild

		if slot0.rank_window == nil then
			slot0.rank_window = GuildBossRankWindow.New()
		end

		slot0.rank_window:open(slot2)
	end
end

function GuildbossController.oepnGuildRewardShowView(slot0, slot1)
	if slot1 == true then
		if slot0.reward_view == nil then
			slot0.reward_view = GuildBossRewardShowView.New()
		end

		slot0.reward_view:open()
	elseif slot0.reward_view then
		slot0.reward_view:close()

		slot0.reward_view = nil
	end
end

function GuildbossController.requestGuildDunBaseInfo(slot0)
	slot0:SendProtocal(21300, {})
end

function GuildbossController.handle21300(slot0, slot1)
	slot0.model:updateGuildDunBaseInfo(slot1)
	GlobalEvent:getInstance():Fire(GuildbossEvent.MusterCoolTime, slot1.coldtime or 0)
end

function GuildbossController.requestBuyChallengeTimes(slot0, slot1)
	if slot0.model:getBaseInfo() == nil or slot2.buy_count == nil then
		return
	end

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if slot2.count ~= 0 then
		message(TI18N("挑战次数为0时可购买，请努力挑战Boss！"))

		return
	end

	function slot4(slot0)
		uv0:SendProtocal(21312, {
			type = slot0
		})
	end

	if Config.GuildDunData.data_buy_count[slot2.buy_count + 1] == nil then
		message(TI18N("当前购买次数已到达本日上限"))
	elseif slot3.vip_lev < slot6.vip_lev then
		slot7 = ""

		CommonAlert.show(string.format(TI18N("提升至<div fontcolor='#289b14'>vip%s</div>可提高<div fontcolor='#289b14'>1</div>点次数购买上限，是否前往充值提升vip等级"), slot6.vip_lev), TI18N("我要提升"), function ()
			VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	else
		if slot6.expend == nil or #slot7 < 2 then
			return
		end

		if Config.ItemData.data_get_data(slot7[1]) then
			slot9 = ""

			CommonAlert.show(string.format(TI18N("是否花费 <img src=%s visible=true scale=0.35 />%s 购买<div fontcolor='#289b14'>1</div>点挑战次数？"), PathTool.getItemRes(slot8.icon), slot7[2]), TI18N("确定"), function ()
				uv0(uv1)
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		end
	end
end

function GuildbossController.handle21312(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:updateBaseWithTimes(slot1.count, slot1.buy_count, slot1.type)
	end
end

function GuildbossController.requestResetGuildDun(slot0, slot1)
	slot0:SendProtocal(21307, {
		type = slot1
	})
end

function GuildbossController.handle21307(slot0, slot1)
	if slot1.code == TRUE then
		slot0:openGuildBossResetWindow(false)
	end

	message(slot1.msg)
end

function GuildbossController.send21308(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(21308, {
		boss_id = slot1,
		formation_type = slot2,
		pos_info = slot3,
		hallows_id = slot4
	})
end

function GuildbossController.handle21308(slot0, slot1)
	message(slot1.msg)
end

function GuildbossController.requestDayBoxRewards(slot0)
end

function GuildbossController.handle21303(slot0, slot1)
	slot0.model:initDayBoxRewardsStatus(slot1.box_list)
end

function GuildbossController.requestGetChapterBox(slot0, slot1)
end

function GuildbossController.handle21304(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:updateBoxRewards(slot1.fid, slot1.num)
	end
end

function GuildbossController.requestFirstPassRewards(slot0)
end

function GuildbossController.handle21320(slot0, slot1)
end

function GuildbossController.send21321(slot0, slot1)
end

function GuildbossController.handle21321(slot0, slot1)
	message(slot1.msg)
end

function GuildbossController.send21323(slot0)
	slot0:SendProtocal(21323, {})
end

function GuildbossController.handle21323(slot0, slot1)
	if slot1.code == 0 then
		message(slot1.msg)
	elseif slot1.code == 1 then
		GlobalEvent:getInstance():Fire(GuildbossEvent.MusterCoolTime, slot1.coldtime - GameNet:getInstance():getTime() or 0)
	end
end

function GuildbossController.send21305(slot0)
	slot0:SendProtocal(21305, {})
end

function GuildbossController.handle21305(slot0, slot1)
	message(slot1.msg)
end

function GuildbossController.requestGuildDunRank(slot0, slot1, slot2)
	if slot1 == GuildBossConst.rank.guild then
		slot0:SendProtocal(21318, {})
	elseif slot1 == GuildBossConst.rank.role and slot2 then
		slot0:SendProtocal(21319, slot2)
	end
end

function GuildbossController.handle21318(slot0, slot1)
	GlobalEvent:getInstance():Fire(GuildbossEvent.UpdateGuildDunRank, slot1, GuildBossConst.rank.guild)
end

function GuildbossController.handle21319(slot0, slot1)
	slot0.model:setRaknRoleList(slot1)
	GlobalEvent:getInstance():Fire(GuildbossEvent.UpdateGuildDunRank, slot1, GuildBossConst.rank.role)
end

function GuildbossController.handle21309(slot0, slot1)
	BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.GuildDun, slot1)
end

function GuildbossController.handle21317(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.GuildDun, slot1)
	end
end

function GuildbossController.requestMopupMonster(slot0, slot1)
	slot0:SendProtocal(21317, {
		boss_id = slot1
	})
end

function GuildbossController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
