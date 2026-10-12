ArenaChampionTop322View = class("ArenaChampionTop322View", function ()
	return ccui.Layout:create()
end)
slot0 = table.insert
slot1 = table.sort

function ArenaChampionTop322View.ctor(slot0, slot1)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/arena_champion_top_32_2_view"))
	slot0.view_type = slot1 or ArenaConst.champion_type.normal

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.ctrl = ArenaController:getInstance()
		slot0.model = slot0.ctrl:getChampionModel()
	else
		slot0.ctrl = CrosschampionController:getInstance()
		slot0.model = slot0.ctrl:getModel()
	end

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.champion_container = slot0.root_wnd:getChildByName("container"):getChildByName("champion_container")
	slot0.head_container = slot0.champion_container:getChildByName("head_container")
	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setPosition(60, 60)

	slot6 = slot0.role_head

	slot0.head_container:addChild(slot6)

	slot0.pos_line_list = {}
	slot0.role_pos_list = {}
	slot0.role_name_list = {}

	for slot6 = 1, 6 do
		if slot2:getChildByName("pos_line_" .. slot6) then
			slot10 = slot7:getChildByName("select_1")
			slot11 = slot7:getChildByName("select_2")
			slot12 = {
				normal_1 = slot7:getChildByName("normal_1"),
				normal_2 = slot7:getChildByName("normal_2"),
				select_1 = slot10,
				select_2 = slot11
			}

			slot10:setVisible(false)

			if slot11 then
				slot11:setVisible(false)
			end

			slot0.pos_line_list[slot6] = slot12
		end

		if slot2:getChildByName("role_pos_" .. slot6) then
			slot10 = slot8:getChildByName("select")

			slot10:setVisible(false)

			slot0.role_pos_list[slot6] = {
				normal = slot8:getChildByName("normal"),
				select = slot10
			}
		end

		if slot2:getChildByName("role_name_" .. slot6) then
			slot0.role_name_list[slot6] = slot9

			slot9:setString("")
		end
	end

	slot0.pos_line_list_2 = {}

	for slot6 = 1, 2 do
		if slot2:getChildByName(string.format("pos_line_%s_%s", (slot6 - 1) * 2 + 1, slot6 * 2)) then
			slot11 = slot9:getChildByName("select")

			slot11:setVisible(false)

			slot0.pos_line_list_2[getNorKey(slot7, slot8)] = {
				normal = slot9:getChildByName("normal"),
				select = slot11
			}
		end
	end

	slot0.check_btn_list = {}

	for slot6 = 1, 6 do
		if slot2:getChildByName("check_btn_" .. slot6) then
			slot0.check_btn_list[slot6] = slot7

			slot7:setVisible(false)
		end
	end

	slot0.guess_btn = slot2:getChildByName("guess_btn")

	slot0.guess_btn:getChildByName("label"):setString(TI18N("竞猜"))
	slot0.guess_btn:setVisible(false)
	slot0:registerEvent()
end

function ArenaChampionTop322View.registerEvent(slot0)
	for slot4, slot5 in pairs(slot0.check_btn_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				GlobalEvent:getInstance():Fire(ArenaEvent.CheckFightInfoEvent, true, 0, uv0)
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

function ArenaChampionTop322View.addToParent(slot0, slot1)
	slot0:setVisible(slot1)
	slot0:handleEvent(slot1)
end

function ArenaChampionTop322View.updateInfo(slot0, slot1)
	if slot0.model:getBaseInfo() == nil or slot0.model:getRoleInfo() == nil then
		return
	end

	slot0.is_change_tab = slot1

	if slot1 == true or slot2.flag ~= 0 then
		if slot0.view_type == ArenaConst.champion_type.normal then
			slot0.ctrl:requestTop4Info()
		else
			slot0.ctrl:sender26210()
		end
	end
end

function ArenaChampionTop322View.handleEvent(slot0, slot1)
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
			slot0.update_top32_info_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateTop4InfoEvent, function (slot0)
				uv0:updateTop4Info(slot0)
			end)
		end

		if slot0.update_324_guess_event == nil then
			slot0.update_324_guess_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateTop324GuessGroupEvent, function (slot0, slot1)
				if slot0 ~= 0 or slot1 == 0 then
					return
				end

				uv0:updateCheckStatus(slot1)
			end)
		end
	end
end

function ArenaChampionTop322View.updateCheckStatus(slot0, slot1)
	if slot0.check_btn_list[slot1] then
		slot0.guess_btn:setPosition(slot2:getPositionX(), slot2:getPositionY())
	end
end

function ArenaChampionTop322View.updateTop4Info(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	function slot6(slot0, slot1)
		return slot0.pos < slot1.pos
	end

	uv0(slot1, slot6)

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

			if slot0.pos_line_list[slot6] and slot10.select_1 then
				slot10.select_1:setVisible(slot8.ret == 1)

				if slot10.select_2 then
					slot10.select_2:setVisible(slot8.ret == 1)
				end
			end

			slot11 = 0
			slot12 = 0
			slot12 = (slot6 % 2 ~= 0 or getNorKey(slot6 - 1, slot6)) and getNorKey(slot6, slot6 + 1)

			if slot0.check_btn_list[slot11] then
				slot13:setVisible(true)
			end

			if slot0.pos_line_list_2[slot12] and slot14.select then
				slot14.select:setVisible(slot8.ret ~= 0)
			end
		end
	end

	if slot2[7] and slot3.rid ~= 0 then
		slot0.role_head:setHeadRes(slot3.face, false, LOADTEXT_TYPE, slot3.face_file, slot3.face_update_time)
	else
		slot0.role_head:clearHead()
	end

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.ctrl:requestGuessGroupInfo()
	else
		slot0.ctrl:sender26211()
	end
end

function ArenaChampionTop322View.DeleteMe(slot0)
	slot0:handleEvent(false)
end
