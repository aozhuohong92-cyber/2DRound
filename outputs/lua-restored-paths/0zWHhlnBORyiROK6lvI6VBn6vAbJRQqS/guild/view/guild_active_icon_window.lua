slot1 = GuildController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format
slot5 = cc.c4b(36, 144, 3, 255)
slot6 = cc.c4b(100, 50, 35, 255)
slot7 = cc.c4b(186, 28, 12, 255)
GuildActiveIconWindow = GuildActiveIconWindow or BaseClass(BaseView)

function GuildActiveIconWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "guild/guild_active_icon_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildactive", "guildactive"),
			type = ResourcesType.plist
		}
	}
end

function GuildActiveIconWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("选择光环"))

	slot0.close_btn = slot1:getChildByName("close_btn")

	slot0.close_btn:getChildByName("label"):setString(TI18N("取消"))

	slot0.confirm_btn = slot1:getChildByName("confirm_btn")

	slot0.confirm_btn:getChildByName("label"):setString(TI18N("幻化"))

	slot2 = slot1:getChildByName("item_list")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 5,
		item_width = 139,
		start_x = 5,
		space_x = 10,
		row = 1,
		item_height = 169,
		space_y = 10,
		col = 4,
		need_dynamic = true,
		item_class = GuildActiveIconItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function GuildActiveIconWindow.onClickCallBack(slot0, slot1)
	if slot0.cur_icon_item then
		slot0.cur_icon_item:setIsSelect(false)
	end

	slot0.cur_icon_item = slot1

	slot0.cur_icon_item:setIsSelect(true)
end

function GuildActiveIconWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.confirm_btn, handler(slot0, slot0.onClickConfirmBtn), true)
end

function GuildActiveIconWindow.onClickCloseBtn(slot0)
	uv0:openGuildActiveIconWindow(false)
end

function GuildActiveIconWindow.onClickConfirmBtn(slot0)
	if slot0.cur_icon_item then
		if slot0.cur_icon_item:getIconId() then
			SysEnv:getInstance():saveGuildActiveIconId(slot1)
			GlobalEvent:getInstance():Fire(GuildEvent.UpdateActiveIconEvent, slot1)
		end

		uv0:openGuildActiveIconWindow(false)
	else
		message(TI18N("请先选择一种光环"))
	end
end

function GuildActiveIconWindow.openRootWnd(slot0)
	slot0:setData()
end

function GuildActiveIconWindow.setData(slot0)
	slot0.active_icon_data = {}

	for slot5, slot6 in ipairs(Config.GuildQuestData.data_max_lev) do
		uv0(slot0.active_icon_data, {
			icon_id = slot5,
			open_lv = slot6,
			is_chose = slot5 == SysEnv:getInstance():loadGuildActiveIconId()
		})
	end

	uv1(slot0.active_icon_data, SortTools.KeyLowerSorter("icon_id"))
	slot0.item_scrollview:setData(slot0.active_icon_data, handler(slot0, slot0.onClickCallBack))
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			if slot5:getIconId() == uv1 then
				uv0:onClickCallBack(slot5)

				break
			end
		end
	end)
end

function GuildActiveIconWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openGuildActiveIconWindow(false)
end

GuildActiveIconItem = class("GuildActiveIconItem", function ()
	return ccui.Layout:create()
end)

function GuildActiveIconItem.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()
end

function GuildActiveIconItem.configUI(slot0)
	slot0.size = cc.size(139, 169)

	slot0:setAnchorPoint(cc.p(0, 0))
	slot0:setTouchEnabled(false)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.container = ccui.Layout:create()

	slot0.container:setContentSize(slot0.size)
	slot0.container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.container:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0.container:setTouchEnabled(true)
	slot0.container:setSwallowTouches(false)
	slot0:addChild(slot0.container)

	slot0.icon_bg_sp = createSprite(PathTool.getResFrame("guildactive", "guildactive_1002"), slot0.size.width * 0.5, slot0.size.height * 0.5 + 15, slot0.container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot0.icon_sp = createSprite(nil, slot0.size.width * 0.5, slot0.size.height * 0.5 + 15, slot0.container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot0.state_txt = createLabel(22, 274, nil, slot0.size.width * 0.5, 15, "", slot0.container, nil, cc.p(0.5, 0.5))
end

function GuildActiveIconItem.registerEvent(slot0)
	registerButtonEventListener(slot0.container, handler(slot0, slot0.onClickItem), true)
end

function GuildActiveIconItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function GuildActiveIconItem.onClickItem(slot0)
	if not slot0.data or slot0.select_status == true then
		return
	end

	if slot0.is_lock == true then
		message(uv0(TI18N("公会活跃等级达到%s级激活"), slot0.data.open_lv))

		return
	end

	if slot0.callback then
		slot0:callback()
	end
end

function GuildActiveIconItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	loadSpriteTexture(slot0.icon_sp, PathTool.getResFrame("guildactive", "guildactive_icon_" .. slot1.icon_id), LOADTEXT_TYPE_PLIST)

	if slot1.is_chose == true then
		if not slot0.chose_shadow then
			slot0.chose_shadow = ccui.Layout:create()

			slot0.chose_shadow:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.chose_shadow:setContentSize(cc.size(139, 139))
			slot0.chose_shadow:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5 + 15)
			showLayoutRect(slot0.chose_shadow, 120)
			slot0.container:addChild(slot0.chose_shadow)

			slot3 = createSprite(PathTool.getResFrame("common", "common_1043"), 69.5, 69.5, slot0.chose_shadow, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
		end

		slot0.chose_shadow:setVisible(true)
	elseif slot0.chose_shadow then
		slot0.chose_shadow:setVisible(false)
	end

	slot0.is_lock = false
	slot3 = uv0:getGuildActiveLev()

	if slot1.is_chose == true then
		slot0.state_txt:setString(TI18N("幻化中"))
		slot0.state_txt:setTextColor(uv1)
	elseif slot1.open_lv <= slot3 then
		slot0.state_txt:setString(TI18N("已激活"))
		slot0.state_txt:setTextColor(uv2)
	else
		slot0.is_lock = true

		slot0.state_txt:setString(TI18N(slot1.open_lv .. "级激活"))
		slot0.state_txt:setTextColor(uv3)
	end

	setChildUnEnabled(slot0.is_lock, slot0.icon_bg_sp)
	setChildUnEnabled(slot0.is_lock, slot0.icon_sp)
end

function GuildActiveIconItem.setIsSelect(slot0, slot1)
	slot0.select_status = slot1

	if slot1 == true then
		if not slot0.select_img then
			slot0.select_img = createImage(slot0.container, PathTool.getResFrame("common", "common_90019"), slot0.size.width * 0.5, slot0.size.height * 0.5 + 15, cc.p(0.5, 0.5), true, 1, true)

			slot0.select_img:setContentSize(cc.size(149, 149))
		end

		slot0.select_img:setVisible(true)
	elseif slot0.select_img then
		slot0.select_img:setVisible(false)
	end
end

function GuildActiveIconItem.getIconId(slot0)
	if slot0.data then
		return slot0.data.icon_id
	end
end

function GuildActiveIconItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
