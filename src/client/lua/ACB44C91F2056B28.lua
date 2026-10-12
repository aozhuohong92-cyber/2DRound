YoumeTalk = YoumeTalk or {}

if not cc.YTalk then
	return
end

cc.exports.youmetalk = cc.YTalk:create()
cc.exports.userID = ""
cc.exports.roomID = ""
cc.exports.roleType = 0

function slot0(slot0)
	slot1 = cc.EventCustom:new("Tips")
	slot1._usedata = slot0

	cc.Director:getInstance():getEventDispatcher():dispatchEvent(slot1)
end

function cc.exports.youmetalk.OnEvent(slot0, slot1, slot2, slot3)
	print("收到Talk回调:" .. slot0 .. "," .. slot1 .. "," .. slot2 .. "," .. slot3)

	if slot0 == 0 then
		print("joinChannelSingleMode", YoumeTalk.joinChannelSingleMode("test", "test", 1, false))
		uv0("初始化成功")
	elseif slot0 == 1 then
		slot0("初始化失败")
	elseif slot0 == 2 then
		uv0("进入房间成功, ID: " .. slot2)
		print("why?")
		cc.Director:getInstance():getEventDispatcher():dispatchEvent(cc.EventCustom:new("EnterRoom"))
	elseif slot0 == 3 then
		uv0("进入房间失败")
	elseif slot0 == 4 then
		uv0("退出房间")
	elseif slot0 == 5 then
		uv0("退出房间")
	elseif slot0 == 6 then
		uv0("暂停")
	elseif slot0 == 7 then
		uv0("恢复")
	elseif slot0 == 8 then
		-- Nothing
	elseif slot0 == 9 then
		-- Nothing
	elseif slot0 == 10 then
		uv0("正在重连")
	elseif slot0 == 11 then
		uv0("重连成功")
	elseif slot0 == 12 and slot1 == -202 then
		uv0("录音启动失败")
	elseif slot0 == 13 then
		uv0("背景音乐播放结束")
	elseif slot0 == 14 then
		uv0("背景音乐播放失败")
	elseif slot0 == 15 then
		print("频道成员变化:" .. slot3)
	elseif slot0 == 16 then
		print("其他用户麦克风打开:" .. slot3)
	elseif slot0 == 17 then
		print("其他用户麦克风关闭:" .. slot3)
	elseif slot0 == 18 then
		print("其他用户扬声器打开" .. slot3)
	elseif slot0 == 19 then
		print("其他用户扬声器关闭" .. slot3)
	elseif slot0 == 20 then
		print("其他用户进入讲话状态:" .. slot3)
	elseif slot0 == 21 then
		print("其他用户进入静默状态:" .. slot3)
	elseif slot0 == 22 then
		print("麦克风的语音级别:" .. slot3)
	elseif slot0 == 23 then
		print("麦克风被其他用户打开:" .. slot3)
	elseif slot0 == 24 then
		print("麦克风被其他用户关闭:" .. slot3)
	elseif slot0 == 25 then
		print("扬声器被其他用户打开:" .. slot3)
	elseif slot0 == 26 then
		print("扬声器被其他用户关闭:" .. slot3)
	elseif slot0 == 27 then
		print("取消屏蔽某人语音:" .. slot3)
	elseif slot0 == 28 then
		print("屏蔽某人语音:" .. slot3)
	end
end

function cc.exports.youmetalk.OnMemberChange(slot0, slot1, slot2)
	print("OnMemberChange:" .. slot0 .. ",json:" .. slot1)
end

function cc.exports.youmetalk.OnRequestRestApi(slot0, slot1, slot2, slot3)
	print("OnRequestRestApi:" .. slot0)
	print(slot1)
	print(slot2)
	print(slot3)
end

function cc.exports.youmetalk.OnBroadcast(slot0, slot1, slot2, slot3, slot4)
	print("OnBroadcast:" .. slot0 .. ",channel:" .. slot1 .. ",P1:" .. slot2 .. ",P2" .. slot3 .. ",content:" .. slot4)
end

cc.exports.youmetalk.registerScriptHandler(cc.exports.youmetalk, cc.exports.youmetalk.OnEvent, cc.exports.youmetalk.OnRequestRestApi, cc.exports.youmetalk.OnMemberChange, cc.exports.youmetalk.OnBroadcast)

youmetalk_obj = cc.exports.youmetalk
YoumeTalk.strAppKey = "YOUME23C443832F3F84453C257CD8D842320A64320CC2"
YoumeTalk.strAPPSecret = "vNeRSaWi54VMrQ9B3ADFgx9OIUEKj+hSQH0sduwXvcKJ0Egfss4FbK9TpZBKGFv8CT9YHZnTTP1aCkj/q2oyZf6wMU4cwTWMP0wrhvkfP6F6CPFI+7yUqgKBHfUuTV3xM94lq7lP0KW7ub+C7mDJA6J004NaZ2EKyAXADUBcBJkBAAE="

function YoumeTalk.init()
	if YoumeTalk.is_init == nil then
		YoumeTalk.is_init = true

		return youmetalk_obj:init(YoumeTalk.strAppKey, YoumeTalk.strAPPSecret, 0, "cn")
	end
end

function YoumeTalk.joinChannelSingleMode(slot0, slot1, slot2, slot3)
	return youmetalk_obj:joinChannelSingleMode(slot0, slot1, slot2, slot3)
end

function YoumeTalk.joinChannelMultiMode(slot0, slot1, slot2)
	return youmetalk_obj:joinChannelMultiMode(slot0, slot1, slot2)
end

function YoumeTalk.speakToChannel(slot0)
	return youmetalk_obj:speakToChannel(slot0)
end

function YoumeTalk.leaveChannelMultiMode(slot0)
	return youmetalk_obj:leaveChannelMultiMode(slot0)
end

function YoumeTalk.leaveChannelAll()
	return youmetalk_obj:leaveChannelAll()
end

function YoumeTalk.setWhiteUserList(slot0, slot1)
	return youmetalk_obj:setWhiteUserList(slot0, slot1)
end

function YoumeTalk.setOutputToSpeaker(slot0)
	return youmetalk_obj:setOutputToSpeaker(slot0)
end

function YoumeTalk.setSpeakerMute(slot0)
	return youmetalk_obj:setSpeakerMute(slot0)
end

function YoumeTalk.getSpeakerMute()
	return youmetalk_obj:getSpeakerMute()
end

function YoumeTalk.setAutoSendStatus(slot0)
	return youmetalk_obj:setAutoSendStatus(slot0)
end

function YoumeTalk.setVolume(slot0)
	return youmetalk_obj:setVolume(slot0)
end

function YoumeTalk.setHeadsetMonitorOn(slot0, slot1)
	return youmetalk_obj:setHeadsetMonitorOn(slot0, slot1)
end

function YoumeTalk.getVolume()
	return youmetalk_obj:getVolume()
end

function YoumeTalk.setUseMobileNetworkEnabled(slot0)
	return youmetalk_obj:setUseMobileNetworkEnabled(slot0)
end

function YoumeTalk.getUseMobileNetworkEnabled()
	return youmetalk_obj:getUseMobileNetworkEnabled()
end

function YoumeTalk.setOtherMicMute(slot0, slot1)
	return youmetalk_obj:setOtherMicMute(slot0, slot1)
end

function YoumeTalk.setOtherSpeakerMute(slot0, slot1)
	return youmetalk_obj:setOtherSpeakerMute(slot0, slot1)
end

function YoumeTalk.setListenOtherVoice(slot0, slot1)
	return youmetalk_obj:setListenOtherVoice(slot0, slot1)
end

function YoumeTalk.setReleaseMicWhenMute(slot0)
	return youmetalk_obj:setReleaseMicWhenMute(slot0)
end

function YoumeTalk.setExitCommModeWhenHeadsetPlugin(slot0)
	return youmetalk_obj:setExitCommModeWhenHeadsetPlugin(slot0)
end

function YoumeTalk.pauseChannel()
	return youmetalk_obj:pauseChannel()
end

function YoumeTalk.resumeChannel()
	return youmetalk_obj:resumeChannel()
end

function YoumeTalk.setVadCallbackEnabled(slot0)
	return youmetalk_obj:setVadCallbackEnabled(slot0)
end

function YoumeTalk.playBackgroundMusic(slot0, slot1)
	return youmetalk_obj:playBackgroundMusic(slot0, slot1)
end

function YoumeTalk.stopBackgroundMusic()
	return youmetalk_obj:stopBackgroundMusic()
end

function YoumeTalk.setBackgroundMusicVolume(slot0)
	return youmetalk_obj:setBackgroundMusicVolume(slot0)
end

function YoumeTalk.getSoundtouchPitchSemiTones()
	return youmetalk_obj:getSoundtouchPitchSemiTones()
end

function YoumeTalk.setSoundtouchPitchSemiTones(slot0)
	return youmetalk_obj:setSoundtouchPitchSemiTones(slot0)
end

function YoumeTalk.setReverbEnabled(slot0)
	return youmetalk_obj:setReverbEnabled(slot0)
end

function YoumeTalk.setRecordingTimeMs(slot0)
	return youmetalk_obj:setRecordingTimeMs(slot0)
end

function YoumeTalk.setPlayingTimeMs(slot0)
	return youmetalk_obj:setPlayingTimeMs(slot0)
end

function YoumeTalk.setServerRegion(slot0, slot1)
	return youmetalk_obj:setServerRegion(slot0, slot1)
end

function YoumeTalk.requestRestApi(slot0, slot1)
	return youmetalk_obj:requestRestApi(slot0, slot1)
end

function YoumeTalk.setToken(slot0)
	return youmetalk_obj:setToken(slot0)
end

function YoumeTalk.getChannelUserList(slot0, slot1, slot2)
	return youmetalk_obj:getChannelUserList(slot0, slot1, slot2)
end

function YoumeTalk.sendMessage(slot0, slot1)
	return youmetalk_obj:sendMessage(slot0, slot1)
end

function YoumeTalk.kickOtherFromChannel(slot0, slot1, slot2)
	return youmetalk_obj:kickOtherFromChannel(slot0, slot1, slot2)
end

function YoumeTalk.setLogLevel(slot0)
	return youmetalk_obj:setLogLevel(slot0)
end

function YoumeTalk.unInit()
	if YoumeTalk.is_init then
		YoumeTalk.is_init = nil

		youmetalk_obj:unInit()
	end
end

print = game_print

print("========= YoumeTalk=== init")
print("========= YoumeTalk=== init end")
