GuildApplyWindow = GuildApplyWindow or BaseClass(BaseView)
slot0 = GuildController:getInstance()
slot1 = GuildController:getInstance():getModel()
slot2 = string.format

function GuildApplyWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Big
	slot0.title_str = TI18N("申请列表")
end

function GuildApplyWindow.open_callback(slot0)
	slot1 = createCSBNote(PathTool.getTargetCSB("guild/guild_apply_window"))

	slot0.container:addChild(slot1)
	slot1:getChildByName("Text_1"):setString(TI18N("可通过点击列表中玩家的头像查看玩家信息哦"))

	slot0.item_gods = slot1:getChildByName("item_gods")
	slot0.empty_tips = slot1:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("desc"):setString(TI18N("当前没有申请列表"))
end

function GuildApplyWindow.register_event(slot0)
	if slot0.update_apply_event == nil then
		slot0.update_apply_event = GlobalEvent:getInstance():Bind(GuildEvent.UpdateApplyListInfo, function ()
			uv0:updateApplyList()
		end)
	end
end

function GuildApplyWindow.openRootWnd(slot0)
	uv0:requestGuildApplyList()
	uv1:clearApplyRedStatus()
end

function GuildApplyWindow.updateApplyList(slot0)
	if next(uv0:getGuildApplyList()) == nil then
		slot0.empty_tips:setVisible(true)

		if slot0.scroll_view then
			slot0.scroll_view:setVisible(false)
		end
	else
		slot0.empty_tips:setVisible(false)

		if slot0.scroll_view == nil then
			slot0.scroll_view = CommonScrollViewLayout.new(slot0.item_gods, cc.p(0, 5), nil, nil, slot0.item_gods:getContentSize(), {
				start_y = 0,
				item_width = 600,
				start_x = 4,
				space_x = 0,
				row = 0,
				item_height = 135,
				space_y = -3,
				col = 1,
				item_class = GuildApplyItem
			})
		end

		slot0.scroll_view:setData(slot1)
	end
end

function GuildApplyWindow.close_callback(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	if slot0.update_apply_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_apply_event)

		slot0.update_apply_event = nil
	end

	uv0:openGuildApplyWindow(false)
end

GuildApplyItem = class("GuildApplyItem", function ()
	return ccui.Layout:create()
end)

function GuildApplyItem.ctor(slot0)
	slot0.awards_list = {}
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guild/guild_apply_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot0.cancel_btn = slot1:getChildByName("cancel_btn")
	slot0.role_name = slot1:getChildByName("role_name")
	slot0.role_online = slot1:getChildByName("role_online")

	slot0.confirm_btn:getChildByName("label"):setString(TI18N("接受"))
	slot0.cancel_btn:getChildByName("label"):setString(TI18N("忽略"))

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(70, 63)
	slot1:addChild(slot0.role_head)
	slot0.role_head:setLev(99)
	slot0:registerEvent()
end

function GuildApplyItem.registerEvent(slot0)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data ~= nil then
				uv1:requestOperationApply(1, uv0.data.rid, uv0.data.srv_id)
			end
		end
	end)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data ~= nil then
				uv1:requestOperationApply(2, uv0.data.rid, uv0.data.srv_id)
			end
		end
	end)
	slot0.role_head:addCallBack(function ()
		if uv0.data ~= nil then
			FriendController:getInstance():openFriendCheckPanel(true, {
				srv_id = uv0.data.srv_id,
				rid = uv0.data.rid
			})
		end
	end, false)
end

function GuildApplyItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function GuildApplyItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1 ~= nil then
		if slot1.is_online == TRUE then
			slot0.role_online:setString(TI18N("在线"))
		else
			slot0.role_online:setTextColor(Config.ColorData.data_color4[183])
			slot0.role_online:setString(TI18N("离线"))
		end

		slot0.role_name:setString(slot1.name)
		slot0.role_head:setHeadRes(slot1.face, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
		slot0.role_head:setLev(slot1.lev)
	end
end

function GuildApplyItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
