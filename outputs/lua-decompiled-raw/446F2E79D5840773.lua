GuildListPanel = class("GuildListPanel", function ()
	return ccui.Layout:create()
end)
slot0 = GuildController:getInstance()

function GuildListPanel.ctor(slot0, slot1)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guild/guild_list_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.empty_tips = slot0.root_wnd:getChildByName("empty_tips")
	slot0.desc = slot0.empty_tips:getChildByName("desc")

	slot0.desc:setString(TI18N("暂无任何公会信息"))

	slot0.scroll_container = slot0.root_wnd:getChildByName("background")
	slot0.checkbox = slot0.root_wnd:getChildByName("checkbox")

	slot0.checkbox:setScale(0.8)
	slot0.checkbox:getChildByName("name"):setString(TI18N("只看未满人公会"))
	slot0.checkbox:setSelected(false)
	slot0:registerEvent()
end

function GuildListPanel.registerEvent(slot0)
	if slot0.update_guild_list_event == nil then
		slot0.update_guild_list_event = GlobalEvent:getInstance():Bind(GuildEvent.UpdateGuildList, function (slot0, slot1)
			if slot0 ~= GuildConst.list_type.total then
				return
			end

			uv0.all_list = slot1 or {}

			uv0:filterNotFullList()
		end)
	end

	slot0.checkbox:addEventListener(function (slot0, slot1)
		playButtonSound2()
		uv0:filterNotFullList()
	end)
end

function GuildListPanel.addToParent(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 == true then
		if slot0.scroll_view == nil then
			uv0:requestGuildList()
		end

		if slot0.desc == nil and RoleController:getInstance():getRoleVo() ~= nil then
			slot4 = 43200

			if Config.GuildData.data_const.guild_quit_cd then
				slot4 = slot3.val
			end

			if slot4 > GameNet:getInstance():getTime() - slot2.guild_quit_time then
				slot0.desc = createRichLabel(24, 175, cc.p(1, 0.5), cc.p(628, 784), nil, , 400)

				slot0.root_wnd:addChild(slot0.desc)
				slot0.desc:setString(string.format(TI18N("<div fontcolor=#249003>%s</div>后才可以再次申请入会"), TimeTool.GetTimeFormatTwo(slot4 - slot5)))
			end
		end
	end
end

function GuildListPanel.filterNotFullList(slot0)
	if not slot0.all_list then
		return
	end

	slot2 = nil

	if slot0.checkbox:isSelected() then
		if slot0.filter_list == nil then
			slot0.filter_list = {}

			for slot7, slot8 in ipairs(slot0.all_list) do
				if slot8.members_num < slot8.members_max then
					table.insert(slot0.filter_list, slot8)
				end
			end
		end

		slot2 = slot0.filter_list
	else
		slot2 = slot0.all_list
	end

	slot0:updateGuildList(slot2)
end

function GuildListPanel.updateGuildList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		slot0.empty_tips:setVisible(true)
	else
		slot0.empty_tips:setVisible(false)

		if slot0.scroll_view == nil then
			slot2 = slot0.scroll_container:getContentSize()
			slot0.scroll_view = CommonScrollViewLayout.new(slot0.scroll_container, cc.p(0, 5), nil, , cc.size(slot2.width, slot2.height - 10), {
				start_y = 0,
				item_width = 616,
				start_x = 4,
				space_x = 4,
				row = 0,
				item_height = 134,
				space_y = 6,
				col = 1,
				need_dynamic = true,
				item_class = GuildRequestItem
			})
		end

		slot0.scroll_view:setData(slot1)
	end
end

function GuildListPanel.DeleteMe(slot0)
	if slot0.update_guild_list_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_guild_list_event)

		slot0.update_guild_list_event = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end
