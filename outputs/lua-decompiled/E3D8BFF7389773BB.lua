EmoguoshiRandomShowView = EmoguoshiRandomShowView or BaseClass(BaseView)
slot0 = EmoguoshiController:getInstance()

function EmoguoshiRandomShowView.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.layout_name = "emoguoshitujian/emoguoshi_zhaohuan_yulan"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
end

function EmoguoshiRandomShowView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("bg")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot1 = slot0.main_container:getChildByName("ListView_1")

	slot1:setTouchEnabled(false)

	slot0.item_scrollview = CommonScrollViewLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		item_width = 119,
		start_x = 30,
		space_x = 20,
		row = 0,
		item_height = 149,
		space_y = 10,
		col = 4,
		item_class = EmoguoshiRandomShowItem
	})
end

function EmoguoshiRandomShowView.register_event(slot0)
	slot0.background:setTouchEnabled(true)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEmoguoRandomShowView(false)
		end
	end)
end

function EmoguoshiRandomShowView.openRootWnd(slot0, slot1)
	slot0.bid = slot1

	if not Config.EmoguoshitujianData.data_get_random_show_data[slot1] then
		return
	end

	slot0.item_scrollview:setData(slot2)
end

function EmoguoshiRandomShowView.close_callback(slot0)
	uv0:openEmoguoRandomShowView(false)
end

EmoguoshiRandomShowItem = class("EmoguoshiRandomShowItem", function ()
	return ccui.Layout:create()
end)

function EmoguoshiRandomShowItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function EmoguoshiRandomShowItem.configUI(slot0)
	slot1 = BackPackItem.new(true, true, nil, nil, false, true)
	slot2 = 30
	slot0.size = cc.size(119, 119 + slot2)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot1:setPosition(slot0.size.width / 2, slot0.size.height / 2 + slot2 / 2)
	slot0:addChild(slot1)

	slot0.item = slot1
	slot0.label_prob = createLabel(20)

	slot0.label_prob:setPosition(slot0.size.width / 2, 15)
	slot0:addChild(slot0.label_prob)
	slot0.label_prob:setAnchorPoint(cc.p(0.5, 0.5))
end

function EmoguoshiRandomShowItem.register_event(slot0)
end

function EmoguoshiRandomShowItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.data = slot1

	slot0.item:setBaseData(slot1.item_id, slot1.item_num)
	slot0.label_prob:setString(100 * slot1.prob .. "%")
end

function EmoguoshiRandomShowItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function EmoguoshiRandomShowItem.getData(slot0)
	return slot0.data
end

function EmoguoshiRandomShowItem.getItemPosition(slot0)
	if slot0 then
		return cc.p(slot0:getPosition())
	end
end

function EmoguoshiRandomShowItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
