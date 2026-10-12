ArenateamMainWindow = ArenateamMainWindow or BaseClass(BaseView)
slot1 = ArenateamController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert
slot5 = math.ceil
slot6 = math.floor

function ArenateamMainWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arenateam", "arenateam"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/battle_bg/10032", "b_bg", true),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "arenateam/arenateam_main_window"
end

function ArenateamMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale() or 1)
	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/battle_bg/10032", "b_bg", true), LOADTEXT_TYPE)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.container_size = slot0.container:getContentSize()
	slot0.top_panel = slot0.container:getChildByName("top_panel")
	slot0.bottom_panel = slot0.container:getChildByName("bottom_panel")
	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.look_btn = slot0.top_panel:getChildByName("look_btn")
	slot0.panel_bg = slot0.top_panel:getChildByName("panel_bg")
	slot0.panel_bg_0 = slot0.top_panel:getChildByName("panel_bg_0")
	slot0.name = slot0.top_panel:getChildByName("name")

	slot0.name:setString(TI18N("排行榜"))
	slot0.name:setPositionY(55)

	slot0.lay_srollview = slot0.top_panel:getChildByName("lay_srollview")
	slot0.time_label = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(1, 0.5), cc.p(680, -555), nil, , 500)

	slot0.top_panel:addChild(slot0.time_label)

	slot0.shop_btn = slot0.top_panel:getChildByName("shop_btn")

	slot0.shop_btn:getChildByName("label"):setString(TI18N("商城"))

	slot0.rank_btn = slot0.top_panel:getChildByName("rank_btn")

	slot0.rank_btn:getChildByName("label"):setString(TI18N("排行奖励"))

	slot0.report_btn = slot0.bottom_panel:getChildByName("report_btn")

	slot0.report_btn:getChildByName("label"):setString(TI18N("战报"))

	slot0.form_btn = slot0.bottom_panel:getChildByName("form_btn")

	slot0.form_btn:getChildByName("label"):setString(TI18N("布阵"))

	slot0.fight_btn = slot0.bottom_panel:getChildByName("fight_btn")

	slot0.fight_btn:setVisible(false)

	slot0.fight_btn_icon = slot0.fight_btn:getChildByName("Sprite_1")
	slot0.fight_btn_label = slot0.fight_btn:getChildByName("label")

	slot0.fight_btn_label:setString(TI18N("组队大厅"))

	slot0.reward_btn = slot0.bottom_panel:getChildByName("reward_btn")

	slot0.reward_btn:getChildByName("label"):setString(TI18N("挑战奖励"))

	slot0.reward_count = slot0.reward_btn:getChildByName("count")
	slot0.spine = slot0.reward_btn:getChildByName("spine")
	slot0.reward_box = createEffectSpine(PathTool.getEffectRes(110), cc.p(0, -20), cc.p(0.5, 0.5), true, PlayerAction.action_1)

	slot0.spine:addChild(slot0.reward_box)

	slot0.change_count = slot0.bottom_panel:getChildByName("change_count")

	slot0.change_count:setString(TI18N("挑战次数: 0"))

	slot0.resume_count = createRichLabel(20, cc.c4b(255, 248, 191, 255), cc.p(0.5, 0.5), cc.p(612, 125), nil, , 500)

	slot0.bottom_panel:addChild(slot0.resume_count)

	slot0.open_tips = slot0.bottom_panel:getChildByName("open_tips")

	slot0.open_tips:setString(TI18N("暂未开启组队"))

	slot0.open_tips_time = createRichLabel(22, cc.c4b(149, 83, 34, 255), cc.p(0.5, 0.5), cc.p(360, 347), nil, , 1000)

	slot0.bottom_panel:addChild(slot0.open_tips_time)

	slot0.line = slot0.bottom_panel:getChildByName("line")
	slot0.my_team_name = slot0.bottom_panel:getChildByName("my_team_name")

	slot0.my_team_name:setString(TI18N("队伍名字"))

	slot0.team_info = slot0.bottom_panel:getChildByName("team_info")

	slot0.team_info:setVisible(false)

	slot0.chat_btn = slot0.team_info:getChildByName("chat_btn")

	slot0.chat_btn:getChildByName("label"):setString(TI18N("组队聊天"))

	slot0.my_team_index = slot0.team_info:getChildByName("my_team_index")
	slot0.my_team_score = slot0.team_info:getChildByName("my_team_score")

	slot0.my_team_score:setString(TI18N("积分:  0"))

	slot0.power = slot0.team_info:getChildByName("power")
	slot0.head_list = {}

	for slot6 = 1, 3 do
		slot0.head_list[slot6] = PlayerHead.new(PlayerHead.type.circle)

		slot0.head_list[slot6]:setHeadLayerScale(0.9)
		slot0.head_list[slot6]:setPosition(188 + 100 * (slot6 - 1), 56)
		slot0.head_list[slot6]:setLev(99)
		slot0.team_info:addChild(slot0.head_list[slot6])
	end

	slot0:adaptationScreen()
end

function ArenateamMainWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.container)
	slot2 = display.getBottom(slot0.container)
	slot3 = display.getLeft(slot0.container)
	slot4 = display.getRight(slot0.container)

	slot0.top_panel:setPositionY(slot1 - (slot0.container_size.height - slot0.top_panel:getPositionY()))
	slot0.bottom_panel:setPositionY(slot2 + slot0.bottom_panel:getPositionY())
	slot0.close_btn:setPositionY(slot2 + slot0.close_btn:getPositionY())

	slot8 = slot1 - slot0.container_size.height - slot2
	slot9 = slot0.panel_bg:getContentSize()

	slot0.panel_bg:setContentSize(cc.size(slot9.width, slot9.height + slot8))

	slot10 = slot0.panel_bg_0:getContentSize()

	slot0.panel_bg_0:setContentSize(cc.size(slot10.width, slot10.height + slot8))

	slot11 = slot0.lay_srollview:getContentSize()

	slot0.lay_srollview:setContentSize(cc.size(slot11.width, slot11.height + slot8))
	slot0.time_label:setPositionY(slot0.time_label:getPositionY() - slot8)
end

function ArenateamMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.look_btn, handler(slot0, slot0.onClickRuleBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY, nil, 0.8)
	registerButtonEventListener(slot0.shop_btn, handler(slot0, slot0.onClickShopBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.rank_btn, handler(slot0, slot0.onClickRankBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.form_btn, handler(slot0, slot0.onClickFormBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.fight_btn, handler(slot0, slot0.onClickFightBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.chat_btn, handler(slot0, slot0.onClickChatBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.report_btn, handler(slot0, slot0.onClickReportBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	slot4 = handler(slot0, slot0.onClickRewardBtn)
	slot5 = true

	registerButtonEventListener(slot0.reward_btn, slot4, slot5, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	for slot4, slot5 in ipairs(slot0.head_list) do
		slot5:addCallBack(function ()
			uv0:onClickHead(uv1)
		end)
	end

	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_MAIN_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setScdata(slot0)
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_MAIN_RANK_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setRankData(slot0)
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_RECEIVE_BOX_EVENT, function ()
		uv0:updateBoxRedPoint()
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_ALL_RED_POINT_EVENT, function ()
		uv0:updateRedPoint()
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_ONLINE_EVENT, function (slot0)
		uv0:updateOnlineInfo(slot0)
	end)
end

function ArenateamMainWindow.updateRedPoint(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 1 or slot0.scdata.state == 2 then
		if uv0.is_apply_red or uv0.is_invitation_red then
			addRedPointToNodeByStatus(slot0.fight_btn, true, 0, 5)
		else
			addRedPointToNodeByStatus(slot0.fight_btn, false, 5, 5)
		end

		if uv0.is_chat_red then
			addRedPointToNodeByStatus(slot0.chat_btn, true, 5, 5)
		else
			addRedPointToNodeByStatus(slot0.chat_btn, false, 5, 5)
		end
	else
		addRedPointToNodeByStatus(slot0.fight_btn, false, 5, 5)
		addRedPointToNodeByStatus(slot0.chat_btn, false, 5, 5)
	end

	if uv0.is_report_red then
		addRedPointToNodeByStatus(slot0.report_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.report_btn, false, 5, 5)
	end
end

function ArenateamMainWindow.onClickHead(slot0, slot1)
	if not (slot0.scdata.team_members or {})[slot1] then
		return
	end

	if slot0.head_list and slot0.head_list[slot1] then
		if RoleController:getInstance():getRoleVo() and slot3.rid == slot4.rid and slot3.sid == slot4.srv_id then
			message(TI18N("这是你自己~"))

			return
		end

		FriendController:getInstance():openFriendCheckPanel(true, {
			srv_id = slot3.sid,
			rid = slot3.rid
		})
	end
end

function ArenateamMainWindow.onClickCloseBtn(slot0)
	uv0:openArenateamMainWindow(false)
end

function ArenateamMainWindow.onClickRuleBtn(slot0)
	MainuiController:getInstance():openCommonExplainView(true, Config.ArenaTeamData.data_explain)
end

function ArenateamMainWindow.onClickShopBtn(slot0)
	CrossarenaController:getInstance():openCrossarenaShopWindow(true)
end

function ArenateamMainWindow.onClickRankBtn(slot0)
	if not slot0.scdata then
		return
	end

	uv0:openArenateamRankRewardPanel(true)
end

function ArenateamMainWindow.onClickFormBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.tid == 0 then
		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.ArenaTeam, {}, HeroConst.FormShowType.eFormSave)
	else
		uv0:openArenateamFormPanel(true)
	end
end

function ArenateamMainWindow.onClickReportBtn(slot0)
	uv0:openArenateamFightRecordPanel(true)
end

function ArenateamMainWindow.onClickRewardBtn(slot0)
	if not slot0.scdata then
		return
	end

	uv0:openArenateamBoxRewardPanel(true)
end

function ArenateamMainWindow.onClickChatBtn(slot0)
	uv0:openArenateamChatPanel(true)
end

function ArenateamMainWindow.onClickFightBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 or slot0.scdata.state == 3 then
		message(TI18N("组队竞技场未开启"))

		return
	elseif slot0.scdata.state == 1 or slot0.scdata.state == 2 and slot0.scdata.is_sign == 0 then
		if slot0.scdata.tid ~= 0 then
			uv0:openArenateamHallPanel(true, {
				index = ArenateamConst.TeamHallTabType.eMyTeam
			})
		else
			uv0:openArenateamHallPanel(true)
		end
	elseif slot0.scdata.state == 2 then
		if slot0.scdata.tid == 0 then
			message(TI18N("未组队不能参赛"))

			return
		end

		uv0:openArenateamFightListPanel(true)
	elseif slot0.scdata.state == 4 then
		message(TI18N("战斗结算中,请耐心等待"))
	end
end

function ArenateamMainWindow.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}

	uv0:sender27220()
	uv0:sender27223(1, 100)
end

function ArenateamMainWindow.setScdata(slot0, slot1)
	slot0.scdata = slot1

	if slot0.scdata.state == 0 or slot0.scdata.state == 3 then
		slot0.my_team_name:setString(TI18N("我的队伍"))
		slot0.team_info:setVisible(false)
		slot0.line:setVisible(false)
		slot0.open_tips:setVisible(true)
		slot0.open_tips:setString(TI18N("暂未开启组队"))
		slot0.open_tips:setPositionY(380)
		slot0.fight_btn:setVisible(false)
		slot0.open_tips_time:setVisible(true)

		if slot0.scdata.end_time < 0 then
			slot2 = 0
		end

		commonCountDownTime(slot0.open_tips_time, slot2, {
			callback = function (slot0)
				uv0:setOPenTipsTimeFormatString(slot0)
			end
		})
		slot0.time_label:setVisible(false)
		slot0:updateChangeCount(false)
	elseif slot0.scdata.state == 1 or slot0.scdata.state == 2 and slot0.scdata.is_sign == 0 then
		slot0.open_tips_time:setVisible(false)
		slot0.fight_btn:setVisible(true)
		slot0.fight_btn_label:setString(TI18N("组队大厅"))
		slot0:setFightBtnIcon(1)
		slot0:updateTeamInfo()
		slot0.time_label:setVisible(true)

		if slot0.scdata.state == 2 then
			slot0.time_key = TI18N("挑战关闭倒计时")
		else
			slot0.time_key = TI18N("挑战开启倒计时")
		end

		if slot0.scdata.end_time < 0 then
			slot2 = 0
		end

		commonCountDownTime(slot0.time_label, slot2, {
			callback = function (slot0)
				uv0:setTimeValFormatString(slot0)
			end
		})
		slot0:updateChangeCount(false)
	elseif slot0.scdata.state == 2 and slot0.scdata.is_sign == 1 then
		slot0.open_tips_time:setVisible(false)
		slot0.fight_btn:setVisible(true)
		slot0.fight_btn_label:setString(TI18N("挑 战"))
		slot0:setFightBtnIcon(2)
		slot0:updateTeamInfo()

		slot0.time_key = TI18N("挑战关闭倒计时")

		if slot0.scdata.end_time < 0 then
			slot2 = 0
		end

		commonCountDownTime(slot0.time_label, slot2, {
			callback = function (slot0)
				uv0:setTimeValFormatString(slot0)
			end
		})
		slot0:updateChangeCount(true)
	elseif slot0.scdata.state == 4 then
		slot0.my_team_name:setString(TI18N("我的队伍"))
		slot0.team_info:setVisible(false)
		slot0.line:setVisible(false)
		slot0.open_tips:setVisible(true)
		slot0.open_tips:setString(TI18N("赛季结算期无法进行组队或挑战"))
		slot0.open_tips:setPositionY(368)
		slot0.fight_btn:setVisible(false)
		slot0.open_tips_time:setVisible(false)

		slot0.time_key = TI18N("结算奖励发放倒计时")

		if slot0.scdata.end_time < 0 then
			slot2 = 0
		end

		commonCountDownTime(slot0.time_label, slot2, {
			callback = function (slot0)
				uv0:setTimeValFormatString(slot0)
			end
		})
		slot0:updateChangeCount(false)
	end

	slot0:updateRedPoint()
	slot0:setTitleName(slot0.scdata.state)
end

function ArenateamMainWindow.setTitleName(slot0, slot1)
	if slot1 == 0 then
		slot0.name:setString(TI18N("排行榜"))
	elseif slot1 == 1 then
		slot0.name:setString(TI18N("排行榜(组队期)"))
	elseif slot1 == 2 then
		slot0.name:setString(TI18N("排行榜(挑战期)"))
		slot0.name:setPositionY(28)
	elseif slot1 == 3 then
		slot0.name:setString(TI18N("上赛季排行榜"))
		slot0.name:setPositionY(28)
	elseif slot1 == 4 then
		slot0.name:setString(TI18N("排行榜(结算期)"))
		slot0.name:setPositionY(28)
	else
		slot0.name:setString(TI18N("排行榜"))
	end
end

function ArenateamMainWindow.setOPenTipsTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.open_tips_time:setString(uv0(TI18N("组队开启倒计时： <div fontcolor=#249003>%s</div>"), TimeTool.GetTimeForFunction(slot1)))
	else
		slot0.open_tips_time:setString(uv0(TI18N("组队竞技场即将开启")))
	end
end

function ArenateamMainWindow.setTimeValFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_label:setString(uv0("<div fontcolor=#643223>%s：</div><div fontcolor=#249003> %s</div>", slot0.time_key, TimeTool.GetTimeFormatDayIIIIIIII(slot1)))
	else
		slot0.time_label:setString(uv0(TI18N("%s即将开启"), slot0.time_key))
	end
end

function ArenateamMainWindow.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.resume_count:setString(uv0(TI18N("<div outline=2,#000000>恢复时间: </div><div fontcolor=#7af655 outline=2,#000000 >%s</div>"), TimeTool.GetTimeForFunction(slot1)))
	else
		slot0.resume_count:setString(uv0(TI18N("<div outline=2,#000000>恢复时间: </div><div fontcolor=#7af655 outline=2,#000000 >%s</div>"), "00:00:00"))
	end
end

function ArenateamMainWindow.setFightBtnIcon(slot0, slot1)
	if not slot0.fight_btn_icon then
		return
	end

	slot2 = nil

	if slot1 == 1 then
		slot2 = PathTool.getResFrame("arenateam", "arenateam_17")
	elseif slot1 == 2 then
		slot2 = PathTool.getResFrame("common", "common_2016")
	end

	if slot2 and (slot0.record_fight_btn_res == nil or slot0.record_fight_btn_res ~= slot2) then
		slot0.record_fight_btn_res = slot2

		loadSpriteTexture(slot0.fight_btn_icon, slot2, LOADTEXT_TYPE_PLIST)
	end
end

function ArenateamMainWindow.updateOnlineInfo(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.scdata and slot0.scdata.team_members then
		for slot5, slot6 in ipairs(slot0.scdata.team_members) do
			if slot6.rid == slot1.rid and slot6.sid == slot1.sid and slot0.head_list[slot5] then
				slot6.is_online = slot1.is_online

				slot7:showOnline(true, slot1.is_online == 1)
			end
		end
	end
end

function ArenateamMainWindow.updateTeamInfo(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.tid ~= 0 then
		slot0.open_tips:setVisible(false)
		slot0.team_info:setVisible(true)
		slot0.line:setVisible(true)
		slot0.my_team_name:setString(slot0.scdata.team_name)
		slot0.power:setString(slot0.scdata.team_power)
		slot0.my_team_score:setString(uv0(TI18N("积分:  %s"), slot0.scdata.score))

		if slot0.scdata.rank == 0 then
			slot0.my_team_index:setString(TI18N("未上榜"))
		else
			slot0.my_team_index:setString(slot0.scdata.rank)
		end

		slot1 = slot0.scdata.team_members or {}

		for slot5, slot6 in ipairs(slot1) do
			slot6.is_leader = 0

			for slot10, slot11 in ipairs(slot6.ext) do
				if slot11.extra_key == 1 then
					if slot11.extra_val == 1 then
						slot6.is_leader = 1
					else
						slot6.is_leader = -slot6.pos
					end
				elseif slot11.extra_key == 6 then
					slot6.is_online = slot11.extra_val
				end
			end
		end

		function slot5(slot0, slot1)
			return slot1.is_leader < slot0.is_leader
		end

		uv1(slot1, slot5)

		for slot5, slot6 in ipairs(slot0.head_list) do
			if slot1[slot5] then
				slot6:setHeadRes(slot7.face_id, false, LOADTEXT_TYPE, slot7.face_file, slot7.face_update_time)
				slot6:setLev(slot7.lev)

				if slot7.is_leader == 1 then
					slot6:showLeader(true)
				else
					slot6:showLeader(false)
				end

				slot6:showOnline(true, slot7.is_online == 1)

				slot8 = slot7.avatar_bid

				if slot6.record_res_bid == nil or slot6.record_res_bid ~= slot8 then
					slot6.record_res_bid = slot8

					if Config.AvatarData.data_avatar[slot8] then
						slot6:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot9.res_id or 1), false, false), nil, false, slot9.offy)
					else
						slot6:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
					end
				end
			else
				slot6:clearHead()
				slot6:closeLev()
				slot6:showOnline(false)
				slot6:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
				slot6:showLeader(false)
			end
		end
	else
		slot0.team_info:setVisible(false)
		slot0.line:setVisible(false)
		slot0.open_tips:setVisible(true)
		slot0.open_tips:setString(TI18N("暂未加入队伍，请前往组队大厅寻找或创建队伍"))
		slot0.open_tips:setPositionY(369)
		slot0.my_team_name:setString(TI18N("我的队伍"))
	end
end

function ArenateamMainWindow.updateChangeCount(slot0, slot1)
	if not slot0.scdata then
		return
	end

	slot0:updateBoxRedPoint()

	if slot1 then
		slot0.change_count:setVisible(true)
		slot0.resume_count:setVisible(true)

		slot3 = 12

		if Config.ArenaTeamData.data_const.limit_number then
			slot3 = slot2.val
		end

		slot0.change_count:setString(TI18N("挑战次数: " .. uv0("%s/%s", slot0.scdata.count, slot3)))

		if slot0.scdata.add_time - GameNet:getInstance():getTime() < 0 then
			slot5 = 0
		end

		commonCountDownTime(slot0.resume_count, slot5, {
			callback = function (slot0)
				uv0:setTimeFormatString(slot0)
			end
		})
	else
		slot0.resume_count:setVisible(false)
		slot0.change_count:setVisible(false)
	end
end

function ArenateamMainWindow.updateBoxRedPoint(slot0)
	if not slot0.scdata then
		return
	end

	if Config.ArenaTeamData.data_challenge_count_reward_info and next(slot1) ~= nil then
		slot0.reward_count:setString(uv0("%s/%s", slot0.scdata.do_count, slot1[#slot1].count))

		slot5 = false

		for slot9, slot10 in ipairs(slot0.scdata.award_list) do
			if slot10.status == 1 then
				slot5 = true

				break
			end
		end

		if slot5 then
			slot0.reward_box:setAnimation(0, PlayerAction.action_2, true)
		else
			slot0.reward_box:setAnimation(0, PlayerAction.action_1, true)
		end
	end
end

function ArenateamMainWindow.setRankData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.show_list = slot1.ranks or {}

	uv0(slot0.show_list, function (slot0, slot1)
		return slot0.rank < slot1.rank
	end)
	slot0:updateItemlist()
end

function ArenateamMainWindow.updateItemlist(slot0)
	if not slot0.show_list then
		return
	end

	if slot0.scrollview_list == nil then
		slot0.scrollview_list = CommonScrollViewSingleLayout.new(slot0.lay_srollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.lay_srollview:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 1,
			space_x = 0,
			item_width = 648,
			item_height = 140,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.scrollview_list:reloadData()

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.lay_srollview, true, {
			text = TI18N("虚位以待...")
		})
	else
		commonShowEmptyIcon(slot0.lay_srollview, false)
	end
end

function ArenateamMainWindow.createNewCell(slot0, slot1, slot2)
	return ArenateamMainItem.new(slot1, slot2, slot0)
end

function ArenateamMainWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenateamMainWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.show_list[slot2] then
		slot1:setData(slot3, slot2)
	end
end

function ArenateamMainWindow.close_callback(slot0)
	if slot0.role_lev_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end

	if slot0.head_list then
		for slot4, slot5 in pairs(slot0.head_list) do
			slot5:DeleteMe()
		end

		slot0.head_list = nil
	end

	if slot0.scrollview_list then
		slot0.scrollview_list:DeleteMe()
	end

	slot0.scrollview_list = nil

	uv0:openArenateamMainWindow(false)
end

ArenateamMainItem = class("ArenateamMainItem", function ()
	return ccui.Widget:create()
end)

function ArenateamMainItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ArenateamMainItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenateam/arenateam_main_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot7 = "head_node"
	slot0.head_node = slot0.main_container:getChildByName(slot7)
	slot0.head_list = {}

	for slot7 = 1, 3 do
		slot0.head_list[slot7] = PlayerHead.new(PlayerHead.type.circle)

		slot0.head_list[slot7]:setSwallowTouches(false)
		slot0.head_list[slot7]:setHeadLayerScale(0.95)
		slot0.head_list[slot7]:setPosition(110 * (slot7 - 1), 0)
		slot0.head_list[slot7]:setLev(99)
		slot0.head_node:addChild(slot0.head_list[slot7])
	end

	slot0.team_index = slot0.main_container:getChildByName("team_index")
	slot0.team_name = slot0.main_container:getChildByName("team_name")
	slot0.team_score_key = slot0.main_container:getChildByName("team_score_key")
	slot0.team_score_value = slot0.main_container:getChildByName("team_score_value")
	slot0.sprite = slot0.main_container:getChildByName("sprite")
	slot0.power = slot0.main_container:getChildByName("power")

	slot0.team_score_key:setString(TI18N("积分:"))
end

function ArenateamMainItem.register_event(slot0)
	for slot4, slot5 in ipairs(slot0.head_list) do
		slot5:addCallBack(function ()
			uv0:onClickHead(uv1)
		end)
	end
end

function ArenateamMainItem.onClickHead(slot0, slot1)
	if not (slot0.data.team_members or {})[slot1] then
		return
	end

	if slot0.head_list and slot0.head_list[slot1] then
		if RoleController:getInstance():getRoleVo() and slot3.rid == slot4.rid and slot3.sid == slot4.srv_id then
			message(TI18N("这是你自己~"))

			return
		end

		FriendController:getInstance():openFriendCheckPanel(true, {
			srv_id = slot3.sid,
			rid = slot3.rid
		})
	end
end

function ArenateamMainItem.setData(slot0, slot1, slot2)
	slot0.data = slot1

	slot0.team_name:setString(slot1.team_name)
	slot0.team_score_value:setString(slot1.score)
	slot0.power:setString(slot1.team_power)

	slot3 = slot1.team_members or {}

	for slot7, slot8 in ipairs(slot3) do
		slot8.is_leader = 0

		for slot12, slot13 in ipairs(slot8.ext) do
			if slot13.extra_key == 1 then
				if slot13.extra_val == 1 then
					slot8.is_leader = 1
				else
					slot8.is_leader = -slot8.pos
				end
			end
		end
	end

	function slot7(slot0, slot1)
		return slot1.is_leader < slot0.is_leader
	end

	uv0(slot3, slot7)

	for slot7, slot8 in ipairs(slot0.head_list) do
		if slot3[slot7] then
			slot8:setHeadRes(slot9.face_id, false, LOADTEXT_TYPE, slot9.face_file, slot9.face_update_time)
			slot8:setLev(slot9.lev)

			if slot9.is_leader == 1 then
				slot8:showLeader(true)
			else
				slot8:showLeader(false)
			end

			slot10 = slot9.avatar_bid

			if slot8.record_res_bid == nil or slot8.record_res_bid ~= slot10 then
				slot8.record_res_bid = slot10

				if Config.AvatarData.data_avatar[slot10] then
					slot8:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot11.res_id or 1), false, false), nil, false, slot11.offy)
				else
					slot8:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
				end
			end
		else
			slot8:clearHead()
			slot8:closeLev()
			slot8:showLeader(false)
			slot8:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
		end
	end

	if slot2 == 1 then
		slot0.sprite:setVisible(true)
		slot0.team_index:setVisible(false)
		loadSpriteTexture(slot0.sprite, PathTool.getResFrame("common", "common_2001"), LOADTEXT_TYPE_PLIST)
	elseif slot2 == 2 then
		slot0.sprite:setVisible(true)
		slot0.team_index:setVisible(false)
		loadSpriteTexture(slot0.sprite, PathTool.getResFrame("common", "common_2002"), LOADTEXT_TYPE_PLIST)
	elseif slot2 == 3 then
		slot0.sprite:setVisible(true)
		slot0.team_index:setVisible(false)
		loadSpriteTexture(slot0.sprite, PathTool.getResFrame("common", "common_2003"), LOADTEXT_TYPE_PLIST)
	else
		slot0.sprite:setVisible(false)
		slot0.team_index:setVisible(true)
		slot0.team_index:setString(slot2 or 0)
	end
end

function ArenateamMainItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5.item:DeleteMe()
		end

		slot0.item_list = {}
	end

	if slot0.head_list then
		for slot4, slot5 in pairs(slot0.head_list) do
			slot5:DeleteMe()
		end

		slot0.head_list = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
