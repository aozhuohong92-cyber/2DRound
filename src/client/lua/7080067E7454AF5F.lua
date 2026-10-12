GuildBossPreviewWindow = class("GuildBossPreviewWindow", function ()
	return ccui.Layout:create()
end)
slot0 = GuildbossController:getInstance()
slot1 = GuildbossController:getInstance():getModel()
slot2 = string.format

function GuildBossPreviewWindow.ctor(slot0)
	slot0.monster_list = {}
	slot0.is_first_enter = true

	slot0:open_callback()
end

function GuildBossPreviewWindow.open_callback(slot0)
	slot0.main_view = createCSBNote(PathTool.getTargetCSB("guildboss/guildboss_preview_window"))

	slot0:addChild(slot0.main_view)
	slot0:register_event()
end

function GuildBossPreviewWindow.register_event(slot0)
end

function GuildBossPreviewWindow.updateScrollViewList(slot0)
	if slot0.scroll_view == nil then
		slot0.scroll_container = slot0.main_view:getChildByName("scroll_container")
		slot0.scroll_size = slot0.scroll_container:getContentSize()
		slot0.scroll_view = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.scroll_size, {
			start_y = 4,
			row = 1,
			start_x = 7,
			delay = 5,
			space_x = 2,
			item_width = 100,
			item_height = 90,
			space_y = 0,
			col = 0
		}, cc.p(0, 0))

		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end

	slot0.cell_data_list, select_index = slot0:getCellData()

	slot0.scroll_view:reloadData(select_index)
end

function GuildBossPreviewWindow.createNewCell(slot0, slot1, slot2)
	slot3 = GuildBossPreviewItem.new()

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function GuildBossPreviewWindow.numberOfCells(slot0)
	if not slot0.cell_data_list then
		return 0
	end

	return #slot0.cell_data_list
end

function GuildBossPreviewWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.cell_data_list[slot2] then
		return
	end

	slot1:setData(slot3, slot2)

	if slot0.cur_index == slot2 then
		slot1:setSelect(true)
	else
		slot1:setSelect(false)
	end
end

function GuildBossPreviewWindow.onCellTouched(slot0, slot1)
	if slot0.cell_data_list[slot1.index] then
		if slot3.status == 2 or slot3.status == 3 then
			message(TI18N("通关上一章开启"))
		elseif Config.GuildDunData.data_guildboss_list[slot3.show_id] then
			slot0:clickOpen(slot1, slot2, true)
			GuildbossController:getInstance():requestGuildDunRank(GuildBossConst.rank.role, {
				end_num = 100,
				start_num = 1,
				boss_id = slot4.boss_id
			})
		end
	end
end

function GuildBossPreviewWindow.getCellData(slot0)
	slot2 = {}
	slot3 = nil

	if uv0:getBaseInfo() and next(slot1 or {}) ~= nil then
		slot4 = false

		for slot9, slot10 in ipairs(Config.GuildDunData.data_chapter_reward) do
			if slot1.fid and slot1.fid == slot10.id then
				slot3 = slot9

				if slot1.max_id == slot10.id and Config.GuildDunData.data_chapter_reward[#Config.GuildDunData.data_chapter_reward].id == slot10.id and slot1.info and next(slot1.info) ~= nil and slot1.info[1].hp and slot1.info[1].hp == 0 then
					-- Nothing
				end
			elseif slot10.id < slot1.fid then
				slot11.status = 1
			elseif slot4 == false then
				slot11.status = 3
				slot4 = true
			else
				slot11.status = 2
			end

			slot2[slot9] = {
				desc = uv1("%s", slot10.chapter_name),
				show_id = slot10.show_id,
				status = 0,
				status = 1
			}
		end
	end

	return slot2, slot3
end

function GuildBossPreviewWindow.clickOpen(slot0, slot1, slot2, slot3)
	if slot0.cur_index and slot0.cur_index == slot2 and slot3 == true then
		return
	end

	if slot0.cur_select ~= nil and slot0.cur_index and slot0.cur_index ~= slot2 then
		slot0.cur_select:setSelect(false)
	end

	slot0.cur_select = slot1
	slot0.cur_index = slot2

	slot0.cur_select:setSelect(true)

	if not slot0.is_first_enter then
		GlobalEvent:getInstance():Fire(GuildbossEvent.UpdateChangeStatus, slot0.cell_data_list[slot0.cur_index])
	end

	slot0.is_first_enter = false
end

function GuildBossPreviewWindow.DeleteMe(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end

function GuildBossPreviewWindow.getCurSelect(slot0)
	if slot0.cur_select then
		return slot0.cur_select
	end
end

GuildBossPreviewItem = class("GuildBossPreviewItem", function ()
	return ccui.Layout:create()
end)

function GuildBossPreviewItem.ctor(slot0)
	slot0.boss_id = 0
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guildboss/guildboss_preview_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:setTouchEnabled(true)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.center_x = slot0.size.width * 0.5
	slot0.boss_icon = PlayerHead.new(PlayerHead.type.circle)

	slot0.boss_icon:setAnchorPoint(0.5, 0.5)
	slot0.boss_icon:setScale(0.8)
	slot0.boss_icon:setPosition(slot0.center_x, slot0.size.height / 2)
	slot0.root_wnd:addChild(slot0.boss_icon, -1)

	slot0.model = slot0.root_wnd:getChildByName("model")
	slot0.pass_icon = slot0.root_wnd:getChildByName("pass_icon")
	slot0.chapter_value = slot0.root_wnd:getChildByName("chapter_value")
	slot0.status_value = slot0.root_wnd:getChildByName("status_value")

	slot0.status_value:setVisible(false)

	slot0.lock_icon = slot0.root_wnd:getChildByName("lock_icon")

	slot0.lock_icon:setScale(0.8)
	slot0:registerEvent()
end

function GuildBossPreviewItem.setData(slot0, slot1, slot2)
	if slot1 ~= nil then
		slot0.data = slot1

		slot0.chapter_value:setString(slot1.desc)
		slot0:updateMonsterInfo(slot1.show_id, slot1.status)
		slot0.pass_icon:setVisible(false)

		slot3 = math.min(slot2 - 1, tableLen(Config.GuildDunData.data_chapter_reward))

		if slot1.status == 0 then
			slot0.lock_icon:setVisible(false)
		elseif slot1.status == 1 then
			slot0.pass_icon:setVisible(true)
			slot0.lock_icon:setVisible(false)
		elseif slot1.status == 2 then
			slot0.lock_icon:setVisible(true)
		else
			slot0.lock_icon:setVisible(true)
		end
	end
end

function GuildBossPreviewItem.updateMonsterInfo(slot0, slot1, slot2)
	slot3 = Config.GuildDunData.data_guildboss_list[slot1]
	slot0.data.config = slot3

	if slot3 == nil then
		return
	end

	slot0.boss_id = slot1

	slot0.boss_icon:setHeadRes(slot3.head_icon)
	setChildUnEnabled(false, slot0.boss_icon)

	if slot2 == 2 or slot2 == 3 then
		setChildUnEnabled(true, slot0.boss_icon)
	end
end

function GuildBossPreviewItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function GuildBossPreviewItem.registerEvent(slot0)
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
					uv0:callback()
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

function GuildBossPreviewItem.getData(slot0)
	return slot0.data
end

function GuildBossPreviewItem.setSelect(slot0, slot1)
	if slot1 and not slot0.select_img then
		slot0.select_img = createSprite(PathTool.getResFrame("guildboss", "guildboss_1018"), 50, 45, slot0.root_wnd, cc.p(0.5, 0.5))

		slot0.root_wnd:setLocalZOrder(-1)
	end

	if slot0.select_img then
		if slot1 then
			breatheShineAction(slot0.select_img)
		else
			doStopAllActions(slot0.select_img)
		end

		slot0.select_img:setVisible(slot1)
	end
end

function GuildBossPreviewItem.getIsShow(slot0)
	return slot0.is_show
end

function GuildBossPreviewItem.getItemPosition(slot0)
	if slot0 then
		return cc.p(slot0:getPosition())
	end
end

function GuildBossPreviewItem.DeleteMe(slot0)
	if slot0.spine then
		slot0.spine:DeleteMe()

		slot0.spine = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
