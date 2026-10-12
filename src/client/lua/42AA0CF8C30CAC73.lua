AuguryModel = AuguryModel or BaseClass()

function AuguryModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function AuguryModel.config(slot0)
	slot0.flash_count = 0
	slot0.luck = 0
	slot0.end_count = 0
	slot0.flag = 0
	slot0.quality = 0
	slot0.day_gold_count = 0
	slot0.have_free_times = false
end

function AuguryModel.getFlashCount(slot0)
	return slot0.flash_count
end

function AuguryModel.updateData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.ref_count then
		slot0.flash_count = slot1.ref_count or 0
	end

	if slot1.end_count then
		slot0.end_count = slot1.end_count or 0
	end

	if slot1.luck then
		slot0.luck = slot1.luck
	end

	if slot1.quality then
		slot0.quality = slot1.quality
	end

	if slot1.day_gold_count then
		slot0.day_gold_count = slot1.day_gold_count
	end

	if slot1.flag == 0 then
		slot0.have_free_times = true
	else
		slot0.have_free_times = false
	end

	GlobalEvent:getInstance():Fire(AuguryEvent.Update_Event)
end

function AuguryModel.getLuck(slot0)
	return slot0.luck
end

function AuguryModel.getLessCount(slot0)
	return slot0.end_count
end

function AuguryModel.getDataGoldCount(slot0)
	return slot0.day_gold_count
end

function AuguryModel.getQuality(slot0)
	return slot0.quality
end

function AuguryModel.checkHaveFreeTimes(slot0)
	return slot0.have_free_times
end

function AuguryModel.__delete(slot0)
end
