SmasheggModel = SmasheggModel or BaseClass()

function SmasheggModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function SmasheggModel.config(slot0)
	slot0._egg_ani_playing = false
	slot0.myself_record_data = {}
	slot0.all_record_data = {}
end

function SmasheggModel.setSmasheggAniPlaying(slot0, slot1)
	slot0._egg_ani_playing = slot1
end

function SmasheggModel.getSmasheggAniPlaying(slot0)
	return slot0._egg_ani_playing
end

function SmasheggModel.setMyselfRecordData(slot0, slot1)
	slot0.myself_record_data = slot1
end

function SmasheggModel.getMyselfRecordData(slot0)
	return slot0.myself_record_data
end

function SmasheggModel.setAllRecordData(slot0, slot1)
	slot0.all_record_data = slot1
end

function SmasheggModel.getAllRecordData(slot0)
	return slot0.all_record_data
end

function SmasheggModel.__delete(slot0)
end
