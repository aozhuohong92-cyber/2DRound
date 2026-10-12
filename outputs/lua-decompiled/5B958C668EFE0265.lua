GuildvoyageMainWindow = GuildvoyageMainWindow or BaseClass(BaseView)
slot1 = GuildvoyageController:getInstance():getModel()

function GuildvoyageMainWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildvoyage", "guildvoyage"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "guildvoyage/guildvoyage_main_window"
	slot0.panel_list = {}
	slot0.tab_list = {}
	slot0.cur_panel = nil
end

function GuildvoyageMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("main_panel")

	slot2:getChildByName("win_title"):setString(TI18N("公会远航"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.explain_btn = slot2:getChildByName("explain_btn")

	for slot7 = 1, 3 do
		slot8 = {}

		if slot2:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot7) then
			if slot7 == 1 then
				slot9:getChildByName("title"):setString(TI18N("可接订单"))
			elseif slot7 == 2 then
				slot10:setString(TI18N("正在护送"))
			elseif slot7 == 3 then
				slot10:setString(TI18N("互动加速"))
			end

			slot10:setTextColor(cc.c4b(245, 224, 185, 255))
			slot9:setBright(false)

			slot8.tab_btn = slot9
			slot8.label = slot10
			slot8.index = slot7
			slot8.tips = slot9:getChildByName("tips")
			slot0.tab_list[slot7] = slot8
		end
	end

	slot0.container = slot2:getChildByName("container")
end

function GuildvoyageMainWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openMainWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openMainWindow(false)
		end
	end)

	function slot4(slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			MainuiController:getInstance():openCommonExplainView(true, Config.GuildShippingData.data_explain)
		end
	end

	slot0.explain_btn:addTouchEventListener(slot4)

	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end

	if slot0.update_red_status_event == nil then
		slot0.update_red_status_event = GlobalEvent:getInstance():Bind(GuildEvent.UpdateGuildRedStatus, function (slot0, slot1)
			uv0:updateSomeRedStatus(slot0, slot1)
		end)
	end
end

function GuildvoyageMainWindow.updateSomeRedStatus(slot0, slot1, slot2)
	slot3 = false
	slot4 = nil

	if slot1 == nil then
		if slot0.tab_list[2] and slot4.tips then
			slot4.tips:setVisible(uv0:getRedStatusByType(GuildConst.red_index.voyage_escort))
		end

		if slot0.tab_list[3] and slot4.tips then
			slot4.tips:setVisible(uv0:getRedStatusByType(GuildConst.red_index.voyage_interaction))
		end
	elseif slot1 == GuildConst.red_index.voyage_escort or slot1 == GuildConst.red_index.voyage_temp_escort then
		if slot0.tab_list[2] and slot4.tips then
			slot4.tips:setVisible(uv0:getEscortStatus())
		end
	elseif slot1 == GuildConst.red_index.voyage_interaction and slot0.tab_list[3] and slot4.tips then
		slot4.tips:setVisible(slot2)
	end
end

function GuildvoyageMainWindow.openRootWnd(slot0, slot1)
	slot0:changeSelectedTab(slot1 or GuildvoyageConst.index.order)
	slot0:updateSomeRedStatus()
end

function GuildvoyageMainWindow.changeSelectedTab(slot0, slot1)
	if slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.tab_btn:setBright(false)
		slot0.tab_object.label:setTextColor(cc.c4b(245, 224, 185, 255))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.label:setTextColor(cc.c4b(89, 52, 41, 255))
		slot0.tab_object.tab_btn:setBright(true)
	end

	if slot0.select_panel then
		slot0.select_panel:addToParent(false)

		slot0.select_panel = nil
	end

	slot0.select_panel = slot0.panel_list[slot1]

	if slot0.select_panel == nil then
		if slot1 == GuildvoyageConst.index.order then
			slot0.select_panel = GuildVoyageOrderPanel.new()
		elseif slot1 == GuildvoyageConst.index.escort then
			slot0.select_panel = GuildVoyageEscortPanel.new()
		elseif slot1 == GuildvoyageConst.index.interaction then
			slot0.select_panel = GuildVoyageInteractionPanel.new()
		end

		slot0.container:addChild(slot0.select_panel)

		slot0.panel_list[slot1] = slot0.select_panel
	end

	slot0.select_panel:addToParent(true)

	if slot1 == GuildvoyageConst.index.escort then
		uv0:updateGuildRedStatus(GuildConst.red_index.voyage_temp_escort, false)
	end
end

function GuildvoyageMainWindow.close_callback(slot0)
	if slot0.update_red_status_event then
		GlobalEvent:getInstance():UnBind(slot0.update_red_status_event)

		slot0.update_red_status_event = nil
	end

	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = nil

	uv0:openMainWindow(false)
end
