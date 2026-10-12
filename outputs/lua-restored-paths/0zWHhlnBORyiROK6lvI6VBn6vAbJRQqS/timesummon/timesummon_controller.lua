TimesummonController = TimesummonController or BaseClass(BaseController)
BattlePreviewParm = {
	ReturnActionSummon = 3,
	RecruitHero = 2,
	FirstCharge2 = 4,
	FirstCharge = 1
}

function TimesummonController.config(slot0)
	slot0.model = TimesummonModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function TimesummonController.getModel(slot0)
	return slot0.model
end

function TimesummonController.registerEvents(slot0)
end

function TimesummonController.requestTimeSummonData(slot0)
	slot0:SendProtocal(23216, {})
end

function TimesummonController.requestTimeSummon(slot0, slot1, slot2)
	slot0:SendProtocal(23217, {
		times = slot1,
		recruit_type = slot2
	})
end

function TimesummonController.requestSummonGetAward(slot0)
	slot0:SendProtocal(23218, {})
end

function TimesummonController.send23219(slot0, slot1)
	slot0:SendProtocal(23219, {
		bid = slot1
	})
end

function TimesummonController.registerProtocals(slot0)
	slot0:RegisterProtocal(23216, "handle23216")
	slot0:RegisterProtocal(23217, "handle23217")
	slot0:RegisterProtocal(23218, "handle23218")
	slot0:RegisterProtocal(23219, "handle23219")
	slot0:RegisterProtocal(26521, "handle26521")
	slot0:RegisterProtocal(26522, "handle26522")
	slot0:RegisterProtocal(26523, "handle26523")
	slot0:RegisterProtocal(26525, "handle26525")
end

function TimesummonController.handle23216(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(TimesummonEvent.Update_Summon_Data_Event, slot1)
	end
end

function TimesummonController.handle23217(slot0, slot1)
	message(slot1.msg)
end

function TimesummonController.handle23218(slot0, slot1)
	message(slot1.msg)
end

function TimesummonController.handle23219(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == FALSE then
		BattleController:getInstance():csFightExit()
	end
end

function TimesummonController.openTimeSummonAwardView(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if slot0.summon_award_view == nil then
			slot0.summon_award_view = TimeSummonAwardView.New()
		end

		if slot0.summon_award_view:isOpen() == false then
			slot0.summon_award_view:open(slot2, slot3, slot4)
		end
	elseif slot0.summon_award_view then
		slot0.summon_award_view:close()

		slot0.summon_award_view = nil
	end
end

function TimesummonController.openTimeSummonProgressView(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == true then
		if slot0.summon_progress_view == nil then
			slot0.summon_progress_view = TimeSummonProgressView.New()
		end

		if slot0.summon_progress_view:isOpen() == false then
			slot0.summon_progress_view:open(slot2, slot3, slot4, slot5)
		end
	elseif slot0.summon_progress_view then
		slot0.summon_progress_view:close()

		slot0.summon_progress_view = nil
	end
end

function TimesummonController.openTimeSummonpreviewWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if slot0.SummonpreviewWindow == nil then
			slot0.SummonpreviewWindow = TimeSummonPreviewWindow.New()
		end

		if slot0.SummonpreviewWindow:isOpen() == false then
			slot0.SummonpreviewWindow:open(slot2, slot3)
		end
	elseif slot0.SummonpreviewWindow then
		slot0.SummonpreviewWindow:close()

		slot0.SummonpreviewWindow = nil
	end
end

function TimesummonController.send26521(slot0)
	slot0:SendProtocal(26521, {})
end

function TimesummonController.handle26521(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(TimesummonEvent.Update_Elfin_Summon_Data_Event, slot1)
	end
end

function TimesummonController.send26522(slot0, slot1, slot2, slot3)
	slot0.is_return_gain = slot3

	slot0:SendProtocal(26522, {
		times = slot1,
		recruit_type = slot2
	})
end

function TimesummonController.handle26522(slot0, slot1)
	message(slot1.msg)
end

function TimesummonController.send26523(slot0, slot1)
	slot0:SendProtocal(26523, {
		id = slot1
	})
end

function TimesummonController.handle26523(slot0, slot1)
	message(slot1.msg)
end

function TimesummonController.handle26525(slot0, slot1)
	if slot0.is_return_gain == true then
		slot0:openActionTimeElfinSummonGainWindow(false)
		slot0:openActionTimeElfinSummonGainWindow(true, slot1, TRUE)
		GlobalEvent:getInstance():Fire(TimesummonEvent.Update_Elfin_Item_Event, slot1)
	else
		GlobalEvent:getInstance():Fire(TimesummonEvent.Update_Elfin_Summon_Rewards_Data_Event, slot1)
	end

	slot0.is_return_gain = false
end

function TimesummonController.openActionTimeElfinSummonGainWindow(slot0, slot1, slot2, slot3, slot4)
	if slot1 == false then
		if slot0.action_time_elfin_summon_gain_window ~= nil then
			slot0.action_time_elfin_summon_gain_window:close()

			slot0.action_time_elfin_summon_gain_window = nil
		end
	else
		if slot0.action_time_elfin_summon_gain_window == nil then
			slot0.action_time_elfin_summon_gain_window = ActionTimeElfinSummonGainWindow.New(slot3)
		end

		if slot0.action_time_elfin_summon_gain_window:isOpen() == false then
			slot0.action_time_elfin_summon_gain_window:open(slot2, slot3, slot4)
		end
	end
end

function TimesummonController.openHeroSelectView(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.hero_select_view ~= nil then
			slot0.hero_select_view:close()

			slot0.hero_select_view = nil
		end
	else
		if slot0.hero_select_view == nil then
			slot0.hero_select_view = HeroSelectPanel.New()
		end

		if slot0.hero_select_view:isOpen() == false then
			slot0.hero_select_view:open(slot2, slot3)
		end
	end
end

function TimesummonController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
