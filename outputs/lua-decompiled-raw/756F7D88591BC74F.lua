HeavenChapterVo = HeavenChapterVo or BaseClass(EventDispatcher)

function HeavenChapterVo.__init(slot0)
	slot0.id = 0
	slot0.all_star = 0
	slot0.award_info = {}
	slot0.is_finish = HeavenConst.Chapter_Pass_Status.NotPass
	slot0.red_status = false
end

function HeavenChapterVo.updateData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end

	slot0:checkChapterRedStatus()
	slot0:dispatchUpdateAttrByKey()
end

function HeavenChapterVo.dispatchUpdateAttrByKey(slot0)
	slot0:Fire(HeavenEvent.Update_Chapter_Vo_Event)
end

function HeavenChapterVo.checkChapterRedStatus(slot0)
	slot0.red_status = false

	for slot4, slot5 in pairs(slot0.award_info) do
		if slot5.flag == 1 then
			slot0.red_status = true

			break
		end
	end
end

function HeavenChapterVo.getRedStatus(slot0)
	return slot0.red_status
end

function HeavenChapterVo.__delete(slot0)
end
