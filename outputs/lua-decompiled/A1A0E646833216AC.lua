PlanesafkController = PlanesafkController or BaseClass(BaseController)

function PlanesafkController.config(slot0)
	slot0.model = PlanesafkModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function PlanesafkController.getModel(slot0)
	return slot0.model
end

function PlanesafkController.registerEvents(slot0)
	if not slot0.close_item_event then
		slot0.close_item_event = GlobalEvent:getInstance():Bind(MainuiEvent.CLOSE_ITEM_VIEW, function (slot0)
			if uv0.model:getIsShowSearchFinish() then
				uv0.model:setIsShowSearchFinish(false)
				uv0:openPlanesafkResultPanel(true)
			end
		end)
	end
end

function PlanesafkController.registerProtocals(slot0)
	slot0:RegisterProtocal(28600, "handle28600")
	slot0:RegisterProtocal(28601, "handle28601")
	slot0:RegisterProtocal(28602, "handle28602")
	slot0:RegisterProtocal(28603, "handle28603")
	slot0:RegisterProtocal(28604, "handle28604")
	slot0:RegisterProtocal(28605, "handle28605")
	slot0:RegisterProtocal(28606, "handle28606")
	slot0:RegisterProtocal(28607, "handle28607")
	slot0:RegisterProtocal(28608, "handle28608")
	slot0:RegisterProtocal(28609, "handle28609")
	slot0:RegisterProtocal(28610, "handle28610")
	slot0:RegisterProtocal(28611, "handle28611")
	slot0:RegisterProtocal(28612, "handle28612")
	slot0:RegisterProtocal(28613, "handle28613")
	slot0:RegisterProtocal(28614, "handle28614")
	slot0:RegisterProtocal(28615, "handle28615")
	slot0:RegisterProtocal(28620, "handle28620")
	slot0:RegisterProtocal(28621, "handle28621")
	slot0:RegisterProtocal(28622, "handle28622")
	slot0:RegisterProtocal(28623, "handle28623")
	slot0:RegisterProtocal(28624, "handle28624")
	slot0:RegisterProtocal(28625, "handle28625")
	slot0:RegisterProtocal(28616, "handle28616")
	slot0:RegisterProtocal(28617, "handle28617")
	slot0:RegisterProtocal(28618, "handle28618")
	slot0:RegisterProtocal(28619, "handle28619")
	slot0:RegisterProtocal(28626, "handle28626")
end

function PlanesafkController.sender28626(slot0)
	slot0:SendProtocal(28626, {})
end

function PlanesafkController.handle28626(slot0)
end

function PlanesafkController.sender28600(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = {
		line = slot1,
		index = slot2,
		action = slot3,
		ext_list = slot4 or {}
	}
	slot0.evt_extend = slot5

	if slot6 then
		slot8 = 0.4

		if slot0.planesafk_main_window then
			if slot0.planesafk_main_window:updateScrollviewByIndex(slot1, slot2) then
				slot0.planesafk_main_window:isLockPlanesMapScreen(true)
			else
				slot8 = 0
			end
		end

		if slot8 == 0 then
			slot0:SendProtocal(28600, slot7)
		else
			delayOnce(function ()
				if uv0.planesafk_main_window then
					uv0.planesafk_main_window:isLockPlanesMapScreen(false)
				end

				uv0:SendProtocal(28600, uv1)
			end, slot8)
		end
	else
		slot0:SendProtocal(28600, slot7)
	end
end

function PlanesafkController.handle28600(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE and slot0.evt_extend and slot0.evt_extend.data and slot0.evt_extend.data.line == slot1.line and slot0.evt_extend.data.index == slot1.index then
		if slot0.evt_extend.buff_id and slot0.evt_extend.world_pos then
			GlobalEvent:getInstance():Fire(PlanesafkEvent.Chose_Buff_Event, slot0.evt_extend.buff_id, slot0.evt_extend.world_pos)
			slot0:openPlanesafkBuffChoseWindow(false)
		end

		slot0.evt_extend = nil
	end
end

function PlanesafkController.initiativeTriggerEvtByIndex(slot0, slot1, slot2)
	if not slot1 or slot1 == 0 then
		return
	end

	if not slot2 or slot2 == 0 then
		return
	end

	if not slot0.planesafk_main_window then
		return
	end

	if slot0:getMapEvtData(slot1, slot2) and slot3.evt_config and slot3.evt_config.type == PlanesafkConst.Evt_Type.Buff then
		slot0:onHandlePlanesEvtById(slot3.evt_config.type, {
			line = slot1,
			index = slot2
		})
	end
end

function PlanesafkController.onHandlePlanesEvtById(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	if slot1 == PlanesafkConst.Evt_Type.Normal then
		-- Nothing
	elseif slot1 == PlanesafkConst.Evt_Type.Monster then
		slot0:openPlanesafkMasterWindow(true, slot2)
	elseif slot1 == PlanesafkConst.Evt_Type.Guard then
		slot0:openPlanesafkMasterWindow(true, slot2)
	elseif slot1 == PlanesafkConst.Evt_Type.Recover then
		if slot0.model:getAllPlanesHeroData() ~= nil then
			if Config.PlanesData.data_const.cure_desc then
				-- Nothing
			else
				slot3.desc_1 = TI18N("浸泡泉水可使所有存活的英雄恢复<div fontcolor=289b14>30%</div>的生命值，泉水仅可使用一次。")
			end

			slot0:openPlanesafkBoardWindow(true, PlanesafkConst.Recover_Id, slot2, {
				board_cfg = {
					res_id = "board_img_7",
					title = "回复泉水",
					btn_str = "浸泡",
					desc_1 = slot4.desc
				}
			})
		end
	elseif slot1 == PlanesafkConst.Evt_Type.Revive then
		if slot0.model:getAllPlanesHeroData() ~= nil then
			if Config.PlanesData.data_const.reborn_desc then
				-- Nothing
			else
				slot3.desc_1 = TI18N("可以随机复活一位已阵亡的英雄并回复其<div fontcolor=289b14>70%</div>的生命值，若当前无阵亡英雄则回复生命值最低的一位英雄<div fontcolor=289b14>100%</div>的生命。")
			end

			slot0:openPlanesafkBoardWindow(true, PlanesafkConst.Revive_Id, slot2, {
				board_cfg = {
					res_id = "board_img_4",
					title = "复活十字架",
					btn_str = "复活",
					desc_1 = slot4.desc
				}
			})
		end
	elseif slot1 == PlanesafkConst.Evt_Type.LeaseHero then
		slot0:sender28600(slot2.line, slot2.index, 0, {})
	elseif slot1 == PlanesafkConst.Evt_Type.Buff then
		slot0:sender28600(slot2.line, slot2.index, 0, {})
	elseif slot1 == PlanesafkConst.Evt_Type.Businessman then
		slot0:sender28600(slot2.line, slot2.index, 0, {})
	elseif slot1 == PlanesafkConst.Evt_Type.Occurrence then
		-- Nothing
	end
end

function PlanesafkController.handle28614(slot0, slot1)
	if slot1.ext_list and next(slot1.ext_list) ~= nil then
		slot2 = {}

		for slot6, slot7 in pairs(slot1.ext_list) do
			if slot2[slot7.type] == nil then
				slot2[slot7.type] = {}
			end

			if slot7.type == 1 then
				if slot2[slot7.type].buff_bid_list == nil then
					slot2[slot7.type].buff_bid_list = {}
				end

				table.insert(slot2[slot7.type].buff_bid_list, slot7.val1)
			end
		end

		for slot6, slot7 in pairs(slot2) do
			if slot6 == 1 then
				slot0:openPlanesafkBuffChoseWindow(true, slot7.buff_bid_list, slot1)
			end
		end
	end
end

function PlanesafkController.sender28601(slot0)
	if not PlanesafkController:getInstance():checkPlanesIsOpen() then
		return
	end

	slot0:SendProtocal(28601, {})
end

function PlanesafkController.handle28601(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.PlanesWar)
	end
end

function PlanesafkController.sender28602(slot0)
	slot0:SendProtocal(28602, {})
end

function PlanesafkController.handle28602(slot0, slot1)
	slot0.model:setPlanesRoleLookId(slot1.look_id)
	slot0.model:setHolidayOpen(slot1.is_holiday)
	HomeworldController:getInstance():getModel():setMyCurHomeFigureId(slot1.look_id)
	HomeworldController:getInstance():getModel():setActivateFigureList(slot1.list, true)
	GlobalEvent:getInstance():Fire(PlanesafkEvent.Planesafk_Main_Base_Info_Event, slot1)
end

function PlanesafkController.sender28603(slot0)
	slot0:SendProtocal(28603, {})
end

function PlanesafkController.handle28603(slot0, slot1)
	if not slot0.is_first_open then
		slot0.is_first_open = true

		slot0.model:checkPlaneafkCanExploreRedPoint(slot1)
	end

	if slot1.floor == 0 then
		slot0:openPlanesafkOrderactionWindow(false)
		slot0:openPlanesafkEndWarnView(false)
		slot0:openBuyCardView(false)
		slot0:openPlanesafkBoardWindow(false)
		slot0:openPlanesafkChooseDifficultyPanel(false)
		slot0:openPlanesafkMasterWindow(false)
		slot0:openPlanesafkItemUsePanel(false)
		slot0:openPlanesafkHeroListPanel(false)
		slot0:openPlanesafkBuffChoseWindow(false)
		slot0:openPlanesafkBuffListPanel(false)
		slot0:openPlanesafkHireHeroWindow(false)
		slot0:openPlanesafkResultPanel(false)
		slot0:openPlanesafkMainWindow(false)

		return
	end

	if slot1.floor == 1 then
		slot0.model:setIsShowSearchFinish(false)
	end

	slot0.model:setMapData(slot1)
	slot0.model:updateRolePos(slot1)
	GlobalEvent:getInstance():Fire(PlanesafkEvent.Planesafk_Main_Map_Info_Event, slot1)
end

function PlanesafkController.handle28624(slot0, slot1)
	GlobalEvent:getInstance():Fire(PlanesafkEvent.Planesafk_Last_Reward_Info_Event, slot1)
end

function PlanesafkController.sender28625(slot0)
	slot0:SendProtocal(28625, {})
end

function PlanesafkController.handle28625(slot0, slot1)
	GlobalEvent:getInstance():Fire(PlanesafkEvent.Planesafk_Update_Get_Reward_Event, slot1)
end

function PlanesafkController.sender28604(slot0, slot1, slot2)
	slot0:SendProtocal(28604, {
		floor = slot1,
		difficulty = slot2
	})
end

function PlanesafkController.handle28604(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		GlobalEvent:getInstance():Fire(PlanesafkEvent.Planesafk_Next_Map_Info_Event, slot1)
	end
end

function PlanesafkController.sender28605(slot0, slot1)
	slot0:SendProtocal(28605, {
		floor = slot1
	})
end

function PlanesafkController.handle28605(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		GlobalEvent:getInstance():Fire(PlanesafkEvent.Planesafk_Pass_Reward_Info_Event, slot1)
	end
end

function PlanesafkController.handle28606(slot0, slot1)
	slot0.model:updateRolePos(slot1)
	GlobalEvent:getInstance():Fire(PlanesafkEvent.Planesafk_Update_Map_Info_Event, slot1)
end

function PlanesafkController.handle28607(slot0, slot1)
	GlobalEvent:getInstance():Fire(PlanesafkEvent.Get_Master_Data_Event, slot1)
end

function PlanesafkController.handle28608(slot0, slot1)
	BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.PlanesWar, slot1)
end

function PlanesafkController.handle28609(slot0, slot1)
	if slot1.partners and next(slot1.partners) ~= nil then
		slot0.model:updateMyHeroData(slot1.partners)
	end
end

function PlanesafkController.sender28610(slot0, slot1)
	slot0:SendProtocal(28610, {
		partner_ids = slot1
	})
end

function PlanesafkController.handle28610(slot0, slot1)
	GlobalEvent:getInstance():Fire(PlanesafkEvent.Update_Form_Atk_Event, slot1.power)
end

function PlanesafkController.sender28611(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(28611, {
		formation_type = slot1,
		pos_info = slot2,
		hallows_id = slot3
	})
end

function PlanesafkController.handle28611(slot0, slot1)
	if slot1.msg ~= "" then
		message(slot1.msg)
	end

	if slot1.flag == 1 then
		GlobalEvent:getInstance():Fire(PlanesafkEvent.Save_Form_Success_Event)
	end
end

function PlanesafkController.sender28612(slot0)
	slot0:SendProtocal(28612, {})
end

function PlanesafkController.handle28612(slot0, slot1)
	GlobalEvent:getInstance():Fire(PlanesafkEvent.Get_Form_Data_Event, slot1)
end

function PlanesafkController.sender28613(slot0)
	slot0:SendProtocal(28613, {})
end

function PlanesafkController.handle28613(slot0, slot1)
	slot0.model:setAllPlanesHeroData(slot1.partners)
	GlobalEvent:getInstance():Fire(PlanesafkEvent.Get_All_Hero_Event)
end

function PlanesafkController.handle28615(slot0, slot1)
end

function PlanesafkController.sender28620(slot0)
	slot0:SendProtocal(28620, {})
end

function PlanesafkController.handle28620(slot0, slot1)
	GlobalEvent:getInstance():Fire(PlanesafkEvent.Get_Buff_Data_Event, slot1.buffs)
end

function PlanesafkController.handle28621(slot0, slot1)
	if slot0.planesafk_evt_shop_panel then
		GlobalEvent:getInstance():Fire(PlanesafkEvent.Evt_Shop_Event, slot1)
	else
		slot0:openPlanesafkEvtShopPanel(true, slot1)
	end
end

function PlanesafkController.handle28622(slot0, slot1)
	slot0:openPlanesafkHireHeroWindow(true, slot1)
end

function PlanesafkController.sender28623(slot0, slot1)
	slot0:SendProtocal(28623, {
		pos = slot1
	})
end

function PlanesafkController.handle28623(slot0, slot1)
	HeroController:getInstance():openHeroTipsPanel(true, slot1)
	GlobalEvent:getInstance():Fire(PlanesafkEvent.Look_Other_Hero_Event, slot1)
end

function PlanesafkController.openPlanesafkHireHeroWindow(slot0, slot1, slot2)
	if not slot0.planesafk_main_window then
		return
	end

	if slot1 == true then
		if not slot0.hire_hero_wnd then
			slot0.hire_hero_wnd = PlanesafkHireHeroWindow.New()
		end

		if slot0.hire_hero_wnd:isOpen() == false then
			slot0.hire_hero_wnd:open(slot2)
		end
	elseif slot0.hire_hero_wnd then
		slot0.hire_hero_wnd:close()

		slot0.hire_hero_wnd = nil
	end
end

function PlanesafkController.getMapEvtData(slot0, slot1, slot2)
	if slot0.planesafk_main_window then
		return slot0.planesafk_main_window:getMapEvtData(slot1, slot2)
	end
end

function PlanesafkController.openPlanesafkMainWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.planesafk_main_window then
			slot0.planesafk_main_window = PlanesafkMainWindow.New()
		end

		if slot0.planesafk_main_window:isOpen() == false then
			slot0.planesafk_main_window:open(slot2)
		end
	elseif slot0.planesafk_main_window then
		slot0.planesafk_main_window:close()

		slot0.planesafk_main_window = nil
	end
end

function PlanesafkController.openPlanesafkBuffListPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.planesafk_buff_list_panel then
			slot0.planesafk_buff_list_panel = PlanesafkBuffListPanel.New()
		end

		if slot0.planesafk_buff_list_panel:isOpen() == false then
			slot0.planesafk_buff_list_panel:open(slot2)
		end
	elseif slot0.planesafk_buff_list_panel then
		slot0.planesafk_buff_list_panel:close()

		slot0.planesafk_buff_list_panel = nil
	end
end

function PlanesafkController.openPlanesafkBuffChoseWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.buff_chose_wnd then
			slot0.buff_chose_wnd = PlanesafkBuffChoseWindow.New()
		end

		if slot0.buff_chose_wnd:isOpen() == false then
			slot0.buff_chose_wnd:open(slot2, slot3)
		end
	elseif slot0.buff_chose_wnd then
		slot0.buff_chose_wnd:close()

		slot0.buff_chose_wnd = nil
	end
end

function PlanesafkController.openPlanesafkHeroListPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.planesafk_hero_list_panel then
			slot0.planesafk_hero_list_panel = PlanesafkHeroListPanel.New()
		end

		if slot0.planesafk_hero_list_panel:isOpen() == false then
			slot0.planesafk_hero_list_panel:open(slot2)
		end
	elseif slot0.planesafk_hero_list_panel then
		slot0.planesafk_hero_list_panel:close()

		slot0.planesafk_hero_list_panel = nil
	end
end

function PlanesafkController.openPlanesafkItemUsePanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.planesafk_item_use_panel then
			slot0.planesafk_item_use_panel = PlanesafkItemUsePanel.New()
		end

		if slot0.planesafk_item_use_panel:isOpen() == false then
			slot0.planesafk_item_use_panel:open(slot2)
		end
	elseif slot0.planesafk_item_use_panel then
		slot0.planesafk_item_use_panel:close()

		slot0.planesafk_item_use_panel = nil
	end
end

function PlanesafkController.openPlanesafkChooseDifficultyPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.planesafk_choose_difficulty_panel then
			slot0.planesafk_choose_difficulty_panel = PlanesafkChooseDifficultyPanel.New()
		end

		if slot0.planesafk_choose_difficulty_panel:isOpen() == false then
			slot0.planesafk_choose_difficulty_panel:open(slot2)
		end
	elseif slot0.planesafk_choose_difficulty_panel then
		slot0.planesafk_choose_difficulty_panel:close()

		slot0.planesafk_choose_difficulty_panel = nil
	end
end

function PlanesafkController.openPlanesafkEvtShopPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.planesafk_main_window then
			return
		end

		if not slot0.planesafk_evt_shop_panel then
			slot0.planesafk_evt_shop_panel = PlanesafkEvtShopPanel.New()
		end

		if slot0.planesafk_evt_shop_panel:isOpen() == false then
			slot0.planesafk_evt_shop_panel:open(slot2)
		end
	elseif slot0.planesafk_evt_shop_panel then
		slot0.planesafk_evt_shop_panel:close()

		slot0.planesafk_evt_shop_panel = nil
	end
end

function PlanesafkController.openPlanesafkEvtOccurrencePanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.planesafk_evt_occurrence_panel then
			slot0.planesafk_evt_occurrence_panel = PlanesafkEvtOccurrencePanel.New()
		end

		if slot0.planesafk_evt_occurrence_panel:isOpen() == false then
			slot0.planesafk_evt_occurrence_panel:open(slot2)
		end
	elseif slot0.planesafk_evt_occurrence_panel then
		slot0.planesafk_evt_occurrence_panel:close()

		slot0.planesafk_evt_occurrence_panel = nil
	end
end

function PlanesafkController.openPlanesafkMasterWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.master_info_wnd then
			slot0.master_info_wnd = PlanesafkMasterWindow.New()
		end

		if slot0.master_info_wnd:isOpen() == false then
			slot0.master_info_wnd:open(slot2)
		end
	elseif slot0.master_info_wnd then
		slot0.master_info_wnd:close()

		slot0.master_info_wnd = nil
	end
end

function PlanesafkController.openPlanesafkBoardWindow(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if not slot0.planes_board_wnd then
			slot0.planes_board_wnd = PlanesafkBoardWindow.New()
		end

		if slot0.planes_board_wnd:isOpen() == false then
			slot0.planes_board_wnd:open(slot2, slot3, slot4)
		end
	elseif slot0.planes_board_wnd then
		slot0.planes_board_wnd:close()

		slot0.planes_board_wnd = nil
	end
end

function PlanesafkController.openPlanesafkResultPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.planesafk_result_panel then
			slot0.planesafk_result_panel = PlanesafkResultPanel.New()
		end

		if slot0.planesafk_result_panel:isOpen() == false then
			slot0.planesafk_result_panel:open(id, slot2)
		end
	elseif slot0.planesafk_result_panel then
		slot0.planesafk_result_panel:close()

		slot0.planesafk_result_panel = nil
	end
end

function PlanesafkController.sender28616(slot0)
	slot0:SendProtocal(28616, {})
end

function PlanesafkController.handle28616(slot0, slot1)
	slot0.model:setOrderactionData(slot1)
	slot0.model:checkPlanesafkRedPoint()
	GlobalEvent:getInstance():Fire(PlanesafkEvent.Planesafk_OrderAction_Init_Event, slot1)
end

function PlanesafkController.sender28617(slot0, slot1)
	slot0:SendProtocal(28617, {
		id = slot1
	})
end

function PlanesafkController.handle28617(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function PlanesafkController.sender28618(slot0)
	slot0:SendProtocal(28618, {})
end

function PlanesafkController.handle28618(slot0, slot1)
	if slot1 then
		slot0.model:setOrderactionRedStatus(slot1.flag)
		slot0.model:checkPlanesafkRedPoint()
	end

	GlobalEvent:getInstance():Fire(PlanesafkEvent.Planesafk_OrderAction_First_Red_Event)
end

function PlanesafkController.sender28619(slot0)
	slot0:SendProtocal(28619, {})
end

function PlanesafkController.handle28619(slot0, slot1)
	GlobalEvent:getInstance():Fire(PlanesafkEvent.Planesafk_OrderAction_IsPopWarn_Event, slot1)
end

function PlanesafkController.openPlanesafkOrderactionWindow(slot0, slot1)
	if slot1 == true then
		slot2 = Config.PlanesWarOrderData.data_constant.limit_lev
		slot5 = RoleController:getInstance():getModel():getRoleVo()

		if Config.PlanesWarOrderData.data_constant.open_srv_day and slot2 and slot5 and (RoleController:getInstance():getModel():getOpenSrvDay() < slot3.val or slot5.lev < slot2.val) then
			message(string.format(TI18N("角色%d级且开服%d天开启"), slot2.val, slot3.val))

			return
		end

		if not slot0.planesafk_orderaction_window then
			slot0.planesafk_orderaction_window = PlanesafkOrderactionWindow.New()
		end

		slot0.planesafk_orderaction_window:open()
	elseif slot0.planesafk_orderaction_window then
		slot0.planesafk_orderaction_window:close()

		slot0.planesafk_orderaction_window = nil
	end
end

function PlanesafkController.openBuyCardView(slot0, slot1)
	if slot1 == true then
		if not slot0.buy_card_view then
			slot0.buy_card_view = PlanesafkOrderactionUntieRewardWindow.New()
		end

		slot0.buy_card_view:open()
	elseif slot0.buy_card_view then
		slot0.buy_card_view:close()

		slot0.buy_card_view = nil
	end
end

function PlanesafkController.openPlanesafkEndWarnView(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.end_warn_view then
			slot0.end_warn_view = PlanesafkOrderActionEndWarnWindow.New()
		end

		slot0.end_warn_view:open(slot2)
	elseif slot0.end_warn_view then
		slot0.end_warn_view:close()

		slot0.end_warn_view = nil
	end
end

function PlanesafkController.checkPlanesIsOpen(slot0, slot1)
	if Config.PlanesData.data_const.planes_open_lev then
		if slot3.val <= RoleController:getInstance():getRoleVo().lev then
			return true
		else
			if not slot1 then
				message(slot3.desc)
			end

			return false
		end
	else
		return false
	end
end

function PlanesafkController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
