RedBagRankPanel = class("RedBagRankPanel", function ()
	return ccui.Widget:create()
end)
slot0 = table.insert

function RedBagRankPanel.ctor(slot0, slot1)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function RedBagRankPanel.config(slot0)
	slot0.ctrl = RedbagController:getInstance()
	slot0.size = cc.size(644, 740)

	slot0:setContentSize(slot0.size)
	slot0:setTouchEnabled(false)
end

function RedBagRankPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("redbag/redbag_rank"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.size = slot0.main_panel:getContentSize()
	slot0.top_panel = slot0.main_panel:getChildByName("top_panel")
	slot0.look_btn = slot0.top_panel:getChildByName("look_btn")

	slot0.look_btn:setTitleText(TI18N("查看详情"))
	slot0.look_btn:getTitleRenderer():enableOutline(Config.ColorData.data_color4[264], 2)

	slot0.no_label = createLabel(24, Config.ColorData.data_color4[1], nil, slot0.size.width / 2, 780, "", slot0.main_panel, 0, cc.p(0.5, 0))

	slot0.no_label:setString(TI18N("虚位以待！"))
	slot0.no_label:setVisible(false)

	slot0.head_bg = slot0.top_panel:getChildByName("head_bg")
	slot0.head_icon = PlayerHead.new(PlayerHead.type.circle)

	slot0.head_icon:setPosition(cc.p(53, 53))
	slot0.head_icon:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.head_bg:addChild(slot0.head_icon)
	slot0.head_bg:setVisible(false)
	slot0.look_btn:setVisible(false)

	slot0.role_name = createLabel(24, Config.ColorData.data_color4[1], cc.c4b(139, 9, 9, 255), 160, 62, "", slot0.top_panel, 2, cc.p(0, 0.5))
end

function RedBagRankPanel.setData(slot0, slot1)
end

function RedBagRankPanel.registerEvents(slot0)
	slot0.look_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if not uv0.first_data then
				return
			end

			slot3 = cc.p(slot0:getTouchEndPosition().x + 320, slot0:getTouchEndPosition().y)

			if RoleController:getInstance():getRoleVo().rid == uv0.first_data.rid and slot2.srv_id == uv0.first_data.srv_id then
				message(TI18N("你连自己都不认识了么？"))

				return
			end

			ChatController:getInstance():openFriendInfo(uv0.first_data, slot3)
		end
	end)

	if not slot0.rank_list_event then
		slot0.rank_list_event = GlobalEvent:getInstance():Bind(RedbagEvent.Rank_List_Event, function (slot0)
			uv0:updateMessage(slot0)
			uv0:updateRankList(slot0)
		end)
	end
end

function RedBagRankPanel.updateMessage(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot1.list or next(slot1.list) == nil then
		return
	end

	slot0.first_data = slot1.list[1]

	slot0.role_name:setString(slot0.first_data.name or "")
	slot0.head_icon:setHeadRes(slot0.first_data.face_id, false, LOADTEXT_TYPE, slot0.first_data.face_file, slot0.first_data.face_update_time)

	if Config.AvatarData.data_avatar[slot0.first_data.avatar_bid] then
		slot0.head_icon:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot2.res_id or 1), false, false), nil, false, slot2.offy)
	end
end

function RedBagRankPanel.updateRankList(slot0, slot1)
	if not slot1 then
		slot0:showEmptyIcon(true)

		return
	end

	if not slot0.list_view then
		slot0.list_view = CommonScrollViewLayout.new(slot0.main_panel, cc.p(27, 24), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(600, 686), {
			start_y = 0,
			item_width = 600,
			start_x = -5,
			space_x = 30,
			row = 1,
			item_height = 123,
			space_y = 2,
			col = 1,
			item_class = RedRankItem
		})
	end

	if not slot1.list and not {} or next(slot2) == nil then
		slot0:showEmptyIcon(true)

		return
	end

	slot0:showEmptyIcon(false)
	slot0.list_view:setData(slot2, function (slot0, slot1)
	end)
end

function RedBagRankPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function RedBagRankPanel.showEmptyIcon(slot0, slot1)
	slot0.head_bg:setVisible(not slot1)
	slot0.look_btn:setVisible(not slot1)

	if not slot0.empty_con and slot1 == false then
		return
	end

	if not slot0.empty_con then
		slot2 = cc.size(200, 200)
		slot0.empty_con = ccui.Widget:create()

		slot0.empty_con:setContentSize(slot2)
		slot0.empty_con:setAnchorPoint(cc.p(0.5, 0))
		slot0.empty_con:setPosition(cc.p(slot0.size.width / 2, 330))
		slot0.main_panel:addChild(slot0.empty_con, 10)

		slot4 = createImage(slot0.empty_con, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), slot2.width / 2, slot2.height / 2, cc.p(0.5, 0.5), false)
		slot0.empty_label = createLabel(26, Config.ColorData.data_color4[175], nil, slot2.width / 2, -10, "", slot0.empty_con, 0, cc.p(0.5, 0))
	end

	slot0.empty_label:setString(TI18N("暂无排行"))
	slot0.empty_con:setVisible(slot1)
	slot0.no_label:setVisible(slot1)
end

function RedBagRankPanel.DeleteMe(slot0)
	if slot0.rank_list_event then
		GlobalEvent:getInstance():UnBind(slot0.rank_list_event)

		slot0.rank_list_event = nil
	end
end

RedRankItem = class("RedRankItem", function ()
	return ccui.Widget:create()
end)

function RedRankItem.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function RedRankItem.config(slot0)
	slot0.size = cc.size(600, 123)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))

	slot0.is_show_point = false
	slot0.star_list = {}
end

function RedRankItem.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("redbag/redbag_rank_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.rank_icon = createImage(slot0.main_panel, nil, 60, slot0.size.height / 2, cc.p(0.5, 0.5), true, 1, false)
	slot0.role_name = createLabel(26, Config.ColorData.data_color4[175], nil, 125, slot0.size.height / 2, "", slot0.main_panel, 0, cc.p(0, 0.5))
	slot0.rank_index = createLabel(30, Config.ColorData.data_color4[186], nil, 50, slot0.size.height / 2, "", slot0.main_panel, 0, cc.p(0.5, 0.5), "fonts/title.ttf")
	slot0.send_money = createLabel(22, Config.ColorData.data_color4[175], nil, 355, slot0.size.height / 2 + 15, "", slot0.main_panel, 0, cc.p(0, 0.5))
	slot0.send_num = createLabel(22, Config.ColorData.data_color4[186], nil, 355, slot0.size.height / 2 - 15, "", slot0.main_panel, 0, cc.p(0, 0.5))
end

function RedRankItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.index = slot1._index or 1

	slot0.rank_index:setString(slot0.index)

	if slot0.index >= 1 and slot0.index <= 3 then
		slot0.rank_index:setVisible(false)
		slot0.rank_icon:setVisible(true)
		slot0.rank_icon:loadTexture(PathTool.getResFrame("common", "common_300" .. slot0.index), LOADTEXT_TYPE_PLIST)
		slot0.rank_icon:setScale(0.7)
	else
		slot0.rank_index:setVisible(true)
		slot0.rank_icon:setVisible(false)
	end

	slot0.role_name:setString(slot1.name or "")
	slot0.send_money:setString(TI18N("发放总价值：") .. (slot1.price or ""))
	slot0.send_num:setString(TI18N("发放红包数：") .. (slot1.num or 0))
end

function RedRankItem.registerEvents(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.call_fun then
				uv0:call_fun(uv0.data)
			end
		end
	end)
end

function RedRankItem.clickHandler(slot0)
	if slot0.call_fun then
		slot0:call_fun(slot0.data)
	end
end

function RedRankItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function RedRankItem.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function RedRankItem.getData(slot0)
	return slot0.data
end

function RedRankItem.DeleteMe(slot0)
	slot0:removeFromParent()
end
