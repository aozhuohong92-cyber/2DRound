HeroController = HeroController or BaseClass(BaseController)

function HeroController.config(slot0)
	slot0.model = HeroModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function HeroController.getModel(slot0)
	return slot0.model
end

function HeroController.registerEvents(slot0)
	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = slot0.dispather:Bind(LoginEvent.RE_LINK_GAME, function ()
			uv0.model:resetAllData()
			uv0:openEquipTips(false)
		end)
	end

	if not slot0.role_create_success then
		slot0.role_create_success = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.role_create_success)

			uv0.role_create_success = nil
			uv0.role_vo = RoleController:getInstance():getRoleVo()
			uv0.model.record_login_lev = uv0.role_vo.lev

			if uv0.role_vo ~= nil and uv0.role_lev_event == nil then
				uv0.role_lev_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
					if slot0 == "coin" then
						uv0.model:checkLevelRedPointUpdate()

						if uv0.model.checkResonateRedPoint then
							uv0.model:checkResonateRedPoint()
						end
					elseif slot0 == "hero_exp" then
						uv0.model:checkLevelRedPointUpdate()
					elseif slot0 == "lev" then
						uv0.model:checkUnlockFormRedPoint(slot1)
					end
				end)
			end
		end)
	end

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 == BackPackConst.Bag_Code.EQUIPS then
				uv0.model.is_equip_redpoint_bag_update = true

				uv0.model:checkEquipRedPointUpdate()
			else
				slot2 = false

				for slot6, slot7 in pairs(slot1) do
					if slot7.base_id == uv0.model.upgrade_star_cost_id or slot7.base_id == uv0.model.upgrade_star_cost_id_2 then
						uv0.model.is_upgradestar_redpoint_bag_update = true

						uv0.model:checkUpgradeStarRedPointUpdate()
						uv0.model:checkLevelRedPointUpdate()
					elseif slot7.base_id == uv0.model.talent_skill_cost_id then
						uv0.model:setUpdateTalentRedpoint()
						uv0.model:checkTalentRedPointUpdate()
					end

					if Config.ItemData.data_skill_item_list[slot7.base_id] then
						uv0.model:setUpdateTalentRedpoint()
						uv0.model:checkTalentRedPointUpdate()
					end

					if slot7.config and slot7.config.type == BackPackConst.item_type.HERO_HUN then
						slot2 = true
					end
				end

				if slot2 and uv0.model.checkHeroChangeRedPoint then
					uv0.model:checkHeroChangeRedPoint()
				end

				if uv0.model.checkResonateRedPoint then
					uv0.model:checkResonateRedPoint()
				end
			end
		end)
	end

	if not slot0.del_goods_event then
		slot0.del_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 == BackPackConst.Bag_Code.EQUIPS then
				uv0.model.is_equip_redpoint_bag_update = true

				uv0.model:checkEquipRedPointUpdate()
			else
				slot2 = false

				for slot6, slot7 in pairs(slot1) do
					if slot7.base_id == uv0.model.upgrade_star_cost_id or slot7.base_id == uv0.model.upgrade_star_cost_id_2 then
						uv0.model.is_upgradestar_redpoint_bag_update = true

						uv0.model:checkUpgradeStarRedPointUpdate()
						uv0.model:checkLevelRedPointUpdate()
					elseif slot7.base_id == uv0.model.talent_skill_cost_id then
						uv0.model:setUpdateTalentRedpoint()
						uv0.model:checkTalentRedPointUpdate()
					end

					if Config.ItemData.data_skill_item_list[slot7.base_id] then
						uv0.model:setUpdateTalentRedpoint()
						uv0.model:checkTalentRedPointUpdate()
					end

					if slot7.config and slot7.config.type == BackPackConst.item_type.HERO_HUN then
						slot2 = true
					end
				end

				if slot2 and uv0.model.checkHeroChangeRedPoint then
					uv0.model:checkHeroChangeRedPoint()
				end

				if uv0.model.checkResonateRedPoint then
					uv0.model:checkResonateRedPoint()
				end
			end
		end)
	end

	if not slot0.modify_goods_event then
		slot0.modify_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 == BackPackConst.Bag_Code.EQUIPS then
				uv0.model.is_equip_redpoint_bag_update = true

				uv0.model:checkEquipRedPointUpdate()
			else
				slot2 = false

				for slot6, slot7 in pairs(slot1) do
					if slot7.base_id == uv0.model.upgrade_star_cost_id or slot7.base_id == uv0.model.upgrade_star_cost_id_2 then
						uv0.model.is_upgradestar_redpoint_bag_update = true

						uv0.model:checkUpgradeStarRedPointUpdate()
						uv0.model:checkLevelRedPointUpdate()
					elseif slot7.base_id == uv0.model.talent_skill_cost_id then
						uv0.model:setUpdateTalentRedpoint()
						uv0.model:checkTalentRedPointUpdate()
					end

					if Config.ItemData.data_skill_item_list[slot7.base_id] then
						uv0.model:setUpdateTalentRedpoint()
						uv0.model:checkTalentRedPointUpdate()
					end

					if slot7.config and slot7.config.type == BackPackConst.item_type.HERO_HUN then
						slot2 = true
					end
				end

				if slot2 and uv0.model.checkHeroChangeRedPoint then
					uv0.model:checkHeroChangeRedPoint()
				end

				if uv0.model.checkResonateRedPoint then
					uv0.model:checkResonateRedPoint()
				end
			end
		end)
	end

	if slot0.update_drama_hallows_event == nil and HallowsEvent then
		slot0.update_drama_hallows_event = GlobalEvent:getInstance():Bind(HallowsEvent.HallowsActivityEvent, function ()
			uv0.model:checkUnlockHallowsRedPoint()
		end)
	end
end

function HeroController.registerProtocals(slot0)
	slot0:RegisterProtocal(11000, "handle11000")
	slot0:RegisterProtocal(11025, "handle11025")
	slot0:RegisterProtocal(11026, "handle11026")
	slot0:RegisterProtocal(11001, "handle11001")
	slot0:RegisterProtocal(11002, "handle11002")
	slot0:RegisterProtocal(11007, "handle11007")
	slot0:RegisterProtocal(11003, "handle11003")
	slot0:RegisterProtocal(11004, "handle11004")
	slot0:RegisterProtocal(11005, "handle11005")
	slot0:RegisterProtocal(11006, "handle11006")
	slot0:RegisterProtocal(11009, "handle11009")
	slot0:RegisterProtocal(11016, "handle11016")
	slot0:RegisterProtocal(11017, "handle11017")
	slot0:RegisterProtocal(11010, "handle11010")
	slot0:RegisterProtocal(11011, "handle11011")
	slot0:RegisterProtocal(11012, "handle11012")
	slot0:RegisterProtocal(11015, "handle11015")
	slot0:RegisterProtocal(11055, "handle11055")
	slot0:RegisterProtocal(11056, "handle11056")
	slot0:RegisterProtocal(11211, "handle11211")
	slot0:RegisterProtocal(11212, "handle11212")
	slot0:RegisterProtocal(11213, "handle11213")
	slot0:RegisterProtocal(11030, "handle11030")
	slot0:RegisterProtocal(11031, "handle11031")
	slot0:RegisterProtocal(11032, "handle11032")
	slot0:RegisterProtocal(11033, "handle11033")
	slot0:RegisterProtocal(11034, "handle11034")
	slot0:RegisterProtocal(11035, "handle11035")
	slot0:RegisterProtocal(11036, "handle11036")
	slot0:RegisterProtocal(11037, "handle11037")
	slot0:RegisterProtocal(11038, "handle11038")
	slot0:RegisterProtocal(11048, "handle11048")
	slot0:RegisterProtocal(11040, "handle11040")
	slot0:RegisterProtocal(11060, "handle11060")
	slot0:RegisterProtocal(11063, "handle11063")
	slot0:RegisterProtocal(11075, "handle11075")
	slot0:RegisterProtocal(11087, "handle11087")
	slot0:RegisterProtocal(11076, "handle11076")
	slot0:RegisterProtocal(11096, "handle11096")
	slot0:RegisterProtocal(11097, "handle11097")
	slot0:RegisterProtocal(11098, "handle11098")
	slot0:RegisterProtocal(11099, "handle11099")
	slot0:RegisterProtocal(11090, "handle11090")
	slot0:RegisterProtocal(11091, "handle11091")
	slot0:RegisterProtocal(11092, "handle11092")
	slot0:RegisterProtocal(11093, "handle11093")
	slot0:RegisterProtocal(11094, "handle11094")
	slot0:RegisterProtocal(11088, "handle11088")
	slot0:RegisterProtocal(11089, "handle11089")
	slot0:RegisterProtocal(11086, "handle11086")
	slot0:RegisterProtocal(25220, "handle25220")
	slot0:RegisterProtocal(25221, "handle25221")
	slot0:RegisterProtocal(25223, "handle25223")
	slot0:RegisterProtocal(25224, "handle25224")
	slot0:RegisterProtocal(11019, "handle11019")
	slot0:RegisterProtocal(11020, "handle11020")
	slot0:RegisterProtocal(26400, "handle26400")
	slot0:RegisterProtocal(26401, "handle26401")
	slot0:RegisterProtocal(26402, "handle26402")
	slot0:RegisterProtocal(26410, "handle26410")
	slot0:RegisterProtocal(26411, "handle26411")
	slot0:RegisterProtocal(26412, "handle26412")
	slot0:RegisterProtocal(26413, "handle26413")
	slot0:RegisterProtocal(26414, "handle26414")
	slot0:RegisterProtocal(26420, "handle26420")
	slot0:RegisterProtocal(26421, "handle26421")
	slot0:RegisterProtocal(26422, "handle26422")
	slot0:RegisterProtocal(26423, "handle26423")
	slot0:RegisterProtocal(26424, "handle26424")
	slot0:RegisterProtocal(26425, "handle26425")
	slot0:RegisterProtocal(26426, "handle26426")
	slot0:RegisterProtocal(26427, "handle26427")
	slot0:RegisterProtocal(26428, "handle26428")
	slot0:RegisterProtocal(26429, "handle26429")
	slot0:RegisterProtocal(26430, "handle26430")
	slot0:RegisterProtocal(26431, "handle26431")
	slot0:RegisterProtocal(26432, "handle26432")
	slot0:RegisterProtocal(11065, "handle11065")
	slot0:RegisterProtocal(11066, "handle11066")
	slot0:RegisterProtocal(11067, "handle11067")
	slot0:RegisterProtocal(11068, "handle11068")
	slot0:RegisterProtocal(11021, "handle11021")
end

function HeroController.zeroUpdata(slot0)
	slot0:sender11056()
	slot0:sender26420()
	slot0.model:removeResetTimeInfo()

	if slot0.hero_main_info_window then
		slot0.hero_main_info_window:sendRssetTimeProto()
	end

	if slot0.hero_reset_comfirm_panel then
		slot0:openHeroResetComfirmPanel(false)
	end
end

function HeroController.handle11000(slot0, slot1)
	slot0.model:setHeroMaxCount(slot1.num)
	slot0.model:setHeroBuyNum(slot1.buy_num)
	slot0.model:updateHeroList(slot1.partners)
	ElitematchController:getInstance():loginSendProtoInfo()
	slot0:sender11020()
end

function HeroController.handle11025(slot0, slot1)
	slot0.model:setHeroMaxCount(slot1.num)
	slot0.model:setHeroBuyNum(slot1.buy_num)
	slot0.model:updateHeroList(slot1.partners)
	ElitematchController:getInstance():loginSendProtoInfo()
	slot0.model:batchSendHeroInfo()
	slot0:sender25220()
	slot0:sender11020()
	slot0:sender26400()
	slot0:sender26410()
	slot0:sender26425()
	slot0.model:sendAllHeroHolyEquipInfo()
	GlobalEvent:getInstance():Fire(HeroEvent.All_Hero_Base_Info_Event)
end

function HeroController.sender11026(slot0, slot1)
	slot0:SendProtocal(11026, {
		partner_ids = slot1
	})
end

function HeroController.handle11026(slot0, slot1)
	slot0.model:updateHeroList(slot1.partners, true, true)
	GlobalEvent:getInstance():Fire(HeroEvent.All_Hero_Detail_Info_Event)
end

function HeroController.handle11001(slot0, slot1)
	slot0.model:updateHeroList(slot1.partners)

	if slot0.model.checkHeroChangeRedPoint then
		slot0.model:checkHeroChangeRedPoint()
	end

	HalidomController:getInstance():getModel():calculateHalidomRedStatus()
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Data_Add, data_list)
end

function HeroController.handle11002(slot0, slot1)
	slot0.model:updateHeroVo(slot1)
end

function HeroController.handle11007(slot0, slot1)
	RoleController:getInstance():showPower(true)
	slot0.model:updateHeroList(slot1.ref_partners, true, true)
end

function HeroController.sender11003(slot0, slot1)
	slot0:SendProtocal(11003, {
		partner_id = slot1
	})
end

function HeroController.handle11003(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Level_Up_Success_Event)
	end
end

function HeroController.sender11004(slot0, slot1)
	slot0:SendProtocal(11004, {
		partner_id = slot1
	})
end

function HeroController.handle11004(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		slot0:openHeroBreakPanel(false)
	end
end

function HeroController.sender11005(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(11005, {
		partner_id = slot1,
		expend1 = slot2,
		expend2 = slot3,
		item_expend = slot4
	})
end

function HeroController.handle11005(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		GlobalEvent:getInstance():Fire(HeroEvent.Upgrade_Star_Success_Event)
	else
		slot0.model:setUpgradeStarUpdateRecord(true)
	end
end

function HeroController.handle11006(slot0, slot1)
	slot0.model:delHeroDataList(slot1.expend2)
	HalidomController:getInstance():getModel():calculateHalidomRedStatus()
end

function HeroController.sender11009(slot0, slot1)
	slot0:SendProtocal(11009, {
		partner_id = slot1
	})
end

function HeroController.handle11009(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		slot0.model:setHeroMaxCount(slot1.num)
		slot0.model:setHeroBuyNum(slot1.buy_num)
		GlobalEvent:getInstance():Fire(HeroEvent.Buy_Hero_Max_Count_Event)
	end
end

function HeroController.sender11016(slot0, slot1)
	slot0:SendProtocal(11016, {
		partner_id = slot1
	})
end

function HeroController.handle11016(slot0, slot1)
	GlobalEvent:getInstance():Fire(HeroEvent.Next_Break_Info_Event, slot1)
end

function HeroController.handle11017(slot0, slot1)
	slot0.model:setHeroMaxCount(slot1.num)
end

function HeroController.sender11040(slot0)
	slot0:SendProtocal(11040, {})
end

function HeroController.handle11040(slot0, slot1)
	slot0.model:setHadHeroInfo(slot1.partners)
	GlobalEvent:getInstance():Fire(HeroEvent.Get_Had_Hero_Star_Event)
end

function HeroController.sender11055(slot0, slot1)
	if slot1 == 0 then
		slot0.model:setIsFuseRedPoint(false)
		slot0.model:recordFuseRedPointInfo()
	end

	slot0.model:setIsFuseRedPoint(slot1 == 1)
	slot0:SendProtocal(11055, {
		is_point = slot1
	})
end

function HeroController.handle11055(slot0, slot1)
end

function HeroController.sender11056(slot0)
	slot0:SendProtocal(11056, {})
end

function HeroController.handle11056(slot0, slot1)
	slot0.model:setIsFuseRedPoint(slot1.is_point == 1)

	if slot1.is_point == 1 then
		MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.guild, HeroCalculate.checkAllStarFuseRedpoint())
	else
		slot0.model:recordFuseRedPointInfo()
	end
end

function HeroController.sender11075(slot0, slot1)
	slot0:SendProtocal(11075, {
		list = slot1
	})
end

function HeroController.handle11075(slot0, slot1)
	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Reset_Look_Event, slot1)
	end
end

function HeroController.sender11087(slot0, slot1)
	slot0:SendProtocal(11087, {
		list = slot1
	})
end

function HeroController.handle11087(slot0, slot1)
	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Reset_Star_Event, slot1)
	end
end

function HeroController.sender11076(slot0, slot1)
	slot0:SendProtocal(11076, {
		list = slot1
	})
end

function HeroController.handle11076(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:delHeroDataList(slot1.list)
	end
end

function HeroController.sender11060(slot0, slot1, slot2)
	slot0:SendProtocal(11060, {
		channel = slot1,
		partner_id = slot2
	})
end

function HeroController.handle11060(slot0, slot1)
	message(slot1.msg)
end

function HeroController.sender11063(slot0, slot1)
	slot0:SendProtocal(11063, {
		partner_id = slot1
	})
end

function HeroController.handle11063(slot0, slot1)
	slot0.model:updateHeroVoDetailedInfo(slot1)
end

function HeroController.sender11021(slot0, slot1, slot2)
	slot0:SendProtocal(11021, {
		partner_id = slot1,
		skin_id = slot2
	})
end

function HeroController.handle11021(slot0, slot1)
	if slot1.code == FALSE then
		message(slot1.msg)
	else
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Skin_Upgrade_Event, slot1)
	end
end

function HeroController.sender11010(slot0, slot1, slot2)
	slot0.model:setEquipUpdateRecord(false)
	slot0:SendProtocal(11010, {
		partner_id = slot1,
		item_id = slot2
	})
end

function HeroController.handle11010(slot0, slot1)
	message(slot1.msg)

	if slot1.result == FALSE then
		slot0.model:setEquipUpdateRecord(true)
	end
end

function HeroController.sender11011(slot0, slot1, slot2)
	slot0.model:setEquipUpdateRecord(false)
	slot0:SendProtocal(11011, {
		partner_id = slot1,
		pos_id = slot2
	})
end

function HeroController.handle11011(slot0, slot1)
	message(slot1.msg)

	if slot1.result == FALSE then
		slot0.model:setEquipUpdateRecord(true)
	end
end

function HeroController.handle11012(slot0, slot1)
	message(slot1.msg)
	slot0.model:updateHeroEquipList(slot1)
	GlobalEvent:getInstance():Fire(HeroEvent.Equip_Update_Event)

	slot0.model.is_equip_redpoint_hero_update = true

	slot0.model:checkEquipRedPointUpdate()
end

function HeroController.sender11015(slot0, slot1, slot2)
	slot0:SendProtocal(11015, {
		partner_id = slot1,
		type = slot2
	})
end

function HeroController.handle11015(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		slot0.model:setLockByPartnerid(slot1.partner_id, slot1.type)
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Lock_Event)
	end
end

function HeroController.sender11030(slot0, slot1, slot2, slot3, slot4)
	slot0.model:setEquipUpdateRecord(false)
	slot0:SendProtocal(11030, {
		partner_id = slot1,
		pos_id = slot2,
		artifact_id = slot3,
		type = slot4
	})
end

function HeroController.handle11030(slot0, slot1)
	message(slot1.msg)

	if slot1.result == FALSE then
		slot0.model:setEquipUpdateRecord(true)
	else
		slot0.model:clearHeroVoDetailedInfoByPartnerID(slot1.partner_id)
	end
end

function HeroController.handle11031(slot0, slot1)
	message(slot1.msg)
	slot0.model:updatePartnerArtifactList(slot1)
end

function HeroController.sender11032(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(11032, {
		partner_id = slot1,
		artifact_id = slot2,
		expends = slot3
	})
end

function HeroController.handle11032(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		GlobalEvent:getInstance():Fire(HeroEvent.Artifact_UpStar_Event, slot1)
	end
end

function HeroController.sender11033(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(11033, {
		partner_id = slot1,
		artifact_id = slot2,
		skills = slot3,
		luck_item = slot4
	})
end

function HeroController.handle11033(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		GlobalEvent:getInstance():Fire(HeroEvent.Artifact_Recast_Event)
	end
end

function HeroController.sender11034(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(11034, {
		partner_id = slot1,
		artifact_id = slot2,
		type = slot3
	})
end

function HeroController.handle11034(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		GlobalEvent:getInstance():Fire(HeroEvent.Artifact_Save_Event)
	end
end

function HeroController.sender11035(slot0, slot1)
	slot0:SendProtocal(11035, {
		artifact_id = slot1
	})
end

function HeroController.handle11035(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		-- Nothing
	end
end

function HeroController.sender11036(slot0, slot1, slot2)
	slot0:SendProtocal(11036, {
		item_id = slot1,
		expends = slot2
	})
end

function HeroController.handle11036(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		GlobalEvent:getInstance():Fire(HeroEvent.Artifact_Compound_Event, slot1.flag)
	end
end

function HeroController.sender11037(slot0)
	slot0:SendProtocal(11037, {})
end

function HeroController.handle11037(slot0, slot1)
	if slot1 and slot1.lucky then
		slot0.model:setArtifactLucky(slot1.lucky)
		GlobalEvent:getInstance():Fire(HeroEvent.Artifact_Lucky_Event)
	end
end

function HeroController.sender11038(slot0)
	slot0:SendProtocal(11038, {})
end

function HeroController.handle11038(slot0, slot1)
	if slot1 and slot1.msg then
		message(slot1.msg)
	end
end

function HeroController.sender11048(slot0)
	slot0:SendProtocal(11048, {})
end

function HeroController.handle11048(slot0, slot1)
	if slot1 and slot1.artifact_ref_count then
		slot0.model:updateArtifactRecastCount(slot1.artifact_ref_count)
		GlobalEvent:getInstance():Fire(HeroEvent.Artifact_Recast_Count_Event)
	end
end

function HeroController.sender11211(slot0, slot1)
	slot0:SendProtocal(11211, {
		type = slot1
	})
end

function HeroController.handle11211(slot0, slot1)
	if slot1.type == PartnerConst.Fun_Form.Drama or slot1.type == PartnerConst.Fun_Form.Arena or slot1.type == PartnerConst.Fun_Form.ArenaTeam then
		slot0.model:setFormList(slot1)
	end

	GlobalEvent:getInstance():Fire(HeroEvent.Update_Fun_Form, slot1)
end

function HeroController.sender11213(slot0, slot1)
	slot0:SendProtocal(11213, {
		type_list = slot1
	})
end

function HeroController.handle11213(slot0, slot1)
	for slot5, slot6 in ipairs(slot1.info) do
		if slot6.type == PartnerConst.Fun_Form.Drama or slot6.type == PartnerConst.Fun_Form.Arena or slot6.type == PartnerConst.Fun_Form.ArenaTeam then
			slot0.model:setFormList(slot6)
		end
	end
end

function HeroController.sender11212(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(11212, {
		type = slot1,
		formation_type = slot2,
		pos_info = slot3,
		hallows_id = slot4
	})
end

function HeroController.handle11212(slot0, slot1)
	if slot1.code == TRUE then
		if slot1.type == PartnerConst.Fun_Form.Drama then
			slot2 = {}

			table.insert(slot2, {
				type = PartnerConst.Fun_Form.Drama
			})
			table.insert(slot2, {
				type = PartnerConst.Fun_Form.Arena
			})
			slot0:sender11213(slot2)
		elseif slot1.type == PartnerConst.Fun_Form.Arena then
			slot0:sender11211(slot1.type)
		elseif slot1.type == PartnerConst.Fun_Form.LimitExercise then
			LimitExerciseController:getInstance():checkJoinFight()
		elseif slot1.type == PartnerConst.Fun_Form.Sandybeach_boss then
			ActionController:getInstance():checkJoinFight()
		elseif slot1.type == PartnerConst.Fun_Form.ArenaTeam then
			slot0:sender11211(slot1.type)
			GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_REFRESH_TEAM_INFO_EVENT, slot1)
		elseif slot1.type == PartnerConst.Fun_Form.YearMonster then
			slot0:sender11211(slot1.type)
		elseif slot1.type == PartnerConst.Fun_Form.ArenaManyPeople then
			slot0:sender11211(slot1.type)
		end

		GlobalEvent:getInstance():Fire(HeroEvent.Update_Save_Form, slot1)
	else
		message(slot1.msg)
	end
end

function HeroController.sender11096(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(11096, {
		partner_id = slot1,
		pos = slot2,
		skill_id = slot3
	})
end

function HeroController.handle11096(slot0, slot1)
	if slot1.result == TRUE then
		slot0.model:updateHeroVoTalent({
			slot1
		}, true)
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Learn_Talent_Event, slot1)
	else
		message(slot1.msg)
	end
end

function HeroController.sender11097(slot0, slot1, slot2)
	slot0:SendProtocal(11097, {
		partner_id = slot1,
		pos = slot2
	})
end

function HeroController.handle11097(slot0, slot1)
	if slot1.result == TRUE then
		slot0.model:updateHeroVoTalent({
			slot1
		}, true)
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Level_Up_Talent_Event, slot1)
	else
		message(slot1.msg)
	end
end

function HeroController.sender11098(slot0, slot1, slot2)
	slot0:SendProtocal(11098, {
		partner_id = slot1,
		pos = slot2
	})
end

function HeroController.handle11098(slot0, slot1)
	if slot1.result == TRUE then
		slot0.model:updateHeroVoTalent({
			slot1
		}, true)
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Forget_Talent_Event, slot1)
	else
		message(slot1.msg)
	end
end

function HeroController.sender11099(slot0, slot1)
	slot0:SendProtocal(11099, {
		partner_ids = slot1
	})
end

function HeroController.handle11099(slot0, slot1)
	slot0.model:updateHeroVoTalent(slot1.partner_ids)
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Get_Talent_Event, slot1.partner_ids)
end

function HeroController.sender11090(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(11090, {
		partner_id = slot1,
		holy_eqm_id = slot2,
		type = slot3
	})
end

function HeroController.handle11090(slot0, slot1)
	message(slot1.msg)
end

function HeroController.handle11091(slot0, slot1)
	slot0.model:updateHolyEquipmentInfo(slot1)
	GlobalEvent:getInstance():Fire(HeroEvent.Holy_Equipment_Update_Event, slot1)
end

function HeroController.sender11092(slot0, slot1)
	slot0:SendProtocal(11092, {
		partner_ids = slot1
	})
end

function HeroController.handle11092(slot0, slot1)
	slot0.model:updateHeroVoHolyEquipment(slot1.partner_ids)
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Get_Holy_Equipment_Event, slot1.partner_ids)
end

function HeroController.sender11093(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(11093, {
		partner_id = slot1,
		holy_eqm_id = slot2,
		type = slot3
	})
end

function HeroController.handle11093(slot0, slot1)
	message(slot1.msg)

	if slot1.result == FALSE then
		-- Nothing
	end
end

function HeroController.sender11094(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(11094, {
		partner_id = slot1,
		holy_eqm_id = slot2,
		pos = slot3
	})
end

function HeroController.handle11094(slot0, slot1)
	message(slot1.msg)
end

function HeroController.sender11088(slot0, slot1)
	slot0:SendProtocal(11088, {
		item_ids = slot1
	})
end

function HeroController.handle11088(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Sell_Holy_Equipment_Res_Event, slot1)
end

function HeroController.sender11089(slot0, slot1)
	slot0:SendProtocal(11089, {
		item_ids = slot1
	})
end

function HeroController.handle11089(slot0, slot1)
	message(slot1.msg)
end

function HeroController.sender11086(slot0, slot1, slot2)
	slot0.holyequip_suit_data = slot2

	slot0:SendProtocal(11086, {
		partner_id = slot1
	})
end

function HeroController.handle11086(slot0, slot1)
	slot0:openHolyequipmentTotalAttrPanel(true, slot1, slot0.holyequip_suit_data)
end

function HeroController.sender25220(slot0)
	slot0:SendProtocal(25220, {})
end

function HeroController.handle25220(slot0, slot1)
	slot0.model:updateHolyEquipmentPlan(slot1)
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Get_Holy_Equipment_Plan_Event, slot1)
end

function HeroController.sender25221(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(25221, {
		id = slot1,
		partner_id = slot2,
		name = slot3,
		holy_eqm = slot4
	})
end

function HeroController.handle25221(slot0, slot1)
	message(slot1.msg)
end

function HeroController.sender25223(slot0)
	slot0:SendProtocal(25223, {})
end

function HeroController.handle25223(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:updateHolyEquipmentPlan(slot1, true)
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Open_Holy_Equipment_Cell_Event, slot1.num)
	end
end

function HeroController.sender25224(slot0, slot1, slot2)
	slot0:SendProtocal(25224, {
		partner_id = slot1,
		id = slot2
	})
end

function HeroController.handle25224(slot0, slot1)
	message(slot1.msg)
end

function HeroController.sender11019(slot0, slot1, slot2)
	slot0:SendProtocal(11019, {
		partner_id = slot1,
		skin_id = slot2
	})
end

function HeroController.handle11019(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		message(TI18N("更换成功"))
	end

	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Skin_Used_Event, slot1)
end

function HeroController.sender11020(slot0)
	slot0:SendProtocal(11020, {})
end

function HeroController.handle11020(slot0, slot1)
	slot0.model:initHeroSkin(slot1)
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Skin_Info_Event, slot1)
end

function HeroController.sender26400(slot0)
	slot0:SendProtocal(26400, {})
end

function HeroController.handle26400(slot0, slot1)
	slot0.model:updateResonateLockInfo(slot1)
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Info_Event, slot1)
end

function HeroController.sender26401(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(26401, {
		pos = slot1,
		id = slot2,
		type = slot3
	})
end

function HeroController.handle26401(slot0, slot1)
	message(slot1.msg)
end

function HeroController.sender26402(slot0)
	slot0:SendProtocal(26402, {})
end

function HeroController.handle26402(slot0, slot1)
	message(slot1.msg)
end

function HeroController.sender26410(slot0)
	slot0:SendProtocal(26410, {})
end

function HeroController.handle26410(slot0, slot1)
	if slot0.model.checkResonateExtractRedpoint then
		slot0.model:checkResonateExtractRedpoint(slot1)
	end

	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Extract_Event, slot1)
end

function HeroController.sender26411(slot0, slot1)
	slot0:SendProtocal(26411, {
		all_num = slot1
	})
end

function HeroController.handle26411(slot0, slot1)
	message(slot1.msg)
end

function HeroController.sender26412(slot0)
	slot0:SendProtocal(26412, {})
end

function HeroController.handle26412(slot0, slot1)
	message(slot1.msg)
end

function HeroController.sender26413(slot0)
	slot0:SendProtocal(26413, {})
end

function HeroController.handle26413(slot0, slot1)
	message(slot1.msg)
end

function HeroController.sender26414(slot0)
	slot0:SendProtocal(26414, {})
end

function HeroController.handle26414(slot0, slot1)
end

function HeroController.sender26420(slot0)
	slot0:SendProtocal(26420, {})
end

function HeroController.handle26420(slot0, slot1)
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Empowerment_Event, slot1)
end

function HeroController.sender26421(slot0, slot1, slot2)
	slot0:SendProtocal(26421, {
		partner_id = slot1,
		skills = slot2
	})
end

function HeroController.handle26421(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Empowerment_Success_Event, slot1)
	end
end

function HeroController.sender26422(slot0)
	slot0:SendProtocal(26422, {})
end

function HeroController.handle26422(slot0, slot1)
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Skill_List_Event, slot1)
end

function HeroController.sender26423(slot0, slot1, slot2)
	slot0:SendProtocal(26423, {
		partner_id = slot1,
		skills = slot2
	})
end

function HeroController.handle26423(slot0, slot1)
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Hero_Power_Event, slot1)
end

function HeroController.handle26424(slot0, slot1)
	if slot1 and slot0.model:getHeroById(slot1.partner_id) then
		slot3 = {
			deepCopy(slot2)
		}
		slot3[1].show_type = MainuiConst.item_exhibition_type.partner_type

		MainuiController:getInstance():openGetItemView(true, slot3, 0)
	end
end

function HeroController.sender26425(slot0)
	slot0:SendProtocal(26425, {})
end

function HeroController.handle26425(slot0, slot1)
	slot0.model:updateResonateCystalInfo(slot1)
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Crystal_Info_Event, slot1)
end

function HeroController.sender26426(slot0, slot1, slot2)
	slot0.put_partner_id = slot1
	slot0.put_pos = slot2

	slot0:SendProtocal(26426, {
		partner_id = slot1,
		pos = slot2
	})
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Crystal_Can_List_Event, false)
end

function HeroController.handle26426(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		if slot0.model:getHeroById(slot1.partner_id or slot0.put_partner_id) and next(slot3) ~= nil then
			slot0:openHeroResonatePutResultPanel(true, slot3)

			slot3.red_point[HeroConst.RedPointType.eRPLevelUp] = nil

			HeroCalculate.checkAllHeroRedPoint()
		end

		slot0.put_partner_id = nil

		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Crystal_Update_One_Event, slot0.put_pos)
	end

	slot0.put_pos = nil
end

function HeroController.sender26427(slot0, slot1, slot2)
	slot0.down_pos = slot2

	slot0:SendProtocal(26427, {
		partner_id = slot1,
		pos = slot2
	})
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Crystal_Can_List_Event, false)
end

function HeroController.handle26427(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		HeroCalculate.checkAllHeroRedPoint()
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Crystal_Update_One_Event, slot0.down_pos)
	end

	slot0.down_pos = nil
end

function HeroController.sender26428(slot0, slot1)
	slot0:SendProtocal(26428, {
		pos = slot1
	})
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Crystal_Can_List_Event, false)
end

function HeroController.handle26428(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Crystal_Update_One_Event, slot1.pos)
	end
end

function HeroController.sender26429(slot0, slot1, slot2)
	slot0:SendProtocal(26429, {
		pos = slot1,
		type = slot2
	})
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Crystal_Can_List_Event, false)
end

function HeroController.handle26429(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Crystal_Update_One_Event, slot1.pos)
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Crystal_Update_One_Event, slot1.pos + 1)
	end
end

function HeroController.sender26430(slot0)
	slot0:SendProtocal(26430, {})
end

function HeroController.handle26430(slot0, slot1)
	message(slot1.msg)
end

function HeroController.sender26431(slot0)
	slot0:SendProtocal(26431, {})
end

function HeroController.handle26431(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Crystal_Power_Event, slot1)
	end
end

function HeroController.sender26432(slot0)
	slot0:SendProtocal(26432, {})
end

function HeroController.handle26432(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Break_Event, slot1)
	end
end

function HeroController.sender11065(slot0, slot1)
	slot0:SendProtocal(11065, {
		partner_id = slot1
	})
end

function HeroController.handle11065(slot0, slot1)
	if slot1 then
		message(slot1.msg)

		slot2 = {}

		for slot6, slot7 in ipairs(slot1.list) do
			if slot7.is_partner == 1 then
				if slot0.model:getHeroById(slot1.partner_id) then
					slot9 = deepCopy(slot8)
					slot9.show_type = MainuiConst.item_exhibition_type.partner_type

					table.insert(slot2, slot9)
				end
			else
				table.insert(slot2, {
					bid = slot7.id,
					num = slot7.num
				})
			end
		end

		message(slot1.msg)
		MainuiController:getInstance():openGetItemView(true, slot2, 0, {
			is_backpack = true
		})
		GlobalEvent:getInstance():Fire(HeroEvent.HERO_RESET_EVENT, slot1)
	end
end

function HeroController.sender11066(slot0, slot1)
	slot0:SendProtocal(11066, {
		partner_id = slot1
	})
end

function HeroController.handle11066(slot0, slot1)
	message(slot1.msg)

	if slot1 and slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(HeroEvent.HERO_RESET_ITEM_EVENT, slot1)
	end
end

function HeroController.sender11067(slot0, slot1)
	slot0:SendProtocal(11067, {
		partner_id = slot1
	})
end

function HeroController.handle11067(slot0, slot1)
	slot0.model:setResetCount(slot1)
end

function HeroController.sender11068(slot0, slot1)
	slot0:SendProtocal(11068, {
		partner_id = slot1
	})
end

function HeroController.handle11068(slot0, slot1)
	message(slot1.msg)
end

function HeroController.openHeroBagWindow(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.hero_bag_window ~= nil then
			slot0.hero_bag_window:close()

			slot0.hero_bag_window = nil
		end
	else
		if slot0.hero_bag_window == nil then
			slot0.hero_bag_window = HeroBagWindow.New()
		end

		slot0.hero_bag_window:open(slot2, slot3)
	end
end

function HeroController.openHeroLibraryMainWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.hero_library_mainWindow ~= nil then
			slot0.hero_library_mainWindow:close()

			slot0.hero_library_mainWindow = nil
		end
	else
		if slot0.hero_library_mainWindow == nil then
			slot0.hero_library_mainWindow = HeroLibraryMainWindow.New()
		end

		slot0.hero_library_mainWindow:open(slot2)
	end
end

function HeroController.openHeroLibraryInfoWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.hero_library_info ~= nil then
			slot0.hero_library_info:close()

			slot0.hero_library_info = nil
		end
	else
		if slot0.hero_library_info == nil then
			slot0.hero_library_info = HeroLibraryInfoWindow.New()
		end

		slot0.hero_library_info:open(slot2)
	end
end

function HeroController.openHeroLibraryStoryPanel(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.hero_library_story ~= nil then
			slot0.hero_library_story:close()

			slot0.hero_library_story = nil
		end
	else
		if slot0.hero_library_story == nil then
			slot0.hero_library_story = HeroLibraryStoryPanel.New()
		end

		slot0.hero_library_story:open(slot2, slot3)
	end
end

function HeroController.openHeroMainInfoWindow(slot0, slot1, slot2, slot3, slot4)
	if slot1 == false then
		if slot0.hero_main_info_window ~= nil then
			slot0.hero_main_info_window:close()

			slot0.hero_main_info_window = nil
		end
	else
		if slot0.hero_main_info_window == nil then
			slot0.hero_main_info_window = HeroMainInfoWindow.New()
		end

		slot0.hero_main_info_window:open(slot2, slot3, slot4)
	end
end

function HeroController.getHeroMainInfoWindow(slot0)
	return slot0.hero_main_info_window
end

function HeroController.runShakeScreemAction(slot0)
	if MainuiController:getInstance().mainui and slot1.mainui.root_wnd then
		slot0:shakeScreen(slot1.mainui.root_wnd)
	end

	if slot0.hero_main_info_window and slot0.hero_main_info_window.root_wnd then
		slot0:shakeScreen(slot0.hero_main_info_window.root_wnd)
	end
end

function HeroController.shakeScreen(slot0, slot1)
	if slot1.action then
		slot1.is_shake = false

		slot1:stopAllActions()
		slot1:setPosition(slot1.camera_shake_pos)

		slot1.action = nil
	end

	slot1.camera_shake_pos = cc.p(slot1:getPosition())
	slot1.is_shake = true

	function slot2()
		uv0.is_shake = false

		uv0:setPosition(uv0.camera_shake_pos)
	end

	slot3 = {
		1,
		4,
		7,
		8,
		9,
		6,
		3,
		2
	}
	slot4 = 15
	slot5 = 3
	slot6 = 0.015
	slot7 = 0.4
	slot8 = 0.4
	slot10 = {
		{
			-0.7,
			0.7
		},
		{
			0,
			1
		},
		{
			0.7,
			0.7
		},
		{
			-1,
			0
		},
		{
			0,
			0
		},
		{
			1,
			0
		},
		{
			-0.7,
			-0.7
		},
		{
			0,
			-1
		},
		{
			0.7,
			-0.7
		}
	}

	function slot11(slot0)
		slot1, slot2 = nil

		uv5:setPosition(cc.p(uv5.camera_shake_pos.x + uv0 * uv1 * uv2[uv3[slot0]][1], uv5.camera_shake_pos.y + -uv0 * uv4 * uv2[uv3[slot0]][2]))
	end

	slot12 = nil

	for slot16 = 1, 7 do
		for slot20 = 1, #slot3 do
			slot12 = cc.Sequence:create(slot12, cc.CallFunc:create(function ()
				uv0(uv1)
			end), cc.DelayTime:create(slot6))
		end

		slot4 = slot4 - slot5
	end

	slot12 = cc.Sequence:create(slot12, cc.CallFunc:create(slot2))
	slot1.action = slot12

	slot1:runAction(slot12)
end

function HeroController.openHeroLookDrawWindow(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == false then
		if slot0.hero_look_draw_window ~= nil then
			slot0.hero_look_draw_window:close()

			slot0.hero_look_draw_window = nil
		end
	else
		if slot0.hero_look_draw_window == nil then
			slot0.hero_look_draw_window = HeroLookDrawWindow.New()
		end

		slot0.hero_look_draw_window:open(slot2, slot3, slot4, slot5)
	end
end

function HeroController.openHeroDrawMainWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.hero_draw_main_window ~= nil then
			slot0.hero_draw_main_window:close()

			slot0.hero_draw_main_window = nil
		end
	else
		if slot0.hero_draw_main_window == nil then
			slot0.hero_draw_main_window = HeroDrawMainWindow.New()
		end

		slot0.hero_draw_main_window:open(slot2)
	end
end

function HeroController.openHeroBreakPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.hero_break_panel ~= nil then
			slot0.hero_break_panel:close()

			slot0.hero_break_panel = nil
		end
	else
		if slot0.hero_break_panel == nil then
			slot0.hero_break_panel = HeroBreakPanel.New()
		end

		slot0.hero_break_panel:open(slot2)
	end
end

function HeroController.openBreakExhibitionWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.break_exhibition_window then
			slot0.break_exhibition_window = HeroBreakExhibitionWindow.New(slot0)
		end

		if slot0.break_exhibition_window and slot0.break_exhibition_window:isOpen() == false then
			slot0.break_exhibition_window:open(slot2, slot3)
		end
	else
		if slot0.break_exhibition_window then
			slot0.break_exhibition_window:close()

			slot0.break_exhibition_window = nil
		end

		if slot2 and type(slot2) == "number" then
			slot0:openSkillUnlockWindow(true, slot2)
		end
	end
end

function HeroController.openHeroUpgradeStarExhibitionPanel(slot0, slot1, slot2, slot3)
	if slot1 == true then
		BattleResultMgr:getInstance():setWaitShowPanel(true)

		if not slot0.upgrade_star_exhibition_window then
			slot0.upgrade_star_exhibition_window = HeroUpgradeStarExhibitionPanel.New(slot0)
		end

		if slot0.upgrade_star_exhibition_window and slot0.upgrade_star_exhibition_window:isOpen() == false then
			slot0.upgrade_star_exhibition_window:open(slot2, slot3)
		end
	elseif slot0.upgrade_star_exhibition_window then
		slot0.upgrade_star_exhibition_window:close()

		slot0.upgrade_star_exhibition_window = nil
	end
end

function HeroController.openSkillUnlockWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.unlock_window then
			slot0.unlock_window = SkillUnlockWindow.New(slot2, slot3)
		end

		if slot0.unlock_window and slot0.unlock_window:isOpen() == false then
			slot0.unlock_window:open()
		end
	elseif slot0.unlock_window then
		slot0.unlock_window:close()

		slot0.unlock_window = nil
	end
end

function HeroController.openFormFilterHeroPanel(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.form_filter_hero_panel then
			slot0.form_filter_hero_panel = FormFilterHeroPanel.New()
		end

		if slot0.form_filter_hero_panel and slot0.form_filter_hero_panel:isOpen() == false then
			slot0.form_filter_hero_panel:open(slot2, slot3)
		end
	elseif slot0.form_filter_hero_panel then
		slot0.form_filter_hero_panel:close()

		slot0.form_filter_hero_panel = nil
	end
end

function HeroController.openFormGoFightPanel(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if not slot0.form_go_fight_panel then
			slot0.form_go_fight_panel = FormGoFightPanel.New()
		end

		if slot0.form_go_fight_panel and slot0.form_go_fight_panel:isOpen() == false then
			slot0.form_go_fight_panel:open(slot2, slot3, slot4)
		end
	elseif slot0.form_go_fight_panel then
		slot0.form_go_fight_panel:close()

		slot0.form_go_fight_panel = nil
	end
end

function HeroController.openFormMainWindow(slot0, slot1, slot2, slot3)
	slot0:openFormGoFightPanel(slot1, slot2, slot3 or {}, HeroConst.FormShowType.eFormSave)
end

function HeroController.openAdventureMineFormGoFightPanel(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if not slot0.adventure_mine_form_go_fight_panel then
			slot0.adventure_mine_form_go_fight_panel = FormGoFightPanel.New()
		end

		if slot0.adventure_mine_form_go_fight_panel and slot0.adventure_mine_form_go_fight_panel:isOpen() == false then
			slot0.adventure_mine_form_go_fight_panel:open(slot2, slot3, slot4)
		end
	elseif slot0.adventure_mine_form_go_fight_panel then
		slot0.adventure_mine_form_go_fight_panel:close()

		slot0.adventure_mine_form_go_fight_panel = nil
	end
end

function HeroController.openFormationSelectPanel(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if not slot0.formation_select_panel then
			slot0.formation_select_panel = FormationSelectPanel.New()
		end

		if slot0.formation_select_panel and slot0.formation_select_panel:isOpen() == false then
			slot0.formation_select_panel:open(slot2, slot3, slot4)
		end
	elseif slot0.formation_select_panel then
		slot0.formation_select_panel:close()

		slot0.formation_select_panel = nil
	end
end

function HeroController.openFormHallowsSelectPanel(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot1 == true then
		if not slot0.form_hallows_select_panel then
			slot0.form_hallows_select_panel = FormHallowsSelectPanel.New()
		end

		if slot0.form_hallows_select_panel and slot0.form_hallows_select_panel:isOpen() == false then
			slot0.form_hallows_select_panel:open(slot2, slot3, slot4, slot5, slot6)
		end
	elseif slot0.form_hallows_select_panel then
		slot0.form_hallows_select_panel:close()

		slot0.form_hallows_select_panel = nil
	end
end

function HeroController.openHeroUpgradeStarSelectPanel(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == true then
		if not slot0.upgrade_star_select_panel then
			slot0.upgrade_star_select_panel = HeroUpgradeStarSelectPanel.New()

			slot0.upgrade_star_select_panel:open(slot2, slot3, slot4, slot5)
		elseif slot0.upgrade_star_select_panel and slot0.upgrade_star_select_panel:isOpen() == false then
			slot0.upgrade_star_select_panel:open()
			slot0.upgrade_star_select_panel:openRootWnd(slot2, slot3, slot4, slot5)
		end
	elseif slot0.upgrade_star_select_panel then
		slot0.upgrade_star_select_panel:close()

		slot0.upgrade_star_select_panel = nil
	end
end

function HeroController.openHeroSelectHeroPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.hero_select_panel then
			slot0.hero_select_panel = HeroSelectHeroPanel.New()

			slot0.hero_select_panel:open(slot2)
		elseif slot0.hero_select_panel and slot0.hero_select_panel:isOpen() == false then
			slot0.hero_select_panel:open()
			slot0.hero_select_panel:openRootWnd(slot2)
		end
	elseif slot0.hero_select_panel then
		slot0.hero_select_panel:close()

		slot0.hero_select_panel = nil
	end
end

function HeroController.openHeroResetWindow(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.hero_reset_window ~= nil then
			slot0.hero_reset_window:close()

			slot0.hero_reset_window = nil
		end
	else
		if slot0.hero_reset_window == nil then
			slot0.hero_reset_window = HeroResetWindow.New(slot2)
		end

		slot0.hero_reset_window:open(slot2, slot3)
	end
end

function HeroController.openBreakChipWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.break_chip_window then
			slot0.break_chip_window = HeroChipsBreakWindow.New()
		end

		if slot0.break_chip_window:isOpen() == false then
			slot0.break_chip_window:open()
		end
	elseif slot0.break_chip_window then
		slot0.break_chip_window:close()

		slot0.break_chip_window = nil
	end
end

function HeroController.openHeroResetReturnPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.hero_reset_return_panel ~= nil then
			slot0.hero_reset_return_panel:close()

			slot0.hero_reset_return_panel = nil
		end
	else
		if slot0.hero_reset_return_panel == nil then
			slot0.hero_reset_return_panel = HeroResetReturnPanel.New()
		end

		slot0.hero_reset_return_panel:open(slot2)
	end
end

function HeroController.openHeroResetOfferPanel(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot1 == false then
		if slot0.hero_reset_offer_panel ~= nil then
			slot0.hero_reset_offer_panel:close()

			slot0.hero_reset_offer_panel = nil
		end
	else
		if slot0.hero_reset_offer_panel == nil then
			slot0.hero_reset_offer_panel = HeroResetOfferPanel.New()
		end

		slot0.hero_reset_offer_panel:open(slot2, slot3, slot4, slot5, slot6)
	end
end

function HeroController.openEquipPanel(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot1 == true then
		if not slot0.equip_panel then
			slot0.equip_panel = EquipClothWindow.New(slot2, slot3, slot4, slot5, slot6)
		end

		if slot0.equip_panel and slot0.equip_panel:isOpen() == false then
			slot0.equip_panel:open()
		end
	elseif slot0.equip_panel then
		slot0.equip_panel:close()

		slot0.equip_panel = nil
	end
end

function HeroController.openEquipTips(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == true then
		if GuideController:getInstance():isInGuide() then
			return
		end

		if not slot0.equip_tips then
			slot0.equip_tips = EquipTips.New()
		end

		if slot0.equip_tips and slot0.equip_tips:isOpen() == false then
			slot0.equip_tips:open({
				data = slot2,
				open_type = slot3 or PartnerConst.EqmTips.normal,
				partner = slot4,
				holy_data = slot5
			})
		end
	elseif slot0.equip_tips then
		slot0.equip_tips:close()

		slot0.equip_tips = nil
	end
end

function HeroController.openArtifactRecastWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.artifact_recast_win then
			slot0.artifact_recast_win = ArtifactRecastWindow.New()
		end

		if slot0.artifact_recast_win:isOpen() == false then
			slot0.artifact_recast_win:open(slot2, slot3)
		end
	elseif slot0.artifact_recast_win then
		slot0.artifact_recast_win:close()

		slot0.artifact_recast_win = nil
	end
end

function HeroController.openArtifactListWindow(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if not slot0.artifact_list_panel then
			slot0.artifact_list_panel = ArtifactListWindow.New()
		end

		if not slot2 then
			slot2 = 0
		end

		if slot0.artifact_list_panel and slot0.artifact_list_panel:isOpen() == false then
			slot0.artifact_list_panel:open(slot2, slot3 or 0, slot4)
		end
	elseif slot0.artifact_list_panel then
		slot0.artifact_list_panel:close()

		slot0.artifact_list_panel = nil
	end
end

function HeroController.openArtifactChoseWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.artifact_chose_window then
			slot0.artifact_chose_window = ArtifactChoseWindow.New()
		end

		slot0.artifact_chose_window:open(slot2)
	elseif slot0.artifact_chose_window then
		slot0.artifact_chose_window:close()

		slot0.artifact_chose_window = nil
	end
end

function HeroController.openArtifactTipsWindow(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if slot1 == true then
		if slot2 == nil or slot2.config == nil then
			return
		end

		if not slot0.artifact_tips_window then
			slot0.artifact_tips_window = ArtifactTipsWindow.New()
		end

		if slot0.artifact_tips_window and slot0.artifact_tips_window:isOpen() == false then
			slot0.artifact_tips_window:open(slot2, slot3 or PartnerConst.ArtifactTips.backpack, slot4, slot5, slot6, slot7)
		end
	elseif slot0.artifact_tips_window then
		slot0.artifact_tips_window:close()

		slot0.artifact_tips_window = nil
	end
end

function HeroController.openArtifactComTipsWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.artifact_com_win then
			slot0.artifact_com_win = ArtifactComTipsWindow.New()
		end

		if slot0.artifact_com_win:isOpen() == false then
			slot0.artifact_com_win:open(slot2)
		end
	elseif slot0.artifact_com_win then
		slot0.artifact_com_win:close()

		slot0.artifact_com_win = nil
	end
end

function HeroController.openArtifactAwardWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.artifact_award_win then
			slot0.artifact_award_win = ArtifactAwardWindow.New()
		end

		if slot0.artifact_award_win:isOpen() == false then
			slot0.artifact_award_win:open()
		end
	elseif slot0.artifact_award_win then
		slot0.artifact_award_win:close()

		slot0.artifact_award_win = nil
	end
end

function HeroController.openArtifactSkillWindow(slot0, slot1, slot2, slot3)
	if slot1 then
		if not slot0.artifact_skill_win then
			slot0.artifact_skill_win = ArtifactSkillWindow.New()
		end

		if slot0.artifact_skill_win:isOpen() == false then
			slot0.artifact_skill_win:open(slot2, slot3)
		end
	elseif slot0.artifact_skill_win then
		slot0.artifact_skill_win:close()

		slot0.artifact_skill_win = nil
	end
end

function HeroController.openArtifactRecastCostPanel(slot0, slot1)
	if slot1 then
		if not slot0.artifact_recast_cost_win then
			slot0.artifact_recast_cost_win = ArtifactRecastCostPanel.New()
		end

		if slot0.artifact_recast_cost_win:isOpen() == false then
			slot0.artifact_recast_cost_win:open()
		end
	elseif slot0.artifact_recast_cost_win then
		slot0.artifact_recast_cost_win:close()

		slot0.artifact_recast_cost_win = nil
	end
end

function HeroController.openHeroTipsPanel(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.hero_tips_panel then
			slot0.hero_tips_panel = HeroTipsPanel.New()
		end

		slot0.hero_tips_panel:open(slot2, slot3)
	elseif slot0.hero_tips_panel then
		slot0.hero_tips_panel:close()

		slot0.hero_tips_panel = nil
	end
end

function HeroController.openHeroTipsAttrPanel(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.hero_tips_attr_panel then
			slot0.hero_tips_attr_panel = HeroTipsAttrPanel.New()
		end

		slot0.hero_tips_attr_panel:open(slot2, slot3)
	elseif slot0.hero_tips_attr_panel then
		slot0.hero_tips_attr_panel:close()

		slot0.hero_tips_attr_panel = nil
	end
end

function HeroController.openHeroTipsPanelByBid(slot0, slot1)
	if slot0.model:getMockHeroVoByBid(slot1) then
		slot0:openHeroTipsPanel(true, slot2, {
			is_hide_equip = true
		})
	end
end

function HeroController.openHeroInfoWindowByBidStar(slot0, slot1, slot2, slot3)
	if not slot1 or not slot2 then
		return
	end

	if slot0.model:getHeroPokedexByBid(getNorKey(slot1, slot2)) then
		slot0:openHeroMainInfoWindow(true, slot5, {
			slot5
		}, {
			is_hide_ui = true,
			show_model_type = HeroConst.BagTab.eBagPokedex
		})
	end
end

function HeroController.openHeroTalentSkillLearnPanel(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.hero_talent_skill_panel then
			slot0.hero_talent_skill_panel = HeroTalentSkillLearnPanel.New()
		end

		slot0.hero_talent_skill_panel:open(slot2, slot3)
	elseif slot0.hero_talent_skill_panel then
		slot0.hero_talent_skill_panel:close()

		slot0.hero_talent_skill_panel = nil
	end
end

function HeroController.openHeroTalentSkillLevelUpPanel(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if not slot0.hero_talent_levelup_panel then
			slot0.hero_talent_levelup_panel = HeroTalentSkillLevelUpPanel.New()
		end

		slot0.hero_talent_levelup_panel:open(slot2, slot3, slot4)
	elseif slot0.hero_talent_levelup_panel then
		slot0.hero_talent_levelup_panel:close()

		slot0.hero_talent_levelup_panel = nil
	end
end

function HeroController.openHeroSharePanel(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if not slot0.hero_share_panel then
			slot0.hero_share_panel = HeroSharePanel.New()
		end

		slot0.hero_share_panel:open(slot2, slot3, slot4)
	elseif slot0.hero_share_panel then
		slot0.hero_share_panel:close()

		slot0.hero_share_panel = nil
	end
end

function HeroController.openHolyequipmentRefreshAttPanel(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.holy_equipment_refresh_att_panel then
			slot0.holy_equipment_refresh_att_panel = HolyequipmentRefreshAttPanel.New()
		end

		slot0.holy_equipment_refresh_att_panel:open(slot2, slot3)
	elseif slot0.holy_equipment_refresh_att_panel then
		slot0.holy_equipment_refresh_att_panel:close()

		slot0.holy_equipment_refresh_att_panel = nil
	end
end

function HeroController.openHeroClothesLustratWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.hero_clothes_lustrat_view then
			slot0.hero_clothes_lustrat_view = HeroClothesLustratWindow.New()
		end

		slot0.hero_clothes_lustrat_view:open()
	elseif slot0.hero_clothes_lustrat_view then
		slot0.hero_clothes_lustrat_view:close()

		slot0.hero_clothes_lustrat_view = nil
	end
end

function HeroController.openHolyequipmentTotalAttrPanel(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.holyequipment_total_attr_panel then
			slot0.holyequipment_total_attr_panel = HolyequipmentTotalAttrPanel.New()
		end

		slot0.holyequipment_total_attr_panel:open(slot2, slot3)
	elseif slot0.holyequipment_total_attr_panel then
		slot0.holyequipment_total_attr_panel:close()

		slot0.holyequipment_total_attr_panel = nil
	end
end

function HeroController.openHolyequipmentPlanPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.holyequipment_plan_panel then
			slot0.holyequipment_plan_panel = HolyequipmentPlanPanel.New()
		end

		slot0.holyequipment_plan_panel:open(slot2)
	elseif slot0.holyequipment_plan_panel then
		slot0.holyequipment_plan_panel:close()

		slot0.holyequipment_plan_panel = nil
	end
end

function HeroController.openHeroHolyEquipClothPanel(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	if slot1 == true then
		if not slot0.equip_cloth_panel then
			slot0.equip_cloth_panel = HeroHolyEquipClothPanel.New(slot2, slot3, slot4, slot5, slot6, slot7, slot8)
		end

		if slot0.equip_cloth_panel and slot0.equip_cloth_panel:isOpen() == false then
			slot0.equip_cloth_panel:open()
		end
	elseif slot0.equip_cloth_panel then
		slot0.equip_cloth_panel:close()

		slot0.equip_cloth_panel = nil
	end
end

function HeroController.openHolyequipmentSaveTips(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.holyequipment_save_tips then
			slot0.holyequipment_save_tips = HolyequipmentSaveTips.New()
		end

		if slot0.holyequipment_save_tips:isOpen() == false then
			slot0.holyequipment_save_tips:open(slot2)
		end
	elseif slot0.holyequipment_save_tips then
		slot0.holyequipment_save_tips:close()

		slot0.holyequipment_save_tips = nil
	end
end

function HeroController.openHolyequipmentWearTips(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.holyequipment_wear_tips then
			slot0.holyequipment_wear_tips = HolyequipmentWearTips.New()
		end

		if slot0.holyequipment_wear_tips:isOpen() == false then
			slot0.holyequipment_wear_tips:open(slot2)
		end
	elseif slot0.holyequipment_wear_tips then
		slot0.holyequipment_wear_tips:close()

		slot0.holyequipment_wear_tips = nil
	end
end

function HeroController.openHolyequipmentChooseTips(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.holyequipment_choose_tips then
			slot0.holyequipment_choose_tips = HolyequipmentChooseTips.New()
		end

		if slot0.holyequipment_choose_tips:isOpen() == false then
			slot0.holyequipment_choose_tips:open(slot2, slot3)
		end
	elseif slot0.holyequipment_choose_tips then
		slot0.holyequipment_choose_tips:close()

		slot0.holyequipment_choose_tips = nil
	end
end

function HeroController.openHeroSkinWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.hero_skin_window then
			slot0.hero_skin_window = HeroSkinWindow.New()
		end

		slot0.hero_skin_window:open(slot2)
	elseif slot0.hero_skin_window then
		slot0.hero_skin_window:close()

		slot0.hero_skin_window = nil
	end
end

function HeroController.openHeroSkinUpgradeWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.hero_skin_upgrade_window then
			slot0.hero_skin_upgrade_window = HeroSkinUpgradeWindow.New()
		end

		slot0.hero_skin_upgrade_window:open(slot2, slot3)
	elseif slot0.hero_skin_upgrade_window then
		slot0.hero_skin_upgrade_window:close()

		slot0.hero_skin_upgrade_window = nil
	end
end

function HeroController.openHeroSkinUpgradeWindow2(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.hero_skin_upgrade_window2 then
			slot0.hero_skin_upgrade_window2 = HeroSkinUpgradeWindow2.New()
		end

		slot0.hero_skin_upgrade_window2:open(slot2, slot3)
	elseif slot0.hero_skin_upgrade_window2 then
		slot0.hero_skin_upgrade_window2:close()

		slot0.hero_skin_upgrade_window2 = nil
	end
end

function HeroController.openHeroSkinUpgradePreviewWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.hero_skin_upgrade_preview_window then
			slot0.hero_skin_upgrade_preview_window = HeroSkinUpgradePreviewWindow.New()
		end

		slot0.hero_skin_upgrade_preview_window:open(slot2, slot3)
	elseif slot0.hero_skin_upgrade_preview_window then
		slot0.hero_skin_upgrade_preview_window:close()

		slot0.hero_skin_upgrade_preview_window = nil
	end
end

function HeroController.openHeroSkinTipsPanel(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if not slot0.hero_skin_tips_panel then
			slot0.hero_skin_tips_panel = HeroSkinTipsPanel.New()
		end

		slot0.hero_skin_tips_panel:open(slot2, slot3, slot4)
	elseif slot0.hero_skin_tips_panel then
		slot0.hero_skin_tips_panel:close()

		slot0.hero_skin_tips_panel = nil
	end
end

function HeroController.openHeroResonateWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.model:checkResonateIsOpen() then
			return
		end

		if not slot0.hero_resonate_window then
			slot0.hero_resonate_window = HeroResonateWindow.New()
		end

		slot0.hero_resonate_window:open(slot2)
	elseif slot0.hero_resonate_window then
		slot0.hero_resonate_window:close()

		slot0.hero_resonate_window = nil
	end
end

function HeroController.openHeroResonateExtractPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.model:checkResonateIsOpen() then
			return
		end

		if not slot0.hero_resonate_extract_panel then
			slot0.hero_resonate_extract_panel = HeroResonateExtractPanel.New()
		end

		slot0.hero_resonate_extract_panel:open(slot2)
	elseif slot0.hero_resonate_extract_panel then
		slot0.hero_resonate_extract_panel:close()

		slot0.hero_resonate_extract_panel = nil
	end
end

function HeroController.openHeroResonateSelectTalentSkillPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.hero_resonate_select_talent_skill_panel then
			slot0.hero_resonate_select_talent_skill_panel = HeroResonateSelectTalentSkillPanel.New()
		end

		slot0.hero_resonate_select_talent_skill_panel:open(slot2)
	elseif slot0.hero_resonate_select_talent_skill_panel then
		slot0.hero_resonate_select_talent_skill_panel:close()

		slot0.hero_resonate_select_talent_skill_panel = nil
	end
end

function HeroController.openHeroResonateSelectExpPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.model:checkResonateIsOpen() then
			return
		end

		if not slot0.hero_resonate_select_exp_panel then
			slot0.hero_resonate_select_exp_panel = HeroResonateSelectExpPanel.New()
		end

		slot0.hero_resonate_select_exp_panel:open(slot2)
	elseif slot0.hero_resonate_select_exp_panel then
		slot0.hero_resonate_select_exp_panel:close()

		slot0.hero_resonate_select_exp_panel = nil
	end
end

function HeroController.openHeroResonatePutDownPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.model:checkResonateIsOpen() then
			return
		end

		if not slot0.hero_resonate_put_down_panel then
			slot0.hero_resonate_put_down_panel = HeroResonatePutDownPanel.New()
		end

		slot0.hero_resonate_put_down_panel:open(slot2)
	elseif slot0.hero_resonate_put_down_panel then
		slot0.hero_resonate_put_down_panel:close()

		slot0.hero_resonate_put_down_panel = nil
	end
end

function HeroController.openHeroResonatePutResultPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.hero_resonate_put_result_panel then
			slot0.hero_resonate_put_result_panel = HeroResonatePutResultPanel.New()
		end

		slot0.hero_resonate_put_result_panel:open(slot2)
	elseif slot0.hero_resonate_put_result_panel then
		slot0.hero_resonate_put_result_panel:close()

		slot0.hero_resonate_put_result_panel = nil
	end
end

function HeroController.openHeroResonateComfirmLevPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.hero_resonate_comfirm_lev_panel then
			slot0.hero_resonate_comfirm_lev_panel = HeroResonateComfirmLevPanel.New()
		end

		slot0.hero_resonate_comfirm_lev_panel:open(slot2)
	elseif slot0.hero_resonate_comfirm_lev_panel then
		slot0.hero_resonate_comfirm_lev_panel:close()

		slot0.hero_resonate_comfirm_lev_panel = nil
	end
end

function HeroController.openHeroResetComfirmPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.hero_reset_comfirm_panel then
			slot0.hero_reset_comfirm_panel = HeroResetComfirmPanel.New()
		end

		slot0.hero_reset_comfirm_panel:open(slot2)
	elseif slot0.hero_reset_comfirm_panel then
		slot0.hero_reset_comfirm_panel:close()

		slot0.hero_reset_comfirm_panel = nil
	end
end

function HeroController.getHeroBagRoot(slot0)
	if slot0.hero_bag_window ~= nil then
		return slot0.hero_bag_window.root_wnd
	end
end

function HeroController.getHeroMianInfoRoot(slot0)
	if slot0.hero_main_info_window ~= nil then
		return slot0.hero_main_info_window.root_wnd
	end
end

function HeroController.getHeroFormRoot(slot0)
	if slot0.form_window ~= nil then
		return slot0.form_window.root_wnd
	end
end

function HeroController.getHeroGoFightRoot(slot0)
	if slot0.form_go_fight_panel ~= nil then
		return slot0.form_go_fight_panel.root_wnd
	end
end

function HeroController.getHeroHolyEquipClothPanelRoot(slot0)
	if slot0.equip_cloth_panel ~= nil then
		return slot0.equip_cloth_panel.root_wnd
	end
end

function HeroController.getHeroResonateWindowRoot(slot0)
	if slot0.hero_resonate_window ~= nil then
		return slot0.hero_resonate_window.root_wnd
	end
end

function HeroController.onPlayHeroVoice(slot0, slot1, slot2, slot3)
	if slot3 == nil or slot3 == "" then
		slot3 = AudioManager.AUDIO_TYPE.DUBBING
	end

	if (slot2 or 4) == 0 then
		slot4 = 4
	end

	slot4 = slot4 + 1

	if slot0.voice_time_ticket == nil then
		AudioManager:getInstance():setMusicVolume((SysEnv:getInstance():getNum(SysEnv.keys.music_volume, 100) - 60) / 100)
	else
		GlobalTimeTicket:getInstance():remove(slot0.voice_time_ticket)

		slot0.voice_time_ticket = nil
	end

	if slot0.hero_music ~= nil then
		AudioManager:getInstance():removeEffectByData(slot0.hero_music)
	end

	slot0.hero_music = AudioManager:getInstance():playEffect(slot3, slot1, false)
	slot0.voice_time_ticket = GlobalTimeTicket:getInstance():add(function ()
		AudioManager:getInstance():setMusicVolume(SysEnv:getInstance():getNum(SysEnv.keys.music_volume, 100) / 100)

		uv0.voice_time_ticket = nil
	end, slot4, 1)
end

function HeroController.showSingleRowItemList(slot0, slot1, slot2, slot3, slot4)
	if not slot1 then
		return
	end

	if not slot3 then
		return
	end

	if slot2 then
		for slot9, slot10 in pairs(slot5) do
			if slot10.DeleteMe then
				slot10:DeleteMe()

				slot10 = nil
			end
		end

		slot5 = {}
	end

	if slot5 == nil then
		slot5 = {}
	end

	if #slot3 == 0 then
		return
	end

	slot6 = slot4 or {}
	slot12 = slot6.lock or false
	slot13 = slot6.is_show_action or false
	slot14 = slot6.is_tip
	slot15 = slot6.callback or false
	slot16 = #slot3
	slot18 = slot1:getContentSize()

	slot1:setInnerContainerSize(cc.size(math.max(slot18.width, (slot6.start_x or 5) * 2 + (slot6.item_width or BackPackItem.Width) * (slot6.scale or 1) * slot16 + (slot6.space_x or 5) * (slot16 - 1)), slot18.height))

	if slot6.max_count and slot16 < slot10 then
		slot1:setTouchEnabled(false)

		if slot6.is_center and (slot18.width - slot17) * 0.5 < 0 then
			slot8 = 0
		end
	else
		slot1:setTouchEnabled(true)
	end

	slot1:stopAllActions()

	function slot20(slot0, slot1, slot2)
		slot0:setVisible(true)
		slot0:setPosition(uv0 + (slot2 - 1) * (uv1 + uv2), uv3.height * 0.5)
		slot0:setBaseData(slot1[1], slot1[2], true)
		slot0:showOrderWarLock(uv4)

		if uv5 then
			slot0:addCallBack(function ()
				uv0()
			end)
		end

		if slot1[3] then
			slot0:setGoodsName(slot1[3], nil, 24, nil)
		end

		slot0:setDefaultTip(uv6)

		if uv7.show_effect_id then
			slot0:showItemEffect(true, uv7.show_effect_id, PlayerAction.action_1, true, 1.1)
		else
			slot0:showItemEffect(false)
		end
	end

	slot21 = nil

	for slot26, slot27 in ipairs(slot3) do
		if slot26 - #slot5 <= 0 then
			slot28 = 1
		end

		slot29 = 0

		delayRun(slot1, slot13 and 0.1 * slot28 or slot28 / display.DEFAULT_FPS, function ()
			if not uv0[uv1] then
				if uv2.show_type ~= nil and uv2.show_type == MainuiConst.item_exhibition_type.partner_type then
					uv3 = HeroExhibitionItem.new(uv4, true)

					uv3:addCallBack(function ()
					end)
					uv3:setPosition(uv5 + (uv1 - 1) * (uv6 + uv7), uv8.height * 0.5)
					uv3:setAnchorPoint(cc.p(0, 0.5))
					uv3:setData(uv2)
					uv9:addChild(uv3)

					uv0[uv1] = uv3
				else
					uv3 = BackPackItem.new(true, true)

					uv3:setAnchorPoint(0, 0.5)
					uv3:setScale(uv4)
					uv3:setSwallowTouches(false)
					uv9:addChild(uv3)

					uv0[uv1] = uv3

					uv10(uv3, uv2, uv1)

					if uv11 then
						uv3:setScale(uv4 * 1.3)
						uv3:runAction(cc.ScaleTo:create(0.1, uv4))
					end
				end
			end
		end)
	end

	return slot5
end

function HeroController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
