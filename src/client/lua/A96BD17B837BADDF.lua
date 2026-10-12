ElfinController = ElfinController or BaseClass(BaseController)

function ElfinController.config(slot0)
	slot0.model = ElfinModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.elfin_awards = {}
end

function ElfinController.getModel(slot0)
	return slot0.model
end

function ElfinController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil
			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if not uv0.role_lev_event and uv0.role_vo then
				uv0.role_lev_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
					if slot0 == "vip_lev" then
						uv0.model:calculateElfinHatchLvupRedStatus()
					end
				end)
			end
		end)
	end

	if not slot0.goods_add_event then
		slot0.goods_add_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:checkNeedUpdateRedStatus(slot1)
		end)
	end

	if not slot0.goods_modify_event then
		slot0.goods_modify_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:checkNeedUpdateRedStatus(slot1)
		end)
	end

	if not slot0.goods_delete_event then
		slot0.goods_delete_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:checkNeedUpdateRedStatus(slot1)
		end)
	end
end

function ElfinController.registerProtocals(slot0)
	slot0:RegisterProtocal(26500, "handle26500")
	slot0:RegisterProtocal(26501, "handle26501")
	slot0:RegisterProtocal(26502, "handle26502")
	slot0:RegisterProtocal(26535, "handle26535")
	slot0:RegisterProtocal(26503, "handle26503")
	slot0:RegisterProtocal(26504, "handle26504")
	slot0:RegisterProtocal(26505, "handle26505")
	slot0:RegisterProtocal(26506, "handle26506")
	slot0:RegisterProtocal(26507, "handle26507")
	slot0:RegisterProtocal(26508, "handle26508")
	slot0:RegisterProtocal(26509, "handle26509")
	slot0:RegisterProtocal(26510, "handle26510")
	slot0:RegisterProtocal(26511, "handle26511")
	slot0:RegisterProtocal(26512, "handle26512")
	slot0:RegisterProtocal(26513, "handle26513")
	slot0:RegisterProtocal(26514, "handle26514")
	slot0:RegisterProtocal(26520, "handle26520")
	slot0:RegisterProtocal(26550, "handle26550")
	slot0:RegisterProtocal(26551, "handle26551")
	slot0:RegisterProtocal(26552, "handle26552")
	slot0:RegisterProtocal(26553, "handle26553")
	slot0:RegisterProtocal(26554, "handle26554")
	slot0:RegisterProtocal(26555, "handle26555")
	slot0:RegisterProtocal(26556, "handle26556")
	slot0:RegisterProtocal(26557, "handle26557")
	slot0:RegisterProtocal(26558, "handle26558")
	slot0:RegisterProtocal(26559, "handle26559")
	slot0:RegisterProtocal(26560, "handle26560")
	slot0:RegisterProtocal(26561, "handle26561")
	slot0:RegisterProtocal(26562, "handle26562")
	slot0:RegisterProtocal(26563, "handle26563")
	slot0:RegisterProtocal(26564, "handle26564")
end

function ElfinController.sender26500(slot0)
	slot0:SendProtocal(26500, {})
end

function ElfinController.handle26500(slot0, slot1)
	if slot1.sprite_hatchs then
		slot0.model:setElfinHatchList(slot1.sprite_hatchs)
		GlobalEvent:getInstance():Fire(ElfinEvent.Get_Elfin_Hatch_Data_Event)
	end

	if slot1.info then
		slot0.model:setElfinBuyInfo(slot1.info)
	end
end

function ElfinController.handle26501(slot0, slot1)
	if slot1.sprite_hatch then
		slot0.model:updateElfinHatchData(slot1.sprite_hatch)
	end
end

function ElfinController.sender26502(slot0, slot1)
	slot0:SendProtocal(26502, {
		id = slot1
	})
end

function ElfinController.handle26502(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.result == 1 then
		slot0.model:updateOneElfinHatchData({
			id = slot1.id,
			lev = slot1.lev
		})
		slot0:openElfinLvUpWindow(true, slot1.lev)
	end
end

function ElfinController.sender26503(slot0, slot1, slot2)
	slot0:SendProtocal(26503, {
		id = slot1,
		item_bid = slot2
	})
end

function ElfinController.handle26503(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end

function ElfinController.sender26504(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(26504, {
		id = slot1,
		item_bid = slot2,
		item_num = slot3,
		type = slot4 or 0
	})
end

function ElfinController.handle26504(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.result == 1 then
		GlobalEvent:getInstance():Fire(ElfinEvent.Use_Item_Hatch_Event, slot1.id)
	end
end

function ElfinController.sender26505(slot0, slot1)
	slot0:SendProtocal(26505, {
		id = slot1
	})
end

function ElfinController.handle26505(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.result == 1 and slot1.awards then
		table.insert(slot0.elfin_awards, slot1.awards)
		slot0:checkElfinGain()
	end
end

function ElfinController.sender26506(slot0, slot1)
	slot0:SendProtocal(26506, {
		id = slot1
	})
end

function ElfinController.handle26506(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.result == 1 and slot1.awards then
		table.insert(slot0.elfin_awards, slot1.awards)
		slot0:checkElfinGain()
	end
end

function ElfinController.sender26535(slot0, slot1)
	slot0:SendProtocal(26535, {
		id = slot1
	})
end

function ElfinController.handle26535(slot0, slot1)
	if slot1.flag == 1 then
		slot0:openElfinHatchUnlockPanel(false)
		slot0:openElfinLvUpWindow(true, slot1.id)
	end

	if slot1.msg then
		message(slot1.msg)
	end
end

function ElfinController.sender26507(slot0, slot1, slot2, slot3, slot4)
	if slot4 then
		slot0.hatch_egg_bid_flag = slot2
		slot0.hatch_id_flag = slot4
	end

	slot0:SendProtocal(26507, {
		type = slot1,
		item_id = slot2,
		num = slot3
	})
end

function ElfinController.handle26507(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.result == 1 and slot1.count and slot1.item_id then
		slot0.model:updateElfinBuyInfoByBid(slot1.item_id, slot1.count)
		GlobalEvent:getInstance():Fire(ElfinEvent.Buy_Elfin_Item_Success_Event, slot1.item_id)

		if slot0.hatch_id_flag and slot0.hatch_egg_bid_flag and slot0.hatch_egg_bid_flag == slot1.item_id then
			slot0:sender26503(slot0.hatch_id_flag, slot1.item_id)

			slot0.hatch_egg_bid_flag = nil
			slot0.hatch_id_flag = nil

			slot0:openElfSelectItemWindow(false)
		end
	end
end

function ElfinController.sender26508(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(26508, {
		item_bid = slot1,
		num = slot2,
		pos = slot3
	})
end

function ElfinController.handle26508(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.result == 1 then
		slot0:openElfinCompoundWindow(false)
		slot0:openElfinEggSyntheticPanel(false)
	end
end

function ElfinController.sender26509(slot0)
	slot0:SendProtocal(26509, {})
end

function ElfinController.handle26509(slot0, slot1)
	if slot1.awards then
		slot0.model:setActivatedElfinList(slot1.awards)
		GlobalEvent:getInstance():Fire(ElfinEvent.Get_Activated_Elfin_Event)
	end
end

function ElfinController.sender26510(slot0)
	slot0:SendProtocal(26510, {})
end

function ElfinController.handle26510(slot0, slot1)
	slot0.model:setElfinTreeData(slot1)
	GlobalEvent:getInstance():Fire(ElfinEvent.Get_Elfin_Tree_Data_Event)
end

function ElfinController.sender26511(slot0)
	slot0:SendProtocal(26511, {})
end

function ElfinController.handle26511(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.result == 1 then
		GlobalEvent:getInstance():Fire(ElfinEvent.Elfin_Tree_Lv_Up_Event)
	end
end

function ElfinController.sender26512(slot0)
	slot0:SendProtocal(26512, {})
end

function ElfinController.handle26512(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end

function ElfinController.sender26513(slot0, slot1, slot2)
	slot0:SendProtocal(26513, {
		pos = slot1,
		item_bid = slot2
	})
end

function ElfinController.handle26513(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.result == TRUE then
		slot0:updateEflinDrama()
	end
end

function ElfinController.sender26514(slot0, slot1, slot2)
	slot0:SendProtocal(26514, {
		sprites = slot1
	})

	if not slot2 then
		slot0.can_save_drama = true
	end
end

function ElfinController.handle26514(slot0, slot1)
	if slot0.can_save_drama then
		message(slot1.msg)
	end

	if slot1.result == TRUE and slot0.can_save_drama then
		slot0.can_save_drama = false

		slot0:updateEflinDrama()
	end
end

function ElfinController.updateEflinDrama(slot0)
	if slot0.model:getElfinTreeData() and slot1.sprites then
		slot0:send26560(PartnerConst.Fun_Form.Drama, slot1.sprites, 1, 1, true)
	end
end

function ElfinController.handle26520(slot0, slot1)
	if slot1.awards then
		slot0.model:calculateElfinActivateRedStatus(slot1.awards)
	end
end

function ElfinController.send26550(slot0)
	slot0:SendProtocal(26550, {})
end

function ElfinController.handle26550(slot0, slot1)
	if slot1 then
		slot0.model:setElfinSummonData(slot1)
		GlobalEvent:getInstance():Fire(ElfinEvent.Update_Elfin_Summon_Data_Event, slot1)
	end
end

function ElfinController.send26551(slot0, slot1, slot2, slot3)
	slot0.is_return_gain = slot3

	slot0:SendProtocal(26551, {
		times = slot1,
		recruit_type = slot2
	})
end

function ElfinController.handle26551(slot0, slot1)
	message(slot1.msg)
end

function ElfinController.send26552(slot0, slot1)
	slot0:SendProtocal(26552, {
		id = slot1
	})
end

function ElfinController.handle26552(slot0, slot1)
	message(slot1.msg)
end

function ElfinController.handle26553(slot0, slot1)
	TimesummonController:getInstance():openActionTimeElfinSummonGainWindow(false)
	TimesummonController:getInstance():openActionTimeElfinSummonGainWindow(true, slot1, TRUE, 2)
end

function ElfinController.send26554(slot0, slot1)
	slot0:SendProtocal(26554, {
		lucky_ids = slot1
	})
end

function ElfinController.handle26554(slot0, slot1)
	message(slot1.msg)
end

function ElfinController.send26555(slot0, slot1)
	slot0:SendProtocal(26555, {
		type = slot1
	})
end

function ElfinController.handle26555(slot0, slot1)
	GlobalEvent:getInstance():Fire(ElfinEvent.Elfin_Plan_From_Info_Event, slot1)
end

function ElfinController.send26556(slot0)
	slot0:SendProtocal(26556, {})
end

function ElfinController.handle26556(slot0, slot1)
	slot0.model:setPlanData(slot1)
	GlobalEvent:getInstance():Fire(ElfinEvent.Elfin_Plan_Info_Event, slot1)
end

function ElfinController.send26557(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(26557, {
		id = slot1,
		sprites = slot2,
		type = slot3,
		team = slot4 or 1
	})
end

function ElfinController.handle26557(slot0, slot1)
	message(slot1.msg)
end

function ElfinController.send26558(slot0, slot1, slot2)
	slot0:SendProtocal(26558, {
		id = slot1,
		name = slot2
	})
end

function ElfinController.handle26558(slot0, slot1)
	message(slot1.msg)
end

function ElfinController.handle26559(slot0, slot1)
	slot0.model:setPlanData({
		plan_list = {
			slot1
		}
	})
	GlobalEvent:getInstance():Fire(ElfinEvent.Elfin_Plan_Update_Event, slot1)
end

function ElfinController.send26560(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:SendProtocal(26560, {
		type = slot1,
		sprites = slot2,
		team = slot3 or 1,
		flag = slot4 or 1
	})

	if slot1 == PartnerConst.Fun_Form.Drama and not slot5 then
		slot0.sprites_26560 = slot2
	end
end

function ElfinController.handle26560(slot0, slot1)
	if slot1.type == PartnerConst.Fun_Form.Drama then
		if slot0.sprites_26560 then
			slot0:sender26514(slot0.sprites_26560, true)

			slot0.sprites_26560 = nil

			message(slot1.msg)
		end
	elseif slot0.sprites_26560 == nil then
		message(slot1.msg)
	end

	GlobalEvent:getInstance():Fire(ElfinEvent.Elfin_Plan_Save_From_Event, slot1)
end

function ElfinController.send26561(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(26561, {
		id = slot1,
		type = slot2,
		team = slot3 or 1
	})

	if slot2 == PartnerConst.Fun_Form.Drama and slot4 then
		slot0.sprites_26561 = slot4
	end
end

function ElfinController.handle26561(slot0, slot1)
	message(slot1.msg)

	if slot1.type == PartnerConst.Fun_Form.Drama and slot0.sprites_26561 then
		slot0:sender26514(slot0.sprites_26561, true)

		slot0.sprites_26561 = nil
	end

	GlobalEvent:getInstance():Fire(ElfinEvent.Elfin_Plan_Save_From_Event, slot1)
end

function ElfinController.send26562(slot0, slot1)
	slot0:SendProtocal(26562, {
		id = slot1
	})
end

function ElfinController.handle26562(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		GlobalEvent:getInstance():Fire(ElfinEvent.Elfin_Plan_Buy_Event, slot1)
	end
end

function ElfinController.send26563(slot0, slot1, slot2)
	slot0:SendProtocal(26563, {
		base_id = slot1,
		num = slot2
	})
end

function ElfinController.handle26563(slot0, slot1)
	GlobalEvent:getInstance():Fire(ElfinEvent.Elfin_Plan_Must_Tips_Event, slot1)
end

function ElfinController.send26564(slot0, slot1, slot2)
	slot0:SendProtocal(26564, {
		type = slot1,
		team_list = slot2
	})
end

function ElfinController.handle26564(slot0, slot1)
	message(slot1.msg)
end

function ElfinController.openElfinFightPlanPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.elfin_fight_plan_panel then
			slot0.elfin_fight_plan_panel = ElfinFightPlanPanel.New()
		end

		if slot0.elfin_fight_plan_panel:isOpen() == false then
			slot0.elfin_fight_plan_panel:open(slot2)
		end
	elseif slot0.elfin_fight_plan_panel then
		slot0.elfin_fight_plan_panel:close()

		slot0.elfin_fight_plan_panel = nil
	end
end

function ElfinController.openElfinFightPlanChooseTips(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.elfin_fight_plan_choose_tips then
			slot0.elfin_fight_plan_choose_tips = ElfinFightPlanChooseTips.New()
		end

		if slot0.elfin_fight_plan_choose_tips:isOpen() == false then
			slot0.elfin_fight_plan_choose_tips:open(slot2)
		end
	elseif slot0.elfin_fight_plan_choose_tips then
		slot0.elfin_fight_plan_choose_tips:close()

		slot0.elfin_fight_plan_choose_tips = nil
	end
end

function ElfinController.openElfinFightPlanSaveTips(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.elfin_fight_plan_save_tips then
			slot0.elfin_fight_plan_save_tips = ElfinFightPlanSaveTips.New()
		end

		if slot0.elfin_fight_plan_save_tips:isOpen() == false then
			slot0.elfin_fight_plan_save_tips:open(slot2)
		end
	elseif slot0.elfin_fight_plan_save_tips then
		slot0.elfin_fight_plan_save_tips:close()

		slot0.elfin_fight_plan_save_tips = nil
	end
end

function ElfinController.checkNeedUpdateRedStatus(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot2 = slot0.model:getElfinTreeCostBidList()
	slot3 = slot0.model:getElfinCompoundCostBidList()
	slot4 = false
	slot5 = false
	slot6 = false
	slot7 = false

	for slot11, slot12 in pairs(slot1) do
		if slot12.config then
			if BackPackConst.checkIsElfin(slot12.config.type) then
				slot5 = true
			end

			if BackPackConst.checkIsElfinEgg(slot12.config.type) then
				slot7 = true
			end

			if slot2 and next(slot2) ~= nil then
				for slot16, slot17 in pairs(slot2) do
					if slot17 == slot12.config.id then
						slot4 = true

						break
					end
				end
			end

			if slot3 and next(slot3) ~= nil then
				for slot16, slot17 in pairs(slot3) do
					if slot17 == slot12.config.id then
						slot6 = true

						break
					end
				end
			end
		end

		if slot4 and slot5 and slot6 and slot7 then
			break
		end
	end

	if slot4 then
		slot0.model:calculateTreeUplvRedStatus()
	end

	if slot5 then
		slot0.model:calculateTreePutElfinRedStatus()
		slot0.model:calculateElfinHigherRedStatus()
	end

	if slot6 then
		slot0.model:calculateElfinCompoundRedStatus()
	end

	if slot7 then
		slot0.model:calculateElfinHatchEggRedStatus()
	end
end

function ElfinController.openElfGainWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.elfin_gain_wnd then
			slot0.elfin_gain_wnd = ElfinGainWindow.New()
		end

		if slot0.elfin_gain_wnd:isOpen() == false then
			slot0.elfin_gain_wnd:open(slot2)
		end
	elseif slot0.elfin_gain_wnd then
		slot0.elfin_gain_wnd:close()

		slot0.elfin_gain_wnd = nil

		delayOnce(function ()
			uv0:checkElfinGain()
		end, 0.2)
	end
end

function ElfinController.openElfSelectItemWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.elfin_select_item_wnd then
			slot0.elfin_select_item_wnd = ElfinSelectItemWindow.New()
		end

		if slot0.elfin_select_item_wnd:isOpen() == false then
			slot0.elfin_select_item_wnd:open(slot2)
		end
	else
		if slot0.elfin_select_item_wnd then
			slot0.elfin_select_item_wnd:close()

			slot0.elfin_select_item_wnd = nil
		end

		slot0.hatch_egg_bid_flag = nil
		slot0.hatch_id_flag = nil
	end
end

function ElfinController.getElfinSelectRoot(slot0)
	if slot0.elfin_select_item_wnd then
		return slot0.elfin_select_item_wnd.root_wnd
	end
end

function ElfinController.checkElfinGain(slot0)
	if slot0.elfin_gain_wnd and slot0.elfin_gain_wnd:isOpen() == true then
		return
	end

	if slot0.elfin_awards and next(slot0.elfin_awards or {}) ~= nil and table.remove(slot0.elfin_awards, 1) then
		slot0:openElfGainWindow(true, slot1)
	end
end

function ElfinController.openElfinPrivilegeWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.elfin_privilege_wnd then
			slot0.elfin_privilege_wnd = ElfinPrivilegeWindow.New()
		end

		if slot0.elfin_privilege_wnd:isOpen() == false then
			slot0.elfin_privilege_wnd:open()
		end
	elseif slot0.elfin_privilege_wnd then
		slot0.elfin_privilege_wnd:close()

		slot0.elfin_privilege_wnd = nil
	end
end

function ElfinController.openElfinBookWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.elfin_book_wnd then
			slot0.elfin_book_wnd = ElfinBookWindow.New()
		end

		if slot0.elfin_book_wnd:isOpen() == false then
			slot0.elfin_book_wnd:open()
		end
	elseif slot0.elfin_book_wnd then
		slot0.elfin_book_wnd:close()

		slot0.elfin_book_wnd = nil
	end
end

function ElfinController.openElfinWishWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.elfin_wish_wnd then
			slot0.elfin_wish_wnd = ElfinWishWindow.New()
		end

		if slot0.elfin_wish_wnd:isOpen() == false then
			slot0.elfin_wish_wnd:open(slot2)
		end
	elseif slot0.elfin_wish_wnd then
		slot0.elfin_wish_wnd:close()

		slot0.elfin_wish_wnd = nil
	end
end

function ElfinController.openElfinEggSyntheticPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.elfin_egg_synthetic_wnd then
			slot0.elfin_egg_synthetic_wnd = ElfinEggSyntheticPanel.New()
		end

		if slot0.elfin_egg_synthetic_wnd:isOpen() == false then
			slot0.elfin_egg_synthetic_wnd:open(slot2)
		end
	elseif slot0.elfin_egg_synthetic_wnd then
		slot0.elfin_egg_synthetic_wnd:close()

		slot0.elfin_egg_synthetic_wnd = nil
	end
end

function ElfinController.openElfinHatchUnlockPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.elfin_hatch_unlock_wnd then
			slot0.elfin_hatch_unlock_wnd = ElfinHatchUnlockPanel.New()
		end

		if slot0.elfin_hatch_unlock_wnd:isOpen() == false then
			slot0.elfin_hatch_unlock_wnd:open(slot2)
		end
	elseif slot0.elfin_hatch_unlock_wnd then
		slot0.elfin_hatch_unlock_wnd:close()

		slot0.elfin_hatch_unlock_wnd = nil
	end
end

function ElfinController.openElfinInfoWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.elfin_info_wnd then
			slot0.elfin_info_wnd = ElfinInfoWindow.New()
		end

		if slot0.elfin_info_wnd:isOpen() == false then
			slot0.elfin_info_wnd:open(slot2)
		end
	else
		if slot0.elfin_info_wnd then
			slot0.elfin_info_wnd:close()

			slot0.elfin_info_wnd = nil
		end

		GlobalEvent:getInstance():Fire(ElfinEvent.Elfin_Check_Show_Tips_Event)
	end
end

function ElfinController.openElfinTreeStepWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.tree_step_wnd then
			slot0.tree_step_wnd = ElfinTreeStepWindow.New()
		end

		if slot0.tree_step_wnd:isOpen() == false then
			slot0.tree_step_wnd:open()
		end
	elseif slot0.tree_step_wnd then
		slot0.tree_step_wnd:close()

		slot0.tree_step_wnd = nil
	end
end

function ElfinController.openElfinTreeRouseWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.tree_rouse_wnd then
			slot0.tree_rouse_wnd = ElfinTreeRouseWindow.New()
		end

		if slot0.tree_rouse_wnd:isOpen() == false then
			slot0.tree_rouse_wnd:open(slot2, slot3)
		end
	elseif slot0.tree_rouse_wnd then
		slot0.tree_rouse_wnd:close()

		slot0.tree_rouse_wnd = nil
	end
end

function ElfinController.openElfinChooseWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.elfin_choose_wnd then
			slot0.elfin_choose_wnd = ElfinChooseWindow.New()
		end

		if slot0.elfin_choose_wnd:isOpen() == false then
			slot0.elfin_choose_wnd:open(slot2)
		end
	elseif slot0.elfin_choose_wnd then
		slot0.elfin_choose_wnd:close()

		slot0.elfin_choose_wnd = nil
	end
end

function ElfinController.openElfinCompoundWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.elfin_compound_wnd then
			slot0.elfin_compound_wnd = ElfinCompoundWindow.New()
		end

		if slot0.elfin_compound_wnd:isOpen() == false then
			slot0.elfin_compound_wnd:open(slot2, slot3)
		end
	elseif slot0.elfin_compound_wnd then
		slot0.elfin_compound_wnd:close()

		slot0.elfin_compound_wnd = nil
	end
end

function ElfinController.openElfinLvUpTipsWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.elfin_lv_tips_wnd then
			slot0.elfin_lv_tips_wnd = ElfinLvUpTipsWindow.New()
		end

		if slot0.elfin_lv_tips_wnd:isOpen() == false then
			slot0.elfin_lv_tips_wnd:open(slot2, slot3)
		end
	elseif slot0.elfin_lv_tips_wnd then
		slot0.elfin_lv_tips_wnd:close()

		slot0.elfin_lv_tips_wnd = nil
	end
end

function ElfinController.openElfinLvUpWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.elfin_lv_up_wnd then
			slot0.elfin_lv_up_wnd = ElfinLvUpWindow.New()
		end

		if slot0.elfin_lv_up_wnd:isOpen() == false then
			slot0.elfin_lv_up_wnd:open(slot2)
		end
	elseif slot0.elfin_lv_up_wnd then
		slot0.elfin_lv_up_wnd:close()

		slot0.elfin_lv_up_wnd = nil
	end
end

function ElfinController.openElfinAdjustWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.elfin_adjust_wnd then
			slot0.elfin_adjust_wnd = ElfinAdjustWindow.New()
		end

		if slot0.elfin_adjust_wnd:isOpen() == false then
			slot0.elfin_adjust_wnd:open(slot2)
		end
	elseif slot0.elfin_adjust_wnd then
		slot0.elfin_adjust_wnd:close()

		slot0.elfin_adjust_wnd = nil
	end
end

function ElfinController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
