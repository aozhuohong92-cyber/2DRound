ActionWarriorWorld = ActionWarriorWorld or BaseClass(BaseView)

function ActionWarriorWorld.__init(slot0)
	slot0.ctrl = ActionController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.layout_name = "action/action_warrior_world"
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.res_list = {}
end

function ActionWarriorWorld.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.world_map = slot0.root_wnd:getChildByName("world_map")
	slot0.world_map_size = slot0.world_map:getContentSize()

	slot0.world_map:setTouchEnabled(true)

	WarriorTool.Map = slot0.world_map
	slot0.residuenum = slot0.main_container:getChildByName("residuenum")

	slot0.residuenum:setString("剩余怪物数量：10")

	slot0.btn_rule = slot0.main_container:getChildByName("btn_rule")

	slot0.btn_rule:getChildByName("lab"):setString("规则说明")

	slot0.btn_music = slot0.main_container:getChildByName("btn_music")

	slot0.btn_music:getChildByName("lab"):setString("音乐/开")

	slot0.btn_close = slot0.main_container:getChildByName("btn_close")

	slot0.btn_close:getChildByName("lab"):setString("退出")

	slot0.btn_reset = slot0.main_container:getChildByName("btn_reset")

	slot0.btn_reset:getChildByName("lab"):setString("重置")
	slot0:adaptationScreen()
	WarriorTool:intBtnMusic(slot0.btn_music)
	slot0:createMap()
	slot0:initGame()
	slot0:loadLevel()
end

function ActionWarriorWorld.loadLevel(slot0)
	if Action_Warrior_Event.data_mapinformation["d" .. WarriorTool.Cur_Level].data then
		for slot5, slot6 in pairs(slot1) do
			slot0:createBox(slot5, slot6)
		end
	end
end

function ActionWarriorWorld.createBox(slot0, slot1, slot2)
	for slot6 = 1, 4 do
		if slot2["f" .. slot6].type > 0 then
			slot7 = false

			if slot6 == 3 then
				if slot2.f4.type == 0 then
					slot7 = true
				else
					slot7 = false
				end
			elseif slot6 == 4 then
				slot7 = true
			end

			slot8 = ActionWarriorElement.new(slot1, "f" .. slot6, slot2["f" .. slot6], slot7)

			slot0.world_map:addChild(slot8)
			table.insert(slot0.box_list, slot8)
		end
	end

	WarriorTool.Box_Arr = slot0.box_list
end

function ActionWarriorWorld.initGame(slot0)
	slot0.player_fight = 2
	slot0.other_fight = 2
	slot0.furthest_line = 0
	slot0.enemyNum = Action_Warrior_Event.data_mapinformation["d" .. WarriorTool.Cur_Level].enemyNum
	slot0.box_list = {}

	slot0.residuenum:setString("剩余怪物数量：" .. slot0.enemyNum)
	slot0:UpdateItem()
end

function ActionWarriorWorld.updataEnemyNum(slot0)
	slot0.enemyNum = slot0.enemyNum - 1

	slot0.residuenum:setString("剩余怪物数量：" .. slot0.enemyNum)
end

function ActionWarriorWorld.createMap(slot0)
	slot1 = 0
	slot2 = 0
	slot3 = 0
	slot4 = 0

	if WarriorTool.MaxWidth > 2550 then
		WarriorTool.MaxWidth = slot0.world_map_size.width - slot0.screenWidth
	end

	slot0.world_map:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0 = slot0:getTouchBeganPosition().x or 0
		elseif slot1 == ccui.TouchEventType.moved then
			uv1 = slot0:getTouchMovePosition().x or 0
			uv2 = uv1 - uv0
			uv0 = uv1

			uv3:moveMap(uv2)
		elseif slot1 == ccui.TouchEventType.ended then
			uv1 = 0
			uv0 = 0
			uv2 = 0
			uv4 = 0
		end
	end)
end

function ActionWarriorWorld.moveMap(slot0, slot1)
	if slot1 > 0 then
		if slot0.world_map:getPositionX() + slot1 > 0 then
			slot0.world_map:setPositionX(0)

			return
		end
	elseif math.abs(slot2 + slot1) > WarriorTool.MaxWidth - slot0.screenWidth then
		slot0.world_map:setPositionX(-(WarriorTool.MaxWidth - slot0.screenWidth))

		return
	end

	slot0.world_map:setPositionX(slot2 + slot1)
end

function ActionWarriorWorld.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.main_container)
	slot2 = display.getBottom(slot0.main_container)
	slot3 = display.getLeft(slot0.main_container)
	slot4 = display.getRight(slot0.main_container)

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.screenWidth = slot4 - slot3
	slot0.screenHeight = slot1 - slot2
	WarriorTool.screenWidth = slot0.screenWidth

	slot0.world_map:setPosition(cc.p(slot3, slot2))

	slot0.water_bg = slot0.world_map:getChildByName("water_bg")

	slot0.water_bg:setScale(display.getMaxScale())
	slot0.btn_close:setPositionY(slot1 + slot0.btn_close:getPositionY() - slot0.main_container:getContentSize().height)
	slot0.btn_close:setPositionX(slot0.btn_close:getPositionX() + slot4 - slot0.main_container:getContentSize().width)
	slot0.btn_rule:setPositionY(slot1 + slot0.btn_rule:getPositionY() - slot0.main_container:getContentSize().height)
	slot0.btn_rule:setPositionX(slot0.btn_rule:getPositionX() + slot4 - slot0.main_container:getContentSize().width)

	slot0.residuebg = slot0.main_container:getChildByName("residuebg")
	slot0.residuenum = slot0.main_container:getChildByName("residuenum")

	slot0.residuebg:setPositionX(slot3 + slot0.residuebg:getPositionX())
	slot0.residuenum:setPositionX(slot3 + slot0.residuenum:getPositionX())
	slot0.residuebg:setPositionY(slot1 + slot0.residuebg:getPositionY() - slot0.main_container:getContentSize().height)
	slot0.residuenum:setPositionY(slot1 + slot0.residuenum:getPositionY() - slot0.main_container:getContentSize().height)
end

function ActionWarriorWorld.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0.ctrl:openActionWarriorWorld(false)
		uv0:openLevelMain(true)
	end, true, 2)
	registerButtonEventListener(slot0.btn_music, function ()
		WarriorTool:setMusic(uv0.btn_music)
	end, true, 2)
	registerButtonEventListener(slot0.btn_rule, function ()
		MainuiController:getInstance():openCommonExplainView(true, Config.ActionWarrior.data_explain)
	end, true, 2)
	registerButtonEventListener(slot0.btn_reset, function ()
		print("暂未实现")
	end, true, 2)
end

function ActionWarriorWorld.UpdateItem(slot0)
	if WarriorTool.Cur_Level < WarriorTool.Max_Level then
		return
	end

	idx = tonumber(WarriorTool.Cur_Level)
	itemdata = Config.ActionWarrior.data_warrior_show_reward[idx]

	if not slot0.item then
		slot0.item = BackPackItem.new(true, true, nil, , , true)

		slot0.item:setBaseData(itemdata.award[1][1], itemdata.award[1][2])
		slot0.item:setPosition(cc.p(60, 1070))
		slot0.item:setScale(0.7)
		slot0:addChild(slot0.item)
		slot0.item:setGoodsName("首通奖励", cc.p(59, -40), 26, cc.c3b(255, 255, 255), cc.c3b(0, 0, 0))
	else
		slot0.item:setBaseData(itemdata.award[1][1], itemdata.award[1][2])
	end
end

function ActionWarriorWorld.openGameOver(slot0, slot1)
	slot2 = "E70021"

	if not slot1 then
		slot2 = "E70022"
	end

	slot0.gameOverPanel = ccui.Layout:create()

	slot0.gameOverPanel:setContentSize(slot0.screenWidth, slot0.screenHeight)
	slot0.gameOverPanel:setAnchorPoint(cc.p(0, 0))
	slot0.gameOverPanel:setPosition(cc.p(display.getLeft(slot0.main_container), display.getBottom(slot0.main_container)))
	slot0.gameOverPanel:setTouchEnabled(true)
	slot0.gameOverPanel:setBackGroundColorType(ccui.LayoutBackGroundColorType.solid)
	slot0.gameOverPanel:setBackGroundColor(cc.c3b(0, 0, 0))
	slot0.gameOverPanel:setBackGroundColorOpacity(180)
	slot0.root_wnd:addChild(slot0.gameOverPanel)

	slot0.action_bg = createEffectSpine(slot2, cc.p(slot0.screenWidth * 0.5, slot0.screenHeight * 0.5), cc.p(0.5, 0.5), false, "action1", function ()
		uv0.action_bg:setAnimation(0, "action2", true)
	end)

	slot0.root_wnd:addChild(slot0.action_bg)

	if slot0.gameOverPanel ~= nil then
		slot0.gameOverPanel:setScale(display.getMaxScale())
	end

	if slot1 then
		slot0:createWinUI()
	else
		slot0:createFailUI()
	end

	slot0:UpdateItem()
end

function ActionWarriorWorld.postData(slot0)
	slot3 = cc.XMLHttpRequest:new()

	slot3:setRequestHeader("Content-Type", "application/json")

	slot3.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON

	slot3:open("POST", string.format("%s/gameRecord/pushGameRecord", MINI_GAME_URL))
	slot3:registerScriptHandler(function ()
		if uv0.readyState == 4 and uv0.status >= 200 and uv0.status < 207 and json.decode(uv0.response) then
			if slot0.code == 200 then
				slot1 = slot0.map
			else
				message(slot0.msg)
			end
		end
	end)
	slot3:send(json.encode({
		id = tonumber(WarriorTool.id),
		credit = tonumber(0),
		level = tonumber(WarriorTool.Max_Level - 1),
		token = tostring(WarriorTool.token)
	}))
end

function ActionWarriorWorld.createWinUI(slot0)
	if WarriorTool.Max_Level < WarriorTool.Cur_Level + 1 and WarriorTool.Cur_Level <= WarriorTool.All_Level then
		WarriorTool.Max_Level = WarriorTool.Cur_Level + 1

		slot0:postData()
	end

	for slot4 = 1, 3 do
		createImage(slot0.action_bg, PathTool.getResFrame("action_warrior", "warrior_7"), -150 + (slot4 - 1) * 150, -150, cc.p(0.5, 0), true, 3, false):setScale(1.2)

		if slot4 == 2 then
			slot5:setPositionY(-180)
		end
	end

	slot0.btn_Win_reopen = createButton(slot0.action_bg, "", -175, -280, cc.size(106, 106), PathTool.getResFrame("action_warrior", "warrior_3"), 24, nil, , , 1)

	slot0.btn_Win_reopen:setScale(1.2)
	slot0.btn_Win_reopen:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:openLevel()
		end
	end)

	slot0.btn_Win_goLast = createButton(slot0.action_bg, "", 0, -280, cc.size(106, 106), PathTool.getResFrame("action_warrior", "warrior_2"), 24, nil, , , 1)

	slot0.btn_Win_goLast:setScale(1.2)
	slot0.btn_Win_goLast:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.ctrl:openActionWarriorWorld(false)
			uv0:openLevelMain(true)
		end
	end)

	slot0.btn_Win_goNext = createButton(slot0.action_bg, "", 175, -280, cc.size(106, 106), PathTool.getResFrame("action_warrior", "warrior_1"), 24, nil, , , 1)

	slot0.btn_Win_goNext:setScale(1.2)
	slot0.btn_Win_goNext:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			WarriorTool.Cur_Level = WarriorTool.Cur_Level + 1

			uv0:openLevel()
		end
	end)

	if WarriorTool.Cur_Level == WarriorTool.All_Level then
		slot0.btn_Win_goNext:setVisible(false)
		slot0.btn_Win_reopen:setPositionX(-120)
		slot0.btn_Win_goLast:setPositionX(120)
	end
end

function ActionWarriorWorld.createFailUI(slot0)
	slot0.btn_fail_reopen = createButton(slot0.action_bg, "", -75, -100, cc.size(106, 106), PathTool.getResFrame("action_warrior", "warrior_3"), 24, nil, , , 1)

	slot0.btn_fail_reopen:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:openLevel()
		end
	end)

	slot0.btn_fail_goLast = createButton(slot0.action_bg, "", 75, -100, cc.size(106, 106), PathTool.getResFrame("action_warrior", "warrior_2"), 24, nil, , , 1)

	slot0.btn_fail_goLast:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.ctrl:openActionWarriorWorld(false)
			uv0:openLevelMain(true)
		end
	end)
end

function ActionWarriorWorld.openLevelMain(slot0, slot1)
	if WarriorTool.seasonEndTime < os.time() then
		slot4, slot5 = unpack(Split(RoleController:getInstance():getRoleVo().srv_id, "_"))

		if LoginPlatForm:getInstance():getAccount() == "" then
			slot3 = "123456"
		end

		slot6 = string.format("%s/gameRecord/getGameRecord?", MINI_GAME_URL) .. string.format("account=%s&roleId=%s&serverId=%s&gameId=%s&userName=%s&faceId=%s", slot3, slot2.rid, slot5, tonumber("890" .. tostring(MINI_GAME_WARRIOR_CHANNEL)), encodeURI(slot2.name), slot2.face_id)

		print(slot6)

		slot8 = cc.XMLHttpRequest:new()
		slot8.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON

		slot8:open("GET", slot6)
		slot8:registerScriptHandler(function ()
			if uv0.readyState == 4 and uv0.status == 200 and json.decode(uv0.response) then
				if slot0.code == 200 then
					GlobalEvent:getInstance():Fire(ActionEvent.ACTION_WARRIOR_EVENT, slot0.map)
					ActionController:getInstance():openActionWarriorLevel(uv1)
				else
					message(slot0.msg)
				end
			end
		end)
		slot8:send()

		return
	end

	ActionController:getInstance():openActionWarriorLevel(slot1)
end

function ActionWarriorWorld.openLevel(slot0)
	WarriorTool.MaxWidth = 525

	WarriorTool.Player:removeFromParent()

	WarriorTool.Player = nil

	if slot0.box_list then
		for slot4, slot5 in pairs(slot0.box_list) do
			slot5:removeAllChildren()
			slot5:removeFromParent()

			slot5 = nil
		end

		slot0.box_list = nil
		slot0.box_list = {}
		WarriorTool.Box_Arr = nil
		WarriorTool.Box_Arr = {}
	end

	if slot0.item then
		slot0.item:DeleteMe()

		slot0.item = nil
	end

	slot0:createMap()
	slot0:initGame()
	slot0:loadLevel()
	slot0.gameOverPanel:removeAllChildren()
	slot0.gameOverPanel:removeFromParent()
	slot0.action_bg:removeAllChildren()
	slot0.action_bg:removeFromParent()
end

function ActionWarriorWorld.close_callback(slot0)
	if slot0.box_list then
		for slot4, slot5 in pairs(slot0.box_list) do
			slot5:removeAllChildren()
			slot5:removeFromParent()

			slot5 = nil
		end

		slot0.box_list = nil
		slot0.box_list = {}
		WarriorTool.Box_Arr = nil
		WarriorTool.Box_Arr = {}
	end

	slot0.ctrl:openActionWarriorWorld(false)
end
