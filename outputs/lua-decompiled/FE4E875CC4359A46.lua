slot1 = ReturnActionController:getInstance():getModel()
slot2 = string.format
ReturnActionRedbagInfoWindow = ReturnActionRedbagInfoWindow or BaseClass(BaseView)

function ReturnActionRedbagInfoWindow.__init(slot0)
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "returnaction/returnaction_redbag_info_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionpetard", "actionpetard"),
			type = ResourcesType.plist
		}
	}
end

function ReturnActionRedbagInfoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.num_txt = slot1:getChildByName("num_txt")
	slot2 = slot1:getChildByName("list_panel")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 453,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 92,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = ReturnActionRedbagInfoItem
	})
end

function ReturnActionRedbagInfoWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openReturnRedbagInfoWindow(false)
	end, true, 2)
end

function ReturnActionRedbagInfoWindow.openRootWnd(slot0, slot1)
	slot0:setData(slot1)
end

function ReturnActionRedbagInfoWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if not slot0.role_head then
		slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

		slot0.role_head:setPosition(cc.p(242, 658))
		slot0.main_container:addChild(slot0.role_head)
	end

	if slot1.send_face_id then
		slot0.role_head:setHeadRes(slot1.send_face_id)
	end

	if not slot0.role_name_txt then
		slot0.role_name_txt = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(242, 580))

		slot0.main_container:addChild(slot0.role_name_txt)
	end

	slot0.role_name_txt:setString(uv0(TI18N("<div fontcolor=#ffea96>%s</div>的红包"), slot1.send_name or ""))

	if slot1.end_time <= GameNet:getInstance():getTime() then
		slot0.num_txt:setString(TI18N("红包已过期"))
	else
		slot3 = slot1.max_num or 0

		slot0.num_txt:setString(uv0(TI18N("剩余个数：%d/%d"), slot3 - (slot1.get_num or 0), slot3))
	end

	if slot1.get_red_packet_list and next(slot1.get_red_packet_list) ~= nil then
		slot3 = slot1.get_red_packet_list
		slot4 = RoleController:getInstance():getRoleVo()

		table.sort(slot3, function (slot0, slot1)
			if slot0.r_rid == uv0.rid and slot0.r_srvid == uv0.srv_id and not (slot1.r_rid == uv0.rid and slot1.r_srvid == uv0.srv_id) then
				return true
			elseif not slot2 and slot3 then
				return false
			else
				return slot1.time < slot0.time
			end
		end)
		slot0.item_scrollview:setData(slot3)
		slot0.item_scrollview:addEndCallBack(function ()
			for slot4, slot5 in ipairs(uv0.item_scrollview:getItemList()) do
				slot5:setIndex(slot4)
			end
		end)
	end
end

function ReturnActionRedbagInfoWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.role_head then
		slot0.role_head:DeleteMe()

		slot0.role_head = nil
	end

	uv0:openReturnRedbagInfoWindow(false)
end
