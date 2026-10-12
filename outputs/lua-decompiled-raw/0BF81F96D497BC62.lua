slot1 = MonopolyController:getInstance():getModel()
MonopolyPersonalRankPanel = class("MonopolyPersonalRankPanel", function ()
	return ccui.Layout:create()
end)

function MonopolyPersonalRankPanel.ctor(slot0, slot1)
	slot0.step_id = slot1
	slot0.is_init = true
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("monopoly/monopoly_rank_guild_panel"))
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
	slot0.root_wnd:getChildByName("title_bg"):setVisible(false)

	slot3 = slot0.scroll_container:getContentSize()
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.scroll_container, nil, , , cc.size(slot3.width, slot3.height - 10), {
		start_y = 0,
		item_width = 614,
		start_x = 4,
		space_x = 4,
		row = 0,
		item_height = 125,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = MonopolyPersonalRankItem
	})
	slot6 = slot0.root_wnd:getChildByName("my_container")

	slot6:getChildByName("my_rank_title"):setString(TI18N("我的排名"))

	slot0.rank_img = slot6:getChildByName("rank_img")

	slot0.rank_img:setVisible(false)

	slot0.rank_x = slot0.rank_img:getPositionX()
	slot0.rank_y = slot0.rank_img:getPositionY()
	slot0.role_name = slot6:getChildByName("role_name")

	slot0.role_name:setVisible(true)

	slot0.atk_image = slot6:getChildByName("atk_image")

	slot0.atk_image:setVisible(true)

	slot0.atk_txt = slot0.atk_image:getChildByName("atk_txt")
	slot0.no_rank = slot6:getChildByName("no_rank")

	slot0.no_rank:setString(TI18N("未上榜"))
	slot0.no_rank:setVisible(false)

	slot0.my_rank_txt = slot6:getChildByName("rank_id")
	slot0.my_score_info = createRichLabel(20, 175, cc.p(0.5, 0.5), cc.p(520, 65), nil, , 300)

	slot6:addChild(slot0.my_score_info)

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(150, 65)
	slot0.role_head:setLev(99)
	slot6:addChild(slot0.role_head)

	slot0.my_container = slot6

	slot0:registerEvent()
end

function MonopolyPersonalRankPanel.registerEvent(slot0)
	if slot0.update_rank_event == nil then
		slot0.update_rank_event = GlobalEvent:getInstance():Bind(MonopolyEvent.Get_Personal_Rank_Data_Event, function (slot0)
			if slot0 and slot0.id == uv0.step_id then
				uv0:updateRankList(slot0)
			end
		end)
	end
end

function MonopolyPersonalRankPanel.setNodeVisible(slot0, slot1)
	slot0:setVisible(slot1)
end

function MonopolyPersonalRankPanel.addToParent(slot0)
	if slot0.is_init == true then
		if slot0.step_id then
			uv0:sender27502(slot0.step_id)
		end

		slot0.is_init = false
	end
end

function MonopolyPersonalRankPanel.updateRankList(slot0, slot1)
	slot2 = RoleController:getInstance():getRoleVo()

	if slot1 and slot2 then
		slot0.role_name:setString(slot2.name)
		slot0.atk_txt:setString(slot2.power)
		slot0.role_head:setHeadRes(slot2.face_id, false, LOADTEXT_TYPE, slot2.face_file, slot2.face_update_time)
		slot0.role_head:setLev(slot2.lev)

		if Config.AvatarData.data_avatar[slot2.avatar_bid] then
			slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot4.res_id or 1), false, false), nil, false, slot4.offy)
		end

		slot5 = {}

		for slot9, slot10 in pairs(slot1.rank_list or {}) do
			if slot10.rid == slot2.rid and slot10.srv_id == slot2.srv_id then
				slot5 = slot10

				break
			end
		end

		if next(slot5) == nil then
			slot0.my_rank_txt:setVisible(false)
			slot0.rank_img:setVisible(false)
			slot0.no_rank:setVisible(true)
			slot0.my_score_info:setString(TI18N("<div>造成伤害:</div><div fontcolor=#249003 fontsize=22>0</div>"))
		else
			if slot5.rank and slot5.rank <= 3 then
				slot0.my_rank_txt:setVisible(false)

				if slot5.rank == 0 then
					slot0.rank_img:setVisible(false)
					slot0.no_rank:setVisible(true)
				else
					slot0.no_rank:setVisible(false)

					if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%d", slot5.rank or 1)) then
						slot0.rank_res_id = slot6

						loadSpriteTexture(slot0.rank_img, slot6, LOADTEXT_TYPE_PLIST)
					end

					slot0.rank_img:setVisible(true)
				end
			else
				slot0.my_rank_txt:setVisible(true)
				slot0.my_rank_txt:setString(slot5.rank or 0)
				slot0.rank_img:setVisible(false)
			end

			slot0.my_score_info:setString(string.format(TI18N("<div>造成伤害:</div><div fontcolor=#249003 fontsize=22>%s</div>"), MoneyTool.GetMoneyWanString(slot5.dps or 0)))
		end

		if slot1.rank_list ~= nil and next(slot1.rank_list) ~= nil then
			table.sort(slot1.rank_list, SortTools.KeyLowerSorter("rank"))
			slot0.scroll_view:setData(slot1.rank_list)
			slot0.empty_bg:setVisible(false)
		else
			slot0.empty_bg:setVisible(true)
		end
	end
end

function MonopolyPersonalRankPanel.DeleteMe(slot0)
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

MonopolyPersonalRankItem = class("ElementRankItem", function ()
	return ccui.Layout:create()
end)

function MonopolyPersonalRankItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("monopoly/monopoly_rank_personal_item"))
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
	slot0.wish_container = slot1:getChildByName("wish_container")
	slot0.wish_num_txt = slot0.wish_container:getChildByName("num")
	slot0.score_info = createRichLabel(20, 175, cc.p(0.5, 0.5), cc.p(505, 32), nil, , 300)

	slot1:addChild(slot0.score_info)

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(150, 65)
	slot1:addChild(slot0.role_head)
	slot0.role_head:setLev(99)

	slot0.container = slot1

	slot0:registerEvent()
end

function MonopolyPersonalRankItem.registerEvent(slot0)
	slot0.role_head:addCallBack(function ()
		if uv0.data ~= nil then
			FriendController:getInstance():openFriendCheckPanel(true, {
				srv_id = uv0.data.srv_id,
				rid = uv0.data.rid
			})
		end
	end, false)
	registerButtonEventListener(slot0.wish_container, handler(slot0, slot0.onClickWishBtn), true)
end

function MonopolyPersonalRankItem.onClickWishBtn(slot0)
	if slot0.data then
		RoleController:getInstance():requestWorshipRole(slot0.data.rid, slot0.data.srv_id, slot0.data.rank, WorshipType.monopoly)

		slot0.data.worship_num = slot0.data.worship_num + 1
		slot0.data.worship_status = 1

		slot0.wish_num_txt:setString(slot0.data.worship_num)
		slot0.wish_container:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.wish_container)
	end
end

function MonopolyPersonalRankItem.setData(slot0, slot1)
	if slot1 then
		slot0.data = slot1

		slot0.role_name:setString(slot1.name)
		slot0.role_power:setString(slot1.power)
		slot0.role_head:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
		slot0.role_head:setLev(slot1.lev)

		if Config.AvatarData.data_avatar[slot1.avatar_bid] then
			slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot3.res_id or 1), false, false), nil, false, slot3.offy)
		end

		if slot1.rank <= 3 then
			if slot0.rank_num ~= nil then
				slot0.rank_num:setVisible(false)
			end

			if slot1.rank == 0 then
				slot0.rank_img:setVisible(false)
			else
				if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%d", slot1.rank or 1)) then
					slot0.rank_res_id = slot4

					loadSpriteTexture(slot0.rank_img, slot4, LOADTEXT_TYPE_PLIST)
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

		slot0.score_info:setString(string.format(TI18N("<div>造成伤害:</div><div fontcolor=#249003 fontsize=22>%s</div>"), MoneyTool.GetMoneyWanString(slot1.dps or 0)))
		slot0.wish_num_txt:setString(slot1.worship_num)
		slot0.wish_container:setTouchEnabled(slot1.worship_status == 0)
		setChildUnEnabled(slot1.worship_status == 1, slot0.wish_container)
	end
end

function MonopolyPersonalRankItem.DeleteMe(slot0)
	if slot0.rank_num ~= nil then
		slot0.rank_num:DeleteMe()

		slot0.rank_num = nil
	end

	if slot0.role_head then
		slot0.role_head:DeleteMe()

		slot0.role_head = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
