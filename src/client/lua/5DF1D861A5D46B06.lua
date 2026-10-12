slot1 = DialActionController:getInstance():getModel()
slot2 = table.insert
DialAwardWindow = DialAwardWindow or BaseClass(BaseView)

function DialAwardWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "seven_goal/seven_goal_adventure_lev_reward"
end

function DialAwardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("Text_1"):setString(TI18N("积分奖励"))

	slot0.btn_close = slot1:getChildByName("btn_close")
	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 608,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 167,
		space_y = 10,
		col = 1,
		need_dynamic = true,
		item_class = DialAwardItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function DialAwardWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openDialAwardWindow(false)
	end, false, 2)
	slot0:addGlobalEvent(DialActionEvent.Update_Dial_Data_Event, function ()
		uv0:setData()
	end)
end

function DialAwardWindow.openRootWnd(slot0)
	slot0:setData()
end

function DialAwardWindow.setData(slot0)
	if not uv0:getDialAwardData() or next(slot1) == nil then
		return
	end

	slot2 = {}
	slot3 = uv0:getDialHolidayLv()

	for slot7, slot8 in pairs(slot1) do
		if Config.HolidayDialData.data_score_award[slot8.id] then
			for slot13, slot14 in pairs(slot9) do
				if slot14.limit_lev_min <= slot3 and slot3 <= slot14.limit_lev_max then
					uv1(slot2, {
						id = slot8.id,
						status = slot8.status,
						config = slot14
					})

					break
				end
			end
		end
	end

	slot4 = {
		[0] = 2,
		1,
		3
	}

	table.sort(slot2, function (slot0, slot1)
		if slot0.status ~= slot1.status then
			return uv0[slot0.status] < uv0[slot1.status]
		else
			return slot0.id < slot1.id
		end
	end)
	slot0.item_scrollview:setData(slot2)
end

function DialAwardWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openDialAwardWindow(false)
end

DialAwardItem = class("DialAwardItem", function ()
	return ccui.Widget:create()
end)

function DialAwardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function DialAwardItem.configUI(slot0)
	slot0.size = cc.size(608, 167)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("seven_goal/seven_goal_adventure_lev_reward_item"))

	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.title_name = slot1:getChildByName("title_name")
	slot0.btn_get = slot1:getChildByName("btn_get")
	slot0.btn_get_label = slot0.btn_get:getChildByName("Text_1")

	slot0.btn_get_label:setString(TI18N("领取"))
	slot0.btn_get:setVisible(false)

	slot0.has_spr = slot1:getChildByName("has_spr")

	slot0.has_spr:setVisible(false)

	slot0.num_txt = slot1:getChildByName("num_txt")
	slot2 = slot1:getChildByName("good_cons")
	slot0.goods_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 5,
		start_x = 0,
		need_dynamic = true,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.goods_scrollview:setSwallowTouches(false)
end

function DialAwardItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data then
			uv1:sender16673(uv0.data.id)
		end
	end, true, 1)
end

function DialAwardItem.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.data = slot1

	slot0.has_spr:setVisible(slot1.status == 2)

	if slot1.status == 0 then
		slot0.btn_get:setVisible(true)
		setChildUnEnabled(true, slot0.btn_get)
	elseif slot1.status == 1 then
		slot0.btn_get:setVisible(true)
		setChildUnEnabled(false, slot0.btn_get)
	else
		slot0.btn_get:setVisible(false)
	end

	slot2 = {}

	if slot1.config then
		for slot6, slot7 in pairs(slot1.config.award_list or {}) do
			slot10 = deepCopy(Config.ItemData.data_get_data(slot7[1]))
			slot10.quantity = slot7[2]

			uv0(slot2, slot10)
		end

		slot0.title_name:setString(string.format(TI18N("累积抽取%d次"), slot1.config.num or 0))
		slot0.num_txt:setString(string.format("(%d/%d)", uv1:getDialScore(), slot1.config.num))
		slot0.num_txt:setVisible(true)
	end

	slot0.goods_scrollview:setData(slot2)
	slot0.goods_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.goods_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
end

function DialAwardItem.DeleteMe(slot0)
	if slot0.goods_scrollview then
		slot0.goods_scrollview:DeleteMe()
	end

	slot0.goods_scrollview = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
