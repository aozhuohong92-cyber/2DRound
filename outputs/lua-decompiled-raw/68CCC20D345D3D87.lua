StoryView = StoryView or BaseClass()

function StoryView.__init(slot0)
	slot0:config()
	slot0:initEvent()
end

function StoryView.config(slot0)
	slot0.ticket = GlobalTimeTicket:getInstance()
	slot0.cur_drama = nil
	slot0.cur_act_list = {}
	slot0.cur_step = 0
	slot0.talk = nil
	slot0.is_next_action = false
	slot0.cur_bubble = nil
end

function StoryView.initEvent(slot0)
	if slot0.read_config_complete == nil then
		slot0.read_config_complete = GlobalEvent:getInstance():Bind(StoryEvent.READ_CONFIG_COMPLETE, function ()
			uv0:checkPlayStory()
		end)
	end

	if slot0.play_next_act == nil then
		slot0.play_next_act = GlobalEvent:getInstance():Bind(StoryEvent.PLAY_NEXT_ACT, function ()
			uv0:playNextAct()
		end)
	end

	if slot0.skip_story == nil then
		slot0.skip_story = GlobalEvent:getInstance():Bind(StoryEvent.SKIP_STORY, function ()
			uv0:storyOverHandler()
		end)
	end
end

function StoryView.checkPlayStory(slot0)
	if not GuideController:getInstance():isInGuide() and BattleController:getInstance():getFinishView(BattleConst.Fight_Type.Darma) == nil and StartowerController:getInstance():getResultWindow() == nil and LevupgradeController:getInstance():waitLevupgrade() == false then
		slot0:playAct()
	elseif slot4 then
		if slot0.guide_over_event == nil then
			slot0.guide_over_event = GlobalEvent:getInstance():Bind(GuideEvent.Update_Guide_Status_Event, function (slot0)
				if slot0 == false then
					GlobalEvent:getInstance():UnBind(uv0.guide_over_event)

					uv0.guide_over_event = nil

					uv0:checkPlayStory()
				end
			end)
		end
	elseif slot0.can_play_drama_event == nil then
		slot0.can_play_drama_event = GlobalEvent:getInstance():Bind(StoryEvent.PREPARE_PLAY_PLOT, function ()
			GlobalEvent:getInstance():UnBind(uv0.can_play_drama_event)

			uv0.can_play_drama_event = nil

			uv0:playAct()
		end)
	end
end

function StoryView.doSomeThingForDrama(slot0)
	if slot0.cur_drama and (slot0.cur_drama.bid == GuideConst.special_id.guild or slot0.cur_drama.bid == GuideConst.special_id.seerpalace or slot0.cur_drama.bid == GuideConst.special_id.stronger or slot0.cur_drama.bid == GuideConst.special_id.home_guide_1 or slot0.cur_drama.bid == GuideConst.special_id.home_guide_2 or slot0.cur_drama.bid == GuideConst.special_id.home_guide_3 or slot0.cur_drama.bid == GuideConst.special_id.shop or slot0.cur_drama.bid == GuideConst.special_id.planes or slot0.cur_drama.bid == GuideConst.special_id.elfin or slot0.cur_drama.bid == GuideConst.special_id.holy_dial or slot0.cur_drama.bid == GuideConst.special_id.heaven_tips or slot0.cur_drama.bid == GuideConst.special_id.resonate) then
		return
	end

	if MainuiController:getInstance():getMainUIIndex() ~= MainuiConst.btn_index.drama_scene and slot1 ~= MainuiConst.btn_index.main_scene then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, nil, , true)
	elseif slot0.cur_drama and slot0.cur_drama.bid ~= GuideConst.special_id.guild and slot0.cur_drama.bid ~= GuideConst.special_id.market and slot0.cur_drama.bid ~= GuideConst.special_id.seerpalace and slot0.cur_drama.bid ~= GuideConst.special_id.stronger then
		if slot1 == MainuiConst.btn_index.main_scene and BattleController:getInstance():isInFight() then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, nil, , true)
		else
			BaseView.closeAllView()
			BaseView.closeSomeWin()
		end
	end
end

function StoryView.playAct(slot0)
	slot1 = StoryController:getInstance():getModel()
	slot0.cur_drama = slot1:getCurStory()

	slot0:doSomeThingForDrama()
	slot1:setStoryState(true)

	slot0.cur_act_list = clone(slot1:getCurActList())

	if slot0.cur_act_list == nil or next(slot0.cur_act_list) == nil then
		slot0:storyOverHandler()
		StoryController:getInstance():send_11100(slot1:getCurStoryBid(), 0)

		return
	end

	slot0.cur_step = 0

	slot0:playNextAct()
end

function StoryView.playStepOver(slot0)
	if #slot0.cur_act_list == 0 then
		slot0:storyOverHandler()
	end
end

function StoryView.playNextAct(slot0)
	if not StoryController:getInstance():getModel():isStoryState() then
		return
	end

	slot0.is_next_action = false

	if slot0.cur_bubble ~= nil and not tolua.isnull(slot0.cur_bubble:getRootWnd()) then
		doStopAllActions(slot0.cur_bubble:getRootWnd())
		slot0.cur_bubble:DeleteMe()
	end

	slot0.cur_bubble = nil
	slot0.cur_step = slot0.cur_step + 1

	if slot0.cur_act_list and #slot0.cur_act_list > 0 then
		if slot0.ticket:hasTicket("delayPlayStory") then
			slot0.ticket:remove("delayPlayStory")
		end

		StoryController:getInstance():send_11100(slot1:getCurStoryBid(), slot2)

		if type(table.remove(slot0.cur_act_list, 1)[1]) == "table" then
			slot0:actTeamPlayer(slot3)
		else
			slot0:actLonelyPlayer({
				slot3
			}, false)
		end
	else
		StoryController:getInstance():send_11100(slot1:getCurStoryBid(), slot2)
	end
end

function StoryView.actTeamPlayer(slot0, slot1)
	for slot6 = #slot1, 1, -1 do
		slot7 = slot1[slot6]
		slot2 = math.max(0, slot7[2] + slot7[3])

		slot0.ticket:add(function ()
			uv0:actLonelyPlayer({
				uv1
			}, true)
		end, slot7[2], 1)
	end

	if slot2 > 0 then
		slot0.ticket:add(function ()
			uv0:playNextAct()
		end, slot2, 0, "delayPlayStory")
	else
		slot0:playNextAct()
	end
end

function StoryView.actLonelyPlayer(slot0, slot1, slot2)
	slot3 = nil

	for slot7, slot8 in pairs(slot1) do
		if table.remove(deepCopy(slot8), 1) == "unit_dialog" then
			slot0:showTalk(slot8[3], slot8[4], slot8[5], slot8[6], slot8[7])
			slot0:playActSound(slot8[8])
		elseif slot7 == "unit_opening" then
			slot0:playWelcom(true, slot8[3])
			slot0:playActSound(slot8[4])
		elseif slot7 == "comic_begin" then
			slot0:playStartManga(true, slot8[3], slot8[4])
			slot0:playActSound(slot8[5])
		elseif slot7 == "unit_black" then
			slot0:showBlackCurtain(true, slot8[3], slot8[5], slot8[6])
			slot0:playActSound(slot8[4])
		end

		if slot2 then
			return
		end

		slot10 = slot8[2] or 0

		function slot10()
			uv0:playNextAct()
		end

		if (slot8[1] or 0) + slot10 == 0 then
			slot0:playNextAct()
		elseif slot9 > 0 and not slot2 then
			slot0.ticket:add(slot10, slot9, 0, "delayPlayStory")
		end
	end
end

function StoryView.playActSound(slot0, slot1)
	if slot1 then
		AudioManager:getInstance():stopAllSoundByType(AudioManager.AUDIO_TYPE.Drama)
		AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.Drama, slot1, false)
	end
end

function StoryView.storyOverHandler(slot0)
	if slot0.ticket:hasTicket("delayPlayStory") then
		slot0.ticket:remove("delayPlayStory")
	end

	if slot0.cur_bubble ~= nil and not tolua.isnull(slot0.cur_bubble:getRootWnd()) then
		doStopAllActions(slot0.cur_bubble:getRootWnd())
		slot0.cur_bubble:DeleteMe()
	end

	slot0.cur_bubble = nil

	slot0:hideTalk()
	slot0:clearDramaData()
	slot0:playStartManga(false)
	slot0:playWelcom(false)
	slot0:showBlackCurtain(false)
end

function StoryView.clearDramaData(slot0)
	slot0.cur_step = 0

	StoryController:getInstance():getModel():setStoryState(false)

	slot0.cur_drama = nil
	slot0.is_next_action = false
end

function StoryView.showTalk(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.is_next_action = true

	if slot0.talk == nil then
		slot0.talk = StoryTalk.New(slot0.cur_drama.is_skip)

		slot0.talk:open(slot1, slot2, slot3, slot4, slot5)
	else
		slot0.talk:setData(slot1, slot2, slot3, slot4, slot5)
	end
end

function StoryView.playStartManga(slot0, slot1, slot2, slot3)
	if slot1 == true then
		slot0.is_next_action = true

		if slot0.manga_view == nil then
			slot0.manga_view = StoryMangaView.New()
		end

		slot0.manga_view:open(slot2, slot3)
	elseif slot0.manga_view then
		slot0.manga_view:close()

		slot0.manga_view = nil
	end
end

function StoryView.playWelcom(slot0, slot1, slot2)
	if slot1 == true then
		slot0.is_next_action = true

		if slot0.welcom_window == nil then
			slot0.welcom_window = DramaWelcommeWindow.New()
		end

		slot0.welcom_window:open(slot2)
	elseif slot0.welcom_window then
		slot0.welcom_window:close()

		slot0.welcom_window = nil
	end
end

function StoryView.showBlackCurtain(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		slot0.is_next_action = true

		if slot0.black_curtain_window == nil then
			slot0.black_curtain_window = DramaBlackCurtainWindow.New()
		end

		slot0.black_curtain_window:open(slot2, slot3, slot4)
	elseif slot0.black_curtain_window then
		slot0.black_curtain_window:close()

		slot0.black_curtain_window = nil
	end
end

function StoryView.hideTalk(slot0)
	if slot0.ticket:hasTicket("delayPlayStory") then
		slot0.ticket:remove("delayPlayStory")
	end

	if slot0.talk then
		slot0.talk:close()

		slot0.talk = nil
	end
end

function StoryView.showBubble(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = BattleController:getInstance()
	slot8 = slot7:getModel()

	if slot7:getIsNoramalBattle() then
		slot8 = slot7:getNormalModel()
	end

	if slot8 == nil then
		return
	end

	slot9, slot10, slot11 = nil
	slot12 = slot6 or 1
	slot3 = slot3 or ""
	slot13 = nil

	if not slot7:getIsNoramalBattle() then
		slot13 = slot8:getUnitById(slot2)
	end

	if slot13 ~= nil then
		slot9 = {
			root = slot13.container,
			role_height = slot13.boxHeight
		}
		slot10 = slot13.world_pos
	elseif slot8:getAllObject() ~= nil then
		for slot18, slot19 in pairs(slot14) do
			if slot19.pos == slot2 then
				if slot19.is_die then
					return
				end

				slot9 = slot19.spine_renderer
				slot11 = 0
				slot10 = gridPosToScreenPos(slot19.grid_pos)
			end
		end

		if slot9 == nil and not slot5 then
			delayOnce(function ()
				uv0:showBubble(uv1, uv2, uv3, uv4, true)
			end, 0.2)
		end
	end

	if slot9 and slot10 then
		slot0:createBubble(slot9, slot1, slot3, slot10, slot11, slot12)
	end
end

function StoryView.createBubble(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot1 == nil or slot1.root == nil or tolua.isnull(slot1.root) then
		return
	end

	if slot1.bubble_paopao then
		slot1.bubble_paopao:DeleteMe()

		slot1.bubble_paopao = nil
	end

	slot7 = StoryBubble.New(slot1.root)

	slot7:getRootWnd():setScale(1 / slot6)
	slot7:getRootWnd():setCascadeOpacityEnabled(true)
	slot7:getRootWnd():setOpacity(255)
	slot7:getRootWnd():setLocalZOrder(slot1.root:getGlobalZOrder() + 99)

	slot8 = cc.FadeIn:create(0.5)
	slot9 = cc.FadeOut:create(0.5)

	if slot4.x > display.width - 100 then
		slot7:setData(slot3)
		slot7:setPosition(0, (slot1.role_height or 0) + (slot5 or 0))
	elseif slot4.x - slot7:getRootWnd():getContentSize().width < 0 then
		slot7:setData(slot3, true)
		slot7:setPosition(slot7:getRootWnd():getContentSize().width, (slot1.role_height or 0) + (slot5 or 0))
	else
		slot7:setData(slot3)
		slot7:setPosition(slot1.root:getContentSize().width / 2, (slot1.role_height or 0) + (slot5 or 0))
	end

	slot7:getRootWnd():runAction(cc.Sequence:create(slot8, cc.DelayTime:create(slot2), slot9, cc.CallFunc:create(function ()
		uv0:DeleteMe()
	end)))

	if StoryController:getInstance():getModel():isStoryState() then
		slot0.is_next_action = true
		slot0.cur_bubble = slot7

		slot7:addCloseCallBack(function ()
			uv0.cur_bubble = nil
		end)
	else
		slot1.bubble_paopao = slot7

		slot7:addCloseCallBack(function ()
			uv0.bubble_paopao = nil
		end)
	end
end
