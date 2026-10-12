ArenaChampionCurRankPanel = class("ArenaChampionCurRankPanel", function ()
	return ccui.Layout:create()
end)
slot0 = table.insert
slot1 = RoleController:getInstance():getRoleVo()
slot2 = string.format

function ArenaChampionCurRankPanel.ctor(slot0, slot1)
	slot0.role_list = {}
	slot0.scroll_list = {}
	slot0.view_type = slot1 or ArenaConst.champion_type.normal

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.ctrl = ArenaController:getInstance()
	else
		slot0.ctrl = CrosschampionController:getInstance()
	end

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/arena_champion_cur_rank_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot3 = slot0.root_wnd:getChildByName("container"):getChildByName("main_panel")
	slot4 = slot3:getChildByName("backpack")

	slot4:setContentSize(cc.size(SCREEN_WIDTH, slot4:getContentSize().height))

	slot0.list_view = slot3:getChildByName("list_view")
	slot0.good_cons = slot3:getChildByName("good_cons")
	slot0.item = slot3:getChildByName("item")

	slot0.item:setVisible(false)

	slot0.my_container = slot3:getChildByName("my_container")

	slot0.my_container:getChildByName("my_rank_title"):setString(TI18N("我的排名"))

	slot0.rank_img = slot0.my_container:getChildByName("rank_img")
	slot0.role_name = slot0.my_container:getChildByName("role_name")
	slot0.role_power = slot0.my_container:getChildByName("role_power")
	slot0.my_wish = slot0.my_container:getChildByName("wish_container"):getChildByName("num")
	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setPosition(190, 70)
	slot0.role_head:setLev(99)
	slot0.my_container:addChild(slot0.role_head)

	slot0.empty_tips = slot3:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("desc"):setString(TI18N("暂无任何排名"))
end

function ArenaChampionCurRankPanel.addToParent(slot0, slot1)
	slot0:setVisible(slot1)
	slot0:handEvent(slot1)

	if slot1 == true and slot0.scroll_view == nil then
		if slot0.view_type == ArenaConst.champion_type.normal then
			slot0.ctrl:requestChompionRank()
		else
			slot0.ctrl:sender26214()
		end
	end
end

function ArenaChampionCurRankPanel.handEvent(slot0, slot1)
	if slot1 == true then
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
	else
		if slot0.update_rank_event then
			GlobalEvent:getInstance():UnBind(slot0.update_rank_event)

			slot0.update_rank_event = nil
		end

		if slot0.update_worship_event then
			GlobalEvent:getInstance():UnBind(slot0.update_worship_event)

			slot0.update_worship_event = nil
		end
	end
end

function ArenaChampionCurRankPanel.updateMyInfo(slot0, slot1)
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
		slot0.my_score_label = createRichLabel(18, 175, cc.p(0.5, 0.5), cc.p(590, 34))

		slot0.my_container:addChild(slot0.my_score_label)
	end

	slot0.my_score_label:setString(uv1("%s<div fontColor=#249003>%s</div>", TI18N("选拔赛分数:"), slot1.score or 0))
	slot0.role_name:setString(uv0.name)
	slot0.role_power:setString(MoneyTool.GetMoneyString(slot6))
	slot0.my_wish:setString(slot3)
	slot0.role_head:setHeadRes(slot7, false, LOADTEXT_TYPE, slot8, slot9)
	slot0.role_head:setLev(slot5)
end

function ArenaChampionCurRankPanel.updateRankListInfo(slot0, slot1)
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
			slot0.scroll_view = CommonScrollViewSingleLayout.new(slot0.good_cons, nil, , , slot0.good_cons:getContentSize(), {
				start_y = 0,
				row = 0,
				start_x = 4,
				space_x = 0,
				item_width = 680,
				item_height = 140,
				space_y = 0,
				col = 1,
				need_dynamic = true
			}, cc.p(0, 0))

			slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
			slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
			slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		end

		slot0.scroll_view:setVisible(true)

		slot0.scroll_list = slot1.rank_list

		slot0.scroll_view:reloadData()
	end
end

function ArenaChampionCurRankPanel.createNewCell(slot0)
	if ArenaChampionCurRankItem.new().setExtendData and slot0.item then
		slot1:setExtendData(slot0.item)
	end

	slot1:addCallBack(function (slot0)
		uv0:worshipOtherRole(slot0)
	end)

	return slot1
end

function ArenaChampionCurRankPanel.numberOfCells(slot0)
	if not slot0.scroll_list then
		return 0
	end

	return #slot0.scroll_list
end

function ArenaChampionCurRankPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.scroll_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ArenaChampionCurRankPanel.worshipOtherRole(slot0, slot1)
	if slot1.data ~= nil then
		slot0.select_item = slot1

		if slot0.view_type == ArenaConst.champion_type.normal then
			RoleController:getInstance():requestWorshipRole(slot1.data.rid, slot1.data.srv_id, slot1.data.rank)
		else
			RoleController:getInstance():requestWorshipRole(slot1.data.rid, slot1.data.srv_id, slot1.data.rank, WorshipType.crosschampion)
		end
	end
end

function ArenaChampionCurRankPanel.DeleteMe(slot0)
	slot0:handEvent(false)

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
	end

	slot0.scroll_view = nil
end

ArenaChampionCurRankItem = class("ArenaChampionCurRankItem", function ()
	return ccui.Layout:create()
end)

function ArenaChampionCurRankItem.ctor(slot0)
	slot0.is_completed = false
end

function ArenaChampionCurRankItem.setExtendData(slot0, slot1)
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

		slot0.role_head:setPosition(190, 70)
		slot0.root_wnd:addChild(slot0.role_head)
		slot0.role_head:setLev(99)

		slot0.score_label = createRichLabel(18, 175, cc.p(1, 0.5), cc.p(658, 30))

		slot0.root_wnd:addChild(slot0.score_label)
		slot0:registerEvent()
	end
end

function ArenaChampionCurRankItem.registerEvent(slot0)
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

function ArenaChampionCurRankItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function ArenaChampionCurRankItem.setData(slot0, slot1)
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
			slot0.wish_num:enableOutline(Config.ColorData.data_color4[2], 2)
			setChildUnEnabled(true, slot0.wish_container, Config.ColorData.data_color4[1])
		else
			slot0.wish_container:setTouchEnabled(true)
			slot0.wish_num:enableOutline(Config.ColorData.data_color4[277], 2)
			setChildUnEnabled(false, slot0.wish_container, Config.ColorData.data_color4[175])
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

				slot0.rank_num:setPosition(72, 77)
			end

			slot0.rank_num:setVisible(true)
			slot0.rank_num:setNum(slot1.rank)
			slot0.rank_img:setVisible(false)
		end

		slot0.score_label:setString(uv1("%s:<div fontColor=#249003>%s</div>", TI18N("选拔赛分数"), slot1.score))
	end
end

function ArenaChampionCurRankItem.updateWorshipStatus(slot0)
	if slot0.data ~= nil then
		slot0.data.worship = slot0.data.worship + 1
		slot0.data.worship_status = TRUE

		slot0.wish_num:setString(slot0.data.worship)
		slot0.wish_container:setTouchEnabled(false)
		slot0.wish_num:enableOutline(Config.ColorData.data_color4[2], 2)
		setChildUnEnabled(true, slot0.wish_container, Config.ColorData.data_color4[1])
	end
end

function ArenaChampionCurRankItem.DeleteMe(slot0)
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
