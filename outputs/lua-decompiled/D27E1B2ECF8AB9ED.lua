PartnerComboSelectView = PartnerComboSelectView or BaseClass(BaseView)
slot1 = PartnerComboCtrl:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.remove

function PartnerComboSelectView.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "partnercombo/ui_partner_combo_select_view"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "txt_cn_hero_temp_01"),
			type = ResourcesType.single
		}
	}
	slot0.selected_id = 0
	slot0.cur_selected_index = 0
	slot0.index = 0
	slot0.cell_list = {}
end

function PartnerComboSelectView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N("请选择材料英雄"))

	slot0.label_select = slot0.main_container:getChildByName("label_select")
	slot0.label_tip = slot0.main_container:getChildByName("label_tip")

	slot0.label_tip:setString(TI18N(""))

	slot0.lay_scrollview = slot0.main_container:getChildByName("lay_scrollview")
	slot0.select_btn = slot0.main_container:getChildByName("select_btn")
	slot0.select_btn_label = slot0.select_btn:getChildByName("label")

	slot0.select_btn_label:setString(TI18N("选 择"))
	slot0.select_btn_label:enableOutline(cc.c3b(0, 0, 0), 2)
end

function PartnerComboSelectView.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.select_btn, handler(slot0, slot0.onClickBtnSelect), true, 2)
end

function PartnerComboSelectView.onClickBtnClose(slot0)
	uv0:openPartnerComboSelectView(false)
end

function PartnerComboSelectView.onClickBtnSelect(slot0)
	if slot0.selected_id ~= 0 then
		GlobalEvent:getInstance():Fire(HeroEvent.PARTNER_COMBO_SELECTED_RESULT, slot0.index, slot0.selected_id)
	end

	uv0:openPartnerComboSelectView(false)
end

function PartnerComboSelectView.openRootWnd(slot0, slot1, slot2, slot3)
	if not slot1 or #slot1 == 0 then
		commonShowEmptyIcon(slot0.lay_scrollview, true, {
			font_size = 22,
			scale = 1,
			text = TI18N("空空如也")
		})

		return
	end

	slot0.hero_list = slot1
	slot0.selected_id = slot2
	slot0.index = slot3

	if slot0.list_view == nil then
		slot6 = slot0.lay_scrollview:getContentSize()
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(640, 250), {
			start_y = 5,
			row = 0,
			start_x = 0,
			space_x = 0,
			item_width = 128,
			item_height = 140,
			space_y = 0,
			col = 5,
			need_dynamic = true
		}, cc.p(0, 0))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.list_view:reloadData()
end

function PartnerComboSelectView.createNewCell(slot0, slot1, slot2)
	slot3 = HeroExhibitionItem.new(0.9, true)

	uv0(slot0.cell_list, slot3)
	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function PartnerComboSelectView.numberOfCells(slot0)
	return #slot0.hero_list
end

function PartnerComboSelectView.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2
	slot3, slot4 = slot1:getPosition()

	slot1:setPosition(slot3, slot4 + 10)

	if slot0.hero_list[slot2] then
		slot1:setData(slot5)

		if slot0.selected_id == slot5.id then
			slot0.cur_selected_index = slot2

			slot1:setSelected(true)
		else
			slot1:setSelected(false)
		end

		slot1:showLockIcon(slot5:isLock() or slot5.isInForm and slot5:isInForm())
	end
end

function PartnerComboSelectView.onCellTouched(slot0, slot1)
	if slot1.index == slot0.cur_selected_index then
		return
	end

	if slot1:getData():isLock() or slot2.isInForm and slot2:isInForm() then
		return
	end

	if slot0.cur_selected_index ~= 0 then
		slot0.cell_list[slot0.cur_selected_index]:setSelected(false)
	end

	slot0.selected_id = slot1:getData().id

	slot1:setSelected(true)

	slot0.cur_selected_index = slot1.index
end

function PartnerComboSelectView.close_callback(slot0)
	if slot0.cell_list then
		for slot4, slot5 in ipairs(slot0.cell_list) do
			slot5:DeleteMe()
		end

		slot0.cell_list = nil
	end

	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	uv0:openPartnerComboSelectView(false)
end
