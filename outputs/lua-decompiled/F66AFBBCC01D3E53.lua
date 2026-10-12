ArenaChampionTop321View = class("ArenaChampionTop321View", function ()
	return ccui.Layout:create()
end)
slot0 = table.sort
slot1 = table.insert

function ArenaChampionTop321View.ctor(slot0, slot1)
	slot0.tab_list = {}
	slot0.video_group = 0
	slot0.video_pos = 0
	slot0.size = cc.size(720, 778)

	slot0:setContentSize(slot0.size)

	slot0.view_type = slot1 or ArenaConst.champion_type.normal

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.ctrl = ArenaController:getInstance()
		slot0.model = slot0.ctrl:getChampionModel()
	else
		slot0.ctrl = CrosschampionController:getInstance()
		slot0.model = slot0.ctrl:getModel()
	end

	slot0.notice_label = createLabel(22, cc.c4b(255, 141, 85, 255), 2, 360, 778, "", slot0, nil, cc.p(0.5, 0))
end

function ArenaChampionTop321View.addToParent(slot0, slot1)
	slot0:setVisible(slot1)
	slot0:handleEvent(slot1)
end

function ArenaChampionTop321View.handleEvent(slot0, slot1)
	if slot1 == false then
		if slot0.update_top32_info_event ~= nil then
			GlobalEvent:getInstance():UnBind(slot0.update_top32_info_event)

			slot0.update_top32_info_event = nil
		end

		if slot0.update_324_guess_event ~= nil then
			GlobalEvent:getInstance():UnBind(slot0.update_324_guess_event)

			slot0.update_324_guess_event = nil
		end
	else
		if slot0.update_top32_info_event == nil then
			slot0.update_top32_info_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateTop32InfoEvent, function (slot0)
				uv0:updateTop32InfoList(slot0)
			end)
		end

		if slot0.update_324_guess_event == nil then
			slot0.update_324_guess_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateTop324GuessGroupEvent, function (slot0, slot1)
				uv0.video_group = slot0
				uv0.video_pos = slot1

				if slot0 == 0 or slot1 == 0 then
					return
				end

				if uv0.tab_list[slot0] and slot2.updateGuessStatus then
					slot2:updateGuessStatus(true, slot1)
				end
			end)
		end
	end
end

function ArenaChampionTop321View.updateCheckStatus(slot0, slot1)
	slot0.notice_label:setString(ArenaConst.getGroup(slot1))

	if slot0.video_group == 0 or slot0.video_pos == 0 then
		return
	end

	if slot0.video_group and slot0.video_group == slot1 and slot0.video_pos and slot0.tab_list[slot1] then
		slot2:updateGuessStatus(true, slot0.video_pos)
	end
end

function ArenaChampionTop321View.updateInfo(slot0, slot1)
	if slot0.model:getBaseInfo() == nil or slot0.model:getRoleInfo() == nil then
		return
	end

	slot0.is_change_tab = slot1

	if slot1 == true or slot2.flag ~= 0 then
		if slot0.view_type == ArenaConst.champion_type.normal then
			slot0.ctrl:requestTop32Info()
		else
			slot0.ctrl:sender26209()
		end
	end
end

function ArenaChampionTop321View.updateTop32InfoList(slot0, slot1)
	if slot1 == nil then
		return
	end

	uv0(slot1, function (slot0, slot1)
		return slot0.group < slot1.group
	end)

	slot0.page_view_list = slot1

	if slot0.page_view == nil then
		if slot0.page_view == nil then
			slot2 = 4

			if slot0.view_type == ArenaConst.champion_type.cross then
				slot2 = 8
			end

			slot0.page_view = CustomPageView.new(slot0.size, true, false, 0, 0, slot2)

			slot0:addChild(slot0.page_view)

			slot0.page_view.per_page = 1

			slot0.page_view:addCreatePageCallBack(function (slot0, slot1, slot2)
				slot3 = ArenaChampionTop32Item.new()

				slot3:setData(uv0.page_view_list[slot1 or 1])
				slot2:addChild(slot3)
				uv1(uv0.tab_list, slot3)
			end)
			slot0.page_view:addTurnCallBack(function (slot0, slot1)
				uv0:updateCheckStatus(slot0)
			end)
			slot0.page_view:setViewData(slot1)
		end
	else
		for slot5, slot6 in ipairs(slot0.tab_list) do
			slot6:setData(slot1[slot5])
		end
	end

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.ctrl:requestGuessGroupInfo()
	else
		slot0.ctrl:sender26211()
	end
end

function ArenaChampionTop321View.DeleteMe(slot0)
	slot4 = false

	slot0:handleEvent(slot4)

	for slot4, slot5 in pairs(slot0.tab_list) do
		slot5:DeleteMe()
	end

	slot0.tab_list = nil

	if slot0.page_view then
		slot0.page_view:dispose()
	end

	slot0.page_view = nil
end

ArenaChampionTop32Item = class("ArenaChampionTop32Item", function ()
	return ccui.Layout:create()
end)

function ArenaChampionTop32Item.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/arena_champion_top_32_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)

	slot5 = slot0.size.height * 0.5

	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot5)
	slot0:addChild(slot0.root_wnd)

	slot0.pos_line_list = {}

	for slot5 = 1, 12 do
		if slot0.root_wnd:getChildByName("container"):getChildByName("pos_line_" .. slot5) then
			slot9 = slot6:getChildByName("select_1")
			slot10 = slot6:getChildByName("select_2")

			slot9:setVisible(false)
			slot10:setVisible(false)

			slot0.pos_line_list[slot5] = {
				normal_1 = slot6:getChildByName("normal_1"),
				normal_2 = slot6:getChildByName("normal_2"),
				select_1 = slot9,
				select_2 = slot10
			}
		end
	end

	slot0.pos_line_list_2 = {}
	slot0.check_btn_list = {}

	for slot5 = 1, 7 do
		if slot1:getChildByName(string.format("pos_line_%s_%s", (slot5 - 1) * 2 + 1, slot5 * 2)) then
			slot10 = slot8:getChildByName("select")

			slot10:setVisible(false)

			slot0.pos_line_list_2[getNorKey(slot6, slot7)] = {
				normal = slot8:getChildByName("normal"),
				select = slot10
			}
		end

		if slot1:getChildByName("check_btn_" .. slot6) then
			slot0.check_btn_list[slot6] = slot9

			slot9:setVisible(false)
		end
	end

	slot0.role_pos_list = {}
	slot0.role_name_list = {}

	for slot5 = 1, 14 do
		if slot1:getChildByName("role_pos_" .. slot5) then
			slot8 = slot6:getChildByName("select")

			slot8:setVisible(false)

			slot0.role_pos_list[slot5] = {
				normal = slot6:getChildByName("normal"),
				select = slot8
			}
		end

		if slot1:getChildByName("role_name_" .. slot5) then
			slot0.role_name_list[slot5] = slot7

			slot7:setString("")
		end
	end

	slot0.guess_btn = slot1:getChildByName("guess_btn")

	slot0.guess_btn:getChildByName("label"):setString(TI18N("竞猜"))
	slot0.guess_btn:setVisible(false)
	slot0:registerEvent()
end

function ArenaChampionTop32Item.registerEvent(slot0)
	for slot4, slot5 in pairs(slot0.check_btn_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.data then
					GlobalEvent:getInstance():Fire(ArenaEvent.CheckFightInfoEvent, true, uv0.data.group, uv1)
				end
			end
		end)
	end

	slot0.guess_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			GlobalEvent:getInstance():Fire(ArenaEvent.ChangeTanFromTop324)
		end
	end)
end

function ArenaChampionTop32Item.updateGuessStatus(slot0, slot1, slot2)
	slot0.guess_btn:setVisible(slot1)

	if slot1 == true and slot2 ~= nil and slot0.check_btn_list[slot2] then
		slot0.guess_btn:setPosition(slot3:getPositionX(), slot3:getPositionY())
	end
end

function ArenaChampionTop32Item.setData(slot0, slot1)
	if slot1 == nil or slot1.pos_list == nil or next(slot1.pos_list) == nil then
		return
	end

	slot0:updateGuessStatus(false)

	slot0.data = slot1

	function slot6(slot0, slot1)
		return slot0.pos < slot1.pos
	end

	uv0(slot1.pos_list, slot6)

	for slot6, slot7 in pairs(slot0.role_name_list) do
		if slot2[slot6] then
			slot7:setString(slot8.name)

			if slot8.ret == 0 then
				slot7:setTextColor(Config.ColorData.data_color4[175])
			elseif slot8.ret == 1 then
				slot7:setTextColor(Config.ColorData.data_color4[175])
			else
				slot7:setTextColor(cc.c4b(91, 91, 91, 255))
			end

			if slot0.role_pos_list[slot6] then
				if slot9.select then
					slot9.select:setVisible(slot8.ret == 1)
				end

				if slot9.normal then
					if slot8.ret == 2 then
						setChildUnEnabled(true, slot9.normal)
					else
						setChildUnEnabled(false, slot9.normal)
					end
				end
			end

			if slot0.pos_line_list[slot6] and slot10.select_1 and slot10.select_2 then
				slot10.select_1:setVisible(slot8.ret == 1)
				slot10.select_2:setVisible(slot8.ret == 1)
			end

			slot11 = 0
			slot12 = 0
			slot12 = (slot6 % 2 ~= 0 or getNorKey(slot6 - 1, slot6)) and getNorKey(slot6, slot6 + 1)

			if slot0.check_btn_list[slot11] then
				slot13:setVisible(true)
			end

			if slot6 ~= 13 and slot6 ~= 14 and slot0.pos_line_list_2[slot12] and slot14.select then
				slot14.select:setVisible(slot8.ret ~= 0)
			end
		end
	end
end

function ArenaChampionTop32Item.DeleteMe(slot0)
end
