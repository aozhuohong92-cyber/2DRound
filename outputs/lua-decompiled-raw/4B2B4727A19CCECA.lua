BattleDramaDropBossTipsWindow = class("BattleDramaDropBossTipsWindow", function ()
	return ccui.Widget:create()
end)

function BattleDramaDropBossTipsWindow.ctor(slot0, slot1)
	slot0.ctrl = BattleDramaController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.drama_data = slot0.model:getDramaData()
	slot0.max_dun_id = slot1 or slot0.drama_data.max_dun_id
	slot0.item_list = {}

	slot0:open_callback()
end

function BattleDramaDropBossTipsWindow.open_callback(slot0)
	slot0.scroll = createScrollView(602, 687, 59, 260, slot0, ccui.ScrollViewDir.vertical)

	slot0:createItemList()
end

function BattleDramaDropBossTipsWindow.createItemList(slot0)
	if slot0.model:getBossShowData() and next(slot1 or {}) ~= nil then
		slot0.max_height = math.max(BattleDramaDropBossItem.HEIGHT * #slot1, slot0.scroll:getContentSize().height)
		slot5 = cc.size

		slot0.scroll:setInnerContainerSize(slot5(slot0.scroll:getContentSize().width, slot0.max_height))

		slot0.sum_num = tableLen(slot1)

		for slot5, slot6 in ipairs(slot1) do
			delayRun(slot0.scroll, 0.05 * slot5, function ()
				slot0 = BattleDramaDropBossItem.new()

				slot0:setAnchorPoint(cc.p(0, 1))
				slot0:setData(uv0)
				uv1.scroll:addChild(slot0)
				slot0:setPosition(0, uv1.max_height - 3 - BattleDramaDropBossItem.HEIGHT * (uv2 - 1))

				uv1.item_list[uv2] = slot0

				slot0:addCallBack(function (slot0)
					uv0:clickOpen(slot0, uv1)
				end)

				if uv0.chapter_id == uv1.drama_data.chapter_id then
					uv1:clickOpen(slot0, uv2)
				end
			end)
		end
	end

	slot0:register_event()
end

function BattleDramaDropBossTipsWindow.clickOpen(slot0, slot1, slot2)
	if slot0.cur_select ~= nil and slot0.cur_index and slot0.cur_index ~= slot2 then
		slot0.cur_select:setSelect(false)
		slot0.cur_select:showMessagePanel(false)
	end

	slot0.cur_select = slot1
	slot0.cur_index = slot2

	if slot0.cur_select:getIsShow() then
		slot7 = cc.size

		slot0.scroll:setInnerContainerSize(slot7(slot0.scroll:getContentSize().width, slot0.max_height))

		for slot7, slot8 in pairs(slot0.item_list) do
			slot8:setPosition(0, slot0.max_height - 3 - BattleDramaDropBossItem.HEIGHT * (slot7 - 1))
		end

		slot0.cur_select:setSelect(false)
		slot0.cur_select:showMessagePanel(false)
	else
		slot0.cur_select:setSelect(true)
		slot0.cur_select:showMessagePanel(true)

		slot0.height = slot0.cur_select:getMsgPanleSize().height

		slot0:adjustPos()
	end

	slot4 = 0
	slot5 = slot0.max_height

	if slot0.height then
		slot5 = slot0.max_height + slot0.height
	end

	if slot0.cur_select then
		slot7 = (slot0.cur_index - 1) * BattleDramaDropBossItem.HEIGHT / slot0.max_height * 100

		if slot0.height then
			slot7 = (slot0.cur_index - 1) * (BattleDramaDropBossItem.HEIGHT + 13) / slot5 * 100
		end

		slot0.scroll:scrollToPercentVertical(slot7, 0.1, true)
	end
end

function BattleDramaDropBossTipsWindow.adjustPos(slot0)
	if slot0.cur_select ~= nil then
		slot6 = slot0.scroll:getContentSize().width

		slot0.scroll:setInnerContainerSize(cc.size(slot6, slot0.max_height + slot0.height))

		for slot5, slot6 in pairs(slot0.item_list) do
			if slot5 <= slot0.cur_index then
				slot6:setPosition(0, slot0.max_height + slot0.height - 3 - BattleDramaDropBossItem.HEIGHT * (slot5 - 1))
			else
				slot6:setPosition(0, slot1 - slot0.height - 3 - BattleDramaDropBossItem.HEIGHT * (slot5 - 1))
			end
		end
	end
end

function BattleDramaDropBossTipsWindow.register_event(slot0)
	if not slot0.update_dram_boss_data_event then
		slot0.update_dram_boss_data_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Boss_Update_Data, function ()
			if uv0.cur_select ~= nil then
				uv0.cur_select:updateItemList()
			end
		end)
	end

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 == BackPackConst.Bag_Code.BACKPACK then
				for slot5, slot6 in pairs(slot1) do
					if slot6 and slot6.base_id and slot6.base_id == Config.DungeonData.data_drama_const.swap_item.val and uv0.cur_select ~= nil then
						uv0.cur_select:updateItemList()
					end
				end
			end
		end)
	end
end

function BattleDramaDropBossTipsWindow.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function BattleDramaDropBossTipsWindow.DeleteMe(slot0)
	if slot0.cur_item then
		slot0.cur_item:DeleteMe()

		slot0.cur_item = nil
	end

	if slot0.update_dram_boss_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_dram_boss_data_event)

		slot0.update_dram_boss_data_event = nil
	end

	if slot0.add_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.add_goods_event)

		slot0.add_goods_event = nil
	end

	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5 then
				slot5:DeleteMe()

				slot5 = nil
			end
		end
	end

	slot0.item_list = {}
end

BattleDramaDropBossItem = class("BattleDramaDropBossItem", function ()
	return ccui.Layout:create()
end)
BattleDramaDropBossItem.WIDTH = 602
BattleDramaDropBossItem.HEIGHT = 57

function BattleDramaDropBossItem.ctor(slot0, slot1, slot2, slot3)
	slot0.size = slot3 or cc.size(BattleDramaDropBossItem.WIDTH, BattleDramaDropBossItem.HEIGHT)

	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("battledrama/battle_drama_drop_boss_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("root")
	slot0.bg = slot0.container:getChildByName("bg")
	slot0.name_label = slot0.container:getChildByName("name_label")
	slot0.arrow = slot0.container:getChildByName("arrow")
	slot0.lock_panel = slot0.container:getChildByName("lock_panel")

	slot0.lock_panel:setVisible(false)

	slot0.unlock_label = slot0.lock_panel:getChildByName("unlock_label")

	slot0.unlock_label:setString(TI18N("暂未开启"))

	slot0.item_list = {}
	slot0.is_lock = true
	slot0.drama_data = BattleDramaController:getInstance():getModel():getDramaData()

	slot0:registerEvent()
end

function BattleDramaDropBossItem.registerEvent(slot0)
	slot0:setTouchEnabled(true)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.callback then
					if uv0.is_lock == false then
						uv0:callback(uv0)
					else
						message(TI18N("通关本章后开启"))
					end
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
end

function BattleDramaDropBossItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function BattleDramaDropBossItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.drama_data = BattleDramaController:getInstance():getModel():getDramaData()
	slot0.data = slot1
	slot0.chapter_id = slot1.chapter_id

	if slot0.drama_data then
		if slot1.chapter_id <= BattleDramaController:getInstance():getModel():getOpenSumChapter(slot0.drama_data.mode) then
			slot0.is_lock = false

			slot0.lock_panel:setVisible(false)
			slot0.arrow:setVisible(true)
		else
			slot0.lock_panel:setVisible(true)
			slot0.arrow:setVisible(false)
		end
	end

	slot0.name_label:setString(TI18N("第") .. StringUtil.numToChinese(slot1.chapter_id) .. TI18N("章 ") .. slot1.name)
end

function BattleDramaDropBossItem.getIsShow(slot0)
	return slot0.is_show
end

function BattleDramaDropBossItem.setSelect(slot0, slot1)
end

function BattleDramaDropBossItem.showMessagePanel(slot0, slot1)
	slot0.is_show = slot1

	if slot1 then
		if slot0.msg_panel == nil then
			slot0:createMessagePanel()
		end

		slot0.arrow:setScale(1)
	else
		slot0.arrow:setScale(-1)
	end

	slot0.msg_panel:setVisible(slot1)
end

function BattleDramaDropBossItem.createMessagePanel(slot0)
	if slot0.msg_panel == nil then
		slot0.msg_panel = ccui.Layout:create()

		slot0.msg_panel:setAnchorPoint(0, 1)
		slot0.container:addChild(slot0.msg_panel)
	end

	slot1 = {}
	slot2 = {}

	if Config.DungeonData.data_drama_boss_show_reward then
		slot3 = slot0.drama_data.max_dun_id

		if slot0.chapter_id and Config.DungeonData.data_drama_boss_show_reward[slot0.chapter_id] then
			slot5 = BattleDramaController:getInstance():getModel():getHasCurChapterPassListBossNum(slot0.drama_data.mode, slot0.chapter_id)
			slot6 = 0

			if Config.DungeonData.data_drama_boss_show_reward[slot0.chapter_id] then
				for slot10, slot11 in pairs(slot4) do
					table.insert(slot1, slot11)
				end
			end

			table.sort(slot1, function (slot0, slot1)
				return slot0.dungeon_id < slot1.dungeon_id
			end)

			if slot1 then
				for slot10, slot11 in ipairs(slot1) do
					if slot11.dungeon_id <= slot3 or slot6 < slot5 then
						table.insert(slot2, slot11)
					end

					slot6 = slot6 + 1
				end
			end
		end
	end

	if slot2 and next(slot2 or {}) ~= nil then
		slot0.msg_panel:setContentSize(cc.size(585, #slot2 * BattleDramaDropSecBossItem.HEIGHT))

		slot7 = 10
		slot8 = 0

		slot0.msg_panel:setPosition(slot7, slot8)

		for slot7, slot8 in pairs(slot2) do
			delayRun(slot0.msg_panel, slot7 * 2 / display.DEFAULT_FPS, function ()
				if not uv0.item_list[uv1] then
					slot0 = BattleDramaDropSecBossItem.new()

					slot0:setAnchorPoint(cc.p(0, 1))

					uv0.item_list[uv1] = slot0

					uv0.msg_panel:addChild(slot0)
				end

				if uv0.item_list[uv1] then
					slot0:setBossData(uv2)
					slot0:setPosition(cc.p(-10, uv0.msg_panel:getContentSize().height - BattleDramaDropSecBossItem.HEIGHT * (uv1 - 1)))
				end
			end)
		end
	end
end

function BattleDramaDropBossItem.updateItemList(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5 and not tolua.isnull(slot5) then
				slot5:updateBtnStatus()
			end
		end
	end
end

function BattleDramaDropBossItem.getMsgPanleSize(slot0)
	if slot0.msg_panel and not tolua.isnull(slot0.msg_panel) then
		return slot0.msg_panel:getContentSize()
	end
end

function BattleDramaDropBossItem.DeleteMe(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
