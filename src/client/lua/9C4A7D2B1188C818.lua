ArenaChampionGuessWindow = ArenaChampionGuessWindow or BaseClass(BaseView)

function ArenaChampionGuessWindow.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "arena/arena_champion_guess_window"
	slot0.cur_set_value = 0
	slot0.guess_coin = 10
	slot0.can_bet = 300
	slot0.guess_max = 300
	slot0.res_list = {}
	slot0.view_type = slot1 or ArenaConst.champion_type.normal

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.ctrl = ArenaController:getInstance()
	else
		slot0.ctrl = CrosschampionController:getInstance()
	end
end

function ArenaChampionGuessWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("竞猜"))
	slot1:getChildByName("set_title"):setString(TI18N("竞猜数量"))
	slot1:getChildByName("can_guess_title"):setString(TI18N("可竞猜"))
	slot1:getChildByName("can_get_title"):setString(TI18N("可获得"))
	slot1:getChildByName("guess_title"):setString(TI18N("投入竞猜币数量"))

	if slot0.view_type == ArenaConst.champion_type.cross and Config.ItemData.data_get_data(33) then
		loadSpriteTexture(slot1:getChildByName("Sprite_1"), PathTool.getItemRes(Config.ItemData.data_get_data(33).icon), LOADTEXT_TYPE)
		loadSpriteTexture(slot1:getChildByName("Sprite_2"), PathTool.getItemRes(Config.ItemData.data_get_data(33).icon), LOADTEXT_TYPE)
	end

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.cancel_btn = slot1:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("返回"))

	slot0.confirm_btn = slot1:getChildByName("confirm_btn")

	slot0.confirm_btn:getChildByName("label"):setString(TI18N("确定"))

	slot0.slider = slot1:getChildByName("slider")

	slot0.slider:setBarPercent(10, 89)

	slot0.set_right = slot1:getChildByName("set_right")
	slot0.set_left = slot1:getChildByName("set_left")
	slot0.set_max = slot1:getChildByName("set_max")
	slot0.set_value = slot1:getChildByName("set_value")
	slot0.guess_max_title = slot1:getChildByName("guess_max_title")
	slot0.guess_value = slot1:getChildByName("guess_value")
	slot0.get_value = slot1:getChildByName("get_value")
	slot0.guess_role = slot1:getChildByName("guess_role")
	slot0.edit_content = createEditBox(slot1, PathTool.getResFrame("common", "common_99998"), cc.size(130, 41), Config.ColorData.data_color4[175], 26, Config.ColorData.data_color4[175], 26, "", nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.edit_content:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.edit_content:setPosition(cc.p(270, 242))

	slot2 = false

	slot0.edit_content:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0 then
				uv0 = false

				uv1.set_value:setVisible(true)
				slot1:setText("")

				if slot1:getText() ~= "" and slot2 ~= uv1.input_text then
					if tonumber(slot2) ~= nil and slot3 >= 0 then
						uv1:showEditNum(slot3)
					else
						uv1:showEditNum(uv1.cur_set_value)
						message(TI18N("请输入数字"))
					end
				else
					uv1:showEditNum(uv1.cur_set_value)
				end
			end
		elseif slot0 == "began" then
			if not uv0 then
				uv1.set_value:setVisible(false)

				uv0 = true
			end
		elseif slot0 == "changed" then
			-- Nothing
		end
	end)
end

function ArenaChampionGuessWindow.register_event(slot0)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			ArenaController:getInstance():openArenaChampionGuessWindow(false)
		end
	end)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()

			if uv0.data then
				if uv0.view_type == ArenaConst.champion_type.normal then
					uv0.ctrl:requestBetTheMatch(uv0.data.bet_type, uv0.cur_set_value)
				else
					uv0.ctrl:sender26204(uv0.data.bet_type, uv0.cur_set_value)
				end
			end
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			ArenaController:getInstance():openArenaChampionGuessWindow(false)
		end
	end)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			ArenaController:getInstance():openArenaChampionGuessWindow(false)
		end
	end)
	slot0.set_left:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				if uv0.cur_set_value - uv0.guess_coin < 0 then
					slot2 = 0
				end

				uv0:setGuessValue(slot2)
				uv0:setSliderPercent()
			end
		end
	end)
	slot0.set_right:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				if uv0.can_bet < uv0.cur_set_value + uv0.guess_coin then
					slot2 = uv0.can_bet
				end

				uv0:setGuessValue(slot2)
				uv0:setSliderPercent()
			end
		end
	end)
	slot0.set_max:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				uv0:setGuessValue(uv0.can_bet)
				uv0:setSliderPercent()
			end
		end
	end)

	if slot0.slider ~= nil then
		slot0.slider:addEventListener(function (slot0, slot1)
			if slot1 == ccui.SliderEventType.percentChanged then
				uv0:setCurGuessValueByPercent()
			end
		end)
	end
end

function ArenaChampionGuessWindow.setCurGuessValueByPercent(slot0)
	if not slot0.slider then
		return
	end

	slot0:setGuessValue(math.floor(slot0.can_bet * slot0.slider:getPercent() / 100))
end

function ArenaChampionGuessWindow.setSliderPercent(slot0)
	if slot0.cur_set_value then
		slot0.slider:setPercent(slot0.cur_set_value / slot0.can_bet * 100)
	end
end

function ArenaChampionGuessWindow.showEditNum(slot0, slot1)
	if slot1 < 0 then
		slot1 = 0
	elseif slot0.can_bet < slot1 then
		slot1 = slot0.can_bet
	end

	slot0:setGuessValue(slot1)
	slot0:setSliderPercent()
end

function ArenaChampionGuessWindow.setGuessValue(slot0, slot1)
	if slot0.data == nil then
		return
	end

	slot0.cur_set_value = slot1

	slot0.set_value:setString(slot1)
	slot0.get_value:setString(math.floor(slot0.cur_set_value * slot0.guess_times))
	slot0.guess_max_title:setVisible(slot0.guess_max <= slot0.cur_set_value)
end

function ArenaChampionGuessWindow.openRootWnd(slot0, slot1)
	if slot0.view_type == ArenaConst.champion_type.normal then
		if Config.ArenaChampionData.data_const.guess_limit then
			slot0.guess_max = slot2.val
		end

		if Config.ArenaChampionData.data_const.guess_coin then
			slot0.guess_coin = slot3.val
		end
	else
		if Config.ArenaClusterChampionData.data_const.guess_limit then
			slot0.guess_max = slot2.val
		end

		if Config.ArenaClusterChampionData.data_const.guess_coin then
			slot0.guess_coin = slot3.val
		end
	end

	if slot1 then
		slot0.guess_times = (slot1.bet_ratio or 2000) * 0.001
		slot0.data = slot1

		slot0.guess_value:setString(slot1.can_bet)
		slot0.guess_role:setString(slot1.name)

		slot0.can_bet = slot1.can_bet

		if slot0.guess_max <= slot1.can_bet then
			slot0.can_bet = slot0.guess_max
		end

		if slot0.can_bet < slot0.guess_coin then
			slot0.cur_set_value = 0

			slot0.set_value:setString(0)
			slot0.set_left:setTouchEnabled(false)
			slot0.set_right:setTouchEnabled(false)
			slot0.set_max:setTouchEnabled(false)
		else
			slot0:setGuessValue(slot0.guess_coin)
		end

		slot0:setSliderPercent()
	end
end

function ArenaChampionGuessWindow.close_callback(slot0)
	ArenaController:getInstance():openArenaChampionGuessWindow(false)
end
