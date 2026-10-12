RoleController = RoleController or BaseClass(BaseController)

function RoleController.config(slot0)
	slot0.model = RoleModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.apk_data = nil
	slot0.is_re_connect = false

	get_apk_url(function (slot0)
		if slot0.success == true then
			uv0.apk_data = slot0
		end
	end)
end

function RoleController.getModel(slot0)
	return slot0.model
end

function RoleController.setReconnect(slot0, slot1)
	slot0.is_re_connect = slot1
end

function RoleController.registerEvents(slot0)
	if not slot0.role_vo_event then
		slot0.role_vo_event = GlobalEvent:getInstance():Bind(RoleEvent.UPDATE_ROLE_BASE_ATTR, function ()
			if uv0.cache_list and next(uv0.cache_list) ~= nil and uv0:getRoleVo() then
				slot0:setRoleAttribute(uv0.cache_list.key, uv0.cache_list.value)

				uv0.cache_list = nil
			end
		end)
	end
end

function RoleController.registerProtocals(slot0)
	slot0:RegisterProtocal(10301, "rgp_hander10301")
	slot0:RegisterProtocal(10302, "rgp_hander10302")
	slot0:RegisterProtocal(10305, "rgp_hander10305")
	slot0:RegisterProtocal(10303, "rgp_hander10303")
	slot0:RegisterProtocal(10306, "rgp_hander10306")
	slot0:RegisterProtocal(10307, "rgp_hander10307")
	slot0:RegisterProtocal(10309, "rgp_hander10309")
	slot0:RegisterProtocal(10315, "rgp_hander10315")
	slot0:RegisterProtocal(10316, "rgp_hander10316")
	slot0:RegisterProtocal(10318, "rgp_hander10318")
	slot0:RegisterProtocal(10325, "rgp_hander10325")
	slot0:RegisterProtocal(10327, "rgp_hander10327")
	slot0:RegisterProtocal(10342, "rgp_hander10342")
	slot0:RegisterProtocal(10343, "rgp_hander10343")
	slot0:RegisterProtocal(10345, "rgp_hander10345")
	slot0:RegisterProtocal(10346, "rgp_hander10346")
	slot0:RegisterProtocal(10347, "rgp_hander10347")
	slot0:RegisterProtocal(10317, "rgp_hander10317")
	slot0:RegisterProtocal(10319, "rgp_hander10319")
	slot0:RegisterProtocal(12745, "rgp_hander12745")
	slot0:RegisterProtocal(12746, "rgp_hander12746")
	slot0:RegisterProtocal(10995, "rgp_hander10995")
	slot0:RegisterProtocal(21500, "rgp_hander21500")
	slot0:RegisterProtocal(21501, "rgp_hander21501")
	slot0:RegisterProtocal(21502, "rgp_hander21502")
	slot0:RegisterProtocal(21503, "rgp_hander21503")
	slot0:RegisterProtocal(12700, "rgp_hander12700")
	slot0:RegisterProtocal(12701, "rgp_hander12701")
	slot0:RegisterProtocal(12702, "rgp_hander12702")
	slot0:RegisterProtocal(12703, "rgp_hander12703")
	slot0:RegisterProtocal(10380, "rgp_hander10380")
	slot0:RegisterProtocal(23300, "hander23300")
	slot0:RegisterProtocal(23301, "hander23301")
	slot0:RegisterProtocal(23302, "hander23302")
	slot0:RegisterProtocal(23303, "hander23303")
	slot0:RegisterProtocal(23304, "hander23304")
	slot0:RegisterProtocal(10945, "handle10945")
	slot0:RegisterProtocal(10994, "handle10994")
	slot0:RegisterProtocal(10905, "handle10905")
	slot0:RegisterProtocal(10906, "handle10906")
	slot0:RegisterProtocal(10907, "handle10907")
	slot0:RegisterProtocal(10395, "handle10395")
	slot0:RegisterProtocal(12744, "handle12744")
	slot0:RegisterProtocal(10350, "handle10350")
	slot0:RegisterProtocal(10351, "handle10351")
	slot0:RegisterProtocal(24500, "handle24500")
	slot0:RegisterProtocal(12770, "handle12770")
	slot0:RegisterProtocal(12771, "handle12771")
	slot0:RegisterProtocal(12772, "handle12772")
	slot0:RegisterProtocal(25800, "handle25800")
	slot0:RegisterProtocal(25801, "handle25801")
	slot0:RegisterProtocal(25802, "handle25802")
	slot0:RegisterProtocal(25805, "handle25805")
	slot0:RegisterProtocal(25806, "handle25806")
	slot0:RegisterProtocal(25807, "handle25807")
	slot0:RegisterProtocal(25815, "handle25815")
	slot0:RegisterProtocal(25816, "handle25816")
	slot0:RegisterProtocal(25817, "handle25817")
	slot0:RegisterProtocal(25818, "handle25818")
	slot0:RegisterProtocal(25819, "handle25819")
	slot0:RegisterProtocal(25820, "handle25820")
	slot0:RegisterProtocal(25830, "handle25830")
	slot0:RegisterProtocal(25831, "handle25831")
	slot0:RegisterProtocal(25832, "handle25832")
	slot0:RegisterProtocal(25833, "handle25833")
	slot0:RegisterProtocal(25835, "handle25835")
	slot0:RegisterProtocal(25836, "handle25836")
	slot0:RegisterProtocal(25837, "handle25837")
	slot0:RegisterProtocal(25838, "handle25838")
	slot0:RegisterProtocal(25839, "handle25839")
	slot0:RegisterProtocal(25840, "handle25840")
	slot0:RegisterProtocal(25841, "handle25841")
	slot0:RegisterProtocal(25813, "handle25813")
	slot0:RegisterProtocal(25814, "handle25814")
	slot0:RegisterProtocal(10328, "handle10328")
	slot0:RegisterProtocal(10329, "handle10329")
	slot0:RegisterProtocal(10960, "handle10960")
	slot0:RegisterProtocal(10961, "handle10961")
	slot0:RegisterProtocal(10330, "handle10330")
	slot0:RegisterProtocal(10332, "handle10332")
	slot0:RegisterProtocal(10333, "handle10333")
	slot0:RegisterProtocal(10360, "handle10360")
	slot0:RegisterProtocal(10947, "handle10947")
	slot0:RegisterProtocal(10985, "handle10985")
	slot0:RegisterProtocal(10986, "handle10986")
end

function RoleController.getRoleVo(slot0)
	return slot0.model:getRoleVo()
end

function RoleController.isTheSameSvr(slot0, slot1)
	slot2 = slot0:getRoleVo()

	if slot1 and slot0.model:isTheSame(slot1) then
		return true
	else
		return false
	end
end

function RoleController.checkIsSelf(slot0, slot1, slot2)
	if slot0:getRoleVo() == nil then
		return false
	else
		return slot3.srv_id == slot1 and slot3.rid == slot2
	end
end

function RoleController.rgp_hander10301(slot0, slot1)
	slot0.model:initRoleBaseData(slot1)

	if not slot0.init_role then
		slot0.init_role = true

		RoleEnv:getInstance():load()
		GlobalEvent:getInstance():Fire(EventId.ROLE_CREATE_SUCCESS)
		slot0:requestCustomHeadInfo()
		ViewManager:getInstance():initMainFunBar()
		slot0:sender10907()
		SysController:getInstance():requestLoginProtocals()
		LoginController:getInstance():getModel():cacheNearLoginData(nil, slot1.rid, slot1.srv_id)
		report_sign_in()
		sdkSubmitUserData(3)
		RoleController:getInstance():sender10303()

		if IS_NEED_REAL_NAME == true then
			if NEW_REAL_NAME_FLAG == true then
				if queryRealNameInfo() ~= "" and PLATFORM_NAME == "9377" then
					RoleController:getInstance():sender10395(tonumber(slot2))
				end
			else
				RoleController:getInstance():sender10395(-1)
			end
		end
	end

	if slot0.is_re_connect == true then
		slot0:SendProtocal(10380, {})
		GlobalEvent:getInstance():Fire(LoginEvent.RE_LINK_GAME)

		slot0.is_re_connect = false

		if CommonNumClearRes then
			CommonNumClearRes()
		end

		slot0:sender10907()
	end
end

function RoleController.rgp_hander10302(slot0, slot1)
	if not slot1 then
		return
	end

	slot1.coin = tonumber(slot1.coin)
	slot1.gold = tonumber(slot1.gold)
	slot1.hero_exp = tonumber(slot1.hero_exp)

	slot0.model:initRoleAssetsData(slot1)
end

function RoleController.sender10303(slot0)
	slot0:SendProtocal(10303, {})
end

function RoleController.rgp_hander10303(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.model:initRoleAssetsData(slot1, true)
end

function RoleController.handle10350(slot0, slot1)
	slot0.model:initRoleActionAssetsData(slot1.holiday_assets, false)
end

function RoleController.handle10351(slot0, slot1)
	slot0.model:initRoleActionAssetsData(slot1.holiday_assets, true)
end

function RoleController.requestEnergyData(slot0)
end

function RoleController.rgp_hander10307(slot0, slot1)
	if slot0:getRoleVo() ~= nil then
		slot2:setRoleAttribute("event", slot1.event)
	end
end

function RoleController.rgp_hander10306(slot0, slot1)
	if slot0:getRoleVo() and slot2.power then
		if slot0.is_show_power == true and (slot1.power - slot2.power or 0) > 0 then
			GlobalMessageMgr:getInstance():showPowerMove(slot3, nil, slot2.power)
		end

		slot2:setPower(slot1.power)
		slot2:setMaxPower(slot1.max_power)
	end

	slot0:showPower(false)
end

function RoleController.showPower(slot0, slot1)
	slot0.is_show_power = slot1
end

function RoleController.rgp_hander10305(slot0, slot1)
	if slot1.assets and next(slot2) ~= nil then
		slot0.model:updateRoleAssets(slot2)
	end
end

function RoleController.rgp_hander10995(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0:getRoleVo() then
		if slot1.main_srv_id then
			slot2:setRoleAttribute("main_srv_id", slot1.main_srv_id)
		end

		slot0.model:setServerList(slot1.srv_list)
	else
		slot0.cache_list = {
			key = "main_srv_id",
			value = slot1.main_srv_id
		}
	end
end

function RoleController.sender21500(slot0)
	slot0:SendProtocal(21500, {})
end

function RoleController.rgp_hander21500(slot0, slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.GetFaceList, slot1)
end

function RoleController.sender21501(slot0, slot1)
	slot0:SendProtocal(21501, {
		base_id = slot1
	})
end

function RoleController.rgp_hander21501(slot0, slot1)
end

function RoleController.rgp_hander21502(slot0, slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.GetFaceList, slot1)
end

function RoleController.sender21503(slot0, slot1)
	slot0:SendProtocal(21503, {
		base_id = slot1
	})
end

function RoleController.rgp_hander21503(slot0, slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.GetFaceList, slot1)
end

function RoleController.sender12700(slot0)
	slot0:SendProtocal(12700, {})
end

function RoleController.rgp_hander12700(slot0, slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.GetBubbleList, slot1)
end

function RoleController.sender12701(slot0, slot1)
	slot0:SendProtocal(12701, {
		base_id = slot1
	})
end

function RoleController.rgp_hander12701(slot0, slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.UseBubbleItem, slot1)
end

function RoleController.rgp_hander12702(slot0, slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.GetBubbleList, slot1)
end

function RoleController.sender12703(slot0, slot1)
	slot0:SendProtocal(12703, {
		base_id = slot1
	})
end

function RoleController.rgp_hander12703(slot0, slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.GetBubbleList, slot1)
end

function RoleController.rgp_hander10380(slot0, slot1)
	slot0.model:setSrvDay(slot1)
end

function RoleController.sender25813(slot0, slot1)
	slot0:SendProtocal(25813, {
		id = slot1
	})
end

function RoleController.handle25813(slot0, slot1)
end

function RoleController.sender25814(slot0)
	slot0:SendProtocal(25814, {})
end

function RoleController.handle25814(slot0, slot1)
	if MAKELIFEBETTER == true then
		return
	end

	if slot1.result == 1 and Config.RoomFeatData.data_const.home_world_feat then
		slot0:openRoleAchieveWindow(true, {
			id = slot2.val,
			view_tag = ViewMgrTag.LOADING_TAG
		})
	end
end

function RoleController.sender10328(slot0)
	slot0:SendProtocal(10328, {})
end

function RoleController.handle10328(slot0, slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.ROLE_BACKGROUND_LIST_EVENT, slot1)
end

function RoleController.sender10329(slot0, slot1)
	slot0:SendProtocal(10329, {
		backdrop_id = slot1
	})
end

function RoleController.handle10329(slot0, slot1)
	if slot1.code == TRUE then
		message(TI18N("设置空间背景成功"))
		slot0.model:setRoleAttribute("backdrop_id", slot1.backdrop_id)
	end
end

function RoleController.openRoleSystemSetPanel(slot0, slot1)
	if slot1 == true then
		if slot0.role_system_set_panel == nil then
			slot0.role_system_set_panel = RoleSystemSetPanel.New()
		end

		slot0.role_system_set_panel:open()
	elseif slot0.role_system_set_panel ~= nil then
		slot0.role_system_set_panel:close()

		slot0.role_system_set_panel = nil
	end
end

function RoleController.openRoleHeroShowFormPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.role_hero_show_form_panel == nil then
			slot0.role_hero_show_form_panel = RoleHeroShowFormPanel.New()
		end

		slot0.role_hero_show_form_panel:open(slot2)
	elseif slot0.role_hero_show_form_panel ~= nil then
		slot0.role_hero_show_form_panel:close()

		slot0.role_hero_show_form_panel = nil
	end
end

function RoleController.openRolePersonalSpacePanel(slot0, slot1, slot2)
	if ((slot2 or {}).role_type or RoleConst.role_type.eMySelf) == RoleConst.role_type.eOther then
		slot0:openOtherRolePersonalSpacePanel(slot1, slot3)
	elseif slot1 == true then
		if slot0.role_personal_space_panel then
			slot0.role_personal_space_panel:close()

			slot0.role_personal_space_panel = nil
		end

		if slot0.role_personal_space_panel == nil then
			slot0.role_personal_space_panel = RolePersonalSpacePanel.New(slot0)
		end

		slot0.role_personal_space_panel:open(slot3)
	elseif slot0.role_personal_space_panel ~= nil then
		slot0.role_personal_space_panel:close()

		slot0.role_personal_space_panel = nil
	end
end

function RoleController.openOtherRolePersonalSpacePanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.role_other_personal_space_panel ~= nil then
			slot0.role_other_personal_space_panel:close()

			slot0.role_other_personal_space_panel = nil
		end

		if slot0.role_other_personal_space_panel == nil then
			slot0.role_other_personal_space_panel = RolePersonalSpacePanel.New(slot0)
		end

		slot0.role_other_personal_space_panel:open(slot2)
	elseif slot0.role_other_personal_space_panel ~= nil then
		slot0.role_other_personal_space_panel:close()

		slot0.role_other_personal_space_panel = nil
	end
end

function RoleController.openRoleSelectHonorListPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.role_select_honor_list_panel == nil then
			slot0.role_select_honor_list_panel = RoleSelectHonorListPanel.New(slot0)
		end

		slot0.role_select_honor_list_panel:open(slot2)
	elseif slot0.role_select_honor_list_panel ~= nil then
		slot0.role_select_honor_list_panel:close()

		slot0.role_select_honor_list_panel = nil
	end
end

function RoleController.openRoleHonorUnlockPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.role_honor_unlock_panel == nil then
			slot0.role_honor_unlock_panel = RoleHonorUnlockPanel.New(slot0)
		end

		slot0.role_honor_unlock_panel:open(slot2)
	elseif slot0.role_honor_unlock_panel ~= nil then
		slot0.role_honor_unlock_panel:close()

		slot0.role_honor_unlock_panel = nil
	end
end

function RoleController.openRoleAchieveWindow(slot0, slot1, slot2)
end

function RoleController.openRoleMessageBoardReplyPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.role_message_board_reply_panel == nil then
			slot0.role_message_board_reply_panel = RoleMessageBoardReplyPanel.New(slot0)
		end

		if slot0.role_message_board_reply_panel then
			slot0.role_message_board_reply_panel:open(slot2)
		end
	elseif slot0.role_message_board_reply_panel ~= nil then
		slot0.role_message_board_reply_panel:close()

		slot0.role_message_board_reply_panel = nil
	end
end

function RoleController.openRoleAttestationWindow(slot0, slot1)
	if slot1 == true then
		if slot0.role_attestation_window == nil then
			slot0.role_attestation_window = RoleAttestationWindow.New(slot0)
		end

		slot0.role_attestation_window:open()
	elseif slot0.role_attestation_window ~= nil then
		slot0.role_attestation_window:close()

		slot0.role_attestation_window = nil
	end
end

function RoleController.openRoleChangeNameView(slot0, slot1)
	if slot1 == true then
		if slot0.role_change_name_view == nil then
			slot0.role_change_name_view = RoleChangeView.New(slot0)
		end

		if slot0.role_change_name_view:isOpen() == false and slot0.role_change_name_view then
			slot0.role_change_name_view:open()
		end
	elseif slot0.role_change_name_view ~= nil then
		slot0.role_change_name_view:close()

		slot0.role_change_name_view = nil
	end
end

function RoleController.openRoleDecorateView(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if slot0.role_decorate_new == nil then
			slot0.role_decorate_new = RoleDecorateWindow.New(slot0)
		end

		slot0.role_decorate_new:open(slot2, slot3)
	elseif slot0.role_decorate_new ~= nil then
		slot0.role_decorate_new:close()

		slot0.role_decorate_new = nil
	end
end

function RoleController.openRoleSetNameView(slot0, slot1)
	if slot1 == true then
		if slot0.role_setname_new == nil then
			slot0.role_setname_new = RoleSetNameView.New(slot0)
		end

		slot0.role_setname_new:open()
	elseif slot0.role_setname_new ~= nil then
		slot0.role_setname_new:close()

		slot0.role_setname_new = nil
	end
end

function RoleController.checkRoleSetNameViewIsOpen(slot0)
	if slot0.role_setname_new then
		return true
	end

	return false
end

function RoleController.send12770(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:SendProtocal(12770, {
		rid = slot1,
		srv_id = slot2,
		type = slot3 or 1,
		msg = slot4 or "",
		history = slot5 or {}
	})
end

function RoleController.handle12770(slot0, slot1)
	message(slot1.msg)
end

function RoleController.send12771(slot0, slot1, slot2)
	slot0:SendProtocal(12771, {
		rid = slot1,
		srv_id = slot2
	})
end

function RoleController.handle12771(slot0, slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.ROLE_REPORTED_EVENT, slot1)
end

function RoleController.handle12772(slot0, slot1)
	if slot1 then
		message(string.format(slot1.msg, TimeTool.GetTimeFormatDay2(slot1.end_time - GameNet:getInstance():getTime())))
	end
end

function RoleController.openRoleReportedPanel(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if slot0.role_reported_panel == nil then
			slot0.role_reported_panel = RoleReportedPanel.New(slot0)
		end

		slot0.role_reported_panel:open(slot2, slot3, slot4)
	elseif slot0.role_reported_panel ~= nil then
		slot0.role_reported_panel:close()

		slot0.role_reported_panel = nil
	end
end

function RoleController.send25800(slot0, slot1)
	slot0:SendProtocal(25800, {
		city_id = slot1
	})
end

function RoleController.handle25800(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(RoleEvent.ROLE_CITY_EVENT, slot1)
	end
end

function RoleController.send25801(slot0, slot1, slot2)
	slot0:SendProtocal(25801, {
		rid = slot1,
		srv_id = slot2
	})
end

function RoleController.handle25801(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(RoleEvent.ROLE_FOLLOW_EVENT, slot1)
	end
end

function RoleController.send25802(slot0)
	slot0:SendProtocal(25802, {})
end

function RoleController.handle25802(slot0, slot1)
	slot0.model.fans_rank_data = slot1

	GlobalEvent:getInstance():Fire(RoleEvent.ROLE_FANS_RANK_EVENT, slot1)
end

function RoleController.send25805(slot0, slot1, slot2)
	slot0:SendProtocal(25805, {
		pos = slot1,
		id = slot2
	})
end

function RoleController.handle25805(slot0, slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.ROLE_UPDATE_HONOR_WALL_EVENT, slot1)
end

function RoleController.send25806(slot0, slot1, slot2)
	slot0:SendProtocal(25806, {
		rid = slot1,
		srv_id = slot2
	})
end

function RoleController.handle25806(slot0, slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.ROLE_GET_HONOR_WALL_EVENT, slot1)
end

function RoleController.handle25807(slot0, slot1)
	if slot1 and slot1.id then
		slot0:openRoleHonorUnlockPanel(true, slot1)
	end
end

function RoleController.send25815(slot0, slot1, slot2)
	slot0:SendProtocal(25815, {
		id = slot1,
		channel = slot2
	})
end

function RoleController.handle25815(slot0, slot1)
	message(slot1.msg)
end

function RoleController.send25816(slot0, slot1, slot2, slot3)
	if slot0.dic_share_info_25816 == nil then
		slot0.dic_share_info_25816 = {}
	end

	slot0.dic_share_info_25816[slot1] = slot3

	slot0:SendProtocal(25816, {
		share_id = slot1,
		srv_id = slot2
	})
end

function RoleController.handle25816(slot0, slot1)
	if slot0.dic_share_info_25816 and slot0.dic_share_info_25816[slot1.share_id] then
		TipsController:getInstance():openHonorIconTips(true, {
			id = slot1.id,
			show_type = RoleConst.role_type.eOther,
			have_name = slot0.dic_share_info_25816[slot1.share_id].name,
			have_time = slot1.finish_time
		})

		slot0.dic_share_info_25816[slot1.share_id] = nil
	end
end

function RoleController.send25817(slot0, slot1, slot2)
	slot0:SendProtocal(25817, {
		id = slot1,
		channel = slot2
	})
end

function RoleController.handle25817(slot0, slot1)
	message(slot1.msg)
end

function RoleController.send25818(slot0, slot1, slot2, slot3)
	if slot0.dic_share_info_25818 == nil then
		slot0.dic_share_info_25818 = {}
	end

	slot0.dic_share_info_25818[slot1] = slot3

	slot0:SendProtocal(25818, {
		share_id = slot1,
		srv_id = slot2
	})
end

function RoleController.handle25818(slot0, slot1)
	if slot0.dic_share_info_25818[slot1.share_id] then
		TipsController:getInstance():openTaskExpTips(true, {
			id = slot1.id,
			have_name = slot0.dic_share_info_25818[slot1.share_id].name,
			finish_time = slot1.finish_time
		})

		slot0.dic_share_info_25818[slot1.share_id] = nil
	end
end

function RoleController.send25819(slot0, slot1)
	slot0:SendProtocal(25819, {
		channel = slot1
	})
end

function RoleController.handle25819(slot0, slot1)
	message(slot1.msg)
end

function RoleController.send25820(slot0, slot1, slot2, slot3)
	if slot0.dic_share_info_25820 == nil then
		slot0.dic_share_info_25820 = {}
	end

	slot0.dic_share_info_25820[slot1] = slot3

	slot0:SendProtocal(25820, {
		share_id = slot1,
		srv_id = slot2
	})
end

function RoleController.handle25820(slot0, slot1)
	if slot0.dic_share_info_25820[slot1.share_id] then
		TipsController:getInstance():openHonorLevelTips(true, {
			point = slot1.point,
			num = slot1.num,
			role_data = slot0.dic_share_info_25820[slot1.share_id]
		})

		slot0.dic_share_info_25820[slot1.share_id] = nil
	end
end

function RoleController.send25830(slot0, slot1, slot2)
	slot0:SendProtocal(25830, {
		start = slot1,
		num = slot2
	})
end

function RoleController.handle25830(slot0, slot1)
	if slot1.num == 1 then
		slot1.is_redpoint = slot0.model:checkGrowthWayRedPoint(slot1)
	end

	slot0.model:setGrowthWayData(slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.ROLE_MYSELF_GROWTH_WAY_EVENT, slot1)
end

function RoleController.send25831(slot0, slot1)
	slot0:SendProtocal(25831, {
		channel = slot1
	})
end

function RoleController.handle25831(slot0, slot1)
	message(slot1.msg)
end

function RoleController.send25832(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(25832, {
		rid = slot1,
		srv_id = slot2,
		start = slot3,
		num = slot4
	})
end

function RoleController.handle25832(slot0, slot1)
	slot0.model:setOtherGrowthWayData(slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.ROLE_OHTER_GROWTH_WAY_EVENT, slot1)
end

function RoleController.handle25833(slot0, slot1)
	slot0.model:setGrowthWayCarnivalData(slot1)
end

function RoleController.send25835(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(25835, {
		rid = slot1,
		srv_id = slot2,
		msg = slot3
	})
end

function RoleController.handle25835(slot0, slot1)
	message(slot1.msg)
end

function RoleController.send25836(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(25836, {
		rid = slot1,
		srv_id = slot2,
		bbs_id = slot3,
		msg = slot4
	})
end

function RoleController.handle25836(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(RoleEvent.ROLE_MESSAGE_BOARD_REPLY_EVENT, slot1)
end

function RoleController.send25837(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(25837, {
		rid = slot1,
		srv_id = slot2,
		start = slot3,
		num = slot4
	})
end

function RoleController.handle25837(slot0, slot1)
	slot0.model:initMessageBoardData(slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.ROLE_MESSAGE_BOARD_GET_INFO_EVENT, slot1)
end

function RoleController.handle25841(slot0, slot1)
	slot0.model:initMessageBoardData(slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.ROLE_MESSAGE_BOARD_NEW_INFO_EVENT, slot1)
end

function RoleController.send25838(slot0, slot1)
	slot0:SendProtocal(25838, {
		bbs_id = slot1
	})
end

function RoleController.handle25838(slot0, slot1)
	slot0.model:deleteMessageBoardDataByBbsid(slot1.bbs_id)
	GlobalEvent:getInstance():Fire(RoleEvent.ROLE_MESSAGE_BOARD_DELETE_INFO_EVENT, slot1)
end

function RoleController.send25839(slot0, slot1)
	slot0:SendProtocal(25839, {
		type = slot1
	})
end

function RoleController.handle25839(slot0, slot1)
	message(slot1.msg)
	slot0.model:setRoleAttribute("room_bbs_set", slot1.type)
	GlobalEvent:getInstance():Fire(RoleEvent.ROLE_MESSAGE_BOARD_LIMMIT_EVENT, slot1)
end

function RoleController.send25840(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(25840, {
		rid = slot1,
		srv_id = slot2,
		bbs_id = slot3
	})
end

function RoleController.handle25840(slot0, slot1)
	message(slot1.msg)
end

function RoleController.changeSignature(slot0, slot1)
	slot0:SendProtocal(10309, {
		signature = slot1
	})
end

function RoleController.rgp_hander10309(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:setRoleAttribute("signature", slot1.signature)
	end
end

function RoleController.requestRoleHeadList(slot0)
	slot0:SendProtocal(10325, {})
end

function RoleController.rgp_hander10325(slot0, slot1)
	if slot0.model ~= nil then
		slot0.model:updateRoleHeadList(slot1)
	end
end

function RoleController.changeRoleHead(slot0, slot1)
	slot0:SendProtocal(10327, {
		face_id = slot1
	})
end

function RoleController.rgp_hander10327(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		message(TI18N("设置头像成功"))
		slot0.model:setRoleAttribute("face_update_time", 0)
		slot0.model:setRoleAttribute("face_id", slot1.face_id)
	end
end

function RoleController.rgp_hander10342(slot0)
	if MainSceneController:getInstance():getPlayVideoStatus() == true then
		slot0.need_play_rename = true
	else
		slot0:openRoleSetNameView(true)
	end
end

function RoleController.restartPlayRename(slot0)
	if slot0.need_play_rename == true then
		slot0:openRoleSetNameView(true)

		slot0.need_play_rename = false
	end
end

function RoleController.changeRoleName(slot0, slot1, slot2)
	slot0:SendProtocal(10343, {
		name = slot1,
		sex = slot2
	})
end

function RoleController.rgp_hander10343(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:setRoleAttribute("name", slot1.name)
		slot0.model:setRoleAttribute("sex", slot1.sex)
		slot0.model:setRoleAttribute("is_first_rename", slot1.is_first_rename)
		slot0:openRoleChangeNameView(false)
		slot0:openRoleSetNameView(false)

		if slot0.role_personal_space_panel then
			slot0.role_personal_space_panel:closeSetNameAlert()
		end
	end
end

function RoleController.requestRoleModelInfo(slot0)
	slot0:SendProtocal(10345, {})
end

function RoleController.rgp_hander10345(slot0, slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.GetModelList, slot1)
end

function RoleController.changeRoleModel(slot0, slot1)
	slot0:SendProtocal(10346, {
		id = slot1
	})
end

function RoleController.rgp_hander10346(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(RoleEvent.UpdateModel, slot1.id)
	end
end

function RoleController.activeRoleModel(slot0, slot1)
	slot0:SendProtocal(10347, {
		id = slot1
	})
end

function RoleController.rgp_hander10347(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(RoleEvent.ActiveModel, slot1.id)
	end
end

function RoleController.rgp_hander12745(slot0, slot1)
	if Config.ItemData.data_get_data(slot1.bid) then
		function slot3()
		end

		if slot1.bid == Config.ItemData.data_assets_label2id.gold or slot1.bid == Config.ItemData.data_assets_label2id.gold then
			if FILTER_CHARGE then
				message(TI18N("钻石不足"))
			else
				CommonAlert.show(string.format(TI18N("%s不足，是否前往充值"), pay_config.name), TI18N("确定"), function ()
					VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
				end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, nil, true)
			end
		elseif slot1.bid == Config.ItemData.data_assets_label2id.energy then
			message(TI18N("情报不足"))
		elseif Config.ItemData.data_get_data(slot1.bid) then
			BackpackController:getInstance():openTipsSource(true, slot4)
		end
	end
end

function RoleController.rgp_hander12746(slot0, slot1)
	if Config.ItemData.data_get_data(slot1.item_id) and CommonGoodsType.isAsset(slot1.item_id) == false then
		BackpackController:getInstance():openTipsSource(true, slot2)
	end
end

function RoleController.requestRoleInfo(slot0, slot1, slot2, slot3)
	if slot1 == 0 or not slot2 then
		return
	end

	slot0.setting_10315 = slot3

	slot0:SendProtocal(10315, {
		rid = slot1,
		srv_id = slot2
	})
end

function RoleController.rgp_hander10315(slot0, slot1)
	if slot0.setting_10315 then
		if not slot0.setting_10315.form_type then
			return
		end

		if slot2 == RoleConst.Other_Form_Type.eHonorLevelTips then
			-- Nothing
		elseif slot2 == RoleConst.Other_Form_Type.eGrowthWayShare then
			slot3.index = RoleConst.Tab_type.eGrowthWay
			slot3.growth_way_share_id = slot0.setting_10315.share_id or 0
		elseif slot2 == RoleConst.Other_Form_Type.eMessageBoardInfo then
			slot3.index = RoleConst.Tab_type.eMessageBoard
			slot3.bbs_id = slot0.setting_10315.bbs_id
		end

		slot0:openRolePersonalSpacePanel(true, {
			role_type = RoleConst.role_type.eOther,
			other_data = slot1,
			index = RoleConst.Tab_type.eHonorWall
		})
	else
		GlobalEvent:getInstance():Fire(RoleEvent.DISPATCH_PLAYER_VO_EVENT, slot1)
	end
end

function RoleController.__delete(slot0)
	if slot0.battle_exit_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.battle_exit_event)

		slot0.battle_exit_event = nil
	end

	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end

function RoleController.requestWorshipRole(slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil or slot2 == nil then
		return
	end

	slot0:SendProtocal(10316, {
		type = slot4 or 0,
		rid = slot1,
		srv_id = slot2,
		idx = slot3 or 0
	})
end

function RoleController.rgp_hander10316(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(RoleEvent.WorshipOtherRole, slot1.rid, slot1.srv_id, slot1.idx, slot1.type)
	end
end

function RoleController.sender10318(slot0, slot1)
	slot0:SendProtocal(10318, {
		auto_pk = slot1 or 0
	})
end

function RoleController.rgp_hander10318(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:setRoleAttribute("auto_pk", slot1.auto_pk)
	end
end

function RoleController.sender23300(slot0)
	slot0:SendProtocal(23300, {})
end

function RoleController.hander23300(slot0, slot1)
	slot0.use_title_id = slot1.base_id

	GlobalEvent:getInstance():Fire(RoleEvent.GetTitleList, slot1)
end

function RoleController.sender23301(slot0, slot1)
	slot0:SendProtocal(23301, {
		base_id = slot1
	})
end

function RoleController.hander23301(slot0, slot1)
	slot0.use_title_id = slot1.base_id

	GlobalEvent:getInstance():Fire(RoleEvent.UseTitle, slot1.base_id)
end

function RoleController.sender23302(slot0)
	slot0:SendProtocal(23302, {})
end

function RoleController.hander23302(slot0, slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.UpdataTitleList, slot1)
end

function RoleController.sender23303(slot0, slot1)
	slot0:SendProtocal(23303, {
		base_id = slot1
	})
end

function RoleController.hander23303(slot0, slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.UpdataTitleList, slot1)
end

function RoleController.sender23304(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(23304, {
		item_id = slot1,
		item_num = slot2,
		expends = slot3
	})
end

function RoleController.hander23304(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		GlobalEvent:getInstance():Fire(RoleEvent.UpgradeTitle, slot1.flag)
	end
end

function RoleController.getUseTitleId(slot0)
	return slot0.use_title_id or 0
end

function RoleController.sender10945(slot0, slot1)
	slot0:SendProtocal(10945, {
		card_id = slot1
	})
end

function RoleController.handle10945(slot0, slot1)
	message(slot1.msg)
end

function RoleController.requestWorshipNum(slot0)
	slot0:SendProtocal(10317, {})
end

function RoleController.rgp_hander10317(slot0, slot1)
	if slot0.model:getRoleVo() ~= nil then
		slot2.worship = slot1.worship

		GlobalEvent:getInstance():Fire(RoleEvent.UpdateWorshipEvent, slot1.worship)
	end
end

function RoleController.requestCrossChamWorshipNum(slot0)
	slot0:SendProtocal(10319, {})
end

function RoleController.rgp_hander10319(slot0, slot1)
	if slot0.model:getRoleVo() ~= nil then
		slot2.cross_cham_worship = slot1.worship

		GlobalEvent:getInstance():Fire(RoleEvent.UpdateCrossChamWorshipEvent, slot1.worship)
	end
end

function RoleController.handle10994(slot0, slot1)
	if slot1.type == 0 then
		slot0:requestOpenSrvDay()
		TaskController:getInstance():requestActivityInfo()
		BattleDramaController:getInstance():send13006()
		GuildController:getInstance():requestGuildDonateProtocal()
		VoyageController:getInstance():requestActivityStatus()
		PrimusController:getInstance():sender20706()
		ActionController:getInstance():requestActionRedStatus()
		StartowerController:getInstance():sender11320()
		OrderActionController:getInstance():openOrderActionMainView(false)
		HeroController:getInstance():zeroUpdata()
		SysEnv:getInstance():set(SysEnv.keys.holy_plan_wear_tip, false, false)
		SysEnv:getInstance():set(SysEnv.keys.holy_plan_save_tip, false, false)
		SysEnv:getInstance():set(SysEnv.keys.elfin_plan_save_tip, false, false)
		SysEnv:getInstance():set(SysEnv.keys.video_first_open, true, false)
		SysEnv:getInstance():set(SysEnv.keys.guild_first_open, true, false)
		BackpackController:getInstance():getModel():checkArtifactCount(true)
		SysEnv:getInstance():save()
	elseif slot1.type == 5 then
		GuildbossController:getInstance():requestInitProtocal(true)
		ArenaController:getInstance():requestInitProtocal()
	elseif slot1.type == 6 or slot1.type == 18 then
		MainSceneController:getInstance():changeMainCityTimeType(slot1.type)
		HomeworldController:getInstance():changeHomeTimeType(slot1.type)
	end
end

function RoleController.getApkData(slot0)
	if slot0.apk_data then
		return slot0.apk_data
	end
end

function RoleController.getRandomName(slot0, slot1)
	slot1 = slot1 or 1
	slot2 = ""

	for slot6 = 1, Config.RandomNameData.data_list_length do
		slot8 = {}

		for slot12, slot13 in pairs(Config.RandomNameData.data_list[slot6] or {}) do
			if slot13.sex and (slot13.sex == slot1 or slot13.sex == 0) then
				table.insert(slot8, slot13)
			end
		end

		slot2 = slot2 .. ((slot8[math.random(1, tableLen(slot8))] or {}).name or "")
	end

	return slot2
end

function RoleController.requestWorldLev(slot0)
	slot0:SendProtocal(10905, {})
end

function RoleController.handle10905(slot0, slot1)
	slot0.model:setWorldLev(slot1.world_lev)
	GlobalEvent:getInstance():Fire(RoleEvent.WORLD_LEV, slot1.world_lev)
end

function RoleController.requestOpenSrvDay(slot0)
	slot0:SendProtocal(10906, {})
end

function RoleController.handle10906(slot0, slot1)
	slot0.model:setOpenSrvDay(slot1.open_day)
	GlobalEvent:getInstance():Fire(RoleEvent.OPEN_SRV_DAY, slot1.open_day)

	if slot0:getRoleVo() then
		slot2:setRoleAttribute("open_day", slot1.open_day)
	end
end

function RoleController.sender10907(slot0)
	slot0:SendProtocal(10907, {})
end

function RoleController.handle10907(slot0, slot1)
	if setQingmingShield then
		if slot1.sys_ban == 1 then
			setQingmingShield(true)
		else
			setQingmingShield(false)
		end
	end
end

function RoleController.openRoleUpgradeMainWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.role_upgrade_window then
			slot0.role_upgrade_window:close()

			slot0.role_upgrade_window = nil
		end
	else
		if slot2 == nil then
			return
		end

		if slot0.role_upgrade_window == nil then
			slot0.role_upgrade_window = RoleUpgradeMainWindow.New()
		end

		slot0.role_upgrade_window:open(slot2)
	end
end

function RoleController.sender10395(slot0, slot1)
	slot0:SendProtocal(10395, {
		age = slot1
	})
end

function RoleController.handle10395(slot0, slot1)
	if slot0:getRoleVo() then
		slot2.pass_certify = slot1.status

		if slot1.status == 0 then
			MainuiController:getInstance():addFunctionIconById(MainuiConst.icon.certify)
		else
			MainuiController:getInstance():removeFunctionIconById(MainuiConst.icon.certify)
		end
	end
end

function RoleController.handle12744(slot0, slot1)
	if not IS_NEED_REAL_NAME then
		return
	end

	if slot1.type == 3 then
		CommonAlert.closeAllWin()
		CommonAlert.show(slot1.msg, TI18N("确定"), function ()
		end, TI18N("取消"))
	end
end

function RoleController.sender10348(slot0, slot1)
	slot0:SendProtocal(10348, {
		is_show_vip = slot1
	})
end

function RoleController.handle10348(slot0, slot1)
	message(slot1.msg)
end

function RoleController.handle24500(slot0, slot1)
	if slot1 and slot1.list then
		slot0.model:setPrivilegeData(slot1.list)
	end
end

function RoleController.sender10960(slot0)
	slot0:SendProtocal(10960, {})
end

function RoleController.handle10960(slot0, slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.ROLE_NAME_AUTHENTIC, slot1)
end

function RoleController.sender10961(slot0)
	slot0:SendProtocal(10961, {})
end

function RoleController.handle10961(slot0, slot1)
	message(slot1.msg)
end

function RoleController.requestCustomHeadInfo(slot0)
	slot0:SendProtocal(10330, {})
end

function RoleController.handle10330(slot0, slot1)
	if slot1 then
		TencentCos:getInstance():initCos(slot1.secret_id, slot1.secret_key)
		slot0.model:setRoleAttribute("custom_face_file", slot1.face_file)
	end
end

function RoleController.tellServerCustomSuccess(slot0)
	slot0:SendProtocal(10332, {})
end

function RoleController.resetCustomHeadImage(slot0)
	slot0:SendProtocal(10333, {})
end

function RoleController.handle10333(slot0, slot1)
	if slot1.code == 1 then
		if slot0.model then
			slot0.model:updateCustomFace(slot1.face_file, slot1.face_update_time)
		end
	else
		message(slot1.msg)
	end
end

function RoleController.handle10332(slot0, slot1)
	if slot1.code == 1 then
		if slot0.model then
			slot0.model:updateCustomFace(slot1.face_file, slot1.face_update_time)
		end
	else
		message(slot1.msg)
	end
end

function RoleController.openRolePhotoChooseWindow(slot0, slot1)
	if not slot1 then
		if slot0.photo_choose_view then
			slot0.photo_choose_view:close()

			slot0.photo_choose_view = nil
		end
	else
		if slot0.photo_choose_view == nil then
			slot0.photo_choose_view = RolePhotoChooseWindow.New()
		end

		slot0.photo_choose_view:open()
	end
end

function RoleController.handle10360(slot0, slot1)
	if GuideController:getInstance():isInGuide() then
		return
	end

	if StoryController:getInstance():getModel():isStoryState() then
		return
	end

	RenderMgr:getInstance():doNextFrame(function ()
		uv0:openActivePushWindow(true, uv1)
	end)
end

function RoleController.openActivePushWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.active_push then
			slot0.active_push:close()

			slot0.active_push = nil
		end
	elseif slot2 ~= nil and slot2.ids ~= nil and next(slot2.ids) ~= nil then
		if slot0.active_push == nil then
			slot0.active_push = ActivePushWindow.New()
		end

		slot0.active_push:open(slot2.ids)
	end
end

function RoleController.requestThirdCharge(slot0, slot1, slot2, slot3)
	slot0.charge_info = slot3

	slot0:SendProtocal(10947, {
		charge_id = tonumber(slot1),
		notify_url = string.format("http://%s/api.php/pf/sszg/dan/", slot2)
	})
end

function RoleController.handle10947(slot0, slot1)
	if slot1 and slot1.code == TRUE then
		sdkCallFunc("openSyW", slot1.url)
	elseif slot0.charge_info and slot0.charge_info ~= "" then
		sdkCallFunc("dan", slot0.charge_info)
	end

	slot0.charge_info = ""
end

function RoleController.sender10985(slot0)
	slot0:SendProtocal(10985, {})
end

function RoleController.handle10985(slot0, slot1)
	slot0.model:setRedPointData(slot1)
	GlobalEvent:getInstance():Fire(RoleEvent.UPDATE_RED_POINT)
end

function RoleController.sender10986(slot0, slot1)
	slot0:SendProtocal(10986, {
		id = slot1
	})
end

function RoleController.handle10986(slot0, slot1)
end
