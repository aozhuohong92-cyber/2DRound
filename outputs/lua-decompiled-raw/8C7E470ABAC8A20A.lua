AnimateYuanzhenGotoKitchenWindow = AnimateYuanzhenGotoKitchenWindow or BaseClass(BaseView)
slot0 = AnimateActionController:getInstance()
slot1 = Config.HolidayMakeData.data_make_list
slot2 = Config.HolidayMakeData.data_make_lev_list
slot3 = Config.HolidayMakeData.data_make_lev_list
slot4 = table.insert
slot5 = table.sort

function AnimateYuanzhenGotoKitchenWindow.__init(slot0, slot1, slot2, slot3, slot4)
	slot0.holiday_id = slot1
	slot0.holiday_reward_bid = slot3
	slot0.make_lev = slot2
	slot0.cur_exp = slot4
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "animateaction/animate_yuanzhen_goto_kitchen"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("animateaction", "animateaction_yaunzhen"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/animateaction/barner", "animateaction_barner_1"),
			type = ResourcesType.single
		}
	}
end

function AnimateYuanzhenGotoKitchenWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("title_name"):setString(TI18N("收集福卡"))
	slot1:getChildByName("make_lev_text"):setString(TI18N("收集进度"))
	slot1:getChildByName("title_image"):getChildByName("title_image_text_1"):setString(TI18N("需要材料"))
	slot1:getChildByName("title_image"):getChildByName("title_image_text_2"):setString(TI18N("奖励"))

	slot0.title_banner = slot1:getChildByName("title_banner")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getTargetRes("bigbg/animateaction/barner", "animateaction_barner_1", false, false), ResourcesType.single, function ()
			if not tolua.isnull(uv0.title_banner) then
				loadSpriteTexture(uv0.title_banner, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.charge_num = CommonNum.new(26, slot1, 1, 1, cc.p(0, 0.5))

	slot0.charge_num:setPosition(105, 785)

	slot0.btn_more_lev = slot1:getChildByName("btn_more_lev")
	slot0.bar = slot1:getChildByName("bar")

	slot0.bar:setScale9Enabled(true)

	slot0.bar_num = slot1:getChildByName("bar_num")
	slot0.more_good_cons = slot1:getChildByName("more_good_cons")
	slot0.more_scrollview = CommonScrollViewLayout.new(slot0.more_good_cons, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.more_good_cons:getContentSize(), {
		start_y = 15,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.more_scrollview:setSwallowTouches(false)

	slot0.good_cons = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.good_cons, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.good_cons:getContentSize(), {
		start_y = 0,
		item_width = 608,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 167,
		space_y = 0,
		col = 1,
		item_class = AnimateYuanzhenGotoKitchenItem
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.btn_close = slot1:getChildByName("btn_close")
end

function AnimateYuanzhenGotoKitchenWindow.sortItemList(slot0, slot1)
	slot2 = {
		[0] = 0,
		1,
		2
	}

	uv0(slot1, function (slot0, slot1)
		if slot0.status ~= slot1.status then
			if uv0[slot0.status] and uv0[slot1.status] then
				return uv0[slot0.status] < uv0[slot1.status]
			else
				return false
			end
		else
			return slot0.id < slot1.id
		end
	end)
end

function AnimateYuanzhenGotoKitchenWindow.setTaskData(slot0, slot1)
	if slot0.item_scrollview then
		slot2 = {}
		slot6 = slot0.holiday_id

		for slot6, slot7 in pairs(uv0[slot6]) do
			slot8 = false

			for slot12, slot13 in pairs(slot7.loss) do
				slot14 = 0

				if ((not Config.ItemData.data_get_data(slot13[1]) or slot15.type ~= BackPackConst.item_type.ASSET or RoleController:getInstance():getRoleVo().coin) and BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot13[1])) < slot13[2] then
					slot8 = true

					break
				end
			end

			if slot8 == true then
				slot7.status = 1
			else
				slot7.status = 0

				if slot1 < slot7.lev then
					slot7.status = 1
				end
			end

			slot7.remain_num = slot7.limit - uv1:getModel():getKitchenRemainData(slot7.id)

			if slot7.remain_num == 0 then
				slot7.status = 2
			end

			uv2(slot2, slot7)
		end

		uv3(slot2, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
		slot0:sortItemList(slot2)
		slot0.item_scrollview:setData(slot2, nil, , {
			holiday_reward_bid = slot0.holiday_reward_bid,
			make_lev = slot1
		})
	end
end

function AnimateYuanzhenGotoKitchenWindow.openRootWnd(slot0)
	slot0.charge_num:setNum(slot0.make_lev)
	slot0:setTaskData(slot0.make_lev)
	slot0:setLevRedStatus()

	if slot0.make_lev + 1 >= #uv0[slot0.holiday_id] then
		slot1 = #uv0[slot0.holiday_id]
	end

	slot0.bar_num:setString(string.format("%d/%d", slot0.cur_exp, uv0[slot0.holiday_id][slot1].exp))

	slot8 = slot0.holiday_id

	slot0.bar:setPercent(slot0.cur_exp / uv0[slot8][slot1].exp * 100)

	slot3 = {}
	slot7 = slot0.holiday_id

	for slot7, slot8 in pairs(uv0[slot7][slot1].reward) do
		if deepCopy(Config.ItemData.data_get_data(slot8[1])) then
			slot9.quantity = slot8[2]

			table.insert(slot3, slot9)
		end
	end

	slot0.more_scrollview:setData(slot3)
	slot0.more_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.more_scrollview:getItemList()) do
			slot5:setDefaultTip()
		end
	end)
end

function AnimateYuanzhenGotoKitchenWindow.setLevRedStatus(slot0)
	if slot0.holiday_id then
		slot1 = false
		slot5 = slot0.holiday_id

		for slot5, slot6 in pairs(uv0[slot5]) do
			if uv1:getModel():getKitchenLevData(slot6.lev) == false and slot6.lev <= slot0.make_lev then
				slot1 = true

				break
			end
		end

		addRedPointToNodeByStatus(slot0.btn_more_lev, slot1)
	end
end

function AnimateYuanzhenGotoKitchenWindow.register_event(slot0)
	slot0:addGlobalEvent(AnimateActionEvent.YuanZhenFestval_Kitchen, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		uv0.charge_num:setNum(slot0.lev)

		if slot0.lev + 1 >= #uv1[uv0.holiday_id] then
			slot1 = #uv1[uv0.holiday_id]
		end

		uv0.bar_num:setString(string.format("%d/%d", slot0.exp, uv1[uv0.holiday_id][slot1].exp))
		uv0.bar:setPercent(slot0.exp / uv1[uv0.holiday_id][slot1].exp * 100)
		uv0:setTaskData(slot0.lev)
	end)
	slot0:addGlobalEvent(AnimateActionEvent.YuanZhenFestval_Kitchen_Lev, function (slot0)
		uv0:setLevRedStatus()
	end)
	registerButtonEventListener(slot0.btn_more_lev, function ()
		uv0:openAnimateYuanzhenKitchenLevWindow(true, uv1.holiday_id)
	end, true, 1)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openAnimateYuanzhenGotoKitchenWindow(false)
	end, true, 1)
end

function AnimateYuanzhenGotoKitchenWindow.close_callback(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	if slot0.more_scrollview then
		slot0.more_scrollview:DeleteMe()
	end

	slot0.more_scrollview = nil

	if slot0.charge_num then
		slot0.charge_num:DeleteMe()

		slot0.charge_num = nil
	end

	uv0:openAnimateYuanzhenGotoKitchenWindow(false)
end

AnimateYuanzhenGotoKitchenItem = class("AnimateYuanzhenGotoKitchenItem", function ()
	return ccui.Widget:create()
end)
slot6 = Config.HolidayMakeData.data_make_reward_list

function AnimateYuanzhenGotoKitchenItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function AnimateYuanzhenGotoKitchenItem.configUI(slot0)
	slot0.size = cc.size(608, 167)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("animateaction/animate_yuanzhen_goto_kitchen_item"))

	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.name_text = slot1:getChildByName("name_text")
	slot0.tesk_text = slot1:getChildByName("tesk_text")
	slot0.btn_goto = slot1:getChildByName("btn_goto")
	slot0.btn_goto_label = slot0.btn_goto:getChildByName("Text_3")
	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 4,
		start_x = 3,
		space_x = 5,
		row = 1,
		space_y = 4,
		col = 0,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.tesk_item = BackPackItem.new(nil, true, nil, 0.7)

	slot1:addChild(slot0.tesk_item)
	slot0.tesk_item:setPosition(cc.p(405, 62))
	slot0.tesk_item:setDefaultTip()
	slot0.tesk_item:setSwallowTouches(false)
end

function AnimateYuanzhenGotoKitchenItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_goto, function ()
		uv0:sender24806(uv1.data.id)
	end, true, 1)
end

function AnimateYuanzhenGotoKitchenItem.setExtendData(slot0, slot1)
	slot0.holiday_reward_bid = slot1.holiday_reward_bid
	slot0.lev = slot1.make_lev
end

function AnimateYuanzhenGotoKitchenItem.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.data = slot1

	slot0.name_text:setString(slot1.name)
	slot0.tesk_text:setString(string.format(TI18N("剩余制作次数: %d次"), slot1.remain_num))

	slot9 = uv0[slot0.holiday_reward_bid][slot1.id].reward[1][2]

	slot0.tesk_item:setBaseData(uv0[slot0.holiday_reward_bid][slot1.id].reward[1][1], slot9)

	slot5 = {}

	for slot9, slot10 in pairs(slot1.loss) do
		if deepCopy(Config.ItemData.data_get_data(slot10[1])) then
			slot11.quantity = slot10[2]

			table.insert(slot5, slot11)
		end
	end

	slot0.item_scrollview:setData(slot5)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot6 = 0

			slot5:setNeedNum(slot5:getData().quantity, (slot5:getData().type ~= BackPackConst.item_type.ASSET or RoleController:getInstance():getRoleVo().coin) and BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot5:getData().id), 0)
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)

	if slot1.status == 0 then
		slot0.btn_goto_label:setString(TI18N("制作"))

		if slot1.lev <= slot0.lev then
			setChildUnEnabled(false, slot0.btn_goto)
			slot0.btn_goto_label:setColor(cc.c4b(37, 85, 5, 255))
		else
			setChildUnEnabled(true, slot0.btn_goto)
			slot0.btn_goto_label:setString(string.format(TI18N("%d级开启"), slot1.lev))
			slot0.btn_goto_label:setColor(cc.c4b(255, 255, 255, 255))
		end
	else
		if slot1.status == 2 then
			slot0.btn_goto_label:setString(TI18N("大丰收"))
		elseif slot1.lev <= slot0.lev then
			slot0.btn_goto_label:setString(TI18N("制作"))
		else
			slot0.btn_goto_label:setString(string.format(TI18N("%d级开启"), slot1.lev))
		end

		setChildUnEnabled(true, slot0.btn_goto)
		slot0.btn_goto_label:setColor(cc.c4b(255, 255, 255, 255))
	end
end

function AnimateYuanzhenGotoKitchenItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	if slot0.tesk_item then
		slot0.tesk_item:DeleteMe()

		slot0.tesk_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
