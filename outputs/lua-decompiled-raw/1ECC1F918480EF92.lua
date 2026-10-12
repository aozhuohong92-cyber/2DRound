BattlDramaDropWindow = BattlDramaDropWindow or BaseClass(BaseView)
slot0 = BattleDramaController:getInstance()

function BattlDramaDropWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "battledrama/battle_drama_drop_windows"
	slot0.panel_list = {}
	slot0.tab_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battledrop", "battledrop"),
			type = ResourcesType.plist
		}
	}
	slot0.tab_array = {
		{
			index = 1,
			label = TI18N("Boss掉落")
		},
		{
			index = 2,
			label = TI18N("挂机掉落")
		}
	}
	slot0.cur_tab = nil
	slot0.cur_index = nil
end

function BattlDramaDropWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("root")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.back_container = slot0.main_container:getChildByName("back_container")
	slot0.world_btn = slot0.main_container:getChildByName("world_btn")

	slot0.world_btn:setVisible(false)

	slot0.tableContainer = slot0.main_container:getChildByName("tab_container")
	slot1, slot2, slot3 = nil

	for slot7 = 1, #slot0.tab_array do
		slot1 = slot0.tableContainer:getChildByName(string.format("tab_btn_%s", slot7))
		slot1.select_bg = slot1:getChildByName("select_bg")

		slot1.select_bg:setVisible(false)

		slot1.unselect_bg = slot1:getChildByName("unselect_bg")
		slot1.label = slot1:getChildByName("title")

		slot1:setBright(false)
		slot1.label:setTextColor(cc.c4b(207, 181, 147, 255))

		slot2 = slot0.tab_array[slot7].index
		slot1.type = slot2

		slot1.label:setString(slot0.tab_array[slot7].label)

		slot0.tab_list[slot2] = slot1
	end

	slot0:updateSwapNum()
end

function BattlDramaDropWindow.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openDramDropWindows(false)
			end
		end)
	end

	if slot0.world_btn then
		slot0.world_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				WorldmapController:getInstance():openWorldMapMainWindow(true)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openDramDropWindows(false)
			end
		end)
	end

	if slot0.tab_list then
		for slot4, slot5 in pairs(slot0.tab_list) do
			slot5:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()

					if uv0.type ~= nil then
						uv1:changeTabView(uv0.type)
					end
				end
			end)
		end
	end

	if not slot0.update_dram_boss_data_event then
		slot0.update_dram_boss_data_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Boss_Update_Data, function ()
			slot0 = BackpackController:getInstance():getModel():getBackPackItemNumByBid(Config.DungeonData.data_drama_const.swap_item.val)

			uv0:updateSwapNum()
		end)
	end

	if not slot0.update_dram_boss_swap_event then
		slot0.update_dram_boss_swap_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Quick_Battle_Data, function ()
			uv0:updateSwapNum()
		end)
	end
end

function BattlDramaDropWindow.updateSwapNum(slot0)
end

function BattlDramaDropWindow.openRootWnd(slot0, slot1, slot2)
	slot0.max_dun_id = slot1

	slot0:changeTabView(slot2 or 1)
end

function BattlDramaDropWindow.changeTabView(slot0, slot1)
	if slot0.cur_index and slot0.cur_index == slot1 then
		return
	end

	if slot0.cur_tab ~= nil then
		if slot0.cur_tab.label then
			slot0.cur_tab.label:setTextColor(cc.c4b(207, 181, 147, 255))
		end

		slot0.cur_tab.select_bg:setVisible(false)
	end

	slot0.cur_tab = slot0.tab_list[slot1]

	if slot0.cur_tab ~= nil then
		if slot0.cur_tab.label then
			slot0.cur_tab.label:setTextColor(cc.c4b(255, 237, 214, 255))
		end

		slot0.cur_tab.select_bg:setVisible(true)
	end

	if slot0.cur_panel ~= nil then
		slot0.cur_panel:setVisibleStatus(false)

		slot0.cur_panel = nil
	end

	if slot0.panel_list[slot1] == nil then
		if slot1 == BattleShowRewardConst.Boss then
			slot2 = BattleDramaDropBossTipsWindow.new(slot0.max_dun_id)
		elseif slot1 == BattleShowRewardConst.Hook then
			slot2 = BattlDramaDropTipsWindow.new(slot0.max_dun_id)
		end

		slot0.panel_list[slot1] = slot2

		if slot2 ~= nil then
			slot0.main_container:addChild(slot2)
		end
	end

	if slot2 ~= nil then
		slot2:setVisibleStatus(true)

		slot0.cur_panel = slot2
		slot0.cur_index = slot1
	end
end

function BattlDramaDropWindow.close_callback(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5 then
				slot5:DeleteMe()

				slot5 = nil
			end
		end
	end

	if slot0.modify_add_event then
		GlobalEvent:getInstance():UnBind(slot0.modify_add_event)

		slot0.modify_add_event = nil
	end

	if slot0.update_dram_boss_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_dram_boss_data_event)

		slot0.update_dram_boss_data_event = nil
	end

	if slot0.add_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.add_goods_event)

		slot0.add_goods_event = nil
	end

	if slot0.update_dram_boss_swap_event then
		GlobalEvent:getInstance():UnBind(slot0.update_dram_boss_swap_event)

		slot0.update_dram_boss_swap_event = nil
	end

	if slot0.panel_list and next(slot0.panel_list or {}) ~= nil then
		for slot4, slot5 in pairs(slot0.panel_list) do
			if slot5 then
				slot5:DeleteMe()
			end
		end
	end

	slot0.panel_list = {}
	slot0.item_list = {}

	uv0:openDramDropWindows(false)
end
