AdventureUIModel = AdventureUIModel or BaseClass()

function AdventureUIModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function AdventureUIModel.config(slot0)
	slot0.room_list = {}
	slot0.base_data = {}
	slot0.buff_data = {}
	slot0.holiday_buff_data = {}
	slot0.form_list = {}
	slot0.select_partner_id = 0
	slot0.red_status = false
	slot0.backpack_list = {}
	slot0.plist = {}
	slot0.before_room = 0
	slot0.plunder_record_list = {}
	slot0.is_first_record_red = true
	slot0.dic_mine_hero_list = {}
	slot0.mine_buy_count = 0
	slot0.challenge_count = 0
	slot0.mine_record_redpoint = false
	slot0.mine_count_redpoint = false
	slot0.had_combat_num = 0
	slot0.dic_receive_num = {}
	slot0.is_back_20647 = false
	slot0.is_back_20657 = false
	slot0.is_back_20659 = false
	slot0.mine_occupy_count = 0
end

function AdventureUIModel.setScdata20647(slot0, slot1)
	slot0.is_back_20647 = true

	if not slot1 then
		return
	end

	slot0.challenge_count = slot1.count
	slot0.had_combat_num = slot1.had_combat_num
	slot0.dic_receive_num = {}

	for slot5, slot6 in ipairs(slot1.num_list) do
		slot0.dic_receive_num[slot6.num] = true
	end

	if slot0.is_back_20647 and slot0.is_back_20657 and slot0.is_back_20659 then
		slot0:checkRedPoint()
	end
end

function AdventureUIModel.setReceiveByNum(slot0, slot1)
	if slot0.dic_receive_num and slot1 then
		slot0.dic_receive_num[slot1] = true

		slot0:checkRedPoint()
	end
end

function AdventureUIModel.checkRedPoint(slot0, slot1)
	slot2 = false

	if slot0.base_data and slot0.base_data.pass_id and slot0.base_data.pass_id >= 10 and not slot0.mine_record_redpoint then
		if slot0.mine_count_redpoint and slot0.challenge_count and slot0.challenge_count > 0 then
			slot2 = true
		elseif Config.AdventureMineData.data_box_reward and slot0.dic_receive_num and slot0.had_combat_num then
			for slot7, slot8 in ipairs(slot3) do
				if slot8.num <= slot0.had_combat_num and not slot0.dic_receive_num[slot8.num] then
					slot2 = true

					break
				end
			end
		end
	end

	if not slot1 then
		MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.adventure, {
			bid = AdventureActivityConst.Red_Type.adventure_mine,
			status = slot2
		})
	end

	return slot2
end

function AdventureUIModel.isMineRecordRedpoint(slot0)
	return slot0.mine_record_redpoint == true
end

function AdventureUIModel.setMineRecordRedpoint(slot0, slot1)
	slot0.is_back_20657 = true

	if slot1 ~= nil then
		slot0.mine_record_redpoint = slot1
	else
		slot0.mine_record_redpoint = false
	end

	if slot0.is_back_20647 and slot0.is_back_20657 and slot0.is_back_20659 then
		slot0:checkRedPoint()
	end
end

function AdventureUIModel.setMineCountRedpoint(slot0, slot1)
	slot0.is_back_20659 = true

	if slot1 ~= nil then
		slot0.mine_count_redpoint = slot1
	else
		slot0.mine_count_redpoint = false
	end

	if slot0.is_back_20647 and slot0.is_back_20657 and slot0.is_back_20659 then
		slot0:checkRedPoint()
	end
end

function AdventureUIModel.setMineBuyCount(slot0, slot1)
	if slot1 then
		slot0.mine_buy_count = slot1
	end
end

function AdventureUIModel.getMineBuyCount(slot0)
	return slot0.mine_buy_count or 0
end

function AdventureUIModel.setChallengeCount(slot0, slot1)
	if slot1 then
		slot0.challenge_count = slot1

		if slot0.challenge_count and slot2 ~= slot0.challenge_count then
			slot0:checkRedPoint()
			GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_CHALLEAGE_RED_POINT_EVENT)
		end
	end
end

function AdventureUIModel.getChallengeCount(slot0)
	return slot0.challenge_count or 0
end

function AdventureUIModel.updateMineDefenseInfo(slot0, slot1)
	if not slot1 then
		return
	end

	for slot5, slot6 in pairs(slot0.dic_mine_hero_list) do
		if slot6.updateFormPos and slot6.updateFormPos then
			slot6:updateFormPos(0, PartnerConst.Fun_Form.Adventure_Mine_Def)
		end
	end

	slot0.dic_mine_hero_list = {}

	for slot6, slot7 in ipairs(slot1.defense) do
		if HeroController:getInstance():getModel():getHeroById(slot7.id) then
			slot0.dic_mine_hero_list[slot7.id] = slot8

			if slot8.updateFormPos then
				slot8:updateFormPos(1, PartnerConst.Fun_Form.Adventure_Mine_Def)
			end
		end
	end
end

function AdventureUIModel.setFightSkipCount(slot0, slot1)
	slot0.fight_skip_count = slot1
end

function AdventureUIModel.getFightSkipCount(slot0)
	if slot0.fight_skip_count then
		return slot0.fight_skip_count
	end

	return 0
end

function AdventureUIModel.setAdventureFightReturnTag(slot0, slot1)
	slot0.fight_return = slot1
end

function AdventureUIModel.getAdventureFightReturnTag(slot0)
	if slot0.fight_return then
		return slot0.fight_return
	end

	return false
end

function AdventureUIModel.updateFormPartner(slot0, slot1, slot2)
	slot0.form_list = slot1
	slot0.select_partner_id = slot2

	slot0:updateRedStatus(#slot1 == 0)
	GlobalEvent:getInstance():Fire(AdventureEvent.UpdateAdventureForm)
end

function AdventureUIModel.updateRedStatus(slot0, slot1)
	slot0.red_status = slot1

	if AdventureActivityController:getInstance():isOpenActivity(AdventureActivityConst.Ground_Type.adventure) == false then
		slot0.red_status = false
	end

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.adventure, {
		bid = AdventureActivityConst.Red_Type.adventure,
		status = slot1
	})
end

function AdventureUIModel.setAdventureBoxStatus(slot0, slot1)
	slot0.box_status_list = {}

	for slot5, slot6 in pairs(slot1.list) do
		slot0.box_status_list[slot6.id] = slot6.status
	end

	slot2 = false

	for slot6, slot7 in pairs(slot1.list) do
		if slot7.status == 1 then
			slot2 = true

			break
		end
	end

	slot0.box_redpoint = slot2

	GlobalEvent:getInstance():Fire(AdventureEvent.UpdateAdventureForm)
	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.adventure, {
		bid = AdventureActivityConst.Red_Type.adventure,
		status = slot0:getAdventureRedPoint()
	})
end

function AdventureUIModel.getAdventureBoxStatus(slot0, slot1)
	if slot0.box_status_list and slot0.box_status_list[slot1] then
		return slot0.box_status_list[slot1]
	end

	return 0
end

function AdventureUIModel.getAdventureRedPoint(slot0)
	slot1 = slot0.red_status or false

	return slot0.red_status or (slot0.box_redpoint or false)
end

function AdventureUIModel.getFormList(slot0)
	return slot0.form_list
end

function AdventureUIModel.allHeroIsDie(slot0)
	slot1 = true

	for slot5, slot6 in pairs(slot0.form_list) do
		if slot6.now_hp ~= 0 then
			slot1 = false

			break
		end
	end

	return slot1
end

function AdventureUIModel.getSelectPartnerID(slot0)
	return slot0.select_partner_id
end

function AdventureUIModel.updateSelectPartnerID(slot0, slot1)
	slot0.select_partner_id = slot1

	GlobalEvent:getInstance():Fire(AdventureEvent.UpdateAdventureSelectHero)
end

function AdventureUIModel.__delete(slot0)
	if slot0.role_vo ~= nil then
		if slot0.role_assets_event ~= nil then
			slot0.role_vo:UnBind(slot0.role_assets_event)

			slot0.role_assets_event = nil
		end

		slot0.role_vo = nil
	end
end

function AdventureUIModel.setAdventureBaseData(slot0, slot1)
	slot0.base_data = slot1

	GlobalEvent:getInstance():Fire(AdventureEvent.Update_Room_Base_Info)
end

function AdventureUIModel.getAdventureBaseData(slot0)
	return slot0.base_data
end

function AdventureUIModel.setBuffData(slot0, slot1)
	slot0.buff_data = slot1.buff_list
	slot0.holiday_buff_data = slot1.holiday_buff_list

	GlobalEvent:getInstance():Fire(AdventureEvent.Update_Buff_Info)
end

function AdventureUIModel.getBuffData(slot0)
	if slot0.buff_data and next(slot0.buff_data or {}) ~= nil then
		return slot0.buff_data
	end
end

function AdventureUIModel.getHolidayBuffData(slot0)
	if slot0.holiday_buff_data and next(slot0.holiday_buff_data or {}) ~= nil then
		return slot0.holiday_buff_data
	end
end

function AdventureUIModel.setRoomList(slot0, slot1)
	if slot1 == nil or slot1.room_list == nil then
		return
	end

	for slot5, slot6 in ipairs(slot1.room_list) do
		slot0.room_list[slot6.id] = slot6
	end

	GlobalEvent:getInstance():Fire(AdventureEvent.Update_Room_Info)
end

function AdventureUIModel.getRoomList(slot0)
	if slot0.room_list and next(slot0.room_list or {}) ~= nil then
		return slot0.room_list
	end
end

function AdventureUIModel.updateRoomList(slot0, slot1)
	for slot5, slot6 in ipairs(slot1.room_list) do
		if slot0.room_list[slot6.id] then
			slot7.status = slot6.status
			slot7.lock = slot6.lock
			slot7.evt_id = slot6.evt_id

			if slot7.status == AdventureConst.status.open and Config.AdventureData.data_adventure_event(slot7.evt_id) and slot8.auto_open == 1 then
				delayOnce(function ()
					AdventureController:getInstance():send20620(uv0.id, AdventureEvenHandleType.handle, {
						{
							val = 1,
							type = 4
						}
					})
				end, (slot5 - 1) * 0.5 + 1)
			end
		end
	end

	GlobalEvent:getInstance():Fire(AdventureEvent.Update_Single_Room_Info, slot1)
end

function AdventureUIModel.getRoomInfoByRoomID(slot0, slot1)
	if slot0.room_list and next(slot0.room_list or {}) ~= nil then
		slot2 = nil

		for slot6, slot7 in ipairs(slot0.room_list) do
			if slot7.id == slot1 then
				slot2 = slot7

				break
			end
		end

		return slot2
	end
end

function AdventureUIModel.getCurIndex(slot0, slot1, slot2)
	slot3 = slot1 + 1
	slot4 = 0
	slot5 = 0
	slot6 = RoleController:getInstance():getRoleVo().vip_lev

	while slot2[slot3] do
		if slot2[slot3].cost == 0 then
			slot4 = slot4 + 1
		elseif slot2[slot3].vip <= slot6 then
			slot5 = slot5 + 1
		end

		slot3 = slot3 + 1
	end

	return slot4, slot5
end

function AdventureUIModel.getMineRate(slot0, slot1, slot2)
	if not slot0.base_data or not slot1 or not slot2 then
		return 0
	end

	if Config.AdventureMineData.data_attenuation_reward[math.floor((slot0.base_data.pass_id - slot1) / 10) * 10] then
		return math.floor(slot2 * (1 - slot4.dec_rate / 1000) + 0.5), slot4.dec_rate
	end

	return slot2
end

function AdventureUIModel.getMineLockCount(slot0)
	slot2 = RoleController:getInstance():getRoleVo()

	for slot7, slot8 in pairs(Config.AdventureMineData.data_mine_unlock_info) do
		if next(slot8.open_cond) ~= nil then
			if slot8.open_cond[1][1] == "lev" then
				if slot2 and slot9[2] <= slot2.lev then
					slot1 = 0 + 1
				end
			elseif slot9[1] == "vip" and slot2 and slot9[2] <= slot2.vip_lev then
				slot1 = slot1 + 1
			end
		else
			slot1 = slot1 + 1
		end
	end

	return slot1
end

function AdventureUIModel.setMineOccupyCount(slot0, slot1)
	slot0.mine_occupy_count = slot1 or 0
end

function AdventureUIModel.getMineOccupyCount(slot0)
	return slot0.mine_occupy_count
end

function AdventureUIModel.setLastAdventureNum(slot0, slot1)
	slot0.last_adventure_num = slot1
end

function AdventureUIModel.getLastAdventureNum(slot0)
	return slot0.last_adventure_num
end
