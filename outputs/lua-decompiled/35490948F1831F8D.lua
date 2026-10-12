ArenaLoopChallengePanel = class("ArenaLoopChallengePanel", function ()
	return ccui.Layout:create()
end)
slot0 = ArenaController:getInstance()
slot1 = ArenaController:getInstance():getModel()
slot2 = GameNet:getInstance()
slot3 = string.format
slot4 = RoleController:getInstance():getRoleVo()
slot5 = Config.ArenaData.data_season_num_reward
slot6 = Config.ArenaData.data_season_num_reward_length

function ArenaLoopChallengePanel.ctor(slot0)
	slot0.refresh_status = 0
	slot0.free_num = 0
	slot0.has_num = 0
	slot0.had_combat_num = 0
	slot0.play_effect = {}
	slot0.bool_box_status = {}
	slot0.arena_skip_count = Config.ArenaData.data_const.arena_skip_count.val
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/arena_loop_challenge_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)
	slot0.root_wnd:getChildByName("add_times_bg_0"):setVisible(false)

	slot0.protect_btn = slot0.root_wnd:getChildByName("protect_btn")

	slot0.protect_btn:getChildByName("label"):setString("防守阵容")

	slot0.refresh_btn = slot0.root_wnd:getChildByName("refresh_btn")
	slot0.refresh_label = slot0.refresh_btn:getChildByName("label")

	slot0.refresh_label:setString(TI18N("刷新"))
	UITool.SetTitleColor(slot0.refresh_label)

	if not slot0.banner_load_botton then
		slot0.banner_load_botton = loadSpriteTextureFromCDN(slot0.root_wnd:getChildByName("Sprite_8"), PathTool.getPlistImgForDownLoad("bigbg", "bigbg_4"), ResourcesType.single, slot0.banner_load_botton)
	end

	slot0.addtimes_btn = slot0.root_wnd:getChildByName("addtimes_btn")
	slot3 = slot0.root_wnd:getChildByName("add_times_bg")
	slot0.add_times_sprite = slot0.root_wnd:getChildByName("add_times_sprite")

	slot0.add_times_sprite:setScale(0.5)

	slot0.text_add_time = slot0.root_wnd:getChildByName("text_add_time")
	slot0.my_log_btn = slot0.root_wnd:getChildByName("my_log_btn")

	slot0.my_log_btn:getChildByName("label"):setString(TI18N("挑战记录"))

	slot0.my_log_tips = slot0.my_log_btn:getChildByName("tips")
	slot0.challenge_shop = slot0.root_wnd:getChildByName("challenge_shop")

	slot0.challenge_shop:getChildByName("label"):setString(TI18N("竞技商城"))

	slot4 = slot0.root_wnd:getChildByName("score_container")

	slot4:getChildByName("title"):setString(TI18N("积分："))

	slot0.my_score = slot4:getChildByName("score")
	slot0.rank = slot4:getChildByName("rank")
	slot0.time_label = slot4:getChildByName("time_label")

	slot4:getChildByName("time_label_0"):setString(TI18N("距离结束:"))
	slot0.time_label:setString(uv0("%s", "00:00:00"))

	slot5 = slot0.root_wnd:getChildByName("Sprite_6")

	UITool.SetTitleColor(slot5:getChildByName("Text_5"))
	slot5:getChildByName("Text_5"):setString(TI18N("每周宝箱"))

	slot0.change_num = slot5:getChildByName("change_num")

	slot0.change_num:setString("")
	UITool.SetDarkColor(slot0.change_num)

	slot0.btn_jump_fight = slot0.root_wnd:getChildByName("btn_jump_fight")
	slot0.check_jump_fight = slot0.btn_jump_fight:getChildByName("check_jump_fight")

	slot0.check_jump_fight:setVisible(true)

	slot6 = slot0.root_wnd:getChildByName("Text_1")
	slot12 = "跳过战斗"

	slot6:setString(TI18N(slot12))
	UITool.SetTitleColor(slot6)

	slot0.box_panel = slot0.root_wnd:getChildByName("box_panel")
	slot0.box_bar = slot0.box_panel:getChildByName("box_bar")

	slot0.box_bar:setScale9Enabled(true)

	slot0.box_list = {}
	slot0.box_get_num = {}

	for slot12 = 1, uv1 do
		slot0.box_list[slot12] = slot0.box_panel:getChildByName("box_" .. slot12)

		slot0.box_list[slot12]:setPositionX(slot0.box_panel:getChildByName("Image_2"):getContentSize().width / uv1 * slot12)

		slot13 = slot0.box_list[slot12]:getChildByName("num")

		slot13:setString(uv2[slot12].num)
		slot13:setTextColor(Config.ColorData.data_color4[175])

		slot0.box_get_num[slot12] = uv2[slot12].num
	end

	slot0.scroll_container = slot0.root_wnd:getChildByName("scroll_container")
	slot9 = slot0.scroll_container:getContentSize()
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.scroll_container, cc.p(0, 4), nil, nil, cc.size(slot9.width, slot9.height - 8), {
		start_y = 0,
		item_width = 614,
		start_x = 10,
		space_x = 0,
		row = 0,
		item_height = 132,
		space_y = 5,
		col = 1,
		item_class = ArenaLoopChallengeItem
	})

	slot0.scroll_view:setClickEnabled(false)
	slot0:registerEvent()
end

function ArenaLoopChallengePanel.registerEvent(slot0)
	registerButtonEventListener(slot0.refresh_btn, function ()
		uv0:requestRefreshChallengeList()
	end, true, 1)
	registerButtonEventListener(slot0.protect_btn, function ()
		HeroController:getInstance():openFormMainWindow(true, PartnerConst.Fun_Form.Arena)
	end, true, 1)
	registerButtonEventListener(slot0.addtimes_btn, function ()
		uv0:openArenaLoopChallengeBuy(true)
	end, true, 1)
	registerButtonEventListener(slot0.my_log_btn, function ()
		uv0:openArenaLoopMyLogWindow(true)
		uv1:updateArenaLoopLogStatus(FALSE)
	end, true, 1)

	function slot4()
		if uv0.cur_combat_num then
			if uv0.cur_combat_num < uv0.arena_skip_count then
				uv0.check_jump_fight:setVisible(false)
				message(string.format(TI18N("本赛季中挑战达%d次后可跳过战斗"), uv0.arena_skip_count))
			else
				if uv0.check_jump_fight:isVisible() == true then
					uv0.check_jump_fight:setVisible(false)
				else
					uv0.check_jump_fight:setVisible(true)
				end

				uv1:setJumpFightStatus(uv0.check_jump_fight:isVisible())
			end
		end
	end

	slot5 = true

	registerButtonEventListener(slot0.btn_jump_fight, slot4, slot5, 1)

	for slot4, slot5 in pairs(slot0.box_list) do
		registerButtonEventListener(slot5, function (slot0, slot1, slot2)
			if uv0.bool_box_status[uv1] == 1 then
				uv2:requestGetChallengeTimesAwards(uv3[uv1].num)
			else
				uv0:showRewardItems(uv3[uv1].items, slot1:getTouchBeganPosition(), uv1)
			end
		end, true, 1)
	end

	registerButtonEventListener(slot0.challenge_shop, function ()
		MallController:getInstance():openMallPanel(true, MallConst.MallType.ArenaShop)
	end, true, 1)

	if slot0.update_challenge_list == nil then
		slot0.update_challenge_list = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateLoopChallengeList, function ()
			uv0:updateChallengeList()
		end)
	end

	if slot0.update_challenge_num == nil then
		slot0.update_challenge_num = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateArena_Number, function ()
			uv0.has_num = uv0.has_num or 0

			loadSpriteTexture(uv0.add_times_sprite, PathTool.getItemRes(Config.ItemData.data_get_data(Config.ArenaData.data_const.arena_ticketcost.val[1][1]).icon), LOADTEXT_TYPE)
			uv0.text_add_time:setString(BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot0))
		end)
	end

	if slot0.update_challenge_time_num == nil then
		slot0.update_challenge_time_num = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateLoopChallengeTimesList, function (slot0)
			if not slot0 then
				return
			end

			uv0.cur_combat_num = slot0.had_combat_num

			if uv0.cur_combat_num < uv0.arena_skip_count then
				setChildUnEnabled(true, uv0.btn_jump_fight)
				uv0.check_jump_fight:setVisible(false)
			else
				setChildUnEnabled(false, uv0.btn_jump_fight)
				uv1:setJumpFightStatus(uv0.check_jump_fight:isVisible())
			end

			uv0.box_bar:setPercent(uv0:segmentBarPercent(slot0.had_combat_num))

			slot5 = uv2(TI18N("( 挑战%d次 )"), slot0.had_combat_num)

			uv0.change_num:setString(slot5)

			uv0.had_combat_num = slot0.had_combat_num

			for slot5, slot6 in pairs(uv3) do
				uv0.bool_box_status[slot5] = 0

				if slot6.num <= slot0.had_combat_num then
					uv0.bool_box_status[slot5] = 1

					for slot10, slot11 in pairs(slot0.num_list) do
						if slot11.num == slot6.num then
							uv0.bool_box_status[slot5] = 2
						end
					end
				end
			end

			uv0:updateTaskList(uv0.bool_box_status)
		end)
	end
end

function ArenaLoopChallengePanel.segmentBarPercent(slot0, slot1)
	slot3 = 1

	if slot1 <= uv0[1].num then
		return slot1 / uv0[1].num * 14.2
	elseif uv0[1].num < slot1 and slot1 <= uv0[2].num then
		slot3 = 2
	elseif uv0[2].num < slot1 and slot1 <= uv0[3].num then
		slot3 = 3
	elseif uv0[3].num < slot1 and slot1 <= uv0[4].num then
		slot3 = 4
	elseif uv0[4].num < slot1 and slot1 <= uv0[5].num then
		slot3 = 5
	elseif uv0[5].num < slot1 and slot1 <= uv0[6].num then
		slot3 = 6
	elseif uv0[6].num < slot1 and slot1 <= uv0[7].num then
		slot3 = 7
	else
		return 100
	end

	return slot2 * (slot3 - 1) + (slot1 - uv0[slot3 - 1].num) / (uv0[slot3].num - uv0[slot3 - 1].num) * slot2
end

function ArenaLoopChallengePanel.updateTaskList(slot0, slot1)
	for slot5 = 1, 7 do
		slot6 = PlayerAction.action_1

		if slot1[slot5] then
			if slot1[slot5] == 0 then
				slot6 = PlayerAction.action_1
			elseif slot1[slot5] == 1 then
				slot6 = PlayerAction.action_2
			elseif slot1[slot5] == 2 then
				slot6 = PlayerAction.action_3
			end
		end

		if slot0.play_effect[slot5] then
			slot0.play_effect[slot5]:clearTracks()
			slot0.play_effect[slot5]:removeFromParent()

			slot0.play_effect[slot5] = nil
		end

		if not tolua.isnull(slot0.box_list[slot5]) and slot0.play_effect[slot5] == nil then
			slot0.play_effect[slot5] = createEffectSpine(PathTool.getEffectRes(({
				109,
				109,
				108,
				108,
				110,
				110,
				110
			})[slot5]), cc.p(slot0.box_list[slot5]:getContentSize().width * 0.5, 15), cc.p(0, 0), true, slot6)

			slot0.box_list[slot5]:addChild(slot0.play_effect[slot5])
		end
	end
end

function ArenaLoopChallengePanel.showRewardItems(slot0, slot1, slot2, slot3)
	if not slot0.tips_layer then
		slot0.tips_layer = ccui.Layout:create()

		slot0.tips_layer:setContentSize(slot0.root_wnd:getContentSize())
		slot0.root_wnd:addChild(slot0.tips_layer)
		slot0.tips_layer:setTouchEnabled(true)
		registerButtonEventListener(slot0.tips_layer, function ()
			uv0.tips_bg:removeFromParent()

			uv0.tips_bg = nil

			uv0.tips_layer:removeFromParent()

			uv0.tips_layer = nil
		end, false, 1)
	end

	slot5 = {}

	if not slot0.tips_bg then
		slot0.tips_bg = createImage(slot0.tips_layer, PathTool.getResFrame("common", "common_1056"), slot4.width * 0.5, 100, cc.p(0, 0), true, 10, true)

		slot0.tips_bg:setTouchEnabled(true)
	end

	if slot0.tips_bg then
		slot0.tips_bg:setContentSize(cc.size(BackPackItem.Width * #slot1 + 50, BackPackItem.Height + 50))

		slot6 = cc.p(0.5, 0)

		if slot0.tips_bg:getContentSize().width + slot2.x >= 720 then
			slot6 = cc.p(1, 0)
		end

		slot0.tips_bg:setAnchorPoint(slot6)
		slot0.tips_bg:setPosition(slot0.box_list[slot3]:getPositionX(), 108)
	end

	for slot9, slot10 in pairs(slot1) do
		if not slot5[slot9] then
			slot5[slot9] = BackPackItem.new(nil, true, nil, 0.8)

			slot5[slot9]:setAnchorPoint(cc.p(0, 0.5))
			slot0.tips_bg:addChild(slot5[slot9])
			slot5[slot9]:setBaseData(slot10[1])
			slot5[slot9]:setPosition(cc.p(BackPackItem.Width * (slot9 - 1) + 30, 100))
			slot5[slot9]:setDefaultTip()

			slot0.text_num = createLabel(22, cc.c4b(255, 238, 221, 255), nil, 60, -25, "", slot5[slot9], nil, cc.p(0.5, 0.5))

			slot0.text_num:setString("x" .. slot10[2])
		else
			slot5[slot9]:setBaseData(slot10[1])
			slot5[slot9]:setPosition(cc.p(BackPackItem.Width * (slot9 - 1) + 30, 100))
			slot0.text_num:setString("x" .. slot10[2])
		end
	end
end

function ArenaLoopChallengePanel.addToParent(slot0)
	uv0:sender20208()
	uv0:requestChallengeList()
end

function ArenaLoopChallengePanel.setNodeVisible(slot0, slot1)
	slot0:setVisible(slot1)
	slot0:handleEvent(slot1)

	if slot1 == true then
		if slot0.tips_bg then
			slot0.tips_bg:removeFromParent()

			slot0.tips_bg = nil
		end

		if slot0.tips_layer then
			slot0.tips_layer:removeFromParent()

			slot0.tips_layer = nil
		end

		slot0:updateMyLogTips()
	end
end

function ArenaLoopChallengePanel.updateMyLogTips(slot0)
	if slot0.my_log_tips == nil then
		return
	end

	slot0.my_log_tips:setVisible(uv0:getLoopMatchRedStatus(ArenaConst.red_type.loop_log))
end

function ArenaLoopChallengePanel.handleEvent(slot0, slot1)
	if slot1 == true then
		if slot0.time_ticket == nil then
			slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0:countDownTimeTicket()
			end, 1)
		end

		slot0:countDownTimeTicket()
	elseif slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function ArenaLoopChallengePanel.countDownTimeTicket(slot0)
	if uv0:getMyLoopData() == nil then
		slot0:handleEvent(false)

		return
	end

	if slot1.end_time - uv1:getTime() >= 0 then
		slot0.time_label:setString(uv2("%s", TimeTool.GetTimeFormat(slot2)))
	end

	if slot1.ref_time - uv1:getTime() >= 0 then
		slot0.refresh_label:setString(uv2("%s", TimeTool.GetTimeFormat(slot3)))
	elseif slot0.refresh_status == 1 then
		slot0.refresh_status = 0

		setChildUnEnabled(false, slot0.refresh_btn)
		slot0.refresh_btn:setTouchEnabled(true)
		UITool.SetTitleColor(slot0.refresh_label)
		slot0.refresh_label:setString(TI18N("刷新"))
	end
end

function ArenaLoopChallengePanel.updatePanelInfo(slot0, slot1)
	if uv0:getMyLoopData() == nil then
		return
	end

	slot3, slot4 = uv0:getZoneConfig()

	slot0.my_score:setString(slot2.score)
	slot0.rank:setString(uv1(TI18N("排名: %s名"), slot2.rank))

	slot5 = Config.ArenaData.data_const.arena_ticketcost.val[1][1]
	slot7 = BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot5)
	slot0.has_num = slot2.can_combat_num + slot7
	slot0.free_num = slot2.can_combat_num

	loadSpriteTexture(slot0.add_times_sprite, PathTool.getItemRes(Config.ItemData.data_get_data(slot5).icon), LOADTEXT_TYPE)
	slot0.text_add_time:setString(slot7)
	slot0:updateChallengeList()

	if slot0.cup_index ~= slot3.index then
		slot0.cup_index = slot3.index
	end

	if slot2.ref_time - uv2:getTime() <= 0 then
		setChildUnEnabled(false, slot0.refresh_btn)
		slot0.refresh_btn:setTouchEnabled(true)
		UITool.SetTitleColor(slot0.refresh_label)
		slot0.refresh_label:setString(TI18N("刷新"))

		slot0.refresh_status = 0
	else
		slot0.refresh_label:setString(uv1("%s", TimeTool.GetTimeFormat(slot9)))
		setChildUnEnabled(true, slot0.refresh_btn)
		slot0.refresh_btn:setTouchEnabled(false)
		slot0.refresh_label:disableEffect()

		slot0.refresh_status = 1
	end
end

function ArenaLoopChallengePanel.updateChallengeList(slot0)
	if uv0:getLoopChallengeList() ~= nil and next(slot1) ~= nil then
		slot0.scroll_view:setData(slot1, nil, nil, {
			free_num = slot0.free_num,
			has_num = slot0.has_num
		})
	end
end

function ArenaLoopChallengePanel.DeleteMe(slot0)
	slot0:handleEvent(false)

	if slot0.update_challenge_list ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_challenge_list)

		slot0.update_challenge_list = nil
	end

	if slot0.update_challenge_time_num ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_challenge_time_num)

		slot0.update_challenge_time_num = nil
	end

	if slot0.update_challenge_num ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_challenge_num)

		slot0.update_challenge_num = nil
	end

	if slot0.play_effect and next(slot0.play_effect or {}) ~= nil then
		for slot4 = 1, 7 do
			if slot0.play_effect[slot4] then
				slot0.play_effect[slot4]:clearTracks()
				slot0.play_effect[slot4]:removeFromParent()

				slot0.play_effect[slot4] = nil
			end
		end
	end

	slot0.play_effect = {}

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	if slot0.banner_load_botton then
		slot0.banner_load_botton:DeleteMe()
	end

	slot0.banner_load_botton = nil
end

ArenaLoopChallengeItem = class("ArenaLoopChallengeItem", function ()
	return ccui.Layout:create()
end)

function ArenaLoopChallengeItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/arean_loop_challenge_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0.container:getChildByName("Image_1"):setVisible(false)

	slot0.role_name = slot0.container:getChildByName("role_name")
	slot0.role_name_x = slot0.role_name:getPositionX()
	slot0.role_power = slot0.container:getChildByName("role_power")
	slot0.role_score = slot0.container:getChildByName("role_score")
	slot0.role_score_0 = slot0.container:getChildByName("role_score_0")

	slot0.role_score_0:setString(TI18N("积分:"))

	slot0.same_guild = slot0.container:getChildByName("same_guild")

	if slot0.same_guild then
		slot0.same_guild:setString(TI18N("（同公会）"))
	end

	slot0.challenge_btn = slot0.container:getChildByName("challenge_btn")
	slot0.icon = slot0.challenge_btn:getChildByName("icon")

	slot0.icon:setScale(0.4)
	loadSpriteTexture(slot0.icon, PathTool.getItemRes(Config.ItemData.data_get_data(Config.ArenaData.data_const.arena_ticketcost.val[1][1]).icon), LOADTEXT_TYPE)

	slot0.challenge_btn_label = createRichLabel(24, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(slot0.challenge_btn:getContentSize().width * 0.5, slot0.challenge_btn:getContentSize().height * 0.5), nil, nil, 150)

	slot0.challenge_btn:addChild(slot0.challenge_btn_label)

	slot0.finish_img = slot0.container:getChildByName("finish_img")

	slot0.finish_img:setVisible(false)

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(74, slot0.size.height * 0.5)
	slot0.container:addChild(slot0.role_head)
	slot0:registerEvent()
end

function ArenaLoopChallengeItem.registerEvent(slot0)
	registerButtonEventListener(slot0.challenge_btn, function ()
		if uv0.data ~= nil then
			slot0 = 0

			if uv1:getJumpFightStatus() == true then
				slot0 = 1
			end

			uv2:requestFightWithLoopChallenge(uv0.data.rid, uv0.data.srv_id, slot0)
		end
	end, true, 1)
	slot0.role_head:addCallBack(function ()
		if uv0.data ~= nil then
			if uv0.data.score == 0 then
				message(TI18N("神秘高手不肯透露信息哦!"))
			else
				uv1:requestLoopChallengeRoleInfo(uv0.data.rid, uv0.data.srv_id)
			end
		end
	end, false)
end

function ArenaLoopChallengeItem.setExtendData(slot0, slot1)
	slot0.iten_has_num = slot1.has_num
	slot0.iten_free_num = slot1.free_num
end

function ArenaLoopChallengeItem.setData(slot0, slot1)
	slot2 = ""
	slot3 = BackpackController:getInstance():getModel():getBackPackItemNumByBid(Config.ArenaData.data_const.arena_ticketcost.val[1][1])

	if slot0.iten_free_num >= 1 then
		slot2 = uv0(TI18N("<div outline=2,#294A15>免费挑战</div>"))

		slot0.challenge_btn_label:setPositionX(slot0.challenge_btn:getContentSize().width * 0.5)
		slot0.icon:setVisible(false)
	else
		slot0.icon:setVisible(true)
		slot0.challenge_btn_label:setPositionX(77)

		slot2 = (slot3 < 1 or uv0(TI18N("<div outline=2,#294A15>1 挑战</div>"))) and uv0(TI18N("<div fontcolor=#ba3b3b fontsize=24> 1</div><div outline=2,#294A15> 挑战</div>"))
	end

	slot0.challenge_btn_label:setString(slot2)

	slot0.data = slot1

	if slot0.data ~= nil then
		slot0.role_name:setString(slot0.data.name)

		if slot0.data.power == 0 then
			slot0.role_power:setString("???")
		else
			slot0.role_power:setString(slot0.data.power)
		end

		if slot0.data.score == 0 then
			slot0.role_score:setString("???")
		else
			slot0.role_score:setString(slot0.data.score)
		end

		slot0.role_head:setHeadRes(slot0.data.face, false, LOADTEXT_TYPE, slot0.data.face_file, slot0.data.face_update_time)

		if slot0.data.lev == 0 then
			slot0.role_head:setLev("??")
		else
			slot0.role_head:setLev(slot0.data.lev)
		end

		slot0.finish_img:setVisible(slot0.data.status ~= 0)
		slot0.challenge_btn:setVisible(slot0.data.status == 0)
		slot0:changePowerColor()

		if slot0.same_guild then
			if uv1 and uv1.gid and uv1.gid ~= 0 and slot0.data.gid and uv1.gid == slot0.data.gid then
				slot0.same_guild:setVisible(true)
				slot0.same_guild:setPositionX(slot0.role_name_x + slot0.role_name:getContentSize().width + 5)
			else
				slot0.same_guild:setVisible(false)
			end
		end
	end

	slot0.challenge_btn:setTag(1000 + slot1.idx)
end

function ArenaLoopChallengeItem.changePowerColor(slot0)
	if uv0 == nil then
		return
	end

	if slot0.data == nil then
		return
	end

	if slot0.data.power > 1.2 * uv0.power then
		slot0.role_power:setTextColor(Config.ColorData.data_color4[11])
	else
		slot0.role_power:setTextColor(Config.ColorData.data_color4[180])
	end
end

function ArenaLoopChallengeItem.updateSelfInfo(slot0, slot1, slot2)
	if slot1 == "name" then
		slot0.role_name:setString(slot2)
	elseif slot1 == "score" then
		if slot2 == 0 then
			slot0.role_score:setString("???")
		else
			slot0.role_score:setString(slot2)
		end
	elseif slot1 == "power" then
		if slot2 == 0 then
			slot0.role_power:setString("???")
		else
			slot0.role_power:setString(slot2)
		end

		slot0:changePowerColor()
	elseif slot1 == "face" then
		slot0.role_head:setHeadRes(slot2)
	elseif slot1 == "lev" then
		if slot2 == 0 then
			slot2 = "??"
		end

		slot0.role_head:setLev(slot2)
	elseif slot1 == "status" then
		slot0.finish_img:setVisible(slot2 ~= 0)
		slot0.challenge_btn:setVisible(slot2 == 0)
	end
end

function ArenaLoopChallengeItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
