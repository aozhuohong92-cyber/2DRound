PokedexCheckWindow = PokedexCheckWindow or BaseClass(BaseView)

function PokedexCheckWindow.__init(slot0)
	slot0.ctrl = PokedexController:getInstance()
	slot0.is_full_screen = false
	slot0.title_str = TI18N("英雄详情")
	slot0.layout_name = "pokedex/pokedex_look_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("pokedex", "pokedex"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"),
			type = ResourcesType.single
		}
	}
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.learn_btn = {}
	slot0.jie_btn = {}
	slot0.item_list = {}
	slot0.select_btn = nil
	slot0.tab_list = {}
	slot0.star_list = {}
	slot0.panel_list = {}
end

function PokedexCheckWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("title")

	slot0.title:setString(slot0.title_str)

	slot0.tab_panel = slot0.main_panel:getChildByName("tab_panel")
	slot0.bottom_panel = slot0.main_panel:getChildByName("bottom_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.label_panel = slot0.main_panel:getChildByName("label_panel")

	slot0.label_panel:setTouchEnabled(false)

	for slot5 = 1, 3 do
		slot7 = slot0.main_panel:getChildByName("btn_panel_" .. slot5)

		if slot0.tab_panel:getChildByName("tab_btn_" .. slot5) and slot7 then
			slot8 = {
				btn = slot6,
				select_bg = slot6:getChildByName("select_bg")
			}

			slot8.select_bg:setVisible(false)

			slot8.title = slot6:getChildByName("title")

			slot8.title:setString(({
				TI18N("总览"),
				TI18N("属性"),
				TI18N("传记")
			})[slot5])
			slot8.title:setTextColor(cc.c4b(215, 226, 227, 255))

			slot8.index = slot5
			slot8.panel = slot7

			slot8.panel:setVisible(false)

			slot0.tab_list[slot5] = slot8
		end
	end

	slot0:createBaseMessage()
end

function PokedexCheckWindow.register_event(slot0)
	for slot4, slot5 in pairs(slot0.tab_list) do
		slot5.btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:changeTabIndex(uv1.index)
			end
		end)
	end

	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openCheckHeroWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openCheckHeroWindow(false)
		end
	end)
	slot0.vedio_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if uv0.data == nil or uv0.data.voice == nil then
				return
			end

			if uv0.data.voice == "" then
				message(TI18N("该英雄暂无配音"))
			else
				playPartnerSound(uv0.data.voice)
			end
		end
	end)
	slot0.comment_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.ctrl:openCommentWindow(true, uv0.data)
		end
	end)
end

function PokedexCheckWindow.createBaseMessage(slot0)
	slot0.partner_model = PartnerBase.new(slot0.main_panel, false)

	slot0.partner_model:setPosition(cc.p(435, 750))

	slot0.hero_name = createLabel(24, Config.ColorData.data_color4[1], nil, 75, 770, "", slot0.label_panel, 0, cc.p(0, 0))
	slot0.rare_type = createImage(slot0.main_panel, nil, 30, 840, cc.p(0, 0), true, 1, false)
	slot0.hero_type = createImage(slot0.main_panel, nil, 30, 765, cc.p(0, 0), true, 1, false)
	slot0.grow = createLabel(24, Config.ColorData.data_color4[1], nil, 73, 803, "", slot0.main_panel, 0, cc.p(0, 0))
	slot0.desc_label = createRichLabel(20, Config.ColorData.data_color4[141], cc.p(0, 1), cc.p(28, 750), 0, 0, 200)

	slot0.label_panel:addChild(slot0.desc_label)

	slot0.cv_name = createRichLabel(20, Config.ColorData.data_color4[141], cc.p(0, 0), cc.p(35, 595), 0, 0, 500)

	slot0.label_panel:addChild(slot0.cv_name)

	slot0.vedio_btn = createButton(slot0.main_panel, "", 50, 540, nil, PathTool.getResFrame("pokedex", "pokedex_21"), 24, Config.ColorData.data_color4[1])
	slot0.comment_btn = createButton(slot0.main_panel, TI18N("评论"), 615, 850, nil, PathTool.getResFrame("pokedex", "pokedex_15"), 20, Config.ColorData.data_color4[1])

	slot0.comment_btn:enableOutline(Config.ColorData.data_color4[9], 2)
	slot0.comment_btn:getLabel():setPosition(cc.p(25, 4))

	slot0.star_con = ccui.Widget:create()

	slot0.main_panel:addChild(slot0.star_con)
end

function PokedexCheckWindow.updateModel(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = true

	if slot0.partner_model:getData() and slot2.bid == slot1.bid then
		slot3 = false
	end

	if slot3 == true then
		if slot1.clothes_id ~= 0 then
			slot0.partner_model:updateSpine(slot1.bid, true, slot1.clothes_id)
		else
			slot0.partner_model:updateSpine(slot1.bid, false, slot1.clothes_id)
		end

		slot0.partner_model:setScale(1)
	end

	slot0.partner_model:setData(slot1)
end

function PokedexCheckWindow.openRootWnd(slot0, slot1)
	slot0.data = slot1

	slot0:updateMessage()
	slot0:changeTabIndex(1)
end

function PokedexCheckWindow.changeTabIndex(slot0, slot1)
	if slot0.select_btn and slot0.select_btn.index == slot1 then
		return
	end

	if slot0.select_btn then
		slot0.select_btn.select_bg:setVisible(false)
		slot0.select_btn.title:setTextColor(cc.c4b(215, 226, 227, 255))
		slot0.select_btn.panel:setVisible(false)
	end

	slot0.select_btn = slot0.tab_list[slot1]

	if slot0.select_btn then
		slot0.select_btn.select_bg:setVisible(true)
		slot0.select_btn.title:setTextColor(cc.c4b(255, 255, 255, 255))
		slot0.select_btn.panel:setVisible(true)
	end

	if not slot0.panel_list[slot1] then
		slot0.panel_list[slot1] = slot0:createPanel(slot1, slot0.select_btn.panel)
	end

	slot0.pre_panel = slot0.panel_list[slot1]
end

function PokedexCheckWindow.createPanel(slot0, slot1, slot2)
	slot3 = nil

	if slot1 == 1 then
		slot3 = CheckAllPanel.new(slot0.data, true)
	elseif slot1 == 2 then
		slot3 = CheckAttrPanel.new(slot0.data)
	elseif slot1 == 3 then
		slot3 = CheckDescPanel.new(slot0.data)
	end

	slot2:addChild(slot3)

	return slot3
end

function PokedexCheckWindow.updateMessage(slot0)
	if not slot0.data then
		return
	end

	slot0.hero_name:setString(slot0.data.name or "")
	slot0.grow:setString(TI18N("资质:") .. slot1.grow)
	slot0.hero_type:loadTexture(PathTool.getResFrame("common", "common_900" .. 45 + (slot1.type or 0)), LOADTEXT_TYPE_PLIST)
	slot0.rare_type:loadTexture(PathTool.getResFrame("common", "common_900" .. 31 - (slot1.rare_type or 3)), LOADTEXT_TYPE_PLIST)

	if not Config.PartnerData.data_pokedex[slot1.bid] then
		return
	end

	slot0.desc_label:setString(slot7.call_desc or "")
	slot0.cv_name:setString("CV: " .. slot7.cv_name)

	if slot0.partner_model then
		slot0:updateModel(slot1)
	end

	slot0:createStar(slot1.show_star)
end

function PokedexCheckWindow.createStar(slot0, slot1)
	slot0.star_con:setContentSize(cc.size(69, 23))
	slot0.star_con:setPosition(cc.p(135, 855))

	for slot6 = 1, slot1 or 0 do
		if not slot0.star_list[slot6] then
			slot8 = createImage(slot0.star_con, PathTool.getResFrame("common", "common_90011"), 0, slot2.height / 2, cc.p(0, 0.5), true, 0, false)

			slot8:setScale(0.6)

			slot0.star_list[slot6] = slot8
		end

		slot0.star_list[slot6]:setVisible(true)
		slot0.star_list[slot6]:setPosition(cc.p((slot6 - 1) * 23 - 3, slot2.height / 2))
	end
end

function PokedexCheckWindow.createAllPanel(slot0, slot1)
	if not slot1 then
		return
	end
end

function PokedexCheckWindow.setPanelData(slot0)
end

function PokedexCheckWindow.close_callback(slot0)
	slot0.ctrl:openCheckHeroWindow(false)

	if slot0.partner_model then
		slot0.partner_model:DeleteMe()

		slot0.partner_model = nil
	end

	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = nil
end
