MainSceneController = MainSceneController or BaseClass(BaseController)
slot0 = GlobalEvent:getInstance()
slot1 = table.insert

function MainSceneController.config(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.has_init = false
end

function MainSceneController.registerProtocals(slot0)
	slot0:RegisterProtocal(10304, "handle10304")
	slot0:RegisterProtocal(20063, "handle20063")
	slot0:RegisterProtocal(10955, "handle10955")
end

function MainSceneController.registerEvents(slot0)
	if slot0.init_main_event == nil then
		slot0.init_main_event = uv0:Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_main_event)

			uv0.init_main_event = nil

			RenderMgr:getInstance():start()
			GlobalEvent:getInstance():Fire(SceneEvent.FIRST_TIME_LOAD_FINISH)

			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if uv0.role_vo ~= nil and uv0.update_self_event == nil then
				uv0.update_self_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
					if slot0 == "lev" or slot0 == "open_day" then
						uv0:checkBuildLockStatus()
					end
				end)
			end
		end)
	end

	if slot0.world_lev_event2 == nil then
		slot0.world_lev_event2 = GlobalEvent:getInstance():Bind(RoleEvent.WORLD_LEV, function ()
			uv0:checkBuildLockStatus()
		end)
	end

	if slot0.update_drama_max_event == nil then
		slot0.update_drama_max_event = uv0:Bind(Battle_dramaEvent.BattleDrama_Update_Max_Id, function (slot0)
			if uv0.has_init == false then
				uv0.has_init = true

				uv0:createBuildVo()
				uv0:requestFightStatus()
			else
				uv0:checkBuildLockStatus()
			end
		end)
	end

	if slot0.move_to_builditem_event == nil then
		slot0.move_to_builditem_event = uv0:Bind(SceneEvent.MoveToBuildEvent, function (slot0, slot1, slot2)
			if uv0.main_scene then
				uv0.main_scene:movoToBuildPos(slot0, slot1, slot2)
			end
		end)
	end

	if slot0.battle_enter_event == nil then
		slot0.battle_enter_event = uv0:Bind(SceneEvent.ENTER_FIGHT, function (slot0)
			if slot0 == BattleConst.Fight_Type.Nil then
				return
			end

			if BaseView.winMap and next(BaseView.winMap) ~= nil then
				for slot4, slot5 in ipairs(BaseView.winMap) do
					if not slot5.is_before_battle then
						slot5.enter_battle_status = slot5:getVisible()
						slot5.is_before_battle = true

						if slot5.enter_battle_status == true then
							slot5:setVisible(false)
						end
					end
				end
			end

			uv0:handleSceneStatus(false)
		end)
	end

	if slot0.battle_exit_event == nil then
		slot0.battle_exit_event = uv0:Bind(SceneEvent.EXIT_FIGHT, function (slot0)
			if slot0 == BattleConst.Fight_Type.Nil then
				return
			end

			slot1 = true

			if BaseView.winMap and next(BaseView.winMap) ~= nil then
				for slot5, slot6 in ipairs(BaseView.winMap) do
					if slot6.setVisible then
						if slot6.enter_battle_status == nil then
							slot6.enter_battle_status = true
						end

						slot6:setVisible(slot6.enter_battle_status)

						if slot1 == true and slot6.win_type == WinType.Full and slot6.enter_battle_status == true then
							slot1 = false
						end

						slot6.is_before_battle = false
					end
				end
			end

			if slot1 == true and not MainuiController:getInstance():isInSkySceneOrDramaScene() then
				uv0:handleSceneStatus(true)
			end
		end)
	end

	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = uv0:Bind(LoginEvent.RE_LINK_GAME, function ()
			uv0:requestFightStatus()
		end)
	end
end

function MainSceneController.handle10304(slot0, slot1)
	if slot0.main_scene == nil then
		slot0:enterScene(true, slot1.play_video)

		if log_enter_city then
			log_enter_city(LoginController:getInstance():getModel():getLoginData().usrName)
		end
	end
end

function MainSceneController.enterScene(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.main_scene then
			slot0.main_scene:DeleteMe()

			slot0.main_scene = nil
		end
	else
		if slot0.main_scene == nil then
			slot3 = Config.city_data[1]

			if USESCENEMAKELIFEBETTER == true then
				slot3 = Config.city_data[2]
			end

			slot0.main_scene = CenterCityScene.New(slot3)
		end

		slot0:handleSceneStatus(true, true)
	end
end

function MainSceneController.videoPlayer(slot0)
	if PLATFORM == cc.PLATFORM_OS_WINDOWS or PLATFORM == cc.PLATFORM_OS_MAC then
		slot0:handleSceneStatus(true)

		return
	end

	slot1 = "res/resource/login/gamecg.mp4"

	if cc.FileUtils:getInstance():isFileExist(cc.FileUtils:getInstance():getWritablePath() .. "assets/res/resource/login/gamecg.mp4") then
		slot1 = slot2
	end

	if cc.FileUtils:getInstance():isFileExist(cc.FileUtils:getInstance():getWritablePath() .. "tryver/assets/res/resource/login/gamecg.mp4") then
		slot1 = slot3
	end

	if not cc.FileUtils:getInstance():isFileExist(slot1) then
		slot0:handleSceneStatus(true)

		return
	end

	if slot0.is_playing_video == true then
		return
	end

	slot0.is_playing_video = true

	AudioManager:getInstance():stopMusic()

	function slot5(slot0)
		slot0:stop()
		slot0:runAction(cc.RemoveSelf:create(true))

		uv0.is_playing_video = false

		uv0:handleSceneStatus(true)
		RoleController:getInstance():restartPlayRename()
	end

	slot6 = ccexp.VideoPlayer:create()

	slot6:setAnchorPoint(cc.p(0.5, 0.5))
	slot6:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot6:setFullScreenEnabled(true)
	slot6:setPosition(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
	slot6:addEventListener(function (slot0, slot1)
		if slot1 == ccexp.VideoPlayerEvent.PLAYING then
			-- Nothing
		elseif slot1 == ccexp.VideoPlayerEvent.PAUSED then
			-- Nothing
		elseif slot1 == ccexp.VideoPlayerEvent.STOPPED then
			-- Nothing
		elseif slot1 == ccexp.VideoPlayerEvent.COMPLETED then
			uv0(uv1)
		end
	end)
	ViewManager:getInstance():getLayerByTag(ViewMgrTag.LOADING_TAG):addChild(slot6, 998)

	if IS_IOS_PLATFORM == true and slot6.setControlStyle then
		slot6:setControlStyle(1)
		slot6:setUserInteractionEnabled(false)
	end

	slot6:setFileName(slot1)
	slot6:play()
	slot6:setTouchEnabled(true)
	slot6:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0(slot0)
		end
	end)
end

function MainSceneController.getPlayVideoStatus(slot0)
	return slot0.is_playing_video
end

function MainSceneController.handleSceneStatus(slot0, slot1, slot2)
	if slot0.main_scene == nil then
		return
	end

	if slot2 == true and NEEDCHANGEENTERSTATUS and NEEDCHANGEENTERSTATUS ~= 0 then
		-- Nothing
	else
		slot0.main_scene:setVisible(slot1)

		if slot1 == true then
			slot0.main_scene:playBackgroundMusic()
		end
	end

	MainuiController:getInstance():openMainUI(slot1)
end

function MainSceneController.showMainSceneEffect(slot0, slot1, slot2, slot3, slot4)
	if slot0.main_scene then
		slot0.main_scene:showSceneEffectById(slot1, slot2, slot3, slot4)
	end
end

function MainSceneController.moveToCenterPos(slot0)
	if slot0.main_scene then
		slot0.main_scene:moveToCenterPos()
	end
end

function MainSceneController.getMainCenterScene(slot0)
	if slot0.main_scene then
		return slot0.main_scene.root
	end
end

function MainSceneController.getCenterCityBuildById(slot0, slot1)
	if slot0.main_scene then
		return slot0.main_scene:getBuildById(slot1)
	end
end

function MainSceneController.openBuild(slot0, slot1, slot2)
	if slot1 == CenterSceneBuild.shop then
		MallController:getInstance():openMallPanel(true)
	elseif slot1 == CenterSceneBuild.seerpalace then
		SeerpalaceController:getInstance():openSeerpalaceMainWindow(true)
	elseif slot1 == CenterSceneBuild.arena then
		ArenaController:getInstance():requestOpenArenWindow(slot2)
	elseif slot1 == CenterSceneBuild.summon then
		PartnersummonController:getInstance():openPartnerSummonWindow(true)
		PartnersummonController:getInstance():getModel():setOpenPartnerSummonFlag(true)
	elseif slot1 == CenterSceneBuild.library then
		HeroController:getInstance():openHeroLibraryMainWindow(true)
	elseif slot1 == CenterSceneBuild.startower then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.StarTower)
	elseif slot1 == CenterSceneBuild.mall then
		ForgeHouseController:getInstance():openForgeHouseView(true)
	elseif slot1 == CenterSceneBuild.variety then
		MallController:getInstance():openVarietyStoreWindows(true)
	elseif slot1 == CenterSceneBuild.guild then
		HeroController:getInstance():openHeroResetWindow(true, HeroConst.SacrificeType.eHeroFuse)
	elseif slot1 == CenterSceneBuild.adventure then
		AdventureActivityController:getInstance():openAdventureActivityMainWindow(true)
	elseif slot1 == CenterSceneBuild.ladder then
		CrossgroundController:getInstance():openCrossGroundMainWindow(true)
	elseif slot1 == CenterSceneBuild.crossshow then
		CrossshowController:getInstance():openCrossshowMainWindow(true)
	elseif slot1 == CenterSceneBuild.home then
		HomeworldController:getInstance():requestOpenMyHomeworld()
	elseif slot1 == CenterSceneBuild.resonate then
		HeroController:getInstance():openHeroResonateWindow(true)
	elseif slot1 == CenterSceneBuild.luckytreasure then
		ActionController:getInstance():openLuckyTreasureWin(true)
	elseif slot1 == CenterSceneBuild.em_fruit then
		EmoguoshiController:getInstance():openEmoguoMainView(true)
	end
end

function MainSceneController.createBuildVo(slot0)
	if slot0.role_vo == nil then
		return
	end

	if BattleDramaController:getInstance():getModel():getDramaData() == nil then
		return
	end

	slot0.build_list_vo = {}
	slot2 = Config.city_data[1]

	if USESCENEMAKELIFEBETTER then
		slot2 = Config.city_data[2]
	end

	for slot6, slot7 in ipairs(slot2.building_list) do
		if slot7.type == BuildItemType.build and Config.CityData.data_base[slot7.bid] ~= nil and slot8.activate ~= nil then
			slot9 = false

			for slot13, slot14 in ipairs(slot8.activate) do
				slot16 = slot14[2]
				slot17 = 0

				if slot14[1] == "dun" then
					slot17 = slot1.max_dun_id
				elseif slot15 == "lev" then
					slot17 = slot0.role_vo.lev
				elseif slot15 == "open_day" then
					slot17 = slot0.role_vo.open_day
				elseif slot15 == "world_lev" and RoleController:getInstance():getModel():getWorldLev() then
					slot17 = slot18
				end

				if slot17 < slot16 then
					slot9 = true

					break
				end
			end

			slot10 = BuildVo.New(slot7, slot9, slot8.activate, slot8.desc, slot8.is_verifyios)

			if slot0.cache_tips_list and slot0.cache_tips_list[slot7.bid] then
				slot10:setTipsStatus(slot0.cache_tips_list[slot7.bid])

				slot0.cache_tips_list[slot7.bid] = nil
			end

			slot0.build_list_vo[slot7.bid] = slot10
		end
	end

	uv0:Fire(SceneEvent.CreateBuildVoOver)
end

function MainSceneController.getBuildList(slot0)
	return slot0.build_list_vo
end

function MainSceneController.getBuildVo(slot0, slot1)
	if slot0.build_list_vo and slot0.build_list_vo[slot1] then
		return slot0.build_list_vo[slot1]
	end
end

function MainSceneController.checkBuildLockStatus(slot0)
	if BattleDramaController:getInstance():getModel():getDramaData() == nil or slot0.role_vo == nil then
		return
	end

	if slot0.build_list_vo and slot0.role_vo then
		for slot6, slot7 in pairs(slot0.build_list_vo) do
			if slot7.activate ~= nil and slot7.is_lock == true then
				slot8 = false

				for slot12, slot13 in ipairs(slot7.activate) do
					slot15 = slot13[2]
					slot16 = 0

					if slot13[1] == "dun" then
						slot16 = slot1.max_dun_id
					elseif slot14 == "lev" then
						slot16 = slot0.role_vo.lev
					elseif slot14 == "open_day" then
						slot16 = slot0.role_vo.open_day
					elseif slot14 == "world_lev" and RoleController:getInstance():getModel():getWorldLev() then
						slot16 = slot17
					end

					if slot16 < slot15 then
						slot8 = true

						break
					end
				end

				if slot8 ~= slot7.is_lock then
					slot7:setLockStatus(slot8)
				end
			end
		end
	end
end

function MainSceneController.handle10955(slot0, slot1)
	if slot0.build_list_vo == nil then
		return
	end

	if slot0.build_list_vo[CenterSceneBuild.summon] and slot1.key == 1 then
		slot3:setSpecialGroupId(slot1.val)
	end
end

function MainSceneController.send10956(slot0, slot1)
	slot0:SendProtocal(10956, {
		key = 1,
		val = slot1
	})
end

function MainSceneController.setBuildRedStatus(slot0, slot1, slot2)
	if slot0.build_list_vo == nil or slot0.build_list_vo[slot1] == nil then
		if slot0.cache_tips_list == nil then
			slot0.cache_tips_list = {}
		end

		if type(slot2) == "table" then
			if slot0.cache_tips_list[slot1] == nil then
				slot0.cache_tips_list[slot1] = {}
			end

			if #slot2 > 1 then
				for slot6, slot7 in pairs(slot2) do
					if slot7.bid ~= nil and type(slot7.bid) == "number" then
						slot0.cache_tips_list[slot1][slot7.bid] = slot7
					end
				end
			elseif slot2.bid ~= nil and type(slot2.bid) == "number" then
				slot0.cache_tips_list[slot1][slot2.bid] = slot2
			end
		else
			slot0.cache_tips_list[slot1] = slot2
		end
	else
		slot0.build_list_vo[slot1]:setTipsStatus(slot2)
	end

	MainuiController:getInstance():checkMainSceneIconStatus()
end

function MainSceneController.clearBuildRedStatus(slot0, slot1)
	if slot0.build_list_vo == nil or slot0.build_list_vo[slot1] == nil then
		return
	end

	if slot0.cache_tips_list == nil then
		slot0.cache_tips_list = {}
	end

	slot0.cache_tips_list[slot1] = nil

	if slot0.build_list_vo[slot1] ~= nil then
		slot2:clearTipsStatus()
	end

	MainuiController:getInstance():checkMainSceneIconStatus()
end

function MainSceneController.changeMainCityTimeType(slot0, slot1)
	if slot0.main_scene then
		slot0.main_scene:setTimeType(slot1)
	end
end

function MainSceneController.getMainScene(slot0)
	return slot0.main_scene
end

function MainSceneController.getBuildVoList(slot0)
	return slot0.build_list_vo
end

function MainSceneController.DeleteMe(slot0)
	slot0:enterScene(false)

	if slot0.role_vo ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.role_vo:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.role_vo = nil
	end

	if slot0.init_main_event ~= nil then
		uv0:UnBind(slot0.init_main_event)

		slot0.init_main_event = nil
	end

	if slot0.update_drama_max_event ~= nil then
		uv0:UnBind(slot0.update_drama_max_event)

		slot0.update_drama_max_event = nil
	end

	if slot0.move_to_builditem_event ~= nil then
		uv0:UnBind(slot0.move_to_builditem_event)

		slot0.move_to_builditem_event = nil
	end

	if slot0.battle_enter_event ~= nil then
		uv0:UnBind(slot0.battle_enter_event)

		slot0.battle_enter_event = nil
	end

	if slot0.battle_exit_event ~= nil then
		uv0:UnBind(slot0.battle_exit_event)

		slot0.battle_exit_event = nil
	end

	if slot0.re_link_game_event ~= nil then
		uv0:UnBind(slot0.re_link_game_event)

		slot0.re_link_game_event = nil
	end
end

function MainSceneController.requestFightStatus(slot0)
	slot0:SendProtocal(20063, {})
end

function MainSceneController.handle20063(slot0, slot1)
	if slot0.build_list_vo == nil or next(slot0.build_list_vo) == nil then
		return
	end

	slot2 = {
		[slot6] = {}
	}

	for slot6, slot7 in pairs(Config.CityData.data_base) do
		-- Nothing
	end

	BattleController:getInstance():setCurFightInfo(slot1.type_list)

	if slot1.type_list then
		for slot6, slot7 in ipairs(slot1.type_list) do
			if slot0:getBuildIdByCombat(slot7.combat_type) then
				slot2[slot8][slot7.combat_type] = true
			end
		end
	end

	for slot6, slot7 in pairs(slot2) do
		if slot0.build_list_vo[slot6] then
			slot8:setFightStatus(slot7)
		end
	end
end

function MainSceneController.getBuildIdByCombat(slot0, slot1)
	if slot1 == BattleConst.Fight_Type.Arena then
		return CenterSceneBuild.arena
	elseif slot1 == BattleConst.Fight_Type.StarTower then
		return CenterSceneBuild.startower
	elseif slot1 == BattleConst.Fight_Type.Adventrue or slot1 == BattleConst.Fight_Type.AdventrueMine or slot1 == BattleConst.Fight_Type.ElementWar or slot1 == BattleConst.Fight_Type.HeavenWar then
		return CenterSceneBuild.adventure
	elseif slot1 == BattleConst.Fight_Type.LadderWar or slot1 == BattleConst.Fight_Type.EliteMatchWar or slot1 == BattleConst.Fight_Type.EliteKingMatchWar or slot1 == BattleConst.Fight_Type.CrossArenaWar or slot1 == BattleConst.Fight_Type.Arean_Team or slot1 == BattleConst.Fight_Type.CrossChampion then
		return CenterSceneBuild.ladder
	end
end

function MainSceneController.checkBuildIsOpen(slot0, slot1)
	if Config.CityData.data_base[slot1] == nil then
		return false
	end

	slot3 = BattleDramaController:getInstance():getModel():getDramaData()
	slot4 = RoleController:getInstance():getRoleVo()

	if slot2 ~= nil and slot2.activate ~= nil then
		slot5 = slot2.activate[1]
		slot7 = slot5[2]
		slot8 = 0

		if slot5[1] == "dun" then
			if slot3 then
				slot8 = slot3.max_dun_id
			end
		elseif slot6 == "lev" then
			if slot4 then
				slot8 = slot4.lev
			end
		elseif slot6 == "world_lev" and RoleController:getInstance():getModel():getWorldLev() then
			slot8 = slot9
		end

		return slot7 <= slot8, slot2.desc
	end

	return false, slot2.desc
end
