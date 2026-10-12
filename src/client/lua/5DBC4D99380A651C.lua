FriendListItem = class("FriendListItem", function ()
	return ccui.Widget:create()
end)

function FriendListItem.ctor(slot0, slot1, slot2)
	slot0.width = 610
	slot0.height = 114
	slot0.ctrl = FriendController:getInstance()

	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(slot0.width, slot0.height))
	slot0:setAnchorPoint(cc.p(0.5, 0))

	slot0.index = slot1 or 1
	slot0.item_list = {}
	slot0.is_del = false
	slot0.open_type = slot2 or FriendConst.Type.MyFriend

	slot0:configUI()
end

function FriendListItem.clickHandler(slot0, ...)
	if slot0.call_fun then
		slot0:call_fun(slot0.vo)
	end
end

function FriendListItem.setTouchFunc(slot0, slot1)
	slot0.call_fun = slot1
end

function FriendListItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function FriendListItem.configUI(slot0, ...)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("friend/friend_item"))

	slot0:addChild(slot0.root_wnd)
	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(cc.p(slot0.width / 2, slot0.height / 2))

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.play_head = PlayerHead.new(PlayerHead.type.circle, nil, cc.size(96, 96))

	slot0.main_panel:addChild(slot0.play_head)
	slot0.play_head:setPosition(cc.p(70, 57))

	slot0.role_name = createLabel(24, cc.c4b(255, 255, 255, 255), nil, 145, 70, "", slot0.main_panel, 0, cc.p(0, 0))

	slot0.role_name:enableOutline(cc.c4b(70, 47, 1, 255), 2)

	slot0.role_power = createLabel(24, cc.c4b(144, 93, 56, 255), nil, 145, 20, "", slot0.main_panel, 0, cc.p(0, 0))
	slot0.is_online = createLabel(24, cc.c4b(0, 143, 0, 255), nil, 330, 20, "", slot0.main_panel, 0, cc.p(0, 0))
end

function FriendListItem.setExtendData(slot0, slot1)
	slot0.open_type = slot1
end

function FriendListItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0:unBindEvent()

	slot0.vo = slot1

	slot0:updateMessage()
	slot0.play_head:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
	slot0.play_head:setHeadData(slot1)

	if slot1.lev then
		slot0.play_head:setLev(slot1.lev, cc.p(0, 67))
	end

	slot0.play_head:addCallBack(function ()
		if uv0.open_type == FriendConst.Type.BlackList then
			ChatController:getInstance():openChatReportWindow(true, uv0.vo, 2)
		else
			uv0.ctrl:openFriendCheckPanel(true, uv0.vo)
		end
	end)

	if slot1.name then
		if slot1.srv_id then
			slot2 = transformNameByServ(slot1.name or "", slot1.srv_id)
		end

		slot0.role_name:setString(slot2)
	end

	if slot1.power then
		slot0.role_power:setString(TI18N("战力：") .. (slot1.power or 0))
	end

	slot0:updateOnlineTime()
	slot0:addVoBindEvent()
end

function FriendListItem.updateOnlineTime(slot0)
	if not slot0.vo then
		return
	end

	if not slot0.is_online then
		return
	end

	slot1 = nil

	slot0.is_online:setString((not slot0.vo.is_online or slot0.vo.is_online ~= 0 or TimeTool.GetTimeFormatFriendShowTime(slot0.vo.login_out_time == 0 and TimeTool.day2s() * 4 or GameNet:getInstance():getTime() - slot0.vo.login_out_time)) and TI18N("在线"))
end

function FriendListItem.addVoBindEvent(slot0)
	if type(slot0.vo) == "table" and slot0.vo and slot0.vo ~= nil and slot0.vo.Bind and slot0.item_update_event == nil then
		slot0.item_update_event = slot0.vo:Bind(FriendVo.UPDATE_FRIEND_ATTR_LOGIN_OUT_TIME, function (slot0)
			uv0:updateOnlineTime()
		end)
	end
end

function FriendListItem.unBindEvent(slot0)
	if slot0.vo then
		if slot0.item_update_event ~= nil then
			slot0.vo:UnBind(slot0.item_update_event)

			slot0.item_update_event = nil
		end

		slot0.vo = nil
	end
end

function FriendListItem.updateMessage(slot0)
	slot0:hideAllPanel()

	if slot0.open_type == FriendConst.Type.MyFriend then
		slot0:updateMyFriend()
	elseif slot0.open_type == FriendConst.Type.Award then
		slot0:updateAwardPanel()
	elseif slot0.open_type == FriendConst.Type.ApplyList then
		slot0:updateApplyPanel()
	elseif slot0.open_type == FriendConst.Type.BlackList then
		slot0:updateBlackPanel()
	elseif slot0.open_type == 5 then
		slot0:updateRecommendPanel()
	end
end

function FriendListItem.hideAllPanel(slot0)
	if slot0.my_friend then
		slot0.my_friend:setVisible(false)
	end

	if slot0.award_panel then
		slot0.award_panel:setVisible(false)
	end

	if slot0.apply_panel then
		slot0.apply_panel:setVisible(false)
	end

	if slot0.black_panel then
		slot0.black_panel:setVisible(false)
	end

	if slot0.del_friend_btn then
		slot0.del_friend_btn:setVisible(false)
	end

	if slot0.recommend_panel then
		slot0.recommend_panel:setVisible(false)
	end
end

function FriendListItem.updateMyFriend(slot0)
	slot0.is_del = slot0.ctrl:getFriendWndDelStatus()

	if not slot0.my_friend then
		slot0.my_friend = ccui.Widget:create()

		slot0.my_friend:setContentSize(cc.size(slot0.width, slot0.height))
		slot0.my_friend:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.my_friend:setPosition(cc.p(slot0.width / 2, slot0.height / 2))
		slot0.main_panel:addChild(slot0.my_friend)

		slot0.send_btn = createButton(slot0.my_friend, "", 460, 55, nil, PathTool.getResFrame("friend", "friend_5"))

		slot0.send_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if not uv0.vo then
					return
				end

				uv0.ctrl:sender_13316(0, uv0.vo.rid, uv0.vo.srv_id)
			end
		end)

		slot0.chat_btn = createButton(slot0.my_friend, TI18N("私聊"), 550, 55, cc.size(96, 53), PathTool.getResFrame("common", "common_1027"), 24, Config.ColorData.data_color4[1])

		slot0.chat_btn:getLabel():enableOutline(cc.c4b(118, 69, 25, 255), 2)
		slot0.chat_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				ChatController:getInstance():openChatPanel(ChatConst.Channel.Friend, "friend", uv0.vo)
				FriendController:getInstance():openFriendWindow(false)
			end
		end)
	end

	if slot0.is_del == false then
		slot0.my_friend:setVisible(true)
	elseif slot0.del_friend_btn then
		slot0.del_friend_btn:setVisible(true)
	end

	if not slot0.vo then
		return
	end

	if slot0.vo.is_present and slot0.vo.is_present == 1 then
		slot0.send_btn:setGrayAndUnClick(true)
	else
		slot0.send_btn:setGrayAndUnClick(false)
	end
end

function FriendListItem.updateAwardPanel(slot0)
	if not slot0.award_panel then
		slot0.award_panel = ccui.Widget:create()

		slot0.award_panel:setContentSize(cc.size(slot0.width, slot0.height))
		slot0.award_panel:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.award_panel:setPosition(cc.p(slot0.width / 2, slot0.height / 2))
		slot0.main_panel:addChild(slot0.award_panel)

		slot0.friend_icon = createButton(slot0.award_panel, "", 460, 57, nil, PathTool.getResFrame("friend", "friend_2"), 24, Config.ColorData.data_color4[1])

		slot0.friend_icon:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if not uv0.vo then
					return
				end

				uv0.ctrl:sender_13316(1, uv0.vo.rid, uv0.vo.srv_id)
			end
		end)

		slot0.return_btn = createButton(slot0.award_panel, TI18N("回礼"), 550, 57, cc.size(96, 53), PathTool.getResFrame("common", "common_1027"), 24, Config.ColorData.data_color4[1])

		slot0.return_btn:getLabel():enableOutline(Config.ColorData.data_color4[277], 2)
		slot0.return_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if not uv0.vo then
					return
				end

				uv0.ctrl:sender_13316(0, uv0.vo.rid, uv0.vo.srv_id)
			end
		end)
	end

	slot0.return_btn:setGrayAndUnClick(false)
	slot0.return_btn:getLabel():enableOutline(Config.ColorData.data_color4[277], 2)
	slot0.friend_icon:setGrayAndUnClick(false)
	slot0.award_panel:setVisible(true)

	if not slot0.vo then
		return
	end

	if slot0.vo.is_present and slot0.vo.is_present == 1 then
		slot0.return_btn:setGrayAndUnClick(true)
		slot0.return_btn:getLabel():enableOutline(cc.c4b(121, 121, 121, 255), 2)
	end

	if slot0.vo.is_draw and slot0.vo.is_draw == 0 then
		slot0.friend_icon:setGrayAndUnClick(true)
	end
end

function FriendListItem.updateApplyPanel(slot0)
	if not slot0.apply_panel then
		slot0.apply_panel = ccui.Widget:create()

		slot0.apply_panel:setContentSize(cc.size(slot0.width, slot0.height))
		slot0.main_panel:addChild(slot0.apply_panel)
		slot0.apply_panel:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.apply_panel:setPosition(cc.p(slot0.width / 2, slot0.height / 2))

		slot0.cancel_btn = createButton(slot0.apply_panel, TI18N("拒绝"), 435, 55, cc.size(96, 53), PathTool.getResFrame("common", "common_1027"), 24, Config.ColorData.data_color4[1])

		slot0.cancel_btn:getLabel():enableOutline(Config.ColorData.data_color4[277], 2)
		slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if not uv0.vo then
					return
				end

				uv0.ctrl:accept(uv0.vo.srv_id, uv0.vo.rid, 0)
			end
		end)

		slot0.ok_btn = createButton(slot0.apply_panel, TI18N("接受"), 545, 55, cc.size(96, 53), PathTool.getResFrame("common", "common_1027"), 24, Config.ColorData.data_color4[1])

		slot0.ok_btn:getLabel():enableOutline(Config.ColorData.data_color4[277], 2)
		slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if not uv0.vo then
					return
				end

				uv0.ctrl:accept(uv0.vo.srv_id, uv0.vo.rid, 1)
			end
		end)
	end

	slot0.apply_panel:setVisible(true)
end

function FriendListItem.updateBlackPanel(slot0)
	if not slot0.black_panel then
		slot0.black_panel = ccui.Widget:create()

		slot0.black_panel:setContentSize(cc.size(slot0.width, slot0.height))
		slot0.black_panel:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.black_panel:setPosition(cc.p(slot0.width / 2, slot0.height / 2))
		slot0.main_panel:addChild(slot0.black_panel)

		slot0.del_btn = createButton(slot0.black_panel, TI18N("移除"), 545, 57, cc.size(96, 53), PathTool.getResFrame("common", "common_1027"), 24, Config.ColorData.data_color4[1])

		slot0.del_btn:getLabel():enableOutline(Config.ColorData.data_color4[277], 2)
		slot0.del_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if not uv0.vo then
					return
				end

				uv0.ctrl:deleteBlackList(uv0.vo.rid, uv0.vo.srv_id)
			end
		end)
	end

	slot0.black_panel:setVisible(true)
end

function FriendListItem.updateRecommendPanel(slot0)
	if not slot0.recommend_panel then
		slot0.recommend_panel = ccui.Widget:create()

		slot0.recommend_panel:setContentSize(cc.size(slot0.width, slot0.height))
		slot0.recommend_panel:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.recommend_panel:setPosition(cc.p(slot0.width / 2, slot0.height / 2))
		slot0.main_panel:addChild(slot0.recommend_panel)

		slot0.add_btn = createButton(slot0.recommend_panel, TI18N("加为好友"), 537, 57, cc.size(127, 53), PathTool.getResFrame("common", "common_1027"), 24, Config.ColorData.data_color4[1])

		slot0.add_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if not uv0.vo then
					return
				end

				uv0.ctrl:addOther(uv0.vo.srv_id, uv0.vo.rid)
				uv0.add_btn:setBtnLabel(TI18N("等待同意"))
				uv0.add_btn:setGrayAndUnClick(true)
				uv0.add_btn:getLabel():enableOutline(cc.c4b(121, 121, 121, 255), 2)
			end
		end)
	end

	slot0.add_btn:setGrayAndUnClick(false)
	slot0.add_btn:setBtnLabel(TI18N("加为好友"))
	slot0.add_btn:getLabel():enableOutline(Config.ColorData.data_color4[277], 2)
	slot0.recommend_panel:setVisible(true)
end

function FriendListItem.isHaveData(slot0)
	if slot0.vo then
		return true
	end

	return false
end

function FriendListItem.setDelStatus(slot0, slot1)
	if slot1 and slot1 == true then
		slot0:hideAllPanel()
	end

	slot0.is_del = slot1

	if not slot0.del_friend_btn and slot1 == false then
		return
	end

	if not slot0.del_friend_btn then
		slot0.del_friend_btn = createButton(slot0.main_panel, TI18N("删除好友"), 525, 55, cc.size(127, 53), PathTool.getResFrame("common", "common_1027"), 24, Config.ColorData.data_color4[1])

		slot0.del_friend_btn:getLabel():enableOutline(Config.ColorData.data_color4[277], 2)
		slot0.del_friend_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if not uv0.vo then
					return
				end

				uv0.ctrl:delOther(uv0.vo.srv_id, uv0.vo.rid)
			end
		end)
	end

	slot0.del_friend_btn:setVisible(slot1)

	if slot1 == false then
		slot0:updateMyFriend()
	end
end

function FriendListItem.suspendAllActions(slot0)
end

function FriendListItem.getData(slot0)
	return slot0.vo
end

function FriendListItem.DeleteMe(slot0)
	slot0:unBindEvent()
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
