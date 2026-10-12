GuildModel = GuildModel or BaseClass()
slot0 = table.insert
slot1 = table.sort

function GuildModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function GuildModel.config(slot0)
	slot0.guild_cache_list = {}
	slot0.guild_apply_list = {}
	slot0.donate_sum = 0
	slot0.guild_member_list = {}
	slot0.guild_list = {}
	slot0.guild_search_list = {}
	slot0.my_guild_assistant = {}
	slot0.guild_red_status_list = {}
	slot0.guild_donate_activity_list = {}
	slot0.guild_notice_list = {}
end

function GuildModel.updateGuildList(slot0, slot1, slot2)
	if slot1 == "" then
		slot0.guild_list = {}

		for slot6, slot7 in ipairs(slot2) do
			if slot0.guild_cache_list[getNorKey(slot7.gid, slot7.gsrv_id)] == nil then
				slot0.guild_cache_list[getNorKey(slot7.gid, slot7.gsrv_id)] = GuildListVo.New()
			end

			slot8:updateData(slot7)
			uv0(slot0.guild_list, slot8)
		end
	else
		slot0.guild_search_list = {}

		for slot6, slot7 in ipairs(slot2) do
			if slot0.guild_cache_list[getNorKey(slot7.gid, slot7.gsrv_id)] == nil then
				slot0.guild_cache_list[getNorKey(slot7.gid, slot7.gsrv_id)] = GuildListVo.New()
			end

			slot8:updateData(slot7)
			uv0(slot0.guild_search_list, slot8)
		end
	end

	slot3 = GuildConst.list_type.total
	slot4 = slot0.guild_list

	if slot1 ~= "" then
		slot3 = GuildConst.list_type.search
		slot4 = slot0.guild_search_list
	end

	GlobalEvent:getInstance():Fire(GuildEvent.UpdateGuildList, slot3, slot4)
end

function GuildModel.updateGuildApplyStatus(slot0, slot1, slot2, slot3)
	if slot0.guild_cache_list[getNorKey(slot1, slot2)] ~= nil then
		slot4:setGuildAttribute("is_apply", slot3)
	end
end

function GuildModel.updateMyGuildInfo(slot0, slot1)
	if slot0.my_guild_info == nil then
		slot0.my_guild_info = GuildMyInfoVo.New()
	end

	slot0.my_guild_info:updateData(slot1)
end

function GuildModel.clearMyGuildInfo(slot0)
	slot0.my_guild_info = nil
	slot0.guild_red_status_list = {}
	slot0.my_guild_assistant = {}
	slot0.guild_member_list = {}
	slot0.guild_donate_activity_list = {}

	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.guild)
end

function GuildModel.getMyGuildInfo(slot0)
	return slot0.my_guild_info
end

function GuildModel.updateMyGuildMemberList(slot0, slot1, slot2)
	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if slot2 == 2 then
		for slot7, slot8 in ipairs(slot1) do
			slot0.guild_member_list[getNorKey(slot8.rid, slot8.srv_id)] = nil

			if slot0.my_guild_assistant[getNorKey(slot8.rid, slot8.srv_id)] ~= nil then
				slot0.my_guild_assistant[getNorKey(slot8.rid, slot8.srv_id)] = nil

				if slot3.position ~= GuildConst.post_type.member then
					GlobalEvent:getInstance():Fire(GuildEvent.UpdateAssistantNumEvent)
				end
			end
		end
	else
		slot4 = nil

		for slot8, slot9 in ipairs(slot1) do
			slot4 = slot0.guild_member_list[getNorKey(slot9.rid, slot9.srv_id)]

			if slot0.my_guild_assistant[getNorKey(slot9.rid, slot9.srv_id)] ~= nil then
				if slot9.post ~= GuildConst.post_type.assistant then
					slot0.my_guild_assistant[getNorKey(slot9.rid, slot9.srv_id)] = nil

					if slot3.position ~= GuildConst.post_type.member then
						GlobalEvent:getInstance():Fire(GuildEvent.UpdateAssistantNumEvent)
					end
				end
			elseif slot9.post == GuildConst.post_type.assistant then
				slot0.my_guild_assistant[getNorKey(slot9.rid, slot9.srv_id)] = slot9

				if slot3.position ~= GuildConst.post_type.member then
					GlobalEvent:getInstance():Fire(GuildEvent.UpdateAssistantNumEvent)
				end
			end

			if slot4 == nil then
				slot0.guild_member_list[getNorKey(slot9.rid, slot9.srv_id)] = GuildMemberVo.New()
			end

			if slot9.is_self == nil then
				slot9.is_self = RoleController:getInstance():checkIsSelf(slot9.srv_id, slot9.rid)
			end

			slot9.role_post = slot3.position

			slot4:updateData(slot9)
		end
	end

	GlobalEvent:getInstance():Fire(GuildEvent.UpdateMyMemberListEvent, slot2)
end

function GuildModel.updateMemberByPosition(slot0, slot1)
	if slot0.guild_member_list ~= nil then
		for slot5, slot6 in pairs(slot0.guild_member_list) do
			slot6:setGuildAttribute("role_post", slot1)
		end
	end
end

function GuildModel.getAssistantSum(slot0)
	if slot0.my_guild_assistant == nil then
		return 0
	end

	for slot5, slot6 in pairs(slot0.my_guild_assistant) do
		slot1 = 0 + 1
	end

	return slot1
end

function GuildModel.getGuildMemberList(slot0, slot1)
	slot2 = {}
	slot3 = {}
	slot4 = RoleController:getInstance():getRoleVo()

	for slot8, slot9 in pairs(slot0.guild_member_list) do
		slot10 = false

		if slot1 == GuildConst.show_type.all then
			slot10 = true
		elseif slot1 == GuildConst.show_type.guild_war and slot9.day_war_time > 0 then
			slot10 = true
		elseif slot1 == GuildConst.show_type.guild_donate and slot9.day_donate == 0 then
			slot10 = true
		elseif slot1 == GuildConst.show_type.guild_voyage and slot9.day_dun_time > 0 then
			slot10 = true
		end

		if slot10 then
			if slot1 == GuildConst.show_type.all then
				uv0(slot3, slot9)
			elseif not slot4:isSameRole(slot9.srv_id, slot9.rid) then
				uv0(slot3, slot9)
			end
		end
	end

	if slot1 == GuildConst.show_type.all then
		slot2 = {
			"online",
			"post_sort"
		}
	elseif slot1 == GuildConst.show_type.guild_war then
		slot2 = {
			"online",
			"post_sort",
			"day_war_time"
		}
	elseif slot1 == GuildConst.show_type.guild_donate then
		slot2 = {
			"online",
			"post_sort",
			"day_donate"
		}
	elseif slot1 == GuildConst.show_type.guild_voyage then
		slot2 = {
			"online",
			"post_sort",
			"day_dun_time"
		}
	end

	if #slot3 > 1 and #slot2 > 0 then
		uv1(slot3, SortTools.tableUpperSorter(slot2))
	end

	return slot3
end

function GuildModel.updateDonateInfo(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.donate_sum = 0
	slot0.donate_list = {}

	for slot5, slot6 in ipairs(slot1) do
		slot0.donate_list[slot6.type] = slot6.num
		slot0.donate_sum = slot0.donate_sum + slot6.num
	end

	GlobalEvent:getInstance():Fire(GuildEvent.UpdateDonateInfo)
	slot0:updateGuildRedStatus(GuildConst.red_index.donate, slot0.donate_sum <= 0)
end

function GuildModel.setGuildDonateStatus(slot0)
	slot0.donate_sum = slot0.donate_sum + 1

	slot0:updateGuildRedStatus(GuildConst.red_index.donate, false)
end

function GuildModel.checkDonateStatus(slot0, slot1)
	slot2 = 0

	if slot0.donate_list and slot0.donate_list[slot1] then
		slot2 = slot0.donate_list[slot1]
	end

	return slot0.donate_sum > 0, slot2 and slot2 > 0
end

function GuildModel.updateGuildApplyList(slot0, slot1)
	slot0.guild_apply_list = {}

	for slot5, slot6 in ipairs(slot1) do
		slot0.guild_apply_list[getNorKey(slot6.rid, slot6.srv_id)] = slot6
	end

	GlobalEvent:getInstance():Fire(GuildEvent.UpdateApplyListInfo)
	slot0:clearApplyRedStatus()
end

function GuildModel.deleteApplyInfo(slot0, slot1, slot2)
	if slot0.guild_apply_list[getNorKey(slot1, slot2)] ~= nil then
		slot0.guild_apply_list[getNorKey(slot1, slot2)] = nil

		GlobalEvent:getInstance():Fire(GuildEvent.UpdateApplyListInfo)
		slot0:clearApplyRedStatus()
	end
end

function GuildModel.clearApplyRedStatus(slot0)
	if tableLen(slot0.guild_apply_list) == 0 then
		slot0:updateGuildRedStatus(GuildConst.red_index.apply, false)
	end
end

function GuildModel.getGuildApplyList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.guild_apply_list) do
		uv0(slot1, slot6)
	end

	if #slot1 > 1 then
		uv1(slot1, SortTools.tableUpperSorter({
			"is_online",
			"power",
			"vip_lev"
		}))
	end

	return slot1
end

function GuildModel.updateGuildRedStatus(slot0, slot1, slot2)
	if MainuiController:getInstance():checkIsOpenByActivate(Config.FunctionData.data_base[6].activate) == false then
		return
	end

	if slot0.guild_red_status_list[slot1] == slot2 then
		return
	end

	slot0.guild_red_status_list[slot1] = slot2

	if slot1 ~= GuildConst.red_index.notice and slot1 ~= GuildConst.red_index.skill_2 and slot1 ~= GuildConst.red_index.skill_3 and slot1 ~= GuildConst.red_index.skill_4 and slot1 ~= GuildConst.red_index.skill_5 and slot1 ~= GuildConst.red_index.pvp_skill_2 and slot1 ~= GuildConst.red_index.pvp_skill_3 and slot1 ~= GuildConst.red_index.pvp_skill_4 and slot1 ~= GuildConst.red_index.pvp_skill_5 then
		MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.guild, {
			bid = slot1,
			status = slot2
		})
	end

	GlobalEvent:getInstance():Fire(GuildEvent.UpdateGuildRedStatus, slot1, slot2)
end

function GuildModel.updataGuildActionRedStatus(slot0, slot1)
	slot0.goal_data = slot1
	slot2 = false

	if slot1.lev < #Config.GuildQuestData.data_lev_data and slot3[slot1.lev].exp <= slot1.exp then
		slot2 = true
	end

	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.guild, {
		bid = GuildConst.red_index.goal_action,
		status = slot2
	})
	slot0:updateGuildRedStatus(GuildConst.red_index.goal_action, slot2)
end

function GuildModel.getGoalRedStatus(slot0)
	if slot0.goal_data == nil or not next(slot0.goal_data) then
		return
	end

	slot1 = false

	if slot0.goal_data.lev < #Config.GuildQuestData.data_lev_data and slot2[slot0.goal_data.lev].exp <= slot0.goal_data.exp then
		slot1 = true
	end

	return slot1
end

function GuildModel.getGuildActiveLev(slot0)
	if slot0.goal_data then
		return slot0.goal_data.lev or 0
	end

	return 0
end

function GuildModel.getRedStatus(slot0, slot1)
	return slot0.guild_red_status_list[slot1]
end

function GuildModel.getDonateRedStatus(slot0)
	if slot0:getRedStatus(GuildConst.red_index.donate) == true then
		return slot1
	end

	return slot0:getRedStatus(GuildConst.red_index.donate_activity)
end

function GuildModel.updateDonateBoxInfo(slot0, slot1, slot2)
	slot0.guild_donate_activity_list = {}
	slot0.guild_donate_activity = slot2

	for slot6, slot7 in ipairs(slot1) do
		slot0.guild_donate_activity_list[slot7.box_id] = true
	end

	slot0:checkDonateActivity()
end

function GuildModel.setDonateBoxStatus(slot0, slot1)
	if slot0.guild_donate_activity_list == nil then
		slot0.guild_donate_activity_list = {}
	end

	slot0.guild_donate_activity_list[slot1] = true

	GlobalEvent:getInstance():Fire(GuildEvent.UpdateDonateBoxStatus, slot1)
	slot0:checkDonateActivity()
end

function GuildModel.updateDonateActivity(slot0, slot1)
	slot0.guild_donate_activity = slot1

	GlobalEvent:getInstance():Fire(GuildEvent.UpdateDonateBoxStatus)
	slot0:checkDonateActivity()
end

function GuildModel.checkDonateActivity(slot0)
	slot2 = false

	for slot6, slot7 in ipairs(Config.GuildData.data_donate_box) do
		if slot7.box_val <= (slot0.guild_donate_activity or 0) and not slot0.guild_donate_activity_list[slot6] then
			slot2 = true

			break
		end
	end

	slot0:updateGuildRedStatus(GuildConst.red_index.donate_activity, slot2)
end

function GuildModel.getDonateActivityValue(slot0)
	return slot0.guild_donate_activity or 0
end

function GuildModel.getDonateBoxStatus(slot0, slot1)
	return slot0.guild_donate_activity_list[slot1]
end

function GuildModel.initGuildNoticeList(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.guild_notice_list = {}

	for slot5, slot6 in ipairs(slot1) do
		if not slot0.guild_notice_list[TimeTool.getMD3(slot6.time)] then
			slot0.guild_notice_list[slot7] = {}
		end

		slot8 = GuildNoticeVo.New()

		slot8:updateData(slot6)
		uv0(slot0.guild_notice_list[slot7], slot8)
	end

	GlobalEvent:getInstance():Fire(GuildEvent.UpdateGuildNoticeList)
end

function GuildModel.getGuildNoticeList(slot0, slot1)
	slot2 = slot1
	slot3 = {}
	slot4 = {}

	for slot9, slot10 in pairs(slot0.guild_notice_list) do
		slot14 = TimeTool.getMixTime

		uv0({}, slot14(slot9))

		for slot14, slot15 in pairs(slot10) do
			if not slot3[slot9] then
				slot3[slot9] = {}
			end

			if slot2 == GuildConst.show_type.all then
				uv0(slot3[slot9], slot15)
			elseif slot15.type == slot2 then
				uv0(slot3[slot9], slot15)
			end
		end

		if next(slot3[slot9]) == nil then
			slot3[slot9] = nil
		end
	end

	for slot9, slot10 in pairs(slot3) do
		if #slot10 > 1 then
			table.sort(slot10, SortTools.KeyUpperSorter("time"))
		end
	end

	function slot9(slot0, slot1)
		if tonumber(slot1) < tonumber(slot0) then
			return true
		end

		return false
	end

	uv1(slot5, slot9)

	for slot9, slot10 in pairs(slot5) do
		if slot3[TimeTool.getSplitTime(slot10)] and next(slot3[slot11]) ~= nil then
			uv0(slot4, slot3[slot11])
		end
	end

	return slot4
end

function GuildModel.addGuildNoticeItem(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	for slot5, slot6 in ipairs(slot1) do
		if not slot0.guild_notice_list[TimeTool.getMD3(slot6.time)] then
			slot0.guild_notice_list[slot7] = {}
		end

		slot8 = GuildNoticeVo.New()

		slot8:updateData(slot6)
		uv0(slot0.guild_notice_list[slot7], slot8)
	end

	GlobalEvent:getInstance():Fire(GuildEvent.UpdateGuildNoticeList)
end

function GuildModel.__delete(slot0)
end
