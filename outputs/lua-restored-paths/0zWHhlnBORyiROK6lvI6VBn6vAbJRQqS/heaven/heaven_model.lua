slot0 = table.insert
HeavenModel = HeavenModel or BaseClass()

function HeavenModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function HeavenModel.config(slot0)
	slot0.left_challenge_count = 0
	slot0.today_buy_count = 0
	slot0.chapter_list = {}
	slot0.customs_list = {}
	slot0.max_pass_chapter_id = 0
	slot0.max_dun_id = 0
	slot0.dial_data = {}
	slot0.myself_record_data = {}
	slot0.all_record_data = {}
	slot0.heaven_red_list = {}
	slot0.all_score = 0
end

function HeavenModel.clearData(slot0)
	slot0:config()
end

function HeavenModel.setLeftChallengeCount(slot0, slot1)
	slot0.left_challenge_count = slot1 or 0

	slot0:checkHeavenRedStatus()
end

function HeavenModel.getLeftChallengeCount(slot0)
	return slot0.left_challenge_count
end

function HeavenModel.setTodayBuyCount(slot0, slot1)
	slot0.today_buy_count = slot1 or 0
end

function HeavenModel.getTodayBuyCount(slot0)
	return slot0.today_buy_count
end

function HeavenModel.getTodayLeftBuyCount(slot0)
	if (Config.DungeonHeavenData.data_count_buy_length or 0) - slot0.today_buy_count < 0 then
		slot2 = 0
	end

	return slot2
end

function HeavenModel.setMaxDunId(slot0, slot1)
	if not slot0.max_dun_id or slot0.max_dun_id < slot1 then
		slot0.max_dun_id = slot1
	end
end

function HeavenModel.getMaxDunId(slot0)
	return slot0.max_dun_id
end

function HeavenModel.setChapterData(slot0, slot1)
	slot0.chapter_list = {}

	for slot5, slot6 in pairs(slot1) do
		slot7 = HeavenChapterVo.New()

		slot7:updateData(slot6)
		uv0(slot0.chapter_list, slot7)
	end

	slot0:updateMaxPassChapterId()
	slot0:checkHeavenRedStatus()
end

function HeavenModel.updateChapterData(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot1) do
		slot8 = false

		for slot12, slot13 in pairs(slot0.chapter_list) do
			if slot13.id == slot7.id then
				slot8 = true

				slot13:updateData(slot7)
			end
		end

		if not slot8 then
			slot2 = true
			slot9 = HeavenChapterVo.New()

			slot9:updateData(slot7)
			uv0(slot0.chapter_list, slot9)
		end
	end

	slot0:updateMaxPassChapterId()
	slot0:checkHeavenRedStatus()

	if slot2 then
		GlobalEvent:getInstance():Fire(HeavenEvent.Add_Chapter_Data_Event)
	end
end

function HeavenModel.updateOneChapterDataById(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.chapter_list) do
		if slot7.id == slot1 then
			slot7:updateData(slot2)

			break
		end
	end

	slot0:updateMaxPassChapterId()
	slot0:checkHeavenRedStatus()
end

function HeavenModel.checkIsHaveChapterCache(slot0)
	if slot0.chapter_list and next(slot0.chapter_list) ~= nil then
		return true
	else
		return false
	end
end

function HeavenModel.updateMaxPassChapterId(slot0)
	for slot4, slot5 in pairs(slot0.chapter_list) do
		if slot5.is_finish ~= HeavenConst.Chapter_Pass_Status.NotPass and slot0.max_pass_chapter_id < slot5.id then
			slot0.max_pass_chapter_id = slot5.id
		end
	end
end

function HeavenModel.getChapterPassStatus(slot0, slot1)
	slot2 = HeavenConst.Chapter_Pass_Status.NotPass

	for slot6, slot7 in pairs(slot0.chapter_list) do
		if slot7.id == slot1 then
			slot2 = slot7.is_finish
		end
	end

	return slot2
end

function HeavenModel.getChapterStarAwardStatus(slot0, slot1, slot2)
	slot3 = 0

	if slot0:getChapterDataById(slot1) then
		for slot8, slot9 in pairs(slot4.award_info) do
			if slot9.id == slot2 then
				slot3 = slot9.flag

				break
			end
		end
	end

	return slot3
end

function HeavenModel.getMaxPassChapterId(slot0)
	return slot0.max_pass_chapter_id
end

function HeavenModel.getOpenMaxChapterId(slot0)
	for slot5, slot6 in pairs(slot0.chapter_list) do
		if 0 < slot6.id then
			slot1 = slot6.id
		end
	end

	return slot1
end

function HeavenModel.getChapterDataById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.chapter_list) do
		if slot6.id == slot1 then
			return slot6
		end
	end
end

function HeavenModel.checkHeavenChapterIsOpen(slot0, slot1)
	if not Config.DungeonHeavenData.data_chapter[slot1] then
		return false
	end

	slot3 = true
	slot4 = ""

	if slot1 > 1 and slot0:getChapterPassStatus(slot1 - 1) == HeavenConst.Chapter_Pass_Status.NotPass then
		slot3 = false
		slot4 = TI18N("通关上一章")
	end

	for slot8, slot9 in pairs(slot2.cond_info) do
		slot11 = slot9[2]

		if not slot0:getChapterDataById(slot9[1]) or slot12.all_star < slot11 then
			slot3 = false

			if slot4 == "" then
				slot4 = string.format(TI18N("第%d章完成%d个星级目标"), slot10, slot11)

				break
			end

			slot4 = slot4 .. string.format(TI18N("，且第%d章完成%d个星级目标"), slot10, slot11)

			break
		end
	end

	return slot3, slot4 .. TI18N("开启")
end

function HeavenModel.setCustomsData(slot0, slot1, slot2)
	slot0:updateCustomsData(slot1, slot2)
end

function HeavenModel.updateCustomsData(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot1) do
		slot7.chapter_id = slot2
		slot8 = false

		for slot12, slot13 in pairs(slot0.customs_list) do
			if slot13.id == slot7.id and slot13.chapter_id == slot2 then
				slot8 = true

				slot13:updateData(slot7)
			end
		end

		if not slot8 then
			slot9 = HeavenCustomsVo.New()

			slot9:updateData(slot7)
			uv0(slot0.customs_list, slot9)
		end
	end
end

function HeavenModel.checkIsHaveCustomsCache(slot0, slot1)
	slot2 = false

	if slot0.customs_list then
		for slot7, slot8 in pairs(slot0.customs_list) do
			if slot8.chapter_id == slot1 then
				slot3 = 0 + 1
			end
		end

		if Config.DungeonHeavenData.data_customs_num[slot1] == slot3 then
			slot2 = true
		end
	end

	return slot2
end

function HeavenModel.getAllCanShowCustomsDataById(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.customs_list) do
		if slot7.chapter_id == slot1 and slot7.state ~= 0 then
			uv0(slot2, slot7)
		end
	end

	return slot2
end

function HeavenModel.getCustomsDataById(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.customs_list) do
		if slot7.id == slot2 and slot7.chapter_id == slot1 then
			return slot7
		end
	end
end

function HeavenModel.getCustomsIsBossType(slot0, slot1, slot2)
	slot3 = false

	if Config.DungeonHeavenData.data_customs[slot1] and slot4[slot2] then
		slot3 = slot4[slot2].type == 1
	end

	return slot3
end

function HeavenModel.checkCustomsIsPassByDunId(slot0, slot1)
	slot2 = false

	if slot1 <= slot0.max_dun_id then
		slot2 = true
	end

	return slot2
end

function HeavenModel.getChapterMaxStarNum(slot0, slot1)
	slot2 = 0

	if Config.DungeonHeavenData.data_customs_num[slot1] then
		slot2 = Config.DungeonHeavenData.data_customs_num[slot1] * 3
	end

	return slot2
end

function HeavenModel.setHeavenLastShowChapterId(slot0, slot1)
	slot0.last_show_chapter_id = slot1
end

function HeavenModel.getHeavenLastShowChapterId(slot0)
	return slot0.last_show_chapter_id
end

function HeavenModel.checkHeavenIsOpen(slot0, slot1)
	if RoleController:getInstance():getRoleVo() == nil then
		return false
	end

	slot3 = false
	slot6 = Config.DungeonHeavenData.data_const.open_lev_second
	slot7 = ""

	if Config.DungeonHeavenData.data_const.open_world_lev and Config.DungeonHeavenData.data_const.open_lev then
		slot3 = true

		if RoleController:getInstance():getModel():getWorldLev() < slot4.val then
			slot3 = false
			slot7 = slot4.desc
		elseif slot2.lev < slot5.val then
			slot3 = false
			slot7 = slot5.desc
		end
	end

	if not slot3 and slot6 then
		slot3 = true

		if slot2.lev < slot6.val then
			slot3 = false
			slot7 = slot6.desc
		end
	end

	if not slot3 and not slot1 then
		message(slot7)
	end

	return slot3
end

function HeavenModel.checkHeavenDialIsOpen(slot0, slot1)
	slot2 = false
	slot5 = Config.HolyEqmLotteryData.data_const.player_lev_second_condition

	if Config.HolyEqmLotteryData.data_const.world_lev_condition and Config.HolyEqmLotteryData.data_const.player_lev_condition and Config.HolyEqmLotteryData.data_const.heaven_dun_condition then
		slot8 = RoleController:getInstance():getRoleVo()
		slot2 = true
		slot9 = ""

		if RoleController:getInstance():getModel():getWorldLev() < slot3.val then
			slot2 = false
			slot9 = slot3.desc
		elseif slot8.lev < slot4.val then
			slot2 = false
			slot9 = slot4.desc
		end

		if not slot2 and slot5 then
			slot2 = true

			if slot8.lev < slot5.val then
				slot2 = false
				slot9 = slot5.desc
			end
		end

		if not slot2 and not slot1 then
			message(slot9)
		end
	end

	return slot2
end

function HeavenModel.setHeavenDailData(slot0, slot1)
	slot0.dial_data = slot1 or {}

	slot0:checkHeavenRedStatus()
end

function HeavenModel.getHeavenDialIsFreeById(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.dial_data) do
		if slot7.group_id == slot1 then
			if slot7.free_times >= 1 then
				slot2 = true
			end

			break
		end
	end

	return slot2
end

function HeavenModel.checkHeavenDialIsOpenByGId(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.dial_data) do
		if slot7.group_id == slot1 and slot7.is_open == 1 then
			slot2 = true

			break
		end
	end

	return slot2
end

function HeavenModel.getHeavenDialAwardRedById(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.dial_data) do
		if slot7.group_id == slot1 and Config.HolyEqmLotteryData.data_award[slot7.group_id] then
			for slot12, slot13 in pairs(slot8) do
				slot14 = false

				for slot18, slot19 in pairs(slot7.do_awards) do
					if slot13.id == slot19.award_id then
						slot14 = true

						break
					end
				end

				if slot14 == false and slot13.times <= slot7.all_award_count then
					return true
				end
			end
		end
	end

	return slot2
end

function HeavenModel.getHeavenDialById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.dial_data) do
		if slot6.group_id == slot1 then
			return slot6
		end
	end

	return nil
end

function HeavenModel.getHeavenDialBaodiCountById(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in pairs(slot0.dial_data) do
		if slot7.group_id == slot1 then
			slot2 = slot7.baodi_count or 0

			break
		end
	end

	return slot2
end

function HeavenModel.setMyselfDialRecordData(slot0, slot1)
	slot0.myself_record_data = slot1 or {}
end

function HeavenModel.getMyselfDialRecordData(slot0)
	return slot0.myself_record_data
end

function HeavenModel.setAllDialRecordData(slot0, slot1, slot2)
	slot0.all_record_data[slot2] = slot1
end

function HeavenModel.getAllDialRecordData(slot0, slot1)
	return slot0.all_record_data[slot1] or {}
end

function HeavenModel.checkIsHaveDialRecordData(slot0, slot1)
	if slot0.all_record_data[slot1] and next(slot0.all_record_data[slot1]) ~= nil then
		return true
	end

	return false
end

function HeavenModel.updateHeavenRedStatus(slot0, slot1, slot2)
	slot0.heaven_red_list[slot1] = slot2

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.adventure, {
		bid = AdventureActivityConst.Red_Type.heaven,
		status = slot0:getHeavenRedStatus()
	})
	GlobalEvent:getInstance():Fire(HeavenEvent.Update_Heaven_Red_Status, slot1, slot2)
end

function HeavenModel.getHeavenRedStatus(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.heaven_red_list) do
		if slot6 == true then
			slot1 = true

			break
		end
	end

	return slot1
end

function HeavenModel.getHeavenRedStatusByBid(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.heaven_red_list) do
		if slot1 == slot6 then
			slot2 = slot7

			break
		end
	end

	return slot2
end

function HeavenModel.checkHeavenRedStatus(slot0)
	if not slot0:checkHeavenIsOpen(true) then
		return
	end

	slot1 = false

	if slot0.left_challenge_count > 0 then
		slot1 = true
	end

	slot6 = slot1

	slot0:updateHeavenRedStatus(HeavenConst.Red_Index.Count, slot6)

	slot2 = false

	for slot6, slot7 in pairs(slot0.chapter_list) do
		if slot7:getRedStatus() == true then
			slot2 = true

			break
		end
	end

	slot0:updateHeavenRedStatus(HeavenConst.Red_Index.Award, slot2)

	slot3 = false

	if slot0:checkHeavenDialIsOpen(true) then
		for slot7, slot8 in pairs(slot0.dial_data) do
			if slot8.free_times >= 1 and Config.HolyEqmLotteryData.data_group[slot8.group_id] and slot0:checkHeavenDialIsOpenByGId(slot8.group_id) then
				slot3 = true

				break
			end
		end
	end

	slot0:updateHeavenRedStatus(HeavenConst.Red_Index.Dial, slot3)

	slot4 = false

	if slot0:checkHeavenDialIsOpen(true) then
		for slot8, slot9 in pairs(slot0.dial_data) do
			if Config.HolyEqmLotteryData.data_award[slot9.group_id] then
				for slot14, slot15 in pairs(slot10) do
					slot16 = false

					for slot20, slot21 in pairs(slot9.do_awards) do
						if slot15.id == slot21.award_id then
							slot16 = true

							break
						end
					end

					if slot16 == false and slot15.times <= slot9.all_award_count then
						slot4 = true

						break
					end
				end
			end

			if slot4 == true then
				break
			end
		end
	end

	slot0:updateHeavenRedStatus(HeavenConst.Red_Index.DialAward, slot4)
end

function HeavenModel.setAllScore(slot0, slot1)
	slot0.all_score = slot1

	GlobalEvent:getInstance():Fire(HeavenEvent.Update_All_Score)
end

function HeavenModel.getAllScore(slot0)
	return slot0.all_score
end

function HeavenModel.checkIsOpenByScore(slot0, slot1)
	slot2 = false

	if slot1 <= slot0.all_score then
		slot2 = true
	end

	return slot2
end

function HeavenModel.__delete(slot0)
end
