ActionWarriorElement = class("ActionWarriorElement", function ()
	return ccui.Widget:create()
end)

function ActionWarriorElement.ctor(slot0, slot1, slot2, slot3, slot4)
	slot0:initData(slot1, slot2, slot3, slot4)
	slot0:createRootWnd()
end

function ActionWarriorElement.initData(slot0, slot1, slot2, slot3, slot4)
	slot0.box_pos = cc.p(525, 42)
	slot0.box_size = cc.size(189, 179)
	slot0.element_list = {}
	slot0._row = tonumber(string.sub(slot1, 2, string.len(slot1)))
	slot0._col = tonumber(string.sub(slot2, 2, string.len(slot2)))
	slot0.data = slot3
	slot0.havaCap = slot4

	slot0:runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
		WarriorTool:register_playerEvent()
	end)))
end

function ActionWarriorElement.createRootWnd(slot0)
	if slot0.data.skin == 0 then
		if slot0.data.type == 1 then
			slot0.data.skin = 5
		else
			slot0.data.skin = 8
		end
	end

	slot0.element_bg = createImage(slot0, PathTool.getResFrame("action_warrior", "warrior_elementbg_" .. slot0.data.skin), 0, 0, cc.p(0, 0), true, 3, true)

	slot0.element_bg:setContentSize(slot0.box_size)

	slot0.element_bg.tag = slot0._row * 10 + slot0._col
	slot0.element_bg.type = slot0.data.type

	if WarriorTool.MaxWidth < slot0.box_pos.x + slot0._row * slot0.box_size.width + slot0.data.type * slot0.box_size.width then
		WarriorTool.MaxWidth = slot1
	end

	slot0:setPositionX(slot0.box_pos.x + slot0._row * slot0.box_size.width)
	slot0:setPositionY(slot0.box_pos.y + slot0._col * slot0.box_size.height)

	if slot0._col > 2 then
		slot0:setPositionY(slot0.box_pos.y + slot0._col * slot0.box_size.height + 45)
	end

	if slot0.data.type == 2 then
		slot0.box_size = cc.size(378, 179)

		slot0.element_bg:setContentSize(slot0.box_size)
		slot0.element_bg:loadTexture(PathTool.getResFrame("action_warrior", "warrior_elementbg_" .. slot0.data.skin), 1)
	end

	if slot0._row == 8 then
		if slot0._col == 1 then
			slot0.box_size = cc.size(269, 165)

			slot0.element_bg:setContentSize(slot0.box_size)
			slot0.element_bg:loadTexture(PathTool.getResFrame("action_warrior", "warrior_elementbg_1" .. 5 + slot0._col), 1)
			slot0:setPositionY(slot0.box_pos.y + slot0._col * 165)
		elseif slot0._col == 2 then
			slot0.box_size = cc.size(309, 165)

			slot0.element_bg:setContentSize(slot0.box_size)
			slot0.element_bg:loadTexture(PathTool.getResFrame("action_warrior", "warrior_elementbg_1" .. 5 + slot0._col), 1)
			slot0:setPositionY(slot0.box_pos.y + slot0._col * 165)
		elseif slot0._col == 3 then
			slot0.box_size = cc.size(397, 165)

			slot0.element_bg:setContentSize(slot0.box_size)
			slot0.element_bg:loadTexture(PathTool.getResFrame("action_warrior", "warrior_elementbg_1" .. 5 + slot0._col), 1)
			slot0:setPositionY(slot0.box_pos.y + slot0._col * 165)
		elseif slot0._col == 4 then
			slot0.box_size = cc.size(359, 179)

			slot0.element_bg:loadTexture(PathTool.getResFrame("action_warrior", "warrior_elementbg_1" .. 5 + slot0._col), 1)
			slot0:setPositionY(slot0.box_pos.y + slot0._col * 165 + 14)
		end
	end

	slot0:createCap()
	slot0:createElement()
	slot0:register_event()
end

function ActionWarriorElement.createCap(slot0)
	if slot0._row == 8 or slot0._col <= 2 then
		return
	end

	if not slot0.havaCap then
		return
	end

	slot1 = "warrior_11"
	slot2 = cc.size(206, 80)

	if slot0.data.type == 2 then
		slot1 = "warrior_12"
		slot2 = cc.size(400, 149)
	end

	slot0.element_cap = createImage(slot0, PathTool.getResFrame("action_warrior", slot1), 0, 0, cc.p(0, 0), true, 4, true)

	slot0.element_cap:setContentSize(slot2)
	slot0.element_cap:setPosition(cc.p(slot0.element_bg:getPositionX() - 5, slot0.element_bg:getPositionY() + slot0.box_size.height - 15))

	if WarriorTool.Cur_Level <= WarriorTool.All_Level and slot0._row - 1 >= 1 and slot0._col + 1 <= 4 and Action_Warrior_Event.data_mapinformation["d" .. WarriorTool.Cur_Level].data["t" .. slot0._row - 1]["f" .. slot0._col + 1].type == 2 then
		slot0.element_cap:setVisible(false)
	end
end

function ActionWarriorElement.register_event(slot0)
	slot0.element_bg:setTouchEnabled(true)
	slot0.element_bg:addClickEventListener(function (slot0)
		if not WarriorTool.player_select then
			return
		elseif WarriorTool.player_select then
			WarriorTool.player_select = false

			WarriorTool.Player:pitchSpine(false)
			WarriorTool.Player:updataPlayer(uv0.element_bg)
		end
	end)
end

function ActionWarriorElement.createElement(slot0)
	for slot4, slot5 in pairs(slot0.data[1]) do
		if tonumber(slot5[1].id) > 0 then
			slot6 = Factory.New(slot5, slot4, slot0.box_size.width, slot0.data.type, slot0.element_bg.tag)

			slot6.item:setPosition(cc.p(0, 0))
			slot6.item:setAnchorPoint(cc.p(0, 0))
			slot0.element_bg:addChild(slot6.item)

			if tonumber(slot5[1].id) == WarriorTool.OBJECT.PLAYER then
				WarriorTool.Map:setPositionX(-(slot0.box_pos.x + (slot0._row + 1) * 189 + slot0.data.type * 189 - SCREEN_WIDTH))

				WarriorTool.Player = slot6.item

				WarriorTool.Player:updataPlayer(slot0.element_bg)
			else
				table.insert(slot0.element_list, slot6.item)
				table.insert(WarriorTool.Element_Arr, slot6.item)
			end
		end
	end
end

function ActionWarriorElement.DeleteMe(slot0)
	for slot4, slot5 in ipairs(slot0.element_list) do
		if slot5 then
			slot5:DeleteMe()

			slot5 = nil
		end
	end

	for slot4, slot5 in ipairs(WarriorTool.Element_Arr) do
		if slot5 then
			slot5:DeleteMe()

			slot5 = nil
		end
	end
end

Factory = Factory or BaseClass()

function Factory.__init(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.item = nil

	if tonumber(slot1[1].id) == WarriorTool.OBJECT.PLAYER then
		slot0.item = WarriorPlayer.new(slot1, slot2, slot3, slot4, slot5)
	elseif tonumber(slot1[1].id) <= WarriorTool.OBJECT.ENEMY_C then
		slot0.item = WarriorEnemy.new(slot1, slot2, slot3, slot4, slot5)
	elseif tonumber(slot1[1].id) <= WarriorTool.OBJECT.BOSS_C then
		slot0.item = WarriorBoss.new(slot1, slot2, slot3, slot4, slot5)
	elseif tonumber(slot1[1].id) <= WarriorTool.OBJECT.SNARE_C then
		slot0.item = WarriorSnare.new(slot1, slot2, slot3, slot4, slot5)
	elseif tonumber(slot1[1].id) <= WarriorTool.OBJECT.EQUIP_C then
		slot0.item = WarriorEquip.new(slot1, slot2, slot3, slot4, slot5)
	end
end

slot0 = class("ElementBase", function ()
	return ccui.Layout:create()
end)

function slot0.ctor(slot0)
	slot0.root_wnd = nil
	slot0.posName = nil
	slot0.size = nil
	slot0.id = nil
	slot0.score = nil
	slot0.tag = nil
	slot0.type = nil
	slot0.seatid = nil
	slot0.parentwidth = nil
	slot0.spinechart = {
		"H30104",
		"H30068",
		"H30029",
		"H30006",
		"H30063",
		"H30054",
		"H30046"
	}
	slot0.spineNamechart = {
		"action5",
		"action2",
		"action1",
		"action1",
		"action1",
		"action1",
		"action5"
	}
end

function slot0.createRootWnd(slot0, slot1, slot2)
	if slot1 == "spine" then
		slot0.root_wnd = createSpineByName(slot0.spinechart[slot2], "show")

		slot0.root_wnd:setAnimation(0, "show", true)
		slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0))
		slot0.root_wnd:setPosition(cc.p(0, 60))
		slot0.root_wnd:setScale(0.18)
		slot0:addChild(slot0.root_wnd)
	else
		slot0.root_wnd = createImage(slot0, PathTool.getResFrame("action_warrior", "warrior_element_" .. slot2), 0, 20, cc.p(0.5, 0), true, 3, false)
	end

	slot0.size = slot0.root_wnd:getContentSize()
end

function slot0.setActSpine(slot0, slot1)
	slot0.root_wnd:removeFromParent()

	slot0.root_wnd = nil
	slot0.root_wnd = createSpineByName(slot0.spinechart[tonumber(slot0.id)], slot0.spineNamechart[tonumber(slot0.id)])

	slot0.root_wnd:setAnimation(0, slot0.spineNamechart[tonumber(slot0.id)], false)
	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0))
	slot0.root_wnd:setPosition(cc.p(0, 40))
	slot0.root_wnd:setScale(slot1)
	slot0:addChild(slot0.root_wnd)
	slot0:setRootPosition()
end

function slot0.setRootPosition(slot0)
	slot1 = WarriorTool:getTwo(slot0.seatid)

	if slot0.type == 2 then
		slot1 = WarriorTool:getThree(slot0.seatid)
	end

	slot0.root_wnd:setPositionX(slot0.parentwidth * slot1)
end

function slot0.setScore(slot0, slot1)
	slot0.element_score:setNum(slot1)
end

function slot0.createLabel(slot0, slot1, slot2, slot3)
	slot0.element_score = CommonNum.new(slot1, slot0, "0", -2, cc.p(0.5, 0))

	slot0.element_score:setPosition(cc.p(slot2, slot3))
	slot0.element_score:setName("element_score")

	slot4 = WarriorTool:getTwo(slot0.seatid)

	if slot0.type == 2 then
		slot4 = WarriorTool:getThree(slot0.seatid)
	end

	slot0.element_score:setPositionX(slot0.parentwidth * slot4)
end

function slot0.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

WarriorPlayer = class("WarriorPlayer", slot0)

function WarriorPlayer.ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	WarriorPlayer.super.ctor(slot0, slot1, slot2, slot3, slot4, slot5)

	slot0.data = slot1
	slot0.posName = slot2
	slot0.id = slot0.data[1].id
	slot0.score = slot0.data[2].score
	slot0.type = slot4
	slot0.seatid = slot2
	slot0.parentwidth = slot3
	slot0.tag = slot5

	slot0:createRootWnd("spine", tonumber(slot0.id))
	slot0:createLabel(36, slot0.root_wnd:getContentSize().width * 0.5, 145)
	slot0:setScore(tonumber(slot0.data[2].score))
	slot0:createEvent_Img()
	slot0:setRootPosition()
end

function WarriorPlayer.updataPlayer(slot0, slot1)
	slot0.old_row = WarriorTool.Player:getParent():getParent()._row

	WarriorTool.Player:retain()
	WarriorTool.Player:removeFromParent()
	slot1:addChild(WarriorTool.Player)
	WarriorTool.Player:release()

	WarriorTool.parentTag = slot1.tag
	slot0.now_row = WarriorTool.Player:getParent():getParent()._row

	slot0:moveMap()

	if slot1.type == 1 then
		slot0.root_wnd:setPositionX(slot1:getContentSize().width * WarriorTool:getTwo("first"))
	else
		slot0.root_wnd:setPositionX(slot1:getContentSize().width * WarriorTool:getThree("first"))
	end

	slot0.root_wnd:setPositionY(60)
	WarriorTool:fightStart()
end

function WarriorPlayer.moveMap(slot0)
	if slot0.old_row == slot0.now_row then
		return
	end

	slot1 = 0

	if WarriorTool.screenWidth < math.abs(slot0.now_row < slot0.old_row and 189 * (slot0.old_row - slot0.now_row) or 189 * (slot0.old_row - slot0.now_row)) then
		return
	end

	if slot1 > 0 then
		if math.ceil(WarriorTool.Map:getPositionX()) + slot1 > -370 then
			WarriorTool.Map:runAction(cc.MoveTo:create(0.2, cc.p(-370, WarriorTool.Map:getPositionY())))

			return
		elseif math.abs(slot2) == WarriorTool.MaxWidth - WarriorTool.screenWidth then
			WarriorTool.Map:runAction(cc.MoveTo:create(0.2, cc.p(slot2 + slot1 - 188.99, slot3)))

			return
		end
	elseif math.abs(slot2 + slot1) > WarriorTool.MaxWidth - WarriorTool.screenWidth then
		WarriorTool.Map:runAction(cc.MoveTo:create(0.2, cc.p(-(WarriorTool.MaxWidth - WarriorTool.screenWidth), slot3)))

		return
	end

	WarriorTool.Map:runAction(cc.MoveTo:create(0.2, cc.p(slot2 + slot1, slot3)))
end

function WarriorPlayer.createEvent_Img(slot0)
	slot0.event_img = createImage(slot0, PathTool.getResFrame("action_warrior", "warrior_6"), slot0.size.width * 0.5, 70, cc.p(0.5, 0.5), true, 3, true)

	slot0.event_img:setContentSize(cc.size(50, 125))
	slot0.event_img:setTouchEnabled(true)
	slot0.event_img:setOpacity(0)

	slot1 = WarriorTool:getTwo(slot0.seatid)

	if slot0.type == 2 then
		slot1 = WarriorTool:getThree(slot0.seatid)
	end

	slot0.event_img:setPositionX(slot0.parentwidth * slot1)
	slot0.event_img:addClickEventListener(function ()
		if WarriorTool.NowFighting then
			return
		end

		if WarriorTool.player_move_select then
			WarriorTool.player_move_select = false

			return
		end

		if not WarriorTool.player_select then
			WarriorTool.player_select = true

			uv0:pitchSpine(true)
		else
			WarriorTool.player_select = false

			uv0:pitchSpine(false)
		end
	end)
end

function WarriorPlayer.pitchSpine(slot0, slot1)
	if slot1 then
		pos_y = 30
		scale = 0.5
		actionName = "stand3"
	else
		pos_y = 60
		scale = 0.18
		actionName = "show"
	end

	slot0.root_wnd:removeFromParent()

	slot0.root_wnd = nil
	slot0.root_wnd = createSpineByName(slot0.spinechart[tonumber(slot0.id)], actionName)

	slot0.root_wnd:setAnimation(0, actionName, true)
	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0))
	slot0.root_wnd:setPosition(cc.p(0, pos_y))
	slot0.root_wnd:setScale(scale)
	slot0:addChild(slot0.root_wnd)
	slot0:setRootPosition()
end

function WarriorPlayer.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

WarriorEnemy = class("WarriorEnemy", slot0)

function WarriorEnemy.ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	WarriorPlayer.super.ctor(slot0, slot1, slot2, slot3, slot4, slot5)

	slot0.data = slot1
	slot0.posName = slot2
	slot0.type = slot4
	slot0.seatid = slot2
	slot0.tag = slot5
	slot0.parentwidth = slot3
	slot0.id = slot0.data[1].id
	slot0.score = slot0.data[2].score

	slot0:createRootWnd("spine", tonumber(slot0.data[1].id))
	slot0:createLabel(37, slot0.root_wnd:getContentSize().width * 0.5, 130)
	slot0:setScore(tonumber(slot0.data[2].score))
	slot0:setRootPosition()
end

function WarriorEnemy.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

WarriorBoss = class("WarriorBoss", slot0)

function WarriorBoss.ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	WarriorPlayer.super.ctor(slot0, slot1, slot2, slot3, slot4, slot5)

	slot0.data = slot1
	slot0.posName = slot2
	slot0.type = slot4
	slot0.seatid = slot2
	slot0.tag = slot5
	slot0.parentwidth = slot3
	slot0.id = slot0.data[1].id
	slot0.score = slot0.data[2].score

	slot0:createRootWnd("spine", tonumber(slot0.data[1].id))
	slot0:createLabel(37, slot0.root_wnd:getContentSize().width * 0.5, 150)
	slot0:setScore(tonumber(slot0.data[2].score))
	slot0:setRootPosition(slot4, slot2, slot3)
end

function WarriorBoss.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

WarriorSnare = class("WarriorSnare", slot0)

function WarriorSnare.ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	WarriorPlayer.super.ctor(slot0, slot1, slot2, slot3, slot4, slot5)

	slot0.data = slot1
	slot0.posName = slot2
	slot0.type = slot4
	slot0.seatid = slot2
	slot0.tag = slot5
	slot0.parentwidth = slot3
	slot0.id = slot0.data[1].id
	slot0.score = slot0.data[2].score

	slot0:createRootWnd("Image", tonumber(slot0.data[1].id))
	slot0:createLabel(37, 35, slot0.root_wnd:getContentSize().height + 35)
	slot0:setScore(tonumber(slot0.data[2].score))
	slot0:setRootPosition()

	if tonumber(slot0.id) == WarriorTool.OBJECT.SNARE_B then
		for slot9 = 1, 3 do
			slot0.root_ignis = createSpineByName("E70023", "action")

			slot0.root_ignis:setAnimation(0, "action", true)
			slot0.root_ignis:setAnchorPoint(cc.p(0.5, 0))
			slot0.root_ignis:setPosition(cc.p(30 * slot9 - 15, 30))
			slot0.root_ignis:setScale(0.7)
			slot0.root_wnd:addChild(slot0.root_ignis)
		end

		slot0.element_score:setPosition(cc.p(120, slot0.root_wnd:getContentSize().height + 70))

		if slot0.type == 2 then
			slot0.element_score:setPosition(cc.p(190, slot0.root_wnd:getContentSize().height + 70))
		end
	end
end

function WarriorSnare.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

WarriorEquip = class("WarriorEquip", slot0)

function WarriorEquip.ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	WarriorPlayer.super.ctor(slot0, slot1, slot2, slot3, slot4, slot5)

	slot0.data = slot1
	slot0.posName = slot2
	slot0.type = slot4
	slot0.seatid = slot2
	slot0.tag = slot5
	slot0.parentwidth = slot3
	slot0.id = slot0.data[1].id
	slot0.score = slot0.data[2].score

	slot0:createRootWnd("Image", tonumber(slot0.data[1].id))
	slot0:createLabel(38, 35, slot0.root_wnd:getContentSize().height + 50)
	slot0:setScore(tonumber(slot0.data[2].score))
	slot0:setRootPosition()
	slot0:register_event()
end

function WarriorEquip.register_event(slot0)
	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			slot4 = uv0:getParent()
			slot6 = slot4

			for slot5, slot6 in pairs(slot4.getParent(slot6).element_list) do
				if slot6.id and WarriorTool.OBJECT.PLAYER < tonumber(slot6.id) and tonumber(slot6.id) <= WarriorTool.OBJECT.SNARE_C then
					return
				end
			end

			if WarriorTool.parentTag == uv0.tag then
				uv0.id = nil

				WarriorTool:addPlayerFight(uv0.score)
				WarriorTool:canWin()
				uv0:DeleteMe()
			end
		end
	end)
end

function WarriorEquip.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
