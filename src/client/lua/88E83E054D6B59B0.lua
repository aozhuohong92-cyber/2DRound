PractisetowerRankPanel = class("PractisetowerRankPanel", function ()
	return ccui.Layout:create()
end)
slot1 = PractisetowerController:getInstance():getModel()

function PractisetowerRankPanel.ctor(slot0)
	slot0.is_init = true
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("practisetower/practise_tower_rank_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.scroll_container = slot0.root_wnd:getChildByName("scroll_container")
	slot0.empty_bg = slot0.scroll_container:getChildByName("empty_bg")

	slot0.empty_bg:setVisible(false)
	loadSpriteTexture(slot0.empty_bg, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), LOADTEXT_TYPE)

	slot0.desc_label = slot0.empty_bg:getChildByName("desc_label")

	slot0.desc_label:setPositionX(slot0.empty_bg:getContentSize().width / 2)
	slot0.desc_label:setString(TI18N("暂无记录"))

	slot0.scroll_view = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot0.scroll_container:getContentSize().width, slot0.scroll_container:getContentSize().height), {
		start_y = 0,
		item_width = 600,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 135,
		space_y = 2,
		col = 1,
		need_dynamic = true,
		item_class = PractisetowerRankItem
	})

	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot3 = slot0.root_wnd:getChildByName("my_container")

	slot3:getChildByName("my_rank_title"):setString(TI18N("我的排名"))
	slot0.root_wnd:getChildByName("title_1"):setString(TI18N("排名"))
	slot0.root_wnd:getChildByName("title_2"):setString(TI18N("玩家信息"))
	slot0.root_wnd:getChildByName("title_3"):setString(TI18N("回放"))
	slot0.root_wnd:getChildByName("title_4"):setString(TI18N("通关时间"))

	slot0.rank_img = slot3:getChildByName("rank_img")

	slot0.rank_img:setVisible(false)

	slot0.role_name = slot3:getChildByName("role_name")
	slot0.role_power = slot3:getChildByName("role_power")
	slot0.no_rank = slot3:getChildByName("no_rank")

	slot0.no_rank:setString(TI18N("未上榜"))
	slot0.no_rank:setVisible(false)

	slot0.voide_btn = slot3:getChildByName("voide_btn")

	slot0.voide_btn:setVisible(false)

	slot0.time_lab = slot3:getChildByName("time_lab")

	slot0.time_lab:setVisible(false)

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.9)
	slot0.role_head:setPosition(150, 76)
	slot0.role_head:setLev(99)
	slot3:addChild(slot0.role_head)

	slot0.my_container = slot3

	slot0:registerEvent()
	slot0:addToParent()
end

function PractisetowerRankPanel.createNewCell(slot0)
	return PractisetowerRankItem.new()
end

function PractisetowerRankPanel.numberOfCells(slot0)
	if not slot0.rank_list then
		return 0
	end

	return #slot0.rank_list
end

function PractisetowerRankPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.rank_list[slot2] then
		return
	end

	slot4 = slot1:setData(slot3)
end

function PractisetowerRankPanel.registerEvent(slot0)
	if slot0.update_rank_event == nil then
		slot0.update_rank_event = GlobalEvent:getInstance():Bind(PractisetowerEvent.Update_Top3_rank, function (slot0)
			if not slot0 then
				return
			end

			uv0:updateRankList(slot0)
		end)
	end

	registerButtonEventListener(slot0.voide_btn, function ()
		slot0 = RoleController:getInstance():getRoleVo()

		if uv0.data and slot0 then
			BattleController:getInstance():csRecordBattle(uv0.data.role_video_id, slot0.srv_id)
		end
	end, true)
end

function PractisetowerRankPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function PractisetowerRankPanel.addToParent(slot0)
	if slot0.is_init == true then
		uv0:sender29105()

		slot0.is_init = false
	end
end

function PractisetowerRankPanel.updateRankList(slot0, slot1)
	slot2 = RoleController:getInstance():getRoleVo()

	if slot1 and slot2 then
		slot0.data = slot1

		slot0.role_name:setString(slot2.name)
		slot0.role_power:setString(string.format(TI18N("通关层数：%d层"), slot1.role_val))

		if slot1.role_rank and slot1.role_rank <= 3 then
			if slot0.rank_num ~= nil then
				slot0.setVisible(false)
			end

			if slot1.role_rank == 0 then
				slot0.rank_img:setVisible(false)
				slot0.no_rank:setVisible(true)
			else
				slot0.no_rank:setVisible(false)

				if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot1.role_rank)) then
					slot0.rank_res_id = slot3

					loadSpriteTexture(slot0.rank_img, slot3, LOADTEXT_TYPE_PLIST)
				end

				slot0.rank_img:setVisible(true)
			end
		else
			if slot0.rank_num == nil then
				slot0.rank_num = CommonNum.new(1, slot0.my_container, 1, -2, cc.p(0.5, 0.5))

				slot0.rank_num:setPosition(48, 90)
			end

			slot0.rank_num:setVisible(true)
			slot0.rank_num:setNum(slot1.role_rank)
			slot0.rank_img:setVisible(false)
		end

		slot0.role_head:setHeadRes(slot2.face_id, false, LOADTEXT_TYPE, slot2.face_file, slot2.face_update_time)
		slot0.role_head:setLev(slot2.lev)

		if Config.AvatarData.data_avatar[slot2.avatar_bid] then
			slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot4.res_id or 1), false, false), nil, false, slot4.offy)
		end

		if slot1.role_video_id > 0 then
			slot0.voide_btn:setVisible(true)
		end

		if slot1.role_unixtime > 0 then
			slot0.time_lab:setVisible(true)
		end

		slot0.time_lab:setString(string.format("%s\n%s", TimeTool.getYMD(slot1.role_unixtime), TimeTool.getHM(slot1.role_unixtime)))

		slot0.rank_list = {}

		if slot1.practise_role_rank ~= nil and next(slot1.practise_role_rank) ~= nil then
			slot0.rank_list = slot1.practise_role_rank

			slot0.empty_bg:setVisible(false)
		else
			slot0.empty_bg:setVisible(true)
		end

		table.sort(slot0.rank_list, SortTools.KeyLowerSorter("rank"))
		slot0.scroll_view:reloadData()
	end
end

function PractisetowerRankPanel.DeleteMe(slot0)
	if slot0.update_rank_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_rank_event)

		slot0.update_rank_event = nil
	end

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
end

PractisetowerRankItem = class("PractisetowerRankItem", function ()
	return ccui.Layout:create()
end)

function PractisetowerRankItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("practisetower/practise_tower_rank_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.rank_img = slot1:getChildByName("rank_img")
	slot0.role_name = slot1:getChildByName("role_name")
	slot0.role_power = slot1:getChildByName("role_power")
	slot0.voide_btn = slot1:getChildByName("voide_btn")
	slot0.time_lab = slot1:getChildByName("time_lab")
	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(150, 65)
	slot1:addChild(slot0.role_head)
	slot0.role_head:setLev(99)

	slot0.container = slot1

	slot0:registerEvent()
end

function PractisetowerRankItem.registerEvent(slot0)
	slot0.role_head:addCallBack(function ()
		if uv0.data ~= nil then
			if RoleController:getInstance():getRoleVo() and uv0.data.rid == slot0.rid and uv0.data.srv_id == slot0.srv_id then
				message(TI18N("这是你自己~"))

				return
			end

			FriendController:getInstance():openFriendCheckPanel(true, {
				srv_id = uv0.data.srv_id,
				rid = uv0.data.rid
			})
		end
	end, false)
	registerButtonEventListener(slot0.voide_btn, function ()
		if uv0.data then
			BattleController:getInstance():csRecordBattle(uv0.data.video_id, uv0.data.srv_id)
		end
	end, true)
end

function PractisetowerRankItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function PractisetowerRankItem.setData(slot0, slot1)
	if slot1 and RoleController:getInstance():getRoleVo() then
		slot0.data = slot1

		slot0.role_name:setString(slot1.name)
		slot0.role_power:setString(string.format(TI18N("通关层数：%d层"), slot1.val))
		slot0.role_head:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
		slot0.role_head:setLev(slot1.lev)

		if Config.AvatarData.data_avatar[slot1.avatar_bid] then
			slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot4.res_id or 1), false, false), nil, false, slot4.offy)
		end

		if slot1.rank <= 3 then
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
				slot0.rank_num = CommonNum.new(1, slot0.container, 1, -2, cc.p(0.5, 0.5))

				slot0.rank_num:setPosition(43, 80)
			end

			slot0.rank_num:setVisible(true)
			slot0.rank_num:setNum(slot1.rank)
			slot0.rank_img:setVisible(false)
		end

		slot0.time_lab:setString(string.format("%s\n%s", TimeTool.getYMD(slot1.unixtime), TimeTool.getHM(slot1.unixtime)))
	end
end

function PractisetowerRankItem.DeleteMe(slot0)
	if slot0.role_head then
		slot0.role_head:DeleteMe()

		slot0.role_head = nil
	end

	if slot0.rank_num ~= nil then
		slot0.rank_num:DeleteMe()

		slot0.rank_num = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
