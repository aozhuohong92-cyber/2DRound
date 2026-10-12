slot0 = {
	getMusicVolume = function ()
		return uv0:getMusicVolume()
	end,
	setMusicVolume = function (slot0)
		uv0:setMusicVolume(checknumber(slot0))
	end,
	preloadMusic = function (slot0)
		assert(slot0, "audio.preloadMusic() - invalid filename")
		uv0:preloadMusic(slot0)
	end,
	playMusic = function (slot0, slot1)
		assert(slot0, "audio.playMusic() - invalid filename")

		if type(slot1) ~= "boolean" then
			slot1 = true
		end

		uv0.stopMusic()
		uv1:playMusic(slot0, slot1)
	end,
	stopMusic = function (slot0)
		uv0:stopMusic(checkbool(slot0))
	end,
	pauseMusic = function ()
		uv0:pauseMusic()
	end,
	resumeMusic = function ()
		uv0:resumeMusic()
	end,
	rewindMusic = function ()
		uv0:rewindMusic()
	end,
	isMusicPlaying = function ()
		return uv0:isMusicPlaying()
	end,
	getSoundsVolume = function ()
		return uv0:getEffectsVolume()
	end,
	setSoundsVolume = function (slot0)
		uv0:setEffectsVolume(checknumber(slot0))
	end,
	playSound = function (slot0, slot1)
		if not slot0 then
			printError("audio.playSound() - invalid filename")

			return
		end

		if type(slot1) ~= "boolean" then
			slot1 = false
		end

		return uv0:playEffect(slot0, slot1)
	end,
	pauseSound = function (slot0)
		if not slot0 then
			printError("audio.pauseSound() - invalid handle")

			return
		end

		uv0:pauseEffect(slot0)
	end,
	pauseAllSounds = function ()
		uv0:pauseAllEffects()
	end,
	resumeSound = function (slot0)
		if not slot0 then
			printError("audio.resumeSound() - invalid handle")

			return
		end

		uv0:resumeEffect(slot0)
	end,
	resumeAllSounds = function ()
		uv0:resumeAllEffects()
	end,
	stopSound = function (slot0)
		if not slot0 then
			printError("audio.stopSound() - invalid handle")

			return
		end

		uv0:stopEffect(slot0)
	end,
	stopAllSounds = function ()
		uv0:stopAllEffects()
	end
}
slot1 = cc.SimpleAudioEngine:getInstance()
slot0.stopAllEffects = slot0.stopAllSounds

function slot0.preloadSound(slot0)
	if not slot0 then
		printError("audio.preloadSound() - invalid filename")

		return
	end

	uv0:preloadEffect(slot0)
end

function slot0.unloadSound(slot0)
	if not slot0 then
		printError("audio.unloadSound() - invalid filename")

		return
	end

	uv0:unloadEffect(slot0)
end

return slot0
