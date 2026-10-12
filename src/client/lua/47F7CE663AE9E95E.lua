HeroResonateWindow = HeroResonateWindow or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert
slot5 = math.floor

function HeroResonateWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "hero/hero_resonate_window"
	slot1 = "v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/E24315/%s.png"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("heroresonate", "heroresonate"),
			type = ResourcesType.plist
		},
		{
			path = uv0(slot1, "action"),
			type = ResourcesType.single
		},
		{
			path = uv0(slot1, "action2"),
			type = ResourcesType.single
		},
		{
			path = uv0(slot1, "action3"),
			type = ResourcesType.single
		}
	}
	slot0.view_list = {}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.delayTime_param = 0.5
end

function HeroResonateWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setZOrder(2)

	slot0.container = slot0.main_container:getChildByName("container")
	slot0.spirit_btn = slot0.main_container:getChildByName("spirit_btn")

	slot0.spirit_btn:setVisible(false)
	slot0.spirit_btn:getChildByName("label"):setString(TI18N("影子提炼"))

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.title_bg = slot0.main_container:getChildByName("title_bg")
	slot0.title_name = slot0.title_bg:getChildByName("title_name")

	slot0.title_name:setString(TI18N("恶魔树等级"))

	slot0.lev = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(97, -21), nil, nil, 600)

	slot0.title_bg:addChild(slot0.lev)

	slot0.title_bg_x, slot0.title_bg_y = slot0.title_bg:getPosition()
	slot0.top_panel = slot0.main_container:getChildByName("top_panel")
	slot0.look_btn = slot0.top_panel:getChildByName("look_btn")
	slot0.tab_list = {}
	slot6 = "tab_container"
	slot0.tab_container = slot0.top_panel:getChildByName(slot6)

	for slot6 = 1, 3 do
		if slot0.tab_container:getChildByName("tab_btn_" .. slot6) then
			slot8 = {
				unselect_bg = slot7:getChildByName("unselect_bg")
			}

			slot8.unselect_bg:setVisible(true)

			slot8.select_bg = slot7:getChildByName("select_bg")

			slot8.select_bg:setVisible(false)

			slot8.lable = slot7:getChildByName("title")
			slot8.tab_btn = slot7
			slot8.index = ({
				HeroConst.ResonateType.eResonate,
				HeroConst.ResonateType.eStoneTablet,
				HeroConst.ResonateType.eEmpowerment
			})[slot6]

			slot8.lable:setString(({
				[HeroConst.ResonateType.eResonate] = TI18N("共鸣"),
				[HeroConst.ResonateType.eStoneTablet] = TI18N("增幅"),
				[HeroConst.ResonateType.eEmpowerment] = TI18N("赋能")
			})[slot8.index])

			slot0.tab_list[slot8.index] = slot8
		end
	end

	slot0.hero_param = 100
	slot0.item_lay_list = {}

	for slot7 = 1, 5 do
		slot8 = slot0.main_container:getChildByName("item_lay_" .. slot7)
		slot0.item_lay_list[slot7] = {
			btn = slot8,
			add_img = slot8:getChildByName("add_img")
		}

		slot0.item_lay_list[slot7].add_img:setVisible(false)

		slot0.item_lay_list[slot7].lock_img = slot8:getChildByName("lock_img")

		slot0.item_lay_list[slot7].lock_img:setVisible(false)

		slot0.item_lay_list[slot7].lock_tips = slot0.item_lay_list[slot7].lock_img:getChildByName("lock_tips")
		slot0.item_lay_list[slot7].x, slot10 = slot8:getPosition()
		slot0.item_lay_list[slot7].y = slot10
		slot0.item_lay_list[slot7].pos = ({
			{
				0,
				-700
			},
			{
				400,
				-600
			},
			[5] = {
				-600,
				-600
			},
			[3] = {
				-400,
				-600
			},
			[4] = {
				600,
				-600
			}
		})[slot7]

		slot8:setZOrder(uv0(1000 - (slot10 + slot0.hero_param)))
	end

	slot0:adaptationScreen()
end

function HeroResonateWindow.adaptationScreen(slot0)
	slot3 = display.getLeft(slot0.main_container)
	slot4 = display.getRight(slot0.main_container)

	slot0.top_panel:setPositionY(display.getTop(slot0.main_container) - (slot0.main_container:getContentSize().height - slot0.top_panel:getPositionY()))

	slot0.spirit_btn_x, slot0.spirit_btn_y = slot0.spirit_btn:getPosition()

	slot0.close_btn:setPositionY(display.getBottom(slot0.main_container) + slot0.close_btn:getPositionY())
end

function HeroResonateWindow.setBackgroundImg(slot0, slot1)
	if slot0.record_bg_res ~= PathTool.getPlistImgForDownLoad("bigbg/resonate", slot1, true) then
		slot0.record_bg_res = slot2
		slot0.item_load_bg = loadImageTextureFromCDN(slot0.background, slot2, ResourcesType.single, slot0.item_load_bg)
	end
end

function HeroResonateWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.spirit_btn, handler(slot0, slot0.onClickBtnSpirit), true, 1)

	function slot4(slot0, slot1, slot2)
		if uv0.is_move_effect then
			return
		end

		if uv0.select_index then
			if uv0.select_index == HeroConst.ResonateType.eResonate then
				if Config.ResonateData.data_const.rule_tips2 then
					TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
				end
			elseif uv0.select_index == HeroConst.ResonateType.eEmpowerment and Config.ResonateData.data_const.empowerment_rule_tips then
				TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
			end
		end
	end

	slot5 = true

	registerButtonEventListener(slot0.look_btn, slot4, slot5, 1)

	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end

	slot0:addGlobalEvent(HeroEvent.Hero_Resonate_Extract_Redpoint_Event, function (slot0)
		uv0:checkSpiritBtnRedpoint()
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Resonate_Info_Event, function (slot0)
		if slot0 then
			if slot0.list then
				uv0:updateHeroList(slot0.list)
			end

			uv0:checkStoneTabletRedpoint()
			uv0:checkOpenStatus()
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Resonate_Crystal_Info_Event, function (slot0)
		if slot0 and slot0.con_list then
			uv0:updateLevelInfo(slot0)
			uv0:updateHeroList(slot0.con_list)
		end

		uv0:checkOpenStatus()
	end)

	if slot0.role_vo ~= nil and slot0.role_lev_event == nil then
		slot0.role_lev_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if not uv0.item_lay_list then
				return
			end

			if not uv0.dic_hero_vo then
				return
			end

			if slot0 == "lev" then
				for slot5, slot6 in ipairs(uv0.item_lay_list) do
					if uv0.dic_hero_vo[slot5] == nil then
						uv0:checkPosLockUI(slot5)
					end
				end
			end
		end)
	end
end

function HeroResonateWindow.onClickBtnClose(slot0)
	if slot0.is_move_effect then
		return
	end

	uv0:openHeroResonateWindow(false)
end

function HeroResonateWindow.onClickBtnSpirit(slot0)
	if slot0.is_move_effect then
		return
	end

	uv0:openHeroResonateExtractPanel(true)
end

function HeroResonateWindow.checkSpiritBtnRedpoint(slot0)
	if uv0:isResonateExtractRedpoint() then
		addRedPointToNodeByStatus(slot0.spirit_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.spirit_btn, false, 5, 5)
	end
end

function HeroResonateWindow.checkStoneTabletRedpoint(slot0)
	if slot0.tab_list[HeroConst.ResonateType.eStoneTablet] and slot0.tab_list[HeroConst.ResonateType.eStoneTablet].tab_btn then
		if uv0.is_resonate_stone_redpoint and slot0.select_index and slot0.select_index ~= HeroConst.ResonateType.eStoneTablet then
			addRedPointToNodeByStatus(slot0.tab_list[HeroConst.ResonateType.eStoneTablet].tab_btn, true, 0, 5)
		else
			addRedPointToNodeByStatus(slot1, false, 0, 5)
		end
	end
end

function HeroResonateWindow.setItemLayVisiable(slot0, slot1)
	if slot0.item_lay_list then
		for slot5, slot6 in ipairs(slot0.item_lay_list) do
			slot6.btn:setVisible(slot1)

			if slot6.btn.spine then
				slot6.btn.spine:setVisible(slot1)
			end
		end
	end
end

function HeroResonateWindow.checkResonateCystal(slot0)
	if uv0:isResonateCystalMaxLev() then
		slot0:setItemLayVisiable(false)
	else
		slot0:setItemLayVisiable(true)
	end
end

function HeroResonateWindow.changeSelectedTab(slot0, slot1, slot2)
	if uv0.resonate_max_partner_lev == nil and slot1 ~= HeroConst.ResonateType.eResonate then
		return
	end

	if slot0.dic_lock_info and slot0.dic_lock_info[slot1] then
		message(slot0.dic_lock_info[slot1])

		return
	end

	if slot0.is_move_effect then
		return
	end

	if not slot2 and slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	slot3 = false
	slot4 = nil

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)

		slot4 = slot0.tab_object.index
		slot0.tab_object = nil
		slot3 = true
	end

	slot0.select_index = slot1
	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
	end

	if slot1 == HeroConst.ResonateType.eResonate then
		slot0.look_btn:setVisible(true)

		if slot3 then
			slot0:setPrePanel()

			if slot4 and slot4 == HeroConst.ResonateType.eEmpowerment then
				slot0:setEffectSpineAction(3)
			end
		else
			slot0:setEffectSpineAction(0)
		end

		slot0:checkResonateCystal()
	elseif slot1 == HeroConst.ResonateType.eStoneTablet then
		slot0.look_btn:setVisible(false)

		if slot3 then
			slot0:setPrePanel()
			slot0:setItemLayVisiable(true)

			if slot4 and slot4 == HeroConst.ResonateType.eEmpowerment then
				slot0:setEffectSpineAction(3)
			end
		else
			slot0:setEffectSpineAction(0)
		end
	elseif slot1 == HeroConst.ResonateType.eEmpowerment then
		slot0.look_btn:setVisible(true)

		if slot3 then
			slot0:setEffectSpineAction(1)
		else
			slot0:setEffectSpineAction(2)
		end
	end

	slot0:checkStoneTabletRedpoint()

	if not slot3 then
		slot0:setPrePanel()

		if slot1 ~= HeroConst.ResonateType.eEmpowerment and slot0.pre_panel and slot0.pre_panel.playEnterAnimatian then
			slot0.pre_panel:playEnterAnimatian()
		end
	end
end

function HeroResonateWindow.setPrePanel(slot0)
	if not slot0.select_index then
		return
	end

	if slot0.pre_panel ~= nil then
		if slot0.pre_panel.setVisibleStatus then
			slot0.pre_panel:setVisibleStatus(false)
		else
			slot0.pre_panel:setVisible(false)
		end
	end

	slot0.pre_panel = slot0:createSubPanel(slot0.select_index)

	if slot0.pre_panel ~= nil then
		if slot0.pre_panel.setVisibleStatus then
			slot0.pre_panel:setVisibleStatus(true)
		else
			slot0.pre_panel:setVisible(true)
		end
	end

	slot0.pre_panel:setData(slot0)
	slot0:updateHeroListBySelect(slot0.select_index)
end

function HeroResonateWindow.setEffectSpineAction(slot0, slot1)
	slot0.is_move_effect = true
	slot0.from_type = slot1 or 0
	slot2 = nil
	slot3 = false

	if slot0.from_type == 1 then
		slot2 = PlayerAction.action_1

		if slot0.view_list[HeroConst.ResonateType.eStoneTablet] then
			slot4:runShowAction(true)
		end

		if slot0.view_list[HeroConst.ResonateType.eResonate] then
			slot5:runShowAction(true)
		end

		slot0:runShowAction(true)
		slot0:spiritAction(false)
	elseif slot0.from_type == 2 then
		slot2 = PlayerAction.action_2
		slot0.is_move_effect = false
	elseif slot0.from_type == 3 then
		slot2 = PlayerAction.action_3

		if slot0.view_list[HeroConst.ResonateType.eStoneTablet] then
			slot4:runShowAction(false)
		end

		if slot0.view_list[HeroConst.ResonateType.eResonate] then
			slot5:runShowAction(false)
		end

		slot0:runShowAction(false)
		slot0:spiritAction(false)
		slot0:spiritAction(true, true)
	else
		slot2 = "action0"
		slot3 = true
		slot0.is_move_effect = false
	end

	if slot0.change_effect == nil then
		slot0.change_effect = createEffectSpine("E24315", cc.p(360, 640), cc.p(0.5, 0.5), slot3, slot2, function ()
			uv0:effectSpineCompleteAction()
		end)

		slot0.root_wnd:addChild(slot0.change_effect, 1)
	else
		slot0.change_effect:setAnimation(0, slot2, slot3)
	end
end

function HeroResonateWindow.effectSpineCompleteAction(slot0)
	if slot0.from_type == 1 then
		slot0:setPrePanel()
		slot0:setEffectSpineAction(2)
		slot0:spiritAction(true, false)
	elseif slot0.from_type == 3 then
		slot0:setEffectSpineAction(0)
	end

	slot0.is_move_effect = false

	slot0:checkShowHeroList()
end

function HeroResonateWindow.spiritAction(slot0, slot1, slot2)
	if not slot0.spirit_btn_x or not slot0.spirit_btn_y then
		return
	end

	slot0.spirit_btn:setTouchEnabled(false)

	if slot1 then
		if slot2 then
			slot0.spirit_btn:runAction(cc.Sequence:create(cc.DelayTime:create(1.1), cc.Spawn:create(cc.MoveTo:create(0.2, cc.p(slot0.spirit_btn_x, slot0.spirit_btn_y)), cc.FadeIn:create(0.15)), cc.CallFunc:create(function ()
				uv0.spirit_btn:setTouchEnabled(true)
			end)))
		else
			slot0.spirit_btn:runAction(cc.Sequence:create(slot6, cc.CallFunc:create(slot3)))
		end
	else
		slot0.spirit_btn:runAction(cc.Spawn:create(cc.MoveTo:create(0.6, cc.p(-100, slot0.spirit_btn_y)), cc.FadeOut:create(0.55)))
	end
end

function HeroResonateWindow.createSubPanel(slot0, slot1)
	if slot0.view_list[slot1] == nil then
		if slot1 == HeroConst.ResonateType.eResonate then
			slot2 = HeroResonateTabResonatePanel.new()
		elseif slot1 == HeroConst.ResonateType.eStoneTablet then
			slot2 = HeroResonateTabStoneTabletPanel.new(slot0)
		elseif slot1 == HeroConst.ResonateType.eEmpowerment then
			slot2 = HeroResonateTabEmpowermentPanel.new()
		end

		slot3 = slot0.container:getContentSize()

		slot2:setPosition(cc.p(slot3.width * 0.5, slot3.height * 0.5))
		slot0.container:addChild(slot2)

		slot0.view_list[slot1] = slot2
	end

	return slot2
end

function HeroResonateWindow.openRootWnd(slot0, slot1)
	slot0.select_index = slot1 or HeroConst.ResonateType.eResonate
	slot0.is_send_proto = nil

	slot0:checkOpenStatus()
	slot0:changeSelectedTab(slot0.select_index)
	slot0:checkSpiritBtnRedpoint()
end

function HeroResonateWindow.checkOpenStatus(slot0)
	if uv0.resonate_max_partner_lev == nil then
		return
	end

	if slot0.is_check_open then
		return
	end

	slot0.is_check_open = true
	slot0.dic_lock_info = {}
	slot1 = 50
	slot2 = nil

	if Config.ResonateData.data_const.amp_all_start_limit then
		slot1 = slot3.val
		slot2 = slot3.desc
	else
		slot2 = TI18N("供奉英雄总星级达到50")
	end

	if uv0.resonate_max_partner_lev < slot1 then
		slot0.dic_lock_info[HeroConst.ResonateType.eStoneTablet] = slot2
	else
		slot0.spirit_btn:setVisible(true)
	end

	slot4 = 30

	if Config.ResonateData.data_const.empowerment_condition then
		slot4 = slot5.val
		slot2 = slot5.desc
	else
		slot2 = TI18N("供奉英雄总星级达到30")
	end

	if uv0.resonate_max_partner_lev < slot4 then
		slot0.dic_lock_info[HeroConst.ResonateType.eEmpowerment] = slot2
	end

	for slot9, slot10 in pairs(slot0.dic_lock_info) do
		if slot0.tab_list[slot9] then
			setChildUnEnabled(true, slot0.tab_list[slot9].tab_btn)
		end
	end
end

function HeroResonateWindow.updateLevelInfo(slot0, slot1)
	if uv0:isResonateCystalMaxLev() then
		if slot1.is_break == 1 then
			slot0.lev:setString(uv1("<div fontcolor=#FFEECC outline=2,#422A1B>Lv.<div fontcolor=#4BFFE8 outline=2,#422A1B>%s</div>/%s</div>", slot1.lev, slot1.max_cystal_lev))
		else
			slot0.lev:setString(uv1("<div fontcolor=#FFEECC outline=2,#422A1B>Lv.%s</div>", slot1.lev))
		end
	else
		slot0.lev:setString(uv1("<div fontcolor=#FFEECC outline=2,#422A1B>Lv.%s</div>", slot1.lev))
	end
end

function HeroResonateWindow.updateHeroList(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.dic_hero_vo then
		return
	end

	if not slot0.select_index then
		return
	end

	if slot0.select_index == HeroConst.ResonateType.eResonate and uv0:isResonateCystalMaxLev() then
		return
	end

	slot0.dic_partner_id = {}
	slot0.dic_hero_vo = {}

	for slot5, slot6 in ipairs(slot1) do
		if slot6.id ~= 0 and uv0:getHeroById(slot6.id) and next(slot7) ~= nil then
			uv1(slot0.dic_hero_vo, slot7)

			slot0.dic_partner_id[slot7.partner_id] = slot7
		end
	end

	table.sort(slot0.dic_hero_vo, SortTools.tableLowerSorter({
		"lev",
		"id"
	}))

	slot0.is_must_init_hero = true

	slot0:checkShowHeroList()
end

function HeroResonateWindow.checkShowHeroList(slot0)
	if slot0.is_move_effect then
		return
	end

	if slot0.is_must_init_hero then
		slot0.is_must_init_hero = false

		for slot4, slot5 in ipairs(slot0.item_lay_list) do
			if slot0.is_init_hero then
				delayRun(slot0.main_container, slot4 * 0.04, function ()
					uv0:updateHSingleHero(uv1, uv2)
				end)
			else
				slot0:updateHSingleHero(slot4, slot5)
			end
		end

		slot0.is_init_hero = false
	end
end

function HeroResonateWindow.updateHeroListBySelect(slot0, slot1)
	if not slot0.dic_hero_vo then
		return
	end

	for slot5, slot6 in ipairs(slot0.item_lay_list) do
		if slot0.dic_hero_vo[slot5] == nil then
			if slot6.btn and slot6.btn.lev_img then
				slot6.btn.lev_img:setVisible(false)
			end

			if slot6.btn.star_node then
				slot6.btn.star_node:setVisible(false)
			end
		else
			if slot6.btn and slot6.btn.lev_img then
				if slot1 == HeroConst.ResonateType.eResonate then
					slot6.btn.lev_img:setVisible(true)
				else
					slot6.btn.lev_img:setVisible(false)
				end
			end

			if slot6.btn.star_node then
				if slot0.select_index == HeroConst.ResonateType.eResonate then
					slot6.btn.star_node:setVisible(false)
				else
					slot6.btn.star_node:setVisible(true)
				end
			end
		end
	end
end

function HeroResonateWindow.updateHSingleHero(slot0, slot1, slot2)
	if slot0.dic_hero_vo[slot1] == nil then
		slot0:checkPosLockUI(slot1)

		if slot2.btn.spine then
			slot2.btn.spine:removeFromParent()

			slot2.btn.spine = nil
		end

		slot2.btn.record_spine_bid = nil
		slot2.btn.record_spine_star = nil
		slot2.btn.record_spine_skin = nil

		if slot2.btn.lev_img then
			slot2.btn.lev_img:setVisible(false)
		end

		if slot2.btn.star_node then
			slot2.btn.star_node:setVisible(false)
		end
	else
		slot2.lock_img:setVisible(false)
		slot2.add_img:setVisible(false)

		if slot2.btn.lev_img then
			if slot0.select_index == HeroConst.ResonateType.eResonate then
				slot2.btn.lev_img:setVisible(true)
			else
				slot2.btn.lev_img:setVisible(false)
			end
		end

		if slot2.btn.star_node then
			if slot0.select_index == HeroConst.ResonateType.eResonate then
				slot2.btn.star_node:setVisible(false)
			else
				slot2.btn.star_node:setVisible(true)
			end
		end

		slot0:updateAddSpine(slot1, true, true)
		slot0:updateSpine(slot2.btn, slot0.dic_hero_vo[slot1], false, slot1)
	end
end

function HeroResonateWindow.checkPosLockUI(slot0, slot1)
	if not slot0.item_lay_list or not slot0.item_lay_list[slot1] then
		return
	end

	slot2, slot3 = slot0:checkPosLockByPos(slot1)

	if slot2 then
		slot0.item_lay_list[slot1].lock_img:setVisible(true)
		slot0.item_lay_list[slot1].lock_tips:setString(slot3)
		slot0:updateAddSpine(slot1, false)
	else
		slot0.item_lay_list[slot1].lock_img:setVisible(false)
		slot0:updateAddSpine(slot1, true)
	end
end

function HeroResonateWindow.updateAddSpine(slot0, slot1, slot2, slot3)
	if not slot0.item_lay_list or not slot0.item_lay_list[slot1] then
		return
	end

	if slot2 then
		slot4, slot5, slot6, slot7 = nil
		slot7 = 1

		if slot1 == 4 then
			slot4 = (not slot3 or PlayerAction.action_4) and PlayerAction.action_1
			slot5 = -204
			slot6 = -44
		elseif slot1 == 2 then
			slot4 = (not slot3 or PlayerAction.action_5) and PlayerAction.action_2
			slot5 = -90
			slot6 = 15
		elseif slot1 == 3 then
			slot4 = (not slot3 or PlayerAction.action_5) and PlayerAction.action_2
			slot5 = 199
			slot6 = 15
			slot7 = -1
		elseif slot1 == 5 then
			slot4 = (not slot3 or PlayerAction.action_4) and PlayerAction.action_1
			slot5 = 302
			slot6 = -44
			slot7 = -1
		else
			slot4 = (not slot3 or PlayerAction.action_6) and PlayerAction.action_3
			slot5 = 50
			slot6 = 60
		end

		if slot0.item_lay_list[slot1].add_spine == nil then
			slot0.item_lay_list[slot1].add_spine = createEffectSpine("E24317", cc.p(slot5, slot6), cc.p(0.5, 0.5), true, slot4)

			slot0.item_lay_list[slot1].btn:addChild(slot0.item_lay_list[slot1].add_spine)
			slot0.item_lay_list[slot1].add_spine:setScaleX(slot7)
		else
			slot0.item_lay_list[slot1].add_spine:setVisible(true)
			slot0.item_lay_list[slot1].add_spine:setAnimation(0, slot4, true)
		end
	elseif slot0.item_lay_list[slot1].add_spine then
		slot0.item_lay_list[slot1].add_spine:setVisible(false)
	end
end

function HeroResonateWindow.checkPosLockByPos(slot0, slot1)
	if Config.ResonateData.data_pos_info[slot1] then
		slot3 = false

		for slot8, slot9 in ipairs(slot2.pos_cond) do
			if slot9[1] == "lev" and role_vo and role_vo.lev < slot9[2] then
				slot3 = true
				slot4 = "" .. uv0(TI18N("%s级解锁"), slot9[2])
			end
		end

		return slot3, slot4
	end

	return false
end

function HeroResonateWindow.updateSpine(slot0, slot1, slot2, slot3, slot4)
	if slot1.record_spine_bid and slot1.record_spine_bid == slot2.bid and slot1.record_spine_star and slot1.record_spine_star == slot2.star and slot1.record_spine_skin and slot1.record_spine_skin == slot2.use_skin then
		if slot3 and slot1.spine then
			slot1.spine:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.FadeIn:create(0.2)))
		end

		return
	end

	slot1.record_spine_bid = slot2.bid
	slot1.record_spine_star = slot2.star
	slot1.record_spine_skin = slot2.use_skin

	if slot1.spine then
		doStopAllActions(slot1.spine)
		slot1.spine:removeFromParent()

		slot1.spine = nil

		;(function ()
			if not uv0.spine then
				uv0.spine = BaseRole.new(BaseRole.type.partner, uv1, nil, {
					scale = 0.45,
					skin_id = uv1.use_skin
				})

				uv0.spine:setAnimation(0, PlayerAction.show, true)
				uv0.spine:setCascade(true)

				slot0, slot1 = uv0:getPosition()

				uv0.spine:setPosition(cc.p(slot0, slot1 + uv2.hero_param - 50))
				uv0.spine:setScale(0.4)
				uv0.spine:setAnchorPoint(cc.p(0, 0))
				uv2.main_container:addChild(uv0.spine, uv3(1000 - slot1))
				uv0.spine:setOpacity(0)
				uv0.spine:runAction(cc.FadeIn:create(0.2))
				uv2:createLevItem(uv0, uv1.lev, uv4)
				uv2:createStar(uv0, uv1.star)
			end
		end)()
	else
		slot5()
	end
end

function HeroResonateWindow.createLevItem(slot0, slot1, slot2, slot3)
	slot5 = createImage(slot1.spine, PathTool.getResFrame("common", "common_1049"), 0, -100, cc.p(0.5, 0.5), true, 1, true)

	slot5:setContentSize(cc.size(86, 41))
	slot5:setCapInsets(cc.rect(14, 13, 14, 6))
	slot5:setScale(2)

	slot1.lev_img = slot5

	if slot3 == 1 then
		createLabel(20, cc.c4b(75, 255, 232, 255), cc.c4b(66, 42, 27, 255), 43, 20, "Lv." .. slot2, slot5, 2, cc.p(0.5, 0.5))
	else
		createLabel(20, cc.c4b(255, 238, 204, 255), cc.c4b(66, 42, 27, 255), 43, 20, slot6, slot5, 2, cc.p(0.5, 0.5))
	end

	if slot0.select_index == HeroConst.ResonateType.eResonate then
		slot5:setVisible(true)
	else
		slot5:setVisible(false)
	end
end

function HeroResonateWindow.createStar(slot0, slot1, slot2)
	slot1.star_node = cc.Node:create()

	slot1.star_node:setCascadeOpacityEnabled(true)
	slot1.star_node:setName("createStar")
	slot1.star_node:setPosition(0, 84)
	slot1.spine:addChild(slot1.star_node)

	slot1.star_setting = uv0:createStar(slot2 or 0, slot1.star_node, slot1.star_setting, 26)

	if slot0.select_index == HeroConst.ResonateType.eResonate then
		slot1.star_node:setVisible(false)
	else
		slot1.star_node:setVisible(true)
	end
end

function HeroResonateWindow.runShowAction(slot0, slot1)
	if slot1 then
		if slot0.title_bg then
			slot0.title_bg:runAction(cc.Spawn:create(cc.MoveTo:create(0.8, cc.p(slot0.title_bg_x, 2000)), cc.FadeIn:create(0.8)))
		end

		if slot0.item_lay_list then
			for slot5, slot6 in ipairs(slot0.item_lay_list) do
				slot0:runActionTo(slot6)
			end
		end
	else
		if slot0.title_bg then
			slot0.title_bg:setPositionY(2000)
			slot0.title_bg:runAction(cc.Sequence:create(cc.DelayTime:create(slot0.delayTime_param), cc.Spawn:create(cc.MoveTo:create(0.65, cc.p(slot0.title_bg_x, slot0.title_bg_y)), cc.FadeIn:create(0.65))))
		end

		if slot0.item_lay_list then
			for slot5, slot6 in ipairs(slot0.item_lay_list) do
				slot0:runActionBack(slot6)
			end
		end
	end
end

function HeroResonateWindow.runActionTo(slot0, slot1)
	slot1.btn:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(0.8, cc.p(slot1.x + slot1.pos[1], slot1.y + slot1.pos[2])), cc.FadeOut:create(0.8))))

	if slot1.btn.spine then
		slot1.btn.spine:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(0.8, cc.p(slot3, slot4 + slot0.hero_param)), cc.ScaleTo:create(0.8, 3), cc.FadeOut:create(0.8))))
	end
end

function HeroResonateWindow.runActionBack(slot0, slot1)
	slot2 = slot1.btn

	slot2:setPosition(slot1.x + slot1.pos[1], slot1.y + slot1.pos[2])
	slot2:runAction(cc.Sequence:create(cc.DelayTime:create(slot0.delayTime_param), cc.Spawn:create(cc.MoveTo:create(0.65, cc.p(slot1.x, slot1.y)), cc.FadeIn:create(0.65))))

	if slot1.btn.spine then
		slot1.btn.spine:setPosition(slot3, slot4 + slot0.hero_param)
		slot1.btn.spine:setOpacity(0)
		slot1.btn.spine:setScale(3)
		slot1.btn.spine:runAction(cc.Sequence:create(cc.DelayTime:create(slot0.delayTime_param), cc.Spawn:create(cc.MoveTo:create(0.65, cc.p(slot5, slot6 + slot0.hero_param)), cc.ScaleTo:create(0.65, 0.4), cc.FadeIn:create(0.65))))
	end
end

function HeroResonateWindow.close_callback(slot0)
	if slot0.change_effect then
		slot0.change_effect:clearTracks()
		slot0.change_effect:removeFromParent()

		slot0.change_effect = nil
	end

	if slot0.view_list then
		for slot4, slot5 in pairs(slot0.view_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.view_list = nil

	if slot0.item_lay_list then
		for slot4, slot5 in ipairs(slot0.item_lay_list) do
			if slot5.add_spine then
				slot5.add_spine:clearTracks()
				slot5.add_spine:removeFromParent()

				slot5.add_spine = nil
			end

			if slot5.btn and slot5.btn.spine then
				slot5.btn.spine:removeFromParent()

				slot5.btn.spine = nil
			end
		end
	end

	if slot0.item_load_bg then
		slot0.item_load_bg:DeleteMe()
	end

	slot0.item_load_bg = nil

	if slot0.role_vo and slot0.role_lev_event then
		slot0.role_vo:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end

	uv0:openHeroResonateWindow(false)
end
