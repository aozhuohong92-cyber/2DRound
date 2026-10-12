WarriorTool = {
	Box_Arr = {},
	Element_Arr = {},
	id = 0,
	token = 0,
	Player = nil,
	Cur_Level = 1,
	Max_Level = 0,
	All_Level = 20,
	MaxWidth = 525,
	screenWidth = 720,
	seasonStartTime = 0,
	seasonEndTime = 0,
	NowFighting = false,
	OBJECT = {
		SNARE_A = 8,
		BOSS_C = 7,
		ENEMY_B = 3,
		SNARE_B = 9,
		EQUIP_B = 12,
		BOSS_A = 5,
		EQUIP_A = 11,
		SNARE_C = 10,
		ENEMY_C = 4,
		PLAYER = 1,
		BOSS_B = 6,
		ENEMY_A = 2,
		EQUIP_C = 13,
		NONE = 0
	},
	Map = nil,
	parentTag = 1,
	Music_State = Action_Warrior_Event.Music_State,
	player_select = false,
	player_move_select = false
}

function WarriorTool.intBtnMusic(slot0, slot1)
	if WarriorTool.Music_State then
		WarriorTool.Music_State = true

		slot1:getChildByName("lab"):setString("音乐/开")
	else
		WarriorTool.Music_State = false

		slot1:getChildByName("lab"):setString("音乐/关")
	end

	SysEnv:getInstance():set(SysEnv.keys.music_is_open, WarriorTool.Music_State, false)
end

function WarriorTool.setMusic(slot0, slot1)
	if WarriorTool.Music_State then
		WarriorTool.Music_State = false

		slot1:getChildByName("lab"):setString("音乐/关")
	else
		WarriorTool.Music_State = true

		slot1:getChildByName("lab"):setString("音乐/开")
	end

	SysEnv:getInstance():set(SysEnv.keys.music_is_open, WarriorTool.Music_State, false)
end

function WarriorTool.getTwo(slot0, slot1)
	if slot1 == "first" then
		return 0.3
	elseif slot1 == "second" then
		return 0.7
	end
end

function WarriorTool.getThree(slot0, slot1)
	if slot1 == "first" then
		return 0.2
	elseif slot1 == "second" then
		return 0.5
	else
		return 0.8
	end
end

function WarriorTool.addPlayerFight(slot0, slot1)
	WarriorTool.Player.score = tonumber(WarriorTool.Player.score) + tonumber(slot1)

	WarriorTool.Player.element_score:setNum(WarriorTool.Player.score)
end

function WarriorTool.fightStart(slot0)
	for slot5, slot6 in pairs(WarriorTool.Player:getParent():getParent().element_list) do
		if slot6.id and slot6.posName == "second" then
			if WarriorTool.OBJECT.EQUIP_A <= tonumber(slot6.id) and tonumber(slot6.id) <= WarriorTool.OBJECT.EQUIP_C then
				return
			end

			WarriorTool.NowFighting = true

			if math.abs(tonumber(slot6.score)) < tonumber(WarriorTool.Player.score) then
				WarriorTool.Player:setActSpine(0.5)
				WarriorTool.Player:runAction(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
					WarriorTool.Player:pitchSpine(false)

					if WarriorTool.OBJECT.SNARE_A > tonumber(uv0.id) or tonumber(uv0.id) > WarriorTool.OBJECT.SNARE_C then
						ActionController:getInstance().action_warrior_world:updataEnemyNum()
					end

					uv1:addPlayerFight(uv0.score)
					uv0:removeFromParent()

					uv0 = nil

					uv1:canWin()

					WarriorTool.NowFighting = false
				end)))
			else
				if WarriorTool.OBJECT.SNARE_A > tonumber(slot6.id) or tonumber(slot6.id) > WarriorTool.OBJECT.SNARE_C then
					slot6:setActSpine(0.5)
					slot6.root_wnd:setScaleX(-0.5)
				end

				slot6:runAction(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
					if WarriorTool.OBJECT.SNARE_A <= tonumber(uv0.id) and tonumber(uv0.id) <= WarriorTool.OBJECT.SNARE_C then
						uv1:addPlayerFight(uv0.score)
					else
						uv1:addPlayerFight(-tonumber(uv0.score))
					end
				end), cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
					WarriorTool.Player:setVisible(false)
					ActionController:getInstance().action_warrior_world:openGameOver(false)

					WarriorTool.NowFighting = false
				end)))
			end
		end
	end
end

function WarriorTool.canWin(slot0)
	for slot4, slot5 in ipairs(WarriorTool.Element_Arr) do
		if slot5.id then
			return
		end
	end

	WarriorTool.Player:runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
		ActionController:getInstance().action_warrior_world:openGameOver(true)
	end)))
end

function WarriorTool.register_playerEvent(slot0)
	slot1 = WarriorTool.Player:getPositionX()
	slot2 = WarriorTool.Player:getPositionY()

	WarriorTool.Player.event_img:addTouchEventListener(function (slot0, slot1)
		if WarriorTool.NowFighting then
			return
		end

		if WarriorTool.player_select then
			return
		end

		if slot1 == ccui.TouchEventType.began then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.moved then
			WarriorTool.player_move_select = true

			WarriorTool.Player:getParent():getParent():setZOrder(99)

			slot2 = WarriorTool.Player:getParent():convertToNodeSpace(cc.p(slot0:getTouchMovePosition()))

			WarriorTool.Player:setPosition(cc.p(slot2.x - 50, slot2.y - 35))
		elseif (ccui.TouchEventType.ended or slot1 == ccui.TouchEventType.canceled) and WarriorTool.player_move_select then
			slot9 = WarriorTool.Player:getPositionX()
			slot4 = WarriorTool.Player:getParent():convertToWorldSpace(cc.p(slot9, WarriorTool.Player:getPositionY()))

			for slot8, slot9 in ipairs(WarriorTool.Box_Arr) do
				WarriorTool.Player:getParent():getParent():setZOrder(3)

				if slot9:convertToWorldSpace(cc.p(slot9.element_bg:getPositionX(), slot9.element_bg:getPositionY())).x <= slot4.x + 50 and slot12.y <= slot4.y + 35 and slot4.x + 50 <= slot12.x + slot9.element_bg:getContentSize().width and slot4.y + 35 <= slot12.y + slot9.element_bg:getContentSize().height then
					WarriorTool.Player:updataPlayer(slot9.element_bg)
					WarriorTool.Player:setPosition(0, 0)

					return
				end
			end

			WarriorTool.Player:setPosition(cc.p(uv0, uv1))
		end
	end)
end
