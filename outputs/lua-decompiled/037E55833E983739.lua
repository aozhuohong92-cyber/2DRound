ArenateamFightRecordPanel = ArenateamFightRecordPanel or BaseClass(BaseView)
slot0 = ArenateamController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function ArenateamFightRecordPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "arenateam/arenateam_fight_record_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("vedio", "vedio"),
			type = ResourcesType.plist
		}
	}
	slot0.arena_elite_log_list = {}
end

function ArenateamFightRecordPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("比赛记录"))

	slot0.scroll_container = slot0.main_panel:getChildByName("scroll_container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.top_label = slot0.main_panel:getChildByName("top_label")

	slot0.top_label:setString(TI18N("录像可以在\"详细\"中观看"))
end

function ArenateamFightRecordPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_MIAIN_REPORT_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
end

function ArenateamFightRecordPanel.onClickBtnClose(slot0)
	uv0:openArenateamFightRecordPanel(false)
end

function ArenateamFightRecordPanel.openRootWnd(slot0, slot1)
	uv0:sender27255()
end

function ArenateamFightRecordPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.show_list = slot1.arena_team_log

	uv0(slot0.show_list, function (slot0, slot1)
		return slot1.time < slot0.time
	end)
	slot0:updateList()
end

function ArenateamFightRecordPanel.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 600,
			item_height = 275,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.scroll_container, true, {
			text = TI18N("暂无录像信息")
		})
	else
		commonShowEmptyIcon(slot0.scroll_container, false)
	end

	slot0.item_scrollview:reloadData()
end

function ArenateamFightRecordPanel.createNewCell(slot0, slot1, slot2)
	return ArenateamFightRecordItem.new(slot1, slot2)
end

function ArenateamFightRecordPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenateamFightRecordPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ArenateamFightRecordPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openArenateamFightRecordPanel(false)
end

ArenateamFightRecordItem = class("ArenateamFightRecordItem", function ()
	return ccui.Widget:create()
end)

function ArenateamFightRecordItem.ctor(slot0, slot1, slot2)
	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ArenateamFightRecordItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenateam/arenateam_fight_record_item"))

	slot0:addChild(slot0.root_wnd)

	slot4 = slot0.root_wnd:getChildByName("container")
	slot0.result_win = slot4:getChildByName("result_win")
	slot0.result_loss = slot4:getChildByName("result_loss")
	slot0.result_win_x = slot0.result_win:getPositionX()
	slot0.result_loss_x = slot0.result_loss:getPositionX()
	slot0.play_btn = slot4:getChildByName("play_btn")
	slot0.title_info = slot4:getChildByName("title_info")
	slot0.time_val = slot4:getChildByName("time_val")

	function slot5(slot0, slot1, slot2, slot3)
		slot4 = {
			name = createRichLabel(20, cc.c4b(90, 58, 38, 255), cc.p(0, 0.5), slot1, nil, nil, 600)
		}

		if slot0 == "left_" then
			-- Nothing
		else
			slot4.name = createRichLabel(20, cc.c4b(90, 58, 38, 255), cc.p(1, 0.5), slot1, nil, nil, 600)
		end

		uv0:addChild(slot4.name)

		slot4.power_key = uv0:getChildByName(slot0 .. "power_key")

		slot4.power_key:setString("战力")

		slot4.score_key = uv0:getChildByName(slot0 .. "score_key")

		slot4.score_key:setString("积分")

		slot4.rank_key = uv0:getChildByName(slot0 .. "rank_key")

		slot4.rank_key:setString("排行")

		slot4.power_value = uv0:getChildByName(slot0 .. "power_value")
		slot4.score_value = uv0:getChildByName(slot0 .. "score_value")
		slot4.rank_value = uv0:getChildByName(slot0 .. "rank_value")
		slot4.score_value_1 = createRichLabel(20, cc.c4b(90, 58, 38, 255), cc.p(0, 0.5), slot2, nil, nil, 600)

		uv0:addChild(slot4.score_value_1)

		slot4.rank_value_1 = createRichLabel(20, cc.c4b(90, 58, 38, 255), cc.p(0, 0.5), slot3, nil, nil, 600)

		uv0:addChild(slot4.rank_value_1)

		slot8 = slot0 .. "head_node"
		slot4.head_node = uv0:getChildByName(slot8)
		slot4.head_list = {}

		for slot8 = 1, 3 do
			slot4.head_list[slot8] = PlayerHead.new(PlayerHead.type.circle)

			slot4.head_list[slot8]:setHeadLayerScale(0.7)
			slot4.head_list[slot8]:setPosition(70 * (slot8 - 1), 0)
			slot4.head_node:addChild(slot4.head_list[slot8])
			slot4.head_list[slot8]:addCallBack(function ()
				uv0:onClickHeadBtn(uv1, uv2)
			end)
		end

		return slot4
	end

	slot0.left_item = slot5("left_", cc.p(48, 206), cc.p(143, 61), cc.p(143, 27))
	slot0.right_item = slot5("right_", cc.p(548, 206), cc.p(484, 61), cc.p(484, 27))
end

function ArenateamFightRecordItem.register_event(slot0)
	registerButtonEventListener(slot0.play_btn, handler(slot0, slot0.onClickPlayBtn), true, 2)
end

function ArenateamFightRecordItem.onClickHeadBtn(slot0, slot1, slot2)
	if not slot0.data then
		return
	end

	slot3 = nil

	if (slot2 ~= "left_" or slot0.data.a_team_members) and slot0.data.b_team_members and slot3[slot1] then
		if RoleController:getInstance():getRoleVo() and slot3[slot1].rid == slot4.rid and slot3[slot1].sid == slot4.srv_id then
			message(TI18N("这是你自己~"))

			return
		end

		FriendController:getInstance():openFriendCheckPanel(true, {
			srv_id = slot3[slot1].sid,
			rid = slot3[slot1].rid
		})
	end
end

function ArenateamFightRecordItem.onClickPlayBtn(slot0)
	if not slot0.data then
		return
	end

	uv0:openArenateamFightVedioPanel(true, {
		data = slot0.data
	})
end

function ArenateamFightRecordItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.time_val:setString(TimeTool.getYMDHM(slot1.time))

	slot3 = false

	if RoleController:getInstance():getRoleVo() then
		for slot8, slot9 in ipairs(slot1.a_team_members) do
			if slot9.rid == slot4.rid and slot9.sid == slot4.srv_id then
				slot3 = true

				break
			end
		end
	end

	if slot1.ret == 1 then
		if slot3 then
			slot0.title_info:setString(TI18N("进攻成功"))
			slot0.title_info:setTextColor(cc.c3b(36, 144, 3))
		else
			slot0.title_info:setString(TI18N("防守失败"))
			slot0.title_info:setTextColor(cc.c3b(217, 80, 20))
		end

		slot0.result_win:setPositionX(slot0.result_win_x)
		slot0.result_loss:setPositionX(slot0.result_loss_x)
	else
		if slot3 then
			slot0.title_info:setString(TI18N("进攻失败"))
			slot0.title_info:setTextColor(cc.c3b(217, 80, 20))
		else
			slot0.title_info:setString(TI18N("防守成功"))
			slot0.title_info:setTextColor(cc.c3b(36, 144, 3))
		end

		slot0.result_loss:setPositionX(slot0.result_win_x)
		slot0.result_win:setPositionX(slot0.result_loss_x)
	end

	slot0:initItemInfo(slot0.left_item, slot1.a_srv_id or "dev_1", slot1.atk_name or "1111", slot1.a_rank, slot1.a_team_power, slot1.a_score, slot1.a_new_score, slot1.a_new_rank, slot1.a_team_members)
	slot0:initItemInfo(slot0.right_item, slot1.b_srv_id or "dev_1", slot1.b_team_name or "1111", slot1.b_rank, slot1.b_team_power, slot1.b_score, slot1.b_new_score, slot1.b_new_rank, slot1.b_team_members)
end

function ArenateamFightRecordItem.getArrowRes(slot0, slot1)
	if slot1 > 0 then
		return PathTool.getResFrame("common", "common_1086")
	elseif slot1 < 0 then
		return PathTool.getResFrame("common", "common_1087")
	end

	return ""
end

function ArenateamFightRecordItem.initItemInfo(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot1.name:setString(transformNameByServ(slot3, slot2))
	slot1.power_value:setString(slot5 or 0)
	slot1.score_value:setString(slot7 or 0)

	slot12 = nil

	if slot7 - slot6 == 0 then
		slot1.score_value_1:setString("")
	else
		slot13 = slot0:getArrowRes(slot11)

		slot1.score_value_1:setString((slot11 <= 0 or uv0("<div fontcolor=#249003>(<img src=%s visible=true scale=0.8 /><div> %s)</div>", slot13, slot11)) and uv0("<div fontcolor=#951014>(<img src=%s visible=true scale=0.8 /><div> %s)</div>", slot13, slot11))
	end

	if slot8 == 0 then
		slot1.rank_value:setString(TI18N("暂无"))
		slot1.rank_value_1:setString("")
	else
		slot1.rank_value:setString(slot8)

		if slot4 ~= 0 then
			if slot4 - slot8 == 0 then
				slot1.rank_value_1:setString("")
			else
				slot14 = slot0:getArrowRes(slot13)

				slot1.rank_value_1:setString((slot13 <= 0 or uv0("<div fontcolor=#249003>(<img src=%s visible=true scale=0.8 /><div> %s)</div>", slot14, slot13)) and uv0("<div fontcolor=#951014>(<img src=%s visible=true scale=0.8 /><div> %s)</div>", slot14, slot13))
			end
		else
			slot1.rank_value_1:setString("")
		end
	end

	if slot1.head_list then
		for slot16, slot17 in ipairs(slot9) do
			slot17.is_leader = 0

			for slot21, slot22 in ipairs(slot17.ext) do
				if slot22.extra_key == 1 then
					if slot22.extra_val == 1 then
						slot17.is_leader = 1
					else
						slot17.is_leader = -slot17.pos
					end
				end
			end
		end

		function slot16(slot0, slot1)
			return slot1.is_leader < slot0.is_leader
		end

		uv1(slot9, slot16)

		for slot16 = 1, 3 do
			if slot1.head_list[slot16] then
				if slot9[slot16] then
					slot17:setHeadRes(slot18.face_id, false, LOADTEXT_TYPE, slot18.face_file, slot18.face_update_time)
					slot17:setLev(slot18.lev, cc.p(16, 60))

					if slot18.is_leader == 1 then
						slot17:showLeader(true, 70, 74)
					else
						slot17:showLeader(false)
					end

					slot19 = slot18.avatar_bid

					if slot17.record_res_bid == nil or slot17.record_res_bid ~= slot19 then
						slot17.record_res_bid = slot19

						if Config.AvatarData.data_avatar[slot19] then
							slot17:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot20.res_id or 1), false, false), nil, false, slot20.offy)
						else
							slot17:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
						end
					end
				else
					slot17:clearHead()
					slot17:closeLev()
					slot17:showLeader(false)
					slot17:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
				end
			end
		end
	end
end

function ArenateamFightRecordItem.DeleteMe(slot0)
	if slot0.left_item.item_load then
		slot0.left_item.item_load:DeleteMe()

		slot0.left_item.item_load = nil
	end

	if slot0.right_item.item_load then
		slot0.right_item.item_load:DeleteMe()

		slot0.right_item.item_load = nil
	end

	if slot0.left_item.item_load_1 then
		slot0.left_item.item_load_1:DeleteMe()

		slot0.left_item.item_load_1 = nil
	end

	if slot0.right_item.item_load_1 then
		slot0.right_item.item_load_1:DeleteMe()

		slot0.right_item.item_load_1 = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
