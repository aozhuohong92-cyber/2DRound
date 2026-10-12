GameNet = GameNet or BaseClass()

function GameNet.__init(slot0)
	if GameNet.Instance ~= nil then
		error("[GameNet] accempt to create singleton twice!")

		return
	end

	GameNet.Instance = slot0
	slot0.net_manager = cc.SmartSocket:getInstance()

	slot0.net_manager:Start()

	slot0.proto_mgr = ProtoMgr:getInstance()
	slot0.timer = GlobalTimeTicket:getInstance()
	slot0.is_server_disconnet = false
	slot0.is_server_info_set = false
	slot0.is_server_connected = false
	slot0.is_client_disconnet = false
	slot0.tryconnect_num = 0
	slot0.game_net_id = -1
	slot0.timeout = 3000
	slot0.time_diff = 0
	slot0.msg_list = List.New()
	slot0.check_time = 0
	slot0.re_connest_time = 0

	slot0:initSchedule()
	slot0:registerProtocals()

	slot0.send_cmd_idx = 0
	slot0.local_srv_diff_time = 0
end

function GameNet.getInstance(slot0)
	if GameNet.Instance == nil then
		GameNet.New()
	end

	return GameNet.Instance
end

function GameNet.initSchedule(slot0)
	slot0.schedule_id = slot0.timer:add(function ()
		if cc.Director:getInstance():getDeltaTime() == 0 then
			return
		end

		uv0.net_manager:Update()

		if not uv0.is_server_connected then
			return
		end

		uv0.last_heartbeat_time = uv0.last_heartbeat_time + 1

		if uv0.last_heartbeat_time >= 600 then
			uv0:request1199()

			uv0.last_heartbeat_time = 0
		end

		for slot3 = 1, 5 do
			if not uv0:doOneMsg() then
				break
			end
		end
	end, 1 / display.DEFAULT_FPS)
end

function GameNet.registerProtocals(slot0)
	slot0.proto_mgr:RegisterCmdCallback(1044, "on1044", slot0)
	slot0.proto_mgr:RegisterCmdCallback(1098, "on1098", slot0)
	slot0.proto_mgr:RegisterCmdCallback(1196, "on1196", slot0)
	slot0.proto_mgr:RegisterCmdCallback(1169, "on1199", slot0)
end

function GameNet.on1044(slot0, slot1)
	slot0:setTime(slot1.time)
end

function GameNet.on1196(slot0, slot1)
	slot0.local_srv_diff_time = slot1.time - os.time({
		hour = 0,
		month = 1,
		year = 2019,
		min = 0,
		sec = 0,
		day = 1
	})
end

function GameNet.on1098(slot0, slot1)
	slot0:setTime(slot1.srv_time)
end

function GameNet.SetServerInfo(slot0, slot1, slot2)
	slot0.is_server_info_set = true
	slot0.server_host_name = slot1
	slot0.server_host_port = slot2
end

function GameNet.Connect(slot0, slot1, slot2)
	if slot0.is_server_connected or slot0.in_async_connect then
		return
	end

	if not slot0.is_server_info_set then
		return false
	end

	if slot1 then
		slot0.timeout = slot1
	end

	if slot2 then
		slot0.tryconnect_num = slot2
	end

	if slot0.net_manager:ConnectAsyn(slot0.server_host_name, slot0.server_host_port, slot0.timeout) == -1 then
		return false
	end

	slot0.game_net_id = slot3
	slot0.in_async_connect = true
	slot0.connet_timer_id = slot0.timer:add(function ()
		if not uv0:IsServerConnect() then
			uv0:DisconnectServer(false)
			uv0:tryReconnect()
		end
	end, RECONNEST_INTERVAL or 5, 1)

	return true
end

function GameNet.SendPrev(slot0, slot1)
	if SEND_CMD_CHECK == false then
		return
	end

	if slot1 == 10300 or slot1 == 16601 or slot1 == 16602 or slot1 == 16603 then
		return
	end

	if math.floor(slot1 / 100) == 111 or slot2 == 200 then
		return
	end

	slot0.send_cmd_idx = slot0.send_cmd_idx + 1
	slot3 = slot0.send_cmd_idx
	slot4 = slot0:getTime()

	slot0.net_manager:Send(slot0.game_net_id, 1197, {
		idx = slot3,
		time = slot4,
		code = slot1 + (slot3 + 5) % 16,
		sign = cc.CCGameLib:getInstance():md5str(table.concat({
			slot3,
			slot4,
			slot1,
			"__sszg666__" or CMD_KEY
		}, ""))
	})
end

function GameNet.Send(slot0, slot1, slot2, slot3, slot4)
	if not slot0.is_server_connected then
		if slot4 then
			slot4()
		end

		return false
	end

	slot0:SendPrev(slot1)

	if slot0.net_manager:Send(slot0.game_net_id, slot1, slot2) then
		if slot3 and slot4 then
			slot0.timer:add(slot4, slot3, 1, "send_timeout_" .. slot1)
		end
	elseif slot4 then
		slot4()
	end

	return slot5
end

function GameNet.Recv(slot0, slot1, slot2, slot3)
	if slot0.game_net_id ~= slot2 then
		return
	end

	if not slot0.proto_mgr:hasReg(slot1) then
		return
	end

	if PLATFORM == cc.PLATFORM_OS_WINDOWS and slot1 ~= 1169 and slot1 ~= 12761 then
		print("Recv==========", slot1)
	end

	slot4, slot5 = slot0.net_manager:GetRecv(slot1)

	if slot5 and slot4 then
		List.PushBack(slot0.msg_list, {
			slot1,
			slot4
		})

		slot0.check_time = 0
	else
		sendErrorToSrv(string.format("协议[%s]读取出错", slot1))
	end
end

function GameNet.doOneMsg(slot0)
	if not List.Empty(slot0.msg_list) then
		slot1 = List.PopFront(slot0.msg_list)

		slot0.proto_mgr:cmd_callback(slot1[1], slot1[2])

		return true
	else
		return false
	end
end

function GameNet.tryReconnect(slot0, slot1)
	if slot0.in_async_connect then
		return
	end

	if slot1 then
		slot0.tryconnect_num = slot1
	end

	if slot0.tryconnect_num > 0 then
		slot0:Connect()

		slot0.tryconnect_num = slot0.tryconnect_num - 1
	elseif slot0.tryconnect_num == 0 then
		GlobalTimeTicket:getInstance():remove("LOGIN_REQUEST_tiket")

		if LoginController ~= nil then
			LoginController:getInstance():openReconnect(false)
		end

		if slot0.connect_alert == nil then
			slot0.connect_alert = CommonAlert.show(TI18N("您的网络不稳定，是否重新尝试连接"), TI18N("确定"), function ()
				if LoginController ~= nil then
					LoginController:getInstance():openReconnect(true)
				end

				uv0:Connect(nil, 3)

				uv0.connect_alert = nil
			end, TI18N("取消"), function ()
				sdkOnExit()

				uv0.connect_alert = nil
			end, nil, nil, {
				view_tag = ViewMgrTag.RECONNECT_TAG
			})
		end
	end
end

function GameNet.Connected(slot0, slot1, slot2)
	if slot0.game_net_id ~= slot2 then
		return
	end

	GlobalTimeTicket:getInstance():remove("LOGIN_REQUEST_tiket")

	slot0.game_net_id = slot2
	slot0.in_async_connect = false
	slot0.is_server_connected = true
	slot0.last_heartbeat_time = 0
	slot0.tryconnect_num = 3
	slot0.re_connest_time = 0
	slot0.is_server_disconnet = false
	slot0.is_client_disconnet = false
	slot0.send_cmd_idx = 0

	GlobalEvent:getInstance():Fire(EventId.CONNECTED)

	if slot0.connect_alert ~= nil then
		slot0.connect_alert:close()

		slot0.connect_alert = nil
	end
end

function GameNet.setTime(slot0, slot1)
	slot0.time_diff = slot1 - os.time()
end

function GameNet.tryNum(slot0)
	slot0.re_connest_time = slot0.re_connest_time + 1

	return slot0.re_connest_time
end

function GameNet.getTime(slot0)
	return os.time() + slot0.time_diff
end

function GameNet.getSrvLocalTime(slot0)
	return os.time() + slot0.time_diff - slot0.local_srv_diff_time
end

function GameNet.toSrvLocalTime(slot0, slot1)
	return slot1 - slot0.local_srv_diff_time
end

function GameNet.getTimeFloat(slot0)
	return os.clock()
end

function GameNet.IsServerConnect(slot0)
	return slot0.is_server_connected
end

function GameNet.IsConnecting(slot0)
	return slot0.in_async_connect
end

function GameNet.Disconnect(slot0, slot1)
	List.clean(slot0.msg_list)

	if slot1 ~= slot0.game_net_id then
		return
	end

	slot0.timer:remove(slot0.connet_timer_id)

	slot0.is_server_connected = false
	slot0.in_async_connect = false
	slot0.game_net_id = -1

	GlobalEvent:getInstance():Fire(EventId.DISCONNECT, true)
end

function GameNet.DisconnectServer(slot0, slot1)
	slot0.timer:remove(slot0.connet_timer_id)

	if slot0.game_net_id ~= -1 then
		slot0.net_manager:Disconnect(slot0.game_net_id)
	end

	slot0.is_server_connected = false
	slot0.in_async_connect = false
	slot0.is_client_disconnet = slot1
end

function GameNet.DisconnectByClient(slot0, slot1, slot2)
	if slot2 == nil then
		slot2 = true
	end

	slot0:DisconnectServer(slot2)
	slot0:setServerDisconnect(slot1)
end

function GameNet.__delete(slot0)
	slot0.timer:remove(slot0.connet_timer_id)
	slot0.timer:remove(slot0.schedule_id)
	slot0:DisconnectServer(true)
	slot0.net_manager:Stop()
	slot0.net_manager:DeleteMe()

	slot0.net_manager = nil
end

function GameNet.isServerDisconnet(slot0)
	return slot0.is_server_disconnet
end

function GameNet.setServerDisconnect(slot0, slot1)
	slot0.is_server_disconnet = slot1
end

function GameNet.isClientDisconnet(slot0)
	return slot0.is_client_disconnet
end

function GameNet.getGameNetid(slot0)
	return slot0.game_net_id
end

function GameNet.request1199(slot0)
	if slot0.is_server_disconnet == true then
		return
	end

	slot0.check_time = slot0.check_time + 1

	if slot0.check_time > 1 then
		slot0:DisconnectByClient(false, false)

		slot0.check_time = 0
	else
		slot0:Send(1169, {})
	end
end

function GameNet.on1199(slot0, slot1)
	slot0:setTime(slot1.time)
end
