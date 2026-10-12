TreasureAllServerWindow = TreasureAllServerWindow or BaseClass(BaseView)
slot0 = FestivalActionController:getInstance()
slot1 = string.format

function TreasureAllServerWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "festivalaction/treasure_all_server_window"
end

function TreasureAllServerWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("Image_2"):getChildByName("Text_1"):setString(TI18N("全服记录"))

	slot0.btn_close = slot1:getChildByName("btn_close")
	slot0.recont_srcoll = slot1:getChildByName("recont_srcoll")
	slot0.record_scrollview = CommonScrollViewLayout.new(slot0.recont_srcoll, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.recont_srcoll:getContentSize(), {
		start_y = 0,
		item_width = 640,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 96,
		space_y = 3,
		col = 1,
		need_dynamic = true,
		item_class = TreasureAllServerItem
	})

	slot0.record_scrollview:setSwallowTouches(false)
end

function TreasureAllServerWindow.openRootWnd(slot0)
	uv0:sender25703()
end

function TreasureAllServerWindow.register_event(slot0)
	slot0:addGlobalEvent(FestivalActionEvent.Treasure_AllServer_Event, function (slot0)
		if slot0 and slot0.logs then
			if next(slot0.logs) == nil then
				commonShowEmptyIcon(uv0.recont_srcoll, true, {
					text = TI18N("暂无记录，努力参与吧~~~")
				})
			else
				uv0.record_scrollview:setData(slot0.logs)
			end
		end
	end)
	registerButtonEventListener(slot0.background, function ()
		uv0:openTreasureAllServerView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openTreasureAllServerView(false)
	end, true, 2)
end

function TreasureAllServerWindow.close_callback(slot0)
	if slot0.record_scrollview then
		slot0.record_scrollview:DeleteMe()

		slot0.record_scrollview = nil
	end

	uv0:openTreasureAllServerView(false)
end

TreasureAllServerItem = class("TreasureAllServerItem", function ()
	return ccui.Widget:create()
end)

function TreasureAllServerItem.ctor(slot0)
	slot0:configUI()
end

function TreasureAllServerItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("festivalaction/treasure_all_server_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(640, 96))

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.time = slot1:getChildByName("time")

	slot0.time:setString("")

	slot0.record_get_text = createRichLabel(26, FestivalActionConst.ColorConst[1], cc.p(0, 0.5), cc.p(27, 74), nil, , 600)

	slot1:addChild(slot0.record_get_text)

	slot0.record_count_text = createRichLabel(22, FestivalActionConst.ColorConst[1], cc.p(0, 0.5), cc.p(27, 30), nil, , 400)

	slot1:addChild(slot0.record_count_text)
end

function TreasureAllServerItem.setData(slot0, slot1)
	slot2 = 0

	if slot1.awards and slot1.awards[1] then
		slot2 = slot1.awards[1].num or 0
	end

	slot0.record_get_text:setString(uv0(TI18N("恭喜<div fontcolor=249003> %s </div>夺得 <div fontcolor=d95014>%sx%d</div>"), slot1.win_name, slot1.award_name, slot2))
	slot0.record_count_text:setString(uv0(TI18N("参与<div fontcolor=249003> %d </div>人次 总共<div fontcolor=d95014> %d </div> 人次"), slot1.join_num, slot1.max_num))
	slot0.time:setString(TimeTool.getYMDHMS(slot1.time))
end

function TreasureAllServerItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
