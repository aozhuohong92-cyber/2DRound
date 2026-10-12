StarTowerWindow = StarTowerWindow or BaseClass(BaseView)

function StarTowerWindow.__init(slot0)
	slot0.ctrl = StartowerController:getInstance()
	slot0.is_full_screen = true
	slot0.layout_name = "startower/star_tower_window"
	slot0.cur_type = 0
	slot0.win_type = WinType.Full
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("startower", "startower"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_27", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_36", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_28"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_29"),
			type = ResourcesType.single
		}
	}
	slot0.tab_list = {}
	slot0.select_type = 1
	slot0.view_list = {}
	slot0.is_change = false
	slot0.top3_item_list = {}
end

function StarTowerWindow.open_callback(slot0)
	slot0.mainContainer = slot0.root_wnd:getChildByName("main_container")
	slot1 = display.getTop(slot0.mainContainer)
	slot2 = display.getBottom(slot0.mainContainer)
	slot3 = MainuiController:getInstance():getMainUi():getTopViewHeight()
	slot4 = MainuiController:getInstance():getMainUi():getBottomHeight()
	slot0.mainContainer_size = slot0.mainContainer:getContentSize()
	slot0.bg = slot0.mainContainer:getChildByName("bg")

	if slot0.bg ~= nil then
		slot0.bg:setScale(display.getMaxScale())
		slot0.bg:setPositionY(slot1)
	end

	slot0.bg:setVisible(false)

	slot0.container = slot0.mainContainer:getChildByName("container")
	slot0.top_panel = slot0.mainContainer:getChildByName("top_panel")
	slot0.btnRule = slot0.top_panel:getChildByName("btnRule")

	slot0.top_panel:getChildByName("title"):setString(TI18N("海底监狱"))

	slot0.black_bg = slot0.mainContainer:getChildByName("black_bg")
	slot0.close_btn = slot0.black_bg:getChildByName("close_btn")
	slot0.btn_left = slot0.mainContainer:getChildByName("left")
	slot0.btn_right = slot0.mainContainer:getChildByName("right")
	slot5 = slot0.black_bg:getChildByName("buy_panel")

	slot5:getChildByName("key"):setString(TI18N("剩余挑战次数："))

	slot0.buy_count = slot5:getChildByName("label")
	slot0.buy_btn = slot5:getChildByName("add_btn")
	slot0.buy_tips = createRichLabel(20, cc.c4b(255, 248, 191, 255), cc.p(0.5, 0.5), cc.p(0, -20), nil, , 600)

	slot5:addChild(slot0.buy_tips)

	slot0.award_btn = slot0.black_bg:getChildByName("award_btn")
	slot6 = slot0.award_btn:getChildByName("label")

	slot6:setString(TI18N("奖励"))
	UITool.SetTitleColor(slot6)

	slot0.rank_btn = slot0.black_bg:getChildByName("rank_btn")
	slot7 = slot0.rank_btn:getChildByName("label")

	slot7:setString(TI18N("排行"))
	UITool.SetTitleColor(slot7)

	slot0.rank_container = slot0.mainContainer:getChildByName("rank_container")

	slot0.rank_container:getChildByName("rank_desc_label"):setString(TI18N("排行前三"))

	slot0.rank_top3_btn = slot0.rank_container:getChildByName("rank_btn")
	slot9 = slot1 - (slot0.mainContainer_size.height - slot0.top_panel:getPositionY())

	slot0.top_panel:setPositionY(slot9)
	slot0.rank_container:setPositionY(slot1 - (slot0.mainContainer_size.height - slot0.rank_container:getPositionY()))
	slot0.black_bg:setPositionY(slot2)

	slot0.scroll_height = slot9 - 20 - slot2

	slot0:updateTowerList()
end

function StarTowerWindow.setRankShow(slot0)
	if RankController:getInstance():checkRankIsShow() then
		slot0.rank_container:setVisible(true)
		slot0.rank_btn:setVisible(true)
		slot0.ctrl:requestStarTowerRank()
	else
		slot0.rank_container:setVisible(false)
		slot0.rank_btn:setVisible(false)
	end
end

function StarTowerWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0.ctrl:openMainView(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_left, function ()
		uv0.list_view:setLeftClick()
	end, true, 1)
	registerButtonEventListener(slot0.btn_right, function ()
		uv0.list_view:setRightClick()
	end, true, 1)
	registerButtonEventListener(slot0.award_btn, function ()
		uv0.ctrl:openAwardWindow(true)
	end, true, 1)
	registerButtonEventListener(slot0.rank_btn, function ()
		RankController:getInstance():openRankView(true, RankConstant.RankType.tower)
	end, true, 1)
	registerButtonEventListener(slot0.rank_top3_btn, function ()
		RankController:getInstance():openRankView(true, RankConstant.RankType.tower)
	end, true, 1)
	registerButtonEventListener(slot0.btnRule, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.StarTowerData.data_tower_const.rule_desc.desc, slot1:getTouchBeganPosition())
	end, true, 1)
	registerButtonEventListener(slot0.buy_btn, function ()
		function slot0()
			uv0.ctrl:sender11321()
		end

		if Config.StarTowerData.data_tower_vip[RoleController:getInstance():getRoleVo().vip_lev] and slot3.buy_count then
			if slot3.buy_count <= (uv0.ctrl:getModel():getBuyCount() or 0) then
				message(TI18N("本日购买次数已达上限"))
			elseif Config.StarTowerData.data_tower_buy[slot1 + 1] and slot4.expend and slot4.expend[1] and slot4.expend[1][1] then
				if Config.ItemData.data_get_data(slot4.expend[1][1]) and slot7.icon then
					CommonAlert.show(string.format(TI18N("是否花费<img src='%s' scale=0.25 />%s购买一次挑战次数？"), PathTool.getItemRes(slot7.icon), slot4.expend[1][2] or 0), TI18N("确定"), slot0, TI18N("取消"), nil, CommonAlert.type.rich, nil, , 24)
				end
			end
		end
	end, true, 1)
	slot0:addGlobalEvent(StartowerEvent.Update_All_Data, function ()
		uv0:updateTowerList(true)
		uv0:updateCount()
		uv0:updataRewardRedPoint()
	end)
	slot0:addGlobalEvent(StartowerEvent.Update_Top3_rank, function (slot0)
		uv0:updateTop3Info(slot0)
	end)
	slot0:addGlobalEvent(StartowerEvent.Update_First_Reward_Msg, function ()
		uv0:updataRewardRedPoint()
	end)
	slot0:addGlobalEvent(StartowerEvent.Fight_Success_Event, function ()
		if not uv0.select_vo then
			return
		end

		uv0.list_view:resetCurrentItems()
	end)
	slot0:addGlobalEvent(StartowerEvent.Count_Change_Event, function ()
		uv0:updateCount()

		for slot5, slot6 in ipairs(uv0.list_view:getActiveCellList()) do
			if slot6.index == (uv0.ctrl:getModel():getNowTowerId() or 0) then
				if slot6:getData() then
					slot6:sweepCount(slot6:getData())
				end

				break
			end
		end
	end)
	slot0:addGlobalEvent(GuideEvent.Update_Guide_Status_Event, function (slot0)
		if slot0 then
			uv0.list_view:setClickEnabled(false)
		else
			uv0.list_view:setClickEnabled(false)
		end
	end)
end

function StarTowerWindow.playAction(slot0)
	slot0.list_view:moveToArrowNewPosition()
end

function StarTowerWindow.updataRewardRedPoint(slot0)
	slot2 = false

	for slot6, slot7 in pairs(slot0.ctrl:getModel():getRewardData()) do
		if slot7.status == 1 then
			slot2 = true

			break
		end
	end

	addRedPointToNodeByStatus(slot0.award_btn, slot2)
	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.startower, {
		bid = 1,
		status = slot2
	})
end

function StarTowerWindow.updateCount(slot0)
	slot0.buy_count:setString(string.format("%s/%s", slot0.ctrl:getModel():getTowerLessCount() or 0, Config.StarTowerData.data_tower_const.free_times.val or 0))

	if Config.StarTowerData.data_tower_vip[RoleController:getInstance():getRoleVo().vip_lev] and slot6.buy_count then
		if slot6.buy_count - (slot0.ctrl:getModel():getBuyCount() or 0) < 0 then
			slot7 = 0
		end

		slot0.buy_tips:setString(string.format(TI18N("<div outline=2,#000000>( %s</div><div fontcolor=#3df424 outline=2,#000000>%s</div><div outline=2,#000000> )</div>"), TI18N("剩余购买次数："), slot7))
	end
end

function StarTowerWindow.openRootWnd(slot0)
	slot0:setRankShow()

	if slot0.ctrl:getModel():isInitStarTowerData() then
		if slot0.list_view then
			slot0.list_view:reloadData(slot0.ctrl:getModel():getNowTowerId())
		end

		slot0:updateCount()
		slot0:updataRewardRedPoint()
	else
		slot0.ctrl:sender11320()
	end
end

function StarTowerWindow.setPanelData(slot0)
end

function StarTowerWindow.updateTowerList(slot0, slot1)
	slot0.max_count = Config.StarTowerData.data_tower_base_length

	if not slot0.list_view then
		slot0.list_view = StarTowerList.new(slot0.container, cc.p(SCREEN_WIDTH / 2, display.getBottom(slot0.mainContainer)), cc.size(SCREEN_WIDTH, slot0.scroll_height))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
		slot0.list_view:setInnerContainer()
		slot0.list_view:updateBgList()
		slot0.list_view:setTouchEnabled(false)

		if GuideController:getInstance():isInGuide() then
			slot0.list_view:setClickEnabled(false)
		end
	end

	if slot1 and not slot0.is_init_list then
		slot0.is_init_list = true

		slot0.list_view:reloadData(slot0.ctrl:getModel():getNowTowerId())
	end
end

function StarTowerWindow.createNewCell(slot0)
	print("createNewCell ")

	slot1 = StarTowerItem.new(1, true)

	slot1:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot1
end

function StarTowerWindow.numberOfCells(slot0)
	return slot0.max_count or 0
end

function StarTowerWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	slot1:setData(slot2)
end

function StarTowerWindow.onCellTouched(slot0, slot1)
	if slot1.index > slot0.ctrl:getModel():getNowTowerId() + 1 then
		message(TI18N("当前关卡未开启"))

		return
	end

	if Config.StarTowerData.data_tower_base[slot2] then
		slot0.select_vo = slot4
		slot0.select_item = slot1
		slot0.data = slot4

		slot0:clickFun(slot4)
	end
end

function StarTowerWindow.clickFun(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.ctrl:openStarTowerMainView(true, slot1)
end

function StarTowerWindow.updateTop3Info(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot5, slot6 in ipairs(slot1) do
		if not slot0.top3_item_list[slot6.rank] then
			slot7 = slot0:createSingleRankItem(slot6.rank)

			slot0.rank_container:addChild(slot7)

			slot0.top3_item_list[slot6.rank] = slot7
		end

		if slot0.top3_item_list[slot6.rank] then
			slot7:setPosition(0, 160 - (slot6.rank - 1) * slot7:getContentSize().height)
			slot7.label:setString(slot6.name)
			slot7.value:setString((slot6.tower or 0) .. TI18N("层"))
		end
	end
end

function StarTowerWindow.createSingleRankItem(slot0, slot1)
	slot2 = ccui.Layout:create()

	slot2:setAnchorPoint(cc.p(0, 1))
	slot2:setContentSize(cc.size(180, 40))

	slot3 = createSprite(PathTool.getResFrame("common", "common_300" .. slot1), 30, 20, slot2)

	slot3:setScale(0.5)

	slot2.sp = slot3
	slot4 = createLabel(20, 1, nil, 60, 18, "", slot2)

	slot4:setAnchorPoint(cc.p(0, 0.5))
	slot4:setTextColor(cc.c4b(137, 237, 255, 255))

	slot5 = createLabel(20, 1, nil, 188, 18, "", slot2)

	slot5:setAnchorPoint(cc.p(0, 0.5))
	slot5:setTextColor(cc.c4b(137, 237, 255, 255))

	slot2.label = slot4
	slot2.value = slot5

	return slot2
end

function StarTowerWindow.close_callback(slot0)
	slot0.ctrl:openMainView(false)

	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	slot0.select_item = nil

	if slot0.lock_icon then
		slot0.lock_icon:DeleteMe()

		slot0.lock_icon = nil
	end
end
