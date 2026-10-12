HomepetController = HomepetController or BaseClass(BaseController)

function HomepetController.config(slot0)
	slot0.model = HomepetModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function HomepetController.getModel(slot0)
	return slot0.model
end

function HomepetController.registerEvents(slot0)
	slot0.home_pet_check_trigger = GlobalEvent:getInstance():Bind(HomepetEvent.HOME_PET_CHECK_TRIGGER_EVENT, function ()
		if uv0:checkCurrentWinStatus() then
			uv0:showNextEvent()
		end
	end)
	slot0.close_base_view_event = GlobalEvent:getInstance():Bind(EventId.CLOSE_BASE_VIEW, function (slot0)
		if uv0:checkCurrentWinStatus(slot0) then
			uv0:showNextEvent()
		end
	end)
end

HOME_PET_EVENT_IGNORE_KEY = {
	["homepet/home_pet_go_back_panel"] = true,
	["homepet/home_pet_reward_panel"] = true,
	["homepet/home_pet_event_info_panel"] = true,
	["homepet/home_pet_on_way_event_panel"] = true
}

function HomepetController.checkCurrentWinStatus(slot0, slot1)
	if BaseView.winMap[#BaseView.winMap] and not tolua.isnull(slot2.root_wnd) and slot2.cur_home_type and slot2.cur_home_type == HomeworldConst.Type.Myself then
		if slot1 and HOME_PET_EVENT_IGNORE_KEY[slot1.layout_name] then
			return false
		end

		return true
	end

	return false
end

function HomepetController.setWaitNextEvent(slot0, slot1)
	slot0.is_wait_event = slot1
end

function HomepetController.showNextEvent(slot0)
	if slot0.is_wait_event then
		return
	end

	if slot0.model:getCurrentEventData() and slot1.config then
		if slot1.evt_sid == 1 or slot1.evt_sid == 2 then
			slot0:openHomePetGoBackPanel(true, {
				event_data = slot1
			})
		else
			slot0:openHomePetOnWayEventPanel(true, {
				event_data = slot1
			})
		end
	end
end

function HomepetController.registerProtocals(slot0)
	slot0:RegisterProtocal(26100, "handle26100")
	slot0:RegisterProtocal(26101, "handle26101")
	slot0:RegisterProtocal(26102, "handle26102")
	slot0:RegisterProtocal(26103, "handle26103")
	slot0:RegisterProtocal(26104, "handle26104")
	slot0:RegisterProtocal(26105, "handle26105")
	slot0:RegisterProtocal(26108, "handle26108")
	slot0:RegisterProtocal(26106, "handle26106")
	slot0:RegisterProtocal(26107, "handle26107")
	slot0:RegisterProtocal(26109, "handle26109")
	slot0:RegisterProtocal(26110, "handle26110")
	slot0:RegisterProtocal(26111, "handle26111")
	slot0:RegisterProtocal(26112, "handle26112")
	slot0:RegisterProtocal(26113, "handle26113")
end

function HomepetController.sender26100(slot0)
	slot0:SendProtocal(26100, {})
end

function HomepetController.handle26100(slot0, slot1)
	slot0.model:updateHomepetVoInfo(slot1)
end

function HomepetController.sender26101(slot0)
	slot0:SendProtocal(26101, {})
end

function HomepetController.handle26101(slot0, slot1)
	slot0.model:updateHomepetVoInfo(slot1)
end

function HomepetController.sender26102(slot0, slot1)
	slot0:SendProtocal(26102, {
		name = slot1
	})
end

function HomepetController.handle26102(slot0, slot1)
	message(slot1.msg)
	slot0.model:updateHomepetVoInfo(slot1)

	if slot0.home_pet_base_info_panel then
		slot0.home_pet_base_info_panel:closeSetNameAlert()
	end
end

function HomepetController.sender26103(slot0, slot1)
	if slot0.model:checkTalkInfoBy(slot1) then
		return
	end

	slot0:SendProtocal(26103, {
		type = slot1
	})
end

function HomepetController.handle26103(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == 1 then
		slot0.model:updateHomepetVoInfo(slot1)
		slot0:openHomePetInteractionTipsPanel(true, {
			id = slot1.id
		})
	else
		GlobalEvent:getInstance():Fire(HomepetEvent.HOME_PET_TALK_EVENT, slot1)
	end
end

function HomepetController.sender26104(slot0)
	slot0:SendProtocal(26104, {})
end

function HomepetController.handle26104(slot0, slot1)
	slot0.model:updateHomepetVoInfo(slot1)
	slot0:openHomePetInteractionTipsPanel(false)
end

function HomepetController.sender26105(slot0)
	slot0:SendProtocal(26105, {})
end

function HomepetController.handle26105(slot0, slot1)
	slot0.model:updateEventInfo(slot1, true)
end

function HomepetController.handle26108(slot0, slot1)
	slot0.model:updateEventInfo(slot1)
	GlobalEvent:getInstance():Fire(HomepetEvent.HOME_PET_GO_OUT_NEW_EVENT, slot1)
end

function HomepetController.sender26106(slot0, slot1)
	slot0:SendProtocal(26106, {
		evt_id = slot1
	})
end

function HomepetController.handle26106(slot0, slot1)
	message(slot1.msg)
	slot0.model:removeEventInfoByEvtID(slot1.evt_id)
	slot0.model:checkNextEventData()
	GlobalEvent:getInstance():Fire(HomepetEvent.HOME_PET_CHECK_TRIGGER_EVENT)
end

function HomepetController.sender26107(slot0, slot1)
	slot0:SendProtocal(26107, {
		set_item = slot1
	})
end

function HomepetController.handle26107(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:updateTravellingBagInfo(slot1.set_item)
		GlobalEvent:getInstance():Fire(HomepetEvent.HOME_PET_TRAVELLING_BAG_UPDATE_EVENT)
	end
end

function HomepetController.sender26109(slot0)
	slot0:SendProtocal(26109, {})
end

function HomepetController.handle26109(slot0, slot1)
	GlobalEvent:getInstance():Fire(HomepetEvent.HOME_PET_THIS_TIME_ALL_EVENT, slot1)
end

function HomepetController.sender26110(slot0)
	slot0:SendProtocal(26110, {})
end

function HomepetController.handle26110(slot0, slot1)
	slot0.model:updateHaveTreasureInfo(slot1.list)
end

function HomepetController.sender26111(slot0, slot1)
	slot0:SendProtocal(26111, {
		type = slot1
	})
end

function HomepetController.handle26111(slot0, slot1)
	if slot1.type == BackPackConst.item_type.HOME_PET_PHOTO then
		slot0.model:updatePhotodData(slot1)
	else
		slot0.model:updateLetterdData(slot1)
	end
end

function HomepetController.handle26112(slot0, slot1)
	if slot1.type == BackPackConst.item_type.HOME_PET_PHOTO then
		slot0.model:updatePhotodData(slot1)
	else
		slot0.model:updateLetterdData(slot1)
	end
end

function HomepetController.sender26113(slot0, slot1, slot2)
	slot0:SendProtocal(26113, {
		type = slot1,
		id = slot2
	})
end

function HomepetController.handle26113(slot0, slot1)
	if slot1.type == BackPackConst.item_type.HOME_PET_PHOTO then
		slot0.model:deletePhotodData(slot1.id)
	else
		slot0.model:deleteLetterdData(slot1.id)
	end

	if slot0.home_pet_event_info_panel then
		slot0:openHomePetEventInfoPanel(false)
	end
end

function HomepetController.openHomePetInteractionTipsPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.home_pet_interaction_tips_panel ~= nil then
			slot0.home_pet_interaction_tips_panel:close()

			slot0.home_pet_interaction_tips_panel = nil
		end
	else
		if slot0.home_pet_interaction_tips_panel == nil then
			slot0.home_pet_interaction_tips_panel = HomePetInteractionTipsPanel.New()
		end

		slot0.home_pet_interaction_tips_panel:open(slot2)
	end
end

function HomepetController.openHomePetTravellingBagPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.home_pet_travelling_bag_panel ~= nil then
			slot0.home_pet_travelling_bag_panel:close()

			slot0.home_pet_travelling_bag_panel = nil
		end
	else
		if slot0.home_pet_travelling_bag_panel == nil then
			slot0.home_pet_travelling_bag_panel = HomePetTravellingBagPanel.New((slot2 or {}).show_type)
		end

		slot0.home_pet_travelling_bag_panel:open(slot2)
	end
end

function HomepetController.openHomePetItemBagPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.home_pet_item_bag_panel ~= nil then
			slot0.home_pet_item_bag_panel:close()

			slot0.home_pet_item_bag_panel = nil
		end
	else
		if slot0.home_pet_item_bag_panel == nil then
			slot0.home_pet_item_bag_panel = HomePetItemBagPanel.New()
		end

		slot0.home_pet_item_bag_panel:open(slot2)
	end
end

function HomepetController.openHomePetItemSellPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.home_pet_item_sell_panel ~= nil then
			slot0.home_pet_item_sell_panel:close()

			slot0.home_pet_item_sell_panel = nil
		end
	else
		if slot0.home_pet_item_sell_panel == nil then
			slot0.home_pet_item_sell_panel = HomePetItemSellPanel.New()
		end

		slot0.home_pet_item_sell_panel:open(slot2)
	end
end

function HomepetController.openHomePetGoBackPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.home_pet_to_back_panel ~= nil then
			slot0.home_pet_to_back_panel:close()

			slot0.home_pet_to_back_panel = nil
		end
	else
		slot0:setWaitNextEvent(true)

		if slot0.home_pet_to_back_panel == nil then
			slot0.home_pet_to_back_panel = HomePetGoBackPanel.New()
		end

		slot0.home_pet_to_back_panel:open(slot2)
	end
end

function HomepetController.openHomePetGooutProgressPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.home_pet_goout_progress_panel ~= nil then
			slot0.home_pet_goout_progress_panel:close()

			slot0.home_pet_goout_progress_panel = nil
		end
	else
		if slot0.home_pet_goout_progress_panel == nil then
			slot0.home_pet_goout_progress_panel = HomePetGooutProgressPanel.New((slot2 or {}).show_type)
		end

		slot0.home_pet_goout_progress_panel:open(slot2)
	end
end

function HomepetController.openHomePetBaseInfoPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.home_pet_base_info_panel ~= nil then
			slot0.home_pet_base_info_panel:close()

			slot0.home_pet_base_info_panel = nil
		end
	else
		if slot0.home_pet_base_info_panel == nil then
			slot0.home_pet_base_info_panel = HomePetBaseInfoPanel.New()
		end

		slot0.home_pet_base_info_panel:open(slot2)
	end
end

function HomepetController.openHomePetOnWayEventPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.home_pet_onway_event_panel ~= nil then
			slot0.home_pet_onway_event_panel:close()

			slot0.home_pet_onway_event_panel = nil
		end
	else
		slot0:setWaitNextEvent(true)

		if slot0.home_pet_onway_event_panel == nil then
			slot0.home_pet_onway_event_panel = HomePetOnWayEventPanel.New()
		end

		slot0.home_pet_onway_event_panel:open(slot2)
	end
end

function HomepetController.openHomePetEventInfoPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.home_pet_event_info_panel ~= nil then
			slot0.home_pet_event_info_panel:close()

			slot0.home_pet_event_info_panel = nil
		end
	else
		if slot0.home_pet_event_info_panel == nil then
			slot0.home_pet_event_info_panel = HomePetEventInfoPanel.New()
		end

		slot0.home_pet_event_info_panel:open(slot2)
	end
end

function HomepetController.openHomePetCollectionPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.home_pet_collection_panel ~= nil then
			slot0.home_pet_collection_panel:close()

			slot0.home_pet_collection_panel = nil
		end
	else
		if slot0.home_pet_collection_panel == nil then
			slot0.home_pet_collection_panel = HomePetCollectionPanel.New()
		end

		slot0.home_pet_collection_panel:open(slot2)
	end
end

function HomepetController.openHomePetTreasureInfoPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.home_pet_treasure_info_panel ~= nil then
			slot0.home_pet_treasure_info_panel:close()

			slot0.home_pet_treasure_info_panel = nil
		end
	else
		if slot0.home_pet_treasure_info_panel == nil then
			slot0.home_pet_treasure_info_panel = HomePetTreasureInfoPanel.New()
		end

		slot0.home_pet_treasure_info_panel:open(slot2)
	end
end

function HomepetController.openHomePetRewardPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.home_pet_reward_panel ~= nil then
			slot0.home_pet_reward_panel:close()

			slot0.home_pet_reward_panel = nil
		end
	else
		if slot0.home_pet_reward_panel == nil then
			slot0.home_pet_reward_panel = HomePetRewardPanel.New()
		end

		slot0.home_pet_reward_panel:open(slot2)
	end
end

function HomepetController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
