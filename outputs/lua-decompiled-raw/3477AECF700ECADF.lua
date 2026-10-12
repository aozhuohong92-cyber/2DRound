EmoguoshiSuipianSelectView = EmoguoshiSuipianSelectView or BaseClass(BaseView)
slot0 = EmoguoshiController:getInstance()
slot1 = {}
slot2 = 0

function EmoguoshiSuipianSelectView.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "emoguoshitujian/emoguoshi_select_panel"
	slot0.res_list = {}
end

function EmoguoshiSuipianSelectView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("bg")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.btn_close = slot0.main_container:getChildByName("close_btn")
	slot0.item_bg = slot0.main_container:getChildByName("Panel_item")
	slot0.label_num = slot0.main_container:getChildByName("num")
	slot0.btn_onkey = slot0.main_container:getChildByName("button_1")

	slot0.btn_onkey:getChildByName("label"):setString(TI18N("一键添加"))

	slot0.btn_ok = slot0.main_container:getChildByName("button_2")

	slot0.btn_ok:getChildByName("label"):setString(TI18N("确定"))

	slot1 = slot0.main_container:getChildByName("Panel_2"):getChildByName("ListView_1")
	slot0.empty_tips = slot0.main_container:getChildByName("Panel_2"):getChildByName("label")
	slot0.tips = slot0.main_container:getChildByName("tips")

	slot1:setTouchEnabled(false)

	slot0.item_scrollview = CommonScrollViewLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		item_width = 620,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 140,
		space_y = 10,
		col = 1,
		item_class = EmoguoshiSuiPianSelectItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function EmoguoshiSuipianSelectView.register_event(slot0)
	registerButtonEventListener(slot0.background, function (...)
		uv0:openEmoguoshiSuipianSelectView(false)
	end, false, 1)
	slot0.btn_close:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_close, function (...)
		uv0:openEmoguoshiSuipianSelectView(false)
	end, true, 2)
	slot0.btn_onkey:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_onkey, function (...)
		uv0 = {}

		for slot4, slot5 in pairs(uv1.item_scrollview:getItemList()) do
			slot5:setNum(slot5.max_num)
		end
	end, true, 2)
	slot0.btn_ok:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_ok, function (...)
		if uv0.call_back then
			uv0.call_back(uv1)
		end

		uv2:openEmoguoshiSuipianSelectView(false)
	end, true, 2)
end

function EmoguoshiSuipianSelectView.updateSelectNum(slot0, ...)
	for slot5, slot6 in pairs(uv0) do
		slot1 = 0 + slot6
	end

	slot0.label_num:setString(slot1 .. "/" .. uv1)
end

function EmoguoshiSuipianSelectView.updateAllData(slot0, ...)
	slot1 = {}
	slot6 = true

	for slot6, slot7 in pairs(BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.EMOGUOSHI, slot6)) do
		if uv0:isWanNengSuiPian(slot7.base_id) and slot0:isHit(slot7.base_id) then
			table.insert(slot1, slot7)
		end
	end

	slot0.empty_tips:setVisible(#slot1 <= 0)

	slot3 = string.format(TI18N("可放入已满星的%s品质恶魔果实碎片"), slot0:getQualityName())

	slot0.empty_tips:setString(slot3)
	slot0.tips:setString(slot3)
	slot0.item_scrollview:setData(slot1, function (...)
		uv0:updateSelectNum()
	end)
end

function EmoguoshiSuipianSelectView.isHit(slot0, slot1)
	if not Config.ItemData.data_get_data(slot1) then
		return false
	end

	return slot0.quality == slot2.quality
end

function EmoguoshiSuipianSelectView.getQualityName(slot0, ...)
	return BackPackConst.quality_name[slot0.quality]
end

function EmoguoshiSuipianSelectView.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.show_id = slot1
	uv0 = slot2 or 0
	slot0.call_back = slot3
	uv1 = {}

	if slot1 then
		if not Config.ItemData.data_get_data(slot1) then
			return
		end

		slot0.quality = slot4.quality
		slot5 = BackPackItem.new(true, true, nil, , false, true)

		slot0.item_bg:addChild(slot5)
		slot5:setBaseData(slot1, 1)

		slot6 = slot0.item_bg:getContentSize()

		slot5:setPosition(slot6.width / 2, slot6.height / 2)
	end

	slot0:updateAllData()
	slot0:updateSelectNum()
end

function EmoguoshiSuipianSelectView.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openEmoguoshiSuipianSelectView(false)
end

EmoguoshiSuiPianSelectItem = class("EmoguoshiSuiPianSelectItem", function ()
	return ccui.Layout:create()
end)

function EmoguoshiSuiPianSelectItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function EmoguoshiSuiPianSelectItem.configUI(slot0)
	slot1 = createCSBNote(PathTool.getTargetCSB("emoguoshitujian/emoguoshi_select_item"))
	slot0.size = slot1:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:addChild(slot1)

	slot2 = slot1:getChildByName("main_panel")

	slot2:setTouchEnabled(false)

	slot3 = slot2:getChildByName("Panel_item")
	slot0.item = BackPackItem.new(true, true, nil, , false, true)

	slot3:addChild(slot0.item)

	slot4 = slot3:getContentSize()

	slot0.item:setPosition(slot4.width / 2, slot4.height / 2)

	slot0.label_num = slot2:getChildByName("num")
	slot0.btn_sub = slot2:getChildByName("min_btn")
	slot0.btn_add = slot2:getChildByName("plus_btn")
	slot0.btn_max = slot2:getChildByName("max_btn")
	slot0.slider_bar = slot2:getChildByName("slider")

	slot0.slider_bar:setPercent(0)

	slot0.max_num = 0
	slot0.use_num = 0
end

function EmoguoshiSuiPianSelectItem.setNum(slot0, slot1, slot2)
	if not slot0.data then
		return
	end

	if slot1 < 0 then
		slot1 = 0
	end

	if slot0.max_num < slot1 then
		slot1 = slot0.max_num
	end

	for slot8, slot9 in pairs(uv0) do
		if slot8 ~= slot0.data.id then
			slot4 = 0 + slot9
		end
	end

	if slot1 > uv1 - slot4 then
		slot1 = slot5
	end

	uv0[slot3] = slot1
	slot0.use_num = slot1

	slot0.label_num:setString(slot1)

	slot0.is_in_set_per = true
	slot6 = 0

	if slot0.max_num > 0 then
		slot6 = slot1 / slot0.max_num * 100
	end

	slot0.slider_bar:setPercent(slot6)

	slot0.is_in_set_per = false

	if slot0.callback then
		slot0.callback()
	end
end

function EmoguoshiSuiPianSelectItem.register_event(slot0)
	slot0.btn_sub:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_sub, function (...)
		uv0:setNum(uv0.use_num - 1)
	end, true, 2)
	slot0.btn_add:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_add, function (...)
		uv0:setNum(uv0.use_num + 1)
	end, true, 2)
	slot0.btn_max:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_max, function (...)
		uv0:setNum(uv0.max_num)
	end, true, 2)
	slot0.slider_bar:addEventListener(function (slot0, slot1)
		if slot1 == 0 and not uv0.is_in_set_per then
			uv0:setNum(math.ceil(uv0.max_num * uv0.slider_bar:getPercent() / 100), true)
		end
	end)
end

function EmoguoshiSuiPianSelectItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.data = slot1

	slot0.item:setData(slot1)

	slot0.max_num = slot1.quantity
end

function EmoguoshiSuiPianSelectItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function EmoguoshiSuiPianSelectItem.getData(slot0)
	return slot0.data
end

function EmoguoshiSuiPianSelectItem.getItemPosition(slot0)
	if slot0 then
		return cc.p(slot0:getPosition())
	end
end

function EmoguoshiSuiPianSelectItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
