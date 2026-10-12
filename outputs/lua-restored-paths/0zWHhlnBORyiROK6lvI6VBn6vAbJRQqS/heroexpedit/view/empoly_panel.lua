EmpolyPanel = EmpolyPanel or BaseClass(BaseView)
slot1 = HeroExpeditController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort

function EmpolyPanel.__init(slot0)
	slot0.is_full_screen = false
	slot0.layout_name = "heroexpedit/empoly_panel"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("heroexpedit", "heroexpedit"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"),
			type = ResourcesType.single
		}
	}
	slot0.cur_index = nil
	slot0.tab_list = {}
end

function EmpolyPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.hero_list = HeroController:getInstance():getModel():getExpeditHeroData()
	slot0.hero_list = slot0.hero_list or {}
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)
	slot0.main_container:getChildByName("Image_6"):getChildByName("Text_7"):setString(TI18N("好友助阵"))

	slot0.text_empoly_num = slot0.main_container:getChildByName("Text_2")

	slot0.text_empoly_num:setString("")

	for slot6 = 1, 2 do
		slot7 = {
			btn = slot0.main_container:getChildByName("tab_container"):getChildByName("btn_" .. slot6)
		}
		slot7.normal = slot7.btn:getChildByName("normal")
		slot7.select = slot7.btn:getChildByName("select")

		slot7.select:setVisible(false)

		slot7.title = slot7.btn:getChildByName("title")

		slot7.title:setString(({
			TI18N("支援我的"),
			TI18N("我的支援")
		})[slot6])
		slot7.title:setTextColor(cc.c4b(207, 181, 147, 255))
		slot7.title:enableOutline(cc.c4b(42, 22, 14, 255), 2)

		slot7.index = slot6
		slot0.tab_list[slot6] = slot7
	end

	slot3 = slot0.main_container:getChildByName("good_cons")
	slot0.empty_bg = createSprite(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), slot3:getContentSize().width * 0.5, slot3:getContentSize().height * 0.5, slot3, cc.p(0.5, 0.5), LOADTEXT_TYPE)

	createLabel(24, Config.ColorData.data_color4[187], nil, slot0.empty_bg:getContentSize().width * 0.5, -10, "", slot0.empty_bg, 0, cc.p(0.5, 0.5)):setString(TI18N("暂无可雇佣英雄，快去叫好友派遣英雄吧~~~"))
	slot0.empty_bg:setVisible(false)

	slot0.item_scrollview = CommonScrollViewLayout.new(slot3, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 0,
		item_width = 631,
		start_x = 2,
		space_x = 0,
		row = 0,
		item_height = 149,
		space_y = 5,
		col = 1,
		need_dynamic = true,
		item_class = EmpolyPanelItem
	})
end

function EmpolyPanel.tabChangeView(slot0, slot1)
	if slot0.cur_index == (slot1 or 1) then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.select:setVisible(false)
		slot0.cur_tab.title:setTextColor(cc.c4b(207, 181, 147, 255))
	end

	slot0.cur_index = slot1
	slot0.cur_tab = slot0.tab_list[slot0.cur_index]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.select:setVisible(true)
		slot0.cur_tab.title:setTextColor(cc.c4b(255, 237, 214, 255))
	end

	if slot1 == 1 then
		uv0:sender24406()
		slot0.text_empoly_num:setVisible(true)
	elseif slot1 == 2 then
		slot0.text_empoly_num:setVisible(false)
		slot0.empty_bg:setVisible(false)
		uv0:sender24405()
	end
end

function EmpolyPanel.isVisibleRedPoint(slot0)
	addRedPointToNodeByStatus(slot0.tab_list[2].btn, uv0:getModel():getHeroSendRedPoint(), nil, 11)
end

function EmpolyPanel.openRootWnd(slot0)
	slot0:tabChangeView(1)
	slot0:isVisibleRedPoint()
end

function EmpolyPanel.powerSort(slot0, slot1)
	uv0(slot1, function (slot0, slot1)
		if slot0.is_employ and slot1.is_employ then
			if slot0.is_employ == 1 and slot1.is_employ == 1 then
				return slot1.power < slot0.power
			elseif slot0.is_employ == 1 and slot1.is_employ == 0 then
				return slot1.sort < slot0.sort
			elseif slot0.is_employ == 0 and slot1.is_employ == 1 then
				return false
			elseif slot0.is_employ == 0 and slot1.is_employ == 0 then
				return slot1.power < slot0.power
			end
		else
			return slot1.power < slot0.power
		end
	end)
end

function EmpolyPanel.helpMeHero(slot0)
	if next(uv0:getEmployHelpMeData()) ~= nil then
		slot0.empty_bg:setVisible(false)

		slot2 = {}

		for slot7, slot8 in pairs(slot1) do
			slot8.sort = 0
			slot8.help_type = 2

			if slot8.is_employ == 1 then
				slot8.sort = 2
				slot3 = 0 + 1
			end

			uv1(slot2, slot8)
		end

		slot0:powerSort(slot2)

		if slot0.item_scrollview then
			slot0.item_scrollview:setData(slot2)
		end

		slot0.text_empoly_num:setString(string.format(TI18N("今日已雇佣： %d/%d"), slot3, 3))
	else
		slot0.empty_bg:setVisible(true)

		if slot0.item_scrollview then
			slot0.item_scrollview:setData({})
		end
	end
end

function EmpolyPanel.helpMeSort(slot0, slot1)
	uv0(slot1, function (slot0, slot1)
		if slot0.sort and slot1.sort then
			if slot0.sort == 1 and slot1.sort == 1 then
				return slot1.power < slot0.power
			elseif slot0.sort == 1 and slot1.sort == 0 then
				return slot1.sort < slot0.sort
			elseif slot0.sort == 0 and slot1.sort == 1 then
				return false
			elseif slot0.sort == 0 and slot1.sort == 0 then
				return slot1.power < slot0.power
			end
		else
			return slot1.power < slot0.power
		end
	end)
end

function EmpolyPanel.meHelpHero(slot0, slot1)
	if next(slot0.hero_list) ~= nil then
		slot2 = {}
		slot3 = false

		for slot7, slot8 in pairs(slot0.hero_list) do
			slot8.sort = 0
			slot8.help_type = 1

			if slot1 and next(slot1) then
				for slot12, slot13 in pairs(slot1) do
					if slot8.id == slot13.id then
						slot8.sort = 1
						slot3 = true
					end
				end
			end

			uv0(slot2, slot8)
		end

		if slot1 and next(slot1) ~= nil and slot3 == false then
			slot1[1].sort = 1

			uv0(slot2, 1, slot1[1])
		end

		slot0:helpMeSort(slot2)

		if slot0.item_scrollview then
			slot0.item_scrollview:setData(slot2)
		end
	elseif slot0.item_scrollview then
		slot0.item_scrollview:setData({})
	end
end

function EmpolyPanel.register_event(slot0)
	slot0:addGlobalEvent(HeroExpeditEvent.Employ_Help_Me, function ()
		uv0:helpMeHero()
	end)
	slot0:addGlobalEvent(HeroExpeditEvent.Employ_Me_Help, function (slot0)
		uv0:meHelpHero(slot0.list)
	end)

	slot4 = HeroExpeditEvent.MeHelp_RedPoint_Event

	function slot5(slot0)
		uv0:isVisibleRedPoint()
	end

	slot0:addGlobalEvent(slot4, slot5)

	for slot4, slot5 in pairs(slot0.tab_list) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:tabChangeView(uv1.index)
		end, false, 1)
	end

	registerButtonEventListener(slot0.background, function ()
		uv0:openEmpolyPanelView(false)
	end, false, 2)
end

function EmpolyPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openEmpolyPanelView(false)
end

EmpolyPanelItem = class("EmpolyPanelItem", function ()
	return ccui.Widget:create()
end)
slot4 = Config.PartnerData.data_partner_base

function EmpolyPanelItem.ctor(slot0)
	slot0:createRootWnd()
	slot0:registerEvent()
end

function EmpolyPanelItem.createRootWnd(slot0)
	slot0.rootWnd = createCSBNote(PathTool.getTargetCSB("heroexpedit/empoly_panel_item"))

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:addChild(slot0.rootWnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(631, 149))

	slot0.main_container = slot0.rootWnd:getChildByName("main_container")
	slot0.btn_enpoly = slot0.main_container:getChildByName("btn_enpoly")

	slot0.btn_enpoly:setVisible(false)

	slot0.text_btn_enpoly = slot0.btn_enpoly:getChildByName("Text_1_0")

	slot0.text_btn_enpoly:setString(TI18N("已雇佣"))

	slot0.btn_config = slot0.main_container:getChildByName("btn_config")

	slot0.btn_config:setVisible(false)
	slot0.btn_config:getChildByName("Text_1"):setString(TI18N("选择"))

	slot0.text_name = slot0.main_container:getChildByName("text_name")
	slot0.text_power = slot0.main_container:getChildByName("text_power")
	slot0.text_firend = slot0.main_container:getChildByName("text_firend")
	slot0.text_firend_label = slot0.main_container:getChildByName("text_power_0")

	slot0.text_firend_label:setVisible(false)
	slot0.text_firend_label:setString("来自好友:")
	slot0.text_firend:setVisible(false)

	slot0.my_head = HeroExhibitionItem.new(1, false)

	slot0.my_head:setPosition(cc.p(72, 72))
	slot0.main_container:addChild(slot0.my_head)
end

function EmpolyPanelItem.setData(slot0, slot1)
	if not slot1 or not next(slot1) then
		return
	end

	slot0.data = slot1
	slot2 = TI18N("选择")

	if slot1.sort == 1 then
		slot2 = TI18N("已派遣")
	elseif slot1.sort == 2 then
		slot2 = TI18N("已雇佣")
	end

	slot0.btn_config:setVisible(slot1.sort == 0)
	slot0.btn_enpoly:setVisible(slot1.sort == 1 or slot1.sort == 2)
	slot0.text_btn_enpoly:setString(slot2)

	if slot1.help_type == 2 then
		slot0.text_firend_label:setVisible(true)
		slot0.text_firend:setVisible(true)
	else
		slot0.text_firend_label:setVisible(false)
		slot0.text_firend:setVisible(false)
	end

	slot0.text_firend:setString(slot1.name or "")
	slot0.text_power:setString(slot1.power or 0)

	slot3 = ""

	if uv0[slot1.bid] and uv0[slot1.bid].name then
		slot3 = uv0[slot1.bid].name
	end

	slot0.text_name:setString(slot3)
	slot0.my_head:setData(slot1)
end

function EmpolyPanelItem.registerEvent(slot0)
	registerButtonEventListener(slot0.btn_config, function ()
		uv0:setChooseHero()
	end, true, 1)
end

function EmpolyPanelItem.setChooseHero(slot0)
	if slot0.data and slot0.data.help_type then
		if slot0.data and slot0.data.help_type == 1 and slot0.data.checkResonateHero and slot0.data:checkResonateHero() then
			return
		end

		slot2 = nil

		CommonAlert.show((slot0.data.help_type ~= 2 or TI18N("是否确认雇佣该英雄？")) and TI18N("是否确认派遣该英雄？"), TI18N("确定"), function ()
			if uv0.data and uv0.data.help_type == 1 then
				uv1:sender24407(uv0.data.id)
			elseif uv0.data and uv0.data.help_type == 2 then
				uv1:sender24408(uv0.data.rid, uv0.data.srv_id, uv0.data.id)
			end
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, 26)
	end
end

function EmpolyPanelItem.DeleteMe(slot0)
	if slot0.my_head then
		slot0.my_head:DeleteMe()

		slot0.my_head = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
