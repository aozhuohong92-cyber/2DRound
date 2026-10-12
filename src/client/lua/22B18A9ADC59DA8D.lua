slot1 = PlanesController:getInstance():getModel()
slot2 = table.insert
PlanesAwardInfoWindow = PlanesAwardInfoWindow or BaseClass(BaseView)

function PlanesAwardInfoWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "planes/planes_award_info_window"
end

function PlanesAwardInfoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.base_total_txt = slot1:getChildByName("base_total_txt")

	slot1:getChildByName("win_title"):setString(TI18N("宝箱奖励加成"))
	slot1:getChildByName("title_label_2"):setString(TI18N("宝箱奖励加成"))
	slot1:getChildByName("title_txt_1"):setString(TI18N("加成条件"))
	slot1:getChildByName("title_txt_6"):setString(TI18N("加成值"))
	slot1:getChildByName("title_txt_2"):setString(TI18N("是否达成"))
	slot1:getChildByName("tips_label"):setString(TI18N("副本探索度达100%后，永久加成所有副本的宝箱奖励"))

	slot2 = slot1:getChildByName("base_list_panel")
	slot0.base_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 602,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 30,
		space_y = 5,
		col = 1,
		need_dynamic = true,
		item_class = PlanesAwardInfoItem
	})

	slot0.base_scrollview:setSwallowTouches(false)
end

function PlanesAwardInfoWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
end

function PlanesAwardInfoWindow.onClickCloseBtn(slot0)
	uv0:openPlanesAwardInfoWindow(false)
end

function PlanesAwardInfoWindow.openRootWnd(slot0)
	slot0:setData()
end

function PlanesAwardInfoWindow.setData(slot0)
	slot2 = {}

	for slot6, slot7 in pairs(Config.SecretDunData.data_customs) do
		if slot7.add_radio > 0 then
			slot8 = {
				dun_id = slot6,
				dun_info = Config.SecretDunData.data_dun_info[slot6],
				add_radio = slot7.add_radio
			}

			if uv0:checkDunIsPassByDunId(slot6) then
				slot1 = 0 + slot7.add_radio
			end

			uv1(slot2, slot8)
		end
	end

	table.sort(slot2, SortTools.KeyLowerSorter("dun_id"))
	slot0.base_scrollview:setData(slot2)
	slot0.base_total_txt:setString(TI18N(string.format("当前总加成:%d%%", slot1 / 10)))
end

function PlanesAwardInfoWindow.close_callback(slot0)
	if slot0.base_scrollview then
		slot0.base_scrollview:DeleteMe()

		slot0.base_scrollview = nil
	end

	uv0:openPlanesAwardInfoWindow(false)
end

PlanesAwardInfoItem = class("PlanesAwardInfoItem", function ()
	return ccui.Widget:create()
end)

function PlanesAwardInfoItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function PlanesAwardInfoItem.configUI(slot0)
	slot0.root_wnd = ccui.Layout:create()
	slot0.size = cc.size(602, 30)

	slot0.root_wnd:setContentSize(slot0.size)
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setTouchEnabled(false)
	slot0:addChild(slot0.root_wnd)
end

function PlanesAwardInfoItem.register_event(slot0)
end

function PlanesAwardInfoItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.name_txt then
		slot0.name_txt = createLabel(24, 274, nil, 0, slot0.size.height * 0.5, nil, slot0.root_wnd, nil, cc.p(0, 0.5))
	end

	if slot1.dun_info and slot1.dun_info.name then
		slot0.name_txt:setString(TI18N(string.format("[%s]探索度达100%%", slot1.dun_info.name)))
	end

	if not slot0.num_txt then
		slot0.num_txt = createLabel(24, cc.c4b(36, 144, 3, 255), nil, 352, slot0.size.height * 0.5, nil, slot0.root_wnd, nil, cc.p(0, 0.5))
	end

	slot1.add_radio = slot1.add_radio or 0

	slot0.num_txt:setString(slot1.add_radio / 10 .. "%")

	if not slot0.reach_txt then
		slot0.reach_txt = createLabel(24, 274, nil, 492, slot0.size.height * 0.5, nil, slot0.root_wnd, nil, cc.p(0, 0.5))
	end

	if uv0:checkDunIsPassByDunId(slot1.dun_id) then
		slot0.reach_txt:setString(TI18N("已达成"))
		slot0.reach_txt:setTextColor(cc.c4b(36, 144, 3, 255))
	else
		slot0.reach_txt:setString(TI18N("未达成"))
		slot0.reach_txt:setTextColor(cc.c4b(100, 100, 100, 255))
	end
end

function PlanesAwardInfoItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
