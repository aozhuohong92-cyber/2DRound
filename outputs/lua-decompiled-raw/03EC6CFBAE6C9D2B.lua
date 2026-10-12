RoleChangeView = RoleChangeView or BaseClass(BaseView)

function RoleChangeView.__init(slot0, slot1)
	slot0.ctrl = slot1
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "roleinfo/role_change_view"
	slot0.role_vo = slot0.ctrl:getRoleVo()
	slot0.sex_select = slot0.role_vo.sex
	slot0.btn_list = {}
end

function RoleChangeView.open(slot0, slot1)
	BaseView.open(slot0)
end

function RoleChangeView.open_callback(slot0)
	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.ok_btn = slot0.main_panel:getChildByName("ok_btn")
	slot0.ok_btn.label = slot0.ok_btn:getTitleRenderer()

	if slot0.ok_btn.label ~= nil then
		slot0.ok_btn.label:setString(TI18N("确定"))
		slot0.ok_btn.label:enableOutline(Config.ColorData.data_color4[264], 2)
	end

	slot0.cancel_btn = slot0.main_panel:getChildByName("cancel_btn")
	slot0.cancel_btn.label = slot0.cancel_btn:getTitleRenderer()

	if slot0.cancel_btn.label ~= nil then
		slot0.cancel_btn.label:setString(TI18N("取消"))
		slot0.cancel_btn.label:enableOutline(Config.ColorData.data_color4[263], 2)
	end

	slot0.title_container = slot0.main_panel:getChildByName("title_container")

	slot0.title_container:getChildByName("title_label"):setString(TI18N("更改信息"))

	slot0.main_container = slot0.main_panel:getChildByName("main_container")

	slot0.main_container:getChildByName("free_tips"):setString(TI18N("本次免费"))
	slot0.main_container:getChildByName("name"):setString(TI18N("名字："))

	slot0.sex_container = slot0.main_container:getChildByName("sex_container")

	slot0.sex_container:getChildByName("sex_name"):setString(TI18N("性别："))
	slot0.sex_container:getChildByName("sex_tips"):setString(TI18N("性别选择后不能变更哦~"))

	slot0.boy_btn = slot0.sex_container:getChildByName("boy_btn")

	slot0.boy_btn:setSelected(false)

	slot0.girl_btn = slot0.sex_container:getChildByName("girl_btn")

	slot0.girl_btn:setSelected(false)

	slot6 = ""

	slot0:createInputContainer((slot0.role_vo.is_first_rename ~= TRUE or TI18N("请输入名字(限制6字)")) and slot0.role_vo.name)
	slot0:register_event()
end

function RoleChangeView.createInputContainer(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0.input_edit == nil then
		slot0.input_edit = createEditBox(slot0.main_container, PathTool.getResFrame("common", "common_1021"), cc.size(250, 50), Config.ColorData.data_color3[151], 24, Config.ColorData.data_color3[151], 24, slot1, nil, slot2, LOADTEXT_TYPE_PLIST)
	end

	slot0.input_edit:setAnchorPoint(cc.p(0.5, 0.5))

	slot4 = slot4 or 0

	if slot3 ~= nil then
		slot0.input_edit:setText(slot3)
	end

	slot0.input_edit:setPosition(297, 125)
end

function RoleChangeView.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openRoleChangeNameView(false)
		end
	end)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0.ctrl:openRoleChangeNameView(false)
		end
	end)

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0.ctrl:openRoleChangeNameView(false)
			end
		end)
	end

	slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.sex_select ~= 2 and uv0.input_edit:getText() ~= "" then
				uv0.ctrl:changeRoleName(string.gsub(uv0.input_edit:getText(), "\n", ""), uv0.sex_select)
			elseif uv0.input_edit:getText() == "" then
				message(TI18N("请输入姓名~"))
			elseif uv0.sex_select == 2 then
				message(TI18N("请选择性别~"))
			end
		end
	end)
	slot0.boy_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()

			if uv0.girl_btn:getSelectedState() then
				uv0.girl_btn:setSelected(false)
			end

			uv0.sex_select = 1
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
		end
	end)
	slot0.girl_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()

			if uv0.boy_btn:getSelectedState() then
				uv0.boy_btn:setSelected(false)
			end

			uv0.sex_select = 0
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
		end
	end)
end

function RoleChangeView.close_callback(slot0)
	slot0.ctrl:openRoleChangeNameView(false)
end
