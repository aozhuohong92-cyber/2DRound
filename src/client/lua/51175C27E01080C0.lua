LadderMainWindow = LadderMainWindow or BaseClass(BaseView)
slot1 = LadderController:getInstance():getModel()

function LadderMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.layout_name = "ladder/ladder_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("ladder", "ladder"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_58", true),
			type = ResourcesType.single
		}
	}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.role_panels = {}
	slot0.role_items = {}
end

function LadderMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_58", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.top_panel = slot1:getChildByName("top_panel")
	slot2 = slot0.top_panel:getChildByName("bg3")

	slot0.top_panel:getChildByName("win_title"):setString(TI18N("天梯争霸"))

	slot0.btn_rule = slot0.top_panel:getChildByName("btn_rule")
	slot0.btn_role = slot0.top_panel:getChildByName("btn_role")
	slot0.btn_log = slot0.top_panel:getChildByName("btn_log")
	slot0.btn_rank = slot0.top_panel:getChildByName("btn_rank")
	slot0.btn_award = slot0.top_panel:getChildByName("btn_award")
	slot0.btn_shop = slot0.top_panel:getChildByName("btn_shop")
	slot4 = slot1:getChildByName("bottom_panel")
	slot0.bottom_panel = slot4
	slot5 = slot4:getChildByName("black_bg")

	slot4:getChildByName("count_title"):setString(TI18N("挑战次数:"))

	slot0.count_label = slot4:getChildByName("count_label")

	slot1:getChildByName("tips_label"):setString(TI18N("快速挑战排名不变"))

	slot0.time_title = slot4:getChildByName("time_title")

	slot0.time_title:setString(TI18N("距离结束:"))

	slot0.time_label = slot4:getChildByName("time_label")
	slot0.score_label = slot1:getChildByName("score_bg"):getChildByName("score_label")

	slot0.score_label:setString(slot0.role_vo.sky_coin)

	slot9 = slot1:getChildByName("rank_bg")

	slot9:getChildByName("rank_title"):setString(TI18N("排名:"))

	slot0.rank_label = slot9:getChildByName("rank_label")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.refresh_btn = slot1:getChildByName("refresh_btn")
	slot0.refresh_btn._can_touch = true
	slot0.refresh_btn_label = slot0.refresh_btn:getChildByName("label")

	slot0.refresh_btn_label:setString(TI18N("刷新"))

	slot0.challenge_btn = slot1:getChildByName("challenge_btn")
	slot0.challenge_btn_label = slot0.challenge_btn:getChildByName("label")

	slot0.challenge_btn_label:setString(TI18N("一键挑战"))

	slot14 = "add_btn"
	slot0.add_btn = slot4:getChildByName(slot14)

	for slot14 = 1, 5 do
		slot0.role_panels[slot14] = slot1:getChildByName(string.format("role_pos_%d", slot14))
	end

	slot0.role_panel_size = slot0.role_panels[1]:getContentSize()
	slot11 = display.getMaxScale(slot0.root_wnd)
	slot12 = display.getTop(slot1)
	slot13 = display.getBottom(slot1)
	slot15 = display.getRight(slot1)

	slot0.top_panel:setPositionY(slot12 - 178 * slot11)
	slot2:setScaleX(display.getScale())
	slot4:setPosition(cc.p(360, slot13 + 105 * slot11))
	slot5:setScaleX(display.getScale())
	slot0.close_btn:setPositionY(slot13 + 149 * slot11)
	slot0.refresh_btn:setPosition(cc.p(display.getLeft(slot1) + 75, slot13 + 217 * slot11))
	slot0.challenge_btn:setPosition(cc.p(slot15 - 91, slot13 + 217 * slot11))
	slot8:setPosition(cc.p(slot15, slot12 - 290 * slot11))
	slot9:setPosition(cc.p(slot15, slot12 - 325 * slot11))
	slot7:setPosition(cc.p(slot15 - 96, slot13 + 265 * slot11))
	slot0.add_btn:setPositionX(slot15 - 38)
	slot0.count_label:setPositionX(slot15 - 100)
	slot6:setPositionX(slot15 - 102)
end

function LadderMainWindow.refreshRoleList(slot0)
	function slot6(slot0, slot1)
		if slot0.rank ~= 0 and slot1.rank ~= 0 then
			return slot0.rank < slot1.rank
		elseif slot0.rank == 0 and slot1.rank ~= 0 then
			return false
		elseif slot0.rank ~= 0 and slot1.rank == 0 then
			return true
		else
			return false
		end
	end

	table.sort(uv0:getLadderEnemyListData(), slot6)

	for slot6 = 1, 5 do
		delayRun(slot0.main_container, slot6 * 4 / 60, function ()
			if not uv0.role_items[uv1] then
				slot0 = LadderRoleItem.new()

				slot0:setPosition(cc.p(uv0.role_panel_size.width / 2, uv0.role_panel_size.height - 140))
				uv0.role_panels[uv1]:addChild(slot0)

				uv0.role_items[uv1] = slot0
			end

			if uv2[uv1] and next(slot1) ~= nil then
				slot0:setData(slot1)
				slot0:setVisible(true)
			else
				slot0:setVisible(false)
			end
		end)
	end
end

function LadderMainWindow.refreshMyBaseInfo(slot0)
	slot0.myBaseInfo = uv0:getLadderMyBaseInfo()
	slot1 = uv0:getLadderIsOpen()

	slot0.count_label:setString(slot0.myBaseInfo.can_combat_num or 0)

	if not slot0.left_buy_count then
		slot0.left_buy_count = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(590, 10))

		slot0.bottom_panel:addChild(slot0.left_buy_count)
	end

	slot0.left_buy_count:setString(string.format(TI18N("<div fontcolor=#fff8bf outline=2,#000000>(剩余购买次数:</div><div fontcolor=#39e522 outline=2,#000000>%d</div><div fontcolor=#fff8bf outline=2,#000000>)</div>"), uv0:getTodayLeftBuyCount()))

	if not slot1 or not slot0.myBaseInfo.rank or slot0.myBaseInfo.rank == 0 then
		slot0.rank_label:setString(TI18N("暂无"))
	else
		slot0.rank_label:setString(slot0.myBaseInfo.rank)
	end

	slot0.ref_time = slot0.myBaseInfo.ref_time or 0
	slot0.combat_time = slot0.myBaseInfo.combat_time or 0

	if slot0.combat_time - GameNet:getInstance():getTime() < 0 then
		slot4 = 0
	end

	if not slot1 then
		slot0.time_label:setVisible(false)
		slot0.time_title:setVisible(false)

		if not slot0.join_text then
			slot0.join_text = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(346, 38.5))

			slot0.bottom_panel:addChild(slot0.join_text)
		end

		slot0.join_text:setVisible(true)

		if Config.SkyLadderData.data_const.arena_rank then
			slot0.join_text:setString(string.format(TI18N("<div fontcolor=#fff8bf outline=2,#000000>参赛条件:竞技场排名前</div><div fontcolor=#39e522 outline=2,#000000>%d</div><div fontcolor=#fff8bf outline=2,#000000>名</div>"), slot5.val))
		end
	else
		slot0.time_label:setVisible(true)
		slot0.time_title:setVisible(true)
		slot0.time_label:setString(TimeTool.GetTimeFormat(slot4))

		if slot0.join_text then
			slot0.join_text:setVisible(false)
		end

		slot0:openLadderTimer(true)
	end

	if slot0.ref_time - slot3 <= 0 and slot0.refresh_btn._can_touch == false then
		setChildUnEnabled(false, slot0.refresh_btn)
		slot0.refresh_btn:setTouchEnabled(true)

		slot0.refresh_btn._can_touch = true

		slot0.refresh_btn_label:enableOutline(cc.c3b(71, 132, 37), 1)
		slot0.refresh_btn_label:setString(TI18N("刷新"))
	elseif slot5 > 0 and slot0.refresh_btn._can_touch == true then
		setChildUnEnabled(true, slot0.refresh_btn)
		slot0.refresh_btn:setTouchEnabled(false)

		slot0.refresh_btn._can_touch = false

		slot0.refresh_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.refresh_btn_label:setString(string.format(TI18N("%d秒"), slot5))
	end
end

function LadderMainWindow.openLadderTimer(slot0, slot1)
	if slot1 == true then
		if slot0.ladder_timer == nil then
			slot0.ladder_timer = GlobalTimeTicket:getInstance():add(function ()
				slot0 = GameNet:getInstance():getTime()

				if uv0.combat_time - slot0 <= 0 and uv0.ref_time - slot0 <= 0 then
					GlobalTimeTicket:getInstance():remove(uv0.ladder_timer)

					uv0.ladder_timer = nil
				end

				if slot1 < 0 then
					slot1 = 0
				end

				if slot1 <= 0 then
					uv0.time_label:setVisible(false)
					uv0.time_title:setVisible(false)

					if uv0.join_text then
						uv0.join_text:setVisible(true)
					end
				else
					uv0.time_label:setVisible(true)
					uv0.time_title:setVisible(true)
					uv0.time_label:setString(TimeTool.GetTimeFormat(slot1))
				end

				if slot2 <= 0 then
					if uv0.refresh_btn._can_touch == false then
						setChildUnEnabled(false, uv0.refresh_btn)
						uv0.refresh_btn:setTouchEnabled(true)

						uv0.refresh_btn._can_touch = true

						uv0.refresh_btn_label:enableOutline(cc.c3b(71, 132, 37), 1)
					end

					uv0.refresh_btn_label:setString(TI18N("刷新"))
				elseif slot2 > 0 then
					if uv0.refresh_btn._can_touch == true then
						setChildUnEnabled(true, uv0.refresh_btn)
						uv0.refresh_btn:setTouchEnabled(false)

						uv0.refresh_btn._can_touch = false

						uv0.refresh_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
					end

					uv0.refresh_btn_label:setString(string.format(TI18N("%d秒"), slot2))
				end
			end, 1)
		end
	elseif slot0.ladder_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.ladder_timer)

		slot0.ladder_timer = nil
	end
end

function LadderMainWindow.openRootWnd(slot0)
	uv0:requestLadderMyBaseInfo()
	uv0:requestLadderEnemyListData()
	slot0:refrehsBtnRedStatus()
end

function LadderMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.btn_rule, handler(slot0, slot0._onClickBtnRule))
	registerButtonEventListener(slot0.btn_role, handler(slot0, slot0._onClickBtnRolePalace))
	registerButtonEventListener(slot0.btn_log, handler(slot0, slot0._onClickBtnLog))
	registerButtonEventListener(slot0.btn_rank, handler(slot0, slot0._onClickBtnRank))
	registerButtonEventListener(slot0.btn_award, handler(slot0, slot0._onClickBtnAward))
	registerButtonEventListener(slot0.btn_shop, handler(slot0, slot0._onClickBtnShop))
	registerButtonEventListener(slot0.add_btn, handler(slot0, slot0._onClickBtnAdd))
	registerButtonEventListener(slot0.refresh_btn, handler(slot0, slot0._onClickBtnRefresh), true)
	registerButtonEventListener(slot0.challenge_btn, handler(slot0, slot0._onClickBtnChallenge), true)

	if slot0.ladder_mybaseinfo_event == nil then
		slot0.ladder_mybaseinfo_event = GlobalEvent:getInstance():Bind(LadderEvent.UpdateLadderMyBaseInfo, function ()
			uv0:refreshMyBaseInfo()
		end)
	end

	if slot0.ladder_update_enemy_event == nil then
		slot0.ladder_update_enemy_event = GlobalEvent:getInstance():Bind(LadderEvent.UpdateAllLadderEnemyList, function ()
			uv0:refreshRoleList()
		end)
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "sky_coin" then
				uv0.score_label:setString(slot1)
			end
		end)
	end

	slot0:addGlobalEvent(LadderEvent.UpdateLadderOpenStatus, function ()
		uv0:refreshMyBaseInfo()
	end)

	if slot0.update_red_status_event == nil then
		slot0.update_red_status_event = GlobalEvent:getInstance():Bind(LadderEvent.UpdateLadderRedStatus, function (slot0, slot1)
			uv0:refrehsBtnRedStatus(slot0, slot1)
		end)
	end
end

function LadderMainWindow._onClickBtnClose(slot0)
	uv0:openMainWindow(false)
end

function LadderMainWindow._onClickBtnRule(slot0)
	MainuiController:getInstance():openCommonExplainView(true, Config.SkyLadderData.data_explain)
end

function LadderMainWindow._onClickBtnRolePalace(slot0)
	uv0:openLadderTopThreeWindow(true)
end

function LadderMainWindow._onClickBtnLog(slot0)
	uv0:openLadderLogWindow(true)
end

function LadderMainWindow._onClickBtnRank(slot0)
	uv0:openLadderRankWindow(true)
end

function LadderMainWindow._onClickBtnAward(slot0)
	uv0:openLadderAwardWindow(true)
end

function LadderMainWindow._onClickBtnShop(slot0)
	uv0:openLadderShopWindow(true)
end

function LadderMainWindow._onClickBtnAdd(slot0)
	if not uv0:getLadderIsOpen() then
		if Config.SkyLadderData.data_const.close_text then
			message(string.format(TI18N("每%s天梯争霸"), slot2.desc))
		end

		return
	end

	if slot0.myBaseInfo then
		if Config.SkyLadderData.data_buy_num[(slot0.myBaseInfo.buy_combat_num or 0) + 1] then
			if slot4.vip <= RoleController:getInstance():getRoleVo().vip_lev then
				CommonAlert.show(string.format(TI18N("确定消耗<img src=%s visible=true scale=0.35 />%s增加一次挑战次数吗？"), PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), slot4.cost), TI18N("确定"), function ()
					uv0:requestBuyChallengeCount()
				end, TI18N("取消"), nil, CommonAlert.type.rich)
			else
				message(TI18N("提升VIP等级可增加购买次数"))
			end
		else
			message(TI18N("当前已经购买达到上限"))
		end
	end
end

function LadderMainWindow._onClickBtnRefresh(slot0)
	if uv0:getLadderIsOpen() then
		uv1:requestRefreshEnemyList()
	elseif Config.SkyLadderData.data_const.close_text then
		message(string.format(TI18N("每%s天梯争霸"), slot2.desc))
	end
end

function LadderMainWindow._onClickBtnChallenge(slot0)
	if not uv0:getLadderIsOpen() then
		if Config.SkyLadderData.data_const.close_text then
			message(string.format(TI18N("每%s天梯争霸"), slot2.desc))
		end

		return
	end

	CommonAlert.show(TI18N([[
一键挑战将直接获得奖励，是否继续？


                          <div fontsize=22>(消耗一次挑战次数)</div>]]), TI18N("确定"), function ()
		uv0:checkJoinLadderBattle(nil, nil, true)
	end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, 24, nil)
end

function LadderMainWindow.refrehsBtnRedStatus(slot0, slot1, slot2)
	if slot1 == LadderConst.RedType.TopThree then
		addRedPointToNodeByStatus(slot0.btn_role, slot2)
	elseif slot1 == LadderConst.RedType.BattleLog then
		addRedPointToNodeByStatus(slot0.btn_log, slot2)
	else
		addRedPointToNodeByStatus(slot0.btn_role, uv0:checkRedIsShowByRedType(LadderConst.RedType.TopThree))
		addRedPointToNodeByStatus(slot0.btn_log, uv0:checkRedIsShowByRedType(LadderConst.RedType.BattleLog))
	end
end

function LadderMainWindow.close_callback(slot0)
	if slot0.ladder_mybaseinfo_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.ladder_mybaseinfo_event)

		slot0.ladder_mybaseinfo_event = nil
	end

	if slot0.ladder_update_enemy_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.ladder_update_enemy_event)

		slot0.ladder_update_enemy_event = nil
	end

	if slot0.update_red_status_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_red_status_event)

		slot0.update_red_status_event = nil
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	for slot4, slot5 in pairs(slot0.role_items) do
		slot5:DeleteMe()

		slot5 = nil
	end

	slot0:openLadderTimer(false)
	uv0:openMainWindow(false)
end
