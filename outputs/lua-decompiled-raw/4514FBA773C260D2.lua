EmoguoshiTujianView = EmoguoshiTujianView or BaseClass(BaseView)
slot0 = EmoguoshiController:getInstance()

function EmoguoshiTujianView.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.layout_name = "emoguoshitujian/emoguoshi_tujian_panel"
	slot0.res_list = {}
	slot0.tag_btn_list = {}

	slot0:initData()
end

function EmoguoshiTujianView.initData(slot0, ...)
	slot0.data_list = {}
	slot1 = {}

	for slot6, slot7 in pairs(Config.EmoguoshitujianData.data_get_emoguoshitujian_data) do
		table.insert(function (slot0)
			if not uv0[slot0] then
				uv0[slot0] = #uv1.data_list + 1

				table.insert(uv1.data_list, {})
			end

			return uv1.data_list[uv0[slot0]]
		end(uv0:getGuoShiQuality(slot6)), slot7)
	end

	for slot6, slot7 in pairs(slot0.data_list) do
		table.sort(slot7, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
	end
end

function EmoguoshiTujianView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("bg")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot1 = slot0.main_panel:getChildByName("title")

	slot1:setString(TI18N(slot1:getString()))

	slot0.btn_close = slot0.main_panel:getChildByName("close_btn")
	slot0.list_view = slot0.main_panel:getChildByName("Panel_4"):getChildByName("ListView_1")

	slot0.list_view:setClippingEnabled(true)

	slot2 = slot0.main_panel:getChildByName("Panel_3")

	slot2:getChildByName("Button_1"):getChildByName("label"):setString(TI18N("传奇"))

	slot6 = TI18N

	slot2:getChildByName("Button_2"):getChildByName("label"):setString(slot6("稀有"))

	for slot6 = 1, 2 do
		slot0.tag_btn_list[slot6] = slot2:getChildByName("Button_" .. slot6)
	end

	slot0.list_view:setTouchEnabled(false)

	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.list_view, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.list_view:getContentSize(), {
		start_y = 0,
		item_width = 300,
		start_x = 0,
		space_x = 10,
		row = 0,
		item_height = 140,
		space_y = 10,
		col = 2,
		item_class = EmoguoshiTujianItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function EmoguoshiTujianView.register_event(slot0)
	slot0.background:setTouchEnabled(true)

	function slot4(slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEmoguoTuJianView(false)
		end
	end

	slot0.background:addTouchEventListener(slot4)

	for slot4, slot5 in pairs(slot0.tag_btn_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:changeTag(uv1)
			end
		end)
	end

	slot0.btn_close:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openEmoguoTuJianView(false)
	end, true)
end

function EmoguoshiTujianView.changeTag(slot0, slot1)
	if slot0.show_tag == slot1 then
		return
	end

	for slot5, slot6 in pairs(slot0.tag_btn_list) do
		slot6:setBright(slot1 == slot5)
	end

	slot0.show_tag = slot1

	slot0.item_scrollview:setData(slot0.data_list[slot1])
end

function EmoguoshiTujianView.openRootWnd(slot0)
	slot0:changeTag(1)
end

function EmoguoshiTujianView.close_callback(slot0)
	uv0:openEmoguoTuJianView(false)
end

EmoguoshiTujianItem = class("EmoguoshiTujianItem", function ()
	return ccui.Layout:create()
end)

function EmoguoshiTujianItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function EmoguoshiTujianItem.configUI(slot0)
	slot1 = createCSBNote(PathTool.getTargetCSB("emoguoshitujian/emoguoshi_tujian_item"))
	slot0.size = slot1:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:addChild(slot1)

	slot2 = slot1:getChildByName("main_container")

	slot2:setTouchEnabled(false)

	slot0.label_name = slot2:getChildByName("Image_1"):getChildByName("name")
	slot0.head_icon_bg = slot2:getChildByName("item_panel"):getChildByName("Node_1")
	slot0.img_frame = slot2:getChildByName("item_panel"):getChildByName("Image_bg")
	slot0.label_need = slot2:getChildByName("limit")

	slot2:getChildByName("item_panel"):setTouchEnabled(false)
end

function EmoguoshiTujianItem.register_event(slot0)
end

function EmoguoshiTujianItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.data = slot1

	if not slot0.head then
		slot0.head = BackPackItem.new(true, true, nil, , false, true)

		slot0.head_icon_bg:addChild(slot0.head)
	end

	slot0.head:setBaseData(uv0:getGuoShiItemId(slot1.id), 1)
	slot0.head:setSwallowTouches(false)
	slot0.head:isChipSprite({})
	slot0.label_name:setString(TI18N(slot1.name))
	slot0.head:addBtnCallBack(function (...)
		uv0:openEmoguoTipsView(true, uv1.id, {
			juexing = true,
			id = uv1.id,
			level = uv0:getMaxLevel(uv1.id),
			star = uv0:getMaxStar(uv1.id)
		})
	end)
	slot0.label_need:setString("Lv." .. uv0:getMaxLevel(slot1.id))
end

function EmoguoshiTujianItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function EmoguoshiTujianItem.getData(slot0)
	return slot0.data
end

function EmoguoshiTujianItem.getItemPosition(slot0)
	if slot0 then
		return cc.p(slot0:getPosition())
	end
end

function EmoguoshiTujianItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
