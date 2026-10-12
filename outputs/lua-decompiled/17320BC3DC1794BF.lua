slot1 = CrossarenaController:getInstance():getModel()
CrossarenaRankWindow = CrossarenaRankWindow or BaseClass(BaseView)

function CrossarenaRankWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "ladder/ladder_rank_window"
	slot0.show_list = {}
end

function CrossarenaRankWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 1)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")

	slot0.main_panel:getChildByName("title_con"):getChildByName("title_label"):setString(TI18N("排行榜"))

	slot0.no_log_image = slot0.main_panel:getChildByName("no_log_image")

	slot0.no_log_image:setVisible(false)

	slot0.rank_panel = slot0.main_panel:getChildByName("rank_panel")
	slot0.my_rank = slot0.main_panel:getChildByName("my_rank")

	slot0.my_rank:getChildByName("title"):setString(TI18N("我的排名"))

	slot0.no_rank_label = slot0.my_rank:getChildByName("no_rank_label")

	slot0.no_rank_label:setVisible(false)

	slot0.my_rank_id = slot0.my_rank:getChildByName("rank_id")
	slot0.my_name_label = slot0.my_rank:getChildByName("my_name_label")
	slot0.my_attk_label = slot0.my_rank:getChildByName("my_attk_label")
	slot0.my_guild_label = slot0.my_rank:getChildByName("my_guild_label")
	slot0.best_rank_label = slot0.my_rank:getChildByName("best_rank_label")
	slot0.my_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.my_head:setHeadLayerScale(0.8)
	slot0.my_head:setPosition(150, 66)
	slot0.my_rank:addChild(slot0.my_head)

	slot4 = slot0.rank_panel:getContentSize()
	slot0.rank_scrollview = CommonScrollViewSingleLayout.new(slot0.rank_panel, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot4.width, slot4.height - 4), {
		start_y = 0,
		row = 0,
		start_x = 5,
		space_x = 0,
		item_width = 612,
		item_height = 112,
		space_y = 0,
		col = 1,
		need_dynamic = true
	}, cc.p(0, 0))

	slot0.rank_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.rank_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.rank_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0.rank_scrollview:setSwallowTouches(false)
end

function CrossarenaRankWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 2)
	slot0:addGlobalEvent(CrossarenaEvent.Update_Rank_Data_Event, function (slot0)
		uv0:setData(slot0)
	end)
end

function CrossarenaRankWindow._onClickBtnClose(slot0)
	uv0:openCrossarenaRankWindow(false)
end

function CrossarenaRankWindow.createNewCell(slot0)
	return CrossarenaRankItem.new()
end

function CrossarenaRankWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function CrossarenaRankWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function CrossarenaRankWindow.openRootWnd(slot0)
	uv0:sender25615()
end

function CrossarenaRankWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = RoleController:getInstance():getRoleVo()

	slot0.my_head:setHeadRes(slot2.face_id, false, LOADTEXT_TYPE, slot2.face_file, slot2.face_update_time)
	slot0.my_head:setLev(slot2.lev)
	slot0.my_name_label:setString(slot2.name)
	slot0.my_attk_label:setString(slot2.power)
	slot0.my_guild_label:setString(string.format(TI18N("积分:%d"), uv0:getMyCrossarenaScore()))

	if not slot1.best_rank or slot1.best_rank == 0 then
		slot0.best_rank_label:setString(TI18N("历史最高：暂无"))
	else
		slot0.best_rank_label:setString(string.format(TI18N("历史最高：%d名"), slot1.best_rank))
	end

	if not slot1.rank or slot1.rank == 0 then
		slot0.no_rank_label:setVisible(true)
		slot0.my_rank_id:setVisible(false)
	else
		slot0.my_rank_id:setString(slot1.rank)
		slot0.no_rank_label:setVisible(false)
	end

	if not slot1.arena_cluster_role or next(slot1.arena_cluster_role) == nil then
		slot0.no_log_image:setVisible(true)

		slot0.show_list = {}
	else
		slot0.no_log_image:setVisible(false)

		slot0.show_list = slot1.arena_cluster_role
	end

	slot0.rank_scrollview:reloadData()
end

function CrossarenaRankWindow.close_callback(slot0)
	if slot0.rank_scrollview then
		slot0.rank_scrollview:DeleteMe()

		slot0.rank_scrollview = nil
	end

	if slot0.my_head then
		slot0.my_head:DeleteMe()

		slot0.my_head = nil
	end

	uv0:openCrossarenaRankWindow(false)
end

CrossarenaRankItem = class("CrossarenaRankItem", function ()
	return ccui.Widget:create()
end)

function CrossarenaRankItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function CrossarenaRankItem.configUI(slot0)
	slot0.size = cc.size(612, 112)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("crossarena/crossarena_rank_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("main_panel")
	slot0.container = slot2

	slot0.container:setSwallowTouches(false)

	slot0.rank_id = slot2:getChildByName("rank_id")
	slot0.rank_image = slot2:getChildByName("rank_image")

	slot0.rank_image:ignoreContentAdaptWithSize(true)

	slot0.guild_label = slot2:getChildByName("my_guild_label")
	slot0.attk_label = slot2:getChildByName("my_attk_label")
	slot0.name_label = slot2:getChildByName("my_name_label")
	slot0.score_label = slot2:getChildByName("my_score_label")
	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.8)
	slot0.role_head:setPosition(140, 56)
	slot0.role_head:addCallBack(handler(slot0, slot0.openChatMessage))
	slot2:addChild(slot0.role_head)
end

function CrossarenaRankItem.register_event(slot0)
end

function CrossarenaRankItem.openChatMessage(slot0)
	slot1 = RoleController:getInstance():getRoleVo()
	slot2 = slot0.data.rid
	slot3 = slot0.data.srv_id

	if slot0.data.srv_id and slot0.data.srv_id == "robot" then
		message(TI18N("神秘人太高冷，不给查看"))

		return
	end

	if slot2 and slot3 and slot1.rid == slot2 and slot1.srv_id == slot3 then
		message(TI18N("你不认识你自己了么？"))

		return
	end

	if slot0.data then
		ChatController:getInstance():openFriendInfo({
			rid = slot2,
			srv_id = slot3
		}, cc.p(0, 0))
	end
end

function CrossarenaRankItem.setData(slot0, slot1)
	slot1 = slot1 or {}
	slot0.data = slot1

	if slot1.rank == 1 then
		slot0.rank_id:setVisible(false)
		slot0.rank_image:setVisible(true)
		slot0.rank_image:loadTexture(PathTool.getResFrame("common", "common_3001"), LOADTEXT_TYPE_PLIST)
	elseif slot1.rank == 2 then
		slot0.rank_id:setVisible(false)
		slot0.rank_image:setVisible(true)
		slot0.rank_image:loadTexture(PathTool.getResFrame("common", "common_3002"), LOADTEXT_TYPE_PLIST)
	elseif slot1.rank == 3 then
		slot0.rank_id:setVisible(false)
		slot0.rank_image:setVisible(true)
		slot0.rank_image:loadTexture(PathTool.getResFrame("common", "common_3003"), LOADTEXT_TYPE_PLIST)
	else
		slot0.rank_id:setString(slot1.rank)
		slot0.rank_id:setVisible(true)
		slot0.rank_image:setVisible(false)
	end

	slot0.role_head:setHeadRes(slot1.face, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
	slot0.role_head:setLev(slot1.lev)
	slot0.name_label:setString(transformNameByServ(slot1.name, slot1.srv_id))
	slot0.attk_label:setString(slot1.power)

	slot2 = ""

	slot0.guild_label:setString((slot1.gname ~= nil and slot1.gname ~= "" or TI18N("暂未加入公会")) and string.format(TI18N("公会:%s"), slot1.gname))
	slot0.score_label:setString(string.format(TI18N("积分:%d"), slot1.score or 0))
end

function CrossarenaRankItem.DeleteMe(slot0)
	if slot0.role_head then
		slot0.role_head:DeleteMe()

		slot0.role_head = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
