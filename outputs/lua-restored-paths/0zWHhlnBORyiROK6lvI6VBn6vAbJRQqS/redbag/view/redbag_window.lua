RedBagWindow = RedBagWindow or BaseClass(BaseView)

function RedBagWindow.__init(slot0, slot1)
	slot0.ctrl = RedbagController:getInstance()
	slot0.is_full_screen = false
	slot0.title_str = TI18N("公会红包")
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("redbag", "redbag"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("guildboss", "guildboss"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_42"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_43"),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "redbag/redbag_btn_panel"
	slot0.extend_id = slot1
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.btn_list = {}
	slot0.view_list = {}
	slot0.select_btn = nil
end

function RedBagWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot2 = slot1:getChildByName("main_panel")
	slot0.container = slot2:getChildByName("container")
	slot8 = "公会红包"

	slot2:getChildByName("win_title"):setString(TI18N(slot8))

	slot4 = {
		TI18N("发红包"),
		TI18N("抢红包"),
		TI18N("发红包榜")
	}

	for slot8 = 1, 3 do
		if slot2:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot8) then
			slot10 = {
				btn = slot9,
				select_bg = slot9:getChildByName("select_bg")
			}

			slot10.select_bg:setVisible(false)

			slot10.title = slot9:getChildByName("title")
			slot10.red_point = slot9:getChildByName("red_point")

			slot10.red_point:setVisible(false)

			if slot8 == 2 then
				slot11 = RedbagController:getInstance():getModel():getIsHaveRedBag()

				slot10.red_point:setVisible(slot11)

				slot10.red_status = slot11
			elseif slot8 == 1 then
				slot11 = RedbagController:getInstance():getModel():getSendRedBagStatue()

				slot10.red_point:setVisible(slot11)

				slot10.red_status = slot11
			end

			slot10.title:setString(slot4[slot8] or "")

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

function RedBagWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			RedbagController:getInstance():openMainView(false)
		end
	end)

	if slot0.update_red_status_event == nil then
		slot0.update_red_status_event = GlobalEvent:getInstance():Bind(GuildEvent.UpdateGuildRedStatus, function (slot0)
			uv0:updateSomeRedStatus(RedbagController:getInstance():getModel():getIsHaveRedBag())
			uv0:updateOneRedStatus(RedbagController:getInstance():getModel():getSendRedBagStatue())
		end)
	end
end

function RedBagWindow.updateSomeRedStatus(slot0, slot1)
	if slot0.btn_list and slot0.btn_list[2] then
		slot2 = slot0.btn_list[2]

		slot2.red_point:setVisible(slot1)

		slot2.red_status = slot1
	end
end

function RedBagWindow.updateOneRedStatus(slot0, slot1)
	if slot0.btn_list and slot0.btn_list[1] then
		slot2 = slot0.btn_list[1]

		slot2.red_point:setVisible(slot1)

		slot2.red_status = slot1
	end
end

function RedBagWindow.updateChoseRedStatus(slot0)
	for slot4, slot5 in pairs(slot0.btn_list) do
		if slot5.red_status then
			if slot0.select_btn and slot0.select_btn.index == slot5.index then
				slot5.red_point:setVisible(false)
			else
				slot5.red_point:setVisible(true)
			end
		end
	end
end

function RedBagWindow.changeTabIndex(slot0, slot1)
	if slot0.select_btn and slot0.select_btn.index == slot1 then
		return
	end

	if slot0.select_btn then
		slot0.select_btn.select_bg:setVisible(false)
		slot0.select_btn.title:setTextColor(cc.c4b(215, 226, 227, 255))
	end

	if slot0.pre_panel then
		slot0.pre_panel:setVisibleStatus(false)
	end

	slot0.pre_panel = slot0:createSubPanel(slot1)
	slot0.select_btn = slot0.btn_list[slot1]

	if slot0.select_btn then
		slot0.select_btn.select_bg:setVisible(true)
		slot0.select_btn.title:setTextColor(cc.c4b(255, 255, 255, 255))
	end

	if slot0.pre_panel then
		slot0.pre_panel:setVisibleStatus(true)
		slot0.pre_panel:setData(slot0.data)
	end

	if slot0.select_btn and slot0.select_btn.index == 3 then
		slot0.ctrl:sender13545()
	end

	slot0:updateChoseRedStatus()
end

function RedBagWindow.createSubPanel(slot0, slot1)
	if slot0.view_list[slot1] == nil then
		if slot1 == 1 then
			RedBagSendPanel.new(slot0.extend_id):setPosition(cc.p(slot0.container:getContentSize().width / 2, 355))
		elseif slot1 == 2 then
			RedBagGetPanel.new():setPosition(cc.p(slot3.width / 2, 375))
		elseif slot1 == 3 then
			RedBagRankPanel.new():setPosition(cc.p(slot3.width / 2, 375))
		end

		slot0.container:addChild(slot2)

		slot0.view_list[slot1] = slot2
	end

	return slot2
end

function RedBagWindow.openRootWnd(slot0, slot1, slot2)
	slot0.data = slot2

	if (slot0.ctrl:getModel():getIsHaveRedBag() or false) == true and (slot1 or 1) == 1 and not slot0.extend_id then
		slot1 = 2
	end

	slot0:changeTabIndex(slot1)
end

function RedBagWindow.setPanelData(slot0)
end

function RedBagWindow.close_callback(slot0)
	if slot0.update_red_status_event then
		GlobalEvent:getInstance():UnBind(slot0.update_red_status_event)

		slot0.update_red_status_event = nil
	end

	slot4 = false

	slot0.ctrl:openMainView(slot4)

	for slot4, slot5 in pairs(slot0.view_list) do
		slot5:DeleteMe()
	end

	slot0.view_list = nil
end
