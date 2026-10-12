NewCoseList = NewCoseList or class("NewCoseList", function ()
	return ccui.ScrollView:create()
end)

function NewCoseList.ctor(slot0, slot1, slot2, slot3)
	slot0.is_private_chat = slot3 or false
	slot0.root = slot2 or slot0
	slot0.ctrl = ChatController:getInstance()
	slot0.sourceSize = slot1 or cc.size(100, 100)

	slot0:setTouchEnabled(true)
	slot0:setSwallowTouches(false)
	slot0:setContentSize(slot0.sourceSize)
	slot0:setInnerContainerSize(slot0.sourceSize)
	slot0:setDirection(ccui.ScrollViewDir.vertical)
	slot0:setBounceEnabled(true)
	slot0:setClippingEnabled(true)
	slot0:setPropagateTouchEvents(true)
	slot0:setScrollBarEnabled(false)
	slot0:createNewMessage()
	slot0:setInertiaScrollEnabled(true)
	slot0:initCtrl()
end

function NewCoseList.initCtrl(slot0)
	slot0.stack_item = {}
	slot0.stack_max = 40
	slot0.addNum = 0
	slot0.minID = 0
	slot0.maxID = 0
	slot0.timeCD = 0.3
	slot0.is_init = false
	slot0.new_message_num = 0
	slot0.is_show_vip = true
	slot0.is_bottom = true
	slot0.scrolling_flag = false

	slot0:addEventListenerScrollView(function (slot0, slot1)
		if slot1 == ccui.ScrollviewEventType.autoscrollEnded then
			uv0.scrolling_flag = false
		end

		if slot1 == ccui.ScrollviewEventType.scrollToBottom then
			uv0.new_message:setString("")
			uv0.msg_bg:setVisible(false)

			uv0.is_bottom = true

			if uv0.scrolling_flag == false then
				uv0.scrolling_flag = true

				uv0:updateMsg()
			end
		else
			uv0:dynamicCheckItemVisible()

			if slot1 == ccui.ScrollviewEventType.bounceBottom then
				uv0.new_message:setString("")
				uv0.msg_bg:setVisible(false)

				uv0.is_bottom = true

				if uv0.scrolling_flag == false then
					uv0.scrolling_flag = true

					uv0:updateMsg()
				end
			elseif slot1 == ccui.ScrollviewEventType.scrolling or slot1 == ccui.ScrollviewEventType.bounceTop then
				uv0.is_bottom = false
			end
		end
	end)
end

function NewCoseList.initData(slot0, slot1)
	slot0.data_list = slot1

	if not slot0:checkChatIsOpen() then
		slot2 = ""

		if slot0.channel == ChatConst.Channel.Province then
			slot2 = TI18N("角色35级可见该频道聊天内容")
		end

		slot0:showMonkey(true, slot2)
	else
		slot0:showMonkey(slot0.data_list:GetSize() == 0)
	end
end

function NewCoseList.checkChatIsOpen(slot0)
	slot1 = true

	if slot0.channel and slot0.channel == ChatConst.Channel.Province then
		slot2 = Config.MiscData.data_const.province_level

		if not RoleController:getInstance():getRoleVo() or not slot2 or slot3.lev < slot2.val then
			slot1 = false
		end
	end

	return slot1
end

function NewCoseList.createNewMessage(slot0)
	slot1 = cc.size(400, 43)
	slot0.msg_bg = createImage(slot0.root, PathTool.getResFrame("mainui", "mainui_2006"), 357, 112, cc.p(0.5, 0.5), true, 23, true)

	slot0.msg_bg:setCapInsets(cc.rect(17, 30, 1, 4))
	slot0.msg_bg:setContentSize(slot1)
	slot0.msg_bg:setTouchEnabled(true)
	registerButtonEventListener(slot0.msg_bg, function ()
		uv0:updateMsg(true)
	end, true)

	slot0.new_message = createRichLabel(20, cc.c4b(254, 231, 188, 255), cc.p(0.5, 0.5), cc.p(slot1.width / 2, slot1.height / 2), nil, , 400)

	slot0.new_message:setString("")
	slot0.msg_bg:addChild(slot0.new_message)
	slot0.msg_bg:setVisible(false)
end

function NewCoseList.createMsg(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	slot0.channel = slot2
	slot0.data_list = slot1
	slot3 = nil
	slot0.is_created = true
	slot0.init_h = slot0:getContentSize().height

	slot0:scrollToBottom(0, true)
	slot0:setVisible(true)

	slot7 = false

	slot0.msg_bg:setVisible(slot7)
	slot0:deleteNotExitItem()

	slot0.new_message_num = 0
	slot0.is_bottom = true
	slot0._start_list = slot1
	slot0.init_len = slot1:GetSize()
	slot0.init_height = 0

	for slot7 = 0, slot0.init_len - 1 do
		delayRun(slot0, 0.01 * slot7, function ()
			if not uv0._start_list then
				return
			end

			if not uv0._start_list:Get(uv1) then
				return
			end

			if not uv0.stack_item[slot0.id] then
				uv0:createItem(slot0.id):setData(slot0, uv0.select_index == 1)

				if uv0.is_private_chat then
					if uv1 == 0 then
						uv0.last_show_time = uv0._start_list:Get(0).talk_time or 0

						slot1:setTiemVisible(true)
					elseif uv1 > 0 then
						if not uv0.last_show_time then
							uv0.last_show_time = uv0._start_list:Get(uv1).talk_time
						end

						if slot0.talk_time - uv0.last_show_time >= 300 then
							uv0.last_show_time = slot0.talk_time

							ChatController:getInstance():getModel():setLastShowTime(uv0.last_show_time)
							slot1:setTiemVisible(true)
						else
							slot1:setTiemVisible(false)
						end

						if uv1 == uv0.init_len - 1 then
							uv0.last_show_time = slot0.talk_time
						end
					end
				end

				uv0.stack_item[slot0.id] = slot1
				uv0.addNum = uv0.addNum + 1
				uv0.init_height = uv0.init_height + slot1.root_wnd:getContentSize().height

				slot1:setPosition(0, uv0.init_height)
			end

			if uv1 == uv0.init_len - 1 then
				uv0.is_init = true
				uv0.is_bottom = true

				uv0:updateMsg()
				GlobalEvent:getInstance():Fire(ChatEvent.EndCallBack)
			end
		end)
	end

	slot0:jumpToBottom()
	slot0:adjustItemPos()

	if not slot0:checkChatIsOpen() then
		slot4 = ""

		if slot0.channel == ChatConst.Channel.Province then
			slot4 = TI18N("角色35级可见该频道聊天内容")
		end

		slot0:showMonkey(true, slot4)
	else
		slot0:showMonkey(slot0.init_len == 0)
	end
end

function NewCoseList.updateMsg(slot0, slot1)
	if not slot0.data_list then
		return
	end

	if not slot1 and not slot0.is_show_monkey and slot0.is_bottom == false and slot0:isShowNewMsgChannel(slot0.channel) == true then
		slot0.msg_bg:setVisible(true)

		slot0.new_message_num = slot0.new_message_num + 1

		slot0.new_message:setString(string.format("<div click='xxx' outline=2,#000000>%s条未读信息  </div><img src='%s'/>", slot0.new_message_num, PathTool.getResFrame("mainui", "mainui_2007")))

		return
	end

	slot0:deleteNotExitItem()

	if slot0.data_list:GetSize() - slot0.new_message_num - 1 <= 0 then
		slot4 = 0
	end

	for slot8 = slot4, slot2 - 1 do
		if not slot0.stack_item[slot0.data_list:Get(slot8).id] then
			slot0:createItem(slot9.id):setData(slot9, slot0.select_index == 1)

			if slot0.is_private_chat then
				if slot8 == 0 then
					slot0.last_show_time = slot0.last_show_time or slot9.talk_time or 0

					slot10:setTiemVisible(true)
				elseif slot8 > 0 then
					if not slot0.last_show_time then
						slot0.last_show_time = slot9.talk_time or 0
					end

					if slot9.talk_time - slot0.last_show_time >= 300 then
						slot0.last_show_time = slot9.talk_time

						slot10:setTiemVisible(true)
					else
						slot10:setTiemVisible(false)
					end

					if slot8 == slot2 - 1 then
						slot0.last_speak_time = slot9.talk_time
					end
				end
			end

			slot0.stack_item[slot9.id] = slot10
			slot0.addNum = slot0.addNum + 1
		end

		slot0.new_message_num = slot0.new_message_num - 1

		if slot0.new_message_num <= 0 then
			slot0.new_message_num = 0
		end
	end

	slot0.new_message:setString("")
	slot0.msg_bg:setVisible(false)
	slot0:adjustItemPos()

	if not slot0:checkChatIsOpen() then
		slot5 = ""

		if slot0.channel == ChatConst.Channel.Province then
			slot5 = TI18N("角色35级可见该频道聊天内容")
		end

		slot0:showMonkey(true, slot5)
	else
		slot0:showMonkey(slot2 == 0)
	end
end

function NewCoseList.deleteNotExitItem(slot0)
	if not slot0.data_list then
		return
	end

	slot1 = slot0.data_list:GetSize()
	slot2 = {}

	for slot6, slot7 in pairs(slot0.stack_item) do
		table.insert(slot2, slot6)
	end

	if #slot2 > 0 then
		table.sort(slot2)

		for slot6 = #slot2, 1, -1 do
			slot8 = slot0.stack_item[slot2[slot6]]
			slot9 = false

			for slot13 = 0, slot1 - 1 do
				if slot0.data_list:Get(slot13).id == slot7 then
					slot9 = true

					break
				end
			end

			if slot9 == false then
				slot0.addNum = slot0.addNum - 1

				slot8:removeAllChildren()
				slot8:removeFromParent()

				slot0.stack_item[slot7] = nil
			end
		end
	end
end

function NewCoseList.adjustItemPos(slot0)
	slot1 = 0

	for slot7, slot8 in pairs(slot0.stack_item) do
		if not tolua.isnull(slot8.root_wnd) and slot8.root_wnd:isVisible() then
			table.insert({}, slot7)

			slot2 = 0 + slot8.root_wnd:getContentSize().height
		end
	end

	slot0:setTouchEnabled(slot0.sourceSize.height < math.max(slot0.sourceSize.height, slot2))
	slot0:setInnerContainerSize(cc.size(slot0:getContentSize().width, slot2))

	if slot0.sourceSize.height <= slot2 and slot0:getInnerContainerSize().height <= slot2 then
		slot0:jumpToBottom()
	end

	slot0.realHeight = slot0:getInnerContainerSize().height

	table.sort(slot3)

	slot5, slot6 = nil
	slot0.minID = 0
	slot0.maxID = 0

	for slot10 = 1, #slot3 do
		if slot2 <= slot0.sourceSize.height then
			slot5 = slot0.stack_item[slot3[slot10]]

			slot5:setPosition(0, slot2 - slot1)

			slot1 = slot1 + slot5.root_wnd:getContentSize().height
		else
			slot5 = slot0.stack_item[slot3[slot4 - slot10 + 1]]

			slot5:setPosition(0, slot1 + slot5.root_wnd:getContentSize().height)
		end

		if slot0.maxID < (slot5:getId() or 0) then
			slot0.maxID = slot6
		elseif slot6 < slot0.minID then
			slot0.minID = slot6
		end
	end

	slot0:dynamicCheckItemVisible()
end

function NewCoseList.dynamicCheckItemVisible(slot0)
	slot0.stack_item = slot0.stack_item or {}
	slot4 = math.abs(slot0:getInnerContainer():getPositionY())

	for slot8, slot9 in pairs(slot0.stack_item) do
		slot10 = slot9:getPositionY()

		if slot3 < 0 and slot10 < slot4 or slot10 - slot9:getItemRealSize().height > slot4 + slot0:getContentSize().height then
			slot9:setVisible(false)
		else
			slot9:setVisible(true)
		end
	end
end

function NewCoseList.showNewMessage(slot0, slot1)
	if slot0.msg_bg then
		slot0.msg_bg:setVisible(slot1)
	end
end

function NewCoseList.createItem(slot0, slot1)
	slot0:onScrollDelete()

	slot2, slot3 = nil

	if not slot0.stack_item[slot1] then
		slot2 = ChatMsg.new(slot0.sourceSize.width)

		if slot0.is_private_chat then
			slot2:setTiemVisible(true)
		end

		slot2:setId(slot1)
		slot0:addChild(slot2)

		slot0.stack_item[slot1] = slot2
	else
		slot2:setVisible(true)

		slot3 = true
	end

	return slot2, slot3
end

function NewCoseList.onScrollDelete(slot0)
	if slot0.stack_max <= slot0.addNum then
		slot1 = {}
		slot2 = {}

		for slot6, slot7 in pairs(slot0.stack_item) do
			table.insert(slot1, slot6)
		end

		table.sort(slot1)

		if #slot1 > 0 then
			slot3 = slot1[1]
			slot4 = slot0.stack_item[slot3]
			slot0.addNum = slot0.addNum - 1

			slot4:removeAllChildren()
			slot4:removeFromParent()

			slot0.stack_item[slot3] = nil
		end
	end
end

function NewCoseList.showMonkey(slot0, slot1, slot2)
	if slot1 and slot0.channel == ChatConst.Channel.Gang and not RoleController:getInstance():getRoleVo():isHasGuild() then
		slot1 = false
	end

	if not slot0.no_people then
		slot0.no_img = createImage(slot0, PathTool.getEmptyMark(), slot0:getContentSize().width / 2, slot0:getContentSize().height / 2, cc.p(0.5, 0.5), false, 1, false)

		slot0.no_img:setScale(1.2)

		slot0.no_people = createLabel(26, cc.c3b(105, 55, 5), nil, slot0:getContentSize().width / 2, slot0:getContentSize().height / 2 - 90, slot2 or TI18N("暂时没有人说话"), slot0)

		slot0.no_people:setAnchorPoint(cc.p(0.5, 0.5))
	end

	slot0.no_people:setVisible(slot1)
	slot0.no_img:setVisible(slot1)

	slot0.is_show_monkey = slot1

	if slot1 == true then
		slot0.is_bottom = true
		slot0.new_message_num = 0

		slot0.msg_bg:setVisible(false)
	end
end

function NewCoseList.removeListItems(slot0)
	slot0:setVisible(false)

	slot0.minID = 0
	slot0.maxID = 0
end

function NewCoseList.reset(slot0)
	slot0:removeListItems()

	if slot0.stack_item and next(slot0.stack_item) ~= nil then
		for slot4, slot5 in pairs(slot0.stack_item) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.stack_item = {}
	slot0.addNum = 0
	slot0.minID = 0
	slot0.maxID = 0

	slot0:setInnerContainerSize(slot0.sourceSize)
	slot0:stopAllActions()
	slot0:removeAllChildren()

	slot0.no_img = nil
	slot0.no_people = nil
end

function NewCoseList.SetEnabled(slot0, slot1)
	slot0:setClippingEnabled(slot1)
	slot0:setVisible(slot1)

	if not slot1 then
		slot0:removeListItems()
	end
end

function NewCoseList.isSame(slot0, slot1)
	return slot0.channel == slot1
end

function NewCoseList.isShowNewMsgChannel(slot0, slot1)
	if slot1 == ChatConst.Channel.Gang or slot1 == ChatConst.Channel.World or slot1 == ChatConst.Channel.Province or slot1 == ChatConst.Channel.Cross then
		return true
	end

	return false
end
