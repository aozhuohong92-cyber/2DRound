ChatMgr = ChatMgr or BaseClass()

function ChatMgr.__init(slot0)
	if ChatMgr.Instance ~= nil then
		error("[ChatMgr] cann't be created twice!")

		return
	end

	ChatMgr.Instance = slot0
	slot0.vip_lev = -1
	slot0.speak_times = {}

	if Config.SayData.data_const then
		if Config.SayData.data_const.cooldown_same_province then
			slot0.speak_times[ChatConst.Channel.Province] = Config.SayData.data_const.cooldown_same_province.val
		end

		if Config.SayData.data_const.cooldown_cross_service then
			slot0.speak_times[ChatConst.Channel.Cross] = Config.SayData.data_const.cooldown_cross_service.val
		end

		if Config.SayData.data_const.cooldown_world then
			slot0.speak_times[ChatConst.Channel.World] = Config.SayData.data_const.cooldown_world.val
		end

		if Config.SayData.data_const.cooldown_guild then
			slot0.speak_times[ChatConst.Channel.Gang] = Config.SayData.data_const.cooldown_guild.val
		end

		if Config.SayData.data_const.cooldown_team then
			slot0.speak_times[ChatConst.Channel.Team] = Config.SayData.data_const.cooldown_team.val
		end
	end
end

function ChatMgr.getInstance(slot0)
	if ChatMgr.Instance == nil then
		ChatMgr.New()
	end

	return ChatMgr.Instance
end

function ChatMgr.__delete(slot0)
	ChatMgr.Instance = nil
end

function ChatMgr.playVoice(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1.__is_playing__ then
		return
	end

	if slot0.__playing then
		return
	end

	if tolua.isnull(slot1) then
		return
	end

	slot0.__playing = true
	slot0.finish_func = slot3
	slot0.voice_icon = slot1
	slot0.voice_icon.__is_playing__ = true
	slot6 = SoundEffect.new()

	slot6:setPosition(cc.p(slot1:getPositionX() + (slot4 or 0), slot1:getPositionY() + (slot5 or 0)))
	slot6:play()
	slot1:setVisible(false)
	slot1:getParent():addChild(slot6)

	slot0.sound_effect = slot6

	slot1:registerScriptHandler(function (slot0)
		if slot0 == "exit" then
			uv0.sound_effect = nil
			uv0.voice_icon = nil
			uv0.__playing = nil

			AudioManager:getInstance():resumeMusic()
		end
	end)
	slot1:stopAllActions()
	slot1:runAction(cc.Sequence:create(cc.DelayTime:create(slot2), cc.CallFunc:create(function ()
		uv0:stopVoice()
	end)))
	AudioManager:getInstance():pauseMusic()
end

function ChatMgr.stopVoice(slot0)
	if not tolua.isnull(slot0.sound_effect) then
		slot0.sound_effect:stop()
		doRemoveFromParent(slot0.sound_effect)

		slot0.sound_effect = nil
	end

	if slot0.finish_func then
		slot0.finish_func()
	end

	if not tolua.isnull(slot0.voice_icon) then
		slot0.voice_icon:stopAllActions()
		slot0.voice_icon:setVisible(true)

		slot0.voice_icon.__is_playing__ = nil
	end

	AudioManager:getInstance():resumeMusic()

	slot0.__playing = nil
end

function ChatMgr.isPlaying(slot0)
	return slot0.__playing
end

function ChatMgr.touchVoice(slot0, slot1, slot2)
	if not slot1 or slot0.__playing then
		return 0
	end

	slot3 = 0

	if not PathTool.checkSound(ChatHelp.formatFileName(slot1)) then
		ChatHelp.setDownloadAddress2(slot1)
		cc.FmodexManager:downloadFile(slot4)

		slot3 = 1

		setWillPlaySound(slot4)
	else
		AudioManager:getInstance():playSound(slot4)
	end

	return slot3
end

function ChatMgr.onTouchHead(slot0, slot1, slot2, slot3, slot4, slot5)
	if tolua.isnull(slot1) then
		return
	end

	if RoleController:getInstance():getRoleVo().rid ~= slot2 or slot6.srv_id ~= slot3 then
		if slot0.chat_teamid_call then
			GlobalEvent:getInstance():UnBind(slot0.chat_teamid_call)

			slot0.chat_teamid_call = nil
		end

		slot0.chat_teamid_call = GlobalEvent:getInstance():Bind(EventId.CHAT_TEAMID_CALL, function (slot0)
			GlobalEvent:getInstance():UnBind(uv0.chat_teamid_call)

			uv0.chat_teamid_call = nil

			if tolua.isnull(uv1) then
				return
			end

			slot1 = uv1:getTouchEndPosition()
			slot2 = {
				rid = slot0.rid,
				srv_id = slot0.srv_id,
				teamId = slot0.team_id,
				teamSrvId = slot0.team_srv_id,
				name = uv2
			}
		end)
	end
end

function ChatMgr.isChatRead(slot0, slot1)
	if not slot0.stack_read then
		slot0.stack_read = {}
	end

	return slot0.stack_read[slot1]
end

function ChatMgr.setChatRead(slot0, slot1)
	if not slot0.stack_read then
		slot0.stack_read = {}
	end

	slot0.stack_read[slot1] = 0
end

function ChatMgr.analyseTeamHelp(slot0, slot1)
	if slot1.len == 3 and #Split(slot1.msg, "|") >= 15 then
		return {
			rid = tonumber(slot2[1]),
			srv_id = tostring(slot2[2]),
			name = tostring(slot2[3]),
			lev = tonumber(slot2[4]),
			career = tonumber(slot2[5]),
			sex = tonumber(slot2[6]),
			mis_name = tostring(slot2[7]),
			min_lev = tonumber(slot2[8]),
			max_lev = tonumber(slot2[9]),
			min_num = tonumber(slot2[10]),
			max_num = tonumber(slot2[11]),
			purpose = tonumber(slot2[12]),
			tar_val = tonumber(slot2[13]),
			teamId = tonumber(slot2[14]),
			teamSrvId = tostring(slot2[15]),
			capacity = tonumber(slot2[16]),
			head_bid = tonumber(slot2[17]),
			len = 3
		}
	end
end

function ChatMgr.canSpeak(slot0, slot1)
	if slot1 == ChatConst.Channel.World then
		-- Nothing
	elseif slot1 == ChatConst.Channel.Team then
		-- Nothing
	elseif slot0.channel == ChatConst.Channel.Gang and not RoleController:getInstance():getRoleVo():isHasGuild() then
		message(TI18N("您没有加入公会，不能在公会频道发言"))

		return false
	end

	slot2 = slot0.speak_times[slot1] or 0
	slot3 = GameNet:getInstance():getTime()

	if slot0["sec_" .. slot1] and slot3 - slot2 < slot0["sec_" .. slot1] then
		message(string.format(TI18N("距离下次发言还剩下%s秒"), math.floor(slot0["sec_" .. slot1] + slot2 - slot3)))

		return false
	end

	return true
end

function ChatMgr.setSpeakTime(slot0, slot1, slot2)
	slot0["sec_" .. slot1] = slot2 or GameNet:getInstance():getTime()
end

function ChatMgr.showReportUI(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 then
		if not slot0.maskUi then
			slot0.maskUi = ccui.Layout:create()

			slot0.maskUi:setTouchEnabled(true)
			slot0.maskUi:setSwallowTouches(false)
			slot0.maskUi:setContentSize(SCREEN_WIDTH, SCREEN_HEIGHT)
			ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):addChild(slot0.maskUi)
			handleTouchEnded(slot0.maskUi, function (...)
				delayRun(uv0.maskUi, 0.03, function ()
					uv0:showReportUI(false)
				end)
			end)
		end
	else
		if slot0.maskUi and not tolua.isnull(slot0.maskUi) then
			slot0.maskUi:removeFromParent()
		end

		slot0.maskUi = nil

		if slot0.copyUi and not tolua.isnull(slot0.copyUi) then
			slot0.copyUi:removeFromParent()
		end

		slot0.copyUi = nil
	end
end
