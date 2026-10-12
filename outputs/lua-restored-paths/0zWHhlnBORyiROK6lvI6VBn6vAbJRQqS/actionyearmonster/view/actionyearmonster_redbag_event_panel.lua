slot1 = ActionyearmonsterController:getInstance():getModel()
slot2 = string.format
ActionyearmonsterRedbagEventPanel = ActionyearmonsterRedbagEventPanel or BaseClass(BaseView)

function ActionyearmonsterRedbagEventPanel.__init(slot0)
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

function ActionyearmonsterRedbagEventPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

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
		item_class = ReturnActionRedbagInfoItem1
	})
end

function ActionyearmonsterRedbagEventPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openActionyearmonsterRedbagEventPanel(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openActionyearmonsterRedbagEventPanel(false)
	end, true, 2)
end

function ActionyearmonsterRedbagEventPanel.openRootWnd(slot0, slot1)
	info_data = (slot1 or {}).info_data

	slot0:setData(info_data)
end

function ActionyearmonsterRedbagEventPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if not slot0.role_name_txt then
		slot0.role_name_txt = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(242, 580), nil, nil, 800)

		slot0.main_container:addChild(slot0.role_name_txt)
	end

	if slot1.flag == 1 then
		if not slot0.role_head then
			slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

			slot0.role_head:setPosition(cc.p(242, 658))
			slot0.main_container:addChild(slot0.role_head)
		end

		if RoleController:getInstance():getRoleVo() then
			slot0.role_head:setHeadRes(slot2.face_id, false, LOADTEXT_TYPE, slot2.face_file, slot2.face_update_time)

			slot3 = slot2.avatar_base_id

			if slot0.record_res_bid == nil or slot0.record_res_bid ~= slot3 then
				slot0.record_res_bid = slot3

				if Config.AvatarData.data_avatar[slot3] then
					slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot4.res_id or 1), false, false), nil, false, slot4.offy)
				else
					slot0.role_head:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
				end
			end
		end

		slot0.role_name_txt:setString(TI18N("<div fontcolor=#ffeeac>成功领取全服红包！</div>"))
	else
		slot0.role_name_txt:setPositionY(600)
		slot0.role_name_txt:setString(TI18N("<div fontcolor=#8af77b>未能领取全服红包~o(>﹏<)o</div>"))
	end

	slot0.num_txt:setString(uv0(TI18N("剩余个数：%d/%d"), slot1.last_num or 0, slot1.all_num or 0))

	slot0.role_count_txt = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(242, -24))

	slot0.main_container:addChild(slot0.role_count_txt)
	slot0.role_count_txt:setString(uv0(TI18N("<div fontcolor=#ffeeac>个人红包领取个数:%s/%s</div>"), slot1.role_num or 0, slot1.role_all_num or 0))

	if slot1.information and next(slot1.information) ~= nil then
		slot6 = slot1.information
		slot7 = RoleController:getInstance():getRoleVo()

		table.sort(slot6, function (slot0, slot1)
			if slot0.rid == uv0.rid and slot0.srv_id == uv0.srv_id and not (slot1.rid == uv0.rid and slot1.srv_id == uv0.srv_id) then
				return true
			elseif not slot2 and slot3 then
				return false
			else
				return slot1.unixtime < slot0.unixtime
			end
		end)
		slot0.item_scrollview:setData(slot6)
		slot0.item_scrollview:addEndCallBack(function ()
			for slot4, slot5 in ipairs(uv0.item_scrollview:getItemList()) do
				slot5:setIndex(slot4)
			end
		end)

		return
	end

	commonShowEmptyIcon(slot0.item_scrollview, true, {
		label_color = cc.c4b(255, 255, 255, 255),
		text = TI18N("暂无信息")
	})
end

function ActionyearmonsterRedbagEventPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.role_head then
		slot0.role_head:DeleteMe()

		slot0.role_head = nil
	end

	uv0:openActionyearmonsterRedbagEventPanel(false)
end

ReturnActionRedbagInfoItem1 = class("ReturnActionRedbagInfoItem1", function ()
	return ccui.Widget:create()
end)

function ReturnActionRedbagInfoItem1.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ReturnActionRedbagInfoItem1.configUI(slot0)
	slot0.size = cc.size(453, 92)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("returnaction/returnaction_redbag_info_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot2
	slot0.image_bg = slot2:getChildByName("image_bg")
	slot0.time_txt = slot2:getChildByName("time_txt")

	slot0.time_txt:setTextColor(cc.c4b(255, 255, 255, 255))
	slot0.time_txt:setPosition(cc.p(102, 30))

	slot0.name_txt = createRichLabel(24, cc.c4b(255, 234, 150, 255), cc.p(0, 0.5), cc.p(102, 62))

	slot2:addChild(slot0.name_txt)

	slot0.award_txt = createRichLabel(24, 1, cc.p(1, 0.5), cc.p(425, 46))

	slot2:addChild(slot0.award_txt)

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setScale(0.8)
	slot0.role_head:setPosition(cc.p(50, 46))
	slot2:addChild(slot0.role_head)
end

function ReturnActionRedbagInfoItem1.register_event(slot0)
end

function ReturnActionRedbagInfoItem1.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.role_head:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)

	slot2 = slot1.avatar_bid

	if slot0.record_res_bid == nil or slot0.record_res_bid ~= slot2 then
		slot0.record_res_bid = slot2

		if Config.AvatarData.data_avatar[slot2] then
			slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot3.res_id or 1), false, false), nil, false, slot3.offy)
		else
			slot0.role_head:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
		end
	end

	if RoleController:getInstance():getRoleVo().rid == slot1.rid and slot3.srv_id == slot1.srv_id then
		slot0.is_myself = true

		slot0.name_txt:setString(uv0("%s  <img src='%s' scale=1.0 />", slot1.name, PathTool.getResFrame("actionpetard", "txt_cn_petard_myself")))
		slot0.image_bg:setVisible(true)
		slot0.image_bg:loadTexture(PathTool.getResFrame("actionpetard", "actionpetard_1009"), LOADTEXT_TYPE_PLIST)
	else
		slot0.is_myself = false

		slot0.name_txt:setString(slot1.name)
	end

	slot9 = slot1.unixtime

	slot0.time_txt:setString(TimeTool.getMDHMS(slot9))

	for slot9, slot10 in ipairs(slot1.reward_list) do
		if Config.ItemData.data_get_data(slot10.base_id) then
			slot4 = "" .. uv0("<img src='%s' scale=0.3 /> %d", PathTool.getItemRes(slot13.icon), slot10.num or 0)
		end
	end

	slot0.award_txt:setString(slot4)
end

function ReturnActionRedbagInfoItem1.setIndex(slot0, slot1)
	if slot0.is_myself or not slot1 then
		return
	end

	if slot1 % 2 == 0 then
		slot0.image_bg:setVisible(false)
	else
		slot0.image_bg:setVisible(true)
		slot0.image_bg:loadTexture(PathTool.getResFrame("actionpetard", "actionpetard_1008"), LOADTEXT_TYPE_PLIST)
	end
end

function ReturnActionRedbagInfoItem1.DeleteMe(slot0)
	if slot0.role_head then
		slot0.role_head:DeleteMe()

		slot0.role_head = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
