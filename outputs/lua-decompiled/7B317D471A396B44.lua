ActionBallGatheringWindow = ActionBallGatheringWindow or BaseClass(BaseView)

function ActionBallGatheringWindow.__init(slot0)
	slot0.ctrl = ActionController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "action/action_ball_gathering_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("action_gathering", "action_gathering"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "action_gathering_1", true),
			type = ResourcesType.single
		}
	}
end

function ActionBallGatheringWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	loadSpriteTexture(slot0.background, PathTool.getPlistImgForDownLoad("bigbg/action", "action_gathering_1", true), LOADTEXT_TYPE)

	slot5 = "main_panel"
	slot0.main_panel = slot0.root_wnd:getChildByName("main_container"):getChildByName(slot5)
	slot0.pos_list = {}

	for slot5 = 1, 4 do
		slot6 = slot0.main_panel:getChildByName("node" .. slot5)
		slot0.pos_list[slot5] = cc.p(slot6:getPositionX(), slot6:getPositionY())
	end

	slot0.btn_close = slot0.main_panel:getChildByName("close_btn")
	slot0.btn_get = slot0.main_panel:getChildByName("btn_get")

	slot0.btn_get:setTitleText(TI18N(""))

	slot0.btn_goto = slot0.main_panel:getChildByName("btn_goto")

	slot0.btn_goto:setTitleText(TI18N("前往集齐"))
	slot0.btn_get:setVisible(true)
	slot0.btn_goto:setVisible(false)

	slot0.btn_tips = slot0.main_panel:getChildByName("btn_tips")
	slot0.timeLabel = slot0.main_panel:getChildByName("time_label")

	slot0.timeLabel:setString(TI18N("剩余时间:"))

	slot0.leftTime = slot0.main_panel:getChildByName("left_time")
	slot5 = "00:00:00"

	slot0.leftTime:setString(slot5)

	slot0.requireData = Config.HolidaySpecialSummonData.data_const_fun("loss_item").val
	slot0.awardData = Config.HolidaySpecialSummonData.data_const_fun("award_item").val
	slot0.sps = {}

	for slot5 = 1, 4 do
		slot0.sps[slot5] = slot0.main_panel:getChildByName("sp" .. slot5)
	end

	slot0.item_list = {}

	for slot6 = 1, 7 do
		if slot0.requireData[slot6] then
			slot7 = BackPackItem.new(false, true, false, ({
				1,
				1,
				1,
				1
			})[slot6], false, true)

			slot7:setBaseData(slot0.requireData[slot6][1], 0)
			slot7:setIsShowBackground(false)
			slot7:setItemIconUnEnabled(true)

			if slot0.sps[slot6] then
				setChildUnEnabled(true, slot0.sps[slot6])
			end

			slot0.main_panel:addChild(slot7)
			slot7:setPosition(slot0.pos_list[slot6])

			slot0.item_list[slot6] = slot7
		end
	end

	slot0.target_item = BackPackItem.new(false, true, false, 1, false, true)

	slot0.main_panel:addChild(slot0.target_item)
	slot0.target_item:setPosition(cc.p(380, 630))

	if slot0.awardData and slot0.awardData[1] then
		slot0.target_item:setBaseData(slot0.awardData[1][1], slot0.awardData[1][2])
		slot0.target_item:setItemIconUnEnabled(true)
	else
		slot0.target_item:setVisible(false)
	end

	slot0:setData()
end

function ActionBallGatheringWindow.setData(slot0)
	if slot0.ctrl:requestBallGatheringTime() then
		slot0:setLessTime(slot1.remain_sec)
	end

	slot2 = true

	for slot6, slot7 in ipairs(slot0.requireData) do
		if slot0.item_list[slot6] then
			slot8:setItemIconUnEnabled(BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot7[1]) < slot7[2])
			slot8:showItemEffect(slot7[2] <= slot9, 156, PlayerAction.action_1, true)

			if slot0.sps[slot6] then
				setChildUnEnabled(slot9 < slot7[2], slot0.sps[slot6])
			end

			if slot9 < slot7[2] then
				slot2 = false
			end
		end
	end

	if slot2 then
		setChildUnEnabled(false, slot0.btn_get)
	else
		setChildUnEnabled(true, slot0.btn_get, cc.c3b(0, 0, 0))
	end

	slot0.btn_get:setTouchEnabled(slot2)
	slot0.target_item:setItemIconUnEnabled(not slot2)
	slot0.target_item:showItemEffect(slot2, 263, PlayerAction.action_1, true, 1.1)
end

function ActionBallGatheringWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.leftTime) then
		return
	end

	doStopAllActions(slot0.leftTime)

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.leftTime:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.leftTime)
				uv1.leftTime:setString("00:00:00")
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function ActionBallGatheringWindow.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.leftTime:setString(TimeTool.GetTimeForFunction(slot1))
	else
		doStopAllActions(slot0.leftTime)
		slot0.leftTime:setString("00:00:00")
	end
end

function ActionBallGatheringWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0.ctrl:openBallGatheringWin(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_tips, function ()
		if Config.HolidaySpecialSummonData.data_const_fun("tips").desc then
			TipsManager:getInstance():showCommonTips(slot0, uv0.btn_tips:getTouchBeganPosition())
		end
	end, true, 2)
	registerButtonEventListener(slot0.btn_get, function ()
		uv0.ctrl:sender16657()
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
	end, true, 1)

	if not slot0.ball_get_event then
		slot0.ball_get_event = GlobalEvent:getInstance():Bind(ActionEvent.Ball_Gathering_Get_Event, function (slot0)
			if not slot0 then
				return
			end

			if slot0.code == 1 then
				uv0:setData()
				MainuiController:getInstance():openGetItemView(true, {
					is_bind = 1,
					bid = uv0.awardData[1][1],
					num = uv0.awardData[1][2]
				})
			else
				message(slot0.msg)
			end
		end)
	end

	if slot0.gathering_change_event == nil then
		slot0.gathering_change_event = GlobalEvent:getInstance():Bind(ActionEvent.Ball_Gathering_Change_Event, function (slot0)
			if slot0 == BackPackConst.Bag_Code.BACKPACK then
				uv0:setData()
			end
		end)
	end
end

function ActionBallGatheringWindow.close_callback(slot0)
	CommonAlert.closeAllWin()

	if slot0.ball_get_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.ball_get_event)

		slot0.ball_get_event = nil
	end

	if slot0.gathering_change_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.gathering_change_event)

		slot0.gathering_change_event = nil
	end

	slot0.ctrl:openBallGatheringWin(false)
end
