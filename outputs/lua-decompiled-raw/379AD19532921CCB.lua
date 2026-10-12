GuildChangeNameWindow = GuildChangeNameWindow or BaseClass(BaseView)
slot0 = GuildController:getInstance()
slot1 = GuildController:getInstance():getModel()
slot2 = string.format

function GuildChangeNameWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.set_index = 1
	slot0.condition_index = 1
	slot0.layout_name = "guild/guild_change_name_window"
end

function GuildChangeNameWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot0.cost_value = slot1:getChildByName("cost_value")
	slot0.edit_title = createEditBox(slot1, PathTool.getResFrame("common", "common_99998"), cc.size(307, 50), nil, 22, Config.ColorData.data_color4[151], 22, TI18N("公会名字最多六个字"), nil, , LOADTEXT_TYPE_PLIST)

	slot0.edit_title:setAnchorPoint(cc.p(0, 0.5))
	slot0.edit_title:setPlaceholderFontColor(Config.ColorData.data_color4[151])
	slot0.edit_title:setFontColor(Config.ColorData.data_color4[175])
	slot0.edit_title:setPosition(cc.p(220, 232))
	slot0.edit_title:setMaxLength(12)
	slot0.confirm_btn:getChildByName("label"):setString(TI18N("确定"))
	slot1:getChildByName("win_title"):setString(TI18N("公会改名"))
	slot1:getChildByName("notice"):setString(TI18N("公会大名："))
	slot1:getChildByName("cost_title"):setString(TI18N("改名消耗："))

	slot7 = slot1:getChildByName("item_img")

	slot7:setScale(0.35)
	loadSpriteTexture(slot7, PathTool.getItemRes(Config.ItemData.data_get_data(3).icon), LOADTEXT_TYPE)
end

function GuildChangeNameWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openGuildChangeNameWindow(false)
		end
	end)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.role_vo ~= nil then
				if uv0.edit_title:getText() == "" then
					message(TI18N("公会名字不能为空！"))
				elseif slot2 == uv0.role_vo.gname then
					message(TI18N("公会名字不能与当前一样！"))
				else
					uv1:requestChangGuildName(slot2)
				end
			end
		end
	end)
end

function GuildChangeNameWindow.openRootWnd(slot0)
	slot1 = Config.GuildData.data_const.rename_gold

	if slot0.role_vo == nil then
		slot0.role_vo = RoleController:getInstance():getRoleVo()
	end

	if slot1 ~= nil and slot0.role_vo ~= nil then
		if slot0.role_vo.gold + slot0.role_vo.red_gold < slot1.val then
			-- Nothing
		end

		slot0.cost_value:setString(string.format("%s/%s", MoneyTool.GetMoneyString(slot2), slot1.val))
	end
end

function GuildChangeNameWindow.close_callback(slot0)
	uv0:openGuildChangeNameWindow(false)
end
