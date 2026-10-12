ArenapeakchampionModel = ArenapeakchampionModel or BaseClass()

function ArenapeakchampionModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function ArenapeakchampionModel.config(slot0)
	slot0.main_data = nil
	slot0.my_guess_data = nil
	slot0.match_data_256 = {}
	slot0.max_group_256 = {}
	slot0.match_data_64 = {}
	slot0.max_group_64 = {}
	slot0.match_data_8 = {}
end

function ArenapeakchampionModel.checkPeakChampionTotalRedPoint(slot0, slot1)
	if not slot0:checkPeakChampionIsOpen(true) then
		return false
	end

	if slot0:getGuessRedPoint() then
		PromptController:getInstance():getModel():addPromptData({
			type = PromptTypeConst.Peak_champion_arena_tips
		})
	else
		PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.Peak_champion_arena_tips)
	end

	if slot0.main_data then
		if not slot3 and (slot0.my_match_redpoint or slot0.match_stage_redpoint) then
			slot3 = true
		end

		slot3 = slot3 or slot0.is_worship_redpoint or false
	end

	if slot1 then
		GlobalEvent:getInstance():Fire(ArenapeakchampionEvent.ARENAPEAKCHAMPION_ALL_RED_POINT_EVENT)
		MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.ladder, {
			bid = CrossgroundConst.Red_Type.peakChampion,
			status = slot3
		})
	end

	return slot3
end

function ArenapeakchampionModel.setWorshipRedPoint(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = 3

	if Config.ArenaPeakChampionData.data_const.like_max then
		slot2 = slot3.val or 3
	end

	if slot1 >= slot2 then
		slot0.is_worship_redpoint = false
	else
		slot0.is_worship_redpoint = true
	end

	slot0:checkPeakChampionTotalRedPoint(true)
end

function ArenapeakchampionModel.getWorshipRedPoint(slot0)
	return slot0.is_worship_redpoint or false
end

function ArenapeakchampionModel.getGuessRedPoint(slot0)
	if slot0.main_data and slot0.my_bet_type and slot0.main_data.step ~= 0 and slot0.main_data.step_status ~= 2 and slot0.main_data.round_status == 2 and slot0.my_bet_type == 0 then
		return true
	end

	return false
end

function ArenapeakchampionModel.setLoginRedPoint(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.main_data then
		return
	end

	for slot5, slot6 in ipairs(slot1.point_info) do
		if slot6.type == 1 then
			slot0.my_match_redpoint = slot6.is_point == 0
		elseif slot6.type == 2 then
			if slot0.main_data.step == 256 or slot0.main_data.step == 64 or slot0.main_data.step == 8 then
				slot0.match_stage_redpoint = slot6.is_point == 0
			else
				slot0.match_stage_redpoint = false
			end
		end
	end

	slot0:checkPeakChampionTotalRedPoint(true)
end

function ArenapeakchampionModel.setMyMatchRedPoint(slot0, slot1)
	slot0.my_match_redpoint = slot1

	slot0:checkPeakChampionTotalRedPoint(true)
end

function ArenapeakchampionModel.setMatchStageRedPoint(slot0, slot1)
	slot0.match_stage_redpoint = slot1

	slot0:checkPeakChampionTotalRedPoint(true)
end

function ArenapeakchampionModel.setMainData(slot0, slot1)
	slot0.main_data = slot1

	if slot0.main_data and slot0.my_bet_type then
		slot0:checkPeakChampionTotalRedPoint(true)
	end

	if not slot0.check_cross_arena then
		slot0.check_cross_arena = true

		CrossarenaController:getInstance():getModel():checkCrossarenaPrompt()
	end
end

function ArenapeakchampionModel.getMainData(slot0)
	return slot0.main_data
end

function ArenapeakchampionModel.setBetTypeInfo(slot0, slot1)
	slot0.my_bet_type = slot1

	if slot0.main_data and slot0.my_bet_type then
		slot0:checkPeakChampionTotalRedPoint(true)
	end
end

function ArenapeakchampionModel.setMyGuessData(slot0, slot1)
	slot0.my_guess_data = slot1
end

function ArenapeakchampionModel.getMyGuessData(slot0)
	return slot0.my_guess_data
end

function ArenapeakchampionModel.setMatchData256(slot0, slot1, slot2)
	if slot1 then
		slot0.match_data_256[slot2] = {}
		slot0.max_group_256[slot2] = 0

		for slot6, slot7 in ipairs(slot1) do
			slot0.match_data_256[slot2][slot7.group] = slot7.pos_list

			if slot0.max_group_256[slot2] < slot7.group then
				slot0.max_group_256[slot2] = slot7.group
			end
		end
	else
		slot0.match_data_256[slot2] = nil
		slot0.max_group_256[slot2] = 0
	end
end

function ArenapeakchampionModel.getMatchData256ByGroup(slot0, slot1, slot2)
	if slot0.match_data_256 and slot0.match_data_256[slot2] then
		return slot0.match_data_256[slot2][slot1]
	end

	return nil
end

function ArenapeakchampionModel.setMatchData64(slot0, slot1, slot2)
	if slot1 then
		slot0.match_data_64[slot2] = {}
		slot0.max_group_64[slot2] = 0

		for slot6, slot7 in ipairs(slot1) do
			slot0.match_data_64[slot2][slot7.group] = slot7.pos_list

			if slot0.max_group_64[slot2] < slot7.group then
				slot0.max_group_64[slot2] = slot7.group
			end
		end
	else
		slot0.match_data_64[slot2] = nil
		slot0.max_group_64[slot2] = 0
	end
end

function ArenapeakchampionModel.getMatchData64ByGroup(slot0, slot1, slot2)
	if slot0.match_data_64 and slot0.match_data_64[slot2] then
		return slot0.match_data_64[slot2][slot1]
	end

	return nil
end

function ArenapeakchampionModel.setMatchData8(slot0, slot1, slot2)
	slot0.match_data_8[slot2] = slot1
end

function ArenapeakchampionModel.getMatchData8(slot0, slot1)
	return slot0.match_data_8[slot1]
end

function ArenapeakchampionModel.getMacthText(slot0, slot1, slot2, slot3)
	if not slot1 or not slot2 then
		return
	end

	if slot1 == 0 then
		if slot0:isBeforeOpenMacthTime() then
			return TI18N("即将开赛")
		else
			return TI18N("未开赛")
		end
	else
		slot4, slot5 = nil

		if slot1 == 1 then
			slot4 = string.format(TI18N("预选赛第%s轮"), StringUtil.numToChinese(slot2))
		elseif slot1 == 256 then
			if slot2 == 1 then
				slot4 = string.format(TI18N("晋级赛256进128"))
			else
				slot4 = string.format(TI18N("晋级赛128进64"))
			end
		elseif slot1 == 64 then
			if slot2 == 1 then
				slot4 = TI18N("冠军赛64进32")
			elseif slot2 == 2 then
				slot4 = TI18N("冠军赛32进16")
			else
				slot4 = TI18N("冠军赛16进8")
			end
		elseif slot1 == 8 then
			slot4 = (slot2 ~= 1 or TI18N("冠军赛8进4")) and (slot2 ~= 2 or TI18N("冠军赛半决赛")) and TI18N("冠军赛决赛")
		end

		if slot3 then
			slot5 = (slot3 ~= 2 or TI18N(" 竞猜阶段")) and (slot3 ~= 3 or TI18N(" 对战阶段")) and TI18N(" 休整阶段")
		end

		return slot4, slot5
	end
end

function ArenapeakchampionModel.getMacthSingleText(slot0, slot1, slot2)
	if not slot0.main_data then
		return
	end

	slot4 = slot0.main_data.round or 0

	if (slot0.main_data.step or 0) == 0 or slot0.main_data.step_status == 2 then
		if slot0:isBeforeOpenMacthTime() then
			return TI18N("即将开赛")
		else
			return TI18N("未开赛")
		end
	else
		slot5 = nil

		if slot3 == 1 then
			slot5 = TI18N("预选赛")
		elseif slot3 == 256 then
			if slot4 == 1 then
				slot5 = TI18N("256强赛")
			else
				slot5 = TI18N("128强赛")
			end
		elseif slot3 == 64 then
			if slot4 == 1 then
				slot5 = TI18N("64强赛")
			elseif slot4 == 2 then
				slot5 = TI18N("32强赛")
			else
				slot5 = TI18N("16强赛")
			end
		elseif slot3 == 8 then
			slot5 = (slot4 ~= 1 or TI18N("8强赛")) and (slot4 ~= 2 or TI18N("半决赛")) and TI18N("决赛")
		end

		return slot5
	end
end

function ArenapeakchampionModel.isBeforeOpenMacthTime(slot0)
	if not slot0.main_data then
		return false
	end

	if slot0.main_data.step == 0 or slot0.main_data.step_status == 2 then
		if slot0.main_data.start_time - GameNet:getInstance():getTime() < 0 then
			slot1 = 0
		end

		if slot1 <= 453600 then
			return true
		else
			return false
		end
	else
		return false
	end
end

function ArenapeakchampionModel.getSecondData(slot0, slot1, slot2, slot3)
	slot4 = {
		[slot10.order] = slot10
	}
	slot5 = slot3 or 3

	for slot9, slot10 in ipairs(slot1.a_defense) do
		-- Nothing
	end

	slot6 = {
		[slot11.order] = slot11
	}

	for slot10, slot11 in ipairs(slot1.b_defense) do
		-- Nothing
	end

	slot7 = {
		[slot12.order] = slot12
	}

	for slot11, slot12 in ipairs(slot1.result_info) do
		-- Nothing
	end

	slot8 = table.insert
	slot9 = {
		arena_replay_infos = {}
	}

	for slot13 = 1, slot5 do
		if slot7[slot13] then
			-- Nothing
		end

		for slot18, slot19 in ipairs(slot1.a_sprites_list) do
			if slot19.team == slot14.order then
				slot14.a_sprite_data = slot19.sprites_list
			end
		end

		if slot4[slot13] then
			slot14.a_power = slot4[slot13].power
			slot14.a_formation_type = slot4[slot13].formation_type
			slot14.a_hallows_id = slot4[slot13].hallows_id
			slot14.a_hallows_look_id = slot4[slot13].hallows_look_id
			slot16 = {}

			if Config.FormationData.data_form_data[slot4[slot13].formation_type] then
				for slot20, slot21 in ipairs(slot15.pos) do
					slot16[slot21[1]] = slot21[2]
				end
			end

			for slot20, slot21 in ipairs(slot4[slot13].plist) do
				if ({
					pos = slot16[slot21.pos] or 1,
					bid = slot21.bid,
					id = slot21.id,
					lev = slot21.lev,
					star = slot21.star,
					ext = slot21.ext
				}).ext ~= nil and type(slot22.ext) == "table" then
					slot8(slot22.ext, {
						key = 5,
						val = slot21.skin_id
					})
				else
					slot22.ext = {
						{
							key = 5,
							val = slot21.skin_id
						}
					}
				end

				slot8(slot14.a_plist, slot22)
			end
		else
			slot14.a_power = 0
			slot14.a_formation_type = 0
			slot14.a_hallows_id = 0
			slot14.a_hallows_look_id = 0
		end

		for slot18, slot19 in ipairs(slot1.b_sprites_list) do
			if slot19.team == slot14.order then
				slot14.b_sprite_data = slot19.sprites_list
			end
		end

		if slot6[slot13] then
			slot14.b_power = slot6[slot13].power
			slot14.b_formation_type = slot6[slot13].formation_type
			slot14.b_hallows_id = slot6[slot13].hallows_id
			slot14.b_hallows_look_id = slot6[slot13].hallows_look_id
			slot16 = {}

			if Config.FormationData.data_form_data[slot6[slot13].formation_type] then
				for slot20, slot21 in ipairs(slot15.pos) do
					slot16[slot21[1]] = slot21[2]
				end
			end

			for slot20, slot21 in ipairs(slot6[slot13].plist) do
				if ({
					pos = slot16[slot21.pos] or 1,
					bid = slot21.bid,
					id = slot21.id,
					lev = slot21.lev,
					star = slot21.star,
					ext = slot21.ext
				}).ext ~= nil and type(slot22.ext) == "table" then
					slot8(slot22.ext, {
						key = 5,
						val = slot21.skin_id
					})
				else
					slot22.ext = {
						{
							key = 5,
							val = slot21.skin_id
						}
					}
				end

				slot8(slot14.b_plist, slot22)
			end
		else
			slot14.b_power = 0
			slot14.b_formation_type = 0
			slot14.b_hallows_id = 0
			slot14.b_hallows_look_id = 0
		end

		if slot2 then
			slot14.hurt_statistics = {}
			slot15 = {
				type = 1,
				partner_hurts = {}
			}

			if slot4[slot13] then
				for slot19, slot20 in ipairs(slot4[slot13].plist) do
					slot21 = {
						rid = slot1.a_rid,
						srvid = slot1.a_srv_id,
						id = slot20.id,
						bid = slot20.bid,
						star = slot20.star,
						lev = slot20.lev,
						camp_type = 1,
						camp_type = slot22.camp_type,
						dps = slot20.hurt,
						cure = slot20.curt,
						ext_data = slot20.ext
					}

					if Config.PartnerData.data_partner_base[slot20.bid] then
						-- Nothing
					end

					if slot21.ext_data ~= nil and type(slot21.ext_data) == "table" then
						slot8(slot21.ext_data, {
							key = 5,
							val = slot20.skin_id
						})
					else
						slot21.ext_data = {
							{
								key = 5,
								val = slot20.skin_id
							}
						}
					end

					slot8(slot15.partner_hurts, slot21)
				end
			end

			slot8(slot14.hurt_statistics, slot15)

			slot16 = {
				type = 2,
				partner_hurts = {}
			}

			if slot6[slot13] then
				for slot20, slot21 in ipairs(slot6[slot13].plist) do
					slot22 = {
						rid = slot1.b_rid,
						srvid = slot1.b_srv_id,
						id = slot21.id,
						bid = slot21.bid,
						star = slot21.star,
						lev = slot21.lev,
						camp_type = 1,
						camp_type = slot23.camp_type,
						dps = slot21.hurt,
						cure = slot21.curt,
						ext_data = slot21.ext
					}

					if Config.PartnerData.data_partner_base[slot21.bid] then
						-- Nothing
					end

					if slot22.ext_data ~= nil and type(slot22.ext_data) == "table" then
						slot8(slot22.ext_data, {
							key = 5,
							val = slot21.skin_id
						})
					else
						slot22.ext_data = {
							{
								key = 5,
								val = slot21.skin_id
							}
						}
					end

					slot8(slot16.partner_hurts, slot22)
				end
			end

			slot8(slot14.hurt_statistics, slot16)
		end

		slot8(slot9.arena_replay_infos, {
			order = slot13,
			round = slot7[slot13].round,
			time = slot7[slot13].time,
			ret = slot7[slot13].ret,
			id = slot7[slot13].replay_id,
			replay_sid = slot7[slot13].replay_sid,
			rid = slot1.a_rid,
			srv_id = slot1.a_srv_id,
			a_order = slot13,
			a_tree_lv = slot1.a_sprite_lev,
			a_sprite_data = slot1.a_sprites,
			a_plist = {},
			b_rid = slot1.b_rid,
			b_srv_id = slot1.b_srv_id,
			b_order = slot13,
			b_tree_lv = slot1.b_sprite_lev,
			b_sprite_data = slot1.b_sprites,
			b_plist = {}
		})
	end

	return slot9
end

function ArenapeakchampionModel.checkPeakChampionIsOpen(slot0, slot1)
	slot2 = RoleController:getInstance():getRoleVo()

	if Config.ArenaPeakChampionData.data_const.open_lev_limit and slot2 and slot2.lev < slot3.val then
		if not slot1 then
			message(slot3.desc)
		end

		return false, slot3.desc
	end

	slot4 = Config.ArenaPeakChampionData.data_const.open_world_lev_limit

	if RoleController:getInstance():getModel():getWorldLev() and slot4 and slot5 < slot4.val then
		if not slot1 then
			message(slot4.desc)
		end

		return false, slot4.desc
	end

	return true
end

function ArenapeakchampionModel.__delete(slot0)
end
