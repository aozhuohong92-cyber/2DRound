GuildMemberWindow = GuildMemberWindow or BaseClass(BaseView)
slot0 = GuildController:getInstance()
slot1 = GuildController:getInstance():getModel()
slot2 = string.format

function GuildMemberWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Big
	slot0.title_str = TI18N("成员列表")
	slot0.my_guild_info = uv0:getMyGuildInfo()
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guild", "guild"),
			type = ResourcesType.plist
		}
	}
	slot0.touch_btn = true
	slot0.show_menber_list = {}
end

function GuildMemberWindow.open_callback(slot0)
	slot0.main_view = createCSBNote(PathTool.getTargetCSB("guild/guild_member_window"))

	slot0.container:addChild(slot0.main_view)

	slot0.scroll_container = slot0.main_view:getChildByName("background")
	slot0.desc = slot0.main_view:getChildByName("desc")
	slot0.explain_btn = slot0.main_view:getChildByName("explain_btn")
	slot0.exit_btn = slot0.main_view:getChildByName("exit_btn")
	slot0.exit_btn_label = slot0.exit_btn:getChildByName("label")
	slot0.recruit_btn = slot0.main_view:getChildByName("recruit_btn")

	slot0.recruit_btn:getChildByName("label"):setString(TI18N("公会招募"))

	slot0.checkapply_btn = slot0.main_view:getChildByName("checkapply_btn")

	slot0.checkapply_btn:getChildByName("label"):setString(TI18N("查看申请"))

	slot0.extend_container = slot0.main_view:getChildByName("extend_container")

	slot0.extend_container:getChildByName("desc"):setString(TI18N("按钮中可执行任命、转让、移除等权限操作"))
end

function GuildMemberWindow.register_event(slot0)
	slot0.recruit_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openGuildApplySetWindow(true)
		end
	end)
	slot0.checkapply_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openGuildApplyWindow(true)
		end
	end)
	slot0.exit_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.show_type == GuildConst.show_type.all then
				uv1:requestExitGuild()
			else
				if not uv0.touch_btn then
					return
				end

				if uv0.time_ticket == nil then
					uv0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
						uv0.touch_btn = true

						if uv0.time_ticket ~= nil then
							GlobalTimeTicket:getInstance():remove(uv0.time_ticket)

							uv0.time_ticket = nil
						end
					end, 2)
				end

				uv0.touch_btn = nil
				slot2 = {}

				for slot6, slot7 in pairs(uv0.show_menber_list) do
					table.insert(slot2, {
						rid = slot7.rid,
						srv_id = slot7.srv_id
					})
				end

				uv1:send13579(uv0.show_type, slot2)
			end
		end
	end)
	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.GuildData.data_const.game_rule.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
	end, true, 1)

	if slot0.update_member_list_event == nil then
		slot0.update_member_list_event = GlobalEvent:getInstance():Bind(GuildEvent.UpdateMyMemberListEvent, function (slot0)
			if slot0 == 0 then
				return
			end

			uv0:updateMemberList(slot0)
		end)
	end

	if slot0.my_guild_info ~= nil and slot0.update_myguild_event == nil then
		slot0.update_myguild_event = slot0.my_guild_info:Bind(GuildEvent.UpdateMyInfoEvent, function (slot0, slot1)
			if slot0 == "members_num" or slot0 == "members_max" then
				uv0:updateMemberNum()
			end
		end)
	end

	if slot0.update_assistant_event == nil then
		slot0.update_assistant_event = GlobalEvent:getInstance():Bind(GuildEvent.UpdateAssistantNumEvent, function ()
			if uv0.role_vo ~= nil and uv0.role_vo.position ~= GuildConst.post_type.member then
				uv0:updateMemberNum()
			end
		end)
	end

	slot0.role_vo = RoleController:getInstance():getRoleVo()

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "gid" then
				if slot1 == 0 then
					uv0:openGuildMemberWindow(false)
				end
			elseif slot0 == "position" then
				uv1:updateExitStatus()
			end
		end)
	end

	if slot0.update_red_status_event == nil then
		slot0.update_red_status_event = GlobalEvent:getInstance():Bind(GuildEvent.UpdateGuildRedStatus, function (slot0, slot1)
			uv0:updateApplyRedStatus(slot0, slot1)
		end)
	end
end

function GuildMemberWindow.openRootWnd(slot0, slot1)
	slot0.show_type = slot1 or GuildConst.show_type.all

	uv0:requestGuildMemberList()
	slot0:updateApplyRedStatus()
end

function GuildMemberWindow.updateExitStatus(slot0)
	if slot0.role_vo == nil then
		return
	end

	if slot0.show_type ~= GuildConst.show_type.all then
		slot0.exit_btn_label:setString(TI18N("一键提醒"))
		slot0.recruit_btn:setVisible(false)
		slot0.checkapply_btn:setVisible(false)
		slot0.exit_btn:setVisible(slot0.role_vo.position ~= GuildConst.post_type.member)

		if next(slot0.show_menber_list) == nil then
			slot0.exit_btn:setVisible(false)
		end
	else
		if slot0.role_vo.position == GuildConst.post_type.leader then
			slot0.exit_btn_label:setString(TI18N("解散公会"))
		else
			slot0.exit_btn_label:setString(TI18N("退出公会"))
		end

		slot0.extend_container:setVisible(slot0.role_vo.position ~= GuildConst.post_type.member)
		slot0.recruit_btn:setVisible(slot0.role_vo.position ~= GuildConst.post_type.member)
		slot0.checkapply_btn:setVisible(slot0.role_vo.position ~= GuildConst.post_type.member)
	end
end

function GuildMemberWindow.updateApplyRedStatus(slot0, slot1, slot2)
	if slot1 == GuildConst.red_index.apply then
		addRedPointToNodeByStatus(slot0.checkapply_btn, slot2)
	else
		addRedPointToNodeByStatus(slot0.checkapply_btn, uv0:getRedStatus(GuildConst.red_index.apply))
	end
end

function GuildMemberWindow.updateMemberNum(slot0)
	if slot0.show_type ~= GuildConst.show_type.all then
		slot1 = ""

		if slot0.show_type == GuildConst.show_type.guild_war then
			slot1 = TI18N("公会战有剩余挑战次数的玩家：%s/%s")
		elseif slot0.show_type == GuildConst.show_type.guild_donate then
			slot1 = TI18N("公会捐献今日还未捐献的玩家：%s/%s")
		elseif slot0.show_type == GuildConst.show_type.guild_voyage then
			slot1 = TI18N("公会副本有剩余购买挑战次数的玩家：%s/%s")
		end

		if slot0.my_guild_info then
			slot0.desc:setString(string.format(slot1, #slot0.show_menber_list, slot0.my_guild_info.members_max))
		end
	elseif slot0.my_guild_info ~= nil and slot0.role_vo ~= nil then
		if slot0.role_vo.position == GuildConst.post_type.member then
			slot0.desc:setString(string.format(TI18N("人数：%s/%s"), slot0.my_guild_info.members_num, slot0.my_guild_info.members_max))
		elseif Config.GuildData.data_post[getNorKey(GuildConst.post_type.assistant, slot0.my_guild_info.lev)] ~= nil then
			slot0.desc:setString(string.format("%s%s/%s   %s%s/%s", TI18N("人数："), slot0.my_guild_info.members_num, slot0.my_guild_info.members_max, TI18N("副会长："), uv0:getAssistantSum(), slot1.num))
		end
	end
end

function GuildMemberWindow.updateMemberList(slot0, slot1)
	slot0.show_menber_list = uv0:getGuildMemberList(slot0.show_type)

	if slot0.show_menber_list ~= nil and next(slot0.show_menber_list) ~= nil then
		if slot0.scroll_view == nil then
			slot0.scroll_view = CommonScrollViewLayout.new(slot0.scroll_container, cc.p(0, 7), nil, nil, cc.size(slot0.scroll_container:getContentSize().width, slot0.scroll_container:getContentSize().height - 12), {
				start_y = 0,
				item_width = 600,
				start_x = 4,
				space_x = 4,
				row = 0,
				item_height = 135,
				space_y = -3,
				col = 1,
				need_dynamic = true,
				item_class = GuildMemberItem
			})
		end

		if slot1 == 1 then
			if slot0.scroll_view then
				slot0.scroll_view:setData(slot0.show_menber_list)
			end
		else
			slot0.scroll_view:resetAddPosition(slot0.show_menber_list)
		end
	end

	slot0:updateMemberNum()
	slot0:updateExitStatus()
end

function GuildMemberWindow.close_callback(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	uv0:openGuildMemberWindow(false)

	if slot0.update_member_list_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_member_list_event)

		slot0.update_member_list_event = nil
	end

	if slot0.my_guild_info ~= nil then
		if slot0.update_myguild_event ~= nil then
			slot0.my_guild_info:UnBind(slot0.update_myguild_event)

			slot0.update_myguild_event = nil
		end

		slot0.my_guild_info = nil
	end

	if slot0.update_assistant_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_assistant_event)

		slot0.update_assistant_event = nil
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

	for slot4, slot5 in pairs(slot0.show_menber_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

GuildMemberItem = class("GuildMemberItem", function ()
	return ccui.Layout:create()
end)

function GuildMemberItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guild/guild_member_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.set_post_btn = slot1:getChildByName("set_post_btn")
	slot0.role_online = slot1:getChildByName("role_online")
	slot0.role_name = slot1:getChildByName("role_name")
	slot0.role_position = slot1:getChildByName("role_position")
	slot0.role_donate = slot1:getChildByName("role_donate")
	slot0.role_day_donate = slot1:getChildByName("role_day_donate")
	slot0.role_action = slot1:getChildByName("role_action")

	slot1:getChildByName("position_title"):setString(TI18N("职位："))

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(73, 65)
	slot1:addChild(slot0.role_head)
	slot0.role_head:setLev(99)

	slot0.container = slot1

	slot0:registerEvent()
end

function GuildMemberItem.registerEvent(slot0)
	slot0.role_head:addCallBack(function ()
		if uv0.data ~= nil then
			if uv0.data.is_self == true then
				message(TI18N("怎么？自己都不认识了？"))
			else
				FriendController:getInstance():openFriendCheckPanel(true, {
					srv_id = uv0.data.srv_id,
					rid = uv0.data.rid
				})
			end
		end
	end, false)
	slot0.set_post_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data ~= nil then
				if RoleController:getInstance():getRoleVo().position == 1 then
					if uv0.data.post ~= GuildConst.post_type.leader then
						uv1:openGuildOperationPostWindow(true, uv0.data)
					end
				elseif slot2.position == 2 then
					if uv0.data.post == GuildConst.post_type.member then
						uv1:openGuildOperationPostWindow(true, uv0.data)
					elseif uv0.data.post == GuildConst.post_type.leader then
						uv1:openGuildImpeachPostWindow(true)
					end
				elseif slot2.position == 3 and uv0.data.post == GuildConst.post_type.leader then
					uv1:openGuildImpeachPostWindow(true)
				end
			end
		end
	end)
end

function GuildMemberItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function GuildMemberItem.setData(slot0, slot1)
	if slot0.data ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end

	if slot1 then
		slot0.data = slot1

		slot0.set_post_btn:setVisible(true)
		slot0:setBaseData()
		slot0:setOnLineStatus()
		slot0:updateBtnStatusByRolePost()

		if slot0.update_self_event == nil then
			slot0.update_self_event = slot0.data:Bind(GuildEvent.UpdateMyMemberItemEvent, function (slot0, slot1)
				if slot0 == "post" or slot0 == "role_post" then
					uv0:setPostInfo()
					uv0:updateBtnStatusByRolePost()
				end
			end)
		end

		if slot1.is_self == true then
			slot0.container:loadTexture(PathTool.getResFrame("common", "common_1020"), LOADTEXT_TYPE_PLIST)
		else
			slot0.container:loadTexture(PathTool.getResFrame("common", "common_1029"), LOADTEXT_TYPE_PLIST)
		end
	end
end

function GuildMemberItem.setBaseData(slot0)
	if slot0.data == nil then
		return
	end

	slot1 = slot0.data

	slot0.role_name:setString(slot1.name)
	slot0.role_head:setHeadRes(slot1.face, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
	slot0.role_head:setLev(slot1.lev)
	slot0.role_donate:setString(string.format(TI18N("贡献：%s"), slot1.donate))
	slot0.role_day_donate:setString(string.format(TI18N("今日贡献：%s"), slot1.day_donate))
	slot0.role_action:setString(string.format(TI18N("活跃等级：%s"), slot1.active_lev))
	slot0:setPostInfo()
end

slot3 = 3
slot4 = 7

function GuildMemberItem.updateBtnStatusByRolePost(slot0)
	if slot0.data == nil then
		return
	end

	if RoleController:getInstance():getRoleVo().position == 1 then
		if slot0.data.post == GuildConst.post_type.leader then
			slot0.set_post_btn:setVisible(false)
		else
			slot0.set_post_btn:setVisible(true)
		end
	elseif slot1.position == 2 then
		if slot1.position == slot0.data.post then
			slot0.set_post_btn:setVisible(false)
		end

		if slot0.data.post == GuildConst.post_type.leader then
			if GameNet:getInstance():getTime() - slot0.data.login_time >= 86400 * uv0 then
				slot0.set_post_btn:setVisible(true)
			else
				slot0.set_post_btn:setVisible(false)
			end
		end
	elseif slot1.position == 3 then
		if slot0.data.post == GuildConst.post_type.leader then
			if GameNet:getInstance():getTime() - slot0.data.login_time >= 86400 * uv1 then
				slot0.set_post_btn:setVisible(true)
			else
				slot0.set_post_btn:setVisible(false)
			end
		else
			slot0.set_post_btn:setVisible(false)
		end
	end
end

function GuildMemberItem.setOnLineStatus(slot0)
	if slot0.data == nil then
		return
	end

	if slot0.data.online == FALSE then
		slot0.role_online:setTextColor(Config.ColorData.data_color4[183])

		if GameNet:getInstance():getTime() - slot1.login_time <= 60 then
			slot0.role_online:setString(TI18N("刚刚"))
		elseif slot2 > 60 and slot2 <= 3600 then
			slot0.role_online:setString(string.format(TI18N("%s分钟前"), math.floor(slot2 / 60)))
		elseif slot2 > 3600 and slot2 <= 86400 then
			slot0.role_online:setString(string.format(TI18N("%s小时前"), math.floor(slot2 / 3600)))
		elseif slot2 > 86400 and slot2 <= 604800 then
			slot0.role_online:setString(string.format(TI18N("%s天前"), math.floor(slot2 / 86400)))
		else
			slot0.role_online:setString(TI18N("7天前"))
		end
	else
		slot0.role_online:setTextColor(Config.ColorData.data_color4[178])
		slot0.role_online:setString(TI18N("在线"))
	end
end

function GuildMemberItem.setPostInfo(slot0)
	if slot0.data == nil then
		return
	end

	if Config.GuildData.data_position[slot0.data.post] ~= nil then
		if slot0.data.post == GuildConst.post_type.member then
			slot0.role_position:setTextColor(Config.ColorData.data_color4[175])
		else
			slot0.role_position:setTextColor(Config.ColorData.data_color4[185])
		end

		slot0.role_position:setString(slot1.name)
	end
end

function GuildMemberItem.suspendAllActions(slot0)
	if slot0.data ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end
end

function GuildMemberItem.DeleteMe(slot0)
	slot0:suspendAllActions()
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
