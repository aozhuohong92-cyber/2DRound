slot1 = HeavenController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
HeavenStarAwardWindow = HeavenStarAwardWindow or BaseClass(BaseView)

function HeavenStarAwardWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "heaven/heaven_star_award_window"
end

function HeavenStarAwardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("title_label"):setString(TI18N("目标奖励"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot3 = slot1:getChildByName("item_container")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot3, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 0,
		item_width = 600,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 156,
		space_y = 3,
		col = 1,
		need_dynamic = true,
		item_class = HeavenStarAwardItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function HeavenStarAwardWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickCloseBtn), nil, 2)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickCloseBtn), nil, 2)
	slot0:addGlobalEvent(HeavenEvent.Get_Chapter_Award_Event, function ()
		uv0:setData()
	end)
end

function HeavenStarAwardWindow._onClickCloseBtn(slot0)
	uv0:openHeavenStarAwardWindow(false)
end

function HeavenStarAwardWindow.setData(slot0)
	if slot0.chapter_id then
		if not Config.DungeonHeavenData.data_star_award[slot0.chapter_id] then
			return
		end

		slot0.item_scrollview:setData(slot1, nil, , {
			chapter_vo = uv0:getChapterDataById(slot0.chapter_id),
			chapter_id = slot0.chapter_id
		})
	end
end

function HeavenStarAwardWindow.openRootWnd(slot0, slot1)
	slot0.chapter_id = slot1

	slot0:setData()
end

function HeavenStarAwardWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openHeavenStarAwardWindow(false)
end

HeavenStarAwardItem = class("HeavenStarAwardItem", function ()
	return ccui.Widget:create()
end)

function HeavenStarAwardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HeavenStarAwardItem.configUI(slot0)
	slot0.size = cc.size(600, 156)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("heaven/heaven_star_award_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.go_btn = slot0.root_wnd:getChildByName("container"):getChildByName("go_btn")

	slot0.go_btn:setTitleColor(Config.ColorData.data_color4[1])
	slot0.go_btn:setTitleText(TI18N("前往"))

	slot0.go_btn_label = slot0.go_btn:getTitleRenderer()

	if slot0.go_btn_label ~= nil then
		slot0.go_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
	end

	slot0.get_btn = slot2:getChildByName("get_btn")

	slot0.get_btn:setTitleColor(Config.ColorData.data_color4[1])
	slot0.get_btn:setTitleText(TI18N("领取"))

	slot0.get_btn_label = slot0.get_btn:getTitleRenderer()

	if slot0.get_btn_label ~= nil then
		slot0.get_btn_label:enableOutline(Config.ColorData.data_color4[263], 2)
	end

	slot0.btn_has = slot2:getChildByName("btn_has")
	slot0.title_label = slot2:getChildByName("title_label")
	slot3 = slot2:getChildByName("award_list")
	slot4 = slot3:getContentSize()
	slot6 = 0.8
	slot0.good_scrollview = CommonScrollViewLayout.new(slot3, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot4.width, slot4.height), {
		start_y = 0,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * slot6,
		item_height = BackPackItem.Height * slot6,
		scale = slot6
	})

	slot0.good_scrollview:setSwallowTouches(false)
end

function HeavenStarAwardItem.register_event(slot0)
	registerButtonEventListener(slot0.go_btn, function ()
		uv0:_onClickGoBtn()
	end, true)
	registerButtonEventListener(slot0.get_btn, function ()
		uv0:_onClickGetBtn()
	end, true)
end

function HeavenStarAwardItem._onClickGoBtn(slot0)
	if slot0.chapter_id then
		uv0:openHeavenChapterWindow(true, slot0.chapter_id)
		uv0:openHeavenStarAwardWindow(false)
	end
end

function HeavenStarAwardItem._onClickGetBtn(slot0)
	if slot0.chapter_id and slot0.data then
		uv0:sender25215(slot0.chapter_id, slot0.data.award_id)
	end
end

function HeavenStarAwardItem.setExtendData(slot0, slot1)
	slot0.chapter_id = slot1.chapter_id
	slot0.chapter_vo = slot1.chapter_vo or {}
end

function HeavenStarAwardItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.title_label:setString(uv0(TI18N("本章达成%d个星级目标(%d/%d)"), slot1.limit_star, slot0.chapter_vo.all_star or 0, slot1.limit_star or 0))

	slot4 = {}

	for slot8, slot9 in ipairs(slot1.award) do
		slot12 = deepCopy(Config.ItemData.data_get_data(slot9[1]))
		slot12.quantity = slot9[2]

		uv1(slot4, slot12)
	end

	slot0.good_scrollview:setData(slot4)
	slot0.good_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.good_scrollview:getItemList()) do
			slot5:setDefaultTip()
		end
	end)

	if slot0:getAwardStatus(slot1.award_id) == 0 then
		slot0.go_btn:setVisible(true)
		slot0.get_btn:setVisible(false)
		slot0.btn_has:setVisible(false)
	elseif slot5 == 1 then
		slot0.go_btn:setVisible(false)
		slot0.get_btn:setVisible(true)
		slot0.btn_has:setVisible(false)
	else
		slot0.go_btn:setVisible(false)
		slot0.get_btn:setVisible(false)
		slot0.btn_has:setVisible(true)
	end
end

function HeavenStarAwardItem.getAwardStatus(slot0, slot1)
	slot2 = 0

	if slot0.chapter_vo.award_info then
		for slot6, slot7 in pairs(slot0.chapter_vo.award_info) do
			if slot7.id == slot1 then
				slot2 = slot7.flag

				break
			end
		end
	end

	return slot2
end

function HeavenStarAwardItem.DeleteMe(slot0)
	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
