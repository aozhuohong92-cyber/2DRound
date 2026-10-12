EscortMainWindow = EscortMainWindow or BaseClass(BaseView)
slot1 = EscortController:getInstance():getModel()
slot2 = table.remove
slot3 = table.insert
slot4 = GameNet:getInstance()
slot5 = RoleController:getInstance():getRoleVo()

function EscortMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.view_tag = ViewMgrTag.EFFECT_TAG
	slot0.win_type = WinType.Full
	slot0.index = 2
	slot0.layout_name = "escort/escort_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_53", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("escort", "escort"),
			type = ResourcesType.plist
		}
	}
	slot0.escort_player_list = {}
	slot0.escort_player_pool = {}
	slot0.render_list = {}
	slot0.step = 1
	slot0.step_interval = 5
	slot0.escort_pos_list = {}
end

function EscortMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_53", true), LOADTEXT_TYPE)
	slot0.background:setPositionY(98 + display.getBottom())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.container = slot1:getChildByName("container")
	slot0.explain_btn = slot1:getChildByName("explain_btn")
	slot0.bottom = slot1:getChildByName("bottom")
	slot0.finish_btn = slot0.bottom:getChildByName("finish_btn")
	slot0.finish_btn_label = slot0.finish_btn:getChildByName("label")
	slot0.finish_btn_tips = slot0.finish_btn:getChildByName("tips")
	slot0.escort_times = slot0.bottom:getChildByName("escort_times")
	slot0.atk_times = slot0.bottom:getChildByName("atk_times")
	slot0.in_escort_time = slot0.bottom:getChildByName("in_escort_time")
	slot0.in_escort_title = slot0.bottom:getChildByName("in_escort_title")

	slot0.in_escort_title:setString(TI18N("护送中:"))
	slot0.bottom:getChildByName("escort_title"):setString(TI18N("雇佣次数:"))
	slot0.bottom:getChildByName("atk_title"):setString(TI18N("掠夺次数:"))
	slot0.bottom:setPositionY(MainuiController:getInstance():getBottomHeight() + display.getBottom())

	slot2 = slot1:getChildByName("title_container")

	slot2:getChildByName("label"):setString(TI18N("萌兽寻宝"))
	slot2:getChildByName("title_bg"):setContentSize(cc.size(SCREEN_WIDTH, 50))

	slot0.close_btn = slot2:getChildByName("close_btn")

	slot0.close_btn:setPositionX(SCREEN_WIDTH)

	slot0.log_btn = slot1:getChildByName("log_btn")

	slot0.log_btn:getChildByName("label"):setString(TI18N("掠夺记录"))

	slot0.log_tips = slot0.log_btn:getChildByName("tips")

	UITool.SetTitleColor(slot0.finish_btn_label)
	UITool.SetTitleColor(slot0.log_btn:getChildByName("label"))

	slot0.container_size = cc.size(SCREEN_WIDTH, slot2:getPositionY() - (slot0.bottom:getPositionY() + slot0.bottom:getContentSize().height) - 224)
	slot0.container_center_y = slot0.container_size.height * 0.5

	slot0.container:setPositionY(slot0.bottom:getPositionY() + slot0.bottom:getContentSize().height)
	slot0.container:setContentSize(slot0.container_size)
end

function EscortMainWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEscortMainWindow(false)
		end
	end)
	slot0.finish_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.my_status == 1 then
				uv1:openEscortEmployWindow(true)
			else
				uv1:openEscortMyInfoWindow(true)
			end
		end
	end)
	slot0.log_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openEscortLogWindow(true)
			uv1:updateEscortRedStatus(RedPointType.escort_plunder, false)
			uv2.log_tips:setVisible(false)
		end
	end)
	slot0.explain_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			MainuiController:getInstance():openCommonExplainView(true, Config.EscortData.data_explain)
		end
	end)

	if slot0.update_base_info_event == nil then
		slot0.update_base_info_event = GlobalEvent:getInstance():Bind(EscortEvent.UpdateEscortBaseEvent, function ()
			uv0:initPlunderList()
		end)
	end

	if slot0.update_my_info_event == nil then
		slot0.update_my_info_event = GlobalEvent:getInstance():Bind(EscortEvent.UpdateEscortMyInfoEvent, function ()
			uv0:updateMyInfo(true)
		end)
	end

	if slot0.update_escort_player_list_event == nil then
		slot0.update_escort_player_list_event = GlobalEvent:getInstance():Bind(EscortEvent.UpdateEscortPlayerList, function (slot0)
			uv0:updateEscortPlayerList(slot0)
		end)
	end

	if slot0.chat_ui_size_change == nil then
		slot0.chat_ui_size_change = GlobalEvent:getInstance():Bind(EventId.CHAT_HEIGHT_CHANGE, function ()
			uv0.bottom:setPositionY(MainuiController:getInstance():getBottomHeight() + display.getBottom())
		end)
	end
end

function EscortMainWindow.openRootWnd(slot0, slot1)
	uv0:requestEscortBaseInfo(rid, srv_id)
	slot0:setWindowData(slot1)
	RenderMgr:getInstance():add(slot0)

	if slot0.time_ticket == nil then
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:timeTicketCount()
		end, 1)
	end

	slot0:updateMyInfo()
end

function EscortMainWindow.setWindowData(slot0, slot1)
	if slot1 == nil or slot1.rid == 0 or slot1.srv_id == "" then
		return
	end

	if slot1.type ~= nil then
		uv0:requestPlunderInfo(slot1.rid, slot1.srv_id, slot1.id, slot1.type)
	else
		uv0:requestCheckEscortPlayer(slot1.rid, slot1.srv_id)
	end
end

function EscortMainWindow.timeTicketCount(slot0)
	slot0.step = slot0.step + 1

	if slot0.step % slot0.step_interval == 0 then
		slot0:createEscortItem()
	end

	slot0:countEndTime()
	slot0:countDownMyInfo()
end

function EscortMainWindow.countEndTime(slot0)
	for slot4, slot5 in pairs(slot0.escort_player_list) do
		slot5:changeTime()
	end
end

function EscortMainWindow.countDownMyInfo(slot0)
	if slot0.my_info and slot0.my_info.status == 1 then
		if slot0.my_info.end_time - uv0:getTime() >= 0 then
			slot0.in_escort_time:setString(TimeTool.GetTimeFormat(slot1))
		elseif slot0.my_status ~= 0 then
			slot0.finish_btn_label:setString(TI18N("夺宝完成"))
			slot0.in_escort_title:setVisible(false)
			slot0.in_escort_time:setVisible(false)

			slot0.my_status = 0
		end
	end
end

function EscortMainWindow.updateMyInfo(slot0, slot1)
	slot2 = uv0:getMyInfo()
	slot0.my_info = slot2
	slot0.my_status = 0

	if slot2 then
		slot0:updateMyBaseCount()

		if slot2.status == 1 then
			if slot2.end_time <= uv1:getTime() then
				slot0.finish_btn_label:setString(TI18N("夺宝完成"))
				slot0.in_escort_title:setVisible(false)
				slot0.in_escort_time:setVisible(false)
			else
				slot0.finish_btn_label:setString(TI18N("立即完成"))
				slot0.in_escort_title:setVisible(true)
				slot0.in_escort_time:setVisible(true)
				slot0:countDownMyInfo()
			end
		else
			slot0.my_status = 1

			slot0.finish_btn_label:setString(TI18N("我要雇佣"))
			slot0.in_escort_title:setVisible(false)
			slot0.in_escort_time:setVisible(false)
		end

		if slot1 == true then
			slot0:checkMyInfoStatus()
		end

		slot4 = uv0:checkRedStatus(RedPointType.escort_awards)
		slot5 = uv0:checkRedStatus(RedPointType.escort_plunder)

		if uv0:checkRedStatus(RedPointType.escort) and slot2.status == 0 then
			slot0.finish_btn_tips:setVisible(true)
		elseif slot4 == true then
			slot0.finish_btn_tips:setVisible(true)
		else
			slot0.finish_btn_tips:setVisible(false)
		end

		slot0.log_tips:setVisible(slot5)
	end
end

function EscortMainWindow.updateMyBaseCount(slot0)
	if slot0.my_info == nil then
		return
	end

	slot1 = slot0.my_info
	slot3 = uv0:getMyMaxCount(EscortConst.times_type.plunder)

	if uv0:getMyMaxCount(EscortConst.times_type.escort) - uv0:getMyCount(EscortConst.times_type.escort) < 0 then
		slot4 = 0
	end

	if slot3 - uv0:getMyCount(EscortConst.times_type.plunder) < 0 then
		slot5 = 0
	end

	if slot5 == 0 then
		slot0.atk_times:setTextColor(cc.c4b(255, 51, 27, 255))
	else
		slot0.atk_times:setTextColor(cc.c4b(20, 255, 50, 255))
	end

	slot0.escort_times:setString(slot4 .. "/" .. slot2)
	slot0.atk_times:setString(slot5 .. "/" .. slot3)
	GlobalEvent:getInstance():Fire(ActivityEvent.EscortCount)
end

function EscortMainWindow.checkMyInfoStatus(slot0)
	if slot0.my_info == nil then
		return
	end

	if slot0.my_info.status == 0 then
		slot0:removeEscortPlayer(uv0.rid, uv0.srv_id)
	elseif slot1.status == 1 then
		slot2 = true

		for slot6, slot7 in ipairs(slot0.render_list) do
			if getNorKey(uv0.rid, uv0.srv_id) == getNorKey(slot7.rid, slot7.srv_id) then
				slot2 = false

				break
			end
		end

		if slot2 == true and slot0.escort_player_list[getNorKey(uv0.rid, uv0.srv_id)] ~= nil then
			slot2 = false
		end

		if slot2 == true then
			slot0:insertMyInfoToList()
		end
	end
end

function EscortMainWindow.createEscortItem(slot0, slot1)
	if next(slot0.render_list) == nil then
		return
	end

	slot2 = uv0(slot0.render_list, 1)
	slot3 = nil
	slot3 = (#slot0.escort_player_pool <= 0 or uv0(slot0.escort_player_pool, 1)) and EscortPlayer.New(slot0.container)
	slot4 = 0
	slot5 = 0

	if slot0.index == 1 then
		slot5 = math.random(0, 25)
	elseif slot0.index == 2 then
		slot5 = math.random(slot0.container_center_y - 50, slot0.container_center_y + 50)
	elseif slot0.index == 3 then
		slot5 = math.random(slot0.container_size.height - 100, slot0.container_size.height)
	end

	slot3:handlePlayerStatus(true)
	slot3:setData(slot2)
	slot3:setWorldPos((slot1 ~= true or math.random(100, slot0.container_size.width * 0.5)) and math.random(-100, 0), slot5)

	slot0.escort_player_list[getNorKey(slot2.rid, slot2.srv_id)] = slot3
	slot0.index = slot0.index + 1

	if slot0.index > 3 then
		slot0.index = 1
	end
end

function EscortMainWindow.update(slot0)
	for slot4, slot5 in pairs(slot0.escort_player_list) do
		slot5:move()

		if slot5:getPositionX() > SCREEN_WIDTH + 100 and slot5.data then
			slot0:removeEscortPlayer(slot5.data.rid, slot5.data.srv_id, true)
		end
	end
end

function EscortMainWindow.removeEscortPlayer(slot0, slot1, slot2, slot3)
	if slot0.escort_player_list[getNorKey(slot1, slot2)] then
		slot4:handlePlayerStatus(false)
		uv0(slot0.escort_player_pool, slot4)

		slot0.escort_player_list[getNorKey(slot1, slot2)] = nil

		if slot3 == true then
			uv0(slot0.render_list, slot4.data)
		end
	end

	if not slot3 then
		for slot8, slot9 in ipairs(slot0.render_list) do
			if getNorKey(slot1, slot2) == getNorKey(slot9.rid, slot9.srv_id) then
				uv1(slot0.render_list, slot8)

				break
			end
		end
	end
end

function EscortMainWindow.updateEscortPlayerList(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot1.rid ~= 0 and slot1.srv_id ~= "" then
		slot0:removeEscortPlayer(slot1.rid, slot1.srv_id)
	end

	if slot1.plunders and next(slot1.plunders) then
		for slot5, slot6 in ipairs(slot1.plunders) do
			uv0(slot0.render_list, slot6)
		end
	end
end

function EscortMainWindow.initPlunderList(slot0)
	if uv0:getPlunderList() and next(slot1) then
		slot0.render_list = slot1
	end

	slot0:insertMyInfoToList()

	for slot5 = 1, 3 do
		slot0:createEscortItem(true)
	end
end

function EscortMainWindow.insertMyInfoToList(slot0)
	if slot0.my_info and slot0.my_info.status == 1 then
		uv1(slot0.render_list, 1, {
			rid = uv0.rid,
			srv_id = uv0.srv_id,
			name = uv0.name,
			quality = slot0.my_info.quality or 0,
			end_time = slot0.my_info.end_time or 0,
			gid = uv0.gid,
			gsrv_id = uv0.gsrv_id
		})
	end
end

function EscortMainWindow.addEscortList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot5, slot6 in ipairs(slot1) do
		uv0(slot0.render_list, 1, slot6)
	end
end

function EscortMainWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.escort_player_list) do
		slot5:DeleteMe()
	end

	slot0.escort_player_list = nil

	for slot4, slot5 in pairs(slot0.escort_player_pool) do
		slot5:DeleteMe()
	end

	slot0.escort_player_pool = nil

	RenderMgr:getInstance():remove(slot0)

	if slot0.time_ticket then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end

	if slot0.update_base_info_event then
		GlobalEvent:getInstance():UnBind(slot0.update_base_info_event)

		slot0.update_base_info_event = nil
	end

	if slot0.update_my_info_event then
		GlobalEvent:getInstance():UnBind(slot0.update_my_info_event)

		slot0.update_my_info_event = nil
	end

	if slot0.update_escort_player_list_event then
		GlobalEvent:getInstance():UnBind(slot0.update_escort_player_list_event)

		slot0.update_escort_player_list_event = nil
	end

	if slot0.chat_ui_size_change then
		GlobalEvent:getInstance():UnBind(slot0.chat_ui_size_change)

		slot0.chat_ui_size_change = nil
	end

	if slot0.add_escort_player_event then
		GlobalEvent:getInstance():UnBind(slot0.add_escort_player_event)

		slot0.add_escort_player_event = nil
	end

	uv0:openEscortMainWindow(false)
end

EscortPlayer = EscortPlayer or BaseClass()

function EscortPlayer.__init(slot0, slot1)
	slot0.parent = slot1
	slot0.is_self = false
	slot0._x = 0

	slot0:createRoorWnd()
	slot0:registerEvent()
end

function EscortPlayer.createRoorWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("escort/escort_play"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0))

	slot0.model = slot0.root_wnd:getChildByName("model")
	slot0.name_bg = slot0.root_wnd:getChildByName("name_bg")
	slot0.time_bg = slot0.root_wnd:getChildByName("time_bg")
	slot0.my_icon = slot0.root_wnd:getChildByName("my_icon")
	slot0.role_name = slot0.root_wnd:getChildByName("role_name")
	slot0.time_label = slot0.root_wnd:getChildByName("time_label")
	slot0.touch = slot0.root_wnd:getChildByName("touch")
	slot0.be_plunder = slot0.root_wnd:getChildByName("be_plunder")
end

function EscortPlayer.registerEvent(slot0)
	slot0.touch:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				if uv0.is_self then
					uv1:openEscortMyInfoWindow(true)
				else
					uv1:requestCheckEscortPlayer(uv0.data.rid, uv0.data.srv_id)
				end
			end
		end
	end)
end

function EscortPlayer.setWorldPos(slot0, slot1, slot2)
	slot0._x = slot1

	slot0.root_wnd:setPosition(slot1, slot2)
	slot0.root_wnd:setLocalZOrder(1280 - slot2)
end

function EscortPlayer.move(slot0)
	slot0._x = slot0._x + 0.5

	slot0.root_wnd:setPositionX(slot0._x)
end

function EscortPlayer.getPositionX(slot0)
	return slot0._x
end

function EscortPlayer.handlePlayerStatus(slot0, slot1)
	slot0.root_wnd:setVisible(slot1)
end

function EscortPlayer.changeTime(slot0)
	if not slot0.is_self then
		return
	end

	if slot0.data or slot0.data.end_time then
		if slot0.data.end_time - uv0:getTime() < 0 then
			slot1 = 0
		end

		slot0.time_label:setString(TimeTool.GetTimeFormat(slot1))
	end
end

function EscortPlayer.setData(slot0, slot1)
	slot0.data = slot1
	slot0.is_self = false

	if slot1 then
		slot0.is_self = getNorKey(slot1.rid, slot1.srv_id) == getNorKey(uv0.rid, uv0.srv_id)

		slot0.role_name:setString(slot1.name)
		slot0.my_icon:setVisible(slot0.is_self)
		slot0:createModel(slot1.quality)

		if slot0.is_self then
			slot0:changeTime()
		else
			slot2 = TI18N("暂无公会")

			if slot1.gname ~= "" then
				slot2 = slot1.gname
			end

			slot0.time_label:setString(transformNameByServ(slot2, slot1.srv_id))
		end

		slot2 = getNorKey(slot1.gid, slot1.gsrv_id) == getNorKey(uv0.gid, uv0.gsrv_id)

		if slot0.is_self then
			slot0.role_name:setTextColor(cc.c4b(104, 69, 42, 255))
		elseif slot2 == true and slot1.gid ~= 0 then
			slot0.role_name:setTextColor(cc.c4b(104, 69, 42, 255))
		else
			slot0.role_name:setTextColor(cc.c4b(210, 50, 50, 255))
		end

		slot3 = false

		if slot1.plunder_lists and next(slot1.plunder_lists) then
			for slot7, slot8 in ipairs(slot1.plunder_lists) do
				if getNorKey(uv0.rid, uv0.srv_id) == getNorKey(slot8.rid, slot8.srv_id) then
					slot3 = true
				end
			end
		end

		slot0.be_plunder:setVisible(slot3)
	end
end

function EscortPlayer.createModel(slot0, slot1)
	if slot0.quality == slot1 then
		return
	end

	slot0.quality = slot1

	if slot0.body then
		slot0.body:removeFromParent()

		slot0.body = nil
	end

	if Config.EscortData.data_baseinfo[slot1] then
		slot0.body = createEffectSpine(slot2.res, cc.p(88, 0), cc.p(0.5, 0), true, PlayerAction.action)

		slot0.model:addChild(slot0.body)
	end
end

function EscortPlayer.__delete(slot0)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:removeFromParent()
	end
end
