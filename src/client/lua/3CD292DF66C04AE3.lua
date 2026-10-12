PrivateChatPanel = class("PrivateChatPanel", function ()
	return ccui.Widget:create()
end)

function PrivateChatPanel.ctor(slot0, slot1, slot2)
	slot0.parent = slot2

	slot0.parent:setCascadeOpacityEnabled(true)

	if slot2 then
		slot2:addChild(slot0)
	end

	slot0.default_msg = "请输入信息"
	slot0.ctrl = slot1
	slot0.model = slot0.ctrl:getModel()
	slot0.friendCtrl = FriendController:getInstance()
	slot0.friendModel = slot0.friendCtrl:getModel()
	slot0.design_height = 1280
	slot0.design_width = 720
	slot3 = slot0.parent:getContentSize()
	slot0.size = cc.size(slot3.width - 10, slot3.height - 126)
	slot0.friend_list = {}
	slot0.select_friend = nil

	slot0:initCtrl()
	slot0:createRootWnd()
	slot0:configUI()
end

function PrivateChatPanel.createRootWnd(slot0)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(0.5, 0)
	slot0:setPosition(slot0.parent:getContentSize().width / 2, 108)
end

function PrivateChatPanel.configUI(slot0)
	slot0.bg1 = createScale9Sprite(PathTool.getResFrame("mainui", "mainui_chat_1003"), 0, 0, LOADTEXT_TYPE_PLIST, slot0)

	slot0.bg1:setCapInsets(cc.rect(11, 10, 2, 2))
	slot0.bg1:setContentSize(cc.size(648, 128))
	slot0.bg1:setAnchorPoint(0.5, 1)
	slot0.bg1:setPosition(cc.p(slot0:getContentSize().width / 2, slot0:getContentSize().height - 10))

	slot0.friendScroll = createScrollView(slot0.bg1:getContentSize().width - 20, slot0.bg1:getContentSize().height - 6, 10, slot0.bg1:getContentSize().height - 3, slot0.bg1, ccui.ScrollViewDir.horizontal)

	slot0.friendScroll:setAnchorPoint(0, 1)

	slot0.cose_list = NewCoseList.new(cc.size(slot0.size.width - 4, slot0.size.height - 140), slot0, true)

	slot0.cose_list:setCascadeOpacityEnabled(true)
	slot0.cose_list:setPosition(0, 0)
	slot0:addChild(slot0.cose_list, 3)
	slot0:createFriend(slot0.model:getContectList2())

	if slot0.friend_list[1] then
		slot0:initUserData(slot0.friend_list[1]:getData(), slot0.friend_list[1])
	end
end

function PrivateChatPanel.initCtrl(slot0)
	slot0:registerEvents(true)

	slot0.roleVo = RoleController:getInstance():getRoleVo()
	slot0.channel = ChatConst.Channel.Friend
end

function PrivateChatPanel.updateData(slot0, slot1, slot2)
	slot0:createFriend(slot0.model:getContectList2())

	if slot1 and slot2 then
		if slot0.friend_list[slot0:getFriendListData(slot1, slot2)] then
			slot0:initUserData(slot0.friend_list[slot3]:getData(), slot0.friend_list[slot3])
		end
	elseif slot0.friend_list[1] then
		slot0:initUserData(slot0.friend_list[1]:getData(), slot0.friend_list[1])
	end
end

function PrivateChatPanel.registerEvents(slot0, slot1)
	if slot1 then
		if not slot0.update_msg_evt then
			slot0.update_msg_evt = GlobalEvent:getInstance():Bind(EventId.CHAT_UPDATE_SELF, function (slot0)
				if slot0.flag == 2 then
					if uv0:checkIsInFriendList(slot0.srv_id, slot0.rid) then
						if uv0.cose_list then
							uv0.cose_list:initData(uv0:getChatContent())
							uv0.cose_list:updateMsg()
						end
					else
						uv0:createFriend(uv0.model:getContectList2())

						if uv0.friend_list[1] then
							uv0:initUserData(uv0.friend_list[1]:getData(), uv0.friend_list[1])
						end
					end
				elseif uv0.cose_list then
					uv0.cose_list:initData(uv0:getChatContent())
					uv0.cose_list:updateMsg()
				end
			end)
		end

		if not slot0.update_friend_list then
			slot0.update_friend_list = GlobalEvent:getInstance():Bind(FriendEvent.UPDATE_APPLY, function ()
				uv0:createFriend(uv0.model:getContectList2())
			end)
		end

		if not slot0.del_friend_list then
			slot0.del_friend_list = GlobalEvent:getInstance():Bind(FriendEvent.FRIEND_DELETE, function ()
				uv0:createFriend(uv0.model:getContectList2())
			end)
		end

		if not slot0.update_cose_list then
			slot0.update_cose_list = GlobalEvent:getInstance():Bind(ChatEvent.UpdatePrivateCoseList, function (slot0)
				if uv0.select_friend ~= nil and uv0.select_friend:getData().srv_id == slot0.srv_id and slot1.rid == slot0.rid then
					uv0:createFriend(uv0.model:getContectList2())
				end
			end)
		end
	else
		if slot0.update_msg_evt then
			GlobalEvent:getInstance():UnBind(slot0.update_msg_evt)

			slot0.update_msg_evt = nil
		end

		if slot0.update_friend_list then
			GlobalEvent:getInstance():UnBind(slot0.update_friend_list)

			slot0.update_friend_list = nil
		end

		if slot0.del_friend_list then
			GlobalEvent:getInstance():UnBind(slot0.del_friend_list)

			slot0.del_friend_list = nil
		end

		if slot0.update_cose_list then
			GlobalEvent:getInstance():UnBind(slot0.update_cose_list)

			slot0.update_cose_list = nil
		end
	end
end

function PrivateChatPanel.checkIsInFriendList(slot0, slot1, slot2)
	slot3 = 0

	for slot7, slot8 in pairs(slot0.friend_list) do
		if slot8 and slot8:getData() then
			slot9 = slot8:getData()

			if slot9.srv_id .. "_" .. slot9.rid == slot1 .. "_" .. slot2 then
				return true
			elseif slot3 + 1 == #slot0.friend_list then
				return false
			end
		end
	end
end

function PrivateChatPanel.getFriendListData(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.friend_list) do
		if slot7 and slot7:getData() then
			slot8 = slot7:getData()

			if slot8.srv_id .. "_" .. slot8.rid == slot1 .. "_" .. slot2 then
				return slot6
			end
		end
	end
end

function PrivateChatPanel.createFriend(slot0, slot1)
	if slot1 == nil or tableLen(slot1) == 0 then
		if slot0.friend_list then
			for slot5, slot6 in pairs(slot0.friend_list) do
				if slot6.DeleteMe then
					slot6:DeleteMe()
				end
			end
		end

		slot0.friend_list = {}

		slot0.friendScroll:removeAllChildren()
		slot0.cose_list:SetEnabled(false)

		slot0.select_friend = nil
		slot0.pre_key = nil

		slot0:showNoPeople(true)
	else
		slot0:showNoPeople(false)

		slot0.maxwidth = math.max(slot0.friendScroll:getContentSize().width, tableLen(slot1) * (PrivateChatFriendItem.Width + 10))
		slot7 = slot0.maxwidth
		slot8 = slot0.friendScroll:getContentSize().height

		slot0.friendScroll:setInnerContainerSize(cc.size(slot7, slot8))
		slot0:clearItemList()

		slot2 = nil
		slot3 = 1

		for slot7, slot8 in pairs(slot1) do
			slot9 = slot8

			if not slot0.friend_list[slot7] then
				slot0.friend_list[slot3] = PrivateChatFriendItem.new(slot0.ctrl)
			end

			slot2 = slot0.friend_list[slot3]

			slot0.friendScroll:addChild(slot2)
			slot2:setData(slot9)
			slot2:setCallBack(function (slot0, slot1)
				uv0:initUserData(slot0:getData(), slot0)
			end)
			slot2:setPosition(70 + (PrivateChatFriendItem.Width + 10) * (slot3 - 1), slot0.friendScroll:getContentSize().height / 2)

			slot3 = slot3 + 1
		end
	end
end

function PrivateChatPanel.showNoPeople(slot0, slot1)
	if not slot0.no_people then
		slot0.no_img = createImage(slot0, PathTool.getEmptyMark(), slot0.cose_list:getContentSize().width / 2 + 1.5, 396, cc.p(0.5, 0.5), false, 1, false)

		slot0.no_img:setScale(1.2)

		slot0.no_people = createLabel(24, cc.c4b(105, 55, 5, 255), nil, slot0.cose_list:getContentSize().width / 2 + 1.5, slot0.no_img:getPositionY() - 90, TI18N("暂时没有人说话"), slot0)

		slot0.no_people:setAnchorPoint(cc.p(0.5, 0.5))
	end

	slot0.no_people:setVisible(slot1)
	slot0.no_img:setVisible(slot1)

	if not slot0.jumpToFriend then
		slot0.jumpToFriend = PrivateChatFriendItem.new(slot0.ctrl)

		slot0.jumpToFriend:setAnchorPoint(0, 1)
		slot0.jumpToFriend:setPosition(slot0.friendScroll:getPositionX(), slot0.friendScroll:getPositionY())
		slot0.jumpToFriend:setSelect(true)
		slot0.jumpToFriend:setEmptyStatus(true)
		slot0.bg1:addChild(slot0.jumpToFriend)
	end

	slot0.jumpToFriend:setVisible(slot1)
end

function PrivateChatPanel.clearItemList(slot0)
	if slot0.friend_list then
		for slot4, slot5 in pairs(slot0.friend_list) do
			if not tolua.isnull(slot5) and slot5.clearInfo then
				slot5:clearInfo()
			end
		end
	end
end

function PrivateChatPanel.initUserData(slot0, slot1, slot2)
	if slot0.select_friend == nil then
		slot0.select_friend = slot2
	else
		slot0.select_friend:setSelect(false)

		slot0.select_friend = slot2
	end

	slot0.select_friend:setSelect(true)

	slot0.user_data = slot1

	if not slot0.user_data then
		return
	end

	slot0.key = slot0.user_data.srv_id .. "_" .. slot0.user_data.rid

	FriendController:getInstance():delPriCount(slot0.key)

	if slot0.key ~= slot0.pre_key then
		slot0:initContent()
		slot0.ctrl:noticeReader(slot0.user_data.srv_id, slot0.user_data.rid)
		slot0.model:delRedList(slot0.user_data.srv_id, slot0.user_data.rid)
	elseif slot0.cose_list then
		slot0.cose_list:initData(slot0:getChatContent())
		slot0.cose_list:updateMsg()
		slot0.ctrl:noticeReader(slot0.user_data.srv_id, slot0.user_data.rid)
		slot0.model:delRedList(slot0.user_data.srv_id, slot0.user_data.rid)
	end

	slot0.pre_key = slot0.key

	PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.Private_chat)
end

function PrivateChatPanel.getCurSelectItem(slot0)
	return slot0.select_friend
end

function PrivateChatPanel.getUserData(slot0)
	return slot0.user_data or {}
end

function PrivateChatPanel.initContent(slot0)
	slot0.cose_list:reset()
	slot0.cose_list:createMsg(slot0:getChatContent())
end

function PrivateChatPanel.getKey(slot0, ...)
	return slot0.key
end

function PrivateChatPanel.getCostList(slot0)
	return slot0.cose_list
end

function PrivateChatPanel.getChatContent(slot0)
	if slot0.user_data == nil then
		return
	end

	slot1, slot2 = slot0.ctrl.model:getFriendMsg(slot0.roleVo.srv_id, slot0.roleVo.rid, slot0.user_data.srv_id, slot0.user_data.rid)
	slot3 = Array.New()

	if slot2 and next(slot2) ~= nil then
		for slot7 = 1, #slot2 do
			if slot2[slot7].msg ~= "KaKa" then
				slot3:PushBack(slot2[slot7])
			end
		end
	end

	return slot3
end

function PrivateChatPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
	slot0:registerEvents(slot1)

	if slot1 == false and slot0.select_friend ~= nil then
		slot0.select_friend:setSelect(false)

		slot0.select_friend = nil
	end

	slot0.cose_list:SetEnabled(slot1)
end

function PrivateChatPanel.closeView(slot0)
	if slot0.friend_list then
		for slot4, slot5 in pairs(slot0.friend_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.friend_list = {}

	slot0.friendScroll:removeAllChildren()

	if slot0.jumpToFriend and slot0.jumpToFriend.DeleteMe then
		slot0.jumpToFriend:DeleteMe()
	end

	slot0.jumpToFriend = nil

	slot0.ctrl:clearTarCacheData()
	ChatController:getInstance().model:writeToDefaultXML()
	ChatMgr:getInstance():showReportUI(false)
	slot0:registerEvents(false)
	RefController:getInstance():closeView()

	if slot0.cose_list then
		slot0.cose_list:SetEnabled(false)

		slot0.cose_list = nil
	end
end

PrivateChatFriendItem = class("PrivateChatFriendItem", function ()
	return ccui.Widget:create()
end)
PrivateChatFriendItem.Width = 139
PrivateChatFriendItem.Height = 122

function PrivateChatFriendItem.ctor(slot0, slot1)
	slot0.ctrl = slot1

	slot0:retain()
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0.5, 0.5)

	slot0.size = cc.size(PrivateChatFriendItem.Width, PrivateChatFriendItem.Height)

	slot0:setContentSize(slot0.size)
	slot0:configUI()
end

function PrivateChatFriendItem.configUI(slot0)
	slot0.bg = createImage(slot0, PathTool.getResFrame("mainui", "mainui_1027"), 0, 0, cc.p(0, 0), true)

	slot0.bg:setScale9Enabled(true)
	slot0.bg:setCapInsets(cc.rect(12, 15, 2, 2))
	slot0.bg:setCascadeOpacityEnabled(true)
	slot0.bg:setContentSize(slot0.size)
	slot0.bg:setTouchEnabled(true)

	slot0.head_icon = PlayerHead.new(PlayerHead.type.circle)

	slot0.head_icon:setTouchEnabled(false)
	slot0.head_icon:getHeadLayer():setScale(0.9)
	slot0.head_icon:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.head_icon:setPosition(71, 61)
	slot0.bg:addChild(slot0.head_icon)

	slot0.name = createLabel(20, cc.c4b(254, 238, 207, 255), cc.c4b(31, 19, 9, 255), slot0.bg:getContentSize().width / 2, slot0.head_icon:getPositionY() - slot0.head_icon:getContentSize().height * 0.8 / 2 + 10, "sss", slot0.bg, 1)

	slot0.name:setAnchorPoint(cc.p(0.5, 1))

	slot0.select = createScale9Sprite(PathTool.getResFrame("mainui", "mainui_chat_1002"), slot0.bg:getContentSize().width / 2, slot0.bg:getContentSize().height / 2, LOADTEXT_TYPE_PLIST, slot0.bg)

	slot0.select:setAnchorPoint(0.5, 0.5)
	slot0.select:setContentSize(slot0.size)

	slot0.close_btn = CustomButton.New(slot0.bg, PathTool.getResFrame("common", "common_1028"))

	slot0.close_btn:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.close_btn:setScale(0.7)
	slot0.close_btn:setPosition(cc.p(128, 100))
	slot0:registerEvent()
end

function PrivateChatFriendItem.registerEvent(slot0)
	handleTouchEnded(slot0.close_btn, function ()
		CommonAlert.show(TI18N("确定要删除该好友的所有聊天记录吗?"), TI18N("删除"), function ()
			if uv0.data then
				slot0 = RoleController:getInstance():getRoleVo()

				ChatController:getInstance():getModel():deleteCache(slot0.srv_id, slot0.rid, uv0.data.srv_id, uv0.data.rid)
				GlobalEvent:getInstance():Fire(ChatEvent.UpdatePrivateCoseList, uv0.data)
			end
		end, TI18N("取消"), nil)
	end)
	slot0.head_icon:addCallBack(function ()
		if uv0.call_back ~= nil then
			uv0:call_back()
		end
	end)
end

function PrivateChatFriendItem.setCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function PrivateChatFriendItem.setSelect(slot0, slot1)
	slot0.select:setVisible(not slot1)
end

function PrivateChatFriendItem.setData(slot0, slot1)
	slot0.data = slot1
	slot0.key = slot1.srv_id .. "_" .. slot1.rid

	slot0.head_icon:setLev(slot1.lev)
	slot0.head_icon:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
	slot0.name:setString(slot1.name)
end

function PrivateChatFriendItem.setEmptyStatus(slot0, slot1)
	if slot1 then
		slot0.close_btn:setVisible(false)
		slot0.head_icon:setVisible(false)
		slot0.name:setVisible(false)

		if not slot0.addIcon then
			slot0.addIcon = createButton(slot0.bg, "", 70, 60, cc.size(62, 64), PathTool.getResFrame("common", "common_90026"))
		end

		slot0.addIcon:setVisible(true)
		slot0.addIcon:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				ChatController:getInstance():closeChatUseAction()
				FriendController:getInstance():openFriendWindow(true)
			end
		end)
	end
end

function PrivateChatFriendItem.getData(slot0)
	return slot0.data
end

function PrivateChatFriendItem.getKey(slot0)
	return slot0.key or 0
end

function PrivateChatFriendItem.clearInfo(slot0)
	slot0:removeFromParent()
end

function PrivateChatFriendItem.DeleteMe(slot0)
	if slot0.head_icon then
		slot0.head_icon:DeleteMe()
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
	slot0:release()
end
