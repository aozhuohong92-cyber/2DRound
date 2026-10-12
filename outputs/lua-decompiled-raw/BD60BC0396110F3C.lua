TreasureMyServerWindow = TreasureMyServerWindow or BaseClass(BaseView)
slot0 = FestivalActionController:getInstance()
slot1 = string.format

function TreasureMyServerWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "festivalaction/treasure_my_server_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("treasure", "treasure"),
			type = ResourcesType.plist
		}
	}
end

function TreasureMyServerWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("Image_2"):getChildByName("Text_1"):setString(TI18N("个人记录"))

	slot0.btn_close = slot1:getChildByName("btn_close")
	slot0.btn_sure = slot1:getChildByName("btn_sure")
	slot0.my_recont_scroll = slot1:getChildByName("my_recont_scroll")
	slot0.my_scrollview = CommonScrollViewLayout.new(slot0.my_recont_scroll, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.my_recont_scroll:getContentSize(), {
		start_y = 0,
		item_width = 606,
		start_x = 2,
		space_x = 0,
		row = 0,
		item_height = 274,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = TreasureMyServerItem
	})

	slot0.my_scrollview:setSwallowTouches(false)
end

function TreasureMyServerWindow.openRootWnd(slot0)
	uv0:sender25704()
end

function TreasureMyServerWindow.register_event(slot0)
	slot0:addGlobalEvent(FestivalActionEvent.Treasure_MyServer_Event, function (slot0)
		if slot0 and slot0.logs then
			if next(slot0.logs) == nil then
				commonShowEmptyIcon(uv0.my_recont_scroll, true, {
					text = TI18N("暂无记录，努力参与吧~~~")
				})
			else
				uv0.my_scrollview:setData(slot0.logs)
			end
		end
	end)
	registerButtonEventListener(slot0.btn_sure, function ()
		uv0:openTreasureMyServerView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openTreasureMyServerView(false)
	end, true, 2)
end

function TreasureMyServerWindow.close_callback(slot0)
	if slot0.my_scrollview then
		slot0.my_scrollview:DeleteMe()

		slot0.my_scrollview = nil
	end

	uv0:openTreasureMyServerView(false)
end

TreasureMyServerItem = class("TreasureMyServerItem", function ()
	return ccui.Widget:create()
end)

function TreasureMyServerItem.ctor(slot0)
	slot0.my_number_list = {}

	slot0:configUI()
end

function TreasureMyServerItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("festivalaction/treasure_my_server_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(606, 274))

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.name = slot1:getChildByName("name")

	slot0.name:setString("")

	slot0.time = slot1:getChildByName("time")

	slot0.time:setString("")

	slot0.is_open_text = slot1:getChildByName("is_open_text")

	slot0.is_open_text:setString("")
	slot1:getChildByName("luckly_text"):setString(TI18N("幸运号码："))

	slot0.luckly_num = slot1:getChildByName("luckly_num")

	slot0.luckly_num:setString("")
	slot1:getChildByName("luckly_text_0"):setString(TI18N("个人参与人次："))

	slot0.my_join_num = slot1:getChildByName("my_join_num")

	slot0.my_join_num:setString("")

	slot0.join_num = createRichLabel(24, FestivalActionConst.ColorConst[1], cc.p(0, 0.5), cc.p(297, 142), nil, , 100)

	slot1:addChild(slot0.join_num)
	slot1:getChildByName("luckly_text_0_0"):setString(TI18N("我的号码："))

	slot0.open_spr = slot1:getChildByName("open_spr")

	slot0.open_spr:setVisible(false)

	slot0.no_open_spr = slot1:getChildByName("no_open_spr")

	slot0.no_open_spr:setVisible(false)

	slot2 = slot1:getChildByName("my_num_scroll")
	slot0.my_number_scroll = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 100,
		start_x = 0,
		space_x = -13,
		row = 1,
		item_height = 30,
		space_y = 0,
		col = 5,
		need_dynamic = true,
		item_class = MyServerNumberItem
	})

	slot0.my_number_scroll:setSwallowTouches(false)

	slot0.goods_item = BackPackItem.new(nil, true, nil, 0.8, false)

	slot1:addChild(slot0.goods_item)
	slot0.goods_item:setPosition(cc.p(63, 173))
end

function TreasureMyServerItem.setData(slot0, slot1)
	slot0.name:setString(slot1.award_name)

	if slot1.time == 0 then
		if slot1.win_num == 0 then
			slot0.is_open_text:setString(TI18N("未开奖"))
			slot0.luckly_num:setString("？？？")
			slot0.no_open_spr:setVisible(false)
			slot0.open_spr:setVisible(false)
		elseif slot1.win_num == 1 then
			slot0.is_open_text:setString(TI18N("未开奖"))
			slot0.luckly_num:setString("未达到最低开奖人数")
			slot0.no_open_spr:setVisible(true)
			slot0.open_spr:setVisible(false)
		end

		slot0.time:setString("")
	else
		if slot1.is_win == 0 then
			slot0.time:setString(TimeTool.getYMDHMS(slot1.time))
		else
			slot0.time:setString(TimeTool.getYMDHMS(slot1.time))
		end

		slot0.luckly_num:setString(slot1.win_num)
		slot0.is_open_text:setString(TI18N("已开奖"))
		slot0.no_open_spr:setVisible(slot1.is_win == 0)
		slot0.open_spr:setVisible(slot1.is_win == 1)
	end

	slot0.my_join_num:setString(#slot1.buy_nums)

	if slot0.my_number_scroll then
		slot0.my_number_scroll:setData(slot1.buy_nums, nil, , slot1.win_num)
	end

	if slot0.goods_item and slot1.awards and slot1.awards[1] then
		slot0.goods_item:setBaseData(slot1.awards[1].id, slot1.awards[1].num)
	end
end

function TreasureMyServerItem.DeleteMe(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()

		slot0.goods_item = nil
	end

	if slot0.my_number_scroll then
		slot0.my_number_scroll:DeleteMe()

		slot0.my_number_scroll = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

MyServerNumberItem = class("MyServerNumberItem", function ()
	return ccui.Widget:create()
end)

function MyServerNumberItem.ctor(slot0)
	slot0:configNumberUI()
end

function MyServerNumberItem.configNumberUI(slot0)
	slot0:setContentSize(cc.size(100, 30))
end

function MyServerNumberItem.setExtendData(slot0, slot1)
	slot0.win_num = slot1
end

function MyServerNumberItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.luckly_num then
		slot0.luckly_num = createLabel(22, FestivalActionConst.ColorConst[3], nil, 0, 15, "", slot0, nil, cc.p(0, 0.5))
	end

	if slot1.num == slot0.win_num then
		slot0.luckly_num:setTextColor(FestivalActionConst.ColorConst[4])
	else
		slot0.luckly_num:setTextColor(FestivalActionConst.ColorConst[3])
	end

	slot0.luckly_num:setString(slot1.num)
end

function MyServerNumberItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
