FriendWindow = FriendWindow or BaseClass(BaseView)
slot0 = table.insert

function FriendWindow.__init(slot0)
	slot0.ctrl = FriendController:getInstance()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.title_str = TI18N("好友")
	slot0.empty_res = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3")
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("friend", "friend"),
			type = ResourcesType.plist
		},
		{
			path = slot0.empty_res,
			type = ResourcesType.single
		}
	}
	slot0.tab_info_list = {
		{
			status = true,
			label = TI18N("我的好友"),
			index = FriendConst.Type.MyFriend
		},
		{
			status = true,
			label = TI18N("领取礼物"),
			index = FriendConst.Type.Award
		},
		{
			status = true,
			label = TI18N("申请列表"),
			index = FriendConst.Type.ApplyList
		},
		{
			status = true,
			label = TI18N("黑名单"),
			index = FriendConst.Type.BlackList
		}
	}
	slot0.view_list = {}
	slot0.friend_list = {}
	slot0.scroll_width = 624
	slot0.scroll_height = 624
	slot0.rend_list = {}
	slot0.cache_list = {}
	slot0.is_init = true
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function FriendWindow.open_callback(slot0)
	slot1 = slot0.container:getContentSize()
	slot0.list_view = ccui.Layout:create()

	slot0.list_view:setContentSize(cc.size(slot0.scroll_width, slot0.scroll_height))
	slot0.list_view:setAnchorPoint(cc.p(0.5, 1))
	slot0.list_view:setPosition(320, 784)
	slot0.list_view:setCascadeOpacityEnabled(true)
	slot0.container:addChild(slot0.list_view, 10)

	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.list_view, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot0.scroll_width, slot0.scroll_height), {
		start_y = 0,
		once_num = 1,
		start_x = 6,
		item_width = 610,
		space_x = 0,
		row = 1,
		item_height = 114,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = FriendListItem
	})
end

function FriendWindow.register_event(slot0)
	slot0:addGlobalEvent(FriendEvent.FRIEND_APPLY, function ()
		if uv0.cur_type ~= FriendConst.Type.ApplyList then
			return
		end

		uv0:updateFriendList(false)
	end)
	slot0:addGlobalEvent(FriendEvent.STRENGTH_UPDATE, function (slot0)
		if uv0.cur_type ~= FriendConst.Type.Award and uv0.cur_type ~= FriendConst.Type.MyFriend then
			return
		end

		slot2 = {
			[getNorKey(slot7.rid, slot7.srv_id)] = slot7
		}

		for slot6, slot7 in pairs(slot0.list or {}) do
			-- Nothing
		end

		if uv0.item_scrollview:getItemList() then
			for slot7, slot8 in pairs(slot3) do
				if slot8:getData() and slot2[getNorKey(slot9.rid, slot9.srv_id)] then
					slot8:setData(slot2[getNorKey(slot9.rid, slot9.srv_id)])
				end
			end
		end
	end)
	slot0:addGlobalEvent(FriendEvent.FRIEND_DELETE, function ()
		if uv0.cur_type ~= FriendConst.Type.MyFriend and uv0.cur_type ~= FriendConst.Type.BlackList then
			return
		end

		uv0:updateFriendList(false, true)
	end)
	slot0:addGlobalEvent(FriendEvent.UPDATE_APPLY, function ()
		if uv0.cur_type ~= FriendConst.Type.MyFriend then
			uv0:setTabTips(true, FriendConst.Type.MyFriend)

			if uv0.cur_type == FriendConst.Type.ApplyList then
				uv0:updateFriendList(false)
			end
		else
			uv0:updateFriendList(false)
		end

		uv0:showRedPoint()
	end)

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "friend_point" and (uv0.cur_type == FriendConst.Type.MyFriend or uv0.cur_type == FriendConst.Type.Award) and uv0.pre_panel and uv0.pre_panel.setFriendPoint then
				uv0.pre_panel:setFriendPoint()
			end
		end)
	end

	slot0:addGlobalEvent(FriendEvent.UPDATE_COUNT, function ()
		uv0:updateFriendList(false)
		uv0:showRedPoint()
	end)
	slot0:addGlobalEvent(FriendEvent.UPDATE_GROUP_COUNT, function ()
		uv0:updateFriendList(false, true)
		uv0:showRedPoint()
	end)
	slot0:addGlobalEvent(FriendEvent.FRIEND_LIST, function ()
		uv0:updateFriendList(false)
		uv0:showRedPoint()
	end)
	slot0:addGlobalEvent(FriendEvent.Update_Red_Point, function ()
		uv0:showRedPoint()
	end)
end

function FriendWindow.openRootWnd(slot0, slot1)
	slot0:setSelecteTab(slot1 or FriendConst.Type.MyFriend, true)
	slot0:showRedPoint()
end

function FriendWindow.selectedTabCallBack(slot0, slot1)
	if slot0.cur_type == (slot1 or FriendConst.Type.MyFriend) then
		return
	end

	slot0:changeFriendBtn(false)
	slot0:setTabTips(false, FriendConst.Type.MyFriend)

	slot0.cur_type = slot1

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(false)
	end

	slot0.pre_panel = slot0:createSubPanel(slot0.cur_type)

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(true)
	end

	if slot0.cur_type == FriendConst.Type.MyFriend then
		slot0.list_view:setContentSize(cc.size(slot0.scroll_width, 624))
		slot0.item_scrollview:resetSize(cc.size(slot0.scroll_width, 624))
	elseif slot0.cur_type == FriendConst.Type.Award then
		slot0.list_view:setContentSize(cc.size(slot0.scroll_width, 684))
		slot0.item_scrollview:resetSize(cc.size(slot0.scroll_width, 684))
	else
		slot0.list_view:setContentSize(cc.size(slot0.scroll_width, 734))
		slot0.item_scrollview:resetSize(cc.size(slot0.scroll_width, 734))
	end

	slot0:updateFriendList(true)
end

function FriendWindow.createSubPanel(slot0, slot1)
	if slot0.view_list[slot1] == nil then
		if slot1 == FriendConst.Type.MyFriend then
			slot2 = FriendListPanel.new()
		elseif slot1 == FriendConst.Type.ApplyList then
			slot2 = FriendApplyPanel.new()
		elseif slot1 == FriendConst.Type.Award then
			slot2 = FriendAwardPanel.new()
		elseif slot1 == FriendConst.Type.BlackList then
			slot2 = FriendBlackPanel.new()
		end

		slot2:setPosition(cc.p(slot0.container:getContentSize().width / 2, 405))
		slot0.container:addChild(slot2)

		slot0.view_list[slot1] = slot2
	end

	if slot2 and slot2.setCallFun then
		slot2:setCallFun(function (slot0, slot1)
			if uv0 == FriendConst.Type.MyFriend then
				uv1:changeFriendBtn(slot1 or false)
			end
		end)
	end

	return slot2
end

function FriendWindow.changeFriendBtn(slot0, slot1)
	slot0.del_friend_status = slot1

	if slot0.item_scrollview:getItemList() then
		for slot6, slot7 in pairs(slot2) do
			slot7:setDelStatus(slot1)
		end
	end
end

function FriendWindow.getDelFriendStatus(slot0)
	return slot0.del_friend_status
end

function FriendWindow.updateFriendList(slot0, slot1, slot2)
	slot1 = slot1 or false
	slot0.rend_list = {}
	slot3 = {}

	if slot0.cur_type == FriendConst.Type.MyFriend then
		slot3 = slot0.ctrl:getModel():getArray() or Array.New()
	elseif slot0.cur_type == FriendConst.Type.ApplyList then
		if slot1 == true then
			slot0.ctrl:apply()

			return
		else
			slot4 = Array.New()

			for slot9, slot10 in pairs(slot0.ctrl:getModel():getApplyList() or {}) do
				slot4:PushBack(slot10)
			end

			slot3 = slot4
		end

		slot0:updateApplyNum()
	elseif slot0.cur_type == FriendConst.Type.Award then
		award_array = Array.New()
		slot8 = slot0.ctrl:getModel():getArray() or Array.New()

		for slot8 = 1, slot4.GetSize(slot8) do
			if slot4:Get(slot8 - 1) and slot9.is_draw == 1 then
				award_array:PushBack(slot9)
			end
		end

		slot3 = award_array
	elseif slot0.cur_type == FriendConst.Type.BlackList then
		slot3 = slot0.ctrl:getModel():getBlackArray() or Array.New()
	end

	if slot3 and slot3.items then
		for slot7, slot8 in pairs(slot3.items) do
			uv0(slot0.rend_list, slot8)
		end
	end

	slot0:showEmptyIcon(false)

	if #slot0.rend_list <= 0 then
		slot0:showEmptyIcon(true)
	end

	slot0.pre_panel:setData(slot0.rend_list)

	if slot2 == true and slot1 == false and next(slot0.rend_list) ~= nil then
		slot0.item_scrollview:resetAddPosition(slot0.rend_list)
	else
		slot0.item_scrollview:setData(slot0.rend_list, nil, , slot0.cur_type)
	end
end

function FriendWindow.updateApplyNum(slot0)
	if slot0.pre_panel and slot0.pre_panel.setApplyNum then
		slot0.pre_panel:setApplyNum(slot0.ctrl:getModel():getApplyNum() or 0)
	end
end

function FriendWindow.setscheduleUpdate(slot0, slot1)
end

function FriendWindow.createItem(slot0, slot1)
end

function FriendWindow.setPanelData(slot0)
end

function FriendWindow.showRedPoint(slot0)
	slot1 = slot0.ctrl:getModel():getAwardNum() or 0
	slot2 = slot0.ctrl:getModel():getApplyNum() or 0

	slot0:setTabTipsII(slot1, FriendConst.Type.Award)
	slot0:setTabTipsII(slot2, FriendConst.Type.ApplyList)
	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.friend, {
		{
			bid = 1,
			num = slot1
		},
		{
			bid = 2,
			num = slot2
		}
	})
end

function FriendWindow.showEmptyIcon(slot0, slot1)
	if not slot0.empty_con and slot1 == false then
		return
	end

	if not slot0.empty_con then
		slot2 = cc.size(200, 200)
		slot0.empty_con = ccui.Widget:create()

		slot0.empty_con:setContentSize(slot2)
		slot0.empty_con:setPosition(cc.p(315, 490))
		slot0.container:addChild(slot0.empty_con, 100)

		slot3 = createImage(slot0.empty_con, slot0.empty_res, slot2.width / 2, slot2.height / 2, cc.p(0.5, 0.5), false)
		slot0.empty_label = createLabel(26, Config.ColorData.data_color4[274], nil, slot2.width / 2, 0, "", slot0.empty_con, 0, cc.p(0.5, 0))
	end

	slot2 = TI18N("暂无好友")

	if slot0.cur_type == FriendConst.Type.Award then
		slot2 = TI18N("暂无好友赠送")
	elseif slot0.cur_type == FriendConst.Type.ApplyList then
		slot2 = TI18N("暂无好友申请")
	elseif slot0.cur_type == FriendConst.Type.BlackList then
		slot2 = TI18N("黑名单列表为空")
	end

	slot0.empty_label:setString(slot2)
	slot0.empty_con:setVisible(slot1)
end

function FriendWindow.close_callback(slot0)
	slot0.ctrl:openFriendWindow(false)

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	for slot4, slot5 in pairs(slot0.view_list) do
		if slot5 and slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	slot0.view_list = nil
end
