ActionLimitYuanZhenPanel = class("ActionLimitYuanZhenPanel", function ()
	return ccui.Widget:create()
end)
ActionLimitYuanZhenPanel.action_yuanzhen_id = 13005
ActionLimitYuanZhenPanel.action_summer_id = 25013
ActionLimitYuanZhenPanel.action_wolf_id = 26002
slot0 = ActionController:getInstance()
slot1 = string.format
slot2 = table.insert

function ActionLimitYuanZhenPanel.ctor(slot0, slot1, slot2)
	slot0.holiday_bid = slot1
	slot0.type = slot2

	slot0:configUI()
	slot0:register_event()

	slot0.limit_list = {}
	slot0.dic_limit_list = {}
	slot0.dic_task_list = {}
	slot0.time_desc_list = {}
end

function ActionLimitYuanZhenPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_limit_yuanzhen_panel"))

	slot0.root_wnd:setPosition(-40, -105)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container_size = slot0.main_container:getContentSize()
	slot1 = slot0.main_container:getChildByName("title_con")

	slot1:getChildByName("time_title"):setString(TI18N("剩余时间:"))

	slot0.time_val = slot1:getChildByName("time_val")
	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot2 = slot1:getChildByName("title_img")
	slot3 = "txt_cn_welfare_banner17"

	if slot0.holiday_bid == ActionRankCommonType.merge_task then
		slot3 = "txt_cn_welfare_banner77"
	end

	slot0.activity_id = 0

	if uv0:getActionSubTabVo(slot0.holiday_bid) then
		if slot4.reward_title ~= nil and slot4.reward_title ~= "" then
			slot3 = slot4.reward_title
		end

		slot0.activity_id = slot4.camp_id
	end

	slot0.item_load = loadSpriteTextureFromCDN(slot2, PathTool.getWelfareBannerRes(slot3, false), ResourcesType.single, slot0.item_load)
	slot6 = 0

	if slot4 then
		slot6 = slot4.remain_sec or 0
	end

	if slot6 < 0 then
		slot6 = 0
	end

	slot0:setLessTime(slot6)

	slot0.common_btn = slot1:getChildByName("common_btn")

	if slot0.holiday_bid == ActionRankCommonType.action_wolf or slot0.holiday_bid == ActionRankCommonType.exercise_1 or slot0.holiday_bid == ActionRankCommonType.exercise_2 or slot0.holiday_bid == ActionRankCommonType.exercise_3 or slot0.holiday_bid == ActionRankCommonType.merge_task then
		slot0.common_btn:setVisible(false)
	else
		slot0.common_btn:setVisible(true)
	end

	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.goods_con, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.goods_con:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 688,
			item_height = 152,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if slot0.holiday_bid == ActionRankCommonType.yuanzhen_adventure then
		uv0:sender24810()
	elseif slot0.holiday_bid == ActionRankCommonType.exercise_1 then
		uv0:sender24813()
	elseif slot0.holiday_bid == ActionRankCommonType.exercise_2 then
		uv0:sender24815()
	elseif slot0.holiday_bid == ActionRankCommonType.exercise_3 or slot0.holiday_bid == ActionRankCommonType.merge_task then
		uv0:sender24817()
	else
		uv0:cs16603(slot0.holiday_bid)
	end
end

function ActionLimitYuanZhenPanel.createNewCell(slot0, slot1, slot2)
	slot3 = ActionLimitCommonItem2.new(slot0.action_id)

	slot3:setActionRankCommonType(slot0.holiday_bid, slot0.type)

	return slot3
end

function ActionLimitYuanZhenPanel.numberOfCells(slot0)
	if not slot0.limit_list then
		return 0
	end

	return #slot0.limit_list
end

function ActionLimitYuanZhenPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.limit_list[slot2] then
		return
	end

	slot4 = slot3.config
	slot5 = slot1:setData(slot3)
	slot0.time_desc_list[slot2] = slot5

	slot0:updateTimeByIndex(slot2, slot5)
end

function ActionLimitYuanZhenPanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_val) then
		return
	end

	doStopAllActions(slot0.time_val)

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.time_val:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.time_val)
				uv1.time_val:setString("00:00:00")
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function ActionLimitYuanZhenPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_val:setString(TimeTool.GetTimeFormatDayIIIIIIII(slot1))
	else
		slot0.time_val:setString("00:00:00")
	end
end

function ActionLimitYuanZhenPanel.updateTimeByIndex(slot0, slot1, slot2)
	if slot0.limit_list[slot1] and slot2 then
		if slot3.end_time - GameNet:getInstance():getTime() < 0 then
			slot4 = 0
		end

		slot2:setString(uv0("%s%s", TI18N("剩余"), TimeTool.getDayOrHour(slot4)))
	end
end

function ActionLimitYuanZhenPanel.register_event(slot0)
	registerButtonEventListener(slot0.common_btn, function ()
		uv0:onCommonBtn()
	end, true, 2)

	if not slot0.limin_yuan_zhen_event then
		slot0.limin_yuan_zhen_event = GlobalEvent:getInstance():Bind(ActionEvent.YUAN_ZHEN_DATA_EVENT, function (slot0)
			if not slot0 then
				return
			end

			if slot0.camp_id == uv0.activity_id then
				table.sort(slot0.quest_list, SortTools.tableLowerSorter({
					"id"
				}))

				uv0.action_id = slot0.camp_id

				uv0:initUI()
				uv0:initYuanZhenData(slot0.quest_list, true)
			end
		end)
	end

	if not slot0.limin_yuan_zhen_update_event then
		slot0.limin_yuan_zhen_update_event = GlobalEvent:getInstance():Bind(ActionEvent.YUAN_ZHEN_UPDATA_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0:initYuanZhenData({
				slot0
			})
		end)
	end

	if not slot0.limin_yuan_zhen_task_event then
		slot0.limin_yuan_zhen_task_event = GlobalEvent:getInstance():Bind(ActionEvent.YUAN_ZHEN_TASK_EVENT, function (slot0)
			if not slot0 then
				return
			end

			if not uv0.action_id then
				return
			end

			if Config.HolidayLantermAdventureData.data_lanterm_adventure_fun(getNorKey(uv0.action_id, slot0.id)) and uv0.dic_limit_list[slot2.f_id] then
				uv0.dic_limit_list[slot2.f_id].status = TaskConst.task_status.completed
				uv0.dic_limit_list[slot2.f_id].sort = TaskConst.task_status.completed

				if Config.HolidayLantermAdventureData.data_lanterm_adventure_task_list[uv0.action_id][slot2.f_id][slot2.s_id + 1] then
					if Config.HolidayLantermAdventureData.data_lanterm_adventure_fun(getNorKey(uv0.action_id, slot3[slot2.s_id + 1].id)) and uv0.dic_task_list[slot5.id] then
						uv0:initYuanZhenData({
							uv0.dic_task_list[slot5.id]
						})
					else
						uv0:sortYuanZhenInfo()
					end
				else
					uv0:sortYuanZhenInfo()
				end
			end
		end)
	end
end

function ActionLimitYuanZhenPanel.onCommonBtn(slot0)
	if slot0.holiday_bid == ActionRankCommonType.yuanzhen_adventure then
		MallController:getInstance():openMallActionWindow(true, slot0.holiday_bid)
	end
end

function ActionLimitYuanZhenPanel.initUI(slot0)
	if slot0.action_id == ActionLimitYuanZhenPanel.action_yuanzhen_id then
		if slot0.common_btn:getChildByName("icon") then
			slot0.item_load1 = loadSpriteTextureFromCDN(slot1, PathTool.getTargetRes("welfare/action_icon", "welfare_icon_99", false, false), ResourcesType.single, slot0.item_load1)
		end

		slot0.common_btn:getChildByName("label"):setString(TI18N("花灯集市"))

		title_desc = createRichLabel(18, cc.c4b(247, 230, 176, 255), cc.p(0, 0.5), cc.p(50, 76), nil, , 400)

		title_con:addChild(title_desc)
		title_desc:setString(TI18N("活动期间完成任务获取元宵花灯等限时奖励"))
	elseif slot0.action_id == ActionLimitYuanZhenPanel.action_summer_id then
		slot0.common_btn:setVisible(false)
	end
end

function ActionLimitYuanZhenPanel.initYuanZhenData(slot0, slot1)
	if not slot0.action_id then
		return
	end

	if not slot1 then
		return
	end

	for slot5, slot6 in ipairs(slot1) do
		slot0.dic_task_list[slot6.id] = slot6

		if Config.HolidayLantermAdventureData.data_lanterm_adventure_fun(getNorKey(slot0.action_id, slot6.id)) and slot6.finish ~= TaskConst.task_status.over then
			if slot0.dic_limit_list[slot8.f_id] == nil then
				slot9 = {}
				slot0.dic_limit_list[slot8.f_id] = slot9

				uv0(slot0.limit_list, slot9)
			end

			slot10 = true

			if slot9.config then
				if slot9.config.s_id < slot8.s_id then
					if slot9.status ~= TaskConst.task_status.completed then
						slot10 = false
					end
				elseif slot8.s_id < slot9.config.s_id and slot6.finish == TaskConst.task_status.completed then
					slot10 = false
				end
			end

			if slot10 then
				slot9.config = slot8
				slot9.f_id = slot8.f_id

				if slot6.finish == TaskConst.task_status.finish then
					slot9.sort = 0
				elseif slot6.finish == TaskConst.task_status.un_finish then
					slot9.sort = 1
				else
					slot9.sort = slot6.finish
				end

				slot9.status = slot6.finish
				slot9.title = slot8.title
				slot9.desc = slot8.desc
				slot11, slot12 = nil

				if slot6.progress[1] then
					slot11 = slot6.progress[1].target_val
					slot12 = slot6.progress[1].value
				end

				slot9.goal = uv1("(%s/%s)", slot12, slot11)
				slot9.end_time = slot6.end_time
				slot9.item_list = slot8.award
			end
		end
	end

	slot0:sortYuanZhenInfo()
end

function ActionLimitYuanZhenPanel.sortYuanZhenInfo(slot0)
	table.sort(slot0.limit_list, SortTools.tableLowerSorter({
		"sort",
		"f_id"
	}))
	slot0.item_scrollview:reloadData()
end

function ActionLimitYuanZhenPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionLimitYuanZhenPanel.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.item_load1 then
		slot0.item_load1:DeleteMe()

		slot0.item_load1 = nil
	end

	if slot0.limin_common_event then
		GlobalEvent:getInstance():UnBind(slot0.limin_common_event)

		slot0.limin_common_event = nil
	end

	if slot0.limin_yuan_zhen_event then
		GlobalEvent:getInstance():UnBind(slot0.limin_yuan_zhen_event)

		slot0.limin_yuan_zhen_event = nil
	end

	if slot0.limin_yuan_zhen_update_event then
		GlobalEvent:getInstance():UnBind(slot0.limin_yuan_zhen_update_event)

		slot0.limin_yuan_zhen_update_event = nil
	end

	if slot0.limin_yuan_zhen_task_event then
		GlobalEvent:getInstance():UnBind(slot0.limin_yuan_zhen_task_event)

		slot0.limin_yuan_zhen_task_event = nil
	end

	doStopAllActions(slot0.time_val)

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil
end

ActionLimitCommonItem2 = class("ActionLimitCommonItem2", function ()
	return ccui.Widget:create()
end)

function ActionLimitCommonItem2.ctor(slot0, slot1)
	slot0.action_id = slot1

	slot0:configUI()
	slot0:register_event()
end

function ActionLimitCommonItem2.configUI(slot0)
	slot0.size = cc.size(688, 152)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("action/action_limit_yuanzhen_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("main_container")
	slot0.btn_goto = slot2:getChildByName("btn_goto")

	slot0.btn_goto:getChildByName("Text_6"):setString(TI18N("前往"))
	slot0.btn_goto:setVisible(false)

	slot0.btn_get = slot2:getChildByName("btn_get")

	slot0.btn_get:getChildByName("Text_5"):setString(TI18N("领取"))
	slot0.btn_get:setVisible(false)

	slot0.btn_has = slot2:getChildByName("btn_has")

	slot0.btn_has:setVisible(false)

	slot0.goods_con = slot2:getChildByName("good_cons")
	slot0.Image_1 = slot2:getChildByName("Image_1")
	slot0.line = slot2:getChildByName("line")

	if slot0.action_id == ActionLimitYuanZhenPanel.action_yuanzhen_id then
		slot0.line:setVisible(false)

		slot0.title_desc = createRichLabel(22, cc.c4b(90, 58, 38, 255), cc.p(0, 0.5), cc.p(14, 129), nil, , 400)

		slot2:addChild(slot0.title_desc)

		slot0.goal_desc = createRichLabel(26, cc.c4b(147, 83, 34, 255), cc.p(0.5, 0.5), cc.p(596, 127), nil, , 400)

		slot2:addChild(slot0.goal_desc)

		slot0.time_desc = createRichLabel(22, cc.c4b(147, 83, 34, 255), cc.p(0.5, 0.5), cc.p(594, 24), nil, , 400)

		slot2:addChild(slot0.time_desc)

		slot3 = slot0.goods_con:getContentSize()
		slot0.item_scrollview = createScrollView(slot3.width, slot3.height, 0, 0, slot0.goods_con, ScrollViewDir.vertical)
	else
		slot0.btn_goto:setPositionY(76)
		slot0.btn_get:setPositionY(76)
		slot0.btn_has:setPositionY(76)
		slot0.Image_1:setVisible(false)

		slot0.title_desc = createRichLabel(28, cc.c4b(90, 58, 38, 255), cc.p(0, 0.5), cc.p(148, 100), nil, , 400)

		slot2:addChild(slot0.title_desc)

		slot0.little_desc = createRichLabel(22, cc.c4b(149, 83, 34, 255), cc.p(0, 1), cc.p(148, 72), nil, , 320)

		slot2:addChild(slot0.little_desc)

		slot0.time_desc = createRichLabel(22, cc.c4b(147, 83, 34, 255), cc.p(0.5, 0.5), cc.p(594, 24), nil, , 400)

		slot2:addChild(slot0.time_desc)

		slot0.item = BackPackItem.new(false, true, false, 0.9, false, true)

		slot0.item:setPosition(80, 76)
		slot2:addChild(slot0.item)
	end
end

function ActionLimitCommonItem2.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if not uv0.data then
			return
		end

		if uv0.holiday_bid == ActionRankCommonType.yuanzhen_adventure then
			uv1:sender24812(uv0.data.config.id)
		elseif uv0.holiday_bid == ActionRankCommonType.exercise_1 then
			uv1:sender24814(uv0.data.config.id)
		elseif uv0.holiday_bid == ActionRankCommonType.exercise_2 then
			uv1:sender24816(uv0.data.config.id)
		elseif uv0.holiday_bid == ActionRankCommonType.exercise_3 or uv0.holiday_bid == ActionRankCommonType.merge_task then
			uv1:sender24818(uv0.data.config.id)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		uv0:onGotoBtn()
	end, true, 1)
end

function ActionLimitCommonItem2.onGotoBtn(slot0)
	if not slot0.data then
		return
	end

	if not slot0.data.config then
		return
	end

	if slot0.data.config.source_id == 130051 then
		if uv0:getActionSubTabVo(AnimateActionCommonType.YuanZhen_Kitchen) and uv0.action_operate and uv0.action_operate.tab_list[slot1.bid] then
			uv0.action_operate:handleSelectedTab(uv0.action_operate.tab_list[slot1.bid])
		else
			message(TI18N("该活动已结束"))
		end
	elseif slot0.data.config.source_id == 250131 then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.SandybeachBossFight)
	elseif slot0.data.config.source_id == 4401601 then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.TermBegins)
	elseif slot0.data.config.source_id == 250132 then
		slot0:gotoActionByID(ActionRankCommonType.time_summon)
	elseif slot0.data.config.source_id == 250133 then
		slot0:gotoActionByID(ActionRankCommonType.action_skin_buy)
	elseif slot0.data.config.source_id == 250134 then
		slot0:gotoActionByID(ActionRankCommonType.limit_exercise)
	elseif slot0.data.config.source_id == 250135 then
		slot0:gotoActionByID(ActionRankCommonType.lottery_skin)
	elseif slot0.data.config.source_id == 460161 then
		if PetardActionController:getInstance():getModel():checkPetardIsOpen() then
			slot0:gotoActionByID(ActionRankCommonType.petard)
		else
			message(TI18N("活动未开启"))
		end
	elseif slot0.data.config.source_id == 460162 then
		if PetardActionController:getInstance():getModel():checkPetardIsOpen() then
			PetardActionController:getInstance():openRedbagWindow(true)
		else
			message(TI18N("活动未开启"))
		end
	elseif slot0.data.config.source_id == 460171 then
		slot0:gotoActionByID(ActionRankCommonType.elite_summon)
	elseif slot0.data.config.source_id == 460181 then
		slot0:gotoActionByID(ActionRankCommonType.sweet)
	elseif slot0.data.config.source_id == 480341 then
		slot0:gotoActionByID(ActionRankCommonType.time_elfin_summon)
	elseif slot0.data.config.source_id == 930321 then
		JumpController:getInstance():jumpViewByEvtData({
			70
		})
	elseif Config.SourceData.data_source_data[slot0.data.config.source_id] then
		BackpackController:getInstance():gotoItemSources(slot1.evt_type, slot1.extend)
	else
		StrongerController:getInstance():clickCallBack(slot0.data.config.source_id)
	end
end

function ActionLimitCommonItem2.gotoActionByID(slot0, slot1)
	if uv0:getActionSubTabVo(slot1) and uv0.action_operate and uv0.action_operate.tab_list[slot2.bid] then
		uv0.action_operate:handleSelectedTab(uv0.action_operate.tab_list[slot2.bid])
	else
		message(TI18N("该活动已结束"))
	end
end

function ActionLimitCommonItem2.setActionRankCommonType(slot0, slot1, slot2)
	slot0.holiday_bid = slot1
	slot0.type = slot2
end

function ActionLimitCommonItem2.setData(slot0, slot1)
	slot0.data = slot1

	slot0.btn_goto:setVisible(slot1.status == TaskConst.task_status.un_finish)
	slot0.btn_get:setVisible(slot1.status == TaskConst.task_status.finish)
	slot0.btn_has:setVisible(slot1.status == TaskConst.task_status.completed)

	if slot0.time_desc then
		slot0.time_desc:setVisible(slot1.status ~= TaskConst.task_status.completed)
	end

	if slot0.action_id == ActionLimitYuanZhenPanel.action_yuanzhen_id then
		slot0.title_desc:setString(slot1.desc)

		if slot1.status == TaskConst.task_status.finish then
			slot0.goal_desc:setString(uv0("<div fontColor=#5a3a26>%s</div>", slot1.goal))
		else
			slot0.goal_desc:setString(slot1.goal)
		end

		slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot1.item_list, {
			scale = 0.8,
			max_count = 4
		})
	else
		slot0.title_desc:setString(slot1.title)

		if slot1.status == TaskConst.task_status.finish then
			slot0.little_desc:setString(uv0("<div fontColor=#5a3a26>%s</div>", slot1.desc .. slot1.goal))
		else
			slot0.little_desc:setString(slot2)
		end

		if slot0.item and slot1.item_list ~= nil and next(slot1.item_list) ~= nil then
			slot0.item:setBaseData(slot1.item_list[1][1], slot1.item_list[1][2], true)
		end
	end

	return slot0.time_desc
end

function ActionLimitCommonItem2.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end

	slot0.item_list = nil

	if slot0.item then
		slot0.item:DeleteMe()

		slot0.item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
