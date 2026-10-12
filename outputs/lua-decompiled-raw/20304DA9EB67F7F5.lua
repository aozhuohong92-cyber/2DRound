ElfinHatchUnlockPanel = ElfinHatchUnlockPanel or BaseClass(BaseView)
slot1 = ElfinController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format

function ElfinHatchUnlockPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_hatch_unlock_panel"
	slot0.res_list = {}
end

function ElfinHatchUnlockPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N(""))

	slot0.Text_2 = slot0.main_container:getChildByName("Text_2")

	slot0.Text_2:setString(TI18N("消耗："))

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")
	slot0.right_btn_lab = slot0.right_btn:getChildByName("label")

	slot0.right_btn_lab:setString(TI18N("开  启"))

	slot0.tips_lab = slot0.main_container:getChildByName("tips_lab")

	slot0.tips_lab:setString(TI18N("开启条件"))

	slot0.icon_img = slot0.main_container:getChildByName("icon_img")
	slot0.con_num = slot0.main_container:getChildByName("con_num")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.elfin_list = slot0.main_container:getChildByName("elfin_list")
	slot0.elfin_list_view = CommonScrollViewSingleLayout.new(slot0.elfin_list, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.elfin_list:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 575,
		item_height = 50,
		space_y = 10,
		col = 1,
		need_dynamic = true
	}, cc.p(0, 0))

	slot0.elfin_list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.elfin_list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.elfin_list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function ElfinHatchUnlockPanel.createNewCell(slot0)
	return ElfinHatchUnlockItem.new(slot0.data)
end

function ElfinHatchUnlockPanel.numberOfCells(slot0)
	if not slot0.elfin_data_list then
		return 0
	end

	return #slot0.elfin_data_list
end

function ElfinHatchUnlockPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.elfin_data_list[slot2] then
		slot1:setData(slot3)
	end
end

function ElfinHatchUnlockPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0._onClickBtnRight), true, 2)
end

function ElfinHatchUnlockPanel._onClickBtnClose(slot0)
	uv0:openElfinHatchUnlockPanel(false)
end

function ElfinHatchUnlockPanel._onClickBtnRight(slot0)
	if not slot0.data then
		return
	end

	if slot0.data.is_open == 0 then
		message(TI18N("解锁条件未达成"))

		return
	end

	if Config.SpriteData.data_hatch_data[slot0.data.id] then
		for slot5, slot6 in ipairs(slot1.expend) do
			if BackpackController:getInstance():getModel():getItemNumByBid(slot6[1]) < slot6[2] then
				if Config.ItemData.data_get_data(slot7) then
					if slot7 == Config.ItemData.data_assets_label2id.gold then
						if FILTER_CHARGE then
							message(TI18N("钻石不足"))
						else
							CommonAlert.show(string.format(TI18N("%s不足，是否前往充值？"), slot10.name), TI18N("确定"), function ()
								VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
							end, TI18N("取消"), nil, CommonAlert.type.rich, nil, , , true)
						end
					else
						BackpackController:getInstance():openTipsSource(true, slot10)
					end
				end

				return
			end
		end
	end

	uv0:sender26535(slot0.data.id)
end

function ElfinHatchUnlockPanel.openRootWnd(slot0, slot1)
	slot0.data = slot1

	slot0:setData()
end

function ElfinHatchUnlockPanel.setData(slot0)
	if not slot0.data then
		return
	end

	if not Config.SpriteData.data_hatch_data[slot0.data.id] then
		return
	end

	slot5 = slot1.name

	slot0.title:setString(slot5)

	slot0.elfin_data_list = {
		{
			cond = slot1.hatch_cond,
			desc = slot1.desc2
		}
	}

	slot0.elfin_list_view:reloadData()

	for slot5, slot6 in ipairs(slot1.expend) do
		if Config.ItemData.data_get_data(slot6[1]) then
			slot0.con_num:setString(tostring(slot6[2]))
			loadSpriteTexture(slot0.icon_img, PathTool.getItemRes(slot9.icon), LOADTEXT_TYPE)
		end
	end
end

function ElfinHatchUnlockPanel.close_callback(slot0)
	if slot0.elfin_list_view then
		slot0.elfin_list_view:DeleteMe()

		slot0.elfin_list_view = nil
	end

	uv0:openElfinHatchUnlockPanel(false)
end

ElfinHatchUnlockItem = class("ElfinHatchUnlockItem", function ()
	return ccui.Widget:create()
end)

function ElfinHatchUnlockItem.ctor(slot0, slot1)
	slot0.cur_info = slot1

	slot0:configUI()
end

function ElfinHatchUnlockItem.configUI(slot0)
	slot0.size = cc.size(575, 50)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.lock_desc = createLabel(24, cc.c4b(149, 83, 34, 255), nil, 20, slot0.size.height / 2, "", slot0, nil, cc.p(0, 0.5))
	slot0.status_tips = createLabel(24, cc.c4b(149, 83, 34, 255), nil, 500, slot0.size.height / 2, "", slot0, nil, cc.p(0, 0.5))
end

function ElfinHatchUnlockItem.setData(slot0, slot1)
	if not slot1 or not slot0.cur_info then
		return
	end

	slot0.status_tips:setString(TI18N("未达成"))

	slot2 = slot1.cond[2]
	slot3 = slot1.cond[2]

	if slot1.cond[1] == "has_any_sprite" then
		slot2 = 1
		slot3 = 1
	end

	slot4 = false

	if slot0.cur_info.is_open == 0 and slot1.cond then
		slot2 = 0

		if slot1.cond[1] == "lev" then
			if RoleController:getInstance():getRoleVo() then
				slot2 = slot5.lev

				if slot5.lev < slot1.cond[2] then
					slot4 = true
				end
			end
		elseif slot1.cond[1] == "sprite_tree_break" then
			if uv0:getElfinTreeData() then
				slot2 = slot5.break_lev

				if slot5.break_lev < slot1.cond[2] then
					slot4 = true
				end
			end
		elseif slot1.cond[1] == "sprite_tree_lv" then
			if uv0:getElfinTreeData() then
				slot2 = slot5.lev

				if slot5.lev < slot1.cond[2] then
					slot4 = true
				end
			end
		elseif slot1.cond[1] == "has_any_sprite" then
			slot5 = false

			for slot9, slot10 in pairs(slot1.cond[2]) do
				if BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot10) and slot11 > 0 then
					slot5 = true
					slot2 = slot11

					break
				end
			end

			slot3 = 1

			if slot5 == false then
				slot4 = true
			end
		elseif slot1.cond[1] == "sprite_tree_power" then
			if uv0:getElfinTreeData() then
				slot2 = slot5.power

				if slot5.power < slot1.cond[2] then
					slot4 = true
				end
			end
		elseif slot1.cond[1] == "sprite_power" and uv0:getElfinTreeData() then
			for slot9, slot10 in pairs(slot5.sprites) do
				if Config.SpriteData.data_elfin_data(slot10.item_bid) then
					slot2 = slot2 + slot11.power
				end
			end

			if slot2 < slot1.cond[2] then
				slot4 = true
			end
		end
	end

	if slot3 < slot2 then
		slot2 = slot3
	end

	slot0.lock_desc:setString(uv1("%s(%d/%d)", slot1.desc, slot2, slot3))

	if slot4 == true then
		slot0.lock_desc:setTextColor(cc.c4b(149, 83, 34, 255))
		slot0.status_tips:setTextColor(cc.c4b(149, 83, 34, 255))
		slot0.status_tips:setString(TI18N("未达成"))
	else
		slot0.lock_desc:setTextColor(cc.c4b(36, 144, 35, 255))
		slot0.status_tips:setTextColor(cc.c4b(36, 144, 35, 255))
		slot0.status_tips:setString(TI18N("达成"))
	end
end

function ElfinHatchUnlockItem.DeleteMe(slot0)
end
