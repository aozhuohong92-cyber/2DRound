LimitExerciseController = LimitExerciseController or BaseClass(BaseController)

function LimitExerciseController.config(slot0)
	slot0.model = LimitExerciseModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function LimitExerciseController.getModel(slot0)
	return slot0.model
end

function LimitExerciseController.registerEvents(slot0)
end

function LimitExerciseController.registerProtocals(slot0)
	slot0:RegisterProtocal(25410, "handle25410")
	slot0:RegisterProtocal(25411, "handle25411")
	slot0:RegisterProtocal(25412, "handle25412")
	slot0:RegisterProtocal(25413, "handle25413")
	slot0:RegisterProtocal(25414, "handle25414")
end

function LimitExerciseController.send25410(slot0)
	slot0:SendProtocal(25410, {})
end

function LimitExerciseController.handle25410(slot0, slot1)
	slot0.model:setLimitExerciseData(slot1)
	GlobalEvent:getInstance():Fire(LimitExerciseEvent.LimitExercise_Message_Event, slot1)
end

function LimitExerciseController.send25411(slot0)
	slot0:SendProtocal(25411, {})
end

function LimitExerciseController.handle25411(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0.model:setChangeCount(slot1.count, slot1.buy_count)

		if slot0.touch_buy_change and slot1.count == 1 then
			slot0:send25413()
		end

		slot0.touch_buy_change = nil

		GlobalEvent:getInstance():Fire(LimitExerciseEvent.LimitExercise_BuyCount_Event, slot1)
	end
end

function LimitExerciseController.checkJoinFight(slot0)
	if not Config.HolidayBossNewData.data_const then
		return
	end

	if slot1.fight_buy_max_count.val <= slot0.model:getDayBuyCount() and slot0.model:getReaminCount() == 0 then
		message(TI18N("今日次数已用完~~"))
	elseif slot4 <= 0 then
		CommonAlert.show(string.format(TI18N("是否花费 <img src='%s' scale=0.3 />%s购买一次挑战次数？"), PathTool.getItemRes(Config.ItemData.data_get_data(3).icon), slot1.action_num_espensive.val), TI18N("确定"), function ()
			uv0.touch_buy_change = true

			uv0:send25411()
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	else
		slot0:send25413()
	end
end

function LimitExerciseController.send25412(slot0)
	slot0:SendProtocal(25412, {})
end

function LimitExerciseController.handle25412(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(LimitExerciseEvent.LimitExercise_GetBox_Event, slot1)
end

function LimitExerciseController.send25413(slot0)
	slot0:SendProtocal(25413, {})
end

function LimitExerciseController.handle25413(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		HeroController:getInstance():openFormGoFightPanel(false)
	end
end

function LimitExerciseController.send25414(slot0)
	slot0:SendProtocal(25414, {})
end

function LimitExerciseController.handle25414(slot0, slot1)
	slot0.model:setHeroUseId(slot1.p_list)
end

function LimitExerciseController.openLimitExerciseChangeView(slot0, slot1)
	if slot1 == true then
		if not slot0.limit_exercise_view then
			slot0.limit_exercise_view = LimitExerciseChangeWindow.New()
		end

		slot0.limit_exercise_view:open()
	elseif slot0.limit_exercise_view then
		slot0.limit_exercise_view:close()

		slot0.limit_exercise_view = nil
	end
end

function LimitExerciseController.openLimitExerciseRewardView(slot0, slot1)
	if slot1 == true then
		if not slot0.open_reward_view then
			slot0.open_reward_view = LimitExerciseRewardWindow.New()
		end

		slot0.open_reward_view:open()
	elseif slot0.open_reward_view then
		slot0.open_reward_view:close()

		slot0.open_reward_view = nil
	end
end

function LimitExerciseController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
