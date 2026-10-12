GuideMainView = GuideMainView or class("GuideMainView", function ()
	return ccui.Layout:create()
end)

function GuideMainView.ctor(slot0, slot1)
	slot0.ctrl = slot1
	slot0.is_open = false
	slot0.ticket = GlobalTimeTicket:getInstance()
	slot0.is_true_start = false
	slot0.had_move = false
	slot0.time_num = 0
	slot0.time_interval = 10
	slot0.size = cc.size(display.width, display.height)
	slot0.center = cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setTouchEnabled(true)
	slot0:setPosition(slot0.center)

	slot0.skip_btn = createImage(slot0, PathTool.getResFrame("common", "txt_cn_common_30011"), display.width - 90, display.height - 126, cc.p(0.5, 0.5), true, 10)

	slot0.skip_btn:setTouchEnabled(true)
	breatheShineAction(slot0.skip_btn)
	slot0:registerEvent()
end

function GuideMainView.open(slot0, slot1)
	if slot0.is_open == true then
		return
	end

	if slot1 == nil or slot1.act == nil or next(slot1.act) == nil then
		return
	end

	slot0.is_open = true

	if slot0:getParent() == nil then
		ViewManager:getInstance():addToLayerByTag(slot0, ViewMgrTag.MSG_TAG)
	end

	slot0.target = nil
	slot0.root_wnd = nil
	slot0.act_config = slot1
	slot0.act_list = deepCopy(slot1.act)
	slot0.cur_zone_list = {}
	slot0.need_save = FALSE
	slot0.guide_step = 0
	slot0.guide_cache_data = RoleEnv:getInstance():get(RoleEnv.keys.guide_step_list, {})

	slot0:playNextGuide()
end

function GuideMainView.registerEvent(slot0)
	slot0.skip_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			uv0:endPlayGuide(true)
		end
	end)
	slot0:addTouchEventListener(function (slot0, slot1)
		if uv0.wait_delay ~= 0 then
			return
		end

		if slot1 == ccui.TouchEventType.began then
			if uv0.rect then
				if cc.rectContainsPoint(uv0.rect, uv0:convertToNodeSpace(slot0:getTouchBeganPosition())) then
					uv0:setSwallowTouches(false)
				else
					uv0:showGuideNotice()
					uv0:setSwallowTouches(true)
				end
			end
		end
	end)
end

function GuideMainView.checkDoNextGuide(slot0)
	if not tolua.isnull(slot0.target) then
		slot0.target:setTouchEnabled(false)
	end

	slot0:setSwallowTouches(true)

	slot0.rect = nil

	if slot0.need_save == FALSE then
		slot0:readyDoNextGuide()
	else
		if slot0.act_config == nil then
			slot0:endPlayGuide()

			return
		end

		slot0.ctrl:checkNetWorkNormal(slot0.act_config.id, slot0.guide_step)
	end

	if slot0.close_all == TRUE then
		BaseView.closeAllView()
	end
end

function GuideMainView.doNextGuideFromServer(slot0, slot1, slot2)
	if slot0.act_config == nil then
		return
	end

	if slot0.act_config.id ~= slot1 or slot0.guide_step ~= slot2 then
		return
	end

	slot0:readyDoNextGuide()
end

function GuideMainView.readyDoNextGuide(slot0)
	if slot0.notice_container and not tolua.isnull(slot0.notice_container) then
		slot0.notice_container:setVisible(false)
	end

	if slot0.backgroundLayer and not tolua.isnull(slot0.backgroundLayer) then
		slot0.backgroundLayer:setVisible(false)
	end

	if slot0.clipNode and not tolua.isnull(slot0.clipNode) then
		slot0.clipNode:setVisible(false)
	end

	if slot0.guide_effect and not tolua.isnull(slot0.guide_effect) then
		doStopAllActions(slot0.guide_effect)
		slot0.guide_effect:setVisible(false)
	end

	if slot0.guide_tips_bg and not tolua.isnull(slot0.guide_tips_bg) then
		slot0.guide_tips_bg:setVisible(false)
	end

	if slot0.txt_tips and not tolua.isnull(slot0.txt_tips) then
		slot0.txt_tips:setVisible(false)
	end

	if slot0.target and not tolua.isnull(slot0.target) and slot0.target.clearGuideListener then
		slot0.target:clearGuideListener()
	end

	if slot0.delay == 0 then
		slot0:playNextGuide()
	else
		slot0:delayPlayNextGuide(slot0.delay)
	end
end

function GuideMainView.delayPlayNextGuide(slot0, slot1)
	slot0.ticket:remove("delayPlayNextGuide")
	slot0.ticket:add(function ()
		uv0:playNextGuide()
	end, slot1, 1, "delayPlayNextGuide")
end

function GuideMainView.saveGuideStep(slot0)
	if slot0.need_save ~= FALSE then
		if slot0.guide_cache_data[slot0.act_config.id] == nil then
			slot0.guide_cache_data[slot0.act_config.id] = {}
		end

		slot0.guide_cache_data[slot0.act_config.id][slot0.guide_step] = true

		RoleEnv:getInstance():set(RoleEnv.keys.guide_step_list, slot0.guide_cache_data, true)
	end

	if slot0.act_config ~= nil and slot0.act_config.special_step ~= 0 and next(slot0.act_config.special_step) ~= nil then
		for slot4, slot5 in ipairs(slot0.act_config.special_step) do
			slot7 = slot5[2] or 0
			slot8 = slot5[3] or 0

			if (slot5[1] or 0) == slot0.guide_step then
				if slot0.guide_cache_data[slot0.act_config.id] == nil then
					slot0.guide_cache_data[slot0.act_config.id] = {}
				end

				for slot12 = slot7, slot8 do
					if not slot0.guide_cache_data[slot0.act_config.id][slot12] then
						slot0.guide_cache_data[slot0.act_config.id][slot12] = true
						slot0.cur_zone_list[slot12] = true
					end
				end

				RoleEnv:getInstance():set(RoleEnv.keys.guide_step_list, slot0.guide_cache_data, true)

				break
			end
		end
	end

	if slot0.act_config ~= nil and slot0.act_config.over_step ~= 0 and slot0.act_config.over_step == slot0.guide_step then
		if slot0.guide_cache_data[slot0.act_config.id] == nil then
			slot0.guide_cache_data[slot0.act_config.id] = {}
		end

		slot0.guide_cache_data[slot0.act_config.id][RoleEnv.keys.guide_over_step] = true

		RoleEnv:getInstance():set(RoleEnv.keys.guide_step_list, slot0.guide_cache_data, true)
	end
end

function GuideMainView.playNextGuide(slot0)
	slot0:saveGuideStep()
	slot0:clearTargetInfo()

	if slot0.act_list == nil or next(slot0.act_list) == nil then
		slot0:endPlayGuide()
	else
		slot0.target_data = table.remove(slot0.act_list, 1)
		slot0.guide_step = slot0.guide_step + 1

		if slot0.guide_cache_data[slot0.act_config.id] and slot0.guide_cache_data[slot0.act_config.id][slot0.guide_step] == true and not slot0.cur_zone_list[slot0.guide_step] then
			slot0:playNextGuide()
		elseif slot0.target_data ~= nil and type(slot0.target_data) == "table" then
			if slot0.target_data[1] == "checkstatus" then
				slot0:findRootWndByParams4()
			elseif slot1 == "openview" then
				slot0:findRootWndByParams3()
			elseif slot1 == "conditonstatus" then
				slot0:findRootWndByCondition()
			elseif slot1 == "emptystep" then
				slot0:playNextGuide()
			elseif #slot0.target_data == 2 then
				slot0:findRootWndByParams2()
			else
				slot0:findTargetByParams()
			end

			slot0:addSkipTimeTicket()
		end
	end
end

function GuideMainView.findTargetByParams(slot0)
	if slot0.target_data ~= nil and type(slot0.target_data) == "table" then
		slot0.delay = slot0.target_data[2] or 0
		slot3 = slot0.target_data[4] or 0
		slot0.need_save = slot0.target_data[5] or 0
		slot0.close_all = slot0.target_data[6] or 0
		slot0.wait_delay = slot0.target_data[7] or 0
		slot0.show_guide_step = slot0.target_data[8] or TRUE
		slot0.figer_off_x = slot0.target_data[9] or 0
		slot0.figer_off_y = slot0.target_data[10] or 0
		slot0.guide_msg = slot0.target_data[11] or ""
		slot0.sprite_off_x = slot0.target_data[12] or 0
		slot0.sprite_off_y = slot0.target_data[13] or 0
		slot0.sprite_flip = slot0.target_data[14] or 0
		slot0.bg_opacity = slot0.target_data[15] or 100
		slot0.sound_name = slot0.target_data[16] or ""

		if slot0.target_data[1] == "name" then
			slot0.target = findNodeByName(slot0.root_wnd, slot0.target_data[3])
		elseif slot1 == "tag" then
			slot0.target = findNodeByTag(slot0.root_wnd, tonumber(slot2))
		end

		slot0.time_num = slot0.time_num + 1

		slot0:removeTimer()

		if not tolua.isnull(slot0.target) and slot0.target.isVisible and slot0.target:isVisible() then
			slot0:drawTargetRect()

			if slot0.wait_delay == 0 then
				if slot3 == TRUE then
					function slot0.target.guide_call_back()
						uv0:checkDoNextGuide()
					end
				elseif slot0.target.addTouchGuideListener then
					slot0.target:addTouchGuideListener(function (slot0)
						if slot0 == uv0.target then
							uv0:checkDoNextGuide()
						end
					end)
				end
			end
		elseif slot0.time_interval <= slot0.time_num then
			slot0:endPlayGuide(true)
		else
			slot0.add_timer = GlobalTimeTicket:getInstance():add(function ()
				uv0:findTargetByParams()
			end, 1, 1)
		end
	end
end

function GuideMainView.findRootWndByCondition(slot0)
	if slot0.target_data == nil or slot0.target_data[4] == nil then
		return
	end

	slot0.delay = slot0.target_data[3]
	slot2 = nil

	if slot0.target_data[2] == "partner" then
		slot2 = HeroController:getInstance():getHeroBagRoot()
	elseif slot1 == "battletopscene" then
		slot2 = BattleDramaController:getInstance():getBattleDramaUI()
	elseif slot1 == "battlesceneview" then
		slot2 = BattleController:getInstance():getCtrlBattleScene()
	elseif slot1 == "checkmainui" then
		if MainuiController:getInstance():getMainUIIndex() ~= MainuiConst.btn_index.main_scene then
			slot2 = MainuiController:getInstance():getMainUiRoot()
		end
	elseif slot1 == "adventurescene" then
		slot2 = AdventureController:getInstance():getAdventureRoot()
	elseif slot1 == "partnerform" then
		slot2 = HeroController:getInstance():getHeroFormRoot()
	elseif slot1 == "partnereinfoview" then
		slot2 = HeroController:getInstance():getHeroMianInfoRoot()
	elseif slot1 == "partnergofight" then
		slot2 = HeroController:getInstance():getHeroGoFightRoot()
	elseif slot1 == "hallowsactivitywindow" then
		slot2 = HallowsController:getInstance():getHallowsActivityRoot()
	elseif slot1 == "hallowspreview" then
		slot2 = HallowsController:getInstance():getHallowsPreviewRoot()
	elseif slot1 == "hallowswindow" then
		slot2 = HallowsController:getInstance():getHallowsRoot()
	elseif slot1 == "adventureevtview" then
		slot2 = AdventureController:getInstance():getAdventureEvtRoot()
	elseif slot1 == "esecsiceview" then
		slot2 = EsecsiceController:getInstance():getEsecsiceRoot()
	elseif slot1 == "stonedunview" then
		slot2 = Stone_dungeonController:getInstance():getStoneDungeonRoot()
	elseif slot1 == "varietystoreview" then
		slot2 = MallController:getInstance():getVarietyStoreRoot()
	elseif slot1 == "homeworldscene" then
		slot2 = HomeworldController:getInstance():getHomeworldRoot()
	elseif slot1 == "homeworldshop" then
		slot2 = HomeworldController:getInstance():getHomeShopRoot()
	elseif slot1 == "homemyunit" then
		if HomeworldController:getInstance():getHomeEditStatus() then
			slot2 = HomeworldController:getInstance():getHomeworldRoot()
		end
	elseif slot1 == "trainingcampview" then
		slot2 = TrainingcampController:getInstance():getTrainingcampRoot()
	elseif slot1 == "areascene" then
		slot2 = Area_sceneController:getInstance():getAreaSceneRoot()
	elseif slot1 == "planesmainview" then
		slot2 = PlanesController:getInstance():getPlanesMainRoot()
	elseif slot1 == "planesinfoview" then
		slot2 = PlanesController:getInstance():getPlanesInfoRoot()
	elseif slot1 == "elfinSelectview" then
		slot2 = ElfinController:getInstance():getElfinSelectRoot()
	elseif slot1 == "heavenmainview" then
		slot2 = HeavenController:getInstance():getHeavenMainWindowRoot()
	elseif slot1 == "equipclothview" then
		slot2 = HeroController:getInstance():getHeroHolyEquipClothPanelRoot()
	elseif slot1 == "adventureactivityview" then
		slot2 = AdventureActivityController:getInstance():getAdventureActivityWindowRoot()
	elseif slot1 == "heroresonateiew" then
		slot2 = HeroController:getInstance():getHeroResonateWindowRoot()
	end

	if slot2 == nil then
		if slot0.target_data[4][2] and next(slot3) then
			slot0.act_list = DeepCopy(slot3)
			slot0.guide_step = 0
		end
	else
		slot0.root_wnd = slot2

		if slot0.target_data[4][1] and next(slot3) then
			slot0.act_list = DeepCopy(slot3)
			slot0.guide_step = 0
		end
	end

	slot0:playNextGuide()
end

function GuideMainView.findRootWndByParams4(slot0)
	if slot0.target_data == nil then
		return
	end

	slot2 = slot0.target_data[3]
	slot0.delay = slot0.target_data[4]

	if slot0.target_data[2] == "centercity" and MainSceneController:getInstance():getCenterCityBuildById(slot2) ~= nil then
		slot0.root_wnd = MainSceneController:getInstance():getMainCenterScene()

		GlobalEvent:getInstance():Fire(SceneEvent.MoveToBuildEvent, slot2, false, slot0.delay)
	end

	slot0.time_num = slot0.time_num + 1

	slot0:removeTimer()

	if not tolua.isnull(slot0.root_wnd) and slot0.root_wnd.isVisible and slot0.root_wnd:isVisible() then
		if slot0.delay == 0 then
			slot0:playNextGuide()
		else
			slot0:delayPlayNextGuide(slot0.delay)
		end
	elseif slot0.time_interval <= slot0.time_num then
		slot0:endPlayGuide(true)
	else
		slot0.add_timer = GlobalTimeTicket:getInstance():add(function ()
			uv0:findRootWndByParams4()
		end, 1, 1)
	end
end

function GuideMainView.findRootWndByParams3(slot0)
	if slot0.target_data == nil then
		return
	end

	slot0.delay = slot0.target_data[3]

	if FILTER_CHARGE == false then
		if slot0.target_data[2] == "firstrecharge" then
			ActionController:getInstance():openFirstChargeView(true)
		elseif slot1 == "newfirstrecharge" or slot1 == "newfirstrecharge1" or slot1 == "newfirstrecharge2" or slot1 == "newfirstrecharge3" then
			NewFirstChargeController:getInstance():openNewFirstChargeView(true)
		elseif slot1 == "limittimeview" then
			LimitTimeActionController:getInstance():openLimitTimeGiftWindow(true)
		end
	end

	if slot0.delay == 0 then
		slot0:playNextGuide()
	else
		slot0:delayPlayNextGuide(slot0.delay)
	end
end

function GuideMainView.findRootWndByParams2(slot0)
	if slot0.target_data ~= nil and type(slot0.target_data) == "table" and #slot0.target_data == 2 then
		slot0.delay = slot0.target_data[2] or 0

		if slot0.target_data[1] == "mainui" then
			slot0.root_wnd = MainuiController:getInstance():getMainUiRoot()
		elseif slot1 == "summon" then
			slot0.root_wnd = PartnersummonController:getInstance():getSummonRoot()
		elseif slot1 == "summonresult" then
			slot0.root_wnd = PartnersummonController:getInstance():getSummonResultRoot()
		elseif slot1 == "partner" then
			slot0.root_wnd = HeroController:getInstance():getHeroBagRoot()
		elseif slot1 == "partnerform" then
			slot0.root_wnd = HeroController:getInstance():getHeroFormRoot()
		elseif slot1 == "battlesceneview" then
			slot0.root_wnd = BattleController:getInstance():getCtrlBattleScene()
		elseif slot1 == "partnereinfoview" then
			slot0.root_wnd = HeroController:getInstance():getHeroMianInfoRoot()
		elseif slot1 == "partnergofight" then
			slot0.root_wnd = HeroController:getInstance():getHeroGoFightRoot()
		elseif slot1 == "battlequickview" then
			slot0.root_wnd = BattleDramaController:getInstance():getDramBattleQuickRoot()
		elseif slot1 == "battletophookrewards" then
			slot0.root_wnd = BattleDramaController:getInstance():getDramaBattleHookRewardRoot()
		elseif slot1 == "battletoppassrewards" then
			slot0.root_wnd = BattleDramaController:getInstance():getDramaBattlePassRewardRoot()
		elseif slot1 == "battletopscene" then
			slot0.root_wnd = BattleDramaController:getInstance():getBattleDramaUI()
		elseif slot1 == "getitemview" then
			slot0.root_wnd = MainuiController:getInstance():getItemExhibtionRoot()
		elseif slot1 == "backpack" then
			slot0.root_wnd = BackpackController:getInstance():getBackpackRoot()
		elseif slot1 == "backpacksell" then
			slot0.root_wnd = BackpackController:getInstance():getBackpackSellRoot()
		elseif slot1 == "arenaloopview" then
			slot0.root_wnd = ArenaController:getInstance():getArenaRoot()
		elseif slot1 == "guildinitview" then
			slot0.root_wnd = GuildController:getInstance():getGuildInitRoot()
		elseif slot1 == "startowerview" then
			slot0.root_wnd = StartowerController:getInstance():getStarTowerRoot()
		elseif slot1 == "startowerchallengeview" then
			slot0.root_wnd = StartowerController:getInstance():getStarTowerChallengeRoot()
		elseif slot1 == "auguryview" then
			slot0.root_wnd = AuguryController:getInstance():getAuguryRoot()
		elseif slot1 == "summonshowview" then
			slot0.root_wnd = PartnersummonController:getInstance():getSummonShowRoot()
		elseif slot1 == "mallview" then
			slot0.root_wnd = MallController:getInstance():getMallRoot()
		elseif slot1 == "adventurescene" then
			slot0.root_wnd = AdventureController:getInstance():getAdventureRoot()
		elseif slot1 == "adventureevtview" then
			slot0.root_wnd = AdventureController:getInstance():getAdventureEvtRoot()
		elseif slot1 == "adventurenextfloor" then
			slot0.root_wnd = AdventureController:getInstance():getNextAlertRoot()
		elseif slot1 == "battleqingbaoview" then
			slot0.root_wnd = BattleDramaController:getInstance():getBattleQingbaoRoot()
		elseif slot1 == "tipssourceroot" then
			slot0.root_wnd = BackpackController:getInstance():getItemTipsSourceRoot()
		elseif slot1 == "skybattleresult" then
			slot0.root_wnd = BattleController:getInstance():getFinishView(BattleConst.Fight_Type.Adventrue)
		elseif slot1 == "activitywindow" then
			slot0.root_wnd = ActivityController:getInstance():getActivityRoot()
		elseif slot1 == "hallowswindow" then
			slot0.root_wnd = HallowsController:getInstance():getHallowsRoot()
		elseif slot1 == "hallowsactivitywindow" then
			slot0.root_wnd = HallowsController:getInstance():getHallowsActivityRoot()
		elseif slot1 == "hallowspreview" then
			slot0.root_wnd = HallowsController:getInstance():getHallowsPreviewRoot()
		elseif slot1 == "comptipsview" then
			slot0.root_wnd = TipsManager:getInstance():getCompTipsRoot()
		elseif slot1 == "esecsiceview" then
			slot0.root_wnd = EsecsiceController:getInstance():getEsecsiceRoot()
		elseif slot1 == "stonedunview" then
			slot0.root_wnd = Stone_dungeonController:getInstance():getStoneDungeonRoot()
		elseif slot1 == "varietystoreview" then
			slot0.root_wnd = MallController:getInstance():getVarietyStoreRoot()
		elseif slot1 == "sevenloginview" then
			slot0.root_wnd = ActionController:getInstance():getSevenLoginRoot()
		elseif slot1 == "welfareview" then
			slot0.root_wnd = WelfareController:getInstance():getWelfareRoot()
		elseif slot1 == "treasureview" then
			slot0.root_wnd = ActionController:getInstance():getTreasureRoot()
		elseif slot1 == "voyageview" then
			slot0.root_wnd = VoyageController:getInstance():getVoyageMainRoot()
		elseif slot1 == "strongerview" then
			slot0.root_wnd = StrongerController:getInstance():getStrongerRoot()
		elseif slot1 == "seerpalaceview" then
			slot0.root_wnd = SeerpalaceController:getInstance():getSeerpalaceMainRoot()
		elseif slot1 == "voyagedispatchview" then
			slot0.root_wnd = VoyageController:getInstance():getVoyageDispatchRoot()
		elseif slot1 == "homeworldscene" then
			slot0.root_wnd = HomeworldController:getInstance():getHomeworldRoot()
		elseif slot1 == "homeworldshop" then
			slot0.root_wnd = HomeworldController:getInstance():getHomeShopRoot()
		elseif slot1 == "homeworldshopbuy" then
			slot0.root_wnd = HomeworldController:getInstance():getHomeworldBuyRoot()
		elseif slot1 == "homeworldunlockkey" then
			slot0.root_wnd = HomeworldController:getInstance():getHomeworldUnlockKey()
		elseif slot1 == "trainingcampview" then
			slot0.root_wnd = TrainingcampController:getInstance():getTrainingcampRoot()
		elseif slot1 == "areascene" then
			slot0.root_wnd = Area_sceneController:getInstance():getAreaSceneRoot()
		elseif slot1 == "planesmainview" then
			slot0.root_wnd = PlanesController:getInstance():getPlanesMainRoot()
		elseif slot1 == "planesinfoview" then
			slot0.root_wnd = PlanesController:getInstance():getPlanesInfoRoot()
		elseif slot1 == "elfinSelectview" then
			slot0.root_wnd = ElfinController:getInstance():getElfinSelectRoot()
		elseif slot1 == "heavenmainview" then
			slot0.root_wnd = HeavenController:getInstance():getHeavenMainWindowRoot()
		elseif slot1 == "equipclothview" then
			slot0.root_wnd = HeroController:getInstance():getHeroHolyEquipClothPanelRoot()
		elseif slot1 == "adventureactivityview" then
			slot0.root_wnd = AdventureActivityController:getInstance():getAdventureActivityWindowRoot()
		elseif slot1 == "heroresonateiew" then
			slot0.root_wnd = HeroController:getInstance():getHeroResonateWindowRoot()
		end

		slot0.time_num = slot0.time_num + 1

		slot0:removeTimer()

		if not tolua.isnull(slot0.root_wnd) and slot0.root_wnd.isVisible and slot0.root_wnd:isVisible() then
			if slot0.delay == 0 then
				slot0:playNextGuide()
			else
				slot0:delayPlayNextGuide(slot0.delay)
			end
		elseif slot0.time_interval <= slot0.time_num then
			slot0:endPlayGuide(true)
		else
			slot0.add_timer = GlobalTimeTicket:getInstance():add(function ()
				uv0:findRootWndByParams2()
			end, 1, 1)
		end
	end
end

function GuideMainView.removeTimer(slot0)
	if slot0.add_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.add_timer)

		slot0.add_timer = nil
	end
end

function GuideMainView.removeSkipTimeTicket(slot0)
	if slot0.skip_time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.skip_time_ticket)

		slot0.skip_time_ticket = nil
	end

	if not tolua.isnull(slot0.skip_btn) then
		slot0.skip_btn:setVisible(false)
	end
end

function GuideMainView.addSkipTimeTicket(slot0)
	if slot0.act_config.skip == TRUE and slot0.skip_time_ticket == nil then
		slot0.skip_time_ticket = GlobalTimeTicket:getInstance():add(function ()
			if not tolua.isnull(uv0.skip_btn) then
				uv0.skip_btn:setVisible(true)
			end
		end, 5, 1)
	end
end

function GuideMainView.endPlayGuide(slot0, slot1)
	if slot0.act_config then
		slot0.ctrl:startPlayGuide(false, slot0.act_config.id, slot1)
	end
end

function GuideMainView.clearTargetInfo(slot0)
	if not tolua.isnull(slot0.target) then
		slot0.target:setTouchEnabled(true)

		if slot0.target.guide_call_back ~= nil then
			slot0.target.guide_call_back = nil
		end
	end

	slot0:removeTimer()
	slot0:removeSkipTimeTicket()

	slot0.cur_pos = nil
	slot0.need_save = FALSE
	slot0.target = nil
	slot0.delay = 0
	slot0.step = 0
	slot0.time_num = 0
end

function GuideMainView.drawTargetRect(slot0)
	if tolua.isnull(slot0.target) then
		slot0:endPlayGuide(true)

		return
	end

	slot1 = slot0.target:convertToWorldSpace(cc.p(0, 0))
	slot2 = slot0.target:getContentSize()
	slot3 = 1

	if slot0.target.getScale ~= nil then
		slot3 = slot0.target:getScale()
	end

	slot1 = slot0:convertToNodeSpace(slot1)
	slot0.rect = cc.rect(slot1.x, slot1.y, slot2.width, slot2.height)
	slot0.cur_pos = cc.p(slot1.x + slot3 * slot2.width / 2 + slot0.figer_off_x, slot1.y + slot3 * slot2.height / 2 + slot0.figer_off_y)

	if slot0.sound_name and slot0.sound_name ~= "" then
		AudioManager:getInstance():stopAllSoundByType(AudioManager.AUDIO_TYPE.Drama)
		AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.Drama, slot0.sound_name, false)
	end

	if slot0.show_guide_step == TRUE then
		slot4 = GuideController:getInstance():getGuideLastPos()

		if slot0.guide_effect == nil then
			slot5 = PlayerAction.action_1

			if slot4 then
				slot5 = PlayerAction.action_2
			end

			slot0.guide_effect = createEffectSpine(PathTool.getEffectRes(240), slot4 or slot0.cur_pos, cc.p(0.5, 0.5), true, slot5)

			slot0:addChild(slot0.guide_effect)
		else
			slot0.guide_effect:setVisible(true)
		end

		if slot4 then
			slot0.guide_effect:setToSetupPose()
			slot0.guide_effect:setAnimation(0, PlayerAction.action_2, true)

			slot5, slot6 = slot0.guide_effect:getPosition()

			if math.sqrt(math.pow(slot5 - slot0.cur_pos.x, 2) + math.pow(slot6 - slot0.cur_pos.y, 2)) / GuideConst.Finger_Speed < GuideConst.Finger_Min_Time then
				slot8 = GuideConst.Finger_Min_Time
			end

			slot0.guide_effect:runAction(cc.Sequence:create(cc.MoveTo:create(slot8, slot0.cur_pos), cc.CallFunc:create(function ()
				if uv0.guide_effect then
					uv0.guide_effect:setAnimation(0, PlayerAction.action_1, true)
				end
			end)))
		end

		GuideController:getInstance():setGuideLastPos(slot0.cur_pos)

		if slot0.guide_msg ~= "" then
			slot0:showLittleSpiritAndTips(slot1, slot2, slot3)

			if slot0.guide_effect then
				slot0.guide_effect:setVisible(true)
				slot0:showNoticeContainer()
			end
		else
			slot0:showNoticeContainer()
		end
	end

	if slot0.wait_delay ~= 0 then
		slot0:delayPlayNextGuide(slot0.wait_delay)
	end
end

function GuideMainView.DeleteMe(slot0)
	doStopAllActions(slot0.skip_btn)
	slot0:clearTargetInfo()
	slot0.ticket:remove("delayPlayNextGuide")

	if not tolua.isnull(slot0.guide_effect) then
		slot0.guide_effect:setVisible(false)
		slot0.guide_effect:clearTracks()
		slot0.guide_effect:runAction(cc.RemoveSelf:create(true))

		slot0.guide_effect = nil
	end

	if not tolua.isnull(slot0.touch_effect) then
		slot0.touch_effect:setVisible(false)
		slot0.touch_effect:clearTracks()
		slot0.touch_effect:runAction(cc.RemoveSelf:create(true))

		slot0.touch_effect = nil
	end

	if not tolua.isnull(slot0.guide_tips_bg) then
		slot0.guide_tips_bg:removeAllChildren()
		slot0.guide_tips_bg:removeFromParent()

		slot0.guide_tips_bg = nil
	end

	if not tolua.isnull(slot0.txt_tips) then
		slot0.txt_tips:removeAllChildren()
		slot0.txt_tips:removeFromParent()

		slot0.txt_tips = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

function GuideMainView.clearTouchEffect(slot0)
	if not tolua.isnull(slot0.touch_effect) then
		slot0.touch_effect:setVisible(false)
		slot0.touch_effect:clearTracks()
		slot0.touch_effect:runAction(cc.RemoveSelf:create(true))

		slot0.touch_effect = nil
	end
end

function GuideMainView.showGuideNotice(slot0)
	slot0:clearTouchEffect()

	if slot0.cur_pos == nil then
		return
	end

	if Config.EffectData.data_effect_info[198] and slot2 ~= "" then
		slot0:showNoticeContainer()

		if not tolua.isnull(slot0.notice_container) then
			slot0.notice_container:setStencil(createSprite(PathTool.getResFrame("common", "common_1032"), slot0.cur_pos.x, slot0.cur_pos.y, nil, cc.p(0.5, 0.5)))

			slot0.touch_effect = createEffectSpine(slot2, slot0.cur_pos, cc.p(0.5, 0.5), false, PlayerAction.action, function (slot0)
				uv0:clearTouchEffect()
			end)

			slot0.notice_container:addChild(slot0.touch_effect)
		end
	end
end

function GuideMainView.showNoticeContainer(slot0)
	if slot0.cur_pos == nil then
		return
	end

	if slot0.notice_container == nil then
		slot0.notice_container = cc.ClippingNode:create()

		slot0.notice_container:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.notice_container:setContentSize(slot0.size)
		slot0.notice_container:setCascadeOpacityEnabled(true)
		slot0.notice_container:setPosition(slot0.size.width / 2, slot0.size.height / 2)
		slot0.notice_container:setInverted(true)
		slot0.notice_container:setAlphaThreshold(0)
		slot0:addChild(slot0.notice_container, -1)
		slot0.notice_container:setStencil(createSprite(PathTool.getResFrame("common", "common_1032"), slot0.cur_pos.x, slot0.cur_pos.y, nil, cc.p(0.5, 0.5)))

		slot2 = ccui.Layout:create()

		slot2:setAnchorPoint(cc.p(0.5, 0.5))
		slot2:setContentSize(slot0.size)
		slot2:setPosition(slot0.size.width / 2, slot0.size.height / 2)
		slot2:setTouchEnabled(false)
		showLayoutRect(slot2, slot0.bg_opacity)

		slot0.notice_background = slot2

		slot0.notice_container:addChild(slot2)
	else
		if not tolua.isnull(slot0.notice_background) then
			showLayoutRect(slot0.notice_background, slot0.bg_opacity)
		end

		if not tolua.isnull(slot0.notice_container) then
			slot0.notice_container:setStencil(createSprite(PathTool.getResFrame("common", "common_1032"), slot0.cur_pos.x, slot0.cur_pos.y, nil, cc.p(0.5, 0.5)))
			slot0.notice_container:setVisible(true)
		end
	end
end

function GuideMainView.showBackGroundLayer(slot0, slot1)
	slot1 = slot1 or false

	if not slot0.backgroundLayer then
		slot0.backgroundLayer = ccui.Layout:create()

		slot0.backgroundLayer:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.backgroundLayer:setContentSize(slot0.size)
		slot0.backgroundLayer:setPosition(slot0.size.width / 2, slot0.size.height / 2)
		slot0.backgroundLayer:setTouchEnabled(false)
		slot0:addChild(slot0.backgroundLayer, -1)
	end

	showLayoutRect(slot0.backgroundLayer, slot0.bg_opacity)
	slot0.backgroundLayer:setVisible(slot1)
end

function GuideMainView.showLittleSpiritAndTips(slot0, slot1, slot2, slot3)
	if slot0.guide_tips_bg == nil then
		slot0.guide_tips_bg = createImage(slot0, PathTool.getResFrame("mainui", "mainui_guide_txtbg"), nil, , cc.p(0.5, 0.5), true, nil, true)

		slot0.guide_tips_bg:setCapInsets(cc.rect(40, 30, 1, 1))
	end

	slot0.guide_tips_bg:setContentSize(getTextBgSizeByTextContent(slot0.guide_msg, 20, 40, 20, 280, 24, 10))

	if slot0.sprite_flip == 0 then
		slot0.guide_tips_bg:setScaleX(1)
	elseif slot0.sprite_flip == 1 then
		slot0.guide_tips_bg:setScaleX(-1)
	end

	if slot0.txt_tips == nil then
		slot0.txt_tips = createRichLabel(24, cc.c3b(2, 55, 86), cc.p(0.5, 0.5), nil, 10, nil, 280)

		slot0:addChild(slot0.txt_tips)
	end

	slot5 = slot0:getGuideTipsBgPos(slot1, slot2, slot3, slot4)

	slot0.guide_tips_bg:setPosition(slot5)
	slot0.txt_tips:setString(slot0.guide_msg)
	slot0.txt_tips:setPosition(cc.p(slot5.x, slot5.y + 10))
	slot0.guide_tips_bg:setVisible(true)
	slot0.txt_tips:setVisible(true)
end

function GuideMainView.getGuideTipsBgPos(slot0, slot1, slot2, slot3, slot4)
	slot6 = 40
	slot9 = slot1.y + slot4.height / 2 + 30 + slot2.height * slot3

	if display.width < slot1.x + slot2.width / 2 * slot3 + slot4.width / 4 + 55 + slot4.width / 2 + 40 then
		slot8 = slot8 - (slot8 + slot4.width / 2 + slot7 - display.width)
	elseif slot8 - slot4.width / 2 - slot6 < 0 then
		slot8 = slot6 + slot4.width / 2
	end

	if display.height < slot9 + slot4.height / 2 + slot7 then
		slot9 = slot1.y - slot2.height / 2 * slot3 - slot5 - slot4.height / 2
	end

	return cc.p(slot8 + slot0.sprite_off_x, slot9 + slot0.sprite_off_y)
end

function GuideMainView.getGuideSpritePos(slot0, slot1, slot2, slot3)
	slot5 = -10
	slot6 = false

	if slot3.x - math.abs(-20) - slot2.width / 2 - slot1.width / 2 < 0 then
		slot4 = slot2.width + 20
		slot6 = true
	end

	if slot3.y - slot2.height / 2 - math.abs(slot5) - slot1.height / 2 < 0 then
		slot5 = slot5 - (slot3.y - slot2.height / 2 - math.abs(slot5) - slot1.height / 2)
	end

	return cc.p(slot4 + slot0.sprite_off_x, slot5 + slot0.sprite_off_y), slot6
end
