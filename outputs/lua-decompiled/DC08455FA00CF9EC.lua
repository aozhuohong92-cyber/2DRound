slot1 = HeavenController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
HeavenDialWishWindow = HeavenDialWishWindow or BaseClass(BaseView)

function HeavenDialWishWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "heaven/heaven_dial_wish_window"
	slot0.cur_item_id_list = {}
	slot0.select_cell_list = {}
	slot0.heaven_data_list = {}
	slot0.cur_hero_item_list = {}
	slot0.tab_list = {}
	slot0.cur_tab_index = 1
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("heavendial", "heavendial"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("heavendial", "heavendial_bg"),
			type = ResourcesType.single
		}
	}
end

function HeavenDialWishWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot1:getChildByName("win_title"):setString(TI18N("心愿单"))

	slot6 = 1

	slot0:playEnterAnimatianByObj(slot1, slot6)

	slot0.right_btn = slot1:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("确 定"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.elfin_info_panel = slot1:getChildByName("elfin_info_panel")

	slot1:getChildByName("tips_lab"):setString(TI18N("选择心仪的神装许愿，维修获取概率会大幅提升！"))
	slot1:getChildByName("tips_lab"):setTextColor(cc.c3b(104, 69, 42))

	for slot6 = 1, 4 do
		slot7 = {}

		if slot1:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot6) then
			slot8:loadTextures(PathTool.getResFrame("common", "common_90030"), "", "", LOADTEXT_TYPE_PLIST)

			if slot6 == 1 then
				slot8:getChildByName("title"):setString(TI18N("耳环"))
			elseif slot6 == 2 then
				slot9:setString(TI18N("项链"))
			elseif slot6 == 3 then
				slot9:setString(TI18N("戒指"))
			elseif slot6 == 4 then
				slot9:setString(TI18N("手镯"))
			end

			slot7.tab_btn = slot8
			slot7.label = slot9

			slot7.label:setTextColor(cc.c3b(215, 226, 227))

			slot7.index = HeroConst.HolyequipmentPosList[slot6]
			slot7.tips = slot8:getChildByName("tips")
			slot0.tab_list[slot7.index] = slot7
		end
	end

	slot0.elfin_list = slot1:getChildByName("elfin_list")
	slot0.elfin_list_view = CommonScrollViewSingleLayout.new(slot0.elfin_list, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.elfin_list:getContentSize(), {
		start_y = 10,
		row = 0,
		start_x = 13,
		space_x = 32,
		space_y = 10,
		col = 4,
		need_dynamic = true,
		item_width = BackPackItem.Width * 0.9,
		item_height = (BackPackItem.Height + 50) * 0.9
	}, cc.p(0, 0))

	slot0.elfin_list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.elfin_list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.elfin_list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot10 = slot0
	slot9 = ScrollViewFuncType.OnCellTouched

	slot0.elfin_list_view:registerScriptHandlerSingle(handler(slot10, slot0.onCellTouched), slot9)

	slot5 = 80

	for slot9, slot10 in pairs(HeavenConst.Dial_Wish_Pos) do
		if not slot0.cur_hero_item_list[slot9] then
			slot12 = slot0.elfin_info_panel:getChildByName("heaven" .. slot10)
			slot11 = DialWishItem.new()

			slot11:setScale(0.7)
			slot11:addCallBack(function ()
				uv0:selectHolyByIndex(uv1, uv2)
			end)
			slot11:createSpriteMask()

			slot11.panel = slot12

			slot12:addChild(slot11)

			slot0.cur_hero_item_list[slot10] = slot11
		end

		slot11:setPosition(cc.p(57.5, 80))
	end
end

function HeavenDialWishWindow.selectHolyByIndex(slot0, slot1, slot2)
	if slot1.is_ui_select == true then
		if slot1.equip_vo then
			for slot7, slot8 in pairs(slot0.cur_item_id_list) do
				if slot8 and slot8.lucky_holy_eqm == slot1.equip_vo.group_id then
					for slot12, slot13 in pairs(slot0.select_cell_list) do
						slot14 = slot13:getData()

						if slot3 and slot14 and slot3.group_id == slot14.group_id then
							slot15 = slot0.select_cell_list[slot12]

							slot0.select_cell_list[slot12]:IsGetStatus(false)

							slot0.select_cell_list[slot12] = nil

							break
						end
					end

					slot0.cur_item_id_list[slot7].lucky_holy_eqm = nil

					break
				end
			end

			slot0:updateCurHeroHolyItemList()
		end

		return
	end

	if slot0.cur_hero_item then
		slot0.cur_hero_item.is_ui_select = false

		slot0.cur_hero_item:setMaskVisible(false)
	end

	slot1.is_ui_select = true

	slot1:setMaskVisible(true)

	slot0.cur_hero_item = slot1
	slot0.pos = slot2
	slot3 = BackPackConst.item_type.GOD_EARRING

	if slot1.equip_vo then
		slot3 = slot1.equip_vo.type
	end

	slot0:changeSelectedTab(slot3)
end

function HeavenDialWishWindow.updateCurHeroHolyItemList(slot0)
	if slot0.select_cell_list then
		for slot5, slot6 in pairs(slot0.select_cell_list) do
			if slot6 then
				-- Nothing
			end
		end

		slot0.select_cell_list = {
			[slot5] = slot6
		}
	end

	slot2 = {}

	for slot6, slot7 in pairs(slot0.cur_item_id_list or {}) do
		if slot7 then
			uv0(slot2, slot7)
		end
	end

	slot0.cur_item_id_list = slot2

	for slot6, slot7 in pairs(HeavenConst.Dial_Wish_Pos) do
		slot8 = nil

		for slot12, slot13 in pairs(slot0.cur_item_id_list) do
			if slot13.pos == slot7 then
				if Config.HolyEqmLotteryData.data_wish_show[slot13.lucky_holy_eqm] then
					slot8 = slot14
				end

				break
			end
		end

		slot9 = slot0.cur_hero_item_list[slot7]

		if slot8 then
			slot9:setData(slot8, true, true)

			slot9.equip_vo = slot8

			slot9:showAddIcon(false)
		else
			slot9:setData(nil, nil, true)

			slot9.equip_vo = nil

			slot9:showAddIcon(true)
		end

		slot9.is_ui_select = false

		if slot0.pos and slot7 == slot0.pos then
			slot9.is_ui_select = true
			slot0.cur_hero_item = slot9
		end

		slot9:setMaskVisible(slot9.is_ui_select)
	end
end

function HeavenDialWishWindow.createNewCell(slot0)
	slot1 = DialWishItem.new()

	slot1:setScale(0.9)
	slot1:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)
	slot1:addLongTimeTouchCallback(function ()
		uv0:onCellLongTimeTouched(uv1)
	end)

	return slot1
end

function HeavenDialWishWindow.numberOfCells(slot0)
	if not slot0.heaven_data_list then
		return 0
	end

	return #slot0.heaven_data_list
end

function HeavenDialWishWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.heaven_data_list[slot2] then
		slot8 = true

		slot1:setData(slot3, slot8)

		slot7 = false

		slot1:IsGetStatus(slot7)

		for slot7, slot8 in pairs(slot0.cur_item_id_list) do
			if slot8 and slot8.lucky_holy_eqm == slot3.group_id then
				slot1:IsGetStatus(true)

				slot0.select_cell_list[slot8.pos] = slot1

				break
			end
		end
	end
end

function HeavenDialWishWindow.onCellLongTimeTouched(slot0, slot1)
	if slot0.heaven_data_list[slot1.index] then
		slot2.open_type = 1

		TipsManager:getInstance():showGoodsTips(slot2)
	end
end

function HeavenDialWishWindow.onCellTouched(slot0, slot1)
	if slot0.is_play_item_action then
		return
	end

	slot2 = false

	for slot7, slot8 in pairs(slot0.cur_item_id_list) do
		if slot8 and slot8.lucky_holy_eqm == slot0.heaven_data_list[slot1.index].group_id then
			for slot12, slot13 in pairs(slot0.select_cell_list) do
				slot14 = slot13:getData()

				if slot3 and slot14 and slot3.group_id == slot14.group_id then
					slot0.select_cell_list[slot12]:IsGetStatus(false)

					slot17 = slot0.elfin_info_panel:convertToNodeSpace(slot0.select_cell_list[slot12]:convertToWorldSpace(cc.p(BackPackItem.Width * 0.5, BackPackItem.Height * 0.5)))
					slot18 = 0
					slot19 = 0

					if slot0.cur_hero_item_list[slot8.pos] and slot0.cur_hero_item_list[slot8.pos].panel then
						slot18, slot19 = slot0.cur_hero_item_list[slot8.pos].panel:getPosition()
					end

					slot0:showMoveEffect(cc.p(slot18, slot19), slot17, slot3)

					slot0.select_cell_list[slot12] = nil

					break
				end
			end

			slot0.cur_item_id_list[slot7].lucky_holy_eqm = nil
			slot2 = true

			break
		end
	end

	if slot2 == false then
		for slot7, slot8 in pairs(slot0.cur_item_id_list) do
			if slot8.pos == slot0.pos then
				if slot0.select_cell_list[slot0.pos] then
					slot0.select_cell_list[slot0.pos]:IsGetStatus(false)

					slot0.select_cell_list[slot0.pos] = nil
				end

				slot8.lucky_holy_eqm = slot3.group_id
				slot0.select_cell_list[slot0.pos] = slot1

				break
			end
		end

		slot5 = slot0.elfin_info_panel:convertToNodeSpace(slot1:convertToWorldSpace(cc.p(BackPackItem.Width * 0.5, BackPackItem.Height * 0.5)))
		slot6 = 0
		slot7 = 0

		if slot0.cur_hero_item_list[slot0.pos] and slot0.cur_hero_item_list[slot0.pos].panel then
			slot6, slot7 = slot0.cur_hero_item_list[slot0.pos].panel:getPosition()
		end

		slot0:showMoveEffect(slot5, cc.p(slot6, slot7), slot3, function ()
			uv0:updateCurHeroHolyItemList()
		end)
		slot1:IsGetStatus(true)
	else
		slot0:updateCurHeroHolyItemList()
	end
end

function HeavenDialWishWindow.showMoveEffect(slot0, slot1, slot2, slot3, slot4)
	slot0.is_play_item_action = true

	if slot0.move_item == nil then
		slot0.move_item = DialWishItem.new()

		slot0.move_item:setScale(0.7)
		slot0.elfin_info_panel:addChild(slot0.move_item, 1)
	end

	slot0.move_item:setData(slot3)
	slot0.move_item:setPosition(slot1)
	slot0.move_item:runAction(cc.Sequence:create(cc.MoveTo:create(0.2, slot2), cc.CallFunc:create(function ()
		if uv0.move_item then
			uv0.move_item:setPosition(-10000, 0)
		end

		uv0.is_play_item_action = false

		if uv1 then
			uv1()
		end
	end)))
end

function HeavenDialWishWindow.register_event(slot0)
	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended and not uv0.is_show_egg_effect then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end

	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickChooseBtn), true)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClickCloseBtn()
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClickCloseBtn()
	end, false, 2)
end

function HeavenDialWishWindow.onClickCloseBtn(slot0)
	uv0:openHeavenDialWishWindow(false)
end

function HeavenDialWishWindow.onClickChooseBtn(slot0)
	if not slot0.dial_data then
		return
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0.cur_item_id_list) do
		if slot6 then
			if slot6.lucky_holy_eqm == nil then
				slot7 = 0
			end

			uv0(slot1, {
				pos = slot6.pos,
				lucky_holy_eqm = slot7
			})
		end
	end

	uv1:sender25230(slot0.dial_data.group_id, slot1)
	slot0:onClickCloseBtn()
end

function HeavenDialWishWindow.changeSelectedTab(slot0, slot1)
	if slot0.cur_tab_index and slot0.cur_tab_index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.tab_btn:loadTextures(PathTool.getResFrame("common", "common_90030"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.label:setTextColor(cc.c3b(215, 226, 227))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.tab_btn:loadTextures(PathTool.getResFrame("common", "common_90031"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.label:setTextColor(cc.c3b(2, 54, 86))
	end

	slot0.cur_tab_index = slot1

	if Config.HolyEqmLotteryData.data_wish_id[slot1] then
		slot0.heaven_data_list = {}
		slot3 = {}

		for slot7, slot8 in pairs(slot2) do
			if Config.HolyEqmLotteryData.data_wish_show[slot8.group_id] then
				uv0(slot3, slot9)
			end
		end

		slot0.heaven_data_list = slot3
		slot0.select_cell_list = {}

		slot0.elfin_list_view:reloadData()
	end
end

function HeavenDialWishWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.dial_data = slot1
	slot0.elfin_bid_list = {}

	for slot5 = 1, 4 do
		slot6 = nil

		for slot10, slot11 in pairs(slot1.lucky_holy_eqm) do
			if slot11.pos == slot5 then
				slot6 = slot11.lucky_holy_eqm

				break
			end
		end

		uv0(slot0.elfin_bid_list, {
			pos = slot5,
			lucky_holy_eqm = slot6
		})
	end

	slot0.cur_item_id_list = slot0.elfin_bid_list

	slot0:updateCurHeroHolyItemList()
	slot0:changeSelectedTab(BackPackConst.item_type.GOD_EARRING)
end

function HeavenDialWishWindow.openRootWnd(slot0, slot1, slot2)
	slot0.pos = slot1 or 1

	slot0:setData(slot2)
end

function HeavenDialWishWindow.close_callback(slot0)
	if slot0.elfin_list_view then
		slot0.elfin_list_view:DeleteMe()

		slot0.elfin_list_view = nil
	end

	if slot0.move_item then
		slot0.move_item:stopAllActions()

		if slot0.move_item.DeleteMe then
			slot0.move_item:DeleteMe()
		end

		slot0.move_item = nil
	end

	if slot0.cur_hero_item_list then
		for slot4, slot5 in pairs(slot0.cur_hero_item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end

		slot0.cur_hero_item_list = nil
	end

	uv0:openHeavenDialWishWindow(false)
end

DialWishItem = class("DialWishItem", function ()
	return ccui.Widget:create()
end)

function DialWishItem.ctor(slot0)
	slot0:configUI()
end

function DialWishItem.configUI(slot0)
	slot0.size = cc.size(BackPackItem.Width, BackPackItem.Height + 50)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.item_node = BackPackItem.new(false, true, false)

	slot0.item_node:setPosition(cc.p(slot0.size.width * 0.5, slot0.size.height - BackPackItem.Height * 0.5))
	slot0:addChild(slot0.item_node)
end

function DialWishItem.addCallBack(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:addCallBack(slot1)
	end
end

function DialWishItem.addLongTimeTouchCallback(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:addLongTimeTouchCallback(slot1)
	end
end

function DialWishItem.createSpriteMask(slot0)
	if slot0.item_node then
		slot0.item_node:createSpriteMask()
	end
end

function DialWishItem.setMaskVisible(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:setMaskVisible(slot1)
	end
end

function DialWishItem.showAddIcon(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:showAddIcon(slot1)
	end
end

function DialWishItem.setData(slot0, slot1, slot2, slot3)
	slot0.data = slot1

	if slot0.item_node then
		if slot1 then
			slot0.item_node:setItemIcon(PathTool.getItemRes(slot1.icon))
			slot0.item_node:setSelfBackground(slot1.quality)

			if slot2 then
				if slot3 then
					slot0.item_node:setGoodsName(slot1.name, cc.p(holy_item.Width / 2, -36), 26, cc.c4b(255, 234, 188, 255))
				else
					slot0.item_node:setGoodsName(slot1.name)
				end
			end
		else
			if slot3 then
				slot0.item_node:setGoodsName(TI18N("心愿水晶"), cc.p(holy_item.Width / 2, -36), 26, cc.c4b(255, 234, 188, 255))
			else
				slot0.item_node:setGoodsName("")
			end

			slot0.item_node.item_icon:setVisible(false)
			slot0.item_node:setSelfBackground(BackPackConst.quality.white)
		end
	end
end

function DialWishItem.getData(slot0)
	return slot0.data
end

function DialWishItem.IsGetStatus(slot0, slot1)
	if slot0.item_node then
		slot0.item_node:IsGetStatus(slot1)
	end
end

function DialWishItem.DeleteMe(slot0)
	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end
end
