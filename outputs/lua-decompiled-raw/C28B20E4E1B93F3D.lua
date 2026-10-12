RoleReportedPanel = RoleReportedPanel or BaseClass(BaseView)
slot0 = RoleController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort
slot4 = string.len
slot5 = string.find
slot6 = string.sub

function RoleReportedPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "roleinfo/role_reported_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("vedio", "vedio"),
			type = ResourcesType.plist
		}
	}
	slot0.default_content_msg = TI18N("点击输入原因, 最多100字")
	slot0.content_str = ""
	slot0.select_checkbox = 1
	slot0.space_y = 2
	slot0.item_list = {}
end

function RoleReportedPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot5 = 2

	slot0:playEnterAnimatianByObj(slot0.main_container, slot5)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("举报"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.key_reported = slot0.main_container:getChildByName("key_reported")

	slot0.key_reported:setString("举报原因:")

	slot0.key_explain = slot0.main_container:getChildByName("key_explain")

	slot0.key_explain:setString("附加说明:")

	slot0.key_evidence = slot0.main_container:getChildByName("key_evidence")

	slot0.key_evidence:setString("举报证据:")

	slot0.key_evidence2 = slot0.main_container:getChildByName("key_evidence2")

	slot0.key_evidence2:setString("勾选发言记录作为证据:")

	slot0.key_reported_name = slot0.main_container:getChildByName("key_reported_name")

	slot0.key_reported_name:setString("被举报玩家:")

	slot0.reported_name = slot0.main_container:getChildByName("reported_name")
	slot1 = {
		TI18N("昵称不雅"),
		TI18N("骚扰谩骂"),
		TI18N("广告刷屏"),
		TI18N("色情暴力"),
		TI18N("反动证据"),
		TI18N("头像违规"),
		TI18N("其他")
	}
	slot0.checkbox_list = {}

	for slot5 = 1, 7 do
		if slot0.main_container:getChildByName("checkbox" .. slot5) then
			if slot1[slot5] then
				slot6:getChildByName("name"):setString(slot1[slot5])
			end

			slot0.checkbox_list[slot5] = slot6
		end
	end

	slot0:setSelectCheckBox()

	slot0.label_content = createRichLabel(22, Config.ColorData.data_color4[151], cc.p(0, 1), cc.p(160, 560), 6, nil, 450)

	slot0.label_content:setString(slot0.default_content_msg)
	slot0.main_container:addChild(slot0.label_content)

	slot0.edit_content = createEditBox(slot0.main_container, PathTool.getResFrame("common", "common_99998"), cc.size(450, 110), nil, 22, nil, 22, "", nil, , LOADTEXT_TYPE_PLIST)

	slot0.edit_content:setAnchorPoint(cc.p(0, 1))
	slot0.edit_content:setPlaceholderFontColor(Config.ColorData.data_color4[63])
	slot0.edit_content:setFontColor(Config.ColorData.data_color4[66])
	slot0.edit_content:setPosition(cc.p(158, 563))
	slot0.edit_content:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0.begin_change_label then
				uv0.begin_change_label = false

				uv0.label_content:setVisible(true)
				slot1:setText("")

				if slot1:getText() ~= "" and slot2 ~= uv0.content_str then
					if StringUtil.SubStringGetTotalIndex(slot2) > 100 then
						slot2 = StringUtil.SubStringUTF8(slot2, 1, 100)
					end

					uv0.content_str = slot2

					uv0.label_content:setString(slot2)
				else
					uv0.label_content:setString(uv0.default_content_msg)
				end
			end
		elseif slot0 == "began" then
			if not uv0.begin_change_label then
				uv0.label_content:setVisible(false)

				uv0.begin_change_label = true
			end
		elseif slot0 == "changed" then
			-- Nothing
		end
	end)

	slot0.item_scrollview = slot0.main_container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)
	slot0.item_scrollview:setSwallowTouches(false)

	slot0.item_scrollview_size = slot0.item_scrollview:getContentSize()
	slot0.look_btn = slot0.main_container:getChildByName("look_btn")
	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("提 交"))
end

function RoleReportedPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.comfirm_btn, handler(slot0, slot0.onClickBtnComfirm), true, 1)

	function slot4(slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.RoleData.data_role_const.game_rule1.desc, slot1:getTouchBeganPosition())
	end

	slot5 = true

	registerButtonEventListener(slot0.look_btn, slot4, slot5, 1)

	for slot4, slot5 in ipairs(slot0.checkbox_list) do
		slot5:addEventListener(function (slot0, slot1)
			playButtonSound2()

			uv0.select_checkbox = uv1

			uv0:setSelectCheckBox()
		end)
	end

	slot0:addGlobalEvent(RoleEvent.ROLE_REPORTED_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
end

function RoleReportedPanel.onClickBtnComfirm(slot0)
	if not slot0.data then
		return
	end

	slot1 = slot0.content_str or ""
	slot2 = slot0.select_checkbox
	slot3 = slot0.content_str or ""
	slot4 = {}

	if slot0.show_list then
		for slot8, slot9 in ipairs(slot0.show_list) do
			if slot9.is_select then
				uv0(slot4, {
					id = slot9.id
				})
			end
		end
	end

	uv1:send12770(slot0.rid, slot0.srv_id, slot2, slot3, slot4)
	slot0:onClickBtnClose()
end

function RoleReportedPanel.onClickBtnClose(slot0)
	uv0:openRoleReportedPanel(false)
end

function RoleReportedPanel.setSelectCheckBox(slot0)
	if not slot0.select_checkbox then
		return
	end

	if not slot0.checkbox_list then
		return
	end

	for slot4, slot5 in ipairs(slot0.checkbox_list) do
		if slot0.select_checkbox == slot4 then
			slot5:setSelected(true)
		else
			slot5:setSelected(false)
		end
	end
end

function RoleReportedPanel.openRootWnd(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	if not slot2 then
		return
	end

	if not slot3 then
		return
	end

	slot0.rid = slot1
	slot0.srv_id = slot2
	slot0.play_name = slot3

	slot0.reported_name:setString(slot3)
	uv0:send12771(slot1, slot2)
end

function RoleReportedPanel.setData(slot0, slot1)
	slot0.data = slot1

	function slot6(slot0, slot1)
		return slot0.id < slot1.id
	end

	uv0(slot0.data.history, slot6)

	slot0.show_list = {}

	for slot6, slot7 in ipairs(slot0.data.history) do
		slot8 = nil

		if ({
			[ChatConst.Channel.World] = TI18N("世界"),
			[2] = TI18N("公会"),
			[3] = TI18N("私聊"),
			[4] = TI18N("系统"),
			[ChatConst.Channel.Cross] = TI18N("跨服"),
			[ChatConst.Channel.Province] = TI18N("同省")
		})[slot7.channel] == nil then
			slot8 = TI18N("未知")
		end

		slot9 = slot0:filterFace(slot7.msg)
		slot7.show_info = uv1("[%s] <div fontcolor=#249003>%s:</div> %s", slot8, slot0.play_name, slot9)

		if slot9 and uv2(slot9) > 0 then
			uv3(slot0.show_list, slot7)
		end
	end

	slot0:updateList()
end

function RoleReportedPanel.filterFace(slot0, slot1)
	if not slot1 then
		return
	end

	if uv0(slot1) == 0 then
		return ""
	end

	slot3, slot4 = uv1(slot1, "(#%d+)")

	if slot3 == nil then
		return slot1
	end

	if slot4 > slot3 + 2 then
		slot4 = slot3 + 2
	end

	slot5 = ""
	slot6 = ""

	if slot3 == 1 then
		if slot2 <= slot4 then
			return ""
		end

		slot6 = uv2(slot1, slot4 + 1, slot2)
	elseif slot2 <= slot4 then
		slot5 = string.sub(slot1, 1, slot3 - 1)
	else
		slot5 = string.sub(slot1, 1, slot3 - 1)
		slot6 = string.sub(slot1, slot4 + 1, slot2)
	end

	return slot0:filterFace(slot5 .. slot6)
end

function RoleReportedPanel.updateList(slot0)
	if not slot0.show_list then
		return
	end

	slot2 = math.max(slot0.item_scrollview_size.height, slot0:initPositionInfo() or 0)

	slot0.item_scrollview:setInnerContainerSize(cc.size(slot0.item_scrollview_size.width, slot2))

	if slot2 == slot0.item_scrollview_size.height then
		slot0.item_scrollview:setTouchEnabled(false)
	else
		slot0.item_scrollview:setTouchEnabled(true)
	end

	for slot6, slot7 in ipairs(slot0.item_list) do
		slot7:setVisible(false)
	end

	for slot6, slot7 in ipairs(slot0.show_list) do
		if slot0.item_list[slot6] == nil then
			slot0.item_list[slot6] = RoleReportedItem.new()

			slot0.item_scrollview:addChild(slot0.item_list[slot6])
		else
			slot0.item_list[slot6]:setVisible(true)
		end

		slot0.item_list[slot6]:setPosition(0, slot2 - slot7.y)
		slot0.item_list[slot6]:setData(slot7)
	end
end

function RoleReportedPanel.initPositionInfo(slot0)
	if not slot0.show_list then
		return
	end

	if slot0.test_content == nil then
		slot0.test_content = createRichLabel(24, cc.c4b(149, 83, 34, 255), cc.p(0, 1), cc.p(-10000, 257), 6, nil, 400)

		slot0.main_container:addChild(slot0.test_content)
	end

	slot1 = 0

	for slot6, slot7 in ipairs(slot0.show_list) do
		slot0.test_content:setString(slot7.show_info)

		slot7.y = slot1

		if RoleReportedItem.HEIGHT - RoleReportedItem.OFFSET < slot0.test_content:getContentSize().height then
			slot1 = slot1 + slot8.height + RoleReportedItem.OFFSET
			slot7.is_middle = false
		else
			slot1 = slot1 + RoleReportedItem.HEIGHT
			slot7.is_middle = true
		end

		slot1 = slot1 + slot0.space_y
	end

	return slot1
end

function RoleReportedPanel.close_callback(slot0)
	uv0:openRoleReportedPanel(false)
end

RoleReportedItem = class("RoleReportedItem", function ()
	return ccui.Widget:create()
end)
RoleReportedItem.WIDTH = 475
RoleReportedItem.HEIGHT = 54
RoleReportedItem.OFFSET = 6

function RoleReportedItem.ctor(slot0)
	slot0:configUI(RoleReportedItem.WIDTH, RoleReportedItem.HEIGHT)
	slot0:register_event()
end

function RoleReportedItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0, 1))

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("roleinfo/role_reported_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.checkbox = slot0.root_wnd:getChildByName("checkbox")

	slot0.checkbox:setSelected(false)

	slot0.msg_label = createRichLabel(24, cc.c4b(149, 83, 34, 255), cc.p(0, 1), cc.p(70, RoleReportedItem.HEIGHT - RoleReportedItem.OFFSET), 2, nil, 400)

	slot0.root_wnd:addChild(slot0.msg_label)
end

function RoleReportedItem.register_event(slot0)
	slot0.checkbox:addEventListener(function (slot0, slot1)
		playButtonSound2()

		if uv0.data then
			uv0.data.is_select = uv0.checkbox:isSelected()
		end
	end)
end

function RoleReportedItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.msg_label:setString(slot1.show_info)

	if slot1.is_middle then
		slot0.msg_label:setPositionY(40)
	end
end

function RoleReportedItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
