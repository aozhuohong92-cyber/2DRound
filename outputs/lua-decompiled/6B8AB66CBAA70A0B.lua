AudioManager = AudioManager or BaseClass()
AudioManager.AUDIO_TYPE = {
	COMMON = "common",
	DUBBING = "dubbing",
	Drama = "drama",
	SCENE = "scene",
	Recruit = "recruit",
	BATTLE = "battle"
}

function AudioManager.getInstance(slot0, ...)
	if AudioManager.instance == nil then
		AudioManager.instance = AudioManager.New()
	end

	return AudioManager.instance
end

function AudioManager.__init(slot0, ...)
	if AudioManager.instance ~= nil then
		return
	end

	slot0.music_volume = SysEnv:getInstance():getNum(SysEnv.keys.music_volume, 100)
	slot0.music_volume = slot0.music_volume / 100

	slot0:setMusicVolume(slot0.music_volume)

	slot0.effect_volume = SysEnv:getInstance():getNum(SysEnv.keys.audio_volume, 100)
	slot0.effect_volume = slot0.effect_volume / 100

	slot0:setEffectVolume(slot0.effect_volume)

	slot0.effect_list = {}
	slot0.load_music_list = {}
end

function AudioManager.preLoadMusic(slot0, slot1, slot2)
	audio.preloadMusic(PathTool.getSound(slot1, slot2))
end

function AudioManager.preLoadEffect(slot0, slot1, slot2)
	audio.preloadSound(PathTool.getSound(slot1, slot2))
end

function AudioManager.preLoadMusicByPath(slot0, slot1)
	audio.preloadMusic(slot1)
end

function AudioManager.preLoadEffectByPath(slot0, slot1)
	audio.preloadSound(slot1)
end

function AudioManager.unLoadEffect(slot0, slot1, slot2)
	audio.unloadSound(PathTool.getSound(slot1, slot2))
end

function AudioManager.playMusic(slot0, slot1, slot2, slot3)
	if IS_VERIFYIOS_AUDIO == true then
		return
	end

	if slot1 == nil or slot1 == "" or slot2 == nil or slot2 == "" then
		return
	end

	slot4 = {
		type = slot1,
		name = slot2,
		is_loop = slot3 or false
	}

	if slot0.music and slot0.music.type == slot4.type and slot0.music.name == slot4.name then
		return
	end

	slot0.last_music = slot0.music or slot4
	slot0.music = slot4

	if slot0.load_music_list[PathTool.getSound(slot0.music.type, slot0.music.name)] == nil then
		slot0.load_music_list[slot5] = slot5
	end

	audio.playMusic(slot5, slot0.music.is_loop)
end

function AudioManager.showLoadMuiscPath(slot0)
end

function AudioManager.playLastMusic(slot0)
	if slot0.last_music then
		slot0:playMusic(slot0.last_music.type, slot0.last_music.name, slot0.last_music.is_loop)
	end
end

function AudioManager.setMusicVolume(slot0, slot1)
	slot0.music_volume = slot1

	if SysEnv:getInstance():getBool(SysEnv.keys.music_is_open, true) then
		audio.setMusicVolume(slot1)
	else
		audio.setMusicVolume(0)
	end
end

function AudioManager.pauseMusic(slot0, ...)
	audio.pauseMusic()
end

function AudioManager.resumeMusic(slot0)
	audio.resumeMusic()
end

function AudioManager.stopMusic(slot0)
	if slot0.last_music ~= nil and slot0.last_music.type == AudioManager.AUDIO_TYPE.BATTLE then
		slot0.music.name = nil
		slot0.music = nil
		slot0.last_music = nil
	end

	audio.stopMusic()
end

function AudioManager.playEffect(slot0, slot1, slot2, slot3)
	if IS_VERIFYIOS_AUDIO == true then
		return
	end

	if not slot2 or slot2 == "" then
		return
	end

	if not PathTool.isFileExist(PathTool.getSound(slot1, slot2)) then
		return
	end

	if SysEnv:getInstance():getBool(SysEnv.keys.audio_is_open, true) == true then
		if slot0.time_ticket == nil then
			slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0:removeEffect()
			end, 1)
		end

		if slot0.effect_list[audio.playSound(slot4, slot3)] == nil then
			slot0.effect_list[slot6] = {
				file_name = slot4,
				sound_id = slot6,
				sound_type = slot1
			}
		end

		slot7.time = GameNet:getInstance():getTime()

		if Config.VoiceData.data_voice_info[slot1] and Config.VoiceData.data_voice_info[slot1][slot2] then
			slot8 = (Config.VoiceData.data_voice_info[slot1][slot2].time or 4) + 1

			if slot0.voice_time_ticket == nil then
				AudioManager:getInstance():setMusicVolume((SysEnv:getInstance():getNum(SysEnv.keys.music_volume, 100) - 60) / 100)
			else
				GlobalTimeTicket:getInstance():remove(slot0.voice_time_ticket)

				slot0.voice_time_ticket = nil
			end

			slot0.voice_time_ticket = GlobalTimeTicket:getInstance():add(function ()
				AudioManager:getInstance():setMusicVolume(SysEnv:getInstance():getNum(SysEnv.keys.music_volume, 100) / 100)

				uv0.voice_time_ticket = nil
			end, slot8, 1)
		end

		return slot7
	end
end

function AudioManager.playEffectForHandAudoRemove(slot0, slot1, slot2, slot3)
	if IS_VERIFYIOS_AUDIO == true then
		return
	end

	if not slot2 or slot2 == "" then
		return
	end

	if not PathTool.isFileExist(PathTool.getSound(slot1, slot2)) then
		return
	end

	if SysEnv:getInstance():getBool(SysEnv.keys.audio_is_open, true) == true then
		return audio.playSound(slot4, slot3)
	end
end

function AudioManager.removeEffectBySoundId(slot0, slot1)
	if not slot1 then
		return
	end

	audio.stopSound(slot1)
end

function AudioManager.removeEffectByData(slot0, slot1)
	if slot1.sound_id ~= nil then
		if slot0.effect_list[slot1.sound_id] then
			audio.stopSound(slot1.sound_id)
		end

		slot0.effect_list[slot1.sound_id] = nil
	end
end

function AudioManager.removeEffect(slot0)
	slot1 = GameNet:getInstance():getTime()
	slot2 = #slot0.effect_list

	if slot0.effect_list and next(slot0.effect_list) ~= nil then
		for slot6, slot7 in pairs(slot0.effect_list) do
			if slot1 - slot7.time >= 10 then
				audio.stopSound(slot7.sound_id)

				slot0.effect_list[slot6] = nil
			end
		end
	else
		slot0:clearTimeTicket()
	end
end

function AudioManager.stopAllSoundByType(slot0, slot1)
	if slot0.effect_list and next(slot0.effect_list) ~= nil then
		for slot5, slot6 in pairs(slot0.effect_list) do
			if slot6.sound_type == slot1 then
				audio.stopSound(slot6.sound_id)

				slot0.effect_list[slot5] = nil
			end
		end
	end
end

function AudioManager.setEffectVolume(slot0, slot1)
	slot0.effect_volume = slot1

	if SysEnv:getInstance():getBool(SysEnv.keys.audio_is_open, true) then
		audio.setSoundsVolume(slot1)
	else
		audio.setSoundsVolume(0)
	end
end

function AudioManager.setRecordVolume(slot0, slot1)
	if audio.setRecordVolume then
		if SysEnv:getInstance():getBool(SysEnv.keys.voice_is_open, true) then
			audio.setRecordVolume((slot1 or 0) / 100)
		else
			audio.setRecordVolume(0)
		end
	end
end

function AudioManager.getMusicInfo(slot0)
	if slot0.music then
		return slot0.music
	end
end

function AudioManager.playSound(slot0, slot1)
	if IS_VERIFYIOS_AUDIO == true then
		return
	end

	slot2 = PathTool.getVoicePath(slot1)

	if slot0.soundHandle then
		audio.stopSound(slot0.soundHandle)

		slot0.soundHandle = nil
	end

	slot0.soundHandle = audio.playSound(slot2, false)
end

function AudioManager.clearTimeTicket(slot0)
	if slot0.time_ticket then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function AudioManager.cleanAll(slot0)
	slot0:stopMusic()
	slot0:clearTimeTicket()
end

function AudioManager.__delete(slot0)
	slot0:cleanAll()
end

function AudioManager.DeleteMe(slot0)
	slot0:cleanAll()
end
