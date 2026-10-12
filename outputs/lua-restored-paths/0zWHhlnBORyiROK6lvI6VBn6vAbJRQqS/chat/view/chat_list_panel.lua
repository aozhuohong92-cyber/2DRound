ChatListPanel = ChatListPanel or class("ChatListPanel", function ()
	return ccui.ScrollView:create()
end)

function ChatListPanel.ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.is_private_chat = slot3 or false
	slot0.root = slot2 or slot0
	slot0.ctrl = ChatController:getInstance()
	slot0.sourceSize = slot1
	slot0.channel = slot5

	slot0:setTouchEnabled(true)
	slot0:setSwallowTouches(false)

	slot0.container = slot0:getInnerContainer()

	slot0:changeListModel(slot4 or 1, true)
	slot0:setDirection(ccui.ScrollViewDir.vertical)
	slot0:setBounceEnabled(true)
	slot0:setClippingEnabled(true)
	slot0:setPropagateTouchEvents(true)
	slot0:setScrollBarEnabled(false)
	slot0:createNewMessage()
	slot0:setInertiaScrollEnabled(false)
	slot0:initCtrl()
end

function ChatListPanel.initCtrl(slot0)
	slot0.stack_item = {}
	slot0.stack_max = 20
	slot0.item_max = 7
	slot0.addNum = 0
	slot0.minID = 0
	slot0.maxID = 0
	slot0.timeCD = 0.3
	slot0.is_init = false
	slot0.new_message_num = 0
	slot0.stack_pool = {}

	slot0:addEventListenerScrollView(function (slot0, slot1)
		if slot1 == ccui.ScrollviewEventType.scrolling or slot1 == ccui.ScrollviewEventType.bounceTop or slot1 == ccui.ScrollviewEventType.bounceBottom then
			uv0:dynamicCheckItemVisible()
		elseif slot1 == ccui.ScrollviewEventType.scrollToBottom then
			uv0.new_message:setString("")
			uv0.msg_bg:setVisible(false)
			uv0:updateMsg()
		end
	end)
end

function ChatListPanel.initData(slot0, slot1)
	slot0.data_list = slot1

	slot0:showMonkey(slot0.data_list:GetSize() == 0)
end

function ChatListPanel.createNewMessage(slot0)
	slot0.msg_bg = ccui.Widget:create()

	slot0.msg_bg:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.msg_bg:setLocalZOrder(23)
	slot0.msg_bg:setPosition(cc.p(237, 20))
	slot0.msg_bg:setContentSize(cc.size(slot0.sourceSize.width, 40))
	slot0.root:addChild(slot0.msg_bg)

	slot3 = createSprite(PathTool.getResFrame("common", "common_1001"), 315, slot0.msg_bg:getContentSize().height / 2, slot0.msg_bg, cc.p(0, 0.5), LOADTEXT_TYPE_PLIST)
	slot0.new_message = createRichLabel(20, Config.ColorData.data_color4[5], cc.p(0.5, 0.5), cc.p(slot0.sourceSize.width / 2, 20), nil, nil, 400)

	slot0.new_message:setString("")
	slot0.msg_bg:addChild(slot0.new_message)
	slot0.msg_bg:setVisible(false)
end

function ChatListPanel.createMsg(slot0, slot1, slot2)
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

	slot0._start_list = slot1
	slot0.init_len = slot1:GetSize()
	slot0.init_height = 0
	slot4 = 0

	if slot0.stack_max < slot0.init_len then
		slot4 = slot0.init_len - slot0.stack_max
	end

	for slot8 = slot4, slot0.init_len - 1 do
		delayRun(slot0, 0.01 * slot8, function ()
			if not uv0._start_list then
				return
			end

			if not uv0._start_list:Get(uv1) then
				return
			end

			if not uv0:checkItemIsShowById(slot0.id) then
				slot1, slot2 = uv0:createItem(slot0.id)

				slot1:setData(slot0)

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

				uv0.init_height = uv0.init_height + slot1:getItemRealSize().height

				slot1:setPosition(0, uv0.init_height)

				if uv0.init_h <= uv0.init_height or slot2 then
					uv0:adjustItemPos()
				end
			end

			if uv1 == uv0.init_len - 1 then
				uv0.is_init = true

				uv0:updateMsg()
				GlobalEvent:getInstance():Fire(ChatEvent.EndCallBack)
			end
		end)
	end

	slot0:jumpToBottom()
	slot0:showMonkey(slot0.init_len == 0)
end

function ChatListPanel.updateMsg(slot0)
	if not slot0.data_list then
		return
	end

	slot2 = 0

	if slot0.stack_max < slot0.data_list:GetSize() then
		slot2 = slot1 - slot0.stack_max
	end

	for slot6 = slot2, slot1 - 1 do
		if not slot0:checkItemIsShowById(slot0.data_list:Get(slot6).id) then
			slot8, slot9 = slot0:createItem(slot7.id)

			slot8:setData(slot7)

			if slot0.is_private_chat then
				if slot6 == 0 then
					slot0.last_show_time = slot0.last_show_time or slot7.talk_time or 0

					slot8:setTiemVisible(true)
				elseif slot6 > 0 then
					if not slot0.last_show_time then
						slot0.last_show_time = slot7.talk_time or 0
					end

					if slot7.talk_time - slot0.last_show_time >= 300 then
						slot0.last_show_time = slot7.talk_time

						slot8:setTiemVisible(true)
					else
						slot8:setTiemVisible(false)
					end

					if slot6 == slot1 - 1 then
						slot0.last_speak_time = slot7.talk_time
					end
				end
			end
		end

		slot0.new_message_num = slot0.new_message_num - 1

		if slot0.new_message_num <= 0 then
			slot0.new_message_num = 0
		end
	end

	slot0.new_message:setString("")
	slot0.msg_bg:setVisible(false)
	slot0:adjustItemPos()
	slot0:showMonkey(slot1 == 0)
end

function ChatListPanel.adjustItemPos(slot0)
	slot1 = 0

	for slot6, slot7 in pairs(slot0.stack_item) do
		if not tolua.isnull(slot7) then
			slot2 = 0 + slot7:getItemRealSize().height
		end
	end

	slot10 = math.max(slot0:getContentSize().height, slot2)

	slot0:setInnerContainerSize(cc.size(slot0:getContentSize().width, slot10))
	slot0:jumpToBottom()

	slot0.realHeight = slot0:getInnerContainerSize().height
	slot5, slot6 = nil
	slot0.minID = 0
	slot0.maxID = 0

	for slot10 = 1, #slot0.stack_item do
		slot11 = 0

		if slot2 <= slot3 then
			slot5 = slot0.stack_item[slot10]

			slot5:setPosition(0, slot2 - slot1)

			slot1 = slot1 + slot5:getItemRealSize().height
		else
			slot5 = slot0.stack_item[slot4 - slot10 + 1]

			slot5:setPosition(0, slot1 + slot5:getItemRealSize().height)
		end

		if slot0.maxID < (slot5:getId() or 0) then
			slot0.maxID = slot6
		elseif slot6 < slot0.minID then
			slot0.minID = slot6
		end
	end

	slot0:dynamicCheckItemVisible()
end

function ChatListPanel.dynamicCheckItemVisible(slot0)
	slot0.stack_item = slot0.stack_item or {}
	slot3 = math.abs(slot0.container:getPositionY())

	for slot7, slot8 in pairs(slot0.stack_item) do
		if slot8:getPositionY() < slot3 or slot9 - slot8:getItemRealSize().height > slot3 + slot0:getContentSize().height then
			slot8:setVisible(false)
		else
			slot8:setVisible(true)
		end
	end
end

function ChatListPanel.showNewMessage(slot0, slot1)
	if slot0.msg_bg then
		slot0.msg_bg:setVisible(slot1)
	end
end

function ChatListPanel.createItem(slot0, slot1)
	slot0:onScrollDelete()

	slot2 = false

	if not table.remove(slot0.stack_pool, 1) then
		slot4 = slot0.sourceSize.width
		slot3 = MainChatUiMsg.new(slot4, nil, slot4, slot0.channel)

		if slot0.is_private_chat then
			slot3:setTiemVisible(true)
		end

		slot0:addChild(slot3)
	else
		slot3:setVisible(true)

		slot2 = true
	end

	slot3:setId(slot1)

	slot0.stack_item[#slot0.stack_item + 1] = slot3

	return slot3, slot2
end

function ChatListPanel.onScrollDelete(slot0)
	if slot0.stack_max <= #slot0.stack_item then
		slot1 = table.remove(slot0.stack_item, 1)

		slot1:setVisible(false)
		table.insert(slot0.stack_pool, slot1)
	end
end

function ChatListPanel.checkItemIsShowById(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.stack_item) do
		if slot7 and slot7:getId() == slot1 then
			slot2 = true

			break
		end
	end

	return slot2
end

function ChatListPanel.showMonkey(slot0, slot1)
end

function ChatListPanel.removeListItems(slot0)
	slot0:setVisible(false)

	slot0.minID = 0
	slot0.maxID = 0
end

function ChatListPanel.reset(slot0)
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

	slot0.monkey = nil
	slot0.no_people = nil
end

function ChatListPanel.SetEnabled(slot0, slot1)
	slot0:setVisible(slot1)
	slot0:setClippingEnabled(slot1)

	if not slot1 then
		slot0:removeListItems()
	end
end

function ChatListPanel.isSame(slot0, slot1)
	return slot0.channel == slot1
end

function ChatListPanel.changeListModel(slot0, slot1, slot2)
	slot0.show_model = slot1
	slot5 = ChatConst.ChatPanelHeight[MainuiController:getInstance():getMainChatBoxCurViewType()][slot1]

	if slot0.channel == ChatConst.Channel.Friend then
		slot5 = slot0.sourceSize.height
	end

	slot0:setContentSize(cc.size(slot0.sourceSize.width, slot5))
	slot0:setInnerContainerSize(cc.size(slot0.sourceSize.width, slot5))

	if not slot2 then
		slot0:adjustItemPos()
	else
		slot0:dynamicCheckItemVisible()
	end
end
