PlanesController = PlanesController or BaseClass(BaseController)

function PlanesController.config(slot0)
	slot0.model = PlanesModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function PlanesController.getModel(slot0)
	return slot0.model
end

function PlanesController.registerEvents(slot0)
end

function PlanesController.registerProtocals(slot0)
	slot0:RegisterProtocal(23100, "handle23100")
	slot0:RegisterProtocal(23101, "handle23101")
	slot0:RegisterProtocal(23102, "handle23102")
	slot0:RegisterProtocal(23103, "handle23103")
	slot0:RegisterProtocal(23104, "handle23104")
	slot0:RegisterProtocal(23105, "handle23105")
	slot0:RegisterProtocal(23106, "handle23106")
	slot0:RegisterProtocal(23107, "handle23107")
	slot0:RegisterProtocal(23108, "handle23108")
	slot0:RegisterProtocal(23109, "handle23109")
	slot0:RegisterProtocal(23110, "handle23110")
	slot0:RegisterProtocal(23111, "handle23111")
	slot0:RegisterProtocal(23112, "handle23112")
	slot0:RegisterProtocal(23113, "handle23113")
	slot0:RegisterProtocal(23114, "handle23114")
	slot0:RegisterProtocal(23115, "handle23115")
	slot0:RegisterProtocal(23116, "handle23116")
	slot0:RegisterProtocal(23117, "handle23117")
	slot0:RegisterProtocal(23118, "handle23118")
	slot0:RegisterProtocal(23119, "handle23119")
	slot0:RegisterProtocal(23120, "handle23120")
	slot0:RegisterProtocal(23121, "handle23121")
	slot0:RegisterProtocal(23122, "handle23122")
end

function PlanesController.sender23100(slot0)
	slot0:SendProtocal(23100, {})
end

function PlanesController.handle23100(slot0, slot1)
	slot0.model:setCurDunId(slot1.dun_id)
	slot0.model:setCurDunProgressVal(slot1.val, slot1.max_val)
	slot0.model:setCanChoseDunList(slot1.ids)
	slot0.model:setGotFirstAwardDunList(slot1.reward_ids)
	slot0.model:setCanGetAwardDunList(slot1.can_reward_ids)
	slot0.model:setPlanesResetTime(slot1.update_time)
	slot0.model:setPlanesRoleLookId(slot1.look_id)
	slot0.model:setHolidayOpen(slot1.is_holiday)
	HomeworldController:getInstance():getModel():setMyCurHomeFigureId(slot1.look_id)
	HomeworldController:getInstance():getModel():setActivateFigureList(slot1.list, true)

	if slot1.dun_id == 0 and slot0.planes_map_wnd then
		slot0:openPlanesMapWindow(false)
	end

	GlobalEvent:getInstance():Fire(PlanesEvent.Update_Dun_Base_Event)
end

function PlanesController.handle23101(slot0, slot1)
	if slot1.floor then
		slot0.model:setCurPlanesFloor(slot1.floor)
	end

	if slot1.tile_list and next(slot1.tile_list) ~= nil then
		slot0.model:setPlanesEvtVoList(slot1.tile_list)
	end

	GlobalEvent:getInstance():Fire(PlanesEvent.Update_Map_Data_Event, slot1)
end

function PlanesController.handle23102(slot0, slot1)
	if slot1.floor ~= slot0.model:getCurPlanesFloor() then
		return
	end

	if slot1.tile_list and next(slot1.tile_list) ~= nil then
		slot0.model:updatePlanesEvtVoList(slot1.tile_list)
		GlobalEvent:getInstance():Fire(PlanesEvent.Update_Grid_Event, slot1.tile_list)
	end
end

function PlanesController.sender23103(slot0, slot1)
	slot0:SendProtocal(23103, {
		index = slot1
	})
end

function PlanesController.handle23103(slot0, slot1)
	if slot1.msg and slot1.msg ~= "" then
		message(slot1.msg)
	end

	GlobalEvent:getInstance():Fire(PlanesEvent.Update_Role_Grid_Event, slot1)
end

function PlanesController.sender23104(slot0, slot1, slot2, slot3, slot4)
	slot0.evt_extend = slot4

	if slot0.model:getPlanesEvtVoByGridIndex(({
		index = slot1 or slot0.evt_grid_index,
		action = slot2,
		ext_list = slot3 or {}
	}).index) and slot6.config and slot6.config.group_id ~= 0 and slot2 == 1 then
		if next(slot0.model:getPlanesSameGroupIndexList(slot6.config.group_id, slot5.index)) == nil then
			slot0:SendProtocal(23104, slot5)
		else
			slot8 = TI18N(string.format("若选择触发该事件后，附近命运台阶和其中的事件将消失，是否确定选择【%s】事件？", slot6.config.name))

			if slot0.confirm_alert then
				slot0.confirm_alert:close()

				slot0.confirm_alert = nil
			end

			slot0.confirm_alert = CommonAlert.show(slot8, TI18N("确认"), function ()
				if uv0.planes_map_wnd then
					uv0.planes_map_wnd:isLockPlanesMapScreen(true)
				end

				GlobalEvent:getInstance():Fire(PlanesEvent.Show_Break_Effect_Event, uv1)

				slot0 = 0.5

				if uv2 and uv2.config and uv2.config.type == PlanesConst.Evt_Type.Buff then
					slot0 = 0
				end

				delayOnce(function ()
					if uv0.planes_map_wnd then
						uv0.planes_map_wnd:isLockPlanesMapScreen(false)
					end

					uv0:SendProtocal(23104, uv1)
				end, slot0)
			end, TI18N("取消"), function ()
				if uv0.planes_map_wnd then
					uv0.planes_map_wnd:isLockPlanesMapScreen(false)
				end
			end)
		end

		return
	end

	slot0:SendProtocal(23104, slot5)
end

function PlanesController.handle23104(slot0, slot1)
	if slot1.msg and slot1.msg ~= "" then
		message(slot1.msg)
	end

	if slot1.code == TRUE and slot0.evt_extend and slot0.evt_extend.index == slot1.index then
		if slot0.evt_extend.buff_id and slot0.evt_extend.world_pos then
			GlobalEvent:getInstance():Fire(PlanesEvent.Chose_Buff_Event, slot0.evt_extend.buff_id, slot0.evt_extend.world_pos)
			slot0:openPlanesBuffChoseWindow(false)
		end

		slot0.evt_extend = nil
	end
end

function PlanesController.sender23105(slot0, slot1)
	slot2 = {
		id = slot1
	}

	if slot0.model:getCurDunId() == 0 then
		slot0.is_open_dun_flag = true
	else
		slot0.is_open_dun_flag = false
	end

	if slot0.planes_main_wnd then
		slot0.planes_main_wnd:onLockScreenCallBack(true)
	end

	slot0:SendProtocal(23105, slot2)
end

function PlanesController.handle23105(slot0, slot1)
	if slot1.msg and slot1.msg ~= "" then
		message(slot1.msg)
	end

	if slot1.flag == TRUE and slot1.id > 0 and slot1.floor > 0 then
		if slot0.is_open_dun_flag then
			GlobalEvent:getInstance():Fire(PlanesEvent.Dun_Open_Effect_Event, slot1)
		else
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.PlanesWar, {
				dun_id = slot1.id,
				floor = slot1.floor
			})

			if slot0.planes_main_wnd then
				slot0.planes_main_wnd:onLockScreenCallBack(false)
			end
		end
	end
end

function PlanesController.sender23106(slot0, slot1)
	slot0:SendProtocal(23106, {
		floor = slot1
	})
end

function PlanesController.handle23106(slot0, slot1)
	if slot1.msg and slot1.msg ~= "" then
		message(slot1.msg)
	end
end

function PlanesController.handle23107(slot0, slot1)
	if slot1.load_partner and next(slot1.load_partner) ~= nil then
		slot0:openPlanesHireHeroWindow(true, slot1.load_partner)
	end
end

function PlanesController.handle23108(slot0, slot1)
	if not slot0.model:getPlanesEvtVoByGridIndex(slot1.index) or not slot2.config then
		return
	end

	slot3 = nil
	slot4 = {}
	slot5 = {}
	slot6, slot7 = nil

	if slot1.ext_list and next(slot1.ext_list) ~= nil then
		for slot11, slot12 in pairs(slot1.ext_list) do
			if slot12.type == 5 then
				slot3 = slot12.val1
			elseif slot12.type == 6 then
				table.insert(slot4, slot12.val1)
			elseif slot12.type == 7 then
				table.insert(slot5, slot12.val1)
			elseif slot12.type == 8 then
				slot6 = slot12.val1
			elseif slot12.type == 9 then
				slot7 = slot12.val1
			end
		end
	end

	if slot2.config.type == PlanesConst.Evt_Type.Dialog and slot3 then
		if Config.SecretDunData.data_dialogue[slot3] then
			MonopolyController:getInstance():openMonopolyDialogWindow(true, 88, slot1.index, slot8)
		end
	elseif slot2.config.type == PlanesConst.Evt_Type.Board and slot6 then
		slot0:openPlanesBoardWindow(true, slot6)
	elseif slot2.config.type == PlanesConst.Evt_Type.Buff and next(slot5) ~= nil then
		slot0:openPlanesBuffChoseWindow(true, slot5, slot1.index)
	end

	if slot7 then
		MainuiController:getInstance():openGetItemView(true, {
			{
				num = 1,
				bid = slot7
			}
		}, 0, {
			is_backpack = true
		}, MainuiConst.item_open_type.normal)
	end
end

function PlanesController.handle23109(slot0, slot1)
	GlobalEvent:getInstance():Fire(PlanesEvent.Get_Master_Data_Event, slot1)
end

function PlanesController.handle23110(slot0, slot1)
	GuildbossController:getInstance():openGuildbossResultWindow(true, slot1, BattleConst.Fight_Type.PlanesWar)
end

function PlanesController.handle23111(slot0, slot1)
	if Config.SecretDunData.data_drama[slot1.id] then
		if slot0.planes_map_wnd then
			delayOnce(function ()
				MonopolyController:getInstance():openMonopolyDialogWindow(true, 89, 0, uv0)
			end, 0.5)
		else
			slot0.model:setPlanesDramIdCache(slot1.id)
		end
	end
end

function PlanesController.sender23112(slot0)
	slot0:SendProtocal(23112, {})
end

function PlanesController.handle23112(slot0, slot1)
	slot0.model:setPlanesBagData(slot1.secret_item)
end

function PlanesController.handle23113(slot0, slot1)
	slot0.model:updatePlanesBagData(slot1.update_item)
end

function PlanesController.handle23114(slot0, slot1)
	slot0.model:deletePlanesBagData(slot1.delete_pos)
end

function PlanesController.sender23115(slot0)
	slot0:SendProtocal(23115, {})
end

function PlanesController.handle23115(slot0, slot1)
	slot0.model:setAllPlanesHeroData(slot1.partners)
	GlobalEvent:getInstance():Fire(PlanesEvent.Get_All_Hero_Event)
end

function PlanesController.sender23116(slot0, slot1)
	slot0:SendProtocal(23116, {
		pos = slot1
	})
end

function PlanesController.handle23116(slot0, slot1)
	HeroController:getInstance():openHeroTipsPanel(true, slot1)
	GlobalEvent:getInstance():Fire(PlanesEvent.Look_Other_Hero_Event, slot1)
end

function PlanesController.sender23117(slot0, slot1)
	slot0:SendProtocal(23117, {
		dun_id = slot1
	})
end

function PlanesController.handle23117(slot0, slot1)
	if slot1.msg ~= "" then
		message(slot1.msg)
	end

	if slot1.flag == 1 and slot1.dun_id then
		slot0.model:addGotFirstAwardDunId(slot1.dun_id)
		GlobalEvent:getInstance():Fire(PlanesEvent.Get_First_Award_Event)
	end
end

function PlanesController.sender23118(slot0)
	slot0:SendProtocal(23118, {})
end

function PlanesController.handle23118(slot0, slot1)
	GlobalEvent:getInstance():Fire(PlanesEvent.Get_Buff_Data_Event, slot1.buffs)
end

function PlanesController.handle23119(slot0, slot1)
	if slot1.partners and next(slot1.partners) ~= nil then
		slot0.model:updateMyHeroData(slot1.partners)
	end
end

function PlanesController.sender23120(slot0, slot1)
	slot0:SendProtocal(23120, {
		partner_ids = slot1
	})
end

function PlanesController.handle23120(slot0, slot1)
	GlobalEvent:getInstance():Fire(PlanesEvent.Update_Form_Atk_Event, slot1.power)
end

function PlanesController.sender23121(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(23121, {
		formation_type = slot1,
		pos_info = slot2,
		hallows_id = slot3
	})
end

function PlanesController.handle23121(slot0, slot1)
	if slot1.msg ~= "" then
		message(slot1.msg)
	end

	if slot1.flag == 1 then
		GlobalEvent:getInstance():Fire(PlanesEvent.Save_Form_Success_Event)
	end
end

function PlanesController.sender23122(slot0)
	slot0:SendProtocal(23122, {})
end

function PlanesController.handle23122(slot0, slot1)
	GlobalEvent:getInstance():Fire(PlanesEvent.Get_Form_Data_Event, slot1)
end

function PlanesController.sender23123(slot0, slot1)
	slot0:SendProtocal(23123, {
		type = slot1
	})
end

function PlanesController.onHandlePlanesEvtById(slot0, slot1, slot2)
	slot0.evt_grid_index = slot2

	if slot1 == PlanesConst.Evt_Type.Normal then
		-- Nothing
	elseif slot1 == PlanesConst.Evt_Type.Monster then
		slot0:openPlanesMasterWindow(true, slot2)
	elseif slot1 == PlanesConst.Evt_Type.Guard then
		slot0:openPlanesMasterWindow(true, slot2)
	elseif slot1 == PlanesConst.Evt_Type.Box then
		slot0:sender23104(slot2, 1, {})
	elseif slot1 == PlanesConst.Evt_Type.Start then
		-- Nothing
	elseif slot1 == PlanesConst.Evt_Type.Board then
		slot0:sender23104(slot2, 0, {})
	elseif slot1 == PlanesConst.Evt_Type.Goods then
		slot0:sender23104(slot2, 1, {})
	elseif slot1 == PlanesConst.Evt_Type.Recover then
		slot0:openPlanesBoardWindow(true, PlanesConst.Recover_Id, slot2)
	elseif slot1 == PlanesConst.Evt_Type.Portal then
		CommonAlert.show(TI18N("是否通过传送门进入另一层？（进入后依然可通过传送门返回该层场景）"), TI18N("确认"), function ()
			uv0:sender23104(uv1, 1, {})
		end, TI18N("取消"))
	elseif slot1 == PlanesConst.Evt_Type.LeaseHero then
		slot0:sender23104(slot2, 0, {})
	elseif slot1 == PlanesConst.Evt_Type.Dialog then
		slot0:sender23104(slot2, 0, {})
	elseif slot1 == PlanesConst.Evt_Type.DesBarrier then
		slot0:openPlanesBoardWindow(true, PlanesConst.DesBarrier_Id, slot2)
	elseif slot1 == PlanesConst.Evt_Type.Switch then
		slot0:openPlanesBoardWindow(true, PlanesConst.Switch_Id, slot2)
	elseif slot1 == PlanesConst.Evt_Type.Stage then
		slot0:openPlanesBoardWindow(true, PlanesConst.Stage_Id, slot2)
	elseif slot1 == PlanesConst.Evt_Type.Barrier then
		message(TI18N("目标点为不可行走区域，请选择其他目标点"))
	elseif slot1 == PlanesConst.Evt_Type.Buff then
		slot0:sender23104(slot2, 0, {})
	elseif slot1 == PlanesConst.Evt_Type.Revive then
		slot0:openPlanesBoardWindow(true, PlanesConst.Revive_Id, slot2)
	end
end

function PlanesController.initiativeTriggerEvtByIndex(slot0, slot1)
	if not slot1 or slot1 == 0 or not slot0.planes_map_wnd then
		return
	end

	if slot0.model:getPlanesEvtVoByGridIndex(slot1) and slot2.config and slot2.config.type == PlanesConst.Evt_Type.Buff then
		slot0:onHandlePlanesEvtById(slot2.config.type, slot1)
	end
end

function PlanesController.checkPlanesIsOpen(slot0, slot1)
	if Config.SecretDunData.data_const.open_lev then
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

function PlanesController.openPlanesMainWindow(slot0, slot1)
	if slot1 == true then
		if not slot0:checkPlanesIsOpen() then
			return
		end

		if not slot0.planes_main_wnd then
			slot0.planes_main_wnd = PlanesMainWindow.New()
		end

		if slot0.planes_main_wnd:isOpen() == false then
			slot0.planes_main_wnd:open()
		end
	elseif slot0.planes_main_wnd then
		slot0.planes_main_wnd:close()

		slot0.planes_main_wnd = nil
	end
end

function PlanesController.getPlanesMainRoot(slot0)
	if slot0.planes_main_wnd then
		return slot0.planes_main_wnd.root_wnd
	end
end

function PlanesController.openPlanesMapWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.planes_map_wnd then
			slot0.planes_map_wnd = PlanesMapWindow.New()
		end

		if slot0.planes_map_wnd:isOpen() == false then
			slot0.planes_map_wnd:open(slot2)
		end
	elseif slot0.planes_map_wnd then
		slot0.planes_map_wnd:close()

		slot0.planes_map_wnd = nil
	end
end

function PlanesController.openPlanesBagPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.planes_bag_panel then
			slot0.planes_bag_panel = PlanesBagPanel.New()
		end

		if slot0.planes_bag_panel:isOpen() == false then
			slot0.planes_bag_panel:open(slot2)
		end
	elseif slot0.planes_bag_panel then
		slot0.planes_bag_panel:close()

		slot0.planes_bag_panel = nil
	end
end

function PlanesController.openPlanesHeroListPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.planes_hero_list_panel then
			slot0.planes_hero_list_panel = PlanesHeroListPanel.New()
		end

		if slot0.planes_hero_list_panel:isOpen() == false then
			slot0.planes_hero_list_panel:open(slot2)
		end
	elseif slot0.planes_hero_list_panel then
		slot0.planes_hero_list_panel:close()

		slot0.planes_hero_list_panel = nil
	end
end

function PlanesController.openPlanesBoardWindow(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if not slot0.planes_board_wnd then
			slot0.planes_board_wnd = PlanesBoardWindow.New()
		end

		if slot0.planes_board_wnd:isOpen() == false then
			slot0.planes_board_wnd:open(slot2, slot3, slot4)
		end
	elseif slot0.planes_board_wnd then
		slot0.planes_board_wnd:close()

		slot0.planes_board_wnd = nil
	end
end

function PlanesController.openPlanesMasterWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.master_info_wnd then
			slot0.master_info_wnd = PlanesMasterWindow.New()
		end

		if slot0.master_info_wnd:isOpen() == false then
			slot0.master_info_wnd:open(slot2)
		end
	elseif slot0.master_info_wnd then
		slot0.master_info_wnd:close()

		slot0.master_info_wnd = nil
	end
end

function PlanesController.openPlanesDunInfoWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.dun_info_wnd then
			slot0.dun_info_wnd = PlanesDunInfoWindow.New()
		end

		if slot0.dun_info_wnd:isOpen() == false then
			slot0.dun_info_wnd:open(slot2)
		end
	elseif slot0.dun_info_wnd then
		slot0.dun_info_wnd:close()

		slot0.dun_info_wnd = nil
	end
end

function PlanesController.getPlanesInfoRoot(slot0)
	if slot0.dun_info_wnd then
		return slot0.dun_info_wnd.root_wnd
	end
end

function PlanesController.openPlanesHireHeroWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.hire_hero_wnd then
			slot0.hire_hero_wnd = PlanesHireHeroWindow.New()
		end

		if slot0.hire_hero_wnd:isOpen() == false then
			slot0.hire_hero_wnd:open(slot2)
		end
	elseif slot0.hire_hero_wnd then
		slot0.hire_hero_wnd:close()

		slot0.hire_hero_wnd = nil
	end
end

function PlanesController.openPlanesBuffChoseWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.buff_chose_wnd then
			slot0.buff_chose_wnd = PlanesBuffChoseWindow.New()
		end

		if slot0.buff_chose_wnd:isOpen() == false then
			slot0.buff_chose_wnd:open(slot2, slot3)
		end
	elseif slot0.buff_chose_wnd then
		slot0.buff_chose_wnd:close()

		slot0.buff_chose_wnd = nil
	end
end

function PlanesController.openPlanesBuffListWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.buff_list_wnd then
			slot0.buff_list_wnd = PlanesBuffListWindow.New()
		end

		if slot0.buff_list_wnd:isOpen() == false then
			slot0.buff_list_wnd:open()
		end
	elseif slot0.buff_list_wnd then
		slot0.buff_list_wnd:close()

		slot0.buff_list_wnd = nil
	end
end

function PlanesController.openPlanesAwardInfoWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.award_info_wnd then
			slot0.award_info_wnd = PlanesAwardInfoWindow.New()
		end

		if slot0.award_info_wnd:isOpen() == false then
			slot0.award_info_wnd:open()
		end
	elseif slot0.award_info_wnd then
		slot0.award_info_wnd:close()

		slot0.award_info_wnd = nil
	end
end

function PlanesController.openPlanesFirstAwardWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.first_award_wnd then
			slot0.first_award_wnd = PlanesFirstAwardWindow.New()
		end

		if slot0.first_award_wnd:isOpen() == false then
			slot0.first_award_wnd:open()
		end
	elseif slot0.first_award_wnd then
		slot0.first_award_wnd:close()

		slot0.first_award_wnd = nil
	end
end

function PlanesController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
