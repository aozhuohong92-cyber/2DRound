YuekaPanel = class("YuekaPanel", function ()
	return ccui.Widget:create()
end)
slot0 = WelfareController:getInstance()
slot1 = Config.ChargeData.data_constant
slot2 = string.format
slot3 = slot1.month_card1_sun.val
slot4 = slot1.month_card1_items.val[1][1]
slot5 = slot1.month_card1_items.val[1][2]
slot6 = slot1.month_card1_cont_day.val

function YuekaPanel.ctor(slot0)
	slot0.current_day = 0

	slot0:loadResources()
end

function YuekaPanel.loadResources(slot0)
	slot0:configUI()
	slot0:register_event()
end

function YuekaPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/sum_yueka_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setPosition(-40, -86)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.HonorYuekaPanel = HonorYuekaPanel.new()

	slot0.main_container:addChild(slot0.HonorYuekaPanel)

	slot0.SupreYuekaPanel = SupreYuekaPanel.new()

	slot0.main_container:addChild(slot0.SupreYuekaPanel)
end

function YuekaPanel.register_event(slot0)
end

function YuekaPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function YuekaPanel.DeleteMe(slot0)
	if slot0.HonorYuekaPanel and slot0.HonorYuekaPanel.DeleteMe then
		slot0.HonorYuekaPanel:DeleteMe()
	end

	slot0.HonorYuekaPanel = nil

	if slot0.SupreYuekaPanel and slot0.SupreYuekaPanel.DeleteMe then
		slot0.SupreYuekaPanel:DeleteMe()
	end

	slot0.SupreYuekaPanel = nil
end
