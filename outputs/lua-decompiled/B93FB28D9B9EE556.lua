slot1 = HomeworldController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = {
	"H65001",
	"H65002",
	"H65003",
	"H65004"
}
HomeworldPet = HomeworldPet or BaseClass()

function HomeworldPet.__init(slot0, slot1)
	slot0.parent = slot1
	slot0.cur_pet_grid_x = 10
	slot0.cur_pet_grid_y = 10
	slot0.cur_btn_status = false
	slot0.cur_zorder = 1
	slot0.btn_list = {}
	slot0.can_move_role = true

	slot0:createRoorWnd()
	slot0:registerEvent()
end

function HomeworldPet.createRoorWnd(slot0)
	slot0.root_wnd = ccui.Layout:create()
	slot0.size = cc.size(120, 80)

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0))
	slot0.root_wnd:setContentSize(slot0.size)
	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:setSwallowTouches(true)

	slot4 = slot0.root_wnd

	slot0.parent:addChild(slot4, 99)

	for slot4 = 1, 3 do
		slot5, slot6, slot7 = nil

		if slot4 == 1 then
			slot5 = PathTool.getResFrame("homeworld", "homeworld_1045")
			slot7 = slot0.size.height * 0.5 + 20
			slot6 = -50
		elseif slot4 == 2 then
			slot5 = PathTool.getResFrame("homeworld", "homeworld_1046")
			slot7 = slot0.size.height + 50
			slot6 = slot0.size.width * 0.5
		elseif slot4 == 3 then
			slot5 = PathTool.getResFrame("homeworld", "homeworld_1047")
			slot7 = slot0.size.height * 0.5 + 20
			slot6 = slot0.size.width + 50
		end

		if slot5 and slot6 and slot7 then
			slot9 = createImage(slot0.root_wnd, slot5, slot6, slot7, cc.p(0.5, 0.5), true, 2)

			slot9:setVisible(false)
			slot9:setTouchEnabled(true)
			registerButtonEventListener(slot9, function ()
				uv0:_onClickBtnByIndex(uv1)
			end, true, nil, nil, nil, 0)
			uv0(slot0.btn_list, {
				pos_x = slot6,
				pos_y = slot7,
				btn_node = slot9
			})
		end
	end
end

function HomeworldPet._onClickBtnByIndex(slot0, slot1)
	if slot1 == 1 then
		HomepetController:getInstance():openHomePetBaseInfoPanel(true)
	elseif slot1 == 2 then
		HomepetController:getInstance():sender26103(1)
	elseif slot1 == 3 then
		HomepetController:getInstance():sender26103(2)
	end

	slot0.root_wnd:stopAllActions()
	slot0:showFuncBtnList(false)
end

function HomeworldPet.registerEvent(slot0)
	slot0.root_wnd:addTouchEventListener(function (slot0, slot1)
		if not uv0.can_move_role then
			return
		end

		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
			uv0.move_begin_grid_x = uv0.cur_pet_grid_x
			uv0.move_begin_grid_y = uv0.cur_pet_grid_y
		elseif slot1 == ccui.TouchEventType.moved then
			if not uv0._is_update_occ and uv0.sole_id then
				uv0._is_update_occ = true

				uv1:updateOccupyGridList({
					{
						HomeworldConst.Scene_Unit_Type.Role,
						uv0.sole_id
					}
				}, 1)
				uv0:updateGridStatus(true, uv0.cur_pet_grid_x, uv0.cur_pet_grid_y)
				uv0:setLocalZOrder(99)
			end

			slot2 = slot0:getTouchMovePosition()

			if uv0.touch_began and slot2 and (math.abs(slot2.x - uv0.touch_began.x) > 10 or math.abs(slot2.y - uv0.touch_began.y) > 10) then
				uv0:movePetByPos(uv0.parent:convertToNodeSpace(slot2))
			end
		elseif slot1 == ccui.TouchEventType.ended or slot1 == ccui.TouchEventType.canceled then
			uv0._is_update_occ = false
			slot2 = slot0:getTouchEndPosition()
			slot3 = false

			if uv0.touch_began and slot2 and (math.abs(slot2.x - uv0.touch_began.x) > 10 or math.abs(slot2.y - uv0.touch_began.y) > 10) then
				slot3 = true
			end

			if slot3 == false then
				playButtonSound2()
				uv0:onClickPet()
			elseif not uv0.last_grid_can_use then
				uv0.cur_pet_grid_x = uv0.move_begin_grid_x
				uv0.cur_pet_grid_y = uv0.move_begin_grid_y

				uv0:adjustPosition(uv0.cur_pet_grid_x, uv0.cur_pet_grid_y)
			end

			uv0:updateGridStatus(false)
			uv1:updateAllUnitZorder()
			uv0:randomPlayAudioEffect()
		end
	end)
end

function HomeworldPet.onClickPet(slot0)
	slot0:showFuncBtnList(not slot0.cur_btn_status)
end

function HomeworldPet.randomPlayAudioEffect(slot0)
	AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_home_pet0" .. math.random(1, 5))
end

function HomeworldPet.setPetTalkInfo(slot0, slot1)
	slot0:showTalkPanel(true, slot1)
	doStopAllActions(slot0.talk_panel)
	delayRun(slot0.talk_panel, 5, function ()
		uv0:showTalkPanel(false)
	end)
end

function HomeworldPet.showTalkPanel(slot0, slot1, slot2)
	if slot1 then
		slot3 = 10
		slot4 = 10
		slot5 = 24

		if slot0.talk_panel == nil then
			slot0.talk_panel = createImage(slot0.root_wnd, PathTool.getResFrame("common", "common_1067"), slot0.size.width * 0.5, slot0.size.height, cc.p(0.5, 0), true, 0, true)

			slot0.talk_panel:setCapInsets(cc.rect(36, 21, 6, 22))

			slot0.talk_label = createRichLabel(20, cc.c4b(100, 50, 35, 255), cc.p(0, 1), cc.p(slot3, 0), 6, nil, 200 - slot3 * 2)

			slot0.talk_panel:addChild(slot0.talk_label)
		else
			slot0.talk_panel:setVisible(true)
		end

		slot0.talk_label:setString(slot2)

		slot7 = slot0.talk_label:getContentSize()
		slot9 = slot4 + slot5 + slot7.height

		slot0.talk_panel:setContentSize(cc.size(slot3 * 2 + math.min(slot7.width, slot6), slot9))
		slot0.talk_label:setPosition(slot3, slot9 - slot4)
	elseif slot0.talk_panel then
		slot0.talk_panel:setVisible(false)
	end
end

function HomeworldPet.updateGridStatus(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.grid_node then
			slot0.grid_node = createSprite(PathTool.getResFrame("homeworld", "homeworld_1024"), nil, nil, slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
			slot4, slot5 = HomeTile.toPixel(nil, slot2, slot3)

			if slot0.parent.pos_node then
				slot0.parent.pos_node:setPosition(cc.p(slot4, slot5))
				slot0.grid_node:setPosition(slot0.root_wnd:convertToNodeSpace(slot0.parent.pos_node:convertToWorldSpace(cc.p(0, 0))))
			end
		end

		slot4 = PathTool.getResFrame("homeworld", "homeworld_1024")

		if not uv0:checkGridIsCanWalk(slot2, slot3, HOME_TILE_TYPE_LAND) then
			slot4 = PathTool.getResFrame("homeworld", "homeworld_1023")
		end

		if not slot0.cur_grid_res or slot0.cur_grid_res ~= slot4 then
			slot0.cur_grid_res = slot4

			loadSpriteTexture(slot0.grid_node, slot4, LOADTEXT_TYPE_PLIST)
		end

		slot0.grid_node:setVisible(true)
	elseif slot0.grid_node then
		slot0.grid_node:setVisible(false)
	end
end

function HomeworldPet.adjustPosition(slot0, slot1, slot2)
	slot3, slot4 = HomeTile.toPixel(nil, slot1 or slot0.cur_pet_grid_x, slot2 or slot0.cur_pet_grid_y)

	slot0.root_wnd:setPosition(cc.p(slot3, slot4))
end

function HomeworldPet.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot0:getRandomGridPos() then
		slot0:removePetSpine()

		slot0.pet_spine = createEffectSpine(slot0:getPetEffectName(), cc.p(slot0.size.width * 0.5, 0), cc.p(0.5, 0), true, PlayerAction.idle)

		slot0.root_wnd:addChild(slot0.pet_spine, 1)
		slot0:adjustPosition(slot0.cur_pet_grid_x, slot0.cur_pet_grid_y)
	end

	if Config.HomePetData.data_const.pet_act_interval then
		slot3 = slot2.val

		if slot0.action_change_ticket then
			GlobalTimeTicket:getInstance():remove(slot0.action_change_ticket)

			slot0.action_change_ticket = nil
		end

		slot0.action_change_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:showPetSpine()
		end, slot3)
	end

	slot0:showPetArrow(true)
end

function HomeworldPet.showPetSpine(slot0)
	slot0:removePetSpine()

	slot0.pet_spine = createEffectSpine(slot0:getPetEffectName(slot0.spine_index), cc.p(slot0.size.width * 0.5, 0), cc.p(0.5, 0), true, PlayerAction.idle)

	slot0.root_wnd:addChild(slot0.pet_spine, 1)
	slot0:updateRandomArrowRes()
end

function HomeworldPet.getPetEffectName(slot0, slot1)
	slot2 = {}

	if slot1 then
		for slot6, slot7 in ipairs(uv0) do
			if slot6 ~= slot1 then
				uv1(slot2, slot6)
			end
		end

		slot0.spine_index = slot2[math.random(1, #slot2)]

		return uv0[slot0.spine_index] or "H65001"
	else
		slot0.spine_index = math.random(1, #uv0)

		return uv0[slot0.spine_index] or "H65001"
	end
end

function HomeworldPet.getRandomGridPos(slot0)
	uv0:updateOccupyGridList(nil, 1)

	slot1 = {}
	slot2 = 11
	slot3 = 41

	for slot7 = 1, 18 do
		for slot11 = 1, 39 do
			if uv1:checkGridIsCanWalk(slot2, slot3, HOME_TILE_TYPE_LAND) == true then
				table.insert(slot1, {
					slot2,
					slot3
				})
			end

			slot3 = slot3 - 1
		end

		if slot2 - 1 < 1 then
			slot2 = 21
		end

		slot3 = 41
	end

	if #slot1 > 0 then
		slot4 = math.random(1, #slot1)
		slot0.cur_pet_grid_x = slot1[slot4][1]
		slot0.cur_pet_grid_y = slot1[slot4][2]

		return true
	else
		return false
	end
end

function HomeworldPet.showFuncBtnList(slot0, slot1)
	slot0.cur_btn_status = slot1

	for slot5, slot6 in ipairs(slot0.btn_list) do
		slot6.btn_node:stopAllActions()

		if slot1 == true then
			slot0.root_wnd:setLocalZOrder(99)
			slot6.btn_node:setPosition(cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5))
			slot6.btn_node:setVisible(true)
			slot6.btn_node:runAction(cc.Sequence:create(cc.MoveTo:create(0.1, cc.p(slot6.pos_x, slot6.pos_y)), cc.CallFunc:create(function ()
				uv0.btn_node:setTouchEnabled(true)
			end)))
		else
			slot0.root_wnd:setLocalZOrder(slot0.cur_zorder)
			slot6.btn_node:setTouchEnabled(false)
			slot6.btn_node:setPosition(cc.p(slot6.pos_x, slot6.pos_y))
			slot6.btn_node:runAction(cc.Sequence:create(cc.MoveTo:create(0.1, cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5)), cc.CallFunc:create(function ()
				uv0.btn_node:setVisible(false)
			end)))
		end
	end

	slot0:openAutoClostBtnTimer(slot1)
end

function HomeworldPet.setCanMoveRoleStatus(slot0, slot1)
	slot0.can_move_role = slot1
end

function HomeworldPet.openAutoClostBtnTimer(slot0, slot1)
	if slot1 == true then
		delayRun(slot0.root_wnd, 3, function ()
			uv0:showFuncBtnList(false)
		end)
	else
		slot0.root_wnd:stopAllActions()
	end
end

function HomeworldPet.setVisible(slot0, slot1)
	if slot0.root_wnd then
		slot0.root_wnd:setVisible(slot1)
	end
end

function HomeworldPet.removePetSpine(slot0)
	if slot0.pet_spine then
		slot0.pet_spine:clearTracks()
		slot0.pet_spine:removeFromParent()

		slot0.pet_spine = nil
	end
end

function HomeworldPet.getOccupyGridList(slot0)
	return {
		{
			slot0.cur_pet_grid_x,
			slot0.cur_pet_grid_y
		}
	}
end

function HomeworldPet.getCurGridPos(slot0)
	return slot0.cur_pet_grid_x, slot0.cur_pet_grid_y
end

function HomeworldPet.getUnitType(slot0)
	return HomeworldConst.Scene_Unit_Type.Pet
end

function HomeworldPet.movePetByPos(slot0, slot1)
	slot2, slot3 = HomeTile.toTile(nil, slot1.x, slot1.y - 30)

	if slot0.cur_pet_grid_x ~= slot2 or slot0.cur_pet_grid_y ~= slot3 then
		slot0:adjustPosition(slot2, slot3)
		slot0:updateGridStatus(true, slot2, slot3)

		slot0.cur_pet_grid_x = slot2
		slot0.cur_pet_grid_y = slot3

		if uv0:checkGridIsCanWalk(slot2, slot3, HOME_TILE_TYPE_LAND) then
			slot0.last_grid_can_use = true
		else
			slot0.last_grid_can_use = false
		end
	end
end

function HomeworldPet.getBottomGridPos(slot0)
	return slot0.cur_pet_grid_x, slot0.cur_pet_grid_y
end

function HomeworldPet.setLocalZOrder(slot0, slot1)
	slot1 = slot1 or 1

	if slot0.root_wnd then
		slot0.root_wnd:setLocalZOrder(slot1)
	end

	slot0.cur_zorder = slot1
end

function HomeworldPet.showPetArrow(slot0, slot1)
	if slot1 == true then
		if not slot0.arrow_icon then
			slot0.arrow_icon = createSprite(slot0:getRandomArrowRes(), slot0.size.width * 0.5, slot0.size.height + 70, slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

			slot0.arrow_icon:setVisible(false)
		end

		if slot0.arrow_icon:isVisible() == false then
			slot0.arrow_icon:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveTo:create(0.7, cc.p(slot0.size.width * 0.5, slot0.size.height + 50)), cc.MoveTo:create(0.7, cc.p(slot0.size.width * 0.5, slot0.size.height + 70)))))
		end

		slot0.arrow_icon:setVisible(true)
	else
		slot0.arrow_icon:setVisible(false)
		doStopAllActions(slot0.arrow_icon)
	end
end

function HomeworldPet.getRandomArrowRes(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(HomeworldConst.Pet_Arrow_Res) do
		if not slot0.cur_arrow_res or slot0.cur_arrow_res ~= slot6 then
			uv0(slot1, slot6)
		end
	end

	slot3 = slot1[math.random(1, #slot1)]
	slot0.cur_arrow_res = slot3

	return PathTool.getResFrame("homeworld", slot3)
end

function HomeworldPet.updateRandomArrowRes(slot0)
	if not slot0.arrow_icon then
		return
	end

	slot1 = slot0:getRandomArrowRes()

	slot0.arrow_icon:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.CallFunc:create(function ()
		loadSpriteTexture(uv0.arrow_icon, uv1, LOADTEXT_TYPE_PLIST)
	end), cc.FadeIn:create(0.2)))
end

function HomeworldPet.__delete(slot0)
	GlobalTimeTicket:getInstance():remove(slot0.action_change_ticket)

	slot0.action_change_ticket = nil

	doStopAllActions(slot0.arrow_icon)
	doStopAllActions(slot0.talk_panel)
	slot0:removePetSpine()

	if slot0.root_wnd then
		slot0.root_wnd:removeAllChildren()
		slot0.root_wnd:removeFromParent()
	end
end
