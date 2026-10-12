PromptController = PromptController or BaseClass(BaseController)

function PromptController.config(slot0)
	slot0.model = PromptModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.cache_list = {}
end

function PromptController.getModel(slot0)
	return slot0.model
end

function PromptController.registerEvents(slot0)
end

function PromptController.setPromptStatus(slot0, slot1)
end

function PromptController.registerProtocals(slot0)
	slot0:RegisterProtocal(16800, "hander16800")
end

function PromptController.hander16800(slot0, slot1)
	if slot1.type == PromptTypeConst.Join_guild then
		GuildController:getInstance():setApplyListStatus(slot1)
	elseif slot1.type == PromptTypeConst.World_boss or slot1.type == PromptTypeConst.Escort then
		slot0.model:addPromptData(slot1)
	elseif slot1.type == PromptTypeConst.Private_chat or slot1.type == PromptTypeConst.At_notice then
		GlobalTimeTicket:getInstance():add(function ()
			slot0 = true

			if uv0.type == PromptTypeConst.Private_chat then
				slot1, slot2 = nil

				for slot6, slot7 in pairs(uv0.arg_uint32 or {}) do
					if slot7.key == 1 then
						slot1 = slot7.value

						break
					end
				end

				for slot6, slot7 in pairs(uv0.arg_str or {}) do
					if slot7.key == 1 then
						slot2 = slot7.value

						break
					end
				end

				if not slot1 or not slot2 or not FriendController:getInstance():isFriend(slot2, slot1) then
					slot0 = false

					if slot1 and slot2 then
						ChatController:getInstance():noticeReader(slot2, slot1)
					end
				end
			end

			if slot0 then
				uv1.model:addPromptData(uv0)
			end
		end, 2, 1)
	elseif slot1.type == PromptTypeConst.Endless_trail then
		if BattleController:getInstance():isInFight() == false or BattleController:getInstance():getCurFightType() ~= BattleConst.Fight_Type.Endless then
			slot0.model:addPromptData(slot1)
		end
	elseif slot1.type == PromptTypeConst.GuileMuster then
		slot0.model:addPromptData(slot1)
	elseif slot1.type == PromptTypeConst.Challenge then
		slot0.model:addPromptData(slot1)
	elseif slot1.type == PromptTypeConst.Guild or slot1.type == PromptTypeConst.Guild_war or slot1.type == PromptTypeConst.Guild_voyage or slot1.type == PromptTypeConst.BBS_message or slot1.type == PromptTypeConst.BBS_message_reply or slot1.type == PromptTypeConst.BBS_message_reply_self or slot1.type == PromptTypeConst.Mine_defeat then
		slot0.model:addPromptData(slot1)
	end
end

function PromptController.openPromptPanel(slot0, slot1)
end

function PromptController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
