ArenaManyPeopleRankPanel = class("ArenaManyPeopleRankPanel", function ()
	return ccui.Layout:create()
end)
slot1 = ArenaManyPeopleController:getInstance():getModel()

function ArenaManyPeopleRankPanel.ctor(slot0)
	slot0.is_init = true
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arenamanypeople/amp_rank_panel"))
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
		item_class = ArenaManyPeopleRankItem
	})

	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot3 = slot0.root_wnd:getChildByName("my_container")

	slot3:getChildByName("my_rank_title"):setString(TI18N("我的排名"))
	slot0.root_wnd:getChildByName("title_1"):setString(TI18N("排名"))
	slot0.root_wnd:getChildByName("title_2"):setString(TI18N("玩家信息"))
	slot0.root_wnd:getChildByName("title_3"):setString(TI18N("段位"))
	slot0.root_wnd:getChildByName("title_4"):setString(TI18N("积分"))

	slot0.rank_img = slot3:getChildByName("rank_img")

	slot0.rank_img:setVisible(false)

	slot0.lev_icon = slot3:getChildByName("lev_icon")
	slot0.lev_lab = slot3:getChildByName("lev_lab")
	slot0.score_num = slot3:getChildByName("score_num")
	slot0.role_name = slot3:getChildByName("role_name")
	slot0.role_power = slot3:getChildByName("role_power")
	slot0.power_bg = slot3:getChildByName("Image_1")
	slot0.no_rank = slot3:getChildByName("no_rank")

	slot0.no_rank:setString(TI18N("未上榜"))
	slot0.no_rank:setVisible(false)

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.9)
	slot0.role_head:setPosition(150, 76)
	slot0.role_head:setLev(99)
	slot3:addChild(slot0.role_head)

	slot0.my_container = slot3

	slot0:registerEvent()
	slot0:addToParent()
end

function ArenaManyPeopleRankPanel.createNewCell(slot0)
	return ArenaManyPeopleRankItem.new()
end

function ArenaManyPeopleRankPanel.numberOfCells(slot0)
	if not slot0.rank_list then
		return 0
	end

	return #slot0.rank_list
end

function ArenaManyPeopleRankPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.rank_list[slot2] then
		return
	end

	slot4 = slot1:setData(slot3)
end

function ArenaManyPeopleRankPanel.registerEvent(slot0)
	if slot0.update_rank_event == nil then
		slot0.update_rank_event = GlobalEvent:getInstance():Bind(ArenaManyPeopleEvent.ARENAMANYPOEPLE_MAIN_RANK_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0:updateRankList(slot0)
		end)
	end
end

function ArenaManyPeopleRankPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function ArenaManyPeopleRankPanel.addToParent(slot0)
	if slot0.is_init == true then
		uv0:sender29025(1, 100)

		slot0.is_init = false
	end
end

function ArenaManyPeopleRankPanel.updateRankList(slot0, slot1)
	slot2 = uv0:getMyInfo()

	if slot1 and slot2 then
		slot0.role_name:setString(slot2.name)
		slot0.role_power:setString(slot2.power)
		slot0.power_bg:setContentSize(cc.size(slot0.role_power:getContentSize().width + 75, slot0.power_bg:getContentSize().height))

		if slot1.rank and slot1.rank <= 3 then
			if slot0.rank_num ~= nil then
				slot0.setVisible(false)
			end

			if slot1.rank == 0 then
				slot0.rank_img:setVisible(false)
				slot0.no_rank:setVisible(true)
			else
				slot0.no_rank:setVisible(false)

				if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot1.rank)) then
					slot0.rank_res_id = slot5

					loadSpriteTexture(slot0.rank_img, slot5, LOADTEXT_TYPE_PLIST)
				end

				slot0.rank_img:setVisible(true)
			end
		else
			if slot0.rank_num == nil then
				slot0.rank_num = CommonNum.new(1, slot0.my_container, 1, -2, cc.p(0.5, 0.5))

				slot0.rank_num:setPosition(48, 90)
			end

			slot0.rank_num:setVisible(true)
			slot0.rank_num:setNum(slot1.rank)
			slot0.rank_img:setVisible(false)
		end

		slot0.score_num:setString(slot2.score or 0)

		if Config.HolidayArenaTeamData.data_elite_level[slot2.score_lev] then
			slot7 = cc.c4b(86, 46, 13, 255)

			if slot6.icon == "amp_icon_1" or slot6.icon == "amp_icon_2" or slot6.icon == "amp_icon_3" then
				slot7 = cc.c4b(48, 56, 83, 255)
			end

			slot0.lev_lab:enableOutline(slot7, 2)
			slot0.lev_lab:setString(slot6.name)

			slot0.item_load = loadSpriteTextureFromCDN(slot0.lev_icon, PathTool.getPlistImgForDownLoad("arenampmatch/arenampmatch_icon", slot6.icon), ResourcesType.single, slot0.item_load)
		end

		slot0.role_head:setHeadRes(slot2.face_id, false, LOADTEXT_TYPE, slot2.face_file, slot2.face_update_time)
		slot0.role_head:setLev(slot2.lev)

		if Config.AvatarData.data_avatar[slot2.avatar_bid] then
			slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot8.res_id or 1), false, false), nil, false, slot8.offy)
		end

		slot0.rank_list = {}

		if slot1.team_members ~= nil and next(slot1.team_members) ~= nil then
			slot0.rank_list = slot1.team_members

			slot0.empty_bg:setVisible(false)
		else
			slot0.empty_bg:setVisible(true)
		end

		table.sort(slot0.rank_list, SortTools.KeyLowerSorter("rank"))
		slot0.scroll_view:reloadData()
	end
end

function ArenaManyPeopleRankPanel.DeleteMe(slot0)
	if slot0.update_rank_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_rank_event)

		slot0.update_rank_event = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
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

ArenaManyPeopleRankItem = class("ArenaManyPeopleRankItem", function ()
	return ccui.Layout:create()
end)

function ArenaManyPeopleRankItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arenamanypeople/amp_rank_item"))
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
	slot0.power_bg = slot1:getChildByName("Image_1")
	slot0.lev_icon = slot1:getChildByName("lev_icon")
	slot0.lev_lab = slot1:getChildByName("lev_lab")
	slot0.score_num = slot1:getChildByName("score_num")
	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(150, 65)
	slot1:addChild(slot0.role_head)
	slot0.role_head:setLev(99)

	slot0.container = slot1

	slot0:registerEvent()
end

function ArenaManyPeopleRankItem.registerEvent(slot0)
	slot0.role_head:addCallBack(function ()
		if uv0.data ~= nil then
			if RoleController:getInstance():getRoleVo() and uv0.data.rid == slot0.rid and uv0.data.sid == slot0.srv_id then
				message(TI18N("这是你自己~"))

				return
			end

			FriendController:getInstance():openFriendCheckPanel(true, {
				srv_id = uv0.data.sid,
				rid = uv0.data.rid
			})
		end
	end, false)
end

function ArenaManyPeopleRankItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function ArenaManyPeopleRankItem.setData(slot0, slot1)
	if slot1 and RoleController:getInstance():getRoleVo() then
		slot0.data = slot1

		slot0.role_name:setString(slot1.name)
		slot0.role_power:setString(slot1.power)
		slot0.power_bg:setContentSize(cc.size(slot0.role_power:getContentSize().width + 75, slot0.power_bg:getContentSize().height))
		slot0.role_head:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
		slot0.role_head:setLev(slot1.lev)

		if Config.AvatarData.data_avatar[slot1.avatar_bid] then
			slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot6.res_id or 1), false, false), nil, false, slot6.offy)
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

				slot0.rank_num:setPosition(43, 80)
			end

			slot0.rank_num:setVisible(true)
			slot0.rank_num:setNum(slot1.rank)
			slot0.rank_img:setVisible(false)
		end

		slot0.score_num:setString(slot1.score or 0)

		if Config.HolidayArenaTeamData.data_elite_level[slot1.score_lev] then
			slot9 = cc.c4b(86, 46, 13, 255)

			if slot8.icon == "amp_icon_1" or slot8.icon == "amp_icon_2" or slot8.icon == "amp_icon_3" then
				slot9 = cc.c4b(48, 56, 83, 255)
			end

			slot0.lev_lab:enableOutline(slot9, 2)
			slot0.lev_lab:setString(slot8.name)

			slot0.item_load = loadSpriteTextureFromCDN(slot0.lev_icon, PathTool.getPlistImgForDownLoad("arenampmatch/arenampmatch_icon", slot8.icon), ResourcesType.single, slot0.item_load)
		end
	end
end

function ArenaManyPeopleRankItem.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

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
