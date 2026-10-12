BattlDramaBossInfoWindow = BattlDramaBossInfoWindow or BaseClass(BaseView)
slot0 = BattleDramaController:getInstance()
slot1 = BattleDramaController:getInstance():getModel()

function BattlDramaBossInfoWindow.__init(slot0, slot1)
	slot0.dungeon_data = slot1
	slot0.layout_name = "battledrama/battle_darma_boos_info_windows"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_5"),
			type = ResourcesType.single
		}
	}
	slot0.swap_status = 0
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.item_list = {}
end

function BattlDramaBossInfoWindow.open_callback(slot0)
	slot0.panel_bg = slot0.root_wnd:getChildByName("Panel_bg")
	slot0.background = slot0.panel_bg:getChildByName("background")

	slot0.panel_bg:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("root")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.ack_button = slot0.main_container:getChildByName("ack_button")
	slot0.window_title_label = slot0.main_container:getChildByName("window_title_label")

	slot0.window_title_label:setString(TI18N("关卡信息"))

	slot0.dungeon_name = slot0.main_container:getChildByName("dungeon_name")
	slot0.boss_name_desc = slot0.main_container:getChildByName("boss_name_desc")

	slot0.boss_name_desc:setString(TI18N("BOSS:"))

	slot0.boss_name = slot0.main_container:getChildByName("boss_name")
	slot0.diffcult_label_desc = slot0.main_container:getChildByName("diffcult_label_desc")

	slot0.diffcult_label_desc:setString(TI18N("战斗力:"))

	slot0.diffcult_label = slot0.main_container:getChildByName("diffcult_label")
	slot0.item_container = slot0.main_container:getChildByName("item_container")
	slot0.title_label = slot0.item_container:getChildByName("title_label")

	slot0.title_label:setString(TI18N("可能掉落"))

	slot0.item_scroolview = slot0.item_container:getChildByName("item_scroolview")

	slot0.item_scroolview:setScrollBarEnabled(false)

	slot0.role_bg = slot0.main_container:getChildByName("role_bg")

	if slot0.role_bg ~= nil then
		loadSpriteTexture(slot0.role_bg, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_5"), LOADTEXT_TYPE)
	end

	slot0.swap_label = createRichLabel(24, 117, cc.p(0, 0.5), cc.p(70, 370), nil, , 1000)

	slot0.main_container:addChild(slot0.swap_label)
	slot0.swap_label:setVisible(false)

	slot0.swap_num_label = createRichLabel(26, 117, cc.p(0, 0.5), cc.p(410, 685), nil, , 1000)

	slot0.main_container:addChild(slot0.swap_num_label)
	slot0.swap_num_label:setVisible(false)

	slot0.free_swap_label = createRichLabel(26, 117, cc.p(0, 0.5), cc.p(485, 330), nil, , 1000)

	slot0.free_swap_label:setString(TI18N("本次扫荡免费"))
	slot0.main_container:addChild(slot0.free_swap_label)
	slot0.free_swap_label:setVisible(false)
	slot0:updateData()
end

function BattlDramaBossInfoWindow.updateData(slot0)
	if slot0.dungeon_data then
		slot0.dungeon_name:setString(slot0.dungeon_data.info_data.name)

		slot3 = (uv0:getCurDunInfoByID(slot0.dungeon_data.info_data.id) or slot0.dungeon_data.v_data).status

		if Config.UnitData.data_unit(slot0.dungeon_data.info_data.unit_id) then
			slot0.boss_name:setString(slot1.name)
		end

		slot0.diffcult_label:setString(slot0.dungeon_data.info_data.power)

		slot4 = string.format(TI18N("<div fontColor=#020019>扫荡次数: </div><div fontColor=#249003>%s</div>/%s"), slot2.auto_num, Config.DungeonData.data_drama_const.swap_time.val)

		if Config.DungeonData.data_drama_const.swap_time.val <= slot2.auto_num then
			slot4 = string.format(TI18N("<div fontColor=#020019>扫荡次数: </div><<div fontColor=#249003>%s/%s</div>"), slot2.auto_num, Config.DungeonData.data_drama_const.swap_time.val)
		end

		slot0.swap_num_label:setString(slot4)

		slot5 = BackpackController:getInstance():getModel():getBackPackItemNumByBid(Config.DungeonData.data_drama_const.swap_item.val)
		slot6 = Config.ItemData.data_get_data(Config.DungeonData.data_drama_const.swap_item.val).icon

		slot0:updateItemReward(slot0.dungeon_data.info_data.show_items)
		slot0:updateRole(slot1.body_id)

		slot7 = BattleDramaController:getInstance():getModel():getDramaData()

		if not slot7 or Config.DungeonData.data_drama_const.swap_time.val - slot7.auto_num > 0 then
			slot0:updateBtnStatus(slot3)
			slot0:updateFreeData()
		end
	end
end

function BattlDramaBossInfoWindow.updateFreeData(slot0)
	slot0.is_free = BattleDramaController:getInstance():getModel():getDramaData().auto_num - Config.DungeonData.data_drama_const.free_swap.val < 0
end

function BattlDramaBossInfoWindow.updateBtnStatus(slot0, slot1)
	if slot1 == 3 then
		slot0.swap_status = 2
	else
		slot0.swap_status = 0

		if slot1 == 2 then
			slot0.swap_status = 1
		end
	end
end

function BattlDramaBossInfoWindow.updateRole(slot0, slot1)
	if not slot0.spine_model and slot1 ~= "" then
		slot0.spine_model = createSpineByName(slot1, PlayerAction.show)

		slot0.spine_model:setPosition(slot0.role_bg:getContentSize().width / 2, slot0.role_bg:getContentSize().height / 2 - 20)
		slot0.spine_model:setScale(0.5)
		slot0.role_bg:addChild(slot0.spine_model)
		slot0.spine_model:setAnimation(0, PlayerAction.show, true)
	end
end

function BattlDramaBossInfoWindow.updateItemReward(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = nil
	slot8 = cc.size

	slot0.item_scroolview:setInnerContainerSize(slot8(math.max(slot0.item_scroolview:getContentSize().width, BackPackItem.Width * #slot1 + #slot1 * 10), slot0.item_scroolview:getContentSize().height))

	for slot8, slot9 in ipairs(slot1) do
		if not slot0.item_list[slot8] then
			slot2 = BackPackItem.new(true, true)

			slot2:setAnchorPoint(0.5, 0.5)
			slot0.item_scroolview:addChild(slot2)

			slot0.item_list[slot8] = slot2
		end

		if slot0.item_list[slot8] then
			slot2:setPosition(BackPackItem.Width / 2 + (slot8 - 1) * (BackPackItem.Width + 10), slot0.item_scroolview:getContentSize().height / 2)

			slot10 = {
				bid = slot9[1],
				num = slot9[2]
			}

			slot2:setBaseData(slot9[1], slot9[2], true)
			slot2:setDefaultTip()
		end
	end
end

function BattlDramaBossInfoWindow.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openDramBossInfoView(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openDramBossInfoView(false)
			end
		end)
	end

	if not slot0.update_dram_boss_data_event then
		slot0.update_dram_boss_data_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Boss_Update_Data, function (slot0)
			if slot0 then
				slot1 = string.format("<div fontColor=#020019>扫荡次数: </div><div fontColor=#289b14>%s</div>/%s", slot0.auto_num, Config.DungeonData.data_drama_const.swap_time.val)

				if Config.DungeonData.data_drama_const.swap_time.val <= slot0.auto_num then
					slot1 = string.format(TI18N("<div fontColor=#020019>扫荡次数: </div> <div fontColor=#249003>%s</div><div fontColor=#249003>/%s</div>"), slot0.auto_num, Config.DungeonData.data_drama_const.swap_time.val)
				end

				uv0.swap_num_label:setString(slot1)

				slot2 = BackpackController:getInstance():getModel():getBackPackItemNumByBid(Config.DungeonData.data_drama_const.swap_item.val)
			end
		end)
	end

	if not slot0.update_dram_data_event then
		slot0.update_dram_data_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Update_Data, function (slot0)
			uv0:updateData()
		end)
	end

	if not slot0.update_drama_quick then
		slot0.update_drama_quick = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Quick_Battle_Data, function (slot0)
			uv0:updateFreeData()
		end)
	end
end

function BattlDramaBossInfoWindow.checkSwapAlert(slot0)
	if not slot0.is_free then
		if BackpackController:getInstance():getModel():getBackPackItemNumByBid(Config.DungeonData.data_drama_const.swap_item.val) <= 0 then
			slot4 = Config.DungeonData.data_swap_data[math.min(BattleDramaController:getInstance():getModel():getDramaData().auto_num + 1, tableLen(Config.DungeonData.data_swap_data))].loss

			CommonAlert.show(string.format(TI18N("扫荡券不足,是否使用<img src=%s visible=true scale=0.5 /><div fontColor=#289b14 fontsize= 26>%s</div>扫荡关卡?"), PathTool.getItemRes(slot4[1][1]), slot4[1][2]), TI18N("确定"), function ()
				if uv0.dungeon_data and uv0.dungeon_data.info_data then
					BattleDramaController:getInstance():send13005(uv0.dungeon_data.info_data.id, 1)
				end
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		else
			uv0:openDramSwapView(true, slot0.dungeon_data.info_data.id)
		end
	elseif slot0.dungeon_data and slot0.dungeon_data.info_data then
		BattleDramaController:getInstance():send13005(slot0.dungeon_data.info_data.id, 1)
	end
end

function BattlDramaBossInfoWindow.openRootWnd(slot0, slot1)
end

function BattlDramaBossInfoWindow.close_callback(slot0)
	if slot0.update_dram_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_dram_data_event)

		slot0.update_dram_data_event = nil
	end

	if slot0.update_drama_quick then
		GlobalEvent:getInstance():UnBind(slot0.update_drama_quick)

		slot0.update_drama_quick = nil
	end

	if slot0.update_dram_boss_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_dram_boss_data_event)

		slot0.update_dram_boss_data_event = nil
	end

	uv0:openDramBossInfoView(false)
end
