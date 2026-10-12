GuildWarRankWindow = GuildWarRankWindow or BaseClass(BaseView)
slot1 = GuildwarController:getInstance():getModel()

function GuildWarRankWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.layout_name = "rank/rank_window"
	slot0.first_list = {}
	slot0.click_index = RankConstant.RankType.guild_war
end

function GuildWarRankWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 1)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.rank_panel = slot0.main_panel:getChildByName("rank_panel")
	slot0.my_rank = slot0.main_panel:getChildByName("my_rank")

	slot0.my_rank:getChildByName("title"):setString(TI18N("我的排名"))

	slot0.rank_index = slot0.my_rank:getChildByName("rank_id")
	slot0.my_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.my_head:setHeadLayerScale(0.8)
	slot0.my_head:setPosition(150, 60)
	slot0.my_rank:addChild(slot0.my_head)

	slot0.no_rank = createLabel(24, Config.ColorData.data_color4[175], nil, 52, 45, TI18N("未上榜"), slot0.my_rank, 0, cc.p(0.5, 0.5))
	slot0.my_name = createLabel(24, Config.ColorData.data_color4[175], nil, 200, 56, "", slot0.my_rank, 0, cc.p(0, 0.5))
	slot0.star_label = createLabel(24, Config.ColorData.data_color4[175], nil, 402, 56, "", slot0.my_rank, 0, cc.p(0, 0.5))
	slot0.score_label = createLabel(24, Config.ColorData.data_color4[175], nil, 525, 56, "", slot0.my_rank, 0, cc.p(0, 0.5))
	slot0.title_con = slot0.main_panel:getChildByName("title_con")

	slot0.title_con:getChildByName("title_label"):setString(RankConstant.TitleName[slot0.click_index] or "")

	slot0.top_bg = slot0.main_panel:getChildByName("top_bg")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/rank", "rank_2"), ResourcesType.single, function ()
			if not tolua.isnull(uv0.top_bg) then
				loadSpriteTexture(uv0.top_bg, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0:updateTitle()
end

function GuildWarRankWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openGuildWarRankView(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openGuildWarRankView(false)
		end
	end)

	if slot0.update_data_event == nil then
		slot0.update_data_event = GlobalEvent:getInstance():Bind(GuildwarEvent.UpdateGuildWarRankDataEvent, function (slot0)
			uv0:updateRankList(slot0)
		end)
	end
end

function GuildWarRankWindow.openRootWnd(slot0)
	uv0:requestGuildWarRankData()
end

function GuildWarRankWindow.updateTitle(slot0)
	slot2 = #(RankConstant.RankTitle[slot0.click_index] or {}) or 0
	slot3 = RankConstant.TitlePos[slot0.click_index] or {}

	for slot8 = 1, slot2 do
		if slot8 ~= slot2 then
			createImage(slot0.main_panel, PathTool.getResFrame("common", "common_1069"), (RankConstant.TitleLinePos[slot0.click_index] or {})[slot8] or 0, 636, cc.p(0, 0.5), true, 1, false):setScaleY(0.8)
		end

		createLabel(24, Config.ColorData.data_color4[175], nil, slot3[slot8] or 0, 636, "", slot0.main_panel, 0, cc.p(0, 0.5)):setString(slot1[slot8] or "")
	end
end

function GuildWarRankWindow.updateRankList(slot0, slot1)
	slot0.rank_data = slot1

	slot0:updateMyData()
	slot0:updateRankData()

	if not slot0.list_view then
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.main_panel, cc.p(45, 170), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(640, 430), {
			start_y = 0,
			row = 1,
			start_x = 0,
			space_x = 5,
			item_width = 630,
			item_height = 120,
			space_y = 6,
			col = 1,
			need_dynamic = true
		}, cc.p(0, 0))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0:showEmptyIcon(false)

	if #slot0.rank_data <= 0 then
		slot0:showEmptyIcon(true)
	end

	slot0.list_view:reloadData()
end

function GuildWarRankWindow.createNewCell(slot0, slot1, slot2)
	slot3 = RankItem.new(1)

	slot3:setExtendData({
		rank_type = RankConstant.RankType.guild_war
	})

	return slot3
end

function GuildWarRankWindow.numberOfCells(slot0)
	if not slot0.rank_data then
		return 0
	end

	return #slot0.rank_data
end

function GuildWarRankWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.rank_data[slot2] then
		slot1:setData(slot3, slot2)
	end
end

function GuildWarRankWindow.getMyselfRankData(slot0, slot1, slot2)
	slot3 = {}

	for slot7, slot8 in pairs(slot0.rank_data) do
		if slot8.rid == slot1 and slot8.srv_id == slot2 then
			slot3 = slot8

			break
		end
	end

	return slot3
end

function GuildWarRankWindow.updateMyData(slot0)
	if not slot0.rank_data then
		return
	end

	slot1 = RoleController:getInstance():getRoleVo()
	slot3 = TI18N("0")

	if (slot0:getMyselfRankData(slot1.rid, slot1.srv_id).rank or 0) and slot4 > 0 then
		slot3 = slot4
	end

	slot0.no_rank:setVisible(false)
	slot0.rank_index:setString(slot3)

	if slot4 and slot4 >= 1 and slot4 <= 3 then
		slot0.rank_index:setVisible(false)

		if not slot0.my_rank_icon then
			slot0.my_rank_icon = createImage(slot0.my_rank, nil, 33, 26, cc.p(0, 0), true, 1, false)
		end

		slot0.my_rank_icon:setVisible(true)
		slot0.my_rank_icon:loadTexture(PathTool.getResFrame("common", "common_300" .. slot4), LOADTEXT_TYPE_PLIST)
		slot0.my_rank_icon:setScale(0.7)
	elseif slot4 <= 0 then
		slot0.no_rank:setVisible(true)
		slot0.rank_index:setVisible(false)
	else
		slot0.rank_index:setVisible(true)

		if slot0.my_rank_icon then
			slot0.my_rank_icon:setVisible(false)
		end
	end

	slot0.my_head:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
	slot0.my_name:setString(slot2.name or "")
	slot0.star_label:setString(slot2.star or "")
	slot0.score_label:setString(slot2.war_score or "")
end

function GuildWarRankWindow.updateRankData(slot0)
	if not slot0.rank_data then
		return
	end

	slot1 = slot0.rank_data
	slot2 = 0
	slot3 = slot0.main_panel:getContentSize()

	for slot7 = 1, 3 do
		slot0.first_list[slot7] = slot0.first_list[slot7] or {}

		if slot0.first_list[slot7].role_spine then
			slot0.first_list[slot7].role_spine:DeleteMe()

			slot0.first_list[slot7].role_spine = nil
		end

		slot8 = slot3.width / 2
		slot9 = 883
		slot10 = 0

		if slot7 == 2 then
			slot8 = slot3.width / 2 - 226
			slot9 = 870
			slot10 = 6
		elseif slot7 == 3 then
			slot8 = slot3.width / 2 + 234
			slot9 = 870
			slot10 = 6
		end

		if not slot0.first_list[slot7].name_txt then
			slot0.first_list[slot7].name_txt = createLabel(24, Config.ColorData.data_color4[1], 2, slot8, 712 - slot10, TI18N("虚位以待"), slot0.main_panel, 2, cc.p(0.5, 0.5))

			slot0.first_list[slot7].name_txt:setLocalZOrder(1)
		end

		if not slot0.first_list[slot7].title_sp then
			slot0.first_list[slot7].title_sp = createSprite(PathTool.getResFrame("common", "common_300" .. slot7), slot8, slot9 + 60, slot0.main_panel, cc.p(0.5, 0.5))

			slot0.first_list[slot7].title_sp:setScale(0.7)
			slot0.first_list[slot7].title_sp:setLocalZOrder(1)
		end
	end

	for slot7, slot8 in ipairs(slot1) do
		if (slot8.idx or slot8.rank) > 0 and slot9 <= 3 then
			slot2 = slot2 + 1

			if (slot8.look_id or slot8.lookid or slot8.leader_look_id or 110101) == 0 then
				slot10 = 110101
			end

			slot11 = slot3.width / 2
			slot12 = 873

			if slot9 == 2 then
				slot11 = slot3.width / 2 - 226
				slot12 = 860
			elseif slot9 == 3 then
				slot11 = slot3.width / 2 + 234
				slot12 = 860
			end

			slot13 = BaseRole.new(BaseRole.type.role, slot10)

			slot13:setScale(0.35)
			slot13:setCascade(true)
			slot13:setAnchorPoint(cc.p(0.5, 0))
			slot13:setAnimation(0, PlayerAction.show, true)
			slot0.main_panel:addChild(slot13)
			slot13:setPosition(slot11, slot12 - 100)

			slot0.first_list[slot9].role_spine = slot13

			if slot0.first_list[slot9].name_txt then
				slot0.first_list[slot9].name_txt:setString(slot8.name or "")
			end

			if not slot0.first_list[slot9].touch_layer then
				slot14 = ccui.Layout:create()

				slot14:setAnchorPoint(cc.p(0.5, 0))
				slot14:setContentSize(cc.size(160, 260))
				slot14:setPosition(slot11, slot12 - 173)
				slot14:setTouchEnabled(true)
				slot0.main_panel:addChild(slot14)

				slot0.first_list[slot9].touch_layer = slot14
			end

			slot0.first_list[slot9].touch_layer:addTouchEventListener(function (slot0, slot1)
				if ccui.TouchEventType.ended == slot1 and uv0 then
					slot3 = cc.p(slot0:getTouchEndPosition().x + 320, slot0:getTouchEndPosition().y)
					slot5 = uv0.srv_id or ""

					if RoleController:getInstance():getRoleVo().rid == (uv0.rid or 0) and slot2.srv_id == slot5 then
						return
					end

					ChatController:getInstance():openFriendInfo({
						rid = slot4,
						srv_id = slot5
					}, slot3)
				end
			end)
		end

		if slot2 >= 3 then
			break
		end
	end
end

function GuildWarRankWindow.showEmptyIcon(slot0, slot1)
	if not slot0.empty_con and slot1 == false then
		return
	end

	if not slot0.empty_con then
		slot3 = cc.size(200, 200)
		slot0.empty_con = ccui.Widget:create()

		slot0.empty_con:setContentSize(slot3)
		slot0.empty_con:setAnchorPoint(cc.p(0.5, 0))
		slot0.empty_con:setPosition(cc.p(slot0.main_panel:getContentSize().width / 2, 330))
		slot0.main_panel:addChild(slot0.empty_con, 10)

		slot5 = createImage(slot0.empty_con, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), slot3.width / 2, slot3.height / 2, cc.p(0.5, 0.5), false)
		slot0.empty_label = createLabel(26, Config.ColorData.data_color4[175], nil, slot3.width / 2, -10, "", slot0.empty_con, 0, cc.p(0.5, 0))
	end

	slot0.empty_label:setString(TI18N("当前排行榜暂无数据"))
	slot0.empty_con:setVisible(slot1)
end

function GuildWarRankWindow.close_callback(slot0)
	if slot0.update_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_data_event)

		slot0.update_data_event = nil
	end

	if slot0.my_head then
		slot0.my_head:DeleteMe()

		slot0.my_head = nil
	end

	for slot4, slot5 in pairs(slot0.first_list) do
		if slot5.role_spine then
			slot5.role_spine:DeleteMe()

			slot5.role_spine = nil
		end
	end

	slot0.first_list = nil

	if slot0.list_view then
		slot0.list_view:DeleteMe()
	end

	slot0.list_view = nil

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	uv0:openGuildWarRankView(false)
end
