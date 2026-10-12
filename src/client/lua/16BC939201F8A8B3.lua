slot1 = ElfinController:getInstance():getModel()
slot2 = table.insert
slot3 = table.remove
slot4 = table.sort
slot5 = string.format
ElfinAdjustWindow = ElfinAdjustWindow or BaseClass(BaseView)

function ElfinAdjustWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_adjust_window"
	slot0.elfin_skill_list = {}
	slot0.item_rect_list = {}
end

function ElfinAdjustWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot1:getChildByName("win_title"):setString(TI18N("快捷调整"))

	slot0.left_btn = slot1:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("方案管理"))

	slot0.right_btn = slot1:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("保 存"))

	slot0.tips_txt = createRichLabel(22, 274, cc.p(0.5, 0.5), cc.p(338, 288), nil, nil, 500)

	slot0.tips_txt:setString(TI18N("按住幽灵技能进行<div fontcolor=#d23232>拖动</div>，调整施法顺序"))
	slot1:addChild(slot0.tips_txt)

	slot3 = slot1:getChildByName("lay_scrollview")
	slot0.list_view = CommonScrollViewSingleLayout.new(slot3, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 8,
		row = 0,
		start_x = 15,
		space_x = 25,
		inner_hight_offset = 50,
		space_y = 50,
		col = 4,
		need_dynamic = true,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height
	}, cc.p(0, 0))

	slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
end

function ElfinAdjustWindow.createNewCell(slot0)
	slot1 = BackPackItem.new(false, false, false)

	slot1:setTouchEnabled(true)
	slot1:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()

			doStopAllActions(uv0.main_container)

			uv0.long_touch_type = LONG_TOUCH_BEGAN_TYPE

			delayRun(uv0.main_container, 0.6, function ()
				if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE and Config.SpriteData.data_elfin_data(uv1:getData().base_id) and Config.SkillData.data_get_skill(slot1.skill) then
					TipsManager:getInstance():showSkillTips(slot2, false, false, false)
				end

				uv0.long_touch_type = LONG_TOUCH_END_TYPE
			end)
		elseif slot1 == ccui.TouchEventType.moved then
			if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
				slot3 = slot0:getTouchMovePosition()

				if uv0.touch_began and slot3 and (math.abs(slot3.x - slot2.x) > 20 or math.abs(slot3.y - slot2.y) > 20) then
					doStopAllActions(uv0.main_container)

					uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
				end
			end
		elseif slot1 == ccui.TouchEventType.canceled then
			if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
				doStopAllActions(uv0.main_container)

				uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
			end
		elseif slot1 == ccui.TouchEventType.ended then
			if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
				doStopAllActions(uv0.main_container)

				uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
			elseif uv0.long_touch_type == LONG_TOUCH_END_TYPE then
				return
			end

			uv0:onCellTouched(slot0)
		end
	end)

	return slot1
end

function ElfinAdjustWindow.numberOfCells(slot0)
	if not slot0.all_elfin_data then
		return 0
	end

	return #slot0.all_elfin_data
end

function ElfinAdjustWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.all_elfin_data[slot2] then
		slot1:setData(slot3)
		slot1:showItemQualityName(true)
		slot1:setSelfNum(slot3.quantity or 0)

		if slot3.is_select == true then
			slot1:IsGetStatus(true)
		else
			slot1:IsGetStatus(false)
		end
	end
end

function ElfinAdjustWindow.onCellTouched(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot1:getData() then
		return
	end

	slot3 = Config.SpriteData.data_elfin_data(slot2.base_id)

	if slot2.is_select == true then
		slot2.is_select = false
		slot7 = false

		slot1:IsGetStatus(slot7)

		for slot7, slot8 in pairs(slot0.chose_elfin_list) do
			if slot8.item_bid == slot2.base_id then
				slot8.item_bid = 0

				break
			end
		end

		slot0:updateSkillList()
	elseif slot3 then
		slot4 = false
		slot5 = false

		for slot9, slot10 in pairs(slot0.chose_elfin_list) do
			if slot10.item_bid == 0 then
				slot4 = true
			else
				slot11 = Config.SpriteData.data_elfin_data(slot10.item_bid)

				if slot3 and slot11 and slot3.sprite_type == slot11.sprite_type then
					slot5 = true
				end
			end
		end

		if not slot4 then
			message(TI18N("上阵幽灵已满"))

			return
		end

		if slot5 == true then
			message(TI18N("不能上阵两个同类型幽灵"))

			return
		end

		slot2.is_select = true
		slot9 = true

		slot1:IsGetStatus(slot9)

		for slot9, slot10 in ipairs(slot0.chose_elfin_list) do
			if slot10.item_bid == 0 then
				slot10.item_bid = slot2.base_id

				break
			end
		end

		slot0:updateSkillList()
	end
end

function ElfinAdjustWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onCloseBtn()
	end, false, 2)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickSaveBtn), true)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickLeftBtn), true)
end

function ElfinAdjustWindow.onCloseBtn(slot0)
	uv0:openElfinAdjustWindow(false)
end

function ElfinAdjustWindow.onClickLeftBtn(slot0)
	uv1:openElfinFightPlanPanel(true, {
		cur_plan_data = uv0:getElfinTreeData()
	})
	slot0:onCloseBtn()
end

function ElfinAdjustWindow.onClickSaveBtn(slot0)
	if slot0.callback then
		slot0.callback(slot0.chose_elfin_list)
	elseif slot0.chose_elfin_list and next(slot0.chose_elfin_list) ~= nil then
		uv0:sender26514(slot0.chose_elfin_list)
	end

	uv0:openElfinAdjustWindow(false)
end

function ElfinAdjustWindow.openRootWnd(slot0, slot1)
	slot0.setting = slot1 or {}
	slot0.from_type = slot0.setting.from_type or 1
	slot0.callback = slot0.setting.callback
	slot0.sprites = slot0.setting.sprites
	slot0.dic_filter_item_id = slot0.setting.dic_filter_item_id or {}

	slot0:setData()
	slot0:updateSkillList()

	if slot0.from_type ~= 1 then
		slot0.left_btn:setVisible(false)
		slot0.right_btn:setPositionX(338)
	end
end

function ElfinAdjustWindow.setData(slot0)
	slot1 = BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.ELFIN) or {}
	slot0.chose_elfin_list = deepCopy(slot0.from_type == 1 and uv0:getElfinTreeElfinList() or slot0.sprites or {})

	uv1(slot0.chose_elfin_list, SortTools.KeyLowerSorter("pos"))

	slot4 = {
		[slot9.item_bid] = 1
	}

	for slot8, slot9 in ipairs(nil) do
		if slot9.item_bid ~= 0 then
			-- Nothing
		end
	end

	slot5 = {
		[slot10.item_bid] = 1
	}

	for slot9, slot10 in ipairs(slot2) do
		if slot10.item_bid ~= 0 then
			-- Nothing
		end
	end

	slot0.all_elfin_data = {}

	for slot9, slot10 in pairs(slot1) do
		if slot5[deepCopy(slot10).base_id] then
			slot11.quantity = slot11.quantity + slot5[slot11.base_id]
			slot5[slot11.base_id] = nil
		end

		if slot4[slot11.base_id] then
			slot11.is_select = true
		end

		if slot0.dic_filter_item_id[slot11.base_id] then
			slot11.quantity = slot11.quantity - slot0.dic_filter_item_id[slot11.base_id]
		end

		if slot11.quantity > 0 then
			uv2(slot0.all_elfin_data, slot11)
		end
	end

	for slot9, slot10 in pairs(slot5) do
		if slot0.dic_filter_item_id[slot9] == nil then
			GoodsVo.New(slot9).quantity = 1

			if slot4[slot9] then
				slot11.is_select = true
			end

			uv2(slot0.all_elfin_data, slot11)
		end
	end

	if #slot0.all_elfin_data > 0 then
		uv1(slot0.all_elfin_data, function (slot0, slot1)
			if slot0.eqm_jie ~= slot1.eqm_jie then
				return slot1.eqm_jie < slot0.eqm_jie
			elseif slot0.quality ~= slot1.quality then
				return slot1.quality < slot0.quality
			else
				return slot1.base_id < slot0.base_id
			end
		end)
		commonShowEmptyIcon(slot0.list_view, false)
		slot0.list_view:reloadData()
	else
		commonShowEmptyIcon(slot0.list_view, true, {
			text = TI18N("一个幽灵都没有噢，快去培养获取吧~")
		})
	end
end

function ElfinAdjustWindow.updateSkillList(slot0)
	slot1 = 0

	for slot5 = 1, 4 do
		if not slot0.elfin_skill_list[slot5] then
			slot7 = SkillItem.new(true, false, true, 0.9, true)

			slot7:setTouchEnabled(true)

			slot7.elfin_pos = slot5

			slot0.main_container:addChild(slot7)
			slot7:setPosition(cc.p(126 + (slot5 - 1) * 139, 202))

			slot0.elfin_skill_list[slot5] = slot7

			if slot0:getTreeElfinBidByPos(slot5) then
				slot9 = slot0.main_container:convertToNodeSpace(slot7:convertToWorldSpace(cc.p(0, 0)))
				slot0.item_rect_list[slot5] = cc.rect(slot9.x, slot9.y, SkillItem.Width * 0.9, SkillItem.Height * 0.9)

				slot7:addTouchEventListener(function (slot0, slot1)
					uv0:onClickSkillItem(slot0, slot1, uv1)
				end)
			else
				slot7:setClickInfo({
					click = true
				})
			end
		end

		if uv0:getElfinItemByPos(slot5) then
			slot6 = slot6 or 0
			slot7.elfin_bid = slot6

			slot7:showLockIcon(false)

			if slot6 == 0 or not Config.SpriteData.data_elfin_data(slot6) then
				slot7.cd_order = 0

				slot7:setData()
				slot7:showLevel(false)
				slot7:showName(false)
			elseif Config.SkillData.data_get_skill(slot9.skill) then
				slot7:showLevel(true)
				slot7:setData(slot10)
				slot7:showName(true, slot10.name, nil, 20, true, cc.c4b(255, 240, 210, 255), PathTool.getResFrame("elfin", "elfin_1022"), cc.size(110, 26))

				if slot10.type == "active_skill" then
					slot7.cd_order = slot1 + 1
				end
			end
		else
			slot7.elfin_bid = 0
			slot7.cd_order = 0

			slot7:setData()
			slot7:showLevel(false)
			slot7:showName(false)

			if Config.SpriteData.data_tree_limit[slot5] then
				slot7:showLockIcon(true, nil, uv1(TI18N("佩罗娜达到%s阶解锁"), StringUtil.numToChinese(slot9)))
			else
				slot7:showLockIcon(true)
			end
		end
	end
end

function ElfinAdjustWindow.onClickSkillItem(slot0, slot1, slot2)
	if slot0.is_show_act then
		return
	end

	if slot2 == ccui.TouchEventType.began then
		slot0.cur_touch_skill_pos = slot1.elfin_pos
		slot0.touch_move = false
		slot0.touch_began = slot1:getTouchBeganPosition()

		if slot1:getData() and next(slot3) ~= nil then
			slot0.is_can_move = true

			doStopAllActions(slot0.main_container)

			slot0.long_touch_type = LONG_TOUCH_BEGAN_TYPE

			delayRun(slot0.main_container, 0.6, function ()
				if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE and uv1:getData() and next(slot0) ~= nil then
					TipsManager:getInstance():showSkillTips(slot0, false, false, false, uv1.cd_order or 0)
				end

				uv0.long_touch_type = LONG_TOUCH_END_TYPE
			end)
		else
			slot0.is_can_move = false
		end
	elseif slot2 == ccui.TouchEventType.moved then
		slot0.touch_move = true

		slot0:onClickSkillItemMove(slot1)

		if slot0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
			slot4 = slot1:getTouchMovePosition()

			if slot0.touch_began and slot4 and (math.abs(slot4.x - slot3.x) > 20 or math.abs(slot4.y - slot3.y) > 20) then
				doStopAllActions(slot0.main_container)

				slot0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
			end
		end
	elseif slot2 == ccui.TouchEventType.canceled then
		slot0:onClickSkillItemCanceled(slot1)

		if slot0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
			doStopAllActions(slot0.main_container)

			slot0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
		end
	elseif slot2 == ccui.TouchEventType.ended then
		if slot0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
			doStopAllActions(slot0.main_container)

			slot0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
		elseif slot0.long_touch_type == LONG_TOUCH_END_TYPE then
			if slot0.move_skill_item and slot0.move_skill_item:isVisible() then
				slot0.move_skill_item:setVisible(false)
			end

			slot0:updateSkillList()

			return
		end

		slot0.touch_end = slot1:getTouchEndPosition()
		slot3 = true

		if slot0.touch_began ~= nil then
			slot3 = math.abs(slot0.touch_end.x - slot0.touch_began.x) <= 20 and math.abs(slot0.touch_end.y - slot0.touch_began.y) <= 20
		end

		if slot0.touch_move and not slot3 then
			slot0:onClickSkillItemEnd(slot1)
		else
			if slot0.move_skill_item and slot0.move_skill_item:isVisible() then
				slot0.move_skill_item:setVisible(false)
			end

			if slot1.elfin_pos then
				for slot7, slot8 in pairs(slot0.chose_elfin_list) do
					if slot8.pos == slot1.elfin_pos then
						for slot12, slot13 in pairs(slot0.all_elfin_data) do
							if slot13.base_id == slot8.item_bid then
								slot13.is_select = false

								break
							end
						end

						slot8.item_bid = 0

						break
					end
				end

				slot0.list_view:reloadData(nil, nil, true)
				slot0:updateSkillList()
			end
		end
	end
end

function ElfinAdjustWindow.onClickSkillItemMove(slot0, slot1)
	if not slot0.is_can_move then
		return
	end

	if not slot0.move_skill_item then
		slot0.move_skill_item = SkillItem.new(true, true, true, 0.9, true)

		slot0.main_container:addChild(slot0.move_skill_item)
	end

	slot0.move_skill_item:setVisible(true)
	slot0.move_skill_item:showLevel(true)

	if slot1:getData() and next(slot2) ~= nil then
		slot0.move_skill_item:setData(slot2)

		slot0.move_skill_item.elfin_bid = slot1.elfin_bid
	end

	slot1:setData()
	slot1:showLevel(false)

	slot1.elfin_bid = 0

	slot0.move_skill_item:setPosition(slot0.main_container:convertToNodeSpace(slot1:getTouchMovePosition()))
end

function ElfinAdjustWindow.onClickSkillItemCanceled(slot0, slot1)
	if not slot0.is_can_move or not slot0.move_skill_item then
		return
	end

	slot4 = false

	for slot8, slot9 in pairs(slot0.item_rect_list) do
		if cc.rectContainsPoint(slot9, slot0.main_container:convertToNodeSpace(slot1:getTouchMovePosition())) then
			if slot0.elfin_skill_list[slot8] then
				slot0.is_show_act = true
				slot12 = slot0.main_container:convertToNodeSpace(slot10:convertToWorldSpace(cc.p(0, 0)))

				slot0.move_skill_item:runAction(cc.Sequence:create(cc.MoveTo:create(0.1, cc.p(slot12.x + 53.5, slot12.y + 53.5)), cc.CallFunc:create(function ()
					uv0.move_skill_item:setVisible(false)

					slot0 = uv0.move_skill_item.elfin_bid

					for slot5, slot6 in pairs(uv0.chose_elfin_list) do
						if uv2 and slot6.pos == uv2.elfin_pos then
							slot6.item_bid = uv1.elfin_bid or 0
						elseif slot6.pos == uv3 and slot0 then
							slot6.item_bid = slot0
						end
					end

					uv0:updateSkillList()

					uv0.is_show_act = false
				end)))

				slot4 = true
			end

			break
		end
	end

	if not slot4 then
		slot0:onClickSkillItemEnd(slot1)
	end
end

function ElfinAdjustWindow.onClickSkillItemEnd(slot0, slot1)
	if slot0.move_skill_item then
		slot0.is_show_act = true
		slot3 = slot0.main_container:convertToNodeSpace(slot1:convertToWorldSpace(cc.p(0, 0)))

		slot0.move_skill_item:runAction(cc.Sequence:create(cc.MoveTo:create(0.1, cc.p(slot3.x + 53.5, slot3.y + 53.5)), cc.CallFunc:create(function ()
			uv0.move_skill_item:setVisible(false)
			uv0:updateSkillList()

			uv0.is_show_act = false
		end)))
	end
end

function ElfinAdjustWindow.getTreeElfinBidByPos(slot0, slot1)
	if not slot0.chose_elfin_list then
		return
	end

	slot2 = nil

	for slot6, slot7 in pairs(slot0.chose_elfin_list) do
		if slot7.pos == slot1 then
			slot2 = slot7.item_bid

			break
		end
	end

	return slot2
end

function ElfinAdjustWindow.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	for slot4, slot5 in pairs(slot0.elfin_skill_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.move_skill_item then
		slot0.move_skill_item:DeleteMe()

		slot0.move_skill_item = nil
	end

	uv0:openElfinAdjustWindow(false)
end
