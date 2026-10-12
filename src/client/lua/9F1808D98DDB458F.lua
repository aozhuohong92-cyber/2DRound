FriendListPanel = class("FriendListPanel", function ()
	return ccui.Widget:create()
end)
slot0 = FriendController:getInstance():getModel()

function FriendListPanel.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function FriendListPanel.config(slot0)
	slot0.ctrl = FriendController:getInstance()
	slot0.size = cc.size(720, 800)

	slot0:setContentSize(slot0.size)

	slot0.item_list = {}
	slot0.is_del = false
end

function FriendListPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("friend/firend_list_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.cost_panel = slot0.main_panel:getChildByName("cost_panel")

	slot0.cost_panel:setTouchEnabled(true)

	slot0.friend_point = slot0.cost_panel:getChildByName("num_label")
	slot0.btn_del = slot0.main_panel:getChildByName("btn_del")

	slot0.btn_del:setTitleText(TI18N("删除好友"))
	slot0.btn_del:getTitleRenderer():enableOutline(Config.ColorData.data_color4[278], 2)

	slot0.btn_add = slot0.main_panel:getChildByName("btn_add")

	slot0.btn_add:setTitleText(TI18N("添加好友"))
	slot0.btn_add:getTitleRenderer():enableOutline(Config.ColorData.data_color4[278], 2)

	slot0.btn_send = slot0.main_panel:getChildByName("btn_send")

	slot0.btn_send:setTitleText(TI18N("一键赠送"))
	slot0.btn_send:getTitleRenderer():enableOutline(Config.ColorData.data_color4[277], 2)

	slot0.num_label = createRichLabel(24, cc.c4b(144, 93, 56, 255), cc.p(0, 0), cc.p(495, 100), 0, 0, 400)

	slot0.main_panel:addChild(slot0.num_label)
end

function FriendListPanel.setData(slot0, slot1)
	slot0.data = slot1
	slot2, slot3 = slot0.ctrl:getModel():getFriendOnlineAndTotal()

	slot0.num_label:setString(string.format(TI18N("好友数：%s/%s"), slot3, 100))
	slot0:setFriendPoint()
end

function FriendListPanel.registerEvents(slot0)
	slot0.btn_del:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:clickDelBtn()
		end
	end)
	slot0.btn_add:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0.ctrl:openFriendFindWindow(true)
		end
	end)
	slot0.cost_panel:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			TipsManager:getInstance():showCommonTips(TI18N("1、友情点通过好友赠送获得，每人每日最多可赠送10次，领取30次\n" .. "2、超过领取次数后继续领取只获得贝里 \n" .. "3、向好友赠送友情点后自身也将获得贝里"), cc.p(35, 355))
		end
	end)
	slot0.btn_send:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if uv0.data == nil then
				return
			end

			playButtonSound2()
			uv0:onKeySend()
		end
	end)
end

function FriendListPanel.clickDelBtn(slot0)
	slot0.is_del = not slot0.is_del

	if slot0.call_fun then
		slot0:call_fun(slot0.is_del)
	end

	slot1 = TI18N("删除好友")

	if slot0.is_del == true then
		slot1 = TI18N("取消删除")
	end

	slot0.btn_del:setTitleText(slot1)
end

function FriendListPanel.onKeySend(slot0)
	if (uv0:getFriendPresentCount() or 10) == 0 then
		message(TI18N("今日赠送友情点已达上限!"))

		return
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot0.data) do
		if slot7 and slot7.is_present == 0 then
			table.insert(slot2, {
				rid = slot7.rid,
				srv_id = slot7.srv_id
			})
		end

		if slot1 <= #slot2 then
			break
		end
	end

	slot0.ctrl:sender_13317(0, slot2)
end

function FriendListPanel.setCallFun(slot0, slot1)
	slot0.call_fun = slot1
end

function FriendListPanel.setFriendPoint(slot0)
	slot0.friend_point:setString(RoleController:getInstance():getRoleVo().friend_point or 0)
end

function FriendListPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 == false then
		slot0.is_del = false

		slot0.btn_del:setTitleText(TI18N("删除好友"))
	end
end

function FriendListPanel.DeleteMe(slot0)
end
