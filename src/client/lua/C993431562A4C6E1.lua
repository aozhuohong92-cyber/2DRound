ArenapeakchampionGuessCountPanel = ArenapeakchampionGuessCountPanel or BaseClass(BaseView)
slot1 = ArenapeakchampionController:getInstance():getModel()
slot2 = string.format

function ArenapeakchampionGuessCountPanel.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "arenapeakchampion/arenapeakchampion_guess_count_panel"
	slot0.res_list = {}
	slot0.cur_set_value = 0
	slot0.guess_coin = 10
	slot0.can_bet = 300
	slot0.guess_max = 300
	slot0.guess_coin_item_id = 33
end

function ArenapeakchampionGuessCountPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("竞猜"))
	slot1:getChildByName("set_title"):setVisible(false)
	slot1:getChildByName("Image_1"):setVisible(false)
	slot1:getChildByName("Image_4"):setVisible(false)
	slot1:getChildByName("can_get_title"):setString(TI18N("猜中可能赢得："))

	if Config.ItemData.data_get_data(slot0.guess_coin_item_id) then
		slot1:getChildByName("Sprite_1"):setVisible(false)
		loadSpriteTexture(slot1:getChildByName("Sprite_2"), PathTool.getItemRes(slot2.icon), LOADTEXT_TYPE)
	end

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.cancel_btn = slot1:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("返回"))

	slot0.confirm_btn = slot1:getChildByName("confirm_btn")

	slot0.confirm_btn:getChildByName("label"):setString(TI18N("确定"))

	slot0.slider = slot1:getChildByName("slider")

	slot0.slider:setBarPercent(9, 91)

	slot0.set_right = slot1:getChildByName("set_right")
	slot0.set_left = slot1:getChildByName("set_left")
	slot0.set_max = slot1:getChildByName("set_max")
	slot0.set_value = slot1:getChildByName("set_value")
	slot0.guess_max_title = slot1:getChildByName("guess_max_title")

	slot0.slider:setVisible(false)
	slot0.set_right:setVisible(false)
	slot0.set_left:setVisible(false)
	slot0.set_max:setVisible(false)
	slot0.set_value:setVisible(false)
	slot0.guess_max_title:setVisible(false)

	slot0.get_value = slot1:getChildByName("get_value")

	slot0.get_value:setString("0")

	slot0.guess_count = slot1:getChildByName("guess_count")

	slot0.guess_count:setString("")

	slot0.guess_title = createRichLabel(26, cc.c4b(100, 50, 35, 255), cc.p(0.5, 0.5), cc.p(312, 306), nil, nil, 1000)

	slot1:addChild(slot0.guess_title)

	slot0.tips = createRichLabel(26, cc.c4b(100, 50, 35, 255), cc.p(0.5, 0.5), cc.p(312, 260), nil, nil, 1000)

	slot1:addChild(slot0.tips)
	slot0.tips:setString(TI18N("(支持后竞猜选择将不可更改)"))
end

function ArenapeakchampionGuessCountPanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.cancel_btn, handler(slot0, slot0.onClickCloseBtn), true, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()

			if uv0.cur_set_value <= 0 then
				message(TI18N("代币不足"))

				return
			end

			if uv0.data then
				uv1:sender27704(uv0.bet_type, uv0.cur_set_value)
			end
		end
	end)
end

function ArenapeakchampionGuessCountPanel.onClickCloseBtn(slot0)
	uv0:openArenapeakchampionGuessCountPanel(false)
end

function ArenapeakchampionGuessCountPanel.setCurGuessValueByPercent(slot0)
	if not slot0.slider then
		return
	end

	slot0:setGuessValue(math.floor(slot0.can_bet * slot0.slider:getPercent() / 100))
end

function ArenapeakchampionGuessCountPanel.setSliderPercent(slot0)
	if slot0.cur_set_value then
		slot0.slider:setPercent(slot0.cur_set_value / slot0.can_bet * 100)
	end
end

function ArenapeakchampionGuessCountPanel.showEditNum(slot0, slot1)
	if slot1 < 0 then
		slot1 = 0
	elseif slot0.can_bet < slot1 then
		slot1 = slot0.can_bet
	end

	slot0:setGuessValue(slot1)
	slot0:setSliderPercent()
end

function ArenapeakchampionGuessCountPanel.setGuessValue(slot0, slot1)
	if slot0.data == nil then
		return
	end

	slot0.cur_set_value = slot1

	slot0.set_value:setString(slot1)
	slot0.get_value:setString(math.floor(slot0.cur_set_value * slot0.guess_times))
	slot0.guess_count:setString(slot1)
	slot0.guess_max_title:setVisible(slot0.guess_max <= slot0.cur_set_value)
end

function ArenapeakchampionGuessCountPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.bet_type = slot2.bet_type or 1
	slot3 = slot2.name or ""

	if not uv0:getMyGuessData() then
		return
	end

	if slot4 then
		slot0.guess_times = (slot2.ratio or 2000) * 0.001
		slot0.data = slot4
		slot0.can_bet = slot4.can_bet
		slot0.cur_set_value = slot4.can_bet

		if Config.ItemData.data_get_data(slot0.guess_coin_item_id) then
			slot0.guess_title:setString(uv1(TI18N("是否花费 <img src='%s' scale=0.3 /> <div fontcolor=#249003>%s</div> 支持玩家 <div fontcolor=#249003>%s</div>?"), PathTool.getItemRes(slot6.icon), slot0.cur_set_value, slot3))
		end

		slot0.get_value:setString(math.floor(slot0.cur_set_value * slot0.guess_times))
	end
end

function ArenapeakchampionGuessCountPanel.close_callback(slot0)
	uv0:openArenapeakchampionGuessCountPanel(false)
end
