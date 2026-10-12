ArenaLoopMyLogWindow = ArenaLoopMyLogWindow or BaseClass(BaseView)
slot0 = ArenaController:getInstance()
slot1 = string.format
slot2 = RoleController:getInstance():getRoleVo()

function ArenaLoopMyLogWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "arena/arena_loop_my_log_window"
	slot0.res_list = {}
end

function ArenaLoopMyLogWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot2 = slot1:getChildByName("main_panel")
	slot0.good_cons = slot2:getChildByName("good_cons")

	slot2:getChildByName("win_title"):setString(TI18N("比赛记录"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.list_view = slot2:getChildByName("list_view")
	slot0.empty_tips = slot2:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("desc"):setString(TI18N("暂无任何竞猜"))

	slot0.item = slot2:getChildByName("item")
end

function ArenaLoopMyLogWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openArenaLoopMyLogWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openArenaLoopMyLogWindow(false)
		end
	end)

	if slot0.update_my_log_list_event == nil then
		slot0.update_my_log_list_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateMylogListEvent, function (slot0)
			uv0:updateMyGuessList(slot0)
		end)
	end
end

function ArenaLoopMyLogWindow.openRootWnd(slot0)
	uv0:requestMyLoopLogInfo()
end

function ArenaLoopMyLogWindow.updateMyGuessList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		slot0.empty_tips:setVisible(true)

		if slot0.scroll_view then
			slot0.scroll_view:setVisible(false)
		end
	else
		slot0.empty_tips:setVisible(false)

		if slot0.scroll_view == nil then
			slot0.scroll_view = CommonScrollViewLayout.new(slot0.good_cons, nil, nil, nil, slot0.good_cons:getContentSize(), {
				start_y = 0,
				item_width = 600,
				start_x = 5.5,
				space_x = 0,
				row = 0,
				item_height = 136,
				space_y = 5,
				col = 1,
				need_dynamic = true,
				item_class = ArenaLoopMyLogItem
			})
		end

		slot0.scroll_view:setVisible(true)
		slot0.scroll_view:setData(slot1, nil, nil, slot0.item)
	end
end

function ArenaLoopMyLogWindow.close_callback(slot0)
	if slot0.update_my_log_list_event then
		GlobalEvent:getInstance():UnBind(slot0.update_my_log_list_event)

		slot0.update_my_log_list_event = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	uv0:openArenaLoopMyLogWindow(false)
end

ArenaLoopMyLogItem = class("ArenaLoopMyLogItem", function ()
	return ccui.Layout:create()
end)

function ArenaLoopMyLogItem.ctor(slot0)
	slot0.is_completed = false
end

function ArenaLoopMyLogItem.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot0.is_completed = true
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0:addChild(slot0.root_wnd)

		slot0.left_head = PlayerHead.new(PlayerHead.type.circle)

		slot0.left_head:setPosition(60, 60)
		slot0.root_wnd:getChildByName("left_role"):addChild(slot0.left_head)

		slot0.right_head = PlayerHead.new(PlayerHead.type.circle)

		slot0.right_head:setPosition(60, 60)
		slot0.root_wnd:getChildByName("right_role"):addChild(slot0.right_head)

		slot0.success_img = slot0.root_wnd:getChildByName("success_img")
		slot0.left_name = slot0.root_wnd:getChildByName("left_name")
		slot0.right_name = slot0.root_wnd:getChildByName("right_name")
		slot0.fight_result = createRichLabel(24, cc.c4b(90, 58, 38, 255), cc.p(0, 0.5), cc.p(295, 34))

		slot0.root_wnd:addChild(slot0.fight_result)

		slot0.fight_type = slot0.root_wnd:getChildByName("fight_type")
		slot0.check_fight_btn = slot0.root_wnd:getChildByName("check_fight_btn")
		slot0.time = slot0.root_wnd:getChildByName("time")

		slot0:registerEvent()
	end
end

function ArenaLoopMyLogItem.registerEvent(slot0)
	slot0.right_head:addCallBack(function ()
		if uv0.data ~= nil and uv0.data.srv_id ~= "" then
			FriendController:getInstance():openFriendCheckPanel(true, {
				srv_id = uv0.data.srv_id,
				rid = uv0.data.rid
			})
		end
	end, false)
	slot0.check_fight_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.data.replay_id ~= 0 then
				BattleController:getInstance():csRecordBattle(uv0.data.replay_id)
			end
		end
	end)
end

function ArenaLoopMyLogItem.setData(slot0, slot1)
	if slot1 then
		slot0.data = slot1

		slot0.left_head:setHeadRes(uv0.face_id, false, LOADTEXT_TYPE, uv0.face_file, uv0.face_update_time)
		slot0.left_name:setString(uv0.name)
		slot0.right_head:setHeadRes(slot0.data.face, false, LOADTEXT_TYPE, slot0.data.face_file, slot0.data.face_update_time)
		slot0.right_name:setString(slot0.data.name)

		if slot0.data.ret == 1 then
			slot0.success_img:loadTexture(PathTool.getResFrame("common", "txt_cn_common_90012"), LOADTEXT_TYPE_PLIST)
		else
			slot0.success_img:loadTexture(PathTool.getResFrame("common", "txt_cn_common_90013"), LOADTEXT_TYPE_PLIST)
		end

		if slot0.data.type == 1 then
			if slot0.data.ret == 1 then
				slot0.fight_type:setString(TI18N("进攻成功"))
			else
				slot0.fight_type:setString(TI18N("进攻失败"))
			end
		elseif slot0.data.ret == 1 then
			slot0.fight_type:setString(TI18N("防守成功"))
		else
			slot0.fight_type:setString(TI18N("防守失败"))
		end

		slot0.time:setString(TimeTool.getYMDHMS(slot1.time))

		slot3 = ""

		if Config.ArenaData.data_const.score_iocn then
			slot3 = (slot1.score ~= 0 or uv1("<img src=%s scale=0.3 visible=true />%s", PathTool.getItemRes(slot2.val), TI18N("不变"))) and (slot1.ret ~= 1 or uv1("<img src=%s scale=0.3 visible=true /><div fontcolor=#249003>+%s</div>  <img src=%s scale=1 visible=true />", PathTool.getItemRes(slot2.val), slot1.score, PathTool.getResFrame("common", "common_1086"))) and uv1("<img src=%s scale=0.3 visible=true /><div fontcolor=#e14737>%s</div>  <img src=%s scale=1 visible=true />", PathTool.getItemRes(slot2.val), slot1.score, PathTool.getResFrame("common", "common_1087"))
		end

		slot0.fight_result:setString(slot3)
	end
end

function ArenaLoopMyLogItem.DeleteMe(slot0)
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
