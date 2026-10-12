slot1 = ReturnActionController:getInstance():getModel()
slot2 = string.format
ReturnActionRedbagItem = class("ReturnActionRedbagItem", function ()
	return ccui.Widget:create()
end)

function ReturnActionRedbagItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ReturnActionRedbagItem.configUI(slot0)
	slot0.size = cc.size(239, 328)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("returnaction/returnaction_redbag_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("main_container")

	slot2:setSwallowTouches(false)

	slot0.main_container = slot2
	slot0.wish_txt = slot2:getChildByName("wish_txt")

	slot0.wish_txt:setVisible(false)

	slot0.got_mask = slot2:getChildByName("got_mask")
	slot0.name_txt = createRichLabel(20, cc.c4b(255, 75, 82, 255), cc.p(0.5, 0.5), cc.p(119.5, 30))

	slot2:addChild(slot0.name_txt)
end

function ReturnActionRedbagItem.register_event(slot0)
	registerButtonEventListener(slot0.main_container, handler(slot0, slot0.onClickItem), true, 1, nil, , , true)
end

function ReturnActionRedbagItem.addClickCallBack(slot0, slot1)
	slot0.callback = slot1
end

function ReturnActionRedbagItem.onClickItem(slot0)
	if not slot0.data then
		return
	end

	if slot0.callback then
		slot0.callback(slot0.data.red_packet_id, slot0.data.status)
	end
end

function ReturnActionRedbagItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot1.name then
		slot0.name_txt:setString(uv0(TI18N("来自<div fontcolor=edd05d>%s</div>"), slot1.name))
	end

	slot0.got_mask:setVisible(slot1.status == 2)
end

function ReturnActionRedbagItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
