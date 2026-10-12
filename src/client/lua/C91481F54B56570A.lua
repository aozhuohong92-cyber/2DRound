ArenaManyPeopleMainWindow = ArenaManyPeopleMainWindow or BaseClass(BaseView)
slot1 = ArenaManyPeopleController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort

function ArenaManyPeopleMainWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/battle_bg/11006", "b_bg", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("arenampmatch", "amp_rank_bg_1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("arenampmatch", "amp_rank_bg_2"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("arenampmatch", "amp_rank_bg_3"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("arenampmatch", "arenamp"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "arenamanypeople/amp_main_window"
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.hero_panel_list = {}
	slot0.team_info_list = {}
end

function ArenaManyPeopleMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale() or 1)
	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/battle_bg/11006", "b_bg", true), LOADTEXT_TYPE)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.container_size = slot0.container:getContentSize()
	slot0.top_panel = slot0.container:getChildByName("top_panel")
	slot0.bottom_panel = slot0.container:getChildByName("bottom_panel")
	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.look_btn = slot0.bottom_panel:getChildByName("look_btn")

	for slot5 = 1, 3 do
		slot6 = {
			panel = slot7,
			icon_img = slot7:getChildByName("icon_img"),
			role_name = slot7:getChildByName("role_name"),
			score_num = slot7:getChildByName("score_num"),
			power_num = slot7:getChildByName("power_num"),
			lev_num = slot7:getChildByName("lev_num"),
			head_icon = slot13,
			rank_tips = slot0.top_panel:getChildByName("rank_tips_" .. slot5)
		}
		slot7 = slot0.top_panel:getChildByName("hero_panel_" .. slot5)
		slot13 = PlayerHead.new(PlayerHead.type.circle)

		slot13:setHeadLayerScale(0.8)
		slot13:setPosition(119, 300)
		slot7:addChild(slot13)
		slot13:addCallBack(function ()
			uv0:onClickHead(uv1, true)
		end)
		slot7:setVisible(false)
		slot6.rank_tips:setString(TI18N("虚位以待"))
		slot6.rank_tips:setVisible(false)

		slot0.hero_panel_list[slot5] = slot6
	end

	slot0.time_label = createRichLabel(22, cc.c4b(255, 248, 191, 255), cc.p(0.5, 0.5), cc.p(360, 640), nil, nil, 500)

	slot0.bottom_panel:addChild(slot0.time_label)

	slot0.rank_btn = slot0.bottom_panel:getChildByName("rank_btn")

	slot0.rank_btn:getChildByName("label"):setString(TI18N("排行榜"))

	slot0.shop_btn = slot0.bottom_panel:getChildByName("shop_btn")

	slot0.shop_btn:getChildByName("label"):setString(TI18N("兑换商城"))

	slot0.report_btn = slot0.bottom_panel:getChildByName("report_btn")

	slot0.report_btn:getChildByName("label"):setString(TI18N("战报"))

	slot0.form_btn = slot0.bottom_panel:getChildByName("form_btn")

	slot0.form_btn:getChildByName("label"):setString(TI18N("布阵调整"))

	slot0.fight_btn = slot0.bottom_panel:getChildByName("fight_btn")

	slot0.fight_btn:setVisible(false)

	slot0.fight_btn_label = slot0.fight_btn:getChildByName("label")

	slot0.fight_btn_label:setString(TI18N("挑 战"))

	slot0.reward_btn = slot0.bottom_panel:getChildByName("reward_btn")

	slot0.reward_btn:getChildByName("label"):setString(TI18N("段位奖励"))

	slot0.spine = slot0.reward_btn:getChildByName("spine")
	slot0.team_btn = slot0.bottom_panel:getChildByName("team_btn")
	slot0.team_btn_label = slot0.team_btn:getChildByName("label")

	slot0.team_btn_label:setString(TI18N("组队大厅"))

	slot0.out_btn = slot0.bottom_panel:getChildByName("out_btn")

	slot0.out_btn:getChildByName("label"):setString(TI18N("转让队长"))

	slot0.exit_btn = slot0.bottom_panel:getChildByName("exit_btn")

	slot0.exit_btn:getChildByName("label"):setString(TI18N("退出队伍"))

	slot0.add_btn = slot0.bottom_panel:getChildByName("add_btn")
	slot0.reward_box = createEffectSpine(PathTool.getEffectRes(110), cc.p(0, -20), cc.p(0.5, 0.5), true, PlayerAction.action_1)

	slot0.spine:addChild(slot0.reward_box)
	slot0.bottom_panel:getChildByName("title_lab"):setString(TI18N("我的队伍"))

	slot0.change_count = slot0.bottom_panel:getChildByName("change_count")

	slot0.change_count:setString(TI18N("挑战次数: 0"))

	slot0.buy_count = slot0.bottom_panel:getChildByName("buy_count")

	slot0.buy_count:setString(TI18N("可购买次数: 0"))

	slot0.tips_lab = slot0.bottom_panel:getChildByName("tips_lab")
	slot6 = TI18N

	slot0.tips_lab:setString(slot6("暂无队友"))

	for slot6 = 1, 2 do
		slot8 = slot0.bottom_panel:getChildByName("team_info_" .. slot6)

		slot8:setVisible(false)

		slot16 = PlayerHead.new(PlayerHead.type.circle)

		slot16:setHeadLayerScale(0.9)
		slot16:setPosition(150, 61)
		slot8:addChild(slot16)
		slot16:addCallBack(function ()
			uv0:onClickHead(uv1, false)
		end)

		slot0.team_info_list[slot6] = {
			team_info = slot8,
			lev_icon = slot8:getChildByName("lev_icon"),
			rank_num = slot8:getChildByName("rank_num"),
			score_num = slot8:getChildByName("score_num"),
			fight_num = slot8:getChildByName("fight_num"),
			power = slot8:getChildByName("power"),
			name_lab = slot8:getChildByName("name_lab"),
			lev_num = slot8:getChildByName("lev_num"),
			head_icon = slot16
		}
	end

	slot0:adaptationScreen()
	ActionHelp.itemUpAction(slot0.top_panel, 0, -360, 0.5)
	ActionHelp.itemUpAction(slot0.bottom_panel, 720, 0, 0.25)
end

function ArenaManyPeopleMainWindow.adaptationScreen(slot0)
	slot2 = display.getBottom(slot0.container)
	slot3 = slot0.top_panel:getPositionY()

	slot0.top_panel:setPositionY(display.getTop(slot0.container))

	slot4 = slot0.bottom_panel:getPositionY()

	slot0.bottom_panel:setPositionY(slot2)
	slot0.close_btn:setPositionY(slot2 + slot0.close_btn:getPositionY())
end

function ArenaManyPeopleMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.look_btn, handler(slot0, slot0.onClickRuleBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY, nil, 0.8)
	registerButtonEventListener(slot0.rank_btn, handler(slot0, slot0.onClickRankBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.shop_btn, handler(slot0, slot0.onClickShopBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.form_btn, handler(slot0, slot0.onClickFormBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.fight_btn, handler(slot0, slot0.onClickFightBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.report_btn, handler(slot0, slot0.onClickReportBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.reward_btn, handler(slot0, slot0.onClickRewardBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.out_btn, handler(slot0, slot0.onClickOutBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.team_btn, handler(slot0, slot0.onClickTeamBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.exit_btn, handler(slot0, slot0.onClickExitBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.add_btn, handler(slot0, slot0.onClickAddBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	slot0:addGlobalEvent(ArenaManyPeopleEvent.ARENAMANYPOEPLE_MAIN_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setScdata(slot0)
	end)
	slot0:addGlobalEvent(ArenaManyPeopleEvent.ARENAMANYPOEPLE_RECEIVE_BOX_EVENT, function ()
		uv0:updateBoxRedPoint()
	end)
	slot0:addGlobalEvent(ArenaManyPeopleEvent.ARENAMANYPOEPLE_ALL_RED_POINT_EVENT, function ()
		uv0:updateRedPoint()
	end)
	slot0:addGlobalEvent(ArenaManyPeopleEvent.ARENAMANYPOEPLE_MAIN_RANK_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setRankData(slot0)

		if uv0.scdata and uv0.scdata.state == 1 then
			uv0:updateTeamInfo()
		end
	end)
	slot0:addGlobalEvent(ArenaManyPeopleEvent.ARENAMANYPOEPLE_UPDATE_BUYNUM_EVENT, function ()
		uv0:updateChangeCount(true)

		if uv0.team_info_list and uv0.team_info_list[1] and uv0.scdata then
			uv0.team_info_list[1].fight_num:setString(uv1(TI18N("剩余挑战次数：%d"), uv0.scdata.count))
		end
	end)
	slot0:addGlobalEvent(BattleEvent.CLOSE_RESULT_VIEW, function ()
		uv0:sender29025(1, 3)
	end)
end

function ArenaManyPeopleMainWindow.updateRedPoint(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state ~= 1 then
		addRedPointToNodeByStatus(slot0.fight_btn, false, 5, 5, nil, 2)
	end

	if uv0:getInvitationInfo() and slot1.team_members and #slot1.team_members > 0 then
		addRedPointToNodeByStatus(slot0.team_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.team_btn, false, 5, 5)
	end

	if uv0:getIsReportRedpoint() == true then
		addRedPointToNodeByStatus(slot0.report_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.report_btn, false, 5, 5)
	end
end

function ArenaManyPeopleMainWindow.onClickHead(slot0, slot1, slot2)
	slot3 = slot0.team_info_list

	if slot2 == true then
		slot3 = slot0.hero_panel_list
	end

	if slot3 and slot3[slot1] and slot3[slot1].head_icon and slot3[slot1].head_icon:getData() then
		slot4 = slot3[slot1].head_icon:getData()

		if slot0.role_vo and slot4.rid == slot0.role_vo.rid and slot4.sid == slot0.role_vo.srv_id then
			message(TI18N("这是你自己~"))

			return
		end

		FriendController:getInstance():openFriendCheckPanel(true, {
			srv_id = slot4.sid,
			rid = slot4.rid
		})
	end
end

function ArenaManyPeopleMainWindow.onClickCloseBtn(slot0)
	uv0:openArenaManyPeopleMainWindow(false)
end

function ArenaManyPeopleMainWindow.onClickRuleBtn(slot0)
	MainuiController:getInstance():openCommonExplainView(true, Config.HolidayArenaTeamData.data_explain)
end

function ArenaManyPeopleMainWindow.onClickRankBtn(slot0)
	if slot0.scdata and slot0.scdata.state == 0 then
		message(TI18N("活动未开启"))

		return
	end

	uv0:openArenaManyPeopleRankWindow(true)
end

function ArenaManyPeopleMainWindow.onClickShopBtn(slot0)
	if ActionController:getInstance():getActionSubTabVo(ActionRankCommonType.mysterious_store) then
		slot1:openActionMainPanel(true, nil, slot2.bid)
	else
		message(TI18N("该活动已结束或未到开启时间段"))
	end
end

function ArenaManyPeopleMainWindow.onClickFormBtn(slot0)
	HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.ArenaManyPeople, {}, HeroConst.FormShowType.eFormSave)
end

function ArenaManyPeopleMainWindow.onClickReportBtn(slot0)
	if slot0.scdata and slot0.scdata.state == 0 then
		message(TI18N("活动未开启"))

		return
	end

	uv0:setIsReportRedpoint(false)
	uv1:openArenaManyPeopleFightRecordPanel(true)
end

function ArenaManyPeopleMainWindow.onClickRewardBtn(slot0)
	if slot0.scdata and slot0.scdata.state == 0 then
		message(TI18N("活动未开启"))

		return
	end

	uv0:openArenaManyPeopleBoxRewardPanel(true)
end

function ArenaManyPeopleMainWindow.onClickOutBtn(slot0)
	if not slot0.scdata then
		return
	end

	slot1 = nil

	if slot0.scdata.team_members then
		for slot5, slot6 in ipairs(slot0.scdata.team_members) do
			if slot6.is_leader ~= 1 then
				slot1 = slot6

				break
			end
		end
	end

	if slot1 then
		uv0:sender29007(slot1.rid, slot1.sid)
	end
end

function ArenaManyPeopleMainWindow.onClickTeamBtn(slot0)
	uv0:openArenaManyPeopleHallPanel(true)
end

function ArenaManyPeopleMainWindow.onClickExitBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.team_members and #slot0.scdata.team_members >= 2 then
		uv0:sender29006()
	end
end

function ArenaManyPeopleMainWindow.onClickAddBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		message(TI18N("活动未开启"))

		return
	end

	if uv0:getMyInfo() then
		if Config.HolidayArenaTeamData.data_battle_pay[slot0.scdata.buy_count + 1] then
			CommonAlert.show(uv1(TI18N("是否花费 <img src='%s' scale=0.3 /> %d购买挑战次数？"), PathTool.getItemRes(Config.ItemData.data_get_data(slot2.expend[1][1]).icon), slot2.expend[1][2]), TI18N("确定"), function ()
				uv0:sender29030()
			end, TI18N("取消"), nil, CommonAlert.type.rich)

			return
		else
			message(TI18N("已到达今日可购买次数上限"))
		end
	end
end

function ArenaManyPeopleMainWindow.onClickFightBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		message(TI18N("多人竞技场未开启"))

		return
	end

	if slot0.scdata.count <= 0 and uv0:getMyInfo() and Config.HolidayArenaTeamData.data_battle_pay[slot0.scdata.buy_count + 1] then
		CommonAlert.show(uv1(TI18N("是否花费 <img src='%s' scale=0.3 /> %d购买挑战次数？"), PathTool.getItemRes(Config.ItemData.data_get_data(slot2.expend[1][1]).icon), slot2.expend[1][2]), TI18N("确定"), function ()
			uv0:setIsTouchFight(true)
			uv1:sender29030()
		end, TI18N("取消"), nil, CommonAlert.type.rich)

		return
	end

	uv2:sender29016()
end

function ArenaManyPeopleMainWindow.openRootWnd(slot0)
	uv0:sender29000()
	uv0:sender29025(1, 3)
	uv0:sender29035()
end

function ArenaManyPeopleMainWindow.setScdata(slot0, slot1)
	slot0.scdata = slot1

	if slot0.scdata.state == 0 then
		slot0.out_btn:setVisible(false)
		slot0.team_btn:setVisible(false)
		slot0.exit_btn:setVisible(false)
		slot0.fight_btn:setVisible(false)
		doStopAllActions(slot0.time_label)
		slot0.time_label:setVisible(false)
		slot0:updateChangeCount(false)
	elseif slot0.scdata.state == 1 then
		slot0.team_btn:setVisible(false)
		slot0.exit_btn:setVisible(false)
		slot0.fight_btn:setVisible(true)
		slot0.time_label:setVisible(true)
		slot0:updateTeamInfo()

		if slot0.scdata.end_time - GameNet:getInstance():getTime() < 0 then
			slot2 = 0
		end

		commonCountDownTime(slot0.time_label, slot2, {
			callback = function (slot0)
				uv0:setTimeValFormatString(slot0)
			end
		})
		slot0:updateChangeCount(true)
	end

	slot0:updateRedPoint()
end

function ArenaManyPeopleMainWindow.setTimeValFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_label:setString(uv0("<div outline=2,#000000>距离赛季结束：</div><div fontcolor=#7af655 outline=2,#000000> %s</div>", TimeTool.GetTimeFormatDayIIIIIIII(slot1)))
	else
		slot0.time_label:setString("")
	end
end

function ArenaManyPeopleMainWindow.updateTeamInfo(slot0)
	if not slot0.scdata then
		return
	end

	slot4 = true

	slot0.tips_lab:setVisible(slot4)

	for slot4, slot5 in ipairs(slot0.team_info_list) do
		if slot4 == 2 and slot5 then
			slot5.team_info:setVisible(false)
		end
	end

	slot1 = false
	slot3 = #(slot0.scdata.team_members or {}) or 1

	for slot7, slot8 in ipairs(slot2) do
		slot9 = nil

		if slot0.role_vo and slot8.rid == slot0.role_vo.rid and slot8.sid == slot0.role_vo.srv_id then
			if slot0.team_info_list[1] then
				slot9 = slot0.team_info_list[1]
			end

			if slot8.is_leader == 1 and slot3 > 1 then
				slot1 = true
			end
		else
			if slot0.team_info_list[2] then
				slot9 = slot0.team_info_list[2]
			end

			slot0.tips_lab:setVisible(false)
		end

		if slot9 then
			slot9.team_info:setVisible(true)

			if slot9.head_icon then
				slot10 = slot9.head_icon

				slot10:setHeadData(slot8)
				slot10:setHeadRes(slot8.face_id, false, LOADTEXT_TYPE, slot8.face_file, slot8.face_update_time)
				slot10:setLev(slot8.lev)

				if slot8.is_leader == 1 and slot3 > 1 then
					slot10:showLeader(true)
				else
					slot10:showLeader(false)
				end

				if slot3 > 1 then
					slot10:showOnline(true, slot8.is_online == 1)
				else
					slot10:showOnline(false)
				end

				slot11 = slot8.avatar_bid

				if slot10.record_res_bid == nil or slot10.record_res_bid ~= slot11 then
					slot10.record_res_bid = slot11

					if Config.AvatarData.data_avatar[slot11] then
						slot10:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot12.res_id or 1), false, false), nil, false, slot12.offy)
					else
						slot10:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
					end
				end
			end

			if slot8.rank > 0 then
				slot9.rank_num:setString(uv0(TI18N("%d名"), slot8.rank))
				slot9.rank_num:setFontSize(26)
			else
				slot9.rank_num:setString(TI18N("未上榜"))
				slot9.rank_num:setFontSize(20)
			end

			slot9.score_num:setString(uv0(TI18N("%d分"), slot8.score))
			slot9.power:setString(tostring(slot8.power))
			slot9.name_lab:setString(slot8.name)

			slot10 = slot0.scdata.team_count

			if slot0.role_vo and slot8.rid == slot0.role_vo.rid and slot8.sid == slot0.role_vo.srv_id then
				slot10 = slot0.scdata.count
			end

			slot9.fight_num:setString(uv0(TI18N("剩余挑战次数：%d"), slot10))

			if Config.HolidayArenaTeamData.data_elite_level[slot8.score_lev] then
				slot12 = cc.c4b(86, 46, 13, 255)

				if slot11.icon == "amp_icon_1" or slot11.icon == "amp_icon_2" or slot11.icon == "amp_icon_3" then
					slot12 = cc.c4b(48, 56, 83, 255)
				end

				slot9.lev_num:enableOutline(slot12, 2)
				slot9.lev_num:setString(slot11.name)

				slot9.item_load = loadSpriteTextureFromCDN(slot9.lev_icon, PathTool.getPlistImgForDownLoad("arenampmatch/arenampmatch_icon", slot11.icon), ResourcesType.single, slot9.item_load)
			end
		end
	end

	slot0.out_btn:setVisible(slot1)

	if slot2 and #slot2 >= 2 then
		slot0.exit_btn:setVisible(true)
		slot0.team_btn:setVisible(false)
	else
		slot0.exit_btn:setVisible(false)
		slot0.team_btn:setVisible(true)
	end
end

function ArenaManyPeopleMainWindow.updateChangeCount(slot0, slot1)
	if not slot0.scdata then
		return
	end

	slot0:updateBoxRedPoint()

	if slot1 then
		slot0.change_count:setVisible(true)
		slot0.buy_count:setVisible(true)

		if Config.HolidayArenaTeamData.data_const.team_battle_pay then
			slot0.buy_count:setString(uv0(TI18N("可购买次数: %d"), slot2.val - slot0.scdata.buy_count))
		end

		if Config.HolidayArenaTeamData.data_const.team_battle_free then
			slot0.change_count:setString(TI18N("挑战次数: " .. uv0("%s/%s", slot0.scdata.count, slot3.val)))
		end
	else
		slot0.change_count:setVisible(false)
		slot0.buy_count:setVisible(false)
	end
end

function ArenaManyPeopleMainWindow.updateBoxRedPoint(slot0)
	if not slot0.scdata then
		return
	end

	if Config.ArenaTeamData.data_challenge_count_reward_info and next(slot1) ~= nil then
		slot2 = false

		for slot6, slot7 in ipairs(slot0.scdata.award_list) do
			if slot7.status == 1 then
				slot2 = true

				break
			end
		end

		if slot2 then
			slot0.reward_box:setAnimation(0, PlayerAction.action_2, true)
		else
			slot0.reward_box:setAnimation(0, PlayerAction.action_1, true)
		end
	end
end

function ArenaManyPeopleMainWindow.setRankData(slot0, slot1)
	if not slot1 then
		return
	end

	for slot5, slot6 in pairs(slot0.hero_panel_list) do
		slot6.rank_tips:setVisible(true)
	end

	uv0(slot1.team_members or {}, SortTools.KeyLowerSorter("rank"))

	for slot6, slot7 in ipairs(slot2) do
		if slot0.hero_panel_list[slot6] and slot0.hero_panel_list[slot6].head_icon then
			slot9 = slot0.hero_panel_list[slot6].head_icon

			slot0.hero_panel_list[slot6].panel:setVisible(true)
			slot0.hero_panel_list[slot6].rank_tips:setVisible(false)
			slot9:setHeadData(slot7)
			slot9:setHeadRes(slot7.face_id, false, LOADTEXT_TYPE, slot7.face_file, slot7.face_update_time)
			slot9:setLev(slot7.lev)

			slot10 = slot7.avatar_bid

			if slot9.record_res_bid == nil or slot9.record_res_bid ~= slot10 then
				slot9.record_res_bid = slot10

				if Config.AvatarData.data_avatar[slot10] then
					slot9:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot11.res_id or 1), false, false), nil, false, slot11.offy)
				else
					slot9:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
				end
			end

			slot0.hero_panel_list[slot6].role_name:setString(slot7.name)
			slot0.hero_panel_list[slot6].score_num:setString(uv1(TI18N("积分：%d"), slot7.score))
			slot0.hero_panel_list[slot6].power_num:setString(tostring(slot7.power))

			if Config.HolidayArenaTeamData.data_elite_level[slot7.score_lev] then
				slot12 = cc.c4b(86, 46, 13, 255)

				if slot11.icon == "amp_icon_1" or slot11.icon == "amp_icon_2" or slot11.icon == "amp_icon_3" then
					slot12 = cc.c4b(48, 56, 83, 255)
				end

				slot0.hero_panel_list[slot6].lev_num:enableOutline(slot12, 2)
				slot0.hero_panel_list[slot6].lev_num:setString(slot11.name)

				slot0.hero_panel_list[slot6].item_load = loadSpriteTextureFromCDN(slot0.hero_panel_list[slot6].icon_img, PathTool.getPlistImgForDownLoad("arenampmatch/arenampmatch_icon", slot11.icon), ResourcesType.single, slot0.hero_panel_list[slot6].item_load)
			end
		end

		if slot6 >= 4 then
			return
		end
	end
end

function ArenaManyPeopleMainWindow.close_callback(slot0)
	doStopAllActions(slot0.time_label)
	doStopAllActions(slot0.top_panel)
	doStopAllActions(slot0.bottom_panel)

	if slot0.reward_box then
		slot0.reward_box:clearTracks()
		slot0.reward_box:removeFromParent()

		slot0.reward_box = nil
	end

	if slot0.hero_panel_list then
		for slot4, slot5 in pairs(slot0.hero_panel_list) do
			if slot5 and slot5.head_icon and slot5.head_icon.DeleteMe then
				slot5.head_icon:DeleteMe()

				slot5.head_icon = nil
			end

			if slot5 and slot5.item_load and slot5.item_load.DeleteMe then
				slot5.item_load:DeleteMe()

				slot5.item_load = nil
			end
		end

		slot0.hero_panel_list = nil
	end

	if slot0.team_info_list then
		for slot4, slot5 in pairs(slot0.team_info_list) do
			if slot5 and slot5.head_icon and slot5.head_icon.DeleteMe then
				slot5.head_icon:DeleteMe()

				slot5.head_icon = nil
			end

			if slot5 and slot5.item_load and slot5.item_load.DeleteMe then
				slot5.item_load:DeleteMe()

				slot5.item_load = nil
			end
		end

		slot0.team_info_list = nil
	end

	uv0:openArenaManyPeopleMainWindow(false)
end
