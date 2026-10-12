AdventureEvtChallengeWindow = AdventureEvtChallengeWindow or BaseClass(BaseView)
slot0 = AdventureController:getInstance()
slot1 = AdventureController:getInstance():getUiModel()
slot2 = string.format
slot3 = table.insert
slot4 = GameNet:getInstance()

function AdventureEvtChallengeWindow.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.layout_name = "adventure/adventure_evt_challenge_window"
	slot0.res_list = {}
	slot0.hero_list = {}
	slot0.data = slot1
	slot0.is_skip_fight = false
end

function AdventureEvtChallengeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("挑战守卫"))
	slot1:getChildByName("change_title"):setString(TI18N("选择英雄"))
	slot1:getChildByName("self_title"):setString(TI18N("我方"))
	slot1:getChildByName("other_title"):setString(TI18N("守卫"))

	slot0.challenge_btn = slot1:getChildByName("challenge_btn")

	slot0.challenge_btn:getChildByName("label"):setString(TI18N("进入战斗"))

	slot0.cur_hero_item = HeroExhibitionItem.new(1, true, 0, false)

	slot0.cur_hero_item:setPosition(158, 447)
	slot0.cur_hero_item:showProgressbar(100)
	slot1:addChild(slot0.cur_hero_item)

	slot0.target_hero_item = HeroExhibitionItem.new(1, true, 0, false)

	slot0.target_hero_item:setPosition(560, 447)
	slot0.target_hero_item:showProgressbar(100)
	slot1:addChild(slot0.target_hero_item)

	slot0.other_name = slot1:getChildByName("other_name")
	slot0.power_click = slot1:getChildByName("power_click")
	slot0.fight_label = CommonNum.new(20, slot0.power_click, 99999, -2, cc.p(0.5, 0.5))

	slot0.fight_label:setPosition(103, 30)

	slot0.container = slot1
	slot0.checkbox_skip = slot1:getChildByName("checkbox_skip")
	slot2 = slot0.checkbox_skip:getChildByName("name")

	slot2:setString(TI18N("跳过并连续战斗"))
	slot2:setFontSize(22)
	slot0.checkbox_skip:setVisible(false)
	slot0.checkbox_skip:setPosition(280, 359)

	slot0.checkbox_series = slot1:getChildByName("checkbox_series")

	slot0.checkbox_series:getChildByName("name"):setString(TI18N("连续挑战"))
	slot0.checkbox_series:setVisible(false)
end

function AdventureEvtChallengeWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openEvtViewByType(false)
	end, false, 2)
	registerButtonEventListener(slot0.challenge_btn, function ()
		if uv0.data then
			slot0 = {}

			if uv0.is_skip_fight then
				slot1 = {}

				for slot5 = 2, 3 do
					table.insert(slot0, {
						val = 1,
						type = slot5
					})
				end
			end

			uv1:setAdventureFightReturnTag(false)
			uv2:send20620(uv0.data.id, AdventureEvenHandleType.handle, slot0)
		end
	end, true, 1)
	registerButtonEventListener(slot0.checkbox_skip, function ()
		uv0.is_skip_fight = uv0.checkbox_skip:isSelected()
	end, true, 1)
	slot0:addGlobalEvent(AdventureEvent.UpdateMonsterHP, function (slot0)
		if uv0.target_hero_item then
			uv0.target_hero_item:showProgressbar(slot0 or 0)
		end
	end)
end

function AdventureEvtChallengeWindow.openRootWnd(slot0, slot1)
	if slot0.data then
		uv0:send20620(slot0.data.id, AdventureEvenHandleType.requst, {})

		if slot0.target_hero_item and slot0.data and slot0.data.config then
			slot0.target_hero_item:setUnitData(slot0.data.config.unit_id)

			if Config.UnitData.data_unit(slot0.data.config.unit_id) then
				slot0.other_name:setString(slot2.name)
			end
		end
	end

	slot0:createHeroList()

	slot0.base_data = uv1:getAdventureBaseData()

	if slot0.base_data and Config.AdventureData.data_floor_reward[slot0.base_data.id] and slot2.auto_combat == 1 then
		slot0.checkbox_skip:setVisible(true)

		slot0.is_skip_fight = SysEnv:getInstance():getBool(SysEnv.keys.adventure_skip_fight, false)

		slot0.checkbox_skip:setSelected(slot0.is_skip_fight)
	end
end

function AdventureEvtChallengeWindow.createHeroList(slot0)
	slot2 = uv0:getSelectPartnerID()

	for slot6, slot7 in ipairs(uv0:getFormList()) do
		if slot0.hero_list[slot6] == nil then
			slot0.hero_list[slot6] = HeroExhibitionItem.new(0.9, true, 0, false)

			slot0.hero_list[slot6]:setPosition(110 + (slot6 - 1) * 124, 206)
			slot0.hero_list[slot6]:addCallBack(function (slot0, slot1)
				uv0:selectHeroItem(slot0, slot1)
			end)
			slot0.container:addChild(slot0.hero_list[slot6])
		end

		slot0:updateHeroInfo(slot0.hero_list[slot6], slot7)

		if slot2 ~= 0 and slot7.partner_id == slot2 then
			slot0:selectHeroItem(slot9, slot7)
		end
	end
end

function AdventureEvtChallengeWindow.selectHeroItem(slot0, slot1, slot2)
	if slot2.now_hp == 0 then
		message(TI18N("死亡英雄无法选择"))

		return
	end

	if slot0.select_cell == slot1 then
		return
	end

	if slot0.select_cell then
		slot0.select_cell:setSelected(false)

		slot0.select_cell = nil
	end

	slot0.select_cell = slot1

	slot0.select_cell:setSelected(true)
	slot0.fight_label:setNum(slot2.power)
	uv0:requestSelectPartner(slot2.partner_id)
	slot0.cur_hero_item:setData(slot2)
	slot0.cur_hero_item:showProgressbar(slot2.now_hp / slot2.hp * 100)
end

function AdventureEvtChallengeWindow.updateHeroInfo(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	slot1:setData(slot2)

	slot3 = slot2.now_hp / slot2.hp

	slot1:showProgressbar(slot3 * 100)

	if slot3 == 0 then
		slot1:showStrTips(true, TI18N("已阵亡"))
	else
		slot1:showStrTips(false)
	end
end

function AdventureEvtChallengeWindow.close_callback(slot0)
	SysEnv:getInstance():set(SysEnv.keys.adventure_skip_fight, slot0.is_skip_fight, true)

	if slot0.cur_hero_item then
		slot0.cur_hero_item:DeleteMe()
	end

	slot0.cur_hero_item = nil

	if slot0.target_hero_item then
		slot0.target_hero_item:DeleteMe()
	end

	slot0.target_hero_item = nil

	if slot0.fight_label then
		slot0.fight_label:DeleteMe()
	end

	slot0.fight_label = nil

	for slot4, slot5 in ipairs(slot0.hero_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	uv0:openEvtViewByType(false)
end
