slot1 = HomeworldController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
HomeworldVisitWindow = HomeworldVisitWindow or BaseClass(BaseView)

function HomeworldVisitWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "homeworld/homeworld_visit_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("homeworld", "homeworld"),
			type = ResourcesType.plist
		}
	}
end

function HomeworldVisitWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot1:getChildByName("win_title"):setString(TI18N("拜访信息"))
	slot1:getChildByName("tips_label"):setString(TI18N("随机拜访可访问跨服的玩家，来看看跨服的玩家是如何装扮家园的吧！"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.image_3 = slot1:getChildByName("image_3")
	slot0.list_panel = slot1:getChildByName("list_panel")
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.list_panel, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.list_panel:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 602,
		item_height = 123,
		space_y = 3,
		col = 1,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot0.rank_panel = slot1:getChildByName("rank_panel")

	slot0.rank_panel:getChildByName("rank_title"):setString(TI18N("我的排名"))
	slot0.rank_panel:getChildByName("rank_title_1"):setString(TI18N("排名"))
	slot0.rank_panel:getChildByName("rank_title_2"):setString(TI18N("玩家名称"))
	slot0.rank_panel:getChildByName("rank_title_3"):setString(TI18N("本周人气"))

	slot0.explain_btn = slot0.rank_panel:getChildByName("explain_btn")
	slot4 = slot0.rank_panel:getChildByName("rank_list")
	slot0.rank_scrollview = CommonScrollViewSingleLayout.new(slot4, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot4:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 602,
		item_height = 123,
		space_y = 3,
		col = 1,
		need_dynamic = true
	})

	slot0.rank_scrollview:setSwallowTouches(false)
	slot0.rank_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewRankCell), ScrollViewFuncType.CreateNewCell)
	slot0.rank_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfRankCells), ScrollViewFuncType.NumberOfCells)
	slot0.rank_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateRankCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot8 = slot1:getChildByName("btn_panel"):getContentSize()
	slot0.sub_tab_array = {
		{
			index = 2,
			title = TI18N("拜访好友")
		},
		{
			index = 3,
			title = TI18N("随机拜访")
		},
		{
			index = 1,
			title = TI18N("访客记录")
		},
		{
			index = 4,
			title = TI18N("本周排行")
		}
	}

	if not slot0.sub_tab_scrollview then
		slot9 = slot7:getContentSize()
		slot0.sub_tab_scrollview = CommonSubBtnList.new(slot7, cc.p(0.5, 0.5), cc.p(slot9.width * 0.5, slot9.height * 0.5), cc.size(142, 50), handler(slot0, slot0._onClickSubTabBtn))
	end

	slot0.sub_tab_scrollview:setData(slot0.sub_tab_array, 2)
end

function HomeworldVisitWindow._createNewCell(slot0)
	return HomeworldVisitItem.new()
end

function HomeworldVisitWindow._numberOfCells(slot0)
	if not slot0.show_data then
		return 0
	end

	return #slot0.show_data
end

function HomeworldVisitWindow._updateCellByIndex(slot0, slot1, slot2)
	if not slot0.show_data then
		return
	end

	slot1.index = slot2

	if not slot0.show_data[slot2] then
		return
	end

	slot1:setData(slot3, slot0.cur_tab_index)
end

function HomeworldVisitWindow._createNewRankCell(slot0)
	return HomeworldRankItem.new()
end

function HomeworldVisitWindow._numberOfRankCells(slot0)
	if not slot0.rank_data then
		return 0
	end

	return #slot0.rank_data
end

function HomeworldVisitWindow._updateRankCellByIndex(slot0, slot1, slot2)
	if not slot0.rank_data then
		return
	end

	slot1.index = slot2

	if not slot0.rank_data[slot2] then
		return
	end

	slot1:setData(slot3, slot0.cur_tab_index)
end

function HomeworldVisitWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHomeworldVisitWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHomeworldVisitWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1, slot2)
		if Config.HomeData.data_const.rank_tips then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end, true, 1, nil, 0.8)
	slot0:addGlobalEvent(HomeworldEvent.Get_My_Home_Visiter_Event, function (slot0)
		uv0.visit_data = slot0 or {}

		uv0:updateList()
	end)
	slot0:addGlobalEvent(HomeworldEvent.Get_Random_Visiter_Event, function (slot0)
		uv0.random_data = slot0 or {}

		uv0:updateList()
	end)
	slot0:addGlobalEvent(HomeworldEvent.Update_Left_Worship_Num, function ()
		uv0:updateWorshipNum()
	end)
	slot0:addGlobalEvent(HomeworldEvent.Get_Rank_Data_Event, function (slot0)
		uv0:updateRankList(slot0)
	end)
	slot0:addGlobalEvent(HomeworldEvent.Update_Red_Status_Data, function (slot0, slot1)
		if slot0 == HomeworldConst.Red_Index.Visit then
			uv0:updateVisitRedStatus()
		end
	end)
end

function HomeworldVisitWindow.openRootWnd(slot0)
	slot0:updateVisitRedStatus()
	slot0:updateWorshipNum()
end

function HomeworldVisitWindow.updateWorshipNum(slot0)
	if not slot0.left_worship_num then
		slot0.left_worship_num = createRichLabel(22, 274, cc.p(0, 0.5), cc.p(35, 782))

		slot0.main_container:addChild(slot0.left_worship_num)
	end

	if Config.HomeData.data_const.day_praise_limit then
		slot0.left_worship_num:setString(uv1(TI18N("今日可点赞次数:<div fontcolor=#249003>%d</div>/%d"), uv0:getLeftWorshipNum(), slot1.val))
	end
end

function HomeworldVisitWindow._onClickSubTabBtn(slot0, slot1)
	if slot0.cur_tab_index and slot0.cur_tab_index == slot1 then
		return
	end

	slot0.cur_tab_index = slot1

	slot0.image_3:setVisible(slot1 ~= 4)
	slot0.list_panel:setVisible(slot1 ~= 4)
	slot0.rank_panel:setVisible(slot1 == 4)
	commonShowEmptyIcon(slot0.main_container, false)

	if slot1 == 1 then
		if not slot0.visit_flag then
			slot0.visit_flag = true

			uv0:sender26010()
		else
			slot0:updateList()
		end

		uv1:updateHomeworldRedStatus(HomeworldConst.Red_Index.Visit, false)
	elseif slot1 == 2 then
		if not slot0.friend_flag then
			slot0.friend_flag = true
			slot0.friend_data = FriendController:getInstance():getModel():getOpenHomeFriendList()
		end

		slot0:updateList()
	elseif slot1 == 3 then
		if not slot0.random_flag then
			slot0.random_flag = true

			uv0:sender26009()
		else
			slot0:updateList()
		end
	elseif slot1 == 4 and not slot0.rank_flag then
		slot0.rank_flag = true

		slot0:updateRankList()
		uv0:sender26020()
	end
end

function HomeworldVisitWindow.updateList(slot0)
	commonShowEmptyIcon(slot0.rank_panel, false)

	slot0.show_data = {}
	slot1 = ""

	if slot0.cur_tab_index == 1 then
		slot0.show_data = slot0.visit_data or {}
		slot1 = TI18N("家园近期暂无访客")
	elseif slot0.cur_tab_index == 2 then
		slot0.show_data = slot0.friend_data or {}
		slot1 = TI18N("暂无可拜访的好友，快去添加好友吧")
	elseif slot0.cur_tab_index == 3 then
		slot0.show_data = slot0.random_data or {}
		slot1 = TI18N("暂无可拜访的对象")
	end

	slot0.item_scrollview:reloadData()

	if next(slot0.show_data) == nil then
		commonShowEmptyIcon(slot0.main_container, true, {
			text = slot1
		})
	else
		commonShowEmptyIcon(slot0.main_container, false)
	end
end

function HomeworldVisitWindow.updateRankList(slot0, slot1)
	slot1 = slot1 or {}

	if not slot0.my_rank_txt then
		slot0.my_rank_txt = createLabel(26, 274, nil, 90, 136, nil, slot0.rank_panel, nil, cc.p(0.5, 0.5))
	end

	if not slot1.my_rank or slot1.my_rank == 0 then
		slot0.my_rank_txt:setString(TI18N("未上榜"))
	else
		slot0.my_rank_txt:setString(slot1.my_rank)
	end

	if not slot0.my_head_icon then
		slot0.my_head_icon = PlayerHead.new(PlayerHead.type.circle)

		slot0.my_head_icon:setScale(0.8)
		slot0.my_head_icon:setPosition(194, 136)
		slot0.rank_panel:addChild(slot0.my_head_icon)
	end

	if RoleController:getInstance():getRoleVo().face_id then
		slot0.my_head_icon:setHeadRes(slot2.face_id, false, LOADTEXT_TYPE, slot2.face_file, slot2.face_update_time)
	end

	if slot2.lev then
		slot0.my_head_icon:setLev(slot2.lev)
	end

	if not slot0.my_name_txt then
		slot0.my_name_txt = createLabel(22, 274, nil, 238, 136, nil, slot0.rank_panel, nil, cc.p(0, 0.5))
	end

	slot0.my_name_txt:setString(slot2.name)

	if not slot0.my_soft_txt then
		slot0.my_soft_txt = createRichLabel(24, cc.c4b(149, 83, 34, 255), cc.p(0.5, 0.5), cc.p(480, 136))

		slot0.rank_panel:addChild(slot0.my_soft_txt)
	end

	slot0.my_soft_txt:setString(uv0("<img src='%s' scale=1.0 /> %d", PathTool.getResFrame("homeworld", "homeworld_1062"), slot1.my_score or 0))

	slot0.rank_data = slot1.rank_list or {}

	slot0.rank_scrollview:reloadData()

	if slot1.rank_list and next(slot1.rank_list) ~= nil then
		commonShowEmptyIcon(slot0.rank_panel, false)
	else
		commonShowEmptyIcon(slot0.rank_panel, true, {
			text = TI18N("暂无排行信息")
		})
	end
end

function HomeworldVisitWindow.updateVisitRedStatus(slot0)
	slot0.sub_tab_scrollview:setBtnRedStatus(1, uv0:getRedStatusById(HomeworldConst.Red_Index.Visit))
end

function HomeworldVisitWindow.close_callback(slot0)
	if slot0.sub_tab_scrollview then
		slot0.sub_tab_scrollview:DeleteMe()

		slot0.sub_tab_scrollview = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.rank_scrollview then
		slot0.rank_scrollview:DeleteMe()

		slot0.rank_scrollview = nil
	end

	if slot0.my_head_icon then
		slot0.my_head_icon:DeleteMe()

		slot0.my_head_icon = nil
	end

	uv0:openHomeworldVisitWindow(false)
end

HomeworldVisitItem = class("HomeworldVisitItem", function ()
	return ccui.Widget:create()
end)

function HomeworldVisitItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HomeworldVisitItem.configUI(slot0)
	slot0.size = cc.size(602, 123)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("homeworld/homeworld_visit_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.visit_btn = slot0.container:getChildByName("visit_btn")

	slot0.visit_btn:getChildByName("label"):setString(TI18N("拜访Ta"))

	slot0.head_icon = PlayerHead.new(PlayerHead.type.circle)

	slot0.head_icon:setPosition(64, slot0.size.height / 2)
	slot0.container:addChild(slot0.head_icon)
	slot0.head_icon:addCallBack(function ()
		if uv0.data and uv0.data.srv_id and uv0.data.rid then
			if uv0.data.srv_id == RoleController:getInstance():getRoleVo().srv_id and uv0.data.rid == slot0.rid then
				message(TI18N("你不认识你自己了么？"))
			else
				FriendController:getInstance():openFriendCheckPanel(true, {
					srv_id = uv0.data.srv_id,
					rid = uv0.data.rid
				})
			end
		end
	end)
end

function HomeworldVisitItem.register_event(slot0)
	registerButtonEventListener(slot0.visit_btn, function ()
		if uv0.data and uv0.data.rid and uv0.data.srv_id then
			if uv1:checkHomeIsSameByRidAndSrvId(uv0.data.rid, uv0.data.srv_id) then
				message(TI18N("你已经在TA的家园啦"))
			else
				uv1:sender26003(uv0.data.rid, uv0.data.srv_id)
				uv1:openHomeworldVisitWindow(false)
			end
		end
	end, true)
end

function HomeworldVisitItem.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot1.face_id or slot1.face then
		slot0.head_icon:setHeadRes(slot3, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
	end

	if slot1.lev then
		slot0.head_icon:setLev(slot1.lev)
	end

	if not slot0.comfort_txt then
		slot0.comfort_txt = createRichLabel(24, 183, cc.p(0, 0.5))

		slot0.container:addChild(slot0.comfort_txt)
	end

	slot4 = transformNameByServ(slot1.name, slot1.srv_id) or ""

	if slot2 == 1 then
		if not slot0.visit_desc then
			slot0.visit_desc = createRichLabel(20, cc.c4b(21, 126, 34, 255), cc.p(0, 1), cc.p(122, 100), 5, nil, 380)

			slot0.container:addChild(slot0.visit_desc)
		end

		slot5 = uv0(TI18N("<div fontcolor=643223>好友玩家</div><div fontcolor=157e22>%s</div><div fontcolor=643223>拜访了你的房间</div>"), slot4)

		if not FriendController:getInstance():isFriend(slot1.srv_id, slot1.rid) then
			slot5 = uv0(TI18N("<div fontcolor=643223>非好友玩家</div><div fontcolor=157e22>%s</div><div fontcolor=643223>拜访了你的房间</div>"), slot4)
		end

		slot0.visit_desc:setString(slot5)
		slot0.visit_desc:setVisible(true)

		if not slot0.visit_time then
			slot0.visit_time = createLabel(20, cc.c4b(120, 80, 70, 255), nil, 122, 30, nil, slot0.container, nil, cc.p(0, 0.5))
		end

		slot0.visit_time:setString(TimeTool.getYMDHMS(slot1.time))
		slot0.visit_time:setVisible(true)

		slot6 = 0

		if slot1.int_args and next(slot1.int_args) ~= nil then
			for slot10, slot11 in pairs(slot1.int_args) do
				if slot11.key == 1 then
					slot6 = slot11.val

					break
				end
			end
		end

		if not slot6 or slot6 == 0 then
			slot0.comfort_txt:setVisible(false)
		else
			slot0.comfort_txt:setString(uv0("<img src='%s' scale=0.8 /> <div fontsize=20> %d</div>", PathTool.getResFrame("homeworld", "homeworld_1021"), slot6))
			slot0.comfort_txt:setPosition(cc.p(360, 30))
			slot0.comfort_txt:setVisible(true)
		end

		if slot0.name_txt then
			slot0.name_txt:setVisible(false)
		end

		if slot0.power_txt then
			slot0.power_txt:setVisible(false)
		end

		if slot0.onlinetime_txt then
			slot0.onlinetime_txt:setVisible(false)
		end
	else
		if not slot0.name_txt then
			slot0.name_txt = createLabel(24, 274, nil, 122, 85, nil, slot0.container, nil, cc.p(0, 0.5))
		end

		slot0.name_txt:setString(slot4)
		slot0.name_txt:setVisible(true)

		if not slot0.power_txt then
			slot0.power_txt = createLabel(22, cc.c4b(155, 67, 9, 255), nil, 122, 48, nil, slot0.container, nil, cc.p(0, 0.5))
		end

		slot0.power_txt:setString(uv0(TI18N("战力:%d"), slot1.power or 0))
		slot0.power_txt:setVisible(true)

		if not slot0.onlinetime_txt then
			slot0.onlinetime_txt = createLabel(22, cc.c4b(155, 67, 9, 255), nil, 322, 48, nil, slot0.container, nil, cc.p(0, 0.5))
		end

		slot0.onlinetime_txt:setString(TimeTool.GetTimeFormatFriendShowTime(GameNet:getInstance():getTime() - (slot1.last_login or slot1.login_time or 0)))
		slot0.onlinetime_txt:setVisible(true)

		if not slot1.soft or slot1.soft == 0 then
			slot0.comfort_txt:setVisible(false)
		else
			slot0.comfort_txt:setString(uv0("<img src='%s' scale=1.0 /> <div fontsize=24> %d</div>", PathTool.getResFrame("homeworld", "homeworld_1021"), slot1.soft))
			slot0.comfort_txt:setPosition(cc.p(322, 85))
			slot0.comfort_txt:setVisible(true)
		end

		if slot0.visit_desc then
			slot0.visit_desc:setVisible(false)
		end

		if slot0.visit_time then
			slot0.visit_time:setVisible(false)
		end
	end
end

function HomeworldVisitItem.DeleteMe(slot0)
	if slot0.head_icon then
		slot0.head_icon:DeleteMe()

		slot0.head_icon = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

HomeworldRankItem = class("HomeworldRankItem", function ()
	return ccui.Widget:create()
end)

function HomeworldRankItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HomeworldRankItem.configUI(slot0)
	slot0.size = cc.size(602, 123)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("homeworld/homeworld_visit_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.visit_btn = slot0.container:getChildByName("visit_btn")

	slot0.visit_btn:getChildByName("label"):setString(TI18N("拜访Ta"))

	slot0.head_icon = PlayerHead.new(PlayerHead.type.circle)

	slot0.head_icon:setScale(0.8)
	slot0.head_icon:setPosition(144, slot0.size.height / 2)
	slot0.container:addChild(slot0.head_icon)
	slot0.head_icon:addCallBack(function ()
		if uv0.data and uv0.data.srv_id and uv0.data.rid then
			if uv0.data.srv_id == RoleController:getInstance():getRoleVo().srv_id and uv0.data.rid == slot0.rid then
				message(TI18N("你不认识你自己了么？"))
			else
				FriendController:getInstance():openFriendCheckPanel(true, {
					srv_id = uv0.data.srv_id,
					rid = uv0.data.rid
				})
			end
		end
	end)
end

function HomeworldRankItem.register_event(slot0)
	registerButtonEventListener(slot0.visit_btn, function ()
		if uv0.data and uv0.data.rid and uv0.data.srv_id then
			if uv1:checkHomeIsSameByRidAndSrvId(uv0.data.rid, uv0.data.srv_id) then
				message(TI18N("你已经在TA的家园啦"))
			else
				uv1:sender26003(uv0.data.rid, uv0.data.srv_id)
				uv1:openHomeworldVisitWindow(false)
			end
		end
	end, true)
end

function HomeworldRankItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot1.rank and slot1.rank >= 1 and slot1.rank <= 3 then
		if not slot0.rank_icon then
			slot0.rank_icon = createImage(slot0.container, nil, 50, slot0.size.height / 2, cc.p(0.5, 0.5), true, 1, false)

			slot0.rank_icon:setScale(0.7)
		end

		slot0.rank_icon:loadTexture(PathTool.getResFrame("common", "common_200" .. slot1.rank), LOADTEXT_TYPE_PLIST)
		slot0.rank_icon:setVisible(true)

		if slot0.rank_txt then
			slot0.rank_txt:setVisible(false)
		end
	elseif slot1.rank then
		if not slot0.rank_txt then
			slot0.rank_txt = createLabel(26, 274, nil, 50, slot0.size.height / 2, nil, slot0.container, nil, cc.p(0.5, 0.5))
		end

		slot0.rank_txt:setString(slot1.rank or 0)
		slot0.rank_txt:setVisible(true)

		if slot0.rank_icon then
			slot0.rank_icon:setVisible(false)
		end
	end

	if slot1.face then
		slot0.head_icon:setHeadRes(slot1.face, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
	end

	if slot1.lev then
		slot0.head_icon:setLev(slot1.lev)
	end

	if not slot0.name_txt then
		slot0.name_txt = createLabel(22, 274, nil, 192, slot0.size.height / 2, nil, slot0.container, nil, cc.p(0, 0.5))
	end

	slot0.name_txt:setString(transformNameByServ(slot1.name, slot1.srv_id))

	if not slot0.soft_txt then
		slot0.soft_txt = createRichLabel(24, cc.c4b(149, 83, 34, 255), cc.p(0.5, 0.5), cc.p(442, slot0.size.height / 2))

		slot0.container:addChild(slot0.soft_txt)
	end

	slot0.soft_txt:setString(uv0("<img src='%s' scale=1.0 /> %d", PathTool.getResFrame("homeworld", "homeworld_1062"), slot1.score or 0))
end

function HomeworldRankItem.DeleteMe(slot0)
	if slot0.head_icon then
		slot0.head_icon:DeleteMe()

		slot0.head_icon = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
