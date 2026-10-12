FriendController = FriendController or BaseClass(BaseController)

function FriendController.config(slot0)
	slot0.pri_list = {}
	slot0.model = FriendModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.give_name = ""
end

function FriendController.getModel(slot0)
	return slot0.model
end

function FriendController.isFriend(slot0, slot1, slot2)
	if slot0.model == nil then
		return nil
	else
		return slot0.model:isFriend(slot1, slot2)
	end
end

function FriendController.registerEvents(slot0)
	if slot0.login_success == nil then
		slot0.login_success = slot0.dispather:Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			uv0:friendList()
			GlobalTimeTicket:getInstance():add(function ()
				uv0:updateFriendTishi()
			end, 1, 1)
		end)
	end

	if not slot0.request_event then
		slot0.request_event = GlobalEvent:getInstance():Bind(FriendEvent.REQUEST_LIST, function ()
			uv0:friendList()
			uv0:getBlackList()
		end)
	end

	if not slot0.add_event then
		slot0.add_event = GlobalEvent:getInstance():Bind(FriendEvent.FRIEND_ADD, function (slot0, slot1)
			uv0:addOther(slot0, slot1)
		end)
	end

	if not slot0.query_event then
		slot0.query_event = GlobalEvent:getInstance():Bind(FriendEvent.FRIEND_QUERY_FIND, function (slot0)
			uv0:queryFind(slot0)
		end)
	end

	if not slot0.recommend_event then
		slot0.recommend_event = GlobalEvent:getInstance():Bind(FriendEvent.FRIEND_RECOMMEND, function ()
			uv0:recommend()
		end)
	end

	if not slot0.infom_event then
		slot0.infom_event = GlobalEvent:getInstance():Bind(FriendEvent.OPEN_FRIEND_INFOM, function (slot0, slot1, slot2, slot3)
			uv0:openInfom(slot0, slot1, slot2, slot3)
		end)
	end

	if not slot0.private_msg then
		slot0.private_msg = GlobalEvent:getInstance():Bind(EventId.CHAT_UPDATE_SELF, function (slot0)
			uv0:addPrivateMsg(slot0)
		end)
	end

	if not slot0.update_chat_and_apply_event then
		slot0.update_chat_and_apply_event = GlobalEvent:getInstance():Bind(FriendEvent.UPDATE_COUNT, function (slot0, slot1, slot2)
			uv0:updateFriendTishi()
		end)
	end
end

function FriendController.registerProtocals(slot0)
	slot0:RegisterProtocal(13300, "friendListHandler")
	slot0:RegisterProtocal(13301, "onlineHandler")
	slot0:RegisterProtocal(13302, "friendStateHandler")
	slot0:RegisterProtocal(13303, "addOtherHandler")
	slot0:RegisterProtocal(13304, "addMeHandler")
	slot0:RegisterProtocal(13305, "acceptHandler")
	slot0:RegisterProtocal(13306, "batchAddHandler")
	slot0:RegisterProtocal(13307, "delOtherHandler")
	slot0:RegisterProtocal(13308, "delMeHandler")
	slot0:RegisterProtocal(13310, "addToListHandler")
	slot0:RegisterProtocal(13311, "applyListHandler")
	slot0:RegisterProtocal(13312, "refuseApplyListHandler")
	slot0:RegisterProtocal(13314, "queryFindHandler")
	slot0:RegisterProtocal(13315, "queryFriendTeamHandler")
	slot0:RegisterProtocal(13316, "strengthHandler")
	slot0:RegisterProtocal(13317, "batchStrengthHandler")
	slot0:RegisterProtocal(13320, "recommendHandler")
	slot0:RegisterProtocal(10388, "getRolesOnline")
	slot0:RegisterProtocal(13330, "handle13330")
	slot0:RegisterProtocal(13331, "handle13331")
	slot0:RegisterProtocal(13332, "handle13332")
	slot0:RegisterProtocal(13333, "handle13333")
	slot0:RegisterProtocal(13334, "handle13334")
end

function FriendController.updateFriendTishi(slot0)
	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.friend, {
		{
			bid = 1,
			num = slot0.model:getAwardNum() or 0
		},
		{
			bid = 2,
			num = slot0.model:getApplyNum() or 0
		}
	})
end

function FriendController.friendList(slot0)
	slot0:SendProtocal(13300, {})
end

function FriendController.friendListHandler(slot0, slot1)
	if slot0.model == nil then
		slot0.model = FriendModel.New(slot0)
	end

	slot0.model:setFriendPresentCount(slot1.present_count)
	slot0.model:setFriendDrawCount(slot1.draw_count)

	slot5 = slot1.draw_all

	slot0.model:setFriendDrawTotalCount(slot5)

	for slot5, slot6 in pairs(slot1.friend_list) do
		slot7 = nil

		if slot0.model:isFriend(slot6.srv_id, slot6.rid) then
			slot0.model:getVo(slot6.srv_id, slot6.rid):setData(slot6)
		else
			slot7 = FriendVo.New()

			slot7:setData(slot6)
			slot0.model:add(slot7)
		end
	end

	GlobalEvent:getInstance():Fire(FriendEvent.FRIEND_LIST, slot0.model:getArray())
	slot0:apply()
	slot0:updateFriendTishi()
end

function FriendController.onlineHandler(slot0, slot1)
	slot3 = slot0.model:updateVo(slot1.srv_id, slot1.rid, "is_online", slot1.is_online)
	slot4 = slot0.model:updateVo(slot1.srv_id, slot1.rid, "login_out_time", slot1.login_out_time)

	if slot0.model:getIndex(slot1.srv_id, slot1.rid) and slot0.model:getIndex(slot1.srv_id, slot1.rid) and slot4 and slot4 and slot1.is_online == 1 then
		GlobalEvent:getInstance():Fire(FriendEvent.FRIEND_UPDATE_ITEM, slot4, 0)
		showRichMsg(string.format(TI18N("您的好友<div fontcolor=#00ff00>%s</div>上线了"), slot4.name))
	end
end

function FriendController.friendStateHandler(slot0, slot1)
	if slot1.srv_id and slot1.rid then
		slot0.model:updateSingleFriendData(slot1.srv_id, slot1.rid, slot1)
		GlobalEvent:getInstance():Fire(FriendEvent.FRIEND_LIST, slot0.model:getArray())
	end

	slot0:updateFriendTishi()
end

function FriendController.apply(slot0, ...)
	slot0:SendProtocal(13311, {})
end

function FriendController.applyListHandler(slot0, slot1)
	for slot5, slot6 in pairs(slot1.friend_req_list) do
		slot6.intimacy = -1
	end

	slot0.model:setApplyList(slot1.friend_req_list)
	GlobalEvent:getInstance():Fire(FriendEvent.UPDATE_COUNT, 2, #slot0.model.apply)
	GlobalEvent:getInstance():Fire(FriendEvent.FRIEND_APPLY)
	GlobalEvent:getInstance():Fire(FriendEvent.Update_Red_Point)
	slot0:updateFriendTishi()
end

function FriendController.send_refuseApplyList(slot0)
	slot0:SendProtocal(13312, {})
end

function FriendController.refuseApplyListHandler(slot0, slot1)
	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(FriendEvent.UPDATE_APPLY_LIST)

		slot0.model.apply = {}

		slot0:updateFriendTishi()
	end
end

function FriendController.send_acceptApplyList(slot0, slot1)
	slot0:SendProtocal(13334, {
		role_ids = slot1
	})
end

function FriendController.handle13334(slot0, slot1)
	GlobalEvent:getInstance():Fire(FriendEvent.UPDATE_APPLY_LIST)

	slot0.model.apply = {}

	slot0:updateFriendTishi()
	GlobalEvent:getInstance():Fire(FriendEvent.Update_Red_Point)
end

function FriendController.appCount(slot0, ...)
	if slot0.model then
		return #slot0.model.apply
	end

	return 0
end

function FriendController.recommend(slot0, ...)
	slot0:SendProtocal(13320, {})
end

function FriendController.recommendHandler(slot0, slot1)
	slot2 = {}

	for slot8, slot9 in pairs(slot1.recommend_list) do
		if not slot0:isFriend(slot9.srv_id, slot9.rid) and (RoleController:getInstance():getRoleVo().srv_id ~= slot9.srv_id or RoleController:getInstance():getRoleVo().rid ~= slot9.rid) then
			slot9.intimacy = -1

			table.insert(slot2, slot9)
		end
	end

	GlobalEvent:getInstance():Fire(FriendEvent.UD_COMMEND_LIST, slot2)
end

function FriendController.queryFind(slot0, slot1)
	slot0:SendProtocal(13314, {
		name = slot1
	})
end

function FriendController.queryFindHandler(slot0, slot1)
	slot2 = {}

	if #slot1.role_list > 0 then
		for slot9, slot10 in pairs(slot1.role_list) do
			if not slot0:isFriend(slot10.srv_id, slot10.rid) and (RoleController:getInstance():getRoleVo().srv_id ~= slot10.srv_id or RoleController:getInstance():getRoleVo().rid ~= slot10.rid) then
				slot10.intimacy = -1

				table.insert(slot2, slot10)

				slot5 = 0 + 1
			end

			if slot5 > 25 then
				break
			end
		end

		table.sort(slot2, function (slot0, slot1)
			return slot1.lev < slot0.lev
		end)

		if not slot2 or next(slot2) == nil then
			message(TI18N("找不到玩家"))
		end
	else
		message(TI18N("找不到玩家"))
	end

	GlobalEvent:getInstance():Fire(FriendEvent.FRIEND_QUERY_RESULT, slot2)
end

function FriendController.queryFriendIsHasTeam(slot0, slot1, slot2)
	slot0:SendProtocal(13315, {
		rid = slot1,
		srv_id = slot2
	})
end

function FriendController.queryFriendTeamHandler(slot0, slot1)
	if slot1.code == 1 then
		slot0:openFrinedInfo(1)
	elseif slot1.code == 0 then
		slot0:openFrinedInfo(0)
	end
end

function FriendController.sender_13316(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(13316, {
		rid = slot2,
		srv_id = slot3,
		code = slot1
	})
end

function FriendController.strengthHandler(slot0, slot1)
	if slot1.code == 1 then
		slot0.model:setFriendPresentCount(slot1.present_count)
		slot0.model:setFriendDrawCount(slot1.draw_count)

		slot2 = slot0.model:updateVo(slot1.srv_id, slot1.rid, "is_draw", slot1.is_draw)

		GlobalEvent:getInstance():Fire(FriendEvent.STRENGTH_UPDATE, {
			list = {
				slot0.model:updateVo(slot1.srv_id, slot1.rid, "is_present", slot1.is_present)
			}
		})
		GlobalEvent:getInstance():Fire(FriendEvent.Update_Red_Point)
	end

	message(slot1.msg)
end

function FriendController.sender_13317(slot0, slot1, slot2)
	slot0:SendProtocal(13317, {
		list = slot2,
		code = slot1
	})
end

function FriendController.batchStrengthHandler(slot0, slot1)
	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(FriendEvent.Update_Red_Point)
	end

	message(slot1.msg)
end

function FriendController.addOther(slot0, slot1, slot2)
	slot0:SendProtocal(13303, {
		srv_id = slot1,
		rid = slot2
	})
end

function FriendController.addOtherHandler(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0:closeInfo()
	end
end

function FriendController.addMeHandler(slot0, slot1)
	if FriendController:getInstance():getModel():isBlack(slot1.rid, slot1.srv_id) then
		return
	end

	slot0:apply()
end

function FriendController.accept(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(13305, {
		srv_id = slot1,
		rid = slot2,
		agreed = slot3
	})
end

function FriendController.acceptHandler(slot0, slot1)
	if slot1 ~= nil then
		for slot5, slot6 in pairs(slot0.model.apply) do
			if slot6.srv_id == slot1.srv_id and slot6.rid == slot1.rid then
				table.remove(slot0.model.apply, slot5)
			end
		end

		GlobalEvent:getInstance():Fire(FriendEvent.UPDATE_COUNT, 2, #slot0.model.apply)
		slot0:updateFriendTishi()

		if slot1.code == 1 then
			ChatController:getInstance().model:saveTalkTime(slot1.srv_id, slot1.rid)
			message(slot1.msg)
		else
			message(slot1.msg)
		end
	end
end

function FriendController.addToListHandler(slot0, slot1)
	if slot0.model then
		slot2 = FriendVo.New()

		slot2:setData(slot1)
		slot0.model:add(slot2)

		if slot0.model.apply then
			for slot6, slot7 in pairs(slot0.model.apply) do
				if slot1.srv_id == slot7.srv_id and slot1.rid == slot7.rid then
					slot0.model.apply[slot6] = nil
				end
			end
		end

		GlobalEvent:getInstance():Fire(FriendEvent.UPDATE_APPLY)
		showRichMsg(string.format(TI18N("成功添加<div fontcolor=#00ff00>%s</div>为好友"), slot1.name))
	end
end

function FriendController.batchAdd(slot0, slot1)
	slot0:SendProtocal(13306, {
		role_ids = slot1
	})
end

function FriendController.batchAddHandler(slot0, slot1)
	message(slot1.string)
end

function FriendController.delOther(slot0, slot1, slot2)
	CommonAlert.show(TI18N("好友删除后，将清空聊天记录，是否删除好友？"), TI18N("删除"), function ()
		uv2:SendProtocal(13307, {
			srv_id = uv0,
			rid = uv1
		})
	end, TI18N("取消"))
end

function FriendController.delOtherHandler(slot0, slot1)
	if slot1.code == 1 then
		if slot0.model:getVo(slot1.srv_id, slot1.rid) then
			slot0.model:del(slot1.srv_id, slot1.rid)

			slot3 = RoleController:getInstance():getRoleVo()

			ChatController:getInstance():getModel():deleteCache(slot3.srv_id, slot3.rid, slot1.srv_id, slot1.rid)
			GlobalEvent:getInstance():Fire(FriendEvent.FRIEND_DELETE, slot2, slot0.group_type)
		end

		slot0:closeInfom()
	end

	message(slot1.msg)
end

function FriendController.delMeHandler(slot0, slot1)
	if slot0.model:getVo(slot1.srv_id, slot1.rid) then
		slot0.model:del(slot1.srv_id, slot1.rid)

		slot3 = RoleController:getInstance():getRoleVo()

		ChatController:getInstance():getModel():deleteCache(slot3.srv_id, slot3.rid, slot1.srv_id, slot1.rid)
		GlobalEvent:getInstance():Fire(FriendEvent.UPDATE_GROUP_COUNT)
	end
end

function FriendController.deleteConnecter(slot0, slot1)
	CommonAlert.show("是否从列表中删除该联系人？", "删除", function ()
		ChatController:getInstance():getModel():clearTalkTime(uv0.srv_id, uv0.rid)
		GlobalEvent:getInstance():Fire(ContactEvent.CLOSE_TALK_INFO)
		uv1:closeInfom()
		GlobalEvent:getInstance():Fire(FriendEvent.FRIEND_DELETE, uv0, FriendConst.FriendGroupType.communicate)
	end, "取消")
end

function FriendController.deleteBlackConnecter(slot0, slot1, slot2)
	ChatController:getInstance():getModel():clearTalkTime(slot1, slot2)
	GlobalEvent:getInstance():Fire(ContactEvent.CLOSE_TALK_INFO)
	slot0:closeInfom()
	GlobalEvent:getInstance():Fire(FriendEvent.FRIEND_DELETE, {
		srv_id = slot1,
		rid = slot2
	}, FriendConst.FriendGroupType.friend)
end

function FriendController.sender_10388(slot0, slot1)
	slot0:SendProtocal(10388, {
		id_list = slot1
	})
end

function FriendController.getRolesOnline(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(FriendEvent.UPDATE_ONLINE, slot1.online_roles)
	end
end

function FriendController.openFriendWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.friend_window then
			slot0.friend_window = FriendWindow.New()
		end

		slot0.friend_window:open(slot2)
	elseif slot0.friend_window then
		slot0.friend_window:close()

		slot0.friend_window = nil
	end
end

function FriendController.getFriendWndDelStatus(slot0)
	if slot0.friend_window and slot0.friend_window:getDelFriendStatus() then
		return true
	end

	return false
end

function FriendController.openFriendFindWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.friend_find_window then
			slot0.friend_find_window = FriendAddWindow.New()
		end

		slot0.friend_find_window:open()
	elseif slot0.friend_find_window then
		slot0.friend_find_window:close()

		slot0.friend_find_window = nil
	end
end

function FriendController.closeInfo(slot0, ...)
	if slot0.info and slot0.info:isOpen() then
		slot0.info:close()

		slot0.info = nil
	end
end

function FriendController.openFrinedInfo(slot0, slot1)
	slot0:closeRecommendPanel()

	slot2 = nil

	if slot0.group_type == 1 then
		slot2 = {
			11,
			12,
			15
		}
	elseif slot0.group_type == 3 then
		slot2 = {
			2,
			13,
			15
		}
	end
end

function FriendController.openFriendCheckPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot2.srv_id or slot2.srv_id == "robot" then
			message(TI18N("神秘人太高冷，不给查看"))

			return
		end

		if not slot0.firend_check_view then
			slot0.firend_check_view = FriendCheckInfoWindow.New()
		end

		slot0.firend_check_view:open(slot2)
	elseif slot0.firend_check_view then
		slot0.firend_check_view:close()

		slot0.firend_check_view = nil
	end
end

function FriendController.openFriendGloryWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.firend_glory_view then
			slot0.firend_glory_view = FriendGloryWindow.New()
		end

		slot0.firend_glory_view:open(slot2)
	elseif slot0.firend_glory_view then
		slot0.firend_glory_view:close()

		slot0.firend_glory_view = nil
	end
end

function FriendController.openInfom(slot0, slot1, slot2, slot3, slot4)
	slot0.begin_pos = slot3
	slot0.group_type = slot4 or 1
	slot0.select_data = slot1

	slot0:openFrinedInfo()
end

function FriendController.closeInfom(slot0, ...)
	if slot0.infom and slot0.infom:isOpen() then
		slot0.infom:close()

		slot0.infom = nil
	end
end

function FriendController.closeRecommendPanel(slot0)
	if slot0.commend_ui and slot0.commend_ui:isOpen() then
		slot0.commend_ui:close()

		slot0.commend_ui = nil
	end
end

function FriendController.addPrivateMsg(slot0, slot1)
	if not slot1:isOhter() then
		return
	end

	slot2 = slot1.srv_id .. "_" .. slot1.rid
end

function FriendController.delPriCount(slot0, slot1)
	slot0.pri_list[slot1] = nil

	GlobalEvent:getInstance():Fire(FriendEvent.UPDATE_COUNT, 1, slot1, 0)
end

function FriendController.getLpriCount(slot0)
	for slot5, slot6 in pairs(slot0.pri_list) do
		if slot0.model:isFriend2(slot6) == true then
			slot1 = 0 + slot6
		end
	end

	return slot1
end

function FriendController.allPriCount(slot0, ...)
	for slot5, slot6 in pairs(slot0.pri_list) do
		slot1 = 0 + slot6
	end

	return slot1
end

function FriendController.singlePriCount(slot0, slot1)
	if slot0.pri_list[slot1] then
		return slot0.pri_list[slot1]
	end

	return 0
end

function FriendController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end

	slot0:closeRecommendPanel()
end

function FriendController.handle13330(slot0, slot1)
	slot0.model:initBlackList(slot1.black_list)
end

function FriendController.getBlackList(slot0)
	slot0:SendProtocal(13330, {})
end

function FriendController.handle13331(slot0, slot1)
	if slot1.type == 1 then
		slot0.model:initBlackList(slot1.black_list)
		GlobalEvent:getInstance():Fire(FriendEvent.UPDATE_GROUP_COUNT)
	elseif slot1.type == 2 then
		-- Nothing
	end
end

function FriendController.addToBlackList(slot0, slot1, slot2)
	slot0:SendProtocal(13332, {
		rid = slot1,
		srv_id = slot2
	})
end

function FriendController.handle13332(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 and slot0.model:getVo(slot1.srv_id, slot1.rid) then
		slot0.model:del(slot1.srv_id, slot1.rid)

		slot3 = RoleController:getInstance():getRoleVo()

		ChatController:getInstance():getModel():deleteCache(slot3.srv_id, slot3.rid, slot1.srv_id, slot1.rid)
		GlobalEvent:getInstance():Fire(FriendEvent.FRIEND_DELETE, slot2, slot0.group_type)
	end
end

function FriendController.deleteBlackList(slot0, slot1, slot2)
	slot0:SendProtocal(13333, {
		rid = slot1,
		srv_id = slot2
	})
end

function FriendController.handle13333(slot0, slot1)
	if slot1.code == 1 then
		slot0.model:removeBlack(slot1.rid, slot1.srv_id)
		GlobalEvent:getInstance():Fire(FriendEvent.FRIEND_DELETE, slot1, slot0.group_type or FriendConst.FriendGroupType.black_list)
	end
end
