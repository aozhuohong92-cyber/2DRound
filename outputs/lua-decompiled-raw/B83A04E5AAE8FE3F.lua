ArenaManyPeopleFightRecordPanel = ArenaManyPeopleFightRecordPanel or BaseClass(BaseView)
slot0 = ArenaManyPeopleController:getInstance()
slot1 = string.format
slot2 = table.sort

function ArenaManyPeopleFightRecordPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "arenamanypeople/amp_fight_record_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("vedio", "vedio"),
			type = ResourcesType.plist
		}
	}
	slot0.show_list = {}
end

function ArenaManyPeopleFightRecordPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	ActionHelp.itemUpAction(slot0.main_container, 720, 0, 0.25)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("比赛记录"))

	slot0.scroll_container = slot0.main_panel:getChildByName("scroll_container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.top_label = slot0.main_panel:getChildByName("top_label")

	slot0.top_label:setString(TI18N("录像可以在\"详细\"中观看"))
end

function ArenaManyPeopleFightRecordPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	slot0:addGlobalEvent(ArenaManyPeopleEvent.ARENAMANYPOEPLE_MIAIN_REPORT_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
end

function ArenaManyPeopleFightRecordPanel.onClickBtnClose(slot0)
	uv0:openArenaManyPeopleFightRecordPanel(false)
end

function ArenaManyPeopleFightRecordPanel.openRootWnd(slot0)
	uv0:sender29026()
end

function ArenaManyPeopleFightRecordPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.show_list = slot1.holiday_arena_team_log

	uv0(slot0.show_list, function (slot0, slot1)
		return slot1.time < slot0.time
	end)
	slot0:updateList()
end

function ArenaManyPeopleFightRecordPanel.updateList(slot0)
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

function ArenaManyPeopleFightRecordPanel.createNewCell(slot0, slot1, slot2)
	return ArenaManyPeopleFightRecordItem.new(slot1, slot2)
end

function ArenaManyPeopleFightRecordPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenaManyPeopleFightRecordPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ArenaManyPeopleFightRecordPanel.close_callback(slot0)
	doStopAllActions(slot0.main_container)

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openArenaManyPeopleFightRecordPanel(false)
end

ArenaManyPeopleFightRecordItem = class("ArenaManyPeopleFightRecordItem", function ()
	return ccui.Widget:create()
end)

function ArenaManyPeopleFightRecordItem.ctor(slot0, slot1, slot2)
	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ArenaManyPeopleFightRecordItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenamanypeople/amp_fight_record_item"))

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
			name = createRichLabel(20, cc.c4b(90, 58, 38, 255), cc.p(0, 0.5), slot1, nil, , 600)
		}

		if slot0 == "left_" then
			-- Nothing
		else
			slot4.name = createRichLabel(20, cc.c4b(90, 58, 38, 255), cc.p(1, 0.5), slot1, nil, , 600)
		end

		uv0:addChild(slot4.name)

		slot4.image_rank_1 = uv0:getChildByName(slot0 .. "image_rank_1")
		slot4.image_rank_2 = uv0:getChildByName(slot0 .. "image_rank_2")
		slot4.power_key = uv0:getChildByName(slot0 .. "power_key")

		slot4.power_key:setString("战力")

		slot4.score_key = uv0:getChildByName(slot0 .. "score_key")

		slot4.score_key:setString("我的积分")

		slot4.rank_key = uv0:getChildByName(slot0 .. "rank_key")

		slot4.rank_key:setString("我的排行")

		slot4.power_value = uv0:getChildByName(slot0 .. "power_value")
		slot4.score_value = uv0:getChildByName(slot0 .. "score_value")
		slot4.rank_value = uv0:getChildByName(slot0 .. "rank_value")
		slot4.score_value_1 = createRichLabel(20, cc.c4b(90, 58, 38, 255), cc.p(0, 0.5), slot2, nil, , 600)

		uv0:addChild(slot4.score_value_1)

		slot4.rank_value_1 = createRichLabel(20, cc.c4b(90, 58, 38, 255), cc.p(0, 0.5), slot3, nil, , 600)

		uv0:addChild(slot4.rank_value_1)

		slot8 = slot0 .. "head_node"
		slot4.head_node = uv0:getChildByName(slot8)
		slot4.head_list = {}

		for slot8 = 1, 3 do
			slot4.head_list[slot8] = PlayerHead.new(PlayerHead.type.circle)

			slot4.head_list[slot8]:setHeadLayerScale(0.7)
			slot4.head_list[slot8]:setPosition(70 * (slot8 - 1), 0)
			slot4.head_node:addChild(slot4.head_list[slot8])
		end

		return slot4
	end

	slot0.left_item = slot5("left_", cc.p(48, 206), cc.p(143, 61), cc.p(143, 27))
	slot0.right_item = slot5("right_", cc.p(548, 206), cc.p(484, 61), cc.p(484, 27))
end

function ArenaManyPeopleFightRecordItem.register_event(slot0)
	registerButtonEventListener(slot0.play_btn, handler(slot0, slot0.onClickPlayBtn), true, 2)
end

function ArenaManyPeopleFightRecordItem.onClickPlayBtn(slot0)
	if not slot0.data then
		return
	end

	uv0:openArenaManyPeopleFightVedioPanel(true, {
		data = slot0.data
	})
end

function ArenaManyPeopleFightRecordItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.time_val:setString(TimeTool.getYMDHM(slot1.time))

	if slot1.ret == 1 then
		if (slot1.is_atk or 0) == 1 then
			slot0.title_info:setString(TI18N("进攻成功"))
			slot0.title_info:setTextColor(cc.c3b(36, 144, 3))
			slot0.result_win:setPositionX(slot0.result_win_x)
			slot0.result_loss:setPositionX(slot0.result_loss_x)
		else
			slot0.title_info:setString(TI18N("防守失败"))
			slot0.title_info:setTextColor(cc.c3b(217, 80, 20))
			slot0.result_loss:setPositionX(slot0.result_win_x)
			slot0.result_win:setPositionX(slot0.result_loss_x)
		end
	elseif slot3 == 1 then
		slot0.title_info:setString(TI18N("进攻失败"))
		slot0.title_info:setTextColor(cc.c3b(217, 80, 20))
		slot0.result_loss:setPositionX(slot0.result_win_x)
		slot0.result_win:setPositionX(slot0.result_loss_x)
	else
		slot0.title_info:setString(TI18N("防守成功"))
		slot0.title_info:setTextColor(cc.c3b(36, 144, 3))
		slot0.result_win:setPositionX(slot0.result_win_x)
		slot0.result_loss:setPositionX(slot0.result_loss_x)
	end

	if slot3 == 1 then
		slot0:initItemInfo(slot0.left_item, slot1.srv_id or "dev_1", slot1.atk_name or "1111", slot1.atk_ole_rank, slot1.atk_power or 0, slot1.atk_ole_score, slot1.atk_score, slot1.atk_rank, slot1.atk_face)
	else
		slot0:initItemInfo(slot0.right_item, slot4, slot5, nil, slot7, nil, , , slot11)
	end

	if slot3 == 1 then
		slot0:initItemInfo(slot0.right_item, slot1.def_srv_id or "dev_1", slot1.def_name or "1111", nil, slot1.def_power or 0, nil, , , slot1.def_face)
	else
		slot0:initItemInfo(slot0.left_item, slot4, slot5, slot1.def_ole_rank, slot7, slot1.def_ole_score, slot1.def_score, slot1.def_rank, slot11)
	end
end

function ArenaManyPeopleFightRecordItem.getArrowRes(slot0, slot1)
	if slot1 > 0 then
		return PathTool.getResFrame("common", "common_1086")
	elseif slot1 < 0 then
		return PathTool.getResFrame("common", "common_1087")
	end

	return ""
end

function ArenaManyPeopleFightRecordItem.initItemInfo(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot1.name:setString(transformNameByServ(slot3, slot2))
	slot1.power_value:setString(slot5 or 0)
	slot1.score_value:setString(slot7 or 0)

	if slot6 and slot7 then
		slot12 = nil

		if slot7 - slot6 == 0 then
			slot1.score_value_1:setString("")
		else
			slot13 = slot0:getArrowRes(slot11)

			slot1.score_value_1:setString((slot11 <= 0 or uv0("<div fontcolor=#249003>(<img src=%s visible=true scale=0.8 /><div> %s)</div>", slot13, slot11)) and uv0("<div fontcolor=#951014>(<img src=%s visible=true scale=0.8 /><div> %s)</div>", slot13, slot11))
		end

		slot1.score_key:setVisible(true)
		slot1.image_rank_1:setVisible(true)
	else
		slot1.score_value:setString("")
		slot1.score_value_1:setString("")
		slot1.score_key:setVisible(false)
		slot1.image_rank_1:setVisible(false)
	end

	if slot4 and slot8 then
		if slot8 == 0 then
			slot1.rank_value:setString(TI18N("暂无"))
			slot1.rank_value_1:setString("")
		else
			slot1.rank_value:setString(slot8)

			if slot4 ~= 0 then
				if slot4 - slot8 == 0 then
					slot1.rank_value_1:setString("")
				else
					slot12 = slot0:getArrowRes(slot11)

					slot1.rank_value_1:setString((slot11 <= 0 or uv0("<div fontcolor=#249003>(<img src=%s visible=true scale=0.8 /><div> %s)</div>", slot12, slot11)) and uv0("<div fontcolor=#951014>(<img src=%s visible=true scale=0.8 /><div> %s)</div>", slot12, slot11))
				end
			else
				slot1.rank_value_1:setString("")
			end
		end

		slot1.rank_key:setVisible(true)
		slot1.image_rank_2:setVisible(true)
	else
		slot1.rank_value:setString("")
		slot1.rank_value_1:setString("")
		slot1.rank_key:setVisible(false)
		slot1.image_rank_2:setVisible(false)
	end

	if slot1.head_list then
		function slot14(slot0, slot1)
			return slot1.is_leader < slot0.is_leader
		end

		uv1(slot9, slot14)

		for slot14 = 1, 3 do
			if slot1.head_list[slot14] then
				if slot9[slot14] then
					slot15:setHeadRes(slot16.face_id, false, LOADTEXT_TYPE, slot16.face_file, slot16.face_update_time)
					slot15:setLev(slot16.lev, cc.p(16, 60))

					if slot16.is_leader == 1 then
						slot15:showLeader(true, 70, 74)
					else
						slot15:showLeader(false)
					end

					slot17 = slot16.avatar_bid

					if slot15.record_res_bid == nil or slot15.record_res_bid ~= slot17 then
						slot15.record_res_bid = slot17

						if Config.AvatarData.data_avatar[slot17] then
							slot15:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot18.res_id or 1), false, false), nil, false, slot18.offy)
						else
							slot15:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
						end
					end
				else
					slot15:clearHead()
					slot15:closeLev()
					slot15:showLeader(false)
					slot15:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
				end
			end
		end
	end
end

function ArenaManyPeopleFightRecordItem.DeleteMe(slot0)
	if slot0.left_item and slot0.left_item.head_list then
		for slot4, slot5 in pairs(slot0.left_item.head_list) do
			slot5:DeleteMe()

			slot5 = nil
		end

		slot0.left_item.head_list = nil
	end

	if slot0.right_item and slot0.right_item.head_list then
		for slot4, slot5 in pairs(slot0.right_item.head_list) do
			slot5:DeleteMe()

			slot5 = nil
		end

		slot0.right_item.head_list = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
