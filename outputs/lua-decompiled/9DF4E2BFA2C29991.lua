slot1 = PlanesafkController:getInstance():getModel()
slot2 = table.insert
PlanesafkHireHeroWindow = PlanesafkHireHeroWindow or BaseClass(BaseView)

function PlanesafkHireHeroWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "planes/planes_hire_hero_window"
end

function PlanesafkHireHeroWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot1:getChildByName("win_title"):setString(TI18N("英雄雇佣"))
	slot1:getChildByName("tips_txt"):setString(TI18N("雇佣一位英雄，帮助你完成本次冒险吧"))
	slot1:getChildByName("tips_txt"):setTextColor(cc.c4b(144, 93, 56, 255))

	slot0.btn_sure = slot1:getChildByName("btn_sure")

	slot0.btn_sure:getChildByName("label"):setString(TI18N("确认选择"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot2 = slot1:getChildByName("item_list")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 597,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 141,
		space_y = 5,
		col = 1,
		item_class = PlanesHireHeroItem
	})
end

function PlanesafkHireHeroWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.btn_sure, handler(slot0, slot0.onClickSureBtn), true)
end

function PlanesafkHireHeroWindow.onClickCloseBtn(slot0)
	uv0:openPlanesafkHireHeroWindow(false)
end

function PlanesafkHireHeroWindow.onClickSureBtn(slot0)
	if not slot0.data then
		return
	end

	if slot0.cur_item and slot0.cur_item.getHireHeropos then
		if slot0.cur_item:getHireHeropos() then
			uv0:sender28600(slot0.data.line, slot0.data.index, 1, {
				{
					val2 = 0,
					type = PlanesafkConst.Proto_28600._9,
					val1 = slot1
				}
			})
		end

		uv0:openPlanesafkHireHeroWindow(false)
	else
		message(TI18N("请选择一位雇佣英雄"))
	end
end

function PlanesafkHireHeroWindow.openRootWnd(slot0, slot1)
	slot0.data = slot1
	slot2 = slot1.planes_load_partner

	if not slot1 then
		return
	end

	table.sort(slot2, function (slot0, slot1)
		return slot0.pos < slot1.pos
	end)
	slot0:setData(slot2)

	if uv0:getMapEvtData(slot0.data.line, slot0.data.index) and slot3.is_black then
		slot0.btn_sure:setVisible(false)
	end
end

function PlanesafkHireHeroWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.item_scrollview:setData(slot1, handler(slot0, slot0.onClickItemCallBcak))
end

function PlanesafkHireHeroWindow.onClickItemCallBcak(slot0, slot1, slot2)
	if slot0.cur_item and slot0.cur_item.setIsSelect then
		slot0.cur_item:setIsSelect(false)
	end

	if slot2 == true then
		if slot1.setIsSelect then
			slot1:setIsSelect(true)
		end

		slot0.cur_item = slot1
	else
		slot0.cur_item = nil
	end
end

function PlanesafkHireHeroWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openPlanesafkHireHeroWindow(false)
end
