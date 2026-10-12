AnimateYuanzhenKitchenLevWindow = AnimateYuanzhenKitchenLevWindow or BaseClass(BaseView)
slot0 = AnimateActionController:getInstance()
slot1 = Config.HolidayMakeData.data_make_lev_list
slot2 = Config.HolidayMakeData.data_make_list
slot3 = table.insert
slot4 = table.sort

function AnimateYuanzhenKitchenLevWindow.__init(slot0, slot1)
	slot0.holiday_id = slot1
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "animateaction/animate_yuanzhen_kitchen_lev"
end

function AnimateYuanzhenKitchenLevWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 608,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 167,
		space_y = 0,
		col = 1,
		item_class = AnimateYuanzhenKitchenLevItem
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.btn_close = slot1:getChildByName("btn_close")
end

function AnimateYuanzhenKitchenLevWindow.openRootWnd(slot0)
	uv0:sender24805()
end

function AnimateYuanzhenKitchenLevWindow.sortItemList(slot0, slot1)
	uv0(slot1, function (slot0, slot1)
		if slot0.status == 1 and slot1.status == 0 then
			return false
		elseif slot0.status == 0 and slot1.status == 1 then
			return true
		else
			return slot0.lev < slot1.lev
		end
	end)
end

function AnimateYuanzhenKitchenLevWindow.register_event(slot0)
	slot0:addGlobalEvent(AnimateActionEvent.YuanZhenFestval_Kitchen_Lev, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		if uv0.item_scrollview then
			slot1 = {}
			slot5 = uv0.holiday_id

			for slot5, slot6 in pairs(uv1[slot5]) do
				if uv2:getModel():getKitchenLevData(slot6.lev) == true then
					slot6.status = 1
				else
					slot6.status = 0
				end

				uv3(slot1, slot6)
			end

			uv4(slot1, function (slot0, slot1)
				return slot0.lev < slot1.lev
			end)
			uv0:sortItemList(slot1)
			uv0.item_scrollview:setData(slot1, nil, nil, {
				make_lev = slot0.lev,
				holiday_id = uv0.holiday_id
			})
		end
	end)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openAnimateYuanzhenKitchenLevWindow(false)
	end, true, 1)
end

function AnimateYuanzhenKitchenLevWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openAnimateYuanzhenKitchenLevWindow(false)
end

AnimateYuanzhenKitchenLevItem = class("AnimateYuanzhenKitchenLevItem", function ()
	return ccui.Widget:create()
end)

function AnimateYuanzhenKitchenLevItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function AnimateYuanzhenKitchenLevItem.configUI(slot0)
	slot0.size = cc.size(608, 167)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("animateaction/animate_yuanzhen_kitchen_lev_item"))

	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.title_name = slot1:getChildByName("title_name")
	slot0.btn_get = slot1:getChildByName("btn_get")
	slot0.btn_get_label = slot0.btn_get:getChildByName("Text_1")

	slot0.btn_get_label:setString(TI18N("领取"))

	slot0.has_spr = slot1:getChildByName("has_spr")

	slot0.has_spr:setVisible(false)

	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 5,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.title_text = createRichLabel(24, cc.c4b(100, 50, 35, 255), cc.p(1, 0.5), cc.p(583, 143), nil, nil, 500)

	slot1:addChild(slot0.title_text)
end

function AnimateYuanzhenKitchenLevItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data then
			uv1:sender24807(uv0.data.lev)
		end
	end, true, 1)
end

function AnimateYuanzhenKitchenLevItem.setExtendData(slot0, slot1)
	slot0.make_lev = slot1.make_lev
	slot0.reward_id = slot1.holiday_id
end

function AnimateYuanzhenKitchenLevItem.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.data = slot1

	slot0.title_name:setString(string.format(TI18N("制作等级: %d级"), slot1.lev))
	slot0.title_text:setString(string.format(TI18N("解锁制作: <div fontcolor=#c85a00 >%s</div>"), slot1.unlock_name))
	slot0.btn_get:setVisible(slot1.status == 0)
	slot0.has_spr:setVisible(slot1.status == 1)

	if slot1.lev <= slot0.make_lev then
		setChildUnEnabled(false, slot0.btn_get)
		slot0.btn_get_label:setColor(cc.c4b(113, 40, 4, 255))
	else
		setChildUnEnabled(true, slot0.btn_get)
		slot0.btn_get_label:setColor(cc.c4b(255, 255, 255, 255))
	end

	slot3 = {}
	slot7 = slot1.lev

	for slot7, slot8 in pairs(uv0[slot0.reward_id][slot7].reward) do
		if deepCopy(Config.ItemData.data_get_data(slot8[1])) then
			slot9.quantity = slot8[2]

			table.insert(slot3, slot9)
		end
	end

	slot0.item_scrollview:setData(slot3)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
		end
	end)
end

function AnimateYuanzhenKitchenLevItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
