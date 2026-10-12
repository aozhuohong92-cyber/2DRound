GuildSearchPanel = class("GuildSearchPanel", function ()
	return ccui.Layout:create()
end)
slot0 = GuildController:getInstance()

function GuildSearchPanel.ctor(slot0, slot1)
	slot0.panel_index = 1
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guild/guild_search_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.background = slot0.root_wnd:getChildByName("background")
	slot0.background_width = slot0.background:getContentSize().width
	slot0.search_container = slot0.root_wnd:getChildByName("search_container")

	slot0.search_container:getChildByName("desc"):setString(TI18N("请输入完整公会名或关键词"))

	slot0.search_btn = slot0.search_container:getChildByName("search_btn")

	slot0.search_btn:getChildByName("label"):setString(TI18N("查找"))

	slot0.guild_value = createEditBox(slot0.search_container, PathTool.getResFrame("common", "common_99998"), cc.size(327, 50), nil, 18, Config.ColorData.data_color4[1], 22, TI18N("请输入需要查找的内容"), nil, , LOADTEXT_TYPE_PLIST)

	slot0.guild_value:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.guild_value:setPlaceholderFontColor(Config.ColorData.data_color4[151])
	slot0.guild_value:setFontColor(Config.ColorData.data_color4[151])
	slot0.guild_value:setPosition(cc.p(311, 113))
	slot0.guild_value:setMaxLength(20)

	slot0.list_container = slot0.root_wnd:getChildByName("list_container")
	slot0.return_btn = slot0.list_container:getChildByName("return_btn")

	slot0.return_btn:getChildByName("label"):setString(TI18N("返回搜索"))

	slot0.notice_container = slot0.root_wnd:getChildByName("notice_container")

	slot0.notice_container:getChildByName("desc"):setString(TI18N("抱歉，查找不到对应的公会，试试别的名字吧！"))

	slot0.notice_btn = slot0.notice_container:getChildByName("notice_btn")

	slot0.notice_btn:getChildByName("label"):setString(TI18N("返回搜索"))
	slot0:registerEvent()
end

function GuildSearchPanel.registerEvent(slot0)
	slot0.search_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.guild_value:getText() == "" then
				message(TI18N("公会名字不得为空"))
			else
				uv1:requestGuildList(nil, , , slot2)
			end
		end
	end)
	slot0.return_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:changeViewStatus(1)
		end
	end)
	slot0.notice_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:changeViewStatus(1)
		end
	end)

	if slot0.update_guild_list_event == nil then
		slot0.update_guild_list_event = GlobalEvent:getInstance():Bind(GuildEvent.UpdateGuildList, function (slot0, slot1)
			if slot0 ~= GuildConst.list_type.search then
				return
			end

			uv0:updateGuildList(slot1)
		end)
	end
end

function GuildSearchPanel.addToParent(slot0, slot1)
	slot0:setVisible(slot1)
end

function GuildSearchPanel.changeViewStatus(slot0, slot1)
	if slot0.panel_index == slot1 then
		return
	end

	slot0.panel_index = slot1

	slot0.search_container:setVisible(slot0.panel_index == 1)
	slot0.list_container:setVisible(slot0.panel_index == 2)
	slot0.notice_container:setVisible(slot0.panel_index == 3)

	if slot0.panel_index == 1 then
		slot0.background:setContentSize(slot0.background_width, 780)
	else
		slot0.background:setContentSize(slot0.background_width, 702)
	end
end

function GuildSearchPanel.checkIsInListStatus(slot0)
	return slot0.panel_index == 2
end

function GuildSearchPanel.changeToSearchListStatus(slot0)
	slot0:changeViewStatus(1)
end

function GuildSearchPanel.updateGuildList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		slot0:changeViewStatus(3)
	else
		if slot0.scroll_view == nil then
			slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_container, nil, , , slot0.list_container:getContentSize(), {
				start_y = 0,
				item_width = 616,
				start_x = 4,
				space_x = 4,
				row = 0,
				item_height = 134,
				space_y = -3,
				col = 1,
				item_class = GuildRequestItem
			})
		end

		slot0.scroll_view:setData(slot1)
		slot0:changeViewStatus(2)
	end
end

function GuildSearchPanel.DeleteMe(slot0)
	if slot0.update_guild_list_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_guild_list_event)

		slot0.update_guild_list_event = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end
