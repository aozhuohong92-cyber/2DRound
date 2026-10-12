RoleUpgradeMainWindow = RoleUpgradeMainWindow or BaseClass(BaseView)
slot0 = RoleController:getInstance()

function RoleUpgradeMainWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.layout_name = "roleinfo/role_upgrade_main_window"
	slot0.off_space = 8
end

function RoleUpgradeMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setContentSize(cc.size(SCREEN_WIDTH, display.height))
	slot0.background:setSwallowTouches(false)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.scrollview = slot0.container:getChildByName("scrollview")
	slot0.scrollview_size = slot0.scrollview:getContentSize()

	slot0.scrollview:setScrollBarEnabled(false)
end

function RoleUpgradeMainWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:openRoleUpgradeMainWindow(false)
		end
	end)
end

function RoleUpgradeMainWindow.openRootWnd(slot0, slot1)
	slot2 = slot0.root_wnd:convertToNodeSpace(slot1)

	slot0.container:setPosition(slot2.x + 144, slot2.y + 75)

	slot3 = 4
	slot8 = cc.size

	slot0.scrollview:setInnerContainerSize(slot8(slot0.scrollview_size.width, math.max(slot3 * 62 + (slot3 - 1) * slot0.off_space, slot0.scrollview_size.height)))

	for slot8 = 1, slot3 do
		slot9 = RoleUpgradeItem.new()

		slot9:setPosition(slot0.scrollview_size.width * 0.5, slot4 - 31 - (slot8 - 1) * (62 + slot0.off_space))
		slot0.scrollview:addChild(slot9)
	end
end

function RoleUpgradeMainWindow.close_callback(slot0)
	uv0:openRoleUpgradeMainWindow(false)
end

RoleUpgradeItem = class("RoleUpgradeItem", function ()
	return ccui.Layout:create()
end)

function RoleUpgradeItem.ctor(slot0)
	slot0.size = cc.size(218, 62)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:setTouchEnabled(true)

	slot0.background = createSprite(PathTool.getResFrame("roleinfo", "roleinfo_1"), 109, 31, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot0.close_btn = createImage(slot0, PathTool.getResFrame("roleinfo", "roleinfo_2"), 192, 31, cc.p(0.5, 0.5), true)

	slot0.close_btn:setTouchEnabled(true)
	slot0:registerEvent()
end

function RoleUpgradeItem.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			-- Nothing
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			-- Nothing
		end
	end)
end

function RoleUpgradeItem.setData(slot0, slot1)
end

function RoleUpgradeItem.DeleteMe(slot0)
end
