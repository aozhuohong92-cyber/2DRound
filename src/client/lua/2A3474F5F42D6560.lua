VipMainTabBtn = class("VipMainTabBtn", function ()
	return ccui.Widget:create()
end)

function VipMainTabBtn.ctor(slot0, slot1)
	slot0.callback = slot1

	slot0:configUI()
	slot0:register_event()
end

function VipMainTabBtn.configUI(slot0)
	slot0.size = cc.size(155, 130)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("vip/vip_tab_btn"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.tips = slot2:getChildByName("tab_tips")

	slot0.tips:setVisible(false)

	slot0.red_num = slot2:getChildByName("red_num")

	slot0.red_num:setVisible(false)

	slot0.select_bg = slot2:getChildByName("select_bg")

	slot0.select_bg:setVisible(false)

	slot0.unselect_bg = slot2:getChildByName("unselect_bg")
	slot0.title_label = slot2:getChildByName("title")
	slot0.title_img = slot2:getChildByName("title_img")

	slot0.title_img:setVisible(false)
	slot0.unselect_bg:ignoreContentAdaptWithSize(true)
	slot0.select_bg:ignoreContentAdaptWithSize(true)
end

function VipMainTabBtn.register_event(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playTabButtonSound()

			if uv0.tab_type and uv0.callback then
				uv0.callback(uv0.tab_type)
			end
		end
	end)
end

function VipMainTabBtn.setSelect(slot0, slot1)
	slot0.select_bg:setVisible(slot1)
	slot0.unselect_bg:setVisible(not slot1)
	slot0.title_img:setVisible(slot1)
	slot0.title_label:setVisible(not slot1)
end

function VipMainTabBtn.showRedTips(slot0, slot1, slot2)
	slot0.red_tips_status = slot1

	slot0.tips:setVisible(slot1)

	if slot2 and slot2 > 0 then
		slot0.red_num:setVisible(true)
		slot0.red_num:setString(slot2)
	else
		slot0.red_num:setVisible(false)
	end
end

function VipMainTabBtn.getRedTipsStatus(slot0)
	return slot0.red_tips_status
end

function VipMainTabBtn.setData(slot0, slot1)
	slot0.data = slot1 or {}
	slot0.tab_type = slot0.data.index

	slot0.title_label:setString(slot0.data.label)
	slot0.title_img:setString(slot0.data.label)
	slot0:setTouchEnabled(slot0.data.status)

	slot2, slot3 = nil

	if slot0.tab_type == VIPTABCONST.CHARGE then
		slot2 = PathTool.getResFrame("vip", "vip_tab10")
		slot3 = PathTool.getResFrame("vip", "vip_tab1")
	elseif slot0.tab_type == VIPTABCONST.ACC_CHARGE then
		slot2 = PathTool.getResFrame("vip", "vip_tab10")
		slot3 = PathTool.getResFrame("vip", "vip_tab1")
	elseif slot0.tab_type == VIPTABCONST.VIP then
		slot2 = PathTool.getResFrame("vip", "vip_tab30")
		slot3 = PathTool.getResFrame("vip", "vip_tab3")

		slot0.title_img:setScale(0.9)
	elseif slot0.tab_type == VIPTABCONST.DAILY_GIFT then
		slot2 = PathTool.getResFrame("vip", "vip_tab40")
		slot3 = PathTool.getResFrame("vip", "vip_tab4")
	elseif slot0.tab_type == VIPTABCONST.PRIVILEGE then
		slot2 = PathTool.getResFrame("vip", "vip_tab50")
		slot3 = PathTool.getResFrame("vip", "vip_tab5")
	elseif slot0.tab_type == VIPTABCONST.KLB then
		slot2 = PathTool.getResFrame("vip", "vip_tab60")
		slot3 = PathTool.getResFrame("vip", "vip_tab6")
	end

	if slot2 then
		slot0.unselect_bg:loadTexture(slot2, LOADTEXT_TYPE_PLIST)
	end

	if slot3 then
		slot0.select_bg:loadTexture(slot3, LOADTEXT_TYPE_PLIST)
	end
end

function VipMainTabBtn.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
