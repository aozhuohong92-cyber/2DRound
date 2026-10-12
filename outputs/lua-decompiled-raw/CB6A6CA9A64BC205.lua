GuildsecretareaModel = GuildsecretareaModel or BaseClass()

function GuildsecretareaModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function GuildsecretareaModel.config(slot0)
	slot0.dic_boss_rank_info = {}
end

function GuildsecretareaModel.updateSecretareaData(slot0, slot1)
	slot0.secretarea_data = slot1

	slot0:checkRedPoint(true)
end

function GuildsecretareaModel.updateSecretareaBuyCount(slot0, slot1)
	if slot1 and slot0.secretarea_data then
		slot0.secretarea_data.count = slot1.count
		slot0.secretarea_data.last_buy_time = slot1.last_buy_time

		slot0:checkRedPoint(true)
	end
end

function GuildsecretareaModel.checkRedPoint(slot0, slot1)
	slot2 = false

	if slot0.secretarea_data then
		if slot0.secretarea_data.bid == 0 then
			return false
		end

		if slot0.secretarea_data.count > 0 and GameNet:getInstance():getTime() < slot0.secretarea_data.end_time then
			slot2 = true
		elseif slot0.secretarea_data.is_reward == 1 then
			slot3 = {
				[slot8.order] = true
			}

			for slot7, slot8 in ipairs(slot0.secretarea_data.progress_reward) do
				-- Nothing
			end

			if Config.GuildSecretAreaData and Config.GuildSecretAreaData.data_box_reward and Config.GuildSecretAreaData.data_box_reward[slot0.secretarea_data.bid] and next(slot4) ~= nil then
				table.sort(slot4, function (slot0, slot1)
					return slot0.number < slot1.number
				end)

				for slot9, slot10 in ipairs(slot4) do
					if not slot3[slot10.number] and slot0.secretarea_data.hp * 100 / slot0.secretarea_data.max_hp <= slot10.progress / 10 then
						slot2 = true

						break
					end
				end
			end
		end
	end

	if slot1 then
		MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.guild, {
			bid = GuildConst.red_index.guild_secret_area,
			status = slot2
		})
	end

	GlobalEvent:getInstance():Fire(GuildEvent.UpdateGuildRedStatus, GuildConst.red_index.guild_secret_area, slot2)

	return slot2
end

function GuildsecretareaModel.updateBossRankInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.dic_boss_rank_info[slot1.boss_id] = slot1
end

function GuildsecretareaModel.getBossRankInfoByBossID(slot0, slot1)
	if slot0.dic_boss_rank_info then
		return slot0.dic_boss_rank_info[slot1]
	end

	return nil
end

function GuildsecretareaModel.clearBossRankInfo(slot0)
	slot0.dic_boss_rank_info = {}
end

function GuildsecretareaModel.updateStartCrusadeInfo(slot0, slot1)
	slot0.start_crusade_data = slot1
end

function GuildsecretareaModel.isShowStartCrusade(slot0)
	if slot0.start_crusade_data and slot0.start_crusade_data.flag == 0 then
		slot0.start_crusade_data.flag = 1

		return true
	end

	return false
end

function GuildsecretareaModel.__delete(slot0)
end
