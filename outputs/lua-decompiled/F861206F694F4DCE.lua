EscortLogAtkPanel = EscortLogAtkPanel or BaseClass()
slot0 = EscortController:getInstance()
slot1 = Config.EscortData.data_baseinfo
slot2 = Config.EscortData.data_rewards

function EscortLogAtkPanel.__init(slot0, slot1)
	slot0.is_init = false
	slot0.parent = slot1

	slot0:createRoorWnd()
end

function EscortLogAtkPanel.createRoorWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("escort/escort_log_atk_panel"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.item = slot0.root_wnd:getChildByName("item")

	slot0.item:setVisible(false)

	slot0.empty_tips = slot0.root_wnd:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("desc"):setString(TI18N("满载而归的雇佣兽，不去掠夺一发吗？"))

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
end

function EscortLogAtkPanel.addToParent(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end

	if slot1 == true and slot0.is_init == false then
		slot0.is_init = true

		uv0:requestLogByType(EscortConst.log_type.atk)
	end
end

function EscortLogAtkPanel.refreshData(slot0, slot1)
end

function EscortLogAtkPanel.setData(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		if slot0.scroll_view then
			slot0.scroll_view:setVisible(false)
		end

		if slot0.empty_tips then
			slot0.empty_tips:setVisible(true)
		end
	else
		if slot0.scroll_view == nil then
			slot0.scroll_view = CommonScrollViewLayout.new(slot0.main_panel, nil, nil, nil, slot0.main_panel:getContentSize(), {
				start_y = 7,
				item_width = 600,
				start_x = 4,
				space_x = 0,
				row = 0,
				item_height = 156,
				space_y = 0,
				col = 1,
				need_dynamic = true,
				item_class = EscortLogAtkItem
			})
		end

		slot0.scroll_view:setData(slot1, nil, nil, slot0.item)
		slot0.scroll_view:setVisible(true)

		if slot0.empty_tips then
			slot0.empty_tips:setVisible(false)
		end
	end
end

function EscortLogAtkPanel.__delete(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end

EscortLogAtkItem = class("EscortLogAtkItem", function ()
	return ccui.Layout:create()
end)

function EscortLogAtkItem.ctor(slot0)
	slot0.item_list = {}
	slot0.is_completed = false
end

function EscortLogAtkItem.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot0.is_completed = true
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0:addChild(slot0.root_wnd)
		slot0.root_wnd:getChildByName("item_title"):setString(TI18N("掠夺对象:"))
		slot0.root_wnd:getChildByName("role_title"):setString(TI18N("被掠玩家:"))
		slot0.root_wnd:getChildByName("get_title"):setString(TI18N("获得:"))
		slot0.root_wnd:getChildByName("server_title"):setString(TI18N("服务器:"))

		slot0.role_name = slot0.root_wnd:getChildByName("role_name")
		slot0.item_name = slot0.root_wnd:getChildByName("item_name")
		slot0.time_label = slot0.root_wnd:getChildByName("time_label")
		slot0.server_value = slot0.root_wnd:getChildByName("server_value")

		slot0:registerEvent()
	end
end

function EscortLogAtkItem.registerEvent(slot0)
end

function EscortLogAtkItem.setData(slot0, slot1)
	if slot1 then
		for slot5, slot6 in ipairs(slot0.item_list) do
			if slot6.suspendAllActions then
				slot6:suspendAllActions()
				slot6:setVisible(false)
			end
		end

		slot0.role_name:setString(slot1.name or "")
		slot0.time_label:setString(TimeTool.getYMDHMS(slot1.time or 0))
		slot0.server_value:setString(getServerName(slot1.srv_id))

		if slot1.quality then
			if uv0[slot1.quality] then
				if EscortConst.quality_color[slot1.quality] then
					slot0.item_name:setTextColor(slot3)
				end

				slot0.item_name:setString(slot2.title)
			end

			if slot1.items then
				slot3 = 362
				slot4 = 65

				for slot8, slot9 in ipairs(slot1.items) do
					if slot0.item_list[slot8] == nil then
						slot0.item_list[slot8] = BackPackItem.new(false, true, false, 0.7, false, true)

						slot0.root_wnd:addChild(slot0.item_list[slot8])
					end

					slot10 = slot0.item_list[slot8]

					slot10:setVisible(true)
					slot10:setBaseData(slot9.bid, slot9.num)
					slot10:setPosition(362 + (slot8 - 1) * (BackPackItem.Width * 0.7 + 6), slot4)
				end
			end
		end
	end
end

function EscortLogAtkItem.suspendAllActions(slot0)
end

function EscortLogAtkItem.DeleteMe(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
