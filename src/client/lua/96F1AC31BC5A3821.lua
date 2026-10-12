ActionWarriorMain = ActionWarriorMain or BaseClass(BaseView)

function ActionWarriorMain.__init(slot0)
	slot0.ctrl = ActionController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.layout_name = "action/action_warrior_main"
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.wait_bool = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("action_warrior", "action_warrior"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("action_warrior", "warrior_10"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("action_warrior", "warrior_13"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("action_warrior", "warrior_14"),
			type = ResourcesType.single
		}
	}

	slot0:registerEvent()
end

function ActionWarriorMain.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.btn_rule = slot0.main_container:getChildByName("btn_rule")

	slot0.btn_rule:getChildByName("lab"):setString("规则说明")

	slot0.btn_music = slot0.main_container:getChildByName("btn_music")

	slot0.btn_music:getChildByName("lab"):setString("排行榜")

	slot0.btn_close = slot0.main_container:getChildByName("btn_close")

	slot0.btn_close:getChildByName("lab"):setString("退出")

	slot0.btn_start = slot0.main_container:getChildByName("btn_start")
	slot0.enable_tips = slot0.main_container:getChildByName("enable_tips")

	slot0.enable_tips:setVisible(false)
	slot0:adaptationScreen()
	slot0:updataWaitState()
end

function ActionWarriorMain.updataWaitState(slot0)
	if slot0.wait_bool then
		slot0.btn_start:setTouchEnabled(false)
		slot0.enable_tips:setVisible(true)
		slot0.btn_start:setEnabled(false)
	else
		slot0.btn_start:setTouchEnabled(true)
		slot0.enable_tips:setVisible(false)
		slot0.btn_start:setEnabled(true)
	end
end

function ActionWarriorMain.registerEvent(slot0)
	if not slot0.action_warrior_event then
		slot0.action_warrior_event = GlobalEvent:getInstance():Bind(ActionEvent.ACTION_WARRIOR_EVENT, function (slot0)
			if slot0 then
				WarriorTool.token = slot0.token
				WarriorTool.id = slot0.data.id
				WarriorTool.Max_Level = slot0.data.bestLevel + 1
				WarriorTool.seasonStartTime = slot0.data.seasonStartTime
				WarriorTool.seasonEndTime = slot0.data.seasonEndTime
				uv0.wait_bool = slot0.data.wait
			end
		end)
	end
end

function ActionWarriorMain.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.main_container)
	slot2 = display.getBottom(slot0.main_container)
	slot3 = display.getLeft(slot0.main_container)
	slot4 = display.getRight(slot0.main_container)

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.btn_close:setPositionY(slot1 + slot0.btn_close:getPositionY() - slot0.main_container:getContentSize().height)
	slot0.btn_close:setPositionX(slot0.btn_close:getPositionX() + slot4 - slot0.main_container:getContentSize().width)
	slot0.btn_rule:setPositionY(slot1 + slot0.btn_rule:getPositionY() - slot0.main_container:getContentSize().height)
	slot0.btn_rule:setPositionX(slot0.btn_rule:getPositionX() + slot4 - slot0.main_container:getContentSize().width)
	slot0.btn_music:setPositionY(slot1 + slot0.btn_music:getPositionY() - slot0.main_container:getContentSize().height)
	slot0.btn_music:setPositionX(slot0.btn_music:getPositionX() + slot4 - slot0.main_container:getContentSize().width)
end

function ActionWarriorMain.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:close()
	end, true, 2)
	registerButtonEventListener(slot0.btn_start, function ()
		if WarriorTool.seasonEndTime < os.time() then
			slot2, slot3 = unpack(Split(RoleController:getInstance():getRoleVo().srv_id, "_"))

			if LoginPlatForm:getInstance():getAccount() == "" then
				slot1 = "123456"
			end

			slot6 = cc.XMLHttpRequest:new()
			slot6.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON

			slot6:open("GET", string.format("%s/gameRecord/getGameRecord?", MINI_GAME_URL) .. string.format("account=%s&roleId=%s&serverId=%s&gameId=%s&userName=%s&faceId=%s", slot1, slot0.rid, slot3, tonumber("890" .. tostring(MINI_GAME_WARRIOR_CHANNEL)), encodeURI(slot0.name), slot0.face_id))
			slot6:registerScriptHandler(function ()
				if uv0.readyState == 4 and uv0.status == 200 and json.decode(uv0.response) then
					if slot0.code == 200 then
						GlobalEvent:getInstance():Fire(ActionEvent.ACTION_WARRIOR_EVENT, slot0.map)
						uv1.ctrl:openActionWarriorLevel(true)
					else
						message(slot0.msg)
					end
				end
			end)
			slot6:send()

			return
		end

		uv0.ctrl:openActionWarriorLevel(true)
	end, true, 2)
	registerButtonEventListener(slot0.btn_music, function ()
		if uv0.wait_bool then
			-- Nothing
		else
			slot0.show_tips = TI18N("本赛季将于" .. os.date("%m-%d", WarriorTool.seasonEndTime) .. "结束,奖励将在赛季结束后通过邮件发放")
		end

		RankController:getInstance():openSingleRankMainWindow(true, {
			rank_type = RankConstant.RankType.rank_warrior,
			title_name = TI18N("勇闯海盗船排行榜"),
			show_tips = TI18N("下赛季将于" .. os.date("%m-%d", WarriorTool.seasonStartTime) .. "开始,敬请期待！")
		})
	end, true, 2)
	registerButtonEventListener(slot0.btn_rule, function ()
		MainuiController:getInstance():openCommonExplainView(true, Config.ActionWarrior.data_explain)
	end, true, 2)
end

function ActionWarriorMain.close_callback(slot0)
	slot0.ctrl:openActionWarrior(false)
	slot0.ctrl:openActionWarriorLevel(false)
	slot0.ctrl:openActionWarriorWorld(false)

	if slot0.action_warrior_event then
		GlobalEvent:getInstance():UnBind(slot0.action_warrior_event)

		slot0.action_warrior_event = nil
	end
end
