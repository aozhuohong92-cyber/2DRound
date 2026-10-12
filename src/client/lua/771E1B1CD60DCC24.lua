ServerPanel = class("ServerPanel", function ()
	return ccui.Widget:create()
end)
slot0 = table.insert
slot1 = string.format
slot2 = table.sort
slot3 = table.remove

function ServerPanel.ctor(slot0, slot1, slot2)
	slot0.ctrl = slot2
	slot0.size = slot1 and slot1:getContentSize() or cc.size(SCREEN_WIDTH, SCREEN_HEIGHT)
	slot0.last_login = 0
	slot0.model = slot0.ctrl:getModel()
	slot0.data = slot0.model:getLoginData()

	slot0:setContentSize(slot0.size)
	slot0:setPosition(slot0.size.width / 2, slot0.size.height / 2)
	slot0:setCascadeOpacityEnabled(true)

	slot0.server_item_list = {}
	slot0.server_poll_list = {}
	slot0.cell_list = {}
	slot0.tab_list = {}
	slot0.server_list = {}
	slot0.tui_list = {}
	slot0.tab_num = 0
	slot0.select_item = nil
	slot0.scroll_w = 0
	slot0.scroll_h = 0
	slot0.recent_h = 0
	slot0.cell_h = 86
	slot0.cell_w = 429
	slot0.page_sum = 10
	slot0.pos_y = 0
	slot0.isRenderFinish = false
	slot0.is_have = false

	slot0:layoutUI()
	slot0:registerEvent()
end

function ServerPanel.layoutUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("login/server_panel_view"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot0.size.width / 2, slot0.size.height / 2)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot1:getChildByName("win_title"):setString(TI18N("选择服务器"))

	slot0.btn_close = slot1:getChildByName("close_btn")
	slot0.server_list = slot1:getChildByName("server_list")
	slot0.server_scroll_view = slot1:getChildByName("server_scroll_view")

	slot0.server_scroll_view:setScrollBarEnabled(false)

	slot0.scroll_h = slot0.server_scroll_view:getContentSize().height
	slot0.scroll_w = slot0.server_scroll_view:getContentSize().width

	if PLATFORM_NAME == "release2" then
		slot0.editbox = createEditBox(slot0.root_wnd, PathTool.getResFrame("common", "common_1021"), cc.size(320, 50), nil, 24, Config.ColorData.data_color3[151], 20, "输入平台+服务器id", nil, nil, LOADTEXT_TYPE_PLIST, nil, nil)

		slot0.editbox:setPosition(360, 1000)
		slot0.editbox:registerScriptEditBoxHandler(function (slot0, slot1)
			if slot0 == "return" or slot0 == "ended" then
				slot2 = slot1:getText()

				if LoginController:getInstance():getModel().server_list and next(slot3) then
					for slot7, slot8 in pairs(slot3) do
						if slot2 == slot8.main_srv_id then
							uv0.model:setCurSrv(slot8, true)
							uv0.ctrl:requestLoginGame(uv0.model:getLoginData().usrName, slot8.ip, slot8.port, false, true)
						end
					end
				end
			elseif slot0 == "began" then
				-- Nothing
			elseif slot0 == "changed" then
				-- Nothing
			end
		end)
	end

	for slot5 = 1, 3 do
		if slot1:getChildByName("status_tips_" .. slot5) then
			if slot5 == 1 then
				slot6:setString(TI18N("爆满"))
			elseif slot5 == 2 then
				slot6:setString(TI18N("流畅"))
			else
				slot6:setString(TI18N("维护"))
			end
		end
	end
end

function ServerPanel.effectHandler(slot0)
end

function ServerPanel.update(slot0)
	if slot0.scroll_view == nil then
		slot0.scroll_view = CommonScrollViewLayout.new(slot0.server_list, nil, nil, nil, slot0.server_list:getContentSize(), {
			start_y = 0,
			item_width = 204,
			start_x = 0,
			space_x = 0,
			row = 1,
			item_height = 86,
			space_y = 0,
			col = 1,
			item_class = ServerListItem
		})

		slot0:renderServerList()
	end
end

function ServerPanel.renderServerList(slot0)
	slot0.server_list = slot0.model:getServerList()

	if slot0.server_list == nil or next(slot0.server_list) == nil then
		return
	end

	slot0.select_list_item = nil

	function slot5(slot0, slot1)
		if slot0.group_id == slot1.group_id then
			return tonumber(slot1.group_num) < tonumber(slot0.group_num)
		else
			return tonumber(slot1.group_id) < tonumber(slot0.group_id)
		end
	end

	uv0(slot0.server_list, slot5)

	slot0.tab_list = {}
	slot0.cell_list = {}

	for slot5, slot6 in ipairs(slot0.server_list) do
		if not slot0.tab_list[tonumber(slot6.group_id)] then
			slot0.tab_list[slot7] = {}
		end

		uv1(slot0.tab_list[slot7], slot6)
	end

	slot0.tab_num = #slot0.tab_list

	for slot5, slot6 in ipairs(slot0.server_list) do
		if slot6.role_count > 0 then
			slot0.is_have = true

			break
		end
	end

	function slot2(slot0)
		uv0:changeTabBarIndex(slot0)
	end

	uv1({}, {
		order = "recommend",
		desc = TI18N("推荐")
	})

	if slot0.is_have == true then
		uv1(slot3, {
			order = "role",
			desc = TI18N("角色")
		})
	end

	for slot7 = slot0.tab_num, 1, -1 do
		if slot0.tab_list[slot7] and slot8[1] then
			uv1(slot3, {
				order = slot7,
				desc = LoginController:getInstance():getModel():getSrvGroupNameByGroupId(slot8[1].group_id)
			})
		end
	end

	slot0.scroll_view:setData(slot3, slot2)
end

function ServerPanel.changeTabBarIndex(slot0, slot1)
	if slot1 == nil or slot1.data == nil then
		return
	end

	if slot0.select_list_item == slot1 then
		return
	end

	if slot0.select_list_item then
		slot0.select_list_item:setSelected(false)

		slot0.select_list_item = nil
	end

	slot0.select_list_item = slot1

	if slot0.select_list_item then
		slot0.select_list_item:setSelected(true)
	end

	if slot0.server_scroll_view then
		slot5 = "ServerPanel_selectItemHandler_ticket"

		GlobalTimeTicket:getInstance():remove(slot5)

		for slot5, slot6 in ipairs(slot0.server_item_list) do
			slot6:clearLayout()
			uv0(slot0.server_poll_list, slot6)
		end

		slot0.server_item_list = {}
		slot0.select_item = nil
	end

	slot0.cell_list = {}

	if slot1.data.order == "recommend" then
		slot0:createRecommendServer()
	elseif slot2 == "role" then
		slot0:createRoleServer()
	else
		slot0:createServerList(slot0.tab_list[slot2])
	end
end

function ServerPanel.createRoleServer(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.server_list) do
		if slot6.role_count > 0 then
			uv0(slot1, slot6)
		end
	end

	slot2 = {}

	if slot1 and #slot1 > 0 then
		function slot6(slot0, slot1)
			return slot1.role_logintime < slot0.role_logintime
		end

		uv1(slot1, slot6)

		for slot6 = 1, 100 do
			if slot1[slot6] ~= nil then
				uv0(slot2, slot1[slot6])
			end
		end
	end

	slot0:createServerList(slot2, true)
end

function ServerPanel.createRecommendServer(slot0)
	slot1 = {}

	if not slot0.server_list or next(slot0.server_list) == nil then
		return
	end

	for slot5 = 1, 2 do
		if slot0.server_list[slot5] then
			uv0(slot1, slot0.server_list[slot5])
		end
	end

	slot0:createServerList(slot1)
end

function ServerPanel.createServerList(slot0, slot1, slot2)
	doStopAllActions(slot0.root_wnd)

	slot0.temp_new_pos = nil
	slot3 = #slot1
	slot4 = slot3 * slot0.cell_h + slot3 + 1
	slot0.total_h = slot4
	slot0.maxH = math.max(slot4, slot0.scroll_h)

	slot0.server_scroll_view:stopAutoScroll()
	slot0.server_scroll_view:setInnerContainerSize(cc.size(slot0.scroll_w, slot0.maxH))

	slot5 = 0
	slot6, slot7, slot8, slot9 = nil

	for slot13, slot14 in ipairs(slot1) do
		delayRun(slot0.root_wnd, slot13 / display.DEFAULT_FPS, function ()
			uv0 = {
				idx = uv1,
				v = uv2
			}
			uv3 = (uv4.scroll_w - uv4.cell_w) * 0.5
			uv5 = uv4.maxH - (uv1 - 1) * uv4.cell_h

			if #uv4.server_poll_list > 0 then
				uv6 = uv7(uv4.server_poll_list, 1)
			else
				uv6 = ServerCell.new()
			end

			uv8(uv4.server_item_list, uv6)
			uv4.server_scroll_view:addChild(uv6)
			uv6:setBaseData(uv0, uv9)

			if uv4.temp_new_pos and uv4.temp_new_pos < uv6.idx - 1 then
				slot1 = 88

				if uv4.select_item then
					slot1 = uv4.select_item.scroll_h or 88
				end

				uv5 = uv5 - slot1
			end

			uv6:setPosition(uv3, uv5)
			uv6:addCallBack(function (slot0)
				if not uv0.model:isNeedReload(nil, uv1, sdkOnSwitchAccount) then
					uv0.model:setCurSrv(uv1, true)
					uv0:selectItemHandler(slot0, false, true)
				end
			end)

			uv4.cell_list[uv1] = uv6
		end)
	end
end

function ServerPanel.selectItemHandler(slot0, slot1, slot2, slot3)
	if slot1 == nil or slot1.data == nil or slot1.data.v == nil then
		return
	end

	if slot0.select_item and slot0.select_item == slot1 then
		return
	end

	if slot0.select_item ~= nil then
		slot0.select_item:setSelected(false)
	end

	slot0.pre_cell = slot0.select_item
	slot4 = deepCopy(slot0.model:getLoginData())
	slot5 = GameNet:getInstance():IsServerConnect()

	if slot0.select_item ~= slot1 or slot2 or not slot5 then
		slot4.ip = slot1.data.v.ip
		slot4.port = slot1.data.v.port
		slot4.srv_id = slot1.data.v.srv_id
		slot4.host = slot1.data.v.host or ""
		slot4.open_time = slot1.data.v.open_time or 0
		slot4.rid = 0
		slot4.role_count = slot1.data.v.role_count
		slot4.gameStatus = slot1.data.v.gameStatus

		if slot5 and slot0.ctrl:isReadyEnterGame() == false then
			GameNet:getInstance():DisconnectByClient(false)
		end

		GlobalTimeTicket:getInstance():remove("LOGIN_REQUEST_tiket")
		slot0.model:setGatewayCallState(0)
		GlobalTimeTicket:getInstance():add(function ()
			if checkUserProto and checkUserProto() and not SysEnv:getInstance():getBool(SysEnv.keys.user_proto_agree, false) then
				message(TI18N("请勾选同意开始游戏按钮下方的 游戏用户协议 和 隐私保护指引,即可进入游戏"))

				return
			end

			if NEED_CHECK_CLOSE and not uv0.model:isWhite() and (uv1.isClose or GameNet:getInstance():getTime() - uv1.open_time < 0) then
				NoticeController:getInstance():openNoticeView()

				return
			end

			GlobalTimeTicket:getInstance():remove("ServerPanel_selectItemHandler_ticket")

			uv1.host = uv2.data.v.host or ""
			uv1.open_time = uv2.data.v.open_time or 0

			uv0.ctrl:requestLoginGame(uv1.usrName, uv2.data.v.ip, uv2.data.v.port, false, uv3)
		end, 2 / display.DEFAULT_FPS, 1, "ServerPanel_selectItemHandler_ticket")
	end

	slot4.srv_id = slot1.data.v.srv_id
	slot4.host = slot1.data.v.host or ""
	slot4.open_time = slot1.data.v.open_time or 0
	slot4.srv_name = slot1.data.v.srv_name or ""
	slot0.select_item = slot1

	if slot0.select_item ~= nil then
		slot0.select_item:setSelected(true)
	end
end

function ServerPanel.updateCellListPos(slot0)
	slot2 = slot0.select_item.idx
	slot3 = 0
	slot4 = 0
	slot5 = slot0.select_item.scroll_h or 88
	slot6 = 0

	if slot0.pre_cell ~= nil and slot1.idx then
		slot3 = slot1.idx - 1
		slot6 = slot1.scroll_h or 88
	end

	if slot0.select_item.idx then
		slot0.temp_new_pos = slot0.select_item.idx - 1
	end

	slot7 = math.max(slot0.total_h + slot5, slot0.scroll_h)

	if slot1 ~= nil and slot1.isOpenRoles then
		for slot11, slot12 in ipairs(slot0.cell_list) do
			_y = slot7 - (slot11 - 1) * slot0.cell_h

			slot12:setPositionY(_y)
		end

		slot1:closeRoles()
	end

	for slot11, slot12 in ipairs(slot0.cell_list) do
		_y = slot7 - (slot11 - 1) * slot0.cell_h

		if slot4 < slot12.idx - 1 then
			_y = _y - slot5
		end

		slot12:setPositionY(_y)
	end

	slot0.select_item:showRoles()

	slot0.maxH = slot7

	slot0.server_scroll_view:setInnerContainerSize(cc.size(slot0.scroll_w, slot7))

	if slot0.select_item.idx > 8 then
		slot0.server_scroll_view:scrollToPercentVertical(slot0.select_item.idx / #slot0.cell_list * 100, 0, true)
	end
end

function ServerPanel.registerEvent(slot0)
	if slot0.btn_close then
		slot0.btn_close:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				GameNet:getInstance():DisconnectByClient(false)
				uv0.ctrl:openView(LoginController.type.enter_game)
			end
		end)
	end

	if slot0.role_list_change_event == nil then
		slot0.role_list_change_event = GlobalEvent:getInstance():Bind(LoginEvent.SERVER_ROLELIST_CHANGE, function ()
			uv0:updateCell()
		end)
	end
end

function ServerPanel.updateCell(slot0)
	if slot0.select_item then
		slot0.select_item:updateRoleData(slot0.model:getLoginInfo().roles)
		slot0:updateCellListPos()
	end
end

function ServerPanel.DeleteMe(slot0)
	doStopAllActions(slot0.root_wnd)
	GlobalTimeTicket:getInstance():remove("ServerPanel_selectItemHandler_ticket")

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	for slot4, slot5 in ipairs(slot0.server_item_list) do
		slot5:DeleteMe()
	end

	slot0.server_item_list = nil

	for slot4, slot5 in ipairs(slot0.server_poll_list) do
		slot5:DeleteMe()
	end

	slot0.server_poll_list = nil
	slot2 = slot0.server_scroll_view
	slot4 = slot2

	for slot4 = 1, slot2.getChildrenCount(slot4) do
		if slot0.server_scroll_view:getChildByTag(slot4) and slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()

	if slot0.role_list_change_event then
		GlobalEvent:getInstance():UnBind(slot0.role_list_change_event)

		slot0.role_list_change_event = nil
	end
end

ServerListItem = class("ServerListItem", function ()
	return ccui.Layout:create()
end)

function ServerListItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("login/server_list_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:setTouchEnabled(true)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.normal_bg = slot0.root_wnd:getChildByName("normal_bg")
	slot0.select_bg = slot0.root_wnd:getChildByName("select_bg")
	slot0.list_desc = slot0.root_wnd:getChildByName("list_desc")

	slot0:registerEvent()
end

function ServerListItem.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true and uv0.call_back and uv0.data then
				uv0:call_back()
			end
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		end
	end)
end

function ServerListItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function ServerListItem.setSelected(slot0, slot1)
	if slot1 == true then
		slot0.list_desc:setTextColor(cc.c4b(2, 62, 1, 255))
	else
		slot0.list_desc:setTextColor(cc.c4b(104, 69, 42, 255))
	end

	slot0.normal_bg:setVisible(slot1 == false)
	slot0.select_bg:setVisible(slot1)
end

function ServerListItem.setData(slot0, slot1)
	if slot1 ~= nil then
		slot0.data = slot1

		slot0.list_desc:setString(slot1.desc)

		if slot1.order == "recommend" then
			slot0:call_back()
		end
	end
end

function ServerListItem.DeleteMe(slot0)
	if slot0.rank_num ~= nil then
		slot0.rank_num:DeleteMe()

		slot0.rank_num = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
