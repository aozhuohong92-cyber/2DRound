ArenaChampionMyGuessWindow = ArenaChampionMyGuessWindow or BaseClass(BaseView)

function ArenaChampionMyGuessWindow.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "arena/arena_champion_my_guess_window"
	slot0.res_list = {}
	slot0.view_type = slot1 or ArenaConst.champion_type.normal

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.ctrl = ArenaController:getInstance()
		slot0.model = slot0.ctrl:getChampionModel()
	else
		slot0.ctrl = CrosschampionController:getInstance()
		slot0.model = slot0.ctrl:getModel()
	end
end

function ArenaChampionMyGuessWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot2 = slot1:getChildByName("main_panel")

	slot2:getChildByName("win_title"):setString(TI18N("我的竞猜"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.list_view = slot2:getChildByName("list_view")
	slot0.empty_tips = slot2:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("desc"):setString(TI18N("暂无任何竞猜"))

	slot0.item = slot2:getChildByName("item")
end

function ArenaChampionMyGuessWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			ArenaController:getInstance():openArenaChampionMyGuessWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			ArenaController:getInstance():openArenaChampionMyGuessWindow(false)
		end
	end)

	if slot0.update_my_guess_list_event == nil then
		slot0.update_my_guess_list_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateMyGuessListEvent, function (slot0)
			uv0:updateMyGuessList(slot0)
		end)
	end
end

function ArenaChampionMyGuessWindow.openRootWnd(slot0)
	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.ctrl:requestMyGuessInfo()
	else
		slot0.ctrl:sender26205()
	end
end

function ArenaChampionMyGuessWindow.updateMyGuessList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		slot0.empty_tips:setVisible(true)

		if slot0.scroll_view then
			slot0.scroll_view:setVisible(false)
		end
	else
		slot0.empty_tips:setVisible(false)

		if slot0.scroll_view == nil then
			slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_view, nil, nil, nil, slot0.list_view:getContentSize(), {
				start_y = 4,
				item_width = 600,
				start_x = 4,
				space_x = 4,
				row = 0,
				item_height = 136,
				space_y = -2,
				col = 1,
				need_dynamic = true,
				item_class = ArenaChampionMyGuessItem
			})
		end

		slot0.scroll_view:setVisible(true)
		slot0.scroll_view:setData(slot1, nil, nil, {
			node = slot0.item,
			view_type = slot0.view_type
		})
	end
end

function ArenaChampionMyGuessWindow.close_callback(slot0)
	if slot0.update_my_guess_list_event then
		GlobalEvent:getInstance():UnBind(slot0.update_my_guess_list_event)

		slot0.update_my_guess_list_event = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	ArenaController:getInstance():openArenaChampionMyGuessWindow(false)
end

ArenaChampionMyGuessItem = class("ArenaChampionMyGuessItem", function ()
	return ccui.Layout:create()
end)

function ArenaChampionMyGuessItem.ctor(slot0)
	slot0.is_completed = false
end

function ArenaChampionMyGuessItem.setExtendData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.view_type = slot1.view_type

	if not tolua.isnull(slot1.node) and slot0.root_wnd == nil then
		slot0.is_completed = true
		slot3 = slot2:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot3)

		slot0.root_wnd = slot2:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot3.width * 0.5, slot3.height * 0.5)
		slot0:addChild(slot0.root_wnd)

		slot0.left_head = PlayerHead.new(PlayerHead.type.circle)

		slot0.left_head:setPosition(60, 60)
		slot0.root_wnd:getChildByName("left_role"):addChild(slot0.left_head)

		slot0.right_head = PlayerHead.new(PlayerHead.type.circle)

		slot0.right_head:setPosition(60, 60)
		slot0.root_wnd:getChildByName("right_role"):addChild(slot0.right_head)

		slot0.success_img = slot0.root_wnd:getChildByName("success_img")
		slot0.result_label = slot0.root_wnd:getChildByName("result_label")
		slot0.match_step_label = slot0.root_wnd:getChildByName("match_step_label")
		slot0.left_name = slot0.root_wnd:getChildByName("left_name")
		slot0.right_name = slot0.root_wnd:getChildByName("right_name")
		slot0.role_name = slot0.root_wnd:getChildByName("role_name")
		slot0.info_btn = slot0.root_wnd:getChildByName("info_btn")
		slot0.check_fight_btn = slot0.root_wnd:getChildByName("check_fight_btn")
		slot0.assets_container = slot0.root_wnd:getChildByName("assets_container")
		slot0.assets_value = slot0.assets_container:getChildByName("value")

		if slot0.view_type == ArenaConst.champion_type.cross and Config.ItemData.data_get_data(33) then
			slot0.assets_container:getChildByName("Image_53"):loadTexture(PathTool.getItemRes(Config.ItemData.data_get_data(33).icon), LOADTEXT_TYPE)
		end

		slot0.role_name_y = 62
		slot0.assets_y = slot0.assets_container:getPositionY()
		slot0.left_success_x = 35
		slot0.right_success_x = 192

		slot0.success_img:setVisible(true)
		slot0:registerEvent()
	end
end

function ArenaChampionMyGuessItem.registerEvent(slot0)
	slot0.left_head:addCallBack(function ()
		if uv0.data ~= nil and uv0.data ~= nil and uv0.data.srv_id ~= "" then
			FriendController:getInstance():openFriendCheckPanel(true, {
				srv_id = uv0.data.a_srv_id,
				rid = uv0.data.a_rid
			})
		end
	end, false)
	slot0.right_head:addCallBack(function ()
		if uv0.data ~= nil and uv0.data ~= nil and uv0.data.srv_id ~= "" then
			FriendController:getInstance():openFriendCheckPanel(true, {
				srv_id = uv0.data.b_srv_id,
				rid = uv0.data.b_rid
			})
		end
	end, false)
	slot0.check_fight_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.data.replay_id ~= 0 then
				if uv0.view_type == ArenaConst.champion_type.normal then
					BattleController:getInstance():csRecordBattle(uv0.data.replay_id)
				elseif CrosschampionController:getInstance():getModel():getBaseInfo() then
					BattleController:getInstance():csRecordBattle(uv0.data.replay_id, slot2.srv_id)
				else
					BattleController:getInstance():csRecordBattle(uv0.data.replay_id)
				end
			end
		end
	end)
	slot0.info_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				ArenaController:getInstance():openArenaChampionReportWindow(true, uv0.data, uv0.view_type)
			end
		end
	end)
end

function ArenaChampionMyGuessItem.setData(slot0, slot1)
	if slot1 then
		slot0.data = slot1

		if slot0.data.ret == 0 then
			slot0.success_img:setVisible(fasle)
			slot0.info_btn:setVisible(false)
			slot0.check_fight_btn:setVisible(false)
			slot0.role_name:setVisible(true)
			slot0.assets_container:setPositionY(slot0.assets_y)
			slot0.result_label:setString(TI18N("投注:"))
			slot0.assets_value:setTextColor(Config.ColorData.data_color4[175])
			slot0.assets_value:setString(slot0.data.bet)

			if slot0.data.target == 1 then
				slot0.role_name:setString(transformNameByServ(slot0.data.a_name, slot0.data.a_srv_id))
			else
				slot0.role_name:setString(transformNameByServ(slot0.data.b_name, slot0.data.b_srv_id))
			end
		else
			slot0.success_img:setVisible(true)
			slot0.info_btn:setVisible(true)
			slot0.check_fight_btn:setVisible(true)
			slot0.role_name:setVisible(false)
			slot0.assets_container:setPositionY(slot0.role_name_y)

			if slot0.data.target == slot0.data.ret then
				slot0.result_label:setString(TI18N("得到:"))
				slot0.assets_value:setTextColor(Config.ColorData.data_color4[202])
				slot0.assets_value:setString(slot0.data.get_bet)
			else
				slot0.result_label:setString(TI18N("失去:"))
				slot0.assets_value:setTextColor(Config.ColorData.data_color4[183])
				slot0.assets_value:setString(slot0.data.bet)
			end

			if slot0.data.ret == 1 then
				slot0.success_img:setPositionX(slot0.left_success_x)
			else
				slot0.success_img:setPositionX(slot0.right_success_x)
			end
		end

		slot0.left_head:setHeadRes(slot0.data.a_face, false, LOADTEXT_TYPE, slot0.data.a_face_file, slot0.data.a_face_update_time)
		slot0.right_head:setHeadRes(slot0.data.b_face, false, LOADTEXT_TYPE, slot0.data.b_face_file, slot0.data.b_face_update_time)
		slot0.left_name:setString(slot0.data.a_name)
		slot0.right_name:setString(slot0.data.b_name)
		slot0.match_step_label:setString(ArenaConst.getMatchStepDesc2(slot0.data.step, slot0.data.round))
	end
end

function ArenaChampionMyGuessItem.DeleteMe(slot0)
	if slot0.left_head then
		slot0.left_head:DeleteMe()

		slot0.left_head = nil
	end

	if slot0.right_head then
		slot0.right_head:DeleteMe()

		slot0.right_head = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
