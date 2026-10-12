ArenaChampionRankWindow = ArenaChampionRankWindow or BaseClass(BaseView)
slot0 = RoleController:getInstance():getRoleVo()
slot1 = string.format

function ArenaChampionRankWindow.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "arena/arena_champion_rank_window"
	slot0.res_list = {}
	slot0.view_type = slot1 or ArenaConst.champion_type.normal

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.ctrl = ArenaController:getInstance()
	else
		slot0.ctrl = CrosschampionController:getInstance()
	end

	slot0.rank_list = {}
end

function ArenaChampionRankWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.item = slot1:getChildByName("item")

	slot0.item:setVisible(false)

	slot2 = slot1:getChildByName("main_panel")

	slot2:getChildByName("win_title"):setString(TI18N("排行榜"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.list_view = slot2:getChildByName("list_view")
	slot0.my_container = slot2:getChildByName("my_container")

	slot0.my_container:getChildByName("my_rank_title"):setString(TI18N("我的排名"))

	slot0.rank_img = slot0.my_container:getChildByName("rank_img")
	slot0.role_name = slot0.my_container:getChildByName("role_name")
	slot0.role_power = slot0.my_container:getChildByName("role_power")
	slot0.my_wish = slot0.my_container:getChildByName("wish_container"):getChildByName("num")
	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(157, 65)
	slot0.role_head:setLev(99)
	slot0.my_container:addChild(slot0.role_head)

	slot0.empty_tips = slot2:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("desc"):setString(TI18N("暂无任何排名"))
end

function ArenaChampionRankWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			ArenaController:getInstance():openArenaChampionRankWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			ArenaController:getInstance():openArenaChampionRankWindow(false)
		end
	end)

	if slot0.update_rank_event == nil then
		slot0.update_rank_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateChampionRankEvent, function (slot0)
			uv0:updateRankListInfo(slot0)
		end)
	end

	if slot0.update_worship_event == nil then
		slot0.update_worship_event = GlobalEvent:getInstance():Bind(RoleEvent.WorshipOtherRole, function (slot0, slot1, slot2)
			if slot2 ~= nil and uv0.select_item ~= nil and uv0.select_item.data ~= nil and slot2 == uv0.select_item.data.rank then
				uv0.select_item:updateWorshipStatus()
			end
		end)
	end
end

function ArenaChampionRankWindow.openRootWnd(slot0)
	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.ctrl:requestChompionRank()
	else
		slot0.ctrl:sender26214()
	end
end

function ArenaChampionRankWindow.updateMyInfo(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = slot1.rank or 0
	slot3 = slot1.worship or 0
	slot5 = uv0.lev
	slot6 = uv0.power
	slot7 = uv0.face_id
	slot8 = uv0.face_file
	slot9 = uv0.face_update_time

	if slot1.rank_list[slot1.rank] then
		slot5 = slot4.lev
		slot6 = slot4.power
		slot7 = slot4.face
		slot8 = slot4.face_file
		slot9 = slot4.face_update_time
	end

	if slot2 <= 3 then
		if slot0.rank_num ~= nil then
			slot0.setVisible(false)
		end

		if slot2 == 0 then
			slot0.rank_img:setVisible(false)
		else
			if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_300%s", slot2)) then
				slot0.rank_res_id = slot10

				loadSpriteTexture(slot0.rank_img, slot10, LOADTEXT_TYPE_PLIST)
			end

			slot0.rank_img:setVisible(true)
		end
	else
		if slot0.rank_num == nil then
			slot0.rank_num = CommonNum.new(17, slot0.my_container, 1, -2, cc.p(0.5, 0.5))

			slot0.rank_num:setPosition(59, 77)
		end

		slot0.rank_num:setVisible(true)
		slot0.rank_num:setNum(slot1.rank)
		slot0.rank_img:setVisible(false)
	end

	if not slot0.my_score_label then
		slot0.my_score_label = createRichLabel(18, 175, cc.p(0.5, 0.5), cc.p(520, 34))

		slot0.my_container:addChild(slot0.my_score_label)
	end

	slot0.my_score_label:setString(uv1("%s<div fontColor=#249003>%s</div>", TI18N("选拔赛分数:"), slot1.score or 0))
	slot0.role_name:setString(uv0.name)
	slot0.role_power:setString(MoneyTool.GetMoneyString(slot6))
	slot0.my_wish:setString(slot3)
	slot0.role_head:setHeadRes(slot7, false, LOADTEXT_TYPE, slot8, slot9)
	slot0.role_head:setLev(slot5)
end

function ArenaChampionRankWindow.updateRankListInfo(slot0, slot1)
	if slot1 == nil or slot1.rank_list == nil then
		return
	end

	slot0:updateMyInfo(slot1)

	if next(slot1.rank_list) == nil then
		slot0.empty_tips:setVisible(true)

		if slot0.scroll_view then
			slot0.scroll_view:setVisible(false)
		end
	else
		slot0.empty_tips:setVisible(false)

		if slot0.scroll_view == nil then
			slot0.scroll_view = CommonScrollViewSingleLayout.new(slot0.list_view, nil, nil, nil, slot0.list_view:getContentSize(), {
				start_y = -4,
				row = 0,
				start_x = 0,
				space_x = 4,
				item_width = 614,
				item_height = 125,
				space_y = -3,
				col = 1,
				need_dynamic = true
			}, cc.p(0, 0))

			slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
			slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
			slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		end

		slot0.scroll_view:setVisible(true)

		slot0.rank_list = slot1.rank_list

		slot0.scroll_view:reloadData()
	end
end

function ArenaChampionRankWindow.createNewCell(slot0)
	if ArenaChampionRankItem.new().setExtendData and slot0.item then
		slot1:setExtendData(slot0.item)
	end

	slot1:addCallBack(function (slot0)
		uv0:worshipOtherRole(slot0)
	end)

	return slot1
end

function ArenaChampionRankWindow.numberOfCells(slot0)
	if not slot0.rank_list then
		return 0
	end

	return #slot0.rank_list
end

function ArenaChampionRankWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.rank_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ArenaChampionRankWindow.worshipOtherRole(slot0, slot1)
	if slot1.data ~= nil then
		slot0.select_item = slot1

		if slot0.view_type == ArenaConst.champion_type.normal then
			RoleController:getInstance():requestWorshipRole(slot1.data.rid, slot1.data.srv_id, slot1.data.rank)
		else
			RoleController:getInstance():requestWorshipRole(slot1.data.rid, slot1.data.srv_id, slot1.data.rank, WorshipType.crosschampion)
		end
	end
end

function ArenaChampionRankWindow.close_callback(slot0)
	if slot0.role_head then
		slot0.role_head:DeleteMe()

		slot0.role_head = nil
	end

	if slot0.rank_num then
		slot0.rank_num:DeleteMe()

		slot0.rank_num = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	if slot0.update_rank_event then
		GlobalEvent:getInstance():UnBind(slot0.update_rank_event)

		slot0.update_rank_event = nil
	end

	if slot0.update_worship_event then
		GlobalEvent:getInstance():UnBind(slot0.update_worship_event)

		slot0.update_worship_event = nil
	end

	ArenaController:getInstance():openArenaChampionRankWindow(false)
end

ArenaChampionRankItem = class("ArenaChampionRankItem", function ()
	return ccui.Layout:create()
end)

function ArenaChampionRankItem.ctor(slot0)
	slot0.is_completed = false
end

function ArenaChampionRankItem.setExtendData(slot0, slot1)
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

		slot0.rank_img = slot0.root_wnd:getChildByName("rank_img")
		slot0.wish_container = slot0.root_wnd:getChildByName("wish_container")
		slot0.wish_num = slot0.wish_container:getChildByName("num")

		slot0.wish_num:setString("")

		slot0.role_name = slot0.root_wnd:getChildByName("role_name")
		slot0.role_power = slot0.root_wnd:getChildByName("role_power")
		slot0.power_bg = slot0.root_wnd:getChildByName("Image_1")

		slot0.rank_img:ignoreContentAdaptWithSize(true)

		slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

		slot0.role_head:setHeadLayerScale(0.95)
		slot0.role_head:setPosition(157, 65)
		slot0.root_wnd:addChild(slot0.role_head)
		slot0.role_head:setLev(99)

		slot0.score_label = createRichLabel(18, 175, cc.p(1, 0.5), cc.p(588, 34))

		slot0.root_wnd:addChild(slot0.score_label)
		slot0:registerEvent()
	end
end

function ArenaChampionRankItem.registerEvent(slot0)
	slot0.role_head:addCallBack(function ()
		if uv0.data ~= nil and uv0.data.srv_id ~= "" then
			if uv0.data.srv_id == "robot" then
				message(TI18N("神秘人太高冷，不给查看"))
			else
				FriendController:getInstance():openFriendCheckPanel(true, {
					srv_id = uv0.data.srv_id,
					rid = uv0.data.rid
				})
			end
		end
	end, false)
	slot0.wish_container:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data ~= nil and uv0.call_back ~= nil then
				uv0:call_back()
			end
		end
	end)
end

function ArenaChampionRankItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function ArenaChampionRankItem.setData(slot0, slot1)
	if slot1 then
		slot0.data = slot1

		slot0.role_name:setString(transformNameByServ(slot1.name, slot1.srv_id))
		slot0.role_power:setString(slot1.power)
		slot0.power_bg:setContentSize(cc.size(slot0.role_power:getContentSize().width + 75, slot0.power_bg:getContentSize().height))
		slot0.role_head:setHeadRes(slot1.face, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
		slot0.role_head:setLev(slot1.lev)
		slot0.wish_num:setString(slot1.worship)

		if slot1.worship_status == TRUE or uv0:isSameRole(slot1.srv_id, slot1.rid) then
			slot0.wish_container:setTouchEnabled(false)
			setChildUnEnabled(true, slot0.wish_container, Config.ColorData.data_color4[1])
			slot0.wish_num:enableOutline(Config.ColorData.data_color4[2], 2)
		else
			slot0.wish_container:setTouchEnabled(true)
			setChildUnEnabled(false, slot0.wish_container, Config.ColorData.data_color4[175])
			slot0.wish_num:enableOutline(Config.ColorData.data_color4[277], 2)
		end

		if slot1.rank <= 3 then
			if slot0.rank_num ~= nil then
				slot0.rank_num:setVisible(false)
			end

			if slot1.rank == 0 then
				slot0.rank_img:setVisible(false)
			else
				if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_300%s", slot1.rank)) then
					slot0.rank_res_id = slot4

					slot0.rank_img:loadTexture(slot4, LOADTEXT_TYPE_PLIST)
				end

				slot0.rank_img:setVisible(true)
			end
		else
			if slot0.rank_num == nil then
				slot0.rank_num = CommonNum.new(17, slot0.root_wnd, 1, -2, cc.p(0.5, 0.5))

				slot0.rank_num:setPosition(59, 77)
			end

			slot0.rank_num:setVisible(true)
			slot0.rank_num:setNum(slot1.rank)
			slot0.rank_img:setVisible(false)
		end

		slot0.score_label:setString(uv1("%s<div fontColor=#249003>%s</div>", TI18N("选拔赛分数:"), slot1.score))
	end
end

function ArenaChampionRankItem.updateWorshipStatus(slot0)
	if slot0.data ~= nil then
		slot0.data.worship = slot0.data.worship + 1
		slot0.data.worship_status = TRUE

		slot0.wish_num:setString(slot0.data.worship)
		slot0.wish_container:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.wish_container, Config.ColorData.data_color4[1])
		slot0.wish_num:enableOutline(Config.ColorData.data_color4[2], 2)
	end
end

function ArenaChampionRankItem.DeleteMe(slot0)
	if slot0.role_head then
		slot0.role_head:DeleteMe()

		slot0.role_head = nil
	end

	if slot0.rank_num then
		slot0.rank_num:DeleteMe()

		slot0.rank_num = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
