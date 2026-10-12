Npc = Npc or BaseClass(SceneObj)

function Npc.__init(slot0)
	slot0.move_start_pos = cc.p(0, 0)
	slot0.move_end_pos = cc.p(0, 0)
	slot0.move_total_distance = 0
	slot0.move_pass_distance = 0
	slot0.move_dir = cc.p(0, 0)
	slot0.move_speed = 6
	slot0.dir_number = 0
	slot0.isRuning = false
	slot0.isNeedRun = false
	slot0.isTalking = false
	slot0.imgNameH = 0
	slot0.showImgName = false
end

function Npc.setVo(slot0, slot1)
	SceneObj.setVo(slot0, slot1)

	slot0.dir_number = slot1.dir == 0 and 6 or slot1.dir
	slot2 = slot0.vo

	slot0:setBattleStatus(slot0.vo.status)

	if slot0.update_self_event == nil and slot0.vo ~= nil then
		slot0.update_self_event = slot0.vo:Bind(SceneEvent.UPDATE_UNIT_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "status" then
				uv0:setBattleStatus(uv0.vo.status)
			end
		end)
	end
end

function Npc.setBattleStatus(slot0, slot1)
	if slot1 == 0 then
		if slot0.fightEffect ~= nil then
			slot0.fightEffect:runAction(cc.RemoveSelf:create())

			slot0.fightEffect = nil
		end
	elseif slot1 == 1 then
		if slot0.fightEffect == nil then
			slot0.fightEffect = createEffectSpine(PathTool.getEffectRes(196), cc.p(0, 0), cc.p(0.5, 0), true)

			slot0.topContainer:addChild(slot0.fightEffect)
		end
	end

	slot0:updateEffectPos()
end

function Npc.registEvent(slot0)
end

function Npc.clickHandler(slot0)
end

function Npc.update(slot0)
	SceneObj.update(slot0)
	slot0:updateNamePos()

	if slot0.isNeedRun then
		slot0.move_pass_distance = slot0.move_pass_distance + slot0.move_speed

		if slot0.move_total_distance <= slot0.move_pass_distance then
			slot0.move_pass_distance = 0

			slot0:setWorldPos(cc.p(slot0.move_end_pos.x, slot0.move_end_pos.y))

			slot0.isRuning = false
			slot0.isNeedRun = false

			slot0:doStand()
		else
			slot0:setWorldPos(cc.pAdd(cc.p(slot0.move_start_pos.x, slot0.move_start_pos.y), cc.pMul(slot0.move_dir, slot0.move_pass_distance)))

			slot0.isRuning = true
		end
	end
end

function Npc.computeMoveInfo(slot0, slot1, slot2)
	slot5 = cc.pSub(slot1, cc.p(slot0.world_pos.x, slot0.world_pos.y))
	slot5 = cc.pNormalize(slot5)

	return GameMath.GetDirectionNumberHV(slot5, slot0.dir_number), cc.pGetLength(slot5), slot5
end

function Npc.doMove(slot0, slot1, slot2)
	if slot1 == nil then
		slot1 = slot0.world_pos
	end

	if slot1.x == slot2.x and slot1.y == slot2.y then
		return
	end

	slot0.move_pass_distance = 0
	slot0.move_total_distance = 0
	slot0.move_start_pos = slot1
	slot0.move_end_pos = slot2
	slot0.dir_number, slot0.move_total_distance, slot0.move_dir = slot0:computeMoveInfo(slot2)
	slot0.isNeedRun = true

	slot0:setDir(slot0.dir_number)

	if not slot0.isRuning then
		slot0:doRun()
	end
end

function Npc.__delete(slot0)
	if slot0.update_self_event ~= nil and slot0.vo ~= nil then
		slot0.vo:UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	slot0.isTalking = nil
	slot0.move_start_pos = nil
	slot0.move_end_pos = nil
	slot0.move_total_distance = nil
	slot0.move_pass_distance = nil
	slot0.move_dir = nil
	slot0.move_speed = nil
	slot0.dir_number = nil
	slot0.isRuning = nil
	slot0.isNeedRun = nil
	slot0.mission_effect = nil
end

function Npc.setTalkingState(slot0, slot1)
	if slot0.boxHeight < 50 then
		return
	end

	if slot1 and slot0.isTalking then
		return
	end

	slot0.isTalking = slot1

	if slot0.isTalking and Config.UnitData.data_unit(slot0.vo.base_id).talk and #slot2 > 0 then
		StoryView:showBubble(5, 1, slot0.vo.id, slot0.vo.battle_id, slot2[math.random(1, #slot2)], nil, nil)
	end
end

function Npc.getTalkingState(slot0)
	return slot0.isTalking
end

function Npc.updateNamePos(slot0)
	SceneObj.updateNamePos(slot0)

	if slot0.mission_effect then
		slot0.mission_effect:setPosition(cc.p(slot0.topContainer:getContentSize().width / 2, 10))

		if StoryCtrl:getInstance():getData():isStoryState() then
			slot0.mission_effect:setVisible(false)
		else
			slot0.mission_effect:setVisible(true)
		end
	end
end

function Npc.addImgName(slot0, slot1)
	if Config.NpcHeadRes ~= nil and PathTool.getNPCRes(Config.NpcHeadRes[slot1]) then
		slot0:addTopObj(slot2, true)

		slot0.imgNameH = 35
	end
end

function Npc.setZOrder(slot0, slot1)
	slot0.node:setLocalZOrder(slot1 - 30)
end
