VoiceMgr = VoiceMgr or BaseClass()
VoiceMgr.NewMsg = "VoiceMgr.NewMsg"
VoiceMgr.Played = "VoiceMgr.Played"

function VoiceMgr.__init(slot0)
	if VoiceMgr.Instance then
		error("[VoiceMgr] accempt to create singleton twice!")

		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(string.format("%svoice", cc.FileUtils:getInstance():getWritablePath())) then
		cc.FileUtils:getInstance():createDirectory(slot1)
	end

	VoiceMgr.Instance = slot0

	slot0:initMsg()
end

function VoiceMgr.getInstance(slot0)
	if VoiceMgr.Instance == nil then
		VoiceMgr.New()
	end

	return VoiceMgr.Instance
end

function VoiceMgr.initMsg(slot0)
	slot0.auto_list = {}
	slot0.voice_msg = {}
	slot0.record = {}
	slot0.once_sec = 1
	slot0.once_gap = 5
	slot0.cache_voice_file = FixArray.New(50, function (slot0)
		slot1 = slot0.key .. "@" .. slot0.time
		uv0.record[slot1] = nil
		uv0.voice_msg[slot1] = nil

		cc.FileUtils:getInstance():removeFile(PathTool.getVoicePath(slot0.file))
	end)
end

function VoiceMgr.addCacheVoiceFile(slot0, slot1, slot2, slot3)
	slot4 = {
		key = slot1,
		file = slot2,
		time = slot3
	}

	slot0.cache_voice_file:PushBack(slot4)

	return slot4
end

function VoiceMgr.getMsg(slot0, slot1)
	if slot0.voice_msg[slot1] then
		return true, slot0.voice_msg[slot1]
	else
		return false, ""
	end
end

function VoiceMgr.setMsg(slot0, slot1, slot2)
	slot0.voice_msg[slot1] = slot2

	GlobalEvent:getInstance():Fire(VoiceMgr.NewMsg, slot1, slot2)
end

function VoiceMgr.splitVoice(slot0, slot1)
	slot2 = ""
	slot3 = 0

	if slot1 then
		slot2 = Split(slot1, "@")[1] or ""
		slot3 = slot4[2] or 0
	end

	return slot2, slot3
end

function VoiceMgr.playVoice(slot0, slot1)
	if slot0.playing then
		message("语音播放中")

		return
	end

	slot2, slot3 = slot0:splitVoice(slot1)

	if slot2 == "" or slot3 == 0 then
		return
	end

	slot0:loadFileNew(slot2, slot3)
end

function VoiceMgr.loadFileNew(slot0, slot1, slot2)
	if not keyfind("key", slot1, slot0.cache_voice_file.items) then
		if PathTool.checkSound(ChatHelp.formatFileName(slot1)) then
			slot0:startPlay(slot0:addCacheVoiceFile(slot1, slot4, slot2))
		else
			slot5 = Split(slot1, "-")

			ChatController:getInstance():sender12726(slot5[1], tonumber(slot5[2]))
		end
	elseif not PathTool.checkSound(slot3.file) then
		message("查找不到语音文件啦")
	else
		slot0:startPlay(slot3)
	end
end

function VoiceMgr.startPlay(slot0, slot1)
	if slot0.playing then
		return
	end

	slot2 = 0

	if not PathTool.checkSound(slot1.file) then
		slot2 = slot0.once_sec
	end

	slot0:removeDelayTimer()

	slot3 = slot1.key .. "@" .. slot1.time
	slot0.record[slot3] = 0
	slot4 = slot1.time + slot2
	slot0.playUrl = slot3

	slot0:setPlaying(true)
	slot0:removeTimer()

	slot5 = callAudioGetVolume()
	slot0.timer = GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 - 1

		if uv0 <= 0 then
			callAudioSetVolume(uv1)
			uv2:stopVoice()
			uv2:delayCheck()
		end
	end, 1)

	delayOnce(function ()
		callAudioSetVolume(math.max(uv0, 85))
		AudioManager:getInstance():playSound(uv1.file)
	end, 0.2)
end

function VoiceMgr.loadFile(slot0, slot1)
	if not PathTool.checkSound(ChatHelp.formatFileName(slot1)) then
		cc.FmodexManager:downloadOtherFile(ChatHelp.getDownloadAddress2(slot1) .. slot2, "../../voice/" .. slot2)
		setWillPlaySound(slot2)
	else
		AudioManager:getInstance():playSound(slot2)
	end
end

function VoiceMgr.stopVoice(slot0)
	slot0:removeTimer()
	slot0:setPlaying(false)
end

function VoiceMgr.removeTimer(slot0)
	if slot0.timer then
		GlobalTimeTicket:getInstance():remove(slot0.timer)

		slot0.timer = nil
		slot0.playUrl = nil
	end
end

function VoiceMgr.isPlayed(slot0, slot1)
	return slot0.record[slot1] ~= nil
end

function VoiceMgr.isPlaying(slot0, slot1)
	if slot0.playing and slot1 and slot0.playUrl == slot1 then
		return true
	end

	return false
end

function VoiceMgr.setPlaying(slot0, slot1)
	if slot0.playing ~= slot1 then
		slot0.playing = slot1

		GlobalEvent:getInstance():Fire(VoiceMgr.Played, slot1)

		if slot1 then
			AudioManager:getInstance():pauseMusic()
		else
			delayOnce(function ()
				if uv0.playing then
					return
				end

				AudioManager:getInstance():resumeMusic()
			end, 1)
		end
	end
end

function VoiceMgr.getPlaying(slot0)
	return slot0.playing
end

function VoiceMgr.showVoiceEffect(slot0, slot1, slot2, slot3, slot4)
	if tolua.isnull(slot1) then
		return
	end

	if slot2 then
		slot5 = SoundEffect.new()

		slot5:setPosition(cc.p(slot1:getPositionX() + (slot3 or 0), slot1:getPositionY() + (slot4 or 0)))
		slot5:play()
		slot1:setVisible(false)
		slot1:getParent():addChild(slot5)

		slot1.__effect = slot5
	else
		slot1:setVisible(true)

		if slot1.__effect and not tolua.isnull(slot1.__effect) then
			slot1.__effect:stop()
			slot1.__effect:removeFromParent()
		end

		slot1.__effect = nil
	end
end

function VoiceMgr.delayCheck(slot0)
	if not slot0.delayTimer then
		slot0.delayTimer = GlobalTimeTicket:getInstance():add(function ()
			uv0:checkAutoPlay()
		end, slot0.once_gap, 1)
	end
end

function VoiceMgr.removeDelayTimer(slot0)
	if slot0.delayTimer then
		GlobalTimeTicket:getInstance():remove(slot0.delayTimer)

		slot0.delayTimer = nil
	end
end

function VoiceMgr.insertVoice(slot0, slot1, slot2)
	if #slot0.auto_list > 12 then
		table.remove(slot0.auto_list, 1)
	end

	table.insert(slot0.auto_list, {
		slot1,
		slot2
	})
	slot0:checkAutoPlay()
end

function VoiceMgr.checkAutoPlay(slot0)
	if not slot0.playing then
		slot1 = nil

		for slot5 = 1, #slot0.auto_list do
			if slot0.auto_list[slot5][2] == ChatConst.Channel.Gang and SysEnv:getInstance():get(SysEnv.keys.auto_guild_voice) or slot1[2] == ChatConst.Channel.World and SysEnv:getInstance():get(SysEnv.keys.auto_world_voice) then
				slot0:playVoice(slot1[1])
				table.remove(slot0.auto_list, slot5)

				return
			end
		end
	end
end

function VoiceMgr.__delete(slot0)
	VoiceMgr.Instance = nil
	slot0.voice_msg = nil
end
