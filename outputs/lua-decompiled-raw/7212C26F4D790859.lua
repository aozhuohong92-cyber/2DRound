FriendAddWindow = FriendAddWindow or BaseClass(BaseView)

function FriendAddWindow.__init(slot0)
	slot0.ctrl = FriendController:getInstance()
	slot0.is_full_screen = false
	slot0.title_str = TI18N("添加好友")
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
	slot0.win_type = WinType.Big
	slot0.scroll_width = 620
	slot0.scroll_height = 570
	slot0.create_index = 1
	slot0.rend_list = Array.New()
	slot0.cache_list = {}
	slot0.is_init = true
	slot0.default_msg = TI18N("请输入玩家姓名")
end

function FriendAddWindow.open_callback(slot0)
	slot2 = cc.CSLoader:createNode(PathTool.getTargetCSB("friend/friend_find_panel"))

	slot0.container:addChild(slot2)

	slot0.main_panel = slot2:getChildByName("main_panel")
	slot0.top_panel = slot0.main_panel:getChildByName("top_panel")
	slot0.recommend_label = slot0.top_panel:getChildByName("recommend_label")

	slot0.recommend_label:setString(TI18N("推荐好友"))

	slot0.find_btn = slot0.top_panel:getChildByName("find_btn")

	slot0.find_btn:setTitleText(TI18N("查找"))
	slot0.find_btn:getTitleRenderer():enableOutline(Config.ColorData.data_color4[278], 2)

	slot0.flash_btn = slot0.main_panel:getChildByName("flash_btn")

	slot0.flash_btn:setTitleText(TI18N("刷新"))
	slot0.flash_btn:getTitleRenderer():enableOutline(Config.ColorData.data_color4[278], 2)

	slot0.edit_box = createEditBox(slot0.main_panel, PathTool.getResFrame("common", "common_1021"), cc.size(453, 52), nil, 24, Config.ColorData.data_color3[151], 20, slot0.default_msg, nil, , LOADTEXT_TYPE_PLIST, nil, )

	slot0.edit_box:setAnchorPoint(cc.p(0, 0))
	slot0.edit_box:setPlaceholderFontColor(Config.ColorData.data_color4[151])
	slot0.edit_box:setFontColor(Config.ColorData.data_color4[66])
	slot0.edit_box:setPosition(cc.p(25, 730))
	slot0.edit_box:setMaxLength(14)

	if not tolua.isnull(slot0.edit_box) then
		slot0.edit_box:registerScriptEditBoxHandler(function (slot0, slot1)
			if slot0 == "return" then
				if GmCmd and GmCmd.show_from_chat and GmCmd:show_from_chat(slot1:getText()) then
					return
				end
			end
		end)
	end

	slot0.scroll_view = createScrollView(slot0.scroll_width, slot0.scroll_height, slot0.container:getContentSize().width / 2, 98, slot0.main_panel, ccui.ScrollViewDir.vertical)

	slot0.scroll_view:setLocalZOrder(10)
	slot0.scroll_view:setAnchorPoint(cc.p(0.5, 0))

	slot0.num_label = createRichLabel(24, cc.c4b(144, 93, 56, 255), cc.p(0, 0), cc.p(89, 28), 0, 0, 400)

	slot0.main_panel:addChild(slot0.num_label)

	slot9, slot10 = slot0.ctrl:getModel():getFriendOnlineAndTotal()

	slot0.num_label:setString(string.format(TI18N("好友数：%s/%s"), slot10, 100))
end

function FriendAddWindow.register_event(slot0)
	if not slot0.apply_list_event then
		slot0.apply_list_event = GlobalEvent:getInstance():Bind(FriendEvent.UD_COMMEND_LIST, function (slot0)
			uv0:updateFriendList(slot0)
		end)
	end

	if not slot0.find_friend_event then
		slot0.find_friend_event = GlobalEvent:getInstance():Bind(FriendEvent.FRIEND_QUERY_RESULT, function (slot0)
			uv0.recommend_label:setString(TI18N("搜索结果"))
			uv0:updateFriendList(slot0)
		end)
	end

	slot0.flash_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0.ctrl:recommend()
			uv0.recommend_label:setString(TI18N("推荐好友"))
		end
	end)
	slot0.find_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if (uv0.edit_box:getText() or "") == "" then
				message(uv0.default_msg)

				return
			end

			uv0.ctrl:queryFind(slot2)
		end
	end)
	slot0.ctrl:recommend()
end

function FriendAddWindow.showEmptyIcon(slot0, slot1)
	if not slot0.empty_con and slot1 == false then
		return
	end

	if not slot0.empty_con then
		slot2 = cc.size(200, 200)
		slot0.empty_con = ccui.Widget:create()

		slot0.empty_con:setContentSize(slot2)
		slot0.empty_con:setPosition(cc.p(335, 370))
		slot0.container:addChild(slot0.empty_con, 100)

		slot3 = createImage(slot0.empty_con, slot0.empty_res, slot2.width / 2, slot2.height / 2, cc.p(0.5, 0.5), false)
		slot0.empty_label = createLabel(24, cc.c4b(248, 194, 60, 255), nil, slot2.width / 2, -10, "", slot0.empty_con, 0, cc.p(0.5, 0))
	end

	slot0.empty_label:setString(TI18N("未搜索到玩家"))
	slot0.empty_con:setVisible(slot1)
end

function FriendAddWindow.openRootWnd(slot0, slot1)
	slot1 = slot1 or FriendConst.Type.MyFriend
end

function FriendAddWindow.updateFriendList(slot0, slot1)
	for slot5, slot6 in pairs(slot0.cache_list) do
		slot6:setVisible(false)
	end

	slot0.create_index = 1
	slot2 = Array.New()

	for slot6, slot7 in pairs(slot1) do
		slot2:PushBack(slot7)
	end

	slot0.rend_list = slot2 or Array.New()

	slot0:showEmptyIcon(false)

	if slot2:GetSize() <= 0 then
		slot0:showEmptyIcon(true)

		return
	end

	if slot0.is_init == true then
		slot0:setscheduleUpdate(true)

		slot0.is_init = false
	else
		slot6 = slot2

		for slot6 = 1, slot2.GetSize(slot6) do
			slot0:createItem(slot2:Get(slot6 - 1))
		end
	end
end

function FriendAddWindow.setscheduleUpdate(slot0, slot1)
	if slot1 == true then
		if slot0.queue_timer == nil then
			slot0.queue_timer = GlobalTimeTicket:getInstance():add(function ()
				if uv0.rend_list:Get(uv0.create_index - 1) then
					uv0:createItem(slot0)
				end

				if uv0.create_index >= uv0.rend_list:GetSize() + 1 then
					uv0:setscheduleUpdate(false)
				end
			end, 1 / display.DEFAULT_FPS)
		end
	elseif slot0.queue_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.queue_timer)

		slot0.queue_timer = nil
	end
end

function FriendAddWindow.createItem(slot0, slot1)
	slot2 = nil

	if slot0.cache_list[slot0.create_index] == nil then
		slot2 = FriendListItem.new(slot0.create_index, 5)
		slot0.cache_list[slot0.create_index] = slot2

		slot0.scroll_view:addChild(slot2)
	end

	slot2 = slot0.cache_list[slot0.create_index]

	slot2:setPosition(cc.p(slot0.scroll_view:getContentSize().width / 2, slot0.scroll_height - 120 * slot0.create_index))
	slot2:setVisible(true)
	slot2:setExtendData(5)
	slot2:setData(slot1)

	slot0.create_index = slot0.create_index + 1
end

function FriendAddWindow.setPanelData(slot0)
end

function FriendAddWindow.close_callback(slot0)
	slot0.ctrl:openFriendFindWindow(false)

	slot4 = false

	slot0:setscheduleUpdate(slot4)

	for slot4, slot5 in pairs(slot0.cache_list) do
		if slot5 and slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.cache_list = nil

	if slot0.apply_list_event then
		GlobalEvent:getInstance():UnBind(slot0.apply_list_event)

		slot0.apply_list_event = nil
	end

	if slot0.find_friend_event then
		GlobalEvent:getInstance():UnBind(slot0.find_friend_event)

		slot0.find_friend_event = nil
	end
end
