ChatHelp = ChatHelp or {}
ChatHelp.UpLoadUrl = string.format("%s/receive_file.php?", URL_PATH.voice)
ChatHelp.DownLoadUrl = string.format("%s/upload/", URL_PATH.voice)

function ChatHelp.getDownloadAddress2(slot0)
	slot1, slot2, slot3 = unpack(Split(slot0, "-"))

	return ChatHelp.DownLoadUrl .. math.floor(slot3 / 600) .. "/" .. slot1 .. "/"
end

function ChatHelp.formatFileName(slot0)
	if AUDIO_RECORD_TYPE == 10 then
		return string.format("%s%s", string.gsub(slot0, "-", "_"), ".wav")
	else
		return string.format("%s%s", string.gsub(slot0, "-", "_"), ".mp3")
	end
end

function ChatHelp.RecordTouched(slot0, slot1, slot2, slot3)
	if not _callAudioInit then
		if callFunc("checkVoice") == "" or slot4 == "true" then
			callAudioInit()
		end
	else
		ChatHelp.channel = slot2
		ChatHelp.taken_obj = slot3

		if slot1 == ccui.TouchEventType.began then
			if ChatMgr:getInstance():canSpeak(slot2) then
				if ChatHelp.rec_sec == nil or math.ceil(GameNet:getInstance():getTime() - ChatHelp.rec_sec) > 2 then
					ChatHelp.OpenTipsPanel()

					ChatHelp.is_pressed = true

					ChatHelp.StarRecord()
					ChatHelp.UpdatePressStatus(true)
					slot0:stopAllActions()
					delayRun(slot0, 15, function ()
						ChatHelp.StopRecord()
					end)
				else
					message(TI18N("录音过于频繁，请两秒后再尝试"))
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			if ChatHelp.is_pressed then
				slot5 = slot0:getContentSize()

				if slot0:convertToNodeSpace(slot0:getTouchMovePosition()).x < -35 or slot4.y < -35 or slot4.x > slot5.width + 35 or slot4.y > slot5.height + 35 then
					ChatHelp.UpdatePressStatus(nil)
				else
					ChatHelp.UpdatePressStatus(true)
				end
			end
		elseif slot1 == ccui.TouchEventType.canceled or slot1 == ccui.TouchEventType.ended then
			ChatHelp.CloseTipsPanel()

			if ChatHelp.is_pressed then
				ChatHelp.StopRecord()
			end

			GlobalTimeTicket:remove("record_start_delay")
			callAudioStop()
			AudioManager:getInstance():resumeMusic()

			ChatHelp.is_pressed = nil
		end
	end
end

function ChatHelp.StarRecord()
	if ChatHelp.is_pressed then
		slot0 = RoleController:getInstance():getRoleVo()
		ChatHelp.rec_sec = GameNet:getInstance():getTime()
		ChatHelp.voice_name = string.format("%s-%s-%s", slot0.srv_id, slot0.rid, ChatHelp.rec_sec)

		GlobalTimeTicket:remove("record_start_delay")
		GlobalTimeTicket:getInstance():add(function ()
			callAudioStart()
		end, 30 / display.DEFAULT_FPS, 1, "record_start_delay")
		AudioManager:getInstance():pauseMusic()
	end
end

function ChatHelp.StopRecord()
	GlobalTimeTicket:remove("record_start_delay")
	callAudioStop()
	GlobalTimeTicket:remove("record_stop_delay")
	GlobalTimeTicket:getInstance():add(function ()
		AudioManager:getInstance():resumeMusic()
	end, 30 / display.DEFAULT_FPS, 1, "record_stop_delay")

	if ChatHelp.voice_name and ChatHelp.is_pressed then
		if math.ceil(GameNet:getInstance():getTime() - ChatHelp.rec_sec) > 1 then
			uploadFile(ChatHelp.formatFileName(AUDIO_RECORD_FILE), ChatHelp.voice_name, slot0)
			ChatController:getInstance():insertVoiceMsg(ChatHelp.voice_name, ChatHelp.voice_name .. "@" .. slot0, slot0, ChatHelp.channel, ChatHelp.taken_obj)

			ChatHelp.voice_name = nil
			ChatHelp.rec_sec = nil
		else
			message(TI18N("录音时间小于1秒，录音失败"))
		end
	end
end

function ChatHelp.OpenTipsPanel()
	if not ChatHelp.tips then
		slot0 = VoiceRecordUI.new()

		slot0:setAnchorPoint(0.5, 0.5)
		slot0:setPosition(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)

		ChatHelp.tips = slot0

		ViewManager:getInstance():addToLayerByTag(ChatHelp.tips, ViewMgrTag.TOP_TAG, ChatController:getInstance():getChatWindowZorder() + 1)
	end
end

function ChatHelp.UpdatePressStatus(slot0)
	ChatHelp.is_pressed = slot0

	if ChatHelp.tips then
		ChatHelp.tips:setIsRecord(slot0)
	end
end

function ChatHelp.CloseTipsPanel()
	doRemoveFromParent(ChatHelp.tips)

	ChatHelp.tips = nil
end

function ChatHelp.OnChatTouched(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	slot4 = slot3 or {}

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not Split(slot1, "|")[1] then
		return
	end

	if slot0 == "href" or slot0 == "click" then
		if tonumber(slot6[1]) == 4 then
			if slot6[2] and slot6[3] and slot6[4] and slot6[5] and slot6[6] then
				slot9 = 3

				if {
					bid = tonumber(slot6[2]),
					role_id = tonumber(slot6[3]),
					role_srv_id = slot6[4],
					star = tonumber(slot6[5]),
					is_awake = tonumber(slot6[6]),
					partner_id = tonumber(slot6[7])
				} and slot8.partner_id == 0 then
					slot9 = 2
				end
			end
		elseif slot7 == 5 or slot7 == ChatConst.Link.Watch_Ladder then
			if BattleController:getInstance():getModel():isInFight() == true then
				message(TI18N("正在战斗中或者观看录像中，无法观看录像"))

				return
			end

			CommonAlert.show(TI18N("是否前往查看该录像"), TI18N("确定"), function ()
				if uv0[2] then
					if not BattleController:getInstance():getModel():isInFight() and not BattleController:getInstance():getWatchReplayStatus() then
						if uv1 == ChatConst.Link.Watch_Ladder then
							if uv0[3] then
								BattleController:getInstance():csRecordBattle(tonumber(uv0[3]), uv0[2])
							end
						else
							BattleController:getInstance():csRecordBattle(tonumber(uv0[2]))
						end
					else
						message(TI18N("正在战斗中或者观看录像中，无法观看录像"))
					end
				end
			end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, 22, nil)
		elseif slot7 == 6 then
			if slot6[2] and slot6[3] then
				GuildController:getInstance():requestJoinGuild(tonumber(slot6[2]), slot6[3], 1)
			end
		elseif slot7 == 7 then
			RedbagController:getInstance():openMainView(true)
		elseif slot7 == ChatConst.Link.OtherRole then
			ChatController:getInstance():openFriendInfo({
				rid = tonumber(slot6[2]) or 0,
				srv_id = slot6[3] or ""
			})
		elseif slot7 == 29 then
			LookController:getInstance():sender11062(tonumber(slot6[3]) or 0, slot4.srv_id)
		elseif slot7 == 30 then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.champion_call)
		elseif slot7 == 31 then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.wonderful, 93001)
		elseif slot7 == 32 then
			GuildController:getInstance():welcomeNewMember(tonumber(slot6[2]) or 0, slot6[3] or "")
		elseif slot7 == 35 then
			ActionController:getInstance():openActionMainPanel(true, nil, tonumber(slot6[2]) or 0)
		elseif slot7 == 36 then
			ChatController:getInstance():closeChatUseAction()

			if WelfareController:getInstance():getModel():getYuekaStatus() ~= true then
				VipController:getInstance():openVipMainWindow(true)
			end
		elseif slot7 == 37 then
			ChatController:getInstance():closeChatUseAction()

			if MainuiController:getInstance():checkMainFunctionOpenStatus(MainuiConst.icon.first_charge, MainuiConst.function_type.other, false) == true then
				if MainuiController:getInstance():getFunctionIconById(MainuiConst.icon.first_charge) then
					ActionController:getInstance():openFirstChargeView(true)
				else
					VipController:getInstance():openVipMainWindow(true)
				end
			end
		elseif slot7 == 38 then
			PartnersummonController:getInstance():openPartnerSummonWindow(true)
		elseif slot7 == 42 then
			ChatController:getInstance():closeChatUseAction()

			if MainSceneController:getInstance():getBuildVo(CenterSceneBuild.arena) and slot8.is_lock then
				message(slot8.desc)

				return
			end

			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.arena_call)
		elseif slot7 == 44 then
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildDun)
		elseif slot7 == 45 then
			if MainuiController:getInstance():checkMainFunctionOpenStatus(MainuiConst.icon.first_charge, MainuiConst.function_type.other, false) == true then
				slot10 = tonumber(slot6[3]) or 0

				if (tonumber(slot6[2]) or 0) ~= 0 and slot10 ~= 0 then
					ActionController:getInstance():openActionMainPanel(true, nil, slot10)
				end
			end
		elseif slot7 == 46 then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.hallows)
		elseif slot7 == 47 then
			if MainuiController:getInstance():checkMainFunctionOpenStatus(MainuiConst.icon.first_charge, MainuiConst.function_type.other, false) == true then
				ActionController:getInstance():openActionMainPanel(true, nil, 93006)
			end
		elseif slot7 == 50 then
			if PrimusController:getInstance():checkIsCanOpenPrimusWindow() == true then
				MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.primuswar)
			end
		elseif slot7 == 48 then
			if GuildwarController:getInstance():checkIsCanOpenGuildWarWindow() == true then
				MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.guildwar)
			end
		elseif slot7 == ChatConst.Link.Item_Show then
			RefController:getInstance():getGoodsTips(tonumber(slot6[3]) or 0, slot6[2] or "")
		elseif slot7 == ChatConst.Link.Open_Ladder then
			if LadderController:getInstance():getModel():getLadderOpenStatus() then
				MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.ladderwar)
				ChatController:getInstance():closeChatUseAction()
			end
		elseif slot7 == 53 then
			if LadderController:getInstance():getModel():getLadderOpenStatus() then
				LadderController:getInstance():openLadderTopThreeWindow(true)
				ChatController:getInstance():closeChatUseAction()
			end
		elseif slot7 == 54 then
			ActionController:getInstance():openActionMainPanel(true, nil, ActionRankCommonType.time_summon)
			ChatController:getInstance():closeChatUseAction()
		elseif slot7 == 55 then
			if ElitematchController:getInstance():getModel():checkElitematchIsOpen() then
				MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.eliteMatchWar)
				ChatController:getInstance():closeChatUseAction()
			end
		elseif slot7 == 56 then
			ElitematchController:getInstance():openElitematchPersonalInfoPanel(true, tonumber(slot6[2]) or 0, {
				id = tonumber(slot6[3]) or 0,
				share_srv_id = slot6[4] or ""
			})
		elseif slot7 == ChatConst.Link.Open_Vedio_info then
			VedioController:getInstance():send19908(tonumber(slot6[2]) or 0, slot6[3] or "", tonumber(slot6[4]) or 0, slot4.channel or ChatConst.Channel.World, slot6[5] or "")
		elseif slot7 == ChatConst.Link.Crossarena then
			if CrossarenaController:getInstance():getModel():getCrossarenaIsOpen() then
				MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.CrossArenaWar)
				ChatController:getInstance():closeChatUseAction()
			end
		elseif slot7 == ChatConst.Link.Crossarena_honour then
			if CrossarenaController:getInstance():getModel():getCrossarenaIsOpen() then
				MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.CrossArenaWar, CrossarenaConst.Sub_Type.Honour)
				ChatController:getInstance():closeChatUseAction()
			end
		elseif slot7 == ChatConst.Link.Action_Treasure then
			ActionController:getInstance():openActionMainPanel(true, MainuiConst.icon.festival, ActionRankCommonType.action_treasure)
			ChatController:getInstance():closeChatUseAction()
		elseif slot7 == ChatConst.Link.Honor_Icon then
			if tonumber(slot6[3]) then
				RoleController:getInstance():send25816(slot8, slot4.srv_id, slot4)
			end
		elseif slot7 == ChatConst.Link.Task_Exp then
			if tonumber(slot6[3]) then
				RoleController:getInstance():send25818(slot8, slot4.srv_id, slot4)
			end
		elseif slot7 == ChatConst.Link.Honor_Level then
			if tonumber(slot6[2]) then
				RoleController:getInstance():send25820(slot8, slot4.srv_id, slot4)
			end
		elseif slot7 == ChatConst.Link.Growth_Way then
			if tonumber(slot6[2]) then
				if slot4.rid == slot5.rid and slot4.srv_id == slot9.srv_id then
					RoleController:getInstance():openRolePersonalSpacePanel(true, {
						index = RoleConst.Tab_type.eGrowthWay
					})
				else
					RoleController:getInstance():requestRoleInfo(slot4.rid, slot4.srv_id, {
						form_type = RoleConst.Other_Form_Type.eGrowthWayShare,
						share_id = slot8
					})
				end
			end
		elseif slot7 == ChatConst.Link.Crosschampion then
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.CrossChampion)
			ChatController:getInstance():closeChatUseAction()
		elseif slot7 == 66 then
			ActionController:getInstance():openActionMainPanel(true, nil, ActionRankCommonType.elite_summon)
			ChatController:getInstance():closeChatUseAction()
		elseif slot7 == ChatConst.Link.Elfin_Summon then
			ActionController:getInstance():openActionMainPanel(true, nil, ActionRankCommonType.time_elfin_summon)
			ChatController:getInstance():closeChatUseAction()
		elseif slot7 == ChatConst.Link.voyage_senior_privilege then
			VipController:getInstance():openVipMainWindow(true, VIPTABCONST.PRIVILEGE)
			ChatController:getInstance():closeChatUseAction()
		elseif slot7 == ChatConst.Link.voyage_Luxury_privilege then
			VipController:getInstance():openVipMainWindow(true, VIPTABCONST.PRIVILEGE)
			ChatController:getInstance():closeChatUseAction()
		elseif slot7 == ChatConst.Link.select_elite_summon then
			ActionController:getInstance():openActionMainPanel(true, nil, ActionRankCommonType.select_elite_summon)
			ChatController:getInstance():closeChatUseAction()
		end
	end
end
