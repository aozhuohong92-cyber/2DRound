GuildRequestItem = class("GuildRequestItem", function ()
	return ccui.Layout:create()
end)
slot0 = GuildController:getInstance()
slot1 = string.format
slot2 = math.floor

function GuildRequestItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guild/guild_list_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.request_btn = slot1:getChildByName("request_btn")
	slot0.request_btn_label = slot0.request_btn:getChildByName("label")

	slot0.request_btn_label:setString(TI18N("申请加入"))

	slot0.condition_desc = slot1:getChildByName("condition_desc")
	slot0.limit_level = slot1:getChildByName("limit_level")
	slot0.limit_power = slot1:getChildByName("limit_power")
	slot0.guild_name = slot1:getChildByName("guild_name")
	slot0.guild_lev = slot1:getChildByName("guild_lev")
	slot0.leader_value = slot1:getChildByName("leader_value")
	slot0.member_value = slot1:getChildByName("member_value")

	slot1:getChildByName("member_title"):setString(TI18N("人数："))

	slot0.btn_res_id = PathTool.getResFrame("common", "common_1018")

	slot0:registerEvent()
end

function GuildRequestItem.registerEvent(slot0)
	slot0.request_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data ~= nil then
				if uv0.data.is_apply == TRUE then
					uv1:requestJoinGuild(uv0.data.gid, uv0.data.gsrv_id, 2)
				else
					uv1:requestJoinGuild(uv0.data.gid, uv0.data.gsrv_id, 1)
				end
			end
		end
	end)
end

function GuildRequestItem.setData(slot0, slot1)
	if slot0.data ~= nil and slot0.update_self_event ~= nil then
		slot0.data:UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	if slot1 ~= nil then
		slot0.data = slot1

		if slot0.update_self_event == nil then
			slot0.update_self_event = slot0.data:Bind(GuildEvent.UpdateGuildItemEvent, function (slot0, slot1)
				if slot0 == "is_apply" then
					uv0:setApplyStatus()
				end
			end)
		end

		slot0.guild_name:setString(slot1.name)
		slot0.guild_lev:setString(string.format(TI18N("(%s级)"), slot1.lev))
		slot0.leader_value:setString(string.format(TI18N("会长：%s"), slot1.leader_name))
		slot0:setApplyStatus()
		slot0.member_value:setString(string.format("%s/%s", slot1.members_num, slot1.members_max))

		if slot1.members_max <= slot1.members_num then
			setChildUnEnabled(true, slot0.request_btn)
			slot0.condition_desc:setString("")
			slot0.request_btn:setTouchEnabled(false)
			slot0.request_btn_label:setString(TI18N("满人"))
			slot0.request_btn_label:disableEffect()
			slot0.member_value:setTextColor(Config.ColorData.data_color4[183])
		else
			slot0.member_value:setTextColor(cc.c4b(36, 144, 3, 255))
		end

		slot0.guild_lev:setPositionX(slot0.guild_name:getPositionX() + slot0.guild_name:getContentSize().width + 5)
	end
end

function GuildRequestItem.setApplyStatus(slot0)
	if slot0.data == nil then
		return
	end

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	slot2 = slot0.data
	slot0.is_ok = true

	slot0:updateLimitInfo(slot2)

	if slot2.is_apply == TRUE then
		setChildUnEnabled(false, slot0.request_btn)
		slot0.request_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
		slot0.request_btn_label:setString(TI18N("取消"))

		if slot0.btn_res_id ~= PathTool.getResFrame("common", "common_1027") then
			slot0.btn_res_id = PathTool.getResFrame("common", "common_1027")

			slot0.request_btn:loadTexture(slot0.btn_res_id, LOADTEXT_TYPE_PLIST)
		end

		if slot2.apply_type == 2 then
			slot0.request_btn:setTouchEnabled(true)
			slot0.condition_desc:setTextColor(Config.ColorData.data_color4[183])
			slot0.condition_desc:setString(TI18N("公会不允许加入"))
		else
			if not slot0.is_ok then
				slot0.request_btn:setTouchEnabled(false)
			else
				slot0.request_btn:setTouchEnabled(true)
			end

			slot0.condition_desc:setString("")
		end
	else
		if slot0.btn_res_id ~= PathTool.getResFrame("common", "common_1098") then
			slot0.btn_res_id = PathTool.getResFrame("common", "common_1098")

			slot0.request_btn:loadTexture(slot0.btn_res_id, LOADTEXT_TYPE_PLIST)
		end

		if slot2.apply_type == 2 then
			setChildUnEnabled(true, slot0.request_btn)
			slot0.request_btn_label:disableEffect()
			slot0.request_btn:setTouchEnabled(false)
			slot0.request_btn_label:setString(TI18N("申请"))
			slot0.condition_desc:setTextColor(Config.ColorData.data_color4[183])
			slot0.condition_desc:setString(TI18N("公会不允许加入"))
		else
			if not slot0.is_ok then
				setChildUnEnabled(true, slot0.request_btn)
				slot0.request_btn_label:disableEffect()
				slot0.request_btn:setTouchEnabled(false)
				slot0.request_btn_label:setString(TI18N("申请"))
			else
				setChildUnEnabled(false, slot0.request_btn)
				slot0.request_btn_label:enableOutline(Config.ColorData.data_color4[263], 2)
				slot0.request_btn:setTouchEnabled(true)
				slot0.request_btn_label:setString(TI18N("申请"))
			end

			slot0.condition_desc:setString("")
		end
	end
end

function GuildRequestItem.updateLimitInfo(slot0, slot1)
	if not slot1 then
		return
	end

	if not RoleController:getInstance():getRoleVo() then
		return
	end

	if slot1.apply_lev <= 1 then
		slot0.limit_level:setVisible(false)
	else
		slot0.limit_level:setVisible(true)
		slot0.limit_level:setString(uv0(TI18N("等级: %s级"), slot1.apply_lev))

		if slot2 and slot1.apply_lev <= slot2.lev then
			slot0.limit_level:setTextColor(cc.c3b(36, 144, 3))
		else
			slot0.limit_level:setTextColor(cc.c3b(217, 80, 20))

			slot0.is_ok = false
		end
	end

	if slot1.apply_power == 0 then
		slot0.limit_power:setVisible(false)
	else
		slot0.limit_power:setVisible(true)
		slot0.limit_power:setString(uv0(TI18N("战力: %s万"), uv1(slot1.apply_power / 10000)))

		if slot2 and slot1.apply_power <= slot2.power then
			slot0.limit_power:setTextColor(cc.c3b(36, 144, 3))
		else
			slot0.limit_power:setTextColor(cc.c3b(217, 80, 20))

			slot0.is_ok = false
		end
	end
end

function GuildRequestItem.suspendAllActions(slot0)
	if slot0.data ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end
end

function GuildRequestItem.DeleteMe(slot0)
	if slot0.data ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
