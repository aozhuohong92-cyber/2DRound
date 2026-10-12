ArtifactWindow = ArtifactWindow or BaseClass(BaseView)

function ArtifactWindow.__init(slot0)
	slot0.ctrl = HeroController:getInstance()
	slot0.is_full_screen = false
	slot0.title_str = TI18N("战技")
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("artifact", "artifact"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Big
	slot0.btn_list = {}
	slot0.view_list = {}
	slot0.select_btn = nil
end

function ArtifactWindow.open_callback(slot0)
	slot2 = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/tab_btn_panel"))

	slot0.container:addChild(slot2, 10)
	slot2:setAnchorPoint(cc.p(0.5, 0))
	slot2:setPosition(cc.p(slot0.container:getContentSize().width / 2, 735))

	slot0.btn_panel = slot2:getChildByName("main_panel")

	for slot8 = 1, 2 do
		if slot0.btn_panel:getChildByName("tab_btn_" .. slot8) then
			slot10 = {
				btn = slot9,
				select_bg = slot9:getChildByName("select_bg")
			}

			slot10.select_bg:setVisible(false)

			slot10.title = slot9:getChildByName("title")

			slot10.title:setString(({
				TI18N("升星"),
				TI18N("重铸")
			})[slot8] or "")
			slot10.title:setTextColor(cc.c4b(207, 181, 147, 255))

			slot10.index = slot8
			slot0.btn_list[slot8] = slot10

			slot9:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playButtonSound2()
					uv0:changeTabIndex(uv1)
				end
			end)
		end
	end
end

function ArtifactWindow.register_event(slot0)
	if not slot0.select_item_event then
		slot0.select_item_event = GlobalEvent:getInstance():Bind(HeroEvent.Artifact_Select_Event, function (slot0)
			if uv0.pre_panel then
				uv0.pre_panel:clickFun(slot0)
			end
		end)
	end
end

function ArtifactWindow.changeTabIndex(slot0, slot1)
	if slot0.select_btn and slot0.select_btn.index == slot1 then
		return
	end

	if slot0.select_btn then
		slot0.select_btn.select_bg:setVisible(false)
		slot0.select_btn.title:setTextColor(cc.c4b(207, 181, 147, 255))
	end

	if slot0.pre_panel then
		slot0.pre_panel:setVisibleStatus(false)
	end

	slot0.pre_panel = slot0:createSubPanel(slot1)
	slot0.select_btn = slot0.btn_list[slot1]

	if slot0.select_btn then
		slot0.select_btn.select_bg:setVisible(true)
		slot0.select_btn.title:setTextColor(cc.c4b(255, 237, 214, 255))
	end

	if slot0.pre_panel then
		slot0.pre_panel:setVisibleStatus(true)
		slot0.pre_panel:setData(slot0.data, slot0.partner_id)
	end
end

function ArtifactWindow.createSubPanel(slot0, slot1)
	if slot0.view_list[slot1] == nil then
		if slot1 == 1 then
			slot2 = ArtifactComposePanel.new(slot0.data)
		elseif slot1 == 2 then
			slot2 = ArtifactRecastPanel.new(slot0.data)
		end

		slot2:setPosition(cc.p(slot0.container:getContentSize().width / 2, 390))
		slot0.container:addChild(slot2)

		slot0.view_list[slot1] = slot2
	end

	return slot2
end

function ArtifactWindow.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.data = slot2
	slot0.partner_id = slot3

	slot0:changeTabIndex(slot1 or 1)
end

function ArtifactWindow.setPanelData(slot0)
end

function ArtifactWindow.close_callback(slot0)
	slot0.ctrl:openArtifactWindow(false)

	if slot0.select_item_event then
		GlobalEvent:getInstance():UnBind(slot0.select_item_event)

		slot0.select_item_event = nil
	end

	for slot4, slot5 in pairs(slot0.view_list) do
		slot5:DeleteMe()
	end

	slot0.view_list = nil
end
