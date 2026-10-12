GuildNewMainWindow = GuildNewMainWindow or BaseClass(BaseView)
slot0 = 30
slot1 = GuildController:getInstance()
slot2 = GuildController:getInstance():getModel()
slot3 = 360
slot4 = string.format
slot5 = table.insert
slot6 = GuildbossController:getInstance():getModel()
slot7 = GuildskillController:getInstance():getModel()
slot8 = RedbagController:getInstance():getModel()
slot9 = GuildwarController:getInstance():getModel()

function GuildNewMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.layout_name = "guild/guild_new_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guild", "guild"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/guild", "guild_bg_1", true),
			type = ResourcesType.single
		}
	}
	slot0.icon_list = {}
	slot0.effect_list = {}
	slot0.npc_list = {}
	slot0.is_shrink = true
	slot0.is_in_shrink = false
	slot0.touch_pos = {
		[109] = {
			745,
			170
		}
	}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function GuildNewMainWindow.open_callback(slot0)
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.guild_bg = slot0.root_wnd:getChildByName("bg")
	slot0.top_bg = slot0.root_wnd:getChildByName("top_bg")
	slot0.bottom_bg = slot0.root_wnd:getChildByName("bottom_bg")
	slot0.map_layer = slot0.main_container:getChildByName("map_layer")
	slot0.guild_panel = slot0.main_container:getChildByName("guild_panel")
	slot0.mask_panel = slot0.guild_panel:getChildByName("mask_panel")
	slot0.info_panel = slot0.mask_panel:getChildByName("info_panel")

	slot0.mask_panel:setVisible(true)
	slot0.info_panel:setVisible(false)

	slot0.sign_btn = slot0.info_panel:getChildByName("sign_btn")
	slot0.guild_sign_value = slot0.info_panel:getChildByName("guild_sign_value")

	slot0.guild_sign_value:setTextAreaSize(cc.size(250, 130))

	slot0.change_name_btn = slot0.guild_panel:getChildByName("change_name_btn")
	slot0.rank_btn = slot0.info_panel:getChildByName("rank_btn")

	slot0.rank_btn:getChildByName("label"):setString(TI18N("公会排名"))
	UITool.SetTitleColor(slot0.rank_btn:getChildByName("label"))
	slot0.info_panel:getChildByName("guild_leader_title"):setString(TI18N("会长："))

	slot0.arrow_img = slot0.guild_panel:getChildByName("arrow_img")
	slot0.guild_name_value = slot0.guild_panel:getChildByName("guild_name_value")
	slot0.guild_leader_value = slot0.info_panel:getChildByName("guild_leader_value")
	slot0.guild_lev_value = slot0.info_panel:getChildByName("guild_lev_value")
	slot0.check_member_btn = slot0.info_panel:getChildByName("check_member_btn")
	slot0.check_member_btn.tips = slot0.check_member_btn:getChildByName("tips")

	slot0.check_member_btn:getChildByName("label"):setString(TI18N("公会管理"))
	UITool.SetTitleColor(slot0.check_member_btn:getChildByName("label"))

	slot0.notice_btn = slot0.info_panel:getChildByName("notice_btn")
	slot0.notice_btn.tips = slot0.notice_btn:getChildByName("tips")

	slot0.notice_btn:getChildByName("label"):setString(TI18N("公会日志"))
	UITool.SetTitleColor(slot0.notice_btn:getChildByName("label"))

	slot0.progress = slot0.info_panel:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)

	slot0.progress_num = slot0.info_panel:getChildByName("progress_num")

	slot0:adaptationScreen()
end

function GuildNewMainWindow.adaptationScreen(slot0)
	slot0.top_bg:setPositionY(display.getTop(slot0.container))
	slot0.bottom_bg:setPositionY(display.getBottom(slot0.container))
end

function GuildNewMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.sign_btn, function ()
		uv0:openGuildChangeSignWindow(true)
	end, true, 1)
	registerButtonEventListener(slot0.change_name_btn, function ()
		uv0:openGuildChangeNameWindow(true)
	end, true, 1)
	registerButtonEventListener(slot0.rank_btn, function ()
		RankController:getInstance():openRankView(true, RankConstant.RankType.union)
	end, true, 1)
	registerButtonEventListener(slot0.check_member_btn, function ()
		uv0:openGuildMemberWindow(true)
	end, true, 1)
	registerButtonEventListener(slot0.notice_btn, function ()
		uv0:openGuildNoticeWindow(true)
	end, true, 1)
	registerButtonEventListener(slot0.guild_panel, function ()
		uv0:shrinkInfoContainer()
	end, false, 1)

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

function GuildNewMainWindow.registerEvent(slot0)
	slot4 = cc.EventListenerTouchOneByOne:create()

	slot4:registerScriptHandler(function (slot0, slot1)
		uv0.touch_point = nil

		doStopAllActions(uv0.guild_bg)

		return true
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot4:registerScriptHandler(function (slot0, slot1)
		uv0.touch_point = slot0:getDelta()

		uv0.guild_bg:setPositionX(uv0:setBorder(uv0.touch_point.x))
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot4:registerScriptHandler(function (slot0, slot1)
		if uv0.touch_point then
			slot2 = uv0.touch_point.x + 15

			if uv0.touch_point.x < 0 then
				slot2 = uv0.touch_point.x - 15
			end

			uv0.guild_bg:stopAllActions()
			uv0.guild_bg:runAction(cc.Sequence:create(cc.EaseSineOut:create(cc.MoveTo:create(1, cc.p(uv0:setBorder(slot2), 640))), cc.CallFunc:create(function ()
			end)))
		end
	end, cc.Handler.EVENT_TOUCH_ENDED)
	slot0.map_layer:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot4, slot0.map_layer)
end

function GuildNewMainWindow.setGray(slot0, slot1)
	if slot0.rank_btn:isVisible() == true then
		setChildUnEnabled(slot1, slot0.rank_btn)

		if slot1 == true then
			slot0.rank_btn:getChildByName("label"):disableEffect(cc.LabelEffect.OUTLINE)
		else
			slot0.rank_btn:getChildByName("label"):enableOutline(cc.c4b(2, 0, 25, 255), 1)
		end
	end
end

function GuildNewMainWindow.setBorder(slot0, slot1)
	if slot0.move_pos <= slot0.guild_bg:getPositionX() + slot1 then
		slot2 = slot0.move_pos
	end

	if slot2 <= uv0 - (slot0.move_pos - uv0) then
		slot2 = uv0 - (slot0.move_pos - uv0)
	end

	return slot2
end

function GuildNewMainWindow.shrinkInfoContainer(slot0)
	if not slot0.info_panel then
		return
	end

	if slot0.is_in_shrink == true then
		return
	end

	slot0.is_in_shrink = true
	slot0.is_shrink = not slot0.is_shrink

	slot0.info_panel:setVisible(true)

	slot2, slot3 = nil
	slot4 = 1

	if slot0.is_shrink == true then
		slot2 = cc.MoveTo:create(0.6, cc.p(0, 587.5))
		slot3 = cc.FadeOut:create(0.6)
	else
		slot2 = cc.MoveTo:create(0.6, cc.p(0, 100))
		slot3 = cc.FadeIn:create(0.1)
		slot4 = -1
	end

	slot0.arrow_img:setScaleY(slot4)
	slot0.info_panel:runAction(cc.Sequence:create(cc.Spawn:create(cc.EaseBackOut:create(slot2), slot3), cc.CallFunc:create(function ()
		uv0.is_in_shrink = false

		if uv0.is_shrink == true then
			uv0.info_panel:setVisible(false)
		end
	end)))
end

function GuildNewMainWindow.createLayer(slot0)
	for slot4 = 1, 2 do
		slot0["map_layer" .. slot4] = ccui.Layout:create()

		slot0["map_layer" .. slot4]:setAnchorPoint(cc.p(0, 0))
		slot0["map_layer" .. slot4]:setContentSize(slot0.guild_bg:getContentSize())

		if slot0.guild_bg and slot0["map_layer" .. slot4] then
			slot0.guild_bg:addChild(slot0["map_layer" .. slot4])
		end
	end
end

function GuildNewMainWindow.openRootWnd(slot0)
	slot0:setGray(not RankController:getInstance():checkRankIsShow())
	slot0.guild_bg:ignoreContentAdaptWithSize(true)
	slot0.guild_bg:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/guild", "guild_bg_1", true), LOADTEXT_TYPE)

	slot0.move_pos = slot0.guild_bg:getContentSize().width * display.getMaxScale() * 0.5

	slot0.guild_bg:setScale(display.getMaxScale())

	slot0.move_pos = slot0.move_pos or 540

	slot0:createLayer()
	slot0:registerEvent()
	slot0:createIcon()
	slot0:createEffect()
	slot0:createNpc()

	if slot0.my_guild_info == nil then
		slot0.my_guild_info = uv0:getMyGuildInfo()

		if slot0.my_guild_info ~= nil and slot0.update_my_guild_info_event == nil then
			slot0.update_my_guild_info_event = slot0.my_guild_info:Bind(GuildEvent.UpdateMyInfoEvent, function (slot0, slot1)
				if slot0 == "sign" then
					uv0:updateGuildSignInfo()
				elseif slot0 == "members_num" then
					-- Nothing
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
		slot0:updateSomeRedStatus()
	end

	slot0:updateJurisdiction()

	if SysEnv:getInstance():getBool(SysEnv.keys.guild_first_open, true) == true then
		slot0:shrinkInfoContainer()
		SysEnv:getInstance():set(SysEnv.keys.guild_first_open, false)
	end
end

function GuildNewMainWindow.createIcon(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(Config.GuildData.data_guild_scene_icon) do
		if slot6.res_type == 1 then
			uv0(slot1, slot6)
		end
	end

	for slot5, slot6 in ipairs(slot1) do
		if slot0.map_layer2 and slot0.icon_list[slot6.type] == nil then
			slot0.icon_list[slot6.type] = ccui.Layout:create()

			slot0.icon_list[slot6.type]:setContentSize(cc.size(83, 80))
			slot0.icon_list[slot6.type]:setTouchEnabled(true)
			slot0.icon_list[slot6.type]:setAnchorPoint(0.5, 0.5)
			slot0.icon_list[slot6.type]:setPosition(slot6.pos[1][1], slot6.pos[1][2])

			if slot0.icon_list[slot6.type] then
				slot0.map_layer2:addChild(slot0.icon_list[slot6.type])
			end

			slot7 = ccui.Layout:create()

			slot7:setContentSize(cc.size(183, 180))
			slot7:setTouchEnabled(true)
			slot7:setAnchorPoint(0.5, 0.5)
			slot7:setPosition(41.5 + slot6.offset_pos[1], 40 + slot6.offset_pos[2])
			slot0.icon_list[slot6.type]:addChild(slot7)
			createImage(slot7, PathTool.getResFrame("guild", string.format("guild_icon_%s", slot6.icon)), 91.5 - slot6.offset_pos[1], 90 - slot6.offset_pos[2], cc.p(0.5, 0.5), true)
			createImage(slot7, PathTool.getResFrame("guild", "guild_1028"), 91.5 - slot6.offset_pos[1], 73 - slot6.offset_pos[2], cc.p(0.5, 0.5), true, nil, true):setContentSize(cc.size(74, 22))
			createLabel(18, cc.c4b(255, 248, 202, 255), cc.c4b(50, 28, 14, 255), 91.5 - slot6.offset_pos[1], 73 - slot6.offset_pos[2], slot6.name, slot7, 1, cc.p(0.5, 0.5))

			if slot6.type == GuildConst.icon_type.guild_icon_type_6 then
				slot0.icon_list[slot6.type].is_unlock = false
			elseif slot6.type == GuildConst.icon_type.guild_icon_type_4 then
				slot0.icon_list[slot6.type].is_unlock = false
			end

			registerButtonEventListener(slot7, function (slot0)
				uv0:onCheckIcon(slot0)
			end, true, 1, slot6)
		end
	end
end

function GuildNewMainWindow.createEffect(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(Config.GuildData.data_guild_scene_icon) do
		if slot6.res_type == 2 then
			uv0(slot1, slot6)
		end
	end

	for slot5, slot6 in ipairs(slot1) do
		if slot0.map_layer1 and slot0.effect_list[slot5] == nil then
			delayRun(slot0.root_wnd, slot5 * 2 / display.DEFAULT_FPS, function ()
				if uv0.effect_list[uv1] == nil then
					uv0.effect_list[uv1] = createEffectSpine(uv2.icon, cc.p(uv2.pos[1][1], uv2.pos[1][2]), cc.p(0.5, 0.5), true, PlayerAction.action_1, nil, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444)

					if uv0.effect_list[uv1] and uv0.map_layer1 and not tolua.isnull(uv0.map_layer1) then
						uv0.map_layer1:addChild(uv0.effect_list[uv1])

						if uv0.touch_pos and uv0.touch_pos[uv2.type] then
							slot0 = ccui.Layout:create()

							slot0:setContentSize(cc.size(83, 83))
							slot0:setPosition(uv0.touch_pos[uv2.type][1], uv0.touch_pos[uv2.type][2])
							slot0:setTouchEnabled(true)
							uv0.map_layer1:addChild(slot0)

							uv0.effect_list[uv1].is_idle_ing = false

							uv0.effect_list[uv1]:registerSpineEventHandler(function (slot0)
								if slot0.animation == PlayerAction.action_2 and uv0.effect_list[uv1] and not tolua.isnull(uv0.effect_list[uv1]) then
									uv0.effect_list[uv1]:setAnimation(0, PlayerAction.action_1, true)

									uv0.effect_list[uv1].is_idle_ing = false
								end
							end, sp.EventType.ANIMATION_COMPLETE)
							slot0:addTouchEventListener(function (slot0, slot1)
								if uv0.effect_list[uv1] == nil or tolua.isnull(uv0.effect_list[uv1]) or uv0.effect_list[uv1].is_idle_ing == true then
									return
								end

								uv0.effect_list[uv1].is_idle_ing = true

								uv0.effect_list[uv1]:setAnimation(0, PlayerAction.action_2, false)
							end)
						end
					end
				end
			end)
		end
	end
end

function GuildNewMainWindow.createNpc(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(Config.GuildData.data_guild_scene_icon) do
		if slot6.res_type == 3 then
			uv0(slot1, slot6)
		end
	end

	for slot5, slot6 in ipairs(slot1) do
		if slot0.map_layer1 and slot0.npc_list[slot5] == nil then
			delayRun(slot0.map_layer1, slot5 * 2 / display.DEFAULT_FPS, function ()
				if uv0.npc_list[uv1] == nil then
					uv0.npc_list[uv1] = createEffectSpine(uv2.icon, cc.p(uv2.pos[1][1], uv2.pos[1][2]), cc.p(0.5, 0.5), true, PlayerAction.action, nil, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444)

					if uv0.npc_list[uv1] and uv0.map_layer1 and not tolua.isnull(uv0.map_layer1) then
						uv0.map_layer1:addChild(uv0.npc_list[uv1])
					end
				end
			end)
		end
	end
end

function GuildNewMainWindow.updateJurisdiction(slot0)
	if slot0.role_vo == nil then
		return
	end

	if slot0.role_vo.position == GuildConst.post_type.member then
		slot0.sign_btn:setVisible(false)
		slot0.change_name_btn:setVisible(false)
	else
		slot0.sign_btn:setVisible(false)
		slot0.change_name_btn:setVisible(true)
	end
end

function GuildNewMainWindow.updateGuildSignInfo(slot0)
	if slot0.my_guild_info == nil then
		return
	end

	slot0.guild_sign_value:setString(slot0.my_guild_info.sign)
end

function GuildNewMainWindow.updateGuildBaseInfo(slot0)
	if slot0.my_guild_info == nil then
		return
	end

	slot0.guild_lev_value:setString(uv0(TI18N("Lv.%s"), slot0.my_guild_info.lev))

	if Config.GuildData.data_guild_lev[slot0.my_guild_info.lev] ~= nil then
		if slot1.exp == 0 then
			slot0.progress_num:setString(TI18N("已满级"))
			slot0.progress:setPercent(100)
		else
			slot0.progress_num:setString(uv0("%s/%s", slot0.my_guild_info.exp, slot1.exp))
			slot0.progress:setPercent(math.floor(slot0.my_guild_info.exp / slot1.exp * 100))
		end
	end

	slot0:checkGuildDunLockStatus()
	slot0:checkGuildWarStatus()
end

function GuildNewMainWindow.updateGuildNameInfo(slot0)
	if slot0.my_guild_info == nil then
		return
	end

	slot0.guild_name_value:setString(slot0.my_guild_info.name)
end

function GuildNewMainWindow.checkGuildDunLockStatus(slot0)
	slot1 = false

	if slot0.icon_list[GuildConst.icon_type.guild_icon_type_4].is_unlock == false and Config.GuildDunData.data_const.guild_lev then
		slot1 = slot0.my_guild_info and slot2.val <= slot0.my_guild_info.lev
		slot0.icon_list[GuildConst.icon_type.guild_icon_type_4].is_unlock = slot1

		if slot1 == false then
			setChildUnEnabled(true, slot0.icon_list[GuildConst.icon_type.guild_icon_type_4])
		else
			setChildUnEnabled(false, slot0.icon_list[GuildConst.icon_type.guild_icon_type_4])
		end
	end
end

function GuildNewMainWindow.checkGuildWarStatus(slot0)
	slot1 = false

	if slot0.icon_list[GuildConst.icon_type.guild_icon_type_6].is_unlock == false then
		slot3 = Config.GuildWarData.data_const.limit_open_time

		if Config.GuildWarData.data_const.limit_lev and slot3 then
			slot1 = slot0.my_guild_info and slot2.val <= slot0.my_guild_info.lev
			slot4 = ""
			slot4 = (slot1 ~= true or slot3.desc) and slot2.desc
			slot0.icon_list[GuildConst.icon_type.guild_icon_type_6].is_unlock = slot1

			if slot1 == false then
				setChildUnEnabled(true, slot0.icon_list[GuildConst.icon_type.guild_icon_type_6])
			else
				setChildUnEnabled(false, slot0.icon_list[GuildConst.icon_type.guild_icon_type_6])
			end
		end
	end
end

function GuildNewMainWindow.updateGuildLeaderInfo(slot0)
	if slot0.my_guild_info == nil then
		return
	end

	slot0.guild_leader_value:setString(slot0.my_guild_info.leader_name)
end

function GuildNewMainWindow.onCheckIcon(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.type == GuildConst.icon_type.guild_icon_type_1 then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildSecretArea)
	elseif slot1.type == GuildConst.icon_type.guild_icon_type_2 then
		GuildskillController:getInstance():openGuildSkillMainWindow(true)
	elseif slot1.type == GuildConst.icon_type.guild_icon_type_3 then
		GuildmarketplaceController:getInstance():openGuildmarketplaceMainWindow(true)
	elseif slot1.type == GuildConst.icon_type.guild_icon_type_4 then
		if slot0.icon_list[GuildConst.icon_type.guild_icon_type_4].is_unlock == false and Config.GuildDunData.data_const.guild_lev then
			message(slot2.desc)

			return
		end

		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildDun)
	elseif slot1.type == GuildConst.icon_type.guild_icon_type_5 then
		MallController:getInstance():openMallPanel(true, MallConst.MallType.UnionShop)
	elseif slot1.type == GuildConst.icon_type.guild_icon_type_6 then
		if slot0.icon_list[GuildConst.icon_type.guild_icon_type_6].is_unlock == false then
			slot3 = Config.GuildWarData.data_const.limit_open_time

			if Config.GuildWarData.data_const.limit_lev and slot3 then
				slot5 = ""

				message(((slot0.my_guild_info and slot2.val <= slot0.my_guild_info.lev) ~= true or slot3.desc) and slot2.desc)

				return
			end
		end

		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildWar)
		uv0:updateGuildWarRedStatus(GuildConst.red_index.guildwar_start, false)
	elseif slot1.type == GuildConst.icon_type.guild_icon_type_7 then
		if slot0.role_vo ~= nil then
			if Config.GuildQuestData.data_guild_action_data.open_glev.val <= slot0.role_vo.guild_lev then
				uv1:openGuildActionGoalWindow(true)
			else
				message(uv2(TI18N("公会达到%d级后开启"), slot2))
			end
		end
	elseif slot1.type == GuildConst.icon_type.guild_icon_type_8 then
		uv1:openGuildDonateWindow(true)
	elseif slot1.type == GuildConst.icon_type.guild_icon_type_9 then
		RedbagController:getInstance():openMainView(true)
	end
end

function GuildNewMainWindow.updateSomeRedStatus(slot0, slot1, slot2)
	slot3 = false

	if slot1 == GuildConst.red_index.notice then
		slot0.notice_btn.tips:setVisible(slot2)
	elseif slot1 == GuildConst.red_index.apply then
		slot0.check_member_btn.tips:setVisible(slot2)
	elseif slot1 == GuildConst.red_index.boss_times then
		if slot0.icon_list[GuildConst.icon_type.guild_icon_type_4] then
			addRedPointToNodeByStatus(slot0.icon_list[GuildConst.icon_type.guild_icon_type_4], uv0:checkGuildDunRedStatus())
		end
	elseif slot1 == GuildConst.red_index.donate or slot1 == GuildConst.red_index.donate_activity then
		addRedPointToNodeByStatus(slot0.icon_list[GuildConst.icon_type.guild_icon_type_8], uv1:getDonateRedStatus())
	elseif slot1 == GuildConst.red_index.skill_2 or slot1 == GuildConst.red_index.skill_3 or slot1 == GuildConst.red_index.skill_4 or slot1 == GuildConst.red_index.skill_5 or slot1 == GuildConst.red_index.pvp_skill_2 or slot1 == GuildConst.red_index.pvp_skill_3 or slot1 == GuildConst.red_index.pvp_skill_4 or slot1 == GuildConst.red_index.pvp_skill_5 or slot1 == GuildConst.red_index.all_skill then
		addRedPointToNodeByStatus(slot0.icon_list[GuildConst.icon_type.guild_icon_type_2], RoleController:getInstance():getModel():getRedPointStatus(RoleConst.red_point.red_point_2))
	elseif slot1 == GuildConst.red_index.red_bag then
		addRedPointToNodeByStatus(slot0.icon_list[GuildConst.icon_type.guild_icon_type_9], slot2)
	elseif slot1 == GuildConst.red_index.guild_secret_area then
		addRedPointToNodeByStatus(slot0.icon_list[GuildConst.icon_type.guild_icon_type_1], slot2)
	elseif slot1 == GuildConst.red_index.goal_action then
		if slot0.icon_list[GuildConst.icon_type.guild_icon_type_7] then
			addRedPointToNodeByStatus(slot0.icon_list[GuildConst.icon_type.guild_icon_type_7], slot2)
		end
	elseif slot1 == GuildConst.red_index.guildwar_start or slot1 == GuildConst.red_index.guildwar_match or slot1 == GuildConst.red_index.guildwar_count then
		slot3 = uv2:checkGuildGuildWarRedStatus()

		if slot0.icon_list[GuildConst.icon_type.guild_icon_type_6].is_unlock == false then
			slot3 = false
		end

		addRedPointToNodeByStatus(slot0.icon_list[GuildConst.icon_type.guild_icon_type_6], slot3)
	else
		slot0.check_member_btn.tips:setVisible(uv1:getRedStatus(GuildConst.red_index.apply))
		addRedPointToNodeByStatus(slot0.icon_list[GuildConst.icon_type.guild_icon_type_8], uv1:getDonateRedStatus())
		addRedPointToNodeByStatus(slot0.icon_list[GuildConst.icon_type.guild_icon_type_4], uv0:checkGuildDunRedStatus())

		slot3 = uv2:checkGuildGuildWarRedStatus()

		if slot0.icon_list[GuildConst.icon_type.guild_icon_type_6].is_unlock == false then
			slot3 = false
		end

		addRedPointToNodeByStatus(slot0.icon_list[GuildConst.icon_type.guild_icon_type_6], slot3)
		addRedPointToNodeByStatus(slot0.icon_list[GuildConst.icon_type.guild_icon_type_2], RoleController:getInstance():getModel():getRedPointStatus(RoleConst.red_point.red_point_2))
		addRedPointToNodeByStatus(slot0.icon_list[GuildConst.icon_type.guild_icon_type_9], uv3:getAllRedBagStatus())

		if slot0.icon_list[GuildConst.icon_type.guild_icon_type_7] then
			addRedPointToNodeByStatus(slot0.icon_list[GuildConst.icon_type.guild_icon_type_7], uv1:getGoalRedStatus())
		end

		if slot0.icon_list[GuildConst.icon_type.guild_icon_type_1] then
			addRedPointToNodeByStatus(slot0.icon_list[GuildConst.icon_type.guild_icon_type_1], GuildsecretareaController:getInstance():getModel():checkRedPoint())
		end
	end
end

function GuildNewMainWindow.close_callback(slot0)
	doStopAllActions(slot0.guild_bg)
	doStopAllActions(slot0.map_layer1)
	doStopAllActions(slot0.info_panel)
	doStopAllActions(slot0.root_wnd)

	for slot4, slot5 in pairs(slot0.effect_list) do
		if slot5 then
			slot5:clearTracks()
			slot5:removeFromParent()

			slot5 = nil
		end
	end

	slot0.effect_list = {}

	for slot4, slot5 in pairs(slot0.npc_list) do
		if slot5 then
			slot5:clearTracks()
			slot5:removeFromParent()

			slot5 = nil
		end
	end

	slot0.npc_list = {}

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

	uv0:openGuildMainWindow(false)
end
