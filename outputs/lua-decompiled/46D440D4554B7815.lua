slot0 = HeroController:getInstance()
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
HolyequipmentChooseTips = HolyequipmentChooseTips or BaseClass(BaseView)

function HolyequipmentChooseTips.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "hero/hero_holy_choose_plan_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.plan_data = {}
end

function HolyequipmentChooseTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0.main_panel:getChildByName("title_label"):setString(TI18N("选择目标方案"))
	slot0.main_panel:getChildByName("title_label"):setTextColor(cc.c3b(255, 255, 255))

	slot1 = slot0.main_panel:getChildByName("panel_list")
	slot0.plan_scrollview = CommonScrollViewSingleLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 400,
		item_height = 80,
		space_y = 0,
		col = 1,
		need_dynamic = true
	})

	slot0.plan_scrollview:setSwallowTouches(false)
	slot0.plan_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.plan_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.plan_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function HolyequipmentChooseTips._createNewCell(slot0, slot1, slot2)
	slot3 = HolyequipmentChooseItem.new(slot1, slot2)

	slot3:setExtendData(slot0.hero_vo, slot0.plan_data)

	return slot3
end

function HolyequipmentChooseTips._numberOfCells(slot0)
	if not slot0.plan_data then
		return 0
	end

	return #slot0.plan_data
end

function HolyequipmentChooseTips._updateCellByIndex(slot0, slot1, slot2)
	if not slot0.plan_data then
		return
	end

	slot1.index = slot2

	if not slot0.plan_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function HolyequipmentChooseTips.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHolyequipmentChooseTips(false)
	end, true, 2)
end

function HolyequipmentChooseTips.openRootWnd(slot0, slot1, slot2)
	slot0.hero_vo = slot1
	slot0.plan_data = slot2

	slot0.plan_scrollview:reloadData()
end

function HolyequipmentChooseTips.close_callback(slot0)
	if slot0.plan_scrollview then
		slot0.plan_scrollview:DeleteMe()

		slot0.plan_scrollview = nil
	end

	uv0:openHolyequipmentChooseTips(false)
end

HolyequipmentChooseItem = class("HolyequipmentChooseItem", function ()
	return ccui.Widget:create()
end)

function HolyequipmentChooseItem.ctor(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setContentSize(slot0.size)
	slot0:layoutUI()
	slot0:registerEvents()
end

function HolyequipmentChooseItem.layoutUI(slot0)
	slot0.container = ccui.Layout:create()

	slot0.container:setContentSize(slot0.size)
	slot0:addChild(slot0.container)

	slot0.plan_name_label = createRichLabel(22, cc.c3b(255, 238, 221), cc.p(0, 0.5), cc.p(40, slot0.size.height / 2))

	slot0.container:addChild(slot0.plan_name_label)

	slot0.choose_btn = createImage(slot0.container, PathTool.getResFrame("mainui", "mainui_tips_bg1"), 325, slot0.size.height / 2, cc.p(0.5, 0.5), true, 1, true)

	slot0.choose_btn:setContentSize(cc.size(120, 48))
	slot0.choose_btn:setTouchEnabled(true)

	slot1 = slot0.choose_btn:getContentSize()
	slot2 = createLabel(22, 274, nil, slot1.width / 2, slot1.height / 2, TI18N("选择"), slot0.choose_btn, nil, cc.p(0.5, 0.5))
	slot0.sp_line = createImage(slot0.container, PathTool.getResFrame("tips", "tips_8"), slot0.size.width / 2, 0, cc.p(0.5, 0), true, 1, true)

	slot0.sp_line:setContentSize(cc.size(350, 2))
end

function HolyequipmentChooseItem.registerEvents(slot0)
	registerButtonEventListener(slot0.choose_btn, handler(slot0, slot0.onChoosePlan), true, 1)
end

function HolyequipmentChooseItem.getCurHeroEuqipList(slot0)
	slot1 = {}

	for slot6, slot7 in pairs(uv0:getHeroHolyEquipList(slot0.hero_vo.partner_id)) do
		if slot7 then
			uv1(slot1, {
				partner_id = slot0.hero_vo.partner_id,
				item_id = slot7.id
			})
		end
	end

	return slot1
end

function HolyequipmentChooseItem.onChoosePlan(slot0)
	if not slot0.hero_vo or not slot0.plan_data then
		return
	end

	if SysEnv:getInstance():getBool(SysEnv.keys.holy_plan_save_tip, false) then
		uv0:sender25221(slot0.data.id, slot0.hero_vo.partner_id, slot0.data.name, slot0:getCurHeroEuqipList())
	else
		slot2 = {
			id = slot0.data.id,
			name = slot0.data.name,
			partner_id = slot0.hero_vo.partner_id,
			item_list = {}
		}

		if tableLen(slot0.plan_data[slot0.data.id].list) == 0 then
			uv0:sender25221(slot0.data.id, slot0.hero_vo.partner_id, slot0.data.name, slot0:getCurHeroEuqipList())
		else
			slot4 = {}

			if slot3.list then
				for slot8, slot9 in pairs(slot3.list) do
					uv1(slot4, {
						item_id = slot9.item_id,
						name = slot0.data.name,
						partner_id = slot9.partner_id
					})
				end
			end

			for slot8, slot9 in pairs(slot3.equip_list) do
				for slot13, slot14 in ipairs(slot4) do
					if slot14 and slot14.item_id == slot9.id then
						slot4[slot13].item_vo = slot9

						uv1(slot2.item_list, slot9.config.type, slot4[slot13])
					end
				end
			end

			uv0:openHolyequipmentSaveTips(true, slot2)
		end
	end

	uv0:openHolyequipmentChooseTips(false)
end

function HolyequipmentChooseItem.setExtendData(slot0, slot1, slot2)
	slot0.hero_vo = slot1
	slot0.plan_data = slot2
end

function HolyequipmentChooseItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.choose_btn:setVisible(slot1.is_open == 1)
	slot0.sp_line:setVisible(slot1.is_open == 1)

	if slot0.plan_name_label then
		slot0.plan_name_label:setVisible(slot1.is_open == 1)
	end

	if slot1.is_open == 1 then
		slot2 = uv0(TI18N("%d  %s"), slot1.id, slot1.name)

		if not slot1.list or next(slot1.list) == nil then
			slot2 = uv0(TI18N("%d  %s<div fontcolor=#c1b7ab fontsize=20> (空)</div>"), slot1.id, slot1.name)
		end

		slot0.plan_name_label:setString(slot2)
	end
end

function HolyequipmentChooseItem.DeleteMe(slot0)
end
