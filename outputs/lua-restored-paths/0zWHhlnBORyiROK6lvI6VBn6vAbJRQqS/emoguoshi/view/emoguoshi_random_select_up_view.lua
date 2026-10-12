EmoguoshiRandomSelectUpView = EmoguoshiRandomSelectUpView or BaseClass(BaseView)
slot0 = EmoguoshiController:getInstance()

function EmoguoshiRandomSelectUpView.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.layout_name = "emoguoshitujian/emoguoshi_zhaohuan_xinyuan_panel"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
end

function EmoguoshiRandomSelectUpView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("bg")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.btn_close = slot0.main_container:getChildByName("close_btn")
	slot0.btn_ok = slot0.main_container:getChildByName("button_2")
	slot0.btn_close1 = slot0.main_container:getChildByName("button_1")
	slot0.select_node_bg = slot0.main_container:getChildByName("Panel_1"):getChildByName("Node_2")
	slot1 = slot0.main_container:getChildByName("Panel_2"):getChildByName("ListView_1")

	slot1:setTouchEnabled(false)

	slot0.item_scrollview = CommonScrollViewLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		item_width = 119,
		start_x = 0,
		space_x = 5,
		row = 0,
		item_height = 119,
		space_y = 10,
		col = 5,
		item_class = EmoguoshiRandomSelectUpItem
	})
end

function EmoguoshiRandomSelectUpView.register_event(slot0)
	slot0.background:setTouchEnabled(true)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEmoguoRandomSelectUpView(false)
		end
	end)
	slot0.btn_close:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openEmoguoRandomSelectUpView(false)
	end, true)
	slot0.btn_close1:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_close1, function ()
		uv0:openEmoguoRandomSelectUpView(false)
	end, true)
	slot0.btn_ok:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_ok, function ()
		if uv0.call_back and uv0.select_item_index then
			uv0.call_back(uv0.select_item_index)
		end

		uv1:openEmoguoRandomSelectUpView(false)
	end, true)
end

function EmoguoshiRandomSelectUpView.setSelect(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.select_item then
		slot0.select_item = BackPackItem.new(true, true, nil, nil, false, true)

		slot0.select_node_bg:addChild(slot0.select_item)
	end

	slot0.select_item:setBaseData(slot1.item_id, 1)

	slot0.select_item_index = slot1
end

function EmoguoshiRandomSelectUpView.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.bid = slot1
	slot0.call_back = slot2

	slot0:setSelect(slot3)

	if not Config.EmoguoshitujianData.data_get_random_do_data[slot1] then
		return
	end

	slot5 = {}

	for slot9, slot10 in pairs(slot4) do
		table.insert(slot5, slot10.group_id)
	end

	slot6 = {}

	for slot10, slot11 in pairs(slot5) do
		for slot16, slot17 in pairs(Config.EmoguoshitujianData.data_get_random_group_data[slot11]) do
			if slot17.up_add_weight > 0 then
				table.insert(slot6, deepCopy(slot17))
			end
		end
	end

	table.sort(slot6, function (slot0, slot1)
		if slot0.item_id ~= slot1.item_id then
			return slot0.item_id < slot1.item_id
		end

		if slot0.id ~= slot1.id then
			return slot0.id < slot1.id
		end

		return slot0.group_id < slot1.group_id
	end)
	slot0.item_scrollview:setData(slot6, function (slot0)
		uv0:setSelect(slot0)
	end)
end

function EmoguoshiRandomSelectUpView.close_callback(slot0)
	uv0:openEmoguoRandomSelectUpView(false)
end

EmoguoshiRandomSelectUpItem = class("EmoguoshiRandomSelectUpItem", function ()
	return ccui.Layout:create()
end)

function EmoguoshiRandomSelectUpItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function EmoguoshiRandomSelectUpItem.configUI(slot0)
	slot1 = BackPackItem.new(true, true, nil, nil, false, true)
	slot0.size = cc.size(119, 119)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot1:setPosition(slot0.size.width / 2, slot0.size.height / 2)
	slot0:addChild(slot1)

	slot0.item = slot1

	slot1:addBtnCallBack(function (...)
		if uv0.callback then
			uv0.callback(uv0.data)
		end
	end)
end

function EmoguoshiRandomSelectUpItem.register_event(slot0)
end

function EmoguoshiRandomSelectUpItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.data = slot1

	slot0.item:setBaseData(slot1.item_id, 1)
end

function EmoguoshiRandomSelectUpItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function EmoguoshiRandomSelectUpItem.getData(slot0)
	return slot0.data
end

function EmoguoshiRandomSelectUpItem.getItemPosition(slot0)
	if slot0 then
		return cc.p(slot0:getPosition())
	end
end

function EmoguoshiRandomSelectUpItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
