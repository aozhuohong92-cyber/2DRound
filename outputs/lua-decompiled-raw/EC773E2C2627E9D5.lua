ElementRankPanel = class("ElementRankPanel", function ()
	return ccui.Layout:create()
end)
slot1 = ElementController:getInstance():getModel()

function ElementRankPanel.ctor(slot0)
	slot0.is_init = true
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_rank_panel"))
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

	slot1 = slot0.scroll_container:getContentSize()
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.scroll_container, nil, , , cc.size(slot1.width, slot1.height - 10), {
		start_y = 0,
		item_width = 614,
		start_x = 4,
		space_x = 4,
		row = 0,
		item_height = 125,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = ElementRankItem
	})
	slot4 = slot0.root_wnd:getChildByName("my_container")
	slot5 = slot4:getChildByName("my_rank_title")
	slot0.rank_img = slot4:getChildByName("rank_img")

	slot0.rank_img:setVisible(false)

	slot0.rank_x = slot0.rank_img:getPositionX()
	slot0.rank_y = slot0.rank_img:getPositionY()
	slot0.role_name = slot4:getChildByName("role_name")
	slot0.role_power = slot4:getChildByName("role_power")
	slot0.no_rank = slot4:getChildByName("no_rank")

	slot0.no_rank:setString(TI18N("未上榜"))
	slot0.no_rank:setVisible(false)

	slot0.my_score_info = createRichLabel(20, 175, cc.p(0.5, 0.5), cc.p(520, 65), nil, , 300)

	slot4:addChild(slot0.my_score_info)

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(150, 65)
	slot0.role_head:setLev(99)
	slot4:addChild(slot0.role_head)

	slot0.my_container = slot4

	slot0:registerEvent()
end

function ElementRankPanel.registerEvent(slot0)
	if slot0.update_rank_event == nil then
		slot0.update_rank_event = GlobalEvent:getInstance():Bind(RankEvent.RankEvent_Get_Rank_data, function (slot0)
			if slot0.type == RankConstant.RankType.element then
				uv0:updateRankList(slot0)
			end
		end)
	end
end

function ElementRankPanel.setNodeVisible(slot0, slot1)
	slot0:setVisible(slot1)
end

function ElementRankPanel.addToParent(slot0)
	if slot0.is_init == true then
		RankController:send_12900(RankConstant.RankType.element)

		slot0.is_init = false
	end
end

function ElementRankPanel.updateRankList(slot0, slot1)
	slot2 = RoleController:getInstance():getRoleVo()

	if slot1 and slot2 then
		slot0.role_name:setString(slot2.name)
		slot0.role_power:setString(slot2.power)

		if slot1.my_idx and slot1.my_idx <= 3 then
			if slot0.rank_num ~= nil then
				slot0.setVisible(false)
			end

			if slot1.my_idx == 0 then
				slot0.rank_img:setVisible(false)
				slot0.no_rank:setVisible(true)
			else
				slot0.no_rank:setVisible(false)

				if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot1.my_idx)) then
					slot0.rank_res_id = slot3

					loadSpriteTexture(slot0.rank_img, slot3, LOADTEXT_TYPE_PLIST)
				end

				slot0.rank_img:setVisible(true)
			end
		else
			if slot0.rank_num == nil then
				slot0.rank_num = CommonNum.new(1, slot0.my_container, 1, -2, cc.p(0.5, 0.5))

				slot0.rank_num:setPosition(59, 77)
			end

			slot0.rank_num:setVisible(true)
			slot0.rank_num:setNum(slot1.my_idx)
			slot0.rank_img:setVisible(false)
		end

		slot0.my_score_info:setString(string.format(TI18N("<div>%s</div><div fontcolor=#249003 fontsize=22>%s</div>"), TI18N("最大通关数:"), slot1.my_val1 or 0))
		slot0.role_head:setHeadRes(slot2.face_id, false, LOADTEXT_TYPE, slot2.face_file, slot2.face_update_time)
		slot0.role_head:setLev(slot2.lev)

		if Config.AvatarData.data_avatar[slot2.avatar_base_id] then
			slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot5.res_id or 1), false, false), nil, false, slot5.offy)
		end

		if slot1.rank_list ~= nil and next(slot1.rank_list) ~= nil then
			slot0.scroll_view:setData(slot1.rank_list)
			slot0.empty_bg:setVisible(false)
		else
			slot0.empty_bg:setVisible(true)
		end
	end
end

function ElementRankPanel.DeleteMe(slot0)
	if slot0.update_rank_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_rank_event)

		slot0.update_rank_event = nil
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

ElementRankItem = class("ElementRankItem", function ()
	return ccui.Layout:create()
end)

function ElementRankItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_rank_item"))
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
	slot0.score_info = createRichLabel(20, 175, cc.p(0.5, 0.5), cc.p(520, 60), nil, , 300)

	slot1:addChild(slot0.score_info)

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(150, 65)
	slot1:addChild(slot0.role_head)
	slot0.role_head:setLev(99)

	slot0.container = slot1

	slot0:registerEvent()
end

function ElementRankItem.registerEvent(slot0)
	slot0.role_head:addCallBack(function ()
		if uv0.data ~= nil then
			FriendController:getInstance():openFriendCheckPanel(true, {
				srv_id = uv0.data.srv_id,
				rid = uv0.data.rid
			})
		end
	end, false)
end

function ElementRankItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function ElementRankItem.setData(slot0, slot1)
	if slot1 and RoleController:getInstance():getRoleVo() then
		slot0.data = slot1

		slot0.role_name:setString(slot1.name)
		slot0.role_power:setString(slot1.val2)
		slot0.role_head:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
		slot0.role_head:setLev(slot1.lev)

		if Config.AvatarData.data_avatar[slot1.avatar_id] then
			slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot4.res_id or 1), false, false), nil, false, slot4.offy)
		end

		if slot1.idx <= 3 then
			if slot0.rank_num ~= nil then
				slot0.rank_num:setVisible(false)
			end

			if slot1.idx == 0 then
				slot0.rank_img:setVisible(false)
			else
				if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot1.idx)) then
					slot0.rank_res_id = slot5

					loadSpriteTexture(slot0.rank_img, slot5, LOADTEXT_TYPE_PLIST)
				end

				slot0.rank_img:setVisible(true)
			end
		else
			if slot0.rank_num == nil then
				slot0.rank_num = CommonNum.new(1, slot0.container, 1, -2, cc.p(0.5, 0.5))

				slot0.rank_num:setPosition(59, 77)
			end

			slot0.rank_num:setVisible(true)
			slot0.rank_num:setNum(slot1.idx)
			slot0.rank_img:setVisible(false)
		end

		slot0.score_info:setString(string.format(TI18N("<div>%s</div><div fontcolor=#249003 fontsize=22>%s</div>"), TI18N("本周通关数:"), slot1.val1 or 0))
	end
end

function ElementRankItem.DeleteMe(slot0)
	if slot0.rank_num ~= nil then
		slot0.rank_num:DeleteMe()

		slot0.rank_num = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
