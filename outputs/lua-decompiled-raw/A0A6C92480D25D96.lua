GuildCreatePanel = class("GuildCreatePanel", function ()
	return ccui.Layout:create()
end)
slot0 = GuildController:getInstance()

function GuildCreatePanel.ctor(slot0, slot1)
	slot0:initConditionList()

	slot0.set_index = 0
	slot0.condition_index = 1
	slot0.condition_index_2 = 1
	slot0.had_fill = false
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guild/guild_create_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot3 = slot2:getChildByName("Sprite_4")

	slot3:setPositionY(slot3:getPositionY() - 10)
	slot2:getChildByName("name_title"):setString(TI18N("公会大名："))
	slot2:getChildByName("name_desc"):setString(TI18N("长度限制2-6个汉字"))
	slot2:getChildByName("declaration_title"):setString(TI18N("公会宣言："))
	slot2:getChildByName("set_title"):setString(TI18N("验证设置："))
	slot2:getChildByName("condition_title"):setString(TI18N("入会要求："))
	slot2:getChildByName("condition_title_2"):setString(TI18N("战力要求："))
	slot2:getChildByName("desc"):setString(TI18N("以上信息在创建后仍可修改"))

	slot11 = slot2:getChildByName("desc_vip")
	slot0.set_value = slot2:getChildByName("set_value")
	slot0.condition_value = slot2:getChildByName("condition_value")
	slot0.condition_value_2 = slot2:getChildByName("condition_value_2")
	slot0.condition_left = slot2:getChildByName("condition_left")
	slot0.condition_right = slot2:getChildByName("condition_right")
	slot0.condition_left_2 = slot2:getChildByName("condition_left_2")
	slot0.condition_right_2 = slot2:getChildByName("condition_right_2")
	slot0.set_left = slot2:getChildByName("set_left")
	slot0.set_right = slot2:getChildByName("set_right")
	slot0.edit_title = createEditBox(slot2, PathTool.getResFrame("common", "common_99998"), cc.size(403, 50), nil, 22, Config.ColorData.data_color4[151], 22, TI18N("请输入公会名字"), nil, , LOADTEXT_TYPE_PLIST)

	slot0.edit_title:setAnchorPoint(cc.p(0, 0.5))
	slot0.edit_title:setPlaceholderFontColor(Config.ColorData.data_color4[151])
	slot0.edit_title:setFontColor(Config.ColorData.data_color4[175])
	slot0.edit_title:setPosition(cc.p(185, 554))
	slot0.edit_title:setMaxLength(12)

	slot0.declaration_value = createEditBox(slot2, PathTool.getResFrame("common", "common_99998"), cc.size(403, 146), nil, 22, Config.ColorData.data_color4[151], 22, TI18N("请输入公会宣言内容"), nil, , LOADTEXT_TYPE_PLIST)

	slot0.declaration_value:setAnchorPoint(cc.p(0, 1))
	slot0.declaration_value:setTouchEnabled(false)
	slot0.declaration_value:setPlaceholderFontColor(Config.ColorData.data_color4[151])
	slot0.declaration_value:setTouchEnabled(false)
	slot0.declaration_value:setFontColor(Config.ColorData.data_color4[175])
	slot0.declaration_value:setPosition(cc.p(185, 471))
	slot0.declaration_value:setMaxLength(100)

	slot0.create_btn = slot2:getChildByName("create_btn")
	slot14 = slot0.create_btn:getContentSize()
	slot16 = 100

	if Config.GuildData.data_const.create_gold ~= nil then
		slot16 = slot15.val
	end

	slot18 = 2

	if Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id.gold) ~= nil then
		slot18 = slot17.icon
	end

	slot0.create_btn_label = createRichLabel(26, 1, cc.p(0.5, 0.5), cc.p(slot14.width * 0.5, slot14.height * 0.5), nil, , slot14.width)

	slot0.create_btn:addChild(slot0.create_btn_label)

	slot20 = Config.GuildData.data_const.maintain_vip_condition

	slot11:setString(string.format(TI18N("需达VIP%d才可创建公会"), slot20.val))

	if RoleController:getInstance():getRoleVo().vip_lev < slot20.val then
		slot0.create_btn:setTouchEnabled(false)
		slot0.create_btn_label:setString(string.format("<img src=%s visible=true scale=0.3 />%s %s", PathTool.getItemRes(slot18), slot16, TI18N("创建公会")))
		setChildUnEnabled(true, slot0.create_btn)
	else
		slot0.create_btn_label:setString(string.format("<img src=%s visible=true scale=0.3 /><div outline=2,#020019>%s %s</div>", PathTool.getItemRes(slot18), slot16, TI18N("创建公会")))
	end

	slot0:setGuildSetInfo(slot0.set_index)
	slot0:setGuildConditionInfo(slot0.condition_index)
	slot0:setGuildConditionInfo2(slot0.condition_index_2)
	slot0:registerEvent()
end

function GuildCreatePanel.registerEvent(slot0)
	slot0.condition_left:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.condition_index == 1 then
				return
			end

			uv0.condition_index = uv0.condition_index - 1

			uv0:setGuildConditionInfo(uv0.condition_index)
		end
	end)
	slot0.condition_right:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.condition_index >= #uv0.condition_list then
				return
			end

			uv0.condition_index = uv0.condition_index + 1

			uv0:setGuildConditionInfo(uv0.condition_index)
		end
	end)
	slot0.condition_left_2:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.condition_index_2 == 1 then
				return
			end

			uv0.condition_index_2 = uv0.condition_index_2 - 1

			uv0:setGuildConditionInfo2(uv0.condition_index_2)
		end
	end)
	slot0.condition_right_2:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.condition_index_2 >= #uv0.condition_list_2 then
				return
			end

			uv0.condition_index_2 = uv0.condition_index_2 + 1

			uv0:setGuildConditionInfo2(uv0.condition_index_2)
		end
	end)
	slot0.set_left:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.set_index == 0 then
				return
			end

			uv0.set_index = uv0.set_index - 1

			uv0:setGuildSetInfo(uv0.set_index)
		end
	end)
	slot0.set_right:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.set_index == 1 then
				return
			end

			uv0.set_index = uv0.set_index + 1

			uv0:setGuildSetInfo(uv0.set_index)
		end
	end)
	slot0.create_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			slot2 = uv0.condition_list[uv0.condition_index]
			slot3 = uv0.condition_list_2[uv0.condition_index_2]

			if uv0.edit_title:getText() == "" then
				message(TI18N("公会名称不能为空"))
			elseif StringUtil.getStrLen(slot4) > 12 then
				message(TI18N("公会名字不得超过6个文字"))
			elseif slot2 and slot3 then
				uv1:requestCreateGuild(slot4, uv0.declaration_value:getText(), uv0.set_index, slot2.lev, slot3)
			end
		end
	end)
end

function GuildCreatePanel.addToParent(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 == true and not slot0.had_fill then
		slot0.had_fill = true

		if Config.GuildData.data_sign_length > 0 and Config.GuildData.data_sign[math.random(1, Config.GuildData.data_sign_length)] ~= nil then
			slot0.declaration_value:setText(slot3.sign)
		end
	end
end

function GuildCreatePanel.setGuildConditionInfo(slot0, slot1)
	if slot0.condition_list[slot1] ~= nil then
		slot0.condition_value:setString(slot2.desc)
	end

	slot3 = 1

	if slot0.condition_status ~= (slot1 == 1 and 1 or slot1 == #slot0.condition_list and 2 or 3) then
		slot0.condition_status = slot3

		if slot3 == 1 then
			slot0.condition_left:setTouchEnabled(false)
			slot0.condition_right:setTouchEnabled(true)
			setChildUnEnabled(true, slot0.condition_left)
			setChildUnEnabled(false, slot0.condition_right)
		elseif slot3 == 2 then
			slot0.condition_left:setTouchEnabled(true)
			slot0.condition_right:setTouchEnabled(false)
			setChildUnEnabled(false, slot0.condition_left)
			setChildUnEnabled(true, slot0.condition_right)
		else
			slot0.condition_left:setTouchEnabled(true)
			slot0.condition_right:setTouchEnabled(true)
			setChildUnEnabled(false, slot0.condition_left)
			setChildUnEnabled(false, slot0.condition_right)
		end
	end
end

function GuildCreatePanel.setGuildConditionInfo2(slot0, slot1)
	if slot0.condition_list_2[slot1] ~= nil then
		slot0.condition_value_2:setString(MoneyTool.GetMoneyString(slot2))
	end

	slot3 = 1

	if slot0.condition_status_2 ~= (slot1 == 1 and 1 or slot1 == #slot0.condition_list_2 and 2 or 3) then
		slot0.condition_status_2 = slot3

		if slot3 == 1 then
			slot0.condition_left_2:setTouchEnabled(false)
			slot0.condition_right_2:setTouchEnabled(true)
			setChildUnEnabled(true, slot0.condition_left_2)
			setChildUnEnabled(false, slot0.condition_right_2)
		elseif slot3 == 2 then
			slot0.condition_left_2:setTouchEnabled(true)
			slot0.condition_right_2:setTouchEnabled(false)
			setChildUnEnabled(false, slot0.condition_left_2)
			setChildUnEnabled(true, slot0.condition_right_2)
		else
			slot0.condition_left_2:setTouchEnabled(true)
			slot0.condition_right_2:setTouchEnabled(true)
			setChildUnEnabled(false, slot0.condition_left_2)
			setChildUnEnabled(false, slot0.condition_right_2)
		end
	end
end

function GuildCreatePanel.initConditionList(slot0)
	slot0.condition_list = {
		{
			index = 1,
			lev = 1,
			desc = TI18N("1级")
		},
		{
			index = 2,
			lev = 10,
			desc = TI18N("10级")
		},
		{
			index = 3,
			lev = 20,
			desc = TI18N("20级")
		},
		{
			index = 4,
			lev = 30,
			desc = TI18N("30级")
		},
		{
			index = 5,
			lev = 40,
			desc = TI18N("40级")
		},
		{
			index = 6,
			lev = 50,
			desc = TI18N("50级")
		},
		{
			index = 7,
			lev = 60,
			desc = TI18N("60级")
		}
	}

	if Config.GuildData.data_const.guild_limit_power_choice then
		slot0.condition_list_2 = slot1.val
	else
		slot0.condition_list_2 = {
			0,
			50000,
			100000,
			200000,
			400000,
			800000,
			1500000,
			3000000
		}
	end
end

function GuildCreatePanel.setGuildSetInfo(slot0, slot1)
	if slot1 == 0 then
		slot0.set_value:setString(TI18N("不需要验证"))
		slot0.set_left:setTouchEnabled(false)
		slot0.set_right:setTouchEnabled(true)
		setChildUnEnabled(true, slot0.set_left)
		setChildUnEnabled(false, slot0.set_right)
	elseif slot1 == 1 then
		slot0.set_value:setString(TI18N("需要验证"))
		slot0.set_left:setTouchEnabled(true)
		slot0.set_right:setTouchEnabled(false)
		setChildUnEnabled(false, slot0.set_left)
		setChildUnEnabled(true, slot0.set_right)
	end
end

function GuildCreatePanel.DeleteMe(slot0)
end
