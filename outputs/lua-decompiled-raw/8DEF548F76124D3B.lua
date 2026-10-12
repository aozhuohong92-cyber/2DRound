ArenaChampionCheckFightInfoView = class("ArenaChampionCheckFightInfoView", function ()
	return ccui.Layout:create()
end)
slot0 = table.insert
slot1 = string.format

function ArenaChampionCheckFightInfoView.ctor(slot0, slot1)
	slot0.role_list = {}
	slot0.view_type = slot1 or ArenaConst.champion_type.normal

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.ctrl = ArenaController:getInstance()
		slot0.model = slot0.ctrl:getChampionModel()
	else
		slot0.ctrl = CrosschampionController:getInstance()
		slot0.model = slot0.ctrl:getModel()
	end

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/arena_champion_check_fight_info_view"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.success_img = slot2:getChildByName("success_img")

	slot0.success_img:setVisible(false)

	slot0.success_left_pos = cc.p(380, 930)
	slot0.success_right_pos = cc.p(350, 433)
	slot0.vs = slot2:getChildByName("vs")
	slot0.check_btn = slot2:getChildByName("check_btn")
	slot6 = true

	slot0.check_btn:ignoreContentAdaptWithSize(slot6)

	for slot6 = 1, 2 do
		if slot2:getChildByName("role_container_" .. slot6) then
			object = {
				container = slot7,
				role_name = slot7:getChildByName("role_name"),
				role_lev = slot7:getChildByName("role_lev"),
				form_bg = slot7:getChildByName("form_bg")
			}
			object.form_icon = object.form_bg:getChildByName("form_icon")
			object.elfin_tree_lv = slot7:getChildByName("elfin_tree_lv")

			object.elfin_tree_lv:setString(TI18N("佩罗娜等级：0"))

			object.elfin_list = {}
			object.power = CommonNum.new(20, slot7, 99999, -2, cc.p(0, 0.5))

			if slot6 == 1 then
				object.power:setPosition(168, 342)
			else
				object.power:setPosition(184, 177)
			end

			object.role_head = PlayerHead.new(PlayerHead.type.circle)

			if slot6 == 1 then
				object.role_head:setPosition(86, 438)
			else
				object.role_head:setPosition(102, 74)
			end

			slot7:addChild(object.role_head)

			slot0.role_list[slot6] = object
		end
	end

	slot0.main_panel = slot2

	slot0:createLeftPartnerList()
	slot0:createRightPartnerList()
	slot0:registerEvent()
end

function ArenaChampionCheckFightInfoView.registerEvent(slot0)
	for slot4, slot5 in ipairs(slot0.role_list) do
		if slot5.form_bg then
			-- Nothing
		end
	end

	slot0.check_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.model:getBaseInfo() then
				if uv0.data.ret == 0 then
					if uv0.view_type == ArenaConst.champion_type.normal then
						BattleController:getInstance():csRecordBattle(uv0.data.replay_id)
					else
						BattleController:getInstance():csRecordBattle(uv0.data.replay_id, slot2.srv_id)
					end
				else
					ArenaController:getInstance():openArenaChampionReportWindow(true, uv0.data, uv0.view_type)
				end
			end
		end
	end)
end

function ArenaChampionCheckFightInfoView.addToParent(slot0, slot1)
	slot0:setVisible(slot1)
	slot0:handleEvent(slot1)
end

function ArenaChampionCheckFightInfoView.handleEvent(slot0, slot1)
	if slot1 == false then
		if slot0.update_top_324_event ~= nil then
			GlobalEvent:getInstance():UnBind(slot0.update_top_324_event)

			slot0.update_top_324_event = nil
		end
	elseif slot0.update_top_324_event == nil then
		slot0.update_top_324_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateTop324GroupPosEvent, function (slot0)
			uv0:updateFightInfo(slot0)
		end)
	end
end

function ArenaChampionCheckFightInfoView.setBaseInfo(slot0, slot1, slot2)
	slot0.group = slot1
	slot0.pos = slot2

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.ctrl:requestGroupPosInfo(slot1, slot2)
	else
		slot0.ctrl:sender26212(slot1, slot2)
	end
end

function ArenaChampionCheckFightInfoView.updateFightInfo(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.data and getNorKey(slot0.data.step, slot0.data.round, slot0.data.replay_id, slot0.data.a_power, slot0.data.ret) == getNorKey(slot1.step, slot1.round, slot1.replay_id, slot1.a_power, slot1.ret) then
		return
	end

	slot2 = slot0.data and slot0.data.ret ~= slot1.ret and slot1.ret ~= 0
	slot0.data = slot1

	if slot0.is_change_tab == false and slot0.model:getBaseInfo() and slot3.flag == 2 and slot1.replay_id ~= 0 and getNorKey(slot3.step, slot3.round) == getNorKey(slot1.step, slot1.round) then
		if slot0.view_type == ArenaConst.champion_type.normal then
			BattleController:getInstance():csRecordBattle(slot1.replay_id)
		else
			BattleController:getInstance():csRecordBattle(slot1.replay_id, slot3.srv_id)
		end
	end

	slot0:setBothSidesBaseInfo(slot2)
	slot0:setLeftPartnerInfo()
	slot0:setRightPartnerInfo()
end

function ArenaChampionCheckFightInfoView.setBothSidesBaseInfo(slot0, slot1)
	if slot0.data == nil or slot0.model:getBaseInfo() == nil then
		return
	end

	if slot0.role_list[1] then
		loadSpriteTexture(slot3.form_icon, PathTool.getResFrame("form", "form_icon_" .. slot0.data.a_formation_type), LOADTEXT_TYPE_PLIST)
		slot3.role_name:setString(transformNameByServ(slot0.data.a_name, slot0.data.a_srv_id))
		slot3.role_lev:setString(uv0(TI18N("%s级"), slot0.data.a_lev))
		slot3.role_head:setHeadRes(slot0.data.a_face, false, LOADTEXT_TYPE, slot0.data.a_face_file, slot0.data.a_face_update_time)
		slot3.power:setNum(slot0.data.a_power)
		slot3.elfin_tree_lv:setString(TI18N("佩罗娜等级：") .. (slot0.data.a_sprite_lev or 0))

		for slot9 = 1, 4 do
			if not slot3.elfin_list[slot9] then
				slot10 = SkillItem.new(true, true, true, 0.5, true)

				slot10:setPosition(cc.p(40 + (slot9 - 1) * 65, -45))
				slot3.container:addChild(slot10)

				slot3.elfin_list[slot9] = slot10
			end

			slot0:setElfinSkillItemData(slot10, slot0.data.a_sprites, slot9)
		end
	end

	if slot0.role_list[2] then
		loadSpriteTexture(slot4.form_icon, PathTool.getResFrame("form", "form_icon_" .. slot0.data.b_formation_type), LOADTEXT_TYPE_PLIST)
		slot4.role_name:setString(transformNameByServ(slot0.data.b_name, slot0.data.b_srv_id))
		slot4.role_lev:setString(uv0("%s级", slot0.data.b_lev))
		slot4.role_head:setHeadRes(slot0.data.b_face, false, LOADTEXT_TYPE, slot0.data.b_face_file, slot0.data.b_face_update_time)
		slot4.power:setNum(slot0.data.b_power)
		slot4.elfin_tree_lv:setString(TI18N("佩罗娜等级：") .. (slot0.data.b_sprite_lev or 0))

		for slot10 = 1, 4 do
			if not slot4.elfin_list[slot10] then
				slot11 = SkillItem.new(true, true, true, 0.5, true)

				slot11:setPosition(cc.p(180 + (slot10 - 1) * 65, 545))
				slot4.container:addChild(slot11)

				slot4.elfin_list[slot10] = slot11
			end

			slot0:setElfinSkillItemData(slot11, slot0.data.b_sprites, slot10)
		end
	end

	if slot0.data.ret == 0 then
		slot0.success_img:setVisible(false)

		if slot0.data.replay_id == 0 then
			slot0.check_btn:setVisible(false)
			slot0.vs:setVisible(true)
		else
			slot0.check_btn:loadTexture(PathTool.getResFrame("arena", "arenachampion_1029", false, "arenachampion"), LOADTEXT_TYPE_PLIST)
			slot0.check_btn:setVisible(true)
			slot0.vs:setVisible(false)
		end
	elseif slot1 == true then
		delayRun(slot0.main_panel, 1, function ()
			if not tolua.isnull(uv0.success_img) then
				uv0.check_btn:loadTexture(PathTool.getResFrame("arena", "arenachampion_1031", false, "arenachampion"), LOADTEXT_TYPE_PLIST)
				uv0.success_img:setVisible(true)
				uv0.check_btn:setVisible(true)
				uv0.vs:setVisible(false)

				if uv0.data.ret == 1 then
					uv0.success_img:setPosition(uv0.success_left_pos)
				else
					uv0.success_img:setPosition(uv0.success_right_pos)
				end
			end
		end)
	else
		slot5()
	end
end

function ArenaChampionCheckFightInfoView.getElfinBidByPos(slot0, slot1, slot2)
	if not slot1 or next(slot1) == nil then
		return
	end

	for slot6, slot7 in pairs(slot1) do
		if slot7.pos == slot2 then
			return slot7.item_bid
		end
	end
end

function ArenaChampionCheckFightInfoView.setElfinSkillItemData(slot0, slot1, slot2, slot3)
	if slot0:getElfinBidByPos(slot2, slot3) then
		slot1:showLockIcon(false)

		if slot4 == 0 or not Config.SpriteData.data_elfin_data(slot4) then
			slot1:setData()
			slot1:showLevel(false)
		elseif Config.SkillData.data_get_skill(slot5.skill) then
			slot1:showLevel(true)
			slot1:setData(slot6)
		end
	else
		slot1:setData()
		slot1:showLevel(false)
		slot1:showLockIcon(true)
	end
end

function ArenaChampionCheckFightInfoView.setLeftPartnerInfo(slot0)
	if slot0.data == nil then
		return
	end

	if not Config.FormationData.data_form_data[slot0.data.a_formation_type] or not slot1.pos then
		return
	end

	if slot0.role_list[1] == nil or slot2.partner_list == nil then
		return
	end

	for slot6, slot7 in ipairs(slot2.partner_list) do
		slot7:setData()
		slot7:setOpacity(128)
	end

	for slot7, slot8 in pairs(slot1.pos) do
		if slot8 and slot8[1] and slot8[2] then
			if slot2.partner_list[slot8[2]] then
				slot9:setOpacity(255)
				slot9:setData(function (slot0)
					for slot4, slot5 in ipairs(uv0.data.a_plist) do
						if slot5.pos == slot0 then
							return slot5
						end
					end
				end(slot8[1]))
			end
		end
	end
end

function ArenaChampionCheckFightInfoView.setRightPartnerInfo(slot0)
	if slot0.data == nil then
		return
	end

	if not Config.FormationData.data_form_data[slot0.data.b_formation_type] or not slot1.pos then
		return
	end

	if slot0.role_list[2] == nil or slot2.partner_list == nil then
		return
	end

	for slot6, slot7 in ipairs(slot2.partner_list) do
		slot7:setData()
		slot7:setOpacity(128)
	end

	for slot7, slot8 in pairs(slot1.pos) do
		if slot8 and slot8[1] and slot8[2] then
			if slot2.partner_list[slot8[2]] then
				slot9:setOpacity(255)
				slot9:setData(function (slot0)
					for slot4, slot5 in ipairs(uv0.data.b_plist) do
						if slot5.pos == slot0 then
							return slot5
						end
					end
				end(slot8[1]))
			end
		end
	end
end

function ArenaChampionCheckFightInfoView.updateInfo(slot0, slot1)
	if slot0.data == nil then
		return
	end

	if slot0.model:getBaseInfo() == nil or slot0.model:getRoleInfo() == nil then
		return
	end

	slot0.is_change_tab = slot1

	if slot0.data.ret and slot0.data.ret == 0 and (slot1 == true or slot2.flag ~= 0) and slot0.group and slot0.pos then
		if slot0.view_type == ArenaConst.champion_type.normal then
			slot0.ctrl:requestGroupPosInfo(slot0.group, slot0.pos)
		else
			slot0.ctrl:sender26212(slot0.group, slot0.pos)
		end
	end
end

function ArenaChampionCheckFightInfoView.createLeftPartnerList(slot0)
	if slot0.role_list[1] == nil then
		return
	end

	slot1.partner_list = {}
	slot3 = 10
	slot6 = 3
	slot7 = BackPackItem.Width * 0.7

	for slot11 = 1, 9 do
		slot14 = HeroExhibitionItem.new(slot2, false, true)

		slot14:setPosition(306 - slot7 * 0.5 - (slot7 + slot3) * math.floor((slot11 - 1) / slot6), 40 + slot7 * 0.5 + (slot11 - 1) % slot6 * (slot7 + slot3))
		slot14:setOpacity(128)
		slot1.container:addChild(slot14)
		uv0(slot1.partner_list, slot14)
	end
end

function ArenaChampionCheckFightInfoView.createRightPartnerList(slot0)
	if slot0.role_list[2] == nil then
		return
	end

	slot1.partner_list = {}
	slot3 = 10
	slot6 = 3
	slot7 = BackPackItem.Width * 0.7

	for slot11 = 1, 9 do
		slot14 = HeroExhibitionItem.new(slot2, false, true)

		slot14:setPosition(110 + slot7 * 0.5 + (slot7 + slot3) * math.floor((slot11 - 1) / slot6), 194 + slot7 * 0.5 + (slot11 - 1) % slot6 * (slot7 + slot3))
		slot14:setOpacity(128)
		slot1.container:addChild(slot14)
		uv0(slot1.partner_list, slot14)
	end
end

function ArenaChampionCheckFightInfoView.DeleteMe(slot0)
	doStopAllActions(slot0.main_panel)

	slot4 = false

	slot0:handleEvent(slot4)

	for slot4, slot5 in ipairs(slot0.role_list) do
		if slot5.power then
			slot5.power:DeleteMe()
		end

		if slot5.role_head then
			slot5.role_head:DeleteMe()
		end

		if slot5.partner_list then
			for slot9, slot10 in pairs(slot5.partner_list) do
				if slot10.DeleteMe then
					slot10:DeleteMe()
				end
			end
		end

		if slot5.elfin_list then
			for slot9, slot10 in pairs(slot5.elfin_list) do
				slot10:DeleteMe()

				slot10 = nil
			end
		end
	end

	slot0.role_list = nil
end
