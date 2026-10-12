GuildbossModel = GuildbossModel or BaseClass()
slot0 = table.sort
slot1 = table.insert

function GuildbossModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function GuildbossModel.config(slot0)
	slot0.guildboss_red_list = {}
	slot0.role_rank_list = {}
end

function GuildbossModel.clearGuildBossInfo(slot0)
	slot0.base_info = {}
	slot0.first_pass_list = {}
	slot0.day_box_list = {}
	slot0.guildboss_red_list = {}
	slot0._initFirstPassData = {}
end

function GuildbossModel.updateGuildRedStatus(slot0, slot1, slot2)
	if MainuiController:getInstance():checkIsOpenByActivate(Config.FunctionData.data_base[6].activate) == false then
		return
	end

	if slot0.guildboss_red_list[slot1] == slot2 then
		return
	end

	slot0.guildboss_red_list[slot1] = slot2

	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.guild, {
		bid = slot1,
		status = slot2
	})

	slot6 = false

	if slot0.base_info and slot0.base_info.count and ActivityController:getInstance():getBossActivityDoubleTime() == true and slot0.base_info.count > 0 then
		slot6 = true
	end

	GlobalEvent:getInstance():Fire(GuildEvent.UpdateGuildRedStatus, slot1, slot2)
end

function GuildbossModel.checkGuildDunRedStatus(slot0)
	if not slot0.base_info then
		return false
	end

	if next(slot0.base_info) == nil then
		slot0:updateGuildRedStatus(GuildConst.red_index.boss_times, true)
	end

	for slot4, slot5 in pairs(slot0.guildboss_red_list) do
		if slot5 == true then
			return true
		end
	end

	return false
end

function GuildbossModel.getRedStatusByType(slot0, slot1)
	return slot0.guildboss_red_list[slot1]
end

function GuildbossModel.updateGuildDunBaseInfo(slot0, slot1)
	slot2 = Config.GuildDunData.data_guildboss_list_length
	slot3 = false

	if slot0.base_info == nil or slot0.base_info.count ~= slot1.count then
		slot3 = true
	end

	slot0.base_info = slot1

	GlobalEvent:getInstance():Fire(GuildbossEvent.UpdateGuildDunBaseInfo)

	if slot1 and slot2 <= slot1.max_id then
		slot0:updateGuildRedStatus(GuildConst.red_index.boss_times, 0)
	end

	if slot3 == true then
		slot4 = slot0.base_info.count

		if slot2 <= slot1.max_id and slot1.info and next(slot1.info) ~= nil and slot1.info[1].hp and slot1.info[1].hp == 0 then
			slot4 = 0
		end

		slot0:updateGuildRedStatus(GuildConst.red_index.boss_times, slot4 > 0)
	end
end

function GuildbossModel.getChangeCount(slot0)
	if slot0.base_info then
		if not slot0.base_info.count then
			return false
		end

		if slot0.base_info.count > 0 then
			return true
		else
			return false
		end
	end
end

function GuildbossModel.getBaseInfo(slot0)
	return slot0.base_info
end

function GuildbossModel.updateBaseWithTimes(slot0, slot1, slot2, slot3)
	if slot0.base_info == nil then
		slot0.base_info = {}
	end

	slot0.base_info.count = slot1
	slot0.base_info.buy_count = slot2

	GlobalEvent:getInstance():Fire(GuildbossEvent.UpdateGuildBossChallengeTimes, slot3)
	slot0:updateGuildRedStatus(GuildConst.red_index.boss_times, slot0.base_info.count > 0)
end

function GuildbossModel.initFirstPassRewardList(slot0, slot1)
end

function GuildbossModel.getFirstPassRewardList(slot0)
	slot1 = {}
	slot2 = {}
	slot3 = {}

	if not slot0._initFirstPassData.award_list then
		return
	end

	for slot7, slot8 in pairs(slot0._initFirstPassData.award_list) do
		if slot8.status == 0 then
			uv0(slot1, slot8)
		elseif slot8.status == 1 then
			uv0(slot2, slot8)
		elseif slot8.status == 2 then
			uv0(slot3, slot8)
		end
	end

	if #slot1 ~= 0 then
		for slot7, slot8 in pairs(slot1) do
			uv0(slot2, slot8)
		end
	end

	if #slot3 ~= 0 then
		for slot7, slot8 in pairs(slot3) do
			uv0(slot2, slot8)
		end
	end

	return slot2
end

function GuildbossModel.setChargeGetPassData(slot0, slot1)
end

function GuildbossModel.getRankAward(slot0, slot1)
	slot1 = slot1 or 1

	for slot5, slot6 in pairs(Config.GuildDunData.data_rank_reward) do
		if slot6.rank1 <= slot1 and slot1 <= slot6.rank2 then
			return slot6.award
		end
	end

	return {}
end

function GuildbossModel.initDayBoxRewardsStatus(slot0, slot1)
	slot0.day_box_list = {}

	for slot5 = 1, Config.GuildDunData.data_chapter_box_length do
		slot0.day_box_list[slot5] = 0
	end

	for slot6, slot7 in ipairs(slot1) do
		slot0.day_box_list[slot7.fid] = slot7.num

		if slot7.num > 0 and false == false then
			slot2 = true
		end
	end

	GlobalEvent:getInstance():Fire(GuildbossEvent.UpdateBoxRewardsStatus)
end

function GuildbossModel.updateBoxRewards(slot0, slot1, slot2)
	if slot0.day_box_list[slot1] == nil then
		return
	end

	slot0.day_box_list[slot1] = slot2
	slot3 = false

	for slot7, slot8 in pairs(slot0.day_box_list) do
		if slot8 > 0 then
			slot3 = true

			break
		end
	end
end

function GuildbossModel.getBoxRewardList(slot0)
	return slot0.day_box_list or {}
end

function GuildbossModel.setRaknRoleList(slot0, slot1)
	slot0.role_rank_list = slot1
end

function GuildbossModel.getRaknRoleTopThreeList(slot0)
	slot1 = {
		{
			rank = 1,
			name = TI18N("虚位以待")
		},
		{
			rank = 2,
			name = TI18N("虚位以待")
		},
		{
			rank = 3,
			name = TI18N("虚位以待")
		}
	}

	if slot0.role_rank_list.rank_list and next(slot0.role_rank_list.rank_list or {}) ~= nil then
		for slot6, slot7 in ipairs(slot0.role_rank_list.rank_list) do
			for slot11, slot12 in ipairs(slot1) do
				if slot7.rank == slot12.rank then
					slot1[slot11] = slot7
				end
			end
		end
	end

	return slot1
end

function GuildbossModel.__delete(slot0)
end
