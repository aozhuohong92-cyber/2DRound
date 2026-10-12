slot1 = CrossarenaController:getInstance():getModel()
CrossareanVideoWindow = CrossareanVideoWindow or BaseClass(BaseView)

function CrossareanVideoWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "crossarena/crossarena_video_window"
end

function CrossareanVideoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("win_title"):setString(TI18N("比赛记录"))
	slot1:getChildByName("txt_tips"):setString(TI18N("录像可在详情中查看"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot2 = slot1:getChildByName("list_panel")
	slot0.list_panel = slot2
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 4,
		item_height = 216,
		start_x = 0,
		space_y = 0,
		col = 1,
		space_x = 0,
		need_dynamic = true,
		item_width = 603
	}, cc.p(0, 0))

	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function CrossareanVideoWindow.createNewCell(slot0)
	return CrossareanVideoItem.new()
end

function CrossareanVideoWindow.numberOfCells(slot0)
	if not slot0.video_datas then
		return 0
	end

	return #slot0.video_datas
end

function CrossareanVideoWindow.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.video_datas then
		return
	end

	slot1.index = slot2

	slot1:setData(slot0.video_datas[slot2])
end

function CrossareanVideoWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openCrossarenaVideoWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openCrossarenaVideoWindow(false)
	end, false, 2)
	slot0:addGlobalEvent(CrossarenaEvent.Update_Video_Data_Event, function (slot0)
		if slot0.type == 1 then
			uv0:setData(slot0.arena_cluster_log)
		end
	end)
end

function CrossareanVideoWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.video_datas = slot1

	if #slot0.video_datas == 0 then
		commonShowEmptyIcon(slot0.list_panel, true, {
			text = TI18N("暂无数据")
		})
	else
		commonShowEmptyIcon(slot0.list_panel, false)
	end

	slot0.item_scrollview:reloadData()
end

function CrossareanVideoWindow.openRootWnd(slot0)
	uv0:sender25616(1)
end

function CrossareanVideoWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openCrossarenaVideoWindow(false)
	uv1:updateCrossarenaRedStatus(CrossarenaConst.Red_Index.Record, false)
end

CrossareanVideoItem = class("CrossareanVideoItem", function ()
	return ccui.Widget:create()
end)

function CrossareanVideoItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function CrossareanVideoItem.configUI(slot0)
	slot0.size = cc.size(603, 216)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("crossarena/crossarena_video_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.left_head_pos = slot2:getChildByName("left_head_pos")
	slot0.right_head_pos = slot2:getChildByName("right_head_pos")
	slot0.left_arrow = slot2:getChildByName("left_arrow")
	slot0.right_arrow = slot2:getChildByName("right_arrow")
	slot0.left_result = slot2:getChildByName("left_result")
	slot0.right_result = slot2:getChildByName("right_result")
	slot0.left_srv_name = slot2:getChildByName("left_srv_name")
	slot0.left_name = slot2:getChildByName("left_name")
	slot0.left_score = slot2:getChildByName("left_score")
	slot0.left_level = slot2:getChildByName("left_level")
	slot0.right_srv_name = slot2:getChildByName("right_srv_name")
	slot0.right_name = slot2:getChildByName("right_name")
	slot0.right_score = slot2:getChildByName("right_score")
	slot0.right_level = slot2:getChildByName("right_level")
	slot0.battle_result = slot2:getChildByName("battle_result")

	slot0.battle_result:setString("")

	slot0.time_txt = slot2:getChildByName("time_txt")

	slot2:getChildByName("left_title_score"):setString(TI18N("积分"))
	slot2:getChildByName("left_title_level"):setString(TI18N("等级"))
	slot2:getChildByName("right_title_score"):setString(TI18N("积分"))
	slot2:getChildByName("right_title_level"):setString(TI18N("等级"))

	slot0.btn_detial = slot2:getChildByName("btn_detial")

	if not slot0.left_head then
		slot0.left_head = PlayerHead.new(PlayerHead.type.circle)

		slot0.left_head:setScale(0.8)
		slot0.left_head:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.left_head:setPosition(cc.p(0, 0))
		slot0.left_head_pos:addChild(slot0.left_head)
		slot0.left_head:addCallBack(function ()
			if uv0.data and uv0.data.srv_id and uv0.data.rid and uv0.data.srv_id ~= "" then
				if uv0.data.srv_id == RoleController:getInstance():getRoleVo().srv_id and uv0.data.rid == slot0.rid then
					message(TI18N("你不认识你自己了么？"))
				else
					FriendController:getInstance():openFriendCheckPanel(true, {
						srv_id = uv0.data.srv_id,
						rid = uv0.data.rid
					})
				end
			else
				message(TI18N("来自异域，无法查看"))
			end
		end, false)
	end

	if not slot0.right_head then
		slot0.right_head = PlayerHead.new(PlayerHead.type.circle)

		slot0.right_head:setScale(0.8)
		slot0.right_head:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.right_head:setPosition(cc.p(0, 0))
		slot0.right_head_pos:addChild(slot0.right_head)
		slot0.right_head:addCallBack(function ()
			if uv0.data and uv0.data.def_srv_id and uv0.data.def_rid and uv0.data.def_srv_id ~= "" then
				if uv0.data.def_srv_id == RoleController:getInstance():getRoleVo().srv_id and uv0.data.def_rid == slot0.rid then
					message(TI18N("你不认识你自己了么？"))
				else
					FriendController:getInstance():openFriendCheckPanel(true, {
						srv_id = uv0.data.def_srv_id,
						rid = uv0.data.def_rid
					})
				end
			else
				message(TI18N("来自异域，无法查看"))
			end
		end, false)
	end
end

function CrossareanVideoItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_detial, function ()
		if uv0.data then
			ElitematchController:getInstance():openElitematchFightVedioPanel(true, uv0.data, 1, 2)
		end
	end, true)
end

function CrossareanVideoItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.left_name:setString(slot1.atk_name)

	if getServerName(slot1.srv_id) == "" then
		slot2 = TI18N("异域")
	end

	slot0.left_srv_name:setString("[" .. slot2 .. "]")
	slot0.left_level:setString(slot1.atk_lev)
	slot0.left_score:setString(slot1.atk_score)

	if slot0.left_head then
		slot0.left_head:setHeadRes(slot1.atk_face, false, LOADTEXT_TYPE, slot1.atk_face_file, slot1.atk_face_update_time)
	end

	slot0.right_name:setString(slot1.def_name)

	if getServerName(slot1.def_srv_id) == "" then
		slot3 = TI18N("异域")
	end

	slot0.right_srv_name:setString("[" .. slot3 .. "]")
	slot0.right_level:setString(slot1.def_lev)
	slot0.right_score:setString(slot1.def_score)

	if slot0.right_head then
		slot0.right_head:setHeadRes(slot1.def_face, false, LOADTEXT_TYPE, slot1.def_face_file, slot1.def_face_update_time)
	end

	if slot1.ret == 1 then
		loadSpriteTexture(slot0.left_result, PathTool.getResFrame("common", "txt_cn_common_90012"), LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.right_result, PathTool.getResFrame("common", "txt_cn_common_90013"), LOADTEXT_TYPE_PLIST)
		slot0.left_arrow:setVisible(true)
		slot0.right_arrow:setVisible(true)
		loadSpriteTexture(slot0.left_arrow, PathTool.getResFrame("common", "common_1086"), LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.right_arrow, PathTool.getResFrame("common", "common_1087"), LOADTEXT_TYPE_PLIST)
	else
		loadSpriteTexture(slot0.left_result, PathTool.getResFrame("common", "txt_cn_common_90013"), LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.right_result, PathTool.getResFrame("common", "txt_cn_common_90012"), LOADTEXT_TYPE_PLIST)
		slot0.left_arrow:setVisible(false)
		slot0.right_arrow:setVisible(false)
	end

	slot0.time_txt:setString(TimeTool.getYMDHM(slot1.time))

	if RoleController:getInstance():getRoleVo() then
		if slot4.rid == slot1.rid and slot4.srv_id == slot1.srv_id then
			if slot1.ret == 1 then
				slot0.battle_result:setTextColor(cc.c3b(36, 144, 3))
				slot0.battle_result:setString(TI18N("进攻成功"))
			else
				slot0.battle_result:setTextColor(cc.c3b(217, 80, 20))
				slot0.battle_result:setString(TI18N("进攻失败"))
			end
		elseif slot4.rid == slot1.def_rid and slot4.srv_id == slot1.def_srv_id then
			if slot1.ret == 1 then
				slot0.battle_result:setTextColor(cc.c3b(217, 80, 20))
				slot0.battle_result:setString(TI18N("防守失败"))
			else
				slot0.battle_result:setTextColor(cc.c3b(36, 144, 3))
				slot0.battle_result:setString(TI18N("防守成功"))
			end
		end
	end
end

function CrossareanVideoItem.DeleteMe(slot0)
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
