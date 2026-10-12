FillView = class("FillView", function ()
	return ccui.Widget:create()
end)

function FillView.ctor(slot0)
	slot0.size = cc.size(SCREEN_WIDTH, SCREEN_HEIGHT)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(0.5, 0.5)

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("login/login_fill_view"))

	slot0:addChild(slot0.root_wnd)

	slot0.left_panel = slot0.root_wnd:getChildByName("left_panel")
	slot0.right_panel = slot0.root_wnd:getChildByName("right_panel")
	slot1 = (display.width - SCREEN_WIDTH) * 0.5

	if needMourning() then
		setChildUnEnabled(true, slot0.left_panel, cc.c4b(255, 255, 255, 255))
		setChildUnEnabled(true, slot0.right_panel, cc.c4b(255, 255, 255, 255))
	end

	slot0.left_panel:setContentSize(cc.size(slot1, display.height))
	slot0.right_panel:setContentSize(cc.size(slot1, display.height))
end
