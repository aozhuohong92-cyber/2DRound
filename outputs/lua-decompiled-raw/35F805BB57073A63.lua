GuideController = GuideController or BaseClass(BaseController)
GuideType = {
	battle = 2,
	ui = 1
}
slot0 = table.insert

function GuideController.config(slot0)
	slot0.model = GuideModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.guide_list = {}
	slot0.is_guiding = false
	slot0.last_guide_id = 0
	slot0.cur_guide_config = nil
	slot0.last_guide_pos = nil
	slot0.guide_finish_step = {}
end

function GuideController.getModel(slot0)
	return slot0.model
end

function GuideController.registerProtocals(slot0)
	slot0:RegisterProtocal(11120, "handle_11120")
	slot0:RegisterProtocal(11121, "handle_11121")
	slot0:RegisterProtocal(11123, "handle_11123")
end

function GuideController.registerEvents(slot0)
	if slot0.story_over_event == nil then
		slot0.story_over_event = GlobalEvent:getInstance():Bind(StoryEvent.STORY_OVER, function ()
			if uv0.guide_list ~= nil and next(uv0.guide_list) ~= nil then
				uv0:checkGuideToPlay(table.remove(uv0.guide_list, 1))
			end
		end)
	end

	if slot0.can_play_drama_event == nil then
		slot0.can_play_drama_event = GlobalEvent:getInstance():Bind(StoryEvent.PREPARE_PLAY_PLOT, function ()
			if uv0.guide_list ~= nil and next(uv0.guide_list) ~= nil then
				uv0:checkGuideToPlay(table.remove(uv0.guide_list, 1))
			end
		end)
	end
end

function GuideController.checkGuideToPlay(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.cur_guide_config ~= nil and slot0.cur_guide_config.id == slot1.id then
		return
	end

	for slot5, slot6 in pairs(slot0.guide_list) do
		if slot6.id == slot1.id then
			return
		end
	end

	if (StoryController:getInstance():getModel():isStoryState() or false) == true then
		uv0(slot0.guide_list, 1, slot1)

		return
	end

	if LevupgradeController:getInstance():waitLevupgrade() then
		uv0(slot0.guide_list, 1, slot1)

		return
	end

	if slot0.cur_guide_config ~= nil then
		uv0(slot0.guide_list, 1, slot1)

		return
	end

	if next(slot1.act) ~= nil then
		slot0:playGuide(slot1)
	end
end

function GuideController.startPlayGuide(slot0, slot1, slot2, slot3)
	if slot1 == false then
		slot0:delayTouchEnabled()

		if slot0.guide_view then
			slot0.guide_view:DeleteMe()

			slot0.guide_view = nil
		end

		slot0.is_guiding = false
		slot0.cur_guide_config = nil

		slot0:sendServerGuideOver(slot2, slot3)

		if slot0.guide_list ~= nil and next(slot0.guide_list) ~= nil then
			if slot0.guide_list ~= nil and next(slot0.guide_list) ~= nil then
				slot0:checkGuideToPlay(table.remove(slot0.guide_list, 1))
			end
		else
			MainuiController:getInstance():setMainUIChatBubbleStatus(true)
		end

		slot0.model:setGuideID(nil)
		GlobalEvent:getInstance():Fire(GuideEvent.Update_Guide_Status_Event, false)
	else
		if RoleEnv:getInstance():get(RoleEnv.keys.guide_step_list, {})[slot2] ~= nil and slot4[slot2][RoleEnv.keys.guide_over_step] == true then
			slot0:startPlayGuide(false, slot2)

			return
		end

		if Config.DramaData.data_guide[slot2] == nil or slot5.act == nil or next(slot5.act) == nil then
			slot0:startPlayGuide(false, slot2)

			return
		end

		slot0:checkGuideToPlay(slot5)
		GlobalEvent:getInstance():Fire(GuideEvent.Update_Guide_Status_Event, true)
	end
end

function GuideController.delayTouchEnabled(slot0)
	if not tolua.isnull(ViewManager:getInstance():getLayerByTag(ViewMgrTag.DEBUG_TAG)) then
		slot1:setSwallowTouches(true)
		GlobalTimeTicket:getInstance():add(function ()
			uv0:setSwallowTouches(false)
		end, 0.2, 1, "lock_touchenable_debugtag")
	end
end

function GuideController.playGuide(slot0, slot1)
	if slot0.is_guiding == true then
		return
	end

	slot0.cur_guide_config = slot1
	slot0.is_guiding = true

	if slot1.is_close == 1 then
		BaseView.closeAllView()
	end

	BaseView.closeSomeWin()
	MainuiController:getInstance():setMainUIChatBubbleStatus(false)

	if slot0.guide_view == nil then
		slot0.guide_view = GuideMainView.new(slot0)
	end

	if slot0.guide_view.is_open == false then
		slot0.guide_view:open(slot1)
	end
end

function GuideController.setGuideLastPos(slot0, slot1)
	slot0.last_guide_pos = slot1
end

function GuideController.getGuideLastPos(slot0)
	return slot0.last_guide_pos
end

function GuideController.getGuideConfig(slot0)
	return slot0.cur_guide_config
end

function GuideController.getGuideList(slot0)
	return slot0.guide_list
end

function GuideController.inGuideQueue(slot0)
	return slot0.guide_list and next(slot0.guide_list) ~= nil
end

function GuideController.isInGuide(slot0)
	return slot0.is_guiding
end

function GuideController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end

function GuideController.handle_11120(slot0, slot1)
	if slot1 == nil or slot1.id == nil or slot1.id == 0 then
		return
	end

	if slot0.cur_guide_config ~= nil and slot0.cur_guide_config.id == slot1.id then
		return
	end

	if Config.DramaData.data_guide[slot1.id] == nil then
		slot0:startPlayGuide(false, slot1.id)

		return
	end

	slot0.model:setGuideID(slot1.id)
	GlobalEvent:getInstance():Fire(GuideEvent.Update_Guide_Open_Event)
	slot0:startPlayGuide(true, slot1.id)
end

function GuideController.getGuideFinishStep(slot0, slot1)
	if slot0.guide_finish_step ~= nil and slot0.guide_finish_step[slot1] ~= nil then
		return slot0.guide_finish_step[slot1]
	end

	return 0
end

function GuideController.checkNetWorkNormal(slot0, slot1, slot2)
	slot0:SendProtocal(11121, {
		id = slot1,
		n = slot2
	})
end

function GuideController.handle_11121(slot0, slot1)
	if slot0.guide_view then
		slot0.guide_view:doNextGuideFromServer(slot1.id, slot1.n)
	end
end

function GuideController.sendServerGuideOver(slot0, slot1, slot2)
	slot0:SendProtocal(11122, {
		id = slot1,
		is_skip = (slot2 ~= true or TRUE) and FALSE
	})
end

function GuideController.handle_11123(slot0, slot1)
	if (StoryController:getInstance():getModel():isStoryState() or false) == true then
		GlobalEvent:getInstance():Fire(StoryEvent.SKIP_STORY)
	end

	if slot0.cur_guide_config ~= nil then
		slot0:startPlayGuide(false, slot0.cur_guide_config.id)
	end
end
