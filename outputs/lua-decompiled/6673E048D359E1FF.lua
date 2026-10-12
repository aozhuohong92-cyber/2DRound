PartnersummonModel = PartnersummonModel or BaseClass()

function PartnersummonModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function PartnersummonModel.config(slot0)
	slot0.is_open_view = false
	slot0.recruit_data = {}
	slot0.share_data = {}
end

function PartnersummonModel.setSummonData(slot0, slot1)
	if slot1 then
		slot0.recruit_data = slot1.recruit_list

		slot0:setShareData(slot1)
		slot0:updateRedPoint()
		slot0:setFiveStarHeroIsOut(slot1.must_five_num)
		GlobalEvent:getInstance():Fire(PartnersummonEvent.updateSummonDataEvent, slot1)
	end
end

function PartnersummonModel.setFiveStarHeroIsOut(slot0, slot1)
	slot0.five_star_hero = slot1
end

function PartnersummonModel.getFiveStarHeroIsOut(slot0)
	if slot0.five_star_hero then
		return slot0.five_star_hero
	end

	return 0
end

function PartnersummonModel.updateRecruitData(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		for slot11, slot12 in pairs(slot0.recruit_data) do
			if slot7.group_id == slot12.group_id then
				slot16 = slot7.group_id

				table.insert(slot2, slot16)

				for slot16, slot17 in pairs(slot7) do
					slot12[slot16] = slot17
				end

				break
			end
		end
	end

	GlobalEvent:getInstance():Fire(PartnersummonEvent.updateSummonSingleDataEvent, slot2)
end

function PartnersummonModel.updateExtendData(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.recruit_data) do
		if slot7.group_id == slot1.group_id then
			table.insert(slot2, slot1.group_id)

			if slot7.draw_list then
				for slot12, slot13 in pairs(slot8) do
					if slot13.times == 1 and slot13.kv_list then
						if slot1.free_times then
							slot0:updateKeyValList(slot13.kv_list, PartnersummonConst.Recruit_Key.Free_Count, slot1.free_times)
						end

						if slot1.free_cd_end then
							slot0:updateKeyValList(slot13.kv_list, PartnersummonConst.Recruit_Key.Free_Time, slot1.free_cd_end)
						end

						break
					end
				end
			end
		end
	end

	slot0:updateRedPoint()
	GlobalEvent:getInstance():Fire(PartnersummonEvent.updateSummonSingleDataEvent, slot2)
end

function PartnersummonModel.updateKeyValList(slot0, slot1, slot2, slot3)
	slot4 = false

	for slot8, slot9 in pairs(slot1) do
		if slot9.key == slot2 then
			slot9.val = slot3
			slot4 = true

			break
		end
	end

	if slot4 == false then
		table.insert(slot1, {
			key = slot2,
			val = slot3
		})
	end
end

function PartnersummonModel.setShareData(slot0, slot1)
	if slot1 then
		slot0.share_data = {
			is_share = slot1.is_share,
			is_day_share = slot1.is_day_share
		}

		GlobalEvent:getInstance():Fire(PartnersummonEvent.updateSummonShareDataEvent, slot1)
	end
end

function PartnersummonModel.getShareData(slot0)
	if slot0.share_data or next(slot0.share_data or {}) then
		return slot0.share_data
	end
end

function PartnersummonModel.getSummonProtoDataByGroupID(slot0, slot1)
	if slot0.recruit_data then
		slot2 = {}

		if next(slot0.recruit_data or {}) ~= nil then
			for slot6, slot7 in ipairs(slot0.recruit_data) do
				if slot7.group_id == slot1 then
					slot2 = slot7

					break
				end
			end
		end

		return slot2
	end
end

function PartnersummonModel.getOpenSummonData(slot0)
end

function PartnersummonModel.getSummonGroupData(slot0)
	slot1 = {}

	if Config.RecruitData.data_partnersummon_data then
		for slot6, slot7 in pairs(slot2) do
			if slot7.is_show == 0 then
				table.insert(slot1, {
					info_data = slot7,
					proto_data = slot0:getSummonProtoDataByGroupID(slot7.group_id),
					group_id = slot7.group_id
				})
			end
		end

		table.sort(slot1, function (slot0, slot1)
			if slot0.info_data.sort_id and slot1.info_data.sort_id then
				return slot0.info_data.sort_id < slot1.info_data.sort_id
			else
				return false
			end
		end)
	end

	return slot1
end

function PartnersummonModel.getSummonGroupDataByGroupId(slot0, slot1)
	slot2 = {}

	if Config.RecruitData.data_partnersummon_data then
		slot4 = {}

		for slot8, slot9 in pairs(slot3) do
			if slot9.group_id == slot1 then
				slot4 = slot9

				break
			end
		end

		slot2 = {
			info_data = slot4,
			proto_data = slot0:getSummonProtoDataByGroupID(slot1),
			group_id = slot1
		}
	end

	return slot2
end

function PartnersummonModel.getScoreSummonNeedCount(slot0)
	slot1 = 0

	if Config.RecruitData.data_partnersummon_data[PartnersummonConst.Summon_Type.Score] and Config.RecruitData.data_partnersummon_data[PartnersummonConst.Summon_Type.Score].exchange_once[1] then
		slot1 = slot2[1][2] or 0
	end

	return slot1
end

function PartnersummonModel.updateRedPoint(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.recruit_data) do
		if slot6.draw_list then
			for slot10, slot11 in pairs(slot6.draw_list) do
				if slot11.kv_list then
					for slot15, slot16 in pairs(slot11.kv_list) do
						if slot16.key == PartnersummonConst.Recruit_Key.Free_Count and slot16.val > 0 then
							slot1 = true

							break
						end
					end
				end
			end
		end
	end

	if not slot1 and not slot0.is_open_view then
		if BackpackController:getInstance():getModel():getItemNumByBid(PartnersummonConst.Normal_Id) > 0 or BackpackController:getInstance():getModel():getItemNumByBid(PartnersummonConst.Advanced_Id) > 0 then
			slot1 = true
		end
	end

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.summon, slot1)
end

function PartnersummonModel.setOpenPartnerSummonFlag(slot0, slot1)
	slot0.is_open_view = slot1

	slot0:updateRedPoint()
end

function PartnersummonModel.getOpenPartnerSummonFlag(slot0)
	return slot0.is_open_view
end

function PartnersummonModel.__delete(slot0)
end
