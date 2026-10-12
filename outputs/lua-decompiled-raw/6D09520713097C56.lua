slot1 = ElfinController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
ElfinChooseWindow = ElfinChooseWindow or BaseClass(BaseView)

function ElfinChooseWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_choose_window"
end

function ElfinChooseWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("win_title"):setString(TI18N("幽灵选择"))

	slot0.choose_btn = slot1:getChildByName("choose_btn")

	slot0.choose_btn:getChildByName("label"):setString(TI18N("选择"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.no_choose_tips = slot1:getChildByName("no_choose_tips")

	slot0.no_choose_tips:setString(TI18N("请先选择幽灵哦~"))
	UITool.SetLightColor(slot0.no_choose_tips)

	slot0.elfin_info_panel = slot1:getChildByName("elfin_info_panel")
	slot0.skill_name_txt = slot0.elfin_info_panel:getChildByName("skill_name_txt")
	slot0.skill_type_txt = slot0.elfin_info_panel:getChildByName("skill_type_txt")
	slot0.skill_desc_scroll = createScrollView(350, 70, 238, 15, slot0.elfin_info_panel, ccui.ScrollViewDir.vertical)

	slot0.elfin_info_panel:getChildByName("score_title"):setString(TI18N("评分："))

	slot0.power_label = CommonNum.new(1, slot0.elfin_info_panel, 1, -2, cc.p(0, 0))

	slot0.power_label:setPosition(cc.p(395, 115))
	slot0.power_label:setNum(0)
	slot0.power_label:setScale(0.7)

	slot0.elfin_list = slot1:getChildByName("elfin_list")
	slot0.elfin_list_view = CommonScrollViewSingleLayout.new(slot0.elfin_list, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.elfin_list:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 33,
		space_y = 10,
		col = 4,
		need_dynamic = true,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height + 50
	}, cc.p(0, 0))

	slot0.elfin_list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.elfin_list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.elfin_list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0.elfin_list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)

	slot0.choose_tips_txt = createRichLabel(18, 274, cc.p(0, 0), cc.p(33, 758))

	slot1:addChild(slot0.choose_tips_txt)
	slot0.choose_tips_txt:setString(uv0(TI18N("重复选中可取消选择、<div fontcolor=#ef3a3a>卸下</div>幽灵")))
end

function ElfinChooseWindow.createNewCell(slot0)
	slot1 = ElfinChooseItem.new()

	slot1:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot1
end

function ElfinChooseWindow.numberOfCells(slot0)
	if not slot0.elfin_data_list then
		return 0
	end

	return #slot0.elfin_data_list
end

function ElfinChooseWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.elfin_data_list[slot2] then
		slot1:setData(slot3)
		slot1:showItemQualityName(true)

		if slot0.cur_item_data and slot0.cur_item_data.base_id == slot3.base_id then
			slot1:IsGetStatus(true)
		else
			slot1:IsGetStatus(false)
		end

		if slot0.elfin_bid then
			slot4 = Config.SpriteData.data_elfin_data(slot3.base_id)
			slot6 = false

			if Config.SpriteData.data_elfin_data(slot0.elfin_bid) and slot4 and slot4.sprite_type == slot5.sprite_type and slot5.step < slot4.step then
				slot6 = true
			end

			addRedPointToNodeByStatus(slot1, slot6)
		else
			addRedPointToNodeByStatus(slot1, false)
		end
	end
end

function ElfinChooseWindow.onCellTouched(slot0, slot1)
	if slot0.select_cell then
		slot0.select_cell:IsGetStatus(false)
	end

	if slot0.cur_item_data and slot0.cur_item_data.base_id == slot0.elfin_data_list[slot1.index].base_id then
		slot0.select_cell = nil
		slot0.cur_item_data = nil
	else
		slot1:IsGetStatus(true)

		slot0.select_cell = slot1
		slot0.cur_item_data = slot2
	end

	slot0:updateElfinInfo()
end

function ElfinChooseWindow.updateElfinInfo(slot0)
	if not slot0.cur_item_data then
		slot0.elfin_info_panel:setVisible(false)
		slot0.no_choose_tips:setVisible(true)

		return
	end

	if not Config.SpriteData.data_elfin_data(slot0.cur_item_data.base_id) then
		return
	end

	if not slot0.elfin_item then
		slot0.elfin_item = BackPackItem.new(false, true, false)

		slot0.elfin_item:setPosition(cc.p(95, 126))
		slot0.elfin_info_panel:addChild(slot0.elfin_item)
	end

	slot0.elfin_item:setData(slot0.cur_item_data)
	slot0.elfin_item:showItemQualityName(true)

	if not slot0.skill_item then
		slot0.skill_item = SkillItem.new(false, true, true, 0.8)

		slot0.skill_item:setPosition(cc.p(285, 136))
		slot0.elfin_info_panel:addChild(slot0.skill_item)
	end

	slot0.power_label:setNum(slot1.power)

	if slot1.skill and Config.SkillData.data_get_skill(slot1.skill) then
		slot0.skill_item:setData(slot2)
		slot0.skill_name_txt:setString(uv0("%s Lv.%d", slot2.name, slot2.level))

		if slot2.type == "active_skill" then
			slot0.skill_type_txt:setString(TI18N("类型：主动技能"))
		else
			slot0.skill_type_txt:setString(TI18N("类型：被动技能"))
		end

		if not slot0.skill_desc_txt then
			slot0.skill_desc_txt = createRichLabel(18, cc.c4b(15, 50, 150, 255), cc.p(0, 1), cc.p(0, 0), nil, , 350)

			slot0.skill_desc_scroll:addChild(slot0.skill_desc_txt)
		end

		slot0.skill_desc_txt:setString(slot2.des)

		slot3 = slot0.skill_desc_txt:getSize()
		slot4 = math.max(slot3.height, 70)

		slot0.skill_desc_txt:setPositionY(slot4)
		slot0.skill_desc_scroll:setInnerContainerSize(cc.size(slot0.skill_desc_scroll:getContentSize().width, slot4))
		slot0.skill_desc_scroll:setTouchEnabled(slot3.height > 70)
	end

	slot0.elfin_info_panel:setVisible(true)
	slot0.no_choose_tips:setVisible(false)
end

function ElfinChooseWindow.register_event(slot0)
	registerButtonEventListener(slot0.choose_btn, handler(slot0, slot0.onClickChooseBtn), true)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openElfinChooseWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openElfinChooseWindow(false)
	end, false, 2)
end

function ElfinChooseWindow.onClickChooseBtn(slot0)
	if not slot0.elfin_pos then
		return
	end

	if next(slot0.elfin_data_list) == nil then
		message(TI18N("没有可选择的幽灵"))

		return
	end

	if not slot0.cur_item_data then
		uv0:sender26513(slot0.elfin_pos, 0)
	elseif not slot0.elfin_bid or slot0.elfin_bid ~= slot0.cur_item_data.base_id then
		uv0:sender26513(slot0.elfin_pos, slot0.cur_item_data.base_id)
	end

	uv0:openElfinChooseWindow(false)
end

function ElfinChooseWindow.openRootWnd(slot0, slot1)
	slot0.elfin_pos = slot1.elfin_pos
	slot0.elfin_bid = slot1.elfin_bid
	slot2 = nil

	if slot0.elfin_bid and Config.SpriteData.data_elfin_data(slot0.elfin_bid) then
		slot2 = slot3.sprite_type
	end

	slot0.elfin_data_list = {}
	slot3 = BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.ELFIN) or {}

	if uv0:getElfinTreeElfinList() and next(slot4) ~= nil then
		for slot9, slot10 in pairs(slot4) do
			if Config.SpriteData.data_elfin_data(slot10.item_bid) then
				uv1({}, slot11.sprite_type)
			end
		end

		for slot10, slot11 in ipairs(slot3) do
			if Config.SpriteData.data_elfin_data(slot11.base_id) and not function (slot0)
				slot1 = false

				for slot5, slot6 in pairs(uv0) do
					if slot6 == slot0 and (not uv1 or uv1 ~= slot0) then
						slot1 = true

						break
					end
				end

				return slot1
			end(slot12.sprite_type) then
				uv1(slot0.elfin_data_list, deepCopy(slot11))
			end
		end
	else
		slot0.elfin_data_list = slot3
	end

	if slot0.elfin_bid then
		slot5 = false

		for slot9, slot10 in pairs(slot0.elfin_data_list) do
			if slot10.base_id == slot0.elfin_bid then
				slot10.quantity = slot10.quantity + 1
				slot5 = true

				break
			end
		end

		if not slot5 then
			slot6 = GoodsVo.New(slot0.elfin_bid)
			slot6.quantity = 1

			uv1(slot0.elfin_data_list, slot6)
		end
	end

	if next(slot0.elfin_data_list) == nil then
		slot0.elfin_info_panel:setVisible(false)
		slot0.no_choose_tips:setVisible(true)
		commonShowEmptyIcon(slot0.elfin_list, true, {
			text = TI18N("一个幽灵都没有噢，快去培养获取吧~")
		})
	else
		table.sort(slot0.elfin_data_list, function (slot0, slot1)
			if slot0.base_id == uv0.elfin_bid and slot1.base_id ~= uv0.elfin_bid then
				return true
			elseif slot0.base_id ~= uv0.elfin_bid and slot1.base_id == uv0.elfin_bid then
				return false
			elseif slot0.quality ~= slot1.quality then
				return slot1.quality < slot0.quality
			elseif slot0.eqm_jie ~= slot1.eqm_jie then
				return slot1.eqm_jie < slot0.eqm_jie
			else
				return slot0.base_id < slot1.base_id
			end
		end)
		slot0.elfin_list_view:reloadData(1)
		commonShowEmptyIcon(slot0.elfin_list, false)
	end
end

function ElfinChooseWindow.close_callback(slot0)
	if slot0.power_label then
		slot0.power_label:DeleteMe()

		slot0.power_label = nil
	end

	if slot0.elfin_list_view then
		slot0.elfin_list_view:DeleteMe()

		slot0.elfin_list_view = nil
	end

	if slot0.elfin_item then
		slot0.elfin_item:DeleteMe()

		slot0.elfin_item = nil
	end

	if slot0.skill_item then
		slot0.skill_item:DeleteMe()

		slot0.skill_item = nil
	end

	uv0:openElfinChooseWindow(false)
end

ElfinChooseItem = class("ElfinChooseItem", function ()
	return ccui.Widget:create()
end)

function ElfinChooseItem.ctor(slot0)
	slot0:configUI()
end

function ElfinChooseItem.configUI(slot0)
	slot0.size = cc.size(BackPackItem.Width, BackPackItem.Height + 50)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.item_node = BackPackItem.new(false, true, false)

	slot0.item_node:setPosition(cc.p(slot0.size.width * 0.5, slot0.size.height - BackPackItem.Height * 0.5))
	slot0:addChild(slot0.item_node)
end

function ElfinChooseItem.addCallBack(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:addCallBack(slot1)
	end
end

function ElfinChooseItem.setData(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:setData(slot1)
	end
end

function ElfinChooseItem.showItemQualityName(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:showItemQualityName(slot1)
	end
end

function ElfinChooseItem.IsGetStatus(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:IsGetStatus(slot1)
	end
end

function ElfinChooseItem.DeleteMe(slot0)
	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end
end
