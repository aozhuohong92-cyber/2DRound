slot1 = SmasheggController:getInstance():getModel()
slot2 = string.format
SmasheggRecordWindow = SmasheggRecordWindow or BaseClass(BaseView)

function SmasheggRecordWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "action/action_dial_record_window"
end

function SmasheggRecordWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("获奖记录"))
	slot1:getChildByName("myself_title"):setString(TI18N("个人记录"))
	slot1:getChildByName("all_title"):setString(TI18N("全服记录"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot2 = slot1:getChildByName("my_record_list")
	slot0.my_record_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 542,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 30,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = SmasheggRecordItem
	})

	slot0.my_record_scrollview:setSwallowTouches(false)

	slot5 = slot1:getChildByName("all_record_list")
	slot0.all_record_scrollview = CommonScrollViewLayout.new(slot5, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot5:getContentSize(), {
		start_y = 0,
		item_width = 542,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 30,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = SmasheggRecordItem
	})

	slot0.all_record_scrollview:setSwallowTouches(false)
end

function SmasheggRecordWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openSmasheggRecordWindow(false)
	end, false, 2)
	slot0:addGlobalEvent(SmasheggEvent.Update_Smashegg_Record_Event, function ()
		uv0:setData()
	end)
end

function SmasheggRecordWindow.setData(slot0)
	slot0.my_record_scrollview:setData(uv0:getMyselfRecordData(), nil, , 1)
	slot0.all_record_scrollview:setData(uv0:getAllRecordData(), nil, , 2)
end

function SmasheggRecordWindow.openRootWnd(slot0)
	uv0:sender16685(1)
end

function SmasheggRecordWindow.close_callback(slot0)
	if slot0.my_record_scrollview then
		slot0.my_record_scrollview:DeleteMe()

		slot0.my_record_scrollview = nil
	end

	if slot0.all_record_scrollview then
		slot0.all_record_scrollview:DeleteMe()

		slot0.all_record_scrollview = nil
	end

	uv0:openSmasheggRecordWindow(false)
end

SmasheggRecordItem = class("SmasheggRecordItem", function ()
	return ccui.Widget:create()
end)

function SmasheggRecordItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()

	slot0.r_type = 1
end

function SmasheggRecordItem.configUI(slot0)
	slot0.size = cc.size(542, 30)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)
end

function SmasheggRecordItem.register_event(slot0)
end

function SmasheggRecordItem.setExtendData(slot0, slot1)
	slot0.r_type = slot1 or 1
end

function SmasheggRecordItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.record_txt then
		slot0.record_txt = createRichLabel(24, cc.c3b(100, 50, 35), cc.p(0, 0.5), cc.p(0, slot0.size.height / 2), nil, , 542)

		slot0:addChild(slot0.record_txt)
	end

	if slot1.bid and Config.ItemData.data_get_data(slot1.bid) then
		slot3 = ""

		if slot0.r_type == 1 then
			slot3 = uv0(TI18N("获得  %sX%d"), slot2.name, slot1.num)
		elseif slot0.r_type == 2 then
			slot3 = uv0(TI18N("恭喜<div fontcolor=1c820a>  %s</div><div fontcolor=643223>  获得</div><div fontcolor=aa4b1e>  %sX%d</div>"), slot1.role_name, slot2.name, slot1.num)
		end

		slot0.record_txt:setString(slot3)
	end
end

function SmasheggRecordItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
