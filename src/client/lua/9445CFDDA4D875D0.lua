GuildwarBattleArrayPanel = class("GuildwarBattleArrayPanel", function ()
	return ccui.Widget:create()
end)
slot1 = GuildwarController:getInstance():getModel()

function GuildwarBattleArrayPanel.ctor(slot0)
	slot0.hero_item_list = {}

	slot0:configUI()
	slot0:register_event()
end

function GuildwarBattleArrayPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guildwar/guildwar_battle_array_panel"))

	slot0.root_wnd:setPosition(0, 0)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1
	slot0.bg_image = slot1:getChildByName("image_1")
	slot0.titile_bg = slot1:getChildByName("titile_bg")

	slot1:getChildByName("title_label"):setString(TI18N("对方阵容"))

	slot0.form_image = slot1:getChildByName("form_image")
	slot0.form_label = slot1:getChildByName("form_label")
	slot0.scrollCon = slot1:getChildByName("scrollCon")
	slot3 = slot1:getChildByName("image_2")
	slot4 = slot3:getContentSize()
	slot0.power = CommonNum.new(20, slot3, 0, 1, cc.p(0.5, 0.5))

	slot0.power:setPosition(slot4.width / 2, slot4.height - 7)

	slot5 = slot0.scrollCon:getContentSize()
	slot0.scroll_view_size = cc.size(slot5.width - 10, slot5.height)
	slot0.scroll_view = createScrollView(slot0.scroll_view_size.width, slot0.scroll_view_size.height, 8, 0, slot0.scrollCon, ccui.ScrollViewDir.horizontal)
end

function GuildwarBattleArrayPanel.setData(slot0, slot1, slot2)
	slot0.power:setNum((slot1 or {}).power or 0)

	slot3 = {}

	for slot7, slot8 in pairs(slot1.partner_list) do
		slot9 = HeroVo.New()

		slot9:updateHeroVo(slot8)
		table.insert(slot3, slot9)
	end

	slot4 = #slot3
	slot12 = cc.size

	slot0.scroll_view:setInnerContainerSize(slot12(math.max(slot4 * HeroExhibitionItem.Width * 0.87 + (slot4 - 1) * 6, slot0.scroll_view_size.width), slot0.scroll_view_size.height))

	for slot12, slot13 in ipairs(slot3) do
		slot14 = HeroExhibitionItem.new(slot5, false)

		slot14:setPosition(0 + HeroExhibitionItem.Width * slot5 * 0.5 + (slot12 - 1) * (HeroExhibitionItem.Width * slot5 + 6), slot0.scroll_view_size.height * 0.5)
		slot14:setData(slot13, nil, slot2)

		if slot13.rare_type and slot13.rare_type > 0 then
			slot14:showRareType(slot13.rare_type)
		end

		table.insert(slot0.hero_item_list, slot14)
		slot0.scroll_view:addChild(slot14)
	end

	if slot1.formation_type then
		if Config.FormationData.data_form_data[slot1.formation_type] then
			slot10 = slot1.formation_lev or 1

			slot0.form_label:setString(slot9.name)
		end

		slot0.form_label:setVisible(true)
		slot0.form_image:setVisible(true)
		slot0.form_image:loadTexture(PathTool.getResFrame("form", "form_icon_" .. slot1.formation_type), LOADTEXT_TYPE_PLIST)
	else
		slot0.form_label:setVisible(false)
		slot0.form_image:setVisible(false)
	end
end

function GuildwarBattleArrayPanel.setPanelContentSize(slot0, slot1)
	slot0:setContentSize(slot1)
	slot0.container:setContentSize(slot1)
	slot0.bg_image:setContentSize(slot1)
	slot0.titile_bg:setContentSize(cc.size(slot1.width - 3, 44))
end

function GuildwarBattleArrayPanel.register_event(slot0)
end

function GuildwarBattleArrayPanel.DeleteMe(slot0)
	for slot4, slot5 in pairs(slot0.hero_item_list) do
		slot5:DeleteMe()
	end

	if slot0.power then
		slot0.power:DeleteMe()

		slot0.power = nil
	end
end
