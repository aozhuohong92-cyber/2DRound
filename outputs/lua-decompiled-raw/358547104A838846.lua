LimitExercisePanel = class("LimitExercisePanel", function ()
	return ccui.Widget:create()
end)
slot0 = LimitExerciseController:getInstance()

function LimitExercisePanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:configUI()
	slot0:register_event()
end

function LimitExercisePanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("limitexercise/limitexercise_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	if not slot0.holiday_load_bg then
		slot0.holiday_load_bg = loadSpriteTextureFromCDN(slot0.root_wnd:getChildByName("main_container"):getChildByName("bg"), PathTool.getPlistImgForDownLoad("bigbg/limitexercise", "txt_cn_limit_exercise"), ResourcesType.single, slot0.holiday_load_bg)
	end

	slot1:getChildByName("Text_1"):setString(TI18N("活动时间："))

	slot0.btn_change = slot1:getChildByName("btn_change")

	slot0.btn_change:getChildByName("Text_4"):setString(TI18N("前往挑战"))
	slot1:getChildByName("Text_1_0"):setString(TI18N("剩余次数:"))
	slot1:getChildByName("Text_2"):setString(TI18N("本轮剩余:"))

	slot0.round_time = slot1:getChildByName("round_time")

	slot0.round_time:setString("")
	slot1:getChildByName("Text_2_0"):setString(TI18N("所在区域:"))
	slot1:getChildByName("Text_2_0_0"):setString(TI18N("挑战次数:"))
	slot1:getChildByName("Text_2_0_1"):setString(TI18N("击败怪物:"))

	slot0.aera_text = slot1:getChildByName("aera_text")

	slot0.aera_text:setString("")

	slot0.change_count = slot1:getChildByName("change_count")

	slot0.change_count:setString("")

	slot0.defaet_master = slot1:getChildByName("defaet_master")

	slot0.defaet_master:setString("")

	slot0.item_count = slot1:getChildByName("item_count")

	slot0.item_count:setString("")

	slot0.remain_time = slot1:getChildByName("remain_time")

	slot0.remain_time:setString("")

	slot0.goods_con = slot1:getChildByName("goods_con")

	slot0.goods_con:setScrollBarEnabled(false)
	slot0:setData()
	uv0:send25410()
end

function LimitExercisePanel.setData(slot0)
	if Config.HolidayBossNewData.data_const then
		if slot1.action_time then
			slot0.remain_time:setString(slot1.action_time.desc or "")
		end

		if slot1.action_pre_reward then
			slot0.item_list = commonShowSingleRowItemList(slot0.goods_con, slot0.item_list, slot1.action_pre_reward.val or {}, {
				scale = 0.9,
				max_count = 4,
				is_center = true,
				show_effect_id = 263
			})
		end
	end
end

function LimitExercisePanel.register_event(slot0)
	if not slot0.action_reward_list then
		slot0.action_reward_list = GlobalEvent:getInstance():Bind(LimitExerciseEvent.LimitExercise_Message_Event, function (slot0)
			if not slot0 then
				return
			end

			if uv0.actionHolidayData then
				uv0:actionHolidayData(slot0)
			end
		end)
	end

	registerButtonEventListener(slot0.btn_change, function ()
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.LimitExercise)
	end, true)

	if not slot0.get_buy_event then
		slot0.get_buy_event = GlobalEvent:getInstance():Bind(LimitExerciseEvent.LimitExercise_BuyCount_Event, function (slot0)
			if not slot0 then
				return
			end

			if uv0.item_count then
				uv0.item_count:setString(slot0.count or 0)
			end
		end)
	end
end

function LimitExercisePanel.actionHolidayData(slot0, slot1)
	slot0:setCountDownTime(slot0.round_time, (slot1.endtime or 0) - GameNet:getInstance():getTime())
	slot0.item_count:setString(slot1.count or 0)
	slot0.aera_text:setString(LimitExerciseConstants.type[slot1.order_type or 1])
	slot0.change_count:setString(slot1.round_combat or 0)
	slot0.defaet_master:setString(slot1.round_boss or 0)
end

function LimitExercisePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function LimitExercisePanel.setCountDownTime(slot0, slot1, slot2)
	if tolua.isnull(slot1) then
		return
	end

	doStopAllActions(slot1)

	if slot2 > 0 then
		slot0:setTimeFormatString(slot1, slot2)
		slot1:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1)
				uv1:setString("00:00:00")
			else
				uv2:setTimeFormatString(uv1, uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1, slot2)
	end
end

function LimitExercisePanel.setTimeFormatString(slot0, slot1, slot2)
	if slot2 > 0 then
		slot1:setString(TimeTool.GetTimeFormatDay(slot2))
	else
		doStopAllActions(slot1)
		slot1:setString("00:00:00")
	end
end

function LimitExercisePanel.DeleteMe(slot0)
	doStopAllActions(slot0.round_time)

	if slot0.action_reward_list ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.action_reward_list)

		slot0.action_reward_list = nil
	end

	if slot0.get_buy_event ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.get_buy_event)

		slot0.get_buy_event = nil
	end

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	if slot0.holiday_load_bg then
		slot0.holiday_load_bg:DeleteMe()
	end

	slot0.holiday_load_bg = nil
end
