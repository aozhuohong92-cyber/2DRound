BattleDramaMapWindows = BattleDramaMapWindows or BaseClass(BaseView)
slot1 = BattleDramaController:getInstance():getModel()
slot2 = string.format

function BattleDramaMapWindows.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.layout_name = "battledrama/battle_drama_map_windows"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battledrop", "battledrop"),
			type = ResourcesType.plist
		}
	}
end

function BattleDramaMapWindows.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1
	slot0.map_layout = slot1:getChildByName("map_layout")
	slot0.pos_label = slot1:getChildByName("pos_label")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.btn_world = slot1:getChildByName("btn_world")
	slot0.btn_rule = slot1:getChildByName("btn_rule")
	slot0.rank_btn = slot1:getChildByName("rank_btn")

	slot0.rank_btn:getChildByName("name"):setString(TI18N("排行榜"))

	slot2 = 50
	slot3 = math.floor(display.width / slot2 / 2)

	for slot8 = 1, math.floor(display.height / slot2 / 2) do
		delayRun(slot0.background, 4 * slot8 / display.DEFAULT_FPS, function ()
			slot0 = cc.DrawNode:create()

			slot0:drawSegment(cc.p(0, uv0 * uv1), cc.p(display.width, uv0 * uv1), 2, {
				g = 0.19607843137254902,
				a = 1,
				b = 0.1843137254901961,
				r = 0.21176470588235294
			})
			slot0:setAnchorPoint(cc.p(0, 0.5))
			slot0:setPosition(cc.p(0, uv0 * uv1))
			uv2.background:addChild(slot0)
		end)
	end

	for slot8 = 1, slot3 do
		delayRun(slot0.background, 4 * slot8 / display.DEFAULT_FPS, function ()
			slot0 = cc.DrawNode:create()

			slot0:drawSegment(cc.p(uv0 * uv1, 0), cc.p(uv0 * uv1, display.height), 2, {
				g = 0.19607843137254902,
				a = 1,
				b = 0.1843137254901961,
				r = 0.21176470588235294
			})
			slot0:setAnchorPoint(cc.p(0.5, 0))
			slot0:setPosition(cc.p(uv0 * uv1, 0))
			uv2.background:addChild(slot0)
		end)
	end

	slot7 = display.getTop(slot1)

	slot0.btn_world:setPositionY(slot7 - 150)
	slot0.btn_rule:setPositionY(slot7 - 240)
	slot1:getChildByName("image_dir"):setPositionY(slot7 - 150)
	slot1:getChildByName("image_pos"):setPositionY(slot7 - 150)
	slot0.pos_label:setPositionY(slot7 - 150)
	slot0.rank_btn:setPositionY(slot7 - 150)

	if MainuiController:getInstance():getFucntionIconVoById(MainuiConst.icon.rank) then
		slot0.rank_btn:setVisible(true)
	else
		slot0.rank_btn:setVisible(false)
	end
end

function BattleDramaMapWindows.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.btn_world, handler(slot0, slot0._onClickWorldBtn), true)
	registerButtonEventListener(slot0.rank_btn, handler(slot0, slot0._onClickRankBtn), true, 1)
	registerButtonEventListener(slot0.btn_rule, handler(slot0, slot0._onClickRuleBtn), true, 1)

	function slot1(slot0, slot1)
		uv0.map_layout:stopAllActions()

		return true
	end

	function slot2(slot0, slot1)
		uv0.last_point = slot0:getDelta()

		uv0:moveMapLayer(uv0.last_point.x, uv0.last_point.y)
	end

	function slot3(slot0, slot1)
		if uv0.last_point then
			slot2 = uv0.map_layout:getPositionX() + uv0.last_point.x + 15

			if uv0.last_point.x < 0 then
				slot2 = uv0.map_layout:getPositionX() + uv0.last_point.x - 15
			end

			uv0.map_layout:stopAllActions()
			uv0.map_layout:runAction(cc.MoveTo:create(0.4, uv0:checkMapLayerPoint(slot2)))
		end
	end

	slot0:addGlobalEvent(Battle_dramaEvent.BattleDrama_Update_Data, function (slot0)
		if slot0.chapter_id ~= uv0.chapter_id then
			if uv0.root_wnd and not tolua.isnull(uv0.root_wnd) then
				uv0.drama_data = uv1:getDramaData()
				uv0.chapter_id = uv0.drama_data.chapter_id

				uv0:updateMapImage()
				uv0:updateMapPoint()
				uv0:updateBaseInfo()
			end
		elseif uv0.root_wnd and not tolua.isnull(uv0.root_wnd) then
			uv0:updateMapPointStatus()
		end
	end)
	slot0:addGlobalEvent(BattleEvent.MOVE_DRAMA_EVENT, function (slot0, slot1)
		if slot0 == BattleConst.Fight_Type.Darma and uv0.drama_data and MainuiController:getInstance():checkIsInDramaUIFight() then
			uv0.is_move_start = true

			uv0:moveMapTag(true)
			uv1:send13020()
		end
	end)
	slot0:addGlobalEvent(Battle_dramaEvent.UpdateDramaProgressDataEvent, function (slot0)
		uv0.progress_label:setString(uv1(TI18N("已超过<div fontcolor=5df660>%s</div>的玩家进度"), slot0 / 1000 .. "%"))
	end)
end

function BattleDramaMapWindows.moveMapLayer(slot0, slot1, slot2)
	slot3 = slot0:checkMapLayerPoint(slot0.map_layout:getPositionX() + slot1, slot0.map_layout:getPositionY() + slot2)

	slot0.map_layout:setPosition(slot3.x, slot3.y)
end

function BattleDramaMapWindows.checkMapLayerPoint(slot0, slot1, slot2)
	if slot1 > slot0.map_layout:getContentSize().width / 2 then
		slot1 = slot3.width / 2
	elseif slot1 < SCREEN_WIDTH - slot3.width / 2 then
		slot1 = SCREEN_WIDTH - slot3.width / 2
	end

	return cc.p(slot1, 640)
end

function BattleDramaMapWindows._onClickCloseBtn(slot0)
	uv0:openBattleDramaMapWindows(false)
end

function BattleDramaMapWindows._onClickRuleBtn(slot0)
	WorldmapController:getInstance():openWorldMapTipsWindow(true, slot0.chapter_id, WorldmapEvent.open_type.open_type_4)
end

function BattleDramaMapWindows._onClickRankBtn(slot0)
	RankController:getInstance():openRankView(true, RankConstant.RankType.drama)
end

function BattleDramaMapWindows._onClickWorldBtn(slot0)
	WorldmapController:getInstance():openWorldMapMainWindow(true)
end

function BattleDramaMapWindows.openRootWnd(slot0, slot1)
	slot0.drama_data = uv0:getDramaData()

	if slot0.drama_data and next(slot0.drama_data) ~= nil then
		slot0.chapter_id = slot1 or slot0.drama_data.chapter_id

		slot0:updateMapImage()
		slot0:updateMapPoint()
		slot0:updateBaseInfo()
		uv1:send13020()
	end
end

function BattleDramaMapWindows.updateBaseInfo(slot0)
	if slot0.drama_data and Config.DungeonData.data_drama_dungeon_info(slot0.drama_data.dun_id) then
		slot0.pos_label:setString(uv0(TI18N("当前关卡:%s"), slot1.name))
	end
end

function BattleDramaMapWindows.updateMapImage(slot0)
	if Config.DungeonData.data_drama_world_info[slot0.drama_data.mode] and slot1[slot0.chapter_id] then
		slot2 = slot1[slot0.chapter_id].map_id

		if slot0.resources_load then
			slot0.resources_load:DeleteMe()

			slot0.resources_load = nil
		end

		slot0.resources_load = createResourcesLoad(PathTool.getBattleSceneRes(uv0("%s/blayer/big_map", slot2), false), ResourcesType.single, function ()
			if not uv0.map_bg then
				uv0.map_bg = createSprite(uv1, 0, 0, uv0.map_layout, cc.p(0, 0), LOADTEXT_TYPE)
			else
				loadSpriteTexture(uv0.map_bg, uv1, LOADTEXT_TYPE)
			end

			uv0.map_layout:setContentSize(uv0.map_bg:getContentSize())
		end, slot0.resources_load)
	end
end

function BattleDramaMapWindows.getMapScale(slot0)
	slot1 = 1

	if slot0.xxx_map_id == nil and Config.DungeonData.data_drama_world_info[slot0.drama_data.mode] and slot2[slot0.chapter_id] then
		slot0.xxx_map_id = slot2[slot0.chapter_id].map_id
	end

	if slot0.xxx_map_id == 10008 then
		slot1 = 0.66
	end

	if slot0.xxx_map_id == 10006 then
		slot1 = 0.66
	end

	if slot0.xxx_map_id == 10004 then
		slot1 = 0.71
	end

	if slot0.xxx_map_id == 10003 then
		slot1 = 0.66
	end

	if slot0.xxx_map_id == 10002 then
		slot1 = 0.66
	end

	return slot1
end

function BattleDramaMapWindows.updateMapPoint(slot0)
	if slot0.main_point_list and next(slot0.main_point_list or {}) ~= nil then
		for slot4, slot5 in pairs(slot0.main_point_list) do
			if slot5 then
				slot5:clearInfo()
				slot5:DeleteMe()
			end
		end
	end

	slot0.main_point_list = {}

	if uv0:getInitDungeonList() then
		slot2 = nil

		for slot6, slot7 in ipairs(slot1) do
			delayRun(slot0.main_container, 4 * slot6 / display.DEFAULT_FPS, function ()
				if not uv0.main_point_list[uv1.info_data.id] then
					uv2 = BattleDramaMainPointItem.new()
					uv0.main_point_list[uv1.info_data.id] = uv2

					if uv0.map_layout then
						uv0.map_layout:addChild(uv2, 98)
					end
				end

				uv2 = uv0.main_point_list[uv1.info_data.id]

				if uv2 then
					uv1.v_data = uv3:getCurDunInfoByID(uv1.info_data.id)

					uv2:setPosition(uv1.info_data.pos[1] * uv0:getMapScale(), uv1.info_data.pos[2] * uv0:getMapScale())
					uv2:setData(uv1)
				end
			end)
		end
	end

	if not slot0.cur_tag_container then
		slot0.cur_tag_container = ccui.Layout:create()

		slot0.cur_tag_container:setContentSize(cc.size(50, 50))
		slot0.cur_tag_container:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.map_layout:addChild(slot0.cur_tag_container, 99)
		slot0:createRole(PlayerAction.battle_stand)
	end

	slot0:updateMapPointStatus()
end

function BattleDramaMapWindows.createRole(slot0, slot1)
	if not tolua.isnull(slot0.spine_model) then
		slot0.spine_model:runAction(cc.RemoveSelf:create(true))

		slot0.spine_model = nil
	end

	if not slot0.spine_model then
		slot0.cur_action_name = slot1

		if Config.LooksData.data_data[RoleController:getInstance():getRoleVo().look_id] then
			slot4 = slot3.ico_id or "H30009"
		end

		slot0.spine_model = createSpineByName(slot4, slot1)

		slot0.spine_model:setPosition(slot0.cur_tag_container:getContentSize().width / 2, -15)
		slot0.spine_model:setScaleX(0.35 * slot0:getDir())
		slot0.spine_model:setScaleY(0.35)
		slot0.cur_tag_container:addChild(slot0.spine_model)
		slot0.spine_model:setAnimation(0, slot1, true)
		slot0.spine_model:update(0)

		slot5 = slot0.spine_model:getBoundingBox().height or 85

		if not slot0.cur_effect then
			slot0.cur_effect = createEffectSpine(Config.EffectData.data_effect_info[105], cc.p(25, 130), cc.p(0.5, 0.5), true, PlayerAction.action, nil, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

			slot0.cur_tag_container:addChild(slot0.cur_effect)
		end

		if slot0.cur_effect then
			slot0.cur_effect:setPosition(25, slot5)
		end

		if not slot0.progress_bg then
			slot0.progress_bg = createSprite(PathTool.getResFrame("battledrop", "battledrop_6"), slot0.cur_tag_container:getContentSize().width / 2, -35, slot0.cur_tag_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

			slot0.progress_bg:setScaleX(9.4)
		end

		if not slot0.progress_label then
			slot0.progress_label = createRichLabel(16, 1, cc.p(0.5, 0.5), cc.p(slot0.cur_tag_container:getContentSize().width / 2, -35))

			slot0.cur_tag_container:addChild(slot0.progress_label)
			slot0.progress_label:setString(TI18N("已超过<div fontcolor=5df660>?</div>的玩家进度"))
		end
	end
end

function BattleDramaMapWindows.getDir(slot0)
	slot1 = 1

	if slot0.main_point_list[slot0.drama_data.dun_id] then
		slot4 = slot2:getPositionX()
		slot5 = 0

		if slot0.main_point_list[slot0.drama_data.max_dun_id] then
			slot5 = slot3:getPositionX()
		end

		slot1 = slot5 < slot4 and 1 or -1
	end

	return slot1
end

function BattleDramaMapWindows.updateMapPointStatus(slot0)
	slot0.drama_data = uv0:getDramaData()

	if slot0.drama_data then
		if Config.DungeonData.data_drama_dungeon_info(slot0.drama_data.dun_id) then
			if slot0.main_point_list and slot0.main_point_list[slot0.drama_data.dun_id] then
				slot0.main_point_list[slot0.drama_data.dun_id]:updateStatus(uv0:getCurDunInfoByID(slot0.drama_data.dun_id).status, slot2.is_big)
			end

			if not slot0.is_move_start then
				slot0:moveMapTag()

				slot0.is_move_start = true
			end
		end
	end
end

function BattleDramaMapWindows.moveMapTag(slot0, slot1)
	if slot0.drama_data and Config.DungeonData.data_drama_dungeon_info(slot0.drama_data.dun_id) and slot2.pos then
		slot3[1] = slot3[1] * slot0:getMapScale()
		slot3[2] = slot3[2] * slot0:getMapScale()

		if not slot1 then
			slot0.cur_tag_container:setPosition(slot3[1], slot3[2] + BattleDramaMainPointItem.HEIGHT / 2 + 10)
		else
			slot0.cur_tag_container:runAction(cc.Sequence:create(cc.DelayTime:create(0.1), cc.Spawn:create(cc.CallFunc:create(function ()
				uv0:createRole(PlayerAction.run)
			end), cc.MoveTo:create(0.5, cc.p(slot3[1], slot3[2] + BattleDramaMainPointItem.HEIGHT / 2 + 10))), cc.CallFunc:create(function ()
				uv0:createRole(PlayerAction.battle_stand)
			end)))
		end
	end
end

function BattleDramaMapWindows.close_callback(slot0)
	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.main_point_list then
		for slot4, slot5 in pairs(slot0.main_point_list) do
			if slot5 then
				slot5:DeleteMe()
			end
		end
	end

	if not tolua.isnull(slot0.spine_model) then
		slot0.spine_model:runAction(cc.RemoveSelf:create(true))

		slot0.spine_model = nil
	end

	if slot0.cur_effect then
		slot0.cur_effect:clearTracks()
		slot0.cur_effect:removeFromParent()

		slot0.cur_effect = nil
	end

	if slot0.background then
		slot0.background:removeAllChildren()
		slot0.background:stopAllActions()
	end

	uv0:openBattleDramaMapWindows(false)
end
