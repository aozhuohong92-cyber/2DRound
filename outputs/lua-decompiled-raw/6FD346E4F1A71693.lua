ElitematchMainWindow = ElitematchMainWindow or BaseClass(BaseView)
slot1 = ElitematchController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort

function ElitematchMainWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("elitematch", "elitematch"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "elitematch/elitematch_main_window"
	slot0.tab_list = {}
	slot0.is_record_one = true
end

function ElitematchMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale() or 1)
	slot0:setBackgroundImg("elitematch_main_bg")

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.container_size = slot0.container:getContentSize()
	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.top_panel = slot0.container:getChildByName("top_panel")
	slot0.bottom_panel = slot0.container:getChildByName("bottom_panel")
	slot0.rule_btn = slot0.container:getChildByName("rule_btn")

	slot0.rule_btn:getChildByName("label"):setString(TI18N("规则说明"))

	slot0.form_btn = slot0.container:getChildByName("form_btn")

	slot0.form_btn:getChildByName("label"):setString(TI18N("阵容调整"))

	slot0.record_btn = slot0.container:getChildByName("record_btn")

	slot0.record_btn:getChildByName("label"):setString(TI18N("赛季传奇"))

	slot0.challenge_btn = slot0.container:getChildByName("challenge_btn")

	slot0.challenge_btn:getChildByName("label"):setString(TI18N("挑战记录"))

	slot0.shop_btn = slot0.container:getChildByName("shop_btn")

	slot0.shop_btn:getChildByName("label"):setString(TI18N("段位商城"))

	slot0.elite_btn = slot0.container:getChildByName("elite_btn")

	slot0.elite_btn:getChildByName("label"):setString(TI18N("段位说明"))

	slot0.personal_btn = slot0.container:getChildByName("personal_btn")

	slot0.personal_btn:getChildByName("label"):setString(TI18N("个人战绩"))

	slot0.declaration_btn = slot0.container:getChildByName("declaration_btn")

	slot0.declaration_btn:getChildByName("label"):setString(TI18N("战前宣言"))

	slot0.detail_btn = slot0.container:getChildByName("detail_btn")

	slot0.detail_btn:getChildByName("label"):setString(TI18N("奖励一览"))

	slot0.orderaction_btn = slot0.container:getChildByName("orderaction_btn")

	slot0.orderaction_btn:getChildByName("label"):setString(TI18N("王者之证"))

	slot0.level_node = slot0.container:getChildByName("level_node")
	slot0.level_txt_icon = slot0.container:getChildByName("level_txt_icon")
	slot0.tips_node = slot0.container:getChildByName("tips_node")
	slot0.tab_container = slot0.top_panel:getChildByName("tab_container")

	for slot5 = 1, 2 do
		if slot0.tab_container:getChildByName("tab_btn_" .. slot5) then
			slot7 = {
				select_bg = slot6:getChildByName("select_bg")
			}

			slot7.select_bg:setVisible(true)

			slot7.unselect_bg = slot6:getChildByName("unselect_bg")
			slot7.tab_btn = slot6
			slot7.index = slot5
			slot0.tab_list[slot5] = slot7
		end
	end

	slot0.match_time = createRichLabel(22, cc.c4b(255, 248, 191, 255), cc.p(0.5, 0.5), cc.p(360, -21), nil, , 600)

	slot0.top_panel:addChild(slot0.match_time)

	slot0.king_match_time = createRichLabel(22, cc.c4b(255, 248, 191, 255), cc.p(0.5, 0.5), cc.p(360, -60), nil, , 600)

	slot0.top_panel:addChild(slot0.king_match_time)

	slot0.match_btn = slot0.bottom_panel:getChildByName("match_btn")
	slot0.match_btn_icon = slot0.match_btn:getChildByName("icon")
	slot0.match_btn_label = slot0.match_btn:getChildByName("label")

	slot0.match_btn_label:setString(TI18N("进入匹配"))

	slot0.goto_btn = slot0.bottom_panel:getChildByName("goto_btn")
	slot0.goto_btn_label = slot0.goto_btn:getChildByName("label")

	slot0.match_btn:setVisible(false)
	slot0.goto_btn:setVisible(false)

	slot2 = slot0.bottom_panel:getChildByName("panel")
	slot0.panel = slot2
	slot0.my_rank_label = createRichLabel(22, cc.c4b(255, 248, 191, 255), cc.p(0, 0.5), cc.p(506, 234), nil, , 600)

	slot2:addChild(slot0.my_rank_label)

	slot0.receive_btn = slot2:getChildByName("receive_btn")
	slot0.receive_btn_label = slot0.receive_btn:getChildByName("label")

	slot0.receive_btn_label:setString(TI18N("领取"))

	slot0.current_tips = slot2:getChildByName("current_tips")
	slot0.level_up_tips = slot2:getChildByName("level_up_tips")
	slot0.next_level_tips = slot2:getChildByName("next_level_tips")
	slot0.cool_time = createRichLabel(20, cc.c4b(255, 248, 191, 255), cc.p(0.5, 0.5), cc.p(360, 215), nil, , 600)

	slot0.bottom_panel:addChild(slot0.cool_time)

	slot0.item_scrollview = slot2:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)
	slot0.item_scrollview:setSwallowTouches(false)

	slot0.leve_up_node = slot2:getChildByName("leve_up_node")
	slot0.reward_label = createRichLabel(22, cc.c4b(255, 248, 191, 255), cc.p(0, 0.5), cc.p(53, 391), nil, , 600)

	slot2:addChild(slot0.reward_label)

	slot3 = slot2:getChildByName("buy_panel")

	slot3:getChildByName("key"):setString(TI18N("匹配次数:"))

	slot0.buy_count = slot3:getChildByName("label")
	slot0.buy_btn = slot3:getChildByName("add_btn")
	slot0.buy_tips = createRichLabel(20, cc.c4b(255, 248, 191, 255), cc.p(0.5, 0.5), cc.p(566, 126), nil, , 600)

	slot2:addChild(slot0.buy_tips)

	slot0.bule_tips = createLabel(20, cc.c4b(76, 177, 255, 255), cc.c4b(0, 0, 0, 255), slot0.level_up_tips:getPositionX(), 465, "", slot2, 2, cc.p(0.5, 0.5))

	slot0.bule_tips:setString(TI18N("蓝条部分为降级缓冲经验"))
	slot0.bule_tips:setVisible(false)
	slot0:adaptationScreen()
end

function ElitematchMainWindow.adaptationScreen(slot0)
	slot2 = display.getBottom(slot0.container)
	slot3 = display.getLeft(slot0.container)
	slot4 = display.getRight(slot0.container)

	slot0.top_panel:setPositionY(display.getTop(slot0.container) - (slot0.container_size.height - slot0.top_panel:getPositionY()))
	slot0.bottom_panel:setPositionY(slot2 + slot0.bottom_panel:getPositionY())
	slot0.close_btn:setPositionY(slot2 + slot0.close_btn:getPositionY())
end

function ElitematchMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.rule_btn, handler(slot0, slot0.onClickRuleBtn), true, 1)
	registerButtonEventListener(slot0.form_btn, handler(slot0, slot0.onClickFormBtn), true, 1)
	registerButtonEventListener(slot0.record_btn, handler(slot0, slot0.onClickRecordBtn), true, 1)
	registerButtonEventListener(slot0.challenge_btn, handler(slot0, slot0.onClickChallengeBtn), true, 1)
	registerButtonEventListener(slot0.shop_btn, handler(slot0, slot0.onClickShopBtn), true, 1)
	registerButtonEventListener(slot0.elite_btn, handler(slot0, slot0.onClickEliteBtn), true, 1)
	registerButtonEventListener(slot0.personal_btn, handler(slot0, slot0.onClicPersonalBtn), true, 1)
	registerButtonEventListener(slot0.declaration_btn, handler(slot0, slot0.onClicDeclarationBtn), true, 1)
	registerButtonEventListener(slot0.detail_btn, handler(slot0, slot0.onClicDetailBtn), true, 1)
	registerButtonEventListener(slot0.buy_btn, handler(slot0, slot0.onClickBuyCountBtn), true, 1)
	registerButtonEventListener(slot0.match_btn, handler(slot0, slot0.onClickMatchBtn), true, 1)
	registerButtonEventListener(slot0.goto_btn, handler(slot0, slot0.onClickGotoBtn), true, 1)

	slot5 = true

	registerButtonEventListener(slot0.orderaction_btn, handler(slot0, slot0.onClickOrderactionBtn), slot5, 1)

	function slot4(slot0, slot1)
		if not uv0.show_data then
			return
		end

		if uv0.show_data.flag ~= 1 then
			return
		end

		customClickAction(slot0, slot1, scale)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:onClickReceiveBtn()
		end
	end

	slot0.receive_btn:addTouchEventListener(slot4)

	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end

	slot0:addGlobalEvent(ElitematchEvent.Get_Elite_Main_Info_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0.is_sending = false

		uv0:setData(slot0)
	end)
	slot0:addGlobalEvent(ElitematchEvent.Elite_Challenge_count_Event, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.scdata then
			return
		end

		uv0.scdata.day_combat_count = slot0.day_combat_count

		uv0:updateBuyCount(slot0.day_combat_count)
		uv1:checkRedPoint(true)
	end)
	slot0:addGlobalEvent(ElitematchEvent.Elite_buy_count_Event, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.scdata then
			return
		end

		uv0.scdata.day_buy_count = slot0.day_buy_count
		uv0.scdata.day_combat_count = slot0.day_combat_count

		uv0:updateBuyCount(slot0.day_combat_count)
		uv1:checkRedPoint(true)
	end)
	slot0:addGlobalEvent(ElitematchEvent.Elite_Receive_Reward_Event, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.scdata then
			return
		end

		uv0.scdata.lev_reward = slot0.lev_reward

		uv0:updateCommonInfo()
		uv1:checkRedPoint(true)
	end)
	slot0:addGlobalEvent(ElitematchEvent.Elite_Start_Time_Event, function (slot0)
		if not slot0 then
			return
		end

		if uv0.is_record_one then
			uv0.fight_data = slot0
			uv0.is_record_one = false
		end

		if not uv0.scdata then
			return
		end

		if uv0.scdata.state == 0 then
			return
		end

		uv0:updateMatchBtn(slot0)
		uv0:changeSelectedTab(uv0.match_type, true)
	end)
	slot0:addGlobalEvent(ElitematchEvent.Elite_OrderAction_Init_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:updateOrderactionBtn(slot0.rmb_status)
		uv0:updateOrderactionRed()
	end)
	slot0:addGlobalEvent(ElitematchEvent.Elite_OrderAction_First_Red_Event, function ()
		uv0:updateOrderactionRed()
	end)
end

function ElitematchMainWindow.onClickCloseBtn(slot0)
	uv0:openElitematchMainWindow(false)
end

function ElitematchMainWindow.onClickRuleBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		return
	end

	MainuiController:getInstance():openCommonExplainView(true, Config.ArenaEliteData.data_explain)
end

function ElitematchMainWindow.onClickEliteBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		return
	end

	MainuiController:getInstance():openCommonExplainView(true, Config.ArenaEliteData.data_explain2, TI18N("段位说明"))
end

function ElitematchMainWindow.onClicPersonalBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		return
	end

	uv0:openElitematchPersonalInfoPanel(true, slot0.scdata.period)
end

function ElitematchMainWindow.onClicDeclarationBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		return
	end

	uv0:openElitematchDeclarationPanel(true)
end

function ElitematchMainWindow.onClicDetailBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		return
	end

	uv0:openElitematchRewardPanel(true, 1, slot0.scdata.lev, slot0.scdata.rank)
end

function ElitematchMainWindow.onClickFormBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		return
	end

	slot1 = nil

	HeroController:getInstance():openFormMainWindow(true, PartnerConst.Fun_Form.EliteMatch, {
		match_type = slot0.scdata.is_king == 1 and 2 or 1
	})
end

function ElitematchMainWindow.onClickRecordBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		return
	end

	if slot0.scdata.period - 1 <= 0 then
		slot1 = 1
	end

	uv0:openElitematchHistoryRecordWindow(true, slot1, slot0.scdata.period, slot0.scdata.zone_id)
end

function ElitematchMainWindow.onClickChallengeBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		return
	end

	uv0:openElitematchFightRecordPanel(true, 1, slot0.scdata.lev)
end

function ElitematchMainWindow.onClickShopBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		return
	end

	MallController:getInstance():openMallPanel(true, MallConst.MallType.EliteShop)
end

function ElitematchMainWindow.onClickReceiveBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		return
	end

	if slot0.show_data and slot0.show_data.flag == 1 then
		uv0:sender24915(slot0.show_data.lev)
	end
end

function ElitematchMainWindow.onClickBuyCountBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		return
	end

	if Config.ArenaEliteData.data_elite_const.match_count then
		if Config.ArenaEliteData.data_elite_buy[slot0.scdata.day_buy_count + 1] == nil then
			message(TI18N("购买次数已达上限"))

			return
		end

		if slot2.need_vip > 0 then
			if RoleController:getInstance():getRoleVo() and slot3.vip_lev < slot2.need_vip then
				message(uv0(TI18N("需要vip%s才能购买"), slot2.need_vip))

				return
			end

			if slot3 == nil then
				return
			end
		end

		CommonAlert.show(uv0(TI18N("是否花费<img src='%s' scale=0.3 />%s购买一次匹配次数？"), PathTool.getItemRes(Config.ItemData.data_get_data(slot2.cost[1][1]).icon), slot2.cost[1][2], slot1.val), TI18N("确定"), function ()
			uv0:sender24904()
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	end
end

function ElitematchMainWindow.onClickMatchBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		message(TI18N("敬请期待下赛季"))

		return
	end

	slot1 = setting or {}
	slot1.match_type = slot0.tab_object.index
	slot1.scdata = slot0.scdata

	MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.EliteMatchWar, slot1)
end

function ElitematchMainWindow.onClickGotoBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		message(TI18N("敬请期待下赛季"))

		return
	end

	if not slot0.tab_object then
		return
	end

	if slot0.scdata.state ~= 3 then
		if slot0.tab_object.index == ElitematchConst.MatchType.eKingMatch then
			slot0:changeSelectedTab(ElitematchConst.MatchType.eNormalMatch)

			return
		end
	elseif slot0.tab_object.index == ElitematchConst.MatchType.eKingMatch then
		if slot0.scdata.is_king ~= 1 then
			slot0:changeSelectedTab(ElitematchConst.MatchType.eNormalMatch)

			return
		end
	elseif slot0.scdata.is_king == 1 then
		slot0:changeSelectedTab(ElitematchConst.MatchType.eKingMatch)

		return
	end
end

function ElitematchMainWindow.onClickOrderactionBtn(slot0)
	uv0:openElitematchOrderactionWindow(true)
end

function ElitematchMainWindow.changeSelectedTab(slot0, slot1, slot2)
	if not slot2 and slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)

		slot0.tab_object = nil
	end

	slot0.match_type = slot1
	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)
	end

	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		return
	end

	if slot1 == ElitematchConst.MatchType.eNormalMatch then
		slot0:setBackgroundImg("elitematch_main_bg")

		if slot0.scdata.state ~= 3 then
			slot0.tips_node:setVisible(false)
			slot0.level_node:setVisible(true)
			slot0.level_txt_icon:setVisible(true)
			slot0.panel:setVisible(true)
			slot0:setMatchBtnStatus(true, false)
			slot0.current_tips:setString("")
		else
			slot0.tips_node:setVisible(false)
			slot0.level_node:setVisible(true)
			slot0.level_txt_icon:setVisible(true)
			slot0.panel:setVisible(true)

			if slot0.scdata.is_king == 1 then
				slot0:setMatchBtnStatus(false, true, TI18N("前往王者赛"))
				slot0.current_tips:setString(TI18N("你已进入王者赛阶段, 请前往参与王者赛!"))
			else
				slot0:setMatchBtnStatus(true, false)
				slot0.current_tips:setString("")
			end
		end
	elseif slot1 == ElitematchConst.MatchType.eKingMatch then
		slot0:setBackgroundImg("elitematch_matching_bg")

		if slot0.scdata.state ~= 3 then
			slot0.tips_node:setVisible(true)
			slot0.level_node:setVisible(false)
			slot0.level_txt_icon:setVisible(false)
			slot0.panel:setVisible(false)
			slot0:setMatchBtnStatus(false, true, TI18N("前往常规赛"))
		elseif slot0.scdata.is_king == 1 then
			slot0.tips_node:setVisible(false)
			slot0.level_node:setVisible(true)
			slot0.level_txt_icon:setVisible(true)
			slot0.panel:setVisible(true)
			slot0:setMatchBtnStatus(true, false)
			slot0.current_tips:setString(TI18N("你已进入王者赛,战斗改变为两队伍的车轮战模式"))
		else
			slot0.tips_node:setVisible(true)
			slot0.level_node:setVisible(false)
			slot0.level_txt_icon:setVisible(false)
			slot0.panel:setVisible(false)
			slot0:setMatchBtnStatus(false, true, TI18N("前往常规赛"))
		end
	end
end

function ElitematchMainWindow.setBackgroundImg(slot0, slot1)
	if slot0.record_bg_res ~= PathTool.getPlistImgForDownLoad("bigbg/elitematch", slot1, true) then
		slot0.record_bg_res = slot2
		slot0.item_load_bg = loadImageTextureFromCDN(slot0.background, slot2, ResourcesType.single, slot0.item_load_bg)
	end
end

function ElitematchMainWindow.setMatchBtnStatus(slot0, slot1, slot2, slot3)
	if slot0.is_open then
		slot0.match_btn:setVisible(slot1 == true)
		slot0.goto_btn:setVisible(slot2 == true)

		if slot3 then
			slot0.goto_btn_label:setString(slot3)
		end
	else
		slot0.match_btn:setVisible(false)
		slot0.goto_btn:setVisible(false)
	end
end

function ElitematchMainWindow.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.match_type = slot2.match_type or ElitematchConst.MatchType.eNormalMatch
	slot0.is_open_match = slot2.is_open_match
	slot0.is_sending = true

	uv0:sender24905()
	uv0:sender24900()

	if match_type == nil then
		slot0.auto_choice = true
	end
end

function ElitematchMainWindow.setData(slot0, slot1)
	slot0.scdata = uv0:getSCData()

	slot0:updateBuyCount()

	if slot0.scdata.state == 0 then
		slot0:updateNotCanMatchIngInfo({
			"很遗憾",
			"本赛季无法参与",
			"敬请期待下赛季"
		})

		return
	end

	if slot0.fight_data then
		slot0:updateMatchBtn(slot0.fight_data)

		slot0.fight_data = nil
	end

	if slot0.auto_choice then
		slot0.auto_choice = false

		if slot0.scdata.is_king == 1 then
			slot0.match_type = ElitematchConst.MatchType.eKingMatch
		end
	end

	slot0:changeSelectedTab(slot0.match_type, true)
	slot0:updateOrderactionBtn(uv0:getGiftStatus())
	slot0:updateOrderactionRed()

	if not slot0:checkConditionInfo() then
		return
	end

	slot0:updateTimeInfo()
	slot0:updateCommonInfo()

	if slot0.scdata.state ~= 3 then
		slot0:updateNormalInfo()
		slot0:updateNotCanMatchIngInfo({
			"王者赛未开启",
			"请留意上方时间"
		})
	elseif slot0.scdata.is_king == 1 then
		slot0:updateKingInfo()
	else
		slot0:updateNormalInfo()
		slot0:updateNotCanMatchIngInfo({
			"提升至“超凡王者”段位",
			"可参与王者赛",
			"(πvπ)"
		})
	end

	slot2 = nil

	slot0.my_rank_label:setString((slot0.scdata.rank ~= 0 or string.format(TI18N("<div outline=2,#000000>%s</div>"), TI18N("我的排名:暂未上榜"))) and string.format(TI18N("<div outline=2,#000000>%s</div><div fontcolor=#3df424 outline=2,#000000>%s</div>"), TI18N("我的排名:"), slot0.scdata.rank))

	if slot0.is_open_match then
		slot0:onClickMatchBtn()
	end
end

function ElitematchMainWindow.updateOrderactionBtn(slot0, slot1)
	if tolua.isnull(slot0.orderaction_btn) then
		return
	end

	if slot1 == 1 then
		slot0.orderaction_btn:loadTexture(PathTool.getResFrame("elitematch", "elitematch_40"), LOADTEXT_TYPE_PLIST)
	else
		slot0.orderaction_btn:loadTexture(PathTool.getResFrame("elitematch", "elitematch_40"), LOADTEXT_TYPE_PLIST)
	end
end

function ElitematchMainWindow.updateOrderactionRed(slot0)
	if tolua.isnull(slot0.orderaction_btn) then
		return
	end

	if uv0:getOrderactionRedpoint() == true then
		addRedPointToNodeByStatus(slot0.orderaction_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.orderaction_btn, false, 5, 5)
	end
end

function ElitematchMainWindow.updateMatchBtn(slot0, slot1)
	slot3 = slot1.end_time
	slot0.is_open = slot1.state == 1

	if slot0.is_open then
		slot0.cool_time:setString("")
	else
		slot0:setOpenTime(slot3)
	end
end

function ElitematchMainWindow.setOpenTime(slot0, slot1)
	if tolua.isnull(slot0.cool_time) then
		return
	end

	slot0.cool_time:stopAllActions()

	if (slot1 or 0) > 0 then
		slot0:setCoolTimeFormatString(slot2)
		slot0.cool_time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.cool_time:stopAllActions()
			else
				uv1:setCoolTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setCoolTimeFormatString(slot2)
	end
end

function ElitematchMainWindow.setCoolTimeFormatString(slot0, slot1)
	if slot0.is_open then
		return
	end

	slot0.cool_time:setString(string.format(TI18N("<div fontcolor=#3df424 outline=2,#000000>%s</div><div outline=2,#000000>%s</div>"), TimeTool.GetTimeDayOrTime(slot1), TI18N("后开启")))
end

function ElitematchMainWindow.updateTimeInfo(slot0)
	if not slot0.scdata then
		return
	end

	slot2 = ""

	if Config.ArenaEliteData.data_zone_fun(slot0.scdata.zone_id) then
		slot2 = uv0(TI18N("(%s赛区)"), slot1.name)
	end

	slot3 = GameNet:getInstance():getTime()

	slot0.match_time:setString(uv0(TI18N("<div outline=2,#000000>S%s赛季%s时间: </div><div fontcolor=#3df424 outline=2,#000000>%s-%s</div>"), slot0.scdata.period, slot2, TimeTool.getMD2(slot0.scdata.start_time), TimeTool.getMD2(slot0.scdata.end_time - 10)))

	if slot0.scdata.state == 1 then
		slot0.match_time_str1 = TI18N("当前为上半赛季,")
		slot0.match_time_str2 = TI18N("后开启下半赛季")
	elseif slot0.scdata.state == 2 then
		slot0.match_time_str1 = TI18N("当前为下半赛季,")
		slot0.match_time_str2 = TI18N("后开启王者赛")
	elseif slot0.scdata.state == 3 then
		slot0.match_time_str1 = TI18N("当前为下半赛季(已开王者赛),")
		slot0.match_time_str2 = TI18N("后结束本赛季")
	else
		return
	end

	slot0:setLessTime(slot0.scdata.state_time)
end

function ElitematchMainWindow.updateBuyCount(slot0)
	if Config.ArenaEliteData.data_elite_const.match_count then
		slot0.buy_count:setString(uv0("%s/%s", slot0.scdata.day_combat_count or 1, slot2.val))
	end

	addRedPointToNodeByStatus(slot0.match_btn, uv1:getMatchCountRedpoint(), 5, 5)

	if slot0.scdata.day_max_buy_count - (slot0.scdata.day_buy_count or 1) < 0 then
		slot5 = 0
	end

	slot0.buy_tips:setString(string.format(TI18N("<div outline=2,#000000>%s</div><div fontcolor=#3df424 outline=2,#000000>%s</div>"), TI18N("剩余购买次数:"), slot5))
end

function ElitematchMainWindow.updateCommonInfo(slot0)
	if Config.ArenaEliteData.data_elite_level[slot0.scdata.lev] then
		slot0:playLevelSpine(true, slot1)

		if slot0.record_txt_res ~= PathTool.getPlistImgForDownLoad("elitematch/elitematch_icon", slot1.name_ico, false) then
			slot0.record_txt_res = slot2
			slot0.item_load1 = loadSpriteTextureFromCDN(slot0.level_txt_icon, slot2, ResourcesType.single, slot0.item_load1)
		end
	end

	function slot5(slot0, slot1)
		return slot0.lev < slot1.lev
	end

	uv0(slot0.scdata.lev_reward, slot5)

	slot0.show_data = nil

	for slot5, slot6 in ipairs(slot0.scdata.lev_reward) do
		if slot6.flag == 1 then
			slot0.show_data = slot6

			break
		end
	end

	if slot0.show_data == nil then
		for slot5, slot6 in ipairs(slot0.scdata.lev_reward) do
			if slot6.flag == 0 then
				slot0.show_data = slot6

				break
			end
		end
	end

	if slot0.show_data == nil then
		slot0.show_data = slot0.scdata.lev_reward[#slot0.scdata.lev_reward]
	end

	if Config.ArenaEliteData.data_elite_level[slot0.show_data.lev] then
		slot0.reward_label:setString(uv1("<div outline=2,#000000>%s</div><div fontcolor=#ffb400 outline=2,#000000>\"%s\"</div><div outline=2,#000000>%s</div>", TI18N("本赛季首次达到 "), slot2.name, TI18N(" 可得如下奖励")))

		slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot2.lev_award, {
			scale = 0.8,
			max_count = 4
		})

		if slot0.show_data.flag == 0 then
			slot0.receive_btn_label:setString("领取")
			slot0.receive_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
			setChildUnEnabled(true, slot0.receive_btn)
			addRedPointToNodeByStatus(slot0.receive_btn, false, 5, 5)
		elseif slot0.show_data.flag == 1 then
			slot0.receive_btn_label:setString("领取")
			slot0.receive_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
			setChildUnEnabled(false, slot0.receive_btn)
			addRedPointToNodeByStatus(slot0.receive_btn, true, 5, 5)
		else
			slot0.receive_btn_label:setString("已领取")
			slot0.receive_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
			setChildUnEnabled(false, slot0.receive_btn)
			addRedPointToNodeByStatus(slot0.receive_btn, false, 5, 5)
		end
	end
end

function ElitematchMainWindow.playLevelSpine(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.level_spine then
			slot0.level_spine:clearTracks()
			slot0.level_spine:removeFromParent()

			slot0.level_spine = nil
		end
	else
		if not slot2 then
			return
		end

		if slot0.level_spine_record == nil or slot0.level_spine_record ~= slot2.ico then
			slot0.level_spine_record = slot2.ico

			slot0:playLevelSpine(false)

			slot0.level_spine = createEffectSpine(slot2.ico, cc.p(0, 0), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.level_node:addChild(slot0.level_spine, 1)
		end
	end
end

function ElitematchMainWindow.updateNormalInfo(slot0)
	if not Config.ArenaEliteData.data_elite_level[slot0.scdata.lev] then
		return
	end

	if Config.ArenaEliteData.data_elite_level[slot1.next_id] then
		slot0.next_level_tips:setString(uv0(TI18N("下一段位: %s"), slot2.name))
	else
		slot0.next_level_tips:setString("")
	end

	if #slot0.scdata.promoted_info > 0 then
		slot0:showProgressbar(false)
		slot0.bule_tips:setVisible(false)
		slot0.level_up_tips:setVisible(true)

		slot3 = slot1.promoted_info[1] or 1

		slot0.level_up_tips:setString(uv0(TI18N("%s局%s胜后升段"), slot3, slot1.promoted_info[2] or 1))
		slot0:showLevelUpUI(true, slot3)
	else
		slot0.level_up_tips:setVisible(false)

		if slot1.init_exp > 0 then
			slot0.bule_tips:setVisible(true)
		else
			slot0.bule_tips:setVisible(false)
		end

		slot3, slot4, slot5 = nil
		slot6 = slot1.init_exp + slot1.need_exp

		if slot0.scdata.score >= 0 then
			slot3 = (slot0.scdata.score + slot1.init_exp) * 100 / slot6
			slot5 = slot1.init_exp * 100 / slot6
			slot4 = uv0("%s/%s", slot0.scdata.score, slot1.need_exp)
		else
			slot3 = 0
			slot7 = slot1.init_exp + slot0.scdata.score
			slot5 = slot7 * 100 / slot1.need_exp
			slot4 = slot7
		end

		slot0:showProgressbar(true, slot3, slot5, slot4)
		slot0:showLevelUpUI(false)
	end
end

function ElitematchMainWindow.updateKingInfo(slot0)
	slot0:updateNormalInfo()
end

function ElitematchMainWindow.showProgressbar(slot0, slot1, slot2, slot3, slot4)
	if not slot0.leve_up_node then
		return
	end

	if slot1 then
		slot5 = cc.size(160, 19)

		if not slot0.comp_bar then
			slot7 = PathTool.getResFrame("common", "common_90006")
			slot0.camp_bar_record_res = slot7
			slot9, slot0.comp_bar = createLoadingBar(PathTool.getResFrame("common", "common_90005"), slot7, slot5, slot0.leve_up_node, cc.p(0.5, 0.5), 0, 0, true, true)
			slot0.comp_bar_bg = slot9
			slot11 = ccui.LoadingBar:create()

			slot11:setAnchorPoint(cc.p(0, 0.5))
			slot11:setScale9Enabled(true)
			slot11:setCascadeOpacityEnabled(true)
			slot11:loadTexture(PathTool.getResFrame("common", "common_90082"), LOADTEXT_TYPE_PLIST)
			slot11:setContentSize(cc.size(slot5.width - 4, slot5.height - 4))
			slot11:setPosition(cc.p(1, slot5.height / 2))
			slot9:addChild(slot11)

			slot0.comp_bar_blue = slot11
		end

		if not slot0.comp_bar_label then
			slot0.comp_bar_label = createLabel(16, cc.c3b(255, 255, 255), cc.c3b(0, 0, 0), slot5.width / 2, slot5.height / 2, "", slot0.comp_bar, 2, cc.p(0.5, 0.5))
		end

		slot0.comp_bar_bg:setVisible(true)
		slot0.comp_bar:setPercent(slot2)
		slot0.comp_bar_blue:setPercent(slot3)
		slot0.comp_bar_label:setString(slot4)
	elseif slot0.comp_bar_bg then
		slot0.comp_bar_bg:setVisible(false)
	end
end

function ElitematchMainWindow.showLevelUpUI(slot0, slot1, slot2)
	if slot0.level_up_item_list then
		for slot6, slot7 in ipairs(slot0.level_up_item_list) do
			slot7.bg:setVisible(false)
		end
	end

	if slot1 then
		if slot0.level_up_item_list == nil then
			slot0.level_up_item_list = {}
		end

		slot3 = 50
		slot4 = -slot3 * slot2 * 0.5 + slot3 * 0.5
		slot5 = {
			[slot10.count] = slot10.flag
		}

		for slot9, slot10 in ipairs(slot0.scdata.promoted_info) do
			-- Nothing
		end

		for slot9 = 1, slot2 do
			if slot0.level_up_item_list[slot9] == nil then
				slot0.level_up_item_list[slot9] = slot0:createLevelUpItem(slot4 + (slot9 - 1) * slot3, 0)
			else
				slot0.level_up_item_list[slot9].bg:setPositionX(slot10)
			end

			slot0.level_up_item_list[slot9].bg:setVisible(true)

			if slot5[slot9] == nil or slot5[slot9] == 0 then
				slot0.level_up_item_list[slot9].icon:setVisible(false)
				slot0.level_up_item_list[slot9].mask_icon:setVisible(false)
			else
				slot0.level_up_item_list[slot9].icon:setVisible(true)
				slot0.level_up_item_list[slot9].mask_icon:setVisible(true)

				if slot5[slot9] == 1 then
					setChildUnEnabled(false, slot0.level_up_item_list[slot9].icon)
					loadSpriteTexture(slot0.level_up_item_list[slot9].mask_icon, PathTool.getResFrame("elitematch", "txt_cn_elitematch_15"), LOADTEXT_TYPE_PLIST)
				else
					setChildUnEnabled(true, slot0.level_up_item_list[slot9].icon)
					loadSpriteTexture(slot0.level_up_item_list[slot9].mask_icon, PathTool.getResFrame("elitematch", "txt_cn_elitematch_16"), LOADTEXT_TYPE_PLIST)
				end
			end
		end
	end
end

function ElitematchMainWindow.createLevelUpItem(slot0, slot1, slot2)
	if not slot0.leve_up_node then
		return
	end

	slot3 = {
		bg = createSprite(PathTool.getResFrame("elitematch", "elitematch_14"), slot1, slot2, slot0.leve_up_node, cc.p(0.5, 0.5))
	}
	slot5 = slot3.bg:getContentSize()
	slot3.icon = createSprite(PathTool.getResFrame("elitematch", "elitematch_12"), slot5.width * 0.5, slot5.height * 0.5, slot3.bg, cc.p(0.5, 0.5))
	slot3.mask_icon = createSprite(PathTool.getResFrame("elitematch", "txt_cn_elitematch_15"), 35, 36, slot3.bg, cc.p(0.5, 0.5))

	return slot3
end

function ElitematchMainWindow.updateNotCanMatchIngInfo(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.tips_label_list == nil then
		slot0.tips_label_list = {}
	end

	for slot5, slot6 in ipairs(slot0.tips_label_list) do
		slot6:setVisible(false)
	end

	slot2 = 24

	for slot7, slot8 in ipairs(slot1) do
		if slot0.tips_label_list[slot7] == nil then
			slot0.tips_label_list[slot7] = createLabel(22, cc.c4b(255, 248, 191, 255), nil, 0, #slot1 * slot2 * 0.5 - slot2 * 0.5 - slot2 * (slot7 - 1), "", slot0.tips_node, 2, cc.p(0.5, 0.5))
		else
			slot0.tips_label_list[slot7]:setPositionY(slot9)
		end

		slot0.tips_label_list[slot7]:setString(TI18N(slot8))
	end
end

function ElitematchMainWindow.checkConditionInfo(slot0)
	if not Config.ArenaEliteData.data_elite_const.open_world_lev_limit then
		return false
	end

	if not Config.ArenaEliteData.data_elite_const.open_person_lev_limit then
		return false
	end

	if not RoleController:getInstance():getRoleVo() then
		return false
	end

	slot4 = slot3.lev
	slot6 = true
	slot7 = {
		[slot8] = uv0(TI18N("世界等级需要达到%s级"), slot1.val)
	}

	if RoleController:getInstance():getModel():getWorldLev() < slot1.val then
		slot6 = false
		slot8 = 1 + 1
	end

	if slot4 < slot2.val then
		slot7[slot8] = uv0(TI18N("个人等级需要达到%s级"), slot2.val)
		slot6 = false
	end

	if not slot6 then
		slot0:updateNotCanMatchIngInfo(slot7)
	end

	return slot6
end

function ElitematchMainWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.king_match_time) then
		return
	end

	slot0.king_match_time:stopAllActions()

	if (slot1 or 0) > 0 then
		slot0:setTimeFormatString(slot2)
		slot0.king_match_time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.king_match_time:stopAllActions()
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot2)
	end
end

function ElitematchMainWindow.setTimeFormatString(slot0, slot1)
	slot0.king_match_time:setString(string.format(TI18N("<div outline=2,#000000>%s</div><div fontcolor=#3df424 outline=2,#000000>%s</div><div outline=2,#000000>%s</div>"), slot0.match_time_str1, TimeTool.GetTimeForFunction(slot1), slot0.match_time_str2))

	if slot1 <= 0 and not slot0.is_sending then
		slot0.is_sending = true
	end
end

function ElitematchMainWindow.close_callback(slot0)
	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	if slot0.item_load_bg then
		slot0.item_load_bg:DeleteMe()
	end

	slot0.item_load_bg = nil

	if slot0.item_load1 then
		slot0.item_load1:DeleteMe()
	end

	slot0.item_load1 = nil

	slot0.cool_time:stopAllActions()
	slot0.king_match_time:stopAllActions()
	uv0:openElitematchMainWindow(false)
end
