InviteCodeReturnFriendPanel = class("InviteCodeReturnFriendPanel", function ()
	return ccui.Widget:create()
end)
slot1 = InviteCodeController:getInstance():getModel()
slot2 = string.format

function InviteCodeReturnFriendPanel.ctor(slot0)
	slot0.is_init = true

	slot0:layoutUI()
	slot0:registerEvents()
end

function InviteCodeReturnFriendPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("invitecode/invitecode_my_panel"))

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(720, 640))

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 690,
		start_x = 16,
		space_x = 0,
		row = 0,
		item_height = 147,
		space_y = 3,
		col = 1,
		need_dynamic = true,
		item_class = InviteCodeReturnFriendItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
	uv0:setFriendReturnData()
	slot0:getTeskData()
end

function InviteCodeReturnFriendPanel.registerEvents(slot0)
	if not slot0.return_friend_event then
		slot0.return_friend_event = GlobalEvent:getInstance():Bind(InviteCodeEvent.Return_InviteCode_Event, function ()
			uv0:getTeskData()
		end)
	end
end

function InviteCodeReturnFriendPanel.getTeskData(slot0)
	if uv0:getFriendReturnData() then
		for slot5, slot6 in pairs(slot1) do
			slot6.status = 0
			slot6.value = 0

			if uv0:getReturnReawrdList(slot6.id) then
				if slot7.had <= slot7.num then
					if slot7.num == slot7.had and slot7.num < slot6.num then
						slot6.status = 0

						if slot7.num == slot7.had then
							slot6.status = 4
						end
					elseif slot7.num == slot7.had and slot7.num == slot6.num then
						slot6.status = 2
					else
						slot6.status = 1
					end
				end

				slot6.value = slot7.num
			end
		end

		uv0:setSortItem(slot1)

		if slot0.is_init == true then
			slot0.is_init = false

			slot0.item_scrollview:setData(slot1)
		else
			slot0.item_scrollview:resetAddPosition(slot1)
		end
	end
end

function InviteCodeReturnFriendPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function InviteCodeReturnFriendPanel.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	if slot0.return_friend_event then
		GlobalEvent:getInstance():UnBind(slot0.return_friend_event)

		slot0.return_friend_event = nil
	end

	if slot0.updata_return_friend_event then
		GlobalEvent:getInstance():UnBind(slot0.updata_return_friend_event)

		slot0.updata_return_friend_event = nil
	end
end

InviteCodeReturnFriendItem = class("InviteCodeReturnFriendItem", function ()
	return ccui.Widget:create()
end)

function InviteCodeReturnFriendItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function InviteCodeReturnFriendItem.configUI(slot0)
	slot0.rootWnd = createCSBNote(PathTool.getTargetCSB("invitecode/invitecode_my_item"))

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:addChild(slot0.rootWnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(690, 147))

	slot1 = slot0.rootWnd:getChildByName("main_container")
	slot0.btn_get = slot1:getChildByName("btn_get")

	slot0.btn_get:setVisible(false)
	slot0.btn_get:getChildByName("Text_1"):setString(TI18N("领取"))

	slot0.btn_goto = slot1:getChildByName("btn_goto")

	slot0.btn_goto:setVisible(false)
	slot0.btn_goto:getChildByName("Text_1"):setString(TI18N("未达成"))

	slot0.has_spr = slot1:getChildByName("has_spr")

	slot0.has_spr:setVisible(false)

	slot0.tesk_num = slot1:getChildByName("tesk_num")

	slot0.tesk_num:setString("")

	slot0.title_name = slot1:getChildByName("title_name")

	slot0.title_name:setString("")

	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 3,
		start_x = 0,
		need_dynamic = true,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function InviteCodeReturnFriendItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.title_name:setString(slot1.desc)
	slot0.tesk_num:setString(uv0("(%d/%d)", slot1.value, slot1.num))
	slot0.btn_goto:setVisible(slot1.status == 0)
	slot0.btn_get:setVisible(slot1.status == 1)
	slot0.has_spr:setVisible(slot1.status == 2 or slot1.status == 4)

	slot3 = {}

	for slot7, slot8 in pairs(slot1.items) do
		table.insert(slot3, {
			bid = slot8[1],
			quantity = slot8[2]
		})
	end

	if #slot3 > 5 then
		slot0.item_scrollview:setClickEnabled(true)
	else
		slot0.item_scrollview:setClickEnabled(false)
	end

	slot0.item_scrollview:setData(slot3)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
end

function InviteCodeReturnFriendItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data and uv0.data.id then
			uv1:sender19812(uv0.data.id)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		message(TI18N("您邀请的用户还未达成目标哦~~~"))
	end, true, 1)
end

function InviteCodeReturnFriendItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
