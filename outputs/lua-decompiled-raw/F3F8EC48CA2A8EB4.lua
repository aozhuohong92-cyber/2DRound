slot1 = ElfinController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
ElfinFightPlanChooseTips = ElfinFightPlanChooseTips or BaseClass(BaseView)

function ElfinFightPlanChooseTips.__init(slot0)
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

function ElfinFightPlanChooseTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)
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

function ElfinFightPlanChooseTips._createNewCell(slot0, slot1, slot2)
	return ElfinPlanChooseItem.new(slot1, slot2, slot0)
end

function ElfinFightPlanChooseTips._numberOfCells(slot0)
	if not slot0.plan_data then
		return 0
	end

	return #slot0.plan_data
end

function ElfinFightPlanChooseTips._updateCellByIndex(slot0, slot1, slot2)
	if not slot0.plan_data then
		return
	end

	slot1.index = slot2

	if not slot0.plan_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ElfinFightPlanChooseTips.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openElfinFightPlanChooseTips(false)
	end, true, 2)
end

function ElfinFightPlanChooseTips.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.sprites = slot2.sprites
	slot0.plan_data = slot2.plan_data
	slot0.fun_form_type = slot2.fun_form_type
	slot0.team_index = slot2.team_index

	slot0.plan_scrollview:reloadData()
end

function ElfinFightPlanChooseTips.close_callback(slot0)
	if slot0.plan_scrollview then
		slot0.plan_scrollview:DeleteMe()

		slot0.plan_scrollview = nil
	end

	uv0:openElfinFightPlanChooseTips(false)
end

ElfinPlanChooseItem = class("ElfinPlanChooseItem", function ()
	return ccui.Widget:create()
end)

function ElfinPlanChooseItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3
	slot0.size = cc.size(400, 80)

	slot0:setContentSize(slot0.size)
	slot0:layoutUI()
	slot0:registerEvents()
end

function ElfinPlanChooseItem.layoutUI(slot0)
	slot0.container = ccui.Layout:create()

	slot0.container:setContentSize(slot0.size)
	slot0:addChild(slot0.container)

	slot0.plan_name_label = createRichLabel(22, cc.c3b(255, 238, 221), cc.p(0, 0.5), cc.p(40, 40))

	slot0.container:addChild(slot0.plan_name_label)

	slot1 = cc.size(120, 48)
	slot0.choose_btn = createImage(slot0.container, PathTool.getResFrame("mainui", "mainui_tips_bg1"), 325, 40, cc.p(0.5, 0.5), true, 1, true)

	slot0.choose_btn:setContentSize(slot1)
	slot0.choose_btn:setTouchEnabled(true)

	slot2 = createLabel(22, 274, nil, slot1.width / 2, slot1.height / 2, TI18N("选择"), slot0.choose_btn, nil, cc.p(0.5, 0.5))
	slot0.sp_line = createImage(slot0.container, PathTool.getResFrame("tips", "tips_8"), 200, 0, cc.p(0.5, 0), true, 1, true)

	slot0.sp_line:setContentSize(cc.size(350, 2))
end

function ElfinPlanChooseItem.registerEvents(slot0)
	registerButtonEventListener(slot0.choose_btn, handler(slot0, slot0.onChoosePlan), true, 1)
end

function ElfinPlanChooseItem.getCurHeroEuqipList(slot0)
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

function ElfinPlanChooseItem.onChoosePlan(slot0)
	if not slot0.data then
		return
	end

	if not slot0.parent then
		return
	end

	uv0:send26557(slot0.data.id, slot0.parent.sprites, slot0.parent.fun_form_type or 0, slot0.parent.team_index or 0)
	uv0:openElfinFightPlanChooseTips(false)
end

function ElfinPlanChooseItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2 = nil
	slot2 = slot1.is_open ~= 0

	slot0.choose_btn:setVisible(slot2)
	slot0.sp_line:setVisible(slot2)

	if slot0.plan_name_label then
		slot0.plan_name_label:setVisible(slot2)
	end

	if slot2 then
		slot3 = nil

		slot0.plan_name_label:setString((slot1.plan_sprites and next(slot1.plan_sprites) ~= nil or uv0(TI18N("%d  %s<div fontcolor=#c1b7ab fontsize=20> (空)</div>"), slot1.id, slot1.name)) and uv0(TI18N("%d  %s"), slot1.id, slot1.name))
	end
end

function ElfinPlanChooseItem.DeleteMe(slot0)
end
