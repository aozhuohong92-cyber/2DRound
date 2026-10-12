GuildwarMainWindow = GuildwarMainWindow or BaseClass(BaseView)
slot1 = GuildwarController:getInstance():getModel()

function GuildwarMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "guildwar/guildwar_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildwar", "guildwar"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/guildwar", "guildwar_1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/guildwar", "guildwar_2"),
			type = ResourcesType.single
		}
	}
	slot0.cur_position_type = GuildwarConst.positions.others
	slot0.position_vo_data = {}
	slot0.position_stack = {}
	slot0.position_pool = {}
	slot0.position_pos = {}
	slot0.map_bgs = {}
	slot0.top3_item_list = {}
end

function GuildwarMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.map_layer = slot0.main_container:getChildByName("map_layer")
	slot0.show_panel = slot0.main_container:getChildByName("show_panel")
	slot0.state_panel = slot0.main_container:getChildByName("state_panel")
	slot0.top_panel = slot0.main_container:getChildByName("top_panel")
	slot0.myguild_container = slot0.show_panel:getChildByName("myguild_container")
	slot0.enemyguild_container = slot0.show_panel:getChildByName("enemyguild_container")
	slot0.rank_container = slot0.show_panel:getChildByName("rank_container")
	slot0.title_container = slot0.show_panel:getChildByName("title_container")
	slot0.buff_container = slot0.show_panel:getChildByName("buff_container")

	slot0.top_panel:getChildByName("title_label"):setString(TI18N("公会战"))

	slot0.battle_list_btn = slot0.show_panel:getChildByName("battle_list_btn")
	slot0.battle_list_btn_label = slot0.battle_list_btn:getChildByName("label")

	slot0.battle_list_btn_label:setString(TI18N("对阵列表"))

	slot0.attk_check_btn = slot0.show_panel:getChildByName("attk_check_btn")
	slot0.attk_check_btn_label = slot0.attk_check_btn:getChildByName("label")

	slot0.attk_check_btn_label:setString(TI18N("进攻一览"))

	slot0.ally_atk_btn = slot0.show_panel:getChildByName("ally_atk_btn")
	slot0.ally_atk_btn_label = slot0.ally_atk_btn:getChildByName("label")

	slot0.ally_atk_btn_label:setString(TI18N("进攻日志"))

	slot0.look_award_btn = slot0.show_panel:getChildByName("look_award_btn")
	slot0.look_award_btn_label = slot0.look_award_btn:getChildByName("label")

	slot0.look_award_btn_label:setString(TI18N("玩法奖励"))
	slot0.buff_container:getChildByName("tips_label_1"):setString(TI18N("挑战据点废墟可激活或提升全公会增益"))

	slot0.change_scene_btn = slot0.show_panel:getChildByName("change_scene_btn")
	slot0.change_scene_btn_label = slot0.change_scene_btn:getChildByName("label")

	slot0.change_scene_btn_label:setString(TI18N("敌方阵地"))

	slot0.award_box_btn = slot0.show_panel:getChildByName("award_box_btn")

	slot0.award_box_btn:getChildByName("label"):setString(TI18N("战果宝箱"))

	slot0.clash_list_btn = slot0.state_panel:getChildByName("clash_list_btn")

	slot0.clash_list_btn:setTitleText(TI18N("对阵列表"))

	slot0.clash_list_btn_label = slot0.clash_list_btn:getTitleRenderer()

	if slot0.clash_list_btn_label ~= nil then
		slot0.clash_list_btn_label:enableOutline(Config.ColorData.data_color4[263], 2)
	end

	slot0.look_box_btn = slot0.state_panel:getChildByName("look_box_btn")

	slot0.look_box_btn:getChildByName("label"):setString(TI18N("战果宝箱"))
	slot0.rank_container:getChildByName("rank_desc_label"):setString(TI18N("战绩排行榜"))

	slot0.rank_btn = slot0.rank_container:getChildByName("rank_btn")
	slot0.close_btn = slot0.top_panel:getChildByName("close_btn")
	slot0.explain_btn = slot0.top_panel:getChildByName("explain_btn")
	slot0.time_label = slot0.title_container:getChildByName("time_label")
	slot0.challenge_label = slot0.title_container:getChildByName("challenge_label")
	slot0.state_tips_label = slot0.state_panel:getChildByName("state_tips_label")
	slot0.buff_lv_label = slot0.buff_container:getChildByName("buff_lv_label")
	slot0.buff_icon = slot0.buff_container:getChildByName("buff_icon")
	slot0.my_guild_name_label = slot0.myguild_container:getChildByName("guild_name_label_1")
	slot0.my_guild_star_label = slot0.myguild_container:getChildByName("star_label_1")
	slot0.my_guild_win = slot0.myguild_container:getChildByName("image_win_1")
	slot0.my_guild_dogfall = slot0.myguild_container:getChildByName("image_dogfall_1")
	slot0.enemy_guild_name_label = slot0.enemyguild_container:getChildByName("guild_name_label_2")
	slot0.enemy_guild_star_label = slot0.enemyguild_container:getChildByName("star_label_2")
	slot0.enemy_guild_win = slot0.enemyguild_container:getChildByName("image_win_2")
	slot0.enemy_guild_dogfall = slot0.enemyguild_container:getChildByName("image_dogfall_2")

	slot0:adjustPanlePosition()

	slot0.map_size = cc.size(720, 7680)

	slot0.map_layer:setContentSize(slot0.map_size)
	slot0.map_layer:setPosition(cc.p(slot0.map_layer_posX, slot0.free_size.height - slot0.map_size.height + slot0.map_layer_posY))
	slot0:addMapImage()
end

function GuildwarMainWindow.adjustPanlePosition(slot0)
	slot1 = display.getTop()
	slot0.free_size = cc.size(SCREEN_WIDTH, MainuiController:getInstance():getMainUi():getFreeSize())
	slot0.main_container_size = slot0.main_container:getContentSize()
	slot4 = math.abs(display.getBottom(slot0.main_container))
	slot5 = display.getLeft(slot0.main_container)
	slot6 = display.getRight(slot0.main_container) - slot0.main_container_size.width
	slot7, slot8 = slot0.map_layer:getPosition()
	slot0.map_scalex = display.getScale()
	slot0.map_layer_posX = slot7 + slot5
	slot0.map_layer_posY = slot8 - slot4

	slot0.map_layer:setPosition(cc.p(slot0.map_layer_posX, slot0.map_layer_posY))
	slot0.map_layer:setScaleX(slot0.map_scalex)

	slot9 = display.getTop(slot0.main_container) - MainuiController:getInstance():getMainUi():getTopViewHeight() - 30
	slot10 = slot9 - slot0.top_panel:getPositionY()

	slot0.top_panel:setPositionY(slot9)
	slot0.title_container:setPositionY(slot0.title_container:getPositionY() + slot10)
	slot0.state_panel:setContentSize(cc.size(slot0.free_size.width, display.height))
	slot0.state_tips_label:setPosition(cc.p(slot0.free_size.width / 2, display.height / 2 + 20))
	slot0.clash_list_btn:setPosition(cc.p(slot0.free_size.width / 2, display.height / 2 - 60))
	slot0.look_box_btn:setPositionY(slot9 - 117)
	slot0.myguild_container:setPosition(cc.p(slot0.myguild_container:getPositionX() + slot5, slot0.myguild_container:getPositionY() + slot10))
	slot0.enemyguild_container:setPosition(cc.p(slot0.enemyguild_container:getPositionX() + slot6, slot0.enemyguild_container:getPositionY() + slot10))
	slot0.rank_container:setPosition(cc.p(slot0.rank_container:getPositionX() + slot5, slot0.rank_container:getPositionY() + slot10))
	slot0.buff_container:setPosition(cc.p(slot0.buff_container:getPositionX() + slot5, slot0.buff_container:getPositionY() - slot4))
	slot0.ally_atk_btn:setPosition(cc.p(slot0.ally_atk_btn:getPositionX() + slot5, slot0.ally_atk_btn:getPositionY() + slot10))
	slot0.look_award_btn:setPosition(cc.p(slot0.look_award_btn:getPositionX() + slot5, slot0.look_award_btn:getPositionY() + slot10))
	slot0.award_box_btn:setPosition(cc.p(slot0.award_box_btn:getPositionX() + slot5, slot0.award_box_btn:getPositionY() + slot10))
	slot0.change_scene_btn:setPosition(cc.p(slot0.change_scene_btn:getPositionX() + slot6, slot0.change_scene_btn:getPositionY() - slot4))
	slot0.battle_list_btn:setPosition(cc.p(slot0.battle_list_btn:getPositionX() + slot6, slot0.battle_list_btn:getPositionY() + slot10))
	slot0.attk_check_btn:setPosition(cc.p(slot0.attk_check_btn:getPositionX() + slot6, slot0.attk_check_btn:getPositionY() + slot10))
end

function GuildwarMainWindow.openRootWnd(slot0)
	slot0:refreshGuildWarStatus()
	slot0:updateMainRedStatus()

	if uv0:getGuildWarEnemyFlag() == TRUE and GuildwarConst.status.showing < uv0:getGuildWarStatus() and not uv0:checkIsHaveEnemyCacheData() then
		uv1:requestGuildWarData()
	else
		slot0:refreshGuildWarPosition()
		slot0:refreshStarAndBuffInfo()
		slot0:refreshTopThreeRank()
		slot0:refreshChallengeCount()
	end
end

function GuildwarMainWindow.refreshGuildWarStatus(slot0)
	slot2 = false
	slot3 = ""

	slot0.clash_list_btn:setVisible(false)

	slot4 = uv0:getGuildWarEnemyFlag()

	if uv0:getGuildWarStatus() == GuildwarConst.status.close then
		slot2 = true
		slot3 = TI18N("公会战暂未开始，请在每周一、周三、周五12:00-20:00准时参加哦！（ﾟ∀ﾟ）つ")

		for slot8 = #slot0.position_stack, 1, -1 do
			slot9 = table.remove(slot0.position_stack, slot8)

			slot9:setVisible(false)
			slot9:suspendAllActions()
			table.insert(slot0.position_pool, slot9)

			slot0.position_pos[slot9:getPositionPos()] = nil
		end
	elseif slot1 == GuildwarConst.status.matching then
		slot2 = true
		slot3 = TI18N("正在匹配，请耐心等待")
	elseif slot1 == GuildwarConst.status.showing then
		slot3 = (slot4 ~= TRUE or TI18N("公会战暂未开始，请在每周一、周三、周五12:00-20:00准时参加哦！（ﾟ∀ﾟ）つ")) and TI18N("很遗憾，您的公会在此次公会战中匹配轮空或活跃人数未达标，请期待下次！(つд∩)")

		slot0.clash_list_btn:setVisible(true)

		slot2 = true
	elseif slot1 == GuildwarConst.status.processing then
		if slot4 == TRUE then
			slot2 = false
		else
			slot3 = TI18N("很遗憾，您的公会在此次公会战中匹配轮空或活跃人数未达标，请期待下次！(つд∩)")
			slot2 = true

			slot0.clash_list_btn:setVisible(true)
		end
	elseif slot1 == GuildwarConst.status.settlement then
		if slot4 == TRUE then
			slot2 = false
		else
			slot3 = TI18N("很遗憾，您的公会在此次公会战中匹配轮空或活跃人数未达标，请期待下次！(つд∩)")
			slot2 = true

			slot0.clash_list_btn:setVisible(true)
		end
	end

	slot0.guildwar_status = slot1

	if slot2 then
		slot0.state_tips_label:setString(slot3)
	end

	slot0.show_panel:setVisible(not slot2)
	slot0.state_panel:setVisible(slot2)
	slot0:refreshSurplusTime()
	slot0:refreshChallengeCount()
end

function GuildwarMainWindow.addMapImage(slot0)
	for slot4 = 1, 3 do
		slot6 = createSprite(PathTool.getPlistImgForDownLoad("bigbg/guildwar", "guildwar_1"), 0, (6 - slot4) * 1280, slot0.map_layer, cc.p(0, 0), LOADTEXT_TYPE)

		slot6:setScaleX(slot0.map_scalex)
		table.insert(slot0.map_bgs, slot6)
	end

	slot0:dynamicAddMapImage()
end

function GuildwarMainWindow.getTopOrBottomMapBgPosY(slot0, slot1)
	for slot6, slot7 in pairs(slot0.map_bgs) do
		if slot1 == 1 and (nil or slot7:getPositionY()) < slot8 then
			slot2 = slot8
		elseif slot1 == 2 and slot8 < slot2 then
			slot2 = slot8
		end
	end

	return slot2
end

function GuildwarMainWindow.dynamicAddMapImage(slot0)
	for slot6, slot7 in pairs(slot0.map_bgs) do
		if slot7:getPositionY() + 200 < math.abs(slot0.map_layer:getPositionY()) - 1280 then
			slot7:setPositionY(slot0:getTopOrBottomMapBgPosY(1) + 1280)
		elseif slot8 - slot2 > slot1 + 1280 then
			slot7:setPositionY(slot0:getTopOrBottomMapBgPosY(2) - 1280)
		end
	end
end

function GuildwarMainWindow.moveMapLayer(slot0, slot1, slot2)
	slot3 = slot0:checkMapLayerPoint(slot0.map_layer:getPositionX() + slot1, slot0.map_layer:getPositionY() + slot2)

	if slot0.bottom_position_pos_y and slot3.y <= -(slot0.bottom_position_pos_y - 300) then
		slot0.map_layer:setPosition(slot3.x, slot3.y)

		return true
	else
		return false
	end
end

function GuildwarMainWindow.checkMapLayerPoint(slot0, slot1, slot2)
	if slot0.map_layer_posX < cc.p(slot1, slot2).x then
		slot3.x = slot0.map_layer_posX
	elseif slot3.x < slot0.free_size.width - slot0.map_size.width + slot0.map_layer_posX then
		slot3.x = slot0.free_size.width - slot0.map_size.width + slot0.map_layer_posX
	end

	if slot3.y < slot0.free_size.height - slot0.map_size.height + slot0.map_layer_posY then
		slot3.y = slot0.free_size.height - slot0.map_size.height + slot0.map_layer_posY
	elseif slot0.map_layer_posY <= slot3.y then
		slot3.y = slot0.map_layer_posY
	end

	return slot3
end

function GuildwarMainWindow.refreshSurplusTime(slot0)
	slot0.surplusTime = uv0:getGuildWarSurplusTime()

	if slot0.surplusTime < 0 then
		slot0.surplusTime = 0
	end

	slot0.time_label:setString(TimeTool.GetTimeFormatDayIIIIIIII(slot0.surplusTime))
	slot0:openGuildWarSurplusTimer(true)
end

function GuildwarMainWindow.openGuildWarSurplusTimer(slot0, slot1)
	if slot1 == true then
		if slot0.guildwar_timer == nil then
			slot0.guildwar_timer = GlobalTimeTicket:getInstance():add(function ()
				uv0.surplusTime = uv0.surplusTime - 1

				if uv0.surplusTime >= 0 then
					uv0.time_label:setString(TimeTool.GetTimeFormatDayIIIIIIII(uv0.surplusTime))
				else
					uv0.surplusTime = 0

					GlobalTimeTicket:getInstance():remove(uv0.guildwar_timer)

					uv0.guildwar_timer = nil
				end
			end, 1)
		end
	elseif slot0.guildwar_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.guildwar_timer)

		slot0.guildwar_timer = nil
	end
end

function GuildwarMainWindow.refreshChallengeCount(slot0)
	if slot0.guildwar_status == GuildwarConst.status.settlement then
		slot0.challenge_label:setString(TI18N("后关闭"))
	else
		slot2 = Config.GuildWarData.data_const.challange_time_limit.val

		slot0.challenge_label:setString(string.format(TI18N("挑战次数:%d/%d"), slot2 - uv0:getGuildWarChallengeCount(), slot2))
	end
end

function GuildwarMainWindow.refreshStarAndBuffInfo(slot0)
	slot0.my_guild_name_label:setString(uv0:getMyGuildWarBaseInfo().gname or "")
	slot0.my_guild_star_label:setString(slot1.hp or 0)
	slot0.buff_lv_label:setString(string.format(TI18N("%d/%d级"), slot1.buff_lev or 0, Config.GuildWarData.data_buff_length))
	slot0.enemy_guild_name_label:setString(uv0:getEnemyGuildWarBaseInfo().gname or "")
	slot0.enemy_guild_star_label:setString(slot4.hp or 0)
	slot0.my_guild_win:setVisible(uv0:getGuildWarResult() == GuildwarConst.result.win)
	slot0.my_guild_dogfall:setVisible(slot5 == GuildwarConst.result.dogfall)
	slot0.enemy_guild_win:setVisible(slot5 == GuildwarConst.result.lose)
	slot0.enemy_guild_dogfall:setVisible(slot5 == GuildwarConst.result.dogfall)
end

function GuildwarMainWindow.refreshTopThreeRank(slot0)
	if uv0:getGuildWarTopThreeRank() == nil or next(slot1) == nil then
		return
	end

	for slot5, slot6 in ipairs(slot1) do
		if not slot0.top3_item_list[slot6.rank] then
			slot7 = slot0:createSingleRankItem(slot6.rank)

			slot0.rank_container:addChild(slot7)

			slot0.top3_item_list[slot6.rank] = slot7
		end

		if slot0.top3_item_list[slot6.rank] then
			slot7:setPosition(-10, 150 - (slot6.rank - 1) * slot7:getContentSize().height)
			slot7.label:setString(slot6.name)
		end
	end
end

function GuildwarMainWindow.createSingleRankItem(slot0, slot1)
	slot2 = ccui.Layout:create()

	slot2:setAnchorPoint(cc.p(0, 1))
	slot2:setContentSize(cc.size(180, 40))

	slot3 = createSprite(PathTool.getResFrame("common", "common_300" .. slot1), 30, 20, slot2)

	slot3:setScale(0.5)

	slot2.sp = slot3
	slot4 = createLabel(20, 1, nil, 60, 18, "", slot2)

	slot4:setAnchorPoint(cc.p(0, 0.5))
	slot4:setTextColor(cc.c4b(137, 237, 255, 255))

	slot2.label = slot4

	return slot2
end

function GuildwarMainWindow.refreshGuildWarPosition(slot0)
	slot0.position_vo_data = {}

	if slot0.guildwar_status == GuildwarConst.status.processing or slot0.guildwar_status == GuildwarConst.status.settlement then
		if slot0.cur_position_type == GuildwarConst.positions.myself then
			slot0.position_vo_data = uv0:getMyGuildWarPositionList()
		elseif slot0.cur_position_type == GuildwarConst.positions.others then
			slot0.position_vo_data = uv0:getEnemyGuildWarPositionList()
		end
	end

	slot0.bottom_position_pos_y = 0

	for slot4, slot5 in pairs(slot0.position_vo_data) do
		slot6 = Config.GuildWarData.data_position[slot5.pos]

		if slot0.bottom_position_pos_y == 0 or slot6.pos_y < slot0.bottom_position_pos_y then
			slot0.bottom_position_pos_y = slot6.pos_y
		end
	end

	slot0:dynamicShowGuildWarPosition()
end

function GuildwarMainWindow.dynamicShowGuildWarPosition(slot0)
	slot0:checkPositionMoveToPool()

	for slot4, slot5 in pairs(slot0.position_vo_data) do
		if Config.GuildWarData.data_position[slot5.pos] and not slot0.position_pos[slot5.pos] and slot0:checkPositionIsInDisplayRect(slot6.pos_x, slot6.pos_y) then
			if table.remove(slot0.position_pool, 1) == nil then
				slot0.map_layer:addChild(GuildwarPositionItem.new(), 10)
			end

			slot7:setVisible(true)
			slot7:setData(slot5, slot0.cur_position_type)
			slot7:setPosition(cc.p(slot6.pos_x, slot6.pos_y))
			table.insert(slot0.position_stack, slot7)

			slot0.position_pos[slot5.pos] = true
		end
	end
end

function GuildwarMainWindow.checkPositionMoveToPool(slot0)
	for slot4 = #slot0.position_stack, 1, -1 do
		slot6, slot7 = slot0.position_stack[slot4]:getPosition()

		if not slot0:checkPositionIsInDisplayRect(slot6, slot7) then
			slot5:setVisible(false)
			slot5:suspendAllActions()
			table.insert(slot0.position_pool, slot5)
			table.remove(slot0.position_stack, slot4)

			slot0.position_pos[slot5:getPositionPos()] = nil
		end
	end
end

function GuildwarMainWindow.checkPositionIsInDisplayRect(slot0, slot1, slot2)
	slot3 = true
	slot6, slot7 = slot0.map_layer:getPosition()
	slot7 = math.abs(slot7)

	if math.abs(slot6) > slot1 + GuildwarPositionItem.Width / 2 or slot1 - slot4 / 2 > slot6 + slot0.free_size.width or slot7 > slot2 + GuildwarPositionItem.Height or slot2 > slot7 + display.height then
		slot3 = false
	end

	return slot3
end

function GuildwarMainWindow.changeGuildwarPositionType(slot0)
	slot4 = cc.p

	slot0.map_layer:setPosition(slot4(slot0.map_layer_posX, slot0.free_size.height - slot0.map_size.height + slot0.map_layer_posY))

	for slot4 = 1, 3 do
		if slot0.map_bgs[slot4] then
			slot6:setPosition(cc.p(0, (6 - slot4) * 1280))
		end
	end

	for slot4 = #slot0.position_stack, 1, -1 do
		slot5 = table.remove(slot0.position_stack, slot4)

		slot5:setVisible(false)
		slot5:suspendAllActions()
		table.insert(slot0.position_pool, slot5)

		slot0.position_pos[slot5:getPositionPos()] = nil
	end

	if slot0.cur_position_type == GuildwarConst.positions.myself then
		slot0.cur_position_type = GuildwarConst.positions.others

		slot0:refreshGuildWarPosition()
		slot0.change_scene_btn_label:setString(TI18N("敌方阵地"))
	else
		slot0.cur_position_type = GuildwarConst.positions.myself

		slot0.change_scene_btn_label:setString(TI18N("我方阵地"))

		if next(uv0:getMyGuildWarPositionList()) == nil then
			uv1:requestMyGuildPositionData()
		else
			slot0:refreshGuildWarPosition()
		end
	end
end

function GuildwarMainWindow.register_event(slot0)
	if slot0.guildwar_status_event == nil then
		slot0.guildwar_status_event = GlobalEvent:getInstance():Bind(GuildwarEvent.UpdateGuildWarStatusEvent, function (slot0, slot1)
			if uv0.guildwar_status <= 3 and slot0 > 3 and slot1 == TRUE then
				uv1:requestGuildWarData()
			end

			if slot0 <= 3 then
				uv1:openAttkLookWindow(false)
				uv1:openAttkPositionWindow(false)
				uv1:openGuildWarAwardWindow(false)
				uv1:openBattleLogWindow(false)
				uv1:openDefendLookWindow(false)
				uv1:openGuildWarRankView(false)
			end

			uv0:refreshGuildWarStatus()
		end)
	end

	if slot0.guildwar_enemy_init_event == nil then
		slot0.guildwar_enemy_init_event = GlobalEvent:getInstance():Bind(GuildwarEvent.GuildWarEnemyPositionDataInitEvent, function ()
			uv0:refreshChallengeCount()
			uv0:refreshStarAndBuffInfo()
			uv0:refreshTopThreeRank()
			uv0:refreshGuildWarPosition()
		end)
	end

	if slot0.guildwar_count_event == nil then
		slot0.guildwar_count_event = GlobalEvent:getInstance():Bind(GuildwarEvent.UpdateGuildwarChallengeCountEvent, function ()
			uv0:refreshChallengeCount()
		end)
	end

	if slot0.guildwar_baseinfo_event == nil then
		slot0.guildwar_baseinfo_event = GlobalEvent:getInstance():Bind(GuildwarEvent.UpdateGuildWarBaseInfoEvent, function ()
			uv0:refreshTopThreeRank()
			uv0:refreshStarAndBuffInfo()
		end)
	end

	if slot0.guildwar_myposition_event == nil then
		slot0.guildwar_myposition_event = GlobalEvent:getInstance():Bind(GuildwarEvent.GetGuildWarMyPositionDataEvent, function ()
			uv0:refreshGuildWarPosition()
		end)
	end

	if slot0.update_red_status_event == nil then
		slot0.update_red_status_event = GlobalEvent:getInstance():Bind(GuildwarEvent.UpdateGuildWarRedStatusEvent, function (slot0, slot1)
			uv0:updateMainRedStatus(slot0, slot1)
		end)
	end

	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openMainWindow(false)
		end
	end)
	slot0.explain_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			MainuiController:getInstance():openCommonExplainView(true, Config.GuildWarData.data_explain)
		end
	end)

	slot4 = cc.EventListenerTouchOneByOne:create()

	slot4:registerScriptHandler(function (slot0, slot1)
		uv0.last_point = nil
		uv0.is_move_map_layer = true

		return true
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot4:registerScriptHandler(function (slot0, slot1)
		uv0.last_point = slot0:getDelta()

		if uv0:moveMapLayer(uv0.last_point.x, uv0.last_point.y) then
			uv0:dynamicShowGuildWarPosition()
			uv0:dynamicAddMapImage()
		end
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot4:registerScriptHandler(function (slot0, slot1)
		uv0.is_move_map_layer = false
	end, cc.Handler.EVENT_TOUCH_ENDED)
	slot0.map_layer:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot4, slot0.map_layer)
	slot0.attk_check_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openAttkLookWindow(true)
		end
	end)
	slot0.battle_list_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openBattleListWindow(true)
		end
	end)
	slot0.clash_list_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openBattleListWindow(true)
			uv1:updateGuildWarRedStatus(GuildConst.red_index.guildwar_match, false)
		end
	end)
	slot0.ally_atk_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openBattleLogWindow(true)
			uv1:updateGuildWarRedStatus(GuildConst.red_index.guildwar_log, false)
		end
	end)
	slot0.look_award_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openGuildWarAwardWindow(true)
		end
	end)
	slot0.rank_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openGuildWarRankView(true)
		end
	end)
	slot0.change_scene_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:changeGuildwarPositionType()
		end
	end)
	registerButtonEventListener(slot0.award_box_btn, function ()
		uv0:openAwardBoxWindow(true)
	end, true)
	registerButtonEventListener(slot0.look_box_btn, function ()
		uv0:openAwardBoxWindow(true)
	end, true)
end

function GuildwarMainWindow.updateMainRedStatus(slot0, slot1, slot2)
	if slot1 == GuildConst.red_index.guildwar_match then
		addRedPointToNodeByStatus(slot0.clash_list_btn, slot2, -5, -5)
	elseif slot1 == GuildConst.red_index.guildwar_log then
		addRedPointToNodeByStatus(slot0.ally_atk_btn, slot2, -5, -5)
	elseif slot1 == GuildConst.red_index.guildwar_box then
		addRedPointToNodeByStatus(slot0.award_box_btn, slot2, -5, -5)
		addRedPointToNodeByStatus(slot0.look_box_btn, slot2, -5, -5)
	else
		addRedPointToNodeByStatus(slot0.clash_list_btn, uv0:checkRedIsShowByRedType(GuildConst.red_index.guildwar_match), -5, -5)
		addRedPointToNodeByStatus(slot0.ally_atk_btn, uv0:checkRedIsShowByRedType(GuildConst.red_index.guildwar_log), -5, -5)

		slot5 = uv0:checkRedIsShowByRedType(GuildConst.red_index.guildwar_box)

		addRedPointToNodeByStatus(slot0.award_box_btn, slot5, -5, -5)
		addRedPointToNodeByStatus(slot0.look_box_btn, slot5, -5, -5)
	end
end

function GuildwarMainWindow.close_callback(slot0)
	slot4 = false

	slot0:openGuildWarSurplusTimer(slot4)

	for slot4, slot5 in pairs(slot0.position_stack) do
		slot5:DeleteMe()
	end

	for slot4, slot5 in pairs(slot0.position_pool) do
		slot5:DeleteMe()
	end

	if slot0.guildwar_status_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.guildwar_status_event)

		slot0.guildwar_status_event = nil
	end

	if slot0.guildwar_enemy_init_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.guildwar_enemy_init_event)

		slot0.guildwar_enemy_init_event = nil
	end

	if slot0.guildwar_baseinfo_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.guildwar_baseinfo_event)

		slot0.guildwar_baseinfo_event = nil
	end

	if slot0.guildwar_myposition_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.guildwar_myposition_event)

		slot0.guildwar_myposition_event = nil
	end

	if slot0.update_red_status_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_red_status_event)

		slot0.update_red_status_event = nil
	end

	if slot0.guildwar_count_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.guildwar_count_event)

		slot0.guildwar_count_event = nil
	end

	uv0:openMainWindow(false)
end
