BattleDramaController = BattleDramaController or BaseClass(BaseController)

function BattleDramaController.config(slot0)
	slot0.model = BattleDramaModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function BattleDramaController.getModel(slot0)
	return slot0.model
end

function BattleDramaController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.role_vo = RoleController:getInstance():getRoleVo()
		end)
	end
end

function BattleDramaController.registerProtocals(slot0)
	slot0:RegisterProtocal(13000, "handle13000")
	slot0:RegisterProtocal(13001, "handle13001")
	slot0:RegisterProtocal(13002, "handle13002")
	slot0:RegisterProtocal(13003, "handle13003")
	slot0:RegisterProtocal(13004, "handle13004")
	slot0:RegisterProtocal(13005, "handle13005")
	slot0:RegisterProtocal(13006, "handle13006")
	slot0:RegisterProtocal(13007, "handle13007")
	slot0:RegisterProtocal(13008, "handle13008")
	slot0:RegisterProtocal(13009, "handle13009")
	slot0:RegisterProtocal(13010, "handle13010")
	slot0:RegisterProtocal(13011, "handle13011")
	slot0:RegisterProtocal(13015, "handle13015")
	slot0:RegisterProtocal(13016, "handle13016")
	slot0:RegisterProtocal(13017, "handle13017")
	slot0:RegisterProtocal(13018, "handle13018")
	slot0:RegisterProtocal(13019, "handle13019")
	slot0:RegisterProtocal(13020, "handle13020")
end

function BattleDramaController.send13011(slot0)
	slot0:SendProtocal(13011, {})
end

function BattleDramaController.handle13011(slot0, slot1)
	if slot1 and slot0.role_vo then
		slot0.model:setBuffData(slot1)
	end
end

function BattleDramaController.handle13016(slot0, slot1)
	if slot1 then
		BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.Darma, slot1)
	end
end

function BattleDramaController.send13000(slot0)
	slot0:SendProtocal(13000, {})
end

function BattleDramaController.handle13000(slot0, slot1)
	if slot1 and slot0.role_vo then
		slot0.model:setDramaData(slot1)

		if NEEDCHANGEENTERSTATUS == 4 and not slot0.first_enter then
			slot0.first_enter = true

			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.drama_scene)
		end
	end
end

function BattleDramaController.handle13001(slot0, slot1)
	if slot1 and slot0.role_vo then
		slot0.model:updateDramaData(slot1)
	end
end

function BattleDramaController.send13002(slot0)
	slot0:SendProtocal(13002, {})
end

function BattleDramaController.handle13002(slot0, slot1)
	message(slot1.msg)
end

function BattleDramaController.send13003(slot0, slot1)
	report_mission_begin(BattleConst.Fight_Type.Darma)
	slot0:SendProtocal(13003, {
		is_auto = slot1 or 0
	})
end

function BattleDramaController.handle13003(slot0, slot1)
	message(slot1.msg)
end

function BattleDramaController.send13004(slot0)
	slot0:SendProtocal(13004, {})
end

function BattleDramaController.handle13004(slot0, slot1)
	message(slot1.msg)
end

function BattleDramaController.send13005(slot0, slot1, slot2)
	slot0:SendProtocal(13005, {
		dun_id = slot1,
		num = slot2
	})
end

function BattleDramaController.handle13005(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0.model:updateCurDunListInfo(slot1)
		slot0:openDramSwapView(false)
		slot0:openDramSwapRewardView(true, slot1)
	end
end

function BattleDramaController.send13006(slot0)
	slot0:SendProtocal(13006, {})
end

function BattleDramaController.handle13006(slot0, slot1)
	if slot1 then
		slot0.model:setQuickData(slot1)
	end
end

function BattleDramaController.handle13007(slot0, slot1)
	if slot1 then
		slot0:openDramHookRewardView(true, slot1)
	end
end

function BattleDramaController.send13008(slot0)
	slot0:SendProtocal(13008, {})
end

function BattleDramaController.handle13008(slot0, slot1)
	if slot1 then
		slot0.model:setDramaReward(slot1)
	end
end

function BattleDramaController.send13009(slot0, slot1)
	slot0:SendProtocal(13009, {
		id = slot1
	})
end

function BattleDramaController.handle13009(slot0, slot1)
	if slot1 then
		message(slot1.msg)

		if slot1.code == 1 and slot0.battle_drama_reward_view then
			slot0.battle_drama_reward_view:udpateDataByID(slot1.id)
		end
	end
end

function BattleDramaController.handle13010(slot0, slot1)
	slot0:handleUnlockChapter(slot1)
end

function BattleDramaController.send13015(slot0, slot1)
	slot0:SendProtocal(13015, {
		dun_id = slot1
	})
end

function BattleDramaController.handle13015(slot0, slot1)
	if slot1 and slot1.dungeon_replay_log then
		GlobalEvent:getInstance():Fire(Battle_dramaEvent.UpdatePassVedioDataEvent, slot1.dungeon_replay_log)
	end
end

function BattleDramaController.openDramRewardView(slot0, slot1)
	if slot1 == false then
		if slot0.battle_drama_reward_view ~= nil then
			slot0.battle_drama_reward_view:close()

			slot0.battle_drama_reward_view = nil
		end
	else
		if slot0.battle_drama_reward_view == nil then
			slot0.battle_drama_reward_view = BattleDramaRewardWindow.New()
		end

		if slot0.battle_drama_reward_view and slot0.battle_drama_reward_view:isOpen() == false then
			slot0.battle_drama_reward_view:open()
		end
	end
end

function BattleDramaController.getDramaBattlePassRewardRoot(slot0)
	if slot0.battle_drama_reward_view then
		return slot0.battle_drama_reward_view.root_wnd
	end
end

function BattleDramaController.openDramaPassVedioView(slot0, slot1)
	if slot1 == false then
		if slot0.battle_drama_vedio_view ~= nil then
			slot0.battle_drama_vedio_view:close()

			slot0.battle_drama_vedio_view = nil
		end
	else
		if slot0.battle_drama_vedio_view == nil then
			slot0.battle_drama_vedio_view = BattlDramaPassVedioView.New()
		end

		if slot0.battle_drama_vedio_view and slot0.battle_drama_vedio_view:isOpen() == false then
			slot0.battle_drama_vedio_view:open()
		end
	end
end

function BattleDramaController.openDramBossInfoView(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.battle_drama_boss_info ~= nil then
			slot0.battle_drama_boss_info:close()

			slot0.battle_drama_boss_info = nil
		end
	else
		if slot0.battle_drama_boss_info == nil then
			slot0.battle_drama_boss_info = BattlDramaBossInfoWindow.New(slot2)
		end

		if slot0.battle_drama_boss_info and slot0.battle_drama_boss_info:isOpen() == false then
			slot0.battle_drama_boss_info:open()
		end
	end
end

function BattleDramaController.openDramSwapView(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.battle_drama_swap_view ~= nil then
			slot0.battle_drama_swap_view:close()

			slot0.battle_drama_swap_view = nil
		end
	else
		if slot0.battle_drama_swap_view == nil then
			slot0.battle_drama_swap_view = BattlDramaSwapWindow.New(slot2)
		end

		if slot0.battle_drama_swap_view and slot0.battle_drama_swap_view:isOpen() == false then
			slot0.battle_drama_swap_view:open()
		end
	end
end

function BattleDramaController.openDramSwapRewardView(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.battle_drama_swap_reward_view ~= nil then
			slot0.battle_drama_swap_reward_view:close()

			slot0.battle_drama_swap_reward_view = nil
		end
	else
		LevupgradeController:getInstance():waitForOpenLevUpgrade(true)
		BattleResultMgr:getInstance():setWaitShowPanel(true)

		if slot0.battle_drama_swap_reward_view == nil then
			slot0.battle_drama_swap_reward_view = BattlDramaSwapRewardWindow.New(slot2)
		end

		if slot0.battle_drama_swap_reward_view and slot0.battle_drama_swap_reward_view:isOpen() == false then
			slot0.battle_drama_swap_reward_view:open(slot2)
		end
	end
end

function BattleDramaController.openDramBattleAutoCombatView(slot0, slot1)
	if slot1 == false then
		if slot0.battle_drama_auto_combat_view ~= nil then
			slot0.battle_drama_auto_combat_view:close()

			slot0.battle_drama_auto_combat_view = nil
		end
	else
		if slot0.model.drama_data == nil or slot0.model.drama_data.max_dun_id < Config.DungeonData.data_drama_const.auto_combat_dun_id.val then
			slot0:send13003(0)

			return
		end

		if slot0.role_vo == nil or slot0.role_vo.lev < Config.DungeonData.data_drama_const.auto_combat_lev.val then
			slot0:send13003(0)

			return
		end

		if StoryController:getInstance():isInStory() or GuideController:getInstance():isInGuide() then
			slot0:send13003(0)

			return
		end

		if slot0.model.auto_combat ~= nil then
			slot0:send13003(slot0.model.auto_combat)

			return
		end

		if slot0.battle_drama_auto_combat_view == nil then
			slot0.battle_drama_auto_combat_view = BattleDramaAutoCombatWindow.New()
		end

		if slot0.battle_drama_auto_combat_view and slot0.battle_drama_auto_combat_view:isOpen() == false then
			slot0.battle_drama_auto_combat_view:open()
		end
	end
end

function BattleDramaController.openDramBattleQuickView(slot0, slot1)
	if slot1 == false then
		if slot0.battle_drama_battle_quick_view ~= nil then
			slot0.battle_drama_battle_quick_view:close()

			slot0.battle_drama_battle_quick_view = nil
		end
	else
		LevupgradeController:getInstance():waitForOpenLevUpgrade(true)
		BattleResultMgr:getInstance():setWaitShowPanel(true)

		if slot0.battle_drama_battle_quick_view == nil then
			slot0.battle_drama_battle_quick_view = BattlDramaQuickBattleWindow.New()
		end

		if slot0.battle_drama_battle_quick_view and slot0.battle_drama_battle_quick_view:isOpen() == false then
			slot0.battle_drama_battle_quick_view:open()
		end
	end
end

function BattleDramaController.getDramBattleQuickRoot(slot0)
	if slot0.battle_drama_battle_quick_view then
		return slot0.battle_drama_battle_quick_view.root_wnd
	end
end

function BattleDramaController.getDramaBattleHookRewardRoot(slot0)
	if slot0.battle_drama_hook_reward_view then
		return slot0.battle_drama_hook_reward_view.root_wnd
	end
end

function BattleDramaController.openDramHookRewardView(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.battle_drama_hook_reward_view ~= nil then
			slot0.battle_drama_hook_reward_view:close()

			slot0.battle_drama_hook_reward_view = nil
		end
	else
		if GuideController:getInstance():getGuideConfig() and slot3.id ~= GuideConst.special_id.quick_guide and slot3.id ~= GuideConst.special_id.hook_guide then
			return
		end

		LevupgradeController:getInstance():waitForOpenLevUpgrade(true)
		BattleResultMgr:getInstance():setWaitShowPanel(true)

		if slot0.battle_drama_hook_reward_view == nil then
			slot0.battle_drama_hook_reward_view = BattlDramaHookRewardWindow.New()
		end

		if slot0.battle_drama_hook_reward_view and slot0.battle_drama_hook_reward_view:isOpen() == false then
			slot0.battle_drama_hook_reward_view:open(slot2)
		end
	end
end

function BattleDramaController.openDramWorldView(slot0, slot1)
	if slot1 == false then
		if slot0.battle_drama_world_view ~= nil then
			slot0.battle_drama_world_view:close()

			slot0.battle_drama_world_view = nil
		end
	else
		if slot0.battle_drama_world_view == nil then
			slot0.battle_drama_world_view = BattleDramaWorldWindows.New()
		end

		if slot0.battle_drama_world_view and slot0.battle_drama_world_view:isOpen() == false then
			slot0.battle_drama_world_view:open()
		end
	end
end

function BattleDramaController.openBattleDramaUnlockWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.battle_drama_unlock_view ~= nil then
			slot0.battle_drama_unlock_view:close()

			slot0.battle_drama_unlock_view = nil
		end
	else
		if slot0.battle_drama_unlock_view == nil then
			slot0.battle_drama_unlock_view = BattleDramaUnlockWindow.New()
		end

		if slot0.battle_drama_unlock_view and slot0.battle_drama_unlock_view:isOpen() == false then
			slot0.battle_drama_unlock_view:open(slot2)
		end
	end
end

function BattleDramaController.openBattleDramaUnlockChapterView(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.battle_drama_unlock_chapter_view ~= nil then
			slot0.battle_drama_unlock_chapter_view:close()

			slot0.battle_drama_unlock_chapter_view = nil
		end
	else
		if slot0.battle_drama_unlock_chapter_view == nil then
			slot0.battle_drama_unlock_chapter_view = BattleDramaUnlockChapterView.New()
		end

		if slot0.battle_drama_unlock_chapter_view and slot0.battle_drama_unlock_chapter_view:isOpen() == false then
			slot0.battle_drama_unlock_chapter_view:open(slot2)
		end
	end
end

function BattleDramaController.getBattleQingbaoRoot(slot0)
	if slot0.battle_drama_qingbao_tips_view then
		return slot0.battle_drama_qingbao_tips_view.root_wnd
	end
end

function BattleDramaController.openBattleDramaQingBaoTipsView(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.battle_drama_qingbao_tips_view ~= nil then
			slot0.battle_drama_qingbao_tips_view:close()

			slot0.battle_drama_qingbao_tips_view = nil
		end
	else
		if slot0.battle_drama_qingbao_tips_view == nil then
			slot0.battle_drama_qingbao_tips_view = BattleDramaQingBaoTipsView.New()
		end

		if slot0.battle_drama_qingbao_tips_view and slot0.battle_drama_qingbao_tips_view:isOpen() == false then
			slot0.battle_drama_qingbao_tips_view:open(slot2)
		end
	end
end

function BattleDramaController.openBattleDramaFuncView(slot0, slot1)
	if slot1 == false then
		if slot0.battle_drama_qingbao_tips_view ~= nil then
			slot0.battle_drama_qingbao_tips_view:close()

			slot0.battle_drama_qingbao_tips_view = nil
		end
	else
		if slot0.battle_drama_qingbao_tips_view == nil then
			slot0.battle_drama_qingbao_tips_view = BattlDramafuncWindow.New()
		end

		if slot0.battle_drama_qingbao_tips_view and slot0.battle_drama_qingbao_tips_view:isOpen() == false then
			slot0.battle_drama_qingbao_tips_view:open()
		end
	end
end

function BattleDramaController.openDramDropWindows(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.battle_drama_drop_tips_view ~= nil then
			slot0.battle_drama_drop_tips_view:close()

			slot0.battle_drama_drop_tips_view = nil
		end
	else
		if slot0.battle_drama_drop_tips_view == nil then
			slot0.battle_drama_drop_tips_view = BattlDramaDropWindow.New()
		end

		if slot0.battle_drama_drop_tips_view and slot0.battle_drama_drop_tips_view:isOpen() == false then
			slot0.battle_drama_drop_tips_view:open(slot2)
		end
	end
end

function BattleDramaController.handleUnlockChapter(slot0, slot1)
	if Config.DungeonData.data_drama_dungeon_info(slot1.dun_id) and Config.DungeonData.data_drama_dungeon_info(slot1.dun_id).next_id == 0 then
		slot1.is_last_chapter = true
	end

	slot1.is_last_chapter = false

	if slot1 then
		WorldmapController:getInstance():openWorldMapMainWindow(true, slot1)
	end
end

function BattleDramaController.openWorldLevTips(slot0, slot1)
	if not slot1 then
		if slot0.world_lev_tips then
			slot0.world_lev_tips:close()

			slot0.world_lev_tips = nil
		end
	else
		if slot0.world_lev_tips == nil then
			slot0.world_lev_tips = BattleDramaWorldLevTips.New()
		end

		slot0.world_lev_tips:open()
	end
end

function BattleDramaController.openBattleDramaMapWindows(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.battle_drama_map_view == nil then
			slot0.battle_drama_map_view = BattleDramaMapWindows.New()
		end

		slot0.battle_drama_map_view:open(slot2)
	elseif slot0.battle_drama_map_view then
		slot0.battle_drama_map_view:close()

		slot0.battle_drama_map_view = nil
	end
end

function BattleDramaController.openBattleDramaUI(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if slot0.battle_drama_ui == nil then
			slot0.battle_drama_ui = BttleTopDramaView.new(slot2, slot3)
		end

		if slot0.battle_drama_ui then
			slot0.battle_drama_ui:openView()
		end

		slot0:openBattleDramaTimer(false)
	elseif slot0.battle_drama_ui then
		slot0.battle_drama_ui:hideView()

		if not slot4 then
			slot0:openBattleDramaTimer(true)
		end
	end
end

function BattleDramaController.getBattleDramaUI(slot0)
	if slot0.battle_drama_ui and not tolua.isnull(slot0.battle_drama_ui) then
		return slot0.battle_drama_ui
	end
end

function BattleDramaController.updateBtnLayerStatus(slot0, slot1)
	if slot0.battle_drama_ui and not tolua.isnull(slot0.battle_drama_ui) then
		slot0.battle_drama_ui:updateBtnLayerStatus(slot1)
	end
end

function BattleDramaController.updataZhenfaInfo(slot0, slot1, slot2)
	if slot0.battle_drama_ui and not tolua.isnull(slot0.battle_drama_ui) then
		slot0.battle_drama_ui:updataZhenfaInfo(slot1, slot2)
	end
end

function BattleDramaController.updateRound(slot0, slot1)
	if slot0.battle_drama_ui and not tolua.isnull(slot0.battle_drama_ui) then
		slot0.battle_drama_ui:updateRound(slot1)
	end
end

function BattleDramaController.playResourceCollect(slot0, slot1, slot2)
	if tolua.isnull(slot0.battle_drama_ui) then
		return
	end

	if slot0.battle_drama_ui.playResourceCollect then
		slot0.battle_drama_ui:playResourceCollect(slot1, slot2)
	end
end

function BattleDramaController.openBattleDramaTimer(slot0, slot1)
	if slot1 == true then
		if CLEAN_BATTLE_SCENE_TIME == nil then
			CLEAN_BATTLE_SCENE_TIME = 60
		end

		slot0.drama_begin_time = GameNet:getInstance():getTime()

		if slot0.battle_drama_timer == nil then
			slot0.battle_drama_timer = GlobalTimeTicket:getInstance():add(function ()
				if CLEAN_BATTLE_SCENE_TIME < GameNet:getInstance():getTime() - uv0.drama_begin_time then
					GlobalTimeTicket:getInstance():remove(uv0.battle_drama_timer)

					uv0.battle_drama_timer = nil

					if uv0.battle_drama_ui then
						uv0.battle_drama_ui:DeleteMe()

						uv0.battle_drama_ui = nil
					end
				end
			end, 30)
		end
	elseif slot0.battle_drama_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.battle_drama_timer)

		slot0.battle_drama_timer = nil
	end
end

function BattleDramaController.__delete(slot0)
	slot0:openBattleDramaTimer(false)

	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end

function BattleDramaController.send13017(slot0)
	slot0:SendProtocal(13017, {})
end

function BattleDramaController.handle13017(slot0, slot1)
	slot0.model:updateHookAccumulateTime(slot1)
end

function BattleDramaController.requestGetHookTimeAwards(slot0)
	slot0:SendProtocal(13018, {})
end

function BattleDramaController.handle13018(slot0, slot1)
	message(slot1.msg)
end

function BattleDramaController.handle13019(slot0, slot1)
	if GuideController:getInstance():isInGuide() then
		return
	end

	if StoryController:getInstance():getModel():isStoryState() then
		return
	end

	slot3 = TI18N("前往")
	slot4 = TI18N("您的挂机收益即将达到上限，请前往出击界面领取")

	if MainuiController:getInstance():getMainUIIndex() == MainuiConst.btn_index.drama_scene then
		slot3 = TI18N("确定")
		slot4 = TI18N("您的挂机收益即将达到上限，请点击收益宝箱领取")
	end

	slot0.hook_alert = CommonAlert.show(slot4, slot3, function ()
		if uv0 ~= MainuiConst.btn_index.drama_scene then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.drama_scene)
		end

		uv1.hook_alert = nil

		GlobalEvent:getInstance():Fire(Battle_dramaEvent.Close_Hook_Alert_Event)
	end, TI18N("取消"), function ()
		uv0.hook_alert = nil

		GlobalEvent:getInstance():Fire(Battle_dramaEvent.Close_Hook_Alert_Event)
	end, nil, nil, {
		view_tag = ViewMgrTag.RECONNECT_TAG
	})
end

function BattleDramaController.checkHookAlertIsOpen(slot0)
	if slot0.hook_alert then
		return true
	end

	return false
end

function BattleDramaController.send13020(slot0)
	slot0:SendProtocal(13020, {})
end

function BattleDramaController.handle13020(slot0, slot1)
	if slot1.val then
		GlobalEvent:getInstance():Fire(Battle_dramaEvent.UpdateDramaProgressDataEvent, slot1.val)
	end
end
