TaskController = TaskController or BaseClass(BaseController)

function TaskController.config(slot0)
	slot0.model = TaskModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function TaskController.getModel(slot0)
	return slot0.model
end

function TaskController.registerEvents(slot0)
	if slot0.init_quest_event == nil then
		slot0.init_quest_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_quest_event)

			uv0.init_quest_event = nil
			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if uv0.role_assets_event == nil then
				uv0.role_assets_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
					if slot0 == "activity" then
						uv0.model:checkQuestAndFeatStatus(TaskConst.update_type.activity)
					end
				end)
			end
		end)
	end
end

function TaskController.requestBaseQuestData(slot0)
	slot0:SendProtocal(10400, {})
	slot0:SendProtocal(16400, {})
	slot0:requestActivityInfo()
end

function TaskController.registerProtocals(slot0)
	slot0:RegisterProtocal(10400, "on10400")
	slot0:RegisterProtocal(10403, "on10403")
	slot0:RegisterProtocal(10406, "on10406")
	slot0:RegisterProtocal(10409, "on10409")
	slot0:RegisterProtocal(16400, "on16400")
	slot0:RegisterProtocal(16401, "on16401")
	slot0:RegisterProtocal(16402, "on16402")
	slot0:RegisterProtocal(20300, "on20300")
	slot0:RegisterProtocal(20301, "on20301")
	slot0:RegisterProtocal(25810, "handle25810")
	slot0:RegisterProtocal(25811, "handle25811")
	slot0:RegisterProtocal(25812, "handle25812")
end

function TaskController.openTaskMainWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.task_main_window ~= nil then
			slot0.task_main_window:close()

			slot0.task_main_window = nil
		end
	else
		if slot0.task_main_window == nil then
			slot0.task_main_window = TaskMainWindow.New()
		end

		if slot0.task_main_window:isOpen() == false then
			slot0.task_main_window:open(slot2)
		end
	end
end

function TaskController.handleTaskProgress(slot0, slot1, slot2, slot3)
	slot2 = slot2 or 1

	if slot1.config.progress == nil or #slot1.config.progress == 0 then
		if slot1.id then
			print("=================> 处理任务进度时出错,任务id为 " .. slot1.id .. " 的没有配置任务进度")
		end

		return
	end

	if slot1.config.progress[slot2] == nil then
		if slot1.id then
			print("=================> 处理任务id为 " .. slot1.id .. " 的第 " .. slot2 .. " 个进度要求时出错")
		end

		return
	end

	slot0:gotoTagertFun(slot4, slot1.config.extra, slot3)
end

function TaskController.gotoTagertFun(slot0, slot1, slot2, slot3)
	if slot1 == nil then
		return
	end

	if slot1.cli_label == Config.QuestData.data_progress_lable.evt_recruit then
		JumpController:getInstance():jumpViewByEvtData({
			1
		})
	elseif slot1.cli_label == slot4.evt_partner then
		if slot2 and next(slot2) then
			JumpController:getInstance():jumpViewByEvtData({
				2,
				slot2[1],
				slot2[2]
			})
		else
			PartnersummonController:getInstance():openPartnerSummonWindow(true)
		end
	elseif slot1.cli_label == slot4.evt_arena_fight or slot1.cli_label == slot4.evt_arena_fight_result or slot1.cli_label == slot4.evt_arena_score or slot1.cli_label == slot4.evt_arena_rank then
		JumpController:getInstance():jumpViewByEvtData({
			3
		})
	elseif slot1.cli_label == slot4.evt_friend_present or slot1.cli_label == slot4.evt_friend then
		JumpController:getInstance():jumpViewByEvtData({
			4
		})
	elseif slot1.cli_label == slot4.evt_dungeon_pass then
		JumpController:getInstance():jumpViewByEvtData({
			5
		})
	elseif slot1.cli_label == slot4.evt_levup or slot1.cli_label == slot4.evt_get_item or slot1.cli_label == slot4.evt_dungeon_enter then
		JumpController:getInstance():jumpViewByEvtData({
			5
		})
	elseif slot1.cli_label == slot4.evt_loss_silver_coin then
		JumpController:getInstance():jumpViewByEvtData({
			6
		})
	elseif slot1.cli_label == slot4.evt_loss_red_gold_or_gold then
		-- Nothing
	elseif slot1.cli_label == slot4.evt_gain_silver_coin then
		-- Nothing
	elseif slot1.cli_label == slot4.evt_gain_coin then
		-- Nothing
	elseif slot1.cli_label == slot4.evt_gain_gold then
		JumpController:getInstance():jumpViewByEvtData({
			7
		})
	elseif slot1.cli_label == slot4.evt_eqm_sell then
		JumpController:getInstance():jumpViewByEvtData({
			8
		})
	elseif slot1.cli_label == slot4.evt_say then
		JumpController:getInstance():jumpViewByEvtData({
			9
		})
	elseif slot1.cli_label == slot4.evt_friend_sns then
		JumpController:getInstance():jumpViewByEvtData({
			10
		})
	elseif slot1.cli_label == slot4.evt_market_gold_buy then
		-- Nothing
	elseif slot1.cli_label == slot4.evt_dungeon_fast_combat then
		JumpController:getInstance():jumpViewByEvtData({
			11
		})
	elseif slot1.cli_label ~= slot4.evt_adventure_explore and slot1.cli_label ~= slot4.evt_adventure_plunder and slot1.cli_label ~= slot4.evt_adventure_goto_floor and slot1.cli_label ~= slot4.evt_adventure_box and slot1.cli_label ~= slot4.evt_adventure_finger_guessing and slot1.cli_label ~= slot4.evt_adventure_answer_all_right and slot1.cli_label ~= slot4.evt_adventure_plunder_result then
		if slot1.cli_label == slot4.evt_adventure_kill_mon then
			-- Nothing
		elseif slot1.cli_label ~= slot4.evt_boss_fight then
			if slot1.cli_label == slot4.evt_boss_fight_result then
				-- Nothing
			elseif slot1.cli_label ~= slot4.evt_world_boss_fight then
				if slot1.cli_label == slot4.evt_world_boss_fight_ko then
					-- Nothing
				elseif slot1.cli_label == slot4.evt_star_tower_pass then
					JumpController:getInstance():jumpViewByEvtData({
						12
					})
				elseif slot1.cli_label == slot4.evt_guild_dun_fight or slot1.cli_label == slot4.evt_guild_dun_fight_ko then
					JumpController:getInstance():jumpViewByEvtData({
						31
					})
				elseif slot1.cli_label == slot4.evt_guild_donate then
					JumpController:getInstance():jumpViewByEvtData({
						13
					})
				elseif slot1.cli_label == slot4.evt_partner_enchant_eqm or slot1.cli_label == slot4.evt_partner_levelup or slot1.cli_label == slot4.evt_partner_eqm or slot1.cli_label == slot4.evt_partner_artifact or slot1.cli_label == slot4.evt_eqm_compound then
					JumpController:getInstance():jumpViewByEvtData({
						19
					})
				elseif slot1.cli_label == slot4.evt_star_divination then
					AuguryController:getInstance():openMainView(true)
				elseif slot1.cli_label == slot4.evt_dungeon_auto then
					JumpController:getInstance():jumpViewByEvtData({
						5
					})
				elseif slot1.cli_label == slot4.evt_guild_join then
					JumpController:getInstance():jumpViewByEvtData({
						14
					})
				elseif slot1.cli_label == slot4.evt_gain_guild then
					JumpController:getInstance():jumpViewByEvtData({
						14
					})
				elseif slot1.cli_label == slot4.evt_loss_guild then
					JumpController:getInstance():jumpViewByEvtData({
						15,
						MallConst.MallType.UnionShop
					})
				elseif slot1.cli_label == slot4.evt_power then
					JumpController:getInstance():jumpViewByEvtData({
						16
					})
				elseif slot1.cli_label ~= slot4.evt_formation_open then
					if slot1.cli_label == slot4.evt_formation_level_up then
						-- Nothing
					elseif slot1.cli_label == slot4.evt_market_silver_buy then
						-- Nothing
					elseif slot1.cli_label == slot4.evt_market_coin_sold then
						-- Nothing
					elseif slot1.cli_label == slot4.evt_market_silver_sold then
						-- Nothing
					elseif slot1.cli_label == slot4.evt_dungeon_stone_fight then
						JumpController:getInstance():jumpViewByEvtData({
							17
						})
					elseif slot1.cli_label == slot4.evt_shipping then
						JumpController:getInstance():jumpViewByEvtData({
							18
						})
					elseif slot1.cli_label == slot4.evt_escort_enter or slot1.cli_label == slot4.evt_escort_fight then
						MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.escort)
					elseif slot1.cli_label == slot4.evt_endless_fight then
						JumpController:getInstance():jumpViewByEvtData({
							43
						})
					elseif slot1.cli_label == slot4.evt_mystery_buy then
						if slot1.target == 1 then
							JumpController:getInstance():jumpViewByEvtData({
								15,
								MallConst.MallType.GodShop
							})
						elseif slot1.target == 2 then
							JumpController:getInstance():jumpViewByEvtData({
								15,
								MallConst.MallType.Recovery
							})
						elseif slot1.target == 3 then
							JumpController:getInstance():jumpViewByEvtData({
								15,
								MallConst.MallType.ScoreShop
							})
						elseif slot1.target == 4 then
							JumpController:getInstance():jumpViewByEvtData({
								6
							})
						else
							JumpController:getInstance():jumpViewByEvtData({
								15,
								MallConst.MallType.Recovery
							})
						end
					elseif slot1.cli_label == slot4.evt_partner_stone_all_lv then
						-- Nothing
					elseif slot1.cli_label == slot4.evt_partner_star then
						JumpController:getInstance():jumpViewByEvtData({
							19
						})
					elseif slot1.cli_label == slot4.evt_hallows_all_step then
						JumpController:getInstance():jumpViewByEvtData({
							20
						})
					elseif slot1.cli_label == slot4.evt_guild_war then
						JumpController:getInstance():jumpViewByEvtData({
							21
						})
					elseif slot1.cli_label == slot4.evt_endless_pass then
						Endless_trailController:getInstance():openEndlessMainWindow(true)
					elseif slot1.cli_label == slot4.evt_partner_decompose then
						JumpController:getInstance():jumpViewByEvtData({
							22
						})
					elseif slot1.cli_label == slot4.evt_partner_star_up then
						JumpController:getInstance():jumpViewByEvtData({
							23
						})
					elseif slot1.cli_label == slot4.evt_star_tower_floor_pass then
						JumpController:getInstance():jumpViewByEvtData({
							12
						})
					elseif slot1.cli_label == slot4.evt_recruit_high then
						JumpController:getInstance():jumpViewByEvtData({
							24
						})
					elseif slot1.cli_label == slot4.evt_expedition_fight then
						JumpController:getInstance():jumpViewByEvtData({
							25
						})
					elseif slot1.cli_label == slot4.evt_artifact_compose then
						JumpController:getInstance():jumpViewByEvtData({
							26,
							ForgeHouseConst.Tab_Index.Artifact
						})
					elseif slot1.cli_label == slot4.evt_friend_present then
						JumpController:getInstance():jumpViewByEvtData({
							4
						})
					elseif slot1.cli_label == slot4.evt_primus_fight then
						JumpController:getInstance():jumpViewByEvtData({
							27
						})
					elseif slot1.cli_label == slot4.evt_arena_elite_rank then
						JumpController:getInstance():jumpViewByEvtData({
							28
						})
					elseif slot1.cli_label == slot4.evt_sky_ladder_rank then
						JumpController:getInstance():jumpViewByEvtData({
							29
						})
					elseif slot1.cli_label == slot4.evt_equipment_compound then
						JumpController:getInstance():jumpViewByEvtData({
							26,
							ForgeHouseConst.Tab_Index.Equip
						})
					elseif slot1.cli_label == slot4.evt_worship then
						JumpController:getInstance():jumpViewByEvtData({
							51
						})
					elseif slot1.cli_label == slot4.evt_get_speciality or slot1.cli_label == slot4.evt_get_furniture or slot1.cli_label == slot4.evt_travel_time then
						JumpController:getInstance():jumpViewByEvtData({
							51
						})
					elseif slot1.cli_label == slot4.evt_planes_kill_guard then
						JumpController:getInstance():jumpViewByEvtData({
							68
						})
					end
				end
			end
		end
	end
end

function TaskController.on10400(slot0, slot1)
	slot0.model:addTaskList(slot1.quest_list, false, true)
end

function TaskController.on10403(slot0, slot1)
	slot0.model:addTaskList(slot1.quest_list)
end

function TaskController.on10409(slot0, slot1)
	slot0.model:addTaskList(slot1.quest_list, true)
end

function TaskController.on10406(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		slot0.model:setTaskCompleted(slot1.id)
	end
end

function TaskController.requestSubmitTask(slot0, slot1)
	slot0:SendProtocal(10406, {
		id = slot1
	})
end

function TaskController.on16400(slot0, slot1)
	slot0.model:addFeatList(slot1.feat_list, false, true)
end

function TaskController.on16401(slot0, slot1)
	slot0.model:addFeatList(slot1.feat_list, true)
end

function TaskController.on16402(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:setFeatCompleted(slot1.id)
	end
end

function TaskController.requestSubmitFeat(slot0, slot1)
	slot0:SendProtocal(16402, {
		id = slot1
	})
end

function TaskController.requestActivityInfo(slot0)
	slot0:SendProtocal(20300, {})
end

function TaskController.on20300(slot0, slot1)
	slot0.model:updateActivityData(slot1.activity_box)
end

function TaskController.requestGetActivityAwards(slot0, slot1)
	slot0:SendProtocal(20301, {
		activity = slot1
	})
end

function TaskController.on20301(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:updateSingleActivityData(slot1.activity)
	end
end

function TaskController.handle25810(slot0, slot1)
	slot0.model:updateTaskExpList(slot1)
end

function TaskController.handle25811(slot0, slot1)
	slot0.model:updateTaskExpList(slot1, true)
	GlobalEvent:getInstance():Fire(TaskEvent.TASK_EXP_UPDATE_EVENT)
end

function TaskController.sender25812(slot0, slot1)
	slot0:SendProtocal(25812, {
		id = slot1
	})
end

function TaskController.handle25812(slot0, slot1)
	if Config.RoomFeatData.data_const.home_world_feat and slot2.val == slot1.id then
		HomeworldController:getInstance():openHomeworldUnlockKeyPanel(true)
	end

	slot0.model:updateTaskExpDataByID(slot1.id, slot1.finish_time)
	GlobalEvent:getInstance():Fire(TaskEvent.TASK_EXP_UPDATE_TINE_EVENT)
end

function TaskController.openTaskSharePanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.task_share_panel ~= nil then
			slot0.task_share_panel:close()

			slot0.task_share_panel = nil
		end
	else
		if slot0.task_share_panel == nil then
			slot0.task_share_panel = TaskSharePanel.New()
		end

		if slot0.task_share_panel:isOpen() == false then
			slot0.task_share_panel:open(slot2)
		end
	end
end

function TaskController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
