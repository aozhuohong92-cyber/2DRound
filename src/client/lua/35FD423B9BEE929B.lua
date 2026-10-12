slot1 = HomeworldController:getInstance():getModel()
HomeworldFurniture = HomeworldFurniture or BaseClass()

function HomeworldFurniture.__init(slot0, slot1, slot2, slot3)
	slot0.parent = slot1
	slot0.callback = slot2
	slot0.is_can_edit = slot3
	slot0.edit_status = false
	slot0.cur_dir = HomeworldConst.Dir_Type.Left
	slot0.cur_grid_x = 0
	slot0.cur_grid_y = 0
	slot0.grid_type = HOME_TILE_TYPE_LAND
	slot0.grid_list = {}
	slot0.range_list = {}
	slot0.last_grid_can_use = true
	slot0.size = cc.size(100, 100)

	slot0:createRoorWnd()
	slot0:registerEvent()
end

function HomeworldFurniture.createRoorWnd(slot0)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0))
	slot0.root_wnd:setTouchEnabled(false)
	slot0.parent:addChild(slot0.root_wnd)
end

function HomeworldFurniture.registerEvent(slot0)
	slot0.root_wnd:addTouchEventListener(function (slot0, slot1)
		if not uv0.is_can_edit then
			return
		end

		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
			uv0.move_begin_grid_x = uv0.cur_grid_x
			uv0.move_begin_grid_y = uv0.cur_grid_y
			uv0.move_begin_dir = uv0.cur_dir
			uv0.move_begin_grid_type = uv0.grid_type

			if uv0.edit_status == false and uv0.callback then
				uv0.callback(1)
			end
		elseif slot1 == ccui.TouchEventType.moved then
			if not uv0._is_update_occ and uv0.data then
				uv0._is_update_occ = true

				if uv0:checkIsCarpet() then
					uv1:updateOccupyGridList({
						{
							HomeworldConst.Scene_Unit_Type.Furniture,
							uv0.data.id
						},
						{
							HomeworldConst.Scene_Unit_Type.Role
						}
					}, 2)
				else
					uv1:updateOccupyGridList({
						{
							HomeworldConst.Scene_Unit_Type.Furniture,
							uv0.data.id
						},
						{
							HomeworldConst.Scene_Unit_Type.Role
						}
					}, 1)
				end
			end

			slot2 = slot0:getTouchMovePosition()

			if uv0.touch_began and slot2 and (math.abs(slot2.x - uv0.touch_began.x) > 10 or math.abs(slot2.y - uv0.touch_began.y) > 10) then
				uv0:moveFurnitureByPos(uv0.parent:convertToNodeSpace(slot2))
			end
		elseif slot1 == ccui.TouchEventType.ended or slot1 == ccui.TouchEventType.canceled then
			uv0._is_update_occ = false
			slot2 = slot0:getTouchEndPosition()
			slot3 = false

			if uv0.touch_began and slot2 and (math.abs(slot2.x - uv0.touch_began.x) > 10 or math.abs(slot2.y - uv0.touch_began.y) > 10) then
				slot3 = true
			end

			if slot3 == false then
				playButtonSound2()
				uv0:onClickFurniture()
			elseif not uv0.last_grid_can_use then
				uv0.cur_grid_x = uv0.move_begin_grid_x
				uv0.cur_grid_y = uv0.move_begin_grid_y

				uv0.data:updateIndex(HomeTile.tileIndex(uv0.cur_grid_x, uv0.cur_grid_y))
				uv0:adjustPosition(uv0.cur_grid_x, uv0.cur_grid_y)

				if uv0.config and uv0.config.type == HomeworldConst.Unit_Type.WallAcc then
					if uv0.cur_grid_x == 11 and uv0.move_begin_dir ~= uv0.cur_dir then
						uv0.grid_type = uv0.move_begin_grid_type

						uv0:changeFurnitureDir()
					else
						uv0:checkWallUnitNeedOverturn(uv0.cur_grid_x)
					end
				end

				uv0:updateGridStatus(uv0.cur_grid_x, uv0.cur_grid_y)
			end
		end
	end)
end

function HomeworldFurniture.onClickFurniture(slot0)
	if not slot0.is_can_edit then
		return
	end

	slot0:updateEditStatus(true)
end

function HomeworldFurniture.moveFurnitureByPos(slot0, slot1)
	if not slot0.edit_status then
		slot0:updateEditStatus(true)
	end

	slot2, slot3 = HomeTile.toTile(slot0.grid_type, slot1.x, slot1.y)

	if slot0.cur_grid_x ~= slot2 or slot0.cur_grid_y ~= slot3 then
		if slot0.config and slot0.config.type == HomeworldConst.Unit_Type.WallAcc then
			slot0:checkWallUnitNeedOverturn(slot2)
		end

		slot0:adjustPosition(slot2, slot3)
		slot0:updateGridStatus(slot2, slot3)

		slot0.cur_grid_x = slot2
		slot0.cur_grid_y = slot3

		slot0.data:updateIndex(HomeTile.tileIndex(slot2, slot3))
		slot0:updateRestBtnStatus()
	end
end

function HomeworldFurniture.setLocalZOrder(slot0, slot1, slot2)
	if slot0.root_wnd then
		if slot0.config.type == HomeworldConst.Unit_Type.Carpet then
			if slot2 then
				slot0.root_wnd:setLocalZOrder(slot1 or 1)
			else
				slot0.root_wnd:setLocalZOrder(0)
			end
		else
			slot0.root_wnd:setLocalZOrder(slot1)
		end
	end
end

function HomeworldFurniture.checkWallUnitNeedOverturn(slot0, slot1)
	if slot1 < 11 and slot0.cur_dir == HomeworldConst.Dir_Type.Right or slot1 > 11 and slot0.cur_dir == HomeworldConst.Dir_Type.Left then
		if slot1 < 11 then
			slot0.grid_type = HOME_TILE_TYPE_L_WALL
		else
			slot0.grid_type = HOME_TILE_TYPE_R_WALL
		end

		slot0:changeFurnitureDir()
	end
end

function HomeworldFurniture.changeCanEditStatus(slot0, slot1)
	slot0.is_can_edit = slot1

	slot0.root_wnd:setTouchEnabled(slot0.is_can_edit)

	if slot1 == false then
		slot0:updateEditStatus(false)
	end
end

function HomeworldFurniture.updateEditStatus(slot0, slot1)
	if slot0.edit_status == slot1 then
		return
	end

	if slot0.edit_status == true and slot0.callback then
		slot0.callback(2)
	end

	slot0.edit_status = slot1

	if slot1 == true then
		slot0:showGridList()
	else
		for slot5, slot6 in pairs(slot0.grid_list) do
			slot6.grid:setVisible(false)

			slot6.status = false
			slot6.range = nil
		end
	end

	slot0:showEditUI(slot1)
end

function HomeworldFurniture.getEditStatus(slot0)
	return slot0.edit_status
end

function HomeworldFurniture.showEditUI(slot0, slot1)
	if slot1 == true then
		if slot0.callback then
			slot0.callback(4, true)
		end

		if not slot0.edit_quan_sp then
			slot0.edit_quan_sp = createSprite(PathTool.getPlistImgForDownLoad("homeworld", "homeworld_big_bg_1"), slot0.size.width * 0.5, slot0.size.height * 0.5, slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE, 2)
			slot2 = slot0.edit_quan_sp:getContentSize()
			slot0.edit_touch_layer = ccui.Layout:create()

			slot0.edit_touch_layer:setContentSize(cc.size(slot2.width - 60, slot2.height - 60))
			slot0.edit_touch_layer:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.edit_touch_layer:setPosition(cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5))
			slot0.edit_touch_layer:setTouchEnabled(true)
			slot0.root_wnd:addChild(slot0.edit_touch_layer, 1)
			slot0.edit_touch_layer:addTouchEventListener(function (slot0, slot1)
				if not uv0.is_can_edit then
					return
				end

				if slot1 == ccui.TouchEventType.began then
					uv0.touch_began = slot0:getTouchBeganPosition()
					uv0.move_begin_grid_x = uv0.cur_grid_x
					uv0.move_begin_grid_y = uv0.cur_grid_y

					if uv0.edit_status == false and uv0.callback then
						uv0.callback(1)
					end
				elseif slot1 == ccui.TouchEventType.moved then
					if not uv0._is_update_occ and uv0.data then
						uv0._is_update_occ = true

						if uv0:checkIsCarpet() then
							uv1:updateOccupyGridList({
								{
									HomeworldConst.Scene_Unit_Type.Furniture,
									uv0.data.id
								},
								{
									HomeworldConst.Scene_Unit_Type.Role
								}
							}, 2)
						else
							uv1:updateOccupyGridList({
								{
									HomeworldConst.Scene_Unit_Type.Furniture,
									uv0.data.id
								},
								{
									HomeworldConst.Scene_Unit_Type.Role
								}
							}, 1)
						end
					end

					slot2 = slot0:getTouchMovePosition()

					if uv0.touch_began and slot2 and (math.abs(slot2.x - uv0.touch_began.x) > 10 or math.abs(slot2.y - uv0.touch_began.y) > 10) then
						uv0:moveFurnitureByPos(uv0.parent:convertToNodeSpace(slot2))
					end
				elseif slot1 == ccui.TouchEventType.ended or slot1 == ccui.TouchEventType.canceled then
					uv0._is_update_occ = false

					if not uv0.last_grid_can_use then
						uv0.cur_grid_x = uv0.move_begin_grid_x
						uv0.cur_grid_y = uv0.move_begin_grid_y

						uv0.data:updateIndex(HomeTile.tileIndex(uv0.cur_grid_x, uv0.cur_grid_y))
						uv0:adjustPosition(uv0.cur_grid_x, uv0.cur_grid_y)

						if uv0.config and uv0.config.type == HomeworldConst.Unit_Type.WallAcc then
							if uv0.cur_grid_x == 11 and uv0.move_begin_dir ~= uv0.cur_dir then
								uv0.grid_type = uv0.move_begin_grid_type

								uv0:changeFurnitureDir()
							else
								uv0:checkWallUnitNeedOverturn(uv0.cur_grid_x)
							end
						end

						uv0:updateGridStatus(uv0.cur_grid_x, uv0.cur_grid_y)
					end
				end
			end)

			slot0.dir_btn = createImage(slot0.edit_quan_sp, PathTool.getResFrame("homeworld", "homeworld_1027"), 156, 303, cc.p(0.5, 0.5), true)

			slot0.dir_btn:setTouchEnabled(true)
			registerButtonEventListener(slot0.dir_btn, handler(slot0, slot0._onClickDirBtn), true)
			slot0.dir_btn:setName("guide_dir_btn_" .. slot0.data.bid)

			slot0.confirm_btn = createImage(slot0.edit_quan_sp, PathTool.getResFrame("homeworld", "homeworld_1028"), 240, 32, cc.p(0.5, 0.5), true)

			slot0.confirm_btn:setTouchEnabled(true)
			registerButtonEventListener(slot0.confirm_btn, handler(slot0, slot0._onClickConfirmBtn), true)
			slot0.confirm_btn:setName("guide_confirm_btn_" .. slot0.data.bid)

			slot0.reset_btn = createImage(slot0.edit_quan_sp, PathTool.getResFrame("homeworld", "homeworld_1061"), 296, 203, cc.p(0.5, 0.5), true)

			slot0.reset_btn:setTouchEnabled(true)
			registerButtonEventListener(slot0.reset_btn, handler(slot0, slot0._onClickResetBtn), true)

			slot0.check_btn = createImage(slot0.edit_quan_sp, PathTool.getResFrame("homeworld", "homeworld_1029"), 74, 32, cc.p(0.5, 0.5), true)

			slot0.check_btn:setTouchEnabled(true)
			registerButtonEventListener(slot0.check_btn, handler(slot0, slot0._onClickCheckBtn), true)

			slot0.delete_btn = createImage(slot0.edit_quan_sp, PathTool.getResFrame("homeworld", "homeworld_1030"), 16, 203, cc.p(0.5, 0.5), true)

			slot0.delete_btn:setTouchEnabled(true)
			registerButtonEventListener(slot0.delete_btn, handler(slot0, slot0._onClickDeleteBtn), true)
		end

		slot2 = slot0.edit_quan_sp:getContentSize()

		if slot0.config.type == HomeworldConst.Unit_Type.WallAcc then
			slot0.dir_btn:setVisible(false)
			slot0.confirm_btn:setPosition(cc.p(slot2.width - 16, slot2.height * 0.5))
			slot0.reset_btn:setPosition(cc.p(slot2.width * 0.5, slot2.height - 16))
			slot0.check_btn:setPosition(cc.p(slot2.width * 0.5, 16))
			slot0.delete_btn:setPosition(cc.p(16, slot2.height * 0.5))
		else
			slot0.dir_btn:setVisible(true)
			slot0.confirm_btn:setPosition(cc.p(240, 32))
			slot0.reset_btn:setPosition(cc.p(296, 203))
			slot0.check_btn:setPosition(cc.p(74, 32))
			slot0.delete_btn:setPosition(cc.p(16, 203))
		end

		slot0.default_grid_x = slot0.cur_grid_x
		slot0.default_grid_y = slot0.cur_grid_y
		slot0.default_dir = slot0.cur_dir

		slot0:updateRestBtnStatus()
		slot0.edit_quan_sp:setVisible(true)
		slot0.edit_touch_layer:setVisible(true)
		slot0:showEditAction(true)

		if slot0.callback then
			slot0.callback(2)
		end

		slot0:setLocalZOrder(99, true)
	else
		slot0.default_grid_x = nil
		slot0.default_grid_y = nil
		slot0.default_dir = nil

		slot0:updateRestBtnStatus()

		if slot0.edit_quan_sp then
			slot0.edit_quan_sp:setVisible(false)
		end

		if slot0.edit_touch_layer then
			slot0.edit_touch_layer:setVisible(false)
		end

		slot0:showEditAction(false)
	end
end

function HomeworldFurniture.showEditAction(slot0, slot1)
	if slot1 then
		if slot0.edit_quan_sp then
			slot2 = uv0:getHomeSceneScaleVal()

			slot0.edit_quan_sp:setScale(0.5)
			slot0.edit_quan_sp:setOpacity(0)
			slot0.edit_quan_sp:stopAllActions()
			slot0.edit_quan_sp:runAction(cc.Spawn:create(cc.FadeIn:create(0.2), cc.Sequence:create(cc.ScaleTo:create(0.1, 1 / slot2 + 0.2), cc.ScaleTo:create(0.1, 1 / slot2))))
		end

		if slot0.furniture_sp then
			slot0.furniture_sp:setScale(0.85)
			slot0.furniture_sp:stopAllActions()

			slot2 = cc.ScaleTo:create(0.1, 1.2, 1.2)
			slot3 = cc.ScaleTo:create(0.1, 1, 1)

			if slot0.cur_dir == HomeworldConst.Dir_Type.Right then
				slot0.furniture_sp:setScaleX(-0.85)

				slot2 = cc.ScaleTo:create(0.1, -1.2, 1.2)
				slot3 = cc.ScaleTo:create(0.1, -1, 1)
			end

			slot0.furniture_sp:runAction(cc.Sequence:create(slot2, slot3))
		end
	else
		if slot0.edit_quan_sp then
			slot0.edit_quan_sp:stopAllActions()
		end

		if slot0.furniture_sp then
			slot0.furniture_sp:stopAllActions()
		end
	end
end

function HomeworldFurniture.checkIsCanChangDir(slot0, slot1)
	slot2 = true

	for slot6, slot7 in pairs(slot1) do
		slot8, slot9 = HomeTile.tileOffset(slot0.cur_grid_x, slot0.cur_grid_y, slot7[1], slot7[2])

		if not uv0:checkGridIsCanWalk(slot8, slot9, slot0.grid_type) then
			slot2 = false

			break
		end
	end

	return slot2
end

function HomeworldFurniture._onClickDirBtn(slot0)
	if not slot0.config or not slot0.furniture_sp then
		return
	end

	slot1 = true

	if slot0:checkIsCarpet() then
		uv0:updateOccupyGridList({
			{
				HomeworldConst.Scene_Unit_Type.Furniture,
				slot0.data.id
			},
			{
				HomeworldConst.Scene_Unit_Type.Role
			}
		}, 2)
	else
		uv0:updateOccupyGridList({
			{
				HomeworldConst.Scene_Unit_Type.Furniture,
				slot0.data.id
			},
			{
				HomeworldConst.Scene_Unit_Type.Role
			}
		}, 1)
	end

	if slot0.cur_dir == HomeworldConst.Dir_Type.Left then
		if slot0:checkIsCanChangDir(slot0.config.tile_list_2 or {}) then
			slot0.cur_dir = HomeworldConst.Dir_Type.Right
			slot0.range_list = slot0.config.tile_list_2 or {}

			slot0.furniture_sp:setScaleX(-1)
		else
			slot1 = false
		end
	elseif slot0:checkIsCanChangDir(slot0.config.tile_list_1 or {}) then
		slot0.cur_dir = HomeworldConst.Dir_Type.Left
		slot0.range_list = slot0.config.tile_list_1 or {}

		slot0.furniture_sp:setScaleX(1)
	else
		slot1 = false
	end

	if slot1 then
		slot0:adjustPosition(slot0.cur_grid_x, slot0.cur_grid_y)
		slot0:showGridList()
		slot0:updateRestBtnStatus()
	else
		message(TI18N("当前位置无法旋转方向"))
	end
end

function HomeworldFurniture.changeFurnitureDir(slot0)
	if not slot0.config or not slot0.furniture_sp then
		return
	end

	if slot0.cur_dir == HomeworldConst.Dir_Type.Left then
		slot0.cur_dir = HomeworldConst.Dir_Type.Right
		slot0.range_list = slot0.config.tile_list_2 or {}

		slot0.furniture_sp:setScaleX(-1)
	else
		slot0.cur_dir = HomeworldConst.Dir_Type.Left
		slot0.range_list = slot0.config.tile_list_1 or {}

		slot0.furniture_sp:setScaleX(1)
	end

	slot0:adjustPosition(slot0.cur_grid_x, slot0.cur_grid_y)
	slot0:showGridList()
	slot0:updateRestBtnStatus()
end

function HomeworldFurniture._onClickConfirmBtn(slot0)
	slot0:updateEditStatus(false)

	if slot0.callback then
		slot0.callback(4, false)
	end
end

function HomeworldFurniture._onClickResetBtn(slot0)
	if slot0.default_grid_x and slot0.default_grid_y and slot0.default_dir and (slot0.default_grid_x ~= slot0.cur_grid_x or slot0.default_grid_y ~= slot0.cur_grid_y or slot0.default_dir ~= slot0.cur_dir) then
		slot0.cur_grid_x = slot0.default_grid_x
		slot0.cur_grid_y = slot0.default_grid_y

		slot0.data:updateIndex(HomeTile.tileIndex(slot0.cur_grid_x, slot0.cur_grid_y))
		slot0:adjustPosition(slot0.cur_grid_x, slot0.cur_grid_y)

		if slot0.default_dir ~= slot0.cur_dir then
			if slot0.config and slot0.config.type == HomeworldConst.Unit_Type.WallAcc then
				slot0:checkWallUnitNeedOverturn(slot0.cur_grid_x)
			else
				slot0:changeFurnitureDir()
			end
		end

		slot0:updateGridStatus(slot0.cur_grid_x, slot0.cur_grid_y)
		slot0:updateRestBtnStatus()
	else
		message(TI18N("这个家具的位置和方向未发生变化，无法撤销操作"))
	end
end

function HomeworldFurniture.updateRestBtnStatus(slot0)
	if slot0.default_grid_x and slot0.default_grid_y and slot0.default_dir and (slot0.default_grid_x ~= slot0.cur_grid_x or slot0.default_grid_y ~= slot0.cur_grid_y or slot0.default_dir ~= slot0.cur_dir) then
		setChildUnEnabled(false, slot0.reset_btn)
	else
		setChildUnEnabled(true, slot0.reset_btn)
	end
end

function HomeworldFurniture._onClickCheckBtn(slot0)
	if slot0.config then
		uv0:openFurnitureInfoWindow(true, slot0.config.bid)
	end
end

function HomeworldFurniture._onClickDeleteBtn(slot0)
	if slot0.data then
		slot0.callback(3, slot0.data.id)
	end

	if slot0.callback then
		slot0.callback(4, false)
	end

	GlobalEvent:getInstance():Fire(HomeworldEvent.Discharge_Furniture_Event, slot0.config.bid)
end

function HomeworldFurniture.showGridList(slot0)
	for slot4, slot5 in pairs(slot0.grid_list) do
		slot5.grid:setVisible(false)

		slot5.status = false
		slot5.range = nil
	end

	if not slot0.config or not slot0.data then
		return
	end

	slot5 = true
	slot1 = slot0:getGridResByTypeAndStatus(slot0.config.type, slot5)

	for slot5, slot6 in pairs(slot0.range_list) do
		if not slot0.grid_list[slot5] then
			slot0.grid_list[slot5] = {
				grid = createSprite(slot1, nil, nil, slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST),
				grid_res = slot1,
				scale_x = 1
			}
		else
			loadSpriteTexture(slot7.grid, slot1, LOADTEXT_TYPE_PLIST)
		end

		slot7.grid:setVisible(true)

		slot7.status = true
		slot7.range = slot6
		slot7.scale_x = 1

		if slot0.grid_type == HOME_TILE_TYPE_R_WALL then
			slot7.scale_x = -1
		end

		slot7.grid:setScaleX(slot7.scale_x)

		slot8, slot9 = HomeTile.tileOffset(slot0.cur_grid_x, slot0.cur_grid_y, slot6[1], slot6[2])
		slot10, slot11 = HomeTile.toPixel(slot0.grid_type, slot8, slot9)

		if slot0.parent.pos_node then
			slot12 = slot0:convertPosToNodePos(slot10, slot11)

			slot7.grid:setPosition(slot12)

			slot7.node_pos = slot12
		end
	end
end

function HomeworldFurniture.updateGridStatus(slot0, slot1, slot2)
	if not slot0.config then
		return
	end

	slot0.last_grid_can_use = true

	for slot6, slot7 in pairs(slot0.grid_list) do
		if slot7.status and slot7.range then
			slot8, slot9 = HomeTile.tileOffset(slot1, slot2, slot7.range[1], slot7.range[2])
			slot10 = true

			if not uv0:checkGridIsCanWalk(slot8, slot9, slot0.grid_type) then
				slot10 = false
				slot0.last_grid_can_use = false
			end

			slot11, slot12 = HomeTile.toPixel(slot0.grid_type, slot8, slot9)
			slot13 = slot0:convertPosToNodePos(slot11, slot12)

			if not slot7.node_pos or slot7.node_pos.x ~= slot13.x or slot7.node_pos.y ~= slot13.y then
				slot7.grid:setPosition(slot13)

				slot7.node_pos = slot13
			end

			slot14 = slot0:getGridResByTypeAndStatus(slot0.config.type, slot10)

			if not slot7.grid_res or slot7.grid_res ~= slot14 then
				loadSpriteTexture(slot7.grid, slot14, LOADTEXT_TYPE_PLIST)

				slot7.grid_res = slot14
			end

			slot15 = 1

			if slot0.grid_type == HOME_TILE_TYPE_R_WALL then
				slot15 = -1
			end

			if not slot7.scale_x or slot7.scale_x ~= slot15 then
				slot7.grid:setScaleX(slot15)

				slot7.scale_x = slot15
			end
		end
	end
end

function HomeworldFurniture.convertPosToNodePos(slot0, slot1, slot2)
	if slot0.parent.pos_node then
		slot0.parent.pos_node:setPosition(cc.p(slot1, slot2))

		return slot0.root_wnd:convertToNodeSpace(slot0.parent.pos_node:convertToWorldSpace(cc.p(0, 0)))
	end
end

function HomeworldFurniture.getGridResByTypeAndStatus(slot0, slot1, slot2)
	if slot1 == HomeworldConst.Unit_Type.WallAcc then
		if slot2 then
			return PathTool.getResFrame("homeworld", "homeworld_1026")
		else
			return PathTool.getResFrame("homeworld", "homeworld_1025")
		end
	elseif slot2 then
		return PathTool.getResFrame("homeworld", "homeworld_1024")
	else
		return PathTool.getResFrame("homeworld", "homeworld_1023")
	end
end

function HomeworldFurniture.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.config = slot1.config
	slot0.cur_dir = slot1.dir or slot1.config.dir or HomeworldConst.Dir_Type.Left

	if slot0.config.type ~= HomeworldConst.Unit_Type.WallAcc then
		slot0.grid_type = HOME_TILE_TYPE_LAND
	elseif slot0.cur_dir == HomeworldConst.Dir_Type.Left then
		slot0.grid_type = HOME_TILE_TYPE_L_WALL
	elseif slot0.cur_dir == HomeworldConst.Dir_Type.Right then
		slot0.grid_type = HOME_TILE_TYPE_R_WALL
	end

	slot0.root_wnd:setName("guide_furniture_" .. slot1.bid)
	slot0:setTranslucenceState(false)

	slot3 = PathTool.getFurnitureSceneRes(slot0.config.res)

	if not slot0.furniture_sp then
		slot0.furniture_sp = createSprite(nil, 0, 0, slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE, 1)
	end

	if slot0.cur_dir == HomeworldConst.Dir_Type.Left then
		slot0.range_list = slot0.config.tile_list_1 or {}

		slot0.furniture_sp:setScaleX(1)
	elseif slot0.cur_dir == HomeworldConst.Dir_Type.Right then
		slot0.range_list = slot0.config.tile_list_2 or {}

		slot0.furniture_sp:setScaleX(-1)
	end

	if slot0.data and slot0.data.index and slot0.config then
		slot0.cur_grid_x, slot0.cur_grid_y = HomeTile.indexTile(slot0.data.index)

		slot0:adjustPosition()
	end

	if slot3 then
		if slot0.unit_load then
			slot0.unit_load:DeleteMe()

			slot0.unit_load = nil
		end

		slot0.unit_load = ResourcesLoad.New()

		slot0.unit_load:addDownloadList(slot3, ResourcesType.single, function ()
			loadSpriteTexture(uv0.furniture_sp, uv1, LOADTEXT_TYPE)

			uv0.size = uv0.furniture_sp:getContentSize()

			uv0:initSizeAndPos()
		end)
	end

	slot0:changeCanEditStatus(slot2)
end

function HomeworldFurniture.initSizeAndPos(slot0)
	slot0.root_wnd:setContentSize(slot0.size)
	slot0.furniture_sp:setPosition(cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5))

	if slot0.edit_quan_sp then
		slot0.edit_quan_sp:setPosition(cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5))
	end

	if slot0.edit_status then
		slot0:updateGridStatus(slot0.cur_grid_x, slot0.cur_grid_y)
	end
end

function HomeworldFurniture.adjustPosition(slot0, slot1, slot2)
	slot2 = slot2 or slot0.cur_grid_y

	if (slot1 or slot0.cur_grid_x) and slot2 then
		slot3 = {}

		if slot0.cur_dir == HomeworldConst.Dir_Type.Left then
			slot3 = slot0.config.offset_1 or {}
		elseif slot0.cur_dir == HomeworldConst.Dir_Type.Right then
			slot3 = slot0.config.offset_2 or {}
		end

		slot4, slot5 = HomeTile.tileRangePixel2(slot0.grid_type, slot1, slot2, slot0.range_list)

		slot0.root_wnd:setPosition(cc.p(slot4 + (slot3[1] or 0), slot5 + (slot3[2] or 0)))
	end
end

function HomeworldFurniture.setVisible(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end
end

function HomeworldFurniture.suspendAllActions(slot0)
	slot0:updateEditStatus(false)
	slot0:changeCanEditStatus(false)
end

function HomeworldFurniture.getFurnitureBid(slot0)
	if slot0.data then
		return slot0.data.bid
	end
end

function HomeworldFurniture.getFurnitureId(slot0)
	if slot0.data then
		return slot0.data.id
	end
end

function HomeworldFurniture.getData(slot0)
	return slot0.data
end

function HomeworldFurniture.getUnitType(slot0)
	return HomeworldConst.Scene_Unit_Type.Furniture
end

function HomeworldFurniture.getFurnitureType(slot0)
	if slot0.config then
		return slot0.config.type
	end
end

function HomeworldFurniture.getOccupyGridList(slot0)
	slot1 = {}

	if slot0.cur_grid_x and slot0.cur_grid_y and slot0.range_list then
		slot1 = HomeTile.tilesOffset(slot0.cur_grid_x, slot0.cur_grid_y, slot0.range_list)
	end

	return slot1
end

function HomeworldFurniture.getOccupyGridNum(slot0)
	if slot0.range_list then
		return #slot0.range_list
	end

	return 0
end

function HomeworldFurniture.getCurGridPos(slot0)
	return slot0.cur_grid_x, slot0.cur_grid_y
end

function HomeworldFurniture.getBottomGridPos(slot0)
	slot1 = slot0.cur_grid_x
	slot2 = slot0.cur_grid_y

	if slot0.range_list then
		for slot6, slot7 in pairs(slot0.range_list) do
			slot1, slot9 = HomeTile.tileOffset(slot0.cur_grid_x, slot0.cur_grid_y, slot7[1], slot7[2])

			if slot9 < slot2 then
				slot2 = slot9
			end
		end
	end

	return slot1, slot2
end

function HomeworldFurniture.getFurnitureBaseData(slot0)
	if not slot0.config then
		return {}
	end

	return {
		bid = slot0.config.bid,
		index = HomeTile.tileIndex(slot0.cur_grid_x, slot0.cur_grid_y),
		dir = slot0.cur_dir
	}
end

function HomeworldFurniture.checkIsCarpet(slot0)
	if slot0.config and slot0.config.type == HomeworldConst.Unit_Type.Carpet then
		return true
	end

	return false
end

function HomeworldFurniture.setTranslucenceState(slot0, slot1)
	if not slot0.furniture_sp then
		return
	end

	if slot1 and not slot0.edit_status then
		slot0.furniture_sp:setOpacity(150)
	else
		slot0.furniture_sp:setOpacity(255)
	end
end

function HomeworldFurniture.__delete(slot0)
	if slot0.unit_load then
		slot0.unit_load:DeleteMe()

		slot0.unit_load = nil
	end

	if slot0.root_wnd then
		slot0.root_wnd:removeAllChildren()
		slot0.root_wnd:removeFromParent()
	end
end
