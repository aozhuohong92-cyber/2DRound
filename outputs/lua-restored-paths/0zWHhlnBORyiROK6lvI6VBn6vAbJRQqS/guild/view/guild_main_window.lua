GuildMainWindow = GuildMainWindow or BaseClass(BaseView)
slot0 = GuildController:getInstance()
slot1 = GuildController:getInstance():getModel()
slot2 = string.format
slot3 = GuildbossController:getInstance():getModel()
slot4 = GuildskillController:getInstance():getModel()
slot5 = RedbagController:getInstance():getModel()
slot6 = GuildwarController:getInstance():getModel()

function GuildMainWindow.__init(slot0)
	slot0.ctrl = GuildController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.layout_name = "guild/guild_main_window"
	slot0.win_type = WinType.Full
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guild", "guild"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_2", true),
			type = ResourcesType.single
		}
	}
end

function GuildMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_2", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("main_panel")

	slot2:getChildByName("win_title"):setString(TI18N("公会"))

	slot0.main_view = slot2:getChildByName("container")
	slot0.sign_btn = slot0.main_view:getChildByName("sign_btn")
	slot0.guild_sign_value = slot0.main_view:getChildByName("guild_sign_value")

	slot0.guild_sign_value:setTextAreaSize(cc.size(250, 120))

	slot0.change_name_btn = slot0.main_view:getChildByName("change_name_btn")
	slot0.action_goal_btn = slot0.main_view:getChildByName("action_goal_btn")
	slot0.redpacket_btn = slot0.main_view:getChildByName("redpacket_btn")
	slot0.redpacket_btn.tips = slot0.redpacket_btn:getChildByName("tips")
	slot0.donate_btn = slot0.main_view:getChildByName("donate_btn")
	slot0.donate_btn.tips = slot0.donate_btn:getChildByName("tips")
	slot0.rank_btn = slot0.main_view:getChildByName("skill_btn")
	slot0.shop_container = slot0.main_view:getChildByName("shop_container")
	slot0.shop_container.notice = slot0.main_view:getChildByName("guild_shop_notice")
	slot0.shop_container.tips = slot0.shop_container:getChildByName("tips")

	slot0.shop_container.tips:setVisible(false)

	slot0.shop_container.is_unlock = true
	slot0.war_container = slot0.main_view:getChildByName("war_container")
	slot0.war_container.notice = slot0.main_view:getChildByName("guild_war_notice")
	slot0.war_container.tips = slot0.war_container:getChildByName("tips")
	slot0.war_container.is_unlock = false

	slot0.war_container.notice:setVisible(false)
	slot0.war_container.notice:setString(TI18N("敬请期待"))

	slot0.dungeon_container = slot0.main_view:getChildByName("dungeon_container")
	slot0.dungeon_container.notice = slot0.main_view:getChildByName("guild_dun_notice")
	slot0.dungeon_container.tips = slot0.dungeon_container:getChildByName("tips")
	slot0.dungeon_container.is_unlock = false
	slot0.skill_container = slot0.main_view:getChildByName("voyage_container")
	slot0.skill_container.notice = slot0.main_view:getChildByName("guild_voyage_notice")
	slot0.skill_container.tips = slot0.skill_container:getChildByName("tips")
	slot0.skill_container.is_unlock = false
	slot0.check_member_btn = slot0.main_view:getChildByName("rank_btn")
	slot0.notice_btn = slot0.main_view:getChildByName("notice_btn")
	slot0.mail_btn = slot0.main_view:getChildByName("mail_btn")
	slot0.joinset_btn = slot0.main_view:getChildByName("joinset_btn")
	slot0.joinset_btn.tips = slot0.joinset_btn:getChildByName("tips")
	slot0.notice_btn.tips = slot0.notice_btn:getChildByName("tips")
	slot0.check_member_btn.tips = slot0.check_member_btn:getChildByName("tips")

	slot0.main_view:getChildByName("guild_name_title"):setString(TI18N("名称："))
	slot0.main_view:getChildByName("guild_leader_title"):setString(TI18N("会长："))
	slot0.main_view:getChildByName("guild_lev_title"):setString(TI18N("等级："))
	slot0.main_view:getChildByName("guild_exp_title"):setString(TI18N("经验："))
	slot0.main_view:getChildByName("guild_member_title"):setString(TI18N("成员："))

	slot0.guild_name_value = slot0.main_view:getChildByName("guild_name_value")
	slot0.guild_leader_value = slot0.main_view:getChildByName("guild_leader_value")
	slot0.guild_lev_value = slot0.main_view:getChildByName("guild_lev_value")
	slot0.guild_exp_value = slot0.main_view:getChildByName("guild_exp_value")
	slot0.guild_member_value = slot0.main_view:getChildByName("guild_member_value")

	slot0.action_goal_btn:getChildByName("label"):setString(TI18N("公会商城"))

	slot0.action_goal_btn.tips = slot0.action_goal_btn:getChildByName("tips")

	slot0.action_goal_btn.tips:setVisible(false)
	slot0.redpacket_btn:getChildByName("label"):setString(TI18N("公会红包"))
	slot0.donate_btn:getChildByName("label"):setString(TI18N("公会捐献"))
	slot0.rank_btn:getChildByName("label"):setString(TI18N("公会排名"))
	slot0.main_view:getChildByName("guild_sign_title"):setString(TI18N("公会宣言"))
	slot0.notice_btn:getChildByName("label"):setString(TI18N("公会日志"))
	slot0.mail_btn:getChildByName("label"):setString(TI18N("公会宝库"))
	slot0.check_member_btn:getChildByName("label"):setString(TI18N("公会管理"))
	slot0.joinset_btn:getChildByName("label"):setString(TI18N("公会活跃"))
end

function GuildMainWindow.register_event(slot0)
	slot0.sign_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openGuildChangeSignWindow(true)
		end
	end)
	slot0.change_name_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openGuildChangeNameWindow(true)
		end
	end)
	slot0.action_goal_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			MallController:getInstance():openMallPanel(true, MallConst.MallType.UnionShop)
		end
	end)
	slot0.redpacket_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			RedbagController:getInstance():openMainView(true)
		end
	end)
	slot0.donate_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openGuildDonateWindow(true)
		end
	end)
	slot0.rank_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			RankController:getInstance():openRankView(true, RankConstant.RankType.union)
		end
	end)
	slot0.shop_container:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildSecretArea)
		end
	end)
	slot0.war_container:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildWar)
			uv0:updateGuildWarRedStatus(GuildConst.red_index.guildwar_start, false)
		end
	end)
	slot0.dungeon_container:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildDun)
		end
	end)
	slot0.skill_container:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			GuildskillController:getInstance():openGuildSkillMainWindow(true)
		end
	end)
	slot0.check_member_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openGuildMemberWindow(true)
		end
	end)
	slot0.notice_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openGuildNoticeWindow(true)
		end
	end)
	slot0.mail_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			GuildmarketplaceController:getInstance():openGuildmarketplaceMainWindow(true)
		end
	end)
	slot0.joinset_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.role_vo ~= nil then
				if Config.GuildQuestData.data_guild_action_data.open_glev.val <= uv0.role_vo.guild_lev then
					uv1:openGuildActionGoalWindow(true)
				else
					message(uv2(TI18N("联盟达到%d级后开启"), slot2))
				end
			end
		end
	end)

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "position" then
				uv0:updateJurisdiction()
			end
		end)
	end

	if slot0.update_red_status_event == nil then
		slot0.update_red_status_event = GlobalEvent:getInstance():Bind(GuildEvent.UpdateGuildRedStatus, function (slot0, slot1)
			uv0:updateSomeRedStatus(slot0, slot1)
		end)
	end
end

function GuildMainWindow.openRootWnd(slot0)
	if slot0.my_guild_info == nil then
		slot0.my_guild_info = uv0:getMyGuildInfo()

		if slot0.my_guild_info ~= nil and slot0.update_my_guild_info_event == nil then
			slot0.update_my_guild_info_event = slot0.my_guild_info:Bind(GuildEvent.UpdateMyInfoEvent, function (slot0, slot1)
				if slot0 == "sign" then
					uv0:updateGuildSignInfo()
				elseif slot0 == "members_num" then
					uv0:updateGuildMemberInfo()
				elseif slot0 == "lev" or slot0 == "exp" then
					uv0:updateGuildBaseInfo()
				elseif slot0 == "name" then
					uv0:updateGuildNameInfo()
				elseif slot0 == "leader_name" then
					uv0:updateGuildLeaderInfo()
				end
			end)
		end

		if slot0.update_open_srv_day_event == nil then
			slot0.update_open_srv_day_event = GlobalEvent:getInstance():Bind(RoleEvent.OPEN_SRV_DAY, function ()
				uv0:checkGuildWarStatus()
			end)
		end

		slot0:updateGuildNameInfo()
		slot0:updateGuildSignInfo()
		slot0:updateGuildBaseInfo()
		slot0:updateGuildLeaderInfo()
		slot0:updateGuildMemberInfo()
		slot0:updateSomeRedStatus()
	end

	slot0:updateJurisdiction()
end

function GuildMainWindow.updateJurisdiction(slot0)
	if slot0.role_vo == nil then
		return
	end

	if slot0.role_vo.position == GuildConst.post_type.member then
		slot0.sign_btn:setVisible(false)
		slot0.change_name_btn:setVisible(false)
	else
		slot0.sign_btn:setVisible(true)
		slot0.change_name_btn:setVisible(true)
		slot0.joinset_btn:setTouchEnabled(true)
		setChildUnEnabled(false, slot0.joinset_btn)
		slot0.notice_btn:setTouchEnabled(true)
		setChildUnEnabled(false, slot0.notice_btn)
		slot0.mail_btn:setTouchEnabled(true)
		setChildUnEnabled(false, slot0.mail_btn)
	end
end

function GuildMainWindow.updateGuildSignInfo(slot0)
	if slot0.my_guild_info == nil then
		return
	end

	slot0.guild_sign_value:setString(slot0.my_guild_info.sign)
end

function GuildMainWindow.updateGuildBaseInfo(slot0)
	if slot0.my_guild_info == nil then
		return
	end

	slot0.guild_lev_value:setString(uv0(TI18N("%s级"), slot0.my_guild_info.lev))

	if Config.GuildData.data_guild_lev[slot0.my_guild_info.lev] ~= nil then
		if slot1.exp == 0 then
			slot0.guild_exp_value:setString(TI18N("已满级"))
		else
			slot0.guild_exp_value:setString(uv0("%s/%s", slot0.my_guild_info.exp, slot1.exp))
		end
	end

	slot0.guild_member_value:setString(uv0("%s/%s", slot0.my_guild_info.members_num, slot0.my_guild_info.members_max))
	slot0:checkGuildDunLockStatus()
	slot0:checkGuildWarStatus()
end

function GuildMainWindow.updateGuildNameInfo(slot0)
	if slot0.my_guild_info == nil then
		return
	end

	slot0.guild_name_value:setString(slot0.my_guild_info.name)
end

function GuildMainWindow.checkGuildDunLockStatus(slot0)
	slot1 = false

	if slot0.dungeon_container.is_unlock == false and Config.GuildDunData.data_const.guild_lev then
		slot1 = slot0.my_guild_info and slot2.val <= slot0.my_guild_info.lev
		slot0.dungeon_container.is_unlock = slot1

		slot0.dungeon_container.notice:setVisible(not slot1)
		slot0.dungeon_container:setTouchEnabled(slot1)

		if slot1 == false then
			setChildUnEnabled(true, slot0.dungeon_container)
			slot0.dungeon_container.notice:setString(slot2.desc)
		else
			setChildUnEnabled(false, slot0.dungeon_container)
		end
	end
end

function GuildMainWindow.checkGuildWarStatus(slot0)
	slot1 = false

	if slot0.war_container.is_unlock == false then
		slot3 = Config.GuildWarData.data_const.limit_open_time

		if Config.GuildWarData.data_const.limit_lev and slot3 then
			slot1 = slot0.my_guild_info and slot2.val <= slot0.my_guild_info.lev
			slot4 = ""
			slot0.war_container.is_unlock = slot1

			slot0.war_container.notice:setVisible(not slot1)
			slot0.war_container:setTouchEnabled(slot1)

			if slot1 == false then
				setChildUnEnabled(true, slot0.war_container)
				slot0.war_container.notice:setString((slot1 ~= true or slot3.desc) and slot2.desc)
			else
				setChildUnEnabled(false, slot0.war_container)
			end
		end
	end
end

function GuildMainWindow.updateGuildLeaderInfo(slot0)
	if slot0.my_guild_info == nil then
		return
	end

	slot0.guild_leader_value:setString(slot0.my_guild_info.leader_name)
end

function GuildMainWindow.updateGuildMemberInfo(slot0)
	if slot0.my_guild_info == nil then
		return
	end

	slot0.guild_member_value:setString(uv0("%s/%s", slot0.my_guild_info.members_num, slot0.my_guild_info.members_max))
end

function GuildMainWindow.updateSomeRedStatus(slot0, slot1, slot2)
	slot3 = false

	if slot1 == GuildConst.red_index.notice then
		slot0.notice_btn.tips:setVisible(slot2)
	elseif slot1 == GuildConst.red_index.apply then
		slot0.check_member_btn.tips:setVisible(slot2)
	elseif slot1 == GuildConst.red_index.boss_times then
		slot0.dungeon_container.tips:setVisible(uv0:checkGuildDunRedStatus())
	elseif slot1 == GuildConst.red_index.donate or slot1 == GuildConst.red_index.donate_activity then
		slot0.donate_btn.tips:setVisible(uv1:getDonateRedStatus())
	elseif slot1 == GuildConst.red_index.skill_2 or slot1 == GuildConst.red_index.skill_3 or slot1 == GuildConst.red_index.skill_4 or slot1 == GuildConst.red_index.skill_5 or slot1 == GuildConst.red_index.pvp_skill_2 or slot1 == GuildConst.red_index.pvp_skill_3 or slot1 == GuildConst.red_index.pvp_skill_4 or slot1 == GuildConst.red_index.pvp_skill_5 then
		slot0.skill_container.tips:setVisible(uv2:getRedTotalStatus())
	elseif slot1 == GuildConst.red_index.red_bag then
		slot0.redpacket_btn.tips:setVisible(slot2)
	elseif slot1 == GuildConst.red_index.guild_secret_area then
		slot0.shop_container.tips:setVisible(slot2)
	elseif slot1 == GuildConst.red_index.goal_action then
		if slot0.joinset_btn.tips then
			slot0.joinset_btn.tips:setVisible(slot2)
		end
	elseif slot1 == GuildConst.red_index.guildwar_start or slot1 == GuildConst.red_index.guildwar_match or slot1 == GuildConst.red_index.guildwar_count then
		slot3 = uv3:checkGuildGuildWarRedStatus()

		if slot0.war_container.is_unlock == false then
			slot3 = false
		end

		slot0.war_container.tips:setVisible(slot3)
	else
		slot0.check_member_btn.tips:setVisible(uv1:getRedStatus(GuildConst.red_index.apply))
		slot0.donate_btn.tips:setVisible(uv1:getDonateRedStatus())
		slot0.dungeon_container.tips:setVisible(uv0:checkGuildDunRedStatus())

		slot3 = uv3:checkGuildGuildWarRedStatus()

		if slot0.war_container.is_unlock == false then
			slot3 = false
		end

		slot0.war_container.tips:setVisible(slot3)
		slot0.skill_container.tips:setVisible(uv2:getRedTotalStatus())
		slot0.redpacket_btn.tips:setVisible(uv4:getAllRedBagStatus())

		if slot0.joinset_btn.tips then
			slot0.joinset_btn.tips:setVisible(uv1:getGoalRedStatus())
		end

		if slot0.shop_container.tips then
			slot0.shop_container.tips:setVisible(GuildsecretareaController:getInstance():getModel():checkRedPoint())
		end
	end
end

function GuildMainWindow.close_callback(slot0)
	slot0.ctrl:openGuildMainWindow(false)

	if slot0.my_guild_info ~= nil then
		if slot0.update_my_guild_info_event ~= nil then
			slot0.my_guild_info:UnBind(slot0.update_my_guild_info_event)

			slot0.update_my_guild_info_event = nil
		end

		slot0.my_guild_info = nil
	end

	if slot0.update_open_srv_day_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_open_srv_day_event)

		slot0.update_open_srv_day_event = nil
	end

	if slot0.role_vo ~= nil then
		if slot0.role_assets_event ~= nil then
			slot0.role_vo:UnBind(slot0.role_assets_event)

			slot0.role_assets_event = nil
		end

		slot0.role_vo = nil
	end

	if slot0.update_red_status_event then
		GlobalEvent:getInstance():UnBind(slot0.update_red_status_event)

		slot0.update_red_status_event = nil
	end
end
