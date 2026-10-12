ArenaLoopRankPanel = class("ArenaLoopRankPanel", function ()
	return ccui.Layout:create()
end)
slot0 = ArenaController:getInstance()
slot1 = ArenaController:getInstance():getModel()

function ArenaLoopRankPanel.ctor(slot0)
	slot0.is_init = true
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/arena_loop_rank_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.scroll_container = slot0.root_wnd:getChildByName("scroll_container")
	slot1 = slot0.scroll_container:getContentSize()
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.scroll_container, cc.p(0, 10), nil, , cc.size(slot1.width, slot1.height - 20), {
		start_y = 0,
		item_width = 614,
		start_x = 4,
		space_x = 4,
		row = 0,
		item_height = 125,
		space_y = 4,
		col = 1,
		need_dynamic = true,
		item_class = ArenaLoopRankItem
	})
	slot3 = slot0.root_wnd:getChildByName("my_container")
	slot4 = slot3:getChildByName("my_rank_title")
	slot0.rank_img = slot3:getChildByName("rank_img")

	slot0.rank_img:setVisible(false)

	slot0.rank_x = slot0.rank_img:getPositionX()
	slot0.rank_y = slot0.rank_img:getPositionY()
	slot0.wish_num = slot3:getChildByName("wish_container"):getChildByName("num")
	slot0.role_name = slot3:getChildByName("role_name")
	slot0.role_power = slot3:getChildByName("role_power")
	slot0.power_bg = slot3:getChildByName("Image_1")
	slot0.my_score_info = createRichLabel(20, 175, cc.p(0.5, 0.5), cc.p(520, 38), nil, , 300)

	slot3:addChild(slot0.my_score_info)

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(150, 65)
	slot0.role_head:setLev(99)
	slot3:addChild(slot0.role_head)

	slot0.my_container = slot3

	slot0:registerEvent()
end

function ArenaLoopRankPanel.registerEvent(slot0)
	if slot0.update_rank_event == nil then
		slot0.update_rank_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateLoopChallengeRank, function (slot0)
			uv0:updateRankList(slot0)
		end)
	end

	if slot0.update_worship_event == nil then
		slot0.update_worship_event = GlobalEvent:getInstance():Bind(RoleEvent.WorshipOtherRole, function (slot0, slot1, slot2)
			if slot2 ~= nil and uv0.select_item ~= nil and uv0.select_item.data ~= nil and slot2 == uv0.select_item.data.rank then
				uv0.select_item:updateWorshipStatus()
			end
		end)
	end

	if slot0.arena_fight_result_evetn == nil then
		slot0.arena_fight_result_evetn = GlobalEvent:getInstance():Bind(ArenaEvent.ArenaFightResultEvent, function ()
			uv0.is_init = true
		end)
	end
end

function ArenaLoopRankPanel.setNodeVisible(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 then
		slot0:addToParent()
	end
end

function ArenaLoopRankPanel.addToParent(slot0)
	if slot0.is_init == true then
		ArenaController:getInstance():requestLoopChalllengeRank()

		slot0.is_init = false
	end
end

function ArenaLoopRankPanel.updatePanelInfo(slot0, slot1)
end

function ArenaLoopRankPanel.updateRankList(slot0, slot1)
	slot2 = RoleController:getInstance():getRoleVo()

	if slot1 and slot2 then
		slot0.role_name:setString(slot2.name)
		slot0.role_power:setString(slot2.power)
		slot0.power_bg:setContentSize(cc.size(slot0.role_power:getContentSize().width + 75, slot0.power_bg:getContentSize().height))
		slot0.wish_num:setString(slot1.worship)

		if slot1.rank and slot1.rank <= 3 then
			if slot0.rank_num ~= nil then
				slot0.rank_num:setVisible(false)
			end

			if slot1.rank == 0 then
				slot0.rank_img:setVisible(false)
			else
				if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot1.rank)) then
					slot0.rank_res_id = slot5

					loadSpriteTexture(slot0.rank_img, slot5, LOADTEXT_TYPE_PLIST)
				end

				slot0.rank_img:setVisible(true)
			end
		else
			if slot0.rank_num == nil then
				slot0.rank_num = CommonNum.new(1, slot0.my_container, 1, -2, cc.p(0.5, 0.5))

				slot0.rank_num:setPosition(59, 77)
			end

			slot0.rank_num:setVisible(true)
			slot0.rank_num:setNum(slot1.rank)
			slot0.rank_img:setVisible(false)
		end

		if uv0:getZoneConfig() ~= nil then
			slot0.my_score_info:setString(string.format(TI18N("段位积分:<div fontcolor=#249003 fontsize=22>%s</div>"), slot1.score or 0))
		end

		slot0.role_head:setHeadRes(slot2.face_id, false, LOADTEXT_TYPE, slot2.face_file, slot2.face_update_time)
		slot0.role_head:setLev(slot2.lev)

		if Config.AvatarData.data_avatar[slot2.avatar_base_id] then
			slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot7.res_id or 1), false, false), nil, false, slot7.offy)
		end

		if slot1.rank_list ~= nil and next(slot1.rank_list) ~= nil then
			slot0.scroll_view:setData(slot1.rank_list, function (slot0)
				uv0:worshipOtherRole(slot0)
			end)
		end
	end
end

function ArenaLoopRankPanel.worshipOtherRole(slot0, slot1)
	if slot1.data ~= nil then
		slot0.select_item = slot1

		RoleController:getInstance():requestWorshipRole(slot1.data.rid, slot1.data.srv_id, slot1.data.rank)
	end
end

function ArenaLoopRankPanel.DeleteMe(slot0)
	if slot0.update_rank_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_rank_event)

		slot0.update_rank_event = nil
	end

	if slot0.update_worship_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_worship_event)

		slot0.update_worship_event = nil
	end

	if slot0.arena_fight_result_evetn ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.arena_fight_result_evetn)

		slot0.arena_fight_result_evetn = nil
	end

	if slot0.rank_num then
		slot0.rank_num:DeleteMe()

		slot0.rank_num = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end

ArenaLoopRankItem = class("ArenaLoopRankItem", function ()
	return ccui.Layout:create()
end)

function ArenaLoopRankItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/arean_loop_rank_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.rank_img = slot1:getChildByName("rank_img")
	slot0.wish_container = slot1:getChildByName("wish_container")
	slot0.wish_num = slot0.wish_container:getChildByName("num")

	slot0.wish_num:setString("")

	slot0.role_name = slot1:getChildByName("role_name")
	slot0.role_power = slot1:getChildByName("role_power")
	slot0.power_bg = slot1:getChildByName("Image_1")
	slot0.score_info = createRichLabel(20, 175, cc.p(0.5, 0.5), cc.p(520, 38), nil, , 300)

	slot1:addChild(slot0.score_info)

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(150, 65)
	slot1:addChild(slot0.role_head)
	slot0.role_head:setLev(99)

	slot0.container = slot1

	slot0:registerEvent()
end

function ArenaLoopRankItem.registerEvent(slot0)
	slot0.role_head:addCallBack(function ()
		if uv0.data ~= nil then
			FriendController:getInstance():openFriendCheckPanel(true, {
				srv_id = uv0.data.srv_id,
				rid = uv0.data.rid
			})
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

function ArenaLoopRankItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function ArenaLoopRankItem.updateWorshipStatus(slot0)
	if slot0.data ~= nil then
		slot0.data.worship = slot0.data.worship + 1
		slot0.data.worship_status = TRUE

		slot0.wish_num:setString(slot0.data.worship)
		slot0.wish_num:enableOutline(Config.ColorData.data_color4[2], 2)
		slot0.wish_container:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.wish_container, Config.ColorData.data_color4[1])
	end
end

function ArenaLoopRankItem.setData(slot0, slot1)
	slot2 = RoleController:getInstance():getRoleVo()

	if slot1 and slot2 then
		slot0.data = slot1

		slot0.role_name:setString(slot1.name)
		slot0.role_power:setString(slot1.power)
		slot0.power_bg:setContentSize(cc.size(slot0.role_power:getContentSize().width + 75, slot0.power_bg:getContentSize().height))
		slot0.role_head:setHeadRes(slot1.face, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
		slot0.role_head:setLev(slot1.lev)
		slot0.wish_num:setString(slot1.worship)

		if Config.AvatarData.data_avatar[slot1.avatar_id] then
			slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot6.res_id or 1), false, false), nil, false, slot6.offy)
		end

		if slot1.worship_status == TRUE or slot2:isSameRole(slot1.srv_id, slot1.rid) then
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
				if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot1.rank)) then
					slot0.rank_res_id = slot7

					loadSpriteTexture(slot0.rank_img, slot7, LOADTEXT_TYPE_PLIST)
				end

				slot0.rank_img:setVisible(true)
			end
		else
			if slot0.rank_num == nil then
				slot0.rank_num = CommonNum.new(1, slot0.container, 1, -2, cc.p(0.5, 0.5))

				slot0.rank_num:setPosition(59, 77)
			end

			slot0.rank_num:setVisible(true)
			slot0.rank_num:setNum(slot1.rank)
			slot0.rank_img:setVisible(false)
		end

		if ArenaController:getInstance():getModel():getZoneConfig(slot1.score) ~= nil then
			slot0.score_info:setString(string.format(TI18N("段位积分:<div fontcolor=#249003 fontsize=22>%s</div>"), slot1.score or 0))
		end
	end
end

function ArenaLoopRankItem.DeleteMe(slot0)
	if slot0.rank_num ~= nil then
		slot0.rank_num:DeleteMe()

		slot0.rank_num = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
