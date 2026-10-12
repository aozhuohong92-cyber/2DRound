ChatWindow = ChatWindow or BaseClass(CommonUI)
slot0 = RefController:getInstance()
slot1 = ChatController:getInstance()
slot2 = ChatController:getInstance():getModel()

function ChatWindow.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.TOP_TAG
	slot0.control_mode = false
	slot0.time = 0
	slot0.is_top = false
	slot0.requestList = {}
	slot0.tab_btn_list = {}
	slot0.cur_selected = nil
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.item_desc_list = {}
	slot0.item_code_list = {}
	slot0.filt_is_show = false
	slot0.vip_is_show = slot0.role_vo.is_show_vip == 1

	slot0:initHandle()
end

function ChatWindow.initHandle(slot0)
	slot0.default_msg = TI18N("请输入信息...")
	slot0.find_msg = TI18N("点击查找好友")

	slot0:registerNotifier(true)
	slot0:createRootWnd()
	slot0:updateTabBar()
	slot0:initView()
	slot0:initCtrl()
end

function ChatWindow.updateTabBar(slot0)
	slot0.stack_tag = {
		ChatConst.Channel.World,
		ChatConst.Channel.Gang,
		ChatConst.Channel.Friend,
		ChatConst.Channel.Notice,
		ChatConst.Channel.Cross,
		ChatConst.Channel.Province
	}
	slot0.stack_pos = {
		[ChatConst.Channel.World] = 1,
		[ChatConst.Channel.Gang] = 2,
		[ChatConst.Channel.Friend] = 3,
		[ChatConst.Channel.Notice] = 4,
		[ChatConst.Channel.Cross] = 5,
		[ChatConst.Channel.Province] = 6
	}
end

function ChatWindow.createRootWnd(slot0)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.root_wnd:setAnchorPoint(0, 0)

	slot0.mask = ccui.Layout:create()

	slot0.mask:setTouchEnabled(true)
	slot0.mask:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.mask:setAnchorPoint(0.5, 0.5)
	slot0.mask:setPosition(slot0.root_wnd:getContentSize().width / 2, slot0.root_wnd:getContentSize().height / 2)
	slot0.root_wnd:addChild(slot0.mask)
	slot0.mask:setBackGroundColor(cc.c3b(0, 0, 0))
	slot0.mask:setBackGroundColorOpacity(128)
	slot0.mask:setBackGroundColorType(1)
	slot0.mask:setScale(display.getMaxScale())
	ViewManager:getInstance():getLayerByTag(slot0.view_tag):addChild(slot0.root_wnd)

	slot1 = display.height
	slot0.design_height = 1280
	slot0.design_width = 720
	slot2 = slot1 / slot0.design_height
	slot0.real_height = slot1
	slot0.offset_height = slot0.real_height - slot1
	slot0.free_height = MainuiController:getInstance():getMainUi():getFreeSize()
	slot0.size = cc.size(SCREEN_WIDTH, slot0.free_height)
end

function ChatWindow.initView(slot0)
	slot0.back_bg = ccui.Widget:create()

	slot0.back_bg:setAnchorPoint(cc.p(0, 0))
	slot0.back_bg:setPosition(cc.p(display.getLeft(slot0.root_wnd), display.getBottom(slot0.root_wnd) + MainuiController:getInstance():getMainUi():getBottomHeight()))
	slot0.back_bg:setTouchEnabled(true)
	slot0.back_bg:setContentSize(cc.size(slot0.size.width, slot0.size.height))
	slot0.root_wnd:addChild(slot0.back_bg, 1)

	slot0.bg1 = createScale9Sprite(PathTool.getResFrame("common", "common_1003"), 0, 0, LOADTEXT_TYPE_PLIST, slot0.back_bg)

	slot0.bg1:setCapInsets(cc.rect(62, 52, 2, 2))
	slot0.bg1:setLocalZOrder(1)
	slot0.bg1:setContentSize(cc.size(slot0.size.width, slot0.free_height - 100))
	slot0.bg1:setAnchorPoint(0.5, 1)
	slot0.bg1:setPosition(cc.p(slot0.back_bg:getContentSize().width / 2, slot0.back_bg:getContentSize().height - 35))

	res = PathTool.getResFrame("common", "common_1002")
	slot0.bg2 = createScale9Sprite(res, 0, 0, LOADTEXT_TYPE_PLIST, slot0.bg1)

	slot0.bg2:setLocalZOrder(1)
	slot0.bg2:setCapInsets(cc.rect(37, 35, 2, 2))

	slot2 = slot0.bg1:getContentSize()

	slot0.bg2:setContentSize(cc.size(slot2.width - 25, slot2.height - 92))
	slot0.bg2:setAnchorPoint(0, 0)
	slot0.bg2:setPosition(cc.p(12, 15))

	slot3 = createScale9Sprite(PathTool.getResFrame("mainui", "mainui_chat_1004"), 0, 0, LOADTEXT_TYPE_PLIST, slot0.bg2)

	slot3:setCapInsets(cc.rect(24, 24, 107, 89))
	slot3:setContentSize(cc.size(slot2.width - 29, slot2.height - 100))
	slot3:setAnchorPoint(0, 0)
	slot3:setPosition(cc.p(2, 2))

	slot4 = createImage(slot0.bg2, nil, 0, 0, cc.p(0, 0), false, 1)

	slot4:setCapInsets(cc.rect(24, 24, 107, 89))
	slot4:setAnchorPoint(0.5, 0)
	slot4:setPosition(cc.p(slot0.bg2:getContentSize().width / 2, 6))

	slot0.line_load = loadImageTextureFromCDN(slot4, PathTool.getPlistImgForDownLoad("bigbg/pattern", "pattern_3"), ResourcesType.single, slot0.line_load)
	slot0.shrink_btn = CustomButton.New(slot0.back_bg, PathTool.getResFrame("common", "txt_cn_common_1107"), nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.shrink_btn:setAnchorPoint(0.5, 0.5)
	slot0.shrink_btn:setPosition(73, 27)
	slot0.shrink_btn:setLocalZOrder(2)

	slot6 = createScale9Sprite(PathTool.getResFrame("mainui", "mainui_chat_bottom_bg"), 0, 0, LOADTEXT_TYPE_PLIST, slot0.bg2)

	slot6:setContentSize(cc.size(slot0.bg2:getContentSize().width - 4, 86))
	slot6:setAnchorPoint(0, 0)
	slot6:setPosition(cc.p(2, 22))

	slot0.container_size = cc.size(slot0.bg2:getContentSize().width - 16, slot0.bg2:getContentSize().height - slot6:getContentSize().height - 36)
	slot0.notice_label = createLabel(26, cc.c4b(248, 194, 60, 255), nil, slot6:getContentSize().width / 2, slot6:getContentSize().height / 2, TI18N("该频道下无法发言"), slot6)

	slot0.notice_label:setAnchorPoint(0.5, 0.5)
	slot0.notice_label:setVisible(false)

	slot0.btn_send = CustomButton.New(slot6, PathTool.getResFrame("common", "common_1017"), PathTool.getResFrame("common", "common_1017"), nil, LOADTEXT_TYPE_PLIST)

	slot0.btn_send:setBtnLableColor(Config.ColorData.data_color4[1])
	slot0.btn_send:setSize(cc.size(155, 62))
	slot0.btn_send:setLabelSize(26)
	slot0.btn_send:setPosition(cc.p(590, slot6:getContentSize().height / 2))
	slot0.btn_send:setBtnLabel(TI18N("发送"))
	slot0.btn_send:getLabel():enableOutline(cc.c3b(2, 0, 25), 2)
	slot0.btn_send:setLocalZOrder(4)
	slot0:createTabBtnList()

	slot0.chat_input = ChatInput.new("chatWindow")

	slot0.chat_input:setPosition(78, slot6:getContentSize().height / 2 - 12)
	slot0.chat_input:setInputFunc(function ()
		uv0:onEditBoxTouch()
	end)
	slot0.chat_input:setVoiceFunc(function (slot0, slot1)
		uv0:beginRecord(slot0, slot1)
	end)
	slot6:addChild(slot0.chat_input, 5)

	slot0.in_x = slot0.back_bg:getContentSize().width + 100
	slot0.out_x = 1

	slot0.back_bg:setPositionX(-slot0.in_x)
end

function ChatWindow.showAtNotice(slot0, slot1, slot2)
	if slot0.at_notice == nil then
		slot0.at_notice = createImage(slot0.bg1, PathTool.getResFrame("mainui", "mainui_chat_at_bg"), slot0.bg1:getContentSize().width - 262, 130, cc.p(0.5, 0.5), true, 0, true)

		slot0.at_notice:setCapInsets(cc.rect(41, 27, 2, 2))
		slot0.at_notice:setContentSize(cc.size(250, 52))
		slot0.at_notice:setAnchorPoint(0, 0)
		slot0.at_notice:setTouchEnabled(true)
		slot0.at_notice:setLocalZOrder(99)

		slot0.at_label = createRichLabel(24, 1, cc.p(0, 0.5), cc.p(25, slot0.at_notice:getContentSize().height / 2), 0, 0, 150)

		slot0.at_label:setString(TI18N("有人提到了我"))
		slot0.at_notice:addChild(slot0.at_label)

		slot3 = createScale9Sprite(PathTool.getResFrame("mainui", "mainui_chat_at_line"), slot0.at_label:getPositionX() + slot0.at_label:getContentSize().width + 22, slot0.at_notice:getContentSize().height / 2, LOADTEXT_TYPE_PLIST, slot0.at_notice)
		slot0.at_close = CustomButton.New(slot0.at_notice, PathTool.getResFrame("mainui", "mainui_chat_close"), PathTool.getResFrame("mainui", "mainui_chat_close"), nil, LOADTEXT_TYPE_PLIST)

		slot0.at_close:setAnchorPoint(0, 0.5)
		slot0.at_close:setPosition(slot0.at_notice:getContentSize().width - slot0.at_close:getContentSize().width - 5, slot0.at_notice:getContentSize().height / 2 - 2)
	end

	function slot3()
		uv0.at_notice:setVisible(false)
		uv1:setAtData({})

		if uv2 and next(uv2) ~= nil then
			uv3:sender12768(uv2.rid, uv2.srv_id, uv2.channel, uv2.msg)
		end
	end

	handleTouchEnded(slot0.at_close, function ()
		uv0()
	end)

	if slot2 and next(slot2) ~= nil then
		if slot0.channelList then
			if slot0.channelList[slot0.channel] and slot5.stack_item then
				if slot5.stack_item[uv1:getId(slot0.channel, slot2.srv_id, slot2.rid, slot2.name, slot2.msg)] then
					slot0.at_notice:setVisible(slot1)
				else
					slot0.at_notice:setVisible(false)
				end
			else
				slot0.at_notice:setVisible(false)
			end
		end
	else
		slot0.at_notice:setVisible(false)
	end

	slot0.at_notice:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and uv0 and next(uv0) ~= nil then
			if uv2.channelList[uv2.channel] and slot3.stack_item and slot3.stack_item[uv1:getId(uv2.channel, uv0.srv_id, uv0.rid, uv0.name, uv0.msg)] then
				slot3:jumpToPercentVertical(math.floor((uv2.channelList[uv2.channel].realHeight - slot4:getPositionY() + slot4:getContentSize().height) / uv2.channelList[uv2.channel].realHeight * 100))
				uv3()
			end
		end
	end)
end

function ChatWindow.createTabBtnList(slot0)
	slot0.tabArray = {
		{
			index = 6,
			status = true,
			title = TI18N("同省"),
			notice = TI18N("等级不足35级")
		},
		{
			index = 5,
			status = true,
			title = TI18N("跨服"),
			notice = TI18N("等级不足50级")
		},
		{
			index = 1,
			status = true,
			title = TI18N("世界")
		},
		{
			index = 2,
			status = true,
			title = TI18N("公会"),
			notice = TI18N("您暂时没有加入公会")
		},
		{
			index = 3,
			status = true,
			title = TI18N("私聊")
		},
		{
			index = 4,
			status = true,
			title = TI18N("系统")
		}
	}
	slot1 = ccui.Widget:create()

	slot1:setContentSize(cc.size(670, 90))
	slot1:setAnchorPoint(cc.p(0, 1))
	slot1:setPosition(cc.p(15, slot0.bg1:getContentSize().height - 20))
	slot0.bg1:addChild(slot1)
	slot1:setLocalZOrder(0)

	slot2 = slot1:getContentSize()
	slot0.tab_scrollview = CommonScrollViewLayout.new(slot1, cc.p(0, 10), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot2.width + 20, slot2.height), {
		start_y = 15,
		item_width = 120,
		start_x = -5,
		space_x = -5,
		row = 1,
		item_height = 60,
		space_y = 0,
		col = 0,
		item_class = CommonTabBtn
	})

	slot0.tab_scrollview:setData(slot0.tabArray, handler(slot0, slot0._onClickTabBtn), nil, {
		default_index = 1,
		tab_size = cc.size(120, 60),
		title_offset = cc.p(0, -5),
		red_offset = cc.p(0, -5)
	})
	slot0.tab_scrollview:addEndCallBack(function ()
		slot1 = uv0.tab_scrollview
		slot3 = slot1
		uv0.tab_btn_list = slot1.getItemList(slot3)

		for slot3, slot4 in ipairs(uv0.tabArray) do
			uv0:setTabBtnTouchStatus(uv0:checkBtnIsOpen(slot4.index), slot4.index)
		end

		uv0:initChannelRedNum()

		if uv0.temp_cur_index then
			uv0:setSelecteTab(uv0.temp_cur_index)

			uv0.temp_cur_index = nil
		end
	end)
end

function ChatWindow._onClickTabBtn(slot0, slot1)
	if slot0.cur_selected then
		slot0.cur_selected:setBtnSelectStatus(false)
	end

	if slot1 then
		slot0.cur_selected = slot1

		slot0.cur_selected:setBtnSelectStatus(true)
		slot0:openTagBtn(slot0.cur_selected.index)

		if slot0.cur_selected.index == 1 then
			PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.At_notice)
		end
	end
end

function ChatWindow.setSelecteTab(slot0, slot1)
	if slot0.tab_scrollview then
		slot2 = nil

		for slot6, slot7 in pairs(slot0.tab_btn_list) do
			if slot7.index == slot1 then
				slot2 = slot7
			end
		end

		if slot2 then
			slot0:_onClickTabBtn(slot2)
		end
	end
end

function ChatWindow.checkBtnIsOpen(slot0, slot1)
	if slot1 == 2 and RoleController:getInstance():getRoleVo():isHasGuild() == false then
		return false
	elseif slot1 == 5 then
		if Config.MiscData.data_const.cross_level.val <= slot0.role_vo.lev then
			return true
		else
			return false
		end
	end

	return true
end

function ChatWindow.setTabBtnTouchStatus(slot0, slot1, slot2)
	if slot0.tab_scrollview then
		slot3 = nil

		for slot7, slot8 in pairs(slot0.tab_btn_list) do
			if slot8.index == slot2 then
				slot3 = slot8
			end
		end

		if slot3 then
			slot3:setBtnOpenStatus(slot1)
		end
	end
end

function ChatWindow.initChannelRedNum(slot0)
	for slot4, slot5 in ipairs(slot0.tab_btn_list) do
		if slot5.index ~= 4 then
			slot0:setTabTipsII(slot0.stack_tag[slot5.index])
		end
	end
end

function ChatWindow.setTabTipsII(slot0, slot1)
	if slot1 == nil then
		return
	end

	if not slot0.tab_scrollview then
		return
	end

	if slot0.stack_pos[slot1] == nil then
		return
	end

	slot3 = nil

	for slot7, slot8 in pairs(slot0.tab_btn_list) do
		if slot8.index == slot2 then
			slot3 = slot8
		end
	end

	if slot3 then
		slot3:setRedStatus(uv0:getChannelMsgSum(slot1) > 0, slot4)
	end
end

function ChatWindow.playMoveAct(slot0, slot1)
	if slot0.moving then
		return
	end

	slot0.moving = true

	slot0.back_bg:stopAllActions()

	slot2 = 0

	slot0.back_bg:runAction(cc.Sequence:create(cc.MoveTo:create(0.2, cc.p((slot1 and 0 or -slot0.in_x) + slot0.out_x, slot0.back_bg:getPositionY())), cc.CallFunc:create(function ()
		uv0.moving = nil

		if not uv1 then
			uv0:close()
		elseif uv0.commend_ui then
			uv0.commend_ui:judgeLead()
		end

		if uv0.is_top then
			uv0.back_bg:setPositionY(uv0.back_bg:getPositionY() - 275)

			uv0.is_top = false
		end
	end)))

	if not slot1 and GuideController:getInstance():isInGuide() == false then
		MainuiController:getInstance():setMainUIChatBubbleStatus(true)
	end
end

function ChatWindow.addMoveAndClose(slot0)
	slot0.mask:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:playMoveAct()
		end
	end)
	slot0.back_bg:addTouchEventListener(function (slot0, slot1)
		slot2, slot3 = nil

		if slot1 == ccui.TouchEventType.ended and cc.p(slot0:getTouchBeganPosition()).x - cc.p(slot0:getTouchEndPosition()).x > 300 then
			uv0:playMoveAct()
		end
	end)
end

function ChatWindow.openChannel(slot0, slot1, slot2, slot3)
	slot4 = slot0.stack_pos[slot1]
	slot0.channel = slot1
	slot0.select_srv_id = slot2
	slot0.select_rid = slot3

	for slot8, slot9 in ipairs(slot0.tabArray) do
		slot0:setTabBtnTouchStatus(slot0:checkBtnIsOpen(slot9.index), slot9.index)
	end

	if not slot0.tab_btn_list or next(slot0.tab_btn_list) == nil then
		slot0.temp_cur_index = slot4
	else
		slot0:setSelecteTab(slot4)
	end
end

function ChatWindow.moveToChannel(slot0, slot1)
	slot2 = slot0.stack_pos[slot1]
	slot0.channel = slot1

	for slot6, slot7 in ipairs(slot0.tabArray) do
		slot0:setTabBtnTouchStatus(slot0:checkBtnIsOpen(slot7.index), slot7.index)
	end

	slot0:setSelecteTab(slot2)
end

function ChatWindow.initCtrl(slot0)
	slot0:registerNotifier(true)
	slot0:addMoveAndClose()
	slot0.shrink_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:playMoveAct()
		end
	end)
	handleTouchEnded(slot0.btn_send, function ()
		uv0:onEditBoxTouch()
	end)
end

function ChatWindow.beginRecord(slot0, slot1, slot2)
	if slot0.channel == ChatConst.Channel.Multi or slot3 == ChatConst.Channel.Event then
		slot3 = ChatConst.Channel.World
	end

	ChatHelp.RecordTouched(slot1, slot2, slot3)
end

function ChatWindow.openTagBtn(slot0, slot1)
	if slot1 == slot0.select_index or not slot0.stack_tag or not slot0.chat_input then
		return
	end

	slot0.select_index = slot1
	slot0.channel = slot0.stack_tag[slot1]

	uv0:setLastChannel(slot0.channel)
	slot0.chat_input:setChatChannel(slot0.channel)
	slot0:setCoseListDisable()
	slot0:showCoseList(slot0.channel)
	slot0.chat_input:setVisible(true)

	if slot0.channel == ChatConst.Channel.Event or slot0.channel == ChatConst.Channel.Notice then
		slot0.chat_input:setVisible(false)
		slot0.notice_label:setVisible(true)
	elseif slot0.channel == ChatConst.Channel.Province then
		if not Config.MiscData.data_const.province_level or slot0.role_vo.lev < slot2.val then
			slot0.chat_input:setVisible(false)
			slot0.notice_label:setVisible(false)
		else
			slot0.chat_input:setVisible(true)
			slot0.notice_label:setVisible(false)
		end
	else
		slot0.notice_label:setVisible(false)
	end

	if slot1 == 1 or slot1 == 2 or slot1 == 5 or slot1 == 6 then
		if uv1:getAtData() and next(slot2) ~= nil then
			slot0:showAtNotice(true, slot2)
		end

		slot0.chat_input.edit_box:setPlaceHolder(TI18N("请输入,长按头像可快捷@人"))
	else
		slot0.chat_input.edit_box:setPlaceHolder(TI18N("请输入信息"))
	end

	if slot1 == 6 then
		slot0:cleatInputText()
	end

	slot0:checkFindInput()
	slot0:analyseGang()
end

function ChatWindow.checkFindInput(slot0)
	if slot0.channel == ChatConst.Channel.Event or slot0.channel == ChatConst.Channel.Notice then
		slot0.btn_send:setVisible(false)

		if slot0.find_input then
			slot0.f_edit_box:setPosition(70, 0)
		end
	elseif slot0.channel == ChatConst.Channel.Province then
		if not Config.MiscData.data_const.province_level or slot0.role_vo.lev < slot1.val then
			slot0.btn_send:setVisible(false)
		else
			slot0.btn_send:setVisible(true)
		end
	else
		slot0.btn_send:setVisible(true)

		if slot0.channel == ChatConst.Channel.Mail then
			slot0.btn_send:setBtnLabel(TI18N("返回"))
		else
			slot0.btn_send:setBtnLabel(TI18N("发送"))
		end

		if slot0.find_input then
			slot0.f_edit_box:setPosition(18, 0)
		end
	end
end

function ChatWindow.analyseGang(slot0)
	if slot0.channel == ChatConst.Channel.Gang and not RoleController:getInstance():getRoleVo():isHasGuild() then
		uv0:clearChatLog(slot0.channel)

		if slot0:getCostList(ChatConst.Channel.Gang) then
			slot1:reset()
		end

		slot0:showJoinGang(true)
	else
		slot0:showJoinGang(false)
	end
end

function ChatWindow.showJoinGang(slot0, slot1)
	if slot1 then
		if slot0.help_text == nil then
			slot0.help_text = createRichLabel(24, Config.ColorData.data_color4[66], cc.p(0.5, 0.5), cc.p(0, 0), nil, nil, 300)

			slot0.help_text:setString(TI18N("您暂时没有加入公会"))
			slot0.help_text:setAnchorPoint(0.5, 0.5)
			slot0.help_text:setPosition(slot0.bg1:getContentSize().width / 2, slot0.bg1:getContentSize().height / 2 - 90)
			slot0.bg1:addChild(slot0.help_text)

			if slot0.no_img == nil then
				slot0.no_img = createImage(slot0.bg1, PathTool.getEmptyMark(), slot0.bg1:getContentSize().width / 2, slot0.bg1:getContentSize().height / 2 - 2, cc.p(0.5, 0.5), false, 1, false)

				slot0.no_img:setScale(1.2)
			end
		end
	else
		doRemoveFromParent(slot0.help_text)

		slot0.help_text = nil

		if slot0.no_img then
			doRemoveFromParent(slot0.no_img)

			slot0.no_img = nil
		end
	end
end

function ChatWindow.registerNotifier(slot0, slot1)
	if slot1 then
		if not slot0.close_btn_event then
			slot0.close_btn_event = GlobalEvent:getInstance():Bind(EventId.CHAT_CLOSEBTN_VISIBLE, function (slot0)
				uv0.shrink_btn:setVisible(true)
			end)
		end

		if not slot0.world_msg_evt then
			slot0.world_msg_evt = GlobalEvent:getInstance():Bind(EventId.CHAT_UDMSG_WORLD, function (slot0, slot1)
				if uv0.is_open then
					uv0:updateCoseList(slot0, slot1)
				end
			end)
		end

		if not slot0.multi_msg_evt then
			slot0.multi_msg_evt = GlobalEvent:getInstance():Bind(EventId.CHAT_UDMSG_ASSETS, function ()
				if uv0.is_open then
					uv0:updateCoseList(ChatConst.Channel.Notice)
				end
			end)
		end

		if not slot0.clear_input_event then
			slot0.clear_input_event = GlobalEvent:getInstance():Bind(EventId.CHAT_CLEAR_INPUT, function (slot0)
				uv0:cleatInputText()
			end)
		end

		if not slot0.backspace_evt then
			slot0.backspace_evt = GlobalEvent:getInstance():Bind(EventId.CHAT_BACKSPACE, function (slot0)
				if slot0 == "chatPanel" then
					uv0:handleBackSpace()
				end
			end)
		end

		if not slot0.add_face_evt then
			slot0.add_face_evt = GlobalEvent:getInstance():Bind(EventId.CHAT_SELECT_FACE, function (slot0, slot1)
				if slot1 == "chatWindow" then
					uv0:onEditTextAddFace(slot0)
				end
			end)
		end

		if not slot0.add_item_evt then
			slot0.add_item_evt = GlobalEvent:getInstance():Bind(EventId.CHAT_SELECT_ITEM, function (slot0, slot1)
				if slot1 == "chatWindow" then
					uv0:onEditTextAddItem(slot0)
				end
			end)
		end

		if not slot0.adjust_event then
			slot0.adjust_event = GlobalEvent:getInstance():Bind(ChatConst.Voice_Translate_Panel, function ()
				uv0:adjustPosAfterTranslate()
			end)
		end

		if not slot0.touch_send_evt then
			slot0.touch_send_evt = GlobalEvent:getInstance():Bind(EventId.CHAT_QUICK_SEND, function (slot0)
				if slot0 == "chatPanel" then
					uv0:onEditBoxTouch()
				end
			end)
		end

		if slot0.role_vo and slot0.role_update_lev_event == nil then
			slot0.role_update_lev_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
				if (slot0 == "gsrv_id" or slot0 == "gid") and uv0.role_vo:isHasGuild() then
					uv0:setTabBtnTouchStatus(true, 2)
				end
			end)
		end

		if slot0.new_msg_add_event == nil then
			slot0.new_msg_add_event = GlobalEvent:getInstance():Bind(EventId.CHAT_NEWMSG_FLAG, function (slot0)
				uv0:setTabTipsII(slot0)
			end)
		end

		if not slot0.update_at then
			slot0.update_at = GlobalEvent:getInstance():Bind(ChatEvent.EndCallBack, function ()
				if (uv0.channel == ChatConst.Channel.Gang or uv0.channel == ChatConst.Channel.World) and uv1:getAtData() and next(slot0) ~= nil then
					uv0:showAtNotice(true, slot0)
				end
			end)
		end

		if not slot0.enter_fight then
			slot0.enter_fight = GlobalEvent:getInstance():Bind(SceneEvent.ENTER_FIGHT, function ()
				uv0:playMoveAct()
			end)
		end
	else
		if slot0.close_btn_event then
			GlobalEvent:getInstance():UnBind(slot0.close_btn_event)

			slot0.close_btn_event = nil
		end

		if slot0.world_msg_evt then
			GlobalEvent:getInstance():UnBind(slot0.world_msg_evt)

			slot0.world_msg_evt = nil
		end

		if slot0.multi_msg_evt then
			GlobalEvent:getInstance():UnBind(slot0.multi_msg_evt)

			slot0.multi_msg_evt = nil
		end

		if slot0.clear_input_event then
			GlobalEvent:getInstance():UnBind(slot0.clear_input_event)

			slot0.clear_input_event = nil
		end

		if slot0.backspace_evt then
			GlobalEvent:getInstance():UnBind(slot0.backspace_evt)

			slot0.backspace_evt = nil
		end

		if slot0.add_face_evt then
			GlobalEvent:getInstance():UnBind(slot0.add_face_evt)

			slot0.add_face_evt = nil
		end

		if slot0.add_item_evt then
			GlobalEvent:getInstance():UnBind(slot0.add_item_evt)

			slot0.add_item_evt = nil
		end

		if slot0.touch_send_evt then
			GlobalEvent:getInstance():UnBind(slot0.touch_send_evt)

			slot0.touch_send_evt = nil
		end

		if slot0.adjust_event then
			GlobalEvent:getInstance():UnBind(slot0.adjust_event)

			slot0.adjust_event = nil
		end

		if slot0.role_vo and slot0.role_update_lev_event then
			slot0.role_vo:UnBind(slot0.role_update_lev_event)

			slot0.role_update_lev_event = nil
		end

		if slot0.new_msg_add_event then
			GlobalEvent:getInstance():UnBind(slot0.new_msg_add_event)

			slot0.new_msg_add_event = nil
		end

		if slot0.update_at then
			GlobalEvent:getInstance():UnBind(slot0.update_at)

			slot0.update_at = nil
		end

		if slot0.enter_fight then
			GlobalEvent:getInstance():UnBind(slot0.enter_fight)

			slot0.enter_fight = nil
		end
	end
end

function ChatWindow.onEditBoxTouch(slot0)
	slot1, slot2 = slot0.chat_input:getInputText()
	slot2 = slot2 or ""

	if slot0.channel == ChatConst.Channel.Event then
		message(TI18N("事件频道不能发言"))

		return
	end

	if slot0.chat_input:isNothing() then
		message(TI18N("请输入聊天信息"))

		return
	end

	if WordCensor:getInstance():relapceFaceIconTag(slot1)[1] > 5 then
		message(TI18N("发言中不能超过5个表情"))

		return
	end

	slot4 = nil
	slot1 = WordCensor:getInstance():relpaceChatTag(slot1)

	if slot0.item_desc_list and next(slot0.item_desc_list) then
		for slot8, slot9 in pairs(slot0.item_desc_list) do
			slot1 = string.gsub(slot1, slot8, slot9, 1)
		end
	end

	if slot0.channel == ChatConst.Channel.World then
		slot4 = 1
		slot1 = slot0:repleaceAtPeopleText(slot1, slot2)
	elseif slot0.channel == ChatConst.Channel.Cross then
		slot4 = 1024
		slot1 = slot0:repleaceAtPeopleText(slot1, slot2)
	elseif slot0.channel == ChatConst.Channel.Province then
		slot4 = 2048
		slot1 = slot0:repleaceAtPeopleText(slot1, slot2)
	elseif slot0.channel == ChatConst.Channel.Scene then
		slot4 = 2
	elseif slot0.channel == ChatConst.Channel.Team then
		slot4 = 8
	elseif slot0.channel == ChatConst.Channel.Gang then
		if RoleController:getInstance():getRoleVo():isHasGuild() then
			slot4 = 4
			slot1 = slot0:repleaceAtPeopleText(slot1, slot2)
		else
			message(TI18N("加入公会即可在此频道发言"))
		end
	elseif slot0.channel == ChatConst.Channel.Friend then
		slot4 = nil

		if slot0.channelList[slot0.channel]:getUserData() and next(slot5) ~= nil then
			uv0:sender12720(slot5.srv_id, slot5.rid, 0, slot1)
			slot0:cleatInputText()
		else
			message(TI18N("当前没人可以聊天~"))
		end
	end

	if slot4 and GameNet:getInstance():getTime() - slot0.time > 1 then
		slot0.time = GameNet:getInstance():getTime()

		if uv0:sendChatMsg(slot4, 0, slot1) then
			slot0:cleatInputText()
		end
	end
end

function ChatWindow.repleaceAtPeopleText(slot0, slot1, slot2)
	slot4 = string.find(slot1, " ")
	slot5 = string.len(slot1)

	if string.find(slot1, "@") and slot4 then
		slot6 = string.sub(slot1, slot3, slot4)
		slot1 = string.gsub(slot1, slot6, string.format("<div href=atpeople srvid=%s>%s</div>", slot2, slot6))
	end

	return slot1
end

function ChatWindow.cleatInputText(slot0)
	slot0.chat_input:setInputText("")

	slot0.item_desc_list = {}
	slot0.item_code_list = {}
end

function ChatWindow.handleBackSpace(slot0)
	if slot0.chat_input:getInputText() ~= "" then
		slot2, slot3 = StringUtil.splitStr(slot1)

		for slot8 = 1, #slot2 - 1 do
			slot4 = "" .. tostring(slot2[slot8].char)
		end

		slot0.chat_input:setInputText(slot4)
	end
end

function ChatWindow.onEditTextAddFace(slot0, slot1)
	if slot0.chat_input:getInputText() == slot0.default_msg then
		slot2 = ""
	end

	slot0.chat_input:setInputText(slot2 .. slot1)
end

function ChatWindow.onEditTextAddItem(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.chat_input:getInputText() == slot0.default_msg then
		slot2 = ""
	end

	if slot2 == "" then
		slot0.item_desc_list = {}
		slot0.item_code_list = {}
	end

	slot4 = slot1.share_id
	slot8 = slot1.code

	if Config.ItemData.data_get_data(slot1.base_id) then
		slot10 = uv0:buildItemMsg(slot3, RoleController:getInstance():getRoleVo().srv_id, slot4, slot1.count)

		if slot0.item_code_list[slot8] then
			slot11 = slot0.item_code_list[slot8]
			slot13 = slot11.desc
			slot2 = string.gsub(slot2, slot11.key, string.format("{%s,%s}", slot4, slot7.name), 1)
		else
			slot2 = slot2 .. slot9
		end

		slot0.item_code_list[slot8] = {
			key = slot9,
			desc = slot10
		}
		slot0.item_desc_list[slot9] = slot10

		slot0.chat_input:setInputText(slot2)
	end
end

function ChatWindow.getEditText(slot0)
	return slot0.chat_input:getInputText()
end

function ChatWindow.open(slot0)
	if not slot0.is_open then
		slot0.is_open = true

		slot0:playMoveAct(true)
	end

	slot0.root_wnd:setVisible(true)
	slot0:addClock(false)
	slot0:registerNotifier(true)
	slot0:setCommonUIZOrder(slot0.root_wnd)
	slot0:initChannelRedNum()
	uv0:openChatUITimer(false)
end

function ChatWindow.close(slot0)
	SysEnv:getInstance():save()
	ChatMgr:getInstance():showReportUI(false)
	RefController:getInstance():closeView()
	slot0.root_wnd:setVisible(false)

	slot0.is_open = false
	slot0.select_index = nil

	slot0:registerNotifier(false)
	slot0:setCoseListDisable()

	if slot0.mail_ui then
		slot0.mail_ui:SetEnabled(false)
	end

	if slot0.friend_ui then
		slot0.friend_ui:SetEnabled(false)
	end

	slot0:addClock(true)

	if GuideController:getInstance():isInGuide() == false then
		MainuiController:getInstance():setMainUIChatBubbleStatus(true)
	end

	uv0:openChatUITimer(true)
end

function ChatWindow.clearChatList(slot0)
	if not slot0.channelList then
		slot0.channelList = {}
	end

	for slot4, slot5 in pairs(slot0.channelList) do
		if slot4 ~= ChatConst.Channel.Friend then
			slot5:reset()
		end
	end
end

function ChatWindow.isOpen(slot0)
	return slot0.is_open
end

function ChatWindow.showCoseList(slot0, slot1)
	if not slot0.channelList then
		slot0.channelList = {}
	end

	if slot0:isChatChannel(slot1) then
		for slot5, slot6 in pairs(slot0.channelList) do
			if slot5 ~= ChatConst.Channel.Friend then
				if slot6 then
					slot6:showNewMessage(false)
					slot6:setVisible(false)
				end
			elseif slot6 then
				slot6:setVisibleStatus(false)
			end
		end

		slot5 = slot0.bg1:getContentSize()

		if not slot0.channelList[slot1] then
			if slot1 ~= ChatConst.Channel.Friend then
				slot2 = NewCoseList.new(slot0.container_size, slot0.bg1)

				slot2:setPosition(cc.p(20, 123))
				slot0.bg1:addChild(slot2, 22)
			else
				uv0:openPrivatePanel(true, nil, slot0.bg2)

				slot2 = uv0:getChatPanel()
			end

			slot0.channelList[slot1] = slot2
		elseif slot1 ~= ChatConst.Channel.Friend then
			slot2:SetEnabled(true)
		end

		if slot1 ~= ChatConst.Channel.Friend then
			if uv0.stack_list == nil then
				return
			end

			delayRun(slot0.bg1, 1 / display.DEFAULT_FPS, function ()
				if uv0.channelList and uv0.channel and uv0.channelList[uv0.channel] and uv0.channelList[uv0.channel].createMsg then
					uv0.channelList[uv0.channel]:createMsg(uv1.stack_list[uv0.channel], uv0.channel)
				end
			end)
		else
			slot0.channelList[slot0.channel]:setVisibleStatus(true)
			slot0.channelList[slot0.channel]:updateData(slot0.select_srv_id, slot0.select_rid)
		end
	end
end

function ChatWindow.updateCoseList(slot0, slot1, slot2)
	if not slot0.channelList then
		return
	end

	if slot0:isChatChannel(slot0.channel) and slot0.channel == slot1 then
		slot3 = slot0.channelList[slot0.channel]

		if slot0.channel ~= ChatConst.Channel.Friend then
			if slot3 and slot3:isSame(slot0.channel) then
				slot3:SetEnabled(true)
				slot3:initData(uv0.stack_list[slot0.channel])
				slot3:updateMsg(slot2)
			end
		elseif slot3:getCostList() and slot4:isSame(slot0.channel) then
			slot4:SetEnabled(true)
			slot4:initData(uv0.stack_list[slot0.channel])
			slot4:updateMsg()
		end
	end
end

function ChatWindow.adjustPosAfterTranslate(slot0)
	if slot0.channelList then
		for slot4, slot5 in pairs(slot0.channelList) do
			if slot4 ~= ChatConst.Channel.Friend then
				slot5:adjustItemPos()
			elseif slot0:getCostList(slot4) and slot6.adjustItemPos then
				slot6:adjustItemPos()
			end
		end
	end
end

function ChatWindow.setCoseListDisable(slot0)
	if slot0.channelList then
		for slot4, slot5 in pairs(slot0.channelList) do
			if slot4 ~= ChatConst.Channel.Friend then
				slot5:SetEnabled(false)
			else
				slot5:setVisibleStatus(false)
			end
		end
	end
end

function ChatWindow.getCostList(slot0, slot1)
	if slot0.channelList then
		if slot1 ~= ChatConst.Channel.Friend then
			return slot0.channelList[slot1]
		else
			return slot0.channelList[slot1]
		end
	end
end

function ChatWindow.clearAllChatMsg(slot0)
	if slot0.channelList then
		for slot4, slot5 in pairs(slot0.channelList) do
			if slot4 ~= ChatConst.Channel.Friend then
				slot5:reset()
			end
		end
	end
end

function ChatWindow.isChatChannel(slot0, slot1)
	if slot1 == ChatConst.Channel.Gang or slot1 == ChatConst.Channel.World or slot1 == ChatConst.Channel.Notice or slot1 == ChatConst.Channel.Friend or slot1 == ChatConst.Channel.Province or slot1 == ChatConst.Channel.Cross then
		return true
	end

	return false
end

function ChatWindow.isShowFiltBtn(slot0, slot1)
	if FILTER_CHARGE then
		return false
	end

	if slot1 == ChatConst.Channel.World or slot1 == ChatConst.Channel.Gang or slot1 == ChatConst.Channel.Cross then
		return true
	end

	return false
end

function ChatWindow.addClock(slot0, slot1)
	if slot0.clock_id then
		GlobalTimeTicket:getInstance():remove(slot0.clock_id)

		slot0.clock_id = nil
	end

	if slot1 then
		slot2 = nil
		slot3 = 0
		slot4 = {
			[50.0] = "mail",
			[40.0] = "friend",
			[10] = ChatConst.Channel.Gang,
			[30] = ChatConst.Channel.World
		}
		slot0.clock_id = GlobalTimeTicket:getInstance():add(function ()
			uv0 = uv0 + 1
			uv1 = uv2[uv0]

			if uv1 and uv3:getCostList(uv1) then
				slot0:reset()
			end
		end, 1, 61)
	end
end
