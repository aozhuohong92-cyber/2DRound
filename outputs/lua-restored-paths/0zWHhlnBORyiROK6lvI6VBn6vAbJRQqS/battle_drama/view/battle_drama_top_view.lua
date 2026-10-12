BttleTopDramaView = class("BttleTopDramaView", function ()
	return ccui.Layout:create()
end)
slot0 = BattleController:getInstance()
slot1 = RenderMgr:getInstance()
slot2 = tolua.isnull
slot3 = BattleDramaController:getInstance():getModel()
slot4 = BattleDramaController:getInstance()
slot5 = GameNet:getInstance()
slot6 = string.format
slot7 = table.insert
slot8 = table.remove
slot9 = Config.MiscData.data_get_time_items
slot10 = Config.MiscData.data_get_time_items_length

function BttleTopDramaView.ctor(slot0, slot1, slot2)
	slot0.battle_res_id = slot1 or 10001
	slot0.battle_type = slot2 or BattleConst.Fight_Type.Darma
	slot0.map_height = 820
	slot0.is_init = false
	slot0.is_move_root_wnd = false
	slot0.cur_map_pos = nil
	slot0.is_has_max_item = false
	slot0.is_change_chapter = false
	slot0.btn_layout_status = false
	slot0.btn_count = 0
	slot0.fly_item_sum = 0

	slot0:initConfig()
	slot0:createRootWnd()
	slot0:loadResources()
end

function BttleTopDramaView.initConfig(slot0)
	slot0.root_size = cc.size(SCREEN_WIDTH, display.height - slot0.map_height)
	slot0.map_size = cc.size(1800, 1500)
	slot0.main_point_list = {}
	slot0.model = BattleDramaController:getInstance():getModel()
	slot0.ctrl = BattleDramaController:getInstance()
	slot0.cur_chapter_id = nil
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.right_btn_list = {}
	slot0.left_btn_list = {}
end

function BttleTopDramaView.createRootWnd(slot0)
	slot0.main_size = cc.size(SCREEN_WIDTH, display.height)

	slot0:setContentSize(slot0.main_size)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)

	slot0.root = ccui.Layout:create()

	slot0.root:setAnchorPoint(cc.p(0.5, 1))
	slot0.root:setContentSize(cc.size(slot0.main_size.width, slot0.root_size.height))
	slot0.root:setPosition(slot0.main_size.width * 0.5, display.height)
	slot0:addChild(slot0.root)

	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setAnchorPoint(cc.p(0, 0))
	slot0.root_wnd:setContentSize(slot0.map_size)
	slot0.root_wnd:setPosition(cc.p(0, 0))
	slot0.root:addChild(slot0.root_wnd)

	slot0.btn_layout = ccui.Layout:create()

	slot0.btn_layout:setVisible(false)
	slot0.btn_layout:setLocalZOrder(999)
	slot0.btn_layout:setPosition(slot0.main_size.width * 0.5, display.getBottom(slot0) + MainuiController:getInstance():getBottomHeight() + 32)
	slot0:addChild(slot0.btn_layout)
	ViewManager:getInstance():addToLayerByTag(slot0, ViewMgrTag.UI_TAG)
end

function BttleTopDramaView.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battledrama", "battledrama"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/pattern", "pattern_3"),
			type = ResourcesType.single
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	if slot0.resources_load then
		slot0.resources_load:addAllList(slot0.res_list, function ()
			uv0:loadResListCompleted()
		end)
	end
end

function BttleTopDramaView.loadResListCompleted(slot0)
	if slot0.battle_type == BattleConst.Fight_Type.Darma then
		if slot0.top_info_container == nil then
			slot0.top_info_container = ccui.Layout:create()

			slot0.top_info_container:setContentSize(SCREEN_WIDTH, 255)
			slot0.top_info_container:setAnchorPoint(cc.p(0, 1))
			slot0.top_info_container:setPosition(display.getLeft(), display.getTop(slot0) - MainuiController:getInstance():getMainUi():getTopViewHeight() + 25)
			slot0:addChild(slot0.top_info_container)
		end

		if slot0.right_open_widget == nil then
			slot0.right_open_widget = ccui.Layout:create()

			slot0.right_open_widget:setContentSize(108, 90)
			slot0.right_open_widget:setAnchorPoint(cc.p(1, 1))
			slot0.right_open_widget:setPosition(display.getRight() - 20, 120)
			slot0.top_info_container:addChild(slot0.right_open_widget)
		end

		slot0:readyCreateFunIcon()
		slot0:updateDramaChapterData()
		slot0:createDramaButton()
		slot0:registerEvent()
	end
end

function BttleTopDramaView.openView(slot0)
	slot0:setVisible(true)

	slot0.is_showing = true
end

function BttleTopDramaView.hideView(slot0)
	slot0:clearFlyTimer()
	slot0:clearAllFlyItemList()
	slot0:setVisible(false)
	slot0:showWorldLevelTips(false)

	slot0.is_showing = false
end

function BttleTopDramaView.readyCreateFunIcon(slot0)
	if uv0(slot0.top_info_container) then
		return
	end

	for slot5, slot6 in ipairs({
		"updatePassCahpterInfo",
		"updateTaskInfo",
		"updateQingbaoInfo",
		"updateDramaHallows",
		"updateOnlineGiftInfo",
		"updateWorldLevelIcon",
		"updateWorldMapInfo"
	}) do
		delayRun(slot0.top_info_container, slot5 * 4 / 60, function ()
			if uv0[uv1] then
				uv0[uv1](uv0)
			end
		end)
	end

	if slot0.time_ticket == nil then
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:checkTimeTicket()
		end, 1)
	end
end

function BttleTopDramaView.isCreateOnlineGift(slot0)
	slot1 = false

	if OnlineGiftController:getInstance():getOnlineGiftData() and #slot2 ~= uv0 then
		slot1 = true
	end

	return slot1
end

function BttleTopDramaView.updateOnlineGiftInfo(slot0)
	OnlineGiftController:getInstance():sender10926()

	if uv0(slot0.top_info_container) then
		return
	end

	slot0:onlineCreate()
end

function BttleTopDramaView.onlineCreate(slot0)
	if slot0.online_gift_node == nil and slot0:isCreateOnlineGift() == true then
		slot0.online_gift_node = slot0:createReceiveIcon("领取")

		slot0.online_gift_node:setScale(0.8)
		slot0.online_gift_node:setPosition(81, 162)
		slot0.top_info_container:addChild(slot0.online_gift_node)
		registerButtonEventListener(slot0.online_gift_node, function ()
			OnlineGiftController:getInstance():openOnlineGiftView(true)
		end, true, 1)
	end

	slot0:updateRightBtnPos(false)
end

function BttleTopDramaView.receiveChangeData(slot0)
	slot2 = 0

	if OnlineGiftController:getInstance():getOnlineGiftData() then
		for slot6, slot7 in ipairs(uv0) do
			if slot1[1] and slot1[1].time and slot7.time <= slot1[1].time then
				slot2 = slot6
			end
		end
	end

	if uv1 <= slot2 + 1 then
		slot2 = uv1
	end

	slot3 = OnlineGiftController:getInstance():getOnlineTime() or 0

	if not slot0.online_show_item and slot0.online_gift_node then
		slot0.online_show_item = BackPackItem.new(nil, true, nil, 0.55, false)

		slot0.online_gift_node:addChild(slot0.online_show_item)
		slot0.online_show_item:setPosition(cc.p(39, 50))
	end

	if slot0.online_show_item then
		slot0.online_show_item:setBaseData(uv0[slot2].items[1][1], uv0[slot2].items[1][2])
		slot0.online_show_item:showItemEffect(true, 165, PlayerAction.action, true, 1.2)
		slot0.online_show_item:addCallBack(function ()
			OnlineGiftController:getInstance():openOnlineGiftView(true)
		end)

		if uv0[slot2].time <= slot3 then
			if slot0.online_gift_node then
				doStopAllActions(slot0.online_gift_node.label)
				slot0.online_gift_node.label:setString(TI18N("可领取"))
			end
		else
			slot0.online_show_item:showItemEffect(false, 165, PlayerAction.action, true)
			slot0:setLessTime(uv0[slot2].time - slot3)
		end
	end
end

function BttleTopDramaView.removeOnlineSprite(slot0, slot1)
	if slot1 and slot1.list then
		slot2 = false
		slot3 = slot1.time or 0

		if (next(slot1.list) ~= nil and (uv0 > #slot1.list or false) and true or true) == false then
			slot0:clearOnlineInfo()
		else
			slot0:onlineCreate()
		end
	end
end

function BttleTopDramaView.setLessTime(slot0, slot1)
	if not slot1 then
		return
	end

	if tolua.isnull(slot0.online_gift_node.label) then
		return
	end

	doStopAllActions(slot0.online_gift_node.label)

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.online_gift_node.label:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.online_gift_node.label)
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function BttleTopDramaView.setTimeFormatString(slot0, slot1)
	if slot1 and slot1 > 0 then
		slot0.online_gift_node.label:setString(TimeTool.GetTimeFormat(slot1))
	else
		slot0.online_gift_node.label:setString("")
	end
end

function BttleTopDramaView.removeOnlineGift(slot0, slot1)
	slot0:receiveChangeData()

	slot2 = false

	if uv0[uv1].time == slot1 then
		slot2 = true
	end

	if slot2 == true and not tolua.isnull(slot0.online_gift_node) then
		OnlineGiftController:getInstance():openOnlineGiftView(false)
		slot0:clearOnlineInfo()
	end
end

function BttleTopDramaView.clearOnlineInfo(slot0)
	if not tolua.isnull(slot0.online_gift_node) then
		doStopAllActions(slot0.online_gift_node.label)

		if slot0.online_show_item then
			slot0.online_show_item:DeleteMe()
		end

		slot0.online_show_item = nil

		slot0.online_gift_node:removeFromParent()

		slot0.online_gift_node = nil

		if slot0.update_online_get_event then
			GlobalEvent:getInstance():UnBind(slot0.update_online_get_event)

			slot0.update_online_get_event = nil
		end
	end
end

function BttleTopDramaView.checkTimeTicket(slot0)
end

function BttleTopDramaView.updateDramaChapterData(slot0)
	slot0.drama_data = slot0.model:getDramaData()

	if not slot0.drama_data then
		return
	end

	if not slot0.cur_chapter_id then
		slot0.cur_chapter_id = slot0.drama_data.chapter_id
	end

	slot0.is_change_chapter = false

	if slot0.cur_chapter_id ~= slot0.drama_data.chapter_id then
		slot0.is_change_chapter = true

		slot0:updateImage()

		slot0.cur_chapter_id = slot0.drama_data.chapter_id
	end

	slot0.model:initDungeonList(slot0.drama_data.mode, slot0.drama_data.chapter_id)
end

function BttleTopDramaView.updateStatus(slot0, slot1)
	slot0.drama_data = slot0.model:getDramaData()

	if slot0.drama_data then
		if Config.DungeonData.data_drama_dungeon_info(slot0.drama_data.dun_id) then
			if slot0.main_point_list and slot0.main_point_list[slot0.drama_data.dun_id] then
				slot0.main_point_list[slot0.drama_data.dun_id]:updateStatus(slot0.model:getCurDunInfoByID(slot0.drama_data.dun_id).status, slot3.is_big)
			end

			slot0:updateMove(slot1)

			if not slot0.is_move_start then
				slot0.is_move_start = true
			end
		end
	end
end

function BttleTopDramaView.updateMove(slot0, slot1)
	if slot0.drama_data and Config.DungeonData.data_drama_dungeon_info(slot0.drama_data.dun_id) then
		slot3 = slot2.pos
		slot4 = cc.p(slot3[1], slot3[2])
		slot5 = slot2.next_id
		slot7 = slot0.root_wnd:convertToNodeSpace(slot0.root_wnd:convertToWorldSpace(cc.p(slot4.x, slot4.y)))
		slot8 = slot4.y / 2

		if slot8 >= slot0.root_size.height / 2 - slot8 then
			slot8 = -slot4.y / 2
		end

		slot11 = slot0.root_size.width / 2 - (slot0.map_size.width - slot4.x)

		if slot0.root_size.width <= slot4.x then
			slot12 = math.abs(slot11) >= slot0.root_size.width / 2 and -slot4.x - slot11 / 2 or -slot4.x - slot11
		end

		slot13 = slot0:scaleCheckPoint(math.ceil(slot12), math.ceil(slot8))

		if not slot0.is_move_root_wnd then
			if slot0.model:getRootWndPos() and not slot1 and not slot0.is_change_chapter then
				slot0.root_wnd:setPosition(slot0.model:getRootWndPos())
			else
				slot0:rootWndMove(slot13)
			end
		end
	end
end

function BttleTopDramaView.moveTag(slot0, slot1)
end

function BttleTopDramaView.updateEffect(slot0, slot1)
	if slot0.effect then
		slot0.effect:runAction(cc.RemoveSelf:create(true))

		slot0.effect = nil
	end

	if slot1 ~= "" and not uv0(slot0.root) and slot0.effect == nil then
		slot0.effect = createEffectSpine(slot1, cc.p(0, slot0.root_size.height), cc.p(0, 1), true, PlayerAction.action)

		slot0.root:addChild(slot0.effect)
	end
end

function BttleTopDramaView.createRole(slot0, slot1)
end

function BttleTopDramaView.getDir(slot0)
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

function BttleTopDramaView.updateCurMapNameAction(slot0)
	if slot0.drama_data == nil then
		return
	end

	uv0:setDramaStatus(true)

	slot1 = false
	slot2 = slot0.drama_data.last_dun_id or 0

	if slot0.drama_data.last_dun_id == 0 then
		slot2 = slot0.drama_data.max_dun_id
		slot1 = true
	end

	slot4 = Config.DungeonData.data_drama_dungeon_info

	if slot4(slot2) == nil or slot4(slot0.drama_data.max_dun_id) == nil then
		return
	end

	if not slot0.map_name_container then
		slot0.map_name_container = ccui.Layout:create()

		slot0.map_name_container:setContentSize(410, 217)
		slot0.map_name_container:setAnchorPoint(cc.p(0.5, 0))
		slot0.map_name_container:setOpacity(255)
		slot0.map_name_container:setCascadeOpacityEnabled(true)
		slot0.map_name_container:setPosition(cc.p(slot0.root_size.width / 2, display.height * 3 / 5))

		if not uv1(slot0.map_name_container) then
			slot0:addChild(slot0.map_name_container, 99)
		end

		slot0.map_bg = createScale9Sprite(PathTool.getResFrame("battledrama", "battledrama_1038"), slot0.map_name_container:getContentSize().width / 2, slot0.map_name_container:getContentSize().height / 2, LOADTEXT_PLIST, slot0.map_name_container)

		slot0.map_bg:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.map_bg:setContentSize(cc.size(slot0.map_bg:getContentSize().width, slot0.map_bg:getContentSize().height))

		slot0.map_name_label = createLabel(28, cc.c3b(255, 225, 171), cc.c3b(48, 22, 4), slot0.map_name_container:getContentSize().width / 2, slot0.map_name_container:getContentSize().height + 60, "", slot0.map_name_container)

		slot0.map_name_label:setAnchorPoint(cc.p(0.5, 0.5))

		slot0.before_rich_label = createRichLabel(22, cc.c3b(90, 53, 26), cc.p(0, 0.5), cc.p(35, 85), 5, nil, 1000)

		slot0.map_name_container:addChild(slot0.before_rich_label)

		slot0.desc_cur_label = createRichLabel(22, cc.c3b(90, 53, 26), cc.p(0, 0.5), cc.p(192, 92), 15, nil, 1000)

		slot0.map_name_container:addChild(slot0.desc_cur_label)

		slot0.after_rich_label = createRichLabel(22, cc.c3b(90, 53, 26), cc.p(0, 0.5), cc.p(258, 83), 15, nil, 1000)

		slot0.map_name_container:addChild(slot0.after_rich_label)

		slot0.desc_cur_label_2 = createRichLabel(22, cc.c3b(90, 53, 26), cc.p(0, 0.5), cc.p(298, 85), 13, nil, 1000)

		slot0.map_name_container:addChild(slot0.desc_cur_label_2)
	end

	if slot0.map_name_container and not uv1(slot0.map_name_container) then
		slot7 = ""
		slot8 = ""

		if slot5 and slot5.per_hook_items then
			for slot13, slot14 in ipairs(slot0.model:calcHookItems(slot5)) do
				slot15 = Config.ItemData.data_get_data(slot14[1])
				slot7 = slot7 .. uv2(TI18N("<img src=%s visible=true scale=0.30 /><div>%s\n</div>"), PathTool.getItemRes(slot15.icon), slot15.name)
				slot8 = slot1 == true and slot8 .. "\n" .. 0 or slot8 .. "\n" .. 0 .. "\n" .. slot14[2]
			end
		end

		slot0.before_rich_label:setString(slot7)
		slot0.desc_cur_label:setString(slot8)
		slot0.desc_cur_label:setPositionX(slot0.before_rich_label:getPositionX() + slot0.before_rich_label:getContentSize().width + 10)

		slot9 = ""
		slot10 = ""

		if slot6 and slot6.per_hook_items then
			for slot15, slot16 in ipairs(slot0.model:calcHookItems(slot6)) do
				slot17 = Config.ItemData.data_get_data(slot16[1])
				slot9 = slot9 .. uv2(TI18N("<img src=%s visible=true scale=1 /><div>\n</div>"), PathTool.getResFrame("common", "common_90017"))
				slot10 = slot10 .. uv2(TI18N("<div>%s/分钟\n</div>"), slot16[2])
			end
		end

		slot0.after_rich_label:setString(slot9)
		slot0.desc_cur_label_2:setString(slot10)
		slot0.after_rich_label:setPositionX(slot0.desc_cur_label:getPositionX() + slot0.desc_cur_label:getContentSize().width + 10)
		slot0.desc_cur_label_2:setPositionX(slot0.after_rich_label:getPositionX() + slot0.after_rich_label:getContentSize().width + 10)

		if slot6 and slot0.map_name_label then
			slot0.map_name_label:setString(slot6.name)
		end

		slot0.map_name_container:runAction(cc.Sequence:create(cc.FadeTo:create(0.8, 255), cc.DelayTime:create(2), cc.FadeOut:create(0.8), cc.CallFunc:create(function ()
			if uv0.map_name_container and not uv1(uv0.map_name_container) then
				uv0.map_name_container:removeAllChildren()

				uv0.map_name_container = nil

				uv2:setDramaStatus(false)
			end
		end)))
	end
end

function BttleTopDramaView.updateImage(slot0)
	if uv0:getCtrlBattleScene() and slot0.drama_data then
		if Config.DungeonData.data_drama_world_info[slot0.drama_data.mode] and slot1[slot0.drama_data.chapter_id] then
			slot2 = slot1[slot0.drama_data.chapter_id].map_id

			if uv0:getCtrlBattleScene() then
				if slot0.map_resources_load then
					slot0.map_resources_load:DeleteMe()

					slot0.map_resources_load = nil
				end

				if not slot0.map_resources_load then
					slot0.map_resources_load = ResourcesLoad.New(true)
				end

				if not slot0.res_list then
					slot0.res_list = {}
				end

				table.insert(slot0.res_list, {
					path = PathTool.getBattleSceneRes(uv1("%s/m_bg", slot2), true),
					type = ResourcesType.single
				})
				table.insert(slot0.res_list, {
					path = PathTool.getBattleSceneRes(uv1("%s/map_bg", slot2), false),
					type = ResourcesType.single
				})
				slot0.map_resources_load:addAllList(slot0.res_list, function ()
					if uv0:getCtrlBattleScene() then
						uv0:getCtrlBattleScene():updateBg(uv1, uv2)
					end

					uv3.res_list = {}
				end)
			end
		end

		slot0.is_init = true
	end
end

function BttleTopDramaView.moveMainScene(slot0, slot1, slot2)
	slot3 = slot0:scaleCheckPoint(slot0.root_wnd:getPositionX() + slot1, slot0.root_wnd:getPositionY() + slot2)

	slot0.root_wnd:setPosition(slot3.x, slot3.y)
end

function BttleTopDramaView.scaleCheckPoint(slot0, slot1, slot2)
	if cc.p(slot1, slot2).x > 0 then
		slot3.x = 0
	elseif slot3.x < slot0.root_size.width - slot0.map_size.width then
		slot3.x = slot0.root_size.width - slot0.map_size.width
	end

	if slot3.y < slot0.root_size.height - slot0.map_size.height then
		slot3.y = slot0.root_size.height - slot0.map_size.height
	elseif slot3.y >= 0 then
		slot3.y = 0
	end

	return slot3
end

function BttleTopDramaView.registerEvent(slot0)
	if not slot0.update_drama_data_event then
		slot0.update_drama_data_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Update_Data, function (slot0)
			if slot0.chapter_id ~= uv0.cur_chapter_id then
				if uv0.root_wnd and not uv1(uv0.root_wnd) then
					uv0:updateDramaChapterData()
					uv0:updateCurMapInfo(true)
				end
			elseif uv0.root_wnd and not uv1(uv0.root_wnd) then
				uv0:updateCurMapInfo()
			end

			uv0:updateNextBtnStatus(uv0.drama_data)
		end)
	end

	if not slot0.update_drama_max_id_event then
		slot0.update_drama_max_id_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Update_Max_Id, function ()
			uv0:updateDramaDropInfo()
		end)
	end

	if not slot0.update_drama_top_data_event then
		slot0.update_drama_top_data_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Top_Update_Data, function (slot0)
			if uv0.root_wnd and not uv1(uv0.root_wnd) then
				uv0:updateDramaChapterData()
				uv0:updateCurMapInfo(true)
				uv0:updateNextBtnStatus(uv0.drama_data)
			end
		end)
	end

	if slot0.battle_exit_event == nil then
		slot0.battle_exit_event = GlobalEvent:getInstance():Bind(BattleEvent.MOVE_DRAMA_EVENT, function (slot0, slot1)
			if slot0 == BattleConst.Fight_Type.Darma and uv0.drama_data and MainuiController:getInstance():checkIsInDramaUIFight() then
				uv0:updateCurMapNameAction()
				uv0:updateDramaDropInfo()

				uv0.is_move_start = true
			end
		end)
	end

	if not slot0.update_drama_reward_event then
		slot0.update_drama_reward_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Drama_Reward_Data, function (slot0)
			uv0:updatePassCahpterInfo()
		end)
	end

	if not slot0.update_drama_quick_data_event then
		slot0.update_drama_quick_data_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Quick_Battle_Data, function (slot0)
			if slot0 == nil then
				return
			end

			if uv0(uv1.quick_battle_btn) then
				return
			end

			if slot0.fast_combat_num ~= 0 or not uv1.quick_battle_status then
				uv1.quick_battle_tips:setVisible(false)
			else
				uv1.quick_battle_tips:setVisible(true)
			end

			uv1:updateNextBtnStatus(uv1.model:getDramaData())
		end)
	end

	if slot0.update_function_status_event == nil then
		slot0.update_function_status_event = GlobalEvent:getInstance():Bind(MainuiEvent.UPDATE_FUNCTION_STATUS, function (slot0, slot1)
			if slot0 == MainuiConst.icon.daily then
				uv0:updateTaskInfo()
			elseif slot0 == MainuiConst.icon.rank then
				-- Nothing
			end
		end)
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "look_id" then
				-- Nothing
			elseif slot0 == "energy" then
				uv0:updateQingbaoInfo()
			elseif slot0 == "lev" then
				if uv0.next_battle_btn and uv0.next_battle_btn.lev_limit and uv0.next_battle_btn.lev_limit <= slot1 then
					uv0.next_battle_btn.lev_limit = 0

					uv0.boss_btn_notice:setVisible(false)
					uv0.boss_btn_challenge:setVisible(true)
				end

				uv0:updateWorldLevelIcon()
			end
		end)
	end

	if slot0.update_hallows_task_event == nil then
		slot0.update_hallows_task_event = GlobalEvent:getInstance():Bind(HallowsEvent.UpdateHallowsTaskEvent, function ()
			uv0:updateDramaHallows()
		end)
	end

	if slot0.update_drama_hallows_event == nil then
		slot0.update_drama_hallows_event = GlobalEvent:getInstance():Bind(HallowsEvent.HallowsActivityEvent, function ()
			uv0:updateDramaHallows()
		end)
	end

	if slot0.update_hallows_red_status == nil then
		slot0.update_hallows_red_status = GlobalEvent:getInstance():Bind(HallowsEvent.HallowsRedStatus, function ()
			uv0:updateHallowsRedStatus()
		end)
	end

	if slot0.update_hookaccumulatetime_event == nil then
		slot0.update_hookaccumulatetime_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.UpdateHookAccumulateTime, function ()
			uv0:updateResourceCollect()
		end)
	end

	if slot0.update_onlinegift_event == nil then
		slot0.update_onlinegift_event = GlobalEvent:getInstance():Bind(OnlineGiftEvent.Updata_Data, function (slot0)
			uv0:removeOnlineGift(slot0)
		end)
	end

	if slot0.update_online_get_event == nil then
		slot0.update_online_get_event = GlobalEvent:getInstance():Bind(OnlineGiftEvent.Get_Data, function (slot0)
			uv0:removeOnlineSprite(slot0)
			uv0:receiveChangeData()
		end)
	end

	if slot0.update_voyage_red_event == nil then
		slot0.update_voyage_red_event = GlobalEvent:getInstance():Bind(VoyageEvent.UpdateVoyageRedEvent, function (slot0)
			if uv0.qingbao_progress_tips and not uv1(uv0.qingbao_progress_tips) then
				uv0.qingbao_progress_tips:setVisible(VoyageController:getInstance():getModel():checkVoyageRedStatus())
			end
		end)
	end

	if slot0.update_encounter_red_event == nil then
		slot0.update_encounter_red_event = GlobalEvent:getInstance():Bind(EncounterEvent.UPDATA_RED_STATUS, function (slot0)
		end)
	end
end

function BttleTopDramaView.rootWndMove(slot0, slot1, slot2)
	slot3 = cc.MoveTo:create(0.4, cc.p(slot1.x, slot1.y))

	if slot0.model:getRootWndPos() and not slot2 then
		slot3 = cc.MoveBy:create(0.4, cc.p(-(slot0.model:getRootWndPos().x - slot1.x), -(slot0.model:getRootWndPos().y - slot1.y)))
	end

	doStopAllActions(slot0.root_wnd)
	slot0.root_wnd:runAction(cc.Sequence:create(slot3, cc.CallFunc:create(function ()
		uv0.model:setRootWndPos(cc.p(uv1.x, uv1.y))

		uv0.in_touch_move = false
	end)))
end

function BttleTopDramaView.createSpecialIcon(slot0, slot1, slot2, slot3)
	slot4 = ccui.Layout:create()

	slot4:setAnchorPoint(0.5, 0.5)
	slot4:setContentSize(76, 76)
	slot4:setTouchEnabled(true)

	slot8 = createSprite(PathTool.getResFrame("mainui", "mainui_1009"), 62, 62, slot4, cc.p(0.5, 0.5))

	slot8:setVisible(false)

	slot4.bg = createSprite(PathTool.getResFrame("battledrama", "battledrama_1020"), 38, 38, slot4, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot4.sp = createSprite(slot1, 38, 38, slot4, cc.p(0.5, 0.5), slot3 or LOADTEXT_TYPE_PLIST)
	slot4.label = createLabel(18, cc.c4b(255, 231, 190, 255), 2, 38, 2, slot2 or "", slot4, 2, cc.p(0.5, 0.5))
	slot4.tips = slot8

	return slot4
end

function BttleTopDramaView.createReceiveIcon(slot0, slot1)
	slot2 = ccui.Layout:create()

	slot2:setAnchorPoint(0.5, 0.5)
	slot2:setContentSize(76, 76)
	slot2:setTouchEnabled(true)

	slot2.bg = createSprite(PathTool.getResFrame("battledrama", "battledrama_1014"), 38, 38, slot2, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot2.label = createLabel(18, cc.c4b(0, 255, 0, 255), 2, 36, -17, slot1 or "", slot2, 2, cc.p(0.5, 0.5))

	return slot2
end

function BttleTopDramaView.updateResourceCollect(slot0)
	if uv0(slot0.resources_progress) then
		return
	end

	if uv0(slot0.resources_box) then
		return
	end

	if Config.DungeonData.data_drama_const.hangup_revenue == nil or Config.DungeonData.data_drama_const.hangup_revenue_small == nil or Config.DungeonData.data_drama_const.hangup_revenue_big == nil then
		return
	end

	if uv1:getHookAccumulateInfo() == nil then
		return
	end

	slot5 = slot4.hook_time or 0
	slot6 = PlayerAction.action

	if slot0.resources_action ~= ((slot3.val > slot5 or PlayerAction.action_5) and (slot2.val > slot5 or PlayerAction.action_3) and (slot1.val > slot5 or PlayerAction.action_1) and PlayerAction.action) then
		slot0.resources_action = slot6

		slot0.resources_box:setToSetupPose()
		slot0.resources_box:setAnimation(0, slot6, true)
	end

	if Config.DungeonData.data_drama_const.profit_time_max then
		slot0.resources_progress:setPercent(100 * slot5 / slot7.val)
	end

	if not uv0(slot0.resources_time_label) then
		slot0.resources_time_label:setString(TimeTool.GetTimeFormatIII(slot5))
	end
end

function BttleTopDramaView.updateWorldMapInfo(slot0)
	if uv0(slot0.top_info_container) then
		return
	end

	if slot0.world_map_node == nil then
		slot0.world_map_node = slot0:createSpecialIcon(nil, nil, nil)

		if slot0.world_map_node.bg then
			slot0.world_map_node.bg:setVisible(false)
		end

		slot0.top_info_container:addChild(slot0.world_map_node)

		slot1 = cc.size(139, 139)
		slot0.world_map_node = ccui.Layout:create()

		slot0.world_map_node:setAnchorPoint(0.5, 0.5)
		slot0.world_map_node:setContentSize(slot1)
		slot0.world_map_node:setTouchEnabled(true)

		slot2 = createSprite(PathTool.getResFrame("battledrama", "battledrama_1001"), slot1.width / 2, slot1.height / 2, slot0.world_map_node, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 2)
		slot5 = cc.ClippingNode:create(createSprite(PathTool.getResFrame("battledrama", "battledrama_1010"), slot1.width / 2, slot1.height / 2, nil, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST))

		slot5:setAnchorPoint(cc.p(0.5, 0.5))
		slot5:setContentSize(slot1)
		slot5:setCascadeOpacityEnabled(true)
		slot5:setPosition(slot1.width / 2, slot1.height / 2)
		slot5:setAlphaThreshold(0)
		slot0.world_map_node:addChild(slot5)

		slot0.world_map_node.name_label = createLabel(20, 1, cc.c3b(72, 44, 27), slot1.width / 2, 0, "", slot0.world_map_node, 1, cc.p(0.5, 1))
		slot0.world_map_node.map_cli_node = slot5

		slot0:updateCurMapInfo(true)
		slot0.top_info_container:addChild(slot0.world_map_node)
		slot0.world_map_node:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				BattleDramaController:getInstance():openBattleDramaMapWindows(true)
			end
		end)

		slot6 = slot0.top_info_container:getContentSize()

		slot0.world_map_node:setPosition(slot6.width - 73, slot6.height - 41)
	end
end

function BttleTopDramaView.updateCurMapInfo(slot0, slot1)
	if slot0.world_map_node then
		slot0.drama_data = slot0.model:getDramaData()

		if slot0.drama_data then
			if not Config.DungeonData.data_drama_dungeon_info(slot0.drama_data.dun_id) or next(slot2) == nil then
				return
			end

			if slot0.world_map_node.name_label then
				slot0.world_map_node.name_label:setString(slot2.name)
			end

			if slot1 then
				slot3 = slot0.world_map_node:getContentSize()

				if Config.DungeonData.data_drama_world_info[slot0.drama_data.mode] and slot4[slot0.drama_data.chapter_id] then
					slot5 = slot4[slot0.drama_data.chapter_id].map_id

					if slot0.load_map_icon then
						slot0.load_map_icon:DeleteMe()

						slot0.load_map_icon = nil
					end

					slot0.load_map_icon = createResourcesLoad(PathTool.getBattleSceneRes(uv0("%s/blayer/small_map", slot5), true), ResourcesType.single, function ()
						if not uv0.map_icon_bg then
							uv0.map_icon_bg = createSprite(uv1, 0, 0, uv0.world_map_node.map_cli_node, cc.p(0, 0), LOADTEXT_TYPE)
						else
							loadSpriteTexture(uv0.map_icon_bg, uv1, LOADTEXT_TYPE)
						end

						uv0.map_icon_bg:setPosition(uv0:getCliNodePos())
					end, slot0.load_map_icon)
				end
			elseif slot0.map_icon_bg then
				slot0.map_icon_bg:setPosition(slot0:getCliNodePos())
			end
		end
	end
end

function BttleTopDramaView.getCliNodePos(slot0)
	if slot0.drama_data and Config.DungeonData.data_drama_dungeon_info(slot0.drama_data.dun_id) and slot1.pos then
		slot4 = slot0.world_map_node:getContentSize()
		slot5 = slot0.map_icon_bg:getContentSize()
		slot2 = slot1.pos[1] / (1024 / slot5.width)
		slot3 = slot1.pos[2] / (1024 / slot5.height)

		if not slot0.map_icon_flag then
			slot0.map_icon_flag = createSprite(PathTool.getResFrame("battledrama", "battledrama_1013"), slot2, slot3, slot0.map_icon_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
		end

		slot0.map_icon_flag:setPosition(cc.p(slot2, slot3))

		slot3 = -slot3 + slot4.height / 2

		if -slot2 + slot4.width / 2 < -(slot5.width - slot4.width) then
			slot2 = -(slot5.width - slot4.width)
		elseif slot2 > 0 then
			slot2 = 0
		end

		if slot3 < -(slot5.height - slot4.height) then
			slot3 = -(slot5.height - slot4.height)
		elseif slot3 > 0 then
			slot3 = 0
		end

		return cc.p(slot2, slot3)
	end

	return cc.p(0, 0)
end

function BttleTopDramaView.updateTaskInfo(slot0, slot1)
	if slot1 == false then
		return
	end

	slot2 = false

	if slot0.task_icon_vo == nil then
		if MainuiController:getInstance():getFucntionIconVoById(MainuiConst.icon.daily) == nil then
			return
		end

		slot0.task_icon_vo = slot3
		slot0.task_icon = slot0:createSpecialIcon(PathTool.getResFrame("battledrama", "battledrama_1016"), TI18N("日常任务"), LOADTEXT_TYPE_PLIST)

		slot0.task_icon:setPosition(52, 52)
		slot0.top_info_container:addChild(slot0.task_icon)

		slot0.task_icon.index = 1
		slot0.left_btn_list[1] = slot0.task_icon

		slot0.task_icon:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				MainuiController:getInstance():iconClickHandle(uv0.task_icon_vo.config.id)
			end
		end)

		if slot0.task_icon_event == nil then
			slot0.task_icon_event = slot0.task_icon_vo:Bind(FunctionIconVo.UPDATE_SELF_EVENT, function (slot0)
				if slot0 == "tips_status" then
					uv0:checkTaskRed()
				end
			end)
		end

		slot0:checkTaskRed()

		slot2 = true
	end

	if slot2 then
		slot0:updateRightBtnPos()
	end
end

function BttleTopDramaView.checkTaskRed(slot0)
	slot1 = false

	if slot0.task_icon_vo and slot0.task_icon_vo.tips_status_list and next(slot0.task_icon_vo.tips_status_list or {}) ~= nil then
		for slot5, slot6 in ipairs(slot0.task_icon_vo.tips_status_list) do
			if slot6.num > 0 then
				slot1 = true

				break
			end
		end
	end

	if slot0.task_icon and not uv0(slot0.task_icon.tips) then
		slot0.task_icon.tips:setVisible(slot1)
	end
end

function BttleTopDramaView.updateQingbaoInfo(slot0)
	if uv0(slot0.top_info_container) then
		return
	end

	if slot0.qingbao_node == nil then
		slot0.qingbao_node = createCSBNote(PathTool.getTargetCSB("battledrama/battle_drama_qingbao_node"))

		slot0.qingbao_node:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.top_info_container:addChild(slot0.qingbao_node)

		slot0.qingbao_node.index = 1
		slot0.right_btn_list[1] = slot0.qingbao_node
		slot0.qingbao_container = slot0.qingbao_node:getChildByName("guidesign_tipsqingbao")

		slot0.qingbao_container:getChildByName("label"):setString(TI18N("远航"))

		slot0.qingbao_progress = cc.ProgressTimer:create(createSprite(PathTool.getResFrame("battledrama", "battledrama_1021"), 40, 40, nil, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST))

		slot0.qingbao_progress:setPosition(40, 40)
		slot0.qingbao_progress:setType(cc.PROGRESS_TIMER_TYPE_RADIAL)
		slot0.qingbao_container:getChildByName("progress_container"):addChild(slot0.qingbao_progress)

		slot0.qingbao_progress_value = slot0.qingbao_container:getChildByName("value")
		slot0.qingbao_progress_tips = slot0.qingbao_container:getChildByName("tips")

		slot0.qingbao_progress_tips:setVisible(VoyageController:getInstance():getModel():checkVoyageRedStatus())
		slot0.qingbao_container:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				if Config.ShippingData.data_const.guild_lev and uv0.role_vo and slot2.val <= uv0.role_vo.lev then
					VoyageController:getInstance():openVoyageMainWindow(true)
				elseif slot2 then
					message(slot2.desc)
				end
			end
		end)
		slot0:updateRightBtnPos(true)
	end

	if slot0.role_vo then
		slot1 = slot0.role_vo.energy

		slot0.qingbao_progress:setPercentage(100 * slot1 / slot0.role_vo.energy_max)
		slot0.qingbao_progress_value:setString(slot1)
	end
end

function BttleTopDramaView.updateRightBtnPos(slot0, slot1)
	if uv0(slot0.top_info_container) then
		return
	end

	slot2 = {}

	if ((slot1 ~= true or slot0.right_btn_list) and slot0.left_btn_list) == nil or next(slot2) == nil then
		return
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot2) do
		if slot8.index ~= nil then
			uv1(slot3, {
				index = slot8.index or 0,
				node = slot8
			})
		end
	end

	table.sort(slot3, function (slot0, slot1)
		return slot0.index < slot1.index
	end)

	slot4 = slot0.top_info_container:getContentSize()

	for slot8, slot9 in ipairs(slot3) do
		slot10 = 0
		slot11 = 0

		if slot1 then
			slot10 = slot4.width - 73
			slot11 = slot4.height - 188 - (slot8 - 1) * 94
		else
			slot10 = slot4.width - 200 - (slot8 - 1) * 94
			slot11 = slot4.height - 40
		end

		if slot9.node and not uv0(slot9.node) then
			slot9.node:setPosition(cc.p(slot10, slot11))
		end
	end
end

function BttleTopDramaView.updatePassCahpterInfo(slot0)
	if uv0(slot0.top_info_container) then
		return
	end

	slot2 = false

	if slot0.model:getNewDramaRewardID() then
		if slot0.reward_btn == nil then
			slot0.reward_btn = slot0:createSpecialIcon(PathTool.getResFrame("battledrama", "battledrama_1018"), TI18N("通关奖励"), LOADTEXT_TYPE_PLIST)

			slot0.top_info_container:addChild(slot0.reward_btn)

			slot0.reward_btn.index = 3
			slot0.left_btn_list[3] = slot0.reward_btn

			slot0.reward_btn:setName("guidesign_battle_reward_btn")

			if not uv0(slot0.reward_btn) then
				slot0.reward_btn:addTouchEventListener(function (slot0, slot1)
					customClickAction(slot0, slot1)

					if slot1 == ccui.TouchEventType.ended then
						BattleDramaController:getInstance():openDramRewardView(true)
					end
				end)
			end

			slot2 = true
		end

		if not uv0(slot0.reward_btn.tips) then
			slot0.reward_btn.tips:setVisible(slot0.model:getDramaRewardRedPointInfo())
		end
	elseif not uv0(slot0.reward_btn) then
		uv1(slot0.left_btn_list, slot0.reward_btn.index)
		slot0.reward_btn:removeFromParent()

		slot0.reward_btn = nil
		slot2 = true
	end

	if slot2 then
		slot0:updateRightBtnPos(false)
	end
end

function BttleTopDramaView.updatePassCahpterVideo(slot0)
	if uv0(slot0.top_info_container) then
		return
	end

	slot1 = false

	if slot0.strong_btn == nil then
		slot0.strong_btn = slot0:createSpecialIcon(PathTool.getResFrame("battledrama", "battledrama_1024"), TI18N("我要变强"), LOADTEXT_TYPE_PLIST)

		slot0.top_info_container:addChild(slot0.strong_btn)

		slot0.strong_btn.index = 2
		slot0.left_btn_list[2] = slot0.strong_btn

		slot0.strong_btn:setName("hero_btn")

		if not uv0(slot0.strong_btn) then
			slot0.strong_btn:addTouchEventListener(function (slot0, slot1)
				customClickAction(slot0, slot1)

				if slot1 == ccui.TouchEventType.ended then
					playButtonSound2()
					StrongerController:getInstance():openMainWin(true)
				end
			end)
		end

		slot1 = true
	end

	if slot1 then
		slot0:updateRightBtnPos()
	end
end

function BttleTopDramaView.checkEncounterRed(slot0)
	if slot0.encounter_btn then
		addRedPointToNodeByStatus(slot0.encounter_btn, EncounterController:getInstance():getModel():getRedStatus(), 5, 5)
	end
end

function BttleTopDramaView.checkEncounterOpenStatus(slot0)
	slot1 = true
	slot2 = Config.EncounterData.data_encounter_const.encounter_lev

	if slot0.role_vo and slot2 ~= nil and slot0.role_vo.lev < slot2.val then
		slot1 = false
	end

	if slot1 then
		setChildUnEnabled(false, slot0.encounter_btn)
		slot0.encounter_btn_label:setTextColor(cc.c4b(255, 244, 200, 255))
		slot0.encounter_btn_label:enableOutline(cc.c4b(79, 22, 0, 255), 2)
	else
		setChildUnEnabled(true, slot0.encounter_btn)
		slot0.encounter_btn_label:setTextColor(Config.ColorData.data_color4[1])
		slot0.encounter_btn_label:enableOutline(cc.c4b(73, 73, 73, 255), 2)
	end
end

function BttleTopDramaView.updateWorldLevelIcon(slot0)
	if slot0.role_vo and slot0.role_vo.lev < 60 then
		return
	end

	if uv0(slot0.top_info_container) then
		return
	end

	slot1 = false

	if not slot0.world_lv_btn then
		slot2 = slot0.top_info_container:getContentSize()
		slot0.world_lv_btn = createImage(slot0.top_info_container, PathTool.getResFrame("common", "txt_cn_common_90022"), slot2.width - 150, slot2.height - 40, cc.p(0.5, 0.5), true)

		slot0.world_lv_btn:setTouchEnabled(true)

		slot0.world_lv_btn.index = 6
		slot0.left_btn_list[6] = slot0.world_lv_btn

		registerButtonEventListener(slot0.world_lv_btn, function ()
			uv0:showWorldLevelTips(true)
		end, true)

		slot1 = true
	end

	if slot1 then
		slot0:updateRightBtnPos()
	end
end

function BttleTopDramaView.showWorldLevelTips(slot0, slot1)
	if slot1 == true then
		if not slot0.world_lv_layout then
			slot0.world_lv_layout = ccui.Layout:create()

			slot0.world_lv_layout:setTouchEnabled(true)
			slot0.world_lv_layout:setSwallowTouches(false)
			slot0.world_lv_layout:setContentSize(slot0.main_size)
			slot0.world_lv_layout:setLocalZOrder(999)
			slot0.world_lv_layout:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.world_lv_layout:setPosition(slot0.main_size.width * 0.5, slot0.main_size.height * 0.5)
			slot0:addChild(slot0.world_lv_layout)
			registerButtonEventListener(slot0.world_lv_layout, function ()
				uv0:showWorldLevelTips(false)
			end)

			slot3 = slot0.world_lv_layout:convertToNodeSpace(slot0.world_lv_btn:convertToWorldSpace(cc.p(0, 0)))

			createImage(slot0.world_lv_layout, PathTool.getResFrame("common", "common_1056"), slot3.x - 50, slot3.y - 20, cc.p(0.5, 1), true, nil, true):setTouchEnabled(true)

			slot5 = cc.size(400, 150)

			if Config.WorldLevData.data_const.worldlev_des then
				slot7 = createLabel(24, 161, nil, 30, 85, slot6.desc, slot4, nil, cc.p(0, 1))

				slot7:setMaxLineWidth(350)

				slot5.height = slot5.height + slot7:getContentSize().height

				slot7:setPosition(cc.p(30, slot5.height - 90))
			end

			slot4:setContentSize(slot5)

			slot7 = createSprite(PathTool.getResFrame("common", "txt_cn_common_90022"), 50, slot5.height - 40, slot4, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
			slot8 = createLabel(26, 161, nil, 85, slot5.height - 40, TI18N("世界等级"), slot4, nil, cc.p(0, 0.5))
			slot9 = createSprite(PathTool.getResFrame("common", "common_1072"), 200, slot5.height - 75, slot4, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

			slot9:setScaleY(3)
			slot9:setRotation(90)

			slot0.world_lv_txt = createRichLabel(24, 161, cc.p(0, 0.5), cc.p(30, 35))

			slot4:addChild(slot0.world_lv_txt)
			slot0.world_lv_txt:setString(string.format(TI18N("当前世界等级:<div fontcolor=#249003>%d级</div>"), RoleController:getInstance():getModel():getWorldLev()))
		end

		slot0.world_lv_layout:setVisible(true)
	elseif slot0.world_lv_layout then
		slot0.world_lv_layout:setVisible(false)
	end
end

function BttleTopDramaView.createDramaButton(slot0)
	if not uv0(slot0.btn_layout) then
		if not slot0.battle_button_list then
			slot0.battle_button_list = createCSBNote(PathTool.getTargetCSB("battle/battle_button_list"))

			slot0.battle_button_list:setAnchorPoint(cc.p(0.5, 0))
			slot0.battle_button_list:setPositionY(-MainuiController:getInstance():getBottomHeight() - 65)
			slot0.btn_layout:addChild(slot0.battle_button_list)

			slot2 = slot0.battle_button_list:getChildByName("image_bg")
			slot0.drama_reward_layout = slot0.battle_button_list:getChildByName("reward_layout")
			slot0.drama_item_scrollview = slot0.battle_button_list:getChildByName("item_scrollview")

			slot0.drama_item_scrollview:setScrollBarEnabled(false)
			slot0.drama_item_scrollview:setSwallowTouches(false)

			slot0.drama_title_pass = slot0.battle_button_list:getChildByName("title_pass")
			slot0.drama_title_reward = slot0.battle_button_list:getChildByName("title_reward")

			slot0.drama_title_reward:setString(TI18N("奖\n励"))

			slot0.desc_panel = slot0.battle_button_list:getChildByName("desc_panel")

			slot0.desc_panel:setTouchEnabled(false)

			slot0.desc_panel_size = slot0.desc_panel:getContentSize()
			slot0.scroll_view = slot0.desc_panel:getChildByName("scroll_view")

			slot0.scroll_view:setScrollBarEnabled(false)

			slot0.scroll_size = slot0.scroll_view:getContentSize()
			slot0.desc_label = createRichLabel(20, cc.c4b(81, 55, 59, 255), cc.p(0, 1), cc.p(5, 110), 8, nil, 330)

			slot0.scroll_view:addChild(slot0.desc_label)

			slot0.image_boss = slot0.battle_button_list:getChildByName("image_boss")
			slot0.detail_btn = slot0.battle_button_list:getChildByName("detail_btn")

			slot0.detail_btn:addTouchEventListener(function (slot0, slot1)
				customClickAction(slot0, slot1)

				if slot1 == ccui.TouchEventType.ended then
					BattleDramaController:getInstance():openDramDropWindows(true)
				end
			end)

			slot0.next_battle_btn = slot0.battle_button_list:getChildByName("guildsign_battle_boss_btn")
			slot0.boss_btn_notice = slot0.next_battle_btn:getChildByName("notice_label")
			slot0.boss_btn_challenge = slot0.next_battle_btn:getChildByName("challenge_item")

			slot0.boss_btn_challenge:getChildByName("label"):setString(TI18N("挑战BOSS"))
			UITool.SetTitleColor(slot0.boss_btn_challenge:getChildByName("label"))
			UITool.SetTitleColor(slot0.boss_btn_notice)
			slot0.next_battle_btn:setLocalZOrder(999)
			slot0.boss_btn_challenge:setLocalZOrder(999)

			slot0.boss_btn_challenge_effect = createEffectSpine(Config.EffectData.data_effect_info[107], cc.p(95, 31), cc.p(0.5, 0.5), true, PlayerAction.action, nil, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

			slot0.boss_btn_challenge:addChild(slot0.boss_btn_challenge_effect, -1)
			slot0.next_battle_btn:addTouchEventListener(function (slot0, slot1)
				customClickAction(slot0, slot1)

				if slot1 == ccui.TouchEventType.ended then
					if not uv0:getIsNoramalBattle() then
						message(TI18N("当前正在战斗中"))

						return
					end

					if uv1.next_battle_btn.lev_limit > 0 then
						message(TI18N("等级不足"))
					elseif uv1.next_battle_btn.battle_status == 3 then
						uv2:send13002()
					else
						HeroController:getInstance():openFormGoFightPanel(true)
					end
				end
			end)

			slot0.next_battle_time = slot0.battle_button_list:getChildByName("next_battle_time")
			slot0.next_battle_time_label = slot0.next_battle_time:getChildByName("label")

			UITool.SetTitleColor(slot0.next_battle_time_label)

			slot0.encounter_btn = slot0.battle_button_list:getChildByName("encounter_btn")
			slot0.encounter_btn_label = slot0.encounter_btn:getChildByName("label")

			slot0.encounter_btn_label:setString(TI18N("我要变强"))
			UITool.SetTitleColor(slot0.encounter_btn_label)
			slot0.encounter_btn:addTouchEventListener(function (slot0, slot1)
				customClickAction(slot0, slot1)

				if slot1 == ccui.TouchEventType.ended then
					playButtonSound2()
					StrongerController:getInstance():openMainWin(true)
				end
			end)
			slot0.encounter_btn:setName("hero_btn")

			slot0.quick_battle_btn = slot0.battle_button_list:getChildByName("guidesign_battle_quick_btn")
			slot0.quick_battle_label = slot0.quick_battle_btn:getChildByName("label")

			slot0.quick_battle_label:setString(TI18N("快速作战"))
			UITool.SetTitleColor(slot0.quick_battle_label)

			slot0.quick_battle_tips = slot0.quick_battle_btn:getChildByName("tips")

			slot0.quick_battle_btn:addTouchEventListener(function (slot0, slot1)
				customClickAction(slot0, slot1)

				if slot1 == ccui.TouchEventType.ended and uv0.quick_battle_status == true then
					uv1:openDramBattleQuickView(true)
					uv2:setOpenQuickBattleStatus(true)
					uv2:checkRedPoint()
					uv0.quick_battle_tips:setVisible(false)
				end
			end)
		end

		if not slot0.resour_collect then
			slot0.resour_collect = createCSBNote(PathTool.getTargetCSB("battle/battle_resources_collect"))

			slot0.resour_collect:setPosition(540, 500)
			slot0.resour_collect:setLocalZOrder(998)
			slot0.battle_button_list:addChild(slot0.resour_collect)

			slot0.is_in_collect = false
			slot1 = slot0.resour_collect:getChildByName("container")
			slot0.resources_progress = slot1:getChildByName("progress")
			slot0.resources_time_label = slot1:getChildByName("time_container"):getChildByName("time_label")

			UITool.SetDarkColor(slot0.resources_time_label)

			slot3 = slot0.resour_collect:getChildByName("resources_model")
			slot0.resources_box = createEffectSpine(PathTool.getEffectRes(282), cc.p(-360, 0), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot3:addChild(slot0.resources_box)
			slot3:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playButtonSound2()

					if uv0.resources_action == PlayerAction.action then
						message(TI18N("需要累积一定收益才能领取噢~"))
					else
						if uv0.is_in_collect == true then
							return
						end

						uv0.is_in_collect = true

						function slot2()
							if not uv0(uv1.resources_box) then
								slot0 = PlayerAction.action_2

								if uv1.resources_action == PlayerAction.action_3 then
									slot0 = PlayerAction.action_4
								elseif uv1.resources_action == PlayerAction.action_5 then
									slot0 = PlayerAction.action_6
								end

								uv1.resources_box:setToSetupPose()
								uv1.resources_box:setAnimation(0, slot0, false)
								delayRun(uv1.resour_collect, 1.5, function ()
									uv0.is_in_collect = false

									BattleDramaController:getInstance():requestGetHookTimeAwards()
								end)
							end
						end

						slot4 = uv0.role_vo.energy
						slot5 = uv0.role_vo.energy_max
						slot6 = 0

						if uv2:getHookAccumulateInfo() and slot3.list then
							for slot10, slot11 in pairs(slot3.list) do
								if slot11.bid == Config.ItemData.data_assets_label2id.energy then
									slot6 = slot11.num

									break
								end
							end
						end

						if slot5 < slot4 + slot6 then
							if uv0.tips_alert then
								uv0.tips_alert:close()

								uv0.tips_alert = nil
							end

							uv0.tips_alert = CommonAlert.show(string.format("当前已有<div fontcolor=#249003>%s/%s</div>远航情报，领取后超出上限部分将损失，是否确认领取？", slot4, slot5), TI18N("确定"), function ()
								uv0()

								if uv1.tips_alert then
									uv1.tips_alert:close()

									uv1.tips_alert = nil
								end
							end, TI18N("取消"), function ()
								uv0.is_in_collect = false

								if uv0.tips_alert then
									uv0.tips_alert:close()

									uv0.tips_alert = nil
								end
							end, CommonAlert.type.rich, nil, nil, 24)
						else
							slot2()
						end
					end
				end
			end)

			slot0.resources_action = PlayerAction.action

			slot0:updateResourceCollect()
		end

		slot0:updateNextBtnStatus(slot0.model:getDramaData())
		slot0:updateDramaDropInfo()
		slot0:updateBtnLayerStatus(slot0.btn_layout_status)
	end
end

function BttleTopDramaView.playResourceCollect(slot0, slot1, slot2)
	if not slot0.resour_collect or uv0(slot0.resour_collect) then
		return
	end

	if slot0.fly_item_sum and slot0.fly_item_sum >= 30 then
		return
	end

	if slot0.fly_item_list and #slot0.fly_item_list >= 30 then
		return
	end

	slot3 = slot0.btn_layout:convertToNodeSpace(cc.p(slot1, slot2))
	slot4 = slot0.btn_layout:convertToNodeSpace(slot0.resour_collect:convertToWorldSpace(cc.p(0, 0)))

	if slot0.fly_item_list == nil then
		slot0.fly_item_list = {}
	end

	if slot0.fly_cache_item_list == nil then
		slot0.fly_cache_item_list = {}
	end

	for slot9 = 1, math.random(10, 11) do
		slot13 = PathTool.getResFrame("battledrama", "battledrama_resoure_" .. math.random(1, 4))
		slot14 = {
			item = createSprite(slot13, (1 - math.random(0, 2)) * math.random(0, 40) + slot3.x, (1 - math.random(0, 2)) * math.random(0, 40) + slot3.y, slot0.btn_layout, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 999),
			res_id = slot13
		}

		if #slot0.fly_cache_item_list == 0 then
			-- Nothing
		else
			slot14 = uv1(slot0.fly_cache_item_list, 1)
		end

		if slot14.item and slot14.res_id then
			slot14.item:setScale(1)
			slot14.item:setVisible(true)
			slot14.item:setPosition(slot10, slot11)

			if slot14.res_id ~= slot13 then
				slot14.res_id = slot13

				loadSpriteTexture(slot14.item, slot13, LOADTEXT_TYPE_PLIST)
			end

			uv2(slot0.fly_item_list, slot14)
		end
	end

	if slot0.fly_timer == nil then
		slot0.fly_timer = GlobalTimeTicket:getInstance():add(function ()
			if uv0.fly_item_list == nil or next(uv0.fly_item_list) == nil then
				uv0:clearFlyTimer()

				return
			end

			slot0 = table.remove(uv0.fly_item_list, 1)
			slot1, slot2 = slot0.item:getPosition()
			uv0.fly_item_sum = uv0.fly_item_sum + 1

			uv0:flyEnergyToWealth(slot0, cc.p(slot1, slot2), uv1, #uv0.fly_item_list + 1)
		end, 0.01)
	end
end

function BttleTopDramaView.flyEnergyToWealth(slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil or uv0(slot1.item) then
		return
	end

	slot6 = cc.p(slot2.x, slot2.y)

	table.insert({}, slot6)

	slot8 = cc.pMidpoint(slot6, cc.p(slot3.x + 55, slot3.y + 55))
	slot9 = 10
	slot10 = -30

	if slot4 % 2 == 0 then
		slot9 = math.random(100, 150)
		slot10 = 30
	end

	table.insert(slot5, cc.p(slot8.x + slot10, slot6.y - slot9))
	table.insert(slot5, slot7)
	slot1.item:runAction(cc.Spawn:create(cc.ScaleTo:create(1, 0.2), cc.Sequence:create(cc.BezierTo:create(1, slot5), cc.CallFunc:create(function ()
		uv0.item:setVisible(false)

		uv1.fly_item_sum = uv1.fly_item_sum - 1

		uv2(uv1.fly_cache_item_list, uv0)
	end))))
end

function BttleTopDramaView.clearAllFlyItemList(slot0)
	if slot0.fly_item_list and slot0.fly_cache_item_list then
		for slot4 = #slot0.fly_item_list, 1, -1 do
			slot5 = table.remove(slot0.fly_item_list, 1)

			slot5.item:setVisible(false)
			uv0(slot0.fly_cache_item_list, slot5)
		end
	end
end

function BttleTopDramaView.clearFlyTimer(slot0)
	if slot0.fly_timer then
		GlobalTimeTicket:getInstance():remove(slot0.fly_timer)

		slot0.fly_timer = nil
	end
end

function BttleTopDramaView.updateNextBtnStatus(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = 0

	slot0:checkQuickRed()

	if not uv0(slot0.next_battle_btn) and not uv0(slot0.next_battle_time) then
		slot0.next_battle_time:setVisible(false)
		slot0.next_battle_btn:setVisible(false)

		slot0.next_battle_btn.lev_limit = 0

		if Config.DungeonData.data_drama_dungeon_info(slot1.max_dun_id) and slot3.next_id == 0 then
			slot0.next_battle_btn:setVisible(false)

			return
		end

		if slot1.status == 2 and slot1.cool_time == 0 then
			slot0.next_battle_btn:setVisible(true)

			slot2 = slot1.status

			if Config.DungeonData.data_drama_dungeon_info(slot1.dun_id) and slot5.lev_limit and (RoleController:getInstance():getRoleVo().lev or 0) < slot5.lev_limit then
				slot0.next_battle_btn.lev_limit = slot5.lev_limit

				slot0.boss_btn_notice:setVisible(true)
				slot0.boss_btn_challenge:setVisible(false)
				slot0.boss_btn_notice:setString(string.format(TI18N("%s级可挑战"), slot5.lev_limit))
			else
				slot0.boss_btn_notice:setVisible(false)
				slot0.boss_btn_challenge:setVisible(true)
			end
		elseif slot1.status == 1 and slot1.cool_time ~= 0 then
			slot2 = slot1.status

			slot0.next_battle_time:setVisible(true)
			slot0.next_battle_btn:setVisible(false)
			slot0:updateCoolTimer(slot1.cool_time)
		elseif slot1.status == 3 then
			slot2 = slot1.status

			slot0.next_battle_btn:setVisible(true)
			slot0.boss_btn_notice:setVisible(true)
			slot0.boss_btn_challenge:setVisible(false)
			slot0.boss_btn_notice:setString(TI18N("前往下一章"))
		end

		slot0.next_battle_btn.battle_status = slot2
	end
end

function BttleTopDramaView.updateCoolTimer(slot0, slot1)
	if uv0(slot0.next_battle_time_label) then
		return
	end

	if slot1 ~= 0 and slot1 then
		if not slot0.cool_timer then
			slot0.battl_cool_timer = 0

			slot0.next_battle_time_label:setString(TimeTool.GetMinSecTime(slot1 - GameNet:getInstance():getTime()))

			slot0.cool_timer = GlobalTimeTicket:getInstance():add(function ()
				uv0.battl_cool_timer = uv1 - GameNet:getInstance():getTime()

				if (uv0.battl_cool_timer or 0) >= 1 and slot0 ~= nil then
					if not uv2(uv0.next_battle_time_label) then
						uv0.next_battle_time_label:setString(TimeTool.GetMinSecTime(slot0))
					end
				else
					uv0:clearCoolTimer()
				end
			end, 1, 0)
		end
	else
		slot0:clearCoolTimer()
	end
end

function BttleTopDramaView.clearCoolTimer(slot0)
	if slot0.cool_timer then
		GlobalTimeTicket:getInstance():remove(slot0.cool_timer)

		slot0.cool_timer = nil
	end
end

function BttleTopDramaView.checkQuickRed(slot0)
	if uv0:getDramaData() == nil then
		return
	end

	if not uv1(slot0.quick_battle_btn) then
		slot3 = false

		if Config.DungeonData.data_drama_const.fast_combat_first.val <= slot1.max_dun_id then
			slot3 = true
		end

		if slot0.quick_battle_status ~= slot3 then
			slot0.quick_battle_status = slot3

			if slot3 then
				setChildUnEnabled(false, slot0.quick_battle_btn)
				slot0.quick_battle_label:setTextColor(cc.c4b(255, 255, 255, 255))
				slot0.quick_battle_label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
			else
				setChildUnEnabled(true, slot0.quick_battle_btn)
				slot0.quick_battle_label:setTextColor(Config.ColorData.data_color4[1])
				slot0.quick_battle_label:enableOutline(cc.c4b(73, 73, 73, 255), 2)
			end
		end

		if uv0:getOpenQuickBattleStatus() == false then
			slot4 = uv0:getQuickData()

			if slot3 == true and (slot4 and slot4.fast_combat_num == 0 or BackpackController:getInstance():getModel():getBackPackItemNumByBid(Config.DungeonData.data_drama_const.quick_swap_item.val) > 0) then
				slot0.quick_battle_tips:setVisible(true)
			end
		else
			slot0.quick_battle_tips:setVisible(false)
		end
	end
end

function BttleTopDramaView.updateDramaDropInfo(slot0)
	if slot0.drama_reward_layout and not uv0(slot0.drama_reward_layout) then
		if uv1:getDramaData() == nil then
			return
		end

		slot2 = nil

		if ((slot0.cur_drama_max_id or slot1.max_dun_id ~= 0 or Config.DungeonData.data_drama_dungeon_info(10010)) and Config.DungeonData.data_drama_dungeon_info(slot0.drama_data.dun_id)) == nil then
			return
		end

		slot0.drama_title_pass:setString(string.format("%s", slot2.name))
		slot0.desc_label:setString(slot2.drama_content or "《ONE PIECE》")

		if Config.UnitData.data_unit(slot2.unit_id) then
			slot0.image_boss:loadTexture(PathTool.getHeadIconJpg("b" .. Config.UnitData.data_unit(slot3.boss_id).head_icon), LOADTEXT_TYPE)
		end

		if slot0.scroll_size.height < slot0.desc_label:getContentSize().height then
			slot0.desc_panel:setContentSize(cc.size(slot0.desc_panel_size.width, slot0.desc_panel_size.height + math.min(slot4.height - slot0.scroll_size.height, 110)))
			slot0.scroll_view:setPositionY(slot0.desc_panel:getContentSize().height - 16)
		end

		slot5 = math.max(slot4.height, slot0.scroll_size.height)

		slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_size.width, slot5))
		slot0.desc_label:setPositionY(slot5)

		slot0.cur_drama_max_id = slot1.max_dun_id
		slot0.drama_item_labels = slot0.drama_item_labels or {}

		for slot9, slot10 in ipairs(slot0.drama_item_labels) do
			slot10:setVisible(false)
		end

		slot7 = 30
		slot8 = 0

		for slot12, slot13 in ipairs(slot2.per_hook_items) do
			if slot0.drama_item_labels[slot12] == nil then
				slot14 = createRichLabel(20, cc.c3b(255, 246, 199), cc.p(0, 0), cc.p(13, (slot12 - 1) * 40 + 2), nil, nil, 180)
				slot0.drama_item_labels[slot12] = slot14

				slot0.drama_reward_layout:addChild(slot14)
			end

			slot14:setString(string.format(TI18N("<img src=%s visible=true scale=0.28 /> <div fontcolor=#ffffff outline=2,#111111>%s/m</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot13[1]).icon), slot13[2]))
			slot14:setVisible(true)
		end

		slot0.drama_item_list = slot0.drama_item_list or {}

		for slot12, slot13 in pairs(slot0.drama_item_list) do
			slot13:setVisible(false)
		end

		slot9 = slot2.hook_show_items
		slot18 = cc.size

		slot0.drama_item_scrollview:setInnerContainerSize(slot18(math.max(slot0.drama_item_scrollview:getContentSize().width, #slot9 * BackPackItem.Width * 0.5 + (#slot9 - 1) * 10), slot0.drama_item_scrollview:getContentSize().height))

		for slot18, slot19 in ipairs(slot9) do
			if slot0.init_drop_flag then
				slot0:createDramaDropItem(slot19, slot18, slot10, slot11, 5)
			else
				delayRun(slot0.drama_item_scrollview, slot18 / display.DEFAULT_FPS, function ()
					uv0:createDramaDropItem(uv1, uv2, uv3, uv4, uv5)

					uv0.init_drop_flag = true
				end)
			end
		end
	end
end

function BttleTopDramaView.createDramaDropItem(slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot0.drama_item_list[slot2] then
		slot6 = BackPackItem.new(true, true)

		slot6:setDefaultTip()
		slot6:setAnchorPoint(0, 0.5)
		slot6:setScale(slot3)
		slot0.drama_item_scrollview:addChild(slot6)

		slot0.drama_item_list[slot2] = slot6
	end

	slot6:setVisible(true)
	slot6:setPosition(slot5 + (slot2 - 1) * (BackPackItem.Width * slot3 + slot4), slot0.drama_item_scrollview:getContentSize().height / 2)
	slot6:setBaseData(slot1[1], slot1[2], true)
end

function BttleTopDramaView.updateBtnLayerStatus(slot0, slot1)
	slot0.btn_layout_status = slot1

	if slot0.btn_layout and not uv0(slot0.btn_layout) then
		slot0.btn_layout:setVisible(slot1)

		if slot0.battle_type == BattleConst.Fight_Type.Darma then
			slot0.btn_layout:setVisible(true)

			if slot0.resour_collect then
				slot0.resour_collect:setVisible(slot1)
			end

			if slot0.next_battle_btn then
				slot0.next_battle_btn:setVisible(slot1)

				if slot0.next_battle_btn.battle_status == 1 then
					slot0.next_battle_btn:setVisible(false)
				end
			end

			if slot0.encounter_btn then
				slot0.encounter_btn:setVisible(slot1)
			end

			if slot0.drama_reward_layout then
				slot0.drama_reward_layout:setVisible(slot1)
			end

			if slot0.quick_battle_btn then
				slot0.quick_battle_btn:setVisible(slot1)
			end

			if slot0.hallows_layout then
				slot0.hallows_layout:setVisible(slot1)
			end

			if slot0.boss_btn_challenge_effect then
				slot0.boss_btn_challenge_effect:setVisible(slot1)
			end
		else
			slot0.btn_layout:setVisible(slot1)
		end
	end
end

function BttleTopDramaView.updataZhenfaInfo(slot0, slot1, slot2)
	if slot1 == true then
		if slot2.formation == nil then
			return
		end

		slot3 = {
			[slot8.group] = {
				slot8.formation_type or 1,
				slot8.formation_lev or 0
			}
		}

		for slot7, slot8 in pairs(slot2.formation) do
			-- Nothing
		end

		if slot3[1] == nil or slot3[2] == nil or slot3[1][1] == nil or slot3[1][2] == nil or slot3[2][1] == nil or slot3[2][2] == nil then
			return
		end

		if slot0.btn_layout and not uv0(slot0.btn_layout) then
			if uv0(slot0.form_view) then
				slot0.form_view = createCSBNote(PathTool.getTargetCSB("battle/battle_form_view"))

				slot0.form_view:setAnchorPoint(cc.p(0.5, 0))
				slot0.btn_layout:addChild(slot0.form_view, 999)
				slot0.form_view:setPosition(0, 308)

				slot0.left_btn = slot0.form_view:getChildByName("left_btn")
				slot0.left_form_icon = slot0.left_btn:getChildByName("icon")
				slot0.right_btn = slot0.form_view:getChildByName("right_btn")
				slot0.right_form_icon = slot0.right_btn:getChildByName("icon")
				slot0.buff_btn = slot0.form_view:getChildByName("buff_btn")

				slot0.buff_btn:setOpacity(0)
				slot0.buff_btn:runAction(cc.FadeIn:create(0.7))
				registerButtonEventListener(slot0.buff_btn, function ()
					slot0 = uv0.actor_role_name
					slot1 = uv0.target_role_name

					if uv1:getModel():getGroup() == BattleGroupTypeConf.TYPE_GROUP_ENEMY and not uv1:getWatchReplayStatus() then
						slot0 = uv0.target_role_name
						slot1 = uv0.actor_role_name
					end

					uv1:openBattleBuffInfoView(true, slot0, slot1)
				end, true)

				slot0.round_label = slot0.form_view:getChildByName("image_2"):getChildByName("round_label")
				slot0.left_name_panel = slot0.form_view:getChildByName("left_name_panel")
				slot0.right_name_panel = slot0.form_view:getChildByName("right_name_panel")
				slot0.left_name_label = slot0.left_name_panel:getChildByName("left_name_label")
				slot0.right_name_label = slot0.right_name_panel:getChildByName("right_name_label")
				slot0.left_camp_btn = slot0.form_view:getChildByName("left_camp_btn")
				slot0.right_camp_btn = slot0.form_view:getChildByName("right_camp_btn")
			end

			if not uv0(slot0.form_view) then
				loadSpriteTexture(slot0.left_form_icon, PathTool.getResFrame("battle", "battle_form_icon_" .. slot3[1][1]), LOADTEXT_TYPE_PLIST)
				loadSpriteTexture(slot0.right_form_icon, PathTool.getResFrame("battle", "battle_form_icon_" .. slot3[2][1]), LOADTEXT_TYPE_PLIST)
			end

			slot5 = 0
			slot6 = 0

			for slot10, slot11 in pairs(slot2.halo_list or {}) do
				if slot11.group == 1 then
					slot5 = slot11.type
				elseif slot11.group == 2 then
					slot6 = slot11.type
				end
			end

			slot7 = {}
			slot8 = {}

			if slot5 < 100 then
				slot7 = BattleConst.Old_Halo_Id_Change[slot5] or {}
			else
				slot10 = math.floor(slot5 % 10000 / 100)
				slot11 = slot5 % 100

				if math.floor(slot5 / 10000) > 0 then
					uv2(slot7, slot9)
				end

				if slot10 > 0 then
					uv2(slot7, slot10)
				end

				if slot11 > 0 then
					uv2(slot7, slot11)
				end
			end

			if slot6 < 100 then
				slot8 = BattleConst.Old_Halo_Id_Change[slot6] or {}
			else
				slot10 = math.floor(slot6 % 10000 / 100)
				slot11 = slot6 % 100

				if math.floor(slot6 / 10000) > 0 then
					uv2(slot8, slot9)
				end

				if slot10 > 0 then
					uv2(slot8, slot10)
				end

				if slot11 > 0 then
					uv2(slot8, slot11)
				end
			end

			if not uv0(slot0.left_camp_btn) then
				slot9 = PathTool.getCampGroupIcon(1000)

				if BattleController:getInstance():getModel():getCampIconConfigByIds(slot7) and slot10.icon then
					slot9 = PathTool.getCampGroupIcon(slot10.icon)

					if not slot0.left_camp_effect then
						slot11 = slot0.left_camp_btn:getContentSize()
						slot0.left_camp_effect = createImage(slot0.left_camp_btn, PathTool.getResFrame("common", "common_1101"), slot11.width / 2, slot11.height / 2, cc.p(0.5, 0.5), true)

						slot0.left_camp_effect:setScale(0.8)
					end

					slot0:updateCampEffect(true, slot0.left_camp_effect)
					addCountForCampIcon(slot0.left_camp_btn, slot10.nums)
				else
					slot0:updateCampEffect(false, slot0.left_camp_effect)
					addCountForCampIcon(slot0.left_camp_btn)
				end

				slot0.left_halo_load = loadImageTextureFromCDN(slot0.left_camp_btn, slot9, ResourcesType.single, slot0.left_halo_load)

				registerButtonEventListener(slot0.left_camp_btn, function ()
					uv0:openBattleCampView(true, uv1)
				end, true, nil, nil, 0.85)
			end

			if not uv0(slot0.right_camp_btn) then
				slot9 = PathTool.getCampGroupIcon(1000)

				if BattleController:getInstance():getModel():getCampIconConfigByIds(slot8) and slot10.icon then
					slot9 = PathTool.getCampGroupIcon(slot10.icon)

					if not slot0.right_camp_effect then
						slot11 = slot0.right_camp_btn:getContentSize()
						slot0.right_camp_effect = createImage(slot0.right_camp_btn, PathTool.getResFrame("common", "common_1101"), slot11.width / 2, slot11.height / 2, cc.p(0.5, 0.5), true)

						slot0.right_camp_effect:setScale(0.8)
					end

					slot0:updateCampEffect(true, slot0.right_camp_effect)
					addCountForCampIcon(slot0.right_camp_btn, slot10.nums)
				else
					slot0:updateCampEffect(false, slot0.right_camp_effect)
					addCountForCampIcon(slot0.right_camp_btn)
				end

				slot0.right_halo_load = loadImageTextureFromCDN(slot0.right_camp_btn, slot9, ResourcesType.single, slot0.right_halo_load)

				registerButtonEventListener(slot0.right_camp_btn, function ()
					uv0:openBattleCampView(true, uv1)
				end, true, nil, nil, 0.85)
			end

			slot9 = slot2.actor_role_name
			slot10 = slot2.target_role_name

			if uv1:getModel():getGroup() == BattleGroupTypeConf.TYPE_GROUP_ENEMY and not uv1:getWatchReplayStatus() then
				slot9 = slot2.target_role_name
				slot10 = slot2.actor_role_name
			end

			if slot9 then
				slot0.left_name_label:setString(slot9)
			end

			if slot10 then
				slot0.right_name_label:setString(slot10)
			end
		end
	else
		slot0:updateCampEffect(false, slot0.left_camp_effect)
		slot0:updateCampEffect(false, slot0.right_camp_effect)

		if slot0.form_view and not uv0(slot0.form_view) then
			slot0.form_view:removeAllChildren()
			slot0.form_view:removeFromParent()

			slot0.form_view = nil
			slot0.left_camp_effect = nil
			slot0.right_camp_effect = nil
		end
	end
end

function BttleTopDramaView.updateRound(slot0, slot1)
	if Config.CombatTypeData.data_fight_list == nil or slot2[slot0.battle_type] == nil then
		return
	end

	if not uv0(slot0.round_label) then
		slot0.round_label:setString(string.format(TI18N("第%d/%d回合"), slot1, slot2[slot0.battle_type].max_action_count or 0))
	end
end

function BttleTopDramaView.updateCampEffect(slot0, slot1, slot2)
	if not slot2 or uv0(slot2) then
		return
	end

	if slot1 == true then
		slot2:setVisible(true)
		slot2:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeIn:create(0.6), cc.FadeOut:create(0.6))))
	else
		doStopAllActions(slot2)
		slot2:setVisible(false)
	end
end

function BttleTopDramaView.updateDramaHallows(slot0)
	if not uv0(slot0.btn_layout) then
		slot1 = HallowsController:getInstance():getModel()

		if HallowsController:getInstance():checkIsOpen() and not slot1:checkIsHaveAllHallows() then
			slot3 = cc.size(160, 200)

			if not slot0.hallows_layout then
				slot0.hallows_layout = ccui.Layout:create()

				slot0.hallows_layout:setName("hallows_stage")
				slot0.hallows_layout:setContentSize(slot3)
				slot0.hallows_layout:setPosition(cc.p(-slot0.main_size.width / 2 + slot3.width / 2, slot0.main_size.height / 2 + 160))
				slot0.hallows_layout:setAnchorPoint(cc.p(0.5, 0.5))
				slot0.hallows_layout:setTouchEnabled(true)
				slot0.btn_layout:addChild(slot0.hallows_layout)
				slot0.hallows_layout:addTouchEventListener(function (slot0, slot1)
					if slot1 == ccui.TouchEventType.ended then
						playCloseSound()
						MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.hallows)
					end
				end)
			end

			slot4 = slot1:getCurActivityHallowsId()

			if not slot0.cur_hallows_id or slot0.cur_hallows_id ~= slot4 then
				slot0.cur_hallows_id = slot4

				if slot0.drama_hallows_model then
					slot0.drama_hallows_model:clearTracks()
					slot0.drama_hallows_model:removeFromParent()

					slot0.drama_hallows_model = nil
				end

				if Config.HallowsData.data_base[slot4] then
					slot0.drama_hallows_model = createEffectSpine(slot5.c_res_id, cc.p(slot3.width / 2, 100), cc.p(0.5, 0.5), true, PlayerAction.action_2)

					slot0.drama_hallows_model:setScale(0.4)
					slot0.hallows_layout:addChild(slot0.drama_hallows_model, 2)
				end
			end

			if not slot0.hallows_progress_bg then
				slot0.hallows_progress_bg = createImage(slot0.hallows_layout, PathTool.getResFrame("battledrama", "battledrama_1036"), slot3.width / 2, 30, cc.p(0.5, 0.5), true, nil, true)

				slot0.hallows_progress_bg:setContentSize(cc.size(130, 22))

				slot0.hallows_progress = ccui.LoadingBar:create()

				slot0.hallows_progress:setAnchorPoint(cc.p(0.5, 0.5))
				slot0.hallows_progress:loadTexture(PathTool.getResFrame("battledrama", "battledrama_1037"), LOADTEXT_TYPE_PLIST)
				slot0.hallows_progress:setPosition(cc.p(slot3.width / 2, 27))
				slot0.hallows_layout:addChild(slot0.hallows_progress)

				slot5 = createImage(slot0.hallows_layout, PathTool.getResFrame("battledrama", "battledrama_1035"), slot3.width / 2, 30, cc.p(0.5, 0.5), true)
				slot0.hallows_progress_txt = createLabel(20, 1, cc.c3b(79, 37, 0), slot3.width / 2, 30, "", slot0.hallows_layout, nil, cc.p(0.5, 0.5))
			end

			if HallowsController:getInstance():getModel():getHallowsTaskList(slot0.cur_hallows_id) then
				slot6 = tableLen(slot5)

				for slot11, slot12 in pairs(slot5) do
					if slot12.finish == 2 then
						slot7 = 0 + 1
					end
				end

				slot0.hallows_progress:setPercent(100 * slot7 / slot6)
				slot0.hallows_progress_txt:setString(slot7 .. "/" .. slot6)
			end

			slot0:updateHallowsRedStatus()
		else
			if slot0.drama_hallows_model then
				slot0.drama_hallows_model:clearTracks()
				slot0.drama_hallows_model:removeFromParent()

				slot0.drama_hallows_model = nil
			end

			if slot0.hallows_layout then
				slot0.hallows_layout:removeAllChildren()
				slot0.hallows_layout:removeFromParent()

				slot0.hallows_layout = nil
			end

			if slot0.update_hallows_red_status then
				GlobalEvent:getInstance():UnBind(slot0.update_hallows_red_status)

				slot0.update_hallows_red_status = nil
			end
		end
	end
end

function BttleTopDramaView.updateHallowsRedStatus(slot0)
	addRedPointToNodeByStatus(slot0.hallows_layout, HallowsController:getInstance():getModel():checkRedIsShowByRedType(HallowsConst.Red_Index.task_award), 0, -135)
end

function BttleTopDramaView.DeleteMe(slot0)
	slot0:clearCoolTimer()
	slot0:clearFlyTimer()
	slot0:updataZhenfaInfo(false)

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.left_halo_load then
		slot0.left_halo_load:DeleteMe()

		slot0.left_halo_load = nil
	end

	if slot0.right_halo_load then
		slot0.right_halo_load:DeleteMe()

		slot0.right_halo_load = nil
	end

	if slot0.tips_alert then
		slot0.tips_alert:close()

		slot0.tips_alert = nil
	end

	if not uv0(slot0.btn_layout) then
		if slot0.drama_hallows_model then
			slot0.drama_hallows_model:clearTracks()
			slot0.drama_hallows_model:removeFromParent()

			slot0.drama_hallows_model = nil
		end

		if slot0.drama_item_list then
			for slot4, slot5 in pairs(slot0.drama_item_list) do
				slot5:DeleteMe()

				slot5 = nil
			end

			slot0.drama_item_list = {}
		end

		slot0.btn_layout:removeAllChildren()

		slot0.btn_layout = nil
	end

	if not tolua.isnull(slot0.online_gift_node) then
		doStopAllActions(slot0.online_gift_node.label)
	end

	if slot0.time_ticket then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end

	if slot0.map_name_container and not uv0(slot0.map_name_container) then
		doStopAllActions(slot0.map_name_container)
		slot0.map_name_container:removeAllChildren()

		slot0.map_name_container = nil
	end

	uv1:setDramaStatus(false)

	if slot0.update_drama_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_drama_data_event)

		slot0.update_drama_data_event = nil
	end

	if slot0.update_drama_top_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_drama_top_data_event)

		slot0.update_drama_top_data_event = nil
	end

	if slot0.update_drama_max_id_event then
		GlobalEvent:getInstance():UnBind(slot0.update_drama_max_id_event)

		slot0.update_drama_max_id_event = nil
	end

	if slot0.battle_exit_event then
		GlobalEvent:getInstance():UnBind(slot0.battle_exit_event)

		slot0.battle_exit_event = nil
	end

	if slot0.update_drama_reward_event then
		GlobalEvent:getInstance():UnBind(slot0.update_drama_reward_event)

		slot0.update_drama_reward_event = nil
	end

	if slot0.update_drama_quick_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_drama_quick_data_event)

		slot0.update_drama_quick_data_event = nil
	end

	if slot0.update_function_status_event then
		GlobalEvent:getInstance():UnBind(slot0.update_function_status_event)

		slot0.update_function_status_event = nil
	end

	slot0:clearOnlineInfo()

	if slot0.task_icon_vo then
		if slot0.task_icon_event then
			slot0.task_icon_vo:UnBind(slot0.task_icon_event)

			slot0.task_icon_event = nil
		end

		slot0.task_icon_vo = nil
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	if slot0.update_hallows_task_event then
		GlobalEvent:getInstance():UnBind(slot0.update_hallows_task_event)

		slot0.update_hallows_task_event = nil
	end

	if slot0.update_drama_hallows_event then
		GlobalEvent:getInstance():UnBind(slot0.update_drama_hallows_event)

		slot0.update_drama_hallows_event = nil
	end

	if slot0.update_hallows_red_status then
		GlobalEvent:getInstance():UnBind(slot0.update_hallows_red_status)

		slot0.update_hallows_red_status = nil
	end

	if slot0.update_hookaccumulatetime_event then
		GlobalEvent:getInstance():UnBind(slot0.update_hookaccumulatetime_event)

		slot0.update_hookaccumulatetime_event = nil
	end

	if slot0.update_onlinegift_event then
		GlobalEvent:getInstance():UnBind(slot0.update_onlinegift_event)

		slot0.update_onlinegift_event = nil
	end

	if slot0.update_online_get_event then
		GlobalEvent:getInstance():UnBind(slot0.update_online_get_event)

		slot0.update_online_get_event = nil
	end

	if slot0.update_voyage_red_event then
		GlobalEvent:getInstance():UnBind(slot0.update_voyage_red_event)

		slot0.update_voyage_red_event = nil
	end

	if slot0.update_encounter_red_event then
		GlobalEvent:getInstance():UnBind(slot0.update_encounter_red_event)

		slot0.update_encounter_red_event = nil
	end

	if slot0.main_point_list then
		for slot4, slot5 in pairs(slot0.main_point_list) do
			if slot5 then
				slot5:DeleteMe()
			end
		end
	end

	if slot0.effect then
		slot0.effect:runAction(cc.RemoveSelf:create(true))

		slot0.effect = nil
	end

	doStopAllActions(slot0.top_info_container)
	doStopAllActions(slot0.root_wnd)

	if slot0.map_resources_load then
		slot0.map_resources_load:DeleteMe()

		slot0.map_resources_load = nil
	end

	if slot0.btn_load_1 then
		slot0.btn_load_1:DeleteMe()

		slot0.btn_load_1 = nil
	end

	if slot0.load_map_icon then
		slot0.load_map_icon:DeleteMe()

		slot0.load_map_icon = nil
	end

	if not uv0(slot0.root) then
		slot0.root:removeAllChildren()
		slot0.root:removeFromParent()
	end

	if slot0 then
		slot0:removeAllChildren()
		slot0:removeFromParent()
	end
end
