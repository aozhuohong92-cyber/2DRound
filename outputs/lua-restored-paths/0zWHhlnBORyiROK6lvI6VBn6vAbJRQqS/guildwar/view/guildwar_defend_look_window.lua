GuildwarDefendLookWindow = GuildwarDefendLookWindow or BaseClass(BaseView)
slot1 = GuildwarController:getInstance():getModel()

function GuildwarDefendLookWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildwar", "guildwar"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "guildwar/guildwar_defend_look_window"
end

function GuildwarDefendLookWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("win_title"):setString(TI18N("防守记录"))
	slot1:getChildByName("title_label_1"):setString(TI18N("据点防守阵容"))
	slot1:getChildByName("title_label_2"):setString(TI18N("防守录像"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.no_vedio_image = slot1:getChildByName("no_vedio_image")
	slot0.no_vedio_label = slot1:getChildByName("no_vedio_label")
	slot0.time_label = slot1:getChildByName("time_label")
	slot0.list_panel = slot1:getChildByName("list_panel")

	slot0.time_label:setString(Config.GuildWarData.data_const.time_desc.desc or "")

	slot6 = slot0.list_panel:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.list_panel, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot6.width, slot6.height - 8), {
		start_y = 0,
		item_width = 616,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 218,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = GuildwarDefendLookItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function GuildwarDefendLookWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openDefendLookWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openDefendLookWindow(false)
		end
	end)
end

function GuildwarDefendLookWindow.setData(slot0, slot1)
	slot1 = slot1 or {}

	if not slot0.enemy_battle_array_panel then
		slot0.enemy_battle_array_panel = GuildwarBattleArrayPanel.new()
		slot2 = slot0.container:getContentSize()

		slot0.container:addChild(slot0.enemy_battle_array_panel)
		slot0.enemy_battle_array_panel:setPanelContentSize(cc.size(616, 190))
		slot0.enemy_battle_array_panel:setPosition(cc.p(87, 625))
	end

	slot2 = {}
	slot3 = {}

	for slot7, slot8 in pairs(slot1.defense) do
		table.insert(slot3, slot8)
	end

	slot2.partner_list = slot3
	slot2.power = slot1.power
	slot2.formation_type = slot1.formation_type
	slot2.formation_lev = slot1.formation_lev

	slot0.enemy_battle_array_panel:setData(slot2)

	if slot1.guild_war_role_log and next(slot1.guild_war_role_log) ~= nil then
		slot0.item_scrollview:setData(slot1.guild_war_role_log)
		slot0.no_vedio_image:setVisible(false)
		slot0.no_vedio_label:setVisible(false)
	else
		slot0.no_vedio_image:setVisible(true)
		slot0.no_vedio_label:setVisible(true)
	end
end

function GuildwarDefendLookWindow.openRootWnd(slot0, slot1, slot2, slot3)
	uv0:requestPositionDefendData(slot1, slot2, slot3)
end

function GuildwarDefendLookWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.enemy_battle_array_panel then
		slot0.enemy_battle_array_panel:DeleteMe()

		slot0.enemy_battle_array_panel = nil
	end

	uv0:openDefendLookWindow(false)
end

GuildwarDefendLookItem = class("GuildwarDefendLookItem", function ()
	return ccui.Widget:create()
end)

function GuildwarDefendLookItem.ctor(slot0)
	slot0.ctrl = GuildwarController:getInstance()
	slot0.hero_item_list = {}

	slot0:configUI()
	slot0:register_event()
end

function GuildwarDefendLookItem.configUI(slot0)
	slot0.size = cc.size(616, 218)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("guildwar/guildwar_defend_look_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.name_label = slot0.container:getChildByName("name_label")
	slot0.time_label = slot0.container:getChildByName("time_label")
	slot0.attk_label = slot0.container:getChildByName("attk_label")
	slot0.result_label = slot0.container:getChildByName("result_label")
	slot0.magic_label = slot0.container:getChildByName("magic_label")
	slot0.diff_label = slot0.container:getChildByName("diff_label")
	slot0.vedio_btn = slot0.container:getChildByName("vedio_btn")
	slot0.role_list = slot0.container:getChildByName("role_list")

	slot0.role_list:setTouchEnabled(false)

	slot2 = slot0.role_list:getContentSize()
	slot0.scroll_view_size = cc.size(slot2.width - 10, slot2.height)
	slot0.scroll_view = createScrollView(slot0.scroll_view_size.width, slot0.scroll_view_size.height, 8, 0, slot0.role_list, ccui.ScrollViewDir.horizontal)

	slot0.scroll_view:setSwallowTouches(false)
end

function GuildwarDefendLookItem.register_event(slot0)
	slot0.vedio_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.data.repaly_id then
				BattleController:getInstance():csRecordBattle(uv0.data.repaly_id)
			end
		end
	end)
end

function GuildwarDefendLookItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.name_label:setString(string.format(TI18N("挑战者：%s"), slot1.name))
	slot0.attk_label:setString(string.format(TI18N("战力：%d"), slot1.power))
	slot0.time_label:setString(TimeTool.getYMDHMS(slot1.time))

	if Config.FormationData.data_form_data[slot1.formation_type] then
		slot0.magic_label:setString(string.format("%s Lv.%d", slot2.name, slot1.formation_lev or 1))
	end

	if slot1.result == TRUE then
		slot0.result_label:setString(TI18N("挑战失败"))
		slot0.result_label:setTextColor(cc.c4b(217, 80, 20, 255))
	else
		slot0.result_label:setString(TI18N("挑战成功"))
		slot0.result_label:setTextColor(cc.c4b(36, 144, 3, 255))
	end

	if slot1.hp == 1 then
		slot0.diff_label:setString(TI18N("[简单]"))
	elseif slot1.hp == 2 then
		slot0.diff_label:setString(TI18N("[普通]"))
	elseif slot1.hp == 3 then
		slot0.diff_label:setString(TI18N("[困难]"))
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot1.defense) do
		slot9 = HeroVo.New()

		slot9:updateHeroVo(slot8)
		table.insert(slot3, slot9)
	end

	slot5 = #slot3
	slot12 = cc.size

	slot0.scroll_view:setInnerContainerSize(slot12(math.max(slot5 * HeroExhibitionItem.Width * 0.77 + (slot5 - 1) * 6, slot0.scroll_view_size.width), slot0.scroll_view_size.height))

	for slot12, slot13 in ipairs(slot3) do
		slot14 = HeroExhibitionItem.new(slot4, false)

		slot14:setPosition(0 + HeroExhibitionItem.Width * slot4 * 0.5 + (slot12 - 1) * (HeroExhibitionItem.Width * slot4 + 6), slot0.scroll_view_size.height * 0.5)
		slot14:setData(slot13, nil, is_spec)
		table.insert(slot0.hero_item_list, slot14)
		slot0.scroll_view:addChild(slot14)
	end
end

function GuildwarDefendLookItem.DeleteMe(slot0)
	for slot4, slot5 in pairs(slot0.hero_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end
end
