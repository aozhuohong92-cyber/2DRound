RefPanel = RefPanel or BaseClass(BaseView)

function RefPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "mainui/ref_panel"
	slot0.is_change_lock = false
	slot0.is_change_main = false
	slot0.tab_btn_list = {}
	slot0.tab_panel_list = {}
end

function RefPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:setSwallowTouches(false)

	slot5 = "container"
	slot0.container = slot0.root_wnd:getChildByName("main_panel"):getChildByName(slot5)

	for slot5 = 1, 3 do
		if slot1:getChildByName("tab_btn_" .. slot5) then
			if slot5 == 1 then
				({
					tab_btn = slot6,
					normal = slot6:getChildByName("normal"),
					select = slot6:getChildByName("select"),
					normal_icon = slot6:getChildByName("normal_icon"),
					select_icon = slot6:getChildByName("select_icon"),
					label = slot6:getChildByName("label"),
					index = slot5
				}).label:setString(TI18N("表情"))
			elseif slot5 == 2 then
				slot7.label:setString(TI18N("道具"))
			else
				slot7.label:setString(TI18N("装备"))
			end

			slot0.tab_btn_list[slot5] = slot7
		end
	end

	slot0.main_panel = slot1

	slot0.main_panel:setPositionY(display.getBottom() + 168)
end

function RefPanel.register_event(slot0)
	function slot4(slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			RefController:getInstance():closeView()
		end
	end

	slot0.background:addTouchEventListener(slot4)

	for slot4, slot5 in ipairs(slot0.tab_btn_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playButtonSound2()
					uv0:changeTabView(uv1)
				end
			end)
		end
	end
end

function RefPanel.openRootWnd(slot0, slot1, slot2)
	slot0:changeTabView(1)

	slot3 = slot1 or {}

	slot0.main_panel:setPositionY(slot0.root_wnd:convertToNodeSpace(slot3.world_pos or cc.p(0, 0)).y + (slot3.offset_y or 0))

	if slot2 and slot2 == ChatConst.Channel.Province then
		for slot10, slot11 in pairs(slot0.tab_btn_list) do
			if slot10 ~= 1 and slot11.tab_btn then
				slot11.tab_btn:setVisible(false)
			end
		end
	end
end

function RefPanel.changeTabView(slot0, slot1)
	if slot0.select_object and slot0.select_object.index == slot1 then
		return
	end

	if slot0.select_object then
		slot0.select_object.normal:setVisible(true)
		slot0.select_object.select:setVisible(false)
		slot0.select_object.normal_icon:setVisible(true)
		slot0.select_object.select_icon:setVisible(false)
	end

	if slot0.select_panel then
		slot0.select_panel:setVisible(false)
	end

	slot0.select_object = slot0.tab_btn_list[slot1]

	if slot0.select_object then
		slot0.select_object.normal:setVisible(false)
		slot0.select_object.select:setVisible(true)
		slot0.select_object.normal_icon:setVisible(false)
		slot0.select_object.select_icon:setVisible(true)
	end

	slot0.select_panel = slot0:createPanel(slot1)

	if slot0.select_panel then
		slot0.select_panel:setVisible(true)
	end
end

function RefPanel.createPanel(slot0, slot1)
	if slot0.tab_panel_list[slot1] then
		return slot0.tab_panel_list[slot1]
	end

	slot2 = nil

	if (slot1 ~= 1 or RefFacesUI.New(slot0.container)) and (slot1 ~= 2 or RefItemUI.New(slot0.container)) and RefEquipUI.New(slot0.container) then
		slot0.tab_panel_list[slot1] = slot2
	end

	return slot2
end

function RefPanel.close_callback(slot0)
	for slot4, slot5 in ipairs(slot0.tab_panel_list) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.tab_panel_list = nil

	RefController:getInstance():closeView()
end
