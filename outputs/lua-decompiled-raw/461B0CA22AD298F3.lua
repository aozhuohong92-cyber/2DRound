GuildskillModel = GuildskillModel or BaseClass()
slot0 = table.insert
slot1 = table.sort

function GuildskillModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function GuildskillModel.config(slot0)
	slot0.career_skill_list = {}
	slot0.skill_wait_upgrade_list = {}
	slot0.skill_upgrade_cost_list = {}
	slot0.skill_red_status_list = {}
	slot0.pvp_skill_red_status_list = {}
	slot0.pvp_career_skill_list = nil
	slot0.had_send_mainui = false
	slot0.had_close_mainui = false
end

function GuildskillModel.clearGuildCareerSkill(slot0)
	slot0.career_skill_list = {}
	slot0.skill_wait_upgrade_list = {}
	slot0.skill_upgrade_cost_list = {}
	slot0.skill_red_status_list = {}
	slot0.pvp_skill_red_status_list = {}
end

function GuildskillModel.initGuildCareerSkill(slot0, slot1)
	if slot1 == nil or slot1.group_id == nil then
		return
	end

	if Config.GuildSkillData.data_info_group[slot1.group_id] == nil then
		print("公会技能配置数据有问题，技能组id为：", slot1.group_id)
	else
		slot3 = {
			career = slot1.career,
			group_id = slot1.group_id,
			group_ids = slot1.group_ids,
			skill_ids = {},
			had_skill_up = true
		}

		if #slot1.group_ids > 0 or #slot1.skill_ids > 0 then
			-- Nothing
		else
			slot3.had_skill_up = false
		end

		slot4 = {
			[slot9.skill_id] = true
		}

		for slot8, slot9 in ipairs(slot1.skill_ids) do
			-- Nothing
		end

		for slot8, slot9 in ipairs(slot2) do
			if slot4[slot9.id] then
				-- Nothing
			else
				slot10.status = GuildskillConst.status.un_activity
			end

			uv0(slot3.skill_ids, {
				id = slot9.id,
				index = slot9.seq,
				status = GuildskillConst.status.activity
			})
		end

		if next(slot3.skill_ids) then
			uv1(slot3.skill_ids, function (slot0, slot1)
				return slot0.index < slot1.index
			end)
		end

		slot0.career_skill_list[slot1.career] = slot3

		GlobalEvent:getInstance():Fire(GuildskillEvent.UpdateGuildSkillEvent, slot1.career)
	end
end

function GuildskillModel.initPvpCareerSkillInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.dic_pvp_power_career = nil

	if slot0.pvp_career_skill_list == nil then
		slot0.pvp_career_skill_list = {}
	end

	for slot5, slot6 in ipairs(slot1) do
		if slot6.career then
			slot0.pvp_career_skill_list[slot6.career] = slot6

			uv0(slot6.attr_formation, SortTools.KeyLowerSorter("id"))
		end
	end

	slot0:checkGuildPvpSkillRedStatus()
end

function GuildskillModel.getPvpskillInfoByCareer(slot0, slot1)
	if slot0.pvp_career_skill_list then
		return slot0.pvp_career_skill_list[slot1]
	end
end

function GuildskillModel.getPvpskillInfo(slot0)
	return slot0.pvp_career_skill_list
end

function GuildskillModel.setPvpFisrtReset(slot0, slot1)
	slot0.is_pvp_first = slot1
end

function GuildskillModel.isPvpFisrtReset(slot0)
	return slot0.is_pvp_first == true
end

function GuildskillModel.getPvpPowerByCareerlist(slot0, slot1)
	if slot0.dic_pvp_power_career == nil then
		slot0.dic_pvp_power_career = {}
	end

	slot2 = 0

	for slot6, slot7 in ipairs(slot1) do
		if slot0.dic_pvp_power_career[slot7] == nil and slot0:getPvpskillInfoByCareer(slot7) then
			for slot13, slot14 in ipairs(slot8.attr_formation) do
				if Config.GuildSkillData.data_pvp_attr_info(getNorKey(slot14.id, slot14.lev)) then
					slot9 = 0 + slot16.power
				end
			end

			if Config.GuildSkillData.data_pvp_skill_info(getNorKey(slot7, slot8.skill_lev)) then
				slot9 = slot9 + slot11.power
			end

			slot0.dic_pvp_power_career[slot7] = slot9
		end

		slot2 = slot2 + (slot0.dic_pvp_power_career[slot7] or 0)
	end

	return slot2
end

function GuildskillModel.resetCareerSkillInfo(slot0, slot1)
	if slot0.career_skill_list[slot1] then
		slot2.group_id = math.floor(slot2.group_id / 1000) * 1000 + 1
		slot2.group_ids = {}
		slot2.skill_ids = {}

		for slot7, slot8 in ipairs(Config.GuildSkillData.data_info_group[slot2.group_id]) do
			uv0(slot2.skill_ids, {
				id = slot8.id,
				index = slot8.seq,
				status = GuildskillConst.status.un_activity
			})
		end

		slot2.had_skill_up = false

		GlobalEvent:getInstance():Fire(GuildskillEvent.ResetGuildSkillEvent, slot1)
	end
end

function GuildskillModel.getCareerSkillInfo(slot0, slot1)
	return slot0.career_skill_list[slot1]
end

function GuildskillModel.getCareerSkillLevel(slot0, slot1)
	if slot0.career_skill_list and slot0.career_skill_list[slot1] then
		for slot7, slot8 in ipairs(slot0.career_skill_list[slot1].skill_ids) do
			if slot8.status == GuildskillConst.status.activity then
				slot3 = #slot0.career_skill_list[slot1].group_ids * 6 + 1
			end
		end

		return slot3
	end

	return -1
end

function GuildskillModel.getCareerPvpSkillLevel(slot0, slot1)
	if slot0.pvp_career_skill_list and slot0.pvp_career_skill_list[slot1] then
		for slot7, slot8 in ipairs(slot0.pvp_career_skill_list[slot1].attr_formation) do
			slot2 = 0 + slot8.lev
		end

		return slot2, slot3.skill_lev or 0
	end

	return -1
end

function GuildskillModel.updateGuildCareerSkill(slot0, slot1, slot2)
	if slot1 == nil or slot2 == nil then
		return
	end

	if slot0.career_skill_list[slot1] and slot3.skill_ids then
		for slot7, slot8 in ipairs(slot3.skill_ids) do
			if slot8.id == slot2 then
				slot8.status = GuildskillConst.status.activity

				break
			end
		end

		slot3.had_skill_up = true
		slot4 = 0

		for slot8, slot9 in ipairs(slot3.skill_ids) do
			if slot9.status == GuildskillConst.status.un_activity then
				slot4 = slot9.id

				break
			end
		end

		slot0:updateGuildSkillStatus(slot1, slot4)
		GlobalEvent:getInstance():Fire(GuildskillEvent.UpdateSkillStatusEvent, slot1, slot2)
	end
end

function GuildskillModel.upgradeGuildCareerSkill(slot0, slot1, slot2)
	if slot1 == nil or slot2 == nil then
		return
	end

	if slot0.career_skill_list[slot1] == nil then
		slot0.career_skill_list[slot1] = {
			group_ids = {}
		}
	end

	if slot3.group_ids then
		uv0(slot3.group_ids, {
			group_id = slot3.group_id
		})
	end

	slot3.career = slot1

	if slot3.group_id ~= slot2 then
		slot3.group_id = slot2
		slot3.skill_ids = {}

		if Config.GuildSkillData.data_info_group[slot2] == nil then
			print("更新技能组出错，配置数据有问题，技能组id为：", slot2)

			return
		end

		slot3.had_skill_up = true

		for slot8, slot9 in ipairs(slot4) do
			uv0(slot3.skill_ids, {
				id = slot9.id,
				index = slot9.seq,
				status = GuildskillConst.status.un_activity
			})
		end

		if next(slot3.skill_ids) then
			uv1(slot3.skill_ids, function (slot0, slot1)
				return slot0.index < slot1.index
			end)
		end
	end

	slot4 = 0

	for slot8, slot9 in ipairs(slot3.skill_ids) do
		if slot9.status == GuildskillConst.status.un_activity then
			slot4 = slot9.id

			break
		end
	end

	slot0:updateGuildSkillStatus(slot1, slot4)
	GlobalEvent:getInstance():Fire(GuildskillEvent.UpdateSkilUpgradeEvent, slot1, slot2)
end

function GuildskillModel.getCareerGroupMax(slot0, slot1)
	slot1 = slot1 or GuildskillConst.index.physics

	if slot0.career_group_max == nil then
		slot0.career_group_max = {}
	end

	if slot0.career_group_max[slot1] == nil then
		if Config.GuildSkillData.data_career_list[slot1] then
			slot0.career_group_max[slot1] = #slot2
		else
			slot0.career_group_max[slot1] = 0
		end
	end

	return slot0.career_group_max[slot1]
end

function GuildskillModel.initGuildSkillStatus(slot0, slot1)
	if slot1 and slot1.outline then
		slot0.skill_wait_upgrade_list = {}

		for slot5, slot6 in ipairs(slot1.outline) do
			slot0.skill_wait_upgrade_list[slot6.career] = slot6.skill_id
		end
	end

	slot0:checkGuildSkillRedStatus()
end

function GuildskillModel.updateGuildSkillStatus(slot0, slot1, slot2)
	if slot0.skill_wait_upgrade_list == nil then
		slot0.skill_wait_upgrade_list = {}
	end

	slot0.skill_wait_upgrade_list[slot1] = slot2

	slot0:checkGuildSkillRedStatus()
end

function GuildskillModel.checkGuildSkillRedStatus(slot0)
	if slot0.skill_wait_upgrade_list == nil or next(slot0.skill_wait_upgrade_list) == nil then
		return
	end

	slot1 = RoleController:getInstance():getRoleVo()
	slot2 = BackpackController:getInstance():getModel()
	slot4 = 40

	if Config.GuildSkillData.data_const.max_lv then
		slot4 = slot3.val
	end

	for slot9, slot10 in pairs(slot0.skill_wait_upgrade_list) do
		if Config.GuildSkillData.data_info(slot10) then
			if slot4 <= slot11.lev then
				-- Nothing
			elseif slot1.guild_lev < slot11.guild_lev then
				slot5[slot9] = false
			else
				for slot15, slot16 in ipairs(slot11.loss or {}) do
					if slot16[1] and slot16[2] then
						if Config.ItemData.data_assets_id2label[slot16[1]] then
							if slot1[slot19] < slot16[2] then
								slot5[slot9] = false

								break
							end
						elseif slot2:getBackPackItemNumByBid(slot17) < slot18 then
							slot5[slot9] = false

							break
						end
					end
				end
			end
		end
	end

	for slot9, slot10 in pairs({
		[slot9] = true,
		[slot9] = false
	}) do
		slot0:updateGuildRedStatus(slot0:getCareerKey(slot9), slot10)
	end
end

function GuildskillModel.checkGuildPvpSkillRedStatus(slot0)
	if slot0.pvp_career_skill_list and next(slot0.pvp_career_skill_list) ~= nil then
		for slot4, slot5 in pairs(slot0.pvp_career_skill_list) do
			slot6 = false

			for slot10, slot11 in ipairs(slot5.attr_formation) do
				slot14 = true

				if Config.GuildSkillData.data_pvp_attr_info(getNorKey(slot11.id, slot11.lev)) and next(slot13.loss) ~= nil then
					for slot18, slot19 in ipairs(slot13.loss) do
						if BackpackController:getInstance():getModel():getItemNumByBid(slot19[1]) < slot19[2] then
							slot14 = false
						end
					end
				else
					slot14 = false
				end

				slot6 = slot6 or slot14
			end

			slot0:updateGuildPvpRedStatus(slot0:getPvpCareerKey(slot4), slot6 or slot0:checkGuildPvpOnlySkillRedpoit(slot5.career, slot5.skill_lev, slot5.attr_formation))
		end
	end
end

function GuildskillModel.checkGuildPvpOnlySkillRedpoit(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	if not slot2 then
		return
	end

	if not slot3 then
		return
	end

	if Config.GuildSkillData.data_pvp_skill_info(getNorKey(slot1, slot2)) then
		for slot9, slot10 in ipairs(slot3) do
			if slot10.lev < slot5.need_lev then
				return false
			end
		end

		if next(slot5.loss) ~= nil then
			for slot9, slot10 in ipairs(slot5.loss) do
				if BackpackController:getInstance():getModel():getItemNumByBid(slot10[1]) < slot10[2] then
					return false
				end
			end
		else
			return false
		end

		return true
	end

	return false
end

function GuildskillModel.getCareerKey(slot0, slot1)
	if (slot1 or GuildskillConst.index.physics) == GuildskillConst.index.magic then
		return GuildConst.red_index.skill_2
	elseif slot1 == GuildskillConst.index.physics then
		return GuildConst.red_index.skill_3
	elseif slot1 == GuildskillConst.index.defence then
		return GuildConst.red_index.skill_4
	elseif slot1 == GuildskillConst.index.assist then
		return GuildConst.red_index.skill_5
	else
		return GuildConst.red_index.skill_3
	end
end

function GuildskillModel.getPvpCareerKey(slot0, slot1)
	if (slot1 or GuildskillConst.index.physics) == GuildskillConst.index.magic then
		return GuildConst.red_index.pvp_skill_2
	elseif slot1 == GuildskillConst.index.physics then
		return GuildConst.red_index.pvp_skill_3
	elseif slot1 == GuildskillConst.index.defence then
		return GuildConst.red_index.pvp_skill_4
	elseif slot1 == GuildskillConst.index.assist then
		return GuildConst.red_index.pvp_skill_5
	else
		return GuildConst.red_index.pvp_skill_3
	end
end

function GuildskillModel.updateGuildPvpRedStatus(slot0, slot1, slot2)
	if MainuiController:getInstance():checkIsOpenByActivate(Config.FunctionData.data_base[6].activate) == false then
		return
	end

	if slot0.pvp_skill_red_status_list[slot1] == slot2 then
		return
	end

	slot0.pvp_skill_red_status_list[slot1] = slot2

	if slot0.had_send_mainui == false then
		slot0.had_send_mainui = true

		MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.guild, {
			bid = slot1,
			status = slot2
		})
	end

	GlobalEvent:getInstance():Fire(GuildEvent.UpdateGuildRedStatus, slot1, slot2)
end

function GuildskillModel.clearGuildSkillIconRed(slot0)
	if slot0.had_close_mainui == true then
		return
	end

	slot0.had_close_mainui = true
	slot1 = false

	for slot5, slot6 in pairs(slot0.skill_red_status_list) do
		if slot6 == true then
			slot1 = true

			break
		end
	end

	if not slot1 then
		for slot5, slot6 in pairs(slot0.pvp_skill_red_status_list) do
			if slot6 == true then
				slot1 = true

				break
			end
		end
	end

	if slot1 == true then
		MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.guild, {
			{
				status = false,
				bid = GuildConst.red_index.skill_2
			},
			{
				status = false,
				bid = GuildConst.red_index.skill_3
			},
			{
				status = false,
				bid = GuildConst.red_index.skill_4
			},
			{
				status = false,
				bid = GuildConst.red_index.skill_5
			},
			{
				status = false,
				bid = GuildConst.red_index.pvp_skill_2
			},
			{
				status = false,
				bid = GuildConst.red_index.pvp_skill_3
			},
			{
				status = false,
				bid = GuildConst.red_index.pvp_skill_4
			},
			{
				status = false,
				bid = GuildConst.red_index.pvp_skill_5
			}
		})
	end
end

function GuildskillModel.updateGuildRedStatus(slot0, slot1, slot2)
	if MainuiController:getInstance():checkIsOpenByActivate(Config.FunctionData.data_base[6].activate) == false then
		return
	end

	if slot0.skill_red_status_list[slot1] == slot2 then
		return
	end

	slot0.skill_red_status_list[slot1] = slot2

	if slot0.had_send_mainui == false then
		slot0.had_send_mainui = true

		MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.guild, {
			bid = slot1,
			status = slot2
		})
	end

	GlobalEvent:getInstance():Fire(GuildEvent.UpdateGuildRedStatus, slot1, slot2)
end

function GuildskillModel.getRedStatus(slot0, slot1)
	return slot0.skill_red_status_list[slot0:getCareerKey(slot1)] or slot0.pvp_skill_red_status_list[slot0:getPvpCareerKey(slot1)]
end

function GuildskillModel.getRedTotalStatus(slot0)
	for slot4, slot5 in pairs(slot0.skill_red_status_list) do
		if slot5 == true then
			return true
		end
	end

	for slot4, slot5 in pairs(slot0.pvp_skill_red_status_list) do
		if slot5 == true then
			return true
		end
	end

	return false
end

function GuildskillModel.__delete(slot0)
end
