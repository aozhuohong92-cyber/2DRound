GuildApplySetWindow = GuildApplySetWindow or BaseClass(BaseView)
slot0 = GuildController:getInstance()
slot1 = GuildController:getInstance():getModel()
slot2 = string.format

function GuildApplySetWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.set_index = 1
	slot0.condition_index = 1
	slot0.condition_index_2 = 1
	slot0.layout_name = "guild/guild_apply_set_window"

	slot0:initConditionList()
end

function GuildApplySetWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot0.recruit_btn = slot1:getChildByName("recruit_btn")
	slot0.set_value = slot1:getChildByName("set_value")
	slot0.condition_value = slot1:getChildByName("condition_value")
	slot0.condition_left = slot1:getChildByName("condition_left")
	slot0.condition_right = slot1:getChildByName("condition_right")
	slot0.condition_value_2 = slot1:getChildByName("condition_value_2")
	slot0.condition_left_2 = slot1:getChildByName("condition_left_2")
	slot0.condition_right_2 = slot1:getChildByName("condition_right_2")
	slot0.set_left = slot1:getChildByName("set_left")
	slot0.set_right = slot1:getChildByName("set_right")

	slot1:getChildByName("win_title"):setString(TI18N("入会设置"))
	slot1:getChildByName("set_title"):setString(TI18N("验证设置："))
	slot1:getChildByName("condition_title"):setString(TI18N("入会要求："))
	slot1:getChildByName("condition_title_2"):setString(TI18N("战力要求："))
	slot0.recruit_btn:getChildByName("label"):setString(TI18N("发布招募"))
	slot0.confirm_btn:getChildByName("label"):setString(TI18N("确定"))
end

function GuildApplySetWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openGuildApplySetWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openGuildApplySetWindow(false)
		end
	end)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			slot3 = uv0.condition_list_2[uv0.condition_index_2]

			if uv0.condition_list[uv0.condition_index] and slot3 then
				uv1:requestChangeApplySet(uv0.set_index, slot2.lev, slot3)
			end
		end
	end)
	slot0.recruit_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openGuildApplySetWindow(false)
			uv0:requestGuildRecruit()
		end
	end)
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
end

function GuildApplySetWindow.openRootWnd(slot0)
	if uv0:getMyGuildInfo() ~= nil then
		slot0.set_index = slot1.apply_type

		slot0:setGuildSetInfo(slot0.set_index)

		for slot6, slot7 in ipairs(slot0.condition_list) do
			if slot7.lev == slot1.apply_lev then
				slot0.condition_index = slot6

				break
			end
		end

		slot0:setGuildConditionInfo(slot0.condition_index)

		for slot7, slot8 in ipairs(slot0.condition_list_2) do
			if slot8 == slot1.apply_power then
				slot0.condition_index_2 = slot7

				break
			end
		end

		slot0:setGuildConditionInfo2(slot0.condition_index_2)
	end
end

function GuildApplySetWindow.setGuildConditionInfo(slot0, slot1)
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

function GuildApplySetWindow.setGuildConditionInfo2(slot0, slot1)
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

function GuildApplySetWindow.initConditionList(slot0)
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

function GuildApplySetWindow.setGuildSetInfo(slot0, slot1)
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

function GuildApplySetWindow.close_callback(slot0)
	uv0:openGuildApplySetWindow(false)
end
