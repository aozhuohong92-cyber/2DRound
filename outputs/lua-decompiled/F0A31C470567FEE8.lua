slot1 = HeavenController:getInstance():getModel()
slot2 = string.format
HeavenDialRecordWindow = HeavenDialRecordWindow or BaseClass(BaseView)

function HeavenDialRecordWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "action/action_dial_record_window"
end

function HeavenDialRecordWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("维修记录"))
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
		item_class = HeavenDialRecordItem
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
		item_class = HeavenDialRecordItem
	})

	slot0.all_record_scrollview:setSwallowTouches(false)
end

function HeavenDialRecordWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHeavenDialRecordWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHeavenDialRecordWindow(false)
	end, true, 2)
	slot0:addGlobalEvent(HeavenEvent.Update_Dial_Record_Data, function ()
		uv0:setData()
	end)
end

function HeavenDialRecordWindow.setData(slot0)
	slot0.my_record_scrollview:setData(uv0:getMyselfDialRecordData(), nil, nil, 1)
	slot0.all_record_scrollview:setData(uv0:getAllDialRecordData(slot0.group_id), nil, nil, 2)
end

function HeavenDialRecordWindow.openRootWnd(slot0, slot1)
	slot0.group_id = slot1

	uv0:sender25218(1, 0)
end

function HeavenDialRecordWindow.close_callback(slot0)
	if slot0.my_record_scrollview then
		slot0.my_record_scrollview:DeleteMe()

		slot0.my_record_scrollview = nil
	end

	if slot0.all_record_scrollview then
		slot0.all_record_scrollview:DeleteMe()

		slot0.all_record_scrollview = nil
	end

	uv0:openHeavenDialRecordWindow(false)
end

HeavenDialRecordItem = class("HeavenDialRecordItem", function ()
	return ccui.Widget:create()
end)

function HeavenDialRecordItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()

	slot0.r_type = 1
end

function HeavenDialRecordItem.configUI(slot0)
	slot0.size = cc.size(542, 30)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)
end

function HeavenDialRecordItem.register_event(slot0)
end

function HeavenDialRecordItem.setExtendData(slot0, slot1)
	slot0.r_type = slot1 or 1
end

function HeavenDialRecordItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.record_txt then
		slot0.record_txt = createRichLabel(24, cc.c3b(100, 50, 35), cc.p(0, 0.5), cc.p(0, slot0.size.height / 2), nil, nil, 542)

		slot0:addChild(slot0.record_txt)
	end

	if slot1.bid and Config.ItemData.data_get_data(slot1.bid) then
		slot3 = ""

		if slot0.r_type == 1 then
			slot3 = uv0(TI18N("获得  <div fontcolor=%s>  %s*%d</div>"), BackPackConst.getWhiteQualityColorStr(slot2.quality), slot2.name, slot1.num)
		elseif slot0.r_type == 2 then
			slot3 = uv0(TI18N("恭喜<div fontcolor=1c820a>  %s</div><div fontcolor=643223>  获得</div><div fontcolor=%s>  %s*%d</div>"), slot1.role_name, slot4, slot2.name, slot1.num)
		end

		slot0.record_txt:setString(slot3)
	end
end

function HeavenDialRecordItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
