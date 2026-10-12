slot1 = ArenaManyPeopleController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
ArenaManyPeopleFightTips = ArenaManyPeopleFightTips or BaseClass(BaseView)

function ArenaManyPeopleFightTips.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("vedio", "vedio"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "arenamanypeople/amp_fight_info_panel"
	slot0.left_panel_list = {}
	slot0.right_panel_list = {}
end

function ArenaManyPeopleFightTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("main_panel")
	slot5 = 0

	ActionHelp.itemUpAction(slot0.container, 720, slot5, 0.25)

	slot0.btn_challenge = slot0.container:getChildByName("right_btn")

	slot0.btn_challenge:getChildByName("label"):setString(TI18N("挑 战"))
	slot0.container:getChildByName("win_title"):setString(TI18N("挑 战"))
	slot0.container:getChildByName("tips_1"):setString(TI18N("我方队伍"))
	slot0.container:getChildByName("tips_2"):setString(TI18N("敌方队伍"))

	slot0.btn_form = slot0.container:getChildByName("left_btn")

	slot0.btn_form:getChildByName("label"):setString(TI18N("个人布阵"))

	slot0.ok_btn = slot0.container:getChildByName("ok_btn")

	slot0.ok_btn:getChildByName("label"):setString(TI18N("保存调整"))

	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.change_pos_btn_1 = slot0.container:getChildByName("change_pos_btn_1")
	slot0.change_pos_btn_2 = slot0.container:getChildByName("change_pos_btn_2")

	function slot1(slot0, slot1)
		slot2 = {
			fight_panel = uv0.container:getChildByName("fight_" .. slot1)
		}
		slot2.team_name = slot2.fight_panel:getChildByName(slot0 .. "team_name")
		slot2.fight_count = slot2.fight_panel:getChildByName(slot0 .. "fight_count")
		slot2.wenhao = slot2.fight_panel:getChildByName(slot0 .. "wenhao")
		slot2.equip_node = slot2.fight_panel:getChildByName(slot0 .. "equip_node")
		slot2.elfin_key = slot2.fight_panel:getChildByName(slot0 .. "elfin_key")

		slot2.elfin_key:setString(TI18N("佩罗娜"))

		slot2.elfin_lev = slot2.fight_panel:getChildByName(slot0 .. "elfin_lev")
		slot6 = slot0 .. "panel_elfin"
		slot2.panel_elfin = slot2.fight_panel:getChildByName(slot6)
		slot2.elfin_list = {}
		slot2.pos_list = {}
		slot2.hero_item_list = {}

		for slot6 = 1, 9 do
			slot8, slot9 = slot2.fight_panel:getChildByName(slot0 .. "hero_bg_" .. slot6):getPosition()
			slot2.pos_list[slot6] = cc.p(slot8, slot9)
		end

		return slot2
	end

	for slot5 = 1, 3 do
		slot0.left_panel_list[slot5] = slot1("left_", slot5)
		slot0.right_panel_list[slot5] = slot1("right_", slot5)
	end

	slot0.step_time = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(342, -20), nil, nil, 600)

	slot0.container:addChild(slot0.step_time)
end

function ArenaManyPeopleFightTips.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openArenaManyPeopleFightTips(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openArenaManyPeopleFightTips(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_form, function ()
		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.ArenaManyPeople, {}, HeroConst.FormShowType.eFormSave)
	end, true)
	registerButtonEventListener(slot0.ok_btn, function ()
		uv0:onOkBtn()
	end, true)
	registerButtonEventListener(slot0.btn_challenge, function ()
		uv0:onChallengeBtn()
	end, true)
	registerButtonEventListener(slot0.change_pos_btn_1, function ()
		uv0:changeTeamDataOrder(1)
	end, true)
	registerButtonEventListener(slot0.change_pos_btn_2, function ()
		uv0:changeTeamDataOrder(2)
	end, true)
	slot0:addGlobalEvent(ArenaManyPeopleEvent.ARENAMANYPOEPLE_MATCH_MY_EVENT, function ()
		if not uv0:getMatchInfo() then
			return
		end

		uv1.data = slot0

		uv1:updateLeftData(slot0.atk_team_members)
	end)
end

function ArenaManyPeopleFightTips.onChallengeBtn(slot0)
	if not slot0.data then
		return
	end

	slot1 = {}

	for slot5, slot6 in ipairs(slot0.data.atk_team_members) do
		uv0(slot1, {
			rid = slot6.rid,
			sid = slot6.sid,
			pos = slot6.pos
		})
	end

	uv1:sender29019(slot1)
end

function ArenaManyPeopleFightTips.onOkBtn(slot0)
	if not slot0.data then
		return
	end

	slot1 = {}

	for slot5, slot6 in ipairs(slot0.data.atk_team_members) do
		uv0(slot1, {
			rid = slot6.rid,
			sid = slot6.sid,
			pos = slot6.pos
		})
	end

	uv1:sender29022(slot1)
	message(TI18N("调整保存成功!"))
end

function ArenaManyPeopleFightTips.openRootWnd(slot0)
	slot0:setData()
end

function ArenaManyPeopleFightTips.setStepTime(slot0, slot1)
	slot2 = slot1 or 0

	if tolua.isnull(slot0.step_time) then
		return
	end

	slot0.step_time:stopAllActions()

	if slot2 > 0 then
		slot0:setStepTimeFormatString(slot2)
		slot0.step_time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.step_time:stopAllActions()
				uv1.step_time:setString("")
			else
				uv1:setStepTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setStepTimeFormatString(slot2)
	end
end

function ArenaManyPeopleFightTips.setStepTimeFormatString(slot0, slot1)
	slot0.step_time:setString(uv0(TI18N("<div fontcolor=#7af655 >%s</div>秒后自动进入战斗"), slot1))
end

function ArenaManyPeopleFightTips.setData(slot0)
	if not uv0:getMatchInfo() then
		return
	end

	slot0.data = slot1

	slot0:updateLeftData(slot1.atk_team_members)
	slot0:updateRightData(slot1.def_team_members)

	if slot0.data then
		if slot0.data.end_time - GameNet:getInstance():getTime() < 0 then
			slot2 = 0
		end

		slot0:setStepTime(slot2)
	end
end

function ArenaManyPeopleFightTips.updateLeftData(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		slot0:initItemInfo(slot0.left_panel_list[slot6.pos], slot6.name or "", slot6.power, slot6.partner_infos, slot6.formation_type, slot6.rid, slot6.sid, slot6.sprite_lev or 0, slot6.sprites or {}, slot6.hallows_id or 0, slot6.hallows_look_id or 0, false)
	end
end

function ArenaManyPeopleFightTips.updateRightData(slot0, slot1)
	slot2 = uv0:getHideIndex()

	for slot6, slot7 in ipairs(slot1) do
		slot8 = slot0.right_panel_list[slot7.pos]
		slot9 = slot7.power
		slot10 = slot7.partner_infos
		slot11 = slot7.formation_type
		slot12 = slot7.rid
		slot13 = slot7.sid
		slot14 = slot7.sprite_lev or 0
		slot15 = slot7.sprites or {}
		slot16 = slot7.hallows_id or 0
		slot17 = slot7.hallows_look_id or 0
		slot18 = slot7.name or ""
		slot19 = false

		if slot2 and slot2 == slot6 then
			slot19 = true
		end

		slot0:initItemInfo(slot8, slot18, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot19)
	end
end

function ArenaManyPeopleFightTips.initItemInfo(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12)
	slot1.team_name:setString(slot2)
	slot0:updateHeroInfo(slot1, slot4, slot5, slot6, slot7, slot12)

	if slot12 then
		slot1.fight_count:setString("?")
		slot1.elfin_lev:setVisible(false)
		slot1.elfin_key:setVisible(false)
		slot1.panel_elfin:setVisible(false)
		slot1.equip_node:setVisible(false)
	else
		slot1.elfin_lev:setVisible(true)
		slot1.elfin_key:setVisible(true)
		slot1.panel_elfin:setVisible(true)
		slot1.equip_node:setVisible(true)
		slot1.fight_count:setString(slot3)

		slot18 = TI18N("%s级")

		slot1.elfin_lev:setString(uv0(slot18, slot8))

		slot14 = 34

		for slot18 = 1, 4 do
			if not slot1.elfin_list[slot18] then
				slot19 = SkillItem.new(true, true, true, 0.27, true)

				slot19:setPosition(slot14 * ((slot18 - 1) % 2) + slot14 * 0.5, 68 - (math.floor((slot18 - 1) / 2) * slot14 + slot14 * 0.5))
				slot1.panel_elfin:addChild(slot19)

				slot1.elfin_list[slot18] = slot19
			end

			slot0:setElfinSkillItemData(slot19, slot9, slot18)
		end

		slot0:updateHallowsIcon(slot1, slot10, slot11)
	end
end

function ArenaManyPeopleFightTips.updateHallowsIcon(slot0, slot1, slot2, slot3)
	if not slot2 then
		return
	end

	if not slot1 then
		return
	end

	if slot1.hallows_item == nil then
		slot1.hallows_item = BackPackItem.new(false, false, false, 0.5)

		slot1.equip_node:addChild(slot1.hallows_item)
	end

	if slot2 == 0 then
		slot1.hallows_item:setBaseData()
		slot1.hallows_item:setMagicIcon(false)
	else
		if not Config.HallowsData.data_base[slot2] then
			return
		end

		if slot3 and slot3 ~= 0 then
			if Config.HallowsData.data_magic[slot3] then
				slot1.hallows_item:setBaseData(slot5.item_id)
				slot1.hallows_item:setMagicIcon(true)
			else
				slot1.hallows_item:setBaseData(slot4.item_id)
				slot1.hallows_item:setMagicIcon(false)
			end
		else
			slot1.hallows_item:setBaseData(slot4.item_id)
			slot1.hallows_item:setMagicIcon(false)
		end
	end
end

function ArenaManyPeopleFightTips.getElfinBidByPos(slot0, slot1, slot2)
	if not slot1 or next(slot1) == nil then
		return
	end

	for slot6, slot7 in pairs(slot1) do
		if slot7.pos == slot2 then
			return slot7.item_bid
		end
	end
end

function ArenaManyPeopleFightTips.setElfinSkillItemData(slot0, slot1, slot2, slot3)
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

function ArenaManyPeopleFightTips.updateHeroInfo(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if not slot1 then
		return
	end

	if slot6 then
		for slot10, slot11 in pairs(slot1.hero_item_list) do
			slot11:setVisible(false)
		end

		slot1.wenhao:setVisible(true)
	else
		slot1.wenhao:setVisible(false)

		if Config.FormationData.data_form_data[slot3] then
			slot8 = {}

			if slot2 then
				for slot12, slot13 in pairs(slot2) do
					slot8[slot13.pos] = slot13
				end
			end

			for slot12, slot13 in pairs(slot1.hero_item_list) do
				slot13:setVisible(false)
			end

			for slot12, slot13 in ipairs(slot7.pos) do
				slot14 = slot13[1]
				slot15 = slot13[2]
				slot16 = slot8[slot14]

				if slot1.hero_item_list[slot14] == nil then
					slot1.hero_item_list[slot14] = HeroExhibitionItem.new(0.5, false)

					slot1.fight_panel:addChild(slot1.hero_item_list[slot14])
				else
					slot1.hero_item_list[slot14]:setVisible(true)
				end

				slot1.hero_item_list[slot14]:setPosition(slot1.pos_list[slot15])

				if slot16 then
					slot1.hero_item_list[slot14]:setData(slot16)
					slot1.hero_item_list[slot14]:addCallBack(function ()
						if uv0 and uv1 then
							-- Nothing
						end
					end)
				else
					slot1.hero_item_list[slot14]:setData(nil)
				end
			end
		end
	end
end

function ArenaManyPeopleFightTips.changeTeamDataOrder(slot0, slot1)
	if not slot0.data then
		return
	end

	if slot1 == 1 then
		for slot5, slot6 in pairs(slot0.data.atk_team_members) do
			if slot6.pos == 1 then
				slot6.pos = 2
			elseif slot6.pos == 2 then
				slot6.pos = 1
			end
		end
	else
		for slot5, slot6 in pairs(slot0.data.atk_team_members) do
			if slot6.pos == 2 then
				slot6.pos = 3
			elseif slot6.pos == 3 then
				slot6.pos = 2
			end
		end
	end

	slot0:updateLeftData(slot0.data.atk_team_members)
end

function ArenaManyPeopleFightTips.close_callback(slot0)
	slot0.step_time:stopAllActions()

	for slot4, slot5 in ipairs(slot0.left_panel_list) do
		if slot5 and slot5.elfin_list and next(slot5.elfin_list) ~= nil then
			for slot9, slot10 in pairs(slot5.elfin_list) do
				slot10:DeleteMe()
			end

			slot5.elfin_list = {}
		end

		if slot5 and slot5.hero_item_list and next(slot5.hero_item_list) ~= nil then
			for slot9, slot10 in pairs(slot5.hero_item_list) do
				slot10:DeleteMe()
			end

			slot5.hero_item_list = {}
		end

		if slot5.hallows_item and slot5.hallows_item.DeleteMe then
			slot5.hallows_item:DeleteMe()

			slot5.hallows_item = nil
		end
	end

	for slot4, slot5 in ipairs(slot0.right_panel_list) do
		if slot5 and slot5.elfin_list and next(slot5.elfin_list) ~= nil then
			for slot9, slot10 in pairs(slot5.elfin_list) do
				slot10:DeleteMe()
			end

			slot5.elfin_list = {}
		end

		if slot5 and slot5.hero_item_list and next(slot5.hero_item_list) ~= nil then
			for slot9, slot10 in pairs(slot5.hero_item_list) do
				slot10:DeleteMe()
			end

			slot5.hero_item_list = {}
		end

		if slot5.hallows_item and slot5.hallows_item.DeleteMe then
			slot5.hallows_item:DeleteMe()

			slot5.hallows_item = nil
		end
	end

	uv0:openArenaManyPeopleFightTips(false)
end
