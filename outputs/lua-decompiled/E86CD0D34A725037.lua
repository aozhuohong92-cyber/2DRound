GuildController = GuildController or BaseClass(BaseController)

function GuildController.config(slot0)
	slot0.model = GuildModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function GuildController.getModel(slot0)
	return slot0.model
end

function GuildController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil
			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if uv0.role_vo ~= nil then
				uv0:requestInitProtocal()

				if uv0.role_assets_event == nil then
					uv0.role_assets_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
						if slot0 == "gid" then
							if slot1 == 0 then
								uv0:openGuildMainWindow(false)
								uv0:openGuildMemberWindow(false)
								uv0:openGuildDonateWindow(false)
								HeroController:getInstance():getModel():clearHeroVoDetailedInfo()
							else
								if uv0.init_window then
									uv0.request_open_main_window = true

									HeroController:getInstance():getModel():clearHeroVoDetailedInfo()
								end

								uv0:openGuildInitWindow(false)
							end

							uv0:requestInitProtocal()
						elseif slot0 == "position" then
							uv0.model:updateMemberByPosition(slot1)
						end
					end)
				end
			end
		end)
	end

	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
			uv0:requestInitProtocal()
		end)
	end

	if slot0.update_red_point_event == nil then
		slot0.update_red_point_event = GlobalEvent:getInstance():Bind(RoleEvent.UPDATE_RED_POINT, function ()
			uv0:updateSkillFirstRedPoint()
		end)
	end
end

function GuildController.requestInitProtocal(slot0)
	if slot0.role_vo ~= nil then
		if slot0.role_vo.gid == 0 then
			slot0.model:clearMyGuildInfo()
		else
			slot0:requestGuildDonateProtocal()
			slot0:SendProtocal(13518, {})
			slot0:SendProtocal(16900, {})

			if slot0.role_vo.position ~= GuildConst.post_type.member then
				slot0:SendProtocal(13573, {})
			end

			GuildsecretareaController:getInstance():sender26807()
			GuildsecretareaController:getInstance():sender26800()
		end
	end
end

function GuildController.requestGuildDonateProtocal(slot0)
	slot0:SendProtocal(13523, {})
end

function GuildController.registerProtocals(slot0)
	slot0:RegisterProtocal(13500, "handle13500")
	slot0:RegisterProtocal(13501, "handle13501")
	slot0:RegisterProtocal(13503, "handle13503")
	slot0:RegisterProtocal(13505, "handle13505")
	slot0:RegisterProtocal(13507, "handle13507")
	slot0:RegisterProtocal(13513, "handle13513")
	slot0:RegisterProtocal(13514, "handle13514")
	slot0:RegisterProtocal(13516, "handle13516")
	slot0:RegisterProtocal(13518, "handle13518")
	slot0:RegisterProtocal(13519, "handle13519")
	slot0:RegisterProtocal(13520, "handle13520")
	slot0:RegisterProtocal(13521, "handle13521")
	slot0:RegisterProtocal(13522, "handle13522")
	slot0:RegisterProtocal(13523, "handle13523")
	slot0:RegisterProtocal(13524, "handle13524")
	slot0:RegisterProtocal(13542, "hander13542")
	slot0:RegisterProtocal(13558, "handle13558")
	slot0:RegisterProtocal(13565, "handle13565")
	slot0:RegisterProtocal(13568, "handle13568")
	slot0:RegisterProtocal(13573, "handle13573")
	slot0:RegisterProtocal(13574, "handle13574")
	slot0:RegisterProtocal(13575, "handle13575")
	slot0:RegisterProtocal(13576, "handle13576")
	slot0:RegisterProtocal(16900, "handle16900")
	slot0:RegisterProtocal(16901, "handle16901")
	slot0:RegisterProtocal(16902, "handle16902")
	slot0:RegisterProtocal(16903, "handle16903")
	slot0:RegisterProtocal(16904, "handle16904")
	slot0:RegisterProtocal(13577, "handle13577")
	slot0:RegisterProtocal(13578, "handle13578")
	slot0:RegisterProtocal(13579, "handle13579")
	slot0:RegisterProtocal(13580, "handle13580")
end

function GuildController.checkOpenGuildWindow(slot0, slot1)
	if slot0.role_vo == nil or slot0.role_vo.gid == 0 then
		slot0:openGuildInitWindow(true, slot1)
	else
		slot0:openGuildMainWindow(true, slot1)
	end
end

function GuildController.openGuildInitWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.init_window ~= nil then
			slot0.init_window:close()

			slot0.init_window = nil
		end
	else
		if slot0.init_window == nil then
			slot0.init_window = GuildInitWindow.New()
		end

		slot0.init_window:open(slot2)
	end
end

function GuildController.getGuildInitRoot(slot0)
	if slot0.init_window then
		return slot0.init_window.root_wnd
	end
end

function GuildController.openGuildMainWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.main_window ~= nil then
			slot0.main_window:close()

			slot0.main_window = nil
		end
	else
		if slot0.main_window == nil then
			slot0.main_window = GuildNewMainWindow.New()
		end

		slot0.main_window:open(slot2)
	end
end

function GuildController.openGuildMemberWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.member_window ~= nil then
			slot0.member_window:close()

			slot0.member_window = nil
		end
	else
		if slot0.member_window == nil then
			slot0.member_window = GuildMemberWindow.New()
		end

		if slot0.member_window:isOpen() == false then
			slot0.member_window:open(slot2)
		end
	end
end

function GuildController.openGuildDonateWindow(slot0, slot1)
	if not slot1 then
		if slot0.donate_window ~= nil then
			slot0.donate_window:close()

			slot0.donate_window = nil
		end
	else
		if slot0.role_vo == nil or not slot0.role_vo:isHasGuild() then
			message(TI18N("您暂时还没有加入公会"))

			return
		end

		if MainuiController:getInstance():checkIsOpenByActivate(Config.FunctionData.data_base[6].activate) == false then
			message(slot2.desc)

			return
		end

		if slot0.donate_window == nil then
			slot0.donate_window = GuildDonateWindow.New()
		end

		slot0.donate_window:open()
	end
end

function GuildController.openGuildApplyWindow(slot0, slot1)
	if not slot1 then
		if slot0.apply_window ~= nil then
			slot0.apply_window:close()

			slot0.apply_window = nil
		end
	else
		if slot0.apply_window == nil then
			slot0.apply_window = GuildApplyWindow.New()
		end

		slot0.apply_window:open()
	end
end

function GuildController.openGuildActionGoalWindow(slot0, slot1)
	if not slot1 then
		if slot0.goal_window ~= nil then
			slot0.goal_window:close()

			slot0.goal_window = nil
		end
	else
		if slot0.goal_window == nil then
			slot0.goal_window = GuildActionGoalWindow.New()
		end

		slot0.goal_window:open()
	end
end

function GuildController.openGuildActiveIconWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.active_icon_wnd then
			slot0.active_icon_wnd = GuildActiveIconWindow.New()
		end

		if slot0.active_icon_wnd:isOpen() == false then
			slot0.active_icon_wnd:open()
		end
	elseif slot0.active_icon_wnd then
		slot0.active_icon_wnd:close()

		slot0.active_icon_wnd = nil
	end
end

function GuildController.openGuildRewardWindow(slot0, slot1)
	if not slot1 then
		if slot0.reward_window ~= nil then
			slot0.reward_window:close()

			slot0.reward_window = nil
		end
	else
		if slot0.reward_window == nil then
			slot0.reward_window = GuildRewardWindow.New()
		end

		slot0.reward_window:open()
	end
end

function GuildController.openGuildApplySetWindow(slot0, slot1)
	if not slot1 then
		if slot0.apply_set_window ~= nil then
			slot0.apply_set_window:close()

			slot0.apply_set_window = nil
		end
	else
		if slot0.apply_set_window == nil then
			slot0.apply_set_window = GuildApplySetWindow.New()
		end

		slot0.apply_set_window:open()
	end
end

function GuildController.openGuildOperationPostWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.operation_post_window ~= nil then
			slot0.operation_post_window:close()

			slot0.operation_post_window = nil
		end
	else
		if slot2 == nil then
			return
		end

		if slot0.operation_post_window == nil then
			slot0.operation_post_window = GuildOperationPostWindow.New()
		end

		if slot0.operation_post_window:isOpen() == false then
			slot0.operation_post_window:open(slot2)
		end
	end
end

function GuildController.openGuildImpeachPostWindow(slot0, slot1)
	if slot1 == true then
		if slot0.impeach_post_window == nil then
			slot0.impeach_post_window = GuildImpeachPostWindow.New()
		end

		slot0.impeach_post_window:open()
	elseif slot0.impeach_post_window ~= nil then
		slot0.impeach_post_window:close()

		slot0.impeach_post_window = nil
	end
end

function GuildController.openGuildChangeNameWindow(slot0, slot1)
	if not slot1 then
		if slot0.change_name_window ~= nil then
			slot0.change_name_window:close()

			slot0.change_name_window = nil
		end
	else
		if isQingmingShield and isQingmingShield() then
			return
		end

		if slot0.change_name_window == nil then
			slot0.change_name_window = GuildChangeNameWindow.New()
		end

		slot0.change_name_window:open()
	end
end

function GuildController.openGuildChangeSignWindow(slot0, slot1)
	if not slot1 then
		if slot0.change_sign_window ~= nil then
			slot0.change_sign_window:close()

			slot0.change_sign_window = nil
		end
	else
		if slot0.change_sign_window == nil then
			slot0.change_sign_window = GuildChangeSignWindow.New()
		end

		slot0.change_sign_window:open()
	end
end

function GuildController.openGuildSendMailWindow(slot0, slot1)
	if not slot1 then
		if slot0.send_mail_window ~= nil then
			slot0.send_mail_window:close()

			slot0.send_mail_window = nil
		end
	else
		if slot0.send_mail_window == nil then
			slot0.send_mail_window = GuildSendMailWindow.New()
		end

		slot0.send_mail_window:open()
	end
end

function GuildController.openGuildNoticeWindow(slot0, slot1)
	if not slot1 then
		if slot0.notice_window ~= nil then
			slot0.notice_window:close()

			slot0.notice_window = nil
		end
	else
		if slot0.notice_window == nil then
			slot0.notice_window = GuildNoticeWindow.New()
		end

		slot0.notice_window:open()
	end
end

function GuildController.requestCreateGuild(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:SendProtocal(13500, {
		name = slot1,
		sign = slot2,
		apply_type = slot3 or 0,
		apply_lev = slot4 or 1,
		apply_power = slot5
	})
end

function GuildController.handle13500(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		-- Nothing
	end
end

function GuildController.requestGuildList(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(13501, {
		page = slot1 or 0,
		flag = slot2 or 1,
		num = slot3 or 0,
		name = slot4 or ""
	})
end

function GuildController.handle13501(slot0, slot1)
	slot0.model:updateGuildList(slot1.name, slot1.guilds)
end

function GuildController.requestJoinGuild(slot0, slot1, slot2, slot3)
	if slot1 == nil or slot2 == nil then
		return
	end

	slot0:SendProtocal(13503, {
		gid = slot1,
		gsrv_id = slot2,
		type = slot3 or 1
	})
end

function GuildController.handle13503(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:updateGuildApplyStatus(slot1.gid, slot1.gsrv_id, slot1.is_apply)
	end
end

function GuildController.handle13518(slot0, slot1)
	slot0.model:updateMyGuildInfo(slot1)

	if slot0.request_open_main_window == true then
		slot0.request_open_main_window = false

		slot0:openGuildMainWindow(true)
	end
end

function GuildController.send13565(slot0)
	slot0:SendProtocal(13565, {})
end

function GuildController.handle13565(slot0, slot1)
	message(slot1.msg)
end

function GuildController.requestGuildMemberList(slot0)
	slot0:SendProtocal(13519, {})
end

function GuildController.handle13519(slot0, slot1)
	slot0.model:updateMyGuildMemberList(slot1.members, 1)
end

function GuildController.handle13523(slot0, slot1)
	slot0.model:updateDonateInfo(slot1.donate_list)
	slot0.model:updateDonateBoxInfo(slot1.boxes, slot1.donate_exp)
	RedbagController:getInstance():getModel():updateRedBagNum(slot1.day_send_num, slot1.day_recv_num)
end

function GuildController.requestGuildDonate(slot0, slot1)
	slot0:SendProtocal(13524, {
		type = slot1
	})
end

function GuildController.handle13524(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:setGuildDonateStatus()
	end
end

function GuildController.hander13542(slot0, slot1)
	slot0.model:updateMyGuildMemberList(slot1.members, slot1.type)
end

function GuildController.requestOperationApply(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(13505, {
		type = slot1,
		rid = slot2,
		srv_id = slot3
	})
end

function GuildController.handle13505(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:deleteApplyInfo(slot1.rid, slot1.srv_id)
	end
end

function GuildController.requestGuildApplyList(slot0, slot1, slot2)
	slot0:SendProtocal(13507, {
		page = slot1 or 0,
		num = slot2 or 0
	})
end

function GuildController.handle13507(slot0, slot1)
	slot0.model:updateGuildApplyList(slot1.guids)
end

function GuildController.requestExitGuild(slot0)
	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if slot1.position == GuildConst.post_type.leader then
		slot3 = ""

		CommonAlert.show(string.format(TI18N("是否确定解散公会【%s】？"), slot1.gname), TI18N("确定"), function ()
			uv0:SendProtocal(13516, {})
		end, TI18N("取消"), nil, nil, nil, {
			timer = 3,
			timer_for = true,
			extend_offy = -5,
			off_y = 43,
			title = TI18N("解散公会"),
			extend_str = (slot1.guild_quit_time == 0 or TI18N("(解散公会后，12小时内无法加入其他公会，24小时内无法创建公会)")) and TI18N("(首次解散公会后，可立即加入其他公会，24小时内无法创建公会。)"),
			extend_aligment = cc.TEXT_ALIGNMENT_CENTER
		}, nil, nil)
	else
		slot3 = ""

		CommonAlert.show(string.format(TI18N("是否确定退出公会【%s】？"), slot1.gname), TI18N("确定"), function ()
			uv0:SendProtocal(13514, {})
		end, TI18N("取消"), nil, nil, nil, {
			timer = 3,
			timer_for = true,
			extend_offy = -5,
			off_y = 43,
			title = TI18N("退出公会"),
			extend_str = (slot1.guild_quit_time == 0 or TI18N("(退出公会后12小时内无法创建公会、加入其他公会)")) and TI18N("(首次退出后可立即加入其他公会，12小时内无法创建公会)"),
			extend_aligment = cc.TEXT_ALIGNMENT_CENTER
		}, nil, nil)
	end
end

function GuildController.handle13514(slot0, slot1)
	message(slot1.msg)
end

function GuildController.handle13516(slot0, slot1)
	message(slot1.msg)
end

function GuildController.requestChangeApplySet(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(13522, {
		apply_type = slot1,
		apply_lev = slot2,
		apply_power = slot3
	})
end

function GuildController.handle13522(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0:openGuildApplySetWindow(false)
	end
end

function GuildController.requestChangeGuildSign(slot0, slot1)
	slot0:SendProtocal(13521, {
		sign = slot1
	})
end

function GuildController.handle13521(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0:openGuildChangeSignWindow(false)
	end
end

function GuildController.requestKickoutMember(slot0, slot1, slot2, slot3)
	function slot4()
		uv2:SendProtocal(13513, {
			rid = uv0,
			srv_id = uv1
		})
	end

	CommonAlert.show(string.format(TI18N("是否确认将【%s】玩家移除出公会？"), slot3), TI18N("确定"), function ()
		uv0()
	end, TI18N("取消"))
end

function GuildController.handle13513(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0:openGuildOperationPostWindow(false)
	end
end

function GuildController.requestOperationPost(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(13520, {
		rid = slot1,
		srv_id = slot2,
		position = slot3
	})
end

function GuildController.handle13520(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0:openGuildOperationPostWindow(false)
	end
end

function GuildController.requestChangGuildName(slot0, slot1)
	slot0:SendProtocal(13568, {
		name = slot1
	})
end

function GuildController.handle13568(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0:openGuildChangeNameWindow(false)
	end
end

function GuildController.requestGuildRecruit(slot0)
	if slot0.model:getMyGuildInfo() ~= nil then
		slot2 = {}
		slot4 = 5

		if Config.GuildData.data_const.recruit_limit then
			slot4 = slot3.val
		end

		if slot4 - slot1.recruit_num <= 0 then
			message(TI18N("当天招募次数已用完"))

			return
		end

		slot2[2] = {
			extend_size = 24,
			extend_offy = -55,
			extend_type = CommonAlert.type.rich,
			extend_str = string.format(TI18N("<div fontcolor=#68452a>剩余次数：%s</div>"), slot5),
			extend_aligment = cc.TEXT_ALIGNMENT_CENTER
		}

		if slot1.recruit_num == 0 then
			slot2[1] = {
				extend_offy = -5,
				extend_str = TI18N("（每日首次发布公告免费）"),
				extend_aligment = cc.TEXT_ALIGNMENT_CENTER
			}

			CommonAlert.show(TI18N("是否确定发布招募公告？"), TI18N("确定"), function ()
				uv0:SendProtocal(13558, {})
			end, TI18N("取消"), nil, nil, nil, {
				off_y = 43,
				extend_list = slot2
			}, nil, nil)
		else
			slot8 = RoleController:getInstance():getRoleVo()

			if Config.GuildData.data_const.recruit_cost and slot8 then
				slot2[1] = {
					extend_offy = -5,
					extend_type = CommonAlert.type.rich,
					extend_str = string.format("%s<img src=%s visible=true scale=0.35 />%s/%s", TI18N("发布消耗："), PathTool.getItemRes(15), MoneyTool.GetMoneyString(slot8.gold + slot8.red_gold), slot7.val),
					extend_aligment = cc.TEXT_ALIGNMENT_CENTER
				}

				CommonAlert.show(string.format(TI18N("是否确定花费<img src=%s visible=true scale=0.35 />%s发布招募广告？"), PathTool.getItemRes(15), slot7.val), TI18N("确定"), function ()
					uv0:SendProtocal(13558, {})
				end, TI18N("取消"), nil, CommonAlert.type.rich, nil, {
					off_y = 43,
					extend_list = slot2
				}, nil, nil)
			end
		end
	end
end

function GuildController.handle13558(slot0, slot1)
	message(slot1.msg)
end

function GuildController.handle13573(slot0, slot1)
	slot0.model:updateGuildRedStatus(GuildConst.red_index.apply, slot1.code == TRUE)
end

function GuildController.setApplyListStatus(slot0, slot1)
	slot0.model:updateGuildRedStatus(GuildConst.red_index.apply, true)
end

function GuildController.requestDonateBoxRewards(slot0, slot1)
	slot0:SendProtocal(13574, {
		box_id = slot1
	})
end

function GuildController.handle13574(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:setDonateBoxStatus(slot1.box_id)
	end
end

function GuildController.handle13575(slot0, slot1)
	slot0.model:updateDonateActivity(slot1.donate_exp)
end

function GuildController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end

	if slot0.role_vo ~= nil then
		if slot0.role_assets_event ~= nil then
			slot0.role_vo:UnBind(slot0.role_assets_event)

			slot0.role_assets_event = nil
		end

		slot0.role_vo = nil
	end
end

function GuildController.welcomeNewMember(slot0, slot1, slot2)
	slot0:SendProtocal(13576, {
		rid = slot1,
		srv_id = slot2
	})
end

function GuildController.handle13576(slot0, slot1)
	message(slot1.msg)
end

function GuildController.send16900(slot0)
	slot0:SendProtocal(16900, {})
end

function GuildController.handle16900(slot0, slot1)
	slot0.model:updataGuildActionRedStatus(slot1)
	GlobalEvent:getInstance():Fire(GuildEvent.UpdataGuildGoalBasicData, slot1)
end

function GuildController.send16901(slot0)
	slot0:SendProtocal(16901, {})
end

function GuildController.handle16901(slot0, slot1)
	GlobalEvent:getInstance():Fire(GuildEvent.UpdataGuildGoalTaskData, slot1)
end

function GuildController.handle16902(slot0, slot1)
	GlobalEvent:getInstance():Fire(GuildEvent.UpdataGuildGoalSingleTaskData, slot1)
end

function GuildController.send16903(slot0, slot1)
	slot0:SendProtocal(16903, {
		id = slot1
	})
end

function GuildController.handle16903(slot0, slot1)
	message(slot1.msg)
end

function GuildController.send16904(slot0)
	slot0:SendProtocal(16904, {})
end

function GuildController.handle16904(slot0, slot1)
	message(slot1.msg)
end

function GuildController.send13577(slot0)
	slot0:SendProtocal(13577, {})
end

function GuildController.handle13577(slot0, slot1)
	slot0.model:initGuildNoticeList(slot1.guild_log_info_list)
end

function GuildController.handle13578(slot0, slot1)
	slot0.model:addGuildNoticeItem(slot1.guild_log_info_list)
	slot0.model:updateGuildRedStatus(GuildConst.red_index.notice, true)
end

function GuildController.send13579(slot0, slot1, slot2)
	slot0:SendProtocal(13579, {
		type = slot1,
		id_list = slot2
	})
end

function GuildController.handle13579(slot0, slot1)
	message(slot1.msg)
end

function GuildController.send13580(slot0, slot1)
	slot0:SendProtocal(13580, {
		content = slot1
	})
end

function GuildController.handle13580(slot0, slot1)
	message(slot1.msg)
end

function GuildController.updateSkillFirstRedPoint(slot0)
	if slot0.role_vo and slot0.role_vo.gid ~= 0 and slot0.role_vo.gsrv_id ~= "" then
		slot0.model:updateGuildRedStatus(GuildConst.red_index.all_skill, RoleController:getInstance():getModel():getRedPointStatus(RoleConst.red_point.red_point_2))
	end
end
