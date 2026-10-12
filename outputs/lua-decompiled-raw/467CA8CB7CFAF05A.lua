EndlessHelpMePanel = class("EndlessHelpMePanel", function ()
	return ccui.Layout:create()
end)
slot0 = Endless_trailController:getInstance()
slot1 = Endless_trailController:getInstance():getModel()
slot2 = table.sort

function EndlessHelpMePanel.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_help_me_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.is_select = false

	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5 - 10, slot0.size.height * 0.5 - 40)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("container")
	slot2 = slot1:getChildByName("scroll_container")

	slot1:getChildByName("desc_label"):setString(TI18N("(超出拥有英雄120%战力的支援英雄不可选择)"))

	slot4 = slot2:getContentSize()
	slot0.scroll_view = CommonScrollViewLayout.new(slot2, cc.p(4, 5), nil, , cc.size(slot4.width - 4, slot4.height - 10), {
		start_y = 0,
		item_width = 600,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 149,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = EndlessFriendHelpItem
	})

	slot0:registerEvent()
end

function EndlessHelpMePanel.registerEvent(slot0)
	if not slot0.update_hire_partner_event then
		slot0.update_hire_partner_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_HIREPARNER_DATA, function (slot0)
			uv0:updateListData(slot0)
		end)
	end

	if not slot0.update_has_hire_partner_event then
		slot0.update_has_hire_partner_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_HASHIREPARNER_DATA, function (slot0)
			uv0:updateHasListData(uv0.hire_data, slot0.list)
		end)
	end
end

function EndlessHelpMePanel.setNodeVisible(slot0, slot1)
	slot0:setVisible(slot1)
end

function EndlessHelpMePanel.updateHasListData(slot0, slot1)
end

function EndlessHelpMePanel.updateListData(slot0, slot1, slot2)
	if slot1 then
		slot0.hire_data = slot1
		slot0.tmp_list = slot0.hire_data.list
		slot4 = {}

		if uv0:getHasHirePartnerData() then
			slot4 = slot3.list
		end

		slot5 = slot2 or slot4
		slot7 = RoleController:getInstance():getRoleVo()
		slot8 = HeroController:getInstance():getModel():getMaxFight() * 1.2

		for slot12, slot13 in ipairs(slot0.tmp_list) do
			slot13.index = slot12
			slot13.sort_index = 2
			slot13.select = false

			if function (slot0, slot1, slot2)
				if uv0 and next(uv0 or {}) ~= nil then
					slot3 = false

					for slot7, slot8 in ipairs(uv0) do
						if slot8.id == slot2 and slot8.rid == slot0 and slot8.srv_id == slot1 then
							slot3 = true

							break
						end
					end

					return slot3
				end
			end(slot13.rid, slot13.srv_id, slot13.id) == true then
				slot13.sort_index = 3
				slot13.select = true
			end

			slot13.is_lock = false

			if Config.PartnerData.data_partner_base[slot13.bid] then
				slot13.info_data = Config.PartnerData.data_partner_base[slot13.bid]
			end

			if slot8 <= slot13.power then
				slot13.sort_index = 1
				slot13.is_lock = true
			end
		end

		uv1(slot0.tmp_list, SortTools.tableUpperSorter({
			"sort_index",
			"power"
		}))
		slot0:createList(slot0.tmp_list)
	end
end

function EndlessHelpMePanel.createList(slot0, slot1)
	slot0.scroll_view:setData(slot1, function (slot0, slot1, slot2, slot3, slot4)
		if slot1 and next(slot1) ~= nil then
			uv0:clickFun(slot0, slot1, slot2, slot3, slot4)
		end
	end)
	slot0.scroll_view:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.scroll_view:getItemList()) do
			if slot5:getData().select == true then
				uv0:clickFun(slot5, slot6, slot6._index, true, true)
			end
		end
	end)
end

function EndlessHelpMePanel.addToParent(slot0)
	uv0:send23907()
end

function EndlessHelpMePanel.updateBtnChoseStatus(slot0, slot1, slot2)
	if not slot0.tmp_list then
		return
	end

	for slot6, slot7 in pairs(slot0.tmp_list) do
		slot8 = slot7.select

		if slot7._index and slot7._index == slot1 then
			slot7.select = slot2
		else
			slot7.select = false
		end

		if slot8 == true and slot7.select == false then
			uv0:send23909(slot7.rid, slot7.srv_id, slot7.id, 0)
		elseif slot8 == false and slot7.select == true then
			uv0:send23909(slot7.rid, slot7.srv_id, slot7.id, 1)
		end
	end
end

function EndlessHelpMePanel.setAllItemBtnStatus(slot0)
	for slot5, slot6 in pairs(slot0.scroll_view:getItemList()) do
		if slot6:getData().select == true then
			slot6:updateBtnStatus(false)
		end
	end
end

function EndlessHelpMePanel.clickFun(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:setAllItemBtnStatus()

	if slot0.select_item_index and slot0.select_item_index == slot3 and slot0.select_item then
		slot0:updateBtnChoseStatus(slot0.select_item.index, false)

		slot0.select_item = nil
		slot0.is_select = false
		slot0.select_item_index = nil

		return
	end

	slot0.select_item = slot1
	slot0.select_vo = slot2

	slot0.select_item:updateBtnStatus(true)
	slot0:updateBtnChoseStatus(slot3, true)

	slot0.select_item_index = slot3
	slot0.is_select = slot4
end

function EndlessHelpMePanel.DeleteMe(slot0)
	if slot0.update_hire_partner_event then
		GlobalEvent:getInstance():UnBind(slot0.update_hire_partner_event)

		slot0.update_hire_partner_event = nil
	end

	if slot0.update_has_hire_partner_event then
		GlobalEvent:getInstance():UnBind(slot0.update_has_hire_partner_event)

		slot0.update_has_hire_partner_event = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end
