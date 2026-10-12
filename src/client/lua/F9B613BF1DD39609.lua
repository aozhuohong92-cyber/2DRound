ActiontermbeginsRankTabRank = class("ActiontermbeginsRankTabRank", function ()
	return ccui.Widget:create()
end)
slot1 = ActiontermbeginsController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = RoleController:getInstance():getRoleVo()
slot5 = math.floor
slot6 = table.sort

function ActiontermbeginsRankTabRank.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ActiontermbeginsRankTabRank.config(slot0)
end

function ActiontermbeginsRankTabRank.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("actiontermbegins/action_term_begins_rank_tab_rank"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container_size = slot0.main_container:getContentSize()
	slot0.rank_panel = slot0.main_container:getChildByName("rank_panel")
	slot0.item_list = slot0.rank_panel:getChildByName("item_list")
	slot2 = slot0.rank_panel:getChildByName("title_bg")

	slot2:getChildByName("col_label_1"):setString(TI18N("排名"))
	slot2:getChildByName("col_label_2"):setString(TI18N("玩家名字"))
	slot2:getChildByName("col_label_3"):setString(TI18N("伤害累计"))

	slot0.my_rank = slot0.main_container:getChildByName("my_rank")

	slot0.my_rank:getChildByName("title"):setString(TI18N("我的排名"))

	slot0.no_rank_label = slot0.my_rank:getChildByName("no_rank_label")

	slot0.no_rank_label:setVisible(false)

	slot0.my_rank_id = slot0.my_rank:getChildByName("rank_id")
	slot0.my_name_label = slot0.my_rank:getChildByName("my_name_label")
	slot0.my_attk_label = slot0.my_rank:getChildByName("my_attk_label")
	slot0.rank_label = slot0.my_rank:getChildByName("rank_label")
	slot0.my_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.my_head:setHeadLayerScale(0.8)
	slot0.my_head:setPosition(150, 66)
	slot0.my_rank:addChild(slot0.my_head)
end

function ActiontermbeginsRankTabRank.registerEvents(slot0)
end

function ActiontermbeginsRankTabRank.setData(slot0)
	if not slot0.parent then
		return
	end

	if slot0.parent.rank_type == RankConstant.RankType.termbegins and not slot0.is_init then
		slot0.is_init = true

		if slot0.parent.scdata then
			slot0:setScdata(slot0.parent.scdata)
		end
	end
end

function ActiontermbeginsRankTabRank.setScdata(slot0, slot1)
	if not slot0.parent then
		return
	end

	slot2 = RoleController:getInstance():getRoleVo()

	slot0.my_head:setHeadRes(slot2.face_id, false, LOADTEXT_TYPE, slot2.face_file, slot2.face_update_time)
	slot0.my_head:setLev(slot2.lev)
	slot0.my_name_label:setString(slot2.name)

	if slot0.parent.rank_type == RankConstant.RankType.termbegins then
		slot0.rank_label:setString((slot1 or {}).mydps)
	else
		slot0.rank_label:setString(TI18N("未知"))
	end

	if not slot1.rank or slot1.rank == 0 then
		slot0.no_rank_label:setVisible(true)
		slot0.my_rank_id:setVisible(false)
	else
		slot0.my_rank_id:setString(slot1.rank)
		slot0.no_rank_label:setVisible(false)
	end

	slot0.show_list = slot1.rank_list

	uv0(slot0.show_list, function (slot0, slot1)
		return slot0.rank < slot1.rank
	end)
	slot0:updateList()
end

function ActiontermbeginsRankTabRank.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.item_list, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.item_list:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 614,
			item_height = 128,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.item_list, true, {
			text = TI18N("暂无排行数据")
		})
	else
		commonShowEmptyIcon(slot0.item_list, false)
	end

	slot0.item_scrollview:reloadData()
end

function ActiontermbeginsRankTabRank.createNewCell(slot0, slot1, slot2)
	slot3 = TermbeginsRankItem.new(slot1, slot2, slot0)

	if slot0.parent then
		slot3:initRankTypeUI(slot0.parent.rank_type)
	end

	return slot3
end

function ActiontermbeginsRankTabRank.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ActiontermbeginsRankTabRank.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3, slot2)
end

function ActiontermbeginsRankTabRank.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function ActiontermbeginsRankTabRank.DeleteMe(slot0)
	if slot0.boss_form_event then
		GlobalEvent:getInstance():UnBind(slot0.boss_form_event)

		slot0.boss_form_event = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	doStopAllActions(slot0.item_scrollview)
end

TermbeginsRankItem = class("TermbeginsRankItem", function ()
	return ccui.Layout:create()
end)

function TermbeginsRankItem.ctor(slot0, slot1, slot2)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_rank_item"))
	slot0.size = cc.size(slot1, slot2)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot3 = slot0.root_wnd:getChildByName("container")
	slot0.rank_img = slot3:getChildByName("rank_img")
	slot0.role_name = slot3:getChildByName("role_name")
	slot0.role_power = slot3:getChildByName("role_power")
	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(150, 65)
	slot3:addChild(slot0.role_head)
	slot0.role_head:setLev(99)

	slot0.container = slot3

	slot0:registerEvent()
end

function TermbeginsRankItem.registerEvent(slot0)
	slot0.role_head:addCallBack(function ()
		if uv0.data ~= nil then
			FriendController:getInstance():openFriendCheckPanel(true, {
				srv_id = uv0.data.r_srvid,
				rid = uv0.data.r_rid
			})
		end
	end, false)
end

function TermbeginsRankItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function TermbeginsRankItem.setData(slot0, slot1, slot2)
	if slot1 and RoleController:getInstance():getRoleVo() then
		slot0.data = slot1

		slot0.role_name:setString(slot1.name)
		slot0.role_head:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
		slot0.role_head:setLev(slot1.lev)

		if Config.AvatarData.data_avatar[slot1.avatar_bid] then
			slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot5.res_id or 1), false, false), nil, false, slot5.offy)
		end

		if slot2 <= 3 then
			if slot0.rank_num ~= nil then
				slot0.rank_num:setVisible(false)
			end

			if slot2 == 0 then
				slot0.rank_img:setVisible(false)
			else
				if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot2)) then
					slot0.rank_res_id = slot6

					loadSpriteTexture(slot0.rank_img, slot6, LOADTEXT_TYPE_PLIST)
				end

				slot0.rank_img:setVisible(true)
			end
		else
			if slot0.rank_num == nil then
				slot0.rank_num = CommonNum.new(1, slot0.container, 1, -2, cc.p(0.5, 0.5))

				slot0.rank_num:setPosition(59, 77)
			end

			slot0.rank_num:setVisible(true)
			slot0.rank_num:setNum(slot2)
			slot0.rank_img:setVisible(false)
		end

		slot0:updateOtherInfo(slot1)
	end
end

function TermbeginsRankItem.initRankTypeUI(slot0, slot1)
	slot0.rank_type = slot1 or RankConstant.RankType.termbegins

	if slot0.rank_type == RankConstant.RankType.termbegins then
		slot0.role_name:setPositionY(65)
		slot0.container:getChildByName("role_power"):setVisible(false)
		slot0.container:getChildByName("Image_1"):setVisible(false)
		slot0.container:getChildByName("Sprite_1"):setVisible(false)
		slot0.role_head:setPosition(162, 65)
	end
end

function TermbeginsRankItem.updateOtherInfo(slot0, slot1)
	if slot0.rank_type == RankConstant.RankType.termbegins then
		slot2 = string.format(TI18N("<div fontcolor=#249003 fontsize=22>%s</div>"), slot1.all_dps)

		if slot0.score_info == nil then
			slot0.score_info = createRichLabel(20, 175, cc.p(0.5, 0.5), cc.p(480, 65), nil, nil, 300)

			slot0.container:addChild(slot0.score_info)
		end

		slot0.score_info:setString(slot2)
	end
end

function TermbeginsRankItem.DeleteMe(slot0)
	if slot0.rank_num ~= nil then
		slot0.rank_num:DeleteMe()

		slot0.rank_num = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
