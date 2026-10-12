InviteCodeFriendPanel = class("InviteCodeFriendPanel", function ()
	return ccui.Widget:create()
end)
slot0 = InviteCodeController:getInstance()
slot1 = string.format

function InviteCodeFriendPanel.ctor(slot0)
	slot0:layoutUI()
	slot0:registerEvents()
end

function InviteCodeFriendPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("invitecode/invitecode_friend_panel"))

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(720, 640))

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 690,
		start_x = 16,
		space_x = 0,
		row = 0,
		item_height = 117,
		space_y = 3,
		col = 1,
		need_dynamic = true,
		item_class = InviteCodeFriendItem
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.empty_bg = slot1:getChildByName("empty_bg")

	slot0.empty_bg:setVisible(false)
	slot0.empty_bg:getChildByName("Text_2"):setString(TI18N("暂无邀请的用户，赶快去邀请吧~"))
	slot0:setFriendList()
end

function InviteCodeFriendPanel.setFriendList(slot0)
	if slot0.item_scrollview then
		if #uv0:getModel():getAlreadyFriendData() == 0 then
			slot0.empty_bg:setVisible(true)
			loadSpriteTexture(slot0.empty_bg, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), LOADTEXT_TYPE)
		else
			slot0.empty_bg:setVisible(false)
			slot0.item_scrollview:setData(slot1)
		end
	end
end

function InviteCodeFriendPanel.registerEvents(slot0)
	if not slot0.bind_updata_event then
		slot0.bind_updata_event = GlobalEvent:getInstance():Bind(InviteCodeEvent.InviteCode_BindRole_Updata_Event, function ()
			if uv0.empty_bg then
				uv0.empty_bg:setVisible(false)
			end

			if uv0.item_scrollview then
				uv0.item_scrollview:resetAddPosition(uv1:getModel():getAlreadyFriendData())
			end
		end)
	end
end

function InviteCodeFriendPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function InviteCodeFriendPanel.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	if slot0.bind_updata_event then
		GlobalEvent:getInstance():UnBind(slot0.bind_updata_event)

		slot0.bind_updata_event = nil
	end
end

InviteCodeFriendItem = class("InviteCodeFriendItem", function ()
	return ccui.Widget:create()
end)

function InviteCodeFriendItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function InviteCodeFriendItem.configUI(slot0)
	slot0.rootWnd = createCSBNote(PathTool.getTargetCSB("invitecode/invitecode_friend_item"))

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:addChild(slot0.rootWnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(690, 117))

	slot1 = slot0.rootWnd:getChildByName("main_container")
	slot0.btn_chat = slot1:getChildByName("btn_chat")

	slot1:getChildByName("Text_2"):setString(TI18N("战力："))

	slot0.power_text = slot1:getChildByName("power_text")

	slot0.power_text:setString("0")

	slot0.name_text = slot1:getChildByName("name_text")

	slot0.name_text:setString("")

	slot0.play_head = PlayerHead.new(PlayerHead.type.circle)

	slot1:addChild(slot0.play_head)
	slot0.play_head:setPosition(cc.p(67, 62))
	slot0.play_head:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.play_head:setTouchEnabled(true)

	slot0.vip_num = CommonNum.new(19, slot1, 1, 1, cc.p(0, 0))

	slot0.vip_num:setPosition(162, 87)
end

function InviteCodeFriendItem.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.data = slot1

	slot0.vip_num:setNum(slot1.vip or 0)
	slot0.play_head:setHeadRes(slot1.face or slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
	slot0.play_head:setLev(slot1.lev)
	slot0.power_text:setString(slot1.power)

	slot4 = "跨服"

	if RoleController:getInstance():isTheSameSvr(slot1.srv_id) == true then
		slot4 = "本服"
	end

	slot5 = ""

	if slot1.is_return == 1 then
		slot5 = "( 回归 )"
	end

	slot0.name_text:setString(uv0(TI18N("[%s]%s  %s"), slot4, slot1.name, slot5))
end

function InviteCodeFriendItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_chat, function ()
		if uv0.data then
			ChatController:getInstance():openChatPanel(ChatConst.Channel.Friend, "friend", {
				rid = uv0.data.rid,
				srv_id = uv0.data.srv_id
			})
		end
	end, true, 1)
	registerButtonEventListener(slot0.play_head, function (slot0, slot1, slot2)
		if uv0.data then
			slot4 = cc.p(slot1:getTouchEndPosition().x + 320, slot1:getTouchEndPosition().y)
			slot6 = uv0.data.srv_id

			if RoleController:getInstance():getRoleVo().rid == uv0.data.rid and slot3.srv_id == slot6 then
				return
			end

			ChatController:getInstance():openFriendInfo({
				rid = slot5,
				srv_id = slot6
			}, slot4)
		end
	end, true, 1)
end

function InviteCodeFriendItem.DeleteMe(slot0)
	if slot0.play_head then
		slot0.play_head:DeleteMe()

		slot0.play_head = nil
	end

	if slot0.vip_num then
		slot0.vip_num:DeleteMe()

		slot0.vip_num = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
