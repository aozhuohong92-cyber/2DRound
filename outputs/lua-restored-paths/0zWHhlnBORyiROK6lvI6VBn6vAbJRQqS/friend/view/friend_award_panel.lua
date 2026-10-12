FriendAwardPanel = class("FriendAwardPanel", function ()
	return ccui.Widget:create()
end)

function FriendAwardPanel.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function FriendAwardPanel.config(slot0)
	slot0.ctrl = FriendController:getInstance()
	slot0.size = cc.size(720, 800)

	slot0:setContentSize(slot0.size)

	slot0.item_list = {}
end

function FriendAwardPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("friend/friend_award_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.cost_panel = slot0.main_panel:getChildByName("cost_panel")
	slot0.friend_point = slot0.cost_panel:getChildByName("num_label")
	slot0.num_label = createRichLabel(24, cc.c4b(144, 93, 56, 255), cc.p(0, 0), cc.p(285, 27), 0, 0, 400)

	slot0.main_panel:addChild(slot0.num_label)

	slot0.btn_send = slot0.main_panel:getChildByName("btn_send")

	slot0.btn_send:setTitleText(TI18N("一键领取"))
	slot0.btn_send:getTitleRenderer():enableOutline(Config.ColorData.data_color4[264], 2)
end

function FriendAwardPanel.setData(slot0, slot1)
	slot0:setFriendPoint()

	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2 = 0

	if slot1 and next(slot1) then
		for slot6, slot7 in ipairs(slot1) do
			if slot7 and slot7.is_draw == 1 then
				slot2 = slot2 + 1
			end
		end
	end

	slot3, slot4 = slot0.ctrl:getModel():getFriendOnlineAndTotal()

	slot0.num_label:setString(string.format(TI18N("礼物数：%s"), slot2))
end

function FriendAwardPanel.registerEvents(slot0)
	slot0.btn_send:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			slot2 = {}
			slot3 = uv0.ctrl:getModel():getArray()
			slot7 = slot3

			for slot7 = 1, slot3.GetSize(slot7) do
				if slot3:Get(slot7 - 1) and slot8.is_draw == 1 then
					table.insert(slot2, {
						rid = slot8.rid,
						srv_id = slot8.srv_id
					})
				end
			end

			uv0.ctrl:sender_13317(1, slot2)
		end
	end)
	slot0.cost_panel:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			TipsManager:getInstance():showCommonTips(TI18N("1、友情点通过好友赠送获得，每人每日最多可赠送10次，领取30次\n" .. "2、超过领取次数后继续领取只获得贝里 \n" .. "3、向好友赠送友情点后自身也将获得贝里"), cc.p(35, 355))
		end
	end)
end

function FriendAwardPanel.setFriendPoint(slot0)
	slot0.friend_point:setString(RoleController:getInstance():getRoleVo().friend_point or 0)
end

function FriendAwardPanel.setCallFun(slot0, slot1)
	slot0.call_fun = slot1
end

function FriendAwardPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function FriendAwardPanel.DeleteMe(slot0)
end
