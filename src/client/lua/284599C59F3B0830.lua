if cc.SimpleAudioEngine == nil then
	return
end

function slot0(slot0, slot1)
end

slot1 = {
	sharedEngine = function ()
		uv0("SimpleAudioEngine:sharedEngine", "SimpleAudioEngine:getInstance")

		return cc.SimpleAudioEngine:getInstance()
	end
}
SimpleAudioEngine.sharedEngine = slot1.sharedEngine

function slot1.playBackgroundMusic(slot0, ...)
	uv0("SimpleAudioEngine:playBackgroundMusic", "SimpleAudioEngine:playMusic")

	return slot0:playMusic(...)
end

SimpleAudioEngine.playBackgroundMusic = slot1.playBackgroundMusic
