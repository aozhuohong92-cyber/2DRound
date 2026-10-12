FriendBlackPanel = class("FriendBlackPanel", function ()
	return ccui.Widget:create()
end)

function FriendBlackPanel.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function FriendBlackPanel.config(slot0)
	slot0.ctrl = FriendController:getInstance()
	slot0.size = cc.size(720, 800)

	slot0:setContentSize(slot0.size)

	slot0.item_list = {}
end

function FriendBlackPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("friend/friend_black_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.num_label = createRichLabel(24, cc.c4b(144, 93, 56, 255), cc.p(1, 0), cc.p(670, 12), 0, 0, 400)

	slot0.main_panel:addChild(slot0.num_label)
end

function FriendBlackPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2, slot3 = slot0.ctrl:getModel():getBlackListOnlineAndTotal()

	slot0.num_label:setString(string.format(TI18N("黑名单数：%s/%s"), slot3, 50))
end

function FriendBlackPanel.registerEvents(slot0)
end

function FriendBlackPanel.setCallFun(slot0, slot1)
	slot0.call_fun = slot1
end

function FriendBlackPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function FriendBlackPanel.DeleteMe(slot0)
end
