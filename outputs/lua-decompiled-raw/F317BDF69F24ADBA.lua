GodBattleScene = GodBattleScene or BaseClass(BaseView)
GodBattleScene.layer = {
	slayer = "slayer",
	blayer = "blayer"
}
slot0 = RoleController:getInstance():getRoleVo()
slot2 = GodbattleController:getInstance():getModel()

function GodBattleScene.__init(slot0, slot1)
	slot0.is_full_screen = true
	slot0.is_godbattle_scene = true
	slot0.view_tag = ViewMgrTag.EFFECT_TAG
	slot0.win_type = WinType.Full
	slot0.index = 2
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("godbattle", "godbattle"),
			type = ResourcesType.plist
		}
	}

	slot0:initConfig()
end

function GodBattleScene.initConfig(slot0)
	slot0.map_size = cc.size(2560, 1280)
	slot0.blayer_size = cc.size(2560, 1280)
	slot0.slayer_size = cc.size(2560, 1280)
	slot0.step = 0
	slot0.add_map_interval = 2
	slot0.add_rolt_interval = 9
	slot0.add_guard_interval = 11
	slot0.role_data_list = {}
	slot0.role_list = {}
	slot0.guard_data_list = {}
	slot0.guard_list = {}
	slot0.blayer_sp = -0.2
end

function GodBattleScene.createRootWnd(slot0)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))

	slot0.map_layer = ccui.Layout:create()

	slot0.map_layer:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.map_layer:setContentSize(cc.size(SCREEN_WIDTH, display.height))
	slot0.map_layer:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)
	slot0.root_wnd:addChild(slot0.map_layer)

	slot0.main_scene_layer = ccui.Layout:create()

	slot0.main_scene_layer:setAnchorPoint(cc.p(0, 0))
	slot0.main_scene_layer:setContentSize(slot0.map_size)
	slot0.main_scene_layer:setPosition(0, 0)
	slot0.map_layer:addChild(slot0.main_scene_layer)

	slot0.map_smalllayer = ccui.Widget:create()

	slot0.map_smalllayer:setAnchorPoint(cc.p(0, 0))
	slot0.main_scene_layer:addChild(slot0.map_smalllayer, 1)

	slot0.map_blayer = ccui.Widget:create()

	slot0.map_blayer:setAnchorPoint(cc.p(0, 1))
	slot0.map_blayer:setPositionY(slot0.map_size.height)
	slot0.map_blayer:setContentSize(slot0.map_size)
	slot0.main_scene_layer:addChild(slot0.map_blayer, 2)

	slot0.map_slayer = ccui.Widget:create()

	slot0.map_slayer:setAnchorPoint(cc.p(0, 0))
	slot0.map_slayer:setContentSize(slot0.map_size)
	slot0.main_scene_layer:addChild(slot0.map_slayer, 3)

	slot0.role_layer = ccui.Widget:create()

	slot0.role_layer:setAnchorPoint(cc.p(0, 0))
	slot0.role_layer:setContentSize(slot0.map_size)
	slot0.main_scene_layer:addChild(slot0.role_layer, 5)

	slot0.ui_layer = ccui.Widget:create()

	slot0.ui_layer:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.ui_layer:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.ui_layer:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)
	slot0.root_wnd:addChild(slot0.ui_layer, 1)
end

function GodBattleScene.register_event(slot0)
	if slot0.add_role_event == nil then
		slot0.add_role_event = GlobalEvent:getInstance():Bind(GodbattleEvent.AddRoleDataEvent, function (slot0, slot1)
			uv0:updateRoleListData(slot0, slot1)
		end)
	end

	if slot0.move_role_event == nil then
		slot0.move_role_event = GlobalEvent:getInstance():Bind(GodbattleEvent.MoveRoleEvent, function (slot0)
			uv0:updateRoleMoveData(slot0)
		end)
	end

	if slot0.add_guard_event == nil then
		slot0.add_guard_event = GlobalEvent:getInstance():Bind(GodbattleEvent.AddGuardDataEvent, function (slot0, slot1)
			uv0:updateGuardListData(slot0, slot1)
		end)
	end
end

function GodBattleScene.openRootWnd(slot0)
	RenderMgr:getInstance():add(slot0)
	slot0:renderSmallPic()
	slot0:analysisMapTile()

	if slot0.main_ui == nil then
		slot0.main_ui = GodBattleMainUI.new(slot0.ui_layer)
	end

	if not tolua.isnull(slot0.main_ui) then
		slot0.main_ui:open()
		slot0.main_ui:setVisibleStatus(true)
	end

	RenderMgr:getInstance():doNextFrame(function ()
		uv0:requestGodBattleRoleList()
	end)
end

function GodBattleScene.update(slot0)
	slot0.step = slot0.step + 1

	if slot0.step % slot0.add_map_interval == 0 then
		slot0:quequeAddMapTile()
	end

	slot0:addMapTile()

	if slot0.step % slot0.add_rolt_interval == 0 then
		slot0:queueAddRole()
	end

	if slot0.step % slot0.add_guard_interval == 0 then
		slot0:queueAddGuard()
	end

	for slot4, slot5 in pairs(slot0.role_list) do
		if slot5 and slot5.vo then
			slot5:update()

			if uv0 ~= nil and getNorKey(slot5.vo.rid, slot5.vo.srv_id) == getNorKey(uv0.rid, uv0.srv_id) then
				slot0:updateCamera(slot5:getWorldPos())
			end
		end
	end
end

function GodBattleScene.close_callback(slot0)
	RenderMgr:getInstance():remove(slot0)

	slot4 = false

	uv0:openGodBattleMainWindow(slot4)

	for slot4, slot5 in pairs(slot0.map_pic_cache) do
		slot5:DeleteMe()
	end

	slot0.map_pic_cache = nil

	if slot0.add_role_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.add_role_event)

		slot0.add_role_event = nil
	end

	if slot0.move_role_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.move_role_event)

		slot0.move_role_event = nil
	end

	if slot0.add_guard_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.add_guard_event)

		slot0.add_guard_event = nil
	end

	if slot0.main_ui then
		slot0.main_ui:DeleteMe()
	end

	slot0.main_ui = nil

	for slot4, slot5 in pairs(slot0.role_list) do
		slot5:DeleteMe()
	end

	slot0.role_list = nil

	for slot4, slot5 in pairs(slot0.guard_list) do
		slot5:DeleteMe()
	end

	slot0.guard_list = nil

	uv0:clearGodBattleData()
end

function GodBattleScene.renderSmallPic(slot0)
	slot2 = nil

	if PathTool.isFileExist("resource/godbattle/preview.jpg") then
		slot2 = slot1
	end

	if slot2 then
		slot3 = display.newSprite(slot2)

		slot0.map_smalllayer:addChild(slot3)
		slot3:setAnchorPoint(cc.p(0.5, 0.5))
		slot3:setPosition(slot0.map_size.width / 2, slot0.map_size.height / 2)

		slot4 = slot3:getBoundingBox()

		slot3:setScale(slot0.map_size.width / slot4.width, slot0.map_size.height / slot4.height)
	end
end

function GodBattleScene.analysisMapTile(slot0)
	slot0.map_pic_cache = {}
	slot0.map_ren_cache = {}

	slot0:renderLayer(slot0.layer.slayer, slot0.slayer_size.width, slot0.slayer_size.height)
end

function GodBattleScene.renderLayer(slot0, slot1, slot2, slot3)
	slot4 = 0
	slot5 = 0

	while slot4 < slot2 do
		slot5 = 0

		while slot3 > slot5 do
			slot0:addFloorSprite(slot1, slot2, slot3, slot4, slot5)

			slot5 = slot5 + MapUtil.c_h
		end

		slot4 = slot4 + MapUtil.c_w
	end
end

function GodBattleScene.addFloorSprite(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = cc.p(0, 0)

	if slot1 == slot0.layer.blayer then
		slot6 = cc.p(0, 1)
	end

	slot7, slot8 = slot0:getScenePicByPos(slot2, slot3, slot4, slot5)
	slot9, slot10 = slot0:getPicRes(slot1, slot7, slot8)

	table.insert(slot0.map_ren_cache, {
		slot1,
		slot9,
		slot10,
		slot4,
		slot5,
		slot6,
		0
	})
end

function GodBattleScene.getScenePicByPos(slot0, slot1, slot2, slot3, slot4)
	slot5, slot6 = math.modf(slot3 / slot1)
	slot7, slot8 = math.modf(slot4 / slot2)

	return math.floor(math.ceil(slot6 * slot1) / MapUtil.c_w), math.floor(math.ceil(slot8 * slot2) / MapUtil.c_h)
end

function GodBattleScene.getPicRes(slot0, slot1, slot2, slot3)
	slot4, slot5 = nil
	slot5 = "jpg"

	if not PathTool.isFileExist(string.format("scene/godbattle/%s/%d_%d.jpg", slot1, slot2, slot3)) then
		slot5 = "png"
		slot4 = string.format("scene/godbattle/%s/%d_%d.png", slot1, slot2, slot3)
	end

	return slot4, slot5
end

function GodBattleScene.quequeAddMapTile(slot0)
	if slot0.map_ren_cache == nil or next(slot0.map_ren_cache) == nil then
		return
	end

	slot1 = table.remove(slot0.map_ren_cache, 1)

	if slot0.map_pic_cache[getNorKey(slot1[1], slot1[4], slot1[5])] ~= nil then
		return
	end

	if slot1 ~= nil and #slot1 == 7 then
		slot3 = slot0["map_" .. slot1[1]]
		slot5 = slot1[2]
		slot6 = slot1[4]
		slot7 = slot1[5]
		slot8 = false

		if slot1[1] == slot0.layer.blayer then
			slot7 = slot0.blayer_size.height - y
			slot8 = true
		end

		slot0.map_pic_cache[slot2] = MapTile.New(cc.p(slot6, slot7), slot5, slot4, false, false, slot3, slot8)

		slot0.map_pic_cache[slot2]:retain()
	end
end

function GodBattleScene.addMapTile(slot0)
	for slot4, slot5 in pairs(slot0.map_pic_cache) do
		if not slot5:isAdded() then
			slot5:addChildOnParent()
		end
	end
end

function GodBattleScene.queueAddRole(slot0)
	if slot0.role_data_list == nil or next(slot0.role_data_list) == nil then
		return
	end

	if table.remove(slot0.role_data_list, 1) ~= nil then
		slot0:addRole(slot1)
	end
end

function GodBattleScene.addRole(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	if slot0.role_list[getNorKey(slot1.rid, slot1.srv_id)] ~= nil then
		return
	end

	if Config.ZsWarData.data_pos[slot1.pos_x or 1][slot1.pos_y or 1] ~= nil then
		slot1.x = slot4[1]
		slot1.y = slot4[2]
	end

	if slot1.camp == GodBattleConstants.camp.god then
		slot1.name_bg = PathTool.getResFrame("godbattle", "godbattle_13")
	else
		slot1.name_bg = PathTool.getResFrame("godbattle", "godbattle_12")
	end

	slot2 = slot2 or false
	slot5 = Player.New(slot2)

	slot5:setParentWnd(slot0.role_layer)
	slot5:setVo(slot1)
	slot5:initSpine()
	slot5:playActionOnce(PlayerAction.battle_stand)

	slot0.role_list[slot3] = slot5

	if slot2 == true then
		slot0:updateCamera(slot5:getWorldPos(), true)

		if slot0.map_ren_cache == nil or next(slot0.map_ren_cache) == nil then
			return
		end

		for slot10, slot11 in pairs(slot0.map_ren_cache) do
			slot11[7] = math.abs(slot11[4] - slot6.x) + math.abs(slot11[5] - slot6.y)
		end

		table.sort(slot0.map_ren_cache, function (slot0, slot1)
			return slot0[7] < slot1[7]
		end)
	end
end

function GodBattleScene.queueAddGuard(slot0)
	if slot0.guard_data_list == nil or next(slot0.guard_data_list) == nil then
		return
	end

	if table.remove(slot0.guard_data_list, 1) ~= nil then
		slot0:addGuard(slot1)
	end
end

function GodBattleScene.addGuard(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.guard_list[slot1.id] ~= nil then
		return
	end

	if Config.ZsWarData.data_pos[slot1.pos_x or 1][slot1.pos_y or 1] ~= nil then
		slot1.x = slot2[1]
		slot1.y = slot2[2]
	end

	slot3 = Npc.New()

	slot3:setModelScale(1.5)
	slot3:setParentWnd(slot0.role_layer)
	slot3:setVo(slot1)
	slot3:initSpine()
	slot3:playActionOnce(PlayerAction.battle_stand)

	slot0.guard_list[slot1.id] = slot3
end

function GodBattleScene.removeRole(slot0, slot1, slot2)
	if slot0.role_list[getNorKey(slot1, slot2)] ~= nil then
		slot0.role_list[getNorKey(slot1, slot2)]:DeleteMe()
	end

	slot6 = slot1
	slot7 = slot2
	slot0.role_list[getNorKey(slot6, slot7)] = nil

	for slot6, slot7 in ipairs(slot0.role_data_list) do
		if getNorKey(slot7.rid, slot7.srv_id) == getNorKey(slot1, slot2) then
			table.remove(slot0.role_data_list, slot6)
		end
	end
end

function GodBattleScene.updateCamera(slot0, slot1, slot2)
	slot3, slot4 = slot0:getCameraPos(slot1)

	if slot0.scene_x == slot3 then
		return
	end

	slot0.scene_x = slot3

	slot0.main_scene_layer:setPositionX(slot0.scene_x)
	slot0.map_blayer:setPositionX(slot0.scene_x * slot0.blayer_sp)
end

function GodBattleScene.getCameraPos(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = 0
	slot4 = ViewManager:getInstance():getBaseLayout()
	slot8 = (display.getTop(slot4) - display.getBottom(slot4)) * 0.5

	return slot1.x <= (display.getRight(slot4) - display.getLeft(slot4)) * 0.5 and 0 or slot1.x >= slot0.map_size.width - slot7 and slot5 - slot0.map_size.width or slot7 - slot1.x, 0
end

function GodBattleScene.updateGuardListData(slot0, slot1, slot2)
	if slot2 == nil or next(slot2) == nil then
		return
	end

	slot3 = nil

	if slot1 == GodBattleConstants.update_type.update then
		for slot7, slot8 in ipairs(slot2) do
			if slot0.guard_list[slot8.id] ~= nil then
				if slot3.DeleteMe then
					slot3:DeleteMe()
				end

				slot0.guard_list[slot8.id] = nil
			else
				for slot12, slot13 in ipairs(slot0.guard_data_list) do
					if slot13.id == slot8.id then
						table.remove(slot0.guard_data_list, slot12)

						break
					end
				end
			end
		end
	elseif slot1 == 0 then
		for slot7, slot8 in ipairs(slot2) do
			table.insert(slot0.guard_data_list, slot8)
		end
	end
end

function GodBattleScene.updateRoleListData(slot0, slot1, slot2)
	if slot2 == nil or next(slot2) == nil then
		return
	end

	slot3 = nil

	if slot1 == GodBattleConstants.update_type.update then
		for slot7, slot8 in ipairs(slot2) do
			slot3 = slot0.role_list[getNorKey(slot8.rid, slot8.srv_id)]

			if slot8.status == GodBattleConstants.role_status.off_line then
				if slot3 ~= nil then
					if slot3.DeleteMe then
						slot3:DeleteMe()
					end

					slot0.role_list[getNorKey(slot8.rid, slot8.srv_id)] = nil
				end
			elseif slot3 == nil then
				table.insert(slot0.role_data_list, slot8)
			else
				slot3:stopMove()

				if Config.ZsWarData.data_pos[slot3.vo.pos_x] and Config.ZsWarData.data_pos[slot3.vo.pos_x][slot3.vo.pos_y] ~= nil and Config.ZsWarData.data_pos[slot3.vo.pos_x][slot3.vo.pos_y] ~= nil and (slot3.vo.x ~= cc.p(slot9[1] or slot3.vo.x, slot9[2] or slot3.vo.y).x or slot3.vo.y ~= slot10.y) then
					slot3:setWorldPos(slot10)

					if getNorKey(slot8.rid, slot8.srv_id) == getNorKey(uv0.rid, uv0.srv_id) then
						slot0:updateCamera(slot10, true)
					end
				end
			end
		end
	elseif slot1 ~= GodBattleConstants.update_type.do_nil then
		for slot7, slot8 in ipairs(slot2) do
			if slot0.role_list[getNorKey(slot8.rid, slot8.srv_id)] == nil then
				if uv0 ~= nil and getNorKey(uv0.rid, uv0.srv_id) == getNorKey(slot8.rid, slot8.srv_id) then
					slot0:addRole(slot8, true)
				elseif slot8.status ~= GodBattleConstants.role_status.off_line then
					table.insert(slot0.role_data_list, slot8)
				end
			elseif slot1 == GodBattleConstants.update_type.total then
				slot0:updateRolePosData(slot10, slot8.pos_x, slot8.pos_y)
			end
		end
	end
end

function GodBattleScene.updateRoleMoveData(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot2 = nil

	for slot6, slot7 in ipairs(slot1) do
		if slot0.role_list[getNorKey(slot7.rid, slot7.srv_id)] ~= nil and slot2.vo and Config.ZsWarData.data_pos[slot2.vo.pos_x] and Config.ZsWarData.data_pos[slot2.vo.pos_x][slot2.vo.pos_y] ~= nil and Config.ZsWarData.data_pos[slot2.vo.pos_x][slot2.vo.pos_y] ~= nil then
			slot2:doMove(nil, cc.p(slot8[1] or slot2.vo.x, slot8[2] or slot2.vo.y))
		end
	end
end

function GodBattleScene.updateRolePosData(slot0, slot1, slot2, slot3)
	if slot1 == nil or slot1.vo == nil or slot2 == nil or slot3 == nil then
		return
	end

	if Config.ZsWarData.data_pos[slot2] and Config.ZsWarData.data_pos[slot2][slot3] ~= nil and Config.ZsWarData.data_pos[slot2][slot3] ~= nil then
		slot1:setWorldPos(cc.p(slot4[1] or slot1.vo.x, slot4[2] or slot1.vo.y))
	end
end
