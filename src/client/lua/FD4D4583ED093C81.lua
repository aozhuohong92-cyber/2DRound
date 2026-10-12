slot1 = PlanesController:getInstance():getModel()
slot2 = table.insert
PlanesHireHeroWindow = PlanesHireHeroWindow or BaseClass(BaseView)

function PlanesHireHeroWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "planes/planes_hire_hero_window"
end

function PlanesHireHeroWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

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

function PlanesHireHeroWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.btn_sure, handler(slot0, slot0.onClickSureBtn), true)
end

function PlanesHireHeroWindow.onClickCloseBtn(slot0)
	uv0:openPlanesHireHeroWindow(false)
end

function PlanesHireHeroWindow.onClickSureBtn(slot0)
	if slot0.cur_item then
		if slot0.cur_item:getHireHeropos() then
			uv0:sender23104(nil, 1, {
				{
					val2 = 0,
					type = PlanesConst.Proto_23104._10,
					val1 = slot1
				}
			})
		end

		uv0:openPlanesHireHeroWindow(false)
	else
		message(TI18N("请选择一位雇佣英雄"))
	end
end

function PlanesHireHeroWindow.openRootWnd(slot0, slot1)
	slot0:setData(slot1)
end

function PlanesHireHeroWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.item_scrollview:setData(slot1, handler(slot0, slot0.onClickItemCallBcak))
end

function PlanesHireHeroWindow.onClickItemCallBcak(slot0, slot1, slot2)
	if slot0.cur_item then
		slot0.cur_item:setIsSelect(false)
	end

	if slot2 == true then
		slot1:setIsSelect(true)

		slot0.cur_item = slot1
	else
		slot0.cur_item = nil
	end
end

function PlanesHireHeroWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openPlanesHireHeroWindow(false)
end
