Endless_trailController = Endless_trailController or BaseClass(BaseController)

function Endless_trailController.config(slot0)
	slot0.model = Endless_trailModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.cache_buff_data = nil
end

function Endless_trailController.getModel(slot0)
	return slot0.model
end

function Endless_trailController.registerEvents(slot0)
	if slot0.battle_enter_event == nil then
		slot0.battle_enter_event = GlobalEvent:getInstance():Bind(SceneEvent.ENTER_FIGHT, function (slot0)
			if slot0 == BattleConst.Fight_Type.Endless then
				uv0:openEndlessBattleView(true)
			end
		end)
	end

	if slot0.battle_exit_event == nil then
		slot0.battle_exit_event = GlobalEvent:getInstance():Bind(SceneEvent.EXIT_FIGHT, function (slot0)
			uv0:openEndlessBattleView(false)

			if slot0 == BattleConst.Fight_Type.Endless then
				uv0:openEndlessBuffView(false)
			end
		end)
	end
end

function Endless_trailController.checkIsOpen(slot0, slot1)
	if Config.EndlessData.data_const.open_lev == nil then
		return false
	end

	slot3 = MainuiController:getInstance():checkIsOpenByActivate(slot2.val)

	if slot1 == true and slot3 == false then
		message(slot2.desc)
	end

	return slot3
end

function Endless_trailController.checkNewEndLessIsOpen(slot0, slot1)
	if Config.EndlessData.data_const.endless_new_limit == nil then
		return false
	end

	if Config.EndlessData.data_const.endless_new_limit_lev == nil then
		return false
	end

	slot4 = false
	slot6 = RoleController:getInstance():getRoleVo()

	if slot0.model:getEndlessData() and slot6 and slot2.val <= slot5.max_round and slot3.val <= slot6.lev then
		slot4 = true
	end

	if slot1 == true and slot4 == false then
		message(slot2.desc)
	end

	return slot4
end

function Endless_trailController.checkNewEndLessIsShow(slot0)
	if Config.EndlessData.data_const.endless_new_show_limit == nil then
		return false
	end

	slot2 = false

	if RoleController:getInstance():getRoleVo() and slot1.val <= slot3.lev then
		slot2 = true
	end

	return slot2
end

function Endless_trailController.requestInitProtocal(slot0, slot1)
	if slot0:checkIsOpen() == true then
		slot0:send23900()
		slot0:send23903()
		slot0:send23906()

		if slot0.role_assets_event then
			slot0.role_vo:UnBind(slot0.role_assets_event)

			slot0.role_assets_event = nil
		end
	end
end

function Endless_trailController.registerProtocals(slot0)
	slot0:RegisterProtocal(23900, "handle23900")
	slot0:RegisterProtocal(23901, "handle23901")
	slot0:RegisterProtocal(23902, "handle23902")
	slot0:RegisterProtocal(23903, "handle23903")
	slot0:RegisterProtocal(23904, "handle23904")
	slot0:RegisterProtocal(23905, "handle23905")
	slot0:RegisterProtocal(23906, "handle23906")
	slot0:RegisterProtocal(23907, "handle23907")
	slot0:RegisterProtocal(23908, "handle23908")
	slot0:RegisterProtocal(23909, "handle23909")
	slot0:RegisterProtocal(23910, "handle23910")
	slot0:RegisterProtocal(23911, "handle23911")
	slot0:RegisterProtocal(23912, "handle23912")
	slot0:RegisterProtocal(23913, "handle23913")
end

function Endless_trailController.send23900(slot0)
	slot0:SendProtocal(23900, {})
end

function Endless_trailController.handle23900(slot0, slot1)
	if slot1 then
		slot0.model:setEndlessData(slot1)

		if NEEDCHANGEENTERSTATUS == 5 and not slot0.first_enter then
			slot0.first_enter = true

			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Endless)
		end
	end
end

function Endless_trailController.send23901(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(23901, {
		type = slot1,
		formation_type = slot2,
		pos_info = slot3,
		hallows_id = slot4
	})
end

function Endless_trailController.handle23901(slot0, slot1)
	message(slot1.msg)
end

function Endless_trailController.send23902(slot0)
	slot0:SendProtocal(23902, {})
end

function Endless_trailController.handle23902(slot0, slot1)
	slot0.model:setEndlessBattleData(slot1)
end

function Endless_trailController.send23903(slot0, slot1)
	slot0:SendProtocal(23903, {
		type = slot1
	})
end

function Endless_trailController.handle23903(slot0, slot1)
	if slot1 then
		slot0.model:setFirstData(slot1)
	end
end

function Endless_trailController.send23904(slot0, slot1, slot2)
	slot0:SendProtocal(23904, {
		id = slot1,
		type = slot2
	})
end

function Endless_trailController.handle23904(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0:openEndlessRewardTips(false)
	end
end

function Endless_trailController.send23905(slot0)
	slot0:SendProtocal(23905, {})
end

function Endless_trailController.handle23905(slot0, slot1)
	if slot1 then
		slot0.model:setSendPartnerData(slot1)
	end
end

function Endless_trailController.send23906(slot0)
	slot0:SendProtocal(23906, {})
end

function Endless_trailController.handle23906(slot0, slot1)
	if slot1 then
		slot0.model:setHasHirePartnerData(slot1)
	end
end

function Endless_trailController.send23907(slot0)
	slot0:SendProtocal(23907, {})
end

function Endless_trailController.handle23907(slot0, slot1)
	if slot1 then
		slot0.model:setHirePartnerData(slot1)
	end
end

function Endless_trailController.send23908(slot0, slot1)
	slot0:SendProtocal(23908, {
		id = slot1
	})
end

function Endless_trailController.handle23908(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(Endless_trailEvent.UPDATA_SENDPARTNER_SUCESS_DATA, slot1)
	end
end

function Endless_trailController.send23909(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(23909, {
		id = slot3,
		rid = slot1,
		srv_id = slot2,
		flag = slot4
	})
end

function Endless_trailController.handle23909(slot0, slot1)
	message(slot1.msg)
end

function Endless_trailController.send23910(slot0)
	slot0:SendProtocal(23910, {})
end

function Endless_trailController.handle23910(slot0, slot1)
	if slot1 then
		slot2 = false

		if MainuiController:getInstance():checkIsInEndlessUIFight() then
			slot0:openEndlessBuffView(true, slot1)

			slot2 = true
		end

		if not slot2 then
			slot0.cache_buff_data = slot1
		end
	end
end

function Endless_trailController.send23911(slot0, slot1)
	slot0:SendProtocal(23911, {
		buff_id = slot1
	})
end

function Endless_trailController.handle23911(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0:openEndlessBuffView(false)
		PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.Endless_trail)
	end
end

function Endless_trailController.send23912(slot0)
	slot0:SendProtocal(23912, {})
end

function Endless_trailController.handle23912(slot0, slot1)
	slot0.model:setFirstStatus(slot1)
end

function Endless_trailController.send23913(slot0, slot1)
	if slot0.SendProtocal then
		slot0:SendProtocal(23913, {
			type = slot1
		})
	end
end

function Endless_trailController.handle23913(slot0, slot1)
	slot0.model:updateRankInfo(slot1)
end

function Endless_trailController.sendRankInfo(slot0)
	delayOnce(function ()
		if uv0.model:getEndlessData() then
			uv0:send23913(slot0.type)
		end
	end, 5)
end

function Endless_trailController.openEndlessMainWindow(slot0, slot1)
	if slot1 == true then
		if slot0:checkIsOpen(true) == false then
			return
		end

		if not slot0.endless_main_window then
			slot0.endless_main_window = EndlessTrailMainWindow.New()
		end

		if slot0.endless_main_window and slot0.endless_main_window:isOpen() == false then
			slot0.endless_main_window:open()
		end
	elseif slot0.endless_main_window then
		slot0.endless_main_window:close()

		slot0.endless_main_window = nil
	end
end

function Endless_trailController.openEndlessBattleView(slot0, slot1)
	if slot1 == true then
		if not slot0.endless_battle_view then
			slot0.endless_battle_view = EndlessTrailBattleView.new()
		end

		if slot0.endless_battle_view and slot0.endless_battle_view:isOpen() == false then
			slot0.endless_battle_view:open()

			if slot0.cache_buff_data then
				slot0:openEndlessBuffView(true, slot0.cache_buff_data)

				slot0.cache_buff_data = nil
			end
		end
	elseif slot0.endless_battle_view then
		slot0.endless_battle_view:close()

		slot0.endless_battle_view = nil
	end
end

function Endless_trailController.openEndlessBuffView(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.endless_buff_window then
			slot0.endless_buff_window = EndlessTrailBuffView.New()
		end

		if not slot2 then
			slot2 = slot0.cache_buff_data
		end

		if slot2 == nil then
			return
		end

		if slot0.endless_buff_window and slot0.endless_buff_window:isOpen() == false then
			slot0.endless_buff_window:open(slot2)
		end

		slot0.cache_buff_data = nil
	elseif slot0.endless_buff_window then
		if slot3 then
			slot0.cache_buff_data = slot0.endless_buff_window:getData()
		end

		slot0.endless_buff_window:close()

		slot0.endless_buff_window = nil
	end
end

function Endless_trailController.openEndlessRankView(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.endless_rank_window then
			slot0.endless_rank_window = EndlessRankWindow.New(slot3)
		end

		if slot0.endless_rank_window and slot0.endless_rank_window:isOpen() == false then
			slot0.endless_rank_window:open()
		end
	elseif slot0.endless_rank_window then
		slot0.endless_rank_window:close()

		slot0.endless_rank_window = nil
	end
end

function Endless_trailController.openEndlessFriendHelpView(slot0, slot1)
	if slot1 == true then
		if not slot0.endless_friendhelp_window then
			slot0.endless_friendhelp_window = EndlessFriendHelpWindow.New()
		end

		if slot0.endless_friendhelp_window and slot0.endless_friendhelp_window:isOpen() == false then
			slot0.endless_friendhelp_window:open()
		end
	elseif slot0.endless_friendhelp_window then
		slot0.endless_friendhelp_window:close()

		slot0.endless_friendhelp_window = nil
	end
end

function Endless_trailController.openEndlessRewardWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.endless_reward_window then
			slot0.endless_reward_window = EndlessRewardWindow.New(slot2)
		end

		if slot0.endless_reward_window and slot0.endless_reward_window:isOpen() == false then
			slot0.endless_reward_window:open()
		end
	elseif slot0.endless_reward_window then
		slot0.endless_reward_window:close()

		slot0.endless_reward_window = nil
	end
end

function Endless_trailController.openEndlessRewardTips(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.endless_reward_tips then
			slot0.endless_reward_tips = EndlessAwardsTips.New()
		end

		if slot0.endless_reward_tips and slot0.endless_reward_tips:isOpen() == false then
			slot0.endless_reward_tips:open(slot2)
		end
	elseif slot0.endless_reward_tips then
		slot0.endless_reward_tips:close()

		slot0.endless_reward_tips = nil
	end
end

function Endless_trailController.openEndlessOpenTips(slot0, slot1)
	if slot1 == true then
		if not slot0.endless_open_tips then
			slot0.endless_open_tips = EndlessOpenTips.New()
		end

		if slot0.endless_open_tips and slot0.endless_open_tips:isOpen() == false then
			slot0.endless_open_tips:open()
		end
	elseif slot0.endless_open_tips then
		slot0.endless_open_tips:close()

		slot0.endless_open_tips = nil
	end
end

function Endless_trailController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
