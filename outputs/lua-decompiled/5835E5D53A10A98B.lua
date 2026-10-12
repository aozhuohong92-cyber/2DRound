GuildVoyageEscortPanel = class("GuildVoyageEscortPanel", function ()
	return ccui.Layout:create()
end)
slot1 = GuildvoyageController:getInstance():getModel()
slot2 = table.insert
slot3 = GameNet:getInstance()

function GuildVoyageEscortPanel.ctor(slot0)
	slot0.voyage_line = {}
	slot0.distance = 28
	slot0.point_zorder = 4
	slot0.end_point_zorder = 5
	slot0.ship_zorder = 6
	slot0.time_zorder = 7

	slot0:createRootWnd()
end

function GuildVoyageEscortPanel.createRootWnd(slot0)
	slot0.size = cc.size(619, 753)

	slot0:setContentSize(slot0.size)
	slot0:setPositionX(4)

	slot0.resources_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_38"), ResourcesType.single, function ()
		uv0.bg_img = createImage(uv0, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_38"), 0, 0, cc.p(0, 0), false)
	end)
	slot0.map_container = ccui.Layout:create()

	slot0.map_container:setContentSize(slot0.size)
	slot0.map_container:setPosition(0, 0)
	slot0:addChild(slot0.map_container, 2)

	slot0.start_pos = cc.p(240, 112)
	slot0.start_pos_img = createImage(slot0.map_container, PathTool.getResFrame("guildvoyage", "guildvoyage_1011"), slot0.start_pos.x, slot0.start_pos.y, cc.p(0.5, 0.5), true)
	slot0.start_port_label = createLabel(22, 1, 2, slot0.start_pos.x, slot0.start_pos.y - 40, TI18N("港口"), slot0.map_container, nil, cc.p(0.5, 0, 5))
	slot0.point = createImage(slot0.map_container, PathTool.getResFrame("guildvoyage", "guildvoyage_1013"), 0, 0, cc.p(0.5, 0.5), true)

	slot0.point:setVisible(false)

	slot1 = createCSBNote(PathTool.getTargetCSB("guildvoyage/guildvoyage_escort_ship"))

	slot1:setVisible(false)
	slot0.map_container:addChild(slot1)

	slot0.ship = slot1:getChildByName("container")
end

function GuildVoyageEscortPanel.registerEvent(slot0, slot1)
	if slot1 == true then
		if slot0.update_voyage_status_event == nil then
			slot0.update_voyage_status_event = GlobalEvent:getInstance():Bind(GuildvoyageEvent.UpdateGuildvoyageOrderStatus, function (slot0, slot1)
				uv0:checkVoyegeStatus(slot0, slot1)
			end)
		end

		if slot0.time_ticket == nil then
			slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0:escortTimeCount()
			end, 1)
		end
	else
		if slot0.update_voyage_status_event then
			GlobalEvent:getInstance():UnBind(slot0.update_voyage_status_event)

			slot0.update_voyage_status_event = nil
		end

		if slot0.time_ticket then
			GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

			slot0.time_ticket = nil
		end
	end
end

function GuildVoyageEscortPanel.escortTimeCount(slot0)
	for slot4, slot5 in pairs(slot0.voyage_line) do
		if slot5.is_pause == false and slot5.order and slot5.ship_node and slot5.order.end_time - uv0:getTime() >= 0 then
			if slot5.ship_node.time then
				slot5.ship_node.time:setString(TimeTool.GetTimeFormat(slot6))
			end

			if slot5.ship_node.cost and slot5.ship_node.total_value ~= uv1:getFinishCost(slot6) then
				slot5.ship_node.total_value = slot7

				slot5.ship_node.cost:setString(slot7)
			end
		end
	end
end

function GuildVoyageEscortPanel.removeOrder(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot1.ship_node then
		slot5 = false
		slot6 = slot1.ship_node

		slot0:handleRewardsBox(slot5, slot6)

		for slot5, slot6 in ipairs(slot1.pos) do
			if not tolua.isnull(slot6.point) then
				slot6.point:removeFromParent()
			end
		end

		if not tolua.isnull(slot1.ship_node.node) then
			slot1.ship_node.node:stopAllActions()
			slot1.ship_node.node:removeFromParent()
		end

		if not tolua.isnull(slot1.ship_node.time_container) then
			slot1.ship_node.time_container:stopAllActions()
			slot1.ship_node.time_container:removeFromParent()
		end

		if not tolua.isnull(slot1.end_point_icon) then
			slot1.end_point_icon:removeFromParent()
		end

		if not tolua.isnull(slot1.name) then
			slot1.name:removeFromParent()
		end
	end
end

function GuildVoyageEscortPanel.checkVoyegeStatus(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	if slot0.voyage_line[slot1] == nil then
		return
	end

	if slot2 == GuildvoyageConst.status.over then
		slot0:removeOrder(slot3)

		slot0.voyage_line[slot1] = nil

		if uv0:escortList() then
			slot0:showStartEffect(#slot4 == 0)
		end
	elseif slot2 == GuildvoyageConst.status.submit then
		if slot3.ship_node and not tolua.isnull(slot3.ship_node.node) then
			slot3.ship_node.node:stopAllActions()
			slot3.ship_node.node:setPosition(slot3.end_point.x, slot3.end_point.y - 14)
			slot3.ship_node.bubble:setContentSize(cc.size(86, 44))
			slot3.ship_node.ship:setVisible(false)
			slot3.ship_node.icon:setVisible(false)
			slot3.ship_node.cost:setVisible(false)
			slot3.ship_node.time:setString(TI18N("可提交"))
			slot0:handleRewardsBox(true, slot3.ship_node)
		end
	elseif slot2 == GuildvoyageConst.status.doing and slot3.ship_node and not tolua.isnull(slot3.ship_node.node) then
		slot3.ship_node.node:stopAllActions()
	end
end

function GuildVoyageEscortPanel.addToParent(slot0, slot1)
	if slot1 == true then
		if #uv0:escortList() == 0 then
			slot0:showStartEffect(true)
		else
			slot6 = false

			slot0:showStartEffect(slot6)

			for slot6, slot7 in ipairs(slot2) do
				delayRun(slot0.map_container, slot6 * 2 / display.DEFAULT_FPS, function ()
					uv0:createVoyageLine(uv1)
				end)
			end
		end

		slot0:createSceneEffect()
	else
		slot0.map_container:stopAllActions()

		for slot5, slot6 in pairs(slot0.voyage_line) do
			if slot6.ship_node and not tolua.isnull(slot6.ship_node.node) then
				slot6.ship_node.node:stopAllActions()
			end

			slot6.is_pause = true
		end
	end

	slot0:setVisible(slot1)
	slot0:registerEvent(slot1)
end

function GuildVoyageEscortPanel.createVoyageLine(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.voyage_line[slot1.order_id] == nil then
		slot0.voyage_line[slot1.order_id] = {}
	end

	if slot0.voyage_line[slot1.order_id] == nil then
		return
	end

	slot2.order = slot1

	if slot2.pos == nil then
		slot0:createVoyageLinePoint(slot2)
	end

	if slot2.ship_node == nil then
		slot0:createVoyageShip(slot2)
	end

	if slot2.ship_node and slot2.end_point and slot3.bubble == nil and not tolua.isnull(slot0.ship) then
		slot4 = slot0.ship:clone()

		slot4:setVisible(true)
		slot4:setAnchorPoint(cc.p(0.5, 1))
		slot4:setPosition(slot2.end_point.x, slot2.end_point.y - 15)
		slot0.map_container:addChild(slot4, slot0.time_zorder)

		slot3.time_container = slot4
		slot3.bubble = slot4:getChildByName("bubble")
		slot3.time = slot4:getChildByName("time")
		slot3.icon = slot4:getChildByName("icon")
		slot3.cost = slot4:getChildByName("cost")

		slot4:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:clickOrderEvent(uv1)
			end
		end)
	end

	slot0:setOrderStatus(slot2)
end

function GuildVoyageEscortPanel.createVoyageLinePoint(slot0, slot1)
	if slot1 == nil or slot1.order == nil then
		return
	end

	if slot1.order.line_id == nil or slot2.config == nil then
		return
	end

	if Config.GuildShippingData.data_pos[slot2.line_id] == nil or slot3.pos == nil or slot3.pos[1] == nil or slot3.pos[2] == nil then
		return
	end

	slot1.pos = {}
	slot8 = slot0.start_pos

	uv0({}, slot8)

	for slot8, slot9 in ipairs(slot3.t_pos) do
		if slot9[1] and slot9[2] then
			uv0(slot4, cc.p(slot9[1], slot9[2]))
		end
	end

	slot5 = slot3.pos[1]
	slot6 = slot3.pos[2]

	uv0(slot4, cc.p(slot5, slot6))

	slot1.end_point_icon = createImage(slot0.map_container, PathTool.getResFrame("guildvoyage", "guildvoyage_1012"), slot5, slot6, cc.p(0.5, 0.5), true, slot0.end_point_zorder)
	slot1.end_point = cc.p(slot5, slot6)

	slot1.end_point_icon:setTouchEnabled(true)
	slot1.end_point_icon:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:clickOrderEvent(uv1)
		end
	end)

	slot1.name = createLabel(22, 1, slot0:getOutlineByQuality(slot2.config.quality), slot5, slot6 + 22, slot2.config.name, slot0.map_container, nil, cc.p(0.5, 0))
	slot7 = slot4[1]
	slot8 = 0

	while slot8 < 1 do
		if slot0.distance <= cc.pGetDistance(slot0:getBezierPos(slot4, slot8), slot7) then
			slot12 = slot0.point:clone()

			slot12:setVisible(true)
			slot12:setPosition(slot9.x, slot9.y)
			slot0.map_container:addChild(slot12, slot0.point_zorder)
			uv0(slot1.pos, {
				point = slot12,
				pos = slot9
			})

			slot7 = slot9
		end

		slot8 = slot8 + 0.001
	end
end

function GuildVoyageEscortPanel.createVoyageShip(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot1.ship_node = {
		node = ccui.Layout:create()
	}

	slot1.ship_node.node:setTouchEnabled(true)
	slot1.ship_node.node:setContentSize(cc.size(80, 80))
	slot1.ship_node.node:setAnchorPoint(cc.p(0.5, 0))
	slot0.map_container:addChild(slot1.ship_node.node, slot0.ship_zorder)

	if slot1.ship_node.ship == nil then
		slot1.ship_node.ship = createEffectSpine(PathTool.getEffectRes(301), cc.p(40, 15), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot1.ship_node.node:addChild(slot1.ship_node.ship)
	end

	slot1.ship_node.node:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:clickOrderEvent(uv1)
		end
	end)
end

function GuildVoyageEscortPanel.clickOrderEvent(slot0, slot1)
	if slot1.order then
		if slot1.order.status == GuildvoyageConst.status.submit then
			uv0:openGuildvoyageChooseConfirmWindow(true, slot1.order)
		elseif slot1.order.status == GuildvoyageConst.status.doing then
			uv0:openGuildvoyageOrderEscortWindow(true, GuildvoyageConst.escort_type.escort, slot1.order.order_id)
		end
	end
end

function GuildVoyageEscortPanel.setOrderStatus(slot0, slot1)
	if slot1 == nil or slot1.order == nil or slot1.order.config == nil then
		return
	end

	if slot1.order.status == GuildvoyageConst.status.submit then
		slot1.ship_node.node:setPosition(slot1.end_point.x, slot1.end_point.y - 14)
		slot1.ship_node.ship:setVisible(false)
		slot0:handleRewardsBox(true, slot1.ship_node)
		slot1.ship_node.bubble:setContentSize(cc.size(86, 44))
		slot1.ship_node.icon:setVisible(false)
		slot1.ship_node.cost:setVisible(false)
		slot1.ship_node.time:setString(TI18N("可提交"))
	else
		slot1.ship_node.ship:setVisible(true)
		slot0:handleRewardsBox(false, slot1.ship_node)
		slot1.ship_node.bubble:setContentSize(cc.size(86, 60))
		slot1.ship_node.icon:setVisible(true)
		slot1.ship_node.cost:setVisible(true)

		if slot2.end_time - GameNet.getInstance():getTime() <= 0 then
			slot3 = 0
		end

		slot1.ship_node.time:setString(TimeTool.GetTimeFormat(slot3))

		slot4 = uv0:getFinishCost(slot3)
		slot1.ship_node.total_value = slot4

		slot1.ship_node.cost:setString(slot4)

		slot5 = slot1.pos

		if slot3 > 0 and slot5 and #slot5 > 0 then
			slot6 = #slot5
			slot7 = slot2.config.time

			if (slot7 - slot3) / slot7 <= 0 then
				slot8 = 0
			end

			if math.floor(slot6 * slot8 + 0.5) == 0 then
				slot9 = 1
			end

			slot1.ship_node.speed = slot2.config.time / slot6

			if slot5[slot9] then
				slot1.ship_node.node:setPosition(slot10.pos.x, slot10.pos.y - 14)

				slot1.ship_node.cur_pos_index = slot9
			end

			slot0:doNextAction(slot1)
		end
	end

	slot1.is_pause = false
end

function GuildVoyageEscortPanel.doNextAction(slot0, slot1)
	if slot1 == nil or slot1.ship_node == nil or tolua.isnull(slot1.ship_node.node) then
		return
	end

	slot3, slot4 = slot1.ship_node.node:getPosition()

	if slot1.ship_node.cur_pos_index < #slot1.pos and slot5[slot2 + 1] and slot7.pos then
		if not tolua.isnull(slot1.ship_node.ship) then
			slot8 = 1

			if slot3 < slot7.pos.x then
				slot8 = -1
			end

			if slot1.ship_node.dir ~= slot8 then
				slot1.ship_node.dir = slot8

				slot1.ship_node.ship:setScaleX(slot8)
			end
		end

		slot1.ship_node.node:runAction(cc.Sequence:create(cc.MoveTo:create(slot1.ship_node.speed, slot7.pos), cc.CallFunc:create(function ()
			uv0.ship_node.cur_pos_index = uv0.ship_node.cur_pos_index + 1

			uv1:doNextAction(uv0)
		end)))
	end
end

function GuildVoyageEscortPanel.handleRewardsBox(slot0, slot1, slot2)
	if slot2 == nil or tolua.isnull(slot2.node) then
		return
	end

	if slot1 == true then
		if slot2.box == nil then
			slot2.box = createEffectSpine(PathTool.getEffectRes(110), cc.p(47, 5), cc.p(0.5, 0), true, PlayerAction.action_2)

			slot2.node:addChild(slot2.box)
		end

		slot2.box:clearTracks()
		slot2.box:setToSetupPose()
		slot2.box:setAnimation(0, PlayerAction.action_2, true)
	elseif not tolua.isnull(slot2.box) then
		slot2.box:clearTracks()
		slot2.box:removeFromParent()

		slot2.box = nil
	end
end

function GuildVoyageEscortPanel.DeleteMe(slot0)
	slot0.map_container:stopAllActions()

	slot4 = false

	slot0:registerEvent(slot4)

	for slot4, slot5 in pairs(slot0.voyage_line) do
		if slot5.ship_node then
			slot9 = false
			slot10 = slot5.ship_node

			slot0:handleRewardsBox(slot9, slot10)

			for slot9, slot10 in ipairs(slot5.pos) do
				if not tolua.isnull(slot10.point) then
					slot10.point:removeFromParent()
				end
			end

			if not tolua.isnull(slot5.ship_node.node) then
				slot5.ship_node.node:stopAllActions()
				slot5.ship_node.node:removeFromParent()
			end
		end
	end

	slot0.voyage_line = nil

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end
end

function GuildVoyageEscortPanel.factorial(slot0, slot1)
	if slot1 == 0 then
		return 1
	else
		return slot1 * slot0:factorial(slot1 - 1)
	end
end

function GuildVoyageEscortPanel.getBezierPos(slot0, slot1, slot2)
	slot3 = DeepCopy(slot1)
	slot4 = #slot3 - 1

	for slot10, slot11 in pairs(slot3) do
		slot5 = 0 + slot11.x * slot0:factorial(slot4) / (slot0:factorial(slot4 - slot10 + 1) * slot0:factorial(slot10 - 1)) * math.pow(1 - slot2, slot4 - slot10 + 1) * math.pow(slot2, slot10 - 1)
		slot6 = 0 + slot11.y * slot0:factorial(slot4) / (slot0:factorial(slot4 - slot10 + 1) * slot0:factorial(slot10 - 1)) * math.pow(1 - slot2, slot4 - slot10 + 1) * math.pow(slot2, slot10 - 1)
	end

	return cc.p(slot5, slot6)
end

function GuildVoyageEscortPanel.getOutlineByQuality(slot0, slot1)
	if slot1 == BackPackConst.quality.green then
		return cc.c4b(11, 77, 157, 255)
	elseif slot1 == BackPackConst.quality.blue then
		return cc.c4b(15, 99, 0, 255)
	elseif slot1 == BackPackConst.quality.purple then
		return cc.c4b(136, 0, 170, 255)
	elseif slot1 == BackPackConst.quality.orange then
		return cc.c4b(214, 84, 0, 255)
	elseif slot1 == BackPackConst.quality.red then
		return cc.c4b(200, 20, 20, 255)
	end
end

function GuildVoyageEscortPanel.createSceneEffect(slot0, slot1)
	if slot1 == false then
		-- Nothing
	elseif slot0.scene_effect == nil then
		slot0.scene_effect = createEffectSpine(PathTool.getEffectRes(300), cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0:addChild(slot0.scene_effect, 1)
	end
end

function GuildVoyageEscortPanel.showStartEffect(slot0, slot1)
	if slot1 == false then
		if slot0.start_effect ~= nil then
			slot0.start_effect:setVisible(false)
		end
	else
		if slot0.start_effect == nil then
			slot0.start_effect = createEffectSpine(PathTool.getEffectRes(302), cc.p(slot0.start_pos.x, slot0.start_pos.y), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0:addChild(slot0.start_effect, 3)
		end

		slot0.start_effect:setVisible(true)
	end
end
