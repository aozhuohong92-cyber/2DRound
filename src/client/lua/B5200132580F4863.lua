BattleCampView = BattleCampView or BaseClass(BaseView)
slot0 = BattleController:getInstance()
slot1 = table.insert
slot2 = string.format

function BattleCampView.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "battle/battle_camp_view"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battlecamp", "battlecamp"),
			type = ResourcesType.plist
		}
	}
end

function BattleCampView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.main_size = slot1:getContentSize()

	slot1:getChildByName("title_label_1"):setString(TI18N("阵营克制"))
	slot1:getChildByName("title_label_2"):setString(TI18N("阵营克制效果:"))
	slot1:getChildByName("attr_label_1"):setString(TI18N("伤害+25%"))
	slot1:getChildByName("attr_label_2"):setString(TI18N("命中+20%"))

	slot6 = slot1:getChildByName("list_panel")
	slot7 = slot6:getContentSize()
	slot0.camp_scrollview = CommonScrollViewSingleLayout.new(slot6, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot7.width, slot7.height), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 593,
		item_height = 160,
		space_y = 5,
		col = 1,
		need_dynamic = true
	})

	slot0.camp_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.camp_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.camp_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function BattleCampView.createNewCell(slot0, slot1, slot2)
	return BattleCampItem.new(slot1, slot2)
end

function BattleCampView.numberOfCells(slot0)
	return #slot0.show_list
end

function BattleCampView.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	slot1:setData(slot0.show_list[slot2], slot2)
end

function BattleCampView.openRootWnd(slot0, slot1)
	slot0.form_id_list = slot1 or {}
	slot0.form_pos_info = {}

	for slot5, slot6 in pairs(slot0.form_id_list) do
		if Config.CombatHaloData.data_halo[slot6] then
			for slot11, slot12 in pairs(slot7.pos_info) do
				if not slot0.form_pos_info[slot12[1]] then
					slot0.form_pos_info[slot13] = slot12[2]
				else
					slot0.form_pos_info[slot13] = slot0.form_pos_info[slot13] + slot14
				end
			end
		end
	end

	slot0:updateAllAttrText()
	slot0:refreshCampList()
end

function BattleCampView.updateAllAttrText(slot0)
	if not slot0.all_attr_txt then
		slot0.all_attr_txt = createRichLabel(22, cc.c4b(255, 125, 39, 255), cc.p(0.5, 0.5), cc.p(slot0.main_size.width * 0.5, 435), nil, nil, slot0.main_size.width)

		slot0.main_container:addChild(slot0.all_attr_txt)
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0.form_id_list) do
		if Config.CombatHaloData.data_halo[slot6] and slot7.attrs and next(slot7.attrs) ~= nil then
			for slot11, slot12 in pairs(slot7.attrs) do
				slot13 = false

				for slot17, slot18 in pairs(slot1) do
					if slot18[1] == slot12[1] then
						slot13 = true
						slot18[2] = slot18[2] + slot12[2]

						break
					end
				end

				if not slot13 then
					uv0(slot1, deepCopy(slot12))
				end
			end
		end
	end

	if next(slot1) == nil then
		slot0.all_attr_txt:setString(TI18N("未激活阵营光环"))
	else
		slot2 = ""

		for slot6, slot7 in ipairs(slot1) do
			if Config.AttrData.data_key_to_name[slot7[1]] then
				if PartnerCalculate.isShowPerByStr(slot8) == true then
					slot9 = slot7[2] / 1000 * 100 .. "%"
				end

				slot2 = slot6 == 1 and slot2 .. uv1("%s<div fontcolor=#68c74b>+%s</div>", slot10, slot9) or slot2 .. uv1("%s<div fontcolor=#68c74b>+%s</div>", slot10, slot9) .. uv1("  %s<div fontcolor=#68c74b>+%s</div>", slot10, slot9)
			end
		end

		slot0.all_attr_txt:setString(TI18N("总加成效果:") .. slot2)
	end
end

function BattleCampView.checkIsActivateCamp(slot0, slot1)
	slot2 = false

	if slot1 and next(slot1) ~= nil then
		slot2 = true

		for slot6, slot7 in pairs(slot1) do
			slot9 = slot7[2]
			slot10 = 0

			for slot14, slot15 in pairs(slot0.form_pos_info) do
				if slot14 == slot7[1] then
					slot10 = slot15

					break
				end
			end

			if slot10 < slot9 then
				slot2 = false

				break
			end
		end
	end

	return slot2
end

function BattleCampView.refreshCampList(slot0)
	if Config.CombatHaloData.data_halo_show then
		slot2 = {}
		slot3 = 6
		slot4 = false

		for slot8, slot9 in pairs(slot1) do
			slot11 = {
				id = slot8,
				is_activate = false,
				is_activate = true
			}

			for slot15, slot16 in pairs(deepCopy(slot9)) do
				slot16.is_activate = slot0:checkIsActivateCamp(slot16.pos_info)

				if slot16.is_activate then
					if slot11.id == slot3 then
						slot4 = true
					end
				end

				if not slot11.name then
					slot11.name = slot16.name
				end

				if not slot11.icon then
					slot11.icon = slot16.icon
				end
			end

			slot11.attr_data = slot10

			table.insert(slot2, slot11)
		end

		if slot4 then
			for slot8, slot9 in ipairs(slot2) do
				if slot9.id ~= slot3 then
					slot9.is_activate = false
				end
			end
		end

		table.sort(slot2, function (slot0, slot1)
			if slot0.is_activate and not slot1.is_activate then
				return true
			elseif not slot0.is_activate and slot1.is_activate then
				return false
			else
				return slot0.id < slot1.id
			end
		end)

		slot0.show_list = slot2

		slot0.camp_scrollview:reloadData()
	end
end

function BattleCampView.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 2)
	slot0:addGlobalEvent(SceneEvent.EXIT_FIGHT, function ()
		uv0:openBattleCampView(false)
	end)
end

function BattleCampView._onClickBtnClose(slot0)
	uv0:openBattleCampView(false)
end

function BattleCampView.close_callback(slot0)
	if slot0.camp_scrollview then
		slot0.camp_scrollview:DeleteMe()

		slot0.camp_scrollview = nil
	end

	uv0:openBattleCampView(false)
end

BattleCampItem = class("BattleCampItem", function ()
	return ccui.Widget:create()
end)

function BattleCampItem.ctor(slot0, slot1, slot2)
	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function BattleCampItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("battle/battle_camp_item"))

	slot0:addChild(slot0.root_wnd)

	slot4 = slot0.root_wnd:getChildByName("main_container")
	slot0.container = slot4
	slot0.cur_bg = slot4:getChildByName("cur_bg")

	slot0.cur_bg:setVisible(false)

	slot0.form_icon = slot4:getChildByName("form_icon")
	slot0.name = slot4:getChildByName("name")
	slot0.line = slot4:getChildByName("line")
	slot0.sp_activate = slot4:getChildByName("sp_activate")

	slot0.sp_activate:setVisible(false)

	slot0.attr_label = createRichLabel(18, 1, cc.p(0, 0.5), cc.p(100, 69), 5, nil, 500)

	slot0.container:addChild(slot0.attr_label)
end

function BattleCampItem.setData(slot0, slot1, slot2)
	if slot1 then
		if slot1.is_activate == true then
			slot0.cur_bg:setVisible(true)
			slot0.sp_activate:setVisible(true)
			setChildUnEnabled(false, slot0.form_icon)
		else
			slot0.cur_bg:setVisible(false)
			slot0.sp_activate:setVisible(false)
			setChildUnEnabled(true, slot0.form_icon)
		end

		slot0.name:setString(slot1.name)

		if slot1.id == 4 or slot1.id == 5 then
			slot0.name:setPositionY(145)
		else
			slot0.name:setPositionY(140)
		end

		slot0.form_icon_load = loadImageTextureFromCDN(slot0.form_icon, PathTool.getCampGroupIcon(slot1.icon), ResourcesType.single, slot0.form_icon_load)

		slot0.line:setVisible(slot2 ~= Config.CombatHaloData.data_halo_show_length)

		if slot1.id == 6 then
			if slot0.tip_label == nil then
				slot0.tip_label = createRichLabel(18, cc.c3b(255, 238, 221), cc.p(0.5, 0.5), cc.p(slot0.size.width * 0.5, 35), 5, nil, slot0.size.width)

				slot0.container:addChild(slot0.tip_label)
				slot0.tip_label:setString(uv0(TI18N("（本光环触发时，不同时触发<div fontcolor=#8bff8e>正义之力</div>和<div fontcolor=#8bff8e>首领之力</div>）")))
			else
				slot0.tip_label:setVisible(true)
			end
		elseif slot0.tip_label then
			slot0.tip_label:setVisible(false)
		end

		slot4 = ""
		slot5 = 0

		for slot9, slot10 in ipairs(slot1.attr_data) do
			if slot10.is_activate and slot1.is_activate then
				slot5 = slot9
			end
		end

		for slot9, slot10 in ipairs(slot1.attr_data) do
			slot11 = slot10.desc

			for slot15, slot16 in ipairs(slot10.attrs) do
				if Config.AttrData.data_key_to_name[slot16[1]] then
					if PartnerCalculate.isShowPerByStr(slot17) == true then
						slot18 = slot16[2] / 1000 * 100 .. "%"
					end

					slot11 = slot9 == slot5 and slot11 .. uv0("    %s<div fontcolor=#68c74b>+%s</div>", slot19, slot18) or slot11 .. uv0("    %s<div fontcolor=#68c74b>+%s</div>", slot19, slot18) .. uv0("    %s+%s", slot19, slot18)
				end
			end

			slot4 = slot4 .. ((slot9 ~= slot5 or uv0("<div fontcolor=#e0bf98>%s</div>", slot11)) and uv0("<div fontcolor=#695b50>%s</div>", slot11)) .. "\n"
		end

		slot0.attr_label:setString(slot4)
	end
end

function BattleCampItem.register_event(slot0)
end

function BattleCampItem.DeleteMe(slot0)
	if slot0.form_icon_load then
		slot0.form_icon_load:DeleteMe()

		slot0.form_icon_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
