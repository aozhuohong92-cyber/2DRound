HomeworldController = HomeworldController or BaseClass(BaseController)

function HomeworldController.config(slot0)
	slot0.model = HomeworldModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function HomeworldController.getModel(slot0)
	return slot0.model
end

function HomeworldController.registerEvents(slot0)
end

function HomeworldController.registerProtocals(slot0)
	slot0:RegisterProtocal(26001, "handle26001")
	slot0:RegisterProtocal(26002, "handle26002")
	slot0:RegisterProtocal(26003, "handle26003")
	slot0:RegisterProtocal(26004, "handle26004")
	slot0:RegisterProtocal(26005, "handle26005")
	slot0:RegisterProtocal(26006, "handle26006")
	slot0:RegisterProtocal(26007, "handle26007")
	slot0:RegisterProtocal(26008, "handle26008")
	slot0:RegisterProtocal(26009, "handle26009")
	slot0:RegisterProtocal(26010, "handle26010")
	slot0:RegisterProtocal(26011, "handle26011")
	slot0:RegisterProtocal(26012, "handle26012")
	slot0:RegisterProtocal(26013, "handle26013")
	slot0:RegisterProtocal(26014, "handle26014")
	slot0:RegisterProtocal(26015, "handle26015")
	slot0:RegisterProtocal(26016, "handle26016")
	slot0:RegisterProtocal(26017, "handle26017")
	slot0:RegisterProtocal(26018, "handle26018")
	slot0:RegisterProtocal(26019, "handle26019")
	slot0:RegisterProtocal(26020, "handle26020")
	slot0:RegisterProtocal(26021, "handle26021")
end

function HomeworldController.sender26001(slot0, slot1)
	slot0:SendProtocal(26001, {
		floor = slot1 or 0
	})
end

function HomeworldController.handle26001(slot0, slot1)
	if slot1.name then
		slot0.model:setMyHomeName(slot1.name)
	end

	if slot1.soft then
		slot0.model:setHomeComfortValue(slot1.soft)
	end

	if slot1.worship then
		slot0.model:setHomeWorship(slot1.worship)
	end

	if slot1.rest_worship then
		slot0.model:setLeftWorshipNum(slot1.rest_worship)
	end

	if slot1.acc_hook_time then
		slot0.model:setHomeAccHookTime(slot1.acc_hook_time)
	end

	if slot1.wall_bid then
		slot0.model:setMyHomeWallId(slot1.wall_bid)
	end

	if slot1.land_bid then
		slot0.model:setMyHomeFloorId(slot1.land_bid)
	end

	if slot1.list then
		slot0.model:setMyHomeFurnitureData(slot1.list)
	end

	if slot1.visitors then
		slot0.model:setMyHomeVisitorsData(slot1.visitors)
	end

	if slot1.floor then
		slot0.model:setMyHomeCurStoreyIndex(slot1.floor, slot1.max_soft_floor)
	end

	if slot1.main_floor then
		slot0.model:setMyHomeMainStoreyIndex(slot1.main_floor)
	end

	if slot1.max_all_soft then
		slot0.model:setMaxAllSoftValue(slot1.max_all_soft)
	end

	if slot1.other_bid then
		slot0.model:setOtherStoreyFurnitureData(slot1.other_bid)
	end

	if slot1.max_floor_soft then
		slot0.model:setMyHomeMaxStoreySoft(slot1.max_floor_soft)
	end

	GlobalEvent:getInstance():Fire(HomeworldEvent.Get_My_Home_Data_Event)
end

function HomeworldController.sender26002(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(26002, {
		wall_bid = slot1,
		land_bid = slot2,
		list = slot3,
		floor = slot4
	})
end

function HomeworldController.handle26002(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.code == 1 then
		if slot1.soft then
			slot0.model:setHomeComfortValue(slot1.soft)
		end

		if slot1.wall_bid then
			slot0.model:setMyHomeWallId(slot1.wall_bid)
		end

		if slot1.land_bid then
			slot0.model:setMyHomeFloorId(slot1.land_bid)
		end

		if slot1.list then
			slot0.model:setMyHomeFurnitureData(slot1.list)
		end

		if slot0.model:checkMaxStoreyIsChange(slot1.max_soft_floor) then
			CommonAlert.show(string.format(TI18N("当前舒适度最高楼层为%d楼"), slot1.max_soft_floor), TI18N("确定"), nil, , , , , {
				extend_offy = -5,
				off_y = 43,
				title = TI18N("提示"),
				extend_str = TI18N("家园币的产出仅由舒适度最高的楼层决定"),
				extend_aligment = cc.TEXT_ALIGNMENT_CENTER
			})
		end

		if slot1.floor then
			slot0.model:setMyHomeCurStoreyIndex(slot1.floor, slot1.max_soft_floor)
		end

		if slot1.max_all_soft then
			slot0.model:setMaxAllSoftValue(slot1.max_all_soft)
		end

		if slot1.other_bid then
			slot0.model:setOtherStoreyFurnitureData(slot1.other_bid)
		end

		if slot1.max_floor_soft then
			slot0.model:setMyHomeMaxStoreySoft(slot1.max_floor_soft)
		end

		GlobalEvent:getInstance():Fire(HomeworldEvent.Update_Some_Data_Event)
	else
		GlobalEvent:getInstance():Fire(HomeworldEvent.Get_My_Home_Data_Event)
	end
end

function HomeworldController.sender26003(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(26003, {
		rid = slot1,
		srv_id = slot2,
		floor = slot3 or 0
	})
end

function HomeworldController.handle26003(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.code == 1 then
		if slot0.homeworld_scene then
			slot0.homeworld_scene:goToOtherPlayerHome(slot1)
		else
			slot0:openHomeworldScene(true, slot1)
		end
	end
end

function HomeworldController.sender26004(slot0)
	slot0:SendProtocal(26004, {})
end

function HomeworldController.handle26004(slot0, slot1)
	if slot1.is_finish == 1 then
		if slot1.use_id == 0 then
			slot0:openHomeworldFigureChoseWindow(true)
		else
			slot0.model:setMyCurHomeFigureId(slot1.use_id or 0)

			if slot0.open_my_home_flag then
				slot0.open_my_home_flag = false

				slot0:openHomeworldScene(true)
			elseif slot0.back_my_home_flag then
				slot0.back_my_home_flag = false

				if slot0.homeworld_scene then
					slot0.homeworld_scene:backToMyHomeworld()
				else
					slot0:openHomeworldScene(true)
				end
			end
		end

		slot0.model:setMaxComfortValue(slot1.max_soft or 0)
		slot0.model:setActivateFigureList(slot1.list or {})
	elseif not slot0.is_show_goto then
		slot0.is_show_goto = true

		CommonAlert.show(TI18N("前往【<div fontColor=#289b14 fontsize= 26>日常任务-进阶历练</div>】领取神秘奖励可开启家园，是否立即前往领取？"), TI18N("前往"), function ()
			uv0.is_show_goto = false

			TaskController:getInstance():openTaskMainWindow(true, TaskConst.type.exp)
		end, TI18N("取消"), function ()
			uv0.is_show_goto = false
		end, CommonAlert.type.rich, nil, {
			view_tag = ViewMgrTag.RECONNECT_TAG
		})
	end
end

function HomeworldController.sender26005(slot0, slot1)
	slot0:SendProtocal(26005, {
		id = slot1
	})
end

function HomeworldController.handle26005(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.code == 1 and slot1.id then
		slot0.model:setMyCurHomeFigureId(slot1.id)
		GlobalEvent:getInstance():Fire(HomeworldEvent.Update_My_Home_Figure_Event)
	end
end

function HomeworldController.sender26006(slot0, slot1)
	slot0:SendProtocal(26006, {
		id = slot1
	})
end

function HomeworldController.handle26006(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.code == 1 then
		slot0.model:addFigureIdToActiveList(slot1.id)
		GlobalEvent:getInstance():Fire(HomeworldEvent.Update_My_Figure_Data_Event, slot1.id)
	end
end

function HomeworldController.sender26007(slot0, slot1)
	slot0:SendProtocal(26007, {
		id = slot1
	})
end

function HomeworldController.handle26007(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end

function HomeworldController.handle26008(slot0, slot1)
end

function HomeworldController.sender26009(slot0)
	slot0:SendProtocal(26009, {})
end

function HomeworldController.handle26009(slot0, slot1)
	if slot1 and slot1.list then
		slot0.model:setRandomVisiterData(slot1.list)
		GlobalEvent:getInstance():Fire(HomeworldEvent.Get_Random_Visiter_Event, slot1.list)
	end
end

function HomeworldController.sender26010(slot0)
	slot0:SendProtocal(26010, {})
end

function HomeworldController.handle26010(slot0, slot1)
	if slot1 and slot1.list then
		GlobalEvent:getInstance():Fire(HomeworldEvent.Get_My_Home_Visiter_Event, slot1.list)
	end
end

function HomeworldController.sender26011(slot0, slot1)
	slot0:SendProtocal(26011, {
		name = slot1
	})
end

function HomeworldController.handle26011(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.code == 1 then
		slot0.model:setMyHomeName(slot1.name)
		GlobalEvent:getInstance():Fire(HomeworldEvent.Update_My_Home_Name_Event, slot1.name)
	end
end

function HomeworldController.handle26012(slot0, slot1)
	if slot1.worship then
		slot0.model:setHomeWorship(slot1.worship)
	end

	GlobalEvent:getInstance():Fire(HomeworldEvent.Update_Some_Data_Event)
end

function HomeworldController.sender26013(slot0)
	slot0:SendProtocal(26013, {})
end

function HomeworldController.handle26013(slot0, slot1)
	if slot1 and slot1.list then
		slot0.model:setHomeSuitAwardData(slot1.list)
		GlobalEvent:getInstance():Fire(HomeworldEvent.Get_Suit_Award_Data_Event)
	end
end

function HomeworldController.sender26014(slot0, slot1)
	slot0:SendProtocal(26014, {
		id = slot1
	})
end

function HomeworldController.handle26014(slot0, slot1)
	if slot1 and slot1.msg then
		message(slot1.msg)
	end
end

function HomeworldController.handle26015(slot0, slot1)
	if slot1.rest_worship then
		slot0.model:setLeftWorshipNum(slot1.rest_worship)
		GlobalEvent:getInstance():Fire(HomeworldEvent.Update_Left_Worship_Num)
	end

	if slot1.acc_hook_time then
		slot0.model:setHomeAccHookTime(slot1.acc_hook_time)
		GlobalEvent:getInstance():Fire(HomeworldEvent.Update_Acc_Hook_Time_Data)
	end

	if slot1.max_soft then
		slot0.model:setMaxComfortValue(slot1.max_soft)
	end
end

function HomeworldController.sender26016(slot0)
	slot0:SendProtocal(26016, {})
end

function HomeworldController.handle26016(slot0, slot1)
	if slot1 and slot1.msg then
		message(slot1.msg)
	end
end

function HomeworldController.handle26017(slot0, slot1)
	if slot1 then
		slot0.model:setHomeFirstOpenFlag(slot1.is_first)
	end
end

function HomeworldController.handle26018(slot0, slot1)
	if slot1 then
		slot2 = false

		if slot1.code == 1 then
			slot2 = true
		end

		slot0.model:updateHomeworldRedStatus(HomeworldConst.Red_Index.Visit, slot2, true)

		slot3 = false

		if slot1.hook_code == 1 then
			slot3 = true
		end

		slot0.model:updateHomeworldRedStatus(HomeworldConst.Red_Index.Hook, slot3)
	end
end

function HomeworldController.sender26019(slot0)
	slot0:SendProtocal(26019, {})
end

function HomeworldController.handle26019(slot0, slot1)
	if slot1.list then
		slot0.model:setTodayWorshipPlayerData(slot1.list)
		GlobalEvent:getInstance():Fire(HomeworldEvent.Get_Today_Worship_Data)
	end
end

function HomeworldController.sender26020(slot0)
	slot0:SendProtocal(26020, {})
end

function HomeworldController.handle26020(slot0, slot1)
	GlobalEvent:getInstance():Fire(HomeworldEvent.Get_Rank_Data_Event, slot1)
end

function HomeworldController.sender26021(slot0, slot1)
	slot0:SendProtocal(26021, {
		main_floor = slot1
	})
end

function HomeworldController.handle26021(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.code == TRUE and slot1.main_floor then
		slot0.model:setMyHomeMainStoreyIndex(slot1.main_floor)

		if slot0.model:checkMaxStoreyIsChange(slot1.max_soft_floor) then
			CommonAlert.show(string.format(TI18N("当前舒适度最高楼层为%d楼"), slot1.max_soft_floor), TI18N("确定"), nil, , , , , {
				extend_offy = -5,
				off_y = 43,
				title = TI18N("提示"),
				extend_str = TI18N("家园币的产出仅由舒适度最高的楼层决定"),
				extend_aligment = cc.TEXT_ALIGNMENT_CENTER
			})
		end

		slot0.model:updateMaxSoftStoreyIndex(slot1.max_soft_floor)
		GlobalEvent:getInstance():Fire(HomeworldEvent.Update_Main_Storey_Event)
	end
end

function HomeworldController.requestOpenMyHomeworld(slot0, slot1)
	if not slot0.model:checkHomeworldIsOpen() then
		return
	end

	if slot1 then
		slot0.back_my_home_flag = true
	else
		slot0.open_my_home_flag = true
	end

	slot0:sender26004()
end

function HomeworldController.isOpenHomeWorldScene(slot0)
	if slot0.homeworld_scene and slot0.homeworld_scene:isOpen() then
		return true
	end

	return false
end

function HomeworldController.openHomeworldScene(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.model:checkHomeworldIsOpen() then
			return
		end

		if not slot0.homeworld_scene then
			slot0.homeworld_scene = HomeWorldScene.New()
		end

		if slot0.homeworld_scene:isOpen() == false then
			slot0.homeworld_scene:open(slot2)
		end
	elseif slot0.homeworld_scene then
		slot0.homeworld_scene:close()

		slot0.homeworld_scene = nil
	end
end

function HomeworldController.getHomeworldRoot(slot0)
	if slot0.homeworld_scene then
		return slot0.homeworld_scene.root_wnd
	end
end

function HomeworldController.changeHomeTimeType(slot0, slot1)
	if slot0.homeworld_scene then
		slot0.homeworld_scene:updateHomeBgByTime(slot1)
	end
end

function HomeworldController.getHomeEditStatus(slot0)
	if slot0.homeworld_scene then
		return slot0.homeworld_scene:getHomeEditStatus()
	end
end

function HomeworldController.checkCurHomeIsHaveUnitByBid(slot0, slot1)
	slot2 = false

	if slot0.homeworld_scene then
		slot2 = slot0.homeworld_scene:checkCurHomeIsHaveUnitByBid(slot1)
	end

	return slot2
end

function HomeworldController.getCurHomeSoftVal(slot0)
	slot1 = 0

	if slot0.homeworld_scene then
		slot1 = slot0.homeworld_scene:getCurHomeSoftVal()
	end

	return slot1
end

function HomeworldController.getCurOccupyGridNum(slot0)
	slot1 = 0

	if slot0.homeworld_scene then
		slot1 = slot0.homeworld_scene:getCurOccupyGridNum()
	end

	return slot1
end

function HomeworldController.getAllRoleCurGridData(slot0)
	slot1 = {}

	if slot0.homeworld_scene then
		slot1 = slot0.homeworld_scene:getAllRoleCurGridData()
	end

	return slot1
end

function HomeworldController.getHomeSceneScaleVal(slot0)
	if slot0.homeworld_scene then
		return slot0.homeworld_scene.cur_scale_val or 1
	end
end

function HomeworldController.checkHomeIsSameByRidAndSrvId(slot0, slot1, slot2)
	if slot0.homeworld_scene then
		slot3, slot4 = slot0.homeworld_scene:getOtherHomeRidAndSrvId()

		if slot3 and slot4 and slot3 == slot1 and slot4 == slot2 then
			return true
		end
	end

	return false
end

function HomeworldController.updateOccupyGridList(slot0, slot1, slot2)
	if slot0.homeworld_scene then
		slot0.model:updateOccupyGridList(slot0.homeworld_scene:getOccupyGridList(slot1, slot2))
	end
end

function HomeworldController.getOccupyGridList(slot0, slot1, slot2)
	slot3 = {}

	if slot0.homeworld_scene then
		slot3 = slot0.homeworld_scene:getOccupyGridList(slot1, slot2)
	end

	return slot3
end

function HomeworldController.updateAllUnitZorder(slot0)
	if slot0.homeworld_scene then
		slot0.homeworld_scene:updateAllFurnitureZOrder()
	end
end

function HomeworldController.enterPreviewState(slot0, slot1)
	if slot0.homeworld_scene then
		slot0.homeworld_scene:enterPreviewState(slot1)
	end
end

function HomeworldController.openHomeworldShopWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.model:checkHomeworldIsOpen() then
			return
		end

		if not slot0.homeworld_shop then
			slot0.homeworld_shop = HomeworldShopWindow.New()
		end

		if slot0.homeworld_shop:isOpen() == false then
			slot0.homeworld_shop:open(slot2)
		end
	elseif slot0.homeworld_shop then
		slot0.homeworld_shop:close()

		slot0.homeworld_shop = nil
	end
end

function HomeworldController.getHomeShopRoot(slot0)
	if slot0.homeworld_shop then
		return slot0.homeworld_shop.root_wnd
	end
end

function HomeworldController.openHomeworldUnlockKeyPanel(slot0, slot1)
	if slot1 == true then
		if not slot0.homeworld_unlock_key then
			slot0.homeworld_unlock_key = HomeworldUnlockKeyPanel.New()
		end

		if slot0.homeworld_unlock_key:isOpen() == false then
			slot0.homeworld_unlock_key:open()
		end
	elseif slot0.homeworld_unlock_key then
		slot0.homeworld_unlock_key:close()

		slot0.homeworld_unlock_key = nil
	end
end

function HomeworldController.getHomeworldUnlockKey(slot0)
	if slot0.homeworld_unlock_key then
		return slot0.homeworld_unlock_key.root_wnd
	end
end

function HomeworldController.openHomeworldVisitWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.homeworld_visit then
			slot0.homeworld_visit = HomeworldVisitWindow.New()
		end

		if slot0.homeworld_visit:isOpen() == false then
			slot0.homeworld_visit:open()
		end
	elseif slot0.homeworld_visit then
		slot0.homeworld_visit:close()

		slot0.homeworld_visit = nil
	end
end

function HomeworldController.openHomeworldSuitWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.homeworld_suit then
			slot0.homeworld_suit = HomeworldSuitWindow.New()
		end

		if slot0.homeworld_suit:isOpen() == false then
			slot0.homeworld_suit:open(slot2)
		end
	elseif slot0.homeworld_suit then
		slot0.homeworld_suit:close()

		slot0.homeworld_suit = nil
	end
end

function HomeworldController.showHomeworldSuitWindow(slot0, slot1)
	if slot0.homeworld_suit then
		slot0.homeworld_suit:showSelfWindow(slot1)
	end
end

function HomeworldController.openHomeworldFigureWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.homeworld_figure then
			slot0.homeworld_figure = HomeworldFigureWindow.New()
		end

		if slot0.homeworld_figure:isOpen() == false then
			slot0.homeworld_figure:open()
		end
	elseif slot0.homeworld_figure then
		slot0.homeworld_figure:close()

		slot0.homeworld_figure = nil
	end
end

function HomeworldController.openHomeworldFigureChoseWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.homeworld_figure_chose then
			slot0.homeworld_figure_chose = HomeworldFigureChoseWindow.New()
		end

		if slot0.homeworld_figure_chose:isOpen() == false then
			slot0.homeworld_figure_chose:open()
		end
	elseif slot0.homeworld_figure_chose then
		slot0.homeworld_figure_chose:close()

		slot0.homeworld_figure_chose = nil
	end
end

function HomeworldController.openHomeworldBuyWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.homeworld_buy_wnd then
			slot0.homeworld_buy_wnd = HomeworldBuyUnitWindow.New()
		end

		if slot0.homeworld_buy_wnd:isOpen() == false then
			slot0.homeworld_buy_wnd:open(slot2, slot3)
		end
	elseif slot0.homeworld_buy_wnd then
		slot0.homeworld_buy_wnd:close()

		slot0.homeworld_buy_wnd = nil
	end
end

function HomeworldController.getHomeworldBuyRoot(slot0)
	if slot0.homeworld_buy_wnd then
		return slot0.homeworld_buy_wnd.root_wnd
	end
end

function HomeworldController.openHomeperBag(slot0)
	if not HomepetController:getInstance():getModel():getHomePetVo() then
		return
	end

	if slot1:getPetState() == HomepetConst.state_type.eNotActive then
		HomepetController:getInstance():openHomePetGooutProgressPanel(true)
	elseif slot2 == HomepetConst.state_type.eHome then
		HomepetController:getInstance():openHomePetTravellingBagPanel(true)
	elseif slot2 == HomepetConst.state_type.eOnWay then
		HomepetController:getInstance():openHomePetGooutProgressPanel(true)
	end
end

function HomeworldController.openHomeperItem(slot0)
	HomepetController:getInstance():openHomePetItemBagPanel(true, {
		show_type = HomepetConst.Item_bag_show_type.eBagItemType
	})
end

function HomeworldController.openHomeperCollect(slot0)
	HomepetController:getInstance():openHomePetCollectionPanel(true)
end

function HomeworldController.openFurnitureInfoWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.homeworld_unit_info then
			slot0.homeworld_unit_info = HomeworldUnitInfoWindow.New()
		end

		if slot0.homeworld_unit_info:isOpen() == false then
			slot0.homeworld_unit_info:open(slot2)
		end
	elseif slot0.homeworld_unit_info then
		slot0.homeworld_unit_info:close()

		slot0.homeworld_unit_info = nil
	end
end

function HomeworldController.openHomeInfoWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.homeworld_info then
			slot0.homeworld_info = HomeworldInfoWindow.New()
		end

		if slot0.homeworld_info:isOpen() == false then
			slot0.homeworld_info:open()
		end
	elseif slot0.homeworld_info then
		slot0.homeworld_info:close()

		slot0.homeworld_info = nil
	end
end

function HomeworldController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
