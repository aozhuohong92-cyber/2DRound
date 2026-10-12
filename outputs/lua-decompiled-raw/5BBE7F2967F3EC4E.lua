FriendApplyPanel = class("FriendApplyPanel", function ()
	return ccui.Widget:create()
end)

function FriendApplyPanel.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function FriendApplyPanel.config(slot0)
	slot0.ctrl = FriendController:getInstance()
	slot0.size = cc.size(720, 800)

	slot0:setContentSize(slot0.size)

	slot0.item_list = {}
end

function FriendApplyPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("friend/friend_apply_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.num_label = createRichLabel(24, cc.c4b(144, 93, 56, 255), cc.p(0, 0), cc.p(515, 12), 0, 0, 400)

	slot0.main_panel:addChild(slot0.num_label)
end

function FriendApplyPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
end

function FriendApplyPanel.setApplyNum(slot0, slot1)
	slot0.num_label:setString(string.format(TI18N("申请数：%s/%s"), slot1 or 0, 99))
end

function FriendApplyPanel.registerEvents(slot0)
end

function FriendApplyPanel.setCallFun(slot0, slot1)
	slot0.call_fun = slot1
end

function FriendApplyPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function FriendApplyPanel.DeleteMe(slot0)
end
