HomepetModel = HomepetModel or BaseClass();
slot0 = table.insert;
slot1 = table.remove;
slot2 = table.sort;

function HomepetModel.__init(slot0, slot1)
	slot0.ctrl = slot1;

	slot0:config();
end

function HomepetModel.config(slot0)
	slot0.homepet_vo = nil;
	slot0.event_data_list = {};
	slot0.dic_event_data = {};
	slot0.cur_evt_id = 0;
	slot0.dic_have_treasure_id = {};
	slot0.dic_photo_data = {};
	slot0.dic_letter_data = {};
	slot0.is_init_event = false;
end

function HomepetModel.updatePhotodData(slot0, slot1)
	for slot5, slot6 in ipairs(slot1.list) do
		if slot0.dic_photo_data[slot6.id] == nil then
			slot0.dic_photo_data[slot6.id] = slot6;
			slot0.dic_photo_data[slot6.id].config = Config.ItemData.data_get_data(slot6.base_id);
		end
	end
end

function HomepetModel.updateLetterdData(slot0, slot1)
	for slot5, slot6 in ipairs(slot1.list) do
		if slot0.dic_letter_data[slot6.id] == nil then
			slot0.dic_letter_data[slot6.id] = slot6;
			slot0.dic_letter_data[slot6.id].config = Config.ItemData.data_get_data(slot6.base_id);
		end
	end
end

function HomepetModel.deletePhotodData(slot0, slot1)
	if slot0.dic_photo_data ~= nil and slot0.dic_photo_data[slot1] then
		slot0.dic_photo_data[slot1] = nil;

		GlobalEvent:getInstance():Fire(HomepetEvent.HOME_PET_DELETE_PHOTO_EVENT, slot1);
	end
end

function HomepetModel.deleteLetterdData(slot0, slot1)
	if slot0.dic_letter_data ~= nil and slot0.dic_letter_data[slot1] then
		slot0.dic_letter_data[slot1] = nil;

		GlobalEvent:getInstance():Fire(HomepetEvent.HOME_PET_DELETE_LETTER_EVENT, slot1);
	end
end

function HomepetModel.getHomePetVo(slot0)
	if not slot0.homepet_vo then
		slot0.homepet_vo = HomepetVo.New();
	end

	do return slot0.homepet_vo end
end

function HomepetModel.checkTalkInfoBy(slot0, slot1)
	do return false end

	if not slot0:getHomePetVo() then
		do return true end
	end

	if slot1 == 1 then
		if Config.HomePetData.data_const.conversation_upper_limit and slot3.val <= slot2.day_talk then
			message(TI18N("萌宠也需要休息滴,明天再试吧~"));

			do return true end
		end
	elseif slot1 == 2 and Config.HomePetData.data_const.pocket_money_upper_limit and slot3.val <= slot2.day_feed then
		message(TI18N("萌宠也需要休息滴,明天再试吧~"));

		do return true end
	end

	do return false end
end

function HomepetModel.updateHomepetVoInfo(slot0, slot1)
	if slot1 then
		slot0:getHomePetVo():updateAttrData(slot1);
	end
end

function HomepetModel.updateEventInfo(slot0, slot1, slot2)
	if not slot1 then
		do return end
	end

	if slot2 then
		slot0.is_init_event = true;
	end

	if slot0.event_data_list and slot0.dic_event_data then
		for slot6, slot7 in ipairs(slot1.evt_list) do
			if not slot0.dic_event_data[slot7.evt_id] then
				slot7.config = Config.HomePetData.data_event_info[slot7.evt_sid];

				uv0(slot0.event_data_list, slot7);

				slot0.dic_event_data[slot7.evt_id] = slot7;
			end
		end

		uv1(slot0.event_data_list, function (slot0, slot1)
			do return slot0.evt_id < slot1.evt_id end
		end);
	end

	slot0:checkHomeWorldRedpoint();

	if slot0.is_init_event then
		GlobalEvent:getInstance():Fire(HomepetEvent.HOME_PET_CHECK_TRIGGER_EVENT);
	end
end

function HomepetModel.checkHomeWorldRedpoint(slot0)
	slot1 = false;

	for slot5, slot6 in pairs(slot0.event_data_list) do
		if slot6.evt_sid ~= 1 then
			slot1 = true;

			break
		end
	end

	HomeworldController:getInstance():getModel():updateHomeworldRedStatus(HomeworldConst.Red_Index.PetEvent, slot1);
end

function HomepetModel.getTravllingEventInfo(slot0)
	slot1 = {};

	for slot6 = #slot0.event_data_list, 1 do
		slot7 = slot0.event_data_list[slot6];
	end

	for slot6, slot7 in ipairs(slot0.event_data_list) do
		-- Nothing
	end
end

function HomepetModel.removeEventInfoByEvtID(slot0, slot1)
	if slot0.dic_event_data then
		slot0.dic_event_data[slot1] = nil;
	end

	if slot0.event_data_list then
		for slot5, slot6 in ipairs(slot0.event_data_list) do
			if slot6.evt_id == slot1 then
				uv0(slot0.event_data_list, slot5);

				break
			end
		end
	end
end

function HomepetModel.getEventDataByEvtId(slot0, slot1)
	if slot0.dic_event_data then
		do return slot0.dic_event_data[slot1] end
	end
end

function HomepetModel.checkNextEventData(slot0)
	if not slot0.is_init_event then
		do return end
	end

	slot0.cur_evt_id = 0;

	if slot0.event_data_list and #slot0.event_data_list > 0 then
		slot1 = false;

		if slot0.cur_evt_id == 0 then
			slot1 = true;
		end

		for slot5, slot6 in ipairs(slot0.event_data_list) do
			if not slot1 and slot0.cur_evt_id == slot6.evt_id then
				slot1 = true;
			elseif slot1 and slot6.config and slot6.config.is_notice == TRUE then
				slot0.cur_evt_id = slot6.evt_id;

				do return slot6 end
			end
		end
	end

	do return nil end
end

function HomepetModel.getCurrentEventData(slot0)
	if slot0.cur_evt_id == 0 then
		do return slot0:checkNextEventData() end
	else
		do return slot0:getEventDataByEvtId(slot0.cur_evt_id) end
	end
end

function HomepetModel.updateTravellingBagInfo(slot0, slot1)
	slot0:getHomePetVo():updateAttrData({
		set_item = slot1
	});
end

function HomepetModel.getHomepetResNameByQuality(slot0, slot1)
	if (slot1 or 0) <= BackPackConst.quality.green then
		do return "r" end
	elseif slot2 == BackPackConst.quality.blue then
		do return "sr" end
	elseif BackPackConst.quality.purple <= slot2 then
		do return "ssr" end
	end
end

function HomepetModel.updateHaveTreasureInfo(slot0, slot1)
	if slot0.dic_have_treasure_id then
		for slot5, slot6 in ipairs(slot1) do
			slot0.dic_have_treasure_id[slot6.id] = true;
		end
	end
end

function HomepetModel.updateHaveTreasureInfoById(slot0, slot1)
	if slot0.dic_have_treasure_id then
		slot0.dic_have_treasure_id[slot1] = true;
	end
end

function HomepetModel.__delete(slot0)
end
