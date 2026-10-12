ArenateamFormPanel = ArenateamFormPanel or BaseClass(BaseView)
slot0 = ArenateamController:getInstance()
slot1 = ArenateamController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function ArenateamFormPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "arenateam/arenateam_form_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arenateam", "arenateam"),
			type = ResourcesType.plist
		}
	}
end

function ArenateamFormPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("组队布阵"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")

	slot0.main_container:getChildByName("tips"):setString(TI18N("队长可在该界面调整玩家出战顺序"))

	slot0.left_btn = slot0.main_container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("个人布阵"))

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("保存调整"))

	slot0.chang_12_btn = slot0.main_container:getChildByName("chang_12_btn")
	slot4 = "chang_23_btn"
	slot0.chang_23_btn = slot0.main_container:getChildByName(slot4)
	slot0.form_item_list = {}

	for slot4 = 1, 3 do
		slot5 = {
			form_item_obj = slot6,
			equip_btn = slot6:getChildByName("equip_btn"),
			elfin_btn = slot6:getChildByName("elfin_btn"),
			team_name = slot6:getChildByName("team_name"),
			power = slot6:getChildByName("power"),
			checkbox = slot6:getChildByName("checkbox")
		}

		slot5.checkbox:getChildByName("name"):setString(TI18N("隐藏队伍"))
		slot5.checkbox:setSelected(false)

		slot7 = slot5.equip_btn:getContentSize()
		slot5.hallows_item = BackPackItem.new(false, false, false, 0.8)

		slot5.hallows_item:setPosition(cc.p(slot7.width * 0.5, slot7.height * 0.5))

		slot11 = slot5.hallows_item

		slot5.equip_btn:addChild(slot11)

		slot5.elfin_item_list = {}
		slot5.pos_list = {}
		slot5.hero_item_list = {}

		for slot11 = 1, 9 do
			slot13, slot14 = slot0.main_container:getChildByName("form_item_" .. slot4):getChildByName("left_hero_bg_" .. slot11):getPosition()
			slot5.pos_list[slot11] = cc.p(slot13, slot14)
		end

		slot0.form_item_list[slot4] = slot5
	end
end

function ArenateamFormPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickBtnLeft), true, 1)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickBtnRight), true, 1)
	registerButtonEventListener(slot0.chang_12_btn, function ()
		uv0:onChangeTeam(1, 2)
	end, true, 1)

	function slot4()
		uv0:onChangeTeam(2, 3)
	end

	slot5 = true

	registerButtonEventListener(slot0.chang_23_btn, slot4, slot5, 1)

	for slot4, slot5 in ipairs(slot0.form_item_list) do
		slot5.checkbox:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.began then
				playButtonSound2()

				uv0.check_box_status = uv0.checkbox:isSelected()
			elseif slot1 == ccui.TouchEventType.ended then
				if not uv1:isLeader() then
					message(TI18N("只有队长可进行该操作"))
					uv0.checkbox:setSelected(uv0.check_box_status or false)

					return
				end

				for slot5, slot6 in ipairs(uv2.form_item_list) do
					if slot6 == uv0 then
						if uv2.form_data_list and uv2.form_data_list[slot5] then
							uv2.form_data_list[slot5].is_hide = 1
						end

						slot6.checkbox:setSelected(true)
					else
						if uv2.form_data_list and uv2.form_data_list[slot5] then
							uv2.form_data_list[slot5].is_hide = 0
						end

						slot6.checkbox:setSelected(false)
					end
				end
			elseif slot1 == ccui.TouchEventType.canceled then
				uv0.checkbox:setSelected(uv0.check_box_status or false)
			end
		end)
	end

	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_THREE_TEAM_INFO_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setScdata(slot0)
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_REFRESH_TEAM_INFO_EVENT, function ()
		uv0.is_refresh_team = true

		uv1:sender27243()
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_SAVE_FROM_EVENT, function (slot0)
		if not slot0 then
			return
		end

		message(slot0.msg)

		if uv0.from_type and uv0.from_type == 2 then
			uv0:onClickBtnClose()
			uv1:sender27221()
		end
	end)
end

function ArenateamFormPanel.onChangeTeam(slot0, slot1, slot2)
	if not uv0:isLeader() then
		message(TI18N("只有队长可进行该操作"))

		return
	end

	if not slot0.form_data_list then
		return
	end

	slot3 = slot0.form_item_list[slot1]
	slot4 = slot0.form_item_list[slot2]
	slot0.form_data_list[slot1] = slot0.form_data_list[slot2]
	slot0.form_data_list[slot2] = slot0.form_data_list[slot1]

	if slot0.form_data_list[slot1] then
		slot0.form_data_list[slot1].pos = slot1
	end

	if slot0.form_data_list[slot2] then
		slot0.form_data_list[slot2].pos = slot2
	end

	slot0:updateFormItem(slot3, slot1)
	slot0:updateFormItem(slot4, slot2)
end

function ArenateamFormPanel.onClickBtnLeft(slot0)
	if not slot0.form_data_list then
		return
	end

	HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.ArenaTeam, {}, HeroConst.FormShowType.eFormSave)
end

function ArenateamFormPanel.onClickBtnRight(slot0)
	if not slot0.form_data_list then
		return
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0.form_data_list) do
		uv0(slot1, {
			rid = slot6.rid,
			sid = slot6.sid,
			pos = slot6.pos,
			is_hide = slot6.is_hide
		})
	end

	uv1:sender27242(slot1)
end

function ArenateamFormPanel.onClickBtnClose(slot0)
	uv0:openArenateamFormPanel(false)
end

function ArenateamFormPanel.openRootWnd(slot0, slot1)
	slot0.from_type = (slot1 or {}).from_type or 1

	uv0:sender27243()
end

function ArenateamFormPanel.setScdata(slot0, slot1)
	if slot0.is_refresh_team and slot0.form_data_list then
		slot0.is_refresh_team = nil
		slot2 = RoleController:getInstance():getRoleVo()
		slot3 = nil

		for slot7, slot8 in ipairs(slot1.arena_team_member) do
			if slot2 and slot2.rid == slot8.rid and slot2.srv_id == slot8.sid then
				slot3 = slot8
			end
		end

		for slot7, slot8 in pairs(slot0.form_data_list) do
			if slot3 and slot2 and slot2.rid == slot8.rid and slot2.srv_id == slot8.sid then
				slot3.is_hide = slot8.is_hide
				slot0.form_data_list[slot7] = slot3

				if slot0.form_item_list[slot7] then
					slot0:updateFormItem(slot0.form_item_list[slot7], slot7)
				end

				break
			end
		end
	else
		slot0.form_data_list = {}

		for slot5, slot6 in ipairs(slot1.arena_team_member) do
			slot0.form_data_list[slot6.pos] = slot6
		end

		for slot5, slot6 in ipairs(slot0.form_item_list) do
			delayRun(slot0.main_container, slot5 * 2 / display.DEFAULT_FPS, function ()
				uv0:updateFormItem(uv1, uv2)
			end)
		end
	end
end

function ArenateamFormPanel.updateFormItem(slot0, slot1, slot2)
	if not slot0.form_data_list then
		return
	end

	if slot0.form_data_list[slot2] then
		slot1.team_name:setString(slot3.name)
		slot1.power:setString(slot3.power)

		slot8 = slot3.team_partner
		slot9 = slot3.formation_type

		slot0:updateFormItemInfo(slot1, slot8, slot9, slot3.rid, slot3.sid)

		slot4 = 0

		for slot8, slot9 in ipairs(slot3.ext) do
			if slot9.extra_key == 5 then
				slot4 = slot9.extra_val or 0
			end
		end

		slot0:updateHallowsIcon(slot1, slot3.hallows_id, slot4)
		slot0:updateElfinList(slot1, slot3.sprites)

		if slot3.is_hide == 1 then
			slot1.checkbox:setSelected(true)
		else
			slot1.checkbox:setSelected(false)
		end
	else
		slot1.team_name:setString(TI18N("无队员"))
		slot1.power:setString(0)
		slot0:updateFormItemInfo(slot1, {}, 1)
		slot0:updateHallowsIcon(slot1, 0, 0)
		slot0:updateElfinList(slot1, {})
		slot1.checkbox:setSelected(false)
	end
end

function ArenateamFormPanel.updateFormItemInfo(slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot1 then
		return
	end

	if Config.FormationData.data_form_data[slot3] then
		slot7 = {
			[slot12.pos] = slot12
		}

		for slot11, slot12 in pairs(slot2) do
			-- Nothing
		end

		for slot11, slot12 in pairs(slot1.hero_item_list) do
			slot12:setVisible(false)
		end

		for slot11, slot12 in ipairs(slot6.pos) do
			slot13 = slot12[1]
			slot14 = slot12[2]
			slot15 = slot7[slot13]

			if slot1.hero_item_list[slot13] == nil then
				slot1.hero_item_list[slot13] = HeroExhibitionItem.new(0.5, false)

				slot1.form_item_obj:addChild(slot1.hero_item_list[slot13])
			else
				slot1.hero_item_list[slot13]:setVisible(true)
			end

			slot1.hero_item_list[slot13]:setPosition(slot1.pos_list[slot14])

			if slot15 then
				slot15.use_skin = slot15.skin_id

				slot1.hero_item_list[slot13]:setData(slot15)
				slot1.hero_item_list[slot13]:addCallBack(function ()
				end)
			else
				slot1.hero_item_list[slot13]:setData(nil)
			end
		end
	end
end

function ArenateamFormPanel.updateHallowsIcon(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	if (slot2 or 0) == 0 then
		slot1.hallows_item:setBaseData()
		slot1.hallows_item:setMagicIcon(false)
	else
		if not Config.HallowsData.data_base[slot4] then
			return
		end

		if slot3 and slot3 ~= 0 then
			if Config.HallowsData.data_magic[slot3] then
				slot1.hallows_item:setBaseData(slot6.item_id)
				slot1.hallows_item:setMagicIcon(true)
			else
				slot1.hallows_item:setBaseData(slot5.item_id)
				slot1.hallows_item:setMagicIcon(false)
			end
		else
			slot1.hallows_item:setBaseData(slot5.item_id)
			slot1.hallows_item:setMagicIcon(false)
		end
	end
end

function ArenateamFormPanel.updateElfinList(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if not slot1.elfin_btn then
		return
	end

	for slot7 = 1, 4 do
		slot8 = function (slot0)
			slot1 = nil

			for slot5, slot6 in pairs(uv0) do
				if slot6.pos == slot0 then
					slot1 = slot6.item_bid

					break
				end
			end

			return slot1
		end(slot7)

		if slot1.elfin_item_list[slot7] == nil then
			slot9 = SkillItem.new(true, false, true, 0.4)
			slot10 = 24.3
			slot11 = 72.5

			if slot7 == 3 or slot7 == 4 then
				slot11 = 24.3
			end

			if slot7 == 2 or slot7 == 4 then
				slot10 = 72.5
			end

			slot9:setPosition(cc.p(slot10, slot11))
			slot1.elfin_btn:addChild(slot9)

			slot1.elfin_item_list[slot7] = slot9
		end

		if slot8 then
			slot9:showLockIcon(false)

			if slot8 == 0 or not Config.SpriteData.data_elfin_data(slot8) then
				slot9:setData()
			elseif Config.SkillData.data_get_skill(slot10.skill) then
				slot9:setData(slot11)
			end
		else
			slot9:setData()
			slot9:showLockIcon(true)
		end
	end
end

function ArenateamFormPanel.close_callback(slot0)
	uv0:openArenateamFormPanel(false)
end
