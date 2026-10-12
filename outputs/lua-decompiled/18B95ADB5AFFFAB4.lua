slot1 = CrosschampionController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
CrosschampionMainWindow = CrosschampionMainWindow or BaseClass(BaseView)

function CrosschampionMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.layout_name = "crosschampion/crosschampion_main_window"
	slot0.win_type = WinType.Full
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("crosschampion", "crosschampion"),
			type = ResourcesType.plist
		}
	}
	slot0.background_path = string.format("resource/bigbg/battle_bg/%s/b_bg.jpg", BattleController:getInstance():curBattleResId(BattleConst.Fight_Type.CrossChampion))

	table.insert(slot0.res_list, {
		path = slot0.background_path,
		type = ResourcesType.single
	})

	slot0.statue_list = {}
	slot0.cross_open_status = 0
end

function CrosschampionMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(slot0.background_path, LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("worship"):setString(TI18N("被膜拜次数:"))

	slot2 = slot1:getChildByName("tab_container")
	slot3 = slot1:getChildByName("stage_panel")
	slot0.rank_btn = slot3:getChildByName("rank_btn")

	slot0.rank_btn:getChildByName("label"):setString(TI18N("排行榜"))

	slot0.shop_btn = slot3:getChildByName("shop_btn")

	slot0.shop_btn:getChildByName("label"):setString(TI18N("冠军商城"))

	slot0.guess_btn = slot3:getChildByName("guess_btn")
	slot7 = TI18N

	slot0.guess_btn:getChildByName("label"):setString(slot7("我的布阵"))
	UITool.SetTitleColor(slot0.guess_btn:getChildByName("label"))

	for slot7 = 1, 3 do
		if slot1:getChildByName("statue_" .. slot7) then
			slot9 = {
				model = slot8:getChildByName("model"),
				role_name = slot8:getChildByName("role_name"),
				desc = slot8:getChildByName("desc")
			}

			slot9.desc:setString(TI18N("虚位以待"))

			slot9.worship_btn = slot8:getChildByName("worship_btn")
			slot9.worship_label = slot9.worship_btn:getChildByName("label")
			slot9.size = slot9.model:getContentSize()
			slot9.index = slot7

			uv0(slot0.statue_list, slot9)
		end
	end

	slot0.my_worship_num = slot1:getChildByName("worship_num")

	slot0.my_worship_num:setString(RoleController:getInstance():getRoleVo().cross_cham_worship or 0)

	slot5 = slot1:getChildByName("dec_container")
	slot0.dec_container = slot5
	slot0.tips_btn = slot5:getChildByName("tips_btn")
	slot0.my_rank_lable = slot5:getChildByName("my_rank_lable")
	slot0.my_total_rank = slot5:getChildByName("my_total_rank")
	slot0.notice_label = slot5:getChildByName("notice_label")

	slot0.notice_label:setString(TI18N("跨服天梯前256名可参与，奖励将通过邮件发放"))
	slot5:getChildByName("label_1"):setString(TI18N("当前赛程:"))
	slot5:getChildByName("label_2"):setString(TI18N("当前排名:"))
	slot5:getChildByName("label_3"):setString(TI18N("历史最高排名:"))
	slot5:getChildByName("label_4"):setString(TI18N("赛季时间:"))
	slot5:getChildByName("label_5"):setString(TI18N("系统提示:"))

	slot0.match_step = createRichLabel(24, 1, cc.p(0, 0.5), cc.p(163, 175), nil, nil, 560)

	slot5:addChild(slot0.match_step)

	slot0.match_desc = createRichLabel(24, 1, cc.p(0, 0.5), cc.p(163, 66), nil, nil, 560)

	slot5:addChild(slot0.match_desc)

	slot6 = slot1:getChildByName("btn_container")
	slot0.close_btn = slot6:getChildByName("close_btn")
	slot0.enter_btn = slot6:getChildByName("enter_btn")

	slot0.enter_btn:getChildByName("label"):setString(TI18N("进入挑战"))
	slot2:setPositionY(display.getTop(slot1) - 174)
	slot6:setPositionY(display.getBottom(slot1) + 138)
end

function CrosschampionMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.rank_btn, handler(slot0, slot0._onClickRankBtn), true)
	registerButtonEventListener(slot0.shop_btn, handler(slot0, slot0._onClickShopBtn), true)
	registerButtonEventListener(slot0.tips_btn, handler(slot0, slot0._onClickTipsBtn), true)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickCloseBtn), true)
	registerButtonEventListener(slot0.guess_btn, handler(slot0, slot0._onClickGuessBtn), true)

	slot4 = handler(slot0, slot0._onClickEnterBtn)
	slot5 = true

	registerButtonEventListener(slot0.enter_btn, slot4, slot5)

	for slot4, slot5 in pairs(slot0.statue_list) do
		slot5.worship_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.data ~= nil then
					RoleController:getInstance():requestWorshipRole(uv0.data.rid, uv0.data.srv_id, uv1, WorshipType.crosschampion)
				end
			end
		end)
	end

	slot0:addGlobalEvent(ArenaEvent.UpdateChampionRoleInfoEvent, function ()
		uv0:setRoleInfo()
	end)
	slot0:addGlobalEvent(ArenaEvent.UpdateChampionBaseInfoEvent, function ()
		uv0:setBaseInfo()
	end)
	slot0:addGlobalEvent(CrosschampionEvent.UpdateChampionTop3Event, function (slot0)
		uv0:updateStatueInfo(slot0)
	end)
	slot0:addGlobalEvent(RoleEvent.WorshipOtherRole, function (slot0, slot1, slot2)
		if slot2 ~= nil and uv0.statue_list[slot2] ~= nil and slot3.worship_label ~= nil and slot3.worship_num ~= nil then
			slot3.worship_num = slot3.worship_num + 1

			slot3.worship_label:setString(slot3.worship_num)
			slot3.worship_btn:setTouchEnabled(false)
			setChildUnEnabled(true, slot3.worship_btn, Config.ColorData.data_color4[1])
			slot3.worship_label:enableOutline(cc.c3b(75, 75, 75), 2)
		end
	end)
	slot0:addGlobalEvent(RoleEvent.UpdateCrossChamWorshipEvent, function (slot0)
		uv0.my_worship_num:setString(slot0 or 0)
	end)
end

function CrosschampionMainWindow._onClickRankBtn(slot0)
	ArenaController:getInstance():openArenaChampionRankWindow(true, ArenaConst.champion_type.cross)
end

function CrosschampionMainWindow._onClickShopBtn(slot0)
	uv0:openCrosschampionShopWindow(true)
end

function CrosschampionMainWindow._onClickTipsBtn(slot0)
	if Config.ArenaClusterChampionData.data_explain then
		MainuiController:getInstance():openCommonExplainView(true, Config.ArenaClusterChampionData.data_explain)
	end
end

function CrosschampionMainWindow._onClickCloseBtn(slot0)
	uv0:openCrosschampionMainWindow(false)
end

function CrosschampionMainWindow._onClickGuessBtn(slot0)
	HeroController:getInstance():openFormMainWindow(true, PartnerConst.Fun_Form.ArenaChampion)
end

function CrosschampionMainWindow._onClickEnterBtn(slot0)
	if slot0.cross_open_status == 1 then
		message(TI18N("需等待跨服天梯开启"))

		return
	elseif slot0.cross_open_status == 2 then
		slot1 = 64

		if Config.ArenaClusterChampionData.data_const.open_number_limit then
			slot1 = slot2.val
		end

		message(uv0(TI18N("参赛玩家不足%d名，本次周冠军赛无法开启"), slot1))

		return
	end

	ArenaController:getInstance():openArenaChampionMatchWindow(true, 1, ArenaConst.champion_type.cross)
end

function CrosschampionMainWindow.openRootWnd(slot0)
	uv0:sender26200()
	uv0:sender26206()
	uv0:sender26201()
	uv0:sender26213()
	RoleController:getInstance():requestCrossChamWorshipNum()
	slot0:setBaseInfo()
	slot0:updateStatueInfo()
end

function CrosschampionMainWindow.setBaseInfo(slot0)
	if not uv0:getBaseInfo() then
		return
	end

	if slot1.step == ArenaConst.champion_step.unopened then
		slot0.match_step:setString(uv1("<div fontcolor=#ff5353 outline=1,#000000>%s</div>", TI18N("暂未开启")))
	elseif slot1.step == ArenaConst.champion_step.score then
		if slot1.step_status == ArenaConst.champion_step_status.unopened then
			slot0.match_step:setString(uv1("<div outline=1,#000000>%s-</div><div fontcolor=#ff5353 outline=1,#000000>%s</div>", TI18N("选拔赛"), TI18N("暂未开启")))
		else
			slot0.match_step:setString(uv1("<div outline=1,#000000>%s-</div><div fontcolor=#4af915 outline=1,#000000>%s</div>", TI18N("选拔赛"), TI18N("正式进行")))
		end
	elseif slot1.step == ArenaConst.champion_step.match_64 then
		if slot1.step_status == ArenaConst.champion_step_status.unopened then
			slot0.match_step:setString(uv1("<div outline=1,#000000>%s-</div><div fontcolor=#ff5353 outline=1,#000000>%s</div>", TI18N("64强赛"), TI18N("暂未开启")))
		else
			slot0.match_step:setString(uv1("<div outline=1,#000000>%s-</div><div fontcolor=#4af915 outline=1,#000000>%s</div>", TI18N("64强赛"), TI18N("正在进行")))
		end
	elseif slot1.step == ArenaConst.champion_step.match_8 then
		if slot1.step_status == ArenaConst.champion_step_status.over then
			slot0.match_step:setString(uv1("<div outline=1,#000000>%s</div>", TI18N("周冠军赛已结束")))
		else
			slot0.match_step:setString(uv1("<div outline=1,#000000>%s-</div><div fontcolor=#4af915 outline=1,#000000>%s</div>", TI18N("8强赛"), TI18N("正在进行")))
		end
	end

	doStopAllActions(slot0.match_desc)

	slot0.cross_open_status = slot1.is_open or 0

	if slot1.is_open == 1 then
		slot0.match_step:setString(uv1("<div fontcolor=#ff5353 outline=1,#000000>%s</div>", TI18N("暂未开启")))
		slot0.match_desc:setString(uv1("<div fontcolor=#ff5353 outline=1,#000000>%s</div>", TI18N("暂未开启")))
	elseif slot1.is_open == 2 then
		slot2 = 64

		if Config.ArenaClusterChampionData.data_const.open_number_limit then
			slot2 = slot3.val
		end

		slot0.match_step:setString(uv1("<div outline=1,#000000>%s</div><div fontcolor=#4af915 outline=1,#000000>%d</div><div outline=1,#000000>%s</div>", TI18N("参赛玩家不足"), slot2, TI18N("名，本次周冠军赛无法开启")))
		slot0.match_desc:setString(uv1("<div fontcolor=#ff5353 outline=1,#000000>%s</div>", TI18N("暂未开启")))
	else
		if slot1.step_status_time - GameNet:getInstance():getTime() < 0 then
			slot2 = 0
		end

		slot0:setLessTime(slot1.start_time, slot1.end_time, slot2)
	end
end

function CrosschampionMainWindow.setLessTime(slot0, slot1, slot2, slot3)
	if tolua.isnull(slot0.match_desc) then
		return
	end

	doStopAllActions(slot0.match_desc)

	if slot3 > 0 then
		slot0.match_desc:setString(uv0("<div outline=1,#000000>%s-%s</div><div fontcolor=#4af915 outline=1,#000000>（剩余时间:%s）</div>", TimeTool.getMD(slot1), TimeTool.getMD(slot2), TimeTool.GetTimeFormatTwo(slot3)))
		slot0.match_desc:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.match_desc)
			else
				uv1.match_desc:setString(uv2("<div outline=1,#000000>%s-%s</div><div fontcolor=#4af915 outline=1,#000000>（剩余时间:%s）</div>", TimeTool.getMD(uv3), TimeTool.getMD(uv4), TimeTool.GetTimeFormatTwo(uv0)))
			end
		end))))
	else
		slot0.match_desc:setString(uv0("<div outline=1,#000000>%s-%s</div><div fontcolor=#4af915 outline=1,#000000>（剩余时间:%s）</div>", TimeTool.getMD(slot1), TimeTool.getMD(slot2), TimeTool.GetTimeFormatTwo(slot3)))
	end
end

function CrosschampionMainWindow.setRoleInfo(slot0)
	if not uv0:getRoleInfo() then
		return
	end

	slot3 = slot1.best_rank or 0

	if (slot1.rank or 0) == 0 then
		slot0.my_rank_lable:setString(TI18N("未上榜"))
	else
		slot0.my_rank_lable:setString(slot2)
	end

	if slot3 == 0 then
		slot0.my_total_rank:setString(TI18N("未上榜"))
	else
		slot0.my_total_rank:setString(slot3)
	end
end

function CrosschampionMainWindow.updateStatueInfo(slot0, slot1)
	slot2 = RoleController:getInstance():getRoleVo()

	for slot6, slot7 in ipairs(slot0.statue_list) do
		if (slot1 or {})[slot7.index] == nil then
			slot7.role_name:setVisible(false)
			slot7.desc:setVisible(true)
			slot7.worship_btn:setVisible(false)
		else
			slot7.role_name:setVisible(true)
			slot7.desc:setVisible(false)
			slot7.worship_btn:setVisible(true)
			slot7.role_name:setString(transformNameByServ(slot8.name, slot8.srv_id))
			slot7.worship_label:setString(slot8.worship)

			slot7.worship_num = slot8.worship

			if slot8.worship_status == TRUE or slot2:isSameRole(slot8.srv_id, slot8.rid) then
				slot7.worship_btn:setTouchEnabled(false)
				setChildUnEnabled(true, slot7.worship_btn, Config.ColorData.data_color4[1])
				slot7.worship_label:enableOutline(cc.c3b(75, 75, 75), 2)
			else
				slot7.worship_btn:setTouchEnabled(true)
				setChildUnEnabled(false, slot7.worship_btn, Config.ColorData.data_color4[175])
				slot7.worship_label:enableOutline(Config.ColorData.data_color4[277], 2)
			end
		end

		slot7.data = slot8

		delayRun(slot0.dec_container, 5 * slot6 / display.DEFAULT_FPS, function ()
			uv0:setStatueModel(uv1)
		end)
	end
end

function CrosschampionMainWindow.setStatueModel(slot0, slot1)
	if not slot1 or tolua.isnull(slot1.model) then
		return
	end

	if slot1.data == nil then
		if slot1.spine ~= nil then
			if slot1.spine ~= nil then
				slot1.spine:DeleteMe()

				slot1.spine = nil
			end

			slot1.spine_id = nil
		end

		return
	end

	if slot1.spine_id == slot2.lookid then
		return
	end

	if slot1.spine ~= nil then
		slot1.spine:DeleteMe()

		slot1.spine = nil
	end

	slot1.spine_id = slot2.lookid
	slot1.spine = BaseRole.new(BaseRole.type.role, slot2.lookid)

	slot1.spine:setAnimation(0, PlayerAction.show, true)
	slot1.spine:setScale(0.5)
	slot1.spine:setPosition(cc.p(slot1.size.width * 0.5, 75))
	slot1.spine:setAnchorPoint(cc.p(0.5, 0))
	slot1.model:addChild(slot1.spine)
end

function CrosschampionMainWindow.close_callback(slot0)
	doStopAllActions(slot0.dec_container)
	doStopAllActions(slot0.match_desc)

	for slot4, slot5 in ipairs(slot0.statue_list) do
		if slot5.spine ~= nil and slot5.spine ~= nil then
			slot5.spine:DeleteMe()

			slot5.spine = nil
		end
	end

	slot0.status_list = nil

	uv0:openCrosschampionMainWindow(false)
end
