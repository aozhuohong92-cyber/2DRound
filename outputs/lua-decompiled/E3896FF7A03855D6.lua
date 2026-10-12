EmoguoshiMainView = EmoguoshiMainView or BaseClass(BaseView)
slot0 = EmoguoshiController:getInstance()
slot1 = 6

function EmoguoshiMainView.__init(slot0)
	slot0.is_full_screen = true
	slot0.layout_name = "emoguoshitujian/emoguoshi_main_window"
	slot0.res_list = {}

	slot0:initData()
end

function EmoguoshiMainView.initData(slot0, ...)
	slot0.item_list = {}
	slot1 = {}

	for slot5, slot6 in pairs(Config.EmoguoshitujianData.data_get_emoguoshitujian_data) do
		table.insert(slot1, slot6)
	end

	table.sort(slot1, function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	slot0.all_guoshi_list = {}
	slot6 = {}

	table.insert(slot0.all_guoshi_list, slot6)

	for slot6, slot7 in pairs(slot1) do
		if uv0 <= #slot2 then
			table.insert(slot0.all_guoshi_list, {})
		end

		table.insert(slot2, slot7)
	end

	slot0.guoshi_bg_list = {}
end

function EmoguoshiMainView.open_callback(slot0)
	slot0.btn_close = slot0.root_wnd:getChildByName("Panel_3"):getChildByName("return_btn")
	slot0.btn_bag = slot0.root_wnd:getChildByName("Panel_3"):getChildByName("Button_bag")
	slot0.label_bag = slot0.btn_bag:getChildByName("label")

	slot0.label_bag:setString(TI18N("碎片背包"))

	slot0.btn_tujian = slot0.root_wnd:getChildByName("Panel_3"):getChildByName("Button_tujian")
	slot0.label_tujian = slot0.btn_tujian:getChildByName("label")

	slot0.label_tujian:setString(TI18N("果实图鉴"))

	slot0.img_tree = slot0.root_wnd:getChildByName("Panel_3"):getChildByName("Image_bg")
	slot0.btn_shop = slot0.root_wnd:getChildByName("Panel_1"):getChildByName("Button_shop")
	slot0.label_shop = slot0.btn_shop:getChildByName("label")

	slot0.label_shop:setString(TI18N("果实商店"))

	slot0.btn_libao = slot0.root_wnd:getChildByName("Panel_1"):getChildByName("Button_libao"):setVisible(false)
	slot0.label_libao = slot0.btn_libao:getChildByName("label")

	slot0.label_libao:setString(TI18N("成长自选"))

	slot0.btn_guoshi_show = slot0.root_wnd:getChildByName("Panel_1"):getChildByName("Button_gailv")
	slot0.label_guoshi_show = slot0.btn_guoshi_show:getChildByName("label")

	slot0.label_guoshi_show:setString(TI18N("概率展示"))

	slot0.btn_brief = slot0.root_wnd:getChildByName("Panel_1"):getChildByName("rule")
	slot0.btn_zhanling = slot0.root_wnd:getChildByName("Panel_1"):getChildByName("Button_zhanling"):setVisible(false)
	slot0.label_zhanling = slot0.btn_zhanling:getChildByName("label")

	slot0.label_zhanling:setString(TI18N("果实赠礼"))

	slot0.btn_choujiang = slot0.root_wnd:getChildByName("Panel_1"):getChildByName("Button_1")
	slot0.label_choujiang = slot0.btn_choujiang:getChildByName("label")

	slot0.label_choujiang:setString(TI18N("果实秘宝"))

	slot0.btn_guoshi = slot0.root_wnd:getChildByName("Panel_1"):getChildByName("Button_2")
	slot0.label_guoshi = slot0.btn_guoshi:getChildByName("label")

	slot0.label_guoshi:setString(TI18N("恶魔果实"))
	slot0.root_wnd:getChildByName("Panel_1"):setTouchEnabled(false)

	slot1 = slot0.root_wnd:getChildByName("Panel_2")

	slot1:setTouchEnabled(false)

	slot0.guoshi_bg = slot0.root_wnd:getChildByName("Panel_2"):getChildByName("Panel_guoshi")
	slot0.bg = slot1

	slot0:setUpGuoShi()

	slot3 = slot0.root_wnd:getChildByName("Panel_3")

	slot0.root_wnd:getChildByName("Panel_1"):setPositionY(display.getTop(slot0.root_wnd))
	slot3:setPositionY(display.getBottom(slot0.root_wnd))
	slot3:setTouchEnabled(false)
end

function EmoguoshiMainView.register_event(slot0)
	slot0.btn_close:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openEmoguoMainView(false)
	end, true)
	slot0.btn_bag:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_bag, function ()
		uv0:openEmoguoBagView(true)
	end, true)
	slot0.btn_tujian:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_tujian, function ()
		uv0:openEmoguoTuJianView(true)
	end, true)
	slot0.btn_shop:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_shop, function ()
		uv0:openEmoguoShopView(true)
	end, true)
	slot0.btn_libao:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_libao, function ()
		ActionController:getInstance():openActionMainPanel(true, nil, ActionRankCommonType.grow_gift)
	end, true)
	slot0.btn_choujiang:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_choujiang, function ()
		uv0:showChouJiang()
	end, false)
	slot0.btn_guoshi:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_guoshi, function ()
		uv0:showGuoShi()
	end, false)
	slot0.btn_zhanling:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_zhanling, function ()
		uv0:openEmoguoZhanLingView(true)
	end, true)
	slot0.btn_brief:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_brief, function ()
		slot0 = Config.EmoguoshitujianData.data_const.emo_rule.desc

		if not uv0:isShowGuoShi() then
			slot0 = Config.EmoguoshitujianData.data_const.emo_zhaohuan_rule.desc
		end

		MainuiController:getInstance():openCommonExplainView(true, {
			{
				title = "基础规则",
				desc = slot0
			}
		})
	end, true)
	slot0:addGlobalEvent(EmoguoshiEvent.ONE_INFO, function (slot0)
		if uv0.item_list[slot0] then
			uv0.item_list[slot0]:updateAll()
		end
	end)
	slot0.btn_guoshi_show:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_guoshi_show, function ()
		uv0:openEmoguoRandomShowView(true, uv1.show_guoshi_tag)
	end, true)
	slot0:addGlobalEvent(EmoguoshiEvent.CHOUJIANG_CHANGE_TAG, function (slot0)
		uv0.show_guoshi_tag = slot0
	end)
end

function EmoguoshiMainView.setUpGuoShi(slot0, ...)
	slot0.guoshi_bg:setTouchEnabled(true)

	slot2 = slot0.guoshi_bg:getChildByName("Image_bg_1")
	slot3 = slot2:getContentSize()

	slot2:retain()

	slot0.item_seed = slot2

	slot2:removeFromParent()

	slot0.guoshi_scrollview = CommonScrollViewLayout.new(slot0.guoshi_bg, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(display.width, display.height), {
		start_y = 0,
		start_x = 0,
		space_x = 10,
		row = 0,
		space_y = 0,
		col = 1,
		item_class = EmoguoshiMainPageItem,
		item_width = slot3.width,
		item_height = slot3.height
	})

	slot0.guoshi_scrollview:setSwallowTouches(false)
	slot0.guoshi_scrollview:setData(slot0.all_guoshi_list, nil, nil, {
		slot2,
		function (slot0, slot1)
			uv0.item_list[slot0] = slot1
		end
	})
	slot0.guoshi_scrollview:addEndCallBack(function (...)
		uv0.load_guoshi_finish = true

		uv0:checkGuoShiStart()
	end)

	slot5 = slot0.guoshi_bg:getContentSize()

	slot0.guoshi_scrollview:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.guoshi_scrollview:setPosition(slot5.width / 2, slot5.height / 2)
	slot0.guoshi_scrollview:setBounceEnabled(false)
end

slot2 = cc.c4b(93, 152, 42, 255)
slot3 = cc.c4b(86, 134, 44, 255)

function EmoguoshiMainView.showGuoShi(slot0, ...)
	slot0.btn_choujiang:setBright(false)
	slot0.btn_choujiang:getChildByName("label"):enableOutline(uv0, 2)
	slot0.btn_guoshi:setBright(true)
	slot0.btn_guoshi:getChildByName("label"):enableOutline(uv1, 2)
	slot0.guoshi_bg:setVisible(true)

	if slot0.choujiang_view then
		slot0.choujiang_view:setVisible(false)
	end

	slot0.img_tree:setVisible(true)
	slot0.btn_guoshi_show:setVisible(false)
end

function EmoguoshiMainView.showChouJiang(slot0, ...)
	slot0.guoshi_bg:setVisible(false)
	slot0.img_tree:setVisible(false)
	slot0.btn_choujiang:setBright(true)
	slot0.btn_choujiang:getChildByName("label"):enableOutline(uv0, 2)
	slot0.btn_guoshi:setBright(false)
	slot0.btn_guoshi:getChildByName("label"):enableOutline(uv1, 2)

	if not slot0.choujiang_view then
		slot0.choujiang_view = EmoguoshiRandomView.new()
		slot1 = slot0.bg:getContentSize()

		slot0.bg:addChild(slot0.choujiang_view)
		slot0.choujiang_view:setPosition(slot1.width / 2, slot1.height / 2)
	end

	slot0.choujiang_view:setVisible(true)
	uv2:openEmoguoBagView(false)
	uv2:openEmoguoTuJianView(false)
	uv2:openEmoguoShopView(false)
	slot0.btn_guoshi_show:setVisible(true)
end

function EmoguoshiMainView.isShowGuoShi(slot0, ...)
	return slot0.guoshi_bg:isVisible()
end

function EmoguoshiMainView.changeView(slot0, slot1, slot2)
	print("EmoguoshiMainView changeView======")

	if slot1 == EmoguoshiConst.mainView.random then
		slot0:showChouJiang()
	else
		slot0:showGuoShi()

		slot0.start_guoshi_id = slot2

		slot0:checkGuoShiStart()
	end
end

function EmoguoshiMainView.checkGuoShiStart(slot0, ...)
	if not slot0.load_guoshi_finish then
		return
	end

	slot1 = nil
	slot2 = slot0.start_guoshi_id

	function slot3(slot0)
		return uv0:isCanLevelUp(slot0) or uv0:isCanStarUp(slot0) or uv0:isCanJueXing(slot0)
	end

	for slot7, slot8 in pairs(slot0.all_guoshi_list) do
		for slot12, slot13 in pairs(slot8) do
			if type(slot13) == "table" and (slot2 and slot13.id == slot2 or not slot2 and slot3(slot13.id)) then
				slot1 = slot7

				break
			end
		end

		if slot1 then
			break
		end
	end

	slot0.guoshi_scrollview.scroll_view:scrollToPercentVertical(((slot1 or 1) - 1) * 100 / (#slot0.guoshi_scrollview:getItemList() - 1), 1, true)
end

function EmoguoshiMainView.openRootWnd(slot0, slot1, slot2)
	slot0:changeView(slot1, slot2)
end

function EmoguoshiMainView.close_callback(slot0)
	if slot0.choujiang_view then
		slot0.choujiang_view:DeleteMe()

		slot0.choujiang_view = nil
	end

	if slot0.move_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.move_timer)

		slot0.move_timer = nil
	end

	uv0:openEmoguoMainView(false)

	if slot0.guoshi_scrollview then
		slot0.guoshi_scrollview:DeleteMe()

		slot0.guoshi_scrollview = nil
	end

	if slot0.item_seed then
		slot0.item_seed:release()

		slot0.item_seed = nil
	end
end

EmoguoshiMainItem = class("EmoguoshiMainItem", function ()
	return ccui.Layout:create()
end)

function EmoguoshiMainItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function EmoguoshiMainItem.configUI(slot0)
	slot1 = createCSBNote(PathTool.getTargetCSB("emoguoshitujian/emoguoshi_item"))
	slot0.size = slot1:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:addChild(slot1)

	slot2 = slot1:getChildByName("main_panel")

	slot2:setTouchEnabled(false)

	slot0.itembg = slot2
	slot0.img_head = slot2:getChildByName("item")
	slot0.effect_node_bg = slot2:getChildByName("effect")
	slot0.label_level = slot2:getChildByName("level")
	slot0.label_level_bg = slot2:getChildByName("level_bg")
	slot0.label_name = slot2:getChildByName("name")
	slot0.img_lock = slot2:getChildByName("lock")
	slot0.img_red_point = slot2:getChildByName("red_point")
	slot0.star_bg1 = slot2:getChildByName("Panel_star_1")
	slot0.star_bg2 = slot2:getChildByName("Panel_star_2")

	slot0.star_bg1:setVisible(false)
	slot0.star_bg2:setVisible(false)

	slot0.img_juexing = slot2:getChildByName("Image_juexing")
end

function EmoguoshiMainItem.setStar(slot0, slot1, slot2)
	slot0.star_bg1:setVisible(false)
	slot0.star_bg2:setVisible(false)
	slot0.img_juexing:setVisible(false)

	if uv0:isHadJueXing(slot0.data) then
		slot0.img_juexing:setVisible(true)

		return
	end

	slot3 = nil

	((slot2 <= 5 or slot0.star_bg1) and slot0.star_bg2):setVisible(true)

	for slot7 = 1, 10 do
		if slot3:getChildByName("star_" .. slot7) then
			slot8:setVisible(slot7 <= slot1)
			slot3:getChildByName("star_gray_" .. slot7):setVisible(slot1 < slot7)
		else
			break
		end
	end
end

function EmoguoshiMainItem.register_event(slot0)
	slot0.itembg:setTouchEnabled(true)
	registerButtonEventListener(slot0.itembg, function ()
		if not uv0.data then
			return
		end

		uv1:openEmoguoTipsView(true, uv0.data)
	end, true)

	slot0.red_point_handle = RedpointController:getInstance():bindRedPointCb(function (...)
		uv0:updateTips()
	end, RedpointConst.emoguoshi)
end

function EmoguoshiMainItem.updateAll(slot0, ...)
	if not slot0.data then
		return
	end

	slot1 = slot0.data

	slot0:setStar(uv0:getGuoShiStar(slot1), uv0:getMaxStar(slot1))
	slot0.img_head:loadTexture(uv0:getGuoShiIcon(slot1), LOADTEXT_TYPE)
	slot0.label_name:setString(TI18N(uv0:getGuoShiName(slot1)))

	slot4 = uv0:getGuoShiLevel(slot1)

	slot0.label_level:setString(slot4)
	slot0.label_level:setVisible(slot4 > 0)
	slot0.label_level_bg:setVisible(slot4 > 0)
	setChildUnEnabled(slot4 <= 0, slot0.img_head)
	slot0:updateTips()
end

function EmoguoshiMainItem.updateTips(slot0, ...)
	if not slot0.data then
		return
	end

	slot1 = slot0.data
	slot3 = uv0:isCanLevelUp(slot1)

	slot0.img_lock:setVisible(uv0:getGuoShiLevel(slot1) <= 0 and not slot3)
	slot0.img_red_point:setVisible(slot3 or uv0:isCanStarUp(slot1) or uv0:isCanJueXing(slot1))
end

function EmoguoshiMainItem.setData(slot0, slot1)
	if slot1 == nil or slot0.data == slot1 then
		return
	end

	slot0.data = slot1

	slot0:updateAll()
end

function EmoguoshiMainItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function EmoguoshiMainItem.getData(slot0)
	return slot0.data
end

function EmoguoshiMainItem.getItemPosition(slot0)
	if slot0 then
		return cc.p(slot0:getPosition())
	end
end

function EmoguoshiMainItem.DeleteMe(slot0)
	RedpointController:getInstance():unBindRedPoint(slot0.red_point_handle)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

EmoguoshiMainPageItem = class("EmoguoshiMainPageItem", function ()
	return ccui.Layout:create()
end)

function EmoguoshiMainPageItem.ctor(slot0)
	slot0.item_list = {}
	slot0.item_bg_list = {}

	slot0:configUI()
	slot0:register_event()
end

function EmoguoshiMainPageItem.configUI(slot0)
end

function EmoguoshiMainPageItem.register_event(slot0)
end

function EmoguoshiMainPageItem.setData(slot0, slot1)
	if slot1 == nil or slot0.data == slot1 then
		return
	end

	slot0.data = slot1

	for slot5, slot6 in pairs(slot1) do
		if slot0.item_list[slot5] then
			slot7:setVisible(true)
			slot7:setData(slot6.id)
			slot0.set_call_back(slot6.id, slot7)
		end
	end

	if slot1._index == 1 then
		slot0:resetPos()
	end
end

function EmoguoshiMainPageItem.resetPos(slot0)
	slot1 = {
		{
			365,
			565
		},
		{
			240,
			360
		},
		{
			655,
			295
		},
		{
			60,
			80
		},
		{
			345,
			140
		},
		{
			640,
			85
		}
	}

	for slot5, slot6 in pairs(slot0.item_bg_list) do
		slot6:setPosition(slot1[slot5][1], slot1[slot5][2])
	end
end

function EmoguoshiMainPageItem.setExtendData(slot0, slot1)
	if slot0.have_init then
		return
	end

	slot0.have_init = true
	slot0.set_call_back = slot1[2]
	slot2 = slot1[1]:clone()
	slot0.size = slot2:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot2:setPosition(slot0.size.width / 2, slot0.size.height / 2)

	slot6 = slot2

	slot0:addChild(slot6)

	slot0.root_wnd = slot2

	for slot6 = 1, 6 do
		slot7 = slot2:getChildByName("Panel_" .. slot6)
		slot8 = EmoguoshiMainItem.new()

		slot7:addChild(slot8)

		slot9 = slot7:getContentSize()

		slot8:setPosition(slot9.width / 2, slot9.height / 2)
		slot8:setVisible(false)

		slot0.item_list[slot6] = slot8
		slot0.item_bg_list[slot6] = slot7
	end
end

function EmoguoshiMainPageItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function EmoguoshiMainPageItem.getData(slot0)
	return slot0.data
end

function EmoguoshiMainPageItem.getItemPosition(slot0)
	if slot0 then
		return cc.p(slot0:getPosition())
	end
end

function EmoguoshiMainPageItem.DeleteMe(slot0)
	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
