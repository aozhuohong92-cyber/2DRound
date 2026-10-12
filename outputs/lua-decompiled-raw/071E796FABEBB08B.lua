VedioModel = VedioModel or BaseClass()

function VedioModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function VedioModel.config(slot0)
	slot0.all_vedio_data = {}
	slot0.today_like_num = 0
	slot0.today_like_is_full = false
	slot0.filt_lv_flag = true
	slot0.is_open_view = false
end

function VedioModel.setPublicVedioData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.all_vedio_data[slot1.type] then
		slot0.all_vedio_data[slot1.type] = {}
	end

	if not slot0.all_vedio_data[slot1.type][slot1.cond_type] then
		slot0.all_vedio_data[slot1.type][slot1.cond_type] = {}
	end

	if not slot0.all_vedio_data[slot1.type][slot1.cond_type].vedio_data then
		slot0.all_vedio_data[slot1.type][slot1.cond_type].vedio_data = {}
	end

	for slot5, slot6 in ipairs(slot1.replay_list) do
		table.insert(slot0.all_vedio_data[slot1.type][slot1.cond_type].vedio_data, slot6)
	end

	if slot1.len > #slot0.all_vedio_data[slot1.type][slot1.cond_type].vedio_data then
		slot0.all_vedio_data[slot1.type][slot1.cond_type].is_full = false
	else
		slot0.all_vedio_data[slot1.type][slot1.cond_type].is_full = true
	end
end

function VedioModel.getPublicVedioData(slot0, slot1, slot2)
	slot3 = {}

	if slot1 and slot2 and slot0.all_vedio_data[slot1] then
		slot3 = slot0.all_vedio_data[slot1][slot2] or {}
	end

	return slot3
end

function VedioModel.updateVedioData(slot0, slot1, slot2, slot3, slot4)
	slot5 = {}

	for slot9, slot10 in pairs(slot0.all_vedio_data) do
		for slot14, slot15 in pairs(slot10) do
			for slot19, slot20 in pairs(slot15.vedio_data) do
				if slot20.id == slot2 then
					slot20[slot3] = slot4
					slot5 = slot20
				end
			end
		end
	end

	return slot5
end

function VedioModel.checkIsReqVedioDataByType(slot0, slot1, slot2)
	if slot0.all_vedio_data[slot1] and slot0.all_vedio_data[slot1][slot2] then
		return true
	end

	return false
end

function VedioModel.setTodayLikeNum(slot0, slot1)
	slot0.today_like_num = slot1
	slot2 = false
	slot0.today_like_is_full = true

	if Config.VideoData.data_const.likes_limit and slot1 < slot3.val then
		slot2 = true
		slot0.today_like_is_full = false
	end

	if slot0.is_open_view then
		slot2 = false
	end

	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.vedio, slot2)
end

function VedioModel.getTodayLikeNum(slot0)
	return slot0.today_like_num
end

function VedioModel.checkTodayLikeIsFull(slot0)
	return slot0.today_like_is_full
end

function VedioModel.clearVedioData(slot0)
	slot0.all_vedio_data = {}
end

function VedioModel.setFiltLevelFlag(slot0, slot1)
	slot0.filt_lv_flag = slot1
end

function VedioModel.getFiltLevelFlag(slot0)
	return slot0.filt_lv_flag
end

function VedioModel.setIsOpenView(slot0, slot1)
	slot0.is_open_view = slot1
end

function VedioModel.__delete(slot0)
end
