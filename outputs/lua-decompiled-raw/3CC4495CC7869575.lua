EndlessTrailBuffView = EndlessTrailBuffView or BaseClass(BaseView)
slot0 = Endless_trailController:getInstance()

function EndlessTrailBuffView.__init(slot0, ...)
	slot0.is_full_screen = false
	slot0.layout_name = "endlesstrail/endlesstrail_buff_view"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.partner_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("form", "form"),
			type = ResourcesType.plist
		}
	}
end

function EndlessTrailBuffView.open_callback(slot0, ...)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.win_title = slot0.main_panel:getChildByName("win_title")

	slot0.win_title:setString(TI18N("增益选择"))

	slot0.desc_label = slot0.main_panel:getChildByName("desc_label")

	slot0.desc_label:setString(TI18N("必须选择一个Buff才能继续挑战"))

	slot0.buff_container = slot0.main_panel:getChildByName("buff_container")
	slot0.partner_container = slot0.main_panel:getChildByName("partner_container")
	slot0.form_icon = slot0.partner_container:getChildByName("form_icon")
	slot0.form_label = slot0.partner_container:getChildByName("form_label")
	slot0.desc_label_1 = slot0.partner_container:getChildByName("desc_label_1")
	slot0.cur_num = createRichLabel(24, 175, cc.p(0.5, 0.5), cc.p(545, 772), nil, , 500)

	slot0.main_container:addChild(slot0.cur_num)

	slot0.buff_scroll_size = slot0.buff_container:getContentSize()
	slot0.buff_scrollview = CommonScrollViewLayout.new(slot0.buff_container, cc.p(2.5, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.buff_scroll_size, {
		start_y = 1,
		start_x = 0,
		space_x = 2,
		row = 0,
		space_y = 0,
		col = 1,
		item_class = EndlessTrailBuffItem,
		item_width = EndlessTrailBuffItem.Width,
		item_height = EndlessTrailBuffItem.Height
	})
end

function EndlessTrailBuffView.openRootWnd(slot0, slot1)
	if slot1 then
		slot0.buff_data = slot1

		slot0.cur_num:setString(string.format(TI18N("即将挑战第<div fontcolor=#249003>%s</div>关"), slot1.round))
		slot0.form_icon:loadTexture(PathTool.getResFrame("form", "form_icon_" .. slot1.formation_type), LOADTEXT_TYPE_PLIST)

		if Config.FormationData.data_form_data then
			slot0.form_label:setString(Config.FormationData.data_form_data[slot1.formation_type].name .. " Lv." .. slot1.formation_lev)
		end

		slot0:updateBuffData(slot1)
		slot0:updatePartnerData(slot1)
	end
end

function EndlessTrailBuffView.getData(slot0)
	return slot0.buff_data
end

function EndlessTrailBuffView.register_event(slot0, ...)
end

function EndlessTrailBuffView.updateBuffData(slot0, slot1)
	if slot1 then
		table.sort(slot1.list, function (slot0, slot1)
			return slot0.buff_id < slot1.buff_id
		end)
		slot0.buff_scrollview:setData(slot1.list)
	end
end

function EndlessTrailBuffView.updatePartnerData(slot0, slot1)
	if slot1 and slot1.partner then
		slot3 = {}

		for slot7, slot8 in pairs(slot2) do
			slot8.rare_type = slot8.quality
			slot9 = HeroVo.New()

			slot9:updateHeroVo(slot8)
			table.insert(slot3, slot9)
		end

		for slot7, slot8 in ipairs(slot3) do
			delayRun(slot0.main_container, slot7 * 2 / display.DEFAULT_FPS, function ()
				if not uv0.partner_list[uv1] then
					slot0 = HeroExhibitionItem.new(0.8, true)
					uv0.partner_list[uv1] = slot0

					uv0.partner_container:addChild(slot0)
				end

				if uv0.partner_list[uv1] then
					slot0:setExtendData({
						from_type = HeroConst.ExhibitionItemType.eEndLessHero
					})
					slot0:setData(uv2, true)

					slot1 = HeroExhibitionItem.Width * 0.8

					slot0:setPosition(slot1 * 0.5 + 18 + (slot1 + 25) * (uv1 - 1), uv0.partner_container:getContentSize().height / 2 - 10)
				end
			end)
		end
	end
end

function EndlessTrailBuffView.close_callback(slot0, ...)
	doStopAllActions(slot0.main_container)

	if slot0.partner_list then
		for slot4, slot5 in pairs(slot0.partner_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end

		slot0.partner_list = nil
	end

	if slot0.buff_scrollview then
		slot0.buff_scrollview:DeleteMe()

		slot0.buff_scrollview = nil
	end

	uv0:openEndlessBuffView(false)
end

EndlessTrailBuffItem = class("EndlessTrailBuffItem", function ()
	return ccui.Layout:create()
end)
EndlessTrailBuffItem.Height = 149
EndlessTrailBuffItem.Width = 608

function EndlessTrailBuffItem.ctor(slot0)
	slot0:setContentSize(EndlessTrailBuffItem.Width, EndlessTrailBuffItem.Height)
	slot0:setAnchorPoint(cc.p(0, 1))

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_buff_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.root = slot0.root_wnd:getChildByName("root")
	slot0.buff_icon = slot0.root:getChildByName("buff_icon")
	slot0.desc_label = createRichLabel(24, 175, cc.p(0, 0.5), cc.p(130, slot0.root:getContentSize().height / 2), nil, , 250)

	slot0.root:addChild(slot0.desc_label)

	slot0.select_btn = slot0.root:getChildByName("select_btn")
	slot0.select_label = slot0.select_btn:getChildByName("select_label")

	slot0.select_label:setString(TI18N("选择并挑战"))
	slot0:registerEvent()
end

function EndlessTrailBuffItem.registerEvent(slot0, ...)
	if slot0.select_btn then
		slot0.select_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended and uv0.data then
				uv1:send23911(uv0.data.buff_id)
			end
		end)
	end
end

function EndlessTrailBuffItem.setData(slot0, slot1)
	if slot1 then
		slot0.data = slot1

		if Config.EndlessData.data_buff_data and Config.EndlessData.data_buff_data[slot1.group_id] and Config.EndlessData.data_buff_data[slot1.group_id][slot1.buff_id] and Config.EndlessData.data_buff_data[slot1.group_id][slot1.buff_id] then
			slot0.desc_label:setString(slot2.desc)

			if slot2.icon ~= "" then
				loadSpriteTexture(slot0.buff_icon, PathTool.getBuffRes(slot2.icon), LOADTEXT_TYPE)
			end
		end
	end
end

function EndlessTrailBuffItem.getData(slot0, ...)
	return slot0.data
end

function EndlessTrailBuffItem.DeleteMe(slot0, ...)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
