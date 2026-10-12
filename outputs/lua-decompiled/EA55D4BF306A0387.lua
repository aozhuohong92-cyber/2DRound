EmoguoshiStarTipsView = EmoguoshiStarTipsView or BaseClass(BaseView)
slot0 = EmoguoshiController:getInstance()

function EmoguoshiStarTipsView.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.layout_name = "emoguoshitujian/emoguoshi_xiaoguoyulan_tips"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
end

function EmoguoshiStarTipsView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("bg")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot1 = slot0.main_container:getChildByName("ListView_1")

	slot1:setTouchEnabled(false)

	slot0.item_scrollview = CommonScrollViewLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		item_width = 600,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 80,
		space_y = 10,
		col = 1,
		item_class = EmoguoshiStarTipsItem
	})
end

function EmoguoshiStarTipsView.register_event(slot0)
	slot0.background:setTouchEnabled(true)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEmoguoStarTipsView(false)
		end
	end)
end

function EmoguoshiStarTipsView.openRootWnd(slot0, slot1, slot2)
	slot0.id = slot1
	slot0.show_info = slot2

	if slot2 then
		slot0.id = slot2.id
	end

	slot4 = {}

	for slot9 = 1, uv0:getMaxStar(slot0.id) do
		if uv0:getPropStar(slot0.id, slot9) and slot10.desc ~= "" then
			table.insert(slot4, {
				uv0:getGuoShiStar(slot0.id),
				slot10
			})
		end
	end

	table.sort(slot4, function (slot0, slot1)
		return slot0[2].star < slot1[2].star
	end)
	slot0.item_scrollview:setData(slot4)
end

function EmoguoshiStarTipsView.close_callback(slot0)
	uv0:openEmoguoStarTipsView(false)
end

EmoguoshiStarTipsItem = class("EmoguoshiStarTipsItem", function ()
	return ccui.Layout:create()
end)

function EmoguoshiStarTipsItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function EmoguoshiStarTipsItem.configUI(slot0)
	slot1 = createCSBNote(PathTool.getTargetCSB("emoguoshitujian/emoguoshi_xiaoguoyulan_tips_item"))
	slot0.size = slot1:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:addChild(slot1)

	slot2 = slot1:getChildByName("main_container")

	slot2:setTouchEnabled(false)

	slot0.img_light = slot2:getChildByName("Image_1")
	slot0.label_desc = slot2:getChildByName("label")
end

function EmoguoshiStarTipsItem.register_event(slot0)
end

function EmoguoshiStarTipsItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.data = slot1

	slot0.label_desc:setString(TI18N(slot1[2].desc))

	if slot1[2].star <= slot1[1] then
		slot0.img_light:loadTexture("emoguoshi_08.png", LOADTEXT_TYPE_PLIST)
		slot0.label_desc:setTextColor(cc.c3b(0, 162, 34))
	end
end

function EmoguoshiStarTipsItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function EmoguoshiStarTipsItem.getData(slot0)
	return slot0.data
end

function EmoguoshiStarTipsItem.getItemPosition(slot0)
	if slot0 then
		return cc.p(slot0:getPosition())
	end
end

function EmoguoshiStarTipsItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
